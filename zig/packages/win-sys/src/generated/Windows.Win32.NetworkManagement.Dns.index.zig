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
    .{ "DnsQueryConfig", MethodRecord{ .library = "DNSAPI", .import = "DnsQueryConfig", .signature = "\x00\x06\x08\x11\xb5\x91\x09\x11\x05\x0f\x01\x0f\x01\x0f\x09" } },
    .{ "DnsRecordCopyEx", MethodRecord{ .library = "DNSAPI", .import = "DnsRecordCopyEx", .signature = "\x00\x03\x0f\x11\xb5\x95\x0f\x11\xb5\x95\x11\xb5\x99\x11\xb5\x99" } },
    .{ "DnsRecordSetCopyEx", MethodRecord{ .library = "DNSAPI", .import = "DnsRecordSetCopyEx", .signature = "\x00\x03\x0f\x11\xb5\x95\x0f\x11\xb5\x95\x11\xb5\x99\x11\xb5\x99" } },
    .{ "DnsRecordCompare", MethodRecord{ .library = "DNSAPI", .import = "DnsRecordCompare", .signature = "\x00\x02\x11\x59\x0f\x11\xb5\x95\x0f\x11\xb5\x95" } },
    .{ "DnsRecordSetCompare", MethodRecord{ .library = "DNSAPI", .import = "DnsRecordSetCompare", .signature = "\x00\x04\x11\x59\x0f\x11\xb5\x95\x0f\x11\xb5\x95\x0f\x0f\x11\xb5\x95\x0f\x0f\x11\xb5\x95" } },
    .{ "DnsRecordSetDetach", MethodRecord{ .library = "DNSAPI", .import = "DnsRecordSetDetach", .signature = "\x00\x01\x0f\x11\xb5\x95\x0f\x11\xb5\x95" } },
    .{ "DnsFree", MethodRecord{ .library = "DNSAPI", .import = "DnsFree", .signature = "\x00\x02\x01\x0f\x01\x11\xb5\x9d" } },
    .{ "DnsIsFlatRecord", MethodRecord{ .library = "DNSAPI", .import = "DnsIsFlatRecord", .signature = "\x00\x03\x08\x0f\x11\xb5\x95\x0b\x0f\x11\x59" } },
    .{ "DnsQuery_A", MethodRecord{ .library = "DNSAPI", .import = "DnsQuery_A", .signature = "\x00\x06\x11\x81\x01\x11\x3d\x07\x11\x98\x05\x0f\x01\x0f\x0f\x11\xb5\x95\x0f\x0f\x01" } },
    .{ "DnsQuery_UTF8", MethodRecord{ .library = "DNSAPI", .import = "DnsQuery_UTF8", .signature = "\x00\x06\x11\x81\x01\x11\x3d\x07\x11\x98\x05\x0f\x01\x0f\x0f\x11\xb5\x95\x0f\x0f\x01" } },
    .{ "DnsQuery_W", MethodRecord{ .library = "DNSAPI", .import = "DnsQuery_W", .signature = "\x00\x06\x11\x81\x01\x11\x05\x07\x11\x98\x05\x0f\x01\x0f\x0f\x11\xb5\x95\x0f\x0f\x01" } },
    .{ "DnsFreeCustomServers", MethodRecord{ .library = "DNSAPI", .import = "DnsFreeCustomServers", .signature = "\x00\x02\x01\x0f\x09\x0f\x0f\x11\xb5\xa1" } },
    .{ "DnsGetApplicationSettings", MethodRecord{ .library = "DNSAPI", .import = "DnsGetApplicationSettings", .signature = "\x00\x03\x09\x0f\x09\x0f\x0f\x11\xb5\xa1\x0f\x11\xb5\xa5" } },
    .{ "DnsSetApplicationSettings", MethodRecord{ .library = "DNSAPI", .import = "DnsSetApplicationSettings", .signature = "\x00\x03\x09\x09\x0f\x11\xb5\xa1\x0f\x11\xb5\xa5" } },
    .{ "DnsQueryEx", MethodRecord{ .library = "DNSAPI", .import = "DnsQueryEx", .signature = "\x00\x03\x08\x0f\x11\xb5\xa9\x0f\x11\xb5\xad\x0f\x11\xb5\xb1" } },
    .{ "DnsCancelQuery", MethodRecord{ .library = "DNSAPI", .import = "DnsCancelQuery", .signature = "\x00\x01\x08\x0f\x11\xb5\xb1" } },
    .{ "DnsQueryRawResultFree", MethodRecord{ .library = "DNSAPI", .import = "DnsQueryRawResultFree", .signature = "\x00\x01\x01\x0f\x11\xb5\xb5" } },
    .{ "DnsQueryRaw", MethodRecord{ .library = "DNSAPI", .import = "DnsQueryRaw", .signature = "\x00\x02\x08\x0f\x11\xb5\xb9\x0f\x11\xb5\xbd" } },
    .{ "DnsCancelQueryRaw", MethodRecord{ .library = "DNSAPI", .import = "DnsCancelQueryRaw", .signature = "\x00\x01\x08\x0f\x11\xb5\xbd" } },
    .{ "DnsAcquireContextHandle_W", MethodRecord{ .library = "DNSAPI", .import = "DnsAcquireContextHandle_W", .signature = "\x00\x03\x08\x09\x0f\x01\x0f\x11\x80\x85" } },
    .{ "DnsAcquireContextHandle_A", MethodRecord{ .library = "DNSAPI", .import = "DnsAcquireContextHandle_A", .signature = "\x00\x03\x08\x09\x0f\x01\x0f\x11\x80\x85" } },
    .{ "DnsReleaseContextHandle", MethodRecord{ .library = "DNSAPI", .import = "DnsReleaseContextHandle", .signature = "\x00\x01\x01\x11\x80\x85" } },
    .{ "DnsModifyRecordsInSet_W", MethodRecord{ .library = "DNSAPI", .import = "DnsModifyRecordsInSet_W", .signature = "\x00\x06\x08\x0f\x11\xb5\x95\x0f\x11\xb5\x95\x09\x11\x80\x85\x0f\x01\x0f\x01" } },
    .{ "DnsModifyRecordsInSet_A", MethodRecord{ .library = "DNSAPI", .import = "DnsModifyRecordsInSet_A", .signature = "\x00\x06\x08\x0f\x11\xb5\x95\x0f\x11\xb5\x95\x09\x11\x80\x85\x0f\x01\x0f\x01" } },
    .{ "DnsModifyRecordsInSet_UTF8", MethodRecord{ .library = "DNSAPI", .import = "DnsModifyRecordsInSet_UTF8", .signature = "\x00\x06\x08\x0f\x11\xb5\x95\x0f\x11\xb5\x95\x09\x11\x80\x85\x0f\x01\x0f\x01" } },
    .{ "DnsReplaceRecordSetW", MethodRecord{ .library = "DNSAPI", .import = "DnsReplaceRecordSetW", .signature = "\x00\x05\x08\x0f\x11\xb5\x95\x09\x11\x80\x85\x0f\x01\x0f\x01" } },
    .{ "DnsReplaceRecordSetA", MethodRecord{ .library = "DNSAPI", .import = "DnsReplaceRecordSetA", .signature = "\x00\x05\x08\x0f\x11\xb5\x95\x09\x11\x80\x85\x0f\x01\x0f\x01" } },
    .{ "DnsReplaceRecordSetUTF8", MethodRecord{ .library = "DNSAPI", .import = "DnsReplaceRecordSetUTF8", .signature = "\x00\x05\x08\x0f\x11\xb5\x95\x09\x11\x80\x85\x0f\x01\x0f\x01" } },
    .{ "DnsValidateName_W", MethodRecord{ .library = "DNSAPI", .import = "DnsValidateName_W", .signature = "\x00\x02\x08\x11\x05\x11\xb5\xc1" } },
    .{ "DnsValidateName_A", MethodRecord{ .library = "DNSAPI", .import = "DnsValidateName_A", .signature = "\x00\x02\x08\x11\x3d\x11\xb5\xc1" } },
    .{ "DnsValidateName_UTF8", MethodRecord{ .library = "DNSAPI", .import = "DnsValidateName_UTF8", .signature = "\x00\x02\x08\x11\x3d\x11\xb5\xc1" } },
    .{ "DnsNameCompare_A", MethodRecord{ .library = "DNSAPI", .import = "DnsNameCompare_A", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "DnsNameCompare_W", MethodRecord{ .library = "DNSAPI", .import = "DnsNameCompare_W", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "DnsWriteQuestionToBuffer_W", MethodRecord{ .library = "DNSAPI", .import = "DnsWriteQuestionToBuffer_W", .signature = "\x00\x06\x11\x59\x0f\x11\xb5\xc5\x0f\x09\x11\x05\x07\x07\x11\x59" } },
    .{ "DnsWriteQuestionToBuffer_UTF8", MethodRecord{ .library = "DNSAPI", .import = "DnsWriteQuestionToBuffer_UTF8", .signature = "\x00\x06\x11\x59\x0f\x11\xb5\xc5\x0f\x09\x11\x3d\x07\x07\x11\x59" } },
    .{ "DnsExtractRecordsFromMessage_W", MethodRecord{ .library = "DNSAPI", .import = "DnsExtractRecordsFromMessage_W", .signature = "\x00\x03\x08\x0f\x11\xb5\xc5\x07\x0f\x0f\x11\xb5\x95" } },
    .{ "DnsExtractRecordsFromMessage_UTF8", MethodRecord{ .library = "DNSAPI", .import = "DnsExtractRecordsFromMessage_UTF8", .signature = "\x00\x03\x08\x0f\x11\xb5\xc5\x07\x0f\x0f\x11\xb5\x95" } },
    .{ "DnsGetProxyInformation", MethodRecord{ .library = "DNSAPI", .import = "DnsGetProxyInformation", .signature = "\x00\x05\x09\x11\x05\x0f\x11\xb5\xc9\x0f\x11\xb5\xc9\x12\xb5\xcd\x0f\x01" } },
    .{ "DnsFreeProxyName", MethodRecord{ .library = "DNSAPI", .import = "DnsFreeProxyName", .signature = "\x00\x01\x01\x11\x05" } },
    .{ "DnsConnectionGetProxyInfoForHostUrl", MethodRecord{ .library = "DNSAPI", .import = "DnsConnectionGetProxyInfoForHostUrl", .signature = "\x00\x05\x09\x11\x05\x0f\x05\x09\x09\x0f\x11\xb5\xd1" } },
    .{ "DnsConnectionGetProxyInfoForHostUrlEx", MethodRecord{ .library = "DNSAPI", .import = "DnsConnectionGetProxyInfoForHostUrlEx", .signature = "\x00\x06\x09\x11\x05\x0f\x05\x09\x09\x11\x05\x0f\x11\xb5\xd1" } },
    .{ "DnsConnectionFreeProxyInfoEx", MethodRecord{ .library = "DNSAPI", .import = "DnsConnectionFreeProxyInfoEx", .signature = "\x00\x01\x01\x0f\x11\xb5\xd1" } },
    .{ "DnsConnectionGetProxyInfo", MethodRecord{ .library = "DNSAPI", .import = "DnsConnectionGetProxyInfo", .signature = "\x00\x03\x09\x11\x05\x11\xb5\xd5\x0f\x11\xb5\xd9" } },
    .{ "DnsConnectionFreeProxyInfo", MethodRecord{ .library = "DNSAPI", .import = "DnsConnectionFreeProxyInfo", .signature = "\x00\x01\x01\x0f\x11\xb5\xd9" } },
    .{ "DnsConnectionSetProxyInfo", MethodRecord{ .library = "DNSAPI", .import = "DnsConnectionSetProxyInfo", .signature = "\x00\x03\x09\x11\x05\x11\xb5\xd5\x0f\x11\xb5\xd9" } },
    .{ "DnsConnectionDeleteProxyInfo", MethodRecord{ .library = "DNSAPI", .import = "DnsConnectionDeleteProxyInfo", .signature = "\x00\x02\x09\x11\x05\x11\xb5\xd5" } },
    .{ "DnsConnectionGetProxyList", MethodRecord{ .library = "DNSAPI", .import = "DnsConnectionGetProxyList", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb5\xdd" } },
    .{ "DnsConnectionFreeProxyList", MethodRecord{ .library = "DNSAPI", .import = "DnsConnectionFreeProxyList", .signature = "\x00\x01\x01\x0f\x11\xb5\xdd" } },
    .{ "DnsConnectionGetNameList", MethodRecord{ .library = "DNSAPI", .import = "DnsConnectionGetNameList", .signature = "\x00\x01\x09\x0f\x11\xb5\xe1" } },
    .{ "DnsConnectionFreeNameList", MethodRecord{ .library = "DNSAPI", .import = "DnsConnectionFreeNameList", .signature = "\x00\x01\x01\x0f\x11\xb5\xe1" } },
    .{ "DnsConnectionUpdateIfIndexTable", MethodRecord{ .library = "DNSAPI", .import = "DnsConnectionUpdateIfIndexTable", .signature = "\x00\x01\x09\x0f\x11\xb5\xe5" } },
    .{ "DnsConnectionSetPolicyEntries", MethodRecord{ .library = "DNSAPI", .import = "DnsConnectionSetPolicyEntries", .signature = "\x00\x02\x09\x11\xb5\xe9\x0f\x11\xb5\xed" } },
    .{ "DnsConnectionDeletePolicyEntries", MethodRecord{ .library = "DNSAPI", .import = "DnsConnectionDeletePolicyEntries", .signature = "\x00\x01\x09\x11\xb5\xe9" } },
    .{ "DnsServiceConstructInstance", MethodRecord{ .library = "DNSAPI", .import = "DnsServiceConstructInstance", .signature = "\x00\x0a\x0f\x11\xb5\xf1\x11\x05\x11\x05\x0f\x09\x0f\x11\xb5\xf5\x07\x07\x07\x09\x0f\x11\x05\x0f\x11\x05" } },
    .{ "DnsServiceCopyInstance", MethodRecord{ .library = "DNSAPI", .import = "DnsServiceCopyInstance", .signature = "\x00\x01\x0f\x11\xb5\xf1\x0f\x11\xb5\xf1" } },
    .{ "DnsServiceFreeInstance", MethodRecord{ .library = "DNSAPI", .import = "DnsServiceFreeInstance", .signature = "\x00\x01\x01\x0f\x11\xb5\xf1" } },
    .{ "DnsServiceBrowse", MethodRecord{ .library = "DNSAPI", .import = "DnsServiceBrowse", .signature = "\x00\x02\x08\x0f\x11\xb5\xf9\x0f\x11\xb5\xfd" } },
    .{ "DnsServiceBrowseCancel", MethodRecord{ .library = "DNSAPI", .import = "DnsServiceBrowseCancel", .signature = "\x00\x01\x08\x0f\x11\xb5\xfd" } },
    .{ "DnsServiceResolve", MethodRecord{ .library = "DNSAPI", .import = "DnsServiceResolve", .signature = "\x00\x02\x08\x0f\x11\xb6\x01\x0f\x11\xb5\xfd" } },
    .{ "DnsServiceResolveCancel", MethodRecord{ .library = "DNSAPI", .import = "DnsServiceResolveCancel", .signature = "\x00\x01\x08\x0f\x11\xb5\xfd" } },
    .{ "DnsServiceRegister", MethodRecord{ .library = "DNSAPI", .import = "DnsServiceRegister", .signature = "\x00\x02\x09\x0f\x11\xb6\x05\x0f\x11\xb5\xfd" } },
    .{ "DnsServiceDeRegister", MethodRecord{ .library = "DNSAPI", .import = "DnsServiceDeRegister", .signature = "\x00\x02\x09\x0f\x11\xb6\x05\x0f\x11\xb5\xfd" } },
    .{ "DnsServiceRegisterCancel", MethodRecord{ .library = "DNSAPI", .import = "DnsServiceRegisterCancel", .signature = "\x00\x01\x09\x0f\x11\xb5\xfd" } },
    .{ "DnsStartMulticastQuery", MethodRecord{ .library = "DNSAPI", .import = "DnsStartMulticastQuery", .signature = "\x00\x02\x08\x0f\x11\xb6\x09\x0f\x11\xb6\x0d" } },
    .{ "DnsStopMulticastQuery", MethodRecord{ .library = "DNSAPI", .import = "DnsStopMulticastQuery", .signature = "\x00\x01\x08\x0f\x11\xb6\x0d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x1805 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_QUERY_OPTIONS" },
        0x3591 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_CONFIG_TYPE" },
        0x3595 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_RECORDA" },
        0x3599 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_CHARSET" },
        0x359d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_FREE_TYPE" },
        0x35a1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_CUSTOM_SERVER" },
        0x35a5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_APPLICATION_SETTINGS" },
        0x35a9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_QUERY_REQUEST" },
        0x35ad => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_QUERY_RESULT" },
        0x35b1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_QUERY_CANCEL" },
        0x35b5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_QUERY_RAW_RESULT" },
        0x35b9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_QUERY_RAW_REQUEST" },
        0x35bd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_QUERY_RAW_CANCEL" },
        0x35c1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_NAME_FORMAT" },
        0x35c5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_MESSAGE_BUFFER" },
        0x35c9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_PROXY_INFORMATION" },
        0x35cd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_PROXY_COMPLETION_ROUTINE" },
        0x35d1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_CONNECTION_PROXY_INFO_EX" },
        0x35d5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_CONNECTION_PROXY_TYPE" },
        0x35d9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_CONNECTION_PROXY_INFO" },
        0x35dd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_CONNECTION_PROXY_LIST" },
        0x35e1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_CONNECTION_NAME_LIST" },
        0x35e5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_CONNECTION_IFINDEX_LIST" },
        0x35e9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_CONNECTION_POLICY_TAG" },
        0x35ed => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_CONNECTION_POLICY_ENTRY_LIST" },
        0x35f1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_SERVICE_INSTANCE" },
        0x35f5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "IP6_ADDRESS" },
        0x35f9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_SERVICE_BROWSE_REQUEST" },
        0x35fd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_SERVICE_CANCEL" },
        0x3601 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_SERVICE_RESOLVE_REQUEST" },
        0x3605 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "DNS_SERVICE_REGISTER_REQUEST" },
        0x3609 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "MDNS_QUERY_REQUEST" },
        0x360d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dns", .name = "MDNS_QUERY_HANDLE" },
        else => null,
    };
}

