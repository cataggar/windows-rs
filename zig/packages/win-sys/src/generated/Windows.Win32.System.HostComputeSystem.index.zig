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
    .{ "HcsEnumerateComputeSystems", MethodRecord{ .library = "computecore", .import = "HcsEnumerateComputeSystems", .signature = "\x00\x02\x11\x79\x11\x05\x11\xa2\x7c" } },
    .{ "HcsEnumerateComputeSystemsInNamespace", MethodRecord{ .library = "computecore", .import = "HcsEnumerateComputeSystemsInNamespace", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x11\xa2\x7c" } },
    .{ "HcsCreateOperation", MethodRecord{ .library = "computecore", .import = "HcsCreateOperation", .signature = "\x00\x02\x11\xa2\x7c\x0f\x01\x12\xc0\x00\x9f\xac" } },
    .{ "HcsCreateOperationWithNotifications", MethodRecord{ .library = "computecore", .import = "HcsCreateOperationWithNotifications", .signature = "\x00\x03\x11\xa2\x7c\x11\xc0\x00\x79\xc9\x0f\x01\x12\xc0\x00\x9f\xc0" } },
    .{ "HcsCloseOperation", MethodRecord{ .library = "computecore", .import = "HcsCloseOperation", .signature = "\x00\x01\x01\x11\xa2\x7c" } },
    .{ "HcsGetOperationContext", MethodRecord{ .library = "computecore", .import = "HcsGetOperationContext", .signature = "\x00\x01\x0f\x01\x11\xa2\x7c" } },
    .{ "HcsSetOperationContext", MethodRecord{ .library = "computecore", .import = "HcsSetOperationContext", .signature = "\x00\x02\x11\x79\x11\xa2\x7c\x0f\x01" } },
    .{ "HcsGetComputeSystemFromOperation", MethodRecord{ .library = "computecore", .import = "HcsGetComputeSystemFromOperation", .signature = "\x00\x01\x11\xc0\x00\x42\x79\x11\xa2\x7c" } },
    .{ "HcsGetProcessFromOperation", MethodRecord{ .library = "computecore", .import = "HcsGetProcessFromOperation", .signature = "\x00\x01\x11\xa2\x84\x11\xa2\x7c" } },
    .{ "HcsGetOperationType", MethodRecord{ .library = "computecore", .import = "HcsGetOperationType", .signature = "\x00\x01\x11\xc0\x00\x79\xbd\x11\xa2\x7c" } },
    .{ "HcsGetOperationId", MethodRecord{ .library = "computecore", .import = "HcsGetOperationId", .signature = "\x00\x01\x0b\x11\xa2\x7c" } },
    .{ "HcsGetOperationResult", MethodRecord{ .library = "computecore", .import = "HcsGetOperationResult", .signature = "\x00\x02\x11\x79\x11\xa2\x7c\x0f\x11\x05" } },
    .{ "HcsGetOperationResultAndProcessInfo", MethodRecord{ .library = "computecore", .import = "HcsGetOperationResultAndProcessInfo", .signature = "\x00\x03\x11\x79\x11\xa2\x7c\x0f\x11\xc0\x00\x9f\xd4\x0f\x11\x05" } },
    .{ "HcsAddResourceToOperation", MethodRecord{ .library = "computecore", .import = "HcsAddResourceToOperation", .signature = "\x00\x04\x11\x79\x11\xa2\x7c\x11\xc0\x00\x79\xcd\x11\x05\x11\x80\x85" } },
    .{ "HcsGetProcessorCompatibilityFromSavedState", MethodRecord{ .library = "computecore", .import = "HcsGetProcessorCompatibilityFromSavedState", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "HcsWaitForOperationResult", MethodRecord{ .library = "computecore", .import = "HcsWaitForOperationResult", .signature = "\x00\x03\x11\x79\x11\xa2\x7c\x09\x0f\x11\x05" } },
    .{ "HcsWaitForOperationResultAndProcessInfo", MethodRecord{ .library = "computecore", .import = "HcsWaitForOperationResultAndProcessInfo", .signature = "\x00\x04\x11\x79\x11\xa2\x7c\x09\x0f\x11\xc0\x00\x9f\xd4\x0f\x11\x05" } },
    .{ "HcsSetOperationCallback", MethodRecord{ .library = "computecore", .import = "HcsSetOperationCallback", .signature = "\x00\x03\x11\x79\x11\xa2\x7c\x0f\x01\x12\xc0\x00\x9f\xac" } },
    .{ "HcsCancelOperation", MethodRecord{ .library = "computecore", .import = "HcsCancelOperation", .signature = "\x00\x01\x11\x79\x11\xa2\x7c" } },
    .{ "HcsGetOperationProperties", MethodRecord{ .library = "computecore", .import = "HcsGetOperationProperties", .signature = "\x00\x03\x11\x79\x11\xa2\x7c\x11\x05\x0f\x11\x05" } },
    .{ "HcsCreateComputeSystem", MethodRecord{ .library = "computecore", .import = "HcsCreateComputeSystem", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x11\xa2\x7c\x0f\x11\xc0\x00\x79\xdd\x0f\x11\xc0\x00\x42\x79" } },
    .{ "HcsCreateComputeSystemInNamespace", MethodRecord{ .library = "computecore", .import = "HcsCreateComputeSystemInNamespace", .signature = "\x00\x06\x11\x79\x11\x05\x11\x05\x11\x05\x11\xa2\x7c\x0f\x11\xc0\x00\x79\xd9\x0f\x11\xc0\x00\x42\x79" } },
    .{ "HcsOpenComputeSystem", MethodRecord{ .library = "computecore", .import = "HcsOpenComputeSystem", .signature = "\x00\x03\x11\x79\x11\x05\x09\x0f\x11\xc0\x00\x42\x79" } },
    .{ "HcsOpenComputeSystemInNamespace", MethodRecord{ .library = "computecore", .import = "HcsOpenComputeSystemInNamespace", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x09\x0f\x11\xc0\x00\x42\x79" } },
    .{ "HcsCloseComputeSystem", MethodRecord{ .library = "computecore", .import = "HcsCloseComputeSystem", .signature = "\x00\x01\x01\x11\xc0\x00\x42\x79" } },
    .{ "HcsStartComputeSystem", MethodRecord{ .library = "computecore", .import = "HcsStartComputeSystem", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x42\x79\x11\xa2\x7c\x11\x05" } },
    .{ "HcsShutDownComputeSystem", MethodRecord{ .library = "computecore", .import = "HcsShutDownComputeSystem", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x42\x79\x11\xa2\x7c\x11\x05" } },
    .{ "HcsTerminateComputeSystem", MethodRecord{ .library = "computecore", .import = "HcsTerminateComputeSystem", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x42\x79\x11\xa2\x7c\x11\x05" } },
    .{ "HcsCrashComputeSystem", MethodRecord{ .library = "computecore", .import = "HcsCrashComputeSystem", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x42\x79\x11\xa2\x7c\x11\x05" } },
    .{ "HcsPauseComputeSystem", MethodRecord{ .library = "computecore", .import = "HcsPauseComputeSystem", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x42\x79\x11\xa2\x7c\x11\x05" } },
    .{ "HcsResumeComputeSystem", MethodRecord{ .library = "computecore", .import = "HcsResumeComputeSystem", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x42\x79\x11\xa2\x7c\x11\x05" } },
    .{ "HcsSaveComputeSystem", MethodRecord{ .library = "computecore", .import = "HcsSaveComputeSystem", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x42\x79\x11\xa2\x7c\x11\x05" } },
    .{ "HcsGetComputeSystemProperties", MethodRecord{ .library = "computecore", .import = "HcsGetComputeSystemProperties", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x42\x79\x11\xa2\x7c\x11\x05" } },
    .{ "HcsModifyComputeSystem", MethodRecord{ .library = "computecore", .import = "HcsModifyComputeSystem", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x42\x79\x11\xa2\x7c\x11\x05\x11\x80\x85" } },
    .{ "HcsWaitForComputeSystemExit", MethodRecord{ .library = "computecore", .import = "HcsWaitForComputeSystemExit", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x42\x79\x09\x0f\x11\x05" } },
    .{ "HcsSetComputeSystemCallback", MethodRecord{ .library = "computecore", .import = "HcsSetComputeSystemCallback", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x42\x79\x11\xc0\x00\x79\xc5\x0f\x01\x12\xc0\x00\x9f\xc0" } },
    .{ "HcsInitializeLiveMigrationOnSource", MethodRecord{ .library = "computecore", .import = "HcsInitializeLiveMigrationOnSource", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x42\x79\x11\xa2\x7c\x11\x05" } },
    .{ "HcsStartLiveMigrationOnSource", MethodRecord{ .library = "computecore", .import = "HcsStartLiveMigrationOnSource", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x42\x79\x11\xa2\x7c\x11\x05" } },
    .{ "HcsStartLiveMigrationTransfer", MethodRecord{ .library = "computecore", .import = "HcsStartLiveMigrationTransfer", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x42\x79\x11\xa2\x7c\x11\x05" } },
    .{ "HcsFinalizeLiveMigration", MethodRecord{ .library = "computecore", .import = "HcsFinalizeLiveMigration", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x42\x79\x11\xa2\x7c\x11\x05" } },
    .{ "HcsCreateProcess", MethodRecord{ .library = "computecore", .import = "HcsCreateProcess", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x42\x79\x11\x05\x11\xa2\x7c\x0f\x11\xc0\x00\x79\xdd\x0f\x11\xa2\x84" } },
    .{ "HcsOpenProcess", MethodRecord{ .library = "computecore", .import = "HcsOpenProcess", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x42\x79\x09\x09\x0f\x11\xa2\x84" } },
    .{ "HcsCloseProcess", MethodRecord{ .library = "computecore", .import = "HcsCloseProcess", .signature = "\x00\x01\x01\x11\xa2\x84" } },
    .{ "HcsTerminateProcess", MethodRecord{ .library = "computecore", .import = "HcsTerminateProcess", .signature = "\x00\x03\x11\x79\x11\xa2\x84\x11\xa2\x7c\x11\x05" } },
    .{ "HcsSignalProcess", MethodRecord{ .library = "computecore", .import = "HcsSignalProcess", .signature = "\x00\x03\x11\x79\x11\xa2\x84\x11\xa2\x7c\x11\x05" } },
    .{ "HcsGetProcessInfo", MethodRecord{ .library = "computecore", .import = "HcsGetProcessInfo", .signature = "\x00\x02\x11\x79\x11\xa2\x84\x11\xa2\x7c" } },
    .{ "HcsGetProcessProperties", MethodRecord{ .library = "computecore", .import = "HcsGetProcessProperties", .signature = "\x00\x03\x11\x79\x11\xa2\x84\x11\xa2\x7c\x11\x05" } },
    .{ "HcsModifyProcess", MethodRecord{ .library = "computecore", .import = "HcsModifyProcess", .signature = "\x00\x03\x11\x79\x11\xa2\x84\x11\xa2\x7c\x11\x05" } },
    .{ "HcsSetProcessCallback", MethodRecord{ .library = "computecore", .import = "HcsSetProcessCallback", .signature = "\x00\x04\x11\x79\x11\xa2\x84\x11\xc0\x00\x79\xc5\x0f\x01\x12\xc0\x00\x9f\xc0" } },
    .{ "HcsWaitForProcessExit", MethodRecord{ .library = "computecore", .import = "HcsWaitForProcessExit", .signature = "\x00\x03\x11\x79\x11\xa2\x84\x09\x0f\x11\x05" } },
    .{ "HcsGetServiceProperties", MethodRecord{ .library = "computecore", .import = "HcsGetServiceProperties", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "HcsModifyServiceSettings", MethodRecord{ .library = "computecore", .import = "HcsModifyServiceSettings", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "HcsSubmitWerReport", MethodRecord{ .library = "computecore", .import = "HcsSubmitWerReport", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "HcsCreateEmptyGuestStateFile", MethodRecord{ .library = "computecore", .import = "HcsCreateEmptyGuestStateFile", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "HcsCreateEmptyRuntimeStateFile", MethodRecord{ .library = "computecore", .import = "HcsCreateEmptyRuntimeStateFile", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "HcsGrantVmAccess", MethodRecord{ .library = "computecore", .import = "HcsGrantVmAccess", .signature = "\x00\x02\x11\x79\x11\x05\x11\x05" } },
    .{ "HcsRevokeVmAccess", MethodRecord{ .library = "computecore", .import = "HcsRevokeVmAccess", .signature = "\x00\x02\x11\x79\x11\x05\x11\x05" } },
    .{ "HcsGrantVmGroupAccess", MethodRecord{ .library = "computecore", .import = "HcsGrantVmGroupAccess", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "HcsRevokeVmGroupAccess", MethodRecord{ .library = "computecore", .import = "HcsRevokeVmGroupAccess", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "HcsImportLayer", MethodRecord{ .library = "computestorage", .import = "HcsImportLayer", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x11\x05" } },
    .{ "HcsExportLayer", MethodRecord{ .library = "computestorage", .import = "HcsExportLayer", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "HcsExportLegacyWritableLayer", MethodRecord{ .library = "computestorage", .import = "HcsExportLegacyWritableLayer", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "HcsDestroyLayer", MethodRecord{ .library = "computestorage", .import = "HcsDestroyLayer", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "HcsSetupBaseOSLayer", MethodRecord{ .library = "computestorage", .import = "HcsSetupBaseOSLayer", .signature = "\x00\x03\x11\x79\x11\x05\x11\x80\x85\x11\x05" } },
    .{ "HcsInitializeWritableLayer", MethodRecord{ .library = "computestorage", .import = "HcsInitializeWritableLayer", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x11\x05" } },
    .{ "HcsInitializeLegacyWritableLayer", MethodRecord{ .library = "computestorage", .import = "HcsInitializeLegacyWritableLayer", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "HcsAttachLayerStorageFilter", MethodRecord{ .library = "computestorage", .import = "HcsAttachLayerStorageFilter", .signature = "\x00\x02\x11\x79\x11\x05\x11\x05" } },
    .{ "HcsDetachLayerStorageFilter", MethodRecord{ .library = "computestorage", .import = "HcsDetachLayerStorageFilter", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "HcsFormatWritableLayerVhd", MethodRecord{ .library = "computestorage", .import = "HcsFormatWritableLayerVhd", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "HcsGetLayerVhdMountPath", MethodRecord{ .library = "computestorage", .import = "HcsGetLayerVhdMountPath", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\x05" } },
    .{ "HcsSetupBaseOSVolume", MethodRecord{ .library = "computestorage", .import = "HcsSetupBaseOSVolume", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x11\x05" } },
    .{ "HcsAttachOverlayFilter", MethodRecord{ .library = "computestorage", .import = "HcsAttachOverlayFilter", .signature = "\x00\x02\x11\x79\x11\x05\x11\x05" } },
    .{ "HcsDetachOverlayFilter", MethodRecord{ .library = "computestorage", .import = "HcsDetachOverlayFilter", .signature = "\x00\x02\x11\x79\x11\x05\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x227c => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeSystem", .name = "HCS_OPERATION" },
        0x2284 => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeSystem", .name = "HCS_PROCESS" },
        0x4279 => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeSystem", .name = "HCS_SYSTEM" },
        0x79bd => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeSystem", .name = "HCS_OPERATION_TYPE" },
        0x79c5 => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeSystem", .name = "HCS_EVENT_OPTIONS" },
        0x79c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeSystem", .name = "HCS_OPERATION_OPTIONS" },
        0x79cd => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeSystem", .name = "HCS_RESOURCE_TYPE" },
        0x79d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeSystem", .name = "HCS_CREATE_OPTIONS" },
        0x79dd => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_DESCRIPTOR" },
        0x9fac => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeSystem", .name = "HCS_OPERATION_COMPLETION" },
        0x9fc0 => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeSystem", .name = "HCS_EVENT_CALLBACK" },
        0x9fd4 => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeSystem", .name = "HCS_PROCESS_INFORMATION" },
        else => null,
    };
}

pub const HcsOperationTypeNone = -1;
pub const HcsOperationTypeEnumerate = 0;
pub const HcsOperationTypeCreate = 1;
pub const HcsOperationTypeStart = 2;
pub const HcsOperationTypeShutdown = 3;
pub const HcsOperationTypePause = 4;
pub const HcsOperationTypeResume = 5;
pub const HcsOperationTypeSave = 6;
pub const HcsOperationTypeTerminate = 7;
pub const HcsOperationTypeModify = 8;
pub const HcsOperationTypeGetProperties = 9;
pub const HcsOperationTypeCreateProcess = 10;
pub const HcsOperationTypeSignalProcess = 11;
pub const HcsOperationTypeGetProcessInfo = 12;
pub const HcsOperationTypeGetProcessProperties = 13;
pub const HcsOperationTypeModifyProcess = 14;
pub const HcsOperationTypeCrash = 15;
pub const HcsOperationTypeLiveMigration = 19;
pub const HcsOperationTypeReserved1 = 16;
pub const HcsOperationTypeReserved2 = 17;
pub const HcsOperationTypeReserved3 = 18;
pub const HcsEventInvalid = 0;
pub const HcsEventSystemExited = 1;
pub const HcsEventSystemCrashInitiated = 2;
pub const HcsEventSystemCrashReport = 3;
pub const HcsEventSystemRdpEnhancedModeStateChanged = 4;
pub const HcsEventSystemSiloJobCreated = 5;
pub const HcsEventSystemGuestConnectionClosed = 6;
pub const HcsEventProcessExited = 65536;
pub const HcsEventOperationCallback = 16777216;
pub const HcsEventServiceDisconnect = 33554432;
pub const HcsEventGroupVmLifecycle = -2147483646;
pub const HcsEventGroupLiveMigration = -2147483645;
pub const HcsEventGroupOperationInfo = -1073741823;
pub const HcsEventOptionNone = 0;
pub const HcsEventOptionEnableOperationCallbacks = 1;
pub const HcsEventOptionEnableVmLifecycle = 2;
pub const HcsEventOptionEnableLiveMigrationEvents = 4;
pub const HcsOperationOptionNone = 0;
pub const HcsOperationOptionProgressUpdate = 1;
pub const HcsOperationOptionReserved1 = 2;
pub const HcsResourceTypeNone = 0;
pub const HcsResourceTypeFile = 1;
pub const HcsResourceTypeJob = 2;
pub const HcsResourceTypeComObject = 3;
pub const HcsResourceTypeSocket = 4;
pub const HcsNotificationFlagSuccess = 0;
pub const HcsNotificationFlagFailure = -2147483648;
pub const HcsNotificationInvalid = 0;
pub const HcsNotificationSystemExited = 1;
pub const HcsNotificationSystemCreateCompleted = 2;
pub const HcsNotificationSystemStartCompleted = 3;
pub const HcsNotificationSystemPauseCompleted = 4;
pub const HcsNotificationSystemResumeCompleted = 5;
pub const HcsNotificationSystemCrashReport = 6;
pub const HcsNotificationSystemSiloJobCreated = 7;
pub const HcsNotificationSystemSaveCompleted = 8;
pub const HcsNotificationSystemRdpEnhancedModeStateChanged = 9;
pub const HcsNotificationSystemShutdownFailed = 10;
pub const HcsNotificationSystemShutdownCompleted = 10;
pub const HcsNotificationSystemGetPropertiesCompleted = 11;
pub const HcsNotificationSystemModifyCompleted = 12;
pub const HcsNotificationSystemCrashInitiated = 13;
pub const HcsNotificationSystemGuestConnectionClosed = 14;
pub const HcsNotificationSystemOperationCompletion = 15;
pub const HcsNotificationSystemPassThru = 16;
pub const HcsNotificationOperationProgressUpdate = 256;
pub const HcsNotificationProcessExited = 65536;
pub const HcsNotificationServiceDisconnect = 16777216;
pub const HcsNotificationFlagsReserved = -268435456;
pub const HcsCreateOptions_1 = 65536;

pub const aliases = struct {
    pub const HCS_OPERATION_TYPE = i32;
    pub const HCS_EVENT_TYPE = i32;
    pub const HCS_EVENT_OPTIONS = i32;
    pub const HCS_OPERATION_OPTIONS = i32;
    pub const HCS_RESOURCE_TYPE = i32;
    pub const HCS_NOTIFICATION_FLAGS = i32;
    pub const HCS_NOTIFICATIONS = i32;
    pub const HCS_CREATE_OPTIONS = i32;
    pub const HCS_OPERATION = ?*anyopaque;
    pub const HCS_SYSTEM = ?*anyopaque;
    pub const HCS_PROCESS = ?*anyopaque;
    pub const HCS_OPERATION_COMPLETION = ?*const anyopaque;
    pub const HCS_EVENT_CALLBACK = ?*const anyopaque;
    pub const HCS_NOTIFICATION_CALLBACK = ?*const anyopaque;
};
