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
    .{ "CallNtPowerInformation", MethodRecord{ .library = "POWRPROF", .import = "CallNtPowerInformation", .signature = "\x00\x05\x11\x84\x71\x11\xc0\x00\x43\xb1\x0f\x01\x09\x0f\x01\x09" } },
    .{ "GetPwrCapabilities", MethodRecord{ .library = "POWRPROF", .import = "GetPwrCapabilities", .signature = "\x00\x01\x11\x87\x79\x0f\x11\xc0\x00\x43\xb5" } },
    .{ "PowerDeterminePlatformRoleEx", MethodRecord{ .library = "POWRPROF", .import = "PowerDeterminePlatformRoleEx", .signature = "\x00\x01\x11\xc0\x00\x43\xb9\x11\xa2\x19" } },
    .{ "PowerRegisterSuspendResumeNotification", MethodRecord{ .library = "POWRPROF", .import = "PowerRegisterSuspendResumeNotification", .signature = "\x00\x03\x11\x81\x01\x11\xa7\x81\x11\x80\x85\x0f\x0f\x01" } },
    .{ "PowerUnregisterSuspendResumeNotification", MethodRecord{ .library = "POWRPROF", .import = "PowerUnregisterSuspendResumeNotification", .signature = "\x00\x01\x11\x81\x01\x11\xc0\x00\x43\xbd" } },
    .{ "PowerReadACValue", MethodRecord{ .library = "POWRPROF", .import = "PowerReadACValue", .signature = "\x00\x07\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "PowerReadDCValue", MethodRecord{ .library = "POWRPROF", .import = "PowerReadDCValue", .signature = "\x00\x07\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "PowerWriteACValueIndex", MethodRecord{ .library = "POWRPROF", .import = "PowerWriteACValueIndex", .signature = "\x00\x05\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x09" } },
    .{ "PowerWriteDCValueIndex", MethodRecord{ .library = "POWRPROF", .import = "PowerWriteDCValueIndex", .signature = "\x00\x05\x09\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x09" } },
    .{ "PowerGetActiveScheme", MethodRecord{ .library = "POWRPROF", .import = "PowerGetActiveScheme", .signature = "\x00\x02\x11\x81\x01\x11\x55\x0f\x0f\x11\x0d" } },
    .{ "PowerSetActiveScheme", MethodRecord{ .library = "POWRPROF", .import = "PowerSetActiveScheme", .signature = "\x00\x02\x11\x81\x01\x11\x55\x0f\x11\x0d" } },
    .{ "PowerSettingRegisterNotification", MethodRecord{ .library = "POWRPROF", .import = "PowerSettingRegisterNotification", .signature = "\x00\x04\x11\x81\x01\x0f\x11\x0d\x11\xa7\x81\x11\x80\x85\x0f\x0f\x01" } },
    .{ "PowerSettingUnregisterNotification", MethodRecord{ .library = "POWRPROF", .import = "PowerSettingUnregisterNotification", .signature = "\x00\x01\x11\x81\x01\x11\xc0\x00\x43\xbd" } },
    .{ "PowerRegisterForEffectivePowerModeNotifications", MethodRecord{ .library = "POWRPROF", .import = "PowerRegisterForEffectivePowerModeNotifications", .signature = "\x00\x04\x11\x79\x09\x12\xc0\x00\x43\xc1\x0f\x01\x0f\x0f\x01" } },
    .{ "PowerUnregisterFromEffectivePowerModeNotifications", MethodRecord{ .library = "POWRPROF", .import = "PowerUnregisterFromEffectivePowerModeNotifications", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "GetPwrDiskSpindownRange", MethodRecord{ .library = "POWRPROF", .import = "GetPwrDiskSpindownRange", .signature = "\x00\x02\x11\x87\x79\x0f\x09\x0f\x09" } },
    .{ "EnumPwrSchemes", MethodRecord{ .library = "POWRPROF", .import = "EnumPwrSchemes", .signature = "\x00\x02\x11\x87\x79\x12\xc0\x00\x43\xc5\x11\x82\x2d" } },
    .{ "ReadGlobalPwrPolicy", MethodRecord{ .library = "POWRPROF", .import = "ReadGlobalPwrPolicy", .signature = "\x00\x01\x11\x87\x79\x0f\x11\xc0\x00\x43\xc9" } },
    .{ "ReadPwrScheme", MethodRecord{ .library = "POWRPROF", .import = "ReadPwrScheme", .signature = "\x00\x02\x11\x87\x79\x09\x0f\x11\xc0\x00\x43\xcd" } },
    .{ "WritePwrScheme", MethodRecord{ .library = "POWRPROF", .import = "WritePwrScheme", .signature = "\x00\x04\x11\x87\x79\x0f\x09\x11\x05\x11\x05\x0f\x11\xc0\x00\x43\xcd" } },
    .{ "WriteGlobalPwrPolicy", MethodRecord{ .library = "POWRPROF", .import = "WriteGlobalPwrPolicy", .signature = "\x00\x01\x11\x87\x79\x0f\x11\xc0\x00\x43\xc9" } },
    .{ "DeletePwrScheme", MethodRecord{ .library = "POWRPROF", .import = "DeletePwrScheme", .signature = "\x00\x01\x11\x87\x79\x09" } },
    .{ "GetActivePwrScheme", MethodRecord{ .library = "POWRPROF", .import = "GetActivePwrScheme", .signature = "\x00\x01\x11\x87\x79\x0f\x09" } },
    .{ "SetActivePwrScheme", MethodRecord{ .library = "POWRPROF", .import = "SetActivePwrScheme", .signature = "\x00\x03\x11\x87\x79\x09\x0f\x11\xc0\x00\x43\xc9\x0f\x11\xc0\x00\x43\xcd" } },
    .{ "IsPwrSuspendAllowed", MethodRecord{ .library = "POWRPROF", .import = "IsPwrSuspendAllowed", .signature = "\x00\x00\x11\x87\x79" } },
    .{ "IsPwrHibernateAllowed", MethodRecord{ .library = "POWRPROF", .import = "IsPwrHibernateAllowed", .signature = "\x00\x00\x11\x87\x79" } },
    .{ "IsPwrShutdownAllowed", MethodRecord{ .library = "POWRPROF", .import = "IsPwrShutdownAllowed", .signature = "\x00\x00\x11\x87\x79" } },
    .{ "IsAdminOverrideActive", MethodRecord{ .library = "POWRPROF", .import = "IsAdminOverrideActive", .signature = "\x00\x01\x11\x87\x79\x0f\x11\xc0\x00\x43\xd1" } },
    .{ "SetSuspendState", MethodRecord{ .library = "POWRPROF", .import = "SetSuspendState", .signature = "\x00\x03\x11\x87\x79\x11\x87\x79\x11\x87\x79\x11\x87\x79" } },
    .{ "GetCurrentPowerPolicies", MethodRecord{ .library = "POWRPROF", .import = "GetCurrentPowerPolicies", .signature = "\x00\x02\x11\x87\x79\x0f\x11\xc0\x00\x43\xc9\x0f\x11\xc0\x00\x43\xcd" } },
    .{ "CanUserWritePwrScheme", MethodRecord{ .library = "POWRPROF", .import = "CanUserWritePwrScheme", .signature = "\x00\x00\x11\x87\x79" } },
    .{ "ReadProcessorPwrScheme", MethodRecord{ .library = "POWRPROF", .import = "ReadProcessorPwrScheme", .signature = "\x00\x02\x11\x87\x79\x09\x0f\x11\xc0\x00\x43\xd5" } },
    .{ "WriteProcessorPwrScheme", MethodRecord{ .library = "POWRPROF", .import = "WriteProcessorPwrScheme", .signature = "\x00\x02\x11\x87\x79\x09\x0f\x11\xc0\x00\x43\xd5" } },
    .{ "ValidatePowerPolicies", MethodRecord{ .library = "POWRPROF", .import = "ValidatePowerPolicies", .signature = "\x00\x02\x11\x87\x79\x0f\x11\xc0\x00\x43\xc9\x0f\x11\xc0\x00\x43\xcd" } },
    .{ "PowerIsSettingRangeDefined", MethodRecord{ .library = "POWRPROF", .import = "PowerIsSettingRangeDefined", .signature = "\x00\x02\x11\x87\x79\x0f\x11\x0d\x0f\x11\x0d" } },
    .{ "PowerSettingAccessCheckEx", MethodRecord{ .library = "POWRPROF", .import = "PowerSettingAccessCheckEx", .signature = "\x00\x03\x11\x81\x01\x11\xc0\x00\x43\xd9\x0f\x11\x0d\x11\x9a\x95" } },
    .{ "PowerSettingAccessCheck", MethodRecord{ .library = "POWRPROF", .import = "PowerSettingAccessCheck", .signature = "\x00\x02\x11\x81\x01\x11\xc0\x00\x43\xd9\x0f\x11\x0d" } },
    .{ "PowerGetUserConfiguredACPowerMode", MethodRecord{ .library = "POWRPROF", .import = "PowerGetUserConfiguredACPowerMode", .signature = "\x00\x01\x09\x0f\x11\x0d" } },
    .{ "PowerGetUserConfiguredDCPowerMode", MethodRecord{ .library = "POWRPROF", .import = "PowerGetUserConfiguredDCPowerMode", .signature = "\x00\x01\x09\x0f\x11\x0d" } },
    .{ "PowerSetUserConfiguredACPowerMode", MethodRecord{ .library = "POWRPROF", .import = "PowerSetUserConfiguredACPowerMode", .signature = "\x00\x01\x09\x0f\x11\x0d" } },
    .{ "PowerSetUserConfiguredDCPowerMode", MethodRecord{ .library = "POWRPROF", .import = "PowerSetUserConfiguredDCPowerMode", .signature = "\x00\x01\x09\x0f\x11\x0d" } },
    .{ "PowerReadACValueIndex", MethodRecord{ .library = "POWRPROF", .import = "PowerReadACValueIndex", .signature = "\x00\x05\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x0f\x09" } },
    .{ "PowerReadDCValueIndex", MethodRecord{ .library = "POWRPROF", .import = "PowerReadDCValueIndex", .signature = "\x00\x05\x09\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x0f\x09" } },
    .{ "PowerReadFriendlyName", MethodRecord{ .library = "POWRPROF", .import = "PowerReadFriendlyName", .signature = "\x00\x06\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x0f\x05\x0f\x09" } },
    .{ "PowerReadDescription", MethodRecord{ .library = "POWRPROF", .import = "PowerReadDescription", .signature = "\x00\x06\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x0f\x05\x0f\x09" } },
    .{ "PowerReadPossibleValue", MethodRecord{ .library = "POWRPROF", .import = "PowerReadPossibleValue", .signature = "\x00\x07\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x09\x09\x0f\x05\x0f\x09" } },
    .{ "PowerReadPossibleFriendlyName", MethodRecord{ .library = "POWRPROF", .import = "PowerReadPossibleFriendlyName", .signature = "\x00\x06\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x09\x0f\x05\x0f\x09" } },
    .{ "PowerReadPossibleDescription", MethodRecord{ .library = "POWRPROF", .import = "PowerReadPossibleDescription", .signature = "\x00\x06\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x09\x0f\x05\x0f\x09" } },
    .{ "PowerReadValueMin", MethodRecord{ .library = "POWRPROF", .import = "PowerReadValueMin", .signature = "\x00\x04\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x09" } },
    .{ "PowerReadValueMax", MethodRecord{ .library = "POWRPROF", .import = "PowerReadValueMax", .signature = "\x00\x04\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x09" } },
    .{ "PowerReadValueIncrement", MethodRecord{ .library = "POWRPROF", .import = "PowerReadValueIncrement", .signature = "\x00\x04\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x09" } },
    .{ "PowerReadValueUnitsSpecifier", MethodRecord{ .library = "POWRPROF", .import = "PowerReadValueUnitsSpecifier", .signature = "\x00\x05\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x05\x0f\x09" } },
    .{ "PowerReadACDefaultIndex", MethodRecord{ .library = "POWRPROF", .import = "PowerReadACDefaultIndex", .signature = "\x00\x05\x09\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x0f\x09" } },
    .{ "PowerReadDCDefaultIndex", MethodRecord{ .library = "POWRPROF", .import = "PowerReadDCDefaultIndex", .signature = "\x00\x05\x09\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x0f\x09" } },
    .{ "PowerReadIconResourceSpecifier", MethodRecord{ .library = "POWRPROF", .import = "PowerReadIconResourceSpecifier", .signature = "\x00\x06\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x0f\x05\x0f\x09" } },
    .{ "PowerReadSettingAttributes", MethodRecord{ .library = "POWRPROF", .import = "PowerReadSettingAttributes", .signature = "\x00\x02\x09\x0f\x11\x0d\x0f\x11\x0d" } },
    .{ "PowerWriteFriendlyName", MethodRecord{ .library = "POWRPROF", .import = "PowerWriteFriendlyName", .signature = "\x00\x06\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x0f\x05\x09" } },
    .{ "PowerWriteDescription", MethodRecord{ .library = "POWRPROF", .import = "PowerWriteDescription", .signature = "\x00\x06\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x0f\x05\x09" } },
    .{ "PowerWritePossibleValue", MethodRecord{ .library = "POWRPROF", .import = "PowerWritePossibleValue", .signature = "\x00\x07\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x09\x09\x0f\x05\x09" } },
    .{ "PowerWritePossibleFriendlyName", MethodRecord{ .library = "POWRPROF", .import = "PowerWritePossibleFriendlyName", .signature = "\x00\x06\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x09\x0f\x05\x09" } },
    .{ "PowerWritePossibleDescription", MethodRecord{ .library = "POWRPROF", .import = "PowerWritePossibleDescription", .signature = "\x00\x06\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x09\x0f\x05\x09" } },
    .{ "PowerWriteValueMin", MethodRecord{ .library = "POWRPROF", .import = "PowerWriteValueMin", .signature = "\x00\x04\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x09" } },
    .{ "PowerWriteValueMax", MethodRecord{ .library = "POWRPROF", .import = "PowerWriteValueMax", .signature = "\x00\x04\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x09" } },
    .{ "PowerWriteValueIncrement", MethodRecord{ .library = "POWRPROF", .import = "PowerWriteValueIncrement", .signature = "\x00\x04\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x09" } },
    .{ "PowerWriteValueUnitsSpecifier", MethodRecord{ .library = "POWRPROF", .import = "PowerWriteValueUnitsSpecifier", .signature = "\x00\x05\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x05\x09" } },
    .{ "PowerWriteACDefaultIndex", MethodRecord{ .library = "POWRPROF", .import = "PowerWriteACDefaultIndex", .signature = "\x00\x05\x09\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x09" } },
    .{ "PowerWriteDCDefaultIndex", MethodRecord{ .library = "POWRPROF", .import = "PowerWriteDCDefaultIndex", .signature = "\x00\x05\x09\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x09" } },
    .{ "PowerWriteIconResourceSpecifier", MethodRecord{ .library = "POWRPROF", .import = "PowerWriteIconResourceSpecifier", .signature = "\x00\x06\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\x0d\x0f\x05\x09" } },
    .{ "PowerWriteSettingAttributes", MethodRecord{ .library = "POWRPROF", .import = "PowerWriteSettingAttributes", .signature = "\x00\x03\x11\x81\x01\x0f\x11\x0d\x0f\x11\x0d\x09" } },
    .{ "PowerDuplicateScheme", MethodRecord{ .library = "POWRPROF", .import = "PowerDuplicateScheme", .signature = "\x00\x03\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x0f\x11\x0d" } },
    .{ "PowerImportPowerScheme", MethodRecord{ .library = "POWRPROF", .import = "PowerImportPowerScheme", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x05\x0f\x0f\x11\x0d" } },
    .{ "PowerDeleteScheme", MethodRecord{ .library = "POWRPROF", .import = "PowerDeleteScheme", .signature = "\x00\x02\x11\x81\x01\x11\x55\x0f\x11\x0d" } },
    .{ "PowerRemovePowerSetting", MethodRecord{ .library = "POWRPROF", .import = "PowerRemovePowerSetting", .signature = "\x00\x02\x11\x81\x01\x0f\x11\x0d\x0f\x11\x0d" } },
    .{ "PowerCreateSetting", MethodRecord{ .library = "POWRPROF", .import = "PowerCreateSetting", .signature = "\x00\x03\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d" } },
    .{ "PowerCreatePossibleSetting", MethodRecord{ .library = "POWRPROF", .import = "PowerCreatePossibleSetting", .signature = "\x00\x04\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x09" } },
    .{ "PowerEnumerate", MethodRecord{ .library = "POWRPROF", .import = "PowerEnumerate", .signature = "\x00\x07\x11\x81\x01\x11\x55\x0f\x11\x0d\x0f\x11\x0d\x11\xc0\x00\x43\xd9\x09\x0f\x05\x0f\x09" } },
    .{ "PowerOpenUserPowerKey", MethodRecord{ .library = "POWRPROF", .import = "PowerOpenUserPowerKey", .signature = "\x00\x03\x09\x0f\x11\x55\x09\x11\x59" } },
    .{ "PowerOpenSystemPowerKey", MethodRecord{ .library = "POWRPROF", .import = "PowerOpenSystemPowerKey", .signature = "\x00\x03\x09\x0f\x11\x55\x09\x11\x59" } },
    .{ "PowerCanRestoreIndividualDefaultPowerScheme", MethodRecord{ .library = "POWRPROF", .import = "PowerCanRestoreIndividualDefaultPowerScheme", .signature = "\x00\x01\x11\x81\x01\x0f\x11\x0d" } },
    .{ "PowerRestoreIndividualDefaultPowerScheme", MethodRecord{ .library = "POWRPROF", .import = "PowerRestoreIndividualDefaultPowerScheme", .signature = "\x00\x01\x11\x81\x01\x0f\x11\x0d" } },
    .{ "PowerRestoreDefaultPowerSchemes", MethodRecord{ .library = "POWRPROF", .import = "PowerRestoreDefaultPowerSchemes", .signature = "\x00\x00\x11\x81\x01" } },
    .{ "PowerReplaceDefaultPowerSchemes", MethodRecord{ .library = "POWRPROF", .import = "PowerReplaceDefaultPowerSchemes", .signature = "\x00\x00\x09" } },
    .{ "PowerDeterminePlatformRole", MethodRecord{ .library = "POWRPROF", .import = "PowerDeterminePlatformRole", .signature = "\x00\x00\x11\xc0\x00\x43\xb9" } },
    .{ "DevicePowerEnumDevices", MethodRecord{ .library = "POWRPROF", .import = "DevicePowerEnumDevices", .signature = "\x00\x05\x11\x87\x79\x09\x09\x09\x0f\x05\x0f\x09" } },
    .{ "DevicePowerSetDeviceState", MethodRecord{ .library = "POWRPROF", .import = "DevicePowerSetDeviceState", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x01" } },
    .{ "DevicePowerOpen", MethodRecord{ .library = "POWRPROF", .import = "DevicePowerOpen", .signature = "\x00\x01\x11\x87\x79\x09" } },
    .{ "DevicePowerClose", MethodRecord{ .library = "POWRPROF", .import = "DevicePowerClose", .signature = "\x00\x00\x11\x87\x79" } },
    .{ "PowerReportThermalEvent", MethodRecord{ .library = "POWRPROF", .import = "PowerReportThermalEvent", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xc0\x00\x43\xdd" } },
    .{ "RegisterPowerSettingNotification", MethodRecord{ .library = "USER32", .import = "RegisterPowerSettingNotification", .signature = "\x00\x03\x11\xc0\x00\x43\xbd\x11\x80\x85\x0f\x11\x0d\x11\xa7\x81" } },
    .{ "UnregisterPowerSettingNotification", MethodRecord{ .library = "USER32", .import = "UnregisterPowerSettingNotification", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x43\xbd" } },
    .{ "RegisterSuspendResumeNotification", MethodRecord{ .library = "USER32", .import = "RegisterSuspendResumeNotification", .signature = "\x00\x02\x11\xc0\x00\x43\xbd\x11\x80\x85\x11\xa7\x81" } },
    .{ "UnregisterSuspendResumeNotification", MethodRecord{ .library = "USER32", .import = "UnregisterSuspendResumeNotification", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x43\xbd" } },
    .{ "RequestWakeupLatency", MethodRecord{ .library = "KERNEL32", .import = "RequestWakeupLatency", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x43\xe1" } },
    .{ "IsSystemResumeAutomatic", MethodRecord{ .library = "KERNEL32", .import = "IsSystemResumeAutomatic", .signature = "\x00\x00\x11\x59" } },
    .{ "SetThreadExecutionState", MethodRecord{ .library = "KERNEL32", .import = "SetThreadExecutionState", .signature = "\x00\x01\x11\xa2\x1d\x11\xa2\x1d" } },
    .{ "PowerCreateRequest", MethodRecord{ .library = "KERNEL32", .import = "PowerCreateRequest", .signature = "\x00\x01\x11\x80\x85\x0f\x11\xa3\xc9" } },
    .{ "PowerSetRequest", MethodRecord{ .library = "KERNEL32", .import = "PowerSetRequest", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\xc0\x00\x43\xe5" } },
    .{ "PowerClearRequest", MethodRecord{ .library = "KERNEL32", .import = "PowerClearRequest", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\xc0\x00\x43\xe5" } },
    .{ "GetDevicePowerState", MethodRecord{ .library = "KERNEL32", .import = "GetDevicePowerState", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x59" } },
    .{ "SetSystemPowerState", MethodRecord{ .library = "KERNEL32", .import = "SetSystemPowerState", .signature = "\x00\x02\x11\x59\x11\x59\x11\x59" } },
    .{ "GetSystemPowerStatus", MethodRecord{ .library = "KERNEL32", .import = "GetSystemPowerStatus", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x43\xe9" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x55 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "HKEY" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x471 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "NTSTATUS" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0x1a95 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "REG_SAM_FLAGS" },
        0x2219 => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "POWER_PLATFORM_ROLE_VERSION" },
        0x221d => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "EXECUTION_STATE" },
        0x23c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "REASON_CONTEXT" },
        0x2781 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "REGISTER_NOTIFICATION_FLAGS" },
        0x43b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "POWER_INFORMATION_LEVEL" },
        0x43b5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "SYSTEM_POWER_CAPABILITIES" },
        0x43b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "POWER_PLATFORM_ROLE" },
        0x43bd => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "HPOWERNOTIFY" },
        0x43c1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "EFFECTIVE_POWER_MODE_CALLBACK" },
        0x43c5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "PWRSCHEMESENUMPROC" },
        0x43c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "GLOBAL_POWER_POLICY" },
        0x43cd => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "POWER_POLICY" },
        0x43d1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "ADMINISTRATOR_POWER_POLICY" },
        0x43d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "MACHINE_PROCESSOR_POWER_POLICY" },
        0x43d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "POWER_DATA_ACCESSOR" },
        0x43dd => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "THERMAL_EVENT" },
        0x43e1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "LATENCY_TIME" },
        0x43e5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "POWER_REQUEST_TYPE" },
        0x43e9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "SYSTEM_POWER_STATUS" },
        else => null,
    };
}

pub const PO_TZ_ACTIVE = 0;
pub const PO_TZ_PASSIVE = 1;
pub const PO_TZ_INVALID_MODE = 2;
pub const POWER_PLATFORM_ROLE_V1 = 1;
pub const POWER_PLATFORM_ROLE_V2 = 2;
pub const ES_AWAYMODE_REQUIRED = 64;
pub const ES_CONTINUOUS = 2147483648;
pub const ES_DISPLAY_REQUIRED = 2;
pub const ES_SYSTEM_REQUIRED = 1;
pub const ES_USER_PRESENT = 4;
pub const POWER_FORCE_TRIGGER_RESET = 2147483648;
pub const POWER_LEVEL_USER_NOTIFY_EXEC = 4;
pub const POWER_LEVEL_USER_NOTIFY_SOUND = 2;
pub const POWER_LEVEL_USER_NOTIFY_TEXT = 1;
pub const POWER_USER_NOTIFY_BUTTON = 8;
pub const POWER_USER_NOTIFY_SHUTDOWN = 16;
pub const PDCAP_D0_SUPPORTED = 1;
pub const PDCAP_D1_SUPPORTED = 2;
pub const PDCAP_D2_SUPPORTED = 4;
pub const PDCAP_D3_SUPPORTED = 8;
pub const PDCAP_WAKE_FROM_D0_SUPPORTED = 16;
pub const PDCAP_WAKE_FROM_D1_SUPPORTED = 32;
pub const PDCAP_WAKE_FROM_D2_SUPPORTED = 64;
pub const PDCAP_WAKE_FROM_D3_SUPPORTED = 128;
pub const PDCAP_WARM_EJECT_SUPPORTED = 256;
pub const PDCAP_S0_SUPPORTED = 65536;
pub const PDCAP_S1_SUPPORTED = 131072;
pub const PDCAP_S2_SUPPORTED = 262144;
pub const PDCAP_S3_SUPPORTED = 524288;
pub const PDCAP_WAKE_FROM_S0_SUPPORTED = 1048576;
pub const PDCAP_WAKE_FROM_S1_SUPPORTED = 2097152;
pub const PDCAP_WAKE_FROM_S2_SUPPORTED = 4194304;
pub const PDCAP_WAKE_FROM_S3_SUPPORTED = 8388608;
pub const PDCAP_S4_SUPPORTED = 16777216;
pub const PDCAP_S5_SUPPORTED = 33554432;
pub const PPM_FIRMWARE_ACPI1C2 = 1;
pub const PPM_FIRMWARE_ACPI1C3 = 2;
pub const PPM_FIRMWARE_ACPI1TSTATES = 4;
pub const PPM_FIRMWARE_CST = 8;
pub const PPM_FIRMWARE_CSD = 16;
pub const PPM_FIRMWARE_PCT = 32;
pub const PPM_FIRMWARE_PSS = 64;
pub const PPM_FIRMWARE_XPSS = 128;
pub const PPM_FIRMWARE_PPC = 256;
pub const PPM_FIRMWARE_PSD = 512;
pub const PPM_FIRMWARE_PTC = 1024;
pub const PPM_FIRMWARE_TSS = 2048;
pub const PPM_FIRMWARE_TPC = 4096;
pub const PPM_FIRMWARE_TSD = 8192;
pub const PPM_FIRMWARE_PCCH = 16384;
pub const PPM_FIRMWARE_PCCP = 32768;
pub const PPM_FIRMWARE_OSC = 65536;
pub const PPM_FIRMWARE_PDC = 131072;
pub const PPM_FIRMWARE_CPC = 262144;
pub const PPM_FIRMWARE_LPI = 524288;
pub const PPM_PERFORMANCE_IMPLEMENTATION_NONE = 0;
pub const PPM_PERFORMANCE_IMPLEMENTATION_PSTATES = 1;
pub const PPM_PERFORMANCE_IMPLEMENTATION_PCCV1 = 2;
pub const PPM_PERFORMANCE_IMPLEMENTATION_CPPC = 3;
pub const PPM_PERFORMANCE_IMPLEMENTATION_PEP = 4;
pub const PPM_IDLE_IMPLEMENTATION_NONE = 0;
pub const PPM_IDLE_IMPLEMENTATION_CSTATES = 1;
pub const PPM_IDLE_IMPLEMENTATION_PEP = 2;
pub const PPM_IDLE_IMPLEMENTATION_MICROPEP = 3;
pub const PPM_IDLE_IMPLEMENTATION_LPISTATES = 4;
pub const BATTERY_UNKNOWN_CAPACITY = 4294967295;
pub const UNKNOWN_CAPACITY = 4294967295;
pub const BATTERY_SYSTEM_BATTERY = 2147483648;
pub const BATTERY_CAPACITY_RELATIVE = 1073741824;
pub const BATTERY_IS_SHORT_TERM = 536870912;
pub const BATTERY_SEALED = 268435456;
pub const BATTERY_SET_CHARGE_SUPPORTED = 1;
pub const BATTERY_SET_DISCHARGE_SUPPORTED = 2;
pub const BATTERY_SET_CHARGINGSOURCE_SUPPORTED = 4;
pub const BATTERY_SET_CHARGER_ID_SUPPORTED = 8;
pub const BATTERY_UNKNOWN_TIME = 4294967295;
pub const BATTERY_UNKNOWN_CURRENT = 4294967295;
pub const UNKNOWN_CURRENT = 4294967295;
pub const BATTERY_USB_CHARGER_STATUS_FN_DEFAULT_USB = 1;
pub const BATTERY_USB_CHARGER_STATUS_UCM_PD = 2;
pub const BATTERY_UNKNOWN_VOLTAGE = 4294967295;
pub const BATTERY_UNKNOWN_RATE = 2147483648;
pub const UNKNOWN_RATE = 2147483648;
pub const UNKNOWN_VOLTAGE = 4294967295;
pub const BATTERY_POWER_ON_LINE = 1;
pub const BATTERY_DISCHARGING = 2;
pub const BATTERY_CHARGING = 4;
pub const BATTERY_CRITICAL = 8;
pub const MAX_BATTERY_STRING_SIZE = 128;
pub const IOCTL_BATTERY_QUERY_TAG = 2703424;
pub const IOCTL_BATTERY_QUERY_INFORMATION = 2703428;
pub const IOCTL_BATTERY_SET_INFORMATION = 2719816;
pub const IOCTL_BATTERY_QUERY_STATUS = 2703436;
pub const IOCTL_BATTERY_CHARGING_SOURCE_CHANGE = 2703440;
pub const BATTERY_TAG_INVALID = 0;
pub const IOCTL_QUERY_CUSTOMIZED_IO_CAPABILITIES = 2704000;
pub const IOCTL_QUERY_CUSTOMIZED_INPUT_FROM_PLATFORM = 2704004;
pub const IOCTL_SEND_CUSTOMIZED_OUTPUT_TO_PLATFORM = 2720392;
pub const MAX_ACTIVE_COOLING_LEVELS = 10;
pub const ACTIVE_COOLING = 0;
pub const PASSIVE_COOLING = 1;
pub const THERMAL_WAIT_READ_TIMEOUT_IMMEDIATE = 0;
pub const THERMAL_WAIT_READ_TIMEOUT_NONE = 4294967295;
pub const TZ_ACTIVATION_REASON_THERMAL = 1;
pub const TZ_ACTIVATION_REASON_CURRENT = 2;
pub const THERMAL_POLICY_VERSION_1 = 1;
pub const THERMAL_POLICY_VERSION_2 = 2;
pub const IOCTL_THERMAL_QUERY_INFORMATION = 2703488;
pub const IOCTL_THERMAL_SET_COOLING_POLICY = 2719876;
pub const IOCTL_RUN_ACTIVE_COOLING_METHOD = 2719880;
pub const IOCTL_THERMAL_SET_PASSIVE_LIMIT = 2719884;
pub const IOCTL_THERMAL_READ_TEMPERATURE = 2703504;
pub const IOCTL_THERMAL_READ_POLICY = 2703508;
pub const IOCTL_QUERY_LID = 2703552;
pub const IOCTL_NOTIFY_SWITCH_EVENT = 2703616;
pub const IOCTL_GET_SYS_BUTTON_CAPS = 2703680;
pub const IOCTL_GET_SYS_BUTTON_EVENT = 2703684;
pub const SYS_BUTTON_POWER = 1;
pub const SYS_BUTTON_SLEEP = 2;
pub const SYS_BUTTON_LID = 4;
pub const SYS_BUTTON_WAKE = 2147483648;
pub const SYS_BUTTON_LID_STATE_MASK = 196608;
pub const SYS_BUTTON_LID_OPEN = 65536;
pub const SYS_BUTTON_LID_CLOSED = 131072;
pub const SYS_BUTTON_LID_INITIAL = 262144;
pub const SYS_BUTTON_LID_CHANGED = 524288;
pub const IOCTL_GET_PROCESSOR_OBJ_INFO = 2703744;
pub const THERMAL_COOLING_INTERFACE_VERSION = 1;
pub const THERMAL_DEVICE_INTERFACE_VERSION = 1;
pub const POWER_LIMIT_INTERFACE_VERSION = 1;
pub const IOCTL_SET_SYS_MESSAGE_INDICATOR = 2720192;
pub const IOCTL_SET_WAKE_ALARM_VALUE = 2720256;
pub const IOCTL_SET_WAKE_ALARM_POLICY = 2720260;
pub const IOCTL_GET_WAKE_ALARM_VALUE = 2736648;
pub const IOCTL_GET_WAKE_ALARM_POLICY = 2736652;
pub const ACPI_TIME_ADJUST_DAYLIGHT = 1;
pub const ACPI_TIME_IN_DAYLIGHT = 2;
pub const ACPI_TIME_ZONE_UNKNOWN = 2047;
pub const IOCTL_ACPI_GET_REAL_TIME = 2703888;
pub const IOCTL_ACPI_SET_REAL_TIME = 2720276;
pub const IOCTL_GET_WAKE_ALARM_SYSTEM_POWERSTATE = 2703896;
pub const IOCTL_GET_ACPI_TIME_AND_ALARM_CAPABILITIES = 2703900;
pub const BATTERY_NOTIFY_VERSION_1 = 1;
pub const BATTERY_NOTIFY_VERSION_2 = 2;
pub const CHARGE_REQUIREMENT_MAX_POWER_SOURCE_TYPES = 2;
pub const BATTERY_MINIPORT_UPDATE_DATA_VER_1 = 1;
pub const BATTERY_MINIPORT_UPDATE_DATA_VER_2 = 2;
pub const BATTERY_CLASS_MAJOR_VERSION = 1;
pub const BATTERY_CLASS_MINOR_VERSION = 0;
pub const BATTERY_CLASS_MINOR_VERSION_1 = 1;
pub const BATTERY_CLASS_MINOR_VERSION_2 = 2;
pub const ADAPTER_CLASS_MAJOR_VERSION = 1;
pub const ADAPTER_CLASS_MINOR_VERSION = 0;
pub const IOCTL_EMI_GET_VERSION = 2244608;
pub const IOCTL_EMI_GET_METADATA_SIZE = 2244612;
pub const IOCTL_EMI_GET_METADATA = 2244616;
pub const IOCTL_EMI_GET_MEASUREMENT = 2244620;
pub const EMI_NAME_MAX = 16;
pub const EMI_VERSION_V1 = 1;
pub const EMI_VERSION_V2 = 2;
pub const EFFECTIVE_POWER_MODE_V1 = 1;
pub const EFFECTIVE_POWER_MODE_V2 = 2;
pub const EnableSysTrayBatteryMeter = 1;
pub const EnableMultiBatteryDisplay = 2;
pub const EnablePasswordLogon = 4;
pub const EnableWakeOnRing = 8;
pub const EnableVideoDimDisplay = 16;
pub const POWER_ATTRIBUTE_HIDE = 1;
pub const POWER_ATTRIBUTE_SHOW_AOAC = 2;
pub const DEVICEPOWER_HARDWAREID = 2147483648;
pub const DEVICEPOWER_AND_OPERATION = 1073741824;
pub const DEVICEPOWER_FILTER_DEVICES_PRESENT = 536870912;
pub const DEVICEPOWER_FILTER_HARDWARE = 268435456;
pub const DEVICEPOWER_FILTER_WAKEENABLED = 134217728;
pub const DEVICEPOWER_FILTER_WAKEPROGRAMMABLE = 67108864;
pub const DEVICEPOWER_FILTER_ON_NAME = 33554432;
pub const DEVICEPOWER_SET_WAKEENABLED = 1;
pub const DEVICEPOWER_CLEAR_WAKEENABLED = 2;
pub const THERMAL_EVENT_VERSION = 1;
pub const EffectivePowerModeBatterySaver = 0;
pub const EffectivePowerModeEnergySaverHighSavings = 0;
pub const EffectivePowerModeBetterBattery = 1;
pub const EffectivePowerModeEnergySaverStandard = 1;
pub const EffectivePowerModeBalanced = 2;
pub const EffectivePowerModeHighPerformance = 3;
pub const EffectivePowerModeMaxPerformance = 4;
pub const EffectivePowerModeGameMode = 5;
pub const EffectivePowerModeMixedReality = 6;
pub const ACCESS_AC_POWER_SETTING_INDEX = 0;
pub const ACCESS_DC_POWER_SETTING_INDEX = 1;
pub const ACCESS_FRIENDLY_NAME = 2;
pub const ACCESS_DESCRIPTION = 3;
pub const ACCESS_POSSIBLE_POWER_SETTING = 4;
pub const ACCESS_POSSIBLE_POWER_SETTING_FRIENDLY_NAME = 5;
pub const ACCESS_POSSIBLE_POWER_SETTING_DESCRIPTION = 6;
pub const ACCESS_DEFAULT_AC_POWER_SETTING = 7;
pub const ACCESS_DEFAULT_DC_POWER_SETTING = 8;
pub const ACCESS_POSSIBLE_VALUE_MIN = 9;
pub const ACCESS_POSSIBLE_VALUE_MAX = 10;
pub const ACCESS_POSSIBLE_VALUE_INCREMENT = 11;
pub const ACCESS_POSSIBLE_VALUE_UNITS = 12;
pub const ACCESS_ICON_RESOURCE = 13;
pub const ACCESS_DEFAULT_SECURITY_DESCRIPTOR = 14;
pub const ACCESS_ATTRIBUTES = 15;
pub const ACCESS_SCHEME = 16;
pub const ACCESS_SUBGROUP = 17;
pub const ACCESS_INDIVIDUAL_SETTING = 18;
pub const ACCESS_ACTIVE_SCHEME = 19;
pub const ACCESS_CREATE_SCHEME = 20;
pub const ACCESS_AC_POWER_SETTING_MAX = 21;
pub const ACCESS_DC_POWER_SETTING_MAX = 22;
pub const ACCESS_AC_POWER_SETTING_MIN = 23;
pub const ACCESS_DC_POWER_SETTING_MIN = 24;
pub const ACCESS_PROFILE = 25;
pub const ACCESS_OVERLAY_SCHEME = 26;
pub const ACCESS_POWER_MODE = 26;
pub const ACCESS_ACTIVE_OVERLAY_SCHEME = 27;
pub const BatteryInformation = 0;
pub const BatteryGranularityInformation = 1;
pub const BatteryTemperature = 2;
pub const BatteryEstimatedTime = 3;
pub const BatteryDeviceName = 4;
pub const BatteryManufactureDate = 5;
pub const BatteryManufactureName = 6;
pub const BatteryUniqueID = 7;
pub const BatterySerialNumber = 8;
pub const BatteryChargingSourceType_AC = 1;
pub const BatteryChargingSourceType_USB = 2;
pub const BatteryChargingSourceType_Wireless = 3;
pub const BatteryChargingSourceType_Max = 4;
pub const UsbChargerPort_Legacy = 0;
pub const UsbChargerPort_TypeC = 1;
pub const UsbChargerPort_Max = 2;
pub const BatteryCriticalBias = 0;
pub const BatteryCharge = 1;
pub const BatteryDischarge = 2;
pub const BatteryChargingSource = 3;
pub const BatteryChargerId = 4;
pub const BatteryChargerStatus = 5;
pub const AcpiTimeResolutionMilliseconds = 0;
pub const AcpiTimeResolutionSeconds = 1;
pub const AcpiTimeResolutionMax = 2;
pub const EmiMeasurementUnitPicowattHours = 0;
pub const PowerSystemUnspecified = 0;
pub const PowerSystemWorking = 1;
pub const PowerSystemSleeping1 = 2;
pub const PowerSystemSleeping2 = 3;
pub const PowerSystemSleeping3 = 4;
pub const PowerSystemHibernate = 5;
pub const PowerSystemShutdown = 6;
pub const PowerSystemMaximum = 7;
pub const PowerActionNone = 0;
pub const PowerActionReserved = 1;
pub const PowerActionSleep = 2;
pub const PowerActionHibernate = 3;
pub const PowerActionShutdown = 4;
pub const PowerActionShutdownReset = 5;
pub const PowerActionShutdownOff = 6;
pub const PowerActionWarmEject = 7;
pub const PowerActionDisplayOff = 8;
pub const PowerDeviceUnspecified = 0;
pub const PowerDeviceD0 = 1;
pub const PowerDeviceD1 = 2;
pub const PowerDeviceD2 = 3;
pub const PowerDeviceD3 = 4;
pub const PowerDeviceMaximum = 5;
pub const PowerUserPresent = 0;
pub const PowerUserNotPresent = 1;
pub const PowerUserInactive = 2;
pub const PowerUserMaximum = 3;
pub const PowerUserInvalid = 3;
pub const LT_DONT_CARE = 0;
pub const LT_LOWEST_LATENCY = 1;
pub const PowerRequestDisplayRequired = 0;
pub const PowerRequestSystemRequired = 1;
pub const PowerRequestAwayModeRequired = 2;
pub const PowerRequestExecutionRequired = 3;
pub const SystemPowerPolicyAc = 0;
pub const SystemPowerPolicyDc = 1;
pub const VerifySystemPolicyAc = 2;
pub const VerifySystemPolicyDc = 3;
pub const SystemPowerCapabilities = 4;
pub const SystemBatteryState = 5;
pub const SystemPowerStateHandler = 6;
pub const ProcessorStateHandler = 7;
pub const SystemPowerPolicyCurrent = 8;
pub const AdministratorPowerPolicy = 9;
pub const SystemReserveHiberFile = 10;
pub const ProcessorInformation = 11;
pub const SystemPowerInformation = 12;
pub const ProcessorStateHandler2 = 13;
pub const LastWakeTime = 14;
pub const LastSleepTime = 15;
pub const SystemExecutionState = 16;
pub const SystemPowerStateNotifyHandler = 17;
pub const ProcessorPowerPolicyAc = 18;
pub const ProcessorPowerPolicyDc = 19;
pub const VerifyProcessorPowerPolicyAc = 20;
pub const VerifyProcessorPowerPolicyDc = 21;
pub const ProcessorPowerPolicyCurrent = 22;
pub const SystemPowerStateLogging = 23;
pub const SystemPowerLoggingEntry = 24;
pub const SetPowerSettingValue = 25;
pub const NotifyUserPowerSetting = 26;
pub const PowerInformationLevelUnused0 = 27;
pub const SystemMonitorHiberBootPowerOff = 28;
pub const SystemVideoState = 29;
pub const TraceApplicationPowerMessage = 30;
pub const TraceApplicationPowerMessageEnd = 31;
pub const ProcessorPerfStates = 32;
pub const ProcessorIdleStates = 33;
pub const ProcessorCap = 34;
pub const SystemWakeSource = 35;
pub const SystemHiberFileInformation = 36;
pub const TraceServicePowerMessage = 37;
pub const ProcessorLoad = 38;
pub const PowerShutdownNotification = 39;
pub const MonitorCapabilities = 40;
pub const SessionPowerInit = 41;
pub const SessionDisplayState = 42;
pub const PowerRequestCreate = 43;
pub const PowerRequestAction = 44;
pub const GetPowerRequestList = 45;
pub const ProcessorInformationEx = 46;
pub const NotifyUserModeLegacyPowerEvent = 47;
pub const GroupPark = 48;
pub const ProcessorIdleDomains = 49;
pub const WakeTimerList = 50;
pub const SystemHiberFileSize = 51;
pub const ProcessorIdleStatesHv = 52;
pub const ProcessorPerfStatesHv = 53;
pub const ProcessorPerfCapHv = 54;
pub const ProcessorSetIdle = 55;
pub const LogicalProcessorIdling = 56;
pub const UserPresence = 57;
pub const PowerSettingNotificationName = 58;
pub const GetPowerSettingValue = 59;
pub const IdleResiliency = 60;
pub const SessionRITState = 61;
pub const SessionConnectNotification = 62;
pub const SessionPowerCleanup = 63;
pub const SessionLockState = 64;
pub const SystemHiberbootState = 65;
pub const PlatformInformation = 66;
pub const PdcInvocation = 67;
pub const MonitorInvocation = 68;
pub const FirmwareTableInformationRegistered = 69;
pub const SetShutdownSelectedTime = 70;
pub const SuspendResumeInvocation = 71;
pub const PlmPowerRequestCreate = 72;
pub const ScreenOff = 73;
pub const CsDeviceNotification = 74;
pub const PlatformRole = 75;
pub const LastResumePerformance = 76;
pub const DisplayBurst = 77;
pub const ExitLatencySamplingPercentage = 78;
pub const RegisterSpmPowerSettings = 79;
pub const PlatformIdleStates = 80;
pub const ProcessorIdleVeto = 81;
pub const PlatformIdleVeto = 82;
pub const SystemBatteryStatePrecise = 83;
pub const ThermalEvent = 84;
pub const PowerRequestActionInternal = 85;
pub const BatteryDeviceState = 86;
pub const PowerInformationInternal = 87;
pub const ThermalStandby = 88;
pub const SystemHiberFileType = 89;
pub const PhysicalPowerButtonPress = 90;
pub const QueryPotentialDripsConstraint = 91;
pub const EnergyTrackerCreate = 92;
pub const EnergyTrackerQuery = 93;
pub const UpdateBlackBoxRecorder = 94;
pub const SessionAllowExternalDmaDevices = 95;
pub const SendSuspendResumeNotification = 96;
pub const BlackBoxRecorderDirectAccessBuffer = 97;
pub const SystemPowerSourceState = 98;
pub const PowerInformationLevelMaximum = 99;
pub const UserNotPresent = 0;
pub const UserPresent = 1;
pub const UserUnknown = 255;
pub const MonitorRequestReasonUnknown = 0;
pub const MonitorRequestReasonPowerButton = 1;
pub const MonitorRequestReasonRemoteConnection = 2;
pub const MonitorRequestReasonScMonitorpower = 3;
pub const MonitorRequestReasonUserInput = 4;
pub const MonitorRequestReasonAcDcDisplayBurst = 5;
pub const MonitorRequestReasonUserDisplayBurst = 6;
pub const MonitorRequestReasonPoSetSystemState = 7;
pub const MonitorRequestReasonSetThreadExecutionState = 8;
pub const MonitorRequestReasonFullWake = 9;
pub const MonitorRequestReasonSessionUnlock = 10;
pub const MonitorRequestReasonScreenOffRequest = 11;
pub const MonitorRequestReasonIdleTimeout = 12;
pub const MonitorRequestReasonPolicyChange = 13;
pub const MonitorRequestReasonSleepButton = 14;
pub const MonitorRequestReasonLid = 15;
pub const MonitorRequestReasonBatteryCountChange = 16;
pub const MonitorRequestReasonGracePeriod = 17;
pub const MonitorRequestReasonPnP = 18;
pub const MonitorRequestReasonDP = 19;
pub const MonitorRequestReasonSxTransition = 20;
pub const MonitorRequestReasonSystemIdle = 21;
pub const MonitorRequestReasonNearProximity = 22;
pub const MonitorRequestReasonThermalStandby = 23;
pub const MonitorRequestReasonResumePdc = 24;
pub const MonitorRequestReasonResumeS4 = 25;
pub const MonitorRequestReasonTerminal = 26;
pub const MonitorRequestReasonPdcSignal = 27;
pub const MonitorRequestReasonAcDcDisplayBurstSuppressed = 28;
pub const MonitorRequestReasonSystemStateEntered = 29;
pub const MonitorRequestReasonWinrt = 30;
pub const MonitorRequestReasonUserInputKeyboard = 31;
pub const MonitorRequestReasonUserInputMouse = 32;
pub const MonitorRequestReasonUserInputTouchpad = 33;
pub const MonitorRequestReasonUserInputPen = 34;
pub const MonitorRequestReasonUserInputAccelerometer = 35;
pub const MonitorRequestReasonUserInputHid = 36;
pub const MonitorRequestReasonUserInputPoUserPresent = 37;
pub const MonitorRequestReasonUserInputSessionSwitch = 38;
pub const MonitorRequestReasonUserInputInitialization = 39;
pub const MonitorRequestReasonPdcSignalWindowsMobilePwrNotif = 40;
pub const MonitorRequestReasonPdcSignalWindowsMobileShell = 41;
pub const MonitorRequestReasonPdcSignalHeyCortana = 42;
pub const MonitorRequestReasonPdcSignalHolographicShell = 43;
pub const MonitorRequestReasonPdcSignalFingerprint = 44;
pub const MonitorRequestReasonDirectedDrips = 45;
pub const MonitorRequestReasonDim = 46;
pub const MonitorRequestReasonBuiltinPanel = 47;
pub const MonitorRequestReasonDisplayRequiredUnDim = 48;
pub const MonitorRequestReasonBatteryCountChangeSuppressed = 49;
pub const MonitorRequestReasonResumeModernStandby = 50;
pub const MonitorRequestReasonTerminalInit = 51;
pub const MonitorRequestReasonPdcSignalSensorsHumanPresence = 52;
pub const MonitorRequestReasonBatteryPreCritical = 53;
pub const MonitorRequestReasonUserInputTouch = 54;
pub const MonitorRequestReasonAusterityBatteryDrain = 55;
pub const MonitorRequestReasonDozeRestrictedStandby = 56;
pub const MonitorRequestReasonSmartRestrictedStandby = 57;
pub const MonitorRequestReasonMax = 58;
pub const MonitorRequestTypeOff = 0;
pub const MonitorRequestTypeOnAndPresent = 1;
pub const MonitorRequestTypeToggleOn = 2;
pub const PoAc = 0;
pub const PoDc = 1;
pub const PoHot = 2;
pub const PoConditionMaximum = 3;
pub const PlatformRoleUnspecified = 0;
pub const PlatformRoleDesktop = 1;
pub const PlatformRoleMobile = 2;
pub const PlatformRoleWorkstation = 3;
pub const PlatformRoleEnterpriseServer = 4;
pub const PlatformRoleSOHOServer = 5;
pub const PlatformRoleAppliancePC = 6;
pub const PlatformRolePerformanceServer = 7;
pub const PlatformRoleSlate = 8;
pub const PlatformRoleMaximum = 9;
pub const ALTITUDE_GROUP_POLICY = 0;
pub const ALTITUDE_USER = 1;
pub const ALTITUDE_RUNTIME_OVERRIDE = 2;
pub const ALTITUDE_PROVISIONING = 3;
pub const ALTITUDE_OEM_CUSTOMIZATION = 4;
pub const ALTITUDE_INTERNAL_OVERRIDE = 5;
pub const ALTITUDE_OS_DEFAULT = 6;

pub const aliases = struct {
    pub const POWER_COOLING_MODE = u16;
    pub const POWER_PLATFORM_ROLE_VERSION = u32;
    pub const EXECUTION_STATE = u32;
    pub const POWER_ACTION_POLICY_EVENT_CODE = u32;
    pub const DEVICE_POWER_CAPABILITIES = u32;
    pub const EFFECTIVE_POWER_MODE = i32;
    pub const POWER_DATA_ACCESSOR = i32;
    pub const BATTERY_QUERY_INFORMATION_LEVEL = i32;
    pub const BATTERY_CHARGING_SOURCE_TYPE = i32;
    pub const USB_CHARGER_PORT = i32;
    pub const BATTERY_SET_INFORMATION_LEVEL = i32;
    pub const ACPI_TIME_RESOLUTION = i32;
    pub const EMI_MEASUREMENT_UNIT = i32;
    pub const SYSTEM_POWER_STATE = i32;
    pub const POWER_ACTION = i32;
    pub const DEVICE_POWER_STATE = i32;
    pub const USER_ACTIVITY_PRESENCE = i32;
    pub const LATENCY_TIME = i32;
    pub const POWER_REQUEST_TYPE = i32;
    pub const POWER_INFORMATION_LEVEL = i32;
    pub const POWER_USER_PRESENCE_TYPE = i32;
    pub const POWER_MONITOR_REQUEST_REASON = i32;
    pub const POWER_MONITOR_REQUEST_TYPE = i32;
    pub const SYSTEM_POWER_CONDITION = i32;
    pub const POWER_PLATFORM_ROLE = i32;
    pub const POWER_SETTING_ALTITUDE = i32;
    pub const HPOWERNOTIFY = isize;
};
