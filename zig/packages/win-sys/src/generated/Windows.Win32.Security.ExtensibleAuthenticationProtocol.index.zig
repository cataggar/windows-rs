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
    .{ "EapHostPeerGetMethods", MethodRecord{ .library = "eappcfg", .import = "EapHostPeerGetMethods", .signature = "\x00\x02\x09\x0f\x11\xbc\x99\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerGetMethodProperties", MethodRecord{ .library = "eappcfg", .import = "EapHostPeerGetMethodProperties", .signature = "\x00\x0a\x09\x09\x09\x11\x97\x65\x11\x80\x85\x09\x0f\x05\x09\x0f\x05\x0f\x11\xbc\xa1\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerInvokeConfigUI", MethodRecord{ .library = "eappcfg", .import = "EapHostPeerInvokeConfigUI", .signature = "\x00\x08\x09\x11\x25\x09\x11\x97\x65\x09\x0f\x05\x0f\x09\x0f\x0f\x05\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerQueryCredentialInputFields", MethodRecord{ .library = "eappcfg", .import = "EapHostPeerQueryCredentialInputFields", .signature = "\x00\x07\x09\x11\x80\x85\x11\x97\x65\x09\x09\x0f\x05\x0f\x11\xbc\xa5\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerQueryUserBlobFromCredentialInputFields", MethodRecord{ .library = "eappcfg", .import = "EapHostPeerQueryUserBlobFromCredentialInputFields", .signature = "\x00\x09\x09\x11\x80\x85\x11\x97\x65\x09\x09\x0f\x05\x0f\x11\xbc\xa5\x0f\x09\x0f\x0f\x05\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerInvokeIdentityUI", MethodRecord{ .library = "eappcfg", .import = "EapHostPeerInvokeIdentityUI", .signature = "\x00\x0d\x09\x09\x11\x97\x65\x09\x11\x25\x09\x0f\x05\x09\x0f\x05\x0f\x09\x0f\x0f\x05\x0f\x11\x05\x0f\x0f\x11\xbc\x9d\x0f\x0f\x01" } },
    .{ "EapHostPeerInvokeInteractiveUI", MethodRecord{ .library = "eappcfg", .import = "EapHostPeerInvokeInteractiveUI", .signature = "\x00\x06\x09\x11\x25\x09\x0f\x05\x0f\x09\x0f\x0f\x05\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerQueryInteractiveUIInputFields", MethodRecord{ .library = "eappcfg", .import = "EapHostPeerQueryInteractiveUIInputFields", .signature = "\x00\x07\x09\x09\x09\x09\x0f\x05\x0f\x11\xbc\xa9\x0f\x0f\x11\xbc\x9d\x0f\x0f\x01" } },
    .{ "EapHostPeerQueryUIBlobFromInteractiveUIInputFields", MethodRecord{ .library = "eappcfg", .import = "EapHostPeerQueryUIBlobFromInteractiveUIInputFields", .signature = "\x00\x09\x09\x09\x09\x09\x0f\x05\x0f\x11\xbc\xa9\x0f\x09\x0f\x0f\x05\x0f\x0f\x11\xbc\x9d\x0f\x0f\x01" } },
    .{ "EapHostPeerConfigXml2Blob", MethodRecord{ .library = "eappcfg", .import = "EapHostPeerConfigXml2Blob", .signature = "\x00\x06\x09\x09\x12\xbc\xad\x0f\x09\x0f\x0f\x05\x0f\x11\x97\x65\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerCredentialsXml2Blob", MethodRecord{ .library = "eappcfg", .import = "EapHostPeerCredentialsXml2Blob", .signature = "\x00\x08\x09\x09\x12\xbc\xad\x09\x0f\x05\x0f\x09\x0f\x0f\x05\x0f\x11\x97\x65\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerConfigBlob2Xml", MethodRecord{ .library = "eappcfg", .import = "EapHostPeerConfigBlob2Xml", .signature = "\x00\x06\x09\x09\x11\x97\x65\x09\x0f\x05\x0f\x12\xbc\xb1\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerFreeMemory", MethodRecord{ .library = "eappcfg", .import = "EapHostPeerFreeMemory", .signature = "\x00\x01\x01\x0f\x05" } },
    .{ "EapHostPeerFreeErrorMemory", MethodRecord{ .library = "eappcfg", .import = "EapHostPeerFreeErrorMemory", .signature = "\x00\x01\x01\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerInitialize", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerInitialize", .signature = "\x00\x00\x09" } },
    .{ "EapHostPeerUninitialize", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerUninitialize", .signature = "\x00\x00\x01" } },
    .{ "EapHostPeerBeginSession", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerBeginSession", .signature = "\x00\x0e\x09\x09\x11\x97\x65\x0f\x11\xbc\xb5\x11\x80\x85\x09\x0f\x05\x09\x0f\x05\x09\x0f\x11\x0d\x12\xbc\xb9\x0f\x01\x0f\x09\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerProcessReceivedPacket", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerProcessReceivedPacket", .signature = "\x00\x05\x09\x09\x09\x0f\x05\x0f\x11\xbc\xbd\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerGetSendPacket", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerGetSendPacket", .signature = "\x00\x04\x09\x09\x0f\x09\x0f\x0f\x05\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerGetResult", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerGetResult", .signature = "\x00\x04\x09\x09\x11\xbc\xc1\x0f\x11\xbc\xc5\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerGetUIContext", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerGetUIContext", .signature = "\x00\x04\x09\x09\x0f\x09\x0f\x0f\x05\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerSetUIContext", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerSetUIContext", .signature = "\x00\x05\x09\x09\x09\x0f\x05\x0f\x11\xbc\xbd\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerGetResponseAttributes", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerGetResponseAttributes", .signature = "\x00\x03\x09\x09\x0f\x11\xbc\xb5\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerSetResponseAttributes", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerSetResponseAttributes", .signature = "\x00\x04\x09\x09\x0f\x11\xbc\xb5\x0f\x11\xbc\xbd\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerGetAuthStatus", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerGetAuthStatus", .signature = "\x00\x05\x09\x09\x11\xbc\xc9\x0f\x09\x0f\x0f\x05\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerEndSession", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerEndSession", .signature = "\x00\x02\x09\x09\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerGetDataToUnplumbCredentials", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerGetDataToUnplumbCredentials", .signature = "\x00\x05\x09\x0f\x11\x0d\x0f\x18\x09\x0f\x0f\x11\xbc\x9d\x0f\x11\x59" } },
    .{ "EapHostPeerClearConnection", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerClearConnection", .signature = "\x00\x02\x09\x0f\x11\x0d\x0f\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerFreeEapError", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerFreeEapError", .signature = "\x00\x01\x01\x0f\x11\xbc\x9d" } },
    .{ "EapHostPeerGetIdentity", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerGetIdentity", .signature = "\x00\x0e\x09\x09\x09\x11\x97\x65\x09\x0f\x05\x09\x0f\x05\x11\x80\x85\x0f\x11\x59\x0f\x09\x0f\x0f\x05\x0f\x11\x05\x0f\x0f\x11\xbc\x9d\x0f\x0f\x05" } },
    .{ "EapHostPeerGetEncryptedPassword", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerGetEncryptedPassword", .signature = "\x00\x03\x09\x09\x11\x05\x0f\x11\x05" } },
    .{ "EapHostPeerFreeRuntimeMemory", MethodRecord{ .library = "eappprxy", .import = "EapHostPeerFreeRuntimeMemory", .signature = "\x00\x01\x01\x0f\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x1765 => TypeRefEntry{ .namespace = "Windows.Win32.Security.ExtensibleAuthenticationProtocol", .name = "EAP_METHOD_TYPE" },
        0x3c99 => TypeRefEntry{ .namespace = "Windows.Win32.Security.ExtensibleAuthenticationProtocol", .name = "EAP_METHOD_INFO_ARRAY" },
        0x3c9d => TypeRefEntry{ .namespace = "Windows.Win32.Security.ExtensibleAuthenticationProtocol", .name = "EAP_ERROR" },
        0x3ca1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.ExtensibleAuthenticationProtocol", .name = "EAP_METHOD_PROPERTY_ARRAY" },
        0x3ca5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.ExtensibleAuthenticationProtocol", .name = "EAP_CONFIG_INPUT_FIELD_ARRAY" },
        0x3ca9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.ExtensibleAuthenticationProtocol", .name = "EAP_INTERACTIVE_UI_DATA" },
        0x3cad => TypeRefEntry{ .namespace = "Windows.Win32.Data.Xml.MsXml", .name = "IXMLDOMNode" },
        0x3cb1 => TypeRefEntry{ .namespace = "Windows.Win32.Data.Xml.MsXml", .name = "IXMLDOMDocument2" },
        0x3cb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.ExtensibleAuthenticationProtocol", .name = "EAP_ATTRIBUTES" },
        0x3cb9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.ExtensibleAuthenticationProtocol", .name = "NotificationHandler" },
        0x3cbd => TypeRefEntry{ .namespace = "Windows.Win32.Security.ExtensibleAuthenticationProtocol", .name = "EapHostPeerResponseAction" },
        0x3cc1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.ExtensibleAuthenticationProtocol", .name = "EapHostPeerMethodResultReason" },
        0x3cc5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.ExtensibleAuthenticationProtocol", .name = "EapHostPeerMethodResult" },
        0x3cc9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.ExtensibleAuthenticationProtocol", .name = "EapHostPeerAuthParams" },
        else => null,
    };
}

pub const FACILITY_EAP_MESSAGE = 2114;
pub const EAP_GROUP_MASK = 65280;
pub const EAP_E_EAPHOST_FIRST = -2143158272;
pub const EAP_E_EAPHOST_LAST = -2143158017;
pub const EAP_I_EAPHOST_FIRST = -2143158272;
pub const EAP_I_EAPHOST_LAST = -2143158017;
pub const EAP_E_CERT_STORE_INACCESSIBLE = 2151809040;
pub const EAP_E_EAPHOST_METHOD_NOT_INSTALLED = 2151809041;
pub const EAP_E_EAPHOST_THIRDPARTY_METHOD_HOST_RESET = 2151809042;
pub const EAP_E_EAPHOST_EAPQEC_INACCESSIBLE = 2151809043;
pub const EAP_E_EAPHOST_IDENTITY_UNKNOWN = 2151809044;
pub const EAP_E_AUTHENTICATION_FAILED = 2151809045;
pub const EAP_I_EAPHOST_EAP_NEGOTIATION_FAILED = 1078067222;
pub const EAP_E_EAPHOST_METHOD_INVALID_PACKET = 2151809047;
pub const EAP_E_EAPHOST_REMOTE_INVALID_PACKET = 2151809048;
pub const EAP_E_EAPHOST_XML_MALFORMED = 2151809049;
pub const EAP_E_METHOD_CONFIG_DOES_NOT_SUPPORT_SSO = 2151809050;
pub const EAP_E_EAPHOST_METHOD_OPERATION_NOT_SUPPORTED = 2151809056;
pub const EAP_E_USER_FIRST = -2143158016;
pub const EAP_E_USER_LAST = -2143157761;
pub const EAP_I_USER_FIRST = 1078067456;
pub const EAP_I_USER_LAST = 1078067711;
pub const EAP_E_USER_CERT_NOT_FOUND = 2151809280;
pub const EAP_E_USER_CERT_INVALID = 2151809281;
pub const EAP_E_USER_CERT_EXPIRED = 2151809282;
pub const EAP_E_USER_CERT_REVOKED = 2151809283;
pub const EAP_E_USER_CERT_OTHER_ERROR = 2151809284;
pub const EAP_E_USER_CERT_REJECTED = 2151809285;
pub const EAP_I_USER_ACCOUNT_OTHER_ERROR = 1078067472;
pub const EAP_E_USER_CREDENTIALS_REJECTED = 2151809297;
pub const EAP_E_USER_NAME_PASSWORD_REJECTED = 2151809298;
pub const EAP_E_NO_SMART_CARD_READER = 2151809299;
pub const EAP_E_SERVER_FIRST = -2143157760;
pub const EAP_E_SERVER_LAST = -2143157505;
pub const EAP_E_SERVER_CERT_NOT_FOUND = 2151809536;
pub const EAP_E_SERVER_CERT_INVALID = 2151809537;
pub const EAP_E_SERVER_CERT_EXPIRED = 2151809538;
pub const EAP_E_SERVER_CERT_REVOKED = 2151809539;
pub const EAP_E_SERVER_CERT_OTHER_ERROR = 2151809540;
pub const EAP_E_USER_ROOT_CERT_FIRST = -2143157504;
pub const EAP_E_USER_ROOT_CERT_LAST = -2143157249;
pub const EAP_E_USER_ROOT_CERT_NOT_FOUND = 2151809792;
pub const EAP_E_USER_ROOT_CERT_INVALID = 2151809793;
pub const EAP_E_USER_ROOT_CERT_EXPIRED = 2151809794;
pub const EAP_E_SERVER_ROOT_CERT_FIRST = -2143157248;
pub const EAP_E_SERVER_ROOT_CERT_LAST = -2143156993;
pub const EAP_E_SERVER_ROOT_CERT_NOT_FOUND = 2151810048;
pub const EAP_E_SERVER_ROOT_CERT_INVALID = 2151810049;
pub const EAP_E_SERVER_ROOT_CERT_NAME_REQUIRED = 2151810054;
pub const EAP_E_SIM_NOT_VALID = 2151810304;
pub const EAP_METHOD_INVALID_PACKET = 2151809047;
pub const EAP_INVALID_PACKET = 2151809048;
pub const EAP_PEER_FLAG_GUEST_ACCESS = 64;
pub const eapPropCipherSuiteNegotiation = 1;
pub const eapPropMutualAuth = 2;
pub const eapPropIntegrity = 4;
pub const eapPropReplayProtection = 8;
pub const eapPropConfidentiality = 16;
pub const eapPropKeyDerivation = 32;
pub const eapPropKeyStrength64 = 64;
pub const eapPropKeyStrength128 = 128;
pub const eapPropKeyStrength256 = 256;
pub const eapPropKeyStrength512 = 512;
pub const eapPropKeyStrength1024 = 1024;
pub const eapPropDictionaryAttackResistance = 2048;
pub const eapPropFastReconnect = 4096;
pub const eapPropCryptoBinding = 8192;
pub const eapPropSessionIndependence = 16384;
pub const eapPropFragmentation = 32768;
pub const eapPropChannelBinding = 65536;
pub const eapPropNap = 131072;
pub const eapPropStandalone = 262144;
pub const eapPropMppeEncryption = 524288;
pub const eapPropTunnelMethod = 1048576;
pub const eapPropSupportsConfig = 2097152;
pub const eapPropCertifiedMethod = 4194304;
pub const eapPropHiddenMethod = 8388608;
pub const eapPropMachineAuth = 16777216;
pub const eapPropUserAuth = 33554432;
pub const eapPropIdentityPrivacy = 67108864;
pub const eapPropMethodChaining = 134217728;
pub const eapPropSharedStateEquivalence = 268435456;
pub const eapPropReserved = 2147483648;
pub const EAP_FLAG_Reserved1 = 1;
pub const EAP_FLAG_NON_INTERACTIVE = 2;
pub const EAP_FLAG_LOGON = 4;
pub const EAP_FLAG_PREVIEW = 8;
pub const EAP_FLAG_Reserved2 = 16;
pub const EAP_FLAG_MACHINE_AUTH = 32;
pub const EAP_FLAG_GUEST_ACCESS = 64;
pub const EAP_FLAG_Reserved3 = 128;
pub const EAP_FLAG_Reserved4 = 256;
pub const EAP_FLAG_RESUME_FROM_HIBERNATE = 512;
pub const EAP_FLAG_Reserved5 = 1024;
pub const EAP_FLAG_Reserved6 = 2048;
pub const EAP_FLAG_FULL_AUTH = 4096;
pub const EAP_FLAG_PREFER_ALT_CREDENTIALS = 8192;
pub const EAP_FLAG_Reserved7 = 16384;
pub const EAP_PEER_FLAG_HEALTH_STATE_CHANGE = 32768;
pub const EAP_FLAG_SUPRESS_UI = 65536;
pub const EAP_FLAG_PRE_LOGON = 131072;
pub const EAP_FLAG_USER_AUTH = 262144;
pub const EAP_FLAG_CONFG_READONLY = 524288;
pub const EAP_FLAG_Reserved8 = 1048576;
pub const EAP_FLAG_Reserved9 = 4194304;
pub const EAP_FLAG_VPN = 8388608;
pub const EAP_FLAG_ONLY_EAP_TLS = 16777216;
pub const EAP_FLAG_SERVER_VALIDATION_REQUIRED = 33554432;
pub const EAP_CONFIG_INPUT_FIELD_PROPS_DEFAULT = 0;
pub const EAP_CONFIG_INPUT_FIELD_PROPS_NON_DISPLAYABLE = 1;
pub const EAP_CONFIG_INPUT_FIELD_PROPS_NON_PERSIST = 2;
pub const EAP_UI_INPUT_FIELD_PROPS_DEFAULT = 0;
pub const EAP_UI_INPUT_FIELD_PROPS_NON_DISPLAYABLE = 1;
pub const EAP_UI_INPUT_FIELD_PROPS_NON_PERSIST = 2;
pub const EAP_UI_INPUT_FIELD_PROPS_READ_ONLY = 4;
pub const EAP_CREDENTIAL_VERSION = 1;
pub const EAP_INTERACTIVE_UI_DATA_VERSION = 1;
pub const EAPHOST_PEER_API_VERSION = 1;
pub const EAPHOST_METHOD_API_VERSION = 1;
pub const MAX_EAP_CONFIG_INPUT_FIELD_LENGTH = 256;
pub const MAX_EAP_CONFIG_INPUT_FIELD_VALUE_LENGTH = 1024;
pub const CERTIFICATE_HASH_LENGTH = 20;
pub const NCRYPT_PIN_CACHE_PIN_BYTE_LENGTH = 90;
pub const EAP_METHOD_AUTHENTICATOR_CONFIG_IS_IDENTITY_PRIVACY = 1;
pub const RAS_EAP_ROLE_AUTHENTICATOR = 1;
pub const RAS_EAP_ROLE_AUTHENTICATEE = 2;
pub const RAS_EAP_ROLE_EXCLUDE_IN_EAP = 4;
pub const RAS_EAP_ROLE_EXCLUDE_IN_PEAP = 8;
pub const RAS_EAP_ROLE_EXCLUDE_IN_VPN = 16;
pub const raatARAPChallenge = 33;
pub const raatARAPOldPassword = 19;
pub const raatARAPNewPassword = 20;
pub const raatARAPPasswordChangeReason = 21;
pub const EAPCODE_Request = 1;
pub const EAPCODE_Response = 2;
pub const EAPCODE_Success = 3;
pub const EAPCODE_Failure = 4;
pub const MAXEAPCODE = 4;
pub const RAS_EAP_FLAG_ROUTER = 1;
pub const RAS_EAP_FLAG_NON_INTERACTIVE = 2;
pub const RAS_EAP_FLAG_LOGON = 4;
pub const RAS_EAP_FLAG_PREVIEW = 8;
pub const RAS_EAP_FLAG_FIRST_LINK = 16;
pub const RAS_EAP_FLAG_MACHINE_AUTH = 32;
pub const RAS_EAP_FLAG_GUEST_ACCESS = 64;
pub const RAS_EAP_FLAG_8021X_AUTH = 128;
pub const RAS_EAP_FLAG_HOSTED_IN_PEAP = 256;
pub const RAS_EAP_FLAG_RESUME_FROM_HIBERNATE = 512;
pub const RAS_EAP_FLAG_PEAP_UPFRONT = 1024;
pub const RAS_EAP_FLAG_ALTERNATIVE_USER_DB = 2048;
pub const RAS_EAP_FLAG_PEAP_FORCE_FULL_AUTH = 4096;
pub const RAS_EAP_FLAG_PRE_LOGON = 131072;
pub const RAS_EAP_FLAG_CONFG_READONLY = 524288;
pub const RAS_EAP_FLAG_RESERVED = 1048576;
pub const RAS_EAP_FLAG_SAVE_CREDMAN = 2097152;
pub const RAS_EAP_FLAG_SERVER_VALIDATION_REQUIRED = 33554432;
pub const raatMinimum = 0;
pub const raatUserName = 1;
pub const raatUserPassword = 2;
pub const raatMD5CHAPPassword = 3;
pub const raatNASIPAddress = 4;
pub const raatNASPort = 5;
pub const raatServiceType = 6;
pub const raatFramedProtocol = 7;
pub const raatFramedIPAddress = 8;
pub const raatFramedIPNetmask = 9;
pub const raatFramedRouting = 10;
pub const raatFilterId = 11;
pub const raatFramedMTU = 12;
pub const raatFramedCompression = 13;
pub const raatLoginIPHost = 14;
pub const raatLoginService = 15;
pub const raatLoginTCPPort = 16;
pub const raatUnassigned17 = 17;
pub const raatReplyMessage = 18;
pub const raatCallbackNumber = 19;
pub const raatCallbackId = 20;
pub const raatUnassigned21 = 21;
pub const raatFramedRoute = 22;
pub const raatFramedIPXNetwork = 23;
pub const raatState = 24;
pub const raatClass = 25;
pub const raatVendorSpecific = 26;
pub const raatSessionTimeout = 27;
pub const raatIdleTimeout = 28;
pub const raatTerminationAction = 29;
pub const raatCalledStationId = 30;
pub const raatCallingStationId = 31;
pub const raatNASIdentifier = 32;
pub const raatProxyState = 33;
pub const raatLoginLATService = 34;
pub const raatLoginLATNode = 35;
pub const raatLoginLATGroup = 36;
pub const raatFramedAppleTalkLink = 37;
pub const raatFramedAppleTalkNetwork = 38;
pub const raatFramedAppleTalkZone = 39;
pub const raatAcctStatusType = 40;
pub const raatAcctDelayTime = 41;
pub const raatAcctInputOctets = 42;
pub const raatAcctOutputOctets = 43;
pub const raatAcctSessionId = 44;
pub const raatAcctAuthentic = 45;
pub const raatAcctSessionTime = 46;
pub const raatAcctInputPackets = 47;
pub const raatAcctOutputPackets = 48;
pub const raatAcctTerminateCause = 49;
pub const raatAcctMultiSessionId = 50;
pub const raatAcctLinkCount = 51;
pub const raatAcctEventTimeStamp = 55;
pub const raatMD5CHAPChallenge = 60;
pub const raatNASPortType = 61;
pub const raatPortLimit = 62;
pub const raatLoginLATPort = 63;
pub const raatTunnelType = 64;
pub const raatTunnelMediumType = 65;
pub const raatTunnelClientEndpoint = 66;
pub const raatTunnelServerEndpoint = 67;
pub const raatARAPPassword = 70;
pub const raatARAPFeatures = 71;
pub const raatARAPZoneAccess = 72;
pub const raatARAPSecurity = 73;
pub const raatARAPSecurityData = 74;
pub const raatPasswordRetry = 75;
pub const raatPrompt = 76;
pub const raatConnectInfo = 77;
pub const raatConfigurationToken = 78;
pub const raatEAPMessage = 79;
pub const raatSignature = 80;
pub const raatARAPChallengeResponse = 84;
pub const raatAcctInterimInterval = 85;
pub const raatNASIPv6Address = 95;
pub const raatFramedInterfaceId = 96;
pub const raatFramedIPv6Prefix = 97;
pub const raatLoginIPv6Host = 98;
pub const raatFramedIPv6Route = 99;
pub const raatFramedIPv6Pool = 100;
pub const raatARAPGuestLogon = 8096;
pub const raatCertificateOID = 8097;
pub const raatEAPConfiguration = 8098;
pub const raatPEAPEmbeddedEAPTypeId = 8099;
pub const raatInnerEAPTypeId = 8099;
pub const raatPEAPFastRoamedSession = 8100;
pub const raatFastRoamedSession = 8100;
pub const raatEAPTLV = 8102;
pub const raatCredentialsChanged = 8103;
pub const raatCertificateThumbprint = 8250;
pub const raatPeerId = 9000;
pub const raatServerId = 9001;
pub const raatMethodId = 9002;
pub const raatEMSK = 9003;
pub const raatSessionId = 9004;
pub const raatReserved = -1;
pub const EAPACTION_NoAction = 0;
pub const EAPACTION_Authenticate = 1;
pub const EAPACTION_Done = 2;
pub const EAPACTION_SendAndDone = 3;
pub const EAPACTION_Send = 4;
pub const EAPACTION_SendWithTimeout = 5;
pub const EAPACTION_SendWithTimeoutInteractive = 6;
pub const EAPACTION_IndicateTLV = 7;
pub const EAPACTION_IndicateIdentity = 8;
pub const eatMinimum = 0;
pub const eatUserName = 1;
pub const eatUserPassword = 2;
pub const eatMD5CHAPPassword = 3;
pub const eatNASIPAddress = 4;
pub const eatNASPort = 5;
pub const eatServiceType = 6;
pub const eatFramedProtocol = 7;
pub const eatFramedIPAddress = 8;
pub const eatFramedIPNetmask = 9;
pub const eatFramedRouting = 10;
pub const eatFilterId = 11;
pub const eatFramedMTU = 12;
pub const eatFramedCompression = 13;
pub const eatLoginIPHost = 14;
pub const eatLoginService = 15;
pub const eatLoginTCPPort = 16;
pub const eatUnassigned17 = 17;
pub const eatReplyMessage = 18;
pub const eatCallbackNumber = 19;
pub const eatCallbackId = 20;
pub const eatUnassigned21 = 21;
pub const eatFramedRoute = 22;
pub const eatFramedIPXNetwork = 23;
pub const eatState = 24;
pub const eatClass = 25;
pub const eatVendorSpecific = 26;
pub const eatSessionTimeout = 27;
pub const eatIdleTimeout = 28;
pub const eatTerminationAction = 29;
pub const eatCalledStationId = 30;
pub const eatCallingStationId = 31;
pub const eatNASIdentifier = 32;
pub const eatProxyState = 33;
pub const eatLoginLATService = 34;
pub const eatLoginLATNode = 35;
pub const eatLoginLATGroup = 36;
pub const eatFramedAppleTalkLink = 37;
pub const eatFramedAppleTalkNetwork = 38;
pub const eatFramedAppleTalkZone = 39;
pub const eatAcctStatusType = 40;
pub const eatAcctDelayTime = 41;
pub const eatAcctInputOctets = 42;
pub const eatAcctOutputOctets = 43;
pub const eatAcctSessionId = 44;
pub const eatAcctAuthentic = 45;
pub const eatAcctSessionTime = 46;
pub const eatAcctInputPackets = 47;
pub const eatAcctOutputPackets = 48;
pub const eatAcctTerminateCause = 49;
pub const eatAcctMultiSessionId = 50;
pub const eatAcctLinkCount = 51;
pub const eatAcctEventTimeStamp = 55;
pub const eatMD5CHAPChallenge = 60;
pub const eatNASPortType = 61;
pub const eatPortLimit = 62;
pub const eatLoginLATPort = 63;
pub const eatTunnelType = 64;
pub const eatTunnelMediumType = 65;
pub const eatTunnelClientEndpoint = 66;
pub const eatTunnelServerEndpoint = 67;
pub const eatARAPPassword = 70;
pub const eatARAPFeatures = 71;
pub const eatARAPZoneAccess = 72;
pub const eatARAPSecurity = 73;
pub const eatARAPSecurityData = 74;
pub const eatPasswordRetry = 75;
pub const eatPrompt = 76;
pub const eatConnectInfo = 77;
pub const eatConfigurationToken = 78;
pub const eatEAPMessage = 79;
pub const eatSignature = 80;
pub const eatARAPChallengeResponse = 84;
pub const eatAcctInterimInterval = 85;
pub const eatNASIPv6Address = 95;
pub const eatFramedInterfaceId = 96;
pub const eatFramedIPv6Prefix = 97;
pub const eatLoginIPv6Host = 98;
pub const eatFramedIPv6Route = 99;
pub const eatFramedIPv6Pool = 100;
pub const eatARAPGuestLogon = 8096;
pub const eatCertificateOID = 8097;
pub const eatEAPConfiguration = 8098;
pub const eatPEAPEmbeddedEAPTypeId = 8099;
pub const eatPEAPFastRoamedSession = 8100;
pub const eatFastRoamedSession = 8100;
pub const eatEAPTLV = 8102;
pub const eatCredentialsChanged = 8103;
pub const eatInnerEapMethodType = 8104;
pub const eatClearTextPassword = 8107;
pub const eatQuarantineSoH = 8150;
pub const eatCertificateThumbprint = 8250;
pub const eatPeerId = 9000;
pub const eatServerId = 9001;
pub const eatMethodId = 9002;
pub const eatEMSK = 9003;
pub const eatSessionId = 9004;
pub const eatReserved = -1;
pub const EapConfigInputUsername = 0;
pub const EapConfigInputPassword = 1;
pub const EapConfigInputNetworkUsername = 2;
pub const EapConfigInputNetworkPassword = 3;
pub const EapConfigInputPin = 4;
pub const EapConfigInputPSK = 5;
pub const EapConfigInputEdit = 6;
pub const EapConfigSmartCardUsername = 7;
pub const EapConfigSmartCardError = 8;
pub const EapCredReq = 0;
pub const EapCredResp = 1;
pub const EapCredExpiryReq = 2;
pub const EapCredExpiryResp = 3;
pub const EapCredLogonReq = 4;
pub const EapCredLogonResp = 5;
pub const emptPropCipherSuiteNegotiation = 0;
pub const emptPropMutualAuth = 1;
pub const emptPropIntegrity = 2;
pub const emptPropReplayProtection = 3;
pub const emptPropConfidentiality = 4;
pub const emptPropKeyDerivation = 5;
pub const emptPropKeyStrength64 = 6;
pub const emptPropKeyStrength128 = 7;
pub const emptPropKeyStrength256 = 8;
pub const emptPropKeyStrength512 = 9;
pub const emptPropKeyStrength1024 = 10;
pub const emptPropDictionaryAttackResistance = 11;
pub const emptPropFastReconnect = 12;
pub const emptPropCryptoBinding = 13;
pub const emptPropSessionIndependence = 14;
pub const emptPropFragmentation = 15;
pub const emptPropChannelBinding = 16;
pub const emptPropNap = 17;
pub const emptPropStandalone = 18;
pub const emptPropMppeEncryption = 19;
pub const emptPropTunnelMethod = 20;
pub const emptPropSupportsConfig = 21;
pub const emptPropCertifiedMethod = 22;
pub const emptPropHiddenMethod = 23;
pub const emptPropMachineAuth = 24;
pub const emptPropUserAuth = 25;
pub const emptPropIdentityPrivacy = 26;
pub const emptPropMethodChaining = 27;
pub const emptPropSharedStateEquivalence = 28;
pub const emptLegacyMethodPropertyFlag = 31;
pub const emptPropVendorSpecific = 255;
pub const empvtBool = 0;
pub const empvtDword = 1;
pub const empvtString = 2;
pub const EAP_EMPTY_CREDENTIAL = 0;
pub const EAP_USERNAME_PASSWORD_CREDENTIAL = 1;
pub const EAP_WINLOGON_CREDENTIAL = 2;
pub const EAP_CERTIFICATE_CREDENTIAL = 3;
pub const EAP_SIM_CREDENTIAL = 4;
pub const EapHostPeerMethodResultAltSuccessReceived = 1;
pub const EapHostPeerMethodResultTimeout = 2;
pub const EapHostPeerMethodResultFromMethod = 3;
pub const EapHostPeerResponseDiscard = 0;
pub const EapHostPeerResponseSend = 1;
pub const EapHostPeerResponseResult = 2;
pub const EapHostPeerResponseInvokeUi = 3;
pub const EapHostPeerResponseRespond = 4;
pub const EapHostPeerResponseStartAuthentication = 5;
pub const EapHostPeerResponseNone = 6;
pub const EapHostPeerAuthStatus = 1;
pub const EapHostPeerIdentity = 2;
pub const EapHostPeerIdentityExtendedInfo = 3;
pub const EapHostNapInfo = 4;
pub const EapHostInvalidSession = 0;
pub const EapHostAuthNotStarted = 1;
pub const EapHostAuthIdentityExchange = 2;
pub const EapHostAuthNegotiatingType = 3;
pub const EapHostAuthInProgress = 4;
pub const EapHostAuthSucceeded = 5;
pub const EapHostAuthFailed = 6;
pub const ISOLATION_STATE_UNKNOWN = 0;
pub const ISOLATION_STATE_NOT_RESTRICTED = 1;
pub const ISOLATION_STATE_IN_PROBATION = 2;
pub const ISOLATION_STATE_RESTRICTED_ACCESS = 3;
pub const EapCodeMinimum = 1;
pub const EapCodeRequest = 1;
pub const EapCodeResponse = 2;
pub const EapCodeSuccess = 3;
pub const EapCodeFailure = 4;
pub const EapCodeMaximum = 4;
pub const EAP_METHOD_AUTHENTICATOR_RESPONSE_DISCARD = 0;
pub const EAP_METHOD_AUTHENTICATOR_RESPONSE_SEND = 1;
pub const EAP_METHOD_AUTHENTICATOR_RESPONSE_RESULT = 2;
pub const EAP_METHOD_AUTHENTICATOR_RESPONSE_RESPOND = 3;
pub const EAP_METHOD_AUTHENTICATOR_RESPONSE_AUTHENTICATE = 4;
pub const EAP_METHOD_AUTHENTICATOR_RESPONSE_HANDLE_IDENTITY = 5;
pub const EapPeerMethodResponseActionDiscard = 0;
pub const EapPeerMethodResponseActionSend = 1;
pub const EapPeerMethodResponseActionResult = 2;
pub const EapPeerMethodResponseActionInvokeUI = 3;
pub const EapPeerMethodResponseActionRespond = 4;
pub const EapPeerMethodResponseActionNone = 5;
pub const EapPeerMethodResultUnknown = 1;
pub const EapPeerMethodResultSuccess = 2;
pub const EapPeerMethodResultFailure = 3;
pub const EAP_AUTHENTICATOR_SEND_TIMEOUT_NONE = 0;
pub const EAP_AUTHENTICATOR_SEND_TIMEOUT_BASIC = 1;
pub const EAP_AUTHENTICATOR_SEND_TIMEOUT_INTERACTIVE = 2;

pub const aliases = struct {
    pub const RAS_AUTH_ATTRIBUTE_TYPE = i32;
    pub const PPP_EAP_ACTION = i32;
    pub const EAP_ATTRIBUTE_TYPE = i32;
    pub const EAP_CONFIG_INPUT_FIELD_TYPE = i32;
    pub const EAP_INTERACTIVE_UI_DATA_TYPE = i32;
    pub const EAP_METHOD_PROPERTY_TYPE = i32;
    pub const EAP_METHOD_PROPERTY_VALUE_TYPE = i32;
    pub const EapCredentialType = i32;
    pub const EapHostPeerMethodResultReason = i32;
    pub const EapHostPeerResponseAction = i32;
    pub const EapHostPeerAuthParams = i32;
    pub const EAPHOST_AUTH_STATUS = i32;
    pub const ISOLATION_STATE = i32;
    pub const EapCode = i32;
    pub const EAP_METHOD_AUTHENTICATOR_RESPONSE_ACTION = i32;
    pub const EapPeerMethodResponseAction = i32;
    pub const EapPeerMethodResultReason = i32;
    pub const EAP_AUTHENTICATOR_SEND_TIMEOUT = i32;
    pub const NotificationHandler = ?*const anyopaque;
};
