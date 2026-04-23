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
    .{ "RtlGetNonVolatileToken", MethodRecord{ .library = "ntdll", .import = "RtlGetNonVolatileToken", .signature = "\x00\x03\x09\x0f\x01\x19\x0f\x0f\x01" } },
    .{ "RtlFreeNonVolatileToken", MethodRecord{ .library = "ntdll", .import = "RtlFreeNonVolatileToken", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "RtlFlushNonVolatileMemory", MethodRecord{ .library = "ntdll", .import = "RtlFlushNonVolatileMemory", .signature = "\x00\x04\x09\x0f\x01\x0f\x01\x19\x09" } },
    .{ "RtlDrainNonVolatileFlush", MethodRecord{ .library = "ntdll", .import = "RtlDrainNonVolatileFlush", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "RtlWriteNonVolatileMemory", MethodRecord{ .library = "ntdll", .import = "RtlWriteNonVolatileMemory", .signature = "\x00\x05\x09\x0f\x01\x0f\x01\x0f\x01\x19\x09" } },
    .{ "RtlFillNonVolatileMemory", MethodRecord{ .library = "ntdll", .import = "RtlFillNonVolatileMemory", .signature = "\x00\x05\x09\x0f\x01\x0f\x01\x19\x05\x09" } },
    .{ "RtlFlushNonVolatileMemoryRanges", MethodRecord{ .library = "ntdll", .import = "RtlFlushNonVolatileMemoryRanges", .signature = "\x00\x04\x09\x0f\x01\x0f\x11\xc0\x00\xcf\xad\x19\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0xcfad => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory.NonVolatile", .name = "NV_MEMORY_RANGE" },
        else => null,
    };
}
