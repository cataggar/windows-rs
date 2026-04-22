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
    .{ "IUnknown_QueryInterface_Proxy", MethodRecord{ .library = "RPCRT4", .import = "IUnknown_QueryInterface_Proxy", .signature = "\x00\x03\x11\x79\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "IUnknown_AddRef_Proxy", MethodRecord{ .library = "RPCRT4", .import = "IUnknown_AddRef_Proxy", .signature = "\x00\x01\x09\x12\x82\xb1" } },
    .{ "IUnknown_Release_Proxy", MethodRecord{ .library = "RPCRT4", .import = "IUnknown_Release_Proxy", .signature = "\x00\x01\x09\x12\x82\xb1" } },
    .{ "RpcBindingCopy", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingCopy", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x0f\x01" } },
    .{ "RpcBindingFree", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingFree", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x01" } },
    .{ "RpcBindingSetOption", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingSetOption", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x09\x19" } },
    .{ "RpcBindingInqOption", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingInqOption", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x09\x0f\x19" } },
    .{ "RpcBindingFromStringBindingA", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingFromStringBindingA", .signature = "\x00\x02\x11\xa2\x55\x11\x3d\x0f\x0f\x01" } },
    .{ "RpcBindingFromStringBindingW", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingFromStringBindingW", .signature = "\x00\x02\x11\xa2\x55\x11\x05\x0f\x0f\x01" } },
    .{ "RpcSsGetContextBinding", MethodRecord{ .library = "RPCRT4", .import = "RpcSsGetContextBinding", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x0f\x01" } },
    .{ "RpcBindingInqMaxCalls", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingInqMaxCalls", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x09" } },
    .{ "RpcBindingInqObject", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingInqObject", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x11\x0d" } },
    .{ "RpcBindingReset", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingReset", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "RpcBindingSetObject", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingSetObject", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x11\x0d" } },
    .{ "RpcMgmtInqDefaultProtectLevel", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtInqDefaultProtectLevel", .signature = "\x00\x02\x11\xa2\x55\x09\x0f\x09" } },
    .{ "RpcBindingToStringBindingA", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingToStringBindingA", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x11\x3d" } },
    .{ "RpcBindingToStringBindingW", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingToStringBindingW", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x11\x05" } },
    .{ "RpcBindingVectorFree", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingVectorFree", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x11\xc0\x00\x44\x5d" } },
    .{ "RpcStringBindingComposeA", MethodRecord{ .library = "RPCRT4", .import = "RpcStringBindingComposeA", .signature = "\x00\x06\x11\xa2\x55\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x0f\x11\x3d" } },
    .{ "RpcStringBindingComposeW", MethodRecord{ .library = "RPCRT4", .import = "RpcStringBindingComposeW", .signature = "\x00\x06\x11\xa2\x55\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x11\x05" } },
    .{ "RpcStringBindingParseA", MethodRecord{ .library = "RPCRT4", .import = "RpcStringBindingParseA", .signature = "\x00\x06\x11\xa2\x55\x11\x3d\x0f\x11\x3d\x0f\x11\x3d\x0f\x11\x3d\x0f\x11\x3d\x0f\x11\x3d" } },
    .{ "RpcStringBindingParseW", MethodRecord{ .library = "RPCRT4", .import = "RpcStringBindingParseW", .signature = "\x00\x06\x11\xa2\x55\x11\x05\x0f\x11\x05\x0f\x11\x05\x0f\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "RpcStringFreeA", MethodRecord{ .library = "RPCRT4", .import = "RpcStringFreeA", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\x3d" } },
    .{ "RpcStringFreeW", MethodRecord{ .library = "RPCRT4", .import = "RpcStringFreeW", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\x05" } },
    .{ "RpcIfInqId", MethodRecord{ .library = "RPCRT4", .import = "RpcIfInqId", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x11\xc0\x00\x44\x61" } },
    .{ "RpcNetworkIsProtseqValidA", MethodRecord{ .library = "RPCRT4", .import = "RpcNetworkIsProtseqValidA", .signature = "\x00\x01\x11\xa2\x55\x11\x3d" } },
    .{ "RpcNetworkIsProtseqValidW", MethodRecord{ .library = "RPCRT4", .import = "RpcNetworkIsProtseqValidW", .signature = "\x00\x01\x11\xa2\x55\x11\x05" } },
    .{ "RpcMgmtInqComTimeout", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtInqComTimeout", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x09" } },
    .{ "RpcMgmtSetComTimeout", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtSetComTimeout", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x09" } },
    .{ "RpcMgmtSetCancelTimeout", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtSetCancelTimeout", .signature = "\x00\x01\x11\xa2\x55\x08" } },
    .{ "RpcNetworkInqProtseqsA", MethodRecord{ .library = "RPCRT4", .import = "RpcNetworkInqProtseqsA", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x11\xc0\x00\x44\x65" } },
    .{ "RpcNetworkInqProtseqsW", MethodRecord{ .library = "RPCRT4", .import = "RpcNetworkInqProtseqsW", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x11\xc0\x00\x44\x69" } },
    .{ "RpcObjectInqType", MethodRecord{ .library = "RPCRT4", .import = "RpcObjectInqType", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\x0d\x0f\x11\x0d" } },
    .{ "RpcObjectSetInqFn", MethodRecord{ .library = "RPCRT4", .import = "RpcObjectSetInqFn", .signature = "\x00\x01\x11\xa2\x55\x12\xc0\x00\x44\x6d" } },
    .{ "RpcObjectSetType", MethodRecord{ .library = "RPCRT4", .import = "RpcObjectSetType", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\x0d\x0f\x11\x0d" } },
    .{ "RpcProtseqVectorFreeA", MethodRecord{ .library = "RPCRT4", .import = "RpcProtseqVectorFreeA", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x11\xc0\x00\x44\x65" } },
    .{ "RpcProtseqVectorFreeW", MethodRecord{ .library = "RPCRT4", .import = "RpcProtseqVectorFreeW", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x11\xc0\x00\x44\x69" } },
    .{ "RpcServerInqBindings", MethodRecord{ .library = "RPCRT4", .import = "RpcServerInqBindings", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x11\xc0\x00\x44\x5d" } },
    .{ "RpcServerInqBindingsEx", MethodRecord{ .library = "RPCRT4", .import = "RpcServerInqBindingsEx", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x0f\x11\xc0\x00\x44\x5d" } },
    .{ "RpcServerInqIf", MethodRecord{ .library = "RPCRT4", .import = "RpcServerInqIf", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "RpcServerListen", MethodRecord{ .library = "RPCRT4", .import = "RpcServerListen", .signature = "\x00\x03\x11\xa2\x55\x09\x09\x09" } },
    .{ "RpcServerRegisterIf", MethodRecord{ .library = "RPCRT4", .import = "RpcServerRegisterIf", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x0f\x11\x0d\x0f\x01" } },
    .{ "RpcServerRegisterIfEx", MethodRecord{ .library = "RPCRT4", .import = "RpcServerRegisterIfEx", .signature = "\x00\x06\x11\xa2\x55\x0f\x01\x0f\x11\x0d\x0f\x01\x09\x09\x12\xc0\x00\x44\x71" } },
    .{ "RpcServerRegisterIf2", MethodRecord{ .library = "RPCRT4", .import = "RpcServerRegisterIf2", .signature = "\x00\x07\x11\xa2\x55\x0f\x01\x0f\x11\x0d\x0f\x01\x09\x09\x09\x12\xc0\x00\x44\x71" } },
    .{ "RpcServerRegisterIf3", MethodRecord{ .library = "RPCRT4", .import = "RpcServerRegisterIf3", .signature = "\x00\x08\x11\xa2\x55\x0f\x01\x0f\x11\x0d\x0f\x01\x09\x09\x09\x12\xc0\x00\x44\x71\x0f\x01" } },
    .{ "RpcServerUnregisterIf", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUnregisterIf", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x0f\x11\x0d\x09" } },
    .{ "RpcServerUnregisterIfEx", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUnregisterIfEx", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x0f\x11\x0d\x08" } },
    .{ "RpcServerUseAllProtseqs", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseAllProtseqs", .signature = "\x00\x02\x11\xa2\x55\x09\x0f\x01" } },
    .{ "RpcServerUseAllProtseqsEx", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseAllProtseqsEx", .signature = "\x00\x03\x11\xa2\x55\x09\x0f\x01\x0f\x11\xc0\x00\x44\x75" } },
    .{ "RpcServerUseAllProtseqsIf", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseAllProtseqsIf", .signature = "\x00\x03\x11\xa2\x55\x09\x0f\x01\x0f\x01" } },
    .{ "RpcServerUseAllProtseqsIfEx", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseAllProtseqsIfEx", .signature = "\x00\x04\x11\xa2\x55\x09\x0f\x01\x0f\x01\x0f\x11\xc0\x00\x44\x75" } },
    .{ "RpcServerUseProtseqA", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseProtseqA", .signature = "\x00\x03\x11\xa2\x55\x11\x3d\x09\x0f\x01" } },
    .{ "RpcServerUseProtseqExA", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseProtseqExA", .signature = "\x00\x04\x11\xa2\x55\x11\x3d\x09\x0f\x01\x0f\x11\xc0\x00\x44\x75" } },
    .{ "RpcServerUseProtseqW", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseProtseqW", .signature = "\x00\x03\x11\xa2\x55\x11\x05\x09\x0f\x01" } },
    .{ "RpcServerUseProtseqExW", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseProtseqExW", .signature = "\x00\x04\x11\xa2\x55\x11\x05\x09\x0f\x01\x0f\x11\xc0\x00\x44\x75" } },
    .{ "RpcServerUseProtseqEpA", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseProtseqEpA", .signature = "\x00\x04\x11\xa2\x55\x11\x3d\x09\x11\x3d\x0f\x01" } },
    .{ "RpcServerUseProtseqEpExA", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseProtseqEpExA", .signature = "\x00\x05\x11\xa2\x55\x11\x3d\x09\x11\x3d\x0f\x01\x0f\x11\xc0\x00\x44\x75" } },
    .{ "RpcServerUseProtseqEpW", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseProtseqEpW", .signature = "\x00\x04\x11\xa2\x55\x11\x05\x09\x11\x05\x0f\x01" } },
    .{ "RpcServerUseProtseqEpExW", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseProtseqEpExW", .signature = "\x00\x05\x11\xa2\x55\x11\x05\x09\x11\x05\x0f\x01\x0f\x11\xc0\x00\x44\x75" } },
    .{ "RpcServerUseProtseqIfA", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseProtseqIfA", .signature = "\x00\x04\x11\xa2\x55\x11\x3d\x09\x0f\x01\x0f\x01" } },
    .{ "RpcServerUseProtseqIfExA", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseProtseqIfExA", .signature = "\x00\x05\x11\xa2\x55\x11\x3d\x09\x0f\x01\x0f\x01\x0f\x11\xc0\x00\x44\x75" } },
    .{ "RpcServerUseProtseqIfW", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseProtseqIfW", .signature = "\x00\x04\x11\xa2\x55\x11\x05\x09\x0f\x01\x0f\x01" } },
    .{ "RpcServerUseProtseqIfExW", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUseProtseqIfExW", .signature = "\x00\x05\x11\xa2\x55\x11\x05\x09\x0f\x01\x0f\x01\x0f\x11\xc0\x00\x44\x75" } },
    .{ "RpcServerYield", MethodRecord{ .library = "RPCRT4", .import = "RpcServerYield", .signature = "\x00\x00\x01" } },
    .{ "RpcMgmtStatsVectorFree", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtStatsVectorFree", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x11\xc0\x00\x44\x79" } },
    .{ "RpcMgmtInqStats", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtInqStats", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x0f\x11\xc0\x00\x44\x79" } },
    .{ "RpcMgmtIsServerListening", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtIsServerListening", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "RpcMgmtStopServerListening", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtStopServerListening", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "RpcMgmtWaitServerListen", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtWaitServerListen", .signature = "\x00\x00\x11\xa2\x55" } },
    .{ "RpcMgmtSetServerStackSize", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtSetServerStackSize", .signature = "\x00\x01\x11\xa2\x55\x09" } },
    .{ "RpcSsDontSerializeContext", MethodRecord{ .library = "RPCRT4", .import = "RpcSsDontSerializeContext", .signature = "\x00\x00\x01" } },
    .{ "RpcMgmtEnableIdleCleanup", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtEnableIdleCleanup", .signature = "\x00\x00\x11\xa2\x55" } },
    .{ "RpcMgmtInqIfIds", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtInqIfIds", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x0f\x11\xc0\x00\x44\x7d" } },
    .{ "RpcIfIdVectorFree", MethodRecord{ .library = "RPCNS4", .import = "RpcIfIdVectorFree", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x11\xc0\x00\x44\x7d" } },
    .{ "RpcMgmtInqServerPrincNameA", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtInqServerPrincNameA", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x09\x0f\x11\x3d" } },
    .{ "RpcMgmtInqServerPrincNameW", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtInqServerPrincNameW", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x09\x0f\x11\x05" } },
    .{ "RpcServerInqDefaultPrincNameA", MethodRecord{ .library = "RPCRT4", .import = "RpcServerInqDefaultPrincNameA", .signature = "\x00\x02\x11\xa2\x55\x09\x0f\x11\x3d" } },
    .{ "RpcServerInqDefaultPrincNameW", MethodRecord{ .library = "RPCRT4", .import = "RpcServerInqDefaultPrincNameW", .signature = "\x00\x02\x11\xa2\x55\x09\x0f\x11\x05" } },
    .{ "RpcEpResolveBinding", MethodRecord{ .library = "RPCRT4", .import = "RpcEpResolveBinding", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x01" } },
    .{ "RpcNsBindingInqEntryNameA", MethodRecord{ .library = "RPCRT4", .import = "RpcNsBindingInqEntryNameA", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x09\x0f\x11\x3d" } },
    .{ "RpcNsBindingInqEntryNameW", MethodRecord{ .library = "RPCRT4", .import = "RpcNsBindingInqEntryNameW", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x09\x0f\x11\x05" } },
    .{ "RpcBindingCreateA", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingCreateA", .signature = "\x00\x04\x11\xa2\x55\x0f\x11\xc0\x00\x44\x81\x0f\x11\xc0\x00\x44\x85\x0f\x11\xc0\x00\x44\x89\x0f\x0f\x01" } },
    .{ "RpcBindingCreateW", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingCreateW", .signature = "\x00\x04\x11\xa2\x55\x0f\x11\xc0\x00\x44\x8d\x0f\x11\xc0\x00\x44\x91\x0f\x11\xc0\x00\x44\x89\x0f\x0f\x01" } },
    .{ "RpcServerInqBindingHandle", MethodRecord{ .library = "RPCRT4", .import = "RpcServerInqBindingHandle", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x01" } },
    .{ "RpcImpersonateClient", MethodRecord{ .library = "RPCRT4", .import = "RpcImpersonateClient", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "RpcImpersonateClient2", MethodRecord{ .library = "RPCRT4", .import = "RpcImpersonateClient2", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "RpcRevertToSelfEx", MethodRecord{ .library = "RPCRT4", .import = "RpcRevertToSelfEx", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "RpcRevertToSelf", MethodRecord{ .library = "RPCRT4", .import = "RpcRevertToSelf", .signature = "\x00\x00\x11\xa2\x55" } },
    .{ "RpcImpersonateClientContainer", MethodRecord{ .library = "RPCRT4", .import = "RpcImpersonateClientContainer", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "RpcRevertContainerImpersonation", MethodRecord{ .library = "RPCRT4", .import = "RpcRevertContainerImpersonation", .signature = "\x00\x00\x11\xa2\x55" } },
    .{ "RpcBindingInqAuthClientA", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingInqAuthClientA", .signature = "\x00\x06\x11\xa2\x55\x0f\x01\x0f\x0f\x01\x0f\x11\x3d\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "RpcBindingInqAuthClientW", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingInqAuthClientW", .signature = "\x00\x06\x11\xa2\x55\x0f\x01\x0f\x0f\x01\x0f\x11\x05\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "RpcBindingInqAuthClientExA", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingInqAuthClientExA", .signature = "\x00\x07\x11\xa2\x55\x0f\x01\x0f\x0f\x01\x0f\x11\x3d\x0f\x09\x0f\x09\x0f\x09\x09" } },
    .{ "RpcBindingInqAuthClientExW", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingInqAuthClientExW", .signature = "\x00\x07\x11\xa2\x55\x0f\x01\x0f\x0f\x01\x0f\x11\x05\x0f\x09\x0f\x09\x0f\x09\x09" } },
    .{ "RpcBindingInqAuthInfoA", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingInqAuthInfoA", .signature = "\x00\x06\x11\xa2\x55\x0f\x01\x0f\x11\x3d\x0f\x09\x0f\x09\x0f\x0f\x01\x0f\x09" } },
    .{ "RpcBindingInqAuthInfoW", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingInqAuthInfoW", .signature = "\x00\x06\x11\xa2\x55\x0f\x01\x0f\x11\x05\x0f\x09\x0f\x09\x0f\x0f\x01\x0f\x09" } },
    .{ "RpcBindingSetAuthInfoA", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingSetAuthInfoA", .signature = "\x00\x06\x11\xa2\x55\x0f\x01\x11\x3d\x09\x09\x0f\x01\x09" } },
    .{ "RpcBindingSetAuthInfoExA", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingSetAuthInfoExA", .signature = "\x00\x07\x11\xa2\x55\x0f\x01\x11\x3d\x09\x09\x0f\x01\x09\x0f\x11\xc0\x00\x44\x95" } },
    .{ "RpcBindingSetAuthInfoW", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingSetAuthInfoW", .signature = "\x00\x06\x11\xa2\x55\x0f\x01\x11\x05\x09\x09\x0f\x01\x09" } },
    .{ "RpcBindingSetAuthInfoExW", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingSetAuthInfoExW", .signature = "\x00\x07\x11\xa2\x55\x0f\x01\x11\x05\x09\x09\x0f\x01\x09\x0f\x11\xc0\x00\x44\x95" } },
    .{ "RpcBindingInqAuthInfoExA", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingInqAuthInfoExA", .signature = "\x00\x08\x11\xa2\x55\x0f\x01\x0f\x11\x3d\x0f\x09\x0f\x09\x0f\x0f\x01\x0f\x09\x09\x0f\x11\xc0\x00\x44\x95" } },
    .{ "RpcBindingInqAuthInfoExW", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingInqAuthInfoExW", .signature = "\x00\x08\x11\xa2\x55\x0f\x01\x0f\x11\x05\x0f\x09\x0f\x09\x0f\x0f\x01\x0f\x09\x09\x0f\x11\xc0\x00\x44\x95" } },
    .{ "RpcServerCompleteSecurityCallback", MethodRecord{ .library = "RPCRT4", .import = "RpcServerCompleteSecurityCallback", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x11\xa2\x55" } },
    .{ "RpcServerRegisterAuthInfoA", MethodRecord{ .library = "RPCRT4", .import = "RpcServerRegisterAuthInfoA", .signature = "\x00\x04\x11\xa2\x55\x11\x3d\x09\x12\xc0\x00\x44\x99\x0f\x01" } },
    .{ "RpcServerRegisterAuthInfoW", MethodRecord{ .library = "RPCRT4", .import = "RpcServerRegisterAuthInfoW", .signature = "\x00\x04\x11\xa2\x55\x11\x05\x09\x12\xc0\x00\x44\x99\x0f\x01" } },
    .{ "RpcBindingServerFromClient", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingServerFromClient", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x0f\x01" } },
    .{ "RpcRaiseException", MethodRecord{ .library = "RPCRT4", .import = "RpcRaiseException", .signature = "\x00\x01\x01\x11\xa2\x55" } },
    .{ "RpcTestCancel", MethodRecord{ .library = "RPCRT4", .import = "RpcTestCancel", .signature = "\x00\x00\x11\xa2\x55" } },
    .{ "RpcServerTestCancel", MethodRecord{ .library = "RPCRT4", .import = "RpcServerTestCancel", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "RpcCancelThread", MethodRecord{ .library = "RPCRT4", .import = "RpcCancelThread", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "RpcCancelThreadEx", MethodRecord{ .library = "RPCRT4", .import = "RpcCancelThreadEx", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x08" } },
    .{ "UuidCreate", MethodRecord{ .library = "RPCRT4", .import = "UuidCreate", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\x0d" } },
    .{ "UuidCreateSequential", MethodRecord{ .library = "RPCRT4", .import = "UuidCreateSequential", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\x0d" } },
    .{ "UuidToStringA", MethodRecord{ .library = "RPCRT4", .import = "UuidToStringA", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\x0d\x0f\x11\x3d" } },
    .{ "UuidFromStringA", MethodRecord{ .library = "RPCRT4", .import = "UuidFromStringA", .signature = "\x00\x02\x11\xa2\x55\x11\x3d\x0f\x11\x0d" } },
    .{ "UuidToStringW", MethodRecord{ .library = "RPCRT4", .import = "UuidToStringW", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "UuidFromStringW", MethodRecord{ .library = "RPCRT4", .import = "UuidFromStringW", .signature = "\x00\x02\x11\xa2\x55\x11\x05\x0f\x11\x0d" } },
    .{ "UuidCompare", MethodRecord{ .library = "RPCRT4", .import = "UuidCompare", .signature = "\x00\x03\x08\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\xa2\x55" } },
    .{ "UuidCreateNil", MethodRecord{ .library = "RPCRT4", .import = "UuidCreateNil", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\x0d" } },
    .{ "UuidEqual", MethodRecord{ .library = "RPCRT4", .import = "UuidEqual", .signature = "\x00\x03\x08\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\xa2\x55" } },
    .{ "UuidHash", MethodRecord{ .library = "RPCRT4", .import = "UuidHash", .signature = "\x00\x02\x07\x0f\x11\x0d\x0f\x11\xa2\x55" } },
    .{ "UuidIsNil", MethodRecord{ .library = "RPCRT4", .import = "UuidIsNil", .signature = "\x00\x02\x08\x0f\x11\x0d\x0f\x11\xa2\x55" } },
    .{ "RpcEpRegisterNoReplaceA", MethodRecord{ .library = "RPCRT4", .import = "RpcEpRegisterNoReplaceA", .signature = "\x00\x04\x11\xa2\x55\x0f\x01\x0f\x11\xc0\x00\x44\x5d\x0f\x11\xc0\x00\x44\x9d\x11\x3d" } },
    .{ "RpcEpRegisterNoReplaceW", MethodRecord{ .library = "RPCRT4", .import = "RpcEpRegisterNoReplaceW", .signature = "\x00\x04\x11\xa2\x55\x0f\x01\x0f\x11\xc0\x00\x44\x5d\x0f\x11\xc0\x00\x44\x9d\x11\x05" } },
    .{ "RpcEpRegisterA", MethodRecord{ .library = "RPCRT4", .import = "RpcEpRegisterA", .signature = "\x00\x04\x11\xa2\x55\x0f\x01\x0f\x11\xc0\x00\x44\x5d\x0f\x11\xc0\x00\x44\x9d\x11\x3d" } },
    .{ "RpcEpRegisterW", MethodRecord{ .library = "RPCRT4", .import = "RpcEpRegisterW", .signature = "\x00\x04\x11\xa2\x55\x0f\x01\x0f\x11\xc0\x00\x44\x5d\x0f\x11\xc0\x00\x44\x9d\x11\x05" } },
    .{ "RpcEpUnregister", MethodRecord{ .library = "RPCRT4", .import = "RpcEpUnregister", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x0f\x11\xc0\x00\x44\x5d\x0f\x11\xc0\x00\x44\x9d" } },
    .{ "DceErrorInqTextA", MethodRecord{ .library = "RPCRT4", .import = "DceErrorInqTextA", .signature = "\x00\x02\x11\xa2\x55\x11\xa2\x55\x11\x3d" } },
    .{ "DceErrorInqTextW", MethodRecord{ .library = "RPCRT4", .import = "DceErrorInqTextW", .signature = "\x00\x02\x11\xa2\x55\x11\xa2\x55\x11\x05" } },
    .{ "RpcMgmtEpEltInqBegin", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtEpEltInqBegin", .signature = "\x00\x06\x11\xa2\x55\x0f\x01\x09\x0f\x11\xc0\x00\x44\x61\x09\x0f\x11\x0d\x0f\x0f\x0f\x01" } },
    .{ "RpcMgmtEpEltInqDone", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtEpEltInqDone", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x0f\x01" } },
    .{ "RpcMgmtEpEltInqNextA", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtEpEltInqNextA", .signature = "\x00\x05\x11\xa2\x55\x0f\x0f\x01\x0f\x11\xc0\x00\x44\x61\x0f\x0f\x01\x0f\x11\x0d\x0f\x11\x3d" } },
    .{ "RpcMgmtEpEltInqNextW", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtEpEltInqNextW", .signature = "\x00\x05\x11\xa2\x55\x0f\x0f\x01\x0f\x11\xc0\x00\x44\x61\x0f\x0f\x01\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "RpcMgmtEpUnregister", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtEpUnregister", .signature = "\x00\x04\x11\xa2\x55\x0f\x01\x0f\x11\xc0\x00\x44\x61\x0f\x01\x0f\x11\x0d" } },
    .{ "RpcMgmtSetAuthorizationFn", MethodRecord{ .library = "RPCRT4", .import = "RpcMgmtSetAuthorizationFn", .signature = "\x00\x01\x11\xa2\x55\x12\xc0\x00\x44\xa1" } },
    .{ "RpcExceptionFilter", MethodRecord{ .library = "RPCRT4", .import = "RpcExceptionFilter", .signature = "\x00\x01\x08\x09" } },
    .{ "RpcServerInterfaceGroupCreateW", MethodRecord{ .library = "RPCRT4", .import = "RpcServerInterfaceGroupCreateW", .signature = "\x00\x08\x11\xa2\x55\x0f\x11\xc0\x00\x44\xa5\x09\x0f\x11\xc0\x00\x44\xa9\x09\x09\x12\xc0\x00\x44\xad\x0f\x01\x0f\x0f\x01" } },
    .{ "RpcServerInterfaceGroupCreateA", MethodRecord{ .library = "RPCRT4", .import = "RpcServerInterfaceGroupCreateA", .signature = "\x00\x08\x11\xa2\x55\x0f\x11\xc0\x00\x44\xb1\x09\x0f\x11\xc0\x00\x44\xb5\x09\x09\x12\xc0\x00\x44\xad\x0f\x01\x0f\x0f\x01" } },
    .{ "RpcServerInterfaceGroupClose", MethodRecord{ .library = "RPCRT4", .import = "RpcServerInterfaceGroupClose", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "RpcServerInterfaceGroupActivate", MethodRecord{ .library = "RPCRT4", .import = "RpcServerInterfaceGroupActivate", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "RpcServerInterfaceGroupDeactivate", MethodRecord{ .library = "RPCRT4", .import = "RpcServerInterfaceGroupDeactivate", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x09" } },
    .{ "RpcServerInterfaceGroupInqBindings", MethodRecord{ .library = "RPCRT4", .import = "RpcServerInterfaceGroupInqBindings", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x0f\x11\xc0\x00\x44\x5d" } },
    .{ "I_RpcNegotiateTransferSyntax", MethodRecord{ .library = "RPCRT4", .import = "I_RpcNegotiateTransferSyntax", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "I_RpcGetBuffer", MethodRecord{ .library = "RPCRT4", .import = "I_RpcGetBuffer", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "I_RpcGetBufferWithObject", MethodRecord{ .library = "RPCRT4", .import = "I_RpcGetBufferWithObject", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\xc0\x00\x44\xb9\x0f\x11\x0d" } },
    .{ "I_RpcSendReceive", MethodRecord{ .library = "RPCRT4", .import = "I_RpcSendReceive", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "I_RpcFreeBuffer", MethodRecord{ .library = "RPCRT4", .import = "I_RpcFreeBuffer", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "I_RpcSend", MethodRecord{ .library = "RPCRT4", .import = "I_RpcSend", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "I_RpcReceive", MethodRecord{ .library = "RPCRT4", .import = "I_RpcReceive", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\xc0\x00\x44\xb9\x09" } },
    .{ "I_RpcFreePipeBuffer", MethodRecord{ .library = "RPCRT4", .import = "I_RpcFreePipeBuffer", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "I_RpcReallocPipeBuffer", MethodRecord{ .library = "RPCRT4", .import = "I_RpcReallocPipeBuffer", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\xc0\x00\x44\xb9\x09" } },
    .{ "I_RpcRequestMutex", MethodRecord{ .library = "RPCRT4", .import = "I_RpcRequestMutex", .signature = "\x00\x01\x01\x0f\x0f\x01" } },
    .{ "I_RpcClearMutex", MethodRecord{ .library = "RPCRT4", .import = "I_RpcClearMutex", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "I_RpcDeleteMutex", MethodRecord{ .library = "RPCRT4", .import = "I_RpcDeleteMutex", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "I_RpcAllocate", MethodRecord{ .library = "RPCRT4", .import = "I_RpcAllocate", .signature = "\x00\x01\x0f\x01\x09" } },
    .{ "I_RpcFree", MethodRecord{ .library = "RPCRT4", .import = "I_RpcFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "I_RpcPauseExecution", MethodRecord{ .library = "RPCRT4", .import = "I_RpcPauseExecution", .signature = "\x00\x01\x01\x09" } },
    .{ "I_RpcGetExtendedError", MethodRecord{ .library = "RPCRT4", .import = "I_RpcGetExtendedError", .signature = "\x00\x00\x11\xa2\x55" } },
    .{ "I_RpcSystemHandleTypeSpecificWork", MethodRecord{ .library = "RPCRT4", .import = "I_RpcSystemHandleTypeSpecificWork", .signature = "\x00\x04\x11\xa2\x55\x0f\x01\x05\x05\x11\xc0\x00\x44\xbd" } },
    .{ "I_RpcGetCurrentCallHandle", MethodRecord{ .library = "RPCRT4", .import = "I_RpcGetCurrentCallHandle", .signature = "\x00\x00\x0f\x01" } },
    .{ "I_RpcNsInterfaceExported", MethodRecord{ .library = "RPCRT4", .import = "I_RpcNsInterfaceExported", .signature = "\x00\x03\x11\xa2\x55\x09\x0f\x07\x0f\x11\xc0\x00\x44\xc1" } },
    .{ "I_RpcNsInterfaceUnexported", MethodRecord{ .library = "RPCRT4", .import = "I_RpcNsInterfaceUnexported", .signature = "\x00\x03\x11\xa2\x55\x09\x0f\x07\x0f\x11\xc0\x00\x44\xc1" } },
    .{ "I_RpcBindingToStaticStringBindingW", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingToStaticStringBindingW", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x0f\x07" } },
    .{ "I_RpcBindingInqSecurityContext", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingInqSecurityContext", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x0f\x01" } },
    .{ "I_RpcBindingInqSecurityContextKeyInfo", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingInqSecurityContextKeyInfo", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x01" } },
    .{ "I_RpcBindingInqWireIdForSnego", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingInqWireIdForSnego", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x05" } },
    .{ "I_RpcBindingInqMarshalledTargetInfo", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingInqMarshalledTargetInfo", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x0f\x09\x0f\x11\x3d" } },
    .{ "I_RpcBindingInqLocalClientPID", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingInqLocalClientPID", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x09" } },
    .{ "I_RpcBindingHandleToAsyncHandle", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingHandleToAsyncHandle", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x0f\x01" } },
    .{ "I_RpcNsBindingSetEntryNameW", MethodRecord{ .library = "RPCRT4", .import = "I_RpcNsBindingSetEntryNameW", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x09\x11\x05" } },
    .{ "I_RpcNsBindingSetEntryNameA", MethodRecord{ .library = "RPCRT4", .import = "I_RpcNsBindingSetEntryNameA", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x09\x11\x3d" } },
    .{ "I_RpcServerUseProtseqEp2A", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerUseProtseqEp2A", .signature = "\x00\x06\x11\xa2\x55\x11\x3d\x11\x3d\x09\x11\x3d\x0f\x01\x0f\x01" } },
    .{ "I_RpcServerUseProtseqEp2W", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerUseProtseqEp2W", .signature = "\x00\x06\x11\xa2\x55\x11\x05\x11\x05\x09\x11\x05\x0f\x01\x0f\x01" } },
    .{ "I_RpcServerUseProtseq2W", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerUseProtseq2W", .signature = "\x00\x05\x11\xa2\x55\x11\x05\x11\x05\x09\x0f\x01\x0f\x01" } },
    .{ "I_RpcServerUseProtseq2A", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerUseProtseq2A", .signature = "\x00\x05\x11\xa2\x55\x11\x3d\x11\x3d\x09\x0f\x01\x0f\x01" } },
    .{ "I_RpcServerStartService", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerStartService", .signature = "\x00\x03\x11\xa2\x55\x11\x05\x11\x05\x0f\x01" } },
    .{ "I_RpcBindingInqDynamicEndpointW", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingInqDynamicEndpointW", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x11\x05" } },
    .{ "I_RpcBindingInqDynamicEndpointA", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingInqDynamicEndpointA", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x11\x3d" } },
    .{ "I_RpcServerCheckClientRestriction", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerCheckClientRestriction", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "I_RpcBindingInqTransportType", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingInqTransportType", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x09" } },
    .{ "I_RpcIfInqTransferSyntaxes", MethodRecord{ .library = "RPCRT4", .import = "I_RpcIfInqTransferSyntaxes", .signature = "\x00\x04\x11\xa2\x55\x0f\x01\x0f\x11\xc0\x00\x44\xc5\x09\x0f\x09" } },
    .{ "I_UuidCreate", MethodRecord{ .library = "RPCRT4", .import = "I_UuidCreate", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\x0d" } },
    .{ "I_RpcBindingCopy", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingCopy", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x0f\x01" } },
    .{ "I_RpcBindingIsClientLocal", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingIsClientLocal", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x09" } },
    .{ "I_RpcBindingCreateNP", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingCreateNP", .signature = "\x00\x04\x11\xa2\x55\x11\x05\x11\x05\x11\x05\x0f\x0f\x01" } },
    .{ "I_RpcSsDontSerializeContext", MethodRecord{ .library = "RPCRT4", .import = "I_RpcSsDontSerializeContext", .signature = "\x00\x00\x01" } },
    .{ "I_RpcServerRegisterForwardFunction", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerRegisterForwardFunction", .signature = "\x00\x01\x11\xa2\x55\x0f\x12\xc0\x00\x44\xc9" } },
    .{ "I_RpcServerInqAddressChangeFn", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerInqAddressChangeFn", .signature = "\x00\x00\x0f\x12\xc0\x00\x44\xcd" } },
    .{ "I_RpcServerSetAddressChangeFn", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerSetAddressChangeFn", .signature = "\x00\x01\x11\xa2\x55\x0f\x12\xc0\x00\x44\xcd" } },
    .{ "I_RpcServerInqLocalConnAddress", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerInqLocalConnAddress", .signature = "\x00\x04\x11\xa2\x55\x0f\x01\x0f\x01\x0f\x09\x0f\x09" } },
    .{ "I_RpcServerInqRemoteConnAddress", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerInqRemoteConnAddress", .signature = "\x00\x04\x11\xa2\x55\x0f\x01\x0f\x01\x0f\x09\x0f\x09" } },
    .{ "I_RpcSessionStrictContextHandle", MethodRecord{ .library = "RPCRT4", .import = "I_RpcSessionStrictContextHandle", .signature = "\x00\x00\x01" } },
    .{ "I_RpcTurnOnEEInfoPropagation", MethodRecord{ .library = "RPCRT4", .import = "I_RpcTurnOnEEInfoPropagation", .signature = "\x00\x00\x11\xa2\x55" } },
    .{ "I_RpcServerInqTransportType", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerInqTransportType", .signature = "\x00\x01\x11\xa2\x55\x0f\x09" } },
    .{ "I_RpcMapWin32Status", MethodRecord{ .library = "RPCRT4", .import = "I_RpcMapWin32Status", .signature = "\x00\x01\x08\x11\xa2\x55" } },
    .{ "I_RpcRecordCalloutFailure", MethodRecord{ .library = "RPCRT4", .import = "I_RpcRecordCalloutFailure", .signature = "\x00\x03\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd1\x0f\x07" } },
    .{ "I_RpcMgmtEnableDedicatedThreadPool", MethodRecord{ .library = "RPCRT4", .import = "I_RpcMgmtEnableDedicatedThreadPool", .signature = "\x00\x00\x11\xa2\x55" } },
    .{ "I_RpcGetDefaultSD", MethodRecord{ .library = "RPCRT4", .import = "I_RpcGetDefaultSD", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x01" } },
    .{ "I_RpcOpenClientProcess", MethodRecord{ .library = "RPCRT4", .import = "I_RpcOpenClientProcess", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x09\x0f\x0f\x01" } },
    .{ "I_RpcBindingIsServerLocal", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingIsServerLocal", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x09" } },
    .{ "I_RpcBindingSetPrivateOption", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingSetPrivateOption", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x09\x19" } },
    .{ "I_RpcServerSubscribeForDisconnectNotification", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerSubscribeForDisconnectNotification", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x01" } },
    .{ "I_RpcServerGetAssociationID", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerGetAssociationID", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x09" } },
    .{ "I_RpcServerDisableExceptionFilter", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerDisableExceptionFilter", .signature = "\x00\x00\x08" } },
    .{ "I_RpcServerSubscribeForDisconnectNotification2", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerSubscribeForDisconnectNotification2", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x0f\x01\x0f\x11\x0d" } },
    .{ "I_RpcServerUnsubscribeForDisconnectNotification", MethodRecord{ .library = "RPCRT4", .import = "I_RpcServerUnsubscribeForDisconnectNotification", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x11\x0d" } },
    .{ "RpcNsBindingExportA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingExportA", .signature = "\x00\x05\x11\xa2\x55\x09\x11\x3d\x0f\x01\x0f\x11\xc0\x00\x44\x5d\x0f\x11\xc0\x00\x44\x9d" } },
    .{ "RpcNsBindingUnexportA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingUnexportA", .signature = "\x00\x04\x11\xa2\x55\x09\x11\x3d\x0f\x01\x0f\x11\xc0\x00\x44\x9d" } },
    .{ "RpcNsBindingExportW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingExportW", .signature = "\x00\x05\x11\xa2\x55\x09\x11\x05\x0f\x01\x0f\x11\xc0\x00\x44\x5d\x0f\x11\xc0\x00\x44\x9d" } },
    .{ "RpcNsBindingUnexportW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingUnexportW", .signature = "\x00\x04\x11\xa2\x55\x09\x11\x05\x0f\x01\x0f\x11\xc0\x00\x44\x9d" } },
    .{ "RpcNsBindingExportPnPA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingExportPnPA", .signature = "\x00\x04\x11\xa2\x55\x09\x11\x3d\x0f\x01\x0f\x11\xc0\x00\x44\x9d" } },
    .{ "RpcNsBindingUnexportPnPA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingUnexportPnPA", .signature = "\x00\x04\x11\xa2\x55\x09\x11\x3d\x0f\x01\x0f\x11\xc0\x00\x44\x9d" } },
    .{ "RpcNsBindingExportPnPW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingExportPnPW", .signature = "\x00\x04\x11\xa2\x55\x09\x11\x05\x0f\x01\x0f\x11\xc0\x00\x44\x9d" } },
    .{ "RpcNsBindingUnexportPnPW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingUnexportPnPW", .signature = "\x00\x04\x11\xa2\x55\x09\x11\x05\x0f\x01\x0f\x11\xc0\x00\x44\x9d" } },
    .{ "RpcNsBindingLookupBeginA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingLookupBeginA", .signature = "\x00\x06\x11\xa2\x55\x09\x11\x3d\x0f\x01\x0f\x11\x0d\x09\x0f\x0f\x01" } },
    .{ "RpcNsBindingLookupBeginW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingLookupBeginW", .signature = "\x00\x06\x11\xa2\x55\x09\x11\x05\x0f\x01\x0f\x11\x0d\x09\x0f\x0f\x01" } },
    .{ "RpcNsBindingLookupNext", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingLookupNext", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x0f\x11\xc0\x00\x44\x5d" } },
    .{ "RpcNsBindingLookupDone", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingLookupDone", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x01" } },
    .{ "RpcNsGroupDeleteA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsGroupDeleteA", .signature = "\x00\x02\x11\xa2\x55\x11\xa2\x59\x11\x3d" } },
    .{ "RpcNsGroupMbrAddA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsGroupMbrAddA", .signature = "\x00\x04\x11\xa2\x55\x09\x11\x3d\x09\x11\x3d" } },
    .{ "RpcNsGroupMbrRemoveA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsGroupMbrRemoveA", .signature = "\x00\x04\x11\xa2\x55\x09\x11\x3d\x09\x11\x3d" } },
    .{ "RpcNsGroupMbrInqBeginA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsGroupMbrInqBeginA", .signature = "\x00\x04\x11\xa2\x55\x09\x11\x3d\x09\x0f\x0f\x01" } },
    .{ "RpcNsGroupMbrInqNextA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsGroupMbrInqNextA", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x11\x3d" } },
    .{ "RpcNsGroupDeleteW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsGroupDeleteW", .signature = "\x00\x02\x11\xa2\x55\x11\xa2\x59\x11\x05" } },
    .{ "RpcNsGroupMbrAddW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsGroupMbrAddW", .signature = "\x00\x04\x11\xa2\x55\x09\x11\x05\x09\x11\x05" } },
    .{ "RpcNsGroupMbrRemoveW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsGroupMbrRemoveW", .signature = "\x00\x04\x11\xa2\x55\x09\x11\x05\x09\x11\x05" } },
    .{ "RpcNsGroupMbrInqBeginW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsGroupMbrInqBeginW", .signature = "\x00\x04\x11\xa2\x55\x09\x11\x05\x09\x0f\x0f\x01" } },
    .{ "RpcNsGroupMbrInqNextW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsGroupMbrInqNextW", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x11\x05" } },
    .{ "RpcNsGroupMbrInqDone", MethodRecord{ .library = "RPCNS4", .import = "RpcNsGroupMbrInqDone", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x01" } },
    .{ "RpcNsProfileDeleteA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsProfileDeleteA", .signature = "\x00\x02\x11\xa2\x55\x09\x11\x3d" } },
    .{ "RpcNsProfileEltAddA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsProfileEltAddA", .signature = "\x00\x07\x11\xa2\x55\x09\x11\x3d\x0f\x11\xc0\x00\x44\x61\x09\x11\x3d\x09\x11\x3d" } },
    .{ "RpcNsProfileEltRemoveA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsProfileEltRemoveA", .signature = "\x00\x05\x11\xa2\x55\x09\x11\x3d\x0f\x11\xc0\x00\x44\x61\x09\x11\x3d" } },
    .{ "RpcNsProfileEltInqBeginA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsProfileEltInqBeginA", .signature = "\x00\x08\x11\xa2\x55\x09\x11\x3d\x09\x0f\x11\xc0\x00\x44\x61\x09\x09\x11\x3d\x0f\x0f\x01" } },
    .{ "RpcNsProfileEltInqNextA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsProfileEltInqNextA", .signature = "\x00\x05\x11\xa2\x55\x0f\x01\x0f\x11\xc0\x00\x44\x61\x0f\x11\x3d\x0f\x09\x0f\x11\x3d" } },
    .{ "RpcNsProfileDeleteW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsProfileDeleteW", .signature = "\x00\x02\x11\xa2\x55\x09\x11\x05" } },
    .{ "RpcNsProfileEltAddW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsProfileEltAddW", .signature = "\x00\x07\x11\xa2\x55\x09\x11\x05\x0f\x11\xc0\x00\x44\x61\x09\x11\x05\x09\x11\x05" } },
    .{ "RpcNsProfileEltRemoveW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsProfileEltRemoveW", .signature = "\x00\x05\x11\xa2\x55\x09\x11\x05\x0f\x11\xc0\x00\x44\x61\x09\x11\x05" } },
    .{ "RpcNsProfileEltInqBeginW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsProfileEltInqBeginW", .signature = "\x00\x08\x11\xa2\x55\x09\x11\x05\x09\x0f\x11\xc0\x00\x44\x61\x09\x09\x11\x05\x0f\x0f\x01" } },
    .{ "RpcNsProfileEltInqNextW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsProfileEltInqNextW", .signature = "\x00\x05\x11\xa2\x55\x0f\x01\x0f\x11\xc0\x00\x44\x61\x0f\x11\x05\x0f\x09\x0f\x11\x05" } },
    .{ "RpcNsProfileEltInqDone", MethodRecord{ .library = "RPCNS4", .import = "RpcNsProfileEltInqDone", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x01" } },
    .{ "RpcNsEntryObjectInqBeginA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsEntryObjectInqBeginA", .signature = "\x00\x03\x11\xa2\x55\x09\x11\x3d\x0f\x0f\x01" } },
    .{ "RpcNsEntryObjectInqBeginW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsEntryObjectInqBeginW", .signature = "\x00\x03\x11\xa2\x55\x09\x11\x05\x0f\x0f\x01" } },
    .{ "RpcNsEntryObjectInqNext", MethodRecord{ .library = "RPCNS4", .import = "RpcNsEntryObjectInqNext", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x11\x0d" } },
    .{ "RpcNsEntryObjectInqDone", MethodRecord{ .library = "RPCNS4", .import = "RpcNsEntryObjectInqDone", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x01" } },
    .{ "RpcNsEntryExpandNameA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsEntryExpandNameA", .signature = "\x00\x03\x11\xa2\x55\x09\x11\x3d\x0f\x11\x3d" } },
    .{ "RpcNsMgmtBindingUnexportA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsMgmtBindingUnexportA", .signature = "\x00\x05\x11\xa2\x55\x09\x11\x3d\x0f\x11\xc0\x00\x44\x61\x09\x0f\x11\xc0\x00\x44\x9d" } },
    .{ "RpcNsMgmtEntryCreateA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsMgmtEntryCreateA", .signature = "\x00\x02\x11\xa2\x55\x09\x11\x3d" } },
    .{ "RpcNsMgmtEntryDeleteA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsMgmtEntryDeleteA", .signature = "\x00\x02\x11\xa2\x55\x09\x11\x3d" } },
    .{ "RpcNsMgmtEntryInqIfIdsA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsMgmtEntryInqIfIdsA", .signature = "\x00\x03\x11\xa2\x55\x09\x11\x3d\x0f\x0f\x11\xc0\x00\x44\x7d" } },
    .{ "RpcNsMgmtHandleSetExpAge", MethodRecord{ .library = "RPCNS4", .import = "RpcNsMgmtHandleSetExpAge", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x09" } },
    .{ "RpcNsMgmtInqExpAge", MethodRecord{ .library = "RPCNS4", .import = "RpcNsMgmtInqExpAge", .signature = "\x00\x01\x11\xa2\x55\x0f\x09" } },
    .{ "RpcNsMgmtSetExpAge", MethodRecord{ .library = "RPCNS4", .import = "RpcNsMgmtSetExpAge", .signature = "\x00\x01\x11\xa2\x55\x09" } },
    .{ "RpcNsEntryExpandNameW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsEntryExpandNameW", .signature = "\x00\x03\x11\xa2\x55\x09\x11\x05\x0f\x11\x05" } },
    .{ "RpcNsMgmtBindingUnexportW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsMgmtBindingUnexportW", .signature = "\x00\x05\x11\xa2\x55\x09\x11\x05\x0f\x11\xc0\x00\x44\x61\x09\x0f\x11\xc0\x00\x44\x9d" } },
    .{ "RpcNsMgmtEntryCreateW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsMgmtEntryCreateW", .signature = "\x00\x02\x11\xa2\x55\x09\x11\x05" } },
    .{ "RpcNsMgmtEntryDeleteW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsMgmtEntryDeleteW", .signature = "\x00\x02\x11\xa2\x55\x09\x11\x05" } },
    .{ "RpcNsMgmtEntryInqIfIdsW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsMgmtEntryInqIfIdsW", .signature = "\x00\x03\x11\xa2\x55\x09\x11\x05\x0f\x0f\x11\xc0\x00\x44\x7d" } },
    .{ "RpcNsBindingImportBeginA", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingImportBeginA", .signature = "\x00\x05\x11\xa2\x55\x09\x11\x3d\x0f\x01\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "RpcNsBindingImportBeginW", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingImportBeginW", .signature = "\x00\x05\x11\xa2\x55\x09\x11\x05\x0f\x01\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "RpcNsBindingImportNext", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingImportNext", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x0f\x01" } },
    .{ "RpcNsBindingImportDone", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingImportDone", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x01" } },
    .{ "RpcNsBindingSelect", MethodRecord{ .library = "RPCNS4", .import = "RpcNsBindingSelect", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\xc0\x00\x44\x5d\x0f\x0f\x01" } },
    .{ "RpcAsyncRegisterInfo", MethodRecord{ .library = "RPCRT4", .import = "RpcAsyncRegisterInfo", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd5" } },
    .{ "RpcAsyncInitializeHandle", MethodRecord{ .library = "RPCRT4", .import = "RpcAsyncInitializeHandle", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd5\x09" } },
    .{ "RpcAsyncGetCallStatus", MethodRecord{ .library = "RPCRT4", .import = "RpcAsyncGetCallStatus", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd5" } },
    .{ "RpcAsyncCompleteCall", MethodRecord{ .library = "RPCRT4", .import = "RpcAsyncCompleteCall", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd5\x0f\x01" } },
    .{ "RpcAsyncAbortCall", MethodRecord{ .library = "RPCRT4", .import = "RpcAsyncAbortCall", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd5\x09" } },
    .{ "RpcAsyncCancelCall", MethodRecord{ .library = "RPCRT4", .import = "RpcAsyncCancelCall", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd5\x11\x59" } },
    .{ "RpcErrorStartEnumeration", MethodRecord{ .library = "RPCRT4", .import = "RpcErrorStartEnumeration", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd9" } },
    .{ "RpcErrorGetNextRecord", MethodRecord{ .library = "RPCRT4", .import = "RpcErrorGetNextRecord", .signature = "\x00\x03\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd9\x11\x59\x0f\x11\xc0\x00\x44\xdd" } },
    .{ "RpcErrorEndEnumeration", MethodRecord{ .library = "RPCRT4", .import = "RpcErrorEndEnumeration", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd9" } },
    .{ "RpcErrorResetEnumeration", MethodRecord{ .library = "RPCRT4", .import = "RpcErrorResetEnumeration", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd9" } },
    .{ "RpcErrorGetNumberOfRecords", MethodRecord{ .library = "RPCRT4", .import = "RpcErrorGetNumberOfRecords", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd9\x0f\x08" } },
    .{ "RpcErrorSaveErrorInfo", MethodRecord{ .library = "RPCRT4", .import = "RpcErrorSaveErrorInfo", .signature = "\x00\x03\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd9\x0f\x0f\x01\x0f\x19" } },
    .{ "RpcErrorLoadErrorInfo", MethodRecord{ .library = "RPCRT4", .import = "RpcErrorLoadErrorInfo", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x19\x0f\x11\xc0\x00\x44\xd9" } },
    .{ "RpcErrorAddRecord", MethodRecord{ .library = "RPCRT4", .import = "RpcErrorAddRecord", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xdd" } },
    .{ "RpcErrorClearInformation", MethodRecord{ .library = "RPCRT4", .import = "RpcErrorClearInformation", .signature = "\x00\x00\x01" } },
    .{ "RpcGetAuthorizationContextForClient", MethodRecord{ .library = "RPCRT4", .import = "RpcGetAuthorizationContextForClient", .signature = "\x00\x08\x11\xa2\x55\x0f\x01\x11\x59\x0f\x01\x0f\x0a\x11\x93\x69\x09\x0f\x01\x0f\x0f\x01" } },
    .{ "RpcFreeAuthorizationContext", MethodRecord{ .library = "RPCRT4", .import = "RpcFreeAuthorizationContext", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x01" } },
    .{ "RpcSsContextLockExclusive", MethodRecord{ .library = "RPCRT4", .import = "RpcSsContextLockExclusive", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x01" } },
    .{ "RpcSsContextLockShared", MethodRecord{ .library = "RPCRT4", .import = "RpcSsContextLockShared", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x01" } },
    .{ "RpcServerInqCallAttributesW", MethodRecord{ .library = "RPCRT4", .import = "RpcServerInqCallAttributesW", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x01" } },
    .{ "RpcServerInqCallAttributesA", MethodRecord{ .library = "RPCRT4", .import = "RpcServerInqCallAttributesA", .signature = "\x00\x02\x11\xa2\x55\x0f\x01\x0f\x01" } },
    .{ "RpcServerSubscribeForNotification", MethodRecord{ .library = "RPCRT4", .import = "RpcServerSubscribeForNotification", .signature = "\x00\x04\x11\xa2\x55\x0f\x01\x11\xc0\x00\x44\xe1\x11\xc0\x00\x44\xe5\x0f\x11\xc0\x00\x44\xe9" } },
    .{ "RpcServerUnsubscribeForNotification", MethodRecord{ .library = "RPCRT4", .import = "RpcServerUnsubscribeForNotification", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x11\xc0\x00\x44\xe1\x0f\x09" } },
    .{ "RpcBindingBind", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingBind", .signature = "\x00\x03\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd5\x0f\x01\x0f\x01" } },
    .{ "RpcBindingUnbind", MethodRecord{ .library = "RPCRT4", .import = "RpcBindingUnbind", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "I_RpcAsyncSetHandle", MethodRecord{ .library = "RPCRT4", .import = "I_RpcAsyncSetHandle", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\xc0\x00\x44\xb9\x0f\x11\xc0\x00\x44\xd5" } },
    .{ "I_RpcAsyncAbortCall", MethodRecord{ .library = "RPCRT4", .import = "I_RpcAsyncAbortCall", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\xc0\x00\x44\xd5\x09" } },
    .{ "I_RpcExceptionFilter", MethodRecord{ .library = "RPCRT4", .import = "I_RpcExceptionFilter", .signature = "\x00\x01\x08\x09" } },
    .{ "I_RpcBindingInqClientTokenAttributes", MethodRecord{ .library = "RPCRT4", .import = "I_RpcBindingInqClientTokenAttributes", .signature = "\x00\x04\x11\xa2\x55\x0f\x01\x0f\x11\x93\x69\x0f\x11\x93\x69\x0f\x11\x93\x69" } },
    .{ "I_RpcNsGetBuffer", MethodRecord{ .library = "RPCNS4", .import = "I_RpcNsGetBuffer", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "I_RpcNsSendReceive", MethodRecord{ .library = "RPCNS4", .import = "I_RpcNsSendReceive", .signature = "\x00\x02\x11\xa2\x55\x0f\x11\xc0\x00\x44\xb9\x0f\x0f\x01" } },
    .{ "I_RpcNsRaiseException", MethodRecord{ .library = "RPCNS4", .import = "I_RpcNsRaiseException", .signature = "\x00\x02\x01\x0f\x11\xc0\x00\x44\xb9\x11\xa2\x55" } },
    .{ "I_RpcReBindBuffer", MethodRecord{ .library = "RPCNS4", .import = "I_RpcReBindBuffer", .signature = "\x00\x01\x11\xa2\x55\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "NDRCContextBinding", MethodRecord{ .library = "RPCRT4", .import = "NDRCContextBinding", .signature = "\x00\x01\x0f\x01\x18" } },
    .{ "NDRCContextMarshall", MethodRecord{ .library = "RPCRT4", .import = "NDRCContextMarshall", .signature = "\x00\x02\x01\x18\x0f\x01" } },
    .{ "NDRCContextUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NDRCContextUnmarshall", .signature = "\x00\x04\x01\x0f\x18\x0f\x01\x0f\x01\x09" } },
    .{ "NDRSContextMarshall", MethodRecord{ .library = "RPCRT4", .import = "NDRSContextMarshall", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xed\x0f\x01\x12\xc0\x00\x44\xf1" } },
    .{ "NDRSContextUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NDRSContextUnmarshall", .signature = "\x00\x02\x0f\x11\xc0\x00\x44\xed\x0f\x01\x09" } },
    .{ "NDRSContextMarshallEx", MethodRecord{ .library = "RPCRT4", .import = "NDRSContextMarshallEx", .signature = "\x00\x04\x01\x0f\x01\x0f\x11\xc0\x00\x44\xed\x0f\x01\x12\xc0\x00\x44\xf1" } },
    .{ "NDRSContextMarshall2", MethodRecord{ .library = "RPCRT4", .import = "NDRSContextMarshall2", .signature = "\x00\x06\x01\x0f\x01\x0f\x11\xc0\x00\x44\xed\x0f\x01\x12\xc0\x00\x44\xf1\x0f\x01\x09" } },
    .{ "NDRSContextUnmarshallEx", MethodRecord{ .library = "RPCRT4", .import = "NDRSContextUnmarshallEx", .signature = "\x00\x03\x0f\x11\xc0\x00\x44\xed\x0f\x01\x0f\x01\x09" } },
    .{ "NDRSContextUnmarshall2", MethodRecord{ .library = "RPCRT4", .import = "NDRSContextUnmarshall2", .signature = "\x00\x05\x0f\x11\xc0\x00\x44\xed\x0f\x01\x0f\x01\x09\x0f\x01\x09" } },
    .{ "RpcSsDestroyClientContext", MethodRecord{ .library = "RPCRT4", .import = "RpcSsDestroyClientContext", .signature = "\x00\x01\x01\x0f\x0f\x01" } },
    .{ "NdrSimpleTypeMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrSimpleTypeMarshall", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x05" } },
    .{ "NdrPointerMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrPointerMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrSimpleStructMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrSimpleStructMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConformantStructMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantStructMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConformantVaryingStructMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantVaryingStructMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrComplexStructMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrComplexStructMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrFixedArrayMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrFixedArrayMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConformantArrayMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantArrayMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConformantVaryingArrayMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantVaryingArrayMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrVaryingArrayMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrVaryingArrayMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrComplexArrayMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrComplexArrayMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrNonConformantStringMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrNonConformantStringMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConformantStringMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantStringMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrEncapsulatedUnionMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrEncapsulatedUnionMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrNonEncapsulatedUnionMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrNonEncapsulatedUnionMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrByteCountPointerMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrByteCountPointerMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrXmitOrRepAsMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrXmitOrRepAsMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrUserMarshalMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrUserMarshalMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrInterfacePointerMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrInterfacePointerMarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrClientContextMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrClientContextMarshall", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x18\x08" } },
    .{ "NdrServerContextMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrServerContextMarshall", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x11\xc0\x00\x44\xed\x12\xc0\x00\x44\xf1" } },
    .{ "NdrServerContextNewMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrServerContextNewMarshall", .signature = "\x00\x04\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x11\xc0\x00\x44\xed\x12\xc0\x00\x44\xf1\x0f\x05" } },
    .{ "NdrSimpleTypeUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrSimpleTypeUnmarshall", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x05" } },
    .{ "NdrRangeUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrRangeUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrCorrelationInitialize", MethodRecord{ .library = "RPCRT4", .import = "NdrCorrelationInitialize", .signature = "\x00\x04\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x01\x09\x09" } },
    .{ "NdrCorrelationPass", MethodRecord{ .library = "RPCRT4", .import = "NdrCorrelationPass", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x44\xf5" } },
    .{ "NdrCorrelationFree", MethodRecord{ .library = "RPCRT4", .import = "NdrCorrelationFree", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x44\xf5" } },
    .{ "NdrPointerUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrPointerUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrSimpleStructUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrSimpleStructUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrConformantStructUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantStructUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrConformantVaryingStructUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantVaryingStructUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrComplexStructUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrComplexStructUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrFixedArrayUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrFixedArrayUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrConformantArrayUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantArrayUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrConformantVaryingArrayUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantVaryingArrayUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrVaryingArrayUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrVaryingArrayUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrComplexArrayUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrComplexArrayUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrNonConformantStringUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrNonConformantStringUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrConformantStringUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantStringUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrEncapsulatedUnionUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrEncapsulatedUnionUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrNonEncapsulatedUnionUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrNonEncapsulatedUnionUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrByteCountPointerUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrByteCountPointerUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrXmitOrRepAsUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrXmitOrRepAsUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrUserMarshalUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrUserMarshalUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrInterfacePointerUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrInterfacePointerUnmarshall", .signature = "\x00\x04\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x05\x0f\x05\x05" } },
    .{ "NdrClientContextUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrClientContextUnmarshall", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x18\x0f\x01" } },
    .{ "NdrServerContextUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrServerContextUnmarshall", .signature = "\x00\x01\x0f\x11\xc0\x00\x44\xed\x0f\x11\xc0\x00\x44\xf5" } },
    .{ "NdrContextHandleInitialize", MethodRecord{ .library = "RPCRT4", .import = "NdrContextHandleInitialize", .signature = "\x00\x02\x0f\x11\xc0\x00\x44\xed\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrServerContextNewUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrServerContextNewUnmarshall", .signature = "\x00\x02\x0f\x11\xc0\x00\x44\xed\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrPointerBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrPointerBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrSimpleStructBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrSimpleStructBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConformantStructBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantStructBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConformantVaryingStructBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantVaryingStructBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrComplexStructBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrComplexStructBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrFixedArrayBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrFixedArrayBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConformantArrayBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantArrayBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConformantVaryingArrayBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantVaryingArrayBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrVaryingArrayBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrVaryingArrayBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrComplexArrayBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrComplexArrayBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConformantStringBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantStringBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrNonConformantStringBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrNonConformantStringBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrEncapsulatedUnionBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrEncapsulatedUnionBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrNonEncapsulatedUnionBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrNonEncapsulatedUnionBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrByteCountPointerBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrByteCountPointerBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrXmitOrRepAsBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrXmitOrRepAsBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrUserMarshalBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrUserMarshalBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrInterfacePointerBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrInterfacePointerBufferSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrContextHandleSize", MethodRecord{ .library = "RPCRT4", .import = "NdrContextHandleSize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrPointerMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrPointerMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrSimpleStructMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrSimpleStructMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrConformantStructMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantStructMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrConformantVaryingStructMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantVaryingStructMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrComplexStructMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrComplexStructMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrFixedArrayMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrFixedArrayMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrConformantArrayMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantArrayMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrConformantVaryingArrayMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantVaryingArrayMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrVaryingArrayMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrVaryingArrayMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrComplexArrayMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrComplexArrayMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrConformantStringMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantStringMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrNonConformantStringMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrNonConformantStringMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrEncapsulatedUnionMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrEncapsulatedUnionMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrNonEncapsulatedUnionMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrNonEncapsulatedUnionMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrXmitOrRepAsMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrXmitOrRepAsMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrUserMarshalMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrUserMarshalMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrInterfacePointerMemorySize", MethodRecord{ .library = "RPCRT4", .import = "NdrInterfacePointerMemorySize", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrPointerFree", MethodRecord{ .library = "RPCRT4", .import = "NdrPointerFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrSimpleStructFree", MethodRecord{ .library = "RPCRT4", .import = "NdrSimpleStructFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConformantStructFree", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantStructFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConformantVaryingStructFree", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantVaryingStructFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrComplexStructFree", MethodRecord{ .library = "RPCRT4", .import = "NdrComplexStructFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrFixedArrayFree", MethodRecord{ .library = "RPCRT4", .import = "NdrFixedArrayFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConformantArrayFree", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantArrayFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConformantVaryingArrayFree", MethodRecord{ .library = "RPCRT4", .import = "NdrConformantVaryingArrayFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrVaryingArrayFree", MethodRecord{ .library = "RPCRT4", .import = "NdrVaryingArrayFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrComplexArrayFree", MethodRecord{ .library = "RPCRT4", .import = "NdrComplexArrayFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrEncapsulatedUnionFree", MethodRecord{ .library = "RPCRT4", .import = "NdrEncapsulatedUnionFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrNonEncapsulatedUnionFree", MethodRecord{ .library = "RPCRT4", .import = "NdrNonEncapsulatedUnionFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrByteCountPointerFree", MethodRecord{ .library = "RPCRT4", .import = "NdrByteCountPointerFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrXmitOrRepAsFree", MethodRecord{ .library = "RPCRT4", .import = "NdrXmitOrRepAsFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrUserMarshalFree", MethodRecord{ .library = "RPCRT4", .import = "NdrUserMarshalFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrInterfacePointerFree", MethodRecord{ .library = "RPCRT4", .import = "NdrInterfacePointerFree", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x05" } },
    .{ "NdrConvert2", MethodRecord{ .library = "RPCRT4", .import = "NdrConvert2", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x08" } },
    .{ "NdrConvert", MethodRecord{ .library = "RPCRT4", .import = "NdrConvert", .signature = "\x00\x02\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrUserMarshalSimpleTypeConvert", MethodRecord{ .library = "RPCRT4", .import = "NdrUserMarshalSimpleTypeConvert", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x05" } },
    .{ "NdrClientInitializeNew", MethodRecord{ .library = "RPCRT4", .import = "NdrClientInitializeNew", .signature = "\x00\x04\x01\x0f\x11\xc0\x00\x44\xb9\x0f\x11\xc0\x00\x44\xf5\x0f\x11\xc0\x00\x44\xf9\x09" } },
    .{ "NdrServerInitializeNew", MethodRecord{ .library = "RPCRT4", .import = "NdrServerInitializeNew", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xb9\x0f\x11\xc0\x00\x44\xf5\x0f\x11\xc0\x00\x44\xf9" } },
    .{ "NdrServerInitializePartial", MethodRecord{ .library = "RPCRT4", .import = "NdrServerInitializePartial", .signature = "\x00\x04\x01\x0f\x11\xc0\x00\x44\xb9\x0f\x11\xc0\x00\x44\xf5\x0f\x11\xc0\x00\x44\xf9\x09" } },
    .{ "NdrClientInitialize", MethodRecord{ .library = "RPCRT4", .import = "NdrClientInitialize", .signature = "\x00\x04\x01\x0f\x11\xc0\x00\x44\xb9\x0f\x11\xc0\x00\x44\xf5\x0f\x11\xc0\x00\x44\xf9\x09" } },
    .{ "NdrServerInitialize", MethodRecord{ .library = "RPCRT4", .import = "NdrServerInitialize", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xb9\x0f\x11\xc0\x00\x44\xf5\x0f\x11\xc0\x00\x44\xf9" } },
    .{ "NdrServerInitializeUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrServerInitializeUnmarshall", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x11\xc0\x00\x44\xf9\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "NdrServerInitializeMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrServerInitializeMarshall", .signature = "\x00\x02\x01\x0f\x11\xc0\x00\x44\xb9\x0f\x11\xc0\x00\x44\xf5" } },
    .{ "NdrGetBuffer", MethodRecord{ .library = "RPCRT4", .import = "NdrGetBuffer", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x09\x0f\x01" } },
    .{ "NdrNsGetBuffer", MethodRecord{ .library = "RPCRT4", .import = "NdrNsGetBuffer", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x09\x0f\x01" } },
    .{ "NdrSendReceive", MethodRecord{ .library = "RPCRT4", .import = "NdrSendReceive", .signature = "\x00\x02\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05" } },
    .{ "NdrNsSendReceive", MethodRecord{ .library = "RPCRT4", .import = "NdrNsSendReceive", .signature = "\x00\x03\x0f\x05\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x0f\x01" } },
    .{ "NdrFreeBuffer", MethodRecord{ .library = "RPCRT4", .import = "NdrFreeBuffer", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x44\xf5" } },
    .{ "NdrGetDcomProtocolVersion", MethodRecord{ .library = "RPCRT4", .import = "NdrGetDcomProtocolVersion", .signature = "\x00\x02\x11\x79\x0f\x11\xc0\x00\x44\xf5\x0f\x11\xc0\x00\x44\xfd" } },
    .{ "NdrClientCall2", MethodRecord{ .library = "RPCRT4", .import = "NdrClientCall2", .signature = "\x05\x02\x11\xc0\x00\x45\x01\x0f\x11\xc0\x00\x44\xf9\x0f\x05" } },
    .{ "NdrAsyncClientCall", MethodRecord{ .library = "RPCRT4", .import = "NdrAsyncClientCall", .signature = "\x05\x02\x11\xc0\x00\x45\x01\x0f\x11\xc0\x00\x44\xf9\x0f\x05" } },
    .{ "NdrDcomAsyncClientCall", MethodRecord{ .library = "RPCRT4", .import = "NdrDcomAsyncClientCall", .signature = "\x05\x02\x11\xc0\x00\x45\x01\x0f\x11\xc0\x00\x44\xf9\x0f\x05" } },
    .{ "NdrAsyncServerCall", MethodRecord{ .library = "RPCRT4", .import = "NdrAsyncServerCall", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "NdrDcomAsyncStubCall", MethodRecord{ .library = "RPCRT4", .import = "NdrDcomAsyncStubCall", .signature = "\x00\x04\x08\x12\xc0\x00\x45\x05\x12\xc0\x00\x45\x09\x0f\x11\xc0\x00\x44\xb9\x0f\x09" } },
    .{ "NdrStubCall2", MethodRecord{ .library = "RPCRT4", .import = "NdrStubCall2", .signature = "\x00\x04\x08\x0f\x01\x0f\x01\x0f\x11\xc0\x00\x44\xb9\x0f\x09" } },
    .{ "NdrServerCall2", MethodRecord{ .library = "RPCRT4", .import = "NdrServerCall2", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "NdrMapCommAndFaultStatus", MethodRecord{ .library = "RPCRT4", .import = "NdrMapCommAndFaultStatus", .signature = "\x00\x04\x11\xa2\x55\x0f\x11\xc0\x00\x44\xf5\x0f\x09\x0f\x09\x11\xa2\x55" } },
    .{ "RpcSsAllocate", MethodRecord{ .library = "RPCRT4", .import = "RpcSsAllocate", .signature = "\x00\x01\x0f\x01\x19" } },
    .{ "RpcSsDisableAllocate", MethodRecord{ .library = "RPCRT4", .import = "RpcSsDisableAllocate", .signature = "\x00\x00\x01" } },
    .{ "RpcSsEnableAllocate", MethodRecord{ .library = "RPCRT4", .import = "RpcSsEnableAllocate", .signature = "\x00\x00\x01" } },
    .{ "RpcSsFree", MethodRecord{ .library = "RPCRT4", .import = "RpcSsFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "RpcSsGetThreadHandle", MethodRecord{ .library = "RPCRT4", .import = "RpcSsGetThreadHandle", .signature = "\x00\x00\x0f\x01" } },
    .{ "RpcSsSetClientAllocFree", MethodRecord{ .library = "RPCRT4", .import = "RpcSsSetClientAllocFree", .signature = "\x00\x02\x01\x12\xc0\x00\x45\x0d\x12\xc0\x00\x45\x11" } },
    .{ "RpcSsSetThreadHandle", MethodRecord{ .library = "RPCRT4", .import = "RpcSsSetThreadHandle", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "RpcSsSwapClientAllocFree", MethodRecord{ .library = "RPCRT4", .import = "RpcSsSwapClientAllocFree", .signature = "\x00\x04\x01\x12\xc0\x00\x45\x0d\x12\xc0\x00\x45\x11\x0f\x12\xc0\x00\x45\x0d\x0f\x12\xc0\x00\x45\x11" } },
    .{ "RpcSmAllocate", MethodRecord{ .library = "RPCRT4", .import = "RpcSmAllocate", .signature = "\x00\x02\x0f\x01\x19\x0f\x11\xa2\x55" } },
    .{ "RpcSmClientFree", MethodRecord{ .library = "RPCRT4", .import = "RpcSmClientFree", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "RpcSmDestroyClientContext", MethodRecord{ .library = "RPCRT4", .import = "RpcSmDestroyClientContext", .signature = "\x00\x01\x11\xa2\x55\x0f\x0f\x01" } },
    .{ "RpcSmDisableAllocate", MethodRecord{ .library = "RPCRT4", .import = "RpcSmDisableAllocate", .signature = "\x00\x00\x11\xa2\x55" } },
    .{ "RpcSmEnableAllocate", MethodRecord{ .library = "RPCRT4", .import = "RpcSmEnableAllocate", .signature = "\x00\x00\x11\xa2\x55" } },
    .{ "RpcSmFree", MethodRecord{ .library = "RPCRT4", .import = "RpcSmFree", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "RpcSmGetThreadHandle", MethodRecord{ .library = "RPCRT4", .import = "RpcSmGetThreadHandle", .signature = "\x00\x01\x0f\x01\x0f\x11\xa2\x55" } },
    .{ "RpcSmSetClientAllocFree", MethodRecord{ .library = "RPCRT4", .import = "RpcSmSetClientAllocFree", .signature = "\x00\x02\x11\xa2\x55\x12\xc0\x00\x45\x0d\x12\xc0\x00\x45\x11" } },
    .{ "RpcSmSetThreadHandle", MethodRecord{ .library = "RPCRT4", .import = "RpcSmSetThreadHandle", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "RpcSmSwapClientAllocFree", MethodRecord{ .library = "RPCRT4", .import = "RpcSmSwapClientAllocFree", .signature = "\x00\x04\x11\xa2\x55\x12\xc0\x00\x45\x0d\x12\xc0\x00\x45\x11\x0f\x12\xc0\x00\x45\x0d\x0f\x12\xc0\x00\x45\x11" } },
    .{ "NdrRpcSsEnableAllocate", MethodRecord{ .library = "RPCRT4", .import = "NdrRpcSsEnableAllocate", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x44\xf5" } },
    .{ "NdrRpcSsDisableAllocate", MethodRecord{ .library = "RPCRT4", .import = "NdrRpcSsDisableAllocate", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x44\xf5" } },
    .{ "NdrRpcSmSetClientToOsf", MethodRecord{ .library = "RPCRT4", .import = "NdrRpcSmSetClientToOsf", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x44\xf5" } },
    .{ "NdrRpcSmClientAllocate", MethodRecord{ .library = "RPCRT4", .import = "NdrRpcSmClientAllocate", .signature = "\x00\x01\x0f\x01\x19" } },
    .{ "NdrRpcSmClientFree", MethodRecord{ .library = "RPCRT4", .import = "NdrRpcSmClientFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "NdrRpcSsDefaultAllocate", MethodRecord{ .library = "RPCRT4", .import = "NdrRpcSsDefaultAllocate", .signature = "\x00\x01\x0f\x01\x19" } },
    .{ "NdrRpcSsDefaultFree", MethodRecord{ .library = "RPCRT4", .import = "NdrRpcSsDefaultFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "NdrFullPointerXlatInit", MethodRecord{ .library = "RPCRT4", .import = "NdrFullPointerXlatInit", .signature = "\x00\x02\x0f\x11\xc0\x00\x45\x15\x09\x11\xc0\x00\x45\x19" } },
    .{ "NdrFullPointerXlatFree", MethodRecord{ .library = "RPCRT4", .import = "NdrFullPointerXlatFree", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x45\x15" } },
    .{ "NdrAllocate", MethodRecord{ .library = "RPCRT4", .import = "NdrAllocate", .signature = "\x00\x02\x0f\x01\x0f\x11\xc0\x00\x44\xf5\x19" } },
    .{ "NdrClearOutParameters", MethodRecord{ .library = "RPCRT4", .import = "NdrClearOutParameters", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x05\x0f\x01" } },
    .{ "NdrOleAllocate", MethodRecord{ .library = "RPCRT4", .import = "NdrOleAllocate", .signature = "\x00\x01\x0f\x01\x19" } },
    .{ "NdrOleFree", MethodRecord{ .library = "RPCRT4", .import = "NdrOleFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "NdrGetUserMarshalInfo", MethodRecord{ .library = "RPCRT4", .import = "NdrGetUserMarshalInfo", .signature = "\x00\x03\x11\xa2\x55\x0f\x09\x09\x0f\x11\xc0\x00\x45\x1d" } },
    .{ "NdrCreateServerInterfaceFromStub", MethodRecord{ .library = "RPCRT4", .import = "NdrCreateServerInterfaceFromStub", .signature = "\x00\x02\x11\xa2\x55\x12\xc0\x00\x45\x05\x0f\x11\xc0\x00\x44\xc1" } },
    .{ "NdrClientCall3", MethodRecord{ .library = "RPCRT4", .import = "NdrClientCall3", .signature = "\x05\x03\x11\xc0\x00\x45\x01\x0f\x11\xc0\x00\x45\x21\x09\x0f\x01" } },
    .{ "Ndr64AsyncClientCall", MethodRecord{ .library = "RPCRT4", .import = "Ndr64AsyncClientCall", .signature = "\x05\x03\x11\xc0\x00\x45\x01\x0f\x11\xc0\x00\x45\x21\x09\x0f\x01" } },
    .{ "Ndr64DcomAsyncClientCall", MethodRecord{ .library = "RPCRT4", .import = "Ndr64DcomAsyncClientCall", .signature = "\x05\x03\x11\xc0\x00\x45\x01\x0f\x11\xc0\x00\x45\x21\x09\x0f\x01" } },
    .{ "Ndr64AsyncServerCall64", MethodRecord{ .library = "RPCRT4", .import = "Ndr64AsyncServerCall64", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "Ndr64AsyncServerCallAll", MethodRecord{ .library = "RPCRT4", .import = "Ndr64AsyncServerCallAll", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "Ndr64DcomAsyncStubCall", MethodRecord{ .library = "RPCRT4", .import = "Ndr64DcomAsyncStubCall", .signature = "\x00\x04\x08\x12\xc0\x00\x45\x05\x12\xc0\x00\x45\x09\x0f\x11\xc0\x00\x44\xb9\x0f\x09" } },
    .{ "NdrStubCall3", MethodRecord{ .library = "RPCRT4", .import = "NdrStubCall3", .signature = "\x00\x04\x08\x0f\x01\x0f\x01\x0f\x11\xc0\x00\x44\xb9\x0f\x09" } },
    .{ "NdrServerCallAll", MethodRecord{ .library = "RPCRT4", .import = "NdrServerCallAll", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "NdrServerCallNdr64", MethodRecord{ .library = "RPCRT4", .import = "NdrServerCallNdr64", .signature = "\x00\x01\x01\x0f\x11\xc0\x00\x44\xb9" } },
    .{ "NdrPartialIgnoreClientMarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrPartialIgnoreClientMarshall", .signature = "\x00\x02\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x01" } },
    .{ "NdrPartialIgnoreServerUnmarshall", MethodRecord{ .library = "RPCRT4", .import = "NdrPartialIgnoreServerUnmarshall", .signature = "\x00\x02\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x01" } },
    .{ "NdrPartialIgnoreClientBufferSize", MethodRecord{ .library = "RPCRT4", .import = "NdrPartialIgnoreClientBufferSize", .signature = "\x00\x02\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x01" } },
    .{ "NdrPartialIgnoreServerInitialize", MethodRecord{ .library = "RPCRT4", .import = "NdrPartialIgnoreServerInitialize", .signature = "\x00\x03\x01\x0f\x11\xc0\x00\x44\xf5\x0f\x0f\x01\x0f\x05" } },
    .{ "RpcUserFree", MethodRecord{ .library = "RPCRT4", .import = "RpcUserFree", .signature = "\x00\x02\x01\x0f\x01\x0f\x01" } },
    .{ "MesEncodeIncrementalHandleCreate", MethodRecord{ .library = "RPCRT4", .import = "MesEncodeIncrementalHandleCreate", .signature = "\x00\x04\x11\xa2\x55\x0f\x01\x12\xc0\x00\x45\x25\x12\xc0\x00\x45\x29\x0f\x0f\x01" } },
    .{ "MesDecodeIncrementalHandleCreate", MethodRecord{ .library = "RPCRT4", .import = "MesDecodeIncrementalHandleCreate", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x12\xc0\x00\x45\x2d\x0f\x0f\x01" } },
    .{ "MesIncrementalHandleReset", MethodRecord{ .library = "RPCRT4", .import = "MesIncrementalHandleReset", .signature = "\x00\x06\x11\xa2\x55\x0f\x01\x0f\x01\x12\xc0\x00\x45\x25\x12\xc0\x00\x45\x29\x12\xc0\x00\x45\x2d\x11\xc0\x00\x45\x31" } },
    .{ "MesEncodeFixedBufferHandleCreate", MethodRecord{ .library = "RPCRT4", .import = "MesEncodeFixedBufferHandleCreate", .signature = "\x00\x04\x11\xa2\x55\x11\x3d\x09\x0f\x09\x0f\x0f\x01" } },
    .{ "MesEncodeDynBufferHandleCreate", MethodRecord{ .library = "RPCRT4", .import = "MesEncodeDynBufferHandleCreate", .signature = "\x00\x03\x11\xa2\x55\x0f\x0f\x04\x0f\x09\x0f\x0f\x01" } },
    .{ "MesDecodeBufferHandleCreate", MethodRecord{ .library = "RPCRT4", .import = "MesDecodeBufferHandleCreate", .signature = "\x00\x03\x11\xa2\x55\x11\x3d\x09\x0f\x0f\x01" } },
    .{ "MesBufferHandleReset", MethodRecord{ .library = "RPCRT4", .import = "MesBufferHandleReset", .signature = "\x00\x06\x11\xa2\x55\x0f\x01\x09\x11\xc0\x00\x45\x31\x0f\x0f\x04\x09\x0f\x09" } },
    .{ "MesHandleFree", MethodRecord{ .library = "RPCRT4", .import = "MesHandleFree", .signature = "\x00\x01\x11\xa2\x55\x0f\x01" } },
    .{ "MesInqProcEncodingId", MethodRecord{ .library = "RPCRT4", .import = "MesInqProcEncodingId", .signature = "\x00\x03\x11\xa2\x55\x0f\x01\x0f\x11\xc0\x00\x45\x35\x0f\x09" } },
    .{ "NdrMesSimpleTypeAlignSize", MethodRecord{ .library = "RPCRT4", .import = "NdrMesSimpleTypeAlignSize", .signature = "\x00\x01\x19\x0f\x01" } },
    .{ "NdrMesSimpleTypeDecode", MethodRecord{ .library = "RPCRT4", .import = "NdrMesSimpleTypeDecode", .signature = "\x00\x03\x01\x0f\x01\x0f\x01\x06" } },
    .{ "NdrMesSimpleTypeEncode", MethodRecord{ .library = "RPCRT4", .import = "NdrMesSimpleTypeEncode", .signature = "\x00\x04\x01\x0f\x01\x0f\x11\xc0\x00\x44\xf9\x0f\x01\x06" } },
    .{ "NdrMesTypeAlignSize", MethodRecord{ .library = "RPCRT4", .import = "NdrMesTypeAlignSize", .signature = "\x00\x04\x19\x0f\x01\x0f\x11\xc0\x00\x44\xf9\x0f\x05\x0f\x01" } },
    .{ "NdrMesTypeEncode", MethodRecord{ .library = "RPCRT4", .import = "NdrMesTypeEncode", .signature = "\x00\x04\x01\x0f\x01\x0f\x11\xc0\x00\x44\xf9\x0f\x05\x0f\x01" } },
    .{ "NdrMesTypeDecode", MethodRecord{ .library = "RPCRT4", .import = "NdrMesTypeDecode", .signature = "\x00\x04\x01\x0f\x01\x0f\x11\xc0\x00\x44\xf9\x0f\x05\x0f\x01" } },
    .{ "NdrMesTypeAlignSize2", MethodRecord{ .library = "RPCRT4", .import = "NdrMesTypeAlignSize2", .signature = "\x00\x05\x19\x0f\x01\x0f\x11\xc0\x00\x45\x39\x0f\x11\xc0\x00\x44\xf9\x0f\x05\x0f\x01" } },
    .{ "NdrMesTypeEncode2", MethodRecord{ .library = "RPCRT4", .import = "NdrMesTypeEncode2", .signature = "\x00\x05\x01\x0f\x01\x0f\x11\xc0\x00\x45\x39\x0f\x11\xc0\x00\x44\xf9\x0f\x05\x0f\x01" } },
    .{ "NdrMesTypeDecode2", MethodRecord{ .library = "RPCRT4", .import = "NdrMesTypeDecode2", .signature = "\x00\x05\x01\x0f\x01\x0f\x11\xc0\x00\x45\x39\x0f\x11\xc0\x00\x44\xf9\x0f\x05\x0f\x01" } },
    .{ "NdrMesTypeFree2", MethodRecord{ .library = "RPCRT4", .import = "NdrMesTypeFree2", .signature = "\x00\x05\x01\x0f\x01\x0f\x11\xc0\x00\x45\x39\x0f\x11\xc0\x00\x44\xf9\x0f\x05\x0f\x01" } },
    .{ "NdrMesProcEncodeDecode", MethodRecord{ .library = "RPCRT4", .import = "NdrMesProcEncodeDecode", .signature = "\x05\x03\x01\x0f\x01\x0f\x11\xc0\x00\x44\xf9\x0f\x05" } },
    .{ "NdrMesProcEncodeDecode2", MethodRecord{ .library = "RPCRT4", .import = "NdrMesProcEncodeDecode2", .signature = "\x05\x03\x11\xc0\x00\x45\x01\x0f\x01\x0f\x11\xc0\x00\x44\xf9\x0f\x05" } },
    .{ "NdrMesTypeAlignSize3", MethodRecord{ .library = "RPCRT4", .import = "NdrMesTypeAlignSize3", .signature = "\x00\x06\x19\x0f\x01\x0f\x11\xc0\x00\x45\x39\x0f\x11\xc0\x00\x45\x21\x0f\x0f\x09\x09\x0f\x01" } },
    .{ "NdrMesTypeEncode3", MethodRecord{ .library = "RPCRT4", .import = "NdrMesTypeEncode3", .signature = "\x00\x06\x01\x0f\x01\x0f\x11\xc0\x00\x45\x39\x0f\x11\xc0\x00\x45\x21\x0f\x0f\x09\x09\x0f\x01" } },
    .{ "NdrMesTypeDecode3", MethodRecord{ .library = "RPCRT4", .import = "NdrMesTypeDecode3", .signature = "\x00\x06\x01\x0f\x01\x0f\x11\xc0\x00\x45\x39\x0f\x11\xc0\x00\x45\x21\x0f\x0f\x09\x09\x0f\x01" } },
    .{ "NdrMesTypeFree3", MethodRecord{ .library = "RPCRT4", .import = "NdrMesTypeFree3", .signature = "\x00\x06\x01\x0f\x01\x0f\x11\xc0\x00\x45\x39\x0f\x11\xc0\x00\x45\x21\x0f\x0f\x09\x09\x0f\x01" } },
    .{ "NdrMesProcEncodeDecode3", MethodRecord{ .library = "RPCRT4", .import = "NdrMesProcEncodeDecode3", .signature = "\x05\x04\x11\xc0\x00\x45\x01\x0f\x01\x0f\x11\xc0\x00\x45\x21\x09\x0f\x01" } },
    .{ "NdrMesSimpleTypeDecodeAll", MethodRecord{ .library = "RPCRT4", .import = "NdrMesSimpleTypeDecodeAll", .signature = "\x00\x04\x01\x0f\x01\x0f\x11\xc0\x00\x45\x21\x0f\x01\x06" } },
    .{ "NdrMesSimpleTypeEncodeAll", MethodRecord{ .library = "RPCRT4", .import = "NdrMesSimpleTypeEncodeAll", .signature = "\x00\x04\x01\x0f\x01\x0f\x11\xc0\x00\x45\x21\x0f\x01\x06" } },
    .{ "NdrMesSimpleTypeAlignSizeAll", MethodRecord{ .library = "RPCRT4", .import = "NdrMesSimpleTypeAlignSizeAll", .signature = "\x00\x02\x19\x0f\x01\x0f\x11\xc0\x00\x45\x21" } },
    .{ "RpcCertGeneratePrincipalNameW", MethodRecord{ .library = "RPCRT4", .import = "RpcCertGeneratePrincipalNameW", .signature = "\x00\x03\x11\xa2\x55\x0f\x11\x7d\x09\x0f\x11\x05" } },
    .{ "RpcCertGeneratePrincipalNameA", MethodRecord{ .library = "RPCRT4", .import = "RpcCertGeneratePrincipalNameA", .signature = "\x00\x03\x11\xa2\x55\x0f\x11\x7d\x09\x0f\x11\x3d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x7d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CONTEXT" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x1369 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LUID" },
        0x2255 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_STATUS" },
        0x2259 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "GROUP_NAME_SYNTAX" },
        0x445d => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_BINDING_VECTOR" },
        0x4461 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_IF_ID" },
        0x4465 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_PROTSEQ_VECTORA" },
        0x4469 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_PROTSEQ_VECTORW" },
        0x446d => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_OBJECT_INQ_FN" },
        0x4471 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_IF_CALLBACK_FN" },
        0x4475 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_POLICY" },
        0x4479 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_STATS_VECTOR" },
        0x447d => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_IF_ID_VECTOR" },
        0x4481 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_BINDING_HANDLE_TEMPLATE_V1_A" },
        0x4485 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_BINDING_HANDLE_SECURITY_V1_A" },
        0x4489 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_BINDING_HANDLE_OPTIONS_V1" },
        0x448d => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_BINDING_HANDLE_TEMPLATE_V1_W" },
        0x4491 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_BINDING_HANDLE_SECURITY_V1_W" },
        0x4495 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_SECURITY_QOS" },
        0x4499 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_AUTH_KEY_RETRIEVAL_FN" },
        0x449d => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "UUID_VECTOR" },
        0x44a1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_MGMT_AUTHORIZATION_FN" },
        0x44a5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_INTERFACE_TEMPLATEW" },
        0x44a9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_ENDPOINT_TEMPLATEW" },
        0x44ad => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN" },
        0x44b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_INTERFACE_TEMPLATEA" },
        0x44b5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_ENDPOINT_TEMPLATEA" },
        0x44b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_MESSAGE" },
        0x44bd => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "LRPC_SYSTEM_HANDLE_MARSHAL_DIRECTION" },
        0x44c1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_SERVER_INTERFACE" },
        0x44c5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_TRANSFER_SYNTAX" },
        0x44c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_FORWARD_FUNCTION" },
        0x44cd => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_ADDRESS_CHANGE_FN" },
        0x44d1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RDR_CALLOUT_STATE" },
        0x44d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_ASYNC_STATE" },
        0x44d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_ERROR_ENUM_HANDLE" },
        0x44dd => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_EXTENDED_ERROR_INFO" },
        0x44e1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_NOTIFICATIONS" },
        0x44e5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_NOTIFICATION_TYPES" },
        0x44e9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_ASYNC_NOTIFICATION_INFO" },
        0x44ed => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "NDR_SCONTEXT" },
        0x44f1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "NDR_RUNDOWN" },
        0x44f5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "MIDL_STUB_MESSAGE" },
        0x44f9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "MIDL_STUB_DESC" },
        0x44fd => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_VERSION" },
        0x4501 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "CLIENT_CALL_RETURN" },
        0x4505 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IRpcStubBuffer" },
        0x4509 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IRpcChannelBuffer" },
        0x450d => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_CLIENT_ALLOC" },
        0x4511 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_CLIENT_FREE" },
        0x4515 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "FULL_PTR_XLAT_TABLES" },
        0x4519 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "XLAT_SIDE" },
        0x451d => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "NDR_USER_MARSHAL_INFO" },
        0x4521 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "MIDL_STUBLESS_PROXY_INFO" },
        0x4525 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "MIDL_ES_ALLOC" },
        0x4529 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "MIDL_ES_WRITE" },
        0x452d => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "MIDL_ES_READ" },
        0x4531 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "MIDL_ES_CODE" },
        0x4535 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "RPC_SYNTAX_IDENTIFIER" },
        0x4539 => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "MIDL_TYPE_PICKLING_INFO" },
        else => null,
    };
}

pub const RPC_C_QOS_CAPABILITIES_DEFAULT = 0;
pub const RPC_C_QOS_CAPABILITIES_MUTUAL_AUTH = 1;
pub const RPC_C_QOS_CAPABILITIES_MAKE_FULLSIC = 2;
pub const RPC_C_QOS_CAPABILITIES_ANY_AUTHORITY = 4;
pub const RPC_C_QOS_CAPABILITIES_IGNORE_DELEGATE_FAILURE = 8;
pub const RPC_C_QOS_CAPABILITIES_LOCAL_MA_HINT = 16;
pub const RPC_C_QOS_CAPABILITIES_SCHANNEL_FULL_AUTH_IDENTITY = 32;
pub const RPC_C_QOS_IDENTITY_STATIC = 0;
pub const RPC_C_QOS_IDENTITY_DYNAMIC = 1;
pub const RPC_C_AUTHN_INFO_NONE = 0;
pub const RPC_C_AUTHN_INFO_TYPE_HTTP = 1;
pub const RPC_C_HTTP_FLAG_USE_SSL = 1;
pub const RPC_C_HTTP_FLAG_USE_FIRST_AUTH_SCHEME = 2;
pub const RPC_C_HTTP_FLAG_IGNORE_CERT_CN_INVALID = 8;
pub const RPC_C_HTTP_FLAG_ENABLE_CERT_REVOCATION_CHECK = 16;
pub const RPC_C_HTTP_AUTHN_TARGET_SERVER = 1;
pub const RPC_C_HTTP_AUTHN_TARGET_PROXY = 2;
pub const RPC_S_OK = 0;
pub const RPC_S_ACCESS_DENIED = 5;
pub const RPC_S_INVALID_ARG = 87;
pub const RPC_S_OUT_OF_MEMORY = 14;
pub const RPC_S_OUT_OF_THREADS = 164;
pub const RPC_S_INVALID_LEVEL = 87;
pub const RPC_S_BUFFER_TOO_SMALL = 122;
pub const RPC_S_INVALID_SECURITY_DESC = 1338;
pub const RPC_S_SERVER_OUT_OF_MEMORY = 1130;
pub const RPC_S_ASYNC_CALL_PENDING = 997;
pub const RPC_S_UNKNOWN_PRINCIPAL = 1332;
pub const RPC_S_TIMEOUT = 1460;
pub const RPC_S_RUNTIME_UNINITIALIZED = 1;
pub const RPC_S_NOT_ENOUGH_QUOTA = 1816;
pub const RPC_S_INVALID_STRING_BINDING = 1700;
pub const RPC_S_WRONG_KIND_OF_BINDING = 1701;
pub const RPC_S_INVALID_BINDING = 1702;
pub const RPC_S_PROTSEQ_NOT_SUPPORTED = 1703;
pub const RPC_S_INVALID_RPC_PROTSEQ = 1704;
pub const RPC_S_INVALID_STRING_UUID = 1705;
pub const RPC_S_INVALID_ENDPOINT_FORMAT = 1706;
pub const RPC_S_INVALID_NET_ADDR = 1707;
pub const RPC_S_NO_ENDPOINT_FOUND = 1708;
pub const RPC_S_INVALID_TIMEOUT = 1709;
pub const RPC_S_OBJECT_NOT_FOUND = 1710;
pub const RPC_S_ALREADY_REGISTERED = 1711;
pub const RPC_S_TYPE_ALREADY_REGISTERED = 1712;
pub const RPC_S_ALREADY_LISTENING = 1713;
pub const RPC_S_NO_PROTSEQS_REGISTERED = 1714;
pub const RPC_S_NOT_LISTENING = 1715;
pub const RPC_S_UNKNOWN_MGR_TYPE = 1716;
pub const RPC_S_UNKNOWN_IF = 1717;
pub const RPC_S_NO_BINDINGS = 1718;
pub const RPC_S_NO_PROTSEQS = 1719;
pub const RPC_S_CANT_CREATE_ENDPOINT = 1720;
pub const RPC_S_OUT_OF_RESOURCES = 1721;
pub const RPC_S_SERVER_UNAVAILABLE = 1722;
pub const RPC_S_SERVER_TOO_BUSY = 1723;
pub const RPC_S_INVALID_NETWORK_OPTIONS = 1724;
pub const RPC_S_NO_CALL_ACTIVE = 1725;
pub const RPC_S_CALL_FAILED = 1726;
pub const RPC_S_CALL_FAILED_DNE = 1727;
pub const RPC_S_PROTOCOL_ERROR = 1728;
pub const RPC_S_PROXY_ACCESS_DENIED = 1729;
pub const RPC_S_UNSUPPORTED_TRANS_SYN = 1730;
pub const RPC_S_UNSUPPORTED_TYPE = 1732;
pub const RPC_S_INVALID_TAG = 1733;
pub const RPC_S_INVALID_BOUND = 1734;
pub const RPC_S_NO_ENTRY_NAME = 1735;
pub const RPC_S_INVALID_NAME_SYNTAX = 1736;
pub const RPC_S_UNSUPPORTED_NAME_SYNTAX = 1737;
pub const RPC_S_UUID_NO_ADDRESS = 1739;
pub const RPC_S_DUPLICATE_ENDPOINT = 1740;
pub const RPC_S_UNKNOWN_AUTHN_TYPE = 1741;
pub const RPC_S_MAX_CALLS_TOO_SMALL = 1742;
pub const RPC_S_STRING_TOO_LONG = 1743;
pub const RPC_S_PROTSEQ_NOT_FOUND = 1744;
pub const RPC_S_PROCNUM_OUT_OF_RANGE = 1745;
pub const RPC_S_BINDING_HAS_NO_AUTH = 1746;
pub const RPC_S_UNKNOWN_AUTHN_SERVICE = 1747;
pub const RPC_S_UNKNOWN_AUTHN_LEVEL = 1748;
pub const RPC_S_INVALID_AUTH_IDENTITY = 1749;
pub const RPC_S_UNKNOWN_AUTHZ_SERVICE = 1750;
pub const EPT_S_INVALID_ENTRY = 1751;
pub const EPT_S_CANT_PERFORM_OP = 1752;
pub const EPT_S_NOT_REGISTERED = 1753;
pub const RPC_S_NOTHING_TO_EXPORT = 1754;
pub const RPC_S_INCOMPLETE_NAME = 1755;
pub const RPC_S_INVALID_VERS_OPTION = 1756;
pub const RPC_S_NO_MORE_MEMBERS = 1757;
pub const RPC_S_NOT_ALL_OBJS_UNEXPORTED = 1758;
pub const RPC_S_INTERFACE_NOT_FOUND = 1759;
pub const RPC_S_ENTRY_ALREADY_EXISTS = 1760;
pub const RPC_S_ENTRY_NOT_FOUND = 1761;
pub const RPC_S_NAME_SERVICE_UNAVAILABLE = 1762;
pub const RPC_S_INVALID_NAF_ID = 1763;
pub const RPC_S_CANNOT_SUPPORT = 1764;
pub const RPC_S_NO_CONTEXT_AVAILABLE = 1765;
pub const RPC_S_INTERNAL_ERROR = 1766;
pub const RPC_S_ZERO_DIVIDE = 1767;
pub const RPC_S_ADDRESS_ERROR = 1768;
pub const RPC_S_FP_DIV_ZERO = 1769;
pub const RPC_S_FP_UNDERFLOW = 1770;
pub const RPC_S_FP_OVERFLOW = 1771;
pub const RPC_S_CALL_IN_PROGRESS = 1791;
pub const RPC_S_NO_MORE_BINDINGS = 1806;
pub const RPC_S_NO_INTERFACES = 1817;
pub const RPC_S_CALL_CANCELLED = 1818;
pub const RPC_S_BINDING_INCOMPLETE = 1819;
pub const RPC_S_COMM_FAILURE = 1820;
pub const RPC_S_UNSUPPORTED_AUTHN_LEVEL = 1821;
pub const RPC_S_NO_PRINC_NAME = 1822;
pub const RPC_S_NOT_RPC_ERROR = 1823;
pub const RPC_S_UUID_LOCAL_ONLY = 1824;
pub const RPC_S_SEC_PKG_ERROR = 1825;
pub const RPC_S_NOT_CANCELLED = 1826;
pub const RPC_S_COOKIE_AUTH_FAILED = 1833;
pub const RPC_S_DO_NOT_DISTURB = 1834;
pub const RPC_S_SYSTEM_HANDLE_COUNT_EXCEEDED = 1835;
pub const RPC_S_SYSTEM_HANDLE_TYPE_MISMATCH = 1836;
pub const RPC_S_GROUP_MEMBER_NOT_FOUND = 1898;
pub const EPT_S_CANT_CREATE = 1899;
pub const RPC_S_INVALID_OBJECT = 1900;
pub const RPC_S_SEND_INCOMPLETE = 1913;
pub const RPC_S_INVALID_ASYNC_HANDLE = 1914;
pub const RPC_S_INVALID_ASYNC_CALL = 1915;
pub const RPC_S_ENTRY_TYPE_MISMATCH = 1922;
pub const RPC_S_NOT_ALL_OBJS_EXPORTED = 1923;
pub const RPC_S_INTERFACE_NOT_EXPORTED = 1924;
pub const RPC_S_PROFILE_NOT_ADDED = 1925;
pub const RPC_S_PRF_ELT_NOT_ADDED = 1926;
pub const RPC_S_PRF_ELT_NOT_REMOVED = 1927;
pub const RPC_S_GRP_ELT_NOT_ADDED = 1928;
pub const RPC_S_GRP_ELT_NOT_REMOVED = 1929;
pub const RPC_C_NS_SYNTAX_DEFAULT = 0;
pub const RPC_C_NS_SYNTAX_DCE = 3;
pub const SEC_WINNT_AUTH_IDENTITY_ANSI = 1;
pub const SEC_WINNT_AUTH_IDENTITY_UNICODE = 2;
pub const RPC_BHO_NONCAUSAL = 1;
pub const RPC_BHO_DONTLINGER = 2;
pub const RPC_C_BINDING_INFINITE_TIMEOUT = 10;
pub const RPC_C_BINDING_MIN_TIMEOUT = 0;
pub const RPC_C_BINDING_DEFAULT_TIMEOUT = 5;
pub const RPC_C_BINDING_MAX_TIMEOUT = 9;
pub const RPC_C_CANCEL_INFINITE_TIMEOUT = -1;
pub const RPC_C_LISTEN_MAX_CALLS_DEFAULT = 1234;
pub const RPC_C_PROTSEQ_MAX_REQS_DEFAULT = 10;
pub const RPC_C_BIND_TO_ALL_NICS = 1;
pub const RPC_C_USE_INTERNET_PORT = 1;
pub const RPC_C_USE_INTRANET_PORT = 2;
pub const RPC_C_DONT_FAIL = 4;
pub const RPC_C_RPCHTTP_USE_LOAD_BALANCE = 8;
pub const RPC_C_TRY_ENFORCE_MAX_CALLS = 16;
pub const RPC_C_MQ_TEMPORARY = 0;
pub const RPC_C_MQ_PERMANENT = 1;
pub const RPC_C_MQ_CLEAR_ON_OPEN = 2;
pub const RPC_C_MQ_USE_EXISTING_SECURITY = 4;
pub const RPC_C_MQ_AUTHN_LEVEL_NONE = 0;
pub const RPC_C_MQ_AUTHN_LEVEL_PKT_INTEGRITY = 8;
pub const RPC_C_MQ_AUTHN_LEVEL_PKT_PRIVACY = 16;
pub const RPC_C_MQ_EXPRESS = 0;
pub const RPC_C_MQ_RECOVERABLE = 1;
pub const RPC_C_MQ_JOURNAL_NONE = 0;
pub const RPC_C_MQ_JOURNAL_DEADLETTER = 1;
pub const RPC_C_MQ_JOURNAL_ALWAYS = 2;
pub const RPC_C_OPT_MQ_DELIVERY = 1;
pub const RPC_C_OPT_MQ_PRIORITY = 2;
pub const RPC_C_OPT_MQ_JOURNAL = 3;
pub const RPC_C_OPT_MQ_ACKNOWLEDGE = 4;
pub const RPC_C_OPT_MQ_AUTHN_SERVICE = 5;
pub const RPC_C_OPT_MQ_AUTHN_LEVEL = 6;
pub const RPC_C_OPT_MQ_TIME_TO_REACH_QUEUE = 7;
pub const RPC_C_OPT_MQ_TIME_TO_BE_RECEIVED = 8;
pub const RPC_C_OPT_BINDING_NONCAUSAL = 9;
pub const RPC_C_OPT_SECURITY_CALLBACK = 10;
pub const RPC_C_OPT_UNIQUE_BINDING = 11;
pub const RPC_C_OPT_MAX_OPTIONS = 12;
pub const RPC_C_OPT_CALL_TIMEOUT = 12;
pub const RPC_C_OPT_DONT_LINGER = 13;
pub const RPC_C_OPT_TRANS_SEND_BUFFER_SIZE = 5;
pub const RPC_C_OPT_TRUST_PEER = 14;
pub const RPC_C_OPT_ASYNC_BLOCK = 15;
pub const RPC_C_OPT_OPTIMIZE_TIME = 16;
pub const RPC_C_FULL_CERT_CHAIN = 1;
pub const RPC_C_STATS_CALLS_IN = 0;
pub const RPC_C_STATS_CALLS_OUT = 1;
pub const RPC_C_STATS_PKTS_IN = 2;
pub const RPC_C_STATS_PKTS_OUT = 3;
pub const RPC_C_AUTHN_NONE = 0;
pub const RPC_C_AUTHN_DCE_PRIVATE = 1;
pub const RPC_C_AUTHN_DCE_PUBLIC = 2;
pub const RPC_C_AUTHN_DEC_PUBLIC = 4;
pub const RPC_C_AUTHN_GSS_NEGOTIATE = 9;
pub const RPC_C_AUTHN_WINNT = 10;
pub const RPC_C_AUTHN_GSS_SCHANNEL = 14;
pub const RPC_C_AUTHN_GSS_KERBEROS = 16;
pub const RPC_C_AUTHN_DPA = 17;
pub const RPC_C_AUTHN_MSN = 18;
pub const RPC_C_AUTHN_DIGEST = 21;
pub const RPC_C_AUTHN_KERNEL = 20;
pub const RPC_C_AUTHN_NEGO_EXTENDER = 30;
pub const RPC_C_AUTHN_PKU2U = 31;
pub const RPC_C_AUTHN_LIVE_SSP = 32;
pub const RPC_C_AUTHN_LIVEXP_SSP = 35;
pub const RPC_C_AUTHN_CLOUD_AP = 36;
pub const RPC_C_AUTHN_MSONLINE = 82;
pub const RPC_C_AUTHN_MQ = 100;
pub const RPC_C_AUTHN_DEFAULT = -1;
pub const RPC_C_SECURITY_QOS_VERSION = 1;
pub const RPC_C_SECURITY_QOS_VERSION_1 = 1;
pub const RPC_C_SECURITY_QOS_VERSION_2 = 2;
pub const RPC_C_HTTP_AUTHN_SCHEME_BASIC = 1;
pub const RPC_C_HTTP_AUTHN_SCHEME_NTLM = 2;
pub const RPC_C_HTTP_AUTHN_SCHEME_PASSPORT = 4;
pub const RPC_C_HTTP_AUTHN_SCHEME_DIGEST = 8;
pub const RPC_C_HTTP_AUTHN_SCHEME_NEGOTIATE = 16;
pub const RPC_C_HTTP_AUTHN_SCHEME_CERT = 65536;
pub const RPC_C_SECURITY_QOS_VERSION_3 = 3;
pub const RPC_C_SECURITY_QOS_VERSION_4 = 4;
pub const RPC_C_SECURITY_QOS_VERSION_5 = 5;
pub const RPC_PROTSEQ_TCP = 1;
pub const RPC_PROTSEQ_NMP = 2;
pub const RPC_PROTSEQ_LRPC = 3;
pub const RPC_PROTSEQ_HTTP = 4;
pub const RPC_BHT_OBJECT_UUID_VALID = 1;
pub const RPC_BHO_EXCLUSIVE_AND_GUARANTEED = 4;
pub const RPC_C_AUTHZ_NONE = 0;
pub const RPC_C_AUTHZ_NAME = 1;
pub const RPC_C_AUTHZ_DCE = 2;
pub const RPC_C_AUTHZ_DEFAULT = 4294967295;
pub const DCE_C_ERROR_STRING_LEN = 256;
pub const RPC_C_EP_ALL_ELTS = 0;
pub const RPC_C_EP_MATCH_BY_IF = 1;
pub const RPC_C_EP_MATCH_BY_OBJ = 2;
pub const RPC_C_EP_MATCH_BY_BOTH = 3;
pub const RPC_C_VERS_ALL = 1;
pub const RPC_C_VERS_COMPATIBLE = 2;
pub const RPC_C_VERS_EXACT = 3;
pub const RPC_C_VERS_MAJOR_ONLY = 4;
pub const RPC_C_VERS_UPTO = 5;
pub const RPC_C_MGMT_INQ_IF_IDS = 0;
pub const RPC_C_MGMT_INQ_PRINC_NAME = 1;
pub const RPC_C_MGMT_INQ_STATS = 2;
pub const RPC_C_MGMT_IS_SERVER_LISTEN = 3;
pub const RPC_C_MGMT_STOP_SERVER_LISTEN = 4;
pub const RPC_C_PARM_MAX_PACKET_LENGTH = 1;
pub const RPC_C_PARM_BUFFER_LENGTH = 2;
pub const RPC_IF_AUTOLISTEN = 1;
pub const RPC_IF_OLE = 2;
pub const RPC_IF_ALLOW_UNKNOWN_AUTHORITY = 4;
pub const RPC_IF_ALLOW_SECURE_ONLY = 8;
pub const RPC_IF_ALLOW_CALLBACKS_WITH_NO_AUTH = 16;
pub const RPC_IF_ALLOW_LOCAL_ONLY = 32;
pub const RPC_IF_SEC_NO_CACHE = 64;
pub const RPC_IF_SEC_CACHE_PER_PROC = 128;
pub const RPC_IF_ASYNC_CALLBACK = 256;
pub const RPC_FW_IF_FLAG_DCOM = 1;
pub const RPC_C_NOTIFY_ON_SEND_COMPLETE = 1;
pub const MaxNumberOfEEInfoParams = 4;
pub const RPC_EEINFO_VERSION = 1;
pub const EEInfoPreviousRecordsMissing = 1;
pub const EEInfoNextRecordsMissing = 2;
pub const EEInfoUseFileTime = 4;
pub const EEInfoGCCOM = 11;
pub const EEInfoGCFRS = 12;
pub const RPC_CALL_ATTRIBUTES_VERSION = 2;
pub const RPC_QUERY_SERVER_PRINCIPAL_NAME = 2;
pub const RPC_QUERY_CLIENT_PRINCIPAL_NAME = 4;
pub const RPC_QUERY_CALL_LOCAL_ADDRESS = 8;
pub const RPC_QUERY_CLIENT_PID = 16;
pub const RPC_QUERY_IS_CLIENT_LOCAL = 32;
pub const RPC_QUERY_NO_AUTH_REQUIRED = 64;
pub const RPC_QUERY_CLIENT_ID = 128;
pub const RPC_CALL_STATUS_CANCELLED = 1;
pub const RPC_CALL_STATUS_DISCONNECTED = 2;
pub const RPC_CONTEXT_HANDLE_DEFAULT_FLAGS = 0;
pub const RPC_CONTEXT_HANDLE_FLAGS = 805306368;
pub const RPC_CONTEXT_HANDLE_SERIALIZE = 268435456;
pub const RPC_CONTEXT_HANDLE_DONT_SERIALIZE = 536870912;
pub const RPC_TYPE_STRICT_CONTEXT_HANDLE = 1073741824;
pub const RPC_TYPE_DISCONNECT_EVENT_CONTEXT_HANDLE = 2147483648;
pub const RPC_NCA_FLAGS_DEFAULT = 0;
pub const RPC_NCA_FLAGS_IDEMPOTENT = 1;
pub const RPC_NCA_FLAGS_BROADCAST = 2;
pub const RPC_NCA_FLAGS_MAYBE = 4;
pub const RPCFLG_HAS_GUARANTEE = 16;
pub const RPCFLG_WINRT_REMOTE_ASYNC = 32;
pub const RPC_BUFFER_COMPLETE = 4096;
pub const RPC_BUFFER_PARTIAL = 8192;
pub const RPC_BUFFER_EXTRA = 16384;
pub const RPC_BUFFER_ASYNC = 32768;
pub const RPC_BUFFER_NONOTIFY = 65536;
pub const RPCFLG_MESSAGE = 16777216;
pub const RPCFLG_AUTO_COMPLETE = 134217728;
pub const RPCFLG_LOCAL_CALL = 268435456;
pub const RPCFLG_INPUT_SYNCHRONOUS = 536870912;
pub const RPCFLG_ASYNCHRONOUS = 1073741824;
pub const RPCFLG_NON_NDR = 2147483648;
pub const RPCFLG_HAS_MULTI_SYNTAXES = 33554432;
pub const RPCFLG_HAS_CALLBACK = 67108864;
pub const RPCFLG_ACCESSIBILITY_BIT1 = 1048576;
pub const RPCFLG_ACCESSIBILITY_BIT2 = 2097152;
pub const RPCFLG_ACCESS_LOCAL = 4194304;
pub const NDR_CUSTOM_OR_DEFAULT_ALLOCATOR = 268435456;
pub const NDR_DEFAULT_ALLOCATOR = 536870912;
pub const RPCFLG_NDR64_CONTAINS_ARM_LAYOUT = 67108864;
pub const RPCFLG_SENDER_WAITING_FOR_REPLY = 8388608;
pub const RPC_FLAGS_VALID_BIT = 32768;
pub const NT351_INTERFACE_SIZE = 64;
pub const RPC_INTERFACE_HAS_PIPES = 1;
pub const RPC_SYSTEM_HANDLE_FREE_UNRETRIEVED = 1;
pub const RPC_SYSTEM_HANDLE_FREE_RETRIEVED = 2;
pub const RPC_SYSTEM_HANDLE_FREE_ALL = 3;
pub const RPC_SYSTEM_HANDLE_FREE_ERROR_ON_CLOSE = 4;
pub const TRANSPORT_TYPE_CN = 1;
pub const TRANSPORT_TYPE_DG = 2;
pub const TRANSPORT_TYPE_LPC = 4;
pub const TRANSPORT_TYPE_WMSG = 8;
pub const RPC_P_ADDR_FORMAT_TCP_IPV4 = 1;
pub const RPC_P_ADDR_FORMAT_TCP_IPV6 = 2;
pub const RPC_C_OPT_SESSION_ID = 6;
pub const RPC_C_OPT_COOKIE_AUTH = 7;
pub const RPC_C_OPT_RESOURCE_TYPE_UUID = 8;
pub const RPC_PROXY_CONNECTION_TYPE_IN_PROXY = 0;
pub const RPC_PROXY_CONNECTION_TYPE_OUT_PROXY = 1;
pub const RPC_C_OPT_PRIVATE_SUPPRESS_WAKE = 1;
pub const RPC_C_OPT_PRIVATE_DO_NOT_DISTURB = 2;
pub const RPC_C_OPT_PRIVATE_BREAK_ON_SUSPEND = 3;
pub const RPC_C_PROFILE_DEFAULT_ELT = 0;
pub const RPC_C_PROFILE_ALL_ELT = 1;
pub const RPC_C_PROFILE_ALL_ELTS = 1;
pub const RPC_C_PROFILE_MATCH_BY_IF = 2;
pub const RPC_C_PROFILE_MATCH_BY_MBR = 3;
pub const RPC_C_PROFILE_MATCH_BY_BOTH = 4;
pub const RPC_C_NS_DEFAULT_EXP_AGE = -1;
pub const TARGET_IS_NT1012_OR_LATER = 1;
pub const TARGET_IS_NT102_OR_LATER = 1;
pub const TARGET_IS_NT100_OR_LATER = 1;
pub const TARGET_IS_NT63_OR_LATER = 1;
pub const TARGET_IS_NT62_OR_LATER = 1;
pub const TARGET_IS_NT61_OR_LATER = 1;
pub const TARGET_IS_NT60_OR_LATER = 1;
pub const TARGET_IS_NT51_OR_LATER = 1;
pub const TARGET_IS_NT50_OR_LATER = 1;
pub const TARGET_IS_NT40_OR_LATER = 1;
pub const TARGET_IS_NT351_OR_WIN95_OR_LATER = 1;
pub const cbNDRContext = 20;
pub const USER_CALL_IS_ASYNC = 256;
pub const USER_CALL_NEW_CORRELATION_DESC = 512;
pub const MIDL_WINRT_TYPE_SERIALIZATION_INFO_CURRENT_VERSION = 1;
pub const USER_MARSHAL_FC_BYTE = 1;
pub const USER_MARSHAL_FC_CHAR = 2;
pub const USER_MARSHAL_FC_SMALL = 3;
pub const USER_MARSHAL_FC_USMALL = 4;
pub const USER_MARSHAL_FC_WCHAR = 5;
pub const USER_MARSHAL_FC_SHORT = 6;
pub const USER_MARSHAL_FC_USHORT = 7;
pub const USER_MARSHAL_FC_LONG = 8;
pub const USER_MARSHAL_FC_ULONG = 9;
pub const USER_MARSHAL_FC_FLOAT = 10;
pub const USER_MARSHAL_FC_HYPER = 11;
pub const USER_MARSHAL_FC_DOUBLE = 12;
pub const INVALID_FRAGMENT_ID = 0;
pub const NDR64_FC_EXPLICIT_HANDLE = 0;
pub const NDR64_FC_BIND_GENERIC = 1;
pub const NDR64_FC_BIND_PRIMITIVE = 2;
pub const NDR64_FC_AUTO_HANDLE = 3;
pub const NDR64_FC_CALLBACK_HANDLE = 4;
pub const NDR64_FC_NO_HANDLE = 5;
pub const __RPCPROXY_H_VERSION__ = 477;
pub const MidlInterceptionInfoVersionOne = 1;
pub const MidlWinrtTypeSerializationInfoVersionOne = 1;
pub const RPCHTTP_RS_REDIRECT = 1;
pub const RPCHTTP_RS_ACCESS_1 = 2;
pub const RPCHTTP_RS_SESSION = 3;
pub const RPCHTTP_RS_ACCESS_2 = 4;
pub const RPCHTTP_RS_INTERFACE = 5;
pub const PROTOCOL_NOT_LOADED = 1;
pub const PROTOCOL_LOADED = 2;
pub const PROTOCOL_ADDRESS_CHANGE = 3;
pub const MarshalDirectionMarshal = 0;
pub const MarshalDirectionUnmarshal = 1;
pub const RpcCurrentUniqueUser = 1;
pub const RpcBackEndConnectionAttempts = 2;
pub const RpcBackEndConnectionFailed = 3;
pub const RpcRequestsPerSecond = 4;
pub const RpcIncomingConnections = 5;
pub const RpcIncomingBandwidth = 6;
pub const RpcOutgoingBandwidth = 7;
pub const RpcAttemptedLbsDecisions = 8;
pub const RpcFailedLbsDecisions = 9;
pub const RpcAttemptedLbsMessages = 10;
pub const RpcFailedLbsMessages = 11;
pub const RpcLastCounter = 12;
pub const RpcNotificationTypeNone = 0;
pub const RpcNotificationTypeEvent = 1;
pub const RpcNotificationTypeApc = 2;
pub const RpcNotificationTypeIoc = 3;
pub const RpcNotificationTypeHwnd = 4;
pub const RpcNotificationTypeCallback = 5;
pub const RpcCallComplete = 0;
pub const RpcSendComplete = 1;
pub const RpcReceiveComplete = 2;
pub const RpcClientDisconnect = 3;
pub const RpcClientCancel = 4;
pub const eeptAnsiString = 1;
pub const eeptUnicodeString = 2;
pub const eeptLongVal = 3;
pub const eeptShortVal = 4;
pub const eeptPointerVal = 5;
pub const eeptNone = 6;
pub const eeptBinary = 7;
pub const rlafInvalid = 0;
pub const rlafIPv4 = 1;
pub const rlafIPv6 = 2;
pub const rctInvalid = 0;
pub const rctNormal = 1;
pub const rctTraining = 2;
pub const rctGuaranteed = 3;
pub const rcclInvalid = 0;
pub const rcclLocal = 1;
pub const rcclRemote = 2;
pub const rcclClientUnknownLocality = 3;
pub const RpcNotificationCallNone = 0;
pub const RpcNotificationClientDisconnect = 1;
pub const RpcNotificationCallCancel = 2;
pub const USER_MARSHAL_CB_BUFFER_SIZE = 0;
pub const USER_MARSHAL_CB_MARSHALL = 1;
pub const USER_MARSHAL_CB_UNMARSHALL = 2;
pub const USER_MARSHAL_CB_FREE = 3;
pub const IDL_CS_NO_CONVERT = 0;
pub const IDL_CS_IN_PLACE_CONVERT = 1;
pub const IDL_CS_NEW_BUFFER_CONVERT = 2;
pub const XLAT_SERVER = 1;
pub const XLAT_CLIENT = 2;
pub const SYSTEM_HANDLE_FILE = 0;
pub const SYSTEM_HANDLE_SEMAPHORE = 1;
pub const SYSTEM_HANDLE_EVENT = 2;
pub const SYSTEM_HANDLE_MUTEX = 3;
pub const SYSTEM_HANDLE_PROCESS = 4;
pub const SYSTEM_HANDLE_TOKEN = 5;
pub const SYSTEM_HANDLE_SECTION = 6;
pub const SYSTEM_HANDLE_REG_KEY = 7;
pub const SYSTEM_HANDLE_THREAD = 8;
pub const SYSTEM_HANDLE_COMPOSITION_OBJECT = 9;
pub const SYSTEM_HANDLE_SOCKET = 10;
pub const SYSTEM_HANDLE_JOB = 11;
pub const SYSTEM_HANDLE_PIPE = 12;
pub const SYSTEM_HANDLE_MAX = 12;
pub const SYSTEM_HANDLE_INVALID = 255;
pub const STUB_UNMARSHAL = 0;
pub const STUB_CALL_SERVER = 1;
pub const STUB_MARSHAL = 2;
pub const STUB_CALL_SERVER_NO_HRESULT = 3;
pub const PROXY_CALCSIZE = 0;
pub const PROXY_GETBUFFER = 1;
pub const PROXY_MARSHAL = 2;
pub const PROXY_SENDRECEIVE = 3;
pub const PROXY_UNMARSHAL = 4;
pub const MES_ENCODE = 0;
pub const MES_DECODE = 1;
pub const MES_ENCODE_NDR64 = 2;
pub const MES_INCREMENTAL_HANDLE = 0;
pub const MES_FIXED_BUFFER_HANDLE = 1;
pub const MES_DYNAMIC_BUFFER_HANDLE = 2;
pub const FC_EXPR_START = 0;
pub const FC_EXPR_ILLEGAL = 0;
pub const FC_EXPR_CONST32 = 1;
pub const FC_EXPR_CONST64 = 2;
pub const FC_EXPR_VAR = 3;
pub const FC_EXPR_OPER = 4;
pub const FC_EXPR_NOOP = 5;
pub const FC_EXPR_END = 6;

pub const aliases = struct {
    pub const RPC_C_QOS_CAPABILITIES = u32;
    pub const RPC_C_QOS_IDENTITY = u32;
    pub const RPC_C_AUTHN_INFO_TYPE = u32;
    pub const RPC_C_HTTP_FLAGS = u32;
    pub const RPC_C_HTTP_AUTHN_TARGET = u32;
    pub const RPC_STATUS = i32;
    pub const GROUP_NAME_SYNTAX = u32;
    pub const SEC_WINNT_AUTH_IDENTITY = u32;
    pub const RPC_BINDING_HANDLE_OPTIONS_FLAGS = u32;
    pub const RPC_HTTP_REDIRECTOR_STAGE = i32;
    pub const RPC_ADDRESS_CHANGE_TYPE = i32;
    pub const LRPC_SYSTEM_HANDLE_MARSHAL_DIRECTION = i32;
    pub const RpcPerfCounters = i32;
    pub const RPC_NOTIFICATION_TYPES = i32;
    pub const RPC_ASYNC_EVENT = i32;
    pub const ExtendedErrorParamTypes = i32;
    pub const RpcLocalAddressFormat = i32;
    pub const RpcCallType = i32;
    pub const RpcCallClientLocality = i32;
    pub const RPC_NOTIFICATIONS = i32;
    pub const USER_MARSHAL_CB_TYPE = i32;
    pub const IDL_CS_CONVERT = i32;
    pub const XLAT_SIDE = i32;
    pub const system_handle_t = i32;
    pub const STUB_PHASE = i32;
    pub const PROXY_PHASE = i32;
    pub const MIDL_ES_CODE = i32;
    pub const MIDL_ES_HANDLE_STYLE = i32;
    pub const EXPR_TOKEN = i32;
    pub const PNDR_ASYNC_MESSAGE = isize;
    pub const PNDR_CORRELATION_INFO = isize;
    pub const _NDR_PROC_CONTEXT = isize;
    pub const NDR_ALLOC_ALL_NODES_CONTEXT = isize;
    pub const NDR_POINTER_QUEUE_STATE = isize;
    pub const PFN_RPC_ALLOCATE = ?*const anyopaque;
    pub const PFN_RPC_FREE = ?*const anyopaque;
    pub const RPC_OBJECT_INQ_FN = ?*const anyopaque;
    pub const RPC_IF_CALLBACK_FN = ?*const anyopaque;
    pub const RPC_SECURITY_CALLBACK_FN = ?*const anyopaque;
    pub const RPC_NEW_HTTP_PROXY_CHANNEL = ?*const anyopaque;
    pub const RPC_HTTP_PROXY_FREE_STRING = ?*const anyopaque;
    pub const RPC_AUTH_KEY_RETRIEVAL_FN = ?*const anyopaque;
    pub const RPC_MGMT_AUTHORIZATION_FN = ?*const anyopaque;
    pub const RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN = ?*const anyopaque;
    pub const RPC_FORWARD_FUNCTION = ?*const anyopaque;
    pub const RPC_ADDRESS_CHANGE_FN = ?*const anyopaque;
    pub const RPC_DISPATCH_FUNCTION = ?*const anyopaque;
    pub const PRPC_RUNDOWN = ?*const anyopaque;
    pub const RPCLT_PDU_FILTER_FUNC = ?*const anyopaque;
    pub const RPC_SETFILTER_FUNC = ?*const anyopaque;
    pub const RPC_BLOCKING_FN = ?*const anyopaque;
    pub const I_RpcProxyIsValidMachineFn = ?*const anyopaque;
    pub const I_RpcProxyGetClientAddressFn = ?*const anyopaque;
    pub const I_RpcProxyGetConnectionTimeoutFn = ?*const anyopaque;
    pub const I_RpcPerformCalloutFn = ?*const anyopaque;
    pub const I_RpcFreeCalloutStateFn = ?*const anyopaque;
    pub const I_RpcProxyGetClientSessionAndResourceUUID = ?*const anyopaque;
    pub const I_RpcProxyFilterIfFn = ?*const anyopaque;
    pub const I_RpcProxyUpdatePerfCounterFn = ?*const anyopaque;
    pub const I_RpcProxyUpdatePerfCounterBackendServerFn = ?*const anyopaque;
    pub const PFN_RPCNOTIFICATION_ROUTINE = ?*const anyopaque;
    pub const NDR_RUNDOWN = ?*const anyopaque;
    pub const NDR_NOTIFY_ROUTINE = ?*const anyopaque;
    pub const NDR_NOTIFY2_ROUTINE = ?*const anyopaque;
    pub const EXPR_EVAL = ?*const anyopaque;
    pub const GENERIC_BINDING_ROUTINE = ?*const anyopaque;
    pub const GENERIC_UNBIND_ROUTINE = ?*const anyopaque;
    pub const XMIT_HELPER_ROUTINE = ?*const anyopaque;
    pub const USER_MARSHAL_SIZING_ROUTINE = ?*const anyopaque;
    pub const USER_MARSHAL_MARSHALLING_ROUTINE = ?*const anyopaque;
    pub const USER_MARSHAL_UNMARSHALLING_ROUTINE = ?*const anyopaque;
    pub const USER_MARSHAL_FREEING_ROUTINE = ?*const anyopaque;
    pub const CS_TYPE_NET_SIZE_ROUTINE = ?*const anyopaque;
    pub const CS_TYPE_LOCAL_SIZE_ROUTINE = ?*const anyopaque;
    pub const CS_TYPE_TO_NETCS_ROUTINE = ?*const anyopaque;
    pub const CS_TYPE_FROM_NETCS_ROUTINE = ?*const anyopaque;
    pub const CS_TAG_GETTING_ROUTINE = ?*const anyopaque;
    pub const STUB_THUNK = ?*const anyopaque;
    pub const SERVER_ROUTINE = ?*const anyopaque;
    pub const RPC_CLIENT_ALLOC = ?*const anyopaque;
    pub const RPC_CLIENT_FREE = ?*const anyopaque;
    pub const MIDL_ES_ALLOC = ?*const anyopaque;
    pub const MIDL_ES_WRITE = ?*const anyopaque;
    pub const MIDL_ES_READ = ?*const anyopaque;
};
