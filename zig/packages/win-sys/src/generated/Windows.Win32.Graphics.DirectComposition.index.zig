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
    .{ "DCompositionCreateDevice", MethodRecord{ .library = "dcomp", .import = "DCompositionCreateDevice", .signature = "\x00\x03\x11\x79\x12\xad\x75\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "DCompositionCreateDevice2", MethodRecord{ .library = "dcomp", .import = "DCompositionCreateDevice2", .signature = "\x00\x03\x11\x79\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "DCompositionCreateDevice3", MethodRecord{ .library = "dcomp", .import = "DCompositionCreateDevice3", .signature = "\x00\x03\x11\x79\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "DCompositionCreateSurfaceHandle", MethodRecord{ .library = "dcomp", .import = "DCompositionCreateSurfaceHandle", .signature = "\x00\x03\x11\x79\x09\x0f\x11\x8b\xb5\x0f\x11\x80\x85" } },
    .{ "DCompositionAttachMouseWheelToHwnd", MethodRecord{ .library = "dcomp", .import = "DCompositionAttachMouseWheelToHwnd", .signature = "\x00\x03\x11\x79\x12\xad\xd5\x11\x25\x11\x59" } },
    .{ "DCompositionAttachMouseDragToHwnd", MethodRecord{ .library = "dcomp", .import = "DCompositionAttachMouseDragToHwnd", .signature = "\x00\x03\x11\x79\x12\xad\xd5\x11\x25\x11\x59" } },
    .{ "DCompositionGetFrameId", MethodRecord{ .library = "dcomp", .import = "DCompositionGetFrameId", .signature = "\x00\x02\x11\x79\x11\xad\xd9\x0f\x0b" } },
    .{ "DCompositionGetStatistics", MethodRecord{ .library = "dcomp", .import = "DCompositionGetStatistics", .signature = "\x00\x05\x11\x79\x0b\x0f\x11\xad\xdd\x09\x0f\x11\xad\xe1\x0f\x09" } },
    .{ "DCompositionGetTargetStatistics", MethodRecord{ .library = "dcomp", .import = "DCompositionGetTargetStatistics", .signature = "\x00\x03\x11\x79\x0b\x0f\x11\xad\xe1\x0f\x11\xad\xe5" } },
    .{ "DCompositionBoostCompositorClock", MethodRecord{ .library = "dcomp", .import = "DCompositionBoostCompositorClock", .signature = "\x00\x01\x11\x79\x11\x59" } },
    .{ "DCompositionWaitForCompositorClock", MethodRecord{ .library = "dcomp", .import = "DCompositionWaitForCompositorClock", .signature = "\x00\x03\x09\x09\x0f\x11\x80\x85\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0x2d75 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Dxgi", .name = "IDXGIDevice" },
        0x2dd5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.DirectComposition", .name = "IDCompositionVisual" },
        0x2dd9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.DirectComposition", .name = "COMPOSITION_FRAME_ID_TYPE" },
        0x2ddd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.DirectComposition", .name = "COMPOSITION_FRAME_STATS" },
        0x2de1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.DirectComposition", .name = "COMPOSITION_TARGET_ID" },
        0x2de5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.DirectComposition", .name = "COMPOSITION_TARGET_STATS" },
        else => null,
    };
}

pub const COMPOSITIONOBJECT_READ = 1;
pub const COMPOSITIONOBJECT_WRITE = 2;
pub const DCOMPOSITION_MAX_WAITFORCOMPOSITORCLOCK_OBJECTS = 32;
pub const COMPOSITION_STATS_MAX_TARGETS = 256;
pub const DCOMPOSITION_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0;
pub const DCOMPOSITION_BITMAP_INTERPOLATION_MODE_LINEAR = 1;
pub const DCOMPOSITION_BITMAP_INTERPOLATION_MODE_INHERIT = -1;
pub const DCOMPOSITION_BORDER_MODE_SOFT = 0;
pub const DCOMPOSITION_BORDER_MODE_HARD = 1;
pub const DCOMPOSITION_BORDER_MODE_INHERIT = -1;
pub const DCOMPOSITION_COMPOSITE_MODE_SOURCE_OVER = 0;
pub const DCOMPOSITION_COMPOSITE_MODE_DESTINATION_INVERT = 1;
pub const DCOMPOSITION_COMPOSITE_MODE_MIN_BLEND = 2;
pub const DCOMPOSITION_COMPOSITE_MODE_INHERIT = -1;
pub const DCOMPOSITION_BACKFACE_VISIBILITY_VISIBLE = 0;
pub const DCOMPOSITION_BACKFACE_VISIBILITY_HIDDEN = 1;
pub const DCOMPOSITION_BACKFACE_VISIBILITY_INHERIT = -1;
pub const DCOMPOSITION_OPACITY_MODE_LAYER = 0;
pub const DCOMPOSITION_OPACITY_MODE_MULTIPLY = 1;
pub const DCOMPOSITION_OPACITY_MODE_INHERIT = -1;
pub const DCOMPOSITION_DEPTH_MODE_TREE = 0;
pub const DCOMPOSITION_DEPTH_MODE_SPATIAL = 1;
pub const DCOMPOSITION_DEPTH_MODE_SORTED = 3;
pub const DCOMPOSITION_DEPTH_MODE_INHERIT = -1;
pub const COMPOSITION_FRAME_ID_CREATED = 0;
pub const COMPOSITION_FRAME_ID_CONFIRMED = 1;
pub const COMPOSITION_FRAME_ID_COMPLETED = 2;

pub const aliases = struct {
    pub const DCOMPOSITION_BITMAP_INTERPOLATION_MODE = i32;
    pub const DCOMPOSITION_BORDER_MODE = i32;
    pub const DCOMPOSITION_COMPOSITE_MODE = i32;
    pub const DCOMPOSITION_BACKFACE_VISIBILITY = i32;
    pub const DCOMPOSITION_OPACITY_MODE = i32;
    pub const DCOMPOSITION_DEPTH_MODE = i32;
    pub const COMPOSITION_FRAME_ID_TYPE = i32;
};
