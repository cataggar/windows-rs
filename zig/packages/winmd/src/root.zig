//! ECMA-335 metadata reader for .winmd files.
//!
//! This is a minimal Zig port of the PE/CLI parser in
//! crates/libs/metadata/src/reader/file.rs. It parses enough of the
//! format to enumerate TypeDef rows and resolve their namespace/name
//! strings. Other tables are laid out in memory (row count, columns,
//! offsets) so they can be added incrementally.

const std = @import("std");

pub const Error = error{
    BadDosHeader,
    BadNtSignature,
    BadOptionalHeader,
    MissingClrSection,
    BadClrHeader,
    BadMetadataSignature,
    UnknownStream,
    OutOfBounds,
};

/// Zero-based index into `File.tables` for each ECMA-335 table we expose.
pub const Table = enum(u8) {
    type_ref = 0,
    type_def = 1,
    field = 2,
    method_def = 3,
    method_param = 4,
    interface_impl = 5,
    member_ref = 6,
    constant = 7,
    attribute = 8,
    class_layout = 9,
    module_ref = 10,
    type_spec = 11,
    impl_map = 12,
    assembly = 13,
    nested_class = 14,
    generic_param = 15,
};

pub const table_count = @typeInfo(Table).@"enum".fields.len;

/// Width (in bytes) of a single column within a table row.
const Column = struct {
    offset: u16 = 0,
    width: u8 = 0,
};

const TableInfo = struct {
    offset: u32 = 0,
    len: u32 = 0,
    width: u16 = 0,
    columns: [6]Column = @splat(.{}),

    fn indexWidth(self: TableInfo) u8 {
        return if (self.len < (1 << 16)) 2 else 4;
    }

    fn setColumns(self: *TableInfo, a: u8, b: u8, c: u8, d: u8, e: u8, f: u8) void {
        const widths = [_]u8{ a, b, c, d, e, f };
        var off: u16 = 0;
        for (widths, 0..) |w, i| {
            self.columns[i] = .{ .offset = off, .width = w };
            off += w;
        }
        self.width = off;
    }

    fn setData(self: *TableInfo, view: *u32) void {
        if (self.len != 0) {
            self.offset = view.*;
            view.* += self.len * self.width;
        }
    }
};

pub const File = struct {
    bytes: []const u8,
    strings: u32,
    blobs: u32,
    guids: u32,
    tables: [table_count]TableInfo,

    /// Return a zero-terminated UTF-8 string from the #Strings heap.
    pub fn strAt(self: *const File, offset: u32) []const u8 {
        const start = self.strings + offset;
        const slice = self.bytes[start..];
        const nul = std.mem.indexOfScalar(u8, slice, 0) orelse slice.len;
        return slice[0..nul];
    }

    /// Read `column` of `row` in `table` as a usize. Returns 0 for empty tables.
    pub fn cell(self: *const File, table: Table, row: u32, column: u3) u32 {
        const t = &self.tables[@intFromEnum(table)];
        const col = t.columns[column];
        const offset = t.offset + row * @as(u32, t.width) + col.offset;
        return switch (col.width) {
            2 => std.mem.readInt(u16, self.bytes[offset..][0..2], .little),
            4 => std.mem.readInt(u32, self.bytes[offset..][0..4], .little),
            else => 0,
        };
    }

    /// Read `column` of `row` in `table` as a string from the #Strings heap.
    pub fn str(self: *const File, table: Table, row: u32, column: u3) []const u8 {
        return self.strAt(self.cell(table, row, column));
    }

    pub fn rowCount(self: *const File, table: Table) u32 {
        return self.tables[@intFromEnum(table)].len;
    }

    /// Read `column` of `row` in `table` as a variable-length blob from the
    /// #Blob heap. Returns a zero-copy slice into `bytes`. The leading
    /// compressed length prefix is stripped.
    pub fn blob(self: *const File, table: Table, row: u32, column: u3) []const u8 {
        const offset = self.blobs + self.cell(table, row, column);
        if (offset >= self.bytes.len) return &.{};
        const initial: u8 = self.bytes[offset];
        var size: usize = 0;
        var prefix_len: usize = 0;
        // ECMA-335 §II.24.2.4 compressed unsigned integer encoding.
        if ((initial & 0x80) == 0) {
            size = initial & 0x7f;
            prefix_len = 1;
        } else if ((initial & 0xC0) == 0x80) {
            size = (@as(usize, initial & 0x3f) << 8) | self.bytes[offset + 1];
            prefix_len = 2;
        } else {
            size = (@as(usize, initial & 0x1f) << 24) |
                (@as(usize, self.bytes[offset + 1]) << 16) |
                (@as(usize, self.bytes[offset + 2]) << 8) |
                self.bytes[offset + 3];
            prefix_len = 4;
        }
        const start = offset + prefix_len;
        const end = start + size;
        if (end > self.bytes.len) return &.{};
        return self.bytes[start..end];
    }

    /// Read `column` of `row` in `table` as a 16-byte GUID from the #GUID
    /// heap. Indices are 1-based; 0 means "no GUID" and returns all zeros.
    pub fn guid(self: *const File, table: Table, row: u32, column: u3) [16]u8 {
        const index = self.cell(table, row, column);
        if (index == 0) return [_]u8{0} ** 16;
        const offset = self.guids + (index - 1) * 16;
        var out: [16]u8 = undefined;
        @memcpy(&out, self.bytes[offset..][0..16]);
        return out;
    }

    /// Read a list-column range: the half-open row range in `other_table`
    /// owned by `row` of `table`, column `column`. The column stores a
    /// 1-based index into `other_table`; the range ends where the next
    /// row's column starts (or at the end of `other_table` for the last row).
    pub fn list(self: *const File, table: Table, row: u32, column: u3, other_table: Table) Range {
        const first = self.cell(table, row, column) -% 1;
        const t = &self.tables[@intFromEnum(table)];
        const last = if (row + 1 < t.len)
            self.cell(table, row + 1, column) - 1
        else
            self.tables[@intFromEnum(other_table)].len;
        return .{ .start = first, .end = last };
    }

    /// Half-open range of rows in `table` whose `column` equals `value`.
    /// Requires the table to be sorted by `column` (true for Attribute,
    /// Constant, FieldMarshal, etc. per ECMA-335 §22). Note: NestedClass
    /// is sorted only by column 0 (NestedClass), NOT column 1
    /// (EnclosingClass) — use a linear scan to find children of an outer.
    pub fn equalRange(self: *const File, table: Table, column: u3, value: u32) Range {
        var first: u32 = 0;
        const total: u32 = self.tables[@intFromEnum(table)].len;
        var count: u32 = total;
        while (count != 0) {
            const half = count / 2;
            const middle = first + half;
            const mid_val = self.cell(table, middle, column);
            if (mid_val < value) {
                first = middle + 1;
                count -= half + 1;
            } else if (mid_val > value) {
                count = half;
            } else {
                const lo = lowerBound(self, table, first, middle, column, value);
                const hi = upperBound(self, table, middle + 1, first + count, column, value);
                return .{ .start = lo, .end = hi };
            }
        }
        return .{ .start = first, .end = first };
    }

    /// For a sorted `table`, return the last row whose `column` value is
    /// <= `child_row + 1`. Used to recover the parent row of a child (e.g.
    /// the TypeDef that owns a Field by searching TypeDef.FieldList).
    pub fn parent(self: *const File, table: Table, column: u3, child_row: u32) u32 {
        const len = self.tables[@intFromEnum(table)].len;
        return upperBound(self, table, 0, len, column, child_row + 1) - 1;
    }

    /// Assembly table column 4 is the assembly name string.
    pub fn assemblyName(self: *const File) ?[]const u8 {
        if (self.rowCount(.assembly) == 0) return null;
        return self.str(.assembly, 0, 4);
    }

    /// Locate the `impl_map` row whose `MemberForwarded` coded index
    /// points at `method_row` (zero-based MethodDef index). Returns
    /// `null` when the method has no PInvoke mapping — the common
    /// case for WinRT methods and for Win32 COM vtable slots.
    ///
    /// `MemberForwarded` is `{Field, MethodDef}`: the stored value is
    /// `(row_1based << 1) | tag` with tag 1 selecting MethodDef. The
    /// `impl_map` table is sorted by `MemberForwarded`
    /// (ECMA-335 §22.22), so the lookup is O(log n).
    pub fn findImplMap(self: *const File, method_row: u32) ?u32 {
        const encoded: u32 = ((method_row + 1) << 1) | 1;
        const range = self.equalRange(.impl_map, 1, encoded);
        if (range.len() == 0) return null;
        return range.start;
    }

    /// DLL name declared by the `module_ref` row the `impl_map` at
    /// `impl_map_row` points at. Returns `""` when the row is missing
    /// or its scope is zero.
    pub fn implMapDll(self: *const File, impl_map_row: u32) []const u8 {
        const mr_1based = self.cell(.impl_map, impl_map_row, 3);
        if (mr_1based == 0 or mr_1based > self.rowCount(.module_ref)) return "";
        return self.str(.module_ref, mr_1based - 1, 0);
    }

    /// Unmangled import name (column 2). Empty for ordinal-only imports;
    /// the ordinal (if any) lives in the `MappingFlags` word.
    pub fn implMapImportName(self: *const File, impl_map_row: u32) []const u8 {
        return self.str(.impl_map, impl_map_row, 2);
    }
};

fn lowerBound(f: *const File, table: Table, first_in: u32, last: u32, column: u3, value: u32) u32 {
    var first = first_in;
    var count: u32 = last - first;
    while (count > 0) {
        const half = count / 2;
        const middle = first + half;
        if (f.cell(table, middle, column) < value) {
            first = middle + 1;
            count -= half + 1;
        } else {
            count = half;
        }
    }
    return first;
}

fn upperBound(f: *const File, table: Table, first_in: u32, last: u32, column: u3, value: u32) u32 {
    var first = first_in;
    var count: u32 = last - first;
    while (count > 0) {
        const half = count / 2;
        const middle = first + half;
        if (value < f.cell(table, middle, column)) {
            count = half;
        } else {
            first = middle + 1;
            count -= half + 1;
        }
    }
    return first;
}

/// Half-open range `[start, end)` of rows in a child table.
pub const Range = struct {
    start: u32,
    end: u32,

    pub fn len(self: Range) u32 {
        return self.end - self.start;
    }
};

// ---- TypeIndex ------------------------------------------------------------

/// `namespace` → `name` → TypeDef row indices. Built once, cheap to query.
pub const TypeIndex = struct {
    file: *const File,
    /// Key is `"namespace\x00name"`; value is a slice of TypeDef row indices.
    types: std.StringHashMapUnmanaged([]u32) = .empty,
    /// Namespaces with at least one exported type.
    namespaces: std.StringHashMapUnmanaged(void) = .empty,
    arena: std.heap.ArenaAllocator,

    pub fn init(gpa: std.mem.Allocator, file: *const File) !TypeIndex {
        var self: TypeIndex = .{
            .file = file,
            .arena = std.heap.ArenaAllocator.init(gpa),
        };
        errdefer self.arena.deinit();
        const arena_alloc = self.arena.allocator();

        // First pass: count rows per (namespace, name) so we can allocate exact slices.
        var counts: std.StringHashMapUnmanaged(u32) = .empty;
        defer counts.deinit(gpa);

        const rows = file.rowCount(.type_def);
        var row: u32 = 0;
        while (row < rows) : (row += 1) {
            const ns = file.str(.type_def, row, 2);
            if (ns.len == 0) continue; // <Module> and nested types
            const name = trimTick(file.str(.type_def, row, 1));
            const key = try joinKey(arena_alloc, ns, name);
            const gop = try counts.getOrPut(gpa, key);
            if (!gop.found_existing) gop.value_ptr.* = 0;
            gop.value_ptr.* += 1;
        }

        // Second pass: allocate slices, fill them, and populate `namespaces`.
        var it = counts.iterator();
        while (it.next()) |entry| {
            const buf = try arena_alloc.alloc(u32, entry.value_ptr.*);
            try self.types.put(arena_alloc, entry.key_ptr.*, buf);
        }

        // Reset counters and do the real fill.
        var fill_counts: std.StringHashMapUnmanaged(u32) = .empty;
        defer fill_counts.deinit(gpa);

        row = 0;
        while (row < rows) : (row += 1) {
            const ns = file.str(.type_def, row, 2);
            if (ns.len == 0) continue;
            const name = trimTick(file.str(.type_def, row, 1));

            // Remember the namespace (one copy in the arena).
            if (self.namespaces.get(ns) == null) {
                const ns_copy = try arena_alloc.dupe(u8, ns);
                try self.namespaces.put(arena_alloc, ns_copy, {});
            }

            const key = try joinKey(arena_alloc, ns, name);
            const bucket = self.types.get(key).?;
            const gop = try fill_counts.getOrPut(gpa, key);
            if (!gop.found_existing) gop.value_ptr.* = 0;
            bucket[gop.value_ptr.*] = row;
            gop.value_ptr.* += 1;
        }

        return self;
    }

    pub fn deinit(self: *TypeIndex) void {
        self.arena.deinit();
    }

    /// TypeDef rows matching `namespace.name` (may contain multiple entries
    /// for generic arities, e.g. `IList` and `IList\`1`).
    pub fn get(self: *const TypeIndex, namespace: []const u8, name: []const u8) []const u32 {
        var buf: [512]u8 = undefined;
        const key = std.fmt.bufPrint(&buf, "{s}\x00{s}", .{ namespace, name }) catch return &.{};
        return self.types.get(key) orelse &.{};
    }

    pub fn contains(self: *const TypeIndex, namespace: []const u8, name: []const u8) bool {
        return self.get(namespace, name).len > 0;
    }

    pub fn containsNamespace(self: *const TypeIndex, namespace: []const u8) bool {
        return self.namespaces.contains(namespace);
    }
};

