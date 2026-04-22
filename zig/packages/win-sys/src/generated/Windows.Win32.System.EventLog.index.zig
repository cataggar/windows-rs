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
    .{ "EvtOpenSession", MethodRecord{ .library = "wevtapi", .import = "EvtOpenSession", .signature = "\x00\x04\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\x99\x0f\x01\x09\x09" } },
    .{ "EvtClose", MethodRecord{ .library = "wevtapi", .import = "EvtClose", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x41\x95" } },
    .{ "EvtCancel", MethodRecord{ .library = "wevtapi", .import = "EvtCancel", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x41\x95" } },
    .{ "EvtGetExtendedStatus", MethodRecord{ .library = "wevtapi", .import = "EvtGetExtendedStatus", .signature = "\x00\x03\x09\x09\x11\x05\x0f\x09" } },
    .{ "EvtQuery", MethodRecord{ .library = "wevtapi", .import = "EvtQuery", .signature = "\x00\x04\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\x95\x11\x05\x11\x05\x09" } },
    .{ "EvtNext", MethodRecord{ .library = "wevtapi", .import = "EvtNext", .signature = "\x00\x06\x11\x59\x11\xc0\x00\x41\x95\x09\x0f\x18\x09\x09\x0f\x09" } },
    .{ "EvtSeek", MethodRecord{ .library = "wevtapi", .import = "EvtSeek", .signature = "\x00\x05\x11\x59\x11\xc0\x00\x41\x95\x0a\x11\xc0\x00\x41\x95\x09\x09" } },
    .{ "EvtSubscribe", MethodRecord{ .library = "wevtapi", .import = "EvtSubscribe", .signature = "\x00\x08\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\x95\x11\x80\x85\x11\x05\x11\x05\x11\xc0\x00\x41\x95\x0f\x01\x12\xc0\x00\x41\x9d\x09" } },
    .{ "EvtCreateRenderContext", MethodRecord{ .library = "wevtapi", .import = "EvtCreateRenderContext", .signature = "\x00\x03\x11\xc0\x00\x41\x95\x09\x0f\x11\x05\x09" } },
    .{ "EvtRender", MethodRecord{ .library = "wevtapi", .import = "EvtRender", .signature = "\x00\x07\x11\x59\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\x95\x09\x09\x0f\x01\x0f\x09\x0f\x09" } },
    .{ "EvtFormatMessage", MethodRecord{ .library = "wevtapi", .import = "EvtFormatMessage", .signature = "\x00\x09\x11\x59\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\x95\x09\x09\x0f\x11\xc0\x00\x41\xa1\x09\x09\x11\x05\x0f\x09" } },
    .{ "EvtOpenLog", MethodRecord{ .library = "wevtapi", .import = "EvtOpenLog", .signature = "\x00\x03\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\x95\x11\x05\x09" } },
    .{ "EvtGetLogInfo", MethodRecord{ .library = "wevtapi", .import = "EvtGetLogInfo", .signature = "\x00\x05\x11\x59\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\xa5\x09\x0f\x11\xc0\x00\x41\xa1\x0f\x09" } },
    .{ "EvtClearLog", MethodRecord{ .library = "wevtapi", .import = "EvtClearLog", .signature = "\x00\x04\x11\x59\x11\xc0\x00\x41\x95\x11\x05\x11\x05\x09" } },
    .{ "EvtExportLog", MethodRecord{ .library = "wevtapi", .import = "EvtExportLog", .signature = "\x00\x05\x11\x59\x11\xc0\x00\x41\x95\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "EvtArchiveExportedLog", MethodRecord{ .library = "wevtapi", .import = "EvtArchiveExportedLog", .signature = "\x00\x04\x11\x59\x11\xc0\x00\x41\x95\x11\x05\x09\x09" } },
    .{ "EvtOpenChannelEnum", MethodRecord{ .library = "wevtapi", .import = "EvtOpenChannelEnum", .signature = "\x00\x02\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\x95\x09" } },
    .{ "EvtNextChannelPath", MethodRecord{ .library = "wevtapi", .import = "EvtNextChannelPath", .signature = "\x00\x04\x11\x59\x11\xc0\x00\x41\x95\x09\x11\x05\x0f\x09" } },
    .{ "EvtOpenChannelConfig", MethodRecord{ .library = "wevtapi", .import = "EvtOpenChannelConfig", .signature = "\x00\x03\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\x95\x11\x05\x09" } },
    .{ "EvtSaveChannelConfig", MethodRecord{ .library = "wevtapi", .import = "EvtSaveChannelConfig", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x41\x95\x09" } },
    .{ "EvtSetChannelConfigProperty", MethodRecord{ .library = "wevtapi", .import = "EvtSetChannelConfigProperty", .signature = "\x00\x04\x11\x59\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\xa9\x09\x0f\x11\xc0\x00\x41\xa1" } },
    .{ "EvtGetChannelConfigProperty", MethodRecord{ .library = "wevtapi", .import = "EvtGetChannelConfigProperty", .signature = "\x00\x06\x11\x59\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\xa9\x09\x09\x0f\x11\xc0\x00\x41\xa1\x0f\x09" } },
    .{ "EvtOpenPublisherEnum", MethodRecord{ .library = "wevtapi", .import = "EvtOpenPublisherEnum", .signature = "\x00\x02\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\x95\x09" } },
    .{ "EvtNextPublisherId", MethodRecord{ .library = "wevtapi", .import = "EvtNextPublisherId", .signature = "\x00\x04\x11\x59\x11\xc0\x00\x41\x95\x09\x11\x05\x0f\x09" } },
    .{ "EvtOpenPublisherMetadata", MethodRecord{ .library = "wevtapi", .import = "EvtOpenPublisherMetadata", .signature = "\x00\x05\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\x95\x11\x05\x11\x05\x09\x09" } },
    .{ "EvtGetPublisherMetadataProperty", MethodRecord{ .library = "wevtapi", .import = "EvtGetPublisherMetadataProperty", .signature = "\x00\x06\x11\x59\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\xad\x09\x09\x0f\x11\xc0\x00\x41\xa1\x0f\x09" } },
    .{ "EvtOpenEventMetadataEnum", MethodRecord{ .library = "wevtapi", .import = "EvtOpenEventMetadataEnum", .signature = "\x00\x02\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\x95\x09" } },
    .{ "EvtNextEventMetadata", MethodRecord{ .library = "wevtapi", .import = "EvtNextEventMetadata", .signature = "\x00\x02\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\x95\x09" } },
    .{ "EvtGetEventMetadataProperty", MethodRecord{ .library = "wevtapi", .import = "EvtGetEventMetadataProperty", .signature = "\x00\x06\x11\x59\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\xb1\x09\x09\x0f\x11\xc0\x00\x41\xa1\x0f\x09" } },
    .{ "EvtGetObjectArraySize", MethodRecord{ .library = "wevtapi", .import = "EvtGetObjectArraySize", .signature = "\x00\x02\x11\x59\x18\x0f\x09" } },
    .{ "EvtGetObjectArrayProperty", MethodRecord{ .library = "wevtapi", .import = "EvtGetObjectArrayProperty", .signature = "\x00\x07\x11\x59\x18\x09\x09\x09\x09\x0f\x11\xc0\x00\x41\xa1\x0f\x09" } },
    .{ "EvtGetQueryInfo", MethodRecord{ .library = "wevtapi", .import = "EvtGetQueryInfo", .signature = "\x00\x05\x11\x59\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\xb5\x09\x0f\x11\xc0\x00\x41\xa1\x0f\x09" } },
    .{ "EvtCreateBookmark", MethodRecord{ .library = "wevtapi", .import = "EvtCreateBookmark", .signature = "\x00\x01\x11\xc0\x00\x41\x95\x11\x05" } },
    .{ "EvtUpdateBookmark", MethodRecord{ .library = "wevtapi", .import = "EvtUpdateBookmark", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\x95" } },
    .{ "EvtGetEventInfo", MethodRecord{ .library = "wevtapi", .import = "EvtGetEventInfo", .signature = "\x00\x05\x11\x59\x11\xc0\x00\x41\x95\x11\xc0\x00\x41\xb9\x09\x0f\x11\xc0\x00\x41\xa1\x0f\x09" } },
    .{ "ClearEventLogA", MethodRecord{ .library = "ADVAPI32", .import = "ClearEventLogA", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x3d" } },
    .{ "ClearEventLogW", MethodRecord{ .library = "ADVAPI32", .import = "ClearEventLogW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x05" } },
    .{ "BackupEventLogA", MethodRecord{ .library = "ADVAPI32", .import = "BackupEventLogA", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x3d" } },
    .{ "BackupEventLogW", MethodRecord{ .library = "ADVAPI32", .import = "BackupEventLogW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x05" } },
    .{ "CloseEventLog", MethodRecord{ .library = "ADVAPI32", .import = "CloseEventLog", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "DeregisterEventSource", MethodRecord{ .library = "ADVAPI32", .import = "DeregisterEventSource", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "NotifyChangeEventLog", MethodRecord{ .library = "ADVAPI32", .import = "NotifyChangeEventLog", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x80\x85" } },
    .{ "GetNumberOfEventLogRecords", MethodRecord{ .library = "ADVAPI32", .import = "GetNumberOfEventLogRecords", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x09" } },
    .{ "GetOldestEventLogRecord", MethodRecord{ .library = "ADVAPI32", .import = "GetOldestEventLogRecord", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x09" } },
    .{ "OpenEventLogA", MethodRecord{ .library = "ADVAPI32", .import = "OpenEventLogA", .signature = "\x00\x02\x11\x80\x85\x11\x3d\x11\x3d" } },
    .{ "OpenEventLogW", MethodRecord{ .library = "ADVAPI32", .import = "OpenEventLogW", .signature = "\x00\x02\x11\x80\x85\x11\x05\x11\x05" } },
    .{ "RegisterEventSourceA", MethodRecord{ .library = "ADVAPI32", .import = "RegisterEventSourceA", .signature = "\x00\x02\x11\x80\x85\x11\x3d\x11\x3d" } },
    .{ "RegisterEventSourceW", MethodRecord{ .library = "ADVAPI32", .import = "RegisterEventSourceW", .signature = "\x00\x02\x11\x80\x85\x11\x05\x11\x05" } },
    .{ "OpenBackupEventLogA", MethodRecord{ .library = "ADVAPI32", .import = "OpenBackupEventLogA", .signature = "\x00\x02\x11\x80\x85\x11\x3d\x11\x3d" } },
    .{ "OpenBackupEventLogW", MethodRecord{ .library = "ADVAPI32", .import = "OpenBackupEventLogW", .signature = "\x00\x02\x11\x80\x85\x11\x05\x11\x05" } },
    .{ "ReadEventLogA", MethodRecord{ .library = "ADVAPI32", .import = "ReadEventLogA", .signature = "\x00\x07\x11\x59\x11\x80\x85\x11\xa1\x35\x09\x0f\x01\x09\x0f\x09\x0f\x09" } },
    .{ "ReadEventLogW", MethodRecord{ .library = "ADVAPI32", .import = "ReadEventLogW", .signature = "\x00\x07\x11\x59\x11\x80\x85\x11\xa1\x35\x09\x0f\x01\x09\x0f\x09\x0f\x09" } },
    .{ "ReportEventA", MethodRecord{ .library = "ADVAPI32", .import = "ReportEventA", .signature = "\x00\x09\x11\x59\x11\x80\x85\x11\xa1\x31\x07\x09\x11\x81\x15\x07\x09\x0f\x11\x3d\x0f\x01" } },
    .{ "ReportEventW", MethodRecord{ .library = "ADVAPI32", .import = "ReportEventW", .signature = "\x00\x09\x11\x59\x11\x80\x85\x11\xa1\x31\x07\x09\x11\x81\x15\x07\x09\x0f\x11\x05\x0f\x01" } },
    .{ "GetEventLogInformation", MethodRecord{ .library = "ADVAPI32", .import = "GetEventLogInformation", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x0f\x01\x09\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x115 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSID" },
        0x2131 => TypeRefEntry{ .namespace = "Windows.Win32.System.EventLog", .name = "REPORT_EVENT_TYPE" },
        0x2135 => TypeRefEntry{ .namespace = "Windows.Win32.System.EventLog", .name = "READ_EVENT_LOG_READ_FLAGS" },
        0x4195 => TypeRefEntry{ .namespace = "Windows.Win32.System.EventLog", .name = "EVT_HANDLE" },
        0x4199 => TypeRefEntry{ .namespace = "Windows.Win32.System.EventLog", .name = "EVT_LOGIN_CLASS" },
        0x419d => TypeRefEntry{ .namespace = "Windows.Win32.System.EventLog", .name = "EVT_SUBSCRIBE_CALLBACK" },
        0x41a1 => TypeRefEntry{ .namespace = "Windows.Win32.System.EventLog", .name = "EVT_VARIANT" },
        0x41a5 => TypeRefEntry{ .namespace = "Windows.Win32.System.EventLog", .name = "EVT_LOG_PROPERTY_ID" },
        0x41a9 => TypeRefEntry{ .namespace = "Windows.Win32.System.EventLog", .name = "EVT_CHANNEL_CONFIG_PROPERTY_ID" },
        0x41ad => TypeRefEntry{ .namespace = "Windows.Win32.System.EventLog", .name = "EVT_PUBLISHER_METADATA_PROPERTY_ID" },
        0x41b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.EventLog", .name = "EVT_EVENT_METADATA_PROPERTY_ID" },
        0x41b5 => TypeRefEntry{ .namespace = "Windows.Win32.System.EventLog", .name = "EVT_QUERY_PROPERTY_ID" },
        0x41b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.EventLog", .name = "EVT_EVENT_PROPERTY_ID" },
        else => null,
    };
}

pub const EVENTLOG_SUCCESS = 0;
pub const EVENTLOG_AUDIT_FAILURE = 16;
pub const EVENTLOG_AUDIT_SUCCESS = 8;
pub const EVENTLOG_ERROR_TYPE = 1;
pub const EVENTLOG_INFORMATION_TYPE = 4;
pub const EVENTLOG_WARNING_TYPE = 2;
pub const EVENTLOG_SEEK_READ = 2;
pub const EVENTLOG_SEQUENTIAL_READ = 1;
pub const EVENTLOG_FORWARDS_READ = 4;
pub const EVENTLOG_BACKWARDS_READ = 8;
pub const EVT_VARIANT_TYPE_MASK = 127;
pub const EVT_VARIANT_TYPE_ARRAY = 128;
pub const EVT_READ_ACCESS = 1;
pub const EVT_WRITE_ACCESS = 2;
pub const EVT_CLEAR_ACCESS = 4;
pub const EVT_ALL_ACCESS = 7;
pub const EvtVarTypeNull = 0;
pub const EvtVarTypeString = 1;
pub const EvtVarTypeAnsiString = 2;
pub const EvtVarTypeSByte = 3;
pub const EvtVarTypeByte = 4;
pub const EvtVarTypeInt16 = 5;
pub const EvtVarTypeUInt16 = 6;
pub const EvtVarTypeInt32 = 7;
pub const EvtVarTypeUInt32 = 8;
pub const EvtVarTypeInt64 = 9;
pub const EvtVarTypeUInt64 = 10;
pub const EvtVarTypeSingle = 11;
pub const EvtVarTypeDouble = 12;
pub const EvtVarTypeBoolean = 13;
pub const EvtVarTypeBinary = 14;
pub const EvtVarTypeGuid = 15;
pub const EvtVarTypeSizeT = 16;
pub const EvtVarTypeFileTime = 17;
pub const EvtVarTypeSysTime = 18;
pub const EvtVarTypeSid = 19;
pub const EvtVarTypeHexInt32 = 20;
pub const EvtVarTypeHexInt64 = 21;
pub const EvtVarTypeEvtHandle = 32;
pub const EvtVarTypeEvtXml = 35;
pub const EvtRpcLogin = 1;
pub const EvtRpcLoginAuthDefault = 0;
pub const EvtRpcLoginAuthNegotiate = 1;
pub const EvtRpcLoginAuthKerberos = 2;
pub const EvtRpcLoginAuthNTLM = 3;
pub const EvtQueryChannelPath = 1;
pub const EvtQueryFilePath = 2;
pub const EvtQueryForwardDirection = 256;
pub const EvtQueryReverseDirection = 512;
pub const EvtQueryTolerateQueryErrors = 4096;
pub const EvtSeekRelativeToFirst = 1;
pub const EvtSeekRelativeToLast = 2;
pub const EvtSeekRelativeToCurrent = 3;
pub const EvtSeekRelativeToBookmark = 4;
pub const EvtSeekOriginMask = 7;
pub const EvtSeekStrict = 65536;
pub const EvtSubscribeToFutureEvents = 1;
pub const EvtSubscribeStartAtOldestRecord = 2;
pub const EvtSubscribeStartAfterBookmark = 3;
pub const EvtSubscribeOriginMask = 3;
pub const EvtSubscribeTolerateQueryErrors = 4096;
pub const EvtSubscribeStrict = 65536;
pub const EvtSubscribeActionError = 0;
pub const EvtSubscribeActionDeliver = 1;
pub const EvtSystemProviderName = 0;
pub const EvtSystemProviderGuid = 1;
pub const EvtSystemEventID = 2;
pub const EvtSystemQualifiers = 3;
pub const EvtSystemLevel = 4;
pub const EvtSystemTask = 5;
pub const EvtSystemOpcode = 6;
pub const EvtSystemKeywords = 7;
pub const EvtSystemTimeCreated = 8;
pub const EvtSystemEventRecordId = 9;
pub const EvtSystemActivityID = 10;
pub const EvtSystemRelatedActivityID = 11;
pub const EvtSystemProcessID = 12;
pub const EvtSystemThreadID = 13;
pub const EvtSystemChannel = 14;
pub const EvtSystemComputer = 15;
pub const EvtSystemUserID = 16;
pub const EvtSystemVersion = 17;
pub const EvtSystemPropertyIdEND = 18;
pub const EvtRenderContextValues = 0;
pub const EvtRenderContextSystem = 1;
pub const EvtRenderContextUser = 2;
pub const EvtRenderEventValues = 0;
pub const EvtRenderEventXml = 1;
pub const EvtRenderBookmark = 2;
pub const EvtFormatMessageEvent = 1;
pub const EvtFormatMessageLevel = 2;
pub const EvtFormatMessageTask = 3;
pub const EvtFormatMessageOpcode = 4;
pub const EvtFormatMessageKeyword = 5;
pub const EvtFormatMessageChannel = 6;
pub const EvtFormatMessageProvider = 7;
pub const EvtFormatMessageId = 8;
pub const EvtFormatMessageXml = 9;
pub const EvtOpenChannelPath = 1;
pub const EvtOpenFilePath = 2;
pub const EvtLogCreationTime = 0;
pub const EvtLogLastAccessTime = 1;
pub const EvtLogLastWriteTime = 2;
pub const EvtLogFileSize = 3;
pub const EvtLogAttributes = 4;
pub const EvtLogNumberOfLogRecords = 5;
pub const EvtLogOldestRecordNumber = 6;
pub const EvtLogFull = 7;
pub const EvtExportLogChannelPath = 1;
pub const EvtExportLogFilePath = 2;
pub const EvtExportLogTolerateQueryErrors = 4096;
pub const EvtExportLogOverwrite = 8192;
pub const EvtChannelConfigEnabled = 0;
pub const EvtChannelConfigIsolation = 1;
pub const EvtChannelConfigType = 2;
pub const EvtChannelConfigOwningPublisher = 3;
pub const EvtChannelConfigClassicEventlog = 4;
pub const EvtChannelConfigAccess = 5;
pub const EvtChannelLoggingConfigRetention = 6;
pub const EvtChannelLoggingConfigAutoBackup = 7;
pub const EvtChannelLoggingConfigMaxSize = 8;
pub const EvtChannelLoggingConfigLogFilePath = 9;
pub const EvtChannelPublishingConfigLevel = 10;
pub const EvtChannelPublishingConfigKeywords = 11;
pub const EvtChannelPublishingConfigControlGuid = 12;
pub const EvtChannelPublishingConfigBufferSize = 13;
pub const EvtChannelPublishingConfigMinBuffers = 14;
pub const EvtChannelPublishingConfigMaxBuffers = 15;
pub const EvtChannelPublishingConfigLatency = 16;
pub const EvtChannelPublishingConfigClockType = 17;
pub const EvtChannelPublishingConfigSidType = 18;
pub const EvtChannelPublisherList = 19;
pub const EvtChannelPublishingConfigFileMax = 20;
pub const EvtChannelConfigPropertyIdEND = 21;
pub const EvtChannelTypeAdmin = 0;
pub const EvtChannelTypeOperational = 1;
pub const EvtChannelTypeAnalytic = 2;
pub const EvtChannelTypeDebug = 3;
pub const EvtChannelIsolationTypeApplication = 0;
pub const EvtChannelIsolationTypeSystem = 1;
pub const EvtChannelIsolationTypeCustom = 2;
pub const EvtChannelClockTypeSystemTime = 0;
pub const EvtChannelClockTypeQPC = 1;
pub const EvtChannelSidTypeNone = 0;
pub const EvtChannelSidTypePublishing = 1;
pub const EvtChannelReferenceImported = 1;
pub const EvtPublisherMetadataPublisherGuid = 0;
pub const EvtPublisherMetadataResourceFilePath = 1;
pub const EvtPublisherMetadataParameterFilePath = 2;
pub const EvtPublisherMetadataMessageFilePath = 3;
pub const EvtPublisherMetadataHelpLink = 4;
pub const EvtPublisherMetadataPublisherMessageID = 5;
pub const EvtPublisherMetadataChannelReferences = 6;
pub const EvtPublisherMetadataChannelReferencePath = 7;
pub const EvtPublisherMetadataChannelReferenceIndex = 8;
pub const EvtPublisherMetadataChannelReferenceID = 9;
pub const EvtPublisherMetadataChannelReferenceFlags = 10;
pub const EvtPublisherMetadataChannelReferenceMessageID = 11;
pub const EvtPublisherMetadataLevels = 12;
pub const EvtPublisherMetadataLevelName = 13;
pub const EvtPublisherMetadataLevelValue = 14;
pub const EvtPublisherMetadataLevelMessageID = 15;
pub const EvtPublisherMetadataTasks = 16;
pub const EvtPublisherMetadataTaskName = 17;
pub const EvtPublisherMetadataTaskEventGuid = 18;
pub const EvtPublisherMetadataTaskValue = 19;
pub const EvtPublisherMetadataTaskMessageID = 20;
pub const EvtPublisherMetadataOpcodes = 21;
pub const EvtPublisherMetadataOpcodeName = 22;
pub const EvtPublisherMetadataOpcodeValue = 23;
pub const EvtPublisherMetadataOpcodeMessageID = 24;
pub const EvtPublisherMetadataKeywords = 25;
pub const EvtPublisherMetadataKeywordName = 26;
pub const EvtPublisherMetadataKeywordValue = 27;
pub const EvtPublisherMetadataKeywordMessageID = 28;
pub const EvtPublisherMetadataPropertyIdEND = 29;
pub const EventMetadataEventID = 0;
pub const EventMetadataEventVersion = 1;
pub const EventMetadataEventChannel = 2;
pub const EventMetadataEventLevel = 3;
pub const EventMetadataEventOpcode = 4;
pub const EventMetadataEventTask = 5;
pub const EventMetadataEventKeyword = 6;
pub const EventMetadataEventMessageID = 7;
pub const EventMetadataEventTemplate = 8;
pub const EvtEventMetadataPropertyIdEND = 9;
pub const EvtQueryNames = 0;
pub const EvtQueryStatuses = 1;
pub const EvtQueryPropertyIdEND = 2;
pub const EvtEventQueryIDs = 0;
pub const EvtEventPath = 1;
pub const EvtEventPropertyIdEND = 2;

pub const aliases = struct {
    pub const REPORT_EVENT_TYPE = u16;
    pub const READ_EVENT_LOG_READ_FLAGS = u32;
    pub const EVT_VARIANT_TYPE = i32;
    pub const EVT_LOGIN_CLASS = i32;
    pub const EVT_RPC_LOGIN_FLAGS = u32;
    pub const EVT_QUERY_FLAGS = u32;
    pub const EVT_SEEK_FLAGS = u32;
    pub const EVT_SUBSCRIBE_FLAGS = u32;
    pub const EVT_SUBSCRIBE_NOTIFY_ACTION = i32;
    pub const EVT_SYSTEM_PROPERTY_ID = i32;
    pub const EVT_RENDER_CONTEXT_FLAGS = u32;
    pub const EVT_RENDER_FLAGS = u32;
    pub const EVT_FORMAT_MESSAGE_FLAGS = u32;
    pub const EVT_OPEN_LOG_FLAGS = u32;
    pub const EVT_LOG_PROPERTY_ID = i32;
    pub const EVT_EXPORTLOG_FLAGS = u32;
    pub const EVT_CHANNEL_CONFIG_PROPERTY_ID = i32;
    pub const EVT_CHANNEL_TYPE = i32;
    pub const EVT_CHANNEL_ISOLATION_TYPE = i32;
    pub const EVT_CHANNEL_CLOCK_TYPE = i32;
    pub const EVT_CHANNEL_SID_TYPE = i32;
    pub const EVT_CHANNEL_REFERENCE_FLAGS = u32;
    pub const EVT_PUBLISHER_METADATA_PROPERTY_ID = i32;
    pub const EVT_EVENT_METADATA_PROPERTY_ID = i32;
    pub const EVT_QUERY_PROPERTY_ID = i32;
    pub const EVT_EVENT_PROPERTY_ID = i32;
    pub const EVT_HANDLE = isize;
    pub const EVT_SUBSCRIBE_CALLBACK = ?*const anyopaque;
};
