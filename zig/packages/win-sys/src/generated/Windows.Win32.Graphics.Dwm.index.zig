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
    .{ "DwmDefWindowProc", MethodRecord{ .library = "dwmapi", .import = "DwmDefWindowProc", .signature = "\x00\x05\x11\x59\x11\x25\x09\x11\x83\x8d\x11\x82\x2d\x0f\x11\x82\x35" } },
    .{ "DwmEnableBlurBehindWindow", MethodRecord{ .library = "dwmapi", .import = "DwmEnableBlurBehindWindow", .signature = "\x00\x02\x11\x79\x11\x25\x0f\x11\xae\x05" } },
    .{ "DwmEnableComposition", MethodRecord{ .library = "dwmapi", .import = "DwmEnableComposition", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "DwmEnableMMCSS", MethodRecord{ .library = "dwmapi", .import = "DwmEnableMMCSS", .signature = "\x00\x01\x11\x79\x11\x59" } },
    .{ "DwmExtendFrameIntoClientArea", MethodRecord{ .library = "dwmapi", .import = "DwmExtendFrameIntoClientArea", .signature = "\x00\x02\x11\x79\x11\x25\x0f\x11\x84\x01" } },
    .{ "DwmGetColorizationColor", MethodRecord{ .library = "dwmapi", .import = "DwmGetColorizationColor", .signature = "\x00\x02\x11\x79\x0f\x09\x0f\x11\x59" } },
    .{ "DwmGetCompositionTimingInfo", MethodRecord{ .library = "dwmapi", .import = "DwmGetCompositionTimingInfo", .signature = "\x00\x02\x11\x79\x11\x25\x0f\x11\xae\x09" } },
    .{ "DwmGetWindowAttribute", MethodRecord{ .library = "dwmapi", .import = "DwmGetWindowAttribute", .signature = "\x00\x04\x11\x79\x11\x25\x09\x0f\x01\x09" } },
    .{ "DwmIsCompositionEnabled", MethodRecord{ .library = "dwmapi", .import = "DwmIsCompositionEnabled", .signature = "\x00\x01\x11\x79\x0f\x11\x59" } },
    .{ "DwmModifyPreviousDxFrameDuration", MethodRecord{ .library = "dwmapi", .import = "DwmModifyPreviousDxFrameDuration", .signature = "\x00\x03\x11\x79\x11\x25\x08\x11\x59" } },
    .{ "DwmQueryThumbnailSourceSize", MethodRecord{ .library = "dwmapi", .import = "DwmQueryThumbnailSourceSize", .signature = "\x00\x02\x11\x79\x18\x0f\x11\x83\xe9" } },
    .{ "DwmRegisterThumbnail", MethodRecord{ .library = "dwmapi", .import = "DwmRegisterThumbnail", .signature = "\x00\x03\x11\x79\x11\x25\x11\x25\x0f\x18" } },
    .{ "DwmSetDxFrameDuration", MethodRecord{ .library = "dwmapi", .import = "DwmSetDxFrameDuration", .signature = "\x00\x02\x11\x79\x11\x25\x08" } },
    .{ "DwmSetPresentParameters", MethodRecord{ .library = "dwmapi", .import = "DwmSetPresentParameters", .signature = "\x00\x02\x11\x79\x11\x25\x0f\x11\xae\x0d" } },
    .{ "DwmSetWindowAttribute", MethodRecord{ .library = "dwmapi", .import = "DwmSetWindowAttribute", .signature = "\x00\x04\x11\x79\x11\x25\x09\x0f\x01\x09" } },
    .{ "DwmUnregisterThumbnail", MethodRecord{ .library = "dwmapi", .import = "DwmUnregisterThumbnail", .signature = "\x00\x01\x11\x79\x18" } },
    .{ "DwmUpdateThumbnailProperties", MethodRecord{ .library = "dwmapi", .import = "DwmUpdateThumbnailProperties", .signature = "\x00\x02\x11\x79\x18\x0f\x11\xae\x11" } },
    .{ "DwmSetIconicThumbnail", MethodRecord{ .library = "dwmapi", .import = "DwmSetIconicThumbnail", .signature = "\x00\x03\x11\x79\x11\x25\x11\x83\x51\x09" } },
    .{ "DwmSetIconicLivePreviewBitmap", MethodRecord{ .library = "dwmapi", .import = "DwmSetIconicLivePreviewBitmap", .signature = "\x00\x04\x11\x79\x11\x25\x11\x83\x51\x0f\x11\x83\x71\x09" } },
    .{ "DwmInvalidateIconicBitmaps", MethodRecord{ .library = "dwmapi", .import = "DwmInvalidateIconicBitmaps", .signature = "\x00\x01\x11\x79\x11\x25" } },
    .{ "DwmAttachMilContent", MethodRecord{ .library = "dwmapi", .import = "DwmAttachMilContent", .signature = "\x00\x01\x11\x79\x11\x25" } },
    .{ "DwmDetachMilContent", MethodRecord{ .library = "dwmapi", .import = "DwmDetachMilContent", .signature = "\x00\x01\x11\x79\x11\x25" } },
    .{ "DwmFlush", MethodRecord{ .library = "dwmapi", .import = "DwmFlush", .signature = "\x00\x00\x11\x79" } },
    .{ "DwmGetGraphicsStreamTransformHint", MethodRecord{ .library = "dwmapi", .import = "DwmGetGraphicsStreamTransformHint", .signature = "\x00\x02\x11\x79\x09\x0f\x11\xae\x15" } },
    .{ "DwmGetGraphicsStreamClient", MethodRecord{ .library = "dwmapi", .import = "DwmGetGraphicsStreamClient", .signature = "\x00\x02\x11\x79\x09\x0f\x11\x0d" } },
    .{ "DwmGetTransportAttributes", MethodRecord{ .library = "dwmapi", .import = "DwmGetTransportAttributes", .signature = "\x00\x03\x11\x79\x0f\x11\x59\x0f\x11\x59\x0f\x09" } },
    .{ "DwmTransitionOwnedWindow", MethodRecord{ .library = "dwmapi", .import = "DwmTransitionOwnedWindow", .signature = "\x00\x02\x11\x79\x11\x25\x11\xae\x19" } },
    .{ "DwmRenderGesture", MethodRecord{ .library = "dwmapi", .import = "DwmRenderGesture", .signature = "\x00\x04\x11\x79\x11\xae\x1d\x09\x0f\x09\x0f\x11\x83\x71" } },
    .{ "DwmTetherContact", MethodRecord{ .library = "dwmapi", .import = "DwmTetherContact", .signature = "\x00\x03\x11\x79\x09\x11\x59\x11\x83\x71" } },
    .{ "DwmShowContact", MethodRecord{ .library = "dwmapi", .import = "DwmShowContact", .signature = "\x00\x02\x11\x79\x09\x11\xae\x21" } },
    .{ "DwmGetUnmetTabRequirements", MethodRecord{ .library = "dwmapi", .import = "DwmGetUnmetTabRequirements", .signature = "\x00\x02\x11\x79\x11\x25\x0f\x11\xae\x25" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x235 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LRESULT" },
        0x351 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HBITMAP" },
        0x371 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "POINT" },
        0x38d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WPARAM" },
        0x3e9 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SIZE" },
        0x401 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls", .name = "MARGINS" },
        0x2e05 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Dwm", .name = "DWM_BLURBEHIND" },
        0x2e09 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Dwm", .name = "DWM_TIMING_INFO" },
        0x2e0d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Dwm", .name = "DWM_PRESENT_PARAMETERS" },
        0x2e11 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Dwm", .name = "DWM_THUMBNAIL_PROPERTIES" },
        0x2e15 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Dwm", .name = "MilMatrix3x2D" },
        0x2e19 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Dwm", .name = "DWMTRANSITION_OWNEDWINDOW_TARGET" },
        0x2e1d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Dwm", .name = "GESTURE_TYPE" },
        0x2e21 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Dwm", .name = "DWM_SHOWCONTACT" },
        0x2e25 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Dwm", .name = "DWM_TAB_WINDOW_REQUIREMENTS" },
        else => null,
    };
}

