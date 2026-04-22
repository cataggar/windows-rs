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
    .{ "CreatePipe", MethodRecord{ .library = "KERNEL32", .import = "CreatePipe", .signature = "\x00\x04\x11\x59\x0f\x11\x80\x85\x0f\x11\x80\x85\x0f\x11\x8b\xb5\x09" } },
    .{ "ConnectNamedPipe", MethodRecord{ .library = "KERNEL32", .import = "ConnectNamedPipe", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x8b\xed" } },
    .{ "DisconnectNamedPipe", MethodRecord{ .library = "KERNEL32", .import = "DisconnectNamedPipe", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "SetNamedPipeHandleState", MethodRecord{ .library = "KERNEL32", .import = "SetNamedPipeHandleState", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\xa2\x15\x0f\x09\x0f\x09" } },
    .{ "PeekNamedPipe", MethodRecord{ .library = "KERNEL32", .import = "PeekNamedPipe", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x01\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "TransactNamedPipe", MethodRecord{ .library = "KERNEL32", .import = "TransactNamedPipe", .signature = "\x00\x07\x11\x59\x11\x80\x85\x0f\x01\x09\x0f\x01\x09\x0f\x09\x0f\x11\x8b\xed" } },
    .{ "CreateNamedPipeW", MethodRecord{ .library = "KERNEL32", .import = "CreateNamedPipeW", .signature = "\x00\x08\x11\x80\x85\x11\x05\x11\x8b\xad\x11\xa2\x15\x09\x09\x09\x09\x0f\x11\x8b\xb5" } },
    .{ "WaitNamedPipeW", MethodRecord{ .library = "KERNEL32", .import = "WaitNamedPipeW", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "GetNamedPipeClientComputerNameW", MethodRecord{ .library = "KERNEL32", .import = "GetNamedPipeClientComputerNameW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x05\x09" } },
    .{ "ImpersonateNamedPipeClient", MethodRecord{ .library = "ADVAPI32", .import = "ImpersonateNamedPipeClient", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "GetNamedPipeInfo", MethodRecord{ .library = "KERNEL32", .import = "GetNamedPipeInfo", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\xa2\x15\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "GetNamedPipeHandleStateW", MethodRecord{ .library = "KERNEL32", .import = "GetNamedPipeHandleStateW", .signature = "\x00\x07\x11\x59\x11\x80\x85\x0f\x11\xa2\x15\x0f\x09\x0f\x09\x0f\x09\x11\x05\x09" } },
    .{ "CallNamedPipeW", MethodRecord{ .library = "KERNEL32", .import = "CallNamedPipeW", .signature = "\x00\x07\x11\x59\x11\x05\x0f\x01\x09\x0f\x01\x09\x0f\x09\x09" } },
    .{ "CreateNamedPipeA", MethodRecord{ .library = "KERNEL32", .import = "CreateNamedPipeA", .signature = "\x00\x08\x11\x80\x85\x11\x3d\x11\x8b\xad\x11\xa2\x15\x09\x09\x09\x09\x0f\x11\x8b\xb5" } },
    .{ "GetNamedPipeHandleStateA", MethodRecord{ .library = "KERNEL32", .import = "GetNamedPipeHandleStateA", .signature = "\x00\x07\x11\x59\x11\x80\x85\x0f\x11\xa2\x15\x0f\x09\x0f\x09\x0f\x09\x11\x3d\x09" } },
    .{ "CallNamedPipeA", MethodRecord{ .library = "KERNEL32", .import = "CallNamedPipeA", .signature = "\x00\x07\x11\x59\x11\x3d\x0f\x01\x09\x0f\x01\x09\x0f\x09\x09" } },
    .{ "WaitNamedPipeA", MethodRecord{ .library = "KERNEL32", .import = "WaitNamedPipeA", .signature = "\x00\x02\x11\x59\x11\x3d\x09" } },
    .{ "GetNamedPipeClientComputerNameA", MethodRecord{ .library = "KERNEL32", .import = "GetNamedPipeClientComputerNameA", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x3d\x09" } },
    .{ "GetNamedPipeClientProcessId", MethodRecord{ .library = "KERNEL32", .import = "GetNamedPipeClientProcessId", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x09" } },
    .{ "GetNamedPipeClientSessionId", MethodRecord{ .library = "KERNEL32", .import = "GetNamedPipeClientSessionId", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x09" } },
    .{ "GetNamedPipeServerProcessId", MethodRecord{ .library = "KERNEL32", .import = "GetNamedPipeServerProcessId", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x09" } },
    .{ "GetNamedPipeServerSessionId", MethodRecord{ .library = "KERNEL32", .import = "GetNamedPipeServerSessionId", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0xbad => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FILE_FLAGS_AND_ATTRIBUTES" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0xbed => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED" },
        0x2215 => TypeRefEntry{ .namespace = "Windows.Win32.System.Pipes", .name = "NAMED_PIPE_MODE" },
        else => null,
    };
}

pub const PIPE_WAIT = 0;
pub const PIPE_NOWAIT = 1;
pub const PIPE_READMODE_BYTE = 0;
pub const PIPE_READMODE_MESSAGE = 2;
pub const PIPE_CLIENT_END = 0;
pub const PIPE_SERVER_END = 1;
pub const PIPE_TYPE_BYTE = 0;
pub const PIPE_TYPE_MESSAGE = 4;
pub const PIPE_ACCEPT_REMOTE_CLIENTS = 0;
pub const PIPE_REJECT_REMOTE_CLIENTS = 8;
pub const PIPE_UNLIMITED_INSTANCES = 255;
pub const NMPWAIT_WAIT_FOREVER = 4294967295;
pub const NMPWAIT_NOWAIT = 1;
pub const NMPWAIT_USE_DEFAULT_WAIT = 0;

pub const aliases = struct {
    pub const NAMED_PIPE_MODE = u32;
};
