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
    .{ "FhServiceOpenPipe", MethodRecord{ .library = "fhsvcctl", .import = "FhServiceOpenPipe", .signature = "\x00\x02\x11\x79\x11\x59\x0f\x11\xbd\xdd" } },
    .{ "FhServiceClosePipe", MethodRecord{ .library = "fhsvcctl", .import = "FhServiceClosePipe", .signature = "\x00\x01\x11\x79\x11\xbd\xdd" } },
    .{ "FhServiceStartBackup", MethodRecord{ .library = "fhsvcctl", .import = "FhServiceStartBackup", .signature = "\x00\x02\x11\x79\x11\xbd\xdd\x11\x59" } },
    .{ "FhServiceStopBackup", MethodRecord{ .library = "fhsvcctl", .import = "FhServiceStopBackup", .signature = "\x00\x02\x11\x79\x11\xbd\xdd\x11\x59" } },
    .{ "FhServiceReloadConfiguration", MethodRecord{ .library = "fhsvcctl", .import = "FhServiceReloadConfiguration", .signature = "\x00\x01\x11\x79\x11\xbd\xdd" } },
    .{ "FhServiceBlockBackup", MethodRecord{ .library = "fhsvcctl", .import = "FhServiceBlockBackup", .signature = "\x00\x01\x11\x79\x11\xbd\xdd" } },
    .{ "FhServiceUnblockBackup", MethodRecord{ .library = "fhsvcctl", .import = "FhServiceUnblockBackup", .signature = "\x00\x01\x11\x79\x11\xbd\xdd" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x3ddd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileHistory", .name = "FH_SERVICE_PIPE_HANDLE" },
        else => null,
    };
}

