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
    .{ "WscRegisterForChanges", MethodRecord{ .library = "WSCAPI", .import = "WscRegisterForChanges", .signature = "\x00\x04\x11\x79\x0f\x01\x0f\x11\x80\x85\x12\x9f\x81\x0f\x01" } },
    .{ "WscUnRegisterChanges", MethodRecord{ .library = "WSCAPI", .import = "WscUnRegisterChanges", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "WscRegisterForUserNotifications", MethodRecord{ .library = "WSCAPI", .import = "WscRegisterForUserNotifications", .signature = "\x00\x00\x11\x79" } },
    .{ "WscGetSecurityProviderHealth", MethodRecord{ .library = "WSCAPI", .import = "WscGetSecurityProviderHealth", .signature = "\x00\x02\x11\x79\x09\x0f\x11\xc0\x00\xa3\x21" } },
    .{ "WscQueryAntiMalwareUri", MethodRecord{ .library = "WSCAPI", .import = "WscQueryAntiMalwareUri", .signature = "\x00\x00\x11\x79" } },
    .{ "WscGetAntiMalwareUri", MethodRecord{ .library = "WSCAPI", .import = "WscGetAntiMalwareUri", .signature = "\x00\x01\x11\x79\x0f\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x1f81 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "LPTHREAD_START_ROUTINE" },
        0xa321 => TypeRefEntry{ .namespace = "Windows.Win32.System.SecurityCenter", .name = "WSC_SECURITY_PROVIDER_HEALTH" },
        else => null,
    };
}

pub const WSC_SECURITY_PRODUCT_SUBSTATUS_NOT_SET = 0;
pub const WSC_SECURITY_PRODUCT_SUBSTATUS_NO_ACTION = 1;
pub const WSC_SECURITY_PRODUCT_SUBSTATUS_ACTION_RECOMMENDED = 2;
pub const WSC_SECURITY_PRODUCT_SUBSTATUS_ACTION_NEEDED = 3;
pub const WSC_SECURITY_PRODUCT_STATE_ON = 0;
pub const WSC_SECURITY_PRODUCT_STATE_OFF = 1;
pub const WSC_SECURITY_PRODUCT_STATE_SNOOZED = 2;
pub const WSC_SECURITY_PRODUCT_STATE_EXPIRED = 3;
pub const SECURITY_PRODUCT_TYPE_ANTIVIRUS = 0;
pub const SECURITY_PRODUCT_TYPE_FIREWALL = 1;
pub const SECURITY_PRODUCT_TYPE_ANTISPYWARE = 2;
pub const WSC_SECURITY_PRODUCT_OUT_OF_DATE = 0;
pub const WSC_SECURITY_PRODUCT_UP_TO_DATE = 1;
pub const WSC_SECURITY_PROVIDER_FIREWALL = 1;
pub const WSC_SECURITY_PROVIDER_AUTOUPDATE_SETTINGS = 2;
pub const WSC_SECURITY_PROVIDER_ANTIVIRUS = 4;
pub const WSC_SECURITY_PROVIDER_ANTISPYWARE = 8;
pub const WSC_SECURITY_PROVIDER_INTERNET_SETTINGS = 16;
pub const WSC_SECURITY_PROVIDER_USER_ACCOUNT_CONTROL = 32;
pub const WSC_SECURITY_PROVIDER_SERVICE = 64;
pub const WSC_SECURITY_PROVIDER_NONE = 0;
pub const WSC_SECURITY_PROVIDER_ALL = 127;
pub const WSC_SECURITY_PROVIDER_HEALTH_GOOD = 0;
pub const WSC_SECURITY_PROVIDER_HEALTH_NOTMONITORED = 1;
pub const WSC_SECURITY_PROVIDER_HEALTH_POOR = 2;
pub const WSC_SECURITY_PROVIDER_HEALTH_SNOOZE = 3;

pub const aliases = struct {
    pub const WSC_SECURITY_PRODUCT_SUBSTATUS = i32;
    pub const WSC_SECURITY_PRODUCT_STATE = i32;
    pub const SECURITY_PRODUCT_TYPE = i32;
    pub const WSC_SECURITY_SIGNATURE_STATUS = i32;
    pub const WSC_SECURITY_PROVIDER = i32;
    pub const WSC_SECURITY_PROVIDER_HEALTH = i32;
};
