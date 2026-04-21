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
    .{ "DisableThreadLibraryCalls", MethodRecord{ .library = "KERNEL32", .import = "DisableThreadLibraryCalls", .signature = "\x00\x01\x11\x59\x11\x81\x81" } },
    .{ "FindResourceExW", MethodRecord{ .library = "KERNEL32", .import = "FindResourceExW", .signature = "\x00\x04\x11\xc0\x00\x42\xbd\x11\x81\x81\x11\x05\x11\x05\x07" } },
    .{ "FreeLibraryAndExitThread", MethodRecord{ .library = "KERNEL32", .import = "FreeLibraryAndExitThread", .signature = "\x00\x02\x01\x11\x81\x81\x09" } },
    .{ "FreeResource", MethodRecord{ .library = "KERNEL32", .import = "FreeResource", .signature = "\x00\x01\x11\x59\x11\x8d\x39" } },
    .{ "GetModuleFileNameA", MethodRecord{ .library = "KERNEL32", .import = "GetModuleFileNameA", .signature = "\x00\x03\x09\x11\x81\x81\x11\x3d\x09" } },
    .{ "GetModuleFileNameW", MethodRecord{ .library = "KERNEL32", .import = "GetModuleFileNameW", .signature = "\x00\x03\x09\x11\x81\x81\x11\x05\x09" } },
    .{ "GetModuleHandleA", MethodRecord{ .library = "KERNEL32", .import = "GetModuleHandleA", .signature = "\x00\x01\x11\x81\x81\x11\x3d" } },
    .{ "GetModuleHandleW", MethodRecord{ .library = "KERNEL32", .import = "GetModuleHandleW", .signature = "\x00\x01\x11\x81\x81\x11\x05" } },
    .{ "GetModuleHandleExA", MethodRecord{ .library = "KERNEL32", .import = "GetModuleHandleExA", .signature = "\x00\x03\x11\x59\x09\x11\x3d\x0f\x11\x81\x81" } },
    .{ "GetModuleHandleExW", MethodRecord{ .library = "KERNEL32", .import = "GetModuleHandleExW", .signature = "\x00\x03\x11\x59\x09\x11\x05\x0f\x11\x81\x81" } },
    .{ "GetProcAddress", MethodRecord{ .library = "KERNEL32", .import = "GetProcAddress", .signature = "\x00\x02\x12\x96\xe9\x11\x81\x81\x11\x3d" } },
    .{ "LoadLibraryExA", MethodRecord{ .library = "KERNEL32", .import = "LoadLibraryExA", .signature = "\x00\x03\x11\x81\x81\x11\x3d\x11\x80\x85\x11\xa1\x75" } },
    .{ "LoadLibraryExW", MethodRecord{ .library = "KERNEL32", .import = "LoadLibraryExW", .signature = "\x00\x03\x11\x81\x81\x11\x05\x11\x80\x85\x11\xa1\x75" } },
    .{ "LoadResource", MethodRecord{ .library = "KERNEL32", .import = "LoadResource", .signature = "\x00\x02\x11\x8d\x39\x11\x81\x81\x11\xc0\x00\x42\xbd" } },
    .{ "LockResource", MethodRecord{ .library = "KERNEL32", .import = "LockResource", .signature = "\x00\x01\x0f\x01\x11\x8d\x39" } },
    .{ "SizeofResource", MethodRecord{ .library = "KERNEL32", .import = "SizeofResource", .signature = "\x00\x02\x09\x11\x81\x81\x11\xc0\x00\x42\xbd" } },
    .{ "AddDllDirectory", MethodRecord{ .library = "KERNEL32", .import = "AddDllDirectory", .signature = "\x00\x01\x0f\x01\x11\x05" } },
    .{ "RemoveDllDirectory", MethodRecord{ .library = "KERNEL32", .import = "RemoveDllDirectory", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "SetDefaultDllDirectories", MethodRecord{ .library = "KERNEL32", .import = "SetDefaultDllDirectories", .signature = "\x00\x01\x11\x59\x11\xa1\x75" } },
    .{ "EnumResourceLanguagesExA", MethodRecord{ .library = "KERNEL32", .import = "EnumResourceLanguagesExA", .signature = "\x00\x07\x11\x59\x11\x81\x81\x11\x3d\x11\x3d\x12\xc0\x00\x42\xc1\x18\x09\x07" } },
    .{ "EnumResourceLanguagesExW", MethodRecord{ .library = "KERNEL32", .import = "EnumResourceLanguagesExW", .signature = "\x00\x07\x11\x59\x11\x81\x81\x11\x05\x11\x05\x12\xc0\x00\x42\xc5\x18\x09\x07" } },
    .{ "EnumResourceNamesExA", MethodRecord{ .library = "KERNEL32", .import = "EnumResourceNamesExA", .signature = "\x00\x06\x11\x59\x11\x81\x81\x11\x3d\x12\xc0\x00\x42\xc9\x18\x09\x07" } },
    .{ "EnumResourceNamesExW", MethodRecord{ .library = "KERNEL32", .import = "EnumResourceNamesExW", .signature = "\x00\x06\x11\x59\x11\x81\x81\x11\x05\x12\xc0\x00\x42\xcd\x18\x09\x07" } },
    .{ "EnumResourceTypesExA", MethodRecord{ .library = "KERNEL32", .import = "EnumResourceTypesExA", .signature = "\x00\x05\x11\x59\x11\x81\x81\x12\xc0\x00\x42\xd1\x18\x09\x07" } },
    .{ "EnumResourceTypesExW", MethodRecord{ .library = "KERNEL32", .import = "EnumResourceTypesExW", .signature = "\x00\x05\x11\x59\x11\x81\x81\x12\xc0\x00\x42\xd5\x18\x09\x07" } },
    .{ "FindResourceW", MethodRecord{ .library = "KERNEL32", .import = "FindResourceW", .signature = "\x00\x03\x11\xc0\x00\x42\xbd\x11\x81\x81\x11\x05\x11\x05" } },
    .{ "LoadLibraryA", MethodRecord{ .library = "KERNEL32", .import = "LoadLibraryA", .signature = "\x00\x01\x11\x81\x81\x11\x3d" } },
    .{ "LoadLibraryW", MethodRecord{ .library = "KERNEL32", .import = "LoadLibraryW", .signature = "\x00\x01\x11\x81\x81\x11\x05" } },
    .{ "EnumResourceNamesW", MethodRecord{ .library = "KERNEL32", .import = "EnumResourceNamesW", .signature = "\x00\x04\x11\x59\x11\x81\x81\x11\x05\x12\xc0\x00\x42\xcd\x18" } },
    .{ "EnumResourceNamesA", MethodRecord{ .library = "KERNEL32", .import = "EnumResourceNamesA", .signature = "\x00\x04\x11\x59\x11\x81\x81\x11\x3d\x12\xc0\x00\x42\xc9\x18" } },
    .{ "LoadPackagedLibrary", MethodRecord{ .library = "KERNEL32", .import = "LoadPackagedLibrary", .signature = "\x00\x02\x11\x81\x81\x11\x05\x09" } },
    .{ "QueryOptionalDelayLoadedAPI", MethodRecord{ .library = "api-ms-win-core-libraryloader-l2-1-0", .import = "QueryOptionalDelayLoadedAPI", .signature = "\x00\x04\x11\x59\x11\x81\x81\x11\x3d\x11\x3d\x09" } },
    .{ "LoadModule", MethodRecord{ .library = "KERNEL32", .import = "LoadModule", .signature = "\x00\x02\x09\x11\x3d\x0f\x01" } },
    .{ "FindResourceA", MethodRecord{ .library = "KERNEL32", .import = "FindResourceA", .signature = "\x00\x03\x11\xc0\x00\x42\xbd\x11\x81\x81\x11\x3d\x11\x3d" } },
    .{ "FindResourceExA", MethodRecord{ .library = "KERNEL32", .import = "FindResourceExA", .signature = "\x00\x04\x11\xc0\x00\x42\xbd\x11\x81\x81\x11\x3d\x11\x3d\x07" } },
    .{ "EnumResourceTypesA", MethodRecord{ .library = "KERNEL32", .import = "EnumResourceTypesA", .signature = "\x00\x03\x11\x59\x11\x81\x81\x12\xc0\x00\x42\xd1\x18" } },
    .{ "EnumResourceTypesW", MethodRecord{ .library = "KERNEL32", .import = "EnumResourceTypesW", .signature = "\x00\x03\x11\x59\x11\x81\x81\x12\xc0\x00\x42\xd5\x18" } },
    .{ "EnumResourceLanguagesA", MethodRecord{ .library = "KERNEL32", .import = "EnumResourceLanguagesA", .signature = "\x00\x05\x11\x59\x11\x81\x81\x11\x3d\x11\x3d\x12\xc0\x00\x42\xc1\x18" } },
    .{ "EnumResourceLanguagesW", MethodRecord{ .library = "KERNEL32", .import = "EnumResourceLanguagesW", .signature = "\x00\x05\x11\x59\x11\x81\x81\x11\x05\x11\x05\x12\xc0\x00\x42\xc5\x18" } },
    .{ "BeginUpdateResourceA", MethodRecord{ .library = "KERNEL32", .import = "BeginUpdateResourceA", .signature = "\x00\x02\x11\x80\x85\x11\x3d\x11\x59" } },
    .{ "BeginUpdateResourceW", MethodRecord{ .library = "KERNEL32", .import = "BeginUpdateResourceW", .signature = "\x00\x02\x11\x80\x85\x11\x05\x11\x59" } },
    .{ "UpdateResourceA", MethodRecord{ .library = "KERNEL32", .import = "UpdateResourceA", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x3d\x11\x3d\x07\x0f\x01\x09" } },
    .{ "UpdateResourceW", MethodRecord{ .library = "KERNEL32", .import = "UpdateResourceW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x05\x11\x05\x07\x0f\x01\x09" } },
    .{ "EndUpdateResourceA", MethodRecord{ .library = "KERNEL32", .import = "EndUpdateResourceA", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x59" } },
    .{ "EndUpdateResourceW", MethodRecord{ .library = "KERNEL32", .import = "EndUpdateResourceW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x59" } },
    .{ "SetDllDirectoryA", MethodRecord{ .library = "KERNEL32", .import = "SetDllDirectoryA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "SetDllDirectoryW", MethodRecord{ .library = "KERNEL32", .import = "SetDllDirectoryW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "GetDllDirectoryA", MethodRecord{ .library = "KERNEL32", .import = "GetDllDirectoryA", .signature = "\x00\x02\x09\x09\x11\x3d" } },
    .{ "GetDllDirectoryW", MethodRecord{ .library = "KERNEL32", .import = "GetDllDirectoryW", .signature = "\x00\x02\x09\x09\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x181 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HMODULE" },
        0xd39 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HGLOBAL" },
        0x16e9 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FARPROC" },
        0x2175 => TypeRefEntry{ .namespace = "Windows.Win32.System.LibraryLoader", .name = "LOAD_LIBRARY_FLAGS" },
        0x42bd => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRSRC" },
        0x42c1 => TypeRefEntry{ .namespace = "Windows.Win32.System.LibraryLoader", .name = "ENUMRESLANGPROCA" },
        0x42c5 => TypeRefEntry{ .namespace = "Windows.Win32.System.LibraryLoader", .name = "ENUMRESLANGPROCW" },
        0x42c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.LibraryLoader", .name = "ENUMRESNAMEPROCA" },
        0x42cd => TypeRefEntry{ .namespace = "Windows.Win32.System.LibraryLoader", .name = "ENUMRESNAMEPROCW" },
        0x42d1 => TypeRefEntry{ .namespace = "Windows.Win32.System.LibraryLoader", .name = "ENUMRESTYPEPROCA" },
        0x42d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.LibraryLoader", .name = "ENUMRESTYPEPROCW" },
        else => null,
    };
}

pub const DONT_RESOLVE_DLL_REFERENCES = 1;
pub const LOAD_LIBRARY_AS_DATAFILE = 2;
pub const LOAD_WITH_ALTERED_SEARCH_PATH = 8;
pub const LOAD_IGNORE_CODE_AUTHZ_LEVEL = 16;
pub const LOAD_LIBRARY_AS_IMAGE_RESOURCE = 32;
pub const LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE = 64;
pub const LOAD_LIBRARY_REQUIRE_SIGNED_TARGET = 128;
pub const LOAD_LIBRARY_SEARCH_DLL_LOAD_DIR = 256;
pub const LOAD_LIBRARY_SEARCH_APPLICATION_DIR = 512;
pub const LOAD_LIBRARY_SEARCH_USER_DIRS = 1024;
pub const LOAD_LIBRARY_SEARCH_SYSTEM32 = 2048;
pub const LOAD_LIBRARY_SEARCH_DEFAULT_DIRS = 4096;
pub const LOAD_LIBRARY_SAFE_CURRENT_DIRS = 8192;
pub const LOAD_LIBRARY_SEARCH_SYSTEM32_NO_FORWARDER = 16384;
pub const FIND_RESOURCE_DIRECTORY_TYPES = 256;
pub const FIND_RESOURCE_DIRECTORY_NAMES = 512;
pub const FIND_RESOURCE_DIRECTORY_LANGUAGES = 1024;
pub const RESOURCE_ENUM_LN = 1;
pub const RESOURCE_ENUM_MUI = 2;
pub const RESOURCE_ENUM_MUI_SYSTEM = 4;
pub const RESOURCE_ENUM_VALIDATE = 8;
pub const RESOURCE_ENUM_MODULE_EXACT = 16;
pub const SUPPORT_LANG_NUMBER = 32;
pub const GET_MODULE_HANDLE_EX_FLAG_PIN = 1;
pub const GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT = 2;
pub const GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS = 4;
pub const CURRENT_IMPORT_REDIRECTION_VERSION = 1;
pub const LOAD_LIBRARY_OS_INTEGRITY_CONTINUITY = 32768;
