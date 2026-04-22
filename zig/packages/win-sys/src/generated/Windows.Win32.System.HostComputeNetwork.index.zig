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
    .{ "HcnEnumerateNetworks", MethodRecord{ .library = "computenetwork", .import = "HcnEnumerateNetworks", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "HcnCreateNetwork", MethodRecord{ .library = "computenetwork", .import = "HcnCreateNetwork", .signature = "\x00\x04\x11\x79\x0f\x11\x0d\x11\x05\x0f\x0f\x01\x0f\x11\x05" } },
    .{ "HcnOpenNetwork", MethodRecord{ .library = "computenetwork", .import = "HcnOpenNetwork", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x0f\x01\x0f\x11\x05" } },
    .{ "HcnModifyNetwork", MethodRecord{ .library = "computenetwork", .import = "HcnModifyNetwork", .signature = "\x00\x03\x11\x79\x0f\x01\x11\x05\x0f\x11\x05" } },
    .{ "HcnQueryNetworkProperties", MethodRecord{ .library = "computenetwork", .import = "HcnQueryNetworkProperties", .signature = "\x00\x04\x11\x79\x0f\x01\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "HcnDeleteNetwork", MethodRecord{ .library = "computenetwork", .import = "HcnDeleteNetwork", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "HcnCloseNetwork", MethodRecord{ .library = "computenetwork", .import = "HcnCloseNetwork", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "HcnEnumerateNamespaces", MethodRecord{ .library = "computenetwork", .import = "HcnEnumerateNamespaces", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "HcnCreateNamespace", MethodRecord{ .library = "computenetwork", .import = "HcnCreateNamespace", .signature = "\x00\x04\x11\x79\x0f\x11\x0d\x11\x05\x0f\x0f\x01\x0f\x11\x05" } },
    .{ "HcnOpenNamespace", MethodRecord{ .library = "computenetwork", .import = "HcnOpenNamespace", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x0f\x01\x0f\x11\x05" } },
    .{ "HcnModifyNamespace", MethodRecord{ .library = "computenetwork", .import = "HcnModifyNamespace", .signature = "\x00\x03\x11\x79\x0f\x01\x11\x05\x0f\x11\x05" } },
    .{ "HcnQueryNamespaceProperties", MethodRecord{ .library = "computenetwork", .import = "HcnQueryNamespaceProperties", .signature = "\x00\x04\x11\x79\x0f\x01\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "HcnDeleteNamespace", MethodRecord{ .library = "computenetwork", .import = "HcnDeleteNamespace", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "HcnCloseNamespace", MethodRecord{ .library = "computenetwork", .import = "HcnCloseNamespace", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "HcnEnumerateEndpoints", MethodRecord{ .library = "computenetwork", .import = "HcnEnumerateEndpoints", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "HcnCreateEndpoint", MethodRecord{ .library = "computenetwork", .import = "HcnCreateEndpoint", .signature = "\x00\x05\x11\x79\x0f\x01\x0f\x11\x0d\x11\x05\x0f\x0f\x01\x0f\x11\x05" } },
    .{ "HcnOpenEndpoint", MethodRecord{ .library = "computenetwork", .import = "HcnOpenEndpoint", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x0f\x01\x0f\x11\x05" } },
    .{ "HcnModifyEndpoint", MethodRecord{ .library = "computenetwork", .import = "HcnModifyEndpoint", .signature = "\x00\x03\x11\x79\x0f\x01\x11\x05\x0f\x11\x05" } },
    .{ "HcnQueryEndpointProperties", MethodRecord{ .library = "computenetwork", .import = "HcnQueryEndpointProperties", .signature = "\x00\x04\x11\x79\x0f\x01\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "HcnDeleteEndpoint", MethodRecord{ .library = "computenetwork", .import = "HcnDeleteEndpoint", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "HcnCloseEndpoint", MethodRecord{ .library = "computenetwork", .import = "HcnCloseEndpoint", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "HcnEnumerateLoadBalancers", MethodRecord{ .library = "computenetwork", .import = "HcnEnumerateLoadBalancers", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "HcnCreateLoadBalancer", MethodRecord{ .library = "computenetwork", .import = "HcnCreateLoadBalancer", .signature = "\x00\x04\x11\x79\x0f\x11\x0d\x11\x05\x0f\x0f\x01\x0f\x11\x05" } },
    .{ "HcnOpenLoadBalancer", MethodRecord{ .library = "computenetwork", .import = "HcnOpenLoadBalancer", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x0f\x01\x0f\x11\x05" } },
    .{ "HcnModifyLoadBalancer", MethodRecord{ .library = "computenetwork", .import = "HcnModifyLoadBalancer", .signature = "\x00\x03\x11\x79\x0f\x01\x11\x05\x0f\x11\x05" } },
    .{ "HcnQueryLoadBalancerProperties", MethodRecord{ .library = "computenetwork", .import = "HcnQueryLoadBalancerProperties", .signature = "\x00\x04\x11\x79\x0f\x01\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "HcnDeleteLoadBalancer", MethodRecord{ .library = "computenetwork", .import = "HcnDeleteLoadBalancer", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "HcnCloseLoadBalancer", MethodRecord{ .library = "computenetwork", .import = "HcnCloseLoadBalancer", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "HcnRegisterServiceCallback", MethodRecord{ .library = "computenetwork", .import = "HcnRegisterServiceCallback", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x9f\x90\x0f\x01\x0f\x0f\x01" } },
    .{ "HcnUnregisterServiceCallback", MethodRecord{ .library = "computenetwork", .import = "HcnUnregisterServiceCallback", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "HcnRegisterGuestNetworkServiceCallback", MethodRecord{ .library = "computenetwork", .import = "HcnRegisterGuestNetworkServiceCallback", .signature = "\x00\x04\x11\x79\x0f\x01\x12\xc0\x00\x9f\x90\x0f\x01\x0f\x0f\x01" } },
    .{ "HcnUnregisterGuestNetworkServiceCallback", MethodRecord{ .library = "computenetwork", .import = "HcnUnregisterGuestNetworkServiceCallback", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "HcnCreateGuestNetworkService", MethodRecord{ .library = "computenetwork", .import = "HcnCreateGuestNetworkService", .signature = "\x00\x04\x11\x79\x0f\x11\x0d\x11\x05\x0f\x0f\x01\x0f\x11\x05" } },
    .{ "HcnCloseGuestNetworkService", MethodRecord{ .library = "computenetwork", .import = "HcnCloseGuestNetworkService", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "HcnModifyGuestNetworkService", MethodRecord{ .library = "computenetwork", .import = "HcnModifyGuestNetworkService", .signature = "\x00\x03\x11\x79\x0f\x01\x11\x05\x0f\x11\x05" } },
    .{ "HcnDeleteGuestNetworkService", MethodRecord{ .library = "computenetwork", .import = "HcnDeleteGuestNetworkService", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "HcnReserveGuestNetworkServicePort", MethodRecord{ .library = "computenetwork", .import = "HcnReserveGuestNetworkServicePort", .signature = "\x00\x05\x11\x79\x0f\x01\x11\xc0\x00\x79\xb5\x11\xc0\x00\x79\xb9\x07\x0f\x11\x80\x85" } },
    .{ "HcnReserveGuestNetworkServicePortRange", MethodRecord{ .library = "computenetwork", .import = "HcnReserveGuestNetworkServicePortRange", .signature = "\x00\x04\x11\x79\x0f\x01\x07\x0f\x11\xc0\x00\x9f\x9c\x0f\x11\x80\x85" } },
    .{ "HcnReleaseGuestNetworkServicePortReservationHandle", MethodRecord{ .library = "computenetwork", .import = "HcnReleaseGuestNetworkServicePortReservationHandle", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "HcnEnumerateGuestNetworkPortReservations", MethodRecord{ .library = "computenetwork", .import = "HcnEnumerateGuestNetworkPortReservations", .signature = "\x00\x02\x11\x79\x0f\x09\x0f\x0f\x11\xc0\x00\x9f\xa0" } },
    .{ "HcnFreeGuestNetworkPortReservations", MethodRecord{ .library = "computenetwork", .import = "HcnFreeGuestNetworkPortReservations", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x9f\xa0" } },
    .{ "HcnQueryEndpointStats", MethodRecord{ .library = "computenetwork", .import = "HcnQueryEndpointStats", .signature = "\x00\x04\x11\x79\x0f\x01\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "HcnQueryEndpointAddresses", MethodRecord{ .library = "computenetwork", .import = "HcnQueryEndpointAddresses", .signature = "\x00\x04\x11\x79\x0f\x01\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x79b5 => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeNetwork", .name = "HCN_PORT_PROTOCOL" },
        0x79b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeNetwork", .name = "HCN_PORT_ACCESS" },
        0x9f90 => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeNetwork", .name = "HCN_NOTIFICATION_CALLBACK" },
        0x9f9c => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeNetwork", .name = "HCN_PORT_RANGE_RESERVATION" },
        0x9fa0 => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeNetwork", .name = "HCN_PORT_RANGE_ENTRY" },
        else => null,
    };
}

pub const HcnNotificationInvalid = 0;
pub const HcnNotificationNetworkPreCreate = 1;
pub const HcnNotificationNetworkCreate = 2;
pub const HcnNotificationNetworkPreDelete = 3;
pub const HcnNotificationNetworkDelete = 4;
pub const HcnNotificationNamespaceCreate = 5;
pub const HcnNotificationNamespaceDelete = 6;
pub const HcnNotificationGuestNetworkServiceCreate = 7;
pub const HcnNotificationGuestNetworkServiceDelete = 8;
pub const HcnNotificationNetworkEndpointAttached = 9;
pub const HcnNotificationNetworkEndpointDetached = 16;
pub const HcnNotificationGuestNetworkServiceStateChanged = 17;
pub const HcnNotificationGuestNetworkServiceInterfaceStateChanged = 18;
pub const HcnNotificationServiceDisconnect = 16777216;
pub const HcnNotificationFlagsReserved = -268435456;
pub const HCN_PORT_PROTOCOL_TCP = 1;
pub const HCN_PORT_PROTOCOL_UDP = 2;
pub const HCN_PORT_PROTOCOL_BOTH = 3;
pub const HCN_PORT_ACCESS_EXCLUSIVE = 1;
pub const HCN_PORT_ACCESS_SHARED = 2;

pub const aliases = struct {
    pub const HCN_NOTIFICATIONS = i32;
    pub const HCN_PORT_PROTOCOL = i32;
    pub const HCN_PORT_ACCESS = i32;
    pub const HCN_NOTIFICATION_CALLBACK = ?*const anyopaque;
};
