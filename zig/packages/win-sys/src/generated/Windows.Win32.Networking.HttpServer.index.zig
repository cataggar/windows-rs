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
    .{ "HttpInitialize", MethodRecord{ .library = "HTTPAPI", .import = "HttpInitialize", .signature = "\x00\x03\x09\x11\xb1\xf1\x11\x97\xa1\x0f\x01" } },
    .{ "HttpTerminate", MethodRecord{ .library = "HTTPAPI", .import = "HttpTerminate", .signature = "\x00\x02\x09\x11\x97\xa1\x0f\x01" } },
    .{ "HttpCreateHttpHandle", MethodRecord{ .library = "HTTPAPI", .import = "HttpCreateHttpHandle", .signature = "\x00\x02\x09\x0f\x11\x80\x85\x09" } },
    .{ "HttpCreateRequestQueue", MethodRecord{ .library = "HTTPAPI", .import = "HttpCreateRequestQueue", .signature = "\x00\x05\x09\x11\xb1\xf1\x11\x05\x0f\x11\x8b\xb5\x09\x0f\x11\xb1\xf5" } },
    .{ "HttpCloseRequestQueue", MethodRecord{ .library = "HTTPAPI", .import = "HttpCloseRequestQueue", .signature = "\x00\x01\x09\x11\xb1\xf5" } },
    .{ "HttpSetRequestQueueProperty", MethodRecord{ .library = "HTTPAPI", .import = "HttpSetRequestQueueProperty", .signature = "\x00\x06\x09\x11\x80\x85\x11\xb1\xf9\x0f\x01\x09\x09\x0f\x01" } },
    .{ "HttpQueryRequestQueueProperty", MethodRecord{ .library = "HTTPAPI", .import = "HttpQueryRequestQueueProperty", .signature = "\x00\x07\x09\x11\x80\x85\x11\xb1\xf9\x0f\x01\x09\x09\x0f\x09\x0f\x01" } },
    .{ "HttpSetRequestProperty", MethodRecord{ .library = "HTTPAPI", .import = "HttpSetRequestProperty", .signature = "\x00\x06\x09\x11\x80\x85\x0b\x11\xb1\xfd\x0f\x01\x09\x0f\x11\x8b\xed" } },
    .{ "HttpQueryRequestProperty", MethodRecord{ .library = "HTTPAPI", .import = "HttpQueryRequestProperty", .signature = "\x00\x09\x09\x11\x80\x85\x0b\x11\xb1\xfd\x0f\x01\x09\x0f\x01\x09\x0f\x09\x0f\x11\x8b\xed" } },
    .{ "HttpShutdownRequestQueue", MethodRecord{ .library = "HTTPAPI", .import = "HttpShutdownRequestQueue", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "HttpReceiveClientCertificate", MethodRecord{ .library = "HTTPAPI", .import = "HttpReceiveClientCertificate", .signature = "\x00\x07\x09\x11\x80\x85\x0b\x09\x0f\x11\xb2\x01\x09\x0f\x09\x0f\x11\x8b\xed" } },
    .{ "HttpCreateServerSession", MethodRecord{ .library = "HTTPAPI", .import = "HttpCreateServerSession", .signature = "\x00\x03\x09\x11\xb1\xf1\x0f\x0b\x09" } },
    .{ "HttpCloseServerSession", MethodRecord{ .library = "HTTPAPI", .import = "HttpCloseServerSession", .signature = "\x00\x01\x09\x0b" } },
    .{ "HttpQueryServerSessionProperty", MethodRecord{ .library = "HTTPAPI", .import = "HttpQueryServerSessionProperty", .signature = "\x00\x05\x09\x0b\x11\xb1\xf9\x0f\x01\x09\x0f\x09" } },
    .{ "HttpSetServerSessionProperty", MethodRecord{ .library = "HTTPAPI", .import = "HttpSetServerSessionProperty", .signature = "\x00\x04\x09\x0b\x11\xb1\xf9\x0f\x01\x09" } },
    .{ "HttpAddUrl", MethodRecord{ .library = "HTTPAPI", .import = "HttpAddUrl", .signature = "\x00\x03\x09\x11\x80\x85\x11\x05\x0f\x01" } },
    .{ "HttpRemoveUrl", MethodRecord{ .library = "HTTPAPI", .import = "HttpRemoveUrl", .signature = "\x00\x02\x09\x11\x80\x85\x11\x05" } },
    .{ "HttpCreateUrlGroup", MethodRecord{ .library = "HTTPAPI", .import = "HttpCreateUrlGroup", .signature = "\x00\x03\x09\x0b\x0f\x0b\x09" } },
    .{ "HttpCloseUrlGroup", MethodRecord{ .library = "HTTPAPI", .import = "HttpCloseUrlGroup", .signature = "\x00\x01\x09\x0b" } },
    .{ "HttpAddUrlToUrlGroup", MethodRecord{ .library = "HTTPAPI", .import = "HttpAddUrlToUrlGroup", .signature = "\x00\x04\x09\x0b\x11\x05\x0b\x09" } },
    .{ "HttpRemoveUrlFromUrlGroup", MethodRecord{ .library = "HTTPAPI", .import = "HttpRemoveUrlFromUrlGroup", .signature = "\x00\x03\x09\x0b\x11\x05\x09" } },
    .{ "HttpSetUrlGroupProperty", MethodRecord{ .library = "HTTPAPI", .import = "HttpSetUrlGroupProperty", .signature = "\x00\x04\x09\x0b\x11\xb1\xf9\x0f\x01\x09" } },
    .{ "HttpQueryUrlGroupProperty", MethodRecord{ .library = "HTTPAPI", .import = "HttpQueryUrlGroupProperty", .signature = "\x00\x05\x09\x0b\x11\xb1\xf9\x0f\x01\x09\x0f\x09" } },
    .{ "HttpPrepareUrl", MethodRecord{ .library = "HTTPAPI", .import = "HttpPrepareUrl", .signature = "\x00\x04\x09\x0f\x01\x09\x11\x05\x0f\x11\x05" } },
    .{ "HttpReceiveHttpRequest", MethodRecord{ .library = "HTTPAPI", .import = "HttpReceiveHttpRequest", .signature = "\x00\x07\x09\x11\x80\x85\x0b\x11\x97\x9d\x0f\x11\xb2\x05\x09\x0f\x09\x0f\x11\x8b\xed" } },
    .{ "HttpReceiveRequestEntityBody", MethodRecord{ .library = "HTTPAPI", .import = "HttpReceiveRequestEntityBody", .signature = "\x00\x07\x09\x11\x80\x85\x0b\x09\x0f\x01\x09\x0f\x09\x0f\x11\x8b\xed" } },
    .{ "HttpSendHttpResponse", MethodRecord{ .library = "HTTPAPI", .import = "HttpSendHttpResponse", .signature = "\x00\x0a\x09\x11\x80\x85\x0b\x09\x0f\x11\xb2\x09\x0f\x11\xb2\x0d\x0f\x09\x0f\x01\x09\x0f\x11\x8b\xed\x0f\x11\xb2\x11" } },
    .{ "HttpSendResponseEntityBody", MethodRecord{ .library = "HTTPAPI", .import = "HttpSendResponseEntityBody", .signature = "\x00\x0a\x09\x11\x80\x85\x0b\x09\x07\x0f\x11\xb2\x15\x0f\x09\x0f\x01\x09\x0f\x11\x8b\xed\x0f\x11\xb2\x11" } },
    .{ "HttpDeclarePush", MethodRecord{ .library = "HTTPAPI", .import = "HttpDeclarePush", .signature = "\x00\x06\x09\x11\x80\x85\x0b\x11\xb2\x19\x11\x05\x11\x3d\x0f\x11\xb2\x1d" } },
    .{ "HttpWaitForDisconnect", MethodRecord{ .library = "HTTPAPI", .import = "HttpWaitForDisconnect", .signature = "\x00\x03\x09\x11\x80\x85\x0b\x0f\x11\x8b\xed" } },
    .{ "HttpWaitForDisconnectEx", MethodRecord{ .library = "HTTPAPI", .import = "HttpWaitForDisconnectEx", .signature = "\x00\x04\x09\x11\x80\x85\x0b\x09\x0f\x11\x8b\xed" } },
    .{ "HttpCancelHttpRequest", MethodRecord{ .library = "HTTPAPI", .import = "HttpCancelHttpRequest", .signature = "\x00\x03\x09\x11\x80\x85\x0b\x0f\x11\x8b\xed" } },
    .{ "HttpWaitForDemandStart", MethodRecord{ .library = "HTTPAPI", .import = "HttpWaitForDemandStart", .signature = "\x00\x02\x09\x11\x80\x85\x0f\x11\x8b\xed" } },
    .{ "HttpIsFeatureSupported", MethodRecord{ .library = "HTTPAPI", .import = "HttpIsFeatureSupported", .signature = "\x00\x01\x11\x59\x11\xb2\x21" } },
    .{ "HttpDelegateRequestEx", MethodRecord{ .library = "HTTPAPI", .import = "HttpDelegateRequestEx", .signature = "\x00\x06\x09\x11\x80\x85\x11\x80\x85\x0b\x0b\x09\x0f\x11\xb2\x25" } },
    .{ "HttpFindUrlGroupId", MethodRecord{ .library = "HTTPAPI", .import = "HttpFindUrlGroupId", .signature = "\x00\x03\x09\x11\x05\x11\x80\x85\x0f\x0b" } },
    .{ "HttpFlushResponseCache", MethodRecord{ .library = "HTTPAPI", .import = "HttpFlushResponseCache", .signature = "\x00\x04\x09\x11\x80\x85\x11\x05\x09\x0f\x11\x8b\xed" } },
    .{ "HttpAddFragmentToCache", MethodRecord{ .library = "HTTPAPI", .import = "HttpAddFragmentToCache", .signature = "\x00\x05\x09\x11\x80\x85\x11\x05\x0f\x11\xb2\x15\x0f\x11\xb2\x0d\x0f\x11\x8b\xed" } },
    .{ "HttpReadFragmentFromCache", MethodRecord{ .library = "HTTPAPI", .import = "HttpReadFragmentFromCache", .signature = "\x00\x07\x09\x11\x80\x85\x11\x05\x0f\x11\xb2\x29\x0f\x01\x09\x0f\x09\x0f\x11\x8b\xed" } },
    .{ "HttpSetServiceConfiguration", MethodRecord{ .library = "HTTPAPI", .import = "HttpSetServiceConfiguration", .signature = "\x00\x05\x09\x11\x80\x85\x11\xb2\x2d\x0f\x01\x09\x0f\x11\x8b\xed" } },
    .{ "HttpUpdateServiceConfiguration", MethodRecord{ .library = "HTTPAPI", .import = "HttpUpdateServiceConfiguration", .signature = "\x00\x05\x09\x11\x80\x85\x11\xb2\x2d\x0f\x01\x09\x0f\x11\x8b\xed" } },
    .{ "HttpDeleteServiceConfiguration", MethodRecord{ .library = "HTTPAPI", .import = "HttpDeleteServiceConfiguration", .signature = "\x00\x05\x09\x11\x80\x85\x11\xb2\x2d\x0f\x01\x09\x0f\x11\x8b\xed" } },
    .{ "HttpQueryServiceConfiguration", MethodRecord{ .library = "HTTPAPI", .import = "HttpQueryServiceConfiguration", .signature = "\x00\x08\x09\x11\x80\x85\x11\xb2\x2d\x0f\x01\x09\x0f\x01\x09\x0f\x09\x0f\x11\x8b\xed" } },
    .{ "HttpGetExtension", MethodRecord{ .library = "HTTPAPI", .import = "HttpGetExtension", .signature = "\x00\x04\x09\x11\xb1\xf1\x09\x0f\x01\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0xbed => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED" },
        0x179d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_RECEIVE_HTTP_REQUEST_FLAGS" },
        0x17a1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_INITIALIZE" },
        0x31f1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTPAPI_VERSION" },
        0x31f5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_REQUEST_QUEUE_HANDLE" },
        0x31f9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_SERVER_PROPERTY" },
        0x31fd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_REQUEST_PROPERTY" },
        0x3201 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_SSL_CLIENT_CERT_INFO" },
        0x3205 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_REQUEST_V2" },
        0x3209 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_RESPONSE_V2" },
        0x320d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_CACHE_POLICY" },
        0x3211 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_LOG_DATA" },
        0x3215 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_DATA_CHUNK" },
        0x3219 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_VERB" },
        0x321d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_REQUEST_HEADERS" },
        0x3221 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_FEATURE_ID" },
        0x3225 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_DELEGATE_REQUEST_PROPERTY_INFO" },
        0x3229 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_BYTE_RANGE" },
        0x322d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.HttpServer", .name = "HTTP_SERVICE_CONFIG_ID" },
        else => null,
    };
}

