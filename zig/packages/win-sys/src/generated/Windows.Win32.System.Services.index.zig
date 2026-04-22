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
    .{ "SetServiceBits", MethodRecord{ .library = "ADVAPI32", .import = "SetServiceBits", .signature = "\x00\x04\x11\x59\x11\x9d\xb1\x09\x11\x59\x11\x59" } },
    .{ "ChangeServiceConfigA", MethodRecord{ .library = "ADVAPI32", .import = "ChangeServiceConfigA", .signature = "\x00\x0b\x11\x59\x11\x9d\xb5\x11\x9d\xb9\x11\x9d\xbd\x11\x9d\xc1\x11\x3d\x11\x3d\x0f\x09\x11\x3d\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "ChangeServiceConfigW", MethodRecord{ .library = "ADVAPI32", .import = "ChangeServiceConfigW", .signature = "\x00\x0b\x11\x59\x11\x9d\xb5\x11\x9d\xb9\x11\x9d\xbd\x11\x9d\xc1\x11\x05\x11\x05\x0f\x09\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "ChangeServiceConfig2A", MethodRecord{ .library = "ADVAPI32", .import = "ChangeServiceConfig2A", .signature = "\x00\x03\x11\x59\x11\x9d\xb5\x11\x9d\xc5\x0f\x01" } },
    .{ "ChangeServiceConfig2W", MethodRecord{ .library = "ADVAPI32", .import = "ChangeServiceConfig2W", .signature = "\x00\x03\x11\x59\x11\x9d\xb5\x11\x9d\xc5\x0f\x01" } },
    .{ "CloseServiceHandle", MethodRecord{ .library = "ADVAPI32", .import = "CloseServiceHandle", .signature = "\x00\x01\x11\x59\x11\x9d\xb5" } },
    .{ "ControlService", MethodRecord{ .library = "ADVAPI32", .import = "ControlService", .signature = "\x00\x03\x11\x59\x11\x9d\xb5\x09\x0f\x11\x9d\xc9" } },
    .{ "CreateServiceA", MethodRecord{ .library = "ADVAPI32", .import = "CreateServiceA", .signature = "\x00\x0d\x11\x9d\xb5\x11\x9d\xb5\x11\x3d\x11\x3d\x09\x11\x9d\xb9\x11\x9d\xbd\x11\x9d\xc1\x11\x3d\x11\x3d\x0f\x09\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "CreateServiceW", MethodRecord{ .library = "ADVAPI32", .import = "CreateServiceW", .signature = "\x00\x0d\x11\x9d\xb5\x11\x9d\xb5\x11\x05\x11\x05\x09\x11\x9d\xb9\x11\x9d\xbd\x11\x9d\xc1\x11\x05\x11\x05\x0f\x09\x11\x05\x11\x05\x11\x05" } },
    .{ "DeleteService", MethodRecord{ .library = "ADVAPI32", .import = "DeleteService", .signature = "\x00\x01\x11\x59\x11\x9d\xb5" } },
    .{ "EnumDependentServicesA", MethodRecord{ .library = "ADVAPI32", .import = "EnumDependentServicesA", .signature = "\x00\x06\x11\x59\x11\x9d\xb5\x11\x9d\xcd\x0f\x11\x9d\xd1\x09\x0f\x09\x0f\x09" } },
    .{ "EnumDependentServicesW", MethodRecord{ .library = "ADVAPI32", .import = "EnumDependentServicesW", .signature = "\x00\x06\x11\x59\x11\x9d\xb5\x11\x9d\xcd\x0f\x11\x9d\xd5\x09\x0f\x09\x0f\x09" } },
    .{ "EnumServicesStatusA", MethodRecord{ .library = "ADVAPI32", .import = "EnumServicesStatusA", .signature = "\x00\x08\x11\x59\x11\x9d\xb5\x11\x9d\xb9\x11\x9d\xcd\x0f\x11\x9d\xd1\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "EnumServicesStatusW", MethodRecord{ .library = "ADVAPI32", .import = "EnumServicesStatusW", .signature = "\x00\x08\x11\x59\x11\x9d\xb5\x11\x9d\xb9\x11\x9d\xcd\x0f\x11\x9d\xd5\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "EnumServicesStatusExA", MethodRecord{ .library = "ADVAPI32", .import = "EnumServicesStatusExA", .signature = "\x00\x0a\x11\x59\x11\x9d\xb5\x11\x9d\xd9\x11\x9d\xb9\x11\x9d\xcd\x0f\x05\x09\x0f\x09\x0f\x09\x0f\x09\x11\x3d" } },
    .{ "EnumServicesStatusExW", MethodRecord{ .library = "ADVAPI32", .import = "EnumServicesStatusExW", .signature = "\x00\x0a\x11\x59\x11\x9d\xb5\x11\x9d\xd9\x11\x9d\xb9\x11\x9d\xcd\x0f\x05\x09\x0f\x09\x0f\x09\x0f\x09\x11\x05" } },
    .{ "GetServiceKeyNameA", MethodRecord{ .library = "ADVAPI32", .import = "GetServiceKeyNameA", .signature = "\x00\x04\x11\x59\x11\x9d\xb5\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "GetServiceKeyNameW", MethodRecord{ .library = "ADVAPI32", .import = "GetServiceKeyNameW", .signature = "\x00\x04\x11\x59\x11\x9d\xb5\x11\x05\x11\x05\x0f\x09" } },
    .{ "GetServiceDisplayNameA", MethodRecord{ .library = "ADVAPI32", .import = "GetServiceDisplayNameA", .signature = "\x00\x04\x11\x59\x11\x9d\xb5\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "GetServiceDisplayNameW", MethodRecord{ .library = "ADVAPI32", .import = "GetServiceDisplayNameW", .signature = "\x00\x04\x11\x59\x11\x9d\xb5\x11\x05\x11\x05\x0f\x09" } },
    .{ "LockServiceDatabase", MethodRecord{ .library = "ADVAPI32", .import = "LockServiceDatabase", .signature = "\x00\x01\x0f\x01\x11\x9d\xb5" } },
    .{ "NotifyBootConfigStatus", MethodRecord{ .library = "ADVAPI32", .import = "NotifyBootConfigStatus", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "OpenSCManagerA", MethodRecord{ .library = "ADVAPI32", .import = "OpenSCManagerA", .signature = "\x00\x03\x11\x9d\xb5\x11\x3d\x11\x3d\x09" } },
    .{ "OpenSCManagerW", MethodRecord{ .library = "ADVAPI32", .import = "OpenSCManagerW", .signature = "\x00\x03\x11\x9d\xb5\x11\x05\x11\x05\x09" } },
    .{ "OpenServiceA", MethodRecord{ .library = "ADVAPI32", .import = "OpenServiceA", .signature = "\x00\x03\x11\x9d\xb5\x11\x9d\xb5\x11\x3d\x09" } },
    .{ "OpenServiceW", MethodRecord{ .library = "ADVAPI32", .import = "OpenServiceW", .signature = "\x00\x03\x11\x9d\xb5\x11\x9d\xb5\x11\x05\x09" } },
    .{ "QueryServiceConfigA", MethodRecord{ .library = "ADVAPI32", .import = "QueryServiceConfigA", .signature = "\x00\x04\x11\x59\x11\x9d\xb5\x0f\x11\x9d\xdd\x09\x0f\x09" } },
    .{ "QueryServiceConfigW", MethodRecord{ .library = "ADVAPI32", .import = "QueryServiceConfigW", .signature = "\x00\x04\x11\x59\x11\x9d\xb5\x0f\x11\x9d\xe1\x09\x0f\x09" } },
    .{ "QueryServiceConfig2A", MethodRecord{ .library = "ADVAPI32", .import = "QueryServiceConfig2A", .signature = "\x00\x05\x11\x59\x11\x9d\xb5\x11\x9d\xc5\x0f\x05\x09\x0f\x09" } },
    .{ "QueryServiceConfig2W", MethodRecord{ .library = "ADVAPI32", .import = "QueryServiceConfig2W", .signature = "\x00\x05\x11\x59\x11\x9d\xb5\x11\x9d\xc5\x0f\x05\x09\x0f\x09" } },
    .{ "QueryServiceLockStatusA", MethodRecord{ .library = "ADVAPI32", .import = "QueryServiceLockStatusA", .signature = "\x00\x04\x11\x59\x11\x9d\xb5\x0f\x11\x9d\xe5\x09\x0f\x09" } },
    .{ "QueryServiceLockStatusW", MethodRecord{ .library = "ADVAPI32", .import = "QueryServiceLockStatusW", .signature = "\x00\x04\x11\x59\x11\x9d\xb5\x0f\x11\x9d\xe9\x09\x0f\x09" } },
    .{ "QueryServiceObjectSecurity", MethodRecord{ .library = "ADVAPI32", .import = "QueryServiceObjectSecurity", .signature = "\x00\x05\x11\x59\x11\x9d\xb5\x09\x11\x82\xad\x09\x0f\x09" } },
    .{ "QueryServiceStatus", MethodRecord{ .library = "ADVAPI32", .import = "QueryServiceStatus", .signature = "\x00\x02\x11\x59\x11\x9d\xb5\x0f\x11\x9d\xc9" } },
    .{ "QueryServiceStatusEx", MethodRecord{ .library = "ADVAPI32", .import = "QueryServiceStatusEx", .signature = "\x00\x05\x11\x59\x11\x9d\xb5\x11\x9d\xed\x0f\x05\x09\x0f\x09" } },
    .{ "RegisterServiceCtrlHandlerA", MethodRecord{ .library = "ADVAPI32", .import = "RegisterServiceCtrlHandlerA", .signature = "\x00\x02\x11\x9d\xb1\x11\x3d\x12\x9d\xf1" } },
    .{ "RegisterServiceCtrlHandlerW", MethodRecord{ .library = "ADVAPI32", .import = "RegisterServiceCtrlHandlerW", .signature = "\x00\x02\x11\x9d\xb1\x11\x05\x12\x9d\xf1" } },
    .{ "RegisterServiceCtrlHandlerExA", MethodRecord{ .library = "ADVAPI32", .import = "RegisterServiceCtrlHandlerExA", .signature = "\x00\x03\x11\x9d\xb1\x11\x3d\x12\x9d\xf5\x0f\x01" } },
    .{ "RegisterServiceCtrlHandlerExW", MethodRecord{ .library = "ADVAPI32", .import = "RegisterServiceCtrlHandlerExW", .signature = "\x00\x03\x11\x9d\xb1\x11\x05\x12\x9d\xf5\x0f\x01" } },
    .{ "SetServiceObjectSecurity", MethodRecord{ .library = "ADVAPI32", .import = "SetServiceObjectSecurity", .signature = "\x00\x03\x11\x59\x11\x9d\xb5\x11\x84\xf9\x11\x82\xad" } },
    .{ "SetServiceStatus", MethodRecord{ .library = "ADVAPI32", .import = "SetServiceStatus", .signature = "\x00\x02\x11\x59\x11\x9d\xb1\x0f\x11\x9d\xc9" } },
    .{ "StartServiceCtrlDispatcherA", MethodRecord{ .library = "ADVAPI32", .import = "StartServiceCtrlDispatcherA", .signature = "\x00\x01\x11\x59\x0f\x11\x9d\xf9" } },
    .{ "StartServiceCtrlDispatcherW", MethodRecord{ .library = "ADVAPI32", .import = "StartServiceCtrlDispatcherW", .signature = "\x00\x01\x11\x59\x0f\x11\x9d\xfd" } },
    .{ "StartServiceA", MethodRecord{ .library = "ADVAPI32", .import = "StartServiceA", .signature = "\x00\x03\x11\x59\x11\x9d\xb5\x09\x0f\x11\x3d" } },
    .{ "StartServiceW", MethodRecord{ .library = "ADVAPI32", .import = "StartServiceW", .signature = "\x00\x03\x11\x59\x11\x9d\xb5\x09\x0f\x11\x05" } },
    .{ "UnlockServiceDatabase", MethodRecord{ .library = "ADVAPI32", .import = "UnlockServiceDatabase", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "NotifyServiceStatusChangeA", MethodRecord{ .library = "ADVAPI32", .import = "NotifyServiceStatusChangeA", .signature = "\x00\x03\x09\x11\x9d\xb5\x11\x9e\x01\x0f\x11\x9e\x05" } },
    .{ "NotifyServiceStatusChangeW", MethodRecord{ .library = "ADVAPI32", .import = "NotifyServiceStatusChangeW", .signature = "\x00\x03\x09\x11\x9d\xb5\x11\x9e\x01\x0f\x11\x9e\x09" } },
    .{ "ControlServiceExA", MethodRecord{ .library = "ADVAPI32", .import = "ControlServiceExA", .signature = "\x00\x04\x11\x59\x11\x9d\xb5\x09\x09\x0f\x01" } },
    .{ "ControlServiceExW", MethodRecord{ .library = "ADVAPI32", .import = "ControlServiceExW", .signature = "\x00\x04\x11\x59\x11\x9d\xb5\x09\x09\x0f\x01" } },
    .{ "QueryServiceDynamicInformation", MethodRecord{ .library = "ADVAPI32", .import = "QueryServiceDynamicInformation", .signature = "\x00\x03\x11\x59\x11\x9d\xb1\x09\x0f\x0f\x01" } },
    .{ "SubscribeServiceChangeNotifications", MethodRecord{ .library = "SecHost", .import = "SubscribeServiceChangeNotifications", .signature = "\x00\x05\x09\x11\x9d\xb5\x11\x9e\x0d\x12\x9e\x11\x0f\x01\x0f\x11\x9e\x15" } },
    .{ "UnsubscribeServiceChangeNotifications", MethodRecord{ .library = "SecHost", .import = "UnsubscribeServiceChangeNotifications", .signature = "\x00\x01\x01\x11\x9e\x15" } },
    .{ "WaitServiceState", MethodRecord{ .library = "ADVAPI32", .import = "WaitServiceState", .signature = "\x00\x04\x09\x11\x9d\xb5\x09\x09\x11\x80\x85" } },
    .{ "GetServiceRegistryStateKey", MethodRecord{ .library = "api-ms-win-service-core-l1-1-3", .import = "GetServiceRegistryStateKey", .signature = "\x00\x04\x09\x11\x9d\xb1\x11\x9e\x19\x09\x0f\x11\x55" } },
    .{ "GetServiceDirectory", MethodRecord{ .library = "api-ms-win-service-core-l1-1-4", .import = "GetServiceDirectory", .signature = "\x00\x05\x09\x11\x9d\xb1\x11\x9e\x1d\x11\x05\x09\x0f\x09" } },
    .{ "GetSharedServiceRegistryStateKey", MethodRecord{ .library = "api-ms-win-service-core-l1-1-5", .import = "GetSharedServiceRegistryStateKey", .signature = "\x00\x04\x09\x11\x9d\xb5\x11\x9e\x21\x09\x0f\x11\x55" } },
    .{ "GetSharedServiceDirectory", MethodRecord{ .library = "api-ms-win-service-core-l1-1-5", .import = "GetSharedServiceDirectory", .signature = "\x00\x05\x09\x11\x9d\xb5\x11\x9e\x25\x11\x05\x09\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x55 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "HKEY" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x4f9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "OBJECT_SECURITY_INFORMATION" },
        0x1db1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SERVICE_STATUS_HANDLE" },
        0x1db5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SC_HANDLE" },
        0x1db9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "ENUM_SERVICE_TYPE" },
        0x1dbd => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SERVICE_START_TYPE" },
        0x1dc1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SERVICE_ERROR" },
        0x1dc5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SERVICE_CONFIG" },
        0x1dc9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SERVICE_STATUS" },
        0x1dcd => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "ENUM_SERVICE_STATE" },
        0x1dd1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "ENUM_SERVICE_STATUSA" },
        0x1dd5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "ENUM_SERVICE_STATUSW" },
        0x1dd9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SC_ENUM_TYPE" },
        0x1ddd => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "QUERY_SERVICE_CONFIGA" },
        0x1de1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "QUERY_SERVICE_CONFIGW" },
        0x1de5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "QUERY_SERVICE_LOCK_STATUSA" },
        0x1de9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "QUERY_SERVICE_LOCK_STATUSW" },
        0x1ded => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SC_STATUS_TYPE" },
        0x1df1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "LPHANDLER_FUNCTION" },
        0x1df5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "LPHANDLER_FUNCTION_EX" },
        0x1df9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SERVICE_TABLE_ENTRYA" },
        0x1dfd => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SERVICE_TABLE_ENTRYW" },
        0x1e01 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SERVICE_NOTIFY" },
        0x1e05 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SERVICE_NOTIFY_2A" },
        0x1e09 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SERVICE_NOTIFY_2W" },
        0x1e0d => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SC_EVENT_TYPE" },
        0x1e11 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "PSC_NOTIFICATION_CALLBACK" },
        0x1e15 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "PSC_NOTIFICATION_REGISTRATION" },
        0x1e19 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SERVICE_REGISTRY_STATE_TYPE" },
        0x1e1d => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SERVICE_DIRECTORY_TYPE" },
        0x1e21 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SERVICE_SHARED_REGISTRY_STATE_TYPE" },
        0x1e25 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SERVICE_SHARED_DIRECTORY_TYPE" },
        else => null,
    };
}

