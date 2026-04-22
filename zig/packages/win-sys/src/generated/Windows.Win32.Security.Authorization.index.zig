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
    .{ "AuthzAccessCheck", MethodRecord{ .library = "AUTHZ", .import = "AuthzAccessCheck", .signature = "\x00\x09\x11\x59\x11\x9b\x65\x11\xbb\xa9\x0f\x11\xbb\xad\x11\xbb\xb1\x11\x82\xad\x0f\x11\x82\xad\x09\x0f\x11\xbb\xb5\x0f\x11\xbb\xb9" } },
    .{ "AuthzCachedAccessCheck", MethodRecord{ .library = "AUTHZ", .import = "AuthzCachedAccessCheck", .signature = "\x00\x05\x11\x59\x09\x11\xbb\xb9\x0f\x11\xbb\xad\x11\xbb\xb1\x0f\x11\xbb\xb5" } },
    .{ "AuthzOpenObjectAudit", MethodRecord{ .library = "AUTHZ", .import = "AuthzOpenObjectAudit", .signature = "\x00\x08\x11\x59\x09\x11\xbb\xa9\x0f\x11\xbb\xad\x11\xbb\xb1\x11\x82\xad\x0f\x11\x82\xad\x09\x0f\x11\xbb\xb5" } },
    .{ "AuthzFreeHandle", MethodRecord{ .library = "AUTHZ", .import = "AuthzFreeHandle", .signature = "\x00\x01\x11\x59\x11\xbb\xb9" } },
    .{ "AuthzInitializeResourceManager", MethodRecord{ .library = "AUTHZ", .import = "AuthzInitializeResourceManager", .signature = "\x00\x06\x11\x59\x09\x12\xbb\xbd\x12\xbb\xc1\x12\xbb\xc5\x11\x05\x0f\x11\xbb\xc9" } },
    .{ "AuthzInitializeResourceManagerEx", MethodRecord{ .library = "AUTHZ", .import = "AuthzInitializeResourceManagerEx", .signature = "\x00\x03\x11\x59\x11\x9b\x61\x0f\x11\xbb\xcd\x0f\x11\xbb\xc9" } },
    .{ "AuthzInitializeRemoteResourceManager", MethodRecord{ .library = "AUTHZ", .import = "AuthzInitializeRemoteResourceManager", .signature = "\x00\x02\x11\x59\x0f\x11\xbb\xd1\x0f\x11\xbb\xc9" } },
    .{ "AuthzFreeResourceManager", MethodRecord{ .library = "AUTHZ", .import = "AuthzFreeResourceManager", .signature = "\x00\x01\x11\x59\x11\xbb\xc9" } },
    .{ "AuthzInitializeContextFromToken", MethodRecord{ .library = "AUTHZ", .import = "AuthzInitializeContextFromToken", .signature = "\x00\x07\x11\x59\x09\x11\x80\x85\x11\xbb\xc9\x0f\x0a\x11\x93\x69\x0f\x01\x0f\x11\xbb\xa9" } },
    .{ "AuthzInitializeContextFromSid", MethodRecord{ .library = "AUTHZ", .import = "AuthzInitializeContextFromSid", .signature = "\x00\x07\x11\x59\x09\x11\x81\x15\x11\xbb\xc9\x0f\x0a\x11\x93\x69\x0f\x01\x0f\x11\xbb\xa9" } },
    .{ "AuthzInitializeContextFromAuthzContext", MethodRecord{ .library = "AUTHZ", .import = "AuthzInitializeContextFromAuthzContext", .signature = "\x00\x06\x11\x59\x09\x11\xbb\xa9\x0f\x0a\x11\x93\x69\x0f\x01\x0f\x11\xbb\xa9" } },
    .{ "AuthzInitializeCompoundContext", MethodRecord{ .library = "AUTHZ", .import = "AuthzInitializeCompoundContext", .signature = "\x00\x03\x11\x59\x11\xbb\xa9\x11\xbb\xa9\x0f\x11\xbb\xa9" } },
    .{ "AuthzAddSidsToContext", MethodRecord{ .library = "AUTHZ", .import = "AuthzAddSidsToContext", .signature = "\x00\x06\x11\x59\x11\xbb\xa9\x0f\x11\x9d\x1d\x09\x0f\x11\x9d\x1d\x09\x0f\x11\xbb\xa9" } },
    .{ "AuthzModifySecurityAttributes", MethodRecord{ .library = "AUTHZ", .import = "AuthzModifySecurityAttributes", .signature = "\x00\x03\x11\x59\x11\xbb\xa9\x0f\x11\xbb\xd5\x0f\x11\xbb\xd9" } },
    .{ "AuthzModifyClaims", MethodRecord{ .library = "AUTHZ", .import = "AuthzModifyClaims", .signature = "\x00\x04\x11\x59\x11\xbb\xa9\x11\xbb\xdd\x0f\x11\xbb\xd5\x0f\x11\xbb\xd9" } },
    .{ "AuthzModifySids", MethodRecord{ .library = "AUTHZ", .import = "AuthzModifySids", .signature = "\x00\x04\x11\x59\x11\xbb\xa9\x11\xbb\xdd\x0f\x11\xbb\xe1\x0f\x11\x93\x61" } },
    .{ "AuthzSetAppContainerInformation", MethodRecord{ .library = "AUTHZ", .import = "AuthzSetAppContainerInformation", .signature = "\x00\x04\x11\x59\x11\xbb\xa9\x11\x81\x15\x09\x0f\x11\x9d\x1d" } },
    .{ "AuthzGetInformationFromContext", MethodRecord{ .library = "AUTHZ", .import = "AuthzGetInformationFromContext", .signature = "\x00\x05\x11\x59\x11\xbb\xa9\x11\xbb\xdd\x09\x0f\x09\x0f\x01" } },
    .{ "AuthzFreeContext", MethodRecord{ .library = "AUTHZ", .import = "AuthzFreeContext", .signature = "\x00\x01\x11\x59\x11\xbb\xa9" } },
    .{ "AuthzInitializeObjectAccessAuditEvent", MethodRecord{ .library = "AUTHZ", .import = "AuthzInitializeObjectAccessAuditEvent", .signature = "\x05\x08\x11\x59\x11\x9b\x69\x11\xbb\xe5\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x11\xbb\xb1\x09" } },
    .{ "AuthzInitializeObjectAccessAuditEvent2", MethodRecord{ .library = "AUTHZ", .import = "AuthzInitializeObjectAccessAuditEvent2", .signature = "\x05\x09\x11\x59\x09\x11\xbb\xe5\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x11\xbb\xb1\x09" } },
    .{ "AuthzFreeAuditEvent", MethodRecord{ .library = "AUTHZ", .import = "AuthzFreeAuditEvent", .signature = "\x00\x01\x11\x59\x11\xbb\xb1" } },
    .{ "AuthzEvaluateSacl", MethodRecord{ .library = "AUTHZ", .import = "AuthzEvaluateSacl", .signature = "\x00\x06\x11\x59\x11\xbb\xa9\x0f\x11\xbb\xad\x0f\x11\x93\xc9\x09\x11\x59\x0f\x11\x59" } },
    .{ "AuthzInstallSecurityEventSource", MethodRecord{ .library = "AUTHZ", .import = "AuthzInstallSecurityEventSource", .signature = "\x00\x02\x11\x59\x09\x0f\x11\xbb\xe9" } },
    .{ "AuthzUninstallSecurityEventSource", MethodRecord{ .library = "AUTHZ", .import = "AuthzUninstallSecurityEventSource", .signature = "\x00\x02\x11\x59\x09\x11\x05" } },
    .{ "AuthzEnumerateSecurityEventSources", MethodRecord{ .library = "AUTHZ", .import = "AuthzEnumerateSecurityEventSources", .signature = "\x00\x04\x11\x59\x09\x0f\x11\xbb\xe9\x0f\x09\x0f\x09" } },
    .{ "AuthzRegisterSecurityEventSource", MethodRecord{ .library = "AUTHZ", .import = "AuthzRegisterSecurityEventSource", .signature = "\x00\x03\x11\x59\x09\x11\x05\x0f\x11\xbb\xed" } },
    .{ "AuthzUnregisterSecurityEventSource", MethodRecord{ .library = "AUTHZ", .import = "AuthzUnregisterSecurityEventSource", .signature = "\x00\x02\x11\x59\x09\x0f\x11\xbb\xed" } },
    .{ "AuthzReportSecurityEvent", MethodRecord{ .library = "AUTHZ", .import = "AuthzReportSecurityEvent", .signature = "\x05\x05\x11\x59\x09\x11\xbb\xed\x09\x11\x81\x15\x09" } },
    .{ "AuthzReportSecurityEventFromParams", MethodRecord{ .library = "AUTHZ", .import = "AuthzReportSecurityEventFromParams", .signature = "\x00\x05\x11\x59\x09\x11\xbb\xed\x09\x11\x81\x15\x0f\x11\xbb\xf1" } },
    .{ "AuthzRegisterCapChangeNotification", MethodRecord{ .library = "AUTHZ", .import = "AuthzRegisterCapChangeNotification", .signature = "\x00\x03\x11\x59\x0f\x11\xbb\xf5\x12\x9f\x81\x0f\x01" } },
    .{ "AuthzUnregisterCapChangeNotification", MethodRecord{ .library = "AUTHZ", .import = "AuthzUnregisterCapChangeNotification", .signature = "\x00\x01\x11\x59\x11\xbb\xf5" } },
    .{ "AuthzFreeCentralAccessPolicyCache", MethodRecord{ .library = "AUTHZ", .import = "AuthzFreeCentralAccessPolicyCache", .signature = "\x00\x00\x11\x59" } },
    .{ "SetEntriesInAclA", MethodRecord{ .library = "ADVAPI32", .import = "SetEntriesInAclA", .signature = "\x00\x04\x11\x81\x01\x09\x0f\x11\xbb\xf9\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9" } },
    .{ "SetEntriesInAclW", MethodRecord{ .library = "ADVAPI32", .import = "SetEntriesInAclW", .signature = "\x00\x04\x11\x81\x01\x09\x0f\x11\xbb\xfd\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9" } },
    .{ "GetExplicitEntriesFromAclA", MethodRecord{ .library = "ADVAPI32", .import = "GetExplicitEntriesFromAclA", .signature = "\x00\x03\x11\x81\x01\x0f\x11\x93\xc9\x0f\x09\x0f\x0f\x11\xbb\xf9" } },
    .{ "GetExplicitEntriesFromAclW", MethodRecord{ .library = "ADVAPI32", .import = "GetExplicitEntriesFromAclW", .signature = "\x00\x03\x11\x81\x01\x0f\x11\x93\xc9\x0f\x09\x0f\x0f\x11\xbb\xfd" } },
    .{ "GetEffectiveRightsFromAclA", MethodRecord{ .library = "ADVAPI32", .import = "GetEffectiveRightsFromAclA", .signature = "\x00\x03\x11\x81\x01\x0f\x11\x93\xc9\x0f\x11\xbc\x01\x0f\x09" } },
    .{ "GetEffectiveRightsFromAclW", MethodRecord{ .library = "ADVAPI32", .import = "GetEffectiveRightsFromAclW", .signature = "\x00\x03\x11\x81\x01\x0f\x11\x93\xc9\x0f\x11\xbc\x05\x0f\x09" } },
    .{ "GetAuditedPermissionsFromAclA", MethodRecord{ .library = "ADVAPI32", .import = "GetAuditedPermissionsFromAclA", .signature = "\x00\x04\x11\x81\x01\x0f\x11\x93\xc9\x0f\x11\xbc\x01\x0f\x09\x0f\x09" } },
    .{ "GetAuditedPermissionsFromAclW", MethodRecord{ .library = "ADVAPI32", .import = "GetAuditedPermissionsFromAclW", .signature = "\x00\x04\x11\x81\x01\x0f\x11\x93\xc9\x0f\x11\xbc\x05\x0f\x09\x0f\x09" } },
    .{ "GetNamedSecurityInfoA", MethodRecord{ .library = "ADVAPI32", .import = "GetNamedSecurityInfoA", .signature = "\x00\x08\x11\x81\x01\x11\x3d\x11\xbc\x09\x11\x84\xf9\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "GetNamedSecurityInfoW", MethodRecord{ .library = "ADVAPI32", .import = "GetNamedSecurityInfoW", .signature = "\x00\x08\x11\x81\x01\x11\x05\x11\xbc\x09\x11\x84\xf9\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "GetSecurityInfo", MethodRecord{ .library = "ADVAPI32", .import = "GetSecurityInfo", .signature = "\x00\x08\x11\x81\x01\x11\x80\x85\x11\xbc\x09\x11\x84\xf9\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "SetNamedSecurityInfoA", MethodRecord{ .library = "ADVAPI32", .import = "SetNamedSecurityInfoA", .signature = "\x00\x07\x11\x81\x01\x11\x3d\x11\xbc\x09\x11\x84\xf9\x11\x81\x15\x11\x81\x15\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "SetNamedSecurityInfoW", MethodRecord{ .library = "ADVAPI32", .import = "SetNamedSecurityInfoW", .signature = "\x00\x07\x11\x81\x01\x11\x05\x11\xbc\x09\x11\x84\xf9\x11\x81\x15\x11\x81\x15\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "SetSecurityInfo", MethodRecord{ .library = "ADVAPI32", .import = "SetSecurityInfo", .signature = "\x00\x07\x11\x81\x01\x11\x80\x85\x11\xbc\x09\x11\x84\xf9\x11\x81\x15\x11\x81\x15\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "GetInheritanceSourceA", MethodRecord{ .library = "ADVAPI32", .import = "GetInheritanceSourceA", .signature = "\x00\x0a\x11\x81\x01\x11\x3d\x11\xbc\x09\x11\x84\xf9\x11\x59\x0f\x0f\x11\x0d\x09\x0f\x11\x93\xc9\x0f\x11\xbc\x0d\x0f\x11\x9d\x05\x0f\x11\xbc\x11" } },
    .{ "GetInheritanceSourceW", MethodRecord{ .library = "ADVAPI32", .import = "GetInheritanceSourceW", .signature = "\x00\x0a\x11\x81\x01\x11\x05\x11\xbc\x09\x11\x84\xf9\x11\x59\x0f\x0f\x11\x0d\x09\x0f\x11\x93\xc9\x0f\x11\xbc\x0d\x0f\x11\x9d\x05\x0f\x11\xbc\x15" } },
    .{ "FreeInheritedFromArray", MethodRecord{ .library = "ADVAPI32", .import = "FreeInheritedFromArray", .signature = "\x00\x03\x11\x81\x01\x0f\x11\xbc\x15\x07\x0f\x11\xbc\x0d" } },
    .{ "TreeResetNamedSecurityInfoA", MethodRecord{ .library = "ADVAPI32", .import = "TreeResetNamedSecurityInfoA", .signature = "\x00\x0b\x11\x81\x01\x11\x3d\x11\xbc\x09\x11\x84\xf9\x11\x81\x15\x11\x81\x15\x0f\x11\x93\xc9\x0f\x11\x93\xc9\x11\x59\x12\xbc\x19\x11\xbc\x1d\x0f\x01" } },
    .{ "TreeResetNamedSecurityInfoW", MethodRecord{ .library = "ADVAPI32", .import = "TreeResetNamedSecurityInfoW", .signature = "\x00\x0b\x11\x81\x01\x11\x05\x11\xbc\x09\x11\x84\xf9\x11\x81\x15\x11\x81\x15\x0f\x11\x93\xc9\x0f\x11\x93\xc9\x11\x59\x12\xbc\x19\x11\xbc\x1d\x0f\x01" } },
    .{ "TreeSetNamedSecurityInfoA", MethodRecord{ .library = "ADVAPI32", .import = "TreeSetNamedSecurityInfoA", .signature = "\x00\x0b\x11\x81\x01\x11\x3d\x11\xbc\x09\x11\x84\xf9\x11\x81\x15\x11\x81\x15\x0f\x11\x93\xc9\x0f\x11\x93\xc9\x11\x9b\x6d\x12\xbc\x19\x11\xbc\x1d\x0f\x01" } },
    .{ "TreeSetNamedSecurityInfoW", MethodRecord{ .library = "ADVAPI32", .import = "TreeSetNamedSecurityInfoW", .signature = "\x00\x0b\x11\x81\x01\x11\x05\x11\xbc\x09\x11\x84\xf9\x11\x81\x15\x11\x81\x15\x0f\x11\x93\xc9\x0f\x11\x93\xc9\x11\x9b\x6d\x12\xbc\x19\x11\xbc\x1d\x0f\x01" } },
    .{ "BuildSecurityDescriptorA", MethodRecord{ .library = "ADVAPI32", .import = "BuildSecurityDescriptorA", .signature = "\x00\x09\x11\x81\x01\x0f\x11\xbc\x01\x0f\x11\xbc\x01\x09\x0f\x11\xbb\xf9\x09\x0f\x11\xbb\xf9\x11\x82\xad\x0f\x09\x0f\x11\x82\xad" } },
    .{ "BuildSecurityDescriptorW", MethodRecord{ .library = "ADVAPI32", .import = "BuildSecurityDescriptorW", .signature = "\x00\x09\x11\x81\x01\x0f\x11\xbc\x05\x0f\x11\xbc\x05\x09\x0f\x11\xbb\xfd\x09\x0f\x11\xbb\xfd\x11\x82\xad\x0f\x09\x0f\x11\x82\xad" } },
    .{ "LookupSecurityDescriptorPartsA", MethodRecord{ .library = "ADVAPI32", .import = "LookupSecurityDescriptorPartsA", .signature = "\x00\x07\x11\x81\x01\x0f\x0f\x11\xbc\x01\x0f\x0f\x11\xbc\x01\x0f\x09\x0f\x0f\x11\xbb\xf9\x0f\x09\x0f\x0f\x11\xbb\xf9\x11\x82\xad" } },
    .{ "LookupSecurityDescriptorPartsW", MethodRecord{ .library = "ADVAPI32", .import = "LookupSecurityDescriptorPartsW", .signature = "\x00\x07\x11\x81\x01\x0f\x0f\x11\xbc\x05\x0f\x0f\x11\xbc\x05\x0f\x09\x0f\x0f\x11\xbb\xfd\x0f\x09\x0f\x0f\x11\xbb\xfd\x11\x82\xad" } },
    .{ "BuildExplicitAccessWithNameA", MethodRecord{ .library = "ADVAPI32", .import = "BuildExplicitAccessWithNameA", .signature = "\x00\x05\x01\x0f\x11\xbb\xf9\x11\x3d\x09\x11\xbc\x21\x11\x9c\xe1" } },
    .{ "BuildExplicitAccessWithNameW", MethodRecord{ .library = "ADVAPI32", .import = "BuildExplicitAccessWithNameW", .signature = "\x00\x05\x01\x0f\x11\xbb\xfd\x11\x05\x09\x11\xbc\x21\x11\x9c\xe1" } },
    .{ "BuildImpersonateExplicitAccessWithNameA", MethodRecord{ .library = "ADVAPI32", .import = "BuildImpersonateExplicitAccessWithNameA", .signature = "\x00\x06\x01\x0f\x11\xbb\xf9\x11\x3d\x0f\x11\xbc\x01\x09\x11\xbc\x21\x09" } },
    .{ "BuildImpersonateExplicitAccessWithNameW", MethodRecord{ .library = "ADVAPI32", .import = "BuildImpersonateExplicitAccessWithNameW", .signature = "\x00\x06\x01\x0f\x11\xbb\xfd\x11\x05\x0f\x11\xbc\x05\x09\x11\xbc\x21\x09" } },
    .{ "BuildTrusteeWithNameA", MethodRecord{ .library = "ADVAPI32", .import = "BuildTrusteeWithNameA", .signature = "\x00\x02\x01\x0f\x11\xbc\x01\x11\x3d" } },
    .{ "BuildTrusteeWithNameW", MethodRecord{ .library = "ADVAPI32", .import = "BuildTrusteeWithNameW", .signature = "\x00\x02\x01\x0f\x11\xbc\x05\x11\x05" } },
    .{ "BuildImpersonateTrusteeA", MethodRecord{ .library = "ADVAPI32", .import = "BuildImpersonateTrusteeA", .signature = "\x00\x02\x01\x0f\x11\xbc\x01\x0f\x11\xbc\x01" } },
    .{ "BuildImpersonateTrusteeW", MethodRecord{ .library = "ADVAPI32", .import = "BuildImpersonateTrusteeW", .signature = "\x00\x02\x01\x0f\x11\xbc\x05\x0f\x11\xbc\x05" } },
    .{ "BuildTrusteeWithSidA", MethodRecord{ .library = "ADVAPI32", .import = "BuildTrusteeWithSidA", .signature = "\x00\x02\x01\x0f\x11\xbc\x01\x11\x81\x15" } },
    .{ "BuildTrusteeWithSidW", MethodRecord{ .library = "ADVAPI32", .import = "BuildTrusteeWithSidW", .signature = "\x00\x02\x01\x0f\x11\xbc\x05\x11\x81\x15" } },
    .{ "BuildTrusteeWithObjectsAndSidA", MethodRecord{ .library = "ADVAPI32", .import = "BuildTrusteeWithObjectsAndSidA", .signature = "\x00\x05\x01\x0f\x11\xbc\x01\x0f\x11\xbc\x25\x0f\x11\x0d\x0f\x11\x0d\x11\x81\x15" } },
    .{ "BuildTrusteeWithObjectsAndSidW", MethodRecord{ .library = "ADVAPI32", .import = "BuildTrusteeWithObjectsAndSidW", .signature = "\x00\x05\x01\x0f\x11\xbc\x05\x0f\x11\xbc\x25\x0f\x11\x0d\x0f\x11\x0d\x11\x81\x15" } },
    .{ "BuildTrusteeWithObjectsAndNameA", MethodRecord{ .library = "ADVAPI32", .import = "BuildTrusteeWithObjectsAndNameA", .signature = "\x00\x06\x01\x0f\x11\xbc\x01\x0f\x11\xbc\x29\x11\xbc\x09\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "BuildTrusteeWithObjectsAndNameW", MethodRecord{ .library = "ADVAPI32", .import = "BuildTrusteeWithObjectsAndNameW", .signature = "\x00\x06\x01\x0f\x11\xbc\x05\x0f\x11\xbc\x2d\x11\xbc\x09\x11\x05\x11\x05\x11\x05" } },
    .{ "GetTrusteeNameA", MethodRecord{ .library = "ADVAPI32", .import = "GetTrusteeNameA", .signature = "\x00\x01\x11\x3d\x0f\x11\xbc\x01" } },
    .{ "GetTrusteeNameW", MethodRecord{ .library = "ADVAPI32", .import = "GetTrusteeNameW", .signature = "\x00\x01\x11\x05\x0f\x11\xbc\x05" } },
    .{ "GetTrusteeTypeA", MethodRecord{ .library = "ADVAPI32", .import = "GetTrusteeTypeA", .signature = "\x00\x01\x11\xbc\x31\x0f\x11\xbc\x01" } },
    .{ "GetTrusteeTypeW", MethodRecord{ .library = "ADVAPI32", .import = "GetTrusteeTypeW", .signature = "\x00\x01\x11\xbc\x31\x0f\x11\xbc\x05" } },
    .{ "GetTrusteeFormA", MethodRecord{ .library = "ADVAPI32", .import = "GetTrusteeFormA", .signature = "\x00\x01\x11\xbc\x35\x0f\x11\xbc\x01" } },
    .{ "GetTrusteeFormW", MethodRecord{ .library = "ADVAPI32", .import = "GetTrusteeFormW", .signature = "\x00\x01\x11\xbc\x35\x0f\x11\xbc\x05" } },
    .{ "GetMultipleTrusteeOperationA", MethodRecord{ .library = "ADVAPI32", .import = "GetMultipleTrusteeOperationA", .signature = "\x00\x01\x11\xbc\x39\x0f\x11\xbc\x01" } },
    .{ "GetMultipleTrusteeOperationW", MethodRecord{ .library = "ADVAPI32", .import = "GetMultipleTrusteeOperationW", .signature = "\x00\x01\x11\xbc\x39\x0f\x11\xbc\x05" } },
    .{ "GetMultipleTrusteeA", MethodRecord{ .library = "ADVAPI32", .import = "GetMultipleTrusteeA", .signature = "\x00\x01\x0f\x11\xbc\x01\x0f\x11\xbc\x01" } },
    .{ "GetMultipleTrusteeW", MethodRecord{ .library = "ADVAPI32", .import = "GetMultipleTrusteeW", .signature = "\x00\x01\x0f\x11\xbc\x05\x0f\x11\xbc\x05" } },
    .{ "ConvertSidToStringSidA", MethodRecord{ .library = "ADVAPI32", .import = "ConvertSidToStringSidA", .signature = "\x00\x02\x11\x59\x11\x81\x15\x0f\x11\x3d" } },
    .{ "ConvertSidToStringSidW", MethodRecord{ .library = "ADVAPI32", .import = "ConvertSidToStringSidW", .signature = "\x00\x02\x11\x59\x11\x81\x15\x0f\x11\x05" } },
    .{ "ConvertStringSidToSidA", MethodRecord{ .library = "ADVAPI32", .import = "ConvertStringSidToSidA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x11\x81\x15" } },
    .{ "ConvertStringSidToSidW", MethodRecord{ .library = "ADVAPI32", .import = "ConvertStringSidToSidW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x11\x81\x15" } },
    .{ "ConvertStringSecurityDescriptorToSecurityDescriptorA", MethodRecord{ .library = "ADVAPI32", .import = "ConvertStringSecurityDescriptorToSecurityDescriptorA", .signature = "\x00\x04\x11\x59\x11\x3d\x09\x0f\x11\x82\xad\x0f\x09" } },
    .{ "ConvertStringSecurityDescriptorToSecurityDescriptorW", MethodRecord{ .library = "ADVAPI32", .import = "ConvertStringSecurityDescriptorToSecurityDescriptorW", .signature = "\x00\x04\x11\x59\x11\x05\x09\x0f\x11\x82\xad\x0f\x09" } },
    .{ "ConvertSecurityDescriptorToStringSecurityDescriptorA", MethodRecord{ .library = "ADVAPI32", .import = "ConvertSecurityDescriptorToStringSecurityDescriptorA", .signature = "\x00\x05\x11\x59\x11\x82\xad\x09\x11\x84\xf9\x0f\x11\x3d\x0f\x09" } },
    .{ "ConvertSecurityDescriptorToStringSecurityDescriptorW", MethodRecord{ .library = "ADVAPI32", .import = "ConvertSecurityDescriptorToStringSecurityDescriptorW", .signature = "\x00\x05\x11\x59\x11\x82\xad\x09\x11\x84\xf9\x0f\x11\x05\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x115 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSID" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x4f9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "OBJECT_SECURITY_INFORMATION" },
        0x1361 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "TOKEN_GROUPS" },
        0x1369 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LUID" },
        0x13c9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "ACL" },
        0x1b61 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_RESOURCE_MANAGER_FLAGS" },
        0x1b65 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_ACCESS_CHECK_FLAGS" },
        0x1b69 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_INITIALIZE_OBJECT_ACCESS_AUDIT_EVENT_FLAGS" },
        0x1b6d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "TREE_SEC_INFO" },
        0x1ce1 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "ACE_FLAGS" },
        0x1d05 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "GENERIC_MAPPING" },
        0x1d1d => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SID_AND_ATTRIBUTES" },
        0x1f81 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "LPTHREAD_START_ROUTINE" },
        0x3ba9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_CLIENT_CONTEXT_HANDLE" },
        0x3bad => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_ACCESS_REQUEST" },
        0x3bb1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_AUDIT_EVENT_HANDLE" },
        0x3bb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_ACCESS_REPLY" },
        0x3bb9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_ACCESS_CHECK_RESULTS_HANDLE" },
        0x3bbd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "PFN_AUTHZ_DYNAMIC_ACCESS_CHECK" },
        0x3bc1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS" },
        0x3bc5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "PFN_AUTHZ_FREE_DYNAMIC_GROUPS" },
        0x3bc9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_RESOURCE_MANAGER_HANDLE" },
        0x3bcd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_INIT_INFO" },
        0x3bd1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_RPC_INIT_INFO_CLIENT" },
        0x3bd5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_SECURITY_ATTRIBUTE_OPERATION" },
        0x3bd9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_SECURITY_ATTRIBUTES_INFORMATION" },
        0x3bdd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_CONTEXT_INFORMATION_CLASS" },
        0x3be1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_SID_OPERATION" },
        0x3be5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_AUDIT_EVENT_TYPE_HANDLE" },
        0x3be9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_SOURCE_SCHEMA_REGISTRATION" },
        0x3bed => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE" },
        0x3bf1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUDIT_PARAMS" },
        0x3bf5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE" },
        0x3bf9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "EXPLICIT_ACCESS_A" },
        0x3bfd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "EXPLICIT_ACCESS_W" },
        0x3c01 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "TRUSTEE_A" },
        0x3c05 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "TRUSTEE_W" },
        0x3c09 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "SE_OBJECT_TYPE" },
        0x3c0d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "FN_OBJECT_MGR_FUNCTS" },
        0x3c11 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "INHERITED_FROMA" },
        0x3c15 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "INHERITED_FROMW" },
        0x3c19 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "FN_PROGRESS" },
        0x3c1d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "PROG_INVOKE_SETTING" },
        0x3c21 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "ACCESS_MODE" },
        0x3c25 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "OBJECTS_AND_SID" },
        0x3c29 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "OBJECTS_AND_NAME_A" },
        0x3c2d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "OBJECTS_AND_NAME_W" },
        0x3c31 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "TRUSTEE_TYPE" },
        0x3c35 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "TRUSTEE_FORM" },
        0x3c39 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization", .name = "MULTIPLE_TRUSTEE_OPERATION" },
        else => null,
    };
}

