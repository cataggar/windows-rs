//! Phase 4 comptime-projection benchmark.
//!
//! Compiles win_sys.project(...) at several filter sizes so devs can
//! Measure-Command { zig build bench } (or zig build bench --time-report)
//! to watch comptime cost scale.
//!
//! Each top-level const is an independent projection -- the Zig
//! compiler evaluates project() once per binding. Sizes 10 / 50 / 100
//! give a rough linear-vs-super-linear picture.
//!
//! All names are pulled from Windows.Win32.Storage.FileSystem (424
//! exported methods, the largest single-namespace surface in the
//! generated index). A few methods that need function-pointer typedef
//! aliases (ReadFileEx / WriteFileEx / ReadFileScatter / WriteFileGather
//! -- LPOVERLAPPED_COMPLETION_ROUTINE) and CreateFile3 (not in kernel32
//! on older Windows) are omitted.
//!
//! Windows-host-only: each projected field is an @extern against
//! KERNEL32, which the linker needs to satisfy with a real import lib.

const std = @import("std");
const win_sys = @import("win-sys");

pub const bench_10 = win_sys.project(.{
    .@"Windows.Win32.Storage.FileSystem" = .{ "SearchPathW", "SearchPathA", "CompareFileTime", "CreateDirectoryA", "CreateDirectoryW", "CreateFileA", "CreateFileW", "DefineDosDeviceW", "DeleteFileA", "DeleteFileW" },
});

pub const bench_50 = win_sys.project(.{
    .@"Windows.Win32.Storage.FileSystem" = .{ "SearchPathW", "SearchPathA", "CompareFileTime", "CreateDirectoryA", "CreateDirectoryW", "CreateFileA", "CreateFileW", "DefineDosDeviceW", "DeleteFileA", "DeleteFileW", "DeleteVolumeMountPointW", "FileTimeToLocalFileTime", "FindClose", "FindCloseChangeNotification", "FindFirstChangeNotificationA", "FindFirstChangeNotificationW", "FindFirstFileA", "FindFirstFileW", "FindFirstFileExA", "FindFirstFileExW", "FindFirstVolumeW", "FindNextChangeNotification", "FindNextFileA", "FindNextFileW", "FindNextVolumeW", "FindVolumeClose", "FlushFileBuffers", "GetDiskFreeSpaceA", "GetDiskFreeSpaceW", "GetDiskFreeSpaceExA", "GetDiskFreeSpaceExW", "GetDiskSpaceInformationA", "GetDiskSpaceInformationW", "GetDriveTypeA", "GetDriveTypeW", "GetFileAttributesA", "GetFileAttributesW", "GetFileAttributesExA", "GetFileAttributesExW", "GetFileInformationByHandle", "GetFileSize", "GetFileSizeEx", "GetFileType", "GetFinalPathNameByHandleA", "GetFinalPathNameByHandleW", "GetFileTime", "GetFullPathNameW", "GetFullPathNameA", "GetLogicalDrives", "GetLogicalDriveStringsW" },
});

pub const bench_100 = win_sys.project(.{
    .@"Windows.Win32.Storage.FileSystem" = .{ "SearchPathW", "SearchPathA", "CompareFileTime", "CreateDirectoryA", "CreateDirectoryW", "CreateFileA", "CreateFileW", "DefineDosDeviceW", "DeleteFileA", "DeleteFileW", "DeleteVolumeMountPointW", "FileTimeToLocalFileTime", "FindClose", "FindCloseChangeNotification", "FindFirstChangeNotificationA", "FindFirstChangeNotificationW", "FindFirstFileA", "FindFirstFileW", "FindFirstFileExA", "FindFirstFileExW", "FindFirstVolumeW", "FindNextChangeNotification", "FindNextFileA", "FindNextFileW", "FindNextVolumeW", "FindVolumeClose", "FlushFileBuffers", "GetDiskFreeSpaceA", "GetDiskFreeSpaceW", "GetDiskFreeSpaceExA", "GetDiskFreeSpaceExW", "GetDiskSpaceInformationA", "GetDiskSpaceInformationW", "GetDriveTypeA", "GetDriveTypeW", "GetFileAttributesA", "GetFileAttributesW", "GetFileAttributesExA", "GetFileAttributesExW", "GetFileInformationByHandle", "GetFileSize", "GetFileSizeEx", "GetFileType", "GetFinalPathNameByHandleA", "GetFinalPathNameByHandleW", "GetFileTime", "GetFullPathNameW", "GetFullPathNameA", "GetLogicalDrives", "GetLogicalDriveStringsW", "GetLongPathNameA", "GetLongPathNameW", "AreShortNamesEnabled", "GetShortPathNameW", "GetTempFileNameW", "GetVolumeInformationByHandleW", "GetVolumeInformationW", "GetVolumePathNameW", "LocalFileTimeToFileTime", "LockFile", "LockFileEx", "QueryDosDeviceW", "ReadFile", "RemoveDirectoryA", "RemoveDirectoryW", "SetEndOfFile", "SetFileAttributesA", "SetFileAttributesW", "SetFileInformationByHandle", "SetFilePointer", "SetFilePointerEx", "SetFileTime", "SetFileValidData", "UnlockFile", "UnlockFileEx", "WriteFile", "GetTempPathW", "GetVolumeNameForVolumeMountPointW", "GetVolumePathNamesForVolumeNameW", "CreateFile2", "SetFileIoOverlappedRange", "GetCompressedFileSizeA", "GetCompressedFileSizeW", "FindFirstStreamW", "FindNextStreamW", "AreFileApisANSI", "GetTempPathA", "FindFirstFileNameW", "FindNextFileNameW", "GetVolumeInformationA", "GetTempFileNameA", "SetFileApisToOEM", "SetFileApisToANSI", "GetTempPath2W", "GetTempPath2A" },
});

pub fn main() !void {
    // Keep DCE from dropping the projections. @typeName forces each
    // struct type to be realized which in turn forces comptime
    // evaluation of every project() call.
    std.debug.print("bench_10:  {s}\n", .{@typeName(@TypeOf(bench_10))});
    std.debug.print("bench_50:  {s}\n", .{@typeName(@TypeOf(bench_50))});
    std.debug.print("bench_100: {s}\n", .{@typeName(@TypeOf(bench_100))});
}
