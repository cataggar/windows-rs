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
    .{ "CreateToolhelp32Snapshot", MethodRecord{ .library = "KERNEL32", .import = "CreateToolhelp32Snapshot", .signature = "\x00\x02\x11\x80\x85\x11\xa1\x1d\x09" } },
    .{ "Heap32ListFirst", MethodRecord{ .library = "KERNEL32", .import = "Heap32ListFirst", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x41\x19" } },
    .{ "Heap32ListNext", MethodRecord{ .library = "KERNEL32", .import = "Heap32ListNext", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x41\x19" } },
    .{ "Heap32First", MethodRecord{ .library = "KERNEL32", .import = "Heap32First", .signature = "\x00\x03\x11\x59\x0f\x11\xc0\x00\x41\x1d\x09\x19" } },
    .{ "Heap32Next", MethodRecord{ .library = "KERNEL32", .import = "Heap32Next", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x41\x1d" } },
    .{ "Toolhelp32ReadProcessMemory", MethodRecord{ .library = "KERNEL32", .import = "Toolhelp32ReadProcessMemory", .signature = "\x00\x05\x11\x59\x09\x0f\x01\x0f\x01\x19\x0f\x19" } },
    .{ "Process32FirstW", MethodRecord{ .library = "KERNEL32", .import = "Process32FirstW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x41\x21" } },
    .{ "Process32NextW", MethodRecord{ .library = "KERNEL32", .import = "Process32NextW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x41\x21" } },
    .{ "Process32First", MethodRecord{ .library = "KERNEL32", .import = "Process32First", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x41\x25" } },
    .{ "Process32Next", MethodRecord{ .library = "KERNEL32", .import = "Process32Next", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x41\x25" } },
    .{ "Thread32First", MethodRecord{ .library = "KERNEL32", .import = "Thread32First", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x41\x29" } },
    .{ "Thread32Next", MethodRecord{ .library = "KERNEL32", .import = "Thread32Next", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x41\x29" } },
    .{ "Module32FirstW", MethodRecord{ .library = "KERNEL32", .import = "Module32FirstW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x41\x2d" } },
    .{ "Module32NextW", MethodRecord{ .library = "KERNEL32", .import = "Module32NextW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x41\x2d" } },
    .{ "Module32First", MethodRecord{ .library = "KERNEL32", .import = "Module32First", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x41\x31" } },
    .{ "Module32Next", MethodRecord{ .library = "KERNEL32", .import = "Module32Next", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x41\x31" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x211d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ToolHelp", .name = "CREATE_TOOLHELP_SNAPSHOT_FLAGS" },
        0x4119 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ToolHelp", .name = "HEAPLIST32" },
        0x411d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ToolHelp", .name = "HEAPENTRY32" },
        0x4121 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ToolHelp", .name = "PROCESSENTRY32W" },
        0x4125 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ToolHelp", .name = "PROCESSENTRY32" },
        0x4129 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ToolHelp", .name = "THREADENTRY32" },
        0x412d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ToolHelp", .name = "MODULEENTRY32W" },
        0x4131 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.ToolHelp", .name = "MODULEENTRY32" },
        else => null,
    };
}

pub const TH32CS_INHERIT = 2147483648;
pub const TH32CS_SNAPALL = 15;
pub const TH32CS_SNAPHEAPLIST = 1;
pub const TH32CS_SNAPMODULE = 8;
pub const TH32CS_SNAPMODULE32 = 16;
pub const TH32CS_SNAPPROCESS = 2;
pub const TH32CS_SNAPTHREAD = 4;
pub const LF32_FIXED = 1;
pub const LF32_FREE = 2;
pub const LF32_MOVEABLE = 4;
pub const MAX_MODULE_NAME32 = 255;
pub const HF32_DEFAULT = 1;
pub const HF32_SHARED = 2;

pub const aliases = struct {
    pub const CREATE_TOOLHELP_SNAPSHOT_FLAGS = u32;
    pub const HEAPENTRY32_FLAGS = u32;
};
