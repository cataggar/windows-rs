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
    .{ "WinHttpSetStatusCallback", MethodRecord{ .library = "WINHTTP", .import = "WinHttpSetStatusCallback", .signature = "\x00\x04\x12\xb2\x8d\x0f\x01\x12\xb2\x8d\x09\x19" } },
    .{ "WinHttpTimeFromSystemTime", MethodRecord{ .library = "WINHTTP", .import = "WinHttpTimeFromSystemTime", .signature = "\x00\x02\x11\x59\x0f\x11\x86\x45\x11\x05" } },
    .{ "WinHttpTimeToSystemTime", MethodRecord{ .library = "WINHTTP", .import = "WinHttpTimeToSystemTime", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x11\x86\x45" } },
    .{ "WinHttpCrackUrl", MethodRecord{ .library = "WINHTTP", .import = "WinHttpCrackUrl", .signature = "\x00\x04\x11\x59\x11\x05\x09\x09\x0f\x11\xb2\x91" } },
    .{ "WinHttpCreateUrl", MethodRecord{ .library = "WINHTTP", .import = "WinHttpCreateUrl", .signature = "\x00\x04\x11\x59\x0f\x11\xb2\x91\x11\x97\xa9\x11\x05\x0f\x09" } },
    .{ "WinHttpCheckPlatform", MethodRecord{ .library = "WINHTTP", .import = "WinHttpCheckPlatform", .signature = "\x00\x00\x11\x59" } },
    .{ "WinHttpGetDefaultProxyConfiguration", MethodRecord{ .library = "WINHTTP", .import = "WinHttpGetDefaultProxyConfiguration", .signature = "\x00\x01\x11\x59\x0f\x11\xb2\x95" } },
    .{ "WinHttpSetDefaultProxyConfiguration", MethodRecord{ .library = "WINHTTP", .import = "WinHttpSetDefaultProxyConfiguration", .signature = "\x00\x01\x11\x59\x0f\x11\xb2\x95" } },
    .{ "WinHttpOpen", MethodRecord{ .library = "WINHTTP", .import = "WinHttpOpen", .signature = "\x00\x05\x0f\x01\x11\x05\x11\x97\xad\x11\x05\x11\x05\x09" } },
    .{ "WinHttpCloseHandle", MethodRecord{ .library = "WINHTTP", .import = "WinHttpCloseHandle", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "WinHttpConnect", MethodRecord{ .library = "WINHTTP", .import = "WinHttpConnect", .signature = "\x00\x04\x0f\x01\x0f\x01\x11\x05\x07\x09" } },
    .{ "WinHttpReadData", MethodRecord{ .library = "WINHTTP", .import = "WinHttpReadData", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x01\x09\x0f\x09" } },
    .{ "WinHttpReadDataEx", MethodRecord{ .library = "WINHTTP", .import = "WinHttpReadDataEx", .signature = "\x00\x07\x09\x0f\x01\x0f\x01\x09\x0f\x09\x0b\x09\x0f\x01" } },
    .{ "WinHttpWriteData", MethodRecord{ .library = "WINHTTP", .import = "WinHttpWriteData", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x01\x09\x0f\x09" } },
    .{ "WinHttpQueryDataAvailable", MethodRecord{ .library = "WINHTTP", .import = "WinHttpQueryDataAvailable", .signature = "\x00\x02\x11\x59\x0f\x01\x0f\x09" } },
    .{ "WinHttpQueryOption", MethodRecord{ .library = "WINHTTP", .import = "WinHttpQueryOption", .signature = "\x00\x04\x11\x59\x0f\x01\x09\x0f\x01\x0f\x09" } },
    .{ "WinHttpSetOption", MethodRecord{ .library = "WINHTTP", .import = "WinHttpSetOption", .signature = "\x00\x04\x11\x59\x0f\x01\x09\x0f\x01\x09" } },
    .{ "WinHttpSetTimeouts", MethodRecord{ .library = "WINHTTP", .import = "WinHttpSetTimeouts", .signature = "\x00\x05\x11\x59\x0f\x01\x08\x08\x08\x08" } },
    .{ "WinHttpOpenRequest", MethodRecord{ .library = "WINHTTP", .import = "WinHttpOpenRequest", .signature = "\x00\x07\x0f\x01\x0f\x01\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x11\x05\x11\x97\xa5" } },
    .{ "WinHttpAddRequestHeaders", MethodRecord{ .library = "WINHTTP", .import = "WinHttpAddRequestHeaders", .signature = "\x00\x04\x11\x59\x0f\x01\x11\x05\x09\x09" } },
    .{ "WinHttpAddRequestHeadersEx", MethodRecord{ .library = "WINHTTP", .import = "WinHttpAddRequestHeadersEx", .signature = "\x00\x06\x09\x0f\x01\x09\x0b\x0b\x09\x0f\x11\xb2\x99" } },
    .{ "WinHttpSendRequest", MethodRecord{ .library = "WINHTTP", .import = "WinHttpSendRequest", .signature = "\x00\x07\x11\x59\x0f\x01\x11\x05\x09\x0f\x01\x09\x09\x19" } },
    .{ "WinHttpSetCredentials", MethodRecord{ .library = "WINHTTP", .import = "WinHttpSetCredentials", .signature = "\x00\x06\x11\x59\x0f\x01\x09\x09\x11\x05\x11\x05\x0f\x01" } },
    .{ "WinHttpQueryAuthSchemes", MethodRecord{ .library = "WINHTTP", .import = "WinHttpQueryAuthSchemes", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "WinHttpReceiveResponse", MethodRecord{ .library = "WINHTTP", .import = "WinHttpReceiveResponse", .signature = "\x00\x02\x11\x59\x0f\x01\x0f\x01" } },
    .{ "WinHttpQueryHeaders", MethodRecord{ .library = "WINHTTP", .import = "WinHttpQueryHeaders", .signature = "\x00\x06\x11\x59\x0f\x01\x09\x11\x05\x0f\x01\x0f\x09\x0f\x09" } },
    .{ "WinHttpQueryHeadersEx", MethodRecord{ .library = "WINHTTP", .import = "WinHttpQueryHeadersEx", .signature = "\x00\x0a\x09\x0f\x01\x09\x0b\x09\x0f\x09\x0f\x11\xb2\x9d\x0f\x01\x0f\x09\x0f\x0f\x11\xb2\x99\x0f\x09" } },
    .{ "WinHttpQueryConnectionGroup", MethodRecord{ .library = "WINHTTP", .import = "WinHttpQueryConnectionGroup", .signature = "\x00\x04\x09\x0f\x01\x0f\x11\x0d\x0b\x0f\x0f\x11\xb2\xa1" } },
    .{ "WinHttpFreeQueryConnectionGroupResult", MethodRecord{ .library = "WINHTTP", .import = "WinHttpFreeQueryConnectionGroupResult", .signature = "\x00\x01\x01\x0f\x11\xb2\xa1" } },
    .{ "WinHttpDetectAutoProxyConfigUrl", MethodRecord{ .library = "WINHTTP", .import = "WinHttpDetectAutoProxyConfigUrl", .signature = "\x00\x02\x11\x59\x09\x0f\x11\x05" } },
    .{ "WinHttpGetProxyForUrl", MethodRecord{ .library = "WINHTTP", .import = "WinHttpGetProxyForUrl", .signature = "\x00\x04\x11\x59\x0f\x01\x11\x05\x0f\x11\xb2\xa5\x0f\x11\xb2\x95" } },
    .{ "WinHttpCreateProxyResolver", MethodRecord{ .library = "WINHTTP", .import = "WinHttpCreateProxyResolver", .signature = "\x00\x02\x09\x0f\x01\x0f\x0f\x01" } },
    .{ "WinHttpGetProxyForUrlEx", MethodRecord{ .library = "WINHTTP", .import = "WinHttpGetProxyForUrlEx", .signature = "\x00\x04\x09\x0f\x01\x11\x05\x0f\x11\xb2\xa5\x19" } },
    .{ "WinHttpGetProxyForUrlEx2", MethodRecord{ .library = "WINHTTP", .import = "WinHttpGetProxyForUrlEx2", .signature = "\x00\x06\x09\x0f\x01\x11\x05\x0f\x11\xb2\xa5\x09\x0f\x05\x19" } },
    .{ "WinHttpGetProxyResult", MethodRecord{ .library = "WINHTTP", .import = "WinHttpGetProxyResult", .signature = "\x00\x02\x09\x0f\x01\x0f\x11\xb2\xa9" } },
    .{ "WinHttpGetProxyResultEx", MethodRecord{ .library = "WINHTTP", .import = "WinHttpGetProxyResultEx", .signature = "\x00\x02\x09\x0f\x01\x0f\x11\xb2\xad" } },
    .{ "WinHttpFreeProxyResult", MethodRecord{ .library = "WINHTTP", .import = "WinHttpFreeProxyResult", .signature = "\x00\x01\x01\x0f\x11\xb2\xa9" } },
    .{ "WinHttpFreeProxyResultEx", MethodRecord{ .library = "WINHTTP", .import = "WinHttpFreeProxyResultEx", .signature = "\x00\x01\x01\x0f\x11\xb2\xad" } },
    .{ "WinHttpResetAutoProxy", MethodRecord{ .library = "WINHTTP", .import = "WinHttpResetAutoProxy", .signature = "\x00\x02\x09\x0f\x01\x09" } },
    .{ "WinHttpGetIEProxyConfigForCurrentUser", MethodRecord{ .library = "WINHTTP", .import = "WinHttpGetIEProxyConfigForCurrentUser", .signature = "\x00\x01\x11\x59\x0f\x11\xb2\xb1" } },
    .{ "WinHttpWriteProxySettings", MethodRecord{ .library = "WINHTTP", .import = "WinHttpWriteProxySettings", .signature = "\x00\x03\x09\x0f\x01\x11\x59\x0f\x11\xb2\xb5" } },
    .{ "WinHttpReadProxySettings", MethodRecord{ .library = "WINHTTP", .import = "WinHttpReadProxySettings", .signature = "\x00\x07\x09\x0f\x01\x11\x05\x11\x59\x11\x59\x0f\x09\x0f\x11\x59\x0f\x11\xb2\xb5" } },
    .{ "WinHttpFreeProxySettings", MethodRecord{ .library = "WINHTTP", .import = "WinHttpFreeProxySettings", .signature = "\x00\x01\x01\x0f\x11\xb2\xb5" } },
    .{ "WinHttpGetProxySettingsVersion", MethodRecord{ .library = "WINHTTP", .import = "WinHttpGetProxySettingsVersion", .signature = "\x00\x02\x09\x0f\x01\x0f\x09" } },
    .{ "WinHttpSetProxySettingsPerUser", MethodRecord{ .library = "WINHTTP", .import = "WinHttpSetProxySettingsPerUser", .signature = "\x00\x01\x09\x11\x59" } },
    .{ "WinHttpWebSocketCompleteUpgrade", MethodRecord{ .library = "WINHTTP", .import = "WinHttpWebSocketCompleteUpgrade", .signature = "\x00\x02\x0f\x01\x0f\x01\x19" } },
    .{ "WinHttpWebSocketSend", MethodRecord{ .library = "WINHTTP", .import = "WinHttpWebSocketSend", .signature = "\x00\x04\x09\x0f\x01\x11\xb2\xb9\x0f\x01\x09" } },
    .{ "WinHttpWebSocketReceive", MethodRecord{ .library = "WINHTTP", .import = "WinHttpWebSocketReceive", .signature = "\x00\x05\x09\x0f\x01\x0f\x01\x09\x0f\x09\x0f\x11\xb2\xb9" } },
    .{ "WinHttpWebSocketShutdown", MethodRecord{ .library = "WINHTTP", .import = "WinHttpWebSocketShutdown", .signature = "\x00\x04\x09\x0f\x01\x07\x0f\x01\x09" } },
    .{ "WinHttpWebSocketClose", MethodRecord{ .library = "WINHTTP", .import = "WinHttpWebSocketClose", .signature = "\x00\x04\x09\x0f\x01\x07\x0f\x01\x09" } },
    .{ "WinHttpWebSocketQueryCloseStatus", MethodRecord{ .library = "WINHTTP", .import = "WinHttpWebSocketQueryCloseStatus", .signature = "\x00\x05\x09\x0f\x01\x0f\x07\x0f\x01\x09\x0f\x09" } },
    .{ "WinHttpProtocolCompleteUpgrade", MethodRecord{ .library = "WINHTTP", .import = "WinHttpProtocolCompleteUpgrade", .signature = "\x00\x02\x0f\x01\x0f\x01\x19" } },
    .{ "WinHttpProtocolSend", MethodRecord{ .library = "WINHTTP", .import = "WinHttpProtocolSend", .signature = "\x00\x04\x09\x0f\x01\x0b\x0f\x01\x09" } },
    .{ "WinHttpProtocolReceive", MethodRecord{ .library = "WINHTTP", .import = "WinHttpProtocolReceive", .signature = "\x00\x05\x09\x0f\x01\x0b\x0f\x01\x09\x0f\x09" } },
    .{ "WinHttpRegisterProxyChangeNotification", MethodRecord{ .library = "WINHTTP", .import = "WinHttpRegisterProxyChangeNotification", .signature = "\x00\x04\x09\x0b\x12\xb2\xbd\x0f\x01\x0f\x0f\x01" } },
    .{ "WinHttpUnregisterProxyChangeNotification", MethodRecord{ .library = "WINHTTP", .import = "WinHttpUnregisterProxyChangeNotification", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "WinHttpGetProxySettingsEx", MethodRecord{ .library = "WINHTTP", .import = "WinHttpGetProxySettingsEx", .signature = "\x00\x04\x09\x0f\x01\x11\xb2\xc1\x0f\x11\xb2\xc5\x19" } },
    .{ "WinHttpGetProxySettingsResultEx", MethodRecord{ .library = "WINHTTP", .import = "WinHttpGetProxySettingsResultEx", .signature = "\x00\x02\x09\x0f\x01\x0f\x01" } },
    .{ "WinHttpFreeProxySettingsEx", MethodRecord{ .library = "WINHTTP", .import = "WinHttpFreeProxySettingsEx", .signature = "\x00\x02\x09\x11\xb2\xc1\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x645 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SYSTEMTIME" },
        0x17a5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_OPEN_REQUEST_FLAGS" },
        0x17a9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WIN_HTTP_CREATE_URL_FLAGS" },
        0x17ad => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_ACCESS_TYPE" },
        0x328d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_STATUS_CALLBACK" },
        0x3291 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "URL_COMPONENTS" },
        0x3295 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_PROXY_INFO" },
        0x3299 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_EXTENDED_HEADER" },
        0x329d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_HEADER_NAME" },
        0x32a1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_QUERY_CONNECTION_GROUP_RESULT" },
        0x32a5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_AUTOPROXY_OPTIONS" },
        0x32a9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_PROXY_RESULT" },
        0x32ad => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_PROXY_RESULT_EX" },
        0x32b1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_CURRENT_USER_IE_PROXY_CONFIG" },
        0x32b5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_PROXY_SETTINGS" },
        0x32b9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_WEB_SOCKET_BUFFER_TYPE" },
        0x32bd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_PROXY_CHANGE_CALLBACK" },
        0x32c1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_PROXY_SETTINGS_TYPE" },
        0x32c5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WINHTTP_PROXY_SETTINGS_PARAM" },
        else => null,
    };
}

pub const WINHTTP_FLAG_BYPASS_PROXY_CACHE = 256;
pub const WINHTTP_FLAG_ESCAPE_DISABLE = 64;
pub const WINHTTP_FLAG_ESCAPE_DISABLE_QUERY = 128;
pub const WINHTTP_FLAG_ESCAPE_PERCENT = 4;
pub const WINHTTP_FLAG_NULL_CODEPAGE = 8;
pub const WINHTTP_FLAG_REFRESH = 256;
pub const WINHTTP_FLAG_SECURE = 8388608;
pub const ICU_ESCAPE = 2147483648;
pub const ICU_REJECT_USERPWD = 16384;
pub const ICU_DECODE = 268435456;
pub const WINHTTP_ACCESS_TYPE_NO_PROXY = 1;
pub const WINHTTP_ACCESS_TYPE_DEFAULT_PROXY = 0;
pub const WINHTTP_ACCESS_TYPE_NAMED_PROXY = 3;
pub const WINHTTP_ACCESS_TYPE_AUTOMATIC_PROXY = 4;
pub const WINHTTP_AUTH_SCHEME_BASIC = 1;
pub const WINHTTP_AUTH_SCHEME_NTLM = 2;
pub const WINHTTP_AUTH_SCHEME_NEGOTIATE = 16;
pub const WINHTTP_INTERNET_SCHEME_HTTP = 1;
pub const WINHTTP_INTERNET_SCHEME_HTTPS = 2;
pub const WINHTTP_INTERNET_SCHEME_FTP = 3;
pub const WINHTTP_INTERNET_SCHEME_SOCKS = 4;
pub const HTTPREQUEST_PROXYSETTING_DEFAULT = 0;
pub const HTTPREQUEST_PROXYSETTING_PRECONFIG = 0;
pub const HTTPREQUEST_PROXYSETTING_DIRECT = 1;
pub const HTTPREQUEST_PROXYSETTING_PROXY = 2;
pub const HTTPREQUEST_SETCREDENTIALS_FOR_SERVER = 0;
pub const HTTPREQUEST_SETCREDENTIALS_FOR_PROXY = 1;
pub const INTERNET_DEFAULT_PORT = 0;
pub const INTERNET_DEFAULT_HTTP_PORT = 80;
pub const INTERNET_DEFAULT_HTTPS_PORT = 443;
pub const WINHTTP_FLAG_ASYNC = 268435456;
pub const WINHTTP_FLAG_SECURE_DEFAULTS = 805306368;
pub const WINHTTP_FLAG_AUTOMATIC_CHUNKING = 512;
pub const SECURITY_FLAG_IGNORE_UNKNOWN_CA = 256;
pub const SECURITY_FLAG_IGNORE_CERT_WRONG_USAGE = 512;
pub const SECURITY_FLAG_IGNORE_CERT_CN_INVALID = 4096;
pub const SECURITY_FLAG_IGNORE_CERT_DATE_INVALID = 8192;
pub const WINHTTP_AUTOPROXY_AUTO_DETECT = 1;
pub const WINHTTP_AUTOPROXY_CONFIG_URL = 2;
pub const WINHTTP_AUTOPROXY_HOST_KEEPCASE = 4;
pub const WINHTTP_AUTOPROXY_HOST_LOWERCASE = 8;
pub const WINHTTP_AUTOPROXY_ALLOW_AUTOCONFIG = 256;
pub const WINHTTP_AUTOPROXY_ALLOW_STATIC = 512;
pub const WINHTTP_AUTOPROXY_ALLOW_CM = 1024;
pub const WINHTTP_AUTOPROXY_USE_INTERFACE_CONFIG = 2048;
pub const WINHTTP_AUTOPROXY_RUN_INPROCESS = 65536;
pub const WINHTTP_AUTOPROXY_RUN_OUTPROCESS_ONLY = 131072;
pub const WINHTTP_AUTOPROXY_NO_DIRECTACCESS = 262144;
pub const WINHTTP_AUTOPROXY_NO_CACHE_CLIENT = 524288;
pub const WINHTTP_AUTOPROXY_NO_CACHE_SVC = 1048576;
pub const WINHTTP_AUTOPROXY_SORT_RESULTS = 4194304;
pub const WINHTTP_AUTO_DETECT_TYPE_DHCP = 1;
pub const WINHTTP_AUTO_DETECT_TYPE_DNS_A = 2;
pub const NETWORKING_KEY_BUFSIZE = 128;
pub const WINHTTP_PROXY_TYPE_DIRECT = 1;
pub const WINHTTP_PROXY_TYPE_PROXY = 2;
pub const WINHTTP_PROXY_TYPE_AUTO_PROXY_URL = 4;
pub const WINHTTP_PROXY_TYPE_AUTO_DETECT = 8;
pub const WINHTTP_REQUEST_STAT_FLAG_TCP_FAST_OPEN = 1;
pub const WINHTTP_REQUEST_STAT_FLAG_TLS_SESSION_RESUMPTION = 2;
pub const WINHTTP_REQUEST_STAT_FLAG_TLS_FALSE_START = 4;
pub const WINHTTP_REQUEST_STAT_FLAG_PROXY_TLS_SESSION_RESUMPTION = 8;
pub const WINHTTP_REQUEST_STAT_FLAG_PROXY_TLS_FALSE_START = 16;
pub const WINHTTP_REQUEST_STAT_FLAG_FIRST_REQUEST = 32;
pub const WINHTTP_MATCH_CONNECTION_GUID_FLAG_REQUIRE_MARKED_CONNECTION = 1;
pub const WINHTTP_MATCH_CONNECTION_GUID_FLAGS_MASK = 1;
pub const WINHTTP_RESOLVER_CACHE_CONFIG_FLAG_SOFT_LIMIT = 1;
pub const WINHTTP_RESOLVER_CACHE_CONFIG_FLAG_BYPASS_CACHE = 2;
pub const WINHTTP_RESOLVER_CACHE_CONFIG_FLAG_USE_DNS_TTL = 4;
pub const WINHTTP_RESOLVER_CACHE_CONFIG_FLAG_CONN_USE_TTL = 8;
pub const WINHTTP_TIME_FORMAT_BUFSIZE = 62;
pub const WINHTTP_OPTION_CALLBACK = 1;
pub const WINHTTP_OPTION_RESOLVE_TIMEOUT = 2;
pub const WINHTTP_OPTION_CONNECT_TIMEOUT = 3;
pub const WINHTTP_OPTION_CONNECT_RETRIES = 4;
pub const WINHTTP_OPTION_SEND_TIMEOUT = 5;
pub const WINHTTP_OPTION_RECEIVE_TIMEOUT = 6;
pub const WINHTTP_OPTION_RECEIVE_RESPONSE_TIMEOUT = 7;
pub const WINHTTP_OPTION_HANDLE_TYPE = 9;
pub const WINHTTP_OPTION_READ_BUFFER_SIZE = 12;
pub const WINHTTP_OPTION_WRITE_BUFFER_SIZE = 13;
pub const WINHTTP_OPTION_PARENT_HANDLE = 21;
pub const WINHTTP_OPTION_EXTENDED_ERROR = 24;
pub const WINHTTP_OPTION_SECURITY_FLAGS = 31;
pub const WINHTTP_OPTION_SECURITY_CERTIFICATE_STRUCT = 32;
pub const WINHTTP_OPTION_URL = 34;
pub const WINHTTP_OPTION_SECURITY_KEY_BITNESS = 36;
pub const WINHTTP_OPTION_PROXY = 38;
pub const WINHTTP_OPTION_PROXY_RESULT_ENTRY = 39;
pub const WINHTTP_OPTION_USER_AGENT = 41;
pub const WINHTTP_OPTION_CONTEXT_VALUE = 45;
pub const WINHTTP_OPTION_CLIENT_CERT_CONTEXT = 47;
pub const WINHTTP_OPTION_REQUEST_PRIORITY = 58;
pub const WINHTTP_OPTION_HTTP_VERSION = 59;
pub const WINHTTP_OPTION_DISABLE_FEATURE = 63;
pub const WINHTTP_OPTION_CODEPAGE = 68;
pub const WINHTTP_OPTION_MAX_CONNS_PER_SERVER = 73;
pub const WINHTTP_OPTION_MAX_CONNS_PER_1_0_SERVER = 74;
pub const WINHTTP_OPTION_AUTOLOGON_POLICY = 77;
pub const WINHTTP_OPTION_SERVER_CERT_CONTEXT = 78;
pub const WINHTTP_OPTION_ENABLE_FEATURE = 79;
pub const WINHTTP_OPTION_WORKER_THREAD_COUNT = 80;
pub const WINHTTP_OPTION_PASSPORT_COBRANDING_TEXT = 81;
pub const WINHTTP_OPTION_PASSPORT_COBRANDING_URL = 82;
pub const WINHTTP_OPTION_CONFIGURE_PASSPORT_AUTH = 83;
pub const WINHTTP_OPTION_SECURE_PROTOCOLS = 84;
pub const WINHTTP_OPTION_ENABLETRACING = 85;
pub const WINHTTP_OPTION_PASSPORT_SIGN_OUT = 86;
pub const WINHTTP_OPTION_PASSPORT_RETURN_URL = 87;
pub const WINHTTP_OPTION_REDIRECT_POLICY = 88;
pub const WINHTTP_OPTION_MAX_HTTP_AUTOMATIC_REDIRECTS = 89;
pub const WINHTTP_OPTION_MAX_HTTP_STATUS_CONTINUE = 90;
pub const WINHTTP_OPTION_MAX_RESPONSE_HEADER_SIZE = 91;
pub const WINHTTP_OPTION_MAX_RESPONSE_DRAIN_SIZE = 92;
pub const WINHTTP_OPTION_CONNECTION_INFO = 93;
pub const WINHTTP_OPTION_CLIENT_CERT_ISSUER_LIST = 94;
pub const WINHTTP_OPTION_SPN = 96;
pub const WINHTTP_OPTION_GLOBAL_PROXY_CREDS = 97;
pub const WINHTTP_OPTION_GLOBAL_SERVER_CREDS = 98;
pub const WINHTTP_OPTION_UNLOAD_NOTIFY_EVENT = 99;
pub const WINHTTP_OPTION_REJECT_USERPWD_IN_URL = 100;
pub const WINHTTP_OPTION_USE_GLOBAL_SERVER_CREDENTIALS = 101;
pub const WINHTTP_OPTION_RECEIVE_PROXY_CONNECT_RESPONSE = 103;
pub const WINHTTP_OPTION_IS_PROXY_CONNECT_RESPONSE = 104;
pub const WINHTTP_OPTION_NETWORK_INTERFACE_AFFINITY = 105;
pub const WINHTTP_OPTION_SERVER_SPN_USED = 106;
pub const WINHTTP_OPTION_PROXY_SPN_USED = 107;
pub const WINHTTP_OPTION_SERVER_CBT = 108;
pub const WINHTTP_OPTION_UNSAFE_HEADER_PARSING = 110;
pub const WINHTTP_OPTION_ASSURED_NON_BLOCKING_CALLBACKS = 111;
pub const WINHTTP_OPTION_UPGRADE_TO_WEB_SOCKET = 114;
pub const WINHTTP_OPTION_WEB_SOCKET_CLOSE_TIMEOUT = 115;
pub const WINHTTP_OPTION_WEB_SOCKET_KEEPALIVE_INTERVAL = 116;
pub const WINHTTP_OPTION_DECOMPRESSION = 118;
pub const WINHTTP_OPTION_WEB_SOCKET_RECEIVE_BUFFER_SIZE = 122;
pub const WINHTTP_OPTION_WEB_SOCKET_SEND_BUFFER_SIZE = 123;
pub const WINHTTP_OPTION_TCP_PRIORITY_HINT = 128;
pub const WINHTTP_OPTION_CONNECTION_FILTER = 131;
pub const WINHTTP_OPTION_ENABLE_HTTP_PROTOCOL = 133;
pub const WINHTTP_OPTION_HTTP_PROTOCOL_USED = 134;
pub const WINHTTP_OPTION_KDC_PROXY_SETTINGS = 136;
pub const WINHTTP_OPTION_PROXY_DISABLE_SERVICE_CALLS = 137;
pub const WINHTTP_OPTION_ENCODE_EXTRA = 138;
pub const WINHTTP_OPTION_DISABLE_STREAM_QUEUE = 139;
pub const WINHTTP_OPTION_IPV6_FAST_FALLBACK = 140;
pub const WINHTTP_OPTION_CONNECTION_STATS_V0 = 141;
pub const WINHTTP_OPTION_REQUEST_TIMES = 142;
pub const WINHTTP_OPTION_EXPIRE_CONNECTION = 143;
pub const WINHTTP_OPTION_DISABLE_SECURE_PROTOCOL_FALLBACK = 144;
pub const WINHTTP_OPTION_HTTP_PROTOCOL_REQUIRED = 145;
pub const WINHTTP_OPTION_REQUEST_STATS = 146;
pub const WINHTTP_OPTION_SERVER_CERT_CHAIN_CONTEXT = 147;
pub const WINHTTP_OPTION_SERVER_CERT_CHAIN_BUILD_FLAGS = 148;
pub const WINHTTP_OPTION_CONNECTION_STATS_V1 = 150;
pub const WINHTTP_OPTION_SECURITY_INFO = 151;
pub const WINHTTP_OPTION_TCP_KEEPALIVE = 152;
pub const WINHTTP_OPTION_TCP_FAST_OPEN = 153;
pub const WINHTTP_OPTION_TLS_FALSE_START = 154;
pub const WINHTTP_OPTION_IGNORE_CERT_REVOCATION_OFFLINE = 155;
pub const WINHTTP_OPTION_TLS_PROTOCOL_INSECURE_FALLBACK = 158;
pub const WINHTTP_OPTION_STREAM_ERROR_CODE = 159;
pub const WINHTTP_OPTION_REQUIRE_STREAM_END = 160;
pub const WINHTTP_OPTION_ENABLE_HTTP2_PLUS_CLIENT_CERT = 161;
pub const WINHTTP_OPTION_FAILED_CONNECTION_RETRIES = 162;
pub const WINHTTP_OPTION_HTTP2_KEEPALIVE = 164;
pub const WINHTTP_OPTION_RESOLUTION_HOSTNAME = 165;
pub const WINHTTP_OPTION_SET_TOKEN_BINDING = 166;
pub const WINHTTP_OPTION_TOKEN_BINDING_PUBLIC_KEY = 167;
pub const WINHTTP_OPTION_REFERER_TOKEN_BINDING_HOSTNAME = 168;
pub const WINHTTP_OPTION_HTTP2_PLUS_TRANSFER_ENCODING = 169;
pub const WINHTTP_OPTION_RESOLVER_CACHE_CONFIG = 170;
pub const WINHTTP_OPTION_DISABLE_CERT_CHAIN_BUILDING = 171;
pub const WINHTTP_OPTION_BACKGROUND_CONNECTIONS = 172;
pub const WINHTTP_OPTION_FIRST_AVAILABLE_CONNECTION = 173;
pub const WINHTTP_OPTION_TCP_PRIORITY_STATUS = 177;
pub const WINHTTP_OPTION_CONNECTION_GUID = 178;
pub const WINHTTP_OPTION_MATCH_CONNECTION_GUID = 179;
pub const WINHTTP_OPTION_HTTP2_RECEIVE_WINDOW = 183;
pub const WINHTTP_OPTION_FEATURE_SUPPORTED = 184;
pub const WINHTTP_OPTION_QUIC_STATS = 185;
pub const WINHTTP_OPTION_HTTP3_KEEPALIVE = 188;
pub const WINHTTP_OPTION_HTTP3_HANDSHAKE_TIMEOUT = 189;
pub const WINHTTP_OPTION_HTTP3_INITIAL_RTT = 190;
pub const WINHTTP_OPTION_HTTP3_STREAM_ERROR_CODE = 191;
pub const WINHTTP_OPTION_REQUEST_ANNOTATION = 192;
pub const WINHTTP_OPTION_DISABLE_PROXY_AUTH_SCHEMES = 193;
pub const WINHTTP_OPTION_REVERT_IMPERSONATION_SERVER_CERT = 194;
pub const WINHTTP_OPTION_DISABLE_GLOBAL_POOLING = 195;
pub const WINHTTP_OPTION_USE_SESSION_SCH_CRED = 196;
pub const WINHTTP_OPTION_SERVER_CERT_CHAIN_BUILD_CACHE_ONLY = 199;
pub const WINHTTP_OPTION_QUIC_STATS_V2 = 200;
pub const WINHTTP_OPTION_QUIC_STREAM_STATS = 202;
pub const WINHTTP_OPTION_USE_LOOKASIDE = 203;
pub const WINHTTP_OPTION_ERROR_LOG_GUID = 204;
pub const WINHTTP_OPTION_ENABLE_FAST_FORWARDING = 205;
pub const WINHTTP_OPTION_FAST_FORWARDING_RESPONSE_DATA = 206;
pub const WINHTTP_OPTION_UPGRADE_TO_PROTOCOL = 207;
pub const WINHTTP_OPTION_CONNECTION_STATS_V2 = 208;
pub const WINHTTP_OPTION_FAST_FORWARDING_RESPONSE_STATUS = 209;
pub const WINHTTP_OPTION_DSCP_TAG = 210;
pub const WINHTTP_OPTION_HTTP11_DOWNGRADE_TTL = 211;
pub const WINHTTP_OPTION_SESSION_ERROR_LOG_GUID = 212;
pub const WINHTTP_LAST_OPTION = 212;
pub const WINHTTP_OPTION_USERNAME = 4096;
pub const WINHTTP_OPTION_PASSWORD = 4097;
pub const WINHTTP_OPTION_PROXY_USERNAME = 4098;
pub const WINHTTP_OPTION_PROXY_PASSWORD = 4099;
pub const WINHTTP_CONNS_PER_SERVER_UNLIMITED = 4294967295;
pub const WINHTTP_CONNECTION_RETRY_CONDITION_408 = 1;
pub const WINHTTP_CONNECTION_RETRY_CONDITION_SSL_HANDSHAKE = 2;
pub const WINHTTP_CONNECTION_RETRY_CONDITION_STALE_CONNECTION = 4;
pub const WINHTTP_DECOMPRESSION_FLAG_GZIP = 1;
pub const WINHTTP_DECOMPRESSION_FLAG_DEFLATE = 2;
pub const WINHTTP_PROTOCOL_FLAG_HTTP2 = 1;
pub const WINHTTP_PROTOCOL_FLAG_HTTP3 = 2;
pub const WINHTTP_OPTION_REQUEST_ANNOTATION_MAX_LENGTH = 64000;
pub const WINHTTP_AUTOLOGON_SECURITY_LEVEL_MEDIUM = 0;
pub const WINHTTP_AUTOLOGON_SECURITY_LEVEL_LOW = 1;
pub const WINHTTP_AUTOLOGON_SECURITY_LEVEL_HIGH = 2;
pub const WINHTTP_AUTOLOGON_SECURITY_LEVEL_PROXY_ONLY = 3;
pub const WINHTTP_AUTOLOGON_SECURITY_LEVEL_DEFAULT = 0;
pub const WINHTTP_AUTOLOGON_SECURITY_LEVEL_MAX = 3;
pub const WINHTTP_OPTION_REDIRECT_POLICY_NEVER = 0;
pub const WINHTTP_OPTION_REDIRECT_POLICY_DISALLOW_HTTPS_TO_HTTP = 1;
pub const WINHTTP_OPTION_REDIRECT_POLICY_ALWAYS = 2;
pub const WINHTTP_OPTION_REDIRECT_POLICY_LAST = 2;
pub const WINHTTP_OPTION_REDIRECT_POLICY_DEFAULT = 1;
pub const WINHTTP_DISABLE_PASSPORT_AUTH = 0;
pub const WINHTTP_ENABLE_PASSPORT_AUTH = 268435456;
pub const WINHTTP_DISABLE_PASSPORT_KEYRING = 536870912;
pub const WINHTTP_ENABLE_PASSPORT_KEYRING = 1073741824;
pub const WINHTTP_PROXY_DISABLE_SCHEME_BASIC = 1;
pub const WINHTTP_PROXY_DISABLE_SCHEME_DIGEST = 2;
pub const WINHTTP_PROXY_DISABLE_SCHEME_NTLM = 4;
pub const WINHTTP_PROXY_DISABLE_SCHEME_KERBEROS = 8;
pub const WINHTTP_PROXY_DISABLE_SCHEME_NEGOTIATE = 16;
pub const WINHTTP_PROXY_DISABLE_AUTH_LOCAL_SERVICE = 256;
pub const WINHTTP_SERVER_CERT_CHAIN_CACHE_ONLY_URL_RETRIEVAL = 4;
pub const WINHTTP_SERVER_CERT_CHAIN_DISABLE_AIA = 8192;
pub const WINHTTP_SERVER_CERT_CHAIN_REVOCATION_CHECK_CACHE_ONLY = 2147483648;
pub const WINHTTP_DISABLE_COOKIES = 1;
pub const WINHTTP_DISABLE_REDIRECTS = 2;
pub const WINHTTP_DISABLE_AUTHENTICATION = 4;
pub const WINHTTP_DISABLE_KEEP_ALIVE = 8;
pub const WINHTTP_ENABLE_SSL_REVOCATION = 1;
pub const WINHTTP_ENABLE_SSL_REVERT_IMPERSONATION = 2;
pub const WINHTTP_DISABLE_SPN_SERVER_PORT = 0;
pub const WINHTTP_ENABLE_SPN_SERVER_PORT = 1;
pub const WINHTTP_OPTION_SPN_MASK = 1;
pub const WINHTTP_HANDLE_TYPE_SESSION = 1;
pub const WINHTTP_HANDLE_TYPE_CONNECT = 2;
pub const WINHTTP_HANDLE_TYPE_REQUEST = 3;
pub const WINHTTP_HANDLE_TYPE_PROXY_RESOLVER = 4;
pub const WINHTTP_HANDLE_TYPE_WEBSOCKET = 5;
pub const WINHTTP_HANDLE_TYPE_PROTOCOL = 6;
pub const WINHTTP_AUTH_SCHEME_PASSPORT = 4;
pub const WINHTTP_AUTH_SCHEME_DIGEST = 8;
pub const WINHTTP_AUTH_TARGET_SERVER = 0;
pub const WINHTTP_AUTH_TARGET_PROXY = 1;
pub const SECURITY_FLAG_SECURE = 1;
pub const SECURITY_FLAG_STRENGTH_WEAK = 268435456;
pub const SECURITY_FLAG_STRENGTH_MEDIUM = 1073741824;
pub const SECURITY_FLAG_STRENGTH_STRONG = 536870912;
pub const WINHTTP_CALLBACK_STATUS_FLAG_CERT_REV_FAILED = 1;
pub const WINHTTP_CALLBACK_STATUS_FLAG_INVALID_CERT = 2;
pub const WINHTTP_CALLBACK_STATUS_FLAG_CERT_REVOKED = 4;
pub const WINHTTP_CALLBACK_STATUS_FLAG_INVALID_CA = 8;
pub const WINHTTP_CALLBACK_STATUS_FLAG_CERT_CN_INVALID = 16;
pub const WINHTTP_CALLBACK_STATUS_FLAG_CERT_DATE_INVALID = 32;
pub const WINHTTP_CALLBACK_STATUS_FLAG_CERT_WRONG_USAGE = 64;
pub const WINHTTP_CALLBACK_STATUS_FLAG_SECURITY_CHANNEL_ERROR = 2147483648;
pub const WINHTTP_FLAG_SECURE_PROTOCOL_SSL2 = 8;
pub const WINHTTP_FLAG_SECURE_PROTOCOL_SSL3 = 32;
pub const WINHTTP_FLAG_SECURE_PROTOCOL_TLS1 = 128;
pub const WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_1 = 512;
pub const WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_2 = 2048;
pub const WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_3 = 8192;
pub const WINHTTP_CALLBACK_STATUS_RESOLVING_NAME = 1;
pub const WINHTTP_CALLBACK_STATUS_NAME_RESOLVED = 2;
pub const WINHTTP_CALLBACK_STATUS_CONNECTING_TO_SERVER = 4;
pub const WINHTTP_CALLBACK_STATUS_CONNECTED_TO_SERVER = 8;
pub const WINHTTP_CALLBACK_STATUS_SENDING_REQUEST = 16;
pub const WINHTTP_CALLBACK_STATUS_REQUEST_SENT = 32;
pub const WINHTTP_CALLBACK_STATUS_RECEIVING_RESPONSE = 64;
pub const WINHTTP_CALLBACK_STATUS_RESPONSE_RECEIVED = 128;
pub const WINHTTP_CALLBACK_STATUS_CLOSING_CONNECTION = 256;
pub const WINHTTP_CALLBACK_STATUS_CONNECTION_CLOSED = 512;
pub const WINHTTP_CALLBACK_STATUS_HANDLE_CREATED = 1024;
pub const WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING = 2048;
pub const WINHTTP_CALLBACK_STATUS_DETECTING_PROXY = 4096;
pub const WINHTTP_CALLBACK_STATUS_REDIRECT = 16384;
pub const WINHTTP_CALLBACK_STATUS_INTERMEDIATE_RESPONSE = 32768;
pub const WINHTTP_CALLBACK_STATUS_SECURE_FAILURE = 65536;
pub const WINHTTP_CALLBACK_STATUS_HEADERS_AVAILABLE = 131072;
pub const WINHTTP_CALLBACK_STATUS_DATA_AVAILABLE = 262144;
pub const WINHTTP_CALLBACK_STATUS_READ_COMPLETE = 524288;
pub const WINHTTP_CALLBACK_STATUS_WRITE_COMPLETE = 1048576;
pub const WINHTTP_CALLBACK_STATUS_REQUEST_ERROR = 2097152;
pub const WINHTTP_CALLBACK_STATUS_SENDREQUEST_COMPLETE = 4194304;
pub const WINHTTP_CALLBACK_STATUS_GETPROXYFORURL_COMPLETE = 16777216;
pub const WINHTTP_CALLBACK_STATUS_CLOSE_COMPLETE = 33554432;
pub const WINHTTP_CALLBACK_STATUS_SHUTDOWN_COMPLETE = 67108864;
pub const WINHTTP_CALLBACK_STATUS_GETPROXYSETTINGS_COMPLETE = 134217728;
pub const WINHTTP_CALLBACK_STATUS_SETTINGS_WRITE_COMPLETE = 268435456;
pub const WINHTTP_CALLBACK_STATUS_SETTINGS_READ_COMPLETE = 536870912;
pub const API_RECEIVE_RESPONSE = 1;
pub const API_QUERY_DATA_AVAILABLE = 2;
pub const API_READ_DATA = 3;
pub const API_WRITE_DATA = 4;
pub const API_SEND_REQUEST = 5;
pub const API_GET_PROXY_FOR_URL = 6;
pub const API_GET_PROXY_SETTINGS = 7;
pub const WINHTTP_CALLBACK_FLAG_DETECTING_PROXY = 4096;
pub const WINHTTP_CALLBACK_FLAG_REDIRECT = 16384;
pub const WINHTTP_CALLBACK_FLAG_INTERMEDIATE_RESPONSE = 32768;
pub const WINHTTP_CALLBACK_FLAG_SECURE_FAILURE = 65536;
pub const WINHTTP_CALLBACK_FLAG_SENDREQUEST_COMPLETE = 4194304;
pub const WINHTTP_CALLBACK_FLAG_HEADERS_AVAILABLE = 131072;
pub const WINHTTP_CALLBACK_FLAG_DATA_AVAILABLE = 262144;
pub const WINHTTP_CALLBACK_FLAG_READ_COMPLETE = 524288;
pub const WINHTTP_CALLBACK_FLAG_WRITE_COMPLETE = 1048576;
pub const WINHTTP_CALLBACK_FLAG_REQUEST_ERROR = 2097152;
pub const WINHTTP_CALLBACK_FLAG_GETPROXYFORURL_COMPLETE = 16777216;
pub const WINHTTP_CALLBACK_FLAG_GETPROXYSETTINGS_COMPLETE = 134217728;
pub const WINHTTP_CALLBACK_FLAG_ALL_NOTIFICATIONS = 4294967295;
pub const WINHTTP_QUERY_MIME_VERSION = 0;
pub const WINHTTP_QUERY_CONTENT_TYPE = 1;
pub const WINHTTP_QUERY_CONTENT_TRANSFER_ENCODING = 2;
pub const WINHTTP_QUERY_CONTENT_ID = 3;
pub const WINHTTP_QUERY_CONTENT_DESCRIPTION = 4;
pub const WINHTTP_QUERY_CONTENT_LENGTH = 5;
pub const WINHTTP_QUERY_CONTENT_LANGUAGE = 6;
pub const WINHTTP_QUERY_ALLOW = 7;
pub const WINHTTP_QUERY_PUBLIC = 8;
pub const WINHTTP_QUERY_DATE = 9;
pub const WINHTTP_QUERY_EXPIRES = 10;
pub const WINHTTP_QUERY_LAST_MODIFIED = 11;
pub const WINHTTP_QUERY_MESSAGE_ID = 12;
pub const WINHTTP_QUERY_URI = 13;
pub const WINHTTP_QUERY_DERIVED_FROM = 14;
pub const WINHTTP_QUERY_COST = 15;
pub const WINHTTP_QUERY_LINK = 16;
pub const WINHTTP_QUERY_PRAGMA = 17;
pub const WINHTTP_QUERY_VERSION = 18;
pub const WINHTTP_QUERY_STATUS_CODE = 19;
pub const WINHTTP_QUERY_STATUS_TEXT = 20;
pub const WINHTTP_QUERY_RAW_HEADERS = 21;
pub const WINHTTP_QUERY_RAW_HEADERS_CRLF = 22;
pub const WINHTTP_QUERY_CONNECTION = 23;
pub const WINHTTP_QUERY_ACCEPT = 24;
pub const WINHTTP_QUERY_ACCEPT_CHARSET = 25;
pub const WINHTTP_QUERY_ACCEPT_ENCODING = 26;
pub const WINHTTP_QUERY_ACCEPT_LANGUAGE = 27;
pub const WINHTTP_QUERY_AUTHORIZATION = 28;
pub const WINHTTP_QUERY_CONTENT_ENCODING = 29;
pub const WINHTTP_QUERY_FORWARDED = 30;
pub const WINHTTP_QUERY_FROM = 31;
pub const WINHTTP_QUERY_IF_MODIFIED_SINCE = 32;
pub const WINHTTP_QUERY_LOCATION = 33;
pub const WINHTTP_QUERY_ORIG_URI = 34;
pub const WINHTTP_QUERY_REFERER = 35;
pub const WINHTTP_QUERY_RETRY_AFTER = 36;
pub const WINHTTP_QUERY_SERVER = 37;
pub const WINHTTP_QUERY_TITLE = 38;
pub const WINHTTP_QUERY_USER_AGENT = 39;
pub const WINHTTP_QUERY_WWW_AUTHENTICATE = 40;
pub const WINHTTP_QUERY_PROXY_AUTHENTICATE = 41;
pub const WINHTTP_QUERY_ACCEPT_RANGES = 42;
pub const WINHTTP_QUERY_SET_COOKIE = 43;
pub const WINHTTP_QUERY_COOKIE = 44;
pub const WINHTTP_QUERY_REQUEST_METHOD = 45;
pub const WINHTTP_QUERY_REFRESH = 46;
pub const WINHTTP_QUERY_CONTENT_DISPOSITION = 47;
pub const WINHTTP_QUERY_AGE = 48;
pub const WINHTTP_QUERY_CACHE_CONTROL = 49;
pub const WINHTTP_QUERY_CONTENT_BASE = 50;
pub const WINHTTP_QUERY_CONTENT_LOCATION = 51;
pub const WINHTTP_QUERY_CONTENT_MD5 = 52;
pub const WINHTTP_QUERY_CONTENT_RANGE = 53;
pub const WINHTTP_QUERY_ETAG = 54;
pub const WINHTTP_QUERY_HOST = 55;
pub const WINHTTP_QUERY_IF_MATCH = 56;
pub const WINHTTP_QUERY_IF_NONE_MATCH = 57;
pub const WINHTTP_QUERY_IF_RANGE = 58;
pub const WINHTTP_QUERY_IF_UNMODIFIED_SINCE = 59;
pub const WINHTTP_QUERY_MAX_FORWARDS = 60;
pub const WINHTTP_QUERY_PROXY_AUTHORIZATION = 61;
pub const WINHTTP_QUERY_RANGE = 62;
pub const WINHTTP_QUERY_TRANSFER_ENCODING = 63;
pub const WINHTTP_QUERY_UPGRADE = 64;
pub const WINHTTP_QUERY_VARY = 65;
pub const WINHTTP_QUERY_VIA = 66;
pub const WINHTTP_QUERY_WARNING = 67;
pub const WINHTTP_QUERY_EXPECT = 68;
pub const WINHTTP_QUERY_PROXY_CONNECTION = 69;
pub const WINHTTP_QUERY_UNLESS_MODIFIED_SINCE = 70;
pub const WINHTTP_QUERY_PROXY_SUPPORT = 75;
pub const WINHTTP_QUERY_AUTHENTICATION_INFO = 76;
pub const WINHTTP_QUERY_PASSPORT_URLS = 77;
pub const WINHTTP_QUERY_PASSPORT_CONFIG = 78;
pub const WINHTTP_QUERY_MAX = 78;
pub const WINHTTP_QUERY_EX_ALL_HEADERS = 21;
pub const WINHTTP_QUERY_CUSTOM = 65535;
pub const WINHTTP_QUERY_FLAG_REQUEST_HEADERS = 2147483648;
pub const WINHTTP_QUERY_FLAG_SYSTEMTIME = 1073741824;
pub const WINHTTP_QUERY_FLAG_NUMBER = 536870912;
pub const WINHTTP_QUERY_FLAG_NUMBER64 = 134217728;
pub const WINHTTP_QUERY_FLAG_TRAILERS = 33554432;
pub const WINHTTP_QUERY_FLAG_WIRE_ENCODING = 16777216;
pub const HTTP_STATUS_CONTINUE = 100;
pub const HTTP_STATUS_SWITCH_PROTOCOLS = 101;
pub const HTTP_STATUS_OK = 200;
pub const HTTP_STATUS_CREATED = 201;
pub const HTTP_STATUS_ACCEPTED = 202;
pub const HTTP_STATUS_PARTIAL = 203;
pub const HTTP_STATUS_NO_CONTENT = 204;
pub const HTTP_STATUS_RESET_CONTENT = 205;
pub const HTTP_STATUS_PARTIAL_CONTENT = 206;
pub const HTTP_STATUS_WEBDAV_MULTI_STATUS = 207;
pub const HTTP_STATUS_AMBIGUOUS = 300;
pub const HTTP_STATUS_MOVED = 301;
pub const HTTP_STATUS_REDIRECT = 302;
pub const HTTP_STATUS_REDIRECT_METHOD = 303;
pub const HTTP_STATUS_NOT_MODIFIED = 304;
pub const HTTP_STATUS_USE_PROXY = 305;
pub const HTTP_STATUS_REDIRECT_KEEP_VERB = 307;
pub const HTTP_STATUS_PERMANENT_REDIRECT = 308;
pub const HTTP_STATUS_BAD_REQUEST = 400;
pub const HTTP_STATUS_DENIED = 401;
pub const HTTP_STATUS_PAYMENT_REQ = 402;
pub const HTTP_STATUS_FORBIDDEN = 403;
pub const HTTP_STATUS_NOT_FOUND = 404;
pub const HTTP_STATUS_BAD_METHOD = 405;
pub const HTTP_STATUS_NONE_ACCEPTABLE = 406;
pub const HTTP_STATUS_PROXY_AUTH_REQ = 407;
pub const HTTP_STATUS_REQUEST_TIMEOUT = 408;
pub const HTTP_STATUS_CONFLICT = 409;
pub const HTTP_STATUS_GONE = 410;
pub const HTTP_STATUS_LENGTH_REQUIRED = 411;
pub const HTTP_STATUS_PRECOND_FAILED = 412;
pub const HTTP_STATUS_REQUEST_TOO_LARGE = 413;
pub const HTTP_STATUS_URI_TOO_LONG = 414;
pub const HTTP_STATUS_UNSUPPORTED_MEDIA = 415;
pub const HTTP_STATUS_RETRY_WITH = 449;
pub const HTTP_STATUS_SERVER_ERROR = 500;
pub const HTTP_STATUS_NOT_SUPPORTED = 501;
pub const HTTP_STATUS_BAD_GATEWAY = 502;
pub const HTTP_STATUS_SERVICE_UNAVAIL = 503;
pub const HTTP_STATUS_GATEWAY_TIMEOUT = 504;
pub const HTTP_STATUS_VERSION_NOT_SUP = 505;
pub const HTTP_STATUS_FIRST = 100;
pub const HTTP_STATUS_LAST = 505;
pub const ICU_NO_ENCODE = 536870912;
pub const ICU_NO_META = 134217728;
pub const ICU_ENCODE_SPACES_ONLY = 67108864;
pub const ICU_BROWSER_MODE = 33554432;
pub const ICU_ENCODE_PERCENT = 4096;
pub const ICU_INCLUDE_DEFAULT_PORT = 32768;
pub const ICU_ESCAPE_AUTHORITY = 8192;
pub const WINHTTP_ADDREQ_INDEX_MASK = 65535;
pub const WINHTTP_ADDREQ_FLAGS_MASK = 4294901760;
pub const WINHTTP_ADDREQ_FLAG_ADD_IF_NEW = 268435456;
pub const WINHTTP_ADDREQ_FLAG_ADD = 536870912;
pub const WINHTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA = 1073741824;
pub const WINHTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON = 16777216;
pub const WINHTTP_ADDREQ_FLAG_COALESCE = 1073741824;
pub const WINHTTP_ADDREQ_FLAG_REPLACE = 2147483648;
pub const WINHTTP_EXTENDED_HEADER_FLAG_UNICODE = 1;
pub const WINHTTP_IGNORE_REQUEST_TOTAL_LENGTH = 0;
pub const WINHTTP_ERROR_BASE = 12000;
pub const ERROR_WINHTTP_OUT_OF_HANDLES = 12001;
pub const ERROR_WINHTTP_TIMEOUT = 12002;
pub const ERROR_WINHTTP_INTERNAL_ERROR = 12004;
pub const ERROR_WINHTTP_INVALID_URL = 12005;
pub const ERROR_WINHTTP_UNRECOGNIZED_SCHEME = 12006;
pub const ERROR_WINHTTP_NAME_NOT_RESOLVED = 12007;
pub const ERROR_WINHTTP_INVALID_OPTION = 12009;
pub const ERROR_WINHTTP_OPTION_NOT_SETTABLE = 12011;
pub const ERROR_WINHTTP_SHUTDOWN = 12012;
pub const ERROR_WINHTTP_LOGIN_FAILURE = 12015;
pub const ERROR_WINHTTP_OPERATION_CANCELLED = 12017;
pub const ERROR_WINHTTP_INCORRECT_HANDLE_TYPE = 12018;
pub const ERROR_WINHTTP_INCORRECT_HANDLE_STATE = 12019;
pub const ERROR_WINHTTP_CANNOT_CONNECT = 12029;
pub const ERROR_WINHTTP_CONNECTION_ERROR = 12030;
pub const ERROR_WINHTTP_RESEND_REQUEST = 12032;
pub const ERROR_WINHTTP_CLIENT_AUTH_CERT_NEEDED = 12044;
pub const ERROR_WINHTTP_CANNOT_CALL_BEFORE_OPEN = 12100;
pub const ERROR_WINHTTP_CANNOT_CALL_BEFORE_SEND = 12101;
pub const ERROR_WINHTTP_CANNOT_CALL_AFTER_SEND = 12102;
pub const ERROR_WINHTTP_CANNOT_CALL_AFTER_OPEN = 12103;
pub const ERROR_WINHTTP_HEADER_NOT_FOUND = 12150;
pub const ERROR_WINHTTP_INVALID_SERVER_RESPONSE = 12152;
pub const ERROR_WINHTTP_INVALID_HEADER = 12153;
pub const ERROR_WINHTTP_INVALID_QUERY_REQUEST = 12154;
pub const ERROR_WINHTTP_HEADER_ALREADY_EXISTS = 12155;
pub const ERROR_WINHTTP_REDIRECT_FAILED = 12156;
pub const ERROR_WINHTTP_AUTO_PROXY_SERVICE_ERROR = 12178;
pub const ERROR_WINHTTP_BAD_AUTO_PROXY_SCRIPT = 12166;
pub const ERROR_WINHTTP_UNABLE_TO_DOWNLOAD_SCRIPT = 12167;
pub const ERROR_WINHTTP_UNHANDLED_SCRIPT_TYPE = 12176;
pub const ERROR_WINHTTP_SCRIPT_EXECUTION_ERROR = 12177;
pub const ERROR_WINHTTP_NOT_INITIALIZED = 12172;
pub const ERROR_WINHTTP_SECURE_FAILURE = 12175;
pub const ERROR_WINHTTP_SECURE_CERT_DATE_INVALID = 12037;
pub const ERROR_WINHTTP_SECURE_CERT_CN_INVALID = 12038;
pub const ERROR_WINHTTP_SECURE_INVALID_CA = 12045;
pub const ERROR_WINHTTP_SECURE_CERT_REV_FAILED = 12057;
pub const ERROR_WINHTTP_SECURE_CHANNEL_ERROR = 12157;
pub const ERROR_WINHTTP_SECURE_INVALID_CERT = 12169;
pub const ERROR_WINHTTP_SECURE_CERT_REVOKED = 12170;
pub const ERROR_WINHTTP_SECURE_CERT_WRONG_USAGE = 12179;
pub const ERROR_WINHTTP_AUTODETECTION_FAILED = 12180;
pub const ERROR_WINHTTP_HEADER_COUNT_EXCEEDED = 12181;
pub const ERROR_WINHTTP_HEADER_SIZE_OVERFLOW = 12182;
pub const ERROR_WINHTTP_CHUNKED_ENCODING_HEADER_SIZE_OVERFLOW = 12183;
pub const ERROR_WINHTTP_RESPONSE_DRAIN_OVERFLOW = 12184;
pub const ERROR_WINHTTP_CLIENT_CERT_NO_PRIVATE_KEY = 12185;
pub const ERROR_WINHTTP_CLIENT_CERT_NO_ACCESS_PRIVATE_KEY = 12186;
pub const ERROR_WINHTTP_CLIENT_AUTH_CERT_NEEDED_PROXY = 12187;
pub const ERROR_WINHTTP_SECURE_FAILURE_PROXY = 12188;
pub const ERROR_WINHTTP_RESERVED_189 = 12189;
pub const ERROR_WINHTTP_HTTP_PROTOCOL_MISMATCH = 12190;
pub const ERROR_WINHTTP_GLOBAL_CALLBACK_FAILED = 12191;
pub const ERROR_WINHTTP_FEATURE_DISABLED = 12192;
pub const ERROR_WINHTTP_FAST_FORWARDING_NOT_SUPPORTED = 12193;
pub const WINHTTP_ERROR_LAST = 12193;
pub const WINHTTP_RESET_STATE = 1;
pub const WINHTTP_RESET_SWPAD_CURRENT_NETWORK = 2;
pub const WINHTTP_RESET_SWPAD_ALL = 4;
pub const WINHTTP_RESET_SCRIPT_CACHE = 8;
pub const WINHTTP_RESET_ALL = 65535;
pub const WINHTTP_RESET_NOTIFY_NETWORK_CHANGED = 65536;
pub const WINHTTP_RESET_OUT_OF_PROC = 131072;
pub const WINHTTP_RESET_DISCARD_RESOLVERS = 262144;
pub const WINHTTP_WEB_SOCKET_MAX_CLOSE_REASON_LENGTH = 123;
pub const WINHTTP_WEB_SOCKET_MIN_KEEPALIVE_VALUE = 15000;
pub const WINHTTP_PROXY_NOTIFY_CHANGE = 1;
pub const WINHTTP_FEATURE_DISABLE_STREAM_QUEUE = 1;
pub const WINHTTP_FEATURE_IPV6_FAST_FALLBACK = 2;
pub const WINHTTP_FEATURE_CONNECTION_STATS_V0 = 3;
pub const WINHTTP_FEATURE_REQUEST_TIMES = 4;
pub const WINHTTP_FEATURE_EXPIRE_CONNECTION = 5;
pub const WINHTTP_FEATURE_DISABLE_SECURE_PROTOCOL_FALLBACK = 6;
pub const WINHTTP_FEATURE_HTTP_PROTOCOL_REQUIRED = 7;
pub const WINHTTP_FEATURE_REQUEST_STATS = 8;
pub const WINHTTP_FEATURE_SERVER_CERT_CHAIN_CONTEXT = 9;
pub const WINHTTP_FEATURE_CONNECTION_STATS_V1 = 12;
pub const WINHTTP_FEATURE_SECURITY_INFO = 13;
pub const WINHTTP_FEATURE_TCP_KEEPALIVE = 14;
pub const WINHTTP_FEATURE_TCP_FAST_OPEN = 15;
pub const WINHTTP_FEATURE_TLS_FALSE_START = 16;
pub const WINHTTP_FEATURE_IGNORE_CERT_REVOCATION_OFFLINE = 17;
pub const WINHTTP_FEATURE_TLS_PROTOCOL_INSECURE_FALLBACK = 20;
pub const WINHTTP_FEATURE_STREAM_ERROR_CODE = 21;
pub const WINHTTP_FEATURE_REQUIRE_STREAM_END = 22;
pub const WINHTTP_FEATURE_ENABLE_HTTP2_PLUS_CLIENT_CERT = 23;
pub const WINHTTP_FEATURE_FAILED_CONNECTION_RETRIES = 24;
pub const WINHTTP_FEATURE_HTTP2_KEEPALIVE = 26;
pub const WINHTTP_FEATURE_RESOLUTION_HOSTNAME = 27;
pub const WINHTTP_FEATURE_SET_TOKEN_BINDING = 28;
pub const WINHTTP_FEATURE_TOKEN_BINDING_PUBLIC_KEY = 29;
pub const WINHTTP_FEATURE_REFERER_TOKEN_BINDING_HOSTNAME = 30;
pub const WINHTTP_FEATURE_HTTP2_PLUS_TRANSFER_ENCODING = 31;
pub const WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG = 32;
pub const WINHTTP_FEATURE_DISABLE_CERT_CHAIN_BUILDING = 33;
pub const WINHTTP_FEATURE_BACKGROUND_CONNECTIONS = 34;
pub const WINHTTP_FEATURE_FIRST_AVAILABLE_CONNECTION = 35;
pub const WINHTTP_FEATURE_TCP_PRIORITY_STATUS = 37;
pub const WINHTTP_FEATURE_CONNECTION_GUID = 38;
pub const WINHTTP_FEATURE_MATCH_CONNECTION_GUID = 39;
pub const WINHTTP_FEATURE_HTTP2_RECEIVE_WINDOW = 43;
pub const WINHTTP_FEATURE_IS_FEATURE_SUPPORTED = 44;
pub const WINHTTP_FEATURE_ADD_REQUEST_HEADERS_EX = 46;
pub const WINHTTP_FEATURE_SET_PROXY_SETINGS_PER_USER = 47;
pub const WINHTTP_FEATURE_READ_DATA_EX = 48;
pub const WINHTTP_FEATURE_QUERY_HEADERS_EX = 49;
pub const WINHTTP_FEATURE_QUERY_CONNECTION_GROUP = 50;
pub const WINHTTP_FEATURE_FREE_QUERY_CONNECTION_GROUP_RESULT = 51;
pub const WINHTTP_FEATURE_SECURITY_FLAG_IGNORE_ALL_CERT_ERRORS = 52;
pub const WINHTTP_FEATURE_FLAG_SECURE_DEFAULTS = 53;
pub const WINHTTP_FEATURE_EXTENDED_HEADER_FLAG_UNICODE = 54;
pub const WINHTTP_FEATURE_QUERY_FLAG_TRAILERS = 55;
pub const WINHTTP_FEATURE_QUERY_FLAG_WIRE_ENCODING = 56;
pub const WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG_FLAG_SOFT_LIMIT = 57;
pub const WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG_FLAG_BYPASS_CACHE = 58;
pub const WINHTTP_FEATURE_FLAG_AUTOMATIC_CHUNKING = 59;
pub const WINHTTP_FEATURE_QUERY_CONNECTION_GROUP_FLAG_INSECURE = 60;
pub const WINHTTP_FEATURE_MATCH_CONNECTION_GUID_FLAG_REQUIRE_MARKED_CONNECTION = 61;
pub const WINHTTP_FEATURE_QUERY_EX_ALL_HEADERS = 62;
pub const WINHTTP_FEATURE_READ_DATA_EX_FLAG_FILL_BUFFER = 63;
pub const WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG_FLAG_USE_DNS_TTL = 64;
pub const WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG_FLAG_CONN_USE_TTL = 65;
pub const WINHTTP_FEATURE_QUIC_STATS = 66;
pub const WINHTTP_FEATURE_HTTP3_KEEPALIVE = 69;
pub const WINHTTP_FEATURE_HTTP3_HANDSHAKE_TIMEOUT = 70;
pub const WINHTTP_FEATURE_HTTP3_INITIAL_RTT = 71;
pub const WINHTTP_FEATURE_HTTP3_STREAM_ERROR_CODE = 72;
pub const WINHTTP_FEATURE_REQUEST_ANNOTATION = 73;
pub const WINHTTP_FEATURE_DISABLE_PROXY_AUTH_SCHEMES = 74;
pub const WINHTTP_FEATURE_REVERT_IMPERSONATION_SERVER_CERT = 75;
pub const WINHTTP_FEATURE_DISABLE_GLOBAL_POOLING = 76;
pub const WINHTTP_FEATURE_GET_PROXY_SETTINGS_EX = 77;
pub const WINHTTP_FEATURE_SESSION_SCH_CRED = 78;
pub const WINHTTP_FEATURE_QUIC_STATS_V2 = 79;
pub const WINHTTP_FEATURE_URL_INCLUDE_DEFAULT_PORT = 80;
pub const WINHTTP_FEATURE_QUIC_STREAM_STATS = 81;
pub const WINHTTP_FEATURE_USE_LOOKASIDE = 82;
pub const WINHTTP_FEATURE_ERROR_LOG_GUID = 83;
pub const WINHTTP_FEATURE_UPGRADE_TO_PROTOCOL = 88;
pub const WINHTTP_FEATURE_CONNECTION_STATS_V2 = 89;
pub const WINHTTP_FEATURE_FAST_FORWARD_RESPONSE = 90;
pub const WINHTTP_FEATURE_DISABLE_AIA_FLAG = 91;
pub const WINHTTP_FEATURE_DSCP_TAG = 92;
pub const WINHTTP_FEATURE_HTTP11_DOWNGRADE_TTL = 93;
pub const WINHTTP_FEATURE_SESSION_ERROR_LOG_GUID = 94;
pub const WINHTTP_FEATURE_GET_PROXY_SETTINGS_EX_XBOX = 95;
pub const WinHttpProxyDetectionStart = 0;
pub const WinHttpProxyDetectionEnd = 1;
pub const WinHttpConnectionAcquireStart = 2;
pub const WinHttpConnectionAcquireWaitEnd = 3;
pub const WinHttpConnectionAcquireEnd = 4;
pub const WinHttpNameResolutionStart = 5;
pub const WinHttpNameResolutionEnd = 6;
pub const WinHttpConnectionEstablishmentStart = 7;
pub const WinHttpConnectionEstablishmentEnd = 8;
pub const WinHttpTlsHandshakeClientLeg1Start = 9;
pub const WinHttpTlsHandshakeClientLeg1End = 10;
pub const WinHttpTlsHandshakeClientLeg2Start = 11;
pub const WinHttpTlsHandshakeClientLeg2End = 12;
pub const WinHttpTlsHandshakeClientLeg3Start = 13;
pub const WinHttpTlsHandshakeClientLeg3End = 14;
pub const WinHttpStreamWaitStart = 15;
pub const WinHttpStreamWaitEnd = 16;
pub const WinHttpSendRequestStart = 17;
pub const WinHttpSendRequestHeadersCompressionStart = 18;
pub const WinHttpSendRequestHeadersCompressionEnd = 19;
pub const WinHttpSendRequestHeadersEnd = 20;
pub const WinHttpSendRequestEnd = 21;
pub const WinHttpReceiveResponseStart = 22;
pub const WinHttpReceiveResponseHeadersDecompressionStart = 23;
pub const WinHttpReceiveResponseHeadersDecompressionEnd = 24;
pub const WinHttpReceiveResponseHeadersEnd = 25;
pub const WinHttpReceiveResponseBodyDecompressionDelta = 26;
pub const WinHttpReceiveResponseEnd = 27;
pub const WinHttpProxyTunnelStart = 28;
pub const WinHttpProxyTunnelEnd = 29;
pub const WinHttpProxyTlsHandshakeClientLeg1Start = 30;
pub const WinHttpProxyTlsHandshakeClientLeg1End = 31;
pub const WinHttpProxyTlsHandshakeClientLeg2Start = 32;
pub const WinHttpProxyTlsHandshakeClientLeg2End = 33;
pub const WinHttpProxyTlsHandshakeClientLeg3Start = 34;
pub const WinHttpProxyTlsHandshakeClientLeg3End = 35;
pub const WinHttpRequestTimeLast = 36;
pub const WinHttpRequestTimeMax = 64;
pub const WinHttpConnectFailureCount = 0;
pub const WinHttpProxyFailureCount = 1;
pub const WinHttpTlsHandshakeClientLeg1Size = 2;
pub const WinHttpTlsHandshakeServerLeg1Size = 3;
pub const WinHttpTlsHandshakeClientLeg2Size = 4;
pub const WinHttpTlsHandshakeServerLeg2Size = 5;
pub const WinHttpRequestHeadersSize = 6;
pub const WinHttpRequestHeadersCompressedSize = 7;
pub const WinHttpResponseHeadersSize = 8;
pub const WinHttpResponseHeadersCompressedSize = 9;
pub const WinHttpResponseBodySize = 10;
pub const WinHttpResponseBodyCompressedSize = 11;
pub const WinHttpProxyTlsHandshakeClientLeg1Size = 12;
pub const WinHttpProxyTlsHandshakeServerLeg1Size = 13;
pub const WinHttpProxyTlsHandshakeClientLeg2Size = 14;
pub const WinHttpProxyTlsHandshakeServerLeg2Size = 15;
pub const WinHttpRequestStatLast = 16;
pub const WinHttpRequestStatMax = 32;
pub const WinHttpSecureDnsSettingDefault = 0;
pub const WinHttpSecureDnsSettingForcePlaintext = 1;
pub const WinHttpSecureDnsSettingRequireEncryption = 2;
pub const WinHttpSecureDnsSettingTryEncryptionWithFallback = 3;
pub const WinHttpSecureDnsSettingMax = 4;
pub const WINHTTP_WEB_SOCKET_SEND_OPERATION = 0;
pub const WINHTTP_WEB_SOCKET_RECEIVE_OPERATION = 1;
pub const WINHTTP_WEB_SOCKET_CLOSE_OPERATION = 2;
pub const WINHTTP_WEB_SOCKET_SHUTDOWN_OPERATION = 3;
pub const WINHTTP_WEB_SOCKET_BINARY_MESSAGE_BUFFER_TYPE = 0;
pub const WINHTTP_WEB_SOCKET_BINARY_FRAGMENT_BUFFER_TYPE = 1;
pub const WINHTTP_WEB_SOCKET_UTF8_MESSAGE_BUFFER_TYPE = 2;
pub const WINHTTP_WEB_SOCKET_UTF8_FRAGMENT_BUFFER_TYPE = 3;
pub const WINHTTP_WEB_SOCKET_CLOSE_BUFFER_TYPE = 4;
pub const WINHTTP_WEB_SOCKET_SUCCESS_CLOSE_STATUS = 1000;
pub const WINHTTP_WEB_SOCKET_ENDPOINT_TERMINATED_CLOSE_STATUS = 1001;
pub const WINHTTP_WEB_SOCKET_PROTOCOL_ERROR_CLOSE_STATUS = 1002;
pub const WINHTTP_WEB_SOCKET_INVALID_DATA_TYPE_CLOSE_STATUS = 1003;
pub const WINHTTP_WEB_SOCKET_EMPTY_CLOSE_STATUS = 1005;
pub const WINHTTP_WEB_SOCKET_ABORTED_CLOSE_STATUS = 1006;
pub const WINHTTP_WEB_SOCKET_INVALID_PAYLOAD_CLOSE_STATUS = 1007;
pub const WINHTTP_WEB_SOCKET_POLICY_VIOLATION_CLOSE_STATUS = 1008;
pub const WINHTTP_WEB_SOCKET_MESSAGE_TOO_BIG_CLOSE_STATUS = 1009;
pub const WINHTTP_WEB_SOCKET_UNSUPPORTED_EXTENSIONS_CLOSE_STATUS = 1010;
pub const WINHTTP_WEB_SOCKET_SERVER_ERROR_CLOSE_STATUS = 1011;
pub const WINHTTP_WEB_SOCKET_SECURE_HANDSHAKE_ERROR_CLOSE_STATUS = 1015;
pub const WINHTTP_PROTOCOL_SEND_OPERATION = 0;
pub const WINHTTP_PROTOCOL_RECEIVE_OPERATION = 1;
pub const WinHttpProxySettingsTypeUnknown = 0;
pub const WinHttpProxySettingsTypeWsl = 1;
pub const WinHttpProxySettingsTypeWsa = 2;
pub const WinHttpProxySettingsTypeXBox = 3;
pub const WinHttpFastForwardingStateInProgress = 0;
pub const WinHttpFastForwardingStateSucceeded = 1;
pub const WinHttpFastForwardingStateClientSideFailed = 2;
pub const WinHttpFastForwardingStateServerSideFailed = 3;
pub const WinHttpRequestOption_UserAgentString = 0;
pub const WinHttpRequestOption_URL = 1;
pub const WinHttpRequestOption_URLCodePage = 2;
pub const WinHttpRequestOption_EscapePercentInURL = 3;
pub const WinHttpRequestOption_SslErrorIgnoreFlags = 4;
pub const WinHttpRequestOption_SelectCertificate = 5;
pub const WinHttpRequestOption_EnableRedirects = 6;
pub const WinHttpRequestOption_UrlEscapeDisable = 7;
pub const WinHttpRequestOption_UrlEscapeDisableQuery = 8;
pub const WinHttpRequestOption_SecureProtocols = 9;
pub const WinHttpRequestOption_EnableTracing = 10;
pub const WinHttpRequestOption_RevertImpersonationOverSsl = 11;
pub const WinHttpRequestOption_EnableHttpsToHttpRedirects = 12;
pub const WinHttpRequestOption_EnablePassportAuthentication = 13;
pub const WinHttpRequestOption_MaxAutomaticRedirects = 14;
pub const WinHttpRequestOption_MaxResponseHeaderSize = 15;
pub const WinHttpRequestOption_MaxResponseDrainSize = 16;
pub const WinHttpRequestOption_EnableHttp1_1 = 17;
pub const WinHttpRequestOption_EnableCertificateRevocationCheck = 18;
pub const WinHttpRequestOption_RejectUserpwd = 19;
pub const AutoLogonPolicy_Always = 0;
pub const AutoLogonPolicy_OnlyIfBypassProxy = 1;
pub const AutoLogonPolicy_Never = 2;
pub const SslErrorFlag_UnknownCA = 256;
pub const SslErrorFlag_CertWrongUsage = 512;
pub const SslErrorFlag_CertCNInvalid = 4096;
pub const SslErrorFlag_CertDateInvalid = 8192;
pub const SslErrorFlag_Ignore_All = 13056;
pub const SecureProtocol_SSL2 = 8;
pub const SecureProtocol_SSL3 = 32;
pub const SecureProtocol_TLS1 = 128;
pub const SecureProtocol_TLS1_1 = 512;
pub const SecureProtocol_TLS1_2 = 2048;
pub const SecureProtocol_ALL = 168;

pub const aliases = struct {
    pub const WINHTTP_OPEN_REQUEST_FLAGS = u32;
    pub const WIN_HTTP_CREATE_URL_FLAGS = u32;
    pub const WINHTTP_ACCESS_TYPE = u32;
    pub const WINHTTP_CREDS_AUTHSCHEME = u32;
    pub const WINHTTP_INTERNET_SCHEME = i32;
    pub const WINHTTP_REQUEST_TIME_ENTRY = i32;
    pub const WINHTTP_REQUEST_STAT_ENTRY = i32;
    pub const WINHTTP_SECURE_DNS_SETTING = i32;
    pub const WINHTTP_WEB_SOCKET_OPERATION = i32;
    pub const WINHTTP_WEB_SOCKET_BUFFER_TYPE = i32;
    pub const WINHTTP_WEB_SOCKET_CLOSE_STATUS = i32;
    pub const WINHTTP_PROTOCOL_OPERATION = i32;
    pub const WINHTTP_PROXY_SETTINGS_TYPE = i32;
    pub const WINHTTP_FAST_FORWARDING_STATE = i32;
    pub const WinHttpRequestOption = i32;
    pub const WinHttpRequestAutoLogonPolicy = i32;
    pub const WinHttpRequestSslErrorFlags = i32;
    pub const WinHttpRequestSecureProtocols = i32;
    pub const WINHTTP_STATUS_CALLBACK = ?*const anyopaque;
    pub const WINHTTP_PROXY_CHANGE_CALLBACK = ?*const anyopaque;
};
