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
    .{ "WSDCreateUdpMessageParameters", MethodRecord{ .library = "wsdapi", .import = "WSDCreateUdpMessageParameters", .signature = "\x00\x01\x11\x79\x0f\x12\xad\x11" } },
    .{ "WSDCreateUdpAddress", MethodRecord{ .library = "wsdapi", .import = "WSDCreateUdpAddress", .signature = "\x00\x01\x11\x79\x0f\x12\xad\x15" } },
    .{ "WSDCreateHttpMessageParameters", MethodRecord{ .library = "wsdapi", .import = "WSDCreateHttpMessageParameters", .signature = "\x00\x01\x11\x79\x0f\x12\xad\x19" } },
    .{ "WSDCreateHttpAddress", MethodRecord{ .library = "wsdapi", .import = "WSDCreateHttpAddress", .signature = "\x00\x01\x11\x79\x0f\x12\xad\x1d" } },
    .{ "WSDCreateOutboundAttachment", MethodRecord{ .library = "wsdapi", .import = "WSDCreateOutboundAttachment", .signature = "\x00\x01\x11\x79\x0f\x12\xad\x21" } },
    .{ "WSDXMLGetNameFromBuiltinNamespace", MethodRecord{ .library = "wsdapi", .import = "WSDXMLGetNameFromBuiltinNamespace", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x0f\x0f\x11\xad\x25" } },
    .{ "WSDXMLCreateContext", MethodRecord{ .library = "wsdapi", .import = "WSDXMLCreateContext", .signature = "\x00\x01\x11\x79\x0f\x12\xad\x29" } },
    .{ "WSDCreateDiscoveryProvider", MethodRecord{ .library = "wsdapi", .import = "WSDCreateDiscoveryProvider", .signature = "\x00\x02\x11\x79\x12\xad\x29\x0f\x12\xad\x2d" } },
    .{ "WSDCreateDiscoveryProvider2", MethodRecord{ .library = "wsdapi", .import = "WSDCreateDiscoveryProvider2", .signature = "\x00\x04\x11\x79\x12\xad\x29\x0f\x11\xad\x31\x09\x0f\x12\xad\x2d" } },
    .{ "WSDCreateDiscoveryPublisher", MethodRecord{ .library = "wsdapi", .import = "WSDCreateDiscoveryPublisher", .signature = "\x00\x02\x11\x79\x12\xad\x29\x0f\x12\xad\x35" } },
    .{ "WSDCreateDiscoveryPublisher2", MethodRecord{ .library = "wsdapi", .import = "WSDCreateDiscoveryPublisher2", .signature = "\x00\x04\x11\x79\x12\xad\x29\x0f\x11\xad\x31\x09\x0f\x12\xad\x35" } },
    .{ "WSDCreateDeviceProxy", MethodRecord{ .library = "wsdapi", .import = "WSDCreateDeviceProxy", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x12\xad\x29\x0f\x12\xad\x39" } },
    .{ "WSDCreateDeviceProxyAdvanced", MethodRecord{ .library = "wsdapi", .import = "WSDCreateDeviceProxyAdvanced", .signature = "\x00\x05\x11\x79\x11\x05\x12\xad\x3d\x11\x05\x12\xad\x29\x0f\x12\xad\x39" } },
    .{ "WSDCreateDeviceProxy2", MethodRecord{ .library = "wsdapi", .import = "WSDCreateDeviceProxy2", .signature = "\x00\x06\x11\x79\x11\x05\x11\x05\x12\xad\x29\x0f\x11\xad\x31\x09\x0f\x12\xad\x39" } },
    .{ "WSDCreateDeviceHost", MethodRecord{ .library = "wsdapi", .import = "WSDCreateDeviceHost", .signature = "\x00\x03\x11\x79\x11\x05\x12\xad\x29\x0f\x12\xad\x41" } },
    .{ "WSDCreateDeviceHostAdvanced", MethodRecord{ .library = "wsdapi", .import = "WSDCreateDeviceHostAdvanced", .signature = "\x00\x05\x11\x79\x11\x05\x12\xad\x29\x0f\x12\xad\x3d\x09\x0f\x12\xad\x41" } },
    .{ "WSDCreateDeviceHost2", MethodRecord{ .library = "wsdapi", .import = "WSDCreateDeviceHost2", .signature = "\x00\x05\x11\x79\x11\x05\x12\xad\x29\x0f\x11\xad\x31\x09\x0f\x12\xad\x41" } },
    .{ "WSDSetConfigurationOption", MethodRecord{ .library = "wsdapi", .import = "WSDSetConfigurationOption", .signature = "\x00\x03\x11\x79\x09\x0f\x01\x09" } },
    .{ "WSDGetConfigurationOption", MethodRecord{ .library = "wsdapi", .import = "WSDGetConfigurationOption", .signature = "\x00\x03\x11\x79\x09\x0f\x01\x09" } },
    .{ "WSDAllocateLinkedMemory", MethodRecord{ .library = "wsdapi", .import = "WSDAllocateLinkedMemory", .signature = "\x00\x02\x0f\x01\x0f\x01\x19" } },
    .{ "WSDFreeLinkedMemory", MethodRecord{ .library = "wsdapi", .import = "WSDFreeLinkedMemory", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "WSDAttachLinkedMemory", MethodRecord{ .library = "wsdapi", .import = "WSDAttachLinkedMemory", .signature = "\x00\x02\x01\x0f\x01\x0f\x01" } },
    .{ "WSDDetachLinkedMemory", MethodRecord{ .library = "wsdapi", .import = "WSDDetachLinkedMemory", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "WSDXMLBuildAnyForSingleElement", MethodRecord{ .library = "wsdapi", .import = "WSDXMLBuildAnyForSingleElement", .signature = "\x00\x03\x11\x79\x0f\x11\xad\x25\x11\x05\x0f\x0f\x11\xad\x45" } },
    .{ "WSDXMLGetValueFromAny", MethodRecord{ .library = "wsdapi", .import = "WSDXMLGetValueFromAny", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x0f\x11\xad\x45\x0f\x11\x05" } },
    .{ "WSDXMLAddSibling", MethodRecord{ .library = "wsdapi", .import = "WSDXMLAddSibling", .signature = "\x00\x02\x11\x79\x0f\x11\xad\x45\x0f\x11\xad\x45" } },
    .{ "WSDXMLAddChild", MethodRecord{ .library = "wsdapi", .import = "WSDXMLAddChild", .signature = "\x00\x02\x11\x79\x0f\x11\xad\x45\x0f\x11\xad\x45" } },
    .{ "WSDXMLCleanupElement", MethodRecord{ .library = "wsdapi", .import = "WSDXMLCleanupElement", .signature = "\x00\x01\x11\x79\x0f\x11\xad\x45" } },
    .{ "WSDGenerateFault", MethodRecord{ .library = "wsdapi", .import = "WSDGenerateFault", .signature = "\x00\x06\x11\x79\x11\x05\x11\x05\x11\x05\x11\x05\x12\xad\x29\x0f\x0f\x11\xad\x49" } },
    .{ "WSDGenerateFaultEx", MethodRecord{ .library = "wsdapi", .import = "WSDGenerateFaultEx", .signature = "\x00\x05\x11\x79\x0f\x11\xad\x25\x0f\x11\xad\x25\x0f\x11\xad\x4d\x11\x05\x0f\x0f\x11\xad\x49" } },
    .{ "WSDUriEncode", MethodRecord{ .library = "wsdapi", .import = "WSDUriEncode", .signature = "\x00\x04\x11\x79\x11\x05\x09\x0f\x11\x05\x0f\x09" } },
    .{ "WSDUriDecode", MethodRecord{ .library = "wsdapi", .import = "WSDUriDecode", .signature = "\x00\x04\x11\x79\x11\x05\x09\x0f\x11\x05\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2d11 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "IWSDUdpMessageParameters" },
        0x2d15 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "IWSDUdpAddress" },
        0x2d19 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "IWSDHttpMessageParameters" },
        0x2d1d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "IWSDHttpAddress" },
        0x2d21 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "IWSDOutboundAttachment" },
        0x2d25 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "WSDXML_NAME" },
        0x2d29 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "IWSDXMLContext" },
        0x2d2d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "IWSDiscoveryProvider" },
        0x2d31 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "WSD_CONFIG_PARAM" },
        0x2d35 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "IWSDiscoveryPublisher" },
        0x2d39 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "IWSDDeviceProxy" },
        0x2d3d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "IWSDAddress" },
        0x2d41 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "IWSDDeviceHost" },
        0x2d45 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "WSDXML_ELEMENT" },
        0x2d49 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "WSD_SOAP_FAULT" },
        0x2d4d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.WebServicesOnDevices", .name = "WSD_LOCALIZED_STRING_LIST" },
        else => null,
    };
}

