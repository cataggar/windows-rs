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

pub const method_def_by_name = std.static_string_map.StaticStringMap(MethodRecord).initComptime(.{});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const PROGRESS_INDETERMINATE = -1;
pub const PHOTOACQ_ERROR_RESTART_REQUIRED = -2147180543;
pub const PHOTOACQ_RUN_DEFAULT = 0;
pub const PHOTOACQ_NO_GALLERY_LAUNCH = 1;
pub const PHOTOACQ_DISABLE_AUTO_ROTATE = 2;
pub const PHOTOACQ_DISABLE_PLUGINS = 4;
pub const PHOTOACQ_DISABLE_GROUP_TAG_PROMPT = 8;
pub const PHOTOACQ_DISABLE_DB_INTEGRATION = 16;
pub const PHOTOACQ_DELETE_AFTER_ACQUIRE = 32;
pub const PHOTOACQ_DISABLE_DUPLICATE_DETECTION = 64;
pub const PHOTOACQ_ENABLE_THUMBNAIL_CACHING = 128;
pub const PHOTOACQ_DISABLE_METADATA_WRITE = 256;
pub const PHOTOACQ_DISABLE_THUMBNAIL_PROGRESS = 512;
pub const PHOTOACQ_DISABLE_SETTINGS_LINK = 1024;
pub const PHOTOACQ_ABORT_ON_SETTINGS_UPDATE = 2048;
pub const PHOTOACQ_IMPORT_VIDEO_AS_MULTIPLE_FILES = 4096;
pub const DSF_WPD_DEVICES = 1;
pub const DSF_WIA_CAMERAS = 2;
pub const DSF_WIA_SCANNERS = 4;
pub const DSF_STI_DEVICES = 8;
pub const DSF_TWAIN_DEVICES = 16;
pub const DSF_FS_DEVICES = 32;
pub const DSF_DV_DEVICES = 64;
pub const DSF_ALL_DEVICES = 65535;
pub const DSF_CPL_MODE = 65536;
pub const DSF_SHOW_OFFLINE = 131072;
pub const PAPS_PRESAVE = 0;
pub const PAPS_POSTSAVE = 1;
pub const PAPS_CLEANUP = 2;
pub const USER_INPUT_DEFAULT = 0;
pub const USER_INPUT_PATH_ELEMENT = 1;
pub const PHOTOACQUIRE_ERROR_SKIPRETRYCANCEL = 0;
pub const PHOTOACQUIRE_ERROR_RETRYCANCEL = 1;
pub const PHOTOACQUIRE_ERROR_YESNO = 2;
pub const PHOTOACQUIRE_ERROR_OK = 3;
pub const PHOTOACQUIRE_RESULT_YES = 0;
pub const PHOTOACQUIRE_RESULT_NO = 1;
pub const PHOTOACQUIRE_RESULT_OK = 2;
pub const PHOTOACQUIRE_RESULT_SKIP = 3;
pub const PHOTOACQUIRE_RESULT_SKIP_ALL = 4;
pub const PHOTOACQUIRE_RESULT_RETRY = 5;
pub const PHOTOACQUIRE_RESULT_ABORT = 6;
pub const PROGRESS_DIALOG_ICON_SMALL = 0;
pub const PROGRESS_DIALOG_ICON_LARGE = 1;
pub const PROGRESS_DIALOG_ICON_THUMBNAIL = 2;
pub const PROGRESS_DIALOG_BITMAP_THUMBNAIL = 3;
pub const PROGRESS_DIALOG_CHECKBOX_ID_DEFAULT = 0;
pub const DST_UNKNOWN_DEVICE = 0;
pub const DST_WPD_DEVICE = 1;
pub const DST_WIA_DEVICE = 2;
pub const DST_STI_DEVICE = 3;
pub const DSF_TWAIN_DEVICE = 4;
pub const DST_FS_DEVICE = 5;
pub const DST_DV_DEVICE = 6;

pub const aliases = struct {
    pub const USER_INPUT_STRING_TYPE = i32;
    pub const ERROR_ADVISE_MESSAGE_TYPE = i32;
    pub const ERROR_ADVISE_RESULT = i32;
    pub const PROGRESS_DIALOG_IMAGE_TYPE = i32;
    pub const PROGRESS_DIALOG_CHECKBOX_ID = i32;
    pub const DEVICE_SELECTION_DEVICE_TYPE = i32;
};
