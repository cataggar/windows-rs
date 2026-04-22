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
    .{ "SaferGetPolicyInformation", MethodRecord{ .library = "ADVAPI32", .import = "SaferGetPolicyInformation", .signature = "\x00\x06\x11\x59\x09\x11\xbb\x69\x09\x0f\x01\x0f\x09\x0f\x01" } },
    .{ "SaferSetPolicyInformation", MethodRecord{ .library = "ADVAPI32", .import = "SaferSetPolicyInformation", .signature = "\x00\x05\x11\x59\x09\x11\xbb\x69\x09\x0f\x01\x0f\x01" } },
    .{ "SaferCreateLevel", MethodRecord{ .library = "ADVAPI32", .import = "SaferCreateLevel", .signature = "\x00\x05\x11\x59\x09\x09\x09\x0f\x11\xbb\x6d\x0f\x01" } },
    .{ "SaferCloseLevel", MethodRecord{ .library = "ADVAPI32", .import = "SaferCloseLevel", .signature = "\x00\x01\x11\x59\x11\xbb\x6d" } },
    .{ "SaferIdentifyLevel", MethodRecord{ .library = "ADVAPI32", .import = "SaferIdentifyLevel", .signature = "\x00\x04\x11\x59\x09\x0f\x11\xbb\x71\x0f\x11\xbb\x6d\x0f\x01" } },
    .{ "SaferComputeTokenFromLevel", MethodRecord{ .library = "ADVAPI32", .import = "SaferComputeTokenFromLevel", .signature = "\x00\x05\x11\x59\x11\xbb\x6d\x11\x80\x85\x0f\x11\x80\x85\x11\x9b\x0d\x0f\x01" } },
    .{ "SaferGetLevelInformation", MethodRecord{ .library = "ADVAPI32", .import = "SaferGetLevelInformation", .signature = "\x00\x05\x11\x59\x11\xbb\x6d\x11\xbb\x75\x0f\x01\x09\x0f\x09" } },
    .{ "SaferSetLevelInformation", MethodRecord{ .library = "ADVAPI32", .import = "SaferSetLevelInformation", .signature = "\x00\x04\x11\x59\x11\xbb\x6d\x11\xbb\x75\x0f\x01\x09" } },
    .{ "SaferRecordEventLogEntry", MethodRecord{ .library = "ADVAPI32", .import = "SaferRecordEventLogEntry", .signature = "\x00\x03\x11\x59\x11\xbb\x6d\x11\x05\x0f\x01" } },
    .{ "SaferiIsExecutableFileType", MethodRecord{ .library = "ADVAPI32", .import = "SaferiIsExecutableFileType", .signature = "\x00\x02\x11\x59\x11\x05\x11\x87\x79" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0x1b0d => TypeRefEntry{ .namespace = "Windows.Win32.Security.AppLocker", .name = "SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS" },
        0x3b69 => TypeRefEntry{ .namespace = "Windows.Win32.Security.AppLocker", .name = "SAFER_POLICY_INFO_CLASS" },
        0x3b6d => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SAFER_LEVEL_HANDLE" },
        0x3b71 => TypeRefEntry{ .namespace = "Windows.Win32.Security.AppLocker", .name = "SAFER_CODE_PROPERTIES_V2" },
        0x3b75 => TypeRefEntry{ .namespace = "Windows.Win32.Security.AppLocker", .name = "SAFER_OBJECT_INFO_CLASS" },
        else => null,
    };
}

