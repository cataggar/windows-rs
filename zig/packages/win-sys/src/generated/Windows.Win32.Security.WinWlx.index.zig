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

pub const WLX_SAS_ACTION_SHUTDOWN = 5;
pub const WLX_SAS_ACTION_SHUTDOWN_REBOOT = 11;
pub const WLX_SAS_ACTION_SHUTDOWN_POWER_OFF = 10;
pub const WLX_VERSION_1_0 = 65536;
pub const WLX_VERSION_1_1 = 65537;
pub const WLX_VERSION_1_2 = 65538;
pub const WLX_VERSION_1_3 = 65539;
pub const WLX_VERSION_1_4 = 65540;
pub const WLX_CURRENT_VERSION = 65540;
pub const WLX_SAS_TYPE_TIMEOUT = 0;
pub const WLX_SAS_TYPE_CTRL_ALT_DEL = 1;
pub const WLX_SAS_TYPE_SCRNSVR_TIMEOUT = 2;
pub const WLX_SAS_TYPE_SCRNSVR_ACTIVITY = 3;
pub const WLX_SAS_TYPE_USER_LOGOFF = 4;
pub const WLX_SAS_TYPE_SC_INSERT = 5;
pub const WLX_SAS_TYPE_SC_REMOVE = 6;
pub const WLX_SAS_TYPE_AUTHENTICATED = 7;
pub const WLX_SAS_TYPE_SC_FIRST_READER_ARRIVED = 8;
pub const WLX_SAS_TYPE_SC_LAST_READER_REMOVED = 9;
pub const WLX_SAS_TYPE_SWITCHUSER = 10;
pub const WLX_SAS_TYPE_MAX_MSFT_VALUE = 127;
pub const WLX_LOGON_OPT_NO_PROFILE = 1;
pub const WLX_PROFILE_TYPE_V1_0 = 1;
pub const WLX_PROFILE_TYPE_V2_0 = 2;
pub const WLX_SAS_ACTION_LOGON = 1;
pub const WLX_SAS_ACTION_NONE = 2;
pub const WLX_SAS_ACTION_LOCK_WKSTA = 3;
pub const WLX_SAS_ACTION_LOGOFF = 4;
pub const WLX_SAS_ACTION_PWD_CHANGED = 6;
pub const WLX_SAS_ACTION_TASKLIST = 7;
pub const WLX_SAS_ACTION_UNLOCK_WKSTA = 8;
pub const WLX_SAS_ACTION_FORCE_LOGOFF = 9;
pub const WLX_SAS_ACTION_SHUTDOWN_SLEEP = 12;
pub const WLX_SAS_ACTION_SHUTDOWN_SLEEP2 = 13;
pub const WLX_SAS_ACTION_SHUTDOWN_HIBERNATE = 14;
pub const WLX_SAS_ACTION_RECONNECTED = 15;
pub const WLX_SAS_ACTION_DELAYED_FORCE_LOGOFF = 16;
pub const WLX_SAS_ACTION_SWITCH_CONSOLE = 17;
pub const WLX_WM_SAS = 1625;
pub const WLX_DLG_SAS = 101;
pub const WLX_DLG_INPUT_TIMEOUT = 102;
pub const WLX_DLG_SCREEN_SAVER_TIMEOUT = 103;
pub const WLX_DLG_USER_LOGOFF = 104;
pub const WLX_DIRECTORY_LENGTH = 256;
pub const WLX_CREDENTIAL_TYPE_V1_0 = 1;
pub const WLX_CREDENTIAL_TYPE_V2_0 = 2;
pub const WLX_CONSOLESWITCHCREDENTIAL_TYPE_V1_0 = 1;
pub const STATUSMSG_OPTION_NOANIMATION = 1;
pub const STATUSMSG_OPTION_SETFOREGROUND = 2;
pub const WLX_DESKTOP_NAME = 1;
pub const WLX_DESKTOP_HANDLE = 2;
pub const WLX_CREATE_INSTANCE_ONLY = 1;
pub const WLX_CREATE_USER = 2;
pub const WLX_OPTION_USE_CTRL_ALT_DEL = 1;
pub const WLX_OPTION_CONTEXT_POINTER = 2;
pub const WLX_OPTION_USE_SMART_CARD = 3;
pub const WLX_OPTION_FORCE_LOGOFF_TIME = 4;
pub const WLX_OPTION_IGNORE_AUTO_LOGON = 8;
pub const WLX_OPTION_NO_SWITCH_ON_SAS = 9;
pub const WLX_OPTION_SMART_CARD_PRESENT = 65537;
pub const WLX_OPTION_SMART_CARD_INFO = 65538;
pub const WLX_OPTION_DISPATCH_TABLE_SIZE = 65539;

pub const aliases = struct {
    pub const WLX_SHUTDOWN_TYPE = u32;
};
