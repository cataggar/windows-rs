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
    .{ "GetAppContainerNamedObjectPath", MethodRecord{ .library = "KERNEL32", .import = "GetAppContainerNamedObjectPath", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x81\x15\x09\x11\x05\x0f\x09" } },
    .{ "IsProcessInWDAGContainer", MethodRecord{ .library = "api-ms-win-security-isolatedcontainer-l1-1-1", .import = "IsProcessInWDAGContainer", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x11\x59" } },
    .{ "IsProcessInIsolatedContainer", MethodRecord{ .library = "api-ms-win-security-isolatedcontainer-l1-1-0", .import = "IsProcessInIsolatedContainer", .signature = "\x00\x01\x11\x79\x0f\x11\x59" } },
    .{ "IsProcessInIsolatedWindowsEnvironment", MethodRecord{ .library = "IsolatedWindowsEnvironmentUtils", .import = "IsProcessInIsolatedWindowsEnvironment", .signature = "\x00\x01\x11\x79\x0f\x11\x59" } },
    .{ "IsCrossIsolatedEnvironmentClipboardContent", MethodRecord{ .library = "IsolatedWindowsEnvironmentUtils", .import = "IsCrossIsolatedEnvironmentClipboardContent", .signature = "\x00\x01\x11\x79\x0f\x11\x59" } },
    .{ "CreateAppContainerProfile", MethodRecord{ .library = "USERENV", .import = "CreateAppContainerProfile", .signature = "\x00\x06\x11\x79\x11\x05\x11\x05\x11\x05\x0f\x11\x9d\x1d\x09\x0f\x11\x81\x15" } },
    .{ "DeleteAppContainerProfile", MethodRecord{ .library = "USERENV", .import = "DeleteAppContainerProfile", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "GetAppContainerRegistryLocation", MethodRecord{ .library = "USERENV", .import = "GetAppContainerRegistryLocation", .signature = "\x00\x02\x11\x79\x09\x0f\x11\x55" } },
    .{ "GetAppContainerFolderPath", MethodRecord{ .library = "USERENV", .import = "GetAppContainerFolderPath", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName", MethodRecord{ .library = "USERENV", .import = "DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName", .signature = "\x00\x03\x11\x79\x11\x81\x15\x11\x05\x0f\x11\x81\x15" } },
    .{ "DeriveAppContainerSidFromAppContainerName", MethodRecord{ .library = "USERENV", .import = "DeriveAppContainerSidFromAppContainerName", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x81\x15" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x55 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "HKEY" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x115 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSID" },
        0x1d1d => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SID_AND_ATTRIBUTES" },
        else => null,
    };
}

