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
    .{ "MatchEnumTag", MethodRecord{ .library = "NETSH", .import = "MatchEnumTag", .signature = "\x00\x05\x09\x11\x80\x85\x11\x05\x09\x0f\x11\xb7\xad\x0f\x09" } },
    .{ "MatchToken", MethodRecord{ .library = "NETSH", .import = "MatchToken", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "PreprocessCommand", MethodRecord{ .library = "NETSH", .import = "PreprocessCommand", .signature = "\x00\x09\x09\x11\x80\x85\x0f\x11\x05\x09\x09\x0f\x11\xb7\xb1\x09\x09\x09\x0f\x09" } },
    .{ "PrintError", MethodRecord{ .library = "NETSH", .import = "PrintError", .signature = "\x05\x02\x09\x11\x80\x85\x09" } },
    .{ "PrintMessageFromModule", MethodRecord{ .library = "NETSH", .import = "PrintMessageFromModule", .signature = "\x05\x02\x09\x11\x80\x85\x09" } },
    .{ "PrintMessage", MethodRecord{ .library = "NETSH", .import = "PrintMessage", .signature = "\x05\x01\x09\x11\x05" } },
    .{ "RegisterContext", MethodRecord{ .library = "NETSH", .import = "RegisterContext", .signature = "\x00\x01\x09\x0f\x11\xb7\xb5" } },
    .{ "RegisterHelper", MethodRecord{ .library = "NETSH", .import = "RegisterHelper", .signature = "\x00\x02\x09\x0f\x11\x0d\x0f\x11\xb7\xb9" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x37ad => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.NetShell", .name = "TOKEN_VALUE" },
        0x37b1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.NetShell", .name = "TAG_TYPE" },
        0x37b5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.NetShell", .name = "NS_CONTEXT_ATTRIBUTES" },
        0x37b9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.NetShell", .name = "NS_HELPER_ATTRIBUTES" },
        else => null,
    };
}

pub const NETSH_ERROR_BASE = 15000;
pub const ERROR_NO_ENTRIES = 15000;
pub const ERROR_INVALID_SYNTAX = 15001;
pub const ERROR_PROTOCOL_NOT_IN_TRANSPORT = 15002;
pub const ERROR_NO_CHANGE = 15003;
pub const ERROR_CMD_NOT_FOUND = 15004;
pub const ERROR_ENTRY_PT_NOT_FOUND = 15005;
pub const ERROR_DLL_LOAD_FAILED = 15006;
pub const ERROR_INIT_DISPLAY = 15007;
pub const ERROR_TAG_ALREADY_PRESENT = 15008;
pub const ERROR_INVALID_OPTION_TAG = 15009;
pub const ERROR_NO_TAG = 15010;
pub const ERROR_MISSING_OPTION = 15011;
pub const ERROR_TRANSPORT_NOT_PRESENT = 15012;
pub const ERROR_SHOW_USAGE = 15013;
pub const ERROR_INVALID_OPTION_VALUE = 15014;
pub const ERROR_OKAY = 15015;
pub const ERROR_CONTINUE_IN_PARENT_CONTEXT = 15016;
pub const ERROR_SUPPRESS_OUTPUT = 15017;
pub const ERROR_HELPER_ALREADY_REGISTERED = 15018;
pub const ERROR_CONTEXT_ALREADY_REGISTERED = 15019;
pub const ERROR_PARSING_FAILURE = 15020;
pub const NETSH_ERROR_END = 15019;
pub const MAX_NAME_LEN = 48;
pub const NETSH_VERSION_50 = 20480;
pub const NETSH_MAX_TOKEN_LENGTH = 64;
pub const NETSH_MAX_CMD_TOKEN_LENGTH = 128;
pub const DEFAULT_CONTEXT_PRIORITY = 100;
pub const CMD_FLAG_PRIVATE = 1;
pub const CMD_FLAG_INTERACTIVE = 2;
pub const CMD_FLAG_LOCAL = 8;
pub const CMD_FLAG_ONLINE = 16;
pub const CMD_FLAG_HIDDEN = 32;
pub const CMD_FLAG_LIMIT_MASK = 65535;
pub const CMD_FLAG_PRIORITY = -2147483648;
pub const NS_REQ_ZERO = 0;
pub const NS_REQ_PRESENT = 1;
pub const NS_REQ_ALLOW_MULTIPLE = 2;
pub const NS_REQ_ONE_OR_MORE = 3;
pub const NS_EVENT_LOOP = 65536;
pub const NS_EVENT_LAST_N = 1;
pub const NS_EVENT_LAST_SECS = 2;
pub const NS_EVENT_FROM_N = 4;
pub const NS_EVENT_FROM_START = 8;
pub const NETSH_COMMIT = 0;
pub const NETSH_UNCOMMIT = 1;
pub const NETSH_FLUSH = 2;
pub const NETSH_COMMIT_STATE = 3;
pub const NETSH_SAVE = 4;

pub const aliases = struct {
    pub const NS_CMD_FLAGS = i32;
    pub const NS_REQS = i32;
    pub const NS_EVENTS = i32;
    pub const NS_MODE_CHANGE = i32;
    pub const PGET_RESOURCE_STRING_FN = ?*const anyopaque;
    pub const PNS_CONTEXT_COMMIT_FN = ?*const anyopaque;
    pub const PNS_CONTEXT_CONNECT_FN = ?*const anyopaque;
    pub const PNS_CONTEXT_DUMP_FN = ?*const anyopaque;
    pub const PNS_DLL_STOP_FN = ?*const anyopaque;
    pub const PNS_HELPER_START_FN = ?*const anyopaque;
    pub const PNS_HELPER_STOP_FN = ?*const anyopaque;
    pub const PFN_HANDLE_CMD = ?*const anyopaque;
    pub const PNS_OSVERSIONCHECK = ?*const anyopaque;
    pub const PNS_DLL_INIT_FN = ?*const anyopaque;
};