/// Strip the `\`<arity>` suffix that WinRT uses to distinguish generic
/// arities (e.g. `IVector\`1` → `IVector`).
fn trimTick(name: []const u8) []const u8 {
    if (std.mem.indexOfScalar(u8, name, '`')) |i| return name[0..i];
    return name;
}

fn joinKey(alloc: std.mem.Allocator, namespace: []const u8, name: []const u8) ![]u8 {
    const buf = try alloc.alloc(u8, namespace.len + 1 + name.len);
    @memcpy(buf[0..namespace.len], namespace);
    buf[namespace.len] = 0;
    @memcpy(buf[namespace.len + 1 ..], name);
    return buf;
}

// ---- Signatures (ECMA-335 §II.23.2) --------------------------------------

/// A namespace-qualified type reference extracted from a signature blob.
/// Slices borrow from the parent `File.bytes` and must not outlive it.
pub const TypeName = struct {
    namespace: []const u8,
    name: []const u8,
    /// Generic instantiation arguments for GENERICINST (ECMA-335
    /// §II.23.2.14). Empty for non-generic types.
    generics: []const Ty = &.{},
};

/// Decoded signature element tree. Recursive variants allocate their
/// children in the arena passed to `readFieldSignature` / `readTypeSignature`;
/// the whole tree is freed when the arena resets.
pub const Ty = union(enum) {
    void,
    bool,
    char,
    i8,
    u8,
    i16,
    u16,
    i32,
    u32,
    i64,
    u64,
    f32,
    f64,
    isize,
    usize,
    string,
    object,
    /// ELEMENT_TYPE_VALUETYPE + TypeDefOrRef → a struct/enum.
    value_name: TypeName,
    /// ELEMENT_TYPE_CLASS + TypeDefOrRef → a COM/WinRT interface or class.
    class_name: TypeName,
    /// ELEMENT_TYPE_VAR — reference to a type generic parameter by
    /// 0-based index within the containing TypeDef's GenericParam rows.
    var_generic: u32,
    /// ELEMENT_TYPE_MVAR — reference to a method generic parameter by
    /// 0-based index within the containing MethodDef's GenericParam rows.
    mvar_generic: u32,
    /// `depth` consecutive ELEMENT_TYPE_PTR wrappers around `inner`.
    ptr_mut: struct { inner: *const Ty, depth: u32 },
    ptr_const: struct { inner: *const Ty, depth: u32 },
    /// ELEMENT_TYPE_BYREF (non-const).
    ref_mut: *const Ty,
    /// IsConst modopt without pointer indirection.
    ref_const: *const Ty,
    /// ELEMENT_TYPE_SZARRAY — single-dimension zero-based array.
    array: *const Ty,
    /// ELEMENT_TYPE_ARRAY with rank 1 and an explicit fixed size.
    array_fixed: struct { inner: *const Ty, size: u32 },
};

/// CIL ELEMENT_TYPE codes we care about (ECMA-335 §II.23.1.16).
const ELEMENT_TYPE_VOID: u8 = 0x01;
const ELEMENT_TYPE_BOOLEAN: u8 = 0x02;
const ELEMENT_TYPE_CHAR: u8 = 0x03;
const ELEMENT_TYPE_I1: u8 = 0x04;
const ELEMENT_TYPE_U1: u8 = 0x05;
const ELEMENT_TYPE_I2: u8 = 0x06;
const ELEMENT_TYPE_U2: u8 = 0x07;
const ELEMENT_TYPE_I4: u8 = 0x08;
const ELEMENT_TYPE_U4: u8 = 0x09;
const ELEMENT_TYPE_I8: u8 = 0x0A;
const ELEMENT_TYPE_U8: u8 = 0x0B;
const ELEMENT_TYPE_R4: u8 = 0x0C;
const ELEMENT_TYPE_R8: u8 = 0x0D;
const ELEMENT_TYPE_STRING: u8 = 0x0E;
const ELEMENT_TYPE_PTR: u8 = 0x0F;
const ELEMENT_TYPE_BYREF: u8 = 0x10;
const ELEMENT_TYPE_VALUETYPE: u8 = 0x11;
const ELEMENT_TYPE_CLASS: u8 = 0x12;
const ELEMENT_TYPE_VAR: u8 = 0x13;
const ELEMENT_TYPE_ARRAY: u8 = 0x14;
const ELEMENT_TYPE_GENERICINST: u8 = 0x15;
const ELEMENT_TYPE_I: u8 = 0x18;
const ELEMENT_TYPE_U: u8 = 0x19;
const ELEMENT_TYPE_OBJECT: u8 = 0x1C;
const ELEMENT_TYPE_SZARRAY: u8 = 0x1D;
const ELEMENT_TYPE_MVAR: u8 = 0x1E;
const ELEMENT_TYPE_CMOD_REQD: u8 = 0x1F;
const ELEMENT_TYPE_CMOD_OPT: u8 = 0x20;

/// Calling-convention byte that prefixes a field signature.
const FIELD_SIG_PROLOG: u8 = 0x06;

pub const SigError = error{
    ShortBlob,
    BadFieldProlog,
    TrailingBytes,
    InvalidCodedToken,
    UnsupportedElement,
    OutOfMemory,
};

/// Cursor over a signature blob. Keeps no ownership — `bytes` borrows
/// from the owning `File`.
const SigCursor = struct {
    bytes: []const u8,
    pos: usize = 0,

    fn remaining(self: SigCursor) []const u8 {
        return self.bytes[self.pos..];
    }

    fn eof(self: SigCursor) bool {
        return self.pos >= self.bytes.len;
    }

    fn readU8(self: *SigCursor) !u8 {
        if (self.pos >= self.bytes.len) return error.ShortBlob;
        const v = self.bytes[self.pos];
        self.pos += 1;
        return v;
    }

    /// Peek a §II.24.2.4 compressed unsigned integer without consuming it.
    fn peekCompressed(self: SigCursor) !struct { value: u32, size: u8 } {
        if (self.pos >= self.bytes.len) return error.ShortBlob;
        const b0 = self.bytes[self.pos];
        if ((b0 & 0x80) == 0) {
            return .{ .value = b0 & 0x7F, .size = 1 };
        } else if ((b0 & 0xC0) == 0x80) {
            if (self.pos + 1 >= self.bytes.len) return error.ShortBlob;
            const b1 = self.bytes[self.pos + 1];
            return .{ .value = (@as(u32, b0 & 0x3F) << 8) | b1, .size = 2 };
        } else {
            if (self.pos + 3 >= self.bytes.len) return error.ShortBlob;
            const b1 = self.bytes[self.pos + 1];
            const b2 = self.bytes[self.pos + 2];
            const b3 = self.bytes[self.pos + 3];
            return .{
                .value = (@as(u32, b0 & 0x1F) << 24) |
                    (@as(u32, b1) << 16) |
                    (@as(u32, b2) << 8) |
                    b3,
                .size = 4,
            };
        }
    }

    fn readCompressed(self: *SigCursor) !u32 {
        const p = try self.peekCompressed();
        self.pos += p.size;
        return p.value;
    }

    /// If the next compressed int equals `expected`, consume it and return true.
    fn tryRead(self: *SigCursor, expected: u32) bool {
        const p = self.peekCompressed() catch return false;
        if (p.value != expected) return false;
        self.pos += p.size;
        return true;
    }

    /// Skip any leading CMOD_OPT/CMOD_REQD modifiers. Returns whether an
    /// `IsConst` modopt was encountered (`System.Runtime.CompilerServices.IsConst`).
    fn readModifiers(self: *SigCursor, file: *const File) !bool {
        var is_const = false;
        while (true) {
            const p = self.peekCompressed() catch return is_const;
            if (p.value != ELEMENT_TYPE_CMOD_OPT and p.value != ELEMENT_TYPE_CMOD_REQD) return is_const;
            self.pos += p.size;
            const tok = try self.readCompressed();
            const name = resolveTypeDefOrRefName(file, tok) catch continue;
            if (std.mem.eql(u8, name.namespace, "System.Runtime.CompilerServices") and
                std.mem.eql(u8, name.name, "IsConst"))
            {
                is_const = true;
            }
        }
    }
};

/// Decode a `TypeDefOrRef` coded token as it appears inside a signature blob
/// or a TypeDef `Extends` column. The token is a compressed unsigned integer
/// with layout `(row << 2) | tag`, where row is 1-based (§II.23.2.8, II.24.2.6).
pub fn resolveTypeDefOrRefName(file: *const File, token: u32) !TypeName {
    const tag: u2 = @intCast(token & 0b11);
    const row_1based: u32 = token >> 2;
    if (row_1based == 0) return error.InvalidCodedToken;
    const row = row_1based - 1;
    switch (tag) {
        0 => { // TypeDef
            if (row >= file.rowCount(.type_def)) return error.InvalidCodedToken;
            return .{
                .namespace = file.str(.type_def, row, 2),
                .name = file.str(.type_def, row, 1),
            };
        },
        1 => { // TypeRef
            if (row >= file.rowCount(.type_ref)) return error.InvalidCodedToken;
            return .{
                .namespace = file.str(.type_ref, row, 2),
                .name = file.str(.type_ref, row, 1),
            };
        },
        2 => return error.UnsupportedElement, // TypeSpec — not yet supported
        else => return error.InvalidCodedToken,
    }
}

fn boxTy(arena: std.mem.Allocator, value: Ty) !*const Ty {
    const p = try arena.create(Ty);
    p.* = value;
    return p;
}

/// Decode a field signature blob (ECMA-335 §II.23.2.4).
///
///     FieldSig := FIELD (0x06) CustomMod* Type
///
/// Returns `error.BadFieldProlog` if the leading byte is wrong, or
/// `error.TrailingBytes` if the blob contains data past the decoded type.
pub fn readFieldSignature(arena: std.mem.Allocator, file: *const File, blob: []const u8) SigError!Ty {
    var c: SigCursor = .{ .bytes = blob };
    const prolog = try c.readU8();
    if (prolog != FIELD_SIG_PROLOG) return error.BadFieldProlog;
    const ty = try readTypeSignature(arena, file, &c);
    if (!c.eof()) return error.TrailingBytes;
    return ty;
}