pub const HTTP_RECEIVE_REQUEST_FLAG_COPY_BODY = 1;
pub const HTTP_RECEIVE_REQUEST_FLAG_FLUSH_BODY = 2;
pub const HTTP_INITIALIZE_CONFIG = 2;
pub const HTTP_INITIALIZE_SERVER = 1;
pub const HTTP_DEMAND_CBT = 4;
pub const HTTP_MAX_SERVER_QUEUE_LENGTH = 2147483647;
pub const HTTP_MIN_SERVER_QUEUE_LENGTH = 1;
pub const HTTP_AUTH_ENABLE_BASIC = 1;
pub const HTTP_AUTH_ENABLE_DIGEST = 2;
pub const HTTP_AUTH_ENABLE_NTLM = 4;
pub const HTTP_AUTH_ENABLE_NEGOTIATE = 8;
pub const HTTP_AUTH_ENABLE_KERBEROS = 16;
pub const HTTP_AUTH_EX_FLAG_ENABLE_KERBEROS_CREDENTIAL_CACHING = 1;
pub const HTTP_AUTH_EX_FLAG_CAPTURE_CREDENTIAL = 2;
pub const HTTP_CHANNEL_BIND_PROXY = 1;
pub const HTTP_CHANNEL_BIND_PROXY_COHOSTING = 32;
pub const HTTP_CHANNEL_BIND_NO_SERVICE_NAME_CHECK = 2;
pub const HTTP_CHANNEL_BIND_DOTLESS_SERVICE = 4;
pub const HTTP_CHANNEL_BIND_SECURE_CHANNEL_TOKEN = 8;
pub const HTTP_CHANNEL_BIND_CLIENT_SERVICE = 16;
pub const HTTP_LOG_FIELD_DATE = 1;
pub const HTTP_LOG_FIELD_TIME = 2;
pub const HTTP_LOG_FIELD_CLIENT_IP = 4;
pub const HTTP_LOG_FIELD_USER_NAME = 8;
pub const HTTP_LOG_FIELD_SITE_NAME = 16;
pub const HTTP_LOG_FIELD_COMPUTER_NAME = 32;
pub const HTTP_LOG_FIELD_SERVER_IP = 64;
pub const HTTP_LOG_FIELD_METHOD = 128;
pub const HTTP_LOG_FIELD_URI_STEM = 256;
pub const HTTP_LOG_FIELD_URI_QUERY = 512;
pub const HTTP_LOG_FIELD_STATUS = 1024;
pub const HTTP_LOG_FIELD_WIN32_STATUS = 2048;
pub const HTTP_LOG_FIELD_BYTES_SENT = 4096;
pub const HTTP_LOG_FIELD_BYTES_RECV = 8192;
pub const HTTP_LOG_FIELD_TIME_TAKEN = 16384;
pub const HTTP_LOG_FIELD_SERVER_PORT = 32768;
pub const HTTP_LOG_FIELD_USER_AGENT = 65536;
pub const HTTP_LOG_FIELD_COOKIE = 131072;
pub const HTTP_LOG_FIELD_REFERER = 262144;
pub const HTTP_LOG_FIELD_VERSION = 524288;
pub const HTTP_LOG_FIELD_HOST = 1048576;
pub const HTTP_LOG_FIELD_SUB_STATUS = 2097152;
pub const HTTP_LOG_FIELD_STREAM_ID = 134217728;
pub const HTTP_LOG_FIELD_STREAM_ID_EX = 268435456;
pub const HTTP_LOG_FIELD_TRANSPORT_TYPE = 536870912;
pub const HTTP_LOG_FIELD_CLIENT_PORT = 4194304;
pub const HTTP_LOG_FIELD_URI = 8388608;
pub const HTTP_LOG_FIELD_SITE_ID = 16777216;
pub const HTTP_LOG_FIELD_REASON = 33554432;
pub const HTTP_LOG_FIELD_QUEUE_NAME = 67108864;
pub const HTTP_LOG_FIELD_CORRELATION_ID = 1073741824;
pub const HTTP_LOG_FIELD_FAULT_CODE = 2147483648;
pub const HTTP_LOG_FIELD_EXT_FAULT_CODE_EXT = 1;
pub const HTTP_LOGGING_FLAG_LOCAL_TIME_ROLLOVER = 1;
pub const HTTP_LOGGING_FLAG_USE_UTF8_CONVERSION = 2;
pub const HTTP_LOGGING_FLAG_LOG_ERRORS_ONLY = 4;
pub const HTTP_LOGGING_FLAG_LOG_SUCCESS_ONLY = 8;
pub const HTTP_CREATE_REQUEST_QUEUE_FLAG_OPEN_EXISTING = 1;
pub const HTTP_CREATE_REQUEST_QUEUE_FLAG_CONTROLLER = 2;
pub const HTTP_CREATE_REQUEST_QUEUE_FLAG_DELEGATION = 8;
pub const HTTP_RECEIVE_REQUEST_ENTITY_BODY_FLAG_FILL_BUFFER = 1;
pub const HTTP_SEND_RESPONSE_FLAG_DISCONNECT = 1;
pub const HTTP_SEND_RESPONSE_FLAG_MORE_DATA = 2;
pub const HTTP_SEND_RESPONSE_FLAG_BUFFER_DATA = 4;
pub const HTTP_SEND_RESPONSE_FLAG_ENABLE_NAGLING = 8;
pub const HTTP_SEND_RESPONSE_FLAG_PROCESS_RANGES = 32;
pub const HTTP_SEND_RESPONSE_FLAG_OPAQUE = 64;
pub const HTTP_SEND_RESPONSE_FLAG_GOAWAY = 256;
pub const HTTP_SEND_RESPONSE_FLAG_AUTOMATIC_CHUNKING = 512;
pub const HTTP_FLUSH_RESPONSE_FLAG_RECURSIVE = 1;
pub const HTTP_URL_FLAG_REMOVE_ALL = 1;
pub const HTTP_RECEIVE_SECURE_CHANNEL_TOKEN = 1;
pub const HTTP_RECEIVE_FULL_CHAIN = 2;
pub const HTTP_REQUEST_SIZING_INFO_FLAG_TCP_FAST_OPEN = 1;
pub const HTTP_REQUEST_SIZING_INFO_FLAG_TLS_SESSION_RESUMPTION = 2;
pub const HTTP_REQUEST_SIZING_INFO_FLAG_TLS_FALSE_START = 4;
pub const HTTP_REQUEST_SIZING_INFO_FLAG_FIRST_REQUEST = 8;
pub const HTTP_REQUEST_AUTH_FLAG_TOKEN_FOR_CACHED_CRED = 1;
pub const HTTP_REQUEST_FLAG_MORE_ENTITY_BODY_EXISTS = 1;
pub const HTTP_REQUEST_FLAG_IP_ROUTED = 2;
pub const HTTP_REQUEST_FLAG_HTTP2 = 4;
pub const HTTP_REQUEST_FLAG_HTTP3 = 8;
pub const HTTP_REQUEST_FLAG_FAST_FORWARDING_ALLOWED = 16;
pub const HTTP_REQUEST_FLAG_FAST_FORWARDING_RESPONSE_ALLOWED = 16;
pub const HTTP_RESPONSE_FLAG_MULTIPLE_ENCODINGS_AVAILABLE = 1;
pub const HTTP_RESPONSE_FLAG_MORE_ENTITY_BODY_EXISTS = 2;
pub const HTTP_RESPONSE_INFO_FLAGS_PRESERVE_ORDER = 1;
pub const HTTP_CERT_CHECK_MODE_NO_REVOCATION = 1;
pub const HTTP_CERT_CHECK_MODE_CACHED_REVOCATION = 2;
pub const HTTP_CERT_CHECK_MODE_USE_REVOCATION_FRESHNESS = 4;
pub const HTTP_CERT_CHECK_MODE_CACHED_URLS = 8;
pub const HTTP_CERT_CHECK_MODE_NO_AIA = 16;
pub const HTTP_CERT_CHECK_MODE_NO_USAGE_CHECK = 65536;
pub const HTTP_SSL_CERT_SHA_HASH_LENGTH = 20;
pub const HTTP_SSL_CERT_STORE_NAME_LENGTH = 128;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_USE_DS_MAPPER = 1;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_NEGOTIATE_CLIENT_CERT = 2;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_NO_RAW_FILTER = 4;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_REJECT = 8;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_HTTP2 = 16;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_QUIC = 32;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_TLS13 = 64;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_OCSP_STAPLING = 128;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_TOKEN_BINDING = 256;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_LOG_EXTENDED_EVENTS = 512;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_LEGACY_TLS = 1024;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_SESSION_TICKET = 2048;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_TLS12 = 4096;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_CLIENT_CORRELATION = 8192;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_SESSION_ID = 16384;
pub const HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_CACHE_CLIENT_HELLO = 32768;
pub const HTTP_REQUEST_PROPERTY_SNI_HOST_MAX_LENGTH = 255;
pub const HTTP_REQUEST_PROPERTY_SNI_FLAG_SNI_USED = 1;
pub const HTTP_REQUEST_PROPERTY_SNI_FLAG_NO_SNI = 2;
pub const HttpServerAuthenticationProperty = 0;
pub const HttpServerLoggingProperty = 1;
pub const HttpServerQosProperty = 2;
pub const HttpServerTimeoutsProperty = 3;
pub const HttpServerQueueLengthProperty = 4;
pub const HttpServerStateProperty = 5;
pub const HttpServer503VerbosityProperty = 6;
pub const HttpServerBindingProperty = 7;
pub const HttpServerExtendedAuthenticationProperty = 8;
pub const HttpServerListenEndpointProperty = 9;
pub const HttpServerChannelBindProperty = 10;
pub const HttpServerProtectionLevelProperty = 11;
pub const HttpServerDelegationProperty = 16;
pub const HttpServerFastForwardingProperty = 18;
pub const HttpServerRequestInfoProperty = 19;
pub const HttpEnabledStateActive = 0;
pub const HttpEnabledStateInactive = 1;
pub const Http503ResponseVerbosityBasic = 0;
pub const Http503ResponseVerbosityLimited = 1;
pub const Http503ResponseVerbosityFull = 2;
pub const HttpQosSettingTypeBandwidth = 0;
pub const HttpQosSettingTypeConnectionLimit = 1;
pub const HttpQosSettingTypeFlowRate = 2;
pub const IdleConnectionTimeout = 0;
pub const HeaderWaitTimeout = 1;
pub const HttpNone = 0;
pub const HttpTlsThrottle = 1;
pub const HttpServiceBindingTypeNone = 0;
pub const HttpServiceBindingTypeW = 1;
pub const HttpServiceBindingTypeA = 2;
pub const HttpAuthenticationHardeningLegacy = 0;
pub const HttpAuthenticationHardeningMedium = 1;
pub const HttpAuthenticationHardeningStrict = 2;
pub const HttpLoggingTypeW3C = 0;
pub const HttpLoggingTypeIIS = 1;
pub const HttpLoggingTypeNCSA = 2;
pub const HttpLoggingTypeRaw = 3;
pub const HttpLoggingRolloverSize = 0;
pub const HttpLoggingRolloverDaily = 1;
pub const HttpLoggingRolloverWeekly = 2;
pub const HttpLoggingRolloverMonthly = 3;
pub const HttpLoggingRolloverHourly = 4;
pub const HttpProtectionLevelUnrestricted = 0;
pub const HttpProtectionLevelEdgeRestricted = 1;
pub const HttpProtectionLevelRestricted = 2;
pub const HttpSchemeHttp = 0;
pub const HttpSchemeHttps = 1;
pub const HttpSchemeMaximum = 2;
pub const HttpVerbUnparsed = 0;
pub const HttpVerbUnknown = 1;
pub const HttpVerbInvalid = 2;
pub const HttpVerbOPTIONS = 3;
pub const HttpVerbGET = 4;
pub const HttpVerbHEAD = 5;
pub const HttpVerbPOST = 6;
pub const HttpVerbPUT = 7;
pub const HttpVerbDELETE = 8;
pub const HttpVerbTRACE = 9;
pub const HttpVerbCONNECT = 10;
pub const HttpVerbTRACK = 11;
pub const HttpVerbMOVE = 12;
pub const HttpVerbCOPY = 13;
pub const HttpVerbPROPFIND = 14;
pub const HttpVerbPROPPATCH = 15;
pub const HttpVerbMKCOL = 16;
pub const HttpVerbLOCK = 17;
pub const HttpVerbUNLOCK = 18;
pub const HttpVerbSEARCH = 19;
pub const HttpVerbMaximum = 20;
pub const HttpHeaderCacheControl = 0;
pub const HttpHeaderConnection = 1;
pub const HttpHeaderDate = 2;
pub const HttpHeaderKeepAlive = 3;
pub const HttpHeaderPragma = 4;
pub const HttpHeaderTrailer = 5;
pub const HttpHeaderTransferEncoding = 6;
pub const HttpHeaderUpgrade = 7;
pub const HttpHeaderVia = 8;
pub const HttpHeaderWarning = 9;
pub const HttpHeaderAllow = 10;
pub const HttpHeaderContentLength = 11;
pub const HttpHeaderContentType = 12;
pub const HttpHeaderContentEncoding = 13;
pub const HttpHeaderContentLanguage = 14;
pub const HttpHeaderContentLocation = 15;
pub const HttpHeaderContentMd5 = 16;
pub const HttpHeaderContentRange = 17;
pub const HttpHeaderExpires = 18;
pub const HttpHeaderLastModified = 19;
pub const HttpHeaderAccept = 20;
pub const HttpHeaderAcceptCharset = 21;
pub const HttpHeaderAcceptEncoding = 22;
pub const HttpHeaderAcceptLanguage = 23;
pub const HttpHeaderAuthorization = 24;
pub const HttpHeaderCookie = 25;
pub const HttpHeaderExpect = 26;
pub const HttpHeaderFrom = 27;
pub const HttpHeaderHost = 28;
pub const HttpHeaderIfMatch = 29;
pub const HttpHeaderIfModifiedSince = 30;
pub const HttpHeaderIfNoneMatch = 31;
pub const HttpHeaderIfRange = 32;
pub const HttpHeaderIfUnmodifiedSince = 33;
pub const HttpHeaderMaxForwards = 34;
pub const HttpHeaderProxyAuthorization = 35;
pub const HttpHeaderReferer = 36;
pub const HttpHeaderRange = 37;
pub const HttpHeaderTe = 38;
pub const HttpHeaderTranslate = 39;
pub const HttpHeaderUserAgent = 40;
pub const HttpHeaderRequestMaximum = 41;
pub const HttpHeaderAcceptRanges = 20;
pub const HttpHeaderAge = 21;
pub const HttpHeaderEtag = 22;
pub const HttpHeaderLocation = 23;
pub const HttpHeaderProxyAuthenticate = 24;
pub const HttpHeaderRetryAfter = 25;
pub const HttpHeaderServer = 26;
pub const HttpHeaderSetCookie = 27;
pub const HttpHeaderVary = 28;
pub const HttpHeaderWwwAuthenticate = 29;
pub const HttpHeaderResponseMaximum = 30;
pub const HttpHeaderMaximum = 41;
pub const HttpLogDataTypeFields = 0;
pub const HttpDataChunkFromMemory = 0;
pub const HttpDataChunkFromFileHandle = 1;
pub const HttpDataChunkFromFragmentCache = 2;
pub const HttpDataChunkFromFragmentCacheEx = 3;
pub const HttpDataChunkTrailers = 4;
pub const HttpDataChunkFromWinHttpFastForwarding = 5;
pub const HttpDataChunkMaximum = 6;
pub const DelegateRequestReservedProperty = 0;
pub const DelegateRequestDelegateUrlProperty = 1;
pub const CreateRequestQueueExternalIdProperty = 1;
pub const CreateRequestQueueMax = 2;
pub const HttpAuthStatusSuccess = 0;
pub const HttpAuthStatusNotAuthenticated = 1;
pub const HttpAuthStatusFailure = 2;
pub const HttpRequestAuthTypeNone = 0;
pub const HttpRequestAuthTypeBasic = 1;
pub const HttpRequestAuthTypeDigest = 2;
pub const HttpRequestAuthTypeNTLM = 3;
pub const HttpRequestAuthTypeNegotiate = 4;
pub const HttpRequestAuthTypeKerberos = 5;
pub const HttpRequestSizingTypeTlsHandshakeLeg1ClientData = 0;
pub const HttpRequestSizingTypeTlsHandshakeLeg1ServerData = 1;
pub const HttpRequestSizingTypeTlsHandshakeLeg2ClientData = 2;
pub const HttpRequestSizingTypeTlsHandshakeLeg2ServerData = 3;
pub const HttpRequestSizingTypeHeaders = 4;
pub const HttpRequestSizingTypeMax = 5;
pub const HttpRequestTimingTypeConnectionStart = 0;
pub const HttpRequestTimingTypeDataStart = 1;
pub const HttpRequestTimingTypeTlsCertificateLoadStart = 2;
pub const HttpRequestTimingTypeTlsCertificateLoadEnd = 3;
pub const HttpRequestTimingTypeTlsHandshakeLeg1Start = 4;
pub const HttpRequestTimingTypeTlsHandshakeLeg1End = 5;
pub const HttpRequestTimingTypeTlsHandshakeLeg2Start = 6;
pub const HttpRequestTimingTypeTlsHandshakeLeg2End = 7;
pub const HttpRequestTimingTypeTlsAttributesQueryStart = 8;
pub const HttpRequestTimingTypeTlsAttributesQueryEnd = 9;
pub const HttpRequestTimingTypeTlsClientCertQueryStart = 10;
pub const HttpRequestTimingTypeTlsClientCertQueryEnd = 11;
pub const HttpRequestTimingTypeHttp2StreamStart = 12;
pub const HttpRequestTimingTypeHttp2HeaderDecodeStart = 13;
pub const HttpRequestTimingTypeHttp2HeaderDecodeEnd = 14;
pub const HttpRequestTimingTypeRequestHeaderParseStart = 15;
pub const HttpRequestTimingTypeRequestHeaderParseEnd = 16;
pub const HttpRequestTimingTypeRequestRoutingStart = 17;
pub const HttpRequestTimingTypeRequestRoutingEnd = 18;
pub const HttpRequestTimingTypeRequestQueuedForInspection = 19;
pub const HttpRequestTimingTypeRequestDeliveredForInspection = 20;
pub const HttpRequestTimingTypeRequestReturnedAfterInspection = 21;
pub const HttpRequestTimingTypeRequestQueuedForDelegation = 22;
pub const HttpRequestTimingTypeRequestDeliveredForDelegation = 23;
pub const HttpRequestTimingTypeRequestReturnedAfterDelegation = 24;
pub const HttpRequestTimingTypeRequestQueuedForIO = 25;
pub const HttpRequestTimingTypeRequestDeliveredForIO = 26;
pub const HttpRequestTimingTypeHttp3StreamStart = 27;
pub const HttpRequestTimingTypeHttp3HeaderDecodeStart = 28;
pub const HttpRequestTimingTypeHttp3HeaderDecodeEnd = 29;
pub const HttpRequestTimingTypeMax = 30;
pub const HttpRequestInfoTypeAuth = 0;
pub const HttpRequestInfoTypeChannelBind = 1;
pub const HttpRequestInfoTypeSslProtocol = 2;
pub const HttpRequestInfoTypeSslTokenBindingDraft = 3;
pub const HttpRequestInfoTypeSslTokenBinding = 4;
pub const HttpRequestInfoTypeRequestTiming = 5;
pub const HttpRequestInfoTypeTcpInfoV0 = 6;
pub const HttpRequestInfoTypeRequestSizing = 7;
pub const HttpRequestInfoTypeQuicStats = 8;
pub const HttpRequestInfoTypeTcpInfoV1 = 9;
pub const HttpRequestInfoTypeQuicStatsV2 = 10;
pub const HttpRequestInfoTypeTcpInfoV2 = 11;
pub const HttpRequestInfoTypeTransportIdleConnectionTimeout = 12;
pub const HttpRequestInfoTypeDscpTag = 13;
pub const HttpRequestInfoTypeInitialPacketTtl = 14;
pub const HttpResponseInfoTypeMultipleKnownHeaders = 0;
pub const HttpResponseInfoTypeAuthenticationProperty = 1;
pub const HttpResponseInfoTypeQoSProperty = 2;
pub const HttpResponseInfoTypeChannelBind = 3;
pub const HttpCachePolicyNocache = 0;
pub const HttpCachePolicyUserInvalidates = 1;
pub const HttpCachePolicyTimeToLive = 2;
pub const HttpCachePolicyMaximum = 3;
pub const HttpServiceConfigIPListenList = 0;
pub const HttpServiceConfigSSLCertInfo = 1;
pub const HttpServiceConfigUrlAclInfo = 2;
pub const HttpServiceConfigTimeout = 3;
pub const HttpServiceConfigCache = 4;
pub const HttpServiceConfigSslSniCertInfo = 5;
pub const HttpServiceConfigSslCcsCertInfo = 6;
pub const HttpServiceConfigSetting = 7;
pub const HttpServiceConfigSslCertInfoEx = 8;
pub const HttpServiceConfigSslSniCertInfoEx = 9;
pub const HttpServiceConfigSslCcsCertInfoEx = 10;
pub const HttpServiceConfigSslScopedCcsCertInfo = 11;
pub const HttpServiceConfigSslScopedCcsCertInfoEx = 12;
pub const HttpServiceConfigMax = 13;
pub const HttpServiceConfigQueryExact = 0;
pub const HttpServiceConfigQueryNext = 1;
pub const HttpServiceConfigQueryMax = 2;
pub const ExParamTypeHttp2Window = 0;
pub const ExParamTypeHttp2SettingsLimits = 1;
pub const ExParamTypeHttpPerformance = 2;
pub const ExParamTypeTlsRestrictions = 3;
pub const ExParamTypeErrorHeaders = 4;
pub const ExParamTypeTlsSessionTicketKeys = 5;
pub const ExParamTypeCertConfig = 6;
pub const ExParamTypeMax = 7;
pub const PerformanceParamSendBufferingFlags = 0;
pub const PerformanceParamAggressiveICW = 1;
pub const PerformanceParamMaxSendBufferSize = 2;
pub const PerformanceParamMaxConcurrentClientStreams = 3;
pub const PerformanceParamMaxReceiveBufferSize = 4;
pub const PerformanceParamDecryptOnSspiThread = 5;
pub const PerformanceParamMax = 6;
pub const MaxCacheResponseSize = 0;
pub const CacheRangeChunkSize = 1;
pub const HttpRequestPropertyIsb = 0;
pub const HttpRequestPropertyTcpInfoV0 = 1;
pub const HttpRequestPropertyQuicStats = 2;
pub const HttpRequestPropertyTcpInfoV1 = 3;
pub const HttpRequestPropertySni = 4;
pub const HttpRequestPropertyStreamError = 5;
pub const HttpRequestPropertyWskApiTimings = 6;
pub const HttpRequestPropertyQuicApiTimings = 7;
pub const HttpRequestPropertyQuicStatsV2 = 8;
pub const HttpRequestPropertyQuicStreamStats = 9;
pub const HttpRequestPropertyTcpInfoV2 = 10;
pub const HttpRequestPropertyTlsClientHello = 11;
pub const HttpRequestPropertyTransportIdleConnectionTimeout = 12;
pub const HttpRequestPropertyDscpTag = 13;
pub const HttpRequestPropertyTlsCipherInfo = 14;
pub const HttpFeatureUnknown = 0;
pub const HttpFeatureResponseTrailers = 1;
pub const HttpFeatureApiTimings = 2;
pub const HttpFeatureDelegateEx = 3;
pub const HttpFeatureHttp3 = 4;
pub const HttpFeatureTlsSessionTickets = 5;
pub const HttpFeatureDisableTlsSessionId = 6;
pub const HttpFeatureTlsDualCerts = 7;
pub const HttpFeatureAutomaticChunkedEncoding = 8;
pub const HttpFeatureDedicatedReqQueueDelegationType = 9;
pub const HttpFeatureFastForwardResponse = 10;
pub const HttpFeatureCacheTlsClientHello = 11;
pub const HttpFeatureIdleConnectionTimeoutRequestProperty = 12;
pub const HttpFeatureDisableAiaFlag = 13;
pub const HttpFeatureDscp = 14;
pub const HttpFeatureQueryCipherInfo = 15;
pub const HttpFeatureQueryInitialPacketTtl = 16;
pub const HttpFeatureTlsHandshakePerformanceCounters = 17;
pub const HttpFeatureLast = 18;
pub const HttpFeaturemax = -1;

