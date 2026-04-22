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
    .{ "McastApiStartup", MethodRecord{ .library = "dhcpcsvc", .import = "McastApiStartup", .signature = "\x00\x01\x09\x0f\x09" } },
    .{ "McastApiCleanup", MethodRecord{ .library = "dhcpcsvc", .import = "McastApiCleanup", .signature = "\x00\x00\x01" } },
    .{ "McastGenUID", MethodRecord{ .library = "dhcpcsvc", .import = "McastGenUID", .signature = "\x00\x01\x09\x0f\x11\xb7\x75" } },
    .{ "McastEnumerateScopes", MethodRecord{ .library = "dhcpcsvc", .import = "McastEnumerateScopes", .signature = "\x00\x05\x09\x07\x11\x59\x0f\x11\xb7\x79\x0f\x09\x0f\x09" } },
    .{ "McastRequestAddress", MethodRecord{ .library = "dhcpcsvc", .import = "McastRequestAddress", .signature = "\x00\x05\x09\x07\x0f\x11\xb7\x75\x0f\x11\xb7\x7d\x0f\x11\xb7\x81\x0f\x11\xb7\x85" } },
    .{ "McastRenewAddress", MethodRecord{ .library = "dhcpcsvc", .import = "McastRenewAddress", .signature = "\x00\x04\x09\x07\x0f\x11\xb7\x75\x0f\x11\xb7\x81\x0f\x11\xb7\x85" } },
    .{ "McastReleaseAddress", MethodRecord{ .library = "dhcpcsvc", .import = "McastReleaseAddress", .signature = "\x00\x03\x09\x07\x0f\x11\xb7\x75\x0f\x11\xb7\x81" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x3775 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Multicast", .name = "MCAST_CLIENT_UID" },
        0x3779 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Multicast", .name = "MCAST_SCOPE_ENTRY" },
        0x377d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Multicast", .name = "MCAST_SCOPE_CTX" },
        0x3781 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Multicast", .name = "MCAST_LEASE_REQUEST" },
        0x3785 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Multicast", .name = "MCAST_LEASE_RESPONSE" },
        else => null,
    };
}

pub const MCAST_CLIENT_ID_LEN = 17;
pub const MCAST_API_CURRENT_VERSION = 1;
pub const MCAST_API_VERSION_0 = 0;
pub const MCAST_API_VERSION_1 = 1;
