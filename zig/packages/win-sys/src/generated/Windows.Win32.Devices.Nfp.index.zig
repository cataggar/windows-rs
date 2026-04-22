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

pub const IOCTL_NFP_GET_NEXT_SUBSCRIBED_MESSAGE = 5308480;
pub const IOCTL_NFP_SET_PAYLOAD = 5308484;
pub const IOCTL_NFP_GET_NEXT_TRANSMITTED_MESSAGE = 5308488;
pub const IOCTL_NFP_DISABLE = 5308492;
pub const IOCTL_NFP_ENABLE = 5308496;
pub const IOCTL_NFP_GET_MAX_MESSAGE_BYTES = 5308544;
pub const IOCTL_NFP_GET_KILO_BYTES_PER_SECOND = 5308548;
