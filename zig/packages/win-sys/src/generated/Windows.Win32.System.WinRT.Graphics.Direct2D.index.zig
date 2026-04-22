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

pub const GRAPHICS_EFFECT_PROPERTY_MAPPING_UNKNOWN = 0;
pub const GRAPHICS_EFFECT_PROPERTY_MAPPING_DIRECT = 1;
pub const GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORX = 2;
pub const GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORY = 3;
pub const GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORZ = 4;
pub const GRAPHICS_EFFECT_PROPERTY_MAPPING_VECTORW = 5;
pub const GRAPHICS_EFFECT_PROPERTY_MAPPING_RECT_TO_VECTOR4 = 6;
pub const GRAPHICS_EFFECT_PROPERTY_MAPPING_RADIANS_TO_DEGREES = 7;
pub const GRAPHICS_EFFECT_PROPERTY_MAPPING_COLORMATRIX_ALPHA_MODE = 8;
pub const GRAPHICS_EFFECT_PROPERTY_MAPPING_COLOR_TO_VECTOR3 = 9;
pub const GRAPHICS_EFFECT_PROPERTY_MAPPING_COLOR_TO_VECTOR4 = 10;

pub const aliases = struct {
    pub const GRAPHICS_EFFECT_PROPERTY_MAPPING = i32;
};
