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
    .{ "OOBEComplete", MethodRecord{ .library = "KERNEL32", .import = "OOBEComplete", .signature = "\x00\x01\x11\x59\x0f\x11\x59" } },
    .{ "RegisterWaitUntilOOBECompleted", MethodRecord{ .library = "KERNEL32", .import = "RegisterWaitUntilOOBECompleted", .signature = "\x00\x03\x11\x59\x12\xc0\x01\x83\x3c\x0f\x01\x0f\x0f\x01" } },
    .{ "UnregisterWaitUntilOOBECompleted", MethodRecord{ .library = "KERNEL32", .import = "UnregisterWaitUntilOOBECompleted", .signature = "\x00\x01\x11\x59\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x1833c => TypeRefEntry{ .namespace = "Windows.Win32.System.SetupAndMigration", .name = "OOBE_COMPLETED_CALLBACK" },
        else => null,
    };
}

pub const aliases = struct {
    pub const OOBE_COMPLETED_CALLBACK = ?*const anyopaque;
};
