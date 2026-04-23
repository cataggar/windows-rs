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

pub const CGD_DEFAULT = 0;
pub const CGD_UNKNOWN_PROPERTY = 0;
pub const CGD_STRING_PROPERTY = 1;
pub const CGD_DATE_PROPERTY = 2;
pub const CGD_BINARY_PROPERTY = 4;
pub const CGD_ARRAY_NODE = 8;
pub const CA_CREATE_LOCAL = 0;
pub const CA_CREATE_EXTERNAL = 1;
pub const CACO_DEFAULT = 0;
pub const CACO_INCLUDE_EXTERNAL = 1;
pub const CACO_EXTERNAL_ONLY = 2;

pub const aliases = struct {
    pub const CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS = i32;
    pub const CONTACT_AGGREGATION_COLLECTION_OPTIONS = i32;
};
