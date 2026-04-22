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
    .{ "_TrackMouseEvent", MethodRecord{ .library = "COMCTL32", .import = "_TrackMouseEvent", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x47\x65" } },
    .{ "LoadKeyboardLayoutA", MethodRecord{ .library = "USER32", .import = "LoadKeyboardLayoutA", .signature = "\x00\x02\x11\xc0\x00\x47\x2d\x11\x3d\x11\xa6\x91" } },
    .{ "LoadKeyboardLayoutW", MethodRecord{ .library = "USER32", .import = "LoadKeyboardLayoutW", .signature = "\x00\x02\x11\xc0\x00\x47\x2d\x11\x05\x11\xa6\x91" } },
    .{ "ActivateKeyboardLayout", MethodRecord{ .library = "USER32", .import = "ActivateKeyboardLayout", .signature = "\x00\x02\x11\xc0\x00\x47\x2d\x11\xc0\x00\x47\x2d\x11\xa6\x91" } },
    .{ "ToUnicodeEx", MethodRecord{ .library = "USER32", .import = "ToUnicodeEx", .signature = "\x00\x07\x08\x09\x09\x0f\x05\x11\x05\x08\x09\x11\xc0\x00\x47\x2d" } },
    .{ "UnloadKeyboardLayout", MethodRecord{ .library = "USER32", .import = "UnloadKeyboardLayout", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x47\x2d" } },
    .{ "GetKeyboardLayoutNameA", MethodRecord{ .library = "USER32", .import = "GetKeyboardLayoutNameA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "GetKeyboardLayoutNameW", MethodRecord{ .library = "USER32", .import = "GetKeyboardLayoutNameW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "GetKeyboardLayoutList", MethodRecord{ .library = "USER32", .import = "GetKeyboardLayoutList", .signature = "\x00\x02\x08\x08\x0f\x11\xc0\x00\x47\x2d" } },
    .{ "GetKeyboardLayout", MethodRecord{ .library = "USER32", .import = "GetKeyboardLayout", .signature = "\x00\x01\x11\xc0\x00\x47\x2d\x09" } },
    .{ "GetMouseMovePointsEx", MethodRecord{ .library = "USER32", .import = "GetMouseMovePointsEx", .signature = "\x00\x05\x08\x09\x0f\x11\xc0\x00\x47\x69\x0f\x11\xc0\x00\x47\x69\x08\x11\xa6\x95" } },
    .{ "TrackMouseEvent", MethodRecord{ .library = "USER32", .import = "TrackMouseEvent", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x47\x65" } },
    .{ "RegisterHotKey", MethodRecord{ .library = "USER32", .import = "RegisterHotKey", .signature = "\x00\x04\x11\x59\x11\x25\x08\x11\xa6\x8d\x09" } },
    .{ "UnregisterHotKey", MethodRecord{ .library = "USER32", .import = "UnregisterHotKey", .signature = "\x00\x02\x11\x59\x11\x25\x08" } },
    .{ "SwapMouseButton", MethodRecord{ .library = "USER32", .import = "SwapMouseButton", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "GetDoubleClickTime", MethodRecord{ .library = "USER32", .import = "GetDoubleClickTime", .signature = "\x00\x00\x09" } },
    .{ "SetDoubleClickTime", MethodRecord{ .library = "USER32", .import = "SetDoubleClickTime", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "SetFocus", MethodRecord{ .library = "USER32", .import = "SetFocus", .signature = "\x00\x01\x11\x25\x11\x25" } },
    .{ "GetActiveWindow", MethodRecord{ .library = "USER32", .import = "GetActiveWindow", .signature = "\x00\x00\x11\x25" } },
    .{ "GetFocus", MethodRecord{ .library = "USER32", .import = "GetFocus", .signature = "\x00\x00\x11\x25" } },
    .{ "GetKBCodePage", MethodRecord{ .library = "USER32", .import = "GetKBCodePage", .signature = "\x00\x00\x09" } },
    .{ "GetKeyState", MethodRecord{ .library = "USER32", .import = "GetKeyState", .signature = "\x00\x01\x06\x08" } },
    .{ "GetAsyncKeyState", MethodRecord{ .library = "USER32", .import = "GetAsyncKeyState", .signature = "\x00\x01\x06\x08" } },
    .{ "GetKeyboardState", MethodRecord{ .library = "USER32", .import = "GetKeyboardState", .signature = "\x00\x01\x11\x59\x0f\x05" } },
    .{ "SetKeyboardState", MethodRecord{ .library = "USER32", .import = "SetKeyboardState", .signature = "\x00\x01\x11\x59\x0f\x05" } },
    .{ "GetKeyNameTextA", MethodRecord{ .library = "USER32", .import = "GetKeyNameTextA", .signature = "\x00\x03\x08\x08\x11\x3d\x08" } },
    .{ "GetKeyNameTextW", MethodRecord{ .library = "USER32", .import = "GetKeyNameTextW", .signature = "\x00\x03\x08\x08\x11\x05\x08" } },
    .{ "GetKeyboardType", MethodRecord{ .library = "USER32", .import = "GetKeyboardType", .signature = "\x00\x01\x08\x08" } },
    .{ "ToAscii", MethodRecord{ .library = "USER32", .import = "ToAscii", .signature = "\x00\x05\x08\x09\x09\x0f\x05\x0f\x07\x09" } },
    .{ "ToAsciiEx", MethodRecord{ .library = "USER32", .import = "ToAsciiEx", .signature = "\x00\x06\x08\x09\x09\x0f\x05\x0f\x07\x09\x11\xc0\x00\x47\x2d" } },
    .{ "ToUnicode", MethodRecord{ .library = "USER32", .import = "ToUnicode", .signature = "\x00\x06\x08\x09\x09\x0f\x05\x11\x05\x08\x09" } },
    .{ "OemKeyScan", MethodRecord{ .library = "USER32", .import = "OemKeyScan", .signature = "\x00\x01\x09\x07" } },
    .{ "VkKeyScanA", MethodRecord{ .library = "USER32", .import = "VkKeyScanA", .signature = "\x00\x01\x06\x11\x8d\x5d" } },
    .{ "VkKeyScanW", MethodRecord{ .library = "USER32", .import = "VkKeyScanW", .signature = "\x00\x01\x06\x03" } },
    .{ "VkKeyScanExA", MethodRecord{ .library = "USER32", .import = "VkKeyScanExA", .signature = "\x00\x02\x06\x11\x8d\x5d\x11\xc0\x00\x47\x2d" } },
    .{ "VkKeyScanExW", MethodRecord{ .library = "USER32", .import = "VkKeyScanExW", .signature = "\x00\x02\x06\x03\x11\xc0\x00\x47\x2d" } },
    .{ "keybd_event", MethodRecord{ .library = "USER32", .import = "keybd_event", .signature = "\x00\x04\x01\x05\x05\x11\xa6\x99\x19" } },
    .{ "mouse_event", MethodRecord{ .library = "USER32", .import = "mouse_event", .signature = "\x00\x05\x01\x11\xa6\x9d\x08\x08\x08\x19" } },
    .{ "SendInput", MethodRecord{ .library = "USER32", .import = "SendInput", .signature = "\x00\x03\x09\x09\x0f\x11\xc0\x00\x47\x6d\x08" } },
    .{ "GetLastInputInfo", MethodRecord{ .library = "USER32", .import = "GetLastInputInfo", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x47\x71" } },
    .{ "MapVirtualKeyA", MethodRecord{ .library = "USER32", .import = "MapVirtualKeyA", .signature = "\x00\x02\x09\x09\x11\xa6\xad" } },
    .{ "MapVirtualKeyW", MethodRecord{ .library = "USER32", .import = "MapVirtualKeyW", .signature = "\x00\x02\x09\x09\x11\xa6\xad" } },
    .{ "MapVirtualKeyExA", MethodRecord{ .library = "USER32", .import = "MapVirtualKeyExA", .signature = "\x00\x03\x09\x09\x11\xa6\xad\x11\xc0\x00\x47\x2d" } },
    .{ "MapVirtualKeyExW", MethodRecord{ .library = "USER32", .import = "MapVirtualKeyExW", .signature = "\x00\x03\x09\x09\x11\xa6\xad\x11\xc0\x00\x47\x2d" } },
    .{ "GetCapture", MethodRecord{ .library = "USER32", .import = "GetCapture", .signature = "\x00\x00\x11\x25" } },
    .{ "SetCapture", MethodRecord{ .library = "USER32", .import = "SetCapture", .signature = "\x00\x01\x11\x25\x11\x25" } },
    .{ "ReleaseCapture", MethodRecord{ .library = "USER32", .import = "ReleaseCapture", .signature = "\x00\x00\x11\x59" } },
    .{ "EnableWindow", MethodRecord{ .library = "USER32", .import = "EnableWindow", .signature = "\x00\x02\x11\x59\x11\x25\x11\x59" } },
    .{ "IsWindowEnabled", MethodRecord{ .library = "USER32", .import = "IsWindowEnabled", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "DragDetect", MethodRecord{ .library = "USER32", .import = "DragDetect", .signature = "\x00\x02\x11\x59\x11\x25\x11\x83\x71" } },
    .{ "SetActiveWindow", MethodRecord{ .library = "USER32", .import = "SetActiveWindow", .signature = "\x00\x01\x11\x25\x11\x25" } },
    .{ "BlockInput", MethodRecord{ .library = "USER32", .import = "BlockInput", .signature = "\x00\x01\x11\x59\x11\x59" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x371 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "POINT" },
        0xd5d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "CHAR" },
        0x268d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.KeyboardAndMouse", .name = "HOT_KEY_MODIFIERS" },
        0x2691 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.KeyboardAndMouse", .name = "ACTIVATE_KEYBOARD_LAYOUT_FLAGS" },
        0x2695 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.KeyboardAndMouse", .name = "GET_MOUSE_MOVE_POINTS_EX_RESOLUTION" },
        0x2699 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.KeyboardAndMouse", .name = "KEYBD_EVENT_FLAGS" },
        0x269d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.KeyboardAndMouse", .name = "MOUSE_EVENT_FLAGS" },
        0x26ad => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.KeyboardAndMouse", .name = "MAP_VIRTUAL_KEY_TYPE" },
        0x472d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.KeyboardAndMouse", .name = "HKL" },
        0x4765 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.KeyboardAndMouse", .name = "TRACKMOUSEEVENT" },
        0x4769 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.KeyboardAndMouse", .name = "MOUSEMOVEPOINT" },
        0x476d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.KeyboardAndMouse", .name = "INPUT" },
        0x4771 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.KeyboardAndMouse", .name = "LASTINPUTINFO" },
        else => null,
    };
}

pub const MOD_ALT = 1;
pub const MOD_CONTROL = 2;
pub const MOD_NOREPEAT = 16384;
pub const MOD_SHIFT = 4;
pub const MOD_WIN = 8;
pub const KLF_REORDER = 8;
pub const KLF_RESET = 1073741824;
pub const KLF_SETFORPROCESS = 256;
pub const KLF_SHIFTLOCK = 65536;
pub const KLF_ACTIVATE = 1;
pub const KLF_NOTELLSHELL = 128;
pub const KLF_REPLACELANG = 16;
pub const KLF_SUBSTITUTE_OK = 2;
pub const GMMP_USE_DISPLAY_POINTS = 1;
pub const GMMP_USE_HIGH_RESOLUTION_POINTS = 2;
pub const KEYEVENTF_EXTENDEDKEY = 1;
pub const KEYEVENTF_KEYUP = 2;
pub const KEYEVENTF_SCANCODE = 8;
pub const KEYEVENTF_UNICODE = 4;
pub const MOUSEEVENTF_ABSOLUTE = 32768;
pub const MOUSEEVENTF_LEFTDOWN = 2;
pub const MOUSEEVENTF_LEFTUP = 4;
pub const MOUSEEVENTF_MIDDLEDOWN = 32;
pub const MOUSEEVENTF_MIDDLEUP = 64;
pub const MOUSEEVENTF_MOVE = 1;
pub const MOUSEEVENTF_RIGHTDOWN = 8;
pub const MOUSEEVENTF_RIGHTUP = 16;
pub const MOUSEEVENTF_WHEEL = 2048;
pub const MOUSEEVENTF_XDOWN = 128;
pub const MOUSEEVENTF_XUP = 256;
pub const MOUSEEVENTF_HWHEEL = 4096;
pub const MOUSEEVENTF_MOVE_NOCOALESCE = 8192;
pub const MOUSEEVENTF_VIRTUALDESK = 16384;
pub const INPUT_MOUSE = 0;
pub const INPUT_KEYBOARD = 1;
pub const INPUT_HARDWARE = 2;
pub const TME_CANCEL = 2147483648;
pub const TME_HOVER = 1;
pub const TME_LEAVE = 2;
pub const TME_NONCLIENT = 16;
pub const TME_QUERY = 1073741824;
pub const VK_0 = 48;
pub const VK_1 = 49;
pub const VK_2 = 50;
pub const VK_3 = 51;
pub const VK_4 = 52;
pub const VK_5 = 53;
pub const VK_6 = 54;
pub const VK_7 = 55;
pub const VK_8 = 56;
pub const VK_9 = 57;
pub const VK_A = 65;
pub const VK_B = 66;
pub const VK_C = 67;
pub const VK_D = 68;
pub const VK_E = 69;
pub const VK_F = 70;
pub const VK_G = 71;
pub const VK_H = 72;
pub const VK_I = 73;
pub const VK_J = 74;
pub const VK_K = 75;
pub const VK_L = 76;
pub const VK_M = 77;
pub const VK_N = 78;
pub const VK_O = 79;
pub const VK_P = 80;
pub const VK_Q = 81;
pub const VK_R = 82;
pub const VK_S = 83;
pub const VK_T = 84;
pub const VK_U = 85;
pub const VK_V = 86;
pub const VK_W = 87;
pub const VK_X = 88;
pub const VK_Y = 89;
pub const VK_Z = 90;
pub const VK_ABNT_C1 = 193;
pub const VK_ABNT_C2 = 194;
pub const VK_DBE_ALPHANUMERIC = 240;
pub const VK_DBE_CODEINPUT = 250;
pub const VK_DBE_DBCSCHAR = 244;
pub const VK_DBE_DETERMINESTRING = 252;
pub const VK_DBE_ENTERDLGCONVERSIONMODE = 253;
pub const VK_DBE_ENTERIMECONFIGMODE = 248;
pub const VK_DBE_ENTERWORDREGISTERMODE = 247;
pub const VK_DBE_FLUSHSTRING = 249;
pub const VK_DBE_HIRAGANA = 242;
pub const VK_DBE_KATAKANA = 241;
pub const VK_DBE_NOCODEINPUT = 251;
pub const VK_DBE_NOROMAN = 246;
pub const VK_DBE_ROMAN = 245;
pub const VK_DBE_SBCSCHAR = 243;
pub const VK__none_ = 255;
pub const VK_LBUTTON = 1;
pub const VK_RBUTTON = 2;
pub const VK_CANCEL = 3;
pub const VK_MBUTTON = 4;
pub const VK_XBUTTON1 = 5;
pub const VK_XBUTTON2 = 6;
pub const VK_BACK = 8;
pub const VK_TAB = 9;
pub const VK_CLEAR = 12;
pub const VK_RETURN = 13;
pub const VK_SHIFT = 16;
pub const VK_CONTROL = 17;
pub const VK_MENU = 18;
pub const VK_PAUSE = 19;
pub const VK_CAPITAL = 20;
pub const VK_KANA = 21;
pub const VK_HANGEUL = 21;
pub const VK_HANGUL = 21;
pub const VK_IME_ON = 22;
pub const VK_JUNJA = 23;
pub const VK_FINAL = 24;
pub const VK_HANJA = 25;
pub const VK_KANJI = 25;
pub const VK_IME_OFF = 26;
pub const VK_ESCAPE = 27;
pub const VK_CONVERT = 28;
pub const VK_NONCONVERT = 29;
pub const VK_ACCEPT = 30;
pub const VK_MODECHANGE = 31;
pub const VK_SPACE = 32;
pub const VK_PRIOR = 33;
pub const VK_NEXT = 34;
pub const VK_END = 35;
pub const VK_HOME = 36;
pub const VK_LEFT = 37;
pub const VK_UP = 38;
pub const VK_RIGHT = 39;
pub const VK_DOWN = 40;
pub const VK_SELECT = 41;
pub const VK_PRINT = 42;
pub const VK_EXECUTE = 43;
pub const VK_SNAPSHOT = 44;
pub const VK_INSERT = 45;
pub const VK_DELETE = 46;
pub const VK_HELP = 47;
pub const VK_LWIN = 91;
pub const VK_RWIN = 92;
pub const VK_APPS = 93;
pub const VK_SLEEP = 95;
pub const VK_NUMPAD0 = 96;
pub const VK_NUMPAD1 = 97;
pub const VK_NUMPAD2 = 98;
pub const VK_NUMPAD3 = 99;
pub const VK_NUMPAD4 = 100;
pub const VK_NUMPAD5 = 101;
pub const VK_NUMPAD6 = 102;
pub const VK_NUMPAD7 = 103;
pub const VK_NUMPAD8 = 104;
pub const VK_NUMPAD9 = 105;
pub const VK_MULTIPLY = 106;
pub const VK_ADD = 107;
pub const VK_SEPARATOR = 108;
pub const VK_SUBTRACT = 109;
pub const VK_DECIMAL = 110;
pub const VK_DIVIDE = 111;
pub const VK_F1 = 112;
pub const VK_F2 = 113;
pub const VK_F3 = 114;
pub const VK_F4 = 115;
pub const VK_F5 = 116;
pub const VK_F6 = 117;
pub const VK_F7 = 118;
pub const VK_F8 = 119;
pub const VK_F9 = 120;
pub const VK_F10 = 121;
pub const VK_F11 = 122;
pub const VK_F12 = 123;
pub const VK_F13 = 124;
pub const VK_F14 = 125;
pub const VK_F15 = 126;
pub const VK_F16 = 127;
pub const VK_F17 = 128;
pub const VK_F18 = 129;
pub const VK_F19 = 130;
pub const VK_F20 = 131;
pub const VK_F21 = 132;
pub const VK_F22 = 133;
pub const VK_F23 = 134;
pub const VK_F24 = 135;
pub const VK_NAVIGATION_VIEW = 136;
pub const VK_NAVIGATION_MENU = 137;
pub const VK_NAVIGATION_UP = 138;
pub const VK_NAVIGATION_DOWN = 139;
pub const VK_NAVIGATION_LEFT = 140;
pub const VK_NAVIGATION_RIGHT = 141;
pub const VK_NAVIGATION_ACCEPT = 142;
pub const VK_NAVIGATION_CANCEL = 143;
pub const VK_NUMLOCK = 144;
pub const VK_SCROLL = 145;
pub const VK_OEM_NEC_EQUAL = 146;
pub const VK_OEM_FJ_JISHO = 146;
pub const VK_OEM_FJ_MASSHOU = 147;
pub const VK_OEM_FJ_TOUROKU = 148;
pub const VK_OEM_FJ_LOYA = 149;
pub const VK_OEM_FJ_ROYA = 150;
pub const VK_LSHIFT = 160;
pub const VK_RSHIFT = 161;
pub const VK_LCONTROL = 162;
pub const VK_RCONTROL = 163;
pub const VK_LMENU = 164;
pub const VK_RMENU = 165;
pub const VK_BROWSER_BACK = 166;
pub const VK_BROWSER_FORWARD = 167;
pub const VK_BROWSER_REFRESH = 168;
pub const VK_BROWSER_STOP = 169;
pub const VK_BROWSER_SEARCH = 170;
pub const VK_BROWSER_FAVORITES = 171;
pub const VK_BROWSER_HOME = 172;
pub const VK_VOLUME_MUTE = 173;
pub const VK_VOLUME_DOWN = 174;
pub const VK_VOLUME_UP = 175;
pub const VK_MEDIA_NEXT_TRACK = 176;
pub const VK_MEDIA_PREV_TRACK = 177;
pub const VK_MEDIA_STOP = 178;
pub const VK_MEDIA_PLAY_PAUSE = 179;
pub const VK_LAUNCH_MAIL = 180;
pub const VK_LAUNCH_MEDIA_SELECT = 181;
pub const VK_LAUNCH_APP1 = 182;
pub const VK_LAUNCH_APP2 = 183;
pub const VK_OEM_1 = 186;
pub const VK_OEM_PLUS = 187;
pub const VK_OEM_COMMA = 188;
pub const VK_OEM_MINUS = 189;
pub const VK_OEM_PERIOD = 190;
pub const VK_OEM_2 = 191;
pub const VK_OEM_3 = 192;
pub const VK_GAMEPAD_A = 195;
pub const VK_GAMEPAD_B = 196;
pub const VK_GAMEPAD_X = 197;
pub const VK_GAMEPAD_Y = 198;
pub const VK_GAMEPAD_RIGHT_SHOULDER = 199;
pub const VK_GAMEPAD_LEFT_SHOULDER = 200;
pub const VK_GAMEPAD_LEFT_TRIGGER = 201;
pub const VK_GAMEPAD_RIGHT_TRIGGER = 202;
pub const VK_GAMEPAD_DPAD_UP = 203;
pub const VK_GAMEPAD_DPAD_DOWN = 204;
pub const VK_GAMEPAD_DPAD_LEFT = 205;
pub const VK_GAMEPAD_DPAD_RIGHT = 206;
pub const VK_GAMEPAD_MENU = 207;
pub const VK_GAMEPAD_VIEW = 208;
pub const VK_GAMEPAD_LEFT_THUMBSTICK_BUTTON = 209;
pub const VK_GAMEPAD_RIGHT_THUMBSTICK_BUTTON = 210;
pub const VK_GAMEPAD_LEFT_THUMBSTICK_UP = 211;
pub const VK_GAMEPAD_LEFT_THUMBSTICK_DOWN = 212;
pub const VK_GAMEPAD_LEFT_THUMBSTICK_RIGHT = 213;
pub const VK_GAMEPAD_LEFT_THUMBSTICK_LEFT = 214;
pub const VK_GAMEPAD_RIGHT_THUMBSTICK_UP = 215;
pub const VK_GAMEPAD_RIGHT_THUMBSTICK_DOWN = 216;
pub const VK_GAMEPAD_RIGHT_THUMBSTICK_RIGHT = 217;
pub const VK_GAMEPAD_RIGHT_THUMBSTICK_LEFT = 218;
pub const VK_OEM_4 = 219;
pub const VK_OEM_5 = 220;
pub const VK_OEM_6 = 221;
pub const VK_OEM_7 = 222;
pub const VK_OEM_8 = 223;
pub const VK_OEM_AX = 225;
pub const VK_OEM_102 = 226;
pub const VK_ICO_HELP = 227;
pub const VK_ICO_00 = 228;
pub const VK_PROCESSKEY = 229;
pub const VK_ICO_CLEAR = 230;
pub const VK_PACKET = 231;
pub const VK_OEM_RESET = 233;
pub const VK_OEM_JUMP = 234;
pub const VK_OEM_PA1 = 235;
pub const VK_OEM_PA2 = 236;
pub const VK_OEM_PA3 = 237;
pub const VK_OEM_WSCTRL = 238;
pub const VK_OEM_CUSEL = 239;
pub const VK_OEM_ATTN = 240;
pub const VK_OEM_FINISH = 241;
pub const VK_OEM_COPY = 242;
pub const VK_OEM_AUTO = 243;
pub const VK_OEM_ENLW = 244;
pub const VK_OEM_BACKTAB = 245;
pub const VK_ATTN = 246;
pub const VK_CRSEL = 247;
pub const VK_EXSEL = 248;
pub const VK_EREOF = 249;
pub const VK_PLAY = 250;
pub const VK_ZOOM = 251;
pub const VK_NONAME = 252;
pub const VK_PA1 = 253;
pub const VK_OEM_CLEAR = 254;
pub const MAPVK_VK_TO_VSC = 0;
pub const MAPVK_VSC_TO_VK = 1;
pub const MAPVK_VK_TO_CHAR = 2;
pub const MAPVK_VSC_TO_VK_EX = 3;
pub const MAPVK_VK_TO_VSC_EX = 4;
pub const EXTENDED_BIT = 16777216;
pub const DONTCARE_BIT = 33554432;
pub const FAKE_KEYSTROKE = 33554432;
pub const KBDBASE = 0;
pub const KBDSHIFT = 1;
pub const KBDCTRL = 2;
pub const KBDALT = 4;
pub const KBDKANA = 8;
pub const KBDROYA = 16;
pub const KBDLOYA = 32;
pub const KBDGRPSELTAP = 128;
pub const GRAVE = 768;
pub const ACUTE = 769;
pub const CIRCUMFLEX = 770;
pub const TILDE = 771;
pub const MACRON = 772;
pub const OVERSCORE = 773;
pub const BREVE = 774;
pub const DOT_ABOVE = 775;
pub const UMLAUT = 776;
pub const DIARESIS = 776;
pub const HOOK_ABOVE = 777;
pub const RING = 778;
pub const DOUBLE_ACUTE = 779;
pub const HACEK = 780;
pub const CEDILLA = 807;
pub const OGONEK = 808;
pub const TONOS = 900;
pub const DIARESIS_TONOS = 901;
pub const SHFT_INVALID = 15;
pub const WCH_NONE = 61440;
pub const WCH_DEAD = 61441;
pub const WCH_LGTR = 61442;
pub const CAPLOK = 1;
pub const SGCAPS = 2;
pub const CAPLOKALTGR = 4;
pub const KANALOK = 8;
pub const GRPSELTAP = 128;
pub const DKF_DEAD = 1;
pub const KBD_VERSION = 1;
pub const KLLF_ALTGR = 1;
pub const KLLF_SHIFTLOCK = 2;
pub const KLLF_LRM_RLM = 4;
pub const KLLF_GLOBAL_ATTRS = 2;
pub const KBDTABLE_MULTI_MAX = 8;
pub const KEYBOARD_TYPE_GENERIC_101 = 4;
pub const KEYBOARD_TYPE_JAPAN = 7;
pub const KEYBOARD_TYPE_KOREA = 8;
pub const KEYBOARD_TYPE_UNKNOWN = 81;
pub const NLSKBD_OEM_MICROSOFT = 0;
pub const NLSKBD_OEM_AX = 1;
pub const NLSKBD_OEM_EPSON = 4;
pub const NLSKBD_OEM_FUJITSU = 5;
pub const NLSKBD_OEM_IBM = 7;
pub const NLSKBD_OEM_MATSUSHITA = 10;
pub const NLSKBD_OEM_NEC = 13;
pub const NLSKBD_OEM_TOSHIBA = 18;
pub const NLSKBD_OEM_DEC = 24;
pub const MICROSOFT_KBD_101_TYPE = 0;
pub const MICROSOFT_KBD_AX_TYPE = 1;
pub const MICROSOFT_KBD_106_TYPE = 2;
pub const MICROSOFT_KBD_002_TYPE = 3;
pub const MICROSOFT_KBD_001_TYPE = 4;
pub const MICROSOFT_KBD_FUNC = 12;
pub const AX_KBD_DESKTOP_TYPE = 1;
pub const FMR_KBD_JIS_TYPE = 0;
pub const FMR_KBD_OASYS_TYPE = 1;
pub const FMV_KBD_OASYS_TYPE = 2;
pub const NEC_KBD_NORMAL_TYPE = 1;
pub const NEC_KBD_N_MODE_TYPE = 2;
pub const NEC_KBD_H_MODE_TYPE = 3;
pub const NEC_KBD_LAPTOP_TYPE = 4;
pub const NEC_KBD_106_TYPE = 5;
pub const TOSHIBA_KBD_DESKTOP_TYPE = 13;
pub const TOSHIBA_KBD_LAPTOP_TYPE = 15;
pub const DEC_KBD_ANSI_LAYOUT_TYPE = 1;
pub const DEC_KBD_JIS_LAYOUT_TYPE = 2;
pub const MICROSOFT_KBD_101A_TYPE = 0;
pub const MICROSOFT_KBD_101B_TYPE = 4;
pub const MICROSOFT_KBD_101C_TYPE = 5;
pub const MICROSOFT_KBD_103_TYPE = 6;
pub const NLSKBD_INFO_SEND_IME_NOTIFICATION = 1;
pub const NLSKBD_INFO_ACCESSIBILITY_KEYMAP = 2;
pub const NLSKBD_INFO_EMURATE_101_KEYBOARD = 16;
pub const NLSKBD_INFO_EMURATE_106_KEYBOARD = 32;
pub const KBDNLS_TYPE_NULL = 0;
pub const KBDNLS_TYPE_NORMAL = 1;
pub const KBDNLS_TYPE_TOGGLE = 2;
pub const KBDNLS_INDEX_NORMAL = 1;
pub const KBDNLS_INDEX_ALT = 2;
pub const KBDNLS_NULL = 0;
pub const KBDNLS_NOEVENT = 1;
pub const KBDNLS_SEND_BASE_VK = 2;
pub const KBDNLS_SEND_PARAM_VK = 3;
pub const KBDNLS_KANALOCK = 4;
pub const KBDNLS_ALPHANUM = 5;
pub const KBDNLS_HIRAGANA = 6;
pub const KBDNLS_KATAKANA = 7;
pub const KBDNLS_SBCSDBCS = 8;
pub const KBDNLS_ROMAN = 9;
pub const KBDNLS_CODEINPUT = 10;
pub const KBDNLS_HELP_OR_END = 11;
pub const KBDNLS_HOME_OR_CLEAR = 12;
pub const KBDNLS_NUMPAD = 13;
pub const KBDNLS_KANAEVENT = 14;
pub const KBDNLS_CONV_OR_NONCONV = 15;
pub const KBD_TYPE = 4;
pub const SCANCODE_LSHIFT = 42;
pub const SCANCODE_RSHIFT = 54;
pub const SCANCODE_CTRL = 29;
pub const SCANCODE_ALT = 56;
pub const SCANCODE_NUMPAD_FIRST = 71;
pub const SCANCODE_NUMPAD_LAST = 82;
pub const SCANCODE_LWIN = 91;
pub const SCANCODE_RWIN = 92;
pub const SCANCODE_THAI_LAYOUT_TOGGLE = 41;

pub const aliases = struct {
    pub const HOT_KEY_MODIFIERS = u32;
    pub const ACTIVATE_KEYBOARD_LAYOUT_FLAGS = u32;
    pub const GET_MOUSE_MOVE_POINTS_EX_RESOLUTION = u32;
    pub const KEYBD_EVENT_FLAGS = u32;
    pub const MOUSE_EVENT_FLAGS = u32;
    pub const INPUT_TYPE = u32;
    pub const TRACKMOUSEEVENT_FLAGS = u32;
    pub const VIRTUAL_KEY = u16;
    pub const MAP_VIRTUAL_KEY_TYPE = u32;
    pub const HKL = ?*anyopaque;
};
