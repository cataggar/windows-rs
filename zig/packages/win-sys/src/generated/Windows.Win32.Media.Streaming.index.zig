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

pub const MF_TRANSFER_VIDEO_FRAME_DEFAULT = 0;
pub const MF_TRANSFER_VIDEO_FRAME_STRETCH = 1;
pub const MF_TRANSFER_VIDEO_FRAME_IGNORE_PAR = 2;
pub const MF_MEDIASOURCE_STATUS_INFO_FULLYSUPPORTED = 0;
pub const MF_MEDIASOURCE_STATUS_INFO_UNKNOWN = 1;

pub const aliases = struct {
    pub const MF_TRANSFER_VIDEO_FRAME_FLAGS = i32;
    pub const MF_MEDIASOURCE_STATUS_INFO = i32;
};