pub const SAFER_TOKEN_NULL_IF_EQUAL = 1;
pub const SAFER_TOKEN_COMPARE_ONLY = 2;
pub const SAFER_TOKEN_MAKE_INERT = 4;
pub const SAFER_TOKEN_WANT_FLAGS = 8;
pub const SAFER_SCOPEID_MACHINE = 1;
pub const SAFER_SCOPEID_USER = 2;
pub const SAFER_LEVELID_FULLYTRUSTED = 262144;
pub const SAFER_LEVELID_NORMALUSER = 131072;
pub const SAFER_LEVELID_CONSTRAINED = 65536;
pub const SAFER_LEVELID_UNTRUSTED = 4096;
pub const SAFER_LEVELID_DISALLOWED = 0;
pub const SAFER_LEVEL_OPEN = 1;
pub const SAFER_MAX_FRIENDLYNAME_SIZE = 256;
pub const SAFER_MAX_DESCRIPTION_SIZE = 256;
pub const SAFER_MAX_HASH_SIZE = 64;
pub const SAFER_CRITERIA_IMAGEPATH = 1;
pub const SAFER_CRITERIA_NOSIGNEDHASH = 2;
pub const SAFER_CRITERIA_IMAGEHASH = 4;
pub const SAFER_CRITERIA_AUTHENTICODE = 8;
pub const SAFER_CRITERIA_URLZONE = 16;
pub const SAFER_CRITERIA_APPX_PACKAGE = 32;
pub const SAFER_CRITERIA_IMAGEPATH_NT = 4096;
pub const SAFER_POLICY_JOBID_MASK = 4278190080;
pub const SAFER_POLICY_JOBID_CONSTRAINED = 67108864;
pub const SAFER_POLICY_JOBID_UNTRUSTED = 50331648;
pub const SAFER_POLICY_ONLY_EXES = 65536;
pub const SAFER_POLICY_SANDBOX_INERT = 131072;
pub const SAFER_POLICY_HASH_DUPLICATE = 262144;
pub const SAFER_POLICY_ONLY_AUDIT = 4096;
pub const SAFER_POLICY_BLOCK_CLIENT_UI = 8192;
pub const SAFER_POLICY_UIFLAGS_MASK = 255;
pub const SAFER_POLICY_UIFLAGS_INFORMATION_PROMPT = 1;
pub const SAFER_POLICY_UIFLAGS_OPTION_PROMPT = 2;
pub const SAFER_POLICY_UIFLAGS_HIDDEN = 4;
pub const SaferPolicyLevelList = 1;
pub const SaferPolicyEnableTransparentEnforcement = 2;
pub const SaferPolicyDefaultLevel = 3;
pub const SaferPolicyEvaluateUserScope = 4;
pub const SaferPolicyScopeFlags = 5;
pub const SaferPolicyDefaultLevelFlags = 6;
pub const SaferPolicyAuthenticodeEnabled = 7;
pub const SaferObjectLevelId = 1;
pub const SaferObjectScopeId = 2;
pub const SaferObjectFriendlyName = 3;
pub const SaferObjectDescription = 4;
pub const SaferObjectBuiltin = 5;
pub const SaferObjectDisallowed = 6;
pub const SaferObjectDisableMaxPrivilege = 7;
pub const SaferObjectInvertDeletedPrivileges = 8;
pub const SaferObjectDeletedPrivileges = 9;
pub const SaferObjectDefaultOwner = 10;
pub const SaferObjectSidsToDisable = 11;
pub const SaferObjectRestrictedSidsInverted = 12;
pub const SaferObjectRestrictedSidsAdded = 13;
pub const SaferObjectAllIdentificationGuids = 14;
pub const SaferObjectSingleIdentification = 15;
pub const SaferObjectExtendedError = 16;
pub const SaferIdentityDefault = 0;
pub const SaferIdentityTypeImageName = 1;
pub const SaferIdentityTypeImageHash = 2;
pub const SaferIdentityTypeUrlZone = 3;
pub const SaferIdentityTypeCertificate = 4;

pub const aliases = struct {
    pub const SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS = u32;
    pub const SAFER_POLICY_INFO_CLASS = i32;
    pub const SAFER_OBJECT_INFO_CLASS = i32;
    pub const SAFER_IDENTIFICATION_TYPES = i32;
};
