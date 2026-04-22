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

pub const HO_NONE = 0;
pub const HO_OPEN_REQUIRING_OPLOCK = 262144;
pub const HO_DELETE_ON_CLOSE = 67108864;
pub const HO_SEQUENTIAL_SCAN = 134217728;
pub const HO_RANDOM_ACCESS = 268435456;
pub const HO_NO_BUFFERING = 536870912;
pub const HO_OVERLAPPED = 1073741824;
pub const HO_WRITE_THROUGH = 2147483648;
pub const HAO_NONE = 0;
pub const HAO_READ_ATTRIBUTES = 128;
pub const HAO_READ = 1179785;
pub const HAO_WRITE = 1179926;
pub const HAO_DELETE = 65536;
pub const HSO_SHARE_NONE = 0;
pub const HSO_SHARE_READ = 1;
pub const HSO_SHARE_WRITE = 2;
pub const HSO_SHARE_DELETE = 4;
pub const HCO_CREATE_NEW = 1;
pub const HCO_CREATE_ALWAYS = 2;
pub const HCO_OPEN_EXISTING = 3;
pub const HCO_OPEN_ALWAYS = 4;
pub const HCO_TRUNCATE_EXISTING = 5;

pub const aliases = struct {
    pub const HANDLE_OPTIONS = u32;
    pub const HANDLE_ACCESS_OPTIONS = i32;
    pub const HANDLE_SHARING_OPTIONS = i32;
    pub const HANDLE_CREATION_OPTIONS = i32;
};
