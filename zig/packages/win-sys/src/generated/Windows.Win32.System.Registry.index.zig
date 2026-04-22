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
    .{ "RegCloseKey", MethodRecord{ .library = "ADVAPI32", .import = "RegCloseKey", .signature = "\x00\x01\x11\x81\x01\x11\x55" } },
    .{ "RegOverridePredefKey", MethodRecord{ .library = "ADVAPI32", .import = "RegOverridePredefKey", .signature = "\x00\x02\x11\x81\x01\x11\x55\x11\x55" } },
    .{ "RegOpenUserClassesRoot", MethodRecord{ .library = "ADVAPI32", .import = "RegOpenUserClassesRoot", .signature = "\x00\x04\x11\x81\x01\x11\x80\x85\x09\x09\x0f\x11\x55" } },
    .{ "RegOpenCurrentUser", MethodRecord{ .library = "ADVAPI32", .import = "RegOpenCurrentUser", .signature = "\x00\x02\x11\x81\x01\x09\x0f\x11\x55" } },
    .{ "RegDisablePredefinedCache", MethodRecord{ .library = "ADVAPI32", .import = "RegDisablePredefinedCache", .signature = "\x00\x00\x11\x81\x01" } },
    .{ "RegDisablePredefinedCacheEx", MethodRecord{ .library = "ADVAPI32", .import = "RegDisablePredefinedCacheEx", .signature = "\x00\x00\x11\x81\x01" } },
    .{ "RegConnectRegistryA", MethodRecord{ .library = "ADVAPI32", .import = "RegConnectRegistryA", .signature = "\x00\x03\x11\x81\x01\x11\x3d\x11\x55\x0f\x11\x55" } },
    .{ "RegConnectRegistryW", MethodRecord{ .library = "ADVAPI32", .import = "RegConnectRegistryW", .signature = "\x00\x03\x11\x81\x01\x11\x05\x11\x55\x0f\x11\x55" } },
    .{ "RegConnectRegistryExA", MethodRecord{ .library = "ADVAPI32", .import = "RegConnectRegistryExA", .signature = "\x00\x04\x08\x11\x3d\x11\x55\x09\x0f\x11\x55" } },
    .{ "RegConnectRegistryExW", MethodRecord{ .library = "ADVAPI32", .import = "RegConnectRegistryExW", .signature = "\x00\x04\x08\x11\x05\x11\x55\x09\x0f\x11\x55" } },
    .{ "RegCreateKeyA", MethodRecord{ .library = "ADVAPI32", .import = "RegCreateKeyA", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x3d\x0f\x11\x55" } },
    .{ "RegCreateKeyW", MethodRecord{ .library = "ADVAPI32", .import = "RegCreateKeyW", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x05\x0f\x11\x55" } },
    .{ "RegCreateKeyExA", MethodRecord{ .library = "ADVAPI32", .import = "RegCreateKeyExA", .signature = "\x00\x09\x11\x81\x01\x11\x55\x11\x3d\x09\x11\x3d\x11\x9a\x91\x11\x9a\x95\x0f\x11\x8b\xb5\x0f\x11\x55\x0f\x11\x9a\x99" } },
    .{ "RegCreateKeyExW", MethodRecord{ .library = "ADVAPI32", .import = "RegCreateKeyExW", .signature = "\x00\x09\x11\x81\x01\x11\x55\x11\x05\x09\x11\x05\x11\x9a\x91\x11\x9a\x95\x0f\x11\x8b\xb5\x0f\x11\x55\x0f\x11\x9a\x99" } },
    .{ "RegCreateKeyTransactedA", MethodRecord{ .library = "ADVAPI32", .import = "RegCreateKeyTransactedA", .signature = "\x00\x0b\x11\x81\x01\x11\x55\x11\x3d\x09\x11\x3d\x11\x9a\x91\x11\x9a\x95\x0f\x11\x8b\xb5\x0f\x11\x55\x0f\x11\x9a\x99\x11\x80\x85\x0f\x01" } },
    .{ "RegCreateKeyTransactedW", MethodRecord{ .library = "ADVAPI32", .import = "RegCreateKeyTransactedW", .signature = "\x00\x0b\x11\x81\x01\x11\x55\x11\x05\x09\x11\x05\x11\x9a\x91\x11\x9a\x95\x0f\x11\x8b\xb5\x0f\x11\x55\x0f\x11\x9a\x99\x11\x80\x85\x0f\x01" } },
    .{ "RegDeleteKeyA", MethodRecord{ .library = "ADVAPI32", .import = "RegDeleteKeyA", .signature = "\x00\x02\x11\x81\x01\x11\x55\x11\x3d" } },
    .{ "RegDeleteKeyW", MethodRecord{ .library = "ADVAPI32", .import = "RegDeleteKeyW", .signature = "\x00\x02\x11\x81\x01\x11\x55\x11\x05" } },
    .{ "RegDeleteKeyExA", MethodRecord{ .library = "ADVAPI32", .import = "RegDeleteKeyExA", .signature = "\x00\x04\x11\x81\x01\x11\x55\x11\x3d\x09\x09" } },
    .{ "RegDeleteKeyExW", MethodRecord{ .library = "ADVAPI32", .import = "RegDeleteKeyExW", .signature = "\x00\x04\x11\x81\x01\x11\x55\x11\x05\x09\x09" } },
    .{ "RegDeleteKeyTransactedA", MethodRecord{ .library = "ADVAPI32", .import = "RegDeleteKeyTransactedA", .signature = "\x00\x06\x11\x81\x01\x11\x55\x11\x3d\x09\x09\x11\x80\x85\x0f\x01" } },
    .{ "RegDeleteKeyTransactedW", MethodRecord{ .library = "ADVAPI32", .import = "RegDeleteKeyTransactedW", .signature = "\x00\x06\x11\x81\x01\x11\x55\x11\x05\x09\x09\x11\x80\x85\x0f\x01" } },
    .{ "RegDisableReflectionKey", MethodRecord{ .library = "ADVAPI32", .import = "RegDisableReflectionKey", .signature = "\x00\x01\x11\x81\x01\x11\x55" } },
    .{ "RegEnableReflectionKey", MethodRecord{ .library = "ADVAPI32", .import = "RegEnableReflectionKey", .signature = "\x00\x01\x11\x81\x01\x11\x55" } },
    .{ "RegQueryReflectionKey", MethodRecord{ .library = "ADVAPI32", .import = "RegQueryReflectionKey", .signature = "\x00\x02\x11\x81\x01\x11\x55\x0f\x11\x59" } },
    .{ "RegDeleteValueA", MethodRecord{ .library = "ADVAPI32", .import = "RegDeleteValueA", .signature = "\x00\x02\x11\x81\x01\x11\x55\x11\x3d" } },
    .{ "RegDeleteValueW", MethodRecord{ .library = "ADVAPI32", .import = "RegDeleteValueW", .signature = "\x00\x02\x11\x81\x01\x11\x55\x11\x05" } },
    .{ "RegEnumKeyA", MethodRecord{ .library = "ADVAPI32", .import = "RegEnumKeyA", .signature = "\x00\x04\x11\x81\x01\x11\x55\x09\x11\x3d\x09" } },
    .{ "RegEnumKeyW", MethodRecord{ .library = "ADVAPI32", .import = "RegEnumKeyW", .signature = "\x00\x04\x11\x81\x01\x11\x55\x09\x11\x05\x09" } },
    .{ "RegEnumKeyExA", MethodRecord{ .library = "ADVAPI32", .import = "RegEnumKeyExA", .signature = "\x00\x08\x11\x81\x01\x11\x55\x09\x11\x3d\x0f\x09\x0f\x09\x11\x3d\x0f\x09\x0f\x11\x80\x9d" } },
    .{ "RegEnumKeyExW", MethodRecord{ .library = "ADVAPI32", .import = "RegEnumKeyExW", .signature = "\x00\x08\x11\x81\x01\x11\x55\x09\x11\x05\x0f\x09\x0f\x09\x11\x05\x0f\x09\x0f\x11\x80\x9d" } },
    .{ "RegEnumValueA", MethodRecord{ .library = "ADVAPI32", .import = "RegEnumValueA", .signature = "\x00\x08\x11\x81\x01\x11\x55\x09\x11\x3d\x0f\x09\x0f\x09\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "RegEnumValueW", MethodRecord{ .library = "ADVAPI32", .import = "RegEnumValueW", .signature = "\x00\x08\x11\x81\x01\x11\x55\x09\x11\x05\x0f\x09\x0f\x09\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "RegFlushKey", MethodRecord{ .library = "ADVAPI32", .import = "RegFlushKey", .signature = "\x00\x01\x11\x81\x01\x11\x55" } },
    .{ "RegGetKeySecurity", MethodRecord{ .library = "ADVAPI32", .import = "RegGetKeySecurity", .signature = "\x00\x04\x11\x81\x01\x11\x55\x11\x84\xf9\x11\x82\xad\x0f\x09" } },
    .{ "RegLoadKeyA", MethodRecord{ .library = "ADVAPI32", .import = "RegLoadKeyA", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x3d\x11\x3d" } },
    .{ "RegLoadKeyW", MethodRecord{ .library = "ADVAPI32", .import = "RegLoadKeyW", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x05\x11\x05" } },
    .{ "RegNotifyChangeKeyValue", MethodRecord{ .library = "ADVAPI32", .import = "RegNotifyChangeKeyValue", .signature = "\x00\x05\x11\x81\x01\x11\x55\x11\x59\x11\x9a\x9d\x11\x80\x85\x11\x59" } },
    .{ "RegOpenKeyA", MethodRecord{ .library = "ADVAPI32", .import = "RegOpenKeyA", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x3d\x0f\x11\x55" } },
    .{ "RegOpenKeyW", MethodRecord{ .library = "ADVAPI32", .import = "RegOpenKeyW", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x05\x0f\x11\x55" } },
    .{ "RegOpenKeyExA", MethodRecord{ .library = "ADVAPI32", .import = "RegOpenKeyExA", .signature = "\x00\x05\x11\x81\x01\x11\x55\x11\x3d\x09\x11\x9a\x95\x0f\x11\x55" } },
    .{ "RegOpenKeyExW", MethodRecord{ .library = "ADVAPI32", .import = "RegOpenKeyExW", .signature = "\x00\x05\x11\x81\x01\x11\x55\x11\x05\x09\x11\x9a\x95\x0f\x11\x55" } },
    .{ "RegOpenKeyTransactedA", MethodRecord{ .library = "ADVAPI32", .import = "RegOpenKeyTransactedA", .signature = "\x00\x07\x11\x81\x01\x11\x55\x11\x3d\x09\x11\x9a\x95\x0f\x11\x55\x11\x80\x85\x0f\x01" } },
    .{ "RegOpenKeyTransactedW", MethodRecord{ .library = "ADVAPI32", .import = "RegOpenKeyTransactedW", .signature = "\x00\x07\x11\x81\x01\x11\x55\x11\x05\x09\x11\x9a\x95\x0f\x11\x55\x11\x80\x85\x0f\x01" } },
    .{ "RegQueryInfoKeyA", MethodRecord{ .library = "ADVAPI32", .import = "RegQueryInfoKeyA", .signature = "\x00\x0c\x11\x81\x01\x11\x55\x11\x3d\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x11\x80\x9d" } },
    .{ "RegQueryInfoKeyW", MethodRecord{ .library = "ADVAPI32", .import = "RegQueryInfoKeyW", .signature = "\x00\x0c\x11\x81\x01\x11\x55\x11\x05\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x11\x80\x9d" } },
    .{ "RegQueryValueA", MethodRecord{ .library = "ADVAPI32", .import = "RegQueryValueA", .signature = "\x00\x04\x11\x81\x01\x11\x55\x11\x3d\x11\x3d\x0f\x08" } },
    .{ "RegQueryValueW", MethodRecord{ .library = "ADVAPI32", .import = "RegQueryValueW", .signature = "\x00\x04\x11\x81\x01\x11\x55\x11\x05\x11\x05\x0f\x08" } },
    .{ "RegQueryMultipleValuesA", MethodRecord{ .library = "ADVAPI32", .import = "RegQueryMultipleValuesA", .signature = "\x00\x05\x11\x81\x01\x11\x55\x0f\x11\x9a\xa1\x09\x11\x3d\x0f\x09" } },
    .{ "RegQueryMultipleValuesW", MethodRecord{ .library = "ADVAPI32", .import = "RegQueryMultipleValuesW", .signature = "\x00\x05\x11\x81\x01\x11\x55\x0f\x11\x9a\xa5\x09\x11\x05\x0f\x09" } },
    .{ "RegQueryValueExA", MethodRecord{ .library = "ADVAPI32", .import = "RegQueryValueExA", .signature = "\x00\x06\x11\x81\x01\x11\x55\x11\x3d\x0f\x09\x0f\x11\x85\x19\x0f\x05\x0f\x09" } },
    .{ "RegQueryValueExW", MethodRecord{ .library = "ADVAPI32", .import = "RegQueryValueExW", .signature = "\x00\x06\x11\x81\x01\x11\x55\x11\x05\x0f\x09\x0f\x11\x85\x19\x0f\x05\x0f\x09" } },
    .{ "RegReplaceKeyA", MethodRecord{ .library = "ADVAPI32", .import = "RegReplaceKeyA", .signature = "\x00\x04\x11\x81\x01\x11\x55\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "RegReplaceKeyW", MethodRecord{ .library = "ADVAPI32", .import = "RegReplaceKeyW", .signature = "\x00\x04\x11\x81\x01\x11\x55\x11\x05\x11\x05\x11\x05" } },
    .{ "RegRestoreKeyA", MethodRecord{ .library = "ADVAPI32", .import = "RegRestoreKeyA", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x3d\x09" } },
    .{ "RegRestoreKeyW", MethodRecord{ .library = "ADVAPI32", .import = "RegRestoreKeyW", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x05\x09" } },
    .{ "RegRenameKey", MethodRecord{ .library = "ADVAPI32", .import = "RegRenameKey", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x05\x11\x05" } },
    .{ "RegSaveKeyA", MethodRecord{ .library = "ADVAPI32", .import = "RegSaveKeyA", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x3d\x0f\x11\x8b\xb5" } },
    .{ "RegSaveKeyW", MethodRecord{ .library = "ADVAPI32", .import = "RegSaveKeyW", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x05\x0f\x11\x8b\xb5" } },
    .{ "RegSetKeySecurity", MethodRecord{ .library = "ADVAPI32", .import = "RegSetKeySecurity", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x84\xf9\x11\x82\xad" } },
    .{ "RegSetValueA", MethodRecord{ .library = "ADVAPI32", .import = "RegSetValueA", .signature = "\x00\x05\x11\x81\x01\x11\x55\x11\x3d\x11\x85\x19\x11\x3d\x09" } },
    .{ "RegSetValueW", MethodRecord{ .library = "ADVAPI32", .import = "RegSetValueW", .signature = "\x00\x05\x11\x81\x01\x11\x55\x11\x05\x11\x85\x19\x11\x05\x09" } },
    .{ "RegSetValueExA", MethodRecord{ .library = "ADVAPI32", .import = "RegSetValueExA", .signature = "\x00\x06\x11\x81\x01\x11\x55\x11\x3d\x09\x11\x85\x19\x0f\x05\x09" } },
    .{ "RegSetValueExW", MethodRecord{ .library = "ADVAPI32", .import = "RegSetValueExW", .signature = "\x00\x06\x11\x81\x01\x11\x55\x11\x05\x09\x11\x85\x19\x0f\x05\x09" } },
    .{ "RegUnLoadKeyA", MethodRecord{ .library = "ADVAPI32", .import = "RegUnLoadKeyA", .signature = "\x00\x02\x11\x81\x01\x11\x55\x11\x3d" } },
    .{ "RegUnLoadKeyW", MethodRecord{ .library = "ADVAPI32", .import = "RegUnLoadKeyW", .signature = "\x00\x02\x11\x81\x01\x11\x55\x11\x05" } },
    .{ "RegDeleteKeyValueA", MethodRecord{ .library = "ADVAPI32", .import = "RegDeleteKeyValueA", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x3d\x11\x3d" } },
    .{ "RegDeleteKeyValueW", MethodRecord{ .library = "ADVAPI32", .import = "RegDeleteKeyValueW", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x05\x11\x05" } },
    .{ "RegSetKeyValueA", MethodRecord{ .library = "ADVAPI32", .import = "RegSetKeyValueA", .signature = "\x00\x06\x11\x81\x01\x11\x55\x11\x3d\x11\x3d\x09\x0f\x01\x09" } },
    .{ "RegSetKeyValueW", MethodRecord{ .library = "ADVAPI32", .import = "RegSetKeyValueW", .signature = "\x00\x06\x11\x81\x01\x11\x55\x11\x05\x11\x05\x09\x0f\x01\x09" } },
    .{ "RegDeleteTreeA", MethodRecord{ .library = "ADVAPI32", .import = "RegDeleteTreeA", .signature = "\x00\x02\x11\x81\x01\x11\x55\x11\x3d" } },
    .{ "RegDeleteTreeW", MethodRecord{ .library = "ADVAPI32", .import = "RegDeleteTreeW", .signature = "\x00\x02\x11\x81\x01\x11\x55\x11\x05" } },
    .{ "RegCopyTreeA", MethodRecord{ .library = "ADVAPI32", .import = "RegCopyTreeA", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x3d\x11\x55" } },
    .{ "RegGetValueA", MethodRecord{ .library = "ADVAPI32", .import = "RegGetValueA", .signature = "\x00\x07\x11\x81\x01\x11\x55\x11\x3d\x11\x3d\x11\x9a\xa9\x0f\x11\x85\x19\x0f\x01\x0f\x09" } },
    .{ "RegGetValueW", MethodRecord{ .library = "ADVAPI32", .import = "RegGetValueW", .signature = "\x00\x07\x11\x81\x01\x11\x55\x11\x05\x11\x05\x11\x9a\xa9\x0f\x11\x85\x19\x0f\x01\x0f\x09" } },
    .{ "RegCopyTreeW", MethodRecord{ .library = "ADVAPI32", .import = "RegCopyTreeW", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x05\x11\x55" } },
    .{ "RegLoadMUIStringA", MethodRecord{ .library = "ADVAPI32", .import = "RegLoadMUIStringA", .signature = "\x00\x07\x11\x81\x01\x11\x55\x11\x3d\x11\x3d\x09\x0f\x09\x09\x11\x3d" } },
    .{ "RegLoadMUIStringW", MethodRecord{ .library = "ADVAPI32", .import = "RegLoadMUIStringW", .signature = "\x00\x07\x11\x81\x01\x11\x55\x11\x05\x11\x05\x09\x0f\x09\x09\x11\x05" } },
    .{ "RegLoadAppKeyA", MethodRecord{ .library = "ADVAPI32", .import = "RegLoadAppKeyA", .signature = "\x00\x05\x11\x81\x01\x11\x3d\x0f\x11\x55\x09\x09\x09" } },
    .{ "RegLoadAppKeyW", MethodRecord{ .library = "ADVAPI32", .import = "RegLoadAppKeyW", .signature = "\x00\x05\x11\x81\x01\x11\x05\x0f\x11\x55\x09\x09\x09" } },
    .{ "RegSaveKeyExA", MethodRecord{ .library = "ADVAPI32", .import = "RegSaveKeyExA", .signature = "\x00\x04\x11\x81\x01\x11\x55\x11\x3d\x0f\x11\x8b\xb5\x11\x9a\xad" } },
    .{ "RegSaveKeyExW", MethodRecord{ .library = "ADVAPI32", .import = "RegSaveKeyExW", .signature = "\x00\x04\x11\x81\x01\x11\x55\x11\x05\x0f\x11\x8b\xb5\x11\x9a\xad" } },
    .{ "GetRegistryValueWithFallbackW", MethodRecord{ .library = "api-ms-win-core-state-helpers-l1-1-0", .import = "GetRegistryValueWithFallbackW", .signature = "\x00\x0a\x11\x81\x01\x11\x55\x11\x05\x11\x55\x11\x05\x11\x05\x09\x0f\x09\x0f\x01\x09\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x55 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "HKEY" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x4f9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "OBJECT_SECURITY_INFORMATION" },
        0x519 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "REG_VALUE_TYPE" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0x1a91 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "REG_OPEN_CREATE_OPTIONS" },
        0x1a95 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "REG_SAM_FLAGS" },
        0x1a99 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "REG_CREATE_KEY_DISPOSITION" },
        0x1a9d => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "REG_NOTIFY_FILTER" },
        0x1aa1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "VALENTA" },
        0x1aa5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "VALENTW" },
        0x1aa9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "REG_ROUTINE_FLAGS" },
        0x1aad => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "REG_SAVE_FORMAT" },
        else => null,
    };
}

pub const HKEY_CLASSES_ROOT = -2147483648;
pub const HKEY_CURRENT_USER = -2147483647;
pub const HKEY_LOCAL_MACHINE = -2147483646;
pub const HKEY_USERS = -2147483645;
pub const HKEY_PERFORMANCE_DATA = -2147483644;
pub const HKEY_PERFORMANCE_TEXT = -2147483568;
pub const HKEY_PERFORMANCE_NLSTEXT = -2147483552;
pub const HKEY_CURRENT_CONFIG = -2147483643;
pub const HKEY_DYN_DATA = -2147483642;
pub const HKEY_CURRENT_USER_LOCAL_SETTINGS = -2147483641;
pub const REG_PROCESS_APPKEY = 1;
pub const REG_USE_CURRENT_SECURITY_CONTEXT = 2;
pub const PROVIDER_KEEPS_VALUE_LENGTH = 1;
pub const REG_MUI_STRING_TRUNCATE = 1;
pub const REG_SECURE_CONNECTION = 1;
pub const REG_ALLOW_TRANSPORT_FALLBACK = 2;
pub const REG_ALLOW_UNSECURE_CONNECTION = 4;
pub const REGSTR_MAX_VALUE_LENGTH = 256;
pub const IT_COMPACT = 0;
pub const IT_TYPICAL = 1;
pub const IT_PORTABLE = 2;
pub const IT_CUSTOM = 3;
pub const DRIVERSIGN_NONE = 0;
pub const DRIVERSIGN_WARNING = 1;
pub const DRIVERSIGN_BLOCKING = 2;
pub const DOSOPTGF_DEFCLEAN = 1;
pub const DOSOPTF_DEFAULT = 1;
pub const DOSOPTF_SUPPORTED = 2;
pub const DOSOPTF_ALWAYSUSE = 4;
pub const DOSOPTF_USESPMODE = 8;
pub const DOSOPTF_PROVIDESUMB = 16;
pub const DOSOPTF_NEEDSETUP = 32;
pub const DOSOPTF_INDOSSTART = 64;
pub const DOSOPTF_MULTIPLE = 128;
pub const SUF_FIRSTTIME = 1;
pub const SUF_EXPRESS = 2;
pub const SUF_BATCHINF = 4;
pub const SUF_CLEAN = 8;
pub const SUF_INSETUP = 16;
pub const SUF_NETSETUP = 32;
pub const SUF_NETHDBOOT = 64;
pub const SUF_NETRPLBOOT = 128;
pub const SUF_SBSCOPYOK = 256;
pub const VPDF_DISABLEPWRMGMT = 1;
pub const VPDF_FORCEAPM10MODE = 2;
pub const VPDF_SKIPINTELSLCHECK = 4;
pub const VPDF_DISABLEPWRSTATUSPOLL = 8;
pub const VPDF_DISABLERINGRESUME = 16;
pub const VPDF_SHOWMULTIBATT = 32;
pub const BIF_SHOWSIMILARDRIVERS = 1;
pub const BIF_RAWDEVICENEEDSDRIVER = 2;
pub const PCMCIA_OPT_HAVE_SOCKET = 1;
pub const PCMCIA_OPT_AUTOMEM = 4;
pub const PCMCIA_OPT_NO_SOUND = 8;
pub const PCMCIA_OPT_NO_AUDIO = 16;
pub const PCMCIA_OPT_NO_APMREMOVE = 32;
pub const PCMCIA_DEF_MEMBEGIN = 786432;
pub const PCMCIA_DEF_MEMEND = 16777215;
pub const PCMCIA_DEF_MEMLEN = 4096;
pub const PCMCIA_DEF_MIN_REGION = 65536;
pub const PCI_OPTIONS_USE_BIOS = 1;
pub const PCI_OPTIONS_USE_IRQ_STEERING = 2;
pub const AGP_FLAG_NO_1X_RATE = 1;
pub const AGP_FLAG_NO_2X_RATE = 2;
pub const AGP_FLAG_NO_4X_RATE = 4;
pub const AGP_FLAG_NO_8X_RATE = 8;
pub const AGP_FLAG_REVERSE_INITIALIZATION = 128;
pub const AGP_FLAG_NO_SBA_ENABLE = 256;
pub const AGP_FLAG_NO_FW_ENABLE = 512;
pub const AGP_FLAG_SPECIAL_TARGET = 1048575;
pub const AGP_FLAG_SPECIAL_RESERVE = 1015808;
pub const REGSTR_VAL_MAX_HCID_LEN = 1024;
pub const REGDF_NOTDETIO = 1;
pub const REGDF_NOTDETMEM = 2;
pub const REGDF_NOTDETIRQ = 4;
pub const REGDF_NOTDETDMA = 8;
pub const REGDF_NEEDFULLCONFIG = 16;
pub const REGDF_GENFORCEDCONFIG = 32;
pub const REGDF_NODETCONFIG = 32768;
pub const REGDF_CONFLICTIO = 65536;
pub const REGDF_CONFLICTMEM = 131072;
pub const REGDF_CONFLICTIRQ = 262144;
pub const REGDF_CONFLICTDMA = 524288;
pub const REGDF_MAPIRQ2TO9 = 1048576;
pub const REGDF_NOTVERIFIED = 2147483648;
pub const APMMENUSUSPEND_DISABLED = 0;
pub const APMMENUSUSPEND_ENABLED = 1;
pub const APMMENUSUSPEND_UNDOCKED = 2;
pub const APMMENUSUSPEND_NOCHANGE = 128;
pub const APMTIMEOUT_DISABLED = 0;
pub const CSCONFIGFLAG_BITS = 7;
pub const CSCONFIGFLAG_DISABLED = 1;
pub const CSCONFIGFLAG_DO_NOT_CREATE = 2;
pub const CSCONFIGFLAG_DO_NOT_START = 4;
pub const DMSTATEFLAG_APPLYTOALL = 1;
pub const NUM_RESOURCE_MAP = 256;
pub const MF_FLAGS_EVEN_IF_NO_RESOURCE = 1;
pub const MF_FLAGS_NO_CREATE_IF_NO_RESOURCE = 2;
pub const MF_FLAGS_FILL_IN_UNKNOWN_RESOURCE = 4;
pub const MF_FLAGS_CREATE_BUT_NO_SHOW_DISABLED = 8;
pub const EISAFLAG_NO_IO_MERGE = 1;
pub const EISAFLAG_SLOT_IO_FIRST = 2;
pub const EISA_NO_MAX_FUNCTION = 255;
pub const NUM_EISA_RANGES = 4;
pub const PCIC_DEFAULT_IRQMASK = 20152;
pub const PCIC_DEFAULT_NUMSOCKETS = 0;
pub const DTRESULTOK = 0;
pub const DTRESULTFIX = 1;
pub const DTRESULTPROB = 2;
pub const DTRESULTPART = 3;
pub const PIR_OPTION_ENABLED = 1;
pub const PIR_OPTION_REGISTRY = 2;
pub const PIR_OPTION_MSSPEC = 4;
pub const PIR_OPTION_REALMODE = 8;
pub const PIR_OPTION_DEFAULT = 15;
pub const PIR_STATUS_ERROR = 0;
pub const PIR_STATUS_ENABLED = 1;
pub const PIR_STATUS_DISABLED = 2;
pub const PIR_STATUS_MAX = 3;
pub const PIR_STATUS_TABLE_REGISTRY = 0;
pub const PIR_STATUS_TABLE_MSSPEC = 1;
pub const PIR_STATUS_TABLE_REALMODE = 2;
pub const PIR_STATUS_TABLE_NONE = 3;
pub const PIR_STATUS_TABLE_ERROR = 4;
pub const PIR_STATUS_TABLE_BAD = 5;
pub const PIR_STATUS_TABLE_SUCCESS = 6;
pub const PIR_STATUS_TABLE_MAX = 7;
pub const PIR_STATUS_MINIPORT_NORMAL = 0;
pub const PIR_STATUS_MINIPORT_COMPATIBLE = 1;
pub const PIR_STATUS_MINIPORT_OVERRIDE = 2;
pub const PIR_STATUS_MINIPORT_NONE = 3;
pub const PIR_STATUS_MINIPORT_ERROR = 4;
pub const PIR_STATUS_MINIPORT_NOKEY = 5;
pub const PIR_STATUS_MINIPORT_SUCCESS = 6;
pub const PIR_STATUS_MINIPORT_INVALID = 7;
pub const PIR_STATUS_MINIPORT_MAX = 8;
pub const LASTGOOD_OPERATION = 255;
pub const LASTGOOD_OPERATION_NOPOSTPROC = 0;
pub const LASTGOOD_OPERATION_DELETE = 1;
pub const REG_NONE = 0;
pub const REG_SZ = 1;
pub const REG_EXPAND_SZ = 2;
pub const REG_BINARY = 3;
pub const REG_DWORD = 4;
pub const REG_DWORD_LITTLE_ENDIAN = 4;
pub const REG_DWORD_BIG_ENDIAN = 5;
pub const REG_LINK = 6;
pub const REG_MULTI_SZ = 7;
pub const REG_RESOURCE_LIST = 8;
pub const REG_FULL_RESOURCE_DESCRIPTOR = 9;
pub const REG_RESOURCE_REQUIREMENTS_LIST = 10;
pub const REG_QWORD = 11;
pub const REG_QWORD_LITTLE_ENDIAN = 11;
pub const KEY_QUERY_VALUE = 1;
pub const KEY_SET_VALUE = 2;
pub const KEY_CREATE_SUB_KEY = 4;
pub const KEY_ENUMERATE_SUB_KEYS = 8;
pub const KEY_NOTIFY = 16;
pub const KEY_CREATE_LINK = 32;
pub const KEY_WOW64_32KEY = 512;
pub const KEY_WOW64_64KEY = 256;
pub const KEY_WOW64_RES = 768;
pub const KEY_READ = 131097;
pub const KEY_WRITE = 131078;
pub const KEY_EXECUTE = 131097;
pub const KEY_ALL_ACCESS = 983103;
pub const REG_OPTION_RESERVED = 0;
pub const REG_OPTION_NON_VOLATILE = 0;
pub const REG_OPTION_VOLATILE = 1;
pub const REG_OPTION_CREATE_LINK = 2;
pub const REG_OPTION_BACKUP_RESTORE = 4;
pub const REG_OPTION_OPEN_LINK = 8;
pub const REG_OPTION_DONT_VIRTUALIZE = 16;
pub const REG_CREATED_NEW_KEY = 1;
pub const REG_OPENED_EXISTING_KEY = 2;
pub const REG_STANDARD_FORMAT = 1;
pub const REG_LATEST_FORMAT = 2;
pub const REG_NO_COMPRESSION = 4;
pub const REG_FORCE_RESTORE = 8;
pub const REG_WHOLE_HIVE_VOLATILE = 1;
pub const REG_NOTIFY_CHANGE_NAME = 1;
pub const REG_NOTIFY_CHANGE_ATTRIBUTES = 2;
pub const REG_NOTIFY_CHANGE_LAST_SET = 4;
pub const REG_NOTIFY_CHANGE_SECURITY = 8;
pub const REG_NOTIFY_THREAD_AGNOSTIC = 268435456;
pub const RRF_RT_DWORD = 24;
pub const RRF_RT_QWORD = 72;
pub const RRF_RT_REG_NONE = 1;
pub const RRF_RT_REG_SZ = 2;
pub const RRF_RT_REG_EXPAND_SZ = 4;
pub const RRF_RT_REG_BINARY = 8;
pub const RRF_RT_REG_DWORD = 16;
pub const RRF_RT_REG_MULTI_SZ = 32;
pub const RRF_RT_REG_QWORD = 64;
pub const RRF_RT_ANY = 65535;
pub const RRF_SUBKEY_WOW6464KEY = 65536;
pub const RRF_SUBKEY_WOW6432KEY = 131072;
pub const RRF_WOW64_MASK = 196608;
pub const RRF_NOEXPAND = 268435456;
pub const RRF_ZEROONFAILURE = 536870912;

pub const aliases = struct {
    pub const REG_VALUE_TYPE = u32;
    pub const REG_SAM_FLAGS = u32;
    pub const REG_OPEN_CREATE_OPTIONS = u32;
    pub const REG_CREATE_KEY_DISPOSITION = u32;
    pub const REG_SAVE_FORMAT = u32;
    pub const REG_RESTORE_KEY_FLAGS = i32;
    pub const REG_NOTIFY_FILTER = u32;
    pub const REG_ROUTINE_FLAGS = u32;
    pub const HKEY = ?*anyopaque;
};
