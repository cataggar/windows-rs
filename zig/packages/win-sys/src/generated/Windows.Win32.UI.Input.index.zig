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
    .{ "GetRawInputData", MethodRecord{ .library = "USER32", .import = "GetRawInputData", .signature = "\x00\x05\x09\x11\xa8\x64\x11\xa6\x4d\x0f\x01\x0f\x09\x09" } },
    .{ "GetRawInputDeviceInfoA", MethodRecord{ .library = "USER32", .import = "GetRawInputDeviceInfoA", .signature = "\x00\x04\x09\x11\x80\x85\x11\xa6\x51\x0f\x01\x0f\x09" } },
    .{ "GetRawInputDeviceInfoW", MethodRecord{ .library = "USER32", .import = "GetRawInputDeviceInfoW", .signature = "\x00\x04\x09\x11\x80\x85\x11\xa6\x51\x0f\x01\x0f\x09" } },
    .{ "GetRawInputBuffer", MethodRecord{ .library = "USER32", .import = "GetRawInputBuffer", .signature = "\x00\x03\x09\x0f\x11\xc0\x00\xea\x71\x0f\x09\x09" } },
    .{ "RegisterRawInputDevices", MethodRecord{ .library = "USER32", .import = "RegisterRawInputDevices", .signature = "\x00\x03\x11\x59\x0f\x11\xc0\x01\xfb\x5c\x09\x09" } },
    .{ "GetRegisteredRawInputDevices", MethodRecord{ .library = "USER32", .import = "GetRegisteredRawInputDevices", .signature = "\x00\x03\x09\x0f\x11\xc0\x01\xfb\x5c\x0f\x09\x09" } },
    .{ "GetRawInputDeviceList", MethodRecord{ .library = "USER32", .import = "GetRawInputDeviceList", .signature = "\x00\x03\x09\x0f\x11\xc0\x01\xfb\x60\x0f\x09\x09" } },
    .{ "DefRawInputProc", MethodRecord{ .library = "USER32", .import = "DefRawInputProc", .signature = "\x00\x03\x11\x82\x35\x0f\x0f\x11\xc0\x00\xea\x71\x08\x09" } },
    .{ "GetCurrentInputMessageSource", MethodRecord{ .library = "USER32", .import = "GetCurrentInputMessageSource", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x01\xfb\x6c" } },
    .{ "GetCIMSSM", MethodRecord{ .library = "USER32", .import = "GetCIMSSM", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x01\xfb\x6c" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x235 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LRESULT" },
        0x264d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input", .name = "RAW_INPUT_DATA_COMMAND_FLAGS" },
        0x2651 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input", .name = "RAW_INPUT_DEVICE_INFO_COMMAND" },
        0x2864 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input", .name = "HRAWINPUT" },
        0xea71 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input", .name = "RAWINPUT" },
        0x1fb5c => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input", .name = "RAWINPUTDEVICE" },
        0x1fb60 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input", .name = "RAWINPUTDEVICELIST" },
        0x1fb6c => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input", .name = "INPUT_MESSAGE_SOURCE" },
        else => null,
    };
}

pub const RID_HEADER = 268435461;
pub const RID_INPUT = 268435459;
pub const RIDI_PREPARSEDDATA = 536870917;
pub const RIDI_DEVICENAME = 536870919;
pub const RIDI_DEVICEINFO = 536870923;
pub const RIM_TYPEMOUSE = 0;
pub const RIM_TYPEKEYBOARD = 1;
pub const RIM_TYPEHID = 2;
pub const RIDEV_REMOVE = 1;
pub const RIDEV_EXCLUDE = 16;
pub const RIDEV_PAGEONLY = 32;
pub const RIDEV_NOLEGACY = 48;
pub const RIDEV_INPUTSINK = 256;
pub const RIDEV_CAPTUREMOUSE = 512;
pub const RIDEV_NOHOTKEYS = 512;
pub const RIDEV_APPKEYS = 1024;
pub const RIDEV_EXINPUTSINK = 4096;
pub const RIDEV_DEVNOTIFY = 8192;
pub const MOUSE_MOVE_RELATIVE = 0;
pub const MOUSE_MOVE_ABSOLUTE = 1;
pub const MOUSE_VIRTUAL_DESKTOP = 2;
pub const MOUSE_ATTRIBUTES_CHANGED = 4;
pub const MOUSE_MOVE_NOCOALESCE = 8;
pub const IMDT_UNAVAILABLE = 0;
pub const IMDT_KEYBOARD = 1;
pub const IMDT_MOUSE = 2;
pub const IMDT_TOUCH = 4;
pub const IMDT_PEN = 8;
pub const IMDT_TOUCHPAD = 16;
pub const IMO_UNAVAILABLE = 0;
pub const IMO_HARDWARE = 1;
pub const IMO_INJECTED = 2;
pub const IMO_SYSTEM = 4;

pub const aliases = struct {
    pub const RAW_INPUT_DATA_COMMAND_FLAGS = u32;
    pub const RAW_INPUT_DEVICE_INFO_COMMAND = u32;
    pub const RID_DEVICE_INFO_TYPE = u32;
    pub const RAWINPUTDEVICE_FLAGS = u32;
    pub const MOUSE_STATE = u16;
    pub const INPUT_MESSAGE_DEVICE_TYPE = i32;
    pub const INPUT_MESSAGE_ORIGIN_ID = i32;
};
