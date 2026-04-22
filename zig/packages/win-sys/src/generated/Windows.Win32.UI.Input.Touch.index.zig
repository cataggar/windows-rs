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
    .{ "GetTouchInputInfo", MethodRecord{ .library = "USER32", .import = "GetTouchInputInfo", .signature = "\x00\x04\x11\x59\x11\xa8\x78\x09\x0f\x11\xc0\x00\xc6\x49\x08" } },
    .{ "CloseTouchInputHandle", MethodRecord{ .library = "USER32", .import = "CloseTouchInputHandle", .signature = "\x00\x01\x11\x59\x11\xa8\x78" } },
    .{ "RegisterTouchWindow", MethodRecord{ .library = "USER32", .import = "RegisterTouchWindow", .signature = "\x00\x02\x11\x59\x11\x25\x11\xa6\xc5" } },
    .{ "UnregisterTouchWindow", MethodRecord{ .library = "USER32", .import = "UnregisterTouchWindow", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "IsTouchWindow", MethodRecord{ .library = "USER32", .import = "IsTouchWindow", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x09" } },
    .{ "GetGestureInfo", MethodRecord{ .library = "USER32", .import = "GetGestureInfo", .signature = "\x00\x02\x11\x59\x11\xa8\x74\x0f\x11\xc0\x00\xc6\x4d" } },
    .{ "GetGestureExtraArgs", MethodRecord{ .library = "USER32", .import = "GetGestureExtraArgs", .signature = "\x00\x03\x11\x59\x11\xa8\x74\x09\x0f\x05" } },
    .{ "CloseGestureInfoHandle", MethodRecord{ .library = "USER32", .import = "CloseGestureInfoHandle", .signature = "\x00\x01\x11\x59\x11\xa8\x74" } },
    .{ "SetGestureConfig", MethodRecord{ .library = "USER32", .import = "SetGestureConfig", .signature = "\x00\x05\x11\x59\x11\x25\x09\x09\x0f\x11\xc0\x00\xc6\x51\x09" } },
    .{ "GetGestureConfig", MethodRecord{ .library = "USER32", .import = "GetGestureConfig", .signature = "\x00\x06\x11\x59\x11\x25\x09\x09\x0f\x09\x0f\x11\xc0\x00\xc6\x51\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x26c5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Touch", .name = "REGISTER_TOUCH_WINDOW_FLAGS" },
        0x2874 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Touch", .name = "HGESTUREINFO" },
        0x2878 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Touch", .name = "HTOUCHINPUT" },
        0xc649 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Touch", .name = "TOUCHINPUT" },
        0xc64d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Touch", .name = "GESTUREINFO" },
        0xc651 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Touch", .name = "GESTURECONFIG" },
        else => null,
    };
}

pub const GID_BEGIN = 1;
pub const GID_END = 2;
pub const GID_ZOOM = 3;
pub const GID_PAN = 4;
pub const GID_ROTATE = 5;
pub const GID_TWOFINGERTAP = 6;
pub const GID_PRESSANDTAP = 7;
pub const GID_ROLLOVER = 7;
pub const TOUCHEVENTF_MOVE = 1;
pub const TOUCHEVENTF_DOWN = 2;
pub const TOUCHEVENTF_UP = 4;
pub const TOUCHEVENTF_INRANGE = 8;
pub const TOUCHEVENTF_PRIMARY = 16;
pub const TOUCHEVENTF_NOCOALESCE = 32;
pub const TOUCHEVENTF_PEN = 64;
pub const TOUCHEVENTF_PALM = 128;
pub const TOUCHINPUTMASKF_TIMEFROMSYSTEM = 1;
pub const TOUCHINPUTMASKF_EXTRAINFO = 2;
pub const TOUCHINPUTMASKF_CONTACTAREA = 4;
pub const TWF_FINETOUCH = 1;
pub const TWF_WANTPALM = 2;
pub const MANIPULATION_NONE = 0;
pub const MANIPULATION_TRANSLATE_X = 1;
pub const MANIPULATION_TRANSLATE_Y = 2;
pub const MANIPULATION_SCALE = 4;
pub const MANIPULATION_ROTATE = 8;
pub const MANIPULATION_ALL = 15;

pub const aliases = struct {
    pub const GESTURECONFIG_ID = u32;
    pub const TOUCHEVENTF_FLAGS = u32;
    pub const TOUCHINPUTMASKF_MASK = u32;
    pub const REGISTER_TOUCH_WINDOW_FLAGS = u32;
    pub const MANIPULATION_PROCESSOR_MANIPULATIONS = i32;
};
