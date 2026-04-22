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

pub const USE_SYSTEM_COLORS_WHEN_NECESSARY = 0;
pub const USE_SYSTEM_COLORS = 1;
pub const USE_ORIGINAL_COLORS = 2;

pub const aliases = struct {
    pub const INK_HIGH_CONTRAST_ADJUSTMENT = i32;
};
