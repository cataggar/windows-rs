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
    .{ "FwpmFreeMemory0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmFreeMemory0", .signature = "\x00\x01\x01\x0f\x0f\x01" } },
    .{ "FwpmEngineOpen0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmEngineOpen0", .signature = "\x00\x05\x09\x11\x05\x09\x0f\x11\xb9\xad\x0f\x11\xb9\xb1\x0f\x11\xb9\xb5" } },
    .{ "FwpmEngineClose0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmEngineClose0", .signature = "\x00\x01\x09\x11\xb9\xb5" } },
    .{ "FwpmEngineGetOption0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmEngineGetOption0", .signature = "\x00\x03\x09\x11\xb9\xb5\x11\xb9\xb9\x0f\x0f\x11\xb9\xbd" } },
    .{ "FwpmEngineSetOption0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmEngineSetOption0", .signature = "\x00\x03\x09\x11\xb9\xb5\x11\xb9\xb9\x0f\x11\xb9\xbd" } },
    .{ "FwpmEngineGetSecurityInfo0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmEngineGetSecurityInfo0", .signature = "\x00\x07\x09\x11\xb9\xb5\x09\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "FwpmEngineSetSecurityInfo0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmEngineSetSecurityInfo0", .signature = "\x00\x06\x09\x11\xb9\xb5\x09\x0f\x11\xb7\xc1\x0f\x11\xb7\xc1\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "FwpmSessionCreateEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSessionCreateEnumHandle0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xb9\xc1\x0f\x11\xb9\xc5" } },
    .{ "FwpmSessionEnum0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSessionEnum0", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xb9\xc5\x09\x0f\x0f\x0f\x11\xb9\xb1\x0f\x09" } },
    .{ "FwpmSessionDestroyEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSessionDestroyEnumHandle0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\xb9\xc5" } },
    .{ "FwpmTransactionBegin0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmTransactionBegin0", .signature = "\x00\x02\x09\x11\xb9\xb5\x09" } },
    .{ "FwpmTransactionCommit0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmTransactionCommit0", .signature = "\x00\x01\x09\x11\xb9\xb5" } },
    .{ "FwpmTransactionAbort0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmTransactionAbort0", .signature = "\x00\x01\x09\x11\xb9\xb5" } },
    .{ "FwpmProviderAdd0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderAdd0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xb9\xc9\x11\x82\xad" } },
    .{ "FwpmProviderDeleteByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderDeleteByKey0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0f\x11\x0d" } },
    .{ "FwpmProviderGetByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderGetByKey0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\x0d\x0f\x0f\x11\xb9\xc9" } },
    .{ "FwpmProviderCreateEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderCreateEnumHandle0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xb9\xcd\x0f\x11\xb9\xd1" } },
    .{ "FwpmProviderEnum0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderEnum0", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xb9\xd1\x09\x0f\x0f\x0f\x11\xb9\xc9\x0f\x09" } },
    .{ "FwpmProviderDestroyEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderDestroyEnumHandle0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\xb9\xd1" } },
    .{ "FwpmProviderGetSecurityInfoByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderGetSecurityInfoByKey0", .signature = "\x00\x08\x09\x11\xb9\xb5\x0f\x11\x0d\x09\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "FwpmProviderSetSecurityInfoByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderSetSecurityInfoByKey0", .signature = "\x00\x07\x09\x11\xb9\xb5\x0f\x11\x0d\x09\x0f\x11\xb7\xc1\x0f\x11\xb7\xc1\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "FwpmProviderSubscribeChanges0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderSubscribeChanges0", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x11\xb9\xd5\x12\xb9\xd9\x0f\x01\x0f\x11\x80\x85" } },
    .{ "FwpmProviderUnsubscribeChanges0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderUnsubscribeChanges0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\x80\x85" } },
    .{ "FwpmProviderSubscriptionsGet0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderSubscriptionsGet0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x0f\x0f\x11\xb9\xd5\x0f\x09" } },
    .{ "FwpmProviderContextAdd0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextAdd0", .signature = "\x00\x04\x09\x11\xb9\xb5\x0f\x11\xb9\xdd\x11\x82\xad\x0f\x0b" } },
    .{ "FwpmProviderContextAdd1", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextAdd1", .signature = "\x00\x04\x09\x11\xb9\xb5\x0f\x11\xb9\xe1\x11\x82\xad\x0f\x0b" } },
    .{ "FwpmProviderContextAdd2", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextAdd2", .signature = "\x00\x04\x09\x11\xb9\xb5\x0f\x11\xb9\xe5\x11\x82\xad\x0f\x0b" } },
    .{ "FwpmProviderContextAdd3", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextAdd3", .signature = "\x00\x04\x09\x11\xb9\xb5\x0f\x11\xb9\xe9\x11\x82\xad\x0f\x0b" } },
    .{ "FwpmProviderContextDeleteById0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextDeleteById0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0b" } },
    .{ "FwpmProviderContextDeleteByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextDeleteByKey0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0f\x11\x0d" } },
    .{ "FwpmProviderContextGetById0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextGetById0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0b\x0f\x0f\x11\xb9\xdd" } },
    .{ "FwpmProviderContextGetById1", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextGetById1", .signature = "\x00\x03\x09\x11\xb9\xb5\x0b\x0f\x0f\x11\xb9\xe1" } },
    .{ "FwpmProviderContextGetById2", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextGetById2", .signature = "\x00\x03\x09\x11\xb9\xb5\x0b\x0f\x0f\x11\xb9\xe5" } },
    .{ "FwpmProviderContextGetById3", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextGetById3", .signature = "\x00\x03\x09\x11\xb9\xb5\x0b\x0f\x0f\x11\xb9\xe9" } },
    .{ "FwpmProviderContextGetByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextGetByKey0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\x0d\x0f\x0f\x11\xb9\xdd" } },
    .{ "FwpmProviderContextGetByKey1", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextGetByKey1", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\x0d\x0f\x0f\x11\xb9\xe1" } },
    .{ "FwpmProviderContextGetByKey2", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextGetByKey2", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\x0d\x0f\x0f\x11\xb9\xe5" } },
    .{ "FwpmProviderContextGetByKey3", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextGetByKey3", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\x0d\x0f\x0f\x11\xb9\xe9" } },
    .{ "FwpmProviderContextCreateEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextCreateEnumHandle0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xb9\xed\x0f\x11\xb9\xf1" } },
    .{ "FwpmProviderContextEnum0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextEnum0", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xb9\xf1\x09\x0f\x0f\x0f\x11\xb9\xdd\x0f\x09" } },
    .{ "FwpmProviderContextEnum1", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextEnum1", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xb9\xf1\x09\x0f\x0f\x0f\x11\xb9\xe1\x0f\x09" } },
    .{ "FwpmProviderContextEnum2", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextEnum2", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xb9\xf1\x09\x0f\x0f\x0f\x11\xb9\xe5\x0f\x09" } },
    .{ "FwpmProviderContextEnum3", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextEnum3", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xb9\xf1\x09\x0f\x0f\x0f\x11\xb9\xe9\x0f\x09" } },
    .{ "FwpmProviderContextDestroyEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextDestroyEnumHandle0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\xb9\xf1" } },
    .{ "FwpmProviderContextGetSecurityInfoByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextGetSecurityInfoByKey0", .signature = "\x00\x08\x09\x11\xb9\xb5\x0f\x11\x0d\x09\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "FwpmProviderContextSetSecurityInfoByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextSetSecurityInfoByKey0", .signature = "\x00\x07\x09\x11\xb9\xb5\x0f\x11\x0d\x09\x0f\x11\xb7\xc1\x0f\x11\xb7\xc1\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "FwpmProviderContextSubscribeChanges0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextSubscribeChanges0", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x11\xb9\xf5\x12\xb9\xf9\x0f\x01\x0f\x11\x80\x85" } },
    .{ "FwpmProviderContextUnsubscribeChanges0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextUnsubscribeChanges0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\x80\x85" } },
    .{ "FwpmProviderContextSubscriptionsGet0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmProviderContextSubscriptionsGet0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x0f\x0f\x11\xb9\xf5\x0f\x09" } },
    .{ "FwpmSubLayerAdd0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSubLayerAdd0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xb9\xfd\x11\x82\xad" } },
    .{ "FwpmSubLayerDeleteByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSubLayerDeleteByKey0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0f\x11\x0d" } },
    .{ "FwpmSubLayerGetByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSubLayerGetByKey0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\x0d\x0f\x0f\x11\xb9\xfd" } },
    .{ "FwpmSubLayerCreateEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSubLayerCreateEnumHandle0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xba\x01\x0f\x11\xba\x05" } },
    .{ "FwpmSubLayerEnum0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSubLayerEnum0", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\x05\x09\x0f\x0f\x0f\x11\xb9\xfd\x0f\x09" } },
    .{ "FwpmSubLayerDestroyEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSubLayerDestroyEnumHandle0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\xba\x05" } },
    .{ "FwpmSubLayerGetSecurityInfoByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSubLayerGetSecurityInfoByKey0", .signature = "\x00\x08\x09\x11\xb9\xb5\x0f\x11\x0d\x09\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "FwpmSubLayerSetSecurityInfoByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSubLayerSetSecurityInfoByKey0", .signature = "\x00\x07\x09\x11\xb9\xb5\x0f\x11\x0d\x09\x0f\x11\xb7\xc1\x0f\x11\xb7\xc1\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "FwpmSubLayerSubscribeChanges0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSubLayerSubscribeChanges0", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x11\xba\x09\x12\xba\x0d\x0f\x01\x0f\x11\x80\x85" } },
    .{ "FwpmSubLayerUnsubscribeChanges0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSubLayerUnsubscribeChanges0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\x80\x85" } },
    .{ "FwpmSubLayerSubscriptionsGet0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSubLayerSubscriptionsGet0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x0f\x0f\x11\xba\x09\x0f\x09" } },
    .{ "FwpmLayerGetById0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmLayerGetById0", .signature = "\x00\x03\x09\x11\xb9\xb5\x07\x0f\x0f\x11\xba\x11" } },
    .{ "FwpmLayerGetByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmLayerGetByKey0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\x0d\x0f\x0f\x11\xba\x11" } },
    .{ "FwpmLayerCreateEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmLayerCreateEnumHandle0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xba\x15\x0f\x11\xba\x19" } },
    .{ "FwpmLayerEnum0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmLayerEnum0", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\x19\x09\x0f\x0f\x0f\x11\xba\x11\x0f\x09" } },
    .{ "FwpmLayerDestroyEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmLayerDestroyEnumHandle0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\xba\x19" } },
    .{ "FwpmLayerGetSecurityInfoByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmLayerGetSecurityInfoByKey0", .signature = "\x00\x08\x09\x11\xb9\xb5\x0f\x11\x0d\x09\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "FwpmLayerSetSecurityInfoByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmLayerSetSecurityInfoByKey0", .signature = "\x00\x07\x09\x11\xb9\xb5\x0f\x11\x0d\x09\x0f\x11\xb7\xc1\x0f\x11\xb7\xc1\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "FwpmCalloutAdd0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmCalloutAdd0", .signature = "\x00\x04\x09\x11\xb9\xb5\x0f\x11\xba\x1d\x11\x82\xad\x0f\x09" } },
    .{ "FwpmCalloutDeleteById0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmCalloutDeleteById0", .signature = "\x00\x02\x09\x11\xb9\xb5\x09" } },
    .{ "FwpmCalloutDeleteByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmCalloutDeleteByKey0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0f\x11\x0d" } },
    .{ "FwpmCalloutGetById0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmCalloutGetById0", .signature = "\x00\x03\x09\x11\xb9\xb5\x09\x0f\x0f\x11\xba\x1d" } },
    .{ "FwpmCalloutGetByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmCalloutGetByKey0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\x0d\x0f\x0f\x11\xba\x1d" } },
    .{ "FwpmCalloutCreateEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmCalloutCreateEnumHandle0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xba\x21\x0f\x11\xba\x25" } },
    .{ "FwpmCalloutEnum0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmCalloutEnum0", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\x25\x09\x0f\x0f\x0f\x11\xba\x1d\x0f\x09" } },
    .{ "FwpmCalloutDestroyEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmCalloutDestroyEnumHandle0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\xba\x25" } },
    .{ "FwpmCalloutGetSecurityInfoByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmCalloutGetSecurityInfoByKey0", .signature = "\x00\x08\x09\x11\xb9\xb5\x0f\x11\x0d\x09\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "FwpmCalloutSetSecurityInfoByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmCalloutSetSecurityInfoByKey0", .signature = "\x00\x07\x09\x11\xb9\xb5\x0f\x11\x0d\x09\x0f\x11\xb7\xc1\x0f\x11\xb7\xc1\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "FwpmCalloutSubscribeChanges0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmCalloutSubscribeChanges0", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x11\xba\x29\x12\xba\x2d\x0f\x01\x0f\x11\x80\x85" } },
    .{ "FwpmCalloutUnsubscribeChanges0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmCalloutUnsubscribeChanges0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\x80\x85" } },
    .{ "FwpmCalloutSubscriptionsGet0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmCalloutSubscriptionsGet0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x0f\x0f\x11\xba\x29\x0f\x09" } },
    .{ "FwpmFilterAdd0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmFilterAdd0", .signature = "\x00\x04\x09\x11\xb9\xb5\x0f\x11\xba\x31\x11\x82\xad\x0f\x0b" } },
    .{ "FwpmFilterDeleteById0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmFilterDeleteById0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0b" } },
    .{ "FwpmFilterDeleteByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmFilterDeleteByKey0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0f\x11\x0d" } },
    .{ "FwpmFilterGetById0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmFilterGetById0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0b\x0f\x0f\x11\xba\x31" } },
    .{ "FwpmFilterGetByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmFilterGetByKey0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\x0d\x0f\x0f\x11\xba\x31" } },
    .{ "FwpmFilterCreateEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmFilterCreateEnumHandle0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xba\x35\x0f\x11\xba\x39" } },
    .{ "FwpmFilterEnum0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmFilterEnum0", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\x39\x09\x0f\x0f\x0f\x11\xba\x31\x0f\x09" } },
    .{ "FwpmFilterDestroyEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmFilterDestroyEnumHandle0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\xba\x39" } },
    .{ "FwpmFilterGetSecurityInfoByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmFilterGetSecurityInfoByKey0", .signature = "\x00\x08\x09\x11\xb9\xb5\x0f\x11\x0d\x09\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "FwpmFilterSetSecurityInfoByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmFilterSetSecurityInfoByKey0", .signature = "\x00\x07\x09\x11\xb9\xb5\x0f\x11\x0d\x09\x0f\x11\xb7\xc1\x0f\x11\xb7\xc1\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "FwpmFilterSubscribeChanges0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmFilterSubscribeChanges0", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x11\xba\x3d\x12\xba\x41\x0f\x01\x0f\x11\x80\x85" } },
    .{ "FwpmFilterUnsubscribeChanges0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmFilterUnsubscribeChanges0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\x80\x85" } },
    .{ "FwpmFilterSubscriptionsGet0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmFilterSubscriptionsGet0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x0f\x0f\x11\xba\x3d\x0f\x09" } },
    .{ "FwpmGetAppIdFromFileName0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmGetAppIdFromFileName0", .signature = "\x00\x02\x09\x11\x05\x0f\x0f\x11\xba\x45" } },
    .{ "FwpmIPsecTunnelAdd0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmIPsecTunnelAdd0", .signature = "\x00\x07\x09\x11\xb9\xb5\x09\x0f\x11\xb9\xdd\x0f\x11\xb9\xdd\x09\x0f\x11\xba\x49\x11\x82\xad" } },
    .{ "FwpmIPsecTunnelAdd1", MethodRecord{ .library = "fwpuclnt", .import = "FwpmIPsecTunnelAdd1", .signature = "\x00\x08\x09\x11\xb9\xb5\x09\x0f\x11\xb9\xe1\x0f\x11\xb9\xe1\x09\x0f\x11\xba\x49\x0f\x11\x0d\x11\x82\xad" } },
    .{ "FwpmIPsecTunnelAdd2", MethodRecord{ .library = "fwpuclnt", .import = "FwpmIPsecTunnelAdd2", .signature = "\x00\x08\x09\x11\xb9\xb5\x09\x0f\x11\xb9\xe5\x0f\x11\xb9\xe5\x09\x0f\x11\xba\x49\x0f\x11\x0d\x11\x82\xad" } },
    .{ "FwpmIPsecTunnelAdd3", MethodRecord{ .library = "fwpuclnt", .import = "FwpmIPsecTunnelAdd3", .signature = "\x00\x08\x09\x11\xb9\xb5\x09\x0f\x11\xb9\xe9\x0f\x11\xb9\xe9\x09\x0f\x11\xba\x49\x0f\x11\x0d\x11\x82\xad" } },
    .{ "FwpmIPsecTunnelDeleteByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmIPsecTunnelDeleteByKey0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0f\x11\x0d" } },
    .{ "IPsecGetStatistics0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecGetStatistics0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0f\x11\xba\x4d" } },
    .{ "IPsecGetStatistics1", MethodRecord{ .library = "fwpuclnt", .import = "IPsecGetStatistics1", .signature = "\x00\x02\x09\x11\xb9\xb5\x0f\x11\xba\x51" } },
    .{ "IPsecSaContextCreate0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextCreate0", .signature = "\x00\x04\x09\x11\xb9\xb5\x0f\x11\xba\x55\x0f\x0b\x0f\x0b" } },
    .{ "IPsecSaContextCreate1", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextCreate1", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x11\xba\x59\x0f\x11\xba\x5d\x0f\x0b\x0f\x0b" } },
    .{ "IPsecSaContextDeleteById0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextDeleteById0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0b" } },
    .{ "IPsecSaContextGetById0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextGetById0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0b\x0f\x0f\x11\xba\x61" } },
    .{ "IPsecSaContextGetById1", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextGetById1", .signature = "\x00\x03\x09\x11\xb9\xb5\x0b\x0f\x0f\x11\xba\x65" } },
    .{ "IPsecSaContextGetSpi0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextGetSpi0", .signature = "\x00\x04\x09\x11\xb9\xb5\x0b\x0f\x11\xba\x69\x0f\x09" } },
    .{ "IPsecSaContextGetSpi1", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextGetSpi1", .signature = "\x00\x04\x09\x11\xb9\xb5\x0b\x0f\x11\xba\x6d\x0f\x09" } },
    .{ "IPsecSaContextSetSpi0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextSetSpi0", .signature = "\x00\x04\x09\x11\xb9\xb5\x0b\x0f\x11\xba\x6d\x09" } },
    .{ "IPsecSaContextAddInbound0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextAddInbound0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0b\x0f\x11\xba\x71" } },
    .{ "IPsecSaContextAddOutbound0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextAddOutbound0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0b\x0f\x11\xba\x71" } },
    .{ "IPsecSaContextAddInbound1", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextAddInbound1", .signature = "\x00\x03\x09\x11\xb9\xb5\x0b\x0f\x11\xba\x75" } },
    .{ "IPsecSaContextAddOutbound1", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextAddOutbound1", .signature = "\x00\x03\x09\x11\xb9\xb5\x0b\x0f\x11\xba\x75" } },
    .{ "IPsecSaContextExpire0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextExpire0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0b" } },
    .{ "IPsecSaContextUpdate0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextUpdate0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0b\x0f\x11\xba\x65" } },
    .{ "IPsecSaContextCreateEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextCreateEnumHandle0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xba\x79\x0f\x11\xba\x7d" } },
    .{ "IPsecSaContextEnum0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextEnum0", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\x7d\x09\x0f\x0f\x0f\x11\xba\x61\x0f\x09" } },
    .{ "IPsecSaContextEnum1", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextEnum1", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\x7d\x09\x0f\x0f\x0f\x11\xba\x65\x0f\x09" } },
    .{ "IPsecSaContextDestroyEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextDestroyEnumHandle0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\xba\x7d" } },
    .{ "IPsecSaContextSubscribe0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextSubscribe0", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x11\xba\x81\x12\xba\x85\x0f\x01\x0f\x11\x80\x85" } },
    .{ "IPsecSaContextUnsubscribe0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextUnsubscribe0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\x80\x85" } },
    .{ "IPsecSaContextSubscriptionsGet0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaContextSubscriptionsGet0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x0f\x0f\x11\xba\x81\x0f\x09" } },
    .{ "IPsecSaCreateEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaCreateEnumHandle0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xba\x89\x0f\x11\xba\x8d" } },
    .{ "IPsecSaEnum0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaEnum0", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\x8d\x09\x0f\x0f\x0f\x11\xba\x91\x0f\x09" } },
    .{ "IPsecSaEnum1", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaEnum1", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\x8d\x09\x0f\x0f\x0f\x11\xba\x95\x0f\x09" } },
    .{ "IPsecSaDestroyEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaDestroyEnumHandle0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\xba\x8d" } },
    .{ "IPsecSaDbGetSecurityInfo0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaDbGetSecurityInfo0", .signature = "\x00\x07\x09\x11\xb9\xb5\x09\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "IPsecSaDbSetSecurityInfo0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecSaDbSetSecurityInfo0", .signature = "\x00\x06\x09\x11\xb9\xb5\x09\x0f\x11\xb7\xc1\x0f\x11\xb7\xc1\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "IPsecDospGetStatistics0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecDospGetStatistics0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0f\x11\xba\x99" } },
    .{ "IPsecDospStateCreateEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecDospStateCreateEnumHandle0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xba\x9d\x0f\x11\xba\xa1" } },
    .{ "IPsecDospStateEnum0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecDospStateEnum0", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\xa1\x09\x0f\x0f\x0f\x11\xba\xa5\x0f\x09" } },
    .{ "IPsecDospStateDestroyEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecDospStateDestroyEnumHandle0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\xba\xa1" } },
    .{ "IPsecDospGetSecurityInfo0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecDospGetSecurityInfo0", .signature = "\x00\x07\x09\x11\xb9\xb5\x09\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "IPsecDospSetSecurityInfo0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecDospSetSecurityInfo0", .signature = "\x00\x06\x09\x11\xb9\xb5\x09\x0f\x11\xb7\xc1\x0f\x11\xb7\xc1\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "IPsecKeyManagerAddAndRegister0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecKeyManagerAddAndRegister0", .signature = "\x00\x04\x09\x11\xb9\xb5\x0f\x11\xba\xa9\x0f\x11\xba\xad\x0f\x11\x80\x85" } },
    .{ "IPsecKeyManagerUnregisterAndDelete0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecKeyManagerUnregisterAndDelete0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\x80\x85" } },
    .{ "IPsecKeyManagersGet0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecKeyManagersGet0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x0f\x0f\x11\xba\xa9\x0f\x09" } },
    .{ "IPsecKeyManagerGetSecurityInfoByKey0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecKeyManagerGetSecurityInfoByKey0", .signature = "\x00\x08\x09\x11\xb9\xb5\x0f\x01\x09\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "IPsecKeyManagerSetSecurityInfoByKey0", MethodRecord{ .library = "fwpuclnt", .import = "IPsecKeyManagerSetSecurityInfoByKey0", .signature = "\x00\x07\x09\x11\xb9\xb5\x0f\x01\x09\x0f\x11\xb7\xc1\x0f\x11\xb7\xc1\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "IkeextGetStatistics0", MethodRecord{ .library = "fwpuclnt", .import = "IkeextGetStatistics0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0f\x11\xba\xb1" } },
    .{ "IkeextGetStatistics1", MethodRecord{ .library = "fwpuclnt", .import = "IkeextGetStatistics1", .signature = "\x00\x02\x09\x11\xb9\xb5\x0f\x11\xba\xb5" } },
    .{ "IkeextSaDeleteById0", MethodRecord{ .library = "fwpuclnt", .import = "IkeextSaDeleteById0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0b" } },
    .{ "IkeextSaGetById0", MethodRecord{ .library = "fwpuclnt", .import = "IkeextSaGetById0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0b\x0f\x0f\x11\xba\xb9" } },
    .{ "IkeextSaGetById1", MethodRecord{ .library = "fwpuclnt", .import = "IkeextSaGetById1", .signature = "\x00\x04\x09\x11\xb9\xb5\x0b\x0f\x11\x0d\x0f\x0f\x11\xba\xbd" } },
    .{ "IkeextSaGetById2", MethodRecord{ .library = "fwpuclnt", .import = "IkeextSaGetById2", .signature = "\x00\x04\x09\x11\xb9\xb5\x0b\x0f\x11\x0d\x0f\x0f\x11\xba\xc1" } },
    .{ "IkeextSaCreateEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "IkeextSaCreateEnumHandle0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xba\xc5\x0f\x11\xba\xc9" } },
    .{ "IkeextSaEnum0", MethodRecord{ .library = "fwpuclnt", .import = "IkeextSaEnum0", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\xc9\x09\x0f\x0f\x0f\x11\xba\xb9\x0f\x09" } },
    .{ "IkeextSaEnum1", MethodRecord{ .library = "fwpuclnt", .import = "IkeextSaEnum1", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\xc9\x09\x0f\x0f\x0f\x11\xba\xbd\x0f\x09" } },
    .{ "IkeextSaEnum2", MethodRecord{ .library = "fwpuclnt", .import = "IkeextSaEnum2", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\xc9\x09\x0f\x0f\x0f\x11\xba\xc1\x0f\x09" } },
    .{ "IkeextSaDestroyEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "IkeextSaDestroyEnumHandle0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\xba\xc9" } },
    .{ "IkeextSaDbGetSecurityInfo0", MethodRecord{ .library = "fwpuclnt", .import = "IkeextSaDbGetSecurityInfo0", .signature = "\x00\x07\x09\x11\xb9\xb5\x09\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "IkeextSaDbSetSecurityInfo0", MethodRecord{ .library = "fwpuclnt", .import = "IkeextSaDbSetSecurityInfo0", .signature = "\x00\x06\x09\x11\xb9\xb5\x09\x0f\x11\xb7\xc1\x0f\x11\xb7\xc1\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "FwpmNetEventCreateEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventCreateEnumHandle0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xba\xcd\x0f\x11\xba\xd1" } },
    .{ "FwpmNetEventEnum0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventEnum0", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\xd1\x09\x0f\x0f\x0f\x11\xba\xd5\x0f\x09" } },
    .{ "FwpmNetEventEnum1", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventEnum1", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\xd1\x09\x0f\x0f\x0f\x11\xba\xd9\x0f\x09" } },
    .{ "FwpmNetEventEnum2", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventEnum2", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\xd1\x09\x0f\x0f\x0f\x11\xba\xdd\x0f\x09" } },
    .{ "FwpmNetEventEnum3", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventEnum3", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\xd1\x09\x0f\x0f\x0f\x11\xba\xe1\x0f\x09" } },
    .{ "FwpmNetEventEnum4", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventEnum4", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\xd1\x09\x0f\x0f\x0f\x11\xba\xe5\x0f\x09" } },
    .{ "FwpmNetEventEnum5", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventEnum5", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xba\xd1\x09\x0f\x0f\x0f\x11\xba\xe9\x0f\x09" } },
    .{ "FwpmNetEventDestroyEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventDestroyEnumHandle0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\xba\xd1" } },
    .{ "FwpmNetEventsGetSecurityInfo0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventsGetSecurityInfo0", .signature = "\x00\x07\x09\x11\xb9\xb5\x09\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "FwpmNetEventsSetSecurityInfo0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventsSetSecurityInfo0", .signature = "\x00\x06\x09\x11\xb9\xb5\x09\x0f\x11\xb7\xc1\x0f\x11\xb7\xc1\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "FwpmNetEventSubscribe0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventSubscribe0", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x11\xba\xed\x12\xba\xf1\x0f\x01\x0f\x11\x80\x85" } },
    .{ "FwpmNetEventUnsubscribe0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventUnsubscribe0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\x80\x85" } },
    .{ "FwpmNetEventSubscriptionsGet0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventSubscriptionsGet0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x0f\x0f\x11\xba\xed\x0f\x09" } },
    .{ "FwpmNetEventSubscribe1", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventSubscribe1", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x11\xba\xed\x12\xba\xf5\x0f\x01\x0f\x11\x80\x85" } },
    .{ "FwpmNetEventSubscribe2", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventSubscribe2", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x11\xba\xed\x12\xba\xf9\x0f\x01\x0f\x11\x80\x85" } },
    .{ "FwpmNetEventSubscribe3", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventSubscribe3", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x11\xba\xed\x12\xba\xfd\x0f\x01\x0f\x11\x80\x85" } },
    .{ "FwpmNetEventSubscribe4", MethodRecord{ .library = "fwpuclnt", .import = "FwpmNetEventSubscribe4", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x11\xba\xed\x12\xbb\x01\x0f\x01\x0f\x11\x80\x85" } },
    .{ "FwpmDynamicKeywordSubscribe0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmDynamicKeywordSubscribe0", .signature = "\x00\x04\x09\x09\x12\xbb\x05\x0f\x01\x0f\x11\x80\x85" } },
    .{ "FwpmDynamicKeywordUnsubscribe0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmDynamicKeywordUnsubscribe0", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "FwpmSystemPortsGet0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSystemPortsGet0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0f\x0f\x11\xbb\x09" } },
    .{ "FwpmSystemPortsSubscribe0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSystemPortsSubscribe0", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x01\x12\xbb\x0d\x0f\x01\x0f\x11\x80\x85" } },
    .{ "FwpmSystemPortsUnsubscribe0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmSystemPortsUnsubscribe0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\x80\x85" } },
    .{ "FwpmConnectionGetById0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmConnectionGetById0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0b\x0f\x0f\x11\xbb\x11" } },
    .{ "FwpmConnectionEnum0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmConnectionEnum0", .signature = "\x00\x05\x09\x11\xb9\xb5\x11\xbb\x15\x09\x0f\x0f\x0f\x11\xbb\x11\x0f\x09" } },
    .{ "FwpmConnectionCreateEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmConnectionCreateEnumHandle0", .signature = "\x00\x03\x09\x11\xb9\xb5\x0f\x11\xbb\x19\x0f\x11\xbb\x15" } },
    .{ "FwpmConnectionDestroyEnumHandle0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmConnectionDestroyEnumHandle0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\xbb\x15" } },
    .{ "FwpmConnectionGetSecurityInfo0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmConnectionGetSecurityInfo0", .signature = "\x00\x07\x09\x11\xb9\xb5\x09\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "FwpmConnectionSetSecurityInfo0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmConnectionSetSecurityInfo0", .signature = "\x00\x06\x09\x11\xb9\xb5\x09\x0f\x11\xb7\xc1\x0f\x11\xb7\xc1\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "FwpmConnectionSubscribe0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmConnectionSubscribe0", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x11\xbb\x1d\x12\xbb\x21\x0f\x01\x0f\x11\x80\x85" } },
    .{ "FwpmConnectionUnsubscribe0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmConnectionUnsubscribe0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\x80\x85" } },
    .{ "FwpmvSwitchEventSubscribe0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmvSwitchEventSubscribe0", .signature = "\x00\x05\x09\x11\xb9\xb5\x0f\x11\xbb\x25\x12\xbb\x29\x0f\x01\x0f\x11\x80\x85" } },
    .{ "FwpmvSwitchEventUnsubscribe0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmvSwitchEventUnsubscribe0", .signature = "\x00\x02\x09\x11\xb9\xb5\x11\x80\x85" } },
    .{ "FwpmvSwitchEventsGetSecurityInfo0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmvSwitchEventsGetSecurityInfo0", .signature = "\x00\x07\x09\x11\xb9\xb5\x09\x0f\x11\x81\x15\x0f\x11\x81\x15\x0f\x0f\x11\x93\xc9\x0f\x0f\x11\x93\xc9\x0f\x11\x82\xad" } },
    .{ "FwpmvSwitchEventsSetSecurityInfo0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmvSwitchEventsSetSecurityInfo0", .signature = "\x00\x06\x09\x11\xb9\xb5\x09\x0f\x11\xb7\xc1\x0f\x11\xb7\xc1\x0f\x11\x93\xc9\x0f\x11\x93\xc9" } },
    .{ "FwpmConnectionPolicyAdd0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmConnectionPolicyAdd0", .signature = "\x00\x07\x09\x11\xb9\xb5\x0f\x11\xb9\xe9\x11\xbb\x2d\x0b\x09\x0f\x11\xba\x49\x11\x82\xad" } },
    .{ "FwpmConnectionPolicyDeleteByKey0", MethodRecord{ .library = "fwpuclnt", .import = "FwpmConnectionPolicyDeleteByKey0", .signature = "\x00\x02\x09\x11\xb9\xb5\x0f\x11\x0d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x115 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSID" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x13c9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "ACL" },
        0x37c1 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SID" },
        0x39ad => TypeRefEntry{ .namespace = "Windows.Win32.System.Rpc", .name = "SEC_WINNT_AUTH_IDENTITY_W" },
        0x39b1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_SESSION0" },
        0x39b5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_ENGINE_HANDLE" },
        0x39b9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_ENGINE_OPTION" },
        0x39bd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWP_VALUE0" },
        0x39c1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_SESSION_ENUM_TEMPLATE0" },
        0x39c5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_SESSION_ENUM_HANDLE" },
        0x39c9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_PROVIDER0" },
        0x39cd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_PROVIDER_ENUM_TEMPLATE0" },
        0x39d1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_PROVIDER_ENUM_HANDLE" },
        0x39d5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_PROVIDER_SUBSCRIPTION0" },
        0x39d9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_PROVIDER_CHANGE_CALLBACK0" },
        0x39dd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_PROVIDER_CONTEXT0" },
        0x39e1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_PROVIDER_CONTEXT1" },
        0x39e5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_PROVIDER_CONTEXT2" },
        0x39e9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_PROVIDER_CONTEXT3" },
        0x39ed => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0" },
        0x39f1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_PROVIDER_CONTEXT_ENUM_HANDLE" },
        0x39f5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_PROVIDER_CONTEXT_SUBSCRIPTION0" },
        0x39f9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_PROVIDER_CONTEXT_CHANGE_CALLBACK0" },
        0x39fd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_SUBLAYER0" },
        0x3a01 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_SUBLAYER_ENUM_TEMPLATE0" },
        0x3a05 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_SUBLAYER_ENUM_HANDLE" },
        0x3a09 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_SUBLAYER_SUBSCRIPTION0" },
        0x3a0d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_SUBLAYER_CHANGE_CALLBACK0" },
        0x3a11 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_LAYER0" },
        0x3a15 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_LAYER_ENUM_TEMPLATE0" },
        0x3a19 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_LAYER_ENUM_HANDLE" },
        0x3a1d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_CALLOUT0" },
        0x3a21 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_CALLOUT_ENUM_TEMPLATE0" },
        0x3a25 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_CALLOUT_ENUM_HANDLE" },
        0x3a29 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_CALLOUT_SUBSCRIPTION0" },
        0x3a2d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_CALLOUT_CHANGE_CALLBACK0" },
        0x3a31 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_FILTER0" },
        0x3a35 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_FILTER_ENUM_TEMPLATE0" },
        0x3a39 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_FILTER_ENUM_HANDLE" },
        0x3a3d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_FILTER_SUBSCRIPTION0" },
        0x3a41 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_FILTER_CHANGE_CALLBACK0" },
        0x3a45 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWP_BYTE_BLOB" },
        0x3a49 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_FILTER_CONDITION0" },
        0x3a4d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_STATISTICS0" },
        0x3a51 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_STATISTICS1" },
        0x3a55 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_TRAFFIC0" },
        0x3a59 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_TRAFFIC1" },
        0x3a5d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_VIRTUAL_IF_TUNNEL_INFO0" },
        0x3a61 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_SA_CONTEXT0" },
        0x3a65 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_SA_CONTEXT1" },
        0x3a69 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_GETSPI0" },
        0x3a6d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_GETSPI1" },
        0x3a71 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_SA_BUNDLE0" },
        0x3a75 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_SA_BUNDLE1" },
        0x3a79 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_SA_CONTEXT_ENUM_TEMPLATE0" },
        0x3a7d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_SA_CONTEXT_ENUM_HANDLE" },
        0x3a81 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_SA_CONTEXT_SUBSCRIPTION0" },
        0x3a85 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_SA_CONTEXT_CALLBACK0" },
        0x3a89 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_SA_ENUM_TEMPLATE0" },
        0x3a8d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_SA_ENUM_HANDLE" },
        0x3a91 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_SA_DETAILS0" },
        0x3a95 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_SA_DETAILS1" },
        0x3a99 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_DOSP_STATISTICS0" },
        0x3a9d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_DOSP_STATE_ENUM_TEMPLATE0" },
        0x3aa1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_DOSP_STATE_ENUM_HANDLE" },
        0x3aa5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_DOSP_STATE0" },
        0x3aa9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_KEY_MANAGER0" },
        0x3aad => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IPSEC_KEY_MANAGER_CALLBACKS0" },
        0x3ab1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IKEEXT_STATISTICS0" },
        0x3ab5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IKEEXT_STATISTICS1" },
        0x3ab9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IKEEXT_SA_DETAILS0" },
        0x3abd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IKEEXT_SA_DETAILS1" },
        0x3ac1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IKEEXT_SA_DETAILS2" },
        0x3ac5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IKEEXT_SA_ENUM_TEMPLATE0" },
        0x3ac9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "IKEEXT_SA_ENUM_HANDLE" },
        0x3acd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_NET_EVENT_ENUM_TEMPLATE0" },
        0x3ad1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_NET_EVENT_ENUM_HANDLE" },
        0x3ad5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_NET_EVENT0" },
        0x3ad9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_NET_EVENT1" },
        0x3add => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_NET_EVENT2" },
        0x3ae1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_NET_EVENT3" },
        0x3ae5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_NET_EVENT4" },
        0x3ae9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_NET_EVENT5" },
        0x3aed => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_NET_EVENT_SUBSCRIPTION0" },
        0x3af1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_NET_EVENT_CALLBACK0" },
        0x3af5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_NET_EVENT_CALLBACK1" },
        0x3af9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_NET_EVENT_CALLBACK2" },
        0x3afd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_NET_EVENT_CALLBACK3" },
        0x3b01 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_NET_EVENT_CALLBACK4" },
        0x3b05 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_DYNAMIC_KEYWORD_CALLBACK0" },
        0x3b09 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_SYSTEM_PORTS0" },
        0x3b0d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_SYSTEM_PORTS_CALLBACK0" },
        0x3b11 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_CONNECTION0" },
        0x3b15 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_CONNECTION_ENUM_HANDLE" },
        0x3b19 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_CONNECTION_ENUM_TEMPLATE0" },
        0x3b1d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_CONNECTION_SUBSCRIPTION0" },
        0x3b21 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_CONNECTION_CALLBACK0" },
        0x3b25 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_VSWITCH_EVENT_SUBSCRIPTION0" },
        0x3b29 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWPM_VSWITCH_EVENT_CALLBACK0" },
        0x3b2d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsFilteringPlatform", .name = "FWP_IP_VERSION" },
        else => null,
    };
}

