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
    .{ "SwDeviceCreate", MethodRecord{ .library = "CFGMGR32", .import = "SwDeviceCreate", .signature = "\x00\x08\x11\x79\x11\x05\x11\x05\x0f\x11\xab\x65\x09\x0f\x11\xab\x69\x12\xab\x6d\x0f\x01\x0f\x11\xab\x71" } },
    .{ "SwDeviceClose", MethodRecord{ .library = "CFGMGR32", .import = "SwDeviceClose", .signature = "\x00\x01\x01\x11\xab\x71" } },
    .{ "SwDeviceSetLifetime", MethodRecord{ .library = "CFGMGR32", .import = "SwDeviceSetLifetime", .signature = "\x00\x02\x11\x79\x11\xab\x71\x11\xab\x75" } },
    .{ "SwDeviceGetLifetime", MethodRecord{ .library = "CFGMGR32", .import = "SwDeviceGetLifetime", .signature = "\x00\x02\x11\x79\x11\xab\x71\x0f\x11\xab\x75" } },
    .{ "SwDevicePropertySet", MethodRecord{ .library = "CFGMGR32", .import = "SwDevicePropertySet", .signature = "\x00\x03\x11\x79\x11\xab\x71\x09\x0f\x11\xab\x69" } },
    .{ "SwDeviceInterfaceRegister", MethodRecord{ .library = "CFGMGR32", .import = "SwDeviceInterfaceRegister", .signature = "\x00\x07\x11\x79\x11\xab\x71\x0f\x11\x0d\x11\x05\x09\x0f\x11\xab\x69\x11\x59\x0f\x11\x05" } },
    .{ "SwMemFree", MethodRecord{ .library = "CFGMGR32", .import = "SwMemFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "SwDeviceInterfaceSetState", MethodRecord{ .library = "CFGMGR32", .import = "SwDeviceInterfaceSetState", .signature = "\x00\x03\x11\x79\x11\xab\x71\x11\x05\x11\x59" } },
    .{ "SwDeviceInterfacePropertySet", MethodRecord{ .library = "CFGMGR32", .import = "SwDeviceInterfacePropertySet", .signature = "\x00\x04\x11\x79\x11\xab\x71\x11\x05\x09\x0f\x11\xab\x69" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2b65 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Enumeration.Pnp", .name = "SW_DEVICE_CREATE_INFO" },
        0x2b69 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Properties", .name = "DEVPROPERTY" },
        0x2b6d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Enumeration.Pnp", .name = "SW_DEVICE_CREATE_CALLBACK" },
        0x2b71 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Enumeration.Pnp", .name = "HSWDEVICE" },
        0x2b75 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Enumeration.Pnp", .name = "SW_DEVICE_LIFETIME" },
        else => null,
    };
}

pub const UPNP_E_ROOT_ELEMENT_EXPECTED = -2147220992;
pub const UPNP_E_DEVICE_ELEMENT_EXPECTED = -2147220991;
pub const UPNP_E_SERVICE_ELEMENT_EXPECTED = -2147220990;
pub const UPNP_E_SERVICE_NODE_INCOMPLETE = -2147220989;
pub const UPNP_E_DEVICE_NODE_INCOMPLETE = -2147220988;
pub const UPNP_E_ICON_ELEMENT_EXPECTED = -2147220987;
pub const UPNP_E_ICON_NODE_INCOMPLETE = -2147220986;
pub const UPNP_E_INVALID_ACTION = -2147220985;
pub const UPNP_E_INVALID_ARGUMENTS = -2147220984;
pub const UPNP_E_OUT_OF_SYNC = -2147220983;
pub const UPNP_E_ACTION_REQUEST_FAILED = -2147220976;
pub const UPNP_E_TRANSPORT_ERROR = -2147220975;
pub const UPNP_E_VARIABLE_VALUE_UNKNOWN = -2147220974;
pub const UPNP_E_INVALID_VARIABLE = -2147220973;
pub const UPNP_E_DEVICE_ERROR = -2147220972;
pub const UPNP_E_PROTOCOL_ERROR = -2147220971;
pub const UPNP_E_ERROR_PROCESSING_RESPONSE = -2147220970;
pub const UPNP_E_DEVICE_TIMEOUT = -2147220969;
pub const UPNP_E_INVALID_DOCUMENT = -2147220224;
pub const UPNP_E_EVENT_SUBSCRIPTION_FAILED = -2147220223;
pub const FAULT_INVALID_ACTION = 401;
pub const FAULT_INVALID_ARG = 402;
pub const FAULT_INVALID_SEQUENCE_NUMBER = 403;
pub const FAULT_INVALID_VARIABLE = 404;
pub const FAULT_DEVICE_INTERNAL_ERROR = 501;
pub const FAULT_ACTION_SPECIFIC_BASE = 600;
pub const FAULT_ACTION_SPECIFIC_MAX = 899;
pub const UPNP_E_ACTION_SPECIFIC_BASE = -2147220736;
pub const UPNP_ADDRESSFAMILY_IPv4 = 1;
pub const UPNP_ADDRESSFAMILY_IPv6 = 2;
pub const UPNP_ADDRESSFAMILY_BOTH = 3;
pub const UPNP_SERVICE_DELAY_SCPD_AND_SUBSCRIPTION = 1;
pub const UPNP_E_REQUIRED_ELEMENT_ERROR = -2147180512;
pub const UPNP_E_DUPLICATE_NOT_ALLOWED = -2147180511;
pub const UPNP_E_DUPLICATE_SERVICE_ID = -2147180510;
pub const UPNP_E_INVALID_DESCRIPTION = -2147180509;
pub const UPNP_E_INVALID_SERVICE = -2147180508;
pub const UPNP_E_INVALID_ICON = -2147180507;
pub const UPNP_E_INVALID_XML = -2147180506;
pub const UPNP_E_INVALID_ROOT_NAMESPACE = -2147180505;
pub const UPNP_E_SUFFIX_TOO_LONG = -2147180504;
pub const UPNP_E_URLBASE_PRESENT = -2147180503;
pub const UPNP_E_VALUE_TOO_LONG = -2147180496;
pub const UPNP_E_DEVICE_RUNNING = -2147180495;
pub const UPNP_E_DEVICE_NOTREGISTERED = -2147180494;
pub const SWDeviceCapabilitiesNone = 0;
pub const SWDeviceCapabilitiesRemovable = 1;
pub const SWDeviceCapabilitiesSilentInstall = 2;
pub const SWDeviceCapabilitiesNoDisplayInUI = 4;
pub const SWDeviceCapabilitiesDriverRequired = 8;
pub const SWDeviceLifetimeHandle = 0;
pub const SWDeviceLifetimeParentPresent = 1;
pub const SWDeviceLifetimeMax = 2;

pub const aliases = struct {
    pub const SW_DEVICE_CAPABILITIES = i32;
    pub const SW_DEVICE_LIFETIME = i32;
    pub const HSWDEVICE = ?*anyopaque;
    pub const SW_DEVICE_CREATE_CALLBACK = ?*const anyopaque;
};
