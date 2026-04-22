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

pub const WINSAT_OEM_DATA_VALID = 0;
pub const WINSAT_OEM_DATA_NON_SYS_CONFIG_MATCH = 1;
pub const WINSAT_OEM_DATA_INVALID = 2;
pub const WINSAT_OEM_NO_DATA_SUPPLIED = 3;
pub const WINSAT_ASSESSMENT_STATE_MIN = 0;
pub const WINSAT_ASSESSMENT_STATE_UNKNOWN = 0;
pub const WINSAT_ASSESSMENT_STATE_VALID = 1;
pub const WINSAT_ASSESSMENT_STATE_INCOHERENT_WITH_HARDWARE = 2;
pub const WINSAT_ASSESSMENT_STATE_NOT_AVAILABLE = 3;
pub const WINSAT_ASSESSMENT_STATE_INVALID = 4;
pub const WINSAT_ASSESSMENT_STATE_MAX = 4;
pub const WINSAT_ASSESSMENT_MEMORY = 0;
pub const WINSAT_ASSESSMENT_CPU = 1;
pub const WINSAT_ASSESSMENT_DISK = 2;
pub const WINSAT_ASSESSMENT_D3D = 3;
pub const WINSAT_ASSESSMENT_GRAPHICS = 4;
pub const WINSAT_BITMAP_SIZE_SMALL = 0;
pub const WINSAT_BITMAP_SIZE_NORMAL = 1;

pub const aliases = struct {
    pub const WINSAT_OEM_CUSTOMIZATION_STATE = i32;
    pub const WINSAT_ASSESSMENT_STATE = i32;
    pub const WINSAT_ASSESSMENT_TYPE = i32;
    pub const WINSAT_BITMAP_SIZE = i32;
};
