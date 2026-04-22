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
    .{ "RegisterApplicationRecoveryCallback", MethodRecord{ .library = "KERNEL32", .import = "RegisterApplicationRecoveryCallback", .signature = "\x00\x04\x11\x79\x12\xc0\x02\x3a\x48\x0f\x01\x09\x09" } },
    .{ "UnregisterApplicationRecoveryCallback", MethodRecord{ .library = "KERNEL32", .import = "UnregisterApplicationRecoveryCallback", .signature = "\x00\x00\x11\x79" } },
    .{ "RegisterApplicationRestart", MethodRecord{ .library = "KERNEL32", .import = "RegisterApplicationRestart", .signature = "\x00\x02\x11\x79\x11\x05\x11\xa2\x2d" } },
    .{ "UnregisterApplicationRestart", MethodRecord{ .library = "KERNEL32", .import = "UnregisterApplicationRestart", .signature = "\x00\x00\x11\x79" } },
    .{ "GetApplicationRecoveryCallback", MethodRecord{ .library = "KERNEL32", .import = "GetApplicationRecoveryCallback", .signature = "\x00\x05\x11\x79\x11\x80\x85\x0f\x12\xc0\x02\x3a\x48\x0f\x0f\x01\x0f\x09\x0f\x09" } },
    .{ "GetApplicationRestartSettings", MethodRecord{ .library = "KERNEL32", .import = "GetApplicationRestartSettings", .signature = "\x00\x04\x11\x79\x11\x80\x85\x11\x05\x0f\x09\x0f\x09" } },
    .{ "ApplicationRecoveryInProgress", MethodRecord{ .library = "KERNEL32", .import = "ApplicationRecoveryInProgress", .signature = "\x00\x01\x11\x79\x0f\x11\x59" } },
    .{ "ApplicationRecoveryFinished", MethodRecord{ .library = "KERNEL32", .import = "ApplicationRecoveryFinished", .signature = "\x00\x01\x01\x11\x59" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x222d => TypeRefEntry{ .namespace = "Windows.Win32.System.Recovery", .name = "REGISTER_APPLICATION_RESTART_FLAGS" },
        0x23a48 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "APPLICATION_RECOVERY_CALLBACK" },
        else => null,
    };
}

pub const RESTART_NO_CRASH = 1;
pub const RESTART_NO_HANG = 2;
pub const RESTART_NO_PATCH = 4;
pub const RESTART_NO_REBOOT = 8;

pub const aliases = struct {
    pub const REGISTER_APPLICATION_RESTART_FLAGS = u32;
};
