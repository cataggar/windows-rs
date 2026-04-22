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
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const DEVICE_AUTHORIZATION_UNKNOWN = 0;
pub const DEVICE_AUTHORIZATION_ALLOWED = 1;
pub const DEVICE_AUTHORIZATION_DENIED = 2;

pub const aliases = struct {
    pub const WindowsMediaLibrarySharingDeviceAuthorizationStatus = i32;
};
