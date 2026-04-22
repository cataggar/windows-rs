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
    .{ "RtlGenRandom", MethodRecord{ .library = "ADVAPI32", .import = "SystemFunction036", .signature = "\x00\x02\x11\x87\x79\x0f\x01\x09" } },
    .{ "RtlEncryptMemory", MethodRecord{ .library = "ADVAPI32", .import = "SystemFunction040", .signature = "\x00\x03\x11\x84\x71\x0f\x01\x09\x09" } },
    .{ "RtlDecryptMemory", MethodRecord{ .library = "ADVAPI32", .import = "SystemFunction041", .signature = "\x00\x03\x11\x84\x71\x0f\x01\x09\x09" } },
    .{ "LsaRegisterLogonProcess", MethodRecord{ .library = "SECUR32", .import = "LsaRegisterLogonProcess", .signature = "\x00\x03\x11\x84\x71\x0f\x11\x93\x59\x0f\x11\x80\x85\x0f\x09" } },
    .{ "LsaLogonUser", MethodRecord{ .library = "SECUR32", .import = "LsaLogonUser", .signature = "\x00\x0e\x11\x84\x71\x11\x80\x85\x0f\x11\x93\x59\x11\x93\x5d\x09\x0f\x01\x09\x0f\x11\x93\x61\x0f\x11\x93\x65\x0f\x0f\x01\x0f\x09\x0f\x11\x93\x69\x0f\x11\x80\x85\x0f\x11\x93\x6d\x0f\x08" } },
    .{ "LsaLookupAuthenticationPackage", MethodRecord{ .library = "SECUR32", .import = "LsaLookupAuthenticationPackage", .signature = "\x00\x03\x11\x84\x71\x11\x80\x85\x0f\x11\x93\x59\x0f\x09" } },
    .{ "LsaFreeReturnBuffer", MethodRecord{ .library = "SECUR32", .import = "LsaFreeReturnBuffer", .signature = "\x00\x01\x11\x84\x71\x0f\x01" } },
    .{ "LsaCallAuthenticationPackage", MethodRecord{ .library = "SECUR32", .import = "LsaCallAuthenticationPackage", .signature = "\x00\x07\x11\x84\x71\x11\x80\x85\x09\x0f\x01\x09\x0f\x0f\x01\x0f\x09\x0f\x08" } },
    .{ "LsaDeregisterLogonProcess", MethodRecord{ .library = "SECUR32", .import = "LsaDeregisterLogonProcess", .signature = "\x00\x01\x11\x84\x71\x11\x80\x85" } },
    .{ "LsaConnectUntrusted", MethodRecord{ .library = "SECUR32", .import = "LsaConnectUntrusted", .signature = "\x00\x01\x11\x84\x71\x0f\x11\x80\x85" } },
    .{ "LsaFreeMemory", MethodRecord{ .library = "ADVAPI32", .import = "LsaFreeMemory", .signature = "\x00\x01\x11\x84\x71\x0f\x01" } },
    .{ "LsaClose", MethodRecord{ .library = "ADVAPI32", .import = "LsaClose", .signature = "\x00\x01\x11\x84\x71\x11\x93\x71" } },
    .{ "LsaEnumerateLogonSessions", MethodRecord{ .library = "SECUR32", .import = "LsaEnumerateLogonSessions", .signature = "\x00\x02\x11\x84\x71\x0f\x09\x0f\x0f\x11\x93\x69" } },
    .{ "LsaGetLogonSessionData", MethodRecord{ .library = "SECUR32", .import = "LsaGetLogonSessionData", .signature = "\x00\x02\x11\x84\x71\x0f\x11\x93\x69\x0f\x0f\x11\x93\x75" } },
    .{ "LsaOpenPolicy", MethodRecord{ .library = "ADVAPI32", .import = "LsaOpenPolicy", .signature = "\x00\x04\x11\x84\x71\x0f\x11\x93\x79\x0f\x11\x93\x7d\x09\x0f\x11\x93\x71" } },
    .{ "LsaSetCAPs", MethodRecord{ .library = "ADVAPI32", .import = "LsaSetCAPs", .signature = "\x00\x03\x11\x84\x71\x0f\x11\x93\x79\x09\x09" } },
    .{ "LsaGetAppliedCAPIDs", MethodRecord{ .library = "ADVAPI32", .import = "LsaGetAppliedCAPIDs", .signature = "\x00\x03\x11\x84\x71\x0f\x11\x93\x79\x0f\x0f\x11\x81\x15\x0f\x09" } },
    .{ "LsaQueryCAPs", MethodRecord{ .library = "ADVAPI32", .import = "LsaQueryCAPs", .signature = "\x00\x04\x11\x84\x71\x0f\x11\x81\x15\x09\x0f\x0f\x11\x93\x81\x0f\x09" } },
    .{ "LsaQueryInformationPolicy", MethodRecord{ .library = "ADVAPI32", .import = "LsaQueryInformationPolicy", .signature = "\x00\x03\x11\x84\x71\x11\x93\x71\x11\x93\x85\x0f\x0f\x01" } },
    .{ "LsaSetInformationPolicy", MethodRecord{ .library = "ADVAPI32", .import = "LsaSetInformationPolicy", .signature = "\x00\x03\x11\x84\x71\x11\x93\x71\x11\x93\x85\x0f\x01" } },
    .{ "LsaQueryDomainInformationPolicy", MethodRecord{ .library = "ADVAPI32", .import = "LsaQueryDomainInformationPolicy", .signature = "\x00\x03\x11\x84\x71\x11\x93\x71\x11\x93\x89\x0f\x0f\x01" } },
    .{ "LsaSetDomainInformationPolicy", MethodRecord{ .library = "ADVAPI32", .import = "LsaSetDomainInformationPolicy", .signature = "\x00\x03\x11\x84\x71\x11\x93\x71\x11\x93\x89\x0f\x01" } },
    .{ "LsaRegisterPolicyChangeNotification", MethodRecord{ .library = "SECUR32", .import = "LsaRegisterPolicyChangeNotification", .signature = "\x00\x02\x11\x84\x71\x11\x93\x8d\x11\x80\x85" } },
    .{ "LsaUnregisterPolicyChangeNotification", MethodRecord{ .library = "SECUR32", .import = "LsaUnregisterPolicyChangeNotification", .signature = "\x00\x02\x11\x84\x71\x11\x93\x8d\x11\x80\x85" } },
    .{ "LsaEnumerateTrustedDomains", MethodRecord{ .library = "ADVAPI32", .import = "LsaEnumerateTrustedDomains", .signature = "\x00\x05\x11\x84\x71\x11\x93\x71\x0f\x09\x0f\x0f\x01\x09\x0f\x09" } },
    .{ "LsaLookupNames", MethodRecord{ .library = "ADVAPI32", .import = "LsaLookupNames", .signature = "\x00\x05\x11\x84\x71\x11\x93\x71\x09\x0f\x11\x93\x79\x0f\x0f\x11\x93\x91\x0f\x0f\x11\x93\x95" } },
    .{ "LsaLookupNames2", MethodRecord{ .library = "ADVAPI32", .import = "LsaLookupNames2", .signature = "\x00\x06\x11\x84\x71\x11\x93\x71\x09\x09\x0f\x11\x93\x79\x0f\x0f\x11\x93\x91\x0f\x0f\x11\x93\x99" } },
    .{ "LsaLookupSids", MethodRecord{ .library = "ADVAPI32", .import = "LsaLookupSids", .signature = "\x00\x05\x11\x84\x71\x11\x93\x71\x09\x0f\x11\x81\x15\x0f\x0f\x11\x93\x91\x0f\x0f\x11\x93\x9d" } },
    .{ "LsaLookupSids2", MethodRecord{ .library = "ADVAPI32", .import = "LsaLookupSids2", .signature = "\x00\x06\x11\x84\x71\x11\x93\x71\x09\x09\x0f\x11\x81\x15\x0f\x0f\x11\x93\x91\x0f\x0f\x11\x93\x9d" } },
    .{ "LsaEnumerateAccountsWithUserRight", MethodRecord{ .library = "ADVAPI32", .import = "LsaEnumerateAccountsWithUserRight", .signature = "\x00\x04\x11\x84\x71\x11\x93\x71\x0f\x11\x93\x79\x0f\x0f\x01\x0f\x09" } },
    .{ "LsaEnumerateAccountRights", MethodRecord{ .library = "ADVAPI32", .import = "LsaEnumerateAccountRights", .signature = "\x00\x04\x11\x84\x71\x11\x93\x71\x11\x81\x15\x0f\x0f\x11\x93\x79\x0f\x09" } },
    .{ "LsaAddAccountRights", MethodRecord{ .library = "ADVAPI32", .import = "LsaAddAccountRights", .signature = "\x00\x04\x11\x84\x71\x11\x93\x71\x11\x81\x15\x0f\x11\x93\x79\x09" } },
    .{ "LsaRemoveAccountRights", MethodRecord{ .library = "ADVAPI32", .import = "LsaRemoveAccountRights", .signature = "\x00\x05\x11\x84\x71\x11\x93\x71\x11\x81\x15\x11\x87\x79\x0f\x11\x93\x79\x09" } },
    .{ "LsaOpenTrustedDomainByName", MethodRecord{ .library = "ADVAPI32", .import = "LsaOpenTrustedDomainByName", .signature = "\x00\x04\x11\x84\x71\x11\x93\x71\x0f\x11\x93\x79\x09\x0f\x11\x93\x71" } },
    .{ "LsaQueryTrustedDomainInfo", MethodRecord{ .library = "ADVAPI32", .import = "LsaQueryTrustedDomainInfo", .signature = "\x00\x04\x11\x84\x71\x11\x93\x71\x11\x81\x15\x11\x93\xa1\x0f\x0f\x01" } },
    .{ "LsaSetTrustedDomainInformation", MethodRecord{ .library = "ADVAPI32", .import = "LsaSetTrustedDomainInformation", .signature = "\x00\x04\x11\x84\x71\x11\x93\x71\x11\x81\x15\x11\x93\xa1\x0f\x01" } },
    .{ "LsaDeleteTrustedDomain", MethodRecord{ .library = "ADVAPI32", .import = "LsaDeleteTrustedDomain", .signature = "\x00\x02\x11\x84\x71\x11\x93\x71\x11\x81\x15" } },
    .{ "LsaQueryTrustedDomainInfoByName", MethodRecord{ .library = "ADVAPI32", .import = "LsaQueryTrustedDomainInfoByName", .signature = "\x00\x04\x11\x84\x71\x11\x93\x71\x0f\x11\x93\x79\x11\x93\xa1\x0f\x0f\x01" } },
    .{ "LsaSetTrustedDomainInfoByName", MethodRecord{ .library = "ADVAPI32", .import = "LsaSetTrustedDomainInfoByName", .signature = "\x00\x04\x11\x84\x71\x11\x93\x71\x0f\x11\x93\x79\x11\x93\xa1\x0f\x01" } },
    .{ "LsaEnumerateTrustedDomainsEx", MethodRecord{ .library = "ADVAPI32", .import = "LsaEnumerateTrustedDomainsEx", .signature = "\x00\x05\x11\x84\x71\x11\x93\x71\x0f\x09\x0f\x0f\x01\x09\x0f\x09" } },
    .{ "LsaCreateTrustedDomainEx", MethodRecord{ .library = "ADVAPI32", .import = "LsaCreateTrustedDomainEx", .signature = "\x00\x05\x11\x84\x71\x11\x93\x71\x0f\x11\x93\xa5\x0f\x11\x93\xa9\x09\x0f\x11\x93\x71" } },
    .{ "LsaQueryForestTrustInformation", MethodRecord{ .library = "ADVAPI32", .import = "LsaQueryForestTrustInformation", .signature = "\x00\x03\x11\x84\x71\x11\x93\x71\x0f\x11\x93\x79\x0f\x0f\x11\x93\xad" } },
    .{ "LsaSetForestTrustInformation", MethodRecord{ .library = "ADVAPI32", .import = "LsaSetForestTrustInformation", .signature = "\x00\x05\x11\x84\x71\x11\x93\x71\x0f\x11\x93\x79\x0f\x11\x93\xad\x11\x87\x79\x0f\x0f\x11\x93\xb1" } },
    .{ "LsaStorePrivateData", MethodRecord{ .library = "ADVAPI32", .import = "LsaStorePrivateData", .signature = "\x00\x03\x11\x84\x71\x11\x93\x71\x0f\x11\x93\x79\x0f\x11\x93\x79" } },
    .{ "LsaRetrievePrivateData", MethodRecord{ .library = "ADVAPI32", .import = "LsaRetrievePrivateData", .signature = "\x00\x03\x11\x84\x71\x11\x93\x71\x0f\x11\x93\x79\x0f\x0f\x11\x93\x79" } },
    .{ "LsaNtStatusToWinError", MethodRecord{ .library = "ADVAPI32", .import = "LsaNtStatusToWinError", .signature = "\x00\x01\x09\x11\x84\x71" } },
    .{ "LsaQueryForestTrustInformation2", MethodRecord{ .library = "ADVAPI32", .import = "LsaQueryForestTrustInformation2", .signature = "\x00\x04\x11\x84\x71\x11\x93\x71\x0f\x11\x93\x79\x11\x93\xb5\x0f\x0f\x11\x93\xb9" } },
    .{ "LsaSetForestTrustInformation2", MethodRecord{ .library = "ADVAPI32", .import = "LsaSetForestTrustInformation2", .signature = "\x00\x06\x11\x84\x71\x11\x93\x71\x0f\x11\x93\x79\x11\x93\xb5\x0f\x11\x93\xb9\x11\x87\x79\x0f\x0f\x11\x93\xb1" } },
    .{ "AuditSetSystemPolicy", MethodRecord{ .library = "ADVAPI32", .import = "AuditSetSystemPolicy", .signature = "\x00\x02\x11\x87\x79\x0f\x11\x93\xbd\x09" } },
    .{ "AuditSetPerUserPolicy", MethodRecord{ .library = "ADVAPI32", .import = "AuditSetPerUserPolicy", .signature = "\x00\x03\x11\x87\x79\x11\x81\x15\x0f\x11\x93\xbd\x09" } },
    .{ "AuditQuerySystemPolicy", MethodRecord{ .library = "ADVAPI32", .import = "AuditQuerySystemPolicy", .signature = "\x00\x03\x11\x87\x79\x0f\x11\x0d\x09\x0f\x0f\x11\x93\xbd" } },
    .{ "AuditQueryPerUserPolicy", MethodRecord{ .library = "ADVAPI32", .import = "AuditQueryPerUserPolicy", .signature = "\x00\x04\x11\x87\x79\x11\x81\x15\x0f\x11\x0d\x09\x0f\x0f\x11\x93\xbd" } },
    .{ "AuditEnumeratePerUserPolicy", MethodRecord{ .library = "ADVAPI32", .import = "AuditEnumeratePerUserPolicy", .signature = "\x00\x01\x11\x87\x79\x0f\x0f\x11\x93\xc1" } },
    .{ "AuditComputeEffectivePolicyBySid", MethodRecord{ .library = "ADVAPI32", .import = "AuditComputeEffectivePolicyBySid", .signature = "\x00\x04\x11\x87\x79\x11\x81\x15\x0f\x11\x0d\x09\x0f\x0f\x11\x93\xbd" } },
    .{ "AuditComputeEffectivePolicyByToken", MethodRecord{ .library = "ADVAPI32", .import = "AuditComputeEffectivePolicyByToken", .signature = "\x00\x04\x11\x87\x79\x11\x80\x85\x0f\x11\x0d\x09\x0f\x0f\x11\x93\xbd" } },
    .{ "AuditEnumerateCategories", MethodRecord{ .library = "ADVAPI32", .import = "AuditEnumerateCategories", .signature = "\x00\x02\x11\x87\x79\x0f\x0f\x11\x0d\x0f\x09" } },
    .{ "AuditEnumerateSubCategories", MethodRecord{ .library = "ADVAPI32", .import = "AuditEnumerateSubCategories", .signature = "\x00\x04\x11\x87\x79\x0f\x11\x0d\x11\x87\x79\x0f\x0f\x11\x0d\x0f\x09" } },
    .{ "AuditLookupCategoryNameW", MethodRecord{ .library = "ADVAPI32", .import = "AuditLookupCategoryNameW", .signature = "\x00\x02\x11\x87\x79\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "AuditLookupCategoryNameA", MethodRecord{ .library = "ADVAPI32", .import = "AuditLookupCategoryNameA", .signature = "\x00\x02\x11\x87\x79\x0f\x11\x0d\x0f\x11\x3d" } },
    .{ "AuditLookupSubCategoryNameW", MethodRecord{ .library = "ADVAPI32", .import = "AuditLookupSubCategoryNameW", .signature = "\x00\x02\x11\x87\x79\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "AuditLookupSubCategoryNameA", MethodRecord{ .library = "ADVAPI32", .import = "AuditLookupSubCategoryNameA", .signature = "\x00\x02\x11\x87\x79\x0f\x11\x0d\x0f\x11\x3d" } },
    .{ "AuditLookupCategoryIdFromCategoryGuid", MethodRecord{ .library = "ADVAPI32", .import = "AuditLookupCategoryIdFromCategoryGuid", .signature = "\x00\x02\x11\x87\x79\x0f\x11\x0d\x0f\x11\x93\xc5" } },
    .{ "AuditLookupCategoryGuidFromCategoryId", MethodRecord{ .library = "ADVAPI32", .import = "AuditLookupCategoryGuidFromCategoryId", .signature = "\x00\x02\x11\x87\x79\x11\x93\xc5\x0f\x11\x0d" } },
    .{ "AuditSetSecurity", MethodRecord{ .library = "ADVAPI32", .import = "AuditSetSecurity", .signature = "\x00\x02\x11\x87\x79\x11\x84\xf9\x11\x82\xad" } },
    .{ "AuditQuerySecurity", MethodRecord{ .library = "ADVAPI32", .import = "AuditQuerySecurity", .signature = "\x00\x02\x11\x87\x79\x11\x84\xf9\x0f\x11\x82\xad" } },
    .{ "AuditSetGlobalSaclW", MethodRecord{ .library = "ADVAPI32", .import = "AuditSetGlobalSaclW", .signature = "\x00\x02\x11\x87\x79\x11\x05\x0f\x11\x93\xc9" } },
    .{ "AuditSetGlobalSaclA", MethodRecord{ .library = "ADVAPI32", .import = "AuditSetGlobalSaclA", .signature = "\x00\x02\x11\x87\x79\x11\x3d\x0f\x11\x93\xc9" } },
    .{ "AuditQueryGlobalSaclW", MethodRecord{ .library = "ADVAPI32", .import = "AuditQueryGlobalSaclW", .signature = "\x00\x02\x11\x87\x79\x11\x05\x0f\x0f\x11\x93\xc9" } },
    .{ "AuditQueryGlobalSaclA", MethodRecord{ .library = "ADVAPI32", .import = "AuditQueryGlobalSaclA", .signature = "\x00\x02\x11\x87\x79\x11\x3d\x0f\x0f\x11\x93\xc9" } },
    .{ "AuditFree", MethodRecord{ .library = "ADVAPI32", .import = "AuditFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "AcquireCredentialsHandleW", MethodRecord{ .library = "SECUR32", .import = "AcquireCredentialsHandleW", .signature = "\x00\x09\x11\x79\x11\x05\x11\x05\x11\x93\xcd\x0f\x01\x0f\x01\x12\x93\xd1\x0f\x01\x0f\x11\x93\xd5\x0f\x0a" } },
    .{ "AcquireCredentialsHandleA", MethodRecord{ .library = "SECUR32", .import = "AcquireCredentialsHandleA", .signature = "\x00\x09\x11\x79\x11\x3d\x11\x3d\x11\x93\xcd\x0f\x01\x0f\x01\x12\x93\xd1\x0f\x01\x0f\x11\x93\xd5\x0f\x0a" } },
    .{ "FreeCredentialsHandle", MethodRecord{ .library = "SECUR32", .import = "FreeCredentialsHandle", .signature = "\x00\x01\x11\x79\x0f\x11\x93\xd5" } },
    .{ "AddCredentialsW", MethodRecord{ .library = "SECUR32", .import = "AddCredentialsW", .signature = "\x00\x08\x11\x79\x0f\x11\x93\xd5\x11\x05\x11\x05\x09\x0f\x01\x12\x93\xd1\x0f\x01\x0f\x0a" } },
    .{ "AddCredentialsA", MethodRecord{ .library = "SECUR32", .import = "AddCredentialsA", .signature = "\x00\x08\x11\x79\x0f\x11\x93\xd5\x11\x3d\x11\x3d\x09\x0f\x01\x12\x93\xd1\x0f\x01\x0f\x0a" } },
    .{ "ChangeAccountPasswordW", MethodRecord{ .library = "SECUR32", .import = "ChangeAccountPasswordW", .signature = "\x00\x08\x11\x79\x0f\x07\x0f\x07\x0f\x07\x0f\x07\x0f\x07\x11\x87\x79\x09\x0f\x11\x93\xd9" } },
    .{ "ChangeAccountPasswordA", MethodRecord{ .library = "SECUR32", .import = "ChangeAccountPasswordA", .signature = "\x00\x08\x11\x79\x0f\x04\x0f\x04\x0f\x04\x0f\x04\x0f\x04\x11\x87\x79\x09\x0f\x11\x93\xd9" } },
    .{ "InitializeSecurityContextW", MethodRecord{ .library = "SECUR32", .import = "InitializeSecurityContextW", .signature = "\x00\x0c\x11\x79\x0f\x11\x93\xd5\x0f\x11\x93\xd5\x0f\x07\x11\x93\xdd\x09\x09\x0f\x11\x93\xd9\x09\x0f\x11\x93\xd5\x0f\x11\x93\xd9\x0f\x09\x0f\x0a" } },
    .{ "InitializeSecurityContextA", MethodRecord{ .library = "SECUR32", .import = "InitializeSecurityContextA", .signature = "\x00\x0c\x11\x79\x0f\x11\x93\xd5\x0f\x11\x93\xd5\x0f\x04\x11\x93\xdd\x09\x09\x0f\x11\x93\xd9\x09\x0f\x11\x93\xd5\x0f\x11\x93\xd9\x0f\x09\x0f\x0a" } },
    .{ "AcceptSecurityContext", MethodRecord{ .library = "SECUR32", .import = "AcceptSecurityContext", .signature = "\x00\x09\x11\x79\x0f\x11\x93\xd5\x0f\x11\x93\xd5\x0f\x11\x93\xd9\x11\x93\xe1\x09\x0f\x11\x93\xd5\x0f\x11\x93\xd9\x0f\x09\x0f\x0a" } },
    .{ "CompleteAuthToken", MethodRecord{ .library = "SECUR32", .import = "CompleteAuthToken", .signature = "\x00\x02\x11\x79\x0f\x11\x93\xd5\x0f\x11\x93\xd9" } },
    .{ "ImpersonateSecurityContext", MethodRecord{ .library = "SECUR32", .import = "ImpersonateSecurityContext", .signature = "\x00\x01\x11\x79\x0f\x11\x93\xd5" } },
    .{ "RevertSecurityContext", MethodRecord{ .library = "SECUR32", .import = "RevertSecurityContext", .signature = "\x00\x01\x11\x79\x0f\x11\x93\xd5" } },
    .{ "QuerySecurityContextToken", MethodRecord{ .library = "SECUR32", .import = "QuerySecurityContextToken", .signature = "\x00\x02\x11\x79\x0f\x11\x93\xd5\x0f\x0f\x01" } },
    .{ "DeleteSecurityContext", MethodRecord{ .library = "SECUR32", .import = "DeleteSecurityContext", .signature = "\x00\x01\x11\x79\x0f\x11\x93\xd5" } },
    .{ "ApplyControlToken", MethodRecord{ .library = "SECUR32", .import = "ApplyControlToken", .signature = "\x00\x02\x11\x79\x0f\x11\x93\xd5\x0f\x11\x93\xd9" } },
    .{ "QueryContextAttributesW", MethodRecord{ .library = "SECUR32", .import = "QueryContextAttributesW", .signature = "\x00\x03\x11\x79\x0f\x11\x93\xd5\x11\x93\xe5\x0f\x01" } },
    .{ "QueryContextAttributesExW", MethodRecord{ .library = "SspiCli", .import = "QueryContextAttributesExW", .signature = "\x00\x04\x11\x79\x0f\x11\x93\xd5\x11\x93\xe5\x0f\x01\x09" } },
    .{ "QueryContextAttributesA", MethodRecord{ .library = "SECUR32", .import = "QueryContextAttributesA", .signature = "\x00\x03\x11\x79\x0f\x11\x93\xd5\x11\x93\xe5\x0f\x01" } },
    .{ "QueryContextAttributesExA", MethodRecord{ .library = "SspiCli", .import = "QueryContextAttributesExA", .signature = "\x00\x04\x11\x79\x0f\x11\x93\xd5\x11\x93\xe5\x0f\x01\x09" } },
    .{ "SetContextAttributesW", MethodRecord{ .library = "SECUR32", .import = "SetContextAttributesW", .signature = "\x00\x04\x11\x79\x0f\x11\x93\xd5\x11\x93\xe5\x0f\x01\x09" } },
    .{ "SetContextAttributesA", MethodRecord{ .library = "SECUR32", .import = "SetContextAttributesA", .signature = "\x00\x04\x11\x79\x0f\x11\x93\xd5\x11\x93\xe5\x0f\x01\x09" } },
    .{ "QueryCredentialsAttributesW", MethodRecord{ .library = "SECUR32", .import = "QueryCredentialsAttributesW", .signature = "\x00\x03\x11\x79\x0f\x11\x93\xd5\x09\x0f\x01" } },
    .{ "QueryCredentialsAttributesExW", MethodRecord{ .library = "SspiCli", .import = "QueryCredentialsAttributesExW", .signature = "\x00\x04\x11\x79\x0f\x11\x93\xd5\x09\x0f\x01\x09" } },
    .{ "QueryCredentialsAttributesA", MethodRecord{ .library = "SECUR32", .import = "QueryCredentialsAttributesA", .signature = "\x00\x03\x11\x79\x0f\x11\x93\xd5\x09\x0f\x01" } },
    .{ "QueryCredentialsAttributesExA", MethodRecord{ .library = "SspiCli", .import = "QueryCredentialsAttributesExA", .signature = "\x00\x04\x11\x79\x0f\x11\x93\xd5\x09\x0f\x01\x09" } },
    .{ "SetCredentialsAttributesW", MethodRecord{ .library = "SECUR32", .import = "SetCredentialsAttributesW", .signature = "\x00\x04\x11\x79\x0f\x11\x93\xd5\x09\x0f\x01\x09" } },
    .{ "SetCredentialsAttributesA", MethodRecord{ .library = "SECUR32", .import = "SetCredentialsAttributesA", .signature = "\x00\x04\x11\x79\x0f\x11\x93\xd5\x09\x0f\x01\x09" } },
    .{ "FreeContextBuffer", MethodRecord{ .library = "SECUR32", .import = "FreeContextBuffer", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "SecAllocateAndSetIPAddress", MethodRecord{ .library = "SspiCli", .import = "SecAllocateAndSetIPAddress", .signature = "\x00\x03\x11\x79\x0f\x05\x09\x0f\x08" } },
    .{ "SecAllocateAndSetCallTarget", MethodRecord{ .library = "SspiCli", .import = "SecAllocateAndSetCallTarget", .signature = "\x00\x04\x11\x79\x0f\x05\x09\x11\x05\x0f\x08" } },
    .{ "SecFreeCallContext", MethodRecord{ .library = "SspiCli", .import = "SecFreeCallContext", .signature = "\x00\x00\x01" } },
    .{ "MakeSignature", MethodRecord{ .library = "SECUR32", .import = "MakeSignature", .signature = "\x00\x04\x11\x79\x0f\x11\x93\xd5\x09\x0f\x11\x93\xd9\x09" } },
    .{ "VerifySignature", MethodRecord{ .library = "SECUR32", .import = "VerifySignature", .signature = "\x00\x04\x11\x79\x0f\x11\x93\xd5\x0f\x11\x93\xd9\x09\x0f\x09" } },
    .{ "EncryptMessage", MethodRecord{ .library = "SECUR32", .import = "EncryptMessage", .signature = "\x00\x04\x11\x79\x0f\x11\x93\xd5\x09\x0f\x11\x93\xd9\x09" } },
    .{ "DecryptMessage", MethodRecord{ .library = "SECUR32", .import = "DecryptMessage", .signature = "\x00\x04\x11\x79\x0f\x11\x93\xd5\x0f\x11\x93\xd9\x09\x0f\x09" } },
    .{ "EnumerateSecurityPackagesW", MethodRecord{ .library = "SECUR32", .import = "EnumerateSecurityPackagesW", .signature = "\x00\x02\x11\x79\x0f\x09\x0f\x0f\x11\x93\xe9" } },
    .{ "EnumerateSecurityPackagesA", MethodRecord{ .library = "SECUR32", .import = "EnumerateSecurityPackagesA", .signature = "\x00\x02\x11\x79\x0f\x09\x0f\x0f\x11\x93\xed" } },
    .{ "QuerySecurityPackageInfoW", MethodRecord{ .library = "SECUR32", .import = "QuerySecurityPackageInfoW", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x0f\x11\x93\xe9" } },
    .{ "QuerySecurityPackageInfoA", MethodRecord{ .library = "SECUR32", .import = "QuerySecurityPackageInfoA", .signature = "\x00\x02\x11\x79\x11\x3d\x0f\x0f\x11\x93\xed" } },
    .{ "ExportSecurityContext", MethodRecord{ .library = "SECUR32", .import = "ExportSecurityContext", .signature = "\x00\x04\x11\x79\x0f\x11\x93\xd5\x11\x93\xf1\x0f\x11\x93\xf5\x0f\x0f\x01" } },
    .{ "ImportSecurityContextW", MethodRecord{ .library = "SECUR32", .import = "ImportSecurityContextW", .signature = "\x00\x04\x11\x79\x11\x05\x0f\x11\x93\xf5\x0f\x01\x0f\x11\x93\xd5" } },
    .{ "ImportSecurityContextA", MethodRecord{ .library = "SECUR32", .import = "ImportSecurityContextA", .signature = "\x00\x04\x11\x79\x11\x3d\x0f\x11\x93\xf5\x0f\x01\x0f\x11\x93\xd5" } },
    .{ "InitSecurityInterfaceA", MethodRecord{ .library = "SECUR32", .import = "InitSecurityInterfaceA", .signature = "\x00\x00\x0f\x11\x93\xf9" } },
    .{ "InitSecurityInterfaceW", MethodRecord{ .library = "SECUR32", .import = "InitSecurityInterfaceW", .signature = "\x00\x00\x0f\x11\x93\xfd" } },
    .{ "SaslEnumerateProfilesA", MethodRecord{ .library = "SECUR32", .import = "SaslEnumerateProfilesA", .signature = "\x00\x02\x11\x79\x0f\x11\x3d\x0f\x09" } },
    .{ "SaslEnumerateProfilesW", MethodRecord{ .library = "SECUR32", .import = "SaslEnumerateProfilesW", .signature = "\x00\x02\x11\x79\x0f\x11\x05\x0f\x09" } },
    .{ "SaslGetProfilePackageA", MethodRecord{ .library = "SECUR32", .import = "SaslGetProfilePackageA", .signature = "\x00\x02\x11\x79\x11\x3d\x0f\x0f\x11\x93\xed" } },
    .{ "SaslGetProfilePackageW", MethodRecord{ .library = "SECUR32", .import = "SaslGetProfilePackageW", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x0f\x11\x93\xe9" } },
    .{ "SaslIdentifyPackageA", MethodRecord{ .library = "SECUR32", .import = "SaslIdentifyPackageA", .signature = "\x00\x02\x11\x79\x0f\x11\x93\xd9\x0f\x0f\x11\x93\xed" } },
    .{ "SaslIdentifyPackageW", MethodRecord{ .library = "SECUR32", .import = "SaslIdentifyPackageW", .signature = "\x00\x02\x11\x79\x0f\x11\x93\xd9\x0f\x0f\x11\x93\xe9" } },
    .{ "SaslInitializeSecurityContextW", MethodRecord{ .library = "SECUR32", .import = "SaslInitializeSecurityContextW", .signature = "\x00\x0c\x11\x79\x0f\x11\x93\xd5\x0f\x11\x93\xd5\x11\x05\x11\x93\xdd\x09\x09\x0f\x11\x93\xd9\x09\x0f\x11\x93\xd5\x0f\x11\x93\xd9\x0f\x09\x0f\x0a" } },
    .{ "SaslInitializeSecurityContextA", MethodRecord{ .library = "SECUR32", .import = "SaslInitializeSecurityContextA", .signature = "\x00\x0c\x11\x79\x0f\x11\x93\xd5\x0f\x11\x93\xd5\x11\x3d\x11\x93\xdd\x09\x09\x0f\x11\x93\xd9\x09\x0f\x11\x93\xd5\x0f\x11\x93\xd9\x0f\x09\x0f\x0a" } },
    .{ "SaslAcceptSecurityContext", MethodRecord{ .library = "SECUR32", .import = "SaslAcceptSecurityContext", .signature = "\x00\x09\x11\x79\x0f\x11\x93\xd5\x0f\x11\x93\xd5\x0f\x11\x93\xd9\x11\x93\xe1\x09\x0f\x11\x93\xd5\x0f\x11\x93\xd9\x0f\x09\x0f\x0a" } },
    .{ "SaslSetContextOption", MethodRecord{ .library = "SECUR32", .import = "SaslSetContextOption", .signature = "\x00\x04\x11\x79\x0f\x11\x93\xd5\x09\x0f\x01\x09" } },
    .{ "SaslGetContextOption", MethodRecord{ .library = "SECUR32", .import = "SaslGetContextOption", .signature = "\x00\x05\x11\x79\x0f\x11\x93\xd5\x09\x0f\x01\x09\x0f\x09" } },
    .{ "SspiPromptForCredentialsW", MethodRecord{ .library = "credui", .import = "SspiPromptForCredentialsW", .signature = "\x00\x08\x09\x11\x05\x0f\x01\x09\x11\x05\x0f\x01\x0f\x0f\x01\x0f\x08\x09" } },
    .{ "SspiPromptForCredentialsA", MethodRecord{ .library = "credui", .import = "SspiPromptForCredentialsA", .signature = "\x00\x08\x09\x11\x3d\x0f\x01\x09\x11\x3d\x0f\x01\x0f\x0f\x01\x0f\x08\x09" } },
    .{ "SspiPrepareForCredRead", MethodRecord{ .library = "SECUR32", .import = "SspiPrepareForCredRead", .signature = "\x00\x04\x11\x79\x0f\x01\x11\x05\x0f\x09\x0f\x11\x05" } },
    .{ "SspiPrepareForCredWrite", MethodRecord{ .library = "SECUR32", .import = "SspiPrepareForCredWrite", .signature = "\x00\x07\x11\x79\x0f\x01\x11\x05\x0f\x09\x0f\x11\x05\x0f\x11\x05\x0f\x0f\x05\x0f\x09" } },
    .{ "SspiEncryptAuthIdentity", MethodRecord{ .library = "SECUR32", .import = "SspiEncryptAuthIdentity", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "SspiEncryptAuthIdentityEx", MethodRecord{ .library = "SspiCli", .import = "SspiEncryptAuthIdentityEx", .signature = "\x00\x02\x11\x79\x09\x0f\x01" } },
    .{ "SspiDecryptAuthIdentity", MethodRecord{ .library = "SECUR32", .import = "SspiDecryptAuthIdentity", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "SspiDecryptAuthIdentityEx", MethodRecord{ .library = "SspiCli", .import = "SspiDecryptAuthIdentityEx", .signature = "\x00\x02\x11\x79\x09\x0f\x01" } },
    .{ "SspiIsAuthIdentityEncrypted", MethodRecord{ .library = "SECUR32", .import = "SspiIsAuthIdentityEncrypted", .signature = "\x00\x01\x11\x87\x79\x0f\x01" } },
    .{ "SspiEncodeAuthIdentityAsStrings", MethodRecord{ .library = "SECUR32", .import = "SspiEncodeAuthIdentityAsStrings", .signature = "\x00\x04\x11\x79\x0f\x01\x0f\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "SspiValidateAuthIdentity", MethodRecord{ .library = "SECUR32", .import = "SspiValidateAuthIdentity", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "SspiCopyAuthIdentity", MethodRecord{ .library = "SECUR32", .import = "SspiCopyAuthIdentity", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x0f\x01" } },
    .{ "SspiFreeAuthIdentity", MethodRecord{ .library = "SECUR32", .import = "SspiFreeAuthIdentity", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "SspiZeroAuthIdentity", MethodRecord{ .library = "SECUR32", .import = "SspiZeroAuthIdentity", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "SspiLocalFree", MethodRecord{ .library = "SECUR32", .import = "SspiLocalFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "SspiEncodeStringsAsAuthIdentity", MethodRecord{ .library = "SECUR32", .import = "SspiEncodeStringsAsAuthIdentity", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x11\x05\x0f\x0f\x01" } },
    .{ "SspiCompareAuthIdentities", MethodRecord{ .library = "SECUR32", .import = "SspiCompareAuthIdentities", .signature = "\x00\x04\x11\x79\x0f\x01\x0f\x01\x0f\x11\x87\x79\x0f\x11\x87\x79" } },
    .{ "SspiMarshalAuthIdentity", MethodRecord{ .library = "SECUR32", .import = "SspiMarshalAuthIdentity", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x09\x0f\x0f\x04" } },
    .{ "SspiUnmarshalAuthIdentity", MethodRecord{ .library = "SECUR32", .import = "SspiUnmarshalAuthIdentity", .signature = "\x00\x03\x11\x79\x09\x11\x3d\x0f\x0f\x01" } },
    .{ "SspiIsPromptingNeeded", MethodRecord{ .library = "credui", .import = "SspiIsPromptingNeeded", .signature = "\x00\x01\x11\x87\x79\x09" } },
    .{ "SspiGetTargetHostName", MethodRecord{ .library = "SECUR32", .import = "SspiGetTargetHostName", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "SspiExcludePackage", MethodRecord{ .library = "SECUR32", .import = "SspiExcludePackage", .signature = "\x00\x03\x11\x79\x0f\x01\x11\x05\x0f\x0f\x01" } },
    .{ "SspiSetChannelBindingFlags", MethodRecord{ .library = "SspiCli", .import = "SspiSetChannelBindingFlags", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x01\x09" } },
    .{ "AddSecurityPackageA", MethodRecord{ .library = "SECUR32", .import = "AddSecurityPackageA", .signature = "\x00\x02\x11\x79\x11\x3d\x0f\x11\x94\x05" } },
    .{ "AddSecurityPackageW", MethodRecord{ .library = "SECUR32", .import = "AddSecurityPackageW", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x94\x05" } },
    .{ "DeleteSecurityPackageA", MethodRecord{ .library = "SECUR32", .import = "DeleteSecurityPackageA", .signature = "\x00\x01\x11\x79\x11\x3d" } },
    .{ "DeleteSecurityPackageW", MethodRecord{ .library = "SECUR32", .import = "DeleteSecurityPackageW", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "CredMarshalTargetInfo", MethodRecord{ .library = "SECUR32", .import = "CredMarshalTargetInfo", .signature = "\x00\x03\x11\x84\x71\x0f\x11\x94\x09\x0f\x0f\x07\x0f\x09" } },
    .{ "CredUnmarshalTargetInfo", MethodRecord{ .library = "SECUR32", .import = "CredUnmarshalTargetInfo", .signature = "\x00\x04\x11\x84\x71\x0f\x07\x09\x0f\x0f\x11\x94\x09\x0f\x09" } },
    .{ "SslEmptyCacheA", MethodRecord{ .library = "SCHANNEL", .import = "SslEmptyCacheA", .signature = "\x00\x02\x11\x59\x11\x3d\x09" } },
    .{ "SslEmptyCacheW", MethodRecord{ .library = "SCHANNEL", .import = "SslEmptyCacheW", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "SslGenerateRandomBits", MethodRecord{ .library = "SCHANNEL", .import = "SslGenerateRandomBits", .signature = "\x00\x02\x01\x0f\x05\x08" } },
    .{ "SslCrackCertificate", MethodRecord{ .library = "SCHANNEL", .import = "SslCrackCertificate", .signature = "\x00\x04\x11\x59\x0f\x05\x09\x09\x0f\x0f\x11\x94\x0d" } },
    .{ "SslFreeCertificate", MethodRecord{ .library = "SCHANNEL", .import = "SslFreeCertificate", .signature = "\x00\x01\x01\x0f\x11\x94\x0d" } },
    .{ "SslGetMaximumKeySize", MethodRecord{ .library = "SCHANNEL", .import = "SslGetMaximumKeySize", .signature = "\x00\x01\x09\x09" } },
    .{ "SslGetServerIdentity", MethodRecord{ .library = "SCHANNEL", .import = "SslGetServerIdentity", .signature = "\x00\x05\x11\x79\x0f\x05\x09\x0f\x0f\x05\x0f\x09\x09" } },
    .{ "SslGetExtensions", MethodRecord{ .library = "SCHANNEL", .import = "SslGetExtensions", .signature = "\x00\x06\x11\x79\x0f\x05\x09\x0f\x11\x94\x11\x05\x0f\x09\x11\x94\x15" } },
    .{ "SslDeserializeCertificateStore", MethodRecord{ .library = "SCHANNEL", .import = "SslDeserializeCertificateStore", .signature = "\x00\x02\x11\x79\x11\x85\x91\x0f\x0f\x11\x7d" } },
    .{ "TokenBindingGenerateBinding", MethodRecord{ .library = "TOKENBINDING", .import = "TokenBindingGenerateBinding", .signature = "\x00\x0a\x11\x79\x11\x94\x19\x11\x05\x11\x94\x1d\x0f\x01\x09\x11\x94\x21\x0f\x01\x0f\x0f\x01\x0f\x09\x0f\x0f\x11\x94\x25" } },
    .{ "TokenBindingGenerateMessage", MethodRecord{ .library = "TOKENBINDING", .import = "TokenBindingGenerateMessage", .signature = "\x00\x05\x11\x79\x0f\x0f\x01\x0f\x09\x09\x0f\x0f\x01\x0f\x09" } },
    .{ "TokenBindingVerifyMessage", MethodRecord{ .library = "TOKENBINDING", .import = "TokenBindingVerifyMessage", .signature = "\x00\x06\x11\x79\x0f\x01\x09\x11\x94\x19\x0f\x01\x09\x0f\x0f\x11\x94\x29" } },
    .{ "TokenBindingGetKeyTypesClient", MethodRecord{ .library = "TOKENBINDING", .import = "TokenBindingGetKeyTypesClient", .signature = "\x00\x01\x11\x79\x0f\x0f\x11\x94\x2d" } },
    .{ "TokenBindingGetKeyTypesServer", MethodRecord{ .library = "TOKENBINDING", .import = "TokenBindingGetKeyTypesServer", .signature = "\x00\x01\x11\x79\x0f\x0f\x11\x94\x2d" } },
    .{ "TokenBindingDeleteBinding", MethodRecord{ .library = "TOKENBINDING", .import = "TokenBindingDeleteBinding", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "TokenBindingDeleteAllBindings", MethodRecord{ .library = "TOKENBINDING", .import = "TokenBindingDeleteAllBindings", .signature = "\x00\x00\x11\x79" } },
    .{ "TokenBindingGenerateID", MethodRecord{ .library = "TOKENBINDING", .import = "TokenBindingGenerateID", .signature = "\x00\x04\x11\x79\x11\x94\x19\x0f\x01\x09\x0f\x0f\x11\x94\x25" } },
    .{ "TokenBindingGenerateIDForUri", MethodRecord{ .library = "TOKENBINDING", .import = "TokenBindingGenerateIDForUri", .signature = "\x00\x03\x11\x79\x11\x94\x19\x11\x05\x0f\x0f\x11\x94\x25" } },
    .{ "TokenBindingGetHighestSupportedVersion", MethodRecord{ .library = "TOKENBINDING", .import = "TokenBindingGetHighestSupportedVersion", .signature = "\x00\x02\x11\x79\x0f\x05\x0f\x05" } },
    .{ "GetUserNameExA", MethodRecord{ .library = "SECUR32", .import = "GetUserNameExA", .signature = "\x00\x03\x11\x87\x79\x11\x94\x31\x11\x3d\x0f\x09" } },
    .{ "GetUserNameExW", MethodRecord{ .library = "SECUR32", .import = "GetUserNameExW", .signature = "\x00\x03\x11\x87\x79\x11\x94\x31\x11\x05\x0f\x09" } },
    .{ "GetComputerObjectNameA", MethodRecord{ .library = "SECUR32", .import = "GetComputerObjectNameA", .signature = "\x00\x03\x11\x87\x79\x11\x94\x31\x11\x3d\x0f\x09" } },
    .{ "GetComputerObjectNameW", MethodRecord{ .library = "SECUR32", .import = "GetComputerObjectNameW", .signature = "\x00\x03\x11\x87\x79\x11\x94\x31\x11\x05\x0f\x09" } },
    .{ "TranslateNameA", MethodRecord{ .library = "SECUR32", .import = "TranslateNameA", .signature = "\x00\x05\x11\x87\x79\x11\x3d\x11\x94\x31\x11\x94\x31\x11\x3d\x0f\x09" } },
    .{ "TranslateNameW", MethodRecord{ .library = "SECUR32", .import = "TranslateNameW", .signature = "\x00\x05\x11\x87\x79\x11\x05\x11\x94\x31\x11\x94\x31\x11\x05\x0f\x09" } },
    .{ "SLOpen", MethodRecord{ .library = "SLC", .import = "SLOpen", .signature = "\x00\x01\x11\x79\x0f\x0f\x01" } },
    .{ "SLClose", MethodRecord{ .library = "SLC", .import = "SLClose", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "SLInstallProofOfPurchase", MethodRecord{ .library = "SLC", .import = "SLInstallProofOfPurchase", .signature = "\x00\x06\x11\x79\x0f\x01\x11\x05\x11\x05\x09\x0f\x05\x0f\x11\x0d" } },
    .{ "SLUninstallProofOfPurchase", MethodRecord{ .library = "SLC", .import = "SLUninstallProofOfPurchase", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x11\x0d" } },
    .{ "SLInstallLicense", MethodRecord{ .library = "SLC", .import = "SLInstallLicense", .signature = "\x00\x04\x11\x79\x0f\x01\x09\x0f\x05\x0f\x11\x0d" } },
    .{ "SLUninstallLicense", MethodRecord{ .library = "SLC", .import = "SLUninstallLicense", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x11\x0d" } },
    .{ "SLConsumeRight", MethodRecord{ .library = "SLC", .import = "SLConsumeRight", .signature = "\x00\x05\x11\x79\x0f\x01\x0f\x11\x0d\x0f\x11\x0d\x11\x05\x0f\x01" } },
    .{ "SLGetProductSkuInformation", MethodRecord{ .library = "SLC", .import = "SLGetProductSkuInformation", .signature = "\x00\x06\x11\x79\x0f\x01\x0f\x11\x0d\x11\x05\x0f\x11\x94\x35\x0f\x09\x0f\x0f\x05" } },
    .{ "SLGetPKeyInformation", MethodRecord{ .library = "SLC", .import = "SLGetPKeyInformation", .signature = "\x00\x06\x11\x79\x0f\x01\x0f\x11\x0d\x11\x05\x0f\x11\x94\x35\x0f\x09\x0f\x0f\x05" } },
    .{ "SLGetLicenseInformation", MethodRecord{ .library = "SLC", .import = "SLGetLicenseInformation", .signature = "\x00\x06\x11\x79\x0f\x01\x0f\x11\x0d\x11\x05\x0f\x11\x94\x35\x0f\x09\x0f\x0f\x05" } },
    .{ "SLGetLicensingStatusInformation", MethodRecord{ .library = "SLC", .import = "SLGetLicensingStatusInformation", .signature = "\x00\x06\x11\x79\x0f\x01\x0f\x11\x0d\x0f\x11\x0d\x11\x05\x0f\x09\x0f\x0f\x11\x94\x39" } },
    .{ "SLGetPolicyInformation", MethodRecord{ .library = "SLC", .import = "SLGetPolicyInformation", .signature = "\x00\x05\x11\x79\x0f\x01\x11\x05\x0f\x11\x94\x35\x0f\x09\x0f\x0f\x05" } },
    .{ "SLGetPolicyInformationDWORD", MethodRecord{ .library = "SLC", .import = "SLGetPolicyInformationDWORD", .signature = "\x00\x03\x11\x79\x0f\x01\x11\x05\x0f\x09" } },
    .{ "SLGetServiceInformation", MethodRecord{ .library = "SLC", .import = "SLGetServiceInformation", .signature = "\x00\x05\x11\x79\x0f\x01\x11\x05\x0f\x11\x94\x35\x0f\x09\x0f\x0f\x05" } },
    .{ "SLGetApplicationInformation", MethodRecord{ .library = "SLC", .import = "SLGetApplicationInformation", .signature = "\x00\x06\x11\x79\x0f\x01\x0f\x11\x0d\x11\x05\x0f\x11\x94\x35\x0f\x09\x0f\x0f\x05" } },
    .{ "SLActivateProduct", MethodRecord{ .library = "slcext", .import = "SLActivateProduct", .signature = "\x00\x07\x11\x79\x0f\x01\x0f\x11\x0d\x09\x0f\x01\x0f\x11\x94\x3d\x11\x05\x07" } },
    .{ "SLGetServerStatus", MethodRecord{ .library = "slcext", .import = "SLGetServerStatus", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x11\x05\x07\x0f\x11\x79" } },
    .{ "SLGenerateOfflineInstallationId", MethodRecord{ .library = "SLC", .import = "SLGenerateOfflineInstallationId", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "SLGenerateOfflineInstallationIdEx", MethodRecord{ .library = "SLC", .import = "SLGenerateOfflineInstallationIdEx", .signature = "\x00\x04\x11\x79\x0f\x01\x0f\x11\x0d\x0f\x11\x94\x3d\x0f\x11\x05" } },
    .{ "SLDepositOfflineConfirmationId", MethodRecord{ .library = "SLC", .import = "SLDepositOfflineConfirmationId", .signature = "\x00\x04\x11\x79\x0f\x01\x0f\x11\x0d\x11\x05\x11\x05" } },
    .{ "SLDepositOfflineConfirmationIdEx", MethodRecord{ .library = "SLC", .import = "SLDepositOfflineConfirmationIdEx", .signature = "\x00\x05\x11\x79\x0f\x01\x0f\x11\x0d\x0f\x11\x94\x3d\x11\x05\x11\x05" } },
    .{ "SLGetPKeyId", MethodRecord{ .library = "SLC", .import = "SLGetPKeyId", .signature = "\x00\x06\x11\x79\x0f\x01\x11\x05\x11\x05\x09\x0f\x05\x0f\x11\x0d" } },
    .{ "SLGetInstalledProductKeyIds", MethodRecord{ .library = "SLC", .import = "SLGetInstalledProductKeyIds", .signature = "\x00\x04\x11\x79\x0f\x01\x0f\x11\x0d\x0f\x09\x0f\x0f\x11\x0d" } },
    .{ "SLSetCurrentProductKey", MethodRecord{ .library = "SLC", .import = "SLSetCurrentProductKey", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x11\x0d\x0f\x11\x0d" } },
    .{ "SLGetSLIDList", MethodRecord{ .library = "SLC", .import = "SLGetSLIDList", .signature = "\x00\x06\x11\x79\x0f\x01\x11\x94\x41\x0f\x11\x0d\x11\x94\x41\x0f\x09\x0f\x0f\x11\x0d" } },
    .{ "SLGetLicenseFileId", MethodRecord{ .library = "SLC", .import = "SLGetLicenseFileId", .signature = "\x00\x04\x11\x79\x0f\x01\x09\x0f\x05\x0f\x11\x0d" } },
    .{ "SLGetLicense", MethodRecord{ .library = "SLC", .import = "SLGetLicense", .signature = "\x00\x04\x11\x79\x0f\x01\x0f\x11\x0d\x0f\x09\x0f\x0f\x05" } },
    .{ "SLFireEvent", MethodRecord{ .library = "SLC", .import = "SLFireEvent", .signature = "\x00\x03\x11\x79\x0f\x01\x11\x05\x0f\x11\x0d" } },
    .{ "SLRegisterEvent", MethodRecord{ .library = "SLC", .import = "SLRegisterEvent", .signature = "\x00\x04\x11\x79\x0f\x01\x11\x05\x0f\x11\x0d\x11\x80\x85" } },
    .{ "SLUnregisterEvent", MethodRecord{ .library = "SLC", .import = "SLUnregisterEvent", .signature = "\x00\x04\x11\x79\x0f\x01\x11\x05\x0f\x11\x0d\x11\x80\x85" } },
    .{ "SLGetWindowsInformation", MethodRecord{ .library = "SLC", .import = "SLGetWindowsInformation", .signature = "\x00\x04\x11\x79\x11\x05\x0f\x11\x94\x35\x0f\x09\x0f\x0f\x05" } },
    .{ "SLGetWindowsInformationDWORD", MethodRecord{ .library = "SLC", .import = "SLGetWindowsInformationDWORD", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x09" } },
    .{ "SLIsGenuineLocal", MethodRecord{ .library = "SLWGA", .import = "SLIsGenuineLocal", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x11\x94\x45\x0f\x11\x94\x49" } },
    .{ "SLAcquireGenuineTicket", MethodRecord{ .library = "slcext", .import = "SLAcquireGenuineTicket", .signature = "\x00\x05\x11\x79\x0f\x0f\x01\x0f\x09\x11\x05\x11\x05\x11\x05" } },
    .{ "SLSetGenuineInformation", MethodRecord{ .library = "SLC", .import = "SLSetGenuineInformation", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x11\x05\x11\x94\x35\x09\x0f\x05" } },
    .{ "SLGetReferralInformation", MethodRecord{ .library = "slcext", .import = "SLGetReferralInformation", .signature = "\x00\x05\x11\x79\x0f\x01\x11\x94\x4d\x0f\x11\x0d\x11\x05\x0f\x11\x05" } },
    .{ "SLGetGenuineInformation", MethodRecord{ .library = "SLC", .import = "SLGetGenuineInformation", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x11\x05\x0f\x11\x94\x35\x0f\x09\x0f\x0f\x05" } },
    .{ "SLQueryLicenseValueFromApp", MethodRecord{ .library = "api-ms-win-core-slapi-l1-1-0", .import = "SLQueryLicenseValueFromApp", .signature = "\x00\x05\x11\x79\x11\x05\x0f\x09\x0f\x01\x09\x0f\x09" } },
    .{ "SendSAS", MethodRecord{ .library = "SAS", .import = "SendSAS", .signature = "\x00\x01\x01\x11\x59" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x7d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CONTEXT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x115 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSID" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x471 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "NTSTATUS" },
        0x4f9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "OBJECT_SECURITY_INFORMATION" },
        0x591 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_INTEGER_BLOB" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0x1359 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "LSA_STRING" },
        0x135d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SECURITY_LOGON_TYPE" },
        0x1361 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "TOKEN_GROUPS" },
        0x1365 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "TOKEN_SOURCE" },
        0x1369 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LUID" },
        0x136d => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "QUOTA_LIMITS" },
        0x1371 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "LSA_HANDLE" },
        0x1375 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SECURITY_LOGON_SESSION_DATA" },
        0x1379 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "LSA_UNICODE_STRING" },
        0x137d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "LSA_OBJECT_ATTRIBUTES" },
        0x1381 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "CENTRAL_ACCESS_POLICY" },
        0x1385 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "POLICY_INFORMATION_CLASS" },
        0x1389 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "POLICY_DOMAIN_INFORMATION_CLASS" },
        0x138d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "POLICY_NOTIFICATION_INFORMATION_CLASS" },
        0x1391 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "LSA_REFERENCED_DOMAIN_LIST" },
        0x1395 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "LSA_TRANSLATED_SID" },
        0x1399 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "LSA_TRANSLATED_SID2" },
        0x139d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "LSA_TRANSLATED_NAME" },
        0x13a1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "TRUSTED_INFORMATION_CLASS" },
        0x13a5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "TRUSTED_DOMAIN_INFORMATION_EX" },
        0x13a9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "TRUSTED_DOMAIN_AUTH_INFORMATION" },
        0x13ad => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "LSA_FOREST_TRUST_INFORMATION" },
        0x13b1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "LSA_FOREST_TRUST_COLLISION_INFORMATION" },
        0x13b5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "LSA_FOREST_TRUST_RECORD_TYPE" },
        0x13b9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "LSA_FOREST_TRUST_INFORMATION2" },
        0x13bd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "AUDIT_POLICY_INFORMATION" },
        0x13c1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "POLICY_AUDIT_SID_ARRAY" },
        0x13c5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "POLICY_AUDIT_EVENT_TYPE" },
        0x13c9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "ACL" },
        0x13cd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SECPKG_CRED" },
        0x13d1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SEC_GET_KEY_FN" },
        0x13d5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "SecHandle" },
        0x13d9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SecBufferDesc" },
        0x13dd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "ISC_REQ_FLAGS" },
        0x13e1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "ASC_REQ_FLAGS" },
        0x13e5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SECPKG_ATTR" },
        0x13e9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SecPkgInfoW" },
        0x13ed => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SecPkgInfoA" },
        0x13f1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "EXPORT_SECURITY_CONTEXT_FLAGS" },
        0x13f5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SecBuffer" },
        0x13f9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SecurityFunctionTableA" },
        0x13fd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SecurityFunctionTableW" },
        0x1401 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SecPkgContext_Bindings" },
        0x1405 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SECURITY_PACKAGE_OPTIONS" },
        0x1409 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Credentials", .name = "CREDENTIAL_TARGET_INFORMATIONW" },
        0x140d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "X509Certificate" },
        0x1411 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SCH_EXTENSION_DATA" },
        0x1415 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SchGetExtensionsOptions" },
        0x1419 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "TOKENBINDING_KEY_PARAMETERS_TYPE" },
        0x141d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "TOKENBINDING_TYPE" },
        0x1421 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "TOKENBINDING_EXTENSION_FORMAT" },
        0x1425 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "TOKENBINDING_RESULT_DATA" },
        0x1429 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "TOKENBINDING_RESULT_LIST" },
        0x142d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "TOKENBINDING_KEY_TYPES" },
        0x1431 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "EXTENDED_NAME_FORMAT" },
        0x1435 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SLDATATYPE" },
        0x1439 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SL_LICENSING_STATUS" },
        0x143d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SL_ACTIVATION_INFO_HEADER" },
        0x1441 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SLIDTYPE" },
        0x1445 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SL_GENUINE_STATE" },
        0x1449 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SL_NONGENUINE_UI_OPTIONS" },
        0x144d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "SLREFERRALTYPE" },
        else => null,
    };
}

pub const ISSP_LEVEL = 32;
pub const ISSP_MODE = 1;
pub const SECPKG_FLAG_INTEGRITY = 1;
pub const SECPKG_FLAG_PRIVACY = 2;
pub const SECPKG_FLAG_TOKEN_ONLY = 4;
pub const SECPKG_FLAG_DATAGRAM = 8;
pub const SECPKG_FLAG_CONNECTION = 16;
pub const SECPKG_FLAG_MULTI_REQUIRED = 32;
pub const SECPKG_FLAG_CLIENT_ONLY = 64;
pub const SECPKG_FLAG_EXTENDED_ERROR = 128;
pub const SECPKG_FLAG_IMPERSONATION = 256;
pub const SECPKG_FLAG_ACCEPT_WIN32_NAME = 512;
pub const SECPKG_FLAG_STREAM = 1024;
pub const SECPKG_FLAG_NEGOTIABLE = 2048;
pub const SECPKG_FLAG_GSS_COMPATIBLE = 4096;
pub const SECPKG_FLAG_LOGON = 8192;
pub const SECPKG_FLAG_ASCII_BUFFERS = 16384;
pub const SECPKG_FLAG_FRAGMENT = 32768;
pub const SECPKG_FLAG_MUTUAL_AUTH = 65536;
pub const SECPKG_FLAG_DELEGATION = 131072;
pub const SECPKG_FLAG_READONLY_WITH_CHECKSUM = 262144;
pub const SECPKG_FLAG_RESTRICTED_TOKENS = 524288;
pub const SECPKG_FLAG_NEGO_EXTENDER = 1048576;
pub const SECPKG_FLAG_NEGOTIABLE2 = 2097152;
pub const SECPKG_FLAG_APPCONTAINER_PASSTHROUGH = 4194304;
pub const SECPKG_FLAG_APPCONTAINER_CHECKS = 8388608;
pub const SECPKG_FLAG_CREDENTIAL_ISOLATION_ENABLED = 16777216;
pub const SECPKG_FLAG_APPLY_LOOPBACK = 33554432;
pub const SECPKG_ID_NONE = 65535;
pub const SECPKG_CALLFLAGS_APPCONTAINER = 1;
pub const SECPKG_CALLFLAGS_APPCONTAINER_AUTHCAPABLE = 2;
pub const SECPKG_CALLFLAGS_FORCE_SUPPLIED = 4;
pub const SECPKG_CALLFLAGS_APPCONTAINER_UPNCAPABLE = 8;
pub const SECBUFFER_VERSION = 0;
pub const SECBUFFER_EMPTY = 0;
pub const SECBUFFER_DATA = 1;
pub const SECBUFFER_TOKEN = 2;
pub const SECBUFFER_PKG_PARAMS = 3;
pub const SECBUFFER_MISSING = 4;
pub const SECBUFFER_EXTRA = 5;
pub const SECBUFFER_STREAM_TRAILER = 6;
pub const SECBUFFER_STREAM_HEADER = 7;
pub const SECBUFFER_NEGOTIATION_INFO = 8;
pub const SECBUFFER_PADDING = 9;
pub const SECBUFFER_STREAM = 10;
pub const SECBUFFER_MECHLIST = 11;
pub const SECBUFFER_MECHLIST_SIGNATURE = 12;
pub const SECBUFFER_TARGET = 13;
pub const SECBUFFER_CHANNEL_BINDINGS = 14;
pub const SECBUFFER_CHANGE_PASS_RESPONSE = 15;
pub const SECBUFFER_TARGET_HOST = 16;
pub const SECBUFFER_ALERT = 17;
pub const SECBUFFER_APPLICATION_PROTOCOLS = 18;
pub const SECBUFFER_SRTP_PROTECTION_PROFILES = 19;
pub const SECBUFFER_SRTP_MASTER_KEY_IDENTIFIER = 20;
pub const SECBUFFER_TOKEN_BINDING = 21;
pub const SECBUFFER_PRESHARED_KEY = 22;
pub const SECBUFFER_PRESHARED_KEY_IDENTITY = 23;
pub const SECBUFFER_DTLS_MTU = 24;
pub const SECBUFFER_SEND_GENERIC_TLS_EXTENSION = 25;
pub const SECBUFFER_SUBSCRIBE_GENERIC_TLS_EXTENSION = 26;
pub const SECBUFFER_FLAGS = 27;
pub const SECBUFFER_TRAFFIC_SECRETS = 28;
pub const SECBUFFER_CERTIFICATE_REQUEST_CONTEXT = 29;
pub const SECBUFFER_CHANNEL_BINDINGS_RESULT = 30;
pub const SECBUFFER_APP_SESSION_STATE = 31;
pub const SECBUFFER_SESSION_TICKET = 32;
pub const SECBUFFER_ATTRMASK = 4026531840;
pub const SECBUFFER_READONLY = 2147483648;
pub const SECBUFFER_READONLY_WITH_CHECKSUM = 268435456;
pub const SECBUFFER_RESERVED = 1610612736;
pub const SEC_CHANNEL_BINDINGS_AUDIT_BINDINGS = 1;
pub const SEC_CHANNEL_BINDINGS_VALID_FLAGS = 1;
pub const SEC_CHANNEL_BINDINGS_RESULT_CLIENT_SUPPORT = 1;
pub const SEC_CHANNEL_BINDINGS_RESULT_ABSENT = 2;
pub const SEC_CHANNEL_BINDINGS_RESULT_NOTVALID_MISMATCH = 4;
pub const SEC_CHANNEL_BINDINGS_RESULT_NOTVALID_MISSING = 8;
pub const SEC_CHANNEL_BINDINGS_RESULT_VALID_MATCHED = 16;
pub const SEC_CHANNEL_BINDINGS_RESULT_VALID_PROXY = 32;
pub const SEC_CHANNEL_BINDINGS_RESULT_VALID_MISSING = 64;
pub const SZ_ALG_MAX_SIZE = 64;
pub const SECURITY_NATIVE_DREP = 16;
pub const SECURITY_NETWORK_DREP = 0;
pub const SECPKG_CRED_BOTH = 3;
pub const SECPKG_CRED_DEFAULT = 4;
pub const SECPKG_CRED_RESERVED = 4026531840;
pub const SECPKG_CRED_AUTOLOGON_RESTRICTED = 16;
pub const SECPKG_CRED_PROCESS_POLICY_ONLY = 32;
pub const SECPKG_CRED_KERB_ANCHOR_DS_VERSION = 64;
pub const ISC_RET_DELEGATE = 1;
pub const ISC_RET_MUTUAL_AUTH = 2;
pub const ISC_RET_REPLAY_DETECT = 4;
pub const ISC_RET_SEQUENCE_DETECT = 8;
pub const ISC_RET_CONFIDENTIALITY = 16;
pub const ISC_RET_USE_SESSION_KEY = 32;
pub const ISC_RET_USED_COLLECTED_CREDS = 64;
pub const ISC_RET_USED_SUPPLIED_CREDS = 128;
pub const ISC_RET_ALLOCATED_MEMORY = 256;
pub const ISC_RET_USED_DCE_STYLE = 512;
pub const ISC_RET_DATAGRAM = 1024;
pub const ISC_RET_CONNECTION = 2048;
pub const ISC_RET_INTERMEDIATE_RETURN = 4096;
pub const ISC_RET_CALL_LEVEL = 8192;
pub const ISC_RET_EXTENDED_ERROR = 16384;
pub const ISC_RET_STREAM = 32768;
pub const ISC_RET_INTEGRITY = 65536;
pub const ISC_RET_IDENTIFY = 131072;
pub const ISC_RET_NULL_SESSION = 262144;
pub const ISC_RET_MANUAL_CRED_VALIDATION = 524288;
pub const ISC_RET_RESERVED1 = 1048576;
pub const ISC_RET_FRAGMENT_ONLY = 2097152;
pub const ISC_RET_FORWARD_CREDENTIALS = 4194304;
pub const ISC_RET_USED_HTTP_STYLE = 16777216;
pub const ISC_RET_NO_ADDITIONAL_TOKEN = 33554432;
pub const ISC_RET_REAUTHENTICATION = 134217728;
pub const ISC_RET_CONFIDENTIALITY_ONLY = 1073741824;
pub const ISC_RET_MESSAGES = 4294967296;
pub const ISC_RET_DEFERRED_CRED_VALIDATION = 8589934592;
pub const ISC_RET_NO_POST_HANDSHAKE_AUTH = 17179869184;
pub const ISC_RET_REUSE_SESSION_TICKETS = 34359738368;
pub const ISC_RET_EXPLICIT_SESSION = 68719476736;
pub const ASC_RET_DELEGATE = 1;
pub const ASC_RET_MUTUAL_AUTH = 2;
pub const ASC_RET_REPLAY_DETECT = 4;
pub const ASC_RET_SEQUENCE_DETECT = 8;
pub const ASC_RET_CONFIDENTIALITY = 16;
pub const ASC_RET_USE_SESSION_KEY = 32;
pub const ASC_RET_SESSION_TICKET = 64;
pub const ASC_RET_ALLOCATED_MEMORY = 256;
pub const ASC_RET_USED_DCE_STYLE = 512;
pub const ASC_RET_DATAGRAM = 1024;
pub const ASC_RET_CONNECTION = 2048;
pub const ASC_RET_CALL_LEVEL = 8192;
pub const ASC_RET_THIRD_LEG_FAILED = 16384;
pub const ASC_RET_EXTENDED_ERROR = 32768;
pub const ASC_RET_STREAM = 65536;
pub const ASC_RET_INTEGRITY = 131072;
pub const ASC_RET_LICENSING = 262144;
pub const ASC_RET_IDENTIFY = 524288;
pub const ASC_RET_NULL_SESSION = 1048576;
pub const ASC_RET_ALLOW_NON_USER_LOGONS = 2097152;
pub const ASC_RET_ALLOW_CONTEXT_REPLAY = 4194304;
pub const ASC_RET_FRAGMENT_ONLY = 8388608;
pub const ASC_RET_NO_TOKEN = 16777216;
pub const ASC_RET_NO_ADDITIONAL_TOKEN = 33554432;
pub const ASC_RET_MESSAGES = 4294967296;
pub const ASC_RET_REUSE_SESSION_TICKETS = 34359738368;
pub const ASC_RET_EXPLICIT_SESSION = 68719476736;
pub const SECPKG_CRED_ATTR_NAMES = 1;
pub const SECPKG_CRED_ATTR_SSI_PROVIDER = 2;
pub const SECPKG_CRED_ATTR_KDC_PROXY_SETTINGS = 3;
pub const SECPKG_CRED_ATTR_KDC_NETWORK_SETTINGS = 3;
pub const SECPKG_CRED_ATTR_CERT = 4;
pub const SECPKG_CRED_ATTR_PAC_BYPASS = 5;
pub const KDC_PROXY_SETTINGS_V1 = 1;
pub const KDC_NETWORK_SETTINGS_V2 = 2;
pub const KDC_PROXY_SETTINGS_FLAGS_FORCEPROXY = 1;
pub const KDC_NETWORK_SETTINGS_FLAGS_FORCEPROXY = 1;
pub const KDC_NETWORK_SETTINGS_FLAGS_CONFIGURE_PROXY = 2147483648;
pub const KDC_NETWORK_SETTINGS_FLAGS_CONFIGURE_DISCOVERY = 1073741824;
pub const KDC_NETWORK_DISCOVERY_FLAGS_DS13_REQUIRED = 2147483648;
pub const SECPKG_ATTR_PROTO_INFO = 7;
pub const SECPKG_ATTR_USER_FLAGS = 11;
pub const SECPKG_ATTR_USE_VALIDATED = 15;
pub const SECPKG_ATTR_CREDENTIAL_NAME = 16;
pub const SECPKG_ATTR_TARGET = 19;
pub const SECPKG_ATTR_AUTHENTICATION_ID = 20;
pub const SECPKG_ATTR_LOGOFF_TIME = 21;
pub const SECPKG_ATTR_NEGO_KEYS = 22;
pub const SECPKG_ATTR_PROMPTING_NEEDED = 24;
pub const SECPKG_ATTR_NEGO_PKG_INFO = 31;
pub const SECPKG_ATTR_NEGO_STATUS = 32;
pub const SECPKG_ATTR_CONTEXT_DELETED = 33;
pub const SECPKG_ATTR_APPLICATION_PROTOCOL = 35;
pub const SECPKG_ATTR_NEGOTIATED_TLS_EXTENSIONS = 36;
pub const SECPKG_ATTR_IS_LOOPBACK = 37;
pub const SECPKG_ATTR_NEGO_INFO_FLAG_NO_KERBEROS = 1;
pub const SECPKG_ATTR_NEGO_INFO_FLAG_NO_NTLM = 2;
pub const SECPKG_NEGOTIATION_COMPLETE = 0;
pub const SECPKG_NEGOTIATION_OPTIMISTIC = 1;
pub const SECPKG_NEGOTIATION_IN_PROGRESS = 2;
pub const SECPKG_NEGOTIATION_DIRECT = 3;
pub const SECPKG_NEGOTIATION_TRY_MULTICRED = 4;
pub const MAX_PROTOCOL_ID_SIZE = 255;
pub const SECQOP_WRAP_NO_ENCRYPT = 2147483649;
pub const SECQOP_WRAP_OOB_DATA = 1073741824;
pub const SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION = 1;
pub const SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_2 = 2;
pub const SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_3 = 3;
pub const SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_4 = 4;
pub const SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_5 = 5;
pub const SASL_OPTION_SEND_SIZE = 1;
pub const SASL_OPTION_RECV_SIZE = 2;
pub const SASL_OPTION_AUTHZ_STRING = 3;
pub const SASL_OPTION_AUTHZ_PROCESSING = 4;
pub const SEC_WINNT_AUTH_IDENTITY_VERSION_2 = 513;
pub const SEC_WINNT_AUTH_IDENTITY_VERSION = 512;
pub const SEC_WINNT_AUTH_IDENTITY_FLAGS_PROCESS_ENCRYPTED = 16;
pub const SEC_WINNT_AUTH_IDENTITY_FLAGS_SYSTEM_PROTECTED = 32;
pub const SEC_WINNT_AUTH_IDENTITY_FLAGS_USER_PROTECTED = 64;
pub const SEC_WINNT_AUTH_IDENTITY_FLAGS_SYSTEM_ENCRYPTED = 128;
pub const SEC_WINNT_AUTH_IDENTITY_FLAGS_RESERVED = 65536;
pub const SEC_WINNT_AUTH_IDENTITY_FLAGS_NULL_USER = 131072;
pub const SEC_WINNT_AUTH_IDENTITY_FLAGS_NULL_DOMAIN = 262144;
pub const SEC_WINNT_AUTH_IDENTITY_FLAGS_ID_PROVIDER = 524288;
pub const SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_USE_MASK = 4278190080;
pub const SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_CREDPROV_DO_NOT_SAVE = 2147483648;
pub const SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_SAVE_CRED_BY_CALLER = 2147483648;
pub const SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_SAVE_CRED_CHECKED = 1073741824;
pub const SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_NO_CHECKBOX = 536870912;
pub const SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_CREDPROV_DO_NOT_LOAD = 268435456;
pub const SSPIPFC_CREDPROV_DO_NOT_SAVE = 1;
pub const SSPIPFC_SAVE_CRED_BY_CALLER = 1;
pub const SSPIPFC_NO_CHECKBOX = 2;
pub const SSPIPFC_CREDPROV_DO_NOT_LOAD = 4;
pub const SSPIPFC_USE_CREDUIBROKER = 8;
pub const NGC_DATA_FLAG_KERB_CERTIFICATE_LOGON_FLAG_CHECK_DUPLICATES = 1;
pub const NGC_DATA_FLAG_KERB_CERTIFICATE_LOGON_FLAG_USE_CERTIFICATE_INFO = 2;
pub const NGC_DATA_FLAG_IS_SMARTCARD_DATA = 4;
pub const NGC_DATA_FLAG_IS_CLOUD_TRUST_CRED = 8;
pub const SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_LOGON = 1;
pub const SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_PROCESS = 2;
pub const SEC_WINNT_AUTH_IDENTITY_ENCRYPT_FOR_SYSTEM = 4;
pub const SEC_WINNT_AUTH_IDENTITY_MARSHALLED = 4;
pub const SEC_WINNT_AUTH_IDENTITY_ONLY = 8;
pub const SECPKG_OPTIONS_PERMANENT = 1;
pub const LOOKUP_VIEW_LOCAL_INFORMATION = 1;
pub const LOOKUP_TRANSLATE_NAMES = 2048;
pub const SECPKG_ATTR_ISSUER_LIST = 80;
pub const SECPKG_ATTR_REMOTE_CRED = 81;
pub const SECPKG_ATTR_SUPPORTED_ALGS = 86;
pub const SECPKG_ATTR_CIPHER_STRENGTHS = 87;
pub const SECPKG_ATTR_SUPPORTED_PROTOCOLS = 88;
pub const SECPKG_ATTR_MAPPED_CRED_ATTR = 92;
pub const SECPKG_ATTR_REMOTE_CERTIFICATES = 95;
pub const SECPKG_ATTR_CLIENT_CERT_POLICY = 96;
pub const SECPKG_ATTR_CC_POLICY_RESULT = 97;
pub const SECPKG_ATTR_USE_NCRYPT = 98;
pub const SECPKG_ATTR_LOCAL_CERT_INFO = 99;
pub const SECPKG_ATTR_CIPHER_INFO = 100;
pub const SECPKG_ATTR_REMOTE_CERT_CHAIN = 103;
pub const SECPKG_ATTR_UI_INFO = 104;
pub const SECPKG_ATTR_KEYING_MATERIAL = 107;
pub const SECPKG_ATTR_SRTP_PARAMETERS = 108;
pub const SECPKG_ATTR_TOKEN_BINDING = 109;
pub const SECPKG_ATTR_CONNECTION_INFO_EX = 110;
pub const SECPKG_ATTR_KEYING_MATERIAL_TOKEN_BINDING = 111;
pub const SECPKG_ATTR_KEYING_MATERIAL_INPROC = 112;
pub const SECPKG_ATTR_CERT_CHECK_RESULT = 113;
pub const SECPKG_ATTR_CERT_CHECK_RESULT_INPROC = 114;
pub const SECPKG_ATTR_SESSION_TICKET_KEYS = 115;
pub const SECPKG_ATTR_SERIALIZED_REMOTE_CERT_CONTEXT_INPROC = 116;
pub const SECPKG_ATTR_SERIALIZED_REMOTE_CERT_CONTEXT = 117;
pub const SESSION_TICKET_INFO_V0 = 0;
pub const SESSION_TICKET_INFO_VERSION = 0;
pub const LSA_MODE_PASSWORD_PROTECTED = 1;
pub const LSA_MODE_INDIVIDUAL_ACCOUNTS = 2;
pub const LSA_MODE_MANDATORY_ACCESS = 4;
pub const LSA_MODE_LOG_FULL = 8;
pub const LSA_MAXIMUM_SID_COUNT = 256;
pub const LSA_MAXIMUM_ENUMERATION_LENGTH = 32000;
pub const LSA_CALL_LICENSE_SERVER = 2147483648;
pub const SE_ADT_OBJECT_ONLY = 1;
pub const SE_MAX_AUDIT_PARAMETERS = 32;
pub const SE_MAX_GENERIC_AUDIT_PARAMETERS = 28;
pub const SE_ADT_PARAMETERS_SELF_RELATIVE = 1;
pub const SE_ADT_PARAMETERS_SEND_TO_LSA = 2;
pub const SE_ADT_PARAMETER_EXTENSIBLE_AUDIT = 4;
pub const SE_ADT_PARAMETER_GENERIC_AUDIT = 8;
pub const SE_ADT_PARAMETER_WRITE_SYNCHRONOUS = 16;
pub const SE_ADT_POLICY_AUDIT_EVENT_TYPE_EX_BEGIN = 100;
pub const POLICY_AUDIT_EVENT_UNCHANGED = 0;
pub const POLICY_AUDIT_EVENT_SUCCESS = 1;
pub const POLICY_AUDIT_EVENT_FAILURE = 2;
pub const POLICY_AUDIT_EVENT_NONE = 4;
pub const POLICY_VIEW_LOCAL_INFORMATION = 1;
pub const POLICY_VIEW_AUDIT_INFORMATION = 2;
pub const POLICY_GET_PRIVATE_INFORMATION = 4;
pub const POLICY_TRUST_ADMIN = 8;
pub const POLICY_CREATE_ACCOUNT = 16;
pub const POLICY_CREATE_SECRET = 32;
pub const POLICY_CREATE_PRIVILEGE = 64;
pub const POLICY_SET_DEFAULT_QUOTA_LIMITS = 128;
pub const POLICY_SET_AUDIT_REQUIREMENTS = 256;
pub const POLICY_AUDIT_LOG_ADMIN = 512;
pub const POLICY_SERVER_ADMIN = 1024;
pub const POLICY_LOOKUP_NAMES = 2048;
pub const POLICY_NOTIFICATION = 4096;
pub const POLICY_MODE_COUNT = 11;
pub const LSA_LOOKUP_ISOLATED_AS_LOCAL = 2147483648;
pub const LSA_LOOKUP_DISALLOW_CONNECTED_ACCOUNT_INTERNET_SID = 2147483648;
pub const LSA_LOOKUP_PREFER_INTERNET_NAMES = 1073741824;
pub const PER_USER_POLICY_UNCHANGED = 0;
pub const PER_USER_AUDIT_SUCCESS_INCLUDE = 1;
pub const PER_USER_AUDIT_SUCCESS_EXCLUDE = 2;
pub const PER_USER_AUDIT_FAILURE_INCLUDE = 4;
pub const PER_USER_AUDIT_FAILURE_EXCLUDE = 8;
pub const PER_USER_AUDIT_NONE = 16;
pub const POLICY_QOS_SCHANNEL_REQUIRED = 1;
pub const POLICY_QOS_OUTBOUND_INTEGRITY = 2;
pub const POLICY_QOS_OUTBOUND_CONFIDENTIALITY = 4;
pub const POLICY_QOS_INBOUND_INTEGRITY = 8;
pub const POLICY_QOS_INBOUND_CONFIDENTIALITY = 16;
pub const POLICY_QOS_ALLOW_LOCAL_ROOT_CERT_STORE = 32;
pub const POLICY_QOS_RAS_SERVER_ALLOWED = 64;
pub const POLICY_QOS_DHCP_SERVER_ALLOWED = 128;
pub const POLICY_KERBEROS_VALIDATE_CLIENT = 128;
pub const ACCOUNT_VIEW = 1;
pub const ACCOUNT_ADJUST_PRIVILEGES = 2;
pub const ACCOUNT_ADJUST_QUOTAS = 4;
pub const ACCOUNT_ADJUST_SYSTEM_ACCESS = 8;
pub const TRUSTED_QUERY_DOMAIN_NAME = 1;
pub const TRUSTED_QUERY_CONTROLLERS = 2;
pub const TRUSTED_SET_CONTROLLERS = 4;
pub const TRUSTED_QUERY_POSIX = 8;
pub const TRUSTED_SET_POSIX = 16;
pub const TRUSTED_SET_AUTH = 32;
pub const TRUSTED_QUERY_AUTH = 64;
pub const LSAD_AES_CRYPT_SHA512_HASH_SIZE = 64;
pub const LSAD_AES_KEY_SIZE = 16;
pub const LSAD_AES_SALT_SIZE = 16;
pub const LSAD_AES_BLOCK_SIZE = 16;
pub const TRUST_TYPE_AAD = 5;
pub const TRUST_ATTRIBUTE_TREE_PARENT = 4194304;
pub const TRUST_ATTRIBUTE_TREE_ROOT = 8388608;
pub const TRUST_ATTRIBUTES_VALID = 4278386687;
pub const TRUST_ATTRIBUTE_QUARANTINED_DOMAIN = 4;
pub const TRUST_ATTRIBUTE_TRUST_USES_RC4_ENCRYPTION = 128;
pub const TRUST_ATTRIBUTE_TRUST_USES_AES_KEYS = 256;
pub const TRUST_ATTRIBUTE_CROSS_ORGANIZATION_NO_TGT_DELEGATION = 512;
pub const TRUST_ATTRIBUTE_PIM_TRUST = 1024;
pub const TRUST_ATTRIBUTE_CROSS_ORGANIZATION_ENABLE_TGT_DELEGATION = 2048;
pub const TRUST_ATTRIBUTE_DISABLE_AUTH_TARGET_VALIDATION = 4096;
pub const TRUST_ATTRIBUTES_USER = 4278190080;
pub const LSA_FOREST_TRUST_RECORD_TYPE_UNRECOGNIZED = 2147483648;
pub const LSA_FTRECORD_DISABLED_REASONS = 65535;
pub const LSA_TLN_DISABLED_NEW = 1;
pub const LSA_TLN_DISABLED_ADMIN = 2;
pub const LSA_TLN_DISABLED_CONFLICT = 4;
pub const LSA_SID_DISABLED_ADMIN = 1;
pub const LSA_SID_DISABLED_CONFLICT = 2;
pub const LSA_NB_DISABLED_ADMIN = 4;
pub const LSA_NB_DISABLED_CONFLICT = 8;
pub const LSA_SCANNER_INFO_DISABLE_AUTH_TARGET_VALIDATION = 1;
pub const LSA_SCANNER_INFO_ADMIN_ALL_FLAGS = 1;
pub const MAX_RECORDS_IN_FOREST_TRUST_INFO = 4000;
pub const SECRET_SET_VALUE = 1;
pub const SECRET_QUERY_VALUE = 2;
pub const LSA_GLOBAL_SECRET_PREFIX_LENGTH = 2;
pub const LSA_LOCAL_SECRET_PREFIX_LENGTH = 2;
pub const LSA_SECRET_MAXIMUM_COUNT = 4096;
pub const LSA_SECRET_MAXIMUM_LENGTH = 512;
pub const MAXIMUM_CAPES_PER_CAP = 127;
pub const CENTRAL_ACCESS_POLICY_OWNER_RIGHTS_PRESENT_FLAG = 1;
pub const CENTRAL_ACCESS_POLICY_STAGED_OWNER_RIGHTS_PRESENT_FLAG = 256;
pub const CENTRAL_ACCESS_POLICY_STAGED_FLAG = 65536;
pub const LSASETCAPS_RELOAD_FLAG = 1;
pub const LSASETCAPS_VALID_FLAG_MASK = 1;
pub const NEGOTIATE_MAX_PREFIX = 32;
pub const NEGOTIATE_ALLOW_NTLM = 268435456;
pub const NEGOTIATE_NEG_NTLM = 536870912;
pub const MAX_USER_RECORDS = 1000;
pub const versionbyte = 1;
pub const versionbyte_length = 1;
pub const DOMAIN_NO_LM_OWF_CHANGE = 64;
pub const MSV1_0_CHALLENGE_LENGTH = 8;
pub const MSV1_0_USER_SESSION_KEY_LENGTH = 16;
pub const MSV1_0_LANMAN_SESSION_KEY_LENGTH = 8;
pub const MSV1_0_USE_CLIENT_CHALLENGE = 128;
pub const MSV1_0_DISABLE_PERSONAL_FALLBACK = 4096;
pub const MSV1_0_ALLOW_FORCE_GUEST = 8192;
pub const MSV1_0_CLEARTEXT_PASSWORD_SUPPLIED = 16384;
pub const MSV1_0_USE_DOMAIN_FOR_ROUTING_ONLY = 32768;
pub const MSV1_0_SUBAUTHENTICATION_DLL_EX = 1048576;
pub const MSV1_0_ALLOW_MSVCHAPV2 = 65536;
pub const MSV1_0_S4U2SELF = 131072;
pub const MSV1_0_CHECK_LOGONHOURS_FOR_S4U = 262144;
pub const MSV1_0_INTERNET_DOMAIN = 524288;
pub const MSV1_0_SUBAUTHENTICATION_DLL = 4278190080;
pub const MSV1_0_SUBAUTHENTICATION_DLL_SHIFT = 24;
pub const MSV1_0_MNS_LOGON = 16777216;
pub const MSV1_0_SUBAUTHENTICATION_DLL_RAS = 2;
pub const MSV1_0_SUBAUTHENTICATION_DLL_IIS = 132;
pub const MSV1_0_S4U_LOGON_FLAG_CHECK_LOGONHOURS = 2;
pub const LOGON_NTLMV2_ENABLED = 256;
pub const LOGON_NT_V2 = 2048;
pub const LOGON_LM_V2 = 4096;
pub const LOGON_NTLM_V2 = 8192;
pub const LOGON_OPTIMIZED = 16384;
pub const LOGON_WINLOGON = 32768;
pub const LOGON_PKINIT = 65536;
pub const LOGON_NO_OPTIMIZED = 131072;
pub const LOGON_NO_ELEVATION = 262144;
pub const LOGON_MANAGED_SERVICE = 524288;
pub const MSV1_0_SUBAUTHENTICATION_FLAGS = 4278190080;
pub const LOGON_GRACE_LOGON = 16777216;
pub const MSV1_0_OWF_PASSWORD_LENGTH = 16;
pub const MSV1_0_SHA_PASSWORD_LENGTH = 20;
pub const MSV1_0_CREDENTIAL_KEY_LENGTH = 20;
pub const MSV1_0_CRED_REMOVED = 4;
pub const MSV1_0_CRED_CREDKEY_PRESENT = 8;
pub const MSV1_0_CRED_SHA_PRESENT = 16;
pub const MSV1_0_CRED_VERSION_V2 = 2;
pub const MSV1_0_CRED_VERSION_V3 = 4;
pub const MSV1_0_CRED_VERSION_IUM = 4294901761;
pub const MSV1_0_CRED_VERSION_REMOTE = 4294901762;
pub const MSV1_0_CRED_VERSION_ARSO = 4294901763;
pub const MSV1_0_CRED_VERSION_RESERVED_1 = 4294967294;
pub const MSV1_0_CRED_VERSION_INVALID = 4294967295;
pub const MSV1_0_NTLM3_RESPONSE_LENGTH = 16;
pub const MSV1_0_NTLM3_OWF_LENGTH = 16;
pub const MSV1_0_MAX_NTLM3_LIFE = 1800;
pub const MSV1_0_MAX_AVL_SIZE = 64000;
pub const MSV1_0_AV_FLAG_FORCE_GUEST = 1;
pub const MSV1_0_AV_FLAG_MIC_HANDSHAKE_MESSAGES = 2;
pub const MSV1_0_AV_FLAG_UNVERIFIED_TARGET = 4;
pub const RTL_ENCRYPT_MEMORY_SIZE = 8;
pub const RTL_ENCRYPT_OPTION_CROSS_PROCESS = 1;
pub const RTL_ENCRYPT_OPTION_SAME_LOGON = 2;
pub const RTL_ENCRYPT_OPTION_FOR_SYSTEM = 4;
pub const KERBEROS_VERSION = 5;
pub const KERBEROS_REVISION = 6;
pub const KERB_ETYPE_AES128_CTS_HMAC_SHA1_96 = 17;
pub const KERB_ETYPE_AES256_CTS_HMAC_SHA1_96 = 18;
pub const KERB_ETYPE_AES128_CTS_HMAC_SHA256 = 19;
pub const KERB_ETYPE_AES256_CTS_HMAC_SHA384 = 20;
pub const KERB_ETYPE_RC4_PLAIN2 = -129;
pub const KERB_ETYPE_RC4_LM = -130;
pub const KERB_ETYPE_RC4_SHA = -131;
pub const KERB_ETYPE_DES_PLAIN = -132;
pub const KERB_ETYPE_RC4_HMAC_OLD = -133;
pub const KERB_ETYPE_RC4_PLAIN_OLD = -134;
pub const KERB_ETYPE_RC4_HMAC_OLD_EXP = -135;
pub const KERB_ETYPE_RC4_PLAIN_OLD_EXP = -136;
pub const KERB_ETYPE_RC4_PLAIN = -140;
pub const KERB_ETYPE_RC4_PLAIN_EXP = -141;
pub const KERB_ETYPE_AES128_CTS_HMAC_SHA1_96_PLAIN = -148;
pub const KERB_ETYPE_AES256_CTS_HMAC_SHA1_96_PLAIN = -149;
pub const KERB_ETYPE_DSA_SHA1_CMS = 9;
pub const KERB_ETYPE_RSA_MD5_CMS = 10;
pub const KERB_ETYPE_RSA_SHA1_CMS = 11;
pub const KERB_ETYPE_RC2_CBC_ENV = 12;
pub const KERB_ETYPE_RSA_ENV = 13;
pub const KERB_ETYPE_RSA_ES_OEAP_ENV = 14;
pub const KERB_ETYPE_DES_EDE3_CBC_ENV = 15;
pub const KERB_ETYPE_DSA_SIGN = 8;
pub const KERB_ETYPE_RSA_PRIV = 9;
pub const KERB_ETYPE_RSA_PUB = 10;
pub const KERB_ETYPE_RSA_PUB_MD5 = 11;
pub const KERB_ETYPE_RSA_PUB_SHA1 = 12;
pub const KERB_ETYPE_PKCS7_PUB = 13;
pub const KERB_ETYPE_DES3_CBC_MD5 = 5;
pub const KERB_ETYPE_DES3_CBC_SHA1 = 7;
pub const KERB_ETYPE_DES3_CBC_SHA1_KD = 16;
pub const KERB_ETYPE_DES_CBC_MD5_NT = 20;
pub const KERB_ETYPE_RC4_HMAC_NT_EXP = 24;
pub const KERB_CHECKSUM_NONE = 0;
pub const KERB_CHECKSUM_CRC32 = 1;
pub const KERB_CHECKSUM_MD4 = 2;
pub const KERB_CHECKSUM_KRB_DES_MAC = 4;
pub const KERB_CHECKSUM_KRB_DES_MAC_K = 5;
pub const KERB_CHECKSUM_MD5 = 7;
pub const KERB_CHECKSUM_MD5_DES = 8;
pub const KERB_CHECKSUM_SHA1_NEW = 14;
pub const KERB_CHECKSUM_HMAC_SHA1_96_AES128 = 15;
pub const KERB_CHECKSUM_HMAC_SHA1_96_AES256 = 16;
pub const KERB_CHECKSUM_LM = -130;
pub const KERB_CHECKSUM_SHA1 = -131;
pub const KERB_CHECKSUM_REAL_CRC32 = -132;
pub const KERB_CHECKSUM_DES_MAC = -133;
pub const KERB_CHECKSUM_DES_MAC_MD5 = -134;
pub const KERB_CHECKSUM_MD25 = -135;
pub const KERB_CHECKSUM_RC4_MD5 = -136;
pub const KERB_CHECKSUM_MD5_HMAC = -137;
pub const KERB_CHECKSUM_HMAC_MD5 = -138;
pub const KERB_CHECKSUM_SHA256 = -139;
pub const KERB_CHECKSUM_SHA384 = -140;
pub const KERB_CHECKSUM_SHA512 = -141;
pub const KERB_CHECKSUM_HMAC_SHA1_96_AES128_Ki = -150;
pub const KERB_CHECKSUM_HMAC_SHA1_96_AES256_Ki = -151;
pub const AUTH_REQ_ALLOW_FORWARDABLE = 1;
pub const AUTH_REQ_ALLOW_PROXIABLE = 2;
pub const AUTH_REQ_ALLOW_POSTDATE = 4;
pub const AUTH_REQ_ALLOW_RENEWABLE = 8;
pub const AUTH_REQ_ALLOW_NOADDRESS = 16;
pub const AUTH_REQ_ALLOW_ENC_TKT_IN_SKEY = 32;
pub const AUTH_REQ_ALLOW_VALIDATE = 64;
pub const AUTH_REQ_VALIDATE_CLIENT = 128;
pub const AUTH_REQ_OK_AS_DELEGATE = 256;
pub const AUTH_REQ_PREAUTH_REQUIRED = 512;
pub const AUTH_REQ_TRANSITIVE_TRUST = 1024;
pub const AUTH_REQ_ALLOW_S4U_DELEGATE = 2048;
pub const KERB_TICKET_FLAGS_name_canonicalize = 65536;
pub const KERB_TICKET_FLAGS_cname_in_pa_data = 262144;
pub const KERB_TICKET_FLAGS_enc_pa_rep = 65536;
pub const KRB_NT_UNKNOWN = 0;
pub const KRB_NT_PRINCIPAL = 1;
pub const KRB_NT_PRINCIPAL_AND_ID = -131;
pub const KRB_NT_SRV_INST = 2;
pub const KRB_NT_SRV_INST_AND_ID = -132;
pub const KRB_NT_SRV_HST = 3;
pub const KRB_NT_SRV_XHST = 4;
pub const KRB_NT_UID = 5;
pub const KRB_NT_ENTERPRISE_PRINCIPAL = 10;
pub const KRB_NT_WELLKNOWN = 11;
pub const KRB_NT_ENT_PRINCIPAL_AND_ID = -130;
pub const KRB_NT_MS_PRINCIPAL = -128;
pub const KRB_NT_MS_PRINCIPAL_AND_ID = -129;
pub const KRB_NT_MS_BRANCH_ID = -133;
pub const KRB_NT_X500_PRINCIPAL = 6;
pub const KERB_WRAP_NO_ENCRYPT = 2147483649;
pub const KERB_CERTIFICATE_LOGON_FLAG_CHECK_DUPLICATES = 1;
pub const KERB_CERTIFICATE_LOGON_FLAG_USE_CERTIFICATE_INFO = 2;
pub const KERB_CERTIFICATE_S4U_LOGON_FLAG_CHECK_DUPLICATES = 1;
pub const KERB_CERTIFICATE_S4U_LOGON_FLAG_CHECK_LOGONHOURS = 2;
pub const KERB_CERTIFICATE_S4U_LOGON_FLAG_FAIL_IF_NT_AUTH_POLICY_REQUIRED = 4;
pub const KERB_CERTIFICATE_S4U_LOGON_FLAG_IDENTIFY = 8;
pub const KERB_LOGON_FLAG_ALLOW_EXPIRED_TICKET = 1;
pub const KERB_LOGON_FLAG_REDIRECTED = 2;
pub const KERB_S4U_LOGON_FLAG_CHECK_LOGONHOURS = 2;
pub const KERB_S4U_LOGON_FLAG_IDENTIFY = 8;
pub const KERB_USE_DEFAULT_TICKET_FLAGS = 0;
pub const KERB_RETRIEVE_TICKET_DEFAULT = 0;
pub const KERB_RETRIEVE_TICKET_DONT_USE_CACHE = 1;
pub const KERB_RETRIEVE_TICKET_USE_CACHE_ONLY = 2;
pub const KERB_RETRIEVE_TICKET_USE_CREDHANDLE = 4;
pub const KERB_RETRIEVE_TICKET_AS_KERB_CRED = 8;
pub const KERB_RETRIEVE_TICKET_WITH_SEC_CRED = 16;
pub const KERB_RETRIEVE_TICKET_CACHE_TICKET = 32;
pub const KERB_RETRIEVE_TICKET_MAX_LIFETIME = 64;
pub const KERB_ETYPE_DEFAULT = 0;
pub const KERB_PURGE_ALL_TICKETS = 1;
pub const KERB_S4U2PROXY_CACHE_ENTRY_INFO_FLAG_NEGATIVE = 1;
pub const KERB_S4U2PROXY_CRED_FLAG_NEGATIVE = 1;
pub const KERB_REFRESH_POLICY_KERBEROS = 1;
pub const KERB_REFRESH_POLICY_KDC = 2;
pub const KERB_CLOUD_KERBEROS_DEBUG_DATA_VERSION = 1;
pub const DS_UNKNOWN_ADDRESS_TYPE = 0;
pub const KERB_SETPASS_USE_LOGONID = 1;
pub const KERB_SETPASS_USE_CREDHANDLE = 2;
pub const KERB_DECRYPT_FLAG_DEFAULT_KEY = 1;
pub const KERB_REFRESH_SCCRED_RELEASE = 0;
pub const KERB_REFRESH_SCCRED_GETTGT = 1;
pub const KERB_REQUEST_CRED_LOCAL_ACCOUNT = 8;
pub const KERB_TRANSFER_CRED_WITH_TICKETS = 1;
pub const KERB_TRANSFER_CRED_CLEANUP_CREDENTIALS = 2;
pub const KERB_QUERY_DOMAIN_EXTENDED_POLICIES_RESPONSE_FLAG_DAC_DISABLED = 1;
pub const AUDIT_SET_SYSTEM_POLICY = 1;
pub const AUDIT_QUERY_SYSTEM_POLICY = 2;
pub const AUDIT_SET_USER_POLICY = 4;
pub const AUDIT_QUERY_USER_POLICY = 8;
pub const AUDIT_ENUMERATE_USERS = 16;
pub const AUDIT_SET_MISC_POLICY = 32;
pub const AUDIT_QUERY_MISC_POLICY = 64;
pub const SECPKG_CLIENT_PROCESS_TERMINATED = 1;
pub const SECPKG_CLIENT_THREAD_TERMINATED = 2;
pub const SECPKG_CALL_KERNEL_MODE = 1;
pub const SECPKG_CALL_ANSI = 2;
pub const SECPKG_CALL_URGENT = 4;
pub const SECPKG_CALL_RECURSIVE = 8;
pub const SECPKG_CALL_IN_PROC = 16;
pub const SECPKG_CALL_CLEANUP = 32;
pub const SECPKG_CALL_WOWCLIENT = 64;
pub const SECPKG_CALL_THREAD_TERM = 128;
pub const SECPKG_CALL_PROCESS_TERM = 256;
pub const SECPKG_CALL_IS_TCB = 512;
pub const SECPKG_CALL_NETWORK_ONLY = 1024;
pub const SECPKG_CALL_WINLOGON = 2048;
pub const SECPKG_CALL_ASYNC_UPDATE = 4096;
pub const SECPKG_CALL_SYSTEM_PROC = 8192;
pub const SECPKG_CALL_NEGO = 16384;
pub const SECPKG_CALL_NEGO_EXTENDER = 32768;
pub const SECPKG_CALL_BUFFER_MARSHAL = 65536;
pub const SECPKG_CALL_UNLOCK = 131072;
pub const SECPKG_CALL_CLOUDAP_CONNECT = 262144;
pub const SECPKG_CALL_WOWX86 = 64;
pub const SECPKG_CALL_WOWA32 = 262144;
pub const SECPKG_CREDENTIAL_VERSION = 201;
pub const SECPKG_CREDENTIAL_FLAGS_CALLER_HAS_TCB = 1;
pub const SECPKG_CREDENTIAL_FLAGS_CREDMAN_CRED = 2;
pub const SECPKG_SURROGATE_LOGON_VERSION_1 = 1;
pub const SECBUFFER_UNMAPPED = 1073741824;
pub const SECBUFFER_KERNEL_MAP = 536870912;
pub const PRIMARY_CRED_CLEAR_PASSWORD = 1;
pub const PRIMARY_CRED_OWF_PASSWORD = 2;
pub const PRIMARY_CRED_UPDATE = 4;
pub const PRIMARY_CRED_CACHED_LOGON = 8;
pub const PRIMARY_CRED_LOGON_NO_TCB = 16;
pub const PRIMARY_CRED_LOGON_LUA = 32;
pub const PRIMARY_CRED_INTERACTIVE_SMARTCARD_LOGON = 64;
pub const PRIMARY_CRED_REFRESH_NEEDED = 128;
pub const PRIMARY_CRED_INTERNET_USER = 256;
pub const PRIMARY_CRED_AUTH_ID = 512;
pub const PRIMARY_CRED_DO_NOT_SPLIT = 1024;
pub const PRIMARY_CRED_PROTECTED_USER = 2048;
pub const PRIMARY_CRED_EX = 4096;
pub const PRIMARY_CRED_TRANSFER = 8192;
pub const PRIMARY_CRED_RESTRICTED_TS = 16384;
pub const PRIMARY_CRED_PACKED_CREDS = 32768;
pub const PRIMARY_CRED_ENTERPRISE_INTERNET_USER = 65536;
pub const PRIMARY_CRED_ENCRYPTED_CREDGUARD_PASSWORD = 131072;
pub const PRIMARY_CRED_CACHED_INTERACTIVE_LOGON = 262144;
pub const PRIMARY_CRED_INTERACTIVE_NGC_LOGON = 524288;
pub const PRIMARY_CRED_INTERACTIVE_FIDO_LOGON = 1048576;
pub const PRIMARY_CRED_ARSO_LOGON = 2097152;
pub const PRIMARY_CRED_SUPPLEMENTAL = 4194304;
pub const PRIMARY_CRED_FOR_PASSWORD_CHANGE = 8388608;
pub const PRIMARY_CRED_LOCAL_USER = 16777216;
pub const PRIMARY_CRED_LOGON_PACKAGE_SHIFT = 24;
pub const PRIMARY_CRED_PACKAGE_MASK = 4278190080;
pub const SECPKG_PRIMARY_CRED_EX_FLAGS_EX_DELEGATION_TOKEN = 1;
pub const MAX_CRED_SIZE = 1024;
pub const SECPKG_STATE_ENCRYPTION_PERMITTED = 1;
pub const SECPKG_STATE_STRONG_ENCRYPTION_PERMITTED = 2;
pub const SECPKG_STATE_DOMAIN_CONTROLLER = 4;
pub const SECPKG_STATE_WORKSTATION = 8;
pub const SECPKG_STATE_STANDALONE = 16;
pub const SECPKG_STATE_CRED_ISOLATION_ENABLED = 32;
pub const SECPKG_STATE_RESERVED_1 = 2147483648;
pub const SECPKG_MAX_OID_LENGTH = 32;
pub const SECPKG_MSVAV_FLAGS_VALID = 1;
pub const SECPKG_MSVAV_TIMESTAMP_VALID = 2;
pub const SECPKG_ATTR_SASL_CONTEXT = 65536;
pub const SECPKG_ATTR_THUNK_ALL = 65536;
pub const UNDERSTANDS_LONG_NAMES = 1;
pub const NO_LONG_NAMES = 2;
pub const SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_OPTIMISTIC_LOGON = 1;
pub const SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_CLEANUP_CREDENTIALS = 2;
pub const SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST_FLAG_TO_SSO_SESSION = 4;
pub const NOTIFIER_FLAG_NEW_THREAD = 1;
pub const NOTIFIER_FLAG_ONE_SHOT = 2;
pub const NOTIFIER_FLAG_SECONDS = 2147483648;
pub const NOTIFIER_TYPE_INTERVAL = 1;
pub const NOTIFIER_TYPE_HANDLE_WAIT = 2;
pub const NOTIFIER_TYPE_STATE_CHANGE = 3;
pub const NOTIFIER_TYPE_NOTIFY_EVENT = 4;
pub const NOTIFIER_TYPE_IMMEDIATE = 16;
pub const NOTIFY_CLASS_PACKAGE_CHANGE = 1;
pub const NOTIFY_CLASS_ROLE_CHANGE = 2;
pub const NOTIFY_CLASS_DOMAIN_CHANGE = 3;
pub const NOTIFY_CLASS_REGISTRY_CHANGE = 4;
pub const LSA_QUERY_CLIENT_PRELOGON_SESSION_ID = 1;
pub const CREDP_FLAGS_IN_PROCESS = 1;
pub const CREDP_FLAGS_USE_MIDL_HEAP = 2;
pub const CREDP_FLAGS_DONT_CACHE_TI = 4;
pub const CREDP_FLAGS_CLEAR_PASSWORD = 8;
pub const CREDP_FLAGS_USER_ENCRYPTED_PASSWORD = 16;
pub const CREDP_FLAGS_TRUSTED_CALLER = 32;
pub const CREDP_FLAGS_VALIDATE_PROXY_TARGET = 64;
pub const CRED_MARSHALED_TI_SIZE_SIZE = 12;
pub const SECPKG_UNICODE_ATTRIBUTE = 2147483648;
pub const SECPKG_ANSI_ATTRIBUTE = 0;
pub const SECPKG_CREDENTIAL_ATTRIBUTE = 0;
pub const SECPKG_INTERFACE_VERSION = 65536;
pub const SECPKG_INTERFACE_VERSION_2 = 131072;
pub const SECPKG_INTERFACE_VERSION_3 = 262144;
pub const SECPKG_INTERFACE_VERSION_4 = 524288;
pub const SECPKG_INTERFACE_VERSION_5 = 1048576;
pub const SECPKG_INTERFACE_VERSION_6 = 2097152;
pub const SECPKG_INTERFACE_VERSION_7 = 4194304;
pub const SECPKG_INTERFACE_VERSION_8 = 8388608;
pub const SECPKG_INTERFACE_VERSION_9 = 16777216;
pub const SECPKG_INTERFACE_VERSION_10 = 33554432;
pub const SECPKG_INTERFACE_VERSION_11 = 67108864;
pub const UNISP_RPC_ID = 14;
pub const RCRED_STATUS_NOCRED = 0;
pub const RCRED_CRED_EXISTS = 1;
pub const RCRED_STATUS_UNKNOWN_ISSUER = 2;
pub const LCRED_STATUS_NOCRED = 0;
pub const LCRED_CRED_EXISTS = 1;
pub const LCRED_STATUS_UNKNOWN_ISSUER = 2;
pub const SECPKGCONTEXT_CONNECTION_INFO_EX_V1 = 1;
pub const SECPKGCONTEXT_CIPHERINFO_V1 = 1;
pub const SSL_SESSION_RECONNECT = 1;
pub const KERN_CONTEXT_CERT_INFO_V1 = 0;
pub const ENABLE_TLS_CLIENT_EARLY_START = 1;
pub const SCH_CRED_V1 = 1;
pub const SCH_CRED_V2 = 2;
pub const SCH_CRED_VERSION = 2;
pub const SCH_CRED_V3 = 3;
pub const SCHANNEL_CRED_VERSION = 4;
pub const SCH_CREDENTIALS_VERSION = 5;
pub const TLS_PARAMS_OPTIONAL = 1;
pub const SCH_CRED_MAX_SUPPORTED_PARAMETERS = 16;
pub const SCH_CRED_MAX_SUPPORTED_ALPN_IDS = 16;
pub const SCH_CRED_MAX_SUPPORTED_CRYPTO_SETTINGS = 16;
pub const SCH_CRED_MAX_SUPPORTED_CHAINING_MODES = 16;
pub const SCH_MAX_EXT_SUBSCRIPTIONS = 2;
pub const SCH_CRED_FORMAT_CERT_CONTEXT = 0;
pub const SCH_CRED_FORMAT_CERT_HASH = 1;
pub const SCH_CRED_FORMAT_CERT_HASH_STORE = 2;
pub const SCH_CRED_MAX_STORE_NAME_SIZE = 128;
pub const SCH_CRED_MAX_SUPPORTED_ALGS = 256;
pub const SCH_CRED_MAX_SUPPORTED_CERTS = 100;
pub const SCH_MACHINE_CERT_HASH = 1;
pub const SCH_CRED_DISABLE_RECONNECTS = 128;
pub const SCH_CRED_RESTRICTED_ROOTS = 8192;
pub const SCH_CRED_REVOCATION_CHECK_CACHE_ONLY = 16384;
pub const SCH_CRED_CACHE_ONLY_URL_RETRIEVAL = 32768;
pub const SCH_CRED_MEMORY_STORE_CERT = 65536;
pub const SCH_CRED_SNI_CREDENTIAL = 524288;
pub const SCH_CRED_SNI_ENABLE_OCSP = 1048576;
pub const SCH_USE_DTLS_ONLY = 16777216;
pub const SCH_ALLOW_NULL_ENCRYPTION = 33554432;
pub const SCH_CRED_DEFERRED_CRED_VALIDATION = 67108864;
pub const SCHANNEL_RENEGOTIATE = 0;
pub const SCHANNEL_SHUTDOWN = 1;
pub const SCHANNEL_ALERT = 2;
pub const SCHANNEL_SESSION = 3;
pub const TLS1_ALERT_CLOSE_NOTIFY = 0;
pub const TLS1_ALERT_UNEXPECTED_MESSAGE = 10;
pub const TLS1_ALERT_BAD_RECORD_MAC = 20;
pub const TLS1_ALERT_DECRYPTION_FAILED = 21;
pub const TLS1_ALERT_RECORD_OVERFLOW = 22;
pub const TLS1_ALERT_DECOMPRESSION_FAIL = 30;
pub const TLS1_ALERT_HANDSHAKE_FAILURE = 40;
pub const TLS1_ALERT_BAD_CERTIFICATE = 42;
pub const TLS1_ALERT_UNSUPPORTED_CERT = 43;
pub const TLS1_ALERT_CERTIFICATE_REVOKED = 44;
pub const TLS1_ALERT_CERTIFICATE_EXPIRED = 45;
pub const TLS1_ALERT_CERTIFICATE_UNKNOWN = 46;
pub const TLS1_ALERT_ILLEGAL_PARAMETER = 47;
pub const TLS1_ALERT_UNKNOWN_CA = 48;
pub const TLS1_ALERT_ACCESS_DENIED = 49;
pub const TLS1_ALERT_DECODE_ERROR = 50;
pub const TLS1_ALERT_DECRYPT_ERROR = 51;
pub const TLS1_ALERT_EXPORT_RESTRICTION = 60;
pub const TLS1_ALERT_PROTOCOL_VERSION = 70;
pub const TLS1_ALERT_INSUFFIENT_SECURITY = 71;
pub const TLS1_ALERT_INTERNAL_ERROR = 80;
pub const TLS1_ALERT_USER_CANCELED = 90;
pub const TLS1_ALERT_NO_RENEGOTIATION = 100;
pub const TLS1_ALERT_UNSUPPORTED_EXT = 110;
pub const TLS1_ALERT_UNKNOWN_PSK_IDENTITY = 115;
pub const TLS1_ALERT_NO_APP_PROTOCOL = 120;
pub const SP_PROT_PCT1_SERVER = 1;
pub const SP_PROT_PCT1_CLIENT = 2;
pub const SP_PROT_SSL2_SERVER = 4;
pub const SP_PROT_SSL2_CLIENT = 8;
pub const SP_PROT_SSL3_SERVER = 16;
pub const SP_PROT_SSL3_CLIENT = 32;
pub const SP_PROT_TLS1_SERVER = 64;
pub const SP_PROT_TLS1_CLIENT = 128;
pub const SP_PROT_UNI_SERVER = 1073741824;
pub const SP_PROT_UNI_CLIENT = 2147483648;
pub const SP_PROT_ALL = 4294967295;
pub const SP_PROT_NONE = 0;
pub const SP_PROT_TLS1_0_SERVER = 64;
pub const SP_PROT_TLS1_0_CLIENT = 128;
pub const SP_PROT_TLS1_1_SERVER = 256;
pub const SP_PROT_TLS1_1_CLIENT = 512;
pub const SP_PROT_TLS1_2_SERVER = 1024;
pub const SP_PROT_TLS1_2_CLIENT = 2048;
pub const SP_PROT_TLS1_3_SERVER = 4096;
pub const SP_PROT_TLS1_3_CLIENT = 8192;
pub const SP_PROT_DTLS_SERVER = 65536;
pub const SP_PROT_DTLS_CLIENT = 131072;
pub const SP_PROT_DTLS1_0_SERVER = 65536;
pub const SP_PROT_DTLS1_0_CLIENT = 131072;
pub const SP_PROT_DTLS1_2_SERVER = 262144;
pub const SP_PROT_DTLS1_2_CLIENT = 524288;
pub const SP_PROT_TLS1_3PLUS_SERVER = 4096;
pub const SP_PROT_TLS1_3PLUS_CLIENT = 8192;
pub const SCHANNEL_SECRET_TYPE_CAPI = 1;
pub const SCHANNEL_SECRET_PRIVKEY = 2;
pub const SCH_CRED_X509_CERTCHAIN = 1;
pub const SCH_CRED_X509_CAPI = 2;
pub const SCH_CRED_CERT_CONTEXT = 3;
pub const SL_SYSTEM_STATE_REBOOT_POLICY_FOUND = 1;
pub const SL_SYSTEM_STATE_TAMPERED = 2;
pub const SL_REARM_REBOOT_REQUIRED = 1;
pub const SPP_MIGRATION_GATHER_MIGRATABLE_APPS = 1;
pub const SPP_MIGRATION_GATHER_ACTIVATED_WINDOWS_STATE = 2;
pub const SPP_MIGRATION_GATHER_ALL = 4294967295;
pub const USER_ACCOUNT_DISABLED = 1;
pub const USER_HOME_DIRECTORY_REQUIRED = 2;
pub const USER_PASSWORD_NOT_REQUIRED = 4;
pub const USER_TEMP_DUPLICATE_ACCOUNT = 8;
pub const USER_NORMAL_ACCOUNT = 16;
pub const USER_MNS_LOGON_ACCOUNT = 32;
pub const USER_INTERDOMAIN_TRUST_ACCOUNT = 64;
pub const USER_WORKSTATION_TRUST_ACCOUNT = 128;
pub const USER_SERVER_TRUST_ACCOUNT = 256;
pub const USER_DONT_EXPIRE_PASSWORD = 512;
pub const USER_ACCOUNT_AUTO_LOCKED = 1024;
pub const USER_ENCRYPTED_TEXT_PASSWORD_ALLOWED = 2048;
pub const USER_SMARTCARD_REQUIRED = 4096;
pub const USER_TRUSTED_FOR_DELEGATION = 8192;
pub const USER_NOT_DELEGATED = 16384;
pub const USER_USE_DES_KEY_ONLY = 32768;
pub const USER_DONT_REQUIRE_PREAUTH = 65536;
pub const USER_PASSWORD_EXPIRED = 131072;
pub const USER_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION = 262144;
pub const USER_NO_AUTH_DATA_REQUIRED = 524288;
pub const USER_PARTIAL_SECRETS_ACCOUNT = 1048576;
pub const USER_USE_AES_KEYS = 2097152;
pub const USER_SHADOW_ACCOUNT = 4194304;
pub const SAM_DAYS_PER_WEEK = 7;
pub const USER_ALL_PARAMETERS = 2097152;
pub const CLEAR_BLOCK_LENGTH = 8;
pub const CYPHER_BLOCK_LENGTH = 8;
pub const NETLOGON_TARGET_INFO_TYPE_NTLM = 1;
pub const NETLOGON_TARGET_INFO_TYPE_KERBEROS = 2;
pub const MSV1_0_KERBEROS_LOGON = 4;
pub const MSV1_0_VALIDATION_LOGOFF_TIME = 1;
pub const MSV1_0_VALIDATION_KICKOFF_TIME = 2;
pub const MSV1_0_VALIDATION_LOGON_SERVER = 4;
pub const MSV1_0_VALIDATION_LOGON_DOMAIN = 8;
pub const MSV1_0_VALIDATION_SESSION_KEY = 16;
pub const MSV1_0_VALIDATION_USER_FLAGS = 32;
pub const MSV1_0_VALIDATION_USER_ID = 64;
pub const MSV1_0_SUBAUTH_ACCOUNT_DISABLED = 1;
pub const MSV1_0_SUBAUTH_PASSWORD = 2;
pub const MSV1_0_SUBAUTH_WORKSTATIONS = 4;
pub const MSV1_0_SUBAUTH_LOGON_HOURS = 8;
pub const MSV1_0_SUBAUTH_ACCOUNT_EXPIRY = 16;
pub const MSV1_0_SUBAUTH_PASSWORD_EXPIRY = 32;
pub const MSV1_0_SUBAUTH_ACCOUNT_TYPE = 64;
pub const MSV1_0_SUBAUTH_LOCKOUT = 128;
pub const SL_MDOLLAR_ZONE = 40960;
pub const SL_SERVER_ZONE = 45056;
pub const SL_MSCH_ZONE = 49152;
pub const SL_INTERNAL_ZONE = 57344;
pub const SL_CLIENTAPI_ZONE = 61440;
pub const FACILITY_SL_ITF = 4;
pub const _FACILITY_WINDOWS_STORE = 63;
pub const SL_E_SRV_INVALID_PUBLISH_LICENSE = -1073434623;
pub const SL_E_SRV_INVALID_PRODUCT_KEY_LICENSE = -1073434622;
pub const SL_E_SRV_INVALID_RIGHTS_ACCOUNT_LICENSE = -1073434621;
pub const SL_E_SRV_INVALID_LICENSE_STRUCTURE = -1073434620;
pub const SL_E_SRV_AUTHORIZATION_FAILED = -1073434619;
pub const SL_E_SRV_INVALID_BINDING = -1073434618;
pub const SL_E_SRV_SERVER_PONG = -1073434617;
pub const SL_E_SRV_INVALID_PAYLOAD = -1073434616;
pub const SL_E_SRV_INVALID_SECURITY_PROCESSOR_LICENSE = -1073434615;
pub const SL_E_SRV_BUSINESS_TOKEN_ENTRY_NOT_FOUND = -1073434608;
pub const SL_E_SRV_CLIENT_CLOCK_OUT_OF_SYNC = -1073434607;
pub const SL_E_SRV_GENERAL_ERROR = -1073434368;
pub const SL_E_CHPA_PRODUCT_KEY_OUT_OF_RANGE = -1073430527;
pub const SL_E_CHPA_INVALID_BINDING = -1073430526;
pub const SL_E_CHPA_PRODUCT_KEY_BLOCKED = -1073430525;
pub const SL_E_CHPA_INVALID_PRODUCT_KEY = -1073430524;
pub const SL_E_CHPA_BINDING_NOT_FOUND = -1073430523;
pub const SL_E_CHPA_BINDING_MAPPING_NOT_FOUND = -1073430522;
pub const SL_E_CHPA_UNSUPPORTED_PRODUCT_KEY = -1073430521;
pub const SL_E_CHPA_MAXIMUM_UNLOCK_EXCEEDED = -1073430520;
pub const SL_E_CHPA_ACTCONFIG_ID_NOT_FOUND = -1073430519;
pub const SL_E_CHPA_INVALID_PRODUCT_DATA_ID = -1073430518;
pub const SL_E_CHPA_INVALID_PRODUCT_DATA = -1073430517;
pub const SL_E_CHPA_SYSTEM_ERROR = -1073430516;
pub const SL_E_CHPA_INVALID_ACTCONFIG_ID = -1073430515;
pub const SL_E_CHPA_INVALID_PRODUCT_KEY_LENGTH = -1073430514;
pub const SL_E_CHPA_INVALID_PRODUCT_KEY_FORMAT = -1073430513;
pub const SL_E_CHPA_INVALID_PRODUCT_KEY_CHAR = -1073430512;
pub const SL_E_CHPA_INVALID_BINDING_URI = -1073430511;
pub const SL_E_CHPA_NETWORK_ERROR = -1073430510;
pub const SL_E_CHPA_DATABASE_ERROR = -1073430509;
pub const SL_E_CHPA_INVALID_ARGUMENT = -1073430508;
pub const SL_E_CHPA_DMAK_LIMIT_EXCEEDED = -1073430496;
pub const SL_E_CHPA_DMAK_EXTENSION_LIMIT_EXCEEDED = -1073430495;
pub const SL_E_CHPA_REISSUANCE_LIMIT_NOT_FOUND = -1073430494;
pub const SL_E_CHPA_OVERRIDE_REQUEST_NOT_FOUND = -1073430493;
pub const SL_E_CHPA_OEM_SLP_COA0 = -1073430506;
pub const SL_E_CHPA_PRODUCT_KEY_BLOCKED_IPLOCATION = -1073430505;
pub const SL_E_CHPA_RESPONSE_NOT_AVAILABLE = -1073430507;
pub const SL_E_CHPA_GENERAL_ERROR = -1073430448;
pub const SL_E_CHPA_TIMEBASED_ACTIVATION_BEFORE_START_DATE = -1073430480;
pub const SL_E_CHPA_TIMEBASED_ACTIVATION_AFTER_END_DATE = -1073430479;
pub const SL_E_CHPA_TIMEBASED_ACTIVATION_NOT_AVAILABLE = -1073430478;
pub const SL_E_CHPA_TIMEBASED_PRODUCT_KEY_NOT_CONFIGURED = -1073430477;
pub const SL_E_CHPA_NO_RULES_TO_ACTIVATE = -1073430449;
pub const SL_E_CHPA_DIGITALMARKER_INVALID_BINDING = -1073430447;
pub const SL_E_CHPA_DIGITALMARKER_BINDING_NOT_CONFIGURED = -1073430446;
pub const SL_E_CHPA_DYNAMICALLY_BLOCKED_PRODUCT_KEY = -1073430432;
pub const SL_E_CHPA_MSCH_RESPONSE_NOT_AVAILABLE_VGA = -1073429505;
pub const SL_E_CHPA_BUSINESS_RULE_INPUT_NOT_FOUND = -1073428736;
pub const SL_E_CHPA_NULL_VALUE_FOR_PROPERTY_NAME_OR_ID = -1073428656;
pub const SL_E_CHPA_UNKNOWN_PROPERTY_NAME = -1073428655;
pub const SL_E_CHPA_UNKNOWN_PROPERTY_ID = -1073428654;
pub const SL_E_CHPA_FAILED_TO_UPDATE_PRODUCTKEY_BINDING = -1073428651;
pub const SL_E_CHPA_FAILED_TO_INSERT_PRODUCTKEY_BINDING = -1073428650;
pub const SL_E_CHPA_FAILED_TO_DELETE_PRODUCTKEY_BINDING = -1073428649;
pub const SL_E_CHPA_FAILED_TO_PROCESS_PRODUCT_KEY_BINDINGS_XML = -1073428648;
pub const SL_E_CHPA_FAILED_TO_INSERT_PRODUCT_KEY_PROPERTY = -1073428646;
pub const SL_E_CHPA_FAILED_TO_UPDATE_PRODUCT_KEY_PROPERTY = -1073428645;
pub const SL_E_CHPA_FAILED_TO_DELETE_PRODUCT_KEY_PROPERTY = -1073428644;
pub const SL_E_CHPA_UNKNOWN_PRODUCT_KEY_TYPE = -1073428636;
pub const SL_E_CHPA_PRODUCT_KEY_BEING_USED = -1073428624;
pub const SL_E_CHPA_FAILED_TO_INSERT_PRODUCT_KEY_RECORD = -1073428608;
pub const SL_E_CHPA_FAILED_TO_UPDATE_PRODUCT_KEY_RECORD = -1073428607;
pub const SL_E_INVALID_LICENSE_STATE_BREACH_GRACE = -1073429871;
pub const SL_E_INVALID_LICENSE_STATE_BREACH_GRACE_EXPIRED = -1073429870;
pub const SL_E_INVALID_TEMPLATE_ID = -1073429770;
pub const SL_E_INVALID_XML_BLOB = -1073429766;
pub const SL_E_VALIDATION_BLOB_PARAM_NOT_FOUND = -1073429721;
pub const SL_E_INVALID_CLIENT_TOKEN = -1073429720;
pub const SL_E_INVALID_OFFLINE_BLOB = -1073429719;
pub const SL_E_OFFLINE_VALIDATION_BLOB_PARAM_NOT_FOUND = -1073429718;
pub const SL_E_INVALID_OSVERSION_TEMPLATEID = -1073429717;
pub const SL_E_OFFLINE_GENUINE_BLOB_REVOKED = -1073429716;
pub const SL_E_OFFLINE_GENUINE_BLOB_NOT_FOUND = -1073429715;
pub const SL_E_INVALID_OS_FOR_PRODUCT_KEY = -1073429503;
pub const SL_E_INVALID_FILE_HASH = -1073429343;
pub const SL_E_VALIDATION_BLOCKED_PRODUCT_KEY = -1073429342;
pub const SL_E_MISMATCHED_KEY_TYPES = -1073429340;
pub const SL_E_VALIDATION_INVALID_PRODUCT_KEY = -1073429339;
pub const SL_E_INVALID_OEM_OR_VOLUME_BINDING_DATA = -1073429337;
pub const SL_E_INVALID_LICENSE_STATE = -1073429336;
pub const SL_E_IP_LOCATION_FALIED = -1073429335;
pub const SL_E_SOFTMOD_EXPLOIT_DETECTED = -1073429333;
pub const SL_E_INVALID_TOKEN_DATA = -1073429332;
pub const SL_E_HEALTH_CHECK_FAILED_NEUTRAL_FILES = -1073429331;
pub const SL_E_HEALTH_CHECK_FAILED_MUI_FILES = -1073429330;
pub const SL_E_INVALID_AD_DATA = -1073429329;
pub const SL_E_INVALID_RSDP_COUNT = -1073429328;
pub const SL_E_ENGINE_DETECTED_EXPLOIT = -1073429327;
pub const SL_E_NON_GENUINE_STATUS_LAST = -1073428992;
pub const SL_E_NOTIFICATION_BREACH_DETECTED = -1073429199;
pub const SL_E_NOTIFICATION_GRACE_EXPIRED = -1073429198;
pub const SL_E_NOTIFICATION_OTHER_REASONS = -1073429197;
pub const SL_E_INVALID_CONTEXT = -1073422335;
pub const SL_E_TOKEN_STORE_INVALID_STATE = -1073422334;
pub const SL_E_EVALUATION_FAILED = -1073422333;
pub const SL_E_NOT_EVALUATED = -1073422332;
pub const SL_E_NOT_ACTIVATED = -1073422331;
pub const SL_E_INVALID_GUID = -1073422330;
pub const SL_E_TOKSTO_TOKEN_NOT_FOUND = -1073422329;
pub const SL_E_TOKSTO_NO_PROPERTIES = -1073422328;
pub const SL_E_TOKSTO_NOT_INITIALIZED = -1073422327;
pub const SL_E_TOKSTO_ALREADY_INITIALIZED = -1073422326;
pub const SL_E_TOKSTO_NO_ID_SET = -1073422325;
pub const SL_E_TOKSTO_CANT_CREATE_FILE = -1073422324;
pub const SL_E_TOKSTO_CANT_WRITE_TO_FILE = -1073422323;
pub const SL_E_TOKSTO_CANT_READ_FILE = -1073422322;
pub const SL_E_TOKSTO_CANT_PARSE_PROPERTIES = -1073422321;
pub const SL_E_TOKSTO_PROPERTY_NOT_FOUND = -1073422320;
pub const SL_E_TOKSTO_INVALID_FILE = -1073422319;
pub const SL_E_TOKSTO_CANT_CREATE_MUTEX = -1073422318;
pub const SL_E_TOKSTO_CANT_ACQUIRE_MUTEX = -1073422317;
pub const SL_E_TOKSTO_NO_TOKEN_DATA = -1073422316;
pub const SL_E_EUL_CONSUMPTION_FAILED = -1073422315;
pub const SL_E_PKEY_INVALID_CONFIG = -1073422314;
pub const SL_E_PKEY_INVALID_UNIQUEID = -1073422313;
pub const SL_E_PKEY_INVALID_ALGORITHM = -1073422312;
pub const SL_E_PKEY_INTERNAL_ERROR = -1073422311;
pub const SL_E_LICENSE_INVALID_ADDON_INFO = -1073422310;
pub const SL_E_HWID_ERROR = -1073422309;
pub const SL_E_PKEY_INVALID_KEYCHANGE1 = -1073422308;
pub const SL_E_PKEY_INVALID_KEYCHANGE2 = -1073422307;
pub const SL_E_PKEY_INVALID_KEYCHANGE3 = -1073422306;
pub const SL_E_POLICY_OTHERINFO_MISMATCH = -1073422304;
pub const SL_E_PRODUCT_UNIQUENESS_GROUP_ID_INVALID = -1073422303;
pub const SL_E_SECURE_STORE_ID_MISMATCH = -1073422302;
pub const SL_E_INVALID_RULESET_RULE = -1073422301;
pub const SL_E_INVALID_CONTEXT_DATA = -1073422300;
pub const SL_E_INVALID_HASH = -1073422299;
pub const SL_E_INVALID_USE_OF_ADD_ON_PKEY = -2147164122;
pub const SL_E_WINDOWS_VERSION_MISMATCH = -1073422297;
pub const SL_E_ACTIVATION_IN_PROGRESS = -1073422296;
pub const SL_E_STORE_UPGRADE_TOKEN_REQUIRED = -1073422295;
pub const SL_E_STORE_UPGRADE_TOKEN_WRONG_EDITION = -1073422294;
pub const SL_E_STORE_UPGRADE_TOKEN_WRONG_PID = -1073422293;
pub const SL_E_STORE_UPGRADE_TOKEN_NOT_PRS_SIGNED = -1073422292;
pub const SL_E_STORE_UPGRADE_TOKEN_WRONG_VERSION = -1073422291;
pub const SL_E_STORE_UPGRADE_TOKEN_NOT_AUTHORIZED = -1073422290;
pub const SL_E_SFS_INVALID_FS_VERSION = -2147163903;
pub const SL_E_SFS_INVALID_FD_TABLE = -2147163902;
pub const SL_E_SFS_INVALID_SYNC = -2147163901;
pub const SL_E_SFS_BAD_TOKEN_NAME = -2147163900;
pub const SL_E_SFS_BAD_TOKEN_EXT = -2147163899;
pub const SL_E_SFS_DUPLICATE_TOKEN_NAME = -2147163898;
pub const SL_E_SFS_TOKEN_SIZE_MISMATCH = -2147163897;
pub const SL_E_SFS_INVALID_TOKEN_DATA_HASH = -2147163896;
pub const SL_E_SFS_FILE_READ_ERROR = -2147163895;
pub const SL_E_SFS_FILE_WRITE_ERROR = -2147163894;
pub const SL_E_SFS_INVALID_FILE_POSITION = -2147163893;
pub const SL_E_SFS_NO_ACTIVE_TRANSACTION = -2147163892;
pub const SL_E_SFS_INVALID_FS_HEADER = -2147163891;
pub const SL_E_SFS_INVALID_TOKEN_DESCRIPTOR = -2147163890;
pub const SL_E_INTERNAL_ERROR = -1073418239;
pub const SL_E_RIGHT_NOT_CONSUMED = -1073418238;
pub const SL_E_USE_LICENSE_NOT_INSTALLED = -1073418237;
pub const SL_E_MISMATCHED_PKEY_RANGE = -1073418236;
pub const SL_E_MISMATCHED_PID = -1073418235;
pub const SL_E_EXTERNAL_SIGNATURE_NOT_FOUND = -1073418234;
pub const SL_E_RAC_NOT_AVAILABLE = -1073418233;
pub const SL_E_SPC_NOT_AVAILABLE = -1073418232;
pub const SL_E_GRACE_TIME_EXPIRED = -1073418231;
pub const SL_E_MISMATCHED_APPID = -1073418230;
pub const SL_E_NO_PID_CONFIG_DATA = -1073418229;
pub const SL_I_OOB_GRACE_PERIOD = 1074065420;
pub const SL_I_OOT_GRACE_PERIOD = 1074065421;
pub const SL_E_MISMATCHED_SECURITY_PROCESSOR = -1073418226;
pub const SL_E_OUT_OF_TOLERANCE = -1073418225;
pub const SL_E_INVALID_PKEY = -1073418224;
pub const SL_E_LICENSE_FILE_NOT_INSTALLED = -1073418223;
pub const SL_E_VALUE_NOT_FOUND = -1073418222;
pub const SL_E_RIGHT_NOT_GRANTED = -1073418221;
pub const SL_E_PKEY_NOT_INSTALLED = -1073418220;
pub const SL_E_PRODUCT_SKU_NOT_INSTALLED = -1073418219;
pub const SL_E_NOT_SUPPORTED = -1073418218;
pub const SL_E_PUBLISHING_LICENSE_NOT_INSTALLED = -1073418217;
pub const SL_E_LICENSE_SERVER_URL_NOT_FOUND = -1073418216;
pub const SL_E_INVALID_EVENT_ID = -1073418215;
pub const SL_E_EVENT_NOT_REGISTERED = -1073418214;
pub const SL_E_EVENT_ALREADY_REGISTERED = -1073418213;
pub const SL_E_DECRYPTION_LICENSES_NOT_AVAILABLE = -1073418212;
pub const SL_E_LICENSE_SIGNATURE_VERIFICATION_FAILED = -1073418211;
pub const SL_E_DATATYPE_MISMATCHED = -1073418210;
pub const SL_E_INVALID_LICENSE = -1073418209;
pub const SL_E_INVALID_PACKAGE = -1073418208;
pub const SL_E_VALIDITY_TIME_EXPIRED = -1073418207;
pub const SL_E_LICENSE_AUTHORIZATION_FAILED = -1073418206;
pub const SL_E_LICENSE_DECRYPTION_FAILED = -1073418205;
pub const SL_E_WINDOWS_INVALID_LICENSE_STATE = -1073418204;
pub const SL_E_LUA_ACCESSDENIED = -1073418203;
pub const SL_E_PROXY_KEY_NOT_FOUND = -1073418202;
pub const SL_E_TAMPER_DETECTED = -1073418201;
pub const SL_E_POLICY_CACHE_INVALID = -1073418200;
pub const SL_E_INVALID_RUNNING_MODE = -1073418199;
pub const SL_E_SLP_NOT_SIGNED = -1073418198;
pub const SL_E_CIDIID_INVALID_DATA = -1073418196;
pub const SL_E_CIDIID_INVALID_VERSION = -1073418195;
pub const SL_E_CIDIID_VERSION_NOT_SUPPORTED = -1073418194;
pub const SL_E_CIDIID_INVALID_DATA_LENGTH = -1073418193;
pub const SL_E_CIDIID_NOT_DEPOSITED = -1073418192;
pub const SL_E_CIDIID_MISMATCHED = -1073418191;
pub const SL_E_INVALID_BINDING_BLOB = -1073418190;
pub const SL_E_PRODUCT_KEY_INSTALLATION_NOT_ALLOWED = -1073418189;
pub const SL_E_EUL_NOT_AVAILABLE = -1073418188;
pub const SL_E_VL_NOT_WINDOWS_SLP = -1073418187;
pub const SL_E_VL_NOT_ENOUGH_COUNT = -1073418184;
pub const SL_E_VL_BINDING_SERVICE_NOT_ENABLED = -1073418183;
pub const SL_E_VL_INFO_PRODUCT_USER_RIGHT = 1074065472;
pub const SL_E_VL_KEY_MANAGEMENT_SERVICE_NOT_ACTIVATED = -1073418175;
pub const SL_E_VL_KEY_MANAGEMENT_SERVICE_ID_MISMATCH = -1073418174;
pub const SL_E_PROXY_POLICY_NOT_UPDATED = -1073418169;
pub const SL_E_CIDIID_INVALID_CHECK_DIGITS = -1073418163;
pub const SL_E_LICENSE_MANAGEMENT_DATA_NOT_FOUND = -1073418161;
pub const SL_E_INVALID_PRODUCT_KEY = -1073418160;
pub const SL_E_BLOCKED_PRODUCT_KEY = -1073418159;
pub const SL_E_DUPLICATE_POLICY = -1073418158;
pub const SL_E_MISSING_OVERRIDE_ONLY_ATTRIBUTE = -1073418157;
pub const SL_E_LICENSE_MANAGEMENT_DATA_DUPLICATED = -1073418156;
pub const SL_E_BASE_SKU_NOT_AVAILABLE = -1073418155;
pub const SL_E_VL_MACHINE_NOT_BOUND = -1073418154;
pub const SL_E_SLP_MISSING_ACPI_SLIC = -1073418153;
pub const SL_E_SLP_MISSING_SLP_MARKER = -1073418152;
pub const SL_E_SLP_BAD_FORMAT = -1073418151;
pub const SL_E_INVALID_PACKAGE_VERSION = -1073418144;
pub const SL_E_PKEY_INVALID_UPGRADE = -1073418143;
pub const SL_E_ISSUANCE_LICENSE_NOT_INSTALLED = -1073418142;
pub const SL_E_SLP_OEM_CERT_MISSING = -1073418141;
pub const SL_E_NONGENUINE_GRACE_TIME_EXPIRED = -1073418140;
pub const SL_I_NONGENUINE_GRACE_PERIOD = 1074065509;
pub const SL_E_DEPENDENT_PROPERTY_NOT_SET = -1073418138;
pub const SL_E_NONGENUINE_GRACE_TIME_EXPIRED_2 = -1073418137;
pub const SL_I_NONGENUINE_GRACE_PERIOD_2 = 1074065512;
pub const SL_E_MISMATCHED_PRODUCT_SKU = -1073418135;
pub const SL_E_OPERATION_NOT_ALLOWED = -1073418134;
pub const SL_E_VL_KEY_MANAGEMENT_SERVICE_VM_NOT_SUPPORTED = -1073418133;
pub const SL_E_VL_INVALID_TIMESTAMP = -1073418132;
pub const SL_E_PLUGIN_INVALID_MANIFEST = -1073418127;
pub const SL_E_APPLICATION_POLICIES_MISSING = -1073418126;
pub const SL_E_APPLICATION_POLICIES_NOT_LOADED = -1073418125;
pub const SL_E_VL_BINDING_SERVICE_UNAVAILABLE = -1073418124;
pub const SL_E_SERVICE_STOPPING = -1073418123;
pub const SL_E_PLUGIN_NOT_REGISTERED = -1073418122;
pub const SL_E_AUTHN_WRONG_VERSION = -1073418121;
pub const SL_E_AUTHN_MISMATCHED_KEY = -1073418120;
pub const SL_E_AUTHN_CHALLENGE_NOT_SET = -1073418119;
pub const SL_E_AUTHN_CANT_VERIFY = -1073418118;
pub const SL_E_SERVICE_RUNNING = -1073418117;
pub const SL_E_SLP_INVALID_MARKER_VERSION = -1073418116;
pub const SL_E_INVALID_PRODUCT_KEY_TYPE = -1073418115;
pub const SL_E_CIDIID_MISMATCHED_PKEY = -1073418114;
pub const SL_E_CIDIID_NOT_BOUND = -1073418113;
pub const SL_E_LICENSE_NOT_BOUND = -1073418112;
pub const SL_E_VL_AD_AO_NOT_FOUND = -1073418111;
pub const SL_E_VL_AD_AO_NAME_TOO_LONG = -1073418110;
pub const SL_E_VL_AD_SCHEMA_VERSION_NOT_SUPPORTED = -1073418109;
pub const SL_E_SLP_MSOA_BAD_FORMAT = -1073418096;
pub const SL_E_SLP_MSOA_BAD_DATA_HEADER = -1073418095;
pub const SL_E_SLP_MSOA_INVALID_DATA_LENGTH = -1073418094;
pub const SL_E_SLP_MSOA_INVALID_PRODUCT_KEY = -1073418093;
pub const SL_E_INCOMPLETE_OR_OLD_DISM_BINARIES = -1073418092;
pub const SL_E_SLP_MSOA_PRODUCT_KEY_MISMATCH = -1073418091;
pub const SL_E_NOT_GENUINE = -1073417728;
pub const SL_E_EDITION_MISMATCHED = -1073417712;
pub const SL_E_HWID_CHANGED = -1073417711;
pub const SL_E_OEM_KEY_EDITION_MISMATCH = -1073417710;
pub const SL_E_NO_PRODUCT_KEY_FOUND = -1073417709;
pub const SL_E_DOWNLEVEL_SETUP_KEY = -1073417708;
pub const SL_E_BIOS_KEY = -1073417707;
pub const SL_E_TKA_CHALLENGE_EXPIRED = -1073417471;
pub const SL_E_TKA_SILENT_ACTIVATION_FAILURE = -1073417470;
pub const SL_E_TKA_INVALID_CERT_CHAIN = -1073417469;
pub const SL_E_TKA_GRANT_NOT_FOUND = -1073417468;
pub const SL_E_TKA_CERT_NOT_FOUND = -1073417467;
pub const SL_E_TKA_INVALID_SKU_ID = -1073417466;
pub const SL_E_TKA_INVALID_BLOB = -1073417465;
pub const SL_E_TKA_TAMPERED_CERT_CHAIN = -1073417464;
pub const SL_E_TKA_CHALLENGE_MISMATCH = -1073417463;
pub const SL_E_TKA_INVALID_CERTIFICATE = -1073417462;
pub const SL_E_TKA_INVALID_SMARTCARD = -1073417461;
pub const SL_E_TKA_FAILED_GRANT_PARSING = -1073417460;
pub const SL_E_TKA_INVALID_THUMBPRINT = -1073417459;
pub const SL_E_TKA_THUMBPRINT_CERT_NOT_FOUND = -1073417458;
pub const SL_E_TKA_CRITERIA_MISMATCH = -1073417457;
pub const SL_E_TKA_TPID_MISMATCH = -1073417456;
pub const SL_E_TKA_SOFT_CERT_DISALLOWED = -1073417455;
pub const SL_E_TKA_SOFT_CERT_INVALID = -1073417454;
pub const SL_E_TKA_CERT_CNG_NOT_AVAILABLE = -1073417453;
pub const SL_I_STORE_BASED_ACTIVATION = 1074066433;
pub const E_RM_UNKNOWN_ERROR = -1073415165;
pub const SL_I_TIMEBASED_VALIDITY_PERIOD = 1074068484;
pub const SL_I_PERPETUAL_OOB_GRACE_PERIOD = 1074068485;
pub const SL_I_TIMEBASED_EXTENDED_GRACE_PERIOD = 1074068486;
pub const SL_E_VALIDITY_PERIOD_EXPIRED = -1073415161;
pub const SL_E_IA_THROTTLE_LIMIT_EXCEEDED = -1073414912;
pub const SL_E_IA_INVALID_VIRTUALIZATION_PLATFORM = -1073414911;
pub const SL_E_IA_PARENT_PARTITION_NOT_ACTIVATED = -1073414910;
pub const SL_E_IA_ID_MISMATCH = -1073414909;
pub const SL_E_IA_MACHINE_NOT_BOUND = -1073414908;
pub const SL_E_TAMPER_RECOVERY_REQUIRES_ACTIVATION = -1073414656;
pub const SL_REMAPPING_SP_PUB_GENERAL_NOT_INITIALIZED = -1073426175;
pub const SL_REMAPPING_SP_STATUS_SYSTEM_TIME_SKEWED = -2147167998;
pub const SL_REMAPPING_SP_STATUS_GENERIC_FAILURE = -1073426173;
pub const SL_REMAPPING_SP_STATUS_INVALIDARG = -1073426172;
pub const SL_REMAPPING_SP_STATUS_ALREADY_EXISTS = -1073426171;
pub const SL_REMAPPING_SP_STATUS_INSUFFICIENT_BUFFER = -1073426169;
pub const SL_REMAPPING_SP_STATUS_INVALIDDATA = -1073426168;
pub const SL_REMAPPING_SP_STATUS_INVALID_SPAPI_CALL = -1073426167;
pub const SL_REMAPPING_SP_STATUS_INVALID_SPAPI_VERSION = -1073426166;
pub const SL_REMAPPING_SP_STATUS_DEBUGGER_DETECTED = -2147167989;
pub const SL_REMAPPING_SP_STATUS_NO_MORE_DATA = -1073426164;
pub const SL_REMAPPING_SP_PUB_CRYPTO_INVALID_KEYLENGTH = -1073425919;
pub const SL_REMAPPING_SP_PUB_CRYPTO_INVALID_BLOCKLENGTH = -1073425918;
pub const SL_REMAPPING_SP_PUB_CRYPTO_INVALID_CIPHER = -1073425917;
pub const SL_REMAPPING_SP_PUB_CRYPTO_INVALID_CIPHERMODE = -1073425916;
pub const SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_PROVIDERID = -1073425915;
pub const SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_KEYID = -1073425914;
pub const SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_HASHID = -1073425913;
pub const SL_REMAPPING_SP_PUB_CRYPTO_UNKNOWN_ATTRIBUTEID = -1073425912;
pub const SL_REMAPPING_SP_PUB_CRYPTO_HASH_FINALIZED = -1073425911;
pub const SL_REMAPPING_SP_PUB_CRYPTO_KEY_NOT_AVAILABLE = -1073425910;
pub const SL_REMAPPING_SP_PUB_CRYPTO_KEY_NOT_FOUND = -1073425909;
pub const SL_REMAPPING_SP_PUB_CRYPTO_NOT_BLOCK_ALIGNED = -1073425908;
pub const SL_REMAPPING_SP_PUB_CRYPTO_INVALID_SIGNATURELENGTH = -1073425907;
pub const SL_REMAPPING_SP_PUB_CRYPTO_INVALID_SIGNATURE = -1073425906;
pub const SL_REMAPPING_SP_PUB_CRYPTO_INVALID_BLOCK = -1073425905;
pub const SL_REMAPPING_SP_PUB_CRYPTO_INVALID_FORMAT = -1073425904;
pub const SL_REMAPPING_SP_PUB_CRYPTO_INVALID_PADDING = -1073425903;
pub const SL_REMAPPING_SP_PUB_TS_TAMPERED = -1073425663;
pub const SL_REMAPPING_SP_PUB_TS_REARMED = -1073425662;
pub const SL_REMAPPING_SP_PUB_TS_RECREATED = -1073425661;
pub const SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_NOT_FOUND = -1073425660;
pub const SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_ALREADY_EXISTS = -1073425659;
pub const SL_REMAPPING_SP_PUB_TS_ENTRY_KEY_SIZE_TOO_BIG = -1073425658;
pub const SL_REMAPPING_SP_PUB_TS_MAX_REARM_REACHED = -1073425657;
pub const SL_REMAPPING_SP_PUB_TS_DATA_SIZE_TOO_BIG = -1073425656;
pub const SL_REMAPPING_SP_PUB_TS_INVALID_HW_BINDING = -1073425655;
pub const SL_REMAPPING_SP_PUB_TIMER_ALREADY_EXISTS = -1073425654;
pub const SL_REMAPPING_SP_PUB_TIMER_NOT_FOUND = -1073425653;
pub const SL_REMAPPING_SP_PUB_TIMER_EXPIRED = -1073425652;
pub const SL_REMAPPING_SP_PUB_TIMER_NAME_SIZE_TOO_BIG = -1073425651;
pub const SL_REMAPPING_SP_PUB_TS_FULL = -1073425650;
pub const SL_REMAPPING_SP_PUB_TRUSTED_TIME_OK = 1074057999;
pub const SL_REMAPPING_SP_PUB_TS_ENTRY_READ_ONLY = -1073425648;
pub const SL_REMAPPING_SP_PUB_TIMER_READ_ONLY = -1073425647;
pub const SL_REMAPPING_SP_PUB_TS_ATTRIBUTE_READ_ONLY = -1073425646;
pub const SL_REMAPPING_SP_PUB_TS_ATTRIBUTE_NOT_FOUND = -1073425645;
pub const SL_REMAPPING_SP_PUB_TS_ACCESS_DENIED = -1073425644;
pub const SL_REMAPPING_SP_PUB_TS_NAMESPACE_NOT_FOUND = -1073425643;
pub const SL_REMAPPING_SP_PUB_TS_NAMESPACE_IN_USE = -1073425642;
pub const SL_REMAPPING_SP_PUB_TS_TAMPERED_BREADCRUMB_LOAD_INVALID = -1073425641;
pub const SL_REMAPPING_SP_PUB_TS_TAMPERED_BREADCRUMB_GENERATION = -1073425640;
pub const SL_REMAPPING_SP_PUB_TS_TAMPERED_INVALID_DATA = -1073425639;
pub const SL_REMAPPING_SP_PUB_TS_TAMPERED_NO_DATA = -1073425638;
pub const SL_REMAPPING_SP_PUB_TS_TAMPERED_DATA_BREADCRUMB_MISMATCH = -1073425637;
pub const SL_REMAPPING_SP_PUB_TS_TAMPERED_DATA_VERSION_MISMATCH = -1073425636;
pub const SL_REMAPPING_SP_PUB_TAMPER_MODULE_AUTHENTICATION = -1073425407;
pub const SL_REMAPPING_SP_PUB_TAMPER_SECURITY_PROCESSOR_PATCHED = -1073425406;
pub const SL_REMAPPING_SP_PUB_KM_CACHE_TAMPER = -1073425151;
pub const SL_REMAPPING_SP_PUB_KM_CACHE_TAMPER_RESTORE_FAILED = -1073425150;
pub const SL_REMAPPING_SP_PUB_KM_CACHE_IDENTICAL = 1074058753;
pub const SL_REMAPPING_SP_PUB_KM_CACHE_POLICY_CHANGED = 1074058754;
pub const SL_REMAPPING_SP_STATUS_PUSHKEY_CONFLICT = -1073424639;
pub const SL_REMAPPING_SP_PUB_PROXY_SOFT_TAMPER = -1073424638;
pub const SL_REMAPPING_SP_PUB_API_INVALID_LICENSE = -1073426432;
pub const SL_REMAPPING_SP_PUB_API_INVALID_ALGORITHM_TYPE = -1073426423;
pub const SL_REMAPPING_SP_PUB_API_TOO_MANY_LOADED_ENVIRONMENTS = -1073426420;
pub const SL_REMAPPING_SP_PUB_API_BAD_GET_INFO_QUERY = -1073426414;
pub const SL_REMAPPING_SP_PUB_API_INVALID_HANDLE = -1073426388;
pub const SL_REMAPPING_SP_PUB_API_INVALID_KEY_LENGTH = -1073426347;
pub const SL_REMAPPING_SP_PUB_API_NO_AES_PROVIDER = -1073426317;
pub const SL_REMAPPING_SP_PUB_API_HANDLE_NOT_COMMITED = -1073426303;
pub const SL_REMAPPING_MDOLLAR_PRODUCT_KEY_OUT_OF_RANGE = -2143313819;
pub const SL_REMAPPING_MDOLLAR_INVALID_BINDING = -2143313818;
pub const SL_REMAPPING_MDOLLAR_PRODUCT_KEY_BLOCKED = -2143313817;
pub const SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY = -2143313816;
pub const SL_REMAPPING_MDOLLAR_UNSUPPORTED_PRODUCT_KEY = -2143313812;
pub const SL_REMAPPING_MDOLLAR_MAXIMUM_UNLOCK_EXCEEDED = -2143313807;
pub const SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_DATA_ID = -2143313805;
pub const SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_DATA = -2143313804;
pub const SL_REMAPPING_MDOLLAR_INVALID_ACTCONFIG_ID = -2143313802;
pub const SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY_LENGTH = -2143313801;
pub const SL_REMAPPING_MDOLLAR_INVALID_PRODUCT_KEY_FORMAT = -2143313800;
pub const SL_REMAPPING_MDOLLAR_INVALID_BINDING_URI = -2143313798;
pub const SL_REMAPPING_MDOLLAR_INVALID_ARGUMENT = -2143313795;
pub const SL_REMAPPING_MDOLLAR_DMAK_LIMIT_EXCEEDED = -2143313793;
pub const SL_REMAPPING_MDOLLAR_DMAK_EXTENSION_LIMIT_EXCEEDED = -2143313792;
pub const SL_REMAPPING_MDOLLAR_OEM_SLP_COA0 = -2143313789;
pub const SL_REMAPPING_MDOLLAR_CIDIID_INVALID_VERSION = -2143313779;
pub const SL_REMAPPING_MDOLLAR_CIDIID_INVALID_DATA = -2143313778;
pub const SL_REMAPPING_MDOLLAR_CIDIID_INVALID_DATA_LENGTH = -2143313777;
pub const SL_REMAPPING_MDOLLAR_CIDIID_INVALID_CHECK_DIGITS = -2143313776;
pub const SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_BEFORE_START_DATE = -2143313769;
pub const SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_AFTER_END_DATE = -2143313768;
pub const SL_REMAPPING_MDOLLAR_TIMEBASED_ACTIVATION_NOT_AVAILABLE = -2143313767;
pub const SL_REMAPPING_MDOLLAR_TIMEBASED_PRODUCT_KEY_NOT_CONFIGURED = -2143313766;
pub const SL_REMAPPING_MDOLLAR_NO_RULES_TO_ACTIVATE = -2143313720;
pub const SL_REMAPPING_MDOLLAR_PRODUCT_KEY_BLOCKED_IPLOCATION = -2143313717;
pub const SL_REMAPPING_MDOLLAR_DIGITALMARKER_INVALID_BINDING = -2143313709;
pub const SL_REMAPPING_MDOLLAR_DIGITALMARKER_BINDING_NOT_CONFIGURED = -2143313708;
pub const SL_REMAPPING_MDOLLAR_ROT_OVERRIDE_LIMIT_REACHED = -2143313707;
pub const SL_REMAPPING_MDOLLAR_DMAK_OVERRIDE_LIMIT_REACHED = -2143313706;
pub const SL_REMAPPING_MDOLLAR_FREE_OFFER_EXPIRED = -2143312896;
pub const SL_REMAPPING_MDOLLAR_OSR_DONOR_HWID_NO_ENTITLEMENT = -2143310920;
pub const SL_REMAPPING_MDOLLAR_OSR_GENERIC_ERROR = -2143310919;
pub const SL_REMAPPING_MDOLLAR_OSR_NO_ASSOCIATION = -2143310918;
pub const SL_REMAPPING_MDOLLAR_OSR_NOT_ADMIN = -2143310917;
pub const SL_REMAPPING_MDOLLAR_OSR_USER_THROTTLED = -2143310916;
pub const SL_REMAPPING_MDOLLAR_OSR_LICENSE_THROTTLED = -2143310915;
pub const SL_REMAPPING_MDOLLAR_OSR_DEVICE_THROTTLED = -2143310914;
pub const SL_REMAPPING_MDOLLAR_OSR_GP_DISABLED = -2143310913;
pub const SL_REMAPPING_MDOLLAR_OSR_HARDWARE_BLOCKED = -2143310912;
pub const SL_REMAPPING_MDOLLAR_OSR_USER_BLOCKED = -2143310911;
pub const SL_REMAPPING_MDOLLAR_OSR_LICENSE_BLOCKED = -2143310910;
pub const SL_REMAPPING_MDOLLAR_OSR_DEVICE_BLOCKED = -2143310909;
pub const SECPKG_ATTR_C_ACCESS_TOKEN = 2147483666;
pub const SECPKG_ATTR_C_FULL_ACCESS_TOKEN = 2147483778;
pub const SECPKG_ATTR_CERT_TRUST_STATUS = 2147483780;
pub const SECPKG_ATTR_CREDS = 2147483776;
pub const SECPKG_ATTR_CREDS_2 = 2147483782;
pub const SECPKG_ATTR_NEGOTIATION_PACKAGE = 2147483777;
pub const SECPKG_ATTR_PACKAGE_INFO = 10;
pub const SECPKG_ATTR_SERVER_AUTH_FLAGS = 2147483779;
pub const SECPKG_ATTR_SIZES = 0;
pub const SECPKG_ATTR_SUBJECT_SECURITY_ATTRIBUTES = 124;
pub const SECPKG_ATTR_APP_DATA = 94;
pub const SECPKG_ATTR_EAP_PRF_INFO = 101;
pub const SECPKG_ATTR_EARLY_START = 105;
pub const SECPKG_ATTR_DTLS_MTU = 34;
pub const SECPKG_ATTR_KEYING_MATERIAL_INFO = 106;
pub const SECPKG_ATTR_ACCESS_TOKEN = 18;
pub const SECPKG_ATTR_AUTHORITY = 6;
pub const SECPKG_ATTR_CLIENT_SPECIFIED_TARGET = 27;
pub const SECPKG_ATTR_CONNECTION_INFO = 90;
pub const SECPKG_ATTR_DCE_INFO = 3;
pub const SECPKG_ATTR_ENDPOINT_BINDINGS = 26;
pub const SECPKG_ATTR_EAP_KEY_BLOCK = 91;
pub const SECPKG_ATTR_FLAGS = 14;
pub const SECPKG_ATTR_ISSUER_LIST_EX = 89;
pub const SECPKG_ATTR_KEY_INFO = 5;
pub const SECPKG_ATTR_LAST_CLIENT_TOKEN_STATUS = 30;
pub const SECPKG_ATTR_LIFESPAN = 2;
pub const SECPKG_ATTR_LOCAL_CERT_CONTEXT = 84;
pub const SECPKG_ATTR_LOCAL_CRED = 82;
pub const SECPKG_ATTR_NAMES = 1;
pub const SECPKG_ATTR_NATIVE_NAMES = 13;
pub const SECPKG_ATTR_NEGOTIATION_INFO = 12;
pub const SECPKG_ATTR_PASSWORD_EXPIRY = 8;
pub const SECPKG_ATTR_REMOTE_CERT_CONTEXT = 83;
pub const SECPKG_ATTR_ROOT_STORE = 85;
pub const SECPKG_ATTR_SESSION_KEY = 9;
pub const SECPKG_ATTR_SESSION_INFO = 93;
pub const SECPKG_ATTR_STREAM_SIZES = 4;
pub const SECPKG_ATTR_SUPPORTED_SIGNATURES = 102;
pub const SECPKG_ATTR_TARGET_INFORMATION = 17;
pub const SECPKG_ATTR_UNIQUE_BINDINGS = 25;
pub const MSV1_0_PASSTHRU = 1;
pub const MSV1_0_GUEST_LOGON = 2;
pub const SECPKG_CRED_INBOUND = 1;
pub const SECPKG_CRED_OUTBOUND = 2;
pub const LOGON_GUEST = 1;
pub const LOGON_NOENCRYPTION = 2;
pub const LOGON_CACHED_ACCOUNT = 4;
pub const LOGON_USED_LM_PASSWORD = 8;
pub const LOGON_EXTRA_SIDS = 32;
pub const LOGON_SUBAUTH_SESSION_KEY = 64;
pub const LOGON_SERVER_TRUST_ACCOUNT = 128;
pub const LOGON_PROFILE_PATH_RETURNED = 1024;
pub const LOGON_RESOURCE_GROUPS = 512;
pub const SECPKG_CONTEXT_EXPORT_RESET_NEW = 1;
pub const SECPKG_CONTEXT_EXPORT_DELETE_OLD = 2;
pub const SECPKG_CONTEXT_EXPORT_TO_KERNEL = 4;
pub const KERB_TICKET_FLAGS_forwardable = 1073741824;
pub const KERB_TICKET_FLAGS_forwarded = 536870912;
pub const KERB_TICKET_FLAGS_hw_authent = 1048576;
pub const KERB_TICKET_FLAGS_initial = 4194304;
pub const KERB_TICKET_FLAGS_invalid = 16777216;
pub const KERB_TICKET_FLAGS_may_postdate = 67108864;
pub const KERB_TICKET_FLAGS_ok_as_delegate = 262144;
pub const KERB_TICKET_FLAGS_postdated = 33554432;
pub const KERB_TICKET_FLAGS_pre_authent = 2097152;
pub const KERB_TICKET_FLAGS_proxiable = 268435456;
pub const KERB_TICKET_FLAGS_proxy = 134217728;
pub const KERB_TICKET_FLAGS_renewable = 8388608;
pub const KERB_TICKET_FLAGS_reserved = 2147483648;
pub const KERB_TICKET_FLAGS_reserved1 = 1;
pub const DS_INET_ADDRESS = 1;
pub const DS_NETBIOS_ADDRESS = 2;
pub const SCH_CRED_AUTO_CRED_VALIDATION = 32;
pub const SCH_CRED_CACHE_ONLY_URL_RETRIEVAL_ON_CREATE = 131072;
pub const SCH_DISABLE_RECONNECTS = 128;
pub const SCH_CRED_IGNORE_NO_REVOCATION_CHECK = 2048;
pub const SCH_CRED_IGNORE_REVOCATION_OFFLINE = 4096;
pub const SCH_CRED_MANUAL_CRED_VALIDATION = 8;
pub const SCH_CRED_NO_DEFAULT_CREDS = 16;
pub const SCH_CRED_NO_SERVERNAME_CHECK = 4;
pub const SCH_CRED_NO_SYSTEM_MAPPER = 2;
pub const SCH_CRED_REVOCATION_CHECK_CHAIN = 512;
pub const SCH_CRED_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 1024;
pub const SCH_CRED_REVOCATION_CHECK_END_CERT = 256;
pub const SCH_CRED_USE_DEFAULT_CREDS = 64;
pub const SCH_SEND_AUX_RECORD = 2097152;
pub const SCH_SEND_ROOT_CERT = 262144;
pub const SCH_USE_STRONG_CRYPTO = 4194304;
pub const SCH_USE_PRESHAREDKEY_ONLY = 8388608;
pub const DOMAIN_PASSWORD_COMPLEX = 1;
pub const DOMAIN_PASSWORD_NO_ANON_CHANGE = 2;
pub const DOMAIN_PASSWORD_NO_CLEAR_CHANGE = 4;
pub const DOMAIN_LOCKOUT_ADMINS = 8;
pub const DOMAIN_PASSWORD_STORE_CLEARTEXT = 16;
pub const DOMAIN_REFUSE_PASSWORD_CHANGE = 32;
pub const TLS1_ALERT_WARNING = 1;
pub const TLS1_ALERT_FATAL = 2;
pub const TRUST_TYPE_DOWNLEVEL = 1;
pub const TRUST_TYPE_UPLEVEL = 2;
pub const TRUST_TYPE_MIT = 3;
pub const TRUST_TYPE_DCE = 4;
pub const MSV1_0_CLEARTEXT_PASSWORD_ALLOWED = 2;
pub const MSV1_0_UPDATE_LOGON_STATISTICS = 4;
pub const MSV1_0_RETURN_USER_PARAMETERS = 8;
pub const MSV1_0_DONT_TRY_GUEST_ACCOUNT = 16;
pub const MSV1_0_ALLOW_SERVER_TRUST_ACCOUNT = 32;
pub const MSV1_0_RETURN_PASSWORD_EXPIRY = 64;
pub const MSV1_0_ALLOW_WORKSTATION_TRUST_ACCOUNT = 2048;
pub const MSV1_0_TRY_GUEST_ACCOUNT_ONLY = 256;
pub const MSV1_0_RETURN_PROFILE_PATH = 512;
pub const MSV1_0_TRY_SPECIFIED_DOMAIN_ONLY = 1024;
pub const KERB_REQUEST_ADD_CREDENTIAL = 1;
pub const KERB_REQUEST_REPLACE_CREDENTIAL = 2;
pub const KERB_REQUEST_REMOVE_CREDENTIAL = 4;
pub const TRUST_DIRECTION_DISABLED = 0;
pub const TRUST_DIRECTION_INBOUND = 1;
pub const TRUST_DIRECTION_OUTBOUND = 2;
pub const TRUST_DIRECTION_BIDIRECTIONAL = 3;
pub const MSV1_0_CRED_LM_PRESENT = 1;
pub const MSV1_0_CRED_NT_PRESENT = 2;
pub const MSV1_0_CRED_VERSION = 0;
pub const SECPKG_OPTIONS_TYPE_UNKNOWN = 0;
pub const SECPKG_OPTIONS_TYPE_LSA = 1;
pub const SECPKG_OPTIONS_TYPE_SSPI = 2;
pub const SSL_SESSION_ENABLE_RECONNECTS = 1;
pub const SSL_SESSION_DISABLE_RECONNECTS = 2;
pub const KERB_ETYPE_DES_CBC_CRC = 1;
pub const KERB_ETYPE_DES_CBC_MD4 = 2;
pub const KERB_ETYPE_DES_CBC_MD5 = 3;
pub const KERB_ETYPE_NULL = 0;
pub const KERB_ETYPE_RC4_HMAC_NT = 23;
pub const KERB_ETYPE_RC4_MD4 = -128;
pub const TRUST_AUTH_TYPE_NONE = 0;
pub const TRUST_AUTH_TYPE_NT4OWF = 1;
pub const TRUST_AUTH_TYPE_CLEAR = 2;
pub const TRUST_AUTH_TYPE_VERSION = 3;
pub const SECPKG_PACKAGE_CHANGE_LOAD = 0;
pub const SECPKG_PACKAGE_CHANGE_UNLOAD = 1;
pub const SECPKG_PACKAGE_CHANGE_SELECT = 2;
pub const TRUST_ATTRIBUTE_NON_TRANSITIVE = 1;
pub const TRUST_ATTRIBUTE_UPLEVEL_ONLY = 2;
pub const TRUST_ATTRIBUTE_FILTER_SIDS = 4;
pub const TRUST_ATTRIBUTE_FOREST_TRANSITIVE = 8;
pub const TRUST_ATTRIBUTE_CROSS_ORGANIZATION = 16;
pub const TRUST_ATTRIBUTE_TREAT_AS_EXTERNAL = 64;
pub const TRUST_ATTRIBUTE_WITHIN_FOREST = 32;
pub const ISC_REQ_MESSAGES = 4294967296;
pub const ISC_REQ_DEFERRED_CRED_VALIDATION = 8589934592;
pub const ISC_REQ_NO_POST_HANDSHAKE_AUTH = 17179869184;
pub const ISC_REQ_REUSE_SESSION_TICKETS = 34359738368;
pub const ISC_REQ_EXPLICIT_SESSION = 68719476736;
pub const ISC_REQ_DELEGATE = 1;
pub const ISC_REQ_MUTUAL_AUTH = 2;
pub const ISC_REQ_REPLAY_DETECT = 4;
pub const ISC_REQ_SEQUENCE_DETECT = 8;
pub const ISC_REQ_CONFIDENTIALITY = 16;
pub const ISC_REQ_USE_SESSION_KEY = 32;
pub const ISC_REQ_PROMPT_FOR_CREDS = 64;
pub const ISC_REQ_USE_SUPPLIED_CREDS = 128;
pub const ISC_REQ_ALLOCATE_MEMORY = 256;
pub const ISC_REQ_USE_DCE_STYLE = 512;
pub const ISC_REQ_DATAGRAM = 1024;
pub const ISC_REQ_CONNECTION = 2048;
pub const ISC_REQ_CALL_LEVEL = 4096;
pub const ISC_REQ_FRAGMENT_SUPPLIED = 8192;
pub const ISC_REQ_EXTENDED_ERROR = 16384;
pub const ISC_REQ_STREAM = 32768;
pub const ISC_REQ_INTEGRITY = 65536;
pub const ISC_REQ_IDENTIFY = 131072;
pub const ISC_REQ_NULL_SESSION = 262144;
pub const ISC_REQ_MANUAL_CRED_VALIDATION = 524288;
pub const ISC_REQ_RESERVED1 = 1048576;
pub const ISC_REQ_FRAGMENT_TO_FIT = 2097152;
pub const ISC_REQ_FORWARD_CREDENTIALS = 4194304;
pub const ISC_REQ_NO_INTEGRITY = 8388608;
pub const ISC_REQ_USE_HTTP_STYLE = 16777216;
pub const ISC_REQ_UNVERIFIED_TARGET_NAME = 536870912;
pub const ISC_REQ_CONFIDENTIALITY_ONLY = 1073741824;
pub const ASC_REQ_MESSAGES = 4294967296;
pub const ASC_REQ_EXPLICIT_SESSION = 68719476736;
pub const ASC_REQ_DELEGATE = 1;
pub const ASC_REQ_MUTUAL_AUTH = 2;
pub const ASC_REQ_REPLAY_DETECT = 4;
pub const ASC_REQ_SEQUENCE_DETECT = 8;
pub const ASC_REQ_CONFIDENTIALITY = 16;
pub const ASC_REQ_USE_SESSION_KEY = 32;
pub const ASC_REQ_SESSION_TICKET = 64;
pub const ASC_REQ_ALLOCATE_MEMORY = 256;
pub const ASC_REQ_USE_DCE_STYLE = 512;
pub const ASC_REQ_DATAGRAM = 1024;
pub const ASC_REQ_CONNECTION = 2048;
pub const ASC_REQ_CALL_LEVEL = 4096;
pub const ASC_REQ_FRAGMENT_SUPPLIED = 8192;
pub const ASC_REQ_EXTENDED_ERROR = 32768;
pub const ASC_REQ_STREAM = 65536;
pub const ASC_REQ_INTEGRITY = 131072;
pub const ASC_REQ_LICENSING = 262144;
pub const ASC_REQ_IDENTIFY = 524288;
pub const ASC_REQ_ALLOW_NULL_SESSION = 1048576;
pub const ASC_REQ_ALLOW_NON_USER_LOGONS = 2097152;
pub const ASC_REQ_ALLOW_CONTEXT_REPLAY = 4194304;
pub const ASC_REQ_FRAGMENT_TO_FIT = 8388608;
pub const ASC_REQ_NO_TOKEN = 16777216;
pub const ASC_REQ_PROXY_BINDINGS = 67108864;
pub const ASC_REQ_ALLOW_MISSING_BINDINGS = 268435456;
pub const AccountDomainInformation = 5;
pub const DnsDomainInformation = 12;
pub const UndefinedLogonType = 0;
pub const Interactive = 2;
pub const Network = 3;
pub const Batch = 4;
pub const Service = 5;
pub const Proxy = 6;
pub const Unlock = 7;
pub const NetworkCleartext = 8;
pub const NewCredentials = 9;
pub const RemoteInteractive = 10;
pub const CachedInteractive = 11;
pub const CachedRemoteInteractive = 12;
pub const CachedUnlock = 13;
pub const SeAdtParmTypeNone = 0;
pub const SeAdtParmTypeString = 1;
pub const SeAdtParmTypeFileSpec = 2;
pub const SeAdtParmTypeUlong = 3;
pub const SeAdtParmTypeSid = 4;
pub const SeAdtParmTypeLogonId = 5;
pub const SeAdtParmTypeNoLogonId = 6;
pub const SeAdtParmTypeAccessMask = 7;
pub const SeAdtParmTypePrivs = 8;
pub const SeAdtParmTypeObjectTypes = 9;
pub const SeAdtParmTypeHexUlong = 10;
pub const SeAdtParmTypePtr = 11;
pub const SeAdtParmTypeTime = 12;
pub const SeAdtParmTypeGuid = 13;
pub const SeAdtParmTypeLuid = 14;
pub const SeAdtParmTypeHexInt64 = 15;
pub const SeAdtParmTypeStringList = 16;
pub const SeAdtParmTypeSidList = 17;
pub const SeAdtParmTypeDuration = 18;
pub const SeAdtParmTypeUserAccountControl = 19;
pub const SeAdtParmTypeNoUac = 20;
pub const SeAdtParmTypeMessage = 21;
pub const SeAdtParmTypeDateTime = 22;
pub const SeAdtParmTypeSockAddr = 23;
pub const SeAdtParmTypeSD = 24;
pub const SeAdtParmTypeLogonHours = 25;
pub const SeAdtParmTypeLogonIdNoSid = 26;
pub const SeAdtParmTypeUlongNoConv = 27;
pub const SeAdtParmTypeSockAddrNoPort = 28;
pub const SeAdtParmTypeAccessReason = 29;
pub const SeAdtParmTypeStagingReason = 30;
pub const SeAdtParmTypeResourceAttribute = 31;
pub const SeAdtParmTypeClaims = 32;
pub const SeAdtParmTypeLogonIdAsSid = 33;
pub const SeAdtParmTypeMultiSzString = 34;
pub const SeAdtParmTypeLogonIdEx = 35;
pub const AuditCategorySystem = 0;
pub const AuditCategoryLogon = 1;
pub const AuditCategoryObjectAccess = 2;
pub const AuditCategoryPrivilegeUse = 3;
pub const AuditCategoryDetailedTracking = 4;
pub const AuditCategoryPolicyChange = 5;
pub const AuditCategoryAccountManagement = 6;
pub const AuditCategoryDirectoryServiceAccess = 7;
pub const AuditCategoryAccountLogon = 8;
pub const PolicyServerRoleBackup = 2;
pub const PolicyServerRolePrimary = 3;
pub const PolicyAuditLogInformation = 1;
pub const PolicyAuditEventsInformation = 2;
pub const PolicyPrimaryDomainInformation = 3;
pub const PolicyPdAccountInformation = 4;
pub const PolicyAccountDomainInformation = 5;
pub const PolicyLsaServerRoleInformation = 6;
pub const PolicyReplicaSourceInformation = 7;
pub const PolicyDefaultQuotaInformation = 8;
pub const PolicyModificationInformation = 9;
pub const PolicyAuditFullSetInformation = 10;
pub const PolicyAuditFullQueryInformation = 11;
pub const PolicyDnsDomainInformation = 12;
pub const PolicyDnsDomainInformationInt = 13;
pub const PolicyLocalAccountDomainInformation = 14;
pub const PolicyMachineAccountInformation = 15;
pub const PolicyMachineAccountInformation2 = 16;
pub const PolicyLastEntry = 17;
pub const PolicyDomainEfsInformation = 2;
pub const PolicyDomainKerberosTicketInformation = 3;
pub const PolicyNotifyAuditEventsInformation = 1;
pub const PolicyNotifyAccountDomainInformation = 2;
pub const PolicyNotifyServerRoleInformation = 3;
pub const PolicyNotifyDnsDomainInformation = 4;
pub const PolicyNotifyDomainEfsInformation = 5;
pub const PolicyNotifyDomainKerberosTicketInformation = 6;
pub const PolicyNotifyMachineAccountPasswordInformation = 7;
pub const PolicyNotifyGlobalSaclInformation = 8;
pub const PolicyNotifyMax = 9;
pub const TrustedDomainNameInformation = 1;
pub const TrustedControllersInformation = 2;
pub const TrustedPosixOffsetInformation = 3;
pub const TrustedPasswordInformation = 4;
pub const TrustedDomainInformationBasic = 5;
pub const TrustedDomainInformationEx = 6;
pub const TrustedDomainAuthInformation = 7;
pub const TrustedDomainFullInformation = 8;
pub const TrustedDomainAuthInformationInternal = 9;
pub const TrustedDomainFullInformationInternal = 10;
pub const TrustedDomainInformationEx2Internal = 11;
pub const TrustedDomainFullInformation2Internal = 12;
pub const TrustedDomainSupportedEncryptionTypes = 13;
pub const TrustedDomainAuthInformationInternalAes = 14;
pub const TrustedDomainFullInformationInternalAes = 15;
pub const ForestTrustTopLevelName = 0;
pub const ForestTrustTopLevelNameEx = 1;
pub const ForestTrustDomainInfo = 2;
pub const ForestTrustBinaryInfo = 3;
pub const ForestTrustScannerInfo = 4;
pub const ForestTrustRecordTypeLast = 4;
pub const CollisionTdo = 0;
pub const CollisionXref = 1;
pub const CollisionOther = 2;
pub const NegEnumPackagePrefixes = 0;
pub const NegGetCallerName = 1;
pub const NegTransferCredentials = 2;
pub const NegMsgReserved1 = 3;
pub const NegCallPackageMax = 4;
pub const MsV1_0InteractiveLogon = 2;
pub const MsV1_0Lm20Logon = 3;
pub const MsV1_0NetworkLogon = 4;
pub const MsV1_0SubAuthLogon = 5;
pub const MsV1_0WorkstationUnlockLogon = 7;
pub const MsV1_0S4ULogon = 12;
pub const MsV1_0VirtualLogon = 82;
pub const MsV1_0NoElevationLogon = 83;
pub const MsV1_0LuidLogon = 84;
pub const MsV1_0InteractiveProfile = 2;
pub const MsV1_0Lm20LogonProfile = 3;
pub const MsV1_0SmartCardProfile = 4;
pub const InvalidCredKey = 0;
pub const DeprecatedIUMCredKey = 1;
pub const DomainUserCredKey = 2;
pub const LocalUserCredKey = 3;
pub const ExternallySuppliedCredKey = 4;
pub const MsvAvEOL = 0;
pub const MsvAvNbComputerName = 1;
pub const MsvAvNbDomainName = 2;
pub const MsvAvDnsComputerName = 3;
pub const MsvAvDnsDomainName = 4;
pub const MsvAvDnsTreeName = 5;
pub const MsvAvFlags = 6;
pub const MsvAvTimestamp = 7;
pub const MsvAvRestrictions = 8;
pub const MsvAvTargetName = 9;
pub const MsvAvChannelBindings = 10;
pub const MsV1_0Lm20ChallengeRequest = 0;
pub const MsV1_0Lm20GetChallengeResponse = 1;
pub const MsV1_0EnumerateUsers = 2;
pub const MsV1_0GetUserInfo = 3;
pub const MsV1_0ReLogonUsers = 4;
pub const MsV1_0ChangePassword = 5;
pub const MsV1_0ChangeCachedPassword = 6;
pub const MsV1_0GenericPassthrough = 7;
pub const MsV1_0CacheLogon = 8;
pub const MsV1_0SubAuth = 9;
pub const MsV1_0DeriveCredential = 10;
pub const MsV1_0CacheLookup = 11;
pub const MsV1_0SetProcessOption = 12;
pub const MsV1_0ConfigLocalAliases = 13;
pub const MsV1_0ClearCachedCredentials = 14;
pub const MsV1_0LookupToken = 15;
pub const MsV1_0ValidateAuth = 16;
pub const MsV1_0CacheLookupEx = 17;
pub const MsV1_0GetCredentialKey = 18;
pub const MsV1_0SetThreadOption = 19;
pub const MsV1_0DecryptDpapiMasterKey = 20;
pub const MsV1_0GetStrongCredentialKey = 21;
pub const MsV1_0TransferCred = 22;
pub const MsV1_0ProvisionTbal = 23;
pub const MsV1_0DeleteTbalSecrets = 24;
pub const KerbInteractiveLogon = 2;
pub const KerbSmartCardLogon = 6;
pub const KerbWorkstationUnlockLogon = 7;
pub const KerbSmartCardUnlockLogon = 8;
pub const KerbProxyLogon = 9;
pub const KerbTicketLogon = 10;
pub const KerbTicketUnlockLogon = 11;
pub const KerbS4ULogon = 12;
pub const KerbCertificateLogon = 13;
pub const KerbCertificateS4ULogon = 14;
pub const KerbCertificateUnlockLogon = 15;
pub const KerbNoElevationLogon = 83;
pub const KerbLuidLogon = 84;
pub const KerbInteractiveProfile = 2;
pub const KerbSmartCardProfile = 4;
pub const KerbTicketProfile = 6;
pub const KerbDebugRequestMessage = 0;
pub const KerbQueryTicketCacheMessage = 1;
pub const KerbChangeMachinePasswordMessage = 2;
pub const KerbVerifyPacMessage = 3;
pub const KerbRetrieveTicketMessage = 4;
pub const KerbUpdateAddressesMessage = 5;
pub const KerbPurgeTicketCacheMessage = 6;
pub const KerbChangePasswordMessage = 7;
pub const KerbRetrieveEncodedTicketMessage = 8;
pub const KerbDecryptDataMessage = 9;
pub const KerbAddBindingCacheEntryMessage = 10;
pub const KerbSetPasswordMessage = 11;
pub const KerbSetPasswordExMessage = 12;
pub const KerbVerifyCredentialsMessage = 13;
pub const KerbQueryTicketCacheExMessage = 14;
pub const KerbPurgeTicketCacheExMessage = 15;
pub const KerbRefreshSmartcardCredentialsMessage = 16;
pub const KerbAddExtraCredentialsMessage = 17;
pub const KerbQuerySupplementalCredentialsMessage = 18;
pub const KerbTransferCredentialsMessage = 19;
pub const KerbQueryTicketCacheEx2Message = 20;
pub const KerbSubmitTicketMessage = 21;
pub const KerbAddExtraCredentialsExMessage = 22;
pub const KerbQueryKdcProxyCacheMessage = 23;
pub const KerbPurgeKdcProxyCacheMessage = 24;
pub const KerbQueryTicketCacheEx3Message = 25;
pub const KerbCleanupMachinePkinitCredsMessage = 26;
pub const KerbAddBindingCacheEntryExMessage = 27;
pub const KerbQueryBindingCacheMessage = 28;
pub const KerbPurgeBindingCacheMessage = 29;
pub const KerbPinKdcMessage = 30;
pub const KerbUnpinAllKdcsMessage = 31;
pub const KerbQueryDomainExtendedPoliciesMessage = 32;
pub const KerbQueryS4U2ProxyCacheMessage = 33;
pub const KerbRetrieveKeyTabMessage = 34;
pub const KerbRefreshPolicyMessage = 35;
pub const KerbPrintCloudKerberosDebugMessage = 36;
pub const KerbNetworkTicketLogonMessage = 37;
pub const KerbNlChangeMachinePasswordMessage = 38;
pub const CertHashInfo = 1;
pub const Pku2uCertificateS4ULogon = 14;
pub const SecApplicationProtocolNegotiationExt_None = 0;
pub const SecApplicationProtocolNegotiationExt_NPN = 1;
pub const SecApplicationProtocolNegotiationExt_ALPN = 2;
pub const SecTrafficSecret_None = 0;
pub const SecTrafficSecret_Client = 1;
pub const SecTrafficSecret_Server = 2;
pub const SecPkgCredClass_None = 0;
pub const SecPkgCredClass_Ephemeral = 10;
pub const SecPkgCredClass_PersistedGeneric = 20;
pub const SecPkgCredClass_PersistedSpecific = 30;
pub const SecPkgCredClass_Explicit = 40;
pub const SecPkgAttrLastClientTokenYes = 0;
pub const SecPkgAttrLastClientTokenNo = 1;
pub const SecPkgAttrLastClientTokenMaybe = 2;
pub const SecApplicationProtocolNegotiationStatus_None = 0;
pub const SecApplicationProtocolNegotiationStatus_Success = 1;
pub const SecApplicationProtocolNegotiationStatus_SelectedClientOnly = 2;
pub const SecFull = 0;
pub const SecService = 1;
pub const SecTree = 2;
pub const SecDirectory = 3;
pub const SecObject = 4;
pub const Sasl_AuthZIDForbidden = 0;
pub const Sasl_AuthZIDProcessed = 1;
pub const LsaTokenInformationNull = 0;
pub const LsaTokenInformationV1 = 1;
pub const LsaTokenInformationV2 = 2;
pub const LsaTokenInformationV3 = 3;
pub const SecpkgFailureReason_Unknown = 0;
pub const SecpkgFailureReason_NoFailure = 1;
pub const SecpkgFailureReason_LocalAccount = 2;
pub const SecpkgFailureReason_DomainAccount = 3;
pub const SecpkgFailureReason_CloudAccount = 4;
pub const SecpkgFailureReason_NullTarget = 5;
pub const SecpkgFailureReason_UnknownTarget = 6;
pub const SecpkgFailureReason_IpAddress = 7;
pub const SecpkgFailureReason_DupTarget = 8;
pub const SecpkgFailureReason_NoLineOfSight = 9;
pub const SecpkgFailureReason_Loopback = 10;
pub const SecpkgFailureReason_NullSession = 11;
pub const SecpkgGssInfo = 1;
pub const SecpkgContextThunks = 2;
pub const SecpkgMutualAuthLevel = 3;
pub const SecpkgWowClientDll = 4;
pub const SecpkgExtraOids = 5;
pub const SecpkgMaxInfo = 6;
pub const SecpkgNego2Info = 7;
pub const SecPkgCallPackageMinMessage = 1024;
pub const SecPkgCallPackagePinDcMessage = 1024;
pub const SecPkgCallPackageUnpinAllDcsMessage = 1025;
pub const SecPkgCallPackageTransferCredMessage = 1026;
pub const SecPkgCallPackageMaxMessage = 1026;
pub const SecSessionPrimaryCred = 0;
pub const SecNameSamCompatible = 0;
pub const SecNameAlternateId = 1;
pub const SecNameFlat = 2;
pub const SecNameDN = 3;
pub const SecNameSPN = 4;
pub const CredFetchDefault = 0;
pub const CredFetchDPAPI = 1;
pub const CredFetchForced = 2;
pub const KSecPaged = 0;
pub const KSecNonPaged = 1;
pub const TlsSignatureAlgorithm_Anonymous = 0;
pub const TlsSignatureAlgorithm_Rsa = 1;
pub const TlsSignatureAlgorithm_Dsa = 2;
pub const TlsSignatureAlgorithm_Ecdsa = 3;
pub const TlsHashAlgorithm_None = 0;
pub const TlsHashAlgorithm_Md5 = 1;
pub const TlsHashAlgorithm_Sha1 = 2;
pub const TlsHashAlgorithm_Sha224 = 3;
pub const TlsHashAlgorithm_Sha256 = 4;
pub const TlsHashAlgorithm_Sha384 = 5;
pub const TlsHashAlgorithm_Sha512 = 6;
pub const TlsParametersCngAlgUsageKeyExchange = 0;
pub const TlsParametersCngAlgUsageSignature = 1;
pub const TlsParametersCngAlgUsageCipher = 2;
pub const TlsParametersCngAlgUsageDigest = 3;
pub const TlsParametersCngAlgUsageCertSig = 4;
pub const SCH_EXTENSIONS_OPTIONS_NONE = 0;
pub const SCH_NO_RECORD_HEADER = 1;
pub const NetlogonInteractiveInformation = 1;
pub const NetlogonNetworkInformation = 2;
pub const NetlogonServiceInformation = 3;
pub const NetlogonGenericInformation = 4;
pub const NetlogonInteractiveTransitiveInformation = 5;
pub const NetlogonNetworkTransitiveInformation = 6;
pub const NetlogonServiceTransitiveInformation = 7;
pub const NetlogonTicketLogonInformation = 8;
pub const TOKENBINDING_TYPE_PROVIDED = 0;
pub const TOKENBINDING_TYPE_REFERRED = 1;
pub const TOKENBINDING_EXTENSION_FORMAT_UNDEFINED = 0;
pub const TOKENBINDING_KEY_PARAMETERS_TYPE_RSA2048_PKCS = 0;
pub const TOKENBINDING_KEY_PARAMETERS_TYPE_RSA2048_PSS = 1;
pub const TOKENBINDING_KEY_PARAMETERS_TYPE_ECDSAP256 = 2;
pub const TOKENBINDING_KEY_PARAMETERS_TYPE_ANYEXISTING = 255;
pub const NameUnknown = 0;
pub const NameFullyQualifiedDN = 1;
pub const NameSamCompatible = 2;
pub const NameDisplay = 3;
pub const NameUniqueId = 6;
pub const NameCanonical = 7;
pub const NameUserPrincipal = 8;
pub const NameCanonicalEx = 9;
pub const NameServicePrincipal = 10;
pub const NameDnsDomain = 12;
pub const NameGivenName = 13;
pub const NameSurname = 14;
pub const SL_DATA_NONE = 0;
pub const SL_DATA_SZ = 1;
pub const SL_DATA_DWORD = 4;
pub const SL_DATA_BINARY = 3;
pub const SL_DATA_MULTI_SZ = 7;
pub const SL_DATA_SUM = 100;
pub const SL_ID_APPLICATION = 0;
pub const SL_ID_PRODUCT_SKU = 1;
pub const SL_ID_LICENSE_FILE = 2;
pub const SL_ID_LICENSE = 3;
pub const SL_ID_PKEY = 4;
pub const SL_ID_ALL_LICENSES = 5;
pub const SL_ID_ALL_LICENSE_FILES = 6;
pub const SL_ID_STORE_TOKEN = 7;
pub const SL_ID_LAST = 8;
pub const SL_LICENSING_STATUS_UNLICENSED = 0;
pub const SL_LICENSING_STATUS_LICENSED = 1;
pub const SL_LICENSING_STATUS_IN_GRACE_PERIOD = 2;
pub const SL_LICENSING_STATUS_NOTIFICATION = 3;
pub const SL_LICENSING_STATUS_LAST = 4;
pub const SL_ACTIVATION_TYPE_DEFAULT = 0;
pub const SL_ACTIVATION_TYPE_ACTIVE_DIRECTORY = 1;
pub const SL_REFERRALTYPE_SKUID = 0;
pub const SL_REFERRALTYPE_APPID = 1;
pub const SL_REFERRALTYPE_OVERRIDE_SKUID = 2;
pub const SL_REFERRALTYPE_OVERRIDE_APPID = 3;
pub const SL_REFERRALTYPE_BEST_MATCH = 4;
pub const SL_GEN_STATE_IS_GENUINE = 0;
pub const SL_GEN_STATE_INVALID_LICENSE = 1;
pub const SL_GEN_STATE_TAMPERED = 2;
pub const SL_GEN_STATE_OFFLINE = 3;
pub const SL_GEN_STATE_LAST = 4;

pub const aliases = struct {
    pub const SECPKG_ATTR = u32;
    pub const MSV1_0 = u32;
    pub const SECPKG_CRED = u32;
    pub const MSV_SUB_AUTHENTICATION_FILTER = u32;
    pub const EXPORT_SECURITY_CONTEXT_FLAGS = u32;
    pub const KERB_TICKET_FLAGS = u32;
    pub const KERB_ADDRESS_TYPE = u32;
    pub const SCHANNEL_CRED_FLAGS = u32;
    pub const DOMAIN_PASSWORD_PROPERTIES = u32;
    pub const SCHANNEL_ALERT_TOKEN_ALERT_TYPE = u32;
    pub const TRUSTED_DOMAIN_TRUST_TYPE = u32;
    pub const MSV_SUBAUTH_LOGON_PARAMETER_CONTROL = u32;
    pub const KERB_REQUEST_FLAGS = u32;
    pub const TRUSTED_DOMAIN_TRUST_DIRECTION = u32;
    pub const MSV_SUPPLEMENTAL_CREDENTIAL_FLAGS = u32;
    pub const SECURITY_PACKAGE_OPTIONS_TYPE = u32;
    pub const SCHANNEL_SESSION_TOKEN_FLAGS = u32;
    pub const KERB_CRYPTO_KEY_TYPE = i32;
    pub const LSA_AUTH_INFORMATION_AUTH_TYPE = u32;
    pub const SECPKG_PACKAGE_CHANGE_TYPE = u32;
    pub const TRUSTED_DOMAIN_TRUST_ATTRIBUTES = u32;
    pub const ISC_REQ_HIGH_FLAGS = u64;
    pub const ISC_REQ_FLAGS = u32;
    pub const ASC_REQ_HIGH_FLAGS = u64;
    pub const ASC_REQ_FLAGS = u32;
    pub const LSA_LOOKUP_DOMAIN_INFO_CLASS = i32;
    pub const SECURITY_LOGON_TYPE = i32;
    pub const SE_ADT_PARAMETER_TYPE = i32;
    pub const POLICY_AUDIT_EVENT_TYPE = i32;
    pub const POLICY_LSA_SERVER_ROLE = i32;
    pub const POLICY_INFORMATION_CLASS = i32;
    pub const POLICY_DOMAIN_INFORMATION_CLASS = i32;
    pub const POLICY_NOTIFICATION_INFORMATION_CLASS = i32;
    pub const TRUSTED_INFORMATION_CLASS = i32;
    pub const LSA_FOREST_TRUST_RECORD_TYPE = i32;
    pub const LSA_FOREST_TRUST_COLLISION_RECORD_TYPE = i32;
    pub const NEGOTIATE_MESSAGES = i32;
    pub const MSV1_0_LOGON_SUBMIT_TYPE = i32;
    pub const MSV1_0_PROFILE_BUFFER_TYPE = i32;
    pub const MSV1_0_CREDENTIAL_KEY_TYPE = i32;
    pub const MSV1_0_AVID = i32;
    pub const MSV1_0_PROTOCOL_MESSAGE_TYPE = i32;
    pub const KERB_LOGON_SUBMIT_TYPE = i32;
    pub const KERB_PROFILE_BUFFER_TYPE = i32;
    pub const KERB_PROTOCOL_MESSAGE_TYPE = i32;
    pub const KERB_CERTIFICATE_INFO_TYPE = i32;
    pub const PKU2U_LOGON_SUBMIT_TYPE = i32;
    pub const SEC_APPLICATION_PROTOCOL_NEGOTIATION_EXT = i32;
    pub const SEC_TRAFFIC_SECRET_TYPE = i32;
    pub const SECPKG_CRED_CLASS = i32;
    pub const SECPKG_ATTR_LCT_STATUS = i32;
    pub const SEC_APPLICATION_PROTOCOL_NEGOTIATION_STATUS = i32;
    pub const SecDelegationType = i32;
    pub const SASL_AUTHZID_STATE = i32;
    pub const LSA_TOKEN_INFORMATION_TYPE = i32;
    pub const SECPKG_FAILURE_SPECIAL_REASON = i32;
    pub const SECPKG_EXTENDED_INFORMATION_CLASS = i32;
    pub const SECPKG_CALL_PACKAGE_MESSAGE_TYPE = i32;
    pub const SECPKG_SESSIONINFO_TYPE = i32;
    pub const SECPKG_NAME_TYPE = i32;
    pub const CRED_FETCH = i32;
    pub const KSEC_CONTEXT_TYPE = i32;
    pub const eTlsSignatureAlgorithm = i32;
    pub const eTlsHashAlgorithm = i32;
    pub const eTlsAlgorithmUsage = i32;
    pub const SchGetExtensionsOptions = i32;
    pub const NETLOGON_LOGON_INFO_CLASS = i32;
    pub const TOKENBINDING_TYPE = i32;
    pub const TOKENBINDING_EXTENSION_FORMAT = i32;
    pub const TOKENBINDING_KEY_PARAMETERS_TYPE = i32;
    pub const EXTENDED_NAME_FORMAT = i32;
    pub const SLDATATYPE = u32;
    pub const SLIDTYPE = i32;
    pub const SLLICENSINGSTATUS = i32;
    pub const SL_ACTIVATION_TYPE = i32;
    pub const SLREFERRALTYPE = i32;
    pub const SL_GENUINE_STATE = i32;
    pub const LSA_HANDLE = isize;
    pub const _HMAPPER = isize;
};