pub const DWM_BB_ENABLE = 1;
pub const DWM_BB_BLURREGION = 2;
pub const DWM_BB_TRANSITIONONMAXIMIZED = 4;
pub const DWMWA_COLOR_DEFAULT = 4294967295;
pub const DWMWA_COLOR_NONE = 4294967294;
pub const DWM_CLOAKED_APP = 1;
pub const DWM_CLOAKED_SHELL = 2;
pub const DWM_CLOAKED_INHERITED = 4;
pub const DWM_TNP_RECTDESTINATION = 1;
pub const DWM_TNP_RECTSOURCE = 2;
pub const DWM_TNP_OPACITY = 4;
pub const DWM_TNP_VISIBLE = 8;
pub const DWM_TNP_SOURCECLIENTAREAONLY = 16;
pub const DWM_FRAME_DURATION_DEFAULT = -1;
pub const DWM_EC_DISABLECOMPOSITION = 0;
pub const DWM_EC_ENABLECOMPOSITION = 1;
pub const DWM_SIT_DISPLAYFRAME = 1;
pub const c_DwmMaxQueuedBuffers = 8;
pub const c_DwmMaxMonitors = 16;
pub const c_DwmMaxAdapters = 16;
pub const DWMWA_NCRENDERING_ENABLED = 1;
pub const DWMWA_NCRENDERING_POLICY = 2;
pub const DWMWA_TRANSITIONS_FORCEDISABLED = 3;
pub const DWMWA_ALLOW_NCPAINT = 4;
pub const DWMWA_CAPTION_BUTTON_BOUNDS = 5;
pub const DWMWA_NONCLIENT_RTL_LAYOUT = 6;
pub const DWMWA_FORCE_ICONIC_REPRESENTATION = 7;
pub const DWMWA_FLIP3D_POLICY = 8;
pub const DWMWA_EXTENDED_FRAME_BOUNDS = 9;
pub const DWMWA_HAS_ICONIC_BITMAP = 10;
pub const DWMWA_DISALLOW_PEEK = 11;
pub const DWMWA_EXCLUDED_FROM_PEEK = 12;
pub const DWMWA_CLOAK = 13;
pub const DWMWA_CLOAKED = 14;
pub const DWMWA_FREEZE_REPRESENTATION = 15;
pub const DWMWA_PASSIVE_UPDATE_MODE = 16;
pub const DWMWA_USE_HOSTBACKDROPBRUSH = 17;
pub const DWMWA_USE_IMMERSIVE_DARK_MODE = 20;
pub const DWMWA_WINDOW_CORNER_PREFERENCE = 33;
pub const DWMWA_BORDER_COLOR = 34;
pub const DWMWA_CAPTION_COLOR = 35;
pub const DWMWA_TEXT_COLOR = 36;
pub const DWMWA_VISIBLE_FRAME_BORDER_THICKNESS = 37;
pub const DWMWA_SYSTEMBACKDROP_TYPE = 38;
pub const DWMWA_REDIRECTIONBITMAP_ALPHA = 39;
pub const DWMWA_BORDER_MARGINS = 40;
pub const DWMWA_LAST = 41;
pub const DWMWCP_DEFAULT = 0;
pub const DWMWCP_DONOTROUND = 1;
pub const DWMWCP_ROUND = 2;
pub const DWMWCP_ROUNDSMALL = 3;
pub const DWMSBT_AUTO = 0;
pub const DWMSBT_NONE = 1;
pub const DWMSBT_MAINWINDOW = 2;
pub const DWMSBT_TRANSIENTWINDOW = 3;
pub const DWMSBT_TABBEDWINDOW = 4;
pub const DWMNCRP_USEWINDOWSTYLE = 0;
pub const DWMNCRP_DISABLED = 1;
pub const DWMNCRP_ENABLED = 2;
pub const DWMNCRP_LAST = 3;
pub const DWMFLIP3D_DEFAULT = 0;
pub const DWMFLIP3D_EXCLUDEBELOW = 1;
pub const DWMFLIP3D_EXCLUDEABOVE = 2;
pub const DWMFLIP3D_LAST = 3;
pub const DWM_SOURCE_FRAME_SAMPLING_POINT = 0;
pub const DWM_SOURCE_FRAME_SAMPLING_COVERAGE = 1;
pub const DWM_SOURCE_FRAME_SAMPLING_LAST = 2;
pub const DWMTRANSITION_OWNEDWINDOW_NULL = -1;
pub const DWMTRANSITION_OWNEDWINDOW_REPOSITION = 0;
pub const GT_PEN_TAP = 0;
pub const GT_PEN_DOUBLETAP = 1;
pub const GT_PEN_RIGHTTAP = 2;
pub const GT_PEN_PRESSANDHOLD = 3;
pub const GT_PEN_PRESSANDHOLDABORT = 4;
pub const GT_TOUCH_TAP = 5;
pub const GT_TOUCH_DOUBLETAP = 6;
pub const GT_TOUCH_RIGHTTAP = 7;
pub const GT_TOUCH_PRESSANDHOLD = 8;
pub const GT_TOUCH_PRESSANDHOLDABORT = 9;
pub const GT_TOUCH_PRESSANDTAP = 10;
pub const DWMSC_DOWN = 1;
pub const DWMSC_UP = 2;
pub const DWMSC_DRAG = 4;
pub const DWMSC_HOLD = 8;
pub const DWMSC_PENBARREL = 16;
pub const DWMSC_NONE = 0;
pub const DWMSC_ALL = 4294967295;
pub const DWMTWR_NONE = 0;
pub const DWMTWR_IMPLEMENTED_BY_SYSTEM = 1;
pub const DWMTWR_WINDOW_RELATIONSHIP = 2;
pub const DWMTWR_WINDOW_STYLES = 4;
pub const DWMTWR_WINDOW_REGION = 8;
pub const DWMTWR_WINDOW_DWM_ATTRIBUTES = 16;
pub const DWMTWR_WINDOW_MARGINS = 32;
pub const DWMTWR_TABBING_ENABLED = 64;
pub const DWMTWR_USER_POLICY = 128;
pub const DWMTWR_GROUP_POLICY = 256;
pub const DWMTWR_APP_COMPAT = 512;

pub const aliases = struct {
    pub const DWMWINDOWATTRIBUTE = i32;
    pub const DWM_WINDOW_CORNER_PREFERENCE = i32;
    pub const DWM_SYSTEMBACKDROP_TYPE = i32;
    pub const DWMNCRENDERINGPOLICY = i32;
    pub const DWMFLIP3DWINDOWPOLICY = i32;
    pub const DWM_SOURCE_FRAME_SAMPLING = i32;
    pub const DWMTRANSITION_OWNEDWINDOW_TARGET = i32;
    pub const GESTURE_TYPE = i32;
    pub const DWM_SHOWCONTACT = u32;
    pub const DWM_TAB_WINDOW_REQUIREMENTS = i32;
};
