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
    .{ "NdfCreateIncident", MethodRecord{ .library = "NDFAPI", .import = "NdfCreateIncident", .signature = "\x00\x04\x11\x79\x11\x05\x09\x0f\x11\xb7\xbd\x0f\x0f\x01" } },
    .{ "NdfCreateWinSockIncident", MethodRecord{ .library = "NDFAPI", .import = "NdfCreateWinSockIncident", .signature = "\x00\x06\x11\x79\x11\xb3\x51\x11\x05\x07\x11\x05\x0f\x11\xb7\xc1\x0f\x0f\x01" } },
    .{ "NdfCreateWebIncident", MethodRecord{ .library = "NDFAPI", .import = "NdfCreateWebIncident", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x0f\x01" } },
    .{ "NdfCreateWebIncidentEx", MethodRecord{ .library = "NDFAPI", .import = "NdfCreateWebIncidentEx", .signature = "\x00\x04\x11\x79\x11\x05\x11\x59\x11\x05\x0f\x0f\x01" } },
    .{ "NdfCreateSharingIncident", MethodRecord{ .library = "NDFAPI", .import = "NdfCreateSharingIncident", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x0f\x01" } },
    .{ "NdfCreateDNSIncident", MethodRecord{ .library = "NDFAPI", .import = "NdfCreateDNSIncident", .signature = "\x00\x03\x11\x79\x11\x05\x07\x0f\x0f\x01" } },
    .{ "NdfCreateConnectivityIncident", MethodRecord{ .library = "NDFAPI", .import = "NdfCreateConnectivityIncident", .signature = "\x00\x01\x11\x79\x0f\x0f\x01" } },
    .{ "NdfCreateNetConnectionIncident", MethodRecord{ .library = "NDFAPI", .import = "NdfCreateNetConnectionIncident", .signature = "\x00\x02\x11\x79\x0f\x0f\x01\x11\x0d" } },
    .{ "NdfCreatePnrpIncident", MethodRecord{ .library = "NDFAPI", .import = "NdfCreatePnrpIncident", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x11\x59\x11\x05\x0f\x0f\x01" } },
    .{ "NdfCreateGroupingIncident", MethodRecord{ .library = "NDFAPI", .import = "NdfCreateGroupingIncident", .signature = "\x00\x07\x11\x79\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x11\xb3\x99\x11\x05\x0f\x0f\x01" } },
    .{ "NdfExecuteDiagnosis", MethodRecord{ .library = "NDFAPI", .import = "NdfExecuteDiagnosis", .signature = "\x00\x02\x11\x79\x0f\x01\x11\x25" } },
    .{ "NdfCloseIncident", MethodRecord{ .library = "NDFAPI", .import = "NdfCloseIncident", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "NdfDiagnoseIncident", MethodRecord{ .library = "NDFAPI", .import = "NdfDiagnoseIncident", .signature = "\x00\x05\x11\x79\x0f\x01\x0f\x09\x0f\x0f\x11\xb7\xc5\x09\x09" } },
    .{ "NdfRepairIncident", MethodRecord{ .library = "NDFAPI", .import = "NdfRepairIncident", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x11\xb7\xc9\x09" } },
    .{ "NdfCancelIncident", MethodRecord{ .library = "NDFAPI", .import = "NdfCancelIncident", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "NdfGetTraceFile", MethodRecord{ .library = "NDFAPI", .import = "NdfGetTraceFile", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x3351 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKET" },
        0x3399 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKET_ADDRESS_LIST" },
        0x37bd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework", .name = "HELPER_ATTRIBUTE" },
        0x37c1 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SID" },
        0x37c5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework", .name = "RootCauseInfo" },
        0x37c9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework", .name = "RepairInfoEx" },
        else => null,
    };
}

pub const NDF_ERROR_START = 63744;
pub const NDF_E_LENGTH_EXCEEDED = -2146895616;
pub const NDF_E_NOHELPERCLASS = -2146895615;
pub const NDF_E_CANCELLED = -2146895614;
pub const NDF_E_DISABLED = -2146895612;
pub const NDF_E_BAD_PARAM = -2146895611;
pub const NDF_E_VALIDATION = -2146895610;
pub const NDF_E_UNKNOWN = -2146895609;
pub const NDF_E_PROBLEM_PRESENT = -2146895608;
pub const RF_WORKAROUND = 536870912;
pub const RF_USER_ACTION = 268435456;
pub const RF_USER_CONFIRMATION = 134217728;
pub const RF_INFORMATION_ONLY = 33554432;
pub const RF_UI_ONLY = 16777216;
pub const RF_SHOW_EVENTS = 8388608;
pub const RF_VALIDATE_HELPTOPIC = 4194304;
pub const RF_REPRO = 2097152;
pub const RF_CONTACT_ADMIN = 131072;
pub const RF_RESERVED = 1073741824;
pub const RF_RESERVED_CA = 2147483648;
pub const RF_RESERVED_LNI = 65536;
pub const RCF_ISLEAF = 1;
pub const RCF_ISCONFIRMED = 2;
pub const RCF_ISTHIRDPARTY = 4;
pub const DF_IMPERSONATION = 2147483648;
pub const DF_TRACELESS = 1073741824;
pub const NDF_INBOUND_FLAG_EDGETRAVERSAL = 1;
pub const NDF_INBOUND_FLAG_HEALTHCHECK = 2;
pub const NDF_ADD_CAPTURE_TRACE = 1;
pub const NDF_APPLY_INCLUSION_LIST_FILTER = 2;
pub const AT_INVALID = 0;
pub const AT_BOOLEAN = 1;
pub const AT_INT8 = 2;
pub const AT_UINT8 = 3;
pub const AT_INT16 = 4;
pub const AT_UINT16 = 5;
pub const AT_INT32 = 6;
pub const AT_UINT32 = 7;
pub const AT_INT64 = 8;
pub const AT_UINT64 = 9;
pub const AT_STRING = 10;
pub const AT_GUID = 11;
pub const AT_LIFE_TIME = 12;
pub const AT_SOCKADDR = 13;
pub const AT_OCTET_STRING = 14;
pub const RS_SYSTEM = 0;
pub const RS_USER = 1;
pub const RS_APPLICATION = 2;
pub const RS_PROCESS = 3;
pub const RR_NOROLLBACK = 0;
pub const RR_ROLLBACK = 1;
pub const RR_NORISK = 2;
pub const UIT_INVALID = 0;
pub const UIT_NONE = 1;
pub const UIT_SHELL_COMMAND = 2;
pub const UIT_HELP_PANE = 3;
pub const UIT_DUI = 4;
pub const DS_NOT_IMPLEMENTED = 0;
pub const DS_CONFIRMED = 1;
pub const DS_REJECTED = 2;
pub const DS_INDETERMINATE = 3;
pub const DS_DEFERRED = 4;
pub const DS_PASSTHROUGH = 5;
pub const RS_NOT_IMPLEMENTED = 0;
pub const RS_REPAIRED = 1;
pub const RS_UNREPAIRED = 2;
pub const RS_DEFERRED = 3;
pub const RS_USER_ACTION = 4;
pub const PT_INVALID = 0;
pub const PT_LOW_HEALTH = 1;
pub const PT_LOWER_HEALTH = 2;
pub const PT_DOWN_STREAM_HEALTH = 4;
pub const PT_HIGH_UTILIZATION = 8;
pub const PT_HIGHER_UTILIZATION = 16;
pub const PT_UP_STREAM_UTILIZATION = 32;

pub const aliases = struct {
    pub const ATTRIBUTE_TYPE = i32;
    pub const REPAIR_SCOPE = i32;
    pub const REPAIR_RISK = i32;
    pub const UI_INFO_TYPE = i32;
    pub const DIAGNOSIS_STATUS = i32;
    pub const REPAIR_STATUS = i32;
    pub const PROBLEM_TYPE = i32;
};
