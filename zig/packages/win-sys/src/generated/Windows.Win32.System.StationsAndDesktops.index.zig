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
    .{ "CreateDesktopA", MethodRecord{ .library = "USER32", .import = "CreateDesktopA", .signature = "\x00\x06\x11\xa2\x20\x11\x3d\x11\x3d\x0f\x11\x8d\x81\x11\xa2\x95\x09\x0f\x11\x8b\xb5" } },
    .{ "CreateDesktopW", MethodRecord{ .library = "USER32", .import = "CreateDesktopW", .signature = "\x00\x06\x11\xa2\x20\x11\x05\x11\x05\x0f\x11\x8d\x85\x11\xa2\x95\x09\x0f\x11\x8b\xb5" } },
    .{ "CreateDesktopExA", MethodRecord{ .library = "USER32", .import = "CreateDesktopExA", .signature = "\x00\x08\x11\xa2\x20\x11\x3d\x11\x3d\x0f\x11\x8d\x81\x11\xa2\x95\x09\x0f\x11\x8b\xb5\x09\x0f\x01" } },
    .{ "CreateDesktopExW", MethodRecord{ .library = "USER32", .import = "CreateDesktopExW", .signature = "\x00\x08\x11\xa2\x20\x11\x05\x11\x05\x0f\x11\x8d\x85\x11\xa2\x95\x09\x0f\x11\x8b\xb5\x09\x0f\x01" } },
    .{ "OpenDesktopA", MethodRecord{ .library = "USER32", .import = "OpenDesktopA", .signature = "\x00\x04\x11\xa2\x20\x11\x3d\x11\xa2\x95\x11\x59\x09" } },
    .{ "OpenDesktopW", MethodRecord{ .library = "USER32", .import = "OpenDesktopW", .signature = "\x00\x04\x11\xa2\x20\x11\x05\x11\xa2\x95\x11\x59\x09" } },
    .{ "OpenInputDesktop", MethodRecord{ .library = "USER32", .import = "OpenInputDesktop", .signature = "\x00\x03\x11\xa2\x20\x11\xa2\x95\x11\x59\x11\xa2\x99" } },
    .{ "EnumDesktopsA", MethodRecord{ .library = "USER32", .import = "EnumDesktopsA", .signature = "\x00\x03\x11\x59\x11\xa1\xdc\x12\x96\x98\x11\x82\x2d" } },
    .{ "EnumDesktopsW", MethodRecord{ .library = "USER32", .import = "EnumDesktopsW", .signature = "\x00\x03\x11\x59\x11\xa1\xdc\x12\x96\x9c\x11\x82\x2d" } },
    .{ "EnumDesktopWindows", MethodRecord{ .library = "USER32", .import = "EnumDesktopWindows", .signature = "\x00\x03\x11\x59\x11\xa2\x20\x12\xc0\x00\x48\x21\x11\x82\x2d" } },
    .{ "SwitchDesktop", MethodRecord{ .library = "USER32", .import = "SwitchDesktop", .signature = "\x00\x01\x11\x59\x11\xa2\x20" } },
    .{ "SetThreadDesktop", MethodRecord{ .library = "USER32", .import = "SetThreadDesktop", .signature = "\x00\x01\x11\x59\x11\xa2\x20" } },
    .{ "CloseDesktop", MethodRecord{ .library = "USER32", .import = "CloseDesktop", .signature = "\x00\x01\x11\x59\x11\xa2\x20" } },
    .{ "GetThreadDesktop", MethodRecord{ .library = "USER32", .import = "GetThreadDesktop", .signature = "\x00\x01\x11\xa2\x20\x09" } },
    .{ "CreateWindowStationA", MethodRecord{ .library = "USER32", .import = "CreateWindowStationA", .signature = "\x00\x04\x11\xa1\xdc\x11\x3d\x09\x09\x0f\x11\x8b\xb5" } },
    .{ "CreateWindowStationW", MethodRecord{ .library = "USER32", .import = "CreateWindowStationW", .signature = "\x00\x04\x11\xa1\xdc\x11\x05\x09\x09\x0f\x11\x8b\xb5" } },
    .{ "OpenWindowStationA", MethodRecord{ .library = "USER32", .import = "OpenWindowStationA", .signature = "\x00\x03\x11\xa1\xdc\x11\x3d\x11\x59\x09" } },
    .{ "OpenWindowStationW", MethodRecord{ .library = "USER32", .import = "OpenWindowStationW", .signature = "\x00\x03\x11\xa1\xdc\x11\x05\x11\x59\x09" } },
    .{ "EnumWindowStationsA", MethodRecord{ .library = "USER32", .import = "EnumWindowStationsA", .signature = "\x00\x02\x11\x59\x12\x96\x90\x11\x82\x2d" } },
    .{ "EnumWindowStationsW", MethodRecord{ .library = "USER32", .import = "EnumWindowStationsW", .signature = "\x00\x02\x11\x59\x12\x96\x94\x11\x82\x2d" } },
    .{ "CloseWindowStation", MethodRecord{ .library = "USER32", .import = "CloseWindowStation", .signature = "\x00\x01\x11\x59\x11\xa1\xdc" } },
    .{ "SetProcessWindowStation", MethodRecord{ .library = "USER32", .import = "SetProcessWindowStation", .signature = "\x00\x01\x11\x59\x11\xa1\xdc" } },
    .{ "GetProcessWindowStation", MethodRecord{ .library = "USER32", .import = "GetProcessWindowStation", .signature = "\x00\x00\x11\xa1\xdc" } },
    .{ "GetUserObjectInformationA", MethodRecord{ .library = "USER32", .import = "GetUserObjectInformationA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\xa2\x91\x0f\x01\x09\x0f\x09" } },
    .{ "GetUserObjectInformationW", MethodRecord{ .library = "USER32", .import = "GetUserObjectInformationW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\xa2\x91\x0f\x01\x09\x0f\x09" } },
    .{ "SetUserObjectInformationA", MethodRecord{ .library = "USER32", .import = "SetUserObjectInformationA", .signature = "\x00\x04\x11\x59\x11\x80\x85\x08\x0f\x01\x09" } },
    .{ "SetUserObjectInformationW", MethodRecord{ .library = "USER32", .import = "SetUserObjectInformationW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x08\x0f\x01\x09" } },
    .{ "BroadcastSystemMessageExA", MethodRecord{ .library = "USER32", .import = "BroadcastSystemMessageExA", .signature = "\x00\x06\x08\x11\xa2\x89\x0f\x11\xa2\x8d\x09\x11\x83\x8d\x11\x82\x2d\x0f\x11\xc0\x01\xfa\x78" } },
    .{ "BroadcastSystemMessageExW", MethodRecord{ .library = "USER32", .import = "BroadcastSystemMessageExW", .signature = "\x00\x06\x08\x11\xa2\x89\x0f\x11\xa2\x8d\x09\x11\x83\x8d\x11\x82\x2d\x0f\x11\xc0\x01\xfa\x78" } },
    .{ "BroadcastSystemMessageA", MethodRecord{ .library = "USER32", .import = "BroadcastSystemMessageA", .signature = "\x00\x05\x08\x09\x0f\x09\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "BroadcastSystemMessageW", MethodRecord{ .library = "USER32", .import = "BroadcastSystemMessageW", .signature = "\x00\x05\x08\x11\xa2\x89\x0f\x11\xa2\x8d\x09\x11\x83\x8d\x11\x82\x2d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x38d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WPARAM" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0xd81 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DEVMODEA" },
        0xd85 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DEVMODEW" },
        0x1690 => TypeRefEntry{ .namespace = "Windows.Win32.System.StationsAndDesktops", .name = "WINSTAENUMPROCA" },
        0x1694 => TypeRefEntry{ .namespace = "Windows.Win32.System.StationsAndDesktops", .name = "WINSTAENUMPROCW" },
        0x1698 => TypeRefEntry{ .namespace = "Windows.Win32.System.StationsAndDesktops", .name = "DESKTOPENUMPROCA" },
        0x169c => TypeRefEntry{ .namespace = "Windows.Win32.System.StationsAndDesktops", .name = "DESKTOPENUMPROCW" },
        0x21dc => TypeRefEntry{ .namespace = "Windows.Win32.System.StationsAndDesktops", .name = "HWINSTA" },
        0x2220 => TypeRefEntry{ .namespace = "Windows.Win32.System.StationsAndDesktops", .name = "HDESK" },
        0x2289 => TypeRefEntry{ .namespace = "Windows.Win32.System.StationsAndDesktops", .name = "BROADCAST_SYSTEM_MESSAGE_FLAGS" },
        0x228d => TypeRefEntry{ .namespace = "Windows.Win32.System.StationsAndDesktops", .name = "BROADCAST_SYSTEM_MESSAGE_INFO" },
        0x2291 => TypeRefEntry{ .namespace = "Windows.Win32.System.StationsAndDesktops", .name = "USER_OBJECT_INFORMATION_INDEX" },
        0x2295 => TypeRefEntry{ .namespace = "Windows.Win32.System.StationsAndDesktops", .name = "DESKTOP_CONTROL_FLAGS" },
        0x2299 => TypeRefEntry{ .namespace = "Windows.Win32.System.StationsAndDesktops", .name = "DESKTOP_ACCESS_FLAGS" },
        0x4821 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WNDENUMPROC" },
        0x1fa78 => TypeRefEntry{ .namespace = "Windows.Win32.System.StationsAndDesktops", .name = "BSMINFO" },
        else => null,
    };
}

