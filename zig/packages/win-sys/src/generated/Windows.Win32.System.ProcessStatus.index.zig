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
    .{ "EnumProcesses", MethodRecord{ .library = "PSAPI", .import = "EnumProcesses", .signature = "\x00\x03\x11\x59\x0f\x09\x09\x0f\x09" } },
    .{ "EnumProcessModules", MethodRecord{ .library = "PSAPI", .import = "EnumProcessModules", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\x81\x81\x09\x0f\x09" } },
    .{ "EnumProcessModulesEx", MethodRecord{ .library = "PSAPI", .import = "EnumProcessModulesEx", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\x81\x81\x09\x0f\x09\x11\xa2\x29" } },
    .{ "GetModuleBaseNameA", MethodRecord{ .library = "PSAPI", .import = "GetModuleBaseNameA", .signature = "\x00\x04\x09\x11\x80\x85\x11\x81\x81\x11\x3d\x09" } },
    .{ "GetModuleBaseNameW", MethodRecord{ .library = "PSAPI", .import = "GetModuleBaseNameW", .signature = "\x00\x04\x09\x11\x80\x85\x11\x81\x81\x11\x05\x09" } },
    .{ "GetModuleFileNameExA", MethodRecord{ .library = "PSAPI", .import = "GetModuleFileNameExA", .signature = "\x00\x04\x09\x11\x80\x85\x11\x81\x81\x11\x3d\x09" } },
    .{ "GetModuleFileNameExW", MethodRecord{ .library = "PSAPI", .import = "GetModuleFileNameExW", .signature = "\x00\x04\x09\x11\x80\x85\x11\x81\x81\x11\x05\x09" } },
    .{ "GetModuleInformation", MethodRecord{ .library = "PSAPI", .import = "GetModuleInformation", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x81\x81\x0f\x11\xc0\x00\x43\xed\x09" } },
    .{ "EmptyWorkingSet", MethodRecord{ .library = "PSAPI", .import = "EmptyWorkingSet", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "InitializeProcessForWsWatch", MethodRecord{ .library = "PSAPI", .import = "InitializeProcessForWsWatch", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "GetWsChanges", MethodRecord{ .library = "PSAPI", .import = "GetWsChanges", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x43\xf1\x09" } },
    .{ "GetWsChangesEx", MethodRecord{ .library = "PSAPI", .import = "GetWsChangesEx", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x43\xf5\x0f\x09" } },
    .{ "GetMappedFileNameW", MethodRecord{ .library = "PSAPI", .import = "GetMappedFileNameW", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x01\x11\x05\x09" } },
    .{ "GetMappedFileNameA", MethodRecord{ .library = "PSAPI", .import = "GetMappedFileNameA", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x01\x11\x3d\x09" } },
    .{ "EnumDeviceDrivers", MethodRecord{ .library = "PSAPI", .import = "EnumDeviceDrivers", .signature = "\x00\x03\x11\x59\x0f\x0f\x01\x09\x0f\x09" } },
    .{ "GetDeviceDriverBaseNameA", MethodRecord{ .library = "PSAPI", .import = "GetDeviceDriverBaseNameA", .signature = "\x00\x03\x09\x0f\x01\x11\x3d\x09" } },
    .{ "GetDeviceDriverBaseNameW", MethodRecord{ .library = "PSAPI", .import = "GetDeviceDriverBaseNameW", .signature = "\x00\x03\x09\x0f\x01\x11\x05\x09" } },
    .{ "GetDeviceDriverFileNameA", MethodRecord{ .library = "PSAPI", .import = "GetDeviceDriverFileNameA", .signature = "\x00\x03\x09\x0f\x01\x11\x3d\x09" } },
    .{ "GetDeviceDriverFileNameW", MethodRecord{ .library = "PSAPI", .import = "GetDeviceDriverFileNameW", .signature = "\x00\x03\x09\x0f\x01\x11\x05\x09" } },
    .{ "QueryWorkingSet", MethodRecord{ .library = "PSAPI", .import = "QueryWorkingSet", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x01\x09" } },
    .{ "QueryWorkingSetEx", MethodRecord{ .library = "PSAPI", .import = "QueryWorkingSetEx", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x01\x09" } },
    .{ "GetProcessMemoryInfo", MethodRecord{ .library = "PSAPI", .import = "GetProcessMemoryInfo", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x43\xf9\x09" } },
    .{ "GetPerformanceInfo", MethodRecord{ .library = "PSAPI", .import = "GetPerformanceInfo", .signature = "\x00\x02\x11\x59\x0f\x11\xc0\x00\x43\xfd\x09" } },
    .{ "EnumPageFilesW", MethodRecord{ .library = "PSAPI", .import = "EnumPageFilesW", .signature = "\x00\x02\x11\x59\x12\xc0\x00\x44\x01\x0f\x01" } },
    .{ "EnumPageFilesA", MethodRecord{ .library = "PSAPI", .import = "EnumPageFilesA", .signature = "\x00\x02\x11\x59\x12\xc0\x00\x44\x05\x0f\x01" } },
    .{ "GetProcessImageFileNameA", MethodRecord{ .library = "PSAPI", .import = "GetProcessImageFileNameA", .signature = "\x00\x03\x09\x11\x80\x85\x11\x3d\x09" } },
    .{ "GetProcessImageFileNameW", MethodRecord{ .library = "PSAPI", .import = "GetProcessImageFileNameW", .signature = "\x00\x03\x09\x11\x80\x85\x11\x05\x09" } },
    .{ "K32EnumProcesses", MethodRecord{ .library = "KERNEL32", .import = "K32EnumProcesses", .signature = "\x00\x03\x11\x59\x0f\x09\x09\x0f\x09" } },
    .{ "K32EnumProcessModules", MethodRecord{ .library = "KERNEL32", .import = "K32EnumProcessModules", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\x81\x81\x09\x0f\x09" } },
    .{ "K32EnumProcessModulesEx", MethodRecord{ .library = "KERNEL32", .import = "K32EnumProcessModulesEx", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\x81\x81\x09\x0f\x09\x09" } },
    .{ "K32GetModuleBaseNameA", MethodRecord{ .library = "KERNEL32", .import = "K32GetModuleBaseNameA", .signature = "\x00\x04\x09\x11\x80\x85\x11\x81\x81\x11\x3d\x09" } },
    .{ "K32GetModuleBaseNameW", MethodRecord{ .library = "KERNEL32", .import = "K32GetModuleBaseNameW", .signature = "\x00\x04\x09\x11\x80\x85\x11\x81\x81\x11\x05\x09" } },
    .{ "K32GetModuleFileNameExA", MethodRecord{ .library = "KERNEL32", .import = "K32GetModuleFileNameExA", .signature = "\x00\x04\x09\x11\x80\x85\x11\x81\x81\x11\x3d\x09" } },
    .{ "K32GetModuleFileNameExW", MethodRecord{ .library = "KERNEL32", .import = "K32GetModuleFileNameExW", .signature = "\x00\x04\x09\x11\x80\x85\x11\x81\x81\x11\x05\x09" } },
    .{ "K32GetModuleInformation", MethodRecord{ .library = "KERNEL32", .import = "K32GetModuleInformation", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x81\x81\x0f\x11\xc0\x00\x43\xed\x09" } },
    .{ "K32EmptyWorkingSet", MethodRecord{ .library = "KERNEL32", .import = "K32EmptyWorkingSet", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "K32InitializeProcessForWsWatch", MethodRecord{ .library = "KERNEL32", .import = "K32InitializeProcessForWsWatch", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "K32GetWsChanges", MethodRecord{ .library = "KERNEL32", .import = "K32GetWsChanges", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x43\xf1\x09" } },
    .{ "K32GetWsChangesEx", MethodRecord{ .library = "KERNEL32", .import = "K32GetWsChangesEx", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x43\xf5\x0f\x09" } },
    .{ "K32GetMappedFileNameW", MethodRecord{ .library = "KERNEL32", .import = "K32GetMappedFileNameW", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x01\x11\x05\x09" } },
    .{ "K32GetMappedFileNameA", MethodRecord{ .library = "KERNEL32", .import = "K32GetMappedFileNameA", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x01\x11\x3d\x09" } },
    .{ "K32EnumDeviceDrivers", MethodRecord{ .library = "KERNEL32", .import = "K32EnumDeviceDrivers", .signature = "\x00\x03\x11\x59\x0f\x0f\x01\x09\x0f\x09" } },
    .{ "K32GetDeviceDriverBaseNameA", MethodRecord{ .library = "KERNEL32", .import = "K32GetDeviceDriverBaseNameA", .signature = "\x00\x03\x09\x0f\x01\x11\x3d\x09" } },
    .{ "K32GetDeviceDriverBaseNameW", MethodRecord{ .library = "KERNEL32", .import = "K32GetDeviceDriverBaseNameW", .signature = "\x00\x03\x09\x0f\x01\x11\x05\x09" } },
    .{ "K32GetDeviceDriverFileNameA", MethodRecord{ .library = "KERNEL32", .import = "K32GetDeviceDriverFileNameA", .signature = "\x00\x03\x09\x0f\x01\x11\x3d\x09" } },
    .{ "K32GetDeviceDriverFileNameW", MethodRecord{ .library = "KERNEL32", .import = "K32GetDeviceDriverFileNameW", .signature = "\x00\x03\x09\x0f\x01\x11\x05\x09" } },
    .{ "K32QueryWorkingSet", MethodRecord{ .library = "KERNEL32", .import = "K32QueryWorkingSet", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x01\x09" } },
    .{ "K32QueryWorkingSetEx", MethodRecord{ .library = "KERNEL32", .import = "K32QueryWorkingSetEx", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x01\x09" } },
    .{ "K32GetProcessMemoryInfo", MethodRecord{ .library = "KERNEL32", .import = "K32GetProcessMemoryInfo", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x43\xf9\x09" } },
    .{ "K32GetPerformanceInfo", MethodRecord{ .library = "KERNEL32", .import = "K32GetPerformanceInfo", .signature = "\x00\x02\x11\x59\x0f\x11\xc0\x00\x43\xfd\x09" } },
    .{ "K32EnumPageFilesW", MethodRecord{ .library = "KERNEL32", .import = "K32EnumPageFilesW", .signature = "\x00\x02\x11\x59\x12\xc0\x00\x44\x01\x0f\x01" } },
    .{ "K32EnumPageFilesA", MethodRecord{ .library = "KERNEL32", .import = "K32EnumPageFilesA", .signature = "\x00\x02\x11\x59\x12\xc0\x00\x44\x05\x0f\x01" } },
    .{ "K32GetProcessImageFileNameA", MethodRecord{ .library = "KERNEL32", .import = "K32GetProcessImageFileNameA", .signature = "\x00\x03\x09\x11\x80\x85\x11\x3d\x09" } },
    .{ "K32GetProcessImageFileNameW", MethodRecord{ .library = "KERNEL32", .import = "K32GetProcessImageFileNameW", .signature = "\x00\x03\x09\x11\x80\x85\x11\x05\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x181 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HMODULE" },
        0x2229 => TypeRefEntry{ .namespace = "Windows.Win32.System.ProcessStatus", .name = "ENUM_PROCESS_MODULES_EX_FLAGS" },
        0x43ed => TypeRefEntry{ .namespace = "Windows.Win32.System.ProcessStatus", .name = "MODULEINFO" },
        0x43f1 => TypeRefEntry{ .namespace = "Windows.Win32.System.ProcessStatus", .name = "PSAPI_WS_WATCH_INFORMATION" },
        0x43f5 => TypeRefEntry{ .namespace = "Windows.Win32.System.ProcessStatus", .name = "PSAPI_WS_WATCH_INFORMATION_EX" },
        0x43f9 => TypeRefEntry{ .namespace = "Windows.Win32.System.ProcessStatus", .name = "PROCESS_MEMORY_COUNTERS" },
        0x43fd => TypeRefEntry{ .namespace = "Windows.Win32.System.ProcessStatus", .name = "PERFORMANCE_INFORMATION" },
        0x4401 => TypeRefEntry{ .namespace = "Windows.Win32.System.ProcessStatus", .name = "PENUM_PAGE_FILE_CALLBACKW" },
        0x4405 => TypeRefEntry{ .namespace = "Windows.Win32.System.ProcessStatus", .name = "PENUM_PAGE_FILE_CALLBACKA" },
        else => null,
    };
}

pub const LIST_MODULES_ALL = 3;
pub const LIST_MODULES_DEFAULT = 0;
pub const LIST_MODULES_32BIT = 1;
pub const LIST_MODULES_64BIT = 2;
pub const PSAPI_VERSION = 2;

pub const aliases = struct {
    pub const ENUM_PROCESS_MODULES_EX_FLAGS = u32;
};
