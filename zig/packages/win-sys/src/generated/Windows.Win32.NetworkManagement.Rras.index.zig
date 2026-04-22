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
    .{ "RasDialA", MethodRecord{ .library = "RASAPI32", .import = "RasDialA", .signature = "\x00\x06\x09\x0f\x11\xb8\xa1\x11\x3d\x0f\x11\xb8\xa5\x09\x0f\x01\x0f\x11\xb8\xa9" } },
    .{ "RasDialW", MethodRecord{ .library = "RASAPI32", .import = "RasDialW", .signature = "\x00\x06\x09\x0f\x11\xb8\xa1\x11\x05\x0f\x11\xb8\xad\x09\x0f\x01\x0f\x11\xb8\xa9" } },
    .{ "RasEnumConnectionsA", MethodRecord{ .library = "RASAPI32", .import = "RasEnumConnectionsA", .signature = "\x00\x03\x09\x0f\x11\xb8\xb1\x0f\x09\x0f\x09" } },
    .{ "RasEnumConnectionsW", MethodRecord{ .library = "RASAPI32", .import = "RasEnumConnectionsW", .signature = "\x00\x03\x09\x0f\x11\xb8\xb5\x0f\x09\x0f\x09" } },
    .{ "RasEnumEntriesA", MethodRecord{ .library = "RASAPI32", .import = "RasEnumEntriesA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x0f\x11\xb8\xb9\x0f\x09\x0f\x09" } },
    .{ "RasEnumEntriesW", MethodRecord{ .library = "RASAPI32", .import = "RasEnumEntriesW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x0f\x11\xb8\xbd\x0f\x09\x0f\x09" } },
    .{ "RasGetConnectStatusA", MethodRecord{ .library = "RASAPI32", .import = "RasGetConnectStatusA", .signature = "\x00\x02\x09\x11\xb8\xa9\x0f\x11\xb8\xc1" } },
    .{ "RasGetConnectStatusW", MethodRecord{ .library = "RASAPI32", .import = "RasGetConnectStatusW", .signature = "\x00\x02\x09\x11\xb8\xa9\x0f\x11\xb8\xc5" } },
    .{ "RasGetErrorStringA", MethodRecord{ .library = "RASAPI32", .import = "RasGetErrorStringA", .signature = "\x00\x03\x09\x09\x11\x3d\x09" } },
    .{ "RasGetErrorStringW", MethodRecord{ .library = "RASAPI32", .import = "RasGetErrorStringW", .signature = "\x00\x03\x09\x09\x11\x05\x09" } },
    .{ "RasHangUpA", MethodRecord{ .library = "RASAPI32", .import = "RasHangUpA", .signature = "\x00\x01\x09\x11\xb8\xa9" } },
    .{ "RasHangUpW", MethodRecord{ .library = "RASAPI32", .import = "RasHangUpW", .signature = "\x00\x01\x09\x11\xb8\xa9" } },
    .{ "RasGetProjectionInfoA", MethodRecord{ .library = "RASAPI32", .import = "RasGetProjectionInfoA", .signature = "\x00\x04\x09\x11\xb8\xa9\x11\xb8\xc9\x0f\x01\x0f\x09" } },
    .{ "RasGetProjectionInfoW", MethodRecord{ .library = "RASAPI32", .import = "RasGetProjectionInfoW", .signature = "\x00\x04\x09\x11\xb8\xa9\x11\xb8\xc9\x0f\x01\x0f\x09" } },
    .{ "RasCreatePhonebookEntryA", MethodRecord{ .library = "RASAPI32", .import = "RasCreatePhonebookEntryA", .signature = "\x00\x02\x09\x11\x25\x11\x3d" } },
    .{ "RasCreatePhonebookEntryW", MethodRecord{ .library = "RASAPI32", .import = "RasCreatePhonebookEntryW", .signature = "\x00\x02\x09\x11\x25\x11\x05" } },
    .{ "RasEditPhonebookEntryA", MethodRecord{ .library = "RASAPI32", .import = "RasEditPhonebookEntryA", .signature = "\x00\x03\x09\x11\x25\x11\x3d\x11\x3d" } },
    .{ "RasEditPhonebookEntryW", MethodRecord{ .library = "RASAPI32", .import = "RasEditPhonebookEntryW", .signature = "\x00\x03\x09\x11\x25\x11\x05\x11\x05" } },
    .{ "RasSetEntryDialParamsA", MethodRecord{ .library = "RASAPI32", .import = "RasSetEntryDialParamsA", .signature = "\x00\x03\x09\x11\x3d\x0f\x11\xb8\xa5\x11\x59" } },
    .{ "RasSetEntryDialParamsW", MethodRecord{ .library = "RASAPI32", .import = "RasSetEntryDialParamsW", .signature = "\x00\x03\x09\x11\x05\x0f\x11\xb8\xad\x11\x59" } },
    .{ "RasGetEntryDialParamsA", MethodRecord{ .library = "RASAPI32", .import = "RasGetEntryDialParamsA", .signature = "\x00\x03\x09\x11\x3d\x0f\x11\xb8\xa5\x0f\x11\x59" } },
    .{ "RasGetEntryDialParamsW", MethodRecord{ .library = "RASAPI32", .import = "RasGetEntryDialParamsW", .signature = "\x00\x03\x09\x11\x05\x0f\x11\xb8\xad\x0f\x11\x59" } },
    .{ "RasEnumDevicesA", MethodRecord{ .library = "RASAPI32", .import = "RasEnumDevicesA", .signature = "\x00\x03\x09\x0f\x11\xb8\xcd\x0f\x09\x0f\x09" } },
    .{ "RasEnumDevicesW", MethodRecord{ .library = "RASAPI32", .import = "RasEnumDevicesW", .signature = "\x00\x03\x09\x0f\x11\xb8\xd1\x0f\x09\x0f\x09" } },
    .{ "RasGetCountryInfoA", MethodRecord{ .library = "RASAPI32", .import = "RasGetCountryInfoA", .signature = "\x00\x02\x09\x0f\x11\xb8\xd5\x0f\x09" } },
    .{ "RasGetCountryInfoW", MethodRecord{ .library = "RASAPI32", .import = "RasGetCountryInfoW", .signature = "\x00\x02\x09\x0f\x11\xb8\xd5\x0f\x09" } },
    .{ "RasGetEntryPropertiesA", MethodRecord{ .library = "RASAPI32", .import = "RasGetEntryPropertiesA", .signature = "\x00\x06\x09\x11\x3d\x11\x3d\x0f\x11\xb8\xd9\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "RasGetEntryPropertiesW", MethodRecord{ .library = "RASAPI32", .import = "RasGetEntryPropertiesW", .signature = "\x00\x06\x09\x11\x05\x11\x05\x0f\x11\xb8\xdd\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "RasSetEntryPropertiesA", MethodRecord{ .library = "RASAPI32", .import = "RasSetEntryPropertiesA", .signature = "\x00\x06\x09\x11\x3d\x11\x3d\x0f\x11\xb8\xd9\x09\x0f\x05\x09" } },
    .{ "RasSetEntryPropertiesW", MethodRecord{ .library = "RASAPI32", .import = "RasSetEntryPropertiesW", .signature = "\x00\x06\x09\x11\x05\x11\x05\x0f\x11\xb8\xdd\x09\x0f\x05\x09" } },
    .{ "RasRenameEntryA", MethodRecord{ .library = "RASAPI32", .import = "RasRenameEntryA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "RasRenameEntryW", MethodRecord{ .library = "RASAPI32", .import = "RasRenameEntryW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x11\x05" } },
    .{ "RasDeleteEntryA", MethodRecord{ .library = "RASAPI32", .import = "RasDeleteEntryA", .signature = "\x00\x02\x09\x11\x3d\x11\x3d" } },
    .{ "RasDeleteEntryW", MethodRecord{ .library = "RASAPI32", .import = "RasDeleteEntryW", .signature = "\x00\x02\x09\x11\x05\x11\x05" } },
    .{ "RasValidateEntryNameA", MethodRecord{ .library = "RASAPI32", .import = "RasValidateEntryNameA", .signature = "\x00\x02\x09\x11\x3d\x11\x3d" } },
    .{ "RasValidateEntryNameW", MethodRecord{ .library = "RASAPI32", .import = "RasValidateEntryNameW", .signature = "\x00\x02\x09\x11\x05\x11\x05" } },
    .{ "RasConnectionNotificationA", MethodRecord{ .library = "RASAPI32", .import = "RasConnectionNotificationA", .signature = "\x00\x03\x09\x11\xb8\xa9\x11\x80\x85\x09" } },
    .{ "RasConnectionNotificationW", MethodRecord{ .library = "RASAPI32", .import = "RasConnectionNotificationW", .signature = "\x00\x03\x09\x11\xb8\xa9\x11\x80\x85\x09" } },
    .{ "RasGetSubEntryHandleA", MethodRecord{ .library = "RASAPI32", .import = "RasGetSubEntryHandleA", .signature = "\x00\x03\x09\x11\xb8\xa9\x09\x0f\x11\xb8\xa9" } },
    .{ "RasGetSubEntryHandleW", MethodRecord{ .library = "RASAPI32", .import = "RasGetSubEntryHandleW", .signature = "\x00\x03\x09\x11\xb8\xa9\x09\x0f\x11\xb8\xa9" } },
    .{ "RasGetCredentialsA", MethodRecord{ .library = "RASAPI32", .import = "RasGetCredentialsA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x0f\x11\xb8\xe1" } },
    .{ "RasGetCredentialsW", MethodRecord{ .library = "RASAPI32", .import = "RasGetCredentialsW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x11\xb8\xe5" } },
    .{ "RasSetCredentialsA", MethodRecord{ .library = "RASAPI32", .import = "RasSetCredentialsA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x0f\x11\xb8\xe1\x11\x59" } },
    .{ "RasSetCredentialsW", MethodRecord{ .library = "RASAPI32", .import = "RasSetCredentialsW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x0f\x11\xb8\xe5\x11\x59" } },
    .{ "RasGetSubEntryPropertiesA", MethodRecord{ .library = "RASAPI32", .import = "RasGetSubEntryPropertiesA", .signature = "\x00\x07\x09\x11\x3d\x11\x3d\x09\x0f\x11\xb8\xe9\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "RasGetSubEntryPropertiesW", MethodRecord{ .library = "RASAPI32", .import = "RasGetSubEntryPropertiesW", .signature = "\x00\x07\x09\x11\x05\x11\x05\x09\x0f\x11\xb8\xed\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "RasSetSubEntryPropertiesA", MethodRecord{ .library = "RASAPI32", .import = "RasSetSubEntryPropertiesA", .signature = "\x00\x07\x09\x11\x3d\x11\x3d\x09\x0f\x11\xb8\xe9\x09\x0f\x05\x09" } },
    .{ "RasSetSubEntryPropertiesW", MethodRecord{ .library = "RASAPI32", .import = "RasSetSubEntryPropertiesW", .signature = "\x00\x07\x09\x11\x05\x11\x05\x09\x0f\x11\xb8\xed\x09\x0f\x05\x09" } },
    .{ "RasGetAutodialAddressA", MethodRecord{ .library = "RASAPI32", .import = "RasGetAutodialAddressA", .signature = "\x00\x05\x09\x11\x3d\x0f\x09\x0f\x11\xb8\xf1\x0f\x09\x0f\x09" } },
    .{ "RasGetAutodialAddressW", MethodRecord{ .library = "RASAPI32", .import = "RasGetAutodialAddressW", .signature = "\x00\x05\x09\x11\x05\x0f\x09\x0f\x11\xb8\xf5\x0f\x09\x0f\x09" } },
    .{ "RasSetAutodialAddressA", MethodRecord{ .library = "RASAPI32", .import = "RasSetAutodialAddressA", .signature = "\x00\x05\x09\x11\x3d\x09\x0f\x11\xb8\xf1\x09\x09" } },
    .{ "RasSetAutodialAddressW", MethodRecord{ .library = "RASAPI32", .import = "RasSetAutodialAddressW", .signature = "\x00\x05\x09\x11\x05\x09\x0f\x11\xb8\xf5\x09\x09" } },
    .{ "RasEnumAutodialAddressesA", MethodRecord{ .library = "RASAPI32", .import = "RasEnumAutodialAddressesA", .signature = "\x00\x03\x09\x0f\x11\x3d\x0f\x09\x0f\x09" } },
    .{ "RasEnumAutodialAddressesW", MethodRecord{ .library = "RASAPI32", .import = "RasEnumAutodialAddressesW", .signature = "\x00\x03\x09\x0f\x11\x05\x0f\x09\x0f\x09" } },
    .{ "RasGetAutodialEnableA", MethodRecord{ .library = "RASAPI32", .import = "RasGetAutodialEnableA", .signature = "\x00\x02\x09\x09\x0f\x11\x59" } },
    .{ "RasGetAutodialEnableW", MethodRecord{ .library = "RASAPI32", .import = "RasGetAutodialEnableW", .signature = "\x00\x02\x09\x09\x0f\x11\x59" } },
    .{ "RasSetAutodialEnableA", MethodRecord{ .library = "RASAPI32", .import = "RasSetAutodialEnableA", .signature = "\x00\x02\x09\x09\x11\x59" } },
    .{ "RasSetAutodialEnableW", MethodRecord{ .library = "RASAPI32", .import = "RasSetAutodialEnableW", .signature = "\x00\x02\x09\x09\x11\x59" } },
    .{ "RasGetAutodialParamA", MethodRecord{ .library = "RASAPI32", .import = "RasGetAutodialParamA", .signature = "\x00\x03\x09\x09\x0f\x01\x0f\x09" } },
    .{ "RasGetAutodialParamW", MethodRecord{ .library = "RASAPI32", .import = "RasGetAutodialParamW", .signature = "\x00\x03\x09\x09\x0f\x01\x0f\x09" } },
    .{ "RasSetAutodialParamA", MethodRecord{ .library = "RASAPI32", .import = "RasSetAutodialParamA", .signature = "\x00\x03\x09\x09\x0f\x01\x09" } },
    .{ "RasSetAutodialParamW", MethodRecord{ .library = "RASAPI32", .import = "RasSetAutodialParamW", .signature = "\x00\x03\x09\x09\x0f\x01\x09" } },
    .{ "RasGetPCscf", MethodRecord{ .library = "RASAPI32", .import = "RasGetPCscf", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "RasInvokeEapUI", MethodRecord{ .library = "RASAPI32", .import = "RasInvokeEapUI", .signature = "\x00\x04\x09\x11\xb8\xa9\x09\x0f\x11\xb8\xa1\x11\x25" } },
    .{ "RasGetLinkStatistics", MethodRecord{ .library = "RASAPI32", .import = "RasGetLinkStatistics", .signature = "\x00\x03\x09\x11\xb8\xa9\x09\x0f\x11\xb8\xf9" } },
    .{ "RasGetConnectionStatistics", MethodRecord{ .library = "RASAPI32", .import = "RasGetConnectionStatistics", .signature = "\x00\x02\x09\x11\xb8\xa9\x0f\x11\xb8\xf9" } },
    .{ "RasClearLinkStatistics", MethodRecord{ .library = "RASAPI32", .import = "RasClearLinkStatistics", .signature = "\x00\x02\x09\x11\xb8\xa9\x09" } },
    .{ "RasClearConnectionStatistics", MethodRecord{ .library = "RASAPI32", .import = "RasClearConnectionStatistics", .signature = "\x00\x01\x09\x11\xb8\xa9" } },
    .{ "RasGetEapUserDataA", MethodRecord{ .library = "RASAPI32", .import = "RasGetEapUserDataA", .signature = "\x00\x05\x09\x11\x80\x85\x11\x3d\x11\x3d\x0f\x05\x0f\x09" } },
    .{ "RasGetEapUserDataW", MethodRecord{ .library = "RASAPI32", .import = "RasGetEapUserDataW", .signature = "\x00\x05\x09\x11\x80\x85\x11\x05\x11\x05\x0f\x05\x0f\x09" } },
    .{ "RasSetEapUserDataA", MethodRecord{ .library = "RASAPI32", .import = "RasSetEapUserDataA", .signature = "\x00\x05\x09\x11\x80\x85\x11\x3d\x11\x3d\x0f\x05\x09" } },
    .{ "RasSetEapUserDataW", MethodRecord{ .library = "RASAPI32", .import = "RasSetEapUserDataW", .signature = "\x00\x05\x09\x11\x80\x85\x11\x05\x11\x05\x0f\x05\x09" } },
    .{ "RasGetCustomAuthDataA", MethodRecord{ .library = "RASAPI32", .import = "RasGetCustomAuthDataA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x0f\x05\x0f\x09" } },
    .{ "RasGetCustomAuthDataW", MethodRecord{ .library = "RASAPI32", .import = "RasGetCustomAuthDataW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x0f\x05\x0f\x09" } },
    .{ "RasSetCustomAuthDataA", MethodRecord{ .library = "RASAPI32", .import = "RasSetCustomAuthDataA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x0f\x05\x09" } },
    .{ "RasSetCustomAuthDataW", MethodRecord{ .library = "RASAPI32", .import = "RasSetCustomAuthDataW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x0f\x05\x09" } },
    .{ "RasGetEapUserIdentityW", MethodRecord{ .library = "RASAPI32", .import = "RasGetEapUserIdentityW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x09\x11\x25\x0f\x0f\x11\xb8\xfd" } },
    .{ "RasGetEapUserIdentityA", MethodRecord{ .library = "RASAPI32", .import = "RasGetEapUserIdentityA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x09\x11\x25\x0f\x0f\x11\xb9\x01" } },
    .{ "RasFreeEapUserIdentityW", MethodRecord{ .library = "RASAPI32", .import = "RasFreeEapUserIdentityW", .signature = "\x00\x01\x01\x0f\x11\xb8\xfd" } },
    .{ "RasFreeEapUserIdentityA", MethodRecord{ .library = "RASAPI32", .import = "RasFreeEapUserIdentityA", .signature = "\x00\x01\x01\x0f\x11\xb9\x01" } },
    .{ "RasDeleteSubEntryA", MethodRecord{ .library = "RASAPI32", .import = "RasDeleteSubEntryA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x09" } },
    .{ "RasDeleteSubEntryW", MethodRecord{ .library = "RASAPI32", .import = "RasDeleteSubEntryW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "RasUpdateConnection", MethodRecord{ .library = "RASAPI32", .import = "RasUpdateConnection", .signature = "\x00\x02\x09\x11\xb8\xa9\x0f\x11\xb9\x05" } },
    .{ "RasGetProjectionInfoEx", MethodRecord{ .library = "RASAPI32", .import = "RasGetProjectionInfoEx", .signature = "\x00\x03\x09\x11\xb8\xa9\x0f\x11\xb9\x09\x0f\x09" } },
    .{ "RasPhonebookDlgA", MethodRecord{ .library = "RASDLG", .import = "RasPhonebookDlgA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x0f\x11\xb9\x0d" } },
    .{ "RasPhonebookDlgW", MethodRecord{ .library = "RASDLG", .import = "RasPhonebookDlgW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x0f\x11\xb9\x11" } },
    .{ "RasEntryDlgA", MethodRecord{ .library = "RASDLG", .import = "RasEntryDlgA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x0f\x11\xb9\x15" } },
    .{ "RasEntryDlgW", MethodRecord{ .library = "RASDLG", .import = "RasEntryDlgW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x0f\x11\xb9\x19" } },
    .{ "RasDialDlgA", MethodRecord{ .library = "RASDLG", .import = "RasDialDlgA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x11\x3d\x0f\x11\xb9\x1d" } },
    .{ "RasDialDlgW", MethodRecord{ .library = "RASDLG", .import = "RasDialDlgW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x11\x05\x0f\x11\xb9\x1d" } },
    .{ "MprAdminConnectionEnumEx", MethodRecord{ .library = "MPRAPI", .import = "MprAdminConnectionEnumEx", .signature = "\x00\x07\x09\x18\x0f\x11\xb9\x21\x09\x0f\x09\x0f\x09\x0f\x0f\x11\xb9\x25\x0f\x09" } },
    .{ "MprAdminConnectionGetInfoEx", MethodRecord{ .library = "MPRAPI", .import = "MprAdminConnectionGetInfoEx", .signature = "\x00\x03\x09\x18\x11\x80\x85\x0f\x11\xb9\x25" } },
    .{ "MprAdminServerGetInfoEx", MethodRecord{ .library = "MPRAPI", .import = "MprAdminServerGetInfoEx", .signature = "\x00\x02\x09\x18\x0f\x11\xb9\x29" } },
    .{ "MprAdminServerSetInfoEx", MethodRecord{ .library = "MPRAPI", .import = "MprAdminServerSetInfoEx", .signature = "\x00\x02\x09\x18\x0f\x11\xb9\x2d" } },
    .{ "MprConfigServerGetInfoEx", MethodRecord{ .library = "MPRAPI", .import = "MprConfigServerGetInfoEx", .signature = "\x00\x02\x09\x11\x80\x85\x0f\x11\xb9\x29" } },
    .{ "MprConfigServerSetInfoEx", MethodRecord{ .library = "MPRAPI", .import = "MprConfigServerSetInfoEx", .signature = "\x00\x02\x09\x11\x80\x85\x0f\x11\xb9\x2d" } },
    .{ "MprAdminUpdateConnection", MethodRecord{ .library = "MPRAPI", .import = "MprAdminUpdateConnection", .signature = "\x00\x03\x09\x18\x11\x80\x85\x0f\x11\xb9\x31" } },
    .{ "MprAdminIsServiceInitialized", MethodRecord{ .library = "MPRAPI", .import = "MprAdminIsServiceInitialized", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x59" } },
    .{ "MprAdminInterfaceSetCustomInfoEx", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceSetCustomInfoEx", .signature = "\x00\x03\x09\x18\x11\x80\x85\x0f\x11\xb9\x35" } },
    .{ "MprAdminInterfaceGetCustomInfoEx", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceGetCustomInfoEx", .signature = "\x00\x03\x09\x18\x11\x80\x85\x0f\x11\xb9\x35" } },
    .{ "MprConfigInterfaceGetCustomInfoEx", MethodRecord{ .library = "MPRAPI", .import = "MprConfigInterfaceGetCustomInfoEx", .signature = "\x00\x03\x09\x11\x80\x85\x11\x80\x85\x0f\x11\xb9\x35" } },
    .{ "MprConfigInterfaceSetCustomInfoEx", MethodRecord{ .library = "MPRAPI", .import = "MprConfigInterfaceSetCustomInfoEx", .signature = "\x00\x03\x09\x11\x80\x85\x11\x80\x85\x0f\x11\xb9\x35" } },
    .{ "MprAdminConnectionEnum", MethodRecord{ .library = "MPRAPI", .import = "MprAdminConnectionEnum", .signature = "\x00\x07\x09\x18\x09\x0f\x0f\x05\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "MprAdminPortEnum", MethodRecord{ .library = "MPRAPI", .import = "MprAdminPortEnum", .signature = "\x00\x08\x09\x18\x09\x11\x80\x85\x0f\x0f\x05\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "MprAdminConnectionGetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminConnectionGetInfo", .signature = "\x00\x04\x09\x18\x09\x11\x80\x85\x0f\x0f\x05" } },
    .{ "MprAdminPortGetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminPortGetInfo", .signature = "\x00\x04\x09\x18\x09\x11\x80\x85\x0f\x0f\x05" } },
    .{ "MprAdminConnectionClearStats", MethodRecord{ .library = "MPRAPI", .import = "MprAdminConnectionClearStats", .signature = "\x00\x02\x09\x18\x11\x80\x85" } },
    .{ "MprAdminPortClearStats", MethodRecord{ .library = "MPRAPI", .import = "MprAdminPortClearStats", .signature = "\x00\x02\x09\x18\x11\x80\x85" } },
    .{ "MprAdminPortReset", MethodRecord{ .library = "MPRAPI", .import = "MprAdminPortReset", .signature = "\x00\x02\x09\x18\x11\x80\x85" } },
    .{ "MprAdminPortDisconnect", MethodRecord{ .library = "MPRAPI", .import = "MprAdminPortDisconnect", .signature = "\x00\x02\x09\x18\x11\x80\x85" } },
    .{ "MprAdminConnectionRemoveQuarantine", MethodRecord{ .library = "MPRAPI", .import = "MprAdminConnectionRemoveQuarantine", .signature = "\x00\x03\x09\x11\x80\x85\x11\x80\x85\x11\x59" } },
    .{ "MprAdminUserGetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminUserGetInfo", .signature = "\x00\x04\x09\x11\x05\x11\x05\x09\x0f\x05" } },
    .{ "MprAdminUserSetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminUserSetInfo", .signature = "\x00\x04\x09\x11\x05\x11\x05\x09\x0f\x05" } },
    .{ "MprAdminSendUserMessage", MethodRecord{ .library = "MPRAPI", .import = "MprAdminSendUserMessage", .signature = "\x00\x03\x09\x18\x11\x80\x85\x11\x05" } },
    .{ "MprAdminGetPDCServer", MethodRecord{ .library = "MPRAPI", .import = "MprAdminGetPDCServer", .signature = "\x00\x03\x09\x11\x05\x11\x05\x11\x05" } },
    .{ "MprAdminIsServiceRunning", MethodRecord{ .library = "MPRAPI", .import = "MprAdminIsServiceRunning", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "MprAdminServerConnect", MethodRecord{ .library = "MPRAPI", .import = "MprAdminServerConnect", .signature = "\x00\x02\x09\x11\x05\x0f\x18" } },
    .{ "MprAdminServerDisconnect", MethodRecord{ .library = "MPRAPI", .import = "MprAdminServerDisconnect", .signature = "\x00\x01\x01\x18" } },
    .{ "MprAdminServerGetCredentials", MethodRecord{ .library = "MPRAPI", .import = "MprAdminServerGetCredentials", .signature = "\x00\x03\x09\x18\x09\x0f\x0f\x05" } },
    .{ "MprAdminServerSetCredentials", MethodRecord{ .library = "MPRAPI", .import = "MprAdminServerSetCredentials", .signature = "\x00\x03\x09\x18\x09\x0f\x05" } },
    .{ "MprAdminBufferFree", MethodRecord{ .library = "MPRAPI", .import = "MprAdminBufferFree", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "MprAdminGetErrorString", MethodRecord{ .library = "MPRAPI", .import = "MprAdminGetErrorString", .signature = "\x00\x02\x09\x09\x0f\x11\x05" } },
    .{ "MprAdminServerGetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminServerGetInfo", .signature = "\x00\x03\x09\x18\x09\x0f\x0f\x05" } },
    .{ "MprAdminServerSetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminServerSetInfo", .signature = "\x00\x03\x09\x18\x09\x0f\x05" } },
    .{ "MprAdminEstablishDomainRasServer", MethodRecord{ .library = "MPRAPI", .import = "MprAdminEstablishDomainRasServer", .signature = "\x00\x03\x09\x11\x05\x11\x05\x11\x59" } },
    .{ "MprAdminIsDomainRasServer", MethodRecord{ .library = "MPRAPI", .import = "MprAdminIsDomainRasServer", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x11\x59" } },
    .{ "MprAdminTransportCreate", MethodRecord{ .library = "MPRAPI", .import = "MprAdminTransportCreate", .signature = "\x00\x08\x09\x18\x09\x11\x05\x0f\x05\x09\x0f\x05\x09\x11\x05" } },
    .{ "MprAdminTransportSetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminTransportSetInfo", .signature = "\x00\x06\x09\x18\x09\x0f\x05\x09\x0f\x05\x09" } },
    .{ "MprAdminTransportGetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminTransportGetInfo", .signature = "\x00\x06\x09\x18\x09\x0f\x0f\x05\x0f\x09\x0f\x0f\x05\x0f\x09" } },
    .{ "MprAdminDeviceEnum", MethodRecord{ .library = "MPRAPI", .import = "MprAdminDeviceEnum", .signature = "\x00\x04\x09\x18\x09\x0f\x0f\x05\x0f\x09" } },
    .{ "MprAdminInterfaceGetHandle", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceGetHandle", .signature = "\x00\x04\x09\x18\x11\x05\x0f\x11\x80\x85\x11\x59" } },
    .{ "MprAdminInterfaceCreate", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceCreate", .signature = "\x00\x04\x09\x18\x09\x0f\x05\x0f\x11\x80\x85" } },
    .{ "MprAdminInterfaceGetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceGetInfo", .signature = "\x00\x04\x09\x18\x11\x80\x85\x09\x0f\x0f\x05" } },
    .{ "MprAdminInterfaceSetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceSetInfo", .signature = "\x00\x04\x09\x18\x11\x80\x85\x09\x0f\x05" } },
    .{ "MprAdminInterfaceDelete", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceDelete", .signature = "\x00\x02\x09\x18\x11\x80\x85" } },
    .{ "MprAdminInterfaceDeviceGetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceDeviceGetInfo", .signature = "\x00\x05\x09\x18\x11\x80\x85\x09\x09\x0f\x0f\x05" } },
    .{ "MprAdminInterfaceDeviceSetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceDeviceSetInfo", .signature = "\x00\x05\x09\x18\x11\x80\x85\x09\x09\x0f\x05" } },
    .{ "MprAdminInterfaceTransportRemove", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceTransportRemove", .signature = "\x00\x03\x09\x18\x11\x80\x85\x09" } },
    .{ "MprAdminInterfaceTransportAdd", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceTransportAdd", .signature = "\x00\x05\x09\x18\x11\x80\x85\x09\x0f\x05\x09" } },
    .{ "MprAdminInterfaceTransportGetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceTransportGetInfo", .signature = "\x00\x05\x09\x18\x11\x80\x85\x09\x0f\x0f\x05\x0f\x09" } },
    .{ "MprAdminInterfaceTransportSetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceTransportSetInfo", .signature = "\x00\x05\x09\x18\x11\x80\x85\x09\x0f\x05\x09" } },
    .{ "MprAdminInterfaceEnum", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceEnum", .signature = "\x00\x07\x09\x18\x09\x0f\x0f\x05\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "MprAdminInterfaceSetCredentials", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceSetCredentials", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "MprAdminInterfaceGetCredentials", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceGetCredentials", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "MprAdminInterfaceSetCredentialsEx", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceSetCredentialsEx", .signature = "\x00\x04\x09\x18\x11\x80\x85\x09\x0f\x05" } },
    .{ "MprAdminInterfaceGetCredentialsEx", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceGetCredentialsEx", .signature = "\x00\x04\x09\x18\x11\x80\x85\x09\x0f\x0f\x05" } },
    .{ "MprAdminInterfaceConnect", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceConnect", .signature = "\x00\x04\x09\x18\x11\x80\x85\x11\x80\x85\x11\x59" } },
    .{ "MprAdminInterfaceDisconnect", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceDisconnect", .signature = "\x00\x02\x09\x18\x11\x80\x85" } },
    .{ "MprAdminInterfaceUpdateRoutes", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceUpdateRoutes", .signature = "\x00\x04\x09\x18\x11\x80\x85\x09\x11\x80\x85" } },
    .{ "MprAdminInterfaceQueryUpdateResult", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceQueryUpdateResult", .signature = "\x00\x04\x09\x18\x11\x80\x85\x09\x0f\x09" } },
    .{ "MprAdminInterfaceUpdatePhonebookInfo", MethodRecord{ .library = "MPRAPI", .import = "MprAdminInterfaceUpdatePhonebookInfo", .signature = "\x00\x02\x09\x18\x11\x80\x85" } },
    .{ "MprAdminRegisterConnectionNotification", MethodRecord{ .library = "MPRAPI", .import = "MprAdminRegisterConnectionNotification", .signature = "\x00\x02\x09\x18\x11\x80\x85" } },
    .{ "MprAdminDeregisterConnectionNotification", MethodRecord{ .library = "MPRAPI", .import = "MprAdminDeregisterConnectionNotification", .signature = "\x00\x02\x09\x18\x11\x80\x85" } },
    .{ "MprAdminMIBServerConnect", MethodRecord{ .library = "MPRAPI", .import = "MprAdminMIBServerConnect", .signature = "\x00\x02\x09\x11\x05\x0f\x18" } },
    .{ "MprAdminMIBServerDisconnect", MethodRecord{ .library = "MPRAPI", .import = "MprAdminMIBServerDisconnect", .signature = "\x00\x01\x01\x18" } },
    .{ "MprAdminMIBEntryCreate", MethodRecord{ .library = "MPRAPI", .import = "MprAdminMIBEntryCreate", .signature = "\x00\x05\x09\x18\x09\x09\x0f\x01\x09" } },
    .{ "MprAdminMIBEntryDelete", MethodRecord{ .library = "MPRAPI", .import = "MprAdminMIBEntryDelete", .signature = "\x00\x05\x09\x18\x09\x09\x0f\x01\x09" } },
    .{ "MprAdminMIBEntrySet", MethodRecord{ .library = "MPRAPI", .import = "MprAdminMIBEntrySet", .signature = "\x00\x05\x09\x18\x09\x09\x0f\x01\x09" } },
    .{ "MprAdminMIBEntryGet", MethodRecord{ .library = "MPRAPI", .import = "MprAdminMIBEntryGet", .signature = "\x00\x07\x09\x18\x09\x09\x0f\x01\x09\x0f\x0f\x01\x0f\x09" } },
    .{ "MprAdminMIBEntryGetFirst", MethodRecord{ .library = "MPRAPI", .import = "MprAdminMIBEntryGetFirst", .signature = "\x00\x07\x09\x18\x09\x09\x0f\x01\x09\x0f\x0f\x01\x0f\x09" } },
    .{ "MprAdminMIBEntryGetNext", MethodRecord{ .library = "MPRAPI", .import = "MprAdminMIBEntryGetNext", .signature = "\x00\x07\x09\x18\x09\x09\x0f\x01\x09\x0f\x0f\x01\x0f\x09" } },
    .{ "MprAdminMIBBufferFree", MethodRecord{ .library = "MPRAPI", .import = "MprAdminMIBBufferFree", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "MprConfigServerInstall", MethodRecord{ .library = "MPRAPI", .import = "MprConfigServerInstall", .signature = "\x00\x02\x09\x09\x0f\x01" } },
    .{ "MprConfigServerConnect", MethodRecord{ .library = "MPRAPI", .import = "MprConfigServerConnect", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x80\x85" } },
    .{ "MprConfigServerDisconnect", MethodRecord{ .library = "MPRAPI", .import = "MprConfigServerDisconnect", .signature = "\x00\x01\x01\x11\x80\x85" } },
    .{ "MprConfigServerRefresh", MethodRecord{ .library = "MPRAPI", .import = "MprConfigServerRefresh", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "MprConfigBufferFree", MethodRecord{ .library = "MPRAPI", .import = "MprConfigBufferFree", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "MprConfigServerGetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprConfigServerGetInfo", .signature = "\x00\x03\x09\x11\x80\x85\x09\x0f\x0f\x05" } },
    .{ "MprConfigServerSetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprConfigServerSetInfo", .signature = "\x00\x03\x09\x18\x09\x0f\x05" } },
    .{ "MprConfigServerBackup", MethodRecord{ .library = "MPRAPI", .import = "MprConfigServerBackup", .signature = "\x00\x02\x09\x11\x80\x85\x11\x05" } },
    .{ "MprConfigServerRestore", MethodRecord{ .library = "MPRAPI", .import = "MprConfigServerRestore", .signature = "\x00\x02\x09\x11\x80\x85\x11\x05" } },
    .{ "MprConfigTransportCreate", MethodRecord{ .library = "MPRAPI", .import = "MprConfigTransportCreate", .signature = "\x00\x09\x09\x11\x80\x85\x09\x11\x05\x0f\x05\x09\x0f\x05\x09\x11\x05\x0f\x11\x80\x85" } },
    .{ "MprConfigTransportDelete", MethodRecord{ .library = "MPRAPI", .import = "MprConfigTransportDelete", .signature = "\x00\x02\x09\x11\x80\x85\x11\x80\x85" } },
    .{ "MprConfigTransportGetHandle", MethodRecord{ .library = "MPRAPI", .import = "MprConfigTransportGetHandle", .signature = "\x00\x03\x09\x11\x80\x85\x09\x0f\x11\x80\x85" } },
    .{ "MprConfigTransportSetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprConfigTransportSetInfo", .signature = "\x00\x07\x09\x11\x80\x85\x11\x80\x85\x0f\x05\x09\x0f\x05\x09\x11\x05" } },
    .{ "MprConfigTransportGetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprConfigTransportGetInfo", .signature = "\x00\x07\x09\x11\x80\x85\x11\x80\x85\x0f\x0f\x05\x0f\x09\x0f\x0f\x05\x0f\x09\x0f\x11\x05" } },
    .{ "MprConfigTransportEnum", MethodRecord{ .library = "MPRAPI", .import = "MprConfigTransportEnum", .signature = "\x00\x07\x09\x11\x80\x85\x09\x0f\x0f\x05\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "MprConfigInterfaceCreate", MethodRecord{ .library = "MPRAPI", .import = "MprConfigInterfaceCreate", .signature = "\x00\x04\x09\x11\x80\x85\x09\x0f\x05\x0f\x11\x80\x85" } },
    .{ "MprConfigInterfaceDelete", MethodRecord{ .library = "MPRAPI", .import = "MprConfigInterfaceDelete", .signature = "\x00\x02\x09\x11\x80\x85\x11\x80\x85" } },
    .{ "MprConfigInterfaceGetHandle", MethodRecord{ .library = "MPRAPI", .import = "MprConfigInterfaceGetHandle", .signature = "\x00\x03\x09\x11\x80\x85\x11\x05\x0f\x11\x80\x85" } },
    .{ "MprConfigInterfaceGetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprConfigInterfaceGetInfo", .signature = "\x00\x05\x09\x11\x80\x85\x11\x80\x85\x09\x0f\x0f\x05\x0f\x09" } },
    .{ "MprConfigInterfaceSetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprConfigInterfaceSetInfo", .signature = "\x00\x04\x09\x11\x80\x85\x11\x80\x85\x09\x0f\x05" } },
    .{ "MprConfigInterfaceEnum", MethodRecord{ .library = "MPRAPI", .import = "MprConfigInterfaceEnum", .signature = "\x00\x07\x09\x11\x80\x85\x09\x0f\x0f\x05\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "MprConfigInterfaceTransportAdd", MethodRecord{ .library = "MPRAPI", .import = "MprConfigInterfaceTransportAdd", .signature = "\x00\x07\x09\x11\x80\x85\x11\x80\x85\x09\x11\x05\x0f\x05\x09\x0f\x11\x80\x85" } },
    .{ "MprConfigInterfaceTransportRemove", MethodRecord{ .library = "MPRAPI", .import = "MprConfigInterfaceTransportRemove", .signature = "\x00\x03\x09\x11\x80\x85\x11\x80\x85\x11\x80\x85" } },
    .{ "MprConfigInterfaceTransportGetHandle", MethodRecord{ .library = "MPRAPI", .import = "MprConfigInterfaceTransportGetHandle", .signature = "\x00\x04\x09\x11\x80\x85\x11\x80\x85\x09\x0f\x11\x80\x85" } },
    .{ "MprConfigInterfaceTransportGetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprConfigInterfaceTransportGetInfo", .signature = "\x00\x05\x09\x11\x80\x85\x11\x80\x85\x11\x80\x85\x0f\x0f\x05\x0f\x09" } },
    .{ "MprConfigInterfaceTransportSetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprConfigInterfaceTransportSetInfo", .signature = "\x00\x05\x09\x11\x80\x85\x11\x80\x85\x11\x80\x85\x0f\x05\x09" } },
    .{ "MprConfigInterfaceTransportEnum", MethodRecord{ .library = "MPRAPI", .import = "MprConfigInterfaceTransportEnum", .signature = "\x00\x08\x09\x11\x80\x85\x11\x80\x85\x09\x0f\x0f\x05\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "MprConfigGetFriendlyName", MethodRecord{ .library = "MPRAPI", .import = "MprConfigGetFriendlyName", .signature = "\x00\x04\x09\x11\x80\x85\x11\x05\x11\x05\x09" } },
    .{ "MprConfigGetGuidName", MethodRecord{ .library = "MPRAPI", .import = "MprConfigGetGuidName", .signature = "\x00\x04\x09\x11\x80\x85\x11\x05\x11\x05\x09" } },
    .{ "MprConfigFilterGetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprConfigFilterGetInfo", .signature = "\x00\x04\x09\x11\x80\x85\x09\x09\x0f\x05" } },
    .{ "MprConfigFilterSetInfo", MethodRecord{ .library = "MPRAPI", .import = "MprConfigFilterSetInfo", .signature = "\x00\x04\x09\x11\x80\x85\x09\x09\x0f\x05" } },
    .{ "MprInfoCreate", MethodRecord{ .library = "MPRAPI", .import = "MprInfoCreate", .signature = "\x00\x02\x09\x09\x0f\x0f\x01" } },
    .{ "MprInfoDelete", MethodRecord{ .library = "MPRAPI", .import = "MprInfoDelete", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "MprInfoRemoveAll", MethodRecord{ .library = "MPRAPI", .import = "MprInfoRemoveAll", .signature = "\x00\x02\x09\x0f\x01\x0f\x0f\x01" } },
    .{ "MprInfoDuplicate", MethodRecord{ .library = "MPRAPI", .import = "MprInfoDuplicate", .signature = "\x00\x02\x09\x0f\x01\x0f\x0f\x01" } },
    .{ "MprInfoBlockAdd", MethodRecord{ .library = "MPRAPI", .import = "MprInfoBlockAdd", .signature = "\x00\x06\x09\x0f\x01\x09\x09\x09\x0f\x05\x0f\x0f\x01" } },
    .{ "MprInfoBlockRemove", MethodRecord{ .library = "MPRAPI", .import = "MprInfoBlockRemove", .signature = "\x00\x03\x09\x0f\x01\x09\x0f\x0f\x01" } },
    .{ "MprInfoBlockSet", MethodRecord{ .library = "MPRAPI", .import = "MprInfoBlockSet", .signature = "\x00\x06\x09\x0f\x01\x09\x09\x09\x0f\x05\x0f\x0f\x01" } },
    .{ "MprInfoBlockFind", MethodRecord{ .library = "MPRAPI", .import = "MprInfoBlockFind", .signature = "\x00\x05\x09\x0f\x01\x09\x0f\x09\x0f\x09\x0f\x0f\x05" } },
    .{ "MprInfoBlockQuerySize", MethodRecord{ .library = "MPRAPI", .import = "MprInfoBlockQuerySize", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "MgmRegisterMProtocol", MethodRecord{ .library = "rtm", .import = "MgmRegisterMProtocol", .signature = "\x00\x04\x09\x0f\x11\xb9\x39\x09\x09\x0f\x11\x80\x85" } },
    .{ "MgmDeRegisterMProtocol", MethodRecord{ .library = "rtm", .import = "MgmDeRegisterMProtocol", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "MgmTakeInterfaceOwnership", MethodRecord{ .library = "rtm", .import = "MgmTakeInterfaceOwnership", .signature = "\x00\x03\x09\x11\x80\x85\x09\x09" } },
    .{ "MgmReleaseInterfaceOwnership", MethodRecord{ .library = "rtm", .import = "MgmReleaseInterfaceOwnership", .signature = "\x00\x03\x09\x11\x80\x85\x09\x09" } },
    .{ "MgmGetProtocolOnInterface", MethodRecord{ .library = "rtm", .import = "MgmGetProtocolOnInterface", .signature = "\x00\x04\x09\x09\x09\x0f\x09\x0f\x09" } },
    .{ "MgmAddGroupMembershipEntry", MethodRecord{ .library = "rtm", .import = "MgmAddGroupMembershipEntry", .signature = "\x00\x08\x09\x11\x80\x85\x09\x09\x09\x09\x09\x09\x09" } },
    .{ "MgmDeleteGroupMembershipEntry", MethodRecord{ .library = "rtm", .import = "MgmDeleteGroupMembershipEntry", .signature = "\x00\x08\x09\x11\x80\x85\x09\x09\x09\x09\x09\x09\x09" } },
    .{ "MgmGetMfe", MethodRecord{ .library = "rtm", .import = "MgmGetMfe", .signature = "\x00\x03\x09\x0f\x11\xb9\x3d\x0f\x09\x0f\x05" } },
    .{ "MgmGetFirstMfe", MethodRecord{ .library = "rtm", .import = "MgmGetFirstMfe", .signature = "\x00\x03\x09\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "MgmGetNextMfe", MethodRecord{ .library = "rtm", .import = "MgmGetNextMfe", .signature = "\x00\x04\x09\x0f\x11\xb9\x3d\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "MgmGetMfeStats", MethodRecord{ .library = "rtm", .import = "MgmGetMfeStats", .signature = "\x00\x04\x09\x0f\x11\xb9\x3d\x0f\x09\x0f\x05\x09" } },
    .{ "MgmGetFirstMfeStats", MethodRecord{ .library = "rtm", .import = "MgmGetFirstMfeStats", .signature = "\x00\x04\x09\x0f\x09\x0f\x05\x0f\x09\x09" } },
    .{ "MgmGetNextMfeStats", MethodRecord{ .library = "rtm", .import = "MgmGetNextMfeStats", .signature = "\x00\x05\x09\x0f\x11\xb9\x3d\x0f\x09\x0f\x05\x0f\x09\x09" } },
    .{ "MgmGroupEnumerationStart", MethodRecord{ .library = "rtm", .import = "MgmGroupEnumerationStart", .signature = "\x00\x03\x09\x11\x80\x85\x11\xb9\x41\x0f\x11\x80\x85" } },
    .{ "MgmGroupEnumerationGetNext", MethodRecord{ .library = "rtm", .import = "MgmGroupEnumerationGetNext", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "MgmGroupEnumerationEnd", MethodRecord{ .library = "rtm", .import = "MgmGroupEnumerationEnd", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "RtmConvertNetAddressToIpv6AddressAndLength", MethodRecord{ .library = "rtm", .import = "RtmConvertNetAddressToIpv6AddressAndLength", .signature = "\x00\x04\x09\x0f\x11\xb9\x45\x0f\x11\xb3\xd9\x0f\x09\x09" } },
    .{ "RtmConvertIpv6AddressAndLengthToNetAddress", MethodRecord{ .library = "rtm", .import = "RtmConvertIpv6AddressAndLengthToNetAddress", .signature = "\x00\x04\x09\x0f\x11\xb9\x45\x11\xb3\xd9\x09\x09" } },
    .{ "RtmRegisterEntity", MethodRecord{ .library = "rtm", .import = "RtmRegisterEntity", .signature = "\x00\x06\x09\x0f\x11\xb9\x49\x0f\x11\xb9\x4d\x12\xb9\x51\x11\x59\x0f\x11\xb9\x55\x0f\x18" } },
    .{ "RtmDeregisterEntity", MethodRecord{ .library = "rtm", .import = "RtmDeregisterEntity", .signature = "\x00\x01\x09\x18" } },
    .{ "RtmGetRegisteredEntities", MethodRecord{ .library = "rtm", .import = "RtmGetRegisteredEntities", .signature = "\x00\x04\x09\x18\x0f\x09\x0f\x18\x0f\x11\xb9\x49" } },
    .{ "RtmReleaseEntities", MethodRecord{ .library = "rtm", .import = "RtmReleaseEntities", .signature = "\x00\x03\x09\x18\x09\x0f\x18" } },
    .{ "RtmLockDestination", MethodRecord{ .library = "rtm", .import = "RtmLockDestination", .signature = "\x00\x04\x09\x18\x18\x11\x59\x11\x59" } },
    .{ "RtmGetOpaqueInformationPointer", MethodRecord{ .library = "rtm", .import = "RtmGetOpaqueInformationPointer", .signature = "\x00\x03\x09\x18\x18\x0f\x0f\x01" } },
    .{ "RtmGetEntityMethods", MethodRecord{ .library = "rtm", .import = "RtmGetEntityMethods", .signature = "\x00\x04\x09\x18\x18\x0f\x09\x0f\x12\xb9\x59" } },
    .{ "RtmInvokeMethod", MethodRecord{ .library = "rtm", .import = "RtmInvokeMethod", .signature = "\x00\x05\x09\x18\x18\x0f\x11\xb9\x5d\x0f\x09\x0f\x11\xb9\x61" } },
    .{ "RtmBlockMethods", MethodRecord{ .library = "rtm", .import = "RtmBlockMethods", .signature = "\x00\x04\x09\x18\x11\x80\x85\x05\x09" } },
    .{ "RtmGetEntityInfo", MethodRecord{ .library = "rtm", .import = "RtmGetEntityInfo", .signature = "\x00\x03\x09\x18\x18\x0f\x11\xb9\x49" } },
    .{ "RtmGetDestInfo", MethodRecord{ .library = "rtm", .import = "RtmGetDestInfo", .signature = "\x00\x05\x09\x18\x18\x09\x09\x0f\x11\xb9\x65" } },
    .{ "RtmGetRouteInfo", MethodRecord{ .library = "rtm", .import = "RtmGetRouteInfo", .signature = "\x00\x04\x09\x18\x18\x0f\x11\xb9\x69\x0f\x11\xb9\x45" } },
    .{ "RtmGetNextHopInfo", MethodRecord{ .library = "rtm", .import = "RtmGetNextHopInfo", .signature = "\x00\x03\x09\x18\x18\x0f\x11\xb9\x6d" } },
    .{ "RtmReleaseEntityInfo", MethodRecord{ .library = "rtm", .import = "RtmReleaseEntityInfo", .signature = "\x00\x02\x09\x18\x0f\x11\xb9\x49" } },
    .{ "RtmReleaseDestInfo", MethodRecord{ .library = "rtm", .import = "RtmReleaseDestInfo", .signature = "\x00\x02\x09\x18\x0f\x11\xb9\x65" } },
    .{ "RtmReleaseRouteInfo", MethodRecord{ .library = "rtm", .import = "RtmReleaseRouteInfo", .signature = "\x00\x02\x09\x18\x0f\x11\xb9\x69" } },
    .{ "RtmReleaseNextHopInfo", MethodRecord{ .library = "rtm", .import = "RtmReleaseNextHopInfo", .signature = "\x00\x02\x09\x18\x0f\x11\xb9\x6d" } },
    .{ "RtmAddRouteToDest", MethodRecord{ .library = "rtm", .import = "RtmAddRouteToDest", .signature = "\x00\x09\x09\x18\x0f\x18\x0f\x11\xb9\x45\x0f\x11\xb9\x69\x09\x18\x09\x18\x0f\x09" } },
    .{ "RtmDeleteRouteToDest", MethodRecord{ .library = "rtm", .import = "RtmDeleteRouteToDest", .signature = "\x00\x03\x09\x18\x18\x0f\x09" } },
    .{ "RtmHoldDestination", MethodRecord{ .library = "rtm", .import = "RtmHoldDestination", .signature = "\x00\x04\x09\x18\x18\x09\x09" } },
    .{ "RtmGetRoutePointer", MethodRecord{ .library = "rtm", .import = "RtmGetRoutePointer", .signature = "\x00\x03\x09\x18\x18\x0f\x0f\x11\xb9\x69" } },
    .{ "RtmLockRoute", MethodRecord{ .library = "rtm", .import = "RtmLockRoute", .signature = "\x00\x05\x09\x18\x18\x11\x59\x11\x59\x0f\x0f\x11\xb9\x69" } },
    .{ "RtmUpdateAndUnlockRoute", MethodRecord{ .library = "rtm", .import = "RtmUpdateAndUnlockRoute", .signature = "\x00\x07\x09\x18\x18\x09\x18\x09\x18\x0f\x09" } },
    .{ "RtmGetExactMatchDestination", MethodRecord{ .library = "rtm", .import = "RtmGetExactMatchDestination", .signature = "\x00\x05\x09\x18\x0f\x11\xb9\x45\x09\x09\x0f\x11\xb9\x65" } },
    .{ "RtmGetMostSpecificDestination", MethodRecord{ .library = "rtm", .import = "RtmGetMostSpecificDestination", .signature = "\x00\x05\x09\x18\x0f\x11\xb9\x45\x09\x09\x0f\x11\xb9\x65" } },
    .{ "RtmGetLessSpecificDestination", MethodRecord{ .library = "rtm", .import = "RtmGetLessSpecificDestination", .signature = "\x00\x05\x09\x18\x18\x09\x09\x0f\x11\xb9\x65" } },
    .{ "RtmGetExactMatchRoute", MethodRecord{ .library = "rtm", .import = "RtmGetExactMatchRoute", .signature = "\x00\x07\x09\x18\x0f\x11\xb9\x45\x09\x0f\x11\xb9\x69\x09\x09\x0f\x18" } },
    .{ "RtmIsBestRoute", MethodRecord{ .library = "rtm", .import = "RtmIsBestRoute", .signature = "\x00\x03\x09\x18\x18\x0f\x09" } },
    .{ "RtmAddNextHop", MethodRecord{ .library = "rtm", .import = "RtmAddNextHop", .signature = "\x00\x04\x09\x18\x0f\x11\xb9\x6d\x0f\x18\x0f\x09" } },
    .{ "RtmFindNextHop", MethodRecord{ .library = "rtm", .import = "RtmFindNextHop", .signature = "\x00\x04\x09\x18\x0f\x11\xb9\x6d\x0f\x18\x0f\x0f\x11\xb9\x6d" } },
    .{ "RtmDeleteNextHop", MethodRecord{ .library = "rtm", .import = "RtmDeleteNextHop", .signature = "\x00\x03\x09\x18\x18\x0f\x11\xb9\x6d" } },
    .{ "RtmGetNextHopPointer", MethodRecord{ .library = "rtm", .import = "RtmGetNextHopPointer", .signature = "\x00\x03\x09\x18\x18\x0f\x0f\x11\xb9\x6d" } },
    .{ "RtmLockNextHop", MethodRecord{ .library = "rtm", .import = "RtmLockNextHop", .signature = "\x00\x05\x09\x18\x18\x11\x59\x11\x59\x0f\x0f\x11\xb9\x6d" } },
    .{ "RtmCreateDestEnum", MethodRecord{ .library = "rtm", .import = "RtmCreateDestEnum", .signature = "\x00\x06\x09\x18\x09\x09\x0f\x11\xb9\x45\x09\x0f\x18" } },
    .{ "RtmGetEnumDests", MethodRecord{ .library = "rtm", .import = "RtmGetEnumDests", .signature = "\x00\x04\x09\x18\x18\x0f\x09\x0f\x11\xb9\x65" } },
    .{ "RtmReleaseDests", MethodRecord{ .library = "rtm", .import = "RtmReleaseDests", .signature = "\x00\x03\x09\x18\x09\x0f\x11\xb9\x65" } },
    .{ "RtmCreateRouteEnum", MethodRecord{ .library = "rtm", .import = "RtmCreateRouteEnum", .signature = "\x00\x09\x09\x18\x18\x09\x09\x0f\x11\xb9\x45\x09\x0f\x11\xb9\x69\x09\x0f\x18" } },
    .{ "RtmGetEnumRoutes", MethodRecord{ .library = "rtm", .import = "RtmGetEnumRoutes", .signature = "\x00\x04\x09\x18\x18\x0f\x09\x0f\x18" } },
    .{ "RtmReleaseRoutes", MethodRecord{ .library = "rtm", .import = "RtmReleaseRoutes", .signature = "\x00\x03\x09\x18\x09\x0f\x18" } },
    .{ "RtmCreateNextHopEnum", MethodRecord{ .library = "rtm", .import = "RtmCreateNextHopEnum", .signature = "\x00\x04\x09\x18\x09\x0f\x11\xb9\x45\x0f\x18" } },
    .{ "RtmGetEnumNextHops", MethodRecord{ .library = "rtm", .import = "RtmGetEnumNextHops", .signature = "\x00\x04\x09\x18\x18\x0f\x09\x0f\x18" } },
    .{ "RtmReleaseNextHops", MethodRecord{ .library = "rtm", .import = "RtmReleaseNextHops", .signature = "\x00\x03\x09\x18\x09\x0f\x18" } },
    .{ "RtmDeleteEnumHandle", MethodRecord{ .library = "rtm", .import = "RtmDeleteEnumHandle", .signature = "\x00\x02\x09\x18\x18" } },
    .{ "RtmRegisterForChangeNotification", MethodRecord{ .library = "rtm", .import = "RtmRegisterForChangeNotification", .signature = "\x00\x05\x09\x18\x09\x09\x0f\x01\x0f\x18" } },
    .{ "RtmGetChangedDests", MethodRecord{ .library = "rtm", .import = "RtmGetChangedDests", .signature = "\x00\x04\x09\x18\x18\x0f\x09\x0f\x11\xb9\x65" } },
    .{ "RtmReleaseChangedDests", MethodRecord{ .library = "rtm", .import = "RtmReleaseChangedDests", .signature = "\x00\x04\x09\x18\x18\x09\x0f\x11\xb9\x65" } },
    .{ "RtmIgnoreChangedDests", MethodRecord{ .library = "rtm", .import = "RtmIgnoreChangedDests", .signature = "\x00\x04\x09\x18\x18\x09\x0f\x18" } },
    .{ "RtmGetChangeStatus", MethodRecord{ .library = "rtm", .import = "RtmGetChangeStatus", .signature = "\x00\x04\x09\x18\x18\x18\x0f\x11\x59" } },
    .{ "RtmMarkDestForChangeNotification", MethodRecord{ .library = "rtm", .import = "RtmMarkDestForChangeNotification", .signature = "\x00\x04\x09\x18\x18\x18\x11\x59" } },
    .{ "RtmIsMarkedForChangeNotification", MethodRecord{ .library = "rtm", .import = "RtmIsMarkedForChangeNotification", .signature = "\x00\x04\x09\x18\x18\x18\x0f\x11\x59" } },
    .{ "RtmDeregisterFromChangeNotification", MethodRecord{ .library = "rtm", .import = "RtmDeregisterFromChangeNotification", .signature = "\x00\x02\x09\x18\x18" } },
    .{ "RtmCreateRouteList", MethodRecord{ .library = "rtm", .import = "RtmCreateRouteList", .signature = "\x00\x02\x09\x18\x0f\x18" } },
    .{ "RtmInsertInRouteList", MethodRecord{ .library = "rtm", .import = "RtmInsertInRouteList", .signature = "\x00\x04\x09\x18\x18\x09\x0f\x18" } },
    .{ "RtmCreateRouteListEnum", MethodRecord{ .library = "rtm", .import = "RtmCreateRouteListEnum", .signature = "\x00\x03\x09\x18\x18\x0f\x18" } },
    .{ "RtmGetListEnumRoutes", MethodRecord{ .library = "rtm", .import = "RtmGetListEnumRoutes", .signature = "\x00\x04\x09\x18\x18\x0f\x09\x0f\x18" } },
    .{ "RtmDeleteRouteList", MethodRecord{ .library = "rtm", .import = "RtmDeleteRouteList", .signature = "\x00\x02\x09\x18\x18" } },
    .{ "RtmReferenceHandles", MethodRecord{ .library = "rtm", .import = "RtmReferenceHandles", .signature = "\x00\x03\x09\x18\x09\x0f\x11\x80\x85" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x33d9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "IN6_ADDR" },
        0x38a1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASDIALEXTENSIONS" },
        0x38a5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASDIALPARAMSA" },
        0x38a9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "HRASCONN" },
        0x38ad => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASDIALPARAMSW" },
        0x38b1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASCONNA" },
        0x38b5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASCONNW" },
        0x38b9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASENTRYNAMEA" },
        0x38bd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASENTRYNAMEW" },
        0x38c1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASCONNSTATUSA" },
        0x38c5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASCONNSTATUSW" },
        0x38c9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASPROJECTION" },
        0x38cd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASDEVINFOA" },
        0x38d1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASDEVINFOW" },
        0x38d5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASCTRYINFO" },
        0x38d9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASENTRYA" },
        0x38dd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASENTRYW" },
        0x38e1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASCREDENTIALSA" },
        0x38e5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASCREDENTIALSW" },
        0x38e9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASSUBENTRYA" },
        0x38ed => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASSUBENTRYW" },
        0x38f1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASAUTODIALENTRYA" },
        0x38f5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASAUTODIALENTRYW" },
        0x38f9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RAS_STATS" },
        0x38fd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASEAPUSERIDENTITYW" },
        0x3901 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASEAPUSERIDENTITYA" },
        0x3905 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASUPDATECONN" },
        0x3909 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RAS_PROJECTION_INFO" },
        0x390d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASPBDLGA" },
        0x3911 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASPBDLGW" },
        0x3915 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASENTRYDLGA" },
        0x3919 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASENTRYDLGW" },
        0x391d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RASDIALDLG" },
        0x3921 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "MPRAPI_OBJECT_HEADER" },
        0x3925 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RAS_CONNECTION_EX" },
        0x3929 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "MPR_SERVER_EX1" },
        0x392d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "MPR_SERVER_SET_CONFIG_EX1" },
        0x3931 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RAS_UPDATE_CONNECTION" },
        0x3935 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "MPR_IF_CUSTOMINFOEX2" },
        0x3939 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "ROUTING_PROTOCOL_CONFIG" },
        0x393d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPMCAST_MFE" },
        0x3941 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "MGM_ENUM_TYPES" },
        0x3945 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RTM_NET_ADDRESS" },
        0x3949 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RTM_ENTITY_INFO" },
        0x394d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RTM_ENTITY_EXPORT_METHODS" },
        0x3951 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RTM_EVENT_CALLBACK" },
        0x3955 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RTM_REGN_PROFILE" },
        0x3959 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RTM_ENTITY_EXPORT_METHOD" },
        0x395d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RTM_ENTITY_METHOD_INPUT" },
        0x3961 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RTM_ENTITY_METHOD_OUTPUT" },
        0x3965 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RTM_DEST_INFO" },
        0x3969 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RTM_ROUTE_INFO" },
        0x396d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Rras", .name = "RTM_NEXTHOP_INFO" },
        else => null,
    };
}

pub const MPRDM_DialFirst = 0;
pub const MPRDM_DialAll = 1;
pub const MPRDM_DialAsNeeded = 2;
pub const RASEDM_DialAll = 1;
pub const RASEDM_DialAsNeeded = 2;
pub const RAS_FLAGS_PPP_CONNECTION = 1;
pub const RAS_FLAGS_MESSENGER_PRESENT = 2;
pub const RAS_FLAGS_QUARANTINE_PRESENT = 8;
pub const RAS_FLAGS_ARAP_CONNECTION = 16;
pub const RAS_FLAGS_IKEV2_CONNECTION = 16;
pub const RAS_FLAGS_DORMANT = 32;
pub const MPR_ET_None = 0;
pub const MPR_ET_Require = 1;
pub const MPR_ET_RequireMax = 2;
pub const MPR_ET_Optional = 3;
pub const RASLCPAD_CHAP_MD5 = 5;
pub const RASLCPAD_CHAP_MS = 128;
pub const RASLCPAD_CHAP_MSV2 = 129;
pub const PPP_LCP_PAP = 49187;
pub const PPP_LCP_CHAP = 49699;
pub const PPP_LCP_EAP = 49703;
pub const PPP_LCP_SPAP = 49191;
pub const RASLCPAP_PAP = 49187;
pub const RASLCPAP_SPAP = 49191;
pub const RASLCPAP_CHAP = 49699;
pub const RASLCPAP_EAP = 49703;
pub const PPP_LCP_CHAP_MD5 = 5;
pub const PPP_LCP_CHAP_MS = 128;
pub const PPP_LCP_CHAP_MSV2 = 129;
pub const RASIKEv2_FLAGS_MOBIKESUPPORTED = 1;
pub const RASIKEv2_FLAGS_BEHIND_NAT = 2;
pub const RASIKEv2_FLAGS_SERVERBEHIND_NAT = 4;
pub const MPR_VS_Default = 0;
pub const MPR_VS_PptpOnly = 1;
pub const MPR_VS_PptpFirst = 2;
pub const MPR_VS_L2tpOnly = 3;
pub const MPR_VS_L2tpFirst = 4;
pub const SECURITYMSG_SUCCESS = 1;
pub const SECURITYMSG_FAILURE = 2;
pub const SECURITYMSG_ERROR = 3;
pub const RASNAP_ProbationTime = 1;
pub const RASTUNNELENDPOINT_UNKNOWN = 0;
pub const RASTUNNELENDPOINT_IPv4 = 1;
pub const RASTUNNELENDPOINT_IPv6 = 2;
pub const RAS_MaxDeviceType = 16;
pub const RAS_MaxPhoneNumber = 128;
pub const RAS_MaxIpAddress = 15;
pub const RAS_MaxIpxAddress = 21;
pub const RAS_MaxEntryName = 256;
pub const RAS_MaxDeviceName = 128;
pub const RAS_MaxCallbackNumber = 128;
pub const RAS_MaxAreaCode = 10;
pub const RAS_MaxPadType = 32;
pub const RAS_MaxX25Address = 200;
pub const RAS_MaxFacilities = 200;
pub const RAS_MaxUserData = 200;
pub const RAS_MaxReplyMessage = 1024;
pub const RAS_MaxDnsSuffix = 256;
pub const RASCF_AllUsers = 1;
pub const RASCF_GlobalCreds = 2;
pub const RASCF_OwnerKnown = 4;
pub const RASCF_OwnerMatch = 8;
pub const RAS_MaxIDSize = 256;
pub const RASCS_PAUSED = 4096;
pub const RASCS_DONE = 8192;
pub const RASCSS_DONE = 8192;
pub const RDEOPT_UsePrefixSuffix = 1;
pub const RDEOPT_PausedStates = 2;
pub const RDEOPT_IgnoreModemSpeaker = 4;
pub const RDEOPT_SetModemSpeaker = 8;
pub const RDEOPT_IgnoreSoftwareCompression = 16;
pub const RDEOPT_SetSoftwareCompression = 32;
pub const RDEOPT_DisableConnectedUI = 64;
pub const RDEOPT_DisableReconnectUI = 128;
pub const RDEOPT_DisableReconnect = 256;
pub const RDEOPT_NoUser = 512;
pub const RDEOPT_PauseOnScript = 1024;
pub const RDEOPT_Router = 2048;
pub const RDEOPT_CustomDial = 4096;
pub const RDEOPT_UseCustomScripting = 8192;
pub const RDEOPT_InvokeAutoTriggerCredentialUI = 16384;
pub const RDEOPT_EapInfoCryptInCapable = 32768;
pub const REN_User = 0;
pub const REN_AllUsers = 1;
pub const RASIPO_VJ = 1;
pub const RASLCPO_PFC = 1;
pub const RASLCPO_ACFC = 2;
pub const RASLCPO_SSHF = 4;
pub const RASLCPO_DES_56 = 8;
pub const RASLCPO_3_DES = 16;
pub const RASLCPO_AES_128 = 32;
pub const RASLCPO_AES_256 = 64;
pub const RASLCPO_AES_192 = 128;
pub const RASLCPO_GCM_AES_128 = 256;
pub const RASLCPO_GCM_AES_192 = 512;
pub const RASLCPO_GCM_AES_256 = 1024;
pub const RASCCPCA_MPPC = 6;
pub const RASCCPCA_STAC = 5;
pub const RASCCPO_Compression = 1;
pub const RASCCPO_HistoryLess = 2;
pub const RASCCPO_Encryption56bit = 16;
pub const RASCCPO_Encryption40bit = 32;
pub const RASCCPO_Encryption128bit = 64;
pub const RASIKEv2_AUTH_MACHINECERTIFICATES = 1;
pub const RASIKEv2_AUTH_EAP = 2;
pub const RASIKEv2_AUTH_PSK = 3;
pub const WM_RASDIALEVENT = 52429;
pub const ET_None = 0;
pub const ET_Require = 1;
pub const ET_RequireMax = 2;
pub const ET_Optional = 3;
pub const VS_Default = 0;
pub const VS_PptpOnly = 1;
pub const VS_PptpFirst = 2;
pub const VS_L2tpOnly = 3;
pub const VS_L2tpFirst = 4;
pub const VS_SstpOnly = 5;
pub const VS_SstpFirst = 6;
pub const VS_Ikev2Only = 7;
pub const VS_Ikev2First = 8;
pub const VS_GREOnly = 9;
pub const VS_PptpSstp = 12;
pub const VS_L2tpSstp = 13;
pub const VS_Ikev2Sstp = 14;
pub const VS_ProtocolList = 15;
pub const RASEO_UseCountryAndAreaCodes = 1;
pub const RASEO_SpecificIpAddr = 2;
pub const RASEO_SpecificNameServers = 4;
pub const RASEO_IpHeaderCompression = 8;
pub const RASEO_RemoteDefaultGateway = 16;
pub const RASEO_DisableLcpExtensions = 32;
pub const RASEO_TerminalBeforeDial = 64;
pub const RASEO_TerminalAfterDial = 128;
pub const RASEO_ModemLights = 256;
pub const RASEO_SwCompression = 512;
pub const RASEO_RequireEncryptedPw = 1024;
pub const RASEO_RequireMsEncryptedPw = 2048;
pub const RASEO_RequireDataEncryption = 4096;
pub const RASEO_NetworkLogon = 8192;
pub const RASEO_UseLogonCredentials = 16384;
pub const RASEO_PromoteAlternates = 32768;
pub const RASEO_SecureLocalFiles = 65536;
pub const RASEO_RequireEAP = 131072;
pub const RASEO_RequirePAP = 262144;
pub const RASEO_RequireSPAP = 524288;
pub const RASEO_Custom = 1048576;
pub const RASEO_PreviewPhoneNumber = 2097152;
pub const RASEO_SharedPhoneNumbers = 8388608;
pub const RASEO_PreviewUserPw = 16777216;
pub const RASEO_PreviewDomain = 33554432;
pub const RASEO_ShowDialingProgress = 67108864;
pub const RASEO_RequireCHAP = 134217728;
pub const RASEO_RequireMsCHAP = 268435456;
pub const RASEO_RequireMsCHAP2 = 536870912;
pub const RASEO_RequireW95MSCHAP = 1073741824;
pub const RASEO_CustomScript = 2147483648;
pub const RASEO2_SecureFileAndPrint = 1;
pub const RASEO2_SecureClientForMSNet = 2;
pub const RASEO2_DontNegotiateMultilink = 4;
pub const RASEO2_DontUseRasCredentials = 8;
pub const RASEO2_UsePreSharedKey = 16;
pub const RASEO2_Internet = 32;
pub const RASEO2_DisableNbtOverIP = 64;
pub const RASEO2_UseGlobalDeviceSettings = 128;
pub const RASEO2_ReconnectIfDropped = 256;
pub const RASEO2_SharePhoneNumbers = 512;
pub const RASEO2_SecureRoutingCompartment = 1024;
pub const RASEO2_UseTypicalSettings = 2048;
pub const RASEO2_IPv6SpecificNameServers = 4096;
pub const RASEO2_IPv6RemoteDefaultGateway = 8192;
pub const RASEO2_RegisterIpWithDNS = 16384;
pub const RASEO2_UseDNSSuffixForRegistration = 32768;
pub const RASEO2_IPv4ExplicitMetric = 65536;
pub const RASEO2_IPv6ExplicitMetric = 131072;
pub const RASEO2_DisableIKENameEkuCheck = 262144;
pub const RASEO2_DisableClassBasedStaticRoute = 524288;
pub const RASEO2_SpecificIPv6Addr = 1048576;
pub const RASEO2_DisableMobility = 2097152;
pub const RASEO2_RequireMachineCertificates = 4194304;
pub const RASEO2_UsePreSharedKeyForIkev2Initiator = 8388608;
pub const RASEO2_UsePreSharedKeyForIkev2Responder = 16777216;
pub const RASEO2_CacheCredentials = 33554432;
pub const RASEO2_AutoTriggerCapable = 67108864;
pub const RASEO2_IsThirdPartyProfile = 134217728;
pub const RASEO2_AuthTypeIsOtp = 268435456;
pub const RASEO2_IsAlwaysOn = 536870912;
pub const RASEO2_IsPrivateNetwork = 1073741824;
pub const RASEO2_PlumbIKEv2TSAsRoutes = 2147483648;
pub const RASNP_NetBEUI = 1;
pub const RASNP_Ipx = 2;
pub const RASNP_Ip = 4;
pub const RASNP_Ipv6 = 8;
pub const RASFP_Ppp = 1;
pub const RASFP_Slip = 2;
pub const RASFP_Ras = 4;
pub const RASET_Phone = 1;
pub const RASET_Vpn = 2;
pub const RASET_Direct = 3;
pub const RASET_Internet = 4;
pub const RASET_Broadband = 5;
pub const RASCN_Connection = 1;
pub const RASCN_Disconnection = 2;
pub const RASCN_BandwidthAdded = 4;
pub const RASCN_BandwidthRemoved = 8;
pub const RASCN_Dormant = 16;
pub const RASCN_ReConnection = 32;
pub const RASCN_EPDGPacketArrival = 64;
pub const RASIDS_Disabled = 4294967295;
pub const RASIDS_UseGlobalValue = 0;
pub const RASADFLG_PositionDlg = 1;
pub const RASCM_UserName = 1;
pub const RASCM_Password = 2;
pub const RASCM_Domain = 4;
pub const RASCM_DefaultCreds = 8;
pub const RASCM_PreSharedKey = 16;
pub const RASCM_ServerPreSharedKey = 32;
pub const RASCM_DDMPreSharedKey = 64;
pub const RASADP_DisableConnectionQuery = 0;
pub const RASADP_LoginSessionDisable = 1;
pub const RASADP_SavedAddressesLimit = 2;
pub const RASADP_FailedConnectionTimeout = 3;
pub const RASADP_ConnectionQueryTimeout = 4;
pub const RASEAPF_NonInteractive = 2;
pub const RASEAPF_Logon = 4;
pub const RASEAPF_Preview = 8;
pub const RCD_SingleUser = 0;
pub const RCD_AllUsers = 1;
pub const RCD_Eap = 2;
pub const RCD_Logon = 4;
pub const RASPBDEVENT_AddEntry = 1;
pub const RASPBDEVENT_EditEntry = 2;
pub const RASPBDEVENT_RemoveEntry = 3;
pub const RASPBDEVENT_DialEntry = 4;
pub const RASPBDEVENT_EditGlobals = 5;
pub const RASPBDEVENT_NoUser = 6;
pub const RASPBDEVENT_NoUserEdit = 7;
pub const RASNOUSER_SmartCard = 1;
pub const RASPBDFLAG_PositionDlg = 1;
pub const RASPBDFLAG_ForceCloseOnDial = 2;
pub const RASPBDFLAG_NoUser = 16;
pub const RASPBDFLAG_UpdateDefaults = 2147483648;
pub const RASEDFLAG_PositionDlg = 1;
pub const RASEDFLAG_NewEntry = 2;
pub const RASEDFLAG_CloneEntry = 4;
pub const RASEDFLAG_NoRename = 8;
pub const RASEDFLAG_ShellOwned = 1073741824;
pub const RASEDFLAG_NewPhoneEntry = 16;
pub const RASEDFLAG_NewTunnelEntry = 32;
pub const RASEDFLAG_NewDirectEntry = 64;
pub const RASEDFLAG_NewBroadbandEntry = 128;
pub const RASEDFLAG_InternetEntry = 256;
pub const RASEDFLAG_NAT = 512;
pub const RASEDFLAG_IncomingConnection = 1024;
pub const RASDDFLAG_PositionDlg = 1;
pub const RASDDFLAG_NoPrompt = 2;
pub const RASDDFLAG_AoacRedial = 4;
pub const RASDDFLAG_LinkFailure = 2147483648;
pub const PID_IPX = 43;
pub const PID_IP = 33;
pub const PID_IPV6 = 87;
pub const PID_NBF = 63;
pub const PID_ATALK = 41;
pub const MPR_INTERFACE_OUT_OF_RESOURCES = 1;
pub const MPR_INTERFACE_ADMIN_DISABLED = 2;
pub const MPR_INTERFACE_CONNECTION_FAILURE = 4;
pub const MPR_INTERFACE_SERVICE_PAUSED = 8;
pub const MPR_INTERFACE_DIALOUT_HOURS_RESTRICTION = 16;
pub const MPR_INTERFACE_NO_MEDIA_SENSE = 32;
pub const MPR_INTERFACE_NO_DEVICE = 64;
pub const MPR_MaxDeviceType = 16;
pub const MPR_MaxPhoneNumber = 128;
pub const MPR_MaxIpAddress = 15;
pub const MPR_MaxIpxAddress = 21;
pub const MPR_MaxEntryName = 256;
pub const MPR_MaxDeviceName = 128;
pub const MPR_MaxCallbackNumber = 128;
pub const MPR_MaxAreaCode = 10;
pub const MPR_MaxPadType = 32;
pub const MPR_MaxX25Address = 200;
pub const MPR_MaxFacilities = 200;
pub const MPR_MaxUserData = 200;
pub const MPRIO_SpecificIpAddr = 2;
pub const MPRIO_SpecificNameServers = 4;
pub const MPRIO_IpHeaderCompression = 8;
pub const MPRIO_RemoteDefaultGateway = 16;
pub const MPRIO_DisableLcpExtensions = 32;
pub const MPRIO_SwCompression = 512;
pub const MPRIO_RequireEncryptedPw = 1024;
pub const MPRIO_RequireMsEncryptedPw = 2048;
pub const MPRIO_RequireDataEncryption = 4096;
pub const MPRIO_NetworkLogon = 8192;
pub const MPRIO_PromoteAlternates = 32768;
pub const MPRIO_SecureLocalFiles = 65536;
pub const MPRIO_RequireEAP = 131072;
pub const MPRIO_RequirePAP = 262144;
pub const MPRIO_RequireSPAP = 524288;
pub const MPRIO_SharedPhoneNumbers = 8388608;
pub const MPRIO_RequireCHAP = 134217728;
pub const MPRIO_RequireMsCHAP = 268435456;
pub const MPRIO_RequireMsCHAP2 = 536870912;
pub const MPRIO_IpSecPreSharedKey = 2147483648;
pub const MPRIO_RequireMachineCertificates = 16777216;
pub const MPRIO_UsePreSharedKeyForIkev2Initiator = 33554432;
pub const MPRIO_UsePreSharedKeyForIkev2Responder = 67108864;
pub const MPRNP_Ipx = 2;
pub const MPRNP_Ip = 4;
pub const MPRNP_Ipv6 = 8;
pub const MPRET_Phone = 1;
pub const MPRET_Vpn = 2;
pub const MPRET_Direct = 3;
pub const MPRIDS_Disabled = 4294967295;
pub const MPRIDS_UseGlobalValue = 0;
pub const MPR_VS_Ikev2Only = 7;
pub const MPR_VS_Ikev2First = 8;
pub const MPR_ENABLE_RAS_ON_DEVICE = 1;
pub const MPR_ENABLE_ROUTING_ON_DEVICE = 2;
pub const IPADDRESSLEN = 15;
pub const IPXADDRESSLEN = 22;
pub const ATADDRESSLEN = 32;
pub const MAXIPADRESSLEN = 64;
pub const PPP_IPCP_VJ = 1;
pub const PPP_CCP_COMPRESSION = 1;
pub const PPP_CCP_ENCRYPTION40BITOLD = 16;
pub const PPP_CCP_ENCRYPTION40BIT = 32;
pub const PPP_CCP_ENCRYPTION128BIT = 64;
pub const PPP_CCP_ENCRYPTION56BIT = 128;
pub const PPP_CCP_HISTORYLESS = 16777216;
pub const PPP_LCP_MULTILINK_FRAMING = 1;
pub const PPP_LCP_PFC = 2;
pub const PPP_LCP_ACFC = 4;
pub const PPP_LCP_SSHF = 8;
pub const PPP_LCP_DES_56 = 16;
pub const PPP_LCP_3_DES = 32;
pub const PPP_LCP_AES_128 = 64;
pub const PPP_LCP_AES_256 = 128;
pub const PPP_LCP_AES_192 = 256;
pub const PPP_LCP_GCM_AES_128 = 512;
pub const PPP_LCP_GCM_AES_192 = 1024;
pub const PPP_LCP_GCM_AES_256 = 2048;
pub const RAS_FLAGS_RAS_CONNECTION = 4;
pub const RASPRIV_NoCallback = 1;
pub const RASPRIV_AdminSetCallback = 2;
pub const RASPRIV_CallerSetCallback = 4;
pub const RASPRIV_DialinPrivilege = 8;
pub const RASPRIV2_DialinPolicy = 1;
pub const MPRAPI_IKEV2_AUTH_USING_CERT = 1;
pub const MPRAPI_IKEV2_AUTH_USING_EAP = 2;
pub const MPRAPI_PPP_PROJECTION_INFO_TYPE = 1;
pub const MPRAPI_IKEV2_PROJECTION_INFO_TYPE = 2;
pub const MPRAPI_RAS_CONNECTION_OBJECT_REVISION_1 = 1;
pub const MPRAPI_MPR_IF_CUSTOM_CONFIG_OBJECT_REVISION_1 = 1;
pub const MPRAPI_IF_CUSTOM_CONFIG_FOR_IKEV2 = 1;
pub const MPRAPI_MPR_IF_CUSTOM_CONFIG_OBJECT_REVISION_3 = 3;
pub const MPRAPI_MPR_IF_CUSTOM_CONFIG_OBJECT_REVISION_2 = 2;
pub const MPRAPI_IKEV2_SET_TUNNEL_CONFIG_PARAMS = 1;
pub const MPRAPI_L2TP_SET_TUNNEL_CONFIG_PARAMS = 1;
pub const MAX_SSTP_HASH_SIZE = 32;
pub const MPRAPI_MPR_SERVER_OBJECT_REVISION_1 = 1;
pub const MPRAPI_MPR_SERVER_OBJECT_REVISION_2 = 2;
pub const MPRAPI_MPR_SERVER_OBJECT_REVISION_3 = 3;
pub const MPRAPI_MPR_SERVER_OBJECT_REVISION_4 = 4;
pub const MPRAPI_MPR_SERVER_OBJECT_REVISION_5 = 5;
pub const MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_1 = 1;
pub const MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_2 = 2;
pub const MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_3 = 3;
pub const MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_4 = 4;
pub const MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_5 = 5;
pub const MPRAPI_SET_CONFIG_PROTOCOL_FOR_PPTP = 1;
pub const MPRAPI_SET_CONFIG_PROTOCOL_FOR_L2TP = 2;
pub const MPRAPI_SET_CONFIG_PROTOCOL_FOR_SSTP = 4;
pub const MPRAPI_SET_CONFIG_PROTOCOL_FOR_IKEV2 = 8;
pub const MPRAPI_SET_CONFIG_PROTOCOL_FOR_GRE = 16;
pub const ALLOW_NO_AUTH = 1;
pub const DO_NOT_ALLOW_NO_AUTH = 0;
pub const MPRAPI_RAS_UPDATE_CONNECTION_OBJECT_REVISION_1 = 1;
pub const MPRAPI_ADMIN_DLL_VERSION_1 = 1;
pub const MPRAPI_ADMIN_DLL_VERSION_2 = 2;
pub const MGM_JOIN_STATE_FLAG = 1;
pub const MGM_FORWARD_STATE_FLAG = 2;
pub const MGM_MFE_STATS_0 = 1;
pub const MGM_MFE_STATS_1 = 2;
pub const RTM_MAX_ADDRESS_SIZE = 16;
pub const RTM_MAX_VIEWS = 32;
pub const RTM_VIEW_ID_UCAST = 0;
pub const RTM_VIEW_ID_MCAST = 1;
pub const RTM_VIEW_MASK_SIZE = 32;
pub const RTM_VIEW_MASK_NONE = 0;
pub const RTM_VIEW_MASK_ANY = 0;
pub const RTM_VIEW_MASK_UCAST = 1;
pub const RTM_VIEW_MASK_MCAST = 2;
pub const RTM_VIEW_MASK_ALL = 4294967295;
pub const IPV6_ADDRESS_LEN_IN_BYTES = 16;
pub const RTM_DEST_FLAG_NATURAL_NET = 1;
pub const RTM_DEST_FLAG_FWD_ENGIN_ADD = 2;
pub const RTM_DEST_FLAG_DONT_FORWARD = 4;
pub const RTM_ROUTE_STATE_CREATED = 0;
pub const RTM_ROUTE_STATE_DELETING = 1;
pub const RTM_ROUTE_STATE_DELETED = 2;
pub const RTM_ROUTE_FLAGS_MARTIAN = 1;
pub const RTM_ROUTE_FLAGS_BLACKHOLE = 2;
pub const RTM_ROUTE_FLAGS_DISCARD = 4;
pub const RTM_ROUTE_FLAGS_INACTIVE = 8;
pub const RTM_ROUTE_FLAGS_LOCAL = 16;
pub const RTM_ROUTE_FLAGS_REMOTE = 32;
pub const RTM_ROUTE_FLAGS_MYSELF = 64;
pub const RTM_ROUTE_FLAGS_LOOPBACK = 128;
pub const RTM_ROUTE_FLAGS_MCAST = 256;
pub const RTM_ROUTE_FLAGS_LOCAL_MCAST = 512;
pub const RTM_ROUTE_FLAGS_LIMITED_BC = 1024;
pub const RTM_ROUTE_FLAGS_ZEROS_NETBC = 4096;
pub const RTM_ROUTE_FLAGS_ZEROS_SUBNETBC = 8192;
pub const RTM_ROUTE_FLAGS_ONES_NETBC = 16384;
pub const RTM_ROUTE_FLAGS_ONES_SUBNETBC = 32768;
pub const RTM_NEXTHOP_STATE_CREATED = 0;
pub const RTM_NEXTHOP_STATE_DELETED = 1;
pub const RTM_NEXTHOP_FLAGS_REMOTE = 1;
pub const RTM_NEXTHOP_FLAGS_DOWN = 2;
pub const METHOD_TYPE_ALL_METHODS = 4294967295;
pub const METHOD_RIP2_NEIGHBOUR_ADDR = 1;
pub const METHOD_RIP2_OUTBOUND_INTF = 2;
pub const METHOD_RIP2_ROUTE_TAG = 4;
pub const METHOD_RIP2_ROUTE_TIMESTAMP = 8;
pub const METHOD_BGP4_AS_PATH = 1;
pub const METHOD_BGP4_PEER_ID = 2;
pub const METHOD_BGP4_PA_ORIGIN = 4;
pub const METHOD_BGP4_NEXTHOP_ATTR = 8;
pub const RTM_RESUME_METHODS = 0;
pub const RTM_BLOCK_METHODS = 1;
pub const RTM_ROUTE_CHANGE_FIRST = 1;
pub const RTM_ROUTE_CHANGE_NEW = 2;
pub const RTM_ROUTE_CHANGE_BEST = 65536;
pub const RTM_NEXTHOP_CHANGE_NEW = 1;
pub const RTM_MATCH_NONE = 0;
pub const RTM_MATCH_OWNER = 1;
pub const RTM_MATCH_NEIGHBOUR = 2;
pub const RTM_MATCH_PREF = 4;
pub const RTM_MATCH_NEXTHOP = 8;
pub const RTM_MATCH_INTERFACE = 16;
pub const RTM_MATCH_FULL = 65535;
pub const RTM_ENUM_START = 0;
pub const RTM_ENUM_NEXT = 1;
pub const RTM_ENUM_RANGE = 2;
pub const RTM_ENUM_ALL_DESTS = 0;
pub const RTM_ENUM_OWN_DESTS = 16777216;
pub const RTM_ENUM_ALL_ROUTES = 0;
pub const RTM_ENUM_OWN_ROUTES = 65536;
pub const RTM_NUM_CHANGE_TYPES = 3;
pub const RTM_CHANGE_TYPE_ALL = 1;
pub const RTM_CHANGE_TYPE_BEST = 2;
pub const RTM_CHANGE_TYPE_FORWARDING = 4;
pub const RTM_NOTIFY_ONLY_MARKED_DESTS = 65536;
pub const RASBASE = 600;
pub const PENDING = 600;
pub const ERROR_INVALID_PORT_HANDLE = 601;
pub const ERROR_PORT_ALREADY_OPEN = 602;
pub const ERROR_BUFFER_TOO_SMALL = 603;
pub const ERROR_WRONG_INFO_SPECIFIED = 604;
pub const ERROR_CANNOT_SET_PORT_INFO = 605;
pub const ERROR_PORT_NOT_CONNECTED = 606;
pub const ERROR_EVENT_INVALID = 607;
pub const ERROR_DEVICE_DOES_NOT_EXIST = 608;
pub const ERROR_DEVICETYPE_DOES_NOT_EXIST = 609;
pub const ERROR_BUFFER_INVALID = 610;
pub const ERROR_ROUTE_NOT_AVAILABLE = 611;
pub const ERROR_ROUTE_NOT_ALLOCATED = 612;
pub const ERROR_INVALID_COMPRESSION_SPECIFIED = 613;
pub const ERROR_OUT_OF_BUFFERS = 614;
pub const ERROR_PORT_NOT_FOUND = 615;
pub const ERROR_ASYNC_REQUEST_PENDING = 616;
pub const ERROR_ALREADY_DISCONNECTING = 617;
pub const ERROR_PORT_NOT_OPEN = 618;
pub const ERROR_PORT_DISCONNECTED = 619;
pub const ERROR_NO_ENDPOINTS = 620;
pub const ERROR_CANNOT_OPEN_PHONEBOOK = 621;
pub const ERROR_CANNOT_LOAD_PHONEBOOK = 622;
pub const ERROR_CANNOT_FIND_PHONEBOOK_ENTRY = 623;
pub const ERROR_CANNOT_WRITE_PHONEBOOK = 624;
pub const ERROR_CORRUPT_PHONEBOOK = 625;
pub const ERROR_CANNOT_LOAD_STRING = 626;
pub const ERROR_KEY_NOT_FOUND = 627;
pub const ERROR_DISCONNECTION = 628;
pub const ERROR_REMOTE_DISCONNECTION = 629;
pub const ERROR_HARDWARE_FAILURE = 630;
pub const ERROR_USER_DISCONNECTION = 631;
pub const ERROR_INVALID_SIZE = 632;
pub const ERROR_PORT_NOT_AVAILABLE = 633;
pub const ERROR_CANNOT_PROJECT_CLIENT = 634;
pub const ERROR_UNKNOWN = 635;
pub const ERROR_WRONG_DEVICE_ATTACHED = 636;
pub const ERROR_BAD_STRING = 637;
pub const ERROR_REQUEST_TIMEOUT = 638;
pub const ERROR_CANNOT_GET_LANA = 639;
pub const ERROR_NETBIOS_ERROR = 640;
pub const ERROR_SERVER_OUT_OF_RESOURCES = 641;
pub const ERROR_NAME_EXISTS_ON_NET = 642;
pub const ERROR_SERVER_GENERAL_NET_FAILURE = 643;
pub const WARNING_MSG_ALIAS_NOT_ADDED = 644;
pub const ERROR_AUTH_INTERNAL = 645;
pub const ERROR_RESTRICTED_LOGON_HOURS = 646;
pub const ERROR_ACCT_DISABLED = 647;
pub const ERROR_PASSWD_EXPIRED = 648;
pub const ERROR_NO_DIALIN_PERMISSION = 649;
pub const ERROR_SERVER_NOT_RESPONDING = 650;
pub const ERROR_FROM_DEVICE = 651;
pub const ERROR_UNRECOGNIZED_RESPONSE = 652;
pub const ERROR_MACRO_NOT_FOUND = 653;
pub const ERROR_MACRO_NOT_DEFINED = 654;
pub const ERROR_MESSAGE_MACRO_NOT_FOUND = 655;
pub const ERROR_DEFAULTOFF_MACRO_NOT_FOUND = 656;
pub const ERROR_FILE_COULD_NOT_BE_OPENED = 657;
pub const ERROR_DEVICENAME_TOO_LONG = 658;
pub const ERROR_DEVICENAME_NOT_FOUND = 659;
pub const ERROR_NO_RESPONSES = 660;
pub const ERROR_NO_COMMAND_FOUND = 661;
pub const ERROR_WRONG_KEY_SPECIFIED = 662;
pub const ERROR_UNKNOWN_DEVICE_TYPE = 663;
pub const ERROR_ALLOCATING_MEMORY = 664;
pub const ERROR_PORT_NOT_CONFIGURED = 665;
pub const ERROR_DEVICE_NOT_READY = 666;
pub const ERROR_READING_INI_FILE = 667;
pub const ERROR_NO_CONNECTION = 668;
pub const ERROR_BAD_USAGE_IN_INI_FILE = 669;
pub const ERROR_READING_SECTIONNAME = 670;
pub const ERROR_READING_DEVICETYPE = 671;
pub const ERROR_READING_DEVICENAME = 672;
pub const ERROR_READING_USAGE = 673;
pub const ERROR_READING_MAXCONNECTBPS = 674;
pub const ERROR_READING_MAXCARRIERBPS = 675;
pub const ERROR_LINE_BUSY = 676;
pub const ERROR_VOICE_ANSWER = 677;
pub const ERROR_NO_ANSWER = 678;
pub const ERROR_NO_CARRIER = 679;
pub const ERROR_NO_DIALTONE = 680;
pub const ERROR_IN_COMMAND = 681;
pub const ERROR_WRITING_SECTIONNAME = 682;
pub const ERROR_WRITING_DEVICETYPE = 683;
pub const ERROR_WRITING_DEVICENAME = 684;
pub const ERROR_WRITING_MAXCONNECTBPS = 685;
pub const ERROR_WRITING_MAXCARRIERBPS = 686;
pub const ERROR_WRITING_USAGE = 687;
pub const ERROR_WRITING_DEFAULTOFF = 688;
pub const ERROR_READING_DEFAULTOFF = 689;
pub const ERROR_EMPTY_INI_FILE = 690;
pub const ERROR_AUTHENTICATION_FAILURE = 691;
pub const ERROR_PORT_OR_DEVICE = 692;
pub const ERROR_NOT_BINARY_MACRO = 693;
pub const ERROR_DCB_NOT_FOUND = 694;
pub const ERROR_STATE_MACHINES_NOT_STARTED = 695;
pub const ERROR_STATE_MACHINES_ALREADY_STARTED = 696;
pub const ERROR_PARTIAL_RESPONSE_LOOPING = 697;
pub const ERROR_UNKNOWN_RESPONSE_KEY = 698;
pub const ERROR_RECV_BUF_FULL = 699;
pub const ERROR_CMD_TOO_LONG = 700;
pub const ERROR_UNSUPPORTED_BPS = 701;
pub const ERROR_UNEXPECTED_RESPONSE = 702;
pub const ERROR_INTERACTIVE_MODE = 703;
pub const ERROR_BAD_CALLBACK_NUMBER = 704;
pub const ERROR_INVALID_AUTH_STATE = 705;
pub const ERROR_WRITING_INITBPS = 706;
pub const ERROR_X25_DIAGNOSTIC = 707;
pub const ERROR_ACCT_EXPIRED = 708;
pub const ERROR_CHANGING_PASSWORD = 709;
pub const ERROR_OVERRUN = 710;
pub const ERROR_RASMAN_CANNOT_INITIALIZE = 711;
pub const ERROR_BIPLEX_PORT_NOT_AVAILABLE = 712;
pub const ERROR_NO_ACTIVE_ISDN_LINES = 713;
pub const ERROR_NO_ISDN_CHANNELS_AVAILABLE = 714;
pub const ERROR_TOO_MANY_LINE_ERRORS = 715;
pub const ERROR_IP_CONFIGURATION = 716;
pub const ERROR_NO_IP_ADDRESSES = 717;
pub const ERROR_PPP_TIMEOUT = 718;
pub const ERROR_PPP_REMOTE_TERMINATED = 719;
pub const ERROR_PPP_NO_PROTOCOLS_CONFIGURED = 720;
pub const ERROR_PPP_NO_RESPONSE = 721;
pub const ERROR_PPP_INVALID_PACKET = 722;
pub const ERROR_PHONE_NUMBER_TOO_LONG = 723;
pub const ERROR_IPXCP_NO_DIALOUT_CONFIGURED = 724;
pub const ERROR_IPXCP_NO_DIALIN_CONFIGURED = 725;
pub const ERROR_IPXCP_DIALOUT_ALREADY_ACTIVE = 726;
pub const ERROR_ACCESSING_TCPCFGDLL = 727;
pub const ERROR_NO_IP_RAS_ADAPTER = 728;
pub const ERROR_SLIP_REQUIRES_IP = 729;
pub const ERROR_PROJECTION_NOT_COMPLETE = 730;
pub const ERROR_PROTOCOL_NOT_CONFIGURED = 731;
pub const ERROR_PPP_NOT_CONVERGING = 732;
pub const ERROR_PPP_CP_REJECTED = 733;
pub const ERROR_PPP_LCP_TERMINATED = 734;
pub const ERROR_PPP_REQUIRED_ADDRESS_REJECTED = 735;
pub const ERROR_PPP_NCP_TERMINATED = 736;
pub const ERROR_PPP_LOOPBACK_DETECTED = 737;
pub const ERROR_PPP_NO_ADDRESS_ASSIGNED = 738;
pub const ERROR_CANNOT_USE_LOGON_CREDENTIALS = 739;
pub const ERROR_TAPI_CONFIGURATION = 740;
pub const ERROR_NO_LOCAL_ENCRYPTION = 741;
pub const ERROR_NO_REMOTE_ENCRYPTION = 742;
pub const ERROR_REMOTE_REQUIRES_ENCRYPTION = 743;
pub const ERROR_IPXCP_NET_NUMBER_CONFLICT = 744;
pub const ERROR_INVALID_SMM = 745;
pub const ERROR_SMM_UNINITIALIZED = 746;
pub const ERROR_NO_MAC_FOR_PORT = 747;
pub const ERROR_SMM_TIMEOUT = 748;
pub const ERROR_BAD_PHONE_NUMBER = 749;
pub const ERROR_WRONG_MODULE = 750;
pub const ERROR_INVALID_CALLBACK_NUMBER = 751;
pub const ERROR_SCRIPT_SYNTAX = 752;
pub const ERROR_HANGUP_FAILED = 753;
pub const ERROR_BUNDLE_NOT_FOUND = 754;
pub const ERROR_CANNOT_DO_CUSTOMDIAL = 755;
pub const ERROR_DIAL_ALREADY_IN_PROGRESS = 756;
pub const ERROR_RASAUTO_CANNOT_INITIALIZE = 757;
pub const ERROR_CONNECTION_ALREADY_SHARED = 758;
pub const ERROR_SHARING_CHANGE_FAILED = 759;
pub const ERROR_SHARING_ROUTER_INSTALL = 760;
pub const ERROR_SHARE_CONNECTION_FAILED = 761;
pub const ERROR_SHARING_PRIVATE_INSTALL = 762;
pub const ERROR_CANNOT_SHARE_CONNECTION = 763;
pub const ERROR_NO_SMART_CARD_READER = 764;
pub const ERROR_SHARING_ADDRESS_EXISTS = 765;
pub const ERROR_NO_CERTIFICATE = 766;
pub const ERROR_SHARING_MULTIPLE_ADDRESSES = 767;
pub const ERROR_FAILED_TO_ENCRYPT = 768;
pub const ERROR_BAD_ADDRESS_SPECIFIED = 769;
pub const ERROR_CONNECTION_REJECT = 770;
pub const ERROR_CONGESTION = 771;
pub const ERROR_INCOMPATIBLE = 772;
pub const ERROR_NUMBERCHANGED = 773;
pub const ERROR_TEMPFAILURE = 774;
pub const ERROR_BLOCKED = 775;
pub const ERROR_DONOTDISTURB = 776;
pub const ERROR_OUTOFORDER = 777;
pub const ERROR_UNABLE_TO_AUTHENTICATE_SERVER = 778;
pub const ERROR_SMART_CARD_REQUIRED = 779;
pub const ERROR_INVALID_FUNCTION_FOR_ENTRY = 780;
pub const ERROR_CERT_FOR_ENCRYPTION_NOT_FOUND = 781;
pub const ERROR_SHARING_RRAS_CONFLICT = 782;
pub const ERROR_SHARING_NO_PRIVATE_LAN = 783;
pub const ERROR_NO_DIFF_USER_AT_LOGON = 784;
pub const ERROR_NO_REG_CERT_AT_LOGON = 785;
pub const ERROR_OAKLEY_NO_CERT = 786;
pub const ERROR_OAKLEY_AUTH_FAIL = 787;
pub const ERROR_OAKLEY_ATTRIB_FAIL = 788;
pub const ERROR_OAKLEY_GENERAL_PROCESSING = 789;
pub const ERROR_OAKLEY_NO_PEER_CERT = 790;
pub const ERROR_OAKLEY_NO_POLICY = 791;
pub const ERROR_OAKLEY_TIMED_OUT = 792;
pub const ERROR_OAKLEY_ERROR = 793;
pub const ERROR_UNKNOWN_FRAMED_PROTOCOL = 794;
pub const ERROR_WRONG_TUNNEL_TYPE = 795;
pub const ERROR_UNKNOWN_SERVICE_TYPE = 796;
pub const ERROR_CONNECTING_DEVICE_NOT_FOUND = 797;
pub const ERROR_NO_EAPTLS_CERTIFICATE = 798;
pub const ERROR_SHARING_HOST_ADDRESS_CONFLICT = 799;
pub const ERROR_AUTOMATIC_VPN_FAILED = 800;
pub const ERROR_VALIDATING_SERVER_CERT = 801;
pub const ERROR_READING_SCARD = 802;
pub const ERROR_INVALID_PEAP_COOKIE_CONFIG = 803;
pub const ERROR_INVALID_PEAP_COOKIE_USER = 804;
pub const ERROR_INVALID_MSCHAPV2_CONFIG = 805;
pub const ERROR_VPN_GRE_BLOCKED = 806;
pub const ERROR_VPN_DISCONNECT = 807;
pub const ERROR_VPN_REFUSED = 808;
pub const ERROR_VPN_TIMEOUT = 809;
pub const ERROR_VPN_BAD_CERT = 810;
pub const ERROR_VPN_BAD_PSK = 811;
pub const ERROR_SERVER_POLICY = 812;
pub const ERROR_BROADBAND_ACTIVE = 813;
pub const ERROR_BROADBAND_NO_NIC = 814;
pub const ERROR_BROADBAND_TIMEOUT = 815;
pub const ERROR_FEATURE_DEPRECATED = 816;
pub const ERROR_CANNOT_DELETE = 817;
pub const ERROR_RASQEC_RESOURCE_CREATION_FAILED = 818;
pub const ERROR_RASQEC_NAPAGENT_NOT_ENABLED = 819;
pub const ERROR_RASQEC_NAPAGENT_NOT_CONNECTED = 820;
pub const ERROR_RASQEC_CONN_DOESNOTEXIST = 821;
pub const ERROR_RASQEC_TIMEOUT = 822;
pub const ERROR_PEAP_CRYPTOBINDING_INVALID = 823;
pub const ERROR_PEAP_CRYPTOBINDING_NOTRECEIVED = 824;
pub const ERROR_INVALID_VPNSTRATEGY = 825;
pub const ERROR_EAPTLS_CACHE_CREDENTIALS_INVALID = 826;
pub const ERROR_IPSEC_SERVICE_STOPPED = 827;
pub const ERROR_IDLE_TIMEOUT = 828;
pub const ERROR_LINK_FAILURE = 829;
pub const ERROR_USER_LOGOFF = 830;
pub const ERROR_FAST_USER_SWITCH = 831;
pub const ERROR_HIBERNATION = 832;
pub const ERROR_SYSTEM_SUSPENDED = 833;
pub const ERROR_RASMAN_SERVICE_STOPPED = 834;
pub const ERROR_INVALID_SERVER_CERT = 835;
pub const ERROR_NOT_NAP_CAPABLE = 836;
pub const ERROR_INVALID_TUNNELID = 837;
pub const ERROR_UPDATECONNECTION_REQUEST_IN_PROCESS = 838;
pub const ERROR_PROTOCOL_ENGINE_DISABLED = 839;
pub const ERROR_INTERNAL_ADDRESS_FAILURE = 840;
pub const ERROR_FAILED_CP_REQUIRED = 841;
pub const ERROR_TS_UNACCEPTABLE = 842;
pub const ERROR_MOBIKE_DISABLED = 843;
pub const ERROR_CANNOT_INITIATE_MOBIKE_UPDATE = 844;
pub const ERROR_PEAP_SERVER_REJECTED_CLIENT_TLV = 845;
pub const ERROR_INVALID_PREFERENCES = 846;
pub const ERROR_EAPTLS_SCARD_CACHE_CREDENTIALS_INVALID = 847;
pub const ERROR_SSTP_COOKIE_SET_FAILURE = 848;
pub const ERROR_INVALID_PEAP_COOKIE_ATTRIBUTES = 849;
pub const ERROR_EAP_METHOD_NOT_INSTALLED = 850;
pub const ERROR_EAP_METHOD_DOES_NOT_SUPPORT_SSO = 851;
pub const ERROR_EAP_METHOD_OPERATION_NOT_SUPPORTED = 852;
pub const ERROR_EAP_USER_CERT_INVALID = 853;
pub const ERROR_EAP_USER_CERT_EXPIRED = 854;
pub const ERROR_EAP_USER_CERT_REVOKED = 855;
pub const ERROR_EAP_USER_CERT_OTHER_ERROR = 856;
pub const ERROR_EAP_SERVER_CERT_INVALID = 857;
pub const ERROR_EAP_SERVER_CERT_EXPIRED = 858;
pub const ERROR_EAP_SERVER_CERT_REVOKED = 859;
pub const ERROR_EAP_SERVER_CERT_OTHER_ERROR = 860;
pub const ERROR_EAP_USER_ROOT_CERT_NOT_FOUND = 861;
pub const ERROR_EAP_USER_ROOT_CERT_INVALID = 862;
pub const ERROR_EAP_USER_ROOT_CERT_EXPIRED = 863;
pub const ERROR_EAP_SERVER_ROOT_CERT_NOT_FOUND = 864;
pub const ERROR_EAP_SERVER_ROOT_CERT_INVALID = 865;
pub const ERROR_EAP_SERVER_ROOT_CERT_NAME_REQUIRED = 866;
pub const ERROR_PEAP_IDENTITY_MISMATCH = 867;
pub const ERROR_DNSNAME_NOT_RESOLVABLE = 868;
pub const ERROR_EAPTLS_PASSWD_INVALID = 869;
pub const ERROR_IKEV2_PSK_INTERFACE_ALREADY_EXISTS = 870;
pub const ERROR_INVALID_DESTINATION_IP = 871;
pub const ERROR_INVALID_INTERFACE_CONFIG = 872;
pub const ERROR_VPN_PLUGIN_GENERIC = 873;
pub const ERROR_SSO_CERT_MISSING = 874;
pub const ERROR_DEVICE_COMPLIANCE = 875;
pub const ERROR_PLUGIN_NOT_INSTALLED = 876;
pub const ERROR_ACTION_REQUIRED = 877;
pub const ERROR_WINHTTP_AUTO_PROXY_SERVICE = 878;
pub const RASBASEEND = 878;
pub const RASAPIVERSION_500 = 1;
pub const RASAPIVERSION_501 = 2;
pub const RASAPIVERSION_600 = 3;
pub const RASAPIVERSION_601 = 4;
pub const RASCS_OpenPort = 0;
pub const RASCS_PortOpened = 1;
pub const RASCS_ConnectDevice = 2;
pub const RASCS_DeviceConnected = 3;
pub const RASCS_AllDevicesConnected = 4;
pub const RASCS_Authenticate = 5;
pub const RASCS_AuthNotify = 6;
pub const RASCS_AuthRetry = 7;
pub const RASCS_AuthCallback = 8;
pub const RASCS_AuthChangePassword = 9;
pub const RASCS_AuthProject = 10;
pub const RASCS_AuthLinkSpeed = 11;
pub const RASCS_AuthAck = 12;
pub const RASCS_ReAuthenticate = 13;
pub const RASCS_Authenticated = 14;
pub const RASCS_PrepareForCallback = 15;
pub const RASCS_WaitForModemReset = 16;
pub const RASCS_WaitForCallback = 17;
pub const RASCS_Projected = 18;
pub const RASCS_StartAuthentication = 19;
pub const RASCS_CallbackComplete = 20;
pub const RASCS_LogonNetwork = 21;
pub const RASCS_SubEntryConnected = 22;
pub const RASCS_SubEntryDisconnected = 23;
pub const RASCS_ApplySettings = 24;
pub const RASCS_Interactive = 4096;
pub const RASCS_RetryAuthentication = 4097;
pub const RASCS_CallbackSetByCaller = 4098;
pub const RASCS_PasswordExpired = 4099;
pub const RASCS_InvokeEapUI = 4100;
pub const RASCS_Connected = 8192;
pub const RASCS_Disconnected = 8193;
pub const RASCSS_None = 0;
pub const RASCSS_Dormant = 1;
pub const RASCSS_Reconnecting = 2;
pub const RASCSS_Reconnected = 8192;
pub const RASP_Amb = 65536;
pub const RASP_PppNbf = 32831;
pub const RASP_PppIpx = 32811;
pub const RASP_PppIp = 32801;
pub const RASP_PppCcp = 33021;
pub const RASP_PppLcp = 49185;
pub const RASP_PppIpv6 = 32855;
pub const PROJECTION_INFO_TYPE_PPP = 1;
pub const PROJECTION_INFO_TYPE_IKEv2 = 2;
pub const IKEV2_ID_PAYLOAD_TYPE_INVALID = 0;
pub const IKEV2_ID_PAYLOAD_TYPE_IPV4_ADDR = 1;
pub const IKEV2_ID_PAYLOAD_TYPE_FQDN = 2;
pub const IKEV2_ID_PAYLOAD_TYPE_RFC822_ADDR = 3;
pub const IKEV2_ID_PAYLOAD_TYPE_RESERVED1 = 4;
pub const IKEV2_ID_PAYLOAD_TYPE_ID_IPV6_ADDR = 5;
pub const IKEV2_ID_PAYLOAD_TYPE_RESERVED2 = 6;
pub const IKEV2_ID_PAYLOAD_TYPE_RESERVED3 = 7;
pub const IKEV2_ID_PAYLOAD_TYPE_RESERVED4 = 8;
pub const IKEV2_ID_PAYLOAD_TYPE_DER_ASN1_DN = 9;
pub const IKEV2_ID_PAYLOAD_TYPE_DER_ASN1_GN = 10;
pub const IKEV2_ID_PAYLOAD_TYPE_KEY_ID = 11;
pub const IKEV2_ID_PAYLOAD_TYPE_MAX = 12;
pub const ROUTER_IF_TYPE_CLIENT = 0;
pub const ROUTER_IF_TYPE_HOME_ROUTER = 1;
pub const ROUTER_IF_TYPE_FULL_ROUTER = 2;
pub const ROUTER_IF_TYPE_DEDICATED = 3;
pub const ROUTER_IF_TYPE_INTERNAL = 4;
pub const ROUTER_IF_TYPE_LOOPBACK = 5;
pub const ROUTER_IF_TYPE_TUNNEL1 = 6;
pub const ROUTER_IF_TYPE_DIALOUT = 7;
pub const ROUTER_IF_TYPE_MAX = 8;
pub const ROUTER_IF_STATE_UNREACHABLE = 0;
pub const ROUTER_IF_STATE_DISCONNECTED = 1;
pub const ROUTER_IF_STATE_CONNECTING = 2;
pub const ROUTER_IF_STATE_CONNECTED = 3;
pub const RAS_PORT_NON_OPERATIONAL = 0;
pub const RAS_PORT_DISCONNECTED = 1;
pub const RAS_PORT_CALLING_BACK = 2;
pub const RAS_PORT_LISTENING = 3;
pub const RAS_PORT_AUTHENTICATING = 4;
pub const RAS_PORT_AUTHENTICATED = 5;
pub const RAS_PORT_INITIALIZING = 6;
pub const RAS_HARDWARE_OPERATIONAL = 0;
pub const RAS_HARDWARE_FAILURE = 1;
pub const RAS_QUAR_STATE_NORMAL = 0;
pub const RAS_QUAR_STATE_QUARANTINE = 1;
pub const RAS_QUAR_STATE_PROBATION = 2;
pub const RAS_QUAR_STATE_NOT_CAPABLE = 3;
pub const MPRAPI_OBJECT_TYPE_RAS_CONNECTION_OBJECT = 1;
pub const MPRAPI_OBJECT_TYPE_MPR_SERVER_OBJECT = 2;
pub const MPRAPI_OBJECT_TYPE_MPR_SERVER_SET_CONFIG_OBJECT = 3;
pub const MPRAPI_OBJECT_TYPE_AUTH_VALIDATION_OBJECT = 4;
pub const MPRAPI_OBJECT_TYPE_UPDATE_CONNECTION_OBJECT = 5;
pub const MPRAPI_OBJECT_TYPE_IF_CUSTOM_CONFIG_OBJECT = 6;
pub const MPR_VPN_TS_IPv4_ADDR_RANGE = 7;
pub const MPR_VPN_TS_IPv6_ADDR_RANGE = 8;
pub const ANY_SOURCE = 0;
pub const ALL_SOURCES = 1;
pub const RTM_ENTITY_REGISTERED = 0;
pub const RTM_ENTITY_DEREGISTERED = 1;
pub const RTM_ROUTE_EXPIRED = 2;
pub const RTM_CHANGE_NOTIFICATION = 3;

pub const aliases = struct {
    pub const MPR_INTERFACE_DIAL_MODE = u32;
    pub const RASENTRY_DIAL_MODE = u32;
    pub const RAS_FLAGS = u32;
    pub const MPR_ET = u32;
    pub const RASPPP_PROJECTION_INFO_SERVER_AUTH_DATA = u32;
    pub const PPP_LCP = u32;
    pub const RASPPP_PROJECTION_INFO_SERVER_AUTH_PROTOCOL = u32;
    pub const PPP_LCP_INFO_AUTH_DATA = u32;
    pub const RASIKEV_PROJECTION_INFO_FLAGS = u32;
    pub const MPR_VS = u32;
    pub const SECURITY_MESSAGE_MSG_ID = u32;
    pub const RASAPIVERSION = i32;
    pub const RASCONNSTATE = i32;
    pub const RASCONNSUBSTATE = i32;
    pub const RASPROJECTION = i32;
    pub const RASPROJECTION_INFO_TYPE = i32;
    pub const IKEV2_ID_PAYLOAD_TYPE = i32;
    pub const ROUTER_INTERFACE_TYPE = i32;
    pub const ROUTER_CONNECTION_STATE = i32;
    pub const RAS_PORT_CONDITION = i32;
    pub const RAS_HARDWARE_CONDITION = i32;
    pub const RAS_QUARANTINE_STATE = i32;
    pub const MPRAPI_OBJECT_TYPE = i32;
    pub const MPR_VPN_TS_TYPE = i32;
    pub const MGM_ENUM_TYPES = i32;
    pub const RTM_EVENT_TYPE = i32;
    pub const HRASCONN = ?*anyopaque;
    pub const RASDIALFUNC = ?*const anyopaque;
    pub const RASDIALFUNC1 = ?*const anyopaque;
    pub const RASDIALFUNC2 = ?*const anyopaque;
    pub const ORASADFUNC = ?*const anyopaque;
    pub const RASADFUNCA = ?*const anyopaque;
    pub const RASADFUNCW = ?*const anyopaque;
    pub const PFNRASGETBUFFER = ?*const anyopaque;
    pub const PFNRASFREEBUFFER = ?*const anyopaque;
    pub const PFNRASSENDBUFFER = ?*const anyopaque;
    pub const PFNRASRECEIVEBUFFER = ?*const anyopaque;
    pub const PFNRASRETRIEVEBUFFER = ?*const anyopaque;
    pub const RasCustomScriptExecuteFn = ?*const anyopaque;
    pub const PFNRASSETCOMMSETTINGS = ?*const anyopaque;
    pub const RasCustomHangUpFn = ?*const anyopaque;
    pub const RasCustomDialFn = ?*const anyopaque;
    pub const RasCustomDeleteEntryNotifyFn = ?*const anyopaque;
    pub const RASPBDLGFUNCW = ?*const anyopaque;
    pub const RASPBDLGFUNCA = ?*const anyopaque;
    pub const RasCustomDialDlgFn = ?*const anyopaque;
    pub const RasCustomEntryDlgFn = ?*const anyopaque;
    pub const PMPRADMINGETIPADDRESSFORUSER = ?*const anyopaque;
    pub const PMPRADMINRELEASEIPADRESS = ?*const anyopaque;
    pub const PMPRADMINGETIPV6ADDRESSFORUSER = ?*const anyopaque;
    pub const PMPRADMINRELEASEIPV6ADDRESSFORUSER = ?*const anyopaque;
    pub const PMPRADMINACCEPTNEWCONNECTION = ?*const anyopaque;
    pub const PMPRADMINACCEPTNEWCONNECTION2 = ?*const anyopaque;
    pub const PMPRADMINACCEPTNEWCONNECTION3 = ?*const anyopaque;
    pub const PMPRADMINACCEPTNEWLINK = ?*const anyopaque;
    pub const PMPRADMINCONNECTIONHANGUPNOTIFICATION = ?*const anyopaque;
    pub const PMPRADMINCONNECTIONHANGUPNOTIFICATION2 = ?*const anyopaque;
    pub const PMPRADMINCONNECTIONHANGUPNOTIFICATION3 = ?*const anyopaque;
    pub const PMPRADMINLINKHANGUPNOTIFICATION = ?*const anyopaque;
    pub const PMPRADMINTERMINATEDLL = ?*const anyopaque;
    pub const PMPRADMINACCEPTREAUTHENTICATION = ?*const anyopaque;
    pub const PMPRADMINACCEPTNEWCONNECTIONEX = ?*const anyopaque;
    pub const PMPRADMINACCEPTREAUTHENTICATIONEX = ?*const anyopaque;
    pub const PMPRADMINACCEPTTUNNELENDPOINTCHANGEEX = ?*const anyopaque;
    pub const PMPRADMINCONNECTIONHANGUPNOTIFICATIONEX = ?*const anyopaque;
    pub const PMPRADMINRASVALIDATEPREAUTHENTICATEDCONNECTIONEX = ?*const anyopaque;
    pub const RASSECURITYPROC = ?*const anyopaque;
    pub const PMGM_RPF_CALLBACK = ?*const anyopaque;
    pub const PMGM_CREATION_ALERT_CALLBACK = ?*const anyopaque;
    pub const PMGM_PRUNE_ALERT_CALLBACK = ?*const anyopaque;
    pub const PMGM_JOIN_ALERT_CALLBACK = ?*const anyopaque;
    pub const PMGM_WRONG_IF_CALLBACK = ?*const anyopaque;
    pub const PMGM_LOCAL_JOIN_CALLBACK = ?*const anyopaque;
    pub const PMGM_LOCAL_LEAVE_CALLBACK = ?*const anyopaque;
    pub const PMGM_DISABLE_IGMP_CALLBACK = ?*const anyopaque;
    pub const PMGM_ENABLE_IGMP_CALLBACK = ?*const anyopaque;
    pub const RTM_EVENT_CALLBACK = ?*const anyopaque;
    pub const RTM_ENTITY_EXPORT_METHOD = ?*const anyopaque;
};
