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

pub const TASK_SUNDAY = 1;
pub const TASK_MONDAY = 2;
pub const TASK_TUESDAY = 4;
pub const TASK_WEDNESDAY = 8;
pub const TASK_THURSDAY = 16;
pub const TASK_FRIDAY = 32;
pub const TASK_SATURDAY = 64;
pub const TASK_FIRST_WEEK = 1;
pub const TASK_SECOND_WEEK = 2;
pub const TASK_THIRD_WEEK = 3;
pub const TASK_FOURTH_WEEK = 4;
pub const TASK_LAST_WEEK = 5;
pub const TASK_JANUARY = 1;
pub const TASK_FEBRUARY = 2;
pub const TASK_MARCH = 4;
pub const TASK_APRIL = 8;
pub const TASK_MAY = 16;
pub const TASK_JUNE = 32;
pub const TASK_JULY = 64;
pub const TASK_AUGUST = 128;
pub const TASK_SEPTEMBER = 256;
pub const TASK_OCTOBER = 512;
pub const TASK_NOVEMBER = 1024;
pub const TASK_DECEMBER = 2048;
pub const TASK_FLAG_INTERACTIVE = 1;
pub const TASK_FLAG_DELETE_WHEN_DONE = 2;
pub const TASK_FLAG_DISABLED = 4;
pub const TASK_FLAG_START_ONLY_IF_IDLE = 16;
pub const TASK_FLAG_KILL_ON_IDLE_END = 32;
pub const TASK_FLAG_DONT_START_IF_ON_BATTERIES = 64;
pub const TASK_FLAG_KILL_IF_GOING_ON_BATTERIES = 128;
pub const TASK_FLAG_RUN_ONLY_IF_DOCKED = 256;
pub const TASK_FLAG_HIDDEN = 512;
pub const TASK_FLAG_RUN_IF_CONNECTED_TO_INTERNET = 1024;
pub const TASK_FLAG_RESTART_ON_IDLE_RESUME = 2048;
pub const TASK_FLAG_SYSTEM_REQUIRED = 4096;
pub const TASK_FLAG_RUN_ONLY_IF_LOGGED_ON = 8192;
pub const TASK_TRIGGER_FLAG_HAS_END_DATE = 1;
pub const TASK_TRIGGER_FLAG_KILL_AT_DURATION_END = 2;
pub const TASK_TRIGGER_FLAG_DISABLED = 4;
pub const TASK_MAX_RUN_TIMES = 1440;
pub const TASK_TIME_TRIGGER_ONCE = 0;
pub const TASK_TIME_TRIGGER_DAILY = 1;
pub const TASK_TIME_TRIGGER_WEEKLY = 2;
pub const TASK_TIME_TRIGGER_MONTHLYDATE = 3;
pub const TASK_TIME_TRIGGER_MONTHLYDOW = 4;
pub const TASK_EVENT_TRIGGER_ON_IDLE = 5;
pub const TASK_EVENT_TRIGGER_AT_SYSTEMSTART = 6;
pub const TASK_EVENT_TRIGGER_AT_LOGON = 7;
pub const TASKPAGE_TASK = 0;
pub const TASKPAGE_SCHEDULE = 1;
pub const TASKPAGE_SETTINGS = 2;
pub const TASK_RUN_NO_FLAGS = 0;
pub const TASK_RUN_AS_SELF = 1;
pub const TASK_RUN_IGNORE_CONSTRAINTS = 2;
pub const TASK_RUN_USE_SESSION_ID = 4;
pub const TASK_RUN_USER_SID = 8;
pub const TASK_ENUM_HIDDEN = 1;
pub const TASK_LOGON_NONE = 0;
pub const TASK_LOGON_PASSWORD = 1;
pub const TASK_LOGON_S4U = 2;
pub const TASK_LOGON_INTERACTIVE_TOKEN = 3;
pub const TASK_LOGON_GROUP = 4;
pub const TASK_LOGON_SERVICE_ACCOUNT = 5;
pub const TASK_LOGON_INTERACTIVE_TOKEN_OR_PASSWORD = 6;
pub const TASK_RUNLEVEL_LUA = 0;
pub const TASK_RUNLEVEL_HIGHEST = 1;
pub const TASK_PROCESSTOKENSID_NONE = 0;
pub const TASK_PROCESSTOKENSID_UNRESTRICTED = 1;
pub const TASK_PROCESSTOKENSID_DEFAULT = 2;
pub const TASK_STATE_UNKNOWN = 0;
pub const TASK_STATE_DISABLED = 1;
pub const TASK_STATE_QUEUED = 2;
pub const TASK_STATE_READY = 3;
pub const TASK_STATE_RUNNING = 4;
pub const TASK_VALIDATE_ONLY = 1;
pub const TASK_CREATE = 2;
pub const TASK_UPDATE = 4;
pub const TASK_CREATE_OR_UPDATE = 6;
pub const TASK_DISABLE = 8;
pub const TASK_DONT_ADD_PRINCIPAL_ACE = 16;
pub const TASK_IGNORE_REGISTRATION_TRIGGERS = 32;
pub const TASK_TRIGGER_EVENT = 0;
pub const TASK_TRIGGER_TIME = 1;
pub const TASK_TRIGGER_DAILY = 2;
pub const TASK_TRIGGER_WEEKLY = 3;
pub const TASK_TRIGGER_MONTHLY = 4;
pub const TASK_TRIGGER_MONTHLYDOW = 5;
pub const TASK_TRIGGER_IDLE = 6;
pub const TASK_TRIGGER_REGISTRATION = 7;
pub const TASK_TRIGGER_BOOT = 8;
pub const TASK_TRIGGER_LOGON = 9;
pub const TASK_TRIGGER_SESSION_STATE_CHANGE = 11;
pub const TASK_TRIGGER_CUSTOM_TRIGGER_01 = 12;
pub const TASK_CONSOLE_CONNECT = 1;
pub const TASK_CONSOLE_DISCONNECT = 2;
pub const TASK_REMOTE_CONNECT = 3;
pub const TASK_REMOTE_DISCONNECT = 4;
pub const TASK_SESSION_LOCK = 7;
pub const TASK_SESSION_UNLOCK = 8;
pub const TASK_ACTION_EXEC = 0;
pub const TASK_ACTION_COM_HANDLER = 5;
pub const TASK_ACTION_SEND_EMAIL = 6;
pub const TASK_ACTION_SHOW_MESSAGE = 7;
pub const TASK_INSTANCES_PARALLEL = 0;
pub const TASK_INSTANCES_QUEUE = 1;
pub const TASK_INSTANCES_IGNORE_NEW = 2;
pub const TASK_INSTANCES_STOP_EXISTING = 3;
pub const TASK_COMPATIBILITY_AT = 0;
pub const TASK_COMPATIBILITY_V1 = 1;
pub const TASK_COMPATIBILITY_V2 = 2;
pub const TASK_COMPATIBILITY_V2_1 = 3;
pub const TASK_COMPATIBILITY_V2_2 = 4;
pub const TASK_COMPATIBILITY_V2_3 = 5;
pub const TASK_COMPATIBILITY_V2_4 = 6;

pub const aliases = struct {
    pub const TASK_TRIGGER_TYPE = i32;
    pub const TASKPAGE = i32;
    pub const TASK_RUN_FLAGS = i32;
    pub const TASK_ENUM_FLAGS = i32;
    pub const TASK_LOGON_TYPE = i32;
    pub const TASK_RUNLEVEL_TYPE = i32;
    pub const TASK_PROCESSTOKENSID_TYPE = i32;
    pub const TASK_STATE = i32;
    pub const TASK_CREATION = i32;
    pub const TASK_TRIGGER_TYPE2 = i32;
    pub const TASK_SESSION_STATE_CHANGE_TYPE = i32;
    pub const TASK_ACTION_TYPE = i32;
    pub const TASK_INSTANCES_POLICY = i32;
    pub const TASK_COMPATIBILITY = i32;
};
