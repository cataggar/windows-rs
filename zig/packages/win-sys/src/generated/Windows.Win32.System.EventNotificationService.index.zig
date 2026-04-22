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
    .{ "IsDestinationReachableA", MethodRecord{ .library = "SensApi", .import = "IsDestinationReachableA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x11\xc0\x00\x41\xbd" } },
    .{ "IsDestinationReachableW", MethodRecord{ .library = "SensApi", .import = "IsDestinationReachableW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x11\xc0\x00\x41\xbd" } },
    .{ "IsNetworkAlive", MethodRecord{ .library = "SensApi", .import = "IsNetworkAlive", .signature = "\x00\x01\x11\x59\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x41bd => TypeRefEntry{ .namespace = "Windows.Win32.System.EventNotificationService", .name = "QOCINFO" },
        else => null,
    };
}

pub const CONNECTION_LAN = 0;
pub const CONNECTION_WAN = 1;
pub const NETWORK_ALIVE_LAN = 1;
pub const NETWORK_ALIVE_WAN = 2;
pub const NETWORK_ALIVE_AOL = 4;
pub const NETWORK_ALIVE_INTERNET = 8;
pub const CONNECTION_AOL = 4;

pub const aliases = struct {
    pub const SENS_CONNECTION_TYPE = u32;
};
