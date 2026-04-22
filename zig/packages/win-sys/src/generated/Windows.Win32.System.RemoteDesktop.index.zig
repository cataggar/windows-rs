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
    .{ "WTSStopRemoteControlSession", MethodRecord{ .library = "WTSAPI32", .import = "WTSStopRemoteControlSession", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "WTSStartRemoteControlSessionW", MethodRecord{ .library = "WTSAPI32", .import = "WTSStartRemoteControlSessionW", .signature = "\x00\x04\x11\x59\x11\x05\x09\x05\x07" } },
    .{ "WTSStartRemoteControlSessionA", MethodRecord{ .library = "WTSAPI32", .import = "WTSStartRemoteControlSessionA", .signature = "\x00\x04\x11\x59\x11\x3d\x09\x05\x07" } },
    .{ "WTSConnectSessionA", MethodRecord{ .library = "WTSAPI32", .import = "WTSConnectSessionA", .signature = "\x00\x04\x11\x59\x09\x09\x11\x3d\x11\x59" } },
    .{ "WTSConnectSessionW", MethodRecord{ .library = "WTSAPI32", .import = "WTSConnectSessionW", .signature = "\x00\x04\x11\x59\x09\x09\x11\x05\x11\x59" } },
    .{ "WTSEnumerateServersW", MethodRecord{ .library = "WTSAPI32", .import = "WTSEnumerateServersW", .signature = "\x00\x05\x11\x59\x11\x05\x09\x09\x0f\x0f\x11\x9a\xb1\x0f\x09" } },
    .{ "WTSEnumerateServersA", MethodRecord{ .library = "WTSAPI32", .import = "WTSEnumerateServersA", .signature = "\x00\x05\x11\x59\x11\x3d\x09\x09\x0f\x0f\x11\x9a\xb5\x0f\x09" } },
    .{ "WTSOpenServerW", MethodRecord{ .library = "WTSAPI32", .import = "WTSOpenServerW", .signature = "\x00\x01\x11\x80\x85\x11\x05" } },
    .{ "WTSOpenServerA", MethodRecord{ .library = "WTSAPI32", .import = "WTSOpenServerA", .signature = "\x00\x01\x11\x80\x85\x11\x3d" } },
    .{ "WTSOpenServerExW", MethodRecord{ .library = "WTSAPI32", .import = "WTSOpenServerExW", .signature = "\x00\x01\x11\x80\x85\x11\x05" } },
    .{ "WTSOpenServerExA", MethodRecord{ .library = "WTSAPI32", .import = "WTSOpenServerExA", .signature = "\x00\x01\x11\x80\x85\x11\x3d" } },
    .{ "WTSCloseServer", MethodRecord{ .library = "WTSAPI32", .import = "WTSCloseServer", .signature = "\x00\x01\x01\x11\x80\x85" } },
    .{ "WTSEnumerateSessionsW", MethodRecord{ .library = "WTSAPI32", .import = "WTSEnumerateSessionsW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x09\x0f\x0f\x11\x9a\xb9\x0f\x09" } },
    .{ "WTSEnumerateSessionsA", MethodRecord{ .library = "WTSAPI32", .import = "WTSEnumerateSessionsA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x09\x0f\x0f\x11\x9a\xbd\x0f\x09" } },
    .{ "WTSEnumerateSessionsExW", MethodRecord{ .library = "WTSAPI32", .import = "WTSEnumerateSessionsExW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x09\x09\x0f\x0f\x11\x9a\xc1\x0f\x09" } },
    .{ "WTSEnumerateSessionsExA", MethodRecord{ .library = "WTSAPI32", .import = "WTSEnumerateSessionsExA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x09\x09\x0f\x0f\x11\x9a\xc5\x0f\x09" } },
    .{ "WTSEnumerateProcessesW", MethodRecord{ .library = "WTSAPI32", .import = "WTSEnumerateProcessesW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x09\x0f\x0f\x11\x9a\xc9\x0f\x09" } },
    .{ "WTSEnumerateProcessesA", MethodRecord{ .library = "WTSAPI32", .import = "WTSEnumerateProcessesA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x09\x0f\x0f\x11\x9a\xcd\x0f\x09" } },
    .{ "WTSTerminateProcess", MethodRecord{ .library = "WTSAPI32", .import = "WTSTerminateProcess", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x09" } },
    .{ "WTSQuerySessionInformationW", MethodRecord{ .library = "WTSAPI32", .import = "WTSQuerySessionInformationW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x11\x9a\xd1\x0f\x11\x05\x0f\x09" } },
    .{ "WTSQuerySessionInformationA", MethodRecord{ .library = "WTSAPI32", .import = "WTSQuerySessionInformationA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x11\x9a\xd1\x0f\x11\x3d\x0f\x09" } },
    .{ "WTSQueryUserConfigW", MethodRecord{ .library = "WTSAPI32", .import = "WTSQueryUserConfigW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x11\x9a\xd5\x0f\x11\x05\x0f\x09" } },
    .{ "WTSQueryUserConfigA", MethodRecord{ .library = "WTSAPI32", .import = "WTSQueryUserConfigA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x11\x9a\xd5\x0f\x11\x3d\x0f\x09" } },
    .{ "WTSSetUserConfigW", MethodRecord{ .library = "WTSAPI32", .import = "WTSSetUserConfigW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x11\x9a\xd5\x11\x05\x09" } },
    .{ "WTSSetUserConfigA", MethodRecord{ .library = "WTSAPI32", .import = "WTSSetUserConfigA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x11\x9a\xd5\x11\x3d\x09" } },
    .{ "WTSSendMessageW", MethodRecord{ .library = "WTSAPI32", .import = "WTSSendMessageW", .signature = "\x00\x0a\x11\x59\x11\x80\x85\x09\x11\x05\x09\x11\x05\x09\x11\x89\x29\x09\x0f\x11\x9a\xd9\x11\x59" } },
    .{ "WTSSendMessageA", MethodRecord{ .library = "WTSAPI32", .import = "WTSSendMessageA", .signature = "\x00\x0a\x11\x59\x11\x80\x85\x09\x11\x3d\x09\x11\x3d\x09\x11\x89\x29\x09\x0f\x11\x9a\xd9\x11\x59" } },
    .{ "WTSDisconnectSession", MethodRecord{ .library = "WTSAPI32", .import = "WTSDisconnectSession", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x11\x59" } },
    .{ "WTSLogoffSession", MethodRecord{ .library = "WTSAPI32", .import = "WTSLogoffSession", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x11\x59" } },
    .{ "WTSShutdownSystem", MethodRecord{ .library = "WTSAPI32", .import = "WTSShutdownSystem", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "WTSWaitSystemEvent", MethodRecord{ .library = "WTSAPI32", .import = "WTSWaitSystemEvent", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x0f\x09" } },
    .{ "WTSVirtualChannelOpen", MethodRecord{ .library = "WTSAPI32", .import = "WTSVirtualChannelOpen", .signature = "\x00\x03\x11\x80\x85\x11\x80\x85\x09\x11\x3d" } },
    .{ "WTSVirtualChannelOpenEx", MethodRecord{ .library = "WTSAPI32", .import = "WTSVirtualChannelOpenEx", .signature = "\x00\x03\x11\x80\x85\x09\x11\x3d\x09" } },
    .{ "WTSVirtualChannelClose", MethodRecord{ .library = "WTSAPI32", .import = "WTSVirtualChannelClose", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "WTSVirtualChannelRead", MethodRecord{ .library = "WTSAPI32", .import = "WTSVirtualChannelRead", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x11\x3d\x09\x0f\x09" } },
    .{ "WTSVirtualChannelWrite", MethodRecord{ .library = "WTSAPI32", .import = "WTSVirtualChannelWrite", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x3d\x09\x0f\x09" } },
    .{ "WTSVirtualChannelPurgeInput", MethodRecord{ .library = "WTSAPI32", .import = "WTSVirtualChannelPurgeInput", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "WTSVirtualChannelPurgeOutput", MethodRecord{ .library = "WTSAPI32", .import = "WTSVirtualChannelPurgeOutput", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "WTSVirtualChannelQuery", MethodRecord{ .library = "WTSAPI32", .import = "WTSVirtualChannelQuery", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x9a\xdd\x0f\x0f\x01\x0f\x09" } },
    .{ "WTSFreeMemory", MethodRecord{ .library = "WTSAPI32", .import = "WTSFreeMemory", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "WTSRegisterSessionNotification", MethodRecord{ .library = "WTSAPI32", .import = "WTSRegisterSessionNotification", .signature = "\x00\x02\x11\x59\x11\x25\x09" } },
    .{ "WTSUnRegisterSessionNotification", MethodRecord{ .library = "WTSAPI32", .import = "WTSUnRegisterSessionNotification", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "WTSRegisterSessionNotificationEx", MethodRecord{ .library = "WTSAPI32", .import = "WTSRegisterSessionNotificationEx", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x25\x09" } },
    .{ "WTSUnRegisterSessionNotificationEx", MethodRecord{ .library = "WTSAPI32", .import = "WTSUnRegisterSessionNotificationEx", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x25" } },
    .{ "WTSQueryUserToken", MethodRecord{ .library = "WTSAPI32", .import = "WTSQueryUserToken", .signature = "\x00\x02\x11\x59\x09\x0f\x11\x80\x85" } },
    .{ "WTSFreeMemoryExW", MethodRecord{ .library = "WTSAPI32", .import = "WTSFreeMemoryExW", .signature = "\x00\x03\x11\x59\x11\x9a\xe1\x0f\x01\x09" } },
    .{ "WTSFreeMemoryExA", MethodRecord{ .library = "WTSAPI32", .import = "WTSFreeMemoryExA", .signature = "\x00\x03\x11\x59\x11\x9a\xe1\x0f\x01\x09" } },
    .{ "WTSEnumerateProcessesExW", MethodRecord{ .library = "WTSAPI32", .import = "WTSEnumerateProcessesExW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x09\x09\x0f\x11\x05\x0f\x09" } },
    .{ "WTSEnumerateProcessesExA", MethodRecord{ .library = "WTSAPI32", .import = "WTSEnumerateProcessesExA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x09\x09\x0f\x11\x3d\x0f\x09" } },
    .{ "WTSEnumerateListenersW", MethodRecord{ .library = "WTSAPI32", .import = "WTSEnumerateListenersW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x09\x0f\x0f\x07\x0f\x09" } },
    .{ "WTSEnumerateListenersA", MethodRecord{ .library = "WTSAPI32", .import = "WTSEnumerateListenersA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x09\x0f\x0f\x04\x0f\x09" } },
    .{ "WTSQueryListenerConfigW", MethodRecord{ .library = "WTSAPI32", .import = "WTSQueryListenerConfigW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x09\x11\x05\x0f\x11\x9a\xe5" } },
    .{ "WTSQueryListenerConfigA", MethodRecord{ .library = "WTSAPI32", .import = "WTSQueryListenerConfigA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x09\x11\x3d\x0f\x11\x9a\xe9" } },
    .{ "WTSCreateListenerW", MethodRecord{ .library = "WTSAPI32", .import = "WTSCreateListenerW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x01\x09\x11\x05\x0f\x11\x9a\xe5\x09" } },
    .{ "WTSCreateListenerA", MethodRecord{ .library = "WTSAPI32", .import = "WTSCreateListenerA", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x01\x09\x11\x3d\x0f\x11\x9a\xe9\x09" } },
    .{ "WTSSetListenerSecurityW", MethodRecord{ .library = "WTSAPI32", .import = "WTSSetListenerSecurityW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x01\x09\x11\x05\x11\x84\xf9\x11\x82\xad" } },
    .{ "WTSSetListenerSecurityA", MethodRecord{ .library = "WTSAPI32", .import = "WTSSetListenerSecurityA", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x01\x09\x11\x3d\x11\x84\xf9\x11\x82\xad" } },
    .{ "WTSGetListenerSecurityW", MethodRecord{ .library = "WTSAPI32", .import = "WTSGetListenerSecurityW", .signature = "\x00\x08\x11\x59\x11\x80\x85\x0f\x01\x09\x11\x05\x11\x84\xf9\x11\x82\xad\x09\x0f\x09" } },
    .{ "WTSGetListenerSecurityA", MethodRecord{ .library = "WTSAPI32", .import = "WTSGetListenerSecurityA", .signature = "\x00\x08\x11\x59\x11\x80\x85\x0f\x01\x09\x11\x3d\x11\x84\xf9\x11\x82\xad\x09\x0f\x09" } },
    .{ "WTSCloudAuthOpen", MethodRecord{ .library = "WTSAPI32", .import = "WTSCloudAuthOpen", .signature = "\x00\x01\x11\x9a\xed\x0f\x11\x0d" } },
    .{ "WTSCloudAuthClose", MethodRecord{ .library = "WTSAPI32", .import = "WTSCloudAuthClose", .signature = "\x00\x01\x01\x11\x9a\xed" } },
    .{ "WTSCloudAuthGetServerNonce", MethodRecord{ .library = "WTSAPI32", .import = "WTSCloudAuthGetServerNonce", .signature = "\x00\x02\x11\x59\x11\x9a\xed\x0f\x11\x05" } },
    .{ "WTSCloudAuthConvertAssertionToSerializedUserCredential", MethodRecord{ .library = "WTSAPI32", .import = "WTSCloudAuthConvertAssertionToSerializedUserCredential", .signature = "\x00\x05\x11\x59\x11\x9a\xed\x11\x3d\x09\x11\x05\x0f\x0f\x11\x9a\xf1" } },
    .{ "WTSCloudAuthNetworkLogonWithSerializedCredential", MethodRecord{ .library = "WTSAPI32", .import = "WTSCloudAuthNetworkLogonWithSerializedCredential", .signature = "\x00\x03\x11\x59\x11\x9a\xed\x0f\x11\x9a\xf1\x0f\x11\x80\x85" } },
    .{ "WTSCloudAuthDuplicateSerializedUserCredential", MethodRecord{ .library = "WTSAPI32", .import = "WTSCloudAuthDuplicateSerializedUserCredential", .signature = "\x00\x02\x11\x59\x0f\x11\x9a\xf1\x0f\x0f\x11\x9a\xf1" } },
    .{ "WTSEnableChildSessions", MethodRecord{ .library = "WTSAPI32", .import = "WTSEnableChildSessions", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "WTSIsChildSessionsEnabled", MethodRecord{ .library = "WTSAPI32", .import = "WTSIsChildSessionsEnabled", .signature = "\x00\x01\x11\x59\x0f\x11\x59" } },
    .{ "WTSGetChildSessionId", MethodRecord{ .library = "WTSAPI32", .import = "WTSGetChildSessionId", .signature = "\x00\x01\x11\x59\x0f\x09" } },
    .{ "WTSActiveSessionExists", MethodRecord{ .library = "WTSAPI32", .import = "WTSActiveSessionExists", .signature = "\x00\x01\x11\x59\x0f\x11\x59" } },
    .{ "WTSSetRenderHint", MethodRecord{ .library = "WTSAPI32", .import = "WTSSetRenderHint", .signature = "\x00\x05\x11\x79\x0f\x0b\x11\x25\x09\x09\x0f\x05" } },
    .{ "ProcessIdToSessionId", MethodRecord{ .library = "KERNEL32", .import = "ProcessIdToSessionId", .signature = "\x00\x02\x11\x59\x09\x0f\x09" } },
    .{ "WTSGetActiveConsoleSessionId", MethodRecord{ .library = "KERNEL32", .import = "WTSGetActiveConsoleSessionId", .signature = "\x00\x00\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x4f9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "OBJECT_SECURITY_INFORMATION" },
        0x929 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MESSAGEBOX_STYLE" },
        0x1ab1 => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTS_SERVER_INFOW" },
        0x1ab5 => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTS_SERVER_INFOA" },
        0x1ab9 => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTS_SESSION_INFOW" },
        0x1abd => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTS_SESSION_INFOA" },
        0x1ac1 => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTS_SESSION_INFO_1W" },
        0x1ac5 => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTS_SESSION_INFO_1A" },
        0x1ac9 => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTS_PROCESS_INFOW" },
        0x1acd => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTS_PROCESS_INFOA" },
        0x1ad1 => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTS_INFO_CLASS" },
        0x1ad5 => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTS_CONFIG_CLASS" },
        0x1ad9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MESSAGEBOX_RESULT" },
        0x1add => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTS_VIRTUAL_CLASS" },
        0x1ae1 => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTS_TYPE_CLASS" },
        0x1ae5 => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTSLISTENERCONFIGW" },
        0x1ae9 => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTSLISTENERCONFIGA" },
        0x1aed => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTS_CLOUD_AUTH_HANDLE" },
        0x1af1 => TypeRefEntry{ .namespace = "Windows.Win32.System.RemoteDesktop", .name = "WTS_SERIALIZED_USER_CREDENTIAL" },
        else => null,
    };
}

pub const WTS_CURRENT_SERVER = 0;
pub const WTS_CURRENT_SERVER_HANDLE = 0;
pub const WTS_DOMAIN_LENGTH = 255;
pub const WTS_USERNAME_LENGTH = 255;
pub const WTS_PASSWORD_LENGTH = 255;
pub const WTS_DIRECTORY_LENGTH = 256;
pub const WTS_INITIALPROGRAM_LENGTH = 256;
pub const WTS_PROTOCOL_NAME_LENGTH = 8;
pub const WTS_DRIVER_NAME_LENGTH = 8;
pub const WTS_DEVICE_NAME_LENGTH = 19;
pub const WTS_IMEFILENAME_LENGTH = 32;
pub const WTS_CLIENTNAME_LENGTH = 20;
pub const WTS_CLIENTADDRESS_LENGTH = 30;
pub const WTS_CLIENT_PRODUCT_ID_LENGTH = 32;
pub const WTS_MAX_PROTOCOL_CACHE = 4;
pub const WTS_MAX_CACHE_RESERVED = 20;
pub const WTS_MAX_RESERVED = 100;
pub const WTS_MAX_COUNTERS = 100;
pub const WTS_MAX_DISPLAY_IOCTL_DATA = 256;
pub const WTS_PERF_DISABLE_NOTHING = 0;
pub const WTS_PERF_DISABLE_WALLPAPER = 1;
pub const WTS_PERF_DISABLE_FULLWINDOWDRAG = 2;
pub const WTS_PERF_DISABLE_MENUANIMATIONS = 4;
pub const WTS_PERF_DISABLE_THEMING = 8;
pub const WTS_PERF_ENABLE_ENHANCED_GRAPHICS = 16;
pub const WTS_PERF_DISABLE_CURSOR_SHADOW = 32;
pub const WTS_PERF_DISABLE_CURSORSETTINGS = 64;
pub const WTS_PERF_ENABLE_FONT_SMOOTHING = 128;
pub const WTS_PERF_ENABLE_DESKTOP_COMPOSITION = 256;
pub const WTS_VALUE_TYPE_ULONG = 1;
pub const WTS_VALUE_TYPE_STRING = 2;
pub const WTS_VALUE_TYPE_BINARY = 3;
pub const WTS_VALUE_TYPE_GUID = 4;
pub const WTS_KEY_EXCHANGE_ALG_RSA = 1;
pub const WTS_KEY_EXCHANGE_ALG_DH = 2;
pub const WTS_LICENSE_PROTOCOL_VERSION = 65536;
pub const WTS_LICENSE_PREAMBLE_VERSION = 3;
pub const WRDS_DOMAIN_LENGTH = 255;
pub const WRDS_USERNAME_LENGTH = 255;
pub const WRDS_PASSWORD_LENGTH = 255;
pub const WRDS_DIRECTORY_LENGTH = 256;
pub const WRDS_INITIALPROGRAM_LENGTH = 256;
pub const WRDS_PROTOCOL_NAME_LENGTH = 8;
pub const WRDS_DRIVER_NAME_LENGTH = 8;
pub const WRDS_DEVICE_NAME_LENGTH = 19;
pub const WRDS_IMEFILENAME_LENGTH = 32;
pub const WRDS_CLIENTNAME_LENGTH = 20;
pub const WRDS_CLIENTADDRESS_LENGTH = 30;
pub const WRDS_CLIENT_PRODUCT_ID_LENGTH = 32;
pub const WRDS_MAX_PROTOCOL_CACHE = 4;
pub const WRDS_MAX_CACHE_RESERVED = 20;
pub const WRDS_MAX_RESERVED = 100;
pub const WRDS_MAX_COUNTERS = 100;
pub const WRDS_MAX_DISPLAY_IOCTL_DATA = 256;
pub const WRDS_PERF_DISABLE_NOTHING = 0;
pub const WRDS_PERF_DISABLE_WALLPAPER = 1;
pub const WRDS_PERF_DISABLE_FULLWINDOWDRAG = 2;
pub const WRDS_PERF_DISABLE_MENUANIMATIONS = 4;
pub const WRDS_PERF_DISABLE_THEMING = 8;
pub const WRDS_PERF_ENABLE_ENHANCED_GRAPHICS = 16;
pub const WRDS_PERF_DISABLE_CURSOR_SHADOW = 32;
pub const WRDS_PERF_DISABLE_CURSORSETTINGS = 64;
pub const WRDS_PERF_ENABLE_FONT_SMOOTHING = 128;
pub const WRDS_PERF_ENABLE_DESKTOP_COMPOSITION = 256;
pub const WRDS_VALUE_TYPE_ULONG = 1;
pub const WRDS_VALUE_TYPE_STRING = 2;
pub const WRDS_VALUE_TYPE_BINARY = 3;
pub const WRDS_VALUE_TYPE_GUID = 4;
pub const WRDS_KEY_EXCHANGE_ALG_RSA = 1;
pub const WRDS_KEY_EXCHANGE_ALG_DH = 2;
pub const WRDS_LICENSE_PROTOCOL_VERSION = 65536;
pub const WRDS_LICENSE_PREAMBLE_VERSION = 3;
pub const SINGLE_SESSION = 1;
pub const FORCE_REJOIN = 2;
pub const FORCE_REJOIN_IN_CLUSTERMODE = 3;
pub const RESERVED_FOR_LEGACY = 4;
pub const KEEP_EXISTING_SESSIONS = 8;
pub const CHANNEL_EVENT_INITIALIZED = 0;
pub const CHANNEL_EVENT_CONNECTED = 1;
pub const CHANNEL_EVENT_V1_CONNECTED = 2;
pub const CHANNEL_EVENT_DISCONNECTED = 3;
pub const CHANNEL_EVENT_TERMINATED = 4;
pub const CHANNEL_EVENT_DATA_RECEIVED = 10;
pub const CHANNEL_EVENT_WRITE_COMPLETE = 11;
pub const CHANNEL_EVENT_WRITE_CANCELLED = 12;
pub const CHANNEL_RC_OK = 0;
pub const CHANNEL_RC_ALREADY_INITIALIZED = 1;
pub const CHANNEL_RC_NOT_INITIALIZED = 2;
pub const CHANNEL_RC_ALREADY_CONNECTED = 3;
pub const CHANNEL_RC_NOT_CONNECTED = 4;
pub const CHANNEL_RC_TOO_MANY_CHANNELS = 5;
pub const CHANNEL_RC_BAD_CHANNEL = 6;
pub const CHANNEL_RC_BAD_CHANNEL_HANDLE = 7;
pub const CHANNEL_RC_NO_BUFFER = 8;
pub const CHANNEL_RC_BAD_INIT_HANDLE = 9;
pub const CHANNEL_RC_NOT_OPEN = 10;
pub const CHANNEL_RC_BAD_PROC = 11;
pub const CHANNEL_RC_NO_MEMORY = 12;
pub const CHANNEL_RC_UNKNOWN_CHANNEL_NAME = 13;
pub const CHANNEL_RC_ALREADY_OPEN = 14;
pub const CHANNEL_RC_NOT_IN_VIRTUALCHANNELENTRY = 15;
pub const CHANNEL_RC_NULL_DATA = 16;
pub const CHANNEL_RC_ZERO_LENGTH = 17;
pub const CHANNEL_RC_INVALID_INSTANCE = 18;
pub const CHANNEL_RC_UNSUPPORTED_VERSION = 19;
pub const CHANNEL_RC_INITIALIZATION_ERROR = 20;
pub const VIRTUAL_CHANNEL_VERSION_WIN2000 = 1;
pub const CHANNEL_CHUNK_LENGTH = 1600;
pub const CHANNEL_BUFFER_SIZE = 65535;
pub const CHANNEL_FLAG_FIRST = 1;
pub const CHANNEL_FLAG_LAST = 2;
pub const CHANNEL_FLAG_MIDDLE = 0;
pub const CHANNEL_FLAG_FAIL = 256;
pub const CHANNEL_OPTION_INITIALIZED = 2147483648;
pub const CHANNEL_OPTION_ENCRYPT_RDP = 1073741824;
pub const CHANNEL_OPTION_ENCRYPT_SC = 536870912;
pub const CHANNEL_OPTION_ENCRYPT_CS = 268435456;
pub const CHANNEL_OPTION_PRI_HIGH = 134217728;
pub const CHANNEL_OPTION_PRI_MED = 67108864;
pub const CHANNEL_OPTION_PRI_LOW = 33554432;
pub const CHANNEL_OPTION_COMPRESS_RDP = 8388608;
pub const CHANNEL_OPTION_COMPRESS = 4194304;
pub const CHANNEL_OPTION_SHOW_PROTOCOL = 2097152;
pub const CHANNEL_OPTION_REMOTE_CONTROL_PERSISTENT = 1048576;
pub const CHANNEL_MAX_COUNT = 30;
pub const CHANNEL_NAME_LEN = 7;
pub const MAX_POLICY_ATTRIBUTES = 20;
pub const WTS_CURRENT_SESSION = 4294967295;
pub const USERNAME_LENGTH = 20;
pub const CLIENTNAME_LENGTH = 20;
pub const CLIENTADDRESS_LENGTH = 30;
pub const WTS_WSD_LOGOFF = 1;
pub const WTS_WSD_SHUTDOWN = 2;
pub const WTS_WSD_REBOOT = 4;
pub const WTS_WSD_POWEROFF = 8;
pub const WTS_WSD_FASTREBOOT = 16;
pub const MAX_ELAPSED_TIME_LENGTH = 15;
pub const MAX_DATE_TIME_LENGTH = 56;
pub const WINSTATIONNAME_LENGTH = 32;
pub const DOMAIN_LENGTH = 17;
pub const WTS_DRIVE_LENGTH = 3;
pub const WTS_LISTENER_NAME_LENGTH = 32;
pub const WTS_COMMENT_LENGTH = 60;
pub const WTS_LISTENER_CREATE = 1;
pub const WTS_LISTENER_UPDATE = 16;
pub const WTS_PROTOCOL_TYPE_CONSOLE = 0;
pub const WTS_PROTOCOL_TYPE_ICA = 1;
pub const WTS_PROTOCOL_TYPE_RDP = 2;
pub const WTS_SESSIONSTATE_UNKNOWN = 4294967295;
pub const WTS_SESSIONSTATE_LOCK = 0;
pub const WTS_SESSIONSTATE_UNLOCK = 1;
pub const PRODUCTINFO_COMPANYNAME_LENGTH = 256;
pub const PRODUCTINFO_PRODUCTID_LENGTH = 4;
pub const VALIDATIONINFORMATION_LICENSE_LENGTH = 16384;
pub const VALIDATIONINFORMATION_HARDWAREID_LENGTH = 20;
pub const WTS_EVENT_NONE = 0;
pub const WTS_EVENT_CREATE = 1;
pub const WTS_EVENT_DELETE = 2;
pub const WTS_EVENT_RENAME = 4;
pub const WTS_EVENT_CONNECT = 8;
pub const WTS_EVENT_DISCONNECT = 16;
pub const WTS_EVENT_LOGON = 32;
pub const WTS_EVENT_LOGOFF = 64;
pub const WTS_EVENT_STATECHANGE = 128;
pub const WTS_EVENT_LICENSE = 256;
pub const WTS_EVENT_ALL = 2147483647;
pub const WTS_EVENT_FLUSH = 2147483648;
pub const REMOTECONTROL_KBDSHIFT_HOTKEY = 1;
pub const REMOTECONTROL_KBDCTRL_HOTKEY = 2;
pub const REMOTECONTROL_KBDALT_HOTKEY = 4;
pub const WTS_CHANNEL_OPTION_DYNAMIC = 1;
pub const WTS_CHANNEL_OPTION_DYNAMIC_PRI_LOW = 0;
pub const WTS_CHANNEL_OPTION_DYNAMIC_PRI_MED = 2;
pub const WTS_CHANNEL_OPTION_DYNAMIC_PRI_HIGH = 4;
pub const WTS_CHANNEL_OPTION_DYNAMIC_PRI_REAL = 6;
pub const WTS_CHANNEL_OPTION_DYNAMIC_NO_COMPRESS = 8;
pub const NOTIFY_FOR_ALL_SESSIONS = 1;
pub const NOTIFY_FOR_THIS_SESSION = 0;
pub const WTS_PROCESS_INFO_LEVEL_0 = 0;
pub const WTS_PROCESS_INFO_LEVEL_1 = 1;
pub const PLUGIN_CAPABILITY_EXTERNAL_REDIRECTION = 1;
pub const MaxFQDN_Len = 256;
pub const MaxNetBiosName_Len = 16;
pub const MaxNumOfExposed_IPs = 12;
pub const MaxUserName_Len = 104;
pub const MaxDomainName_Len = 256;
pub const MaxFarm_Len = 256;
pub const MaxAppName_Len = 256;
pub const WKS_FLAG_CLEAR_CREDS_ON_LAST_RESOURCE = 1;
pub const WKS_FLAG_PASSWORD_ENCRYPTED = 2;
pub const WKS_FLAG_CREDS_AUTHENTICATED = 4;
pub const SB_SYNCH_CONFLICT_MAX_WRITE_ATTEMPTS = 100;
pub const ACQUIRE_TARGET_LOCK_TIMEOUT = 300000;
pub const RENDER_HINT_CLEAR = 0;
pub const RENDER_HINT_VIDEO = 1;
pub const RENDER_HINT_MAPPEDWINDOW = 2;
pub const TS_VC_LISTENER_STATIC_CHANNEL = 1;
pub const WRdsGraphicsChannels_LossyChannelMaxMessageSize = 988;
pub const RFX_RDP_MSG_PREFIX = 0;
pub const RFX_GFX_MSG_PREFIX = 48;
pub const RFX_GFX_MSG_PREFIX_MASK = 48;
pub const RFX_GFX_MAX_SUPPORTED_MONITORS = 16;
pub const RFX_CLIENT_ID_LENGTH = 32;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_CONNECT = 701;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_DISCONNECT = 702;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_RECONNECT = 703;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_DELETE_SAVED_CREDENTIALS = 704;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_UPDATE_SESSION_DISPLAYSETTINGS = 705;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_ATTACH_EVENT = 706;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_DETACH_EVENT = 707;
pub const DISPID_PROP_REMOTEDESKTOPCLIENT_SETTINGS = 710;
pub const DISPID_PROP_REMOTEDESKTOPCLIENT_ACTIONS = 711;
pub const DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCH_POINTER = 712;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_SET_RDPPROPERTY = 720;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_GET_RDPPROPERTY = 721;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_APPLY_SETTINGS = 722;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_RETRIEVE_SETTINGS = 723;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_SUSPEND_SCREEN_UPDATES = 730;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_RESUME_SCREEN_UPDATES = 731;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_EXECUTE_REMOTE_ACTION = 732;
pub const DISPID_METHOD_REMOTEDESKTOPCLIENT_GET_SNAPSHOT = 733;
pub const DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_ENABLED = 740;
pub const DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_EVENTSENABLED = 741;
pub const DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_POINTERSPEED = 742;
pub const DISPID_AX_CONNECTING = 750;
pub const DISPID_AX_CONNECTED = 751;
pub const DISPID_AX_LOGINCOMPLETED = 752;
pub const DISPID_AX_DISCONNECTED = 753;
pub const DISPID_AX_STATUSCHANGED = 754;
pub const DISPID_AX_AUTORECONNECTING = 755;
pub const DISPID_AX_AUTORECONNECTED = 756;
pub const DISPID_AX_DIALOGDISPLAYING = 757;
pub const DISPID_AX_DIALOGDISMISSED = 758;
pub const DISPID_AX_NETWORKSTATUSCHANGED = 759;
pub const DISPID_AX_ADMINMESSAGERECEIVED = 760;
pub const DISPID_AX_KEYCOMBINATIONPRESSED = 761;
pub const DISPID_AX_REMOTEDESKTOPSIZECHANGED = 762;
pub const DISPID_AX_TOUCHPOINTERCURSORMOVED = 800;
pub const WTS_SECURITY_CURRENT_GUEST_ACCESS = 72;
pub const WTS_SECURITY_USER_ACCESS = 329;
pub const WTS_SECURITY_CURRENT_USER_ACCESS = 590;
pub const WTS_SECURITY_ALL_ACCESS = 983999;
pub const WTS_SECURITY_QUERY_INFORMATION = 1;
pub const WTS_SECURITY_SET_INFORMATION = 2;
pub const WTS_SECURITY_RESET = 4;
pub const WTS_SECURITY_VIRTUAL_CHANNELS = 8;
pub const WTS_SECURITY_REMOTE_CONTROL = 16;
pub const WTS_SECURITY_LOGON = 32;
pub const WTS_SECURITY_LOGOFF = 64;
pub const WTS_SECURITY_MESSAGE = 128;
pub const WTS_SECURITY_CONNECT = 256;
pub const WTS_SECURITY_DISCONNECT = 512;
pub const WTS_SECURITY_GUEST_ACCESS = 32;
pub const POSITION_INVALID = 0;
pub const POSITION_DISCONTINUOUS = 1;
pub const POSITION_CONTINUOUS = 2;
pub const POSITION_QPC_ERROR = 4;
pub const AA_AUTH_MIN = 0;
pub const AA_AUTH_BASIC = 1;
pub const AA_AUTH_NTLM = 2;
pub const AA_AUTH_SC = 3;
pub const AA_AUTH_LOGGEDONCREDENTIALS = 4;
pub const AA_AUTH_NEGOTIATE = 5;
pub const AA_AUTH_ANY = 6;
pub const AA_AUTH_COOKIE = 7;
pub const AA_AUTH_DIGEST = 8;
pub const AA_AUTH_ORGID = 9;
pub const AA_AUTH_CONID = 10;
pub const AA_AUTH_SSPI_NTLM = 11;
pub const AA_AUTH_MAX = 12;
pub const AA_MAIN_SESSION_CREATION = 0;
pub const AA_SUB_SESSION_CREATION = 1;
pub const AA_SUB_SESSION_CLOSED = 2;
pub const AA_MAIN_SESSION_CLOSED = 3;
pub const SESSION_TIMEOUT_ACTION_DISCONNECT = 0;
pub const SESSION_TIMEOUT_ACTION_SILENT_REAUTH = 1;
pub const EnableAllRedirections = 0;
pub const DisableAllRedirections = 1;
pub const DriveRedirectionDisabled = 2;
pub const PrinterRedirectionDisabled = 3;
pub const PortRedirectionDisabled = 4;
pub const ClipboardRedirectionDisabled = 5;
pub const PnpRedirectionDisabled = 6;
pub const AllowOnlySDRServers = 7;
pub const AA_UNTRUSTED = 0;
pub const AA_TRUSTEDUSER_UNTRUSTEDCLIENT = 1;
pub const AA_TRUSTEDUSER_TRUSTEDCLIENT = 2;
pub const WTSActive = 0;
pub const WTSConnected = 1;
pub const WTSConnectQuery = 2;
pub const WTSShadow = 3;
pub const WTSDisconnected = 4;
pub const WTSIdle = 5;
pub const WTSListen = 6;
pub const WTSReset = 7;
pub const WTSDown = 8;
pub const WTSInit = 9;
pub const WTSInitialProgram = 0;
pub const WTSApplicationName = 1;
pub const WTSWorkingDirectory = 2;
pub const WTSOEMId = 3;
pub const WTSSessionId = 4;
pub const WTSUserName = 5;
pub const WTSWinStationName = 6;
pub const WTSDomainName = 7;
pub const WTSConnectState = 8;
pub const WTSClientBuildNumber = 9;
pub const WTSClientName = 10;
pub const WTSClientDirectory = 11;
pub const WTSClientProductId = 12;
pub const WTSClientHardwareId = 13;
pub const WTSClientAddress = 14;
pub const WTSClientDisplay = 15;
pub const WTSClientProtocolType = 16;
pub const WTSIdleTime = 17;
pub const WTSLogonTime = 18;
pub const WTSIncomingBytes = 19;
pub const WTSOutgoingBytes = 20;
pub const WTSIncomingFrames = 21;
pub const WTSOutgoingFrames = 22;
pub const WTSClientInfo = 23;
pub const WTSSessionInfo = 24;
pub const WTSSessionInfoEx = 25;
pub const WTSConfigInfo = 26;
pub const WTSValidationInfo = 27;
pub const WTSSessionAddressV4 = 28;
pub const WTSIsRemoteSession = 29;
pub const WTSSessionActivityId = 30;
pub const WTSCapabilityCheck = 31;
pub const WTSUserConfigInitialProgram = 0;
pub const WTSUserConfigWorkingDirectory = 1;
pub const WTSUserConfigfInheritInitialProgram = 2;
pub const WTSUserConfigfAllowLogonTerminalServer = 3;
pub const WTSUserConfigTimeoutSettingsConnections = 4;
pub const WTSUserConfigTimeoutSettingsDisconnections = 5;
pub const WTSUserConfigTimeoutSettingsIdle = 6;
pub const WTSUserConfigfDeviceClientDrives = 7;
pub const WTSUserConfigfDeviceClientPrinters = 8;
pub const WTSUserConfigfDeviceClientDefaultPrinter = 9;
pub const WTSUserConfigBrokenTimeoutSettings = 10;
pub const WTSUserConfigReconnectSettings = 11;
pub const WTSUserConfigModemCallbackSettings = 12;
pub const WTSUserConfigModemCallbackPhoneNumber = 13;
pub const WTSUserConfigShadowingSettings = 14;
pub const WTSUserConfigTerminalServerProfilePath = 15;
pub const WTSUserConfigTerminalServerHomeDir = 16;
pub const WTSUserConfigTerminalServerHomeDirDrive = 17;
pub const WTSUserConfigfTerminalServerRemoteHomeDir = 18;
pub const WTSUserConfigUser = 19;
pub const WTSUserConfigSourceSAM = 0;
pub const WTSVirtualClientData = 0;
pub const WTSVirtualFileHandle = 1;
pub const WTSTypeProcessInfoLevel0 = 0;
pub const WTSTypeProcessInfoLevel1 = 1;
pub const WTSTypeSessionInfoLevel1 = 2;
pub const WTSTypeCloudAuthServerNonce = 3;
pub const WTSTypeSerializedUserCredential = 4;
pub const WTSSBX_MACHINE_DRAIN_UNSPEC = 0;
pub const WTSSBX_MACHINE_DRAIN_OFF = 1;
pub const WTSSBX_MACHINE_DRAIN_ON = 2;
pub const WTSSBX_MACHINE_SESSION_MODE_UNSPEC = 0;
pub const WTSSBX_MACHINE_SESSION_MODE_SINGLE = 1;
pub const WTSSBX_MACHINE_SESSION_MODE_MULTIPLE = 2;
pub const WTSSBX_ADDRESS_FAMILY_AF_UNSPEC = 0;
pub const WTSSBX_ADDRESS_FAMILY_AF_INET = 1;
pub const WTSSBX_ADDRESS_FAMILY_AF_INET6 = 2;
pub const WTSSBX_ADDRESS_FAMILY_AF_IPX = 3;
pub const WTSSBX_ADDRESS_FAMILY_AF_NETBIOS = 4;
pub const WTSSBX_MACHINE_STATE_UNSPEC = 0;
pub const WTSSBX_MACHINE_STATE_READY = 1;
pub const WTSSBX_MACHINE_STATE_SYNCHRONIZING = 2;
pub const WTSSBX_SESSION_STATE_UNSPEC = 0;
pub const WTSSBX_SESSION_STATE_ACTIVE = 1;
pub const WTSSBX_SESSION_STATE_DISCONNECTED = 2;
pub const WTSSBX_NOTIFICATION_REMOVED = 1;
pub const WTSSBX_NOTIFICATION_CHANGED = 2;
pub const WTSSBX_NOTIFICATION_ADDED = 4;
pub const WTSSBX_NOTIFICATION_RESYNC = 8;
pub const TSSD_ADDR_UNDEFINED = 0;
pub const TSSD_ADDR_IPv4 = 4;
pub const TSSD_ADDR_IPv6 = 6;
pub const TSSB_NOTIFY_INVALID = 0;
pub const TSSB_NOTIFY_TARGET_CHANGE = 1;
pub const TSSB_NOTIFY_SESSION_CHANGE = 2;
pub const TSSB_NOTIFY_CONNECTION_REQUEST_CHANGE = 4;
pub const TARGET_UNKNOWN = 1;
pub const TARGET_INITIALIZING = 2;
pub const TARGET_RUNNING = 3;
pub const TARGET_DOWN = 4;
pub const TARGET_HIBERNATED = 5;
pub const TARGET_CHECKED_OUT = 6;
pub const TARGET_STOPPED = 7;
pub const TARGET_INVALID = 8;
pub const TARGET_STARTING = 9;
pub const TARGET_STOPPING = 10;
pub const TARGET_MAXSTATE = 11;
pub const TARGET_CHANGE_UNSPEC = 1;
pub const TARGET_EXTERNALIP_CHANGED = 2;
pub const TARGET_INTERNALIP_CHANGED = 4;
pub const TARGET_JOINED = 8;
pub const TARGET_REMOVED = 16;
pub const TARGET_STATE_CHANGED = 32;
pub const TARGET_IDLE = 64;
pub const TARGET_PENDING = 128;
pub const TARGET_INUSE = 256;
pub const TARGET_PATCH_STATE_CHANGED = 512;
pub const TARGET_FARM_MEMBERSHIP_CHANGED = 1024;
pub const UNKNOWN = 0;
pub const FARM = 1;
pub const NONFARM = 2;
pub const TARGET_PATCH_UNKNOWN = 0;
pub const TARGET_PATCH_NOT_STARTED = 1;
pub const TARGET_PATCH_IN_PROGRESS = 2;
pub const TARGET_PATCH_COMPLETED = 3;
pub const TARGET_PATCH_FAILED = 4;
pub const CLIENT_MESSAGE_CONNECTION_INVALID = 0;
pub const CLIENT_MESSAGE_CONNECTION_STATUS = 1;
pub const CLIENT_MESSAGE_CONNECTION_ERROR = 2;
pub const CONNECTION_REQUEST_INVALID = 0;
pub const CONNECTION_REQUEST_PENDING = 1;
pub const CONNECTION_REQUEST_FAILED = 2;
pub const CONNECTION_REQUEST_TIMEDOUT = 3;
pub const CONNECTION_REQUEST_SUCCEEDED = 4;
pub const CONNECTION_REQUEST_CANCELLED = 5;
pub const CONNECTION_REQUEST_LB_COMPLETED = 6;
pub const CONNECTION_REQUEST_QUERY_PL_COMPLETED = 7;
pub const CONNECTION_REQUEST_ORCH_COMPLETED = 8;
pub const RD_FARM_RDSH = 0;
pub const RD_FARM_TEMP_VM = 1;
pub const RD_FARM_MANUAL_PERSONAL_VM = 2;
pub const RD_FARM_AUTO_PERSONAL_VM = 3;
pub const RD_FARM_MANUAL_PERSONAL_RDSH = 4;
pub const RD_FARM_AUTO_PERSONAL_RDSH = 5;
pub const RD_FARM_TYPE_UNKNOWN = -1;
pub const UNKNOWN_PLUGIN = 0;
pub const POLICY_PLUGIN = 1;
pub const RESOURCE_PLUGIN = 2;
pub const LOAD_BALANCING_PLUGIN = 4;
pub const PLACEMENT_PLUGIN = 8;
pub const ORCHESTRATION_PLUGIN = 16;
pub const PROVISIONING_PLUGIN = 32;
pub const TASK_PLUGIN = 64;
pub const STATE_INVALID = -1;
pub const STATE_ACTIVE = 0;
pub const STATE_CONNECTED = 1;
pub const STATE_CONNECTQUERY = 2;
pub const STATE_SHADOW = 3;
pub const STATE_DISCONNECTED = 4;
pub const STATE_IDLE = 5;
pub const STATE_LISTEN = 6;
pub const STATE_RESET = 7;
pub const STATE_DOWN = 8;
pub const STATE_INIT = 9;
pub const STATE_MAX = 10;
pub const OWNER_UNKNOWN = 0;
pub const OWNER_MS_TS_PLUGIN = 1;
pub const OWNER_MS_VM_PLUGIN = 2;
pub const VM_NOTIFY_STATUS_PENDING = 0;
pub const VM_NOTIFY_STATUS_IN_PROGRESS = 1;
pub const VM_NOTIFY_STATUS_COMPLETE = 2;
pub const VM_NOTIFY_STATUS_FAILED = 3;
pub const VM_NOTIFY_STATUS_CANCELED = 4;
pub const VM_HOST_STATUS_INIT_PENDING = 0;
pub const VM_HOST_STATUS_INIT_IN_PROGRESS = 1;
pub const VM_HOST_STATUS_INIT_COMPLETE = 2;
pub const VM_HOST_STATUS_INIT_FAILED = 3;
pub const RDV_TASK_STATUS_UNKNOWN = 0;
pub const RDV_TASK_STATUS_SEARCHING = 1;
pub const RDV_TASK_STATUS_DOWNLOADING = 2;
pub const RDV_TASK_STATUS_APPLYING = 3;
pub const RDV_TASK_STATUS_REBOOTING = 4;
pub const RDV_TASK_STATUS_REBOOTED = 5;
pub const RDV_TASK_STATUS_SUCCESS = 6;
pub const RDV_TASK_STATUS_FAILED = 7;
pub const RDV_TASK_STATUS_TIMEOUT = 8;
pub const TS_SB_SORT_BY_NONE = 0;
pub const TS_SB_SORT_BY_NAME = 1;
pub const TS_SB_SORT_BY_PROP = 2;
pub const TSPUB_PLUGIN_PD_QUERY_OR_CREATE = 0;
pub const TSPUB_PLUGIN_PD_QUERY_EXISTING = 1;
pub const TSPUB_PLUGIN_PD_ASSIGNMENT_NEW = 0;
pub const TSPUB_PLUGIN_PD_ASSIGNMENT_EXISTING = 1;
pub const WRdsGraphicsChannelType_GuaranteedDelivery = 0;
pub const WRdsGraphicsChannelType_BestEffortDelivery = 1;
pub const WTS_SERVICE_NONE = 0;
pub const WTS_SERVICE_START = 1;
pub const WTS_SERVICE_STOP = 2;
pub const WTS_DRAIN_STATE_NONE = 0;
pub const WTS_DRAIN_IN_DRAIN = 1;
pub const WTS_DRAIN_NOT_IN_DRAIN = 2;
pub const WTS_LOGON_ERR_INVALID = 0;
pub const WTS_LOGON_ERR_NOT_HANDLED = 1;
pub const WTS_LOGON_ERR_HANDLED_SHOW = 2;
pub const WTS_LOGON_ERR_HANDLED_DONT_SHOW = 3;
pub const WTS_LOGON_ERR_HANDLED_DONT_SHOW_START_OVER = 4;
pub const WTS_CERT_TYPE_INVALID = 0;
pub const WTS_CERT_TYPE_PROPRIETORY = 1;
pub const WTS_CERT_TYPE_X509 = 2;
pub const WRDS_CONNECTION_SETTING_LEVEL_INVALID = 0;
pub const WRDS_CONNECTION_SETTING_LEVEL_1 = 1;
pub const WRDS_LISTENER_SETTING_LEVEL_INVALID = 0;
pub const WRDS_LISTENER_SETTING_LEVEL_1 = 1;
pub const WRDS_SETTING_TYPE_INVALID = 0;
pub const WRDS_SETTING_TYPE_MACHINE = 1;
pub const WRDS_SETTING_TYPE_USER = 2;
pub const WRDS_SETTING_TYPE_SAM = 3;
pub const WRDS_SETTING_STATUS_NOTAPPLICABLE = -1;
pub const WRDS_SETTING_STATUS_DISABLED = 0;
pub const WRDS_SETTING_STATUS_ENABLED = 1;
pub const WRDS_SETTING_STATUS_NOTCONFIGURED = 2;
pub const WRDS_SETTING_LEVEL_INVALID = 0;
pub const WRDS_SETTING_LEVEL_1 = 1;
pub const PasswordEncodingUTF8 = 0;
pub const PasswordEncodingUTF16LE = 1;
pub const PasswordEncodingUTF16BE = 2;
pub const RemoteActionCharms = 0;
pub const RemoteActionAppbar = 1;
pub const RemoteActionSnap = 2;
pub const RemoteActionStartScreen = 3;
pub const RemoteActionAppSwitch = 4;
pub const SnapshotEncodingDataUri = 0;
pub const SnapshotFormatPng = 0;
pub const SnapshotFormatJpeg = 1;
pub const SnapshotFormatBmp = 2;
pub const KeyCombinationHome = 0;
pub const KeyCombinationLeft = 1;
pub const KeyCombinationUp = 2;
pub const KeyCombinationRight = 3;
pub const KeyCombinationDown = 4;
pub const KeyCombinationScroll = 5;

pub const aliases = struct {
    pub const WTS_SECURITY_FLAGS = u32;
    pub const AE_POSITION_FLAGS = i32;
    pub const AAAuthSchemes = i32;
    pub const AAAccountingDataType = i32;
    pub const SESSION_TIMEOUT_ACTION_TYPE = i32;
    pub const PolicyAttributeType = i32;
    pub const AATrustClassID = i32;
    pub const WTS_CONNECTSTATE_CLASS = i32;
    pub const WTS_INFO_CLASS = i32;
    pub const WTS_CONFIG_CLASS = i32;
    pub const WTS_CONFIG_SOURCE = i32;
    pub const WTS_VIRTUAL_CLASS = i32;
    pub const WTS_TYPE_CLASS = i32;
    pub const WTSSBX_MACHINE_DRAIN = i32;
    pub const WTSSBX_MACHINE_SESSION_MODE = i32;
    pub const WTSSBX_ADDRESS_FAMILY = i32;
    pub const WTSSBX_MACHINE_STATE = i32;
    pub const WTSSBX_SESSION_STATE = i32;
    pub const WTSSBX_NOTIFICATION_TYPE = i32;
    pub const TSSD_AddrV46Type = i32;
    pub const TSSB_NOTIFICATION_TYPE = i32;
    pub const TARGET_STATE = i32;
    pub const TARGET_CHANGE_TYPE = i32;
    pub const TARGET_TYPE = i32;
    pub const TARGET_PATCH_STATE = i32;
    pub const CLIENT_MESSAGE_TYPE = i32;
    pub const CONNECTION_CHANGE_NOTIFICATION = i32;
    pub const RD_FARM_TYPE = i32;
    pub const PLUGIN_TYPE = i32;
    pub const TSSESSION_STATE = i32;
    pub const TARGET_OWNER = i32;
    pub const VM_NOTIFY_STATUS = i32;
    pub const VM_HOST_NOTIFY_STATUS = i32;
    pub const RDV_TASK_STATUS = i32;
    pub const TS_SB_SORT_BY = i32;
    pub const TSPUB_PLUGIN_PD_RESOLUTION_TYPE = i32;
    pub const TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE = i32;
    pub const WRdsGraphicsChannelType = i32;
    pub const WTS_RCM_SERVICE_STATE = i32;
    pub const WTS_RCM_DRAIN_STATE = i32;
    pub const WTS_LOGON_ERROR_REDIRECTOR_RESPONSE = i32;
    pub const WTS_CERT_TYPE = i32;
    pub const WRDS_CONNECTION_SETTING_LEVEL = i32;
    pub const WRDS_LISTENER_SETTING_LEVEL = i32;
    pub const WRDS_SETTING_TYPE = i32;
    pub const WRDS_SETTING_STATUS = i32;
    pub const WRDS_SETTING_LEVEL = i32;
    pub const PasswordEncodingType = i32;
    pub const RemoteActionType = i32;
    pub const SnapshotEncodingType = i32;
    pub const SnapshotFormatType = i32;
    pub const KeyCombinationType = i32;
    pub const WTS_CLOUD_AUTH_HANDLE = ?*anyopaque;
    pub const PCHANNEL_INIT_EVENT_FN = ?*const anyopaque;
    pub const PCHANNEL_OPEN_EVENT_FN = ?*const anyopaque;
    pub const PVIRTUALCHANNELINIT = ?*const anyopaque;
    pub const PVIRTUALCHANNELOPEN = ?*const anyopaque;
    pub const PVIRTUALCHANNELCLOSE = ?*const anyopaque;
    pub const PVIRTUALCHANNELWRITE = ?*const anyopaque;
    pub const PVIRTUALCHANNELENTRY = ?*const anyopaque;
};
