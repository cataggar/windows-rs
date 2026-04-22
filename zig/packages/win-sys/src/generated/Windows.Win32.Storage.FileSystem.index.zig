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
    .{ "SearchPathW", MethodRecord{ .library = "KERNEL32", .import = "SearchPathW", .signature = "\x00\x06\x09\x11\x05\x11\x05\x11\x05\x09\x11\x05\x0f\x11\x05" } },
    .{ "SearchPathA", MethodRecord{ .library = "KERNEL32", .import = "SearchPathA", .signature = "\x00\x06\x09\x11\x3d\x11\x3d\x11\x3d\x09\x11\x3d\x0f\x11\x3d" } },
    .{ "CompareFileTime", MethodRecord{ .library = "KERNEL32", .import = "CompareFileTime", .signature = "\x00\x02\x08\x0f\x11\x80\x9d\x0f\x11\x80\x9d" } },
    .{ "CreateDirectoryA", MethodRecord{ .library = "KERNEL32", .import = "CreateDirectoryA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x11\x8b\xb5" } },
    .{ "CreateDirectoryW", MethodRecord{ .library = "KERNEL32", .import = "CreateDirectoryW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x11\x8b\xb5" } },
    .{ "CreateFileA", MethodRecord{ .library = "KERNEL32", .import = "CreateFileA", .signature = "\x00\x07\x11\x80\x85\x11\x3d\x09\x11\x8b\xb9\x0f\x11\x8b\xb5\x11\x8b\xbd\x11\x8b\xad\x11\x80\x85" } },
    .{ "CreateFileW", MethodRecord{ .library = "KERNEL32", .import = "CreateFileW", .signature = "\x00\x07\x11\x80\x85\x11\x05\x09\x11\x8b\xb9\x0f\x11\x8b\xb5\x11\x8b\xbd\x11\x8b\xad\x11\x80\x85" } },
    .{ "DefineDosDeviceW", MethodRecord{ .library = "KERNEL32", .import = "DefineDosDeviceW", .signature = "\x00\x03\x11\x59\x11\x8b\xa9\x11\x05\x11\x05" } },
    .{ "DeleteFileA", MethodRecord{ .library = "KERNEL32", .import = "DeleteFileA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "DeleteFileW", MethodRecord{ .library = "KERNEL32", .import = "DeleteFileW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "DeleteVolumeMountPointW", MethodRecord{ .library = "KERNEL32", .import = "DeleteVolumeMountPointW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "FileTimeToLocalFileTime", MethodRecord{ .library = "KERNEL32", .import = "FileTimeToLocalFileTime", .signature = "\x00\x02\x11\x59\x0f\x11\x80\x9d\x0f\x11\x80\x9d" } },
    .{ "FindClose", MethodRecord{ .library = "KERNEL32", .import = "FindClose", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "FindCloseChangeNotification", MethodRecord{ .library = "KERNEL32", .import = "FindCloseChangeNotification", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "FindFirstChangeNotificationA", MethodRecord{ .library = "KERNEL32", .import = "FindFirstChangeNotificationA", .signature = "\x00\x03\x11\x80\x85\x11\x3d\x11\x59\x11\x8b\xc1" } },
    .{ "FindFirstChangeNotificationW", MethodRecord{ .library = "KERNEL32", .import = "FindFirstChangeNotificationW", .signature = "\x00\x03\x11\x80\x85\x11\x05\x11\x59\x11\x8b\xc1" } },
    .{ "FindFirstFileA", MethodRecord{ .library = "KERNEL32", .import = "FindFirstFileA", .signature = "\x00\x02\x11\x80\x85\x11\x3d\x0f\x11\x8b\xc5" } },
    .{ "FindFirstFileW", MethodRecord{ .library = "KERNEL32", .import = "FindFirstFileW", .signature = "\x00\x02\x11\x80\x85\x11\x05\x0f\x11\x8b\xc9" } },
    .{ "FindFirstFileExA", MethodRecord{ .library = "KERNEL32", .import = "FindFirstFileExA", .signature = "\x00\x06\x11\x80\x85\x11\x3d\x11\x8b\xcd\x0f\x01\x11\x8b\xd1\x0f\x01\x11\x8b\xa5" } },
    .{ "FindFirstFileExW", MethodRecord{ .library = "KERNEL32", .import = "FindFirstFileExW", .signature = "\x00\x06\x11\x80\x85\x11\x05\x11\x8b\xcd\x0f\x01\x11\x8b\xd1\x0f\x01\x11\x8b\xa5" } },
    .{ "FindFirstVolumeW", MethodRecord{ .library = "KERNEL32", .import = "FindFirstVolumeW", .signature = "\x00\x02\x11\x80\x85\x11\x05\x09" } },
    .{ "FindNextChangeNotification", MethodRecord{ .library = "KERNEL32", .import = "FindNextChangeNotification", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "FindNextFileA", MethodRecord{ .library = "KERNEL32", .import = "FindNextFileA", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x8b\xc5" } },
    .{ "FindNextFileW", MethodRecord{ .library = "KERNEL32", .import = "FindNextFileW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x8b\xc9" } },
    .{ "FindNextVolumeW", MethodRecord{ .library = "KERNEL32", .import = "FindNextVolumeW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x05\x09" } },
    .{ "FindVolumeClose", MethodRecord{ .library = "KERNEL32", .import = "FindVolumeClose", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "FlushFileBuffers", MethodRecord{ .library = "KERNEL32", .import = "FlushFileBuffers", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "GetDiskFreeSpaceA", MethodRecord{ .library = "KERNEL32", .import = "GetDiskFreeSpaceA", .signature = "\x00\x05\x11\x59\x11\x3d\x0f\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "GetDiskFreeSpaceW", MethodRecord{ .library = "KERNEL32", .import = "GetDiskFreeSpaceW", .signature = "\x00\x05\x11\x59\x11\x05\x0f\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "GetDiskFreeSpaceExA", MethodRecord{ .library = "KERNEL32", .import = "GetDiskFreeSpaceExA", .signature = "\x00\x04\x11\x59\x11\x3d\x0f\x0b\x0f\x0b\x0f\x0b" } },
    .{ "GetDiskFreeSpaceExW", MethodRecord{ .library = "KERNEL32", .import = "GetDiskFreeSpaceExW", .signature = "\x00\x04\x11\x59\x11\x05\x0f\x0b\x0f\x0b\x0f\x0b" } },
    .{ "GetDiskSpaceInformationA", MethodRecord{ .library = "KERNEL32", .import = "GetDiskSpaceInformationA", .signature = "\x00\x02\x11\x79\x11\x3d\x0f\x11\x8b\xd5" } },
    .{ "GetDiskSpaceInformationW", MethodRecord{ .library = "KERNEL32", .import = "GetDiskSpaceInformationW", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x8b\xd5" } },
    .{ "GetDriveTypeA", MethodRecord{ .library = "KERNEL32", .import = "GetDriveTypeA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "GetDriveTypeW", MethodRecord{ .library = "KERNEL32", .import = "GetDriveTypeW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "GetFileAttributesA", MethodRecord{ .library = "KERNEL32", .import = "GetFileAttributesA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "GetFileAttributesW", MethodRecord{ .library = "KERNEL32", .import = "GetFileAttributesW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "GetFileAttributesExA", MethodRecord{ .library = "KERNEL32", .import = "GetFileAttributesExA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x8b\xd9\x0f\x01" } },
    .{ "GetFileAttributesExW", MethodRecord{ .library = "KERNEL32", .import = "GetFileAttributesExW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x8b\xd9\x0f\x01" } },
    .{ "GetFileInformationByHandle", MethodRecord{ .library = "KERNEL32", .import = "GetFileInformationByHandle", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x8b\xdd" } },
    .{ "GetFileSize", MethodRecord{ .library = "KERNEL32", .import = "GetFileSize", .signature = "\x00\x02\x09\x11\x80\x85\x0f\x09" } },
    .{ "GetFileSizeEx", MethodRecord{ .library = "KERNEL32", .import = "GetFileSizeEx", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0a" } },
    .{ "GetFileType", MethodRecord{ .library = "KERNEL32", .import = "GetFileType", .signature = "\x00\x01\x11\x8b\xe1\x11\x80\x85" } },
    .{ "GetFinalPathNameByHandleA", MethodRecord{ .library = "KERNEL32", .import = "GetFinalPathNameByHandleA", .signature = "\x00\x04\x09\x11\x80\x85\x11\x3d\x09\x11\x8b\xe5" } },
    .{ "GetFinalPathNameByHandleW", MethodRecord{ .library = "KERNEL32", .import = "GetFinalPathNameByHandleW", .signature = "\x00\x04\x09\x11\x80\x85\x11\x05\x09\x11\x8b\xe5" } },
    .{ "GetFileTime", MethodRecord{ .library = "KERNEL32", .import = "GetFileTime", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\x80\x9d\x0f\x11\x80\x9d\x0f\x11\x80\x9d" } },
    .{ "GetFullPathNameW", MethodRecord{ .library = "KERNEL32", .import = "GetFullPathNameW", .signature = "\x00\x04\x09\x11\x05\x09\x11\x05\x0f\x11\x05" } },
    .{ "GetFullPathNameA", MethodRecord{ .library = "KERNEL32", .import = "GetFullPathNameA", .signature = "\x00\x04\x09\x11\x3d\x09\x11\x3d\x0f\x11\x3d" } },
    .{ "GetLogicalDrives", MethodRecord{ .library = "KERNEL32", .import = "GetLogicalDrives", .signature = "\x00\x00\x09" } },
    .{ "GetLogicalDriveStringsW", MethodRecord{ .library = "KERNEL32", .import = "GetLogicalDriveStringsW", .signature = "\x00\x02\x09\x09\x11\x05" } },
    .{ "GetLongPathNameA", MethodRecord{ .library = "KERNEL32", .import = "GetLongPathNameA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x09" } },
    .{ "GetLongPathNameW", MethodRecord{ .library = "KERNEL32", .import = "GetLongPathNameW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "AreShortNamesEnabled", MethodRecord{ .library = "KERNEL32", .import = "AreShortNamesEnabled", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x59" } },
    .{ "GetShortPathNameW", MethodRecord{ .library = "KERNEL32", .import = "GetShortPathNameW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "GetTempFileNameW", MethodRecord{ .library = "KERNEL32", .import = "GetTempFileNameW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x09\x11\x05" } },
    .{ "GetVolumeInformationByHandleW", MethodRecord{ .library = "KERNEL32", .import = "GetVolumeInformationByHandleW", .signature = "\x00\x08\x11\x59\x11\x80\x85\x11\x05\x09\x0f\x09\x0f\x09\x0f\x09\x11\x05\x09" } },
    .{ "GetVolumeInformationW", MethodRecord{ .library = "KERNEL32", .import = "GetVolumeInformationW", .signature = "\x00\x08\x11\x59\x11\x05\x11\x05\x09\x0f\x09\x0f\x09\x0f\x09\x11\x05\x09" } },
    .{ "GetVolumePathNameW", MethodRecord{ .library = "KERNEL32", .import = "GetVolumePathNameW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x09" } },
    .{ "LocalFileTimeToFileTime", MethodRecord{ .library = "KERNEL32", .import = "LocalFileTimeToFileTime", .signature = "\x00\x02\x11\x59\x0f\x11\x80\x9d\x0f\x11\x80\x9d" } },
    .{ "LockFile", MethodRecord{ .library = "KERNEL32", .import = "LockFile", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x09\x09\x09" } },
    .{ "LockFileEx", MethodRecord{ .library = "KERNEL32", .import = "LockFileEx", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x8b\xe9\x09\x09\x09\x0f\x11\x8b\xed" } },
    .{ "QueryDosDeviceW", MethodRecord{ .library = "KERNEL32", .import = "QueryDosDeviceW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "ReadFile", MethodRecord{ .library = "KERNEL32", .import = "ReadFile", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x05\x09\x0f\x09\x0f\x11\x8b\xed" } },
    .{ "ReadFileEx", MethodRecord{ .library = "KERNEL32", .import = "ReadFileEx", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x05\x09\x0f\x11\x8b\xed\x12\x8b\xf1" } },
    .{ "ReadFileScatter", MethodRecord{ .library = "KERNEL32", .import = "ReadFileScatter", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\x8b\xf9\x09\x0f\x09\x0f\x11\x8b\xed" } },
    .{ "RemoveDirectoryA", MethodRecord{ .library = "KERNEL32", .import = "RemoveDirectoryA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "RemoveDirectoryW", MethodRecord{ .library = "KERNEL32", .import = "RemoveDirectoryW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "SetEndOfFile", MethodRecord{ .library = "KERNEL32", .import = "SetEndOfFile", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "SetFileAttributesA", MethodRecord{ .library = "KERNEL32", .import = "SetFileAttributesA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x8b\xad" } },
    .{ "SetFileAttributesW", MethodRecord{ .library = "KERNEL32", .import = "SetFileAttributesW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x8b\xad" } },
    .{ "SetFileInformationByHandle", MethodRecord{ .library = "KERNEL32", .import = "SetFileInformationByHandle", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x8b\xfd\x0f\x01\x09" } },
    .{ "SetFilePointer", MethodRecord{ .library = "KERNEL32", .import = "SetFilePointer", .signature = "\x00\x04\x09\x11\x80\x85\x08\x0f\x08\x11\x8c\x01" } },
    .{ "SetFilePointerEx", MethodRecord{ .library = "KERNEL32", .import = "SetFilePointerEx", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0a\x0f\x0a\x11\x8c\x01" } },
    .{ "SetFileTime", MethodRecord{ .library = "KERNEL32", .import = "SetFileTime", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\x80\x9d\x0f\x11\x80\x9d\x0f\x11\x80\x9d" } },
    .{ "SetFileValidData", MethodRecord{ .library = "KERNEL32", .import = "SetFileValidData", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0a" } },
    .{ "UnlockFile", MethodRecord{ .library = "KERNEL32", .import = "UnlockFile", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x09\x09\x09" } },
    .{ "UnlockFileEx", MethodRecord{ .library = "KERNEL32", .import = "UnlockFileEx", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x09\x09\x0f\x11\x8b\xed" } },
    .{ "WriteFile", MethodRecord{ .library = "KERNEL32", .import = "WriteFile", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x05\x09\x0f\x09\x0f\x11\x8b\xed" } },
    .{ "WriteFileEx", MethodRecord{ .library = "KERNEL32", .import = "WriteFileEx", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x05\x09\x0f\x11\x8b\xed\x12\x8b\xf1" } },
    .{ "WriteFileGather", MethodRecord{ .library = "KERNEL32", .import = "WriteFileGather", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\x8b\xf9\x09\x0f\x09\x0f\x11\x8b\xed" } },
    .{ "GetTempPathW", MethodRecord{ .library = "KERNEL32", .import = "GetTempPathW", .signature = "\x00\x02\x09\x09\x11\x05" } },
    .{ "GetVolumeNameForVolumeMountPointW", MethodRecord{ .library = "KERNEL32", .import = "GetVolumeNameForVolumeMountPointW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x09" } },
    .{ "GetVolumePathNamesForVolumeNameW", MethodRecord{ .library = "KERNEL32", .import = "GetVolumePathNamesForVolumeNameW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x09\x0f\x09" } },
    .{ "CreateFile2", MethodRecord{ .library = "KERNEL32", .import = "CreateFile2", .signature = "\x00\x05\x11\x80\x85\x11\x05\x09\x11\x8b\xb9\x11\x8b\xbd\x0f\x11\x8c\x05" } },
    .{ "SetFileIoOverlappedRange", MethodRecord{ .library = "KERNEL32", .import = "SetFileIoOverlappedRange", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x05\x09" } },
    .{ "GetCompressedFileSizeA", MethodRecord{ .library = "KERNEL32", .import = "GetCompressedFileSizeA", .signature = "\x00\x02\x09\x11\x3d\x0f\x09" } },
    .{ "GetCompressedFileSizeW", MethodRecord{ .library = "KERNEL32", .import = "GetCompressedFileSizeW", .signature = "\x00\x02\x09\x11\x05\x0f\x09" } },
    .{ "FindFirstStreamW", MethodRecord{ .library = "KERNEL32", .import = "FindFirstStreamW", .signature = "\x00\x04\x11\x80\x85\x11\x05\x11\x8c\x09\x0f\x01\x09" } },
    .{ "FindNextStreamW", MethodRecord{ .library = "KERNEL32", .import = "FindNextStreamW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x01" } },
    .{ "AreFileApisANSI", MethodRecord{ .library = "KERNEL32", .import = "AreFileApisANSI", .signature = "\x00\x00\x11\x59" } },
    .{ "GetTempPathA", MethodRecord{ .library = "KERNEL32", .import = "GetTempPathA", .signature = "\x00\x02\x09\x09\x11\x3d" } },
    .{ "FindFirstFileNameW", MethodRecord{ .library = "KERNEL32", .import = "FindFirstFileNameW", .signature = "\x00\x04\x11\x80\x85\x11\x05\x09\x0f\x09\x11\x05" } },
    .{ "FindNextFileNameW", MethodRecord{ .library = "KERNEL32", .import = "FindNextFileNameW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x09\x11\x05" } },
    .{ "GetVolumeInformationA", MethodRecord{ .library = "KERNEL32", .import = "GetVolumeInformationA", .signature = "\x00\x08\x11\x59\x11\x3d\x11\x3d\x09\x0f\x09\x0f\x09\x0f\x09\x11\x3d\x09" } },
    .{ "GetTempFileNameA", MethodRecord{ .library = "KERNEL32", .import = "GetTempFileNameA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x09\x11\x3d" } },
    .{ "SetFileApisToOEM", MethodRecord{ .library = "KERNEL32", .import = "SetFileApisToOEM", .signature = "\x00\x00\x01" } },
    .{ "SetFileApisToANSI", MethodRecord{ .library = "KERNEL32", .import = "SetFileApisToANSI", .signature = "\x00\x00\x01" } },
    .{ "GetTempPath2W", MethodRecord{ .library = "KERNEL32", .import = "GetTempPath2W", .signature = "\x00\x02\x09\x09\x11\x05" } },
    .{ "GetTempPath2A", MethodRecord{ .library = "KERNEL32", .import = "GetTempPath2A", .signature = "\x00\x02\x09\x09\x11\x3d" } },
    .{ "CreateFile3", MethodRecord{ .library = "KERNEL32", .import = "CreateFile3", .signature = "\x00\x05\x11\x80\x85\x11\x05\x09\x09\x09\x0f\x11\x8c\x0d" } },
    .{ "CreateDirectory2A", MethodRecord{ .library = "KERNEL32", .import = "CreateDirectory2A", .signature = "\x00\x05\x11\x80\x85\x11\x3d\x09\x09\x11\x8c\x11\x0f\x11\x8b\xb5" } },
    .{ "CreateDirectory2W", MethodRecord{ .library = "KERNEL32", .import = "CreateDirectory2W", .signature = "\x00\x05\x11\x80\x85\x11\x05\x09\x09\x11\x8c\x11\x0f\x11\x8b\xb5" } },
    .{ "RemoveDirectory2A", MethodRecord{ .library = "KERNEL32", .import = "RemoveDirectory2A", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x8c\x11" } },
    .{ "RemoveDirectory2W", MethodRecord{ .library = "KERNEL32", .import = "RemoveDirectory2W", .signature = "\x00\x02\x11\x59\x11\x05\x11\x8c\x11" } },
    .{ "DeleteFile2A", MethodRecord{ .library = "KERNEL32", .import = "DeleteFile2A", .signature = "\x00\x02\x11\x59\x11\x3d\x09" } },
    .{ "DeleteFile2W", MethodRecord{ .library = "KERNEL32", .import = "DeleteFile2W", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "CopyFileFromAppW", MethodRecord{ .library = "api-ms-win-core-file-fromapp-l1-1-0", .import = "CopyFileFromAppW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x59" } },
    .{ "CreateDirectoryFromAppW", MethodRecord{ .library = "api-ms-win-core-file-fromapp-l1-1-0", .import = "CreateDirectoryFromAppW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x11\x8b\xb5" } },
    .{ "CreateFileFromAppW", MethodRecord{ .library = "api-ms-win-core-file-fromapp-l1-1-0", .import = "CreateFileFromAppW", .signature = "\x00\x07\x11\x80\x85\x11\x05\x09\x09\x0f\x11\x8b\xb5\x09\x09\x11\x80\x85" } },
    .{ "CreateFile2FromAppW", MethodRecord{ .library = "api-ms-win-core-file-fromapp-l1-1-0", .import = "CreateFile2FromAppW", .signature = "\x00\x05\x11\x80\x85\x11\x05\x09\x09\x09\x0f\x11\x8c\x05" } },
    .{ "DeleteFileFromAppW", MethodRecord{ .library = "api-ms-win-core-file-fromapp-l1-1-0", .import = "DeleteFileFromAppW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "FindFirstFileExFromAppW", MethodRecord{ .library = "api-ms-win-core-file-fromapp-l1-1-0", .import = "FindFirstFileExFromAppW", .signature = "\x00\x06\x11\x80\x85\x11\x05\x11\x8b\xcd\x0f\x01\x11\x8b\xd1\x0f\x01\x09" } },
    .{ "GetFileAttributesExFromAppW", MethodRecord{ .library = "api-ms-win-core-file-fromapp-l1-1-0", .import = "GetFileAttributesExFromAppW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x8b\xd9\x0f\x01" } },
    .{ "MoveFileFromAppW", MethodRecord{ .library = "api-ms-win-core-file-fromapp-l1-1-0", .import = "MoveFileFromAppW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "RemoveDirectoryFromAppW", MethodRecord{ .library = "api-ms-win-core-file-fromapp-l1-1-0", .import = "RemoveDirectoryFromAppW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "ReplaceFileFromAppW", MethodRecord{ .library = "api-ms-win-core-file-fromapp-l1-1-0", .import = "ReplaceFileFromAppW", .signature = "\x00\x06\x11\x59\x11\x05\x11\x05\x11\x05\x09\x0f\x01\x0f\x01" } },
    .{ "SetFileAttributesFromAppW", MethodRecord{ .library = "api-ms-win-core-file-fromapp-l1-1-0", .import = "SetFileAttributesFromAppW", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "VerFindFileA", MethodRecord{ .library = "VERSION", .import = "VerFindFileA", .signature = "\x00\x08\x11\x8c\x15\x11\x8c\x19\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x0f\x09\x11\x3d\x0f\x09" } },
    .{ "VerFindFileW", MethodRecord{ .library = "VERSION", .import = "VerFindFileW", .signature = "\x00\x08\x11\x8c\x15\x11\x8c\x19\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x09\x11\x05\x0f\x09" } },
    .{ "VerInstallFileA", MethodRecord{ .library = "VERSION", .import = "VerInstallFileA", .signature = "\x00\x08\x11\x8c\x1d\x11\x8c\x21\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "VerInstallFileW", MethodRecord{ .library = "VERSION", .import = "VerInstallFileW", .signature = "\x00\x08\x11\x8c\x1d\x11\x8c\x21\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x09" } },
    .{ "GetFileVersionInfoSizeA", MethodRecord{ .library = "VERSION", .import = "GetFileVersionInfoSizeA", .signature = "\x00\x02\x09\x11\x3d\x0f\x09" } },
    .{ "GetFileVersionInfoSizeW", MethodRecord{ .library = "VERSION", .import = "GetFileVersionInfoSizeW", .signature = "\x00\x02\x09\x11\x05\x0f\x09" } },
    .{ "GetFileVersionInfoA", MethodRecord{ .library = "VERSION", .import = "GetFileVersionInfoA", .signature = "\x00\x04\x11\x59\x11\x3d\x09\x09\x0f\x01" } },
    .{ "GetFileVersionInfoW", MethodRecord{ .library = "VERSION", .import = "GetFileVersionInfoW", .signature = "\x00\x04\x11\x59\x11\x05\x09\x09\x0f\x01" } },
    .{ "GetFileVersionInfoSizeExA", MethodRecord{ .library = "VERSION", .import = "GetFileVersionInfoSizeExA", .signature = "\x00\x03\x09\x11\x8c\x25\x11\x3d\x0f\x09" } },
    .{ "GetFileVersionInfoSizeExW", MethodRecord{ .library = "VERSION", .import = "GetFileVersionInfoSizeExW", .signature = "\x00\x03\x09\x11\x8c\x25\x11\x05\x0f\x09" } },
    .{ "GetFileVersionInfoExA", MethodRecord{ .library = "VERSION", .import = "GetFileVersionInfoExA", .signature = "\x00\x05\x11\x59\x11\x8c\x25\x11\x3d\x09\x09\x0f\x01" } },
    .{ "GetFileVersionInfoExW", MethodRecord{ .library = "VERSION", .import = "GetFileVersionInfoExW", .signature = "\x00\x05\x11\x59\x11\x8c\x25\x11\x05\x09\x09\x0f\x01" } },
    .{ "VerLanguageNameA", MethodRecord{ .library = "KERNEL32", .import = "VerLanguageNameA", .signature = "\x00\x03\x09\x09\x11\x3d\x09" } },
    .{ "VerLanguageNameW", MethodRecord{ .library = "KERNEL32", .import = "VerLanguageNameW", .signature = "\x00\x03\x09\x09\x11\x05\x09" } },
    .{ "VerQueryValueA", MethodRecord{ .library = "VERSION", .import = "VerQueryValueA", .signature = "\x00\x04\x11\x59\x0f\x01\x11\x3d\x0f\x0f\x01\x0f\x09" } },
    .{ "VerQueryValueW", MethodRecord{ .library = "VERSION", .import = "VerQueryValueW", .signature = "\x00\x04\x11\x59\x0f\x01\x11\x05\x0f\x0f\x01\x0f\x09" } },
    .{ "LsnEqual", MethodRecord{ .library = "clfsw32", .import = "LsnEqual", .signature = "\x00\x02\x11\x87\x79\x0f\x11\x8c\x29\x0f\x11\x8c\x29" } },
    .{ "LsnLess", MethodRecord{ .library = "clfsw32", .import = "LsnLess", .signature = "\x00\x02\x11\x87\x79\x0f\x11\x8c\x29\x0f\x11\x8c\x29" } },
    .{ "LsnGreater", MethodRecord{ .library = "clfsw32", .import = "LsnGreater", .signature = "\x00\x02\x11\x87\x79\x0f\x11\x8c\x29\x0f\x11\x8c\x29" } },
    .{ "LsnNull", MethodRecord{ .library = "clfsw32", .import = "LsnNull", .signature = "\x00\x01\x11\x87\x79\x0f\x11\x8c\x29" } },
    .{ "LsnContainer", MethodRecord{ .library = "clfsw32", .import = "LsnContainer", .signature = "\x00\x01\x09\x0f\x11\x8c\x29" } },
    .{ "LsnCreate", MethodRecord{ .library = "clfsw32", .import = "LsnCreate", .signature = "\x00\x03\x11\x8c\x29\x09\x09\x09" } },
    .{ "LsnBlockOffset", MethodRecord{ .library = "clfsw32", .import = "LsnBlockOffset", .signature = "\x00\x01\x09\x0f\x11\x8c\x29" } },
    .{ "LsnRecordSequence", MethodRecord{ .library = "clfsw32", .import = "LsnRecordSequence", .signature = "\x00\x01\x09\x0f\x11\x8c\x29" } },
    .{ "LsnInvalid", MethodRecord{ .library = "clfsw32", .import = "LsnInvalid", .signature = "\x00\x01\x11\x87\x79\x0f\x11\x8c\x29" } },
    .{ "LsnIncrement", MethodRecord{ .library = "clfsw32", .import = "LsnIncrement", .signature = "\x00\x01\x11\x8c\x29\x0f\x11\x8c\x29" } },
    .{ "CreateLogFile", MethodRecord{ .library = "clfsw32", .import = "CreateLogFile", .signature = "\x00\x06\x11\x80\x85\x11\x05\x09\x11\x8b\xb9\x0f\x11\x8b\xb5\x11\x8b\xbd\x11\x8b\xad" } },
    .{ "DeleteLogByHandle", MethodRecord{ .library = "clfsw32", .import = "DeleteLogByHandle", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "DeleteLogFile", MethodRecord{ .library = "clfsw32", .import = "DeleteLogFile", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x01" } },
    .{ "AddLogContainer", MethodRecord{ .library = "clfsw32", .import = "AddLogContainer", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x0b\x11\x05\x0f\x01" } },
    .{ "AddLogContainerSet", MethodRecord{ .library = "clfsw32", .import = "AddLogContainerSet", .signature = "\x00\x05\x11\x59\x11\x80\x85\x07\x0f\x0b\x0f\x11\x05\x0f\x01" } },
    .{ "RemoveLogContainer", MethodRecord{ .library = "clfsw32", .import = "RemoveLogContainer", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x05\x11\x59\x0f\x01" } },
    .{ "RemoveLogContainerSet", MethodRecord{ .library = "clfsw32", .import = "RemoveLogContainerSet", .signature = "\x00\x05\x11\x59\x11\x80\x85\x07\x0f\x11\x05\x11\x59\x0f\x01" } },
    .{ "SetLogArchiveTail", MethodRecord{ .library = "clfsw32", .import = "SetLogArchiveTail", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\x8c\x29\x0f\x01" } },
    .{ "SetEndOfLog", MethodRecord{ .library = "clfsw32", .import = "SetEndOfLog", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\x8c\x29\x0f\x11\x8b\xed" } },
    .{ "TruncateLog", MethodRecord{ .library = "clfsw32", .import = "TruncateLog", .signature = "\x00\x03\x11\x59\x0f\x01\x0f\x11\x8c\x29\x0f\x11\x8b\xed" } },
    .{ "CreateLogContainerScanContext", MethodRecord{ .library = "clfsw32", .import = "CreateLogContainerScanContext", .signature = "\x00\x06\x11\x59\x11\x80\x85\x09\x09\x05\x0f\x11\x8c\x2d\x0f\x11\x8b\xed" } },
    .{ "ScanLogContainers", MethodRecord{ .library = "clfsw32", .import = "ScanLogContainers", .signature = "\x00\x03\x11\x59\x0f\x11\x8c\x2d\x05\x0f\x01" } },
    .{ "AlignReservedLog", MethodRecord{ .library = "clfsw32", .import = "AlignReservedLog", .signature = "\x00\x04\x11\x59\x0f\x01\x09\x0f\x0a\x0f\x0a" } },
    .{ "AllocReservedLog", MethodRecord{ .library = "clfsw32", .import = "AllocReservedLog", .signature = "\x00\x03\x11\x59\x0f\x01\x09\x0f\x0a" } },
    .{ "FreeReservedLog", MethodRecord{ .library = "clfsw32", .import = "FreeReservedLog", .signature = "\x00\x03\x11\x59\x0f\x01\x09\x0f\x0a" } },
    .{ "GetLogFileInformation", MethodRecord{ .library = "clfsw32", .import = "GetLogFileInformation", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\x8c\x31\x0f\x09" } },
    .{ "SetLogArchiveMode", MethodRecord{ .library = "clfsw32", .import = "SetLogArchiveMode", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x8c\x35" } },
    .{ "ReadLogRestartArea", MethodRecord{ .library = "clfsw32", .import = "ReadLogRestartArea", .signature = "\x00\x06\x11\x59\x0f\x01\x0f\x0f\x01\x0f\x09\x0f\x11\x8c\x29\x0f\x0f\x01\x0f\x11\x8b\xed" } },
    .{ "ReadPreviousLogRestartArea", MethodRecord{ .library = "clfsw32", .import = "ReadPreviousLogRestartArea", .signature = "\x00\x05\x11\x59\x0f\x01\x0f\x0f\x01\x0f\x09\x0f\x11\x8c\x29\x0f\x11\x8b\xed" } },
    .{ "WriteLogRestartArea", MethodRecord{ .library = "clfsw32", .import = "WriteLogRestartArea", .signature = "\x00\x08\x11\x59\x0f\x01\x0f\x01\x09\x0f\x11\x8c\x29\x11\x8c\x39\x0f\x09\x0f\x11\x8c\x29\x0f\x11\x8b\xed" } },
    .{ "GetLogReservationInfo", MethodRecord{ .library = "clfsw32", .import = "GetLogReservationInfo", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x09\x0f\x0a\x0f\x0a" } },
    .{ "AdvanceLogBase", MethodRecord{ .library = "clfsw32", .import = "AdvanceLogBase", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x11\x8c\x29\x09\x0f\x11\x8b\xed" } },
    .{ "CloseAndResetLogFile", MethodRecord{ .library = "clfsw32", .import = "CloseAndResetLogFile", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "CreateLogMarshallingArea", MethodRecord{ .library = "clfsw32", .import = "CreateLogMarshallingArea", .signature = "\x00\x08\x11\x59\x11\x80\x85\x12\x8c\x3d\x12\x8c\x41\x0f\x01\x09\x09\x09\x0f\x0f\x01" } },
    .{ "DeleteLogMarshallingArea", MethodRecord{ .library = "clfsw32", .import = "DeleteLogMarshallingArea", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "ReserveAndAppendLog", MethodRecord{ .library = "clfsw32", .import = "ReserveAndAppendLog", .signature = "\x00\x0a\x11\x59\x0f\x01\x0f\x11\x8c\x45\x09\x0f\x11\x8c\x29\x0f\x11\x8c\x29\x09\x0f\x0a\x11\x8c\x39\x0f\x11\x8c\x29\x0f\x11\x8b\xed" } },
    .{ "ReserveAndAppendLogAligned", MethodRecord{ .library = "clfsw32", .import = "ReserveAndAppendLogAligned", .signature = "\x00\x0b\x11\x59\x0f\x01\x0f\x11\x8c\x45\x09\x09\x0f\x11\x8c\x29\x0f\x11\x8c\x29\x09\x0f\x0a\x11\x8c\x39\x0f\x11\x8c\x29\x0f\x11\x8b\xed" } },
    .{ "FlushLogBuffers", MethodRecord{ .library = "clfsw32", .import = "FlushLogBuffers", .signature = "\x00\x02\x11\x59\x0f\x01\x0f\x11\x8b\xed" } },
    .{ "FlushLogToLsn", MethodRecord{ .library = "clfsw32", .import = "FlushLogToLsn", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x11\x8c\x29\x0f\x11\x8c\x29\x0f\x11\x8b\xed" } },
    .{ "ReadLogRecord", MethodRecord{ .library = "clfsw32", .import = "ReadLogRecord", .signature = "\x00\x0a\x11\x59\x0f\x01\x0f\x11\x8c\x29\x11\x8c\x49\x0f\x0f\x01\x0f\x09\x0f\x05\x0f\x11\x8c\x29\x0f\x11\x8c\x29\x0f\x0f\x01\x0f\x11\x8b\xed" } },
    .{ "ReadNextLogRecord", MethodRecord{ .library = "clfsw32", .import = "ReadNextLogRecord", .signature = "\x00\x09\x11\x59\x0f\x01\x0f\x0f\x01\x0f\x09\x0f\x05\x0f\x11\x8c\x29\x0f\x11\x8c\x29\x0f\x11\x8c\x29\x0f\x11\x8c\x29\x0f\x11\x8b\xed" } },
    .{ "TerminateReadLog", MethodRecord{ .library = "clfsw32", .import = "TerminateReadLog", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "PrepareLogArchive", MethodRecord{ .library = "clfsw32", .import = "PrepareLogArchive", .signature = "\x00\x0c\x11\x59\x11\x80\x85\x11\x05\x09\x0f\x11\x8c\x29\x0f\x11\x8c\x29\x0f\x09\x0f\x0b\x0f\x0b\x0f\x11\x8c\x29\x0f\x11\x8c\x29\x0f\x11\x8c\x29\x0f\x0f\x01" } },
    .{ "ReadLogArchiveMetadata", MethodRecord{ .library = "clfsw32", .import = "ReadLogArchiveMetadata", .signature = "\x00\x05\x11\x59\x0f\x01\x09\x09\x0f\x05\x0f\x09" } },
    .{ "GetNextLogArchiveExtent", MethodRecord{ .library = "clfsw32", .import = "GetNextLogArchiveExtent", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x11\x8c\x4d\x09\x0f\x09" } },
    .{ "TerminateLogArchive", MethodRecord{ .library = "clfsw32", .import = "TerminateLogArchive", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "ValidateLog", MethodRecord{ .library = "clfsw32", .import = "ValidateLog", .signature = "\x00\x04\x11\x59\x11\x05\x0f\x11\x8b\xb5\x0f\x11\x8c\x31\x0f\x09" } },
    .{ "GetLogContainerName", MethodRecord{ .library = "clfsw32", .import = "GetLogContainerName", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x11\x05\x09\x0f\x09" } },
    .{ "GetLogIoStatistics", MethodRecord{ .library = "clfsw32", .import = "GetLogIoStatistics", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x09\x11\x8c\x51\x0f\x09" } },
    .{ "RegisterManageableLogClient", MethodRecord{ .library = "clfsw32", .import = "RegisterManageableLogClient", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x8c\x55" } },
    .{ "DeregisterManageableLogClient", MethodRecord{ .library = "clfsw32", .import = "DeregisterManageableLogClient", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "ReadLogNotification", MethodRecord{ .library = "clfsw32", .import = "ReadLogNotification", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\x8c\x59\x0f\x11\x8b\xed" } },
    .{ "InstallLogPolicy", MethodRecord{ .library = "clfsw32", .import = "InstallLogPolicy", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x8c\x5d" } },
    .{ "RemoveLogPolicy", MethodRecord{ .library = "clfsw32", .import = "RemoveLogPolicy", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x8c\x61" } },
    .{ "QueryLogPolicy", MethodRecord{ .library = "clfsw32", .import = "QueryLogPolicy", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x8c\x61\x0f\x11\x8c\x5d\x0f\x09" } },
    .{ "SetLogFileSizeWithPolicy", MethodRecord{ .library = "clfsw32", .import = "SetLogFileSizeWithPolicy", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x0b\x0f\x0b" } },
    .{ "HandleLogFull", MethodRecord{ .library = "clfsw32", .import = "HandleLogFull", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "LogTailAdvanceFailure", MethodRecord{ .library = "clfsw32", .import = "LogTailAdvanceFailure", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "RegisterForLogWriteNotification", MethodRecord{ .library = "clfsw32", .import = "RegisterForLogWriteNotification", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x11\x59" } },
    .{ "QueryUsersOnEncryptedFile", MethodRecord{ .library = "ADVAPI32", .import = "QueryUsersOnEncryptedFile", .signature = "\x00\x02\x09\x11\x05\x0f\x0f\x11\x8c\x65" } },
    .{ "QueryRecoveryAgentsOnEncryptedFile", MethodRecord{ .library = "ADVAPI32", .import = "QueryRecoveryAgentsOnEncryptedFile", .signature = "\x00\x02\x09\x11\x05\x0f\x0f\x11\x8c\x65" } },
    .{ "RemoveUsersFromEncryptedFile", MethodRecord{ .library = "ADVAPI32", .import = "RemoveUsersFromEncryptedFile", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x8c\x65" } },
    .{ "AddUsersToEncryptedFile", MethodRecord{ .library = "ADVAPI32", .import = "AddUsersToEncryptedFile", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x8c\x69" } },
    .{ "SetUserFileEncryptionKey", MethodRecord{ .library = "ADVAPI32", .import = "SetUserFileEncryptionKey", .signature = "\x00\x01\x09\x0f\x11\x8c\x6d" } },
    .{ "SetUserFileEncryptionKeyEx", MethodRecord{ .library = "ADVAPI32", .import = "SetUserFileEncryptionKeyEx", .signature = "\x00\x04\x09\x0f\x11\x8c\x6d\x09\x09\x0f\x01" } },
    .{ "FreeEncryptionCertificateHashList", MethodRecord{ .library = "ADVAPI32", .import = "FreeEncryptionCertificateHashList", .signature = "\x00\x01\x01\x0f\x11\x8c\x65" } },
    .{ "EncryptionDisable", MethodRecord{ .library = "ADVAPI32", .import = "EncryptionDisable", .signature = "\x00\x02\x11\x59\x11\x05\x11\x59" } },
    .{ "DuplicateEncryptionInfoFile", MethodRecord{ .library = "ADVAPI32", .import = "DuplicateEncryptionInfoFile", .signature = "\x00\x05\x09\x11\x05\x11\x05\x09\x09\x0f\x11\x8b\xb5" } },
    .{ "GetEncryptedFileMetadata", MethodRecord{ .library = "ADVAPI32", .import = "GetEncryptedFileMetadata", .signature = "\x00\x03\x09\x11\x05\x0f\x09\x0f\x0f\x05" } },
    .{ "SetEncryptedFileMetadata", MethodRecord{ .library = "ADVAPI32", .import = "SetEncryptedFileMetadata", .signature = "\x00\x06\x09\x11\x05\x0f\x05\x0f\x05\x0f\x11\x8c\x71\x09\x0f\x11\x8c\x65" } },
    .{ "FreeEncryptedFileMetadata", MethodRecord{ .library = "ADVAPI32", .import = "FreeEncryptedFileMetadata", .signature = "\x00\x01\x01\x0f\x05" } },
    .{ "LZStart", MethodRecord{ .library = "KERNEL32", .import = "LZStart", .signature = "\x00\x00\x08" } },
    .{ "LZDone", MethodRecord{ .library = "KERNEL32", .import = "LZDone", .signature = "\x00\x00\x01" } },
    .{ "CopyLZFile", MethodRecord{ .library = "KERNEL32", .import = "CopyLZFile", .signature = "\x00\x02\x08\x08\x08" } },
    .{ "LZCopy", MethodRecord{ .library = "KERNEL32", .import = "LZCopy", .signature = "\x00\x02\x08\x08\x08" } },
    .{ "LZInit", MethodRecord{ .library = "KERNEL32", .import = "LZInit", .signature = "\x00\x01\x08\x08" } },
    .{ "GetExpandedNameA", MethodRecord{ .library = "KERNEL32", .import = "GetExpandedNameA", .signature = "\x00\x02\x08\x11\x3d\x11\x3d" } },
    .{ "GetExpandedNameW", MethodRecord{ .library = "KERNEL32", .import = "GetExpandedNameW", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
    .{ "LZOpenFileA", MethodRecord{ .library = "KERNEL32", .import = "LZOpenFileA", .signature = "\x00\x03\x08\x11\x3d\x0f\x11\x8c\x75\x11\x8c\x79" } },
    .{ "LZOpenFileW", MethodRecord{ .library = "KERNEL32", .import = "LZOpenFileW", .signature = "\x00\x03\x08\x11\x05\x0f\x11\x8c\x75\x11\x8c\x79" } },
    .{ "LZSeek", MethodRecord{ .library = "KERNEL32", .import = "LZSeek", .signature = "\x00\x03\x08\x08\x08\x08" } },
    .{ "LZRead", MethodRecord{ .library = "KERNEL32", .import = "LZRead", .signature = "\x00\x03\x08\x08\x11\x3d\x08" } },
    .{ "LZClose", MethodRecord{ .library = "KERNEL32", .import = "LZClose", .signature = "\x00\x01\x01\x08" } },
    .{ "WofShouldCompressBinaries", MethodRecord{ .library = "WOFUTIL", .import = "WofShouldCompressBinaries", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x09" } },
    .{ "WofGetDriverVersion", MethodRecord{ .library = "WOFUTIL", .import = "WofGetDriverVersion", .signature = "\x00\x03\x11\x79\x11\x80\x85\x09\x0f\x09" } },
    .{ "WofSetFileDataLocation", MethodRecord{ .library = "WOFUTIL", .import = "WofSetFileDataLocation", .signature = "\x00\x04\x11\x79\x11\x80\x85\x09\x0f\x01\x09" } },
    .{ "WofIsExternalFile", MethodRecord{ .library = "WOFUTIL", .import = "WofIsExternalFile", .signature = "\x00\x05\x11\x79\x11\x05\x0f\x11\x59\x0f\x09\x0f\x01\x0f\x09" } },
    .{ "WofEnumEntries", MethodRecord{ .library = "WOFUTIL", .import = "WofEnumEntries", .signature = "\x00\x04\x11\x79\x11\x05\x09\x12\x8c\x7d\x0f\x01" } },
    .{ "WofWimAddEntry", MethodRecord{ .library = "WOFUTIL", .import = "WofWimAddEntry", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x09\x09\x0f\x0a" } },
    .{ "WofWimEnumFiles", MethodRecord{ .library = "WOFUTIL", .import = "WofWimEnumFiles", .signature = "\x00\x04\x11\x79\x11\x05\x0a\x12\x8c\x81\x0f\x01" } },
    .{ "WofWimSuspendEntry", MethodRecord{ .library = "WOFUTIL", .import = "WofWimSuspendEntry", .signature = "\x00\x02\x11\x79\x11\x05\x0a" } },
    .{ "WofWimRemoveEntry", MethodRecord{ .library = "WOFUTIL", .import = "WofWimRemoveEntry", .signature = "\x00\x02\x11\x79\x11\x05\x0a" } },
    .{ "WofWimUpdateEntry", MethodRecord{ .library = "WOFUTIL", .import = "WofWimUpdateEntry", .signature = "\x00\x03\x11\x79\x11\x05\x0a\x11\x05" } },
    .{ "WofFileEnumFiles", MethodRecord{ .library = "WOFUTIL", .import = "WofFileEnumFiles", .signature = "\x00\x04\x11\x79\x11\x05\x09\x12\x8c\x81\x0f\x01" } },
    .{ "TxfLogCreateFileReadContext", MethodRecord{ .library = "txfw32", .import = "TxfLogCreateFileReadContext", .signature = "\x00\x05\x11\x59\x11\x05\x11\x8c\x29\x11\x8c\x29\x0f\x11\x8c\x85\x0f\x0f\x01" } },
    .{ "TxfLogCreateRangeReadContext", MethodRecord{ .library = "txfw32", .import = "TxfLogCreateRangeReadContext", .signature = "\x00\x07\x11\x59\x11\x05\x11\x8c\x29\x11\x8c\x29\x0f\x0a\x0f\x0a\x09\x0f\x0f\x01" } },
    .{ "TxfLogDestroyReadContext", MethodRecord{ .library = "txfw32", .import = "TxfLogDestroyReadContext", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "TxfLogReadRecords", MethodRecord{ .library = "txfw32", .import = "TxfLogReadRecords", .signature = "\x00\x05\x11\x59\x0f\x01\x09\x0f\x01\x0f\x09\x0f\x09" } },
    .{ "TxfReadMetadataInfo", MethodRecord{ .library = "txfw32", .import = "TxfReadMetadataInfo", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\x8c\x85\x0f\x11\x8c\x29\x0f\x09\x0f\x11\x0d" } },
    .{ "TxfLogRecordGetFileName", MethodRecord{ .library = "txfw32", .import = "TxfLogRecordGetFileName", .signature = "\x00\x05\x11\x59\x0f\x01\x09\x11\x05\x0f\x09\x0f\x11\x8c\x85" } },
    .{ "TxfLogRecordGetGenericType", MethodRecord{ .library = "txfw32", .import = "TxfLogRecordGetGenericType", .signature = "\x00\x04\x11\x59\x0f\x01\x09\x0f\x09\x0f\x0a" } },
    .{ "TxfSetThreadMiniVersionForCreate", MethodRecord{ .library = "txfw32", .import = "TxfSetThreadMiniVersionForCreate", .signature = "\x00\x01\x01\x07" } },
    .{ "TxfGetThreadMiniVersionForCreate", MethodRecord{ .library = "txfw32", .import = "TxfGetThreadMiniVersionForCreate", .signature = "\x00\x01\x01\x0f\x07" } },
    .{ "CreateTransaction", MethodRecord{ .library = "ktmw32", .import = "CreateTransaction", .signature = "\x00\x07\x11\x80\x85\x0f\x11\x8b\xb5\x0f\x11\x0d\x09\x09\x09\x09\x11\x05" } },
    .{ "OpenTransaction", MethodRecord{ .library = "ktmw32", .import = "OpenTransaction", .signature = "\x00\x02\x11\x80\x85\x09\x0f\x11\x0d" } },
    .{ "CommitTransaction", MethodRecord{ .library = "ktmw32", .import = "CommitTransaction", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "CommitTransactionAsync", MethodRecord{ .library = "ktmw32", .import = "CommitTransactionAsync", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "RollbackTransaction", MethodRecord{ .library = "ktmw32", .import = "RollbackTransaction", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "RollbackTransactionAsync", MethodRecord{ .library = "ktmw32", .import = "RollbackTransactionAsync", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "GetTransactionId", MethodRecord{ .library = "ktmw32", .import = "GetTransactionId", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x0d" } },
    .{ "GetTransactionInformation", MethodRecord{ .library = "ktmw32", .import = "GetTransactionInformation", .signature = "\x00\x07\x11\x59\x11\x80\x85\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x09\x11\x05" } },
    .{ "SetTransactionInformation", MethodRecord{ .library = "ktmw32", .import = "SetTransactionInformation", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x09\x09\x11\x05" } },
    .{ "CreateTransactionManager", MethodRecord{ .library = "ktmw32", .import = "CreateTransactionManager", .signature = "\x00\x04\x11\x80\x85\x0f\x11\x8b\xb5\x11\x05\x09\x09" } },
    .{ "OpenTransactionManager", MethodRecord{ .library = "ktmw32", .import = "OpenTransactionManager", .signature = "\x00\x03\x11\x80\x85\x11\x05\x09\x09" } },
    .{ "OpenTransactionManagerById", MethodRecord{ .library = "ktmw32", .import = "OpenTransactionManagerById", .signature = "\x00\x03\x11\x80\x85\x0f\x11\x0d\x09\x09" } },
    .{ "RenameTransactionManager", MethodRecord{ .library = "ktmw32", .import = "RenameTransactionManager", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x11\x0d" } },
    .{ "RollforwardTransactionManager", MethodRecord{ .library = "ktmw32", .import = "RollforwardTransactionManager", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0a" } },
    .{ "RecoverTransactionManager", MethodRecord{ .library = "ktmw32", .import = "RecoverTransactionManager", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "GetCurrentClockTransactionManager", MethodRecord{ .library = "ktmw32", .import = "GetCurrentClockTransactionManager", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0a" } },
    .{ "GetTransactionManagerId", MethodRecord{ .library = "ktmw32", .import = "GetTransactionManagerId", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x0d" } },
    .{ "CreateResourceManager", MethodRecord{ .library = "ktmw32", .import = "CreateResourceManager", .signature = "\x00\x05\x11\x80\x85\x0f\x11\x8b\xb5\x0f\x11\x0d\x09\x11\x80\x85\x11\x05" } },
    .{ "OpenResourceManager", MethodRecord{ .library = "ktmw32", .import = "OpenResourceManager", .signature = "\x00\x03\x11\x80\x85\x09\x11\x80\x85\x0f\x11\x0d" } },
    .{ "RecoverResourceManager", MethodRecord{ .library = "ktmw32", .import = "RecoverResourceManager", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "GetNotificationResourceManager", MethodRecord{ .library = "ktmw32", .import = "GetNotificationResourceManager", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\x8c\x89\x09\x09\x0f\x09" } },
    .{ "GetNotificationResourceManagerAsync", MethodRecord{ .library = "ktmw32", .import = "GetNotificationResourceManagerAsync", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\x8c\x89\x09\x0f\x09\x0f\x11\x8b\xed" } },
    .{ "SetResourceManagerCompletionPort", MethodRecord{ .library = "ktmw32", .import = "SetResourceManagerCompletionPort", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x80\x85\x19" } },
    .{ "CreateEnlistment", MethodRecord{ .library = "ktmw32", .import = "CreateEnlistment", .signature = "\x00\x06\x11\x80\x85\x0f\x11\x8b\xb5\x11\x80\x85\x11\x80\x85\x09\x09\x0f\x01" } },
    .{ "OpenEnlistment", MethodRecord{ .library = "ktmw32", .import = "OpenEnlistment", .signature = "\x00\x03\x11\x80\x85\x09\x11\x80\x85\x0f\x11\x0d" } },
    .{ "RecoverEnlistment", MethodRecord{ .library = "ktmw32", .import = "RecoverEnlistment", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x01" } },
    .{ "GetEnlistmentRecoveryInformation", MethodRecord{ .library = "ktmw32", .import = "GetEnlistmentRecoveryInformation", .signature = "\x00\x04\x11\x59\x11\x80\x85\x09\x0f\x01\x0f\x09" } },
    .{ "GetEnlistmentId", MethodRecord{ .library = "ktmw32", .import = "GetEnlistmentId", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x0d" } },
    .{ "SetEnlistmentRecoveryInformation", MethodRecord{ .library = "ktmw32", .import = "SetEnlistmentRecoveryInformation", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x0f\x01" } },
    .{ "PrepareEnlistment", MethodRecord{ .library = "ktmw32", .import = "PrepareEnlistment", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0a" } },
    .{ "PrePrepareEnlistment", MethodRecord{ .library = "ktmw32", .import = "PrePrepareEnlistment", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0a" } },
    .{ "CommitEnlistment", MethodRecord{ .library = "ktmw32", .import = "CommitEnlistment", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0a" } },
    .{ "RollbackEnlistment", MethodRecord{ .library = "ktmw32", .import = "RollbackEnlistment", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0a" } },
    .{ "PrePrepareComplete", MethodRecord{ .library = "ktmw32", .import = "PrePrepareComplete", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0a" } },
    .{ "PrepareComplete", MethodRecord{ .library = "ktmw32", .import = "PrepareComplete", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0a" } },
    .{ "ReadOnlyEnlistment", MethodRecord{ .library = "ktmw32", .import = "ReadOnlyEnlistment", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0a" } },
    .{ "CommitComplete", MethodRecord{ .library = "ktmw32", .import = "CommitComplete", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0a" } },
    .{ "RollbackComplete", MethodRecord{ .library = "ktmw32", .import = "RollbackComplete", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0a" } },
    .{ "SinglePhaseReject", MethodRecord{ .library = "ktmw32", .import = "SinglePhaseReject", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0a" } },
    .{ "NetShareAdd", MethodRecord{ .library = "NETAPI32", .import = "NetShareAdd", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x05\x0f\x09" } },
    .{ "NetShareEnum", MethodRecord{ .library = "NETAPI32", .import = "NetShareEnum", .signature = "\x00\x07\x09\x11\x05\x09\x0f\x0f\x05\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "NetShareEnumSticky", MethodRecord{ .library = "NETAPI32", .import = "NetShareEnumSticky", .signature = "\x00\x07\x09\x11\x05\x09\x0f\x0f\x05\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "NetShareGetInfo", MethodRecord{ .library = "NETAPI32", .import = "NetShareGetInfo", .signature = "\x00\x04\x09\x11\x05\x11\x05\x09\x0f\x0f\x05" } },
    .{ "NetShareSetInfo", MethodRecord{ .library = "NETAPI32", .import = "NetShareSetInfo", .signature = "\x00\x05\x09\x11\x05\x11\x05\x09\x0f\x05\x0f\x09" } },
    .{ "NetShareDel", MethodRecord{ .library = "NETAPI32", .import = "NetShareDel", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "NetShareDelSticky", MethodRecord{ .library = "NETAPI32", .import = "NetShareDelSticky", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "NetShareCheck", MethodRecord{ .library = "NETAPI32", .import = "NetShareCheck", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "NetShareDelEx", MethodRecord{ .library = "NETAPI32", .import = "NetShareDelEx", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x05" } },
    .{ "NetServerAliasAdd", MethodRecord{ .library = "NETAPI32", .import = "NetServerAliasAdd", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x05" } },
    .{ "NetServerAliasDel", MethodRecord{ .library = "NETAPI32", .import = "NetServerAliasDel", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x05" } },
    .{ "NetServerAliasEnum", MethodRecord{ .library = "NETAPI32", .import = "NetServerAliasEnum", .signature = "\x00\x07\x09\x11\x05\x09\x0f\x0f\x05\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "NetSessionEnum", MethodRecord{ .library = "NETAPI32", .import = "NetSessionEnum", .signature = "\x00\x09\x09\x11\x05\x11\x05\x11\x05\x09\x0f\x0f\x05\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "NetSessionDel", MethodRecord{ .library = "NETAPI32", .import = "NetSessionDel", .signature = "\x00\x03\x09\x11\x05\x11\x05\x11\x05" } },
    .{ "NetSessionGetInfo", MethodRecord{ .library = "NETAPI32", .import = "NetSessionGetInfo", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x09\x0f\x0f\x05" } },
    .{ "NetConnectionEnum", MethodRecord{ .library = "NETAPI32", .import = "NetConnectionEnum", .signature = "\x00\x08\x09\x11\x05\x11\x05\x09\x0f\x0f\x05\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "NetFileClose", MethodRecord{ .library = "NETAPI32", .import = "NetFileClose", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "NetFileEnum", MethodRecord{ .library = "NETAPI32", .import = "NetFileEnum", .signature = "\x00\x09\x09\x11\x05\x11\x05\x11\x05\x09\x0f\x0f\x05\x09\x0f\x09\x0f\x09\x0f\x19" } },
    .{ "NetFileGetInfo", MethodRecord{ .library = "NETAPI32", .import = "NetFileGetInfo", .signature = "\x00\x04\x09\x11\x05\x09\x09\x0f\x0f\x05" } },
    .{ "NetStatisticsGet", MethodRecord{ .library = "NETAPI32", .import = "NetStatisticsGet", .signature = "\x00\x05\x09\x0f\x04\x0f\x04\x09\x09\x0f\x0f\x05" } },
    .{ "QueryIoRingCapabilities", MethodRecord{ .library = "api-ms-win-core-ioring-l1-1-0", .import = "QueryIoRingCapabilities", .signature = "\x00\x01\x11\x79\x0f\x11\x8c\x8d" } },
    .{ "IsIoRingOpSupported", MethodRecord{ .library = "api-ms-win-core-ioring-l1-1-0", .import = "IsIoRingOpSupported", .signature = "\x00\x02\x11\x59\x11\x8c\x91\x11\x8c\x95" } },
    .{ "CreateIoRing", MethodRecord{ .library = "api-ms-win-core-ioring-l1-1-0", .import = "CreateIoRing", .signature = "\x00\x05\x11\x79\x11\x8c\x99\x11\x8c\x9d\x09\x09\x0f\x11\x8c\x91" } },
    .{ "GetIoRingInfo", MethodRecord{ .library = "api-ms-win-core-ioring-l1-1-0", .import = "GetIoRingInfo", .signature = "\x00\x02\x11\x79\x11\x8c\x91\x0f\x11\x8c\xa1" } },
    .{ "SubmitIoRing", MethodRecord{ .library = "api-ms-win-core-ioring-l1-1-0", .import = "SubmitIoRing", .signature = "\x00\x04\x11\x79\x11\x8c\x91\x09\x09\x0f\x09" } },
    .{ "CloseIoRing", MethodRecord{ .library = "api-ms-win-core-ioring-l1-1-0", .import = "CloseIoRing", .signature = "\x00\x01\x11\x79\x11\x8c\x91" } },
    .{ "PopIoRingCompletion", MethodRecord{ .library = "api-ms-win-core-ioring-l1-1-0", .import = "PopIoRingCompletion", .signature = "\x00\x02\x11\x79\x11\x8c\x91\x0f\x11\x8c\xa5" } },
    .{ "SetIoRingCompletionEvent", MethodRecord{ .library = "api-ms-win-core-ioring-l1-1-0", .import = "SetIoRingCompletionEvent", .signature = "\x00\x02\x11\x79\x11\x8c\x91\x11\x80\x85" } },
    .{ "BuildIoRingCancelRequest", MethodRecord{ .library = "api-ms-win-core-ioring-l1-1-0", .import = "BuildIoRingCancelRequest", .signature = "\x00\x04\x11\x79\x11\x8c\x91\x11\x8c\xa9\x19\x19" } },
    .{ "BuildIoRingReadFile", MethodRecord{ .library = "api-ms-win-core-ioring-l1-1-0", .import = "BuildIoRingReadFile", .signature = "\x00\x07\x11\x79\x11\x8c\x91\x11\x8c\xa9\x11\x8c\xad\x09\x0b\x19\x11\x8c\xb1" } },
    .{ "BuildIoRingRegisterFileHandles", MethodRecord{ .library = "api-ms-win-core-ioring-l1-1-0", .import = "BuildIoRingRegisterFileHandles", .signature = "\x00\x04\x11\x79\x11\x8c\x91\x09\x0f\x11\x80\x85\x19" } },
    .{ "BuildIoRingRegisterBuffers", MethodRecord{ .library = "api-ms-win-core-ioring-l1-1-0", .import = "BuildIoRingRegisterBuffers", .signature = "\x00\x04\x11\x79\x11\x8c\x91\x09\x0f\x11\x8c\xb5\x19" } },
    .{ "BuildIoRingWriteFile", MethodRecord{ .library = "KERNEL32", .import = "BuildIoRingWriteFile", .signature = "\x00\x08\x11\x79\x11\x8c\x91\x11\x8c\xa9\x11\x8c\xad\x09\x0b\x11\x8c\xb9\x19\x11\x8c\xb1" } },
    .{ "BuildIoRingFlushFile", MethodRecord{ .library = "KERNEL32", .import = "BuildIoRingFlushFile", .signature = "\x00\x05\x11\x79\x11\x8c\x91\x11\x8c\xa9\x11\x8c\xbd\x19\x11\x8c\xb1" } },
    .{ "BuildIoRingReadFileScatter", MethodRecord{ .library = "KERNEL32", .import = "BuildIoRingReadFileScatter", .signature = "\x00\x08\x11\x79\x11\x8c\x91\x11\x8c\xa9\x09\x0f\x11\x8b\xf9\x09\x0b\x19\x11\x8c\xb1" } },
    .{ "BuildIoRingWriteFileGather", MethodRecord{ .library = "KERNEL32", .import = "BuildIoRingWriteFileGather", .signature = "\x00\x09\x11\x79\x11\x8c\x91\x11\x8c\xa9\x09\x0f\x11\x8b\xf9\x09\x0b\x11\x8c\xb9\x19\x11\x8c\xb1" } },
    .{ "CreateBindLink", MethodRecord{ .library = "BINDFLTAPI", .import = "CreateBindLink", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x11\x8c\xc1\x09\x0f\x11\x05" } },
    .{ "RemoveBindLink", MethodRecord{ .library = "BINDFLTAPI", .import = "RemoveBindLink", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "Wow64EnableWow64FsRedirection", MethodRecord{ .library = "KERNEL32", .import = "Wow64EnableWow64FsRedirection", .signature = "\x00\x01\x11\x87\x79\x11\x87\x79" } },
    .{ "Wow64DisableWow64FsRedirection", MethodRecord{ .library = "KERNEL32", .import = "Wow64DisableWow64FsRedirection", .signature = "\x00\x01\x11\x59\x0f\x0f\x01" } },
    .{ "Wow64RevertWow64FsRedirection", MethodRecord{ .library = "KERNEL32", .import = "Wow64RevertWow64FsRedirection", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "GetBinaryTypeA", MethodRecord{ .library = "KERNEL32", .import = "GetBinaryTypeA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x09" } },
    .{ "GetBinaryTypeW", MethodRecord{ .library = "KERNEL32", .import = "GetBinaryTypeW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x09" } },
    .{ "GetShortPathNameA", MethodRecord{ .library = "KERNEL32", .import = "GetShortPathNameA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x09" } },
    .{ "GetLongPathNameTransactedA", MethodRecord{ .library = "KERNEL32", .import = "GetLongPathNameTransactedA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x09\x11\x80\x85" } },
    .{ "GetLongPathNameTransactedW", MethodRecord{ .library = "KERNEL32", .import = "GetLongPathNameTransactedW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x09\x11\x80\x85" } },
    .{ "SetFileCompletionNotificationModes", MethodRecord{ .library = "KERNEL32", .import = "SetFileCompletionNotificationModes", .signature = "\x00\x02\x11\x59\x11\x80\x85\x05" } },
    .{ "SetFileShortNameA", MethodRecord{ .library = "KERNEL32", .import = "SetFileShortNameA", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x3d" } },
    .{ "SetFileShortNameW", MethodRecord{ .library = "KERNEL32", .import = "SetFileShortNameW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x05" } },
    .{ "SetTapePosition", MethodRecord{ .library = "KERNEL32", .import = "SetTapePosition", .signature = "\x00\x06\x09\x11\x80\x85\x11\x8c\xc5\x09\x09\x09\x11\x59" } },
    .{ "GetTapePosition", MethodRecord{ .library = "KERNEL32", .import = "GetTapePosition", .signature = "\x00\x05\x09\x11\x80\x85\x11\x8c\xc9\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "PrepareTape", MethodRecord{ .library = "KERNEL32", .import = "PrepareTape", .signature = "\x00\x03\x09\x11\x80\x85\x11\x8c\xcd\x11\x59" } },
    .{ "EraseTape", MethodRecord{ .library = "KERNEL32", .import = "EraseTape", .signature = "\x00\x03\x09\x11\x80\x85\x11\x8c\xd1\x11\x59" } },
    .{ "CreateTapePartition", MethodRecord{ .library = "KERNEL32", .import = "CreateTapePartition", .signature = "\x00\x04\x09\x11\x80\x85\x11\x8c\xd5\x09\x09" } },
    .{ "WriteTapemark", MethodRecord{ .library = "KERNEL32", .import = "WriteTapemark", .signature = "\x00\x04\x09\x11\x80\x85\x11\x8c\xd9\x09\x11\x59" } },
    .{ "GetTapeStatus", MethodRecord{ .library = "KERNEL32", .import = "GetTapeStatus", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "GetTapeParameters", MethodRecord{ .library = "KERNEL32", .import = "GetTapeParameters", .signature = "\x00\x04\x09\x11\x80\x85\x11\x8c\xdd\x0f\x09\x0f\x01" } },
    .{ "SetTapeParameters", MethodRecord{ .library = "KERNEL32", .import = "SetTapeParameters", .signature = "\x00\x03\x09\x11\x80\x85\x11\x8c\xe1\x0f\x01" } },
    .{ "EncryptFileA", MethodRecord{ .library = "ADVAPI32", .import = "EncryptFileA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "EncryptFileW", MethodRecord{ .library = "ADVAPI32", .import = "EncryptFileW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "DecryptFileA", MethodRecord{ .library = "ADVAPI32", .import = "DecryptFileA", .signature = "\x00\x02\x11\x59\x11\x3d\x09" } },
    .{ "DecryptFileW", MethodRecord{ .library = "ADVAPI32", .import = "DecryptFileW", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "FileEncryptionStatusA", MethodRecord{ .library = "ADVAPI32", .import = "FileEncryptionStatusA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x09" } },
    .{ "FileEncryptionStatusW", MethodRecord{ .library = "ADVAPI32", .import = "FileEncryptionStatusW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x09" } },
    .{ "OpenEncryptedFileRawA", MethodRecord{ .library = "ADVAPI32", .import = "OpenEncryptedFileRawA", .signature = "\x00\x03\x09\x11\x3d\x09\x0f\x0f\x01" } },
    .{ "OpenEncryptedFileRawW", MethodRecord{ .library = "ADVAPI32", .import = "OpenEncryptedFileRawW", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x0f\x01" } },
    .{ "ReadEncryptedFileRaw", MethodRecord{ .library = "ADVAPI32", .import = "ReadEncryptedFileRaw", .signature = "\x00\x03\x09\x12\x8c\xe5\x0f\x01\x0f\x01" } },
    .{ "WriteEncryptedFileRaw", MethodRecord{ .library = "ADVAPI32", .import = "WriteEncryptedFileRaw", .signature = "\x00\x03\x09\x12\x8c\xe9\x0f\x01\x0f\x01" } },
    .{ "CloseEncryptedFileRaw", MethodRecord{ .library = "ADVAPI32", .import = "CloseEncryptedFileRaw", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "OpenFile", MethodRecord{ .library = "KERNEL32", .import = "OpenFile", .signature = "\x00\x03\x08\x11\x3d\x0f\x11\x8c\x75\x09" } },
    .{ "BackupRead", MethodRecord{ .library = "KERNEL32", .import = "BackupRead", .signature = "\x00\x07\x11\x59\x11\x80\x85\x0f\x05\x09\x0f\x09\x11\x59\x11\x59\x0f\x0f\x01" } },
    .{ "BackupSeek", MethodRecord{ .library = "KERNEL32", .import = "BackupSeek", .signature = "\x00\x06\x11\x59\x11\x80\x85\x09\x09\x0f\x09\x0f\x09\x0f\x0f\x01" } },
    .{ "BackupWrite", MethodRecord{ .library = "KERNEL32", .import = "BackupWrite", .signature = "\x00\x07\x11\x59\x11\x80\x85\x0f\x05\x09\x0f\x09\x11\x59\x11\x59\x0f\x0f\x01" } },
    .{ "GetLogicalDriveStringsA", MethodRecord{ .library = "KERNEL32", .import = "GetLogicalDriveStringsA", .signature = "\x00\x02\x09\x09\x11\x3d" } },
    .{ "SetSearchPathMode", MethodRecord{ .library = "KERNEL32", .import = "SetSearchPathMode", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "CreateDirectoryExA", MethodRecord{ .library = "KERNEL32", .import = "CreateDirectoryExA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x0f\x11\x8b\xb5" } },
    .{ "CreateDirectoryExW", MethodRecord{ .library = "KERNEL32", .import = "CreateDirectoryExW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x0f\x11\x8b\xb5" } },
    .{ "CreateDirectoryTransactedA", MethodRecord{ .library = "KERNEL32", .import = "CreateDirectoryTransactedA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x0f\x11\x8b\xb5\x11\x80\x85" } },
    .{ "CreateDirectoryTransactedW", MethodRecord{ .library = "KERNEL32", .import = "CreateDirectoryTransactedW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x0f\x11\x8b\xb5\x11\x80\x85" } },
    .{ "RemoveDirectoryTransactedA", MethodRecord{ .library = "KERNEL32", .import = "RemoveDirectoryTransactedA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x80\x85" } },
    .{ "RemoveDirectoryTransactedW", MethodRecord{ .library = "KERNEL32", .import = "RemoveDirectoryTransactedW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x80\x85" } },
    .{ "GetFullPathNameTransactedA", MethodRecord{ .library = "KERNEL32", .import = "GetFullPathNameTransactedA", .signature = "\x00\x05\x09\x11\x3d\x09\x11\x3d\x0f\x11\x3d\x11\x80\x85" } },
    .{ "GetFullPathNameTransactedW", MethodRecord{ .library = "KERNEL32", .import = "GetFullPathNameTransactedW", .signature = "\x00\x05\x09\x11\x05\x09\x11\x05\x0f\x11\x05\x11\x80\x85" } },
    .{ "DefineDosDeviceA", MethodRecord{ .library = "KERNEL32", .import = "DefineDosDeviceA", .signature = "\x00\x03\x11\x59\x11\x8b\xa9\x11\x3d\x11\x3d" } },
    .{ "QueryDosDeviceA", MethodRecord{ .library = "KERNEL32", .import = "QueryDosDeviceA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x09" } },
    .{ "CreateFileTransactedA", MethodRecord{ .library = "KERNEL32", .import = "CreateFileTransactedA", .signature = "\x00\x0a\x11\x80\x85\x11\x3d\x09\x11\x8b\xb9\x0f\x11\x8b\xb5\x11\x8b\xbd\x11\x8b\xad\x11\x80\x85\x11\x80\x85\x0f\x11\x8c\xed\x0f\x01" } },
    .{ "CreateFileTransactedW", MethodRecord{ .library = "KERNEL32", .import = "CreateFileTransactedW", .signature = "\x00\x0a\x11\x80\x85\x11\x05\x09\x11\x8b\xb9\x0f\x11\x8b\xb5\x11\x8b\xbd\x11\x8b\xad\x11\x80\x85\x11\x80\x85\x0f\x11\x8c\xed\x0f\x01" } },
    .{ "ReOpenFile", MethodRecord{ .library = "KERNEL32", .import = "ReOpenFile", .signature = "\x00\x04\x11\x80\x85\x11\x80\x85\x09\x11\x8b\xb9\x11\x8b\xad" } },
    .{ "SetFileAttributesTransactedA", MethodRecord{ .library = "KERNEL32", .import = "SetFileAttributesTransactedA", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x11\x80\x85" } },
    .{ "SetFileAttributesTransactedW", MethodRecord{ .library = "KERNEL32", .import = "SetFileAttributesTransactedW", .signature = "\x00\x03\x11\x59\x11\x05\x09\x11\x80\x85" } },
    .{ "GetFileAttributesTransactedA", MethodRecord{ .library = "KERNEL32", .import = "GetFileAttributesTransactedA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x8b\xd9\x0f\x01\x11\x80\x85" } },
    .{ "GetFileAttributesTransactedW", MethodRecord{ .library = "KERNEL32", .import = "GetFileAttributesTransactedW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x8b\xd9\x0f\x01\x11\x80\x85" } },
    .{ "GetCompressedFileSizeTransactedA", MethodRecord{ .library = "KERNEL32", .import = "GetCompressedFileSizeTransactedA", .signature = "\x00\x03\x09\x11\x3d\x0f\x09\x11\x80\x85" } },
    .{ "GetCompressedFileSizeTransactedW", MethodRecord{ .library = "KERNEL32", .import = "GetCompressedFileSizeTransactedW", .signature = "\x00\x03\x09\x11\x05\x0f\x09\x11\x80\x85" } },
    .{ "DeleteFileTransactedA", MethodRecord{ .library = "KERNEL32", .import = "DeleteFileTransactedA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x80\x85" } },
    .{ "DeleteFileTransactedW", MethodRecord{ .library = "KERNEL32", .import = "DeleteFileTransactedW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x80\x85" } },
    .{ "CheckNameLegalDOS8Dot3A", MethodRecord{ .library = "KERNEL32", .import = "CheckNameLegalDOS8Dot3A", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x09\x0f\x11\x59\x0f\x11\x59" } },
    .{ "CheckNameLegalDOS8Dot3W", MethodRecord{ .library = "KERNEL32", .import = "CheckNameLegalDOS8Dot3W", .signature = "\x00\x05\x11\x59\x11\x05\x11\x3d\x09\x0f\x11\x59\x0f\x11\x59" } },
    .{ "FindFirstFileTransactedA", MethodRecord{ .library = "KERNEL32", .import = "FindFirstFileTransactedA", .signature = "\x00\x07\x11\x80\x85\x11\x3d\x11\x8b\xcd\x0f\x01\x11\x8b\xd1\x0f\x01\x09\x11\x80\x85" } },
    .{ "FindFirstFileTransactedW", MethodRecord{ .library = "KERNEL32", .import = "FindFirstFileTransactedW", .signature = "\x00\x07\x11\x80\x85\x11\x05\x11\x8b\xcd\x0f\x01\x11\x8b\xd1\x0f\x01\x09\x11\x80\x85" } },
    .{ "CopyFileA", MethodRecord{ .library = "KERNEL32", .import = "CopyFileA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x59" } },
    .{ "CopyFileW", MethodRecord{ .library = "KERNEL32", .import = "CopyFileW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x59" } },
    .{ "CopyFileExA", MethodRecord{ .library = "KERNEL32", .import = "CopyFileExA", .signature = "\x00\x06\x11\x59\x11\x3d\x11\x3d\x12\x8c\xf1\x0f\x01\x0f\x11\x59\x11\x8c\xf5" } },
    .{ "CopyFileExW", MethodRecord{ .library = "KERNEL32", .import = "CopyFileExW", .signature = "\x00\x06\x11\x59\x11\x05\x11\x05\x12\x8c\xf1\x0f\x01\x0f\x11\x59\x11\x8c\xf5" } },
    .{ "CopyFileTransactedA", MethodRecord{ .library = "KERNEL32", .import = "CopyFileTransactedA", .signature = "\x00\x07\x11\x59\x11\x3d\x11\x3d\x12\x8c\xf1\x0f\x01\x0f\x11\x59\x09\x11\x80\x85" } },
    .{ "CopyFileTransactedW", MethodRecord{ .library = "KERNEL32", .import = "CopyFileTransactedW", .signature = "\x00\x07\x11\x59\x11\x05\x11\x05\x12\x8c\xf1\x0f\x01\x0f\x11\x59\x09\x11\x80\x85" } },
    .{ "CopyFile2", MethodRecord{ .library = "KERNEL32", .import = "CopyFile2", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x0f\x11\x8c\xf9" } },
    .{ "MoveFileA", MethodRecord{ .library = "KERNEL32", .import = "MoveFileA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "MoveFileW", MethodRecord{ .library = "KERNEL32", .import = "MoveFileW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "MoveFileExA", MethodRecord{ .library = "KERNEL32", .import = "MoveFileExA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x8c\xfd" } },
    .{ "MoveFileExW", MethodRecord{ .library = "KERNEL32", .import = "MoveFileExW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x8c\xfd" } },
    .{ "MoveFileWithProgressA", MethodRecord{ .library = "KERNEL32", .import = "MoveFileWithProgressA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x12\x8c\xf1\x0f\x01\x11\x8c\xfd" } },
    .{ "MoveFileWithProgressW", MethodRecord{ .library = "KERNEL32", .import = "MoveFileWithProgressW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x12\x8c\xf1\x0f\x01\x11\x8c\xfd" } },
    .{ "MoveFileTransactedA", MethodRecord{ .library = "KERNEL32", .import = "MoveFileTransactedA", .signature = "\x00\x06\x11\x59\x11\x3d\x11\x3d\x12\x8c\xf1\x0f\x01\x11\x8c\xfd\x11\x80\x85" } },
    .{ "MoveFileTransactedW", MethodRecord{ .library = "KERNEL32", .import = "MoveFileTransactedW", .signature = "\x00\x06\x11\x59\x11\x05\x11\x05\x12\x8c\xf1\x0f\x01\x11\x8c\xfd\x11\x80\x85" } },
    .{ "ReplaceFileA", MethodRecord{ .library = "KERNEL32", .import = "ReplaceFileA", .signature = "\x00\x06\x11\x59\x11\x3d\x11\x3d\x11\x3d\x11\x8d\x01\x0f\x01\x0f\x01" } },
    .{ "ReplaceFileW", MethodRecord{ .library = "KERNEL32", .import = "ReplaceFileW", .signature = "\x00\x06\x11\x59\x11\x05\x11\x05\x11\x05\x11\x8d\x01\x0f\x01\x0f\x01" } },
    .{ "CreateHardLinkA", MethodRecord{ .library = "KERNEL32", .import = "CreateHardLinkA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x0f\x11\x8b\xb5" } },
    .{ "CreateHardLinkW", MethodRecord{ .library = "KERNEL32", .import = "CreateHardLinkW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x0f\x11\x8b\xb5" } },
    .{ "CreateHardLinkTransactedA", MethodRecord{ .library = "KERNEL32", .import = "CreateHardLinkTransactedA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x0f\x11\x8b\xb5\x11\x80\x85" } },
    .{ "CreateHardLinkTransactedW", MethodRecord{ .library = "KERNEL32", .import = "CreateHardLinkTransactedW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x0f\x11\x8b\xb5\x11\x80\x85" } },
    .{ "FindFirstStreamTransactedW", MethodRecord{ .library = "KERNEL32", .import = "FindFirstStreamTransactedW", .signature = "\x00\x05\x11\x80\x85\x11\x05\x11\x8c\x09\x0f\x01\x09\x11\x80\x85" } },
    .{ "FindFirstFileNameTransactedW", MethodRecord{ .library = "KERNEL32", .import = "FindFirstFileNameTransactedW", .signature = "\x00\x05\x11\x80\x85\x11\x05\x09\x0f\x09\x11\x05\x11\x80\x85" } },
    .{ "SetVolumeLabelA", MethodRecord{ .library = "KERNEL32", .import = "SetVolumeLabelA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "SetVolumeLabelW", MethodRecord{ .library = "KERNEL32", .import = "SetVolumeLabelW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "SetFileBandwidthReservation", MethodRecord{ .library = "KERNEL32", .import = "SetFileBandwidthReservation", .signature = "\x00\x06\x11\x59\x11\x80\x85\x09\x09\x11\x59\x0f\x09\x0f\x09" } },
    .{ "GetFileBandwidthReservation", MethodRecord{ .library = "KERNEL32", .import = "GetFileBandwidthReservation", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x09\x0f\x09\x0f\x11\x59\x0f\x09\x0f\x09" } },
    .{ "ReadDirectoryChangesW", MethodRecord{ .library = "KERNEL32", .import = "ReadDirectoryChangesW", .signature = "\x00\x08\x11\x59\x11\x80\x85\x0f\x01\x09\x11\x59\x11\x8b\xc1\x0f\x09\x0f\x11\x8b\xed\x12\x8b\xf1" } },
    .{ "ReadDirectoryChangesExW", MethodRecord{ .library = "KERNEL32", .import = "ReadDirectoryChangesExW", .signature = "\x00\x09\x11\x59\x11\x80\x85\x0f\x01\x09\x11\x59\x11\x8b\xc1\x0f\x09\x0f\x11\x8b\xed\x12\x8b\xf1\x11\x8d\x05" } },
    .{ "FindFirstVolumeA", MethodRecord{ .library = "KERNEL32", .import = "FindFirstVolumeA", .signature = "\x00\x02\x11\x80\x85\x11\x3d\x09" } },
    .{ "FindNextVolumeA", MethodRecord{ .library = "KERNEL32", .import = "FindNextVolumeA", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x3d\x09" } },
    .{ "FindFirstVolumeMountPointA", MethodRecord{ .library = "KERNEL32", .import = "FindFirstVolumeMountPointA", .signature = "\x00\x03\x11\x80\x85\x11\x3d\x11\x3d\x09" } },
    .{ "FindFirstVolumeMountPointW", MethodRecord{ .library = "KERNEL32", .import = "FindFirstVolumeMountPointW", .signature = "\x00\x03\x11\x80\x85\x11\x05\x11\x05\x09" } },
    .{ "FindNextVolumeMountPointA", MethodRecord{ .library = "KERNEL32", .import = "FindNextVolumeMountPointA", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x3d\x09" } },
    .{ "FindNextVolumeMountPointW", MethodRecord{ .library = "KERNEL32", .import = "FindNextVolumeMountPointW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x05\x09" } },
    .{ "FindVolumeMountPointClose", MethodRecord{ .library = "KERNEL32", .import = "FindVolumeMountPointClose", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "SetVolumeMountPointA", MethodRecord{ .library = "KERNEL32", .import = "SetVolumeMountPointA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "SetVolumeMountPointW", MethodRecord{ .library = "KERNEL32", .import = "SetVolumeMountPointW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "DeleteVolumeMountPointA", MethodRecord{ .library = "KERNEL32", .import = "DeleteVolumeMountPointA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "GetVolumeNameForVolumeMountPointA", MethodRecord{ .library = "KERNEL32", .import = "GetVolumeNameForVolumeMountPointA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x09" } },
    .{ "GetVolumePathNameA", MethodRecord{ .library = "KERNEL32", .import = "GetVolumePathNameA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x09" } },
    .{ "GetVolumePathNamesForVolumeNameA", MethodRecord{ .library = "KERNEL32", .import = "GetVolumePathNamesForVolumeNameA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x09\x0f\x09" } },
    .{ "GetFileInformationByHandleEx", MethodRecord{ .library = "KERNEL32", .import = "GetFileInformationByHandleEx", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x8b\xfd\x0f\x01\x09" } },
    .{ "GetFileInformationByName", MethodRecord{ .library = "KERNEL32", .import = "GetFileInformationByName", .signature = "\x00\x04\x11\x59\x11\x05\x11\x8d\x09\x0f\x01\x09" } },
    .{ "OpenFileById", MethodRecord{ .library = "KERNEL32", .import = "OpenFileById", .signature = "\x00\x06\x11\x80\x85\x11\x80\x85\x0f\x11\x8d\x0d\x09\x11\x8b\xb9\x0f\x11\x8b\xb5\x11\x8b\xad" } },
    .{ "CreateSymbolicLinkA", MethodRecord{ .library = "KERNEL32", .import = "CreateSymbolicLinkA", .signature = "\x00\x03\x11\x87\x79\x11\x3d\x11\x3d\x11\x8d\x11" } },
    .{ "CreateSymbolicLinkW", MethodRecord{ .library = "KERNEL32", .import = "CreateSymbolicLinkW", .signature = "\x00\x03\x11\x87\x79\x11\x05\x11\x05\x11\x8d\x11" } },
    .{ "CreateSymbolicLinkTransactedA", MethodRecord{ .library = "KERNEL32", .import = "CreateSymbolicLinkTransactedA", .signature = "\x00\x04\x11\x87\x79\x11\x3d\x11\x3d\x11\x8d\x11\x11\x80\x85" } },
    .{ "CreateSymbolicLinkTransactedW", MethodRecord{ .library = "KERNEL32", .import = "CreateSymbolicLinkTransactedW", .signature = "\x00\x04\x11\x87\x79\x11\x05\x11\x05\x11\x8d\x11\x11\x80\x85" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0xba5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FIND_FIRST_EX_FLAGS" },
        0xba9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "DEFINE_DOS_DEVICE_FLAGS" },
        0xbad => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FILE_FLAGS_AND_ATTRIBUTES" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0xbb9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FILE_SHARE_MODE" },
        0xbbd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FILE_CREATION_DISPOSITION" },
        0xbc1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FILE_NOTIFY_CHANGE" },
        0xbc5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "WIN32_FIND_DATAA" },
        0xbc9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "WIN32_FIND_DATAW" },
        0xbcd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FINDEX_INFO_LEVELS" },
        0xbd1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FINDEX_SEARCH_OPS" },
        0xbd5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "DISK_SPACE_INFORMATION" },
        0xbd9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "GET_FILEEX_INFO_LEVELS" },
        0xbdd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "BY_HANDLE_FILE_INFORMATION" },
        0xbe1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FILE_TYPE" },
        0xbe5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "GETFINALPATHNAMEBYHANDLE_FLAGS" },
        0xbe9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "LOCK_FILE_FLAGS" },
        0xbed => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED" },
        0xbf1 => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "LPOVERLAPPED_COMPLETION_ROUTINE" },
        0xbf9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FILE_SEGMENT_ELEMENT" },
        0xbfd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FILE_INFO_BY_HANDLE_CLASS" },
        0xc01 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "SET_FILE_POINTER_MOVE_METHOD" },
        0xc05 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CREATEFILE2_EXTENDED_PARAMETERS" },
        0xc09 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "STREAM_INFO_LEVELS" },
        0xc0d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CREATEFILE3_EXTENDED_PARAMETERS" },
        0xc11 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "DIRECTORY_FLAGS" },
        0xc15 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "VER_FIND_FILE_STATUS" },
        0xc19 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "VER_FIND_FILE_FLAGS" },
        0xc1d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "VER_INSTALL_FILE_STATUS" },
        0xc21 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "VER_INSTALL_FILE_FLAGS" },
        0xc25 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "GET_FILE_VERSION_INFO_FLAGS" },
        0xc29 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CLS_LSN" },
        0xc2d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CLS_SCAN_CONTEXT" },
        0xc31 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CLS_INFORMATION" },
        0xc35 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CLFS_LOG_ARCHIVE_MODE" },
        0xc39 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CLFS_FLAG" },
        0xc3d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CLFS_BLOCK_ALLOCATION" },
        0xc41 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CLFS_BLOCK_DEALLOCATION" },
        0xc45 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CLS_WRITE_ENTRY" },
        0xc49 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CLFS_CONTEXT_MODE" },
        0xc4d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CLS_ARCHIVE_DESCRIPTOR" },
        0xc51 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CLFS_IOSTATS_CLASS" },
        0xc55 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "LOG_MANAGEMENT_CALLBACKS" },
        0xc59 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CLFS_MGMT_NOTIFICATION" },
        0xc5d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CLFS_MGMT_POLICY" },
        0xc61 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CLFS_MGMT_POLICY_TYPE" },
        0xc65 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "ENCRYPTION_CERTIFICATE_HASH_LIST" },
        0xc69 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "ENCRYPTION_CERTIFICATE_LIST" },
        0xc6d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "ENCRYPTION_CERTIFICATE" },
        0xc71 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "ENCRYPTION_CERTIFICATE_HASH" },
        0xc75 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "OFSTRUCT" },
        0xc79 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "LZOPENFILE_STYLE" },
        0xc7d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "WofEnumEntryProc" },
        0xc81 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "WofEnumFilesProc" },
        0xc85 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "TXF_ID" },
        0xc89 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "TRANSACTION_NOTIFICATION" },
        0xc8d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "IORING_CAPABILITIES" },
        0xc91 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "HIORING" },
        0xc95 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "IORING_OP_CODE" },
        0xc99 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "IORING_VERSION" },
        0xc9d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "IORING_CREATE_FLAGS" },
        0xca1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "IORING_INFO" },
        0xca5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "IORING_CQE" },
        0xca9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "IORING_HANDLE_REF" },
        0xcad => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "IORING_BUFFER_REF" },
        0xcb1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "IORING_SQE_FLAGS" },
        0xcb5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "IORING_BUFFER_INFO" },
        0xcb9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FILE_WRITE_FLAGS" },
        0xcbd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FILE_FLUSH_MODE" },
        0xcc1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CREATE_BIND_LINK_FLAGS" },
        0xcc5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "TAPE_POSITION_METHOD" },
        0xcc9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "TAPE_POSITION_TYPE" },
        0xccd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "PREPARE_TAPE_OPERATION" },
        0xcd1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "ERASE_TAPE_TYPE" },
        0xcd5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "CREATE_TAPE_PARTITION_METHOD" },
        0xcd9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "TAPEMARK_TYPE" },
        0xcdd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "GET_TAPE_DRIVE_PARAMETERS_OPERATION" },
        0xce1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "TAPE_INFORMATION_TYPE" },
        0xce5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "PFE_EXPORT_FUNC" },
        0xce9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "PFE_IMPORT_FUNC" },
        0xced => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "TXFS_MINIVERSION" },
        0xcf1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "LPPROGRESS_ROUTINE" },
        0xcf5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "COPYFILE_FLAGS" },
        0xcf9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "COPYFILE2_EXTENDED_PARAMETERS" },
        0xcfd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "MOVE_FILE_FLAGS" },
        0xd01 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "REPLACE_FILE_FLAGS" },
        0xd05 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "READ_DIRECTORY_NOTIFY_INFORMATION_CLASS" },
        0xd09 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FILE_INFO_BY_NAME_CLASS" },
        0xd0d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FILE_ID_DESCRIPTOR" },
        0xd11 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "SYMBOLIC_LINK_FLAGS" },
        else => null,
    };
}

pub const FIND_FIRST_EX_CASE_SENSITIVE = 1;
pub const FIND_FIRST_EX_LARGE_FETCH = 2;
pub const FIND_FIRST_EX_ON_DISK_ENTRIES_ONLY = 4;
pub const DDD_RAW_TARGET_PATH = 1;
pub const DDD_REMOVE_DEFINITION = 2;
pub const DDD_EXACT_MATCH_ON_REMOVE = 4;
pub const DDD_NO_BROADCAST_SYSTEM = 8;
pub const DDD_LUID_BROADCAST_DRIVE = 16;
pub const FILE_ATTRIBUTE_READONLY = 1;
pub const FILE_ATTRIBUTE_HIDDEN = 2;
pub const FILE_ATTRIBUTE_SYSTEM = 4;
pub const FILE_ATTRIBUTE_DIRECTORY = 16;
pub const FILE_ATTRIBUTE_ARCHIVE = 32;
pub const FILE_ATTRIBUTE_DEVICE = 64;
pub const FILE_ATTRIBUTE_NORMAL = 128;
pub const FILE_ATTRIBUTE_TEMPORARY = 256;
pub const FILE_ATTRIBUTE_SPARSE_FILE = 512;
pub const FILE_ATTRIBUTE_REPARSE_POINT = 1024;
pub const FILE_ATTRIBUTE_COMPRESSED = 2048;
pub const FILE_ATTRIBUTE_OFFLINE = 4096;
pub const FILE_ATTRIBUTE_NOT_CONTENT_INDEXED = 8192;
pub const FILE_ATTRIBUTE_ENCRYPTED = 16384;
pub const FILE_ATTRIBUTE_INTEGRITY_STREAM = 32768;
pub const FILE_ATTRIBUTE_VIRTUAL = 65536;
pub const FILE_ATTRIBUTE_NO_SCRUB_DATA = 131072;
pub const FILE_ATTRIBUTE_EA = 262144;
pub const FILE_ATTRIBUTE_PINNED = 524288;
pub const FILE_ATTRIBUTE_UNPINNED = 1048576;
pub const FILE_ATTRIBUTE_RECALL_ON_OPEN = 262144;
pub const FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS = 4194304;
pub const FILE_FLAG_WRITE_THROUGH = 2147483648;
pub const FILE_FLAG_OVERLAPPED = 1073741824;
pub const FILE_FLAG_NO_BUFFERING = 536870912;
pub const FILE_FLAG_RANDOM_ACCESS = 268435456;
pub const FILE_FLAG_SEQUENTIAL_SCAN = 134217728;
pub const FILE_FLAG_DELETE_ON_CLOSE = 67108864;
pub const FILE_FLAG_BACKUP_SEMANTICS = 33554432;
pub const FILE_FLAG_POSIX_SEMANTICS = 16777216;
pub const FILE_FLAG_SESSION_AWARE = 8388608;
pub const FILE_FLAG_OPEN_REPARSE_POINT = 2097152;
pub const FILE_FLAG_OPEN_NO_RECALL = 1048576;
pub const FILE_FLAG_FIRST_PIPE_INSTANCE = 524288;
pub const PIPE_ACCESS_DUPLEX = 3;
pub const PIPE_ACCESS_INBOUND = 1;
pub const PIPE_ACCESS_OUTBOUND = 2;
pub const SECURITY_ANONYMOUS = 0;
pub const SECURITY_IDENTIFICATION = 65536;
pub const SECURITY_IMPERSONATION = 131072;
pub const SECURITY_DELEGATION = 196608;
pub const SECURITY_CONTEXT_TRACKING = 262144;
pub const SECURITY_EFFECTIVE_ONLY = 524288;
pub const SECURITY_SQOS_PRESENT = 1048576;
pub const SECURITY_VALID_SQOS_FLAGS = 2031616;
pub const FILE_READ_DATA = 1;
pub const FILE_LIST_DIRECTORY = 1;
pub const FILE_WRITE_DATA = 2;
pub const FILE_ADD_FILE = 2;
pub const FILE_APPEND_DATA = 4;
pub const FILE_ADD_SUBDIRECTORY = 4;
pub const FILE_CREATE_PIPE_INSTANCE = 4;
pub const FILE_READ_EA = 8;
pub const FILE_WRITE_EA = 16;
pub const FILE_EXECUTE = 32;
pub const FILE_TRAVERSE = 32;
pub const FILE_DELETE_CHILD = 64;
pub const FILE_READ_ATTRIBUTES = 128;
pub const FILE_WRITE_ATTRIBUTES = 256;
pub const DELETE = 65536;
pub const READ_CONTROL = 131072;
pub const WRITE_DAC = 262144;
pub const WRITE_OWNER = 524288;
pub const SYNCHRONIZE = 1048576;
pub const STANDARD_RIGHTS_REQUIRED = 983040;
pub const STANDARD_RIGHTS_READ = 131072;
pub const STANDARD_RIGHTS_WRITE = 131072;
pub const STANDARD_RIGHTS_EXECUTE = 131072;
pub const STANDARD_RIGHTS_ALL = 2031616;
pub const SPECIFIC_RIGHTS_ALL = 65535;
pub const FILE_ALL_ACCESS = 2032127;
pub const FILE_GENERIC_READ = 1179785;
pub const FILE_GENERIC_WRITE = 1179926;
pub const FILE_GENERIC_EXECUTE = 1179808;
pub const MAXIMUM_REPARSE_DATA_BUFFER_SIZE = 16384;
pub const CLFS_FLAG_REENTRANT_FILE_SYSTEM = 8;
pub const CLFS_FLAG_NON_REENTRANT_FILTER = 16;
pub const CLFS_FLAG_REENTRANT_FILTER = 32;
pub const CLFS_FLAG_IGNORE_SHARE_ACCESS = 64;
pub const CLFS_FLAG_READ_IN_PROGRESS = 128;
pub const CLFS_FLAG_MINIFILTER_LEVEL = 256;
pub const CLFS_FLAG_HIDDEN_SYSTEM_LOG = 512;
pub const CLFS_MARSHALLING_FLAG_NONE = 0;
pub const CLFS_MARSHALLING_FLAG_DISABLE_BUFF_INIT = 1;
pub const CLFS_FLAG_FILTER_INTERMEDIATE_LEVEL = 16;
pub const CLFS_FLAG_FILTER_TOP_LEVEL = 32;
pub const TRANSACTION_MANAGER_VOLATILE = 1;
pub const TRANSACTION_MANAGER_COMMIT_DEFAULT = 0;
pub const TRANSACTION_MANAGER_COMMIT_SYSTEM_VOLUME = 2;
pub const TRANSACTION_MANAGER_COMMIT_SYSTEM_HIVES = 4;
pub const TRANSACTION_MANAGER_COMMIT_LOWEST = 8;
pub const TRANSACTION_MANAGER_CORRUPT_FOR_RECOVERY = 16;
pub const TRANSACTION_MANAGER_CORRUPT_FOR_PROGRESS = 32;
pub const TRANSACTION_MANAGER_MAXIMUM_OPTION = 63;
pub const TRANSACTION_DO_NOT_PROMOTE = 1;
pub const TRANSACTION_MAXIMUM_OPTION = 1;
pub const RESOURCE_MANAGER_VOLATILE = 1;
pub const RESOURCE_MANAGER_COMMUNICATION = 2;
pub const RESOURCE_MANAGER_MAXIMUM_OPTION = 3;
pub const CRM_PROTOCOL_EXPLICIT_MARSHAL_ONLY = 1;
pub const CRM_PROTOCOL_DYNAMIC_MARSHAL_INFO = 2;
pub const CRM_PROTOCOL_MAXIMUM_OPTION = 3;
pub const ENLISTMENT_SUPERIOR = 1;
pub const ENLISTMENT_MAXIMUM_OPTION = 1;
pub const TRANSACTION_NOTIFY_MASK = 1073741823;
pub const TRANSACTION_NOTIFY_PREPREPARE = 1;
pub const TRANSACTION_NOTIFY_PREPARE = 2;
pub const TRANSACTION_NOTIFY_COMMIT = 4;
pub const TRANSACTION_NOTIFY_ROLLBACK = 8;
pub const TRANSACTION_NOTIFY_PREPREPARE_COMPLETE = 16;
pub const TRANSACTION_NOTIFY_PREPARE_COMPLETE = 32;
pub const TRANSACTION_NOTIFY_COMMIT_COMPLETE = 64;
pub const TRANSACTION_NOTIFY_ROLLBACK_COMPLETE = 128;
pub const TRANSACTION_NOTIFY_RECOVER = 256;
pub const TRANSACTION_NOTIFY_SINGLE_PHASE_COMMIT = 512;
pub const TRANSACTION_NOTIFY_DELEGATE_COMMIT = 1024;
pub const TRANSACTION_NOTIFY_RECOVER_QUERY = 2048;
pub const TRANSACTION_NOTIFY_ENLIST_PREPREPARE = 4096;
pub const TRANSACTION_NOTIFY_LAST_RECOVER = 8192;
pub const TRANSACTION_NOTIFY_INDOUBT = 16384;
pub const TRANSACTION_NOTIFY_PROPAGATE_PULL = 32768;
pub const TRANSACTION_NOTIFY_PROPAGATE_PUSH = 65536;
pub const TRANSACTION_NOTIFY_MARSHAL = 131072;
pub const TRANSACTION_NOTIFY_ENLIST_MASK = 262144;
pub const TRANSACTION_NOTIFY_RM_DISCONNECTED = 16777216;
pub const TRANSACTION_NOTIFY_TM_ONLINE = 33554432;
pub const TRANSACTION_NOTIFY_COMMIT_REQUEST = 67108864;
pub const TRANSACTION_NOTIFY_PROMOTE = 134217728;
pub const TRANSACTION_NOTIFY_PROMOTE_NEW = 268435456;
pub const TRANSACTION_NOTIFY_REQUEST_OUTCOME = 536870912;
pub const TRANSACTION_NOTIFY_COMMIT_FINALIZE = 1073741824;
pub const TRANSACTION_NOTIFICATION_TM_ONLINE_FLAG_IS_CLUSTERED = 1;
pub const KTM_MARSHAL_BLOB_VERSION_MAJOR = 1;
pub const KTM_MARSHAL_BLOB_VERSION_MINOR = 1;
pub const MAX_TRANSACTION_DESCRIPTION_LENGTH = 64;
pub const MAX_RESOURCEMANAGER_DESCRIPTION_LENGTH = 64;
pub const IOCTL_VOLUME_BASE = 86;
pub const IOCTL_VOLUME_GET_VOLUME_DISK_EXTENTS = 5636096;
pub const IOCTL_VOLUME_ONLINE = 5685256;
pub const IOCTL_VOLUME_OFFLINE = 5685260;
pub const IOCTL_VOLUME_IS_CLUSTERED = 5636144;
pub const IOCTL_VOLUME_GET_GPT_ATTRIBUTES = 5636152;
pub const IOCTL_VOLUME_SUPPORTS_ONLINE_OFFLINE = 5636100;
pub const IOCTL_VOLUME_IS_OFFLINE = 5636112;
pub const IOCTL_VOLUME_IS_IO_CAPABLE = 5636116;
pub const IOCTL_VOLUME_QUERY_FAILOVER_SET = 5636120;
pub const IOCTL_VOLUME_QUERY_VOLUME_NUMBER = 5636124;
pub const IOCTL_VOLUME_LOGICAL_TO_PHYSICAL = 5636128;
pub const IOCTL_VOLUME_PHYSICAL_TO_LOGICAL = 5636132;
pub const IOCTL_VOLUME_IS_PARTITION = 5636136;
pub const IOCTL_VOLUME_READ_PLEX = 5652526;
pub const IOCTL_VOLUME_SET_GPT_ATTRIBUTES = 5636148;
pub const IOCTL_VOLUME_GET_BC_PROPERTIES = 5652540;
pub const IOCTL_VOLUME_ALLOCATE_BC_STREAM = 5685312;
pub const IOCTL_VOLUME_FREE_BC_STREAM = 5685316;
pub const IOCTL_VOLUME_BC_VERSION = 1;
pub const IOCTL_VOLUME_IS_DYNAMIC = 5636168;
pub const IOCTL_VOLUME_PREPARE_FOR_CRITICAL_IO = 5685324;
pub const IOCTL_VOLUME_QUERY_ALLOCATION_HINT = 5652562;
pub const IOCTL_VOLUME_UPDATE_PROPERTIES = 5636180;
pub const IOCTL_VOLUME_QUERY_MINIMUM_SHRINK_SIZE = 5652568;
pub const IOCTL_VOLUME_PREPARE_FOR_SHRINK = 5685340;
pub const IOCTL_VOLUME_IS_CSV = 5636192;
pub const IOCTL_VOLUME_POST_ONLINE = 5685348;
pub const IOCTL_VOLUME_GET_CSVBLOCKCACHE_CALLBACK = 5685352;
pub const CSV_BLOCK_CACHE_CALLBACK_VERSION = 1;
pub const CSV_BLOCK_AND_FILE_CACHE_CALLBACK_VERSION = 2;
pub const _FT_TYPES_DEFINITION_ = 1;
pub const CLFS_MGMT_POLICY_VERSION = 1;
pub const LOG_POLICY_OVERWRITE = 1;
pub const LOG_POLICY_PERSIST = 2;
pub const CLFS_MGMT_CLIENT_REGISTRATION_VERSION = 1;
pub const DISKQUOTA_STATE_DISABLED = 0;
pub const DISKQUOTA_STATE_TRACK = 1;
pub const DISKQUOTA_STATE_ENFORCE = 2;
pub const DISKQUOTA_STATE_MASK = 3;
pub const DISKQUOTA_FILESTATE_INCOMPLETE = 256;
pub const DISKQUOTA_FILESTATE_REBUILDING = 512;
pub const DISKQUOTA_FILESTATE_MASK = 768;
pub const DISKQUOTA_LOGFLAG_USER_THRESHOLD = 1;
pub const DISKQUOTA_LOGFLAG_USER_LIMIT = 2;
pub const DISKQUOTA_USER_ACCOUNT_RESOLVED = 0;
pub const DISKQUOTA_USER_ACCOUNT_UNAVAILABLE = 1;
pub const DISKQUOTA_USER_ACCOUNT_DELETED = 2;
pub const DISKQUOTA_USER_ACCOUNT_INVALID = 3;
pub const DISKQUOTA_USER_ACCOUNT_UNKNOWN = 4;
pub const DISKQUOTA_USER_ACCOUNT_UNRESOLVED = 5;
pub const INVALID_FILE_SIZE = 4294967295;
pub const INVALID_SET_FILE_POINTER = 4294967295;
pub const INVALID_FILE_ATTRIBUTES = 4294967295;
pub const SHARE_NETNAME_PARMNUM = 1;
pub const SHARE_TYPE_PARMNUM = 3;
pub const SHARE_REMARK_PARMNUM = 4;
pub const SHARE_PERMISSIONS_PARMNUM = 5;
pub const SHARE_MAX_USES_PARMNUM = 6;
pub const SHARE_CURRENT_USES_PARMNUM = 7;
pub const SHARE_PATH_PARMNUM = 8;
pub const SHARE_PASSWD_PARMNUM = 9;
pub const SHARE_FILE_SD_PARMNUM = 501;
pub const SHARE_SERVER_PARMNUM = 503;
pub const SHARE_QOS_POLICY_PARMNUM = 504;
pub const SHI1_NUM_ELEMENTS = 4;
pub const SHI2_NUM_ELEMENTS = 10;
pub const STYPE_RESERVED1 = 16777216;
pub const STYPE_RESERVED2 = 33554432;
pub const STYPE_RESERVED3 = 67108864;
pub const STYPE_RESERVED4 = 134217728;
pub const STYPE_RESERVED5 = 1048576;
pub const STYPE_RESERVED_ALL = 1073741568;
pub const SHI_USES_UNLIMITED = 4294967295;
pub const SHI1005_FLAGS_DFS = 1;
pub const SHI1005_FLAGS_DFS_ROOT = 2;
pub const CSC_MASK_EXT = 8240;
pub const CSC_MASK = 48;
pub const CSC_CACHE_MANUAL_REINT = 0;
pub const CSC_CACHE_AUTO_REINT = 16;
pub const CSC_CACHE_VDO = 32;
pub const CSC_CACHE_NONE = 48;
pub const SHI1005_FLAGS_RESTRICT_EXCLUSIVE_OPENS = 256;
pub const SHI1005_FLAGS_FORCE_SHARED_DELETE = 512;
pub const SHI1005_FLAGS_ALLOW_NAMESPACE_CACHING = 1024;
pub const SHI1005_FLAGS_ACCESS_BASED_DIRECTORY_ENUM = 2048;
pub const SHI1005_FLAGS_FORCE_LEVELII_OPLOCK = 4096;
pub const SHI1005_FLAGS_ENABLE_HASH = 8192;
pub const SHI1005_FLAGS_ENABLE_CA = 16384;
pub const SHI1005_FLAGS_ENCRYPT_DATA = 32768;
pub const SHI1005_FLAGS_RESERVED = 65536;
pub const SHI1005_FLAGS_DISABLE_CLIENT_BUFFERING = 131072;
pub const SHI1005_FLAGS_IDENTITY_REMOTING = 262144;
pub const SHI1005_FLAGS_CLUSTER_MANAGED = 524288;
pub const SHI1005_FLAGS_COMPRESS_DATA = 1048576;
pub const SHI1005_FLAGS_ISOLATED_TRANSPORT = 2097152;
pub const SHI1005_FLAGS_DISABLE_DIRECTORY_HANDLE_LEASING = 4194304;
pub const SESI1_NUM_ELEMENTS = 8;
pub const SESI2_NUM_ELEMENTS = 9;
pub const STATSOPT_CLR = 1;
pub const LZERROR_BADINHANDLE = -1;
pub const LZERROR_BADOUTHANDLE = -2;
pub const LZERROR_READ = -3;
pub const LZERROR_WRITE = -4;
pub const LZERROR_GLOBALLOC = -5;
pub const LZERROR_GLOBLOCK = -6;
pub const LZERROR_BADVALUE = -7;
pub const LZERROR_UNKNOWNALG = -8;
pub const NTMS_OBJECTNAME_LENGTH = 64;
pub const NTMS_DESCRIPTION_LENGTH = 127;
pub const NTMS_DEVICENAME_LENGTH = 64;
pub const NTMS_SERIALNUMBER_LENGTH = 32;
pub const NTMS_REVISION_LENGTH = 32;
pub const NTMS_BARCODE_LENGTH = 64;
pub const NTMS_SEQUENCE_LENGTH = 32;
pub const NTMS_VENDORNAME_LENGTH = 128;
pub const NTMS_PRODUCTNAME_LENGTH = 128;
pub const NTMS_USERNAME_LENGTH = 64;
pub const NTMS_APPLICATIONNAME_LENGTH = 64;
pub const NTMS_COMPUTERNAME_LENGTH = 64;
pub const NTMS_I1_MESSAGE_LENGTH = 127;
pub const NTMS_MESSAGE_LENGTH = 256;
pub const NTMS_POOLHIERARCHY_LENGTH = 512;
pub const NTMS_OMIDLABELID_LENGTH = 255;
pub const NTMS_OMIDLABELTYPE_LENGTH = 64;
pub const NTMS_OMIDLABELINFO_LENGTH = 256;
pub const NTMS_MAXATTR_LENGTH = 65536;
pub const NTMS_MAXATTR_NAMELEN = 32;
pub const NTMSMLI_MAXTYPE = 64;
pub const NTMSMLI_MAXIDSIZE = 256;
pub const NTMSMLI_MAXAPPDESCR = 256;
pub const TXF_LOG_RECORD_GENERIC_TYPE_COMMIT = 1;
pub const TXF_LOG_RECORD_GENERIC_TYPE_ABORT = 2;
pub const TXF_LOG_RECORD_GENERIC_TYPE_PREPARE = 4;
pub const TXF_LOG_RECORD_GENERIC_TYPE_DATA = 8;
pub const VS_VERSION_INFO = 1;
pub const VS_USER_DEFINED = 100;
pub const VS_FFI_SIGNATURE = -17890115;
pub const VS_FFI_STRUCVERSION = 65536;
pub const VS_FFI_FILEFLAGSMASK = 63;
pub const WINEFS_SETUSERKEY_SET_CAPABILITIES = 1;
pub const EFS_COMPATIBILITY_VERSION_NCRYPT_PROTECTOR = 5;
pub const EFS_COMPATIBILITY_VERSION_PFILE_PROTECTOR = 6;
pub const EFS_SUBVER_UNKNOWN = 0;
pub const EFS_EFS_SUBVER_EFS_CERT = 1;
pub const EFS_PFILE_SUBVER_RMS = 2;
pub const EFS_PFILE_SUBVER_APPX = 3;
pub const MAX_SID_SIZE = 256;
pub const EFS_METADATA_ADD_USER = 1;
pub const EFS_METADATA_REMOVE_USER = 2;
pub const EFS_METADATA_REPLACE_USER = 4;
pub const EFS_METADATA_GENERAL_OP = 8;
pub const WOF_PROVIDER_WIM = 1;
pub const WOF_PROVIDER_FILE = 2;
pub const WIM_PROVIDER_HASH_SIZE = 20;
pub const WIM_BOOT_OS_WIM = 1;
pub const WIM_BOOT_NOT_OS_WIM = 0;
pub const WIM_ENTRY_FLAG_NOT_ACTIVE = 1;
pub const WIM_ENTRY_FLAG_SUSPENDED = 2;
pub const WIM_EXTERNAL_FILE_INFO_FLAG_NOT_ACTIVE = 1;
pub const WIM_EXTERNAL_FILE_INFO_FLAG_SUSPENDED = 2;
pub const FILE_PROVIDER_COMPRESSION_XPRESS4K = 0;
pub const FILE_PROVIDER_COMPRESSION_LZX = 1;
pub const FILE_PROVIDER_COMPRESSION_XPRESS8K = 2;
pub const FILE_PROVIDER_COMPRESSION_XPRESS16K = 3;
pub const COPYFILE2_MESSAGE_COPY_OFFLOAD = 1;
pub const COPYFILE2_IO_CYCLE_SIZE_MIN = 4096;
pub const COPYFILE2_IO_CYCLE_SIZE_MAX = 1073741824;
pub const COPYFILE2_IO_RATE_MIN = 512;
pub const ClfsNullRecord = 0;
pub const ClfsDataRecord = 1;
pub const ClfsRestartRecord = 2;
pub const ClfsClientRecord = 3;
pub const ClsContainerInitializing = 1;
pub const ClsContainerInactive = 2;
pub const ClsContainerActive = 4;
pub const ClsContainerActivePendingDelete = 8;
pub const ClsContainerPendingArchive = 16;
pub const ClsContainerPendingArchiveAndDelete = 32;
pub const ClfsContainerInitializing = 1;
pub const ClfsContainerInactive = 2;
pub const ClfsContainerActive = 4;
pub const ClfsContainerActivePendingDelete = 8;
pub const ClfsContainerPendingArchive = 16;
pub const ClfsContainerPendingArchiveAndDelete = 32;
pub const CLFS_MAX_CONTAINER_INFO = 256;
pub const CLFS_SCAN_INIT = 1;
pub const CLFS_SCAN_FORWARD = 2;
pub const CLFS_SCAN_BACKWARD = 4;
pub const CLFS_SCAN_CLOSE = 8;
pub const CLFS_SCAN_INITIALIZED = 16;
pub const CLFS_SCAN_BUFFERED = 32;
pub const FILE_VER_GET_LOCALISED = 1;
pub const FILE_VER_GET_NEUTRAL = 2;
pub const FILE_VER_GET_PREFETCHED = 4;
pub const VFFF_ISSHAREDFILE = 1;
pub const VFF_CURNEDEST = 1;
pub const VFF_FILEINUSE = 2;
pub const VFF_BUFFTOOSMALL = 4;
pub const VIFF_FORCEINSTALL = 1;
pub const VIFF_DONTDELETEOLD = 2;
pub const VIF_TEMPFILE = 1;
pub const VIF_MISMATCH = 2;
pub const VIF_SRCOLD = 4;
pub const VIF_DIFFLANG = 8;
pub const VIF_DIFFCODEPG = 16;
pub const VIF_DIFFTYPE = 32;
pub const VIF_WRITEPROT = 64;
pub const VIF_FILEINUSE = 128;
pub const VIF_OUTOFSPACE = 256;
pub const VIF_ACCESSVIOLATION = 512;
pub const VIF_SHARINGVIOLATION = 1024;
pub const VIF_CANNOTCREATE = 2048;
pub const VIF_CANNOTDELETE = 4096;
pub const VIF_CANNOTRENAME = 8192;
pub const VIF_CANNOTDELETECUR = 16384;
pub const VIF_OUTOFMEMORY = 32768;
pub const VIF_CANNOTREADSRC = 65536;
pub const VIF_CANNOTREADDST = 131072;
pub const VIF_BUFFTOOSMALL = 262144;
pub const VIF_CANNOTLOADLZ32 = 524288;
pub const VIF_CANNOTLOADCABINET = 1048576;
pub const VS_FF_DEBUG = 1;
pub const VS_FF_PRERELEASE = 2;
pub const VS_FF_PATCHED = 4;
pub const VS_FF_PRIVATEBUILD = 8;
pub const VS_FF_INFOINFERRED = 16;
pub const VS_FF_SPECIALBUILD = 32;
pub const VOS_UNKNOWN = 0;
pub const VOS_DOS = 65536;
pub const VOS_OS216 = 131072;
pub const VOS_OS232 = 196608;
pub const VOS_NT = 262144;
pub const VOS_WINCE = 327680;
pub const VOS__BASE = 0;
pub const VOS__WINDOWS16 = 1;
pub const VOS__PM16 = 2;
pub const VOS__PM32 = 3;
pub const VOS__WINDOWS32 = 4;
pub const VOS_DOS_WINDOWS16 = 65537;
pub const VOS_DOS_WINDOWS32 = 65540;
pub const VOS_OS216_PM16 = 131074;
pub const VOS_OS232_PM32 = 196611;
pub const VOS_NT_WINDOWS32 = 262148;
pub const VFT_UNKNOWN = 0;
pub const VFT_APP = 1;
pub const VFT_DLL = 2;
pub const VFT_DRV = 3;
pub const VFT_FONT = 4;
pub const VFT_VXD = 5;
pub const VFT_STATIC_LIB = 7;
pub const VFT2_UNKNOWN = 0;
pub const VFT2_DRV_PRINTER = 1;
pub const VFT2_DRV_KEYBOARD = 2;
pub const VFT2_DRV_LANGUAGE = 3;
pub const VFT2_DRV_DISPLAY = 4;
pub const VFT2_DRV_MOUSE = 5;
pub const VFT2_DRV_NETWORK = 6;
pub const VFT2_DRV_SYSTEM = 7;
pub const VFT2_DRV_INSTALLABLE = 8;
pub const VFT2_DRV_SOUND = 9;
pub const VFT2_DRV_COMM = 10;
pub const VFT2_DRV_INPUTMETHOD = 11;
pub const VFT2_DRV_VERSIONED_PRINTER = 12;
pub const VFT2_FONT_RASTER = 1;
pub const VFT2_FONT_VECTOR = 2;
pub const VFT2_FONT_TRUETYPE = 3;
pub const CREATE_NEW = 1;
pub const CREATE_ALWAYS = 2;
pub const OPEN_EXISTING = 3;
pub const OPEN_ALWAYS = 4;
pub const TRUNCATE_EXISTING = 5;
pub const FILE_SHARE_NONE = 0;
pub const FILE_SHARE_DELETE = 4;
pub const FILE_SHARE_READ = 1;
pub const FILE_SHARE_WRITE = 2;
pub const STYPE_DISKTREE = 0;
pub const STYPE_PRINTQ = 1;
pub const STYPE_DEVICE = 2;
pub const STYPE_IPC = 3;
pub const STYPE_SPECIAL = 2147483648;
pub const STYPE_TEMPORARY = 1073741824;
pub const STYPE_MASK = 255;
pub const CLFS_FLAG_FORCE_APPEND = 1;
pub const CLFS_FLAG_FORCE_FLUSH = 2;
pub const CLFS_FLAG_NO_FLAGS = 0;
pub const CLFS_FLAG_USE_RESERVATION = 4;
pub const FILE_BEGIN = 0;
pub const FILE_CURRENT = 1;
pub const FILE_END = 2;
pub const MOVEFILE_COPY_ALLOWED = 2;
pub const MOVEFILE_CREATE_HARDLINK = 16;
pub const MOVEFILE_DELAY_UNTIL_REBOOT = 4;
pub const MOVEFILE_REPLACE_EXISTING = 1;
pub const MOVEFILE_WRITE_THROUGH = 8;
pub const MOVEFILE_FAIL_IF_NOT_TRACKABLE = 32;
pub const VOLUME_NAME_DOS = 0;
pub const VOLUME_NAME_GUID = 1;
pub const VOLUME_NAME_NT = 2;
pub const VOLUME_NAME_NONE = 4;
pub const FILE_NAME_NORMALIZED = 0;
pub const FILE_NAME_OPENED = 8;
pub const OF_CANCEL = 2048;
pub const OF_CREATE = 4096;
pub const OF_DELETE = 512;
pub const OF_EXIST = 16384;
pub const OF_PARSE = 256;
pub const OF_PROMPT = 8192;
pub const OF_READ = 0;
pub const OF_READWRITE = 2;
pub const OF_REOPEN = 32768;
pub const OF_SHARE_DENY_NONE = 64;
pub const OF_SHARE_DENY_READ = 48;
pub const OF_SHARE_DENY_WRITE = 32;
pub const OF_SHARE_EXCLUSIVE = 16;
pub const OF_WRITE = 1;
pub const OF_SHARE_COMPAT = 0;
pub const OF_VERIFY = 1024;
pub const FILE_NOTIFY_CHANGE_FILE_NAME = 1;
pub const FILE_NOTIFY_CHANGE_DIR_NAME = 2;
pub const FILE_NOTIFY_CHANGE_ATTRIBUTES = 4;
pub const FILE_NOTIFY_CHANGE_SIZE = 8;
pub const FILE_NOTIFY_CHANGE_LAST_WRITE = 16;
pub const FILE_NOTIFY_CHANGE_LAST_ACCESS = 32;
pub const FILE_NOTIFY_CHANGE_CREATION = 64;
pub const FILE_NOTIFY_CHANGE_SECURITY = 256;
pub const TXFS_MINIVERSION_COMMITTED_VIEW = 0;
pub const TXFS_MINIVERSION_DIRTY_VIEW = 65535;
pub const TXFS_MINIVERSION_DEFAULT_VIEW = 65534;
pub const TAPE_ABSOLUTE_POSITION = 0;
pub const TAPE_LOGICAL_POSITION = 1;
pub const TAPE_FIXED_PARTITIONS = 0;
pub const TAPE_INITIATOR_PARTITIONS = 2;
pub const TAPE_SELECT_PARTITIONS = 1;
pub const REPLACEFILE_WRITE_THROUGH = 1;
pub const REPLACEFILE_IGNORE_MERGE_ERRORS = 2;
pub const REPLACEFILE_IGNORE_ACL_ERRORS = 4;
pub const TAPE_FILEMARKS = 1;
pub const TAPE_LONG_FILEMARKS = 3;
pub const TAPE_SETMARKS = 0;
pub const TAPE_SHORT_FILEMARKS = 2;
pub const DISKQUOTA_USERNAME_RESOLVE_ASYNC = 2;
pub const DISKQUOTA_USERNAME_RESOLVE_NONE = 0;
pub const DISKQUOTA_USERNAME_RESOLVE_SYNC = 1;
pub const TAPE_ABSOLUTE_BLOCK = 1;
pub const TAPE_LOGICAL_BLOCK = 2;
pub const TAPE_REWIND = 0;
pub const TAPE_SPACE_END_OF_DATA = 4;
pub const TAPE_SPACE_FILEMARKS = 6;
pub const TAPE_SPACE_RELATIVE_BLOCKS = 5;
pub const TAPE_SPACE_SEQUENTIAL_FMKS = 7;
pub const TAPE_SPACE_SEQUENTIAL_SMKS = 9;
pub const TAPE_SPACE_SETMARKS = 8;
pub const SET_TAPE_DRIVE_INFORMATION = 1;
pub const SET_TAPE_MEDIA_INFORMATION = 0;
pub const NTMS_OMID_TYPE_FILESYSTEM_INFO = 2;
pub const NTMS_OMID_TYPE_RAW_LABEL = 1;
pub const LOCKFILE_EXCLUSIVE_LOCK = 2;
pub const LOCKFILE_FAIL_IMMEDIATELY = 1;
pub const CALLBACK_CHUNK_FINISHED = 0;
pub const CALLBACK_STREAM_SWITCH = 1;
pub const TAPE_FORMAT = 5;
pub const TAPE_LOAD = 0;
pub const TAPE_LOCK = 3;
pub const TAPE_TENSION = 2;
pub const TAPE_UNLOAD = 1;
pub const TAPE_UNLOCK = 4;
pub const GET_TAPE_DRIVE_INFORMATION = 1;
pub const GET_TAPE_MEDIA_INFORMATION = 0;
pub const TAPE_ERASE_LONG = 1;
pub const TAPE_ERASE_SHORT = 0;
pub const FILE_ACTION_ADDED = 1;
pub const FILE_ACTION_REMOVED = 2;
pub const FILE_ACTION_MODIFIED = 3;
pub const FILE_ACTION_RENAMED_OLD_NAME = 4;
pub const FILE_ACTION_RENAMED_NEW_NAME = 5;
pub const ACCESS_READ = 1;
pub const ACCESS_WRITE = 2;
pub const ACCESS_CREATE = 4;
pub const ACCESS_EXEC = 8;
pub const ACCESS_DELETE = 16;
pub const ACCESS_ATRIB = 32;
pub const ACCESS_PERM = 64;
pub const ACCESS_ALL = 32768;
pub const FILE_DEVICE_CD_ROM = 2;
pub const FILE_DEVICE_DISK = 7;
pub const FILE_DEVICE_TAPE = 31;
pub const FILE_DEVICE_DVD = 51;
pub const SESS_GUEST = 1;
pub const SESS_NOENCRYPTION = 2;
pub const BACKUP_ALTERNATE_DATA = 4;
pub const BACKUP_DATA = 1;
pub const BACKUP_EA_DATA = 2;
pub const BACKUP_LINK = 5;
pub const BACKUP_OBJECT_ID = 7;
pub const BACKUP_PROPERTY_DATA = 6;
pub const BACKUP_REPARSE_DATA = 8;
pub const BACKUP_SECURITY_DATA = 3;
pub const BACKUP_SPARSE_BLOCK = 9;
pub const BACKUP_TXFS_DATA = 10;
pub const TXF_LOG_RECORD_TYPE_AFFECTED_FILE = 4;
pub const TXF_LOG_RECORD_TYPE_TRUNCATE = 2;
pub const TXF_LOG_RECORD_TYPE_WRITE = 1;
pub const PERM_FILE_READ = 1;
pub const PERM_FILE_WRITE = 2;
pub const PERM_FILE_CREATE = 4;
pub const SYMBOLIC_LINK_FLAG_DIRECTORY = 1;
pub const SYMBOLIC_LINK_FLAG_ALLOW_UNPRIVILEGED_CREATE = 2;
pub const COMPRESSION_FORMAT_NONE = 0;
pub const COMPRESSION_FORMAT_DEFAULT = 1;
pub const COMPRESSION_FORMAT_LZNT1 = 2;
pub const COMPRESSION_FORMAT_XPRESS = 3;
pub const COMPRESSION_FORMAT_XPRESS_HUFF = 4;
pub const COMPRESSION_FORMAT_XP10 = 5;
pub const COMPRESSION_FORMAT_LZ4 = 6;
pub const COMPRESSION_FORMAT_DEFLATE = 7;
pub const COMPRESSION_FORMAT_ZLIB = 8;
pub const FILE_TYPE_UNKNOWN = 0;
pub const FILE_TYPE_DISK = 1;
pub const FILE_TYPE_CHAR = 2;
pub const FILE_TYPE_PIPE = 3;
pub const FILE_TYPE_REMOTE = 32768;
pub const FILE_DISPOSITION_FLAG_DO_NOT_DELETE = 0;
pub const FILE_DISPOSITION_FLAG_DELETE = 1;
pub const FILE_DISPOSITION_FLAG_POSIX_SEMANTICS = 2;
pub const FILE_DISPOSITION_FLAG_FORCE_IMAGE_SECTION_CHECK = 4;
pub const FILE_DISPOSITION_FLAG_ON_CLOSE = 8;
pub const FILE_DISPOSITION_FLAG_IGNORE_READONLY_ATTRIBUTE = 16;
pub const COPY_FILE_FAIL_IF_EXISTS = 1;
pub const COPY_FILE_RESTARTABLE = 2;
pub const COPY_FILE_OPEN_SOURCE_FOR_WRITE = 4;
pub const COPY_FILE_ALLOW_DECRYPTED_DESTINATION = 8;
pub const COPY_FILE_COPY_SYMLINK = 2048;
pub const COPY_FILE_NO_BUFFERING = 4096;
pub const COPY_FILE_REQUEST_SECURITY_PRIVILEGES = 8192;
pub const COPY_FILE_RESUME_FROM_PAUSE = 16384;
pub const COPY_FILE_NO_OFFLOAD = 262144;
pub const COPY_FILE_IGNORE_EDP_BLOCK = 4194304;
pub const COPY_FILE_IGNORE_SOURCE_ENCRYPTION = 8388608;
pub const COPY_FILE_DONT_REQUEST_DEST_WRITE_DAC = 33554432;
pub const COPY_FILE_REQUEST_COMPRESSED_TRAFFIC = 268435456;
pub const COPY_FILE_OPEN_AND_COPY_REPARSE_POINT = 2097152;
pub const COPY_FILE_DIRECTORY = 128;
pub const COPY_FILE_SKIP_ALTERNATE_STREAMS = 32768;
pub const COPY_FILE_DISABLE_PRE_ALLOCATION = 67108864;
pub const COPY_FILE_ENABLE_LOW_FREE_SPACE_MODE = 134217728;
pub const COPY_FILE_ENABLE_SPARSE_COPY = 536870912;
pub const COPY_FILE_DISABLE_SPARSE_COPY = 2147483648;
pub const COPY_FILE2_V2_DONT_COPY_JUNCTIONS = 1;
pub const COPY_FILE2_V2_DISABLE_BLOCK_CLONING = 2;
pub const COPY_FILE2_V2_VALID_FLAGS = 3;
pub const PROGRESS_CONTINUE = 0;
pub const PROGRESS_CANCEL = 1;
pub const PROGRESS_STOP = 2;
pub const PROGRESS_QUIET = 3;
pub const FindExInfoStandard = 0;
pub const FindExInfoBasic = 1;
pub const FindExInfoMaxInfoLevel = 2;
pub const FindExSearchNameMatch = 0;
pub const FindExSearchLimitToDirectories = 1;
pub const FindExSearchLimitToDevices = 2;
pub const FindExSearchMaxSearchOp = 3;
pub const ReadDirectoryNotifyInformation = 1;
pub const ReadDirectoryNotifyExtendedInformation = 2;
pub const ReadDirectoryNotifyFullInformation = 3;
pub const ReadDirectoryNotifyMaximumInformation = 4;
pub const GetFileExInfoStandard = 0;
pub const GetFileExMaxInfoLevel = 1;
pub const FileBasicInfo = 0;
pub const FileStandardInfo = 1;
pub const FileNameInfo = 2;
pub const FileRenameInfo = 3;
pub const FileDispositionInfo = 4;
pub const FileAllocationInfo = 5;
pub const FileEndOfFileInfo = 6;
pub const FileStreamInfo = 7;
pub const FileCompressionInfo = 8;
pub const FileAttributeTagInfo = 9;
pub const FileIdBothDirectoryInfo = 10;
pub const FileIdBothDirectoryRestartInfo = 11;
pub const FileIoPriorityHintInfo = 12;
pub const FileRemoteProtocolInfo = 13;
pub const FileFullDirectoryInfo = 14;
pub const FileFullDirectoryRestartInfo = 15;
pub const FileStorageInfo = 16;
pub const FileAlignmentInfo = 17;
pub const FileIdInfo = 18;
pub const FileIdExtdDirectoryInfo = 19;
pub const FileIdExtdDirectoryRestartInfo = 20;
pub const FileDispositionInfoEx = 21;
pub const FileRenameInfoEx = 22;
pub const FileCaseSensitiveInfo = 23;
pub const FileNormalizedNameInfo = 24;
pub const MaximumFileInfoByHandleClass = 25;
pub const FileStatByNameInfo = 0;
pub const FileStatLxByNameInfo = 1;
pub const FileCaseSensitiveByNameInfo = 2;
pub const FileStatBasicByNameInfo = 3;
pub const MaximumFileInfoByNameClass = 4;
pub const FindStreamInfoStandard = 0;
pub const FindStreamInfoMaxInfoLevel = 1;
pub const DIRECTORY_FLAGS_NONE = 0;
pub const DIRECTORY_FLAGS_DISALLOW_PATH_REDIRECTS = 1;
pub const NTMS_UNKNOWN = 0;
pub const NTMS_OBJECT = 1;
pub const NTMS_CHANGER = 2;
pub const NTMS_CHANGER_TYPE = 3;
pub const NTMS_COMPUTER = 4;
pub const NTMS_DRIVE = 5;
pub const NTMS_DRIVE_TYPE = 6;
pub const NTMS_IEDOOR = 7;
pub const NTMS_IEPORT = 8;
pub const NTMS_LIBRARY = 9;
pub const NTMS_LIBREQUEST = 10;
pub const NTMS_LOGICAL_MEDIA = 11;
pub const NTMS_MEDIA_POOL = 12;
pub const NTMS_MEDIA_TYPE = 13;
pub const NTMS_PARTITION = 14;
pub const NTMS_PHYSICAL_MEDIA = 15;
pub const NTMS_STORAGESLOT = 16;
pub const NTMS_OPREQUEST = 17;
pub const NTMS_UI_DESTINATION = 18;
pub const NTMS_NUMBER_OF_OBJECT_TYPES = 19;
pub const NTMS_ASYNCSTATE_QUEUED = 0;
pub const NTMS_ASYNCSTATE_WAIT_RESOURCE = 1;
pub const NTMS_ASYNCSTATE_WAIT_OPERATOR = 2;
pub const NTMS_ASYNCSTATE_INPROCESS = 3;
pub const NTMS_ASYNCSTATE_COMPLETE = 4;
pub const NTMS_ASYNCOP_MOUNT = 1;
pub const NTMS_SESSION_QUERYEXPEDITE = 1;
pub const NTMS_MOUNT_READ = 1;
pub const NTMS_MOUNT_WRITE = 2;
pub const NTMS_MOUNT_ERROR_NOT_AVAILABLE = 4;
pub const NTMS_MOUNT_ERROR_IF_UNAVAILABLE = 4;
pub const NTMS_MOUNT_ERROR_OFFLINE = 8;
pub const NTMS_MOUNT_ERROR_IF_OFFLINE = 8;
pub const NTMS_MOUNT_SPECIFIC_DRIVE = 16;
pub const NTMS_MOUNT_NOWAIT = 32;
pub const NTMS_DISMOUNT_DEFERRED = 1;
pub const NTMS_DISMOUNT_IMMEDIATE = 2;
pub const NTMS_PRIORITY_DEFAULT = 0;
pub const NTMS_PRIORITY_HIGHEST = 15;
pub const NTMS_PRIORITY_HIGH = 7;
pub const NTMS_PRIORITY_NORMAL = 0;
pub const NTMS_PRIORITY_LOW = -7;
pub const NTMS_PRIORITY_LOWEST = -15;
pub const NTMS_ALLOCATE_NEW = 1;
pub const NTMS_ALLOCATE_NEXT = 2;
pub const NTMS_ALLOCATE_ERROR_IF_UNAVAILABLE = 4;
pub const NTMS_OPEN_EXISTING = 1;
pub const NTMS_CREATE_NEW = 2;
pub const NTMS_OPEN_ALWAYS = 3;
pub const NTMS_DRIVESTATE_DISMOUNTED = 0;
pub const NTMS_DRIVESTATE_MOUNTED = 1;
pub const NTMS_DRIVESTATE_LOADED = 2;
pub const NTMS_DRIVESTATE_UNLOADED = 5;
pub const NTMS_DRIVESTATE_BEING_CLEANED = 6;
pub const NTMS_DRIVESTATE_DISMOUNTABLE = 7;
pub const NTMS_LIBRARYTYPE_UNKNOWN = 0;
pub const NTMS_LIBRARYTYPE_OFFLINE = 1;
pub const NTMS_LIBRARYTYPE_ONLINE = 2;
pub const NTMS_LIBRARYTYPE_STANDALONE = 3;
pub const NTMS_LIBRARYFLAG_FIXEDOFFLINE = 1;
pub const NTMS_LIBRARYFLAG_CLEANERPRESENT = 2;
pub const NTMS_LIBRARYFLAG_AUTODETECTCHANGE = 4;
pub const NTMS_LIBRARYFLAG_IGNORECLEANERUSESREMAINING = 8;
pub const NTMS_LIBRARYFLAG_RECOGNIZECLEANERBARCODE = 16;
pub const NTMS_INVENTORY_NONE = 0;
pub const NTMS_INVENTORY_FAST = 1;
pub const NTMS_INVENTORY_OMID = 2;
pub const NTMS_INVENTORY_DEFAULT = 3;
pub const NTMS_INVENTORY_SLOT = 4;
pub const NTMS_INVENTORY_STOP = 5;
pub const NTMS_INVENTORY_MAX = 6;
pub const NTMS_SLOTSTATE_UNKNOWN = 0;
pub const NTMS_SLOTSTATE_FULL = 1;
pub const NTMS_SLOTSTATE_EMPTY = 2;
pub const NTMS_SLOTSTATE_NOTPRESENT = 3;
pub const NTMS_SLOTSTATE_NEEDSINVENTORY = 4;
pub const NTMS_DOORSTATE_UNKNOWN = 0;
pub const NTMS_DOORSTATE_CLOSED = 1;
pub const NTMS_DOORSTATE_OPEN = 2;
pub const NTMS_PORTPOSITION_UNKNOWN = 0;
pub const NTMS_PORTPOSITION_EXTENDED = 1;
pub const NTMS_PORTPOSITION_RETRACTED = 2;
pub const NTMS_PORTCONTENT_UNKNOWN = 0;
pub const NTMS_PORTCONTENT_FULL = 1;
pub const NTMS_PORTCONTENT_EMPTY = 2;
pub const NTMS_BARCODESTATE_OK = 1;
pub const NTMS_BARCODESTATE_UNREADABLE = 2;
pub const NTMS_MEDIASTATE_IDLE = 0;
pub const NTMS_MEDIASTATE_INUSE = 1;
pub const NTMS_MEDIASTATE_MOUNTED = 2;
pub const NTMS_MEDIASTATE_LOADED = 3;
pub const NTMS_MEDIASTATE_UNLOADED = 4;
pub const NTMS_MEDIASTATE_OPERROR = 5;
pub const NTMS_MEDIASTATE_OPREQ = 6;
pub const NTMS_PARTSTATE_UNKNOWN = 0;
pub const NTMS_PARTSTATE_UNPREPARED = 1;
pub const NTMS_PARTSTATE_INCOMPATIBLE = 2;
pub const NTMS_PARTSTATE_DECOMMISSIONED = 3;
pub const NTMS_PARTSTATE_AVAILABLE = 4;
pub const NTMS_PARTSTATE_ALLOCATED = 5;
pub const NTMS_PARTSTATE_COMPLETE = 6;
pub const NTMS_PARTSTATE_FOREIGN = 7;
pub const NTMS_PARTSTATE_IMPORT = 8;
pub const NTMS_PARTSTATE_RESERVED = 9;
pub const NTMS_POOLTYPE_UNKNOWN = 0;
pub const NTMS_POOLTYPE_SCRATCH = 1;
pub const NTMS_POOLTYPE_FOREIGN = 2;
pub const NTMS_POOLTYPE_IMPORT = 3;
pub const NTMS_POOLTYPE_APPLICATION = 1000;
pub const NTMS_ALLOCATE_FROMSCRATCH = 1;
pub const NTMS_DEALLOCATE_TOSCRATCH = 1;
pub const NTMS_MEDIARW_UNKNOWN = 0;
pub const NTMS_MEDIARW_REWRITABLE = 1;
pub const NTMS_MEDIARW_WRITEONCE = 2;
pub const NTMS_MEDIARW_READONLY = 3;
pub const NTMS_LM_REMOVE = 0;
pub const NTMS_LM_DISABLECHANGER = 1;
pub const NTMS_LM_DISABLELIBRARY = 1;
pub const NTMS_LM_ENABLECHANGER = 2;
pub const NTMS_LM_ENABLELIBRARY = 2;
pub const NTMS_LM_DISABLEDRIVE = 3;
pub const NTMS_LM_ENABLEDRIVE = 4;
pub const NTMS_LM_DISABLEMEDIA = 5;
pub const NTMS_LM_ENABLEMEDIA = 6;
pub const NTMS_LM_UPDATEOMID = 7;
pub const NTMS_LM_INVENTORY = 8;
pub const NTMS_LM_DOORACCESS = 9;
pub const NTMS_LM_EJECT = 10;
pub const NTMS_LM_EJECTCLEANER = 11;
pub const NTMS_LM_INJECT = 12;
pub const NTMS_LM_INJECTCLEANER = 13;
pub const NTMS_LM_PROCESSOMID = 14;
pub const NTMS_LM_CLEANDRIVE = 15;
pub const NTMS_LM_DISMOUNT = 16;
pub const NTMS_LM_MOUNT = 17;
pub const NTMS_LM_WRITESCRATCH = 18;
pub const NTMS_LM_CLASSIFY = 19;
pub const NTMS_LM_RESERVECLEANER = 20;
pub const NTMS_LM_RELEASECLEANER = 21;
pub const NTMS_LM_MAXWORKITEM = 22;
pub const NTMS_LM_QUEUED = 0;
pub const NTMS_LM_INPROCESS = 1;
pub const NTMS_LM_PASSED = 2;
pub const NTMS_LM_FAILED = 3;
pub const NTMS_LM_INVALID = 4;
pub const NTMS_LM_WAITING = 5;
pub const NTMS_LM_DEFERRED = 6;
pub const NTMS_LM_DEFFERED = 6;
pub const NTMS_LM_CANCELLED = 7;
pub const NTMS_LM_STOPPED = 8;
pub const NTMS_OPREQ_UNKNOWN = 0;
pub const NTMS_OPREQ_NEWMEDIA = 1;
pub const NTMS_OPREQ_CLEANER = 2;
pub const NTMS_OPREQ_DEVICESERVICE = 3;
pub const NTMS_OPREQ_MOVEMEDIA = 4;
pub const NTMS_OPREQ_MESSAGE = 5;
pub const NTMS_OPSTATE_UNKNOWN = 0;
pub const NTMS_OPSTATE_SUBMITTED = 1;
pub const NTMS_OPSTATE_ACTIVE = 2;
pub const NTMS_OPSTATE_INPROGRESS = 3;
pub const NTMS_OPSTATE_REFUSED = 4;
pub const NTMS_OPSTATE_COMPLETE = 5;
pub const NTMS_LIBREQFLAGS_NOAUTOPURGE = 1;
pub const NTMS_LIBREQFLAGS_NOFAILEDPURGE = 2;
pub const NTMS_OPREQFLAGS_NOAUTOPURGE = 1;
pub const NTMS_OPREQFLAGS_NOFAILEDPURGE = 2;
pub const NTMS_OPREQFLAGS_NOALERTS = 16;
pub const NTMS_OPREQFLAGS_NOTRAYICON = 32;
pub const NTMS_POOLPOLICY_PURGEOFFLINESCRATCH = 1;
pub const NTMS_POOLPOLICY_KEEPOFFLINEIMPORT = 2;
pub const NTMS_READY = 0;
pub const NTMS_INITIALIZING = 10;
pub const NTMS_NEEDS_SERVICE = 20;
pub const NTMS_NOT_PRESENT = 21;
pub const NTMS_ERROR_ON_DUPLICATE = 1;
pub const NTMS_ENUM_DEFAULT = 0;
pub const NTMS_ENUM_ROOTPOOL = 1;
pub const NTMS_EJECT_START = 0;
pub const NTMS_EJECT_STOP = 1;
pub const NTMS_EJECT_QUEUE = 2;
pub const NTMS_EJECT_FORCE = 3;
pub const NTMS_EJECT_IMMEDIATE = 4;
pub const NTMS_EJECT_ASK_USER = 5;
pub const NTMS_INJECT_START = 0;
pub const NTMS_INJECT_STOP = 1;
pub const NTMS_INJECT_RETRACT = 2;
pub const NTMS_INJECT_STARTMANY = 3;
pub const NTMS_UNKNOWN_DRIVE = 0;
pub const NTMS_USE_ACCESS = 1;
pub const NTMS_MODIFY_ACCESS = 2;
pub const NTMS_CONTROL_ACCESS = 4;
pub const NTMS_UITYPE_INVALID = 0;
pub const NTMS_UITYPE_INFO = 1;
pub const NTMS_UITYPE_REQ = 2;
pub const NTMS_UITYPE_ERR = 3;
pub const NTMS_UITYPE_MAX = 4;
pub const NTMS_UIDEST_ADD = 1;
pub const NTMS_UIDEST_DELETE = 2;
pub const NTMS_UIDEST_DELETEALL = 3;
pub const NTMS_UIOPERATION_MAX = 4;
pub const NTMS_OBJ_UPDATE = 1;
pub const NTMS_OBJ_INSERT = 2;
pub const NTMS_OBJ_DELETE = 3;
pub const NTMS_EVENT_SIGNAL = 4;
pub const NTMS_EVENT_COMPLETE = 5;
pub const ClsContextNone = 0;
pub const ClsContextUndoNext = 1;
pub const ClsContextPrevious = 2;
pub const ClsContextForward = 3;
pub const ClfsContextNone = 0;
pub const ClfsContextUndoNext = 1;
pub const ClfsContextPrevious = 2;
pub const ClfsContextForward = 3;
pub const ClfsLogBasicInformation = 0;
pub const ClfsLogBasicInformationPhysical = 1;
pub const ClfsLogPhysicalNameInformation = 2;
pub const ClfsLogStreamIdentifierInformation = 3;
pub const ClfsLogSystemMarkingInformation = 4;
pub const ClfsLogPhysicalLsnInformation = 5;
pub const ClsIoStatsDefault = 0;
pub const ClsIoStatsMax = 65535;
pub const ClfsIoStatsDefault = 0;
pub const ClfsIoStatsMax = 65535;
pub const ClfsLogArchiveEnabled = 1;
pub const ClfsLogArchiveDisabled = 2;
pub const ClfsMgmtPolicyMaximumSize = 0;
pub const ClfsMgmtPolicyMinimumSize = 1;
pub const ClfsMgmtPolicyNewContainerSize = 2;
pub const ClfsMgmtPolicyGrowthRate = 3;
pub const ClfsMgmtPolicyLogTail = 4;
pub const ClfsMgmtPolicyAutoShrink = 5;
pub const ClfsMgmtPolicyAutoGrow = 6;
pub const ClfsMgmtPolicyNewContainerPrefix = 7;
pub const ClfsMgmtPolicyNewContainerSuffix = 8;
pub const ClfsMgmtPolicyNewContainerExtension = 9;
pub const ClfsMgmtPolicyInvalid = 10;
pub const ClfsMgmtAdvanceTailNotification = 0;
pub const ClfsMgmtLogFullHandlerNotification = 1;
pub const ClfsMgmtLogUnpinnedNotification = 2;
pub const ClfsMgmtLogWriteNotification = 3;
pub const IORING_VERSION_INVALID = 0;
pub const IORING_VERSION_1 = 1;
pub const IORING_VERSION_2 = 2;
pub const IORING_VERSION_3 = 300;
pub const IORING_VERSION_4 = 400;
pub const IORING_FEATURE_FLAGS_NONE = 0;
pub const IORING_FEATURE_UM_EMULATION = 1;
pub const IORING_FEATURE_SET_COMPLETION_EVENT = 2;
pub const IORING_OP_NOP = 0;
pub const IORING_OP_READ = 1;
pub const IORING_OP_REGISTER_FILES = 2;
pub const IORING_OP_REGISTER_BUFFERS = 3;
pub const IORING_OP_CANCEL = 4;
pub const IORING_OP_WRITE = 5;
pub const IORING_OP_FLUSH = 6;
pub const IORING_OP_READ_SCATTER = 7;
pub const IORING_OP_WRITE_GATHER = 8;
pub const IOSQE_FLAGS_NONE = 0;
pub const IOSQE_FLAGS_DRAIN_PRECEDING_OPS = 1;
pub const IORING_CREATE_REQUIRED_FLAGS_NONE = 0;
pub const IORING_CREATE_ADVISORY_FLAGS_NONE = 0;
pub const IORING_CREATE_SKIP_BUILDER_PARAM_CHECKS = 1;
pub const IORING_REF_RAW = 0;
pub const IORING_REF_REGISTERED = 1;
pub const CREATE_BIND_LINK_FLAG_NONE = 0;
pub const CREATE_BIND_LINK_FLAG_READ_ONLY = 1;
pub const CREATE_BIND_LINK_FLAG_MERGED = 2;
pub const TransactionOutcomeUndetermined = 1;
pub const TransactionOutcomeCommitted = 2;
pub const TransactionOutcomeAborted = 3;
pub const BusTypeUnknown = 0;
pub const BusTypeScsi = 1;
pub const BusTypeAtapi = 2;
pub const BusTypeAta = 3;
pub const BusType1394 = 4;
pub const BusTypeSsa = 5;
pub const BusTypeFibre = 6;
pub const BusTypeUsb = 7;
pub const BusTypeRAID = 8;
pub const BusTypeiScsi = 9;
pub const BusTypeSas = 10;
pub const BusTypeSata = 11;
pub const BusTypeSd = 12;
pub const BusTypeMmc = 13;
pub const BusTypeVirtual = 14;
pub const BusTypeFileBackedVirtual = 15;
pub const BusTypeSpaces = 16;
pub const BusTypeNvme = 17;
pub const BusTypeSCM = 18;
pub const BusTypeUfs = 19;
pub const BusTypeNvmeof = 20;
pub const BusTypeMax = 21;
pub const BusTypeMaxReserved = 127;
pub const FILE_WRITE_FLAGS_NONE = 0;
pub const FILE_WRITE_FLAGS_WRITE_THROUGH = 1;
pub const FILE_FLUSH_DEFAULT = 0;
pub const FILE_FLUSH_DATA = 1;
pub const FILE_FLUSH_MIN_METADATA = 2;
pub const FILE_FLUSH_NO_SYNC = 3;
pub const COPYFILE2_CALLBACK_NONE = 0;
pub const COPYFILE2_CALLBACK_CHUNK_STARTED = 1;
pub const COPYFILE2_CALLBACK_CHUNK_FINISHED = 2;
pub const COPYFILE2_CALLBACK_STREAM_STARTED = 3;
pub const COPYFILE2_CALLBACK_STREAM_FINISHED = 4;
pub const COPYFILE2_CALLBACK_POLL_CONTINUE = 5;
pub const COPYFILE2_CALLBACK_ERROR = 6;
pub const COPYFILE2_CALLBACK_MAX = 7;
pub const COPYFILE2_PROGRESS_CONTINUE = 0;
pub const COPYFILE2_PROGRESS_CANCEL = 1;
pub const COPYFILE2_PROGRESS_STOP = 2;
pub const COPYFILE2_PROGRESS_QUIET = 3;
pub const COPYFILE2_PROGRESS_PAUSE = 4;
pub const COPYFILE2_PHASE_NONE = 0;
pub const COPYFILE2_PHASE_PREPARE_SOURCE = 1;
pub const COPYFILE2_PHASE_PREPARE_DEST = 2;
pub const COPYFILE2_PHASE_READ_SOURCE = 3;
pub const COPYFILE2_PHASE_WRITE_DESTINATION = 4;
pub const COPYFILE2_PHASE_SERVER_COPY = 5;
pub const COPYFILE2_PHASE_NAMEGRAFT_COPY = 6;
pub const COPYFILE2_PHASE_MAX = 7;
pub const IoPriorityHintVeryLow = 0;
pub const IoPriorityHintLow = 1;
pub const IoPriorityHintNormal = 2;
pub const MaximumIoPriorityHintType = 3;
pub const FileIdType = 0;
pub const ObjectIdType = 1;
pub const ExtendedFileIdType = 2;
pub const MaximumFileIdType = 3;

pub const aliases = struct {
    pub const FIND_FIRST_EX_FLAGS = u32;
    pub const DEFINE_DOS_DEVICE_FLAGS = u32;
    pub const FILE_FLAGS_AND_ATTRIBUTES = u32;
    pub const FILE_ACCESS_RIGHTS = u32;
    pub const GET_FILE_VERSION_INFO_FLAGS = u32;
    pub const VER_FIND_FILE_FLAGS = u32;
    pub const VER_FIND_FILE_STATUS = u32;
    pub const VER_INSTALL_FILE_FLAGS = u32;
    pub const VER_INSTALL_FILE_STATUS = u32;
    pub const VS_FIXEDFILEINFO_FILE_FLAGS = u32;
    pub const VS_FIXEDFILEINFO_FILE_OS = u32;
    pub const VS_FIXEDFILEINFO_FILE_TYPE = i32;
    pub const VS_FIXEDFILEINFO_FILE_SUBTYPE = i32;
    pub const FILE_CREATION_DISPOSITION = u32;
    pub const FILE_SHARE_MODE = u32;
    pub const SHARE_TYPE = u32;
    pub const CLFS_FLAG = u32;
    pub const SET_FILE_POINTER_MOVE_METHOD = u32;
    pub const MOVE_FILE_FLAGS = u32;
    pub const GETFINALPATHNAMEBYHANDLE_FLAGS = u32;
    pub const LZOPENFILE_STYLE = u16;
    pub const FILE_NOTIFY_CHANGE = u32;
    pub const TXFS_MINIVERSION = u32;
    pub const TAPE_POSITION_TYPE = u32;
    pub const CREATE_TAPE_PARTITION_METHOD = u32;
    pub const REPLACE_FILE_FLAGS = u32;
    pub const TAPEMARK_TYPE = u32;
    pub const DISKQUOTA_USERNAME_RESOLVE = u32;
    pub const TAPE_POSITION_METHOD = u32;
    pub const TAPE_INFORMATION_TYPE = u32;
    pub const NTMS_OMID_TYPE = u32;
    pub const LOCK_FILE_FLAGS = u32;
    pub const LPPROGRESS_ROUTINE_CALLBACK_REASON = u32;
    pub const PREPARE_TAPE_OPERATION = u32;
    pub const GET_TAPE_DRIVE_PARAMETERS_OPERATION = u32;
    pub const ERASE_TAPE_TYPE = u32;
    pub const FILE_ACTION = u32;
    pub const SHARE_INFO_PERMISSIONS = u32;
    pub const FILE_DEVICE_TYPE = u32;
    pub const SESSION_INFO_USER_FLAGS = u32;
    pub const WIN_STREAM_ID = u32;
    pub const TXF_LOG_RECORD_TYPE = u16;
    pub const FILE_INFO_FLAGS_PERMISSIONS = u32;
    pub const SYMBOLIC_LINK_FLAGS = u32;
    pub const COMPRESSION_FORMAT = u16;
    pub const FILE_TYPE = u32;
    pub const FILE_DISPOSITION_INFO_EX_FLAGS = u32;
    pub const COPYFILE_FLAGS = u32;
    pub const COPYFILE2_V2_FLAGS = u32;
    pub const COPYPROGRESSROUTINE_PROGRESS = u32;
    pub const FINDEX_INFO_LEVELS = i32;
    pub const FINDEX_SEARCH_OPS = i32;
    pub const READ_DIRECTORY_NOTIFY_INFORMATION_CLASS = i32;
    pub const GET_FILEEX_INFO_LEVELS = i32;
    pub const FILE_INFO_BY_HANDLE_CLASS = i32;
    pub const FILE_INFO_BY_NAME_CLASS = i32;
    pub const STREAM_INFO_LEVELS = i32;
    pub const DIRECTORY_FLAGS = i32;
    pub const NtmsObjectsTypes = i32;
    pub const NtmsAsyncStatus = i32;
    pub const NtmsAsyncOperations = i32;
    pub const NtmsSessionOptions = i32;
    pub const NtmsMountOptions = i32;
    pub const NtmsDismountOptions = i32;
    pub const NtmsMountPriority = i32;
    pub const NtmsAllocateOptions = i32;
    pub const NtmsCreateOptions = i32;
    pub const NtmsDriveState = i32;
    pub const NtmsLibraryType = i32;
    pub const NtmsLibraryFlags = i32;
    pub const NtmsInventoryMethod = i32;
    pub const NtmsSlotState = i32;
    pub const NtmsDoorState = i32;
    pub const NtmsPortPosition = i32;
    pub const NtmsPortContent = i32;
    pub const NtmsBarCodeState = i32;
    pub const NtmsMediaState = i32;
    pub const NtmsPartitionState = i32;
    pub const NtmsPoolType = i32;
    pub const NtmsAllocationPolicy = i32;
    pub const NtmsDeallocationPolicy = i32;
    pub const NtmsReadWriteCharacteristics = i32;
    pub const NtmsLmOperation = i32;
    pub const NtmsLmState = i32;
    pub const NtmsOpreqCommand = i32;
    pub const NtmsOpreqState = i32;
    pub const NtmsLibRequestFlags = i32;
    pub const NtmsOpRequestFlags = i32;
    pub const NtmsMediaPoolPolicy = i32;
    pub const NtmsOperationalState = i32;
    pub const NtmsCreateNtmsMediaOptions = i32;
    pub const NtmsEnumerateOption = i32;
    pub const NtmsEjectOperation = i32;
    pub const NtmsInjectOperation = i32;
    pub const NtmsDriveType = i32;
    pub const NtmsAccessMask = i32;
    pub const NtmsUITypes = i32;
    pub const NtmsUIOperations = i32;
    pub const NtmsNotificationOperations = i32;
    pub const CLS_CONTEXT_MODE = i32;
    pub const CLFS_CONTEXT_MODE = i32;
    pub const CLS_LOG_INFORMATION_CLASS = i32;
    pub const CLS_IOSTATS_CLASS = i32;
    pub const CLFS_IOSTATS_CLASS = i32;
    pub const CLFS_LOG_ARCHIVE_MODE = i32;
    pub const CLFS_MGMT_POLICY_TYPE = i32;
    pub const CLFS_MGMT_NOTIFICATION_TYPE = i32;
    pub const IORING_VERSION = i32;
    pub const IORING_FEATURE_FLAGS = i32;
    pub const IORING_OP_CODE = i32;
    pub const IORING_SQE_FLAGS = i32;
    pub const IORING_CREATE_REQUIRED_FLAGS = i32;
    pub const IORING_CREATE_ADVISORY_FLAGS = i32;
    pub const IORING_REF_KIND = i32;
    pub const CREATE_BIND_LINK_FLAGS = i32;
    pub const TRANSACTION_OUTCOME = i32;
    pub const STORAGE_BUS_TYPE = i32;
    pub const FILE_WRITE_FLAGS = i32;
    pub const FILE_FLUSH_MODE = i32;
    pub const COPYFILE2_MESSAGE_TYPE = i32;
    pub const COPYFILE2_MESSAGE_ACTION = i32;
    pub const COPYFILE2_COPY_PHASE = i32;
    pub const PRIORITY_HINT = i32;
    pub const FILE_ID_TYPE = i32;
    pub const HIORING = ?*anyopaque;
    pub const MAXMEDIALABEL = ?*const anyopaque;
    pub const CLAIMMEDIALABEL = ?*const anyopaque;
    pub const CLAIMMEDIALABELEX = ?*const anyopaque;
    pub const CLFS_BLOCK_ALLOCATION = ?*const anyopaque;
    pub const CLFS_BLOCK_DEALLOCATION = ?*const anyopaque;
    pub const PCLFS_COMPLETION_ROUTINE = ?*const anyopaque;
    pub const PLOG_TAIL_ADVANCE_CALLBACK = ?*const anyopaque;
    pub const PLOG_FULL_HANDLER_CALLBACK = ?*const anyopaque;
    pub const PLOG_UNPINNED_CALLBACK = ?*const anyopaque;
    pub const WofEnumEntryProc = ?*const anyopaque;
    pub const WofEnumFilesProc = ?*const anyopaque;
    pub const PFN_IO_COMPLETION = ?*const anyopaque;
    pub const FCACHE_CREATE_CALLBACK = ?*const anyopaque;
    pub const FCACHE_RICHCREATE_CALLBACK = ?*const anyopaque;
    pub const CACHE_KEY_COMPARE = ?*const anyopaque;
    pub const CACHE_KEY_HASH = ?*const anyopaque;
    pub const CACHE_READ_CALLBACK = ?*const anyopaque;
    pub const CACHE_DESTROY_CALLBACK = ?*const anyopaque;
    pub const CACHE_ACCESS_CHECK = ?*const anyopaque;
    pub const PFE_EXPORT_FUNC = ?*const anyopaque;
    pub const PFE_IMPORT_FUNC = ?*const anyopaque;
    pub const LPPROGRESS_ROUTINE = ?*const anyopaque;
    pub const PCOPYFILE2_PROGRESS_ROUTINE = ?*const anyopaque;
};
