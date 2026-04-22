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
    .{ "InternetTimeFromSystemTimeA", MethodRecord{ .library = "WININET", .import = "InternetTimeFromSystemTimeA", .signature = "\x00\x04\x11\x59\x0f\x11\x86\x45\x09\x11\x3d\x09" } },
    .{ "InternetTimeFromSystemTimeW", MethodRecord{ .library = "WININET", .import = "InternetTimeFromSystemTimeW", .signature = "\x00\x04\x11\x59\x0f\x11\x86\x45\x09\x11\x05\x09" } },
    .{ "InternetTimeFromSystemTime", MethodRecord{ .library = "WININET", .import = "InternetTimeFromSystemTime", .signature = "\x00\x04\x11\x59\x0f\x11\x86\x45\x09\x11\x3d\x09" } },
    .{ "InternetTimeToSystemTimeA", MethodRecord{ .library = "WININET", .import = "InternetTimeToSystemTimeA", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x11\x86\x45\x09" } },
    .{ "InternetTimeToSystemTimeW", MethodRecord{ .library = "WININET", .import = "InternetTimeToSystemTimeW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x11\x86\x45\x09" } },
    .{ "InternetTimeToSystemTime", MethodRecord{ .library = "WININET", .import = "InternetTimeToSystemTime", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x11\x86\x45\x09" } },
    .{ "InternetCrackUrlA", MethodRecord{ .library = "WININET", .import = "InternetCrackUrlA", .signature = "\x00\x04\x11\x59\x11\x3d\x09\x11\x97\xa9\x0f\x11\xb2\xc9" } },
    .{ "InternetCrackUrlW", MethodRecord{ .library = "WININET", .import = "InternetCrackUrlW", .signature = "\x00\x04\x11\x59\x11\x05\x09\x11\x97\xa9\x0f\x11\xb2\xcd" } },
    .{ "InternetCreateUrlA", MethodRecord{ .library = "WININET", .import = "InternetCreateUrlA", .signature = "\x00\x04\x11\x59\x0f\x11\xb2\xc9\x09\x11\x3d\x0f\x09" } },
    .{ "InternetCreateUrlW", MethodRecord{ .library = "WININET", .import = "InternetCreateUrlW", .signature = "\x00\x04\x11\x59\x0f\x11\xb2\xcd\x09\x11\x05\x0f\x09" } },
    .{ "InternetCanonicalizeUrlA", MethodRecord{ .library = "WININET", .import = "InternetCanonicalizeUrlA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x0f\x09\x09" } },
    .{ "InternetCanonicalizeUrlW", MethodRecord{ .library = "WININET", .import = "InternetCanonicalizeUrlW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x0f\x09\x09" } },
    .{ "InternetCombineUrlA", MethodRecord{ .library = "WININET", .import = "InternetCombineUrlA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x11\x3d\x0f\x09\x09" } },
    .{ "InternetCombineUrlW", MethodRecord{ .library = "WININET", .import = "InternetCombineUrlW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x11\x05\x0f\x09\x09" } },
    .{ "InternetOpenA", MethodRecord{ .library = "WININET", .import = "InternetOpenA", .signature = "\x00\x05\x0f\x01\x11\x3d\x09\x11\x3d\x11\x3d\x09" } },
    .{ "InternetOpenW", MethodRecord{ .library = "WININET", .import = "InternetOpenW", .signature = "\x00\x05\x0f\x01\x11\x05\x09\x11\x05\x11\x05\x09" } },
    .{ "InternetCloseHandle", MethodRecord{ .library = "WININET", .import = "InternetCloseHandle", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "InternetConnectA", MethodRecord{ .library = "WININET", .import = "InternetConnectA", .signature = "\x00\x08\x0f\x01\x0f\x01\x11\x3d\x07\x11\x3d\x11\x3d\x09\x09\x19" } },
    .{ "InternetConnectW", MethodRecord{ .library = "WININET", .import = "InternetConnectW", .signature = "\x00\x08\x0f\x01\x0f\x01\x11\x05\x07\x11\x05\x11\x05\x09\x09\x19" } },
    .{ "InternetOpenUrlA", MethodRecord{ .library = "WININET", .import = "InternetOpenUrlA", .signature = "\x00\x06\x0f\x01\x0f\x01\x11\x3d\x11\x3d\x09\x09\x19" } },
    .{ "InternetOpenUrlW", MethodRecord{ .library = "WININET", .import = "InternetOpenUrlW", .signature = "\x00\x06\x0f\x01\x0f\x01\x11\x05\x11\x05\x09\x09\x19" } },
    .{ "InternetReadFile", MethodRecord{ .library = "WININET", .import = "InternetReadFile", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x01\x09\x0f\x09" } },
    .{ "InternetReadFileExA", MethodRecord{ .library = "WININET", .import = "InternetReadFileExA", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x11\xb2\xd1\x09\x19" } },
    .{ "InternetReadFileExW", MethodRecord{ .library = "WININET", .import = "InternetReadFileExW", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x11\xb2\xd5\x09\x19" } },
    .{ "InternetSetFilePointer", MethodRecord{ .library = "WININET", .import = "InternetSetFilePointer", .signature = "\x00\x05\x09\x0f\x01\x08\x0f\x08\x09\x19" } },
    .{ "InternetWriteFile", MethodRecord{ .library = "WININET", .import = "InternetWriteFile", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x01\x09\x0f\x09" } },
    .{ "InternetQueryDataAvailable", MethodRecord{ .library = "WININET", .import = "InternetQueryDataAvailable", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x09\x09\x19" } },
    .{ "InternetFindNextFileA", MethodRecord{ .library = "WININET", .import = "InternetFindNextFileA", .signature = "\x00\x02\x11\x59\x0f\x01\x0f\x01" } },
    .{ "InternetFindNextFileW", MethodRecord{ .library = "WININET", .import = "InternetFindNextFileW", .signature = "\x00\x02\x11\x59\x0f\x01\x0f\x01" } },
    .{ "InternetQueryOptionA", MethodRecord{ .library = "WININET", .import = "InternetQueryOptionA", .signature = "\x00\x04\x11\x59\x0f\x01\x09\x0f\x01\x0f\x09" } },
    .{ "InternetQueryOptionW", MethodRecord{ .library = "WININET", .import = "InternetQueryOptionW", .signature = "\x00\x04\x11\x59\x0f\x01\x09\x0f\x01\x0f\x09" } },
    .{ "InternetSetOptionA", MethodRecord{ .library = "WININET", .import = "InternetSetOptionA", .signature = "\x00\x04\x11\x59\x0f\x01\x09\x0f\x01\x09" } },
    .{ "InternetSetOptionW", MethodRecord{ .library = "WININET", .import = "InternetSetOptionW", .signature = "\x00\x04\x11\x59\x0f\x01\x09\x0f\x01\x09" } },
    .{ "InternetSetOptionExA", MethodRecord{ .library = "WININET", .import = "InternetSetOptionExA", .signature = "\x00\x05\x11\x59\x0f\x01\x09\x0f\x01\x09\x09" } },
    .{ "InternetSetOptionExW", MethodRecord{ .library = "WININET", .import = "InternetSetOptionExW", .signature = "\x00\x05\x11\x59\x0f\x01\x09\x0f\x01\x09\x09" } },
    .{ "InternetLockRequestFile", MethodRecord{ .library = "WININET", .import = "InternetLockRequestFile", .signature = "\x00\x02\x11\x59\x0f\x01\x0f\x11\x80\x85" } },
    .{ "InternetUnlockRequestFile", MethodRecord{ .library = "WININET", .import = "InternetUnlockRequestFile", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "InternetGetLastResponseInfoA", MethodRecord{ .library = "WININET", .import = "InternetGetLastResponseInfoA", .signature = "\x00\x03\x11\x59\x0f\x09\x11\x3d\x0f\x09" } },
    .{ "InternetGetLastResponseInfoW", MethodRecord{ .library = "WININET", .import = "InternetGetLastResponseInfoW", .signature = "\x00\x03\x11\x59\x0f\x09\x11\x05\x0f\x09" } },
    .{ "InternetSetStatusCallbackA", MethodRecord{ .library = "WININET", .import = "InternetSetStatusCallbackA", .signature = "\x00\x02\x12\xb2\xd9\x0f\x01\x12\xb2\xd9" } },
    .{ "InternetSetStatusCallbackW", MethodRecord{ .library = "WININET", .import = "InternetSetStatusCallbackW", .signature = "\x00\x02\x12\xb2\xd9\x0f\x01\x12\xb2\xd9" } },
    .{ "InternetSetStatusCallback", MethodRecord{ .library = "WININET", .import = "InternetSetStatusCallback", .signature = "\x00\x02\x12\xb2\xd9\x0f\x01\x12\xb2\xd9" } },
    .{ "FtpFindFirstFileA", MethodRecord{ .library = "WININET", .import = "FtpFindFirstFileA", .signature = "\x00\x05\x0f\x01\x0f\x01\x11\x3d\x0f\x11\x8b\xc5\x09\x19" } },
    .{ "FtpFindFirstFileW", MethodRecord{ .library = "WININET", .import = "FtpFindFirstFileW", .signature = "\x00\x05\x0f\x01\x0f\x01\x11\x05\x0f\x11\x8b\xc9\x09\x19" } },
    .{ "FtpGetFileA", MethodRecord{ .library = "WININET", .import = "FtpGetFileA", .signature = "\x00\x07\x11\x59\x0f\x01\x11\x3d\x11\x3d\x11\x59\x09\x09\x19" } },
    .{ "FtpGetFileW", MethodRecord{ .library = "WININET", .import = "FtpGetFileW", .signature = "\x00\x07\x11\x59\x0f\x01\x11\x05\x11\x05\x11\x59\x09\x09\x19" } },
    .{ "FtpPutFileA", MethodRecord{ .library = "WININET", .import = "FtpPutFileA", .signature = "\x00\x05\x11\x59\x0f\x01\x11\x3d\x11\x3d\x11\x97\xbd\x19" } },
    .{ "FtpPutFileW", MethodRecord{ .library = "WININET", .import = "FtpPutFileW", .signature = "\x00\x05\x11\x59\x0f\x01\x11\x05\x11\x05\x11\x97\xbd\x19" } },
    .{ "FtpGetFileEx", MethodRecord{ .library = "WININET", .import = "FtpGetFileEx", .signature = "\x00\x07\x11\x59\x0f\x01\x11\x3d\x11\x05\x11\x59\x09\x09\x19" } },
    .{ "FtpPutFileEx", MethodRecord{ .library = "WININET", .import = "FtpPutFileEx", .signature = "\x00\x05\x11\x59\x0f\x01\x11\x05\x11\x3d\x09\x19" } },
    .{ "FtpDeleteFileA", MethodRecord{ .library = "WININET", .import = "FtpDeleteFileA", .signature = "\x00\x02\x11\x59\x0f\x01\x11\x3d" } },
    .{ "FtpDeleteFileW", MethodRecord{ .library = "WININET", .import = "FtpDeleteFileW", .signature = "\x00\x02\x11\x59\x0f\x01\x11\x05" } },
    .{ "FtpRenameFileA", MethodRecord{ .library = "WININET", .import = "FtpRenameFileA", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x3d\x11\x3d" } },
    .{ "FtpRenameFileW", MethodRecord{ .library = "WININET", .import = "FtpRenameFileW", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x05\x11\x05" } },
    .{ "FtpOpenFileA", MethodRecord{ .library = "WININET", .import = "FtpOpenFileA", .signature = "\x00\x05\x0f\x01\x0f\x01\x11\x3d\x09\x11\x97\xbd\x19" } },
    .{ "FtpOpenFileW", MethodRecord{ .library = "WININET", .import = "FtpOpenFileW", .signature = "\x00\x05\x0f\x01\x0f\x01\x11\x05\x09\x11\x97\xbd\x19" } },
    .{ "FtpCreateDirectoryA", MethodRecord{ .library = "WININET", .import = "FtpCreateDirectoryA", .signature = "\x00\x02\x11\x59\x0f\x01\x11\x3d" } },
    .{ "FtpCreateDirectoryW", MethodRecord{ .library = "WININET", .import = "FtpCreateDirectoryW", .signature = "\x00\x02\x11\x59\x0f\x01\x11\x05" } },
    .{ "FtpRemoveDirectoryA", MethodRecord{ .library = "WININET", .import = "FtpRemoveDirectoryA", .signature = "\x00\x02\x11\x59\x0f\x01\x11\x3d" } },
    .{ "FtpRemoveDirectoryW", MethodRecord{ .library = "WININET", .import = "FtpRemoveDirectoryW", .signature = "\x00\x02\x11\x59\x0f\x01\x11\x05" } },
    .{ "FtpSetCurrentDirectoryA", MethodRecord{ .library = "WININET", .import = "FtpSetCurrentDirectoryA", .signature = "\x00\x02\x11\x59\x0f\x01\x11\x3d" } },
    .{ "FtpSetCurrentDirectoryW", MethodRecord{ .library = "WININET", .import = "FtpSetCurrentDirectoryW", .signature = "\x00\x02\x11\x59\x0f\x01\x11\x05" } },
    .{ "FtpGetCurrentDirectoryA", MethodRecord{ .library = "WININET", .import = "FtpGetCurrentDirectoryA", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x3d\x0f\x09" } },
    .{ "FtpGetCurrentDirectoryW", MethodRecord{ .library = "WININET", .import = "FtpGetCurrentDirectoryW", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x05\x0f\x09" } },
    .{ "FtpCommandA", MethodRecord{ .library = "WININET", .import = "FtpCommandA", .signature = "\x00\x06\x11\x59\x0f\x01\x11\x59\x11\x97\xbd\x11\x3d\x19\x0f\x0f\x01" } },
    .{ "FtpCommandW", MethodRecord{ .library = "WININET", .import = "FtpCommandW", .signature = "\x00\x06\x11\x59\x0f\x01\x11\x59\x11\x97\xbd\x11\x05\x19\x0f\x0f\x01" } },
    .{ "FtpGetFileSize", MethodRecord{ .library = "WININET", .import = "FtpGetFileSize", .signature = "\x00\x02\x09\x0f\x01\x0f\x09" } },
    .{ "GopherCreateLocatorA", MethodRecord{ .library = "WININET", .import = "GopherCreateLocatorA", .signature = "\x00\x07\x11\x59\x11\x3d\x07\x11\x3d\x11\x3d\x09\x11\x3d\x0f\x09" } },
    .{ "GopherCreateLocatorW", MethodRecord{ .library = "WININET", .import = "GopherCreateLocatorW", .signature = "\x00\x07\x11\x59\x11\x05\x07\x11\x05\x11\x05\x09\x11\x05\x0f\x09" } },
    .{ "GopherGetLocatorTypeA", MethodRecord{ .library = "WININET", .import = "GopherGetLocatorTypeA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x09" } },
    .{ "GopherGetLocatorTypeW", MethodRecord{ .library = "WININET", .import = "GopherGetLocatorTypeW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x09" } },
    .{ "GopherFindFirstFileA", MethodRecord{ .library = "WININET", .import = "GopherFindFirstFileA", .signature = "\x00\x06\x0f\x01\x0f\x01\x11\x3d\x11\x3d\x0f\x11\xb2\xdd\x09\x19" } },
    .{ "GopherFindFirstFileW", MethodRecord{ .library = "WININET", .import = "GopherFindFirstFileW", .signature = "\x00\x06\x0f\x01\x0f\x01\x11\x05\x11\x05\x0f\x11\xb2\xe1\x09\x19" } },
    .{ "GopherOpenFileA", MethodRecord{ .library = "WININET", .import = "GopherOpenFileA", .signature = "\x00\x05\x0f\x01\x0f\x01\x11\x3d\x11\x3d\x09\x19" } },
    .{ "GopherOpenFileW", MethodRecord{ .library = "WININET", .import = "GopherOpenFileW", .signature = "\x00\x05\x0f\x01\x0f\x01\x11\x05\x11\x05\x09\x19" } },
    .{ "GopherGetAttributeA", MethodRecord{ .library = "WININET", .import = "GopherGetAttributeA", .signature = "\x00\x08\x11\x59\x0f\x01\x11\x3d\x11\x3d\x0f\x05\x09\x0f\x09\x12\xb2\xe5\x19" } },
    .{ "GopherGetAttributeW", MethodRecord{ .library = "WININET", .import = "GopherGetAttributeW", .signature = "\x00\x08\x11\x59\x0f\x01\x11\x05\x11\x05\x0f\x05\x09\x0f\x09\x12\xb2\xe5\x19" } },
    .{ "HttpOpenRequestA", MethodRecord{ .library = "WININET", .import = "HttpOpenRequestA", .signature = "\x00\x08\x0f\x01\x0f\x01\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x0f\x11\x3d\x09\x19" } },
    .{ "HttpOpenRequestW", MethodRecord{ .library = "WININET", .import = "HttpOpenRequestW", .signature = "\x00\x08\x0f\x01\x0f\x01\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x11\x05\x09\x19" } },
    .{ "HttpAddRequestHeadersA", MethodRecord{ .library = "WININET", .import = "HttpAddRequestHeadersA", .signature = "\x00\x04\x11\x59\x0f\x01\x11\x3d\x09\x11\x97\xc5" } },
    .{ "HttpAddRequestHeadersW", MethodRecord{ .library = "WININET", .import = "HttpAddRequestHeadersW", .signature = "\x00\x04\x11\x59\x0f\x01\x11\x05\x09\x11\x97\xc5" } },
    .{ "HttpSendRequestA", MethodRecord{ .library = "WININET", .import = "HttpSendRequestA", .signature = "\x00\x05\x11\x59\x0f\x01\x11\x3d\x09\x0f\x01\x09" } },
    .{ "HttpSendRequestW", MethodRecord{ .library = "WININET", .import = "HttpSendRequestW", .signature = "\x00\x05\x11\x59\x0f\x01\x11\x05\x09\x0f\x01\x09" } },
    .{ "HttpSendRequestExA", MethodRecord{ .library = "WININET", .import = "HttpSendRequestExA", .signature = "\x00\x05\x11\x59\x0f\x01\x0f\x11\xb2\xd1\x0f\x11\xb2\xd1\x09\x19" } },
    .{ "HttpSendRequestExW", MethodRecord{ .library = "WININET", .import = "HttpSendRequestExW", .signature = "\x00\x05\x11\x59\x0f\x01\x0f\x11\xb2\xd5\x0f\x11\xb2\xd5\x09\x19" } },
    .{ "HttpEndRequestA", MethodRecord{ .library = "WININET", .import = "HttpEndRequestA", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x11\xb2\xd1\x09\x19" } },
    .{ "HttpEndRequestW", MethodRecord{ .library = "WININET", .import = "HttpEndRequestW", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x11\xb2\xd5\x09\x19" } },
    .{ "HttpQueryInfoA", MethodRecord{ .library = "WININET", .import = "HttpQueryInfoA", .signature = "\x00\x05\x11\x59\x0f\x01\x09\x0f\x01\x0f\x09\x0f\x09" } },
    .{ "HttpQueryInfoW", MethodRecord{ .library = "WININET", .import = "HttpQueryInfoW", .signature = "\x00\x05\x11\x59\x0f\x01\x09\x0f\x01\x0f\x09\x0f\x09" } },
    .{ "InternetSetCookieA", MethodRecord{ .library = "WININET", .import = "InternetSetCookieA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "InternetSetCookieW", MethodRecord{ .library = "WININET", .import = "InternetSetCookieW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x05" } },
    .{ "InternetGetCookieA", MethodRecord{ .library = "WININET", .import = "InternetGetCookieA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "InternetGetCookieW", MethodRecord{ .library = "WININET", .import = "InternetGetCookieW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x11\x05\x0f\x09" } },
    .{ "InternetSetCookieExA", MethodRecord{ .library = "WININET", .import = "InternetSetCookieExA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x11\x3d\x09\x19" } },
    .{ "InternetSetCookieExW", MethodRecord{ .library = "WININET", .import = "InternetSetCookieExW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x09\x19" } },
    .{ "InternetGetCookieExA", MethodRecord{ .library = "WININET", .import = "InternetGetCookieExA", .signature = "\x00\x06\x11\x59\x11\x3d\x11\x3d\x11\x3d\x0f\x09\x11\x97\xc9\x0f\x01" } },
    .{ "InternetGetCookieExW", MethodRecord{ .library = "WININET", .import = "InternetGetCookieExW", .signature = "\x00\x06\x11\x59\x11\x05\x11\x05\x11\x05\x0f\x09\x11\x97\xc9\x0f\x01" } },
    .{ "InternetFreeCookies", MethodRecord{ .library = "WININET", .import = "InternetFreeCookies", .signature = "\x00\x02\x01\x0f\x11\xb2\xe9\x09" } },
    .{ "InternetGetCookieEx2", MethodRecord{ .library = "WININET", .import = "InternetGetCookieEx2", .signature = "\x00\x05\x09\x11\x05\x11\x05\x09\x0f\x0f\x11\xb2\xe9\x0f\x09" } },
    .{ "InternetSetCookieEx2", MethodRecord{ .library = "WININET", .import = "InternetSetCookieEx2", .signature = "\x00\x05\x09\x11\x05\x0f\x11\xb2\xe9\x11\x05\x09\x0f\x09" } },
    .{ "InternetAttemptConnect", MethodRecord{ .library = "WININET", .import = "InternetAttemptConnect", .signature = "\x00\x01\x09\x09" } },
    .{ "InternetCheckConnectionA", MethodRecord{ .library = "WININET", .import = "InternetCheckConnectionA", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x09" } },
    .{ "InternetCheckConnectionW", MethodRecord{ .library = "WININET", .import = "InternetCheckConnectionW", .signature = "\x00\x03\x11\x59\x11\x05\x09\x09" } },
    .{ "ResumeSuspendedDownload", MethodRecord{ .library = "WININET", .import = "ResumeSuspendedDownload", .signature = "\x00\x02\x11\x59\x0f\x01\x09" } },
    .{ "InternetErrorDlg", MethodRecord{ .library = "WININET", .import = "InternetErrorDlg", .signature = "\x00\x05\x09\x11\x25\x0f\x01\x09\x09\x0f\x0f\x01" } },
    .{ "InternetConfirmZoneCrossingA", MethodRecord{ .library = "WININET", .import = "InternetConfirmZoneCrossingA", .signature = "\x00\x04\x09\x11\x25\x11\x3d\x11\x3d\x11\x59" } },
    .{ "InternetConfirmZoneCrossingW", MethodRecord{ .library = "WININET", .import = "InternetConfirmZoneCrossingW", .signature = "\x00\x04\x09\x11\x25\x11\x05\x11\x05\x11\x59" } },
    .{ "InternetConfirmZoneCrossing", MethodRecord{ .library = "WININET", .import = "InternetConfirmZoneCrossing", .signature = "\x00\x04\x09\x11\x25\x11\x3d\x11\x3d\x11\x59" } },
    .{ "CreateUrlCacheEntryA", MethodRecord{ .library = "WININET", .import = "CreateUrlCacheEntryA", .signature = "\x00\x05\x11\x59\x11\x3d\x09\x11\x3d\x11\x3d\x09" } },
    .{ "CreateUrlCacheEntryW", MethodRecord{ .library = "WININET", .import = "CreateUrlCacheEntryW", .signature = "\x00\x05\x11\x59\x11\x05\x09\x11\x05\x11\x05\x09" } },
    .{ "CommitUrlCacheEntryA", MethodRecord{ .library = "WININET", .import = "CommitUrlCacheEntryA", .signature = "\x00\x09\x11\x59\x11\x3d\x11\x3d\x11\x80\x9d\x11\x80\x9d\x09\x0f\x05\x09\x11\x3d\x11\x3d" } },
    .{ "CommitUrlCacheEntryW", MethodRecord{ .library = "WININET", .import = "CommitUrlCacheEntryW", .signature = "\x00\x09\x11\x59\x11\x05\x11\x05\x11\x80\x9d\x11\x80\x9d\x09\x11\x05\x09\x11\x05\x11\x05" } },
    .{ "RetrieveUrlCacheEntryFileA", MethodRecord{ .library = "WININET", .import = "RetrieveUrlCacheEntryFileA", .signature = "\x00\x04\x11\x59\x11\x3d\x0f\x11\xb2\xed\x0f\x09\x09" } },
    .{ "RetrieveUrlCacheEntryFileW", MethodRecord{ .library = "WININET", .import = "RetrieveUrlCacheEntryFileW", .signature = "\x00\x04\x11\x59\x11\x05\x0f\x11\xb2\xf1\x0f\x09\x09" } },
    .{ "UnlockUrlCacheEntryFileA", MethodRecord{ .library = "WININET", .import = "UnlockUrlCacheEntryFileA", .signature = "\x00\x02\x11\x59\x11\x3d\x09" } },
    .{ "UnlockUrlCacheEntryFileW", MethodRecord{ .library = "WININET", .import = "UnlockUrlCacheEntryFileW", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "UnlockUrlCacheEntryFile", MethodRecord{ .library = "WININET", .import = "UnlockUrlCacheEntryFile", .signature = "\x00\x02\x11\x59\x11\x3d\x09" } },
    .{ "RetrieveUrlCacheEntryStreamA", MethodRecord{ .library = "WININET", .import = "RetrieveUrlCacheEntryStreamA", .signature = "\x00\x05\x11\x80\x85\x11\x3d\x0f\x11\xb2\xed\x0f\x09\x11\x59\x09" } },
    .{ "RetrieveUrlCacheEntryStreamW", MethodRecord{ .library = "WININET", .import = "RetrieveUrlCacheEntryStreamW", .signature = "\x00\x05\x11\x80\x85\x11\x05\x0f\x11\xb2\xf1\x0f\x09\x11\x59\x09" } },
    .{ "ReadUrlCacheEntryStream", MethodRecord{ .library = "WININET", .import = "ReadUrlCacheEntryStream", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x0f\x01\x0f\x09\x09" } },
    .{ "ReadUrlCacheEntryStreamEx", MethodRecord{ .library = "WININET", .import = "ReadUrlCacheEntryStreamEx", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x0f\x01\x0f\x09" } },
    .{ "UnlockUrlCacheEntryStream", MethodRecord{ .library = "WININET", .import = "UnlockUrlCacheEntryStream", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "GetUrlCacheEntryInfoA", MethodRecord{ .library = "WININET", .import = "GetUrlCacheEntryInfoA", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x11\xb2\xed\x0f\x09" } },
    .{ "GetUrlCacheEntryInfoW", MethodRecord{ .library = "WININET", .import = "GetUrlCacheEntryInfoW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x11\xb2\xf1\x0f\x09" } },
    .{ "FindFirstUrlCacheGroup", MethodRecord{ .library = "WININET", .import = "FindFirstUrlCacheGroup", .signature = "\x00\x06\x11\x80\x85\x09\x09\x0f\x01\x09\x0f\x0a\x0f\x01" } },
    .{ "FindNextUrlCacheGroup", MethodRecord{ .library = "WININET", .import = "FindNextUrlCacheGroup", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x0a\x0f\x01" } },
    .{ "GetUrlCacheGroupAttributeA", MethodRecord{ .library = "WININET", .import = "GetUrlCacheGroupAttributeA", .signature = "\x00\x06\x11\x59\x0a\x09\x09\x0f\x11\xb2\xf5\x0f\x09\x0f\x01" } },
    .{ "GetUrlCacheGroupAttributeW", MethodRecord{ .library = "WININET", .import = "GetUrlCacheGroupAttributeW", .signature = "\x00\x06\x11\x59\x0a\x09\x09\x0f\x11\xb2\xf9\x0f\x09\x0f\x01" } },
    .{ "SetUrlCacheGroupAttributeA", MethodRecord{ .library = "WININET", .import = "SetUrlCacheGroupAttributeA", .signature = "\x00\x05\x11\x59\x0a\x09\x09\x0f\x11\xb2\xf5\x0f\x01" } },
    .{ "SetUrlCacheGroupAttributeW", MethodRecord{ .library = "WININET", .import = "SetUrlCacheGroupAttributeW", .signature = "\x00\x05\x11\x59\x0a\x09\x09\x0f\x11\xb2\xf9\x0f\x01" } },
    .{ "GetUrlCacheEntryInfoExA", MethodRecord{ .library = "WININET", .import = "GetUrlCacheEntryInfoExA", .signature = "\x00\x07\x11\x59\x11\x3d\x0f\x11\xb2\xed\x0f\x09\x11\x3d\x0f\x09\x0f\x01\x09" } },
    .{ "GetUrlCacheEntryInfoExW", MethodRecord{ .library = "WININET", .import = "GetUrlCacheEntryInfoExW", .signature = "\x00\x07\x11\x59\x11\x05\x0f\x11\xb2\xf1\x0f\x09\x11\x05\x0f\x09\x0f\x01\x09" } },
    .{ "SetUrlCacheEntryInfoA", MethodRecord{ .library = "WININET", .import = "SetUrlCacheEntryInfoA", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x11\xb2\xed\x09" } },
    .{ "SetUrlCacheEntryInfoW", MethodRecord{ .library = "WININET", .import = "SetUrlCacheEntryInfoW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x11\xb2\xf1\x09" } },
    .{ "CreateUrlCacheGroup", MethodRecord{ .library = "WININET", .import = "CreateUrlCacheGroup", .signature = "\x00\x02\x0a\x09\x0f\x01" } },
    .{ "DeleteUrlCacheGroup", MethodRecord{ .library = "WININET", .import = "DeleteUrlCacheGroup", .signature = "\x00\x03\x11\x59\x0a\x09\x0f\x01" } },
    .{ "SetUrlCacheEntryGroupA", MethodRecord{ .library = "WININET", .import = "SetUrlCacheEntryGroupA", .signature = "\x00\x06\x11\x59\x11\x3d\x09\x0a\x0f\x05\x09\x0f\x01" } },
    .{ "SetUrlCacheEntryGroupW", MethodRecord{ .library = "WININET", .import = "SetUrlCacheEntryGroupW", .signature = "\x00\x06\x11\x59\x11\x05\x09\x0a\x0f\x05\x09\x0f\x01" } },
    .{ "SetUrlCacheEntryGroup", MethodRecord{ .library = "WININET", .import = "SetUrlCacheEntryGroup", .signature = "\x00\x06\x11\x59\x11\x3d\x09\x0a\x0f\x05\x09\x0f\x01" } },
    .{ "FindFirstUrlCacheEntryExA", MethodRecord{ .library = "WININET", .import = "FindFirstUrlCacheEntryExA", .signature = "\x00\x09\x11\x80\x85\x11\x3d\x09\x09\x0a\x0f\x11\xb2\xed\x0f\x09\x0f\x01\x0f\x09\x0f\x01" } },
    .{ "FindFirstUrlCacheEntryExW", MethodRecord{ .library = "WININET", .import = "FindFirstUrlCacheEntryExW", .signature = "\x00\x09\x11\x80\x85\x11\x05\x09\x09\x0a\x0f\x11\xb2\xf1\x0f\x09\x0f\x01\x0f\x09\x0f\x01" } },
    .{ "FindNextUrlCacheEntryExA", MethodRecord{ .library = "WININET", .import = "FindNextUrlCacheEntryExA", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x11\xb2\xed\x0f\x09\x0f\x01\x0f\x09\x0f\x01" } },
    .{ "FindNextUrlCacheEntryExW", MethodRecord{ .library = "WININET", .import = "FindNextUrlCacheEntryExW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x11\xb2\xf1\x0f\x09\x0f\x01\x0f\x09\x0f\x01" } },
    .{ "FindFirstUrlCacheEntryA", MethodRecord{ .library = "WININET", .import = "FindFirstUrlCacheEntryA", .signature = "\x00\x03\x11\x80\x85\x11\x3d\x0f\x11\xb2\xed\x0f\x09" } },
    .{ "FindFirstUrlCacheEntryW", MethodRecord{ .library = "WININET", .import = "FindFirstUrlCacheEntryW", .signature = "\x00\x03\x11\x80\x85\x11\x05\x0f\x11\xb2\xf1\x0f\x09" } },
    .{ "FindNextUrlCacheEntryA", MethodRecord{ .library = "WININET", .import = "FindNextUrlCacheEntryA", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xb2\xed\x0f\x09" } },
    .{ "FindNextUrlCacheEntryW", MethodRecord{ .library = "WININET", .import = "FindNextUrlCacheEntryW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xb2\xf1\x0f\x09" } },
    .{ "FindCloseUrlCache", MethodRecord{ .library = "WININET", .import = "FindCloseUrlCache", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "DeleteUrlCacheEntryA", MethodRecord{ .library = "WININET", .import = "DeleteUrlCacheEntryA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "DeleteUrlCacheEntryW", MethodRecord{ .library = "WININET", .import = "DeleteUrlCacheEntryW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "DeleteUrlCacheEntry", MethodRecord{ .library = "WININET", .import = "DeleteUrlCacheEntry", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "InternetDialA", MethodRecord{ .library = "WININET", .import = "InternetDialA", .signature = "\x00\x05\x09\x11\x25\x11\x3d\x09\x0f\x19\x09" } },
    .{ "InternetDialW", MethodRecord{ .library = "WININET", .import = "InternetDialW", .signature = "\x00\x05\x09\x11\x25\x11\x05\x09\x0f\x19\x09" } },
    .{ "InternetDial", MethodRecord{ .library = "WININET", .import = "InternetDial", .signature = "\x00\x05\x09\x11\x25\x11\x3d\x09\x0f\x09\x09" } },
    .{ "InternetHangUp", MethodRecord{ .library = "WININET", .import = "InternetHangUp", .signature = "\x00\x02\x09\x19\x09" } },
    .{ "InternetGoOnlineA", MethodRecord{ .library = "WININET", .import = "InternetGoOnlineA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x25\x09" } },
    .{ "InternetGoOnlineW", MethodRecord{ .library = "WININET", .import = "InternetGoOnlineW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x25\x09" } },
    .{ "InternetGoOnline", MethodRecord{ .library = "WININET", .import = "InternetGoOnline", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x25\x09" } },
    .{ "InternetAutodial", MethodRecord{ .library = "WININET", .import = "InternetAutodial", .signature = "\x00\x02\x11\x59\x11\x97\xd1\x11\x25" } },
    .{ "InternetAutodialHangup", MethodRecord{ .library = "WININET", .import = "InternetAutodialHangup", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "InternetGetConnectedState", MethodRecord{ .library = "WININET", .import = "InternetGetConnectedState", .signature = "\x00\x02\x11\x59\x0f\x11\x97\xc1\x09" } },
    .{ "InternetGetConnectedStateExA", MethodRecord{ .library = "WININET", .import = "InternetGetConnectedStateExA", .signature = "\x00\x04\x11\x59\x0f\x11\x97\xc1\x11\x3d\x09\x09" } },
    .{ "InternetGetConnectedStateExW", MethodRecord{ .library = "WININET", .import = "InternetGetConnectedStateExW", .signature = "\x00\x04\x11\x59\x0f\x11\x97\xc1\x11\x05\x09\x09" } },
    .{ "DeleteWpadCacheForNetworks", MethodRecord{ .library = "WININET", .import = "DeleteWpadCacheForNetworks", .signature = "\x00\x01\x11\x59\x11\xb2\xfd" } },
    .{ "InternetInitializeAutoProxyDll", MethodRecord{ .library = "WININET", .import = "InternetInitializeAutoProxyDll", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "DetectAutoProxyUrl", MethodRecord{ .library = "WININET", .import = "DetectAutoProxyUrl", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x11\x97\xcd" } },
    .{ "CreateMD5SSOHash", MethodRecord{ .library = "WININET", .import = "CreateMD5SSOHash", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x11\x05\x0f\x05" } },
    .{ "InternetGetConnectedStateEx", MethodRecord{ .library = "WININET", .import = "InternetGetConnectedStateEx", .signature = "\x00\x04\x11\x59\x0f\x11\x97\xc1\x11\x3d\x09\x09" } },
    .{ "InternetSetDialStateA", MethodRecord{ .library = "WININET", .import = "InternetSetDialStateA", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x09" } },
    .{ "InternetSetDialStateW", MethodRecord{ .library = "WININET", .import = "InternetSetDialStateW", .signature = "\x00\x03\x11\x59\x11\x05\x09\x09" } },
    .{ "InternetSetDialState", MethodRecord{ .library = "WININET", .import = "InternetSetDialState", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x09" } },
    .{ "InternetSetPerSiteCookieDecisionA", MethodRecord{ .library = "WININET", .import = "InternetSetPerSiteCookieDecisionA", .signature = "\x00\x02\x11\x59\x11\x3d\x09" } },
    .{ "InternetSetPerSiteCookieDecisionW", MethodRecord{ .library = "WININET", .import = "InternetSetPerSiteCookieDecisionW", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "InternetGetPerSiteCookieDecisionA", MethodRecord{ .library = "WININET", .import = "InternetGetPerSiteCookieDecisionA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x09" } },
    .{ "InternetGetPerSiteCookieDecisionW", MethodRecord{ .library = "WININET", .import = "InternetGetPerSiteCookieDecisionW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x09" } },
    .{ "InternetClearAllPerSiteCookieDecisions", MethodRecord{ .library = "WININET", .import = "InternetClearAllPerSiteCookieDecisions", .signature = "\x00\x00\x11\x59" } },
    .{ "InternetEnumPerSiteCookieDecisionA", MethodRecord{ .library = "WININET", .import = "InternetEnumPerSiteCookieDecisionA", .signature = "\x00\x04\x11\x59\x11\x3d\x0f\x09\x0f\x09\x09" } },
    .{ "InternetEnumPerSiteCookieDecisionW", MethodRecord{ .library = "WININET", .import = "InternetEnumPerSiteCookieDecisionW", .signature = "\x00\x04\x11\x59\x11\x05\x0f\x09\x0f\x09\x09" } },
    .{ "PrivacySetZonePreferenceW", MethodRecord{ .library = "WININET", .import = "PrivacySetZonePreferenceW", .signature = "\x00\x04\x09\x09\x09\x09\x11\x05" } },
    .{ "PrivacyGetZonePreferenceW", MethodRecord{ .library = "WININET", .import = "PrivacyGetZonePreferenceW", .signature = "\x00\x05\x09\x09\x09\x0f\x09\x11\x05\x0f\x09" } },
    .{ "HttpIsHostHstsEnabled", MethodRecord{ .library = "WININET", .import = "HttpIsHostHstsEnabled", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x59" } },
    .{ "InternetAlgIdToStringA", MethodRecord{ .library = "WININET", .import = "InternetAlgIdToStringA", .signature = "\x00\x04\x11\x59\x11\x80\xe5\x11\x3d\x0f\x09\x09" } },
    .{ "InternetAlgIdToStringW", MethodRecord{ .library = "WININET", .import = "InternetAlgIdToStringW", .signature = "\x00\x04\x11\x59\x11\x80\xe5\x11\x05\x0f\x09\x09" } },
    .{ "InternetSecurityProtocolToStringA", MethodRecord{ .library = "WININET", .import = "InternetSecurityProtocolToStringA", .signature = "\x00\x04\x11\x59\x09\x11\x3d\x0f\x09\x09" } },
    .{ "InternetSecurityProtocolToStringW", MethodRecord{ .library = "WININET", .import = "InternetSecurityProtocolToStringW", .signature = "\x00\x04\x11\x59\x09\x11\x05\x0f\x09\x09" } },
    .{ "InternetGetSecurityInfoByURLA", MethodRecord{ .library = "WININET", .import = "InternetGetSecurityInfoByURLA", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x0f\x11\x86\x61\x0f\x09" } },
    .{ "InternetGetSecurityInfoByURLW", MethodRecord{ .library = "WININET", .import = "InternetGetSecurityInfoByURLW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x0f\x11\x86\x61\x0f\x09" } },
    .{ "InternetGetSecurityInfoByURL", MethodRecord{ .library = "WININET", .import = "InternetGetSecurityInfoByURL", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x0f\x11\x86\x61\x0f\x09" } },
    .{ "ShowSecurityInfo", MethodRecord{ .library = "WININET", .import = "ShowSecurityInfo", .signature = "\x00\x02\x09\x11\x25\x0f\x11\xb3\x01" } },
    .{ "ShowX509EncodedCertificate", MethodRecord{ .library = "WININET", .import = "ShowX509EncodedCertificate", .signature = "\x00\x03\x09\x11\x25\x0f\x05\x09" } },
    .{ "ShowClientAuthCerts", MethodRecord{ .library = "WININET", .import = "ShowClientAuthCerts", .signature = "\x00\x01\x09\x11\x25" } },
    .{ "ParseX509EncodedCertificateForListBoxEntry", MethodRecord{ .library = "WININET", .import = "ParseX509EncodedCertificateForListBoxEntry", .signature = "\x00\x04\x09\x0f\x05\x09\x11\x3d\x0f\x09" } },
    .{ "InternetShowSecurityInfoByURLA", MethodRecord{ .library = "WININET", .import = "InternetShowSecurityInfoByURLA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x25" } },
    .{ "InternetShowSecurityInfoByURLW", MethodRecord{ .library = "WININET", .import = "InternetShowSecurityInfoByURLW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x25" } },
    .{ "InternetShowSecurityInfoByURL", MethodRecord{ .library = "WININET", .import = "InternetShowSecurityInfoByURL", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x25" } },
    .{ "InternetFortezzaCommand", MethodRecord{ .library = "WININET", .import = "InternetFortezzaCommand", .signature = "\x00\x03\x11\x59\x09\x11\x25\x19" } },
    .{ "InternetQueryFortezzaStatus", MethodRecord{ .library = "WININET", .import = "InternetQueryFortezzaStatus", .signature = "\x00\x02\x11\x59\x0f\x09\x19" } },
    .{ "InternetWriteFileExA", MethodRecord{ .library = "WININET", .import = "InternetWriteFileExA", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x11\xb2\xd1\x09\x19" } },
    .{ "InternetWriteFileExW", MethodRecord{ .library = "WININET", .import = "InternetWriteFileExW", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x11\xb2\xd5\x09\x19" } },
    .{ "FindP3PPolicySymbol", MethodRecord{ .library = "WININET", .import = "FindP3PPolicySymbol", .signature = "\x00\x01\x08\x11\x3d" } },
    .{ "HttpGetServerCredentials", MethodRecord{ .library = "WININET", .import = "HttpGetServerCredentials", .signature = "\x00\x03\x09\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "HttpPushEnable", MethodRecord{ .library = "WININET", .import = "HttpPushEnable", .signature = "\x00\x03\x09\x0f\x01\x0f\x11\xb3\x05\x0f\x11\xb3\x09" } },
    .{ "HttpPushWait", MethodRecord{ .library = "WININET", .import = "HttpPushWait", .signature = "\x00\x03\x09\x11\xb3\x09\x11\xb3\x0d\x0f\x11\xb3\x11" } },
    .{ "HttpPushClose", MethodRecord{ .library = "WININET", .import = "HttpPushClose", .signature = "\x00\x01\x01\x11\xb3\x09" } },
    .{ "HttpCheckDavComplianceA", MethodRecord{ .library = "WININET", .import = "HttpCheckDavComplianceA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x0f\x11\x59\x11\x25\x0f\x01" } },
    .{ "HttpCheckDavComplianceW", MethodRecord{ .library = "WININET", .import = "HttpCheckDavComplianceW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x0f\x11\x59\x11\x25\x0f\x01" } },
    .{ "IsUrlCacheEntryExpiredA", MethodRecord{ .library = "WININET", .import = "IsUrlCacheEntryExpiredA", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x0f\x11\x80\x9d" } },
    .{ "IsUrlCacheEntryExpiredW", MethodRecord{ .library = "WININET", .import = "IsUrlCacheEntryExpiredW", .signature = "\x00\x03\x11\x59\x11\x05\x09\x0f\x11\x80\x9d" } },
    .{ "CreateUrlCacheEntryExW", MethodRecord{ .library = "WININET", .import = "CreateUrlCacheEntryExW", .signature = "\x00\x06\x11\x59\x11\x05\x09\x11\x05\x11\x05\x09\x11\x59" } },
    .{ "GetUrlCacheEntryBinaryBlob", MethodRecord{ .library = "WININET", .import = "GetUrlCacheEntryBinaryBlob", .signature = "\x00\x07\x09\x11\x05\x0f\x09\x0f\x11\x80\x9d\x0f\x11\x80\x9d\x0f\x11\x80\x9d\x0f\x0f\x05\x0f\x09" } },
    .{ "CommitUrlCacheEntryBinaryBlob", MethodRecord{ .library = "WININET", .import = "CommitUrlCacheEntryBinaryBlob", .signature = "\x00\x06\x09\x11\x05\x09\x11\x80\x9d\x11\x80\x9d\x0f\x05\x09" } },
    .{ "CreateUrlCacheContainerA", MethodRecord{ .library = "WININET", .import = "CreateUrlCacheContainerA", .signature = "\x00\x08\x11\x59\x11\x3d\x11\x3d\x11\x3d\x09\x09\x09\x0f\x01\x0f\x09" } },
    .{ "CreateUrlCacheContainerW", MethodRecord{ .library = "WININET", .import = "CreateUrlCacheContainerW", .signature = "\x00\x08\x11\x59\x11\x05\x11\x05\x11\x05\x09\x09\x09\x0f\x01\x0f\x09" } },
    .{ "DeleteUrlCacheContainerA", MethodRecord{ .library = "WININET", .import = "DeleteUrlCacheContainerA", .signature = "\x00\x02\x11\x59\x11\x3d\x09" } },
    .{ "DeleteUrlCacheContainerW", MethodRecord{ .library = "WININET", .import = "DeleteUrlCacheContainerW", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "FindFirstUrlCacheContainerA", MethodRecord{ .library = "WININET", .import = "FindFirstUrlCacheContainerA", .signature = "\x00\x04\x11\x80\x85\x0f\x09\x0f\x11\xb3\x15\x0f\x09\x09" } },
    .{ "FindFirstUrlCacheContainerW", MethodRecord{ .library = "WININET", .import = "FindFirstUrlCacheContainerW", .signature = "\x00\x04\x11\x80\x85\x0f\x09\x0f\x11\xb3\x19\x0f\x09\x09" } },
    .{ "FindNextUrlCacheContainerA", MethodRecord{ .library = "WININET", .import = "FindNextUrlCacheContainerA", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xb3\x15\x0f\x09" } },
    .{ "FindNextUrlCacheContainerW", MethodRecord{ .library = "WININET", .import = "FindNextUrlCacheContainerW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xb3\x19\x0f\x09" } },
    .{ "FreeUrlCacheSpaceA", MethodRecord{ .library = "WININET", .import = "FreeUrlCacheSpaceA", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x09" } },
    .{ "FreeUrlCacheSpaceW", MethodRecord{ .library = "WININET", .import = "FreeUrlCacheSpaceW", .signature = "\x00\x03\x11\x59\x11\x05\x09\x09" } },
    .{ "UrlCacheFreeGlobalSpace", MethodRecord{ .library = "WININET", .import = "UrlCacheFreeGlobalSpace", .signature = "\x00\x02\x09\x0b\x09" } },
    .{ "UrlCacheGetGlobalCacheSize", MethodRecord{ .library = "WININET", .import = "UrlCacheGetGlobalCacheSize", .signature = "\x00\x03\x09\x09\x0f\x0b\x0f\x0b" } },
    .{ "GetUrlCacheConfigInfoA", MethodRecord{ .library = "WININET", .import = "GetUrlCacheConfigInfoA", .signature = "\x00\x03\x11\x59\x0f\x11\xb3\x1d\x0f\x09\x11\x97\xb9" } },
    .{ "GetUrlCacheConfigInfoW", MethodRecord{ .library = "WININET", .import = "GetUrlCacheConfigInfoW", .signature = "\x00\x03\x11\x59\x0f\x11\xb3\x21\x0f\x09\x11\x97\xb9" } },
    .{ "SetUrlCacheConfigInfoA", MethodRecord{ .library = "WININET", .import = "SetUrlCacheConfigInfoA", .signature = "\x00\x02\x11\x59\x0f\x11\xb3\x1d\x09" } },
    .{ "SetUrlCacheConfigInfoW", MethodRecord{ .library = "WININET", .import = "SetUrlCacheConfigInfoW", .signature = "\x00\x02\x11\x59\x0f\x11\xb3\x21\x09" } },
    .{ "RunOnceUrlCache", MethodRecord{ .library = "WININET", .import = "RunOnceUrlCache", .signature = "\x00\x04\x09\x11\x25\x11\x82\x29\x11\x3d\x08" } },
    .{ "DeleteIE3Cache", MethodRecord{ .library = "WININET", .import = "DeleteIE3Cache", .signature = "\x00\x04\x09\x11\x25\x11\x82\x29\x11\x3d\x08" } },
    .{ "UpdateUrlCacheContentPath", MethodRecord{ .library = "WININET", .import = "UpdateUrlCacheContentPath", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "RegisterUrlCacheNotification", MethodRecord{ .library = "WININET", .import = "RegisterUrlCacheNotification", .signature = "\x00\x05\x11\x59\x11\x25\x09\x0a\x09\x09" } },
    .{ "GetUrlCacheHeaderData", MethodRecord{ .library = "WININET", .import = "GetUrlCacheHeaderData", .signature = "\x00\x02\x11\x59\x09\x0f\x09" } },
    .{ "SetUrlCacheHeaderData", MethodRecord{ .library = "WININET", .import = "SetUrlCacheHeaderData", .signature = "\x00\x02\x11\x59\x09\x09" } },
    .{ "IncrementUrlCacheHeaderData", MethodRecord{ .library = "WININET", .import = "IncrementUrlCacheHeaderData", .signature = "\x00\x02\x11\x59\x09\x0f\x09" } },
    .{ "LoadUrlCacheContent", MethodRecord{ .library = "WININET", .import = "LoadUrlCacheContent", .signature = "\x00\x00\x11\x59" } },
    .{ "AppCacheLookup", MethodRecord{ .library = "WININET", .import = "AppCacheLookup", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x0f\x01" } },
    .{ "AppCacheCheckManifest", MethodRecord{ .library = "WININET", .import = "AppCacheCheckManifest", .signature = "\x00\x08\x09\x11\x05\x11\x05\x0f\x05\x09\x0f\x05\x09\x0f\x11\xb3\x25\x0f\x0f\x01" } },
    .{ "AppCacheGetDownloadList", MethodRecord{ .library = "WININET", .import = "AppCacheGetDownloadList", .signature = "\x00\x02\x09\x0f\x01\x0f\x11\xb3\x29" } },
    .{ "AppCacheFreeDownloadList", MethodRecord{ .library = "WININET", .import = "AppCacheFreeDownloadList", .signature = "\x00\x01\x01\x0f\x11\xb3\x29" } },
    .{ "AppCacheFinalize", MethodRecord{ .library = "WININET", .import = "AppCacheFinalize", .signature = "\x00\x04\x09\x0f\x01\x0f\x05\x09\x0f\x11\xb3\x2d" } },
    .{ "AppCacheGetFallbackUrl", MethodRecord{ .library = "WININET", .import = "AppCacheGetFallbackUrl", .signature = "\x00\x03\x09\x0f\x01\x11\x05\x0f\x11\x05" } },
    .{ "AppCacheGetManifestUrl", MethodRecord{ .library = "WININET", .import = "AppCacheGetManifestUrl", .signature = "\x00\x02\x09\x0f\x01\x0f\x11\x05" } },
    .{ "AppCacheDuplicateHandle", MethodRecord{ .library = "WININET", .import = "AppCacheDuplicateHandle", .signature = "\x00\x02\x09\x0f\x01\x0f\x0f\x01" } },
    .{ "AppCacheCloseHandle", MethodRecord{ .library = "WININET", .import = "AppCacheCloseHandle", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "AppCacheFreeGroupList", MethodRecord{ .library = "WININET", .import = "AppCacheFreeGroupList", .signature = "\x00\x01\x01\x0f\x11\xb3\x31" } },
    .{ "AppCacheGetGroupList", MethodRecord{ .library = "WININET", .import = "AppCacheGetGroupList", .signature = "\x00\x01\x09\x0f\x11\xb3\x31" } },
    .{ "AppCacheGetInfo", MethodRecord{ .library = "WININET", .import = "AppCacheGetInfo", .signature = "\x00\x02\x09\x0f\x01\x0f\x11\xb3\x35" } },
    .{ "AppCacheDeleteGroup", MethodRecord{ .library = "WININET", .import = "AppCacheDeleteGroup", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "AppCacheFreeSpace", MethodRecord{ .library = "WININET", .import = "AppCacheFreeSpace", .signature = "\x00\x01\x09\x11\x80\x9d" } },
    .{ "AppCacheGetIEGroupList", MethodRecord{ .library = "WININET", .import = "AppCacheGetIEGroupList", .signature = "\x00\x01\x09\x0f\x11\xb3\x31" } },
    .{ "AppCacheDeleteIEGroup", MethodRecord{ .library = "WININET", .import = "AppCacheDeleteIEGroup", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "AppCacheFreeIESpace", MethodRecord{ .library = "WININET", .import = "AppCacheFreeIESpace", .signature = "\x00\x01\x09\x11\x80\x9d" } },
    .{ "AppCacheCreateAndCommitFile", MethodRecord{ .library = "WININET", .import = "AppCacheCreateAndCommitFile", .signature = "\x00\x05\x09\x0f\x01\x11\x05\x11\x05\x0f\x05\x09" } },
    .{ "HttpOpenDependencyHandle", MethodRecord{ .library = "WININET", .import = "HttpOpenDependencyHandle", .signature = "\x00\x03\x09\x0f\x01\x11\x59\x0f\x0f\x01" } },
    .{ "HttpCloseDependencyHandle", MethodRecord{ .library = "WININET", .import = "HttpCloseDependencyHandle", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "HttpDuplicateDependencyHandle", MethodRecord{ .library = "WININET", .import = "HttpDuplicateDependencyHandle", .signature = "\x00\x02\x09\x0f\x01\x0f\x0f\x01" } },
    .{ "HttpIndicatePageLoadComplete", MethodRecord{ .library = "WININET", .import = "HttpIndicatePageLoadComplete", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "UrlCacheFreeEntryInfo", MethodRecord{ .library = "WININET", .import = "UrlCacheFreeEntryInfo", .signature = "\x00\x01\x01\x0f\x11\xb3\x39" } },
    .{ "UrlCacheGetEntryInfo", MethodRecord{ .library = "WININET", .import = "UrlCacheGetEntryInfo", .signature = "\x00\x03\x09\x0f\x01\x11\x05\x0f\x11\xb3\x39" } },
    .{ "UrlCacheCloseEntryHandle", MethodRecord{ .library = "WININET", .import = "UrlCacheCloseEntryHandle", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "UrlCacheRetrieveEntryFile", MethodRecord{ .library = "WININET", .import = "UrlCacheRetrieveEntryFile", .signature = "\x00\x04\x09\x0f\x01\x11\x05\x0f\x11\xb3\x39\x0f\x0f\x01" } },
    .{ "UrlCacheReadEntryStream", MethodRecord{ .library = "WININET", .import = "UrlCacheReadEntryStream", .signature = "\x00\x05\x09\x0f\x01\x0b\x0f\x01\x09\x0f\x09" } },
    .{ "UrlCacheRetrieveEntryStream", MethodRecord{ .library = "WININET", .import = "UrlCacheRetrieveEntryStream", .signature = "\x00\x05\x09\x0f\x01\x11\x05\x11\x59\x0f\x11\xb3\x39\x0f\x0f\x01" } },
    .{ "UrlCacheUpdateEntryExtraData", MethodRecord{ .library = "WININET", .import = "UrlCacheUpdateEntryExtraData", .signature = "\x00\x04\x09\x0f\x01\x11\x05\x0f\x05\x09" } },
    .{ "UrlCacheCreateContainer", MethodRecord{ .library = "WININET", .import = "UrlCacheCreateContainer", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x0b\x09" } },
    .{ "UrlCacheCheckEntriesExist", MethodRecord{ .library = "WININET", .import = "UrlCacheCheckEntriesExist", .signature = "\x00\x03\x09\x0f\x11\x05\x09\x0f\x11\x59" } },
    .{ "UrlCacheGetContentPaths", MethodRecord{ .library = "WININET", .import = "UrlCacheGetContentPaths", .signature = "\x00\x02\x09\x0f\x0f\x11\x05\x0f\x09" } },
    .{ "UrlCacheGetGlobalLimit", MethodRecord{ .library = "WININET", .import = "UrlCacheGetGlobalLimit", .signature = "\x00\x02\x09\x11\xb3\x3d\x0f\x0b" } },
    .{ "UrlCacheSetGlobalLimit", MethodRecord{ .library = "WININET", .import = "UrlCacheSetGlobalLimit", .signature = "\x00\x02\x09\x11\xb3\x3d\x0b" } },
    .{ "UrlCacheReloadSettings", MethodRecord{ .library = "WININET", .import = "UrlCacheReloadSettings", .signature = "\x00\x00\x09" } },
    .{ "UrlCacheContainerSetEntryMaximumAge", MethodRecord{ .library = "WININET", .import = "UrlCacheContainerSetEntryMaximumAge", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "UrlCacheFindFirstEntry", MethodRecord{ .library = "WININET", .import = "UrlCacheFindFirstEntry", .signature = "\x00\x06\x09\x11\x05\x09\x09\x0a\x0f\x11\xb3\x39\x0f\x11\x80\x85" } },
    .{ "UrlCacheFindNextEntry", MethodRecord{ .library = "WININET", .import = "UrlCacheFindNextEntry", .signature = "\x00\x02\x09\x11\x80\x85\x0f\x11\xb3\x39" } },
    .{ "UrlCacheServer", MethodRecord{ .library = "WININET", .import = "UrlCacheServer", .signature = "\x00\x00\x09" } },
    .{ "ReadGuidsForConnectedNetworks", MethodRecord{ .library = "WININET", .import = "ReadGuidsForConnectedNetworks", .signature = "\x00\x06\x11\x59\x0f\x09\x0f\x0f\x11\x05\x0f\x0f\x11\x8d\x35\x0f\x0f\x11\x05\x0f\x09\x0f\x09" } },
    .{ "IsHostInProxyBypassList", MethodRecord{ .library = "WININET", .import = "IsHostInProxyBypassList", .signature = "\x00\x03\x11\x59\x11\xb3\x41\x11\x3d\x09" } },
    .{ "InternetFreeProxyInfoList", MethodRecord{ .library = "WININET", .import = "InternetFreeProxyInfoList", .signature = "\x00\x01\x01\x0f\x11\xb3\x45" } },
    .{ "InternetGetProxyForUrl", MethodRecord{ .library = "WININET", .import = "InternetGetProxyForUrl", .signature = "\x00\x03\x09\x0f\x01\x11\x05\x0f\x11\xb3\x45" } },
    .{ "DoConnectoidsExist", MethodRecord{ .library = "WININET", .import = "DoConnectoidsExist", .signature = "\x00\x00\x11\x59" } },
    .{ "GetDiskInfoA", MethodRecord{ .library = "WININET", .import = "GetDiskInfoA", .signature = "\x00\x04\x11\x59\x11\x3d\x0f\x09\x0f\x0b\x0f\x0b" } },
    .{ "PerformOperationOverUrlCacheA", MethodRecord{ .library = "WININET", .import = "PerformOperationOverUrlCacheA", .signature = "\x00\x09\x11\x59\x11\x3d\x09\x09\x0a\x0f\x01\x0f\x09\x0f\x01\x12\xb3\x49\x0f\x01" } },
    .{ "IsProfilesEnabled", MethodRecord{ .library = "WININET", .import = "IsProfilesEnabled", .signature = "\x00\x00\x11\x59" } },
    .{ "InternalInternetGetCookie", MethodRecord{ .library = "WININET", .import = "InternalInternetGetCookie", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "ImportCookieFileA", MethodRecord{ .library = "WININET", .import = "ImportCookieFileA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "ImportCookieFileW", MethodRecord{ .library = "WININET", .import = "ImportCookieFileW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "ExportCookieFileA", MethodRecord{ .library = "WININET", .import = "ExportCookieFileA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x59" } },
    .{ "ExportCookieFileW", MethodRecord{ .library = "WININET", .import = "ExportCookieFileW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x59" } },
    .{ "IsDomainLegalCookieDomainA", MethodRecord{ .library = "WININET", .import = "IsDomainLegalCookieDomainA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "IsDomainLegalCookieDomainW", MethodRecord{ .library = "WININET", .import = "IsDomainLegalCookieDomainW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "HttpWebSocketCompleteUpgrade", MethodRecord{ .library = "WININET", .import = "HttpWebSocketCompleteUpgrade", .signature = "\x00\x02\x0f\x01\x0f\x01\x19" } },
    .{ "HttpWebSocketSend", MethodRecord{ .library = "WININET", .import = "HttpWebSocketSend", .signature = "\x00\x04\x11\x59\x0f\x01\x11\xb3\x4d\x0f\x01\x09" } },
    .{ "HttpWebSocketReceive", MethodRecord{ .library = "WININET", .import = "HttpWebSocketReceive", .signature = "\x00\x05\x11\x59\x0f\x01\x0f\x01\x09\x0f\x09\x0f\x11\xb3\x4d" } },
    .{ "HttpWebSocketClose", MethodRecord{ .library = "WININET", .import = "HttpWebSocketClose", .signature = "\x00\x04\x11\x59\x0f\x01\x07\x0f\x01\x09" } },
    .{ "HttpWebSocketShutdown", MethodRecord{ .library = "WININET", .import = "HttpWebSocketShutdown", .signature = "\x00\x04\x11\x59\x0f\x01\x07\x0f\x01\x09" } },
    .{ "HttpWebSocketQueryCloseStatus", MethodRecord{ .library = "WININET", .import = "HttpWebSocketQueryCloseStatus", .signature = "\x00\x05\x11\x59\x0f\x01\x0f\x07\x0f\x01\x09\x0f\x09" } },
    .{ "InternetConvertUrlFromWireToWideChar", MethodRecord{ .library = "WININET", .import = "InternetConvertUrlFromWireToWideChar", .signature = "\x00\x08\x09\x11\x3d\x09\x11\x05\x09\x09\x11\x59\x09\x0f\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0xe5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "ALG_ID" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x645 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SYSTEMTIME" },
        0x661 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CHAIN_CONTEXT" },
        0xbc5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "WIN32_FIND_DATAA" },
        0xbc9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "WIN32_FIND_DATAW" },
        0xd35 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BSTR" },
        0x17a9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinHttp", .name = "WIN_HTTP_CREATE_URL_FLAGS" },
        0x17b9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "CACHE_CONFIG" },
        0x17bd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "FTP_FLAGS" },
        0x17c1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_CONNECTION" },
        0x17c5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "HTTP_ADDREQ_FLAG" },
        0x17c9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_COOKIE_FLAGS" },
        0x17cd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "PROXY_AUTO_DETECT_TYPE" },
        0x17d1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_AUTODIAL" },
        0x32c9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "URL_COMPONENTSA" },
        0x32cd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "URL_COMPONENTSW" },
        0x32d1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_BUFFERSA" },
        0x32d5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_BUFFERSW" },
        0x32d9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "LPINTERNET_STATUS_CALLBACK" },
        0x32dd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "GOPHER_FIND_DATAA" },
        0x32e1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "GOPHER_FIND_DATAW" },
        0x32e5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "GOPHER_ATTRIBUTE_ENUMERATOR" },
        0x32e9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_COOKIE2" },
        0x32ed => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_CACHE_ENTRY_INFOA" },
        0x32f1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_CACHE_ENTRY_INFOW" },
        0x32f5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_CACHE_GROUP_INFOA" },
        0x32f9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_CACHE_GROUP_INFOW" },
        0x32fd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "WPAD_CACHE_DELETE" },
        0x3301 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_SECURITY_INFO" },
        0x3305 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "HTTP_PUSH_TRANSPORT_SETTING" },
        0x3309 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "HTTP_PUSH_WAIT_HANDLE" },
        0x330d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "HTTP_PUSH_WAIT_TYPE" },
        0x3311 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "HTTP_PUSH_NOTIFICATION_STATUS" },
        0x3315 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_CACHE_CONTAINER_INFOA" },
        0x3319 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_CACHE_CONTAINER_INFOW" },
        0x331d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_CACHE_CONFIG_INFOA" },
        0x3321 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_CACHE_CONFIG_INFOW" },
        0x3325 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "APP_CACHE_STATE" },
        0x3329 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "APP_CACHE_DOWNLOAD_LIST" },
        0x332d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "APP_CACHE_FINALIZE_STATE" },
        0x3331 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "APP_CACHE_GROUP_LIST" },
        0x3335 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "APP_CACHE_GROUP_INFO" },
        0x3339 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "URLCACHE_ENTRY_INFO" },
        0x333d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "URL_CACHE_LIMIT_TYPE" },
        0x3341 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "INTERNET_SCHEME" },
        0x3345 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "WININET_PROXY_INFO_LIST" },
        0x3349 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "CACHE_OPERATOR" },
        0x334d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinInet", .name = "HTTP_WEB_SOCKET_BUFFER_TYPE" },
        else => null,
    };
}

pub const CACHE_CONFIG_FORCE_CLEANUP_FC = 32;
pub const CACHE_CONFIG_DISK_CACHE_PATHS_FC = 64;
pub const CACHE_CONFIG_SYNC_MODE_FC = 128;
pub const CACHE_CONFIG_CONTENT_PATHS_FC = 256;
pub const CACHE_CONFIG_HISTORY_PATHS_FC = 1024;
pub const CACHE_CONFIG_COOKIES_PATHS_FC = 512;
pub const CACHE_CONFIG_QUOTA_FC = 2048;
pub const CACHE_CONFIG_USER_MODE_FC = 4096;
pub const CACHE_CONFIG_CONTENT_USAGE_FC = 8192;
pub const CACHE_CONFIG_STICKY_CONTENT_USAGE_FC = 16384;
pub const FTP_TRANSFER_TYPE_ASCII = 1;
pub const FTP_TRANSFER_TYPE_BINARY = 2;
pub const FTP_TRANSFER_TYPE_UNKNOWN = 0;
pub const INTERNET_FLAG_TRANSFER_ASCII = 1;
pub const INTERNET_FLAG_TRANSFER_BINARY = 2;
pub const INTERNET_CONNECTION_CONFIGURED = 64;
pub const INTERNET_CONNECTION_LAN = 2;
pub const INTERNET_CONNECTION_MODEM = 1;
pub const INTERNET_CONNECTION_MODEM_BUSY = 8;
pub const INTERNET_CONNECTION_OFFLINE = 32;
pub const INTERNET_CONNECTION_PROXY = 4;
pub const INTERNET_RAS_INSTALLED = 16;
pub const HTTP_ADDREQ_FLAG_ADD = 536870912;
pub const HTTP_ADDREQ_FLAG_ADD_IF_NEW = 268435456;
pub const HTTP_ADDREQ_FLAG_COALESCE = 1073741824;
pub const HTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA = 1073741824;
pub const HTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON = 16777216;
pub const HTTP_ADDREQ_FLAG_REPLACE = 2147483648;
pub const INTERNET_COOKIE_HTTPONLY = 8192;
pub const INTERNET_COOKIE_THIRD_PARTY = 16;
pub const INTERNET_FLAG_RESTRICTED_ZONE = 131072;
pub const PROXY_AUTO_DETECT_TYPE_DHCP = 1;
pub const PROXY_AUTO_DETECT_TYPE_DNS_A = 2;
pub const INTERNET_AUTODIAL_FAILIFSECURITYCHECK = 4;
pub const INTERNET_AUTODIAL_FORCE_ONLINE = 1;
pub const INTERNET_AUTODIAL_FORCE_UNATTENDED = 2;
pub const INTERNET_AUTODIAL_OVERRIDE_NET_PRESENT = 8;
pub const GOPHER_TYPE_ASK = 1073741824;
pub const GOPHER_TYPE_BINARY = 512;
pub const GOPHER_TYPE_BITMAP = 16384;
pub const GOPHER_TYPE_CALENDAR = 524288;
pub const GOPHER_TYPE_CSO = 4;
pub const GOPHER_TYPE_DIRECTORY = 2;
pub const GOPHER_TYPE_DOS_ARCHIVE = 32;
pub const GOPHER_TYPE_ERROR = 8;
pub const GOPHER_TYPE_GIF = 4096;
pub const GOPHER_TYPE_GOPHER_PLUS = 2147483648;
pub const GOPHER_TYPE_HTML = 131072;
pub const GOPHER_TYPE_IMAGE = 8192;
pub const GOPHER_TYPE_INDEX_SERVER = 128;
pub const GOPHER_TYPE_INLINE = 1048576;
pub const GOPHER_TYPE_MAC_BINHEX = 16;
pub const GOPHER_TYPE_MOVIE = 32768;
pub const GOPHER_TYPE_PDF = 262144;
pub const GOPHER_TYPE_REDUNDANT = 1024;
pub const GOPHER_TYPE_SOUND = 65536;
pub const GOPHER_TYPE_TELNET = 256;
pub const GOPHER_TYPE_TEXT_FILE = 1;
pub const GOPHER_TYPE_TN3270 = 2048;
pub const GOPHER_TYPE_UNIX_UUENCODED = 64;
pub const GOPHER_TYPE_UNKNOWN = 536870912;
pub const INTERNET_PER_CONN_AUTOCONFIG_URL = 4;
pub const INTERNET_PER_CONN_AUTODISCOVERY_FLAGS = 5;
pub const INTERNET_PER_CONN_FLAGS = 1;
pub const INTERNET_PER_CONN_PROXY_BYPASS = 3;
pub const INTERNET_PER_CONN_PROXY_SERVER = 2;
pub const INTERNET_PER_CONN_AUTOCONFIG_SECONDARY_URL = 6;
pub const INTERNET_PER_CONN_AUTOCONFIG_RELOAD_DELAY_MINS = 7;
pub const INTERNET_PER_CONN_AUTOCONFIG_LAST_DETECT_TIME = 8;
pub const INTERNET_PER_CONN_AUTOCONFIG_LAST_DETECT_URL = 9;
pub const INTERNET_OPEN_TYPE_DIRECT = 1;
pub const INTERNET_OPEN_TYPE_PRECONFIG = 0;
pub const INTERNET_OPEN_TYPE_PROXY = 3;
pub const INTERNET_STATE_CONNECTED = 1;
pub const INTERNET_STATE_DISCONNECTED = 2;
pub const INTERNET_STATE_DISCONNECTED_BY_USER = 16;
pub const INTERNET_STATE_IDLE = 256;
pub const INTERNET_STATE_BUSY = 512;
pub const DIALENG_OperationComplete = 65536;
pub const DIALENG_RedialAttempt = 65537;
pub const DIALENG_RedialWait = 65538;
pub const INTERNET_INVALID_PORT_NUMBER = 0;
pub const INTERNET_DEFAULT_FTP_PORT = 21;
pub const INTERNET_DEFAULT_GOPHER_PORT = 70;
pub const INTERNET_DEFAULT_SOCKS_PORT = 1080;
pub const INTERNET_MAX_HOST_NAME_LENGTH = 256;
pub const INTERNET_MAX_USER_NAME_LENGTH = 128;
pub const INTERNET_MAX_PASSWORD_LENGTH = 128;
pub const INTERNET_MAX_PORT_NUMBER_LENGTH = 5;
pub const INTERNET_MAX_PORT_NUMBER_VALUE = 65535;
pub const INTERNET_KEEP_ALIVE_UNKNOWN = 4294967295;
pub const INTERNET_KEEP_ALIVE_ENABLED = 1;
pub const INTERNET_KEEP_ALIVE_DISABLED = 0;
pub const INTERNET_REQFLAG_FROM_CACHE = 1;
pub const INTERNET_REQFLAG_ASYNC = 2;
pub const INTERNET_REQFLAG_VIA_PROXY = 4;
pub const INTERNET_REQFLAG_NO_HEADERS = 8;
pub const INTERNET_REQFLAG_PASSIVE = 16;
pub const INTERNET_REQFLAG_CACHE_WRITE_DISABLED = 64;
pub const INTERNET_REQFLAG_NET_TIMEOUT = 128;
pub const INTERNET_FLAG_IDN_DIRECT = 1;
pub const INTERNET_FLAG_IDN_PROXY = 2;
pub const INTERNET_FLAG_RELOAD = 2147483648;
pub const INTERNET_FLAG_RAW_DATA = 1073741824;
pub const INTERNET_FLAG_EXISTING_CONNECT = 536870912;
pub const INTERNET_FLAG_ASYNC = 268435456;
pub const INTERNET_FLAG_PASSIVE = 134217728;
pub const INTERNET_FLAG_NO_CACHE_WRITE = 67108864;
pub const INTERNET_FLAG_DONT_CACHE = 67108864;
pub const INTERNET_FLAG_MAKE_PERSISTENT = 33554432;
pub const INTERNET_FLAG_FROM_CACHE = 16777216;
pub const INTERNET_FLAG_OFFLINE = 16777216;
pub const INTERNET_FLAG_SECURE = 8388608;
pub const INTERNET_FLAG_KEEP_CONNECTION = 4194304;
pub const INTERNET_FLAG_NO_AUTO_REDIRECT = 2097152;
pub const INTERNET_FLAG_READ_PREFETCH = 1048576;
pub const INTERNET_FLAG_NO_COOKIES = 524288;
pub const INTERNET_FLAG_NO_AUTH = 262144;
pub const INTERNET_FLAG_CACHE_IF_NET_FAIL = 65536;
pub const INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTP = 32768;
pub const INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTPS = 16384;
pub const INTERNET_FLAG_IGNORE_CERT_DATE_INVALID = 8192;
pub const INTERNET_FLAG_IGNORE_CERT_CN_INVALID = 4096;
pub const INTERNET_FLAG_RESYNCHRONIZE = 2048;
pub const INTERNET_FLAG_HYPERLINK = 1024;
pub const INTERNET_FLAG_NO_UI = 512;
pub const INTERNET_FLAG_PRAGMA_NOCACHE = 256;
pub const INTERNET_FLAG_CACHE_ASYNC = 128;
pub const INTERNET_FLAG_FORMS_SUBMIT = 64;
pub const INTERNET_FLAG_FWD_BACK = 32;
pub const INTERNET_FLAG_NEED_FILE = 16;
pub const INTERNET_FLAG_MUST_CACHE_REQUEST = 16;
pub const INTERNET_ERROR_MASK_INSERT_CDROM = 1;
pub const INTERNET_ERROR_MASK_COMBINED_SEC_CERT = 2;
pub const INTERNET_ERROR_MASK_NEED_MSN_SSPI_PKG = 4;
pub const INTERNET_ERROR_MASK_LOGIN_FAILURE_DISPLAY_ENTITY_BODY = 8;
pub const WININET_API_FLAG_ASYNC = 1;
pub const WININET_API_FLAG_SYNC = 4;
pub const WININET_API_FLAG_USE_CONTEXT = 8;
pub const INTERNET_NO_CALLBACK = 0;
pub const IDSI_FLAG_KEEP_ALIVE = 1;
pub const IDSI_FLAG_SECURE = 2;
pub const IDSI_FLAG_PROXY = 4;
pub const IDSI_FLAG_TUNNEL = 8;
pub const INTERNET_PER_CONN_FLAGS_UI = 10;
pub const PROXY_TYPE_DIRECT = 1;
pub const PROXY_TYPE_PROXY = 2;
pub const PROXY_TYPE_AUTO_PROXY_URL = 4;
pub const PROXY_TYPE_AUTO_DETECT = 8;
pub const AUTO_PROXY_FLAG_USER_SET = 1;
pub const AUTO_PROXY_FLAG_ALWAYS_DETECT = 2;
pub const AUTO_PROXY_FLAG_DETECTION_RUN = 4;
pub const AUTO_PROXY_FLAG_MIGRATED = 8;
pub const AUTO_PROXY_FLAG_DONT_CACHE_PROXY_RESULT = 16;
pub const AUTO_PROXY_FLAG_CACHE_INIT_RUN = 32;
pub const AUTO_PROXY_FLAG_DETECTION_SUSPECT = 64;
pub const ISO_FORCE_DISCONNECTED = 1;
pub const INTERNET_RFC1123_FORMAT = 0;
pub const INTERNET_RFC1123_BUFSIZE = 30;
pub const ICU_USERNAME = 1073741824;
pub const INTERNET_OPEN_TYPE_PRECONFIG_WITH_NO_AUTOPROXY = 4;
pub const INTERNET_SERVICE_FTP = 1;
pub const INTERNET_SERVICE_GOPHER = 2;
pub const INTERNET_SERVICE_HTTP = 3;
pub const IRF_ASYNC = 1;
pub const IRF_SYNC = 4;
pub const IRF_USE_CONTEXT = 8;
pub const IRF_NO_WAIT = 8;
pub const ISO_GLOBAL = 1;
pub const ISO_REGISTRY = 2;
pub const INTERNET_OPTION_CALLBACK = 1;
pub const INTERNET_OPTION_CONNECT_TIMEOUT = 2;
pub const INTERNET_OPTION_CONNECT_RETRIES = 3;
pub const INTERNET_OPTION_CONNECT_BACKOFF = 4;
pub const INTERNET_OPTION_SEND_TIMEOUT = 5;
pub const INTERNET_OPTION_CONTROL_SEND_TIMEOUT = 5;
pub const INTERNET_OPTION_RECEIVE_TIMEOUT = 6;
pub const INTERNET_OPTION_CONTROL_RECEIVE_TIMEOUT = 6;
pub const INTERNET_OPTION_DATA_SEND_TIMEOUT = 7;
pub const INTERNET_OPTION_DATA_RECEIVE_TIMEOUT = 8;
pub const INTERNET_OPTION_HANDLE_TYPE = 9;
pub const INTERNET_OPTION_LISTEN_TIMEOUT = 11;
pub const INTERNET_OPTION_READ_BUFFER_SIZE = 12;
pub const INTERNET_OPTION_WRITE_BUFFER_SIZE = 13;
pub const INTERNET_OPTION_ASYNC_ID = 15;
pub const INTERNET_OPTION_ASYNC_PRIORITY = 16;
pub const INTERNET_OPTION_PARENT_HANDLE = 21;
pub const INTERNET_OPTION_KEEP_CONNECTION = 22;
pub const INTERNET_OPTION_REQUEST_FLAGS = 23;
pub const INTERNET_OPTION_EXTENDED_ERROR = 24;
pub const INTERNET_OPTION_OFFLINE_MODE = 26;
pub const INTERNET_OPTION_CACHE_STREAM_HANDLE = 27;
pub const INTERNET_OPTION_USERNAME = 28;
pub const INTERNET_OPTION_PASSWORD = 29;
pub const INTERNET_OPTION_ASYNC = 30;
pub const INTERNET_OPTION_SECURITY_FLAGS = 31;
pub const INTERNET_OPTION_SECURITY_CERTIFICATE_STRUCT = 32;
pub const INTERNET_OPTION_DATAFILE_NAME = 33;
pub const INTERNET_OPTION_URL = 34;
pub const INTERNET_OPTION_SECURITY_CERTIFICATE = 35;
pub const INTERNET_OPTION_SECURITY_KEY_BITNESS = 36;
pub const INTERNET_OPTION_REFRESH = 37;
pub const INTERNET_OPTION_PROXY = 38;
pub const INTERNET_OPTION_SETTINGS_CHANGED = 39;
pub const INTERNET_OPTION_VERSION = 40;
pub const INTERNET_OPTION_USER_AGENT = 41;
pub const INTERNET_OPTION_END_BROWSER_SESSION = 42;
pub const INTERNET_OPTION_PROXY_USERNAME = 43;
pub const INTERNET_OPTION_PROXY_PASSWORD = 44;
pub const INTERNET_OPTION_CONTEXT_VALUE = 45;
pub const INTERNET_OPTION_CONNECT_LIMIT = 46;
pub const INTERNET_OPTION_SECURITY_SELECT_CLIENT_CERT = 47;
pub const INTERNET_OPTION_POLICY = 48;
pub const INTERNET_OPTION_DISCONNECTED_TIMEOUT = 49;
pub const INTERNET_OPTION_CONNECTED_STATE = 50;
pub const INTERNET_OPTION_IDLE_STATE = 51;
pub const INTERNET_OPTION_OFFLINE_SEMANTICS = 52;
pub const INTERNET_OPTION_SECONDARY_CACHE_KEY = 53;
pub const INTERNET_OPTION_CALLBACK_FILTER = 54;
pub const INTERNET_OPTION_CONNECT_TIME = 55;
pub const INTERNET_OPTION_SEND_THROUGHPUT = 56;
pub const INTERNET_OPTION_RECEIVE_THROUGHPUT = 57;
pub const INTERNET_OPTION_REQUEST_PRIORITY = 58;
pub const INTERNET_OPTION_HTTP_VERSION = 59;
pub const INTERNET_OPTION_RESET_URLCACHE_SESSION = 60;
pub const INTERNET_OPTION_ERROR_MASK = 62;
pub const INTERNET_OPTION_FROM_CACHE_TIMEOUT = 63;
pub const INTERNET_OPTION_BYPASS_EDITED_ENTRY = 64;
pub const INTERNET_OPTION_HTTP_DECODING = 65;
pub const INTERNET_OPTION_DIAGNOSTIC_SOCKET_INFO = 67;
pub const INTERNET_OPTION_CODEPAGE = 68;
pub const INTERNET_OPTION_CACHE_TIMESTAMPS = 69;
pub const INTERNET_OPTION_DISABLE_AUTODIAL = 70;
pub const INTERNET_OPTION_MAX_CONNS_PER_SERVER = 73;
pub const INTERNET_OPTION_MAX_CONNS_PER_1_0_SERVER = 74;
pub const INTERNET_OPTION_PER_CONNECTION_OPTION = 75;
pub const INTERNET_OPTION_DIGEST_AUTH_UNLOAD = 76;
pub const INTERNET_OPTION_IGNORE_OFFLINE = 77;
pub const INTERNET_OPTION_IDENTITY = 78;
pub const INTERNET_OPTION_REMOVE_IDENTITY = 79;
pub const INTERNET_OPTION_ALTER_IDENTITY = 80;
pub const INTERNET_OPTION_SUPPRESS_BEHAVIOR = 81;
pub const INTERNET_OPTION_AUTODIAL_MODE = 82;
pub const INTERNET_OPTION_AUTODIAL_CONNECTION = 83;
pub const INTERNET_OPTION_CLIENT_CERT_CONTEXT = 84;
pub const INTERNET_OPTION_AUTH_FLAGS = 85;
pub const INTERNET_OPTION_COOKIES_3RD_PARTY = 86;
pub const INTERNET_OPTION_DISABLE_PASSPORT_AUTH = 87;
pub const INTERNET_OPTION_SEND_UTF8_SERVERNAME_TO_PROXY = 88;
pub const INTERNET_OPTION_EXEMPT_CONNECTION_LIMIT = 89;
pub const INTERNET_OPTION_ENABLE_PASSPORT_AUTH = 90;
pub const INTERNET_OPTION_HIBERNATE_INACTIVE_WORKER_THREADS = 91;
pub const INTERNET_OPTION_ACTIVATE_WORKER_THREADS = 92;
pub const INTERNET_OPTION_RESTORE_WORKER_THREAD_DEFAULTS = 93;
pub const INTERNET_OPTION_SOCKET_SEND_BUFFER_LENGTH = 94;
pub const INTERNET_OPTION_PROXY_SETTINGS_CHANGED = 95;
pub const INTERNET_OPTION_DATAFILE_EXT = 96;
pub const INTERNET_OPTION_CODEPAGE_PATH = 100;
pub const INTERNET_OPTION_CODEPAGE_EXTRA = 101;
pub const INTERNET_OPTION_IDN = 102;
pub const INTERNET_OPTION_MAX_CONNS_PER_PROXY = 103;
pub const INTERNET_OPTION_SUPPRESS_SERVER_AUTH = 104;
pub const INTERNET_OPTION_SERVER_CERT_CHAIN_CONTEXT = 105;
pub const INTERNET_OPTION_ENABLE_REDIRECT_CACHE_READ = 122;
pub const INTERNET_OPTION_COMPRESSED_CONTENT_LENGTH = 147;
pub const INTERNET_OPTION_ENABLE_HTTP_PROTOCOL = 148;
pub const INTERNET_OPTION_HTTP_PROTOCOL_USED = 149;
pub const INTERNET_OPTION_ENCODE_EXTRA = 155;
pub const INTERNET_OPTION_HSTS = 157;
pub const INTERNET_OPTION_ENTERPRISE_CONTEXT = 159;
pub const INTERNET_OPTION_CONNECTION_FILTER = 162;
pub const INTERNET_OPTION_REFERER_TOKEN_BINDING_HOSTNAME = 163;
pub const INTERNET_OPTION_TOKEN_BINDING_PUBLIC_KEY = 181;
pub const INTERNET_OPTION_COOKIES_SAME_SITE_LEVEL = 187;
pub const INTERNET_OPTION_REQUEST_ANNOTATION = 193;
pub const INTERNET_FIRST_OPTION = 1;
pub const INTERNET_LAST_OPTION = 193;
pub const INTERNET_PRIORITY_FOREGROUND = 1000;
pub const HTTP_COOKIES_SAME_SITE_LEVEL_UNKNOWN = 0;
pub const HTTP_COOKIES_SAME_SITE_LEVEL_SAME_SITE = 1;
pub const HTTP_COOKIES_SAME_SITE_LEVEL_CROSS_SITE_LAX = 2;
pub const HTTP_COOKIES_SAME_SITE_LEVEL_CROSS_SITE = 3;
pub const HTTP_COOKIES_SAME_SITE_LEVEL_MAX = 3;
pub const HTTP_PROTOCOL_FLAG_HTTP2 = 2;
pub const HTTP_PROTOCOL_MASK = 2;
pub const INTERNET_OPTION_REQUEST_ANNOTATION_MAX_LENGTH = 64000;
pub const INTERNET_HANDLE_TYPE_INTERNET = 1;
pub const INTERNET_HANDLE_TYPE_CONNECT_FTP = 2;
pub const INTERNET_HANDLE_TYPE_CONNECT_GOPHER = 3;
pub const INTERNET_HANDLE_TYPE_CONNECT_HTTP = 4;
pub const INTERNET_HANDLE_TYPE_FTP_FIND = 5;
pub const INTERNET_HANDLE_TYPE_FTP_FIND_HTML = 6;
pub const INTERNET_HANDLE_TYPE_FTP_FILE = 7;
pub const INTERNET_HANDLE_TYPE_FTP_FILE_HTML = 8;
pub const INTERNET_HANDLE_TYPE_GOPHER_FIND = 9;
pub const INTERNET_HANDLE_TYPE_GOPHER_FIND_HTML = 10;
pub const INTERNET_HANDLE_TYPE_GOPHER_FILE = 11;
pub const INTERNET_HANDLE_TYPE_GOPHER_FILE_HTML = 12;
pub const INTERNET_HANDLE_TYPE_HTTP_REQUEST = 13;
pub const INTERNET_HANDLE_TYPE_FILE_REQUEST = 14;
pub const AUTH_FLAG_DISABLE_NEGOTIATE = 1;
pub const AUTH_FLAG_ENABLE_NEGOTIATE = 2;
pub const AUTH_FLAG_DISABLE_BASIC_CLEARCHANNEL = 4;
pub const AUTH_FLAG_DISABLE_SERVER_AUTH = 8;
pub const SECURITY_FLAG_UNKNOWNBIT = 2147483648;
pub const SECURITY_FLAG_FORTEZZA = 134217728;
pub const SECURITY_FLAG_NORMALBITNESS = 268435456;
pub const SECURITY_FLAG_SSL = 2;
pub const SECURITY_FLAG_SSL3 = 4;
pub const SECURITY_FLAG_PCT = 8;
pub const SECURITY_FLAG_PCT4 = 16;
pub const SECURITY_FLAG_IETFSSL4 = 32;
pub const SECURITY_FLAG_40BIT = 268435456;
pub const SECURITY_FLAG_128BIT = 536870912;
pub const SECURITY_FLAG_56BIT = 1073741824;
pub const SECURITY_FLAG_IGNORE_REVOCATION = 128;
pub const SECURITY_FLAG_IGNORE_WRONG_USAGE = 512;
pub const SECURITY_FLAG_IGNORE_REDIRECT_TO_HTTPS = 16384;
pub const SECURITY_FLAG_IGNORE_REDIRECT_TO_HTTP = 32768;
pub const SECURITY_FLAG_IGNORE_WEAK_SIGNATURE = 65536;
pub const SECURITY_FLAG_OPT_IN_WEAK_SIGNATURE = 131072;
pub const AUTODIAL_MODE_NEVER = 1;
pub const AUTODIAL_MODE_ALWAYS = 2;
pub const AUTODIAL_MODE_NO_NETWORK_PRESENT = 4;
pub const INTERNET_STATUS_RESOLVING_NAME = 10;
pub const INTERNET_STATUS_NAME_RESOLVED = 11;
pub const INTERNET_STATUS_CONNECTING_TO_SERVER = 20;
pub const INTERNET_STATUS_CONNECTED_TO_SERVER = 21;
pub const INTERNET_STATUS_SENDING_REQUEST = 30;
pub const INTERNET_STATUS_REQUEST_SENT = 31;
pub const INTERNET_STATUS_RECEIVING_RESPONSE = 40;
pub const INTERNET_STATUS_RESPONSE_RECEIVED = 41;
pub const INTERNET_STATUS_CTL_RESPONSE_RECEIVED = 42;
pub const INTERNET_STATUS_PREFETCH = 43;
pub const INTERNET_STATUS_CLOSING_CONNECTION = 50;
pub const INTERNET_STATUS_CONNECTION_CLOSED = 51;
pub const INTERNET_STATUS_HANDLE_CREATED = 60;
pub const INTERNET_STATUS_HANDLE_CLOSING = 70;
pub const INTERNET_STATUS_DETECTING_PROXY = 80;
pub const INTERNET_STATUS_REQUEST_COMPLETE = 100;
pub const INTERNET_STATUS_REDIRECT = 110;
pub const INTERNET_STATUS_INTERMEDIATE_RESPONSE = 120;
pub const INTERNET_STATUS_USER_INPUT_REQUIRED = 140;
pub const INTERNET_STATUS_STATE_CHANGE = 200;
pub const INTERNET_STATUS_COOKIE_SENT = 320;
pub const INTERNET_STATUS_COOKIE_RECEIVED = 321;
pub const INTERNET_STATUS_PRIVACY_IMPACTED = 324;
pub const INTERNET_STATUS_P3P_HEADER = 325;
pub const INTERNET_STATUS_P3P_POLICYREF = 326;
pub const INTERNET_STATUS_COOKIE_HISTORY = 327;
pub const MAX_GOPHER_DISPLAY_TEXT = 128;
pub const MAX_GOPHER_SELECTOR_TEXT = 256;
pub const MAX_GOPHER_HOST_NAME = 256;
pub const MAX_GOPHER_CATEGORY_NAME = 128;
pub const MAX_GOPHER_ATTRIBUTE_NAME = 128;
pub const MIN_GOPHER_ATTRIBUTE_LENGTH = 256;
pub const GOPHER_ATTRIBUTE_ID_BASE = 2882325504;
pub const GOPHER_CATEGORY_ID_ALL = 2882325505;
pub const GOPHER_CATEGORY_ID_INFO = 2882325506;
pub const GOPHER_CATEGORY_ID_ADMIN = 2882325507;
pub const GOPHER_CATEGORY_ID_VIEWS = 2882325508;
pub const GOPHER_CATEGORY_ID_ABSTRACT = 2882325509;
pub const GOPHER_CATEGORY_ID_VERONICA = 2882325510;
pub const GOPHER_CATEGORY_ID_ASK = 2882325511;
pub const GOPHER_CATEGORY_ID_UNKNOWN = 2882325512;
pub const GOPHER_ATTRIBUTE_ID_ALL = 2882325513;
pub const GOPHER_ATTRIBUTE_ID_ADMIN = 2882325514;
pub const GOPHER_ATTRIBUTE_ID_MOD_DATE = 2882325515;
pub const GOPHER_ATTRIBUTE_ID_TTL = 2882325516;
pub const GOPHER_ATTRIBUTE_ID_SCORE = 2882325517;
pub const GOPHER_ATTRIBUTE_ID_RANGE = 2882325518;
pub const GOPHER_ATTRIBUTE_ID_SITE = 2882325519;
pub const GOPHER_ATTRIBUTE_ID_ORG = 2882325520;
pub const GOPHER_ATTRIBUTE_ID_LOCATION = 2882325521;
pub const GOPHER_ATTRIBUTE_ID_GEOG = 2882325522;
pub const GOPHER_ATTRIBUTE_ID_TIMEZONE = 2882325523;
pub const GOPHER_ATTRIBUTE_ID_PROVIDER = 2882325524;
pub const GOPHER_ATTRIBUTE_ID_VERSION = 2882325525;
pub const GOPHER_ATTRIBUTE_ID_ABSTRACT = 2882325526;
pub const GOPHER_ATTRIBUTE_ID_VIEW = 2882325527;
pub const GOPHER_ATTRIBUTE_ID_TREEWALK = 2882325528;
pub const GOPHER_ATTRIBUTE_ID_UNKNOWN = 2882325529;
pub const HTTP_MAJOR_VERSION = 1;
pub const HTTP_MINOR_VERSION = 0;
pub const HTTP_QUERY_MIME_VERSION = 0;
pub const HTTP_QUERY_CONTENT_TYPE = 1;
pub const HTTP_QUERY_CONTENT_TRANSFER_ENCODING = 2;
pub const HTTP_QUERY_CONTENT_ID = 3;
pub const HTTP_QUERY_CONTENT_DESCRIPTION = 4;
pub const HTTP_QUERY_CONTENT_LENGTH = 5;
pub const HTTP_QUERY_CONTENT_LANGUAGE = 6;
pub const HTTP_QUERY_ALLOW = 7;
pub const HTTP_QUERY_PUBLIC = 8;
pub const HTTP_QUERY_DATE = 9;
pub const HTTP_QUERY_EXPIRES = 10;
pub const HTTP_QUERY_LAST_MODIFIED = 11;
pub const HTTP_QUERY_MESSAGE_ID = 12;
pub const HTTP_QUERY_URI = 13;
pub const HTTP_QUERY_DERIVED_FROM = 14;
pub const HTTP_QUERY_COST = 15;
pub const HTTP_QUERY_LINK = 16;
pub const HTTP_QUERY_PRAGMA = 17;
pub const HTTP_QUERY_VERSION = 18;
pub const HTTP_QUERY_STATUS_CODE = 19;
pub const HTTP_QUERY_STATUS_TEXT = 20;
pub const HTTP_QUERY_RAW_HEADERS = 21;
pub const HTTP_QUERY_RAW_HEADERS_CRLF = 22;
pub const HTTP_QUERY_CONNECTION = 23;
pub const HTTP_QUERY_ACCEPT = 24;
pub const HTTP_QUERY_ACCEPT_CHARSET = 25;
pub const HTTP_QUERY_ACCEPT_ENCODING = 26;
pub const HTTP_QUERY_ACCEPT_LANGUAGE = 27;
pub const HTTP_QUERY_AUTHORIZATION = 28;
pub const HTTP_QUERY_CONTENT_ENCODING = 29;
pub const HTTP_QUERY_FORWARDED = 30;
pub const HTTP_QUERY_FROM = 31;
pub const HTTP_QUERY_IF_MODIFIED_SINCE = 32;
pub const HTTP_QUERY_LOCATION = 33;
pub const HTTP_QUERY_ORIG_URI = 34;
pub const HTTP_QUERY_REFERER = 35;
pub const HTTP_QUERY_RETRY_AFTER = 36;
pub const HTTP_QUERY_SERVER = 37;
pub const HTTP_QUERY_TITLE = 38;
pub const HTTP_QUERY_USER_AGENT = 39;
pub const HTTP_QUERY_WWW_AUTHENTICATE = 40;
pub const HTTP_QUERY_PROXY_AUTHENTICATE = 41;
pub const HTTP_QUERY_ACCEPT_RANGES = 42;
pub const HTTP_QUERY_SET_COOKIE = 43;
pub const HTTP_QUERY_COOKIE = 44;
pub const HTTP_QUERY_REQUEST_METHOD = 45;
pub const HTTP_QUERY_REFRESH = 46;
pub const HTTP_QUERY_CONTENT_DISPOSITION = 47;
pub const HTTP_QUERY_AGE = 48;
pub const HTTP_QUERY_CACHE_CONTROL = 49;
pub const HTTP_QUERY_CONTENT_BASE = 50;
pub const HTTP_QUERY_CONTENT_LOCATION = 51;
pub const HTTP_QUERY_CONTENT_MD5 = 52;
pub const HTTP_QUERY_CONTENT_RANGE = 53;
pub const HTTP_QUERY_ETAG = 54;
pub const HTTP_QUERY_HOST = 55;
pub const HTTP_QUERY_IF_MATCH = 56;
pub const HTTP_QUERY_IF_NONE_MATCH = 57;
pub const HTTP_QUERY_IF_RANGE = 58;
pub const HTTP_QUERY_IF_UNMODIFIED_SINCE = 59;
pub const HTTP_QUERY_MAX_FORWARDS = 60;
pub const HTTP_QUERY_PROXY_AUTHORIZATION = 61;
pub const HTTP_QUERY_RANGE = 62;
pub const HTTP_QUERY_TRANSFER_ENCODING = 63;
pub const HTTP_QUERY_UPGRADE = 64;
pub const HTTP_QUERY_VARY = 65;
pub const HTTP_QUERY_VIA = 66;
pub const HTTP_QUERY_WARNING = 67;
pub const HTTP_QUERY_EXPECT = 68;
pub const HTTP_QUERY_PROXY_CONNECTION = 69;
pub const HTTP_QUERY_UNLESS_MODIFIED_SINCE = 70;
pub const HTTP_QUERY_ECHO_REQUEST = 71;
pub const HTTP_QUERY_ECHO_REPLY = 72;
pub const HTTP_QUERY_ECHO_HEADERS = 73;
pub const HTTP_QUERY_ECHO_HEADERS_CRLF = 74;
pub const HTTP_QUERY_PROXY_SUPPORT = 75;
pub const HTTP_QUERY_AUTHENTICATION_INFO = 76;
pub const HTTP_QUERY_PASSPORT_URLS = 77;
pub const HTTP_QUERY_PASSPORT_CONFIG = 78;
pub const HTTP_QUERY_X_CONTENT_TYPE_OPTIONS = 79;
pub const HTTP_QUERY_P3P = 80;
pub const HTTP_QUERY_X_P2P_PEERDIST = 81;
pub const HTTP_QUERY_TRANSLATE = 82;
pub const HTTP_QUERY_X_UA_COMPATIBLE = 83;
pub const HTTP_QUERY_DEFAULT_STYLE = 84;
pub const HTTP_QUERY_X_FRAME_OPTIONS = 85;
pub const HTTP_QUERY_X_XSS_PROTECTION = 86;
pub const HTTP_QUERY_SET_COOKIE2 = 87;
pub const HTTP_QUERY_DO_NOT_TRACK = 88;
pub const HTTP_QUERY_KEEP_ALIVE = 89;
pub const HTTP_QUERY_HTTP2_SETTINGS = 90;
pub const HTTP_QUERY_STRICT_TRANSPORT_SECURITY = 91;
pub const HTTP_QUERY_TOKEN_BINDING = 92;
pub const HTTP_QUERY_INCLUDE_REFERRED_TOKEN_BINDING_ID = 93;
pub const HTTP_QUERY_INCLUDE_REFERER_TOKEN_BINDING_ID = 93;
pub const HTTP_QUERY_PUBLIC_KEY_PINS = 94;
pub const HTTP_QUERY_PUBLIC_KEY_PINS_REPORT_ONLY = 95;
pub const HTTP_QUERY_MAX = 95;
pub const HTTP_QUERY_CUSTOM = 65535;
pub const HTTP_QUERY_FLAG_REQUEST_HEADERS = 2147483648;
pub const HTTP_QUERY_FLAG_SYSTEMTIME = 1073741824;
pub const HTTP_QUERY_FLAG_NUMBER = 536870912;
pub const HTTP_QUERY_FLAG_COALESCE = 268435456;
pub const HTTP_QUERY_FLAG_NUMBER64 = 134217728;
pub const HTTP_QUERY_FLAG_COALESCE_WITH_COMMA = 67108864;
pub const HTTP_STATUS_MISDIRECTED_REQUEST = 421;
pub const HTTP_ADDREQ_INDEX_MASK = 65535;
pub const HTTP_ADDREQ_FLAGS_MASK = 4294901760;
pub const HSR_ASYNC = 1;
pub const HSR_SYNC = 4;
pub const HSR_USE_CONTEXT = 8;
pub const HSR_INITIATE = 8;
pub const HSR_DOWNLOAD = 16;
pub const HSR_CHUNKED = 32;
pub const INTERNET_COOKIE_IS_SECURE = 1;
pub const INTERNET_COOKIE_IS_SESSION = 2;
pub const INTERNET_COOKIE_PROMPT_REQUIRED = 32;
pub const INTERNET_COOKIE_EVALUATE_P3P = 64;
pub const INTERNET_COOKIE_APPLY_P3P = 128;
pub const INTERNET_COOKIE_P3P_ENABLED = 256;
pub const INTERNET_COOKIE_IS_RESTRICTED = 512;
pub const INTERNET_COOKIE_IE6 = 1024;
pub const INTERNET_COOKIE_IS_LEGACY = 2048;
pub const INTERNET_COOKIE_NON_SCRIPT = 4096;
pub const INTERNET_COOKIE_HOST_ONLY = 16384;
pub const INTERNET_COOKIE_APPLY_HOST_ONLY = 32768;
pub const INTERNET_COOKIE_HOST_ONLY_APPLIED = 524288;
pub const INTERNET_COOKIE_SAME_SITE_STRICT = 1048576;
pub const INTERNET_COOKIE_SAME_SITE_LAX = 2097152;
pub const INTERNET_COOKIE_SAME_SITE_LEVEL_CROSS_SITE = 4194304;
pub const FLAG_ICC_FORCE_CONNECTION = 1;
pub const FLAGS_ERROR_UI_FILTER_FOR_ERRORS = 1;
pub const FLAGS_ERROR_UI_FLAGS_CHANGE_OPTIONS = 2;
pub const FLAGS_ERROR_UI_FLAGS_GENERATE_DATA = 4;
pub const FLAGS_ERROR_UI_FLAGS_NO_UI = 8;
pub const FLAGS_ERROR_UI_SERIALIZE_DIALOGS = 16;
pub const INTERNET_ERROR_BASE = 12000;
pub const ERROR_INTERNET_OUT_OF_HANDLES = 12001;
pub const ERROR_INTERNET_TIMEOUT = 12002;
pub const ERROR_INTERNET_EXTENDED_ERROR = 12003;
pub const ERROR_INTERNET_INTERNAL_ERROR = 12004;
pub const ERROR_INTERNET_INVALID_URL = 12005;
pub const ERROR_INTERNET_UNRECOGNIZED_SCHEME = 12006;
pub const ERROR_INTERNET_NAME_NOT_RESOLVED = 12007;
pub const ERROR_INTERNET_PROTOCOL_NOT_FOUND = 12008;
pub const ERROR_INTERNET_INVALID_OPTION = 12009;
pub const ERROR_INTERNET_BAD_OPTION_LENGTH = 12010;
pub const ERROR_INTERNET_OPTION_NOT_SETTABLE = 12011;
pub const ERROR_INTERNET_SHUTDOWN = 12012;
pub const ERROR_INTERNET_INCORRECT_USER_NAME = 12013;
pub const ERROR_INTERNET_INCORRECT_PASSWORD = 12014;
pub const ERROR_INTERNET_LOGIN_FAILURE = 12015;
pub const ERROR_INTERNET_INVALID_OPERATION = 12016;
pub const ERROR_INTERNET_OPERATION_CANCELLED = 12017;
pub const ERROR_INTERNET_INCORRECT_HANDLE_TYPE = 12018;
pub const ERROR_INTERNET_INCORRECT_HANDLE_STATE = 12019;
pub const ERROR_INTERNET_NOT_PROXY_REQUEST = 12020;
pub const ERROR_INTERNET_REGISTRY_VALUE_NOT_FOUND = 12021;
pub const ERROR_INTERNET_BAD_REGISTRY_PARAMETER = 12022;
pub const ERROR_INTERNET_NO_DIRECT_ACCESS = 12023;
pub const ERROR_INTERNET_NO_CONTEXT = 12024;
pub const ERROR_INTERNET_NO_CALLBACK = 12025;
pub const ERROR_INTERNET_REQUEST_PENDING = 12026;
pub const ERROR_INTERNET_INCORRECT_FORMAT = 12027;
pub const ERROR_INTERNET_ITEM_NOT_FOUND = 12028;
pub const ERROR_INTERNET_CANNOT_CONNECT = 12029;
pub const ERROR_INTERNET_CONNECTION_ABORTED = 12030;
pub const ERROR_INTERNET_CONNECTION_RESET = 12031;
pub const ERROR_INTERNET_FORCE_RETRY = 12032;
pub const ERROR_INTERNET_INVALID_PROXY_REQUEST = 12033;
pub const ERROR_INTERNET_NEED_UI = 12034;
pub const ERROR_INTERNET_HANDLE_EXISTS = 12036;
pub const ERROR_INTERNET_SEC_CERT_DATE_INVALID = 12037;
pub const ERROR_INTERNET_SEC_CERT_CN_INVALID = 12038;
pub const ERROR_INTERNET_HTTP_TO_HTTPS_ON_REDIR = 12039;
pub const ERROR_INTERNET_HTTPS_TO_HTTP_ON_REDIR = 12040;
pub const ERROR_INTERNET_MIXED_SECURITY = 12041;
pub const ERROR_INTERNET_CHG_POST_IS_NON_SECURE = 12042;
pub const ERROR_INTERNET_POST_IS_NON_SECURE = 12043;
pub const ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED = 12044;
pub const ERROR_INTERNET_INVALID_CA = 12045;
pub const ERROR_INTERNET_CLIENT_AUTH_NOT_SETUP = 12046;
pub const ERROR_INTERNET_ASYNC_THREAD_FAILED = 12047;
pub const ERROR_INTERNET_REDIRECT_SCHEME_CHANGE = 12048;
pub const ERROR_INTERNET_DIALOG_PENDING = 12049;
pub const ERROR_INTERNET_RETRY_DIALOG = 12050;
pub const ERROR_INTERNET_HTTPS_HTTP_SUBMIT_REDIR = 12052;
pub const ERROR_INTERNET_INSERT_CDROM = 12053;
pub const ERROR_INTERNET_FORTEZZA_LOGIN_NEEDED = 12054;
pub const ERROR_INTERNET_SEC_CERT_ERRORS = 12055;
pub const ERROR_INTERNET_SEC_CERT_NO_REV = 12056;
pub const ERROR_INTERNET_SEC_CERT_REV_FAILED = 12057;
pub const ERROR_HTTP_HSTS_REDIRECT_REQUIRED = 12060;
pub const ERROR_INTERNET_SEC_CERT_WEAK_SIGNATURE = 12062;
pub const ERROR_FTP_TRANSFER_IN_PROGRESS = 12110;
pub const ERROR_FTP_DROPPED = 12111;
pub const ERROR_FTP_NO_PASSIVE_MODE = 12112;
pub const ERROR_GOPHER_PROTOCOL_ERROR = 12130;
pub const ERROR_GOPHER_NOT_FILE = 12131;
pub const ERROR_GOPHER_DATA_ERROR = 12132;
pub const ERROR_GOPHER_END_OF_DATA = 12133;
pub const ERROR_GOPHER_INVALID_LOCATOR = 12134;
pub const ERROR_GOPHER_INCORRECT_LOCATOR_TYPE = 12135;
pub const ERROR_GOPHER_NOT_GOPHER_PLUS = 12136;
pub const ERROR_GOPHER_ATTRIBUTE_NOT_FOUND = 12137;
pub const ERROR_GOPHER_UNKNOWN_LOCATOR = 12138;
pub const ERROR_HTTP_HEADER_NOT_FOUND = 12150;
pub const ERROR_HTTP_DOWNLEVEL_SERVER = 12151;
pub const ERROR_HTTP_INVALID_SERVER_RESPONSE = 12152;
pub const ERROR_HTTP_INVALID_HEADER = 12153;
pub const ERROR_HTTP_INVALID_QUERY_REQUEST = 12154;
pub const ERROR_HTTP_HEADER_ALREADY_EXISTS = 12155;
pub const ERROR_HTTP_REDIRECT_FAILED = 12156;
pub const ERROR_HTTP_NOT_REDIRECTED = 12160;
pub const ERROR_HTTP_COOKIE_NEEDS_CONFIRMATION = 12161;
pub const ERROR_HTTP_COOKIE_DECLINED = 12162;
pub const ERROR_HTTP_REDIRECT_NEEDS_CONFIRMATION = 12168;
pub const ERROR_INTERNET_SECURITY_CHANNEL_ERROR = 12157;
pub const ERROR_INTERNET_UNABLE_TO_CACHE_FILE = 12158;
pub const ERROR_INTERNET_TCPIP_NOT_INSTALLED = 12159;
pub const ERROR_INTERNET_DISCONNECTED = 12163;
pub const ERROR_INTERNET_SERVER_UNREACHABLE = 12164;
pub const ERROR_INTERNET_PROXY_SERVER_UNREACHABLE = 12165;
pub const ERROR_INTERNET_BAD_AUTO_PROXY_SCRIPT = 12166;
pub const ERROR_INTERNET_UNABLE_TO_DOWNLOAD_SCRIPT = 12167;
pub const ERROR_INTERNET_SEC_INVALID_CERT = 12169;
pub const ERROR_INTERNET_SEC_CERT_REVOKED = 12170;
pub const ERROR_INTERNET_FAILED_DUETOSECURITYCHECK = 12171;
pub const ERROR_INTERNET_NOT_INITIALIZED = 12172;
pub const ERROR_INTERNET_NEED_MSN_SSPI_PKG = 12173;
pub const ERROR_INTERNET_LOGIN_FAILURE_DISPLAY_ENTITY_BODY = 12174;
pub const ERROR_INTERNET_DECODING_FAILED = 12175;
pub const ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED_PROXY = 12187;
pub const ERROR_INTERNET_SECURE_FAILURE_PROXY = 12188;
pub const ERROR_INTERNET_HTTP_PROTOCOL_MISMATCH = 12190;
pub const ERROR_INTERNET_GLOBAL_CALLBACK_FAILED = 12191;
pub const ERROR_INTERNET_FEATURE_DISABLED = 12192;
pub const INTERNET_ERROR_LAST = 12192;
pub const NORMAL_CACHE_ENTRY = 1;
pub const STICKY_CACHE_ENTRY = 4;
pub const EDITED_CACHE_ENTRY = 8;
pub const TRACK_OFFLINE_CACHE_ENTRY = 16;
pub const TRACK_ONLINE_CACHE_ENTRY = 32;
pub const SPARSE_CACHE_ENTRY = 65536;
pub const COOKIE_CACHE_ENTRY = 1048576;
pub const URLHISTORY_CACHE_ENTRY = 2097152;
pub const CACHEGROUP_ATTRIBUTE_GET_ALL = 4294967295;
pub const CACHEGROUP_ATTRIBUTE_BASIC = 1;
pub const CACHEGROUP_ATTRIBUTE_FLAG = 2;
pub const CACHEGROUP_ATTRIBUTE_TYPE = 4;
pub const CACHEGROUP_ATTRIBUTE_QUOTA = 8;
pub const CACHEGROUP_ATTRIBUTE_GROUPNAME = 16;
pub const CACHEGROUP_ATTRIBUTE_STORAGE = 32;
pub const CACHEGROUP_FLAG_NONPURGEABLE = 1;
pub const CACHEGROUP_FLAG_GIDONLY = 4;
pub const CACHEGROUP_FLAG_FLUSHURL_ONDELETE = 2;
pub const CACHEGROUP_SEARCH_ALL = 0;
pub const CACHEGROUP_SEARCH_BYURL = 1;
pub const CACHEGROUP_TYPE_INVALID = 1;
pub const GROUPNAME_MAX_LENGTH = 120;
pub const GROUP_OWNER_STORAGE_SIZE = 4;
pub const CACHE_ENTRY_ATTRIBUTE_FC = 4;
pub const CACHE_ENTRY_HITRATE_FC = 16;
pub const CACHE_ENTRY_MODTIME_FC = 64;
pub const CACHE_ENTRY_EXPTIME_FC = 128;
pub const CACHE_ENTRY_ACCTIME_FC = 256;
pub const CACHE_ENTRY_SYNCTIME_FC = 512;
pub const CACHE_ENTRY_HEADERINFO_FC = 1024;
pub const CACHE_ENTRY_EXEMPT_DELTA_FC = 2048;
pub const INTERNET_CACHE_GROUP_ADD = 0;
pub const INTERNET_CACHE_GROUP_REMOVE = 1;
pub const INTERNET_DIAL_FORCE_PROMPT = 8192;
pub const INTERNET_DIAL_SHOW_OFFLINE = 16384;
pub const INTERNET_DIAL_UNATTENDED = 32768;
pub const INTERENT_GOONLINE_REFRESH = 1;
pub const INTERENT_GOONLINE_NOPROMPT = 2;
pub const INTERENT_GOONLINE_MASK = 3;
pub const INTERNET_CUSTOMDIAL_CONNECT = 0;
pub const INTERNET_CUSTOMDIAL_UNATTENDED = 1;
pub const INTERNET_CUSTOMDIAL_DISCONNECT = 2;
pub const INTERNET_CUSTOMDIAL_SHOWOFFLINE = 4;
pub const INTERNET_CUSTOMDIAL_SAFE_FOR_UNATTENDED = 1;
pub const INTERNET_CUSTOMDIAL_WILL_SUPPLY_STATE = 2;
pub const INTERNET_CUSTOMDIAL_CAN_HANGUP = 4;
pub const INTERNET_DIALSTATE_DISCONNECTED = 1;
pub const INTERNET_IDENTITY_FLAG_PRIVATE_CACHE = 1;
pub const INTERNET_IDENTITY_FLAG_SHARED_CACHE = 2;
pub const INTERNET_IDENTITY_FLAG_CLEAR_DATA = 4;
pub const INTERNET_IDENTITY_FLAG_CLEAR_COOKIES = 8;
pub const INTERNET_IDENTITY_FLAG_CLEAR_HISTORY = 16;
pub const INTERNET_IDENTITY_FLAG_CLEAR_CONTENT = 32;
pub const INTERNET_SUPPRESS_RESET_ALL = 0;
pub const INTERNET_SUPPRESS_COOKIE_POLICY = 1;
pub const INTERNET_SUPPRESS_COOKIE_POLICY_RESET = 2;
pub const PRIVACY_TEMPLATE_NO_COOKIES = 0;
pub const PRIVACY_TEMPLATE_HIGH = 1;
pub const PRIVACY_TEMPLATE_MEDIUM_HIGH = 2;
pub const PRIVACY_TEMPLATE_MEDIUM = 3;
pub const PRIVACY_TEMPLATE_MEDIUM_LOW = 4;
pub const PRIVACY_TEMPLATE_LOW = 5;
pub const PRIVACY_TEMPLATE_CUSTOM = 100;
pub const PRIVACY_TEMPLATE_ADVANCED = 101;
pub const PRIVACY_TEMPLATE_MAX = 5;
pub const PRIVACY_TYPE_FIRST_PARTY = 0;
pub const PRIVACY_TYPE_THIRD_PARTY = 1;
pub const MAX_CACHE_ENTRY_INFO_SIZE = 4096;
pub const INTERNET_REQFLAG_FROM_APP_CACHE = 256;
pub const INTERNET_FLAG_BGUPDATE = 8;
pub const INTERNET_FLAG_FTP_FOLDER_VIEW = 4;
pub const INTERNET_PREFETCH_PROGRESS = 0;
pub const INTERNET_PREFETCH_COMPLETE = 1;
pub const INTERNET_PREFETCH_ABORTED = 2;
pub const ISO_FORCE_OFFLINE = 1;
pub const DLG_FLAGS_INVALID_CA = 16777216;
pub const DLG_FLAGS_SEC_CERT_CN_INVALID = 33554432;
pub const DLG_FLAGS_SEC_CERT_DATE_INVALID = 67108864;
pub const DLG_FLAGS_WEAK_SIGNATURE = 2097152;
pub const DLG_FLAGS_INSECURE_FALLBACK = 4194304;
pub const DLG_FLAGS_SEC_CERT_REV_FAILED = 8388608;
pub const INTERNET_SERVICE_URL = 0;
pub const INTERNET_OPTION_CONTEXT_VALUE_OLD = 10;
pub const INTERNET_OPTION_NET_SPEED = 61;
pub const INTERNET_OPTION_SECURITY_CONNECTION_INFO = 66;
pub const INTERNET_OPTION_DETECT_POST_SEND = 71;
pub const INTERNET_OPTION_DISABLE_NTLM_PREAUTH = 72;
pub const INTERNET_OPTION_ORIGINAL_CONNECT_FLAGS = 97;
pub const INTERNET_OPTION_CERT_ERROR_FLAGS = 98;
pub const INTERNET_OPTION_IGNORE_CERT_ERROR_FLAGS = 99;
pub const INTERNET_OPTION_SESSION_START_TIME = 106;
pub const INTERNET_OPTION_PROXY_CREDENTIALS = 107;
pub const INTERNET_OPTION_EXTENDED_CALLBACKS = 108;
pub const INTERNET_OPTION_PROXY_FROM_REQUEST = 109;
pub const INTERNET_OPTION_ALLOW_FAILED_CONNECT_CONTENT = 110;
pub const INTERNET_OPTION_CACHE_PARTITION = 111;
pub const INTERNET_OPTION_AUTODIAL_HWND = 112;
pub const INTERNET_OPTION_SERVER_CREDENTIALS = 113;
pub const INTERNET_OPTION_WPAD_SLEEP = 114;
pub const INTERNET_OPTION_FAIL_ON_CACHE_WRITE_ERROR = 115;
pub const INTERNET_OPTION_DOWNLOAD_MODE = 116;
pub const INTERNET_OPTION_RESPONSE_RESUMABLE = 117;
pub const INTERNET_OPTION_CM_HANDLE_COPY_REF = 118;
pub const INTERNET_OPTION_CONNECTION_INFO = 120;
pub const INTERNET_OPTION_BACKGROUND_CONNECTIONS = 121;
pub const INTERNET_OPTION_DO_NOT_TRACK = 123;
pub const INTERNET_OPTION_USE_MODIFIED_HEADER_FILTER = 124;
pub const INTERNET_OPTION_WWA_MODE = 125;
pub const INTERNET_OPTION_UPGRADE_TO_WEB_SOCKET = 126;
pub const INTERNET_OPTION_WEB_SOCKET_KEEPALIVE_INTERVAL = 127;
pub const INTERNET_OPTION_UNLOAD_NOTIFY_EVENT = 128;
pub const INTERNET_OPTION_SOCKET_NODELAY = 129;
pub const INTERNET_OPTION_APP_CACHE = 130;
pub const INTERNET_OPTION_DEPENDENCY_HANDLE = 131;
pub const INTERNET_OPTION_USE_FIRST_AVAILABLE_CONNECTION = 132;
pub const INTERNET_OPTION_TIMED_CONNECTION_LIMIT_BYPASS = 133;
pub const INTERNET_OPTION_WEB_SOCKET_CLOSE_TIMEOUT = 134;
pub const INTERNET_OPTION_FLUSH_STATE = 135;
pub const INTERNET_OPTION_DISALLOW_PREMATURE_EOF = 137;
pub const INTERNET_OPTION_SOCKET_NOTIFICATION_IOCTL = 138;
pub const INTERNET_OPTION_CACHE_ENTRY_EXTRA_DATA = 139;
pub const INTERNET_OPTION_MAX_QUERY_BUFFER_SIZE = 140;
pub const INTERNET_OPTION_FALSE_START = 141;
pub const INTERNET_OPTION_USER_PASS_SERVER_ONLY = 142;
pub const INTERNET_OPTION_SERVER_AUTH_SCHEME = 143;
pub const INTERNET_OPTION_PROXY_AUTH_SCHEME = 144;
pub const INTERNET_OPTION_TUNNEL_ONLY = 145;
pub const INTERNET_OPTION_SOURCE_PORT = 146;
pub const INTERNET_OPTION_ENABLE_DUO = 148;
pub const INTERNET_OPTION_DUO_USED = 149;
pub const INTERNET_OPTION_CHUNK_ENCODE_REQUEST = 150;
pub const INTERNET_OPTION_SECURE_FAILURE = 151;
pub const INTERNET_OPTION_NOTIFY_SENDING_COOKIE = 152;
pub const INTERNET_OPTION_CLIENT_CERT_ISSUER_LIST = 153;
pub const INTERNET_OPTION_RESET = 154;
pub const INTERNET_OPTION_SERVER_ADDRESS_INFO = 156;
pub const INTERNET_OPTION_ENABLE_WBOEXT = 158;
pub const INTERNET_OPTION_DISABLE_INSECURE_FALLBACK = 160;
pub const INTERNET_OPTION_ALLOW_INSECURE_FALLBACK = 161;
pub const INTERNET_OPTION_SET_IN_PRIVATE = 164;
pub const INTERNET_OPTION_DOWNLOAD_MODE_HANDLE = 165;
pub const INTERNET_OPTION_EDGE_COOKIES = 166;
pub const INTERNET_OPTION_NO_HTTP_SERVER_AUTH = 167;
pub const INTERNET_OPTION_ENABLE_HEADER_CALLBACKS = 168;
pub const INTERNET_OPTION_PRESERVE_REQUEST_SERVER_CREDENTIALS_ON_REDIRECT = 169;
pub const INTERNET_OPTION_PRESERVE_REFERER_ON_HTTPS_TO_HTTP_REDIRECT = 170;
pub const INTERNET_OPTION_TCP_FAST_OPEN = 171;
pub const INTERNET_OPTION_SYNC_MODE_AUTOMATIC_SESSION_DISABLED = 172;
pub const INTERNET_OPTION_ENABLE_ZLIB_DEFLATE = 173;
pub const INTERNET_OPTION_ENCODE_FALLBACK_FOR_REDIRECT_URI = 174;
pub const INTERNET_OPTION_EDGE_COOKIES_TEMP = 175;
pub const INTERNET_OPTION_OPT_IN_WEAK_SIGNATURE = 176;
pub const INTERNET_OPTION_PARSE_LINE_FOLDING = 177;
pub const INTERNET_OPTION_FORCE_DECODE = 178;
pub const INTERNET_OPTION_COOKIES_APPLY_HOST_ONLY = 179;
pub const INTERNET_OPTION_EDGE_MODE = 180;
pub const INTERNET_OPTION_CANCEL_CACHE_WRITE = 182;
pub const INTERNET_OPTION_AUTH_SCHEME_SELECTED = 183;
pub const INTERNET_OPTION_NOCACHE_WRITE_IN_PRIVATE = 184;
pub const INTERNET_OPTION_ACTIVITY_ID = 185;
pub const INTERNET_OPTION_REQUEST_TIMES = 186;
pub const INTERNET_OPTION_GLOBAL_CALLBACK = 188;
pub const INTERNET_OPTION_ENABLE_TEST_SIGNING = 189;
pub const INTERNET_OPTION_DISABLE_PROXY_LINK_LOCAL_NAME_RESOLUTION = 190;
pub const INTERNET_OPTION_HTTP_09 = 191;
pub const INTERNET_OPTION_CALLER_MODULE = 192;
pub const INTERNET_LAST_OPTION_INTERNAL = 193;
pub const INTERNET_OPTION_OFFLINE_TIMEOUT = 49;
pub const INTERNET_OPTION_LINE_STATE = 50;
pub const DUO_PROTOCOL_FLAG_SPDY3 = 1;
pub const DUO_PROTOCOL_MASK = 1;
pub const AUTH_FLAG_RESET = 0;
pub const INTERNET_AUTH_SCHEME_BASIC = 0;
pub const INTERNET_AUTH_SCHEME_DIGEST = 1;
pub const INTERNET_AUTH_SCHEME_NTLM = 2;
pub const INTERNET_AUTH_SCHEME_KERBEROS = 3;
pub const INTERNET_AUTH_SCHEME_NEGOTIATE = 4;
pub const INTERNET_AUTH_SCHEME_PASSPORT = 5;
pub const INTERNET_AUTH_SCHEME_UNKNOWN = 6;
pub const INTERNET_STATUS_SENDING_COOKIE = 328;
pub const INTERNET_STATUS_REQUEST_HEADERS_SET = 329;
pub const INTERNET_STATUS_RESPONSE_HEADERS_SET = 330;
pub const INTERNET_STATUS_PROXY_CREDENTIALS = 400;
pub const INTERNET_STATUS_SERVER_CREDENTIALS = 401;
pub const INTERNET_STATUS_SERVER_CONNECTION_STATE = 410;
pub const INTERNET_STATUS_END_BROWSER_SESSION = 420;
pub const INTERNET_STATUS_COOKIE = 430;
pub const COOKIE_STATE_LB = 0;
pub const COOKIE_STATE_UB = 5;
pub const MaxPrivacySettings = 16384;
pub const INTERNET_STATUS_FILTER_RESOLVING = 1;
pub const INTERNET_STATUS_FILTER_RESOLVED = 2;
pub const INTERNET_STATUS_FILTER_CONNECTING = 4;
pub const INTERNET_STATUS_FILTER_CONNECTED = 8;
pub const INTERNET_STATUS_FILTER_SENDING = 16;
pub const INTERNET_STATUS_FILTER_SENT = 32;
pub const INTERNET_STATUS_FILTER_RECEIVING = 64;
pub const INTERNET_STATUS_FILTER_RECEIVED = 128;
pub const INTERNET_STATUS_FILTER_CLOSING = 256;
pub const INTERNET_STATUS_FILTER_CLOSED = 512;
pub const INTERNET_STATUS_FILTER_HANDLE_CREATED = 1024;
pub const INTERNET_STATUS_FILTER_HANDLE_CLOSING = 2048;
pub const INTERNET_STATUS_FILTER_PREFETCH = 4096;
pub const INTERNET_STATUS_FILTER_REDIRECT = 8192;
pub const INTERNET_STATUS_FILTER_STATE_CHANGE = 16384;
pub const HTTP_ADDREQ_FLAG_RESPONSE_HEADERS = 33554432;
pub const HTTP_ADDREQ_FLAG_ALLOW_EMPTY_VALUES = 67108864;
pub const COOKIE_DONT_ALLOW = 1;
pub const COOKIE_ALLOW = 2;
pub const COOKIE_ALLOW_ALL = 4;
pub const COOKIE_DONT_ALLOW_ALL = 8;
pub const COOKIE_OP_SET = 1;
pub const COOKIE_OP_MODIFY = 2;
pub const COOKIE_OP_GET = 4;
pub const COOKIE_OP_SESSION = 8;
pub const COOKIE_OP_PERSISTENT = 16;
pub const COOKIE_OP_3RD_PARTY = 32;
pub const INTERNET_COOKIE_PERSISTENT_HOST_ONLY = 65536;
pub const INTERNET_COOKIE_RESTRICTED_ZONE = 131072;
pub const INTERNET_COOKIE_EDGE_COOKIES = 262144;
pub const INTERNET_COOKIE_ALL_COOKIES = 536870912;
pub const INTERNET_COOKIE_NO_CALLBACK = 1073741824;
pub const INTERNET_COOKIE_ECTX_3RDPARTY = 2147483648;
pub const FLAGS_ERROR_UI_SHOW_IDN_HOSTNAME = 32;
pub const ERROR_INTERNET_NO_NEW_CONTAINERS = 12051;
pub const ERROR_INTERNET_SOURCE_PORT_IN_USE = 12058;
pub const ERROR_INTERNET_INSECURE_FALLBACK_REQUIRED = 12059;
pub const ERROR_INTERNET_PROXY_ALERT = 12061;
pub const ERROR_INTERNET_NO_CM_CONNECTION = 12080;
pub const ERROR_HTTP_PUSH_STATUS_CODE_NOT_SUPPORTED = 12147;
pub const ERROR_HTTP_PUSH_RETRY_NOT_SUPPORTED = 12148;
pub const ERROR_HTTP_PUSH_ENABLE_FAILED = 12149;
pub const ERROR_INTERNET_DISALLOW_INPRIVATE = 12189;
pub const ERROR_INTERNET_OFFLINE = 12163;
pub const INTERNET_INTERNAL_ERROR_BASE = 12900;
pub const ERROR_INTERNET_INTERNAL_SOCKET_ERROR = 12901;
pub const ERROR_INTERNET_CONNECTION_AVAILABLE = 12902;
pub const ERROR_INTERNET_NO_KNOWN_SERVERS = 12903;
pub const ERROR_INTERNET_PING_FAILED = 12904;
pub const ERROR_INTERNET_NO_PING_SUPPORT = 12905;
pub const ERROR_INTERNET_CACHE_SUCCESS = 12906;
pub const ERROR_HTTP_COOKIE_NEEDS_CONFIRMATION_EX = 12907;
pub const HTTP_1_1_CACHE_ENTRY = 64;
pub const STATIC_CACHE_ENTRY = 128;
pub const MUST_REVALIDATE_CACHE_ENTRY = 256;
pub const SHORTPATH_CACHE_ENTRY = 512;
pub const DOWNLOAD_CACHE_ENTRY = 1024;
pub const REDIRECT_CACHE_ENTRY = 2048;
pub const COOKIE_ACCEPTED_CACHE_ENTRY = 4096;
pub const COOKIE_LEASHED_CACHE_ENTRY = 8192;
pub const COOKIE_DOWNGRADED_CACHE_ENTRY = 16384;
pub const COOKIE_REJECTED_CACHE_ENTRY = 32768;
pub const PRIVACY_MODE_CACHE_ENTRY = 131072;
pub const XDR_CACHE_ENTRY = 262144;
pub const IMMUTABLE_CACHE_ENTRY = 524288;
pub const PENDING_DELETE_CACHE_ENTRY = 4194304;
pub const OTHER_USER_CACHE_ENTRY = 8388608;
pub const PRIVACY_IMPACTED_CACHE_ENTRY = 33554432;
pub const POST_RESPONSE_CACHE_ENTRY = 67108864;
pub const INSTALLED_CACHE_ENTRY = 268435456;
pub const POST_CHECK_CACHE_ENTRY = 536870912;
pub const IDENTITY_CACHE_ENTRY = 2147483648;
pub const ANY_CACHE_ENTRY = 4294967295;
pub const CACHEGROUP_FLAG_VALID = 7;
pub const CACHEGROUP_ID_BUILTIN_STICKY = 1152921504606846983;
pub const INTERNET_CACHE_FLAG_ALLOW_COLLISIONS = 256;
pub const INTERNET_CACHE_FLAG_INSTALLED_ENTRY = 512;
pub const INTERNET_CACHE_FLAG_ENTRY_OR_MAPPING = 1024;
pub const INTERNET_CACHE_FLAG_ADD_FILENAME_ONLY = 2048;
pub const INTERNET_CACHE_FLAG_GET_STRUCT_ONLY = 4096;
pub const CACHE_ENTRY_TYPE_FC = 4096;
pub const CACHE_ENTRY_MODIFY_DATA_FC = 2147483648;
pub const INTERNET_CACHE_CONTAINER_NOSUBDIRS = 1;
pub const INTERNET_CACHE_CONTAINER_AUTODELETE = 2;
pub const INTERNET_CACHE_CONTAINER_RESERVED1 = 4;
pub const INTERNET_CACHE_CONTAINER_NODESKTOPINIT = 8;
pub const INTERNET_CACHE_CONTAINER_MAP_ENABLED = 16;
pub const INTERNET_CACHE_CONTAINER_BLOOM_FILTER = 32;
pub const INTERNET_CACHE_CONTAINER_SHARE_READ = 256;
pub const INTERNET_CACHE_CONTAINER_SHARE_READ_WRITE = 768;
pub const CACHE_FIND_CONTAINER_RETURN_NOCHANGE = 1;
pub const CACHE_HEADER_DATA_CURRENT_SETTINGS_VERSION = 0;
pub const CACHE_HEADER_DATA_CONLIST_CHANGE_COUNT = 1;
pub const CACHE_HEADER_DATA_COOKIE_CHANGE_COUNT = 2;
pub const CACHE_HEADER_DATA_NOTIFICATION_HWND = 3;
pub const CACHE_HEADER_DATA_NOTIFICATION_MESG = 4;
pub const CACHE_HEADER_DATA_ROOTGROUP_OFFSET = 5;
pub const CACHE_HEADER_DATA_GID_LOW = 6;
pub const CACHE_HEADER_DATA_GID_HIGH = 7;
pub const CACHE_HEADER_DATA_LAST_SCAVENGE_TIMESTAMP = 8;
pub const CACHE_HEADER_DATA_CACHE_READ_COUNT_SINCE_LAST_SCAVENGE = 9;
pub const CACHE_HEADER_DATA_CACHE_WRITE_COUNT_SINCE_LAST_SCAVENGE = 10;
pub const CACHE_HEADER_DATA_HSTS_CHANGE_COUNT = 11;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_12 = 12;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_13 = 13;
pub const CACHE_HEADER_DATA_SSL_STATE_COUNT = 14;
pub const CACHE_HEADER_DATA_DOWNLOAD_PARTIAL = 14;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_15 = 15;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_16 = 16;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_17 = 17;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_18 = 18;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_19 = 19;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_20 = 20;
pub const CACHE_HEADER_DATA_NOTIFICATION_FILTER = 21;
pub const CACHE_HEADER_DATA_ROOT_LEAK_OFFSET = 22;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_23 = 23;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_24 = 24;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_25 = 25;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_26 = 26;
pub const CACHE_HEADER_DATA_ROOT_GROUPLIST_OFFSET = 27;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_28 = 28;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_29 = 29;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_30 = 30;
pub const CACHE_HEADER_DATA_CACHE_RESERVED_31 = 31;
pub const CACHE_HEADER_DATA_LAST = 31;
pub const CACHE_NOTIFY_ADD_URL = 1;
pub const CACHE_NOTIFY_DELETE_URL = 2;
pub const CACHE_NOTIFY_UPDATE_URL = 4;
pub const CACHE_NOTIFY_DELETE_ALL = 8;
pub const CACHE_NOTIFY_URL_SET_STICKY = 16;
pub const CACHE_NOTIFY_URL_UNSET_STICKY = 32;
pub const CACHE_NOTIFY_SET_ONLINE = 256;
pub const CACHE_NOTIFY_SET_OFFLINE = 512;
pub const CACHE_NOTIFY_FILTER_CHANGED = 268435456;
pub const APP_CACHE_LOOKUP_NO_MASTER_ONLY = 1;
pub const APP_CACHE_ENTRY_TYPE_MASTER = 1;
pub const APP_CACHE_ENTRY_TYPE_EXPLICIT = 2;
pub const APP_CACHE_ENTRY_TYPE_FALLBACK = 4;
pub const APP_CACHE_ENTRY_TYPE_FOREIGN = 8;
pub const APP_CACHE_ENTRY_TYPE_MANIFEST = 16;
pub const CACHE_CONFIG_CONTENT_QUOTA_FC = 32768;
pub const CACHE_CONFIG_TOTAL_CONTENT_QUOTA_FC = 65536;
pub const CACHE_CONFIG_APPCONTAINER_CONTENT_QUOTA_FC = 131072;
pub const CACHE_CONFIG_APPCONTAINER_TOTAL_CONTENT_QUOTA_FC = 262144;
pub const INTERNET_AUTOPROXY_INIT_DEFAULT = 1;
pub const INTERNET_AUTOPROXY_INIT_DOWNLOADSYNC = 2;
pub const INTERNET_AUTOPROXY_INIT_QUERYSTATE = 4;
pub const INTERNET_AUTOPROXY_INIT_ONLYQUERY = 8;
pub const INTERNET_SUPPRESS_COOKIE_PERSIST = 3;
pub const INTERNET_SUPPRESS_COOKIE_PERSIST_RESET = 4;
pub const HTTP_WEB_SOCKET_MAX_CLOSE_REASON_LENGTH = 123;
pub const HTTP_WEB_SOCKET_MIN_KEEPALIVE_VALUE = 10000;
pub const INTERNET_GLOBAL_CALLBACK_SENDING_HTTP_HEADERS = 1;
pub const INTERNET_GLOBAL_CALLBACK_DETECTING_PROXY = 2;
pub const INTERNET_SCHEME_PARTIAL = -2;
pub const INTERNET_SCHEME_UNKNOWN = -1;
pub const INTERNET_SCHEME_DEFAULT = 0;
pub const INTERNET_SCHEME_FTP = 1;
pub const INTERNET_SCHEME_GOPHER = 2;
pub const INTERNET_SCHEME_HTTP = 3;
pub const INTERNET_SCHEME_HTTPS = 4;
pub const INTERNET_SCHEME_FILE = 5;
pub const INTERNET_SCHEME_NEWS = 6;
pub const INTERNET_SCHEME_MAILTO = 7;
pub const INTERNET_SCHEME_SOCKS = 8;
pub const INTERNET_SCHEME_JAVASCRIPT = 9;
pub const INTERNET_SCHEME_VBSCRIPT = 10;
pub const INTERNET_SCHEME_RES = 11;
pub const INTERNET_SCHEME_FIRST = 1;
pub const INTERNET_SCHEME_LAST = 11;
pub const COOKIE_STATE_UNKNOWN = 0;
pub const COOKIE_STATE_ACCEPT = 1;
pub const COOKIE_STATE_PROMPT = 2;
pub const COOKIE_STATE_LEASH = 3;
pub const COOKIE_STATE_DOWNGRADE = 4;
pub const COOKIE_STATE_REJECT = 5;
pub const COOKIE_STATE_MAX = 5;
pub const WPAD_CACHE_DELETE_CURRENT = 0;
pub const WPAD_CACHE_DELETE_ALL = 1;
pub const FORTCMD_LOGON = 1;
pub const FORTCMD_LOGOFF = 2;
pub const FORTCMD_CHG_PERSONALITY = 3;
pub const FORTSTAT_INSTALLED = 1;
pub const FORTSTAT_LOGGEDON = 2;
pub const NameResolutionStart = 0;
pub const NameResolutionEnd = 1;
pub const ConnectionEstablishmentStart = 2;
pub const ConnectionEstablishmentEnd = 3;
pub const TLSHandshakeStart = 4;
pub const TLSHandshakeEnd = 5;
pub const HttpRequestTimeMax = 32;
pub const HttpPushWaitEnableComplete = 0;
pub const HttpPushWaitReceiveComplete = 1;
pub const HttpPushWaitSendComplete = 2;
pub const WININET_SYNC_MODE_NEVER = 0;
pub const WININET_SYNC_MODE_ON_EXPIRY = 1;
pub const WININET_SYNC_MODE_ONCE_PER_SESSION = 2;
pub const WININET_SYNC_MODE_ALWAYS = 3;
pub const WININET_SYNC_MODE_AUTOMATIC = 4;
pub const WININET_SYNC_MODE_DEFAULT = 4;
pub const AppCacheStateNoUpdateNeeded = 0;
pub const AppCacheStateUpdateNeeded = 1;
pub const AppCacheStateUpdateNeededNew = 2;
pub const AppCacheStateUpdateNeededMasterOnly = 3;
pub const AppCacheFinalizeStateIncomplete = 0;
pub const AppCacheFinalizeStateManifestChange = 1;
pub const AppCacheFinalizeStateComplete = 2;
pub const UrlCacheLimitTypeIE = 0;
pub const UrlCacheLimitTypeIETotal = 1;
pub const UrlCacheLimitTypeAppContainer = 2;
pub const UrlCacheLimitTypeAppContainerTotal = 3;
pub const UrlCacheLimitTypeNum = 4;
pub const HTTP_WEB_SOCKET_SEND_OPERATION = 0;
pub const HTTP_WEB_SOCKET_RECEIVE_OPERATION = 1;
pub const HTTP_WEB_SOCKET_CLOSE_OPERATION = 2;
pub const HTTP_WEB_SOCKET_SHUTDOWN_OPERATION = 3;
pub const HTTP_WEB_SOCKET_BINARY_MESSAGE_TYPE = 0;
pub const HTTP_WEB_SOCKET_BINARY_FRAGMENT_TYPE = 1;
pub const HTTP_WEB_SOCKET_UTF8_MESSAGE_TYPE = 2;
pub const HTTP_WEB_SOCKET_UTF8_FRAGMENT_TYPE = 3;
pub const HTTP_WEB_SOCKET_CLOSE_TYPE = 4;
pub const HTTP_WEB_SOCKET_PING_TYPE = 5;
pub const HTTP_WEB_SOCKET_SUCCESS_CLOSE_STATUS = 1000;
pub const HTTP_WEB_SOCKET_ENDPOINT_TERMINATED_CLOSE_STATUS = 1001;
pub const HTTP_WEB_SOCKET_PROTOCOL_ERROR_CLOSE_STATUS = 1002;
pub const HTTP_WEB_SOCKET_INVALID_DATA_TYPE_CLOSE_STATUS = 1003;
pub const HTTP_WEB_SOCKET_EMPTY_CLOSE_STATUS = 1005;
pub const HTTP_WEB_SOCKET_ABORTED_CLOSE_STATUS = 1006;
pub const HTTP_WEB_SOCKET_INVALID_PAYLOAD_CLOSE_STATUS = 1007;
pub const HTTP_WEB_SOCKET_POLICY_VIOLATION_CLOSE_STATUS = 1008;
pub const HTTP_WEB_SOCKET_MESSAGE_TOO_BIG_CLOSE_STATUS = 1009;
pub const HTTP_WEB_SOCKET_UNSUPPORTED_EXTENSIONS_CLOSE_STATUS = 1010;
pub const HTTP_WEB_SOCKET_SERVER_ERROR_CLOSE_STATUS = 1011;
pub const HTTP_WEB_SOCKET_SECURE_HANDSHAKE_ERROR_CLOSE_STATUS = 1015;
pub const POLICY_EXTENSION_TYPE_NONE = 0;
pub const POLICY_EXTENSION_TYPE_WINHTTP = 1;
pub const POLICY_EXTENSION_TYPE_WININET = 2;
pub const POLICY_EXTENSION_VERSION1 = 1;
pub const PROOF_OF_POSSESSION_DEFAULT = 0;
pub const PROOF_OF_POSSESSION_ALLOW_SILENT_REQUESTS = 1;

pub const aliases = struct {
    pub const CACHE_CONFIG = u32;
    pub const FTP_FLAGS = u32;
    pub const INTERNET_CONNECTION = u32;
    pub const HTTP_ADDREQ_FLAG = u32;
    pub const INTERNET_COOKIE_FLAGS = u32;
    pub const PROXY_AUTO_DETECT_TYPE = u32;
    pub const INTERNET_AUTODIAL = u32;
    pub const GOPHER_TYPE = u32;
    pub const INTERNET_PER_CONN = u32;
    pub const INTERNET_ACCESS_TYPE = u32;
    pub const INTERNET_STATE = u32;
    pub const INTERNET_SCHEME = i32;
    pub const InternetCookieState = i32;
    pub const WPAD_CACHE_DELETE = i32;
    pub const FORTCMD = i32;
    pub const FORTSTAT = i32;
    pub const REQUEST_TIMES = i32;
    pub const HTTP_PUSH_WAIT_TYPE = i32;
    pub const WININET_SYNC_MODE = i32;
    pub const APP_CACHE_STATE = i32;
    pub const APP_CACHE_FINALIZE_STATE = i32;
    pub const URL_CACHE_LIMIT_TYPE = i32;
    pub const HTTP_WEB_SOCKET_OPERATION = i32;
    pub const HTTP_WEB_SOCKET_BUFFER_TYPE = i32;
    pub const HTTP_WEB_SOCKET_CLOSE_STATUS = i32;
    pub const HTTP_POLICY_EXTENSION_TYPE = i32;
    pub const HTTP_POLICY_EXTENSION_VERSION = i32;
    pub const PROOF_OF_POSSESSION_FLAGS = u32;
    pub const HTTP_PUSH_WAIT_HANDLE = ?*anyopaque;
    pub const LPINTERNET_STATUS_CALLBACK = ?*const anyopaque;
    pub const GOPHER_ATTRIBUTE_ENUMERATOR = ?*const anyopaque;
    pub const PFN_AUTH_NOTIFY = ?*const anyopaque;
    pub const pfnInternetInitializeAutoProxyDll = ?*const anyopaque;
    pub const pfnInternetDeInitializeAutoProxyDll = ?*const anyopaque;
    pub const pfnInternetGetProxyInfo = ?*const anyopaque;
    pub const PFN_DIAL_HANDLER = ?*const anyopaque;
    pub const CACHE_OPERATOR = ?*const anyopaque;
    pub const HTTP_POLICY_EXTENSION_INIT = ?*const anyopaque;
    pub const HTTP_POLICY_EXTENSION_SHUTDOWN = ?*const anyopaque;
};
