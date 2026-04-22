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
    .{ "GetUnpredictedMessagePos", MethodRecord{ .library = "USER32", .import = "GetUnpredictedMessagePos", .signature = "\x00\x00\x09" } },
    .{ "InitializeTouchInjection", MethodRecord{ .library = "USER32", .import = "InitializeTouchInjection", .signature = "\x00\x02\x11\x59\x09\x11\xa6\xb5" } },
    .{ "InjectTouchInput", MethodRecord{ .library = "USER32", .import = "InjectTouchInput", .signature = "\x00\x02\x11\x59\x09\x0f\x11\xc0\x01\xfa\xa8" } },
    .{ "GetPointerType", MethodRecord{ .library = "USER32", .import = "GetPointerType", .signature = "\x00\x02\x11\x59\x09\x0f\x11\x84\x3d" } },
    .{ "GetPointerCursorId", MethodRecord{ .library = "USER32", .import = "GetPointerCursorId", .signature = "\x00\x02\x11\x59\x09\x0f\x09" } },
    .{ "GetPointerInfo", MethodRecord{ .library = "USER32", .import = "GetPointerInfo", .signature = "\x00\x02\x11\x59\x09\x0f\x11\xc0\x00\x7f\x25" } },
    .{ "GetPointerInfoHistory", MethodRecord{ .library = "USER32", .import = "GetPointerInfoHistory", .signature = "\x00\x03\x11\x59\x09\x0f\x09\x0f\x11\xc0\x00\x7f\x25" } },
    .{ "GetPointerFrameInfo", MethodRecord{ .library = "USER32", .import = "GetPointerFrameInfo", .signature = "\x00\x03\x11\x59\x09\x0f\x09\x0f\x11\xc0\x00\x7f\x25" } },
    .{ "GetPointerFrameInfoHistory", MethodRecord{ .library = "USER32", .import = "GetPointerFrameInfoHistory", .signature = "\x00\x04\x11\x59\x09\x0f\x09\x0f\x09\x0f\x11\xc0\x00\x7f\x25" } },
    .{ "GetPointerTouchInfo", MethodRecord{ .library = "USER32", .import = "GetPointerTouchInfo", .signature = "\x00\x02\x11\x59\x09\x0f\x11\xc0\x01\xfa\xa8" } },
    .{ "GetPointerTouchInfoHistory", MethodRecord{ .library = "USER32", .import = "GetPointerTouchInfoHistory", .signature = "\x00\x03\x11\x59\x09\x0f\x09\x0f\x11\xc0\x01\xfa\xa8" } },
    .{ "GetPointerFrameTouchInfo", MethodRecord{ .library = "USER32", .import = "GetPointerFrameTouchInfo", .signature = "\x00\x03\x11\x59\x09\x0f\x09\x0f\x11\xc0\x01\xfa\xa8" } },
    .{ "GetPointerFrameTouchInfoHistory", MethodRecord{ .library = "USER32", .import = "GetPointerFrameTouchInfoHistory", .signature = "\x00\x04\x11\x59\x09\x0f\x09\x0f\x09\x0f\x11\xc0\x01\xfa\xa8" } },
    .{ "GetPointerPenInfo", MethodRecord{ .library = "USER32", .import = "GetPointerPenInfo", .signature = "\x00\x02\x11\x59\x09\x0f\x11\xc0\x01\xfa\xac" } },
    .{ "GetPointerPenInfoHistory", MethodRecord{ .library = "USER32", .import = "GetPointerPenInfoHistory", .signature = "\x00\x03\x11\x59\x09\x0f\x09\x0f\x11\xc0\x01\xfa\xac" } },
    .{ "GetPointerFramePenInfo", MethodRecord{ .library = "USER32", .import = "GetPointerFramePenInfo", .signature = "\x00\x03\x11\x59\x09\x0f\x09\x0f\x11\xc0\x01\xfa\xac" } },
    .{ "GetPointerFramePenInfoHistory", MethodRecord{ .library = "USER32", .import = "GetPointerFramePenInfoHistory", .signature = "\x00\x04\x11\x59\x09\x0f\x09\x0f\x09\x0f\x11\xc0\x01\xfa\xac" } },
    .{ "SkipPointerFrameMessages", MethodRecord{ .library = "USER32", .import = "SkipPointerFrameMessages", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "InjectSyntheticPointerInput", MethodRecord{ .library = "USER32", .import = "InjectSyntheticPointerInput", .signature = "\x00\x03\x11\x59\x11\x84\x39\x0f\x11\xc0\x00\xea\x49\x09" } },
    .{ "DestroySyntheticPointerDevice", MethodRecord{ .library = "USER32", .import = "DestroySyntheticPointerDevice", .signature = "\x00\x01\x01\x11\x84\x39" } },
    .{ "EnableMouseInPointer", MethodRecord{ .library = "USER32", .import = "EnableMouseInPointer", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "IsMouseInPointerEnabled", MethodRecord{ .library = "USER32", .import = "IsMouseInPointerEnabled", .signature = "\x00\x00\x11\x59" } },
    .{ "GetPointerInputTransform", MethodRecord{ .library = "USER32", .import = "GetPointerInputTransform", .signature = "\x00\x03\x11\x59\x09\x09\x0f\x11\xc0\x00\xea\x51" } },
    .{ "GetPointerDevices", MethodRecord{ .library = "USER32", .import = "GetPointerDevices", .signature = "\x00\x02\x11\x59\x0f\x09\x0f\x11\xc0\x01\xfa\xd0" } },
    .{ "GetPointerDevice", MethodRecord{ .library = "USER32", .import = "GetPointerDevice", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x01\xfa\xd0" } },
    .{ "GetPointerDeviceProperties", MethodRecord{ .library = "USER32", .import = "GetPointerDeviceProperties", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x09\x0f\x11\xc0\x01\xfa\xd4" } },
    .{ "GetPointerDeviceRects", MethodRecord{ .library = "USER32", .import = "GetPointerDeviceRects", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\x83\x89\x0f\x11\x83\x89" } },
    .{ "GetPointerDeviceCursors", MethodRecord{ .library = "USER32", .import = "GetPointerDeviceCursors", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x09\x0f\x11\xc0\x01\xfa\xdc" } },
    .{ "GetRawPointerDeviceData", MethodRecord{ .library = "USER32", .import = "GetRawPointerDeviceData", .signature = "\x00\x05\x11\x59\x09\x09\x09\x0f\x11\xc0\x01\xfa\xd4\x0f\x08" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x389 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "RECT" },
        0x439 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Pointer", .name = "HSYNTHETICPOINTERDEVICE" },
        0x43d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "POINTER_INPUT_TYPE" },
        0x26b5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Pointer", .name = "TOUCH_FEEDBACK_MODE" },
        0x7f25 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Pointer", .name = "POINTER_INFO" },
        0xea49 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Pointer", .name = "POINTER_TYPE_INFO" },
        0xea51 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Pointer", .name = "INPUT_TRANSFORM" },
        0x1faa8 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Pointer", .name = "POINTER_TOUCH_INFO" },
        0x1faac => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Pointer", .name = "POINTER_PEN_INFO" },
        0x1fad0 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Pointer", .name = "POINTER_DEVICE_INFO" },
        0x1fad4 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Pointer", .name = "POINTER_DEVICE_PROPERTY" },
        0x1fadc => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Pointer", .name = "POINTER_DEVICE_CURSOR_INFO" },
        else => null,
    };
}

pub const POINTER_FLAG_NONE = 0;
pub const POINTER_FLAG_NEW = 1;
pub const POINTER_FLAG_INRANGE = 2;
pub const POINTER_FLAG_INCONTACT = 4;
pub const POINTER_FLAG_FIRSTBUTTON = 16;
pub const POINTER_FLAG_SECONDBUTTON = 32;
pub const POINTER_FLAG_THIRDBUTTON = 64;
pub const POINTER_FLAG_FOURTHBUTTON = 128;
pub const POINTER_FLAG_FIFTHBUTTON = 256;
pub const POINTER_FLAG_PRIMARY = 8192;
pub const POINTER_FLAG_CONFIDENCE = 16384;
pub const POINTER_FLAG_CANCELED = 32768;
pub const POINTER_FLAG_DOWN = 65536;
pub const POINTER_FLAG_UPDATE = 131072;
pub const POINTER_FLAG_UP = 262144;
pub const POINTER_FLAG_WHEEL = 524288;
pub const POINTER_FLAG_HWHEEL = 1048576;
pub const POINTER_FLAG_CAPTURECHANGED = 2097152;
pub const POINTER_FLAG_HASTRANSFORM = 4194304;
pub const TOUCH_FEEDBACK_DEFAULT = 1;
pub const TOUCH_FEEDBACK_INDIRECT = 2;
pub const TOUCH_FEEDBACK_NONE = 3;
pub const POINTER_CHANGE_NONE = 0;
pub const POINTER_CHANGE_FIRSTBUTTON_DOWN = 1;
pub const POINTER_CHANGE_FIRSTBUTTON_UP = 2;
pub const POINTER_CHANGE_SECONDBUTTON_DOWN = 3;
pub const POINTER_CHANGE_SECONDBUTTON_UP = 4;
pub const POINTER_CHANGE_THIRDBUTTON_DOWN = 5;
pub const POINTER_CHANGE_THIRDBUTTON_UP = 6;
pub const POINTER_CHANGE_FOURTHBUTTON_DOWN = 7;
pub const POINTER_CHANGE_FOURTHBUTTON_UP = 8;
pub const POINTER_CHANGE_FIFTHBUTTON_DOWN = 9;
pub const POINTER_CHANGE_FIFTHBUTTON_UP = 10;
pub const POINTER_FEEDBACK_DEFAULT = 1;
pub const POINTER_FEEDBACK_INDIRECT = 2;
pub const POINTER_FEEDBACK_NONE = 3;
pub const POINTER_DEVICE_TYPE_INTEGRATED_PEN = 1;
pub const POINTER_DEVICE_TYPE_EXTERNAL_PEN = 2;
pub const POINTER_DEVICE_TYPE_TOUCH = 3;
pub const POINTER_DEVICE_TYPE_TOUCH_PAD = 4;
pub const POINTER_DEVICE_TYPE_MAX = -1;
pub const POINTER_DEVICE_CURSOR_TYPE_UNKNOWN = 0;
pub const POINTER_DEVICE_CURSOR_TYPE_TIP = 1;
pub const POINTER_DEVICE_CURSOR_TYPE_ERASER = 2;
pub const POINTER_DEVICE_CURSOR_TYPE_MAX = -1;

pub const aliases = struct {
    pub const POINTER_FLAGS = u32;
    pub const TOUCH_FEEDBACK_MODE = u32;
    pub const POINTER_BUTTON_CHANGE_TYPE = i32;
    pub const POINTER_FEEDBACK_MODE = i32;
    pub const POINTER_DEVICE_TYPE = i32;
    pub const POINTER_DEVICE_CURSOR_TYPE = i32;
    pub const HSYNTHETICPOINTERDEVICE = ?*anyopaque;
};
