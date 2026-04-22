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
    .{ "EnableThreadProfiling", MethodRecord{ .library = "KERNEL32", .import = "EnableThreadProfiling", .signature = "\x00\x04\x09\x11\x80\x85\x09\x0b\x0f\x11\x80\x85" } },
    .{ "DisableThreadProfiling", MethodRecord{ .library = "KERNEL32", .import = "DisableThreadProfiling", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "QueryThreadProfiling", MethodRecord{ .library = "KERNEL32", .import = "QueryThreadProfiling", .signature = "\x00\x02\x09\x11\x80\x85\x0f\x11\x87\x79" } },
    .{ "ReadThreadProfilingData", MethodRecord{ .library = "KERNEL32", .import = "ReadThreadProfilingData", .signature = "\x00\x03\x09\x11\x80\x85\x09\x0f\x11\xc0\x01\xb6\x38" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0x1b638 => TypeRefEntry{ .namespace = "Windows.Win32.System.Performance.HardwareCounterProfiling", .name = "PERFORMANCE_DATA" },
        else => null,
    };
}

pub const PMCCounter = 0;
pub const MaxHardwareCounterType = 1;

pub const aliases = struct {
    pub const HARDWARE_COUNTER_TYPE = i32;
};
