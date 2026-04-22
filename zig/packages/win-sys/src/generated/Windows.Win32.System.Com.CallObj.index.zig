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
    .{ "CoGetInterceptor", MethodRecord{ .library = "ole32", .import = "CoGetInterceptor", .signature = "\x00\x04\x11\x79\x0f\x11\x0d\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CoGetInterceptorFromTypeInfo", MethodRecord{ .library = "ole32", .import = "CoGetInterceptorFromTypeInfo", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x12\x82\xb1\x12\x99\x91\x0f\x11\x0d\x0f\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x1991 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "ITypeInfo" },
        else => null,
    };
}

pub const CALLFRAME_COPY_NESTED = 1;
pub const CALLFRAME_COPY_INDEPENDENT = 2;
pub const CALLFRAME_FREE_NONE = 0;
pub const CALLFRAME_FREE_IN = 1;
pub const CALLFRAME_FREE_INOUT = 2;
pub const CALLFRAME_FREE_OUT = 4;
pub const CALLFRAME_FREE_TOP_INOUT = 8;
pub const CALLFRAME_FREE_TOP_OUT = 16;
pub const CALLFRAME_FREE_ALL = 31;
pub const CALLFRAME_NULL_NONE = 0;
pub const CALLFRAME_NULL_INOUT = 2;
pub const CALLFRAME_NULL_OUT = 4;
pub const CALLFRAME_NULL_ALL = 6;
pub const CALLFRAME_WALK_IN = 1;
pub const CALLFRAME_WALK_INOUT = 2;
pub const CALLFRAME_WALK_OUT = 4;

pub const aliases = struct {
    pub const CALLFRAME_COPY = i32;
    pub const CALLFRAME_FREE = i32;
    pub const CALLFRAME_NULL = i32;
    pub const CALLFRAME_WALK = i32;
};
