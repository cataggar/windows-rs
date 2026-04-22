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
    .{ "CfGetPlatformInfo", MethodRecord{ .library = "cldapi", .import = "CfGetPlatformInfo", .signature = "\x00\x01\x11\x79\x0f\x11\xbd\x55" } },
    .{ "CfRegisterSyncRoot", MethodRecord{ .library = "cldapi", .import = "CfRegisterSyncRoot", .signature = "\x00\x04\x11\x79\x11\x05\x0f\x11\xbd\x59\x0f\x11\xbd\x5d\x11\xbd\x61" } },
    .{ "CfUnregisterSyncRoot", MethodRecord{ .library = "cldapi", .import = "CfUnregisterSyncRoot", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "CfConnectSyncRoot", MethodRecord{ .library = "cldapi", .import = "CfConnectSyncRoot", .signature = "\x00\x05\x11\x79\x11\x05\x0f\x11\xbd\x65\x0f\x01\x11\xbd\x69\x0f\x11\xbd\x6d" } },
    .{ "CfDisconnectSyncRoot", MethodRecord{ .library = "cldapi", .import = "CfDisconnectSyncRoot", .signature = "\x00\x01\x11\x79\x11\xbd\x6d" } },
    .{ "CfGetTransferKey", MethodRecord{ .library = "cldapi", .import = "CfGetTransferKey", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x0a" } },
    .{ "CfReleaseTransferKey", MethodRecord{ .library = "cldapi", .import = "CfReleaseTransferKey", .signature = "\x00\x02\x01\x11\x80\x85\x0f\x0a" } },
    .{ "CfExecute", MethodRecord{ .library = "cldapi", .import = "CfExecute", .signature = "\x00\x02\x11\x79\x0f\x11\xbd\x71\x0f\x11\xbd\x75" } },
    .{ "CfUpdateSyncProviderStatus", MethodRecord{ .library = "cldapi", .import = "CfUpdateSyncProviderStatus", .signature = "\x00\x02\x11\x79\x11\xbd\x6d\x11\xbd\x79" } },
    .{ "CfQuerySyncProviderStatus", MethodRecord{ .library = "cldapi", .import = "CfQuerySyncProviderStatus", .signature = "\x00\x02\x11\x79\x11\xbd\x6d\x0f\x11\xbd\x79" } },
    .{ "CfReportSyncStatus", MethodRecord{ .library = "cldapi", .import = "CfReportSyncStatus", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\xbd\x7d" } },
    .{ "CfCreatePlaceholders", MethodRecord{ .library = "cldapi", .import = "CfCreatePlaceholders", .signature = "\x00\x05\x11\x79\x11\x05\x0f\x11\xbd\x81\x09\x11\xbd\x85\x0f\x09" } },
    .{ "CfOpenFileWithOplock", MethodRecord{ .library = "cldapi", .import = "CfOpenFileWithOplock", .signature = "\x00\x03\x11\x79\x11\x05\x11\xbd\x89\x0f\x11\x80\x85" } },
    .{ "CfReferenceProtectedHandle", MethodRecord{ .library = "cldapi", .import = "CfReferenceProtectedHandle", .signature = "\x00\x01\x11\x87\x79\x11\x80\x85" } },
    .{ "CfGetWin32HandleFromProtectedHandle", MethodRecord{ .library = "cldapi", .import = "CfGetWin32HandleFromProtectedHandle", .signature = "\x00\x01\x11\x80\x85\x11\x80\x85" } },
    .{ "CfReleaseProtectedHandle", MethodRecord{ .library = "cldapi", .import = "CfReleaseProtectedHandle", .signature = "\x00\x01\x01\x11\x80\x85" } },
    .{ "CfCloseHandle", MethodRecord{ .library = "cldapi", .import = "CfCloseHandle", .signature = "\x00\x01\x01\x11\x80\x85" } },
    .{ "CfConvertToPlaceholder", MethodRecord{ .library = "cldapi", .import = "CfConvertToPlaceholder", .signature = "\x00\x06\x11\x79\x11\x80\x85\x0f\x01\x09\x11\xbd\x8d\x0f\x0a\x0f\x11\x8b\xed" } },
    .{ "CfUpdatePlaceholder", MethodRecord{ .library = "cldapi", .import = "CfUpdatePlaceholder", .signature = "\x00\x09\x11\x79\x11\x80\x85\x0f\x11\xbd\x91\x0f\x01\x09\x0f\x11\xbd\x95\x09\x11\xbd\x99\x0f\x0a\x0f\x11\x8b\xed" } },
    .{ "CfRevertPlaceholder", MethodRecord{ .library = "cldapi", .import = "CfRevertPlaceholder", .signature = "\x00\x03\x11\x79\x11\x80\x85\x11\xbd\x9d\x0f\x11\x8b\xed" } },
    .{ "CfHydratePlaceholder", MethodRecord{ .library = "cldapi", .import = "CfHydratePlaceholder", .signature = "\x00\x05\x11\x79\x11\x80\x85\x0a\x0a\x11\xbd\xa1\x0f\x11\x8b\xed" } },
    .{ "CfDehydratePlaceholder", MethodRecord{ .library = "cldapi", .import = "CfDehydratePlaceholder", .signature = "\x00\x05\x11\x79\x11\x80\x85\x0a\x0a\x11\xbd\xa5\x0f\x11\x8b\xed" } },
    .{ "CfSetPinState", MethodRecord{ .library = "cldapi", .import = "CfSetPinState", .signature = "\x00\x04\x11\x79\x11\x80\x85\x11\xbd\xa9\x11\xbd\xad\x0f\x11\x8b\xed" } },
    .{ "CfSetInSyncState", MethodRecord{ .library = "cldapi", .import = "CfSetInSyncState", .signature = "\x00\x04\x11\x79\x11\x80\x85\x11\xbd\xb1\x11\xbd\xb5\x0f\x0a" } },
    .{ "CfSetCorrelationVector", MethodRecord{ .library = "cldapi", .import = "CfSetCorrelationVector", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\xbd\xb9" } },
    .{ "CfGetCorrelationVector", MethodRecord{ .library = "cldapi", .import = "CfGetCorrelationVector", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\xbd\xb9" } },
    .{ "CfGetPlaceholderStateFromAttributeTag", MethodRecord{ .library = "cldapi", .import = "CfGetPlaceholderStateFromAttributeTag", .signature = "\x00\x02\x11\xbd\xbd\x09\x09" } },
    .{ "CfGetPlaceholderStateFromFileInfo", MethodRecord{ .library = "cldapi", .import = "CfGetPlaceholderStateFromFileInfo", .signature = "\x00\x02\x11\xbd\xbd\x0f\x01\x11\x8b\xfd" } },
    .{ "CfGetPlaceholderStateFromFindData", MethodRecord{ .library = "cldapi", .import = "CfGetPlaceholderStateFromFindData", .signature = "\x00\x01\x11\xbd\xbd\x0f\x11\x8b\xc5" } },
    .{ "CfGetPlaceholderInfo", MethodRecord{ .library = "cldapi", .import = "CfGetPlaceholderInfo", .signature = "\x00\x05\x11\x79\x11\x80\x85\x11\xbd\xc1\x0f\x01\x09\x0f\x09" } },
    .{ "CfGetSyncRootInfoByPath", MethodRecord{ .library = "cldapi", .import = "CfGetSyncRootInfoByPath", .signature = "\x00\x05\x11\x79\x11\x05\x11\xbd\xc5\x0f\x01\x09\x0f\x09" } },
    .{ "CfGetSyncRootInfoByHandle", MethodRecord{ .library = "cldapi", .import = "CfGetSyncRootInfoByHandle", .signature = "\x00\x05\x11\x79\x11\x80\x85\x11\xbd\xc5\x0f\x01\x09\x0f\x09" } },
    .{ "CfGetPlaceholderRangeInfo", MethodRecord{ .library = "cldapi", .import = "CfGetPlaceholderRangeInfo", .signature = "\x00\x07\x11\x79\x11\x80\x85\x11\xbd\xc9\x0a\x0a\x0f\x01\x09\x0f\x09" } },
    .{ "CfGetPlaceholderRangeInfoForHydration", MethodRecord{ .library = "cldapi", .import = "CfGetPlaceholderRangeInfoForHydration", .signature = "\x00\x09\x11\x79\x11\xbd\x6d\x0a\x0a\x11\xbd\xc9\x0a\x0a\x0f\x01\x09\x0f\x09" } },
    .{ "CfReportProviderProgress", MethodRecord{ .library = "cldapi", .import = "CfReportProviderProgress", .signature = "\x00\x04\x11\x79\x11\xbd\x6d\x0a\x0a\x0a" } },
    .{ "CfReportProviderProgress2", MethodRecord{ .library = "cldapi", .import = "CfReportProviderProgress2", .signature = "\x00\x06\x11\x79\x11\xbd\x6d\x0a\x0a\x0a\x0a\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0xbc5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "WIN32_FIND_DATAA" },
        0xbed => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED" },
        0xbfd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FILE_INFO_BY_HANDLE_CLASS" },
        0x3d55 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_PLATFORM_INFO" },
        0x3d59 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_SYNC_REGISTRATION" },
        0x3d5d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_SYNC_POLICIES" },
        0x3d61 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_REGISTER_FLAGS" },
        0x3d65 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_CALLBACK_REGISTRATION" },
        0x3d69 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_CONNECT_FLAGS" },
        0x3d6d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_CONNECTION_KEY" },
        0x3d71 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_OPERATION_INFO" },
        0x3d75 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_OPERATION_PARAMETERS" },
        0x3d79 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_SYNC_PROVIDER_STATUS" },
        0x3d7d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_SYNC_STATUS" },
        0x3d81 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_PLACEHOLDER_CREATE_INFO" },
        0x3d85 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_CREATE_FLAGS" },
        0x3d89 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_OPEN_FILE_FLAGS" },
        0x3d8d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_CONVERT_FLAGS" },
        0x3d91 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_FS_METADATA" },
        0x3d95 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_FILE_RANGE" },
        0x3d99 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_UPDATE_FLAGS" },
        0x3d9d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_REVERT_FLAGS" },
        0x3da1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_HYDRATE_FLAGS" },
        0x3da5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_DEHYDRATE_FLAGS" },
        0x3da9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_PIN_STATE" },
        0x3dad => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_SET_PIN_FLAGS" },
        0x3db1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_IN_SYNC_STATE" },
        0x3db5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_SET_IN_SYNC_FLAGS" },
        0x3db9 => TypeRefEntry{ .namespace = "Windows.Win32.System.CorrelationVector", .name = "CORRELATION_VECTOR" },
        0x3dbd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_PLACEHOLDER_STATE" },
        0x3dc1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_PLACEHOLDER_INFO_CLASS" },
        0x3dc5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_SYNC_ROOT_INFO_CLASS" },
        0x3dc9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.CloudFilters", .name = "CF_PLACEHOLDER_RANGE_INFO_CLASS" },
        else => null,
    };
}

pub const CF_REQUEST_KEY_DEFAULT = 0;
pub const CF_PLACEHOLDER_MAX_FILE_IDENTITY_LENGTH = 4096;
pub const CF_MAX_PRIORITY_HINT = 15;
pub const CF_MAX_PROVIDER_NAME_LENGTH = 255;
pub const CF_MAX_PROVIDER_VERSION_LENGTH = 255;
pub const CF_PLACEHOLDER_CREATE_FLAG_NONE = 0;
pub const CF_PLACEHOLDER_CREATE_FLAG_DISABLE_ON_DEMAND_POPULATION = 1;
pub const CF_PLACEHOLDER_CREATE_FLAG_MARK_IN_SYNC = 2;
pub const CF_PLACEHOLDER_CREATE_FLAG_SUPERSEDE = 4;
pub const CF_PLACEHOLDER_CREATE_FLAG_ALWAYS_FULL = 8;
pub const CF_PROVIDER_STATUS_DISCONNECTED = 0;
pub const CF_PROVIDER_STATUS_IDLE = 1;
pub const CF_PROVIDER_STATUS_POPULATE_NAMESPACE = 2;
pub const CF_PROVIDER_STATUS_POPULATE_METADATA = 4;
pub const CF_PROVIDER_STATUS_POPULATE_CONTENT = 8;
pub const CF_PROVIDER_STATUS_SYNC_INCREMENTAL = 16;
pub const CF_PROVIDER_STATUS_SYNC_FULL = 32;
pub const CF_PROVIDER_STATUS_CONNECTIVITY_LOST = 64;
pub const CF_PROVIDER_STATUS_CLEAR_FLAGS = 2147483648;
pub const CF_PROVIDER_STATUS_TERMINATED = 3221225473;
pub const CF_PROVIDER_STATUS_ERROR = 3221225474;
pub const CF_REGISTER_FLAG_NONE = 0;
pub const CF_REGISTER_FLAG_UPDATE = 1;
pub const CF_REGISTER_FLAG_DISABLE_ON_DEMAND_POPULATION_ON_ROOT = 2;
pub const CF_REGISTER_FLAG_MARK_IN_SYNC_ON_ROOT = 4;
pub const CF_HYDRATION_POLICY_PARTIAL = 0;
pub const CF_HYDRATION_POLICY_PROGRESSIVE = 1;
pub const CF_HYDRATION_POLICY_FULL = 2;
pub const CF_HYDRATION_POLICY_ALWAYS_FULL = 3;
pub const CF_HYDRATION_POLICY_MODIFIER_NONE = 0;
pub const CF_HYDRATION_POLICY_MODIFIER_VALIDATION_REQUIRED = 1;
pub const CF_HYDRATION_POLICY_MODIFIER_STREAMING_ALLOWED = 2;
pub const CF_HYDRATION_POLICY_MODIFIER_AUTO_DEHYDRATION_ALLOWED = 4;
pub const CF_HYDRATION_POLICY_MODIFIER_ALLOW_FULL_RESTART_HYDRATION = 8;
pub const CF_POPULATION_POLICY_PARTIAL = 0;
pub const CF_POPULATION_POLICY_FULL = 2;
pub const CF_POPULATION_POLICY_ALWAYS_FULL = 3;
pub const CF_POPULATION_POLICY_MODIFIER_NONE = 0;
pub const CF_PLACEHOLDER_MANAGEMENT_POLICY_DEFAULT = 0;
pub const CF_PLACEHOLDER_MANAGEMENT_POLICY_CREATE_UNRESTRICTED = 1;
pub const CF_PLACEHOLDER_MANAGEMENT_POLICY_CONVERT_TO_UNRESTRICTED = 2;
pub const CF_PLACEHOLDER_MANAGEMENT_POLICY_UPDATE_UNRESTRICTED = 4;
pub const CF_INSYNC_POLICY_NONE = 0;
pub const CF_INSYNC_POLICY_TRACK_FILE_CREATION_TIME = 1;
pub const CF_INSYNC_POLICY_TRACK_FILE_READONLY_ATTRIBUTE = 2;
pub const CF_INSYNC_POLICY_TRACK_FILE_HIDDEN_ATTRIBUTE = 4;
pub const CF_INSYNC_POLICY_TRACK_FILE_SYSTEM_ATTRIBUTE = 8;
pub const CF_INSYNC_POLICY_TRACK_DIRECTORY_CREATION_TIME = 16;
pub const CF_INSYNC_POLICY_TRACK_DIRECTORY_READONLY_ATTRIBUTE = 32;
pub const CF_INSYNC_POLICY_TRACK_DIRECTORY_HIDDEN_ATTRIBUTE = 64;
pub const CF_INSYNC_POLICY_TRACK_DIRECTORY_SYSTEM_ATTRIBUTE = 128;
pub const CF_INSYNC_POLICY_TRACK_FILE_LAST_WRITE_TIME = 256;
pub const CF_INSYNC_POLICY_TRACK_DIRECTORY_LAST_WRITE_TIME = 512;
pub const CF_INSYNC_POLICY_TRACK_FILE_ALL = 5592335;
pub const CF_INSYNC_POLICY_TRACK_DIRECTORY_ALL = 11184880;
pub const CF_INSYNC_POLICY_TRACK_ALL = 16777215;
pub const CF_INSYNC_POLICY_PRESERVE_INSYNC_FOR_SYNC_ENGINE = 2147483648;
pub const CF_HARDLINK_POLICY_NONE = 0;
pub const CF_HARDLINK_POLICY_ALLOWED = 1;
pub const CF_CALLBACK_CANCEL_FLAG_NONE = 0;
pub const CF_CALLBACK_CANCEL_FLAG_IO_TIMEOUT = 1;
pub const CF_CALLBACK_CANCEL_FLAG_IO_ABORTED = 2;
pub const CF_CALLBACK_FETCH_DATA_FLAG_NONE = 0;
pub const CF_CALLBACK_FETCH_DATA_FLAG_RECOVERY = 1;
pub const CF_CALLBACK_FETCH_DATA_FLAG_EXPLICIT_HYDRATION = 2;
pub const CF_CALLBACK_VALIDATE_DATA_FLAG_NONE = 0;
pub const CF_CALLBACK_VALIDATE_DATA_FLAG_EXPLICIT_HYDRATION = 2;
pub const CF_CALLBACK_FETCH_PLACEHOLDERS_FLAG_NONE = 0;
pub const CF_CALLBACK_OPEN_COMPLETION_FLAG_NONE = 0;
pub const CF_CALLBACK_OPEN_COMPLETION_FLAG_PLACEHOLDER_UNKNOWN = 1;
pub const CF_CALLBACK_OPEN_COMPLETION_FLAG_PLACEHOLDER_UNSUPPORTED = 2;
pub const CF_CALLBACK_CLOSE_COMPLETION_FLAG_NONE = 0;
pub const CF_CALLBACK_CLOSE_COMPLETION_FLAG_DELETED = 1;
pub const CF_CALLBACK_DEHYDRATE_FLAG_NONE = 0;
pub const CF_CALLBACK_DEHYDRATE_FLAG_BACKGROUND = 1;
pub const CF_CALLBACK_DEHYDRATE_COMPLETION_FLAG_NONE = 0;
pub const CF_CALLBACK_DEHYDRATE_COMPLETION_FLAG_BACKGROUND = 1;
pub const CF_CALLBACK_DEHYDRATE_COMPLETION_FLAG_DEHYDRATED = 2;
pub const CF_CALLBACK_DELETE_FLAG_NONE = 0;
pub const CF_CALLBACK_DELETE_FLAG_IS_DIRECTORY = 1;
pub const CF_CALLBACK_DELETE_FLAG_IS_UNDELETE = 2;
pub const CF_CALLBACK_DELETE_COMPLETION_FLAG_NONE = 0;
pub const CF_CALLBACK_RENAME_FLAG_NONE = 0;
pub const CF_CALLBACK_RENAME_FLAG_IS_DIRECTORY = 1;
pub const CF_CALLBACK_RENAME_FLAG_SOURCE_IN_SCOPE = 2;
pub const CF_CALLBACK_RENAME_FLAG_TARGET_IN_SCOPE = 4;
pub const CF_CALLBACK_RENAME_COMPLETION_FLAG_NONE = 0;
pub const CF_CALLBACK_DEHYDRATION_REASON_NONE = 0;
pub const CF_CALLBACK_DEHYDRATION_REASON_USER_MANUAL = 1;
pub const CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_LOW_SPACE = 2;
pub const CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_INACTIVITY = 3;
pub const CF_CALLBACK_DEHYDRATION_REASON_SYSTEM_OS_UPGRADE = 4;
pub const CF_CALLBACK_TYPE_FETCH_DATA = 0;
pub const CF_CALLBACK_TYPE_VALIDATE_DATA = 1;
pub const CF_CALLBACK_TYPE_CANCEL_FETCH_DATA = 2;
pub const CF_CALLBACK_TYPE_FETCH_PLACEHOLDERS = 3;
pub const CF_CALLBACK_TYPE_CANCEL_FETCH_PLACEHOLDERS = 4;
pub const CF_CALLBACK_TYPE_NOTIFY_FILE_OPEN_COMPLETION = 5;
pub const CF_CALLBACK_TYPE_NOTIFY_FILE_CLOSE_COMPLETION = 6;
pub const CF_CALLBACK_TYPE_NOTIFY_DEHYDRATE = 7;
pub const CF_CALLBACK_TYPE_NOTIFY_DEHYDRATE_COMPLETION = 8;
pub const CF_CALLBACK_TYPE_NOTIFY_DELETE = 9;
pub const CF_CALLBACK_TYPE_NOTIFY_DELETE_COMPLETION = 10;
pub const CF_CALLBACK_TYPE_NOTIFY_RENAME = 11;
pub const CF_CALLBACK_TYPE_NOTIFY_RENAME_COMPLETION = 12;
pub const CF_CALLBACK_TYPE_NONE = -1;
pub const CF_CONNECT_FLAG_NONE = 0;
pub const CF_CONNECT_FLAG_REQUIRE_PROCESS_INFO = 2;
pub const CF_CONNECT_FLAG_REQUIRE_FULL_FILE_PATH = 4;
pub const CF_CONNECT_FLAG_BLOCK_SELF_IMPLICIT_HYDRATION = 8;
pub const CF_OPERATION_TYPE_TRANSFER_DATA = 0;
pub const CF_OPERATION_TYPE_RETRIEVE_DATA = 1;
pub const CF_OPERATION_TYPE_ACK_DATA = 2;
pub const CF_OPERATION_TYPE_RESTART_HYDRATION = 3;
pub const CF_OPERATION_TYPE_TRANSFER_PLACEHOLDERS = 4;
pub const CF_OPERATION_TYPE_ACK_DEHYDRATE = 5;
pub const CF_OPERATION_TYPE_ACK_DELETE = 6;
pub const CF_OPERATION_TYPE_ACK_RENAME = 7;
pub const CF_OPERATION_TRANSFER_DATA_FLAG_NONE = 0;
pub const CF_OPERATION_RETRIEVE_DATA_FLAG_NONE = 0;
pub const CF_OPERATION_ACK_DATA_FLAG_NONE = 0;
pub const CF_OPERATION_RESTART_HYDRATION_FLAG_NONE = 0;
pub const CF_OPERATION_RESTART_HYDRATION_FLAG_MARK_IN_SYNC = 1;
pub const CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_NONE = 0;
pub const CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_STOP_ON_ERROR = 1;
pub const CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_DISABLE_ON_DEMAND_POPULATION = 2;
pub const CF_OPERATION_ACK_DEHYDRATE_FLAG_NONE = 0;
pub const CF_OPERATION_ACK_RENAME_FLAG_NONE = 0;
pub const CF_OPERATION_ACK_DELETE_FLAG_NONE = 0;
pub const CF_CREATE_FLAG_NONE = 0;
pub const CF_CREATE_FLAG_STOP_ON_ERROR = 1;
pub const CF_OPEN_FILE_FLAG_NONE = 0;
pub const CF_OPEN_FILE_FLAG_EXCLUSIVE = 1;
pub const CF_OPEN_FILE_FLAG_WRITE_ACCESS = 2;
pub const CF_OPEN_FILE_FLAG_DELETE_ACCESS = 4;
pub const CF_OPEN_FILE_FLAG_FOREGROUND = 8;
pub const CF_CONVERT_FLAG_NONE = 0;
pub const CF_CONVERT_FLAG_MARK_IN_SYNC = 1;
pub const CF_CONVERT_FLAG_DEHYDRATE = 2;
pub const CF_CONVERT_FLAG_ENABLE_ON_DEMAND_POPULATION = 4;
pub const CF_CONVERT_FLAG_ALWAYS_FULL = 8;
pub const CF_CONVERT_FLAG_FORCE_CONVERT_TO_CLOUD_FILE = 16;
pub const CF_UPDATE_FLAG_NONE = 0;
pub const CF_UPDATE_FLAG_VERIFY_IN_SYNC = 1;
pub const CF_UPDATE_FLAG_MARK_IN_SYNC = 2;
pub const CF_UPDATE_FLAG_DEHYDRATE = 4;
pub const CF_UPDATE_FLAG_ENABLE_ON_DEMAND_POPULATION = 8;
pub const CF_UPDATE_FLAG_DISABLE_ON_DEMAND_POPULATION = 16;
pub const CF_UPDATE_FLAG_REMOVE_FILE_IDENTITY = 32;
pub const CF_UPDATE_FLAG_CLEAR_IN_SYNC = 64;
pub const CF_UPDATE_FLAG_REMOVE_PROPERTY = 128;
pub const CF_UPDATE_FLAG_PASSTHROUGH_FS_METADATA = 256;
pub const CF_UPDATE_FLAG_ALWAYS_FULL = 512;
pub const CF_UPDATE_FLAG_ALLOW_PARTIAL = 1024;
pub const CF_REVERT_FLAG_NONE = 0;
pub const CF_HYDRATE_FLAG_NONE = 0;
pub const CF_DEHYDRATE_FLAG_NONE = 0;
pub const CF_DEHYDRATE_FLAG_BACKGROUND = 1;
pub const CF_PIN_STATE_UNSPECIFIED = 0;
pub const CF_PIN_STATE_PINNED = 1;
pub const CF_PIN_STATE_UNPINNED = 2;
pub const CF_PIN_STATE_EXCLUDED = 3;
pub const CF_PIN_STATE_INHERIT = 4;
pub const CF_SET_PIN_FLAG_NONE = 0;
pub const CF_SET_PIN_FLAG_RECURSE = 1;
pub const CF_SET_PIN_FLAG_RECURSE_ONLY = 2;
pub const CF_SET_PIN_FLAG_RECURSE_STOP_ON_ERROR = 4;
pub const CF_IN_SYNC_STATE_NOT_IN_SYNC = 0;
pub const CF_IN_SYNC_STATE_IN_SYNC = 1;
pub const CF_SET_IN_SYNC_FLAG_NONE = 0;
pub const CF_PLACEHOLDER_STATE_NO_STATES = 0;
pub const CF_PLACEHOLDER_STATE_PLACEHOLDER = 1;
pub const CF_PLACEHOLDER_STATE_SYNC_ROOT = 2;
pub const CF_PLACEHOLDER_STATE_ESSENTIAL_PROP_PRESENT = 4;
pub const CF_PLACEHOLDER_STATE_IN_SYNC = 8;
pub const CF_PLACEHOLDER_STATE_PARTIAL = 16;
pub const CF_PLACEHOLDER_STATE_PARTIALLY_ON_DISK = 32;
pub const CF_PLACEHOLDER_STATE_INVALID = 4294967295;
pub const CF_PLACEHOLDER_INFO_BASIC = 0;
pub const CF_PLACEHOLDER_INFO_STANDARD = 1;
pub const CF_SYNC_ROOT_INFO_BASIC = 0;
pub const CF_SYNC_ROOT_INFO_STANDARD = 1;
pub const CF_SYNC_ROOT_INFO_PROVIDER = 2;
pub const CF_PLACEHOLDER_RANGE_INFO_ONDISK = 1;
pub const CF_PLACEHOLDER_RANGE_INFO_VALIDATED = 2;
pub const CF_PLACEHOLDER_RANGE_INFO_MODIFIED = 3;

pub const aliases = struct {
    pub const CF_PLACEHOLDER_CREATE_FLAGS = i32;
    pub const CF_SYNC_PROVIDER_STATUS = u32;
    pub const CF_REGISTER_FLAGS = i32;
    pub const CF_HYDRATION_POLICY_PRIMARY = u16;
    pub const CF_HYDRATION_POLICY_MODIFIER = u16;
    pub const CF_POPULATION_POLICY_PRIMARY = u16;
    pub const CF_POPULATION_POLICY_MODIFIER = u16;
    pub const CF_PLACEHOLDER_MANAGEMENT_POLICY = i32;
    pub const CF_INSYNC_POLICY = u32;
    pub const CF_HARDLINK_POLICY = i32;
    pub const CF_CALLBACK_CANCEL_FLAGS = i32;
    pub const CF_CALLBACK_FETCH_DATA_FLAGS = i32;
    pub const CF_CALLBACK_VALIDATE_DATA_FLAGS = i32;
    pub const CF_CALLBACK_FETCH_PLACEHOLDERS_FLAGS = i32;
    pub const CF_CALLBACK_OPEN_COMPLETION_FLAGS = i32;
    pub const CF_CALLBACK_CLOSE_COMPLETION_FLAGS = i32;
    pub const CF_CALLBACK_DEHYDRATE_FLAGS = i32;
    pub const CF_CALLBACK_DEHYDRATE_COMPLETION_FLAGS = i32;
    pub const CF_CALLBACK_DELETE_FLAGS = i32;
    pub const CF_CALLBACK_DELETE_COMPLETION_FLAGS = i32;
    pub const CF_CALLBACK_RENAME_FLAGS = i32;
    pub const CF_CALLBACK_RENAME_COMPLETION_FLAGS = i32;
    pub const CF_CALLBACK_DEHYDRATION_REASON = i32;
    pub const CF_CALLBACK_TYPE = i32;
    pub const CF_CONNECT_FLAGS = i32;
    pub const CF_OPERATION_TYPE = i32;
    pub const CF_OPERATION_TRANSFER_DATA_FLAGS = i32;
    pub const CF_OPERATION_RETRIEVE_DATA_FLAGS = i32;
    pub const CF_OPERATION_ACK_DATA_FLAGS = i32;
    pub const CF_OPERATION_RESTART_HYDRATION_FLAGS = i32;
    pub const CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAGS = i32;
    pub const CF_OPERATION_ACK_DEHYDRATE_FLAGS = i32;
    pub const CF_OPERATION_ACK_RENAME_FLAGS = i32;
    pub const CF_OPERATION_ACK_DELETE_FLAGS = i32;
    pub const CF_CREATE_FLAGS = i32;
    pub const CF_OPEN_FILE_FLAGS = i32;
    pub const CF_CONVERT_FLAGS = i32;
    pub const CF_UPDATE_FLAGS = i32;
    pub const CF_REVERT_FLAGS = i32;
    pub const CF_HYDRATE_FLAGS = i32;
    pub const CF_DEHYDRATE_FLAGS = i32;
    pub const CF_PIN_STATE = i32;
    pub const CF_SET_PIN_FLAGS = i32;
    pub const CF_IN_SYNC_STATE = i32;
    pub const CF_SET_IN_SYNC_FLAGS = i32;
    pub const CF_PLACEHOLDER_STATE = u32;
    pub const CF_PLACEHOLDER_INFO_CLASS = i32;
    pub const CF_SYNC_ROOT_INFO_CLASS = i32;
    pub const CF_PLACEHOLDER_RANGE_INFO_CLASS = i32;
    pub const CF_CONNECTION_KEY = i64;
};
