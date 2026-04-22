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
    .{ "lineAccept", MethodRecord{ .library = "TAPI32", .import = "lineAccept", .signature = "\x00\x03\x08\x09\x11\x3d\x09" } },
    .{ "lineAddProvider", MethodRecord{ .library = "TAPI32", .import = "lineAddProvider", .signature = "\x00\x03\x08\x11\x3d\x11\x25\x0f\x09" } },
    .{ "lineAddProviderA", MethodRecord{ .library = "TAPI32", .import = "lineAddProviderA", .signature = "\x00\x03\x08\x11\x3d\x11\x25\x0f\x09" } },
    .{ "lineAddProviderW", MethodRecord{ .library = "TAPI32", .import = "lineAddProviderW", .signature = "\x00\x03\x08\x11\x05\x11\x25\x0f\x09" } },
    .{ "lineAddToConference", MethodRecord{ .library = "TAPI32", .import = "lineAddToConference", .signature = "\x00\x02\x08\x09\x09" } },
    .{ "lineAgentSpecific", MethodRecord{ .library = "TAPI32", .import = "lineAgentSpecific", .signature = "\x00\x05\x08\x09\x09\x09\x0f\x01\x09" } },
    .{ "lineAnswer", MethodRecord{ .library = "TAPI32", .import = "lineAnswer", .signature = "\x00\x03\x08\x09\x11\x3d\x09" } },
    .{ "lineBlindTransfer", MethodRecord{ .library = "TAPI32", .import = "lineBlindTransfer", .signature = "\x00\x03\x08\x09\x11\x3d\x09" } },
    .{ "lineBlindTransferA", MethodRecord{ .library = "TAPI32", .import = "lineBlindTransferA", .signature = "\x00\x03\x08\x09\x11\x3d\x09" } },
    .{ "lineBlindTransferW", MethodRecord{ .library = "TAPI32", .import = "lineBlindTransferW", .signature = "\x00\x03\x08\x09\x11\x05\x09" } },
    .{ "lineClose", MethodRecord{ .library = "TAPI32", .import = "lineClose", .signature = "\x00\x01\x08\x09" } },
    .{ "lineCompleteCall", MethodRecord{ .library = "TAPI32", .import = "lineCompleteCall", .signature = "\x00\x04\x08\x09\x0f\x09\x09\x09" } },
    .{ "lineCompleteTransfer", MethodRecord{ .library = "TAPI32", .import = "lineCompleteTransfer", .signature = "\x00\x04\x08\x09\x09\x0f\x09\x09" } },
    .{ "lineConfigDialog", MethodRecord{ .library = "TAPI32", .import = "lineConfigDialog", .signature = "\x00\x03\x08\x09\x11\x25\x11\x3d" } },
    .{ "lineConfigDialogA", MethodRecord{ .library = "TAPI32", .import = "lineConfigDialogA", .signature = "\x00\x03\x08\x09\x11\x25\x11\x3d" } },
    .{ "lineConfigDialogW", MethodRecord{ .library = "TAPI32", .import = "lineConfigDialogW", .signature = "\x00\x03\x08\x09\x11\x25\x11\x05" } },
    .{ "lineConfigDialogEdit", MethodRecord{ .library = "TAPI32", .import = "lineConfigDialogEdit", .signature = "\x00\x06\x08\x09\x11\x25\x11\x3d\x0f\x01\x09\x0f\x11\xac\x2d" } },
    .{ "lineConfigDialogEditA", MethodRecord{ .library = "TAPI32", .import = "lineConfigDialogEditA", .signature = "\x00\x06\x08\x09\x11\x25\x11\x3d\x0f\x01\x09\x0f\x11\xac\x2d" } },
    .{ "lineConfigDialogEditW", MethodRecord{ .library = "TAPI32", .import = "lineConfigDialogEditW", .signature = "\x00\x06\x08\x09\x11\x25\x11\x05\x0f\x01\x09\x0f\x11\xac\x2d" } },
    .{ "lineConfigProvider", MethodRecord{ .library = "TAPI32", .import = "lineConfigProvider", .signature = "\x00\x02\x08\x11\x25\x09" } },
    .{ "lineCreateAgentW", MethodRecord{ .library = "TAPI32", .import = "lineCreateAgentW", .signature = "\x00\x04\x08\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "lineCreateAgentA", MethodRecord{ .library = "TAPI32", .import = "lineCreateAgentA", .signature = "\x00\x04\x08\x09\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "lineCreateAgentSessionW", MethodRecord{ .library = "TAPI32", .import = "lineCreateAgentSessionW", .signature = "\x00\x06\x08\x09\x09\x11\x05\x09\x0f\x11\x0d\x0f\x09" } },
    .{ "lineCreateAgentSessionA", MethodRecord{ .library = "TAPI32", .import = "lineCreateAgentSessionA", .signature = "\x00\x06\x08\x09\x09\x11\x3d\x09\x0f\x11\x0d\x0f\x09" } },
    .{ "lineDeallocateCall", MethodRecord{ .library = "TAPI32", .import = "lineDeallocateCall", .signature = "\x00\x01\x08\x09" } },
    .{ "lineDevSpecific", MethodRecord{ .library = "TAPI32", .import = "lineDevSpecific", .signature = "\x00\x05\x08\x09\x09\x09\x0f\x01\x09" } },
    .{ "lineDevSpecificFeature", MethodRecord{ .library = "TAPI32", .import = "lineDevSpecificFeature", .signature = "\x00\x04\x08\x09\x09\x0f\x01\x09" } },
    .{ "lineDial", MethodRecord{ .library = "TAPI32", .import = "lineDial", .signature = "\x00\x03\x08\x09\x11\x3d\x09" } },
    .{ "lineDialA", MethodRecord{ .library = "TAPI32", .import = "lineDialA", .signature = "\x00\x03\x08\x09\x11\x3d\x09" } },
    .{ "lineDialW", MethodRecord{ .library = "TAPI32", .import = "lineDialW", .signature = "\x00\x03\x08\x09\x11\x05\x09" } },
    .{ "lineDrop", MethodRecord{ .library = "TAPI32", .import = "lineDrop", .signature = "\x00\x03\x08\x09\x11\x3d\x09" } },
    .{ "lineForward", MethodRecord{ .library = "TAPI32", .import = "lineForward", .signature = "\x00\x07\x08\x09\x09\x09\x0f\x11\xac\x31\x09\x0f\x09\x0f\x11\xac\x35" } },
    .{ "lineForwardA", MethodRecord{ .library = "TAPI32", .import = "lineForwardA", .signature = "\x00\x07\x08\x09\x09\x09\x0f\x11\xac\x31\x09\x0f\x09\x0f\x11\xac\x35" } },
    .{ "lineForwardW", MethodRecord{ .library = "TAPI32", .import = "lineForwardW", .signature = "\x00\x07\x08\x09\x09\x09\x0f\x11\xac\x31\x09\x0f\x09\x0f\x11\xac\x35" } },
    .{ "lineGatherDigits", MethodRecord{ .library = "TAPI32", .import = "lineGatherDigits", .signature = "\x00\x07\x08\x09\x09\x11\x3d\x09\x11\x3d\x09\x09" } },
    .{ "lineGatherDigitsA", MethodRecord{ .library = "TAPI32", .import = "lineGatherDigitsA", .signature = "\x00\x07\x08\x09\x09\x11\x3d\x09\x11\x3d\x09\x09" } },
    .{ "lineGatherDigitsW", MethodRecord{ .library = "TAPI32", .import = "lineGatherDigitsW", .signature = "\x00\x07\x08\x09\x09\x11\x05\x09\x11\x05\x09\x09" } },
    .{ "lineGenerateDigits", MethodRecord{ .library = "TAPI32", .import = "lineGenerateDigits", .signature = "\x00\x04\x08\x09\x09\x11\x3d\x09" } },
    .{ "lineGenerateDigitsA", MethodRecord{ .library = "TAPI32", .import = "lineGenerateDigitsA", .signature = "\x00\x04\x08\x09\x09\x11\x3d\x09" } },
    .{ "lineGenerateDigitsW", MethodRecord{ .library = "TAPI32", .import = "lineGenerateDigitsW", .signature = "\x00\x04\x08\x09\x09\x11\x05\x09" } },
    .{ "lineGenerateTone", MethodRecord{ .library = "TAPI32", .import = "lineGenerateTone", .signature = "\x00\x05\x08\x09\x09\x09\x09\x0f\x11\xac\x39" } },
    .{ "lineGetAddressCaps", MethodRecord{ .library = "TAPI32", .import = "lineGetAddressCaps", .signature = "\x00\x06\x08\x09\x09\x09\x09\x09\x0f\x11\xac\x3d" } },
    .{ "lineGetAddressCapsA", MethodRecord{ .library = "TAPI32", .import = "lineGetAddressCapsA", .signature = "\x00\x06\x08\x09\x09\x09\x09\x09\x0f\x11\xac\x3d" } },
    .{ "lineGetAddressCapsW", MethodRecord{ .library = "TAPI32", .import = "lineGetAddressCapsW", .signature = "\x00\x06\x08\x09\x09\x09\x09\x09\x0f\x11\xac\x3d" } },
    .{ "lineGetAddressID", MethodRecord{ .library = "TAPI32", .import = "lineGetAddressID", .signature = "\x00\x05\x08\x09\x0f\x09\x09\x11\x3d\x09" } },
    .{ "lineGetAddressIDA", MethodRecord{ .library = "TAPI32", .import = "lineGetAddressIDA", .signature = "\x00\x05\x08\x09\x0f\x09\x09\x11\x3d\x09" } },
    .{ "lineGetAddressIDW", MethodRecord{ .library = "TAPI32", .import = "lineGetAddressIDW", .signature = "\x00\x05\x08\x09\x0f\x09\x09\x11\x05\x09" } },
    .{ "lineGetAddressStatus", MethodRecord{ .library = "TAPI32", .import = "lineGetAddressStatus", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x41" } },
    .{ "lineGetAddressStatusA", MethodRecord{ .library = "TAPI32", .import = "lineGetAddressStatusA", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x41" } },
    .{ "lineGetAddressStatusW", MethodRecord{ .library = "TAPI32", .import = "lineGetAddressStatusW", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x41" } },
    .{ "lineGetAgentActivityListA", MethodRecord{ .library = "TAPI32", .import = "lineGetAgentActivityListA", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x45" } },
    .{ "lineGetAgentActivityListW", MethodRecord{ .library = "TAPI32", .import = "lineGetAgentActivityListW", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x45" } },
    .{ "lineGetAgentCapsA", MethodRecord{ .library = "TAPI32", .import = "lineGetAgentCapsA", .signature = "\x00\x05\x08\x09\x09\x09\x09\x0f\x11\xac\x49" } },
    .{ "lineGetAgentCapsW", MethodRecord{ .library = "TAPI32", .import = "lineGetAgentCapsW", .signature = "\x00\x05\x08\x09\x09\x09\x09\x0f\x11\xac\x49" } },
    .{ "lineGetAgentGroupListA", MethodRecord{ .library = "TAPI32", .import = "lineGetAgentGroupListA", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x4d" } },
    .{ "lineGetAgentGroupListW", MethodRecord{ .library = "TAPI32", .import = "lineGetAgentGroupListW", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x4d" } },
    .{ "lineGetAgentInfo", MethodRecord{ .library = "TAPI32", .import = "lineGetAgentInfo", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x51" } },
    .{ "lineGetAgentSessionInfo", MethodRecord{ .library = "TAPI32", .import = "lineGetAgentSessionInfo", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x55" } },
    .{ "lineGetAgentSessionList", MethodRecord{ .library = "TAPI32", .import = "lineGetAgentSessionList", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x59" } },
    .{ "lineGetAgentStatusA", MethodRecord{ .library = "TAPI32", .import = "lineGetAgentStatusA", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x5d" } },
    .{ "lineGetAgentStatusW", MethodRecord{ .library = "TAPI32", .import = "lineGetAgentStatusW", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x5d" } },
    .{ "lineGetAppPriority", MethodRecord{ .library = "TAPI32", .import = "lineGetAppPriority", .signature = "\x00\x06\x08\x11\x3d\x09\x0f\x11\xac\x61\x09\x0f\x11\xac\x2d\x0f\x09" } },
    .{ "lineGetAppPriorityA", MethodRecord{ .library = "TAPI32", .import = "lineGetAppPriorityA", .signature = "\x00\x06\x08\x11\x3d\x09\x0f\x11\xac\x61\x09\x0f\x11\xac\x2d\x0f\x09" } },
    .{ "lineGetAppPriorityW", MethodRecord{ .library = "TAPI32", .import = "lineGetAppPriorityW", .signature = "\x00\x06\x08\x11\x05\x09\x0f\x11\xac\x61\x09\x0f\x11\xac\x2d\x0f\x09" } },
    .{ "lineGetCallInfo", MethodRecord{ .library = "TAPI32", .import = "lineGetCallInfo", .signature = "\x00\x02\x08\x09\x0f\x11\xac\x65" } },
    .{ "lineGetCallInfoA", MethodRecord{ .library = "TAPI32", .import = "lineGetCallInfoA", .signature = "\x00\x02\x08\x09\x0f\x11\xac\x65" } },
    .{ "lineGetCallInfoW", MethodRecord{ .library = "TAPI32", .import = "lineGetCallInfoW", .signature = "\x00\x02\x08\x09\x0f\x11\xac\x65" } },
    .{ "lineGetCallStatus", MethodRecord{ .library = "TAPI32", .import = "lineGetCallStatus", .signature = "\x00\x02\x08\x09\x0f\x11\xac\x69" } },
    .{ "lineGetConfRelatedCalls", MethodRecord{ .library = "TAPI32", .import = "lineGetConfRelatedCalls", .signature = "\x00\x02\x08\x09\x0f\x11\xac\x6d" } },
    .{ "lineGetCountry", MethodRecord{ .library = "TAPI32", .import = "lineGetCountry", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x71" } },
    .{ "lineGetCountryA", MethodRecord{ .library = "TAPI32", .import = "lineGetCountryA", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x71" } },
    .{ "lineGetCountryW", MethodRecord{ .library = "TAPI32", .import = "lineGetCountryW", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x71" } },
    .{ "lineGetDevCaps", MethodRecord{ .library = "TAPI32", .import = "lineGetDevCaps", .signature = "\x00\x05\x08\x09\x09\x09\x09\x0f\x11\xac\x75" } },
    .{ "lineGetDevCapsA", MethodRecord{ .library = "TAPI32", .import = "lineGetDevCapsA", .signature = "\x00\x05\x08\x09\x09\x09\x09\x0f\x11\xac\x75" } },
    .{ "lineGetDevCapsW", MethodRecord{ .library = "TAPI32", .import = "lineGetDevCapsW", .signature = "\x00\x05\x08\x09\x09\x09\x09\x0f\x11\xac\x75" } },
    .{ "lineGetDevConfig", MethodRecord{ .library = "TAPI32", .import = "lineGetDevConfig", .signature = "\x00\x03\x08\x09\x0f\x11\xac\x2d\x11\x3d" } },
    .{ "lineGetDevConfigA", MethodRecord{ .library = "TAPI32", .import = "lineGetDevConfigA", .signature = "\x00\x03\x08\x09\x0f\x11\xac\x2d\x11\x3d" } },
    .{ "lineGetDevConfigW", MethodRecord{ .library = "TAPI32", .import = "lineGetDevConfigW", .signature = "\x00\x03\x08\x09\x0f\x11\xac\x2d\x11\x05" } },
    .{ "lineGetGroupListA", MethodRecord{ .library = "TAPI32", .import = "lineGetGroupListA", .signature = "\x00\x02\x08\x09\x0f\x11\xac\x4d" } },
    .{ "lineGetGroupListW", MethodRecord{ .library = "TAPI32", .import = "lineGetGroupListW", .signature = "\x00\x02\x08\x09\x0f\x11\xac\x4d" } },
    .{ "lineGetIcon", MethodRecord{ .library = "TAPI32", .import = "lineGetIcon", .signature = "\x00\x03\x08\x09\x11\x3d\x0f\x11\x83\x55" } },
    .{ "lineGetIconA", MethodRecord{ .library = "TAPI32", .import = "lineGetIconA", .signature = "\x00\x03\x08\x09\x11\x3d\x0f\x11\x83\x55" } },
    .{ "lineGetIconW", MethodRecord{ .library = "TAPI32", .import = "lineGetIconW", .signature = "\x00\x03\x08\x09\x11\x05\x0f\x11\x83\x55" } },
    .{ "lineGetID", MethodRecord{ .library = "TAPI32", .import = "lineGetID", .signature = "\x00\x06\x08\x09\x09\x09\x09\x0f\x11\xac\x2d\x11\x3d" } },
    .{ "lineGetIDA", MethodRecord{ .library = "TAPI32", .import = "lineGetIDA", .signature = "\x00\x06\x08\x09\x09\x09\x09\x0f\x11\xac\x2d\x11\x3d" } },
    .{ "lineGetIDW", MethodRecord{ .library = "TAPI32", .import = "lineGetIDW", .signature = "\x00\x06\x08\x09\x09\x09\x09\x0f\x11\xac\x2d\x11\x05" } },
    .{ "lineGetLineDevStatus", MethodRecord{ .library = "TAPI32", .import = "lineGetLineDevStatus", .signature = "\x00\x02\x08\x09\x0f\x11\xac\x79" } },
    .{ "lineGetLineDevStatusA", MethodRecord{ .library = "TAPI32", .import = "lineGetLineDevStatusA", .signature = "\x00\x02\x08\x09\x0f\x11\xac\x79" } },
    .{ "lineGetLineDevStatusW", MethodRecord{ .library = "TAPI32", .import = "lineGetLineDevStatusW", .signature = "\x00\x02\x08\x09\x0f\x11\xac\x79" } },
    .{ "lineGetMessage", MethodRecord{ .library = "TAPI32", .import = "lineGetMessage", .signature = "\x00\x03\x08\x09\x0f\x11\xac\x7d\x09" } },
    .{ "lineGetNewCalls", MethodRecord{ .library = "TAPI32", .import = "lineGetNewCalls", .signature = "\x00\x04\x08\x09\x09\x09\x0f\x11\xac\x6d" } },
    .{ "lineGetNumRings", MethodRecord{ .library = "TAPI32", .import = "lineGetNumRings", .signature = "\x00\x03\x08\x09\x09\x0f\x09" } },
    .{ "lineGetProviderList", MethodRecord{ .library = "TAPI32", .import = "lineGetProviderList", .signature = "\x00\x02\x08\x09\x0f\x11\xac\x81" } },
    .{ "lineGetProviderListA", MethodRecord{ .library = "TAPI32", .import = "lineGetProviderListA", .signature = "\x00\x02\x08\x09\x0f\x11\xac\x81" } },
    .{ "lineGetProviderListW", MethodRecord{ .library = "TAPI32", .import = "lineGetProviderListW", .signature = "\x00\x02\x08\x09\x0f\x11\xac\x81" } },
    .{ "lineGetProxyStatus", MethodRecord{ .library = "TAPI32", .import = "lineGetProxyStatus", .signature = "\x00\x04\x08\x09\x09\x09\x0f\x11\xac\x85" } },
    .{ "lineGetQueueInfo", MethodRecord{ .library = "TAPI32", .import = "lineGetQueueInfo", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x89" } },
    .{ "lineGetQueueListA", MethodRecord{ .library = "TAPI32", .import = "lineGetQueueListA", .signature = "\x00\x03\x08\x09\x0f\x11\x0d\x0f\x11\xac\x8d" } },
    .{ "lineGetQueueListW", MethodRecord{ .library = "TAPI32", .import = "lineGetQueueListW", .signature = "\x00\x03\x08\x09\x0f\x11\x0d\x0f\x11\xac\x8d" } },
    .{ "lineGetRequest", MethodRecord{ .library = "TAPI32", .import = "lineGetRequest", .signature = "\x00\x03\x08\x09\x09\x0f\x01" } },
    .{ "lineGetRequestA", MethodRecord{ .library = "TAPI32", .import = "lineGetRequestA", .signature = "\x00\x03\x08\x09\x09\x0f\x01" } },
    .{ "lineGetRequestW", MethodRecord{ .library = "TAPI32", .import = "lineGetRequestW", .signature = "\x00\x03\x08\x09\x09\x0f\x01" } },
    .{ "lineGetStatusMessages", MethodRecord{ .library = "TAPI32", .import = "lineGetStatusMessages", .signature = "\x00\x03\x08\x09\x0f\x09\x0f\x09" } },
    .{ "lineGetTranslateCaps", MethodRecord{ .library = "TAPI32", .import = "lineGetTranslateCaps", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x91" } },
    .{ "lineGetTranslateCapsA", MethodRecord{ .library = "TAPI32", .import = "lineGetTranslateCapsA", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x91" } },
    .{ "lineGetTranslateCapsW", MethodRecord{ .library = "TAPI32", .import = "lineGetTranslateCapsW", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x91" } },
    .{ "lineHandoff", MethodRecord{ .library = "TAPI32", .import = "lineHandoff", .signature = "\x00\x03\x08\x09\x11\x3d\x09" } },
    .{ "lineHandoffA", MethodRecord{ .library = "TAPI32", .import = "lineHandoffA", .signature = "\x00\x03\x08\x09\x11\x3d\x09" } },
    .{ "lineHandoffW", MethodRecord{ .library = "TAPI32", .import = "lineHandoffW", .signature = "\x00\x03\x08\x09\x11\x05\x09" } },
    .{ "lineHold", MethodRecord{ .library = "TAPI32", .import = "lineHold", .signature = "\x00\x01\x08\x09" } },
    .{ "lineInitialize", MethodRecord{ .library = "TAPI32", .import = "lineInitialize", .signature = "\x00\x05\x08\x0f\x09\x11\x82\x29\x12\xac\x95\x11\x3d\x0f\x09" } },
    .{ "lineInitializeExA", MethodRecord{ .library = "TAPI32", .import = "lineInitializeExA", .signature = "\x00\x07\x08\x0f\x09\x11\x82\x29\x12\xac\x95\x11\x3d\x0f\x09\x0f\x09\x0f\x11\xac\x99" } },
    .{ "lineInitializeExW", MethodRecord{ .library = "TAPI32", .import = "lineInitializeExW", .signature = "\x00\x07\x08\x0f\x09\x11\x82\x29\x12\xac\x95\x11\x05\x0f\x09\x0f\x09\x0f\x11\xac\x99" } },
    .{ "lineMakeCall", MethodRecord{ .library = "TAPI32", .import = "lineMakeCall", .signature = "\x00\x05\x08\x09\x0f\x09\x11\x3d\x09\x0f\x11\xac\x35" } },
    .{ "lineMakeCallA", MethodRecord{ .library = "TAPI32", .import = "lineMakeCallA", .signature = "\x00\x05\x08\x09\x0f\x09\x11\x3d\x09\x0f\x11\xac\x35" } },
    .{ "lineMakeCallW", MethodRecord{ .library = "TAPI32", .import = "lineMakeCallW", .signature = "\x00\x05\x08\x09\x0f\x09\x11\x05\x09\x0f\x11\xac\x35" } },
    .{ "lineMonitorDigits", MethodRecord{ .library = "TAPI32", .import = "lineMonitorDigits", .signature = "\x00\x02\x08\x09\x09" } },
    .{ "lineMonitorMedia", MethodRecord{ .library = "TAPI32", .import = "lineMonitorMedia", .signature = "\x00\x02\x08\x09\x09" } },
    .{ "lineMonitorTones", MethodRecord{ .library = "TAPI32", .import = "lineMonitorTones", .signature = "\x00\x03\x08\x09\x0f\x11\xac\x9d\x09" } },
    .{ "lineNegotiateAPIVersion", MethodRecord{ .library = "TAPI32", .import = "lineNegotiateAPIVersion", .signature = "\x00\x06\x08\x09\x09\x09\x09\x0f\x09\x0f\x11\xac\x61" } },
    .{ "lineNegotiateExtVersion", MethodRecord{ .library = "TAPI32", .import = "lineNegotiateExtVersion", .signature = "\x00\x06\x08\x09\x09\x09\x09\x09\x0f\x09" } },
    .{ "lineOpen", MethodRecord{ .library = "TAPI32", .import = "lineOpen", .signature = "\x00\x09\x08\x09\x09\x0f\x09\x09\x09\x19\x09\x09\x0f\x11\xac\x35" } },
    .{ "lineOpenA", MethodRecord{ .library = "TAPI32", .import = "lineOpenA", .signature = "\x00\x09\x08\x09\x09\x0f\x09\x09\x09\x19\x09\x09\x0f\x11\xac\x35" } },
    .{ "lineOpenW", MethodRecord{ .library = "TAPI32", .import = "lineOpenW", .signature = "\x00\x09\x08\x09\x09\x0f\x09\x09\x09\x19\x09\x09\x0f\x11\xac\x35" } },
    .{ "linePark", MethodRecord{ .library = "TAPI32", .import = "linePark", .signature = "\x00\x04\x08\x09\x09\x11\x3d\x0f\x11\xac\x2d" } },
    .{ "lineParkA", MethodRecord{ .library = "TAPI32", .import = "lineParkA", .signature = "\x00\x04\x08\x09\x09\x11\x3d\x0f\x11\xac\x2d" } },
    .{ "lineParkW", MethodRecord{ .library = "TAPI32", .import = "lineParkW", .signature = "\x00\x04\x08\x09\x09\x11\x05\x0f\x11\xac\x2d" } },
    .{ "linePickup", MethodRecord{ .library = "TAPI32", .import = "linePickup", .signature = "\x00\x05\x08\x09\x09\x0f\x09\x11\x3d\x11\x3d" } },
    .{ "linePickupA", MethodRecord{ .library = "TAPI32", .import = "linePickupA", .signature = "\x00\x05\x08\x09\x09\x0f\x09\x11\x3d\x11\x3d" } },
    .{ "linePickupW", MethodRecord{ .library = "TAPI32", .import = "linePickupW", .signature = "\x00\x05\x08\x09\x09\x0f\x09\x11\x05\x11\x05" } },
    .{ "linePrepareAddToConference", MethodRecord{ .library = "TAPI32", .import = "linePrepareAddToConference", .signature = "\x00\x03\x08\x09\x0f\x09\x0f\x11\xac\x35" } },
    .{ "linePrepareAddToConferenceA", MethodRecord{ .library = "TAPI32", .import = "linePrepareAddToConferenceA", .signature = "\x00\x03\x08\x09\x0f\x09\x0f\x11\xac\x35" } },
    .{ "linePrepareAddToConferenceW", MethodRecord{ .library = "TAPI32", .import = "linePrepareAddToConferenceW", .signature = "\x00\x03\x08\x09\x0f\x09\x0f\x11\xac\x35" } },
    .{ "lineProxyMessage", MethodRecord{ .library = "TAPI32", .import = "lineProxyMessage", .signature = "\x00\x06\x08\x09\x09\x09\x09\x09\x09" } },
    .{ "lineProxyResponse", MethodRecord{ .library = "TAPI32", .import = "lineProxyResponse", .signature = "\x00\x03\x08\x09\x0f\x11\xac\xa1\x09" } },
    .{ "lineRedirect", MethodRecord{ .library = "TAPI32", .import = "lineRedirect", .signature = "\x00\x03\x08\x09\x11\x3d\x09" } },
    .{ "lineRedirectA", MethodRecord{ .library = "TAPI32", .import = "lineRedirectA", .signature = "\x00\x03\x08\x09\x11\x3d\x09" } },
    .{ "lineRedirectW", MethodRecord{ .library = "TAPI32", .import = "lineRedirectW", .signature = "\x00\x03\x08\x09\x11\x05\x09" } },
    .{ "lineRegisterRequestRecipient", MethodRecord{ .library = "TAPI32", .import = "lineRegisterRequestRecipient", .signature = "\x00\x04\x08\x09\x09\x09\x09" } },
    .{ "lineReleaseUserUserInfo", MethodRecord{ .library = "TAPI32", .import = "lineReleaseUserUserInfo", .signature = "\x00\x01\x08\x09" } },
    .{ "lineRemoveFromConference", MethodRecord{ .library = "TAPI32", .import = "lineRemoveFromConference", .signature = "\x00\x01\x08\x09" } },
    .{ "lineRemoveProvider", MethodRecord{ .library = "TAPI32", .import = "lineRemoveProvider", .signature = "\x00\x02\x08\x09\x11\x25" } },
    .{ "lineSecureCall", MethodRecord{ .library = "TAPI32", .import = "lineSecureCall", .signature = "\x00\x01\x08\x09" } },
    .{ "lineSendUserUserInfo", MethodRecord{ .library = "TAPI32", .import = "lineSendUserUserInfo", .signature = "\x00\x03\x08\x09\x11\x3d\x09" } },
    .{ "lineSetAgentActivity", MethodRecord{ .library = "TAPI32", .import = "lineSetAgentActivity", .signature = "\x00\x03\x08\x09\x09\x09" } },
    .{ "lineSetAgentGroup", MethodRecord{ .library = "TAPI32", .import = "lineSetAgentGroup", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\x4d" } },
    .{ "lineSetAgentMeasurementPeriod", MethodRecord{ .library = "TAPI32", .import = "lineSetAgentMeasurementPeriod", .signature = "\x00\x03\x08\x09\x09\x09" } },
    .{ "lineSetAgentSessionState", MethodRecord{ .library = "TAPI32", .import = "lineSetAgentSessionState", .signature = "\x00\x04\x08\x09\x09\x09\x09" } },
    .{ "lineSetAgentStateEx", MethodRecord{ .library = "TAPI32", .import = "lineSetAgentStateEx", .signature = "\x00\x04\x08\x09\x09\x09\x09" } },
    .{ "lineSetAgentState", MethodRecord{ .library = "TAPI32", .import = "lineSetAgentState", .signature = "\x00\x04\x08\x09\x09\x09\x09" } },
    .{ "lineSetAppPriority", MethodRecord{ .library = "TAPI32", .import = "lineSetAppPriority", .signature = "\x00\x06\x08\x11\x3d\x09\x0f\x11\xac\x61\x09\x11\x3d\x09" } },
    .{ "lineSetAppPriorityA", MethodRecord{ .library = "TAPI32", .import = "lineSetAppPriorityA", .signature = "\x00\x06\x08\x11\x3d\x09\x0f\x11\xac\x61\x09\x11\x3d\x09" } },
    .{ "lineSetAppPriorityW", MethodRecord{ .library = "TAPI32", .import = "lineSetAppPriorityW", .signature = "\x00\x06\x08\x11\x05\x09\x0f\x11\xac\x61\x09\x11\x05\x09" } },
    .{ "lineSetAppSpecific", MethodRecord{ .library = "TAPI32", .import = "lineSetAppSpecific", .signature = "\x00\x02\x08\x09\x09" } },
    .{ "lineSetCallData", MethodRecord{ .library = "TAPI32", .import = "lineSetCallData", .signature = "\x00\x03\x08\x09\x0f\x01\x09" } },
    .{ "lineSetCallParams", MethodRecord{ .library = "TAPI32", .import = "lineSetCallParams", .signature = "\x00\x05\x08\x09\x09\x09\x09\x0f\x11\xac\xa5" } },
    .{ "lineSetCallPrivilege", MethodRecord{ .library = "TAPI32", .import = "lineSetCallPrivilege", .signature = "\x00\x02\x08\x09\x09" } },
    .{ "lineSetCallQualityOfService", MethodRecord{ .library = "TAPI32", .import = "lineSetCallQualityOfService", .signature = "\x00\x05\x08\x09\x0f\x01\x09\x0f\x01\x09" } },
    .{ "lineSetCallTreatment", MethodRecord{ .library = "TAPI32", .import = "lineSetCallTreatment", .signature = "\x00\x02\x08\x09\x09" } },
    .{ "lineSetCurrentLocation", MethodRecord{ .library = "TAPI32", .import = "lineSetCurrentLocation", .signature = "\x00\x02\x08\x09\x09" } },
    .{ "lineSetDevConfig", MethodRecord{ .library = "TAPI32", .import = "lineSetDevConfig", .signature = "\x00\x04\x08\x09\x0f\x01\x09\x11\x3d" } },
    .{ "lineSetDevConfigA", MethodRecord{ .library = "TAPI32", .import = "lineSetDevConfigA", .signature = "\x00\x04\x08\x09\x0f\x01\x09\x11\x3d" } },
    .{ "lineSetDevConfigW", MethodRecord{ .library = "TAPI32", .import = "lineSetDevConfigW", .signature = "\x00\x04\x08\x09\x0f\x01\x09\x11\x05" } },
    .{ "lineSetLineDevStatus", MethodRecord{ .library = "TAPI32", .import = "lineSetLineDevStatus", .signature = "\x00\x03\x08\x09\x09\x09" } },
    .{ "lineSetMediaControl", MethodRecord{ .library = "TAPI32", .import = "lineSetMediaControl", .signature = "\x00\x0c\x08\x09\x09\x09\x09\x0f\x11\xac\xa9\x09\x0f\x11\xac\xad\x09\x0f\x11\xac\xb1\x09\x0f\x11\xac\xb5\x09" } },
    .{ "lineSetMediaMode", MethodRecord{ .library = "TAPI32", .import = "lineSetMediaMode", .signature = "\x00\x02\x08\x09\x09" } },
    .{ "lineSetQueueMeasurementPeriod", MethodRecord{ .library = "TAPI32", .import = "lineSetQueueMeasurementPeriod", .signature = "\x00\x03\x08\x09\x09\x09" } },
    .{ "lineSetNumRings", MethodRecord{ .library = "TAPI32", .import = "lineSetNumRings", .signature = "\x00\x03\x08\x09\x09\x09" } },
    .{ "lineSetStatusMessages", MethodRecord{ .library = "TAPI32", .import = "lineSetStatusMessages", .signature = "\x00\x03\x08\x09\x09\x09" } },
    .{ "lineSetTerminal", MethodRecord{ .library = "TAPI32", .import = "lineSetTerminal", .signature = "\x00\x07\x08\x09\x09\x09\x09\x09\x09\x09" } },
    .{ "lineSetTollList", MethodRecord{ .library = "TAPI32", .import = "lineSetTollList", .signature = "\x00\x04\x08\x09\x09\x11\x3d\x09" } },
    .{ "lineSetTollListA", MethodRecord{ .library = "TAPI32", .import = "lineSetTollListA", .signature = "\x00\x04\x08\x09\x09\x11\x3d\x09" } },
    .{ "lineSetTollListW", MethodRecord{ .library = "TAPI32", .import = "lineSetTollListW", .signature = "\x00\x04\x08\x09\x09\x11\x05\x09" } },
    .{ "lineSetupConference", MethodRecord{ .library = "TAPI32", .import = "lineSetupConference", .signature = "\x00\x06\x08\x09\x09\x0f\x09\x0f\x09\x09\x0f\x11\xac\x35" } },
    .{ "lineSetupConferenceA", MethodRecord{ .library = "TAPI32", .import = "lineSetupConferenceA", .signature = "\x00\x06\x08\x09\x09\x0f\x09\x0f\x09\x09\x0f\x11\xac\x35" } },
    .{ "lineSetupConferenceW", MethodRecord{ .library = "TAPI32", .import = "lineSetupConferenceW", .signature = "\x00\x06\x08\x09\x09\x0f\x09\x0f\x09\x09\x0f\x11\xac\x35" } },
    .{ "lineSetupTransfer", MethodRecord{ .library = "TAPI32", .import = "lineSetupTransfer", .signature = "\x00\x03\x08\x09\x0f\x09\x0f\x11\xac\x35" } },
    .{ "lineSetupTransferA", MethodRecord{ .library = "TAPI32", .import = "lineSetupTransferA", .signature = "\x00\x03\x08\x09\x0f\x09\x0f\x11\xac\x35" } },
    .{ "lineSetupTransferW", MethodRecord{ .library = "TAPI32", .import = "lineSetupTransferW", .signature = "\x00\x03\x08\x09\x0f\x09\x0f\x11\xac\x35" } },
    .{ "lineShutdown", MethodRecord{ .library = "TAPI32", .import = "lineShutdown", .signature = "\x00\x01\x08\x09" } },
    .{ "lineSwapHold", MethodRecord{ .library = "TAPI32", .import = "lineSwapHold", .signature = "\x00\x02\x08\x09\x09" } },
    .{ "lineTranslateAddress", MethodRecord{ .library = "TAPI32", .import = "lineTranslateAddress", .signature = "\x00\x07\x08\x09\x09\x09\x11\x3d\x09\x09\x0f\x11\xac\xb9" } },
    .{ "lineTranslateAddressA", MethodRecord{ .library = "TAPI32", .import = "lineTranslateAddressA", .signature = "\x00\x07\x08\x09\x09\x09\x11\x3d\x09\x09\x0f\x11\xac\xb9" } },
    .{ "lineTranslateAddressW", MethodRecord{ .library = "TAPI32", .import = "lineTranslateAddressW", .signature = "\x00\x07\x08\x09\x09\x09\x11\x05\x09\x09\x0f\x11\xac\xb9" } },
    .{ "lineTranslateDialog", MethodRecord{ .library = "TAPI32", .import = "lineTranslateDialog", .signature = "\x00\x05\x08\x09\x09\x09\x11\x25\x11\x3d" } },
    .{ "lineTranslateDialogA", MethodRecord{ .library = "TAPI32", .import = "lineTranslateDialogA", .signature = "\x00\x05\x08\x09\x09\x09\x11\x25\x11\x3d" } },
    .{ "lineTranslateDialogW", MethodRecord{ .library = "TAPI32", .import = "lineTranslateDialogW", .signature = "\x00\x05\x08\x09\x09\x09\x11\x25\x11\x05" } },
    .{ "lineUncompleteCall", MethodRecord{ .library = "TAPI32", .import = "lineUncompleteCall", .signature = "\x00\x02\x08\x09\x09" } },
    .{ "lineUnhold", MethodRecord{ .library = "TAPI32", .import = "lineUnhold", .signature = "\x00\x01\x08\x09" } },
    .{ "lineUnpark", MethodRecord{ .library = "TAPI32", .import = "lineUnpark", .signature = "\x00\x04\x08\x09\x09\x0f\x09\x11\x3d" } },
    .{ "lineUnparkA", MethodRecord{ .library = "TAPI32", .import = "lineUnparkA", .signature = "\x00\x04\x08\x09\x09\x0f\x09\x11\x3d" } },
    .{ "lineUnparkW", MethodRecord{ .library = "TAPI32", .import = "lineUnparkW", .signature = "\x00\x04\x08\x09\x09\x0f\x09\x11\x05" } },
    .{ "phoneClose", MethodRecord{ .library = "TAPI32", .import = "phoneClose", .signature = "\x00\x01\x08\x09" } },
    .{ "phoneConfigDialog", MethodRecord{ .library = "TAPI32", .import = "phoneConfigDialog", .signature = "\x00\x03\x08\x09\x11\x25\x11\x3d" } },
    .{ "phoneConfigDialogA", MethodRecord{ .library = "TAPI32", .import = "phoneConfigDialogA", .signature = "\x00\x03\x08\x09\x11\x25\x11\x3d" } },
    .{ "phoneConfigDialogW", MethodRecord{ .library = "TAPI32", .import = "phoneConfigDialogW", .signature = "\x00\x03\x08\x09\x11\x25\x11\x05" } },
    .{ "phoneDevSpecific", MethodRecord{ .library = "TAPI32", .import = "phoneDevSpecific", .signature = "\x00\x03\x08\x09\x0f\x01\x09" } },
    .{ "phoneGetButtonInfo", MethodRecord{ .library = "TAPI32", .import = "phoneGetButtonInfo", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\xbd" } },
    .{ "phoneGetButtonInfoA", MethodRecord{ .library = "TAPI32", .import = "phoneGetButtonInfoA", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\xbd" } },
    .{ "phoneGetButtonInfoW", MethodRecord{ .library = "TAPI32", .import = "phoneGetButtonInfoW", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\xbd" } },
    .{ "phoneGetData", MethodRecord{ .library = "TAPI32", .import = "phoneGetData", .signature = "\x00\x04\x08\x09\x09\x0f\x01\x09" } },
    .{ "phoneGetDevCaps", MethodRecord{ .library = "TAPI32", .import = "phoneGetDevCaps", .signature = "\x00\x05\x08\x09\x09\x09\x09\x0f\x11\xac\xc1" } },
    .{ "phoneGetDevCapsA", MethodRecord{ .library = "TAPI32", .import = "phoneGetDevCapsA", .signature = "\x00\x05\x08\x09\x09\x09\x09\x0f\x11\xac\xc1" } },
    .{ "phoneGetDevCapsW", MethodRecord{ .library = "TAPI32", .import = "phoneGetDevCapsW", .signature = "\x00\x05\x08\x09\x09\x09\x09\x0f\x11\xac\xc1" } },
    .{ "phoneGetDisplay", MethodRecord{ .library = "TAPI32", .import = "phoneGetDisplay", .signature = "\x00\x02\x08\x09\x0f\x11\xac\x2d" } },
    .{ "phoneGetGain", MethodRecord{ .library = "TAPI32", .import = "phoneGetGain", .signature = "\x00\x03\x08\x09\x09\x0f\x09" } },
    .{ "phoneGetHookSwitch", MethodRecord{ .library = "TAPI32", .import = "phoneGetHookSwitch", .signature = "\x00\x02\x08\x09\x0f\x09" } },
    .{ "phoneGetIcon", MethodRecord{ .library = "TAPI32", .import = "phoneGetIcon", .signature = "\x00\x03\x08\x09\x11\x3d\x0f\x11\x83\x55" } },
    .{ "phoneGetIconA", MethodRecord{ .library = "TAPI32", .import = "phoneGetIconA", .signature = "\x00\x03\x08\x09\x11\x3d\x0f\x11\x83\x55" } },
    .{ "phoneGetIconW", MethodRecord{ .library = "TAPI32", .import = "phoneGetIconW", .signature = "\x00\x03\x08\x09\x11\x05\x0f\x11\x83\x55" } },
    .{ "phoneGetID", MethodRecord{ .library = "TAPI32", .import = "phoneGetID", .signature = "\x00\x03\x08\x09\x0f\x11\xac\x2d\x11\x3d" } },
    .{ "phoneGetIDA", MethodRecord{ .library = "TAPI32", .import = "phoneGetIDA", .signature = "\x00\x03\x08\x09\x0f\x11\xac\x2d\x11\x3d" } },
    .{ "phoneGetIDW", MethodRecord{ .library = "TAPI32", .import = "phoneGetIDW", .signature = "\x00\x03\x08\x09\x0f\x11\xac\x2d\x11\x05" } },
    .{ "phoneGetLamp", MethodRecord{ .library = "TAPI32", .import = "phoneGetLamp", .signature = "\x00\x03\x08\x09\x09\x0f\x09" } },
    .{ "phoneGetMessage", MethodRecord{ .library = "TAPI32", .import = "phoneGetMessage", .signature = "\x00\x03\x08\x09\x0f\x11\xac\xc5\x09" } },
    .{ "phoneGetRing", MethodRecord{ .library = "TAPI32", .import = "phoneGetRing", .signature = "\x00\x03\x08\x09\x0f\x09\x0f\x09" } },
    .{ "phoneGetStatus", MethodRecord{ .library = "TAPI32", .import = "phoneGetStatus", .signature = "\x00\x02\x08\x09\x0f\x11\xac\xc9" } },
    .{ "phoneGetStatusA", MethodRecord{ .library = "TAPI32", .import = "phoneGetStatusA", .signature = "\x00\x02\x08\x09\x0f\x11\xac\xc9" } },
    .{ "phoneGetStatusW", MethodRecord{ .library = "TAPI32", .import = "phoneGetStatusW", .signature = "\x00\x02\x08\x09\x0f\x11\xac\xc9" } },
    .{ "phoneGetStatusMessages", MethodRecord{ .library = "TAPI32", .import = "phoneGetStatusMessages", .signature = "\x00\x04\x08\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "phoneGetVolume", MethodRecord{ .library = "TAPI32", .import = "phoneGetVolume", .signature = "\x00\x03\x08\x09\x09\x0f\x09" } },
    .{ "phoneInitialize", MethodRecord{ .library = "TAPI32", .import = "phoneInitialize", .signature = "\x00\x05\x08\x0f\x09\x11\x82\x29\x12\xac\xcd\x11\x3d\x0f\x09" } },
    .{ "phoneInitializeExA", MethodRecord{ .library = "TAPI32", .import = "phoneInitializeExA", .signature = "\x00\x07\x08\x0f\x09\x11\x82\x29\x12\xac\xcd\x11\x3d\x0f\x09\x0f\x09\x0f\x11\xac\xd1" } },
    .{ "phoneInitializeExW", MethodRecord{ .library = "TAPI32", .import = "phoneInitializeExW", .signature = "\x00\x07\x08\x0f\x09\x11\x82\x29\x12\xac\xcd\x11\x05\x0f\x09\x0f\x09\x0f\x11\xac\xd1" } },
    .{ "phoneNegotiateAPIVersion", MethodRecord{ .library = "TAPI32", .import = "phoneNegotiateAPIVersion", .signature = "\x00\x06\x08\x09\x09\x09\x09\x0f\x09\x0f\x11\xac\xd5" } },
    .{ "phoneNegotiateExtVersion", MethodRecord{ .library = "TAPI32", .import = "phoneNegotiateExtVersion", .signature = "\x00\x06\x08\x09\x09\x09\x09\x09\x0f\x09" } },
    .{ "phoneOpen", MethodRecord{ .library = "TAPI32", .import = "phoneOpen", .signature = "\x00\x07\x08\x09\x09\x0f\x09\x09\x09\x19\x09" } },
    .{ "phoneSetButtonInfo", MethodRecord{ .library = "TAPI32", .import = "phoneSetButtonInfo", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\xbd" } },
    .{ "phoneSetButtonInfoA", MethodRecord{ .library = "TAPI32", .import = "phoneSetButtonInfoA", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\xbd" } },
    .{ "phoneSetButtonInfoW", MethodRecord{ .library = "TAPI32", .import = "phoneSetButtonInfoW", .signature = "\x00\x03\x08\x09\x09\x0f\x11\xac\xbd" } },
    .{ "phoneSetData", MethodRecord{ .library = "TAPI32", .import = "phoneSetData", .signature = "\x00\x04\x08\x09\x09\x0f\x01\x09" } },
    .{ "phoneSetDisplay", MethodRecord{ .library = "TAPI32", .import = "phoneSetDisplay", .signature = "\x00\x05\x08\x09\x09\x09\x11\x3d\x09" } },
    .{ "phoneSetGain", MethodRecord{ .library = "TAPI32", .import = "phoneSetGain", .signature = "\x00\x03\x08\x09\x09\x09" } },
    .{ "phoneSetHookSwitch", MethodRecord{ .library = "TAPI32", .import = "phoneSetHookSwitch", .signature = "\x00\x03\x08\x09\x09\x09" } },
    .{ "phoneSetLamp", MethodRecord{ .library = "TAPI32", .import = "phoneSetLamp", .signature = "\x00\x03\x08\x09\x09\x09" } },
    .{ "phoneSetRing", MethodRecord{ .library = "TAPI32", .import = "phoneSetRing", .signature = "\x00\x03\x08\x09\x09\x09" } },
    .{ "phoneSetStatusMessages", MethodRecord{ .library = "TAPI32", .import = "phoneSetStatusMessages", .signature = "\x00\x04\x08\x09\x09\x09\x09" } },
    .{ "phoneSetVolume", MethodRecord{ .library = "TAPI32", .import = "phoneSetVolume", .signature = "\x00\x03\x08\x09\x09\x09" } },
    .{ "phoneShutdown", MethodRecord{ .library = "TAPI32", .import = "phoneShutdown", .signature = "\x00\x01\x08\x09" } },
    .{ "tapiGetLocationInfo", MethodRecord{ .library = "TAPI32", .import = "tapiGetLocationInfo", .signature = "\x00\x02\x08\x11\x3d\x11\x3d" } },
    .{ "tapiGetLocationInfoA", MethodRecord{ .library = "TAPI32", .import = "tapiGetLocationInfoA", .signature = "\x00\x02\x08\x11\x3d\x11\x3d" } },
    .{ "tapiGetLocationInfoW", MethodRecord{ .library = "TAPI32", .import = "tapiGetLocationInfoW", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
    .{ "tapiRequestDrop", MethodRecord{ .library = "TAPI32", .import = "tapiRequestDrop", .signature = "\x00\x02\x08\x11\x25\x11\x83\x8d" } },
    .{ "tapiRequestMakeCall", MethodRecord{ .library = "TAPI32", .import = "tapiRequestMakeCall", .signature = "\x00\x04\x08\x11\x3d\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "tapiRequestMakeCallA", MethodRecord{ .library = "TAPI32", .import = "tapiRequestMakeCallA", .signature = "\x00\x04\x08\x11\x3d\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "tapiRequestMakeCallW", MethodRecord{ .library = "TAPI32", .import = "tapiRequestMakeCallW", .signature = "\x00\x04\x08\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "tapiRequestMediaCall", MethodRecord{ .library = "TAPI32", .import = "tapiRequestMediaCall", .signature = "\x00\x0a\x08\x11\x25\x11\x83\x8d\x11\x3d\x11\x3d\x09\x09\x11\x3d\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "tapiRequestMediaCallA", MethodRecord{ .library = "TAPI32", .import = "tapiRequestMediaCallA", .signature = "\x00\x0a\x08\x11\x25\x11\x83\x8d\x11\x3d\x11\x3d\x09\x09\x11\x3d\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "tapiRequestMediaCallW", MethodRecord{ .library = "TAPI32", .import = "tapiRequestMediaCallW", .signature = "\x00\x0a\x08\x11\x25\x11\x83\x8d\x11\x05\x11\x05\x09\x09\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "OpenTnefStream", MethodRecord{ .library = "MAPI32", .import = "OpenTnefStream", .signature = "\x00\x07\x11\x79\x0f\x01\x12\x83\x75\x0f\x04\x09\x12\xac\xd9\x07\x0f\x12\xac\xdd" } },
    .{ "OpenTnefStreamEx", MethodRecord{ .library = "MAPI32", .import = "OpenTnefStreamEx", .signature = "\x00\x08\x11\x79\x0f\x01\x12\x83\x75\x0f\x04\x09\x12\xac\xd9\x07\x12\xac\xe1\x0f\x12\xac\xdd" } },
    .{ "GetTnefStreamCodepage", MethodRecord{ .library = "MAPI32", .import = "GetTnefStreamCodepage", .signature = "\x00\x03\x11\x79\x12\x83\x75\x0f\x09\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x355 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HICON" },
        0x375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IStream" },
        0x38d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WPARAM" },
        0x2c2d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "VARSTRING" },
        0x2c31 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEFORWARDLIST" },
        0x2c35 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINECALLPARAMS" },
        0x2c39 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEGENERATETONE" },
        0x2c3d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEADDRESSCAPS" },
        0x2c41 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEADDRESSSTATUS" },
        0x2c45 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEAGENTACTIVITYLIST" },
        0x2c49 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEAGENTCAPS" },
        0x2c4d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEAGENTGROUPLIST" },
        0x2c51 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEAGENTINFO" },
        0x2c55 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEAGENTSESSIONINFO" },
        0x2c59 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEAGENTSESSIONLIST" },
        0x2c5d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEAGENTSTATUS" },
        0x2c61 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEEXTENSIONID" },
        0x2c65 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINECALLINFO" },
        0x2c69 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINECALLSTATUS" },
        0x2c6d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINECALLLIST" },
        0x2c71 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINECOUNTRYLIST" },
        0x2c75 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEDEVCAPS" },
        0x2c79 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEDEVSTATUS" },
        0x2c7d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEMESSAGE" },
        0x2c81 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEPROVIDERLIST" },
        0x2c85 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEPROXYREQUESTLIST" },
        0x2c89 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEQUEUEINFO" },
        0x2c8d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEQUEUELIST" },
        0x2c91 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINETRANSLATECAPS" },
        0x2c95 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINECALLBACK" },
        0x2c99 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEINITIALIZEEXPARAMS" },
        0x2c9d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEMONITORTONE" },
        0x2ca1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEPROXYREQUEST" },
        0x2ca5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEDIALPARAMS" },
        0x2ca9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEMEDIACONTROLDIGIT" },
        0x2cad => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEMEDIACONTROLMEDIA" },
        0x2cb1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEMEDIACONTROLTONE" },
        0x2cb5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINEMEDIACONTROLCALLSTATE" },
        0x2cb9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "LINETRANSLATEOUTPUT" },
        0x2cbd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "PHONEBUTTONINFO" },
        0x2cc1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "PHONECAPS" },
        0x2cc5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "PHONEMESSAGE" },
        0x2cc9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "PHONESTATUS" },
        0x2ccd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "PHONECALLBACK" },
        0x2cd1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "PHONEINITIALIZEEXPARAMS" },
        0x2cd5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "PHONEEXTENSIONID" },
        0x2cd9 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "IMessage" },
        0x2cdd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Tapi", .name = "ITnef" },
        0x2ce1 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "IAddrBook" },
        else => null,
    };
}

pub const TAPI_CURRENT_VERSION = 131074;
pub const LINE_ADDRESSSTATE = 0;
pub const LINE_CALLINFO = 1;
pub const LINE_CALLSTATE = 2;
pub const LINE_CLOSE = 3;
pub const LINE_DEVSPECIFIC = 4;
pub const LINE_DEVSPECIFICFEATURE = 5;
pub const LINE_GATHERDIGITS = 6;
pub const LINE_GENERATE = 7;
pub const LINE_LINEDEVSTATE = 8;
pub const LINE_MONITORDIGITS = 9;
pub const LINE_MONITORMEDIA = 10;
pub const LINE_MONITORTONE = 11;
pub const LINE_REPLY = 12;
pub const LINE_REQUEST = 13;
pub const PHONE_BUTTON = 14;
pub const PHONE_CLOSE = 15;
pub const PHONE_DEVSPECIFIC = 16;
pub const PHONE_REPLY = 17;
pub const PHONE_STATE = 18;
pub const LINE_CREATE = 19;
pub const PHONE_CREATE = 20;
pub const LINE_AGENTSPECIFIC = 21;
pub const LINE_AGENTSTATUS = 22;
pub const LINE_APPNEWCALL = 23;
pub const LINE_PROXYREQUEST = 24;
pub const LINE_REMOVE = 25;
pub const PHONE_REMOVE = 26;
pub const LINE_AGENTSESSIONSTATUS = 27;
pub const LINE_QUEUESTATUS = 28;
pub const LINE_AGENTSTATUSEX = 29;
pub const LINE_GROUPSTATUS = 30;
pub const LINE_PROXYSTATUS = 31;
pub const LINE_APPNEWCALLHUB = 32;
pub const LINE_CALLHUBCLOSE = 33;
pub const LINE_DEVSPECIFICEX = 34;
pub const INITIALIZE_NEGOTIATION = 4294967295;
pub const LINEADDRCAPFLAGS_FWDNUMRINGS = 1;
pub const LINEADDRCAPFLAGS_PICKUPGROUPID = 2;
pub const LINEADDRCAPFLAGS_SECURE = 4;
pub const LINEADDRCAPFLAGS_BLOCKIDDEFAULT = 8;
pub const LINEADDRCAPFLAGS_BLOCKIDOVERRIDE = 16;
pub const LINEADDRCAPFLAGS_DIALED = 32;
pub const LINEADDRCAPFLAGS_ORIGOFFHOOK = 64;
pub const LINEADDRCAPFLAGS_DESTOFFHOOK = 128;
pub const LINEADDRCAPFLAGS_FWDCONSULT = 256;
pub const LINEADDRCAPFLAGS_SETUPCONFNULL = 512;
pub const LINEADDRCAPFLAGS_AUTORECONNECT = 1024;
pub const LINEADDRCAPFLAGS_COMPLETIONID = 2048;
pub const LINEADDRCAPFLAGS_TRANSFERHELD = 4096;
pub const LINEADDRCAPFLAGS_TRANSFERMAKE = 8192;
pub const LINEADDRCAPFLAGS_CONFERENCEHELD = 16384;
pub const LINEADDRCAPFLAGS_CONFERENCEMAKE = 32768;
pub const LINEADDRCAPFLAGS_PARTIALDIAL = 65536;
pub const LINEADDRCAPFLAGS_FWDSTATUSVALID = 131072;
pub const LINEADDRCAPFLAGS_FWDINTEXTADDR = 262144;
pub const LINEADDRCAPFLAGS_FWDBUSYNAADDR = 524288;
pub const LINEADDRCAPFLAGS_ACCEPTTOALERT = 1048576;
pub const LINEADDRCAPFLAGS_CONFDROP = 2097152;
pub const LINEADDRCAPFLAGS_PICKUPCALLWAIT = 4194304;
pub const LINEADDRCAPFLAGS_PREDICTIVEDIALER = 8388608;
pub const LINEADDRCAPFLAGS_QUEUE = 16777216;
pub const LINEADDRCAPFLAGS_ROUTEPOINT = 33554432;
pub const LINEADDRCAPFLAGS_HOLDMAKESNEW = 67108864;
pub const LINEADDRCAPFLAGS_NOINTERNALCALLS = 134217728;
pub const LINEADDRCAPFLAGS_NOEXTERNALCALLS = 268435456;
pub const LINEADDRCAPFLAGS_SETCALLINGID = 536870912;
pub const LINEADDRCAPFLAGS_ACDGROUP = 1073741824;
pub const LINEADDRCAPFLAGS_NOPSTNADDRESSTRANSLATION = 2147483648;
pub const LINEADDRESSMODE_ADDRESSID = 1;
pub const LINEADDRESSMODE_DIALABLEADDR = 2;
pub const LINEADDRESSSHARING_PRIVATE = 1;
pub const LINEADDRESSSHARING_BRIDGEDEXCL = 2;
pub const LINEADDRESSSHARING_BRIDGEDNEW = 4;
pub const LINEADDRESSSHARING_BRIDGEDSHARED = 8;
pub const LINEADDRESSSHARING_MONITORED = 16;
pub const LINEADDRESSSTATE_OTHER = 1;
pub const LINEADDRESSSTATE_DEVSPECIFIC = 2;
pub const LINEADDRESSSTATE_INUSEZERO = 4;
pub const LINEADDRESSSTATE_INUSEONE = 8;
pub const LINEADDRESSSTATE_INUSEMANY = 16;
pub const LINEADDRESSSTATE_NUMCALLS = 32;
pub const LINEADDRESSSTATE_FORWARD = 64;
pub const LINEADDRESSSTATE_TERMINALS = 128;
pub const LINEADDRESSSTATE_CAPSCHANGE = 256;
pub const LINEADDRESSTYPE_PHONENUMBER = 1;
pub const LINEADDRESSTYPE_SDP = 2;
pub const LINEADDRESSTYPE_EMAILNAME = 4;
pub const LINEADDRESSTYPE_DOMAINNAME = 8;
pub const LINEADDRESSTYPE_IPADDRESS = 16;
pub const LINEADDRFEATURE_FORWARD = 1;
pub const LINEADDRFEATURE_MAKECALL = 2;
pub const LINEADDRFEATURE_PICKUP = 4;
pub const LINEADDRFEATURE_SETMEDIACONTROL = 8;
pub const LINEADDRFEATURE_SETTERMINAL = 16;
pub const LINEADDRFEATURE_SETUPCONF = 32;
pub const LINEADDRFEATURE_UNCOMPLETECALL = 64;
pub const LINEADDRFEATURE_UNPARK = 128;
pub const LINEADDRFEATURE_PICKUPHELD = 256;
pub const LINEADDRFEATURE_PICKUPGROUP = 512;
pub const LINEADDRFEATURE_PICKUPDIRECT = 1024;
pub const LINEADDRFEATURE_PICKUPWAITING = 2048;
pub const LINEADDRFEATURE_FORWARDFWD = 4096;
pub const LINEADDRFEATURE_FORWARDDND = 8192;
pub const LINEAGENTFEATURE_SETAGENTGROUP = 1;
pub const LINEAGENTFEATURE_SETAGENTSTATE = 2;
pub const LINEAGENTFEATURE_SETAGENTACTIVITY = 4;
pub const LINEAGENTFEATURE_AGENTSPECIFIC = 8;
pub const LINEAGENTFEATURE_GETAGENTACTIVITYLIST = 16;
pub const LINEAGENTFEATURE_GETAGENTGROUP = 32;
pub const LINEAGENTSTATE_LOGGEDOFF = 1;
pub const LINEAGENTSTATE_NOTREADY = 2;
pub const LINEAGENTSTATE_READY = 4;
pub const LINEAGENTSTATE_BUSYACD = 8;
pub const LINEAGENTSTATE_BUSYINCOMING = 16;
pub const LINEAGENTSTATE_BUSYOUTBOUND = 32;
pub const LINEAGENTSTATE_BUSYOTHER = 64;
pub const LINEAGENTSTATE_WORKINGAFTERCALL = 128;
pub const LINEAGENTSTATE_UNKNOWN = 256;
pub const LINEAGENTSTATE_UNAVAIL = 512;
pub const LINEAGENTSTATUS_GROUP = 1;
pub const LINEAGENTSTATUS_STATE = 2;
pub const LINEAGENTSTATUS_NEXTSTATE = 4;
pub const LINEAGENTSTATUS_ACTIVITY = 8;
pub const LINEAGENTSTATUS_ACTIVITYLIST = 16;
pub const LINEAGENTSTATUS_GROUPLIST = 32;
pub const LINEAGENTSTATUS_CAPSCHANGE = 64;
pub const LINEAGENTSTATUS_VALIDSTATES = 128;
pub const LINEAGENTSTATUS_VALIDNEXTSTATES = 256;
pub const LINEAGENTSTATEEX_NOTREADY = 1;
pub const LINEAGENTSTATEEX_READY = 2;
pub const LINEAGENTSTATEEX_BUSYACD = 4;
pub const LINEAGENTSTATEEX_BUSYINCOMING = 8;
pub const LINEAGENTSTATEEX_BUSYOUTGOING = 16;
pub const LINEAGENTSTATEEX_UNKNOWN = 32;
pub const LINEAGENTSTATEEX_RELEASED = 64;
pub const LINEAGENTSTATUSEX_NEWAGENT = 1;
pub const LINEAGENTSTATUSEX_STATE = 2;
pub const LINEAGENTSTATUSEX_UPDATEINFO = 4;
pub const LINEAGENTSESSIONSTATE_NOTREADY = 1;
pub const LINEAGENTSESSIONSTATE_READY = 2;
pub const LINEAGENTSESSIONSTATE_BUSYONCALL = 4;
pub const LINEAGENTSESSIONSTATE_BUSYWRAPUP = 8;
pub const LINEAGENTSESSIONSTATE_ENDED = 16;
pub const LINEAGENTSESSIONSTATE_RELEASED = 32;
pub const LINEAGENTSESSIONSTATUS_NEWSESSION = 1;
pub const LINEAGENTSESSIONSTATUS_STATE = 2;
pub const LINEAGENTSESSIONSTATUS_UPDATEINFO = 4;
pub const LINEQUEUESTATUS_UPDATEINFO = 1;
pub const LINEQUEUESTATUS_NEWQUEUE = 2;
pub const LINEQUEUESTATUS_QUEUEREMOVED = 4;
pub const LINEGROUPSTATUS_NEWGROUP = 1;
pub const LINEGROUPSTATUS_GROUPREMOVED = 2;
pub const LINEPROXYSTATUS_OPEN = 1;
pub const LINEPROXYSTATUS_CLOSE = 2;
pub const LINEPROXYSTATUS_ALLOPENFORACD = 4;
pub const LINEANSWERMODE_NONE = 1;
pub const LINEANSWERMODE_DROP = 2;
pub const LINEANSWERMODE_HOLD = 4;
pub const LINEBEARERMODE_VOICE = 1;
pub const LINEBEARERMODE_SPEECH = 2;
pub const LINEBEARERMODE_MULTIUSE = 4;
pub const LINEBEARERMODE_DATA = 8;
pub const LINEBEARERMODE_ALTSPEECHDATA = 16;
pub const LINEBEARERMODE_NONCALLSIGNALING = 32;
pub const LINEBEARERMODE_PASSTHROUGH = 64;
pub const LINEBEARERMODE_RESTRICTEDDATA = 128;
pub const LINEBUSYMODE_STATION = 1;
pub const LINEBUSYMODE_TRUNK = 2;
pub const LINEBUSYMODE_UNKNOWN = 4;
pub const LINEBUSYMODE_UNAVAIL = 8;
pub const LINECALLCOMPLCOND_BUSY = 1;
pub const LINECALLCOMPLCOND_NOANSWER = 2;
pub const LINECALLCOMPLMODE_CAMPON = 1;
pub const LINECALLCOMPLMODE_CALLBACK = 2;
pub const LINECALLCOMPLMODE_INTRUDE = 4;
pub const LINECALLCOMPLMODE_MESSAGE = 8;
pub const LINECALLFEATURE_ACCEPT = 1;
pub const LINECALLFEATURE_ADDTOCONF = 2;
pub const LINECALLFEATURE_ANSWER = 4;
pub const LINECALLFEATURE_BLINDTRANSFER = 8;
pub const LINECALLFEATURE_COMPLETECALL = 16;
pub const LINECALLFEATURE_COMPLETETRANSF = 32;
pub const LINECALLFEATURE_DIAL = 64;
pub const LINECALLFEATURE_DROP = 128;
pub const LINECALLFEATURE_GATHERDIGITS = 256;
pub const LINECALLFEATURE_GENERATEDIGITS = 512;
pub const LINECALLFEATURE_GENERATETONE = 1024;
pub const LINECALLFEATURE_HOLD = 2048;
pub const LINECALLFEATURE_MONITORDIGITS = 4096;
pub const LINECALLFEATURE_MONITORMEDIA = 8192;
pub const LINECALLFEATURE_MONITORTONES = 16384;
pub const LINECALLFEATURE_PARK = 32768;
pub const LINECALLFEATURE_PREPAREADDCONF = 65536;
pub const LINECALLFEATURE_REDIRECT = 131072;
pub const LINECALLFEATURE_REMOVEFROMCONF = 262144;
pub const LINECALLFEATURE_SECURECALL = 524288;
pub const LINECALLFEATURE_SENDUSERUSER = 1048576;
pub const LINECALLFEATURE_SETCALLPARAMS = 2097152;
pub const LINECALLFEATURE_SETMEDIACONTROL = 4194304;
pub const LINECALLFEATURE_SETTERMINAL = 8388608;
pub const LINECALLFEATURE_SETUPCONF = 16777216;
pub const LINECALLFEATURE_SETUPTRANSFER = 33554432;
pub const LINECALLFEATURE_SWAPHOLD = 67108864;
pub const LINECALLFEATURE_UNHOLD = 134217728;
pub const LINECALLFEATURE_RELEASEUSERUSERINFO = 268435456;
pub const LINECALLFEATURE_SETTREATMENT = 536870912;
pub const LINECALLFEATURE_SETQOS = 1073741824;
pub const LINECALLFEATURE_SETCALLDATA = 2147483648;
pub const LINECALLFEATURE2_NOHOLDCONFERENCE = 1;
pub const LINECALLFEATURE2_ONESTEPTRANSFER = 2;
pub const LINECALLFEATURE2_COMPLCAMPON = 4;
pub const LINECALLFEATURE2_COMPLCALLBACK = 8;
pub const LINECALLFEATURE2_COMPLINTRUDE = 16;
pub const LINECALLFEATURE2_COMPLMESSAGE = 32;
pub const LINECALLFEATURE2_TRANSFERNORM = 64;
pub const LINECALLFEATURE2_TRANSFERCONF = 128;
pub const LINECALLFEATURE2_PARKDIRECT = 256;
pub const LINECALLFEATURE2_PARKNONDIRECT = 512;
pub const LINECALLHUBTRACKING_NONE = 0;
pub const LINECALLHUBTRACKING_PROVIDERLEVEL = 1;
pub const LINECALLHUBTRACKING_ALLCALLS = 2;
pub const LINECALLINFOSTATE_OTHER = 1;
pub const LINECALLINFOSTATE_DEVSPECIFIC = 2;
pub const LINECALLINFOSTATE_BEARERMODE = 4;
pub const LINECALLINFOSTATE_RATE = 8;
pub const LINECALLINFOSTATE_MEDIAMODE = 16;
pub const LINECALLINFOSTATE_APPSPECIFIC = 32;
pub const LINECALLINFOSTATE_CALLID = 64;
pub const LINECALLINFOSTATE_RELATEDCALLID = 128;
pub const LINECALLINFOSTATE_ORIGIN = 256;
pub const LINECALLINFOSTATE_REASON = 512;
pub const LINECALLINFOSTATE_COMPLETIONID = 1024;
pub const LINECALLINFOSTATE_NUMOWNERINCR = 2048;
pub const LINECALLINFOSTATE_NUMOWNERDECR = 4096;
pub const LINECALLINFOSTATE_NUMMONITORS = 8192;
pub const LINECALLINFOSTATE_TRUNK = 16384;
pub const LINECALLINFOSTATE_CALLERID = 32768;
pub const LINECALLINFOSTATE_CALLEDID = 65536;
pub const LINECALLINFOSTATE_CONNECTEDID = 131072;
pub const LINECALLINFOSTATE_REDIRECTIONID = 262144;
pub const LINECALLINFOSTATE_REDIRECTINGID = 524288;
pub const LINECALLINFOSTATE_DISPLAY = 1048576;
pub const LINECALLINFOSTATE_USERUSERINFO = 2097152;
pub const LINECALLINFOSTATE_HIGHLEVELCOMP = 4194304;
pub const LINECALLINFOSTATE_LOWLEVELCOMP = 8388608;
pub const LINECALLINFOSTATE_CHARGINGINFO = 16777216;
pub const LINECALLINFOSTATE_TERMINAL = 33554432;
pub const LINECALLINFOSTATE_DIALPARAMS = 67108864;
pub const LINECALLINFOSTATE_MONITORMODES = 134217728;
pub const LINECALLINFOSTATE_TREATMENT = 268435456;
pub const LINECALLINFOSTATE_QOS = 536870912;
pub const LINECALLINFOSTATE_CALLDATA = 1073741824;
pub const LINECALLORIGIN_OUTBOUND = 1;
pub const LINECALLORIGIN_INTERNAL = 2;
pub const LINECALLORIGIN_EXTERNAL = 4;
pub const LINECALLORIGIN_UNKNOWN = 16;
pub const LINECALLORIGIN_UNAVAIL = 32;
pub const LINECALLORIGIN_CONFERENCE = 64;
pub const LINECALLORIGIN_INBOUND = 128;
pub const LINECALLPARAMFLAGS_SECURE = 1;
pub const LINECALLPARAMFLAGS_IDLE = 2;
pub const LINECALLPARAMFLAGS_BLOCKID = 4;
pub const LINECALLPARAMFLAGS_ORIGOFFHOOK = 8;
pub const LINECALLPARAMFLAGS_DESTOFFHOOK = 16;
pub const LINECALLPARAMFLAGS_NOHOLDCONFERENCE = 32;
pub const LINECALLPARAMFLAGS_PREDICTIVEDIAL = 64;
pub const LINECALLPARAMFLAGS_ONESTEPTRANSFER = 128;
pub const LINECALLPARTYID_BLOCKED = 1;
pub const LINECALLPARTYID_OUTOFAREA = 2;
pub const LINECALLPARTYID_NAME = 4;
pub const LINECALLPARTYID_ADDRESS = 8;
pub const LINECALLPARTYID_PARTIAL = 16;
pub const LINECALLPARTYID_UNKNOWN = 32;
pub const LINECALLPARTYID_UNAVAIL = 64;
pub const LINECALLPRIVILEGE_NONE = 1;
pub const LINECALLPRIVILEGE_MONITOR = 2;
pub const LINECALLPRIVILEGE_OWNER = 4;
pub const LINECALLREASON_DIRECT = 1;
pub const LINECALLREASON_FWDBUSY = 2;
pub const LINECALLREASON_FWDNOANSWER = 4;
pub const LINECALLREASON_FWDUNCOND = 8;
pub const LINECALLREASON_PICKUP = 16;
pub const LINECALLREASON_UNPARK = 32;
pub const LINECALLREASON_REDIRECT = 64;
pub const LINECALLREASON_CALLCOMPLETION = 128;
pub const LINECALLREASON_TRANSFER = 256;
pub const LINECALLREASON_REMINDER = 512;
pub const LINECALLREASON_UNKNOWN = 1024;
pub const LINECALLREASON_UNAVAIL = 2048;
pub const LINECALLREASON_INTRUDE = 4096;
pub const LINECALLREASON_PARKED = 8192;
pub const LINECALLREASON_CAMPEDON = 16384;
pub const LINECALLREASON_ROUTEREQUEST = 32768;
pub const LINECALLSELECT_LINE = 1;
pub const LINECALLSELECT_ADDRESS = 2;
pub const LINECALLSELECT_CALL = 4;
pub const LINECALLSELECT_DEVICEID = 8;
pub const LINECALLSELECT_CALLID = 16;
pub const LINECALLSTATE_IDLE = 1;
pub const LINECALLSTATE_OFFERING = 2;
pub const LINECALLSTATE_ACCEPTED = 4;
pub const LINECALLSTATE_DIALTONE = 8;
pub const LINECALLSTATE_DIALING = 16;
pub const LINECALLSTATE_RINGBACK = 32;
pub const LINECALLSTATE_BUSY = 64;
pub const LINECALLSTATE_SPECIALINFO = 128;
pub const LINECALLSTATE_CONNECTED = 256;
pub const LINECALLSTATE_PROCEEDING = 512;
pub const LINECALLSTATE_ONHOLD = 1024;
pub const LINECALLSTATE_CONFERENCED = 2048;
pub const LINECALLSTATE_ONHOLDPENDCONF = 4096;
pub const LINECALLSTATE_ONHOLDPENDTRANSFER = 8192;
pub const LINECALLSTATE_DISCONNECTED = 16384;
pub const LINECALLSTATE_UNKNOWN = 32768;
pub const LINECALLTREATMENT_SILENCE = 1;
pub const LINECALLTREATMENT_RINGBACK = 2;
pub const LINECALLTREATMENT_BUSY = 3;
pub const LINECALLTREATMENT_MUSIC = 4;
pub const LINECARDOPTION_PREDEFINED = 1;
pub const LINECARDOPTION_HIDDEN = 2;
pub const LINECONNECTEDMODE_ACTIVE = 1;
pub const LINECONNECTEDMODE_INACTIVE = 2;
pub const LINECONNECTEDMODE_ACTIVEHELD = 4;
pub const LINECONNECTEDMODE_INACTIVEHELD = 8;
pub const LINECONNECTEDMODE_CONFIRMED = 16;
pub const LINEDEVCAPFLAGS_CROSSADDRCONF = 1;
pub const LINEDEVCAPFLAGS_HIGHLEVCOMP = 2;
pub const LINEDEVCAPFLAGS_LOWLEVCOMP = 4;
pub const LINEDEVCAPFLAGS_MEDIACONTROL = 8;
pub const LINEDEVCAPFLAGS_MULTIPLEADDR = 16;
pub const LINEDEVCAPFLAGS_CLOSEDROP = 32;
pub const LINEDEVCAPFLAGS_DIALBILLING = 64;
pub const LINEDEVCAPFLAGS_DIALQUIET = 128;
pub const LINEDEVCAPFLAGS_DIALDIALTONE = 256;
pub const LINEDEVCAPFLAGS_MSP = 512;
pub const LINEDEVCAPFLAGS_CALLHUB = 1024;
pub const LINEDEVCAPFLAGS_CALLHUBTRACKING = 2048;
pub const LINEDEVCAPFLAGS_PRIVATEOBJECTS = 4096;
pub const LINEDEVCAPFLAGS_LOCAL = 8192;
pub const LINEDEVSTATE_OTHER = 1;
pub const LINEDEVSTATE_RINGING = 2;
pub const LINEDEVSTATE_CONNECTED = 4;
pub const LINEDEVSTATE_DISCONNECTED = 8;
pub const LINEDEVSTATE_MSGWAITON = 16;
pub const LINEDEVSTATE_MSGWAITOFF = 32;
pub const LINEDEVSTATE_INSERVICE = 64;
pub const LINEDEVSTATE_OUTOFSERVICE = 128;
pub const LINEDEVSTATE_MAINTENANCE = 256;
pub const LINEDEVSTATE_OPEN = 512;
pub const LINEDEVSTATE_CLOSE = 1024;
pub const LINEDEVSTATE_NUMCALLS = 2048;
pub const LINEDEVSTATE_NUMCOMPLETIONS = 4096;
pub const LINEDEVSTATE_TERMINALS = 8192;
pub const LINEDEVSTATE_ROAMMODE = 16384;
pub const LINEDEVSTATE_BATTERY = 32768;
pub const LINEDEVSTATE_SIGNAL = 65536;
pub const LINEDEVSTATE_DEVSPECIFIC = 131072;
pub const LINEDEVSTATE_REINIT = 262144;
pub const LINEDEVSTATE_LOCK = 524288;
pub const LINEDEVSTATE_CAPSCHANGE = 1048576;
pub const LINEDEVSTATE_CONFIGCHANGE = 2097152;
pub const LINEDEVSTATE_TRANSLATECHANGE = 4194304;
pub const LINEDEVSTATE_COMPLCANCEL = 8388608;
pub const LINEDEVSTATE_REMOVED = 16777216;
pub const LINEDEVSTATUSFLAGS_CONNECTED = 1;
pub const LINEDEVSTATUSFLAGS_MSGWAIT = 2;
pub const LINEDEVSTATUSFLAGS_INSERVICE = 4;
pub const LINEDEVSTATUSFLAGS_LOCKED = 8;
pub const LINEDIALTONEMODE_NORMAL = 1;
pub const LINEDIALTONEMODE_SPECIAL = 2;
pub const LINEDIALTONEMODE_INTERNAL = 4;
pub const LINEDIALTONEMODE_EXTERNAL = 8;
pub const LINEDIALTONEMODE_UNKNOWN = 16;
pub const LINEDIALTONEMODE_UNAVAIL = 32;
pub const LINEDIGITMODE_PULSE = 1;
pub const LINEDIGITMODE_DTMF = 2;
pub const LINEDIGITMODE_DTMFEND = 4;
pub const LINEDISCONNECTMODE_NORMAL = 1;
pub const LINEDISCONNECTMODE_UNKNOWN = 2;
pub const LINEDISCONNECTMODE_REJECT = 4;
pub const LINEDISCONNECTMODE_PICKUP = 8;
pub const LINEDISCONNECTMODE_FORWARDED = 16;
pub const LINEDISCONNECTMODE_BUSY = 32;
pub const LINEDISCONNECTMODE_NOANSWER = 64;
pub const LINEDISCONNECTMODE_BADADDRESS = 128;
pub const LINEDISCONNECTMODE_UNREACHABLE = 256;
pub const LINEDISCONNECTMODE_CONGESTION = 512;
pub const LINEDISCONNECTMODE_INCOMPATIBLE = 1024;
pub const LINEDISCONNECTMODE_UNAVAIL = 2048;
pub const LINEDISCONNECTMODE_NODIALTONE = 4096;
pub const LINEDISCONNECTMODE_NUMBERCHANGED = 8192;
pub const LINEDISCONNECTMODE_OUTOFORDER = 16384;
pub const LINEDISCONNECTMODE_TEMPFAILURE = 32768;
pub const LINEDISCONNECTMODE_QOSUNAVAIL = 65536;
pub const LINEDISCONNECTMODE_BLOCKED = 131072;
pub const LINEDISCONNECTMODE_DONOTDISTURB = 262144;
pub const LINEDISCONNECTMODE_CANCELLED = 524288;
pub const LINEDISCONNECTMODE_DESTINATIONBARRED = 1048576;
pub const LINEDISCONNECTMODE_FDNRESTRICT = 2097152;
pub const LINEERR_ALLOCATED = 2147483649;
pub const LINEERR_BADDEVICEID = 2147483650;
pub const LINEERR_BEARERMODEUNAVAIL = 2147483651;
pub const LINEERR_CALLUNAVAIL = 2147483653;
pub const LINEERR_COMPLETIONOVERRUN = 2147483654;
pub const LINEERR_CONFERENCEFULL = 2147483655;
pub const LINEERR_DIALBILLING = 2147483656;
pub const LINEERR_DIALDIALTONE = 2147483657;
pub const LINEERR_DIALPROMPT = 2147483658;
pub const LINEERR_DIALQUIET = 2147483659;
pub const LINEERR_INCOMPATIBLEAPIVERSION = 2147483660;
pub const LINEERR_INCOMPATIBLEEXTVERSION = 2147483661;
pub const LINEERR_INIFILECORRUPT = 2147483662;
pub const LINEERR_INUSE = 2147483663;
pub const LINEERR_INVALADDRESS = 2147483664;
pub const LINEERR_INVALADDRESSID = 2147483665;
pub const LINEERR_INVALADDRESSMODE = 2147483666;
pub const LINEERR_INVALADDRESSSTATE = 2147483667;
pub const LINEERR_INVALAPPHANDLE = 2147483668;
pub const LINEERR_INVALAPPNAME = 2147483669;
pub const LINEERR_INVALBEARERMODE = 2147483670;
pub const LINEERR_INVALCALLCOMPLMODE = 2147483671;
pub const LINEERR_INVALCALLHANDLE = 2147483672;
pub const LINEERR_INVALCALLPARAMS = 2147483673;
pub const LINEERR_INVALCALLPRIVILEGE = 2147483674;
pub const LINEERR_INVALCALLSELECT = 2147483675;
pub const LINEERR_INVALCALLSTATE = 2147483676;
pub const LINEERR_INVALCALLSTATELIST = 2147483677;
pub const LINEERR_INVALCARD = 2147483678;
pub const LINEERR_INVALCOMPLETIONID = 2147483679;
pub const LINEERR_INVALCONFCALLHANDLE = 2147483680;
pub const LINEERR_INVALCONSULTCALLHANDLE = 2147483681;
pub const LINEERR_INVALCOUNTRYCODE = 2147483682;
pub const LINEERR_INVALDEVICECLASS = 2147483683;
pub const LINEERR_INVALDEVICEHANDLE = 2147483684;
pub const LINEERR_INVALDIALPARAMS = 2147483685;
pub const LINEERR_INVALDIGITLIST = 2147483686;
pub const LINEERR_INVALDIGITMODE = 2147483687;
pub const LINEERR_INVALDIGITS = 2147483688;
pub const LINEERR_INVALEXTVERSION = 2147483689;
pub const LINEERR_INVALGROUPID = 2147483690;
pub const LINEERR_INVALLINEHANDLE = 2147483691;
pub const LINEERR_INVALLINESTATE = 2147483692;
pub const LINEERR_INVALLOCATION = 2147483693;
pub const LINEERR_INVALMEDIALIST = 2147483694;
pub const LINEERR_INVALMEDIAMODE = 2147483695;
pub const LINEERR_INVALMESSAGEID = 2147483696;
pub const LINEERR_INVALPARAM = 2147483698;
pub const LINEERR_INVALPARKID = 2147483699;
pub const LINEERR_INVALPARKMODE = 2147483700;
pub const LINEERR_INVALPOINTER = 2147483701;
pub const LINEERR_INVALPRIVSELECT = 2147483702;
pub const LINEERR_INVALRATE = 2147483703;
pub const LINEERR_INVALREQUESTMODE = 2147483704;
pub const LINEERR_INVALTERMINALID = 2147483705;
pub const LINEERR_INVALTERMINALMODE = 2147483706;
pub const LINEERR_INVALTIMEOUT = 2147483707;
pub const LINEERR_INVALTONE = 2147483708;
pub const LINEERR_INVALTONELIST = 2147483709;
pub const LINEERR_INVALTONEMODE = 2147483710;
pub const LINEERR_INVALTRANSFERMODE = 2147483711;
pub const LINEERR_LINEMAPPERFAILED = 2147483712;
pub const LINEERR_NOCONFERENCE = 2147483713;
pub const LINEERR_NODEVICE = 2147483714;
pub const LINEERR_NODRIVER = 2147483715;
pub const LINEERR_NOMEM = 2147483716;
pub const LINEERR_NOREQUEST = 2147483717;
pub const LINEERR_NOTOWNER = 2147483718;
pub const LINEERR_NOTREGISTERED = 2147483719;
pub const LINEERR_OPERATIONFAILED = 2147483720;
pub const LINEERR_OPERATIONUNAVAIL = 2147483721;
pub const LINEERR_RATEUNAVAIL = 2147483722;
pub const LINEERR_RESOURCEUNAVAIL = 2147483723;
pub const LINEERR_REQUESTOVERRUN = 2147483724;
pub const LINEERR_STRUCTURETOOSMALL = 2147483725;
pub const LINEERR_TARGETNOTFOUND = 2147483726;
pub const LINEERR_TARGETSELF = 2147483727;
pub const LINEERR_UNINITIALIZED = 2147483728;
pub const LINEERR_USERUSERINFOTOOBIG = 2147483729;
pub const LINEERR_REINIT = 2147483730;
pub const LINEERR_ADDRESSBLOCKED = 2147483731;
pub const LINEERR_BILLINGREJECTED = 2147483732;
pub const LINEERR_INVALFEATURE = 2147483733;
pub const LINEERR_NOMULTIPLEINSTANCE = 2147483734;
pub const LINEERR_INVALAGENTID = 2147483735;
pub const LINEERR_INVALAGENTGROUP = 2147483736;
pub const LINEERR_INVALPASSWORD = 2147483737;
pub const LINEERR_INVALAGENTSTATE = 2147483738;
pub const LINEERR_INVALAGENTACTIVITY = 2147483739;
pub const LINEERR_DIALVOICEDETECT = 2147483740;
pub const LINEERR_USERCANCELLED = 2147483741;
pub const LINEERR_INVALADDRESSTYPE = 2147483742;
pub const LINEERR_INVALAGENTSESSIONSTATE = 2147483743;
pub const LINEERR_DISCONNECTED = 2147483744;
pub const LINEERR_SERVICE_NOT_RUNNING = 2147483745;
pub const LINEFEATURE_DEVSPECIFIC = 1;
pub const LINEFEATURE_DEVSPECIFICFEAT = 2;
pub const LINEFEATURE_FORWARD = 4;
pub const LINEFEATURE_MAKECALL = 8;
pub const LINEFEATURE_SETMEDIACONTROL = 16;
pub const LINEFEATURE_SETTERMINAL = 32;
pub const LINEFEATURE_SETDEVSTATUS = 64;
pub const LINEFEATURE_FORWARDFWD = 128;
pub const LINEFEATURE_FORWARDDND = 256;
pub const LINEFORWARDMODE_UNCOND = 1;
pub const LINEFORWARDMODE_UNCONDINTERNAL = 2;
pub const LINEFORWARDMODE_UNCONDEXTERNAL = 4;
pub const LINEFORWARDMODE_UNCONDSPECIFIC = 8;
pub const LINEFORWARDMODE_BUSY = 16;
pub const LINEFORWARDMODE_BUSYINTERNAL = 32;
pub const LINEFORWARDMODE_BUSYEXTERNAL = 64;
pub const LINEFORWARDMODE_BUSYSPECIFIC = 128;
pub const LINEFORWARDMODE_NOANSW = 256;
pub const LINEFORWARDMODE_NOANSWINTERNAL = 512;
pub const LINEFORWARDMODE_NOANSWEXTERNAL = 1024;
pub const LINEFORWARDMODE_NOANSWSPECIFIC = 2048;
pub const LINEFORWARDMODE_BUSYNA = 4096;
pub const LINEFORWARDMODE_BUSYNAINTERNAL = 8192;
pub const LINEFORWARDMODE_BUSYNAEXTERNAL = 16384;
pub const LINEFORWARDMODE_BUSYNASPECIFIC = 32768;
pub const LINEFORWARDMODE_UNKNOWN = 65536;
pub const LINEFORWARDMODE_UNAVAIL = 131072;
pub const LINEGATHERTERM_BUFFERFULL = 1;
pub const LINEGATHERTERM_TERMDIGIT = 2;
pub const LINEGATHERTERM_FIRSTTIMEOUT = 4;
pub const LINEGATHERTERM_INTERTIMEOUT = 8;
pub const LINEGATHERTERM_CANCEL = 16;
pub const LINEGENERATETERM_DONE = 1;
pub const LINEGENERATETERM_CANCEL = 2;
pub const LINEINITIALIZEEXOPTION_USEHIDDENWINDOW = 1;
pub const LINEINITIALIZEEXOPTION_USEEVENT = 2;
pub const LINEINITIALIZEEXOPTION_USECOMPLETIONPORT = 3;
pub const LINEINITIALIZEEXOPTION_CALLHUBTRACKING = 2147483648;
pub const LINELOCATIONOPTION_PULSEDIAL = 1;
pub const LINEMAPPER = 4294967295;
pub const LINEMEDIACONTROL_NONE = 1;
pub const LINEMEDIACONTROL_START = 2;
pub const LINEMEDIACONTROL_RESET = 4;
pub const LINEMEDIACONTROL_PAUSE = 8;
pub const LINEMEDIACONTROL_RESUME = 16;
pub const LINEMEDIACONTROL_RATEUP = 32;
pub const LINEMEDIACONTROL_RATEDOWN = 64;
pub const LINEMEDIACONTROL_RATENORMAL = 128;
pub const LINEMEDIACONTROL_VOLUMEUP = 256;
pub const LINEMEDIACONTROL_VOLUMEDOWN = 512;
pub const LINEMEDIACONTROL_VOLUMENORMAL = 1024;
pub const LINEMEDIAMODE_UNKNOWN = 2;
pub const LINEMEDIAMODE_INTERACTIVEVOICE = 4;
pub const LINEMEDIAMODE_AUTOMATEDVOICE = 8;
pub const LINEMEDIAMODE_DATAMODEM = 16;
pub const LINEMEDIAMODE_G3FAX = 32;
pub const LINEMEDIAMODE_TDD = 64;
pub const LINEMEDIAMODE_G4FAX = 128;
pub const LINEMEDIAMODE_DIGITALDATA = 256;
pub const LINEMEDIAMODE_TELETEX = 512;
pub const LINEMEDIAMODE_VIDEOTEX = 1024;
pub const LINEMEDIAMODE_TELEX = 2048;
pub const LINEMEDIAMODE_MIXED = 4096;
pub const LINEMEDIAMODE_ADSI = 8192;
pub const LINEMEDIAMODE_VOICEVIEW = 16384;
pub const LINEMEDIAMODE_VIDEO = 32768;
pub const LAST_LINEMEDIAMODE = 32768;
pub const LINEOFFERINGMODE_ACTIVE = 1;
pub const LINEOFFERINGMODE_INACTIVE = 2;
pub const LINEOPENOPTION_SINGLEADDRESS = 2147483648;
pub const LINEOPENOPTION_PROXY = 1073741824;
pub const LINEPARKMODE_DIRECTED = 1;
pub const LINEPARKMODE_NONDIRECTED = 2;
pub const LINEPROXYREQUEST_SETAGENTGROUP = 1;
pub const LINEPROXYREQUEST_SETAGENTSTATE = 2;
pub const LINEPROXYREQUEST_SETAGENTACTIVITY = 3;
pub const LINEPROXYREQUEST_GETAGENTCAPS = 4;
pub const LINEPROXYREQUEST_GETAGENTSTATUS = 5;
pub const LINEPROXYREQUEST_AGENTSPECIFIC = 6;
pub const LINEPROXYREQUEST_GETAGENTACTIVITYLIST = 7;
pub const LINEPROXYREQUEST_GETAGENTGROUPLIST = 8;
pub const LINEPROXYREQUEST_CREATEAGENT = 9;
pub const LINEPROXYREQUEST_SETAGENTMEASUREMENTPERIOD = 10;
pub const LINEPROXYREQUEST_GETAGENTINFO = 11;
pub const LINEPROXYREQUEST_CREATEAGENTSESSION = 12;
pub const LINEPROXYREQUEST_GETAGENTSESSIONLIST = 13;
pub const LINEPROXYREQUEST_SETAGENTSESSIONSTATE = 14;
pub const LINEPROXYREQUEST_GETAGENTSESSIONINFO = 15;
pub const LINEPROXYREQUEST_GETQUEUELIST = 16;
pub const LINEPROXYREQUEST_SETQUEUEMEASUREMENTPERIOD = 17;
pub const LINEPROXYREQUEST_GETQUEUEINFO = 18;
pub const LINEPROXYREQUEST_GETGROUPLIST = 19;
pub const LINEPROXYREQUEST_SETAGENTSTATEEX = 20;
pub const LINEREMOVEFROMCONF_NONE = 1;
pub const LINEREMOVEFROMCONF_LAST = 2;
pub const LINEREMOVEFROMCONF_ANY = 3;
pub const LINEREQUESTMODE_MAKECALL = 1;
pub const LINEREQUESTMODE_MEDIACALL = 2;
pub const LINEREQUESTMODE_DROP = 4;
pub const LAST_LINEREQUESTMODE = 2;
pub const LINEROAMMODE_UNKNOWN = 1;
pub const LINEROAMMODE_UNAVAIL = 2;
pub const LINEROAMMODE_HOME = 4;
pub const LINEROAMMODE_ROAMA = 8;
pub const LINEROAMMODE_ROAMB = 16;
pub const LINESPECIALINFO_NOCIRCUIT = 1;
pub const LINESPECIALINFO_CUSTIRREG = 2;
pub const LINESPECIALINFO_REORDER = 4;
pub const LINESPECIALINFO_UNKNOWN = 8;
pub const LINESPECIALINFO_UNAVAIL = 16;
pub const LINETERMDEV_PHONE = 1;
pub const LINETERMDEV_HEADSET = 2;
pub const LINETERMDEV_SPEAKER = 4;
pub const LINETERMMODE_BUTTONS = 1;
pub const LINETERMMODE_LAMPS = 2;
pub const LINETERMMODE_DISPLAY = 4;
pub const LINETERMMODE_RINGER = 8;
pub const LINETERMMODE_HOOKSWITCH = 16;
pub const LINETERMMODE_MEDIATOLINE = 32;
pub const LINETERMMODE_MEDIAFROMLINE = 64;
pub const LINETERMMODE_MEDIABIDIRECT = 128;
pub const LINETERMSHARING_PRIVATE = 1;
pub const LINETERMSHARING_SHAREDEXCL = 2;
pub const LINETERMSHARING_SHAREDCONF = 4;
pub const LINETOLLLISTOPTION_ADD = 1;
pub const LINETOLLLISTOPTION_REMOVE = 2;
pub const LINETONEMODE_CUSTOM = 1;
pub const LINETONEMODE_RINGBACK = 2;
pub const LINETONEMODE_BUSY = 4;
pub const LINETONEMODE_BEEP = 8;
pub const LINETONEMODE_BILLING = 16;
pub const LINETRANSFERMODE_TRANSFER = 1;
pub const LINETRANSFERMODE_CONFERENCE = 2;
pub const LINETRANSLATEOPTION_CARDOVERRIDE = 1;
pub const LINETRANSLATEOPTION_CANCELCALLWAITING = 2;
pub const LINETRANSLATEOPTION_FORCELOCAL = 4;
pub const LINETRANSLATEOPTION_FORCELD = 8;
pub const LINETRANSLATERESULT_CANONICAL = 1;
pub const LINETRANSLATERESULT_INTERNATIONAL = 2;
pub const LINETRANSLATERESULT_LONGDISTANCE = 4;
pub const LINETRANSLATERESULT_LOCAL = 8;
pub const LINETRANSLATERESULT_INTOLLLIST = 16;
pub const LINETRANSLATERESULT_NOTINTOLLLIST = 32;
pub const LINETRANSLATERESULT_DIALBILLING = 64;
pub const LINETRANSLATERESULT_DIALQUIET = 128;
pub const LINETRANSLATERESULT_DIALDIALTONE = 256;
pub const LINETRANSLATERESULT_DIALPROMPT = 512;
pub const LINETRANSLATERESULT_VOICEDETECT = 1024;
pub const LINETRANSLATERESULT_NOTRANSLATION = 2048;
pub const PHONEBUTTONFUNCTION_UNKNOWN = 0;
pub const PHONEBUTTONFUNCTION_CONFERENCE = 1;
pub const PHONEBUTTONFUNCTION_TRANSFER = 2;
pub const PHONEBUTTONFUNCTION_DROP = 3;
pub const PHONEBUTTONFUNCTION_HOLD = 4;
pub const PHONEBUTTONFUNCTION_RECALL = 5;
pub const PHONEBUTTONFUNCTION_DISCONNECT = 6;
pub const PHONEBUTTONFUNCTION_CONNECT = 7;
pub const PHONEBUTTONFUNCTION_MSGWAITON = 8;
pub const PHONEBUTTONFUNCTION_MSGWAITOFF = 9;
pub const PHONEBUTTONFUNCTION_SELECTRING = 10;
pub const PHONEBUTTONFUNCTION_ABBREVDIAL = 11;
pub const PHONEBUTTONFUNCTION_FORWARD = 12;
pub const PHONEBUTTONFUNCTION_PICKUP = 13;
pub const PHONEBUTTONFUNCTION_RINGAGAIN = 14;
pub const PHONEBUTTONFUNCTION_PARK = 15;
pub const PHONEBUTTONFUNCTION_REJECT = 16;
pub const PHONEBUTTONFUNCTION_REDIRECT = 17;
pub const PHONEBUTTONFUNCTION_MUTE = 18;
pub const PHONEBUTTONFUNCTION_VOLUMEUP = 19;
pub const PHONEBUTTONFUNCTION_VOLUMEDOWN = 20;
pub const PHONEBUTTONFUNCTION_SPEAKERON = 21;
pub const PHONEBUTTONFUNCTION_SPEAKEROFF = 22;
pub const PHONEBUTTONFUNCTION_FLASH = 23;
pub const PHONEBUTTONFUNCTION_DATAON = 24;
pub const PHONEBUTTONFUNCTION_DATAOFF = 25;
pub const PHONEBUTTONFUNCTION_DONOTDISTURB = 26;
pub const PHONEBUTTONFUNCTION_INTERCOM = 27;
pub const PHONEBUTTONFUNCTION_BRIDGEDAPP = 28;
pub const PHONEBUTTONFUNCTION_BUSY = 29;
pub const PHONEBUTTONFUNCTION_CALLAPP = 30;
pub const PHONEBUTTONFUNCTION_DATETIME = 31;
pub const PHONEBUTTONFUNCTION_DIRECTORY = 32;
pub const PHONEBUTTONFUNCTION_COVER = 33;
pub const PHONEBUTTONFUNCTION_CALLID = 34;
pub const PHONEBUTTONFUNCTION_LASTNUM = 35;
pub const PHONEBUTTONFUNCTION_NIGHTSRV = 36;
pub const PHONEBUTTONFUNCTION_SENDCALLS = 37;
pub const PHONEBUTTONFUNCTION_MSGINDICATOR = 38;
pub const PHONEBUTTONFUNCTION_REPDIAL = 39;
pub const PHONEBUTTONFUNCTION_SETREPDIAL = 40;
pub const PHONEBUTTONFUNCTION_SYSTEMSPEED = 41;
pub const PHONEBUTTONFUNCTION_STATIONSPEED = 42;
pub const PHONEBUTTONFUNCTION_CAMPON = 43;
pub const PHONEBUTTONFUNCTION_SAVEREPEAT = 44;
pub const PHONEBUTTONFUNCTION_QUEUECALL = 45;
pub const PHONEBUTTONFUNCTION_NONE = 46;
pub const PHONEBUTTONFUNCTION_SEND = 47;
pub const PHONEBUTTONMODE_DUMMY = 1;
pub const PHONEBUTTONMODE_CALL = 2;
pub const PHONEBUTTONMODE_FEATURE = 4;
pub const PHONEBUTTONMODE_KEYPAD = 8;
pub const PHONEBUTTONMODE_LOCAL = 16;
pub const PHONEBUTTONMODE_DISPLAY = 32;
pub const PHONEBUTTONSTATE_UP = 1;
pub const PHONEBUTTONSTATE_DOWN = 2;
pub const PHONEBUTTONSTATE_UNKNOWN = 4;
pub const PHONEBUTTONSTATE_UNAVAIL = 8;
pub const PHONEERR_ALLOCATED = 2415919105;
pub const PHONEERR_BADDEVICEID = 2415919106;
pub const PHONEERR_INCOMPATIBLEAPIVERSION = 2415919107;
pub const PHONEERR_INCOMPATIBLEEXTVERSION = 2415919108;
pub const PHONEERR_INIFILECORRUPT = 2415919109;
pub const PHONEERR_INUSE = 2415919110;
pub const PHONEERR_INVALAPPHANDLE = 2415919111;
pub const PHONEERR_INVALAPPNAME = 2415919112;
pub const PHONEERR_INVALBUTTONLAMPID = 2415919113;
pub const PHONEERR_INVALBUTTONMODE = 2415919114;
pub const PHONEERR_INVALBUTTONSTATE = 2415919115;
pub const PHONEERR_INVALDATAID = 2415919116;
pub const PHONEERR_INVALDEVICECLASS = 2415919117;
pub const PHONEERR_INVALEXTVERSION = 2415919118;
pub const PHONEERR_INVALHOOKSWITCHDEV = 2415919119;
pub const PHONEERR_INVALHOOKSWITCHMODE = 2415919120;
pub const PHONEERR_INVALLAMPMODE = 2415919121;
pub const PHONEERR_INVALPARAM = 2415919122;
pub const PHONEERR_INVALPHONEHANDLE = 2415919123;
pub const PHONEERR_INVALPHONESTATE = 2415919124;
pub const PHONEERR_INVALPOINTER = 2415919125;
pub const PHONEERR_INVALPRIVILEGE = 2415919126;
pub const PHONEERR_INVALRINGMODE = 2415919127;
pub const PHONEERR_NODEVICE = 2415919128;
pub const PHONEERR_NODRIVER = 2415919129;
pub const PHONEERR_NOMEM = 2415919130;
pub const PHONEERR_NOTOWNER = 2415919131;
pub const PHONEERR_OPERATIONFAILED = 2415919132;
pub const PHONEERR_OPERATIONUNAVAIL = 2415919133;
pub const PHONEERR_RESOURCEUNAVAIL = 2415919135;
pub const PHONEERR_REQUESTOVERRUN = 2415919136;
pub const PHONEERR_STRUCTURETOOSMALL = 2415919137;
pub const PHONEERR_UNINITIALIZED = 2415919138;
pub const PHONEERR_REINIT = 2415919139;
pub const PHONEERR_DISCONNECTED = 2415919140;
pub const PHONEERR_SERVICE_NOT_RUNNING = 2415919141;
pub const PHONEFEATURE_GETBUTTONINFO = 1;
pub const PHONEFEATURE_GETDATA = 2;
pub const PHONEFEATURE_GETDISPLAY = 4;
pub const PHONEFEATURE_GETGAINHANDSET = 8;
pub const PHONEFEATURE_GETGAINSPEAKER = 16;
pub const PHONEFEATURE_GETGAINHEADSET = 32;
pub const PHONEFEATURE_GETHOOKSWITCHHANDSET = 64;
pub const PHONEFEATURE_GETHOOKSWITCHSPEAKER = 128;
pub const PHONEFEATURE_GETHOOKSWITCHHEADSET = 256;
pub const PHONEFEATURE_GETLAMP = 512;
pub const PHONEFEATURE_GETRING = 1024;
pub const PHONEFEATURE_GETVOLUMEHANDSET = 2048;
pub const PHONEFEATURE_GETVOLUMESPEAKER = 4096;
pub const PHONEFEATURE_GETVOLUMEHEADSET = 8192;
pub const PHONEFEATURE_SETBUTTONINFO = 16384;
pub const PHONEFEATURE_SETDATA = 32768;
pub const PHONEFEATURE_SETDISPLAY = 65536;
pub const PHONEFEATURE_SETGAINHANDSET = 131072;
pub const PHONEFEATURE_SETGAINSPEAKER = 262144;
pub const PHONEFEATURE_SETGAINHEADSET = 524288;
pub const PHONEFEATURE_SETHOOKSWITCHHANDSET = 1048576;
pub const PHONEFEATURE_SETHOOKSWITCHSPEAKER = 2097152;
pub const PHONEFEATURE_SETHOOKSWITCHHEADSET = 4194304;
pub const PHONEFEATURE_SETLAMP = 8388608;
pub const PHONEFEATURE_SETRING = 16777216;
pub const PHONEFEATURE_SETVOLUMEHANDSET = 33554432;
pub const PHONEFEATURE_SETVOLUMESPEAKER = 67108864;
pub const PHONEFEATURE_SETVOLUMEHEADSET = 134217728;
pub const PHONEFEATURE_GENERICPHONE = 268435456;
pub const PHONEHOOKSWITCHDEV_HANDSET = 1;
pub const PHONEHOOKSWITCHDEV_SPEAKER = 2;
pub const PHONEHOOKSWITCHDEV_HEADSET = 4;
pub const PHONEHOOKSWITCHMODE_ONHOOK = 1;
pub const PHONEHOOKSWITCHMODE_MIC = 2;
pub const PHONEHOOKSWITCHMODE_SPEAKER = 4;
pub const PHONEHOOKSWITCHMODE_MICSPEAKER = 8;
pub const PHONEHOOKSWITCHMODE_UNKNOWN = 16;
pub const PHONEINITIALIZEEXOPTION_USEHIDDENWINDOW = 1;
pub const PHONEINITIALIZEEXOPTION_USEEVENT = 2;
pub const PHONEINITIALIZEEXOPTION_USECOMPLETIONPORT = 3;
pub const PHONELAMPMODE_DUMMY = 1;
pub const PHONELAMPMODE_OFF = 2;
pub const PHONELAMPMODE_STEADY = 4;
pub const PHONELAMPMODE_WINK = 8;
pub const PHONELAMPMODE_FLASH = 16;
pub const PHONELAMPMODE_FLUTTER = 32;
pub const PHONELAMPMODE_BROKENFLUTTER = 64;
pub const PHONELAMPMODE_UNKNOWN = 128;
pub const PHONEPRIVILEGE_MONITOR = 1;
pub const PHONEPRIVILEGE_OWNER = 2;
pub const PHONESTATE_OTHER = 1;
pub const PHONESTATE_CONNECTED = 2;
pub const PHONESTATE_DISCONNECTED = 4;
pub const PHONESTATE_OWNER = 8;
pub const PHONESTATE_MONITORS = 16;
pub const PHONESTATE_DISPLAY = 32;
pub const PHONESTATE_LAMP = 64;
pub const PHONESTATE_RINGMODE = 128;
pub const PHONESTATE_RINGVOLUME = 256;
pub const PHONESTATE_HANDSETHOOKSWITCH = 512;
pub const PHONESTATE_HANDSETVOLUME = 1024;
pub const PHONESTATE_HANDSETGAIN = 2048;
pub const PHONESTATE_SPEAKERHOOKSWITCH = 4096;
pub const PHONESTATE_SPEAKERVOLUME = 8192;
pub const PHONESTATE_SPEAKERGAIN = 16384;
pub const PHONESTATE_HEADSETHOOKSWITCH = 32768;
pub const PHONESTATE_HEADSETVOLUME = 65536;
pub const PHONESTATE_HEADSETGAIN = 131072;
pub const PHONESTATE_SUSPEND = 262144;
pub const PHONESTATE_RESUME = 524288;
pub const PHONESTATE_DEVSPECIFIC = 1048576;
pub const PHONESTATE_REINIT = 2097152;
pub const PHONESTATE_CAPSCHANGE = 4194304;
pub const PHONESTATE_REMOVED = 8388608;
pub const PHONESTATUSFLAGS_CONNECTED = 1;
pub const PHONESTATUSFLAGS_SUSPENDED = 2;
pub const STRINGFORMAT_ASCII = 1;
pub const STRINGFORMAT_DBCS = 2;
pub const STRINGFORMAT_UNICODE = 3;
pub const STRINGFORMAT_BINARY = 4;
pub const TAPI_REPLY = 1123;
pub const TAPIERR_CONNECTED = 0;
pub const TAPIERR_DROPPED = -1;
pub const TAPIERR_NOREQUESTRECIPIENT = -2;
pub const TAPIERR_REQUESTQUEUEFULL = -3;
pub const TAPIERR_INVALDESTADDRESS = -4;
pub const TAPIERR_INVALWINDOWHANDLE = -5;
pub const TAPIERR_INVALDEVICECLASS = -6;
pub const TAPIERR_INVALDEVICEID = -7;
pub const TAPIERR_DEVICECLASSUNAVAIL = -8;
pub const TAPIERR_DEVICEIDUNAVAIL = -9;
pub const TAPIERR_DEVICEINUSE = -10;
pub const TAPIERR_DESTBUSY = -11;
pub const TAPIERR_DESTNOANSWER = -12;
pub const TAPIERR_DESTUNAVAIL = -13;
pub const TAPIERR_UNKNOWNWINHANDLE = -14;
pub const TAPIERR_UNKNOWNREQUESTID = -15;
pub const TAPIERR_REQUESTFAILED = -16;
pub const TAPIERR_REQUESTCANCELLED = -17;
pub const TAPIERR_INVALPOINTER = -18;
pub const TAPIERR_NOTADMIN = -19;
pub const TAPIERR_MMCWRITELOCKED = -20;
pub const TAPIERR_PROVIDERALREADYINSTALLED = -21;
pub const TAPIERR_SCP_ALREADY_EXISTS = -22;
pub const TAPIERR_SCP_DOES_NOT_EXIST = -23;
pub const TAPIMAXDESTADDRESSSIZE = 80;
pub const TAPIMAXAPPNAMESIZE = 40;
pub const TAPIMAXCALLEDPARTYSIZE = 40;
pub const TAPIMAXCOMMENTSIZE = 80;
pub const TAPIMAXDEVICECLASSSIZE = 40;
pub const TAPIMAXDEVICEIDSIZE = 40;
pub const INTERFACEMASK = 16711680;
pub const DISPIDMASK = 65535;
pub const IDISPTAPI = 65536;
pub const IDISPTAPICALLCENTER = 131072;
pub const IDISPCALLINFO = 65536;
pub const IDISPBASICCALLCONTROL = 131072;
pub const IDISPLEGACYCALLMEDIACONTROL = 196608;
pub const IDISPAGGREGATEDMSPCALLOBJ = 262144;
pub const IDISPADDRESS = 65536;
pub const IDISPADDRESSCAPABILITIES = 131072;
pub const IDISPMEDIASUPPORT = 196608;
pub const IDISPADDRESSTRANSLATION = 262144;
pub const IDISPLEGACYADDRESSMEDIACONTROL = 327680;
pub const IDISPAGGREGATEDMSPADDRESSOBJ = 393216;
pub const IDISPPHONE = 65536;
pub const IDISPAPC = 131072;
pub const IDISPMULTITRACK = 65536;
pub const IDISPMEDIACONTROL = 131072;
pub const IDISPMEDIARECORD = 196608;
pub const IDISPMEDIAPLAYBACK = 262144;
pub const IDISPFILETRACK = 65536;
pub const TAPIMEDIATYPE_AUDIO = 8;
pub const TAPIMEDIATYPE_VIDEO = 32768;
pub const TAPIMEDIATYPE_DATAMODEM = 16;
pub const TAPIMEDIATYPE_G3FAX = 32;
pub const TAPIMEDIATYPE_MULTITRACK = 65536;
pub const TSPI_MESSAGE_BASE = 500;
pub const LINETSPIOPTION_NONREENTRANT = 1;
pub const TUISPIDLL_OBJECT_LINEID = 1;
pub const TUISPIDLL_OBJECT_PHONEID = 2;
pub const TUISPIDLL_OBJECT_PROVIDERID = 3;
pub const TUISPIDLL_OBJECT_DIALOGINSTANCE = 4;
pub const PRIVATEOBJECT_NONE = 1;
pub const PRIVATEOBJECT_CALLID = 2;
pub const PRIVATEOBJECT_LINE = 3;
pub const PRIVATEOBJECT_CALL = 4;
pub const PRIVATEOBJECT_PHONE = 5;
pub const PRIVATEOBJECT_ADDRESS = 6;
pub const LINEQOSREQUESTTYPE_SERVICELEVEL = 1;
pub const LINEQOSSERVICELEVEL_NEEDED = 1;
pub const LINEQOSSERVICELEVEL_IFAVAILABLE = 2;
pub const LINEQOSSERVICELEVEL_BESTEFFORT = 3;
pub const LINEEQOSINFO_NOQOS = 1;
pub const LINEEQOSINFO_ADMISSIONFAILURE = 2;
pub const LINEEQOSINFO_POLICYFAILURE = 3;
pub const LINEEQOSINFO_GENERICERROR = 4;
pub const TSPI_PROC_BASE = 500;
pub const TSPI_LINEACCEPT = 500;
pub const TSPI_LINEADDTOCONFERENCE = 501;
pub const TSPI_LINEANSWER = 502;
pub const TSPI_LINEBLINDTRANSFER = 503;
pub const TSPI_LINECLOSE = 504;
pub const TSPI_LINECLOSECALL = 505;
pub const TSPI_LINECOMPLETECALL = 506;
pub const TSPI_LINECOMPLETETRANSFER = 507;
pub const TSPI_LINECONDITIONALMEDIADETECTION = 508;
pub const TSPI_LINECONFIGDIALOG = 509;
pub const TSPI_LINEDEVSPECIFIC = 510;
pub const TSPI_LINEDEVSPECIFICFEATURE = 511;
pub const TSPI_LINEDIAL = 512;
pub const TSPI_LINEDROP = 513;
pub const TSPI_LINEFORWARD = 514;
pub const TSPI_LINEGATHERDIGITS = 515;
pub const TSPI_LINEGENERATEDIGITS = 516;
pub const TSPI_LINEGENERATETONE = 517;
pub const TSPI_LINEGETADDRESSCAPS = 518;
pub const TSPI_LINEGETADDRESSID = 519;
pub const TSPI_LINEGETADDRESSSTATUS = 520;
pub const TSPI_LINEGETCALLADDRESSID = 521;
pub const TSPI_LINEGETCALLINFO = 522;
pub const TSPI_LINEGETCALLSTATUS = 523;
pub const TSPI_LINEGETDEVCAPS = 524;
pub const TSPI_LINEGETDEVCONFIG = 525;
pub const TSPI_LINEGETEXTENSIONID = 526;
pub const TSPI_LINEGETICON = 527;
pub const TSPI_LINEGETID = 528;
pub const TSPI_LINEGETLINEDEVSTATUS = 529;
pub const TSPI_LINEGETNUMADDRESSIDS = 530;
pub const TSPI_LINEHOLD = 531;
pub const TSPI_LINEMAKECALL = 532;
pub const TSPI_LINEMONITORDIGITS = 533;
pub const TSPI_LINEMONITORMEDIA = 534;
pub const TSPI_LINEMONITORTONES = 535;
pub const TSPI_LINENEGOTIATEEXTVERSION = 536;
pub const TSPI_LINENEGOTIATETSPIVERSION = 537;
pub const TSPI_LINEOPEN = 538;
pub const TSPI_LINEPARK = 539;
pub const TSPI_LINEPICKUP = 540;
pub const TSPI_LINEPREPAREADDTOCONFERENCE = 541;
pub const TSPI_LINEREDIRECT = 542;
pub const TSPI_LINEREMOVEFROMCONFERENCE = 543;
pub const TSPI_LINESECURECALL = 544;
pub const TSPI_LINESELECTEXTVERSION = 545;
pub const TSPI_LINESENDUSERUSERINFO = 546;
pub const TSPI_LINESETAPPSPECIFIC = 547;
pub const TSPI_LINESETCALLPARAMS = 548;
pub const TSPI_LINESETDEFAULTMEDIADETECTION = 549;
pub const TSPI_LINESETDEVCONFIG = 550;
pub const TSPI_LINESETMEDIACONTROL = 551;
pub const TSPI_LINESETMEDIAMODE = 552;
pub const TSPI_LINESETSTATUSMESSAGES = 553;
pub const TSPI_LINESETTERMINAL = 554;
pub const TSPI_LINESETUPCONFERENCE = 555;
pub const TSPI_LINESETUPTRANSFER = 556;
pub const TSPI_LINESWAPHOLD = 557;
pub const TSPI_LINEUNCOMPLETECALL = 558;
pub const TSPI_LINEUNHOLD = 559;
pub const TSPI_LINEUNPARK = 560;
pub const TSPI_PHONECLOSE = 561;
pub const TSPI_PHONECONFIGDIALOG = 562;
pub const TSPI_PHONEDEVSPECIFIC = 563;
pub const TSPI_PHONEGETBUTTONINFO = 564;
pub const TSPI_PHONEGETDATA = 565;
pub const TSPI_PHONEGETDEVCAPS = 566;
pub const TSPI_PHONEGETDISPLAY = 567;
pub const TSPI_PHONEGETEXTENSIONID = 568;
pub const TSPI_PHONEGETGAIN = 569;
pub const TSPI_PHONEGETHOOKSWITCH = 570;
pub const TSPI_PHONEGETICON = 571;
pub const TSPI_PHONEGETID = 572;
pub const TSPI_PHONEGETLAMP = 573;
pub const TSPI_PHONEGETRING = 574;
pub const TSPI_PHONEGETSTATUS = 575;
pub const TSPI_PHONEGETVOLUME = 576;
pub const TSPI_PHONENEGOTIATEEXTVERSION = 577;
pub const TSPI_PHONENEGOTIATETSPIVERSION = 578;
pub const TSPI_PHONEOPEN = 579;
pub const TSPI_PHONESELECTEXTVERSION = 580;
pub const TSPI_PHONESETBUTTONINFO = 581;
pub const TSPI_PHONESETDATA = 582;
pub const TSPI_PHONESETDISPLAY = 583;
pub const TSPI_PHONESETGAIN = 584;
pub const TSPI_PHONESETHOOKSWITCH = 585;
pub const TSPI_PHONESETLAMP = 586;
pub const TSPI_PHONESETRING = 587;
pub const TSPI_PHONESETSTATUSMESSAGES = 588;
pub const TSPI_PHONESETVOLUME = 589;
pub const TSPI_PROVIDERCONFIG = 590;
pub const TSPI_PROVIDERINIT = 591;
pub const TSPI_PROVIDERINSTALL = 592;
pub const TSPI_PROVIDERREMOVE = 593;
pub const TSPI_PROVIDERSHUTDOWN = 594;
pub const TSPI_PROVIDERENUMDEVICES = 595;
pub const TSPI_LINEDROPONCLOSE = 596;
pub const TSPI_LINEDROPNOOWNER = 597;
pub const TSPI_PROVIDERCREATELINEDEVICE = 598;
pub const TSPI_PROVIDERCREATEPHONEDEVICE = 599;
pub const TSPI_LINESETCURRENTLOCATION = 600;
pub const TSPI_LINECONFIGDIALOGEDIT = 601;
pub const TSPI_LINERELEASEUSERUSERINFO = 602;
pub const TSPI_LINEGETCALLID = 603;
pub const TSPI_LINEGETCALLHUBTRACKING = 604;
pub const TSPI_LINESETCALLHUBTRACKING = 605;
pub const TSPI_LINERECEIVEMSPDATA = 606;
pub const TSPI_LINEMSPIDENTIFY = 607;
pub const TSPI_LINECREATEMSPINSTANCE = 608;
pub const TSPI_LINECLOSEMSPINSTANCE = 609;
pub const IDISPDIROBJECT = 65536;
pub const IDISPDIROBJCONFERENCE = 131072;
pub const IDISPDIROBJUSER = 196608;
pub const IDISPDIRECTORY = 65536;
pub const IDISPILSCONFIG = 131072;
pub const RENDBIND_AUTHENTICATE = 1;
pub const RENDBIND_DEFAULTDOMAINNAME = 2;
pub const RENDBIND_DEFAULTUSERNAME = 4;
pub const RENDBIND_DEFAULTPASSWORD = 8;
pub const RENDBIND_DEFAULTCREDENTIALS = 14;
pub const STRM_INITIAL = 0;
pub const STRM_TERMINALSELECTED = 1;
pub const STRM_CONFIGURED = 2;
pub const STRM_RUNNING = 4;
pub const STRM_PAUSED = 8;
pub const STRM_STOPPED = 16;
pub const TAPI_E_NOTENOUGHMEMORY = -2147221503;
pub const TAPI_E_NOITEMS = -2147221502;
pub const TAPI_E_NOTSUPPORTED = -2147221501;
pub const TAPI_E_INVALIDMEDIATYPE = -2147221500;
pub const TAPI_E_OPERATIONFAILED = -2147221499;
pub const TAPI_E_ALLOCATED = -2147221498;
pub const TAPI_E_CALLUNAVAIL = -2147221497;
pub const TAPI_E_COMPLETIONOVERRUN = -2147221496;
pub const TAPI_E_CONFERENCEFULL = -2147221495;
pub const TAPI_E_DIALMODIFIERNOTSUPPORTED = -2147221494;
pub const TAPI_E_INUSE = -2147221493;
pub const TAPI_E_INVALADDRESS = -2147221492;
pub const TAPI_E_INVALADDRESSSTATE = -2147221491;
pub const TAPI_E_INVALCALLPARAMS = -2147221490;
pub const TAPI_E_INVALCALLPRIVILEGE = -2147221489;
pub const TAPI_E_INVALCALLSTATE = -2147221488;
pub const TAPI_E_INVALCARD = -2147221487;
pub const TAPI_E_INVALCOMPLETIONID = -2147221486;
pub const TAPI_E_INVALCOUNTRYCODE = -2147221485;
pub const TAPI_E_INVALDEVICECLASS = -2147221484;
pub const TAPI_E_INVALDIALPARAMS = -2147221483;
pub const TAPI_E_INVALDIGITS = -2147221482;
pub const TAPI_E_INVALGROUPID = -2147221481;
pub const TAPI_E_INVALLOCATION = -2147221480;
pub const TAPI_E_INVALMESSAGEID = -2147221479;
pub const TAPI_E_INVALPARKID = -2147221478;
pub const TAPI_E_INVALRATE = -2147221477;
pub const TAPI_E_INVALTIMEOUT = -2147221476;
pub const TAPI_E_INVALTONE = -2147221475;
pub const TAPI_E_INVALLIST = -2147221474;
pub const TAPI_E_INVALMODE = -2147221473;
pub const TAPI_E_NOCONFERENCE = -2147221472;
pub const TAPI_E_NODEVICE = -2147221471;
pub const TAPI_E_NOREQUEST = -2147221470;
pub const TAPI_E_NOTOWNER = -2147221469;
pub const TAPI_E_NOTREGISTERED = -2147221468;
pub const TAPI_E_REQUESTOVERRUN = -2147221467;
pub const TAPI_E_TARGETNOTFOUND = -2147221466;
pub const TAPI_E_TARGETSELF = -2147221465;
pub const TAPI_E_USERUSERINFOTOOBIG = -2147221464;
pub const TAPI_E_REINIT = -2147221463;
pub const TAPI_E_ADDRESSBLOCKED = -2147221462;
pub const TAPI_E_BILLINGREJECTED = -2147221461;
pub const TAPI_E_INVALFEATURE = -2147221460;
pub const TAPI_E_INVALBUTTONLAMPID = -2147221459;
pub const TAPI_E_INVALBUTTONSTATE = -2147221458;
pub const TAPI_E_INVALDATAID = -2147221457;
pub const TAPI_E_INVALHOOKSWITCHDEV = -2147221456;
pub const TAPI_E_DROPPED = -2147221455;
pub const TAPI_E_NOREQUESTRECIPIENT = -2147221454;
pub const TAPI_E_REQUESTQUEUEFULL = -2147221453;
pub const TAPI_E_DESTBUSY = -2147221452;
pub const TAPI_E_DESTNOANSWER = -2147221451;
pub const TAPI_E_DESTUNAVAIL = -2147221450;
pub const TAPI_E_REQUESTFAILED = -2147221449;
pub const TAPI_E_REQUESTCANCELLED = -2147221448;
pub const TAPI_E_INVALPRIVILEGE = -2147221447;
pub const TAPI_E_INVALIDDIRECTION = -2147221446;
pub const TAPI_E_INVALIDTERMINAL = -2147221445;
pub const TAPI_E_INVALIDTERMINALCLASS = -2147221444;
pub const TAPI_E_NODRIVER = -2147221443;
pub const TAPI_E_MAXSTREAMS = -2147221442;
pub const TAPI_E_NOTERMINALSELECTED = -2147221441;
pub const TAPI_E_TERMINALINUSE = -2147221440;
pub const TAPI_E_NOTSTOPPED = -2147221439;
pub const TAPI_E_MAXTERMINALS = -2147221438;
pub const TAPI_E_INVALIDSTREAM = -2147221437;
pub const TAPI_E_TIMEOUT = -2147221436;
pub const TAPI_E_CALLCENTER_GROUP_REMOVED = -2147221435;
pub const TAPI_E_CALLCENTER_QUEUE_REMOVED = -2147221434;
pub const TAPI_E_CALLCENTER_NO_AGENT_ID = -2147221433;
pub const TAPI_E_CALLCENTER_INVALAGENTID = -2147221432;
pub const TAPI_E_CALLCENTER_INVALAGENTGROUP = -2147221431;
pub const TAPI_E_CALLCENTER_INVALPASSWORD = -2147221430;
pub const TAPI_E_CALLCENTER_INVALAGENTSTATE = -2147221429;
pub const TAPI_E_CALLCENTER_INVALAGENTACTIVITY = -2147221428;
pub const TAPI_E_REGISTRY_SETTING_CORRUPT = -2147221427;
pub const TAPI_E_TERMINAL_PEER = -2147221426;
pub const TAPI_E_PEER_NOT_SET = -2147221425;
pub const TAPI_E_NOEVENT = -2147221424;
pub const TAPI_E_INVALADDRESSTYPE = -2147221423;
pub const TAPI_E_RESOURCEUNAVAIL = -2147221422;
pub const TAPI_E_PHONENOTOPEN = -2147221421;
pub const TAPI_E_CALLNOTSELECTED = -2147221420;
pub const TAPI_E_WRONGEVENT = -2147221419;
pub const TAPI_E_NOFORMAT = -2147221418;
pub const TAPI_E_INVALIDSTREAMSTATE = -2147221417;
pub const TAPI_E_WRONG_STATE = -2147221416;
pub const TAPI_E_NOT_INITIALIZED = -2147221415;
pub const TAPI_E_SERVICE_NOT_RUNNING = -2147221414;
pub const cbDisplayName = 41;
pub const cbEmailName = 11;
pub const cbSeverName = 12;
pub const cbTYPE = 16;
pub const cbMaxIdData = 200;
pub const prioLow = 3;
pub const prioNorm = 2;
pub const prioHigh = 1;
pub const atypNull = 0;
pub const atypFile = 1;
pub const atypOle = 2;
pub const atypPicture = 3;
pub const atypMax = 4;
pub const TTM_RINGBACK = 2;
pub const TTM_BUSY = 4;
pub const TTM_BEEP = 8;
pub const TTM_BILLING = 16;
pub const TGT_BUFFERFULL = 1;
pub const TGT_TERMDIGIT = 2;
pub const TGT_FIRSTTIMEOUT = 4;
pub const TGT_INTERTIMEOUT = 8;
pub const TGT_CANCEL = 16;
pub const AE_STATE = 0;
pub const AE_CAPSCHANGE = 1;
pub const AE_RINGING = 2;
pub const AE_CONFIGCHANGE = 3;
pub const AE_FORWARD = 4;
pub const AE_NEWTERMINAL = 5;
pub const AE_REMOVETERMINAL = 6;
pub const AE_MSGWAITON = 7;
pub const AE_MSGWAITOFF = 8;
pub const AE_LASTITEM = 8;
pub const AS_INSERVICE = 0;
pub const AS_OUTOFSERVICE = 1;
pub const CS_IDLE = 0;
pub const CS_INPROGRESS = 1;
pub const CS_CONNECTED = 2;
pub const CS_DISCONNECTED = 3;
pub const CS_OFFERING = 4;
pub const CS_HOLD = 5;
pub const CS_QUEUED = 6;
pub const CS_LASTITEM = 6;
pub const CEC_NONE = 0;
pub const CEC_DISCONNECT_NORMAL = 1;
pub const CEC_DISCONNECT_BUSY = 2;
pub const CEC_DISCONNECT_BADADDRESS = 3;
pub const CEC_DISCONNECT_NOANSWER = 4;
pub const CEC_DISCONNECT_CANCELLED = 5;
pub const CEC_DISCONNECT_REJECTED = 6;
pub const CEC_DISCONNECT_FAILED = 7;
pub const CEC_DISCONNECT_BLOCKED = 8;
pub const CME_NEW_STREAM = 0;
pub const CME_STREAM_FAIL = 1;
pub const CME_TERMINAL_FAIL = 2;
pub const CME_STREAM_NOT_USED = 3;
pub const CME_STREAM_ACTIVE = 4;
pub const CME_STREAM_INACTIVE = 5;
pub const CME_LASTITEM = 5;
pub const CMC_UNKNOWN = 0;
pub const CMC_BAD_DEVICE = 1;
pub const CMC_CONNECT_FAIL = 2;
pub const CMC_LOCAL_REQUEST = 3;
pub const CMC_REMOTE_REQUEST = 4;
pub const CMC_MEDIA_TIMEOUT = 5;
pub const CMC_MEDIA_RECOVERED = 6;
pub const CMC_QUALITY_OF_SERVICE = 7;
pub const DC_NORMAL = 0;
pub const DC_NOANSWER = 1;
pub const DC_REJECTED = 2;
pub const TS_INUSE = 0;
pub const TS_NOTINUSE = 1;
pub const TD_CAPTURE = 0;
pub const TD_RENDER = 1;
pub const TD_BIDIRECTIONAL = 2;
pub const TD_MULTITRACK_MIXED = 3;
pub const TD_NONE = 4;
pub const TT_STATIC = 0;
pub const TT_DYNAMIC = 1;
pub const CP_OWNER = 0;
pub const CP_MONITOR = 1;
pub const TE_TAPIOBJECT = 1;
pub const TE_ADDRESS = 2;
pub const TE_CALLNOTIFICATION = 4;
pub const TE_CALLSTATE = 8;
pub const TE_CALLMEDIA = 16;
pub const TE_CALLHUB = 32;
pub const TE_CALLINFOCHANGE = 64;
pub const TE_PRIVATE = 128;
pub const TE_REQUEST = 256;
pub const TE_AGENT = 512;
pub const TE_AGENTSESSION = 1024;
pub const TE_QOSEVENT = 2048;
pub const TE_AGENTHANDLER = 4096;
pub const TE_ACDGROUP = 8192;
pub const TE_QUEUE = 16384;
pub const TE_DIGITEVENT = 32768;
pub const TE_GENERATEEVENT = 65536;
pub const TE_ASRTERMINAL = 131072;
pub const TE_TTSTERMINAL = 262144;
pub const TE_FILETERMINAL = 524288;
pub const TE_TONETERMINAL = 1048576;
pub const TE_PHONEEVENT = 2097152;
pub const TE_TONEEVENT = 4194304;
pub const TE_GATHERDIGITS = 8388608;
pub const TE_ADDRESSDEVSPECIFIC = 16777216;
pub const TE_PHONEDEVSPECIFIC = 33554432;
pub const CNE_OWNER = 0;
pub const CNE_MONITOR = 1;
pub const CNE_LASTITEM = 1;
pub const CHE_CALLJOIN = 0;
pub const CHE_CALLLEAVE = 1;
pub const CHE_CALLHUBNEW = 2;
pub const CHE_CALLHUBIDLE = 3;
pub const CHE_LASTITEM = 3;
pub const CHS_ACTIVE = 0;
pub const CHS_IDLE = 1;
pub const TE_ADDRESSCREATE = 0;
pub const TE_ADDRESSREMOVE = 1;
pub const TE_REINIT = 2;
pub const TE_TRANSLATECHANGE = 3;
pub const TE_ADDRESSCLOSE = 4;
pub const TE_PHONECREATE = 5;
pub const TE_PHONEREMOVE = 6;
pub const TOT_NONE = 0;
pub const TOT_TAPI = 1;
pub const TOT_ADDRESS = 2;
pub const TOT_TERMINAL = 3;
pub const TOT_CALL = 4;
pub const TOT_CALLHUB = 5;
pub const TOT_PHONE = 6;
pub const QSL_NEEDED = 1;
pub const QSL_IF_AVAILABLE = 2;
pub const QSL_BEST_EFFORT = 3;
pub const QE_NOQOS = 1;
pub const QE_ADMISSIONFAILURE = 2;
pub const QE_POLICYFAILURE = 3;
pub const QE_GENERICERROR = 4;
pub const QE_LASTITEM = 4;
pub const CIC_OTHER = 0;
pub const CIC_DEVSPECIFIC = 1;
pub const CIC_BEARERMODE = 2;
pub const CIC_RATE = 3;
pub const CIC_APPSPECIFIC = 4;
pub const CIC_CALLID = 5;
pub const CIC_RELATEDCALLID = 6;
pub const CIC_ORIGIN = 7;
pub const CIC_REASON = 8;
pub const CIC_COMPLETIONID = 9;
pub const CIC_NUMOWNERINCR = 10;
pub const CIC_NUMOWNERDECR = 11;
pub const CIC_NUMMONITORS = 12;
pub const CIC_TRUNK = 13;
pub const CIC_CALLERID = 14;
pub const CIC_CALLEDID = 15;
pub const CIC_CONNECTEDID = 16;
pub const CIC_REDIRECTIONID = 17;
pub const CIC_REDIRECTINGID = 18;
pub const CIC_USERUSERINFO = 19;
pub const CIC_HIGHLEVELCOMP = 20;
pub const CIC_LOWLEVELCOMP = 21;
pub const CIC_CHARGINGINFO = 22;
pub const CIC_TREATMENT = 23;
pub const CIC_CALLDATA = 24;
pub const CIC_PRIVILEGE = 25;
pub const CIC_MEDIATYPE = 26;
pub const CIC_LASTITEM = 26;
pub const CIL_MEDIATYPESAVAILABLE = 0;
pub const CIL_BEARERMODE = 1;
pub const CIL_CALLERIDADDRESSTYPE = 2;
pub const CIL_CALLEDIDADDRESSTYPE = 3;
pub const CIL_CONNECTEDIDADDRESSTYPE = 4;
pub const CIL_REDIRECTIONIDADDRESSTYPE = 5;
pub const CIL_REDIRECTINGIDADDRESSTYPE = 6;
pub const CIL_ORIGIN = 7;
pub const CIL_REASON = 8;
pub const CIL_APPSPECIFIC = 9;
pub const CIL_CALLPARAMSFLAGS = 10;
pub const CIL_CALLTREATMENT = 11;
pub const CIL_MINRATE = 12;
pub const CIL_MAXRATE = 13;
pub const CIL_COUNTRYCODE = 14;
pub const CIL_CALLID = 15;
pub const CIL_RELATEDCALLID = 16;
pub const CIL_COMPLETIONID = 17;
pub const CIL_NUMBEROFOWNERS = 18;
pub const CIL_NUMBEROFMONITORS = 19;
pub const CIL_TRUNK = 20;
pub const CIL_RATE = 21;
pub const CIL_GENERATEDIGITDURATION = 22;
pub const CIL_MONITORDIGITMODES = 23;
pub const CIL_MONITORMEDIAMODES = 24;
pub const CIS_CALLERIDNAME = 0;
pub const CIS_CALLERIDNUMBER = 1;
pub const CIS_CALLEDIDNAME = 2;
pub const CIS_CALLEDIDNUMBER = 3;
pub const CIS_CONNECTEDIDNAME = 4;
pub const CIS_CONNECTEDIDNUMBER = 5;
pub const CIS_REDIRECTIONIDNAME = 6;
pub const CIS_REDIRECTIONIDNUMBER = 7;
pub const CIS_REDIRECTINGIDNAME = 8;
pub const CIS_REDIRECTINGIDNUMBER = 9;
pub const CIS_CALLEDPARTYFRIENDLYNAME = 10;
pub const CIS_COMMENT = 11;
pub const CIS_DISPLAYABLEADDRESS = 12;
pub const CIS_CALLINGPARTYID = 13;
pub const CIB_USERUSERINFO = 0;
pub const CIB_DEVSPECIFICBUFFER = 1;
pub const CIB_CALLDATABUFFER = 2;
pub const CIB_CHARGINGINFOBUFFER = 3;
pub const CIB_HIGHLEVELCOMPATIBILITYBUFFER = 4;
pub const CIB_LOWLEVELCOMPATIBILITYBUFFER = 5;
pub const AC_ADDRESSTYPES = 0;
pub const AC_BEARERMODES = 1;
pub const AC_MAXACTIVECALLS = 2;
pub const AC_MAXONHOLDCALLS = 3;
pub const AC_MAXONHOLDPENDINGCALLS = 4;
pub const AC_MAXNUMCONFERENCE = 5;
pub const AC_MAXNUMTRANSCONF = 6;
pub const AC_MONITORDIGITSUPPORT = 7;
pub const AC_GENERATEDIGITSUPPORT = 8;
pub const AC_GENERATETONEMODES = 9;
pub const AC_GENERATETONEMAXNUMFREQ = 10;
pub const AC_MONITORTONEMAXNUMFREQ = 11;
pub const AC_MONITORTONEMAXNUMENTRIES = 12;
pub const AC_DEVCAPFLAGS = 13;
pub const AC_ANSWERMODES = 14;
pub const AC_LINEFEATURES = 15;
pub const AC_SETTABLEDEVSTATUS = 16;
pub const AC_PARKSUPPORT = 17;
pub const AC_CALLERIDSUPPORT = 18;
pub const AC_CALLEDIDSUPPORT = 19;
pub const AC_CONNECTEDIDSUPPORT = 20;
pub const AC_REDIRECTIONIDSUPPORT = 21;
pub const AC_REDIRECTINGIDSUPPORT = 22;
pub const AC_ADDRESSCAPFLAGS = 23;
pub const AC_CALLFEATURES1 = 24;
pub const AC_CALLFEATURES2 = 25;
pub const AC_REMOVEFROMCONFCAPS = 26;
pub const AC_REMOVEFROMCONFSTATE = 27;
pub const AC_TRANSFERMODES = 28;
pub const AC_ADDRESSFEATURES = 29;
pub const AC_PREDICTIVEAUTOTRANSFERSTATES = 30;
pub const AC_MAXCALLDATASIZE = 31;
pub const AC_LINEID = 32;
pub const AC_ADDRESSID = 33;
pub const AC_FORWARDMODES = 34;
pub const AC_MAXFORWARDENTRIES = 35;
pub const AC_MAXSPECIFICENTRIES = 36;
pub const AC_MINFWDNUMRINGS = 37;
pub const AC_MAXFWDNUMRINGS = 38;
pub const AC_MAXCALLCOMPLETIONS = 39;
pub const AC_CALLCOMPLETIONCONDITIONS = 40;
pub const AC_CALLCOMPLETIONMODES = 41;
pub const AC_PERMANENTDEVICEID = 42;
pub const AC_GATHERDIGITSMINTIMEOUT = 43;
pub const AC_GATHERDIGITSMAXTIMEOUT = 44;
pub const AC_GENERATEDIGITMINDURATION = 45;
pub const AC_GENERATEDIGITMAXDURATION = 46;
pub const AC_GENERATEDIGITDEFAULTDURATION = 47;
pub const ACS_PROTOCOL = 0;
pub const ACS_ADDRESSDEVICESPECIFIC = 1;
pub const ACS_LINEDEVICESPECIFIC = 2;
pub const ACS_PROVIDERSPECIFIC = 3;
pub const ACS_SWITCHSPECIFIC = 4;
pub const ACS_PERMANENTDEVICEGUID = 5;
pub const FDS_SUPPORTED = 0;
pub const FDS_NOTSUPPORTED = 1;
pub const FDS_UNKNOWN = 2;
pub const FM_ASTRANSFER = 0;
pub const FM_ASCONFERENCE = 1;
pub const PP_OWNER = 0;
pub const PP_MONITOR = 1;
pub const PHSD_HANDSET = 1;
pub const PHSD_SPEAKERPHONE = 2;
pub const PHSD_HEADSET = 4;
pub const PHSS_ONHOOK = 1;
pub const PHSS_OFFHOOK_MIC_ONLY = 2;
pub const PHSS_OFFHOOK_SPEAKER_ONLY = 4;
pub const PHSS_OFFHOOK = 8;
pub const LM_DUMMY = 1;
pub const LM_OFF = 2;
pub const LM_STEADY = 4;
pub const LM_WINK = 8;
pub const LM_FLASH = 16;
pub const LM_FLUTTER = 32;
pub const LM_BROKENFLUTTER = 64;
pub const LM_UNKNOWN = 128;
pub const PCL_HOOKSWITCHES = 0;
pub const PCL_HANDSETHOOKSWITCHMODES = 1;
pub const PCL_HEADSETHOOKSWITCHMODES = 2;
pub const PCL_SPEAKERPHONEHOOKSWITCHMODES = 3;
pub const PCL_DISPLAYNUMROWS = 4;
pub const PCL_DISPLAYNUMCOLUMNS = 5;
pub const PCL_NUMRINGMODES = 6;
pub const PCL_NUMBUTTONLAMPS = 7;
pub const PCL_GENERICPHONE = 8;
pub const PCS_PHONENAME = 0;
pub const PCS_PHONEINFO = 1;
pub const PCS_PROVIDERINFO = 2;
pub const PCB_DEVSPECIFICBUFFER = 0;
pub const PBS_UP = 1;
pub const PBS_DOWN = 2;
pub const PBS_UNKNOWN = 4;
pub const PBS_UNAVAIL = 8;
pub const PBM_DUMMY = 0;
pub const PBM_CALL = 1;
pub const PBM_FEATURE = 2;
pub const PBM_KEYPAD = 3;
pub const PBM_LOCAL = 4;
pub const PBM_DISPLAY = 5;
pub const PBF_UNKNOWN = 0;
pub const PBF_CONFERENCE = 1;
pub const PBF_TRANSFER = 2;
pub const PBF_DROP = 3;
pub const PBF_HOLD = 4;
pub const PBF_RECALL = 5;
pub const PBF_DISCONNECT = 6;
pub const PBF_CONNECT = 7;
pub const PBF_MSGWAITON = 8;
pub const PBF_MSGWAITOFF = 9;
pub const PBF_SELECTRING = 10;
pub const PBF_ABBREVDIAL = 11;
pub const PBF_FORWARD = 12;
pub const PBF_PICKUP = 13;
pub const PBF_RINGAGAIN = 14;
pub const PBF_PARK = 15;
pub const PBF_REJECT = 16;
pub const PBF_REDIRECT = 17;
pub const PBF_MUTE = 18;
pub const PBF_VOLUMEUP = 19;
pub const PBF_VOLUMEDOWN = 20;
pub const PBF_SPEAKERON = 21;
pub const PBF_SPEAKEROFF = 22;
pub const PBF_FLASH = 23;
pub const PBF_DATAON = 24;
pub const PBF_DATAOFF = 25;
pub const PBF_DONOTDISTURB = 26;
pub const PBF_INTERCOM = 27;
pub const PBF_BRIDGEDAPP = 28;
pub const PBF_BUSY = 29;
pub const PBF_CALLAPP = 30;
pub const PBF_DATETIME = 31;
pub const PBF_DIRECTORY = 32;
pub const PBF_COVER = 33;
pub const PBF_CALLID = 34;
pub const PBF_LASTNUM = 35;
pub const PBF_NIGHTSRV = 36;
pub const PBF_SENDCALLS = 37;
pub const PBF_MSGINDICATOR = 38;
pub const PBF_REPDIAL = 39;
pub const PBF_SETREPDIAL = 40;
pub const PBF_SYSTEMSPEED = 41;
pub const PBF_STATIONSPEED = 42;
pub const PBF_CAMPON = 43;
pub const PBF_SAVEREPEAT = 44;
pub const PBF_QUEUECALL = 45;
pub const PBF_NONE = 46;
pub const PBF_SEND = 47;
pub const PT_KEYPADZERO = 0;
pub const PT_KEYPADONE = 1;
pub const PT_KEYPADTWO = 2;
pub const PT_KEYPADTHREE = 3;
pub const PT_KEYPADFOUR = 4;
pub const PT_KEYPADFIVE = 5;
pub const PT_KEYPADSIX = 6;
pub const PT_KEYPADSEVEN = 7;
pub const PT_KEYPADEIGHT = 8;
pub const PT_KEYPADNINE = 9;
pub const PT_KEYPADSTAR = 10;
pub const PT_KEYPADPOUND = 11;
pub const PT_KEYPADA = 12;
pub const PT_KEYPADB = 13;
pub const PT_KEYPADC = 14;
pub const PT_KEYPADD = 15;
pub const PT_NORMALDIALTONE = 16;
pub const PT_EXTERNALDIALTONE = 17;
pub const PT_BUSY = 18;
pub const PT_RINGBACK = 19;
pub const PT_ERRORTONE = 20;
pub const PT_SILENCE = 21;
pub const PE_DISPLAY = 0;
pub const PE_LAMPMODE = 1;
pub const PE_RINGMODE = 2;
pub const PE_RINGVOLUME = 3;
pub const PE_HOOKSWITCH = 4;
pub const PE_CAPSCHANGE = 5;
pub const PE_BUTTON = 6;
pub const PE_CLOSE = 7;
pub const PE_NUMBERGATHERED = 8;
pub const PE_DIALING = 9;
pub const PE_ANSWER = 10;
pub const PE_DISCONNECT = 11;
pub const PE_LASTITEM = 11;
pub const TMS_IDLE = 0;
pub const TMS_ACTIVE = 1;
pub const TMS_PAUSED = 2;
pub const TMS_LASTITEM = 2;
pub const FTEC_NORMAL = 0;
pub const FTEC_END_OF_FILE = 1;
pub const FTEC_READ_ERROR = 2;
pub const FTEC_WRITE_ERROR = 3;
pub const AE_NOT_READY = 0;
pub const AE_READY = 1;
pub const AE_BUSY_ACD = 2;
pub const AE_BUSY_INCOMING = 3;
pub const AE_BUSY_OUTGOING = 4;
pub const AE_UNKNOWN = 5;
pub const AS_NOT_READY = 0;
pub const AS_READY = 1;
pub const AS_BUSY_ACD = 2;
pub const AS_BUSY_INCOMING = 3;
pub const AS_BUSY_OUTGOING = 4;
pub const AS_UNKNOWN = 5;
pub const ASE_NEW_SESSION = 0;
pub const ASE_NOT_READY = 1;
pub const ASE_READY = 2;
pub const ASE_BUSY = 3;
pub const ASE_WRAPUP = 4;
pub const ASE_END = 5;
pub const ASST_NOT_READY = 0;
pub const ASST_READY = 1;
pub const ASST_BUSY_ON_CALL = 2;
pub const ASST_BUSY_WRAPUP = 3;
pub const ASST_SESSION_ENDED = 4;
pub const AHE_NEW_AGENTHANDLER = 0;
pub const AHE_AGENTHANDLER_REMOVED = 1;
pub const ACDGE_NEW_GROUP = 0;
pub const ACDGE_GROUP_REMOVED = 1;
pub const ACDQE_NEW_QUEUE = 0;
pub const ACDQE_QUEUE_REMOVED = 1;
pub const ADDRESS_TERMINAL_AVAILABLE = 0;
pub const ADDRESS_TERMINAL_UNAVAILABLE = 1;
pub const CALL_NEW_STREAM = 0;
pub const CALL_STREAM_FAIL = 1;
pub const CALL_TERMINAL_FAIL = 2;
pub const CALL_STREAM_NOT_USED = 3;
pub const CALL_STREAM_ACTIVE = 4;
pub const CALL_STREAM_INACTIVE = 5;
pub const CALL_CAUSE_UNKNOWN = 0;
pub const CALL_CAUSE_BAD_DEVICE = 1;
pub const CALL_CAUSE_CONNECT_FAIL = 2;
pub const CALL_CAUSE_LOCAL_REQUEST = 3;
pub const CALL_CAUSE_REMOTE_REQUEST = 4;
pub const CALL_CAUSE_MEDIA_TIMEOUT = 5;
pub const CALL_CAUSE_MEDIA_RECOVERED = 6;
pub const CALL_CAUSE_QUALITY_OF_SERVICE = 7;
pub const ME_ADDRESS_EVENT = 0;
pub const ME_CALL_EVENT = 1;
pub const ME_TSP_DATA = 2;
pub const ME_PRIVATE_EVENT = 3;
pub const ME_ASR_TERMINAL_EVENT = 4;
pub const ME_TTS_TERMINAL_EVENT = 5;
pub const ME_FILE_TERMINAL_EVENT = 6;
pub const ME_TONE_TERMINAL_EVENT = 7;
pub const DT_NTDS = 1;
pub const DT_ILS = 2;
pub const OT_CONFERENCE = 1;
pub const OT_USER = 2;
pub const RAS_LOCAL = 1;
pub const RAS_SITE = 2;
pub const RAS_REGION = 3;
pub const RAS_WORLD = 4;

pub const aliases = struct {
    pub const TAPI_TONEMODE = i32;
    pub const TAPI_GATHERTERM = i32;
    pub const ADDRESS_EVENT = i32;
    pub const ADDRESS_STATE = i32;
    pub const CALL_STATE = i32;
    pub const CALL_STATE_EVENT_CAUSE = i32;
    pub const CALL_MEDIA_EVENT = i32;
    pub const CALL_MEDIA_EVENT_CAUSE = i32;
    pub const DISCONNECT_CODE = i32;
    pub const TERMINAL_STATE = i32;
    pub const TERMINAL_DIRECTION = i32;
    pub const TERMINAL_TYPE = i32;
    pub const CALL_PRIVILEGE = i32;
    pub const TAPI_EVENT = i32;
    pub const CALL_NOTIFICATION_EVENT = i32;
    pub const CALLHUB_EVENT = i32;
    pub const CALLHUB_STATE = i32;
    pub const TAPIOBJECT_EVENT = i32;
    pub const TAPI_OBJECT_TYPE = i32;
    pub const QOS_SERVICE_LEVEL = i32;
    pub const QOS_EVENT = i32;
    pub const CALLINFOCHANGE_CAUSE = i32;
    pub const CALLINFO_LONG = i32;
    pub const CALLINFO_STRING = i32;
    pub const CALLINFO_BUFFER = i32;
    pub const ADDRESS_CAPABILITY = i32;
    pub const ADDRESS_CAPABILITY_STRING = i32;
    pub const FULLDUPLEX_SUPPORT = i32;
    pub const FINISH_MODE = i32;
    pub const PHONE_PRIVILEGE = i32;
    pub const PHONE_HOOK_SWITCH_DEVICE = i32;
    pub const PHONE_HOOK_SWITCH_STATE = i32;
    pub const PHONE_LAMP_MODE = i32;
    pub const PHONECAPS_LONG = i32;
    pub const PHONECAPS_STRING = i32;
    pub const PHONECAPS_BUFFER = i32;
    pub const PHONE_BUTTON_STATE = i32;
    pub const PHONE_BUTTON_MODE = i32;
    pub const PHONE_BUTTON_FUNCTION = i32;
    pub const PHONE_TONE = i32;
    pub const PHONE_EVENT = i32;
    pub const TERMINAL_MEDIA_STATE = i32;
    pub const FT_STATE_EVENT_CAUSE = i32;
    pub const AGENT_EVENT = i32;
    pub const AGENT_STATE = i32;
    pub const AGENT_SESSION_EVENT = i32;
    pub const AGENT_SESSION_STATE = i32;
    pub const AGENTHANDLER_EVENT = i32;
    pub const ACDGROUP_EVENT = i32;
    pub const ACDQUEUE_EVENT = i32;
    pub const MSP_ADDRESS_EVENT = i32;
    pub const MSP_CALL_EVENT = i32;
    pub const MSP_CALL_EVENT_CAUSE = i32;
    pub const MSP_EVENT = i32;
    pub const DIRECTORY_TYPE = i32;
    pub const DIRECTORY_OBJECT_TYPE = i32;
    pub const RND_ADVERTISING_SCOPE = i32;
    pub const HDRVCALL = ?*anyopaque;
    pub const HDRVLINE = ?*anyopaque;
    pub const HDRVPHONE = ?*anyopaque;
    pub const HDRVMSPLINE = ?*anyopaque;
    pub const HDRVDIALOGINSTANCE = ?*anyopaque;
    pub const HTAPICALL = ?*anyopaque;
    pub const HTAPILINE = ?*anyopaque;
    pub const HTAPIPHONE = ?*anyopaque;
    pub const HPROVIDER = ?*anyopaque;
    pub const LINECALLBACK = ?*const anyopaque;
    pub const PHONECALLBACK = ?*const anyopaque;
    pub const ASYNC_COMPLETION = ?*const anyopaque;
    pub const LINEEVENT = ?*const anyopaque;
    pub const PHONEEVENT = ?*const anyopaque;
    pub const TUISPIDLLCALLBACK = ?*const anyopaque;
    pub const LPOPENTNEFSTREAM = ?*const anyopaque;
    pub const LPOPENTNEFSTREAMEX = ?*const anyopaque;
    pub const LPGETTNEFSTREAMCODEPAGE = ?*const anyopaque;
};
