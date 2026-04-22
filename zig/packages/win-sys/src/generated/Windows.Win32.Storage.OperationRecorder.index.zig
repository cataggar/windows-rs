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
    .{ "OperationStart", MethodRecord{ .library = "ADVAPI32", .import = "OperationStart", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x02\x3d\x4c" } },
    .{ "OperationEnd", MethodRecord{ .library = "ADVAPI32", .import = "OperationEnd", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x02\x3d\x50" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x23d4c => TypeRefEntry{ .namespace = "Windows.Win32.Storage.OperationRecorder", .name = "OPERATION_START_PARAMETERS" },
        0x23d50 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.OperationRecorder", .name = "OPERATION_END_PARAMETERS" },
        else => null,
    };
}

pub const OPERATION_START_TRACE_CURRENT_THREAD = 1;
pub const OPERATION_END_DISCARD = 1;

pub const aliases = struct {
    pub const OPERATION_START_FLAGS = u32;
    pub const OPERATION_END_PARAMETERS_FLAGS = u32;
};
