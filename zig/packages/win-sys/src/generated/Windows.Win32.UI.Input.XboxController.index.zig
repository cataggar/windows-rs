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
    .{ "XInputGetState", MethodRecord{ .library = "xinput1_4", .import = "XInputGetState", .signature = "\x00\x02\x09\x09\x0f\x11\xc0\x00\x47\x75" } },
    .{ "XInputSetState", MethodRecord{ .library = "xinput1_4", .import = "XInputSetState", .signature = "\x00\x02\x09\x09\x0f\x11\xc0\x00\x47\x79" } },
    .{ "XInputGetCapabilities", MethodRecord{ .library = "xinput1_4", .import = "XInputGetCapabilities", .signature = "\x00\x03\x09\x09\x11\xa6\xed\x0f\x11\xc0\x00\x47\x7d" } },
    .{ "XInputEnable", MethodRecord{ .library = "xinput1_4", .import = "XInputEnable", .signature = "\x00\x01\x01\x11\x59" } },
    .{ "XInputGetAudioDeviceIds", MethodRecord{ .library = "xinput1_4", .import = "XInputGetAudioDeviceIds", .signature = "\x00\x05\x09\x09\x11\x05\x0f\x09\x11\x05\x0f\x09" } },
    .{ "XInputGetBatteryInformation", MethodRecord{ .library = "xinput1_4", .import = "XInputGetBatteryInformation", .signature = "\x00\x03\x09\x09\x11\xa6\xd5\x0f\x11\xc0\x00\x47\x81" } },
    .{ "XInputGetKeystroke", MethodRecord{ .library = "xinput1_4", .import = "XInputGetKeystroke", .signature = "\x00\x03\x09\x09\x09\x0f\x11\xc0\x00\x47\x85" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x26d5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.XboxController", .name = "BATTERY_DEVTYPE" },
        0x26ed => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.XboxController", .name = "XINPUT_FLAG" },
        0x4775 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.XboxController", .name = "XINPUT_STATE" },
        0x4779 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.XboxController", .name = "XINPUT_VIBRATION" },
        0x477d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.XboxController", .name = "XINPUT_CAPABILITIES" },
        0x4781 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.XboxController", .name = "XINPUT_BATTERY_INFORMATION" },
        0x4785 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.XboxController", .name = "XINPUT_KEYSTROKE" },
        else => null,
    };
}

