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
    .{ "CreateURLMoniker", MethodRecord{ .library = "urlmon", .import = "CreateURLMoniker", .signature = "\x00\x03\x11\x79\x12\x82\xc9\x11\x05\x0f\x12\x82\xc9" } },
    .{ "CreateURLMonikerEx", MethodRecord{ .library = "urlmon", .import = "CreateURLMonikerEx", .signature = "\x00\x04\x11\x79\x12\x82\xc9\x11\x05\x0f\x12\x82\xc9\x09" } },
    .{ "GetClassURL", MethodRecord{ .library = "urlmon", .import = "GetClassURL", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x0d" } },
    .{ "CreateAsyncBindCtx", MethodRecord{ .library = "urlmon", .import = "CreateAsyncBindCtx", .signature = "\x00\x04\x11\x79\x09\x12\x82\xd5\x12\x9a\x09\x0f\x12\x82\xbd" } },
    .{ "CreateURLMonikerEx2", MethodRecord{ .library = "urlmon", .import = "CreateURLMonikerEx2", .signature = "\x00\x04\x11\x79\x12\x82\xc9\x12\x83\x11\x0f\x12\x82\xc9\x09" } },
    .{ "CreateAsyncBindCtxEx", MethodRecord{ .library = "urlmon", .import = "CreateAsyncBindCtxEx", .signature = "\x00\x06\x11\x79\x12\x82\xbd\x09\x12\x82\xd5\x12\x9a\x09\x0f\x12\x82\xbd\x09" } },
    .{ "MkParseDisplayNameEx", MethodRecord{ .library = "urlmon", .import = "MkParseDisplayNameEx", .signature = "\x00\x04\x11\x79\x12\x82\xbd\x11\x05\x0f\x09\x0f\x12\x82\xc9" } },
    .{ "RegisterBindStatusCallback", MethodRecord{ .library = "urlmon", .import = "RegisterBindStatusCallback", .signature = "\x00\x04\x11\x79\x12\x82\xbd\x12\x82\xd5\x0f\x12\x82\xd5\x09" } },
    .{ "RevokeBindStatusCallback", MethodRecord{ .library = "urlmon", .import = "RevokeBindStatusCallback", .signature = "\x00\x02\x11\x79\x12\x82\xbd\x12\x82\xd5" } },
    .{ "GetClassFileOrMime", MethodRecord{ .library = "urlmon", .import = "GetClassFileOrMime", .signature = "\x00\x07\x11\x79\x12\x82\xbd\x11\x05\x0f\x01\x09\x11\x05\x09\x0f\x11\x0d" } },
    .{ "IsValidURL", MethodRecord{ .library = "urlmon", .import = "IsValidURL", .signature = "\x00\x03\x11\x79\x12\x82\xbd\x11\x05\x09" } },
    .{ "CoGetClassObjectFromURL", MethodRecord{ .library = "urlmon", .import = "CoGetClassObjectFromURL", .signature = "\x00\x0a\x11\x79\x0f\x11\x0d\x11\x05\x09\x09\x11\x05\x12\x82\xbd\x11\x82\xe9\x0f\x01\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "IEInstallScope", MethodRecord{ .library = "urlmon", .import = "IEInstallScope", .signature = "\x00\x01\x11\x79\x0f\x09" } },
    .{ "FaultInIEFeature", MethodRecord{ .library = "urlmon", .import = "FaultInIEFeature", .signature = "\x00\x04\x11\x79\x11\x25\x0f\x11\x82\xc1\x0f\x11\x82\xc5\x09" } },
    .{ "GetComponentIDFromCLSSPEC", MethodRecord{ .library = "urlmon", .import = "GetComponentIDFromCLSSPEC", .signature = "\x00\x02\x11\x79\x0f\x11\x82\xc1\x0f\x11\x3d" } },
    .{ "IsAsyncMoniker", MethodRecord{ .library = "urlmon", .import = "IsAsyncMoniker", .signature = "\x00\x01\x11\x79\x12\x82\xc9" } },
    .{ "RegisterMediaTypes", MethodRecord{ .library = "urlmon", .import = "RegisterMediaTypes", .signature = "\x00\x03\x11\x79\x09\x0f\x11\x3d\x0f\x07" } },
    .{ "FindMediaType", MethodRecord{ .library = "urlmon", .import = "FindMediaType", .signature = "\x00\x02\x11\x79\x11\x3d\x0f\x07" } },
    .{ "CreateFormatEnumerator", MethodRecord{ .library = "urlmon", .import = "CreateFormatEnumerator", .signature = "\x00\x03\x11\x79\x09\x0f\x11\x99\xb1\x0f\x12\x9a\x09" } },
    .{ "RegisterFormatEnumerator", MethodRecord{ .library = "urlmon", .import = "RegisterFormatEnumerator", .signature = "\x00\x03\x11\x79\x12\x82\xbd\x12\x9a\x09\x09" } },
    .{ "RevokeFormatEnumerator", MethodRecord{ .library = "urlmon", .import = "RevokeFormatEnumerator", .signature = "\x00\x02\x11\x79\x12\x82\xbd\x12\x9a\x09" } },
    .{ "RegisterMediaTypeClass", MethodRecord{ .library = "urlmon", .import = "RegisterMediaTypeClass", .signature = "\x00\x05\x11\x79\x12\x82\xbd\x09\x0f\x11\x3d\x0f\x11\x0d\x09" } },
    .{ "FindMediaTypeClass", MethodRecord{ .library = "urlmon", .import = "FindMediaTypeClass", .signature = "\x00\x04\x11\x79\x12\x82\xbd\x11\x3d\x0f\x11\x0d\x09" } },
    .{ "UrlMkSetSessionOption", MethodRecord{ .library = "urlmon", .import = "UrlMkSetSessionOption", .signature = "\x00\x04\x11\x79\x09\x0f\x01\x09\x09" } },
    .{ "UrlMkGetSessionOption", MethodRecord{ .library = "urlmon", .import = "UrlMkGetSessionOption", .signature = "\x00\x05\x11\x79\x09\x0f\x01\x09\x0f\x09\x09" } },
    .{ "FindMimeFromData", MethodRecord{ .library = "urlmon", .import = "FindMimeFromData", .signature = "\x00\x08\x11\x79\x12\x82\xbd\x11\x05\x0f\x01\x09\x11\x05\x09\x0f\x11\x05\x09" } },
    .{ "ObtainUserAgentString", MethodRecord{ .library = "urlmon", .import = "ObtainUserAgentString", .signature = "\x00\x03\x11\x79\x09\x11\x3d\x0f\x09" } },
    .{ "CompareSecurityIds", MethodRecord{ .library = "urlmon", .import = "CompareSecurityIds", .signature = "\x00\x05\x11\x79\x0f\x05\x09\x0f\x05\x09\x09" } },
    .{ "CompatFlagsFromClsid", MethodRecord{ .library = "urlmon", .import = "CompatFlagsFromClsid", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x09\x0f\x09" } },
    .{ "SetAccessForIEAppContainer", MethodRecord{ .library = "urlmon", .import = "SetAccessForIEAppContainer", .signature = "\x00\x03\x11\x79\x11\x80\x85\x11\xc0\x00\x40\x29\x09" } },
    .{ "HlinkSimpleNavigateToString", MethodRecord{ .library = "urlmon", .import = "HlinkSimpleNavigateToString", .signature = "\x00\x08\x11\x79\x11\x05\x11\x05\x11\x05\x12\x82\xb1\x12\x82\xbd\x12\x82\xd5\x09\x09" } },
    .{ "HlinkSimpleNavigateToMoniker", MethodRecord{ .library = "urlmon", .import = "HlinkSimpleNavigateToMoniker", .signature = "\x00\x08\x11\x79\x12\x82\xc9\x11\x05\x11\x05\x12\x82\xb1\x12\x82\xbd\x12\x82\xd5\x09\x09" } },
    .{ "URLOpenStreamA", MethodRecord{ .library = "urlmon", .import = "URLOpenStreamA", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x11\x3d\x09\x12\x82\xd5" } },
    .{ "URLOpenStreamW", MethodRecord{ .library = "urlmon", .import = "URLOpenStreamW", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x11\x05\x09\x12\x82\xd5" } },
    .{ "URLOpenPullStreamA", MethodRecord{ .library = "urlmon", .import = "URLOpenPullStreamA", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x11\x3d\x09\x12\x82\xd5" } },
    .{ "URLOpenPullStreamW", MethodRecord{ .library = "urlmon", .import = "URLOpenPullStreamW", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x11\x05\x09\x12\x82\xd5" } },
    .{ "URLDownloadToFileA", MethodRecord{ .library = "urlmon", .import = "URLDownloadToFileA", .signature = "\x00\x05\x11\x79\x12\x82\xb1\x11\x3d\x11\x3d\x09\x12\x82\xd5" } },
    .{ "URLDownloadToFileW", MethodRecord{ .library = "urlmon", .import = "URLDownloadToFileW", .signature = "\x00\x05\x11\x79\x12\x82\xb1\x11\x05\x11\x05\x09\x12\x82\xd5" } },
    .{ "URLDownloadToCacheFileA", MethodRecord{ .library = "urlmon", .import = "URLDownloadToCacheFileA", .signature = "\x00\x06\x11\x79\x12\x82\xb1\x11\x3d\x11\x3d\x09\x09\x12\x82\xd5" } },
    .{ "URLDownloadToCacheFileW", MethodRecord{ .library = "urlmon", .import = "URLDownloadToCacheFileW", .signature = "\x00\x06\x11\x79\x12\x82\xb1\x11\x05\x11\x05\x09\x09\x12\x82\xd5" } },
    .{ "URLOpenBlockingStreamA", MethodRecord{ .library = "urlmon", .import = "URLOpenBlockingStreamA", .signature = "\x00\x05\x11\x79\x12\x82\xb1\x11\x3d\x0f\x12\x83\x75\x09\x12\x82\xd5" } },
    .{ "URLOpenBlockingStreamW", MethodRecord{ .library = "urlmon", .import = "URLOpenBlockingStreamW", .signature = "\x00\x05\x11\x79\x12\x82\xb1\x11\x05\x0f\x12\x83\x75\x09\x12\x82\xd5" } },
    .{ "HlinkGoBack", MethodRecord{ .library = "urlmon", .import = "HlinkGoBack", .signature = "\x00\x01\x11\x79\x12\x82\xb1" } },
    .{ "HlinkGoForward", MethodRecord{ .library = "urlmon", .import = "HlinkGoForward", .signature = "\x00\x01\x11\x79\x12\x82\xb1" } },
    .{ "HlinkNavigateString", MethodRecord{ .library = "urlmon", .import = "HlinkNavigateString", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x11\x05" } },
    .{ "HlinkNavigateMoniker", MethodRecord{ .library = "urlmon", .import = "HlinkNavigateMoniker", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x12\x82\xc9" } },
    .{ "CoInternetParseUrl", MethodRecord{ .library = "urlmon", .import = "CoInternetParseUrl", .signature = "\x00\x07\x11\x79\x11\x05\x11\xc0\x00\x40\x2d\x09\x11\x05\x09\x0f\x09\x09" } },
    .{ "CoInternetParseIUri", MethodRecord{ .library = "urlmon", .import = "CoInternetParseIUri", .signature = "\x00\x07\x11\x79\x12\x83\x11\x11\xc0\x00\x40\x2d\x09\x11\x05\x09\x0f\x09\x19" } },
    .{ "CoInternetCombineUrl", MethodRecord{ .library = "urlmon", .import = "CoInternetCombineUrl", .signature = "\x00\x07\x11\x79\x11\x05\x11\x05\x09\x11\x05\x09\x0f\x09\x09" } },
    .{ "CoInternetCombineUrlEx", MethodRecord{ .library = "urlmon", .import = "CoInternetCombineUrlEx", .signature = "\x00\x05\x11\x79\x12\x83\x11\x11\x05\x09\x0f\x12\x83\x11\x19" } },
    .{ "CoInternetCombineIUri", MethodRecord{ .library = "urlmon", .import = "CoInternetCombineIUri", .signature = "\x00\x05\x11\x79\x12\x83\x11\x12\x83\x11\x09\x0f\x12\x83\x11\x19" } },
    .{ "CoInternetCompareUrl", MethodRecord{ .library = "urlmon", .import = "CoInternetCompareUrl", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x09" } },
    .{ "CoInternetGetProtocolFlags", MethodRecord{ .library = "urlmon", .import = "CoInternetGetProtocolFlags", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x09\x09" } },
    .{ "CoInternetQueryInfo", MethodRecord{ .library = "urlmon", .import = "CoInternetQueryInfo", .signature = "\x00\x07\x11\x79\x11\x05\x11\xc0\x00\x40\x31\x09\x0f\x01\x09\x0f\x09\x09" } },
    .{ "CoInternetGetSession", MethodRecord{ .library = "urlmon", .import = "CoInternetGetSession", .signature = "\x00\x03\x11\x79\x09\x0f\x12\xc0\x00\x40\x35\x09" } },
    .{ "CoInternetGetSecurityUrl", MethodRecord{ .library = "urlmon", .import = "CoInternetGetSecurityUrl", .signature = "\x00\x04\x11\x79\x11\x05\x0f\x11\x05\x11\xc0\x00\x40\x39\x09" } },
    .{ "CoInternetGetSecurityUrlEx", MethodRecord{ .library = "urlmon", .import = "CoInternetGetSecurityUrlEx", .signature = "\x00\x04\x11\x79\x12\x83\x11\x0f\x12\x83\x11\x11\xc0\x00\x40\x39\x19" } },
    .{ "CoInternetSetFeatureEnabled", MethodRecord{ .library = "urlmon", .import = "CoInternetSetFeatureEnabled", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x40\x3d\x09\x11\x59" } },
    .{ "CoInternetIsFeatureEnabled", MethodRecord{ .library = "urlmon", .import = "CoInternetIsFeatureEnabled", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x40\x3d\x09" } },
    .{ "CoInternetIsFeatureEnabledForUrl", MethodRecord{ .library = "urlmon", .import = "CoInternetIsFeatureEnabledForUrl", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x40\x3d\x09\x11\x05\x12\xc0\x00\x40\x41" } },
    .{ "CoInternetIsFeatureEnabledForIUri", MethodRecord{ .library = "urlmon", .import = "CoInternetIsFeatureEnabledForIUri", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x40\x3d\x09\x12\x83\x11\x12\xc0\x00\x40\x45" } },
    .{ "CoInternetIsFeatureZoneElevationEnabled", MethodRecord{ .library = "urlmon", .import = "CoInternetIsFeatureZoneElevationEnabled", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x12\xc0\x00\x40\x41\x09" } },
    .{ "CopyStgMedium", MethodRecord{ .library = "urlmon", .import = "CopyStgMedium", .signature = "\x00\x02\x11\x79\x0f\x11\x99\xf9\x0f\x11\x99\xf9" } },
    .{ "CopyBindInfo", MethodRecord{ .library = "urlmon", .import = "CopyBindInfo", .signature = "\x00\x02\x11\x79\x0f\x11\xc0\x00\x40\x49\x0f\x11\xc0\x00\x40\x49" } },
    .{ "ReleaseBindInfo", MethodRecord{ .library = "urlmon", .import = "ReleaseBindInfo", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x40\x49" } },
    .{ "IEGetUserPrivateNamespaceName", MethodRecord{ .library = "urlmon", .import = "IEGetUserPrivateNamespaceName", .signature = "\x00\x00\x11\x05" } },
    .{ "CoInternetCreateSecurityManager", MethodRecord{ .library = "urlmon", .import = "CoInternetCreateSecurityManager", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x40\x4d\x0f\x12\xc0\x00\x40\x41\x09" } },
    .{ "CoInternetCreateZoneManager", MethodRecord{ .library = "urlmon", .import = "CoInternetCreateZoneManager", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x40\x4d\x0f\x12\xc0\x00\x40\x51\x09" } },
    .{ "GetSoftwareUpdateInfo", MethodRecord{ .library = "urlmon", .import = "GetSoftwareUpdateInfo", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x9e\xdd" } },
    .{ "SetSoftwareUpdateAdvertisementState", MethodRecord{ .library = "urlmon", .import = "SetSoftwareUpdateAdvertisementState", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x09" } },
    .{ "IsLoggingEnabledA", MethodRecord{ .library = "urlmon", .import = "IsLoggingEnabledA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "IsLoggingEnabledW", MethodRecord{ .library = "urlmon", .import = "IsLoggingEnabledW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "WriteHitLogging", MethodRecord{ .library = "urlmon", .import = "WriteHitLogging", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x40\x55" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x2bd => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IBindCtx" },
        0x2c1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "uCLSSPEC" },
        0x2c5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "QUERYCONTEXT" },
        0x2c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IMoniker" },
        0x2d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IBindStatusCallback" },
        0x2e9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "CLSCTX" },
        0x311 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUri" },
        0x375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IStream" },
        0x19b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "FORMATETC" },
        0x19f9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "STGMEDIUM" },
        0x1a09 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IEnumFORMATETC" },
        0x1edd => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.Urlmon", .name = "SOFTDISTINFO" },
        0x4029 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.Urlmon", .name = "IEObjectType" },
        0x402d => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.Urlmon", .name = "PARSEACTION" },
        0x4031 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.Urlmon", .name = "QUERYOPTION" },
        0x4035 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.Urlmon", .name = "IInternetSession" },
        0x4039 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.Urlmon", .name = "PSUACTION" },
        0x403d => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.Urlmon", .name = "INTERNETFEATURELIST" },
        0x4041 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.Urlmon", .name = "IInternetSecurityManager" },
        0x4045 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.Urlmon", .name = "IInternetSecurityManagerEx2" },
        0x4049 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "BINDINFO" },
        0x404d => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IServiceProvider" },
        0x4051 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.Urlmon", .name = "IInternetZoneManager" },
        0x4055 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.Urlmon", .name = "HIT_LOGGING_INFO" },
        else => null,
    };
}

pub const MKSYS_URLMONIKER = 6;
pub const URL_MK_LEGACY = 0;
pub const URL_MK_UNIFORM = 1;
pub const URL_MK_NO_CANONICALIZE = 2;
pub const FIEF_FLAG_FORCE_JITUI = 1;
pub const FIEF_FLAG_PEEK = 2;
pub const FIEF_FLAG_SKIP_INSTALLED_VERSION_CHECK = 4;
pub const FIEF_FLAG_RESERVED_0 = 8;
pub const FMFD_DEFAULT = 0;
pub const FMFD_URLASFILENAME = 1;
pub const FMFD_ENABLEMIMESNIFFING = 2;
pub const FMFD_IGNOREMIMETEXTPLAIN = 4;
pub const FMFD_SERVERMIME = 8;
pub const FMFD_RESPECTTEXTPLAIN = 16;
pub const FMFD_RETURNUPDATEDIMGMIMES = 32;
pub const FMFD_RESERVED_1 = 64;
pub const FMFD_RESERVED_2 = 128;
pub const UAS_EXACTLEGACY = 4096;
pub const URLMON_OPTION_USERAGENT = 268435457;
pub const URLMON_OPTION_USERAGENT_REFRESH = 268435458;
pub const URLMON_OPTION_URL_ENCODING = 268435460;
pub const URLMON_OPTION_USE_BINDSTRINGCREDS = 268435464;
pub const URLMON_OPTION_USE_BROWSERAPPSDOCUMENTS = 268435472;
pub const CF_NULL = 0;
pub const MK_S_ASYNCHRONOUS = 262632;
pub const S_ASYNCHRONOUS = 262632;
pub const E_PENDING = -2147483638;
pub const INET_E_INVALID_URL = -2146697214;
pub const INET_E_NO_SESSION = -2146697213;
pub const INET_E_CANNOT_CONNECT = -2146697212;
pub const INET_E_RESOURCE_NOT_FOUND = -2146697211;
pub const INET_E_OBJECT_NOT_FOUND = -2146697210;
pub const INET_E_DATA_NOT_AVAILABLE = -2146697209;
pub const INET_E_DOWNLOAD_FAILURE = -2146697208;
pub const INET_E_AUTHENTICATION_REQUIRED = -2146697207;
pub const INET_E_NO_VALID_MEDIA = -2146697206;
pub const INET_E_CONNECTION_TIMEOUT = -2146697205;
pub const INET_E_INVALID_REQUEST = -2146697204;
pub const INET_E_UNKNOWN_PROTOCOL = -2146697203;
pub const INET_E_SECURITY_PROBLEM = -2146697202;
pub const INET_E_CANNOT_LOAD_DATA = -2146697201;
pub const INET_E_CANNOT_INSTANTIATE_OBJECT = -2146697200;
pub const INET_E_INVALID_CERTIFICATE = -2146697191;
pub const INET_E_REDIRECT_FAILED = -2146697196;
pub const INET_E_REDIRECT_TO_DIR = -2146697195;
pub const INET_E_CANNOT_LOCK_REQUEST = -2146697194;
pub const INET_E_USE_EXTEND_BINDING = -2146697193;
pub const INET_E_TERMINATED_BIND = -2146697192;
pub const INET_E_RESERVED_1 = -2146697190;
pub const INET_E_BLOCKED_REDIRECT_XSECURITYID = -2146697189;
pub const INET_E_DOMINJECTIONVALIDATION = -2146697188;
pub const INET_E_VTAB_SWITCH_FORCE_ENGINE = -2146697187;
pub const INET_E_HSTS_CERTIFICATE_ERROR = -2146697186;
pub const INET_E_RESERVED_2 = -2146697185;
pub const INET_E_RESERVED_3 = -2146697184;
pub const INET_E_RESERVED_4 = -2146697183;
pub const INET_E_RESERVED_5 = -2146697182;
pub const INET_E_ERROR_FIRST = -2146697214;
pub const INET_E_CODE_DOWNLOAD_DECLINED = -2146696960;
pub const INET_E_RESULT_DISPATCHED = -2146696704;
pub const INET_E_CANNOT_REPLACE_SFP_FILE = -2146696448;
pub const INET_E_CODE_INSTALL_SUPPRESSED = -2146696192;
pub const INET_E_CODE_INSTALL_BLOCKED_BY_HASH_POLICY = -2146695936;
pub const INET_E_DOWNLOAD_BLOCKED_BY_INPRIVATE = -2146695935;
pub const INET_E_CODE_INSTALL_BLOCKED_IMMERSIVE = -2146695934;
pub const INET_E_FORBIDFRAMING = -2146695933;
pub const INET_E_CODE_INSTALL_BLOCKED_ARM = -2146695932;
pub const INET_E_BLOCKED_PLUGGABLE_PROTOCOL = -2146695931;
pub const INET_E_BLOCKED_ENHANCEDPROTECTEDMODE = -2146695930;
pub const INET_E_CODE_INSTALL_BLOCKED_BITNESS = -2146695929;
pub const INET_E_DOWNLOAD_BLOCKED_BY_CSP = -2146695928;
pub const INET_E_ERROR_LAST = -2146695928;
pub const Uri_DISPLAY_NO_FRAGMENT = 1;
pub const Uri_PUNYCODE_IDN_HOST = 2;
pub const Uri_DISPLAY_IDN_HOST = 4;
pub const Uri_DISPLAY_NO_PUNYCODE = 8;
pub const Uri_ENCODING_USER_INFO_AND_PATH_IS_PERCENT_ENCODED_UTF8 = 1;
pub const Uri_ENCODING_USER_INFO_AND_PATH_IS_CP = 2;
pub const Uri_ENCODING_HOST_IS_IDN = 4;
pub const Uri_ENCODING_HOST_IS_PERCENT_ENCODED_UTF8 = 8;
pub const Uri_ENCODING_HOST_IS_PERCENT_ENCODED_CP = 16;
pub const Uri_ENCODING_QUERY_AND_FRAGMENT_IS_PERCENT_ENCODED_UTF8 = 32;
pub const Uri_ENCODING_QUERY_AND_FRAGMENT_IS_CP = 64;
pub const UriBuilder_USE_ORIGINAL_FLAGS = 1;
pub const WININETINFO_OPTION_LOCK_HANDLE = 65534;
pub const URLOSTRM_USECACHEDCOPY_ONLY = 1;
pub const URLOSTRM_USECACHEDCOPY = 2;
pub const URLOSTRM_GETNEWESTVERSION = 3;
pub const SET_FEATURE_ON_THREAD = 1;
pub const SET_FEATURE_ON_PROCESS = 2;
pub const SET_FEATURE_IN_REGISTRY = 4;
pub const SET_FEATURE_ON_THREAD_LOCALMACHINE = 8;
pub const SET_FEATURE_ON_THREAD_INTRANET = 16;
pub const SET_FEATURE_ON_THREAD_TRUSTED = 32;
pub const SET_FEATURE_ON_THREAD_INTERNET = 64;
pub const SET_FEATURE_ON_THREAD_RESTRICTED = 128;
pub const GET_FEATURE_FROM_THREAD = 1;
pub const GET_FEATURE_FROM_PROCESS = 2;
pub const GET_FEATURE_FROM_REGISTRY = 4;
pub const GET_FEATURE_FROM_THREAD_LOCALMACHINE = 8;
pub const GET_FEATURE_FROM_THREAD_INTRANET = 16;
pub const GET_FEATURE_FROM_THREAD_TRUSTED = 32;
pub const GET_FEATURE_FROM_THREAD_INTERNET = 64;
pub const GET_FEATURE_FROM_THREAD_RESTRICTED = 128;
pub const INET_E_USE_DEFAULT_PROTOCOLHANDLER = -2146697199;
pub const INET_E_USE_DEFAULT_SETTING = -2146697198;
pub const INET_E_DEFAULT_ACTION = -2146697199;
pub const INET_E_QUERYOPTION_UNKNOWN = -2146697197;
pub const INET_E_REDIRECTING = -2146697196;
pub const PROTOCOLFLAG_NO_PICS_CHECK = 1;
pub const MUTZ_NOSAVEDFILECHECK = 1;
pub const MUTZ_ISFILE = 2;
pub const MUTZ_ACCEPT_WILDCARD_SCHEME = 128;
pub const MUTZ_ENFORCERESTRICTED = 256;
pub const MUTZ_RESERVED = 512;
pub const MUTZ_REQUIRESAVEDFILECHECK = 1024;
pub const MUTZ_DONT_UNESCAPE = 2048;
pub const MUTZ_DONT_USE_CACHE = 4096;
pub const MUTZ_FORCE_INTRANET_FLAGS = 8192;
pub const MUTZ_IGNORE_ZONE_MAPPINGS = 16384;
pub const MAX_SIZE_SECURITY_ID = 512;
pub const URLACTION_MIN = 4096;
pub const URLACTION_DOWNLOAD_MIN = 4096;
pub const URLACTION_DOWNLOAD_SIGNED_ACTIVEX = 4097;
pub const URLACTION_DOWNLOAD_UNSIGNED_ACTIVEX = 4100;
pub const URLACTION_DOWNLOAD_CURR_MAX = 4100;
pub const URLACTION_DOWNLOAD_MAX = 4607;
pub const URLACTION_ACTIVEX_MIN = 4608;
pub const URLACTION_ACTIVEX_RUN = 4608;
pub const URLPOLICY_ACTIVEX_CHECK_LIST = 65536;
pub const URLACTION_ACTIVEX_OVERRIDE_OBJECT_SAFETY = 4609;
pub const URLACTION_ACTIVEX_OVERRIDE_DATA_SAFETY = 4610;
pub const URLACTION_ACTIVEX_OVERRIDE_SCRIPT_SAFETY = 4611;
pub const URLACTION_SCRIPT_OVERRIDE_SAFETY = 5121;
pub const URLACTION_ACTIVEX_CONFIRM_NOOBJECTSAFETY = 4612;
pub const URLACTION_ACTIVEX_TREATASUNTRUSTED = 4613;
pub const URLACTION_ACTIVEX_NO_WEBOC_SCRIPT = 4614;
pub const URLACTION_ACTIVEX_OVERRIDE_REPURPOSEDETECTION = 4615;
pub const URLACTION_ACTIVEX_OVERRIDE_OPTIN = 4616;
pub const URLACTION_ACTIVEX_SCRIPTLET_RUN = 4617;
pub const URLACTION_ACTIVEX_DYNSRC_VIDEO_AND_ANIMATION = 4618;
pub const URLACTION_ACTIVEX_OVERRIDE_DOMAINLIST = 4619;
pub const URLACTION_ACTIVEX_ALLOW_TDC = 4620;
pub const URLACTION_ACTIVEX_CURR_MAX = 4620;
pub const URLACTION_ACTIVEX_MAX = 5119;
pub const URLACTION_SCRIPT_MIN = 5120;
pub const URLACTION_SCRIPT_RUN = 5120;
pub const URLACTION_SCRIPT_JAVA_USE = 5122;
pub const URLACTION_SCRIPT_SAFE_ACTIVEX = 5125;
pub const URLACTION_CROSS_DOMAIN_DATA = 5126;
pub const URLACTION_SCRIPT_PASTE = 5127;
pub const URLACTION_ALLOW_XDOMAIN_SUBFRAME_RESIZE = 5128;
pub const URLACTION_SCRIPT_XSSFILTER = 5129;
pub const URLACTION_SCRIPT_NAVIGATE = 5130;
pub const URLACTION_PLUGGABLE_PROTOCOL_XHR = 5131;
pub const URLACTION_ALLOW_VBSCRIPT_IE = 5132;
pub const URLACTION_ALLOW_JSCRIPT_IE = 5133;
pub const URLACTION_SCRIPT_CURR_MAX = 5133;
pub const URLACTION_SCRIPT_MAX = 5631;
pub const URLACTION_HTML_MIN = 5632;
pub const URLACTION_HTML_SUBMIT_FORMS = 5633;
pub const URLACTION_HTML_SUBMIT_FORMS_FROM = 5634;
pub const URLACTION_HTML_SUBMIT_FORMS_TO = 5635;
pub const URLACTION_HTML_FONT_DOWNLOAD = 5636;
pub const URLACTION_HTML_JAVA_RUN = 5637;
pub const URLACTION_HTML_USERDATA_SAVE = 5638;
pub const URLACTION_HTML_SUBFRAME_NAVIGATE = 5639;
pub const URLACTION_HTML_META_REFRESH = 5640;
pub const URLACTION_HTML_MIXED_CONTENT = 5641;
pub const URLACTION_HTML_INCLUDE_FILE_PATH = 5642;
pub const URLACTION_HTML_ALLOW_INJECTED_DYNAMIC_HTML = 5643;
pub const URLACTION_HTML_REQUIRE_UTF8_DOCUMENT_CODEPAGE = 5644;
pub const URLACTION_HTML_ALLOW_CROSS_DOMAIN_CANVAS = 5645;
pub const URLACTION_HTML_ALLOW_WINDOW_CLOSE = 5646;
pub const URLACTION_HTML_ALLOW_CROSS_DOMAIN_WEBWORKER = 5647;
pub const URLACTION_HTML_ALLOW_CROSS_DOMAIN_TEXTTRACK = 5648;
pub const URLACTION_HTML_ALLOW_INDEXEDDB = 5649;
pub const URLACTION_HTML_MAX = 6143;
pub const URLACTION_SHELL_MIN = 6144;
pub const URLACTION_SHELL_INSTALL_DTITEMS = 6144;
pub const URLACTION_SHELL_MOVE_OR_COPY = 6146;
pub const URLACTION_SHELL_FILE_DOWNLOAD = 6147;
pub const URLACTION_SHELL_VERB = 6148;
pub const URLACTION_SHELL_WEBVIEW_VERB = 6149;
pub const URLACTION_SHELL_SHELLEXECUTE = 6150;
pub const URLACTION_SHELL_EXECUTE_HIGHRISK = 6150;
pub const URLACTION_SHELL_EXECUTE_MODRISK = 6151;
pub const URLACTION_SHELL_EXECUTE_LOWRISK = 6152;
pub const URLACTION_SHELL_POPUPMGR = 6153;
pub const URLACTION_SHELL_RTF_OBJECTS_LOAD = 6154;
pub const URLACTION_SHELL_ENHANCED_DRAGDROP_SECURITY = 6155;
pub const URLACTION_SHELL_EXTENSIONSECURITY = 6156;
pub const URLACTION_SHELL_SECURE_DRAGSOURCE = 6157;
pub const URLACTION_SHELL_REMOTEQUERY = 6158;
pub const URLACTION_SHELL_PREVIEW = 6159;
pub const URLACTION_SHELL_SHARE = 6160;
pub const URLACTION_SHELL_ALLOW_CROSS_SITE_SHARE = 6161;
pub const URLACTION_SHELL_TOCTOU_RISK = 6162;
pub const URLACTION_SHELL_CURR_MAX = 6162;
pub const URLACTION_SHELL_MAX = 6655;
pub const URLACTION_NETWORK_MIN = 6656;
pub const URLACTION_CREDENTIALS_USE = 6656;
pub const URLPOLICY_CREDENTIALS_SILENT_LOGON_OK = 0;
pub const URLPOLICY_CREDENTIALS_MUST_PROMPT_USER = 65536;
pub const URLPOLICY_CREDENTIALS_CONDITIONAL_PROMPT = 131072;
pub const URLPOLICY_CREDENTIALS_ANONYMOUS_ONLY = 196608;
pub const URLACTION_AUTHENTICATE_CLIENT = 6657;
pub const URLPOLICY_AUTHENTICATE_CLEARTEXT_OK = 0;
pub const URLPOLICY_AUTHENTICATE_CHALLENGE_RESPONSE = 65536;
pub const URLPOLICY_AUTHENTICATE_MUTUAL_ONLY = 196608;
pub const URLACTION_COOKIES = 6658;
pub const URLACTION_COOKIES_SESSION = 6659;
pub const URLACTION_CLIENT_CERT_PROMPT = 6660;
pub const URLACTION_COOKIES_THIRD_PARTY = 6661;
pub const URLACTION_COOKIES_SESSION_THIRD_PARTY = 6662;
pub const URLACTION_COOKIES_ENABLED = 6672;
pub const URLACTION_NETWORK_CURR_MAX = 6672;
pub const URLACTION_NETWORK_MAX = 7167;
pub const URLACTION_JAVA_MIN = 7168;
pub const URLACTION_JAVA_PERMISSIONS = 7168;
pub const URLPOLICY_JAVA_PROHIBIT = 0;
pub const URLPOLICY_JAVA_HIGH = 65536;
pub const URLPOLICY_JAVA_MEDIUM = 131072;
pub const URLPOLICY_JAVA_LOW = 196608;
pub const URLPOLICY_JAVA_CUSTOM = 8388608;
pub const URLACTION_JAVA_CURR_MAX = 7168;
pub const URLACTION_JAVA_MAX = 7423;
pub const URLACTION_INFODELIVERY_MIN = 7424;
pub const URLACTION_INFODELIVERY_NO_ADDING_CHANNELS = 7424;
pub const URLACTION_INFODELIVERY_NO_EDITING_CHANNELS = 7425;
pub const URLACTION_INFODELIVERY_NO_REMOVING_CHANNELS = 7426;
pub const URLACTION_INFODELIVERY_NO_ADDING_SUBSCRIPTIONS = 7427;
pub const URLACTION_INFODELIVERY_NO_EDITING_SUBSCRIPTIONS = 7428;
pub const URLACTION_INFODELIVERY_NO_REMOVING_SUBSCRIPTIONS = 7429;
pub const URLACTION_INFODELIVERY_NO_CHANNEL_LOGGING = 7430;
pub const URLACTION_INFODELIVERY_CURR_MAX = 7430;
pub const URLACTION_INFODELIVERY_MAX = 7679;
pub const URLACTION_CHANNEL_SOFTDIST_MIN = 7680;
pub const URLACTION_CHANNEL_SOFTDIST_PERMISSIONS = 7685;
pub const URLPOLICY_CHANNEL_SOFTDIST_PROHIBIT = 65536;
pub const URLPOLICY_CHANNEL_SOFTDIST_PRECACHE = 131072;
pub const URLPOLICY_CHANNEL_SOFTDIST_AUTOINSTALL = 196608;
pub const URLACTION_CHANNEL_SOFTDIST_MAX = 7935;
pub const URLACTION_DOTNET_USERCONTROLS = 8197;
pub const URLACTION_BEHAVIOR_MIN = 8192;
pub const URLACTION_BEHAVIOR_RUN = 8192;
pub const URLPOLICY_BEHAVIOR_CHECK_LIST = 65536;
pub const URLACTION_FEATURE_MIN = 8448;
pub const URLACTION_FEATURE_MIME_SNIFFING = 8448;
pub const URLACTION_FEATURE_ZONE_ELEVATION = 8449;
pub const URLACTION_FEATURE_WINDOW_RESTRICTIONS = 8450;
pub const URLACTION_FEATURE_SCRIPT_STATUS_BAR = 8451;
pub const URLACTION_FEATURE_FORCE_ADDR_AND_STATUS = 8452;
pub const URLACTION_FEATURE_BLOCK_INPUT_PROMPTS = 8453;
pub const URLACTION_FEATURE_DATA_BINDING = 8454;
pub const URLACTION_FEATURE_CROSSDOMAIN_FOCUS_CHANGE = 8455;
pub const URLACTION_AUTOMATIC_DOWNLOAD_UI_MIN = 8704;
pub const URLACTION_AUTOMATIC_DOWNLOAD_UI = 8704;
pub const URLACTION_AUTOMATIC_ACTIVEX_UI = 8705;
pub const URLACTION_ALLOW_RESTRICTEDPROTOCOLS = 8960;
pub const URLACTION_ALLOW_APEVALUATION = 8961;
pub const URLACTION_ALLOW_XHR_EVALUATION = 8962;
pub const URLACTION_WINDOWS_BROWSER_APPLICATIONS = 9216;
pub const URLACTION_XPS_DOCUMENTS = 9217;
pub const URLACTION_LOOSE_XAML = 9218;
pub const URLACTION_LOWRIGHTS = 9472;
pub const URLACTION_WINFX_SETUP = 9728;
pub const URLACTION_INPRIVATE_BLOCKING = 9984;
pub const URLACTION_ALLOW_AUDIO_VIDEO = 9985;
pub const URLACTION_ALLOW_ACTIVEX_FILTERING = 9986;
pub const URLACTION_ALLOW_STRUCTURED_STORAGE_SNIFFING = 9987;
pub const URLACTION_ALLOW_AUDIO_VIDEO_PLUGINS = 9988;
pub const URLACTION_ALLOW_ZONE_ELEVATION_VIA_OPT_OUT = 9989;
pub const URLACTION_ALLOW_ZONE_ELEVATION_OPT_OUT_ADDITION = 9990;
pub const URLACTION_ALLOW_CROSSDOMAIN_DROP_WITHIN_WINDOW = 9992;
pub const URLACTION_ALLOW_CROSSDOMAIN_DROP_ACROSS_WINDOWS = 9993;
pub const URLACTION_ALLOW_CROSSDOMAIN_APPCACHE_MANIFEST = 9994;
pub const URLACTION_ALLOW_RENDER_LEGACY_DXTFILTERS = 9995;
pub const URLACTION_ALLOW_ANTIMALWARE_SCANNING_OF_ACTIVEX = 9996;
pub const URLACTION_ALLOW_CSS_EXPRESSIONS = 9997;
pub const URLPOLICY_ALLOW = 0;
pub const URLPOLICY_QUERY = 1;
pub const URLPOLICY_DISALLOW = 3;
pub const URLPOLICY_NOTIFY_ON_ALLOW = 16;
pub const URLPOLICY_NOTIFY_ON_DISALLOW = 32;
pub const URLPOLICY_LOG_ON_ALLOW = 64;
pub const URLPOLICY_LOG_ON_DISALLOW = 128;
pub const URLPOLICY_MASK_PERMISSIONS = 15;
pub const URLPOLICY_DONTCHECKDLGBOX = 256;
pub const URLZONE_ESC_FLAG = 256;
pub const SECURITY_IE_STATE_GREEN = 0;
pub const SECURITY_IE_STATE_RED = 1;
pub const SOFTDIST_FLAG_USAGE_EMAIL = 1;
pub const SOFTDIST_FLAG_USAGE_PRECACHE = 2;
pub const SOFTDIST_FLAG_USAGE_AUTOINSTALL = 4;
pub const SOFTDIST_FLAG_DELETE_SUBSCRIPTION = 8;
pub const SOFTDIST_ADSTATE_NONE = 0;
pub const SOFTDIST_ADSTATE_AVAILABLE = 1;
pub const SOFTDIST_ADSTATE_DOWNLOADED = 2;
pub const SOFTDIST_ADSTATE_INSTALLED = 3;
pub const CONFIRMSAFETYACTION_LOADOBJECT = 1;
pub const IE_EPM_OBJECT_EVENT = 0;
pub const IE_EPM_OBJECT_MUTEX = 1;
pub const IE_EPM_OBJECT_SEMAPHORE = 2;
pub const IE_EPM_OBJECT_SHARED_MEMORY = 3;
pub const IE_EPM_OBJECT_WAITABLE_TIMER = 4;
pub const IE_EPM_OBJECT_FILE = 5;
pub const IE_EPM_OBJECT_NAMED_PIPE = 6;
pub const IE_EPM_OBJECT_REGISTRY = 7;
pub const MIMETYPEPROP = 0;
pub const USE_SRC_URL = 1;
pub const CLASSIDPROP = 2;
pub const TRUSTEDDOWNLOADPROP = 3;
pub const POPUPLEVELPROP = 4;
pub const BINDVERB_GET = 0;
pub const BINDVERB_POST = 1;
pub const BINDVERB_PUT = 2;
pub const BINDVERB_CUSTOM = 3;
pub const BINDVERB_RESERVED1 = 4;
pub const BINDF_ASYNCHRONOUS = 1;
pub const BINDF_ASYNCSTORAGE = 2;
pub const BINDF_NOPROGRESSIVERENDERING = 4;
pub const BINDF_OFFLINEOPERATION = 8;
pub const BINDF_GETNEWESTVERSION = 16;
pub const BINDF_NOWRITECACHE = 32;
pub const BINDF_NEEDFILE = 64;
pub const BINDF_PULLDATA = 128;
pub const BINDF_IGNORESECURITYPROBLEM = 256;
pub const BINDF_RESYNCHRONIZE = 512;
pub const BINDF_HYPERLINK = 1024;
pub const BINDF_NO_UI = 2048;
pub const BINDF_SILENTOPERATION = 4096;
pub const BINDF_PRAGMA_NO_CACHE = 8192;
pub const BINDF_GETCLASSOBJECT = 16384;
pub const BINDF_RESERVED_1 = 32768;
pub const BINDF_FREE_THREADED = 65536;
pub const BINDF_DIRECT_READ = 131072;
pub const BINDF_FORMS_SUBMIT = 262144;
pub const BINDF_GETFROMCACHE_IF_NET_FAIL = 524288;
pub const BINDF_FROMURLMON = 1048576;
pub const BINDF_FWD_BACK = 2097152;
pub const BINDF_PREFERDEFAULTHANDLER = 4194304;
pub const BINDF_ENFORCERESTRICTED = 8388608;
pub const BINDF_RESERVED_2 = -2147483648;
pub const BINDF_RESERVED_3 = 16777216;
pub const BINDF_RESERVED_4 = 33554432;
pub const BINDF_RESERVED_5 = 67108864;
pub const BINDF_RESERVED_6 = 134217728;
pub const BINDF_RESERVED_7 = 1073741824;
pub const BINDF_RESERVED_8 = 536870912;
pub const URL_ENCODING_NONE = 0;
pub const URL_ENCODING_ENABLE_UTF8 = 268435456;
pub const URL_ENCODING_DISABLE_UTF8 = 536870912;
pub const BINDINFO_OPTIONS_WININETFLAG = 65536;
pub const BINDINFO_OPTIONS_ENABLE_UTF8 = 131072;
pub const BINDINFO_OPTIONS_DISABLE_UTF8 = 262144;
pub const BINDINFO_OPTIONS_USE_IE_ENCODING = 524288;
pub const BINDINFO_OPTIONS_BINDTOOBJECT = 1048576;
pub const BINDINFO_OPTIONS_SECURITYOPTOUT = 2097152;
pub const BINDINFO_OPTIONS_IGNOREMIMETEXTPLAIN = 4194304;
pub const BINDINFO_OPTIONS_USEBINDSTRINGCREDS = 8388608;
pub const BINDINFO_OPTIONS_IGNOREHTTPHTTPSREDIRECTS = 16777216;
pub const BINDINFO_OPTIONS_IGNORE_SSLERRORS_ONCE = 33554432;
pub const BINDINFO_WPC_DOWNLOADBLOCKED = 134217728;
pub const BINDINFO_WPC_LOGGING_ENABLED = 268435456;
pub const BINDINFO_OPTIONS_ALLOWCONNECTDATA = 536870912;
pub const BINDINFO_OPTIONS_DISABLEAUTOREDIRECTS = 1073741824;
pub const BINDINFO_OPTIONS_SHDOCVW_NAVIGATE = -2147483648;
pub const BSCF_FIRSTDATANOTIFICATION = 1;
pub const BSCF_INTERMEDIATEDATANOTIFICATION = 2;
pub const BSCF_LASTDATANOTIFICATION = 4;
pub const BSCF_DATAFULLYAVAILABLE = 8;
pub const BSCF_AVAILABLEDATASIZEUNKNOWN = 16;
pub const BSCF_SKIPDRAINDATAFORFILEURLS = 32;
pub const BSCF_64BITLENGTHDOWNLOAD = 64;
pub const BINDSTATUS_FINDINGRESOURCE = 1;
pub const BINDSTATUS_CONNECTING = 2;
pub const BINDSTATUS_REDIRECTING = 3;
pub const BINDSTATUS_BEGINDOWNLOADDATA = 4;
pub const BINDSTATUS_DOWNLOADINGDATA = 5;
pub const BINDSTATUS_ENDDOWNLOADDATA = 6;
pub const BINDSTATUS_BEGINDOWNLOADCOMPONENTS = 7;
pub const BINDSTATUS_INSTALLINGCOMPONENTS = 8;
pub const BINDSTATUS_ENDDOWNLOADCOMPONENTS = 9;
pub const BINDSTATUS_USINGCACHEDCOPY = 10;
pub const BINDSTATUS_SENDINGREQUEST = 11;
pub const BINDSTATUS_CLASSIDAVAILABLE = 12;
pub const BINDSTATUS_MIMETYPEAVAILABLE = 13;
pub const BINDSTATUS_CACHEFILENAMEAVAILABLE = 14;
pub const BINDSTATUS_BEGINSYNCOPERATION = 15;
pub const BINDSTATUS_ENDSYNCOPERATION = 16;
pub const BINDSTATUS_BEGINUPLOADDATA = 17;
pub const BINDSTATUS_UPLOADINGDATA = 18;
pub const BINDSTATUS_ENDUPLOADDATA = 19;
pub const BINDSTATUS_PROTOCOLCLASSID = 20;
pub const BINDSTATUS_ENCODING = 21;
pub const BINDSTATUS_VERIFIEDMIMETYPEAVAILABLE = 22;
pub const BINDSTATUS_CLASSINSTALLLOCATION = 23;
pub const BINDSTATUS_DECODING = 24;
pub const BINDSTATUS_LOADINGMIMEHANDLER = 25;
pub const BINDSTATUS_CONTENTDISPOSITIONATTACH = 26;
pub const BINDSTATUS_FILTERREPORTMIMETYPE = 27;
pub const BINDSTATUS_CLSIDCANINSTANTIATE = 28;
pub const BINDSTATUS_IUNKNOWNAVAILABLE = 29;
pub const BINDSTATUS_DIRECTBIND = 30;
pub const BINDSTATUS_RAWMIMETYPE = 31;
pub const BINDSTATUS_PROXYDETECTING = 32;
pub const BINDSTATUS_ACCEPTRANGES = 33;
pub const BINDSTATUS_COOKIE_SENT = 34;
pub const BINDSTATUS_COMPACT_POLICY_RECEIVED = 35;
pub const BINDSTATUS_COOKIE_SUPPRESSED = 36;
pub const BINDSTATUS_COOKIE_STATE_UNKNOWN = 37;
pub const BINDSTATUS_COOKIE_STATE_ACCEPT = 38;
pub const BINDSTATUS_COOKIE_STATE_REJECT = 39;
pub const BINDSTATUS_COOKIE_STATE_PROMPT = 40;
pub const BINDSTATUS_COOKIE_STATE_LEASH = 41;
pub const BINDSTATUS_COOKIE_STATE_DOWNGRADE = 42;
pub const BINDSTATUS_POLICY_HREF = 43;
pub const BINDSTATUS_P3P_HEADER = 44;
pub const BINDSTATUS_SESSION_COOKIE_RECEIVED = 45;
pub const BINDSTATUS_PERSISTENT_COOKIE_RECEIVED = 46;
pub const BINDSTATUS_SESSION_COOKIES_ALLOWED = 47;
pub const BINDSTATUS_CACHECONTROL = 48;
pub const BINDSTATUS_CONTENTDISPOSITIONFILENAME = 49;
pub const BINDSTATUS_MIMETEXTPLAINMISMATCH = 50;
pub const BINDSTATUS_PUBLISHERAVAILABLE = 51;
pub const BINDSTATUS_DISPLAYNAMEAVAILABLE = 52;
pub const BINDSTATUS_SSLUX_NAVBLOCKED = 53;
pub const BINDSTATUS_SERVER_MIMETYPEAVAILABLE = 54;
pub const BINDSTATUS_SNIFFED_CLASSIDAVAILABLE = 55;
pub const BINDSTATUS_64BIT_PROGRESS = 56;
pub const BINDSTATUS_LAST = 56;
pub const BINDSTATUS_RESERVED_0 = 57;
pub const BINDSTATUS_RESERVED_1 = 58;
pub const BINDSTATUS_RESERVED_2 = 59;
pub const BINDSTATUS_RESERVED_3 = 60;
pub const BINDSTATUS_RESERVED_4 = 61;
pub const BINDSTATUS_RESERVED_5 = 62;
pub const BINDSTATUS_RESERVED_6 = 63;
pub const BINDSTATUS_RESERVED_7 = 64;
pub const BINDSTATUS_RESERVED_8 = 65;
pub const BINDSTATUS_RESERVED_9 = 66;
pub const BINDSTATUS_RESERVED_A = 67;
pub const BINDSTATUS_RESERVED_B = 68;
pub const BINDSTATUS_RESERVED_C = 69;
pub const BINDSTATUS_RESERVED_D = 70;
pub const BINDSTATUS_RESERVED_E = 71;
pub const BINDSTATUS_RESERVED_F = 72;
pub const BINDSTATUS_RESERVED_10 = 73;
pub const BINDSTATUS_RESERVED_11 = 74;
pub const BINDSTATUS_RESERVED_12 = 75;
pub const BINDSTATUS_RESERVED_13 = 76;
pub const BINDSTATUS_RESERVED_14 = 77;
pub const BINDSTATUS_LAST_PRIVATE = 77;
pub const BINDF2_DISABLEBASICOVERHTTP = 1;
pub const BINDF2_DISABLEAUTOCOOKIEHANDLING = 2;
pub const BINDF2_READ_DATA_GREATER_THAN_4GB = 4;
pub const BINDF2_DISABLE_HTTP_REDIRECT_XSECURITYID = 8;
pub const BINDF2_SETDOWNLOADMODE = 32;
pub const BINDF2_DISABLE_HTTP_REDIRECT_CACHING = 64;
pub const BINDF2_KEEP_CALLBACK_MODULE_LOADED = 128;
pub const BINDF2_ALLOW_PROXY_CRED_PROMPT = 256;
pub const BINDF2_RESERVED_17 = 512;
pub const BINDF2_RESERVED_16 = 1024;
pub const BINDF2_RESERVED_15 = 2048;
pub const BINDF2_RESERVED_14 = 4096;
pub const BINDF2_RESERVED_13 = 8192;
pub const BINDF2_RESERVED_12 = 16384;
pub const BINDF2_RESERVED_11 = 32768;
pub const BINDF2_RESERVED_10 = 65536;
pub const BINDF2_RESERVED_F = 131072;
pub const BINDF2_RESERVED_E = 262144;
pub const BINDF2_RESERVED_D = 524288;
pub const BINDF2_RESERVED_C = 1048576;
pub const BINDF2_RESERVED_B = 2097152;
pub const BINDF2_RESERVED_A = 4194304;
pub const BINDF2_RESERVED_9 = 8388608;
pub const BINDF2_RESERVED_8 = 16777216;
pub const BINDF2_RESERVED_7 = 33554432;
pub const BINDF2_RESERVED_6 = 67108864;
pub const BINDF2_RESERVED_5 = 134217728;
pub const BINDF2_RESERVED_4 = 268435456;
pub const BINDF2_RESERVED_3 = 536870912;
pub const BINDF2_RESERVED_2 = 1073741824;
pub const BINDF2_RESERVED_1 = -2147483648;
pub const AUTHENTICATEF_PROXY = 1;
pub const AUTHENTICATEF_BASIC = 2;
pub const AUTHENTICATEF_HTTP = 4;
pub const CIP_DISK_FULL = 0;
pub const CIP_ACCESS_DENIED = 1;
pub const CIP_NEWER_VERSION_EXISTS = 2;
pub const CIP_OLDER_VERSION_EXISTS = 3;
pub const CIP_NAME_CONFLICT = 4;
pub const CIP_TRUST_VERIFICATION_COMPONENT_MISSING = 5;
pub const CIP_EXE_SELF_REGISTERATION_TIMEOUT = 6;
pub const CIP_UNSAFE_TO_ABORT = 7;
pub const CIP_NEED_REBOOT = 8;
pub const CIP_NEED_REBOOT_UI_PERMISSION = 9;
pub const Uri_HOST_UNKNOWN = 0;
pub const Uri_HOST_DNS = 1;
pub const Uri_HOST_IPV4 = 2;
pub const Uri_HOST_IPV6 = 3;
pub const Uri_HOST_IDN = 4;
pub const BINDSTRING_HEADERS = 1;
pub const BINDSTRING_ACCEPT_MIMES = 2;
pub const BINDSTRING_EXTRA_URL = 3;
pub const BINDSTRING_LANGUAGE = 4;
pub const BINDSTRING_USERNAME = 5;
pub const BINDSTRING_PASSWORD = 6;
pub const BINDSTRING_UA_PIXELS = 7;
pub const BINDSTRING_UA_COLOR = 8;
pub const BINDSTRING_OS = 9;
pub const BINDSTRING_USER_AGENT = 10;
pub const BINDSTRING_ACCEPT_ENCODINGS = 11;
pub const BINDSTRING_POST_COOKIE = 12;
pub const BINDSTRING_POST_DATA_MIME = 13;
pub const BINDSTRING_URL = 14;
pub const BINDSTRING_IID = 15;
pub const BINDSTRING_FLAG_BIND_TO_OBJECT = 16;
pub const BINDSTRING_PTR_BIND_CONTEXT = 17;
pub const BINDSTRING_XDR_ORIGIN = 18;
pub const BINDSTRING_DOWNLOADPATH = 19;
pub const BINDSTRING_ROOTDOC_URL = 20;
pub const BINDSTRING_INITIAL_FILENAME = 21;
pub const BINDSTRING_PROXY_USERNAME = 22;
pub const BINDSTRING_PROXY_PASSWORD = 23;
pub const BINDSTRING_ENTERPRISE_ID = 24;
pub const BINDSTRING_DOC_URL = 25;
pub const BINDSTRING_SAMESITE_COOKIE_LEVEL = 26;
pub const PI_PARSE_URL = 1;
pub const PI_FILTER_MODE = 2;
pub const PI_FORCE_ASYNC = 4;
pub const PI_USE_WORKERTHREAD = 8;
pub const PI_MIMEVERIFICATION = 16;
pub const PI_CLSIDLOOKUP = 32;
pub const PI_DATAPROGRESS = 64;
pub const PI_SYNCHRONOUS = 128;
pub const PI_APARTMENTTHREADED = 256;
pub const PI_CLASSINSTALL = 512;
pub const PI_PASSONBINDCTX = 8192;
pub const PI_NOMIMEHANDLER = 32768;
pub const PI_LOADAPPDIRECT = 16384;
pub const PD_FORCE_SWITCH = 65536;
pub const PI_PREFERDEFAULTHANDLER = 131072;
pub const OIBDG_APARTMENTTHREADED = 256;
pub const OIBDG_DATAONLY = 4096;
pub const PARSE_CANONICALIZE = 1;
pub const PARSE_FRIENDLY = 2;
pub const PARSE_SECURITY_URL = 3;
pub const PARSE_ROOTDOCUMENT = 4;
pub const PARSE_DOCUMENT = 5;
pub const PARSE_ANCHOR = 6;
pub const PARSE_ENCODE_IS_UNESCAPE = 7;
pub const PARSE_DECODE_IS_ESCAPE = 8;
pub const PARSE_PATH_FROM_URL = 9;
pub const PARSE_URL_FROM_PATH = 10;
pub const PARSE_MIME = 11;
pub const PARSE_SERVER = 12;
pub const PARSE_SCHEMA = 13;
pub const PARSE_SITE = 14;
pub const PARSE_DOMAIN = 15;
pub const PARSE_LOCATION = 16;
pub const PARSE_SECURITY_DOMAIN = 17;
pub const PARSE_ESCAPE = 18;
pub const PARSE_UNESCAPE = 19;
pub const PSU_DEFAULT = 1;
pub const PSU_SECURITY_URL_ONLY = 2;
pub const QUERY_EXPIRATION_DATE = 1;
pub const QUERY_TIME_OF_LAST_CHANGE = 2;
pub const QUERY_CONTENT_ENCODING = 3;
pub const QUERY_CONTENT_TYPE = 4;
pub const QUERY_REFRESH = 5;
pub const QUERY_RECOMBINE = 6;
pub const QUERY_CAN_NAVIGATE = 7;
pub const QUERY_USES_NETWORK = 8;
pub const QUERY_IS_CACHED = 9;
pub const QUERY_IS_INSTALLEDENTRY = 10;
pub const QUERY_IS_CACHED_OR_MAPPED = 11;
pub const QUERY_USES_CACHE = 12;
pub const QUERY_IS_SECURE = 13;
pub const QUERY_IS_SAFE = 14;
pub const QUERY_USES_HISTORYFOLDER = 15;
pub const QUERY_IS_CACHED_AND_USABLE_OFFLINE = 16;
pub const FEATURE_OBJECT_CACHING = 0;
pub const FEATURE_ZONE_ELEVATION = 1;
pub const FEATURE_MIME_HANDLING = 2;
pub const FEATURE_MIME_SNIFFING = 3;
pub const FEATURE_WINDOW_RESTRICTIONS = 4;
pub const FEATURE_WEBOC_POPUPMANAGEMENT = 5;
pub const FEATURE_BEHAVIORS = 6;
pub const FEATURE_DISABLE_MK_PROTOCOL = 7;
pub const FEATURE_LOCALMACHINE_LOCKDOWN = 8;
pub const FEATURE_SECURITYBAND = 9;
pub const FEATURE_RESTRICT_ACTIVEXINSTALL = 10;
pub const FEATURE_VALIDATE_NAVIGATE_URL = 11;
pub const FEATURE_RESTRICT_FILEDOWNLOAD = 12;
pub const FEATURE_ADDON_MANAGEMENT = 13;
pub const FEATURE_PROTOCOL_LOCKDOWN = 14;
pub const FEATURE_HTTP_USERNAME_PASSWORD_DISABLE = 15;
pub const FEATURE_SAFE_BINDTOOBJECT = 16;
pub const FEATURE_UNC_SAVEDFILECHECK = 17;
pub const FEATURE_GET_URL_DOM_FILEPATH_UNENCODED = 18;
pub const FEATURE_TABBED_BROWSING = 19;
pub const FEATURE_SSLUX = 20;
pub const FEATURE_DISABLE_NAVIGATION_SOUNDS = 21;
pub const FEATURE_DISABLE_LEGACY_COMPRESSION = 22;
pub const FEATURE_FORCE_ADDR_AND_STATUS = 23;
pub const FEATURE_XMLHTTP = 24;
pub const FEATURE_DISABLE_TELNET_PROTOCOL = 25;
pub const FEATURE_FEEDS = 26;
pub const FEATURE_BLOCK_INPUT_PROMPTS = 27;
pub const FEATURE_ENTRY_COUNT = 28;
pub const PUAF_DEFAULT = 0;
pub const PUAF_NOUI = 1;
pub const PUAF_ISFILE = 2;
pub const PUAF_WARN_IF_DENIED = 4;
pub const PUAF_FORCEUI_FOREGROUND = 8;
pub const PUAF_CHECK_TIFS = 16;
pub const PUAF_DONTCHECKBOXINDIALOG = 32;
pub const PUAF_TRUSTED = 64;
pub const PUAF_ACCEPT_WILDCARD_SCHEME = 128;
pub const PUAF_ENFORCERESTRICTED = 256;
pub const PUAF_NOSAVEDFILECHECK = 512;
pub const PUAF_REQUIRESAVEDFILECHECK = 1024;
pub const PUAF_DONT_USE_CACHE = 4096;
pub const PUAF_RESERVED1 = 8192;
pub const PUAF_RESERVED2 = 16384;
pub const PUAF_LMZ_UNLOCKED = 65536;
pub const PUAF_LMZ_LOCKED = 131072;
pub const PUAF_DEFAULTZONEPOL = 262144;
pub const PUAF_NPL_USE_LOCKED_IF_RESTRICTED = 524288;
pub const PUAF_NOUIIFLOCKED = 1048576;
pub const PUAF_DRAGPROTOCOLCHECK = 2097152;
pub const PUAFOUT_DEFAULT = 0;
pub const PUAFOUT_ISLOCKZONEPOLICY = 1;
pub const SZM_CREATE = 0;
pub const SZM_DELETE = 1;
pub const URLZONE_INVALID = -1;
pub const URLZONE_PREDEFINED_MIN = 0;
pub const URLZONE_LOCAL_MACHINE = 0;
pub const URLZONE_INTRANET = 1;
pub const URLZONE_TRUSTED = 2;
pub const URLZONE_INTERNET = 3;
pub const URLZONE_UNTRUSTED = 4;
pub const URLZONE_PREDEFINED_MAX = 999;
pub const URLZONE_USER_MIN = 1000;
pub const URLZONE_USER_MAX = 10000;
pub const URLTEMPLATE_CUSTOM = 0;
pub const URLTEMPLATE_PREDEFINED_MIN = 65536;
pub const URLTEMPLATE_LOW = 65536;
pub const URLTEMPLATE_MEDLOW = 66816;
pub const URLTEMPLATE_MEDIUM = 69632;
pub const URLTEMPLATE_MEDHIGH = 70912;
pub const URLTEMPLATE_HIGH = 73728;
pub const URLTEMPLATE_PREDEFINED_MAX = 131072;
pub const MAX_ZONE_PATH = 260;
pub const MAX_ZONE_DESCRIPTION = 200;
pub const ZAFLAGS_CUSTOM_EDIT = 1;
pub const ZAFLAGS_ADD_SITES = 2;
pub const ZAFLAGS_REQUIRE_VERIFICATION = 4;
pub const ZAFLAGS_INCLUDE_PROXY_OVERRIDE = 8;
pub const ZAFLAGS_INCLUDE_INTRANET_SITES = 16;
pub const ZAFLAGS_NO_UI = 32;
pub const ZAFLAGS_SUPPORTS_VERIFICATION = 64;
pub const ZAFLAGS_UNC_AS_INTRANET = 128;
pub const ZAFLAGS_DETECT_INTRANET = 256;
pub const ZAFLAGS_USE_LOCKED_ZONES = 65536;
pub const ZAFLAGS_VERIFY_TEMPLATE_SETTINGS = 131072;
pub const ZAFLAGS_NO_CACHE = 262144;
pub const URLZONEREG_DEFAULT = 0;
pub const URLZONEREG_HKLM = 1;
pub const URLZONEREG_HKCU = 2;
pub const BINDHANDLETYPES_APPCACHE = 0;
pub const BINDHANDLETYPES_DEPENDENCY = 1;
pub const BINDHANDLETYPES_COUNT = 2;

pub const aliases = struct {
    pub const IEObjectType = i32;
    pub const MONIKERPROPERTY = i32;
    pub const BINDVERB = i32;
    pub const BINDF = i32;
    pub const URL_ENCODING = i32;
    pub const BINDINFO_OPTIONS = i32;
    pub const BSCF = i32;
    pub const BINDSTATUS = i32;
    pub const BINDF2 = i32;
    pub const AUTHENTICATEF = i32;
    pub const CIP_STATUS = i32;
    pub const Uri_HOST_TYPE = i32;
    pub const BINDSTRING = i32;
    pub const PI_FLAGS = i32;
    pub const OIBDG_FLAGS = i32;
    pub const PARSEACTION = i32;
    pub const PSUACTION = i32;
    pub const QUERYOPTION = i32;
    pub const INTERNETFEATURELIST = i32;
    pub const PUAF = i32;
    pub const PUAFOUT = i32;
    pub const SZM_FLAGS = i32;
    pub const URLZONE = i32;
    pub const URLTEMPLATE = i32;
    pub const INET_ZONE_MANAGER_CONSTANTS = i32;
    pub const ZAFLAGS = i32;
    pub const URLZONEREG = i32;
    pub const BINDHANDLETYPES = i32;
};
