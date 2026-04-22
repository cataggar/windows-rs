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
    .{ "StartTraceW", MethodRecord{ .library = "ADVAPI32", .import = "StartTraceW", .signature = "\x00\x03\x11\x81\x01\x0f\x0b\x11\x05\x0f\x11\x8b\x01" } },
    .{ "StartTraceA", MethodRecord{ .library = "ADVAPI32", .import = "StartTraceA", .signature = "\x00\x03\x11\x81\x01\x0f\x0b\x11\x3d\x0f\x11\x8b\x01" } },
    .{ "StopTraceW", MethodRecord{ .library = "ADVAPI32", .import = "StopTraceW", .signature = "\x00\x03\x11\x81\x01\x0b\x11\x05\x0f\x11\x8b\x01" } },
    .{ "StopTraceA", MethodRecord{ .library = "ADVAPI32", .import = "StopTraceA", .signature = "\x00\x03\x11\x81\x01\x0b\x11\x3d\x0f\x11\x8b\x01" } },
    .{ "QueryTraceW", MethodRecord{ .library = "ADVAPI32", .import = "QueryTraceW", .signature = "\x00\x03\x11\x81\x01\x0b\x11\x05\x0f\x11\x8b\x01" } },
    .{ "QueryTraceA", MethodRecord{ .library = "ADVAPI32", .import = "QueryTraceA", .signature = "\x00\x03\x11\x81\x01\x0b\x11\x3d\x0f\x11\x8b\x01" } },
    .{ "UpdateTraceW", MethodRecord{ .library = "ADVAPI32", .import = "UpdateTraceW", .signature = "\x00\x03\x11\x81\x01\x0b\x11\x05\x0f\x11\x8b\x01" } },
    .{ "UpdateTraceA", MethodRecord{ .library = "ADVAPI32", .import = "UpdateTraceA", .signature = "\x00\x03\x11\x81\x01\x0b\x11\x3d\x0f\x11\x8b\x01" } },
    .{ "FlushTraceW", MethodRecord{ .library = "ADVAPI32", .import = "FlushTraceW", .signature = "\x00\x03\x11\x81\x01\x0b\x11\x05\x0f\x11\x8b\x01" } },
    .{ "FlushTraceA", MethodRecord{ .library = "ADVAPI32", .import = "FlushTraceA", .signature = "\x00\x03\x11\x81\x01\x0b\x11\x3d\x0f\x11\x8b\x01" } },
    .{ "ControlTraceW", MethodRecord{ .library = "ADVAPI32", .import = "ControlTraceW", .signature = "\x00\x04\x11\x81\x01\x0b\x11\x05\x0f\x11\x8b\x01\x11\x8b\x05" } },
    .{ "ControlTraceA", MethodRecord{ .library = "ADVAPI32", .import = "ControlTraceA", .signature = "\x00\x04\x11\x81\x01\x0b\x11\x3d\x0f\x11\x8b\x01\x11\x8b\x05" } },
    .{ "QueryAllTracesW", MethodRecord{ .library = "ADVAPI32", .import = "QueryAllTracesW", .signature = "\x00\x03\x11\x81\x01\x0f\x0f\x11\x8b\x01\x09\x0f\x09" } },
    .{ "QueryAllTracesA", MethodRecord{ .library = "ADVAPI32", .import = "QueryAllTracesA", .signature = "\x00\x03\x11\x81\x01\x0f\x0f\x11\x8b\x01\x09\x0f\x09" } },
    .{ "EnableTrace", MethodRecord{ .library = "ADVAPI32", .import = "EnableTrace", .signature = "\x00\x05\x11\x81\x01\x09\x09\x09\x0f\x11\x0d\x0b" } },
    .{ "EnableTraceEx", MethodRecord{ .library = "ADVAPI32", .import = "EnableTraceEx", .signature = "\x00\x09\x11\x81\x01\x0f\x11\x0d\x0f\x11\x0d\x0b\x09\x05\x0b\x0b\x09\x0f\x11\x8b\x09" } },
    .{ "EnableTraceEx2", MethodRecord{ .library = "ADVAPI32", .import = "EnableTraceEx2", .signature = "\x00\x08\x11\x81\x01\x0b\x0f\x11\x0d\x09\x05\x0b\x0b\x09\x0f\x11\x8b\x0d" } },
    .{ "EnumerateTraceGuidsEx", MethodRecord{ .library = "ADVAPI32", .import = "EnumerateTraceGuidsEx", .signature = "\x00\x06\x11\x81\x01\x11\x8b\x11\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "TraceSetInformation", MethodRecord{ .library = "ADVAPI32", .import = "TraceSetInformation", .signature = "\x00\x04\x11\x81\x01\x0b\x11\x8b\x11\x0f\x01\x09" } },
    .{ "TraceQueryInformation", MethodRecord{ .library = "ADVAPI32", .import = "TraceQueryInformation", .signature = "\x00\x05\x11\x81\x01\x0b\x11\x8b\x11\x0f\x01\x09\x0f\x09" } },
    .{ "TraceConfigureLastBranchRecord", MethodRecord{ .library = "ADVAPI32", .import = "TraceConfigureLastBranchRecord", .signature = "\x00\x04\x09\x0b\x11\x8b\x15\x0f\x11\x8b\x19\x09" } },
    .{ "CreateTraceInstanceId", MethodRecord{ .library = "ADVAPI32", .import = "CreateTraceInstanceId", .signature = "\x00\x02\x11\x81\x01\x11\x80\x85\x0f\x11\x8b\x1d" } },
    .{ "TraceEvent", MethodRecord{ .library = "ADVAPI32", .import = "TraceEvent", .signature = "\x00\x02\x11\x81\x01\x0b\x0f\x11\x8b\x21" } },
    .{ "TraceEventInstance", MethodRecord{ .library = "ADVAPI32", .import = "TraceEventInstance", .signature = "\x00\x04\x09\x0b\x0f\x11\x8b\x25\x0f\x11\x8b\x1d\x0f\x11\x8b\x1d" } },
    .{ "RegisterTraceGuidsW", MethodRecord{ .library = "ADVAPI32", .import = "RegisterTraceGuidsW", .signature = "\x00\x08\x09\x12\x8b\x29\x0f\x01\x0f\x11\x0d\x09\x0f\x11\x8b\x2d\x11\x05\x11\x05\x0f\x0b" } },
    .{ "RegisterTraceGuidsA", MethodRecord{ .library = "ADVAPI32", .import = "RegisterTraceGuidsA", .signature = "\x00\x08\x09\x12\x8b\x29\x0f\x01\x0f\x11\x0d\x09\x0f\x11\x8b\x2d\x11\x3d\x11\x3d\x0f\x0b" } },
    .{ "EnumerateTraceGuids", MethodRecord{ .library = "ADVAPI32", .import = "EnumerateTraceGuids", .signature = "\x00\x03\x11\x81\x01\x0f\x0f\x11\x8b\x31\x09\x0f\x09" } },
    .{ "UnregisterTraceGuids", MethodRecord{ .library = "ADVAPI32", .import = "UnregisterTraceGuids", .signature = "\x00\x01\x09\x0b" } },
    .{ "GetTraceLoggerHandle", MethodRecord{ .library = "ADVAPI32", .import = "GetTraceLoggerHandle", .signature = "\x00\x01\x0b\x0f\x01" } },
    .{ "GetTraceEnableLevel", MethodRecord{ .library = "ADVAPI32", .import = "GetTraceEnableLevel", .signature = "\x00\x01\x05\x0b" } },
    .{ "GetTraceEnableFlags", MethodRecord{ .library = "ADVAPI32", .import = "GetTraceEnableFlags", .signature = "\x00\x01\x09\x0b" } },
    .{ "OpenTraceW", MethodRecord{ .library = "ADVAPI32", .import = "OpenTraceW", .signature = "\x00\x01\x11\x8b\x35\x0f\x11\x8b\x39" } },
    .{ "ProcessTrace", MethodRecord{ .library = "ADVAPI32", .import = "ProcessTrace", .signature = "\x00\x04\x11\x81\x01\x0f\x11\x8b\x35\x09\x0f\x11\x80\x9d\x0f\x11\x80\x9d" } },
    .{ "CloseTrace", MethodRecord{ .library = "ADVAPI32", .import = "CloseTrace", .signature = "\x00\x01\x11\x81\x01\x11\x8b\x35" } },
    .{ "OpenTraceFromBufferStream", MethodRecord{ .library = "ADVAPI32", .import = "OpenTraceFromBufferStream", .signature = "\x00\x03\x11\x8b\x35\x0f\x11\x8b\x3d\x12\x8b\x41\x0f\x01" } },
    .{ "OpenTraceFromRealTimeLogger", MethodRecord{ .library = "ADVAPI32", .import = "OpenTraceFromRealTimeLogger", .signature = "\x00\x03\x11\x8b\x35\x11\x05\x0f\x11\x8b\x3d\x0f\x11\x8b\x45" } },
    .{ "OpenTraceFromRealTimeLoggerWithAllocationOptions", MethodRecord{ .library = "ADVAPI32", .import = "OpenTraceFromRealTimeLoggerWithAllocationOptions", .signature = "\x00\x05\x11\x8b\x35\x11\x05\x0f\x11\x8b\x3d\x19\x11\x80\x85\x0f\x11\x8b\x45" } },
    .{ "OpenTraceFromFile", MethodRecord{ .library = "ADVAPI32", .import = "OpenTraceFromFile", .signature = "\x00\x03\x11\x8b\x35\x11\x05\x0f\x11\x8b\x3d\x0f\x11\x8b\x45" } },
    .{ "ProcessTraceBufferIncrementReference", MethodRecord{ .library = "ADVAPI32", .import = "ProcessTraceBufferIncrementReference", .signature = "\x00\x02\x09\x11\x8b\x35\x0f\x11\x8b\x49" } },
    .{ "ProcessTraceBufferDecrementReference", MethodRecord{ .library = "ADVAPI32", .import = "ProcessTraceBufferDecrementReference", .signature = "\x00\x01\x09\x0f\x11\x8b\x49" } },
    .{ "ProcessTraceAddBufferToBufferStream", MethodRecord{ .library = "ADVAPI32", .import = "ProcessTraceAddBufferToBufferStream", .signature = "\x00\x03\x09\x11\x8b\x35\x0f\x11\x8b\x49\x09" } },
    .{ "QueryTraceProcessingHandle", MethodRecord{ .library = "ADVAPI32", .import = "QueryTraceProcessingHandle", .signature = "\x00\x07\x11\x81\x01\x11\x8b\x35\x11\x8b\x4d\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "OpenTraceA", MethodRecord{ .library = "ADVAPI32", .import = "OpenTraceA", .signature = "\x00\x01\x11\x8b\x35\x0f\x11\x8b\x51" } },
    .{ "SetTraceCallback", MethodRecord{ .library = "ADVAPI32", .import = "SetTraceCallback", .signature = "\x00\x02\x11\x81\x01\x0f\x11\x0d\x12\x8b\x55" } },
    .{ "RemoveTraceCallback", MethodRecord{ .library = "ADVAPI32", .import = "RemoveTraceCallback", .signature = "\x00\x01\x11\x81\x01\x0f\x11\x0d" } },
    .{ "TraceMessage", MethodRecord{ .library = "ADVAPI32", .import = "TraceMessage", .signature = "\x05\x04\x11\x81\x01\x0b\x11\x8b\x59\x0f\x11\x0d\x07" } },
    .{ "TraceMessageVa", MethodRecord{ .library = "ADVAPI32", .import = "TraceMessageVa", .signature = "\x00\x05\x11\x81\x01\x0b\x11\x8b\x59\x0f\x11\x0d\x07\x0f\x04" } },
    .{ "EventRegister", MethodRecord{ .library = "ADVAPI32", .import = "EventRegister", .signature = "\x00\x04\x09\x0f\x11\x0d\x12\x8b\x5d\x0f\x01\x0f\x11\x8b\x61" } },
    .{ "EventUnregister", MethodRecord{ .library = "ADVAPI32", .import = "EventUnregister", .signature = "\x00\x01\x09\x11\x8b\x61" } },
    .{ "EventSetInformation", MethodRecord{ .library = "ADVAPI32", .import = "EventSetInformation", .signature = "\x00\x04\x09\x11\x8b\x61\x11\x8b\x65\x0f\x01\x09" } },
    .{ "EventEnabled", MethodRecord{ .library = "ADVAPI32", .import = "EventEnabled", .signature = "\x00\x02\x11\x87\x79\x11\x8b\x61\x0f\x11\x8b\x69" } },
    .{ "EventProviderEnabled", MethodRecord{ .library = "ADVAPI32", .import = "EventProviderEnabled", .signature = "\x00\x03\x11\x87\x79\x11\x8b\x61\x05\x0b" } },
    .{ "EventWrite", MethodRecord{ .library = "ADVAPI32", .import = "EventWrite", .signature = "\x00\x04\x09\x11\x8b\x61\x0f\x11\x8b\x69\x09\x0f\x11\x8b\x6d" } },
    .{ "EventWriteTransfer", MethodRecord{ .library = "ADVAPI32", .import = "EventWriteTransfer", .signature = "\x00\x06\x09\x11\x8b\x61\x0f\x11\x8b\x69\x0f\x11\x0d\x0f\x11\x0d\x09\x0f\x11\x8b\x6d" } },
    .{ "EventWriteEx", MethodRecord{ .library = "ADVAPI32", .import = "EventWriteEx", .signature = "\x00\x08\x09\x11\x8b\x61\x0f\x11\x8b\x69\x0b\x09\x0f\x11\x0d\x0f\x11\x0d\x09\x0f\x11\x8b\x6d" } },
    .{ "EventWriteString", MethodRecord{ .library = "ADVAPI32", .import = "EventWriteString", .signature = "\x00\x04\x09\x11\x8b\x61\x05\x0b\x11\x05" } },
    .{ "EventActivityIdControl", MethodRecord{ .library = "ADVAPI32", .import = "EventActivityIdControl", .signature = "\x00\x02\x09\x09\x0f\x11\x0d" } },
    .{ "EventAccessControl", MethodRecord{ .library = "ADVAPI32", .import = "EventAccessControl", .signature = "\x00\x05\x09\x0f\x11\x0d\x09\x11\x81\x15\x09\x11\x87\x79" } },
    .{ "EventAccessQuery", MethodRecord{ .library = "ADVAPI32", .import = "EventAccessQuery", .signature = "\x00\x03\x09\x0f\x11\x0d\x11\x82\xad\x0f\x09" } },
    .{ "EventAccessRemove", MethodRecord{ .library = "ADVAPI32", .import = "EventAccessRemove", .signature = "\x00\x01\x09\x0f\x11\x0d" } },
    .{ "TdhCreatePayloadFilter", MethodRecord{ .library = "tdh", .import = "TdhCreatePayloadFilter", .signature = "\x00\x06\x09\x0f\x11\x0d\x0f\x11\x8b\x69\x11\x87\x79\x09\x0f\x11\x8b\x71\x0f\x0f\x01" } },
    .{ "TdhDeletePayloadFilter", MethodRecord{ .library = "tdh", .import = "TdhDeletePayloadFilter", .signature = "\x00\x01\x09\x0f\x0f\x01" } },
    .{ "TdhAggregatePayloadFilters", MethodRecord{ .library = "tdh", .import = "TdhAggregatePayloadFilters", .signature = "\x00\x04\x09\x09\x0f\x0f\x01\x0f\x11\x87\x79\x0f\x11\x8b\x09" } },
    .{ "TdhCleanupPayloadEventFilterDescriptor", MethodRecord{ .library = "tdh", .import = "TdhCleanupPayloadEventFilterDescriptor", .signature = "\x00\x01\x09\x0f\x11\x8b\x09" } },
    .{ "TdhGetEventInformation", MethodRecord{ .library = "TDH", .import = "TdhGetEventInformation", .signature = "\x00\x05\x09\x0f\x11\x8b\x75\x09\x0f\x11\x8b\x79\x0f\x11\x8b\x7d\x0f\x09" } },
    .{ "TdhGetEventMapInformation", MethodRecord{ .library = "TDH", .import = "TdhGetEventMapInformation", .signature = "\x00\x04\x09\x0f\x11\x8b\x75\x11\x05\x0f\x11\x8b\x81\x0f\x09" } },
    .{ "TdhGetPropertySize", MethodRecord{ .library = "TDH", .import = "TdhGetPropertySize", .signature = "\x00\x06\x09\x0f\x11\x8b\x75\x09\x0f\x11\x8b\x79\x09\x0f\x11\x8b\x85\x0f\x09" } },
    .{ "TdhGetProperty", MethodRecord{ .library = "TDH", .import = "TdhGetProperty", .signature = "\x00\x07\x09\x0f\x11\x8b\x75\x09\x0f\x11\x8b\x79\x09\x0f\x11\x8b\x85\x09\x0f\x05" } },
    .{ "TdhEnumerateProviders", MethodRecord{ .library = "TDH", .import = "TdhEnumerateProviders", .signature = "\x00\x02\x09\x0f\x11\x8b\x89\x0f\x09" } },
    .{ "TdhEnumerateProvidersForDecodingSource", MethodRecord{ .library = "tdh", .import = "TdhEnumerateProvidersForDecodingSource", .signature = "\x00\x04\x09\x11\x8b\x8d\x0f\x11\x8b\x89\x09\x0f\x09" } },
    .{ "TdhQueryProviderFieldInformation", MethodRecord{ .library = "TDH", .import = "TdhQueryProviderFieldInformation", .signature = "\x00\x05\x09\x0f\x11\x0d\x0b\x11\x8b\x91\x0f\x11\x8b\x95\x0f\x09" } },
    .{ "TdhEnumerateProviderFieldInformation", MethodRecord{ .library = "TDH", .import = "TdhEnumerateProviderFieldInformation", .signature = "\x00\x04\x09\x0f\x11\x0d\x11\x8b\x91\x0f\x11\x8b\x95\x0f\x09" } },
    .{ "TdhEnumerateProviderFilters", MethodRecord{ .library = "tdh", .import = "TdhEnumerateProviderFilters", .signature = "\x00\x06\x09\x0f\x11\x0d\x09\x0f\x11\x8b\x79\x0f\x09\x0f\x0f\x11\x8b\x99\x0f\x09" } },
    .{ "TdhLoadManifest", MethodRecord{ .library = "TDH", .import = "TdhLoadManifest", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "TdhLoadManifestFromMemory", MethodRecord{ .library = "TDH", .import = "TdhLoadManifestFromMemory", .signature = "\x00\x02\x09\x0f\x01\x09" } },
    .{ "TdhUnloadManifest", MethodRecord{ .library = "TDH", .import = "TdhUnloadManifest", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "TdhUnloadManifestFromMemory", MethodRecord{ .library = "TDH", .import = "TdhUnloadManifestFromMemory", .signature = "\x00\x02\x09\x0f\x01\x09" } },
    .{ "TdhFormatProperty", MethodRecord{ .library = "TDH", .import = "TdhFormatProperty", .signature = "\x00\x0b\x09\x0f\x11\x8b\x7d\x0f\x11\x8b\x81\x09\x07\x07\x07\x07\x0f\x05\x0f\x09\x11\x05\x0f\x07" } },
    .{ "TdhOpenDecodingHandle", MethodRecord{ .library = "tdh", .import = "TdhOpenDecodingHandle", .signature = "\x00\x01\x09\x0f\x11\x8b\x9d" } },
    .{ "TdhSetDecodingParameter", MethodRecord{ .library = "tdh", .import = "TdhSetDecodingParameter", .signature = "\x00\x02\x09\x11\x8b\x9d\x0f\x11\x8b\x79" } },
    .{ "TdhGetDecodingParameter", MethodRecord{ .library = "tdh", .import = "TdhGetDecodingParameter", .signature = "\x00\x02\x09\x11\x8b\x9d\x0f\x11\x8b\x79" } },
    .{ "TdhGetWppProperty", MethodRecord{ .library = "tdh", .import = "TdhGetWppProperty", .signature = "\x00\x05\x09\x11\x8b\x9d\x0f\x11\x8b\x75\x11\x05\x0f\x09\x0f\x05" } },
    .{ "TdhGetWppMessage", MethodRecord{ .library = "tdh", .import = "TdhGetWppMessage", .signature = "\x00\x04\x09\x11\x8b\x9d\x0f\x11\x8b\x75\x0f\x09\x0f\x05" } },
    .{ "TdhCloseDecodingHandle", MethodRecord{ .library = "tdh", .import = "TdhCloseDecodingHandle", .signature = "\x00\x01\x09\x11\x8b\x9d" } },
    .{ "TdhLoadManifestFromBinary", MethodRecord{ .library = "tdh", .import = "TdhLoadManifestFromBinary", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "TdhEnumerateManifestProviderEvents", MethodRecord{ .library = "TDH", .import = "TdhEnumerateManifestProviderEvents", .signature = "\x00\x03\x09\x0f\x11\x0d\x0f\x11\x8b\xa1\x0f\x09" } },
    .{ "TdhGetManifestEventInformation", MethodRecord{ .library = "TDH", .import = "TdhGetManifestEventInformation", .signature = "\x00\x04\x09\x0f\x11\x0d\x0f\x11\x8b\x69\x0f\x11\x8b\x7d\x0f\x09" } },
    .{ "CveEventWrite", MethodRecord{ .library = "ADVAPI32", .import = "CveEventWrite", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x115 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSID" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0xb01 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "EVENT_TRACE_PROPERTIES" },
        0xb05 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "EVENT_TRACE_CONTROL" },
        0xb09 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "EVENT_FILTER_DESCRIPTOR" },
        0xb0d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "ENABLE_TRACE_PARAMETERS" },
        0xb11 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "TRACE_QUERY_INFO_CLASS" },
        0xb15 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "TRACE_LBR_CONFIGURATION" },
        0xb19 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "CLASSIC_EVENT_ID" },
        0xb1d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "EVENT_INSTANCE_INFO" },
        0xb21 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "EVENT_TRACE_HEADER" },
        0xb25 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "EVENT_INSTANCE_HEADER" },
        0xb29 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "WMIDPREQUEST" },
        0xb2d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "TRACE_GUID_REGISTRATION" },
        0xb31 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "TRACE_GUID_PROPERTIES" },
        0xb35 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "PROCESSTRACE_HANDLE" },
        0xb39 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "EVENT_TRACE_LOGFILEW" },
        0xb3d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "ETW_OPEN_TRACE_OPTIONS" },
        0xb41 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "PETW_BUFFER_COMPLETION_CALLBACK" },
        0xb45 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "TRACE_LOGFILE_HEADER" },
        0xb49 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "ETW_BUFFER_HEADER" },
        0xb4d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "ETW_PROCESS_HANDLE_INFO_TYPE" },
        0xb51 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "EVENT_TRACE_LOGFILEA" },
        0xb55 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "PEVENT_CALLBACK" },
        0xb59 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "TRACE_MESSAGE_FLAGS" },
        0xb5d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "PENABLECALLBACK" },
        0xb61 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "REGHANDLE" },
        0xb65 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "EVENT_INFO_CLASS" },
        0xb69 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "EVENT_DESCRIPTOR" },
        0xb6d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "EVENT_DATA_DESCRIPTOR" },
        0xb71 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "PAYLOAD_FILTER_PREDICATE" },
        0xb75 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "EVENT_RECORD" },
        0xb79 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "TDH_CONTEXT" },
        0xb7d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "TRACE_EVENT_INFO" },
        0xb81 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "EVENT_MAP_INFO" },
        0xb85 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "PROPERTY_DATA_DESCRIPTOR" },
        0xb89 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "PROVIDER_ENUMERATION_INFO" },
        0xb8d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "DECODING_SOURCE" },
        0xb91 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "EVENT_FIELD_TYPE" },
        0xb95 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "PROVIDER_FIELD_INFOARRAY" },
        0xb99 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "PROVIDER_FILTER_INFO" },
        0xb9d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "TDH_HANDLE" },
        0xba1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Etw", .name = "PROVIDER_EVENT_INFO" },
        else => null,
    };
}

