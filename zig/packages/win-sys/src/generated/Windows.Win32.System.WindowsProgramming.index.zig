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
    .{ "uaw_lstrcmpW", MethodRecord{ .library = "KERNEL32", .import = "uaw_lstrcmpW", .signature = "\x00\x02\x08\x0f\x07\x0f\x07" } },
    .{ "uaw_lstrcmpiW", MethodRecord{ .library = "KERNEL32", .import = "uaw_lstrcmpiW", .signature = "\x00\x02\x08\x0f\x07\x0f\x07" } },
    .{ "uaw_lstrlenW", MethodRecord{ .library = "KERNEL32", .import = "uaw_lstrlenW", .signature = "\x00\x01\x08\x0f\x07" } },
    .{ "uaw_wcschr", MethodRecord{ .library = "KERNEL32", .import = "uaw_wcschr", .signature = "\x00\x02\x0f\x07\x0f\x07\x03" } },
    .{ "uaw_wcscpy", MethodRecord{ .library = "KERNEL32", .import = "uaw_wcscpy", .signature = "\x00\x02\x0f\x07\x0f\x07\x0f\x07" } },
    .{ "uaw_wcsicmp", MethodRecord{ .library = "KERNEL32", .import = "uaw_wcsicmp", .signature = "\x00\x02\x08\x0f\x07\x0f\x07" } },
    .{ "uaw_wcslen", MethodRecord{ .library = "KERNEL32", .import = "uaw_wcslen", .signature = "\x00\x01\x19\x0f\x07" } },
    .{ "uaw_wcsrchr", MethodRecord{ .library = "KERNEL32", .import = "uaw_wcsrchr", .signature = "\x00\x02\x0f\x07\x0f\x07\x03" } },
    .{ "RtlGetReturnAddressHijackTarget", MethodRecord{ .library = "ntdll", .import = "RtlGetReturnAddressHijackTarget", .signature = "\x00\x00\x19" } },
    .{ "RtlRaiseCustomSystemEventTrigger", MethodRecord{ .library = "ntdll", .import = "RtlRaiseCustomSystemEventTrigger", .signature = "\x00\x01\x09\x0f\x11\xc0\x00\x45\x49" } },
    .{ "IsApiSetImplemented", MethodRecord{ .library = "api-ms-win-core-apiquery-l2-1-0", .import = "IsApiSetImplemented", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "GetApiSetModuleBaseName", MethodRecord{ .library = "api-ms-win-core-apiquery-l2-1-1", .import = "GetApiSetModuleBaseName", .signature = "\x00\x04\x11\x79\x11\x3d\x09\x11\x05\x0f\x09" } },
    .{ "QueryThreadCycleTime", MethodRecord{ .library = "KERNEL32", .import = "QueryThreadCycleTime", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0b" } },
    .{ "QueryProcessCycleTime", MethodRecord{ .library = "KERNEL32", .import = "QueryProcessCycleTime", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0b" } },
    .{ "QueryIdleProcessorCycleTime", MethodRecord{ .library = "KERNEL32", .import = "QueryIdleProcessorCycleTime", .signature = "\x00\x02\x11\x59\x0f\x09\x0f\x0b" } },
    .{ "QueryIdleProcessorCycleTimeEx", MethodRecord{ .library = "KERNEL32", .import = "QueryIdleProcessorCycleTimeEx", .signature = "\x00\x03\x11\x59\x07\x0f\x09\x0f\x0b" } },
    .{ "QueryInterruptTimePrecise", MethodRecord{ .library = "api-ms-win-core-realtime-l1-1-1", .import = "QueryInterruptTimePrecise", .signature = "\x00\x01\x01\x0f\x0b" } },
    .{ "QueryUnbiasedInterruptTimePrecise", MethodRecord{ .library = "api-ms-win-core-realtime-l1-1-1", .import = "QueryUnbiasedInterruptTimePrecise", .signature = "\x00\x01\x01\x0f\x0b" } },
    .{ "QueryInterruptTime", MethodRecord{ .library = "api-ms-win-core-realtime-l1-1-1", .import = "QueryInterruptTime", .signature = "\x00\x01\x01\x0f\x0b" } },
    .{ "QueryUnbiasedInterruptTime", MethodRecord{ .library = "KERNEL32", .import = "QueryUnbiasedInterruptTime", .signature = "\x00\x01\x11\x59\x0f\x0b" } },
    .{ "QueryAuxiliaryCounterFrequency", MethodRecord{ .library = "api-ms-win-core-realtime-l1-1-2", .import = "QueryAuxiliaryCounterFrequency", .signature = "\x00\x01\x11\x79\x0f\x0b" } },
    .{ "ConvertAuxiliaryCounterToPerformanceCounter", MethodRecord{ .library = "api-ms-win-core-realtime-l1-1-2", .import = "ConvertAuxiliaryCounterToPerformanceCounter", .signature = "\x00\x03\x11\x79\x0b\x0f\x0b\x0f\x0b" } },
    .{ "ConvertPerformanceCounterToAuxiliaryCounter", MethodRecord{ .library = "api-ms-win-core-realtime-l1-1-2", .import = "ConvertPerformanceCounterToAuxiliaryCounter", .signature = "\x00\x03\x11\x79\x0b\x0f\x0b\x0f\x0b" } },
    .{ "GlobalCompact", MethodRecord{ .library = "KERNEL32", .import = "GlobalCompact", .signature = "\x00\x01\x19\x09" } },
    .{ "GlobalFix", MethodRecord{ .library = "KERNEL32", .import = "GlobalFix", .signature = "\x00\x01\x01\x11\x8d\x39" } },
    .{ "GlobalUnfix", MethodRecord{ .library = "KERNEL32", .import = "GlobalUnfix", .signature = "\x00\x01\x01\x11\x8d\x39" } },
    .{ "GlobalWire", MethodRecord{ .library = "KERNEL32", .import = "GlobalWire", .signature = "\x00\x01\x0f\x01\x11\x8d\x39" } },
    .{ "GlobalUnWire", MethodRecord{ .library = "KERNEL32", .import = "GlobalUnWire", .signature = "\x00\x01\x11\x59\x11\x8d\x39" } },
    .{ "LocalShrink", MethodRecord{ .library = "KERNEL32", .import = "LocalShrink", .signature = "\x00\x02\x19\x11\x8d\x3d\x09" } },
    .{ "LocalCompact", MethodRecord{ .library = "KERNEL32", .import = "LocalCompact", .signature = "\x00\x01\x19\x09" } },
    .{ "SetEnvironmentStringsA", MethodRecord{ .library = "KERNEL32", .import = "SetEnvironmentStringsA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "SetHandleCount", MethodRecord{ .library = "KERNEL32", .import = "SetHandleCount", .signature = "\x00\x01\x09\x09" } },
    .{ "RequestDeviceWakeup", MethodRecord{ .library = "KERNEL32", .import = "RequestDeviceWakeup", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "CancelDeviceWakeupRequest", MethodRecord{ .library = "KERNEL32", .import = "CancelDeviceWakeupRequest", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "SetMessageWaitingIndicator", MethodRecord{ .library = "KERNEL32", .import = "SetMessageWaitingIndicator", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "MulDiv", MethodRecord{ .library = "KERNEL32", .import = "MulDiv", .signature = "\x00\x03\x08\x08\x08\x08" } },
    .{ "GetSystemRegistryQuota", MethodRecord{ .library = "KERNEL32", .import = "GetSystemRegistryQuota", .signature = "\x00\x02\x11\x59\x0f\x09\x0f\x09" } },
    .{ "FileTimeToDosDateTime", MethodRecord{ .library = "KERNEL32", .import = "FileTimeToDosDateTime", .signature = "\x00\x03\x11\x59\x0f\x11\x80\x9d\x0f\x07\x0f\x07" } },
    .{ "DosDateTimeToFileTime", MethodRecord{ .library = "KERNEL32", .import = "DosDateTimeToFileTime", .signature = "\x00\x03\x11\x59\x07\x07\x0f\x11\x80\x9d" } },
    .{ "_lopen", MethodRecord{ .library = "KERNEL32", .import = "_lopen", .signature = "\x00\x02\x08\x11\x3d\x08" } },
    .{ "_lcreat", MethodRecord{ .library = "KERNEL32", .import = "_lcreat", .signature = "\x00\x02\x08\x11\x3d\x08" } },
    .{ "_lread", MethodRecord{ .library = "KERNEL32", .import = "_lread", .signature = "\x00\x03\x09\x08\x0f\x01\x09" } },
    .{ "_lwrite", MethodRecord{ .library = "KERNEL32", .import = "_lwrite", .signature = "\x00\x03\x09\x08\x11\x3d\x09" } },
    .{ "_hread", MethodRecord{ .library = "KERNEL32", .import = "_hread", .signature = "\x00\x03\x08\x08\x0f\x01\x08" } },
    .{ "_hwrite", MethodRecord{ .library = "KERNEL32", .import = "_hwrite", .signature = "\x00\x03\x08\x08\x11\x3d\x08" } },
    .{ "_lclose", MethodRecord{ .library = "KERNEL32", .import = "_lclose", .signature = "\x00\x01\x08\x08" } },
    .{ "_llseek", MethodRecord{ .library = "KERNEL32", .import = "_llseek", .signature = "\x00\x03\x08\x08\x08\x08" } },
    .{ "OpenMutexA", MethodRecord{ .library = "KERNEL32", .import = "OpenMutexA", .signature = "\x00\x03\x11\x80\x85\x09\x11\x59\x11\x3d" } },
    .{ "OpenSemaphoreA", MethodRecord{ .library = "KERNEL32", .import = "OpenSemaphoreA", .signature = "\x00\x03\x11\x80\x85\x09\x11\x59\x11\x3d" } },
    .{ "GetFirmwareEnvironmentVariableA", MethodRecord{ .library = "KERNEL32", .import = "GetFirmwareEnvironmentVariableA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x0f\x01\x09" } },
    .{ "GetFirmwareEnvironmentVariableW", MethodRecord{ .library = "KERNEL32", .import = "GetFirmwareEnvironmentVariableW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x0f\x01\x09" } },
    .{ "GetFirmwareEnvironmentVariableExA", MethodRecord{ .library = "KERNEL32", .import = "GetFirmwareEnvironmentVariableExA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x0f\x01\x09\x0f\x09" } },
    .{ "GetFirmwareEnvironmentVariableExW", MethodRecord{ .library = "KERNEL32", .import = "GetFirmwareEnvironmentVariableExW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x0f\x01\x09\x0f\x09" } },
    .{ "SetFirmwareEnvironmentVariableA", MethodRecord{ .library = "KERNEL32", .import = "SetFirmwareEnvironmentVariableA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x0f\x01\x09" } },
    .{ "SetFirmwareEnvironmentVariableW", MethodRecord{ .library = "KERNEL32", .import = "SetFirmwareEnvironmentVariableW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x0f\x01\x09" } },
    .{ "SetFirmwareEnvironmentVariableExA", MethodRecord{ .library = "KERNEL32", .import = "SetFirmwareEnvironmentVariableExA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x0f\x01\x09\x09" } },
    .{ "SetFirmwareEnvironmentVariableExW", MethodRecord{ .library = "KERNEL32", .import = "SetFirmwareEnvironmentVariableExW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x0f\x01\x09\x09" } },
    .{ "IsNativeVhdBoot", MethodRecord{ .library = "KERNEL32", .import = "IsNativeVhdBoot", .signature = "\x00\x01\x11\x59\x0f\x11\x59" } },
    .{ "GetProfileIntA", MethodRecord{ .library = "KERNEL32", .import = "GetProfileIntA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x08" } },
    .{ "GetProfileIntW", MethodRecord{ .library = "KERNEL32", .import = "GetProfileIntW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x08" } },
    .{ "GetProfileStringA", MethodRecord{ .library = "KERNEL32", .import = "GetProfileStringA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "GetProfileStringW", MethodRecord{ .library = "KERNEL32", .import = "GetProfileStringW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "WriteProfileStringA", MethodRecord{ .library = "KERNEL32", .import = "WriteProfileStringA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "WriteProfileStringW", MethodRecord{ .library = "KERNEL32", .import = "WriteProfileStringW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x05" } },
    .{ "GetProfileSectionA", MethodRecord{ .library = "KERNEL32", .import = "GetProfileSectionA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x09" } },
    .{ "GetProfileSectionW", MethodRecord{ .library = "KERNEL32", .import = "GetProfileSectionW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "WriteProfileSectionA", MethodRecord{ .library = "KERNEL32", .import = "WriteProfileSectionA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "WriteProfileSectionW", MethodRecord{ .library = "KERNEL32", .import = "WriteProfileSectionW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "GetPrivateProfileIntA", MethodRecord{ .library = "KERNEL32", .import = "GetPrivateProfileIntA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x08\x11\x3d" } },
    .{ "GetPrivateProfileIntW", MethodRecord{ .library = "KERNEL32", .import = "GetPrivateProfileIntW", .signature = "\x00\x04\x08\x11\x05\x11\x05\x08\x11\x05" } },
    .{ "GetPrivateProfileStringA", MethodRecord{ .library = "KERNEL32", .import = "GetPrivateProfileStringA", .signature = "\x00\x06\x09\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x09\x11\x3d" } },
    .{ "GetPrivateProfileStringW", MethodRecord{ .library = "KERNEL32", .import = "GetPrivateProfileStringW", .signature = "\x00\x06\x09\x11\x05\x11\x05\x11\x05\x11\x05\x09\x11\x05" } },
    .{ "WritePrivateProfileStringA", MethodRecord{ .library = "KERNEL32", .import = "WritePrivateProfileStringA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "WritePrivateProfileStringW", MethodRecord{ .library = "KERNEL32", .import = "WritePrivateProfileStringW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "GetPrivateProfileSectionA", MethodRecord{ .library = "KERNEL32", .import = "GetPrivateProfileSectionA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x09\x11\x3d" } },
    .{ "GetPrivateProfileSectionW", MethodRecord{ .library = "KERNEL32", .import = "GetPrivateProfileSectionW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x09\x11\x05" } },
    .{ "WritePrivateProfileSectionA", MethodRecord{ .library = "KERNEL32", .import = "WritePrivateProfileSectionA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "WritePrivateProfileSectionW", MethodRecord{ .library = "KERNEL32", .import = "WritePrivateProfileSectionW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x05" } },
    .{ "GetPrivateProfileSectionNamesA", MethodRecord{ .library = "KERNEL32", .import = "GetPrivateProfileSectionNamesA", .signature = "\x00\x03\x09\x11\x3d\x09\x11\x3d" } },
    .{ "GetPrivateProfileSectionNamesW", MethodRecord{ .library = "KERNEL32", .import = "GetPrivateProfileSectionNamesW", .signature = "\x00\x03\x09\x11\x05\x09\x11\x05" } },
    .{ "GetPrivateProfileStructA", MethodRecord{ .library = "KERNEL32", .import = "GetPrivateProfileStructA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x0f\x01\x09\x11\x3d" } },
    .{ "GetPrivateProfileStructW", MethodRecord{ .library = "KERNEL32", .import = "GetPrivateProfileStructW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x0f\x01\x09\x11\x05" } },
    .{ "WritePrivateProfileStructA", MethodRecord{ .library = "KERNEL32", .import = "WritePrivateProfileStructA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x0f\x01\x09\x11\x3d" } },
    .{ "WritePrivateProfileStructW", MethodRecord{ .library = "KERNEL32", .import = "WritePrivateProfileStructW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x0f\x01\x09\x11\x05" } },
    .{ "IsBadHugeReadPtr", MethodRecord{ .library = "KERNEL32", .import = "IsBadHugeReadPtr", .signature = "\x00\x02\x11\x59\x0f\x01\x19" } },
    .{ "IsBadHugeWritePtr", MethodRecord{ .library = "KERNEL32", .import = "IsBadHugeWritePtr", .signature = "\x00\x02\x11\x59\x0f\x01\x19" } },
    .{ "GetComputerNameA", MethodRecord{ .library = "KERNEL32", .import = "GetComputerNameA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x09" } },
    .{ "GetComputerNameW", MethodRecord{ .library = "KERNEL32", .import = "GetComputerNameW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x09" } },
    .{ "DnsHostnameToComputerNameA", MethodRecord{ .library = "KERNEL32", .import = "DnsHostnameToComputerNameA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "DnsHostnameToComputerNameW", MethodRecord{ .library = "KERNEL32", .import = "DnsHostnameToComputerNameW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x0f\x09" } },
    .{ "GetUserNameA", MethodRecord{ .library = "ADVAPI32", .import = "GetUserNameA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x09" } },
    .{ "GetUserNameW", MethodRecord{ .library = "ADVAPI32", .import = "GetUserNameW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x09" } },
    .{ "IsTokenUntrusted", MethodRecord{ .library = "ADVAPI32", .import = "IsTokenUntrusted", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "GetCurrentHwProfileA", MethodRecord{ .library = "ADVAPI32", .import = "GetCurrentHwProfileA", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x45\x4d" } },
    .{ "GetCurrentHwProfileW", MethodRecord{ .library = "ADVAPI32", .import = "GetCurrentHwProfileW", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x45\x51" } },
    .{ "ReplacePartitionUnit", MethodRecord{ .library = "KERNEL32", .import = "ReplacePartitionUnit", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x09" } },
    .{ "GetThreadEnabledXStateFeatures", MethodRecord{ .library = "KERNEL32", .import = "GetThreadEnabledXStateFeatures", .signature = "\x00\x00\x0b" } },
    .{ "EnableProcessOptionalXStateFeatures", MethodRecord{ .library = "KERNEL32", .import = "EnableProcessOptionalXStateFeatures", .signature = "\x00\x01\x11\x59\x0b" } },
    .{ "RaiseCustomSystemEventTrigger", MethodRecord{ .library = "api-ms-win-core-backgroundtask-l1-1-0", .import = "RaiseCustomSystemEventTrigger", .signature = "\x00\x01\x09\x0f\x11\xc0\x00\x45\x49" } },
    .{ "RtlIsNameLegalDOS8Dot3", MethodRecord{ .library = "ntdll", .import = "RtlIsNameLegalDOS8Dot3", .signature = "\x00\x03\x11\x87\x79\x0f\x11\x87\x65\x0f\x11\xc0\x00\x45\x55\x0f\x11\x87\x79" } },
    .{ "RtlLocalTimeToSystemTime", MethodRecord{ .library = "ntdll", .import = "RtlLocalTimeToSystemTime", .signature = "\x00\x02\x11\x84\x71\x0f\x0a\x0f\x0a" } },
    .{ "RtlTimeToSecondsSince1970", MethodRecord{ .library = "ntdll", .import = "RtlTimeToSecondsSince1970", .signature = "\x00\x02\x11\x87\x79\x0f\x0a\x0f\x09" } },
    .{ "RtlFreeAnsiString", MethodRecord{ .library = "ntdll", .import = "RtlFreeAnsiString", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x45\x55" } },
    .{ "RtlFreeUnicodeString", MethodRecord{ .library = "ntdll", .import = "RtlFreeUnicodeString", .signature = "\x00\x01\x01\x0f\x11\x87\x65" } },
    .{ "RtlFreeOemString", MethodRecord{ .library = "ntdll", .import = "RtlFreeOemString", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x45\x55" } },
    .{ "RtlInitString", MethodRecord{ .library = "ntdll", .import = "RtlInitString", .signature = "\x00\x02\x01\x0f\x11\xc0\x00\x45\x55\x0f\x04" } },
    .{ "RtlInitStringEx", MethodRecord{ .library = "ntdll", .import = "RtlInitStringEx", .signature = "\x00\x02\x11\x84\x71\x0f\x11\xc0\x00\x45\x55\x0f\x04" } },
    .{ "RtlInitAnsiString", MethodRecord{ .library = "ntdll", .import = "RtlInitAnsiString", .signature = "\x00\x02\x01\x0f\x11\xc0\x00\x45\x55\x0f\x04" } },
    .{ "RtlInitAnsiStringEx", MethodRecord{ .library = "ntdll", .import = "RtlInitAnsiStringEx", .signature = "\x00\x02\x11\x84\x71\x0f\x11\xc0\x00\x45\x55\x0f\x04" } },
    .{ "RtlInitUnicodeString", MethodRecord{ .library = "ntdll", .import = "RtlInitUnicodeString", .signature = "\x00\x02\x01\x0f\x11\x87\x65\x11\x05" } },
    .{ "RtlAnsiStringToUnicodeString", MethodRecord{ .library = "ntdll", .import = "RtlAnsiStringToUnicodeString", .signature = "\x00\x03\x11\x84\x71\x0f\x11\x87\x65\x0f\x11\xc0\x00\x45\x55\x11\x87\x79" } },
    .{ "RtlUnicodeStringToAnsiString", MethodRecord{ .library = "ntdll", .import = "RtlUnicodeStringToAnsiString", .signature = "\x00\x03\x11\x84\x71\x0f\x11\xc0\x00\x45\x55\x0f\x11\x87\x65\x11\x87\x79" } },
    .{ "RtlUnicodeStringToOemString", MethodRecord{ .library = "ntdll", .import = "RtlUnicodeStringToOemString", .signature = "\x00\x03\x11\x84\x71\x0f\x11\xc0\x00\x45\x55\x0f\x11\x87\x65\x11\x87\x79" } },
    .{ "RtlUnicodeToMultiByteSize", MethodRecord{ .library = "ntdll", .import = "RtlUnicodeToMultiByteSize", .signature = "\x00\x03\x11\x84\x71\x0f\x09\x11\x05\x09" } },
    .{ "RtlCharToInteger", MethodRecord{ .library = "ntdll", .import = "RtlCharToInteger", .signature = "\x00\x03\x11\x84\x71\x0f\x04\x09\x0f\x09" } },
    .{ "RtlUniform", MethodRecord{ .library = "ntdll", .import = "RtlUniform", .signature = "\x00\x01\x09\x0f\x09" } },
    .{ "GetFeatureEnabledState", MethodRecord{ .library = "api-ms-win-core-featurestaging-l1-1-0", .import = "GetFeatureEnabledState", .signature = "\x00\x02\x11\xc0\x00\x45\x59\x09\x11\xc0\x00\x45\x5d" } },
    .{ "RecordFeatureUsage", MethodRecord{ .library = "api-ms-win-core-featurestaging-l1-1-0", .import = "RecordFeatureUsage", .signature = "\x00\x04\x01\x09\x09\x09\x11\x3d" } },
    .{ "RecordFeatureError", MethodRecord{ .library = "api-ms-win-core-featurestaging-l1-1-0", .import = "RecordFeatureError", .signature = "\x00\x02\x01\x09\x0f\x11\xc0\x00\x45\x61" } },
    .{ "SubscribeFeatureStateChangeNotification", MethodRecord{ .library = "api-ms-win-core-featurestaging-l1-1-0", .import = "SubscribeFeatureStateChangeNotification", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x45\x65\x12\xc0\x00\x45\x69\x0f\x01" } },
    .{ "UnsubscribeFeatureStateChangeNotification", MethodRecord{ .library = "api-ms-win-core-featurestaging-l1-1-0", .import = "UnsubscribeFeatureStateChangeNotification", .signature = "\x00\x01\x01\x11\xc0\x00\x45\x65" } },
    .{ "GetFeatureVariant", MethodRecord{ .library = "api-ms-win-core-featurestaging-l1-1-1", .import = "GetFeatureVariant", .signature = "\x00\x04\x09\x09\x11\xc0\x00\x45\x5d\x0f\x09\x0f\x11\x59" } },
    .{ "DCIOpenProvider", MethodRecord{ .library = "DCIMAN32", .import = "DCIOpenProvider", .signature = "\x00\x00\x11\x83\x5d" } },
    .{ "DCICloseProvider", MethodRecord{ .library = "DCIMAN32", .import = "DCICloseProvider", .signature = "\x00\x01\x01\x11\x83\x5d" } },
    .{ "DCICreatePrimary", MethodRecord{ .library = "DCIMAN32", .import = "DCICreatePrimary", .signature = "\x00\x02\x08\x11\x83\x5d\x0f\x0f\x11\xc0\x00\x45\x6d" } },
    .{ "DCICreateOffscreen", MethodRecord{ .library = "DCIMAN32", .import = "DCICreateOffscreen", .signature = "\x00\x0a\x08\x11\x83\x5d\x09\x09\x09\x09\x09\x09\x09\x09\x0f\x0f\x11\xc0\x00\x45\x71" } },
    .{ "DCICreateOverlay", MethodRecord{ .library = "DCIMAN32", .import = "DCICreateOverlay", .signature = "\x00\x03\x08\x11\x83\x5d\x0f\x01\x0f\x0f\x11\xc0\x00\x45\x75" } },
    .{ "DCIEnum", MethodRecord{ .library = "DCIMAN32", .import = "DCIEnum", .signature = "\x00\x05\x08\x11\x83\x5d\x0f\x11\x83\x89\x0f\x11\x83\x89\x0f\x01\x0f\x01" } },
    .{ "DCISetSrcDestClip", MethodRecord{ .library = "DCIMAN32", .import = "DCISetSrcDestClip", .signature = "\x00\x04\x08\x0f\x11\xc0\x00\x45\x71\x0f\x11\x83\x89\x0f\x11\x83\x89\x0f\x11\x8d\xc1" } },
    .{ "WinWatchOpen", MethodRecord{ .library = "DCIMAN32", .import = "WinWatchOpen", .signature = "\x00\x01\x11\xc0\x00\x45\x79\x11\x25" } },
    .{ "WinWatchClose", MethodRecord{ .library = "DCIMAN32", .import = "WinWatchClose", .signature = "\x00\x01\x01\x11\xc0\x00\x45\x79" } },
    .{ "WinWatchGetClipList", MethodRecord{ .library = "DCIMAN32", .import = "WinWatchGetClipList", .signature = "\x00\x04\x09\x11\xc0\x00\x45\x79\x0f\x11\x83\x89\x09\x0f\x11\x8d\xc1" } },
    .{ "WinWatchDidStatusChange", MethodRecord{ .library = "DCIMAN32", .import = "WinWatchDidStatusChange", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x45\x79" } },
    .{ "GetWindowRegionData", MethodRecord{ .library = "DCIMAN32", .import = "GetWindowRegionData", .signature = "\x00\x03\x09\x11\x25\x09\x0f\x11\x8d\xc1" } },
    .{ "GetDCRegionData", MethodRecord{ .library = "DCIMAN32", .import = "GetDCRegionData", .signature = "\x00\x03\x09\x11\x83\x5d\x09\x0f\x11\x8d\xc1" } },
    .{ "WinWatchNotify", MethodRecord{ .library = "DCIMAN32", .import = "WinWatchNotify", .signature = "\x00\x03\x11\x59\x11\xc0\x00\x45\x79\x12\xc0\x00\x45\x7d\x11\x82\x2d" } },
    .{ "DCIEndAccess", MethodRecord{ .library = "DCIMAN32", .import = "DCIEndAccess", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x45\x6d" } },
    .{ "DCIBeginAccess", MethodRecord{ .library = "DCIMAN32", .import = "DCIBeginAccess", .signature = "\x00\x05\x08\x0f\x11\xc0\x00\x45\x6d\x08\x08\x08\x08" } },
    .{ "DCIDestroy", MethodRecord{ .library = "DCIMAN32", .import = "DCIDestroy", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x45\x6d" } },
    .{ "DCIDraw", MethodRecord{ .library = "DCIMAN32", .import = "DCIDraw", .signature = "\x00\x01\x08\x0f\x11\xc0\x00\x45\x71" } },
    .{ "DCISetClipList", MethodRecord{ .library = "DCIMAN32", .import = "DCISetClipList", .signature = "\x00\x02\x08\x0f\x11\xc0\x00\x45\x71\x0f\x11\x8d\xc1" } },
    .{ "DCISetDestination", MethodRecord{ .library = "DCIMAN32", .import = "DCISetDestination", .signature = "\x00\x03\x08\x0f\x11\xc0\x00\x45\x71\x0f\x11\x83\x89\x0f\x11\x83\x89" } },
    .{ "GdiEntry13", MethodRecord{ .library = "api-ms-win-dx-d3dkmt-l1-1-0", .import = "GdiEntry13", .signature = "\x00\x00\x09" } },
    .{ "RunSetupCommandA", MethodRecord{ .library = "ADVPACK", .import = "RunSetupCommandA", .signature = "\x00\x08\x11\x79\x11\x25\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x0f\x11\x80\x85\x09\x0f\x01" } },
    .{ "RunSetupCommandW", MethodRecord{ .library = "ADVPACK", .import = "RunSetupCommandW", .signature = "\x00\x08\x11\x79\x11\x25\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x11\x80\x85\x09\x0f\x01" } },
    .{ "NeedRebootInit", MethodRecord{ .library = "ADVPACK", .import = "NeedRebootInit", .signature = "\x00\x00\x09" } },
    .{ "NeedReboot", MethodRecord{ .library = "ADVPACK", .import = "NeedReboot", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "RebootCheckOnInstallA", MethodRecord{ .library = "ADVPACK", .import = "RebootCheckOnInstallA", .signature = "\x00\x04\x11\x79\x11\x25\x11\x3d\x11\x3d\x09" } },
    .{ "RebootCheckOnInstallW", MethodRecord{ .library = "ADVPACK", .import = "RebootCheckOnInstallW", .signature = "\x00\x04\x11\x79\x11\x25\x11\x05\x11\x05\x09" } },
    .{ "TranslateInfStringA", MethodRecord{ .library = "ADVPACK", .import = "TranslateInfStringA", .signature = "\x00\x08\x11\x79\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x09\x0f\x09\x0f\x01" } },
    .{ "TranslateInfStringW", MethodRecord{ .library = "ADVPACK", .import = "TranslateInfStringW", .signature = "\x00\x08\x11\x79\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x09\x0f\x09\x0f\x01" } },
    .{ "RegInstallA", MethodRecord{ .library = "ADVPACK", .import = "RegInstallA", .signature = "\x00\x03\x11\x79\x11\x81\x81\x11\x3d\x0f\x11\xc0\x00\x45\x81" } },
    .{ "RegInstallW", MethodRecord{ .library = "ADVPACK", .import = "RegInstallW", .signature = "\x00\x03\x11\x79\x11\x81\x81\x11\x05\x0f\x11\xc0\x00\x45\x85" } },
    .{ "LaunchINFSectionExW", MethodRecord{ .library = "ADVPACK", .import = "LaunchINFSectionExW", .signature = "\x00\x04\x11\x79\x11\x25\x11\x82\x29\x11\x05\x08" } },
    .{ "ExecuteCabA", MethodRecord{ .library = "ADVPACK", .import = "ExecuteCabA", .signature = "\x00\x03\x11\x79\x11\x25\x0f\x11\xc0\x00\x45\x89\x0f\x01" } },
    .{ "ExecuteCabW", MethodRecord{ .library = "ADVPACK", .import = "ExecuteCabW", .signature = "\x00\x03\x11\x79\x11\x25\x0f\x11\xc0\x00\x45\x8d\x0f\x01" } },
    .{ "AdvInstallFileA", MethodRecord{ .library = "ADVPACK", .import = "AdvInstallFileA", .signature = "\x00\x07\x11\x79\x11\x25\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x09\x09" } },
    .{ "AdvInstallFileW", MethodRecord{ .library = "ADVPACK", .import = "AdvInstallFileW", .signature = "\x00\x07\x11\x79\x11\x25\x11\x05\x11\x05\x11\x05\x11\x05\x09\x09" } },
    .{ "RegSaveRestoreA", MethodRecord{ .library = "ADVPACK", .import = "RegSaveRestoreA", .signature = "\x00\x07\x11\x79\x11\x25\x11\x3d\x11\x55\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "RegSaveRestoreW", MethodRecord{ .library = "ADVPACK", .import = "RegSaveRestoreW", .signature = "\x00\x07\x11\x79\x11\x25\x11\x05\x11\x55\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "RegSaveRestoreOnINFA", MethodRecord{ .library = "ADVPACK", .import = "RegSaveRestoreOnINFA", .signature = "\x00\x07\x11\x79\x11\x25\x11\x3d\x11\x3d\x11\x3d\x11\x55\x11\x55\x09" } },
    .{ "RegSaveRestoreOnINFW", MethodRecord{ .library = "ADVPACK", .import = "RegSaveRestoreOnINFW", .signature = "\x00\x07\x11\x79\x11\x25\x11\x05\x11\x05\x11\x05\x11\x55\x11\x55\x09" } },
    .{ "RegRestoreAllA", MethodRecord{ .library = "ADVPACK", .import = "RegRestoreAllA", .signature = "\x00\x03\x11\x79\x11\x25\x11\x3d\x11\x55" } },
    .{ "RegRestoreAllW", MethodRecord{ .library = "ADVPACK", .import = "RegRestoreAllW", .signature = "\x00\x03\x11\x79\x11\x25\x11\x05\x11\x55" } },
    .{ "FileSaveRestoreW", MethodRecord{ .library = "ADVPACK", .import = "FileSaveRestoreW", .signature = "\x00\x05\x11\x79\x11\x25\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "FileSaveRestoreOnINFA", MethodRecord{ .library = "ADVPACK", .import = "FileSaveRestoreOnINFA", .signature = "\x00\x07\x11\x79\x11\x25\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "FileSaveRestoreOnINFW", MethodRecord{ .library = "ADVPACK", .import = "FileSaveRestoreOnINFW", .signature = "\x00\x07\x11\x79\x11\x25\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "AddDelBackupEntryA", MethodRecord{ .library = "ADVPACK", .import = "AddDelBackupEntryA", .signature = "\x00\x04\x11\x79\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "AddDelBackupEntryW", MethodRecord{ .library = "ADVPACK", .import = "AddDelBackupEntryW", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "FileSaveMarkNotExistA", MethodRecord{ .library = "ADVPACK", .import = "FileSaveMarkNotExistA", .signature = "\x00\x03\x11\x79\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "FileSaveMarkNotExistW", MethodRecord{ .library = "ADVPACK", .import = "FileSaveMarkNotExistW", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x11\x05" } },
    .{ "GetVersionFromFileA", MethodRecord{ .library = "ADVPACK", .import = "GetVersionFromFileA", .signature = "\x00\x04\x11\x79\x11\x3d\x0f\x09\x0f\x09\x11\x59" } },
    .{ "GetVersionFromFileW", MethodRecord{ .library = "ADVPACK", .import = "GetVersionFromFileW", .signature = "\x00\x04\x11\x79\x11\x05\x0f\x09\x0f\x09\x11\x59" } },
    .{ "GetVersionFromFileExA", MethodRecord{ .library = "ADVPACK", .import = "GetVersionFromFileExA", .signature = "\x00\x04\x11\x79\x11\x3d\x0f\x09\x0f\x09\x11\x59" } },
    .{ "GetVersionFromFileExW", MethodRecord{ .library = "ADVPACK", .import = "GetVersionFromFileExW", .signature = "\x00\x04\x11\x79\x11\x05\x0f\x09\x0f\x09\x11\x59" } },
    .{ "IsNTAdmin", MethodRecord{ .library = "ADVPACK", .import = "IsNTAdmin", .signature = "\x00\x02\x11\x59\x09\x0f\x09" } },
    .{ "DelNodeA", MethodRecord{ .library = "ADVPACK", .import = "DelNodeA", .signature = "\x00\x02\x11\x79\x11\x3d\x09" } },
    .{ "DelNodeW", MethodRecord{ .library = "ADVPACK", .import = "DelNodeW", .signature = "\x00\x02\x11\x79\x11\x05\x09" } },
    .{ "DelNodeRunDLL32W", MethodRecord{ .library = "ADVPACK", .import = "DelNodeRunDLL32W", .signature = "\x00\x04\x11\x79\x11\x25\x11\x82\x29\x11\x05\x08" } },
    .{ "OpenINFEngineA", MethodRecord{ .library = "ADVPACK", .import = "OpenINFEngineA", .signature = "\x00\x05\x11\x79\x11\x3d\x11\x3d\x09\x0f\x0f\x01\x0f\x01" } },
    .{ "OpenINFEngineW", MethodRecord{ .library = "ADVPACK", .import = "OpenINFEngineW", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x09\x0f\x0f\x01\x0f\x01" } },
    .{ "TranslateInfStringExA", MethodRecord{ .library = "ADVPACK", .import = "TranslateInfStringExA", .signature = "\x00\x08\x11\x79\x0f\x01\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x09\x0f\x09\x0f\x01" } },
    .{ "TranslateInfStringExW", MethodRecord{ .library = "ADVPACK", .import = "TranslateInfStringExW", .signature = "\x00\x08\x11\x79\x0f\x01\x11\x05\x11\x05\x11\x05\x11\x05\x09\x0f\x09\x0f\x01" } },
    .{ "CloseINFEngine", MethodRecord{ .library = "ADVPACK", .import = "CloseINFEngine", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "ExtractFilesA", MethodRecord{ .library = "ADVPACK", .import = "ExtractFilesA", .signature = "\x00\x06\x11\x79\x11\x3d\x11\x3d\x09\x11\x3d\x0f\x01\x09" } },
    .{ "ExtractFilesW", MethodRecord{ .library = "ADVPACK", .import = "ExtractFilesW", .signature = "\x00\x06\x11\x79\x11\x05\x11\x05\x09\x11\x05\x0f\x01\x09" } },
    .{ "LaunchINFSectionW", MethodRecord{ .library = "ADVPACK", .import = "LaunchINFSectionW", .signature = "\x00\x04\x08\x11\x25\x11\x82\x29\x11\x05\x08" } },
    .{ "UserInstStubWrapperA", MethodRecord{ .library = "ADVPACK", .import = "UserInstStubWrapperA", .signature = "\x00\x04\x11\x79\x11\x25\x11\x82\x29\x11\x3d\x08" } },
    .{ "UserInstStubWrapperW", MethodRecord{ .library = "ADVPACK", .import = "UserInstStubWrapperW", .signature = "\x00\x04\x11\x79\x11\x25\x11\x82\x29\x11\x05\x08" } },
    .{ "UserUnInstStubWrapperA", MethodRecord{ .library = "ADVPACK", .import = "UserUnInstStubWrapperA", .signature = "\x00\x04\x11\x79\x11\x25\x11\x82\x29\x11\x3d\x08" } },
    .{ "UserUnInstStubWrapperW", MethodRecord{ .library = "ADVPACK", .import = "UserUnInstStubWrapperW", .signature = "\x00\x04\x11\x79\x11\x25\x11\x82\x29\x11\x05\x08" } },
    .{ "SetPerUserSecValuesA", MethodRecord{ .library = "ADVPACK", .import = "SetPerUserSecValuesA", .signature = "\x00\x01\x11\x79\x0f\x11\xc0\x00\x45\x91" } },
    .{ "SetPerUserSecValuesW", MethodRecord{ .library = "ADVPACK", .import = "SetPerUserSecValuesW", .signature = "\x00\x01\x11\x79\x0f\x11\xc0\x00\x45\x95" } },
    .{ "SendIMEMessageExA", MethodRecord{ .library = "USER32", .import = "SendIMEMessageExA", .signature = "\x00\x02\x11\x82\x35\x11\x25\x11\x82\x2d" } },
    .{ "SendIMEMessageExW", MethodRecord{ .library = "USER32", .import = "SendIMEMessageExW", .signature = "\x00\x02\x11\x82\x35\x11\x25\x11\x82\x2d" } },
    .{ "IMPGetIMEA", MethodRecord{ .library = "USER32", .import = "IMPGetIMEA", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xc0\x00\x45\x99" } },
    .{ "IMPGetIMEW", MethodRecord{ .library = "USER32", .import = "IMPGetIMEW", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xc0\x00\x45\x9d" } },
    .{ "IMPQueryIMEA", MethodRecord{ .library = "USER32", .import = "IMPQueryIMEA", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x45\x99" } },
    .{ "IMPQueryIMEW", MethodRecord{ .library = "USER32", .import = "IMPQueryIMEW", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x45\x9d" } },
    .{ "IMPSetIMEA", MethodRecord{ .library = "USER32", .import = "IMPSetIMEA", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xc0\x00\x45\x99" } },
    .{ "IMPSetIMEW", MethodRecord{ .library = "USER32", .import = "IMPSetIMEW", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xc0\x00\x45\x9d" } },
    .{ "WINNLSGetIMEHotkey", MethodRecord{ .library = "USER32", .import = "WINNLSGetIMEHotkey", .signature = "\x00\x01\x09\x11\x25" } },
    .{ "WINNLSEnableIME", MethodRecord{ .library = "USER32", .import = "WINNLSEnableIME", .signature = "\x00\x02\x11\x59\x11\x25\x11\x59" } },
    .{ "WINNLSGetEnableStatus", MethodRecord{ .library = "USER32", .import = "WINNLSGetEnableStatus", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "ApphelpCheckShellObject", MethodRecord{ .library = "APPHELP", .import = "ApphelpCheckShellObject", .signature = "\x00\x03\x11\x59\x0f\x11\x0d\x11\x59\x0f\x0b" } },
    .{ "WldpGetLockdownPolicy", MethodRecord{ .library = "Wldp", .import = "WldpGetLockdownPolicy", .signature = "\x00\x03\x11\x79\x0f\x11\xc0\x00\x45\xa1\x0f\x09\x09" } },
    .{ "WldpIsClassInApprovedList", MethodRecord{ .library = "Wldp", .import = "WldpIsClassInApprovedList", .signature = "\x00\x04\x11\x79\x0f\x11\x0d\x0f\x11\xc0\x00\x45\xa1\x0f\x11\x59\x09" } },
    .{ "WldpQuerySecurityPolicy", MethodRecord{ .library = "Wldp", .import = "WldpQuerySecurityPolicy", .signature = "\x00\x06\x11\x79\x0f\x11\x87\x65\x0f\x11\x87\x65\x0f\x11\x87\x65\x0f\x11\xc0\x00\x45\xa5\x0f\x01\x0f\x09" } },
    .{ "WldpSetDynamicCodeTrust", MethodRecord{ .library = "Wldp", .import = "WldpSetDynamicCodeTrust", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "WldpIsDynamicCodePolicyEnabled", MethodRecord{ .library = "Wldp", .import = "WldpIsDynamicCodePolicyEnabled", .signature = "\x00\x01\x11\x79\x0f\x11\x59" } },
    .{ "WldpQueryDynamicCodeTrust", MethodRecord{ .library = "Wldp", .import = "WldpQueryDynamicCodeTrust", .signature = "\x00\x03\x11\x79\x11\x80\x85\x0f\x01\x09" } },
    .{ "WldpQueryWindowsLockdownMode", MethodRecord{ .library = "Wldp", .import = "WldpQueryWindowsLockdownMode", .signature = "\x00\x01\x11\x79\x0f\x11\xc0\x00\x45\xa9" } },
    .{ "WldpQueryDeviceSecurityInformation", MethodRecord{ .library = "Wldp", .import = "WldpQueryDeviceSecurityInformation", .signature = "\x00\x03\x11\x79\x0f\x11\xc0\x00\x45\xad\x09\x0f\x09" } },
    .{ "WldpQueryWindowsLockdownRestriction", MethodRecord{ .library = "Wldp", .import = "WldpQueryWindowsLockdownRestriction", .signature = "\x00\x01\x11\x79\x0f\x11\xc0\x00\x45\xb1" } },
    .{ "WldpSetWindowsLockdownRestriction", MethodRecord{ .library = "Wldp", .import = "WldpSetWindowsLockdownRestriction", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x45\xb1" } },
    .{ "WldpIsAppApprovedByPolicy", MethodRecord{ .library = "Wldp", .import = "WldpIsAppApprovedByPolicy", .signature = "\x00\x02\x11\x79\x11\x05\x0b" } },
    .{ "WldpQueryPolicySettingEnabled", MethodRecord{ .library = "Wldp", .import = "WldpQueryPolicySettingEnabled", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x45\xb5\x0f\x11\x59" } },
    .{ "WldpQueryPolicySettingEnabled2", MethodRecord{ .library = "Wldp", .import = "WldpQueryPolicySettingEnabled2", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x59" } },
    .{ "WldpIsWcosProductionConfiguration", MethodRecord{ .library = "Wldp", .import = "WldpIsWcosProductionConfiguration", .signature = "\x00\x01\x11\x79\x0f\x11\x59" } },
    .{ "WldpResetWcosProductionConfiguration", MethodRecord{ .library = "Wldp", .import = "WldpResetWcosProductionConfiguration", .signature = "\x00\x00\x11\x79" } },
    .{ "WldpIsProductionConfiguration", MethodRecord{ .library = "Wldp", .import = "WldpIsProductionConfiguration", .signature = "\x00\x01\x11\x79\x0f\x11\x59" } },
    .{ "WldpResetProductionConfiguration", MethodRecord{ .library = "Wldp", .import = "WldpResetProductionConfiguration", .signature = "\x00\x00\x11\x79" } },
    .{ "WldpCanExecuteFile", MethodRecord{ .library = "Wldp", .import = "WldpCanExecuteFile", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x11\xc0\x00\x45\xb9\x11\x80\x85\x11\x05\x0f\x11\xc0\x00\x45\xbd" } },
    .{ "WldpCanExecuteBuffer", MethodRecord{ .library = "Wldp", .import = "WldpCanExecuteBuffer", .signature = "\x00\x06\x11\x79\x0f\x11\x0d\x11\xc0\x00\x45\xb9\x0f\x05\x09\x11\x05\x0f\x11\xc0\x00\x45\xbd" } },
    .{ "WldpCanExecuteStream", MethodRecord{ .library = "Wldp", .import = "WldpCanExecuteStream", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x11\xc0\x00\x45\xb9\x12\x83\x75\x11\x05\x0f\x11\xc0\x00\x45\xbd" } },
    .{ "WldpCanExecuteFileFromDetachedSignature", MethodRecord{ .library = "Wldp", .import = "WldpCanExecuteFileFromDetachedSignature", .signature = "\x00\x06\x11\x79\x0f\x11\x0d\x11\xc0\x00\x45\xb9\x11\x80\x85\x11\x80\x85\x11\x05\x0f\x11\xc0\x00\x45\xbd" } },
    .{ "WldpGetApplicationSettingBoolean", MethodRecord{ .library = "Wldp", .import = "WldpGetApplicationSettingBoolean", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x0f\x11\x59" } },
    .{ "WldpGetApplicationSettingStringList", MethodRecord{ .library = "Wldp", .import = "WldpGetApplicationSettingStringList", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x19\x0f\x19\x11\x05" } },
    .{ "WldpGetApplicationSettingStringSet", MethodRecord{ .library = "Wldp", .import = "WldpGetApplicationSettingStringSet", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x19\x0f\x19\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x55 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "HKEY" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x181 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HMODULE" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x235 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LRESULT" },
        0x35d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HDC" },
        0x375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IStream" },
        0x389 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "RECT" },
        0x471 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "NTSTATUS" },
        0x765 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "UNICODE_STRING" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0xd39 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HGLOBAL" },
        0xd3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HLOCAL" },
        0xdc1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "RGNDATA" },
        0x4549 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG" },
        0x454d => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "HW_PROFILE_INFOA" },
        0x4551 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "HW_PROFILE_INFOW" },
        0x4555 => TypeRefEntry{ .namespace = "Windows.Win32.System.Kernel", .name = "STRING" },
        0x4559 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "FEATURE_ENABLED_STATE" },
        0x455d => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "FEATURE_CHANGE_TIME" },
        0x4561 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "FEATURE_ERROR" },
        0x4565 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "FEATURE_STATE_CHANGE_SUBSCRIPTION" },
        0x4569 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "PFEATURE_STATE_CHANGE_CALLBACK" },
        0x456d => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "DCISURFACEINFO" },
        0x4571 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "DCIOFFSCREEN" },
        0x4575 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "DCIOVERLAY" },
        0x4579 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "HWINWATCH" },
        0x457d => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "WINWATCHNOTIFYPROC" },
        0x4581 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "STRTABLEA" },
        0x4585 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "STRTABLEW" },
        0x4589 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "CABINFOA" },
        0x458d => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "CABINFOW" },
        0x4591 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "PERUSERSECTIONA" },
        0x4595 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "PERUSERSECTIONW" },
        0x4599 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "IMEPROA" },
        0x459d => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "IMEPROW" },
        0x45a1 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "WLDP_HOST_INFORMATION" },
        0x45a5 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "WLDP_SECURE_SETTING_VALUE_TYPE" },
        0x45a9 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "WLDP_WINDOWS_LOCKDOWN_MODE" },
        0x45ad => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "WLDP_DEVICE_SECURITY_INFORMATION" },
        0x45b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "WLDP_WINDOWS_LOCKDOWN_RESTRICTION" },
        0x45b5 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "WLDP_POLICY_SETTING" },
        0x45b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "WLDP_EXECUTION_EVALUATION_OPTIONS" },
        0x45bd => TypeRefEntry{ .namespace = "Windows.Win32.System.WindowsProgramming", .name = "WLDP_EXECUTION_POLICY" },
        else => null,
    };
}

pub const GENERIC_ENTITY = 0;
pub const AT_ENTITY = 640;
pub const CL_NL_ENTITY = 769;
pub const CO_NL_ENTITY = 768;
pub const CL_TL_ENTITY = 1025;
pub const CO_TL_ENTITY = 1024;
pub const ER_ENTITY = 896;
pub const IF_ENTITY = 512;
pub const WLDP_LOCKDOWN_UNDEFINED = 0;
pub const WLDP_LOCKDOWN_DEFINED_FLAG = 2147483648;
pub const WLDP_LOCKDOWN_CONFIG_CI_FLAG = 1;
pub const WLDP_LOCKDOWN_CONFIG_CI_AUDIT_FLAG = 2;
pub const WLDP_LOCKDOWN_UMCIENFORCE_FLAG = 4;
pub const WLDP_LOCKDOWN_AUDIT_FLAG = 8;
pub const WLDP_LOCKDOWN_EXCLUSION_FLAG = 16;
pub const WLDP_LOCKDOWN_OFF = 2147483648;
pub const WLDP_HOST_INFORMATION_REVISION = 1;
pub const WLDP_FLAGS_SKIPSIGNATUREVALIDATION = 256;
pub const MAX_TDI_ENTITIES = 4096;
pub const INFO_CLASS_GENERIC = 256;
pub const INFO_CLASS_PROTOCOL = 512;
pub const INFO_CLASS_IMPLEMENTATION = 768;
pub const INFO_TYPE_PROVIDER = 256;
pub const INFO_TYPE_ADDRESS_OBJECT = 512;
pub const INFO_TYPE_CONNECTION = 768;
pub const ENTITY_LIST_ID = 0;
pub const INVALID_ENTITY_INSTANCE = -1;
pub const CONTEXT_SIZE = 16;
pub const ENTITY_TYPE_ID = 1;
pub const CO_TL_NBF = 1024;
pub const CO_TL_SPX = 1026;
pub const CO_TL_TCP = 1028;
pub const CO_TL_SPP = 1030;
pub const CL_TL_NBF = 1025;
pub const CL_TL_UDP = 1027;
pub const ER_ICMP = 896;
pub const CL_NL_IPX = 769;
pub const CL_NL_IP = 771;
pub const AT_ARP = 640;
pub const AT_NULL = 642;
pub const IF_GENERIC = 512;
pub const IF_MIB = 514;
pub const IOCTL_TDI_TL_IO_CONTROL_ENDPOINT = 2162744;
pub const DCI_VERSION = 256;
pub const DCICREATEPRIMARYSURFACE = 1;
pub const DCICREATEOFFSCREENSURFACE = 2;
pub const DCICREATEOVERLAYSURFACE = 3;
pub const DCIENUMSURFACE = 4;
pub const DCIESCAPE = 5;
pub const DCI_OK = 0;
pub const DCI_FAIL_GENERIC = -1;
pub const DCI_FAIL_UNSUPPORTEDVERSION = -2;
pub const DCI_FAIL_INVALIDSURFACE = -3;
pub const DCI_FAIL_UNSUPPORTED = -4;
pub const DCI_ERR_CURRENTLYNOTAVAIL = -5;
pub const DCI_ERR_INVALIDRECT = -6;
pub const DCI_ERR_UNSUPPORTEDFORMAT = -7;
pub const DCI_ERR_UNSUPPORTEDMASK = -8;
pub const DCI_ERR_TOOBIGHEIGHT = -9;
pub const DCI_ERR_TOOBIGWIDTH = -10;
pub const DCI_ERR_TOOBIGSIZE = -11;
pub const DCI_ERR_OUTOFMEMORY = -12;
pub const DCI_ERR_INVALIDPOSITION = -13;
pub const DCI_ERR_INVALIDSTRETCH = -14;
pub const DCI_ERR_INVALIDCLIPLIST = -15;
pub const DCI_ERR_SURFACEISOBSCURED = -16;
pub const DCI_ERR_XALIGN = -17;
pub const DCI_ERR_YALIGN = -18;
pub const DCI_ERR_XYALIGN = -19;
pub const DCI_ERR_WIDTHALIGN = -20;
pub const DCI_ERR_HEIGHTALIGN = -21;
pub const DCI_STATUS_POINTERCHANGED = 1;
pub const DCI_STATUS_STRIDECHANGED = 2;
pub const DCI_STATUS_FORMATCHANGED = 4;
pub const DCI_STATUS_SURFACEINFOCHANGED = 8;
pub const DCI_STATUS_CHROMAKEYCHANGED = 16;
pub const DCI_STATUS_WASSTILLDRAWING = 32;
pub const DCI_SURFACE_TYPE = 15;
pub const DCI_PRIMARY = 0;
pub const DCI_OFFSCREEN = 1;
pub const DCI_OVERLAY = 2;
pub const DCI_VISIBLE = 16;
pub const DCI_CHROMAKEY = 32;
pub const DCI_1632_ACCESS = 64;
pub const DCI_DWORDSIZE = 128;
pub const DCI_DWORDALIGN = 256;
pub const DCI_WRITEONLY = 512;
pub const DCI_ASYNC = 1024;
pub const DCI_CAN_STRETCHX = 4096;
pub const DCI_CAN_STRETCHY = 8192;
pub const DCI_CAN_STRETCHXN = 16384;
pub const DCI_CAN_STRETCHYN = 32768;
pub const DCI_CANOVERLAY = 65536;
pub const FILE_FLAG_OPEN_REQUIRING_OPLOCK = 262144;
pub const FILE_FLAG_IGNORE_IMPERSONATED_DEVICEMAP = 131072;
pub const FILE_FLAG_DISALLOW_PATH_REDIRECTS = 65536;
pub const FAIL_FAST_GENERATE_EXCEPTION_ADDRESS = 1;
pub const FAIL_FAST_NO_HARD_ERROR_DLG = 2;
pub const SP_SERIALCOMM = 1;
pub const PST_UNSPECIFIED = 0;
pub const PST_RS232 = 1;
pub const PST_PARALLELPORT = 2;
pub const PST_RS422 = 3;
pub const PST_RS423 = 4;
pub const PST_RS449 = 5;
pub const PST_MODEM = 6;
pub const PST_FAX = 33;
pub const PST_SCANNER = 34;
pub const PST_NETWORK_BRIDGE = 256;
pub const PST_LAT = 257;
pub const PST_TCPIP_TELNET = 258;
pub const PST_X25 = 259;
pub const PCF_DTRDSR = 1;
pub const PCF_RTSCTS = 2;
pub const PCF_RLSD = 4;
pub const PCF_PARITY_CHECK = 8;
pub const PCF_XONXOFF = 16;
pub const PCF_SETXCHAR = 32;
pub const PCF_TOTALTIMEOUTS = 64;
pub const PCF_INTTIMEOUTS = 128;
pub const PCF_SPECIALCHARS = 256;
pub const PCF_16BITMODE = 512;
pub const SP_PARITY = 1;
pub const SP_BAUD = 2;
pub const SP_DATABITS = 4;
pub const SP_STOPBITS = 8;
pub const SP_HANDSHAKING = 16;
pub const SP_PARITY_CHECK = 32;
pub const SP_RLSD = 64;
pub const BAUD_075 = 1;
pub const BAUD_110 = 2;
pub const BAUD_134_5 = 4;
pub const BAUD_150 = 8;
pub const BAUD_300 = 16;
pub const BAUD_600 = 32;
pub const BAUD_1200 = 64;
pub const BAUD_1800 = 128;
pub const BAUD_2400 = 256;
pub const BAUD_4800 = 512;
pub const BAUD_7200 = 1024;
pub const BAUD_9600 = 2048;
pub const BAUD_14400 = 4096;
pub const BAUD_19200 = 8192;
pub const BAUD_38400 = 16384;
pub const BAUD_56K = 32768;
pub const BAUD_128K = 65536;
pub const BAUD_115200 = 131072;
pub const BAUD_57600 = 262144;
pub const BAUD_USER = 268435456;
pub const COMMPROP_INITIALIZED = 3879531822;
pub const DTR_CONTROL_DISABLE = 0;
pub const DTR_CONTROL_ENABLE = 1;
pub const DTR_CONTROL_HANDSHAKE = 2;
pub const RTS_CONTROL_DISABLE = 0;
pub const RTS_CONTROL_ENABLE = 1;
pub const RTS_CONTROL_HANDSHAKE = 2;
pub const RTS_CONTROL_TOGGLE = 3;
pub const GMEM_NOCOMPACT = 16;
pub const GMEM_NODISCARD = 32;
pub const GMEM_MODIFY = 128;
pub const GMEM_DISCARDABLE = 256;
pub const GMEM_NOT_BANKED = 4096;
pub const GMEM_SHARE = 8192;
pub const GMEM_DDESHARE = 8192;
pub const GMEM_NOTIFY = 16384;
pub const GMEM_LOWER = 4096;
pub const GMEM_VALID_FLAGS = 32626;
pub const GMEM_INVALID_HANDLE = 32768;
pub const GMEM_DISCARDED = 16384;
pub const GMEM_LOCKCOUNT = 255;
pub const THREAD_PRIORITY_ERROR_RETURN = 2147483647;
pub const DRIVE_UNKNOWN = 0;
pub const DRIVE_NO_ROOT_DIR = 1;
pub const DRIVE_REMOVABLE = 2;
pub const DRIVE_FIXED = 3;
pub const DRIVE_REMOTE = 4;
pub const DRIVE_CDROM = 5;
pub const DRIVE_RAMDISK = 6;
pub const IGNORE = 0;
pub const CBR_110 = 110;
pub const CBR_300 = 300;
pub const CBR_600 = 600;
pub const CBR_1200 = 1200;
pub const CBR_2400 = 2400;
pub const CBR_4800 = 4800;
pub const CBR_9600 = 9600;
pub const CBR_14400 = 14400;
pub const CBR_19200 = 19200;
pub const CBR_38400 = 38400;
pub const CBR_56000 = 56000;
pub const CBR_57600 = 57600;
pub const CBR_115200 = 115200;
pub const CBR_128000 = 128000;
pub const CBR_256000 = 256000;
pub const CE_TXFULL = 256;
pub const CE_PTO = 512;
pub const CE_IOE = 1024;
pub const CE_DNS = 2048;
pub const CE_OOP = 4096;
pub const CE_MODE = 32768;
pub const IE_BADID = -1;
pub const IE_OPEN = -2;
pub const IE_NOPEN = -3;
pub const IE_MEMORY = -4;
pub const IE_DEFAULT = -5;
pub const IE_HARDWARE = -10;
pub const IE_BYTESIZE = -11;
pub const IE_BAUDRATE = -12;
pub const RESETDEV = 7;
pub const LPTx = 128;
pub const S_QUEUEEMPTY = 0;
pub const S_THRESHOLD = 1;
pub const S_ALLTHRESHOLD = 2;
pub const S_NORMAL = 0;
pub const S_LEGATO = 1;
pub const S_STACCATO = 2;
pub const S_PERIOD512 = 0;
pub const S_PERIOD1024 = 1;
pub const S_PERIOD2048 = 2;
pub const S_PERIODVOICE = 3;
pub const S_WHITE512 = 4;
pub const S_WHITE1024 = 5;
pub const S_WHITE2048 = 6;
pub const S_WHITEVOICE = 7;
pub const S_SERDVNA = -1;
pub const S_SEROFM = -2;
pub const S_SERMACT = -3;
pub const S_SERQFUL = -4;
pub const S_SERBDNT = -5;
pub const S_SERDLN = -6;
pub const S_SERDCC = -7;
pub const S_SERDTP = -8;
pub const S_SERDVL = -9;
pub const S_SERDMD = -10;
pub const S_SERDSH = -11;
pub const S_SERDPT = -12;
pub const S_SERDFQ = -13;
pub const S_SERDDR = -14;
pub const S_SERDSR = -15;
pub const S_SERDST = -16;
pub const FS_CASE_IS_PRESERVED = 2;
pub const FS_CASE_SENSITIVE = 1;
pub const FS_UNICODE_STORED_ON_DISK = 4;
pub const FS_PERSISTENT_ACLS = 8;
pub const FS_VOL_IS_COMPRESSED = 32768;
pub const FS_FILE_COMPRESSION = 16;
pub const FS_FILE_ENCRYPTION = 131072;
pub const OFS_MAXPATHNAME = 128;
pub const MAXINTATOM = 49152;
pub const SCS_32BIT_BINARY = 0;
pub const SCS_DOS_BINARY = 1;
pub const SCS_WOW_BINARY = 2;
pub const SCS_PIF_BINARY = 3;
pub const SCS_POSIX_BINARY = 4;
pub const SCS_OS216_BINARY = 5;
pub const SCS_64BIT_BINARY = 6;
pub const SCS_THIS_PLATFORM_BINARY = 6;
pub const FIBER_FLAG_FLOAT_SWITCH = 1;
pub const UMS_VERSION = 256;
pub const FILE_SKIP_COMPLETION_PORT_ON_SUCCESS = 1;
pub const FILE_SKIP_SET_EVENT_ON_HANDLE = 2;
pub const CRITICAL_SECTION_NO_DEBUG_INFO = 16777216;
pub const HINSTANCE_ERROR = 32;
pub const FORMAT_MESSAGE_MAX_WIDTH_MASK = 255;
pub const FILE_ENCRYPTABLE = 0;
pub const FILE_IS_ENCRYPTED = 1;
pub const FILE_SYSTEM_ATTR = 2;
pub const FILE_ROOT_DIR = 3;
pub const FILE_SYSTEM_DIR = 4;
pub const FILE_UNKNOWN = 5;
pub const FILE_SYSTEM_NOT_SUPPORT = 6;
pub const FILE_USER_DISALLOWED = 7;
pub const FILE_READ_ONLY = 8;
pub const FILE_DIR_DISALLOWED = 9;
pub const EFS_USE_RECOVERY_KEYS = 1;
pub const CREATE_FOR_IMPORT = 1;
pub const CREATE_FOR_DIR = 2;
pub const OVERWRITE_HIDDEN = 4;
pub const EFSRPC_SECURE_ONLY = 8;
pub const EFS_DROP_ALTERNATE_STREAMS = 16;
pub const BACKUP_INVALID = 0;
pub const BACKUP_GHOSTED_FILE_EXTENTS = 11;
pub const STREAM_NORMAL_ATTRIBUTE = 0;
pub const STREAM_MODIFIED_WHEN_READ = 1;
pub const STREAM_CONTAINS_SECURITY = 2;
pub const STREAM_CONTAINS_PROPERTIES = 4;
pub const STREAM_SPARSE_ATTRIBUTE = 8;
pub const STREAM_CONTAINS_GHOSTED_FILE_EXTENTS = 16;
pub const STARTF_HOLOGRAPHIC = 262144;
pub const SHUTDOWN_NORETRY = 1;
pub const PROTECTION_LEVEL_SAME = 4294967295;
pub const ATOM_FLAG_GLOBAL = 2;
pub const BASE_SEARCH_PATH_ENABLE_SAFE_SEARCHMODE = 1;
pub const BASE_SEARCH_PATH_DISABLE_SAFE_SEARCHMODE = 65536;
pub const BASE_SEARCH_PATH_PERMANENT = 32768;
pub const EVENTLOG_FULL_INFO = 0;
pub const OPERATION_API_VERSION = 1;
pub const MAX_COMPUTERNAME_LENGTH = 15;
pub const LOGON32_PROVIDER_WINNT35 = 1;
pub const LOGON32_PROVIDER_VIRTUAL = 4;
pub const LOGON_ZERO_PASSWORD_BUFFER = 2147483648;
pub const HW_PROFILE_GUIDLEN = 39;
pub const DOCKINFO_UNDOCKED = 1;
pub const DOCKINFO_DOCKED = 2;
pub const DOCKINFO_USER_SUPPLIED = 4;
pub const TC_NORMAL = 0;
pub const TC_HARDERR = 1;
pub const TC_GP_TRAP = 2;
pub const TC_SIGNAL = 3;
pub const AC_LINE_OFFLINE = 0;
pub const AC_LINE_ONLINE = 1;
pub const AC_LINE_BACKUP_POWER = 2;
pub const AC_LINE_UNKNOWN = 255;
pub const BATTERY_FLAG_HIGH = 1;
pub const BATTERY_FLAG_LOW = 2;
pub const BATTERY_FLAG_CRITICAL = 4;
pub const BATTERY_FLAG_CHARGING = 8;
pub const BATTERY_FLAG_NO_BATTERY = 128;
pub const BATTERY_FLAG_UNKNOWN = 255;
pub const BATTERY_PERCENTAGE_UNKNOWN = 255;
pub const SYSTEM_STATUS_FLAG_POWER_SAVING_ON = 1;
pub const BATTERY_LIFE_UNKNOWN = 4294967295;
pub const ACTCTX_FLAG_PROCESSOR_ARCHITECTURE_VALID = 1;
pub const ACTCTX_FLAG_LANGID_VALID = 2;
pub const ACTCTX_FLAG_ASSEMBLY_DIRECTORY_VALID = 4;
pub const ACTCTX_FLAG_RESOURCE_NAME_VALID = 8;
pub const ACTCTX_FLAG_SET_PROCESS_DEFAULT = 16;
pub const ACTCTX_FLAG_APPLICATION_NAME_VALID = 32;
pub const ACTCTX_FLAG_SOURCE_IS_ASSEMBLYREF = 64;
pub const ACTCTX_FLAG_HMODULE_VALID = 128;
pub const DEACTIVATE_ACTCTX_FLAG_FORCE_EARLY_DEACTIVATION = 1;
pub const FIND_ACTCTX_SECTION_KEY_RETURN_HACTCTX = 1;
pub const FIND_ACTCTX_SECTION_KEY_RETURN_FLAGS = 2;
pub const FIND_ACTCTX_SECTION_KEY_RETURN_ASSEMBLY_METADATA = 4;
pub const ACTIVATION_CONTEXT_BASIC_INFORMATION_DEFINED = 1;
pub const QUERY_ACTCTX_FLAG_USE_ACTIVE_ACTCTX = 4;
pub const QUERY_ACTCTX_FLAG_ACTCTX_IS_HMODULE = 8;
pub const QUERY_ACTCTX_FLAG_ACTCTX_IS_ADDRESS = 16;
pub const QUERY_ACTCTX_FLAG_NO_ADDREF = 2147483648;
pub const RESTART_MAX_CMD_LINE = 1024;
pub const RECOVERY_DEFAULT_PING_INTERVAL = 5000;
pub const FILE_RENAME_FLAG_REPLACE_IF_EXISTS = 1;
pub const FILE_RENAME_FLAG_POSIX_SEMANTICS = 2;
pub const FILE_RENAME_FLAG_SUPPRESS_PIN_STATE_INHERITANCE = 4;
pub const STORAGE_INFO_FLAGS_ALIGNED_DEVICE = 1;
pub const STORAGE_INFO_FLAGS_PARTITION_ALIGNED_ON_DEVICE = 2;
pub const STORAGE_INFO_OFFSET_UNKNOWN = 4294967295;
pub const REMOTE_PROTOCOL_INFO_FLAG_LOOPBACK = 1;
pub const REMOTE_PROTOCOL_INFO_FLAG_OFFLINE = 2;
pub const REMOTE_PROTOCOL_INFO_FLAG_PERSISTENT_HANDLE = 4;
pub const RPI_FLAG_SMB2_SHARECAP_TIMEWARP = 2;
pub const RPI_FLAG_SMB2_SHARECAP_DFS = 8;
pub const RPI_FLAG_SMB2_SHARECAP_CONTINUOUS_AVAILABILITY = 16;
pub const RPI_FLAG_SMB2_SHARECAP_SCALEOUT = 32;
pub const RPI_FLAG_SMB2_SHARECAP_CLUSTER = 64;
pub const RPI_SMB2_SHAREFLAG_ENCRYPT_DATA = 1;
pub const RPI_SMB2_SHAREFLAG_COMPRESS_DATA = 2;
pub const RPI_SMB2_FLAG_SERVERCAP_DFS = 1;
pub const RPI_SMB2_FLAG_SERVERCAP_LEASING = 2;
pub const RPI_SMB2_FLAG_SERVERCAP_LARGEMTU = 4;
pub const RPI_SMB2_FLAG_SERVERCAP_MULTICHANNEL = 8;
pub const RPI_SMB2_FLAG_SERVERCAP_PERSISTENT_HANDLES = 16;
pub const RPI_SMB2_FLAG_SERVERCAP_DIRECTORY_LEASING = 32;
pub const MICROSOFT_WINDOWS_WINBASE_H_DEFINE_INTERLOCKED_CPLUSPLUS_OVERLOADS = 0;
pub const MICROSOFT_WINBASE_H_DEFINE_INTERLOCKED_CPLUSPLUS_OVERLOADS = 0;
pub const CODEINTEGRITY_OPTION_ENABLED = 1;
pub const CODEINTEGRITY_OPTION_TESTSIGN = 2;
pub const CODEINTEGRITY_OPTION_UMCI_ENABLED = 4;
pub const CODEINTEGRITY_OPTION_UMCI_AUDITMODE_ENABLED = 8;
pub const CODEINTEGRITY_OPTION_UMCI_EXCLUSIONPATHS_ENABLED = 16;
pub const CODEINTEGRITY_OPTION_TEST_BUILD = 32;
pub const CODEINTEGRITY_OPTION_PREPRODUCTION_BUILD = 64;
pub const CODEINTEGRITY_OPTION_DEBUGMODE_ENABLED = 128;
pub const CODEINTEGRITY_OPTION_FLIGHT_BUILD = 256;
pub const CODEINTEGRITY_OPTION_FLIGHTING_ENABLED = 512;
pub const CODEINTEGRITY_OPTION_HVCI_KMCI_ENABLED = 1024;
pub const CODEINTEGRITY_OPTION_HVCI_KMCI_AUDITMODE_ENABLED = 2048;
pub const CODEINTEGRITY_OPTION_HVCI_KMCI_STRICTMODE_ENABLED = 4096;
pub const CODEINTEGRITY_OPTION_HVCI_IUM_ENABLED = 8192;
pub const FILE_MAXIMUM_DISPOSITION = 5;
pub const FILE_OPEN_REMOTE_INSTANCE = 1024;
pub const FILE_NO_COMPRESSION = 32768;
pub const FILE_OPEN_NO_RECALL = 4194304;
pub const FILE_VALID_OPTION_FLAGS = 16777215;
pub const FILE_VALID_PIPE_OPTION_FLAGS = 50;
pub const FILE_VALID_MAILSLOT_OPTION_FLAGS = 50;
pub const FILE_VALID_SET_FLAGS = 54;
pub const FILE_SUPERSEDED = 0;
pub const FILE_OPENED = 1;
pub const FILE_CREATED = 2;
pub const FILE_OVERWRITTEN = 3;
pub const FILE_EXISTS = 4;
pub const FILE_DOES_NOT_EXIST = 5;
pub const WINWATCHNOTIFY_START = 0;
pub const WINWATCHNOTIFY_STOP = 1;
pub const WINWATCHNOTIFY_DESTROY = 2;
pub const WINWATCHNOTIFY_CHANGING = 3;
pub const WINWATCHNOTIFY_CHANGED = 4;
pub const RSC_FLAG_INF = 1;
pub const RSC_FLAG_SKIPDISKSPACECHECK = 2;
pub const RSC_FLAG_QUIET = 4;
pub const RSC_FLAG_NGCONV = 8;
pub const RSC_FLAG_UPDHLPDLLS = 16;
pub const RSC_FLAG_DELAYREGISTEROCX = 512;
pub const RSC_FLAG_SETUPAPI = 1024;
pub const ALINF_QUIET = 4;
pub const ALINF_NGCONV = 8;
pub const ALINF_UPDHLPDLLS = 16;
pub const ALINF_BKINSTALL = 32;
pub const ALINF_ROLLBACK = 64;
pub const ALINF_CHECKBKDATA = 128;
pub const ALINF_ROLLBKDOALL = 256;
pub const ALINF_DELAYREGISTEROCX = 512;
pub const AIF_WARNIFSKIP = 1;
pub const AIF_NOSKIP = 2;
pub const AIF_NOVERSIONCHECK = 4;
pub const AIF_FORCE_FILE_IN_USE = 8;
pub const AIF_NOOVERWRITE = 16;
pub const AIF_NO_VERSION_DIALOG = 32;
pub const AIF_REPLACEONLY = 1024;
pub const AIF_NOLANGUAGECHECK = 268435456;
pub const AIF_QUIET = 536870912;
pub const IE4_RESTORE = 1;
pub const IE4_BACKNEW = 2;
pub const IE4_NODELETENEW = 4;
pub const IE4_NOMESSAGES = 8;
pub const IE4_NOPROGRESS = 16;
pub const IE4_NOENUMKEY = 32;
pub const IE4_NO_CRC_MAPPING = 64;
pub const IE4_REGSECTION = 128;
pub const IE4_FRDOALL = 256;
pub const IE4_UPDREFCNT = 512;
pub const IE4_USEREFCNT = 1024;
pub const IE4_EXTRAINCREFCNT = 2048;
pub const IE4_REMOVREGBKDATA = 4096;
pub const ARSR_RESTORE = 1;
pub const ARSR_NOMESSAGES = 8;
pub const ARSR_REGSECTION = 128;
pub const ARSR_REMOVREGBKDATA = 4096;
pub const AFSR_RESTORE = 1;
pub const AFSR_BACKNEW = 2;
pub const AFSR_NODELETENEW = 4;
pub const AFSR_NOMESSAGES = 8;
pub const AFSR_NOPROGRESS = 16;
pub const AFSR_UPDREFCNT = 512;
pub const AFSR_USEREFCNT = 1024;
pub const AFSR_EXTRAINCREFCNT = 2048;
pub const AADBE_ADD_ENTRY = 1;
pub const AADBE_DEL_ENTRY = 2;
pub const ADN_DEL_IF_EMPTY = 1;
pub const ADN_DONT_DEL_SUBDIRS = 2;
pub const ADN_DONT_DEL_DIR = 4;
pub const ADN_DEL_UNC_PATHS = 8;
pub const LIS_QUIET = 1;
pub const LIS_NOGRPCONV = 2;
pub const RUNCMDS_QUIET = 1;
pub const RUNCMDS_NOWAIT = 2;
pub const RUNCMDS_DELAYPOSTCMD = 4;
pub const IME_MAXPROCESS = 32;
pub const CP_HWND = 0;
pub const CP_OPEN = 1;
pub const CP_DIRECT = 2;
pub const CP_LEVEL = 3;
pub const MCW_DEFAULT = 0;
pub const MCW_RECT = 1;
pub const MCW_WINDOW = 2;
pub const MCW_SCREEN = 4;
pub const MCW_VERTICAL = 8;
pub const MCW_HIDDEN = 16;
pub const IME_MODE_ALPHANUMERIC = 1;
pub const IME_MODE_SBCSCHAR = 2;
pub const IME_MODE_KATAKANA = 2;
pub const IME_MODE_HIRAGANA = 4;
pub const IME_MODE_HANJACONVERT = 4;
pub const IME_MODE_DBCSCHAR = 16;
pub const IME_MODE_ROMAN = 32;
pub const IME_MODE_NOROMAN = 64;
pub const IME_MODE_CODEINPUT = 128;
pub const IME_MODE_NOCODEINPUT = 256;
pub const IME_GETIMECAPS = 3;
pub const IME_SETOPEN = 4;
pub const IME_GETOPEN = 5;
pub const IME_GETVERSION = 7;
pub const IME_SETCONVERSIONWINDOW = 8;
pub const IME_MOVEIMEWINDOW = 8;
pub const IME_SETCONVERSIONMODE = 16;
pub const IME_GETCONVERSIONMODE = 17;
pub const IME_SET_MODE = 18;
pub const IME_SENDVKEY = 19;
pub const IME_ENTERWORDREGISTERMODE = 24;
pub const IME_SETCONVERSIONFONTEX = 25;
pub const IME_BANJAtoJUNJA = 19;
pub const IME_JUNJAtoBANJA = 20;
pub const IME_JOHABtoKS = 21;
pub const IME_KStoJOHAB = 22;
pub const IMEA_INIT = 1;
pub const IMEA_NEXT = 2;
pub const IMEA_PREV = 3;
pub const IME_REQUEST_CONVERT = 1;
pub const IME_ENABLE_CONVERT = 2;
pub const INTERIM_WINDOW = 0;
pub const MODE_WINDOW = 1;
pub const HANJA_WINDOW = 2;
pub const IME_RS_ERROR = 1;
pub const IME_RS_NOIME = 2;
pub const IME_RS_TOOLONG = 5;
pub const IME_RS_ILLEGAL = 6;
pub const IME_RS_NOTFOUND = 7;
pub const IME_RS_NOROOM = 10;
pub const IME_RS_DISKERROR = 14;
pub const IME_RS_INVALID = 17;
pub const IME_RS_NEST = 18;
pub const IME_RS_SYSTEMMODAL = 19;
pub const WM_IME_REPORT = 640;
pub const IR_STRINGSTART = 256;
pub const IR_STRINGEND = 257;
pub const IR_OPENCONVERT = 288;
pub const IR_CHANGECONVERT = 289;
pub const IR_CLOSECONVERT = 290;
pub const IR_FULLCONVERT = 291;
pub const IR_IMESELECT = 304;
pub const IR_STRING = 320;
pub const IR_DBCSCHAR = 352;
pub const IR_UNDETERMINE = 368;
pub const IR_STRINGEX = 384;
pub const IR_MODEINFO = 400;
pub const WM_WNT_CONVERTREQUESTEX = 265;
pub const WM_CONVERTREQUEST = 266;
pub const WM_CONVERTRESULT = 267;
pub const WM_INTERIM = 268;
pub const WM_IMEKEYDOWN = 656;
pub const WM_IMEKEYUP = 657;
pub const DELAYLOAD_GPA_FAILURE = 4;
pub const DELETE_BROWSING_HISTORY_HISTORY = 1;
pub const DELETE_BROWSING_HISTORY_COOKIES = 2;
pub const DELETE_BROWSING_HISTORY_TIF = 4;
pub const DELETE_BROWSING_HISTORY_FORMDATA = 8;
pub const DELETE_BROWSING_HISTORY_PASSWORDS = 16;
pub const DELETE_BROWSING_HISTORY_PRESERVEFAVORITES = 32;
pub const DELETE_BROWSING_HISTORY_DOWNLOADHISTORY = 64;
pub const WinStationInformation = 8;
pub const Browse = 0;
pub const Linear = 1;
pub const Single = 0;
pub const Multiple = 1;
pub const PhotoOrVideo = 0;
pub const Photo = 1;
pub const Video = 2;
pub const Jpeg = 0;
pub const Png = 1;
pub const JpegXR = 2;
pub const Mp4 = 0;
pub const Wmv = 1;
pub const SingleItem = 0;
pub const ItemList = 1;
pub const FEATURE_CHANGE_TIME_READ = 0;
pub const FEATURE_CHANGE_TIME_MODULE_RELOAD = 1;
pub const FEATURE_CHANGE_TIME_SESSION = 2;
pub const FEATURE_CHANGE_TIME_REBOOT = 3;
pub const FEATURE_ENABLED_STATE_DEFAULT = 0;
pub const FEATURE_ENABLED_STATE_DISABLED = 1;
pub const FEATURE_ENABLED_STATE_ENABLED = 2;
pub const EndpointIoControlType = 0;
pub const SetSockOptIoControlType = 1;
pub const GetSockOptIoControlType = 2;
pub const SocketIoControlType = 3;
pub const WLDP_HOST_RUNDLL32 = 0;
pub const WLDP_HOST_SVCHOST = 1;
pub const WLDP_HOST_MAX = 2;
pub const WLDP_HOST_ID_UNKNOWN = 0;
pub const WLDP_HOST_ID_GLOBAL = 1;
pub const WLDP_HOST_ID_VBA = 2;
pub const WLDP_HOST_ID_WSH = 3;
pub const WLDP_HOST_ID_POWERSHELL = 4;
pub const WLDP_HOST_ID_IE = 5;
pub const WLDP_HOST_ID_MSI = 6;
pub const WLDP_HOST_ID_ALL = 7;
pub const WLDP_HOST_ID_MAX = 8;
pub const DECISION_LOCATION_REFRESH_GLOBAL_DATA = 0;
pub const DECISION_LOCATION_PARAMETER_VALIDATION = 1;
pub const DECISION_LOCATION_AUDIT = 2;
pub const DECISION_LOCATION_FAILED_CONVERT_GUID = 3;
pub const DECISION_LOCATION_ENTERPRISE_DEFINED_CLASS_ID = 4;
pub const DECISION_LOCATION_GLOBAL_BUILT_IN_LIST = 5;
pub const DECISION_LOCATION_PROVIDER_BUILT_IN_LIST = 6;
pub const DECISION_LOCATION_ENFORCE_STATE_LIST = 7;
pub const DECISION_LOCATION_NOT_FOUND = 8;
pub const DECISION_LOCATION_UNKNOWN = 9;
pub const KEY_UNKNOWN = 0;
pub const KEY_OVERRIDE = 1;
pub const KEY_ALL_KEYS = 2;
pub const VALUENAME_UNKNOWN = 0;
pub const VALUENAME_ENTERPRISE_DEFINED_CLASS_ID = 1;
pub const VALUENAME_BUILT_IN_LIST = 2;
pub const WLDP_WINDOWS_LOCKDOWN_MODE_UNLOCKED = 0;
pub const WLDP_WINDOWS_LOCKDOWN_MODE_TRIAL = 1;
pub const WLDP_WINDOWS_LOCKDOWN_MODE_LOCKED = 2;
pub const WLDP_WINDOWS_LOCKDOWN_MODE_MAX = 3;
pub const WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NONE = 0;
pub const WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NOUNLOCK = 1;
pub const WLDP_WINDOWS_LOCKDOWN_RESTRICTION_NOUNLOCK_PERMANENT = 2;
pub const WLDP_WINDOWS_LOCKDOWN_RESTRICTION_MAX = 3;
pub const WLDP_POLICY_SETTING_AV_PERF_MODE = 1000;
pub const WLDP_EXECUTION_POLICY_BLOCKED = 0;
pub const WLDP_EXECUTION_POLICY_ALLOWED = 1;
pub const WLDP_EXECUTION_POLICY_REQUIRE_SANDBOX = 2;
pub const WLDP_EXECUTION_EVALUATION_OPTION_NONE = 0;
pub const WLDP_EXECUTION_EVALUATION_OPTION_EXECUTE_IN_INTERACTIVE_SESSION = 1;
pub const WLDP_SECURE_SETTING_VALUE_TYPE_BOOLEAN = 0;
pub const WLDP_SECURE_SETTING_VALUE_TYPE_ULONG = 1;
pub const WLDP_SECURE_SETTING_VALUE_TYPE_BINARY = 2;
pub const WLDP_SECURE_SETTING_VALUE_TYPE_STRING = 3;

pub const aliases = struct {
    pub const TDIENTITY_ENTITY_TYPE = u32;
    pub const WINSTATIONINFOCLASS = i32;
    pub const CameraUIControlMode = i32;
    pub const CameraUIControlLinearSelectionMode = i32;
    pub const CameraUIControlCaptureMode = i32;
    pub const CameraUIControlPhotoFormat = i32;
    pub const CameraUIControlVideoFormat = i32;
    pub const CameraUIControlViewType = i32;
    pub const FEATURE_CHANGE_TIME = i32;
    pub const FEATURE_ENABLED_STATE = i32;
    pub const TDI_TL_IO_CONTROL_TYPE = i32;
    pub const WLDP_HOST = i32;
    pub const WLDP_HOST_ID = i32;
    pub const DECISION_LOCATION = i32;
    pub const WLDP_KEY = i32;
    pub const VALUENAME = i32;
    pub const WLDP_WINDOWS_LOCKDOWN_MODE = i32;
    pub const WLDP_WINDOWS_LOCKDOWN_RESTRICTION = i32;
    pub const WLDP_POLICY_SETTING = i32;
    pub const WLDP_EXECUTION_POLICY = i32;
    pub const WLDP_EXECUTION_EVALUATION_OPTIONS = i32;
    pub const WLDP_SECURE_SETTING_VALUE_TYPE = i32;
    pub const HWINWATCH = ?*anyopaque;
    pub const FEATURE_STATE_CHANGE_SUBSCRIPTION = ?*anyopaque;
    pub const PFIBER_CALLOUT_ROUTINE = ?*const anyopaque;
    pub const PQUERYACTCTXW_FUNC = ?*const anyopaque;
    pub const APPLICATION_RECOVERY_CALLBACK = ?*const anyopaque;
    pub const PWINSTATIONQUERYINFORMATIONW = ?*const anyopaque;
    pub const PFEATURE_STATE_CHANGE_CALLBACK = ?*const anyopaque;
    pub const ENUM_CALLBACK = ?*const anyopaque;
    pub const WINWATCHNOTIFYPROC = ?*const anyopaque;
    pub const REGINSTALLA = ?*const anyopaque;
    pub const PWLDP_QUERYSECURITYPOLICY_API = ?*const anyopaque;
    pub const PWLDP_SETDYNAMICCODETRUST_API = ?*const anyopaque;
    pub const PWLDP_ISDYNAMICCODEPOLICYENABLED_API = ?*const anyopaque;
    pub const PWLDP_QUERYDYNAMICODETRUST_API = ?*const anyopaque;
    pub const PWLDP_QUERYWINDOWSLOCKDOWNMODE_API = ?*const anyopaque;
    pub const PWLDP_QUERYDEVICESECURITYINFORMATION_API = ?*const anyopaque;
    pub const PWLDP_QUERYWINDOWSLOCKDOWNRESTRICTION_API = ?*const anyopaque;
    pub const PWLDP_SETWINDOWSLOCKDOWNRESTRICTION_API = ?*const anyopaque;
    pub const PWLDP_ISAPPAPPROVEDBYPOLICY_API = ?*const anyopaque;
    pub const PWLDP_QUERYPOLICYSETTINGENABLED_API = ?*const anyopaque;
    pub const PWLDP_QUERYPOLICYSETTINGENABLED2_API = ?*const anyopaque;
    pub const PWLDP_ISWCOSPRODUCTIONCONFIGURATION_API = ?*const anyopaque;
    pub const PWLDP_RESETWCOSPRODUCTIONCONFIGURATION_API = ?*const anyopaque;
    pub const PWLDP_ISPRODUCTIONCONFIGURATION_API = ?*const anyopaque;
    pub const PWLDP_RESETPRODUCTIONCONFIGURATION_API = ?*const anyopaque;
    pub const PWLDP_CANEXECUTEFILE_API = ?*const anyopaque;
    pub const PWLDP_CANEXECUTEBUFFER_API = ?*const anyopaque;
    pub const PWLDP_CANEXECUTESTREAM_API = ?*const anyopaque;
    pub const PWLDP_CANEXECUTEFILEFROMDETACHEDSIGNATURE_API = ?*const anyopaque;
    pub const PWLDP_GETAPPLICATIONSETTINGBOOLEAN_API = ?*const anyopaque;
    pub const PWLDP_GETAPPLICATIONSETTINGSTRINGLIST_API = ?*const anyopaque;
    pub const PWLDP_GETAPPLICATIONSETTINGSTRINGSET_API = ?*const anyopaque;
    pub const PDELAYLOAD_FAILURE_DLL_CALLBACK = ?*const anyopaque;
};