pub const IPSEC_SA_BUNDLE_FLAG_ND_SECURE = 1;
pub const IPSEC_SA_BUNDLE_FLAG_ND_BOUNDARY = 2;
pub const IPSEC_SA_BUNDLE_FLAG_ND_PEER_NAT_BOUNDARY = 4;
pub const IPSEC_SA_BUNDLE_FLAG_GUARANTEE_ENCRYPTION = 8;
pub const IPSEC_SA_BUNDLE_FLAG_ALLOW_NULL_TARGET_NAME_MATCH = 512;
pub const IPSEC_SA_BUNDLE_FLAG_CLEAR_DF_ON_TUNNEL = 1024;
pub const IPSEC_SA_BUNDLE_FLAG_ASSUME_UDP_CONTEXT_OUTBOUND = 2048;
pub const IPSEC_SA_BUNDLE_FLAG_ND_PEER_BOUNDARY = 4096;
pub const IPSEC_SA_BUNDLE_FLAG_SUPPRESS_DUPLICATE_DELETION = 8192;
pub const IPSEC_SA_BUNDLE_FLAG_PEER_SUPPORTS_GUARANTEE_ENCRYPTION = 16384;
pub const IPSEC_POLICY_FLAG_ND_SECURE = 2;
pub const IPSEC_POLICY_FLAG_ND_BOUNDARY = 4;
pub const IPSEC_POLICY_FLAG_NAT_ENCAP_ALLOW_PEER_BEHIND_NAT = 16;
pub const IPSEC_POLICY_FLAG_NAT_ENCAP_ALLOW_GENERAL_NAT_TRAVERSAL = 32;
pub const IPSEC_POLICY_FLAG_DONT_NEGOTIATE_SECOND_LIFETIME = 64;
pub const IPSEC_POLICY_FLAG_DONT_NEGOTIATE_BYTE_LIFETIME = 128;
pub const IPSEC_POLICY_FLAG_CLEAR_DF_ON_TUNNEL = 8;
pub const IPSEC_POLICY_FLAG_ENABLE_V6_IN_V4_TUNNELING = 256;
pub const IPSEC_POLICY_FLAG_ENABLE_SERVER_ADDR_ASSIGNMENT = 512;
pub const IPSEC_POLICY_FLAG_TUNNEL_ALLOW_OUTBOUND_CLEAR_CONNECTION = 1024;
pub const IPSEC_POLICY_FLAG_TUNNEL_BYPASS_ALREADY_SECURE_CONNECTION = 2048;
pub const IPSEC_POLICY_FLAG_TUNNEL_BYPASS_ICMPV6 = 4096;
pub const IPSEC_POLICY_FLAG_KEY_MANAGER_ALLOW_DICTATE_KEY = 8192;
pub const IKEEXT_CERT_AUTH_FLAG_SSL_ONE_WAY = 1;
pub const IKEEXT_CERT_AUTH_ENABLE_CRL_CHECK_STRONG = 4;
pub const IKEEXT_CERT_AUTH_DISABLE_SSL_CERT_VALIDATION = 8;
pub const IKEEXT_CERT_AUTH_ALLOW_HTTP_CERT_LOOKUP = 16;
pub const IKEEXT_CERT_AUTH_URL_CONTAINS_BUNDLE = 32;
pub const IKEEXT_PSK_FLAG_LOCAL_AUTH_ONLY = 1;
pub const IKEEXT_PSK_FLAG_REMOTE_AUTH_ONLY = 2;
pub const IKEEXT_POLICY_FLAG_DISABLE_DIAGNOSTICS = 1;
pub const IKEEXT_POLICY_FLAG_NO_MACHINE_LUID_VERIFY = 2;
pub const IKEEXT_POLICY_FLAG_NO_IMPERSONATION_LUID_VERIFY = 4;
pub const IKEEXT_POLICY_FLAG_ENABLE_OPTIONAL_DH = 8;
pub const FWPM_SUBSCRIPTION_FLAG_NOTIFY_ON_ADD = 1;
pub const FWPM_SUBSCRIPTION_FLAG_NOTIFY_ON_DELETE = 2;
pub const IKEEXT_CERT_FLAG_ENABLE_ACCOUNT_MAPPING = 1;
pub const IKEEXT_CERT_FLAG_DISABLE_REQUEST_PAYLOAD = 2;
pub const IKEEXT_CERT_FLAG_USE_NAP_CERTIFICATE = 4;
pub const IKEEXT_CERT_FLAG_INTERMEDIATE_CA = 8;
pub const IKEEXT_CERT_FLAG_IGNORE_INIT_CERT_MAP_FAILURE = 16;
pub const IKEEXT_CERT_FLAG_PREFER_NAP_CERTIFICATE_OUTBOUND = 32;
pub const IKEEXT_CERT_FLAG_SELECT_NAP_CERTIFICATE = 64;
pub const IKEEXT_CERT_FLAG_VERIFY_NAP_CERTIFICATE = 128;
pub const IKEEXT_CERT_FLAG_FOLLOW_RENEWAL_CERTIFICATE = 256;
pub const IPSEC_DOSP_FLAG_ENABLE_IKEV1 = 1;
pub const IPSEC_DOSP_FLAG_ENABLE_IKEV2 = 2;
pub const IPSEC_DOSP_FLAG_DISABLE_AUTHIP = 4;
pub const IPSEC_DOSP_FLAG_DISABLE_DEFAULT_BLOCK = 8;
pub const IPSEC_DOSP_FLAG_FILTER_BLOCK = 16;
pub const IPSEC_DOSP_FLAG_FILTER_EXEMPT = 32;
pub const IKEEXT_KERB_AUTH_DISABLE_INITIATOR_TOKEN_GENERATION = 1;
pub const IKEEXT_KERB_AUTH_DONT_ACCEPT_EXPLICIT_CREDENTIALS = 2;
pub const IKEEXT_RESERVED_AUTH_DISABLE_INITIATOR_TOKEN_GENERATION = 1;
pub const IKEEXT_EAP_FLAG_LOCAL_AUTH_ONLY = 1;
pub const IKEEXT_EAP_FLAG_REMOTE_AUTH_ONLY = 2;
pub const FWPM_FILTER_FLAG_NONE = 0;
pub const FWPM_FILTER_FLAG_PERSISTENT = 1;
pub const FWPM_FILTER_FLAG_BOOTTIME = 2;
pub const FWPM_FILTER_FLAG_HAS_PROVIDER_CONTEXT = 4;
pub const FWPM_FILTER_FLAG_CLEAR_ACTION_RIGHT = 8;
pub const FWPM_FILTER_FLAG_PERMIT_IF_CALLOUT_UNREGISTERED = 16;
pub const FWPM_FILTER_FLAG_DISABLED = 32;
pub const FWPM_FILTER_FLAG_INDEXED = 64;
pub const FWP_ACTION_BLOCK = 4097;
pub const FWP_ACTION_PERMIT = 4098;
pub const FWP_ACTION_CALLOUT_TERMINATING = 20483;
pub const FWP_ACTION_CALLOUT_INSPECTION = 24580;
pub const FWP_ACTION_CALLOUT_UNKNOWN = 16389;
pub const FWP_ACTION_CONTINUE = 8198;
pub const FWP_ACTION_NONE = 7;
pub const FWP_ACTION_NONE_NO_MATCH = 8;
pub const FWPM_NET_EVENT_KEYWORD_INBOUND_MCAST = 1;
pub const FWPM_NET_EVENT_KEYWORD_INBOUND_BCAST = 2;
pub const FWPM_NET_EVENT_KEYWORD_CAPABILITY_DROP = 4;
pub const FWPM_NET_EVENT_KEYWORD_CAPABILITY_ALLOW = 8;
pub const FWPM_NET_EVENT_KEYWORD_CLASSIFY_ALLOW = 16;
pub const FWPM_NET_EVENT_KEYWORD_PORT_SCANNING_DROP = 32;
pub const FWPM_ENGINE_OPTION_PACKET_QUEUE_NONE = 0;
pub const FWPM_ENGINE_OPTION_PACKET_QUEUE_INBOUND = 1;
pub const FWPM_ENGINE_OPTION_PACKET_QUEUE_FORWARD = 2;
pub const FWPM_ENGINE_OPTION_PACKET_BATCH_INBOUND = 4;
pub const FWPM_SESSION_FLAG_DYNAMIC = 1;
pub const FWPM_SESSION_FLAG_RESERVED = 268435456;
pub const FWPM_PROVIDER_FLAG_PERSISTENT = 1;
pub const FWPM_PROVIDER_FLAG_DISABLED = 16;
pub const FWPM_PROVIDER_CONTEXT_FLAG_PERSISTENT = 1;
pub const FWPM_PROVIDER_CONTEXT_FLAG_DOWNLEVEL = 2;
pub const FWPM_SUBLAYER_FLAG_PERSISTENT = 1;
pub const FWPM_LAYER_FLAG_KERNEL = 1;
pub const FWPM_LAYER_FLAG_BUILTIN = 2;
pub const FWPM_LAYER_FLAG_CLASSIFY_MOSTLY = 4;
pub const FWPM_LAYER_FLAG_BUFFERED = 8;
pub const FWPM_CALLOUT_FLAG_PERSISTENT = 65536;
pub const FWPM_CALLOUT_FLAG_USES_PROVIDER_CONTEXT = 131072;
pub const FWPM_CALLOUT_FLAG_REGISTERED = 262144;
pub const FWPM_FILTER_FLAG_HAS_SECURITY_REALM_PROVIDER_CONTEXT = 128;
pub const FWPM_FILTER_FLAG_SYSTEMOS_ONLY = 256;
pub const FWPM_FILTER_FLAG_GAMEOS_ONLY = 512;
pub const FWPM_FILTER_FLAG_SILENT_MODE = 1024;
pub const FWPM_FILTER_FLAG_IPSEC_NO_ACQUIRE_INITIATE = 2048;
pub const FWPM_FILTER_FLAG_RESERVED0 = 4096;
pub const FWPM_FILTER_FLAG_RESERVED1 = 8192;
pub const FWPM_FILTER_FLAG_RESERVED2 = 16384;
pub const FWPM_NET_EVENT_FLAG_IP_PROTOCOL_SET = 1;
pub const FWPM_NET_EVENT_FLAG_LOCAL_ADDR_SET = 2;
pub const FWPM_NET_EVENT_FLAG_REMOTE_ADDR_SET = 4;
pub const FWPM_NET_EVENT_FLAG_LOCAL_PORT_SET = 8;
pub const FWPM_NET_EVENT_FLAG_REMOTE_PORT_SET = 16;
pub const FWPM_NET_EVENT_FLAG_APP_ID_SET = 32;
pub const FWPM_NET_EVENT_FLAG_USER_ID_SET = 64;
pub const FWPM_NET_EVENT_FLAG_SCOPE_ID_SET = 128;
pub const FWPM_NET_EVENT_FLAG_IP_VERSION_SET = 256;
pub const FWPM_NET_EVENT_FLAG_REAUTH_REASON_SET = 512;
pub const FWPM_NET_EVENT_FLAG_PACKAGE_ID_SET = 1024;
pub const FWPM_NET_EVENT_FLAG_ENTERPRISE_ID_SET = 2048;
pub const FWPM_NET_EVENT_FLAG_POLICY_FLAGS_SET = 4096;
pub const FWPM_NET_EVENT_FLAG_EFFECTIVE_NAME_SET = 8192;
pub const IKEEXT_CERT_HASH_LEN = 20;
pub const FWPM_NET_EVENT_IKEEXT_MM_FAILURE_FLAG_BENIGN = 1;
pub const FWPM_NET_EVENT_IKEEXT_MM_FAILURE_FLAG_MULTIPLE = 2;
pub const FWPM_NET_EVENT_IKEEXT_EM_FAILURE_FLAG_MULTIPLE = 1;
pub const FWPM_NET_EVENT_IKEEXT_EM_FAILURE_FLAG_BENIGN = 2;
pub const FWPM_CONNECTION_ENUM_FLAG_QUERY_BYTES_TRANSFERRED = 1;
pub const FWPS_FILTER_FLAG_CLEAR_ACTION_RIGHT = 1;
pub const FWPS_FILTER_FLAG_PERMIT_IF_CALLOUT_UNREGISTERED = 2;
pub const FWPS_FILTER_FLAG_OR_CONDITIONS = 4;
pub const FWPS_FILTER_FLAG_HAS_SECURITY_REALM_PROVIDER_CONTEXT = 8;
pub const FWPS_FILTER_FLAG_SILENT_MODE = 16;
pub const FWPS_FILTER_FLAG_IPSEC_NO_ACQUIRE_INITIATE = 32;
pub const FWPS_FILTER_FLAG_RESERVED0 = 64;
pub const FWPS_FILTER_FLAG_RESERVED1 = 128;
pub const FWPS_FILTER_FLAG_RESERVED2 = 256;
pub const FWPS_INCOMING_FLAG_CACHE_SAFE = 1;
pub const FWPS_INCOMING_FLAG_ENFORCE_QUERY = 2;
pub const FWPS_INCOMING_FLAG_ABSORB = 4;
pub const FWPS_INCOMING_FLAG_CONNECTION_FAILING_INDICATION = 8;
pub const FWPS_INCOMING_FLAG_MID_STREAM_INSPECTION = 16;
pub const FWPS_INCOMING_FLAG_RECLASSIFY = 32;
pub const FWPS_INCOMING_FLAG_IS_LOOSE_SOURCE_FLOW = 64;
pub const FWPS_INCOMING_FLAG_IS_LOCAL_ONLY_FLOW = 128;
pub const FWPS_L2_INCOMING_FLAG_IS_RAW_IPV4_FRAMING = 1;
pub const FWPS_L2_INCOMING_FLAG_IS_RAW_IPV6_FRAMING = 2;
pub const FWPS_L2_INCOMING_FLAG_RECLASSIFY_MULTI_DESTINATION = 8;
pub const FWPS_INCOMING_FLAG_RESERVED0 = 256;
pub const FWPS_RIGHT_ACTION_WRITE = 1;
pub const FWPS_CLASSIFY_OUT_FLAG_ABSORB = 1;
pub const FWPS_CLASSIFY_OUT_FLAG_BUFFER_LIMIT_REACHED = 2;
pub const FWPS_CLASSIFY_OUT_FLAG_NO_MORE_DATA = 4;
pub const FWPS_CLASSIFY_OUT_FLAG_ALE_FAST_CACHE_CHECK = 8;
pub const FWPS_CLASSIFY_OUT_FLAG_ALE_FAST_CACHE_POSSIBLE = 16;
pub const FWPS_ALE_ENDPOINT_FLAG_IPSEC_SECURED = 1;
pub const FWP_BYTEMAP_ARRAY64_SIZE = 8;
pub const FWP_BYTE_ARRAY6_SIZE = 6;
pub const FWP_V6_ADDR_SIZE = 16;
pub const FWP_ACTRL_MATCH_FILTER = 1;
pub const FWP_OPTION_VALUE_ALLOW_MULTICAST_STATE = 0;
pub const FWP_OPTION_VALUE_DENY_MULTICAST_STATE = 1;
pub const FWP_OPTION_VALUE_ALLOW_GLOBAL_MULTICAST_STATE = 2;
pub const FWP_OPTION_VALUE_DISABLE_LOOSE_SOURCE = 0;
pub const FWP_OPTION_VALUE_ENABLE_LOOSE_SOURCE = 1;
pub const FWP_OPTION_VALUE_DISABLE_LOCAL_ONLY_MAPPING = 0;
pub const FWP_OPTION_VALUE_ENABLE_LOCAL_ONLY_MAPPING = 1;
pub const FWP_ACTION_FLAG_TERMINATING = 4096;
pub const FWP_ACTION_FLAG_NON_TERMINATING = 8192;
pub const FWP_ACTION_FLAG_CALLOUT = 16384;
pub const FWP_CONDITION_FLAG_IS_LOOPBACK = 1;
pub const FWP_CONDITION_FLAG_IS_IPSEC_SECURED = 2;
pub const FWP_CONDITION_FLAG_IS_REAUTHORIZE = 4;
pub const FWP_CONDITION_FLAG_IS_WILDCARD_BIND = 8;
pub const FWP_CONDITION_FLAG_IS_RAW_ENDPOINT = 16;
pub const FWP_CONDITION_FLAG_IS_FRAGMENT = 32;
pub const FWP_CONDITION_FLAG_IS_FRAGMENT_GROUP = 64;
pub const FWP_CONDITION_FLAG_IS_IPSEC_NATT_RECLASSIFY = 128;
pub const FWP_CONDITION_FLAG_REQUIRES_ALE_CLASSIFY = 256;
pub const FWP_CONDITION_FLAG_IS_IMPLICIT_BIND = 512;
pub const FWP_CONDITION_FLAG_IS_REASSEMBLED = 1024;
pub const FWP_CONDITION_FLAG_IS_NAME_APP_SPECIFIED = 16384;
pub const FWP_CONDITION_FLAG_IS_PROMISCUOUS = 32768;
pub const FWP_CONDITION_FLAG_IS_AUTH_FW = 65536;
pub const FWP_CONDITION_FLAG_IS_RECLASSIFY = 131072;
pub const FWP_CONDITION_FLAG_IS_OUTBOUND_PASS_THRU = 262144;
pub const FWP_CONDITION_FLAG_IS_INBOUND_PASS_THRU = 524288;
pub const FWP_CONDITION_FLAG_IS_CONNECTION_REDIRECTED = 1048576;
pub const FWP_CONDITION_FLAG_IS_PROXY_CONNECTION = 2097152;
pub const FWP_CONDITION_FLAG_IS_APPCONTAINER_LOOPBACK = 4194304;
pub const FWP_CONDITION_FLAG_IS_NON_APPCONTAINER_LOOPBACK = 8388608;
pub const FWP_CONDITION_FLAG_IS_RESERVED = 16777216;
pub const FWP_CONDITION_FLAG_IS_HONORING_POLICY_AUTHORIZE = 33554432;
pub const FWP_CONDITION_REAUTHORIZE_REASON_POLICY_CHANGE = 1;
pub const FWP_CONDITION_REAUTHORIZE_REASON_NEW_ARRIVAL_INTERFACE = 2;
pub const FWP_CONDITION_REAUTHORIZE_REASON_NEW_NEXTHOP_INTERFACE = 4;
pub const FWP_CONDITION_REAUTHORIZE_REASON_PROFILE_CROSSING = 8;
pub const FWP_CONDITION_REAUTHORIZE_REASON_CLASSIFY_COMPLETION = 16;
pub const FWP_CONDITION_REAUTHORIZE_REASON_IPSEC_PROPERTIES_CHANGED = 32;
pub const FWP_CONDITION_REAUTHORIZE_REASON_MID_STREAM_INSPECTION = 64;
pub const FWP_CONDITION_REAUTHORIZE_REASON_SOCKET_PROPERTY_CHANGED = 128;
pub const FWP_CONDITION_REAUTHORIZE_REASON_NEW_INBOUND_MCAST_BCAST_PACKET = 256;
pub const FWP_CONDITION_REAUTHORIZE_REASON_EDP_POLICY_CHANGED = 512;
pub const FWP_CONDITION_REAUTHORIZE_REASON_PROXY_HANDLE_CHANGED = 16384;
pub const FWP_CONDITION_REAUTHORIZE_REASON_CHECK_OFFLOAD = 65536;
pub const FWP_CONDITION_SOCKET_PROPERTY_FLAG_IS_SYSTEM_PORT_RPC = 1;
pub const FWP_CONDITION_SOCKET_PROPERTY_FLAG_ALLOW_EDGE_TRAFFIC = 2;
pub const FWP_CONDITION_SOCKET_PROPERTY_FLAG_DENY_EDGE_TRAFFIC = 4;
pub const FWP_CONDITION_L2_IS_NATIVE_ETHERNET = 1;
pub const FWP_CONDITION_L2_IS_WIFI = 2;
pub const FWP_CONDITION_L2_IS_MOBILE_BROADBAND = 4;
pub const FWP_CONDITION_L2_IS_WIFI_DIRECT_DATA = 8;
pub const FWP_CONDITION_L2_IS_VM2VM = 16;
pub const FWP_CONDITION_L2_IS_MALFORMED_PACKET = 32;
pub const FWP_CONDITION_L2_IS_IP_FRAGMENT_GROUP = 64;
pub const FWP_CONDITION_L2_IF_CONNECTOR_PRESENT = 128;
pub const FWP_FILTER_ENUM_FLAG_BEST_TERMINATING_MATCH = 1;
pub const FWP_FILTER_ENUM_FLAG_SORTED = 2;
pub const FWP_FILTER_ENUM_FLAG_BOOTTIME_ONLY = 4;
pub const FWP_FILTER_ENUM_FLAG_INCLUDE_BOOTTIME = 8;
pub const FWP_FILTER_ENUM_FLAG_INCLUDE_DISABLED = 16;
pub const FWP_FILTER_ENUM_FLAG_RESERVED1 = 32;
pub const FWP_CALLOUT_FLAG_CONDITIONAL_ON_FLOW = 1;
pub const FWP_CALLOUT_FLAG_ALLOW_OFFLOAD = 2;
pub const FWP_CALLOUT_FLAG_ENABLE_COMMIT_ADD_NOTIFY = 4;
pub const FWP_CALLOUT_FLAG_ALLOW_MID_STREAM_INSPECTION = 8;
pub const FWP_CALLOUT_FLAG_ALLOW_RECLASSIFY = 16;
pub const FWP_CALLOUT_FLAG_RESERVED1 = 32;
pub const FWP_CALLOUT_FLAG_ALLOW_RSC = 64;
pub const FWP_CALLOUT_FLAG_ALLOW_L2_BATCH_CLASSIFY = 128;
pub const FWP_CALLOUT_FLAG_ALLOW_USO = 256;
pub const FWP_CALLOUT_FLAG_ALLOW_URO = 512;
pub const FWP_CALLOUT_FLAG_RESERVED2 = 1024;
pub const IKEEXT_CERT_AUTH_FLAG_DISABLE_CRL_CHECK = 2;
pub const IKEEXT_CERT_AUTH_FLAG_DISABLE_REQUEST_PAYLOAD = 64;
pub const IKEEXT_KERB_AUTH_FORCE_PROXY_ON_INITIATOR = 4;
pub const IKEEXT_NTLM_V2_AUTH_DONT_ACCEPT_EXPLICIT_CREDENTIALS = 1;
pub const IKEEXT_POLICY_FLAG_MOBIKE_NOT_SUPPORTED = 16;
pub const IKEEXT_POLICY_FLAG_SITE_TO_SITE = 32;
pub const IKEEXT_POLICY_FLAG_IMS_VPN = 64;
pub const IKEEXT_POLICY_ENABLE_IKEV2_FRAGMENTATION = 128;
pub const IKEEXT_POLICY_SUPPORT_LOW_POWER_MODE = 256;
pub const IKEEXT_POLICY_FLAG_POINT_TO_SITE = 512;
pub const IKEEXT_CERT_CREDENTIAL_FLAG_NAP_CERT = 1;
pub const IPSEC_AUTH_CONFIG_HMAC_MD5_96 = 0;
pub const IPSEC_AUTH_CONFIG_HMAC_SHA_1_96 = 1;
pub const IPSEC_AUTH_CONFIG_HMAC_SHA_256_128 = 2;
pub const IPSEC_AUTH_CONFIG_GCM_AES_128 = 3;
pub const IPSEC_AUTH_CONFIG_GCM_AES_192 = 4;
pub const IPSEC_AUTH_CONFIG_GCM_AES_256 = 5;
pub const IPSEC_AUTH_CONFIG_MAX = 6;
pub const IPSEC_CIPHER_CONFIG_CBC_DES = 1;
pub const IPSEC_CIPHER_CONFIG_CBC_3DES = 2;
pub const IPSEC_CIPHER_CONFIG_CBC_AES_128 = 3;
pub const IPSEC_CIPHER_CONFIG_CBC_AES_192 = 4;
pub const IPSEC_CIPHER_CONFIG_CBC_AES_256 = 5;
pub const IPSEC_CIPHER_CONFIG_GCM_AES_128 = 6;
pub const IPSEC_CIPHER_CONFIG_GCM_AES_192 = 7;
pub const IPSEC_CIPHER_CONFIG_GCM_AES_256 = 8;
pub const IPSEC_CIPHER_CONFIG_MAX = 9;
pub const IPSEC_POLICY_FLAG_KEY_MANAGER_ALLOW_NOTIFY_KEY = 16384;
pub const IPSEC_POLICY_FLAG_RESERVED1 = 32768;
pub const IPSEC_POLICY_FLAG_SITE_TO_SITE_TUNNEL = 65536;
pub const IPSEC_POLICY_FLAG_POINT_TO_SITE_TUNNEL = 131072;
pub const IPSEC_POLICY_FLAG_BANDWIDTH1 = 268435456;
pub const IPSEC_POLICY_FLAG_BANDWIDTH2 = 536870912;
pub const IPSEC_POLICY_FLAG_BANDWIDTH3 = 1073741824;
pub const IPSEC_POLICY_FLAG_BANDWIDTH4 = 2147483648;
pub const IPSEC_KEYING_POLICY_FLAG_TERMINATING_MATCH = 1;
pub const IPSEC_SA_BUNDLE_FLAG_NLB = 16;
pub const IPSEC_SA_BUNDLE_FLAG_NO_MACHINE_LUID_VERIFY = 32;
pub const IPSEC_SA_BUNDLE_FLAG_NO_IMPERSONATION_LUID_VERIFY = 64;
pub const IPSEC_SA_BUNDLE_FLAG_NO_EXPLICIT_CRED_MATCH = 128;
pub const IPSEC_SA_BUNDLE_FLAG_FORCE_INBOUND_CONNECTIONS = 32768;
pub const IPSEC_SA_BUNDLE_FLAG_FORCE_OUTBOUND_CONNECTIONS = 65536;
pub const IPSEC_SA_BUNDLE_FLAG_FORWARD_PATH_INITIATOR = 131072;
pub const IPSEC_SA_BUNDLE_FLAG_ENABLE_OPTIONAL_ASYMMETRIC_IDLE = 262144;
pub const IPSEC_SA_BUNDLE_FLAG_USING_DICTATED_KEYS = 524288;
pub const IPSEC_SA_BUNDLE_FLAG_LOCALLY_DICTATED_KEYS = 1048576;
pub const IPSEC_SA_BUNDLE_FLAG_SA_OFFLOADED = 2097152;
pub const IPSEC_SA_BUNDLE_FLAG_IP_IN_IP_PKT = 4194304;
pub const IPSEC_SA_BUNDLE_FLAG_LOW_POWER_MODE_SUPPORT = 8388608;
pub const IPSEC_SA_BUNDLE_FLAG_TUNNEL_BANDWIDTH1 = 268435456;
pub const IPSEC_SA_BUNDLE_FLAG_TUNNEL_BANDWIDTH2 = 536870912;
pub const IPSEC_SA_BUNDLE_FLAG_TUNNEL_BANDWIDTH3 = 1073741824;
pub const IPSEC_SA_BUNDLE_FLAG_TUNNEL_BANDWIDTH4 = 2147483648;
pub const IPSEC_DOSP_DSCP_DISABLE_VALUE = 255;
pub const IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE = 0;
pub const IPSEC_KEY_MANAGER_FLAG_DICTATE_KEY = 1;
pub const FWPM_AUTO_WEIGHT_BITS = 60;
pub const FWPM_WEIGHT_RANGE_IPSEC = 0;
pub const FWPM_WEIGHT_RANGE_IKE_EXEMPTIONS = 12;
pub const FWPM_ACTRL_ADD = 1;
pub const FWPM_ACTRL_ADD_LINK = 2;
pub const FWPM_ACTRL_BEGIN_READ_TXN = 4;
pub const FWPM_ACTRL_BEGIN_WRITE_TXN = 8;
pub const FWPM_ACTRL_CLASSIFY = 16;
pub const FWPM_ACTRL_ENUM = 32;
pub const FWPM_ACTRL_OPEN = 64;
pub const FWPM_ACTRL_READ = 128;
pub const FWPM_ACTRL_READ_STATS = 256;
pub const FWPM_ACTRL_SUBSCRIBE = 512;
pub const FWPM_ACTRL_WRITE = 1024;
pub const FWPM_TXN_READ_ONLY = 1;
pub const FWPM_TUNNEL_FLAG_POINT_TO_POINT = 1;
pub const FWPM_TUNNEL_FLAG_ENABLE_VIRTUAL_IF_TUNNELING = 2;
pub const FWPM_TUNNEL_FLAG_RESERVED0 = 4;
pub const FWPS_METADATA_FIELD_DISCARD_REASON = 1;
pub const FWPS_METADATA_FIELD_FLOW_HANDLE = 2;
pub const FWPS_METADATA_FIELD_IP_HEADER_SIZE = 4;
pub const FWPS_METADATA_FIELD_PROCESS_PATH = 8;
pub const FWPS_METADATA_FIELD_TOKEN = 16;
pub const FWPS_METADATA_FIELD_PROCESS_ID = 32;
pub const FWPS_METADATA_FIELD_SYSTEM_FLAGS = 64;
pub const FWPS_METADATA_FIELD_RESERVED = 128;
pub const FWPS_METADATA_FIELD_SOURCE_INTERFACE_INDEX = 256;
pub const FWPS_METADATA_FIELD_DESTINATION_INTERFACE_INDEX = 512;
pub const FWPS_METADATA_FIELD_TRANSPORT_HEADER_SIZE = 1024;
pub const FWPS_METADATA_FIELD_COMPARTMENT_ID = 2048;
pub const FWPS_METADATA_FIELD_FRAGMENT_DATA = 4096;
pub const FWPS_METADATA_FIELD_PATH_MTU = 8192;
pub const FWPS_METADATA_FIELD_COMPLETION_HANDLE = 16384;
pub const FWPS_METADATA_FIELD_TRANSPORT_ENDPOINT_HANDLE = 32768;
pub const FWPS_METADATA_FIELD_TRANSPORT_CONTROL_DATA = 65536;
pub const FWPS_METADATA_FIELD_REMOTE_SCOPE_ID = 131072;
pub const FWPS_METADATA_FIELD_PACKET_DIRECTION = 262144;
pub const FWPS_METADATA_FIELD_PACKET_SYSTEM_CRITICAL = 524288;
pub const FWPS_METADATA_FIELD_FORWARD_LAYER_OUTBOUND_PASS_THRU = 1048576;
pub const FWPS_METADATA_FIELD_FORWARD_LAYER_INBOUND_PASS_THRU = 2097152;
pub const FWPS_METADATA_FIELD_ALE_CLASSIFY_REQUIRED = 4194304;
pub const FWPS_METADATA_FIELD_TRANSPORT_HEADER_INCLUDE_HEADER = 8388608;
pub const FWPS_METADATA_FIELD_DESTINATION_PREFIX = 16777216;
pub const FWPS_METADATA_FIELD_ETHER_FRAME_LENGTH = 33554432;
pub const FWPS_METADATA_FIELD_PARENT_ENDPOINT_HANDLE = 67108864;
pub const FWPS_METADATA_FIELD_ICMP_ID_AND_SEQUENCE = 134217728;
pub const FWPS_METADATA_FIELD_LOCAL_REDIRECT_TARGET_PID = 268435456;
pub const FWPS_METADATA_FIELD_ORIGINAL_DESTINATION = 536870912;
pub const FWPS_METADATA_FIELD_REDIRECT_RECORD_HANDLE = 1073741824;
pub const FWPS_METADATA_FIELD_SUB_PROCESS_TAG = 2147483648;
pub const FWPS_L2_METADATA_FIELD_ETHERNET_MAC_HEADER_SIZE = 1;
pub const FWPS_L2_METADATA_FIELD_WIFI_OPERATION_MODE = 2;
pub const FWPS_L2_METADATA_FIELD_VSWITCH_SOURCE_PORT_ID = 4;
pub const FWPS_L2_METADATA_FIELD_VSWITCH_SOURCE_NIC_INDEX = 8;
pub const FWPS_L2_METADATA_FIELD_VSWITCH_PACKET_CONTEXT = 16;
pub const FWPS_L2_METADATA_FIELD_VSWITCH_DESTINATION_PORT_ID = 32;
pub const FWPS_L2_METADATA_FIELD_RESERVED = 2147483648;
pub const FWP_DIRECTION_OUTBOUND = 0;
pub const FWP_DIRECTION_INBOUND = 1;
pub const FWP_DIRECTION_MAX = 2;
pub const FWP_IP_VERSION_V4 = 0;
pub const FWP_IP_VERSION_V6 = 1;
pub const FWP_IP_VERSION_NONE = 2;
pub const FWP_IP_VERSION_MAX = 3;
pub const FWP_AF_INET = 0;
pub const FWP_AF_INET6 = 1;
pub const FWP_AF_ETHER = 2;
pub const FWP_AF_NONE = 3;
pub const FWP_ETHER_ENCAP_METHOD_ETHER_V2 = 0;
pub const FWP_ETHER_ENCAP_METHOD_SNAP = 1;
pub const FWP_ETHER_ENCAP_METHOD_SNAP_W_OUI_ZERO = 3;
pub const FWP_EMPTY = 0;
pub const FWP_UINT8 = 1;
pub const FWP_UINT16 = 2;
pub const FWP_UINT32 = 3;
pub const FWP_UINT64 = 4;
pub const FWP_INT8 = 5;
pub const FWP_INT16 = 6;
pub const FWP_INT32 = 7;
pub const FWP_INT64 = 8;
pub const FWP_FLOAT = 9;
pub const FWP_DOUBLE = 10;
pub const FWP_BYTE_ARRAY16_TYPE = 11;
pub const FWP_BYTE_BLOB_TYPE = 12;
pub const FWP_SID = 13;
pub const FWP_SECURITY_DESCRIPTOR_TYPE = 14;
pub const FWP_TOKEN_INFORMATION_TYPE = 15;
pub const FWP_TOKEN_ACCESS_INFORMATION_TYPE = 16;
pub const FWP_UNICODE_STRING_TYPE = 17;
pub const FWP_BYTE_ARRAY6_TYPE = 18;
pub const FWP_SINGLE_DATA_TYPE_MAX = 255;
pub const FWP_V4_ADDR_MASK = 256;
pub const FWP_V6_ADDR_MASK = 257;
pub const FWP_RANGE_TYPE = 258;
pub const FWP_DATA_TYPE_MAX = 259;
pub const FWP_MATCH_EQUAL = 0;
pub const FWP_MATCH_GREATER = 1;
pub const FWP_MATCH_LESS = 2;
pub const FWP_MATCH_GREATER_OR_EQUAL = 3;
pub const FWP_MATCH_LESS_OR_EQUAL = 4;
pub const FWP_MATCH_RANGE = 5;
pub const FWP_MATCH_FLAGS_ALL_SET = 6;
pub const FWP_MATCH_FLAGS_ANY_SET = 7;
pub const FWP_MATCH_FLAGS_NONE_SET = 8;
pub const FWP_MATCH_EQUAL_CASE_INSENSITIVE = 9;
pub const FWP_MATCH_NOT_EQUAL = 10;
pub const FWP_MATCH_PREFIX = 11;
pub const FWP_MATCH_NOT_PREFIX = 12;
pub const FWP_MATCH_TYPE_MAX = 13;
pub const FWP_NETWORK_CONNECTION_POLICY_SOURCE_ADDRESS = 0;
pub const FWP_NETWORK_CONNECTION_POLICY_NEXT_HOP_INTERFACE = 1;
pub const FWP_NETWORK_CONNECTION_POLICY_NEXT_HOP = 2;
pub const FWP_NETWORK_CONNECTION_POLICY_MAX = 3;
pub const FWP_CLASSIFY_OPTION_MULTICAST_STATE = 0;
pub const FWP_CLASSIFY_OPTION_LOOSE_SOURCE_MAPPING = 1;
pub const FWP_CLASSIFY_OPTION_UNICAST_LIFETIME = 2;
pub const FWP_CLASSIFY_OPTION_MCAST_BCAST_LIFETIME = 3;
pub const FWP_CLASSIFY_OPTION_SECURE_SOCKET_SECURITY_FLAGS = 4;
pub const FWP_CLASSIFY_OPTION_SECURE_SOCKET_AUTHIP_MM_POLICY_KEY = 5;
pub const FWP_CLASSIFY_OPTION_SECURE_SOCKET_AUTHIP_QM_POLICY_KEY = 6;
pub const FWP_CLASSIFY_OPTION_LOCAL_ONLY_MAPPING = 7;
pub const FWP_CLASSIFY_OPTION_MAX = 8;
pub const FWP_VSWITCH_NETWORK_TYPE_UNKNOWN = 0;
pub const FWP_VSWITCH_NETWORK_TYPE_PRIVATE = 1;
pub const FWP_VSWITCH_NETWORK_TYPE_INTERNAL = 2;
pub const FWP_VSWITCH_NETWORK_TYPE_EXTERNAL = 3;
pub const FWP_FILTER_ENUM_FULLY_CONTAINED = 0;
pub const FWP_FILTER_ENUM_OVERLAPPING = 1;
pub const FWP_FILTER_ENUM_TYPE_MAX = 2;
pub const IKEEXT_KEY_MODULE_IKE = 0;
pub const IKEEXT_KEY_MODULE_AUTHIP = 1;
pub const IKEEXT_KEY_MODULE_IKEV2 = 2;
pub const IKEEXT_KEY_MODULE_MAX = 3;
pub const IKEEXT_PRESHARED_KEY = 0;
pub const IKEEXT_CERTIFICATE = 1;
pub const IKEEXT_KERBEROS = 2;
pub const IKEEXT_ANONYMOUS = 3;
pub const IKEEXT_SSL = 4;
pub const IKEEXT_NTLM_V2 = 5;
pub const IKEEXT_IPV6_CGA = 6;
pub const IKEEXT_CERTIFICATE_ECDSA_P256 = 7;
pub const IKEEXT_CERTIFICATE_ECDSA_P384 = 8;
pub const IKEEXT_SSL_ECDSA_P256 = 9;
pub const IKEEXT_SSL_ECDSA_P384 = 10;
pub const IKEEXT_EAP = 11;
pub const IKEEXT_RESERVED = 12;
pub const IKEEXT_AUTHENTICATION_METHOD_TYPE_MAX = 13;
pub const IKEEXT_IMPERSONATION_NONE = 0;
pub const IKEEXT_IMPERSONATION_SOCKET_PRINCIPAL = 1;
pub const IKEEXT_IMPERSONATION_MAX = 2;
pub const IKEEXT_CERT_CONFIG_EXPLICIT_TRUST_LIST = 0;
pub const IKEEXT_CERT_CONFIG_ENTERPRISE_STORE = 1;
pub const IKEEXT_CERT_CONFIG_TRUSTED_ROOT_STORE = 2;
pub const IKEEXT_CERT_CONFIG_UNSPECIFIED = 3;
pub const IKEEXT_CERT_CONFIG_TYPE_MAX = 4;
pub const IKEEXT_CERT_CRITERIA_DNS = 0;
pub const IKEEXT_CERT_CRITERIA_UPN = 1;
pub const IKEEXT_CERT_CRITERIA_RFC822 = 2;
pub const IKEEXT_CERT_CRITERIA_CN = 3;
pub const IKEEXT_CERT_CRITERIA_OU = 4;
pub const IKEEXT_CERT_CRITERIA_O = 5;
pub const IKEEXT_CERT_CRITERIA_DC = 6;
pub const IKEEXT_CERT_CRITERIA_NAME_TYPE_MAX = 7;
pub const IKEEXT_CIPHER_DES = 0;
pub const IKEEXT_CIPHER_3DES = 1;
pub const IKEEXT_CIPHER_AES_128 = 2;
pub const IKEEXT_CIPHER_AES_192 = 3;
pub const IKEEXT_CIPHER_AES_256 = 4;
pub const IKEEXT_CIPHER_AES_GCM_128_16ICV = 5;
pub const IKEEXT_CIPHER_AES_GCM_256_16ICV = 6;
pub const IKEEXT_CIPHER_TYPE_MAX = 7;
pub const IKEEXT_INTEGRITY_MD5 = 0;
pub const IKEEXT_INTEGRITY_SHA1 = 1;
pub const IKEEXT_INTEGRITY_SHA_256 = 2;
pub const IKEEXT_INTEGRITY_SHA_384 = 3;
pub const IKEEXT_INTEGRITY_TYPE_MAX = 4;
pub const IKEEXT_DH_GROUP_NONE = 0;
pub const IKEEXT_DH_GROUP_1 = 1;
pub const IKEEXT_DH_GROUP_2 = 2;
pub const IKEEXT_DH_GROUP_14 = 3;
pub const IKEEXT_DH_GROUP_2048 = 3;
pub const IKEEXT_DH_ECP_256 = 4;
pub const IKEEXT_DH_ECP_384 = 5;
pub const IKEEXT_DH_GROUP_24 = 6;
pub const IKEEXT_DH_GROUP_MAX = 7;
pub const IKEEXT_MM_SA_STATE_NONE = 0;
pub const IKEEXT_MM_SA_STATE_SA_SENT = 1;
pub const IKEEXT_MM_SA_STATE_SSPI_SENT = 2;
pub const IKEEXT_MM_SA_STATE_FINAL = 3;
pub const IKEEXT_MM_SA_STATE_FINAL_SENT = 4;
pub const IKEEXT_MM_SA_STATE_COMPLETE = 5;
pub const IKEEXT_MM_SA_STATE_MAX = 6;
pub const IKEEXT_QM_SA_STATE_NONE = 0;
pub const IKEEXT_QM_SA_STATE_INITIAL = 1;
pub const IKEEXT_QM_SA_STATE_FINAL = 2;
pub const IKEEXT_QM_SA_STATE_COMPLETE = 3;
pub const IKEEXT_QM_SA_STATE_MAX = 4;
pub const IKEEXT_EM_SA_STATE_NONE = 0;
pub const IKEEXT_EM_SA_STATE_SENT_ATTS = 1;
pub const IKEEXT_EM_SA_STATE_SSPI_SENT = 2;
pub const IKEEXT_EM_SA_STATE_AUTH_COMPLETE = 3;
pub const IKEEXT_EM_SA_STATE_FINAL = 4;
pub const IKEEXT_EM_SA_STATE_COMPLETE = 5;
pub const IKEEXT_EM_SA_STATE_MAX = 6;
pub const IKEEXT_SA_ROLE_INITIATOR = 0;
pub const IKEEXT_SA_ROLE_RESPONDER = 1;
pub const IKEEXT_SA_ROLE_MAX = 2;
pub const IPSEC_TRANSFORM_AH = 1;
pub const IPSEC_TRANSFORM_ESP_AUTH = 2;
pub const IPSEC_TRANSFORM_ESP_CIPHER = 3;
pub const IPSEC_TRANSFORM_ESP_AUTH_AND_CIPHER = 4;
pub const IPSEC_TRANSFORM_ESP_AUTH_FW = 5;
pub const IPSEC_TRANSFORM_TYPE_MAX = 6;
pub const IPSEC_AUTH_MD5 = 0;
pub const IPSEC_AUTH_SHA_1 = 1;
pub const IPSEC_AUTH_SHA_256 = 2;
pub const IPSEC_AUTH_AES_128 = 3;
pub const IPSEC_AUTH_AES_192 = 4;
pub const IPSEC_AUTH_AES_256 = 5;
pub const IPSEC_AUTH_MAX = 6;
pub const IPSEC_CIPHER_TYPE_DES = 1;
pub const IPSEC_CIPHER_TYPE_3DES = 2;
pub const IPSEC_CIPHER_TYPE_AES_128 = 3;
pub const IPSEC_CIPHER_TYPE_AES_192 = 4;
pub const IPSEC_CIPHER_TYPE_AES_256 = 5;
pub const IPSEC_CIPHER_TYPE_MAX = 6;
pub const IPSEC_PFS_NONE = 0;
pub const IPSEC_PFS_1 = 1;
pub const IPSEC_PFS_2 = 2;
pub const IPSEC_PFS_2048 = 3;
pub const IPSEC_PFS_14 = 3;
pub const IPSEC_PFS_ECP_256 = 4;
pub const IPSEC_PFS_ECP_384 = 5;
pub const IPSEC_PFS_MM = 6;
pub const IPSEC_PFS_24 = 7;
pub const IPSEC_PFS_MAX = 8;
pub const IPSEC_TOKEN_TYPE_MACHINE = 0;
pub const IPSEC_TOKEN_TYPE_IMPERSONATION = 1;
pub const IPSEC_TOKEN_TYPE_MAX = 2;
pub const IPSEC_TOKEN_PRINCIPAL_LOCAL = 0;
pub const IPSEC_TOKEN_PRINCIPAL_PEER = 1;
pub const IPSEC_TOKEN_PRINCIPAL_MAX = 2;
pub const IPSEC_TOKEN_MODE_MAIN = 0;
pub const IPSEC_TOKEN_MODE_EXTENDED = 1;
pub const IPSEC_TOKEN_MODE_MAX = 2;
pub const IPSEC_TRAFFIC_TYPE_TRANSPORT = 0;
pub const IPSEC_TRAFFIC_TYPE_TUNNEL = 1;
pub const IPSEC_TRAFFIC_TYPE_MAX = 2;
pub const IPSEC_SA_CONTEXT_EVENT_ADD = 1;
pub const IPSEC_SA_CONTEXT_EVENT_DELETE = 2;
pub const IPSEC_SA_CONTEXT_EVENT_MAX = 3;
pub const IPSEC_FAILURE_NONE = 0;
pub const IPSEC_FAILURE_ME = 1;
pub const IPSEC_FAILURE_PEER = 2;
pub const IPSEC_FAILURE_POINT_MAX = 3;
pub const DlUnicast = 0;
pub const DlMulticast = 1;
pub const DlBroadcast = 2;
pub const FWPM_CHANGE_ADD = 1;
pub const FWPM_CHANGE_DELETE = 2;
pub const FWPM_CHANGE_TYPE_MAX = 3;
pub const FWPM_SERVICE_STOPPED = 0;
pub const FWPM_SERVICE_START_PENDING = 1;
pub const FWPM_SERVICE_STOP_PENDING = 2;
pub const FWPM_SERVICE_RUNNING = 3;
pub const FWPM_SERVICE_STATE_MAX = 4;
pub const FWPM_ENGINE_COLLECT_NET_EVENTS = 0;
pub const FWPM_ENGINE_NET_EVENT_MATCH_ANY_KEYWORDS = 1;
pub const FWPM_ENGINE_NAME_CACHE = 2;
pub const FWPM_ENGINE_MONITOR_IPSEC_CONNECTIONS = 3;
pub const FWPM_ENGINE_PACKET_QUEUING = 4;
pub const FWPM_ENGINE_TXN_WATCHDOG_TIMEOUT_IN_MSEC = 5;
pub const FWPM_ENGINE_OPTION_MAX = 6;
pub const FWPM_IPSEC_KEYING_CONTEXT = 0;
pub const FWPM_IPSEC_IKE_QM_TRANSPORT_CONTEXT = 1;
pub const FWPM_IPSEC_IKE_QM_TUNNEL_CONTEXT = 2;
pub const FWPM_IPSEC_AUTHIP_QM_TRANSPORT_CONTEXT = 3;
pub const FWPM_IPSEC_AUTHIP_QM_TUNNEL_CONTEXT = 4;
pub const FWPM_IPSEC_IKE_MM_CONTEXT = 5;
pub const FWPM_IPSEC_AUTHIP_MM_CONTEXT = 6;
pub const FWPM_CLASSIFY_OPTIONS_CONTEXT = 7;
pub const FWPM_GENERAL_CONTEXT = 8;
pub const FWPM_IPSEC_IKEV2_QM_TUNNEL_CONTEXT = 9;
pub const FWPM_IPSEC_IKEV2_MM_CONTEXT = 10;
pub const FWPM_IPSEC_DOSP_CONTEXT = 11;
pub const FWPM_IPSEC_IKEV2_QM_TRANSPORT_CONTEXT = 12;
pub const FWPM_NETWORK_CONNECTION_POLICY_CONTEXT = 13;
pub const FWPM_PROVIDER_CONTEXT_TYPE_MAX = 14;
pub const FWPM_FIELD_RAW_DATA = 0;
pub const FWPM_FIELD_IP_ADDRESS = 1;
pub const FWPM_FIELD_FLAGS = 2;
pub const FWPM_FIELD_TYPE_MAX = 3;
pub const FWPM_NET_EVENT_TYPE_IKEEXT_MM_FAILURE = 0;
pub const FWPM_NET_EVENT_TYPE_IKEEXT_QM_FAILURE = 1;
pub const FWPM_NET_EVENT_TYPE_IKEEXT_EM_FAILURE = 2;
pub const FWPM_NET_EVENT_TYPE_CLASSIFY_DROP = 3;
pub const FWPM_NET_EVENT_TYPE_IPSEC_KERNEL_DROP = 4;
pub const FWPM_NET_EVENT_TYPE_IPSEC_DOSP_DROP = 5;
pub const FWPM_NET_EVENT_TYPE_CLASSIFY_ALLOW = 6;
pub const FWPM_NET_EVENT_TYPE_CAPABILITY_DROP = 7;
pub const FWPM_NET_EVENT_TYPE_CAPABILITY_ALLOW = 8;
pub const FWPM_NET_EVENT_TYPE_CLASSIFY_DROP_MAC = 9;
pub const FWPM_NET_EVENT_TYPE_LPM_PACKET_ARRIVAL = 10;
pub const FWPM_NET_EVENT_TYPE_MAX = 11;
pub const FWPM_APPC_NETWORK_CAPABILITY_INTERNET_CLIENT = 0;
pub const FWPM_APPC_NETWORK_CAPABILITY_INTERNET_CLIENT_SERVER = 1;
pub const FWPM_APPC_NETWORK_CAPABILITY_INTERNET_PRIVATE_NETWORK = 2;
pub const FWPM_SYSTEM_PORT_RPC_EPMAP = 0;
pub const FWPM_SYSTEM_PORT_TEREDO = 1;
pub const FWPM_SYSTEM_PORT_IPHTTPS_IN = 2;
pub const FWPM_SYSTEM_PORT_IPHTTPS_OUT = 3;
pub const FWPM_SYSTEM_PORT_TYPE_MAX = 4;
pub const FWPM_CONNECTION_EVENT_ADD = 0;
pub const FWPM_CONNECTION_EVENT_DELETE = 1;
pub const FWPM_CONNECTION_EVENT_MAX = 2;
pub const FWPM_VSWITCH_EVENT_FILTER_ADD_TO_INCOMPLETE_LAYER = 0;
pub const FWPM_VSWITCH_EVENT_FILTER_ENGINE_NOT_IN_REQUIRED_POSITION = 1;
pub const FWPM_VSWITCH_EVENT_ENABLED_FOR_INSPECTION = 2;
pub const FWPM_VSWITCH_EVENT_DISABLED_FOR_INSPECTION = 3;
pub const FWPM_VSWITCH_EVENT_FILTER_ENGINE_REORDER = 4;
pub const FWPM_VSWITCH_EVENT_MAX = 5;

