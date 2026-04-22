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
    .{ "ADsGetObject", MethodRecord{ .library = "ACTIVEDS", .import = "ADsGetObject", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "ADsBuildEnumerator", MethodRecord{ .library = "ACTIVEDS", .import = "ADsBuildEnumerator", .signature = "\x00\x02\x11\x79\x12\xb0\x59\x0f\x12\xb0\x5d" } },
    .{ "ADsFreeEnumerator", MethodRecord{ .library = "ACTIVEDS", .import = "ADsFreeEnumerator", .signature = "\x00\x01\x11\x79\x12\xb0\x5d" } },
    .{ "ADsEnumerateNext", MethodRecord{ .library = "ACTIVEDS", .import = "ADsEnumerateNext", .signature = "\x00\x04\x11\x79\x12\xb0\x5d\x09\x0f\x11\x94\x89\x0f\x09" } },
    .{ "ADsBuildVarArrayStr", MethodRecord{ .library = "ACTIVEDS", .import = "ADsBuildVarArrayStr", .signature = "\x00\x03\x11\x79\x0f\x11\x05\x09\x0f\x11\x94\x89" } },
    .{ "ADsBuildVarArrayInt", MethodRecord{ .library = "ACTIVEDS", .import = "ADsBuildVarArrayInt", .signature = "\x00\x03\x11\x79\x0f\x09\x09\x0f\x11\x94\x89" } },
    .{ "ADsOpenObject", MethodRecord{ .library = "ACTIVEDS", .import = "ADsOpenObject", .signature = "\x00\x06\x11\x79\x11\x05\x11\x05\x11\x05\x11\xb0\x61\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "ADsGetLastError", MethodRecord{ .library = "ACTIVEDS", .import = "ADsGetLastError", .signature = "\x00\x05\x11\x79\x0f\x09\x11\x05\x09\x11\x05\x09" } },
    .{ "ADsSetLastError", MethodRecord{ .library = "ACTIVEDS", .import = "ADsSetLastError", .signature = "\x00\x03\x01\x09\x11\x05\x11\x05" } },
    .{ "AllocADsMem", MethodRecord{ .library = "ACTIVEDS", .import = "AllocADsMem", .signature = "\x00\x01\x0f\x01\x09" } },
    .{ "FreeADsMem", MethodRecord{ .library = "ACTIVEDS", .import = "FreeADsMem", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "ReallocADsMem", MethodRecord{ .library = "ACTIVEDS", .import = "ReallocADsMem", .signature = "\x00\x03\x0f\x01\x0f\x01\x09\x09" } },
    .{ "AllocADsStr", MethodRecord{ .library = "ACTIVEDS", .import = "AllocADsStr", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "FreeADsStr", MethodRecord{ .library = "ACTIVEDS", .import = "FreeADsStr", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "ReallocADsStr", MethodRecord{ .library = "ACTIVEDS", .import = "ReallocADsStr", .signature = "\x00\x02\x11\x59\x0f\x11\x05\x11\x05" } },
    .{ "ADsEncodeBinaryData", MethodRecord{ .library = "ACTIVEDS", .import = "ADsEncodeBinaryData", .signature = "\x00\x03\x11\x79\x0f\x05\x09\x0f\x11\x05" } },
    .{ "ADsDecodeBinaryData", MethodRecord{ .library = "ACTIVEDS", .import = "ADsDecodeBinaryData", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x0f\x05\x0f\x09" } },
    .{ "PropVariantToAdsType", MethodRecord{ .library = "ACTIVEDS", .import = "PropVariantToAdsType", .signature = "\x00\x04\x11\x79\x0f\x11\x94\x89\x09\x0f\x0f\x11\xb0\x65\x0f\x09" } },
    .{ "AdsTypeToPropVariant", MethodRecord{ .library = "ACTIVEDS", .import = "AdsTypeToPropVariant", .signature = "\x00\x03\x11\x79\x0f\x11\xb0\x65\x09\x0f\x11\x94\x89" } },
    .{ "AdsFreeAdsValues", MethodRecord{ .library = "ACTIVEDS", .import = "AdsFreeAdsValues", .signature = "\x00\x02\x01\x0f\x11\xb0\x65\x09" } },
    .{ "BinarySDToSecurityDescriptor", MethodRecord{ .library = "ACTIVEDS", .import = "BinarySDToSecurityDescriptor", .signature = "\x00\x06\x11\x79\x11\x82\xad\x0f\x11\x94\x89\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "SecurityDescriptorToBinarySD", MethodRecord{ .library = "ACTIVEDS", .import = "SecurityDescriptorToBinarySD", .signature = "\x00\x07\x11\x79\x11\x94\x89\x0f\x11\x82\xad\x0f\x09\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "DsBrowseForContainerW", MethodRecord{ .library = "dsuiext", .import = "DsBrowseForContainerW", .signature = "\x00\x01\x08\x0f\x11\xb0\x69" } },
    .{ "DsBrowseForContainerA", MethodRecord{ .library = "dsuiext", .import = "DsBrowseForContainerA", .signature = "\x00\x01\x08\x0f\x11\xb0\x6d" } },
    .{ "DsGetIcon", MethodRecord{ .library = "dsuiext", .import = "DsGetIcon", .signature = "\x00\x04\x11\x83\x55\x09\x11\x05\x08\x08" } },
    .{ "DsGetFriendlyClassName", MethodRecord{ .library = "dsuiext", .import = "DsGetFriendlyClassName", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x09" } },
    .{ "ADsPropCreateNotifyObj", MethodRecord{ .library = "dsprop", .import = "ADsPropCreateNotifyObj", .signature = "\x00\x03\x11\x79\x12\x99\xad\x11\x05\x0f\x11\x25" } },
    .{ "ADsPropGetInitInfo", MethodRecord{ .library = "dsprop", .import = "ADsPropGetInitInfo", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xb0\x71" } },
    .{ "ADsPropSetHwndWithTitle", MethodRecord{ .library = "dsprop", .import = "ADsPropSetHwndWithTitle", .signature = "\x00\x03\x11\x59\x11\x25\x11\x25\x0f\x04" } },
    .{ "ADsPropSetHwnd", MethodRecord{ .library = "dsprop", .import = "ADsPropSetHwnd", .signature = "\x00\x02\x11\x59\x11\x25\x11\x25" } },
    .{ "ADsPropCheckIfWritable", MethodRecord{ .library = "dsprop", .import = "ADsPropCheckIfWritable", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x11\xb0\x75" } },
    .{ "ADsPropSendErrorMessage", MethodRecord{ .library = "dsprop", .import = "ADsPropSendErrorMessage", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\xb0\x79" } },
    .{ "ADsPropShowErrorDialog", MethodRecord{ .library = "dsprop", .import = "ADsPropShowErrorDialog", .signature = "\x00\x02\x11\x59\x11\x25\x11\x25" } },
    .{ "DsMakeSpnW", MethodRecord{ .library = "DSPARSE", .import = "DsMakeSpnW", .signature = "\x00\x07\x09\x11\x05\x11\x05\x11\x05\x07\x11\x05\x0f\x09\x11\x05" } },
    .{ "DsMakeSpnA", MethodRecord{ .library = "DSPARSE", .import = "DsMakeSpnA", .signature = "\x00\x07\x09\x11\x3d\x11\x3d\x11\x3d\x07\x11\x3d\x0f\x09\x11\x3d" } },
    .{ "DsCrackSpnA", MethodRecord{ .library = "DSPARSE", .import = "DsCrackSpnA", .signature = "\x00\x08\x09\x11\x3d\x0f\x09\x11\x3d\x0f\x09\x11\x3d\x0f\x09\x11\x3d\x0f\x07" } },
    .{ "DsCrackSpnW", MethodRecord{ .library = "DSPARSE", .import = "DsCrackSpnW", .signature = "\x00\x08\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x07" } },
    .{ "DsQuoteRdnValueW", MethodRecord{ .library = "DSPARSE", .import = "DsQuoteRdnValueW", .signature = "\x00\x04\x09\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "DsQuoteRdnValueA", MethodRecord{ .library = "DSPARSE", .import = "DsQuoteRdnValueA", .signature = "\x00\x04\x09\x09\x11\x3d\x0f\x09\x11\x3d" } },
    .{ "DsUnquoteRdnValueW", MethodRecord{ .library = "DSPARSE", .import = "DsUnquoteRdnValueW", .signature = "\x00\x04\x09\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "DsUnquoteRdnValueA", MethodRecord{ .library = "DSPARSE", .import = "DsUnquoteRdnValueA", .signature = "\x00\x04\x09\x09\x11\x3d\x0f\x09\x11\x3d" } },
    .{ "DsGetRdnW", MethodRecord{ .library = "DSPARSE", .import = "DsGetRdnW", .signature = "\x00\x06\x09\x0f\x11\x05\x0f\x09\x0f\x11\x05\x0f\x09\x0f\x11\x05\x0f\x09" } },
    .{ "DsCrackUnquotedMangledRdnW", MethodRecord{ .library = "DSPARSE", .import = "DsCrackUnquotedMangledRdnW", .signature = "\x00\x04\x11\x59\x11\x05\x09\x0f\x11\x0d\x0f\x11\xb0\x7d" } },
    .{ "DsCrackUnquotedMangledRdnA", MethodRecord{ .library = "DSPARSE", .import = "DsCrackUnquotedMangledRdnA", .signature = "\x00\x04\x11\x59\x11\x3d\x09\x0f\x11\x0d\x0f\x11\xb0\x7d" } },
    .{ "DsIsMangledRdnValueW", MethodRecord{ .library = "DSPARSE", .import = "DsIsMangledRdnValueW", .signature = "\x00\x03\x11\x59\x11\x05\x09\x11\xb0\x7d" } },
    .{ "DsIsMangledRdnValueA", MethodRecord{ .library = "DSPARSE", .import = "DsIsMangledRdnValueA", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x11\xb0\x7d" } },
    .{ "DsIsMangledDnA", MethodRecord{ .library = "DSPARSE", .import = "DsIsMangledDnA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\xb0\x7d" } },
    .{ "DsIsMangledDnW", MethodRecord{ .library = "DSPARSE", .import = "DsIsMangledDnW", .signature = "\x00\x02\x11\x59\x11\x05\x11\xb0\x7d" } },
    .{ "DsCrackSpn2A", MethodRecord{ .library = "DSPARSE", .import = "DsCrackSpn2A", .signature = "\x00\x09\x09\x11\x3d\x09\x0f\x09\x11\x3d\x0f\x09\x11\x3d\x0f\x09\x11\x3d\x0f\x07" } },
    .{ "DsCrackSpn2W", MethodRecord{ .library = "DSPARSE", .import = "DsCrackSpn2W", .signature = "\x00\x09\x09\x11\x05\x09\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x07" } },
    .{ "DsCrackSpn3W", MethodRecord{ .library = "DSPARSE", .import = "DsCrackSpn3W", .signature = "\x00\x0b\x09\x11\x05\x09\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x07\x0f\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "DsCrackSpn4W", MethodRecord{ .library = "DSPARSE", .import = "DsCrackSpn4W", .signature = "\x00\x0c\x09\x11\x05\x09\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "DsBindW", MethodRecord{ .library = "NTDSAPI", .import = "DsBindW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x11\x80\x85" } },
    .{ "DsBindA", MethodRecord{ .library = "NTDSAPI", .import = "DsBindA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x0f\x11\x80\x85" } },
    .{ "DsBindWithCredW", MethodRecord{ .library = "NTDSAPI", .import = "DsBindWithCredW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x0f\x01\x0f\x11\x80\x85" } },
    .{ "DsBindWithCredA", MethodRecord{ .library = "NTDSAPI", .import = "DsBindWithCredA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x0f\x01\x0f\x11\x80\x85" } },
    .{ "DsBindWithSpnW", MethodRecord{ .library = "NTDSAPI", .import = "DsBindWithSpnW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x0f\x01\x11\x05\x0f\x11\x80\x85" } },
    .{ "DsBindWithSpnA", MethodRecord{ .library = "NTDSAPI", .import = "DsBindWithSpnA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x0f\x01\x11\x3d\x0f\x11\x80\x85" } },
    .{ "DsBindWithSpnExW", MethodRecord{ .library = "NTDSAPI", .import = "DsBindWithSpnExW", .signature = "\x00\x06\x09\x11\x05\x11\x05\x0f\x01\x11\x05\x09\x0f\x11\x80\x85" } },
    .{ "DsBindWithSpnExA", MethodRecord{ .library = "NTDSAPI", .import = "DsBindWithSpnExA", .signature = "\x00\x06\x09\x11\x3d\x11\x3d\x0f\x01\x11\x3d\x09\x0f\x11\x80\x85" } },
    .{ "DsBindByInstanceW", MethodRecord{ .library = "NTDSAPI", .import = "DsBindByInstanceW", .signature = "\x00\x08\x09\x11\x05\x11\x05\x0f\x11\x0d\x11\x05\x0f\x01\x11\x05\x09\x0f\x11\x80\x85" } },
    .{ "DsBindByInstanceA", MethodRecord{ .library = "NTDSAPI", .import = "DsBindByInstanceA", .signature = "\x00\x08\x09\x11\x3d\x11\x3d\x0f\x11\x0d\x11\x3d\x0f\x01\x11\x3d\x09\x0f\x11\x80\x85" } },
    .{ "DsBindToISTGW", MethodRecord{ .library = "NTDSAPI", .import = "DsBindToISTGW", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x80\x85" } },
    .{ "DsBindToISTGA", MethodRecord{ .library = "NTDSAPI", .import = "DsBindToISTGA", .signature = "\x00\x02\x09\x11\x3d\x0f\x11\x80\x85" } },
    .{ "DsBindingSetTimeout", MethodRecord{ .library = "NTDSAPI", .import = "DsBindingSetTimeout", .signature = "\x00\x02\x09\x11\x80\x85\x09" } },
    .{ "DsUnBindW", MethodRecord{ .library = "NTDSAPI", .import = "DsUnBindW", .signature = "\x00\x01\x09\x0f\x11\x80\x85" } },
    .{ "DsUnBindA", MethodRecord{ .library = "NTDSAPI", .import = "DsUnBindA", .signature = "\x00\x01\x09\x0f\x11\x80\x85" } },
    .{ "DsMakePasswordCredentialsW", MethodRecord{ .library = "NTDSAPI", .import = "DsMakePasswordCredentialsW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x05\x0f\x0f\x01" } },
    .{ "DsMakePasswordCredentialsA", MethodRecord{ .library = "NTDSAPI", .import = "DsMakePasswordCredentialsA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x11\x3d\x0f\x0f\x01" } },
    .{ "DsFreePasswordCredentials", MethodRecord{ .library = "NTDSAPI", .import = "DsFreePasswordCredentials", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "DsCrackNamesW", MethodRecord{ .library = "NTDSAPI", .import = "DsCrackNamesW", .signature = "\x00\x07\x09\x11\x80\x85\x11\xb0\x81\x11\xb0\x85\x11\xb0\x85\x09\x0f\x11\x05\x0f\x0f\x11\xb0\x89" } },
    .{ "DsCrackNamesA", MethodRecord{ .library = "NTDSAPI", .import = "DsCrackNamesA", .signature = "\x00\x07\x09\x11\x80\x85\x11\xb0\x81\x11\xb0\x85\x11\xb0\x85\x09\x0f\x11\x3d\x0f\x0f\x11\xb0\x8d" } },
    .{ "DsFreeNameResultW", MethodRecord{ .library = "NTDSAPI", .import = "DsFreeNameResultW", .signature = "\x00\x01\x01\x0f\x11\xb0\x89" } },
    .{ "DsFreeNameResultA", MethodRecord{ .library = "NTDSAPI", .import = "DsFreeNameResultA", .signature = "\x00\x01\x01\x0f\x11\xb0\x8d" } },
    .{ "DsGetSpnA", MethodRecord{ .library = "NTDSAPI", .import = "DsGetSpnA", .signature = "\x00\x09\x09\x11\xb0\x91\x11\x3d\x11\x3d\x07\x07\x0f\x11\x3d\x0f\x07\x0f\x09\x0f\x0f\x11\x3d" } },
    .{ "DsGetSpnW", MethodRecord{ .library = "NTDSAPI", .import = "DsGetSpnW", .signature = "\x00\x09\x09\x11\xb0\x91\x11\x05\x11\x05\x07\x07\x0f\x11\x05\x0f\x07\x0f\x09\x0f\x0f\x11\x05" } },
    .{ "DsFreeSpnArrayA", MethodRecord{ .library = "NTDSAPI", .import = "DsFreeSpnArrayA", .signature = "\x00\x02\x01\x09\x0f\x11\x3d" } },
    .{ "DsFreeSpnArrayW", MethodRecord{ .library = "NTDSAPI", .import = "DsFreeSpnArrayW", .signature = "\x00\x02\x01\x09\x0f\x11\x05" } },
    .{ "DsWriteAccountSpnA", MethodRecord{ .library = "NTDSAPI", .import = "DsWriteAccountSpnA", .signature = "\x00\x05\x09\x11\x80\x85\x11\xb0\x95\x11\x3d\x09\x0f\x11\x3d" } },
    .{ "DsWriteAccountSpnW", MethodRecord{ .library = "NTDSAPI", .import = "DsWriteAccountSpnW", .signature = "\x00\x05\x09\x11\x80\x85\x11\xb0\x95\x11\x05\x09\x0f\x11\x05" } },
    .{ "DsClientMakeSpnForTargetServerW", MethodRecord{ .library = "NTDSAPI", .import = "DsClientMakeSpnForTargetServerW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x0f\x09\x11\x05" } },
    .{ "DsClientMakeSpnForTargetServerA", MethodRecord{ .library = "NTDSAPI", .import = "DsClientMakeSpnForTargetServerA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x0f\x09\x11\x3d" } },
    .{ "DsServerRegisterSpnA", MethodRecord{ .library = "NTDSAPI", .import = "DsServerRegisterSpnA", .signature = "\x00\x03\x09\x11\xb0\x95\x11\x3d\x11\x3d" } },
    .{ "DsServerRegisterSpnW", MethodRecord{ .library = "NTDSAPI", .import = "DsServerRegisterSpnW", .signature = "\x00\x03\x09\x11\xb0\x95\x11\x05\x11\x05" } },
    .{ "DsReplicaSyncA", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaSyncA", .signature = "\x00\x04\x09\x11\x80\x85\x11\x3d\x0f\x11\x0d\x09" } },
    .{ "DsReplicaSyncW", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaSyncW", .signature = "\x00\x04\x09\x11\x80\x85\x11\x05\x0f\x11\x0d\x09" } },
    .{ "DsReplicaAddA", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaAddA", .signature = "\x00\x07\x09\x11\x80\x85\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x0f\x11\xb0\x99\x09" } },
    .{ "DsReplicaAddW", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaAddW", .signature = "\x00\x07\x09\x11\x80\x85\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x11\xb0\x99\x09" } },
    .{ "DsReplicaDelA", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaDelA", .signature = "\x00\x04\x09\x11\x80\x85\x11\x3d\x11\x3d\x09" } },
    .{ "DsReplicaDelW", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaDelW", .signature = "\x00\x04\x09\x11\x80\x85\x11\x05\x11\x05\x09" } },
    .{ "DsReplicaModifyA", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaModifyA", .signature = "\x00\x09\x09\x11\x80\x85\x11\x3d\x0f\x11\x0d\x11\x3d\x11\x3d\x0f\x11\xb0\x99\x09\x09\x09" } },
    .{ "DsReplicaModifyW", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaModifyW", .signature = "\x00\x09\x09\x11\x80\x85\x11\x05\x0f\x11\x0d\x11\x05\x11\x05\x0f\x11\xb0\x99\x09\x09\x09" } },
    .{ "DsReplicaUpdateRefsA", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaUpdateRefsA", .signature = "\x00\x05\x09\x11\x80\x85\x11\x3d\x11\x3d\x0f\x11\x0d\x09" } },
    .{ "DsReplicaUpdateRefsW", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaUpdateRefsW", .signature = "\x00\x05\x09\x11\x80\x85\x11\x05\x11\x05\x0f\x11\x0d\x09" } },
    .{ "DsReplicaSyncAllA", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaSyncAllA", .signature = "\x00\x06\x09\x11\x80\x85\x11\x3d\x09\x18\x0f\x01\x0f\x0f\x0f\x11\xb0\x9d" } },
    .{ "DsReplicaSyncAllW", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaSyncAllW", .signature = "\x00\x06\x09\x11\x80\x85\x11\x05\x09\x18\x0f\x01\x0f\x0f\x0f\x11\xb0\xa1" } },
    .{ "DsRemoveDsServerW", MethodRecord{ .library = "NTDSAPI", .import = "DsRemoveDsServerW", .signature = "\x00\x05\x09\x11\x80\x85\x11\x05\x11\x05\x0f\x11\x59\x11\x59" } },
    .{ "DsRemoveDsServerA", MethodRecord{ .library = "NTDSAPI", .import = "DsRemoveDsServerA", .signature = "\x00\x05\x09\x11\x80\x85\x11\x3d\x11\x3d\x0f\x11\x59\x11\x59" } },
    .{ "DsRemoveDsDomainW", MethodRecord{ .library = "NTDSAPI", .import = "DsRemoveDsDomainW", .signature = "\x00\x02\x09\x11\x80\x85\x11\x05" } },
    .{ "DsRemoveDsDomainA", MethodRecord{ .library = "NTDSAPI", .import = "DsRemoveDsDomainA", .signature = "\x00\x02\x09\x11\x80\x85\x11\x3d" } },
    .{ "DsListSitesA", MethodRecord{ .library = "NTDSAPI", .import = "DsListSitesA", .signature = "\x00\x02\x09\x11\x80\x85\x0f\x0f\x11\xb0\x8d" } },
    .{ "DsListSitesW", MethodRecord{ .library = "NTDSAPI", .import = "DsListSitesW", .signature = "\x00\x02\x09\x11\x80\x85\x0f\x0f\x11\xb0\x89" } },
    .{ "DsListServersInSiteA", MethodRecord{ .library = "NTDSAPI", .import = "DsListServersInSiteA", .signature = "\x00\x03\x09\x11\x80\x85\x11\x3d\x0f\x0f\x11\xb0\x8d" } },
    .{ "DsListServersInSiteW", MethodRecord{ .library = "NTDSAPI", .import = "DsListServersInSiteW", .signature = "\x00\x03\x09\x11\x80\x85\x11\x05\x0f\x0f\x11\xb0\x89" } },
    .{ "DsListDomainsInSiteA", MethodRecord{ .library = "NTDSAPI", .import = "DsListDomainsInSiteA", .signature = "\x00\x03\x09\x11\x80\x85\x11\x3d\x0f\x0f\x11\xb0\x8d" } },
    .{ "DsListDomainsInSiteW", MethodRecord{ .library = "NTDSAPI", .import = "DsListDomainsInSiteW", .signature = "\x00\x03\x09\x11\x80\x85\x11\x05\x0f\x0f\x11\xb0\x89" } },
    .{ "DsListServersForDomainInSiteA", MethodRecord{ .library = "NTDSAPI", .import = "DsListServersForDomainInSiteA", .signature = "\x00\x04\x09\x11\x80\x85\x11\x3d\x11\x3d\x0f\x0f\x11\xb0\x8d" } },
    .{ "DsListServersForDomainInSiteW", MethodRecord{ .library = "NTDSAPI", .import = "DsListServersForDomainInSiteW", .signature = "\x00\x04\x09\x11\x80\x85\x11\x05\x11\x05\x0f\x0f\x11\xb0\x89" } },
    .{ "DsListInfoForServerA", MethodRecord{ .library = "NTDSAPI", .import = "DsListInfoForServerA", .signature = "\x00\x03\x09\x11\x80\x85\x11\x3d\x0f\x0f\x11\xb0\x8d" } },
    .{ "DsListInfoForServerW", MethodRecord{ .library = "NTDSAPI", .import = "DsListInfoForServerW", .signature = "\x00\x03\x09\x11\x80\x85\x11\x05\x0f\x0f\x11\xb0\x89" } },
    .{ "DsListRolesA", MethodRecord{ .library = "NTDSAPI", .import = "DsListRolesA", .signature = "\x00\x02\x09\x11\x80\x85\x0f\x0f\x11\xb0\x8d" } },
    .{ "DsListRolesW", MethodRecord{ .library = "NTDSAPI", .import = "DsListRolesW", .signature = "\x00\x02\x09\x11\x80\x85\x0f\x0f\x11\xb0\x89" } },
    .{ "DsQuerySitesByCostW", MethodRecord{ .library = "NTDSAPI", .import = "DsQuerySitesByCostW", .signature = "\x00\x06\x09\x11\x80\x85\x11\x05\x0f\x11\x05\x09\x09\x0f\x0f\x11\xb0\xa5" } },
    .{ "DsQuerySitesByCostA", MethodRecord{ .library = "NTDSAPI", .import = "DsQuerySitesByCostA", .signature = "\x00\x06\x09\x11\x80\x85\x11\x3d\x0f\x11\x3d\x09\x09\x0f\x0f\x11\xb0\xa5" } },
    .{ "DsQuerySitesFree", MethodRecord{ .library = "NTDSAPI", .import = "DsQuerySitesFree", .signature = "\x00\x01\x01\x0f\x11\xb0\xa5" } },
    .{ "DsMapSchemaGuidsA", MethodRecord{ .library = "NTDSAPI", .import = "DsMapSchemaGuidsA", .signature = "\x00\x04\x09\x11\x80\x85\x09\x0f\x11\x0d\x0f\x0f\x11\xb0\xa9" } },
    .{ "DsFreeSchemaGuidMapA", MethodRecord{ .library = "NTDSAPI", .import = "DsFreeSchemaGuidMapA", .signature = "\x00\x01\x01\x0f\x11\xb0\xa9" } },
    .{ "DsMapSchemaGuidsW", MethodRecord{ .library = "NTDSAPI", .import = "DsMapSchemaGuidsW", .signature = "\x00\x04\x09\x11\x80\x85\x09\x0f\x11\x0d\x0f\x0f\x11\xb0\xad" } },
    .{ "DsFreeSchemaGuidMapW", MethodRecord{ .library = "NTDSAPI", .import = "DsFreeSchemaGuidMapW", .signature = "\x00\x01\x01\x0f\x11\xb0\xad" } },
    .{ "DsGetDomainControllerInfoA", MethodRecord{ .library = "NTDSAPI", .import = "DsGetDomainControllerInfoA", .signature = "\x00\x05\x09\x11\x80\x85\x11\x3d\x09\x0f\x09\x0f\x0f\x01" } },
    .{ "DsGetDomainControllerInfoW", MethodRecord{ .library = "NTDSAPI", .import = "DsGetDomainControllerInfoW", .signature = "\x00\x05\x09\x11\x80\x85\x11\x05\x09\x0f\x09\x0f\x0f\x01" } },
    .{ "DsFreeDomainControllerInfoA", MethodRecord{ .library = "NTDSAPI", .import = "DsFreeDomainControllerInfoA", .signature = "\x00\x03\x01\x09\x09\x0f\x01" } },
    .{ "DsFreeDomainControllerInfoW", MethodRecord{ .library = "NTDSAPI", .import = "DsFreeDomainControllerInfoW", .signature = "\x00\x03\x01\x09\x09\x0f\x01" } },
    .{ "DsReplicaConsistencyCheck", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaConsistencyCheck", .signature = "\x00\x03\x09\x11\x80\x85\x11\xb0\xb1\x09" } },
    .{ "DsReplicaVerifyObjectsW", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaVerifyObjectsW", .signature = "\x00\x04\x09\x11\x80\x85\x11\x05\x0f\x11\x0d\x09" } },
    .{ "DsReplicaVerifyObjectsA", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaVerifyObjectsA", .signature = "\x00\x04\x09\x11\x80\x85\x11\x3d\x0f\x11\x0d\x09" } },
    .{ "DsReplicaGetInfoW", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaGetInfoW", .signature = "\x00\x05\x09\x11\x80\x85\x11\xb0\xb5\x11\x05\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "DsReplicaGetInfo2W", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaGetInfo2W", .signature = "\x00\x09\x09\x11\x80\x85\x11\xb0\xb5\x11\x05\x0f\x11\x0d\x11\x05\x11\x05\x09\x09\x0f\x0f\x01" } },
    .{ "DsReplicaFreeInfo", MethodRecord{ .library = "NTDSAPI", .import = "DsReplicaFreeInfo", .signature = "\x00\x02\x01\x11\xb0\xb5\x0f\x01" } },
    .{ "DsAddSidHistoryW", MethodRecord{ .library = "NTDSAPI", .import = "DsAddSidHistoryW", .signature = "\x00\x08\x09\x11\x80\x85\x09\x11\x05\x11\x05\x11\x05\x0f\x01\x11\x05\x11\x05" } },
    .{ "DsAddSidHistoryA", MethodRecord{ .library = "NTDSAPI", .import = "DsAddSidHistoryA", .signature = "\x00\x08\x09\x11\x80\x85\x09\x11\x3d\x11\x3d\x11\x3d\x0f\x01\x11\x3d\x11\x3d" } },
    .{ "DsInheritSecurityIdentityW", MethodRecord{ .library = "NTDSAPI", .import = "DsInheritSecurityIdentityW", .signature = "\x00\x04\x09\x11\x80\x85\x09\x11\x05\x11\x05" } },
    .{ "DsInheritSecurityIdentityA", MethodRecord{ .library = "NTDSAPI", .import = "DsInheritSecurityIdentityA", .signature = "\x00\x04\x09\x11\x80\x85\x09\x11\x3d\x11\x3d" } },
    .{ "DsRoleGetPrimaryDomainInformation", MethodRecord{ .library = "NETAPI32", .import = "DsRoleGetPrimaryDomainInformation", .signature = "\x00\x03\x09\x11\x05\x11\xb0\xb9\x0f\x0f\x05" } },
    .{ "DsRoleFreeMemory", MethodRecord{ .library = "NETAPI32", .import = "DsRoleFreeMemory", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "DsGetDcNameA", MethodRecord{ .library = "NETAPI32", .import = "DsGetDcNameA", .signature = "\x00\x06\x09\x11\x3d\x11\x3d\x0f\x11\x0d\x11\x3d\x09\x0f\x0f\x11\xb0\xbd" } },
    .{ "DsGetDcNameW", MethodRecord{ .library = "NETAPI32", .import = "DsGetDcNameW", .signature = "\x00\x06\x09\x11\x05\x11\x05\x0f\x11\x0d\x11\x05\x09\x0f\x0f\x11\xb0\xc1" } },
    .{ "DsGetSiteNameA", MethodRecord{ .library = "NETAPI32", .import = "DsGetSiteNameA", .signature = "\x00\x02\x09\x11\x3d\x0f\x11\x3d" } },
    .{ "DsGetSiteNameW", MethodRecord{ .library = "NETAPI32", .import = "DsGetSiteNameW", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x05" } },
    .{ "DsValidateSubnetNameW", MethodRecord{ .library = "NETAPI32", .import = "DsValidateSubnetNameW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "DsValidateSubnetNameA", MethodRecord{ .library = "NETAPI32", .import = "DsValidateSubnetNameA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "DsAddressToSiteNamesW", MethodRecord{ .library = "NETAPI32", .import = "DsAddressToSiteNamesW", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\xb0\xc5\x0f\x0f\x11\x05" } },
    .{ "DsAddressToSiteNamesA", MethodRecord{ .library = "NETAPI32", .import = "DsAddressToSiteNamesA", .signature = "\x00\x04\x09\x11\x3d\x09\x0f\x11\xb0\xc5\x0f\x0f\x11\x3d" } },
    .{ "DsAddressToSiteNamesExW", MethodRecord{ .library = "NETAPI32", .import = "DsAddressToSiteNamesExW", .signature = "\x00\x05\x09\x11\x05\x09\x0f\x11\xb0\xc5\x0f\x0f\x11\x05\x0f\x0f\x11\x05" } },
    .{ "DsAddressToSiteNamesExA", MethodRecord{ .library = "NETAPI32", .import = "DsAddressToSiteNamesExA", .signature = "\x00\x05\x09\x11\x3d\x09\x0f\x11\xb0\xc5\x0f\x0f\x11\x3d\x0f\x0f\x11\x3d" } },
    .{ "DsEnumerateDomainTrustsW", MethodRecord{ .library = "NETAPI32", .import = "DsEnumerateDomainTrustsW", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x0f\x11\xb0\xc9\x0f\x09" } },
    .{ "DsEnumerateDomainTrustsA", MethodRecord{ .library = "NETAPI32", .import = "DsEnumerateDomainTrustsA", .signature = "\x00\x04\x09\x11\x3d\x09\x0f\x0f\x11\xb0\xcd\x0f\x09" } },
    .{ "DsGetForestTrustInformationW", MethodRecord{ .library = "NETAPI32", .import = "DsGetForestTrustInformationW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x09\x0f\x0f\x11\x93\xad" } },
    .{ "DsMergeForestTrustInformationW", MethodRecord{ .library = "NETAPI32", .import = "DsMergeForestTrustInformationW", .signature = "\x00\x04\x09\x11\x05\x0f\x11\x93\xad\x0f\x11\x93\xad\x0f\x0f\x11\x93\xad" } },
    .{ "DsGetDcSiteCoverageW", MethodRecord{ .library = "NETAPI32", .import = "DsGetDcSiteCoverageW", .signature = "\x00\x03\x09\x11\x05\x0f\x09\x0f\x0f\x11\x05" } },
    .{ "DsGetDcSiteCoverageA", MethodRecord{ .library = "NETAPI32", .import = "DsGetDcSiteCoverageA", .signature = "\x00\x03\x09\x11\x3d\x0f\x09\x0f\x0f\x11\x3d" } },
    .{ "DsDeregisterDnsHostRecordsW", MethodRecord{ .library = "NETAPI32", .import = "DsDeregisterDnsHostRecordsW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x0f\x11\x0d\x0f\x11\x0d\x11\x05" } },
    .{ "DsDeregisterDnsHostRecordsA", MethodRecord{ .library = "NETAPI32", .import = "DsDeregisterDnsHostRecordsA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x0f\x11\x0d\x0f\x11\x0d\x11\x3d" } },
    .{ "DsGetDcOpenW", MethodRecord{ .library = "NETAPI32", .import = "DsGetDcOpenW", .signature = "\x00\x07\x09\x11\x05\x09\x11\x05\x0f\x11\x0d\x11\x05\x09\x0f\x11\x80\x85" } },
    .{ "DsGetDcOpenA", MethodRecord{ .library = "NETAPI32", .import = "DsGetDcOpenA", .signature = "\x00\x07\x09\x11\x3d\x09\x11\x3d\x0f\x11\x0d\x11\x3d\x09\x0f\x11\x80\x85" } },
    .{ "DsGetDcNextW", MethodRecord{ .library = "NETAPI32", .import = "DsGetDcNextW", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x09\x0f\x0f\x11\xb0\xc5\x0f\x11\x05" } },
    .{ "DsGetDcNextA", MethodRecord{ .library = "NETAPI32", .import = "DsGetDcNextA", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x09\x0f\x0f\x11\xb0\xc5\x0f\x11\x3d" } },
    .{ "DsGetDcCloseW", MethodRecord{ .library = "NETAPI32", .import = "DsGetDcCloseW", .signature = "\x00\x01\x01\x11\x80\x85" } },
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
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x355 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HICON" },
        0x13ad => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.Identity", .name = "LSA_FOREST_TRUST_INFORMATION" },
        0x1489 => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "VARIANT" },
        0x19ad => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IDataObject" },
        0x3059 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "IADsContainer" },
        0x305d => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "IEnumVARIANT" },
        0x3061 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "ADS_AUTHENTICATION_ENUM" },
        0x3065 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "ADSVALUE" },
        0x3069 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DSBROWSEINFOW" },
        0x306d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DSBROWSEINFOA" },
        0x3071 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "ADSPROPINITPARAMS" },
        0x3075 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "ADS_ATTR_INFO" },
        0x3079 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "ADSPROPERROR" },
        0x307d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_MANGLE_FOR" },
        0x3081 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_NAME_FLAGS" },
        0x3085 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_NAME_FORMAT" },
        0x3089 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_NAME_RESULTW" },
        0x308d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_NAME_RESULTA" },
        0x3091 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_SPN_NAME_TYPE" },
        0x3095 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_SPN_WRITE_OP" },
        0x3099 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "SCHEDULE" },
        0x309d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_REPSYNCALL_ERRINFOA" },
        0x30a1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_REPSYNCALL_ERRINFOW" },
        0x30a5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_SITE_COST_INFO" },
        0x30a9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_SCHEMA_GUID_MAPA" },
        0x30ad => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_SCHEMA_GUID_MAPW" },
        0x30b1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_KCC_TASKID" },
        0x30b5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_REPL_INFO_TYPE" },
        0x30b9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DSROLE_PRIMARY_DOMAIN_INFO_LEVEL" },
        0x30bd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DOMAIN_CONTROLLER_INFOA" },
        0x30c1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DOMAIN_CONTROLLER_INFOW" },
        0x30c5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKET_ADDRESS" },
        0x30c9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_DOMAIN_TRUSTSW" },
        0x30cd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.ActiveDirectory", .name = "DS_DOMAIN_TRUSTSA" },
        else => null,
    };
}

pub const WM_ADSPROP_NOTIFY_PAGEINIT = 2125;
pub const WM_ADSPROP_NOTIFY_PAGEHWND = 2126;
pub const WM_ADSPROP_NOTIFY_CHANGE = 2127;
pub const WM_ADSPROP_NOTIFY_APPLY = 2128;
pub const WM_ADSPROP_NOTIFY_SETFOCUS = 2129;
pub const WM_ADSPROP_NOTIFY_FOREGROUND = 2130;
pub const WM_ADSPROP_NOTIFY_EXIT = 2131;
pub const WM_ADSPROP_NOTIFY_ERROR = 2134;
pub const QUERYFORM_CHANGESFORMLIST = 1;
pub const QUERYFORM_CHANGESOPTFORMLIST = 2;
pub const CQFF_NOGLOBALPAGES = 1;
pub const CQFF_ISOPTIONAL = 2;
pub const CQPM_INITIALIZE = 1;
pub const CQPM_RELEASE = 2;
pub const CQPM_ENABLE = 3;
pub const CQPM_GETPARAMETERS = 5;
pub const CQPM_CLEARFORM = 6;
pub const CQPM_PERSIST = 7;
pub const CQPM_HELP = 8;
pub const CQPM_SETDEFAULTPARAMETERS = 9;
pub const CQPM_HANDLERSPECIFIC = 268435456;
pub const OQWF_OKCANCEL = 1;
pub const OQWF_DEFAULTFORM = 2;
pub const OQWF_SINGLESELECT = 4;
pub const OQWF_LOADQUERY = 8;
pub const OQWF_REMOVESCOPES = 16;
pub const OQWF_REMOVEFORMS = 32;
pub const OQWF_ISSUEONOPEN = 64;
pub const OQWF_SHOWOPTIONAL = 128;
pub const OQWF_SAVEQUERYONOK = 512;
pub const OQWF_HIDEMENUS = 1024;
pub const OQWF_HIDESEARCHUI = 2048;
pub const OQWF_PARAMISPROPERTYBAG = 2147483648;
pub const DSA_NEWOBJ_CTX_PRECOMMIT = 1;
pub const DSA_NEWOBJ_CTX_COMMIT = 2;
pub const DSA_NEWOBJ_CTX_POSTCOMMIT = 3;
pub const DSA_NEWOBJ_CTX_CLEANUP = 4;
pub const DSA_NOTIFY_DEL = 1;
pub const DSA_NOTIFY_REN = 2;
pub const DSA_NOTIFY_MOV = 4;
pub const DSA_NOTIFY_PROP = 8;
pub const DSA_NOTIFY_FLAG_ADDITIONAL_DATA = 2;
pub const DSA_NOTIFY_FLAG_FORCE_ADDITIONAL_DATA = 1;
pub const DSOBJECT_ISCONTAINER = 1;
pub const DSOBJECT_READONLYPAGES = 2147483648;
pub const DSPROVIDER_UNUSED_0 = 1;
pub const DSPROVIDER_UNUSED_1 = 2;
pub const DSPROVIDER_UNUSED_2 = 4;
pub const DSPROVIDER_UNUSED_3 = 8;
pub const DSPROVIDER_ADVANCED = 16;
pub const DSPROVIDER_AD_LDS = 32;
pub const DSDSOF_HASUSERANDSERVERINFO = 1;
pub const DSDSOF_SIMPLEAUTHENTICATE = 2;
pub const DSDSOF_DONTSIGNSEAL = 4;
pub const DSDSOF_DSAVAILABLE = 1073741824;
pub const DBDTF_RETURNFQDN = 1;
pub const DBDTF_RETURNMIXEDDOMAINS = 2;
pub const DBDTF_RETURNEXTERNAL = 4;
pub const DBDTF_RETURNINBOUND = 8;
pub const DBDTF_RETURNINOUTBOUND = 16;
pub const DSSSF_SIMPLEAUTHENTICATE = 1;
pub const DSSSF_DONTSIGNSEAL = 2;
pub const DSSSF_DSAVAILABLE = 2147483648;
pub const DSGIF_ISNORMAL = 0;
pub const DSGIF_ISOPEN = 1;
pub const DSGIF_ISDISABLED = 2;
pub const DSGIF_ISMASK = 15;
pub const DSGIF_GETDEFAULTICON = 16;
pub const DSGIF_DEFAULTISCONTAINER = 32;
pub const DSICCF_IGNORETREATASLEAF = 1;
pub const DSECAF_NOTLISTED = 1;
pub const DSCCIF_HASWIZARDDIALOG = 1;
pub const DSCCIF_HASWIZARDPRIMARYPAGE = 2;
pub const DSBI_NOBUTTONS = 1;
pub const DSBI_NOLINES = 2;
pub const DSBI_NOLINESATROOT = 4;
pub const DSBI_CHECKBOXES = 256;
pub const DSBI_NOROOT = 65536;
pub const DSBI_INCLUDEHIDDEN = 131072;
pub const DSBI_EXPANDONOPEN = 262144;
pub const DSBI_ENTIREDIRECTORY = 589824;
pub const DSBI_RETURN_FORMAT = 1048576;
pub const DSBI_HASCREDENTIALS = 2097152;
pub const DSBI_IGNORETREATASLEAF = 4194304;
pub const DSBI_SIMPLEAUTHENTICATE = 8388608;
pub const DSBI_RETURNOBJECTCLASS = 16777216;
pub const DSBI_DONTSIGNSEAL = 33554432;
pub const DSB_MAX_DISPLAYNAME_CHARS = 64;
pub const DSBF_STATE = 1;
pub const DSBF_ICONLOCATION = 2;
pub const DSBF_DISPLAYNAME = 4;
pub const DSBS_CHECKED = 1;
pub const DSBS_HIDDEN = 2;
pub const DSBS_ROOT = 4;
pub const DSBM_QUERYINSERTW = 100;
pub const DSBM_QUERYINSERTA = 101;
pub const DSBM_QUERYINSERT = 100;
pub const DSBM_CHANGEIMAGESTATE = 102;
pub const DSBM_HELP = 103;
pub const DSBM_CONTEXTMENU = 104;
pub const DSBID_BANNER = 256;
pub const DSBID_CONTAINERLIST = 257;
pub const DS_FORCE_REDISCOVERY = 1;
pub const DS_DIRECTORY_SERVICE_REQUIRED = 16;
pub const DS_DIRECTORY_SERVICE_PREFERRED = 32;
pub const DS_GC_SERVER_REQUIRED = 64;
pub const DS_PDC_REQUIRED = 128;
pub const DS_BACKGROUND_ONLY = 256;
pub const DS_IP_REQUIRED = 512;
pub const DS_KDC_REQUIRED = 1024;
pub const DS_TIMESERV_REQUIRED = 2048;
pub const DS_WRITABLE_REQUIRED = 4096;
pub const DS_GOOD_TIMESERV_PREFERRED = 8192;
pub const DS_AVOID_SELF = 16384;
pub const DS_ONLY_LDAP_NEEDED = 32768;
pub const DS_IS_FLAT_NAME = 65536;
pub const DS_IS_DNS_NAME = 131072;
pub const DS_TRY_NEXTCLOSEST_SITE = 262144;
pub const DS_DIRECTORY_SERVICE_6_REQUIRED = 524288;
pub const DS_WEB_SERVICE_REQUIRED = 1048576;
pub const DS_DIRECTORY_SERVICE_8_REQUIRED = 2097152;
pub const DS_DIRECTORY_SERVICE_9_REQUIRED = 4194304;
pub const DS_DIRECTORY_SERVICE_10_REQUIRED = 8388608;
pub const DS_KEY_LIST_SUPPORT_REQUIRED = 16777216;
pub const DS_DIRECTORY_SERVICE_13_REQUIRED = 33554432;
pub const DS_RETURN_DNS_NAME = 1073741824;
pub const DS_RETURN_FLAT_NAME = 2147483648;
pub const DS_PDC_FLAG = 1;
pub const DS_GC_FLAG = 4;
pub const DS_LDAP_FLAG = 8;
pub const DS_DS_FLAG = 16;
pub const DS_KDC_FLAG = 32;
pub const DS_TIMESERV_FLAG = 64;
pub const DS_CLOSEST_FLAG = 128;
pub const DS_WRITABLE_FLAG = 256;
pub const DS_GOOD_TIMESERV_FLAG = 512;
pub const DS_NDNC_FLAG = 1024;
pub const DS_SELECT_SECRET_DOMAIN_6_FLAG = 2048;
pub const DS_FULL_SECRET_DOMAIN_6_FLAG = 4096;
pub const DS_WS_FLAG = 8192;
pub const DS_DS_8_FLAG = 16384;
pub const DS_DS_9_FLAG = 32768;
pub const DS_DS_10_FLAG = 65536;
pub const DS_KEY_LIST_FLAG = 131072;
pub const DS_DS_13_FLAG = 262144;
pub const DS_PING_FLAGS = 1048575;
pub const DS_DNS_CONTROLLER_FLAG = 536870912;
pub const DS_DNS_DOMAIN_FLAG = 1073741824;
pub const DS_DNS_FOREST_FLAG = 2147483648;
pub const DS_DOMAIN_IN_FOREST = 1;
pub const DS_DOMAIN_DIRECT_OUTBOUND = 2;
pub const DS_DOMAIN_TREE_ROOT = 4;
pub const DS_DOMAIN_PRIMARY = 8;
pub const DS_DOMAIN_NATIVE_MODE = 16;
pub const DS_DOMAIN_DIRECT_INBOUND = 32;
pub const DS_GFTI_UPDATE_TDO = 1;
pub const DS_GFTI_VALID_FLAGS = 1;
pub const DS_ONLY_DO_SITE_NAME = 1;
pub const DS_NOTIFY_AFTER_SITE_RECORDS = 2;
pub const DSQPF_NOSAVE = 1;
pub const DSQPF_SAVELOCATION = 2;
pub const DSQPF_SHOWHIDDENOBJECTS = 4;
pub const DSQPF_ENABLEADMINFEATURES = 8;
pub const DSQPF_ENABLEADVANCEDFEATURES = 16;
pub const DSQPF_HASCREDENTIALS = 32;
pub const DSQPF_NOCHOOSECOLUMNS = 64;
pub const DSQPM_GETCLASSLIST = 268435456;
pub const DSQPM_HELPTOPICS = 268435457;
pub const DSROLE_PRIMARY_DS_RUNNING = 1;
pub const DSROLE_PRIMARY_DS_MIXED_MODE = 2;
pub const DSROLE_UPGRADE_IN_PROGRESS = 4;
pub const DSROLE_PRIMARY_DS_READONLY = 8;
pub const DSROLE_PRIMARY_DOMAIN_GUID_PRESENT = 16777216;
pub const ADS_ATTR_CLEAR = 1;
pub const ADS_ATTR_UPDATE = 2;
pub const ADS_ATTR_APPEND = 3;
pub const ADS_ATTR_DELETE = 4;
pub const ADS_EXT_MINEXTDISPID = 1;
pub const ADS_EXT_MAXEXTDISPID = 16777215;
pub const ADS_EXT_INITCREDENTIALS = 1;
pub const ADS_EXT_INITIALIZE_COMPLETE = 2;
pub const DS_BEHAVIOR_WIN2000 = 0;
pub const DS_BEHAVIOR_WIN2003_WITH_MIXED_DOMAINS = 1;
pub const DS_BEHAVIOR_WIN2003 = 2;
pub const DS_BEHAVIOR_WIN2008 = 3;
pub const DS_BEHAVIOR_WIN2008R2 = 4;
pub const DS_BEHAVIOR_WIN2012 = 5;
pub const DS_BEHAVIOR_WIN2012R2 = 6;
pub const DS_BEHAVIOR_WIN2016 = 7;
pub const DS_BEHAVIOR_WIN2025 = 10;
pub const DS_BEHAVIOR_LONGHORN = 3;
pub const DS_BEHAVIOR_WIN7 = 4;
pub const DS_BEHAVIOR_WIN8 = 5;
pub const DS_BEHAVIOR_WINBLUE = 6;
pub const DS_BEHAVIOR_WINTHRESHOLD = 7;
pub const ACTRL_DS_OPEN = 0;
pub const ACTRL_DS_CREATE_CHILD = 1;
pub const ACTRL_DS_DELETE_CHILD = 2;
pub const ACTRL_DS_LIST = 4;
pub const ACTRL_DS_SELF = 8;
pub const ACTRL_DS_READ_PROP = 16;
pub const ACTRL_DS_WRITE_PROP = 32;
pub const ACTRL_DS_DELETE_TREE = 64;
pub const ACTRL_DS_LIST_OBJECT = 128;
pub const ACTRL_DS_CONTROL_ACCESS = 256;
pub const NTDSAPI_BIND_ALLOW_DELEGATION = 1;
pub const NTDSAPI_BIND_FIND_BINDING = 2;
pub const NTDSAPI_BIND_FORCE_KERBEROS = 4;
pub const DS_REPSYNC_ASYNCHRONOUS_OPERATION = 1;
pub const DS_REPSYNC_WRITEABLE = 2;
pub const DS_REPSYNC_PERIODIC = 4;
pub const DS_REPSYNC_INTERSITE_MESSAGING = 8;
pub const DS_REPSYNC_FULL = 32;
pub const DS_REPSYNC_URGENT = 64;
pub const DS_REPSYNC_NO_DISCARD = 128;
pub const DS_REPSYNC_FORCE = 256;
pub const DS_REPSYNC_ADD_REFERENCE = 512;
pub const DS_REPSYNC_NEVER_COMPLETED = 1024;
pub const DS_REPSYNC_TWO_WAY = 2048;
pub const DS_REPSYNC_NEVER_NOTIFY = 4096;
pub const DS_REPSYNC_INITIAL = 8192;
pub const DS_REPSYNC_USE_COMPRESSION = 16384;
pub const DS_REPSYNC_ABANDONED = 32768;
pub const DS_REPSYNC_SELECT_SECRETS = 32768;
pub const DS_REPSYNC_INITIAL_IN_PROGRESS = 65536;
pub const DS_REPSYNC_PARTIAL_ATTRIBUTE_SET = 131072;
pub const DS_REPSYNC_REQUEUE = 262144;
pub const DS_REPSYNC_NOTIFICATION = 524288;
pub const DS_REPSYNC_ASYNCHRONOUS_REPLICA = 1048576;
pub const DS_REPSYNC_CRITICAL = 2097152;
pub const DS_REPSYNC_FULL_IN_PROGRESS = 4194304;
pub const DS_REPSYNC_PREEMPTED = 8388608;
pub const DS_REPSYNC_NONGC_RO_REPLICA = 16777216;
pub const DS_REPADD_ASYNCHRONOUS_OPERATION = 1;
pub const DS_REPADD_WRITEABLE = 2;
pub const DS_REPADD_INITIAL = 4;
pub const DS_REPADD_PERIODIC = 8;
pub const DS_REPADD_INTERSITE_MESSAGING = 16;
pub const DS_REPADD_ASYNCHRONOUS_REPLICA = 32;
pub const DS_REPADD_DISABLE_NOTIFICATION = 64;
pub const DS_REPADD_DISABLE_PERIODIC = 128;
pub const DS_REPADD_USE_COMPRESSION = 256;
pub const DS_REPADD_NEVER_NOTIFY = 512;
pub const DS_REPADD_TWO_WAY = 1024;
pub const DS_REPADD_CRITICAL = 2048;
pub const DS_REPADD_SELECT_SECRETS = 4096;
pub const DS_REPADD_NONGC_RO_REPLICA = 16777216;
pub const DS_REPDEL_ASYNCHRONOUS_OPERATION = 1;
pub const DS_REPDEL_WRITEABLE = 2;
pub const DS_REPDEL_INTERSITE_MESSAGING = 4;
pub const DS_REPDEL_IGNORE_ERRORS = 8;
pub const DS_REPDEL_LOCAL_ONLY = 16;
pub const DS_REPDEL_NO_SOURCE = 32;
pub const DS_REPDEL_REF_OK = 64;
pub const DS_REPMOD_ASYNCHRONOUS_OPERATION = 1;
pub const DS_REPMOD_WRITEABLE = 2;
pub const DS_REPMOD_UPDATE_FLAGS = 1;
pub const DS_REPMOD_UPDATE_INSTANCE = 2;
pub const DS_REPMOD_UPDATE_ADDRESS = 2;
pub const DS_REPMOD_UPDATE_SCHEDULE = 4;
pub const DS_REPMOD_UPDATE_RESULT = 8;
pub const DS_REPMOD_UPDATE_TRANSPORT = 16;
pub const DS_REPUPD_ASYNCHRONOUS_OPERATION = 1;
pub const DS_REPUPD_WRITEABLE = 2;
pub const DS_REPUPD_ADD_REFERENCE = 4;
pub const DS_REPUPD_DELETE_REFERENCE = 8;
pub const DS_REPUPD_REFERENCE_GCSPN = 16;
pub const DS_INSTANCETYPE_IS_NC_HEAD = 1;
pub const DS_INSTANCETYPE_NC_IS_WRITEABLE = 4;
pub const DS_INSTANCETYPE_NC_COMING = 16;
pub const DS_INSTANCETYPE_NC_GOING = 32;
pub const NTDSDSA_OPT_IS_GC = 1;
pub const NTDSDSA_OPT_DISABLE_INBOUND_REPL = 2;
pub const NTDSDSA_OPT_DISABLE_OUTBOUND_REPL = 4;
pub const NTDSDSA_OPT_DISABLE_NTDSCONN_XLATE = 8;
pub const NTDSDSA_OPT_DISABLE_SPN_REGISTRATION = 16;
pub const NTDSDSA_OPT_GENERATE_OWN_TOPO = 32;
pub const NTDSDSA_OPT_BLOCK_RPC = 64;
pub const NTDSCONN_OPT_IS_GENERATED = 1;
pub const NTDSCONN_OPT_TWOWAY_SYNC = 2;
pub const NTDSCONN_OPT_OVERRIDE_NOTIFY_DEFAULT = 4;
pub const NTDSCONN_OPT_USE_NOTIFY = 8;
pub const NTDSCONN_OPT_DISABLE_INTERSITE_COMPRESSION = 16;
pub const NTDSCONN_OPT_USER_OWNED_SCHEDULE = 32;
pub const NTDSCONN_OPT_RODC_TOPOLOGY = 64;
pub const NTDSCONN_KCC_NO_REASON = 0;
pub const NTDSCONN_KCC_GC_TOPOLOGY = 1;
pub const NTDSCONN_KCC_RING_TOPOLOGY = 2;
pub const NTDSCONN_KCC_MINIMIZE_HOPS_TOPOLOGY = 4;
pub const NTDSCONN_KCC_STALE_SERVERS_TOPOLOGY = 8;
pub const NTDSCONN_KCC_OSCILLATING_CONNECTION_TOPOLOGY = 16;
pub const NTDSCONN_KCC_INTERSITE_GC_TOPOLOGY = 32;
pub const NTDSCONN_KCC_INTERSITE_TOPOLOGY = 64;
pub const NTDSCONN_KCC_SERVER_FAILOVER_TOPOLOGY = 128;
pub const NTDSCONN_KCC_SITE_FAILOVER_TOPOLOGY = 256;
pub const NTDSCONN_KCC_REDUNDANT_SERVER_TOPOLOGY = 512;
pub const FRSCONN_PRIORITY_MASK = 1879048192;
pub const FRSCONN_MAX_PRIORITY = 8;
pub const NTDSCONN_OPT_IGNORE_SCHEDULE_MASK = 2147483648;
pub const NTDSSETTINGS_OPT_IS_AUTO_TOPOLOGY_DISABLED = 1;
pub const NTDSSETTINGS_OPT_IS_TOPL_CLEANUP_DISABLED = 2;
pub const NTDSSETTINGS_OPT_IS_TOPL_MIN_HOPS_DISABLED = 4;
pub const NTDSSETTINGS_OPT_IS_TOPL_DETECT_STALE_DISABLED = 8;
pub const NTDSSETTINGS_OPT_IS_INTER_SITE_AUTO_TOPOLOGY_DISABLED = 16;
pub const NTDSSETTINGS_OPT_IS_GROUP_CACHING_ENABLED = 32;
pub const NTDSSETTINGS_OPT_FORCE_KCC_WHISTLER_BEHAVIOR = 64;
pub const NTDSSETTINGS_OPT_FORCE_KCC_W2K_ELECTION = 128;
pub const NTDSSETTINGS_OPT_IS_RAND_BH_SELECTION_DISABLED = 256;
pub const NTDSSETTINGS_OPT_IS_SCHEDULE_HASHING_ENABLED = 512;
pub const NTDSSETTINGS_OPT_IS_REDUNDANT_SERVER_TOPOLOGY_ENABLED = 1024;
pub const NTDSSETTINGS_OPT_W2K3_IGNORE_SCHEDULES = 2048;
pub const NTDSSETTINGS_OPT_W2K3_BRIDGES_REQUIRED = 4096;
pub const NTDSSETTINGS_DEFAULT_SERVER_REDUNDANCY = 2;
pub const NTDSTRANSPORT_OPT_IGNORE_SCHEDULES = 1;
pub const NTDSTRANSPORT_OPT_BRIDGES_REQUIRED = 2;
pub const NTDSSITECONN_OPT_USE_NOTIFY = 1;
pub const NTDSSITECONN_OPT_TWOWAY_SYNC = 2;
pub const NTDSSITECONN_OPT_DISABLE_COMPRESSION = 4;
pub const NTDSSITELINK_OPT_USE_NOTIFY = 1;
pub const NTDSSITELINK_OPT_TWOWAY_SYNC = 2;
pub const NTDSSITELINK_OPT_DISABLE_COMPRESSION = 4;
pub const DS_REPSYNCALL_NO_OPTIONS = 0;
pub const DS_REPSYNCALL_ABORT_IF_SERVER_UNAVAILABLE = 1;
pub const DS_REPSYNCALL_SYNC_ADJACENT_SERVERS_ONLY = 2;
pub const DS_REPSYNCALL_ID_SERVERS_BY_DN = 4;
pub const DS_REPSYNCALL_DO_NOT_SYNC = 8;
pub const DS_REPSYNCALL_SKIP_INITIAL_CHECK = 16;
pub const DS_REPSYNCALL_PUSH_CHANGES_OUTWARD = 32;
pub const DS_REPSYNCALL_CROSS_SITE_BOUNDARIES = 64;
pub const DS_LIST_DSA_OBJECT_FOR_SERVER = 0;
pub const DS_LIST_DNS_HOST_NAME_FOR_SERVER = 1;
pub const DS_LIST_ACCOUNT_OBJECT_FOR_SERVER = 2;
pub const DS_ROLE_SCHEMA_OWNER = 0;
pub const DS_ROLE_DOMAIN_OWNER = 1;
pub const DS_ROLE_PDC_OWNER = 2;
pub const DS_ROLE_RID_OWNER = 3;
pub const DS_ROLE_INFRASTRUCTURE_OWNER = 4;
pub const DS_SCHEMA_GUID_NOT_FOUND = 0;
pub const DS_SCHEMA_GUID_ATTR = 1;
pub const DS_SCHEMA_GUID_ATTR_SET = 2;
pub const DS_SCHEMA_GUID_CLASS = 3;
pub const DS_SCHEMA_GUID_CONTROL_RIGHT = 4;
pub const DS_KCC_FLAG_ASYNC_OP = 1;
pub const DS_KCC_FLAG_DAMPED = 2;
pub const DS_EXIST_ADVISORY_MODE = 1;
pub const DS_REPL_INFO_FLAG_IMPROVE_LINKED_ATTRS = 1;
pub const DS_REPL_NBR_WRITEABLE = 16;
pub const DS_REPL_NBR_SYNC_ON_STARTUP = 32;
pub const DS_REPL_NBR_DO_SCHEDULED_SYNCS = 64;
pub const DS_REPL_NBR_USE_ASYNC_INTERSITE_TRANSPORT = 128;
pub const DS_REPL_NBR_TWO_WAY_SYNC = 512;
pub const DS_REPL_NBR_NONGC_RO_REPLICA = 1024;
pub const DS_REPL_NBR_RETURN_OBJECT_PARENTS = 2048;
pub const DS_REPL_NBR_SELECT_SECRETS = 4096;
pub const DS_REPL_NBR_FULL_SYNC_IN_PROGRESS = 65536;
pub const DS_REPL_NBR_FULL_SYNC_NEXT_PACKET = 131072;
pub const DS_REPL_NBR_GCSPN = 1048576;
pub const DS_REPL_NBR_NEVER_SYNCED = 2097152;
pub const DS_REPL_NBR_PREEMPTED = 16777216;
pub const DS_REPL_NBR_IGNORE_CHANGE_NOTIFICATIONS = 67108864;
pub const DS_REPL_NBR_DISABLE_SCHEDULED_SYNC = 134217728;
pub const DS_REPL_NBR_COMPRESS_CHANGES = 268435456;
pub const DS_REPL_NBR_NO_CHANGE_NOTIFICATIONS = 536870912;
pub const DS_REPL_NBR_PARTIAL_ATTRIBUTE_SET = 1073741824;
pub const ADAM_REPL_AUTHENTICATION_MODE_NEGOTIATE_PASS_THROUGH = 0;
pub const ADAM_REPL_AUTHENTICATION_MODE_NEGOTIATE = 1;
pub const ADAM_REPL_AUTHENTICATION_MODE_MUTUAL_AUTH_REQUIRED = 2;
pub const FLAG_FOREST_OPTIONAL_FEATURE = 1;
pub const FLAG_DOMAIN_OPTIONAL_FEATURE = 2;
pub const FLAG_DISABLABLE_OPTIONAL_FEATURE = 4;
pub const FLAG_SERVER_OPTIONAL_FEATURE = 8;
pub const DSOP_SCOPE_TYPE_TARGET_COMPUTER = 1;
pub const DSOP_SCOPE_TYPE_UPLEVEL_JOINED_DOMAIN = 2;
pub const DSOP_SCOPE_TYPE_DOWNLEVEL_JOINED_DOMAIN = 4;
pub const DSOP_SCOPE_TYPE_ENTERPRISE_DOMAIN = 8;
pub const DSOP_SCOPE_TYPE_GLOBAL_CATALOG = 16;
pub const DSOP_SCOPE_TYPE_EXTERNAL_UPLEVEL_DOMAIN = 32;
pub const DSOP_SCOPE_TYPE_EXTERNAL_DOWNLEVEL_DOMAIN = 64;
pub const DSOP_SCOPE_TYPE_WORKGROUP = 128;
pub const DSOP_SCOPE_TYPE_USER_ENTERED_UPLEVEL_SCOPE = 256;
pub const DSOP_SCOPE_TYPE_USER_ENTERED_DOWNLEVEL_SCOPE = 512;
pub const DSOP_SCOPE_FLAG_STARTING_SCOPE = 1;
pub const DSOP_SCOPE_FLAG_WANT_PROVIDER_WINNT = 2;
pub const DSOP_SCOPE_FLAG_WANT_PROVIDER_LDAP = 4;
pub const DSOP_SCOPE_FLAG_WANT_PROVIDER_GC = 8;
pub const DSOP_SCOPE_FLAG_WANT_SID_PATH = 16;
pub const DSOP_SCOPE_FLAG_WANT_DOWNLEVEL_BUILTIN_PATH = 32;
pub const DSOP_SCOPE_FLAG_DEFAULT_FILTER_USERS = 64;
pub const DSOP_SCOPE_FLAG_DEFAULT_FILTER_GROUPS = 128;
pub const DSOP_SCOPE_FLAG_DEFAULT_FILTER_COMPUTERS = 256;
pub const DSOP_SCOPE_FLAG_DEFAULT_FILTER_CONTACTS = 512;
pub const DSOP_SCOPE_FLAG_DEFAULT_FILTER_SERVICE_ACCOUNTS = 1024;
pub const DSOP_SCOPE_FLAG_DEFAULT_FILTER_PASSWORDSETTINGS_OBJECTS = 2048;
pub const DSOP_FILTER_INCLUDE_ADVANCED_VIEW = 1;
pub const DSOP_FILTER_USERS = 2;
pub const DSOP_FILTER_BUILTIN_GROUPS = 4;
pub const DSOP_FILTER_WELL_KNOWN_PRINCIPALS = 8;
pub const DSOP_FILTER_UNIVERSAL_GROUPS_DL = 16;
pub const DSOP_FILTER_UNIVERSAL_GROUPS_SE = 32;
pub const DSOP_FILTER_GLOBAL_GROUPS_DL = 64;
pub const DSOP_FILTER_GLOBAL_GROUPS_SE = 128;
pub const DSOP_FILTER_DOMAIN_LOCAL_GROUPS_DL = 256;
pub const DSOP_FILTER_DOMAIN_LOCAL_GROUPS_SE = 512;
pub const DSOP_FILTER_CONTACTS = 1024;
pub const DSOP_FILTER_COMPUTERS = 2048;
pub const DSOP_FILTER_SERVICE_ACCOUNTS = 4096;
pub const DSOP_FILTER_PASSWORDSETTINGS_OBJECTS = 8192;
pub const DSOP_DOWNLEVEL_FILTER_USERS = 2147483649;
pub const DSOP_DOWNLEVEL_FILTER_LOCAL_GROUPS = 2147483650;
pub const DSOP_DOWNLEVEL_FILTER_GLOBAL_GROUPS = 2147483652;
pub const DSOP_DOWNLEVEL_FILTER_COMPUTERS = 2147483656;
pub const DSOP_DOWNLEVEL_FILTER_WORLD = 2147483664;
pub const DSOP_DOWNLEVEL_FILTER_AUTHENTICATED_USER = 2147483680;
pub const DSOP_DOWNLEVEL_FILTER_ANONYMOUS = 2147483712;
pub const DSOP_DOWNLEVEL_FILTER_BATCH = 2147483776;
pub const DSOP_DOWNLEVEL_FILTER_CREATOR_OWNER = 2147483904;
pub const DSOP_DOWNLEVEL_FILTER_CREATOR_GROUP = 2147484160;
pub const DSOP_DOWNLEVEL_FILTER_DIALUP = 2147484672;
pub const DSOP_DOWNLEVEL_FILTER_INTERACTIVE = 2147485696;
pub const DSOP_DOWNLEVEL_FILTER_NETWORK = 2147487744;
pub const DSOP_DOWNLEVEL_FILTER_SERVICE = 2147491840;
pub const DSOP_DOWNLEVEL_FILTER_SYSTEM = 2147500032;
pub const DSOP_DOWNLEVEL_FILTER_EXCLUDE_BUILTIN_GROUPS = 2147516416;
pub const DSOP_DOWNLEVEL_FILTER_TERMINAL_SERVER = 2147549184;
pub const DSOP_DOWNLEVEL_FILTER_ALL_WELLKNOWN_SIDS = 2147614720;
pub const DSOP_DOWNLEVEL_FILTER_LOCAL_SERVICE = 2147745792;
pub const DSOP_DOWNLEVEL_FILTER_NETWORK_SERVICE = 2148007936;
pub const DSOP_DOWNLEVEL_FILTER_REMOTE_LOGON = 2148532224;
pub const DSOP_DOWNLEVEL_FILTER_INTERNET_USER = 2149580800;
pub const DSOP_DOWNLEVEL_FILTER_OWNER_RIGHTS = 2151677952;
pub const DSOP_DOWNLEVEL_FILTER_SERVICES = 2155872256;
pub const DSOP_DOWNLEVEL_FILTER_LOCAL_LOGON = 2164260864;
pub const DSOP_DOWNLEVEL_FILTER_THIS_ORG_CERT = 2181038080;
pub const DSOP_DOWNLEVEL_FILTER_IIS_APP_POOL = 2214592512;
pub const DSOP_DOWNLEVEL_FILTER_ALL_APP_PACKAGES = 2281701376;
pub const DSOP_DOWNLEVEL_FILTER_LOCAL_ACCOUNTS = 2415919104;
pub const DSOP_FLAG_MULTISELECT = 1;
pub const DSOP_FLAG_SKIP_TARGET_COMPUTER_DC_CHECK = 2;
pub const SCHEDULE_INTERVAL = 0;
pub const SCHEDULE_BANDWIDTH = 1;
pub const SCHEDULE_PRIORITY = 2;
pub const FACILITY_NTDSB = 2048;
pub const FACILITY_BACKUP = 2047;
pub const FACILITY_SYSTEM = 0;
pub const hrNone = 0;
pub const hrNyi = -1073741823;
pub const hrInvalidParam = -939589631;
pub const hrError = -939589630;
pub const hrInvalidHandle = -939589629;
pub const hrRestoreInProgress = -939589628;
pub const hrAlreadyOpen = -939589627;
pub const hrInvalidRecips = -939589626;
pub const hrCouldNotConnect = -939589625;
pub const hrRestoreMapExists = -939589624;
pub const hrIncrementalBackupDisabled = -939589623;
pub const hrLogFileNotFound = -939589622;
pub const hrCircularLogging = -939589621;
pub const hrNoFullRestore = -939589620;
pub const hrCommunicationError = -939589619;
pub const hrFullBackupNotTaken = -939589618;
pub const hrMissingExpiryToken = -939589617;
pub const hrUnknownExpiryTokenFormat = -939589616;
pub const hrContentsExpired = -939589615;
pub const hrFileClose = -939523994;
pub const hrOutOfThreads = -939523993;
pub const hrTooManyIO = -939523991;
pub const hrBFNotSynchronous = -2013265720;
pub const hrBFPageNotFound = -2013265719;
pub const hrBFInUse = -939523894;
pub const hrPMRecDeleted = -939523794;
pub const hrRemainingVersions = -2013265599;
pub const hrFLDKeyTooBig = -2013265520;
pub const hrFLDTooManySegments = -939523695;
pub const hrFLDNullKey = -2013265518;
pub const hrLogFileCorrupt = -939523595;
pub const hrNoBackupDirectory = -939523593;
pub const hrBackupDirectoryNotEmpty = -939523592;
pub const hrBackupInProgress = -939523591;
pub const hrMissingPreviousLogFile = -939523587;
pub const hrLogWriteFail = -939523586;
pub const hrBadLogVersion = -939523582;
pub const hrInvalidLogSequence = -939523581;
pub const hrLoggingDisabled = -939523580;
pub const hrLogBufferTooSmall = -939523579;
pub const hrLogSequenceEnd = -939523577;
pub const hrNoBackup = -939523576;
pub const hrInvalidBackupSequence = -939523575;
pub const hrBackupNotAllowedYet = -939523573;
pub const hrDeleteBackupFileFail = -939523572;
pub const hrMakeBackupDirectoryFail = -939523571;
pub const hrInvalidBackup = -939523570;
pub const hrRecoveredWithErrors = -939523569;
pub const hrMissingLogFile = -939523568;
pub const hrLogDiskFull = -939523567;
pub const hrBadLogSignature = -939523566;
pub const hrBadDbSignature = -939523565;
pub const hrBadCheckpointSignature = -939523564;
pub const hrCheckpointCorrupt = -939523563;
pub const hrDatabaseInconsistent = -939523546;
pub const hrConsistentTimeMismatch = -939523545;
pub const hrPatchFileMismatch = -939523544;
pub const hrRestoreLogTooLow = -939523543;
pub const hrRestoreLogTooHigh = -939523542;
pub const hrGivenLogFileHasBadSignature = -939523541;
pub const hrGivenLogFileIsNotContiguous = -939523540;
pub const hrMissingRestoreLogFiles = -939523539;
pub const hrExistingLogFileHasBadSignature = -2013265362;
pub const hrExistingLogFileIsNotContiguous = -2013265361;
pub const hrMissingFullBackup = -939523536;
pub const hrBadBackupDatabaseSize = -939523535;
pub const hrTermInProgress = -939523096;
pub const hrFeatureNotAvailable = -939523095;
pub const hrInvalidName = -939523094;
pub const hrInvalidParameter = -939523093;
pub const hrColumnNull = -2013264916;
pub const hrBufferTruncated = -2013264914;
pub const hrDatabaseAttached = -2013264913;
pub const hrInvalidDatabaseId = -939523086;
pub const hrOutOfMemory = -939523085;
pub const hrOutOfDatabaseSpace = -939523084;
pub const hrOutOfCursors = -939523083;
pub const hrOutOfBuffers = -939523082;
pub const hrTooManyIndexes = -939523081;
pub const hrTooManyKeys = -939523080;
pub const hrRecordDeleted = -939523079;
pub const hrReadVerifyFailure = -939523078;
pub const hrOutOfFileHandles = -939523076;
pub const hrDiskIO = -939523074;
pub const hrInvalidPath = -939523073;
pub const hrRecordTooBig = -939523070;
pub const hrTooManyOpenDatabases = -939523069;
pub const hrInvalidDatabase = -939523068;
pub const hrNotInitialized = -939523067;
pub const hrAlreadyInitialized = -939523066;
pub const hrFileAccessDenied = -939523064;
pub const hrBufferTooSmall = -939523058;
pub const hrSeekNotEqual = -2013264881;
pub const hrTooManyColumns = -939523056;
pub const hrContainerNotEmpty = -939523053;
pub const hrInvalidFilename = -939523052;
pub const hrInvalidBookmark = -939523051;
pub const hrColumnInUse = -939523050;
pub const hrInvalidBufferSize = -939523049;
pub const hrColumnNotUpdatable = -939523048;
pub const hrIndexInUse = -939523045;
pub const hrNullKeyDisallowed = -939523043;
pub const hrNotInTransaction = -939523042;
pub const hrNoIdleActivity = -2013264862;
pub const hrTooManyActiveUsers = -939523037;
pub const hrInvalidCountry = -939523035;
pub const hrInvalidLanguageId = -939523034;
pub const hrInvalidCodePage = -939523033;
pub const hrNoWriteLock = -2013264853;
pub const hrColumnSetNull = -2013264852;
pub const hrVersionStoreOutOfMemory = -939523027;
pub const hrCurrencyStackOutOfMemory = -939523026;
pub const hrOutOfSessions = -939522995;
pub const hrWriteConflict = -939522994;
pub const hrTransTooDeep = -939522993;
pub const hrInvalidSesid = -939522992;
pub const hrSessionWriteConflict = -939522989;
pub const hrInTransaction = -939522988;
pub const hrDatabaseDuplicate = -939522895;
pub const hrDatabaseInUse = -939522894;
pub const hrDatabaseNotFound = -939522893;
pub const hrDatabaseInvalidName = -939522892;
pub const hrDatabaseInvalidPages = -939522891;
pub const hrDatabaseCorrupted = -939522890;
pub const hrDatabaseLocked = -939522889;
pub const hrTableEmpty = -2013264619;
pub const hrTableLocked = -939522794;
pub const hrTableDuplicate = -939522793;
pub const hrTableInUse = -939522792;
pub const hrObjectNotFound = -939522791;
pub const hrCannotRename = -939522790;
pub const hrDensityInvalid = -939522789;
pub const hrTableNotEmpty = -939522788;
pub const hrInvalidTableId = -939522786;
pub const hrTooManyOpenTables = -939522785;
pub const hrIllegalOperation = -939522784;
pub const hrObjectDuplicate = -939522782;
pub const hrInvalidObject = -939522780;
pub const hrIndexCantBuild = -939522695;
pub const hrIndexHasPrimary = -939522694;
pub const hrIndexDuplicate = -939522693;
pub const hrIndexNotFound = -939522692;
pub const hrIndexMustStay = -939522691;
pub const hrIndexInvalidDef = -939522690;
pub const hrIndexHasClustered = -939522688;
pub const hrCreateIndexFailed = -2013264511;
pub const hrTooManyOpenIndexes = -939522686;
pub const hrColumnLong = -939522595;
pub const hrColumnDoesNotFit = -939522593;
pub const hrNullInvalid = -939522592;
pub const hrColumnIndexed = -939522591;
pub const hrColumnTooBig = -939522590;
pub const hrColumnNotFound = -939522589;
pub const hrColumnDuplicate = -939522588;
pub const hrColumn2ndSysMaint = -939522586;
pub const hrInvalidColumnType = -939522585;
pub const hrColumnMaxTruncated = -2013264408;
pub const hrColumnCannotIndex = -939522583;
pub const hrTaggedNotNULL = -939522582;
pub const hrNoCurrentIndex = -939522581;
pub const hrKeyIsMade = -939522580;
pub const hrBadColumnId = -939522579;
pub const hrBadItagSequence = -939522578;
pub const hrCannotBeTagged = -939522575;
pub const hrRecordNotFound = -939522495;
pub const hrNoCurrentRecord = -939522493;
pub const hrRecordClusteredChanged = -939522492;
pub const hrKeyDuplicate = -939522491;
pub const hrAlreadyPrepared = -939522489;
pub const hrKeyNotMade = -939522488;
pub const hrUpdateNotPrepared = -939522487;
pub const hrwrnDataHasChanged = -2013264310;
pub const hrerrDataHasChanged = -939522485;
pub const hrKeyChanged = -2013264302;
pub const hrTooManySorts = -939522395;
pub const hrInvalidOnSort = -939522394;
pub const hrTempFileOpenError = -939522293;
pub const hrTooManyAttachedDatabases = -939522291;
pub const hrDiskFull = -939522288;
pub const hrPermissionDenied = -939522287;
pub const hrFileNotFound = -939522285;
pub const hrFileOpenReadOnly = -2013264107;
pub const hrAfterInitialization = -939522246;
pub const hrLogCorrupted = -939522244;
pub const hrInvalidOperation = -939522190;
pub const hrAccessDenied = -939522189;
pub const ADSTYPE_INVALID = 0;
pub const ADSTYPE_DN_STRING = 1;
pub const ADSTYPE_CASE_EXACT_STRING = 2;
pub const ADSTYPE_CASE_IGNORE_STRING = 3;
pub const ADSTYPE_PRINTABLE_STRING = 4;
pub const ADSTYPE_NUMERIC_STRING = 5;
pub const ADSTYPE_BOOLEAN = 6;
pub const ADSTYPE_INTEGER = 7;
pub const ADSTYPE_OCTET_STRING = 8;
pub const ADSTYPE_UTC_TIME = 9;
pub const ADSTYPE_LARGE_INTEGER = 10;
pub const ADSTYPE_PROV_SPECIFIC = 11;
pub const ADSTYPE_OBJECT_CLASS = 12;
pub const ADSTYPE_CASEIGNORE_LIST = 13;
pub const ADSTYPE_OCTET_LIST = 14;
pub const ADSTYPE_PATH = 15;
pub const ADSTYPE_POSTALADDRESS = 16;
pub const ADSTYPE_TIMESTAMP = 17;
pub const ADSTYPE_BACKLINK = 18;
pub const ADSTYPE_TYPEDNAME = 19;
pub const ADSTYPE_HOLD = 20;
pub const ADSTYPE_NETADDRESS = 21;
pub const ADSTYPE_REPLICAPOINTER = 22;
pub const ADSTYPE_FAXNUMBER = 23;
pub const ADSTYPE_EMAIL = 24;
pub const ADSTYPE_NT_SECURITY_DESCRIPTOR = 25;
pub const ADSTYPE_UNKNOWN = 26;
pub const ADSTYPE_DN_WITH_BINARY = 27;
pub const ADSTYPE_DN_WITH_STRING = 28;
pub const ADS_SECURE_AUTHENTICATION = 1;
pub const ADS_USE_ENCRYPTION = 2;
pub const ADS_USE_SSL = 2;
pub const ADS_READONLY_SERVER = 4;
pub const ADS_PROMPT_CREDENTIALS = 8;
pub const ADS_NO_AUTHENTICATION = 16;
pub const ADS_FAST_BIND = 32;
pub const ADS_USE_SIGNING = 64;
pub const ADS_USE_SEALING = 128;
pub const ADS_USE_DELEGATION = 256;
pub const ADS_SERVER_BIND = 512;
pub const ADS_NO_REFERRAL_CHASING = 1024;
pub const ADS_AUTH_RESERVED = 2147483648;
pub const ADS_STATUS_S_OK = 0;
pub const ADS_STATUS_INVALID_SEARCHPREF = 1;
pub const ADS_STATUS_INVALID_SEARCHPREFVALUE = 2;
pub const ADS_DEREF_NEVER = 0;
pub const ADS_DEREF_SEARCHING = 1;
pub const ADS_DEREF_FINDING = 2;
pub const ADS_DEREF_ALWAYS = 3;
pub const ADS_SCOPE_BASE = 0;
pub const ADS_SCOPE_ONELEVEL = 1;
pub const ADS_SCOPE_SUBTREE = 2;
pub const ADSIPROP_ASYNCHRONOUS = 0;
pub const ADSIPROP_DEREF_ALIASES = 1;
pub const ADSIPROP_SIZE_LIMIT = 2;
pub const ADSIPROP_TIME_LIMIT = 3;
pub const ADSIPROP_ATTRIBTYPES_ONLY = 4;
pub const ADSIPROP_SEARCH_SCOPE = 5;
pub const ADSIPROP_TIMEOUT = 6;
pub const ADSIPROP_PAGESIZE = 7;
pub const ADSIPROP_PAGED_TIME_LIMIT = 8;
pub const ADSIPROP_CHASE_REFERRALS = 9;
pub const ADSIPROP_SORT_ON = 10;
pub const ADSIPROP_CACHE_RESULTS = 11;
pub const ADSIPROP_ADSIFLAG = 12;
pub const ADSI_DIALECT_LDAP = 0;
pub const ADSI_DIALECT_SQL = 1;
pub const ADS_CHASE_REFERRALS_NEVER = 0;
pub const ADS_CHASE_REFERRALS_SUBORDINATE = 32;
pub const ADS_CHASE_REFERRALS_EXTERNAL = 64;
pub const ADS_CHASE_REFERRALS_ALWAYS = 96;
pub const ADS_SEARCHPREF_ASYNCHRONOUS = 0;
pub const ADS_SEARCHPREF_DEREF_ALIASES = 1;
pub const ADS_SEARCHPREF_SIZE_LIMIT = 2;
pub const ADS_SEARCHPREF_TIME_LIMIT = 3;
pub const ADS_SEARCHPREF_ATTRIBTYPES_ONLY = 4;
pub const ADS_SEARCHPREF_SEARCH_SCOPE = 5;
pub const ADS_SEARCHPREF_TIMEOUT = 6;
pub const ADS_SEARCHPREF_PAGESIZE = 7;
pub const ADS_SEARCHPREF_PAGED_TIME_LIMIT = 8;
pub const ADS_SEARCHPREF_CHASE_REFERRALS = 9;
pub const ADS_SEARCHPREF_SORT_ON = 10;
pub const ADS_SEARCHPREF_CACHE_RESULTS = 11;
pub const ADS_SEARCHPREF_DIRSYNC = 12;
pub const ADS_SEARCHPREF_TOMBSTONE = 13;
pub const ADS_SEARCHPREF_VLV = 14;
pub const ADS_SEARCHPREF_ATTRIBUTE_QUERY = 15;
pub const ADS_SEARCHPREF_SECURITY_MASK = 16;
pub const ADS_SEARCHPREF_DIRSYNC_FLAG = 17;
pub const ADS_SEARCHPREF_EXTENDED_DN = 18;
pub const ADS_PASSWORD_ENCODE_REQUIRE_SSL = 0;
pub const ADS_PASSWORD_ENCODE_CLEAR = 1;
pub const ADS_PROPERTY_CLEAR = 1;
pub const ADS_PROPERTY_UPDATE = 2;
pub const ADS_PROPERTY_APPEND = 3;
pub const ADS_PROPERTY_DELETE = 4;
pub const ADS_SYSTEMFLAG_DISALLOW_DELETE = -2147483648;
pub const ADS_SYSTEMFLAG_CONFIG_ALLOW_RENAME = 1073741824;
pub const ADS_SYSTEMFLAG_CONFIG_ALLOW_MOVE = 536870912;
pub const ADS_SYSTEMFLAG_CONFIG_ALLOW_LIMITED_MOVE = 268435456;
pub const ADS_SYSTEMFLAG_DOMAIN_DISALLOW_RENAME = 134217728;
pub const ADS_SYSTEMFLAG_DOMAIN_DISALLOW_MOVE = 67108864;
pub const ADS_SYSTEMFLAG_CR_NTDS_NC = 1;
pub const ADS_SYSTEMFLAG_CR_NTDS_DOMAIN = 2;
pub const ADS_SYSTEMFLAG_ATTR_NOT_REPLICATED = 1;
pub const ADS_SYSTEMFLAG_ATTR_IS_CONSTRUCTED = 4;
pub const ADS_GROUP_TYPE_GLOBAL_GROUP = 2;
pub const ADS_GROUP_TYPE_DOMAIN_LOCAL_GROUP = 4;
pub const ADS_GROUP_TYPE_LOCAL_GROUP = 4;
pub const ADS_GROUP_TYPE_UNIVERSAL_GROUP = 8;
pub const ADS_GROUP_TYPE_SECURITY_ENABLED = -2147483648;
pub const ADS_UF_SCRIPT = 1;
pub const ADS_UF_ACCOUNTDISABLE = 2;
pub const ADS_UF_HOMEDIR_REQUIRED = 8;
pub const ADS_UF_LOCKOUT = 16;
pub const ADS_UF_PASSWD_NOTREQD = 32;
pub const ADS_UF_PASSWD_CANT_CHANGE = 64;
pub const ADS_UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED = 128;
pub const ADS_UF_TEMP_DUPLICATE_ACCOUNT = 256;
pub const ADS_UF_NORMAL_ACCOUNT = 512;
pub const ADS_UF_INTERDOMAIN_TRUST_ACCOUNT = 2048;
pub const ADS_UF_WORKSTATION_TRUST_ACCOUNT = 4096;
pub const ADS_UF_SERVER_TRUST_ACCOUNT = 8192;
pub const ADS_UF_DONT_EXPIRE_PASSWD = 65536;
pub const ADS_UF_MNS_LOGON_ACCOUNT = 131072;
pub const ADS_UF_SMARTCARD_REQUIRED = 262144;
pub const ADS_UF_TRUSTED_FOR_DELEGATION = 524288;
pub const ADS_UF_NOT_DELEGATED = 1048576;
pub const ADS_UF_USE_DES_KEY_ONLY = 2097152;
pub const ADS_UF_DONT_REQUIRE_PREAUTH = 4194304;
pub const ADS_UF_PASSWORD_EXPIRED = 8388608;
pub const ADS_UF_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION = 16777216;
pub const ADS_RIGHT_DELETE = 65536;
pub const ADS_RIGHT_READ_CONTROL = 131072;
pub const ADS_RIGHT_WRITE_DAC = 262144;
pub const ADS_RIGHT_WRITE_OWNER = 524288;
pub const ADS_RIGHT_SYNCHRONIZE = 1048576;
pub const ADS_RIGHT_ACCESS_SYSTEM_SECURITY = 16777216;
pub const ADS_RIGHT_GENERIC_READ = -2147483648;
pub const ADS_RIGHT_GENERIC_WRITE = 1073741824;
pub const ADS_RIGHT_GENERIC_EXECUTE = 536870912;
pub const ADS_RIGHT_GENERIC_ALL = 268435456;
pub const ADS_RIGHT_DS_CREATE_CHILD = 1;
pub const ADS_RIGHT_DS_DELETE_CHILD = 2;
pub const ADS_RIGHT_ACTRL_DS_LIST = 4;
pub const ADS_RIGHT_DS_SELF = 8;
pub const ADS_RIGHT_DS_READ_PROP = 16;
pub const ADS_RIGHT_DS_WRITE_PROP = 32;
pub const ADS_RIGHT_DS_DELETE_TREE = 64;
pub const ADS_RIGHT_DS_LIST_OBJECT = 128;
pub const ADS_RIGHT_DS_CONTROL_ACCESS = 256;
pub const ADS_ACETYPE_ACCESS_ALLOWED = 0;
pub const ADS_ACETYPE_ACCESS_DENIED = 1;
pub const ADS_ACETYPE_SYSTEM_AUDIT = 2;
pub const ADS_ACETYPE_ACCESS_ALLOWED_OBJECT = 5;
pub const ADS_ACETYPE_ACCESS_DENIED_OBJECT = 6;
pub const ADS_ACETYPE_SYSTEM_AUDIT_OBJECT = 7;
pub const ADS_ACETYPE_SYSTEM_ALARM_OBJECT = 8;
pub const ADS_ACETYPE_ACCESS_ALLOWED_CALLBACK = 9;
pub const ADS_ACETYPE_ACCESS_DENIED_CALLBACK = 10;
pub const ADS_ACETYPE_ACCESS_ALLOWED_CALLBACK_OBJECT = 11;
pub const ADS_ACETYPE_ACCESS_DENIED_CALLBACK_OBJECT = 12;
pub const ADS_ACETYPE_SYSTEM_AUDIT_CALLBACK = 13;
pub const ADS_ACETYPE_SYSTEM_ALARM_CALLBACK = 14;
pub const ADS_ACETYPE_SYSTEM_AUDIT_CALLBACK_OBJECT = 15;
pub const ADS_ACETYPE_SYSTEM_ALARM_CALLBACK_OBJECT = 16;
pub const ADS_ACEFLAG_INHERIT_ACE = 2;
pub const ADS_ACEFLAG_NO_PROPAGATE_INHERIT_ACE = 4;
pub const ADS_ACEFLAG_INHERIT_ONLY_ACE = 8;
pub const ADS_ACEFLAG_INHERITED_ACE = 16;
pub const ADS_ACEFLAG_VALID_INHERIT_FLAGS = 31;
pub const ADS_ACEFLAG_SUCCESSFUL_ACCESS = 64;
pub const ADS_ACEFLAG_FAILED_ACCESS = 128;
pub const ADS_FLAG_OBJECT_TYPE_PRESENT = 1;
pub const ADS_FLAG_INHERITED_OBJECT_TYPE_PRESENT = 2;
pub const ADS_SD_CONTROL_SE_OWNER_DEFAULTED = 1;
pub const ADS_SD_CONTROL_SE_GROUP_DEFAULTED = 2;
pub const ADS_SD_CONTROL_SE_DACL_PRESENT = 4;
pub const ADS_SD_CONTROL_SE_DACL_DEFAULTED = 8;
pub const ADS_SD_CONTROL_SE_SACL_PRESENT = 16;
pub const ADS_SD_CONTROL_SE_SACL_DEFAULTED = 32;
pub const ADS_SD_CONTROL_SE_DACL_AUTO_INHERIT_REQ = 256;
pub const ADS_SD_CONTROL_SE_SACL_AUTO_INHERIT_REQ = 512;
pub const ADS_SD_CONTROL_SE_DACL_AUTO_INHERITED = 1024;
pub const ADS_SD_CONTROL_SE_SACL_AUTO_INHERITED = 2048;
pub const ADS_SD_CONTROL_SE_DACL_PROTECTED = 4096;
pub const ADS_SD_CONTROL_SE_SACL_PROTECTED = 8192;
pub const ADS_SD_CONTROL_SE_SELF_RELATIVE = 32768;
pub const ADS_SD_REVISION_DS = 4;
pub const ADS_NAME_TYPE_1779 = 1;
pub const ADS_NAME_TYPE_CANONICAL = 2;
pub const ADS_NAME_TYPE_NT4 = 3;
pub const ADS_NAME_TYPE_DISPLAY = 4;
pub const ADS_NAME_TYPE_DOMAIN_SIMPLE = 5;
pub const ADS_NAME_TYPE_ENTERPRISE_SIMPLE = 6;
pub const ADS_NAME_TYPE_GUID = 7;
pub const ADS_NAME_TYPE_UNKNOWN = 8;
pub const ADS_NAME_TYPE_USER_PRINCIPAL_NAME = 9;
pub const ADS_NAME_TYPE_CANONICAL_EX = 10;
pub const ADS_NAME_TYPE_SERVICE_PRINCIPAL_NAME = 11;
pub const ADS_NAME_TYPE_SID_OR_SID_HISTORY_NAME = 12;
pub const ADS_NAME_INITTYPE_DOMAIN = 1;
pub const ADS_NAME_INITTYPE_SERVER = 2;
pub const ADS_NAME_INITTYPE_GC = 3;
pub const ADS_OPTION_SERVERNAME = 0;
pub const ADS_OPTION_REFERRALS = 1;
pub const ADS_OPTION_PAGE_SIZE = 2;
pub const ADS_OPTION_SECURITY_MASK = 3;
pub const ADS_OPTION_MUTUAL_AUTH_STATUS = 4;
pub const ADS_OPTION_QUOTA = 5;
pub const ADS_OPTION_PASSWORD_PORTNUMBER = 6;
pub const ADS_OPTION_PASSWORD_METHOD = 7;
pub const ADS_OPTION_ACCUMULATIVE_MODIFICATION = 8;
pub const ADS_OPTION_SKIP_SID_LOOKUP = 9;
pub const ADS_SECURITY_INFO_OWNER = 1;
pub const ADS_SECURITY_INFO_GROUP = 2;
pub const ADS_SECURITY_INFO_DACL = 4;
pub const ADS_SECURITY_INFO_SACL = 8;
pub const ADS_SETTYPE_FULL = 1;
pub const ADS_SETTYPE_PROVIDER = 2;
pub const ADS_SETTYPE_SERVER = 3;
pub const ADS_SETTYPE_DN = 4;
pub const ADS_FORMAT_WINDOWS = 1;
pub const ADS_FORMAT_WINDOWS_NO_SERVER = 2;
pub const ADS_FORMAT_WINDOWS_DN = 3;
pub const ADS_FORMAT_WINDOWS_PARENT = 4;
pub const ADS_FORMAT_X500 = 5;
pub const ADS_FORMAT_X500_NO_SERVER = 6;
pub const ADS_FORMAT_X500_DN = 7;
pub const ADS_FORMAT_X500_PARENT = 8;
pub const ADS_FORMAT_SERVER = 9;
pub const ADS_FORMAT_PROVIDER = 10;
pub const ADS_FORMAT_LEAF = 11;
pub const ADS_DISPLAY_FULL = 1;
pub const ADS_DISPLAY_VALUE_ONLY = 2;
pub const ADS_ESCAPEDMODE_DEFAULT = 1;
pub const ADS_ESCAPEDMODE_ON = 2;
pub const ADS_ESCAPEDMODE_OFF = 3;
pub const ADS_ESCAPEDMODE_OFF_EX = 4;
pub const ADS_PATH_FILE = 1;
pub const ADS_PATH_FILESHARE = 2;
pub const ADS_PATH_REGISTRY = 3;
pub const ADS_SD_FORMAT_IID = 1;
pub const ADS_SD_FORMAT_RAW = 2;
pub const ADS_SD_FORMAT_HEXSTRING = 3;
pub const DS_MANGLE_UNKNOWN = 0;
pub const DS_MANGLE_OBJECT_RDN_FOR_DELETION = 1;
pub const DS_MANGLE_OBJECT_RDN_FOR_NAME_CONFLICT = 2;
pub const DS_UNKNOWN_NAME = 0;
pub const DS_FQDN_1779_NAME = 1;
pub const DS_NT4_ACCOUNT_NAME = 2;
pub const DS_DISPLAY_NAME = 3;
pub const DS_UNIQUE_ID_NAME = 6;
pub const DS_CANONICAL_NAME = 7;
pub const DS_USER_PRINCIPAL_NAME = 8;
pub const DS_CANONICAL_NAME_EX = 9;
pub const DS_SERVICE_PRINCIPAL_NAME = 10;
pub const DS_SID_OR_SID_HISTORY_NAME = 11;
pub const DS_DNS_DOMAIN_NAME = 12;
pub const DS_NAME_NO_FLAGS = 0;
pub const DS_NAME_FLAG_SYNTACTICAL_ONLY = 1;
pub const DS_NAME_FLAG_EVAL_AT_DC = 2;
pub const DS_NAME_FLAG_GCVERIFY = 4;
pub const DS_NAME_FLAG_TRUST_REFERRAL = 8;
pub const DS_NAME_NO_ERROR = 0;
pub const DS_NAME_ERROR_RESOLVING = 1;
pub const DS_NAME_ERROR_NOT_FOUND = 2;
pub const DS_NAME_ERROR_NOT_UNIQUE = 3;
pub const DS_NAME_ERROR_NO_MAPPING = 4;
pub const DS_NAME_ERROR_DOMAIN_ONLY = 5;
pub const DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING = 6;
pub const DS_NAME_ERROR_TRUST_REFERRAL = 7;
pub const DS_SPN_DNS_HOST = 0;
pub const DS_SPN_DN_HOST = 1;
pub const DS_SPN_NB_HOST = 2;
pub const DS_SPN_DOMAIN = 3;
pub const DS_SPN_NB_DOMAIN = 4;
pub const DS_SPN_SERVICE = 5;
pub const DS_SPN_ADD_SPN_OP = 0;
pub const DS_SPN_REPLACE_SPN_OP = 1;
pub const DS_SPN_DELETE_SPN_OP = 2;
pub const DS_REPSYNCALL_WIN32_ERROR_CONTACTING_SERVER = 0;
pub const DS_REPSYNCALL_WIN32_ERROR_REPLICATING = 1;
pub const DS_REPSYNCALL_SERVER_UNREACHABLE = 2;
pub const DS_REPSYNCALL_EVENT_ERROR = 0;
pub const DS_REPSYNCALL_EVENT_SYNC_STARTED = 1;
pub const DS_REPSYNCALL_EVENT_SYNC_COMPLETED = 2;
pub const DS_REPSYNCALL_EVENT_FINISHED = 3;
pub const DS_KCC_TASKID_UPDATE_TOPOLOGY = 0;
pub const DS_REPL_INFO_NEIGHBORS = 0;
pub const DS_REPL_INFO_CURSORS_FOR_NC = 1;
pub const DS_REPL_INFO_METADATA_FOR_OBJ = 2;
pub const DS_REPL_INFO_KCC_DSA_CONNECT_FAILURES = 3;
pub const DS_REPL_INFO_KCC_DSA_LINK_FAILURES = 4;
pub const DS_REPL_INFO_PENDING_OPS = 5;
pub const DS_REPL_INFO_METADATA_FOR_ATTR_VALUE = 6;
pub const DS_REPL_INFO_CURSORS_2_FOR_NC = 7;
pub const DS_REPL_INFO_CURSORS_3_FOR_NC = 8;
pub const DS_REPL_INFO_METADATA_2_FOR_OBJ = 9;
pub const DS_REPL_INFO_METADATA_2_FOR_ATTR_VALUE = 10;
pub const DS_REPL_INFO_METADATA_EXT_FOR_ATTR_VALUE = 11;
pub const DS_REPL_INFO_TYPE_MAX = 12;
pub const DS_REPL_OP_TYPE_SYNC = 0;
pub const DS_REPL_OP_TYPE_ADD = 1;
pub const DS_REPL_OP_TYPE_DELETE = 2;
pub const DS_REPL_OP_TYPE_MODIFY = 3;
pub const DS_REPL_OP_TYPE_UPDATE_REFS = 4;
pub const DsRole_RoleStandaloneWorkstation = 0;
pub const DsRole_RoleMemberWorkstation = 1;
pub const DsRole_RoleStandaloneServer = 2;
pub const DsRole_RoleMemberServer = 3;
pub const DsRole_RoleBackupDomainController = 4;
pub const DsRole_RolePrimaryDomainController = 5;
pub const DsRoleServerUnknown = 0;
pub const DsRoleServerPrimary = 1;
pub const DsRoleServerBackup = 2;
pub const DsRolePrimaryDomainInfoBasic = 1;
pub const DsRoleUpgradeStatus = 2;
pub const DsRoleOperationState = 3;
pub const DsRoleOperationIdle = 0;
pub const DsRoleOperationActive = 1;
pub const DsRoleOperationNeedReboot = 2;

pub const aliases = struct {
    pub const ADSTYPE = i32;
    pub const ADS_AUTHENTICATION_ENUM = u32;
    pub const ADS_STATUSENUM = i32;
    pub const ADS_DEREFENUM = i32;
    pub const ADS_SCOPEENUM = i32;
    pub const ADS_PREFERENCES_ENUM = i32;
    pub const ADSI_DIALECT_ENUM = i32;
    pub const ADS_CHASE_REFERRALS_ENUM = i32;
    pub const ADS_SEARCHPREF_ENUM = i32;
    pub const ADS_PASSWORD_ENCODING_ENUM = i32;
    pub const ADS_PROPERTY_OPERATION_ENUM = i32;
    pub const ADS_SYSTEMFLAG_ENUM = i32;
    pub const ADS_GROUP_TYPE_ENUM = i32;
    pub const ADS_USER_FLAG_ENUM = i32;
    pub const ADS_RIGHTS_ENUM = i32;
    pub const ADS_ACETYPE_ENUM = i32;
    pub const ADS_ACEFLAG_ENUM = i32;
    pub const ADS_FLAGTYPE_ENUM = i32;
    pub const ADS_SD_CONTROL_ENUM = i32;
    pub const ADS_SD_REVISION_ENUM = i32;
    pub const ADS_NAME_TYPE_ENUM = i32;
    pub const ADS_NAME_INITTYPE_ENUM = i32;
    pub const ADS_OPTION_ENUM = i32;
    pub const ADS_SECURITY_INFO_ENUM = i32;
    pub const ADS_SETTYPE_ENUM = i32;
    pub const ADS_FORMAT_ENUM = i32;
    pub const ADS_DISPLAY_ENUM = i32;
    pub const ADS_ESCAPE_MODE_ENUM = i32;
    pub const ADS_PATHTYPE_ENUM = i32;
    pub const ADS_SD_FORMAT_ENUM = i32;
    pub const DS_MANGLE_FOR = i32;
    pub const DS_NAME_FORMAT = i32;
    pub const DS_NAME_FLAGS = i32;
    pub const DS_NAME_ERROR = i32;
    pub const DS_SPN_NAME_TYPE = i32;
    pub const DS_SPN_WRITE_OP = i32;
    pub const DS_REPSYNCALL_ERROR = i32;
    pub const DS_REPSYNCALL_EVENT = i32;
    pub const DS_KCC_TASKID = i32;
    pub const DS_REPL_INFO_TYPE = i32;
    pub const DS_REPL_OP_TYPE = i32;
    pub const DSROLE_MACHINE_ROLE = i32;
    pub const DSROLE_SERVER_STATE = i32;
    pub const DSROLE_PRIMARY_DOMAIN_INFO_LEVEL = i32;
    pub const DSROLE_OPERATION_STATE = i32;
    pub const ADS_SEARCH_HANDLE = isize;
    pub const LPCQADDFORMSPROC = ?*const anyopaque;
    pub const LPCQADDPAGESPROC = ?*const anyopaque;
    pub const LPCQPAGEPROC = ?*const anyopaque;
    pub const LPDSENUMATTRIBUTES = ?*const anyopaque;
};