/// MethodDef / MemberRef calling-convention flags (ECMA-335 §II.23.2.3).
/// The low nibble is the calling convention; the high nibble carries
/// HASTHIS / EXPLICITTHIS / GENERIC / VARARG bits.
pub const MethodCallAttributes = packed struct(u8) {
    raw: u8,

    pub fn hasThis(self: MethodCallAttributes) bool {
        return (self.raw & 0x20) != 0;
    }
    pub fn explicitThis(self: MethodCallAttributes) bool {
        return (self.raw & 0x40) != 0;
    }
    pub fn isGeneric(self: MethodCallAttributes) bool {
        return (self.raw & 0x10) != 0;
    }
    pub fn isVarArg(self: MethodCallAttributes) bool {
        return (self.raw & 0x05) == 0x05;
    }
};

/// Decoded method signature. `return_type` and every entry of `params` are
/// arena-allocated; the `params` slice is also arena-allocated. The whole
/// tree is freed when the arena resets.
pub const MethodSignature = struct {
    flags: MethodCallAttributes,
    /// Count of method-level generic parameters (M-VARs). Zero for
    /// non-generic methods.
    generic_param_count: u32 = 0,
    return_type: Ty,
    params: []Ty,
};

/// Decode a method signature blob (ECMA-335 §II.23.2.1).
///
///     MethodDefSig := [HASTHIS [EXPLICITTHIS]] (DEFAULT|VARARG|GENERIC)
///                     [GENPARAMCOUNT] ParamCount RetType Param*
///
/// When the GENERIC bit is set, a `GenParamCount` compressed integer
/// precedes `ParamCount`; it's preserved on the returned struct so
/// callers can bind MVARs to the right generic slot.
pub fn readMethodSignature(arena: std.mem.Allocator, file: *const File, blob: []const u8) SigError!MethodSignature {
    var c: SigCursor = .{ .bytes = blob };
    const flags: MethodCallAttributes = .{ .raw = try c.readU8() };
    const gen_count: u32 = if (flags.isGeneric()) try c.readCompressed() else 0;

    const param_count = try c.readCompressed();
    const return_type = try readTypeSignature(arena, file, &c);

    const params = try arena.alloc(Ty, param_count);
    var i: u32 = 0;
    while (i < param_count) : (i += 1) {
        params[i] = try readTypeSignature(arena, file, &c);
    }

    if (!c.eof()) return error.TrailingBytes;
    return .{ .flags = flags, .generic_param_count = gen_count, .return_type = return_type, .params = params };
}

/// Decode one `Type` element. Mirrors `Blob::read_type_signature` in the Rust
/// reader but without the `generics` context — ELEMENT_TYPE_VAR and
/// ELEMENT_TYPE_GENERICINST are deferred to a later phase.
pub fn readTypeSignature(arena: std.mem.Allocator, file: *const File, c: *SigCursor) SigError!Ty {
    const is_const = try c.readModifiers(file);
    const is_ref = c.tryRead(ELEMENT_TYPE_BYREF);

    if (c.tryRead(ELEMENT_TYPE_VOID)) return .void;

    const is_array = c.tryRead(ELEMENT_TYPE_SZARRAY);

    var pointers: u32 = 0;
    while (c.tryRead(ELEMENT_TYPE_PTR)) : (pointers += 1) {}

    const inner = try readTypeCode(arena, file, c);

    if (pointers > 0) {
        const child = try boxTy(arena, inner);
        const ptr: Ty = if (is_const)
            .{ .ptr_const = .{ .inner = child, .depth = pointers } }
        else
            .{ .ptr_mut = .{ .inner = child, .depth = pointers } };
        if (is_array) return .{ .array = try boxTy(arena, ptr) };
        if (is_ref) return .{ .ref_mut = try boxTy(arena, ptr) };
        return ptr;
    }
    if (is_array) {
        const arr: Ty = .{ .array = try boxTy(arena, inner) };
        if (is_ref) return .{ .ref_mut = try boxTy(arena, arr) };
        return arr;
    }
    if (is_const) return .{ .ref_const = try boxTy(arena, inner) };
    if (is_ref) return .{ .ref_mut = try boxTy(arena, inner) };
    return inner;
}

/// Decode the single-byte type code that identifies the kind of `Type`
/// (§II.23.1.16 + §II.23.2.12). This is the recursive heart of the
/// signature decoder.
pub fn readTypeCode(arena: std.mem.Allocator, file: *const File, c: *SigCursor) SigError!Ty {
    const code = try c.readU8();
    return switch (code) {
        ELEMENT_TYPE_VOID => .void,
        ELEMENT_TYPE_BOOLEAN => .bool,
        ELEMENT_TYPE_CHAR => .char,
        ELEMENT_TYPE_I1 => .i8,
        ELEMENT_TYPE_U1 => .u8,
        ELEMENT_TYPE_I2 => .i16,
        ELEMENT_TYPE_U2 => .u16,
        ELEMENT_TYPE_I4 => .i32,
        ELEMENT_TYPE_U4 => .u32,
        ELEMENT_TYPE_I8 => .i64,
        ELEMENT_TYPE_U8 => .u64,
        ELEMENT_TYPE_R4 => .f32,
        ELEMENT_TYPE_R8 => .f64,
        ELEMENT_TYPE_I => .isize,
        ELEMENT_TYPE_U => .usize,
        ELEMENT_TYPE_STRING => .string,
        ELEMENT_TYPE_OBJECT => .object,
        ELEMENT_TYPE_VALUETYPE => .{ .value_name = try resolveTypeDefOrRefName(file, try c.readCompressed()) },
        ELEMENT_TYPE_CLASS => .{ .class_name = try resolveTypeDefOrRefName(file, try c.readCompressed()) },
        ELEMENT_TYPE_ARRAY => blk: {
            // II.23.2.13 ArrayShape: Type Rank NumSizes Size* NumLoBounds LoBound*.
            // Only rank-1, single-size arrays are supported in this port.
            const inner = try readTypeSignature(arena, file, c);
            const rank = try c.readCompressed();
            if (rank != 1) return error.UnsupportedElement;
            const num_sizes = try c.readCompressed();
            if (num_sizes != 1) return error.UnsupportedElement;
            const size = try c.readCompressed();
            const num_lo = try c.readCompressed();
            if (num_lo > 1) return error.UnsupportedElement;
            var i: u32 = 0;
            while (i < num_lo) : (i += 1) {
                _ = try c.readCompressed();
            }
            break :blk .{ .array_fixed = .{ .inner = try boxTy(arena, inner), .size = size } };
        },
        ELEMENT_TYPE_VAR => .{ .var_generic = try c.readCompressed() },
        ELEMENT_TYPE_MVAR => .{ .mvar_generic = try c.readCompressed() },
        ELEMENT_TYPE_GENERICINST => blk: {
            const inner_code = try c.readU8();
            if (inner_code != ELEMENT_TYPE_VALUETYPE and inner_code != ELEMENT_TYPE_CLASS) {
                return error.UnsupportedElement;
            }
            const def_name = try resolveTypeDefOrRefName(file, try c.readCompressed());
            const arg_count = try c.readCompressed();
            const args = try arena.alloc(Ty, arg_count);
            var i: u32 = 0;
            while (i < arg_count) : (i += 1) {
                args[i] = try readTypeSignature(arena, file, c);
            }
            const name: TypeName = .{
                .namespace = def_name.namespace,
                .name = def_name.name,
                .generics = args,
            };
            break :blk if (inner_code == ELEMENT_TYPE_VALUETYPE)
                .{ .value_name = name }
            else
                .{ .class_name = name };
        },
        else => error.UnsupportedElement,
    };
}

// ---- Attributes (ECMA-335 §II.22.10 CustomAttribute) ---------------------

/// Tag values for the HasCustomAttribute coded-index (§II.24.2.6).
/// A HasCustomAttribute token is `((row + 1) << 5) | tag` where row is
/// 0-based. Only the subset the generator cares about is exposed here;
/// other tags are valid in the file format but not needed by the tooling.
pub const HasAttributeTag = enum(u5) {
    method_def = 0,
    field = 1,
    type_ref = 2,
    type_def = 3,
    method_param = 4,
    interface_impl = 5,
    member_ref = 6,
    type_spec = 13,
    generic_param = 19,
};

/// Encode `(table, row)` into a HasCustomAttribute coded token that can be
/// passed to `File.equalRange(.attribute, 0, ...)`.
pub fn encodeHasAttribute(tag: HasAttributeTag, row: u32) u32 {
    return ((row + 1) << 5) | @intFromEnum(tag);
}

/// Half-open range of rows in the Attribute table whose Parent column
/// equals `(tag, row)`. The table is sorted by Parent per §II.22.10 so
/// the lookup is a binary search.
pub fn attributes(file: *const File, tag: HasAttributeTag, row: u32) Range {
    return file.equalRange(.attribute, 0, encodeHasAttribute(tag, row));
}

/// Resolve the `(namespace, name)` of the attribute class referenced by
/// row `attr_row` of the Attribute table. Returns null if the constructor
/// token uses a tag or parent kind this reader does not yet handle.
///
/// The Attribute.Type column is a CustomAttributeType coded index
/// (§II.24.2.6, 3 bits): tag 2 = MethodDef, tag 3 = MemberRef. Attribute
/// classes are reached through the ctor's containing type.
pub fn attributeName(file: *const File, attr_row: u32) ?TypeName {
    const coded = file.cell(.attribute, attr_row, 1);
    if (coded == 0) return null;
    const tag = coded & 0x07;
    const row_1based = coded >> 3;
    if (row_1based == 0) return null;
    const row = row_1based - 1;

    switch (tag) {
        // MethodDef: the ctor is a method inside the attribute class. The
        // containing TypeDef is recovered via TypeDef.MethodList (column 5).
        2 => {
            const type_row = file.parent(.type_def, 5, row);
            return .{
                .namespace = file.str(.type_def, type_row, 2),
                .name = file.str(.type_def, type_row, 1),
            };
        },
        // MemberRef: the ctor references an external class. MemberRef.Class
        // (column 0) is a MemberRefParent coded index (3 bits): tag 0 =
        // TypeDef, tag 1 = TypeRef. Only TypeRef is common for attributes
        // defined outside the current winmd (e.g. mscorlib / Windows.Foundation).
        3 => {
            const parent_coded = file.cell(.member_ref, row, 0);
            const parent_tag = parent_coded & 0x07;
            const parent_row_1based = parent_coded >> 3;
            if (parent_row_1based == 0) return null;
            const parent_row = parent_row_1based - 1;
            return switch (parent_tag) {
                0 => .{
                    .namespace = file.str(.type_def, parent_row, 2),
                    .name = file.str(.type_def, parent_row, 1),
                },
                1 => .{
                    .namespace = file.str(.type_ref, parent_row, 2),
                    .name = file.str(.type_ref, parent_row, 1),
                },
                else => null,
            };
        },
        else => return null,
    }
}

/// Find the first attribute row attached to `(tag, row)` whose class
/// simple name equals `name`. Namespace is ignored to match the Rust
/// reader's `find_attribute`.
pub fn findAttribute(file: *const File, tag: HasAttributeTag, row: u32, name: []const u8) ?u32 {
    const range = attributes(file, tag, row);
    var i = range.start;
    while (i < range.end) : (i += 1) {
        if (attributeName(file, i)) |tn| {
            if (std.mem.eql(u8, tn.name, name)) return i;
        }
    }
    return null;
}

/// Convenience: does any attribute on `(tag, row)` have simple name `name`?
pub fn hasAttribute(file: *const File, tag: HasAttributeTag, row: u32, name: []const u8) bool {
    return findAttribute(file, tag, row, name) != null;
}

/// Return a sorted, de-duplicated list of every distinct namespace
/// present in the `TypeDef` table. The `<Module>` pseudo-type
/// (TypeDef row 0) carries an empty namespace and is skipped.
///
/// The returned slice and its string elements are allocated from
/// `arena` and borrow nothing from caller beyond the arena itself.
/// Strings are copied out so they outlive any temporary views of
/// `file.str(...)`.
pub fn listNamespaces(arena: std.mem.Allocator, file: *const File) ![][]const u8 {
    var seen = std.StringHashMap(void).init(arena);
    defer seen.deinit();

    const rows = file.rowCount(.type_def);
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        const ns = file.str(.type_def, row, 2);
        if (ns.len == 0) continue;
        if (seen.contains(ns)) continue;
        const copy = try arena.dupe(u8, ns);
        try seen.put(copy, {});
    }

    var list = try arena.alloc([]const u8, seen.count());
    var it = seen.keyIterator();
    var i: usize = 0;
    while (it.next()) |k| : (i += 1) list[i] = k.*;
    std.mem.sort([]const u8, list, {}, struct {
        fn lt(_: void, a: []const u8, b: []const u8) bool {
            return std.mem.order(u8, a, b) == .lt;
        }
    }.lt);
    return list;
}

