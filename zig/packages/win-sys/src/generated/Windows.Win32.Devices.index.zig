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

pub const method_def_by_name = std.static_string_map.StaticStringMap(MethodRecord).initComptime(.{});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const IOCTL_IEEE1394_API_REQUEST = 2229248;
pub const IEEE1394_API_ADD_VIRTUAL_DEVICE = 1;
pub const IEEE1394_API_REMOVE_VIRTUAL_DEVICE = 2;
pub const IEEE1394_API_DEVICE_ACCESS_TRANSFER = 3;
pub const IEEE1394_API_SET_LOCAL_NODE_PROPERTIES = 4;
pub const IEEE1394_REQUEST_FLAG_UNICODE = 1;
pub const IEEE1394_REQUEST_FLAG_PERSISTENT = 2;
pub const IEEE1394_REQUEST_FLAG_USE_LOCAL_HOST_EUI = 4;
pub const IEEE1394API_NOTIFICATION_DEVICE_ACCESS = 1;
pub const IEEE1394API_NOTIFICATION_BUS_RESET = 2;
pub const IEEE1394API_DEVICE_OWNERSHIP_LOCAL_NODE = 1;
pub const IEEE1394API_RESOURCE_OWNERSHIP_LOCAL_NODE = 2;
pub const IEEE1394API_DEVICE_OWNERSHIP_REMOTE_NODE = 4;
pub const IEEE1394API_RESOURCE_OWNERSHIP_REMOTE_NODE = 8;
pub const IEEE1394API_ACCESS_SHARED_READ = 16;
pub const IEEE1394API_ACCESS_SHARED_WRITE = 32;
pub const IEEE1394API_ACCESS_EXCLUSIVE = 64;
pub const IEEE1394API_REMOTE_ACCESS_TRANSFER_REQUEST = 1;
pub const IEEE1394API_BUS_RESET_LOCAL_NODE_IS_ROOT = 1;
pub const IEEE1394API_BUS_RESET_LOCAL_NODE_IS_IRM = 2;
pub const IEEE1394API_BUS_RESET_LOCAL_NODE_INITIATED = 4;
