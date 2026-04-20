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
};

/// Half-open range `[start, end)` of rows in a child table.
pub const Range = struct {
    start: u32,
    end: u32,

    pub fn len(self: Range) u32 {
        return self.end - self.start;
    }
};

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