test "listNamespaces returns sorted distinct namespaces" {
    const bytes = @embedFile("Windows.winmd");
    var file = try parse(bytes);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    const all = try listNamespaces(arena.allocator(), &file);
    // Sanity: there's at least one namespace and the list is sorted.
    try std.testing.expect(all.len > 0);
    var i: usize = 1;
    while (i < all.len) : (i += 1) {
        try std.testing.expect(std.mem.order(u8, all[i - 1], all[i]) == .lt);
    }

    // Windows.Foundation is a canonical WinRT namespace and must be
    // present in every shipped metadata bundle.
    var found = false;
    for (all) |n| {
        if (std.mem.eql(u8, n, "Windows.Foundation")) {
            found = true;
            break;
        }
    }
    try std.testing.expect(found);
}

// ---- Attribute value blobs (§II.23.3) ------------------------------------

/// A single positional or named attribute argument, decoded from the
/// Attribute.Value blob.
///
/// String and TypeName values borrow bytes from the blob heap of the
/// source `File` and are only valid while those bytes live.
pub const AttrValue = union(enum) {
    bool_val: bool,
    i8_val: i8,
    u8_val: u8,
    i16_val: i16,
    u16_val: u16,
    i32_val: i32,
    u32_val: u32,
    i64_val: i64,
    u64_val: u64,
    f32_val: f32,
    f64_val: f64,
    /// SerString (either `System.String` or a serialised enum/type name
    /// when the wrapping type was `System.Type`). Null SerStrings decode
    /// to an empty slice.
    string: []const u8,
    /// A `typeof(X)` literal split into namespace + simple name.
    type_name: TypeName,
    /// An enum constant; the underlying value is assumed `i32` — WinRT
    /// enums on the types this reader processes are always 4-byte.
    enum_value: struct { type: TypeName, value: i32 },
};

pub const AttrArg = struct {
    /// Empty string for positional arguments; the field / property name
    /// for named arguments (ECMA-335 §II.23.3, FIELD = 0x53 or PROPERTY
    /// = 0x54).
    name: []const u8,
    value: AttrValue,
};

pub const AttrError = SigError || error{
    BadPrologue,
    BadSerString,
    UnsupportedAttributeType,
};

const ATTR_ELEMENT_TYPE_STRING: u8 = 0x0E;
const ATTR_ELEMENT_TYPE_TYPE: u8 = 0x50;
const ATTR_ELEMENT_TYPE_BOXED: u8 = 0x51;
const ATTR_ELEMENT_TYPE_FIELD: u8 = 0x53;
const ATTR_ELEMENT_TYPE_PROPERTY: u8 = 0x54;
const ATTR_ELEMENT_TYPE_ENUM: u8 = 0x55;

/// Cursor over an attribute value blob. Distinct from `SigCursor`
/// because primitives here are fixed-width little-endian reads (not
/// compressed integers) and SerStrings have a nullable-length prefix.
const AttrCursor = struct {
    bytes: []const u8,
    pos: usize = 0,

    fn need(self: *AttrCursor, n: usize) AttrError![]const u8 {
        if (self.pos + n > self.bytes.len) return error.ShortBlob;
        const out = self.bytes[self.pos .. self.pos + n];
        self.pos += n;
        return out;
    }

    fn readU8(self: *AttrCursor) AttrError!u8 {
        const s = try self.need(1);
        return s[0];
    }

    fn readU16(self: *AttrCursor) AttrError!u16 {
        const s = try self.need(2);
        return std.mem.readInt(u16, s[0..2], .little);
    }

    fn readU32(self: *AttrCursor) AttrError!u32 {
        const s = try self.need(4);
        return std.mem.readInt(u32, s[0..4], .little);
    }

    fn readU64(self: *AttrCursor) AttrError!u64 {
        const s = try self.need(8);
        return std.mem.readInt(u64, s[0..8], .little);
    }

    /// Read an ECMA-335 compressed unsigned int (§II.23.2).
    fn readCompressed(self: *AttrCursor) AttrError!u32 {
        const b0 = try self.readU8();
        if ((b0 & 0x80) == 0) return b0;
        if ((b0 & 0xC0) == 0x80) {
            const b1 = try self.readU8();
            return (@as(u32, b0 & 0x3F) << 8) | b1;
        }
        if ((b0 & 0xE0) == 0xC0) {
            const b1 = try self.readU8();
            const b2 = try self.readU8();
            const b3 = try self.readU8();
            return (@as(u32, b0 & 0x1F) << 24) | (@as(u32, b1) << 16) | (@as(u32, b2) << 8) | b3;
        }
        return error.BadSerString;
    }

    /// Read a `SerString`: single `0xFF` marker means null (decoded as
    /// empty slice); otherwise a compressed length followed by UTF-8 bytes.
    fn readSerString(self: *AttrCursor) AttrError![]const u8 {
        if (self.pos >= self.bytes.len) return error.ShortBlob;
        if (self.bytes[self.pos] == 0xFF) {
            self.pos += 1;
            return "";
        }
        const len = try self.readCompressed();
        return self.need(len);
    }
};

/// Read one value of type `ty` from an attribute-value cursor.
/// Not all signature types are expressible in attribute values; anything
/// beyond primitives, strings, `System.Type` and enums returns
/// `error.UnsupportedAttributeType`.
fn readAttrValue(cur: *AttrCursor, ty: Ty) AttrError!AttrValue {
    return switch (ty) {
        .bool => .{ .bool_val = (try cur.readU8()) != 0 },
        .i8 => .{ .i8_val = @bitCast(try cur.readU8()) },
        .u8 => .{ .u8_val = try cur.readU8() },
        .i16 => .{ .i16_val = @bitCast(try cur.readU16()) },
        .u16 => .{ .u16_val = try cur.readU16() },
        .i32 => .{ .i32_val = @bitCast(try cur.readU32()) },
        .u32 => .{ .u32_val = try cur.readU32() },
        .i64 => .{ .i64_val = @bitCast(try cur.readU64()) },
        .u64 => .{ .u64_val = try cur.readU64() },
        .f32 => .{ .f32_val = @bitCast(try cur.readU32()) },
        .f64 => .{ .f64_val = @bitCast(try cur.readU64()) },
        .string => .{ .string = try cur.readSerString() },
        .class_name => |tn| blk: {
            // System.Type is serialised as a SerString "Namespace.Name";
            // any other class-ref is serialised as its underlying i32
            // (WinRT convention — such references are always to enums).
            if (std.mem.eql(u8, tn.namespace, "System") and std.mem.eql(u8, tn.name, "Type")) {
                const s = try cur.readSerString();
                if (std.mem.lastIndexOfScalar(u8, s, '.')) |dot| {
                    break :blk .{ .type_name = .{ .namespace = s[0..dot], .name = s[dot + 1 ..] } };
                }
                break :blk .{ .type_name = .{ .namespace = "", .name = s } };
            }
            break :blk .{ .enum_value = .{ .type = tn, .value = @bitCast(try cur.readU32()) } };
        },
        .value_name => |tn| .{ .enum_value = .{ .type = tn, .value = @bitCast(try cur.readU32()) } },
        else => error.UnsupportedAttributeType,
    };
}

/// Resolve the signature blob of an attribute's constructor.
/// Returns null if the ctor token is not a MethodDef or MemberRef.
fn attributeCtorSignature(file: *const File, attr_row: u32) ?[]const u8 {
    const coded = file.cell(.attribute, attr_row, 1);
    const tag = coded & 0x07;
    const row_1based = coded >> 3;
    if (row_1based == 0) return null;
    const row = row_1based - 1;
    return switch (tag) {
        2 => file.blob(.method_def, row, 4), // MethodDef.Signature
        3 => file.blob(.member_ref, row, 2), // MemberRef.Signature
        else => null,
    };
}

/// Decode the positional and named arguments of an attribute.
///
/// Positional arguments are returned in ctor-declaration order with
/// `name == ""`; named arguments follow, with the field/property name
/// populated. All allocations live in `arena` — the return slice plus
/// any signature types read to decode the positional section.
pub fn readAttributeArgs(
    arena: std.mem.Allocator,
    file: *const File,
    attr_row: u32,
) AttrError![]AttrArg {
    const sig_blob = attributeCtorSignature(file, attr_row) orelse return error.UnsupportedElement;
    const sig = try readMethodSignature(arena, file, sig_blob);

    const value_blob = file.blob(.attribute, attr_row, 2);
    var cur: AttrCursor = .{ .bytes = value_blob };

    const prolog = try cur.readU16();
    if (prolog != 0x0001) return error.BadPrologue;

    // Allocate for positional + named (named count unknown yet — grow
    // by reading all positional first then appending named).
    var out = try std.ArrayList(AttrArg).initCapacity(arena, sig.params.len);
    for (sig.params) |ty| {
        try out.append(arena, .{ .name = "", .value = try readAttrValue(&cur, ty) });
    }

    // A ctor with no positional args may still have no bytes left; the
    // named-arg count is optional in that degenerate case.
    if (cur.pos == cur.bytes.len) return out.toOwnedSlice(arena);
    const named_count = try cur.readU16();

    try out.ensureTotalCapacity(arena, out.items.len + named_count);
    var i: u32 = 0;
    while (i < named_count) : (i += 1) {
        const kind = try cur.readU8();
        if (kind != ATTR_ELEMENT_TYPE_FIELD and kind != ATTR_ELEMENT_TYPE_PROPERTY)
            return error.UnsupportedAttributeType;
        const ty = try readAttrNamedType(arena, file, &cur);
        const name = try cur.readSerString();
        try out.append(arena, .{ .name = name, .value = try readAttrValue(&cur, ty) });
    }

    return out.toOwnedSlice(arena);
}

/// Inline type descriptor for a named attribute argument (§II.23.3).
///
/// Values use the same ELEMENT_TYPE codes as signatures for primitives
/// but have dedicated tags for `System.Type` (0x50) and enums (0x55).
fn readAttrNamedType(arena: std.mem.Allocator, file: *const File, cur: *AttrCursor) AttrError!Ty {
    const code = try cur.readU8();
    return switch (code) {
        ELEMENT_TYPE_BOOLEAN => .bool,
        ELEMENT_TYPE_CHAR => .char,
        ELEMENT_TYPE_I1 => .i8,
        ELEMENT_TYPE_U1 => .u8,
        ELEMENT_TYPE_I2 => .i16,
        ELEMENT_TYPE_U2 => .u16,
        ELEMENT_TYPE_I4 => .i32,
        ELEMENT_TYPE_U4 => .u32,
        ELEMENT_TYPE_I8 => .i64,
        ELEMENT_TYPE_U8 => .u64,
        ELEMENT_TYPE_R4 => .f32,
        ELEMENT_TYPE_R8 => .f64,
        ATTR_ELEMENT_TYPE_STRING => .string,
        ATTR_ELEMENT_TYPE_TYPE => .{ .class_name = .{ .namespace = "System", .name = "Type" } },
        ATTR_ELEMENT_TYPE_ENUM => blk: {
            // The enum's fully-qualified name is serialised inline.
            const s = try cur.readSerString();
            _ = arena; // no arena allocation needed — slice borrows blob.
            const tn: TypeName = if (std.mem.lastIndexOfScalar(u8, s, '.')) |dot|
                .{ .namespace = s[0..dot], .name = s[dot + 1 ..] }
            else
                .{ .namespace = "", .name = s };
            _ = file;
            break :blk .{ .value_name = tn };
        },
        else => error.UnsupportedAttributeType,
    };
}

// ---- PE / COR20 constants -------------------------------------------------

