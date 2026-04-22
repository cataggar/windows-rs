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
    .{ "RmStartSession", MethodRecord{ .library = "rstrtmgr", .import = "RmStartSession", .signature = "\x00\x03\x11\x81\x01\x0f\x09\x09\x11\x05" } },
    .{ "RmJoinSession", MethodRecord{ .library = "RstrtMgr", .import = "RmJoinSession", .signature = "\x00\x02\x11\x81\x01\x0f\x09\x11\x05" } },
    .{ "RmEndSession", MethodRecord{ .library = "rstrtmgr", .import = "RmEndSession", .signature = "\x00\x01\x11\x81\x01\x09" } },
    .{ "RmRegisterResources", MethodRecord{ .library = "rstrtmgr", .import = "RmRegisterResources", .signature = "\x00\x07\x11\x81\x01\x09\x09\x0f\x11\x05\x09\x0f\x11\x9a\xf5\x09\x0f\x11\x05" } },
    .{ "RmGetList", MethodRecord{ .library = "rstrtmgr", .import = "RmGetList", .signature = "\x00\x05\x11\x81\x01\x09\x0f\x09\x0f\x09\x0f\x11\x9a\xf9\x0f\x09" } },
    .{ "RmShutdown", MethodRecord{ .library = "rstrtmgr", .import = "RmShutdown", .signature = "\x00\x03\x11\x81\x01\x09\x09\x12\x9a\xfd" } },
    .{ "RmRestart", MethodRecord{ .library = "rstrtmgr", .import = "RmRestart", .signature = "\x00\x03\x11\x81\x01\x09\x09\x12\x9a\xfd" } },
    .{ "RmCancelCurrentTask", MethodRecord{ .library = "RstrtMgr", .import = "RmCancelCurrentTask", .signature = "\x00\x01\x11\x81\x01\x09" } },
    .{ "RmAddFilter", MethodRecord{ .library = "RstrtMgr", .import = "RmAddFilter", .signature = "\x00\x05\x11\x81\x01\x09\x11\x05\x0f\x11\x9a\xf5\x11\x05\x11\x9b\x01" } },
    .{ "RmRemoveFilter", MethodRecord{ .library = "RstrtMgr", .import = "RmRemoveFilter", .signature = "\x00\x04\x11\x81\x01\x09\x11\x05\x0f\x11\x9a\xf5\x11\x05" } },
    .{ "RmGetFilterList", MethodRecord{ .library = "RstrtMgr", .import = "RmGetFilterList", .signature = "\x00\x04\x11\x81\x01\x09\x0f\x05\x09\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x1af5 => TypeRefEntry{ .namespace = "Windows.Win32.System.RestartManager", .name = "RM_UNIQUE_PROCESS" },
        0x1af9 => TypeRefEntry{ .namespace = "Windows.Win32.System.RestartManager", .name = "RM_PROCESS_INFO" },
        0x1afd => TypeRefEntry{ .namespace = "Windows.Win32.System.RestartManager", .name = "RM_WRITE_STATUS_CALLBACK" },
        0x1b01 => TypeRefEntry{ .namespace = "Windows.Win32.System.RestartManager", .name = "RM_FILTER_ACTION" },
        else => null,
    };
}

pub const CCH_RM_SESSION_KEY = 32;
pub const CCH_RM_MAX_APP_NAME = 255;
pub const CCH_RM_MAX_SVC_NAME = 63;
pub const RM_INVALID_TS_SESSION = -1;
pub const RM_INVALID_PROCESS = -1;
pub const RmUnknownApp = 0;
pub const RmMainWindow = 1;
pub const RmOtherWindow = 2;
pub const RmService = 3;
pub const RmExplorer = 4;
pub const RmConsole = 5;
pub const RmCritical = 1000;
pub const RmForceShutdown = 1;
pub const RmShutdownOnlyRegistered = 16;
pub const RmStatusUnknown = 0;
pub const RmStatusRunning = 1;
pub const RmStatusStopped = 2;
pub const RmStatusStoppedOther = 4;
pub const RmStatusRestarted = 8;
pub const RmStatusErrorOnStop = 16;
pub const RmStatusErrorOnRestart = 32;
pub const RmStatusShutdownMasked = 64;
pub const RmStatusRestartMasked = 128;
pub const RmRebootReasonNone = 0;
pub const RmRebootReasonPermissionDenied = 1;
pub const RmRebootReasonSessionMismatch = 2;
pub const RmRebootReasonCriticalProcess = 4;
pub const RmRebootReasonCriticalService = 8;
pub const RmRebootReasonDetectedSelf = 16;
pub const RmFilterTriggerInvalid = 0;
pub const RmFilterTriggerFile = 1;
pub const RmFilterTriggerProcess = 2;
pub const RmFilterTriggerService = 3;
pub const RmInvalidFilterAction = 0;
pub const RmNoRestart = 1;
pub const RmNoShutdown = 2;

pub const aliases = struct {
    pub const RM_APP_TYPE = i32;
    pub const RM_SHUTDOWN_TYPE = i32;
    pub const RM_APP_STATUS = i32;
    pub const RM_REBOOT_REASON = i32;
    pub const RM_FILTER_TRIGGER = i32;
    pub const RM_FILTER_ACTION = i32;
    pub const RM_WRITE_STATUS_CALLBACK = ?*const anyopaque;
};
