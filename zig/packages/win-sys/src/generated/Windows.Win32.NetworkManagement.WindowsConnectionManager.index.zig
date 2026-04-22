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
    .{ "WcmQueryProperty", MethodRecord{ .library = "wcmapi", .import = "WcmQueryProperty", .signature = "\x00\x06\x09\x0f\x11\x0d\x11\x05\x11\xb9\x9d\x0f\x01\x0f\x09\x0f\x0f\x05" } },
    .{ "WcmSetProperty", MethodRecord{ .library = "wcmapi", .import = "WcmSetProperty", .signature = "\x00\x06\x09\x0f\x11\x0d\x11\x05\x11\xb9\x9d\x0f\x01\x09\x0f\x05" } },
    .{ "WcmGetProfileList", MethodRecord{ .library = "wcmapi", .import = "WcmGetProfileList", .signature = "\x00\x02\x09\x0f\x01\x0f\x0f\x11\xb9\xa1" } },
    .{ "WcmSetProfileList", MethodRecord{ .library = "wcmapi", .import = "WcmSetProfileList", .signature = "\x00\x04\x09\x0f\x11\xb9\xa1\x09\x11\x59\x0f\x01" } },
    .{ "WcmFreeMemory", MethodRecord{ .library = "wcmapi", .import = "WcmFreeMemory", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "OnDemandGetRoutingHint", MethodRecord{ .library = "OnDemandConnRouteHelper", .import = "OnDemandGetRoutingHint", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x09" } },
    .{ "OnDemandRegisterNotification", MethodRecord{ .library = "OnDemandConnRouteHelper", .import = "OnDemandRegisterNotification", .signature = "\x00\x03\x11\x79\x12\xb9\xa5\x0f\x01\x0f\x11\x80\x85" } },
    .{ "OnDemandUnRegisterNotification", MethodRecord{ .library = "OnDemandConnRouteHelper", .import = "OnDemandUnRegisterNotification", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "GetInterfaceContextTableForHostName", MethodRecord{ .library = "OnDemandConnRouteHelper", .import = "GetInterfaceContextTableForHostName", .signature = "\x00\x06\x11\x79\x11\x05\x11\x05\x09\x0f\x05\x09\x0f\x0f\x11\xb9\xa9" } },
    .{ "FreeInterfaceContextTable", MethodRecord{ .library = "OnDemandConnRouteHelper", .import = "FreeInterfaceContextTable", .signature = "\x00\x01\x01\x0f\x11\xb9\xa9" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x399d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsConnectionManager", .name = "WCM_PROPERTY" },
        0x39a1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsConnectionManager", .name = "WCM_PROFILE_INFO_LIST" },
        0x39a5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsConnectionManager", .name = "ONDEMAND_NOTIFICATION_CALLBACK" },
        0x39a9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsConnectionManager", .name = "NET_INTERFACE_CONTEXT_TABLE" },
        else => null,
    };
}

pub const WCM_API_VERSION_1_0 = 1;
pub const WCM_API_VERSION = 1;
pub const WCM_UNKNOWN_DATAPLAN_STATUS = 4294967295;
pub const WCM_MAX_PROFILE_NAME = 256;
pub const NET_INTERFACE_FLAG_NONE = 0;
pub const NET_INTERFACE_FLAG_CONNECT_IF_NEEDED = 1;
pub const wcm_global_property_domain_policy = 0;
pub const wcm_global_property_minimize_policy = 1;
pub const wcm_global_property_roaming_policy = 2;
pub const wcm_global_property_powermanagement_policy = 3;
pub const wcm_intf_property_connection_cost = 4;
pub const wcm_intf_property_dataplan_status = 5;
pub const wcm_intf_property_hotspot_profile = 6;
pub const wcm_media_unknown = 0;
pub const wcm_media_ethernet = 1;
pub const wcm_media_wlan = 2;
pub const wcm_media_mbn = 3;
pub const wcm_media_invalid = 4;
pub const wcm_media_max = 5;
pub const WCM_CONNECTION_COST_UNKNOWN = 0;
pub const WCM_CONNECTION_COST_UNRESTRICTED = 1;
pub const WCM_CONNECTION_COST_FIXED = 2;
pub const WCM_CONNECTION_COST_VARIABLE = 4;
pub const WCM_CONNECTION_COST_OVERDATALIMIT = 65536;
pub const WCM_CONNECTION_COST_CONGESTED = 131072;
pub const WCM_CONNECTION_COST_ROAMING = 262144;
pub const WCM_CONNECTION_COST_APPROACHINGDATALIMIT = 524288;
pub const WCM_CONNECTION_COST_SOURCE_DEFAULT = 0;
pub const WCM_CONNECTION_COST_SOURCE_GP = 1;
pub const WCM_CONNECTION_COST_SOURCE_USER = 2;
pub const WCM_CONNECTION_COST_SOURCE_OPERATOR = 3;

pub const aliases = struct {
    pub const WCM_PROPERTY = i32;
    pub const WCM_MEDIA_TYPE = i32;
    pub const WCM_CONNECTION_COST = i32;
    pub const WCM_CONNECTION_COST_SOURCE = i32;
    pub const ONDEMAND_NOTIFICATION_CALLBACK = ?*const anyopaque;
};