pub const aliases = struct {
    pub const HTTP_RECEIVE_HTTP_REQUEST_FLAGS = u32;
    pub const HTTP_INITIALIZE = u32;
    pub const HTTP_SERVER_PROPERTY = i32;
    pub const HTTP_ENABLED_STATE = i32;
    pub const HTTP_503_RESPONSE_VERBOSITY = i32;
    pub const HTTP_QOS_SETTING_TYPE = i32;
    pub const HTTP_SERVICE_CONFIG_TIMEOUT_KEY = i32;
    pub const HTTP_SERVICE_CONFIG_SETTING_KEY = i32;
    pub const HTTP_SERVICE_BINDING_TYPE = i32;
    pub const HTTP_AUTHENTICATION_HARDENING_LEVELS = i32;
    pub const HTTP_LOGGING_TYPE = i32;
    pub const HTTP_LOGGING_ROLLOVER_TYPE = i32;
    pub const HTTP_PROTECTION_LEVEL_TYPE = i32;
    pub const HTTP_SCHEME = i32;
    pub const HTTP_VERB = i32;
    pub const HTTP_HEADER_ID = i32;
    pub const HTTP_LOG_DATA_TYPE = i32;
    pub const HTTP_DATA_CHUNK_TYPE = i32;
    pub const HTTP_DELEGATE_REQUEST_PROPERTY_ID = i32;
    pub const HTTP_CREATE_REQUEST_QUEUE_PROPERTY_ID = i32;
    pub const HTTP_AUTH_STATUS = i32;
    pub const HTTP_REQUEST_AUTH_TYPE = i32;
    pub const HTTP_REQUEST_SIZING_TYPE = i32;
    pub const HTTP_REQUEST_TIMING_TYPE = i32;
    pub const HTTP_REQUEST_INFO_TYPE = i32;
    pub const HTTP_RESPONSE_INFO_TYPE = i32;
    pub const HTTP_CACHE_POLICY_TYPE = i32;
    pub const HTTP_SERVICE_CONFIG_ID = i32;
    pub const HTTP_SERVICE_CONFIG_QUERY_TYPE = i32;
    pub const HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE = i32;
    pub const HTTP_PERFORMANCE_PARAM_TYPE = i32;
    pub const HTTP_SERVICE_CONFIG_CACHE_KEY = i32;
    pub const HTTP_REQUEST_PROPERTY = i32;
    pub const HTTP_FEATURE_ID = i32;
    pub const HTTP_REQUEST_QUEUE_HANDLE = ?*anyopaque;
};