pub const WSDAPI_OPTION_MAX_INBOUND_MESSAGE_SIZE = 1;
pub const WSDAPI_OPTION_TRACE_XML_TO_DEBUGGER = 2;
pub const WSDAPI_OPTION_TRACE_XML_TO_FILE = 3;
pub const WSDAPI_SSL_CERT_APPLY_DEFAULT_CHECKS = 0;
pub const WSDAPI_SSL_CERT_IGNORE_REVOCATION = 1;
pub const WSDAPI_SSL_CERT_IGNORE_EXPIRY = 2;
pub const WSDAPI_SSL_CERT_IGNORE_WRONG_USAGE = 4;
pub const WSDAPI_SSL_CERT_IGNORE_UNKNOWN_CA = 8;
pub const WSDAPI_SSL_CERT_IGNORE_INVALID_CN = 16;
pub const WSDAPI_COMPACTSIG_ACCEPT_ALL_MESSAGES = 1;
pub const WSD_SECURITY_HTTP_AUTH_SCHEME_NEGOTIATE = 1;
pub const WSD_SECURITY_HTTP_AUTH_SCHEME_NTLM = 2;
pub const WSDAPI_ADDRESSFAMILY_IPV4 = 1;
pub const WSDAPI_ADDRESSFAMILY_IPV6 = 2;
pub const WSD_CONFIG_MAX_INBOUND_MESSAGE_SIZE = 1;
pub const WSD_CONFIG_MAX_OUTBOUND_MESSAGE_SIZE = 2;
pub const WSD_SECURITY_SSL_CERT_FOR_CLIENT_AUTH = 3;
pub const WSD_SECURITY_SSL_SERVER_CERT_VALIDATION = 4;
pub const WSD_SECURITY_SSL_CLIENT_CERT_VALIDATION = 5;
pub const WSD_SECURITY_SSL_NEGOTIATE_CLIENT_CERT = 6;
pub const WSD_SECURITY_COMPACTSIG_SIGNING_CERT = 7;
pub const WSD_SECURITY_COMPACTSIG_VALIDATION = 8;
pub const WSD_CONFIG_HOSTING_ADDRESSES = 9;
pub const WSD_CONFIG_DEVICE_ADDRESSES = 10;
pub const WSD_SECURITY_REQUIRE_HTTP_CLIENT_AUTH = 11;
pub const WSD_SECURITY_REQUIRE_CLIENT_CERT_OR_HTTP_CLIENT_AUTH = 12;
pub const WSD_SECURITY_USE_HTTP_CLIENT_AUTH = 13;
pub const ONE_WAY = 0;
pub const TWO_WAY = 1;
pub const OpNone = 0;
pub const OpEndOfTable = 1;
pub const OpBeginElement_ = 2;
pub const OpBeginAnyElement = 3;
pub const OpEndElement = 4;
pub const OpElement_ = 5;
pub const OpAnyElement = 6;
pub const OpAnyElements = 7;
pub const OpAnyText = 8;
pub const OpAttribute_ = 9;
pub const OpBeginChoice = 10;
pub const OpEndChoice = 11;
pub const OpBeginSequence = 12;
pub const OpEndSequence = 13;
pub const OpBeginAll = 14;
pub const OpEndAll = 15;
pub const OpAnything = 16;
pub const OpAnyNumber = 17;
pub const OpOneOrMore = 18;
pub const OpOptional = 19;
pub const OpFormatBool_ = 20;
pub const OpFormatInt8_ = 21;
pub const OpFormatInt16_ = 22;
pub const OpFormatInt32_ = 23;
pub const OpFormatInt64_ = 24;
pub const OpFormatUInt8_ = 25;
pub const OpFormatUInt16_ = 26;
pub const OpFormatUInt32_ = 27;
pub const OpFormatUInt64_ = 28;
pub const OpFormatUnicodeString_ = 29;
pub const OpFormatDom_ = 30;
pub const OpFormatStruct_ = 31;
pub const OpFormatUri_ = 32;
pub const OpFormatUuidUri_ = 33;
pub const OpFormatName_ = 34;
pub const OpFormatListInsertTail_ = 35;
pub const OpFormatType_ = 36;
pub const OpFormatDynamicType_ = 37;
pub const OpFormatLookupType_ = 38;
pub const OpFormatDuration_ = 39;
pub const OpFormatDateTime_ = 40;
pub const OpFormatFloat_ = 41;
pub const OpFormatDouble_ = 42;
pub const OpProcess_ = 43;
pub const OpQualifiedAttribute_ = 44;
pub const OpFormatXMLDeclaration_ = 45;
pub const OpFormatMax = 46;
pub const ElementType = 0;
pub const TextType = 1;
pub const MulticastDiscovery = 0;
pub const DirectedDiscovery = 1;
pub const SecureDirectedDiscovery = 2;
pub const WSD_PT_NONE = 0;
pub const WSD_PT_UDP = 1;
pub const WSD_PT_HTTP = 2;
pub const WSD_PT_HTTPS = 4;
pub const WSD_PT_ALL = 255;
pub const WSDET_NONE = 0;
pub const WSDET_INCOMING_MESSAGE = 1;
pub const WSDET_INCOMING_FAULT = 2;
pub const WSDET_TRANSMISSION_FAILURE = 3;
pub const WSDET_RESPONSE_TIMEOUT = 4;

pub const aliases = struct {
    pub const WSD_CONFIG_PARAM_TYPE = i32;
    pub const WSDUdpMessageType = i32;
    pub const WSDXML_OP = i32;
    pub const DeviceDiscoveryMechanism = i32;
    pub const WSD_PROTOCOL_TYPE = i32;
    pub const WSDEventType = i32;
    pub const WSD_STUB_FUNCTION = ?*const anyopaque;
    pub const PWSD_SOAP_MESSAGE_HANDLER = ?*const anyopaque;
};
