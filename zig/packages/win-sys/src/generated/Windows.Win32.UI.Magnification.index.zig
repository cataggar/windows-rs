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
    .{ "MagInitialize", MethodRecord{ .library = "MAGNIFICATION", .import = "MagInitialize", .signature = "\x00\x00\x11\x59" } },
    .{ "MagUninitialize", MethodRecord{ .library = "MAGNIFICATION", .import = "MagUninitialize", .signature = "\x00\x00\x11\x59" } },
    .{ "MagSetWindowSource", MethodRecord{ .library = "MAGNIFICATION", .import = "MagSetWindowSource", .signature = "\x00\x02\x11\x59\x11\x25\x11\x83\x89" } },
    .{ "MagGetWindowSource", MethodRecord{ .library = "MAGNIFICATION", .import = "MagGetWindowSource", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x83\x89" } },
    .{ "MagSetWindowTransform", MethodRecord{ .library = "MAGNIFICATION", .import = "MagSetWindowTransform", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xc0\x00\x47\x89" } },
    .{ "MagGetWindowTransform", MethodRecord{ .library = "MAGNIFICATION", .import = "MagGetWindowTransform", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xc0\x00\x47\x89" } },
    .{ "MagSetWindowFilterList", MethodRecord{ .library = "MAGNIFICATION", .import = "MagSetWindowFilterList", .signature = "\x00\x04\x11\x59\x11\x25\x11\xa6\xf5\x08\x0f\x11\x25" } },
    .{ "MagGetWindowFilterList", MethodRecord{ .library = "MAGNIFICATION", .import = "MagGetWindowFilterList", .signature = "\x00\x04\x08\x11\x25\x0f\x11\xa6\xf5\x08\x0f\x11\x25" } },
    .{ "MagSetImageScalingCallback", MethodRecord{ .library = "MAGNIFICATION", .import = "MagSetImageScalingCallback", .signature = "\x00\x02\x11\x59\x11\x25\x12\xc0\x00\x47\x8d" } },
    .{ "MagGetImageScalingCallback", MethodRecord{ .library = "MAGNIFICATION", .import = "MagGetImageScalingCallback", .signature = "\x00\x01\x12\xc0\x00\x47\x8d\x11\x25" } },
    .{ "MagSetColorEffect", MethodRecord{ .library = "MAGNIFICATION", .import = "MagSetColorEffect", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xc0\x00\x47\x91" } },
    .{ "MagGetColorEffect", MethodRecord{ .library = "MAGNIFICATION", .import = "MagGetColorEffect", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xc0\x00\x47\x91" } },
    .{ "MagSetFullscreenTransform", MethodRecord{ .library = "MAGNIFICATION", .import = "MagSetFullscreenTransform", .signature = "\x00\x03\x11\x59\x0c\x08\x08" } },
    .{ "MagGetFullscreenTransform", MethodRecord{ .library = "MAGNIFICATION", .import = "MagGetFullscreenTransform", .signature = "\x00\x03\x11\x59\x0f\x0c\x0f\x08\x0f\x08" } },
    .{ "MagSetFullscreenColorEffect", MethodRecord{ .library = "MAGNIFICATION", .import = "MagSetFullscreenColorEffect", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x47\x91" } },
    .{ "MagGetFullscreenColorEffect", MethodRecord{ .library = "MAGNIFICATION", .import = "MagGetFullscreenColorEffect", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x47\x91" } },
    .{ "MagSetInputTransform", MethodRecord{ .library = "MAGNIFICATION", .import = "MagSetInputTransform", .signature = "\x00\x03\x11\x59\x11\x59\x0f\x11\x83\x89\x0f\x11\x83\x89" } },
    .{ "MagGetInputTransform", MethodRecord{ .library = "MAGNIFICATION", .import = "MagGetInputTransform", .signature = "\x00\x03\x11\x59\x0f\x11\x59\x0f\x11\x83\x89\x0f\x11\x83\x89" } },
    .{ "MagShowSystemCursor", MethodRecord{ .library = "MAGNIFICATION", .import = "MagShowSystemCursor", .signature = "\x00\x01\x11\x59\x11\x59" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x389 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "RECT" },
        0x26f5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Magnification", .name = "MW_FILTERMODE" },
        0x4789 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Magnification", .name = "MAGTRANSFORM" },
        0x478d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Magnification", .name = "MagImageScalingCallback" },
        0x4791 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Magnification", .name = "MAGCOLOREFFECT" },
        else => null,
    };
}

pub const MW_FILTERMODE_EXCLUDE = 0;
pub const MW_FILTERMODE_INCLUDE = 1;
pub const MS_SHOWMAGNIFIEDCURSOR = 1;
pub const MS_CLIPAROUNDCURSOR = 2;
pub const MS_INVERTCOLORS = 4;

pub const aliases = struct {
    pub const MW_FILTERMODE = u32;
};
