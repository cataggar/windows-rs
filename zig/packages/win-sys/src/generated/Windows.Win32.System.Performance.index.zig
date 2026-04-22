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
    .{ "QueryPerformanceCounter", MethodRecord{ .library = "KERNEL32", .import = "QueryPerformanceCounter", .signature = "\x00\x01\x11\x59\x0f\x0a" } },
    .{ "QueryPerformanceFrequency", MethodRecord{ .library = "KERNEL32", .import = "QueryPerformanceFrequency", .signature = "\x00\x01\x11\x59\x0f\x0a" } },
    .{ "InstallPerfDllW", MethodRecord{ .library = "loadperf", .import = "InstallPerfDllW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x19" } },
    .{ "InstallPerfDllA", MethodRecord{ .library = "loadperf", .import = "InstallPerfDllA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x19" } },
    .{ "LoadPerfCounterTextStringsA", MethodRecord{ .library = "loadperf", .import = "LoadPerfCounterTextStringsA", .signature = "\x00\x02\x09\x11\x3d\x11\x59" } },
    .{ "LoadPerfCounterTextStringsW", MethodRecord{ .library = "loadperf", .import = "LoadPerfCounterTextStringsW", .signature = "\x00\x02\x09\x11\x05\x11\x59" } },
    .{ "UnloadPerfCounterTextStringsW", MethodRecord{ .library = "loadperf", .import = "UnloadPerfCounterTextStringsW", .signature = "\x00\x02\x09\x11\x05\x11\x59" } },
    .{ "UnloadPerfCounterTextStringsA", MethodRecord{ .library = "loadperf", .import = "UnloadPerfCounterTextStringsA", .signature = "\x00\x02\x09\x11\x3d\x11\x59" } },
    .{ "UpdatePerfNameFilesA", MethodRecord{ .library = "loadperf", .import = "UpdatePerfNameFilesA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x11\x3d\x19" } },
    .{ "UpdatePerfNameFilesW", MethodRecord{ .library = "loadperf", .import = "UpdatePerfNameFilesW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x05\x19" } },
    .{ "SetServiceAsTrustedA", MethodRecord{ .library = "loadperf", .import = "SetServiceAsTrustedA", .signature = "\x00\x02\x09\x11\x3d\x11\x3d" } },
    .{ "SetServiceAsTrustedW", MethodRecord{ .library = "loadperf", .import = "SetServiceAsTrustedW", .signature = "\x00\x02\x09\x11\x05\x11\x05" } },
    .{ "BackupPerfRegistryToFileW", MethodRecord{ .library = "loadperf", .import = "BackupPerfRegistryToFileW", .signature = "\x00\x02\x09\x11\x05\x11\x05" } },
    .{ "RestorePerfRegistryFromFileW", MethodRecord{ .library = "loadperf", .import = "RestorePerfRegistryFromFileW", .signature = "\x00\x02\x09\x11\x05\x11\x05" } },
    .{ "PerfStartProvider", MethodRecord{ .library = "ADVAPI32", .import = "PerfStartProvider", .signature = "\x00\x03\x09\x0f\x11\x0d\x12\xc0\x00\x43\x3d\x0f\x11\x80\x85" } },
    .{ "PerfStartProviderEx", MethodRecord{ .library = "ADVAPI32", .import = "PerfStartProviderEx", .signature = "\x00\x03\x09\x0f\x11\x0d\x0f\x11\xc0\x00\x43\x41\x0f\x11\x80\x85" } },
    .{ "PerfStopProvider", MethodRecord{ .library = "ADVAPI32", .import = "PerfStopProvider", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "PerfSetCounterSetInfo", MethodRecord{ .library = "ADVAPI32", .import = "PerfSetCounterSetInfo", .signature = "\x00\x03\x09\x11\x80\x85\x0f\x11\xc0\x00\x43\x45\x09" } },
    .{ "PerfCreateInstance", MethodRecord{ .library = "ADVAPI32", .import = "PerfCreateInstance", .signature = "\x00\x04\x0f\x11\xc0\x00\x43\x49\x11\x80\x85\x0f\x11\x0d\x11\x05\x09" } },
    .{ "PerfDeleteInstance", MethodRecord{ .library = "ADVAPI32", .import = "PerfDeleteInstance", .signature = "\x00\x02\x09\x11\x80\x85\x0f\x11\xc0\x00\x43\x49" } },
    .{ "PerfQueryInstance", MethodRecord{ .library = "ADVAPI32", .import = "PerfQueryInstance", .signature = "\x00\x04\x0f\x11\xc0\x00\x43\x49\x11\x80\x85\x0f\x11\x0d\x11\x05\x09" } },
    .{ "PerfSetCounterRefValue", MethodRecord{ .library = "ADVAPI32", .import = "PerfSetCounterRefValue", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x11\xc0\x00\x43\x49\x09\x0f\x01" } },
    .{ "PerfSetULongCounterValue", MethodRecord{ .library = "ADVAPI32", .import = "PerfSetULongCounterValue", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x11\xc0\x00\x43\x49\x09\x09" } },
    .{ "PerfSetULongLongCounterValue", MethodRecord{ .library = "ADVAPI32", .import = "PerfSetULongLongCounterValue", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x11\xc0\x00\x43\x49\x09\x0b" } },
    .{ "PerfIncrementULongCounterValue", MethodRecord{ .library = "ADVAPI32", .import = "PerfIncrementULongCounterValue", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x11\xc0\x00\x43\x49\x09\x09" } },
    .{ "PerfIncrementULongLongCounterValue", MethodRecord{ .library = "ADVAPI32", .import = "PerfIncrementULongLongCounterValue", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x11\xc0\x00\x43\x49\x09\x0b" } },
    .{ "PerfDecrementULongCounterValue", MethodRecord{ .library = "ADVAPI32", .import = "PerfDecrementULongCounterValue", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x11\xc0\x00\x43\x49\x09\x09" } },
    .{ "PerfDecrementULongLongCounterValue", MethodRecord{ .library = "ADVAPI32", .import = "PerfDecrementULongLongCounterValue", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x11\xc0\x00\x43\x49\x09\x0b" } },
    .{ "PerfEnumerateCounterSet", MethodRecord{ .library = "ADVAPI32", .import = "PerfEnumerateCounterSet", .signature = "\x00\x04\x09\x11\x05\x0f\x11\x0d\x09\x0f\x09" } },
    .{ "PerfEnumerateCounterSetInstances", MethodRecord{ .library = "ADVAPI32", .import = "PerfEnumerateCounterSetInstances", .signature = "\x00\x05\x09\x11\x05\x0f\x11\x0d\x0f\x11\xc0\x00\x43\x4d\x09\x0f\x09" } },
    .{ "PerfQueryCounterSetRegistrationInfo", MethodRecord{ .library = "ADVAPI32", .import = "PerfQueryCounterSetRegistrationInfo", .signature = "\x00\x07\x09\x11\x05\x0f\x11\x0d\x11\xc0\x00\x43\x51\x09\x0f\x05\x09\x0f\x09" } },
    .{ "PerfOpenQueryHandle", MethodRecord{ .library = "ADVAPI32", .import = "PerfOpenQueryHandle", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x80\x85" } },
    .{ "PerfCloseQueryHandle", MethodRecord{ .library = "ADVAPI32", .import = "PerfCloseQueryHandle", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "PerfQueryCounterInfo", MethodRecord{ .library = "ADVAPI32", .import = "PerfQueryCounterInfo", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x11\xc0\x00\x43\x55\x09\x0f\x09" } },
    .{ "PerfQueryCounterData", MethodRecord{ .library = "ADVAPI32", .import = "PerfQueryCounterData", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x11\xc0\x00\x43\x59\x09\x0f\x09" } },
    .{ "PerfAddCounters", MethodRecord{ .library = "ADVAPI32", .import = "PerfAddCounters", .signature = "\x00\x03\x09\x11\x80\x85\x0f\x11\xc0\x00\x43\x55\x09" } },
    .{ "PerfDeleteCounters", MethodRecord{ .library = "ADVAPI32", .import = "PerfDeleteCounters", .signature = "\x00\x03\x09\x11\x80\x85\x0f\x11\xc0\x00\x43\x55\x09" } },
    .{ "PdhGetDllVersion", MethodRecord{ .library = "pdh", .import = "PdhGetDllVersion", .signature = "\x00\x01\x09\x0f\x11\xa2\x0d" } },
    .{ "PdhOpenQueryW", MethodRecord{ .library = "pdh", .import = "PdhOpenQueryW", .signature = "\x00\x03\x09\x11\x05\x19\x0f\x11\xc0\x00\x43\x5d" } },
    .{ "PdhOpenQueryA", MethodRecord{ .library = "pdh", .import = "PdhOpenQueryA", .signature = "\x00\x03\x09\x11\x3d\x19\x0f\x11\xc0\x00\x43\x5d" } },
    .{ "PdhAddCounterW", MethodRecord{ .library = "pdh", .import = "PdhAddCounterW", .signature = "\x00\x04\x09\x11\xc0\x00\x43\x5d\x11\x05\x19\x0f\x11\xc0\x00\x43\x61" } },
    .{ "PdhAddCounterA", MethodRecord{ .library = "pdh", .import = "PdhAddCounterA", .signature = "\x00\x04\x09\x11\xc0\x00\x43\x5d\x11\x3d\x19\x0f\x11\xc0\x00\x43\x61" } },
    .{ "PdhAddEnglishCounterW", MethodRecord{ .library = "pdh", .import = "PdhAddEnglishCounterW", .signature = "\x00\x04\x09\x11\xc0\x00\x43\x5d\x11\x05\x19\x0f\x11\xc0\x00\x43\x61" } },
    .{ "PdhAddEnglishCounterA", MethodRecord{ .library = "pdh", .import = "PdhAddEnglishCounterA", .signature = "\x00\x04\x09\x11\xc0\x00\x43\x5d\x11\x3d\x19\x0f\x11\xc0\x00\x43\x61" } },
    .{ "PdhCollectQueryDataWithTime", MethodRecord{ .library = "pdh", .import = "PdhCollectQueryDataWithTime", .signature = "\x00\x02\x09\x11\xc0\x00\x43\x5d\x0f\x0a" } },
    .{ "PdhValidatePathExW", MethodRecord{ .library = "pdh", .import = "PdhValidatePathExW", .signature = "\x00\x02\x09\x11\xc0\x00\x43\x65\x11\x05" } },
    .{ "PdhValidatePathExA", MethodRecord{ .library = "pdh", .import = "PdhValidatePathExA", .signature = "\x00\x02\x09\x11\xc0\x00\x43\x65\x11\x3d" } },
    .{ "PdhRemoveCounter", MethodRecord{ .library = "pdh", .import = "PdhRemoveCounter", .signature = "\x00\x01\x09\x11\xc0\x00\x43\x61" } },
    .{ "PdhCollectQueryData", MethodRecord{ .library = "pdh", .import = "PdhCollectQueryData", .signature = "\x00\x01\x09\x11\xc0\x00\x43\x5d" } },
    .{ "PdhCloseQuery", MethodRecord{ .library = "pdh", .import = "PdhCloseQuery", .signature = "\x00\x01\x09\x11\xc0\x00\x43\x5d" } },
    .{ "PdhGetFormattedCounterValue", MethodRecord{ .library = "pdh", .import = "PdhGetFormattedCounterValue", .signature = "\x00\x04\x09\x11\xc0\x00\x43\x61\x11\xa1\xfd\x0f\x09\x0f\x11\xc0\x00\x43\x69" } },
    .{ "PdhGetFormattedCounterArrayA", MethodRecord{ .library = "pdh", .import = "PdhGetFormattedCounterArrayA", .signature = "\x00\x05\x09\x11\xc0\x00\x43\x61\x11\xa1\xfd\x0f\x09\x0f\x09\x0f\x11\xc0\x00\x43\x6d" } },
    .{ "PdhGetFormattedCounterArrayW", MethodRecord{ .library = "pdh", .import = "PdhGetFormattedCounterArrayW", .signature = "\x00\x05\x09\x11\xc0\x00\x43\x61\x11\xa1\xfd\x0f\x09\x0f\x09\x0f\x11\xc0\x00\x43\x71" } },
    .{ "PdhGetRawCounterValue", MethodRecord{ .library = "pdh", .import = "PdhGetRawCounterValue", .signature = "\x00\x03\x09\x11\xc0\x00\x43\x61\x0f\x09\x0f\x11\xc0\x00\x43\x75" } },
    .{ "PdhGetRawCounterArrayA", MethodRecord{ .library = "pdh", .import = "PdhGetRawCounterArrayA", .signature = "\x00\x04\x09\x11\xc0\x00\x43\x61\x0f\x09\x0f\x09\x0f\x11\xc0\x00\x43\x79" } },
    .{ "PdhGetRawCounterArrayW", MethodRecord{ .library = "pdh", .import = "PdhGetRawCounterArrayW", .signature = "\x00\x04\x09\x11\xc0\x00\x43\x61\x0f\x09\x0f\x09\x0f\x11\xc0\x00\x43\x7d" } },
    .{ "PdhCalculateCounterFromRawValue", MethodRecord{ .library = "pdh", .import = "PdhCalculateCounterFromRawValue", .signature = "\x00\x05\x09\x11\xc0\x00\x43\x61\x11\xa1\xfd\x0f\x11\xc0\x00\x43\x75\x0f\x11\xc0\x00\x43\x75\x0f\x11\xc0\x00\x43\x69" } },
    .{ "PdhComputeCounterStatistics", MethodRecord{ .library = "pdh", .import = "PdhComputeCounterStatistics", .signature = "\x00\x06\x09\x11\xc0\x00\x43\x61\x11\xa1\xfd\x09\x09\x0f\x11\xc0\x00\x43\x75\x0f\x11\xc0\x00\x43\x81" } },
    .{ "PdhGetCounterInfoW", MethodRecord{ .library = "pdh", .import = "PdhGetCounterInfoW", .signature = "\x00\x04\x09\x11\xc0\x00\x43\x61\x11\x87\x79\x0f\x09\x0f\x11\xc0\x00\x43\x85" } },
    .{ "PdhGetCounterInfoA", MethodRecord{ .library = "pdh", .import = "PdhGetCounterInfoA", .signature = "\x00\x04\x09\x11\xc0\x00\x43\x61\x11\x87\x79\x0f\x09\x0f\x11\xc0\x00\x43\x89" } },
    .{ "PdhSetCounterScaleFactor", MethodRecord{ .library = "pdh", .import = "PdhSetCounterScaleFactor", .signature = "\x00\x02\x09\x11\xc0\x00\x43\x61\x08" } },
    .{ "PdhConnectMachineW", MethodRecord{ .library = "pdh", .import = "PdhConnectMachineW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "PdhConnectMachineA", MethodRecord{ .library = "pdh", .import = "PdhConnectMachineA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "PdhEnumMachinesW", MethodRecord{ .library = "pdh", .import = "PdhEnumMachinesW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "PdhEnumMachinesA", MethodRecord{ .library = "pdh", .import = "PdhEnumMachinesA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "PdhEnumObjectsW", MethodRecord{ .library = "pdh", .import = "PdhEnumObjectsW", .signature = "\x00\x06\x09\x11\x05\x11\x05\x11\x05\x0f\x09\x11\xa1\xf1\x11\x59" } },
    .{ "PdhEnumObjectsA", MethodRecord{ .library = "pdh", .import = "PdhEnumObjectsA", .signature = "\x00\x06\x09\x11\x3d\x11\x3d\x11\x3d\x0f\x09\x11\xa1\xf1\x11\x59" } },
    .{ "PdhEnumObjectItemsW", MethodRecord{ .library = "pdh", .import = "PdhEnumObjectItemsW", .signature = "\x00\x09\x09\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\xa1\xf1\x09" } },
    .{ "PdhEnumObjectItemsA", MethodRecord{ .library = "pdh", .import = "PdhEnumObjectItemsA", .signature = "\x00\x09\x09\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x0f\x09\x11\x3d\x0f\x09\x11\xa1\xf1\x09" } },
    .{ "PdhMakeCounterPathW", MethodRecord{ .library = "pdh", .import = "PdhMakeCounterPathW", .signature = "\x00\x04\x09\x0f\x11\xc0\x00\x43\x8d\x11\x05\x0f\x09\x11\xa1\xf9" } },
    .{ "PdhMakeCounterPathA", MethodRecord{ .library = "pdh", .import = "PdhMakeCounterPathA", .signature = "\x00\x04\x09\x0f\x11\xc0\x00\x43\x91\x11\x3d\x0f\x09\x11\xa1\xf9" } },
    .{ "PdhParseCounterPathW", MethodRecord{ .library = "pdh", .import = "PdhParseCounterPathW", .signature = "\x00\x04\x09\x11\x05\x0f\x11\xc0\x00\x43\x8d\x0f\x09\x09" } },
    .{ "PdhParseCounterPathA", MethodRecord{ .library = "pdh", .import = "PdhParseCounterPathA", .signature = "\x00\x04\x09\x11\x3d\x0f\x11\xc0\x00\x43\x91\x0f\x09\x09" } },
    .{ "PdhParseInstanceNameW", MethodRecord{ .library = "pdh", .import = "PdhParseInstanceNameW", .signature = "\x00\x06\x09\x11\x05\x11\x05\x0f\x09\x11\x05\x0f\x09\x0f\x09" } },
    .{ "PdhParseInstanceNameA", MethodRecord{ .library = "pdh", .import = "PdhParseInstanceNameA", .signature = "\x00\x06\x09\x11\x3d\x11\x3d\x0f\x09\x11\x3d\x0f\x09\x0f\x09" } },
    .{ "PdhValidatePathW", MethodRecord{ .library = "pdh", .import = "PdhValidatePathW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "PdhValidatePathA", MethodRecord{ .library = "pdh", .import = "PdhValidatePathA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "PdhGetDefaultPerfObjectW", MethodRecord{ .library = "pdh", .import = "PdhGetDefaultPerfObjectW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x05\x0f\x09" } },
    .{ "PdhGetDefaultPerfObjectA", MethodRecord{ .library = "pdh", .import = "PdhGetDefaultPerfObjectA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "PdhGetDefaultPerfCounterW", MethodRecord{ .library = "pdh", .import = "PdhGetDefaultPerfCounterW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x09" } },
    .{ "PdhGetDefaultPerfCounterA", MethodRecord{ .library = "pdh", .import = "PdhGetDefaultPerfCounterA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "PdhBrowseCountersW", MethodRecord{ .library = "pdh", .import = "PdhBrowseCountersW", .signature = "\x00\x01\x09\x0f\x11\xc0\x00\x43\x95" } },
    .{ "PdhBrowseCountersA", MethodRecord{ .library = "pdh", .import = "PdhBrowseCountersA", .signature = "\x00\x01\x09\x0f\x11\xc0\x00\x43\x99" } },
    .{ "PdhExpandCounterPathW", MethodRecord{ .library = "pdh", .import = "PdhExpandCounterPathW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "PdhExpandCounterPathA", MethodRecord{ .library = "pdh", .import = "PdhExpandCounterPathA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "PdhLookupPerfNameByIndexW", MethodRecord{ .library = "pdh", .import = "PdhLookupPerfNameByIndexW", .signature = "\x00\x04\x09\x11\x05\x09\x11\x05\x0f\x09" } },
    .{ "PdhLookupPerfNameByIndexA", MethodRecord{ .library = "pdh", .import = "PdhLookupPerfNameByIndexA", .signature = "\x00\x04\x09\x11\x3d\x09\x11\x3d\x0f\x09" } },
    .{ "PdhLookupPerfIndexByNameW", MethodRecord{ .library = "pdh", .import = "PdhLookupPerfIndexByNameW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "PdhLookupPerfIndexByNameA", MethodRecord{ .library = "pdh", .import = "PdhLookupPerfIndexByNameA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "PdhExpandWildCardPathA", MethodRecord{ .library = "pdh", .import = "PdhExpandWildCardPathA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x11\x3d\x0f\x09\x09" } },
    .{ "PdhExpandWildCardPathW", MethodRecord{ .library = "pdh", .import = "PdhExpandWildCardPathW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x0f\x09\x09" } },
    .{ "PdhOpenLogW", MethodRecord{ .library = "pdh", .import = "PdhOpenLogW", .signature = "\x00\x07\x09\x11\x05\x11\xa2\x05\x0f\x11\xa2\x01\x11\xc0\x00\x43\x5d\x09\x11\x05\x0f\x11\xc0\x00\x43\x65" } },
    .{ "PdhOpenLogA", MethodRecord{ .library = "pdh", .import = "PdhOpenLogA", .signature = "\x00\x07\x09\x11\x3d\x11\xa2\x05\x0f\x11\xa2\x01\x11\xc0\x00\x43\x5d\x09\x11\x3d\x0f\x11\xc0\x00\x43\x65" } },
    .{ "PdhUpdateLogW", MethodRecord{ .library = "pdh", .import = "PdhUpdateLogW", .signature = "\x00\x02\x09\x11\xc0\x00\x43\x65\x11\x05" } },
    .{ "PdhUpdateLogA", MethodRecord{ .library = "pdh", .import = "PdhUpdateLogA", .signature = "\x00\x02\x09\x11\xc0\x00\x43\x65\x11\x3d" } },
    .{ "PdhUpdateLogFileCatalog", MethodRecord{ .library = "pdh", .import = "PdhUpdateLogFileCatalog", .signature = "\x00\x01\x09\x11\xc0\x00\x43\x65" } },
    .{ "PdhGetLogFileSize", MethodRecord{ .library = "pdh", .import = "PdhGetLogFileSize", .signature = "\x00\x02\x09\x11\xc0\x00\x43\x65\x0f\x0a" } },
    .{ "PdhCloseLog", MethodRecord{ .library = "pdh", .import = "PdhCloseLog", .signature = "\x00\x02\x09\x11\xc0\x00\x43\x65\x09" } },
    .{ "PdhSelectDataSourceW", MethodRecord{ .library = "pdh", .import = "PdhSelectDataSourceW", .signature = "\x00\x04\x09\x11\x25\x11\xa2\x09\x11\x05\x0f\x09" } },
    .{ "PdhSelectDataSourceA", MethodRecord{ .library = "pdh", .import = "PdhSelectDataSourceA", .signature = "\x00\x04\x09\x11\x25\x11\xa2\x09\x11\x3d\x0f\x09" } },
    .{ "PdhIsRealTimeQuery", MethodRecord{ .library = "pdh", .import = "PdhIsRealTimeQuery", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x43\x5d" } },
    .{ "PdhSetQueryTimeRange", MethodRecord{ .library = "pdh", .import = "PdhSetQueryTimeRange", .signature = "\x00\x02\x09\x11\xc0\x00\x43\x5d\x0f\x11\xc0\x00\x43\x9d" } },
    .{ "PdhGetDataSourceTimeRangeW", MethodRecord{ .library = "pdh", .import = "PdhGetDataSourceTimeRangeW", .signature = "\x00\x04\x09\x11\x05\x0f\x09\x0f\x11\xc0\x00\x43\x9d\x0f\x09" } },
    .{ "PdhGetDataSourceTimeRangeA", MethodRecord{ .library = "pdh", .import = "PdhGetDataSourceTimeRangeA", .signature = "\x00\x04\x09\x11\x3d\x0f\x09\x0f\x11\xc0\x00\x43\x9d\x0f\x09" } },
    .{ "PdhCollectQueryDataEx", MethodRecord{ .library = "pdh", .import = "PdhCollectQueryDataEx", .signature = "\x00\x03\x09\x11\xc0\x00\x43\x5d\x09\x11\x80\x85" } },
    .{ "PdhFormatFromRawValue", MethodRecord{ .library = "pdh", .import = "PdhFormatFromRawValue", .signature = "\x00\x06\x09\x09\x11\xa1\xfd\x0f\x0a\x0f\x11\xc0\x00\x43\x75\x0f\x11\xc0\x00\x43\x75\x0f\x11\xc0\x00\x43\x69" } },
    .{ "PdhGetCounterTimeBase", MethodRecord{ .library = "pdh", .import = "PdhGetCounterTimeBase", .signature = "\x00\x02\x09\x11\xc0\x00\x43\x61\x0f\x0a" } },
    .{ "PdhReadRawLogRecord", MethodRecord{ .library = "pdh", .import = "PdhReadRawLogRecord", .signature = "\x00\x04\x09\x11\xc0\x00\x43\x65\x11\x80\x9d\x0f\x11\xc0\x00\x43\xa1\x0f\x09" } },
    .{ "PdhSetDefaultRealTimeDataSource", MethodRecord{ .library = "pdh", .import = "PdhSetDefaultRealTimeDataSource", .signature = "\x00\x01\x09\x11\xa1\xf5" } },
    .{ "PdhBindInputDataSourceW", MethodRecord{ .library = "pdh", .import = "PdhBindInputDataSourceW", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x43\x65\x11\x05" } },
    .{ "PdhBindInputDataSourceA", MethodRecord{ .library = "pdh", .import = "PdhBindInputDataSourceA", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x43\x65\x11\x3d" } },
    .{ "PdhOpenQueryH", MethodRecord{ .library = "pdh", .import = "PdhOpenQueryH", .signature = "\x00\x03\x09\x11\xc0\x00\x43\x65\x19\x0f\x11\xc0\x00\x43\x5d" } },
    .{ "PdhEnumMachinesHW", MethodRecord{ .library = "pdh", .import = "PdhEnumMachinesHW", .signature = "\x00\x03\x09\x11\xc0\x00\x43\x65\x11\x05\x0f\x09" } },
    .{ "PdhEnumMachinesHA", MethodRecord{ .library = "pdh", .import = "PdhEnumMachinesHA", .signature = "\x00\x03\x09\x11\xc0\x00\x43\x65\x11\x3d\x0f\x09" } },
    .{ "PdhEnumObjectsHW", MethodRecord{ .library = "pdh", .import = "PdhEnumObjectsHW", .signature = "\x00\x06\x09\x11\xc0\x00\x43\x65\x11\x05\x11\x05\x0f\x09\x11\xa1\xf1\x11\x59" } },
    .{ "PdhEnumObjectsHA", MethodRecord{ .library = "pdh", .import = "PdhEnumObjectsHA", .signature = "\x00\x06\x09\x11\xc0\x00\x43\x65\x11\x3d\x11\x3d\x0f\x09\x11\xa1\xf1\x11\x59" } },
    .{ "PdhEnumObjectItemsHW", MethodRecord{ .library = "pdh", .import = "PdhEnumObjectItemsHW", .signature = "\x00\x09\x09\x11\xc0\x00\x43\x65\x11\x05\x11\x05\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\xa1\xf1\x09" } },
    .{ "PdhEnumObjectItemsHA", MethodRecord{ .library = "pdh", .import = "PdhEnumObjectItemsHA", .signature = "\x00\x09\x09\x11\xc0\x00\x43\x65\x11\x3d\x11\x3d\x11\x3d\x0f\x09\x11\x3d\x0f\x09\x11\xa1\xf1\x09" } },
    .{ "PdhExpandWildCardPathHW", MethodRecord{ .library = "pdh", .import = "PdhExpandWildCardPathHW", .signature = "\x00\x05\x09\x11\xc0\x00\x43\x65\x11\x05\x11\x05\x0f\x09\x09" } },
    .{ "PdhExpandWildCardPathHA", MethodRecord{ .library = "pdh", .import = "PdhExpandWildCardPathHA", .signature = "\x00\x05\x09\x11\xc0\x00\x43\x65\x11\x3d\x11\x3d\x0f\x09\x09" } },
    .{ "PdhGetDataSourceTimeRangeH", MethodRecord{ .library = "pdh", .import = "PdhGetDataSourceTimeRangeH", .signature = "\x00\x04\x09\x11\xc0\x00\x43\x65\x0f\x09\x0f\x11\xc0\x00\x43\x9d\x0f\x09" } },
    .{ "PdhGetDefaultPerfObjectHW", MethodRecord{ .library = "pdh", .import = "PdhGetDefaultPerfObjectHW", .signature = "\x00\x04\x09\x11\xc0\x00\x43\x65\x11\x05\x11\x05\x0f\x09" } },
    .{ "PdhGetDefaultPerfObjectHA", MethodRecord{ .library = "pdh", .import = "PdhGetDefaultPerfObjectHA", .signature = "\x00\x04\x09\x11\xc0\x00\x43\x65\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "PdhGetDefaultPerfCounterHW", MethodRecord{ .library = "pdh", .import = "PdhGetDefaultPerfCounterHW", .signature = "\x00\x05\x09\x11\xc0\x00\x43\x65\x11\x05\x11\x05\x11\x05\x0f\x09" } },
    .{ "PdhGetDefaultPerfCounterHA", MethodRecord{ .library = "pdh", .import = "PdhGetDefaultPerfCounterHA", .signature = "\x00\x05\x09\x11\xc0\x00\x43\x65\x11\x3d\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "PdhBrowseCountersHW", MethodRecord{ .library = "pdh", .import = "PdhBrowseCountersHW", .signature = "\x00\x01\x09\x0f\x11\xc0\x00\x43\xa5" } },
    .{ "PdhBrowseCountersHA", MethodRecord{ .library = "pdh", .import = "PdhBrowseCountersHA", .signature = "\x00\x01\x09\x0f\x11\xc0\x00\x43\xa9" } },
    .{ "PdhVerifySQLDBW", MethodRecord{ .library = "pdh", .import = "PdhVerifySQLDBW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "PdhVerifySQLDBA", MethodRecord{ .library = "pdh", .import = "PdhVerifySQLDBA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "PdhCreateSQLTablesW", MethodRecord{ .library = "pdh", .import = "PdhCreateSQLTablesW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "PdhCreateSQLTablesA", MethodRecord{ .library = "pdh", .import = "PdhCreateSQLTablesA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "PdhEnumLogSetNamesW", MethodRecord{ .library = "pdh", .import = "PdhEnumLogSetNamesW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "PdhEnumLogSetNamesA", MethodRecord{ .library = "pdh", .import = "PdhEnumLogSetNamesA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "PdhGetLogSetGUID", MethodRecord{ .library = "pdh", .import = "PdhGetLogSetGUID", .signature = "\x00\x03\x09\x11\xc0\x00\x43\x65\x0f\x11\x0d\x0f\x08" } },
    .{ "PdhSetLogSetRunID", MethodRecord{ .library = "pdh", .import = "PdhSetLogSetRunID", .signature = "\x00\x02\x09\x11\xc0\x00\x43\x65\x08" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0x21f1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PERF_DETAIL" },
        0x21f5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "REAL_TIME_DATA_SOURCE_ID_FLAGS" },
        0x21f9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_PATH_FLAGS" },
        0x21fd => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_FMT" },
        0x2201 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_LOG_TYPE" },
        0x2205 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_LOG" },
        0x2209 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_SELECT_DATA_SOURCE_FLAGS" },
        0x220d => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_DLL_VERSION" },
        0x433d => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PERFLIBREQUEST" },
        0x4341 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PERF_PROVIDER_CONTEXT" },
        0x4345 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PERF_COUNTERSET_INFO" },
        0x4349 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PERF_COUNTERSET_INSTANCE" },
        0x434d => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PERF_INSTANCE_HEADER" },
        0x4351 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PerfRegInfoType" },
        0x4355 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PERF_COUNTER_IDENTIFIER" },
        0x4359 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PERF_DATA_HEADER" },
        0x435d => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_HQUERY" },
        0x4361 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_HCOUNTER" },
        0x4365 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_HLOG" },
        0x4369 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_FMT_COUNTERVALUE" },
        0x436d => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_FMT_COUNTERVALUE_ITEM_A" },
        0x4371 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_FMT_COUNTERVALUE_ITEM_W" },
        0x4375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_RAW_COUNTER" },
        0x4379 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_RAW_COUNTER_ITEM_A" },
        0x437d => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_RAW_COUNTER_ITEM_W" },
        0x4381 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_STATISTICS" },
        0x4385 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_COUNTER_INFO_W" },
        0x4389 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_COUNTER_INFO_A" },
        0x438d => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_COUNTER_PATH_ELEMENTS_W" },
        0x4391 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_COUNTER_PATH_ELEMENTS_A" },
        0x4395 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_BROWSE_DLG_CONFIG_W" },
        0x4399 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_BROWSE_DLG_CONFIG_A" },
        0x439d => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_TIME_INFO" },
        0x43a1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_RAW_LOG_RECORD" },
        0x43a5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_BROWSE_DLG_CONFIG_HW" },
        0x43a9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance", .name = "PDH_BROWSE_DLG_CONFIG_HA" },
        else => null,
    };
}

pub const PERF_DETAIL_NOVICE = 100;
pub const PERF_DETAIL_ADVANCED = 200;
pub const PERF_DETAIL_EXPERT = 300;
pub const PERF_DETAIL_WIZARD = 400;
pub const DATA_SOURCE_REGISTRY = 1;
pub const DATA_SOURCE_WBEM = 4;
pub const PDH_PATH_WBEM_RESULT = 1;
pub const PDH_PATH_WBEM_INPUT = 2;
pub const PDH_PATH_WBEM_NONE = 0;
pub const PDH_FMT_DOUBLE = 512;
pub const PDH_FMT_LARGE = 1024;
pub const PDH_FMT_LONG = 256;
pub const PDH_LOG_TYPE_UNDEFINED = 0;
pub const PDH_LOG_TYPE_CSV = 1;
pub const PDH_LOG_TYPE_SQL = 7;
pub const PDH_LOG_TYPE_TSV = 2;
pub const PDH_LOG_TYPE_BINARY = 8;
pub const PDH_LOG_TYPE_PERFMON = 6;
pub const PDH_LOG_READ_ACCESS = 65536;
pub const PDH_LOG_WRITE_ACCESS = 131072;
pub const PDH_LOG_UPDATE_ACCESS = 262144;
pub const PDH_FLAGS_FILE_BROWSER_ONLY = 1;
pub const PDH_FLAGS_NONE = 0;
pub const PDH_CVERSION_WIN50 = 1280;
pub const PDH_VERSION = 1283;
pub const PERF_AGGREGATE_UNDEFINED = 0;
pub const PERF_AGGREGATE_TOTAL = 1;
pub const PERF_AGGREGATE_AVG = 2;
pub const PERF_AGGREGATE_MIN = 3;
pub const PERF_AGGREGATE_MAX = 4;
pub const MAX_COUNTER_PATH = 256;
pub const PDH_MAX_COUNTER_NAME = 1024;
pub const PDH_MAX_INSTANCE_NAME = 1024;
pub const PDH_MAX_COUNTER_PATH = 2048;
pub const PDH_MAX_DATASOURCE_PATH = 1024;
pub const H_WBEM_DATASOURCE = -1;
pub const PDH_MAX_SCALE = 7;
pub const PDH_MIN_SCALE = -7;
pub const PDH_NOEXPANDCOUNTERS = 1;
pub const PDH_NOEXPANDINSTANCES = 2;
pub const PDH_REFRESHCOUNTERS = 4;
pub const PDH_LOG_TYPE_RETIRED_BIN = 3;
pub const PDH_LOG_TYPE_TRACE_KERNEL = 4;
pub const PDH_LOG_TYPE_TRACE_GENERIC = 5;
pub const PERF_PROVIDER_USER_MODE = 0;
pub const PERF_PROVIDER_KERNEL_MODE = 1;
pub const PERF_PROVIDER_DRIVER = 2;
pub const PERF_COUNTERSET_FLAG_MULTIPLE = 2;
pub const PERF_COUNTERSET_FLAG_AGGREGATE = 4;
pub const PERF_COUNTERSET_FLAG_HISTORY = 8;
pub const PERF_COUNTERSET_FLAG_INSTANCE = 16;
pub const PERF_COUNTERSET_SINGLE_INSTANCE = 0;
pub const PERF_COUNTERSET_MULTI_INSTANCES = 2;
pub const PERF_COUNTERSET_SINGLE_AGGREGATE = 4;
pub const PERF_ATTRIB_BY_REFERENCE = 1;
pub const PERF_ATTRIB_NO_DISPLAYABLE = 2;
pub const PERF_ATTRIB_NO_GROUP_SEPARATOR = 4;
pub const PERF_ATTRIB_DISPLAY_AS_REAL = 8;
pub const PERF_ATTRIB_DISPLAY_AS_HEX = 16;
pub const PERF_WILDCARD_COUNTER = 4294967295;
pub const PERF_MAX_INSTANCE_NAME = 1024;
pub const PERF_ADD_COUNTER = 1;
pub const PERF_REMOVE_COUNTER = 2;
pub const PERF_ENUM_INSTANCES = 3;
pub const PERF_COLLECT_START = 5;
pub const PERF_COLLECT_END = 6;
pub const PERF_FILTER = 9;
pub const PERF_DATA_VERSION = 1;
pub const PERF_DATA_REVISION = 1;
pub const PERF_NO_INSTANCES = -1;
pub const PERF_METADATA_MULTIPLE_INSTANCES = -2;
pub const PERF_METADATA_NO_INSTANCES = -3;
pub const PERF_SIZE_DWORD = 0;
pub const PERF_SIZE_LARGE = 256;
pub const PERF_SIZE_ZERO = 512;
pub const PERF_SIZE_VARIABLE_LEN = 768;
pub const PERF_TYPE_NUMBER = 0;
pub const PERF_TYPE_COUNTER = 1024;
pub const PERF_TYPE_TEXT = 2048;
pub const PERF_TYPE_ZERO = 3072;
pub const PERF_NUMBER_HEX = 0;
pub const PERF_NUMBER_DECIMAL = 65536;
pub const PERF_NUMBER_DEC_1000 = 131072;
pub const PERF_COUNTER_VALUE = 0;
pub const PERF_COUNTER_RATE = 65536;
pub const PERF_COUNTER_FRACTION = 131072;
pub const PERF_COUNTER_BASE = 196608;
pub const PERF_COUNTER_ELAPSED = 262144;
pub const PERF_COUNTER_QUEUELEN = 327680;
pub const PERF_COUNTER_HISTOGRAM = 393216;
pub const PERF_COUNTER_PRECISION = 458752;
pub const PERF_TEXT_UNICODE = 0;
pub const PERF_TEXT_ASCII = 65536;
pub const PERF_TIMER_TICK = 0;
pub const PERF_TIMER_100NS = 1048576;
pub const PERF_OBJECT_TIMER = 2097152;
pub const PERF_DELTA_COUNTER = 4194304;
pub const PERF_DELTA_BASE = 8388608;
pub const PERF_INVERSE_COUNTER = 16777216;
pub const PERF_MULTI_COUNTER = 33554432;
pub const PERF_DISPLAY_NO_SUFFIX = 0;
pub const PERF_DISPLAY_PER_SEC = 268435456;
pub const PERF_DISPLAY_PERCENT = 536870912;
pub const PERF_DISPLAY_SECONDS = 805306368;
pub const PERF_DISPLAY_NOSHOW = 1073741824;
pub const PERF_COUNTER_HISTOGRAM_TYPE = 2147483648;
pub const PERF_NO_UNIQUE_ID = -1;
pub const MAX_PERF_OBJECTS_IN_QUERY_FUNCTION = 64;
pub const WINPERF_LOG_NONE = 0;
pub const WINPERF_LOG_USER = 1;
pub const WINPERF_LOG_DEBUG = 2;
pub const WINPERF_LOG_VERBOSE = 3;
pub const PDH_CSTATUS_VALID_DATA = 0;
pub const PDH_CSTATUS_NEW_DATA = 1;
pub const PDH_CSTATUS_NO_MACHINE = 2147485648;
pub const PDH_CSTATUS_NO_INSTANCE = 2147485649;
pub const PDH_MORE_DATA = 2147485650;
pub const PDH_CSTATUS_ITEM_NOT_VALIDATED = 2147485651;
pub const PDH_RETRY = 2147485652;
pub const PDH_NO_DATA = 2147485653;
pub const PDH_CALC_NEGATIVE_DENOMINATOR = 2147485654;
pub const PDH_CALC_NEGATIVE_TIMEBASE = 2147485655;
pub const PDH_CALC_NEGATIVE_VALUE = 2147485656;
pub const PDH_DIALOG_CANCELLED = 2147485657;
pub const PDH_END_OF_LOG_FILE = 2147485658;
pub const PDH_ASYNC_QUERY_TIMEOUT = 2147485659;
pub const PDH_CANNOT_SET_DEFAULT_REALTIME_DATASOURCE = 2147485660;
pub const PDH_UNABLE_MAP_NAME_FILES = 2147486677;
pub const PDH_PLA_VALIDATION_WARNING = 2147486707;
pub const PDH_CSTATUS_NO_OBJECT = 3221228472;
pub const PDH_CSTATUS_NO_COUNTER = 3221228473;
pub const PDH_CSTATUS_INVALID_DATA = 3221228474;
pub const PDH_MEMORY_ALLOCATION_FAILURE = 3221228475;
pub const PDH_INVALID_HANDLE = 3221228476;
pub const PDH_INVALID_ARGUMENT = 3221228477;
pub const PDH_FUNCTION_NOT_FOUND = 3221228478;
pub const PDH_CSTATUS_NO_COUNTERNAME = 3221228479;
pub const PDH_CSTATUS_BAD_COUNTERNAME = 3221228480;
pub const PDH_INVALID_BUFFER = 3221228481;
pub const PDH_INSUFFICIENT_BUFFER = 3221228482;
pub const PDH_CANNOT_CONNECT_MACHINE = 3221228483;
pub const PDH_INVALID_PATH = 3221228484;
pub const PDH_INVALID_INSTANCE = 3221228485;
pub const PDH_INVALID_DATA = 3221228486;
pub const PDH_NO_DIALOG_DATA = 3221228487;
pub const PDH_CANNOT_READ_NAME_STRINGS = 3221228488;
pub const PDH_LOG_FILE_CREATE_ERROR = 3221228489;
pub const PDH_LOG_FILE_OPEN_ERROR = 3221228490;
pub const PDH_LOG_TYPE_NOT_FOUND = 3221228491;
pub const PDH_NO_MORE_DATA = 3221228492;
pub const PDH_ENTRY_NOT_IN_LOG_FILE = 3221228493;
pub const PDH_DATA_SOURCE_IS_LOG_FILE = 3221228494;
pub const PDH_DATA_SOURCE_IS_REAL_TIME = 3221228495;
pub const PDH_UNABLE_READ_LOG_HEADER = 3221228496;
pub const PDH_FILE_NOT_FOUND = 3221228497;
pub const PDH_FILE_ALREADY_EXISTS = 3221228498;
pub const PDH_NOT_IMPLEMENTED = 3221228499;
pub const PDH_STRING_NOT_FOUND = 3221228500;
pub const PDH_UNKNOWN_LOG_FORMAT = 3221228502;
pub const PDH_UNKNOWN_LOGSVC_COMMAND = 3221228503;
pub const PDH_LOGSVC_QUERY_NOT_FOUND = 3221228504;
pub const PDH_LOGSVC_NOT_OPENED = 3221228505;
pub const PDH_WBEM_ERROR = 3221228506;
pub const PDH_ACCESS_DENIED = 3221228507;
pub const PDH_LOG_FILE_TOO_SMALL = 3221228508;
pub const PDH_INVALID_DATASOURCE = 3221228509;
pub const PDH_INVALID_SQLDB = 3221228510;
pub const PDH_NO_COUNTERS = 3221228511;
pub const PDH_SQL_ALLOC_FAILED = 3221228512;
pub const PDH_SQL_ALLOCCON_FAILED = 3221228513;
pub const PDH_SQL_EXEC_DIRECT_FAILED = 3221228514;
pub const PDH_SQL_FETCH_FAILED = 3221228515;
pub const PDH_SQL_ROWCOUNT_FAILED = 3221228516;
pub const PDH_SQL_MORE_RESULTS_FAILED = 3221228517;
pub const PDH_SQL_CONNECT_FAILED = 3221228518;
pub const PDH_SQL_BIND_FAILED = 3221228519;
pub const PDH_CANNOT_CONNECT_WMI_SERVER = 3221228520;
pub const PDH_PLA_COLLECTION_ALREADY_RUNNING = 3221228521;
pub const PDH_PLA_ERROR_SCHEDULE_OVERLAP = 3221228522;
pub const PDH_PLA_COLLECTION_NOT_FOUND = 3221228523;
pub const PDH_PLA_ERROR_SCHEDULE_ELAPSED = 3221228524;
pub const PDH_PLA_ERROR_NOSTART = 3221228525;
pub const PDH_PLA_ERROR_ALREADY_EXISTS = 3221228526;
pub const PDH_PLA_ERROR_TYPE_MISMATCH = 3221228527;
pub const PDH_PLA_ERROR_FILEPATH = 3221228528;
pub const PDH_PLA_SERVICE_ERROR = 3221228529;
pub const PDH_PLA_VALIDATION_ERROR = 3221228530;
pub const PDH_PLA_ERROR_NAME_TOO_LONG = 3221228532;
pub const PDH_INVALID_SQL_LOG_FORMAT = 3221228533;
pub const PDH_COUNTER_ALREADY_IN_QUERY = 3221228534;
pub const PDH_BINARY_LOG_CORRUPT = 3221228535;
pub const PDH_LOG_SAMPLE_TOO_SMALL = 3221228536;
pub const PDH_OS_LATER_VERSION = 3221228537;
pub const PDH_OS_EARLIER_VERSION = 3221228538;
pub const PDH_INCORRECT_APPEND_TIME = 3221228539;
pub const PDH_UNMATCHED_APPEND_COUNTER = 3221228540;
pub const PDH_SQL_ALTER_DETAIL_FAILED = 3221228541;
pub const PDH_QUERY_PERF_DATA_TIMEOUT = 3221228542;
pub const PLA_CAPABILITY_LOCAL = 268435456;
pub const PLA_CAPABILITY_V1_SVC = 1;
pub const PLA_CAPABILITY_V1_SESSION = 2;
pub const PLA_CAPABILITY_V1_SYSTEM = 4;
pub const PLA_CAPABILITY_LEGACY_SESSION = 8;
pub const PLA_CAPABILITY_LEGACY_SVC = 16;
pub const PLA_CAPABILITY_AUTOLOGGER = 32;
pub const PLAL_ALERT_CMD_LINE_SINGLE = 256;
pub const PLAL_ALERT_CMD_LINE_A_NAME = 512;
pub const PLAL_ALERT_CMD_LINE_C_NAME = 1024;
pub const PLAL_ALERT_CMD_LINE_D_TIME = 2048;
pub const PLAL_ALERT_CMD_LINE_L_VAL = 4096;
pub const PLAL_ALERT_CMD_LINE_M_VAL = 8192;
pub const PLAL_ALERT_CMD_LINE_U_TEXT = 16384;
pub const PLAL_ALERT_CMD_LINE_MASK = 32512;
pub const plaPerformanceCounter = 0;
pub const plaTrace = 1;
pub const plaConfiguration = 2;
pub const plaAlert = 3;
pub const plaApiTrace = 4;
pub const plaCommaSeparated = 0;
pub const plaTabSeparated = 1;
pub const plaSql = 2;
pub const plaBinary = 3;
pub const plaNone = 0;
pub const plaPattern = 1;
pub const plaComputer = 2;
pub const plaMonthDayHour = 256;
pub const plaSerialNumber = 512;
pub const plaYearDayOfYear = 1024;
pub const plaYearMonth = 2048;
pub const plaYearMonthDay = 4096;
pub const plaYearMonthDayHour = 8192;
pub const plaMonthDayHourMinute = 16384;
pub const plaStopped = 0;
pub const plaRunning = 1;
pub const plaCompiling = 2;
pub const plaPending = 3;
pub const plaUndefined = 4;
pub const plaTimeStamp = 0;
pub const plaPerformance = 1;
pub const plaSystem = 2;
pub const plaCycle = 3;
pub const plaFile = 1;
pub const plaRealTime = 2;
pub const plaBoth = 3;
pub const plaBuffering = 4;
pub const plaCreateNew = 1;
pub const plaModify = 2;
pub const plaCreateOrModify = 3;
pub const plaUpdateRunningInstance = 16;
pub const plaFlushTrace = 32;
pub const plaValidateOnly = 4096;
pub const plaIndex = 1;
pub const plaFlag = 2;
pub const plaFlagArray = 3;
pub const plaValidation = 4;
pub const plaRunOnce = 0;
pub const plaSunday = 1;
pub const plaMonday = 2;
pub const plaTuesday = 4;
pub const plaWednesday = 8;
pub const plaThursday = 16;
pub const plaFriday = 32;
pub const plaSaturday = 64;
pub const plaEveryday = 127;
pub const plaDeleteLargest = 0;
pub const plaDeleteOldest = 1;
pub const plaCreateReport = 1;
pub const plaRunRules = 2;
pub const plaCreateHtml = 4;
pub const plaFolderActions = 8;
pub const plaResourceFreeing = 16;
pub const plaCreateCab = 1;
pub const plaDeleteData = 2;
pub const plaSendCab = 4;
pub const plaDeleteCab = 8;
pub const plaDeleteReport = 16;
pub const PERF_REG_COUNTERSET_STRUCT = 1;
pub const PERF_REG_COUNTER_STRUCT = 2;
pub const PERF_REG_COUNTERSET_NAME_STRING = 3;
pub const PERF_REG_COUNTERSET_HELP_STRING = 4;
pub const PERF_REG_COUNTER_NAME_STRINGS = 5;
pub const PERF_REG_COUNTER_HELP_STRINGS = 6;
pub const PERF_REG_PROVIDER_NAME = 7;
pub const PERF_REG_PROVIDER_GUID = 8;
pub const PERF_REG_COUNTERSET_ENGLISH_NAME = 9;
pub const PERF_REG_COUNTER_ENGLISH_NAMES = 10;
pub const PERF_ERROR_RETURN = 0;
pub const PERF_SINGLE_COUNTER = 1;
pub const PERF_MULTIPLE_COUNTERS = 2;
pub const PERF_MULTIPLE_INSTANCES = 4;
pub const PERF_COUNTERSET = 6;
pub const sysmonLineGraph = 1;
pub const sysmonHistogram = 2;
pub const sysmonReport = 3;
pub const sysmonChartArea = 4;
pub const sysmonChartStackedArea = 5;
pub const sysmonDefaultValue = 0;
pub const sysmonCurrentValue = 1;
pub const sysmonAverage = 2;
pub const sysmonMinimum = 3;
pub const sysmonMaximum = 4;
pub const sysmonNullDataSource = -1;
pub const sysmonCurrentActivity = 1;
pub const sysmonLogFiles = 2;
pub const sysmonSqlLog = 3;
pub const sysmonFileHtml = 1;
pub const sysmonFileReport = 2;
pub const sysmonFileCsv = 3;
pub const sysmonFileTsv = 4;
pub const sysmonFileBlg = 5;
pub const sysmonFileRetiredBlg = 6;
pub const sysmonFileGif = 7;
pub const sysmonDataAvg = 1;
pub const sysmonDataMin = 2;
pub const sysmonDataMax = 3;
pub const sysmonDataTime = 4;
pub const sysmonDataCount = 5;
pub const sysmonBatchNone = 0;
pub const sysmonBatchAddFiles = 1;
pub const sysmonBatchAddCounters = 2;
pub const sysmonBatchAddFilesAutoCounters = 3;

pub const aliases = struct {
    pub const PERF_DETAIL = u32;
    pub const REAL_TIME_DATA_SOURCE_ID_FLAGS = u32;
    pub const PDH_PATH_FLAGS = u32;
    pub const PDH_FMT = u32;
    pub const PDH_LOG_TYPE = u32;
    pub const PDH_LOG = u32;
    pub const PDH_SELECT_DATA_SOURCE_FLAGS = u32;
    pub const PDH_DLL_VERSION = u32;
    pub const PERF_COUNTER_AGGREGATE_FUNC = u32;
    pub const DataCollectorType = i32;
    pub const FileFormat = i32;
    pub const AutoPathFormat = i32;
    pub const DataCollectorSetStatus = i32;
    pub const ClockType = i32;
    pub const StreamMode = i32;
    pub const CommitMode = i32;
    pub const ValueMapType = i32;
    pub const WeekDays = i32;
    pub const ResourcePolicy = i32;
    pub const DataManagerSteps = i32;
    pub const FolderActionSteps = i32;
    pub const PerfRegInfoType = i32;
    pub const PerfCounterDataType = i32;
    pub const DisplayTypeConstants = i32;
    pub const ReportValueTypeConstants = i32;
    pub const DataSourceTypeConstants = i32;
    pub const SysmonFileType = i32;
    pub const SysmonDataType = i32;
    pub const SysmonBatchReason = i32;
};