pub const AUTHZ_RM_FLAG_NO_AUDIT = 1;
pub const AUTHZ_RM_FLAG_INITIALIZE_UNDER_IMPERSONATION = 2;
pub const AUTHZ_RM_FLAG_NO_CENTRAL_ACCESS_POLICIES = 4;
pub const AUTHZ_ACCESS_CHECK_NO_DEEP_COPY_SD = 1;
pub const AUTHZ_NO_SUCCESS_AUDIT = 1;
pub const AUTHZ_NO_FAILURE_AUDIT = 2;
pub const AUTHZ_NO_ALLOC_STRINGS = 4;
pub const TREE_SEC_INFO_SET = 1;
pub const TREE_SEC_INFO_RESET = 2;
pub const TREE_SEC_INFO_RESET_KEEP_EXPLICIT = 3;
pub const AUTHZ_GENERATE_SUCCESS_AUDIT = 1;
pub const AUTHZ_GENERATE_FAILURE_AUDIT = 2;
pub const ACTRL_ACCESS_ALLOWED = 1;
pub const ACTRL_ACCESS_DENIED = 2;
pub const ACTRL_AUDIT_SUCCESS = 4;
pub const ACTRL_AUDIT_FAILURE = 8;
pub const AUTHZ_SECURITY_ATTRIBUTE_NON_INHERITABLE = 1;
pub const AUTHZ_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE = 2;
pub const SDDL_REVISION_1 = 1;
pub const SDDL_REVISION = 1;
pub const SDDL_ALIAS_SIZE = 2;
pub const INHERITED_ACCESS_ENTRY = 16;
pub const INHERITED_PARENT = 268435456;
pub const INHERITED_GRANDPARENT = 536870912;
pub const TRUSTEE_ACCESS_ALLOWED = 1;
pub const TRUSTEE_ACCESS_READ = 2;
pub const TRUSTEE_ACCESS_WRITE = 4;
pub const TRUSTEE_ACCESS_EXPLICIT = 1;
pub const TRUSTEE_ACCESS_ALL = -1;
pub const ACTRL_RESERVED = 0;
pub const ACTRL_PERM_1 = 1;
pub const ACTRL_PERM_2 = 2;
pub const ACTRL_PERM_3 = 4;
pub const ACTRL_PERM_4 = 8;
pub const ACTRL_PERM_5 = 16;
pub const ACTRL_PERM_6 = 32;
pub const ACTRL_PERM_7 = 64;
pub const ACTRL_PERM_8 = 128;
pub const ACTRL_PERM_9 = 256;
pub const ACTRL_PERM_10 = 512;
pub const ACTRL_PERM_11 = 1024;
pub const ACTRL_PERM_12 = 2048;
pub const ACTRL_PERM_13 = 4096;
pub const ACTRL_PERM_14 = 8192;
pub const ACTRL_PERM_15 = 16384;
pub const ACTRL_PERM_16 = 32768;
pub const ACTRL_PERM_17 = 65536;
pub const ACTRL_PERM_18 = 131072;
pub const ACTRL_PERM_19 = 262144;
pub const ACTRL_PERM_20 = 524288;
pub const ACTRL_ACCESS_PROTECTED = 1;
pub const ACTRL_SYSTEM_ACCESS = 67108864;
pub const ACTRL_DELETE = 134217728;
pub const ACTRL_READ_CONTROL = 268435456;
pub const ACTRL_CHANGE_ACCESS = 536870912;
pub const ACTRL_CHANGE_OWNER = 1073741824;
pub const ACTRL_SYNCHRONIZE = 2147483648;
pub const ACTRL_STD_RIGHTS_ALL = 4160749568;
pub const ACTRL_FILE_READ = 1;
pub const ACTRL_FILE_WRITE = 2;
pub const ACTRL_FILE_APPEND = 4;
pub const ACTRL_FILE_READ_PROP = 8;
pub const ACTRL_FILE_WRITE_PROP = 16;
pub const ACTRL_FILE_EXECUTE = 32;
pub const ACTRL_FILE_READ_ATTRIB = 128;
pub const ACTRL_FILE_WRITE_ATTRIB = 256;
pub const ACTRL_FILE_CREATE_PIPE = 512;
pub const ACTRL_DIR_LIST = 1;
pub const ACTRL_DIR_CREATE_OBJECT = 2;
pub const ACTRL_DIR_CREATE_CHILD = 4;
pub const ACTRL_DIR_DELETE_CHILD = 64;
pub const ACTRL_DIR_TRAVERSE = 32;
pub const ACTRL_KERNEL_TERMINATE = 1;
pub const ACTRL_KERNEL_THREAD = 2;
pub const ACTRL_KERNEL_VM = 4;
pub const ACTRL_KERNEL_VM_READ = 8;
pub const ACTRL_KERNEL_VM_WRITE = 16;
pub const ACTRL_KERNEL_DUP_HANDLE = 32;
pub const ACTRL_KERNEL_PROCESS = 64;
pub const ACTRL_KERNEL_SET_INFO = 128;
pub const ACTRL_KERNEL_GET_INFO = 256;
pub const ACTRL_KERNEL_CONTROL = 512;
pub const ACTRL_KERNEL_ALERT = 1024;
pub const ACTRL_KERNEL_GET_CONTEXT = 2048;
pub const ACTRL_KERNEL_SET_CONTEXT = 4096;
pub const ACTRL_KERNEL_TOKEN = 8192;
pub const ACTRL_KERNEL_IMPERSONATE = 16384;
pub const ACTRL_KERNEL_DIMPERSONATE = 32768;
pub const ACTRL_PRINT_SADMIN = 1;
pub const ACTRL_PRINT_SLIST = 2;
pub const ACTRL_PRINT_PADMIN = 4;
pub const ACTRL_PRINT_PUSE = 8;
pub const ACTRL_PRINT_JADMIN = 16;
pub const ACTRL_SVC_GET_INFO = 1;
pub const ACTRL_SVC_SET_INFO = 2;
pub const ACTRL_SVC_STATUS = 4;
pub const ACTRL_SVC_LIST = 8;
pub const ACTRL_SVC_START = 16;
pub const ACTRL_SVC_STOP = 32;
pub const ACTRL_SVC_PAUSE = 64;
pub const ACTRL_SVC_INTERROGATE = 128;
pub const ACTRL_SVC_UCONTROL = 256;
pub const ACTRL_REG_QUERY = 1;
pub const ACTRL_REG_SET = 2;
pub const ACTRL_REG_CREATE_CHILD = 4;
pub const ACTRL_REG_LIST = 8;
pub const ACTRL_REG_NOTIFY = 16;
pub const ACTRL_REG_LINK = 32;
pub const ACTRL_WIN_CLIPBRD = 1;
pub const ACTRL_WIN_GLOBAL_ATOMS = 2;
pub const ACTRL_WIN_CREATE = 4;
pub const ACTRL_WIN_LIST_DESK = 8;
pub const ACTRL_WIN_LIST = 16;
pub const ACTRL_WIN_READ_ATTRIBS = 32;
pub const ACTRL_WIN_WRITE_ATTRIBS = 64;
pub const ACTRL_WIN_SCREEN = 128;
pub const ACTRL_WIN_EXIT = 256;
pub const ACTRL_ACCESS_NO_OPTIONS = 0;
pub const ACTRL_ACCESS_SUPPORTS_OBJECT_ENTRIES = 1;
pub const AUDIT_TYPE_LEGACY = 1;
pub const AUDIT_TYPE_WMI = 2;
pub const AP_ParamTypeBits = 8;
pub const AP_ParamTypeMask = 255;
pub const _AUTHZ_SS_MAXSIZE = 128;
pub const APF_AuditFailure = 0;
pub const APF_AuditSuccess = 1;
pub const APF_ValidFlags = 1;
pub const AUTHZP_WPD_EVENT = 16;
pub const AUTHZ_ALLOW_MULTIPLE_SOURCE_INSTANCES = 1;
pub const AUTHZ_MIGRATED_LEGACY_PUBLISHER = 2;
pub const AUTHZ_AUDIT_INSTANCE_INFORMATION = 2;
pub const AUTHZ_SKIP_TOKEN_GROUPS = 2;
pub const AUTHZ_REQUIRE_S4U_LOGON = 4;
pub const AUTHZ_COMPUTE_PRIVILEGES = 8;
pub const AUTHZ_SECURITY_ATTRIBUTE_TYPE_INVALID = 0;
pub const AUTHZ_SECURITY_ATTRIBUTE_TYPE_INT64 = 1;
pub const AUTHZ_SECURITY_ATTRIBUTE_TYPE_UINT64 = 2;
pub const AUTHZ_SECURITY_ATTRIBUTE_TYPE_STRING = 3;
pub const AUTHZ_SECURITY_ATTRIBUTE_TYPE_FQBN = 4;
pub const AUTHZ_SECURITY_ATTRIBUTE_TYPE_SID = 5;
pub const AUTHZ_SECURITY_ATTRIBUTE_TYPE_BOOLEAN = 6;
pub const AUTHZ_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING = 16;
pub const AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_VERSION_V1 = 1;
pub const AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_VERSION = 1;
pub const AUTHZ_RPC_INIT_INFO_CLIENT_VERSION_V1 = 1;
pub const AUTHZ_INIT_INFO_VERSION_V1 = 1;
pub const AUTHZ_WPD_CATEGORY_FLAG = 16;
pub const AUTHZ_FLAG_ALLOW_MULTIPLE_SOURCE_INSTANCES = 1;
pub const OLESCRIPT_E_SYNTAX = -2147352319;
pub const SE_UNKNOWN_OBJECT_TYPE = 0;
pub const SE_FILE_OBJECT = 1;
pub const SE_SERVICE = 2;
pub const SE_PRINTER = 3;
pub const SE_REGISTRY_KEY = 4;
pub const SE_LMSHARE = 5;
pub const SE_KERNEL_OBJECT = 6;
pub const SE_WINDOW_OBJECT = 7;
pub const SE_DS_OBJECT = 8;
pub const SE_DS_OBJECT_ALL = 9;
pub const SE_PROVIDER_DEFINED_OBJECT = 10;
pub const SE_WMIGUID_OBJECT = 11;
pub const SE_REGISTRY_WOW64_32KEY = 12;
pub const SE_REGISTRY_WOW64_64KEY = 13;
pub const TRUSTEE_IS_UNKNOWN = 0;
pub const TRUSTEE_IS_USER = 1;
pub const TRUSTEE_IS_GROUP = 2;
pub const TRUSTEE_IS_DOMAIN = 3;
pub const TRUSTEE_IS_ALIAS = 4;
pub const TRUSTEE_IS_WELL_KNOWN_GROUP = 5;
pub const TRUSTEE_IS_DELETED = 6;
pub const TRUSTEE_IS_INVALID = 7;
pub const TRUSTEE_IS_COMPUTER = 8;
pub const TRUSTEE_IS_SID = 0;
pub const TRUSTEE_IS_NAME = 1;
pub const TRUSTEE_BAD_FORM = 2;
pub const TRUSTEE_IS_OBJECTS_AND_SID = 3;
pub const TRUSTEE_IS_OBJECTS_AND_NAME = 4;
pub const NO_MULTIPLE_TRUSTEE = 0;
pub const TRUSTEE_IS_IMPERSONATE = 1;
pub const NOT_USED_ACCESS = 0;
pub const GRANT_ACCESS = 1;
pub const SET_ACCESS = 2;
pub const DENY_ACCESS = 3;
pub const REVOKE_ACCESS = 4;
pub const SET_AUDIT_SUCCESS = 5;
pub const SET_AUDIT_FAILURE = 6;
pub const ProgressInvokeNever = 1;
pub const ProgressInvokeEveryObject = 2;
pub const ProgressInvokeOnError = 3;
pub const ProgressCancelOperation = 4;
pub const ProgressRetryOperation = 5;
pub const ProgressInvokePrePostError = 6;
pub const APT_None = 1;
pub const APT_String = 2;
pub const APT_Ulong = 3;
pub const APT_Pointer = 4;
pub const APT_Sid = 5;
pub const APT_LogonId = 6;
pub const APT_ObjectTypeList = 7;
pub const APT_Luid = 8;
pub const APT_Guid = 9;
pub const APT_Time = 10;
pub const APT_Int64 = 11;
pub const APT_IpAddress = 12;
pub const APT_LogonIdWithSid = 13;
pub const AUTHZ_SECURITY_ATTRIBUTE_OPERATION_NONE = 0;
pub const AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE_ALL = 1;
pub const AUTHZ_SECURITY_ATTRIBUTE_OPERATION_ADD = 2;
pub const AUTHZ_SECURITY_ATTRIBUTE_OPERATION_DELETE = 3;
pub const AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE = 4;
pub const AUTHZ_SID_OPERATION_NONE = 0;
pub const AUTHZ_SID_OPERATION_REPLACE_ALL = 1;
pub const AUTHZ_SID_OPERATION_ADD = 2;
pub const AUTHZ_SID_OPERATION_DELETE = 3;
pub const AUTHZ_SID_OPERATION_REPLACE = 4;
pub const AuthzContextInfoUserSid = 1;
pub const AuthzContextInfoGroupsSids = 2;
pub const AuthzContextInfoRestrictedSids = 3;
pub const AuthzContextInfoPrivileges = 4;
pub const AuthzContextInfoExpirationTime = 5;
pub const AuthzContextInfoServerContext = 6;
pub const AuthzContextInfoIdentifier = 7;
pub const AuthzContextInfoSource = 8;
pub const AuthzContextInfoAll = 9;
pub const AuthzContextInfoAuthenticationId = 10;
pub const AuthzContextInfoSecurityAttributes = 11;
pub const AuthzContextInfoDeviceSids = 12;
pub const AuthzContextInfoUserClaims = 13;
pub const AuthzContextInfoDeviceClaims = 14;
pub const AuthzContextInfoAppContainerSid = 15;
pub const AuthzContextInfoCapabilitySids = 16;
pub const AuthzAuditEventInfoFlags = 1;
pub const AuthzAuditEventInfoOperationType = 2;
pub const AuthzAuditEventInfoObjectType = 3;
pub const AuthzAuditEventInfoObjectName = 4;
pub const AuthzAuditEventInfoAdditionalInfo = 5;
pub const AZ_PROP_NAME = 1;
pub const AZ_PROP_DESCRIPTION = 2;
pub const AZ_PROP_WRITABLE = 3;
pub const AZ_PROP_APPLICATION_DATA = 4;
pub const AZ_PROP_CHILD_CREATE = 5;
pub const AZ_MAX_APPLICATION_NAME_LENGTH = 512;
pub const AZ_MAX_OPERATION_NAME_LENGTH = 64;
pub const AZ_MAX_TASK_NAME_LENGTH = 64;
pub const AZ_MAX_SCOPE_NAME_LENGTH = 65536;
pub const AZ_MAX_GROUP_NAME_LENGTH = 64;
pub const AZ_MAX_ROLE_NAME_LENGTH = 64;
pub const AZ_MAX_NAME_LENGTH = 65536;
pub const AZ_MAX_DESCRIPTION_LENGTH = 1024;
pub const AZ_MAX_APPLICATION_DATA_LENGTH = 4096;
pub const AZ_SUBMIT_FLAG_ABORT = 1;
pub const AZ_SUBMIT_FLAG_FLUSH = 2;
pub const AZ_MAX_POLICY_URL_LENGTH = 65536;
pub const AZ_AZSTORE_FLAG_CREATE = 1;
pub const AZ_AZSTORE_FLAG_MANAGE_STORE_ONLY = 2;
pub const AZ_AZSTORE_FLAG_BATCH_UPDATE = 4;
pub const AZ_AZSTORE_FLAG_AUDIT_IS_CRITICAL = 8;
pub const AZ_AZSTORE_FORCE_APPLICATION_CLOSE = 16;
pub const AZ_AZSTORE_NT6_FUNCTION_LEVEL = 32;
pub const AZ_AZSTORE_FLAG_MANAGE_ONLY_PASSIVE_SUBMIT = 32768;
pub const AZ_PROP_AZSTORE_DOMAIN_TIMEOUT = 100;
pub const AZ_AZSTORE_DEFAULT_DOMAIN_TIMEOUT = 15000;
pub const AZ_PROP_AZSTORE_SCRIPT_ENGINE_TIMEOUT = 101;
pub const AZ_AZSTORE_MIN_DOMAIN_TIMEOUT = 500;
pub const AZ_AZSTORE_MIN_SCRIPT_ENGINE_TIMEOUT = 5000;
pub const AZ_AZSTORE_DEFAULT_SCRIPT_ENGINE_TIMEOUT = 45000;
pub const AZ_PROP_AZSTORE_MAX_SCRIPT_ENGINES = 102;
pub const AZ_AZSTORE_DEFAULT_MAX_SCRIPT_ENGINES = 120;
pub const AZ_PROP_AZSTORE_MAJOR_VERSION = 103;
pub const AZ_PROP_AZSTORE_MINOR_VERSION = 104;
pub const AZ_PROP_AZSTORE_TARGET_MACHINE = 105;
pub const AZ_PROP_AZTORE_IS_ADAM_INSTANCE = 106;
pub const AZ_PROP_OPERATION_ID = 200;
pub const AZ_PROP_TASK_OPERATIONS = 300;
pub const AZ_PROP_TASK_BIZRULE = 301;
pub const AZ_PROP_TASK_BIZRULE_LANGUAGE = 302;
pub const AZ_PROP_TASK_TASKS = 303;
pub const AZ_PROP_TASK_BIZRULE_IMPORTED_PATH = 304;
pub const AZ_PROP_TASK_IS_ROLE_DEFINITION = 305;
pub const AZ_MAX_TASK_BIZRULE_LENGTH = 65536;
pub const AZ_MAX_TASK_BIZRULE_LANGUAGE_LENGTH = 64;
pub const AZ_MAX_TASK_BIZRULE_IMPORTED_PATH_LENGTH = 512;
pub const AZ_MAX_BIZRULE_STRING = 65536;
pub const AZ_PROP_GROUP_TYPE = 400;
pub const AZ_GROUPTYPE_LDAP_QUERY = 1;
pub const AZ_GROUPTYPE_BASIC = 2;
pub const AZ_GROUPTYPE_BIZRULE = 3;
pub const AZ_PROP_GROUP_APP_MEMBERS = 401;
pub const AZ_PROP_GROUP_APP_NON_MEMBERS = 402;
pub const AZ_PROP_GROUP_LDAP_QUERY = 403;
pub const AZ_MAX_GROUP_LDAP_QUERY_LENGTH = 4096;
pub const AZ_PROP_GROUP_MEMBERS = 404;
pub const AZ_PROP_GROUP_NON_MEMBERS = 405;
pub const AZ_PROP_GROUP_MEMBERS_NAME = 406;
pub const AZ_PROP_GROUP_NON_MEMBERS_NAME = 407;
pub const AZ_PROP_GROUP_BIZRULE = 408;
pub const AZ_PROP_GROUP_BIZRULE_LANGUAGE = 409;
pub const AZ_PROP_GROUP_BIZRULE_IMPORTED_PATH = 410;
pub const AZ_MAX_GROUP_BIZRULE_LENGTH = 65536;
pub const AZ_MAX_GROUP_BIZRULE_LANGUAGE_LENGTH = 64;
pub const AZ_MAX_GROUP_BIZRULE_IMPORTED_PATH_LENGTH = 512;
pub const AZ_PROP_ROLE_APP_MEMBERS = 500;
pub const AZ_PROP_ROLE_MEMBERS = 501;
pub const AZ_PROP_ROLE_OPERATIONS = 502;
pub const AZ_PROP_ROLE_TASKS = 504;
pub const AZ_PROP_ROLE_MEMBERS_NAME = 505;
pub const AZ_PROP_SCOPE_BIZRULES_WRITABLE = 600;
pub const AZ_PROP_SCOPE_CAN_BE_DELEGATED = 601;
pub const AZ_PROP_CLIENT_CONTEXT_USER_DN = 700;
pub const AZ_PROP_CLIENT_CONTEXT_USER_SAM_COMPAT = 701;
pub const AZ_PROP_CLIENT_CONTEXT_USER_DISPLAY = 702;
pub const AZ_PROP_CLIENT_CONTEXT_USER_GUID = 703;
pub const AZ_PROP_CLIENT_CONTEXT_USER_CANONICAL = 704;
pub const AZ_PROP_CLIENT_CONTEXT_USER_UPN = 705;
pub const AZ_PROP_CLIENT_CONTEXT_USER_DNS_SAM_COMPAT = 707;
pub const AZ_PROP_CLIENT_CONTEXT_ROLE_FOR_ACCESS_CHECK = 708;
pub const AZ_PROP_CLIENT_CONTEXT_LDAP_QUERY_DN = 709;
pub const AZ_PROP_APPLICATION_AUTHZ_INTERFACE_CLSID = 800;
pub const AZ_PROP_APPLICATION_VERSION = 801;
pub const AZ_MAX_APPLICATION_VERSION_LENGTH = 512;
pub const AZ_PROP_APPLICATION_NAME = 802;
pub const AZ_PROP_APPLICATION_BIZRULE_ENABLED = 803;
pub const AZ_PROP_APPLY_STORE_SACL = 900;
pub const AZ_PROP_GENERATE_AUDITS = 901;
pub const AZ_PROP_POLICY_ADMINS = 902;
pub const AZ_PROP_POLICY_READERS = 903;
pub const AZ_PROP_DELEGATED_POLICY_USERS = 904;
pub const AZ_PROP_POLICY_ADMINS_NAME = 905;
pub const AZ_PROP_POLICY_READERS_NAME = 906;
pub const AZ_PROP_DELEGATED_POLICY_USERS_NAME = 907;
pub const AZ_CLIENT_CONTEXT_SKIP_GROUP = 1;
pub const AZ_CLIENT_CONTEXT_SKIP_LDAP_QUERY = 1;
pub const AZ_CLIENT_CONTEXT_GET_GROUP_RECURSIVE = 2;
pub const AZ_CLIENT_CONTEXT_GET_GROUPS_STORE_LEVEL_ONLY = 2;