pub const SERVICE_ALL_ACCESS = 983551;
pub const SC_MANAGER_ALL_ACCESS = 983103;
pub const SERVICE_NO_CHANGE = 4294967295;
pub const SERVICE_CONTROL_STOP = 1;
pub const SERVICE_CONTROL_PAUSE = 2;
pub const SERVICE_CONTROL_CONTINUE = 3;
pub const SERVICE_CONTROL_INTERROGATE = 4;
pub const SERVICE_CONTROL_SHUTDOWN = 5;
pub const SERVICE_CONTROL_PARAMCHANGE = 6;
pub const SERVICE_CONTROL_NETBINDADD = 7;
pub const SERVICE_CONTROL_NETBINDREMOVE = 8;
pub const SERVICE_CONTROL_NETBINDENABLE = 9;
pub const SERVICE_CONTROL_NETBINDDISABLE = 10;
pub const SERVICE_CONTROL_DEVICEEVENT = 11;
pub const SERVICE_CONTROL_HARDWAREPROFILECHANGE = 12;
pub const SERVICE_CONTROL_POWEREVENT = 13;
pub const SERVICE_CONTROL_SESSIONCHANGE = 14;
pub const SERVICE_CONTROL_PRESHUTDOWN = 15;
pub const SERVICE_CONTROL_TIMECHANGE = 16;
pub const SERVICE_CONTROL_TRIGGEREVENT = 32;
pub const SERVICE_CONTROL_LOWRESOURCES = 96;
pub const SERVICE_CONTROL_SYSTEMLOWRESOURCES = 97;
pub const SERVICE_ACCEPT_STOP = 1;
pub const SERVICE_ACCEPT_PAUSE_CONTINUE = 2;
pub const SERVICE_ACCEPT_SHUTDOWN = 4;
pub const SERVICE_ACCEPT_PARAMCHANGE = 8;
pub const SERVICE_ACCEPT_NETBINDCHANGE = 16;
pub const SERVICE_ACCEPT_HARDWAREPROFILECHANGE = 32;
pub const SERVICE_ACCEPT_POWEREVENT = 64;
pub const SERVICE_ACCEPT_SESSIONCHANGE = 128;
pub const SERVICE_ACCEPT_PRESHUTDOWN = 256;
pub const SERVICE_ACCEPT_TIMECHANGE = 512;
pub const SERVICE_ACCEPT_TRIGGEREVENT = 1024;
pub const SERVICE_ACCEPT_USER_LOGOFF = 2048;
pub const SERVICE_ACCEPT_LOWRESOURCES = 8192;
pub const SERVICE_ACCEPT_SYSTEMLOWRESOURCES = 16384;
pub const SC_MANAGER_CONNECT = 1;
pub const SC_MANAGER_CREATE_SERVICE = 2;
pub const SC_MANAGER_ENUMERATE_SERVICE = 4;
pub const SC_MANAGER_LOCK = 8;
pub const SC_MANAGER_QUERY_LOCK_STATUS = 16;
pub const SC_MANAGER_MODIFY_BOOT_CONFIG = 32;
pub const SERVICE_QUERY_CONFIG = 1;
pub const SERVICE_CHANGE_CONFIG = 2;
pub const SERVICE_QUERY_STATUS = 4;
pub const SERVICE_ENUMERATE_DEPENDENTS = 8;
pub const SERVICE_START = 16;
pub const SERVICE_STOP = 32;
pub const SERVICE_PAUSE_CONTINUE = 64;
pub const SERVICE_INTERROGATE = 128;
pub const SERVICE_USER_DEFINED_CONTROL = 256;
pub const SERVICE_NOTIFY_STATUS_CHANGE_1 = 1;
pub const SERVICE_NOTIFY_STATUS_CHANGE_2 = 2;
pub const SERVICE_NOTIFY_STATUS_CHANGE = 2;
pub const SERVICE_STOP_REASON_FLAG_MIN = 0;
pub const SERVICE_STOP_REASON_FLAG_UNPLANNED = 268435456;
pub const SERVICE_STOP_REASON_FLAG_CUSTOM = 536870912;
pub const SERVICE_STOP_REASON_FLAG_PLANNED = 1073741824;
pub const SERVICE_STOP_REASON_FLAG_MAX = 2147483648;
pub const SERVICE_STOP_REASON_MAJOR_MIN = 0;
pub const SERVICE_STOP_REASON_MAJOR_OTHER = 65536;
pub const SERVICE_STOP_REASON_MAJOR_HARDWARE = 131072;
pub const SERVICE_STOP_REASON_MAJOR_OPERATINGSYSTEM = 196608;
pub const SERVICE_STOP_REASON_MAJOR_SOFTWARE = 262144;
pub const SERVICE_STOP_REASON_MAJOR_APPLICATION = 327680;
pub const SERVICE_STOP_REASON_MAJOR_NONE = 393216;
pub const SERVICE_STOP_REASON_MAJOR_MAX = 458752;
pub const SERVICE_STOP_REASON_MAJOR_MIN_CUSTOM = 4194304;
pub const SERVICE_STOP_REASON_MAJOR_MAX_CUSTOM = 16711680;
pub const SERVICE_STOP_REASON_MINOR_MIN = 0;
pub const SERVICE_STOP_REASON_MINOR_OTHER = 1;
pub const SERVICE_STOP_REASON_MINOR_MAINTENANCE = 2;
pub const SERVICE_STOP_REASON_MINOR_INSTALLATION = 3;
pub const SERVICE_STOP_REASON_MINOR_UPGRADE = 4;
pub const SERVICE_STOP_REASON_MINOR_RECONFIG = 5;
pub const SERVICE_STOP_REASON_MINOR_HUNG = 6;
pub const SERVICE_STOP_REASON_MINOR_UNSTABLE = 7;
pub const SERVICE_STOP_REASON_MINOR_DISK = 8;
pub const SERVICE_STOP_REASON_MINOR_NETWORKCARD = 9;
pub const SERVICE_STOP_REASON_MINOR_ENVIRONMENT = 10;
pub const SERVICE_STOP_REASON_MINOR_HARDWARE_DRIVER = 11;
pub const SERVICE_STOP_REASON_MINOR_OTHERDRIVER = 12;
pub const SERVICE_STOP_REASON_MINOR_SERVICEPACK = 13;
pub const SERVICE_STOP_REASON_MINOR_SOFTWARE_UPDATE = 14;
pub const SERVICE_STOP_REASON_MINOR_SECURITYFIX = 15;
pub const SERVICE_STOP_REASON_MINOR_SECURITY = 16;
pub const SERVICE_STOP_REASON_MINOR_NETWORK_CONNECTIVITY = 17;
pub const SERVICE_STOP_REASON_MINOR_WMI = 18;
pub const SERVICE_STOP_REASON_MINOR_SERVICEPACK_UNINSTALL = 19;
pub const SERVICE_STOP_REASON_MINOR_SOFTWARE_UPDATE_UNINSTALL = 20;
pub const SERVICE_STOP_REASON_MINOR_SECURITYFIX_UNINSTALL = 21;
pub const SERVICE_STOP_REASON_MINOR_MMC = 22;
pub const SERVICE_STOP_REASON_MINOR_NONE = 23;
pub const SERVICE_STOP_REASON_MINOR_MEMOTYLIMIT = 24;
pub const SERVICE_STOP_REASON_MINOR_MAX = 25;
pub const SERVICE_STOP_REASON_MINOR_MIN_CUSTOM = 256;
pub const SERVICE_STOP_REASON_MINOR_MAX_CUSTOM = 65535;
pub const SERVICE_CONTROL_STATUS_REASON_INFO = 1;
pub const SERVICE_SID_TYPE_NONE = 0;
pub const SERVICE_SID_TYPE_UNRESTRICTED = 1;
pub const SERVICE_TRIGGER_TYPE_CUSTOM_SYSTEM_STATE_CHANGE = 7;
pub const SERVICE_TRIGGER_TYPE_AGGREGATE = 30;
pub const SERVICE_START_REASON_DEMAND = 1;
pub const SERVICE_START_REASON_AUTO = 2;
pub const SERVICE_START_REASON_TRIGGER = 4;
pub const SERVICE_START_REASON_RESTART_ON_FAILURE = 8;
pub const SERVICE_START_REASON_DELAYEDAUTO = 16;
pub const SERVICE_DYNAMIC_INFORMATION_LEVEL_START_REASON = 1;
pub const SERVICE_LAUNCH_PROTECTED_NONE = 0;
pub const SERVICE_LAUNCH_PROTECTED_WINDOWS = 1;
pub const SERVICE_LAUNCH_PROTECTED_WINDOWS_LIGHT = 2;
pub const SERVICE_LAUNCH_PROTECTED_ANTIMALWARE_LIGHT = 3;
pub const SERVICE_ACTIVE = 1;
pub const SERVICE_INACTIVE = 2;
pub const SERVICE_STATE_ALL = 3;
pub const SERVICE_ERROR_CRITICAL = 3;
pub const SERVICE_ERROR_IGNORE = 0;
pub const SERVICE_ERROR_NORMAL = 1;
pub const SERVICE_ERROR_SEVERE = 2;
pub const SERVICE_CONFIG_DELAYED_AUTO_START_INFO = 3;
pub const SERVICE_CONFIG_DESCRIPTION = 1;
pub const SERVICE_CONFIG_FAILURE_ACTIONS = 2;
pub const SERVICE_CONFIG_FAILURE_ACTIONS_FLAG = 4;
pub const SERVICE_CONFIG_PREFERRED_NODE = 9;
pub const SERVICE_CONFIG_PRESHUTDOWN_INFO = 7;
pub const SERVICE_CONFIG_REQUIRED_PRIVILEGES_INFO = 6;
pub const SERVICE_CONFIG_SERVICE_SID_INFO = 5;
pub const SERVICE_CONFIG_TRIGGER_INFO = 8;
pub const SERVICE_CONFIG_LAUNCH_PROTECTED = 12;
pub const SERVICE_DRIVER = 11;
pub const SERVICE_KERNEL_DRIVER = 1;
pub const SERVICE_WIN32 = 48;
pub const SERVICE_WIN32_SHARE_PROCESS = 32;
pub const SERVICE_ADAPTER = 4;
pub const SERVICE_FILE_SYSTEM_DRIVER = 2;
pub const SERVICE_RECOGNIZER_DRIVER = 8;
pub const SERVICE_WIN32_OWN_PROCESS = 16;
pub const SERVICE_USER_OWN_PROCESS = 80;
pub const SERVICE_USER_SHARE_PROCESS = 96;
pub const SERVICE_AUTO_START = 2;
pub const SERVICE_BOOT_START = 0;
pub const SERVICE_DEMAND_START = 3;
pub const SERVICE_DISABLED = 4;
pub const SERVICE_SYSTEM_START = 1;
pub const SERVICE_NOTIFY_CREATED = 128;
pub const SERVICE_NOTIFY_CONTINUE_PENDING = 16;
pub const SERVICE_NOTIFY_DELETE_PENDING = 512;
pub const SERVICE_NOTIFY_DELETED = 256;
pub const SERVICE_NOTIFY_PAUSE_PENDING = 32;
pub const SERVICE_NOTIFY_PAUSED = 64;
pub const SERVICE_NOTIFY_RUNNING = 8;
pub const SERVICE_NOTIFY_START_PENDING = 2;
pub const SERVICE_NOTIFY_STOP_PENDING = 4;
pub const SERVICE_NOTIFY_STOPPED = 1;
pub const SERVICE_RUNS_IN_NON_SYSTEM_OR_NOT_RUNNING = 0;
pub const SERVICE_RUNS_IN_SYSTEM_PROCESS = 1;
pub const SERVICE_TRIGGER_ACTION_SERVICE_START = 1;
pub const SERVICE_TRIGGER_ACTION_SERVICE_STOP = 2;
pub const SERVICE_TRIGGER_TYPE_CUSTOM = 20;
pub const SERVICE_TRIGGER_TYPE_DEVICE_INTERFACE_ARRIVAL = 1;
pub const SERVICE_TRIGGER_TYPE_DOMAIN_JOIN = 3;
pub const SERVICE_TRIGGER_TYPE_FIREWALL_PORT_EVENT = 4;
pub const SERVICE_TRIGGER_TYPE_GROUP_POLICY = 5;
pub const SERVICE_TRIGGER_TYPE_IP_ADDRESS_AVAILABILITY = 2;
pub const SERVICE_TRIGGER_TYPE_NETWORK_ENDPOINT = 6;
pub const SERVICE_TRIGGER_DATA_TYPE_BINARY = 1;
pub const SERVICE_TRIGGER_DATA_TYPE_STRING = 2;
pub const SERVICE_TRIGGER_DATA_TYPE_LEVEL = 3;
pub const SERVICE_TRIGGER_DATA_TYPE_KEYWORD_ANY = 4;
pub const SERVICE_TRIGGER_DATA_TYPE_KEYWORD_ALL = 5;
pub const SERVICE_CONTINUE_PENDING = 5;
pub const SERVICE_PAUSE_PENDING = 6;
pub const SERVICE_PAUSED = 7;
pub const SERVICE_RUNNING = 4;
pub const SERVICE_START_PENDING = 2;
pub const SERVICE_STOP_PENDING = 3;
pub const SERVICE_STOPPED = 1;
pub const SC_ACTION_NONE = 0;
pub const SC_ACTION_RESTART = 1;
pub const SC_ACTION_REBOOT = 2;
pub const SC_ACTION_RUN_COMMAND = 3;
pub const SC_ACTION_OWN_RESTART = 4;
pub const SC_STATUS_PROCESS_INFO = 0;
pub const SC_ENUM_PROCESS_INFO = 0;
pub const SC_EVENT_DATABASE_CHANGE = 0;
pub const SC_EVENT_PROPERTY_CHANGE = 1;
pub const SC_EVENT_STATUS_CHANGE = 2;
pub const ServiceRegistryStateParameters = 0;
pub const ServiceRegistryStatePersistent = 1;
pub const MaxServiceRegistryStateType = 2;
pub const ServiceDirectoryPersistentState = 0;
pub const ServiceDirectoryTypeMax = 1;
pub const ServiceSharedRegistryPersistentState = 0;
pub const ServiceSharedDirectoryPersistentState = 0;

