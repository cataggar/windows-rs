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
    .{ "SysAllocString", MethodRecord{ .library = "OLEAUT32", .import = "SysAllocString", .signature = "\x00\x01\x11\x8d\x35\x11\x05" } },
    .{ "SysReAllocString", MethodRecord{ .library = "OLEAUT32", .import = "SysReAllocString", .signature = "\x00\x02\x08\x0f\x11\x8d\x35\x11\x05" } },
    .{ "SysAllocStringLen", MethodRecord{ .library = "OLEAUT32", .import = "SysAllocStringLen", .signature = "\x00\x02\x11\x8d\x35\x11\x05\x09" } },
    .{ "SysReAllocStringLen", MethodRecord{ .library = "OLEAUT32", .import = "SysReAllocStringLen", .signature = "\x00\x03\x08\x0f\x11\x8d\x35\x11\x05\x09" } },
    .{ "SysAddRefString", MethodRecord{ .library = "OLEAUT32", .import = "SysAddRefString", .signature = "\x00\x01\x11\x79\x11\x8d\x35" } },
    .{ "SysReleaseString", MethodRecord{ .library = "OLEAUT32", .import = "SysReleaseString", .signature = "\x00\x01\x01\x11\x8d\x35" } },
    .{ "SysFreeString", MethodRecord{ .library = "OLEAUT32", .import = "SysFreeString", .signature = "\x00\x01\x01\x11\x8d\x35" } },
    .{ "SysStringLen", MethodRecord{ .library = "OLEAUT32", .import = "SysStringLen", .signature = "\x00\x01\x09\x11\x8d\x35" } },
    .{ "SysStringByteLen", MethodRecord{ .library = "OLEAUT32", .import = "SysStringByteLen", .signature = "\x00\x01\x09\x11\x8d\x35" } },
    .{ "SysAllocStringByteLen", MethodRecord{ .library = "OLEAUT32", .import = "SysAllocStringByteLen", .signature = "\x00\x02\x11\x8d\x35\x11\x3d\x09" } },
    .{ "CloseHandle", MethodRecord{ .library = "KERNEL32", .import = "CloseHandle", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "DuplicateHandle", MethodRecord{ .library = "KERNEL32", .import = "DuplicateHandle", .signature = "\x00\x07\x11\x59\x11\x80\x85\x11\x80\x85\x11\x80\x85\x0f\x11\x80\x85\x09\x11\x59\x11\x8d\x21" } },
    .{ "CompareObjectHandles", MethodRecord{ .library = "api-ms-win-core-handle-l1-1-0", .import = "CompareObjectHandles", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x80\x85" } },
    .{ "GetHandleInformation", MethodRecord{ .library = "KERNEL32", .import = "GetHandleInformation", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x09" } },
    .{ "SetHandleInformation", MethodRecord{ .library = "KERNEL32", .import = "SetHandleInformation", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x11\x8d\x25" } },
    .{ "FreeLibrary", MethodRecord{ .library = "KERNEL32", .import = "FreeLibrary", .signature = "\x00\x01\x11\x59\x11\x81\x81" } },
    .{ "GetLastError", MethodRecord{ .library = "KERNEL32", .import = "GetLastError", .signature = "\x00\x00\x11\x81\x01" } },
    .{ "SetLastError", MethodRecord{ .library = "KERNEL32", .import = "SetLastError", .signature = "\x00\x01\x01\x11\x81\x01" } },
    .{ "SetLastErrorEx", MethodRecord{ .library = "USER32", .import = "SetLastErrorEx", .signature = "\x00\x02\x01\x11\x81\x01\x09" } },
    .{ "GlobalFree", MethodRecord{ .library = "KERNEL32", .import = "GlobalFree", .signature = "\x00\x01\x11\x8d\x39\x11\x8d\x39" } },
    .{ "LocalFree", MethodRecord{ .library = "KERNEL32", .import = "LocalFree", .signature = "\x00\x01\x11\x8d\x3d\x11\x8d\x3d" } },
    .{ "RtlNtStatusToDosError", MethodRecord{ .library = "ntdll", .import = "RtlNtStatusToDosError", .signature = "\x00\x01\x09\x11\x84\x71" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x181 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HMODULE" },
        0x471 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "NTSTATUS" },
        0xd21 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "DUPLICATE_HANDLE_OPTIONS" },
        0xd25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE_FLAGS" },
        0xd35 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BSTR" },
        0xd39 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HGLOBAL" },
        0xd3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HLOCAL" },
        else => null,
    };
}
