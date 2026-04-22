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
    .{ "PssCaptureSnapshot", MethodRecord{ .library = "KERNEL32", .import = "PssCaptureSnapshot", .signature = "\x00\x04\x09\x11\x80\x85\x11\xc0\x00\x40\xfd\x09\x0f\x11\xc0\x00\x41\x01" } },
    .{ "PssFreeSnapshot", MethodRecord{ .library = "KERNEL32", .import = "PssFreeSnapshot", .signature = "\x00\x02\x09\x11\x80\x85\x11\xc0\x00\x41\x01" } },
    .{ "PssQuerySnapshot", MethodRecord{ .library = "KERNEL32", .import = "PssQuerySnapshot", .signature = "\x00\x04\x09\x11\xc0\x00\x41\x01\x11\xc0\x00\x41\x05\x0f\x01\x09" } },
    .{ "PssWalkSnapshot", MethodRecord{ .library = "KERNEL32", .import = "PssWalkSnapshot", .signature = "\x00\x05\x09\x11\xc0\x00\x41\x01\x11\xc0\x00\x41\x09\x11\xc0\x00\x41\x0d\x0f\x01\x09" } },
    .{ "PssDuplicateSnapshot", MethodRecord{ .library = "KERNEL32", .import = "PssDuplicateSnapshot", .signature = "\x00\x05\x09\x11\x80\x85\x11\xc0\x00\x41\x01\x11\x80\x85\x0f\x11\xc0\x00\x41\x01\x11\xc0\x00\x41\x11" } },
    .{ "PssWalkMarkerCreate", MethodRecord{ .library = "KERNEL32", .import = "PssWalkMarkerCreate", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x41\x15\x0f\x11\xc0\x00\x41\x0d" } },
    .{ "PssWalkMarkerFree", MethodRecord{ .library = "KERNEL32", .import = "PssWalkMarkerFree", .signature = "\x00\x01\x09\x11\xc0\x00\x41\x0d" } },
    .{ "PssWalkMarkerGetPosition", MethodRecord{ .library = "KERNEL32", .import = "PssWalkMarkerGetPosition", .signature = "\x00\x02\x09\x11\xc0\x00\x41\x0d\x0f\x19" } },
    .{ "PssWalkMarkerSetPosition", MethodRecord{ .library = "KERNEL32", .import = "PssWalkMarkerSetPosition", .signature = "\x00\x02\x09\x11\xc0\x00\x41\x0d\x19" } },
    .{ "PssWalkMarkerSeekToBeginning", MethodRecord{ .library = "KERNEL32", .import = "PssWalkMarkerSeekToBeginning", .signature = "\x00\x01\x09\x11\xc0\x00\x41\x0d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x40fd => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ProcessSnapshotting", .name = "PSS_CAPTURE_FLAGS" },
        0x4101 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ProcessSnapshotting", .name = "HPSS" },
        0x4105 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ProcessSnapshotting", .name = "PSS_QUERY_INFORMATION_CLASS" },
        0x4109 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ProcessSnapshotting", .name = "PSS_WALK_INFORMATION_CLASS" },
        0x410d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ProcessSnapshotting", .name = "HPSSWALK" },
        0x4111 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ProcessSnapshotting", .name = "PSS_DUPLICATE_FLAGS" },
        0x4115 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ProcessSnapshotting", .name = "PSS_ALLOCATOR" },
        else => null,
    };
}

pub const PSS_PERF_RESOLUTION = 1000000;
pub const PSS_HANDLE_NONE = 0;
pub const PSS_HANDLE_HAVE_TYPE = 1;
pub const PSS_HANDLE_HAVE_NAME = 2;
pub const PSS_HANDLE_HAVE_BASIC_INFORMATION = 4;
pub const PSS_HANDLE_HAVE_TYPE_SPECIFIC_INFORMATION = 8;
pub const PSS_OBJECT_TYPE_UNKNOWN = 0;
pub const PSS_OBJECT_TYPE_PROCESS = 1;
pub const PSS_OBJECT_TYPE_THREAD = 2;
pub const PSS_OBJECT_TYPE_MUTANT = 3;
pub const PSS_OBJECT_TYPE_EVENT = 4;
pub const PSS_OBJECT_TYPE_SECTION = 5;
pub const PSS_OBJECT_TYPE_SEMAPHORE = 6;
pub const PSS_CAPTURE_NONE = 0;
pub const PSS_CAPTURE_VA_CLONE = 1;
pub const PSS_CAPTURE_RESERVED_00000002 = 2;
pub const PSS_CAPTURE_HANDLES = 4;
pub const PSS_CAPTURE_HANDLE_NAME_INFORMATION = 8;
pub const PSS_CAPTURE_HANDLE_BASIC_INFORMATION = 16;
pub const PSS_CAPTURE_HANDLE_TYPE_SPECIFIC_INFORMATION = 32;
pub const PSS_CAPTURE_HANDLE_TRACE = 64;
pub const PSS_CAPTURE_THREADS = 128;
pub const PSS_CAPTURE_THREAD_CONTEXT = 256;
pub const PSS_CAPTURE_THREAD_CONTEXT_EXTENDED = 512;
pub const PSS_CAPTURE_RESERVED_00000400 = 1024;
pub const PSS_CAPTURE_VA_SPACE = 2048;
pub const PSS_CAPTURE_VA_SPACE_SECTION_INFORMATION = 4096;
pub const PSS_CAPTURE_IPT_TRACE = 8192;
pub const PSS_CAPTURE_RESERVED_00004000 = 16384;
pub const PSS_CREATE_BREAKAWAY_OPTIONAL = 67108864;
pub const PSS_CREATE_BREAKAWAY = 134217728;
pub const PSS_CREATE_FORCE_BREAKAWAY = 268435456;
pub const PSS_CREATE_USE_VM_ALLOCATIONS = 536870912;
pub const PSS_CREATE_MEASURE_PERFORMANCE = 1073741824;
pub const PSS_CREATE_RELEASE_SECTION = 2147483648;
pub const PSS_QUERY_PROCESS_INFORMATION = 0;
pub const PSS_QUERY_VA_CLONE_INFORMATION = 1;
pub const PSS_QUERY_AUXILIARY_PAGES_INFORMATION = 2;
pub const PSS_QUERY_VA_SPACE_INFORMATION = 3;
pub const PSS_QUERY_HANDLE_INFORMATION = 4;
pub const PSS_QUERY_THREAD_INFORMATION = 5;
pub const PSS_QUERY_HANDLE_TRACE_INFORMATION = 6;
pub const PSS_QUERY_PERFORMANCE_COUNTERS = 7;
pub const PSS_WALK_AUXILIARY_PAGES = 0;
pub const PSS_WALK_VA_SPACE = 1;
pub const PSS_WALK_HANDLES = 2;
pub const PSS_WALK_THREADS = 3;
pub const PSS_WALK_THREAD_NAME = 4;
pub const PSS_DUPLICATE_NONE = 0;
pub const PSS_DUPLICATE_CLOSE_SOURCE = 1;
pub const PSS_PROCESS_FLAGS_NONE = 0;
pub const PSS_PROCESS_FLAGS_PROTECTED = 1;
pub const PSS_PROCESS_FLAGS_WOW64 = 2;
pub const PSS_PROCESS_FLAGS_RESERVED_03 = 4;
pub const PSS_PROCESS_FLAGS_RESERVED_04 = 8;
pub const PSS_PROCESS_FLAGS_FROZEN = 16;
pub const PSS_THREAD_FLAGS_NONE = 0;
pub const PSS_THREAD_FLAGS_TERMINATED = 1;

pub const aliases = struct {
    pub const PSS_HANDLE_FLAGS = i32;
    pub const PSS_OBJECT_TYPE = i32;
    pub const PSS_CAPTURE_FLAGS = u32;
    pub const PSS_QUERY_INFORMATION_CLASS = i32;
    pub const PSS_WALK_INFORMATION_CLASS = i32;
    pub const PSS_DUPLICATE_FLAGS = i32;
    pub const PSS_PROCESS_FLAGS = i32;
    pub const PSS_THREAD_FLAGS = i32;
    pub const HPSS = ?*anyopaque;
    pub const HPSSWALK = ?*anyopaque;
};