pub const VK_PAD_A = 22528;
pub const VK_PAD_B = 22529;
pub const VK_PAD_X = 22530;
pub const VK_PAD_Y = 22531;
pub const VK_PAD_RSHOULDER = 22532;
pub const VK_PAD_LSHOULDER = 22533;
pub const VK_PAD_LTRIGGER = 22534;
pub const VK_PAD_RTRIGGER = 22535;
pub const VK_PAD_DPAD_UP = 22544;
pub const VK_PAD_DPAD_DOWN = 22545;
pub const VK_PAD_DPAD_LEFT = 22546;
pub const VK_PAD_DPAD_RIGHT = 22547;
pub const VK_PAD_START = 22548;
pub const VK_PAD_BACK = 22549;
pub const VK_PAD_LTHUMB_PRESS = 22550;
pub const VK_PAD_RTHUMB_PRESS = 22551;
pub const VK_PAD_LTHUMB_UP = 22560;
pub const VK_PAD_LTHUMB_DOWN = 22561;
pub const VK_PAD_LTHUMB_RIGHT = 22562;
pub const VK_PAD_LTHUMB_LEFT = 22563;
pub const VK_PAD_LTHUMB_UPLEFT = 22564;
pub const VK_PAD_LTHUMB_UPRIGHT = 22565;
pub const VK_PAD_LTHUMB_DOWNRIGHT = 22566;
pub const VK_PAD_LTHUMB_DOWNLEFT = 22567;
pub const VK_PAD_RTHUMB_UP = 22576;
pub const VK_PAD_RTHUMB_DOWN = 22577;
pub const VK_PAD_RTHUMB_RIGHT = 22578;
pub const VK_PAD_RTHUMB_LEFT = 22579;
pub const VK_PAD_RTHUMB_UPLEFT = 22580;
pub const VK_PAD_RTHUMB_UPRIGHT = 22581;
pub const VK_PAD_RTHUMB_DOWNRIGHT = 22582;
pub const VK_PAD_RTHUMB_DOWNLEFT = 22583;
pub const BATTERY_TYPE_DISCONNECTED = 0;
pub const BATTERY_TYPE_WIRED = 1;
pub const BATTERY_TYPE_ALKALINE = 2;
pub const BATTERY_TYPE_NIMH = 3;
pub const BATTERY_TYPE_UNKNOWN = 255;
pub const BATTERY_LEVEL_EMPTY = 0;
pub const BATTERY_LEVEL_LOW = 1;
pub const BATTERY_LEVEL_MEDIUM = 2;
pub const BATTERY_LEVEL_FULL = 3;
pub const BATTERY_DEVTYPE_GAMEPAD = 0;
pub const BATTERY_DEVTYPE_HEADSET = 1;
pub const XINPUT_DEVTYPE_GAMEPAD = 1;
pub const XINPUT_DEVSUBTYPE_GAMEPAD = 1;
pub const XINPUT_DEVSUBTYPE_UNKNOWN = 0;
pub const XINPUT_DEVSUBTYPE_WHEEL = 2;
pub const XINPUT_DEVSUBTYPE_ARCADE_STICK = 3;
pub const XINPUT_DEVSUBTYPE_FLIGHT_STICK = 4;
pub const XINPUT_DEVSUBTYPE_DANCE_PAD = 5;
pub const XINPUT_DEVSUBTYPE_GUITAR = 6;
pub const XINPUT_DEVSUBTYPE_GUITAR_ALTERNATE = 7;
pub const XINPUT_DEVSUBTYPE_DRUM_KIT = 8;
pub const XINPUT_DEVSUBTYPE_GUITAR_BASS = 11;
pub const XINPUT_DEVSUBTYPE_ARCADE_PAD = 19;
pub const XINPUT_CAPS_VOICE_SUPPORTED = 4;
pub const XINPUT_CAPS_FFB_SUPPORTED = 1;
pub const XINPUT_CAPS_WIRELESS = 2;
pub const XINPUT_CAPS_PMD_SUPPORTED = 8;
pub const XINPUT_CAPS_NO_NAVIGATION = 16;
pub const XINPUT_GAMEPAD_DPAD_UP = 1;
pub const XINPUT_GAMEPAD_DPAD_DOWN = 2;
pub const XINPUT_GAMEPAD_DPAD_LEFT = 4;
pub const XINPUT_GAMEPAD_DPAD_RIGHT = 8;
pub const XINPUT_GAMEPAD_START = 16;
pub const XINPUT_GAMEPAD_BACK = 32;
pub const XINPUT_GAMEPAD_LEFT_THUMB = 64;
pub const XINPUT_GAMEPAD_RIGHT_THUMB = 128;
pub const XINPUT_GAMEPAD_LEFT_SHOULDER = 256;
pub const XINPUT_GAMEPAD_RIGHT_SHOULDER = 512;
pub const XINPUT_GAMEPAD_A = 4096;
pub const XINPUT_GAMEPAD_B = 8192;
pub const XINPUT_GAMEPAD_X = 16384;
pub const XINPUT_GAMEPAD_Y = 32768;
pub const XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE = 7849;
pub const XINPUT_GAMEPAD_RIGHT_THUMB_DEADZONE = 8689;
pub const XINPUT_GAMEPAD_TRIGGER_THRESHOLD = 30;
pub const XINPUT_KEYSTROKE_KEYDOWN = 1;
pub const XINPUT_KEYSTROKE_KEYUP = 2;
pub const XINPUT_KEYSTROKE_REPEAT = 4;
pub const XINPUT_FLAG_ALL = 0;
pub const XINPUT_FLAG_GAMEPAD = 1;
pub const XUSER_MAX_COUNT = 4;
pub const XUSER_INDEX_ANY = 255;

pub const aliases = struct {
    pub const XINPUT_VIRTUAL_KEY = u16;
    pub const BATTERY_TYPE = u8;
    pub const BATTERY_LEVEL = u8;
    pub const BATTERY_DEVTYPE = u8;
    pub const XINPUT_DEVTYPE = u8;
    pub const XINPUT_DEVSUBTYPE = u8;
    pub const XINPUT_CAPABILITIES_FLAGS = u16;
    pub const XINPUT_GAMEPAD_BUTTON_FLAGS = u16;
    pub const XINPUT_KEYSTROKE_FLAGS = u16;
    pub const XINPUT_FLAG = u32;
};