const IMAGE_DOS_SIGNATURE: u16 = 0x5A4D; // "MZ"
const IMAGE_NT_SIGNATURE: u32 = 0x00004550; // "PE\0\0"
const IMAGE_NT_OPTIONAL_HDR32_MAGIC: u16 = 0x10B;
const IMAGE_NT_OPTIONAL_HDR64_MAGIC: u16 = 0x20B;
const IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR: usize = 14;
const METADATA_SIGNATURE: u32 = 0x424A_5342; // "BSJB"

// ---- Parser ---------------------------------------------------------------

/// Parse an in-memory .winmd file. The returned `File` borrows from `bytes`.
pub fn parse(bytes: []const u8) Error!File {
    var f: File = .{
        .bytes = bytes,
        .strings = 0,
        .blobs = 0,
        .guids = 0,
        .tables = @splat(.{}),
    };

    // DOS header
    if (bytes.len < 0x40) return Error.OutOfBounds;
    const dos_sig = std.mem.readInt(u16, bytes[0..2], .little);
    if (dos_sig != IMAGE_DOS_SIGNATURE) return Error.BadDosHeader;
    const e_lfanew = std.mem.readInt(u32, bytes[0x3C..][0..4], .little);

    // NT signature
    if (e_lfanew + 4 > bytes.len) return Error.OutOfBounds;
    const nt_sig = std.mem.readInt(u32, bytes[e_lfanew..][0..4], .little);
    if (nt_sig != IMAGE_NT_SIGNATURE) return Error.BadNtSignature;

    // IMAGE_FILE_HEADER (20 bytes) starts right after the NT signature
    const file_hdr = e_lfanew + 4;
    if (file_hdr + 20 > bytes.len) return Error.OutOfBounds;
    const num_sections = std.mem.readInt(u16, bytes[file_hdr + 2 ..][0..2], .little);

    // Optional header follows. Its size and shape depend on the magic word.
    const opt = file_hdr + 20;
    if (opt + 2 > bytes.len) return Error.OutOfBounds;
    const magic = std.mem.readInt(u16, bytes[opt..][0..2], .little);

    // Offsets of IMAGE_DATA_DIRECTORY[14] and size of optional header.
    const com_rva, const sections_offset = switch (magic) {
        IMAGE_NT_OPTIONAL_HDR32_MAGIC => blk: {
            // DataDirectory begins at offset 96 in PE32 optional header
            const dd = opt + 96 + IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR * 8;
            if (dd + 8 > bytes.len) return Error.OutOfBounds;
            break :blk .{
                std.mem.readInt(u32, bytes[dd..][0..4], .little),
                opt + 224, // sizeof(IMAGE_OPTIONAL_HEADER32) = 224
            };
        },
        IMAGE_NT_OPTIONAL_HDR64_MAGIC => blk: {
            // DataDirectory begins at offset 112 in PE32+ optional header
            const dd = opt + 112 + IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR * 16;
            if (dd + 8 > bytes.len) return Error.OutOfBounds;
            break :blk .{
                std.mem.readInt(u32, bytes[dd..][0..4], .little),
                opt + 240, // sizeof(IMAGE_OPTIONAL_HEADER64) = 240
            };
        },
        else => return Error.BadOptionalHeader,
    };

    // IMAGE_SECTION_HEADER is 40 bytes.
    const section_size: usize = 40;
    if (sections_offset + num_sections * section_size > bytes.len) return Error.OutOfBounds;

    const com_file_offset = fileOffsetFromRva(bytes, sections_offset, num_sections, com_rva) orelse
        return Error.MissingClrSection;

    // IMAGE_COR20_HEADER
    if (com_file_offset + 72 > bytes.len) return Error.OutOfBounds;
    const cb = std.mem.readInt(u32, bytes[com_file_offset..][0..4], .little);
    if (cb != 72) return Error.BadClrHeader;
    const meta_rva = std.mem.readInt(u32, bytes[com_file_offset + 8 ..][0..4], .little);

    const meta_offset = fileOffsetFromRva(bytes, sections_offset, num_sections, meta_rva) orelse
        return Error.MissingClrSection;

    if (meta_offset + 20 > bytes.len) return Error.OutOfBounds;
    const meta_sig = std.mem.readInt(u32, bytes[meta_offset..][0..4], .little);
    if (meta_sig != METADATA_SIGNATURE) return Error.BadMetadataSignature;
    const version_len = std.mem.readInt(u32, bytes[meta_offset + 12 ..][0..4], .little);

    // The variable-length version string is padded to a 4-byte boundary and is
    // followed by 4 bytes (flags + stream count).
    const after_version = meta_offset + 16 + version_len;
    if (after_version + 4 > bytes.len) return Error.OutOfBounds;
    const num_streams = std.mem.readInt(u16, bytes[after_version + 2 ..][0..2], .little);

    // Stream headers
    var view: usize = after_version + 4;
    var tables_data_offset: u32 = 0;
    var i: usize = 0;
    while (i < num_streams) : (i += 1) {
        if (view + 8 > bytes.len) return Error.OutOfBounds;
        const stream_off = std.mem.readInt(u32, bytes[view..][0..4], .little);
        const name_start = view + 8;
        const name_end = std.mem.indexOfScalarPos(u8, bytes, name_start, 0) orelse
            return Error.OutOfBounds;
        const name = bytes[name_start..name_end];

        if (std.mem.eql(u8, name, "#Strings")) {
            f.strings = @intCast(meta_offset + stream_off);
        } else if (std.mem.eql(u8, name, "#Blob")) {
            f.blobs = @intCast(meta_offset + stream_off);
        } else if (std.mem.eql(u8, name, "#GUID")) {
            f.guids = @intCast(meta_offset + stream_off);
        } else if (std.mem.eql(u8, name, "#~")) {
            tables_data_offset = @intCast(meta_offset + stream_off);
        } else if (std.mem.eql(u8, name, "#US")) {
            // User strings heap, not needed.
        } else {
            return Error.UnknownStream;
        }

        // Align the record length up to the next multiple of 4.
        var pad: usize = 4 - (name.len % 4);
        if (pad == 0) pad = 4;
        view = name_start + name.len + pad;
    }

    try layoutTables(&f, tables_data_offset);
    return f;
}

fn fileOffsetFromRva(bytes: []const u8, sections: usize, count: u16, rva: u32) ?u32 {
    var i: usize = 0;
    while (i < count) : (i += 1) {
        const s = sections + i * 40;
        const virt_size = std.mem.readInt(u32, bytes[s + 8 ..][0..4], .little);
        const virt_addr = std.mem.readInt(u32, bytes[s + 12 ..][0..4], .little);
        const raw_ptr = std.mem.readInt(u32, bytes[s + 20 ..][0..4], .little);
        if (rva >= virt_addr and rva < virt_addr + virt_size) {
            return raw_ptr + (rva - virt_addr);
        }
    }
    return null;
}