pub const DNS_QUERY_PARSE_ALL_RECORDS = 0;
pub const DNS_QUERY_STANDARD = 0;
pub const DNS_QUERY_ACCEPT_TRUNCATED_RESPONSE = 1;
pub const DNS_QUERY_USE_TCP_ONLY = 2;
pub const DNS_QUERY_NO_RECURSION = 4;
pub const DNS_QUERY_BYPASS_CACHE = 8;
pub const DNS_QUERY_NO_WIRE_QUERY = 16;
pub const DNS_QUERY_NO_LOCAL_NAME = 32;
pub const DNS_QUERY_NO_HOSTS_FILE = 64;
pub const DNS_QUERY_NO_NETBT = 128;
pub const DNS_QUERY_WIRE_ONLY = 256;
pub const DNS_QUERY_RETURN_MESSAGE = 512;
pub const DNS_QUERY_MULTICAST_ONLY = 1024;
pub const DNS_QUERY_NO_MULTICAST = 2048;
pub const DNS_QUERY_TREAT_AS_FQDN = 4096;
pub const DNS_QUERY_ADDRCONFIG = 8192;
pub const DNS_QUERY_DUAL_ADDR = 16384;
pub const DNS_QUERY_DONT_RESET_TTL_VALUES = 1048576;
pub const DNS_QUERY_DISABLE_IDN_ENCODING = 2097152;
pub const DNS_QUERY_APPEND_MULTILABEL = 8388608;
pub const DNS_QUERY_DNSSEC_OK = 16777216;
pub const DNS_QUERY_DNSSEC_CHECKING_DISABLED = 33554432;
pub const DNS_QUERY_DNSSEC_REQUIRED = 67108864;
pub const DNS_QUERY_RESERVED = 4026531840;
pub const DNS_QUERY_CACHE_ONLY = 16;
pub const DNS_QUERY_REQUEST_VERSION1 = 1;
pub const DNS_QUERY_REQUEST_VERSION2 = 2;
pub const DNS_QUERY_RESULTS_VERSION1 = 1;
pub const DNS_QUERY_REQUEST_VERSION3 = 3;
pub const DNS_QUERY_RAW_RESULTS_VERSION1 = 1;
pub const DNS_QUERY_RAW_REQUEST_VERSION1 = 1;
pub const DNS_QUERY_RAW_OPTION_BEST_EFFORT_PARSE = 1;
pub const SIZEOF_IP4_ADDRESS = 4;
pub const IP4_ADDRESS_STRING_LENGTH = 16;
pub const IP4_ADDRESS_STRING_BUFFER_LENGTH = 16;
pub const DNS_ADDR_MAX_SOCKADDR_LENGTH = 32;
pub const DNS_TYPE_ZERO = 0;
pub const DNS_TYPE_A = 1;
pub const DNS_TYPE_NS = 2;
pub const DNS_TYPE_MD = 3;
pub const DNS_TYPE_MF = 4;
pub const DNS_TYPE_CNAME = 5;
pub const DNS_TYPE_SOA = 6;
pub const DNS_TYPE_MB = 7;
pub const DNS_TYPE_MG = 8;
pub const DNS_TYPE_MR = 9;
pub const DNS_TYPE_NULL = 10;
pub const DNS_TYPE_WKS = 11;
pub const DNS_TYPE_PTR = 12;
pub const DNS_TYPE_HINFO = 13;
pub const DNS_TYPE_MINFO = 14;
pub const DNS_TYPE_MX = 15;
pub const DNS_TYPE_TEXT = 16;
pub const DNS_TYPE_RP = 17;
pub const DNS_TYPE_AFSDB = 18;
pub const DNS_TYPE_X25 = 19;
pub const DNS_TYPE_ISDN = 20;
pub const DNS_TYPE_RT = 21;
pub const DNS_TYPE_NSAP = 22;
pub const DNS_TYPE_NSAPPTR = 23;
pub const DNS_TYPE_SIG = 24;
pub const DNS_TYPE_KEY = 25;
pub const DNS_TYPE_PX = 26;
pub const DNS_TYPE_GPOS = 27;
pub const DNS_TYPE_AAAA = 28;
pub const DNS_TYPE_LOC = 29;
pub const DNS_TYPE_NXT = 30;
pub const DNS_TYPE_EID = 31;
pub const DNS_TYPE_NIMLOC = 32;
pub const DNS_TYPE_SRV = 33;
pub const DNS_TYPE_ATMA = 34;
pub const DNS_TYPE_NAPTR = 35;
pub const DNS_TYPE_KX = 36;
pub const DNS_TYPE_CERT = 37;
pub const DNS_TYPE_A6 = 38;
pub const DNS_TYPE_DNAME = 39;
pub const DNS_TYPE_SINK = 40;
pub const DNS_TYPE_OPT = 41;
pub const DNS_TYPE_DS = 43;
pub const DNS_TYPE_RRSIG = 46;
pub const DNS_TYPE_NSEC = 47;
pub const DNS_TYPE_DNSKEY = 48;
pub const DNS_TYPE_DHCID = 49;
pub const DNS_TYPE_NSEC3 = 50;
pub const DNS_TYPE_NSEC3PARAM = 51;
pub const DNS_TYPE_TLSA = 52;
pub const DNS_TYPE_SVCB = 64;
pub const DNS_TYPE_HTTPS = 65;
pub const DNS_TYPE_UINFO = 100;
pub const DNS_TYPE_UID = 101;
pub const DNS_TYPE_GID = 102;
pub const DNS_TYPE_UNSPEC = 103;
pub const DNS_TYPE_ADDRS = 248;
pub const DNS_TYPE_TKEY = 249;
pub const DNS_TYPE_TSIG = 250;
pub const DNS_TYPE_IXFR = 251;
pub const DNS_TYPE_AXFR = 252;
pub const DNS_TYPE_MAILB = 253;
pub const DNS_TYPE_MAILA = 254;
pub const DNS_TYPE_ALL = 255;
pub const DNS_TYPE_ANY = 255;
pub const DNS_TYPE_WINS = 65281;
pub const DNS_TYPE_WINSR = 65282;
pub const DNS_TYPE_NBSTAT = 65282;
pub const DNS_RTYPE_A = 256;
pub const DNS_RTYPE_NS = 512;
pub const DNS_RTYPE_MD = 768;
pub const DNS_RTYPE_MF = 1024;
pub const DNS_RTYPE_CNAME = 1280;
pub const DNS_RTYPE_SOA = 1536;
pub const DNS_RTYPE_MB = 1792;
pub const DNS_RTYPE_MG = 2048;
pub const DNS_RTYPE_MR = 2304;
pub const DNS_RTYPE_NULL = 2560;
pub const DNS_RTYPE_WKS = 2816;
pub const DNS_RTYPE_PTR = 3072;
pub const DNS_RTYPE_HINFO = 3328;
pub const DNS_RTYPE_MINFO = 3584;
pub const DNS_RTYPE_MX = 3840;
pub const DNS_RTYPE_TEXT = 4096;
pub const DNS_RTYPE_RP = 4352;
pub const DNS_RTYPE_AFSDB = 4608;
pub const DNS_RTYPE_X25 = 4864;
pub const DNS_RTYPE_ISDN = 5120;
pub const DNS_RTYPE_RT = 5376;
pub const DNS_RTYPE_NSAP = 5632;
pub const DNS_RTYPE_NSAPPTR = 5888;
pub const DNS_RTYPE_SIG = 6144;
pub const DNS_RTYPE_KEY = 6400;
pub const DNS_RTYPE_PX = 6656;
pub const DNS_RTYPE_GPOS = 6912;
pub const DNS_RTYPE_AAAA = 7168;
pub const DNS_RTYPE_LOC = 7424;
pub const DNS_RTYPE_NXT = 7680;
pub const DNS_RTYPE_EID = 7936;
pub const DNS_RTYPE_NIMLOC = 8192;
pub const DNS_RTYPE_SRV = 8448;
pub const DNS_RTYPE_ATMA = 8704;
pub const DNS_RTYPE_NAPTR = 8960;
pub const DNS_RTYPE_KX = 9216;
pub const DNS_RTYPE_CERT = 9472;
pub const DNS_RTYPE_A6 = 9728;
pub const DNS_RTYPE_DNAME = 9984;
pub const DNS_RTYPE_SINK = 10240;
pub const DNS_RTYPE_OPT = 10496;
pub const DNS_RTYPE_DS = 11008;
pub const DNS_RTYPE_RRSIG = 11776;
pub const DNS_RTYPE_NSEC = 12032;
pub const DNS_RTYPE_DNSKEY = 12288;
pub const DNS_RTYPE_DHCID = 12544;
pub const DNS_RTYPE_NSEC3 = 12800;
pub const DNS_RTYPE_NSEC3PARAM = 13056;
pub const DNS_RTYPE_TLSA = 13312;
pub const DNS_RTYPE_UINFO = 25600;
pub const DNS_RTYPE_UID = 25856;
pub const DNS_RTYPE_GID = 26112;
pub const DNS_RTYPE_UNSPEC = 26368;
pub const DNS_RTYPE_TKEY = 63744;
pub const DNS_RTYPE_TSIG = 64000;
pub const DNS_RTYPE_IXFR = 64256;
pub const DNS_RTYPE_AXFR = 64512;
pub const DNS_RTYPE_MAILB = 64768;
pub const DNS_RTYPE_MAILA = 65024;
pub const DNS_RTYPE_ALL = 65280;
pub const DNS_RTYPE_ANY = 65280;
pub const DNS_RTYPE_WINS = 511;
pub const DNS_RTYPE_WINSR = 767;
pub const DNS_ATMA_FORMAT_E164 = 1;
pub const DNS_ATMA_FORMAT_AESA = 2;
pub const DNS_ATMA_MAX_ADDR_LENGTH = 20;
pub const DNS_ATMA_AESA_ADDR_LENGTH = 20;
pub const DNS_ATMA_MAX_RECORD_LENGTH = 21;
pub const DNSSEC_ALGORITHM_RSAMD5 = 1;
pub const DNSSEC_ALGORITHM_RSASHA1 = 5;
pub const DNSSEC_ALGORITHM_RSASHA1_NSEC3 = 7;
pub const DNSSEC_ALGORITHM_RSASHA256 = 8;
pub const DNSSEC_ALGORITHM_RSASHA512 = 10;
pub const DNSSEC_ALGORITHM_ECDSAP256_SHA256 = 13;
pub const DNSSEC_ALGORITHM_ECDSAP384_SHA384 = 14;
pub const DNSSEC_ALGORITHM_NULL = 253;
pub const DNSSEC_ALGORITHM_PRIVATE = 254;
pub const DNSSEC_DIGEST_ALGORITHM_SHA1 = 1;
pub const DNSSEC_DIGEST_ALGORITHM_SHA256 = 2;
pub const DNSSEC_DIGEST_ALGORITHM_SHA384 = 4;
pub const DNSSEC_PROTOCOL_NONE = 0;
pub const DNSSEC_PROTOCOL_TLS = 1;
pub const DNSSEC_PROTOCOL_EMAIL = 2;
pub const DNSSEC_PROTOCOL_DNSSEC = 3;
pub const DNSSEC_PROTOCOL_IPSEC = 4;
pub const DNSSEC_KEY_FLAG_NOAUTH = 1;
pub const DNSSEC_KEY_FLAG_NOCONF = 2;
pub const DNSSEC_KEY_FLAG_FLAG2 = 4;
pub const DNSSEC_KEY_FLAG_EXTEND = 8;
pub const DNSSEC_KEY_FLAG_FLAG4 = 16;
pub const DNSSEC_KEY_FLAG_FLAG5 = 32;
pub const DNSSEC_KEY_FLAG_USER = 0;
pub const DNSSEC_KEY_FLAG_ZONE = 64;
pub const DNSSEC_KEY_FLAG_HOST = 128;
pub const DNSSEC_KEY_FLAG_NTPE3 = 192;
pub const DNSSEC_KEY_FLAG_FLAG8 = 256;
pub const DNSSEC_KEY_FLAG_FLAG9 = 512;
pub const DNSSEC_KEY_FLAG_FLAG10 = 1024;
pub const DNSSEC_KEY_FLAG_FLAG11 = 2048;
pub const DNSSEC_KEY_FLAG_SIG0 = 0;
pub const DNSSEC_KEY_FLAG_SIG1 = 4096;
pub const DNSSEC_KEY_FLAG_SIG2 = 8192;
pub const DNSSEC_KEY_FLAG_SIG3 = 12288;
pub const DNSSEC_KEY_FLAG_SIG4 = 16384;
pub const DNSSEC_KEY_FLAG_SIG5 = 20480;
pub const DNSSEC_KEY_FLAG_SIG6 = 24576;
pub const DNSSEC_KEY_FLAG_SIG7 = 28672;
pub const DNSSEC_KEY_FLAG_SIG8 = 32768;
pub const DNSSEC_KEY_FLAG_SIG9 = 36864;
pub const DNSSEC_KEY_FLAG_SIG10 = 40960;
pub const DNSSEC_KEY_FLAG_SIG11 = 45056;
pub const DNSSEC_KEY_FLAG_SIG12 = 49152;
pub const DNSSEC_KEY_FLAG_SIG13 = 53248;
pub const DNSSEC_KEY_FLAG_SIG14 = 57344;
pub const DNSSEC_KEY_FLAG_SIG15 = 61440;
pub const DNS_TKEY_MODE_SERVER_ASSIGN = 1;
pub const DNS_TKEY_MODE_DIFFIE_HELLMAN = 2;
pub const DNS_TKEY_MODE_GSS = 3;
pub const DNS_TKEY_MODE_RESOLVER_ASSIGN = 4;
pub const DDR_MAX_IP_HINTS = 4;
pub const DNSREC_SECTION = 3;
pub const DNSREC_QUESTION = 0;
pub const DNSREC_ANSWER = 1;
pub const DNSREC_AUTHORITY = 2;
pub const DNSREC_ADDITIONAL = 3;
pub const DNSREC_ZONE = 0;
pub const DNSREC_PREREQ = 1;
pub const DNSREC_UPDATE = 2;
pub const DNSREC_DELETE = 4;
pub const DNSREC_NOEXIST = 4;
pub const DNS_RFC_MAX_UDP_PACKET_LENGTH = 512;
pub const DNS_MAX_NAME_LENGTH = 255;
pub const DNS_MAX_LABEL_LENGTH = 63;
pub const DNS_MAX_NAME_BUFFER_LENGTH = 256;
pub const DNS_MAX_LABEL_BUFFER_LENGTH = 64;
pub const DNS_CUSTOM_SERVER_TYPE_UDP = 1;
pub const DNS_CUSTOM_SERVER_TYPE_DOH = 2;
pub const DNS_CUSTOM_SERVER_TYPE_DOT = 3;
pub const DNS_CUSTOM_SERVER_UDP_FALLBACK = 1;
pub const DNS_CUSTOM_SERVER_UPGRADE_FROM_WELL_KNOWN_SERVERS = 2;
pub const IP6_ADDRESS_STRING_LENGTH = 65;
pub const IP6_ADDRESS_STRING_BUFFER_LENGTH = 65;
pub const DNS_ADDRESS_STRING_LENGTH = 65;
pub const DNS_PORT_HOST_ORDER = 53;
pub const DNS_PORT_NET_ORDER = 13568;
pub const INTERNET_DEFAULT_DNS_PORT = 53;
pub const INTERNET_DEFAULT_DOT_PORT = 853;
pub const DNS_MAX_IP4_REVERSE_NAME_LENGTH = 31;
pub const DNS_MAX_IP6_REVERSE_NAME_LENGTH = 75;
pub const DNS_MAX_REVERSE_NAME_LENGTH = 75;
pub const DNS_MAX_IP4_REVERSE_NAME_BUFFER_LENGTH = 31;
pub const DNS_MAX_IP6_REVERSE_NAME_BUFFER_LENGTH = 75;
pub const DNS_MAX_REVERSE_NAME_BUFFER_LENGTH = 75;
pub const DNS_MAX_TEXT_STRING_LENGTH = 255;
pub const DNS_COMPRESSED_QUESTION_NAME = 49164;
pub const DNS_OPCODE_QUERY = 0;
pub const DNS_OPCODE_IQUERY = 1;
pub const DNS_OPCODE_SERVER_STATUS = 2;
pub const DNS_OPCODE_UNKNOWN = 3;
pub const DNS_OPCODE_NOTIFY = 4;
pub const DNS_OPCODE_UPDATE = 5;
pub const DNS_RCODE_NOERROR = 0;
pub const DNS_RCODE_FORMERR = 1;
pub const DNS_RCODE_SERVFAIL = 2;
pub const DNS_RCODE_NXDOMAIN = 3;
pub const DNS_RCODE_NOTIMPL = 4;
pub const DNS_RCODE_REFUSED = 5;
pub const DNS_RCODE_YXDOMAIN = 6;
pub const DNS_RCODE_YXRRSET = 7;
pub const DNS_RCODE_NXRRSET = 8;
pub const DNS_RCODE_NOTAUTH = 9;
pub const DNS_RCODE_NOTZONE = 10;
pub const DNS_RCODE_MAX = 15;
pub const DNS_RCODE_BADVERS = 16;
pub const DNS_RCODE_BADSIG = 16;
pub const DNS_RCODE_BADKEY = 17;
pub const DNS_RCODE_BADTIME = 18;
pub const DNS_RCODE_NO_ERROR = 0;
pub const DNS_RCODE_FORMAT_ERROR = 1;
pub const DNS_RCODE_SERVER_FAILURE = 2;
pub const DNS_RCODE_NAME_ERROR = 3;
pub const DNS_RCODE_NOT_IMPLEMENTED = 4;
pub const DNS_CLASS_INTERNET = 1;
pub const DNS_CLASS_CSNET = 2;
pub const DNS_CLASS_CHAOS = 3;
pub const DNS_CLASS_HESIOD = 4;
pub const DNS_CLASS_NONE = 254;
pub const DNS_CLASS_ALL = 255;
pub const DNS_CLASS_ANY = 255;
pub const DNS_CLASS_UNICAST_RESPONSE = 32768;
pub const DNS_RCLASS_INTERNET = 256;
pub const DNS_RCLASS_CSNET = 512;
pub const DNS_RCLASS_CHAOS = 768;
pub const DNS_RCLASS_HESIOD = 1024;
pub const DNS_RCLASS_NONE = 65024;
pub const DNS_RCLASS_ALL = 65280;
pub const DNS_RCLASS_ANY = 65280;
pub const DNS_RCLASS_UNICAST_RESPONSE = 128;
pub const DNS_RCLASS_MDNS_CACHE_FLUSH = 128;
pub const DNS_WINS_FLAG_SCOPE = 2147483648;
pub const DNS_WINS_FLAG_LOCAL = 65536;
pub const DNS_CONFIG_FLAG_ALLOC = 1;
pub const DNS_APP_SETTINGS_VERSION1 = 1;
pub const DNS_APP_SETTINGS_EXCLUSIVE_SERVERS = 1;
pub const DNS_PROTOCOL_UNSPECIFIED = 0;
pub const DNS_PROTOCOL_UDP = 1;
pub const DNS_PROTOCOL_TCP = 2;
pub const DNS_PROTOCOL_DOH = 3;
pub const DNS_PROTOCOL_DOT = 4;
pub const DNS_PROTOCOL_NO_WIRE = 5;
pub const DNS_UPDATE_SECURITY_USE_DEFAULT = 0;
pub const DNS_UPDATE_SECURITY_OFF = 16;
pub const DNS_UPDATE_SECURITY_ON = 32;
pub const DNS_UPDATE_SECURITY_ONLY = 256;
pub const DNS_UPDATE_CACHE_SECURITY_CONTEXT = 512;
pub const DNS_UPDATE_TEST_USE_LOCAL_SYS_ACCT = 1024;
pub const DNS_UPDATE_FORCE_SECURITY_NEGO = 2048;
pub const DNS_UPDATE_TRY_ALL_MASTER_SERVERS = 4096;
pub const DNS_UPDATE_SKIP_NO_UPDATE_ADAPTERS = 8192;
pub const DNS_UPDATE_REMOTE_SERVER = 16384;
pub const DNS_UPDATE_RESERVED = 4294901760;
pub const DNS_VALSVR_ERROR_INVALID_ADDR = 1;
pub const DNS_VALSVR_ERROR_INVALID_NAME = 2;
pub const DNS_VALSVR_ERROR_UNREACHABLE = 3;
pub const DNS_VALSVR_ERROR_NO_RESPONSE = 4;
pub const DNS_VALSVR_ERROR_NO_AUTH = 5;
pub const DNS_VALSVR_ERROR_REFUSED = 6;
pub const DNS_VALSVR_ERROR_NO_TCP = 16;
pub const DNS_VALSVR_ERROR_UNKNOWN = 255;
pub const DNS_CONNECTION_NAME_MAX_LENGTH = 64;
pub const DNS_CONNECTION_PROXY_INFO_CURRENT_VERSION = 1;
pub const DNS_CONNECTION_PROXY_INFO_SERVER_MAX_LENGTH = 256;
pub const DNS_CONNECTION_PROXY_INFO_FRIENDLY_NAME_MAX_LENGTH = 64;
pub const DNS_CONNECTION_PROXY_INFO_USERNAME_MAX_LENGTH = 128;
pub const DNS_CONNECTION_PROXY_INFO_PASSWORD_MAX_LENGTH = 128;
pub const DNS_CONNECTION_PROXY_INFO_EXCEPTION_MAX_LENGTH = 1024;
pub const DNS_CONNECTION_PROXY_INFO_EXTRA_INFO_MAX_LENGTH = 1024;
pub const DNS_CONNECTION_PROXY_INFO_FLAG_DISABLED = 1;
pub const DNS_CONNECTION_PROXY_INFO_FLAG_BYPASSLOCAL = 2;
pub const DNS_CONNECTION_POLICY_ENTRY_ONDEMAND = 1;
pub const DnsSvcbParamMandatory = 0;
pub const DnsSvcbParamAlpn = 1;
pub const DnsSvcbParamNoDefaultAlpn = 2;
pub const DnsSvcbParamPort = 3;
pub const DnsSvcbParamIpv4Hint = 4;
pub const DnsSvcbParamEch = 5;
pub const DnsSvcbParamIpv6Hint = 6;
pub const DnsSvcbParamDohPath = 7;
pub const DnsSvcbParamDohPathOpenDns = 65432;
pub const DnsSectionQuestion = 0;
pub const DnsSectionAnswer = 1;
pub const DnsSectionAuthority = 2;
pub const DnsSectionAddtional = 3;
pub const DnsCharSetUnknown = 0;
pub const DnsCharSetUnicode = 1;
pub const DnsCharSetUtf8 = 2;
pub const DnsCharSetAnsi = 3;
pub const DnsConfigPrimaryDomainName_W = 0;
pub const DnsConfigPrimaryDomainName_A = 1;
pub const DnsConfigPrimaryDomainName_UTF8 = 2;
pub const DnsConfigAdapterDomainName_W = 3;
pub const DnsConfigAdapterDomainName_A = 4;
pub const DnsConfigAdapterDomainName_UTF8 = 5;
pub const DnsConfigDnsServerList = 6;
pub const DnsConfigSearchList = 7;
pub const DnsConfigAdapterInfo = 8;
pub const DnsConfigPrimaryHostNameRegistrationEnabled = 9;
pub const DnsConfigAdapterHostNameRegistrationEnabled = 10;
pub const DnsConfigAddressRegistrationMaxCount = 11;
pub const DnsConfigHostName_W = 12;
pub const DnsConfigHostName_A = 13;
pub const DnsConfigHostName_UTF8 = 14;
pub const DnsConfigFullHostName_W = 15;
pub const DnsConfigFullHostName_A = 16;
pub const DnsConfigFullHostName_UTF8 = 17;
pub const DnsConfigNameServer = 18;
pub const DNS_PROXY_INFORMATION_DIRECT = 0;
pub const DNS_PROXY_INFORMATION_DEFAULT_SETTINGS = 1;
pub const DNS_PROXY_INFORMATION_PROXY_NAME = 2;
pub const DNS_PROXY_INFORMATION_DOES_NOT_EXIST = 3;
pub const DnsFreeFlat = 0;
pub const DnsFreeRecordList = 1;
pub const DnsFreeParsedMessageFields = 2;
pub const DnsNameDomain = 0;
pub const DnsNameDomainLabel = 1;
pub const DnsNameHostnameFull = 2;
pub const DnsNameHostnameLabel = 3;
pub const DnsNameWildcard = 4;
pub const DnsNameSrvRecord = 5;
pub const DnsNameValidateTld = 6;
pub const DNS_CONNECTION_PROXY_TYPE_NULL = 0;
pub const DNS_CONNECTION_PROXY_TYPE_HTTP = 1;
pub const DNS_CONNECTION_PROXY_TYPE_WAP = 2;
pub const DNS_CONNECTION_PROXY_TYPE_SOCKS4 = 4;
pub const DNS_CONNECTION_PROXY_TYPE_SOCKS5 = 5;
pub const DNS_CONNECTION_PROXY_INFO_SWITCH_CONFIG = 0;
pub const DNS_CONNECTION_PROXY_INFO_SWITCH_SCRIPT = 1;
pub const DNS_CONNECTION_PROXY_INFO_SWITCH_WPAD = 2;
pub const TAG_DNS_CONNECTION_POLICY_TAG_DEFAULT = 0;
pub const TAG_DNS_CONNECTION_POLICY_TAG_CONNECTION_MANAGER = 1;
pub const TAG_DNS_CONNECTION_POLICY_TAG_WWWPT = 2;