pub const WNODE_FLAG_ALL_DATA = 1;
pub const WNODE_FLAG_SINGLE_INSTANCE = 2;
pub const WNODE_FLAG_SINGLE_ITEM = 4;
pub const WNODE_FLAG_EVENT_ITEM = 8;
pub const WNODE_FLAG_FIXED_INSTANCE_SIZE = 16;
pub const WNODE_FLAG_TOO_SMALL = 32;
pub const WNODE_FLAG_INSTANCES_SAME = 64;
pub const WNODE_FLAG_STATIC_INSTANCE_NAMES = 128;
pub const WNODE_FLAG_INTERNAL = 256;
pub const WNODE_FLAG_USE_TIMESTAMP = 512;
pub const WNODE_FLAG_PERSIST_EVENT = 1024;
pub const WNODE_FLAG_EVENT_REFERENCE = 8192;
pub const WNODE_FLAG_ANSI_INSTANCENAMES = 16384;
pub const WNODE_FLAG_METHOD_ITEM = 32768;
pub const WNODE_FLAG_PDO_INSTANCE_NAMES = 65536;
pub const WNODE_FLAG_TRACED_GUID = 131072;
pub const WNODE_FLAG_LOG_WNODE = 262144;
pub const WNODE_FLAG_USE_GUID_PTR = 524288;
pub const WNODE_FLAG_USE_MOF_PTR = 1048576;
pub const WNODE_FLAG_NO_HEADER = 2097152;
pub const WNODE_FLAG_SEND_DATA_BLOCK = 4194304;
pub const WNODE_FLAG_VERSIONED_PROPERTIES = 8388608;
pub const WNODE_FLAG_SEVERITY_MASK = 4278190080;
pub const WMIREG_FLAG_EXPENSIVE = 1;
pub const WMIREG_FLAG_INSTANCE_LIST = 4;
pub const WMIREG_FLAG_INSTANCE_BASENAME = 8;
pub const WMIREG_FLAG_INSTANCE_PDO = 32;
pub const WMIREG_FLAG_REMOVE_GUID = 65536;
pub const WMIREG_FLAG_RESERVED1 = 131072;
pub const WMIREG_FLAG_RESERVED2 = 262144;
pub const WMIREG_FLAG_TRACED_GUID = 524288;
pub const WMIREG_FLAG_TRACE_CONTROL_GUID = 4096;
pub const WMIREG_FLAG_EVENT_ONLY_GUID = 64;
pub const WMI_GUIDTYPE_TRACECONTROL = 0;
pub const WMI_GUIDTYPE_TRACE = 1;
pub const WMI_GUIDTYPE_DATA = 2;
pub const WMI_GUIDTYPE_EVENT = 3;
pub const WMIGUID_QUERY = 1;
pub const WMIGUID_SET = 2;
pub const WMIGUID_NOTIFICATION = 4;
pub const WMIGUID_READ_DESCRIPTION = 8;
pub const WMIGUID_EXECUTE = 16;
pub const TRACELOG_CREATE_REALTIME = 32;
pub const TRACELOG_CREATE_ONDISK = 64;
pub const TRACELOG_GUID_ENABLE = 128;
pub const TRACELOG_ACCESS_KERNEL_LOGGER = 256;
pub const TRACELOG_LOG_EVENT = 512;
pub const TRACELOG_CREATE_INPROC = 512;
pub const TRACELOG_ACCESS_REALTIME = 1024;
pub const TRACELOG_REGISTER_GUIDS = 2048;
pub const TRACELOG_JOIN_GROUP = 4096;
pub const WMI_GLOBAL_LOGGER_ID = 1;
pub const MAX_PAYLOAD_PREDICATES = 8;
pub const MAX_MOF_FIELDS = 16;
pub const SYSTEM_EVENT_TYPE = 1;
pub const EVENT_TRACE_TYPE_INFO = 0;
pub const EVENT_TRACE_TYPE_START = 1;
pub const EVENT_TRACE_TYPE_END = 2;
pub const EVENT_TRACE_TYPE_STOP = 2;
pub const EVENT_TRACE_TYPE_DC_START = 3;
pub const EVENT_TRACE_TYPE_DC_END = 4;
pub const EVENT_TRACE_TYPE_EXTENSION = 5;
pub const EVENT_TRACE_TYPE_REPLY = 6;
pub const EVENT_TRACE_TYPE_DEQUEUE = 7;
pub const EVENT_TRACE_TYPE_RESUME = 7;
pub const EVENT_TRACE_TYPE_CHECKPOINT = 8;
pub const EVENT_TRACE_TYPE_SUSPEND = 8;
pub const EVENT_TRACE_TYPE_WINEVT_SEND = 9;
pub const EVENT_TRACE_TYPE_WINEVT_RECEIVE = 240;
pub const TRACE_LEVEL_NONE = 0;
pub const TRACE_LEVEL_CRITICAL = 1;
pub const TRACE_LEVEL_FATAL = 1;
pub const TRACE_LEVEL_ERROR = 2;
pub const TRACE_LEVEL_WARNING = 3;
pub const TRACE_LEVEL_INFORMATION = 4;
pub const TRACE_LEVEL_VERBOSE = 5;
pub const TRACE_LEVEL_RESERVED6 = 6;
pub const TRACE_LEVEL_RESERVED7 = 7;
pub const TRACE_LEVEL_RESERVED8 = 8;
pub const TRACE_LEVEL_RESERVED9 = 9;
pub const EVENT_TRACE_TYPE_LOAD = 10;
pub const EVENT_TRACE_TYPE_TERMINATE = 11;
pub const EVENT_TRACE_TYPE_IO_READ = 10;
pub const EVENT_TRACE_TYPE_IO_WRITE = 11;
pub const EVENT_TRACE_TYPE_IO_READ_INIT = 12;
pub const EVENT_TRACE_TYPE_IO_WRITE_INIT = 13;
pub const EVENT_TRACE_TYPE_IO_FLUSH = 14;
pub const EVENT_TRACE_TYPE_IO_FLUSH_INIT = 15;
pub const EVENT_TRACE_TYPE_IO_REDIRECTED_INIT = 16;
pub const EVENT_TRACE_TYPE_MM_TF = 10;
pub const EVENT_TRACE_TYPE_MM_DZF = 11;
pub const EVENT_TRACE_TYPE_MM_COW = 12;
pub const EVENT_TRACE_TYPE_MM_GPF = 13;
pub const EVENT_TRACE_TYPE_MM_HPF = 14;
pub const EVENT_TRACE_TYPE_MM_AV = 15;
pub const EVENT_TRACE_TYPE_SEND = 10;
pub const EVENT_TRACE_TYPE_RECEIVE = 11;
pub const EVENT_TRACE_TYPE_CONNECT = 12;
pub const EVENT_TRACE_TYPE_DISCONNECT = 13;
pub const EVENT_TRACE_TYPE_RETRANSMIT = 14;
pub const EVENT_TRACE_TYPE_ACCEPT = 15;
pub const EVENT_TRACE_TYPE_RECONNECT = 16;
pub const EVENT_TRACE_TYPE_CONNFAIL = 17;
pub const EVENT_TRACE_TYPE_COPY_TCP = 18;
pub const EVENT_TRACE_TYPE_COPY_ARP = 19;
pub const EVENT_TRACE_TYPE_ACKFULL = 20;
pub const EVENT_TRACE_TYPE_ACKPART = 21;
pub const EVENT_TRACE_TYPE_ACKDUP = 22;
pub const EVENT_TRACE_TYPE_GUIDMAP = 10;
pub const EVENT_TRACE_TYPE_CONFIG = 11;
pub const EVENT_TRACE_TYPE_SIDINFO = 12;
pub const EVENT_TRACE_TYPE_SECURITY = 13;
pub const EVENT_TRACE_TYPE_DBGID_RSDS = 64;
pub const EVENT_TRACE_TYPE_REGCREATE = 10;
pub const EVENT_TRACE_TYPE_REGOPEN = 11;
pub const EVENT_TRACE_TYPE_REGDELETE = 12;
pub const EVENT_TRACE_TYPE_REGQUERY = 13;
pub const EVENT_TRACE_TYPE_REGSETVALUE = 14;
pub const EVENT_TRACE_TYPE_REGDELETEVALUE = 15;
pub const EVENT_TRACE_TYPE_REGQUERYVALUE = 16;
pub const EVENT_TRACE_TYPE_REGENUMERATEKEY = 17;
pub const EVENT_TRACE_TYPE_REGENUMERATEVALUEKEY = 18;
pub const EVENT_TRACE_TYPE_REGQUERYMULTIPLEVALUE = 19;
pub const EVENT_TRACE_TYPE_REGSETINFORMATION = 20;
pub const EVENT_TRACE_TYPE_REGFLUSH = 21;
pub const EVENT_TRACE_TYPE_REGKCBCREATE = 22;
pub const EVENT_TRACE_TYPE_REGKCBDELETE = 23;
pub const EVENT_TRACE_TYPE_REGKCBRUNDOWNBEGIN = 24;
pub const EVENT_TRACE_TYPE_REGKCBRUNDOWNEND = 25;
pub const EVENT_TRACE_TYPE_REGVIRTUALIZE = 26;
pub const EVENT_TRACE_TYPE_REGCLOSE = 27;
pub const EVENT_TRACE_TYPE_REGSETSECURITY = 28;
pub const EVENT_TRACE_TYPE_REGQUERYSECURITY = 29;
pub const EVENT_TRACE_TYPE_REGCOMMIT = 30;
pub const EVENT_TRACE_TYPE_REGPREPARE = 31;
pub const EVENT_TRACE_TYPE_REGROLLBACK = 32;
pub const EVENT_TRACE_TYPE_REGMOUNTHIVE = 33;
pub const EVENT_TRACE_TYPE_CONFIG_CPU = 10;
pub const EVENT_TRACE_TYPE_CONFIG_PHYSICALDISK = 11;
pub const EVENT_TRACE_TYPE_CONFIG_LOGICALDISK = 12;
pub const EVENT_TRACE_TYPE_CONFIG_NIC = 13;
pub const EVENT_TRACE_TYPE_CONFIG_VIDEO = 14;
pub const EVENT_TRACE_TYPE_CONFIG_SERVICES = 15;
pub const EVENT_TRACE_TYPE_CONFIG_POWER = 16;
pub const EVENT_TRACE_TYPE_CONFIG_NETINFO = 17;
pub const EVENT_TRACE_TYPE_CONFIG_OPTICALMEDIA = 18;
pub const EVENT_TRACE_TYPE_CONFIG_PHYSICALDISK_EX = 19;
pub const EVENT_TRACE_TYPE_CONFIG_IRQ = 21;
pub const EVENT_TRACE_TYPE_CONFIG_PNP = 22;
pub const EVENT_TRACE_TYPE_CONFIG_IDECHANNEL = 23;
pub const EVENT_TRACE_TYPE_CONFIG_NUMANODE = 24;
pub const EVENT_TRACE_TYPE_CONFIG_PLATFORM = 25;
pub const EVENT_TRACE_TYPE_CONFIG_PROCESSORGROUP = 26;
pub const EVENT_TRACE_TYPE_CONFIG_PROCESSORNUMBER = 27;
pub const EVENT_TRACE_TYPE_CONFIG_DPI = 28;
pub const EVENT_TRACE_TYPE_CONFIG_CI_INFO = 29;
pub const EVENT_TRACE_TYPE_CONFIG_MACHINEID = 30;
pub const EVENT_TRACE_TYPE_CONFIG_DEFRAG = 31;
pub const EVENT_TRACE_TYPE_CONFIG_MOBILEPLATFORM = 32;
pub const EVENT_TRACE_TYPE_CONFIG_DEVICEFAMILY = 33;
pub const EVENT_TRACE_TYPE_CONFIG_FLIGHTID = 34;
pub const EVENT_TRACE_TYPE_CONFIG_PROCESSOR = 35;
pub const EVENT_TRACE_TYPE_CONFIG_VIRTUALIZATION = 36;
pub const EVENT_TRACE_TYPE_CONFIG_BOOT = 37;
pub const EVENT_TRACE_TYPE_OPTICAL_IO_READ = 55;
pub const EVENT_TRACE_TYPE_OPTICAL_IO_WRITE = 56;
pub const EVENT_TRACE_TYPE_OPTICAL_IO_FLUSH = 57;
pub const EVENT_TRACE_TYPE_OPTICAL_IO_READ_INIT = 58;
pub const EVENT_TRACE_TYPE_OPTICAL_IO_WRITE_INIT = 59;
pub const EVENT_TRACE_TYPE_OPTICAL_IO_FLUSH_INIT = 60;
pub const EVENT_TRACE_TYPE_FLT_PREOP_INIT = 96;
pub const EVENT_TRACE_TYPE_FLT_POSTOP_INIT = 97;
pub const EVENT_TRACE_TYPE_FLT_PREOP_COMPLETION = 98;
pub const EVENT_TRACE_TYPE_FLT_POSTOP_COMPLETION = 99;
pub const EVENT_TRACE_TYPE_FLT_PREOP_FAILURE = 100;
pub const EVENT_TRACE_TYPE_FLT_POSTOP_FAILURE = 101;
pub const EVENT_TRACE_FLAG_DEBUG_EVENTS = 4194304;
pub const EVENT_TRACE_FLAG_EXTENSION = 2147483648;
pub const EVENT_TRACE_FLAG_FORWARD_WMI = 1073741824;
pub const EVENT_TRACE_FLAG_ENABLE_RESERVE = 536870912;
pub const EVENT_TRACE_FILE_MODE_NONE = 0;
pub const EVENT_TRACE_FILE_MODE_SEQUENTIAL = 1;
pub const EVENT_TRACE_FILE_MODE_CIRCULAR = 2;
pub const EVENT_TRACE_FILE_MODE_APPEND = 4;
pub const EVENT_TRACE_REAL_TIME_MODE = 256;
pub const EVENT_TRACE_DELAY_OPEN_FILE_MODE = 512;
pub const EVENT_TRACE_BUFFERING_MODE = 1024;
pub const EVENT_TRACE_PRIVATE_LOGGER_MODE = 2048;
pub const EVENT_TRACE_ADD_HEADER_MODE = 4096;
pub const EVENT_TRACE_USE_GLOBAL_SEQUENCE = 16384;
pub const EVENT_TRACE_USE_LOCAL_SEQUENCE = 32768;
pub const EVENT_TRACE_RELOG_MODE = 65536;
pub const EVENT_TRACE_USE_PAGED_MEMORY = 16777216;
pub const EVENT_TRACE_FILE_MODE_NEWFILE = 8;
pub const EVENT_TRACE_FILE_MODE_PREALLOCATE = 32;
pub const EVENT_TRACE_NONSTOPPABLE_MODE = 64;
pub const EVENT_TRACE_SECURE_MODE = 128;
pub const EVENT_TRACE_USE_KBYTES_FOR_SIZE = 8192;
pub const EVENT_TRACE_PRIVATE_IN_PROC = 131072;
pub const EVENT_TRACE_MODE_RESERVED = 1048576;
pub const EVENT_TRACE_NO_PER_PROCESSOR_BUFFERING = 268435456;
pub const EVENT_TRACE_SYSTEM_LOGGER_MODE = 33554432;
pub const EVENT_TRACE_ADDTO_TRIAGE_DUMP = 2147483648;
pub const EVENT_TRACE_STOP_ON_HYBRID_SHUTDOWN = 4194304;
pub const EVENT_TRACE_PERSIST_ON_HYBRID_SHUTDOWN = 8388608;
pub const EVENT_TRACE_INDEPENDENT_SESSION_MODE = 134217728;
pub const EVENT_TRACE_COMPRESSED_MODE = 67108864;
pub const EVENT_TRACE_CONTROL_INCREMENT_FILE = 4;
pub const EVENT_TRACE_CONTROL_CONVERT_TO_REALTIME = 5;
pub const TRACE_MESSAGE_PERFORMANCE_TIMESTAMP = 16;
pub const TRACE_MESSAGE_POINTER32 = 64;
pub const TRACE_MESSAGE_POINTER64 = 128;
pub const TRACE_MESSAGE_FLAG_MASK = 65535;
pub const EVENT_TRACE_USE_PROCTIME = 1;
pub const EVENT_TRACE_USE_NOCPUTIME = 2;
pub const TRACE_HEADER_FLAG_USE_TIMESTAMP = 512;
pub const TRACE_HEADER_FLAG_TRACED_GUID = 131072;
pub const TRACE_HEADER_FLAG_LOG_WNODE = 262144;
pub const TRACE_HEADER_FLAG_USE_GUID_PTR = 524288;
pub const TRACE_HEADER_FLAG_USE_MOF_PTR = 1048576;
pub const SYSTEM_ALPC_KW_GENERAL = 1;
pub const SYSTEM_CONFIG_KW_SYSTEM = 1;
pub const SYSTEM_CONFIG_KW_GRAPHICS = 2;
pub const SYSTEM_CONFIG_KW_STORAGE = 4;
pub const SYSTEM_CONFIG_KW_NETWORK = 8;
pub const SYSTEM_CONFIG_KW_SERVICES = 16;
pub const SYSTEM_CONFIG_KW_PNP = 32;
pub const SYSTEM_CONFIG_KW_OPTICAL = 64;
pub const SYSTEM_CPU_KW_CONFIG = 1;
pub const SYSTEM_CPU_KW_CACHE_FLUSH = 2;
pub const SYSTEM_CPU_KW_SPEC_CONTROL = 4;
pub const SYSTEM_CPU_KW_DOMAIN_CHANGE = 8;
pub const SYSTEM_HYPERVISOR_KW_PROFILE = 1;
pub const SYSTEM_HYPERVISOR_KW_CALLOUTS = 2;
pub const SYSTEM_HYPERVISOR_KW_VTL_CHANGE = 4;
pub const SYSTEM_INTERRUPT_KW_GENERAL = 1;
pub const SYSTEM_INTERRUPT_KW_CLOCK_INTERRUPT = 2;
pub const SYSTEM_INTERRUPT_KW_DPC = 4;
pub const SYSTEM_INTERRUPT_KW_DPC_QUEUE = 8;
pub const SYSTEM_INTERRUPT_KW_WDF_DPC = 16;
pub const SYSTEM_INTERRUPT_KW_WDF_INTERRUPT = 32;
pub const SYSTEM_INTERRUPT_KW_IPI = 64;
pub const SYSTEM_IO_KW_DISK = 1;
pub const SYSTEM_IO_KW_DISK_INIT = 2;
pub const SYSTEM_IO_KW_FILENAME = 4;
pub const SYSTEM_IO_KW_SPLIT = 8;
pub const SYSTEM_IO_KW_FILE = 16;
pub const SYSTEM_IO_KW_OPTICAL = 32;
pub const SYSTEM_IO_KW_OPTICAL_INIT = 64;
pub const SYSTEM_IO_KW_DRIVERS = 128;
pub const SYSTEM_IO_KW_CC = 256;
pub const SYSTEM_IO_KW_NETWORK = 512;
pub const SYSTEM_IO_KW_FILE_INIT = 1024;
pub const SYSTEM_IO_KW_TIMER = 2048;
pub const SYSTEM_IOFILTER_KW_GENERAL = 1;
pub const SYSTEM_IOFILTER_KW_INIT = 2;
pub const SYSTEM_IOFILTER_KW_FASTIO = 4;
pub const SYSTEM_IOFILTER_KW_FAILURE = 8;
pub const SYSTEM_LOCK_KW_SPINLOCK = 1;
pub const SYSTEM_LOCK_KW_SPINLOCK_COUNTERS = 2;
pub const SYSTEM_LOCK_KW_SYNC_OBJECTS = 4;
pub const SYSTEM_MEMORY_KW_GENERAL = 1;
pub const SYSTEM_MEMORY_KW_HARD_FAULTS = 2;
pub const SYSTEM_MEMORY_KW_ALL_FAULTS = 4;
pub const SYSTEM_MEMORY_KW_POOL = 8;
pub const SYSTEM_MEMORY_KW_MEMINFO = 16;
pub const SYSTEM_MEMORY_KW_PFSECTION = 32;
pub const SYSTEM_MEMORY_KW_MEMINFO_WS = 64;
pub const SYSTEM_MEMORY_KW_HEAP = 128;
pub const SYSTEM_MEMORY_KW_WS = 256;
pub const SYSTEM_MEMORY_KW_CONTMEM_GEN = 512;
pub const SYSTEM_MEMORY_KW_VIRTUAL_ALLOC = 1024;
pub const SYSTEM_MEMORY_KW_FOOTPRINT = 2048;
pub const SYSTEM_MEMORY_KW_SESSION = 4096;
pub const SYSTEM_MEMORY_KW_REFSET = 8192;
pub const SYSTEM_MEMORY_KW_VAMAP = 16384;
pub const SYSTEM_MEMORY_KW_NONTRADEABLE = 32768;
pub const SYSTEM_OBJECT_KW_GENERAL = 1;
pub const SYSTEM_OBJECT_KW_HANDLE = 2;
pub const SYSTEM_POWER_KW_GENERAL = 1;
pub const SYSTEM_POWER_KW_HIBER_RUNDOWN = 2;
pub const SYSTEM_POWER_KW_PROCESSOR_IDLE = 4;
pub const SYSTEM_POWER_KW_IDLE_SELECTION = 8;
pub const SYSTEM_POWER_KW_PPM_EXIT_LATENCY = 16;
pub const SYSTEM_PROCESS_KW_GENERAL = 1;
pub const SYSTEM_PROCESS_KW_INSWAP = 2;
pub const SYSTEM_PROCESS_KW_FREEZE = 4;
pub const SYSTEM_PROCESS_KW_PERF_COUNTER = 8;
pub const SYSTEM_PROCESS_KW_WAKE_COUNTER = 16;
pub const SYSTEM_PROCESS_KW_WAKE_DROP = 32;
pub const SYSTEM_PROCESS_KW_WAKE_EVENT = 64;
pub const SYSTEM_PROCESS_KW_DEBUG_EVENTS = 128;
pub const SYSTEM_PROCESS_KW_DBGPRINT = 256;
pub const SYSTEM_PROCESS_KW_JOB = 512;
pub const SYSTEM_PROCESS_KW_WORKER_THREAD = 1024;
pub const SYSTEM_PROCESS_KW_THREAD = 2048;
pub const SYSTEM_PROCESS_KW_LOADER = 4096;
pub const SYSTEM_PROFILE_KW_GENERAL = 1;
pub const SYSTEM_PROFILE_KW_PMC_PROFILE = 2;
pub const SYSTEM_REGISTRY_KW_GENERAL = 1;
pub const SYSTEM_REGISTRY_KW_HIVE = 2;
pub const SYSTEM_REGISTRY_KW_NOTIFICATION = 4;
pub const SYSTEM_SCHEDULER_KW_XSCHEDULER = 1;
pub const SYSTEM_SCHEDULER_KW_DISPATCHER = 2;
pub const SYSTEM_SCHEDULER_KW_KERNEL_QUEUE = 4;
pub const SYSTEM_SCHEDULER_KW_SHOULD_YIELD = 8;
pub const SYSTEM_SCHEDULER_KW_ANTI_STARVATION = 16;
pub const SYSTEM_SCHEDULER_KW_LOAD_BALANCER = 32;
pub const SYSTEM_SCHEDULER_KW_AFFINITY = 64;
pub const SYSTEM_SCHEDULER_KW_PRIORITY = 128;
pub const SYSTEM_SCHEDULER_KW_IDEAL_PROCESSOR = 256;
pub const SYSTEM_SCHEDULER_KW_CONTEXT_SWITCH = 512;
pub const SYSTEM_SCHEDULER_KW_COMPACT_CSWITCH = 1024;
pub const SYSTEM_SCHEDULER_KW_SCHEDULE_THREAD = 2048;
pub const SYSTEM_SCHEDULER_KW_READY_QUEUE = 4096;
pub const SYSTEM_SCHEDULER_KW_CPU_PARTITION = 8192;
pub const SYSTEM_SCHEDULER_KW_THREAD_FEEDBACK_READ = 16384;
pub const SYSTEM_SCHEDULER_KW_WORKLOAD_CLASS_UPDATE = 32768;
pub const SYSTEM_SCHEDULER_KW_AUTOBOOST = 65536;
pub const SYSTEM_SYSCALL_KW_GENERAL = 1;
pub const SYSTEM_TIMER_KW_GENERAL = 1;
pub const SYSTEM_TIMER_KW_CLOCK_TIMER = 2;
pub const SYSTEM_MEMORY_POOL_FILTER_ID = 1;
pub const _typedef_TRACELOGGER_HANDLE = 1;
pub const ETW_NULL_TYPE_VALUE = 0;
pub const ETW_OBJECT_TYPE_VALUE = 1;
pub const ETW_STRING_TYPE_VALUE = 2;
pub const ETW_SBYTE_TYPE_VALUE = 3;
pub const ETW_BYTE_TYPE_VALUE = 4;
pub const ETW_INT16_TYPE_VALUE = 5;
pub const ETW_UINT16_TYPE_VALUE = 6;
pub const ETW_INT32_TYPE_VALUE = 7;
pub const ETW_UINT32_TYPE_VALUE = 8;
pub const ETW_INT64_TYPE_VALUE = 9;
pub const ETW_UINT64_TYPE_VALUE = 10;
pub const ETW_CHAR_TYPE_VALUE = 11;
pub const ETW_SINGLE_TYPE_VALUE = 12;
pub const ETW_DOUBLE_TYPE_VALUE = 13;
pub const ETW_BOOLEAN_TYPE_VALUE = 14;
pub const ETW_DECIMAL_TYPE_VALUE = 15;
pub const ETW_GUID_TYPE_VALUE = 101;
pub const ETW_ASCIICHAR_TYPE_VALUE = 102;
pub const ETW_ASCIISTRING_TYPE_VALUE = 103;
pub const ETW_COUNTED_STRING_TYPE_VALUE = 104;
pub const ETW_POINTER_TYPE_VALUE = 105;
pub const ETW_SIZET_TYPE_VALUE = 106;
pub const ETW_HIDDEN_TYPE_VALUE = 107;
pub const ETW_BOOL_TYPE_VALUE = 108;
pub const ETW_COUNTED_ANSISTRING_TYPE_VALUE = 109;
pub const ETW_REVERSED_COUNTED_STRING_TYPE_VALUE = 110;
pub const ETW_REVERSED_COUNTED_ANSISTRING_TYPE_VALUE = 111;
pub const ETW_NON_NULL_TERMINATED_STRING_TYPE_VALUE = 112;
pub const ETW_REDUCED_ANSISTRING_TYPE_VALUE = 113;
pub const ETW_REDUCED_STRING_TYPE_VALUE = 114;
pub const ETW_SID_TYPE_VALUE = 115;
pub const ETW_VARIANT_TYPE_VALUE = 116;
pub const ETW_PTVECTOR_TYPE_VALUE = 117;
pub const ETW_WMITIME_TYPE_VALUE = 118;
pub const ETW_DATETIME_TYPE_VALUE = 119;
pub const ETW_REFRENCE_TYPE_VALUE = 120;
pub const TRACE_PROVIDER_FLAG_LEGACY = 1;
pub const TRACE_PROVIDER_FLAG_PRE_ENABLE = 2;
pub const TRACE_LBR_EVENT_OPCODE = 32;
pub const TRACE_LBR_MAXIMUM_EVENTS = 4;
pub const ENABLE_TRACE_PARAMETERS_VERSION = 1;
pub const ENABLE_TRACE_PARAMETERS_VERSION_2 = 2;
pub const EVENT_MIN_LEVEL = 0;
pub const EVENT_MAX_LEVEL = 255;
pub const EVENT_ACTIVITY_CTRL_GET_ID = 1;
pub const EVENT_ACTIVITY_CTRL_SET_ID = 2;
pub const EVENT_ACTIVITY_CTRL_CREATE_ID = 3;
pub const EVENT_ACTIVITY_CTRL_GET_SET_ID = 4;
pub const EVENT_ACTIVITY_CTRL_CREATE_SET_ID = 5;
pub const MAX_EVENT_DATA_DESCRIPTORS = 128;
pub const MAX_EVENT_FILTER_DATA_SIZE = 1024;
pub const MAX_EVENT_FILTER_PAYLOAD_SIZE = 4096;
pub const MAX_EVENT_FILTER_EVENT_NAME_SIZE = 4096;
pub const MAX_EVENT_FILTERS_COUNT = 13;
pub const MAX_EVENT_FILTER_PID_COUNT = 8;
pub const MAX_EVENT_FILTER_EVENT_ID_COUNT = 64;
pub const EVENT_FILTER_TYPE_NONE = 0;
pub const EVENT_FILTER_TYPE_SCHEMATIZED = 2147483648;
pub const EVENT_FILTER_TYPE_SYSTEM_FLAGS = 2147483649;
pub const EVENT_FILTER_TYPE_TRACEHANDLE = 2147483650;
pub const EVENT_FILTER_TYPE_PID = 2147483652;
pub const EVENT_FILTER_TYPE_EXECUTABLE_NAME = 2147483656;
pub const EVENT_FILTER_TYPE_PACKAGE_ID = 2147483664;
pub const EVENT_FILTER_TYPE_PACKAGE_APP_ID = 2147483680;
pub const EVENT_FILTER_TYPE_PAYLOAD = 2147483904;
pub const EVENT_FILTER_TYPE_EVENT_ID = 2147484160;
pub const EVENT_FILTER_TYPE_EVENT_NAME = 2147484672;
pub const EVENT_FILTER_TYPE_STACKWALK = 2147487744;
pub const EVENT_FILTER_TYPE_STACKWALK_NAME = 2147491840;
pub const EVENT_FILTER_TYPE_STACKWALK_LEVEL_KW = 2147500032;
pub const EVENT_FILTER_TYPE_CONTAINER = 2147516416;
pub const EVENT_DATA_DESCRIPTOR_TYPE_NONE = 0;
pub const EVENT_DATA_DESCRIPTOR_TYPE_EVENT_METADATA = 1;
pub const EVENT_DATA_DESCRIPTOR_TYPE_PROVIDER_METADATA = 2;
pub const EVENT_DATA_DESCRIPTOR_TYPE_TIMESTAMP_OVERRIDE = 3;
pub const EVENT_WRITE_FLAG_NO_FAULTING = 1;
pub const EVENT_WRITE_FLAG_INPRIVATE = 2;
pub const EVENT_HEADER_EXT_TYPE_RELATED_ACTIVITYID = 1;
pub const EVENT_HEADER_EXT_TYPE_SID = 2;
pub const EVENT_HEADER_EXT_TYPE_TS_ID = 3;
pub const EVENT_HEADER_EXT_TYPE_INSTANCE_INFO = 4;
pub const EVENT_HEADER_EXT_TYPE_STACK_TRACE32 = 5;
pub const EVENT_HEADER_EXT_TYPE_STACK_TRACE64 = 6;
pub const EVENT_HEADER_EXT_TYPE_PEBS_INDEX = 7;
pub const EVENT_HEADER_EXT_TYPE_PMC_COUNTERS = 8;
pub const EVENT_HEADER_EXT_TYPE_PSM_KEY = 9;
pub const EVENT_HEADER_EXT_TYPE_EVENT_KEY = 10;
pub const EVENT_HEADER_EXT_TYPE_EVENT_SCHEMA_TL = 11;
pub const EVENT_HEADER_EXT_TYPE_PROV_TRAITS = 12;
pub const EVENT_HEADER_EXT_TYPE_PROCESS_START_KEY = 13;
pub const EVENT_HEADER_EXT_TYPE_CONTROL_GUID = 14;
pub const EVENT_HEADER_EXT_TYPE_QPC_DELTA = 15;
pub const EVENT_HEADER_EXT_TYPE_CONTAINER_ID = 16;
pub const EVENT_HEADER_EXT_TYPE_STACK_KEY32 = 17;
pub const EVENT_HEADER_EXT_TYPE_STACK_KEY64 = 18;
pub const EVENT_HEADER_EXT_TYPE_MAX = 19;
pub const EVENT_HEADER_PROPERTY_XML = 1;
pub const EVENT_HEADER_PROPERTY_FORWARDED_XML = 2;
pub const EVENT_HEADER_PROPERTY_LEGACY_EVENTLOG = 4;
pub const EVENT_HEADER_PROPERTY_RELOGGABLE = 8;
pub const EVENT_HEADER_FLAG_EXTENDED_INFO = 1;
pub const EVENT_HEADER_FLAG_PRIVATE_SESSION = 2;
pub const EVENT_HEADER_FLAG_STRING_ONLY = 4;
pub const EVENT_HEADER_FLAG_TRACE_MESSAGE = 8;
pub const EVENT_HEADER_FLAG_NO_CPUTIME = 16;
pub const EVENT_HEADER_FLAG_32_BIT_HEADER = 32;
pub const EVENT_HEADER_FLAG_64_BIT_HEADER = 64;
pub const EVENT_HEADER_FLAG_DECODE_GUID = 128;
pub const EVENT_HEADER_FLAG_CLASSIC_HEADER = 256;
pub const EVENT_HEADER_FLAG_PROCESSOR_INDEX = 512;
pub const EVENT_ENABLE_PROPERTY_SID = 1;
pub const EVENT_ENABLE_PROPERTY_TS_ID = 2;
pub const EVENT_ENABLE_PROPERTY_STACK_TRACE = 4;
pub const EVENT_ENABLE_PROPERTY_PSM_KEY = 8;
pub const EVENT_ENABLE_PROPERTY_IGNORE_KEYWORD_0 = 16;
pub const EVENT_ENABLE_PROPERTY_PROVIDER_GROUP = 32;
pub const EVENT_ENABLE_PROPERTY_ENABLE_KEYWORD_0 = 64;
pub const EVENT_ENABLE_PROPERTY_PROCESS_START_KEY = 128;
pub const EVENT_ENABLE_PROPERTY_EVENT_KEY = 256;
pub const EVENT_ENABLE_PROPERTY_EXCLUDE_INPRIVATE = 512;
pub const EVENT_ENABLE_PROPERTY_ENABLE_SILOS = 1024;
pub const EVENT_ENABLE_PROPERTY_SOURCE_CONTAINER_TRACKING = 2048;
pub const PROCESS_TRACE_MODE_REAL_TIME = 256;
pub const PROCESS_TRACE_MODE_RAW_TIMESTAMP = 4096;
pub const PROCESS_TRACE_MODE_EVENT_RECORD = 268435456;
pub const TRACE_MESSAGE_COMPONENTID = 4;
pub const TRACE_MESSAGE_GUID = 2;
pub const TRACE_MESSAGE_SEQUENCE = 1;
pub const TRACE_MESSAGE_SYSTEMINFO = 32;
pub const TRACE_MESSAGE_TIMESTAMP = 8;
pub const EVENT_CONTROL_CODE_DISABLE_PROVIDER = 0;
pub const EVENT_CONTROL_CODE_ENABLE_PROVIDER = 1;
pub const EVENT_CONTROL_CODE_CAPTURE_STATE = 2;
pub const EVENT_TRACE_CONTROL_FLUSH = 3;
pub const EVENT_TRACE_CONTROL_QUERY = 0;
pub const EVENT_TRACE_CONTROL_STOP = 1;
pub const EVENT_TRACE_CONTROL_UPDATE = 2;
pub const EVENT_TRACE_FLAG_ALPC = 1048576;
pub const EVENT_TRACE_FLAG_CSWITCH = 16;
pub const EVENT_TRACE_FLAG_DBGPRINT = 262144;
pub const EVENT_TRACE_FLAG_DISK_FILE_IO = 512;
pub const EVENT_TRACE_FLAG_DISK_IO = 256;
pub const EVENT_TRACE_FLAG_DISK_IO_INIT = 1024;
pub const EVENT_TRACE_FLAG_DISPATCHER = 2048;
pub const EVENT_TRACE_FLAG_DPC = 32;
pub const EVENT_TRACE_FLAG_DRIVER = 8388608;
pub const EVENT_TRACE_FLAG_FILE_IO = 33554432;
pub const EVENT_TRACE_FLAG_FILE_IO_INIT = 67108864;
pub const EVENT_TRACE_FLAG_IMAGE_LOAD = 4;
pub const EVENT_TRACE_FLAG_INTERRUPT = 64;
pub const EVENT_TRACE_FLAG_JOB = 524288;
pub const EVENT_TRACE_FLAG_MEMORY_HARD_FAULTS = 8192;
pub const EVENT_TRACE_FLAG_MEMORY_PAGE_FAULTS = 4096;
pub const EVENT_TRACE_FLAG_NETWORK_TCPIP = 65536;
pub const EVENT_TRACE_FLAG_NO_SYSCONFIG = 268435456;
pub const EVENT_TRACE_FLAG_PROCESS = 1;
pub const EVENT_TRACE_FLAG_PROCESS_COUNTERS = 8;
pub const EVENT_TRACE_FLAG_PROFILE = 16777216;
pub const EVENT_TRACE_FLAG_REGISTRY = 131072;
pub const EVENT_TRACE_FLAG_SPLIT_IO = 2097152;
pub const EVENT_TRACE_FLAG_SYSTEMCALL = 128;
pub const EVENT_TRACE_FLAG_THREAD = 2;
pub const EVENT_TRACE_FLAG_VAMAP = 32768;
pub const EVENT_TRACE_FLAG_VIRTUAL_ALLOC = 16384;
pub const WMI_GET_ALL_DATA = 0;
pub const WMI_GET_SINGLE_INSTANCE = 1;
pub const WMI_SET_SINGLE_INSTANCE = 2;
pub const WMI_SET_SINGLE_ITEM = 3;
pub const WMI_ENABLE_EVENTS = 4;
pub const WMI_DISABLE_EVENTS = 5;
pub const WMI_ENABLE_COLLECTION = 6;
pub const WMI_DISABLE_COLLECTION = 7;
pub const WMI_REGINFO = 8;
pub const WMI_EXECUTE_METHOD = 9;
pub const WMI_CAPTURE_STATE = 10;
pub const EtwCompressionModeRestart = 0;
pub const EtwCompressionModeNoDisable = 1;
pub const EtwCompressionModeNoRestart = 2;
pub const EtwPmcOwnerFree = 0;
pub const EtwPmcOwnerUntagged = 1;
pub const EtwPmcOwnerTagged = 2;
pub const EtwPmcOwnerTaggedWithSource = 3;
pub const EtwContextRegisterTypeNone = 0;
pub const EtwContextRegisterTypeControl = 1;
pub const EtwContextRegisterTypeInteger = 2;
pub const TRACE_LBR_CONFIGURATION_NONE = 0;
pub const TRACE_LBR_CONFIGURATION_EXCLUDE_KERNEL = 1;
pub const TRACE_LBR_CONFIGURATION_EXCLUDE_USER = 2;
pub const TRACE_LBR_CONFIGURATION_EXCLUDE_JCC = 4;
pub const TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_REL_CALL = 8;
pub const TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_IND_CALL = 16;
pub const TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_RET = 32;
pub const TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_IND_JMP = 64;
pub const TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_REL_JMP = 128;
pub const TRACE_LBR_CONFIGURATION_EXCLUDE_FAR_BRANCH = 256;
pub const TRACE_LBR_CONFIGURATION_CALLSTACK_ENABLE = 512;
pub const TRACE_LBR_CONFIGURATION_SAMPLED = 1024;
pub const ETW_PROCESS_TRACE_MODE_NONE = 0;
pub const ETW_PROCESS_TRACE_MODE_RAW_TIMESTAMP = 1;
pub const TraceGuidQueryList = 0;
pub const TraceGuidQueryInfo = 1;
pub const TraceGuidQueryProcess = 2;
pub const TraceStackTracingInfo = 3;
pub const TraceSystemTraceEnableFlagsInfo = 4;
pub const TraceSampledProfileIntervalInfo = 5;
pub const TraceProfileSourceConfigInfo = 6;
pub const TraceProfileSourceListInfo = 7;
pub const TracePmcEventListInfo = 8;
pub const TracePmcCounterListInfo = 9;
pub const TraceSetDisallowList = 10;
pub const TraceVersionInfo = 11;
pub const TraceGroupQueryList = 12;
pub const TraceGroupQueryInfo = 13;
pub const TraceDisallowListQuery = 14;
pub const TraceInfoReserved15 = 15;
pub const TracePeriodicCaptureStateListInfo = 16;
pub const TracePeriodicCaptureStateInfo = 17;
pub const TraceProviderBinaryTracking = 18;
pub const TraceMaxLoggersQuery = 19;
pub const TraceLbrConfigurationInfo = 20;
pub const TraceLbrEventListInfo = 21;
pub const TraceMaxPmcCounterQuery = 22;
pub const TraceStreamCount = 23;
pub const TraceStackCachingInfo = 24;
pub const TracePmcCounterOwners = 25;
pub const TraceUnifiedStackCachingInfo = 26;
pub const TracePmcSessionInformation = 27;
pub const TraceContextRegisterInfo = 28;
pub const MaxTraceSetInfoClass = 29;
pub const EtwQueryPartitionInformation = 1;
pub const EtwQueryPartitionInformationV2 = 2;
pub const EtwQueryLastDroppedTimes = 3;
pub const EtwQueryLogFileHeader = 4;
pub const EtwQueryProcessHandleInfoMax = 5;
pub const EventProviderBinaryTrackInfo = 0;
pub const EventProviderSetReserved1 = 1;
pub const EventProviderSetTraits = 2;
pub const EventProviderUseDescriptorType = 3;
pub const MaxEventInfo = 4;
pub const EtwProviderTraitTypeGroup = 1;
pub const EtwProviderTraitDecodeGuid = 2;
pub const EtwProviderTraitTypeMax = 3;
pub const EventSecuritySetDACL = 0;
pub const EventSecuritySetSACL = 1;
pub const EventSecurityAddDACL = 2;
pub const EventSecurityAddSACL = 3;
pub const EventSecurityMax = 4;
pub const EVENTMAP_INFO_FLAG_MANIFEST_VALUEMAP = 1;
pub const EVENTMAP_INFO_FLAG_MANIFEST_BITMAP = 2;
pub const EVENTMAP_INFO_FLAG_MANIFEST_PATTERNMAP = 4;
pub const EVENTMAP_INFO_FLAG_WBEM_VALUEMAP = 8;
pub const EVENTMAP_INFO_FLAG_WBEM_BITMAP = 16;
pub const EVENTMAP_INFO_FLAG_WBEM_FLAG = 32;
pub const EVENTMAP_INFO_FLAG_WBEM_NO_MAP = 64;
pub const EVENTMAP_ENTRY_VALUETYPE_ULONG = 0;
pub const EVENTMAP_ENTRY_VALUETYPE_STRING = 1;
pub const TDH_INTYPE_NULL = 0;
pub const TDH_INTYPE_UNICODESTRING = 1;
pub const TDH_INTYPE_ANSISTRING = 2;
pub const TDH_INTYPE_INT8 = 3;
pub const TDH_INTYPE_UINT8 = 4;
pub const TDH_INTYPE_INT16 = 5;
pub const TDH_INTYPE_UINT16 = 6;
pub const TDH_INTYPE_INT32 = 7;
pub const TDH_INTYPE_UINT32 = 8;
pub const TDH_INTYPE_INT64 = 9;
pub const TDH_INTYPE_UINT64 = 10;
pub const TDH_INTYPE_FLOAT = 11;
pub const TDH_INTYPE_DOUBLE = 12;
pub const TDH_INTYPE_BOOLEAN = 13;
pub const TDH_INTYPE_BINARY = 14;
pub const TDH_INTYPE_GUID = 15;
pub const TDH_INTYPE_POINTER = 16;
pub const TDH_INTYPE_FILETIME = 17;
pub const TDH_INTYPE_SYSTEMTIME = 18;
pub const TDH_INTYPE_SID = 19;
pub const TDH_INTYPE_HEXINT32 = 20;
pub const TDH_INTYPE_HEXINT64 = 21;
pub const TDH_INTYPE_MANIFEST_COUNTEDSTRING = 22;
pub const TDH_INTYPE_MANIFEST_COUNTEDANSISTRING = 23;
pub const TDH_INTYPE_RESERVED24 = 24;
pub const TDH_INTYPE_MANIFEST_COUNTEDBINARY = 25;
pub const TDH_INTYPE_COUNTEDSTRING = 300;
pub const TDH_INTYPE_COUNTEDANSISTRING = 301;
pub const TDH_INTYPE_REVERSEDCOUNTEDSTRING = 302;
pub const TDH_INTYPE_REVERSEDCOUNTEDANSISTRING = 303;
pub const TDH_INTYPE_NONNULLTERMINATEDSTRING = 304;
pub const TDH_INTYPE_NONNULLTERMINATEDANSISTRING = 305;
pub const TDH_INTYPE_UNICODECHAR = 306;
pub const TDH_INTYPE_ANSICHAR = 307;
pub const TDH_INTYPE_SIZET = 308;
pub const TDH_INTYPE_HEXDUMP = 309;
pub const TDH_INTYPE_WBEMSID = 310;
pub const TDH_OUTTYPE_NULL = 0;
pub const TDH_OUTTYPE_STRING = 1;
pub const TDH_OUTTYPE_DATETIME = 2;
pub const TDH_OUTTYPE_BYTE = 3;
pub const TDH_OUTTYPE_UNSIGNEDBYTE = 4;
pub const TDH_OUTTYPE_SHORT = 5;
pub const TDH_OUTTYPE_UNSIGNEDSHORT = 6;
pub const TDH_OUTTYPE_INT = 7;
pub const TDH_OUTTYPE_UNSIGNEDINT = 8;
pub const TDH_OUTTYPE_LONG = 9;
pub const TDH_OUTTYPE_UNSIGNEDLONG = 10;
pub const TDH_OUTTYPE_FLOAT = 11;
pub const TDH_OUTTYPE_DOUBLE = 12;
pub const TDH_OUTTYPE_BOOLEAN = 13;
pub const TDH_OUTTYPE_GUID = 14;
pub const TDH_OUTTYPE_HEXBINARY = 15;
pub const TDH_OUTTYPE_HEXINT8 = 16;
pub const TDH_OUTTYPE_HEXINT16 = 17;
pub const TDH_OUTTYPE_HEXINT32 = 18;
pub const TDH_OUTTYPE_HEXINT64 = 19;
pub const TDH_OUTTYPE_PID = 20;
pub const TDH_OUTTYPE_TID = 21;
pub const TDH_OUTTYPE_PORT = 22;
pub const TDH_OUTTYPE_IPV4 = 23;
pub const TDH_OUTTYPE_IPV6 = 24;
pub const TDH_OUTTYPE_SOCKETADDRESS = 25;
pub const TDH_OUTTYPE_CIMDATETIME = 26;
pub const TDH_OUTTYPE_ETWTIME = 27;
pub const TDH_OUTTYPE_XML = 28;
pub const TDH_OUTTYPE_ERRORCODE = 29;
pub const TDH_OUTTYPE_WIN32ERROR = 30;
pub const TDH_OUTTYPE_NTSTATUS = 31;
pub const TDH_OUTTYPE_HRESULT = 32;
pub const TDH_OUTTYPE_CULTURE_INSENSITIVE_DATETIME = 33;
pub const TDH_OUTTYPE_JSON = 34;
pub const TDH_OUTTYPE_UTF8 = 35;
pub const TDH_OUTTYPE_PKCS7_WITH_TYPE_INFO = 36;
pub const TDH_OUTTYPE_CODE_POINTER = 37;
pub const TDH_OUTTYPE_DATETIME_UTC = 38;
pub const TDH_OUTTYPE_REDUCEDSTRING = 300;
pub const TDH_OUTTYPE_NOPRINT = 301;
pub const PropertyStruct = 1;
pub const PropertyParamLength = 2;
pub const PropertyParamCount = 4;
pub const PropertyWBEMXmlFragment = 8;
pub const PropertyParamFixedLength = 16;
pub const PropertyParamFixedCount = 32;
pub const PropertyHasTags = 64;
pub const PropertyHasCustomSchema = 128;
pub const DecodingSourceXMLFile = 0;
pub const DecodingSourceWbem = 1;
pub const DecodingSourceWPP = 2;
pub const DecodingSourceTlg = 3;
pub const DecodingSourceMax = 4;
pub const TEMPLATE_EVENT_DATA = 1;
pub const TEMPLATE_USER_DATA = 2;
pub const TEMPLATE_CONTROL_GUID = 4;
pub const PAYLOADFIELD_EQ = 0;
pub const PAYLOADFIELD_NE = 1;
pub const PAYLOADFIELD_LE = 2;
pub const PAYLOADFIELD_GT = 3;
pub const PAYLOADFIELD_LT = 4;
pub const PAYLOADFIELD_GE = 5;
pub const PAYLOADFIELD_BETWEEN = 6;
pub const PAYLOADFIELD_NOTBETWEEN = 7;
pub const PAYLOADFIELD_MODULO = 8;
pub const PAYLOADFIELD_CONTAINS = 20;
pub const PAYLOADFIELD_DOESNTCONTAIN = 21;
pub const PAYLOADFIELD_IS = 30;
pub const PAYLOADFIELD_ISNOT = 31;
pub const PAYLOADFIELD_INVALID = 32;
pub const EventKeywordInformation = 0;
pub const EventLevelInformation = 1;
pub const EventChannelInformation = 2;
pub const EventTaskInformation = 3;
pub const EventOpcodeInformation = 4;
pub const EventInformationMax = 5;
pub const TDH_CONTEXT_WPP_TMFFILE = 0;
pub const TDH_CONTEXT_WPP_TMFSEARCHPATH = 1;
pub const TDH_CONTEXT_WPP_GMT = 2;
pub const TDH_CONTEXT_POINTERSIZE = 3;
pub const TDH_CONTEXT_PDB_PATH = 4;
pub const TDH_CONTEXT_MAXIMUM = 5;