/// Read the `#~` stream header, compute every table's row count and column
/// widths, and record where each table's row data starts in `f.bytes`.
fn layoutTables(f: *File, td: u32) !void {
    if (td + 24 > f.bytes.len) return Error.OutOfBounds;
    const heap_sizes = f.bytes[td + 6];
    const str_w: u8 = if ((heap_sizes & 1) != 0) 4 else 2;
    const guid_w: u8 = if ((heap_sizes & 2) != 0) 4 else 2;
    const blob_w: u8 = if ((heap_sizes & 4) != 0) 4 else 2;
    const valid_bits = std.mem.readInt(u64, f.bytes[td + 8 ..][0..8], .little);

    // Row counts for every ECMA-335 table (0x00..=0x2C). We only expose a
    // subset in `Table`; the rest are locals used for coded-index math.
    var rows: [64]u32 = @splat(0);
    var view: u32 = td + 24;
    var bit: u6 = 0;
    while (true) : (bit +%= 1) {
        if ((valid_bits >> bit) & 1 != 0) {
            if (view + 4 > f.bytes.len) return Error.OutOfBounds;
            rows[bit] = std.mem.readInt(u32, f.bytes[view..][0..4], .little);
            view += 4;
        }
        if (bit == 63) break;
    }

    // Populate the exposed tables' row counts.
    inline for (@typeInfo(TableId).@"enum".fields) |fld| {
        const id: TableId = @enumFromInt(fld.value);
        if (tableSlot(id)) |slot| {
            f.tables[@intFromEnum(slot)].len = rows[@intFromEnum(id)];
        }
    }

    // Pull row counts for tables we don't expose but still need for widths.
    const r = struct {
        fn at(all: *[64]u32, id: TableId) u32 {
            return all[@intFromEnum(id)];
        }
    }.at;

    const module_rows = r(&rows, .module);
    const event_rows = r(&rows, .event);
    const property_rows = r(&rows, .property);
    const file_rows = r(&rows, .file);
    const assembly_ref_rows = r(&rows, .assembly_ref);
    const exported_type_rows = r(&rows, .exported_type);
    const standalone_sig_rows = r(&rows, .standalone_sig);
    const manifest_resource_rows = r(&rows, .manifest_resource);
    const generic_param_constraint_rows = r(&rows, .generic_param_constraint);
    const method_spec_rows = r(&rows, .method_spec);

    const t = &f.tables;
    const typedef_w = t[@intFromEnum(Table.type_def)].indexWidth();
    const field_w = t[@intFromEnum(Table.field)].indexWidth();
    const methoddef_w = t[@intFromEnum(Table.method_def)].indexWidth();
    const methodparam_w = t[@intFromEnum(Table.method_param)].indexWidth();
    const moduleref_w = t[@intFromEnum(Table.module_ref)].indexWidth();
    const generic_param_w = t[@intFromEnum(Table.generic_param)].indexWidth();

    const type_def_or_ref = codedWidth(&.{
        t[@intFromEnum(Table.type_def)].len,
        t[@intFromEnum(Table.type_ref)].len,
        t[@intFromEnum(Table.type_spec)].len,
    });
    const has_constant = codedWidth(&.{
        t[@intFromEnum(Table.field)].len,
        t[@intFromEnum(Table.method_param)].len,
        property_rows,
    });
    const has_field_marshal = codedWidth(&.{
        t[@intFromEnum(Table.field)].len,
        t[@intFromEnum(Table.method_param)].len,
    });
    const has_decl_security = codedWidth(&.{
        t[@intFromEnum(Table.type_def)].len,
        t[@intFromEnum(Table.method_def)].len,
        t[@intFromEnum(Table.assembly)].len,
    });
    const member_ref_parent = codedWidth(&.{
        t[@intFromEnum(Table.type_def)].len,
        t[@intFromEnum(Table.type_ref)].len,
        t[@intFromEnum(Table.module_ref)].len,
        t[@intFromEnum(Table.method_def)].len,
        t[@intFromEnum(Table.type_spec)].len,
    });
    const has_semantics = codedWidth(&.{ event_rows, property_rows });
    const method_def_or_ref = codedWidth(&.{
        t[@intFromEnum(Table.method_def)].len,
        t[@intFromEnum(Table.member_ref)].len,
    });
    const member_forwarded = codedWidth(&.{
        t[@intFromEnum(Table.field)].len,
        t[@intFromEnum(Table.method_def)].len,
    });
    const implementation = codedWidth(&.{ file_rows, assembly_ref_rows, exported_type_rows });
    const custom_attribute_type = codedWidth(&.{
        t[@intFromEnum(Table.method_def)].len,
        t[@intFromEnum(Table.member_ref)].len,
        0,
        0,
        0,
    });
    const resolution_scope = codedWidth(&.{
        module_rows,
        t[@intFromEnum(Table.module_ref)].len,
        assembly_ref_rows,
        t[@intFromEnum(Table.type_ref)].len,
    });
    const type_or_method_def = codedWidth(&.{
        t[@intFromEnum(Table.type_def)].len,
        t[@intFromEnum(Table.method_def)].len,
    });
    const has_custom_attribute = codedWidth(&.{
        t[@intFromEnum(Table.method_def)].len,
        t[@intFromEnum(Table.field)].len,
        t[@intFromEnum(Table.type_ref)].len,
        t[@intFromEnum(Table.type_def)].len,
        t[@intFromEnum(Table.method_param)].len,
        t[@intFromEnum(Table.interface_impl)].len,
        t[@intFromEnum(Table.member_ref)].len,
        module_rows,
        property_rows,
        event_rows,
        standalone_sig_rows,
        t[@intFromEnum(Table.module_ref)].len,
        t[@intFromEnum(Table.type_spec)].len,
        t[@intFromEnum(Table.assembly)].len,
        assembly_ref_rows,
        file_rows,
        exported_type_rows,
        manifest_resource_rows,
        t[@intFromEnum(Table.generic_param)].len,
        generic_param_constraint_rows,
        method_spec_rows,
    });

    // Unused tables still participate in offset math; keep them local.
    var module: TableInfo = .{ .len = module_rows };
    var event_map: TableInfo = .{ .len = r(&rows, .event_map) };
    var event: TableInfo = .{ .len = event_rows };
    var property_map: TableInfo = .{ .len = r(&rows, .property_map) };
    var property: TableInfo = .{ .len = property_rows };
    var method_semantics: TableInfo = .{ .len = r(&rows, .method_semantics) };
    var method_impl: TableInfo = .{ .len = r(&rows, .method_impl) };
    var field_layout: TableInfo = .{ .len = r(&rows, .field_layout) };
    var field_marshal: TableInfo = .{ .len = r(&rows, .field_marshal) };
    var field_rva: TableInfo = .{ .len = r(&rows, .field_rva) };
    var decl_security: TableInfo = .{ .len = r(&rows, .decl_security) };
    var standalone_sig: TableInfo = .{ .len = standalone_sig_rows };
    var assembly_os: TableInfo = .{ .len = r(&rows, .assembly_os) };
    var assembly_processor: TableInfo = .{ .len = r(&rows, .assembly_processor) };
    var assembly_ref: TableInfo = .{ .len = assembly_ref_rows };
    var assembly_ref_os: TableInfo = .{ .len = r(&rows, .assembly_ref_os) };
    var assembly_ref_processor: TableInfo = .{ .len = r(&rows, .assembly_ref_processor) };
    var file_tbl: TableInfo = .{ .len = file_rows };
    var exported_type: TableInfo = .{ .len = exported_type_rows };
    var manifest_resource: TableInfo = .{ .len = manifest_resource_rows };
    var method_spec: TableInfo = .{ .len = method_spec_rows };
    var generic_param_constraint: TableInfo = .{ .len = generic_param_constraint_rows };

    // Column layouts (ECMA-335 §22). Order below matches the table physical
    // order, which is also the order we walk when setting data offsets.
    module.setColumns(2, str_w, guid_w, guid_w, guid_w, 0);
    t[@intFromEnum(Table.type_ref)].setColumns(resolution_scope, str_w, str_w, 0, 0, 0);
    t[@intFromEnum(Table.type_def)].setColumns(4, str_w, str_w, type_def_or_ref, field_w, methoddef_w);
    t[@intFromEnum(Table.field)].setColumns(2, str_w, blob_w, 0, 0, 0);
    t[@intFromEnum(Table.method_def)].setColumns(4, 2, 2, str_w, blob_w, methodparam_w);
    t[@intFromEnum(Table.method_param)].setColumns(2, 2, str_w, 0, 0, 0);
    t[@intFromEnum(Table.interface_impl)].setColumns(typedef_w, type_def_or_ref, 0, 0, 0, 0);
    t[@intFromEnum(Table.member_ref)].setColumns(member_ref_parent, str_w, blob_w, 0, 0, 0);
    t[@intFromEnum(Table.constant)].setColumns(2, has_constant, blob_w, 0, 0, 0);
    t[@intFromEnum(Table.attribute)].setColumns(has_custom_attribute, custom_attribute_type, blob_w, 0, 0, 0);
    field_marshal.setColumns(has_field_marshal, blob_w, 0, 0, 0, 0);
    decl_security.setColumns(2, has_decl_security, blob_w, 0, 0, 0);
    t[@intFromEnum(Table.class_layout)].setColumns(2, 4, typedef_w, 0, 0, 0);
    field_layout.setColumns(4, field_w, 0, 0, 0, 0);
    standalone_sig.setColumns(blob_w, 0, 0, 0, 0, 0);
    event_map.setColumns(typedef_w, event.indexWidth(), 0, 0, 0, 0);
    event.setColumns(2, str_w, type_def_or_ref, 0, 0, 0);
    property_map.setColumns(typedef_w, property.indexWidth(), 0, 0, 0, 0);
    property.setColumns(2, str_w, blob_w, 0, 0, 0);
    method_semantics.setColumns(2, methoddef_w, has_semantics, 0, 0, 0);
    method_impl.setColumns(typedef_w, method_def_or_ref, method_def_or_ref, 0, 0, 0);
    t[@intFromEnum(Table.module_ref)].setColumns(str_w, 0, 0, 0, 0, 0);
    t[@intFromEnum(Table.type_spec)].setColumns(blob_w, 0, 0, 0, 0, 0);
    t[@intFromEnum(Table.impl_map)].setColumns(2, member_forwarded, str_w, moduleref_w, 0, 0);
    field_rva.setColumns(4, field_w, 0, 0, 0, 0);
    t[@intFromEnum(Table.assembly)].setColumns(4, 8, 4, blob_w, str_w, str_w);
    assembly_processor.setColumns(4, 0, 0, 0, 0, 0);
    assembly_os.setColumns(4, 4, 4, 0, 0, 0);
    assembly_ref.setColumns(8, 4, blob_w, str_w, str_w, blob_w);
    assembly_ref_processor.setColumns(4, assembly_ref.indexWidth(), 0, 0, 0, 0);
    assembly_ref_os.setColumns(4, 4, 4, assembly_ref.indexWidth(), 0, 0);
    file_tbl.setColumns(4, str_w, blob_w, 0, 0, 0);
    exported_type.setColumns(4, 4, str_w, str_w, implementation, 0);
    manifest_resource.setColumns(4, 4, str_w, implementation, 0, 0);
    t[@intFromEnum(Table.nested_class)].setColumns(typedef_w, typedef_w, 0, 0, 0, 0);
    t[@intFromEnum(Table.generic_param)].setColumns(2, 2, type_or_method_def, str_w, 0, 0);
    method_spec.setColumns(method_def_or_ref, blob_w, 0, 0, 0, 0);
    generic_param_constraint.setColumns(generic_param_w, type_def_or_ref, 0, 0, 0, 0);

    // Now assign data offsets in physical order.
    var offset: u32 = view;
    module.setData(&offset);
    t[@intFromEnum(Table.type_ref)].setData(&offset);
    t[@intFromEnum(Table.type_def)].setData(&offset);
    t[@intFromEnum(Table.field)].setData(&offset);
    t[@intFromEnum(Table.method_def)].setData(&offset);
    t[@intFromEnum(Table.method_param)].setData(&offset);
    t[@intFromEnum(Table.interface_impl)].setData(&offset);
    t[@intFromEnum(Table.member_ref)].setData(&offset);
    t[@intFromEnum(Table.constant)].setData(&offset);
    t[@intFromEnum(Table.attribute)].setData(&offset);
    field_marshal.setData(&offset);
    decl_security.setData(&offset);
    t[@intFromEnum(Table.class_layout)].setData(&offset);
    field_layout.setData(&offset);
    standalone_sig.setData(&offset);
    event_map.setData(&offset);
    event.setData(&offset);
    property_map.setData(&offset);
    property.setData(&offset);
    method_semantics.setData(&offset);
    method_impl.setData(&offset);
    t[@intFromEnum(Table.module_ref)].setData(&offset);
    t[@intFromEnum(Table.type_spec)].setData(&offset);
    t[@intFromEnum(Table.impl_map)].setData(&offset);
    field_rva.setData(&offset);
    t[@intFromEnum(Table.assembly)].setData(&offset);
    assembly_processor.setData(&offset);
    assembly_os.setData(&offset);
    assembly_ref.setData(&offset);
    assembly_ref_processor.setData(&offset);
    assembly_ref_os.setData(&offset);
    file_tbl.setData(&offset);
    exported_type.setData(&offset);
    manifest_resource.setData(&offset);
    t[@intFromEnum(Table.nested_class)].setData(&offset);
    t[@intFromEnum(Table.generic_param)].setData(&offset);
}

/// All ECMA-335 metadata tables, indexed by their on-disk bit position.
const TableId = enum(u6) {
    module = 0x00,
    type_ref = 0x01,
    type_def = 0x02,
    field = 0x04,
    method_def = 0x06,
    param = 0x08,
    interface_impl = 0x09,
    member_ref = 0x0A,
    constant = 0x0B,
    custom_attribute = 0x0C,
    field_marshal = 0x0D,
    decl_security = 0x0E,
    class_layout = 0x0F,
    field_layout = 0x10,
    standalone_sig = 0x11,
    event_map = 0x12,
    event = 0x14,
    property_map = 0x15,
    property = 0x17,
    method_semantics = 0x18,
    method_impl = 0x19,
    module_ref = 0x1A,
    type_spec = 0x1B,
    impl_map = 0x1C,
    field_rva = 0x1D,
    assembly = 0x20,
    assembly_processor = 0x21,
    assembly_os = 0x22,
    assembly_ref = 0x23,
    assembly_ref_processor = 0x24,
    assembly_ref_os = 0x25,
    file = 0x26,
    exported_type = 0x27,
    manifest_resource = 0x28,
    nested_class = 0x29,
    generic_param = 0x2A,
    method_spec = 0x2B,
    generic_param_constraint = 0x2C,
};

fn tableSlot(id: TableId) ?Table {
    return switch (id) {
        .type_ref => .type_ref,
        .type_def => .type_def,
        .field => .field,
        .method_def => .method_def,
        .param => .method_param,
        .interface_impl => .interface_impl,
        .member_ref => .member_ref,
        .constant => .constant,
        .custom_attribute => .attribute,
        .class_layout => .class_layout,
        .module_ref => .module_ref,
        .type_spec => .type_spec,
        .impl_map => .impl_map,
        .assembly => .assembly,
        .nested_class => .nested_class,
        .generic_param => .generic_param,
        else => null,
    };
}

/// Coded-index column width: 2 bytes if every referenced table fits within
/// the remaining bits, else 4 bytes.
fn codedWidth(row_counts: []const u32) u8 {
    // Number of tag bits = ceil(log2(n)).
    var bits: u5 = 0;
    var n: u32 = @intCast(row_counts.len);
    n -= 1;
    while (n != 0) : (n >>= 1) bits += 1;
    const limit: u32 = @as(u32, 1) << (@as(u5, 16) - bits);
    for (row_counts) |c| {
        if (c >= limit) return 4;
    }
    return 2;
}

// ---- Mmap-backed loader ---------------------------------------------------

/// Owns a `MemoryMap` + `Io.File` pair together with a parsed `File` view.
///
/// Lifetime: `file` borrows from `mmap.memory`, so `MappedFile` must outlive
/// every use of `file` and its derived `TypeIndex` etc. Call `deinit` to
/// unmap and close in the correct order.
pub const MappedFile = struct {
    mmap: std.Io.File.MemoryMap,
    io_file: std.Io.File,
    file: File,

    pub fn deinit(self: *MappedFile, io: std.Io) void {
        self.mmap.destroy(io);
        self.io_file.close(io);
        self.* = undefined;
    }
};

pub const OpenError = error{
    WinmdTooLarge,
} || Error || std.Io.File.MemoryMap.CreateError || std.Io.File.OpenError || std.Io.File.StatError;

/// Open `sub_path` relative to `dir`, mmap it read-only, and parse the
/// ECMA-335 metadata. Returned `MappedFile` owns the mapping; call `deinit`
/// when done. Caller must pass a live `Io` instance (e.g. from
/// `std.Io.Threaded.init(gpa, .{}).io()`).
pub fn mmapAndParse(io: std.Io, dir: std.Io.Dir, sub_path: []const u8) OpenError!MappedFile {
    var f = try dir.openFile(io, sub_path, .{ .mode = .read_only });
    errdefer f.close(io);

    const stat = try f.stat(io);
    const len = std.math.cast(usize, stat.size) orelse return error.WinmdTooLarge;

    var mmap = try std.Io.File.MemoryMap.create(io, f, .{
        .len = len,
        .protection = .{ .read = true, .write = false },
    });
    errdefer mmap.destroy(io);

    const parsed = try parse(mmap.memory[0..len]);
    return .{ .mmap = mmap, .io_file = f, .file = parsed };
}

