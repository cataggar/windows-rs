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
    .{ "IsProcessInJob", MethodRecord{ .library = "KERNEL32", .import = "IsProcessInJob", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x80\x85\x0f\x11\x59" } },
    .{ "CreateJobObjectW", MethodRecord{ .library = "KERNEL32", .import = "CreateJobObjectW", .signature = "\x00\x02\x11\x80\x85\x0f\x11\x8b\xb5\x11\x05" } },
    .{ "FreeMemoryJobObject", MethodRecord{ .library = "KERNEL32", .import = "FreeMemoryJobObject", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "OpenJobObjectW", MethodRecord{ .library = "KERNEL32", .import = "OpenJobObjectW", .signature = "\x00\x03\x11\x80\x85\x09\x11\x59\x11\x05" } },
    .{ "AssignProcessToJobObject", MethodRecord{ .library = "KERNEL32", .import = "AssignProcessToJobObject", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x80\x85" } },
    .{ "TerminateJobObject", MethodRecord{ .library = "KERNEL32", .import = "TerminateJobObject", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "SetInformationJobObject", MethodRecord{ .library = "KERNEL32", .import = "SetInformationJobObject", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\xc0\x00\x80\xd5\x0f\x01\x09" } },
    .{ "SetIoRateControlInformationJobObject", MethodRecord{ .library = "KERNEL32", .import = "SetIoRateControlInformationJobObject", .signature = "\x00\x02\x09\x11\x80\x85\x0f\x11\xc0\x00\xbc\x60" } },
    .{ "QueryInformationJobObject", MethodRecord{ .library = "KERNEL32", .import = "QueryInformationJobObject", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\xc0\x00\x80\xd5\x0f\x01\x09\x0f\x09" } },
    .{ "QueryIoRateControlInformationJobObject", MethodRecord{ .library = "KERNEL32", .import = "QueryIoRateControlInformationJobObject", .signature = "\x00\x04\x09\x11\x80\x85\x11\x05\x0f\x0f\x11\xc0\x00\xbc\x60\x0f\x09" } },
    .{ "UserHandleGrantAccess", MethodRecord{ .library = "USER32", .import = "UserHandleGrantAccess", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x80\x85\x11\x59" } },
    .{ "CreateJobObjectA", MethodRecord{ .library = "KERNEL32", .import = "CreateJobObjectA", .signature = "\x00\x02\x11\x80\x85\x0f\x11\x8b\xb5\x11\x3d" } },
    .{ "OpenJobObjectA", MethodRecord{ .library = "KERNEL32", .import = "OpenJobObjectA", .signature = "\x00\x03\x11\x80\x85\x09\x11\x59\x11\x3d" } },
    .{ "CreateJobSet", MethodRecord{ .library = "KERNEL32", .import = "CreateJobSet", .signature = "\x00\x03\x11\x59\x09\x0f\x11\xc0\x00\x80\xd9\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0x80d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.JobObjects", .name = "JOBOBJECTINFOCLASS" },
        0x80d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.JobObjects", .name = "JOB_SET_ARRAY" },
        0xbc60 => TypeRefEntry{ .namespace = "Windows.Win32.System.JobObjects", .name = "JOBOBJECT_IO_RATE_CONTROL_INFORMATION" },
        else => null,
    };
}

pub const JOB_OBJECT_LIMIT_WORKINGSET = 1;
pub const JOB_OBJECT_LIMIT_PROCESS_TIME = 2;
pub const JOB_OBJECT_LIMIT_JOB_TIME = 4;
pub const JOB_OBJECT_LIMIT_ACTIVE_PROCESS = 8;
pub const JOB_OBJECT_LIMIT_AFFINITY = 16;
pub const JOB_OBJECT_LIMIT_PRIORITY_CLASS = 32;
pub const JOB_OBJECT_LIMIT_PRESERVE_JOB_TIME = 64;
pub const JOB_OBJECT_LIMIT_SCHEDULING_CLASS = 128;
pub const JOB_OBJECT_LIMIT_PROCESS_MEMORY = 256;
pub const JOB_OBJECT_LIMIT_JOB_MEMORY = 512;
pub const JOB_OBJECT_LIMIT_JOB_MEMORY_HIGH = 512;
pub const JOB_OBJECT_LIMIT_DIE_ON_UNHANDLED_EXCEPTION = 1024;
pub const JOB_OBJECT_LIMIT_BREAKAWAY_OK = 2048;
pub const JOB_OBJECT_LIMIT_SILENT_BREAKAWAY_OK = 4096;
pub const JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE = 8192;
pub const JOB_OBJECT_LIMIT_SUBSET_AFFINITY = 16384;
pub const JOB_OBJECT_LIMIT_JOB_MEMORY_LOW = 32768;
pub const JOB_OBJECT_LIMIT_JOB_READ_BYTES = 65536;
pub const JOB_OBJECT_LIMIT_JOB_WRITE_BYTES = 131072;
pub const JOB_OBJECT_LIMIT_RATE_CONTROL = 262144;
pub const JOB_OBJECT_LIMIT_CPU_RATE_CONTROL = 262144;
pub const JOB_OBJECT_LIMIT_IO_RATE_CONTROL = 524288;
pub const JOB_OBJECT_LIMIT_NET_RATE_CONTROL = 1048576;
pub const JOB_OBJECT_LIMIT_VALID_FLAGS = 524287;
pub const JOB_OBJECT_BASIC_LIMIT_VALID_FLAGS = 255;
pub const JOB_OBJECT_EXTENDED_LIMIT_VALID_FLAGS = 32767;
pub const JOB_OBJECT_NOTIFICATION_LIMIT_VALID_FLAGS = 2064900;
pub const JOB_OBJECT_UILIMIT_NONE = 0;
pub const JOB_OBJECT_UILIMIT_HANDLES = 1;
pub const JOB_OBJECT_UILIMIT_READCLIPBOARD = 2;
pub const JOB_OBJECT_UILIMIT_WRITECLIPBOARD = 4;
pub const JOB_OBJECT_UILIMIT_SYSTEMPARAMETERS = 8;
pub const JOB_OBJECT_UILIMIT_DISPLAYSETTINGS = 16;
pub const JOB_OBJECT_UILIMIT_GLOBALATOMS = 32;
pub const JOB_OBJECT_UILIMIT_DESKTOP = 64;
pub const JOB_OBJECT_UILIMIT_EXITWINDOWS = 128;
pub const JOB_OBJECT_SECURITY_NO_ADMIN = 1;
pub const JOB_OBJECT_SECURITY_RESTRICTED_TOKEN = 2;
pub const JOB_OBJECT_SECURITY_ONLY_TOKEN = 4;
pub const JOB_OBJECT_SECURITY_FILTER_TOKENS = 8;
pub const JOB_OBJECT_SECURITY_VALID_FLAGS = 15;
pub const JOB_OBJECT_CPU_RATE_CONTROL_ENABLE = 1;
pub const JOB_OBJECT_CPU_RATE_CONTROL_WEIGHT_BASED = 2;
pub const JOB_OBJECT_CPU_RATE_CONTROL_HARD_CAP = 4;
pub const JOB_OBJECT_CPU_RATE_CONTROL_NOTIFY = 8;
pub const JOB_OBJECT_CPU_RATE_CONTROL_MIN_MAX_RATE = 16;
pub const JOB_OBJECT_CPU_RATE_CONTROL_VALID_FLAGS = 63;
pub const JOB_OBJECT_TERMINATE_AT_END_OF_JOB = 0;
pub const JOB_OBJECT_POST_AT_END_OF_JOB = 1;
pub const ToleranceLow = 1;
pub const ToleranceMedium = 2;
pub const ToleranceHigh = 3;
pub const ToleranceIntervalShort = 1;
pub const ToleranceIntervalMedium = 2;
pub const ToleranceIntervalLong = 3;
pub const JOB_OBJECT_NET_RATE_CONTROL_ENABLE = 1;
pub const JOB_OBJECT_NET_RATE_CONTROL_MAX_BANDWIDTH = 2;
pub const JOB_OBJECT_NET_RATE_CONTROL_DSCP_TAG = 4;
pub const JOB_OBJECT_NET_RATE_CONTROL_VALID_FLAGS = 7;
pub const JOB_OBJECT_IO_RATE_CONTROL_ENABLE = 1;
pub const JOB_OBJECT_IO_RATE_CONTROL_STANDALONE_VOLUME = 2;
pub const JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ALL = 4;
pub const JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ON_SOFT_CAP = 8;
pub const JOB_OBJECT_IO_RATE_CONTROL_VALID_FLAGS = 15;
pub const JOBOBJECT_IO_ATTRIBUTION_CONTROL_ENABLE = 1;
pub const JOBOBJECT_IO_ATTRIBUTION_CONTROL_DISABLE = 2;
pub const JOBOBJECT_IO_ATTRIBUTION_CONTROL_VALID_FLAGS = 3;
pub const JobObjectBasicAccountingInformation = 1;
pub const JobObjectBasicLimitInformation = 2;
pub const JobObjectBasicProcessIdList = 3;
pub const JobObjectBasicUIRestrictions = 4;
pub const JobObjectSecurityLimitInformation = 5;
pub const JobObjectEndOfJobTimeInformation = 6;
pub const JobObjectAssociateCompletionPortInformation = 7;
pub const JobObjectBasicAndIoAccountingInformation = 8;
pub const JobObjectExtendedLimitInformation = 9;
pub const JobObjectJobSetInformation = 10;
pub const JobObjectGroupInformation = 11;
pub const JobObjectNotificationLimitInformation = 12;
pub const JobObjectLimitViolationInformation = 13;
pub const JobObjectGroupInformationEx = 14;
pub const JobObjectCpuRateControlInformation = 15;
pub const JobObjectCompletionFilter = 16;
pub const JobObjectCompletionCounter = 17;
pub const JobObjectReserved1Information = 18;
pub const JobObjectReserved2Information = 19;
pub const JobObjectReserved3Information = 20;
pub const JobObjectReserved4Information = 21;
pub const JobObjectReserved5Information = 22;
pub const JobObjectReserved6Information = 23;
pub const JobObjectReserved7Information = 24;
pub const JobObjectReserved8Information = 25;
pub const JobObjectReserved9Information = 26;
pub const JobObjectReserved10Information = 27;
pub const JobObjectReserved11Information = 28;
pub const JobObjectReserved12Information = 29;
pub const JobObjectReserved13Information = 30;
pub const JobObjectReserved14Information = 31;
pub const JobObjectNetRateControlInformation = 32;
pub const JobObjectNotificationLimitInformation2 = 33;
pub const JobObjectLimitViolationInformation2 = 34;
pub const JobObjectCreateSilo = 35;
pub const JobObjectSiloBasicInformation = 36;
pub const JobObjectReserved15Information = 37;
pub const JobObjectReserved16Information = 38;
pub const JobObjectReserved17Information = 39;
pub const JobObjectReserved18Information = 40;
pub const JobObjectReserved19Information = 41;
pub const JobObjectReserved20Information = 42;
pub const JobObjectReserved21Information = 43;
pub const JobObjectReserved22Information = 44;
pub const JobObjectReserved23Information = 45;
pub const JobObjectReserved24Information = 46;
pub const JobObjectReserved25Information = 47;
pub const JobObjectReserved26Information = 48;
pub const JobObjectReserved27Information = 49;
pub const JobObjectReserved28Information = 50;
pub const JobObjectNetworkAccountingInformation = 51;
pub const MaxJobObjectInfoClass = 52;

pub const aliases = struct {
    pub const JOB_OBJECT_LIMIT = u32;
    pub const JOB_OBJECT_UILIMIT = u32;
    pub const JOB_OBJECT_SECURITY = u32;
    pub const JOB_OBJECT_CPU_RATE_CONTROL = u32;
    pub const JOB_OBJECT_TERMINATE_AT_END_ACTION = u32;
    pub const JOBOBJECT_RATE_CONTROL_TOLERANCE = i32;
    pub const JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL = i32;
    pub const JOB_OBJECT_NET_RATE_CONTROL_FLAGS = i32;
    pub const JOB_OBJECT_IO_RATE_CONTROL_FLAGS = i32;
    pub const JOBOBJECT_IO_ATTRIBUTION_CONTROL_FLAGS = i32;
    pub const JOBOBJECTINFOCLASS = i32;
};