pub const aliases = struct {
    pub const DNS_QUERY_OPTIONS = u32;
    pub const DNS_SVCB_PARAM_TYPE = i32;
    pub const DNS_SECTION = i32;
    pub const DNS_CHARSET = i32;
    pub const DNS_CONFIG_TYPE = i32;
    pub const DNS_PROXY_INFORMATION_TYPE = i32;
    pub const DNS_FREE_TYPE = i32;
    pub const DNS_NAME_FORMAT = i32;
    pub const DNS_CONNECTION_PROXY_TYPE = i32;
    pub const DNS_CONNECTION_PROXY_INFO_SWITCH = i32;
    pub const DNS_CONNECTION_POLICY_TAG = i32;
    pub const DNS_PROXY_COMPLETION_ROUTINE = ?*const anyopaque;
    pub const PDNS_QUERY_COMPLETION_ROUTINE = ?*const anyopaque;
    pub const DNS_QUERY_RAW_COMPLETION_ROUTINE = ?*const anyopaque;
    pub const PDNS_SERVICE_BROWSE_CALLBACK = ?*const anyopaque;
    pub const PDNS_SERVICE_RESOLVE_COMPLETE = ?*const anyopaque;
    pub const PDNS_SERVICE_REGISTER_COMPLETE = ?*const anyopaque;
    pub const PMDNS_QUERY_CALLBACK = ?*const anyopaque;
};