// ---- Tests ----------------------------------------------------------------

test "parse Windows.Win32.winmd and locate Point" {
    // Embedded so the test doesn't depend on the working directory.
    const bytes = @embedFile("Windows.winmd");
    const f = try parse(bytes);

    // Sanity: there should be thousands of TypeDef rows.
    try std.testing.expect(f.rowCount(.type_def) > 100);

    // TypeDef columns per ECMA-335 §22.37:
    //   0: Flags (u32)   1: Name (str)   2: Namespace (str)
    //   3: Extends (TypeDefOrRef)   4: FieldList   5: MethodList
    const rows = f.rowCount(.type_def);
    var point_row: ?u32 = null;
    var row: u32 = 0;
    while (row < rows) : (row += 1) {
        const ns = f.str(.type_def, row, 2);
        const name = f.str(.type_def, row, 1);
        if (std.mem.eql(u8, ns, "Windows.Foundation") and std.mem.eql(u8, name, "Point")) {
            point_row = row;
            break;
        }
    }
    try std.testing.expect(point_row != null);

    // Point is a struct with two f32 fields (X, Y). Exercise list(): the
    // FieldList column (4) names a range of rows in the Field table.
    const fields = f.list(.type_def, point_row.?, 4, .field);
    try std.testing.expectEqual(@as(u32, 2), fields.len());
    try std.testing.expectEqualStrings("X", f.str(.field, fields.start, 1));
    try std.testing.expectEqualStrings("Y", f.str(.field, fields.start + 1, 1));

    // Each Field has a non-empty signature blob (column 2). Don't decode it
    // yet, just make sure the blob reader produces a plausible slice.
    const sig = f.blob(.field, fields.start, 2);
    try std.testing.expect(sig.len > 0);
}

test "TypeIndex locates Point and exercises parent/equalRange" {
    const bytes = @embedFile("Windows.winmd");
    const f = try parse(bytes);

    var index = try TypeIndex.init(std.testing.allocator, &f);
    defer index.deinit();

    try std.testing.expect(index.containsNamespace("Windows.Foundation"));
    try std.testing.expect(!index.containsNamespace("Not.A.Namespace"));
    try std.testing.expect(index.contains("Windows.Foundation", "Point"));

    const rows = index.get("Windows.Foundation", "Point");
    try std.testing.expectEqual(@as(usize, 1), rows.len);
    const point_row = rows[0];

    // parent(): given any field owned by Point, we should recover point_row
    // via TypeDef.FieldList (column 4).
    const fields = f.list(.type_def, point_row, 4, .field);
    try std.testing.expect(fields.len() >= 1);
    const parent_row = f.parent(.type_def, 4, fields.start);
    try std.testing.expectEqual(point_row, parent_row);

    // NestedClass col 1 (EnclosingClass) is NOT sorted (the table is
    // sorted by col 0, NestedClass, per ECMA-335 §II.22.32), so we must
    // linear-scan to find children of a given outer. Point has no
    // nested types, so the count should be zero.
    const nc_rows = f.rowCount(.nested_class);
    var nested_children: u32 = 0;
    var nc_i: u32 = 0;
    while (nc_i < nc_rows) : (nc_i += 1) {
        if (f.cell(.nested_class, nc_i, 1) == point_row + 1) nested_children += 1;
    }
    try std.testing.expectEqual(@as(u32, 0), nested_children);

    // assemblyName may be null for merged/special winmds; just confirm the
    // call doesn't panic and produces a consistent result.
    _ = f.assemblyName();
}

test "field signature decodes Point.X/Y as f32" {
    const bytes = @embedFile("Windows.winmd");
    const f = try parse(bytes);

    var index = try TypeIndex.init(std.testing.allocator, &f);
    defer index.deinit();
    const point_row = index.get("Windows.Foundation", "Point")[0];
    const fields = f.list(.type_def, point_row, 4, .field);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    const x_sig = f.blob(.field, fields.start, 2);
    // Field signature for a primitive: prolog byte (0x06) + element type.
    try std.testing.expectEqual(@as(usize, 2), x_sig.len);
    try std.testing.expectEqual(@as(u8, 0x06), x_sig[0]);
    try std.testing.expectEqual(@as(u8, ELEMENT_TYPE_R4), x_sig[1]);

    const x_ty = try readFieldSignature(arena.allocator(), &f, x_sig);
    try std.testing.expectEqual(Ty.f32, x_ty);

    const y_ty = try readFieldSignature(arena.allocator(), &f, f.blob(.field, fields.start + 1, 2));
    try std.testing.expectEqual(Ty.f32, y_ty);

    // Malformed blob with trailing bytes must be rejected.
    try std.testing.expectError(error.TrailingBytes, readFieldSignature(arena.allocator(), &f, &[_]u8{ 0x06, 0x0C, 0x0C }));
    // Wrong prolog must be rejected.
    try std.testing.expectError(error.BadFieldProlog, readFieldSignature(arena.allocator(), &f, &[_]u8{ 0x07, 0x0C }));
}

test "method signature decodes IClosable.Close as void()" {
    const bytes = @embedFile("Windows.winmd");
    const f = try parse(bytes);

    var index = try TypeIndex.init(std.testing.allocator, &f);
    defer index.deinit();

    // IClosable is a WinRT interface with a single method: void Close().
    const rows = index.get("Windows.Foundation", "IClosable");
    try std.testing.expectEqual(@as(usize, 1), rows.len);
    const methods = f.list(.type_def, rows[0], 5, .method_def);
    try std.testing.expect(methods.len() >= 1);

    // Find the Close method by name — robust to WinRT ordering.
    var close_row: ?u32 = null;
    var i = methods.start;
    while (i < methods.end) : (i += 1) {
        if (std.mem.eql(u8, f.str(.method_def, i, 3), "Close")) {
            close_row = i;
            break;
        }
    }
    try std.testing.expect(close_row != null);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    const sig = f.blob(.method_def, close_row.?, 4);
    const m = try readMethodSignature(arena.allocator(), &f, sig);
    try std.testing.expect(m.flags.hasThis());
    try std.testing.expect(!m.flags.isGeneric());
    try std.testing.expectEqual(@as(usize, 0), m.params.len);
    try std.testing.expectEqual(Ty.void, m.return_type);

    // Malformed blob: claims 1 param but has no type byte after void return.
    try std.testing.expectError(error.ShortBlob, readMethodSignature(arena.allocator(), &f, &[_]u8{ 0x20, 0x01, 0x01 }));
}

test "attribute helpers find Point's ContractVersionAttribute" {
    const bytes = @embedFile("Windows.winmd");
    const f = try parse(bytes);

    var index = try TypeIndex.init(std.testing.allocator, &f);
    defer index.deinit();
    const point_row = index.get("Windows.Foundation", "Point")[0];

    // Point is a WinRT struct; WinRT projections decorate every public
    // type with ContractVersionAttribute to record the API contract
    // version it first appeared in.
    const range = attributes(&f, .type_def, point_row);
    try std.testing.expect(range.len() >= 1);

    // Every attribute row in the range must name a resolvable class,
    // and at least one must mention ContractVersion.
    var saw_contract = false;
    var i = range.start;
    while (i < range.end) : (i += 1) {
        const tn = attributeName(&f, i);
        try std.testing.expect(tn != null);
        if (std.mem.eql(u8, tn.?.name, "ContractVersionAttribute")) saw_contract = true;
    }
    try std.testing.expect(saw_contract);
    try std.testing.expect(hasAttribute(&f, .type_def, point_row, "ContractVersionAttribute"));
    try std.testing.expect(!hasAttribute(&f, .type_def, point_row, "ThisDoesNotExistAttribute"));

    // Coded-token encoding: ((row+1) << 5) | tag.
    try std.testing.expectEqual(@as(u32, (1 << 5) | 3), encodeHasAttribute(.type_def, 0));
    try std.testing.expectEqual(@as(u32, (5 << 5) | 0), encodeHasAttribute(.method_def, 4));
}

test "attribute values decode Point's ContractVersionAttribute" {
    const bytes = @embedFile("Windows.winmd");
    const f = try parse(bytes);

    var index = try TypeIndex.init(std.testing.allocator, &f);
    defer index.deinit();
    const point_row = index.get("Windows.Foundation", "Point")[0];

    const attr_row = findAttribute(&f, .type_def, point_row, "ContractVersionAttribute") orelse
        return error.TestUnexpectedResult;

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const args = try readAttributeArgs(arena.allocator(), &f, attr_row);

    // ContractVersionAttribute(Type, u32) on a struct encodes one
    // positional Type arg (the contract name) and one u32 version; no
    // named args.
    try std.testing.expectEqual(@as(usize, 2), args.len);
    try std.testing.expectEqualStrings("", args[0].name);
    try std.testing.expect(args[0].value == .type_name);
    try std.testing.expectEqualStrings("Windows.Foundation", args[0].value.type_name.namespace);
    try std.testing.expectEqualStrings("FoundationContract", args[0].value.type_name.name);
    try std.testing.expectEqualStrings("", args[1].name);
    try std.testing.expect(args[1].value == .u32_val);
    try std.testing.expect(args[1].value.u32_val != 0);

    // Every decodable attribute on Point must round-trip without error.
    const range = attributes(&f, .type_def, point_row);
    var i = range.start;
    while (i < range.end) : (i += 1) {
        _ = readAttributeArgs(arena.allocator(), &f, i) catch |err| switch (err) {
            // Complex attributes that use constructs this reader does
            // not model yet (arrays, boxed args, generics, ...) are
            // allowed to fail — they'll be covered in later phases.
            error.UnsupportedAttributeType, error.UnsupportedElement => continue,
            else => return err,
        };
    }
}

test "generics: IAsyncOperation`1.GetResults returns VAR 0" {
    const bytes = @embedFile("Windows.winmd");
    const f = try parse(bytes);

    var index = try TypeIndex.init(std.testing.allocator, &f);
    defer index.deinit();

    // TypeIndex strips the `N arity suffix when keying, so generic arities
    // are bucketed together. Pick the single arity-1 row.
    const rows = index.get("Windows.Foundation", "IAsyncOperation");
    var iasync_row: ?u32 = null;
    for (rows) |r| {
        if (std.mem.eql(u8, f.str(.type_def, r, 1), "IAsyncOperation`1")) {
            iasync_row = r;
            break;
        }
    }
    try std.testing.expect(iasync_row != null);

    const methods = f.list(.type_def, iasync_row.?, 5, .method_def);
    var get_results_row: ?u32 = null;
    var i = methods.start;
    while (i < methods.end) : (i += 1) {
        if (std.mem.eql(u8, f.str(.method_def, i, 3), "GetResults")) {
            get_results_row = i;
            break;
        }
    }
    try std.testing.expect(get_results_row != null);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    const sig = f.blob(.method_def, get_results_row.?, 4);
    const m = try readMethodSignature(arena.allocator(), &f, sig);
    try std.testing.expect(m.flags.hasThis());
    try std.testing.expect(!m.flags.isGeneric());
    try std.testing.expectEqual(@as(u32, 0), m.generic_param_count);
    try std.testing.expectEqual(@as(usize, 0), m.params.len);
    try std.testing.expect(m.return_type == .var_generic);
    try std.testing.expectEqual(@as(u32, 0), m.return_type.var_generic);
}

