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
    .{ "CreateMailslotA", MethodRecord{ .library = "KERNEL32", .import = "CreateMailslotA", .signature = "\x00\x04\x11\x80\x85\x11\x3d\x09\x09\x0f\x11\x8b\xb5" } },
    .{ "CreateMailslotW", MethodRecord{ .library = "KERNEL32", .import = "CreateMailslotW", .signature = "\x00\x04\x11\x80\x85\x11\x05\x09\x09\x0f\x11\x8b\xb5" } },
    .{ "GetMailslotInfo", MethodRecord{ .library = "KERNEL32", .import = "GetMailslotInfo", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "SetMailslotInfo", MethodRecord{ .library = "KERNEL32", .import = "SetMailslotInfo", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        else => null,
    };
}

