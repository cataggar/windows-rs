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
    .{ "NcFreeNetconProperties", MethodRecord{ .library = "Netshell", .import = "NcFreeNetconProperties", .signature = "\x00\x01\x01\x0f\x11\xbb\x31" } },
    .{ "NcIsValidConnectionName", MethodRecord{ .library = "Netshell", .import = "NcIsValidConnectionName", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "NetworkIsolationSetupAppContainerBinaries", MethodRecord{ .library = "api-ms-win-net-isolation-l1-1-0", .import = "NetworkIsolationSetupAppContainerBinaries", .signature = "\x00\x07\x11\x79\x11\x81\x15\x11\x05\x11\x05\x11\x05\x11\x59\x0f\x11\x05\x09" } },
    .{ "NetworkIsolationRegisterForAppContainerChanges", MethodRecord{ .library = "api-ms-win-net-isolation-l1-1-0", .import = "NetworkIsolationRegisterForAppContainerChanges", .signature = "\x00\x04\x09\x09\x12\xbb\x35\x0f\x01\x0f\x11\x80\x85" } },
    .{ "NetworkIsolationUnregisterForAppContainerChanges", MethodRecord{ .library = "api-ms-win-net-isolation-l1-1-0", .import = "NetworkIsolationUnregisterForAppContainerChanges", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "NetworkIsolationEnumerateAppContainerRules", MethodRecord{ .library = "Firewallapi", .import = "NetworkIsolationEnumerateAppContainerRules", .signature = "\x00\x01\x11\x79\x0f\x12\xb0\x5d" } },
    .{ "NetworkIsolationFreeAppContainers", MethodRecord{ .library = "api-ms-win-net-isolation-l1-1-0", .import = "NetworkIsolationFreeAppContainers", .signature = "\x00\x01\x09\x0f\x11\xbb\x39" } },
    .{ "NetworkIsolationEnumAppContainers", MethodRecord{ .library = "api-ms-win-net-isolation-l1-1-0", .import = "NetworkIsolationEnumAppContainers", .signature = "\x00\x03\x09\x09\x0f\x09\x0f\x0f\x11\xbb\x39" } },
    .{ "NetworkIsolationGetAppContainerConfig", MethodRecord{ .library = "api-ms-win-net-isolation-l1-1-0", .import = "NetworkIsolationGetAppContainerConfig", .signature = "\x00\x02\x09\x0f\x09\x0f\x0f\x11\x9d\x1d" } },
    .{ "NetworkIsolationSetAppContainerConfig", MethodRecord{ .library = "api-ms-win-net-isolation-l1-1-0", .import = "NetworkIsolationSetAppContainerConfig", .signature = "\x00\x02\x09\x09\x0f\x11\x9d\x1d" } },
    .{ "NetworkIsolationDiagnoseConnectFailureAndGetInfo", MethodRecord{ .library = "api-ms-win-net-isolation-l1-1-0", .import = "NetworkIsolationDiagnoseConnectFailureAndGetInfo", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xbb\x3d" } },
    .{ "NetworkIsolationGetEnterpriseIdAsync", MethodRecord{ .library = "Firewallapi", .import = "NetworkIsolationGetEnterpriseIdAsync", .signature = "\x00\x05\x09\x11\x05\x09\x0f\x01\x12\xbb\x41\x0f\x11\x80\x85" } },
    .{ "NetworkIsolationGetEnterpriseIdClose", MethodRecord{ .library = "Firewallapi", .import = "NetworkIsolationGetEnterpriseIdClose", .signature = "\x00\x02\x09\x11\x80\x85\x11\x59" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x115 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSID" },
        0x1d1d => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SID_AND_ATTRIBUTES" },
        0x305d => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "IEnumVARIANT" },
        0x3b31 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFirewall", .name = "NETCON_PROPERTIES" },
        0x3b35 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFirewall", .name = "PAC_CHANGES_CALLBACK_FN" },
        0x3b39 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFirewall", .name = "INET_FIREWALL_APP_CONTAINER" },
        0x3b3d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFirewall", .name = "NETISO_ERROR_TYPE" },
        0x3b41 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFirewall", .name = "PNETISO_EDP_ID_CALLBACK_FN" },
        else => null,
    };
}

pub const NETCON_MAX_NAME_LEN = 256;
pub const S_OBJECT_NO_LONGER_VALID = 2;
pub const NETISO_GEID_FOR_WDAG = 1;
pub const NETISO_GEID_FOR_NEUTRAL_AWARE = 2;
pub const NCCF_NONE = 0;
pub const NCCF_ALL_USERS = 1;
pub const NCCF_ALLOW_DUPLICATION = 2;
pub const NCCF_ALLOW_REMOVAL = 4;
pub const NCCF_ALLOW_RENAME = 8;
pub const NCCF_INCOMING_ONLY = 32;
pub const NCCF_OUTGOING_ONLY = 64;
pub const NCCF_BRANDED = 128;
pub const NCCF_SHARED = 256;
pub const NCCF_BRIDGED = 512;
pub const NCCF_FIREWALLED = 1024;
pub const NCCF_DEFAULT = 2048;
pub const NCCF_HOMENET_CAPABLE = 4096;
pub const NCCF_SHARED_PRIVATE = 8192;
pub const NCCF_QUARANTINED = 16384;
pub const NCCF_RESERVED = 32768;
pub const NCCF_HOSTED_NETWORK = 65536;
pub const NCCF_VIRTUAL_STATION = 131072;
pub const NCCF_WIFI_DIRECT = 262144;
pub const NCCF_BLUETOOTH_MASK = 983040;
pub const NCCF_LAN_MASK = 15728640;
pub const NCS_DISCONNECTED = 0;
pub const NCS_CONNECTING = 1;
pub const NCS_CONNECTED = 2;
pub const NCS_DISCONNECTING = 3;
pub const NCS_HARDWARE_NOT_PRESENT = 4;
pub const NCS_HARDWARE_DISABLED = 5;
pub const NCS_HARDWARE_MALFUNCTION = 6;
pub const NCS_MEDIA_DISCONNECTED = 7;
pub const NCS_AUTHENTICATING = 8;
pub const NCS_AUTHENTICATION_SUCCEEDED = 9;
pub const NCS_AUTHENTICATION_FAILED = 10;
pub const NCS_INVALID_ADDRESS = 11;
pub const NCS_CREDENTIALS_REQUIRED = 12;
pub const NCS_ACTION_REQUIRED = 13;
pub const NCS_ACTION_REQUIRED_RETRY = 14;
pub const NCS_CONNECT_FAILED = 15;
pub const NCT_DIRECT_CONNECT = 0;
pub const NCT_INBOUND = 1;
pub const NCT_INTERNET = 2;
pub const NCT_LAN = 3;
pub const NCT_PHONE = 4;
pub const NCT_TUNNEL = 5;
pub const NCT_BRIDGE = 6;
pub const NCM_NONE = 0;
pub const NCM_DIRECT = 1;
pub const NCM_ISDN = 2;
pub const NCM_LAN = 3;
pub const NCM_PHONE = 4;
pub const NCM_TUNNEL = 5;
pub const NCM_PPPOE = 6;
pub const NCM_BRIDGE = 7;
pub const NCM_SHAREDACCESSHOST_LAN = 8;
pub const NCM_SHAREDACCESSHOST_RAS = 9;
pub const NCME_DEFAULT = 0;
pub const NCME_HIDDEN = 1;
pub const NCUC_DEFAULT = 0;
pub const NCUC_NO_UI = 1;
pub const NCUC_ENABLE_DISABLE = 2;
pub const ICSSHARINGTYPE_PUBLIC = 0;
pub const ICSSHARINGTYPE_PRIVATE = 1;
pub const ICSSC_DEFAULT = 0;
pub const ICSSC_ENABLED = 1;
pub const ICSTT_NAME = 0;
pub const ICSTT_IPADDRESS = 1;
pub const NET_FW_POLICY_GROUP = 0;
pub const NET_FW_POLICY_LOCAL = 1;
pub const NET_FW_POLICY_EFFECTIVE = 2;
pub const NET_FW_POLICY_TYPE_MAX = 3;
pub const NET_FW_PROFILE_DOMAIN = 0;
pub const NET_FW_PROFILE_STANDARD = 1;
pub const NET_FW_PROFILE_CURRENT = 2;
pub const NET_FW_PROFILE_TYPE_MAX = 3;
pub const NET_FW_PROFILE2_DOMAIN = 1;
pub const NET_FW_PROFILE2_PRIVATE = 2;
pub const NET_FW_PROFILE2_PUBLIC = 4;
pub const NET_FW_PROFILE2_ALL = 2147483647;
pub const NET_FW_IP_VERSION_V4 = 0;
pub const NET_FW_IP_VERSION_V6 = 1;
pub const NET_FW_IP_VERSION_ANY = 2;
pub const NET_FW_IP_VERSION_MAX = 3;
pub const NET_FW_SCOPE_ALL = 0;
pub const NET_FW_SCOPE_LOCAL_SUBNET = 1;
pub const NET_FW_SCOPE_CUSTOM = 2;
pub const NET_FW_SCOPE_MAX = 3;
pub const NET_FW_IP_PROTOCOL_TCP = 6;
pub const NET_FW_IP_PROTOCOL_UDP = 17;
pub const NET_FW_IP_PROTOCOL_ANY = 256;
pub const NET_FW_SERVICE_FILE_AND_PRINT = 0;
pub const NET_FW_SERVICE_UPNP = 1;
pub const NET_FW_SERVICE_REMOTE_DESKTOP = 2;
pub const NET_FW_SERVICE_NONE = 3;
pub const NET_FW_SERVICE_TYPE_MAX = 4;
pub const NET_FW_RULE_DIR_IN = 1;
pub const NET_FW_RULE_DIR_OUT = 2;
pub const NET_FW_RULE_DIR_MAX = 3;
pub const NET_FW_ACTION_BLOCK = 0;
pub const NET_FW_ACTION_ALLOW = 1;
pub const NET_FW_ACTION_MAX = 2;
pub const NET_FW_MODIFY_STATE_OK = 0;
pub const NET_FW_MODIFY_STATE_GP_OVERRIDE = 1;
pub const NET_FW_MODIFY_STATE_INBOUND_BLOCKED = 2;
pub const NET_FW_RULE_CATEGORY_BOOT = 0;
pub const NET_FW_RULE_CATEGORY_STEALTH = 1;
pub const NET_FW_RULE_CATEGORY_FIREWALL = 2;
pub const NET_FW_RULE_CATEGORY_CONSEC = 3;
pub const NET_FW_RULE_CATEGORY_MAX = 4;
pub const NET_FW_EDGE_TRAVERSAL_TYPE_DENY = 0;
pub const NET_FW_EDGE_TRAVERSAL_TYPE_ALLOW = 1;
pub const NET_FW_EDGE_TRAVERSAL_TYPE_DEFER_TO_APP = 2;
pub const NET_FW_EDGE_TRAVERSAL_TYPE_DEFER_TO_USER = 3;
pub const NET_FW_AUTHENTICATE_NONE = 0;
pub const NET_FW_AUTHENTICATE_NO_ENCAPSULATION = 1;
pub const NET_FW_AUTHENTICATE_WITH_INTEGRITY = 2;
pub const NET_FW_AUTHENTICATE_AND_NEGOTIATE_ENCRYPTION = 3;
pub const NET_FW_AUTHENTICATE_AND_ENCRYPT = 4;
pub const NETISO_FLAG_FORCE_COMPUTE_BINARIES = 1;
pub const NETISO_FLAG_MAX = 2;
pub const INET_FIREWALL_AC_NONE = 0;
pub const INET_FIREWALL_AC_PACKAGE_ID_ONLY = 1;
pub const INET_FIREWALL_AC_BINARY = 2;
pub const INET_FIREWALL_AC_MAX = 4;
pub const INET_FIREWALL_AC_CHANGE_INVALID = 0;
pub const INET_FIREWALL_AC_CHANGE_CREATE = 1;
pub const INET_FIREWALL_AC_CHANGE_DELETE = 2;
pub const INET_FIREWALL_AC_CHANGE_MAX = 3;
pub const NETISO_ERROR_TYPE_NONE = 0;
pub const NETISO_ERROR_TYPE_PRIVATE_NETWORK = 1;
pub const NETISO_ERROR_TYPE_INTERNET_CLIENT = 2;
pub const NETISO_ERROR_TYPE_INTERNET_CLIENT_SERVER = 3;
pub const NETISO_ERROR_TYPE_MAX = 4;
pub const FW_DYNAMIC_KEYWORD_ORIGIN_INVALID = 0;
pub const FW_DYNAMIC_KEYWORD_ORIGIN_LOCAL = 1;
pub const FW_DYNAMIC_KEYWORD_ORIGIN_MDM = 2;
pub const FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE = 1;
pub const FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_AUTO_RESOLVE = 1;
pub const FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_NON_AUTO_RESOLVE = 2;
pub const FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_ALL = 3;

pub const aliases = struct {
    pub const NETCON_CHARACTERISTIC_FLAGS = i32;
    pub const NETCON_STATUS = i32;
    pub const NETCON_TYPE = i32;
    pub const NETCON_MEDIATYPE = i32;
    pub const NETCONMGR_ENUM_FLAGS = i32;
    pub const NETCONUI_CONNECT_FLAGS = i32;
    pub const SHARINGCONNECTIONTYPE = i32;
    pub const SHARINGCONNECTION_ENUM_FLAGS = i32;
    pub const ICS_TARGETTYPE = i32;
    pub const NET_FW_POLICY_TYPE = i32;
    pub const NET_FW_PROFILE_TYPE = i32;
    pub const NET_FW_PROFILE_TYPE2 = i32;
    pub const NET_FW_IP_VERSION = i32;
    pub const NET_FW_SCOPE = i32;
    pub const NET_FW_IP_PROTOCOL = i32;
    pub const NET_FW_SERVICE_TYPE = i32;
    pub const NET_FW_RULE_DIRECTION = i32;
    pub const NET_FW_ACTION = i32;
    pub const NET_FW_MODIFY_STATE = i32;
    pub const NET_FW_RULE_CATEGORY = i32;
    pub const NET_FW_EDGE_TRAVERSAL_TYPE = i32;
    pub const NET_FW_AUTHENTICATE_TYPE = i32;
    pub const NETISO_FLAG = i32;
    pub const INET_FIREWALL_AC_CREATION_TYPE = i32;
    pub const INET_FIREWALL_AC_CHANGE_TYPE = i32;
    pub const NETISO_ERROR_TYPE = i32;
    pub const FW_DYNAMIC_KEYWORD_ORIGIN_TYPE = i32;
    pub const FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS = i32;
    pub const FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS = i32;
};
