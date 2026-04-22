const std = @import("std");

pub const MethodRecord = struct {
    library: []const u8,
    import: []const u8,
    signature: []const u8,
};

pub const TypeRefEntry = struct {
    namespace: []const u8,
    name: []const u8,
};

pub const method_def_by_name = std.static_string_map.StaticStringMap(MethodRecord).initComptime(.{
    .{ "CreateCompressor", MethodRecord{ .library = "Cabinet", .import = "CreateCompressor", .signature = "\x00\x03\x11\x59\x11\x9f\xf5\x0f\x11\xbd\xcd\x0f\x11\xbd\xd1" } },
    .{ "SetCompressorInformation", MethodRecord{ .library = "Cabinet", .import = "SetCompressorInformation", .signature = "\x00\x04\x11\x59\x11\xbd\xd1\x11\xbd\xd5\x0f\x01\x19" } },
    .{ "QueryCompressorInformation", MethodRecord{ .library = "Cabinet", .import = "QueryCompressorInformation", .signature = "\x00\x04\x11\x59\x11\xbd\xd1\x11\xbd\xd5\x0f\x01\x19" } },
    .{ "Compress", MethodRecord{ .library = "Cabinet", .import = "Compress", .signature = "\x00\x06\x11\x59\x11\xbd\xd1\x0f\x01\x19\x0f\x01\x19\x0f\x19" } },
    .{ "ResetCompressor", MethodRecord{ .library = "Cabinet", .import = "ResetCompressor", .signature = "\x00\x01\x11\x59\x11\xbd\xd1" } },
    .{ "CloseCompressor", MethodRecord{ .library = "Cabinet", .import = "CloseCompressor", .signature = "\x00\x01\x11\x59\x11\xbd\xd1" } },
    .{ "CreateDecompressor", MethodRecord{ .library = "Cabinet", .import = "CreateDecompressor", .signature = "\x00\x03\x11\x59\x11\x9f\xf5\x0f\x11\xbd\xcd\x0f\x11\xbd\xd9" } },
    .{ "SetDecompressorInformation", MethodRecord{ .library = "Cabinet", .import = "SetDecompressorInformation", .signature = "\x00\x04\x11\x59\x11\xbd\xd9\x11\xbd\xd5\x0f\x01\x19" } },
    .{ "QueryDecompressorInformation", MethodRecord{ .library = "Cabinet", .import = "QueryDecompressorInformation", .signature = "\x00\x04\x11\x59\x11\xbd\xd9\x11\xbd\xd5\x0f\x01\x19" } },
    .{ "Decompress", MethodRecord{ .library = "Cabinet", .import = "Decompress", .signature = "\x00\x06\x11\x59\x11\xbd\xd9\x0f\x01\x19\x0f\x01\x19\x0f\x19" } },
    .{ "ResetDecompressor", MethodRecord{ .library = "Cabinet", .import = "ResetDecompressor", .signature = "\x00\x01\x11\x59\x11\xbd\xd9" } },
    .{ "CloseDecompressor", MethodRecord{ .library = "Cabinet", .import = "CloseDecompressor", .signature = "\x00\x01\x11\x59\x11\xbd\xd9" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x1ff5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Compression", .name = "COMPRESS_ALGORITHM" },
        0x3dcd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Compression", .name = "COMPRESS_ALLOCATION_ROUTINES" },
        0x3dd1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Compression", .name = "COMPRESSOR_HANDLE" },
        0x3dd5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Compression", .name = "COMPRESS_INFORMATION_CLASS" },
        0x3dd9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Compression", .name = "DECOMPRESSOR_HANDLE" },
        else => null,
    };
}

pub const COMPRESS_ALGORITHM_MSZIP = 2;
pub const COMPRESS_ALGORITHM_XPRESS = 3;
pub const COMPRESS_ALGORITHM_XPRESS_HUFF = 4;
pub const COMPRESS_ALGORITHM_LZMS = 5;
pub const COMPRESS_ALGORITHM_INVALID = 0;
pub const COMPRESS_ALGORITHM_NULL = 1;
pub const COMPRESS_ALGORITHM_MAX = 6;
pub const COMPRESS_RAW = 536870912;
pub const COMPRESS_INFORMATION_CLASS_INVALID = 0;
pub const COMPRESS_INFORMATION_CLASS_BLOCK_SIZE = 1;
pub const COMPRESS_INFORMATION_CLASS_LEVEL = 2;

pub const aliases = struct {
    pub const COMPRESS_ALGORITHM = u32;
    pub const COMPRESS_INFORMATION_CLASS = i32;
    pub const COMPRESSOR_HANDLE = ?*anyopaque;
    pub const DECOMPRESSOR_HANDLE = ?*anyopaque;
    pub const PFN_COMPRESS_ALLOCATE = ?*const anyopaque;
    pub const PFN_COMPRESS_FREE = ?*const anyopaque;
};
