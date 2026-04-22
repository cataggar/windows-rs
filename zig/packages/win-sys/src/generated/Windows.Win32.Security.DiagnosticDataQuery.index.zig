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
    .{ "DdqCreateSession", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqCreateSession", .signature = "\x00\x02\x11\x79\x11\xc0\x00\xa2\x8d\x0f\x11\xa7\x00" } },
    .{ "DdqCloseSession", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqCloseSession", .signature = "\x00\x01\x11\x79\x11\xa7\x00" } },
    .{ "DdqGetSessionAccessLevel", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetSessionAccessLevel", .signature = "\x00\x02\x11\x79\x11\xa7\x00\x0f\x11\xc0\x00\xa2\x8d" } },
    .{ "DdqGetDiagnosticDataAccessLevelAllowed", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticDataAccessLevelAllowed", .signature = "\x00\x01\x11\x79\x0f\x11\xc0\x00\xa2\x8d" } },
    .{ "DdqGetDiagnosticRecordStats", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordStats", .signature = "\x00\x05\x11\x79\x11\xa7\x00\x0f\x11\xc0\x01\x3c\xb8\x0f\x09\x0f\x0a\x0f\x0a" } },
    .{ "DdqGetDiagnosticRecordPayload", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordPayload", .signature = "\x00\x03\x11\x79\x11\xa7\x00\x0a\x0f\x11\x05" } },
    .{ "DdqGetDiagnosticRecordLocaleTags", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordLocaleTags", .signature = "\x00\x03\x11\x79\x11\xa7\x00\x11\x05\x0f\x11\xa7\x08" } },
    .{ "DdqFreeDiagnosticRecordLocaleTags", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqFreeDiagnosticRecordLocaleTags", .signature = "\x00\x01\x11\x79\x11\xa7\x08" } },
    .{ "DdqGetDiagnosticRecordLocaleTagAtIndex", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordLocaleTagAtIndex", .signature = "\x00\x03\x11\x79\x11\xa7\x08\x09\x0f\x11\xc0\x01\x3c\xbc" } },
    .{ "DdqGetDiagnosticRecordLocaleTagCount", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordLocaleTagCount", .signature = "\x00\x02\x11\x79\x11\xa7\x08\x0f\x09" } },
    .{ "DdqGetDiagnosticRecordProducers", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordProducers", .signature = "\x00\x02\x11\x79\x11\xa7\x00\x0f\x11\xa7\x0c" } },
    .{ "DdqFreeDiagnosticRecordProducers", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqFreeDiagnosticRecordProducers", .signature = "\x00\x01\x11\x79\x11\xa7\x0c" } },
    .{ "DdqGetDiagnosticRecordProducerAtIndex", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordProducerAtIndex", .signature = "\x00\x03\x11\x79\x11\xa7\x0c\x09\x0f\x11\xc0\x01\x3c\xc0" } },
    .{ "DdqGetDiagnosticRecordProducerCount", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordProducerCount", .signature = "\x00\x02\x11\x79\x11\xa7\x0c\x0f\x09" } },
    .{ "DdqGetDiagnosticRecordProducerCategories", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordProducerCategories", .signature = "\x00\x03\x11\x79\x11\xa7\x00\x11\x05\x0f\x11\xa7\x10" } },
    .{ "DdqFreeDiagnosticRecordProducerCategories", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqFreeDiagnosticRecordProducerCategories", .signature = "\x00\x01\x11\x79\x11\xa7\x10" } },
    .{ "DdqGetDiagnosticRecordCategoryAtIndex", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordCategoryAtIndex", .signature = "\x00\x03\x11\x79\x11\xa7\x10\x09\x0f\x11\xc0\x01\x3c\xc4" } },
    .{ "DdqGetDiagnosticRecordCategoryCount", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordCategoryCount", .signature = "\x00\x02\x11\x79\x11\xa7\x10\x0f\x09" } },
    .{ "DdqIsDiagnosticRecordSampledIn", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqIsDiagnosticRecordSampledIn", .signature = "\x00\x09\x11\x79\x11\xa7\x00\x0f\x11\x0d\x0f\x11\x0d\x11\x05\x0f\x09\x11\x05\x0f\x09\x0f\x0b\x0f\x11\x59" } },
    .{ "DdqGetDiagnosticRecordPage", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordPage", .signature = "\x00\x06\x11\x79\x11\xa7\x00\x0f\x11\xc0\x01\x3c\xb8\x09\x09\x0a\x0f\x11\xa7\x14" } },
    .{ "DdqFreeDiagnosticRecordPage", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqFreeDiagnosticRecordPage", .signature = "\x00\x01\x11\x79\x11\xa7\x14" } },
    .{ "DdqGetDiagnosticRecordAtIndex", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordAtIndex", .signature = "\x00\x03\x11\x79\x11\xa7\x14\x09\x0f\x11\xc0\x01\x3c\xb4" } },
    .{ "DdqGetDiagnosticRecordCount", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordCount", .signature = "\x00\x02\x11\x79\x11\xa7\x14\x0f\x09" } },
    .{ "DdqGetDiagnosticReportStoreReportCount", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticReportStoreReportCount", .signature = "\x00\x03\x11\x79\x11\xa7\x00\x09\x0f\x09" } },
    .{ "DdqCancelDiagnosticRecordOperation", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqCancelDiagnosticRecordOperation", .signature = "\x00\x01\x11\x79\x11\xa7\x00" } },
    .{ "DdqGetDiagnosticReport", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticReport", .signature = "\x00\x03\x11\x79\x11\xa7\x00\x09\x0f\x11\xa7\x04" } },
    .{ "DdqFreeDiagnosticReport", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqFreeDiagnosticReport", .signature = "\x00\x01\x11\x79\x11\xa7\x04" } },
    .{ "DdqGetDiagnosticReportAtIndex", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticReportAtIndex", .signature = "\x00\x03\x11\x79\x11\xa7\x04\x09\x0f\x11\xc0\x01\x3c\xe0" } },
    .{ "DdqGetDiagnosticReportCount", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticReportCount", .signature = "\x00\x02\x11\x79\x11\xa7\x04\x0f\x09" } },
    .{ "DdqExtractDiagnosticReport", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqExtractDiagnosticReport", .signature = "\x00\x04\x11\x79\x11\xa7\x00\x09\x11\x05\x11\x05" } },
    .{ "DdqGetDiagnosticRecordTagDistribution", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordTagDistribution", .signature = "\x00\x05\x11\x79\x11\xa7\x00\x0f\x11\x05\x09\x0f\x0f\x11\xc0\x01\x3c\xc8\x0f\x09" } },
    .{ "DdqGetDiagnosticRecordBinaryDistribution", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordBinaryDistribution", .signature = "\x00\x06\x11\x79\x11\xa7\x00\x0f\x11\x05\x09\x09\x0f\x0f\x11\xc0\x01\x3c\xcc\x0f\x09" } },
    .{ "DdqGetDiagnosticRecordSummary", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetDiagnosticRecordSummary", .signature = "\x00\x04\x11\x79\x11\xa7\x00\x0f\x11\x05\x09\x0f\x11\xc0\x01\x3c\xd0" } },
    .{ "DdqSetTranscriptConfiguration", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqSetTranscriptConfiguration", .signature = "\x00\x02\x11\x79\x11\xa7\x00\x0f\x11\xc0\x01\x3c\xd4" } },
    .{ "DdqGetTranscriptConfiguration", MethodRecord{ .library = "DiagnosticDataQuery", .import = "DdqGetTranscriptConfiguration", .signature = "\x00\x02\x11\x79\x11\xa7\x00\x0f\x11\xc0\x01\x3c\xd4" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2700 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "HDIAGNOSTIC_DATA_QUERY_SESSION" },
        0x2704 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "HDIAGNOSTIC_REPORT" },
        0x2708 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "HDIAGNOSTIC_EVENT_TAG_DESCRIPTION" },
        0x270c => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION" },
        0x2710 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION" },
        0x2714 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "HDIAGNOSTIC_RECORD" },
        0xa28d => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "DdqAccessLevel" },
        0x13cb4 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "DIAGNOSTIC_DATA_RECORD" },
        0x13cb8 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "DIAGNOSTIC_DATA_SEARCH_CRITERIA" },
        0x13cbc => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION" },
        0x13cc0 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION" },
        0x13cc4 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION" },
        0x13cc8 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "DIAGNOSTIC_DATA_EVENT_TAG_STATS" },
        0x13ccc => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "DIAGNOSTIC_DATA_EVENT_BINARY_STATS" },
        0x13cd0 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "DIAGNOSTIC_DATA_GENERAL_STATS" },
        0x13cd4 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION" },
        0x13ce0 => TypeRefEntry{ .namespace = "Windows.Win32.Security.DiagnosticDataQuery", .name = "DIAGNOSTIC_REPORT_DATA" },
        else => null,
    };
}

pub const NoData = 0;
pub const CurrentUserData = 1;
pub const AllUserData = 2;

pub const aliases = struct {
    pub const DdqAccessLevel = i32;
    pub const HDIAGNOSTIC_DATA_QUERY_SESSION = ?*anyopaque;
    pub const HDIAGNOSTIC_REPORT = ?*anyopaque;
    pub const HDIAGNOSTIC_EVENT_TAG_DESCRIPTION = ?*anyopaque;
    pub const HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION = ?*anyopaque;
    pub const HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION = ?*anyopaque;
    pub const HDIAGNOSTIC_RECORD = ?*anyopaque;
};