pub const FHCFG_E_CORRUPT_CONFIG_FILE = -2147220736;
pub const FHCFG_E_CONFIG_FILE_NOT_FOUND = -2147220735;
pub const FHCFG_E_CONFIG_ALREADY_EXISTS = -2147220734;
pub const FHCFG_E_NO_VALID_CONFIGURATION_LOADED = -2147220733;
pub const FHCFG_E_TARGET_NOT_CONNECTED = -2147220732;
pub const FHCFG_E_CONFIGURATION_PREVIOUSLY_LOADED = -2147220731;
pub const FHCFG_E_TARGET_VERIFICATION_FAILED = -2147220730;
pub const FHCFG_E_TARGET_NOT_CONFIGURED = -2147220729;
pub const FHCFG_E_TARGET_NOT_ENOUGH_FREE_SPACE = -2147220728;
pub const FHCFG_E_TARGET_CANNOT_BE_USED = -2147220727;
pub const FHCFG_E_INVALID_REHYDRATION_STATE = -2147220726;
pub const FHCFG_E_RECOMMENDATION_CHANGE_NOT_ALLOWED = -2147220720;
pub const FHCFG_E_TARGET_REHYDRATED_ELSEWHERE = -2147220719;
pub const FHCFG_E_LEGACY_TARGET_UNSUPPORTED = -2147220718;
pub const FHCFG_E_LEGACY_TARGET_VALIDATION_UNSUPPORTED = -2147220717;
pub const FHCFG_E_LEGACY_BACKUP_USER_EXCLUDED = -2147220716;
pub const FHCFG_E_LEGACY_BACKUP_NOT_FOUND = -2147220715;
pub const FHSVC_E_BACKUP_BLOCKED = -2147219968;
pub const FHSVC_E_NOT_CONFIGURED = -2147219967;
pub const FHSVC_E_CONFIG_DISABLED = -2147219966;
pub const FHSVC_E_CONFIG_DISABLED_GP = -2147219965;
pub const FHSVC_E_FATAL_CONFIG_ERROR = -2147219964;
pub const FHSVC_E_CONFIG_REHYDRATING = -2147219963;
pub const FH_STATE_NOT_TRACKED = 0;
pub const FH_STATE_OFF = 1;
pub const FH_STATE_DISABLED_BY_GP = 2;
pub const FH_STATE_FATAL_CONFIG_ERROR = 3;
pub const FH_STATE_MIGRATING = 4;
pub const FH_STATE_REHYDRATING = 5;
pub const FH_STATE_TARGET_FS_LIMITATION = 13;
pub const FH_STATE_TARGET_ACCESS_DENIED = 14;
pub const FH_STATE_TARGET_VOLUME_DIRTY = 15;
pub const FH_STATE_TARGET_FULL_RETENTION_MAX = 16;
pub const FH_STATE_TARGET_FULL = 17;
pub const FH_STATE_STAGING_FULL = 18;
pub const FH_STATE_TARGET_LOW_SPACE_RETENTION_MAX = 19;
pub const FH_STATE_TARGET_LOW_SPACE = 20;
pub const FH_STATE_TARGET_ABSENT = 21;
pub const FH_STATE_TOO_MUCH_BEHIND = 240;
pub const FH_STATE_NO_ERROR = 255;
pub const FH_STATE_BACKUP_NOT_SUPPORTED = 2064;
pub const FH_STATE_RUNNING = 256;
pub const FH_TARGET_NAME = 0;
pub const FH_TARGET_URL = 1;
pub const FH_TARGET_DRIVE_TYPE = 2;
pub const MAX_TARGET_PROPERTY = 3;
pub const FH_DRIVE_UNKNOWN = 0;
pub const FH_DRIVE_REMOVABLE = 2;
pub const FH_DRIVE_FIXED = 3;
pub const FH_DRIVE_REMOTE = 4;
pub const FH_FOLDER = 0;
pub const FH_LIBRARY = 1;
pub const MAX_PROTECTED_ITEM_CATEGORY = 2;
pub const FH_FREQUENCY = 0;
pub const FH_RETENTION_TYPE = 1;
pub const FH_RETENTION_AGE = 2;
pub const MAX_LOCAL_POLICY = 3;
pub const FH_RETENTION_DISABLED = 0;
pub const FH_RETENTION_UNLIMITED = 1;
pub const FH_RETENTION_AGE_BASED = 2;
pub const MAX_RETENTION_TYPE = 3;
pub const FH_STATUS_DISABLED = 0;
pub const FH_STATUS_DISABLED_BY_GP = 1;
pub const FH_STATUS_ENABLED = 2;
pub const FH_STATUS_REHYDRATING = 3;
pub const MAX_BACKUP_STATUS = 4;
pub const FH_ACCESS_DENIED = 0;
pub const FH_INVALID_DRIVE_TYPE = 1;
pub const FH_READ_ONLY_PERMISSION = 2;
pub const FH_CURRENT_DEFAULT = 3;
pub const FH_NAMESPACE_EXISTS = 4;
pub const FH_TARGET_PART_OF_LIBRARY = 5;
pub const FH_VALID_TARGET = 6;
pub const MAX_VALIDATION_RESULT = 7;
pub const BackupInvalidStopReason = 0;
pub const BackupLimitUserBusyMachineOnAC = 1;
pub const BackupLimitUserIdleMachineOnDC = 2;
pub const BackupLimitUserBusyMachineOnDC = 3;
pub const BackupCancelled = 4;

pub const aliases = struct {
    pub const FH_TARGET_PROPERTY_TYPE = i32;
    pub const FH_TARGET_DRIVE_TYPES = i32;
    pub const FH_PROTECTED_ITEM_CATEGORY = i32;
    pub const FH_LOCAL_POLICY_TYPE = i32;
    pub const FH_RETENTION_TYPES = i32;
    pub const FH_BACKUP_STATUS = i32;
    pub const FH_DEVICE_VALIDATION_RESULT = i32;
    pub const FhBackupStopReason = i32;
    pub const FH_SERVICE_PIPE_HANDLE = ?*anyopaque;
};
