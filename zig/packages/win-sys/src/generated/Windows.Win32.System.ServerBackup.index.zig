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

pub const WSB_MAX_OB_STATUS_VALUE_TYPE_PAIR = 5;
pub const WSB_MAX_OB_STATUS_ENTRY = 5;
pub const WSBAPP_ASYNC_IN_PROGRESS = 7995396;
pub const WSB_OB_ET_UNDEFINED = 0;
pub const WSB_OB_ET_STRING = 1;
pub const WSB_OB_ET_NUMBER = 2;
pub const WSB_OB_ET_DATETIME = 3;
pub const WSB_OB_ET_TIME = 4;
pub const WSB_OB_ET_SIZE = 5;
pub const WSB_OB_ET_MAX = 6;

pub const aliases = struct {
    pub const WSB_OB_STATUS_ENTRY_PAIR_TYPE = i32;
};
