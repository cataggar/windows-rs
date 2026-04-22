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
    .{ "PrjStartVirtualizing", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjStartVirtualizing", .signature = "\x00\x05\x11\x79\x11\x05\x0f\x11\xc0\x01\x21\x24\x0f\x01\x0f\x11\xc0\x01\x20\xbc\x0f\x11\xa7\x44" } },
    .{ "PrjStopVirtualizing", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjStopVirtualizing", .signature = "\x00\x01\x01\x11\xa7\x44" } },
    .{ "PrjClearNegativePathCache", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjClearNegativePathCache", .signature = "\x00\x02\x11\x79\x11\xa7\x44\x0f\x09" } },
    .{ "PrjGetVirtualizationInstanceInfo", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjGetVirtualizationInstanceInfo", .signature = "\x00\x02\x11\x79\x11\xa7\x44\x0f\x11\xc0\x01\x20\xc0" } },
    .{ "PrjMarkDirectoryAsPlaceholder", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjMarkDirectoryAsPlaceholder", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x0f\x11\xc0\x01\x20\xc8\x0f\x11\x0d" } },
    .{ "PrjWritePlaceholderInfo", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjWritePlaceholderInfo", .signature = "\x00\x04\x11\x79\x11\xa7\x44\x11\x05\x0f\x11\xc0\x00\x9c\xa1\x09" } },
    .{ "PrjWritePlaceholderInfo2", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjWritePlaceholderInfo2", .signature = "\x00\x05\x11\x79\x11\xa7\x44\x11\x05\x0f\x11\xc0\x00\x9c\xa1\x09\x0f\x11\xc0\x00\x9c\x8d" } },
    .{ "PrjUpdateFileIfNeeded", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjUpdateFileIfNeeded", .signature = "\x00\x06\x11\x79\x11\xa7\x44\x11\x05\x0f\x11\xc0\x00\x9c\xa1\x09\x11\xc0\x00\x9c\xb1\x0f\x11\xc0\x00\x9c\xb5" } },
    .{ "PrjDeleteFile", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjDeleteFile", .signature = "\x00\x04\x11\x79\x11\xa7\x44\x11\x05\x11\xc0\x00\x9c\xb1\x0f\x11\xc0\x00\x9c\xb5" } },
    .{ "PrjWriteFileData", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjWriteFileData", .signature = "\x00\x05\x11\x79\x11\xa7\x44\x0f\x11\x0d\x0f\x01\x0b\x09" } },
    .{ "PrjGetOnDiskFileState", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjGetOnDiskFileState", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\xc0\x00\x9c\xb9" } },
    .{ "PrjAllocateAlignedBuffer", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjAllocateAlignedBuffer", .signature = "\x00\x02\x0f\x01\x11\xa7\x44\x19" } },
    .{ "PrjFreeAlignedBuffer", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjFreeAlignedBuffer", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "PrjCompleteCommand", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjCompleteCommand", .signature = "\x00\x04\x11\x79\x11\xa7\x44\x08\x11\x79\x0f\x11\xc0\x00\x9c\xd5" } },
    .{ "PrjFillDirEntryBuffer", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjFillDirEntryBuffer", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\xc0\x01\x20\xcc\x11\xa7\x48" } },
    .{ "PrjFillDirEntryBuffer2", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjFillDirEntryBuffer2", .signature = "\x00\x04\x11\x79\x11\xa7\x48\x11\x05\x0f\x11\xc0\x01\x20\xcc\x0f\x11\xc0\x00\x9c\x8d" } },
    .{ "PrjFileNameMatch", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjFileNameMatch", .signature = "\x00\x02\x11\x87\x79\x11\x05\x11\x05" } },
    .{ "PrjFileNameCompare", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjFileNameCompare", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
    .{ "PrjDoesNameContainWildCards", MethodRecord{ .library = "PROJECTEDFSLIB", .import = "PrjDoesNameContainWildCards", .signature = "\x00\x01\x11\x87\x79\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0x2744 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.ProjectedFileSystem", .name = "PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT" },
        0x2748 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.ProjectedFileSystem", .name = "PRJ_DIR_ENTRY_BUFFER_HANDLE" },
        0x9c8d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.ProjectedFileSystem", .name = "PRJ_EXTENDED_INFO" },
        0x9ca1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.ProjectedFileSystem", .name = "PRJ_PLACEHOLDER_INFO" },
        0x9cb1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.ProjectedFileSystem", .name = "PRJ_UPDATE_TYPES" },
        0x9cb5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.ProjectedFileSystem", .name = "PRJ_UPDATE_FAILURE_CAUSES" },
        0x9cb9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.ProjectedFileSystem", .name = "PRJ_FILE_STATE" },
        0x9cd5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.ProjectedFileSystem", .name = "PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS" },
        0x120bc => TypeRefEntry{ .namespace = "Windows.Win32.Storage.ProjectedFileSystem", .name = "PRJ_STARTVIRTUALIZING_OPTIONS" },
        0x120c0 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.ProjectedFileSystem", .name = "PRJ_VIRTUALIZATION_INSTANCE_INFO" },
        0x120c8 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.ProjectedFileSystem", .name = "PRJ_PLACEHOLDER_VERSION_INFO" },
        0x120cc => TypeRefEntry{ .namespace = "Windows.Win32.Storage.ProjectedFileSystem", .name = "PRJ_FILE_BASIC_INFO" },
        0x12124 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.ProjectedFileSystem", .name = "PRJ_CALLBACKS" },
        else => null,
    };
}

pub const PRJ_NOTIFY_NONE = 0;
pub const PRJ_NOTIFY_SUPPRESS_NOTIFICATIONS = 1;
pub const PRJ_NOTIFY_FILE_OPENED = 2;
pub const PRJ_NOTIFY_NEW_FILE_CREATED = 4;
pub const PRJ_NOTIFY_FILE_OVERWRITTEN = 8;
pub const PRJ_NOTIFY_PRE_DELETE = 16;
pub const PRJ_NOTIFY_PRE_RENAME = 32;
pub const PRJ_NOTIFY_PRE_SET_HARDLINK = 64;
pub const PRJ_NOTIFY_FILE_RENAMED = 128;
pub const PRJ_NOTIFY_HARDLINK_CREATED = 256;
pub const PRJ_NOTIFY_FILE_HANDLE_CLOSED_NO_MODIFICATION = 512;
pub const PRJ_NOTIFY_FILE_HANDLE_CLOSED_FILE_MODIFIED = 1024;
pub const PRJ_NOTIFY_FILE_HANDLE_CLOSED_FILE_DELETED = 2048;
pub const PRJ_NOTIFY_FILE_PRE_CONVERT_TO_FULL = 4096;
pub const PRJ_NOTIFY_USE_EXISTING_MASK = 4294967295;
pub const PRJ_NOTIFICATION_FILE_OPENED = 2;
pub const PRJ_NOTIFICATION_NEW_FILE_CREATED = 4;
pub const PRJ_NOTIFICATION_FILE_OVERWRITTEN = 8;
pub const PRJ_NOTIFICATION_PRE_DELETE = 16;
pub const PRJ_NOTIFICATION_PRE_RENAME = 32;
pub const PRJ_NOTIFICATION_PRE_SET_HARDLINK = 64;
pub const PRJ_NOTIFICATION_FILE_RENAMED = 128;
pub const PRJ_NOTIFICATION_HARDLINK_CREATED = 256;
pub const PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_NO_MODIFICATION = 512;
pub const PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_FILE_MODIFIED = 1024;
pub const PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_FILE_DELETED = 2048;
pub const PRJ_NOTIFICATION_FILE_PRE_CONVERT_TO_FULL = 4096;
pub const PRJ_EXT_INFO_TYPE_SYMLINK = 1;
pub const PRJ_FLAG_NONE = 0;
pub const PRJ_FLAG_USE_NEGATIVE_PATH_CACHE = 1;
pub const PRJ_PLACEHOLDER_ID_LENGTH = 128;
pub const PRJ_UPDATE_NONE = 0;
pub const PRJ_UPDATE_ALLOW_DIRTY_METADATA = 1;
pub const PRJ_UPDATE_ALLOW_DIRTY_DATA = 2;
pub const PRJ_UPDATE_ALLOW_TOMBSTONE = 4;
pub const PRJ_UPDATE_RESERVED1 = 8;
pub const PRJ_UPDATE_RESERVED2 = 16;
pub const PRJ_UPDATE_ALLOW_READ_ONLY = 32;
pub const PRJ_UPDATE_MAX_VAL = 64;
pub const PRJ_UPDATE_FAILURE_CAUSE_NONE = 0;
pub const PRJ_UPDATE_FAILURE_CAUSE_DIRTY_METADATA = 1;
pub const PRJ_UPDATE_FAILURE_CAUSE_DIRTY_DATA = 2;
pub const PRJ_UPDATE_FAILURE_CAUSE_TOMBSTONE = 4;
pub const PRJ_UPDATE_FAILURE_CAUSE_READ_ONLY = 8;
pub const PRJ_FILE_STATE_PLACEHOLDER = 1;
pub const PRJ_FILE_STATE_HYDRATED_PLACEHOLDER = 2;
pub const PRJ_FILE_STATE_DIRTY_PLACEHOLDER = 4;
pub const PRJ_FILE_STATE_FULL = 8;
pub const PRJ_FILE_STATE_TOMBSTONE = 16;
pub const PRJ_CB_DATA_FLAG_ENUM_RESTART_SCAN = 1;
pub const PRJ_CB_DATA_FLAG_ENUM_RETURN_SINGLE_ENTRY = 2;
pub const PRJ_COMPLETE_COMMAND_TYPE_NOTIFICATION = 1;
pub const PRJ_COMPLETE_COMMAND_TYPE_ENUMERATION = 2;

pub const aliases = struct {
    pub const PRJ_NOTIFY_TYPES = u32;
    pub const PRJ_NOTIFICATION = i32;
    pub const PRJ_EXT_INFO_TYPE = i32;
    pub const PRJ_STARTVIRTUALIZING_FLAGS = i32;
    pub const PRJ_PLACEHOLDER_ID = i32;
    pub const PRJ_UPDATE_TYPES = i32;
    pub const PRJ_UPDATE_FAILURE_CAUSES = i32;
    pub const PRJ_FILE_STATE = i32;
    pub const PRJ_CALLBACK_DATA_FLAGS = i32;
    pub const PRJ_COMPLETE_COMMAND_TYPE = i32;
    pub const PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT = ?*anyopaque;
    pub const PRJ_DIR_ENTRY_BUFFER_HANDLE = ?*anyopaque;
    pub const PRJ_START_DIRECTORY_ENUMERATION_CB = ?*const anyopaque;
    pub const PRJ_GET_DIRECTORY_ENUMERATION_CB = ?*const anyopaque;
    pub const PRJ_END_DIRECTORY_ENUMERATION_CB = ?*const anyopaque;
    pub const PRJ_GET_PLACEHOLDER_INFO_CB = ?*const anyopaque;
    pub const PRJ_GET_FILE_DATA_CB = ?*const anyopaque;
    pub const PRJ_QUERY_FILE_NAME_CB = ?*const anyopaque;
    pub const PRJ_NOTIFICATION_CB = ?*const anyopaque;
    pub const PRJ_CANCEL_COMMAND_CB = ?*const anyopaque;
};