pub const BSF_ALLOWSFW = 128;
pub const BSF_FLUSHDISK = 4;
pub const BSF_FORCEIFHUNG = 32;
pub const BSF_IGNORECURRENTTASK = 2;
pub const BSF_NOHANG = 8;
pub const BSF_NOTIMEOUTIFNOTHUNG = 64;
pub const BSF_POSTMESSAGE = 16;
pub const BSF_QUERY = 1;
pub const BSF_SENDNOTIFYMESSAGE = 256;
pub const BSF_LUID = 1024;
pub const BSF_RETURNHDESK = 512;
pub const BSM_ALLCOMPONENTS = 0;
pub const BSM_ALLDESKTOPS = 16;
pub const BSM_APPLICATIONS = 8;
pub const UOI_FLAGS = 1;
pub const UOI_HEAPSIZE = 5;
pub const UOI_IO = 6;
pub const UOI_NAME = 2;
pub const UOI_TYPE = 3;
pub const UOI_USER_SID = 4;
pub const DF_ALLOWOTHERACCOUNTHOOK = 1;
pub const DESKTOP_DELETE = 65536;
pub const DESKTOP_READ_CONTROL = 131072;
pub const DESKTOP_WRITE_DAC = 262144;
pub const DESKTOP_WRITE_OWNER = 524288;
pub const DESKTOP_SYNCHRONIZE = 1048576;
pub const DESKTOP_READOBJECTS = 1;
pub const DESKTOP_CREATEWINDOW = 2;
pub const DESKTOP_CREATEMENU = 4;
pub const DESKTOP_HOOKCONTROL = 8;
pub const DESKTOP_JOURNALRECORD = 16;
pub const DESKTOP_JOURNALPLAYBACK = 32;
pub const DESKTOP_ENUMERATE = 64;
pub const DESKTOP_WRITEOBJECTS = 128;
pub const DESKTOP_SWITCHDESKTOP = 256;

pub const aliases = struct {
    pub const BROADCAST_SYSTEM_MESSAGE_FLAGS = u32;
    pub const BROADCAST_SYSTEM_MESSAGE_INFO = u32;
    pub const USER_OBJECT_INFORMATION_INDEX = i32;
    pub const DESKTOP_CONTROL_FLAGS = u32;
    pub const DESKTOP_ACCESS_FLAGS = u32;
    pub const HWINSTA = ?*anyopaque;
    pub const HDESK = ?*anyopaque;
};