pub const aliases = struct {
    pub const AUTHZ_RESOURCE_MANAGER_FLAGS = u32;
    pub const AUTHZ_ACCESS_CHECK_FLAGS = u32;
    pub const AUTHZ_INITIALIZE_OBJECT_ACCESS_AUDIT_EVENT_FLAGS = u32;
    pub const TREE_SEC_INFO = u32;
    pub const AUTHZ_GENERATE_RESULTS = u32;
    pub const ACTRL_ACCESS_ENTRY_ACCESS_FLAGS = u32;
    pub const AUTHZ_SECURITY_ATTRIBUTE_FLAGS = u32;
    pub const SE_OBJECT_TYPE = i32;
    pub const TRUSTEE_TYPE = i32;
    pub const TRUSTEE_FORM = i32;
    pub const MULTIPLE_TRUSTEE_OPERATION = i32;
    pub const ACCESS_MODE = i32;
    pub const PROG_INVOKE_SETTING = i32;
    pub const AUDIT_PARAM_TYPE = i32;
    pub const AUTHZ_SECURITY_ATTRIBUTE_OPERATION = i32;
    pub const AUTHZ_SID_OPERATION = i32;
    pub const AUTHZ_CONTEXT_INFORMATION_CLASS = i32;
    pub const AUTHZ_AUDIT_EVENT_INFORMATION_CLASS = i32;
    pub const AZ_PROP_CONSTANTS = i32;
    pub const AUTHZ_ACCESS_CHECK_RESULTS_HANDLE = ?*anyopaque;
    pub const AUTHZ_CAP_CHANGE_SUBSCRIPTION_HANDLE = ?*anyopaque;
    pub const AUTHZ_CLIENT_CONTEXT_HANDLE = ?*anyopaque;
    pub const AUTHZ_RESOURCE_MANAGER_HANDLE = ?*anyopaque;
    pub const AUTHZ_AUDIT_EVENT_HANDLE = ?*anyopaque;
    pub const AUTHZ_AUDIT_EVENT_TYPE_HANDLE = ?*anyopaque;
    pub const AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE = ?*anyopaque;
};
