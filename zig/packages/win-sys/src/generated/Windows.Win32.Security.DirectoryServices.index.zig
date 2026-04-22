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
    .{ "DSCreateISecurityInfoObject", MethodRecord{ .library = "DSSEC", .import = "DSCreateISecurityInfoObject", .signature = "\x00\x07\x11\x79\x11\x05\x11\x05\x09\x0f\x12\xbc\x3d\x12\xbc\x91\x12\xbc\x95\x11\x82\x2d" } },
    .{ "DSCreateISecurityInfoObjectEx", MethodRecord{ .library = "DSSEC", .import = "DSCreateISecurityInfoObjectEx", .signature = "\x00\x0a\x11\x79\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x09\x0f\x12\xbc\x3d\x12\xbc\x91\x12\xbc\x95\x11\x82\x2d" } },
    .{ "DSCreateSecurityPage", MethodRecord{ .library = "DSSEC", .import = "DSCreateSecurityPage", .signature = "\x00\x07\x11\x79\x11\x05\x11\x05\x09\x0f\x11\x83\x31\x12\xbc\x91\x12\xbc\x95\x11\x82\x2d" } },
    .{ "DSEditSecurity", MethodRecord{ .library = "DSSEC", .import = "DSEditSecurity", .signature = "\x00\x08\x11\x79\x11\x25\x11\x05\x11\x05\x09\x11\x05\x12\xbc\x91\x12\xbc\x95\x11\x82\x2d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x331 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls", .name = "HPROPSHEETPAGE" },
        0x3c3d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization.UI", .name = "ISecurityInformation" },
        0x3c91 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DirectoryServices", .name = "PFNREADOBJECTSECURITY" },
        0x3c95 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DirectoryServices", .name = "PFNWRITEOBJECTSECURITY" },
        else => null,
    };
}

pub const DSSI_READ_ONLY = 1;
pub const DSSI_NO_ACCESS_CHECK = 2;
pub const DSSI_NO_EDIT_SACL = 4;
pub const DSSI_NO_EDIT_OWNER = 8;
pub const DSSI_IS_ROOT = 16;
pub const DSSI_NO_FILTER = 32;
pub const DSSI_NO_READONLY_MESSAGE = 64;
