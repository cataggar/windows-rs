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
    .{ "SRSetRestorePointA", MethodRecord{ .library = "sfc", .import = "SRSetRestorePointA", .signature = "\x00\x02\x11\x59\x0f\x11\xc0\x00\x44\x51\x0f\x11\xc0\x00\x44\x55" } },
    .{ "SRSetRestorePointW", MethodRecord{ .library = "sfc", .import = "SRSetRestorePointW", .signature = "\x00\x02\x11\x59\x0f\x11\xc0\x00\x44\x59\x0f\x11\xc0\x00\x44\x55" } },
    .{ "SRRemoveRestorePoint", MethodRecord{ .library = "SrClient", .import = "SRRemoveRestorePoint", .signature = "\x00\x01\x09\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x4451 => TypeRefEntry{ .namespace = "Windows.Win32.System.Restore", .name = "RESTOREPOINTINFOA" },
        0x4455 => TypeRefEntry{ .namespace = "Windows.Win32.System.Restore", .name = "STATEMGRSTATUS" },
        0x4459 => TypeRefEntry{ .namespace = "Windows.Win32.System.Restore", .name = "RESTOREPOINTINFOW" },
        else => null,
    };
}

pub const APPLICATION_INSTALL = 0;
pub const APPLICATION_UNINSTALL = 1;
pub const DEVICE_DRIVER_INSTALL = 10;
pub const MODIFY_SETTINGS = 12;
pub const CANCELLED_OPERATION = 13;
pub const BEGIN_NESTED_SYSTEM_CHANGE = 102;
pub const BEGIN_SYSTEM_CHANGE = 100;
pub const END_NESTED_SYSTEM_CHANGE = 103;
pub const END_SYSTEM_CHANGE = 101;
pub const MIN_EVENT = 100;
pub const BEGIN_NESTED_SYSTEM_CHANGE_NORP = 104;
pub const MAX_EVENT = 104;
pub const MIN_RPT = 0;
pub const DESKTOP_SETTING = 2;
pub const ACCESSIBILITY_SETTING = 3;
pub const OE_SETTING = 4;
pub const APPLICATION_RUN = 5;
pub const RESTORE = 6;
pub const CHECKPOINT = 7;
pub const WINDOWS_SHUTDOWN = 8;
pub const WINDOWS_BOOT = 9;
pub const FIRSTRUN = 11;
pub const BACKUP_RECOVERY = 14;
pub const BACKUP = 15;
pub const MANUAL_CHECKPOINT = 16;
pub const WINDOWS_UPDATE = 17;
pub const CRITICAL_UPDATE = 18;
pub const MAX_RPT = 18;
pub const MAX_DESC = 64;
pub const MAX_DESC_W = 256;

pub const aliases = struct {
    pub const RESTOREPOINTINFO_TYPE = u32;
    pub const RESTOREPOINTINFO_EVENT_TYPE = u32;
};
