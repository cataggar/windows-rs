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
    .{ "AccessCheck", MethodRecord{ .library = "ADVAPI32", .import = "AccessCheck", .signature = "\x00\x08\x11\x59\x11\x82\xad\x11\x80\x85\x09\x0f\x11\x9d\x05\x0f\x11\x9d\x09\x0f\x09\x0f\x09\x0f\x11\x59" } },
    .{ "AccessCheckAndAuditAlarmW", MethodRecord{ .library = "ADVAPI32", .import = "AccessCheckAndAuditAlarmW", .signature = "\x00\x0b\x11\x59\x11\x05\x0f\x01\x11\x05\x11\x05\x11\x82\xad\x09\x0f\x11\x9d\x05\x11\x59\x0f\x09\x0f\x11\x59\x0f\x11\x59" } },
    .{ "AccessCheckByType", MethodRecord{ .library = "ADVAPI32", .import = "AccessCheckByType", .signature = "\x00\x0b\x11\x59\x11\x82\xad\x11\x81\x15\x11\x80\x85\x09\x0f\x11\x9d\x0d\x09\x0f\x11\x9d\x05\x0f\x11\x9d\x09\x0f\x09\x0f\x09\x0f\x11\x59" } },
    .{ "AccessCheckByTypeResultList", MethodRecord{ .library = "ADVAPI32", .import = "AccessCheckByTypeResultList", .signature = "\x00\x0b\x11\x59\x11\x82\xad\x11\x81\x15\x11\x80\x85\x09\x0f\x11\x9d\x0d\x09\x0f\x11\x9d\x05\x0f\x11\x9d\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "AccessCheckByTypeAndAuditAlarmW", MethodRecord{ .library = "ADVAPI32", .import = "AccessCheckByTypeAndAuditAlarmW", .signature = "\x00\x10\x11\x59\x11\x05\x0f\x01\x11\x05\x11\x05\x11\x82\xad\x11\x81\x15\x09\x11\x9d\x11\x09\x0f\x11\x9d\x0d\x09\x0f\x11\x9d\x05\x11\x59\x0f\x09\x0f\x11\x59\x0f\x11\x59" } },
    .{ "AccessCheckByTypeResultListAndAuditAlarmW", MethodRecord{ .library = "ADVAPI32", .import = "AccessCheckByTypeResultListAndAuditAlarmW", .signature = "\x00\x10\x11\x59\x11\x05\x0f\x01\x11\x05\x11\x05\x11\x82\xad\x11\x81\x15\x09\x11\x9d\x11\x09\x0f\x11\x9d\x0d\x09\x0f\x11\x9d\x05\x11\x59\x0f\x09\x0f\x09\x0f\x11\x59" } },
    .{ "AccessCheckByTypeResultListAndAuditAlarmByHandleW", MethodRecord{ .library = "ADVAPI32", .import = "AccessCheckByTypeResultListAndAuditAlarmByHandleW", .signature = "\x00\x11\x11\x59\x11\x05\x0f\x01\x11\x80\x85\x11\x05\x11\x05\x11\x82\xad\x11\x81\x15\x09\x11\x9d\x11\x09\x0f\x11\x9d\x0d\x09\x0f\x11\x9d\x05\x11\x59\x0f\x09\x0f\x09\x0f\x11\x59" } },
    .{ "AddAccessAllowedAce", MethodRecord{ .library = "ADVAPI32", .import = "AddAccessAllowedAce", .signature = "\x00\x04\x11\x59\x0f\x11\x93\xc9\x11\x9c\xe9\x09\x11\x81\x15" } },
    .{ "AddAccessAllowedAceEx", MethodRecord{ .library = "ADVAPI32", .import = "AddAccessAllowedAceEx", .signature = "\x00\x05\x11\x59\x0f\x11\x93\xc9\x11\x9c\xe9\x11\x9c\xe1\x09\x11\x81\x15" } },
    .{ "AddAccessAllowedObjectAce", MethodRecord{ .library = "ADVAPI32", .import = "AddAccessAllowedObjectAce", .signature = "\x00\x07\x11\x59\x0f\x11\x93\xc9\x11\x9c\xe9\x11\x9c\xe1\x09\x0f\x11\x0d\x0f\x11\x0d\x11\x81\x15" } },
    .{ "AddAccessDeniedAce", MethodRecord{ .library = "ADVAPI32", .import = "AddAccessDeniedAce", .signature = "\x00\x04\x11\x59\x0f\x11\x93\xc9\x11\x9c\xe9\x09\x11\x81\x15" } },
    .{ "AddAccessDeniedAceEx", MethodRecord{ .library = "ADVAPI32", .import = "AddAccessDeniedAceEx", .signature = "\x00\x05\x11\x59\x0f\x11\x93\xc9\x11\x9c\xe9\x11\x9c\xe1\x09\x11\x81\x15" } },
    .{ "AddAccessDeniedObjectAce", MethodRecord{ .library = "ADVAPI32", .import = "AddAccessDeniedObjectAce", .signature = "\x00\x07\x11\x59\x0f\x11\x93\xc9\x11\x9c\xe9\x11\x9c\xe1\x09\x0f\x11\x0d\x0f\x11\x0d\x11\x81\x15" } },
    .{ "AddAce", MethodRecord{ .library = "ADVAPI32", .import = "AddAce", .signature = "\x00\x05\x11\x59\x0f\x11\x93\xc9\x11\x9c\xe9\x09\x0f\x01\x09" } },
    .{ "AddAuditAccessAce", MethodRecord{ .library = "ADVAPI32", .import = "AddAuditAccessAce", .signature = "\x00\x06\x11\x59\x0f\x11\x93\xc9\x11\x9c\xe9\x09\x11\x81\x15\x11\x59\x11\x59" } },
    .{ "AddAuditAccessAceEx", MethodRecord{ .library = "ADVAPI32", .import = "AddAuditAccessAceEx", .signature = "\x00\x07\x11\x59\x0f\x11\x93\xc9\x11\x9c\xe9\x11\x9c\xe1\x09\x11\x81\x15\x11\x59\x11\x59" } },
    .{ "AddAuditAccessObjectAce", MethodRecord{ .library = "ADVAPI32", .import = "AddAuditAccessObjectAce", .signature = "\x00\x09\x11\x59\x0f\x11\x93\xc9\x11\x9c\xe9\x11\x9c\xe1\x09\x0f\x11\x0d\x0f\x11\x0d\x11\x81\x15\x11\x59\x11\x59" } },
    .{ "AddMandatoryAce", MethodRecord{ .library = "ADVAPI32", .import = "AddMandatoryAce", .signature = "\x00\x05\x11\x59\x0f\x11\x93\xc9\x11\x9c\xe9\x11\x9c\xe1\x09\x11\x81\x15" } },
    .{ "AddResourceAttributeAce", MethodRecord{ .library = "KERNEL32", .import = "AddResourceAttributeAce", .signature = "\x00\x07\x11\x59\x0f\x11\x93\xc9\x11\x9c\xe9\x11\x9c\xe1\x09\x11\x81\x15\x0f\x11\x9d\x15\x0f\x09" } },
    .{ "AddScopedPolicyIDAce", MethodRecord{ .library = "KERNEL32", .import = "AddScopedPolicyIDAce", .signature = "\x00\x05\x11\x59\x0f\x11\x93\xc9\x11\x9c\xe9\x11\x9c\xe1\x09\x11\x81\x15" } },
    .{ "AdjustTokenGroups", MethodRecord{ .library = "ADVAPI32", .import = "AdjustTokenGroups", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x59\x0f\x11\x93\x61\x09\x0f\x11\x93\x61\x0f\x09" } },
    .{ "AdjustTokenPrivileges", MethodRecord{ .library = "ADVAPI32", .import = "AdjustTokenPrivileges", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x59\x0f\x11\x9d\x19\x09\x0f\x11\x9d\x19\x0f\x09" } },
    .{ "AllocateAndInitializeSid", MethodRecord{ .library = "ADVAPI32", .import = "AllocateAndInitializeSid", .signature = "\x00\x0b\x11\x59\x0f\x11\x9d\x01\x05\x09\x09\x09\x09\x09\x09\x09\x09\x0f\x11\x81\x15" } },
    .{ "AllocateLocallyUniqueId", MethodRecord{ .library = "ADVAPI32", .import = "AllocateLocallyUniqueId", .signature = "\x00\x01\x11\x59\x0f\x11\x93\x69" } },
    .{ "AreAllAccessesGranted", MethodRecord{ .library = "ADVAPI32", .import = "AreAllAccessesGranted", .signature = "\x00\x02\x11\x59\x09\x09" } },
    .{ "AreAnyAccessesGranted", MethodRecord{ .library = "ADVAPI32", .import = "AreAnyAccessesGranted", .signature = "\x00\x02\x11\x59\x09\x09" } },
    .{ "CheckTokenMembership", MethodRecord{ .library = "ADVAPI32", .import = "CheckTokenMembership", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x81\x15\x0f\x11\x59" } },
    .{ "CheckTokenCapability", MethodRecord{ .library = "KERNEL32", .import = "CheckTokenCapability", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x81\x15\x0f\x11\x59" } },
    .{ "GetAppContainerAce", MethodRecord{ .library = "KERNEL32", .import = "GetAppContainerAce", .signature = "\x00\x04\x11\x59\x0f\x11\x93\xc9\x09\x0f\x0f\x01\x0f\x09" } },
    .{ "CheckTokenMembershipEx", MethodRecord{ .library = "KERNEL32", .import = "CheckTokenMembershipEx", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x81\x15\x09\x0f\x11\x59" } },
    .{ "ConvertToAutoInheritPrivateObjectSecurity", MethodRecord{ .library = "ADVAPI32", .import = "ConvertToAutoInheritPrivateObjectSecurity", .signature = "\x00\x06\x11\x59\x11\x82\xad\x11\x82\xad\x0f\x11\x82\xad\x0f\x11\x0d\x11\x87\x79\x0f\x11\x9d\x05" } },
    .{ "CopySid", MethodRecord{ .library = "ADVAPI32", .import = "CopySid", .signature = "\x00\x03\x11\x59\x09\x11\x81\x15\x11\x81\x15" } },
    .{ "CreatePrivateObjectSecurity", MethodRecord{ .library = "ADVAPI32", .import = "CreatePrivateObjectSecurity", .signature = "\x00\x06\x11\x59\x11\x82\xad\x11\x82\xad\x0f\x11\x82\xad\x11\x59\x11\x80\x85\x0f\x11\x9d\x05" } },
    .{ "CreatePrivateObjectSecurityEx", MethodRecord{ .library = "ADVAPI32", .import = "CreatePrivateObjectSecurityEx", .signature = "\x00\x08\x11\x59\x11\x82\xad\x11\x82\xad\x0f\x11\x82\xad\x0f\x11\x0d\x11\x59\x11\x9c\xe5\x11\x80\x85\x0f\x11\x9d\x05" } },
    .{ "CreatePrivateObjectSecurityWithMultipleInheritance", MethodRecord{ .library = "ADVAPI32", .import = "CreatePrivateObjectSecurityWithMultipleInheritance", .signature = "\x00\x09\x11\x59\x11\x82\xad\x11\x82\xad\x0f\x11\x82\xad\x0f\x0f\x11\x0d\x09\x11\x59\x11\x9c\xe5\x11\x80\x85\x0f\x11\x9d\x05" } },
    .{ "CreateRestrictedToken", MethodRecord{ .library = "ADVAPI32", .import = "CreateRestrictedToken", .signature = "\x00\x09\x11\x59\x11\x80\x85\x11\x9c\xd9\x09\x0f\x11\x9d\x1d\x09\x0f\x11\x9d\x21\x09\x0f\x11\x9d\x1d\x0f\x11\x80\x85" } },
    .{ "CreateWellKnownSid", MethodRecord{ .library = "ADVAPI32", .import = "CreateWellKnownSid", .signature = "\x00\x04\x11\x59\x11\x9d\x25\x11\x81\x15\x11\x81\x15\x0f\x09" } },
    .{ "EqualDomainSid", MethodRecord{ .library = "ADVAPI32", .import = "EqualDomainSid", .signature = "\x00\x03\x11\x59\x11\x81\x15\x11\x81\x15\x0f\x11\x59" } },
    .{ "DeleteAce", MethodRecord{ .library = "ADVAPI32", .import = "DeleteAce", .signature = "\x00\x02\x11\x59\x0f\x11\x93\xc9\x09" } },
    .{ "DestroyPrivateObjectSecurity", MethodRecord{ .library = "ADVAPI32", .import = "DestroyPrivateObjectSecurity", .signature = "\x00\x01\x11\x59\x0f\x11\x82\xad" } },
    .{ "DuplicateToken", MethodRecord{ .library = "ADVAPI32", .import = "DuplicateToken", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x9d\x29\x0f\x11\x80\x85" } },
    .{ "DuplicateTokenEx", MethodRecord{ .library = "ADVAPI32", .import = "DuplicateTokenEx", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x9d\x2d\x0f\x11\x8b\xb5\x11\x9d\x29\x11\x9d\x31\x0f\x11\x80\x85" } },
    .{ "EqualPrefixSid", MethodRecord{ .library = "ADVAPI32", .import = "EqualPrefixSid", .signature = "\x00\x02\x11\x59\x11\x81\x15\x11\x81\x15" } },
    .{ "EqualSid", MethodRecord{ .library = "ADVAPI32", .import = "EqualSid", .signature = "\x00\x02\x11\x59\x11\x81\x15\x11\x81\x15" } },
    .{ "FindFirstFreeAce", MethodRecord{ .library = "ADVAPI32", .import = "FindFirstFreeAce", .signature = "\x00\x02\x11\x59\x0f\x11\x93\xc9\x0f\x0f\x01" } },
    .{ "FreeSid", MethodRecord{ .library = "ADVAPI32", .import = "FreeSid", .signature = "\x00\x01\x0f\x01\x11\x81\x15" } },
    .{ "GetAce", MethodRecord{ .library = "ADVAPI32", .import = "GetAce", .signature = "\x00\x03\x11\x59\x0f\x11\x93\xc9\x09\x0f\x0f\x01" } },
    .{ "GetAclInformation", MethodRecord{ .library = "ADVAPI32", .import = "GetAclInformation", .signature = "\x00\x04\x11\x59\x0f\x11\x93\xc9\x0f\x01\x09\x11\x9d\x35" } },
    .{ "GetFileSecurityW", MethodRecord{ .library = "ADVAPI32", .import = "GetFileSecurityW", .signature = "\x00\x05\x11\x59\x11\x05\x09\x11\x82\xad\x09\x0f\x09" } },
    .{ "GetKernelObjectSecurity", MethodRecord{ .library = "ADVAPI32", .import = "GetKernelObjectSecurity", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x11\x82\xad\x09\x0f\x09" } },
    .{ "GetLengthSid", MethodRecord{ .library = "ADVAPI32", .import = "GetLengthSid", .signature = "\x00\x01\x09\x11\x81\x15" } },
    .{ "GetPrivateObjectSecurity", MethodRecord{ .library = "ADVAPI32", .import = "GetPrivateObjectSecurity", .signature = "\x00\x05\x11\x59\x11\x82\xad\x11\x84\xf9\x11\x82\xad\x09\x0f\x09" } },
    .{ "GetSecurityDescriptorControl", MethodRecord{ .library = "ADVAPI32", .import = "GetSecurityDescriptorControl", .signature = "\x00\x03\x11\x59\x11\x82\xad\x0f\x07\x0f\x09" } },
    .{ "GetSecurityDescriptorDacl", MethodRecord{ .library = "ADVAPI32", .import = "GetSecurityDescriptorDacl", .signature = "\x00\x04\x11\x59\x11\x82\xad\x0f\x11\x59\x0f\x0f\x11\x93\xc9\x0f\x11\x59" } },
    .{ "GetSecurityDescriptorGroup", MethodRecord{ .library = "ADVAPI32", .import = "GetSecurityDescriptorGroup", .signature = "\x00\x03\x11\x59\x11\x82\xad\x0f\x11\x81\x15\x0f\x11\x59" } },
    .{ "GetSecurityDescriptorLength", MethodRecord{ .library = "ADVAPI32", .import = "GetSecurityDescriptorLength", .signature = "\x00\x01\x09\x11\x82\xad" } },
    .{ "GetSecurityDescriptorOwner", MethodRecord{ .library = "ADVAPI32", .import = "GetSecurityDescriptorOwner", .signature = "\x00\x03\x11\x59\x11\x82\xad\x0f\x11\x81\x15\x0f\x11\x59" } },
    .{ "GetSecurityDescriptorRMControl", MethodRecord{ .library = "ADVAPI32", .import = "GetSecurityDescriptorRMControl", .signature = "\x00\x02\x09\x11\x82\xad\x0f\x05" } },
    .{ "GetSecurityDescriptorSacl", MethodRecord{ .library = "ADVAPI32", .import = "GetSecurityDescriptorSacl", .signature = "\x00\x04\x11\x59\x11\x82\xad\x0f\x11\x59\x0f\x0f\x11\x93\xc9\x0f\x11\x59" } },
    .{ "GetSidIdentifierAuthority", MethodRecord{ .library = "ADVAPI32", .import = "GetSidIdentifierAuthority", .signature = "\x00\x01\x0f\x11\x9d\x01\x11\x81\x15" } },
    .{ "GetSidLengthRequired", MethodRecord{ .library = "ADVAPI32", .import = "GetSidLengthRequired", .signature = "\x00\x01\x09\x05" } },
    .{ "GetSidSubAuthority", MethodRecord{ .library = "ADVAPI32", .import = "GetSidSubAuthority", .signature = "\x00\x02\x0f\x09\x11\x81\x15\x09" } },
    .{ "GetSidSubAuthorityCount", MethodRecord{ .library = "ADVAPI32", .import = "GetSidSubAuthorityCount", .signature = "\x00\x01\x0f\x05\x11\x81\x15" } },
    .{ "GetTokenInformation", MethodRecord{ .library = "ADVAPI32", .import = "GetTokenInformation", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x9d\x39\x0f\x01\x09\x0f\x09" } },
    .{ "GetWindowsAccountDomainSid", MethodRecord{ .library = "ADVAPI32", .import = "GetWindowsAccountDomainSid", .signature = "\x00\x03\x11\x59\x11\x81\x15\x11\x81\x15\x0f\x09" } },
    .{ "ImpersonateAnonymousToken", MethodRecord{ .library = "ADVAPI32", .import = "ImpersonateAnonymousToken", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "ImpersonateLoggedOnUser", MethodRecord{ .library = "ADVAPI32", .import = "ImpersonateLoggedOnUser", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "ImpersonateSelf", MethodRecord{ .library = "ADVAPI32", .import = "ImpersonateSelf", .signature = "\x00\x01\x11\x59\x11\x9d\x29" } },
    .{ "InitializeAcl", MethodRecord{ .library = "ADVAPI32", .import = "InitializeAcl", .signature = "\x00\x03\x11\x59\x0f\x11\x93\xc9\x09\x11\x9c\xe9" } },
    .{ "InitializeSecurityDescriptor", MethodRecord{ .library = "ADVAPI32", .import = "InitializeSecurityDescriptor", .signature = "\x00\x02\x11\x59\x11\x82\xad\x09" } },
    .{ "InitializeSid", MethodRecord{ .library = "ADVAPI32", .import = "InitializeSid", .signature = "\x00\x03\x11\x59\x11\x81\x15\x0f\x11\x9d\x01\x05" } },
    .{ "IsTokenRestricted", MethodRecord{ .library = "ADVAPI32", .import = "IsTokenRestricted", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "IsValidAcl", MethodRecord{ .library = "ADVAPI32", .import = "IsValidAcl", .signature = "\x00\x01\x11\x59\x0f\x11\x93\xc9" } },
    .{ "IsValidSecurityDescriptor", MethodRecord{ .library = "ADVAPI32", .import = "IsValidSecurityDescriptor", .signature = "\x00\x01\x11\x59\x11\x82\xad" } },
    .{ "IsValidSid", MethodRecord{ .library = "ADVAPI32", .import = "IsValidSid", .signature = "\x00\x01\x11\x59\x11\x81\x15" } },
    .{ "IsWellKnownSid", MethodRecord{ .library = "ADVAPI32", .import = "IsWellKnownSid", .signature = "\x00\x02\x11\x59\x11\x81\x15\x11\x9d\x25" } },
    .{ "MakeAbsoluteSD", MethodRecord{ .library = "ADVAPI32", .import = "MakeAbsoluteSD", .signature = "\x00\x0b\x11\x59\x11\x82\xad\x11\x82\xad\x0f\x09\x0f\x11\x93\xc9\x0f\x09\x0f\x11\x93\xc9\x0f\x09\x11\x81\x15\x0f\x09\x11\x81\x15\x0f\x09" } },
    .{ "MakeSelfRelativeSD", MethodRecord{ .library = "ADVAPI32", .import = "MakeSelfRelativeSD", .signature = "\x00\x03\x11\x59\x11\x82\xad\x11\x82\xad\x0f\x09" } },
    .{ "MapGenericMask", MethodRecord{ .library = "ADVAPI32", .import = "MapGenericMask", .signature = "\x00\x02\x01\x0f\x09\x0f\x11\x9d\x05" } },
    .{ "ObjectCloseAuditAlarmW", MethodRecord{ .library = "ADVAPI32", .import = "ObjectCloseAuditAlarmW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x01\x11\x59" } },
    .{ "ObjectDeleteAuditAlarmW", MethodRecord{ .library = "ADVAPI32", .import = "ObjectDeleteAuditAlarmW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x01\x11\x59" } },
    .{ "ObjectOpenAuditAlarmW", MethodRecord{ .library = "ADVAPI32", .import = "ObjectOpenAuditAlarmW", .signature = "\x00\x0c\x11\x59\x11\x05\x0f\x01\x11\x05\x11\x05\x11\x82\xad\x11\x80\x85\x09\x09\x0f\x11\x9d\x09\x11\x59\x11\x59\x0f\x11\x59" } },
    .{ "ObjectPrivilegeAuditAlarmW", MethodRecord{ .library = "ADVAPI32", .import = "ObjectPrivilegeAuditAlarmW", .signature = "\x00\x06\x11\x59\x11\x05\x0f\x01\x11\x80\x85\x09\x0f\x11\x9d\x09\x11\x59" } },
    .{ "PrivilegeCheck", MethodRecord{ .library = "ADVAPI32", .import = "PrivilegeCheck", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\x9d\x09\x0f\x11\x59" } },
    .{ "PrivilegedServiceAuditAlarmW", MethodRecord{ .library = "ADVAPI32", .import = "PrivilegedServiceAuditAlarmW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x11\x80\x85\x0f\x11\x9d\x09\x11\x59" } },
    .{ "QuerySecurityAccessMask", MethodRecord{ .library = "ADVAPI32", .import = "QuerySecurityAccessMask", .signature = "\x00\x02\x01\x11\x84\xf9\x0f\x09" } },
    .{ "RevertToSelf", MethodRecord{ .library = "ADVAPI32", .import = "RevertToSelf", .signature = "\x00\x00\x11\x59" } },
    .{ "SetAclInformation", MethodRecord{ .library = "ADVAPI32", .import = "SetAclInformation", .signature = "\x00\x04\x11\x59\x0f\x11\x93\xc9\x0f\x01\x09\x11\x9d\x35" } },
    .{ "SetFileSecurityW", MethodRecord{ .library = "ADVAPI32", .import = "SetFileSecurityW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x84\xf9\x11\x82\xad" } },
    .{ "SetKernelObjectSecurity", MethodRecord{ .library = "ADVAPI32", .import = "SetKernelObjectSecurity", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x84\xf9\x11\x82\xad" } },
    .{ "SetPrivateObjectSecurity", MethodRecord{ .library = "ADVAPI32", .import = "SetPrivateObjectSecurity", .signature = "\x00\x05\x11\x59\x11\x84\xf9\x11\x82\xad\x0f\x11\x82\xad\x0f\x11\x9d\x05\x11\x80\x85" } },
    .{ "SetPrivateObjectSecurityEx", MethodRecord{ .library = "ADVAPI32", .import = "SetPrivateObjectSecurityEx", .signature = "\x00\x06\x11\x59\x11\x84\xf9\x11\x82\xad\x0f\x11\x82\xad\x11\x9c\xe5\x0f\x11\x9d\x05\x11\x80\x85" } },
    .{ "SetSecurityAccessMask", MethodRecord{ .library = "ADVAPI32", .import = "SetSecurityAccessMask", .signature = "\x00\x02\x01\x11\x84\xf9\x0f\x09" } },
    .{ "SetSecurityDescriptorControl", MethodRecord{ .library = "ADVAPI32", .import = "SetSecurityDescriptorControl", .signature = "\x00\x03\x11\x59\x11\x82\xad\x11\x9c\xfd\x11\x9c\xfd" } },
    .{ "SetSecurityDescriptorDacl", MethodRecord{ .library = "ADVAPI32", .import = "SetSecurityDescriptorDacl", .signature = "\x00\x04\x11\x59\x11\x82\xad\x11\x59\x0f\x11\x93\xc9\x11\x59" } },
    .{ "SetSecurityDescriptorGroup", MethodRecord{ .library = "ADVAPI32", .import = "SetSecurityDescriptorGroup", .signature = "\x00\x03\x11\x59\x11\x82\xad\x11\x81\x15\x11\x59" } },
    .{ "SetSecurityDescriptorOwner", MethodRecord{ .library = "ADVAPI32", .import = "SetSecurityDescriptorOwner", .signature = "\x00\x03\x11\x59\x11\x82\xad\x11\x81\x15\x11\x59" } },
    .{ "SetSecurityDescriptorRMControl", MethodRecord{ .library = "ADVAPI32", .import = "SetSecurityDescriptorRMControl", .signature = "\x00\x02\x09\x11\x82\xad\x0f\x05" } },
    .{ "SetSecurityDescriptorSacl", MethodRecord{ .library = "ADVAPI32", .import = "SetSecurityDescriptorSacl", .signature = "\x00\x04\x11\x59\x11\x82\xad\x11\x59\x0f\x11\x93\xc9\x11\x59" } },
    .{ "SetTokenInformation", MethodRecord{ .library = "ADVAPI32", .import = "SetTokenInformation", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x9d\x39\x0f\x01\x09" } },
    .{ "SetCachedSigningLevel", MethodRecord{ .library = "KERNEL32", .import = "SetCachedSigningLevel", .signature = "\x00\x04\x11\x59\x0f\x11\x80\x85\x09\x09\x11\x80\x85" } },
    .{ "GetCachedSigningLevel", MethodRecord{ .library = "KERNEL32", .import = "GetCachedSigningLevel", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x09\x0f\x09\x0f\x05\x0f\x09\x0f\x09" } },
    .{ "DeriveCapabilitySidsFromName", MethodRecord{ .library = "api-ms-win-security-base-l1-2-2", .import = "DeriveCapabilitySidsFromName", .signature = "\x00\x05\x11\x59\x11\x05\x0f\x0f\x11\x81\x15\x0f\x09\x0f\x0f\x11\x81\x15\x0f\x09" } },
    .{ "RtlNormalizeSecurityDescriptor", MethodRecord{ .library = "ntdll", .import = "RtlNormalizeSecurityDescriptor", .signature = "\x00\x05\x11\x87\x79\x0f\x11\x82\xad\x09\x0f\x11\x82\xad\x0f\x09\x11\x87\x79" } },
    .{ "SetUserObjectSecurity", MethodRecord{ .library = "USER32", .import = "SetUserObjectSecurity", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\x84\xf9\x11\x82\xad" } },
    .{ "GetUserObjectSecurity", MethodRecord{ .library = "USER32", .import = "GetUserObjectSecurity", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x09\x11\x82\xad\x09\x0f\x09" } },
    .{ "AccessCheckAndAuditAlarmA", MethodRecord{ .library = "ADVAPI32", .import = "AccessCheckAndAuditAlarmA", .signature = "\x00\x0b\x11\x59\x11\x3d\x0f\x01\x11\x3d\x11\x3d\x11\x82\xad\x09\x0f\x11\x9d\x05\x11\x59\x0f\x09\x0f\x11\x59\x0f\x11\x59" } },
    .{ "AccessCheckByTypeAndAuditAlarmA", MethodRecord{ .library = "ADVAPI32", .import = "AccessCheckByTypeAndAuditAlarmA", .signature = "\x00\x10\x11\x59\x11\x3d\x0f\x01\x11\x3d\x11\x3d\x11\x82\xad\x11\x81\x15\x09\x11\x9d\x11\x09\x0f\x11\x9d\x0d\x09\x0f\x11\x9d\x05\x11\x59\x0f\x09\x0f\x11\x59\x0f\x11\x59" } },
    .{ "AccessCheckByTypeResultListAndAuditAlarmA", MethodRecord{ .library = "ADVAPI32", .import = "AccessCheckByTypeResultListAndAuditAlarmA", .signature = "\x00\x10\x11\x59\x11\x3d\x0f\x01\x11\x3d\x11\x3d\x11\x82\xad\x11\x81\x15\x09\x11\x9d\x11\x09\x0f\x11\x9d\x0d\x09\x0f\x11\x9d\x05\x11\x59\x0f\x09\x0f\x09\x0f\x11\x59" } },
    .{ "AccessCheckByTypeResultListAndAuditAlarmByHandleA", MethodRecord{ .library = "ADVAPI32", .import = "AccessCheckByTypeResultListAndAuditAlarmByHandleA", .signature = "\x00\x11\x11\x59\x11\x3d\x0f\x01\x11\x80\x85\x11\x3d\x11\x3d\x11\x82\xad\x11\x81\x15\x09\x11\x9d\x11\x09\x0f\x11\x9d\x0d\x09\x0f\x11\x9d\x05\x11\x59\x0f\x09\x0f\x09\x0f\x11\x59" } },
    .{ "ObjectOpenAuditAlarmA", MethodRecord{ .library = "ADVAPI32", .import = "ObjectOpenAuditAlarmA", .signature = "\x00\x0c\x11\x59\x11\x3d\x0f\x01\x11\x3d\x11\x3d\x11\x82\xad\x11\x80\x85\x09\x09\x0f\x11\x9d\x09\x11\x59\x11\x59\x0f\x11\x59" } },
    .{ "ObjectPrivilegeAuditAlarmA", MethodRecord{ .library = "ADVAPI32", .import = "ObjectPrivilegeAuditAlarmA", .signature = "\x00\x06\x11\x59\x11\x3d\x0f\x01\x11\x80\x85\x09\x0f\x11\x9d\x09\x11\x59" } },
    .{ "ObjectCloseAuditAlarmA", MethodRecord{ .library = "ADVAPI32", .import = "ObjectCloseAuditAlarmA", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x01\x11\x59" } },
    .{ "ObjectDeleteAuditAlarmA", MethodRecord{ .library = "ADVAPI32", .import = "ObjectDeleteAuditAlarmA", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x01\x11\x59" } },
    .{ "PrivilegedServiceAuditAlarmA", MethodRecord{ .library = "ADVAPI32", .import = "PrivilegedServiceAuditAlarmA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x11\x80\x85\x0f\x11\x9d\x09\x11\x59" } },
    .{ "AddConditionalAce", MethodRecord{ .library = "ADVAPI32", .import = "AddConditionalAce", .signature = "\x00\x08\x11\x59\x0f\x11\x93\xc9\x11\x9c\xe9\x11\x9c\xe1\x05\x09\x11\x81\x15\x11\x05\x0f\x09" } },
    .{ "SetFileSecurityA", MethodRecord{ .library = "ADVAPI32", .import = "SetFileSecurityA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x84\xf9\x11\x82\xad" } },
    .{ "GetFileSecurityA", MethodRecord{ .library = "ADVAPI32", .import = "GetFileSecurityA", .signature = "\x00\x05\x11\x59\x11\x3d\x09\x11\x82\xad\x09\x0f\x09" } },
    .{ "LookupAccountSidA", MethodRecord{ .library = "ADVAPI32", .import = "LookupAccountSidA", .signature = "\x00\x07\x11\x59\x11\x3d\x11\x81\x15\x11\x3d\x0f\x09\x11\x3d\x0f\x09\x0f\x11\x9d\x3d" } },
    .{ "LookupAccountSidW", MethodRecord{ .library = "ADVAPI32", .import = "LookupAccountSidW", .signature = "\x00\x07\x11\x59\x11\x05\x11\x81\x15\x11\x05\x0f\x09\x11\x05\x0f\x09\x0f\x11\x9d\x3d" } },
    .{ "LookupAccountNameA", MethodRecord{ .library = "ADVAPI32", .import = "LookupAccountNameA", .signature = "\x00\x07\x11\x59\x11\x3d\x11\x3d\x11\x81\x15\x0f\x09\x11\x3d\x0f\x09\x0f\x11\x9d\x3d" } },
    .{ "LookupAccountNameW", MethodRecord{ .library = "ADVAPI32", .import = "LookupAccountNameW", .signature = "\x00\x07\x11\x59\x11\x05\x11\x05\x11\x81\x15\x0f\x09\x11\x05\x0f\x09\x0f\x11\x9d\x3d" } },
    .{ "LookupPrivilegeValueA", MethodRecord{ .library = "ADVAPI32", .import = "LookupPrivilegeValueA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x0f\x11\x93\x69" } },
    .{ "LookupPrivilegeValueW", MethodRecord{ .library = "ADVAPI32", .import = "LookupPrivilegeValueW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x0f\x11\x93\x69" } },
    .{ "LookupPrivilegeNameA", MethodRecord{ .library = "ADVAPI32", .import = "LookupPrivilegeNameA", .signature = "\x00\x04\x11\x59\x11\x3d\x0f\x11\x93\x69\x11\x3d\x0f\x09" } },
    .{ "LookupPrivilegeNameW", MethodRecord{ .library = "ADVAPI32", .import = "LookupPrivilegeNameW", .signature = "\x00\x04\x11\x59\x11\x05\x0f\x11\x93\x69\x11\x05\x0f\x09" } },
    .{ "LookupPrivilegeDisplayNameA", MethodRecord{ .library = "ADVAPI32", .import = "LookupPrivilegeDisplayNameA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x11\x3d\x0f\x09\x0f\x09" } },
    .{ "LookupPrivilegeDisplayNameW", MethodRecord{ .library = "ADVAPI32", .import = "LookupPrivilegeDisplayNameW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x11\x05\x0f\x09\x0f\x09" } },
    .{ "LogonUserA", MethodRecord{ .library = "ADVAPI32", .import = "LogonUserA", .signature = "\x00\x06\x11\x59\x11\x3d\x11\x3d\x11\x3d\x11\x9c\xdd\x11\x9c\xd5\x0f\x11\x80\x85" } },
    .{ "LogonUserW", MethodRecord{ .library = "ADVAPI32", .import = "LogonUserW", .signature = "\x00\x06\x11\x59\x11\x05\x11\x05\x11\x05\x11\x9c\xdd\x11\x9c\xd5\x0f\x11\x80\x85" } },
    .{ "LogonUserExA", MethodRecord{ .library = "ADVAPI32", .import = "LogonUserExA", .signature = "\x00\x0a\x11\x59\x11\x3d\x11\x3d\x11\x3d\x11\x9c\xdd\x11\x9c\xd5\x0f\x11\x80\x85\x0f\x11\x81\x15\x0f\x0f\x01\x0f\x09\x0f\x11\x93\x6d" } },
    .{ "LogonUserExW", MethodRecord{ .library = "ADVAPI32", .import = "LogonUserExW", .signature = "\x00\x0a\x11\x59\x11\x05\x11\x05\x11\x05\x11\x9c\xdd\x11\x9c\xd5\x0f\x11\x80\x85\x0f\x11\x81\x15\x0f\x0f\x01\x0f\x09\x0f\x11\x93\x6d" } },
    .{ "RtlConvertSidToUnicodeString", MethodRecord{ .library = "ntdll", .import = "RtlConvertSidToUnicodeString", .signature = "\x00\x03\x11\x84\x71\x0f\x11\x87\x65\x11\x81\x15\x11\x87\x79" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x115 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSID" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x471 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "NTSTATUS" },
        0x4f9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "OBJECT_SECURITY_INFORMATION" },
        0x765 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "UNICODE_STRING" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0x1361 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "TOKEN_GROUPS" },
        0x1369 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LUID" },
        0x136d => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "QUOTA_LIMITS" },
        0x13c9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "ACL" },
        0x1cd5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "LOGON32_PROVIDER" },
        0x1cd9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "CREATE_RESTRICTED_TOKEN_FLAGS" },
        0x1cdd => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "LOGON32_LOGON" },
        0x1ce1 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "ACE_FLAGS" },
        0x1ce5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_AUTO_INHERIT_FLAGS" },
        0x1ce9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "ACE_REVISION" },
        0x1cfd => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_DESCRIPTOR_CONTROL" },
        0x1d01 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SID_IDENTIFIER_AUTHORITY" },
        0x1d05 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "GENERIC_MAPPING" },
        0x1d09 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PRIVILEGE_SET" },
        0x1d0d => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "OBJECT_TYPE_LIST" },
        0x1d11 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "AUDIT_EVENT_TYPE" },
        0x1d15 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "CLAIM_SECURITY_ATTRIBUTES_INFORMATION" },
        0x1d19 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "TOKEN_PRIVILEGES" },
        0x1d1d => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SID_AND_ATTRIBUTES" },
        0x1d21 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "LUID_AND_ATTRIBUTES" },
        0x1d25 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "WELL_KNOWN_SID_TYPE" },
        0x1d29 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_IMPERSONATION_LEVEL" },
        0x1d2d => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "TOKEN_ACCESS_MASK" },
        0x1d31 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "TOKEN_TYPE" },
        0x1d35 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "ACL_INFORMATION_CLASS" },
        0x1d39 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "TOKEN_INFORMATION_CLASS" },
        0x1d3d => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SID_NAME_USE" },
        else => null,
    };
}

pub const SE_PRIVILEGE_ENABLED = 2;
pub const SE_PRIVILEGE_ENABLED_BY_DEFAULT = 1;
pub const SE_PRIVILEGE_REMOVED = 4;
pub const SE_PRIVILEGE_USED_FOR_ACCESS = 2147483648;
pub const LOGON32_PROVIDER_DEFAULT = 0;
pub const LOGON32_PROVIDER_WINNT50 = 3;
pub const LOGON32_PROVIDER_WINNT40 = 2;
pub const DISABLE_MAX_PRIVILEGE = 1;
pub const SANDBOX_INERT = 2;
pub const LUA_TOKEN = 4;
pub const WRITE_RESTRICTED = 8;
pub const LOGON32_LOGON_BATCH = 4;
pub const LOGON32_LOGON_INTERACTIVE = 2;
pub const LOGON32_LOGON_NETWORK = 3;
pub const LOGON32_LOGON_NETWORK_CLEARTEXT = 8;
pub const LOGON32_LOGON_NEW_CREDENTIALS = 9;
pub const LOGON32_LOGON_SERVICE = 5;
pub const LOGON32_LOGON_UNLOCK = 7;
pub const CONTAINER_INHERIT_ACE = 2;
pub const FAILED_ACCESS_ACE_FLAG = 128;
pub const INHERIT_ONLY_ACE = 8;
pub const INHERITED_ACE = 16;
pub const NO_PROPAGATE_INHERIT_ACE = 4;
pub const OBJECT_INHERIT_ACE = 1;
pub const SUCCESSFUL_ACCESS_ACE_FLAG = 64;
pub const SUB_CONTAINERS_AND_OBJECTS_INHERIT = 3;
pub const SUB_CONTAINERS_ONLY_INHERIT = 2;
pub const SUB_OBJECTS_ONLY_INHERIT = 1;
pub const INHERIT_NO_PROPAGATE = 4;
pub const INHERIT_ONLY = 8;
pub const NO_INHERITANCE = 0;
pub const ATTRIBUTE_SECURITY_INFORMATION = 32;
pub const BACKUP_SECURITY_INFORMATION = 65536;
pub const DACL_SECURITY_INFORMATION = 4;
pub const GROUP_SECURITY_INFORMATION = 2;
pub const LABEL_SECURITY_INFORMATION = 16;
pub const OWNER_SECURITY_INFORMATION = 1;
pub const PROTECTED_DACL_SECURITY_INFORMATION = 2147483648;
pub const PROTECTED_SACL_SECURITY_INFORMATION = 1073741824;
pub const SACL_SECURITY_INFORMATION = 8;
pub const SCOPE_SECURITY_INFORMATION = 64;
pub const UNPROTECTED_DACL_SECURITY_INFORMATION = 536870912;
pub const UNPROTECTED_SACL_SECURITY_INFORMATION = 268435456;
pub const SEF_AVOID_OWNER_CHECK = 16;
pub const SEF_AVOID_OWNER_RESTRICTION = 4096;
pub const SEF_AVOID_PRIVILEGE_CHECK = 8;
pub const SEF_DACL_AUTO_INHERIT = 1;
pub const SEF_DEFAULT_DESCRIPTOR_FOR_OBJECT = 4;
pub const SEF_DEFAULT_GROUP_FROM_PARENT = 64;
pub const SEF_DEFAULT_OWNER_FROM_PARENT = 32;
pub const SEF_MACL_NO_EXECUTE_UP = 1024;
pub const SEF_MACL_NO_READ_UP = 512;
pub const SEF_MACL_NO_WRITE_UP = 256;
pub const SEF_SACL_AUTO_INHERIT = 2;
pub const ACL_REVISION = 2;
pub const ACL_REVISION_DS = 4;
pub const TOKEN_MANDATORY_POLICY_OFF = 0;
pub const TOKEN_MANDATORY_POLICY_NO_WRITE_UP = 1;
pub const TOKEN_MANDATORY_POLICY_NEW_PROCESS_MIN = 2;
pub const TOKEN_MANDATORY_POLICY_VALID_MASK = 3;
pub const ACE_OBJECT_TYPE_PRESENT = 1;
pub const ACE_INHERITED_OBJECT_TYPE_PRESENT = 2;
pub const CLAIM_SECURITY_ATTRIBUTE_NON_INHERITABLE = 1;
pub const CLAIM_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE = 2;
pub const CLAIM_SECURITY_ATTRIBUTE_USE_FOR_DENY_ONLY = 4;
pub const CLAIM_SECURITY_ATTRIBUTE_DISABLED_BY_DEFAULT = 8;
pub const CLAIM_SECURITY_ATTRIBUTE_DISABLED = 16;
pub const CLAIM_SECURITY_ATTRIBUTE_MANDATORY = 32;
pub const CLAIM_SECURITY_ATTRIBUTE_TYPE_INT64 = 1;
pub const CLAIM_SECURITY_ATTRIBUTE_TYPE_UINT64 = 2;
pub const CLAIM_SECURITY_ATTRIBUTE_TYPE_STRING = 3;
pub const CLAIM_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING = 16;
pub const CLAIM_SECURITY_ATTRIBUTE_TYPE_FQBN = 4;
pub const CLAIM_SECURITY_ATTRIBUTE_TYPE_SID = 5;
pub const CLAIM_SECURITY_ATTRIBUTE_TYPE_BOOLEAN = 6;
pub const SE_OWNER_DEFAULTED = 1;
pub const SE_GROUP_DEFAULTED = 2;
pub const SE_DACL_PRESENT = 4;
pub const SE_DACL_DEFAULTED = 8;
pub const SE_SACL_PRESENT = 16;
pub const SE_SACL_DEFAULTED = 32;
pub const SE_DACL_AUTO_INHERIT_REQ = 256;
pub const SE_SACL_AUTO_INHERIT_REQ = 512;
pub const SE_DACL_AUTO_INHERITED = 1024;
pub const SE_SACL_AUTO_INHERITED = 2048;
pub const SE_DACL_PROTECTED = 4096;
pub const SE_SACL_PROTECTED = 8192;
pub const SE_RM_CONTROL_VALID = 16384;
pub const SE_SELF_RELATIVE = 32768;
pub const SECURITY_DYNAMIC_TRACKING = 1;
pub const SECURITY_STATIC_TRACKING = 0;
pub const SECURITY_MAX_SID_SIZE = 68;
pub const cwcHRESULTSTRING = 40;
pub const CVT_SECONDS = 1;
pub const cwcFILENAMESUFFIXMAX = 20;
pub const SIGNING_LEVEL_FILE_CACHE_FLAG_NOT_VALIDATED = 1;
pub const SIGNING_LEVEL_FILE_CACHE_FLAG_VALIDATE_ONLY = 4;
pub const SIGNING_LEVEL_MICROSOFT = 8;
pub const TOKEN_DELETE = 65536;
pub const TOKEN_READ_CONTROL = 131072;
pub const TOKEN_WRITE_DAC = 262144;
pub const TOKEN_WRITE_OWNER = 524288;
pub const TOKEN_ACCESS_SYSTEM_SECURITY = 16777216;
pub const TOKEN_ASSIGN_PRIMARY = 1;
pub const TOKEN_DUPLICATE = 2;
pub const TOKEN_IMPERSONATE = 4;
pub const TOKEN_QUERY = 8;
pub const TOKEN_QUERY_SOURCE = 16;
pub const TOKEN_ADJUST_PRIVILEGES = 32;
pub const TOKEN_ADJUST_GROUPS = 64;
pub const TOKEN_ADJUST_DEFAULT = 128;
pub const TOKEN_ADJUST_SESSIONID = 256;
pub const TOKEN_READ = 131080;
pub const TOKEN_WRITE = 131296;
pub const TOKEN_EXECUTE = 131072;
pub const TOKEN_TRUST_CONSTRAINT_MASK = 131096;
pub const TOKEN_ACCESS_PSEUDO_HANDLE_WIN8 = 24;
pub const TOKEN_ACCESS_PSEUDO_HANDLE = 24;
pub const TOKEN_ALL_ACCESS = 983551;
pub const ENUM_PERIOD_INVALID = -1;
pub const ENUM_PERIOD_SECONDS = 0;
pub const ENUM_PERIOD_MINUTES = 1;
pub const ENUM_PERIOD_HOURS = 2;
pub const ENUM_PERIOD_DAYS = 3;
pub const ENUM_PERIOD_WEEKS = 4;
pub const ENUM_PERIOD_MONTHS = 5;
pub const ENUM_PERIOD_YEARS = 6;
pub const SidTypeUser = 1;
pub const SidTypeGroup = 2;
pub const SidTypeDomain = 3;
pub const SidTypeAlias = 4;
pub const SidTypeWellKnownGroup = 5;
pub const SidTypeDeletedAccount = 6;
pub const SidTypeInvalid = 7;
pub const SidTypeUnknown = 8;
pub const SidTypeComputer = 9;
pub const SidTypeLabel = 10;
pub const SidTypeLogonSession = 11;
pub const WinNullSid = 0;
pub const WinWorldSid = 1;
pub const WinLocalSid = 2;
pub const WinCreatorOwnerSid = 3;
pub const WinCreatorGroupSid = 4;
pub const WinCreatorOwnerServerSid = 5;
pub const WinCreatorGroupServerSid = 6;
pub const WinNtAuthoritySid = 7;
pub const WinDialupSid = 8;
pub const WinNetworkSid = 9;
pub const WinBatchSid = 10;
pub const WinInteractiveSid = 11;
pub const WinServiceSid = 12;
pub const WinAnonymousSid = 13;
pub const WinProxySid = 14;
pub const WinEnterpriseControllersSid = 15;
pub const WinSelfSid = 16;
pub const WinAuthenticatedUserSid = 17;
pub const WinRestrictedCodeSid = 18;
pub const WinTerminalServerSid = 19;
pub const WinRemoteLogonIdSid = 20;
pub const WinLogonIdsSid = 21;
pub const WinLocalSystemSid = 22;
pub const WinLocalServiceSid = 23;
pub const WinNetworkServiceSid = 24;
pub const WinBuiltinDomainSid = 25;
pub const WinBuiltinAdministratorsSid = 26;
pub const WinBuiltinUsersSid = 27;
pub const WinBuiltinGuestsSid = 28;
pub const WinBuiltinPowerUsersSid = 29;
pub const WinBuiltinAccountOperatorsSid = 30;
pub const WinBuiltinSystemOperatorsSid = 31;
pub const WinBuiltinPrintOperatorsSid = 32;
pub const WinBuiltinBackupOperatorsSid = 33;
pub const WinBuiltinReplicatorSid = 34;
pub const WinBuiltinPreWindows2000CompatibleAccessSid = 35;
pub const WinBuiltinRemoteDesktopUsersSid = 36;
pub const WinBuiltinNetworkConfigurationOperatorsSid = 37;
pub const WinAccountAdministratorSid = 38;
pub const WinAccountGuestSid = 39;
pub const WinAccountKrbtgtSid = 40;
pub const WinAccountDomainAdminsSid = 41;
pub const WinAccountDomainUsersSid = 42;
pub const WinAccountDomainGuestsSid = 43;
pub const WinAccountComputersSid = 44;
pub const WinAccountControllersSid = 45;
pub const WinAccountCertAdminsSid = 46;
pub const WinAccountSchemaAdminsSid = 47;
pub const WinAccountEnterpriseAdminsSid = 48;
pub const WinAccountPolicyAdminsSid = 49;
pub const WinAccountRasAndIasServersSid = 50;
pub const WinNTLMAuthenticationSid = 51;
pub const WinDigestAuthenticationSid = 52;
pub const WinSChannelAuthenticationSid = 53;
pub const WinThisOrganizationSid = 54;
pub const WinOtherOrganizationSid = 55;
pub const WinBuiltinIncomingForestTrustBuildersSid = 56;
pub const WinBuiltinPerfMonitoringUsersSid = 57;
pub const WinBuiltinPerfLoggingUsersSid = 58;
pub const WinBuiltinAuthorizationAccessSid = 59;
pub const WinBuiltinTerminalServerLicenseServersSid = 60;
pub const WinBuiltinDCOMUsersSid = 61;
pub const WinBuiltinIUsersSid = 62;
pub const WinIUserSid = 63;
pub const WinBuiltinCryptoOperatorsSid = 64;
pub const WinUntrustedLabelSid = 65;
pub const WinLowLabelSid = 66;
pub const WinMediumLabelSid = 67;
pub const WinHighLabelSid = 68;
pub const WinSystemLabelSid = 69;
pub const WinWriteRestrictedCodeSid = 70;
pub const WinCreatorOwnerRightsSid = 71;
pub const WinCacheablePrincipalsGroupSid = 72;
pub const WinNonCacheablePrincipalsGroupSid = 73;
pub const WinEnterpriseReadonlyControllersSid = 74;
pub const WinAccountReadonlyControllersSid = 75;
pub const WinBuiltinEventLogReadersGroup = 76;
pub const WinNewEnterpriseReadonlyControllersSid = 77;
pub const WinBuiltinCertSvcDComAccessGroup = 78;
pub const WinMediumPlusLabelSid = 79;
pub const WinLocalLogonSid = 80;
pub const WinConsoleLogonSid = 81;
pub const WinThisOrganizationCertificateSid = 82;
pub const WinApplicationPackageAuthoritySid = 83;
pub const WinBuiltinAnyPackageSid = 84;
pub const WinCapabilityInternetClientSid = 85;
pub const WinCapabilityInternetClientServerSid = 86;
pub const WinCapabilityPrivateNetworkClientServerSid = 87;
pub const WinCapabilityPicturesLibrarySid = 88;
pub const WinCapabilityVideosLibrarySid = 89;
pub const WinCapabilityMusicLibrarySid = 90;
pub const WinCapabilityDocumentsLibrarySid = 91;
pub const WinCapabilitySharedUserCertificatesSid = 92;
pub const WinCapabilityEnterpriseAuthenticationSid = 93;
pub const WinCapabilityRemovableStorageSid = 94;
pub const WinBuiltinRDSRemoteAccessServersSid = 95;
pub const WinBuiltinRDSEndpointServersSid = 96;
pub const WinBuiltinRDSManagementServersSid = 97;
pub const WinUserModeDriversSid = 98;
pub const WinBuiltinHyperVAdminsSid = 99;
pub const WinAccountCloneableControllersSid = 100;
pub const WinBuiltinAccessControlAssistanceOperatorsSid = 101;
pub const WinBuiltinRemoteManagementUsersSid = 102;
pub const WinAuthenticationAuthorityAssertedSid = 103;
pub const WinAuthenticationServiceAssertedSid = 104;
pub const WinLocalAccountSid = 105;
pub const WinLocalAccountAndAdministratorSid = 106;
pub const WinAccountProtectedUsersSid = 107;
pub const WinCapabilityAppointmentsSid = 108;
pub const WinCapabilityContactsSid = 109;
pub const WinAccountDefaultSystemManagedSid = 110;
pub const WinBuiltinDefaultSystemManagedGroupSid = 111;
pub const WinBuiltinStorageReplicaAdminsSid = 112;
pub const WinAccountKeyAdminsSid = 113;
pub const WinAccountEnterpriseKeyAdminsSid = 114;
pub const WinAuthenticationKeyTrustSid = 115;
pub const WinAuthenticationKeyPropertyMFASid = 116;
pub const WinAuthenticationKeyPropertyAttestationSid = 117;
pub const WinAuthenticationFreshKeyAuthSid = 118;
pub const WinBuiltinDeviceOwnersSid = 119;
pub const WinBuiltinUserModeHardwareOperatorsSid = 120;
pub const WinBuiltinOpenSSHUsersSid = 121;
pub const AclRevisionInformation = 1;
pub const AclSizeInformation = 2;
pub const AuditEventObjectAccess = 0;
pub const AuditEventDirectoryServiceAccess = 1;
pub const SecurityAnonymous = 0;
pub const SecurityIdentification = 1;
pub const SecurityImpersonation = 2;
pub const SecurityDelegation = 3;
pub const TokenPrimary = 1;
pub const TokenImpersonation = 2;
pub const TokenElevationTypeDefault = 1;
pub const TokenElevationTypeFull = 2;
pub const TokenElevationTypeLimited = 3;
pub const TokenUser = 1;
pub const TokenGroups = 2;
pub const TokenPrivileges = 3;
pub const TokenOwner = 4;
pub const TokenPrimaryGroup = 5;
pub const TokenDefaultDacl = 6;
pub const TokenSource = 7;
pub const TokenType = 8;
pub const TokenImpersonationLevel = 9;
pub const TokenStatistics = 10;
pub const TokenRestrictedSids = 11;
pub const TokenSessionId = 12;
pub const TokenGroupsAndPrivileges = 13;
pub const TokenSessionReference = 14;
pub const TokenSandBoxInert = 15;
pub const TokenAuditPolicy = 16;
pub const TokenOrigin = 17;
pub const TokenElevationType = 18;
pub const TokenLinkedToken = 19;
pub const TokenElevation = 20;
pub const TokenHasRestrictions = 21;
pub const TokenAccessInformation = 22;
pub const TokenVirtualizationAllowed = 23;
pub const TokenVirtualizationEnabled = 24;
pub const TokenIntegrityLevel = 25;
pub const TokenUIAccess = 26;
pub const TokenMandatoryPolicy = 27;
pub const TokenLogonSid = 28;
pub const TokenIsAppContainer = 29;
pub const TokenCapabilities = 30;
pub const TokenAppContainerSid = 31;
pub const TokenAppContainerNumber = 32;
pub const TokenUserClaimAttributes = 33;
pub const TokenDeviceClaimAttributes = 34;
pub const TokenRestrictedUserClaimAttributes = 35;
pub const TokenRestrictedDeviceClaimAttributes = 36;
pub const TokenDeviceGroups = 37;
pub const TokenRestrictedDeviceGroups = 38;
pub const TokenSecurityAttributes = 39;
pub const TokenIsRestricted = 40;
pub const TokenProcessTrustLevel = 41;
pub const TokenPrivateNameSpace = 42;
pub const TokenSingletonAttributes = 43;
pub const TokenBnoIsolation = 44;
pub const TokenChildProcessFlags = 45;
pub const TokenIsLessPrivilegedAppContainer = 46;
pub const TokenIsSandboxed = 47;
pub const TokenIsAppSilo = 48;
pub const TokenLoggingInformation = 49;
pub const TokenLearningMode = 50;
pub const MaxTokenInfoClass = 51;
pub const MandatoryLevelUntrusted = 0;
pub const MandatoryLevelLow = 1;
pub const MandatoryLevelMedium = 2;
pub const MandatoryLevelHigh = 3;
pub const MandatoryLevelSystem = 4;
pub const MandatoryLevelSecureProcess = 5;
pub const MandatoryLevelCount = 6;

pub const aliases = struct {
    pub const TOKEN_PRIVILEGES_ATTRIBUTES = u32;
    pub const LOGON32_PROVIDER = u32;
    pub const CREATE_RESTRICTED_TOKEN_FLAGS = u32;
    pub const LOGON32_LOGON = u32;
    pub const ACE_FLAGS = u32;
    pub const OBJECT_SECURITY_INFORMATION = u32;
    pub const SECURITY_AUTO_INHERIT_FLAGS = u32;
    pub const ACE_REVISION = u32;
    pub const TOKEN_MANDATORY_POLICY_ID = u32;
    pub const SYSTEM_AUDIT_OBJECT_ACE_FLAGS = u32;
    pub const CLAIM_SECURITY_ATTRIBUTE_FLAGS = u32;
    pub const CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE = u16;
    pub const SECURITY_DESCRIPTOR_CONTROL = u16;
    pub const TOKEN_ACCESS_MASK = u32;
    pub const ENUM_PERIOD = i32;
    pub const SID_NAME_USE = i32;
    pub const WELL_KNOWN_SID_TYPE = i32;
    pub const ACL_INFORMATION_CLASS = i32;
    pub const AUDIT_EVENT_TYPE = i32;
    pub const SECURITY_IMPERSONATION_LEVEL = i32;
    pub const TOKEN_TYPE = i32;
    pub const TOKEN_ELEVATION_TYPE = i32;
    pub const TOKEN_INFORMATION_CLASS = i32;
    pub const MANDATORY_LEVEL = i32;
};