pub const aliases = struct {
    pub const IPSEC_SA_BUNDLE_FLAGS = u32;
    pub const IPSEC_POLICY_FLAG = u32;
    pub const IKEEXT_CERT_AUTH = u32;
    pub const IKEEXT_PRESHARED_KEY_AUTHENTICATION_FLAGS = u32;
    pub const IKEEXT_POLICY_FLAG = u32;
    pub const FWPM_SUBSCRIPTION_FLAGS = u32;
    pub const IKEEXT_CERT_FLAGS = u32;
    pub const IPSEC_DOSP_FLAGS = u32;
    pub const IKEEXT_KERBEROS_AUTHENTICATION_FLAGS = u32;
    pub const IKEEXT_RESERVED_AUTHENTICATION_FLAGS = u32;
    pub const IKEEXT_EAP_AUTHENTICATION_FLAGS = u32;
    pub const FWPM_FILTER_FLAGS = u32;
    pub const FWP_ACTION_TYPE = u32;
    pub const FWP_DIRECTION = i32;
    pub const FWP_IP_VERSION = i32;
    pub const FWP_AF = i32;
    pub const FWP_ETHER_ENCAP_METHOD = i32;
    pub const FWP_DATA_TYPE = i32;
    pub const FWP_MATCH_TYPE = i32;
    pub const FWP_NETWORK_CONNECTION_POLICY_SETTING_TYPE = i32;
    pub const FWP_CLASSIFY_OPTION_TYPE = i32;
    pub const FWP_VSWITCH_NETWORK_TYPE = i32;
    pub const FWP_FILTER_ENUM_TYPE = i32;
    pub const IKEEXT_KEY_MODULE_TYPE = i32;
    pub const IKEEXT_AUTHENTICATION_METHOD_TYPE = i32;
    pub const IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE = i32;
    pub const IKEEXT_CERT_CONFIG_TYPE = i32;
    pub const IKEEXT_CERT_CRITERIA_NAME_TYPE = i32;
    pub const IKEEXT_CIPHER_TYPE = i32;
    pub const IKEEXT_INTEGRITY_TYPE = i32;
    pub const IKEEXT_DH_GROUP = i32;
    pub const IKEEXT_MM_SA_STATE = i32;
    pub const IKEEXT_QM_SA_STATE = i32;
    pub const IKEEXT_EM_SA_STATE = i32;
    pub const IKEEXT_SA_ROLE = i32;
    pub const IPSEC_TRANSFORM_TYPE = i32;
    pub const IPSEC_AUTH_TYPE = i32;
    pub const IPSEC_CIPHER_TYPE = i32;
    pub const IPSEC_PFS_GROUP = i32;
    pub const IPSEC_TOKEN_TYPE = i32;
    pub const IPSEC_TOKEN_PRINCIPAL = i32;
    pub const IPSEC_TOKEN_MODE = i32;
    pub const IPSEC_TRAFFIC_TYPE = i32;
    pub const IPSEC_SA_CONTEXT_EVENT_TYPE0 = i32;
    pub const IPSEC_FAILURE_POINT = i32;
    pub const DL_ADDRESS_TYPE = i32;
    pub const FWPM_CHANGE_TYPE = i32;
    pub const FWPM_SERVICE_STATE = i32;
    pub const FWPM_ENGINE_OPTION = i32;
    pub const FWPM_PROVIDER_CONTEXT_TYPE = i32;
    pub const FWPM_FIELD_TYPE = i32;
    pub const FWPM_NET_EVENT_TYPE = i32;
    pub const FWPM_APPC_NETWORK_CAPABILITY_TYPE = i32;
    pub const FWPM_SYSTEM_PORT_TYPE = i32;
    pub const FWPM_CONNECTION_EVENT_TYPE = i32;
    pub const FWPM_VSWITCH_EVENT_TYPE = i32;
    pub const FWPM_ENGINE_HANDLE = ?*anyopaque;
    pub const FWPM_CALLOUT_ENUM_HANDLE = ?*anyopaque;
    pub const FWPM_CONNECTION_ENUM_HANDLE = ?*anyopaque;
    pub const FWPM_FILTER_ENUM_HANDLE = ?*anyopaque;
    pub const FWPM_LAYER_ENUM_HANDLE = ?*anyopaque;
    pub const FWPM_NET_EVENT_ENUM_HANDLE = ?*anyopaque;
    pub const FWPM_PROVIDER_CONTEXT_ENUM_HANDLE = ?*anyopaque;
    pub const FWPM_PROVIDER_ENUM_HANDLE = ?*anyopaque;
    pub const FWPM_SESSION_ENUM_HANDLE = ?*anyopaque;
    pub const FWPM_SUBLAYER_ENUM_HANDLE = ?*anyopaque;
    pub const IKEEXT_SA_ENUM_HANDLE = ?*anyopaque;
    pub const IPSEC_DOSP_STATE_ENUM_HANDLE = ?*anyopaque;
    pub const IPSEC_SA_CONTEXT_ENUM_HANDLE = ?*anyopaque;
    pub const IPSEC_SA_ENUM_HANDLE = ?*anyopaque;
    pub const FWPM_PROVIDER_CHANGE_CALLBACK0 = ?*const anyopaque;
    pub const FWPM_PROVIDER_CONTEXT_CHANGE_CALLBACK0 = ?*const anyopaque;
    pub const FWPM_SUBLAYER_CHANGE_CALLBACK0 = ?*const anyopaque;
    pub const FWPM_CALLOUT_CHANGE_CALLBACK0 = ?*const anyopaque;
    pub const FWPM_FILTER_CHANGE_CALLBACK0 = ?*const anyopaque;
    pub const IPSEC_SA_CONTEXT_CALLBACK0 = ?*const anyopaque;
    pub const IPSEC_KEY_MANAGER_KEY_DICTATION_CHECK0 = ?*const anyopaque;
    pub const IPSEC_KEY_MANAGER_DICTATE_KEY0 = ?*const anyopaque;
    pub const IPSEC_KEY_MANAGER_NOTIFY_KEY0 = ?*const anyopaque;
    pub const FWPM_NET_EVENT_CALLBACK0 = ?*const anyopaque;
    pub const FWPM_NET_EVENT_CALLBACK1 = ?*const anyopaque;
    pub const FWPM_NET_EVENT_CALLBACK2 = ?*const anyopaque;
    pub const FWPM_NET_EVENT_CALLBACK3 = ?*const anyopaque;
    pub const FWPM_NET_EVENT_CALLBACK4 = ?*const anyopaque;
    pub const FWPM_DYNAMIC_KEYWORD_CALLBACK0 = ?*const anyopaque;
    pub const FWPM_SYSTEM_PORTS_CALLBACK0 = ?*const anyopaque;
    pub const FWPM_CONNECTION_CALLBACK0 = ?*const anyopaque;
    pub const FWPM_VSWITCH_EVENT_CALLBACK0 = ?*const anyopaque;
};
