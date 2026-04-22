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
    .{ "DRMSetGlobalOptions", MethodRecord{ .library = "msdrm", .import = "DRMSetGlobalOptions", .signature = "\x00\x03\x11\x79\x11\xa8\x19\x0f\x01\x09" } },
    .{ "DRMGetClientVersion", MethodRecord{ .library = "msdrm", .import = "DRMGetClientVersion", .signature = "\x00\x01\x11\x79\x0f\x11\xa8\x1d" } },
    .{ "DRMInitEnvironment", MethodRecord{ .library = "msdrm", .import = "DRMInitEnvironment", .signature = "\x00\x07\x11\x79\x11\xa8\x21\x11\xa8\x25\x11\x05\x11\x05\x11\x05\x0f\x09\x0f\x09" } },
    .{ "DRMLoadLibrary", MethodRecord{ .library = "msdrm", .import = "DRMLoadLibrary", .signature = "\x00\x05\x11\x79\x09\x11\xa8\x25\x11\x05\x11\x05\x0f\x09" } },
    .{ "DRMCreateEnablingPrincipal", MethodRecord{ .library = "msdrm", .import = "DRMCreateEnablingPrincipal", .signature = "\x00\x06\x11\x79\x09\x09\x11\x05\x0f\x11\xa8\x29\x11\x05\x0f\x09" } },
    .{ "DRMCloseHandle", MethodRecord{ .library = "msdrm", .import = "DRMCloseHandle", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "DRMCloseEnvironmentHandle", MethodRecord{ .library = "msdrm", .import = "DRMCloseEnvironmentHandle", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "DRMDuplicateHandle", MethodRecord{ .library = "msdrm", .import = "DRMDuplicateHandle", .signature = "\x00\x02\x11\x79\x09\x0f\x09" } },
    .{ "DRMDuplicateEnvironmentHandle", MethodRecord{ .library = "msdrm", .import = "DRMDuplicateEnvironmentHandle", .signature = "\x00\x02\x11\x79\x09\x0f\x09" } },
    .{ "DRMRegisterRevocationList", MethodRecord{ .library = "msdrm", .import = "DRMRegisterRevocationList", .signature = "\x00\x02\x11\x79\x09\x11\x05" } },
    .{ "DRMCheckSecurity", MethodRecord{ .library = "msdrm", .import = "DRMCheckSecurity", .signature = "\x00\x02\x11\x79\x09\x09" } },
    .{ "DRMRegisterContent", MethodRecord{ .library = "msdrm", .import = "DRMRegisterContent", .signature = "\x00\x01\x11\x79\x11\x59" } },
    .{ "DRMEncrypt", MethodRecord{ .library = "msdrm", .import = "DRMEncrypt", .signature = "\x00\x06\x11\x79\x09\x09\x09\x0f\x05\x0f\x09\x0f\x05" } },
    .{ "DRMDecrypt", MethodRecord{ .library = "msdrm", .import = "DRMDecrypt", .signature = "\x00\x06\x11\x79\x09\x09\x09\x0f\x05\x0f\x09\x0f\x05" } },
    .{ "DRMCreateBoundLicense", MethodRecord{ .library = "msdrm", .import = "DRMCreateBoundLicense", .signature = "\x00\x05\x11\x79\x09\x0f\x11\xa8\x2d\x11\x05\x0f\x09\x0f\x09" } },
    .{ "DRMCreateEnablingBitsDecryptor", MethodRecord{ .library = "msdrm", .import = "DRMCreateEnablingBitsDecryptor", .signature = "\x00\x05\x11\x79\x09\x11\x05\x09\x11\x05\x0f\x09" } },
    .{ "DRMCreateEnablingBitsEncryptor", MethodRecord{ .library = "msdrm", .import = "DRMCreateEnablingBitsEncryptor", .signature = "\x00\x05\x11\x79\x09\x11\x05\x09\x11\x05\x0f\x09" } },
    .{ "DRMAttest", MethodRecord{ .library = "msdrm", .import = "DRMAttest", .signature = "\x00\x05\x11\x79\x09\x11\x05\x11\xa8\x31\x0f\x09\x11\x05" } },
    .{ "DRMGetTime", MethodRecord{ .library = "msdrm", .import = "DRMGetTime", .signature = "\x00\x03\x11\x79\x09\x11\xa8\x35\x0f\x11\x86\x45" } },
    .{ "DRMGetInfo", MethodRecord{ .library = "msdrm", .import = "DRMGetInfo", .signature = "\x00\x05\x11\x79\x09\x11\x05\x0f\x11\xa8\x39\x0f\x09\x0f\x05" } },
    .{ "DRMGetEnvironmentInfo", MethodRecord{ .library = "msdrm", .import = "DRMGetEnvironmentInfo", .signature = "\x00\x05\x11\x79\x09\x11\x05\x0f\x11\xa8\x39\x0f\x09\x0f\x05" } },
    .{ "DRMGetProcAddress", MethodRecord{ .library = "msdrm", .import = "DRMGetProcAddress", .signature = "\x00\x03\x11\x79\x09\x11\x05\x0f\x12\x96\xe9" } },
    .{ "DRMGetBoundLicenseObjectCount", MethodRecord{ .library = "msdrm", .import = "DRMGetBoundLicenseObjectCount", .signature = "\x00\x03\x11\x79\x09\x11\x05\x0f\x09" } },
    .{ "DRMGetBoundLicenseObject", MethodRecord{ .library = "msdrm", .import = "DRMGetBoundLicenseObject", .signature = "\x00\x04\x11\x79\x09\x11\x05\x09\x0f\x09" } },
    .{ "DRMGetBoundLicenseAttributeCount", MethodRecord{ .library = "msdrm", .import = "DRMGetBoundLicenseAttributeCount", .signature = "\x00\x03\x11\x79\x09\x11\x05\x0f\x09" } },
    .{ "DRMGetBoundLicenseAttribute", MethodRecord{ .library = "msdrm", .import = "DRMGetBoundLicenseAttribute", .signature = "\x00\x06\x11\x79\x09\x11\x05\x09\x0f\x11\xa8\x39\x0f\x09\x0f\x05" } },
    .{ "DRMCreateClientSession", MethodRecord{ .library = "msdrm", .import = "DRMCreateClientSession", .signature = "\x00\x05\x11\x79\x12\xa8\x3d\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "DRMIsActivated", MethodRecord{ .library = "msdrm", .import = "DRMIsActivated", .signature = "\x00\x03\x11\x79\x09\x09\x0f\x11\xa8\x41" } },
    .{ "DRMActivate", MethodRecord{ .library = "msdrm", .import = "DRMActivate", .signature = "\x00\x06\x11\x79\x09\x09\x09\x0f\x11\xa8\x41\x0f\x01\x11\x25" } },
    .{ "DRMGetServiceLocation", MethodRecord{ .library = "msdrm", .import = "DRMGetServiceLocation", .signature = "\x00\x06\x11\x79\x09\x09\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "DRMCreateLicenseStorageSession", MethodRecord{ .library = "msdrm", .import = "DRMCreateLicenseStorageSession", .signature = "\x00\x06\x11\x79\x09\x09\x09\x09\x11\x05\x0f\x09" } },
    .{ "DRMAddLicense", MethodRecord{ .library = "msdrm", .import = "DRMAddLicense", .signature = "\x00\x03\x11\x79\x09\x09\x11\x05" } },
    .{ "DRMAcquireAdvisories", MethodRecord{ .library = "msdrm", .import = "DRMAcquireAdvisories", .signature = "\x00\x04\x11\x79\x09\x11\x05\x11\x05\x0f\x01" } },
    .{ "DRMEnumerateLicense", MethodRecord{ .library = "msdrm", .import = "DRMEnumerateLicense", .signature = "\x00\x06\x11\x79\x09\x09\x09\x0f\x11\x59\x0f\x09\x11\x05" } },
    .{ "DRMAcquireLicense", MethodRecord{ .library = "msdrm", .import = "DRMAcquireLicense", .signature = "\x00\x07\x11\x79\x09\x09\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x01" } },
    .{ "DRMDeleteLicense", MethodRecord{ .library = "msdrm", .import = "DRMDeleteLicense", .signature = "\x00\x02\x11\x79\x09\x11\x05" } },
    .{ "DRMCloseSession", MethodRecord{ .library = "msdrm", .import = "DRMCloseSession", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "DRMDuplicateSession", MethodRecord{ .library = "msdrm", .import = "DRMDuplicateSession", .signature = "\x00\x02\x11\x79\x09\x0f\x09" } },
    .{ "DRMGetSecurityProvider", MethodRecord{ .library = "msdrm", .import = "DRMGetSecurityProvider", .signature = "\x00\x05\x11\x79\x09\x0f\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "DRMEncode", MethodRecord{ .library = "msdrm", .import = "DRMEncode", .signature = "\x00\x05\x11\x79\x11\x05\x09\x0f\x05\x0f\x09\x11\x05" } },
    .{ "DRMDecode", MethodRecord{ .library = "msdrm", .import = "DRMDecode", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x0f\x09\x0f\x05" } },
    .{ "DRMConstructCertificateChain", MethodRecord{ .library = "msdrm", .import = "DRMConstructCertificateChain", .signature = "\x00\x04\x11\x79\x09\x0f\x11\x05\x0f\x09\x11\x05" } },
    .{ "DRMParseUnboundLicense", MethodRecord{ .library = "msdrm", .import = "DRMParseUnboundLicense", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x09" } },
    .{ "DRMCloseQueryHandle", MethodRecord{ .library = "msdrm", .import = "DRMCloseQueryHandle", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "DRMGetUnboundLicenseObjectCount", MethodRecord{ .library = "msdrm", .import = "DRMGetUnboundLicenseObjectCount", .signature = "\x00\x03\x11\x79\x09\x11\x05\x0f\x09" } },
    .{ "DRMGetUnboundLicenseObject", MethodRecord{ .library = "msdrm", .import = "DRMGetUnboundLicenseObject", .signature = "\x00\x04\x11\x79\x09\x11\x05\x09\x0f\x09" } },
    .{ "DRMGetUnboundLicenseAttributeCount", MethodRecord{ .library = "msdrm", .import = "DRMGetUnboundLicenseAttributeCount", .signature = "\x00\x03\x11\x79\x09\x11\x05\x0f\x09" } },
    .{ "DRMGetUnboundLicenseAttribute", MethodRecord{ .library = "msdrm", .import = "DRMGetUnboundLicenseAttribute", .signature = "\x00\x06\x11\x79\x09\x11\x05\x09\x0f\x11\xa8\x39\x0f\x09\x0f\x05" } },
    .{ "DRMGetCertificateChainCount", MethodRecord{ .library = "msdrm", .import = "DRMGetCertificateChainCount", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x09" } },
    .{ "DRMDeconstructCertificateChain", MethodRecord{ .library = "msdrm", .import = "DRMDeconstructCertificateChain", .signature = "\x00\x04\x11\x79\x11\x05\x09\x0f\x09\x11\x05" } },
    .{ "DRMVerify", MethodRecord{ .library = "msdrm", .import = "DRMVerify", .signature = "\x00\x08\x11\x79\x11\x05\x0f\x09\x11\x05\x0f\x11\xa8\x31\x0f\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "DRMCreateUser", MethodRecord{ .library = "msdrm", .import = "DRMCreateUser", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x11\x05\x0f\x09" } },
    .{ "DRMCreateRight", MethodRecord{ .library = "msdrm", .import = "DRMCreateRight", .signature = "\x00\x07\x11\x79\x11\x05\x0f\x11\x86\x45\x0f\x11\x86\x45\x09\x0f\x11\x05\x0f\x11\x05\x0f\x09" } },
    .{ "DRMCreateIssuanceLicense", MethodRecord{ .library = "msdrm", .import = "DRMCreateIssuanceLicense", .signature = "\x00\x08\x11\x79\x0f\x11\x86\x45\x0f\x11\x86\x45\x11\x05\x11\x05\x09\x11\x05\x09\x0f\x09" } },
    .{ "DRMAddRightWithUser", MethodRecord{ .library = "msdrm", .import = "DRMAddRightWithUser", .signature = "\x00\x03\x11\x79\x09\x09\x09" } },
    .{ "DRMClearAllRights", MethodRecord{ .library = "msdrm", .import = "DRMClearAllRights", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "DRMSetMetaData", MethodRecord{ .library = "msdrm", .import = "DRMSetMetaData", .signature = "\x00\x07\x11\x79\x09\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "DRMSetUsagePolicy", MethodRecord{ .library = "msdrm", .import = "DRMSetUsagePolicy", .signature = "\x00\x0b\x11\x79\x09\x11\xa8\x45\x11\x59\x11\x59\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x05\x09" } },
    .{ "DRMSetRevocationPoint", MethodRecord{ .library = "msdrm", .import = "DRMSetRevocationPoint", .signature = "\x00\x08\x11\x79\x09\x11\x59\x11\x05\x11\x05\x11\x05\x0f\x11\x86\x45\x11\x05\x11\x05" } },
    .{ "DRMSetApplicationSpecificData", MethodRecord{ .library = "msdrm", .import = "DRMSetApplicationSpecificData", .signature = "\x00\x04\x11\x79\x09\x11\x59\x11\x05\x11\x05" } },
    .{ "DRMSetNameAndDescription", MethodRecord{ .library = "msdrm", .import = "DRMSetNameAndDescription", .signature = "\x00\x05\x11\x79\x09\x11\x59\x09\x11\x05\x11\x05" } },
    .{ "DRMSetIntervalTime", MethodRecord{ .library = "msdrm", .import = "DRMSetIntervalTime", .signature = "\x00\x02\x11\x79\x09\x09" } },
    .{ "DRMGetIssuanceLicenseTemplate", MethodRecord{ .library = "msdrm", .import = "DRMGetIssuanceLicenseTemplate", .signature = "\x00\x03\x11\x79\x09\x0f\x09\x11\x05" } },
    .{ "DRMGetSignedIssuanceLicense", MethodRecord{ .library = "msdrm", .import = "DRMGetSignedIssuanceLicense", .signature = "\x00\x0a\x11\x79\x09\x09\x09\x0f\x05\x09\x11\x05\x11\x05\x12\xa8\x3d\x11\x05\x0f\x01" } },
    .{ "DRMGetSignedIssuanceLicenseEx", MethodRecord{ .library = "msdrm", .import = "DRMGetSignedIssuanceLicenseEx", .signature = "\x00\x0b\x11\x79\x09\x09\x09\x0f\x05\x09\x11\x05\x0f\x01\x09\x09\x12\xa8\x3d\x0f\x01" } },
    .{ "DRMClosePubHandle", MethodRecord{ .library = "msdrm", .import = "DRMClosePubHandle", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "DRMDuplicatePubHandle", MethodRecord{ .library = "msdrm", .import = "DRMDuplicatePubHandle", .signature = "\x00\x02\x11\x79\x09\x0f\x09" } },
    .{ "DRMGetUserInfo", MethodRecord{ .library = "msdrm", .import = "DRMGetUserInfo", .signature = "\x00\x07\x11\x79\x09\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "DRMGetRightInfo", MethodRecord{ .library = "msdrm", .import = "DRMGetRightInfo", .signature = "\x00\x05\x11\x79\x09\x0f\x09\x11\x05\x0f\x11\x86\x45\x0f\x11\x86\x45" } },
    .{ "DRMGetRightExtendedInfo", MethodRecord{ .library = "msdrm", .import = "DRMGetRightExtendedInfo", .signature = "\x00\x06\x11\x79\x09\x09\x0f\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "DRMGetUsers", MethodRecord{ .library = "msdrm", .import = "DRMGetUsers", .signature = "\x00\x03\x11\x79\x09\x09\x0f\x09" } },
    .{ "DRMGetUserRights", MethodRecord{ .library = "msdrm", .import = "DRMGetUserRights", .signature = "\x00\x04\x11\x79\x09\x09\x09\x0f\x09" } },
    .{ "DRMGetMetaData", MethodRecord{ .library = "msdrm", .import = "DRMGetMetaData", .signature = "\x00\x0d\x11\x79\x09\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "DRMGetApplicationSpecificData", MethodRecord{ .library = "msdrm", .import = "DRMGetApplicationSpecificData", .signature = "\x00\x06\x11\x79\x09\x09\x0f\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "DRMGetIssuanceLicenseInfo", MethodRecord{ .library = "msdrm", .import = "DRMGetIssuanceLicenseInfo", .signature = "\x00\x0a\x11\x79\x09\x0f\x11\x86\x45\x0f\x11\x86\x45\x09\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x0f\x11\x59" } },
    .{ "DRMGetRevocationPoint", MethodRecord{ .library = "msdrm", .import = "DRMGetRevocationPoint", .signature = "\x00\x0c\x11\x79\x09\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x11\x86\x45\x0f\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "DRMGetUsagePolicy", MethodRecord{ .library = "msdrm", .import = "DRMGetUsagePolicy", .signature = "\x00\x10\x11\x79\x09\x09\x0f\x11\xa8\x45\x0f\x11\x59\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x0f\x05" } },
    .{ "DRMGetNameAndDescription", MethodRecord{ .library = "msdrm", .import = "DRMGetNameAndDescription", .signature = "\x00\x07\x11\x79\x09\x09\x0f\x09\x0f\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "DRMGetOwnerLicense", MethodRecord{ .library = "msdrm", .import = "DRMGetOwnerLicense", .signature = "\x00\x03\x11\x79\x09\x0f\x09\x11\x05" } },
    .{ "DRMGetIntervalTime", MethodRecord{ .library = "msdrm", .import = "DRMGetIntervalTime", .signature = "\x00\x02\x11\x79\x09\x0f\x09" } },
    .{ "DRMRepair", MethodRecord{ .library = "msdrm", .import = "DRMRepair", .signature = "\x00\x00\x11\x79" } },
    .{ "DRMRegisterProtectedWindow", MethodRecord{ .library = "msdrm", .import = "DRMRegisterProtectedWindow", .signature = "\x00\x02\x11\x79\x09\x11\x25" } },
    .{ "DRMIsWindowProtected", MethodRecord{ .library = "msdrm", .import = "DRMIsWindowProtected", .signature = "\x00\x02\x11\x79\x11\x25\x0f\x11\x59" } },
    .{ "DRMAcquireIssuanceLicenseTemplate", MethodRecord{ .library = "msdrm", .import = "DRMAcquireIssuanceLicenseTemplate", .signature = "\x00\x07\x11\x79\x09\x09\x0f\x01\x09\x0f\x11\x05\x11\x05\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x645 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SYSTEMTIME" },
        0x16e9 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FARPROC" },
        0x2819 => TypeRefEntry{ .namespace = "Windows.Win32.Data.RightsManagement", .name = "DRMGLOBALOPTIONS" },
        0x281d => TypeRefEntry{ .namespace = "Windows.Win32.Data.RightsManagement", .name = "DRM_CLIENT_VERSION_INFO" },
        0x2821 => TypeRefEntry{ .namespace = "Windows.Win32.Data.RightsManagement", .name = "DRMSECURITYPROVIDERTYPE" },
        0x2825 => TypeRefEntry{ .namespace = "Windows.Win32.Data.RightsManagement", .name = "DRMSPECTYPE" },
        0x2829 => TypeRefEntry{ .namespace = "Windows.Win32.Data.RightsManagement", .name = "DRMID" },
        0x282d => TypeRefEntry{ .namespace = "Windows.Win32.Data.RightsManagement", .name = "DRMBOUNDLICENSEPARAMS" },
        0x2831 => TypeRefEntry{ .namespace = "Windows.Win32.Data.RightsManagement", .name = "DRMATTESTTYPE" },
        0x2835 => TypeRefEntry{ .namespace = "Windows.Win32.Data.RightsManagement", .name = "DRMTIMETYPE" },
        0x2839 => TypeRefEntry{ .namespace = "Windows.Win32.Data.RightsManagement", .name = "DRMENCODINGTYPE" },
        0x283d => TypeRefEntry{ .namespace = "Windows.Win32.Data.RightsManagement", .name = "DRMCALLBACK" },
        0x2841 => TypeRefEntry{ .namespace = "Windows.Win32.Data.RightsManagement", .name = "DRM_ACTSERV_INFO" },
        0x2845 => TypeRefEntry{ .namespace = "Windows.Win32.Data.RightsManagement", .name = "DRM_USAGEPOLICY_TYPE" },
        else => null,
    };
}

pub const DRMHANDLE_INVALID = 0;
pub const DRMENVHANDLE_INVALID = 0;
pub const DRMQUERYHANDLE_INVALID = 0;
pub const DRMHSESSION_INVALID = 0;
pub const DRMPUBHANDLE_INVALID = 0;
pub const DRM_AL_NONSILENT = 1;
pub const DRM_AL_NOPERSIST = 2;
pub const DRM_AL_CANCEL = 4;
pub const DRM_AL_FETCHNOADVISORY = 8;
pub const DRM_AL_NOUI = 16;
pub const DRM_ACTIVATE_MACHINE = 1;
pub const DRM_ACTIVATE_GROUPIDENTITY = 2;
pub const DRM_ACTIVATE_TEMPORARY = 4;
pub const DRM_ACTIVATE_CANCEL = 8;
pub const DRM_ACTIVATE_SILENT = 16;
pub const DRM_ACTIVATE_SHARED_GROUPIDENTITY = 32;
pub const DRM_ACTIVATE_DELAYED = 64;
pub const DRM_EL_MACHINE = 1;
pub const DRM_EL_GROUPIDENTITY = 2;
pub const DRM_EL_GROUPIDENTITY_NAME = 4;
pub const DRM_EL_GROUPIDENTITY_LID = 8;
pub const DRM_EL_SPECIFIED_GROUPIDENTITY = 16;
pub const DRM_EL_EUL = 32;
pub const DRM_EL_EUL_LID = 64;
pub const DRM_EL_CLIENTLICENSOR = 128;
pub const DRM_EL_CLIENTLICENSOR_LID = 256;
pub const DRM_EL_SPECIFIED_CLIENTLICENSOR = 512;
pub const DRM_EL_REVOCATIONLIST = 1024;
pub const DRM_EL_REVOCATIONLIST_LID = 2048;
pub const DRM_EL_EXPIRED = 4096;
pub const DRM_EL_ISSUERNAME = 8192;
pub const DRM_EL_ISSUANCELICENSE_TEMPLATE = 16384;
pub const DRM_EL_ISSUANCELICENSE_TEMPLATE_LID = 32768;
pub const DRM_ADD_LICENSE_NOPERSIST = 0;
pub const DRM_ADD_LICENSE_PERSIST = 1;
pub const DRM_SERVICE_TYPE_ACTIVATION = 1;
pub const DRM_SERVICE_TYPE_CERTIFICATION = 2;
pub const DRM_SERVICE_TYPE_PUBLISHING = 4;
pub const DRM_SERVICE_TYPE_CLIENTLICENSOR = 8;
pub const DRM_SERVICE_TYPE_SILENT = 16;
pub const DRM_SERVICE_LOCATION_INTERNET = 1;
pub const DRM_SERVICE_LOCATION_ENTERPRISE = 2;
pub const DRM_SIGN_ONLINE = 1;
pub const DRM_SIGN_OFFLINE = 2;
pub const DRM_SIGN_CANCEL = 4;
pub const DRM_SERVER_ISSUANCELICENSE = 8;
pub const DRM_AUTO_GENERATE_KEY = 16;
pub const DRM_OWNER_LICENSE_NOPERSIST = 32;
pub const DRM_REUSE_KEY = 64;
pub const DRM_LOCKBOXTYPE_NONE = 0;
pub const DRM_LOCKBOXTYPE_WHITEBOX = 1;
pub const DRM_LOCKBOXTYPE_BLACKBOX = 2;
pub const DRM_LOCKBOXTYPE_DEFAULT = 2;
pub const DRM_AILT_NONSILENT = 1;
pub const DRM_AILT_OBTAIN_ALL = 2;
pub const DRM_AILT_CANCEL = 4;
pub const MSDRM_CLIENT_ZONE = 52992;
pub const MSDRM_POLICY_ZONE = 37632;
pub const DRMIDVERSION = 0;
pub const DRMBOUNDLICENSEPARAMSVERSION = 1;
pub const DRMBINDINGFLAGS_IGNORE_VALIDITY_INTERVALS = 1;
pub const DRMLICENSEACQDATAVERSION = 0;
pub const DRMACTSERVINFOVERSION = 0;
pub const DRMCLIENTSTRUCTVERSION = 1;
pub const DRMCALLBACKVERSION = 1;
pub const DRMTIMETYPE_SYSTEMUTC = 0;
pub const DRMTIMETYPE_SYSTEMLOCAL = 1;
pub const DRMENCODINGTYPE_BASE64 = 0;
pub const DRMENCODINGTYPE_STRING = 1;
pub const DRMENCODINGTYPE_LONG = 2;
pub const DRMENCODINGTYPE_TIME = 3;
pub const DRMENCODINGTYPE_UINT = 4;
pub const DRMENCODINGTYPE_RAW = 5;
pub const DRMATTESTTYPE_FULLENVIRONMENT = 0;
pub const DRMATTESTTYPE_HASHONLY = 1;
pub const DRMSPECTYPE_UNKNOWN = 0;
pub const DRMSPECTYPE_FILENAME = 1;
pub const DRMSECURITYPROVIDERTYPE_SOFTWARESECREP = 0;
pub const DRMGLOBALOPTIONS_USE_WINHTTP = 0;
pub const DRMGLOBALOPTIONS_USE_SERVERSECURITYPROCESSOR = 1;
pub const DRM_MSG_ACTIVATE_MACHINE = 0;
pub const DRM_MSG_ACTIVATE_GROUPIDENTITY = 1;
pub const DRM_MSG_ACQUIRE_LICENSE = 2;
pub const DRM_MSG_ACQUIRE_ADVISORY = 3;
pub const DRM_MSG_SIGN_ISSUANCE_LICENSE = 4;
pub const DRM_MSG_ACQUIRE_CLIENTLICENSOR = 5;
pub const DRM_MSG_ACQUIRE_ISSUANCE_LICENSE_TEMPLATE = 6;
pub const DRM_USAGEPOLICY_TYPE_BYNAME = 0;
pub const DRM_USAGEPOLICY_TYPE_BYPUBLICKEY = 1;
pub const DRM_USAGEPOLICY_TYPE_BYDIGEST = 2;
pub const DRM_USAGEPOLICY_TYPE_OSEXCLUSION = 3;
pub const DRM_DISTRIBUTION_POINT_LICENSE_ACQUISITION = 0;
pub const DRM_DISTRIBUTION_POINT_PUBLISHING = 1;
pub const DRM_DISTRIBUTION_POINT_REFERRAL_INFO = 2;

pub const aliases = struct {
    pub const DRMTIMETYPE = i32;
    pub const DRMENCODINGTYPE = i32;
    pub const DRMATTESTTYPE = i32;
    pub const DRMSPECTYPE = i32;
    pub const DRMSECURITYPROVIDERTYPE = i32;
    pub const DRMGLOBALOPTIONS = i32;
    pub const DRM_STATUS_MSG = i32;
    pub const DRM_USAGEPOLICY_TYPE = i32;
    pub const DRM_DISTRIBUTION_POINT_INFO = i32;
};
