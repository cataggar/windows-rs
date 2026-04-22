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
    .{ "CreateIoCompletionPort", MethodRecord{ .library = "KERNEL32", .import = "CreateIoCompletionPort", .signature = "\x00\x04\x11\x80\x85\x11\x80\x85\x11\x80\x85\x19\x09" } },
    .{ "GetQueuedCompletionStatus", MethodRecord{ .library = "KERNEL32", .import = "GetQueuedCompletionStatus", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x09\x0f\x19\x0f\x0f\x11\x8b\xed\x09" } },
    .{ "GetQueuedCompletionStatusEx", MethodRecord{ .library = "KERNEL32", .import = "GetQueuedCompletionStatusEx", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x11\xb3\xd5\x09\x0f\x09\x09\x11\x59" } },
    .{ "PostQueuedCompletionStatus", MethodRecord{ .library = "KERNEL32", .import = "PostQueuedCompletionStatus", .signature = "\x00\x04\x11\x59\x11\x80\x85\x09\x19\x0f\x11\x8b\xed" } },
    .{ "DeviceIoControl", MethodRecord{ .library = "KERNEL32", .import = "DeviceIoControl", .signature = "\x00\x08\x11\x59\x11\x80\x85\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09\x0f\x11\x8b\xed" } },
    .{ "GetOverlappedResult", MethodRecord{ .library = "KERNEL32", .import = "GetOverlappedResult", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\x8b\xed\x0f\x09\x11\x59" } },
    .{ "CancelIoEx", MethodRecord{ .library = "KERNEL32", .import = "CancelIoEx", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x8b\xed" } },
    .{ "CancelIo", MethodRecord{ .library = "KERNEL32", .import = "CancelIo", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "GetOverlappedResultEx", MethodRecord{ .library = "KERNEL32", .import = "GetOverlappedResultEx", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\x8b\xed\x0f\x09\x09\x11\x59" } },
    .{ "CancelSynchronousIo", MethodRecord{ .library = "KERNEL32", .import = "CancelSynchronousIo", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "BindIoCompletionCallback", MethodRecord{ .library = "KERNEL32", .import = "BindIoCompletionCallback", .signature = "\x00\x03\x11\x59\x11\x80\x85\x12\x8b\xf1\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0xbed => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED" },
        0xbf1 => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "LPOVERLAPPED_COMPLETION_ROUTINE" },
        0x33d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED_ENTRY" },
        else => null,
    };
}

