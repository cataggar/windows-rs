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
    .{ "OpenThemeDataForDpi", MethodRecord{ .library = "UxTheme", .import = "OpenThemeDataForDpi", .signature = "\x00\x03\x11\x83\xc5\x11\x25\x11\x05\x09" } },
    .{ "SetDialogControlDpiChangeBehavior", MethodRecord{ .library = "USER32", .import = "SetDialogControlDpiChangeBehavior", .signature = "\x00\x03\x11\x59\x11\x25\x11\x93\x35\x11\x93\x35" } },
    .{ "GetDialogControlDpiChangeBehavior", MethodRecord{ .library = "USER32", .import = "GetDialogControlDpiChangeBehavior", .signature = "\x00\x01\x11\x93\x35\x11\x25" } },
    .{ "SetDialogDpiChangeBehavior", MethodRecord{ .library = "USER32", .import = "SetDialogDpiChangeBehavior", .signature = "\x00\x03\x11\x59\x11\x25\x11\x93\x39\x11\x93\x39" } },
    .{ "GetDialogDpiChangeBehavior", MethodRecord{ .library = "USER32", .import = "GetDialogDpiChangeBehavior", .signature = "\x00\x01\x11\x93\x39\x11\x25" } },
    .{ "GetSystemMetricsForDpi", MethodRecord{ .library = "USER32", .import = "GetSystemMetricsForDpi", .signature = "\x00\x02\x08\x11\x93\x3d\x09" } },
    .{ "AdjustWindowRectExForDpi", MethodRecord{ .library = "USER32", .import = "AdjustWindowRectExForDpi", .signature = "\x00\x05\x11\x59\x0f\x11\x83\x89\x11\x93\x41\x11\x59\x11\x93\x45\x09" } },
    .{ "LogicalToPhysicalPointForPerMonitorDPI", MethodRecord{ .library = "USER32", .import = "LogicalToPhysicalPointForPerMonitorDPI", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x83\x71" } },
    .{ "PhysicalToLogicalPointForPerMonitorDPI", MethodRecord{ .library = "USER32", .import = "PhysicalToLogicalPointForPerMonitorDPI", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x83\x71" } },
    .{ "SystemParametersInfoForDpi", MethodRecord{ .library = "USER32", .import = "SystemParametersInfoForDpi", .signature = "\x00\x05\x11\x59\x09\x09\x0f\x01\x09\x09" } },
    .{ "SetThreadDpiAwarenessContext", MethodRecord{ .library = "USER32", .import = "SetThreadDpiAwarenessContext", .signature = "\x00\x01\x11\x93\x31\x11\x93\x31" } },
    .{ "GetThreadDpiAwarenessContext", MethodRecord{ .library = "USER32", .import = "GetThreadDpiAwarenessContext", .signature = "\x00\x00\x11\x93\x31" } },
    .{ "GetWindowDpiAwarenessContext", MethodRecord{ .library = "USER32", .import = "GetWindowDpiAwarenessContext", .signature = "\x00\x01\x11\x93\x31\x11\x25" } },
    .{ "GetAwarenessFromDpiAwarenessContext", MethodRecord{ .library = "USER32", .import = "GetAwarenessFromDpiAwarenessContext", .signature = "\x00\x01\x11\x93\x49\x11\x93\x31" } },
    .{ "GetDpiFromDpiAwarenessContext", MethodRecord{ .library = "USER32", .import = "GetDpiFromDpiAwarenessContext", .signature = "\x00\x01\x09\x11\x93\x31" } },
    .{ "AreDpiAwarenessContextsEqual", MethodRecord{ .library = "USER32", .import = "AreDpiAwarenessContextsEqual", .signature = "\x00\x02\x11\x59\x11\x93\x31\x11\x93\x31" } },
    .{ "IsValidDpiAwarenessContext", MethodRecord{ .library = "USER32", .import = "IsValidDpiAwarenessContext", .signature = "\x00\x01\x11\x59\x11\x93\x31" } },
    .{ "GetDpiForWindow", MethodRecord{ .library = "USER32", .import = "GetDpiForWindow", .signature = "\x00\x01\x09\x11\x25" } },
    .{ "GetDpiForSystem", MethodRecord{ .library = "USER32", .import = "GetDpiForSystem", .signature = "\x00\x00\x09" } },
    .{ "GetSystemDpiForProcess", MethodRecord{ .library = "USER32", .import = "GetSystemDpiForProcess", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "EnableNonClientDpiScaling", MethodRecord{ .library = "USER32", .import = "EnableNonClientDpiScaling", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "SetProcessDpiAwarenessContext", MethodRecord{ .library = "USER32", .import = "SetProcessDpiAwarenessContext", .signature = "\x00\x01\x11\x59\x11\x93\x31" } },
    .{ "GetDpiAwarenessContextForProcess", MethodRecord{ .library = "USER32", .import = "GetDpiAwarenessContextForProcess", .signature = "\x00\x01\x11\x93\x31\x11\x80\x85" } },
    .{ "SetThreadDpiHostingBehavior", MethodRecord{ .library = "USER32", .import = "SetThreadDpiHostingBehavior", .signature = "\x00\x01\x11\x93\x4d\x11\x93\x4d" } },
    .{ "GetThreadDpiHostingBehavior", MethodRecord{ .library = "USER32", .import = "GetThreadDpiHostingBehavior", .signature = "\x00\x00\x11\x93\x4d" } },
    .{ "GetWindowDpiHostingBehavior", MethodRecord{ .library = "USER32", .import = "GetWindowDpiHostingBehavior", .signature = "\x00\x01\x11\x93\x4d\x11\x25" } },
    .{ "SetProcessDpiAwareness", MethodRecord{ .library = "api-ms-win-shcore-scaling-l1-1-1", .import = "SetProcessDpiAwareness", .signature = "\x00\x01\x11\x79\x11\x93\x51" } },
    .{ "GetProcessDpiAwareness", MethodRecord{ .library = "api-ms-win-shcore-scaling-l1-1-1", .import = "GetProcessDpiAwareness", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\x93\x51" } },
    .{ "GetDpiForMonitor", MethodRecord{ .library = "api-ms-win-shcore-scaling-l1-1-1", .import = "GetDpiForMonitor", .signature = "\x00\x04\x11\x79\x11\x8e\xed\x11\x93\x55\x0f\x09\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x371 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "POINT" },
        0x389 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "RECT" },
        0x3c5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls", .name = "HTHEME" },
        0xeed => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HMONITOR" },
        0x1331 => TypeRefEntry{ .namespace = "Windows.Win32.UI.HiDpi", .name = "DPI_AWARENESS_CONTEXT" },
        0x1335 => TypeRefEntry{ .namespace = "Windows.Win32.UI.HiDpi", .name = "DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS" },
        0x1339 => TypeRefEntry{ .namespace = "Windows.Win32.UI.HiDpi", .name = "DIALOG_DPI_CHANGE_BEHAVIORS" },
        0x133d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "SYSTEM_METRICS_INDEX" },
        0x1341 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WINDOW_STYLE" },
        0x1345 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "WINDOW_EX_STYLE" },
        0x1349 => TypeRefEntry{ .namespace = "Windows.Win32.UI.HiDpi", .name = "DPI_AWARENESS" },
        0x134d => TypeRefEntry{ .namespace = "Windows.Win32.UI.HiDpi", .name = "DPI_HOSTING_BEHAVIOR" },
        0x1351 => TypeRefEntry{ .namespace = "Windows.Win32.UI.HiDpi", .name = "PROCESS_DPI_AWARENESS" },
        0x1355 => TypeRefEntry{ .namespace = "Windows.Win32.UI.HiDpi", .name = "MONITOR_DPI_TYPE" },
        else => null,
    };
}

pub const DPI_AWARENESS_CONTEXT_UNAWARE = -1;
pub const DPI_AWARENESS_CONTEXT_SYSTEM_AWARE = -2;
pub const DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE = -3;
pub const DPI_AWARENESS_CONTEXT_PER_MONITOR_AWARE_V2 = -4;
pub const DPI_AWARENESS_CONTEXT_UNAWARE_GDISCALED = -5;
pub const DPI_AWARENESS_INVALID = -1;
pub const DPI_AWARENESS_UNAWARE = 0;
pub const DPI_AWARENESS_SYSTEM_AWARE = 1;
pub const DPI_AWARENESS_PER_MONITOR_AWARE = 2;
pub const DPI_HOSTING_BEHAVIOR_INVALID = -1;
pub const DPI_HOSTING_BEHAVIOR_DEFAULT = 0;
pub const DPI_HOSTING_BEHAVIOR_MIXED = 1;
pub const DCDC_DEFAULT = 0;
pub const DCDC_DISABLE_FONT_UPDATE = 1;
pub const DCDC_DISABLE_RELAYOUT = 2;
pub const DDC_DEFAULT = 0;
pub const DDC_DISABLE_ALL = 1;
pub const DDC_DISABLE_RESIZE = 2;
pub const DDC_DISABLE_CONTROL_RELAYOUT = 4;
pub const PROCESS_DPI_UNAWARE = 0;
pub const PROCESS_SYSTEM_DPI_AWARE = 1;
pub const PROCESS_PER_MONITOR_DPI_AWARE = 2;
pub const MDT_EFFECTIVE_DPI = 0;
pub const MDT_ANGULAR_DPI = 1;
pub const MDT_RAW_DPI = 2;
pub const MDT_DEFAULT = 0;

pub const aliases = struct {
    pub const DPI_AWARENESS = i32;
    pub const DPI_HOSTING_BEHAVIOR = i32;
    pub const DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS = i32;
    pub const DIALOG_DPI_CHANGE_BEHAVIORS = i32;
    pub const PROCESS_DPI_AWARENESS = i32;
    pub const MONITOR_DPI_TYPE = i32;
    pub const DPI_AWARENESS_CONTEXT = ?*anyopaque;
};
