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
    .{ "WslIsDistributionRegistered", MethodRecord{ .library = "Api-ms-win-wsl-api-l1-1-0", .import = "WslIsDistributionRegistered", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "WslRegisterDistribution", MethodRecord{ .library = "Api-ms-win-wsl-api-l1-1-0", .import = "WslRegisterDistribution", .signature = "\x00\x02\x11\x79\x11\x05\x11\x05" } },
    .{ "WslUnregisterDistribution", MethodRecord{ .library = "Api-ms-win-wsl-api-l1-1-0", .import = "WslUnregisterDistribution", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "WslConfigureDistribution", MethodRecord{ .library = "Api-ms-win-wsl-api-l1-1-0", .import = "WslConfigureDistribution", .signature = "\x00\x03\x11\x79\x11\x05\x09\x11\xc0\x00\xcb\x39" } },
    .{ "WslGetDistributionConfiguration", MethodRecord{ .library = "Api-ms-win-wsl-api-l1-1-0", .import = "WslGetDistributionConfiguration", .signature = "\x00\x06\x11\x79\x11\x05\x0f\x09\x0f\x09\x0f\x11\xc0\x00\xcb\x39\x0f\x0f\x11\x3d\x0f\x09" } },
    .{ "WslLaunchInteractive", MethodRecord{ .library = "Api-ms-win-wsl-api-l1-1-0", .import = "WslLaunchInteractive", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x11\x59\x0f\x09" } },
    .{ "WslLaunch", MethodRecord{ .library = "Api-ms-win-wsl-api-l1-1-0", .import = "WslLaunch", .signature = "\x00\x07\x11\x79\x11\x05\x11\x05\x11\x59\x11\x80\x85\x11\x80\x85\x11\x80\x85\x0f\x11\x80\x85" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0xcb39 => TypeRefEntry{ .namespace = "Windows.Win32.System.SubsystemForLinux", .name = "WSL_DISTRIBUTION_FLAGS" },
        else => null,
    };
}

pub const WSL_DISTRIBUTION_FLAGS_NONE = 0;
pub const WSL_DISTRIBUTION_FLAGS_ENABLE_INTEROP = 1;
pub const WSL_DISTRIBUTION_FLAGS_APPEND_NT_PATH = 2;
pub const WSL_DISTRIBUTION_FLAGS_ENABLE_DRIVE_MOUNTING = 4;

pub const aliases = struct {
    pub const WSL_DISTRIBUTION_FLAGS = i32;
};