pub const aliases = struct {
    pub const ENUM_SERVICE_STATE = u32;
    pub const SERVICE_ERROR = u32;
    pub const SERVICE_CONFIG = u32;
    pub const ENUM_SERVICE_TYPE = u32;
    pub const SERVICE_START_TYPE = u32;
    pub const SERVICE_NOTIFY = u32;
    pub const SERVICE_RUNS_IN_PROCESS = u32;
    pub const SERVICE_TRIGGER_ACTION = u32;
    pub const SERVICE_TRIGGER_TYPE = u32;
    pub const SERVICE_TRIGGER_SPECIFIC_DATA_ITEM_DATA_TYPE = u32;
    pub const SERVICE_STATUS_CURRENT_STATE = u32;
    pub const SC_ACTION_TYPE = i32;
    pub const SC_STATUS_TYPE = i32;
    pub const SC_ENUM_TYPE = i32;
    pub const SC_EVENT_TYPE = i32;
    pub const SERVICE_REGISTRY_STATE_TYPE = i32;
    pub const SERVICE_DIRECTORY_TYPE = i32;
    pub const SERVICE_SHARED_REGISTRY_STATE_TYPE = i32;
    pub const SERVICE_SHARED_DIRECTORY_TYPE = i32;
    pub const SC_HANDLE = ?*anyopaque;
    pub const SERVICE_STATUS_HANDLE = ?*anyopaque;
    pub const PSC_NOTIFICATION_REGISTRATION = isize;
};
