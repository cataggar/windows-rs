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
    .{ "PeerGraphStartup", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphStartup", .signature = "\x00\x02\x11\x79\x07\x0f\x11\xb7\xcd" } },
    .{ "PeerGraphShutdown", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphShutdown", .signature = "\x00\x00\x11\x79" } },
    .{ "PeerGraphFreeData", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphFreeData", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "PeerGraphGetItemCount", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphGetItemCount", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x09" } },
    .{ "PeerGraphGetNextItem", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphGetNextItem", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x09\x0f\x0f\x0f\x01" } },
    .{ "PeerGraphEndEnumeration", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphEndEnumeration", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "PeerGraphCreate", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphCreate", .signature = "\x00\x04\x11\x79\x0f\x11\xb7\xd1\x11\x05\x0f\x11\xb7\xd5\x0f\x0f\x01" } },
    .{ "PeerGraphOpen", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphOpen", .signature = "\x00\x07\x11\x79\x11\x05\x11\x05\x11\x05\x0f\x11\xb7\xd5\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PeerGraphListen", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphListen", .signature = "\x00\x04\x11\x79\x0f\x01\x09\x09\x07" } },
    .{ "PeerGraphConnect", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphConnect", .signature = "\x00\x04\x11\x79\x0f\x01\x11\x05\x0f\x11\xb7\xd9\x0f\x0b" } },
    .{ "PeerGraphClose", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphClose", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "PeerGraphDelete", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphDelete", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x11\x05" } },
    .{ "PeerGraphGetStatus", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphGetStatus", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x09" } },
    .{ "PeerGraphGetProperties", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphGetProperties", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x0f\x11\xb7\xd1" } },
    .{ "PeerGraphSetProperties", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphSetProperties", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x11\xb7\xd1" } },
    .{ "PeerGraphRegisterEvent", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphRegisterEvent", .signature = "\x00\x05\x11\x79\x0f\x01\x11\x80\x85\x09\x0f\x11\xb7\xdd\x0f\x0f\x01" } },
    .{ "PeerGraphUnregisterEvent", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphUnregisterEvent", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "PeerGraphGetEventData", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphGetEventData", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x0f\x11\xb7\xe1" } },
    .{ "PeerGraphGetRecord", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphGetRecord", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x11\x0d\x0f\x0f\x11\xb7\xe5" } },
    .{ "PeerGraphAddRecord", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphAddRecord", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x11\xb7\xe5\x0f\x11\x0d" } },
    .{ "PeerGraphUpdateRecord", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphUpdateRecord", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x11\xb7\xe5" } },
    .{ "PeerGraphDeleteRecord", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphDeleteRecord", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x11\x0d\x11\x59" } },
    .{ "PeerGraphEnumRecords", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphEnumRecords", .signature = "\x00\x04\x11\x79\x0f\x01\x0f\x11\x0d\x11\x05\x0f\x0f\x01" } },
    .{ "PeerGraphSearchRecords", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphSearchRecords", .signature = "\x00\x03\x11\x79\x0f\x01\x11\x05\x0f\x0f\x01" } },
    .{ "PeerGraphExportDatabase", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphExportDatabase", .signature = "\x00\x02\x11\x79\x0f\x01\x11\x05" } },
    .{ "PeerGraphImportDatabase", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphImportDatabase", .signature = "\x00\x02\x11\x79\x0f\x01\x11\x05" } },
    .{ "PeerGraphValidateDeferredRecords", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphValidateDeferredRecords", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\x0d" } },
    .{ "PeerGraphOpenDirectConnection", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphOpenDirectConnection", .signature = "\x00\x04\x11\x79\x0f\x01\x11\x05\x0f\x11\xb7\xd9\x0f\x0b" } },
    .{ "PeerGraphSendData", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphSendData", .signature = "\x00\x05\x11\x79\x0f\x01\x0b\x0f\x11\x0d\x09\x0f\x01" } },
    .{ "PeerGraphCloseDirectConnection", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphCloseDirectConnection", .signature = "\x00\x02\x11\x79\x0f\x01\x0b" } },
    .{ "PeerGraphEnumConnections", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphEnumConnections", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x0f\x01" } },
    .{ "PeerGraphEnumNodes", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphEnumNodes", .signature = "\x00\x03\x11\x79\x0f\x01\x11\x05\x0f\x0f\x01" } },
    .{ "PeerGraphSetPresence", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphSetPresence", .signature = "\x00\x02\x11\x79\x0f\x01\x11\x59" } },
    .{ "PeerGraphGetNodeInfo", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphGetNodeInfo", .signature = "\x00\x03\x11\x79\x0f\x01\x0b\x0f\x0f\x11\xb7\xe9" } },
    .{ "PeerGraphSetNodeAttributes", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphSetNodeAttributes", .signature = "\x00\x02\x11\x79\x0f\x01\x11\x05" } },
    .{ "PeerGraphPeerTimeToUniversalTime", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphPeerTimeToUniversalTime", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x11\x80\x9d\x0f\x11\x80\x9d" } },
    .{ "PeerGraphUniversalTimeToPeerTime", MethodRecord{ .library = "P2PGRAPH", .import = "PeerGraphUniversalTimeToPeerTime", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x11\x80\x9d\x0f\x11\x80\x9d" } },
    .{ "PeerFreeData", MethodRecord{ .library = "P2P", .import = "PeerFreeData", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "PeerGetItemCount", MethodRecord{ .library = "P2P", .import = "PeerGetItemCount", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x09" } },
    .{ "PeerGetNextItem", MethodRecord{ .library = "P2P", .import = "PeerGetNextItem", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x09\x0f\x0f\x0f\x01" } },
    .{ "PeerEndEnumeration", MethodRecord{ .library = "P2P", .import = "PeerEndEnumeration", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "PeerGroupStartup", MethodRecord{ .library = "P2P", .import = "PeerGroupStartup", .signature = "\x00\x02\x11\x79\x07\x0f\x11\xb7\xcd" } },
    .{ "PeerGroupShutdown", MethodRecord{ .library = "P2P", .import = "PeerGroupShutdown", .signature = "\x00\x00\x11\x79" } },
    .{ "PeerGroupCreate", MethodRecord{ .library = "P2P", .import = "PeerGroupCreate", .signature = "\x00\x02\x11\x79\x0f\x11\xb7\xed\x0f\x0f\x01" } },
    .{ "PeerGroupOpen", MethodRecord{ .library = "P2P", .import = "PeerGroupOpen", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x11\x05\x0f\x0f\x01" } },
    .{ "PeerGroupJoin", MethodRecord{ .library = "P2P", .import = "PeerGroupJoin", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x11\x05\x0f\x0f\x01" } },
    .{ "PeerGroupPasswordJoin", MethodRecord{ .library = "P2P", .import = "PeerGroupPasswordJoin", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x0f\x01" } },
    .{ "PeerGroupConnect", MethodRecord{ .library = "P2P", .import = "PeerGroupConnect", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "PeerGroupConnectByAddress", MethodRecord{ .library = "P2P", .import = "PeerGroupConnectByAddress", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\xb7\xd9" } },
    .{ "PeerGroupClose", MethodRecord{ .library = "P2P", .import = "PeerGroupClose", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "PeerGroupDelete", MethodRecord{ .library = "P2P", .import = "PeerGroupDelete", .signature = "\x00\x02\x11\x79\x11\x05\x11\x05" } },
    .{ "PeerGroupCreateInvitation", MethodRecord{ .library = "P2P", .import = "PeerGroupCreateInvitation", .signature = "\x00\x06\x11\x79\x0f\x01\x11\x05\x0f\x11\x80\x9d\x09\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "PeerGroupCreatePasswordInvitation", MethodRecord{ .library = "P2P", .import = "PeerGroupCreatePasswordInvitation", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x11\x05" } },
    .{ "PeerGroupParseInvitation", MethodRecord{ .library = "P2P", .import = "PeerGroupParseInvitation", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x0f\x11\xb7\xf1" } },
    .{ "PeerGroupGetStatus", MethodRecord{ .library = "P2P", .import = "PeerGroupGetStatus", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x09" } },
    .{ "PeerGroupGetProperties", MethodRecord{ .library = "P2P", .import = "PeerGroupGetProperties", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x0f\x11\xb7\xed" } },
    .{ "PeerGroupSetProperties", MethodRecord{ .library = "P2P", .import = "PeerGroupSetProperties", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x11\xb7\xed" } },
    .{ "PeerGroupEnumMembers", MethodRecord{ .library = "P2P", .import = "PeerGroupEnumMembers", .signature = "\x00\x04\x11\x79\x0f\x01\x09\x11\x05\x0f\x0f\x01" } },
    .{ "PeerGroupOpenDirectConnection", MethodRecord{ .library = "P2P", .import = "PeerGroupOpenDirectConnection", .signature = "\x00\x04\x11\x79\x0f\x01\x11\x05\x0f\x11\xb7\xd9\x0f\x0b" } },
    .{ "PeerGroupCloseDirectConnection", MethodRecord{ .library = "P2P", .import = "PeerGroupCloseDirectConnection", .signature = "\x00\x02\x11\x79\x0f\x01\x0b" } },
    .{ "PeerGroupEnumConnections", MethodRecord{ .library = "P2P", .import = "PeerGroupEnumConnections", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x0f\x01" } },
    .{ "PeerGroupSendData", MethodRecord{ .library = "P2P", .import = "PeerGroupSendData", .signature = "\x00\x05\x11\x79\x0f\x01\x0b\x0f\x11\x0d\x09\x0f\x01" } },
    .{ "PeerGroupRegisterEvent", MethodRecord{ .library = "P2P", .import = "PeerGroupRegisterEvent", .signature = "\x00\x05\x11\x79\x0f\x01\x11\x80\x85\x09\x0f\x11\xb7\xf5\x0f\x0f\x01" } },
    .{ "PeerGroupUnregisterEvent", MethodRecord{ .library = "P2P", .import = "PeerGroupUnregisterEvent", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "PeerGroupGetEventData", MethodRecord{ .library = "P2P", .import = "PeerGroupGetEventData", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x0f\x11\xb7\xf9" } },
    .{ "PeerGroupGetRecord", MethodRecord{ .library = "P2P", .import = "PeerGroupGetRecord", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x11\x0d\x0f\x0f\x11\xb7\xe5" } },
    .{ "PeerGroupAddRecord", MethodRecord{ .library = "P2P", .import = "PeerGroupAddRecord", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x11\xb7\xe5\x0f\x11\x0d" } },
    .{ "PeerGroupUpdateRecord", MethodRecord{ .library = "P2P", .import = "PeerGroupUpdateRecord", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x11\xb7\xe5" } },
    .{ "PeerGroupDeleteRecord", MethodRecord{ .library = "P2P", .import = "PeerGroupDeleteRecord", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x11\x0d" } },
    .{ "PeerGroupEnumRecords", MethodRecord{ .library = "P2P", .import = "PeerGroupEnumRecords", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PeerGroupSearchRecords", MethodRecord{ .library = "P2P", .import = "PeerGroupSearchRecords", .signature = "\x00\x03\x11\x79\x0f\x01\x11\x05\x0f\x0f\x01" } },
    .{ "PeerGroupExportDatabase", MethodRecord{ .library = "P2P", .import = "PeerGroupExportDatabase", .signature = "\x00\x02\x11\x79\x0f\x01\x11\x05" } },
    .{ "PeerGroupImportDatabase", MethodRecord{ .library = "P2P", .import = "PeerGroupImportDatabase", .signature = "\x00\x02\x11\x79\x0f\x01\x11\x05" } },
    .{ "PeerGroupIssueCredentials", MethodRecord{ .library = "P2P", .import = "PeerGroupIssueCredentials", .signature = "\x00\x05\x11\x79\x0f\x01\x11\x05\x0f\x11\xb7\xfd\x09\x0f\x11\x05" } },
    .{ "PeerGroupExportConfig", MethodRecord{ .library = "P2P", .import = "PeerGroupExportConfig", .signature = "\x00\x03\x11\x79\x0f\x01\x11\x05\x0f\x11\x05" } },
    .{ "PeerGroupImportConfig", MethodRecord{ .library = "P2P", .import = "PeerGroupImportConfig", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x11\x59\x0f\x11\x05\x0f\x11\x05" } },
    .{ "PeerGroupPeerTimeToUniversalTime", MethodRecord{ .library = "P2P", .import = "PeerGroupPeerTimeToUniversalTime", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x11\x80\x9d\x0f\x11\x80\x9d" } },
    .{ "PeerGroupUniversalTimeToPeerTime", MethodRecord{ .library = "P2P", .import = "PeerGroupUniversalTimeToPeerTime", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x11\x80\x9d\x0f\x11\x80\x9d" } },
    .{ "PeerGroupResumePasswordAuthentication", MethodRecord{ .library = "P2P", .import = "PeerGroupResumePasswordAuthentication", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x01" } },
    .{ "PeerIdentityCreate", MethodRecord{ .library = "P2P", .import = "PeerIdentityCreate", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x19\x0f\x11\x05" } },
    .{ "PeerIdentityGetFriendlyName", MethodRecord{ .library = "P2P", .import = "PeerIdentityGetFriendlyName", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "PeerIdentitySetFriendlyName", MethodRecord{ .library = "P2P", .import = "PeerIdentitySetFriendlyName", .signature = "\x00\x02\x11\x79\x11\x05\x11\x05" } },
    .{ "PeerIdentityGetCryptKey", MethodRecord{ .library = "P2P", .import = "PeerIdentityGetCryptKey", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x19" } },
    .{ "PeerIdentityDelete", MethodRecord{ .library = "P2P", .import = "PeerIdentityDelete", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "PeerEnumIdentities", MethodRecord{ .library = "P2P", .import = "PeerEnumIdentities", .signature = "\x00\x01\x11\x79\x0f\x0f\x01" } },
    .{ "PeerEnumGroups", MethodRecord{ .library = "P2P", .import = "PeerEnumGroups", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x0f\x01" } },
    .{ "PeerCreatePeerName", MethodRecord{ .library = "P2P", .import = "PeerCreatePeerName", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x0f\x11\x05" } },
    .{ "PeerIdentityGetXML", MethodRecord{ .library = "P2P", .import = "PeerIdentityGetXML", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "PeerIdentityExport", MethodRecord{ .library = "P2P", .import = "PeerIdentityExport", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x0f\x11\x05" } },
    .{ "PeerIdentityImport", MethodRecord{ .library = "P2P", .import = "PeerIdentityImport", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x0f\x11\x05" } },
    .{ "PeerIdentityGetDefault", MethodRecord{ .library = "P2P", .import = "PeerIdentityGetDefault", .signature = "\x00\x01\x11\x79\x0f\x11\x05" } },
    .{ "PeerCollabStartup", MethodRecord{ .library = "P2P", .import = "PeerCollabStartup", .signature = "\x00\x01\x11\x79\x07" } },
    .{ "PeerCollabShutdown", MethodRecord{ .library = "P2P", .import = "PeerCollabShutdown", .signature = "\x00\x00\x11\x79" } },
    .{ "PeerCollabSignin", MethodRecord{ .library = "P2P", .import = "PeerCollabSignin", .signature = "\x00\x02\x11\x79\x11\x25\x09" } },
    .{ "PeerCollabSignout", MethodRecord{ .library = "P2P", .import = "PeerCollabSignout", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "PeerCollabGetSigninOptions", MethodRecord{ .library = "P2P", .import = "PeerCollabGetSigninOptions", .signature = "\x00\x01\x11\x79\x0f\x09" } },
    .{ "PeerCollabAsyncInviteContact", MethodRecord{ .library = "P2P", .import = "PeerCollabAsyncInviteContact", .signature = "\x00\x05\x11\x79\x0f\x11\xb8\x01\x0f\x11\xb8\x05\x0f\x11\xb8\x09\x11\x80\x85\x0f\x11\x80\x85" } },
    .{ "PeerCollabGetInvitationResponse", MethodRecord{ .library = "P2P", .import = "PeerCollabGetInvitationResponse", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x0f\x11\xb8\x0d" } },
    .{ "PeerCollabCancelInvitation", MethodRecord{ .library = "P2P", .import = "PeerCollabCancelInvitation", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "PeerCollabCloseHandle", MethodRecord{ .library = "P2P", .import = "PeerCollabCloseHandle", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "PeerCollabInviteContact", MethodRecord{ .library = "P2P", .import = "PeerCollabInviteContact", .signature = "\x00\x04\x11\x79\x0f\x11\xb8\x01\x0f\x11\xb8\x05\x0f\x11\xb8\x09\x0f\x0f\x11\xb8\x0d" } },
    .{ "PeerCollabAsyncInviteEndpoint", MethodRecord{ .library = "P2P", .import = "PeerCollabAsyncInviteEndpoint", .signature = "\x00\x04\x11\x79\x0f\x11\xb8\x05\x0f\x11\xb8\x09\x11\x80\x85\x0f\x11\x80\x85" } },
    .{ "PeerCollabInviteEndpoint", MethodRecord{ .library = "P2P", .import = "PeerCollabInviteEndpoint", .signature = "\x00\x03\x11\x79\x0f\x11\xb8\x05\x0f\x11\xb8\x09\x0f\x0f\x11\xb8\x0d" } },
    .{ "PeerCollabGetAppLaunchInfo", MethodRecord{ .library = "P2P", .import = "PeerCollabGetAppLaunchInfo", .signature = "\x00\x01\x11\x79\x0f\x0f\x11\xb8\x11" } },
    .{ "PeerCollabRegisterApplication", MethodRecord{ .library = "P2P", .import = "PeerCollabRegisterApplication", .signature = "\x00\x02\x11\x79\x0f\x11\xb8\x15\x11\xb8\x19" } },
    .{ "PeerCollabUnregisterApplication", MethodRecord{ .library = "P2P", .import = "PeerCollabUnregisterApplication", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x11\xb8\x19" } },
    .{ "PeerCollabGetApplicationRegistrationInfo", MethodRecord{ .library = "P2P", .import = "PeerCollabGetApplicationRegistrationInfo", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x11\xb8\x19\x0f\x0f\x11\xb8\x15" } },
    .{ "PeerCollabEnumApplicationRegistrationInfo", MethodRecord{ .library = "P2P", .import = "PeerCollabEnumApplicationRegistrationInfo", .signature = "\x00\x02\x11\x79\x11\xb8\x19\x0f\x0f\x01" } },
    .{ "PeerCollabGetPresenceInfo", MethodRecord{ .library = "P2P", .import = "PeerCollabGetPresenceInfo", .signature = "\x00\x02\x11\x79\x0f\x11\xb8\x05\x0f\x0f\x11\xb8\x1d" } },
    .{ "PeerCollabEnumApplications", MethodRecord{ .library = "P2P", .import = "PeerCollabEnumApplications", .signature = "\x00\x03\x11\x79\x0f\x11\xb8\x05\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PeerCollabEnumObjects", MethodRecord{ .library = "P2P", .import = "PeerCollabEnumObjects", .signature = "\x00\x03\x11\x79\x0f\x11\xb8\x05\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PeerCollabEnumEndpoints", MethodRecord{ .library = "P2P", .import = "PeerCollabEnumEndpoints", .signature = "\x00\x02\x11\x79\x0f\x11\xb8\x01\x0f\x0f\x01" } },
    .{ "PeerCollabRefreshEndpointData", MethodRecord{ .library = "P2P", .import = "PeerCollabRefreshEndpointData", .signature = "\x00\x01\x11\x79\x0f\x11\xb8\x05" } },
    .{ "PeerCollabDeleteEndpointData", MethodRecord{ .library = "P2P", .import = "PeerCollabDeleteEndpointData", .signature = "\x00\x01\x11\x79\x0f\x11\xb8\x05" } },
    .{ "PeerCollabQueryContactData", MethodRecord{ .library = "P2P", .import = "PeerCollabQueryContactData", .signature = "\x00\x02\x11\x79\x0f\x11\xb8\x05\x0f\x11\x05" } },
    .{ "PeerCollabSubscribeEndpointData", MethodRecord{ .library = "P2P", .import = "PeerCollabSubscribeEndpointData", .signature = "\x00\x01\x11\x79\x0f\x11\xb8\x05" } },
    .{ "PeerCollabUnsubscribeEndpointData", MethodRecord{ .library = "P2P", .import = "PeerCollabUnsubscribeEndpointData", .signature = "\x00\x01\x11\x79\x0f\x11\xb8\x05" } },
    .{ "PeerCollabSetPresenceInfo", MethodRecord{ .library = "P2P", .import = "PeerCollabSetPresenceInfo", .signature = "\x00\x01\x11\x79\x0f\x11\xb8\x1d" } },
    .{ "PeerCollabGetEndpointName", MethodRecord{ .library = "P2P", .import = "PeerCollabGetEndpointName", .signature = "\x00\x01\x11\x79\x0f\x11\x05" } },
    .{ "PeerCollabSetEndpointName", MethodRecord{ .library = "P2P", .import = "PeerCollabSetEndpointName", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "PeerCollabSetObject", MethodRecord{ .library = "P2P", .import = "PeerCollabSetObject", .signature = "\x00\x01\x11\x79\x0f\x11\xb8\x21" } },
    .{ "PeerCollabDeleteObject", MethodRecord{ .library = "P2P", .import = "PeerCollabDeleteObject", .signature = "\x00\x01\x11\x79\x0f\x11\x0d" } },
    .{ "PeerCollabRegisterEvent", MethodRecord{ .library = "P2P", .import = "PeerCollabRegisterEvent", .signature = "\x00\x04\x11\x79\x11\x80\x85\x09\x0f\x11\xb8\x25\x0f\x0f\x01" } },
    .{ "PeerCollabGetEventData", MethodRecord{ .library = "P2P", .import = "PeerCollabGetEventData", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x0f\x11\xb8\x29" } },
    .{ "PeerCollabUnregisterEvent", MethodRecord{ .library = "P2P", .import = "PeerCollabUnregisterEvent", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "PeerCollabEnumPeopleNearMe", MethodRecord{ .library = "P2P", .import = "PeerCollabEnumPeopleNearMe", .signature = "\x00\x01\x11\x79\x0f\x0f\x01" } },
    .{ "PeerCollabAddContact", MethodRecord{ .library = "P2P", .import = "PeerCollabAddContact", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x0f\x11\xb8\x01" } },
    .{ "PeerCollabDeleteContact", MethodRecord{ .library = "P2P", .import = "PeerCollabDeleteContact", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "PeerCollabGetContact", MethodRecord{ .library = "P2P", .import = "PeerCollabGetContact", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x0f\x11\xb8\x01" } },
    .{ "PeerCollabUpdateContact", MethodRecord{ .library = "P2P", .import = "PeerCollabUpdateContact", .signature = "\x00\x01\x11\x79\x0f\x11\xb8\x01" } },
    .{ "PeerCollabEnumContacts", MethodRecord{ .library = "P2P", .import = "PeerCollabEnumContacts", .signature = "\x00\x01\x11\x79\x0f\x0f\x01" } },
    .{ "PeerCollabExportContact", MethodRecord{ .library = "P2P", .import = "PeerCollabExportContact", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "PeerCollabParseContact", MethodRecord{ .library = "P2P", .import = "PeerCollabParseContact", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x0f\x11\xb8\x01" } },
    .{ "PeerNameToPeerHostName", MethodRecord{ .library = "P2P", .import = "PeerNameToPeerHostName", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "PeerHostNameToPeerName", MethodRecord{ .library = "P2P", .import = "PeerHostNameToPeerName", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "PeerPnrpStartup", MethodRecord{ .library = "P2P", .import = "PeerPnrpStartup", .signature = "\x00\x01\x11\x79\x07" } },
    .{ "PeerPnrpShutdown", MethodRecord{ .library = "P2P", .import = "PeerPnrpShutdown", .signature = "\x00\x00\x11\x79" } },
    .{ "PeerPnrpRegister", MethodRecord{ .library = "P2P", .import = "PeerPnrpRegister", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\xb8\x2d\x0f\x0f\x01" } },
    .{ "PeerPnrpUpdateRegistration", MethodRecord{ .library = "P2P", .import = "PeerPnrpUpdateRegistration", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x11\xb8\x2d" } },
    .{ "PeerPnrpUnregister", MethodRecord{ .library = "P2P", .import = "PeerPnrpUnregister", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "PeerPnrpResolve", MethodRecord{ .library = "P2P", .import = "PeerPnrpResolve", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x0f\x09\x0f\x0f\x11\xb8\x31" } },
    .{ "PeerPnrpStartResolve", MethodRecord{ .library = "P2P", .import = "PeerPnrpStartResolve", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x09\x11\x80\x85\x0f\x0f\x01" } },
    .{ "PeerPnrpGetCloudInfo", MethodRecord{ .library = "P2P", .import = "PeerPnrpGetCloudInfo", .signature = "\x00\x02\x11\x79\x0f\x09\x0f\x0f\x11\xb8\x35" } },
    .{ "PeerPnrpGetEndpoint", MethodRecord{ .library = "P2P", .import = "PeerPnrpGetEndpoint", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x0f\x11\xb8\x31" } },
    .{ "PeerPnrpEndResolve", MethodRecord{ .library = "P2P", .import = "PeerPnrpEndResolve", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "DrtCreatePnrpBootstrapResolver", MethodRecord{ .library = "drtprov", .import = "DrtCreatePnrpBootstrapResolver", .signature = "\x00\x05\x11\x79\x11\x59\x11\x05\x11\x05\x11\x05\x0f\x0f\x11\xb8\x39" } },
    .{ "DrtDeletePnrpBootstrapResolver", MethodRecord{ .library = "drtprov", .import = "DrtDeletePnrpBootstrapResolver", .signature = "\x00\x01\x01\x0f\x11\xb8\x39" } },
    .{ "DrtCreateDnsBootstrapResolver", MethodRecord{ .library = "drtprov", .import = "DrtCreateDnsBootstrapResolver", .signature = "\x00\x03\x11\x79\x07\x11\x05\x0f\x0f\x11\xb8\x39" } },
    .{ "DrtDeleteDnsBootstrapResolver", MethodRecord{ .library = "drtprov", .import = "DrtDeleteDnsBootstrapResolver", .signature = "\x00\x01\x01\x0f\x11\xb8\x39" } },
    .{ "DrtCreateIpv6UdpTransport", MethodRecord{ .library = "drttransport", .import = "DrtCreateIpv6UdpTransport", .signature = "\x00\x05\x11\x79\x11\xb8\x3d\x09\x09\x0f\x07\x0f\x0f\x01" } },
    .{ "DrtDeleteIpv6UdpTransport", MethodRecord{ .library = "drttransport", .import = "DrtDeleteIpv6UdpTransport", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "DrtCreateDerivedKeySecurityProvider", MethodRecord{ .library = "drtprov", .import = "DrtCreateDerivedKeySecurityProvider", .signature = "\x00\x03\x11\x79\x0f\x11\x7d\x0f\x11\x7d\x0f\x0f\x11\xb8\x41" } },
    .{ "DrtCreateDerivedKey", MethodRecord{ .library = "drtprov", .import = "DrtCreateDerivedKey", .signature = "\x00\x02\x11\x79\x0f\x11\x7d\x0f\x11\xb8\x45" } },
    .{ "DrtDeleteDerivedKeySecurityProvider", MethodRecord{ .library = "drtprov", .import = "DrtDeleteDerivedKeySecurityProvider", .signature = "\x00\x01\x01\x0f\x11\xb8\x41" } },
    .{ "DrtCreateNullSecurityProvider", MethodRecord{ .library = "drtprov", .import = "DrtCreateNullSecurityProvider", .signature = "\x00\x01\x11\x79\x0f\x0f\x11\xb8\x41" } },
    .{ "DrtDeleteNullSecurityProvider", MethodRecord{ .library = "drtprov", .import = "DrtDeleteNullSecurityProvider", .signature = "\x00\x01\x01\x0f\x11\xb8\x41" } },
    .{ "DrtOpen", MethodRecord{ .library = "drt", .import = "DrtOpen", .signature = "\x00\x04\x11\x79\x0f\x11\xb8\x49\x11\x80\x85\x0f\x01\x0f\x0f\x01" } },
    .{ "DrtClose", MethodRecord{ .library = "drt", .import = "DrtClose", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "DrtGetEventDataSize", MethodRecord{ .library = "drt", .import = "DrtGetEventDataSize", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x09" } },
    .{ "DrtGetEventData", MethodRecord{ .library = "drt", .import = "DrtGetEventData", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\xb8\x4d" } },
    .{ "DrtRegisterKey", MethodRecord{ .library = "drt", .import = "DrtRegisterKey", .signature = "\x00\x04\x11\x79\x0f\x01\x0f\x11\xb8\x51\x0f\x01\x0f\x0f\x01" } },
    .{ "DrtUpdateKey", MethodRecord{ .library = "drt", .import = "DrtUpdateKey", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x11\xb8\x45" } },
    .{ "DrtUnregisterKey", MethodRecord{ .library = "drt", .import = "DrtUnregisterKey", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "DrtStartSearch", MethodRecord{ .library = "drt", .import = "DrtStartSearch", .signature = "\x00\x07\x11\x79\x0f\x01\x0f\x11\xb8\x45\x0f\x11\xb8\x55\x09\x11\x80\x85\x0f\x01\x0f\x0f\x01" } },
    .{ "DrtContinueSearch", MethodRecord{ .library = "drt", .import = "DrtContinueSearch", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "DrtGetSearchResultSize", MethodRecord{ .library = "drt", .import = "DrtGetSearchResultSize", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x09" } },
    .{ "DrtGetSearchResult", MethodRecord{ .library = "drt", .import = "DrtGetSearchResult", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\xb8\x59" } },
    .{ "DrtGetSearchPathSize", MethodRecord{ .library = "drt", .import = "DrtGetSearchPathSize", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x09" } },
    .{ "DrtGetSearchPath", MethodRecord{ .library = "drt", .import = "DrtGetSearchPath", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\xb8\x5d" } },
    .{ "DrtEndSearch", MethodRecord{ .library = "drt", .import = "DrtEndSearch", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "DrtGetInstanceName", MethodRecord{ .library = "drt", .import = "DrtGetInstanceName", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x11\x05" } },
    .{ "DrtGetInstanceNameSize", MethodRecord{ .library = "drt", .import = "DrtGetInstanceNameSize", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x09" } },
    .{ "PeerDistStartup", MethodRecord{ .library = "PeerDist", .import = "PeerDistStartup", .signature = "\x00\x03\x09\x09\x0f\x18\x0f\x09" } },
    .{ "PeerDistShutdown", MethodRecord{ .library = "PeerDist", .import = "PeerDistShutdown", .signature = "\x00\x01\x09\x18" } },
    .{ "PeerDistGetStatus", MethodRecord{ .library = "PeerDist", .import = "PeerDistGetStatus", .signature = "\x00\x02\x09\x18\x0f\x11\xb8\x61" } },
    .{ "PeerDistRegisterForStatusChangeNotification", MethodRecord{ .library = "PeerDist", .import = "PeerDistRegisterForStatusChangeNotification", .signature = "\x00\x05\x09\x18\x11\x80\x85\x19\x0f\x11\x8b\xed\x0f\x11\xb8\x61" } },
    .{ "PeerDistUnregisterForStatusChangeNotification", MethodRecord{ .library = "PeerDist", .import = "PeerDistUnregisterForStatusChangeNotification", .signature = "\x00\x01\x09\x18" } },
    .{ "PeerDistServerPublishStream", MethodRecord{ .library = "PeerDist", .import = "PeerDistServerPublishStream", .signature = "\x00\x08\x09\x18\x09\x0f\x05\x0b\x0f\x11\xb8\x65\x11\x80\x85\x19\x0f\x18" } },
    .{ "PeerDistServerPublishAddToStream", MethodRecord{ .library = "PeerDist", .import = "PeerDistServerPublishAddToStream", .signature = "\x00\x05\x09\x18\x18\x09\x0f\x05\x0f\x11\x8b\xed" } },
    .{ "PeerDistServerPublishCompleteStream", MethodRecord{ .library = "PeerDist", .import = "PeerDistServerPublishCompleteStream", .signature = "\x00\x03\x09\x18\x18\x0f\x11\x8b\xed" } },
    .{ "PeerDistServerCloseStreamHandle", MethodRecord{ .library = "PeerDist", .import = "PeerDistServerCloseStreamHandle", .signature = "\x00\x02\x09\x18\x18" } },
    .{ "PeerDistServerUnpublish", MethodRecord{ .library = "PeerDist", .import = "PeerDistServerUnpublish", .signature = "\x00\x03\x09\x18\x09\x0f\x05" } },
    .{ "PeerDistServerOpenContentInformation", MethodRecord{ .library = "PeerDist", .import = "PeerDistServerOpenContentInformation", .signature = "\x00\x08\x09\x18\x09\x0f\x05\x0b\x0b\x11\x80\x85\x19\x0f\x18" } },
    .{ "PeerDistServerRetrieveContentInformation", MethodRecord{ .library = "PeerDist", .import = "PeerDistServerRetrieveContentInformation", .signature = "\x00\x05\x09\x18\x18\x09\x0f\x05\x0f\x11\x8b\xed" } },
    .{ "PeerDistServerCloseContentInformation", MethodRecord{ .library = "PeerDist", .import = "PeerDistServerCloseContentInformation", .signature = "\x00\x02\x09\x18\x18" } },
    .{ "PeerDistServerCancelAsyncOperation", MethodRecord{ .library = "PeerDist", .import = "PeerDistServerCancelAsyncOperation", .signature = "\x00\x04\x09\x18\x09\x0f\x05\x0f\x11\x8b\xed" } },
    .{ "PeerDistClientOpenContent", MethodRecord{ .library = "PeerDist", .import = "PeerDistClientOpenContent", .signature = "\x00\x05\x09\x18\x0f\x11\xb8\x69\x11\x80\x85\x19\x0f\x18" } },
    .{ "PeerDistClientCloseContent", MethodRecord{ .library = "PeerDist", .import = "PeerDistClientCloseContent", .signature = "\x00\x02\x09\x18\x18" } },
    .{ "PeerDistClientAddContentInformation", MethodRecord{ .library = "PeerDist", .import = "PeerDistClientAddContentInformation", .signature = "\x00\x05\x09\x18\x18\x09\x0f\x05\x0f\x11\x8b\xed" } },
    .{ "PeerDistClientCompleteContentInformation", MethodRecord{ .library = "PeerDist", .import = "PeerDistClientCompleteContentInformation", .signature = "\x00\x03\x09\x18\x18\x0f\x11\x8b\xed" } },
    .{ "PeerDistClientAddData", MethodRecord{ .library = "PeerDist", .import = "PeerDistClientAddData", .signature = "\x00\x05\x09\x18\x18\x09\x0f\x05\x0f\x11\x8b\xed" } },
    .{ "PeerDistClientBlockRead", MethodRecord{ .library = "PeerDist", .import = "PeerDistClientBlockRead", .signature = "\x00\x06\x09\x18\x18\x09\x0f\x05\x09\x0f\x11\x8b\xed" } },
    .{ "PeerDistClientStreamRead", MethodRecord{ .library = "PeerDist", .import = "PeerDistClientStreamRead", .signature = "\x00\x06\x09\x18\x18\x09\x0f\x05\x09\x0f\x11\x8b\xed" } },
    .{ "PeerDistClientFlushContent", MethodRecord{ .library = "PeerDist", .import = "PeerDistClientFlushContent", .signature = "\x00\x05\x09\x18\x0f\x11\xb8\x69\x11\x80\x85\x19\x0f\x11\x8b\xed" } },
    .{ "PeerDistClientCancelAsyncOperation", MethodRecord{ .library = "PeerDist", .import = "PeerDistClientCancelAsyncOperation", .signature = "\x00\x03\x09\x18\x18\x0f\x11\x8b\xed" } },
    .{ "PeerDistGetStatusEx", MethodRecord{ .library = "PeerDist", .import = "PeerDistGetStatusEx", .signature = "\x00\x02\x09\x18\x0f\x11\xb8\x6d" } },
    .{ "PeerDistRegisterForStatusChangeNotificationEx", MethodRecord{ .library = "PeerDist", .import = "PeerDistRegisterForStatusChangeNotificationEx", .signature = "\x00\x05\x09\x18\x11\x80\x85\x19\x0f\x11\x8b\xed\x0f\x11\xb8\x6d" } },
    .{ "PeerDistGetOverlappedResult", MethodRecord{ .library = "PeerDist", .import = "PeerDistGetOverlappedResult", .signature = "\x00\x03\x11\x59\x0f\x11\x8b\xed\x0f\x09\x11\x59" } },
    .{ "PeerDistServerOpenContentInformationEx", MethodRecord{ .library = "PeerDist", .import = "PeerDistServerOpenContentInformationEx", .signature = "\x00\x09\x09\x18\x09\x0f\x05\x0b\x0b\x0f\x11\xb8\x71\x11\x80\x85\x19\x0f\x18" } },
    .{ "PeerDistClientGetInformationByHandle", MethodRecord{ .library = "PeerDist", .import = "PeerDistClientGetInformationByHandle", .signature = "\x00\x05\x09\x18\x18\x11\xb8\x75\x09\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x7d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CONTEXT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0xbed => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED" },
        0x37cd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_VERSION_DATA" },
        0x37d1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_GRAPH_PROPERTIES" },
        0x37d5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_SECURITY_INTERFACE" },
        0x37d9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_ADDRESS" },
        0x37dd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_GRAPH_EVENT_REGISTRATION" },
        0x37e1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_GRAPH_EVENT_DATA" },
        0x37e5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_RECORD" },
        0x37e9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_NODE_INFO" },
        0x37ed => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_GROUP_PROPERTIES" },
        0x37f1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_INVITATION_INFO" },
        0x37f5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_GROUP_EVENT_REGISTRATION" },
        0x37f9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_GROUP_EVENT_DATA" },
        0x37fd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_CREDENTIAL_INFO" },
        0x3801 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_CONTACT" },
        0x3805 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_ENDPOINT" },
        0x3809 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_INVITATION" },
        0x380d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_INVITATION_RESPONSE" },
        0x3811 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_APP_LAUNCH_INFO" },
        0x3815 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_APPLICATION_REGISTRATION_INFO" },
        0x3819 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_APPLICATION_REGISTRATION_TYPE" },
        0x381d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_PRESENCE_INFO" },
        0x3821 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_OBJECT" },
        0x3825 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_COLLAB_EVENT_REGISTRATION" },
        0x3829 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_COLLAB_EVENT_DATA" },
        0x382d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_PNRP_REGISTRATION_INFO" },
        0x3831 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_PNRP_ENDPOINT_INFO" },
        0x3835 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEER_PNRP_CLOUD_INFO" },
        0x3839 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "DRT_BOOTSTRAP_PROVIDER" },
        0x383d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "DRT_SCOPE" },
        0x3841 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "DRT_SECURITY_PROVIDER" },
        0x3845 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "DRT_DATA" },
        0x3849 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "DRT_SETTINGS" },
        0x384d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "DRT_EVENT_DATA" },
        0x3851 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "DRT_REGISTRATION" },
        0x3855 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "DRT_SEARCH_INFO" },
        0x3859 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "DRT_SEARCH_RESULT" },
        0x385d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "DRT_ADDRESS_LIST" },
        0x3861 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEERDIST_STATUS" },
        0x3865 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEERDIST_PUBLICATION_OPTIONS" },
        0x3869 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEERDIST_CONTENT_TAG" },
        0x386d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEERDIST_STATUS_INFO" },
        0x3871 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEERDIST_RETRIEVAL_OPTIONS" },
        0x3875 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.P2P", .name = "PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS" },
        else => null,
    };
}

pub const PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_1 = 1;
pub const PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_2 = 2;
pub const PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION = 2;
pub const NS_PNRPNAME = 38;
pub const NS_PNRPCLOUD = 39;
pub const PNRPINFO_HINT = 1;
pub const PNRP_MAX_ENDPOINT_ADDRESSES = 10;
pub const PNRP_MAX_EXTENDED_PAYLOAD_BYTES = 4096;
pub const WSA_PNRP_ERROR_BASE = 11500;
pub const WSA_PNRP_CLOUD_NOT_FOUND = 11501;
pub const WSA_PNRP_CLOUD_DISABLED = 11502;
pub const WSA_PNRP_INVALID_IDENTITY = 11503;
pub const WSA_PNRP_TOO_MUCH_LOAD = 11504;
pub const WSA_PNRP_CLOUD_IS_SEARCH_ONLY = 11505;
pub const WSA_PNRP_CLIENT_INVALID_COMPARTMENT_ID = 11506;
pub const WSA_PNRP_DUPLICATE_PEER_NAME = 11508;
pub const WSA_PNRP_CLOUD_IS_DEAD = 11509;
pub const PEER_E_CLOUD_NOT_FOUND = -2147013395;
pub const PEER_E_CLOUD_DISABLED = -2147013394;
pub const PEER_E_INVALID_IDENTITY = -2147013393;
pub const PEER_E_TOO_MUCH_LOAD = -2147013392;
pub const PEER_E_CLOUD_IS_SEARCH_ONLY = -2147013391;
pub const PEER_E_CLIENT_INVALID_COMPARTMENT_ID = -2147013390;
pub const PEER_E_DUPLICATE_PEER_NAME = -2147013388;
pub const PEER_E_CLOUD_IS_DEAD = -2147013387;
pub const PEER_E_NOT_FOUND = -2147023728;
pub const PEER_E_DISK_FULL = -2147024784;
pub const PEER_E_ALREADY_EXISTS = -2147024713;
pub const FACILITY_DRT = 98;
pub const DRT_E_TIMEOUT = -2141057023;
pub const DRT_E_INVALID_KEY_SIZE = -2141057022;
pub const DRT_E_INVALID_CERT_CHAIN = -2141057020;
pub const DRT_E_INVALID_MESSAGE = -2141057019;
pub const DRT_E_NO_MORE = -2141057018;
pub const DRT_E_INVALID_MAX_ADDRESSES = -2141057017;
pub const DRT_E_SEARCH_IN_PROGRESS = -2141057016;
pub const DRT_E_INVALID_KEY = -2141057015;
pub const DRT_S_RETRY = 6426640;
pub const DRT_E_INVALID_MAX_ENDPOINTS = -2141057007;
pub const DRT_E_INVALID_SEARCH_RANGE = -2141057006;
pub const DRT_E_INVALID_PORT = -2141052928;
pub const DRT_E_INVALID_TRANSPORT_PROVIDER = -2141052927;
pub const DRT_E_INVALID_SECURITY_PROVIDER = -2141052926;
pub const DRT_E_STILL_IN_USE = -2141052925;
pub const DRT_E_INVALID_BOOTSTRAP_PROVIDER = -2141052924;
pub const DRT_E_INVALID_ADDRESS = -2141052923;
pub const DRT_E_INVALID_SCOPE = -2141052922;
pub const DRT_E_TRANSPORT_SHUTTING_DOWN = -2141052921;
pub const DRT_E_NO_ADDRESSES_AVAILABLE = -2141052920;
pub const DRT_E_DUPLICATE_KEY = -2141052919;
pub const DRT_E_TRANSPORTPROVIDER_IN_USE = -2141052918;
pub const DRT_E_TRANSPORTPROVIDER_NOT_ATTACHED = -2141052917;
pub const DRT_E_SECURITYPROVIDER_IN_USE = -2141052916;
pub const DRT_E_SECURITYPROVIDER_NOT_ATTACHED = -2141052915;
pub const DRT_E_BOOTSTRAPPROVIDER_IN_USE = -2141052914;
pub const DRT_E_BOOTSTRAPPROVIDER_NOT_ATTACHED = -2141052913;
pub const DRT_E_TRANSPORT_ALREADY_BOUND = -2141052671;
pub const DRT_E_TRANSPORT_NOT_BOUND = -2141052670;
pub const DRT_E_TRANSPORT_UNEXPECTED = -2141052669;
pub const DRT_E_TRANSPORT_INVALID_ARGUMENT = -2141052668;
pub const DRT_E_TRANSPORT_NO_DEST_ADDRESSES = -2141052667;
pub const DRT_E_TRANSPORT_EXECUTING_CALLBACK = -2141052666;
pub const DRT_E_TRANSPORT_ALREADY_EXISTS_FOR_SCOPE = -2141052665;
pub const DRT_E_INVALID_SETTINGS = -2141052664;
pub const DRT_E_INVALID_SEARCH_INFO = -2141052663;
pub const DRT_E_FAULTED = -2141052662;
pub const DRT_E_TRANSPORT_STILL_BOUND = -2141052661;
pub const DRT_E_INSUFFICIENT_BUFFER = -2141052660;
pub const DRT_E_INVALID_INSTANCE_PREFIX = -2141052659;
pub const DRT_E_INVALID_SECURITY_MODE = -2141052658;
pub const DRT_E_CAPABILITY_MISMATCH = -2141052657;
pub const DRT_PAYLOAD_REVOKED = 1;
pub const DRT_MIN_ROUTING_ADDRESSES = 1;
pub const DRT_MAX_ROUTING_ADDRESSES = 20;
pub const DRT_MAX_PAYLOAD_SIZE = 5120;
pub const DRT_MAX_INSTANCE_PREFIX_LEN = 128;
pub const DRT_LINK_LOCAL_ISATAP_SCOPEID = 4294967295;
pub const PEERDIST_PUBLICATION_OPTIONS_VERSION_1 = 1;
pub const PEERDIST_PUBLICATION_OPTIONS_VERSION = 2;
pub const PEERDIST_PUBLICATION_OPTIONS_VERSION_2 = 2;
pub const PEERDIST_READ_TIMEOUT_LOCAL_CACHE_ONLY = 0;
pub const PEERDIST_READ_TIMEOUT_DEFAULT = 4294967294;
pub const PNRP_SCOPE_ANY = 0;
pub const PNRP_GLOBAL_SCOPE = 1;
pub const PNRP_SITE_LOCAL_SCOPE = 2;
pub const PNRP_LINK_LOCAL_SCOPE = 3;
pub const PNRP_CLOUD_STATE_VIRTUAL = 0;
pub const PNRP_CLOUD_STATE_SYNCHRONISING = 1;
pub const PNRP_CLOUD_STATE_ACTIVE = 2;
pub const PNRP_CLOUD_STATE_DEAD = 3;
pub const PNRP_CLOUD_STATE_DISABLED = 4;
pub const PNRP_CLOUD_STATE_NO_NET = 5;
pub const PNRP_CLOUD_STATE_ALONE = 6;
pub const PNRP_CLOUD_NO_FLAGS = 0;
pub const PNRP_CLOUD_NAME_LOCAL = 1;
pub const PNRP_CLOUD_RESOLVE_ONLY = 2;
pub const PNRP_CLOUD_FULL_PARTICIPANT = 4;
pub const PNRP_REGISTERED_ID_STATE_OK = 1;
pub const PNRP_REGISTERED_ID_STATE_PROBLEM = 2;
pub const PNRP_RESOLVE_CRITERIA_DEFAULT = 0;
pub const PNRP_RESOLVE_CRITERIA_REMOTE_PEER_NAME = 1;
pub const PNRP_RESOLVE_CRITERIA_NEAREST_REMOTE_PEER_NAME = 2;
pub const PNRP_RESOLVE_CRITERIA_NON_CURRENT_PROCESS_PEER_NAME = 3;
pub const PNRP_RESOLVE_CRITERIA_NEAREST_NON_CURRENT_PROCESS_PEER_NAME = 4;
pub const PNRP_RESOLVE_CRITERIA_ANY_PEER_NAME = 5;
pub const PNRP_RESOLVE_CRITERIA_NEAREST_PEER_NAME = 6;
pub const PNRP_EXTENDED_PAYLOAD_TYPE_NONE = 0;
pub const PNRP_EXTENDED_PAYLOAD_TYPE_BINARY = 1;
pub const PNRP_EXTENDED_PAYLOAD_TYPE_STRING = 2;
pub const PEER_RECORD_ADDED = 1;
pub const PEER_RECORD_UPDATED = 2;
pub const PEER_RECORD_DELETED = 3;
pub const PEER_RECORD_EXPIRED = 4;
pub const PEER_CONNECTED = 1;
pub const PEER_DISCONNECTED = 2;
pub const PEER_CONNECTION_FAILED = 3;
pub const PEER_CONNECTION_NEIGHBOR = 1;
pub const PEER_CONNECTION_DIRECT = 2;
pub const PEER_RECORD_FLAG_AUTOREFRESH = 1;
pub const PEER_RECORD_FLAG_DELETED = 2;
pub const PEER_GRAPH_EVENT_STATUS_CHANGED = 1;
pub const PEER_GRAPH_EVENT_PROPERTY_CHANGED = 2;
pub const PEER_GRAPH_EVENT_RECORD_CHANGED = 3;
pub const PEER_GRAPH_EVENT_DIRECT_CONNECTION = 4;
pub const PEER_GRAPH_EVENT_NEIGHBOR_CONNECTION = 5;
pub const PEER_GRAPH_EVENT_INCOMING_DATA = 6;
pub const PEER_GRAPH_EVENT_CONNECTION_REQUIRED = 7;
pub const PEER_GRAPH_EVENT_NODE_CHANGED = 8;
pub const PEER_GRAPH_EVENT_SYNCHRONIZED = 9;
pub const PEER_NODE_CHANGE_CONNECTED = 1;
pub const PEER_NODE_CHANGE_DISCONNECTED = 2;
pub const PEER_NODE_CHANGE_UPDATED = 3;
pub const PEER_GRAPH_STATUS_LISTENING = 1;
pub const PEER_GRAPH_STATUS_HAS_CONNECTIONS = 2;
pub const PEER_GRAPH_STATUS_SYNCHRONIZED = 4;
pub const PEER_GRAPH_PROPERTY_HEARTBEATS = 1;
pub const PEER_GRAPH_PROPERTY_DEFER_EXPIRATION = 2;
pub const PEER_GRAPH_SCOPE_ANY = 0;
pub const PEER_GRAPH_SCOPE_GLOBAL = 1;
pub const PEER_GRAPH_SCOPE_SITELOCAL = 2;
pub const PEER_GRAPH_SCOPE_LINKLOCAL = 3;
pub const PEER_GRAPH_SCOPE_LOOPBACK = 4;
pub const PEER_GROUP_EVENT_STATUS_CHANGED = 1;
pub const PEER_GROUP_EVENT_PROPERTY_CHANGED = 2;
pub const PEER_GROUP_EVENT_RECORD_CHANGED = 3;
pub const PEER_GROUP_EVENT_DIRECT_CONNECTION = 4;
pub const PEER_GROUP_EVENT_NEIGHBOR_CONNECTION = 5;
pub const PEER_GROUP_EVENT_INCOMING_DATA = 6;
pub const PEER_GROUP_EVENT_MEMBER_CHANGED = 8;
pub const PEER_GROUP_EVENT_CONNECTION_FAILED = 10;
pub const PEER_GROUP_EVENT_AUTHENTICATION_FAILED = 11;
pub const PEER_GROUP_STATUS_LISTENING = 1;
pub const PEER_GROUP_STATUS_HAS_CONNECTIONS = 2;
pub const PEER_MEMBER_DATA_OPTIONAL = 1;
pub const PEER_DISABLE_PRESENCE = 2;
pub const PEER_DEFER_EXPIRATION = 4;
pub const PEER_GROUP_GMC_AUTHENTICATION = 1;
pub const PEER_GROUP_PASSWORD_AUTHENTICATION = 2;
pub const PEER_MEMBER_PRESENT = 1;
pub const PEER_MEMBER_CONNECTED = 1;
pub const PEER_MEMBER_DISCONNECTED = 2;
pub const PEER_MEMBER_UPDATED = 3;
pub const PEER_MEMBER_JOINED = 4;
pub const PEER_MEMBER_LEFT = 5;
pub const PEER_GROUP_STORE_CREDENTIALS = 1;
pub const PEER_SIGNIN_NONE = 0;
pub const PEER_SIGNIN_NEAR_ME = 1;
pub const PEER_SIGNIN_INTERNET = 2;
pub const PEER_SIGNIN_ALL = 3;
pub const PEER_WATCH_BLOCKED = 0;
pub const PEER_WATCH_ALLOWED = 1;
pub const PEER_PUBLICATION_SCOPE_NONE = 0;
pub const PEER_PUBLICATION_SCOPE_NEAR_ME = 1;
pub const PEER_PUBLICATION_SCOPE_INTERNET = 2;
pub const PEER_PUBLICATION_SCOPE_ALL = 3;
pub const PEER_INVITATION_RESPONSE_DECLINED = 0;
pub const PEER_INVITATION_RESPONSE_ACCEPTED = 1;
pub const PEER_INVITATION_RESPONSE_EXPIRED = 2;
pub const PEER_INVITATION_RESPONSE_ERROR = 3;
pub const PEER_APPLICATION_CURRENT_USER = 0;
pub const PEER_APPLICATION_ALL_USERS = 1;
pub const PEER_PRESENCE_OFFLINE = 0;
pub const PEER_PRESENCE_OUT_TO_LUNCH = 1;
pub const PEER_PRESENCE_AWAY = 2;
pub const PEER_PRESENCE_BE_RIGHT_BACK = 3;
pub const PEER_PRESENCE_IDLE = 4;
pub const PEER_PRESENCE_BUSY = 5;
pub const PEER_PRESENCE_ON_THE_PHONE = 6;
pub const PEER_PRESENCE_ONLINE = 7;
pub const PEER_CHANGE_ADDED = 0;
pub const PEER_CHANGE_DELETED = 1;
pub const PEER_CHANGE_UPDATED = 2;
pub const PEER_EVENT_WATCHLIST_CHANGED = 1;
pub const PEER_EVENT_ENDPOINT_CHANGED = 2;
pub const PEER_EVENT_ENDPOINT_PRESENCE_CHANGED = 3;
pub const PEER_EVENT_ENDPOINT_APPLICATION_CHANGED = 4;
pub const PEER_EVENT_ENDPOINT_OBJECT_CHANGED = 5;
pub const PEER_EVENT_MY_ENDPOINT_CHANGED = 6;
pub const PEER_EVENT_MY_PRESENCE_CHANGED = 7;
pub const PEER_EVENT_MY_APPLICATION_CHANGED = 8;
pub const PEER_EVENT_MY_OBJECT_CHANGED = 9;
pub const PEER_EVENT_PEOPLE_NEAR_ME_CHANGED = 10;
pub const PEER_EVENT_REQUEST_STATUS_CHANGED = 11;
pub const DRT_GLOBAL_SCOPE = 1;
pub const DRT_SITE_LOCAL_SCOPE = 2;
pub const DRT_LINK_LOCAL_SCOPE = 3;
pub const DRT_ACTIVE = 0;
pub const DRT_ALONE = 1;
pub const DRT_NO_NETWORK = 10;
pub const DRT_FAULTED = 20;
pub const DRT_MATCH_EXACT = 0;
pub const DRT_MATCH_NEAR = 1;
pub const DRT_MATCH_INTERMEDIATE = 2;
pub const DRT_LEAFSET_KEY_ADDED = 0;
pub const DRT_LEAFSET_KEY_DELETED = 1;
pub const DRT_EVENT_STATUS_CHANGED = 0;
pub const DRT_EVENT_LEAFSET_KEY_CHANGED = 1;
pub const DRT_EVENT_REGISTRATION_STATE_CHANGED = 2;
pub const DRT_SECURE_RESOLVE = 0;
pub const DRT_SECURE_MEMBERSHIP = 1;
pub const DRT_SECURE_CONFIDENTIALPAYLOAD = 2;
pub const DRT_REGISTRATION_STATE_UNRESOLVEABLE = 1;
pub const DRT_ADDRESS_FLAG_ACCEPTED = 1;
pub const DRT_ADDRESS_FLAG_REJECTED = 2;
pub const DRT_ADDRESS_FLAG_UNREACHABLE = 4;
pub const DRT_ADDRESS_FLAG_LOOP = 8;
pub const DRT_ADDRESS_FLAG_TOO_BUSY = 16;
pub const DRT_ADDRESS_FLAG_BAD_VALIDATE_ID = 32;
pub const DRT_ADDRESS_FLAG_SUSPECT_UNREGISTERED_ID = 64;
pub const DRT_ADDRESS_FLAG_INQUIRE = 128;
pub const PEERDIST_STATUS_DISABLED = 0;
pub const PEERDIST_STATUS_UNAVAILABLE = 1;
pub const PEERDIST_STATUS_AVAILABLE = 2;
pub const PeerDistClientBasicInfo = 0;
pub const MaximumPeerDistClientInfoByHandlesClass = 1;

pub const aliases = struct {
    pub const PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE = u32;
    pub const PNRP_SCOPE = i32;
    pub const PNRP_CLOUD_STATE = i32;
    pub const PNRP_CLOUD_FLAGS = i32;
    pub const PNRP_REGISTERED_ID_STATE = i32;
    pub const PNRP_RESOLVE_CRITERIA = i32;
    pub const PNRP_EXTENDED_PAYLOAD_TYPE = i32;
    pub const PEER_RECORD_CHANGE_TYPE = i32;
    pub const PEER_CONNECTION_STATUS = i32;
    pub const PEER_CONNECTION_FLAGS = i32;
    pub const PEER_RECORD_FLAGS = i32;
    pub const PEER_GRAPH_EVENT_TYPE = i32;
    pub const PEER_NODE_CHANGE_TYPE = i32;
    pub const PEER_GRAPH_STATUS_FLAGS = i32;
    pub const PEER_GRAPH_PROPERTY_FLAGS = i32;
    pub const PEER_GRAPH_SCOPE = i32;
    pub const PEER_GROUP_EVENT_TYPE = i32;
    pub const PEER_GROUP_STATUS = i32;
    pub const PEER_GROUP_PROPERTY_FLAGS = i32;
    pub const PEER_GROUP_AUTHENTICATION_SCHEME = i32;
    pub const PEER_MEMBER_FLAGS = i32;
    pub const PEER_MEMBER_CHANGE_TYPE = i32;
    pub const PEER_GROUP_ISSUE_CREDENTIAL_FLAGS = i32;
    pub const PEER_SIGNIN_FLAGS = i32;
    pub const PEER_WATCH_PERMISSION = i32;
    pub const PEER_PUBLICATION_SCOPE = i32;
    pub const PEER_INVITATION_RESPONSE_TYPE = i32;
    pub const PEER_APPLICATION_REGISTRATION_TYPE = i32;
    pub const PEER_PRESENCE_STATUS = i32;
    pub const PEER_CHANGE_TYPE = i32;
    pub const PEER_COLLAB_EVENT_TYPE = i32;
    pub const DRT_SCOPE = i32;
    pub const DRT_STATUS = i32;
    pub const DRT_MATCH_TYPE = i32;
    pub const DRT_LEAFSET_KEY_CHANGE_TYPE = i32;
    pub const DRT_EVENT_TYPE = i32;
    pub const DRT_SECURITY_MODE = i32;
    pub const DRT_REGISTRATION_STATE = i32;
    pub const DRT_ADDRESS_FLAGS = i32;
    pub const PEERDIST_STATUS = i32;
    pub const PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS = i32;
};
