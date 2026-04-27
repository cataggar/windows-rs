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
    .{ "MSChapSrvChangePassword", MethodRecord{ .library = "ADVAPI32", .import = "MSChapSrvChangePassword", .signature = "\x00\x07\x09\x11\x05\x11\x05\x11\x87\x79\x0f\x11\xc0\x00\x7d\x35\x0f\x11\xc0\x00\x7d\x35\x0f\x11\xc0\x00\x7d\x35\x0f\x11\xc0\x00\x7d\x35" } },
    .{ "MSChapSrvChangePassword2", MethodRecord{ .library = "ADVAPI32", .import = "MSChapSrvChangePassword2", .signature = "\x00\x07\x09\x11\x05\x11\x05\x0f\x11\xc0\x00\xd3\x6c\x0f\x11\xc0\x00\xd3\x70\x11\x87\x79\x0f\x11\xc0\x00\xd3\x6c\x0f\x11\xc0\x00\xd3\x70" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0x7d35 => TypeRefEntry{ .namespace = "Windows.Win32.System.PasswordManagement", .name = "LM_OWF_PASSWORD" },
        0xd36c => TypeRefEntry{ .namespace = "Windows.Win32.System.PasswordManagement", .name = "SAMPR_ENCRYPTED_USER_PASSWORD" },
        0xd370 => TypeRefEntry{ .namespace = "Windows.Win32.System.PasswordManagement", .name = "ENCRYPTED_LM_OWF_PASSWORD" },
        else => null,
    };
}