pub const aliases = struct {
    pub const TRACE_MESSAGE_FLAGS = u32;
    pub const ENABLECALLBACK_ENABLED_STATE = u32;
    pub const EVENT_TRACE_CONTROL = u32;
    pub const EVENT_TRACE_FLAG = u32;
    pub const WMIDPREQUESTCODE = i32;
    pub const ETW_COMPRESSION_RESUMPTION_MODE = i32;
    pub const ETW_PMC_COUNTER_OWNER_TYPE = i32;
    pub const ETW_CONTEXT_REGISTER_TYPES = i32;
    pub const TRACE_LBR_CONFIGURATION = i32;
    pub const ETW_PROCESS_TRACE_MODES = i32;
    pub const TRACE_QUERY_INFO_CLASS = i32;
    pub const ETW_PROCESS_HANDLE_INFO_TYPE = i32;
    pub const EVENT_INFO_CLASS = i32;
    pub const ETW_PROVIDER_TRAIT_TYPE = i32;
    pub const EVENTSECURITYOPERATION = i32;
    pub const MAP_FLAGS = i32;
    pub const MAP_VALUETYPE = i32;
    pub const _TDH_IN_TYPE = i32;
    pub const _TDH_OUT_TYPE = i32;
    pub const PROPERTY_FLAGS = i32;
    pub const DECODING_SOURCE = i32;
    pub const TEMPLATE_FLAGS = i32;
    pub const PAYLOAD_OPERATOR = i32;
    pub const EVENT_FIELD_TYPE = i32;
    pub const TDH_CONTEXT_TYPE = i32;
    pub const TDH_HANDLE = isize;
    pub const PROCESSTRACE_HANDLE = u64;
    pub const REGHANDLE = i64;
    pub const CONTROLTRACE_HANDLE = u64;
    pub const RELOGSTREAM_HANDLE = u64;
};
