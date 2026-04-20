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
    /// Constant, FieldMarshal, NestedClass, etc. per ECMA-335 §22).
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

/// Decode a `TypeDefOrRef` coded token as it appears inside a signature blob.
/// The token is a compressed unsigned integer with layout `(row << 2) | tag`,
/// where row is 1-based (§II.23.2.8, II.24.2.6).
fn resolveTypeDefOrRefName(file: *const File, token: u32) !TypeName {
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
    return_type: Ty,
    params: []Ty,
};

/// Decode a method signature blob (ECMA-335 §II.23.2.1).
///
///     MethodDefSig := [HASTHIS [EXPLICITTHIS]] (DEFAULT|VARARG|...)
///                     [GENPARAMCOUNT] ParamCount RetType Param*
///
/// Generics (GENERIC flag, GENPARAMCOUNT) are not yet supported — a blob
/// with the GENERIC bit set produces `error.UnsupportedElement`. The caller
/// is responsible for signatures that contain ELEMENT_TYPE_VAR /
/// ELEMENT_TYPE_GENERICINST inside their types; those also error out.
pub fn readMethodSignature(arena: std.mem.Allocator, file: *const File, blob: []const u8) SigError!MethodSignature {
    var c: SigCursor = .{ .bytes = blob };
    const flags: MethodCallAttributes = .{ .raw = try c.readU8() };
    if (flags.isGeneric()) return error.UnsupportedElement;

    const param_count = try c.readCompressed();
    const return_type = try readTypeSignature(arena, file, &c);

    const params = try arena.alloc(Ty, param_count);
    var i: u32 = 0;
    while (i < param_count) : (i += 1) {
        params[i] = try readTypeSignature(arena, file, &c);
    }

    if (!c.eof()) return error.TrailingBytes;
    return .{ .flags = flags, .return_type = return_type, .params = params };
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
        ELEMENT_TYPE_VAR, ELEMENT_TYPE_GENERICINST => error.UnsupportedElement,
        else => error.UnsupportedElement,
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
    var event_map: TableInfo = .{};
    var event: TableInfo = .{ .len = event_rows };
    var property_map: TableInfo = .{};
    var property: TableInfo = .{ .len = property_rows };
    var method_semantics: TableInfo = .{};
    var method_impl: TableInfo = .{};
    var field_layout: TableInfo = .{};
    var field_marshal: TableInfo = .{};
    var field_rva: TableInfo = .{};
    var decl_security: TableInfo = .{};
    var standalone_sig: TableInfo = .{ .len = standalone_sig_rows };
    var assembly_os: TableInfo = .{};
    var assembly_processor: TableInfo = .{};
    var assembly_ref: TableInfo = .{ .len = assembly_ref_rows };
    var assembly_ref_os: TableInfo = .{};
    var assembly_ref_processor: TableInfo = .{};
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

    // equalRange(): NestedClass (column 1 = enclosing TypeDef row, 1-based,
    // sorted) should find zero NestedClass rows whose parent is Point.
    const nested = f.equalRange(.nested_class, 1, point_row + 1);
    try std.testing.expectEqual(@as(u32, 0), nested.len());

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