test "generics: IMap`2.GetView returns GENERICINST IMapView`2<K,V>" {
    const bytes = @embedFile("Windows.winmd");
    const f = try parse(bytes);

    var index = try TypeIndex.init(std.testing.allocator, &f);
    defer index.deinit();

    const rows = index.get("Windows.Foundation.Collections", "IMap");
    var imap_row: ?u32 = null;
    for (rows) |r| {
        if (std.mem.eql(u8, f.str(.type_def, r, 1), "IMap`2")) {
            imap_row = r;
            break;
        }
    }
    try std.testing.expect(imap_row != null);

    const methods = f.list(.type_def, imap_row.?, 5, .method_def);
    var get_view_row: ?u32 = null;
    var i = methods.start;
    while (i < methods.end) : (i += 1) {
        if (std.mem.eql(u8, f.str(.method_def, i, 3), "GetView")) {
            get_view_row = i;
            break;
        }
    }
    try std.testing.expect(get_view_row != null);

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    const sig = f.blob(.method_def, get_view_row.?, 4);
    const m = try readMethodSignature(arena.allocator(), &f, sig);
    try std.testing.expectEqual(@as(usize, 0), m.params.len);
    try std.testing.expect(m.return_type == .class_name);
    const ret = m.return_type.class_name;
    try std.testing.expectEqualStrings("Windows.Foundation.Collections", ret.namespace);
    try std.testing.expectEqualStrings("IMapView`2", ret.name);
    try std.testing.expectEqual(@as(usize, 2), ret.generics.len);
    try std.testing.expect(ret.generics[0] == .var_generic);
    try std.testing.expectEqual(@as(u32, 0), ret.generics[0].var_generic);
    try std.testing.expect(ret.generics[1] == .var_generic);
    try std.testing.expectEqual(@as(u32, 1), ret.generics[1].var_generic);
}

test "parse Windows.Win32.winmd: header, TypeIndex, and method-sig sweep" {
    const bytes = @embedFile("Windows.Win32.winmd");
    const f = try parse(bytes);

    // Win32 metadata is dense; require a substantial type/method count so a
    // future regression that drops rows is loud.
    try std.testing.expect(f.rowCount(.type_def) > 5_000);
    try std.testing.expect(f.rowCount(.method_def) > 10_000);

    var index = try TypeIndex.init(std.testing.allocator, &f);
    defer index.deinit();
    try std.testing.expect(index.containsNamespace("Windows.Win32.Foundation"));
    try std.testing.expect(index.contains("Windows.Win32.Foundation", "HWND"));
    try std.testing.expect(index.contains("Windows.Win32.System.Com", "IUnknown"));

    // CreateFileW: classic Win32 call exercised by docs everywhere.
    const k32 = index.get("Windows.Win32.Storage.FileSystem", "Apis");
    try std.testing.expect(k32.len >= 1);
    const methods = f.list(.type_def, k32[0], 5, .method_def);
    var found_create_file_w = false;
    var i = methods.start;
    while (i < methods.end) : (i += 1) {
        if (std.mem.eql(u8, f.str(.method_def, i, 3), "CreateFileW")) {
            found_create_file_w = true;
            break;
        }
    }
    try std.testing.expect(found_create_file_w);

    // Sweep: every method signature blob must either decode cleanly or fail
    // with one of the known "not yet implemented" errors. A surprise error
    // (BadCompressed, ShortBlob, TrailingBytes, ...) means real corruption
    // or a reader bug.
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const total_methods = f.rowCount(.method_def);
    var ok: u32 = 0;
    var unsupported: u32 = 0;
    var row: u32 = 0;
    while (row < total_methods) : (row += 1) {
        defer _ = arena.reset(.retain_capacity);
        const sig = f.blob(.method_def, row, 4);
        if (sig.len == 0) continue;
        _ = readMethodSignature(arena.allocator(), &f, sig) catch |err| switch (err) {
            error.UnsupportedElement => {
                unsupported += 1;
                continue;
            },
            else => return err,
        };
        ok += 1;
    }
    // Most Win32 method sigs use plain primitives + structs + pointers.
    try std.testing.expect(ok > total_methods / 2);
}

test "findImplMap resolves a Win32 MethodDef to its DLL + import name" {
    const bytes = @embedFile("Windows.Win32.winmd");
    const f = try parse(bytes);

    var index = try TypeIndex.init(std.testing.allocator, &f);
    defer index.deinit();

    // Windows.Win32.Foundation.Apis.CloseHandle — a stable, ancient
    // kernel32 export with a trivial signature (BOOL(HANDLE)). If
    // impl_map parsing ever regresses this test will catch it loudly.
    const apis = index.get("Windows.Win32.Foundation", "Apis");
    try std.testing.expect(apis.len >= 1);

    const methods = f.list(.type_def, apis[0], 5, .method_def);
    var found: ?u32 = null;
    var i = methods.start;
    while (i < methods.end) : (i += 1) {
        if (std.mem.eql(u8, f.str(.method_def, i, 3), "CloseHandle")) {
            found = i;
            break;
        }
    }
    try std.testing.expect(found != null);

    const imp = f.findImplMap(found.?);
    try std.testing.expect(imp != null);
    try std.testing.expectEqualStrings("CloseHandle", f.implMapImportName(imp.?));
    // DLL name is case-sensitive in metadata ("KERNEL32.dll").
    const dll = f.implMapDll(imp.?);
    try std.testing.expect(std.ascii.eqlIgnoreCase(dll, "kernel32.dll"));

    // A method with no PInvoke mapping returns null. Pick a COM
    // vtable slot: `IUnknown.QueryInterface`. Its MethodDef is
    // whichever row under `Windows.Win32.System.Com.IUnknown` has
    // name "QueryInterface".
    const iunknown = index.get("Windows.Win32.System.Com", "IUnknown");
    try std.testing.expect(iunknown.len >= 1);
    const qi_methods = f.list(.type_def, iunknown[0], 5, .method_def);
    var qi_row: ?u32 = null;
    var j = qi_methods.start;
    while (j < qi_methods.end) : (j += 1) {
        if (std.mem.eql(u8, f.str(.method_def, j, 3), "QueryInterface")) {
            qi_row = j;
            break;
        }
    }
    try std.testing.expect(qi_row != null);
    try std.testing.expectEqual(@as(?u32, null), f.findImplMap(qi_row.?));
}

test "parse Windows.Wdk.winmd: header, TypeIndex, and basic sigs" {
    const bytes = @embedFile("Windows.Wdk.winmd");
    const f = try parse(bytes);

    try std.testing.expect(f.rowCount(.type_def) > 100);
    try std.testing.expect(f.rowCount(.method_def) > 100);

    var index = try TypeIndex.init(std.testing.allocator, &f);
    defer index.deinit();
    // Wdk metadata sits under Windows.Wdk.* — exact namespaces vary by
    // generation, so just assert a couple of well-known kernel headers
    // are reachable.
    try std.testing.expect(index.containsNamespace("Windows.Wdk.Foundation"));

    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const total_methods = f.rowCount(.method_def);
    var row: u32 = 0;
    while (row < total_methods) : (row += 1) {
        defer _ = arena.reset(.retain_capacity);
        const sig = f.blob(.method_def, row, 4);
        if (sig.len == 0) continue;
        _ = readMethodSignature(arena.allocator(), &f, sig) catch |err| switch (err) {
            error.UnsupportedElement => continue,
            else => return err,
        };
    }
}

test "mmapAndParse: load Windows.Win32.winmd from disk" {
    if (@import("builtin").single_threaded) return error.SkipZigTest;

    const gpa = std.testing.allocator;
    var io_instance: std.Io.Threaded = .init(gpa, .{});
    defer io_instance.deinit();
    const io = io_instance.io();

    // Resolve the vendored metadata relative to the winmd package root.
    // The test binary's cwd is the build cache dir, so anchor via __FILE__
    // is unreliable; the path is stable within this repo layout.
    const repo_root = std.Io.Dir.cwd();
    const path = "../crates/libs/bindgen/default/Windows.Win32.winmd";

    var mf = mmapAndParse(io, repo_root, path) catch |err| switch (err) {
        error.FileNotFound => return error.SkipZigTest,
        else => return err,
    };
    defer mf.deinit(io);

    try std.testing.expect(mf.file.rowCount(.type_def) > 5_000);

    var index = try TypeIndex.init(gpa, &mf.file);
    defer index.deinit();
    try std.testing.expect(index.contains("Windows.Win32.Foundation", "HWND"));
}

test "comptime: parse Windows.winmd and locate Point" {
    // Phase 4 foundation: verify the reader runs inside the comptime VM
    // against `@embedFile`'d metadata. This is a prerequisite for
    // `project(.{ .filter = ... })` — without it, no comptime projection.
    //
    // Uses the 7 MB WinRT `Windows.winmd`, which compiles cleanly in a
    // few seconds with a generous eval branch quota. The ~23 MB Win32
    // winmd was tested separately and found to take >20 minutes for a
    // single naive scan — see the skipped benchmark below. Phase 4
    // will need chunked / cached / pre-indexed metadata before
    // `project()` can target the full Win32 surface.
    @setEvalBranchQuota(10_000_000);
    const bytes = @embedFile("Windows.winmd");
    const f = comptime parse(bytes) catch unreachable;

    // Sanity: thousands of TypeDef rows, same as the runtime test.
    comptime {
        std.debug.assert(f.rowCount(.type_def) > 100);
    }

    // Locate `Windows.Foundation.Point` entirely at comptime.
    const point_row: u32 = comptime blk: {
        const rows = f.rowCount(.type_def);
        var row: u32 = 0;
        while (row < rows) : (row += 1) {
            const ns = f.str(.type_def, row, 2);
            const name = f.str(.type_def, row, 1);
            if (std.mem.eql(u8, ns, "Windows.Foundation") and
                std.mem.eql(u8, name, "Point"))
            {
                break :blk row;
            }
        }
        @compileError("Windows.Foundation.Point not found at comptime");
    };

    // Exercise `list()` at comptime and check the two f32 field names.
    const fields = comptime f.list(.type_def, point_row, 4, .field);
    try std.testing.expectEqual(@as(u32, 2), fields.len());
    try std.testing.expectEqualStrings("X", comptime f.str(.field, fields.start, 1));
    try std.testing.expectEqualStrings("Y", comptime f.str(.field, fields.start + 1, 1));
}

test "comptime: parse Windows.Win32.winmd and locate GetLastError" {
    // Benchmark the worst-case metadata (23 MB) at comptime. Finding:
    // a naive linear scan over MethodDef at comptime takes >20 minutes
    // on a fast dev box and is not viable as-is. Before enabling this
    // at the default `project()` path Phase 4 needs either:
    //   a) a cached parsed `File` shared across `project()` calls,
    //   b) per-namespace chunked @embedFile slices, or
    //   c) a prebuilt comptime-friendly symbol index baked into the
    //      winmd package at generate time.
    //
    // Kept as SkipZigTest so the regression is visible without blocking
    // day-to-day builds. Uncomment the body and return branch to run.
    //
    // @setEvalBranchQuota(1_000_000_000);
    // const bytes = @embedFile("Windows.Win32.winmd");
    // const f = comptime parse(bytes) catch unreachable;
    // const found: bool = comptime blk: {
    //     const rows = f.rowCount(.method_def);
    //     var row: u32 = 0;
    //     while (row < rows) : (row += 1) {
    //         const name = f.str(.method_def, row, 3);
    //         if (std.mem.eql(u8, name, "GetLastError")) break :blk true;
    //     }
    //     break :blk false;
    // };
    // try std.testing.expect(found);
    return error.SkipZigTest;
}

test "comptime: parse Windows.Win32.winmd with O(1) direct row access" {
    // Phase 4 option (c) viability check. Unlike the skipped test
    // above, this does NOT iterate — it parses once (header + table
    // streams only) and reads a single precomputed MethodDef row.
    //
    // Finding: even `parse()` without iteration takes ~13 minutes at
    // comptime on the 23 MB Win32 winmd with
    // `@setEvalBranchQuota(10_000_000)`. The table-stream decode
    // itself is the bottleneck (indirections + coded-index arithmetic
    // across hundreds of thousands of rows).
    //
    // Conclusion: option (c) must bake *all* per-method data
    // (library, import name, signature bytes) directly into the
    // generated index so `project()` never needs to parse winmd at
    // comptime. The index is extended in a follow-up slice.
    //
    // Kept as SkipZigTest to preserve the measurement without
    // blocking CI on a 13-minute test.
    //
    // @setEvalBranchQuota(10_000_000);
    // const bytes = @embedFile("Windows.Win32.winmd");
    // const f = comptime parse(bytes) catch unreachable;
    // const rows = comptime f.rowCount(.method_def);
    // try std.testing.expect(rows > 2323);
    // const name = comptime f.str(.method_def, 2323, 3);
    // try std.testing.expect(name.len > 0);
    return error.SkipZigTest;
}
