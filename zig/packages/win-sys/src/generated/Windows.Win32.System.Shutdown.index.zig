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
    .{ "InitiateSystemShutdownA", MethodRecord{ .library = "ADVAPI32", .import = "InitiateSystemShutdownA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x09\x11\x59\x11\x59" } },
    .{ "InitiateSystemShutdownW", MethodRecord{ .library = "ADVAPI32", .import = "InitiateSystemShutdownW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x09\x11\x59\x11\x59" } },
    .{ "AbortSystemShutdownA", MethodRecord{ .library = "ADVAPI32", .import = "AbortSystemShutdownA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "AbortSystemShutdownW", MethodRecord{ .library = "ADVAPI32", .import = "AbortSystemShutdownW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "InitiateSystemShutdownExA", MethodRecord{ .library = "ADVAPI32", .import = "InitiateSystemShutdownExA", .signature = "\x00\x06\x11\x59\x11\x3d\x11\x3d\x09\x11\x59\x11\x59\x11\xa2\x7d" } },
    .{ "InitiateSystemShutdownExW", MethodRecord{ .library = "ADVAPI32", .import = "InitiateSystemShutdownExW", .signature = "\x00\x06\x11\x59\x11\x05\x11\x05\x09\x11\x59\x11\x59\x11\xa2\x7d" } },
    .{ "InitiateShutdownA", MethodRecord{ .library = "ADVAPI32", .import = "InitiateShutdownA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x09\x11\xa2\x81\x11\xa2\x7d" } },
    .{ "InitiateShutdownW", MethodRecord{ .library = "ADVAPI32", .import = "InitiateShutdownW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x09\x11\xa2\x81\x11\xa2\x7d" } },
    .{ "CheckForHiberboot", MethodRecord{ .library = "ADVAPI32", .import = "CheckForHiberboot", .signature = "\x00\x02\x09\x0f\x11\x87\x79\x11\x87\x79" } },
    .{ "ExitWindowsEx", MethodRecord{ .library = "USER32", .import = "ExitWindowsEx", .signature = "\x00\x02\x11\x59\x11\xa2\x85\x11\xa2\x7d" } },
    .{ "LockWorkStation", MethodRecord{ .library = "USER32", .import = "LockWorkStation", .signature = "\x00\x00\x11\x59" } },
    .{ "ShutdownBlockReasonCreate", MethodRecord{ .library = "USER32", .import = "ShutdownBlockReasonCreate", .signature = "\x00\x02\x11\x59\x11\x25\x11\x05" } },
    .{ "ShutdownBlockReasonQuery", MethodRecord{ .library = "USER32", .import = "ShutdownBlockReasonQuery", .signature = "\x00\x03\x11\x59\x11\x25\x11\x05\x0f\x09" } },
    .{ "ShutdownBlockReasonDestroy", MethodRecord{ .library = "USER32", .import = "ShutdownBlockReasonDestroy", .signature = "\x00\x01\x11\x59\x11\x25" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0x227d => TypeRefEntry{ .namespace = "Windows.Win32.System.Shutdown", .name = "SHUTDOWN_REASON" },
        0x2281 => TypeRefEntry{ .namespace = "Windows.Win32.System.Shutdown", .name = "SHUTDOWN_FLAGS" },
        0x2285 => TypeRefEntry{ .namespace = "Windows.Win32.System.Shutdown", .name = "EXIT_WINDOWS_FLAGS" },
        else => null,
    };
}

pub const SHTDN_REASON_NONE = 0;
pub const SHTDN_REASON_FLAG_COMMENT_REQUIRED = 16777216;
pub const SHTDN_REASON_FLAG_DIRTY_PROBLEM_ID_REQUIRED = 33554432;
pub const SHTDN_REASON_FLAG_CLEAN_UI = 67108864;
pub const SHTDN_REASON_FLAG_DIRTY_UI = 134217728;
pub const SHTDN_REASON_FLAG_MOBILE_UI_RESERVED = 268435456;
pub const SHTDN_REASON_FLAG_USER_DEFINED = 1073741824;
pub const SHTDN_REASON_FLAG_PLANNED = 2147483648;
pub const SHTDN_REASON_MAJOR_OTHER = 0;
pub const SHTDN_REASON_MAJOR_NONE = 0;
pub const SHTDN_REASON_MAJOR_HARDWARE = 65536;
pub const SHTDN_REASON_MAJOR_OPERATINGSYSTEM = 131072;
pub const SHTDN_REASON_MAJOR_SOFTWARE = 196608;
pub const SHTDN_REASON_MAJOR_APPLICATION = 262144;
pub const SHTDN_REASON_MAJOR_SYSTEM = 327680;
pub const SHTDN_REASON_MAJOR_POWER = 393216;
pub const SHTDN_REASON_MAJOR_LEGACY_API = 458752;
pub const SHTDN_REASON_MINOR_OTHER = 0;
pub const SHTDN_REASON_MINOR_NONE = 255;
pub const SHTDN_REASON_MINOR_MAINTENANCE = 1;
pub const SHTDN_REASON_MINOR_INSTALLATION = 2;
pub const SHTDN_REASON_MINOR_UPGRADE = 3;
pub const SHTDN_REASON_MINOR_RECONFIG = 4;
pub const SHTDN_REASON_MINOR_HUNG = 5;
pub const SHTDN_REASON_MINOR_UNSTABLE = 6;
pub const SHTDN_REASON_MINOR_DISK = 7;
pub const SHTDN_REASON_MINOR_PROCESSOR = 8;
pub const SHTDN_REASON_MINOR_NETWORKCARD = 9;
pub const SHTDN_REASON_MINOR_POWER_SUPPLY = 10;
pub const SHTDN_REASON_MINOR_CORDUNPLUGGED = 11;
pub const SHTDN_REASON_MINOR_ENVIRONMENT = 12;
pub const SHTDN_REASON_MINOR_HARDWARE_DRIVER = 13;
pub const SHTDN_REASON_MINOR_OTHERDRIVER = 14;
pub const SHTDN_REASON_MINOR_BLUESCREEN = 15;
pub const SHTDN_REASON_MINOR_SERVICEPACK = 16;
pub const SHTDN_REASON_MINOR_HOTFIX = 17;
pub const SHTDN_REASON_MINOR_SECURITYFIX = 18;
pub const SHTDN_REASON_MINOR_SECURITY = 19;
pub const SHTDN_REASON_MINOR_NETWORK_CONNECTIVITY = 20;
pub const SHTDN_REASON_MINOR_WMI = 21;
pub const SHTDN_REASON_MINOR_SERVICEPACK_UNINSTALL = 22;
pub const SHTDN_REASON_MINOR_HOTFIX_UNINSTALL = 23;
pub const SHTDN_REASON_MINOR_SECURITYFIX_UNINSTALL = 24;
pub const SHTDN_REASON_MINOR_MMC = 25;
pub const SHTDN_REASON_MINOR_SYSTEMRESTORE = 26;
pub const SHTDN_REASON_MINOR_TERMSRV = 32;
pub const SHTDN_REASON_MINOR_DC_PROMOTION = 33;
pub const SHTDN_REASON_MINOR_DC_DEMOTION = 34;
pub const SHTDN_REASON_UNKNOWN = 255;
pub const SHTDN_REASON_LEGACY_API = 2147942400;
pub const SHTDN_REASON_VALID_BIT_MASK = 3238002687;
pub const SHUTDOWN_FORCE_OTHERS = 1;
pub const SHUTDOWN_FORCE_SELF = 2;
pub const SHUTDOWN_RESTART = 4;
pub const SHUTDOWN_POWEROFF = 8;
pub const SHUTDOWN_NOREBOOT = 16;
pub const SHUTDOWN_GRACE_OVERRIDE = 32;
pub const SHUTDOWN_INSTALL_UPDATES = 64;
pub const SHUTDOWN_RESTARTAPPS = 128;
pub const SHUTDOWN_SKIP_SVC_PRESHUTDOWN = 256;
pub const SHUTDOWN_HYBRID = 512;
pub const SHUTDOWN_RESTART_BOOTOPTIONS = 1024;
pub const SHUTDOWN_SOFT_REBOOT = 2048;
pub const SHUTDOWN_MOBILE_UI = 4096;
pub const SHUTDOWN_ARSO = 8192;
pub const SHUTDOWN_CHECK_SAFE_FOR_SERVER = 16384;
pub const SHUTDOWN_VAIL_CONTAINER = 32768;
pub const SHUTDOWN_SYSTEM_INITIATED = 65536;
pub const SHUTDOWN_UPDATE_POWEROFF = 131072;
pub const EWX_LOGOFF = 0;
pub const EWX_SHUTDOWN = 1;
pub const EWX_REBOOT = 2;
pub const EWX_FORCE = 4;
pub const EWX_POWEROFF = 8;
pub const EWX_FORCEIFHUNG = 16;
pub const EWX_QUICKRESOLVE = 32;
pub const EWX_RESTARTAPPS = 64;
pub const EWX_HYBRID_SHUTDOWN = 4194304;
pub const EWX_BOOTOPTIONS = 16777216;
pub const EWX_ARSO = 67108864;
pub const EWX_CHECK_SAFE_FOR_SERVER = 134217728;
pub const EWX_SYSTEM_INITIATED = 268435456;
pub const MAX_REASON_NAME_LEN = 64;
pub const MAX_REASON_DESC_LEN = 256;
pub const MAX_REASON_BUGID_LEN = 32;
pub const MAX_REASON_COMMENT_LEN = 512;
pub const SHUTDOWN_TYPE_LEN = 32;
pub const POLICY_SHOWREASONUI_NEVER = 0;
pub const POLICY_SHOWREASONUI_ALWAYS = 1;
pub const POLICY_SHOWREASONUI_WORKSTATIONONLY = 2;
pub const POLICY_SHOWREASONUI_SERVERONLY = 3;
pub const SNAPSHOT_POLICY_NEVER = 0;
pub const SNAPSHOT_POLICY_ALWAYS = 1;
pub const SNAPSHOT_POLICY_UNPLANNED = 2;
pub const MAX_NUM_REASONS = 256;

pub const aliases = struct {
    pub const SHUTDOWN_REASON = u32;
    pub const SHUTDOWN_FLAGS = u32;
    pub const EXIT_WINDOWS_FLAGS = u32;
};
