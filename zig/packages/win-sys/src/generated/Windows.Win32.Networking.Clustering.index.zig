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
    .{ "ClusapiSetReasonHandler", MethodRecord{ .library = "CLUSAPI", .import = "ClusapiSetReasonHandler", .signature = "\x00\x01\x0f\x11\xb0\xd1\x0f\x11\xb0\xd1" } },
    .{ "GetNodeClusterState", MethodRecord{ .library = "CLUSAPI", .import = "GetNodeClusterState", .signature = "\x00\x02\x09\x11\x05\x0f\x09" } },
    .{ "OpenCluster", MethodRecord{ .library = "CLUSAPI", .import = "OpenCluster", .signature = "\x00\x01\x11\xb0\xd5\x11\x05" } },
    .{ "OpenClusterEx", MethodRecord{ .library = "CLUSAPI", .import = "OpenClusterEx", .signature = "\x00\x03\x11\xb0\xd5\x11\x05\x09\x0f\x09" } },
    .{ "CloseCluster", MethodRecord{ .library = "CLUSAPI", .import = "CloseCluster", .signature = "\x00\x01\x11\x59\x11\xb0\xd5" } },
    .{ "SetClusterName", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterName", .signature = "\x00\x02\x09\x11\xb0\xd5\x11\x05" } },
    .{ "SetClusterNameEx", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterNameEx", .signature = "\x00\x03\x09\x11\xb0\xd5\x11\x05\x11\x05" } },
    .{ "GetClusterInformation", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterInformation", .signature = "\x00\x04\x09\x11\xb0\xd5\x11\x05\x0f\x09\x0f\x11\xb0\xd9" } },
    .{ "GetClusterQuorumResource", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterQuorumResource", .signature = "\x00\x06\x09\x11\xb0\xd5\x11\x05\x0f\x09\x11\x05\x0f\x09\x0f\x09" } },
    .{ "SetClusterQuorumResource", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterQuorumResource", .signature = "\x00\x03\x09\x11\xb0\xdd\x11\x05\x09" } },
    .{ "SetClusterQuorumResourceEx", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterQuorumResourceEx", .signature = "\x00\x04\x09\x11\xb0\xdd\x11\x05\x09\x11\x05" } },
    .{ "BackupClusterDatabase", MethodRecord{ .library = "CLUSAPI", .import = "BackupClusterDatabase", .signature = "\x00\x02\x09\x11\xb0\xd5\x11\x05" } },
    .{ "RestoreClusterDatabase", MethodRecord{ .library = "CLUSAPI", .import = "RestoreClusterDatabase", .signature = "\x00\x03\x09\x11\x05\x11\x59\x11\x05" } },
    .{ "SetClusterNetworkPriorityOrder", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterNetworkPriorityOrder", .signature = "\x00\x03\x09\x11\xb0\xd5\x09\x0f\x11\xb0\xe1" } },
    .{ "SetClusterServiceAccountPassword", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterServiceAccountPassword", .signature = "\x00\x05\x09\x11\x05\x11\x05\x09\x0f\x11\xb0\xe5\x0f\x09" } },
    .{ "ClusterControl", MethodRecord{ .library = "CLUSAPI", .import = "ClusterControl", .signature = "\x00\x08\x09\x11\xb0\xd5\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "ClusterControlEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterControlEx", .signature = "\x00\x09\x09\x11\xb0\xd5\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09\x11\x05" } },
    .{ "ClusterUpgradeFunctionalLevel", MethodRecord{ .library = "CLUSAPI", .import = "ClusterUpgradeFunctionalLevel", .signature = "\x00\x04\x09\x11\xb0\xd5\x11\x59\x12\xb0\xed\x0f\x01" } },
    .{ "CreateClusterNotifyPortV2", MethodRecord{ .library = "CLUSAPI", .import = "CreateClusterNotifyPortV2", .signature = "\x00\x05\x11\xb0\xf1\x11\xb0\xf1\x11\xb0\xd5\x0f\x11\xb0\xf5\x09\x19" } },
    .{ "RegisterClusterNotifyV2", MethodRecord{ .library = "CLUSAPI", .import = "RegisterClusterNotifyV2", .signature = "\x00\x04\x09\x11\xb0\xf1\x11\xb0\xf5\x11\x80\x85\x19" } },
    .{ "GetNotifyEventHandle", MethodRecord{ .library = "CLUSAPI", .import = "GetNotifyEventHandle", .signature = "\x00\x02\x09\x11\xb0\xf1\x0f\x11\x80\x85" } },
    .{ "GetClusterNotifyV2", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterNotifyV2", .signature = "\x00\x0e\x09\x11\xb0\xf1\x0f\x19\x0f\x11\xb0\xf5\x0f\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x09" } },
    .{ "CreateClusterNotifyPort", MethodRecord{ .library = "CLUSAPI", .import = "CreateClusterNotifyPort", .signature = "\x00\x04\x11\xb0\xf1\x11\xb0\xf1\x11\xb0\xd5\x09\x19" } },
    .{ "RegisterClusterNotify", MethodRecord{ .library = "CLUSAPI", .import = "RegisterClusterNotify", .signature = "\x00\x04\x09\x11\xb0\xf1\x09\x11\x80\x85\x19" } },
    .{ "GetClusterNotify", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterNotify", .signature = "\x00\x06\x09\x11\xb0\xf1\x0f\x19\x0f\x09\x11\x05\x0f\x09\x09" } },
    .{ "CloseClusterNotifyPort", MethodRecord{ .library = "CLUSAPI", .import = "CloseClusterNotifyPort", .signature = "\x00\x01\x11\x59\x11\xb0\xf1" } },
    .{ "ClusterOpenEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterOpenEnum", .signature = "\x00\x02\x11\xb0\xf9\x11\xb0\xd5\x09" } },
    .{ "ClusterGetEnumCount", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGetEnumCount", .signature = "\x00\x01\x09\x11\xb0\xf9" } },
    .{ "ClusterEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterEnum", .signature = "\x00\x05\x09\x11\xb0\xf9\x09\x0f\x09\x11\x05\x0f\x09" } },
    .{ "ClusterCloseEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterCloseEnum", .signature = "\x00\x01\x09\x11\xb0\xf9" } },
    .{ "ClusterOpenEnumEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterOpenEnumEx", .signature = "\x00\x03\x11\xb0\xfd\x11\xb0\xd5\x09\x0f\x01" } },
    .{ "ClusterGetEnumCountEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGetEnumCountEx", .signature = "\x00\x01\x09\x11\xb0\xfd" } },
    .{ "ClusterEnumEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterEnumEx", .signature = "\x00\x04\x09\x11\xb0\xfd\x09\x0f\x11\xb1\x01\x0f\x09" } },
    .{ "ClusterCloseEnumEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterCloseEnumEx", .signature = "\x00\x01\x09\x11\xb0\xfd" } },
    .{ "CreateClusterGroupSet", MethodRecord{ .library = "CLUSAPI", .import = "CreateClusterGroupSet", .signature = "\x00\x02\x11\xb1\x05\x11\xb0\xd5\x11\x05" } },
    .{ "OpenClusterGroupSet", MethodRecord{ .library = "CLUSAPI", .import = "OpenClusterGroupSet", .signature = "\x00\x02\x11\xb1\x05\x11\xb0\xd5\x11\x05" } },
    .{ "CloseClusterGroupSet", MethodRecord{ .library = "CLUSAPI", .import = "CloseClusterGroupSet", .signature = "\x00\x01\x11\x59\x11\xb1\x05" } },
    .{ "DeleteClusterGroupSet", MethodRecord{ .library = "CLUSAPI", .import = "DeleteClusterGroupSet", .signature = "\x00\x01\x09\x11\xb1\x05" } },
    .{ "DeleteClusterGroupSetEx", MethodRecord{ .library = "CLUSAPI", .import = "DeleteClusterGroupSetEx", .signature = "\x00\x02\x09\x11\xb1\x05\x11\x05" } },
    .{ "ClusterAddGroupToGroupSet", MethodRecord{ .library = "CLUSAPI", .import = "ClusterAddGroupToGroupSet", .signature = "\x00\x02\x09\x11\xb1\x05\x11\xb1\x09" } },
    .{ "ClusterAddGroupToGroupSetWithDomains", MethodRecord{ .library = "CLUSAPI", .import = "ClusterAddGroupToGroupSetWithDomains", .signature = "\x00\x04\x09\x11\xb1\x05\x11\xb1\x09\x09\x09" } },
    .{ "ClusterAddGroupToGroupSetWithDomainsEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterAddGroupToGroupSetWithDomainsEx", .signature = "\x00\x05\x09\x11\xb1\x05\x11\xb1\x09\x09\x09\x11\x05" } },
    .{ "ClusterRemoveGroupFromGroupSet", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRemoveGroupFromGroupSet", .signature = "\x00\x01\x09\x11\xb1\x09" } },
    .{ "ClusterRemoveGroupFromGroupSetEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRemoveGroupFromGroupSetEx", .signature = "\x00\x02\x09\x11\xb1\x09\x11\x05" } },
    .{ "ClusterGroupSetControl", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupSetControl", .signature = "\x00\x08\x09\x11\xb1\x05\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "ClusterGroupSetControlEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupSetControlEx", .signature = "\x00\x09\x09\x11\xb1\x05\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09\x11\x05" } },
    .{ "AddClusterGroupDependency", MethodRecord{ .library = "CLUSAPI", .import = "AddClusterGroupDependency", .signature = "\x00\x02\x09\x11\xb1\x09\x11\xb1\x09" } },
    .{ "AddClusterGroupDependencyEx", MethodRecord{ .library = "CLUSAPI", .import = "AddClusterGroupDependencyEx", .signature = "\x00\x03\x09\x11\xb1\x09\x11\xb1\x09\x11\x05" } },
    .{ "SetGroupDependencyExpression", MethodRecord{ .library = "CLUSAPI", .import = "SetGroupDependencyExpression", .signature = "\x00\x02\x09\x11\xb1\x09\x11\x05" } },
    .{ "SetGroupDependencyExpressionEx", MethodRecord{ .library = "CLUSAPI", .import = "SetGroupDependencyExpressionEx", .signature = "\x00\x03\x09\x11\xb1\x09\x11\x05\x11\x05" } },
    .{ "RemoveClusterGroupDependency", MethodRecord{ .library = "CLUSAPI", .import = "RemoveClusterGroupDependency", .signature = "\x00\x02\x09\x11\xb1\x09\x11\xb1\x09" } },
    .{ "RemoveClusterGroupDependencyEx", MethodRecord{ .library = "CLUSAPI", .import = "RemoveClusterGroupDependencyEx", .signature = "\x00\x03\x09\x11\xb1\x09\x11\xb1\x09\x11\x05" } },
    .{ "AddClusterGroupSetDependency", MethodRecord{ .library = "CLUSAPI", .import = "AddClusterGroupSetDependency", .signature = "\x00\x02\x09\x11\xb1\x05\x11\xb1\x05" } },
    .{ "AddClusterGroupSetDependencyEx", MethodRecord{ .library = "CLUSAPI", .import = "AddClusterGroupSetDependencyEx", .signature = "\x00\x03\x09\x11\xb1\x05\x11\xb1\x05\x11\x05" } },
    .{ "SetClusterGroupSetDependencyExpression", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterGroupSetDependencyExpression", .signature = "\x00\x02\x09\x11\xb1\x05\x11\x05" } },
    .{ "SetClusterGroupSetDependencyExpressionEx", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterGroupSetDependencyExpressionEx", .signature = "\x00\x03\x09\x11\xb1\x05\x11\x05\x11\x05" } },
    .{ "RemoveClusterGroupSetDependency", MethodRecord{ .library = "CLUSAPI", .import = "RemoveClusterGroupSetDependency", .signature = "\x00\x02\x09\x11\xb1\x05\x11\xb1\x05" } },
    .{ "RemoveClusterGroupSetDependencyEx", MethodRecord{ .library = "CLUSAPI", .import = "RemoveClusterGroupSetDependencyEx", .signature = "\x00\x03\x09\x11\xb1\x05\x11\xb1\x05\x11\x05" } },
    .{ "AddClusterGroupToGroupSetDependency", MethodRecord{ .library = "CLUSAPI", .import = "AddClusterGroupToGroupSetDependency", .signature = "\x00\x02\x09\x11\xb1\x09\x11\xb1\x05" } },
    .{ "AddClusterGroupToGroupSetDependencyEx", MethodRecord{ .library = "CLUSAPI", .import = "AddClusterGroupToGroupSetDependencyEx", .signature = "\x00\x03\x09\x11\xb1\x09\x11\xb1\x05\x11\x05" } },
    .{ "RemoveClusterGroupToGroupSetDependency", MethodRecord{ .library = "CLUSAPI", .import = "RemoveClusterGroupToGroupSetDependency", .signature = "\x00\x02\x09\x11\xb1\x09\x11\xb1\x05" } },
    .{ "RemoveClusterGroupToGroupSetDependencyEx", MethodRecord{ .library = "CLUSAPI", .import = "RemoveClusterGroupToGroupSetDependencyEx", .signature = "\x00\x03\x09\x11\xb1\x09\x11\xb1\x05\x11\x05" } },
    .{ "ClusterGroupSetOpenEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupSetOpenEnum", .signature = "\x00\x01\x11\xb1\x0d\x11\xb0\xd5" } },
    .{ "ClusterGroupSetGetEnumCount", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupSetGetEnumCount", .signature = "\x00\x01\x09\x11\xb1\x0d" } },
    .{ "ClusterGroupSetEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupSetEnum", .signature = "\x00\x04\x09\x11\xb1\x0d\x09\x11\x05\x0f\x09" } },
    .{ "ClusterGroupSetCloseEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupSetCloseEnum", .signature = "\x00\x01\x09\x11\xb1\x0d" } },
    .{ "AddCrossClusterGroupSetDependency", MethodRecord{ .library = "CLUSAPI", .import = "AddCrossClusterGroupSetDependency", .signature = "\x00\x03\x09\x11\xb1\x05\x11\x05\x11\x05" } },
    .{ "RemoveCrossClusterGroupSetDependency", MethodRecord{ .library = "CLUSAPI", .import = "RemoveCrossClusterGroupSetDependency", .signature = "\x00\x03\x09\x11\xb1\x05\x11\x05\x11\x05" } },
    .{ "CreateClusterAvailabilitySet", MethodRecord{ .library = "CLUSAPI", .import = "CreateClusterAvailabilitySet", .signature = "\x00\x03\x11\xb1\x05\x11\xb0\xd5\x11\x05\x0f\x11\xb1\x11" } },
    .{ "ClusterNodeReplacement", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNodeReplacement", .signature = "\x00\x03\x09\x11\xb0\xd5\x11\x05\x11\x05" } },
    .{ "ClusterCreateAffinityRule", MethodRecord{ .library = "CLUSAPI", .import = "ClusterCreateAffinityRule", .signature = "\x00\x03\x09\x11\xb0\xd5\x11\x05\x11\xb1\x15" } },
    .{ "ClusterRemoveAffinityRule", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRemoveAffinityRule", .signature = "\x00\x02\x09\x11\xb0\xd5\x11\x05" } },
    .{ "ClusterAddGroupToAffinityRule", MethodRecord{ .library = "CLUSAPI", .import = "ClusterAddGroupToAffinityRule", .signature = "\x00\x03\x09\x11\xb0\xd5\x11\x05\x11\xb1\x09" } },
    .{ "ClusterRemoveGroupFromAffinityRule", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRemoveGroupFromAffinityRule", .signature = "\x00\x03\x09\x11\xb0\xd5\x11\x05\x11\xb1\x09" } },
    .{ "ClusterAffinityRuleControl", MethodRecord{ .library = "CLUSAPI", .import = "ClusterAffinityRuleControl", .signature = "\x00\x09\x09\x11\xb0\xd5\x11\x05\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "OpenClusterNode", MethodRecord{ .library = "CLUSAPI", .import = "OpenClusterNode", .signature = "\x00\x02\x11\xb0\xe9\x11\xb0\xd5\x11\x05" } },
    .{ "OpenClusterNodeEx", MethodRecord{ .library = "CLUSAPI", .import = "OpenClusterNodeEx", .signature = "\x00\x04\x11\xb0\xe9\x11\xb0\xd5\x11\x05\x09\x0f\x09" } },
    .{ "OpenClusterNodeById", MethodRecord{ .library = "CLUSAPI", .import = "OpenClusterNodeById", .signature = "\x00\x02\x11\xb0\xe9\x11\xb0\xd5\x09" } },
    .{ "CloseClusterNode", MethodRecord{ .library = "CLUSAPI", .import = "CloseClusterNode", .signature = "\x00\x01\x11\x59\x11\xb0\xe9" } },
    .{ "GetClusterNodeState", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterNodeState", .signature = "\x00\x01\x11\xb1\x19\x11\xb0\xe9" } },
    .{ "GetClusterNodeId", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterNodeId", .signature = "\x00\x03\x09\x11\xb0\xe9\x11\x05\x0f\x09" } },
    .{ "GetClusterFromNode", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterFromNode", .signature = "\x00\x01\x11\xb0\xd5\x11\xb0\xe9" } },
    .{ "PauseClusterNode", MethodRecord{ .library = "CLUSAPI", .import = "PauseClusterNode", .signature = "\x00\x01\x09\x11\xb0\xe9" } },
    .{ "ResumeClusterNode", MethodRecord{ .library = "CLUSAPI", .import = "ResumeClusterNode", .signature = "\x00\x01\x09\x11\xb0\xe9" } },
    .{ "EvictClusterNode", MethodRecord{ .library = "CLUSAPI", .import = "EvictClusterNode", .signature = "\x00\x01\x09\x11\xb0\xe9" } },
    .{ "ClusterNetInterfaceOpenEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNetInterfaceOpenEnum", .signature = "\x00\x03\x11\xb1\x1d\x11\xb0\xd5\x11\x05\x11\x05" } },
    .{ "ClusterNetInterfaceEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNetInterfaceEnum", .signature = "\x00\x04\x09\x11\xb1\x1d\x09\x11\x05\x0f\x09" } },
    .{ "ClusterNetInterfaceCloseEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNetInterfaceCloseEnum", .signature = "\x00\x01\x09\x11\xb1\x1d" } },
    .{ "ClusterNodeOpenEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNodeOpenEnum", .signature = "\x00\x02\x11\xb1\x21\x11\xb0\xe9\x09" } },
    .{ "ClusterNodeOpenEnumEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNodeOpenEnumEx", .signature = "\x00\x03\x11\xb1\x25\x11\xb0\xe9\x09\x0f\x01" } },
    .{ "ClusterNodeGetEnumCountEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNodeGetEnumCountEx", .signature = "\x00\x01\x09\x11\xb1\x25" } },
    .{ "ClusterNodeEnumEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNodeEnumEx", .signature = "\x00\x04\x09\x11\xb1\x25\x09\x0f\x11\xb1\x01\x0f\x09" } },
    .{ "ClusterNodeCloseEnumEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNodeCloseEnumEx", .signature = "\x00\x01\x09\x11\xb1\x25" } },
    .{ "ClusterNodeGetEnumCount", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNodeGetEnumCount", .signature = "\x00\x01\x09\x11\xb1\x21" } },
    .{ "ClusterNodeCloseEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNodeCloseEnum", .signature = "\x00\x01\x09\x11\xb1\x21" } },
    .{ "ClusterNodeEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNodeEnum", .signature = "\x00\x05\x09\x11\xb1\x21\x09\x0f\x09\x11\x05\x0f\x09" } },
    .{ "EvictClusterNodeEx", MethodRecord{ .library = "CLUSAPI", .import = "EvictClusterNodeEx", .signature = "\x00\x03\x09\x11\xb0\xe9\x09\x0f\x11\x79" } },
    .{ "EvictClusterNodeEx2", MethodRecord{ .library = "CLUSAPI", .import = "EvictClusterNodeEx2", .signature = "\x00\x04\x09\x11\xb0\xe9\x09\x0f\x11\x79\x11\x05" } },
    .{ "GetClusterResourceTypeKey", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterResourceTypeKey", .signature = "\x00\x03\x11\x55\x11\xb0\xd5\x11\x05\x09" } },
    .{ "CreateClusterGroup", MethodRecord{ .library = "CLUSAPI", .import = "CreateClusterGroup", .signature = "\x00\x02\x11\xb1\x09\x11\xb0\xd5\x11\x05" } },
    .{ "OpenClusterGroup", MethodRecord{ .library = "CLUSAPI", .import = "OpenClusterGroup", .signature = "\x00\x02\x11\xb1\x09\x11\xb0\xd5\x11\x05" } },
    .{ "OpenClusterGroupEx", MethodRecord{ .library = "CLUSAPI", .import = "OpenClusterGroupEx", .signature = "\x00\x04\x11\xb1\x09\x11\xb0\xd5\x11\x05\x09\x0f\x09" } },
    .{ "PauseClusterNodeEx", MethodRecord{ .library = "CLUSAPI", .import = "PauseClusterNodeEx", .signature = "\x00\x04\x09\x11\xb0\xe9\x11\x59\x09\x11\xb0\xe9" } },
    .{ "PauseClusterNodeEx2", MethodRecord{ .library = "CLUSAPI", .import = "PauseClusterNodeEx2", .signature = "\x00\x05\x09\x11\xb0\xe9\x11\x59\x09\x11\xb0\xe9\x11\x05" } },
    .{ "ResumeClusterNodeEx", MethodRecord{ .library = "CLUSAPI", .import = "ResumeClusterNodeEx", .signature = "\x00\x03\x09\x11\xb0\xe9\x11\xb1\x29\x09" } },
    .{ "ResumeClusterNodeEx2", MethodRecord{ .library = "CLUSAPI", .import = "ResumeClusterNodeEx2", .signature = "\x00\x04\x09\x11\xb0\xe9\x11\xb1\x29\x09\x11\x05" } },
    .{ "CreateClusterGroupEx", MethodRecord{ .library = "CLUSAPI", .import = "CreateClusterGroupEx", .signature = "\x00\x03\x11\xb1\x09\x11\xb0\xd5\x11\x05\x0f\x11\xb1\x2d" } },
    .{ "ClusterGroupOpenEnumEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupOpenEnumEx", .signature = "\x00\x06\x11\xb1\x31\x11\xb0\xd5\x11\x05\x09\x11\x05\x09\x09" } },
    .{ "ClusterGroupGetEnumCountEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupGetEnumCountEx", .signature = "\x00\x01\x09\x11\xb1\x31" } },
    .{ "ClusterGroupEnumEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupEnumEx", .signature = "\x00\x04\x09\x11\xb1\x31\x09\x0f\x11\xb1\x35\x0f\x09" } },
    .{ "ClusterGroupCloseEnumEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupCloseEnumEx", .signature = "\x00\x01\x09\x11\xb1\x31" } },
    .{ "ClusterResourceOpenEnumEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceOpenEnumEx", .signature = "\x00\x06\x11\xb1\x39\x11\xb0\xd5\x11\x05\x09\x11\x05\x09\x09" } },
    .{ "ClusterResourceGetEnumCountEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceGetEnumCountEx", .signature = "\x00\x01\x09\x11\xb1\x39" } },
    .{ "ClusterResourceEnumEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceEnumEx", .signature = "\x00\x04\x09\x11\xb1\x39\x09\x0f\x11\xb1\x3d\x0f\x09" } },
    .{ "ClusterResourceCloseEnumEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceCloseEnumEx", .signature = "\x00\x01\x09\x11\xb1\x39" } },
    .{ "OnlineClusterGroupEx", MethodRecord{ .library = "CLUSAPI", .import = "OnlineClusterGroupEx", .signature = "\x00\x05\x09\x11\xb1\x09\x11\xb0\xe9\x09\x0f\x05\x09" } },
    .{ "OfflineClusterGroupEx", MethodRecord{ .library = "CLUSAPI", .import = "OfflineClusterGroupEx", .signature = "\x00\x04\x09\x11\xb1\x09\x09\x0f\x05\x09" } },
    .{ "OnlineClusterGroupEx2", MethodRecord{ .library = "CLUSAPI", .import = "OnlineClusterGroupEx2", .signature = "\x00\x06\x09\x11\xb1\x09\x11\xb0\xe9\x09\x0f\x05\x09\x11\x05" } },
    .{ "OfflineClusterGroupEx2", MethodRecord{ .library = "CLUSAPI", .import = "OfflineClusterGroupEx2", .signature = "\x00\x05\x09\x11\xb1\x09\x09\x0f\x05\x09\x11\x05" } },
    .{ "OnlineClusterResourceEx", MethodRecord{ .library = "CLUSAPI", .import = "OnlineClusterResourceEx", .signature = "\x00\x04\x09\x11\xb0\xdd\x09\x0f\x05\x09" } },
    .{ "OnlineClusterResourceEx2", MethodRecord{ .library = "CLUSAPI", .import = "OnlineClusterResourceEx2", .signature = "\x00\x05\x09\x11\xb0\xdd\x09\x0f\x05\x09\x11\x05" } },
    .{ "OfflineClusterResourceEx", MethodRecord{ .library = "CLUSAPI", .import = "OfflineClusterResourceEx", .signature = "\x00\x04\x09\x11\xb0\xdd\x09\x0f\x05\x09" } },
    .{ "OfflineClusterResourceEx2", MethodRecord{ .library = "CLUSAPI", .import = "OfflineClusterResourceEx2", .signature = "\x00\x05\x09\x11\xb0\xdd\x09\x0f\x05\x09\x11\x05" } },
    .{ "MoveClusterGroupEx", MethodRecord{ .library = "CLUSAPI", .import = "MoveClusterGroupEx", .signature = "\x00\x05\x09\x11\xb1\x09\x11\xb0\xe9\x09\x0f\x05\x09" } },
    .{ "MoveClusterGroupEx2", MethodRecord{ .library = "CLUSAPI", .import = "MoveClusterGroupEx2", .signature = "\x00\x06\x09\x11\xb1\x09\x11\xb0\xe9\x09\x0f\x05\x09\x11\x05" } },
    .{ "CancelClusterGroupOperation", MethodRecord{ .library = "CLUSAPI", .import = "CancelClusterGroupOperation", .signature = "\x00\x02\x09\x11\xb1\x09\x09" } },
    .{ "RestartClusterResource", MethodRecord{ .library = "CLUSAPI", .import = "RestartClusterResource", .signature = "\x00\x02\x09\x11\xb0\xdd\x09" } },
    .{ "RestartClusterResourceEx", MethodRecord{ .library = "CLUSAPI", .import = "RestartClusterResourceEx", .signature = "\x00\x03\x09\x11\xb0\xdd\x09\x11\x05" } },
    .{ "CloseClusterGroup", MethodRecord{ .library = "CLUSAPI", .import = "CloseClusterGroup", .signature = "\x00\x01\x11\x59\x11\xb1\x09" } },
    .{ "GetClusterFromGroup", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterFromGroup", .signature = "\x00\x01\x11\xb0\xd5\x11\xb1\x09" } },
    .{ "GetClusterGroupState", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterGroupState", .signature = "\x00\x03\x11\xb1\x41\x11\xb1\x09\x11\x05\x0f\x09" } },
    .{ "SetClusterGroupName", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterGroupName", .signature = "\x00\x02\x09\x11\xb1\x09\x11\x05" } },
    .{ "SetClusterGroupNodeList", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterGroupNodeList", .signature = "\x00\x03\x09\x11\xb1\x09\x09\x0f\x11\xb0\xe9" } },
    .{ "SetClusterGroupNameEx", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterGroupNameEx", .signature = "\x00\x03\x09\x11\xb1\x09\x11\x05\x11\x05" } },
    .{ "SetClusterGroupNodeListEx", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterGroupNodeListEx", .signature = "\x00\x04\x09\x11\xb1\x09\x09\x0f\x11\xb0\xe9\x11\x05" } },
    .{ "OnlineClusterGroup", MethodRecord{ .library = "CLUSAPI", .import = "OnlineClusterGroup", .signature = "\x00\x02\x09\x11\xb1\x09\x11\xb0\xe9" } },
    .{ "MoveClusterGroup", MethodRecord{ .library = "CLUSAPI", .import = "MoveClusterGroup", .signature = "\x00\x02\x09\x11\xb1\x09\x11\xb0\xe9" } },
    .{ "OfflineClusterGroup", MethodRecord{ .library = "CLUSAPI", .import = "OfflineClusterGroup", .signature = "\x00\x01\x09\x11\xb1\x09" } },
    .{ "DeleteClusterGroup", MethodRecord{ .library = "CLUSAPI", .import = "DeleteClusterGroup", .signature = "\x00\x01\x09\x11\xb1\x09" } },
    .{ "DestroyClusterGroup", MethodRecord{ .library = "CLUSAPI", .import = "DestroyClusterGroup", .signature = "\x00\x01\x09\x11\xb1\x09" } },
    .{ "DeleteClusterGroupEx", MethodRecord{ .library = "CLUSAPI", .import = "DeleteClusterGroupEx", .signature = "\x00\x02\x09\x11\xb1\x09\x11\x05" } },
    .{ "DestroyClusterGroupEx", MethodRecord{ .library = "CLUSAPI", .import = "DestroyClusterGroupEx", .signature = "\x00\x02\x09\x11\xb1\x09\x11\x05" } },
    .{ "ClusterGroupOpenEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupOpenEnum", .signature = "\x00\x02\x11\xb1\x45\x11\xb1\x09\x09" } },
    .{ "ClusterGroupGetEnumCount", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupGetEnumCount", .signature = "\x00\x01\x09\x11\xb1\x45" } },
    .{ "ClusterGroupEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupEnum", .signature = "\x00\x05\x09\x11\xb1\x45\x09\x0f\x09\x11\x05\x0f\x09" } },
    .{ "ClusterGroupCloseEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupCloseEnum", .signature = "\x00\x01\x09\x11\xb1\x45" } },
    .{ "CreateClusterResource", MethodRecord{ .library = "CLUSAPI", .import = "CreateClusterResource", .signature = "\x00\x04\x11\xb0\xdd\x11\xb1\x09\x11\x05\x11\x05\x09" } },
    .{ "CreateClusterResourceEx", MethodRecord{ .library = "CLUSAPI", .import = "CreateClusterResourceEx", .signature = "\x00\x05\x11\xb0\xdd\x11\xb1\x09\x11\x05\x11\x05\x09\x11\x05" } },
    .{ "OpenClusterResource", MethodRecord{ .library = "CLUSAPI", .import = "OpenClusterResource", .signature = "\x00\x02\x11\xb0\xdd\x11\xb0\xd5\x11\x05" } },
    .{ "OpenClusterResourceEx", MethodRecord{ .library = "CLUSAPI", .import = "OpenClusterResourceEx", .signature = "\x00\x04\x11\xb0\xdd\x11\xb0\xd5\x11\x05\x09\x0f\x09" } },
    .{ "CloseClusterResource", MethodRecord{ .library = "CLUSAPI", .import = "CloseClusterResource", .signature = "\x00\x01\x11\x59\x11\xb0\xdd" } },
    .{ "GetClusterFromResource", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterFromResource", .signature = "\x00\x01\x11\xb0\xd5\x11\xb0\xdd" } },
    .{ "DeleteClusterResource", MethodRecord{ .library = "CLUSAPI", .import = "DeleteClusterResource", .signature = "\x00\x01\x09\x11\xb0\xdd" } },
    .{ "DeleteClusterResourceEx", MethodRecord{ .library = "CLUSAPI", .import = "DeleteClusterResourceEx", .signature = "\x00\x02\x09\x11\xb0\xdd\x11\x05" } },
    .{ "GetClusterResourceState", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterResourceState", .signature = "\x00\x05\x11\xb1\x49\x11\xb0\xdd\x11\x05\x0f\x09\x11\x05\x0f\x09" } },
    .{ "SetClusterResourceName", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterResourceName", .signature = "\x00\x02\x09\x11\xb0\xdd\x11\x05" } },
    .{ "SetClusterResourceNameEx", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterResourceNameEx", .signature = "\x00\x03\x09\x11\xb0\xdd\x11\x05\x11\x05" } },
    .{ "FailClusterResource", MethodRecord{ .library = "CLUSAPI", .import = "FailClusterResource", .signature = "\x00\x01\x09\x11\xb0\xdd" } },
    .{ "FailClusterResourceEx", MethodRecord{ .library = "CLUSAPI", .import = "FailClusterResourceEx", .signature = "\x00\x02\x09\x11\xb0\xdd\x11\x05" } },
    .{ "OnlineClusterResource", MethodRecord{ .library = "CLUSAPI", .import = "OnlineClusterResource", .signature = "\x00\x01\x09\x11\xb0\xdd" } },
    .{ "OfflineClusterResource", MethodRecord{ .library = "CLUSAPI", .import = "OfflineClusterResource", .signature = "\x00\x01\x09\x11\xb0\xdd" } },
    .{ "ChangeClusterResourceGroup", MethodRecord{ .library = "CLUSAPI", .import = "ChangeClusterResourceGroup", .signature = "\x00\x02\x09\x11\xb0\xdd\x11\xb1\x09" } },
    .{ "ChangeClusterResourceGroupEx", MethodRecord{ .library = "CLUSAPI", .import = "ChangeClusterResourceGroupEx", .signature = "\x00\x03\x09\x11\xb0\xdd\x11\xb1\x09\x0b" } },
    .{ "ChangeClusterResourceGroupEx2", MethodRecord{ .library = "CLUSAPI", .import = "ChangeClusterResourceGroupEx2", .signature = "\x00\x04\x09\x11\xb0\xdd\x11\xb1\x09\x0b\x11\x05" } },
    .{ "AddClusterResourceNode", MethodRecord{ .library = "CLUSAPI", .import = "AddClusterResourceNode", .signature = "\x00\x02\x09\x11\xb0\xdd\x11\xb0\xe9" } },
    .{ "RemoveClusterResourceNode", MethodRecord{ .library = "CLUSAPI", .import = "RemoveClusterResourceNode", .signature = "\x00\x02\x09\x11\xb0\xdd\x11\xb0\xe9" } },
    .{ "AddClusterResourceNodeEx", MethodRecord{ .library = "CLUSAPI", .import = "AddClusterResourceNodeEx", .signature = "\x00\x03\x09\x11\xb0\xdd\x11\xb0\xe9\x11\x05" } },
    .{ "RemoveClusterResourceNodeEx", MethodRecord{ .library = "CLUSAPI", .import = "RemoveClusterResourceNodeEx", .signature = "\x00\x03\x09\x11\xb0\xdd\x11\xb0\xe9\x11\x05" } },
    .{ "AddClusterResourceDependency", MethodRecord{ .library = "CLUSAPI", .import = "AddClusterResourceDependency", .signature = "\x00\x02\x09\x11\xb0\xdd\x11\xb0\xdd" } },
    .{ "RemoveClusterResourceDependency", MethodRecord{ .library = "CLUSAPI", .import = "RemoveClusterResourceDependency", .signature = "\x00\x02\x09\x11\xb0\xdd\x11\xb0\xdd" } },
    .{ "AddClusterResourceDependencyEx", MethodRecord{ .library = "CLUSAPI", .import = "AddClusterResourceDependencyEx", .signature = "\x00\x03\x09\x11\xb0\xdd\x11\xb0\xdd\x11\x05" } },
    .{ "RemoveClusterResourceDependencyEx", MethodRecord{ .library = "CLUSAPI", .import = "RemoveClusterResourceDependencyEx", .signature = "\x00\x03\x09\x11\xb0\xdd\x11\xb0\xdd\x11\x05" } },
    .{ "SetClusterResourceDependencyExpression", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterResourceDependencyExpression", .signature = "\x00\x02\x09\x11\xb0\xdd\x11\x05" } },
    .{ "GetClusterResourceDependencyExpression", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterResourceDependencyExpression", .signature = "\x00\x03\x09\x11\xb0\xdd\x11\x05\x0f\x09" } },
    .{ "AddResourceToClusterSharedVolumes", MethodRecord{ .library = "CLUSAPI", .import = "AddResourceToClusterSharedVolumes", .signature = "\x00\x01\x09\x11\xb0\xdd" } },
    .{ "RemoveResourceFromClusterSharedVolumes", MethodRecord{ .library = "CLUSAPI", .import = "RemoveResourceFromClusterSharedVolumes", .signature = "\x00\x01\x09\x11\xb0\xdd" } },
    .{ "IsFileOnClusterSharedVolume", MethodRecord{ .library = "CLUSAPI", .import = "IsFileOnClusterSharedVolume", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x59" } },
    .{ "ClusterSharedVolumeSetSnapshotState", MethodRecord{ .library = "CLUSAPI", .import = "ClusterSharedVolumeSetSnapshotState", .signature = "\x00\x03\x09\x11\x0d\x11\x05\x11\xb1\x4d" } },
    .{ "CanResourceBeDependent", MethodRecord{ .library = "CLUSAPI", .import = "CanResourceBeDependent", .signature = "\x00\x02\x11\x59\x11\xb0\xdd\x11\xb0\xdd" } },
    .{ "ClusterResourceControl", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceControl", .signature = "\x00\x08\x09\x11\xb0\xdd\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "ClusterResourceControlAsUser", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceControlAsUser", .signature = "\x00\x08\x09\x11\xb0\xdd\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "ClusterResourceTypeControl", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceTypeControl", .signature = "\x00\x09\x09\x11\xb0\xd5\x11\x05\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "ClusterResourceTypeControlAsUser", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceTypeControlAsUser", .signature = "\x00\x09\x09\x11\xb0\xd5\x11\x05\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "ClusterGroupControl", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupControl", .signature = "\x00\x08\x09\x11\xb1\x09\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "ClusterResourceControlEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceControlEx", .signature = "\x00\x09\x09\x11\xb0\xdd\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09\x11\x05" } },
    .{ "ClusterResourceControlAsUserEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceControlAsUserEx", .signature = "\x00\x09\x09\x11\xb0\xdd\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09\x11\x05" } },
    .{ "ClusterResourceTypeControlEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceTypeControlEx", .signature = "\x00\x0a\x09\x11\xb0\xd5\x11\x05\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09\x11\x05" } },
    .{ "ClusterResourceTypeControlAsUserEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceTypeControlAsUserEx", .signature = "\x00\x0a\x09\x11\xb0\xd5\x11\x05\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09\x11\x05" } },
    .{ "ClusterGroupControlEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterGroupControlEx", .signature = "\x00\x09\x09\x11\xb1\x09\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09\x11\x05" } },
    .{ "ClusterNodeControl", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNodeControl", .signature = "\x00\x08\x09\x11\xb0\xe9\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "ClusterNodeControlEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNodeControlEx", .signature = "\x00\x09\x09\x11\xb0\xe9\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09\x11\x05" } },
    .{ "GetClusterResourceNetworkName", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterResourceNetworkName", .signature = "\x00\x03\x11\x59\x11\xb0\xdd\x11\x05\x0f\x09" } },
    .{ "ClusterResourceOpenEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceOpenEnum", .signature = "\x00\x02\x11\xb1\x51\x11\xb0\xdd\x09" } },
    .{ "ClusterResourceGetEnumCount", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceGetEnumCount", .signature = "\x00\x01\x09\x11\xb1\x51" } },
    .{ "ClusterResourceEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceEnum", .signature = "\x00\x05\x09\x11\xb1\x51\x09\x0f\x09\x11\x05\x0f\x09" } },
    .{ "ClusterResourceCloseEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceCloseEnum", .signature = "\x00\x01\x09\x11\xb1\x51" } },
    .{ "CreateClusterResourceType", MethodRecord{ .library = "CLUSAPI", .import = "CreateClusterResourceType", .signature = "\x00\x06\x09\x11\xb0\xd5\x11\x05\x11\x05\x11\x05\x09\x09" } },
    .{ "DeleteClusterResourceType", MethodRecord{ .library = "CLUSAPI", .import = "DeleteClusterResourceType", .signature = "\x00\x02\x09\x11\xb0\xd5\x11\x05" } },
    .{ "CreateClusterResourceTypeEx", MethodRecord{ .library = "CLUSAPI", .import = "CreateClusterResourceTypeEx", .signature = "\x00\x07\x09\x11\xb0\xd5\x11\x05\x11\x05\x11\x05\x09\x09\x11\x05" } },
    .{ "DeleteClusterResourceTypeEx", MethodRecord{ .library = "CLUSAPI", .import = "DeleteClusterResourceTypeEx", .signature = "\x00\x03\x09\x11\xb0\xd5\x11\x05\x11\x05" } },
    .{ "ClusterResourceTypeOpenEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceTypeOpenEnum", .signature = "\x00\x03\x11\xb1\x55\x11\xb0\xd5\x11\x05\x09" } },
    .{ "ClusterResourceTypeGetEnumCount", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceTypeGetEnumCount", .signature = "\x00\x01\x09\x11\xb1\x55" } },
    .{ "ClusterResourceTypeEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceTypeEnum", .signature = "\x00\x05\x09\x11\xb1\x55\x09\x0f\x09\x11\x05\x0f\x09" } },
    .{ "ClusterResourceTypeCloseEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterResourceTypeCloseEnum", .signature = "\x00\x01\x09\x11\xb1\x55" } },
    .{ "OpenClusterNetwork", MethodRecord{ .library = "CLUSAPI", .import = "OpenClusterNetwork", .signature = "\x00\x02\x11\xb0\xe1\x11\xb0\xd5\x11\x05" } },
    .{ "OpenClusterNetworkEx", MethodRecord{ .library = "CLUSAPI", .import = "OpenClusterNetworkEx", .signature = "\x00\x04\x11\xb0\xe1\x11\xb0\xd5\x11\x05\x09\x0f\x09" } },
    .{ "CloseClusterNetwork", MethodRecord{ .library = "CLUSAPI", .import = "CloseClusterNetwork", .signature = "\x00\x01\x11\x59\x11\xb0\xe1" } },
    .{ "GetClusterFromNetwork", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterFromNetwork", .signature = "\x00\x01\x11\xb0\xd5\x11\xb0\xe1" } },
    .{ "ClusterNetworkOpenEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNetworkOpenEnum", .signature = "\x00\x02\x11\xb1\x59\x11\xb0\xe1\x09" } },
    .{ "ClusterNetworkGetEnumCount", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNetworkGetEnumCount", .signature = "\x00\x01\x09\x11\xb1\x59" } },
    .{ "ClusterNetworkEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNetworkEnum", .signature = "\x00\x05\x09\x11\xb1\x59\x09\x0f\x09\x11\x05\x0f\x09" } },
    .{ "ClusterNetworkCloseEnum", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNetworkCloseEnum", .signature = "\x00\x01\x09\x11\xb1\x59" } },
    .{ "GetClusterNetworkState", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterNetworkState", .signature = "\x00\x01\x11\xb1\x5d\x11\xb0\xe1" } },
    .{ "SetClusterNetworkName", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterNetworkName", .signature = "\x00\x02\x09\x11\xb0\xe1\x11\x05" } },
    .{ "SetClusterNetworkNameEx", MethodRecord{ .library = "CLUSAPI", .import = "SetClusterNetworkNameEx", .signature = "\x00\x03\x09\x11\xb0\xe1\x11\x05\x11\x05" } },
    .{ "GetClusterNetworkId", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterNetworkId", .signature = "\x00\x03\x09\x11\xb0\xe1\x11\x05\x0f\x09" } },
    .{ "ClusterNetworkControl", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNetworkControl", .signature = "\x00\x08\x09\x11\xb0\xe1\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "ClusterNetworkControlEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNetworkControlEx", .signature = "\x00\x09\x09\x11\xb0\xe1\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09\x11\x05" } },
    .{ "OpenClusterNetInterface", MethodRecord{ .library = "CLUSAPI", .import = "OpenClusterNetInterface", .signature = "\x00\x02\x11\xb1\x61\x11\xb0\xd5\x11\x05" } },
    .{ "OpenClusterNetInterfaceEx", MethodRecord{ .library = "CLUSAPI", .import = "OpenClusterNetInterfaceEx", .signature = "\x00\x04\x11\xb1\x61\x11\xb0\xd5\x11\x05\x09\x0f\x09" } },
    .{ "GetClusterNetInterface", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterNetInterface", .signature = "\x00\x05\x09\x11\xb0\xd5\x11\x05\x11\x05\x11\x05\x0f\x09" } },
    .{ "CloseClusterNetInterface", MethodRecord{ .library = "CLUSAPI", .import = "CloseClusterNetInterface", .signature = "\x00\x01\x11\x59\x11\xb1\x61" } },
    .{ "GetClusterFromNetInterface", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterFromNetInterface", .signature = "\x00\x01\x11\xb0\xd5\x11\xb1\x61" } },
    .{ "GetClusterNetInterfaceState", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterNetInterfaceState", .signature = "\x00\x01\x11\xb1\x65\x11\xb1\x61" } },
    .{ "ClusterNetInterfaceControl", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNetInterfaceControl", .signature = "\x00\x08\x09\x11\xb1\x61\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "ClusterNetInterfaceControlEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterNetInterfaceControlEx", .signature = "\x00\x09\x09\x11\xb1\x61\x11\xb0\xe9\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09\x11\x05" } },
    .{ "GetClusterKey", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterKey", .signature = "\x00\x02\x11\x55\x11\xb0\xd5\x09" } },
    .{ "GetClusterGroupKey", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterGroupKey", .signature = "\x00\x02\x11\x55\x11\xb1\x09\x09" } },
    .{ "GetClusterResourceKey", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterResourceKey", .signature = "\x00\x02\x11\x55\x11\xb0\xdd\x09" } },
    .{ "GetClusterNodeKey", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterNodeKey", .signature = "\x00\x02\x11\x55\x11\xb0\xe9\x09" } },
    .{ "GetClusterNetworkKey", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterNetworkKey", .signature = "\x00\x02\x11\x55\x11\xb0\xe1\x09" } },
    .{ "GetClusterNetInterfaceKey", MethodRecord{ .library = "CLUSAPI", .import = "GetClusterNetInterfaceKey", .signature = "\x00\x02\x11\x55\x11\xb1\x61\x09" } },
    .{ "ClusterRegCreateKey", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegCreateKey", .signature = "\x00\x07\x08\x11\x55\x11\x05\x09\x09\x0f\x11\x8b\xb5\x0f\x11\x55\x0f\x09" } },
    .{ "ClusterRegCreateKeyEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegCreateKeyEx", .signature = "\x00\x08\x08\x11\x55\x11\x05\x09\x09\x0f\x11\x8b\xb5\x0f\x11\x55\x0f\x09\x11\x05" } },
    .{ "ClusterRegOpenKey", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegOpenKey", .signature = "\x00\x04\x08\x11\x55\x11\x05\x09\x0f\x11\x55" } },
    .{ "ClusterRegDeleteKey", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegDeleteKey", .signature = "\x00\x02\x08\x11\x55\x11\x05" } },
    .{ "ClusterRegDeleteKeyEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegDeleteKeyEx", .signature = "\x00\x03\x08\x11\x55\x11\x05\x11\x05" } },
    .{ "ClusterRegCloseKey", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegCloseKey", .signature = "\x00\x01\x08\x11\x55" } },
    .{ "ClusterRegEnumKey", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegEnumKey", .signature = "\x00\x05\x08\x11\x55\x09\x11\x05\x0f\x09\x0f\x11\x80\x9d" } },
    .{ "ClusterRegSetValue", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegSetValue", .signature = "\x00\x05\x09\x11\x55\x11\x05\x09\x0f\x05\x09" } },
    .{ "ClusterRegDeleteValue", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegDeleteValue", .signature = "\x00\x02\x09\x11\x55\x11\x05" } },
    .{ "ClusterRegSetValueEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegSetValueEx", .signature = "\x00\x06\x09\x11\x55\x11\x05\x09\x0f\x05\x09\x11\x05" } },
    .{ "ClusterRegDeleteValueEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegDeleteValueEx", .signature = "\x00\x03\x09\x11\x55\x11\x05\x11\x05" } },
    .{ "ClusterRegQueryValue", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegQueryValue", .signature = "\x00\x05\x08\x11\x55\x11\x05\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "ClusterRegEnumValue", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegEnumValue", .signature = "\x00\x07\x09\x11\x55\x09\x11\x05\x0f\x09\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "ClusterRegQueryInfoKey", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegQueryInfoKey", .signature = "\x00\x08\x08\x11\x55\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x11\x80\x9d" } },
    .{ "ClusterRegGetKeySecurity", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegGetKeySecurity", .signature = "\x00\x04\x08\x11\x55\x09\x11\x82\xad\x0f\x09" } },
    .{ "ClusterRegSetKeySecurity", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegSetKeySecurity", .signature = "\x00\x03\x08\x11\x55\x09\x11\x82\xad" } },
    .{ "ClusterRegSetKeySecurityEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegSetKeySecurityEx", .signature = "\x00\x04\x08\x11\x55\x11\x84\xf9\x11\x82\xad\x11\x05" } },
    .{ "ClusterRegSyncDatabase", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegSyncDatabase", .signature = "\x00\x02\x08\x11\xb0\xd5\x09" } },
    .{ "ClusterRegCreateBatch", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegCreateBatch", .signature = "\x00\x02\x08\x11\x55\x0f\x11\xb1\x69" } },
    .{ "ClusterRegBatchAddCommand", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegBatchAddCommand", .signature = "\x00\x06\x08\x11\xb1\x69\x11\xb1\x6d\x11\x05\x09\x0f\x01\x09" } },
    .{ "ClusterRegCloseBatch", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegCloseBatch", .signature = "\x00\x03\x08\x11\xb1\x69\x11\x59\x0f\x08" } },
    .{ "ClusterRegCloseBatchEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegCloseBatchEx", .signature = "\x00\x03\x08\x11\xb1\x69\x09\x0f\x08" } },
    .{ "ClusterRegBatchReadCommand", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegBatchReadCommand", .signature = "\x00\x02\x08\x11\xb1\x71\x0f\x11\xb1\x75" } },
    .{ "ClusterRegBatchCloseNotification", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegBatchCloseNotification", .signature = "\x00\x01\x08\x11\xb1\x71" } },
    .{ "ClusterRegCreateBatchNotifyPort", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegCreateBatchNotifyPort", .signature = "\x00\x02\x08\x11\x55\x0f\x11\xb1\x79" } },
    .{ "ClusterRegCloseBatchNotifyPort", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegCloseBatchNotifyPort", .signature = "\x00\x01\x08\x11\xb1\x79" } },
    .{ "ClusterRegGetBatchNotification", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegGetBatchNotification", .signature = "\x00\x02\x08\x11\xb1\x79\x0f\x11\xb1\x71" } },
    .{ "ClusterRegCreateReadBatch", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegCreateReadBatch", .signature = "\x00\x02\x08\x11\x55\x0f\x11\xb1\x7d" } },
    .{ "ClusterRegReadBatchAddCommand", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegReadBatchAddCommand", .signature = "\x00\x03\x08\x11\xb1\x7d\x11\x05\x11\x05" } },
    .{ "ClusterRegCloseReadBatch", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegCloseReadBatch", .signature = "\x00\x02\x08\x11\xb1\x7d\x0f\x11\xb1\x81" } },
    .{ "ClusterRegCloseReadBatchEx", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegCloseReadBatchEx", .signature = "\x00\x03\x08\x11\xb1\x7d\x09\x0f\x11\xb1\x81" } },
    .{ "ClusterRegReadBatchReplyNextCommand", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegReadBatchReplyNextCommand", .signature = "\x00\x02\x08\x11\xb1\x81\x0f\x11\xb1\x85" } },
    .{ "ClusterRegCloseReadBatchReply", MethodRecord{ .library = "CLUSAPI", .import = "ClusterRegCloseReadBatchReply", .signature = "\x00\x01\x08\x11\xb1\x81" } },
    .{ "ClusterSetAccountAccess", MethodRecord{ .library = "CLUSAPI", .import = "ClusterSetAccountAccess", .signature = "\x00\x04\x09\x11\xb0\xd5\x11\x05\x09\x09" } },
    .{ "CreateCluster", MethodRecord{ .library = "CLUSAPI", .import = "CreateCluster", .signature = "\x00\x03\x11\xb0\xd5\x0f\x11\xb1\x89\x12\xb1\x8d\x0f\x01" } },
    .{ "CreateClusterNameAccount", MethodRecord{ .library = "CLUSAPI", .import = "CreateClusterNameAccount", .signature = "\x00\x04\x09\x11\xb0\xd5\x0f\x11\xb1\x91\x12\xb1\x8d\x0f\x01" } },
    .{ "RemoveClusterNameAccount", MethodRecord{ .library = "CLUSAPI", .import = "RemoveClusterNameAccount", .signature = "\x00\x02\x09\x11\xb0\xd5\x11\x59" } },
    .{ "RepairClusterNameAccount", MethodRecord{ .library = "CLUSAPI", .import = "RepairClusterNameAccount", .signature = "\x00\x04\x09\x11\xb0\xd5\x0f\x11\xb1\x95\x12\xb1\x8d\x0f\x01" } },
    .{ "DetermineCNOResTypeFromNodelist", MethodRecord{ .library = "CLUSAPI", .import = "DetermineCNOResTypeFromNodelist", .signature = "\x00\x03\x09\x09\x0f\x11\x05\x0f\x11\xb1\x99" } },
    .{ "DetermineCNOResTypeFromCluster", MethodRecord{ .library = "CLUSAPI", .import = "DetermineCNOResTypeFromCluster", .signature = "\x00\x02\x09\x11\xb0\xd5\x0f\x11\xb1\x99" } },
    .{ "DetermineClusterCloudTypeFromNodelist", MethodRecord{ .library = "CLUSAPI", .import = "DetermineClusterCloudTypeFromNodelist", .signature = "\x00\x03\x09\x09\x0f\x11\x05\x0f\x11\xb1\x9d" } },
    .{ "DetermineClusterCloudTypeFromCluster", MethodRecord{ .library = "CLUSAPI", .import = "DetermineClusterCloudTypeFromCluster", .signature = "\x00\x02\x09\x11\xb0\xd5\x0f\x11\xb1\x9d" } },
    .{ "GetNodeCloudTypeDW", MethodRecord{ .library = "CLUSAPI", .import = "GetNodeCloudTypeDW", .signature = "\x00\x02\x09\x11\x05\x0f\x09" } },
    .{ "RegisterClusterResourceTypeNotifyV2", MethodRecord{ .library = "CLUSAPI", .import = "RegisterClusterResourceTypeNotifyV2", .signature = "\x00\x05\x09\x11\xb0\xf1\x11\xb0\xd5\x0a\x11\x05\x19" } },
    .{ "AddClusterNode", MethodRecord{ .library = "CLUSAPI", .import = "AddClusterNode", .signature = "\x00\x04\x11\xb0\xe9\x11\xb0\xd5\x11\x05\x12\xb1\x8d\x0f\x01" } },
    .{ "AddClusterStorageNode", MethodRecord{ .library = "CLUSAPI", .import = "AddClusterStorageNode", .signature = "\x00\x06\x09\x11\xb0\xd5\x11\x05\x12\xb1\x8d\x0f\x01\x11\x05\x11\x05" } },
    .{ "AddClusterNodeEx", MethodRecord{ .library = "CLUSAPI", .import = "AddClusterNodeEx", .signature = "\x00\x05\x11\xb0\xe9\x11\xb0\xd5\x11\x05\x09\x12\xb1\x8d\x0f\x01" } },
    .{ "RemoveClusterStorageNode", MethodRecord{ .library = "CLUSAPI", .import = "RemoveClusterStorageNode", .signature = "\x00\x04\x09\x11\xb0\xd5\x11\x05\x09\x09" } },
    .{ "DestroyCluster", MethodRecord{ .library = "CLUSAPI", .import = "DestroyCluster", .signature = "\x00\x04\x09\x11\xb0\xd5\x12\xb1\x8d\x0f\x01\x11\x59" } },
    .{ "InitializeClusterHealthFault", MethodRecord{ .library = "RESUTILS", .import = "InitializeClusterHealthFault", .signature = "\x00\x01\x09\x0f\x11\xb1\xa1" } },
    .{ "InitializeClusterHealthFaultArray", MethodRecord{ .library = "RESUTILS", .import = "InitializeClusterHealthFaultArray", .signature = "\x00\x01\x09\x0f\x11\xb1\xa5" } },
    .{ "FreeClusterHealthFault", MethodRecord{ .library = "RESUTILS", .import = "FreeClusterHealthFault", .signature = "\x00\x01\x09\x0f\x11\xb1\xa1" } },
    .{ "FreeClusterHealthFaultArray", MethodRecord{ .library = "RESUTILS", .import = "FreeClusterHealthFaultArray", .signature = "\x00\x01\x09\x0f\x11\xb1\xa5" } },
    .{ "ClusGetClusterHealthFaults", MethodRecord{ .library = "RESUTILS", .import = "ClusGetClusterHealthFaults", .signature = "\x00\x03\x09\x11\xb0\xd5\x0f\x11\xb1\xa5\x09" } },
    .{ "ClusRemoveClusterHealthFault", MethodRecord{ .library = "RESUTILS", .import = "ClusRemoveClusterHealthFault", .signature = "\x00\x03\x09\x11\xb0\xd5\x11\x05\x09" } },
    .{ "ClusAddClusterHealthFault", MethodRecord{ .library = "RESUTILS", .import = "ClusAddClusterHealthFault", .signature = "\x00\x03\x09\x11\xb0\xd5\x0f\x11\xb1\xa1\x09" } },
    .{ "ResUtilStartResourceService", MethodRecord{ .library = "RESUTILS", .import = "ResUtilStartResourceService", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x9d\xb5" } },
    .{ "ResUtilVerifyResourceService", MethodRecord{ .library = "RESUTILS", .import = "ResUtilVerifyResourceService", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "ResUtilStopResourceService", MethodRecord{ .library = "RESUTILS", .import = "ResUtilStopResourceService", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "ResUtilVerifyService", MethodRecord{ .library = "RESUTILS", .import = "ResUtilVerifyService", .signature = "\x00\x01\x09\x11\x9d\xb5" } },
    .{ "ResUtilStopService", MethodRecord{ .library = "RESUTILS", .import = "ResUtilStopService", .signature = "\x00\x01\x09\x11\x9d\xb5" } },
    .{ "ResUtilCreateDirectoryTree", MethodRecord{ .library = "RESUTILS", .import = "ResUtilCreateDirectoryTree", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "ResUtilIsPathValid", MethodRecord{ .library = "RESUTILS", .import = "ResUtilIsPathValid", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "ResUtilEnumProperties", MethodRecord{ .library = "RESUTILS", .import = "ResUtilEnumProperties", .signature = "\x00\x05\x09\x0f\x11\xb1\xa9\x11\x05\x09\x0f\x09\x0f\x09" } },
    .{ "ResUtilEnumPrivateProperties", MethodRecord{ .library = "RESUTILS", .import = "ResUtilEnumPrivateProperties", .signature = "\x00\x05\x09\x11\x55\x11\x05\x09\x0f\x09\x0f\x09" } },
    .{ "ResUtilGetProperties", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetProperties", .signature = "\x00\x06\x09\x11\x55\x0f\x11\xb1\xa9\x0f\x01\x09\x0f\x09\x0f\x09" } },
    .{ "ResUtilGetAllProperties", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetAllProperties", .signature = "\x00\x06\x09\x11\x55\x0f\x11\xb1\xa9\x0f\x01\x09\x0f\x09\x0f\x09" } },
    .{ "ResUtilGetPrivateProperties", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetPrivateProperties", .signature = "\x00\x05\x09\x11\x55\x0f\x01\x09\x0f\x09\x0f\x09" } },
    .{ "ResUtilGetPropertySize", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetPropertySize", .signature = "\x00\x04\x09\x11\x55\x0f\x11\xb1\xa9\x0f\x09\x0f\x09" } },
    .{ "ResUtilGetProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetProperty", .signature = "\x00\x04\x09\x11\x55\x0f\x11\xb1\xa9\x0f\x0f\x01\x0f\x09" } },
    .{ "ResUtilVerifyPropertyTable", MethodRecord{ .library = "RESUTILS", .import = "ResUtilVerifyPropertyTable", .signature = "\x00\x06\x09\x0f\x11\xb1\xa9\x0f\x01\x11\x59\x0f\x01\x09\x0f\x05" } },
    .{ "ResUtilSetPropertyTable", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetPropertyTable", .signature = "\x00\x07\x09\x11\x55\x0f\x11\xb1\xa9\x0f\x01\x11\x59\x0f\x01\x09\x0f\x05" } },
    .{ "ResUtilSetPropertyTableEx", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetPropertyTableEx", .signature = "\x00\x08\x09\x11\x55\x0f\x11\xb1\xa9\x0f\x01\x11\x59\x0f\x01\x09\x11\x59\x0f\x05" } },
    .{ "ResUtilSetPropertyParameterBlock", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetPropertyParameterBlock", .signature = "\x00\x07\x09\x11\x55\x0f\x11\xb1\xa9\x0f\x01\x0f\x05\x0f\x01\x09\x0f\x05" } },
    .{ "ResUtilSetPropertyParameterBlockEx", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetPropertyParameterBlockEx", .signature = "\x00\x08\x09\x11\x55\x0f\x11\xb1\xa9\x0f\x01\x0f\x05\x0f\x01\x09\x11\x59\x0f\x05" } },
    .{ "ResUtilSetUnknownProperties", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetUnknownProperties", .signature = "\x00\x04\x09\x11\x55\x0f\x11\xb1\xa9\x0f\x01\x09" } },
    .{ "ResUtilGetPropertiesToParameterBlock", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetPropertiesToParameterBlock", .signature = "\x00\x05\x09\x11\x55\x0f\x11\xb1\xa9\x0f\x05\x11\x59\x0f\x11\x05" } },
    .{ "ResUtilPropertyListFromParameterBlock", MethodRecord{ .library = "RESUTILS", .import = "ResUtilPropertyListFromParameterBlock", .signature = "\x00\x06\x09\x0f\x11\xb1\xa9\x0f\x01\x0f\x09\x0f\x05\x0f\x09\x0f\x09" } },
    .{ "ResUtilDupParameterBlock", MethodRecord{ .library = "RESUTILS", .import = "ResUtilDupParameterBlock", .signature = "\x00\x03\x09\x0f\x05\x0f\x05\x0f\x11\xb1\xa9" } },
    .{ "ResUtilFreeParameterBlock", MethodRecord{ .library = "RESUTILS", .import = "ResUtilFreeParameterBlock", .signature = "\x00\x03\x01\x0f\x05\x0f\x05\x0f\x11\xb1\xa9" } },
    .{ "ResUtilAddUnknownProperties", MethodRecord{ .library = "RESUTILS", .import = "ResUtilAddUnknownProperties", .signature = "\x00\x06\x09\x11\x55\x0f\x11\xb1\xa9\x0f\x01\x09\x0f\x09\x0f\x09" } },
    .{ "ResUtilSetPrivatePropertyList", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetPrivatePropertyList", .signature = "\x00\x03\x09\x11\x55\x0f\x01\x09" } },
    .{ "ResUtilVerifyPrivatePropertyList", MethodRecord{ .library = "RESUTILS", .import = "ResUtilVerifyPrivatePropertyList", .signature = "\x00\x02\x09\x0f\x01\x09" } },
    .{ "ResUtilDupString", MethodRecord{ .library = "RESUTILS", .import = "ResUtilDupString", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "ResUtilGetBinaryValue", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetBinaryValue", .signature = "\x00\x04\x09\x11\x55\x11\x05\x0f\x0f\x05\x0f\x09" } },
    .{ "ResUtilGetSzValue", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetSzValue", .signature = "\x00\x02\x11\x05\x11\x55\x11\x05" } },
    .{ "ResUtilGetDwordValue", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetDwordValue", .signature = "\x00\x04\x09\x11\x55\x11\x05\x0f\x09\x09" } },
    .{ "ResUtilGetQwordValue", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetQwordValue", .signature = "\x00\x04\x09\x11\x55\x11\x05\x0f\x0b\x0b" } },
    .{ "ResUtilSetBinaryValue", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetBinaryValue", .signature = "\x00\x06\x09\x11\x55\x11\x05\x0f\x05\x09\x0f\x0f\x05\x0f\x09" } },
    .{ "ResUtilSetSzValue", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetSzValue", .signature = "\x00\x04\x09\x11\x55\x11\x05\x11\x05\x0f\x11\x05" } },
    .{ "ResUtilSetExpandSzValue", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetExpandSzValue", .signature = "\x00\x04\x09\x11\x55\x11\x05\x11\x05\x0f\x11\x05" } },
    .{ "ResUtilSetMultiSzValue", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetMultiSzValue", .signature = "\x00\x06\x09\x11\x55\x11\x05\x11\x05\x09\x0f\x11\x05\x0f\x09" } },
    .{ "ResUtilSetDwordValue", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetDwordValue", .signature = "\x00\x04\x09\x11\x55\x11\x05\x09\x0f\x09" } },
    .{ "ResUtilSetQwordValue", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetQwordValue", .signature = "\x00\x04\x09\x11\x55\x11\x05\x0b\x0f\x0b" } },
    .{ "ResUtilSetValueEx", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetValueEx", .signature = "\x00\x06\x09\x11\x55\x11\x05\x09\x0f\x05\x09\x09" } },
    .{ "ResUtilGetBinaryProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetBinaryProperty", .signature = "\x00\x07\x09\x0f\x0f\x05\x0f\x09\x0f\x11\xb1\xad\x0f\x05\x09\x0f\x0f\x05\x0f\x09" } },
    .{ "ResUtilGetSzProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetSzProperty", .signature = "\x00\x05\x09\x0f\x11\x05\x0f\x11\xb1\xb1\x11\x05\x0f\x0f\x05\x0f\x09" } },
    .{ "ResUtilGetMultiSzProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetMultiSzProperty", .signature = "\x00\x07\x09\x0f\x11\x05\x0f\x09\x0f\x11\xb1\xb1\x11\x05\x09\x0f\x0f\x05\x0f\x09" } },
    .{ "ResUtilGetDwordProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetDwordProperty", .signature = "\x00\x07\x09\x0f\x09\x0f\x11\xb1\xb5\x09\x09\x09\x0f\x0f\x05\x0f\x09" } },
    .{ "ResUtilGetLongProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetLongProperty", .signature = "\x00\x07\x09\x0f\x08\x0f\x11\xb1\xb9\x08\x08\x08\x0f\x0f\x05\x0f\x09" } },
    .{ "ResUtilGetFileTimeProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetFileTimeProperty", .signature = "\x00\x07\x09\x0f\x11\x80\x9d\x0f\x11\xb1\xbd\x11\x80\x9d\x11\x80\x9d\x11\x80\x9d\x0f\x0f\x05\x0f\x09" } },
    .{ "ResUtilGetEnvironmentWithNetName", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetEnvironmentWithNetName", .signature = "\x00\x01\x0f\x01\x11\xb0\xdd" } },
    .{ "ResUtilFreeEnvironment", MethodRecord{ .library = "RESUTILS", .import = "ResUtilFreeEnvironment", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "ResUtilExpandEnvironmentStrings", MethodRecord{ .library = "RESUTILS", .import = "ResUtilExpandEnvironmentStrings", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "ResUtilSetResourceServiceEnvironment", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetResourceServiceEnvironment", .signature = "\x00\x04\x09\x11\x05\x11\xb0\xdd\x12\xb1\xc1\x18" } },
    .{ "ResUtilRemoveResourceServiceEnvironment", MethodRecord{ .library = "RESUTILS", .import = "ResUtilRemoveResourceServiceEnvironment", .signature = "\x00\x03\x09\x11\x05\x12\xb1\xc1\x18" } },
    .{ "ResUtilSetResourceServiceStartParameters", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetResourceServiceStartParameters", .signature = "\x00\x05\x09\x11\x05\x11\x9d\xb5\x0f\x11\x9d\xb5\x12\xb1\xc1\x18" } },
    .{ "ResUtilFindSzProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilFindSzProperty", .signature = "\x00\x04\x09\x0f\x01\x09\x11\x05\x0f\x11\x05" } },
    .{ "ResUtilFindExpandSzProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilFindExpandSzProperty", .signature = "\x00\x04\x09\x0f\x01\x09\x11\x05\x0f\x11\x05" } },
    .{ "ResUtilFindExpandedSzProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilFindExpandedSzProperty", .signature = "\x00\x04\x09\x0f\x01\x09\x11\x05\x0f\x11\x05" } },
    .{ "ResUtilFindDwordProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilFindDwordProperty", .signature = "\x00\x04\x09\x0f\x01\x09\x11\x05\x0f\x09" } },
    .{ "ResUtilFindBinaryProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilFindBinaryProperty", .signature = "\x00\x05\x09\x0f\x01\x09\x11\x05\x0f\x0f\x05\x0f\x09" } },
    .{ "ResUtilFindMultiSzProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilFindMultiSzProperty", .signature = "\x00\x05\x09\x0f\x01\x09\x11\x05\x0f\x11\x05\x0f\x09" } },
    .{ "ResUtilFindLongProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilFindLongProperty", .signature = "\x00\x04\x09\x0f\x01\x09\x11\x05\x0f\x08" } },
    .{ "ResUtilFindULargeIntegerProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilFindULargeIntegerProperty", .signature = "\x00\x04\x09\x0f\x01\x09\x11\x05\x0f\x0b" } },
    .{ "ResUtilFindFileTimeProperty", MethodRecord{ .library = "RESUTILS", .import = "ResUtilFindFileTimeProperty", .signature = "\x00\x04\x09\x0f\x01\x09\x11\x05\x0f\x11\x80\x9d" } },
    .{ "ClusWorkerCreate", MethodRecord{ .library = "RESUTILS", .import = "ClusWorkerCreate", .signature = "\x00\x03\x09\x0f\x11\xb1\xc5\x12\xb1\xc9\x0f\x01" } },
    .{ "ClusWorkerCheckTerminate", MethodRecord{ .library = "RESUTILS", .import = "ClusWorkerCheckTerminate", .signature = "\x00\x01\x11\x59\x0f\x11\xb1\xc5" } },
    .{ "ClusWorkerTerminate", MethodRecord{ .library = "RESUTILS", .import = "ClusWorkerTerminate", .signature = "\x00\x01\x01\x0f\x11\xb1\xc5" } },
    .{ "ClusWorkerTerminateEx", MethodRecord{ .library = "RESUTILS", .import = "ClusWorkerTerminateEx", .signature = "\x00\x03\x09\x0f\x11\xb1\xc5\x09\x11\x59" } },
    .{ "ClusWorkersTerminate", MethodRecord{ .library = "RESUTILS", .import = "ClusWorkersTerminate", .signature = "\x00\x04\x09\x0f\x0f\x11\xb1\xc5\x19\x09\x11\x59" } },
    .{ "ResUtilResourcesEqual", MethodRecord{ .library = "RESUTILS", .import = "ResUtilResourcesEqual", .signature = "\x00\x02\x11\x59\x11\xb0\xdd\x11\xb0\xdd" } },
    .{ "ResUtilResourceTypesEqual", MethodRecord{ .library = "RESUTILS", .import = "ResUtilResourceTypesEqual", .signature = "\x00\x02\x11\x59\x11\x05\x11\xb0\xdd" } },
    .{ "ResUtilIsResourceClassEqual", MethodRecord{ .library = "RESUTILS", .import = "ResUtilIsResourceClassEqual", .signature = "\x00\x02\x11\x59\x0f\x11\x96\x91\x11\xb0\xdd" } },
    .{ "ResUtilEnumResources", MethodRecord{ .library = "RESUTILS", .import = "ResUtilEnumResources", .signature = "\x00\x04\x09\x11\xb0\xdd\x11\x05\x12\xb1\xcd\x0f\x01" } },
    .{ "ResUtilEnumResourcesEx", MethodRecord{ .library = "RESUTILS", .import = "ResUtilEnumResourcesEx", .signature = "\x00\x05\x09\x11\xb0\xd5\x11\xb0\xdd\x11\x05\x12\xb1\xd1\x0f\x01" } },
    .{ "ResUtilGetResourceDependency", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetResourceDependency", .signature = "\x00\x02\x11\xb0\xdd\x11\x80\x85\x11\x05" } },
    .{ "ResUtilGetResourceDependencyByName", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetResourceDependencyByName", .signature = "\x00\x04\x11\xb0\xdd\x11\xb0\xd5\x11\x80\x85\x11\x05\x11\x59" } },
    .{ "ResUtilGetResourceDependencyByClass", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetResourceDependencyByClass", .signature = "\x00\x04\x11\xb0\xdd\x11\xb0\xd5\x11\x80\x85\x0f\x11\x96\x91\x11\x59" } },
    .{ "ResUtilGetResourceNameDependency", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetResourceNameDependency", .signature = "\x00\x02\x11\xb0\xdd\x11\x05\x11\x05" } },
    .{ "ResUtilGetResourceDependentIPAddressProps", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetResourceDependentIPAddressProps", .signature = "\x00\x07\x09\x11\xb0\xdd\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09" } },
    .{ "ResUtilFindDependentDiskResourceDriveLetter", MethodRecord{ .library = "RESUTILS", .import = "ResUtilFindDependentDiskResourceDriveLetter", .signature = "\x00\x04\x09\x11\xb0\xd5\x11\xb0\xdd\x11\x05\x0f\x09" } },
    .{ "ResUtilTerminateServiceProcessFromResDll", MethodRecord{ .library = "RESUTILS", .import = "ResUtilTerminateServiceProcessFromResDll", .signature = "\x00\x05\x09\x09\x11\x59\x0f\x09\x12\xb1\xc1\x18" } },
    .{ "ResUtilGetPropertyFormats", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetPropertyFormats", .signature = "\x00\x05\x09\x0f\x11\xb1\xa9\x0f\x01\x09\x0f\x09\x0f\x09" } },
    .{ "ResUtilGetCoreClusterResources", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetCoreClusterResources", .signature = "\x00\x04\x09\x11\xb0\xd5\x0f\x11\xb0\xdd\x0f\x11\xb0\xdd\x0f\x11\xb0\xdd" } },
    .{ "ResUtilGetResourceName", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetResourceName", .signature = "\x00\x03\x09\x11\xb0\xdd\x11\x05\x0f\x09" } },
    .{ "ResUtilGetClusterRoleState", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetClusterRoleState", .signature = "\x00\x02\x11\xb1\xd5\x11\xb0\xd5\x11\xb1\xd9" } },
    .{ "ClusterIsPathOnSharedVolume", MethodRecord{ .library = "RESUTILS", .import = "ClusterIsPathOnSharedVolume", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "ClusterGetVolumePathName", MethodRecord{ .library = "RESUTILS", .import = "ClusterGetVolumePathName", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x09" } },
    .{ "ClusterGetVolumeNameForVolumeMountPoint", MethodRecord{ .library = "RESUTILS", .import = "ClusterGetVolumeNameForVolumeMountPoint", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x09" } },
    .{ "ClusterPrepareSharedVolumeForBackup", MethodRecord{ .library = "RESUTILS", .import = "ClusterPrepareSharedVolumeForBackup", .signature = "\x00\x05\x09\x11\x05\x11\x05\x0f\x09\x11\x05\x0f\x09" } },
    .{ "ClusterClearBackupStateForSharedVolume", MethodRecord{ .library = "RESUTILS", .import = "ClusterClearBackupStateForSharedVolume", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "ResUtilSetResourceServiceStartParametersEx", MethodRecord{ .library = "RESUTILS", .import = "ResUtilSetResourceServiceStartParametersEx", .signature = "\x00\x06\x09\x11\x05\x11\x9d\xb5\x0f\x11\x9d\xb5\x09\x12\xb1\xc1\x18" } },
    .{ "ResUtilEnumResourcesEx2", MethodRecord{ .library = "RESUTILS", .import = "ResUtilEnumResourcesEx2", .signature = "\x00\x06\x09\x11\xb0\xd5\x11\xb0\xdd\x11\x05\x12\xb1\xd1\x0f\x01\x09" } },
    .{ "ResUtilGetResourceDependencyEx", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetResourceDependencyEx", .signature = "\x00\x03\x11\xb0\xdd\x11\x80\x85\x11\x05\x09" } },
    .{ "ResUtilGetResourceDependencyByNameEx", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetResourceDependencyByNameEx", .signature = "\x00\x05\x11\xb0\xdd\x11\xb0\xd5\x11\x80\x85\x11\x05\x11\x59\x09" } },
    .{ "ResUtilGetResourceDependencyByClassEx", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetResourceDependencyByClassEx", .signature = "\x00\x05\x11\xb0\xdd\x11\xb0\xd5\x11\x80\x85\x0f\x11\x96\x91\x11\x59\x09" } },
    .{ "ResUtilGetResourceNameDependencyEx", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetResourceNameDependencyEx", .signature = "\x00\x03\x11\xb0\xdd\x11\x05\x11\x05\x09" } },
    .{ "ResUtilGetCoreClusterResourcesEx", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetCoreClusterResourcesEx", .signature = "\x00\x04\x09\x11\xb0\xd5\x0f\x11\xb0\xdd\x0f\x11\xb0\xdd\x09" } },
    .{ "OpenClusterCryptProvider", MethodRecord{ .library = "RESUTILS", .import = "OpenClusterCryptProvider", .signature = "\x00\x04\x11\xb1\xdd\x11\x05\x0f\x04\x09\x09" } },
    .{ "OpenClusterCryptProviderEx", MethodRecord{ .library = "RESUTILS", .import = "OpenClusterCryptProviderEx", .signature = "\x00\x05\x11\xb1\xdd\x11\x05\x11\x05\x0f\x04\x09\x09" } },
    .{ "CloseClusterCryptProvider", MethodRecord{ .library = "RESUTILS", .import = "CloseClusterCryptProvider", .signature = "\x00\x01\x09\x11\xb1\xdd" } },
    .{ "ClusterEncrypt", MethodRecord{ .library = "RESUTILS", .import = "ClusterEncrypt", .signature = "\x00\x05\x09\x11\xb1\xdd\x0f\x05\x09\x0f\x0f\x05\x0f\x09" } },
    .{ "ClusterDecrypt", MethodRecord{ .library = "RESUTILS", .import = "ClusterDecrypt", .signature = "\x00\x05\x09\x11\xb1\xdd\x0f\x05\x09\x0f\x0f\x05\x0f\x09" } },
    .{ "FreeClusterCrypt", MethodRecord{ .library = "RESUTILS", .import = "FreeClusterCrypt", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "ResUtilVerifyShutdownSafe", MethodRecord{ .library = "RESUTILS", .import = "ResUtilVerifyShutdownSafe", .signature = "\x00\x03\x09\x09\x09\x0f\x09" } },
    .{ "ResUtilPaxosComparer", MethodRecord{ .library = "RESUTILS", .import = "ResUtilPaxosComparer", .signature = "\x00\x02\x11\x59\x0f\x11\xb1\xe1\x0f\x11\xb1\xe1" } },
    .{ "ResUtilLeftPaxosIsLessThanRight", MethodRecord{ .library = "RESUTILS", .import = "ResUtilLeftPaxosIsLessThanRight", .signature = "\x00\x02\x11\x59\x0f\x11\xb1\xe1\x0f\x11\xb1\xe1" } },
    .{ "ResUtilsDeleteKeyTree", MethodRecord{ .library = "RESUTILS", .import = "ResUtilsDeleteKeyTree", .signature = "\x00\x03\x09\x11\x55\x11\x05\x11\x59" } },
    .{ "ResUtilGroupsEqual", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGroupsEqual", .signature = "\x00\x03\x09\x11\xb1\x09\x11\xb1\x09\x0f\x11\x59" } },
    .{ "ResUtilEnumGroups", MethodRecord{ .library = "RESUTILS", .import = "ResUtilEnumGroups", .signature = "\x00\x04\x09\x11\xb0\xd5\x11\xb1\x09\x12\xb1\xe5\x0f\x01" } },
    .{ "ResUtilEnumGroupsEx", MethodRecord{ .library = "RESUTILS", .import = "ResUtilEnumGroupsEx", .signature = "\x00\x05\x09\x11\xb0\xd5\x11\xb1\x09\x11\xb1\xe9\x12\xb1\xe5\x0f\x01" } },
    .{ "ResUtilDupGroup", MethodRecord{ .library = "RESUTILS", .import = "ResUtilDupGroup", .signature = "\x00\x02\x09\x11\xb1\x09\x0f\x11\xb1\x09" } },
    .{ "ResUtilGetClusterGroupType", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetClusterGroupType", .signature = "\x00\x02\x09\x11\xb1\x09\x0f\x11\xb1\xe9" } },
    .{ "ResUtilGetCoreGroup", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetCoreGroup", .signature = "\x00\x01\x11\xb1\x09\x11\xb0\xd5" } },
    .{ "ResUtilResourceDepEnum", MethodRecord{ .library = "RESUTILS", .import = "ResUtilResourceDepEnum", .signature = "\x00\x04\x09\x11\xb0\xdd\x09\x12\xb1\xd1\x0f\x01" } },
    .{ "ResUtilDupResource", MethodRecord{ .library = "RESUTILS", .import = "ResUtilDupResource", .signature = "\x00\x02\x09\x11\xb0\xdd\x0f\x11\xb0\xdd" } },
    .{ "ResUtilGetClusterId", MethodRecord{ .library = "RESUTILS", .import = "ResUtilGetClusterId", .signature = "\x00\x02\x09\x11\xb0\xd5\x0f\x11\x0d" } },
    .{ "ResUtilNodeEnum", MethodRecord{ .library = "RESUTILS", .import = "ResUtilNodeEnum", .signature = "\x00\x03\x09\x11\xb0\xd5\x12\xb1\xed\x0f\x01" } },
    .{ "RegisterAppInstance", MethodRecord{ .library = "NTLANMAN", .import = "RegisterAppInstance", .signature = "\x00\x03\x09\x11\x80\x85\x0f\x11\x0d\x11\x59" } },
    .{ "RegisterAppInstanceVersion", MethodRecord{ .library = "NTLANMAN", .import = "RegisterAppInstanceVersion", .signature = "\x00\x03\x09\x0f\x11\x0d\x0b\x0b" } },
    .{ "QueryAppInstanceVersion", MethodRecord{ .library = "NTLANMAN", .import = "QueryAppInstanceVersion", .signature = "\x00\x04\x09\x0f\x11\x0d\x0f\x0b\x0f\x0b\x0f\x11\x84\x71" } },
    .{ "ResetAllAppInstanceVersions", MethodRecord{ .library = "NTLANMAN", .import = "ResetAllAppInstanceVersions", .signature = "\x00\x00\x09" } },
    .{ "SetAppInstanceCsvFlags", MethodRecord{ .library = "NTLANMAN", .import = "SetAppInstanceCsvFlags", .signature = "\x00\x03\x09\x11\x80\x85\x09\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x55 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "HKEY" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x471 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "NTSTATUS" },
        0x4f9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "OBJECT_SECURITY_INFORMATION" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0x1691 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUS_RESOURCE_CLASS_INFO" },
        0x1db5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Services", .name = "SC_HANDLE" },
        0x30d1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSAPI_REASON_HANDLER" },
        0x30d5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HCLUSTER" },
        0x30d9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTERVERSIONINFO" },
        0x30dd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HRESOURCE" },
        0x30e1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HNETWORK" },
        0x30e5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_SET_PASSWORD_STATUS" },
        0x30e9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HNODE" },
        0x30ed => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "PCLUSTER_UPGRADE_PROGRESS_CALLBACK" },
        0x30f1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HCHANGE" },
        0x30f5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "NOTIFY_FILTER_AND_TYPE" },
        0x30f9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HCLUSENUM" },
        0x30fd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HCLUSENUMEX" },
        0x3101 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_ENUM_ITEM" },
        0x3105 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HGROUPSET" },
        0x3109 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HGROUP" },
        0x310d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HGROUPSETENUM" },
        0x3111 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_AVAILABILITY_SET_CONFIG" },
        0x3115 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUS_AFFINITY_RULE_TYPE" },
        0x3119 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_NODE_STATE" },
        0x311d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HNETINTERFACEENUM" },
        0x3121 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HNODEENUM" },
        0x3125 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HNODEENUMEX" },
        0x3129 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_NODE_RESUME_FAILBACK_TYPE" },
        0x312d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_CREATE_GROUP_INFO" },
        0x3131 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HGROUPENUMEX" },
        0x3135 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_GROUP_ENUM_ITEM" },
        0x3139 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HRESENUMEX" },
        0x313d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_RESOURCE_ENUM_ITEM" },
        0x3141 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_GROUP_STATE" },
        0x3145 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HGROUPENUM" },
        0x3149 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_RESOURCE_STATE" },
        0x314d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE" },
        0x3151 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HRESENUM" },
        0x3155 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HRESTYPEENUM" },
        0x3159 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HNETWORKENUM" },
        0x315d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_NETWORK_STATE" },
        0x3161 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HNETINTERFACE" },
        0x3165 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_NETINTERFACE_STATE" },
        0x3169 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HREGBATCH" },
        0x316d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_REG_COMMAND" },
        0x3171 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HREGBATCHNOTIFICATION" },
        0x3175 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_BATCH_COMMAND" },
        0x3179 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HREGBATCHPORT" },
        0x317d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HREGREADBATCH" },
        0x3181 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HREGREADBATCHREPLY" },
        0x3185 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_READ_BATCH_COMMAND" },
        0x3189 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CREATE_CLUSTER_CONFIG" },
        0x318d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "PCLUSTER_SETUP_PROGRESS_CALLBACK" },
        0x3191 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CREATE_CLUSTER_NAME_ACCOUNT" },
        0x3195 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "REPAIR_CLUSTER_NAME_ACCOUNT_CONFIG" },
        0x3199 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_MGMT_POINT_RESTYPE" },
        0x319d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_CLOUD_TYPE" },
        0x31a1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_HEALTH_FAULT" },
        0x31a5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_HEALTH_FAULT_ARRAY" },
        0x31a9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "RESUTIL_PROPERTY_ITEM" },
        0x31ad => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSPROP_BINARY" },
        0x31b1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSPROP_SZ" },
        0x31b5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSPROP_DWORD" },
        0x31b9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSPROP_LONG" },
        0x31bd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSPROP_FILETIME" },
        0x31c1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "PLOG_EVENT_ROUTINE" },
        0x31c5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUS_WORKER" },
        0x31c9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "PWORKER_START_ROUTINE" },
        0x31cd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "LPRESOURCE_CALLBACK" },
        0x31d1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "LPRESOURCE_CALLBACK_EX" },
        0x31d5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_ROLE_STATE" },
        0x31d9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSTER_ROLE" },
        0x31dd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "HCLUSCRYPTPROVIDER" },
        0x31e1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "PaxosTagCStruct" },
        0x31e5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "LPGROUP_CALLBACK_EX" },
        0x31e9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "CLUSGROUP_TYPE" },
        0x31ed => TypeRefEntry{ .namespace = "Windows.Win32.Networking.Clustering", .name = "LPNODE_CALLBACK" },
        else => null,
    };
}

pub const CLUSTER_VERSION_FLAG_MIXED_MODE = 1;
pub const CLUSTER_VERSION_UNKNOWN = 4294967295;
pub const NT4_MAJOR_VERSION = 1;
pub const NT4SP4_MAJOR_VERSION = 2;
pub const NT5_MAJOR_VERSION = 3;
pub const NT51_MAJOR_VERSION = 4;
pub const NT6_MAJOR_VERSION = 5;
pub const NT7_MAJOR_VERSION = 6;
pub const NT8_MAJOR_VERSION = 7;
pub const NT9_MAJOR_VERSION = 8;
pub const NT10_MAJOR_VERSION = 9;
pub const NT11_MAJOR_VERSION = 10;
pub const NT12_MAJOR_VERSION = 11;
pub const NT13_MAJOR_VERSION = 12;
pub const WS2016_TP4_UPGRADE_VERSION = 6;
pub const WS2016_TP5_UPGRADE_VERSION = 7;
pub const WS2016_RTM_UPGRADE_VERSION = 8;
pub const RS3_UPGRADE_VERSION = 1;
pub const RS4_UPGRADE_VERSION = 2;
pub const RS5_UPGRADE_VERSION = 3;
pub const NINETEEN_H1_UPGRADE_VERSION = 1;
pub const NINETEEN_H2_UPGRADE_VERSION = 2;
pub const MN_UPGRADE_VERSION = 3;
pub const FE_UPGRADE_VERSION = 4;
pub const FE_22H2_UPGRADE_VERSION = 5;
pub const CA_UPGRADE_VERSION = 1;
pub const NI_UPGRADE_VERSION = 2;
pub const CU_UPGRADE_VERSION = 3;
pub const ZN_UPGRADE_VERSION = 4;
pub const GA_UPGRADE_VERSION = 5;
pub const GE_UPGRADE_VERSION = 6;
pub const HCI_UPGRADE_BIT = 32768;
pub const CLUSAPI_VERSION_SERVER2008 = 1536;
pub const CLUSAPI_VERSION_SERVER2008R2 = 1792;
pub const CLUSAPI_VERSION_WINDOWS8 = 1793;
pub const CLUSAPI_VERSION_WINDOWSBLUE = 1794;
pub const CLUSAPI_VERSION_WINTHRESHOLD = 1795;
pub const CLUSAPI_VERSION_RS3 = 2560;
pub const CLUSAPI_VERSION_NI = 2572;
pub const CLUSAPI_VERSION_CU = 3075;
pub const CLUSAPI_VERSION_ZN = 3076;
pub const CLUSAPI_VERSION_GA = 3077;
pub const CLUSAPI_VERSION = 3077;
pub const CREATE_CLUSTER_VERSION = 1536;
pub const CREATE_CLUSTER_MAJOR_VERSION_MASK = 4294967040;
pub const MAX_CLUSTERNAME_LENGTH = 63;
pub const CLUSTER_INSTALLED = 1;
pub const CLUSTER_CONFIGURED = 2;
pub const CLUSTER_RUNNING = 16;
pub const CLUS_HYBRID_QUORUM = 1024;
pub const CLUS_NODE_MAJORITY_QUORUM = 0;
pub const CLUSCTL_RESOURCE_STATE_CHANGE_REASON_VERSION_1 = 1;
pub const CLUSREG_DATABASE_SYNC_WRITE_TO_ALL_NODES = 1;
pub const CLUSREG_DATABASE_ISOLATE_READ = 2;
pub const CLUSTER_ENUM_ITEM_VERSION_1 = 1;
pub const CLUSTER_ENUM_ITEM_VERSION = 1;
pub const CLUSTER_CREATE_GROUP_INFO_VERSION_1 = 1;
pub const CLUSTER_CREATE_GROUP_INFO_VERSION = 1;
pub const GROUPSET_READY_SETTING_DELAY = 1;
pub const GROUPSET_READY_SETTING_ONLINE = 2;
pub const GROUPSET_READY_SETTING_OS_HEARTBEAT = 3;
pub const GROUPSET_READY_SETTING_APPLICATION_READY = 4;
pub const CLUS_GRP_MOVE_ALLOWED = 0;
pub const CLUS_GRP_MOVE_LOCKED = 1;
pub const CLUSAPI_READ_ACCESS = 1;
pub const CLUSAPI_CHANGE_ACCESS = 2;
pub const CLUSAPI_NO_ACCESS = 4;
pub const CLUSTER_SET_ACCESS_TYPE_ALLOWED = 0;
pub const CLUSTER_SET_ACCESS_TYPE_DENIED = 1;
pub const CLUSTER_DELETE_ACCESS_CONTROL_ENTRY = 2;
pub const CLUSGROUPSET_STATUS_GROUPS_PENDING = 1;
pub const CLUSGROUPSET_STATUS_GROUPS_ONLINE = 2;
pub const CLUSGROUPSET_STATUS_OS_HEARTBEAT = 4;
pub const CLUSGROUPSET_STATUS_APPLICATION_READY = 8;
pub const CLUSTER_AVAILABILITY_SET_CONFIG_V1 = 1;
pub const CLUSTER_GROUP_ENUM_ITEM_VERSION_1 = 1;
pub const CLUSTER_GROUP_ENUM_ITEM_VERSION = 1;
pub const CLUSTER_RESOURCE_ENUM_ITEM_VERSION_1 = 1;
pub const CLUSTER_RESOURCE_ENUM_ITEM_VERSION = 1;
pub const CLUSAPI_NODE_PAUSE_REMAIN_ON_PAUSED_NODE_ON_MOVE_ERROR = 1;
pub const CLUSAPI_NODE_AVOID_PLACEMENT = 2;
pub const CLUSAPI_NODE_PAUSE_RETRY_DRAIN_ON_FAILURE = 4;
pub const CLUSAPI_NODE_RESUME_FAILBACK_STORAGE = 1;
pub const CLUSAPI_NODE_RESUME_FAILBACK_VMS = 2;
pub const CLUSAPI_NODE_RESUME_FAILBACK_PINNED_VMS_ONLY = 4;
pub const CLUSAPI_NODE_RESUME_FAILBACK_VMS_FORCEFULLY = 8;
pub const CLUSGRP_STATUS_LOCKED_MODE = 1;
pub const CLUSGRP_STATUS_PREEMPTED = 2;
pub const CLUSGRP_STATUS_WAITING_IN_QUEUE_FOR_MOVE = 4;
pub const CLUSGRP_STATUS_PHYSICAL_RESOURCES_LACKING = 8;
pub const CLUSGRP_STATUS_WAITING_TO_START = 16;
pub const CLUSGRP_STATUS_EMBEDDED_FAILURE = 32;
pub const CLUSGRP_STATUS_OFFLINE_DUE_TO_ANTIAFFINITY_CONFLICT = 64;
pub const CLUSGRP_STATUS_NETWORK_FAILURE = 128;
pub const CLUSGRP_STATUS_UNMONITORED = 256;
pub const CLUSGRP_STATUS_OS_HEARTBEAT = 512;
pub const CLUSGRP_STATUS_APPLICATION_READY = 1024;
pub const CLUSGRP_STATUS_OFFLINE_NOT_LOCAL_DISK_OWNER = 2048;
pub const CLUSGRP_STATUS_WAITING_FOR_DEPENDENCIES = 4096;
pub const CLUSRES_STATUS_LOCKED_MODE = 1;
pub const CLUSRES_STATUS_EMBEDDED_FAILURE = 2;
pub const CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_CPU = 4;
pub const CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_MEMORY = 8;
pub const CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_GENERIC_RESOURCES = 16;
pub const CLUSRES_STATUS_NETWORK_FAILURE = 32;
pub const CLUSRES_STATUS_UNMONITORED = 64;
pub const CLUSRES_STATUS_OS_HEARTBEAT = 128;
pub const CLUSRES_STATUS_APPLICATION_READY = 256;
pub const CLUSRES_STATUS_OFFLINE_NOT_LOCAL_DISK_OWNER = 512;
pub const CLUSAPI_GROUP_ONLINE_IGNORE_RESOURCE_STATUS = 1;
pub const CLUSAPI_GROUP_ONLINE_SYNCHRONOUS = 2;
pub const CLUSAPI_GROUP_ONLINE_BEST_POSSIBLE_NODE = 4;
pub const CLUSAPI_GROUP_ONLINE_IGNORE_AFFINITY_RULE = 8;
pub const CLUSAPI_GROUP_OFFLINE_IGNORE_RESOURCE_STATUS = 1;
pub const CLUSAPI_RESOURCE_ONLINE_IGNORE_RESOURCE_STATUS = 1;
pub const CLUSAPI_RESOURCE_ONLINE_DO_NOT_UPDATE_PERSISTENT_STATE = 2;
pub const CLUSAPI_RESOURCE_ONLINE_NECESSARY_FOR_QUORUM = 4;
pub const CLUSAPI_RESOURCE_ONLINE_BEST_POSSIBLE_NODE = 8;
pub const CLUSAPI_RESOURCE_ONLINE_IGNORE_AFFINITY_RULE = 32;
pub const CLUSAPI_RESOURCE_OFFLINE_IGNORE_RESOURCE_STATUS = 1;
pub const CLUSAPI_RESOURCE_OFFLINE_FORCE_WITH_TERMINATION = 2;
pub const CLUSAPI_RESOURCE_OFFLINE_DO_NOT_UPDATE_PERSISTENT_STATE = 4;
pub const CLUSAPI_RESOURCE_OFFLINE_REASON_NONE = 0;
pub const CLUSAPI_RESOURCE_OFFLINE_REASON_UNKNOWN = 1;
pub const CLUSAPI_RESOURCE_OFFLINE_REASON_MOVING = 2;
pub const CLUSAPI_RESOURCE_OFFLINE_REASON_USER_REQUESTED = 4;
pub const CLUSAPI_RESOURCE_OFFLINE_REASON_BEING_DELETED = 8;
pub const CLUSAPI_RESOURCE_OFFLINE_REASON_BEING_RESTARTED = 16;
pub const CLUSAPI_RESOURCE_OFFLINE_REASON_PREEMPTED = 32;
pub const CLUSAPI_RESOURCE_OFFLINE_REASON_SHUTTING_DOWN = 64;
pub const CLUSAPI_GROUP_MOVE_IGNORE_RESOURCE_STATUS = 1;
pub const CLUSAPI_GROUP_MOVE_RETURN_TO_SOURCE_NODE_ON_ERROR = 2;
pub const CLUSAPI_GROUP_MOVE_QUEUE_ENABLED = 4;
pub const CLUSAPI_GROUP_MOVE_HIGH_PRIORITY_START = 8;
pub const CLUSAPI_GROUP_MOVE_FAILBACK = 16;
pub const CLUSAPI_GROUP_MOVE_IGNORE_AFFINITY_RULE = 32;
pub const CLUSAPI_CHANGE_RESOURCE_GROUP_FORCE_MOVE_TO_CSV = 1;
pub const CLUSAPI_VALID_CHANGE_RESOURCE_GROUP_FLAGS = 1;
pub const GROUP_FAILURE_INFO_VERSION_1 = 1;
pub const RESOURCE_FAILURE_INFO_VERSION_1 = 1;
pub const CLUS_ACCESS_ANY = 0;
pub const CLUS_ACCESS_READ = 1;
pub const CLUS_ACCESS_WRITE = 2;
pub const CLUS_NO_MODIFY = 0;
pub const CLUS_MODIFY = 1;
pub const CLUS_NOT_GLOBAL = 0;
pub const CLUS_GLOBAL = 1;
pub const CLUSCTL_ACCESS_SHIFT = 0;
pub const CLUSCTL_FUNCTION_SHIFT = 2;
pub const CLCTL_INTERNAL_SHIFT = 20;
pub const CLCTL_USER_SHIFT = 21;
pub const CLCTL_MODIFY_SHIFT = 22;
pub const CLCTL_GLOBAL_SHIFT = 23;
pub const CLUSCTL_OBJECT_SHIFT = 24;
pub const CLUSCTL_CONTROL_CODE_MASK = 4194303;
pub const CLUSCTL_OBJECT_MASK = 255;
pub const CLUSCTL_ACCESS_MODE_MASK = 3;
pub const CLCTL_CLUSTER_BASE = 0;
pub const BitLockerEnabled = 1;
pub const BitLockerDecrypted = 4;
pub const BitlockerEncrypted = 8;
pub const BitLockerDecrypting = 16;
pub const BitlockerEncrypting = 32;
pub const BitLockerPaused = 64;
pub const BitLockerStopped = 128;
pub const RedirectedIOReasonUserRequest = 1;
pub const RedirectedIOReasonUnsafeFileSystemFilter = 2;
pub const RedirectedIOReasonUnsafeVolumeFilter = 4;
pub const RedirectedIOReasonFileSystemTiering = 8;
pub const RedirectedIOReasonBitLockerInitializing = 16;
pub const RedirectedIOReasonReFs = 32;
pub const RedirectedIOReasonMax = 9223372036854775808;
pub const VolumeRedirectedIOReasonNoDiskConnectivity = 1;
pub const VolumeRedirectedIOReasonStorageSpaceNotAttached = 2;
pub const VolumeRedirectedIOReasonVolumeReplicationEnabled = 4;
pub const VolumeRedirectedIOReasonMax = 9223372036854775808;
pub const MAX_OBJECTID = 64;
pub const MAX_CO_PASSWORD_LENGTH = 16;
pub const GUID_PRESENT = 1;
pub const CREATEDC_PRESENT = 2;
pub const MAX_CO_PASSWORD_LENGTHEX = 127;
pub const MAX_CO_PASSWORD_STORAGEEX = 128;
pub const MAX_CREATINGDC_LENGTH = 256;
pub const DNS_LENGTH = 64;
pub const MAINTENANCE_MODE_V2_SIG = 2881155087;
pub const NNLEN = 80;
pub const SR_REPLICATED_PARTITION_DISALLOW_MULTINODE_IO = 1;
pub const CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_ADD_VOLUME_INFO = 1;
pub const CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_FILTER_BY_POOL = 2;
pub const CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_INCLUDE_NON_SHARED_DISKS = 4;
pub const CLRES_VERSION_V1_00 = 256;
pub const CLRES_VERSION_V2_00 = 512;
pub const CLRES_VERSION_V3_00 = 768;
pub const CLRES_VERSION_V4_00 = 1024;
pub const CLUSCTL_GET_OPERATION_CONTEXT_PARAMS_VERSION_1 = 1;
pub const CLUSRESDLL_STATUS_OFFLINE_BUSY = 1;
pub const CLUSRESDLL_STATUS_OFFLINE_SOURCE_THROTTLED = 2;
pub const CLUSRESDLL_STATUS_OFFLINE_DESTINATION_THROTTLED = 4;
pub const CLUSRESDLL_STATUS_OFFLINE_DESTINATION_REJECTED = 8;
pub const CLUSRESDLL_STATUS_INSUFFICIENT_MEMORY = 16;
pub const CLUSRESDLL_STATUS_INSUFFICIENT_PROCESSOR = 32;
pub const CLUSRESDLL_STATUS_INSUFFICIENT_OTHER_RESOURCES = 64;
pub const CLUSRESDLL_STATUS_INVALID_PARAMETERS = 128;
pub const CLUSRESDLL_STATUS_NETWORK_NOT_AVAILABLE = 256;
pub const CLUSRESDLL_STATUS_DO_NOT_COLLECT_WER_REPORT = 1073741824;
pub const CLUSRESDLL_STATUS_DUMP_NOW = 2147483648;
pub const CLUS_RESDLL_OPEN_RECOVER_MONITOR_STATE = 1;
pub const CLUS_RESDLL_ONLINE_RECOVER_MONITOR_STATE = 1;
pub const CLUS_RESDLL_ONLINE_IGNORE_RESOURCE_STATUS = 2;
pub const CLUS_RESDLL_ONLINE_RETURN_TO_SOURCE_NODE_ON_ERROR = 4;
pub const CLUS_RESDLL_ONLINE_RESTORE_ONLINE_STATE = 8;
pub const CLUS_RESDLL_ONLINE_IGNORE_NETWORK_CONNECTIVITY = 16;
pub const CLUS_RESDLL_OFFLINE_IGNORE_RESOURCE_STATUS = 1;
pub const CLUS_RESDLL_OFFLINE_RETURN_TO_SOURCE_NODE_ON_ERROR = 2;
pub const CLUS_RESDLL_OFFLINE_QUEUE_ENABLED = 4;
pub const CLUS_RESDLL_OFFLINE_RETURNING_TO_SOURCE_NODE_BECAUSE_OF_ERROR = 8;
pub const CLUS_RESDLL_OFFLINE_DUE_TO_EMBEDDED_FAILURE = 16;
pub const CLUS_RESDLL_OFFLINE_IGNORE_NETWORK_CONNECTIVITY = 32;
pub const CLUS_RESDLL_OFFLINE_DO_NOT_UPDATE_PERSISTENT_STATE = 64;
pub const CLUS_RESDLL_OPEN_DONT_DELETE_TEMP_DISK = 2;
pub const RESTYPE_MONITOR_SHUTTING_DOWN_NODE_STOP = 1;
pub const RESTYPE_MONITOR_SHUTTING_DOWN_CLUSSVC_CRASH = 2;
pub const RESUTIL_PROPITEM_READ_ONLY = 1;
pub const RESUTIL_PROPITEM_REQUIRED = 2;
pub const RESUTIL_PROPITEM_SIGNED = 4;
pub const RESUTIL_PROPITEM_IN_MEMORY = 8;
pub const LOCKED_MODE_FLAGS_DONT_REMOVE_FROM_MOVE_QUEUE = 1;
pub const CLUSRES_DISABLE_WPR_WATCHDOG_FOR_ONLINE_CALLS = 1;
pub const CLUSRES_DISABLE_WPR_WATCHDOG_FOR_OFFLINE_CALLS = 2;
pub const CLUSTER_HEALTH_FAULT_ARGS = 7;
pub const CLUSTER_HEALTH_FAULT_ID = 0;
pub const CLUSTER_HEALTH_FAULT_ERRORTYPE = 1;
pub const CLUSTER_HEALTH_FAULT_ERRORCODE = 2;
pub const CLUSTER_HEALTH_FAULT_DESCRIPTION = 3;
pub const CLUSTER_HEALTH_FAULT_PROVIDER = 4;
pub const CLUSTER_HEALTH_FAULT_FLAGS = 5;
pub const CLUSTER_HEALTH_FAULT_RESERVED = 6;
pub const CLUS_CREATE_CRYPT_CONTAINER_NOT_FOUND = 1;
pub const SET_APPINSTANCE_CSV_FLAGS_VALID_ONLY_IF_CSV_COORDINATOR = 1;
pub const OperationalQuorum = 0;
pub const ModifyQuorum = 1;
pub const ClusterStateNotInstalled = 0;
pub const ClusterStateNotConfigured = 1;
pub const ClusterStateNotRunning = 3;
pub const ClusterStateRunning = 19;
pub const eResourceStateChangeReasonUnknown = 0;
pub const eResourceStateChangeReasonMove = 1;
pub const eResourceStateChangeReasonFailover = 2;
pub const eResourceStateChangeReasonFailedMove = 3;
pub const eResourceStateChangeReasonShutdown = 4;
pub const eResourceStateChangeReasonRundown = 5;
pub const CLUSREG_COMMAND_NONE = 0;
pub const CLUSREG_SET_VALUE = 1;
pub const CLUSREG_CREATE_KEY = 2;
pub const CLUSREG_DELETE_KEY = 3;
pub const CLUSREG_DELETE_VALUE = 4;
pub const CLUSREG_SET_KEY_SECURITY = 5;
pub const CLUSREG_VALUE_DELETED = 6;
pub const CLUSREG_READ_KEY = 7;
pub const CLUSREG_READ_VALUE = 8;
pub const CLUSREG_READ_ERROR = 9;
pub const CLUSREG_CONTROL_COMMAND = 10;
pub const CLUSREG_CONDITION_EXISTS = 11;
pub const CLUSREG_CONDITION_NOT_EXISTS = 12;
pub const CLUSREG_CONDITION_IS_EQUAL = 13;
pub const CLUSREG_CONDITION_IS_NOT_EQUAL = 14;
pub const CLUSREG_CONDITION_IS_GREATER_THAN = 15;
pub const CLUSREG_CONDITION_IS_LESS_THAN = 16;
pub const CLUSREG_CONDITION_KEY_EXISTS = 17;
pub const CLUSREG_CONDITION_KEY_NOT_EXISTS = 18;
pub const CLUSREG_LAST_COMMAND = 19;
pub const ClusGroupTypeCoreCluster = 1;
pub const ClusGroupTypeAvailableStorage = 2;
pub const ClusGroupTypeTemporary = 3;
pub const ClusGroupTypeSharedVolume = 4;
pub const ClusGroupTypeStoragePool = 5;
pub const ClusGroupTypeFileServer = 100;
pub const ClusGroupTypePrintServer = 101;
pub const ClusGroupTypeDhcpServer = 102;
pub const ClusGroupTypeDtc = 103;
pub const ClusGroupTypeMsmq = 104;
pub const ClusGroupTypeWins = 105;
pub const ClusGroupTypeStandAloneDfs = 106;
pub const ClusGroupTypeGenericApplication = 107;
pub const ClusGroupTypeGenericService = 108;
pub const ClusGroupTypeGenericScript = 109;
pub const ClusGroupTypeIScsiNameService = 110;
pub const ClusGroupTypeVirtualMachine = 111;
pub const ClusGroupTypeTsSessionBroker = 112;
pub const ClusGroupTypeIScsiTarget = 113;
pub const ClusGroupTypeScaleoutFileServer = 114;
pub const ClusGroupTypeVMReplicaBroker = 115;
pub const ClusGroupTypeTaskScheduler = 116;
pub const ClusGroupTypeClusterUpdateAgent = 117;
pub const ClusGroupTypeScaleoutCluster = 118;
pub const ClusGroupTypeStorageReplica = 119;
pub const ClusGroupTypeVMReplicaCoordinator = 120;
pub const ClusGroupTypeCrossClusterOrchestrator = 121;
pub const ClusGroupTypeInfrastructureFileServer = 122;
pub const ClusGroupTypeCoreSddc = 123;
pub const ClusGroupTypeUserManager = 124;
pub const ClusGroupTypeKeyValueStoreManager = 125;
pub const ClusGroupTypeHcsVirtualMachine = 126;
pub const ClusGroupTypeMetaVirtualMachine = 127;
pub const ClusGroupTypeUnknown = 9999;
pub const CLUSTER_MGMT_POINT_TYPE_NONE = 0;
pub const CLUSTER_MGMT_POINT_TYPE_CNO = 1;
pub const CLUSTER_MGMT_POINT_TYPE_DNS_ONLY = 2;
pub const CLUSTER_MGMT_POINT_TYPE_CNO_ONLY = 3;
pub const CLUSTER_MGMT_POINT_RESTYPE_AUTO = 0;
pub const CLUSTER_MGMT_POINT_RESTYPE_SNN = 1;
pub const CLUSTER_MGMT_POINT_RESTYPE_DNN = 2;
pub const CLUSTER_CLOUD_TYPE_NONE = 0;
pub const CLUSTER_CLOUD_TYPE_AZURE = 1;
pub const CLUSTER_CLOUD_TYPE_MIXED = 128;
pub const CLUSTER_CLOUD_TYPE_UNKNOWN = -1;
pub const CLUS_GROUP_START_ALWAYS = 0;
pub const CLUS_GROUP_DO_NOT_START = 1;
pub const CLUS_GROUP_START_ALLOWED = 2;
pub const CLUS_AFFINITY_RULE_NONE = 0;
pub const CLUS_AFFINITY_RULE_SAME_FAULT_DOMAIN = 1;
pub const CLUS_AFFINITY_RULE_SAME_NODE = 2;
pub const CLUS_AFFINITY_RULE_DIFFERENT_FAULT_DOMAIN = 3;
pub const CLUS_AFFINITY_RULE_DIFFERENT_NODE = 4;
pub const CLUS_AFFINITY_RULE_MIN = 0;
pub const CLUS_AFFINITY_RULE_MAX = 4;
pub const CLUS_ADAPTER_EXCLUSION_TYPE_IPPREFIX = 0;
pub const CLUS_ADAPTER_EXCLUSION_TYPE_DESCRIPTION = 1;
pub const CLUS_ADAPTER_EXCLUSION_TYPE_FRIENDLYNAME = 2;
pub const CLUSTER_QUORUM_MAINTAINED = 0;
pub const CLUSTER_QUORUM_LOST = 1;
pub const ClusterUpgradePhaseInitialize = 1;
pub const ClusterUpgradePhaseValidatingUpgrade = 2;
pub const ClusterUpgradePhaseUpgradingComponents = 3;
pub const ClusterUpgradePhaseInstallingNewComponents = 4;
pub const ClusterUpgradePhaseUpgradeComplete = 5;
pub const CLUSTER_CHANGE_NODE_STATE = 1;
pub const CLUSTER_CHANGE_NODE_DELETED = 2;
pub const CLUSTER_CHANGE_NODE_ADDED = 4;
pub const CLUSTER_CHANGE_NODE_PROPERTY = 8;
pub const CLUSTER_CHANGE_REGISTRY_NAME = 16;
pub const CLUSTER_CHANGE_REGISTRY_ATTRIBUTES = 32;
pub const CLUSTER_CHANGE_REGISTRY_VALUE = 64;
pub const CLUSTER_CHANGE_REGISTRY_SUBTREE = 128;
pub const CLUSTER_CHANGE_RESOURCE_STATE = 256;
pub const CLUSTER_CHANGE_RESOURCE_DELETED = 512;
pub const CLUSTER_CHANGE_RESOURCE_ADDED = 1024;
pub const CLUSTER_CHANGE_RESOURCE_PROPERTY = 2048;
pub const CLUSTER_CHANGE_GROUP_STATE = 4096;
pub const CLUSTER_CHANGE_GROUP_DELETED = 8192;
pub const CLUSTER_CHANGE_GROUP_ADDED = 16384;
pub const CLUSTER_CHANGE_GROUP_PROPERTY = 32768;
pub const CLUSTER_CHANGE_RESOURCE_TYPE_DELETED = 65536;
pub const CLUSTER_CHANGE_RESOURCE_TYPE_ADDED = 131072;
pub const CLUSTER_CHANGE_RESOURCE_TYPE_PROPERTY = 262144;
pub const CLUSTER_CHANGE_CLUSTER_RECONNECT = 524288;
pub const CLUSTER_CHANGE_NETWORK_STATE = 1048576;
pub const CLUSTER_CHANGE_NETWORK_DELETED = 2097152;
pub const CLUSTER_CHANGE_NETWORK_ADDED = 4194304;
pub const CLUSTER_CHANGE_NETWORK_PROPERTY = 8388608;
pub const CLUSTER_CHANGE_NETINTERFACE_STATE = 16777216;
pub const CLUSTER_CHANGE_NETINTERFACE_DELETED = 33554432;
pub const CLUSTER_CHANGE_NETINTERFACE_ADDED = 67108864;
pub const CLUSTER_CHANGE_NETINTERFACE_PROPERTY = 134217728;
pub const CLUSTER_CHANGE_QUORUM_STATE = 268435456;
pub const CLUSTER_CHANGE_CLUSTER_STATE = 536870912;
pub const CLUSTER_CHANGE_CLUSTER_PROPERTY = 1073741824;
pub const CLUSTER_CHANGE_HANDLE_CLOSE = -2147483648;
pub const CLUSTER_CHANGE_ALL = -1;
pub const CLUSTER_NOTIFICATIONS_V1 = 1;
pub const CLUSTER_NOTIFICATIONS_V2 = 2;
pub const CLUSTER_CHANGE_CLUSTER_RECONNECT_V2 = 1;
pub const CLUSTER_CHANGE_CLUSTER_STATE_V2 = 2;
pub const CLUSTER_CHANGE_CLUSTER_GROUP_ADDED_V2 = 4;
pub const CLUSTER_CHANGE_CLUSTER_HANDLE_CLOSE_V2 = 8;
pub const CLUSTER_CHANGE_CLUSTER_NETWORK_ADDED_V2 = 16;
pub const CLUSTER_CHANGE_CLUSTER_NODE_ADDED_V2 = 32;
pub const CLUSTER_CHANGE_CLUSTER_RESOURCE_TYPE_ADDED_V2 = 64;
pub const CLUSTER_CHANGE_CLUSTER_COMMON_PROPERTY_V2 = 128;
pub const CLUSTER_CHANGE_CLUSTER_PRIVATE_PROPERTY_V2 = 256;
pub const CLUSTER_CHANGE_CLUSTER_LOST_NOTIFICATIONS_V2 = 512;
pub const CLUSTER_CHANGE_CLUSTER_RENAME_V2 = 1024;
pub const CLUSTER_CHANGE_CLUSTER_MEMBERSHIP_V2 = 2048;
pub const CLUSTER_CHANGE_CLUSTER_UPGRADED_V2 = 4096;
pub const CLUSTER_CHANGE_CLUSTER_ALL_V2 = 8191;
pub const CLUSTER_CHANGE_GROUP_DELETED_V2 = 1;
pub const CLUSTER_CHANGE_GROUP_COMMON_PROPERTY_V2 = 2;
pub const CLUSTER_CHANGE_GROUP_PRIVATE_PROPERTY_V2 = 4;
pub const CLUSTER_CHANGE_GROUP_STATE_V2 = 8;
pub const CLUSTER_CHANGE_GROUP_OWNER_NODE_V2 = 16;
pub const CLUSTER_CHANGE_GROUP_PREFERRED_OWNERS_V2 = 32;
pub const CLUSTER_CHANGE_GROUP_RESOURCE_ADDED_V2 = 64;
pub const CLUSTER_CHANGE_GROUP_RESOURCE_GAINED_V2 = 128;
pub const CLUSTER_CHANGE_GROUP_RESOURCE_LOST_V2 = 256;
pub const CLUSTER_CHANGE_GROUP_HANDLE_CLOSE_V2 = 512;
pub const CLUSTER_CHANGE_GROUP_ALL_V2 = 1023;
pub const CLUSTER_CHANGE_GROUPSET_DELETED_v2 = 1;
pub const CLUSTER_CHANGE_GROUPSET_COMMON_PROPERTY_V2 = 2;
pub const CLUSTER_CHANGE_GROUPSET_PRIVATE_PROPERTY_V2 = 4;
pub const CLUSTER_CHANGE_GROUPSET_STATE_V2 = 8;
pub const CLUSTER_CHANGE_GROUPSET_GROUP_ADDED = 16;
pub const CLUSTER_CHANGE_GROUPSET_GROUP_REMOVED = 32;
pub const CLUSTER_CHANGE_GROUPSET_DEPENDENCIES_V2 = 64;
pub const CLUSTER_CHANGE_GROUPSET_DEPENDENTS_V2 = 128;
pub const CLUSTER_CHANGE_GROUPSET_HANDLE_CLOSE_v2 = 256;
pub const CLUSTER_CHANGE_GROUPSET_ALL_V2 = 511;
pub const CLUSTER_CHANGE_RESOURCE_COMMON_PROPERTY_V2 = 1;
pub const CLUSTER_CHANGE_RESOURCE_PRIVATE_PROPERTY_V2 = 2;
pub const CLUSTER_CHANGE_RESOURCE_STATE_V2 = 4;
pub const CLUSTER_CHANGE_RESOURCE_OWNER_GROUP_V2 = 8;
pub const CLUSTER_CHANGE_RESOURCE_DEPENDENCIES_V2 = 16;
pub const CLUSTER_CHANGE_RESOURCE_DEPENDENTS_V2 = 32;
pub const CLUSTER_CHANGE_RESOURCE_POSSIBLE_OWNERS_V2 = 64;
pub const CLUSTER_CHANGE_RESOURCE_DELETED_V2 = 128;
pub const CLUSTER_CHANGE_RESOURCE_DLL_UPGRADED_V2 = 256;
pub const CLUSTER_CHANGE_RESOURCE_HANDLE_CLOSE_V2 = 512;
pub const CLUSTER_CHANGE_RESOURCE_TERMINAL_STATE_V2 = 1024;
pub const CLUSTER_CHANGE_RESOURCE_ALL_V2 = 2047;
pub const CLUSTER_CHANGE_RESOURCE_TYPE_DELETED_V2 = 1;
pub const CLUSTER_CHANGE_RESOURCE_TYPE_COMMON_PROPERTY_V2 = 2;
pub const CLUSTER_CHANGE_RESOURCE_TYPE_PRIVATE_PROPERTY_V2 = 4;
pub const CLUSTER_CHANGE_RESOURCE_TYPE_POSSIBLE_OWNERS_V2 = 8;
pub const CLUSTER_CHANGE_RESOURCE_TYPE_DLL_UPGRADED_V2 = 16;
pub const CLUSTER_RESOURCE_TYPE_SPECIFIC_V2 = 32;
pub const CLUSTER_CHANGE_RESOURCE_TYPE_ALL_V2 = 63;
pub const CLUSTER_CHANGE_NETINTERFACE_DELETED_V2 = 1;
pub const CLUSTER_CHANGE_NETINTERFACE_COMMON_PROPERTY_V2 = 2;
pub const CLUSTER_CHANGE_NETINTERFACE_PRIVATE_PROPERTY_V2 = 4;
pub const CLUSTER_CHANGE_NETINTERFACE_STATE_V2 = 8;
pub const CLUSTER_CHANGE_NETINTERFACE_HANDLE_CLOSE_V2 = 16;
pub const CLUSTER_CHANGE_NETINTERFACE_ALL_V2 = 31;
pub const CLUSTER_CHANGE_NETWORK_DELETED_V2 = 1;
pub const CLUSTER_CHANGE_NETWORK_COMMON_PROPERTY_V2 = 2;
pub const CLUSTER_CHANGE_NETWORK_PRIVATE_PROPERTY_V2 = 4;
pub const CLUSTER_CHANGE_NETWORK_STATE_V2 = 8;
pub const CLUSTER_CHANGE_NETWORK_HANDLE_CLOSE_V2 = 16;
pub const CLUSTER_CHANGE_NETWORK_ALL_V2 = 31;
pub const CLUSTER_CHANGE_NODE_NETINTERFACE_ADDED_V2 = 1;
pub const CLUSTER_CHANGE_NODE_DELETED_V2 = 2;
pub const CLUSTER_CHANGE_NODE_COMMON_PROPERTY_V2 = 4;
pub const CLUSTER_CHANGE_NODE_PRIVATE_PROPERTY_V2 = 8;
pub const CLUSTER_CHANGE_NODE_STATE_V2 = 16;
pub const CLUSTER_CHANGE_NODE_GROUP_GAINED_V2 = 32;
pub const CLUSTER_CHANGE_NODE_GROUP_LOST_V2 = 64;
pub const CLUSTER_CHANGE_NODE_HANDLE_CLOSE_V2 = 128;
pub const CLUSTER_CHANGE_NODE_ALL_V2 = 255;
pub const CLUSTER_CHANGE_REGISTRY_ATTRIBUTES_V2 = 1;
pub const CLUSTER_CHANGE_REGISTRY_NAME_V2 = 2;
pub const CLUSTER_CHANGE_REGISTRY_SUBTREE_V2 = 4;
pub const CLUSTER_CHANGE_REGISTRY_VALUE_V2 = 8;
pub const CLUSTER_CHANGE_REGISTRY_HANDLE_CLOSE_V2 = 16;
pub const CLUSTER_CHANGE_REGISTRY_ALL_V2 = 31;
pub const CLUSTER_CHANGE_QUORUM_STATE_V2 = 1;
pub const CLUSTER_CHANGE_QUORUM_ALL_V2 = 1;
pub const CLUSTER_CHANGE_SHARED_VOLUME_STATE_V2 = 1;
pub const CLUSTER_CHANGE_SHARED_VOLUME_ADDED_V2 = 2;
pub const CLUSTER_CHANGE_SHARED_VOLUME_REMOVED_V2 = 4;
pub const CLUSTER_CHANGE_SHARED_VOLUME_ALL_V2 = 7;
pub const CLUSTER_CHANGE_SPACEPORT_CUSTOM_PNP_V2 = 1;
pub const CLUSTER_CHANGE_UPGRADE_NODE_PREPARE = 1;
pub const CLUSTER_CHANGE_UPGRADE_NODE_COMMIT = 2;
pub const CLUSTER_CHANGE_UPGRADE_NODE_POSTCOMMIT = 4;
pub const CLUSTER_CHANGE_UPGRADE_ALL = 7;
pub const CLUSTER_OBJECT_TYPE_NONE = 0;
pub const CLUSTER_OBJECT_TYPE_CLUSTER = 1;
pub const CLUSTER_OBJECT_TYPE_GROUP = 2;
pub const CLUSTER_OBJECT_TYPE_RESOURCE = 3;
pub const CLUSTER_OBJECT_TYPE_RESOURCE_TYPE = 4;
pub const CLUSTER_OBJECT_TYPE_NETWORK_INTERFACE = 5;
pub const CLUSTER_OBJECT_TYPE_NETWORK = 6;
pub const CLUSTER_OBJECT_TYPE_NODE = 7;
pub const CLUSTER_OBJECT_TYPE_REGISTRY = 8;
pub const CLUSTER_OBJECT_TYPE_QUORUM = 9;
pub const CLUSTER_OBJECT_TYPE_SHARED_VOLUME = 10;
pub const CLUSTER_OBJECT_TYPE_GROUPSET = 13;
pub const CLUSTER_OBJECT_TYPE_AFFINITYRULE = 16;
pub const CLUSTER_OBJECT_TYPE_FAULTDOMAIN = 17;
pub const CLUSTERSET_OBJECT_TYPE_NONE = 0;
pub const CLUSTERSET_OBJECT_TYPE_MEMBER = 1;
pub const CLUSTERSET_OBJECT_TYPE_WORKLOAD = 2;
pub const CLUSTERSET_OBJECT_TYPE_DATABASE = 3;
pub const CLUSTER_ENUM_NODE = 1;
pub const CLUSTER_ENUM_RESTYPE = 2;
pub const CLUSTER_ENUM_RESOURCE = 4;
pub const CLUSTER_ENUM_GROUP = 8;
pub const CLUSTER_ENUM_NETWORK = 16;
pub const CLUSTER_ENUM_NETINTERFACE = 32;
pub const CLUSTER_ENUM_CAPACITY_NODE = 268435456;
pub const CLUSTER_ENUM_SHARED_VOLUME_GROUP = 536870912;
pub const CLUSTER_ENUM_SHARED_VOLUME_RESOURCE = 1073741824;
pub const CLUSTER_ENUM_INTERNAL_NETWORK = -2147483648;
pub const CLUSTER_ENUM_ALL = 63;
pub const CLUSTER_NODE_ENUM_NETINTERFACES = 1;
pub const CLUSTER_NODE_ENUM_GROUPS = 2;
pub const CLUSTER_NODE_ENUM_PREFERRED_GROUPS = 4;
pub const CLUSTER_NODE_ENUM_ALL = 3;
pub const ClusterNodeStateUnknown = -1;
pub const ClusterNodeUp = 0;
pub const ClusterNodeDown = 1;
pub const ClusterNodePaused = 2;
pub const ClusterNodeJoining = 3;
pub const ClusterStorageNodeStateUnknown = 0;
pub const ClusterStorageNodeUp = 1;
pub const ClusterStorageNodeDown = 2;
pub const ClusterStorageNodePaused = 3;
pub const ClusterStorageNodeStarting = 4;
pub const ClusterStorageNodeStopping = 5;
pub const NodeDrainStatusNotInitiated = 0;
pub const NodeDrainStatusInProgress = 1;
pub const NodeDrainStatusCompleted = 2;
pub const NodeDrainStatusFailed = 3;
pub const ClusterNodeDrainStatusCount = 4;
pub const NodeStatusNormal = 0;
pub const NodeStatusIsolated = 1;
pub const NodeStatusQuarantined = 2;
pub const NodeStatusDrainInProgress = 4;
pub const NodeStatusDrainCompleted = 8;
pub const NodeStatusDrainFailed = 16;
pub const NodeStatusAvoidPlacement = 32;
pub const NodeStatusMax = 51;
pub const NodeFailbackStatusNotInitiated = 0;
pub const NodeFailbackStatusInProgress = 1;
pub const NodeFailbackStatusCompleted = 2;
pub const NodeFailbackStatusFailed = 3;
pub const ClusterNodeFailbackStatusCount = 4;
pub const CLUSTER_GROUP_ENUM_CONTAINS = 1;
pub const CLUSTER_GROUP_ENUM_NODES = 2;
pub const CLUSTER_GROUP_ENUM_ALL = 3;
pub const ClusterGroupStateUnknown = -1;
pub const ClusterGroupOnline = 0;
pub const ClusterGroupOffline = 1;
pub const ClusterGroupFailed = 2;
pub const ClusterGroupPartialOnline = 3;
pub const ClusterGroupPending = 4;
pub const PriorityDisabled = 0;
pub const PriorityLow = 1000;
pub const PriorityMedium = 2000;
pub const PriorityHigh = 3000;
pub const ClusterGroupPreventFailback = 0;
pub const ClusterGroupAllowFailback = 1;
pub const ClusterGroupFailbackTypeCount = 2;
pub const DoNotFailbackGroups = 0;
pub const FailbackGroupsImmediately = 1;
pub const FailbackGroupsPerPolicy = 2;
pub const ClusterNodeResumeFailbackTypeCount = 3;
pub const ClusterResourceStateUnknown = -1;
pub const ClusterResourceInherited = 0;
pub const ClusterResourceInitializing = 1;
pub const ClusterResourceOnline = 2;
pub const ClusterResourceOffline = 3;
pub const ClusterResourceFailed = 4;
pub const ClusterResourcePending = 128;
pub const ClusterResourceOnlinePending = 129;
pub const ClusterResourceOfflinePending = 130;
pub const ClusterResourceDontRestart = 0;
pub const ClusterResourceRestartNoNotify = 1;
pub const ClusterResourceRestartNotify = 2;
pub const ClusterResourceRestartActionCount = 3;
pub const ClusterResourceEmbeddedFailureActionNone = 0;
pub const ClusterResourceEmbeddedFailureActionLogOnly = 1;
pub const ClusterResourceEmbeddedFailureActionRecover = 2;
pub const CLUSTER_RESOURCE_DEFAULT_MONITOR = 0;
pub const CLUSTER_RESOURCE_SEPARATE_MONITOR = 1;
pub const CLUSTER_RESOURCE_VALID_FLAGS = 1;
pub const ClusterSharedVolumeSnapshotStateUnknown = 0;
pub const ClusterSharedVolumePrepareForHWSnapshot = 1;
pub const ClusterSharedVolumeHWSnapshotCompleted = 2;
pub const ClusterSharedVolumePrepareForFreeze = 3;
pub const CLUSPROP_TYPE_UNKNOWN = -1;
pub const CLUSPROP_TYPE_ENDMARK = 0;
pub const CLUSPROP_TYPE_LIST_VALUE = 1;
pub const CLUSPROP_TYPE_RESCLASS = 2;
pub const CLUSPROP_TYPE_RESERVED1 = 3;
pub const CLUSPROP_TYPE_NAME = 4;
pub const CLUSPROP_TYPE_SIGNATURE = 5;
pub const CLUSPROP_TYPE_SCSI_ADDRESS = 6;
pub const CLUSPROP_TYPE_DISK_NUMBER = 7;
pub const CLUSPROP_TYPE_PARTITION_INFO = 8;
pub const CLUSPROP_TYPE_FTSET_INFO = 9;
pub const CLUSPROP_TYPE_DISK_SERIALNUMBER = 10;
pub const CLUSPROP_TYPE_DISK_GUID = 11;
pub const CLUSPROP_TYPE_DISK_SIZE = 12;
pub const CLUSPROP_TYPE_PARTITION_INFO_EX = 13;
pub const CLUSPROP_TYPE_PARTITION_INFO_EX2 = 14;
pub const CLUSPROP_TYPE_STORAGE_DEVICE_ID_DESCRIPTOR = 15;
pub const CLUSPROP_TYPE_USER = 32768;
pub const CLUSPROP_FORMAT_UNKNOWN = 0;
pub const CLUSPROP_FORMAT_BINARY = 1;
pub const CLUSPROP_FORMAT_DWORD = 2;
pub const CLUSPROP_FORMAT_SZ = 3;
pub const CLUSPROP_FORMAT_EXPAND_SZ = 4;
pub const CLUSPROP_FORMAT_MULTI_SZ = 5;
pub const CLUSPROP_FORMAT_ULARGE_INTEGER = 6;
pub const CLUSPROP_FORMAT_LONG = 7;
pub const CLUSPROP_FORMAT_EXPANDED_SZ = 8;
pub const CLUSPROP_FORMAT_SECURITY_DESCRIPTOR = 9;
pub const CLUSPROP_FORMAT_LARGE_INTEGER = 10;
pub const CLUSPROP_FORMAT_WORD = 11;
pub const CLUSPROP_FORMAT_FILETIME = 12;
pub const CLUSPROP_FORMAT_VALUE_LIST = 13;
pub const CLUSPROP_FORMAT_PROPERTY_LIST = 14;
pub const CLUSPROP_FORMAT_USER = 32768;
pub const CLUSPROP_SYNTAX_ENDMARK = 0;
pub const CLUSPROP_SYNTAX_NAME = 262147;
pub const CLUSPROP_SYNTAX_RESCLASS = 131074;
pub const CLUSPROP_SYNTAX_LIST_VALUE_SZ = 65539;
pub const CLUSPROP_SYNTAX_LIST_VALUE_EXPAND_SZ = 65540;
pub const CLUSPROP_SYNTAX_LIST_VALUE_DWORD = 65538;
pub const CLUSPROP_SYNTAX_LIST_VALUE_BINARY = 65537;
pub const CLUSPROP_SYNTAX_LIST_VALUE_MULTI_SZ = 65541;
pub const CLUSPROP_SYNTAX_LIST_VALUE_LONG = 65543;
pub const CLUSPROP_SYNTAX_LIST_VALUE_EXPANDED_SZ = 65544;
pub const CLUSPROP_SYNTAX_LIST_VALUE_SECURITY_DESCRIPTOR = 65545;
pub const CLUSPROP_SYNTAX_LIST_VALUE_LARGE_INTEGER = 65546;
pub const CLUSPROP_SYNTAX_LIST_VALUE_ULARGE_INTEGER = 65542;
pub const CLUSPROP_SYNTAX_LIST_VALUE_WORD = 65547;
pub const CLUSPROP_SYNTAX_LIST_VALUE_PROPERTY_LIST = 65550;
pub const CLUSPROP_SYNTAX_LIST_VALUE_FILETIME = 65548;
pub const CLUSPROP_SYNTAX_DISK_SIGNATURE = 327682;
pub const CLUSPROP_SYNTAX_SCSI_ADDRESS = 393218;
pub const CLUSPROP_SYNTAX_DISK_NUMBER = 458754;
pub const CLUSPROP_SYNTAX_PARTITION_INFO = 524289;
pub const CLUSPROP_SYNTAX_FTSET_INFO = 589825;
pub const CLUSPROP_SYNTAX_DISK_SERIALNUMBER = 655363;
pub const CLUSPROP_SYNTAX_DISK_GUID = 720899;
pub const CLUSPROP_SYNTAX_DISK_SIZE = 786438;
pub const CLUSPROP_SYNTAX_PARTITION_INFO_EX = 851969;
pub const CLUSPROP_SYNTAX_PARTITION_INFO_EX2 = 917505;
pub const CLUSPROP_SYNTAX_STORAGE_DEVICE_ID_DESCRIPTOR = 983041;
pub const CLUS_OBJECT_INVALID = 0;
pub const CLUS_OBJECT_RESOURCE = 1;
pub const CLUS_OBJECT_RESOURCE_TYPE = 2;
pub const CLUS_OBJECT_GROUP = 3;
pub const CLUS_OBJECT_NODE = 4;
pub const CLUS_OBJECT_NETWORK = 5;
pub const CLUS_OBJECT_NETINTERFACE = 6;
pub const CLUS_OBJECT_CLUSTER = 7;
pub const CLUS_OBJECT_GROUPSET = 8;
pub const CLUS_OBJECT_AFFINITYRULE = 9;
pub const CLUS_OBJECT_USER = 128;
pub const CLCTL_UNKNOWN = 0;
pub const CLCTL_GET_CHARACTERISTICS = 5;
pub const CLCTL_GET_FLAGS = 9;
pub const CLCTL_GET_CLASS_INFO = 13;
pub const CLCTL_GET_REQUIRED_DEPENDENCIES = 17;
pub const CLCTL_GET_ARB_TIMEOUT = 21;
pub const CLCTL_GET_FAILURE_INFO = 25;
pub const CLCTL_GET_NAME = 41;
pub const CLCTL_GET_RESOURCE_TYPE = 45;
pub const CLCTL_GET_NODE = 49;
pub const CLCTL_GET_NETWORK = 53;
pub const CLCTL_GET_ID = 57;
pub const CLCTL_GET_FQDN = 61;
pub const CLCTL_GET_CLUSTER_SERVICE_ACCOUNT_NAME = 65;
pub const CLCTL_CHECK_VOTER_EVICT = 69;
pub const CLCTL_CHECK_VOTER_DOWN = 73;
pub const CLCTL_SHUTDOWN = 77;
pub const CLCTL_ENUM_COMMON_PROPERTIES = 81;
pub const CLCTL_GET_RO_COMMON_PROPERTIES = 85;
pub const CLCTL_GET_COMMON_PROPERTIES = 89;
pub const CLCTL_SET_COMMON_PROPERTIES = 4194398;
pub const CLCTL_VALIDATE_COMMON_PROPERTIES = 97;
pub const CLCTL_GET_COMMON_PROPERTY_FMTS = 101;
pub const CLCTL_GET_COMMON_RESOURCE_PROPERTY_FMTS = 105;
pub const CLCTL_CHECK_VOTER_EVICT_WITNESS = 109;
pub const CLCTL_CHECK_VOTER_DOWN_WITNESS = 113;
pub const CLCTL_ENUM_PRIVATE_PROPERTIES = 121;
pub const CLCTL_GET_RO_PRIVATE_PROPERTIES = 125;
pub const CLCTL_GET_PRIVATE_PROPERTIES = 129;
pub const CLCTL_SET_PRIVATE_PROPERTIES = 4194438;
pub const CLCTL_VALIDATE_PRIVATE_PROPERTIES = 137;
pub const CLCTL_GET_PRIVATE_PROPERTY_FMTS = 141;
pub const CLCTL_GET_PRIVATE_RESOURCE_PROPERTY_FMTS = 145;
pub const CLCTL_ADD_REGISTRY_CHECKPOINT = 4194466;
pub const CLCTL_DELETE_REGISTRY_CHECKPOINT = 4194470;
pub const CLCTL_GET_REGISTRY_CHECKPOINTS = 169;
pub const CLCTL_ADD_CRYPTO_CHECKPOINT = 4194478;
pub const CLCTL_DELETE_CRYPTO_CHECKPOINT = 4194482;
pub const CLCTL_GET_CRYPTO_CHECKPOINTS = 181;
pub const CLCTL_RESOURCE_UPGRADE_DLL = 4194490;
pub const CLCTL_ADD_REGISTRY_CHECKPOINT_64BIT = 4194494;
pub const CLCTL_ADD_REGISTRY_CHECKPOINT_32BIT = 4194498;
pub const CLCTL_GET_LOADBAL_PROCESS_LIST = 201;
pub const CLCTL_SET_ACCOUNT_ACCESS = 4194546;
pub const CLCTL_GET_NETWORK_NAME = 361;
pub const CLCTL_NETNAME_GET_VIRTUAL_SERVER_TOKEN = 365;
pub const CLCTL_NETNAME_REGISTER_DNS_RECORDS = 370;
pub const CLCTL_GET_DNS_NAME = 373;
pub const CLCTL_NETNAME_SET_PWD_INFO = 378;
pub const CLCTL_NETNAME_DELETE_CO = 382;
pub const CLCTL_NETNAME_VALIDATE_VCO = 385;
pub const CLCTL_NETNAME_RESET_VCO = 389;
pub const CLCTL_NETNAME_REPAIR_VCO = 397;
pub const CLCTL_STORAGE_GET_DISK_INFO = 401;
pub const CLCTL_STORAGE_GET_AVAILABLE_DISKS = 405;
pub const CLCTL_STORAGE_IS_PATH_VALID = 409;
pub const CLCTL_STORAGE_SYNC_CLUSDISK_DB = 4194718;
pub const CLCTL_STORAGE_GET_DISK_NUMBER_INFO = 417;
pub const CLCTL_QUERY_DELETE = 441;
pub const CLCTL_IPADDRESS_RENEW_LEASE = 4194750;
pub const CLCTL_IPADDRESS_RELEASE_LEASE = 4194754;
pub const CLCTL_QUERY_MAINTENANCE_MODE = 481;
pub const CLCTL_SET_MAINTENANCE_MODE = 4194790;
pub const CLCTL_STORAGE_SET_DRIVELETTER = 4194794;
pub const CLCTL_STORAGE_GET_DRIVELETTERS = 493;
pub const CLCTL_STORAGE_GET_DISK_INFO_EX = 497;
pub const CLCTL_STORAGE_GET_AVAILABLE_DISKS_EX = 501;
pub const CLCTL_STORAGE_GET_DISK_INFO_EX2 = 505;
pub const CLCTL_STORAGE_GET_CLUSPORT_DISK_COUNT = 509;
pub const CLCTL_STORAGE_REMAP_DRIVELETTER = 513;
pub const CLCTL_STORAGE_GET_DISKID = 517;
pub const CLCTL_STORAGE_IS_CLUSTERABLE = 521;
pub const CLCTL_STORAGE_REMOVE_VM_OWNERSHIP = 4194830;
pub const CLCTL_STORAGE_GET_MOUNTPOINTS = 529;
pub const CLCTL_STORAGE_GET_DIRTY = 537;
pub const CLCTL_STORAGE_GET_SHARED_VOLUME_INFO = 549;
pub const CLCTL_STORAGE_IS_CSV_FILE = 553;
pub const CLCTL_STORAGE_GET_RESOURCEID = 557;
pub const CLCTL_VALIDATE_PATH = 561;
pub const CLCTL_VALIDATE_NETNAME = 565;
pub const CLCTL_VALIDATE_DIRECTORY = 569;
pub const CLCTL_BATCH_BLOCK_KEY = 574;
pub const CLCTL_BATCH_UNBLOCK_KEY = 577;
pub const CLCTL_FILESERVER_SHARE_ADD = 4194886;
pub const CLCTL_FILESERVER_SHARE_DEL = 4194890;
pub const CLCTL_FILESERVER_SHARE_MODIFY = 4194894;
pub const CLCTL_FILESERVER_SHARE_REPORT = 593;
pub const CLCTL_NETNAME_GET_OU_FOR_VCO = 4194926;
pub const CLCTL_ENABLE_SHARED_VOLUME_DIRECTIO = 4194954;
pub const CLCTL_DISABLE_SHARED_VOLUME_DIRECTIO = 4194958;
pub const CLCTL_GET_SHARED_VOLUME_ID = 657;
pub const CLCTL_SET_CSV_MAINTENANCE_MODE = 4194966;
pub const CLCTL_SET_SHARED_VOLUME_BACKUP_MODE = 4194970;
pub const CLCTL_STORAGE_GET_SHARED_VOLUME_PARTITION_NAMES = 669;
pub const CLCTL_STORAGE_GET_SHARED_VOLUME_STATES = 4194978;
pub const CLCTL_STORAGE_IS_SHARED_VOLUME = 677;
pub const CLCTL_GET_CLUSDB_TIMESTAMP = 681;
pub const CLCTL_RW_MODIFY_NOOP = 4194990;
pub const CLCTL_IS_QUORUM_BLOCKED = 689;
pub const CLCTL_POOL_GET_DRIVE_INFO = 693;
pub const CLCTL_GET_GUM_LOCK_OWNER = 697;
pub const CLCTL_GET_STUCK_NODES = 701;
pub const CLCTL_INJECT_GEM_FAULT = 705;
pub const CLCTL_INTRODUCE_GEM_REPAIR_DELAY = 709;
pub const CLCTL_SEND_DUMMY_GEM_MESSAGES = 713;
pub const CLCTL_BLOCK_GEM_SEND_RECV = 717;
pub const CLCTL_GET_GEMID_VECTOR = 721;
pub const CLCTL_ADD_CRYPTO_CHECKPOINT_EX = 4195030;
pub const CLCTL_GROUP_GET_LAST_MOVE_TIME = 729;
pub const CLCTL_SET_STORAGE_CONFIGURATION = 4195042;
pub const CLCTL_GET_STORAGE_CONFIGURATION = 741;
pub const CLCTL_GET_STORAGE_CONFIG_ATTRIBUTES = 745;
pub const CLCTL_REMOVE_NODE = 4195054;
pub const CLCTL_IS_FEATURE_INSTALLED = 753;
pub const CLCTL_IS_S2D_FEATURE_SUPPORTED = 757;
pub const CLCTL_STORAGE_GET_PHYSICAL_DISK_INFO = 761;
pub const CLCTL_STORAGE_GET_CLUSBFLT_PATHS = 765;
pub const CLCTL_STORAGE_GET_CLUSBFLT_PATHINFO = 769;
pub const CLCTL_CLEAR_NODE_CONNECTION_INFO = 4195078;
pub const CLCTL_SET_DNS_DOMAIN = 4195082;
pub const CTCTL_GET_ROUTESTATUS_BASIC = 781;
pub const CTCTL_GET_ROUTESTATUS_EXTENDED = 785;
pub const CTCTL_GET_FAULT_DOMAIN_STATE = 789;
pub const CLCTL_NETNAME_SET_PWD_INFOEX = 794;
pub const CLCTL_GET_NODE_NETWORK_CONNECTIVITY = 797;
pub const CLCTL_STORAGE_GET_AVAILABLE_DISKS_EX2_INT = 8161;
pub const CLCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS = 8417;
pub const CLCTL_CLOUD_WITNESS_RESOURCE_UPDATE_TOKEN = 4202726;
pub const CLCTL_RESOURCE_PREPARE_UPGRADE = 4202730;
pub const CLCTL_RESOURCE_UPGRADE_COMPLETED = 4202734;
pub const CLCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS_WITH_KEY = 8433;
pub const CLCTL_CLOUD_WITNESS_RESOURCE_UPDATE_KEY = 4202742;
pub const CLCTL_REPLICATION_ADD_REPLICATION_GROUP = 8514;
pub const CLCTL_REPLICATION_GET_LOG_INFO = 8517;
pub const CLCTL_REPLICATION_GET_ELIGIBLE_LOGDISKS = 8521;
pub const CLCTL_REPLICATION_GET_ELIGIBLE_TARGET_DATADISKS = 8525;
pub const CLCTL_REPLICATION_GET_ELIGIBLE_SOURCE_DATADISKS = 8529;
pub const CLCTL_REPLICATION_GET_REPLICATED_DISKS = 8533;
pub const CLCTL_REPLICATION_GET_REPLICA_VOLUMES = 8537;
pub const CLCTL_REPLICATION_GET_LOG_VOLUME = 8541;
pub const CLCTL_REPLICATION_GET_RESOURCE_GROUP = 8545;
pub const CLCTL_REPLICATION_GET_REPLICATED_PARTITION_INFO = 8549;
pub const CLCTL_GET_STATE_CHANGE_TIME = 11613;
pub const CLCTL_SET_CLUSTER_S2D_ENABLED = 4205922;
pub const CLCTL_SET_CLUSTER_S2D_CACHE_METADATA_RESERVE_BYTES = 4205934;
pub const CLCTL_GROUPSET_GET_GROUPS = 11633;
pub const CLCTL_GROUPSET_GET_PROVIDER_GROUPS = 11637;
pub const CLCTL_GROUPSET_GET_PROVIDER_GROUPSETS = 11641;
pub const CLCTL_GROUP_GET_PROVIDER_GROUPS = 11645;
pub const CLCTL_GROUP_GET_PROVIDER_GROUPSETS = 11649;
pub const CLCTL_GROUP_SET_CCF_FROM_MASTER = 4205958;
pub const CLCTL_GET_INFRASTRUCTURE_SOFS_BUFFER = 11657;
pub const CLCTL_SET_INFRASTRUCTURE_SOFS_BUFFER = 4205966;
pub const CLCTL_NOTIFY_INFRASTRUCTURE_SOFS_CHANGED = 4205970;
pub const CLCTL_SCALEOUT_COMMAND = 4205974;
pub const CLCTL_SCALEOUT_CONTROL = 4205978;
pub const CLCTL_SCALEOUT_GET_CLUSTERS = 4205981;
pub const CLCTL_RELOAD_AUTOLOGGER_CONFIG = 11730;
pub const CLCTL_STORAGE_RENAME_SHARED_VOLUME = 11734;
pub const CLCTL_STORAGE_RENAME_SHARED_VOLUME_GUID = 11738;
pub const CLCTL_ENUM_AFFINITY_RULE_NAMES = 11741;
pub const CLCTL_GET_NODES_IN_FD = 11745;
pub const CLCTL_FORCE_DB_FLUSH = 4206054;
pub const CLCTL_DELETE = 5242886;
pub const CLCTL_INSTALL_NODE = 5242890;
pub const CLCTL_EVICT_NODE = 5242894;
pub const CLCTL_ADD_DEPENDENCY = 5242898;
pub const CLCTL_REMOVE_DEPENDENCY = 5242902;
pub const CLCTL_ADD_OWNER = 5242906;
pub const CLCTL_REMOVE_OWNER = 5242910;
pub const CLCTL_SET_NAME = 5242918;
pub const CLCTL_CLUSTER_NAME_CHANGED = 5242922;
pub const CLCTL_CLUSTER_VERSION_CHANGED = 5242926;
pub const CLCTL_FIXUP_ON_UPGRADE = 5242930;
pub const CLCTL_STARTING_PHASE1 = 5242934;
pub const CLCTL_STARTING_PHASE2 = 5242938;
pub const CLCTL_HOLD_IO = 5242942;
pub const CLCTL_RESUME_IO = 5242946;
pub const CLCTL_FORCE_QUORUM = 5242950;
pub const CLCTL_INITIALIZE = 5242954;
pub const CLCTL_STATE_CHANGE_REASON = 5242958;
pub const CLCTL_PROVIDER_STATE_CHANGE = 5242962;
pub const CLCTL_LEAVING_GROUP = 5242966;
pub const CLCTL_JOINING_GROUP = 5242970;
pub const CLCTL_FSWITNESS_GET_EPOCH_INFO = 1048669;
pub const CLCTL_FSWITNESS_SET_EPOCH_INFO = 5242978;
pub const CLCTL_FSWITNESS_RELEASE_LOCK = 5242982;
pub const CLCTL_NETNAME_CREDS_NOTIFYCAM = 5242986;
pub const CLCTL_NOTIFY_QUORUM_STATUS = 5243006;
pub const CLCTL_NOTIFY_MONITOR_SHUTTING_DOWN = 1048705;
pub const CLCTL_UNDELETE = 5243014;
pub const CLCTL_GET_OPERATION_CONTEXT = 1057001;
pub const CLCTL_NOTIFY_OWNER_CHANGE = 5251362;
pub const CLCTL_VALIDATE_CHANGE_GROUP = 1057061;
pub const CLCTL_CHECK_DRAIN_VETO = 1057069;
pub const CLCTL_NOTIFY_DRAIN_COMPLETE = 1057073;
pub const CLUSCTL_RESOURCE_UNKNOWN = 16777216;
pub const CLUSCTL_RESOURCE_GET_CHARACTERISTICS = 16777221;
pub const CLUSCTL_RESOURCE_GET_FLAGS = 16777225;
pub const CLUSCTL_RESOURCE_GET_CLASS_INFO = 16777229;
pub const CLUSCTL_RESOURCE_GET_REQUIRED_DEPENDENCIES = 16777233;
pub const CLUSCTL_RESOURCE_GET_NAME = 16777257;
pub const CLUSCTL_RESOURCE_GET_ID = 16777273;
pub const CLUSCTL_RESOURCE_GET_RESOURCE_TYPE = 16777261;
pub const CLUSCTL_RESOURCE_ENUM_COMMON_PROPERTIES = 16777297;
pub const CLUSCTL_RESOURCE_GET_RO_COMMON_PROPERTIES = 16777301;
pub const CLUSCTL_RESOURCE_GET_COMMON_PROPERTIES = 16777305;
pub const CLUSCTL_RESOURCE_SET_COMMON_PROPERTIES = 20971614;
pub const CLUSCTL_RESOURCE_VALIDATE_COMMON_PROPERTIES = 16777313;
pub const CLUSCTL_RESOURCE_GET_COMMON_PROPERTY_FMTS = 16777317;
pub const CLUSCTL_RESOURCE_ENUM_PRIVATE_PROPERTIES = 16777337;
pub const CLUSCTL_RESOURCE_GET_RO_PRIVATE_PROPERTIES = 16777341;
pub const CLUSCTL_RESOURCE_GET_PRIVATE_PROPERTIES = 16777345;
pub const CLUSCTL_RESOURCE_SET_PRIVATE_PROPERTIES = 20971654;
pub const CLUSCTL_RESOURCE_VALIDATE_PRIVATE_PROPERTIES = 16777353;
pub const CLUSCTL_RESOURCE_GET_PRIVATE_PROPERTY_FMTS = 16777357;
pub const CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT = 20971682;
pub const CLUSCTL_RESOURCE_DELETE_REGISTRY_CHECKPOINT = 20971686;
pub const CLUSCTL_RESOURCE_GET_REGISTRY_CHECKPOINTS = 16777385;
pub const CLUSCTL_RESOURCE_ADD_CRYPTO_CHECKPOINT = 20971694;
pub const CLUSCTL_RESOURCE_DELETE_CRYPTO_CHECKPOINT = 20971698;
pub const CLUSCTL_RESOURCE_ADD_CRYPTO_CHECKPOINT_EX = 20972246;
pub const CLUSCTL_RESOURCE_GET_CRYPTO_CHECKPOINTS = 16777397;
pub const CLUSCTL_RESOURCE_GET_LOADBAL_PROCESS_LIST = 16777417;
pub const CLUSCTL_RESOURCE_GET_NETWORK_NAME = 16777577;
pub const CLUSCTL_RESOURCE_NETNAME_GET_VIRTUAL_SERVER_TOKEN = 16777581;
pub const CLUSCTL_RESOURCE_NETNAME_SET_PWD_INFO = 16777594;
pub const CLUSCTL_RESOURCE_NETNAME_SET_PWD_INFOEX = 16778010;
pub const CLUSCTL_RESOURCE_NETNAME_DELETE_CO = 16777598;
pub const CLUSCTL_RESOURCE_NETNAME_VALIDATE_VCO = 16777601;
pub const CLUSCTL_RESOURCE_NETNAME_RESET_VCO = 16777605;
pub const CLUSCTL_RESOURCE_NETNAME_REPAIR_VCO = 16777613;
pub const CLUSCTL_RESOURCE_NETNAME_REGISTER_DNS_RECORDS = 16777586;
pub const CLUSCTL_RESOURCE_GET_DNS_NAME = 16777589;
pub const CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO = 16777617;
pub const CLUSCTL_RESOURCE_STORAGE_GET_DISK_NUMBER_INFO = 16777633;
pub const CLUSCTL_RESOURCE_STORAGE_IS_PATH_VALID = 16777625;
pub const CLUSCTL_RESOURCE_QUERY_DELETE = 16777657;
pub const CLUSCTL_RESOURCE_UPGRADE_DLL = 20971706;
pub const CLUSCTL_RESOURCE_IPADDRESS_RENEW_LEASE = 20971966;
pub const CLUSCTL_RESOURCE_IPADDRESS_RELEASE_LEASE = 20971970;
pub const CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT_64BIT = 20971710;
pub const CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT_32BIT = 20971714;
pub const CLUSCTL_RESOURCE_QUERY_MAINTENANCE_MODE = 16777697;
pub const CLUSCTL_RESOURCE_SET_MAINTENANCE_MODE = 20972006;
pub const CLUSCTL_RESOURCE_STORAGE_SET_DRIVELETTER = 20972010;
pub const CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX = 16777713;
pub const CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX2 = 16777721;
pub const CLUSCTL_RESOURCE_STORAGE_GET_MOUNTPOINTS = 16777745;
pub const CLUSCTL_RESOURCE_STORAGE_GET_DIRTY = 16777753;
pub const CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_INFO = 16777765;
pub const CLUSCTL_RESOURCE_SET_CSV_MAINTENANCE_MODE = 20972182;
pub const CLUSCTL_RESOURCE_ENABLE_SHARED_VOLUME_DIRECTIO = 20972170;
pub const CLUSCTL_RESOURCE_DISABLE_SHARED_VOLUME_DIRECTIO = 20972174;
pub const CLUSCTL_RESOURCE_SET_SHARED_VOLUME_BACKUP_MODE = 20972186;
pub const CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_PARTITION_NAMES = 16777885;
pub const CLUSCTL_RESOURCE_GET_FAILURE_INFO = 16777241;
pub const CLUSCTL_RESOURCE_STORAGE_GET_DISKID = 16777733;
pub const CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_STATES = 20972194;
pub const CLUSCTL_RESOURCE_STORAGE_IS_SHARED_VOLUME = 16777893;
pub const CLUSCTL_RESOURCE_IS_QUORUM_BLOCKED = 16777905;
pub const CLUSCTL_RESOURCE_POOL_GET_DRIVE_INFO = 16777909;
pub const CLUSCTL_RESOURCE_RLUA_GET_VIRTUAL_SERVER_TOKEN = 16777581;
pub const CLUSCTL_RESOURCE_RLUA_SET_PWD_INFO = 16777594;
pub const CLUSCTL_RESOURCE_RLUA_SET_PWD_INFOEX = 16778010;
pub const CLUSCTL_RESOURCE_DELETE = 22020102;
pub const CLUSCTL_RESOURCE_UNDELETE = 22020230;
pub const CLUSCTL_RESOURCE_INSTALL_NODE = 22020106;
pub const CLUSCTL_RESOURCE_EVICT_NODE = 22020110;
pub const CLUSCTL_RESOURCE_ADD_DEPENDENCY = 22020114;
pub const CLUSCTL_RESOURCE_REMOVE_DEPENDENCY = 22020118;
pub const CLUSCTL_RESOURCE_ADD_OWNER = 22020122;
pub const CLUSCTL_RESOURCE_REMOVE_OWNER = 22020126;
pub const CLUSCTL_RESOURCE_SET_NAME = 22020134;
pub const CLUSCTL_RESOURCE_CLUSTER_NAME_CHANGED = 22020138;
pub const CLUSCTL_RESOURCE_CLUSTER_VERSION_CHANGED = 22020142;
pub const CLUSCTL_RESOURCE_FORCE_QUORUM = 22020166;
pub const CLUSCTL_RESOURCE_INITIALIZE = 22020170;
pub const CLUSCTL_RESOURCE_STATE_CHANGE_REASON = 22020174;
pub const CLUSCTL_RESOURCE_PROVIDER_STATE_CHANGE = 22020178;
pub const CLUSCTL_RESOURCE_LEAVING_GROUP = 22020182;
pub const CLUSCTL_RESOURCE_JOINING_GROUP = 22020186;
pub const CLUSCTL_RESOURCE_FSWITNESS_GET_EPOCH_INFO = 17825885;
pub const CLUSCTL_RESOURCE_FSWITNESS_SET_EPOCH_INFO = 22020194;
pub const CLUSCTL_RESOURCE_FSWITNESS_RELEASE_LOCK = 22020198;
pub const CLUSCTL_RESOURCE_NETNAME_CREDS_NOTIFYCAM = 22020202;
pub const CLUSCTL_RESOURCE_GET_OPERATION_CONTEXT = 17834217;
pub const CLUSCTL_RESOURCE_RW_MODIFY_NOOP = 20972206;
pub const CLUSCTL_RESOURCE_NOTIFY_QUORUM_STATUS = 22020222;
pub const CLUSCTL_RESOURCE_NOTIFY_OWNER_CHANGE = 22028578;
pub const CLUSCTL_RESOURCE_VALIDATE_CHANGE_GROUP = 17834277;
pub const CLUSCTL_RESOURCE_STORAGE_RENAME_SHARED_VOLUME = 16788950;
pub const CLUSCTL_RESOURCE_STORAGE_RENAME_SHARED_VOLUME_GUID = 16788954;
pub const CLUSCTL_CLOUD_WITNESS_RESOURCE_UPDATE_TOKEN = 20979942;
pub const CLUSCTL_CLOUD_WITNESS_RESOURCE_UPDATE_KEY = 20979958;
pub const CLUSCTL_RESOURCE_PREPARE_UPGRADE = 20979946;
pub const CLUSCTL_RESOURCE_UPGRADE_COMPLETED = 20979950;
pub const CLUSCTL_RESOURCE_GET_STATE_CHANGE_TIME = 16788829;
pub const CLUSCTL_RESOURCE_GET_INFRASTRUCTURE_SOFS_BUFFER = 16788873;
pub const CLUSCTL_RESOURCE_SET_INFRASTRUCTURE_SOFS_BUFFER = 20983182;
pub const CLUSCTL_RESOURCE_SCALEOUT_COMMAND = 20983190;
pub const CLUSCTL_RESOURCE_SCALEOUT_CONTROL = 20983194;
pub const CLUSCTL_RESOURCE_SCALEOUT_GET_CLUSTERS = 20983197;
pub const CLUSCTL_RESOURCE_CHECK_DRAIN_VETO = 17834285;
pub const CLUSCTL_RESOURCE_NOTIFY_DRAIN_COMPLETE = 17834289;
pub const CLUSCTL_RESOURCE_GET_NODES_IN_FD = 16788961;
pub const CLUSCTL_RESOURCE_TYPE_UNKNOWN = 33554432;
pub const CLUSCTL_RESOURCE_TYPE_GET_CHARACTERISTICS = 33554437;
pub const CLUSCTL_RESOURCE_TYPE_GET_FLAGS = 33554441;
pub const CLUSCTL_RESOURCE_TYPE_GET_CLASS_INFO = 33554445;
pub const CLUSCTL_RESOURCE_TYPE_GET_REQUIRED_DEPENDENCIES = 33554449;
pub const CLUSCTL_RESOURCE_TYPE_GET_ARB_TIMEOUT = 33554453;
pub const CLUSCTL_RESOURCE_TYPE_ENUM_COMMON_PROPERTIES = 33554513;
pub const CLUSCTL_RESOURCE_TYPE_GET_RO_COMMON_PROPERTIES = 33554517;
pub const CLUSCTL_RESOURCE_TYPE_GET_COMMON_PROPERTIES = 33554521;
pub const CLUSCTL_RESOURCE_TYPE_VALIDATE_COMMON_PROPERTIES = 33554529;
pub const CLUSCTL_RESOURCE_TYPE_SET_COMMON_PROPERTIES = 37748830;
pub const CLUSCTL_RESOURCE_TYPE_GET_COMMON_PROPERTY_FMTS = 33554533;
pub const CLUSCTL_RESOURCE_TYPE_GET_COMMON_RESOURCE_PROPERTY_FMTS = 33554537;
pub const CLUSCTL_RESOURCE_TYPE_ENUM_PRIVATE_PROPERTIES = 33554553;
pub const CLUSCTL_RESOURCE_TYPE_GET_RO_PRIVATE_PROPERTIES = 33554557;
pub const CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_PROPERTIES = 33554561;
pub const CLUSCTL_RESOURCE_TYPE_SET_PRIVATE_PROPERTIES = 37748870;
pub const CLUSCTL_RESOURCE_TYPE_VALIDATE_PRIVATE_PROPERTIES = 33554569;
pub const CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_PROPERTY_FMTS = 33554573;
pub const CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_RESOURCE_PROPERTY_FMTS = 33554577;
pub const CLUSCTL_RESOURCE_TYPE_GET_REGISTRY_CHECKPOINTS = 33554601;
pub const CLUSCTL_RESOURCE_TYPE_GET_CRYPTO_CHECKPOINTS = 33554613;
pub const CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS = 33554837;
pub const CLUSCTL_RESOURCE_TYPE_STORAGE_SYNC_CLUSDISK_DB = 37749150;
pub const CLUSCTL_RESOURCE_TYPE_NETNAME_VALIDATE_NETNAME = 33554997;
pub const CLUSCTL_RESOURCE_TYPE_NETNAME_GET_OU_FOR_VCO = 37749358;
pub const CLUSCTL_RESOURCE_TYPE_GEN_APP_VALIDATE_PATH = 33554993;
pub const CLUSCTL_RESOURCE_TYPE_GEN_APP_VALIDATE_DIRECTORY = 33555001;
pub const CLUSCTL_RESOURCE_TYPE_GEN_SCRIPT_VALIDATE_PATH = 33554993;
pub const CLUSCTL_RESOURCE_TYPE_QUERY_DELETE = 33554873;
pub const CLUSCTL_RESOURCE_TYPE_STORAGE_GET_DRIVELETTERS = 33554925;
pub const CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX = 33554933;
pub const CLUSCTL_RESOURCE_TYPE_STORAGE_REMAP_DRIVELETTER = 33554945;
pub const CLUSCTL_RESOURCE_TYPE_STORAGE_GET_DISKID = 33554949;
pub const CLUSCTL_RESOURCE_TYPE_STORAGE_GET_RESOURCEID = 33554989;
pub const CLUSCTL_RESOURCE_TYPE_STORAGE_IS_CLUSTERABLE = 33554953;
pub const CLUSCTL_RESOURCE_TYPE_STORAGE_REMOVE_VM_OWNERSHIP = 37749262;
pub const CLUSCTL_RESOURCE_TYPE_STORAGE_IS_CSV_FILE = 16777769;
pub const CLUSCTL_RESOURCE_TYPE_WITNESS_VALIDATE_PATH = 33554993;
pub const CLUSCTL_RESOURCE_TYPE_INSTALL_NODE = 38797322;
pub const CLUSCTL_RESOURCE_TYPE_EVICT_NODE = 38797326;
pub const CLUSCTL_RESOURCE_TYPE_CLUSTER_VERSION_CHANGED = 38797358;
pub const CLUSCTL_RESOURCE_TYPE_FIXUP_ON_UPGRADE = 38797362;
pub const CLUSCTL_RESOURCE_TYPE_STARTING_PHASE1 = 38797366;
pub const CLUSCTL_RESOURCE_TYPE_STARTING_PHASE2 = 38797370;
pub const CLUSCTL_RESOURCE_TYPE_HOLD_IO = 38797374;
pub const CLUSCTL_RESOURCE_TYPE_RESUME_IO = 38797378;
pub const CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_INT = 33562593;
pub const CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_LOGDISKS = 33562953;
pub const CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_TARGET_DATADISKS = 33562957;
pub const CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_SOURCE_DATADISKS = 33562961;
pub const CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICATED_DISKS = 33562965;
pub const CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICA_VOLUMES = 33562969;
pub const CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_LOG_VOLUME = 33562973;
pub const CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_RESOURCE_GROUP = 33562977;
pub const CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICATED_PARTITION_INFO = 33562981;
pub const CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_LOG_INFO = 33562949;
pub const CLUSCTL_RESOURCE_TYPE_REPLICATION_ADD_REPLICATION_GROUP = 33562946;
pub const CLUSCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS = 33562849;
pub const CLUSCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS_WITH_KEY = 33562865;
pub const CLUSCTL_RESOURCE_TYPE_PREPARE_UPGRADE = 37757162;
pub const CLUSCTL_RESOURCE_TYPE_UPGRADE_COMPLETED = 37757166;
pub const CLUSCTL_RESOURCE_TYPE_NOTIFY_MONITOR_SHUTTING_DOWN = 34603137;
pub const CLUSCTL_RESOURCE_TYPE_CHECK_DRAIN_VETO = 34611501;
pub const CLUSCTL_RESOURCE_TYPE_NOTIFY_DRAIN_COMPLETE = 34611505;
pub const CLUSCTL_GROUP_UNKNOWN = 50331648;
pub const CLUSCTL_GROUP_GET_CHARACTERISTICS = 50331653;
pub const CLUSCTL_GROUP_GET_FLAGS = 50331657;
pub const CLUSCTL_GROUP_GET_NAME = 50331689;
pub const CLUSCTL_GROUP_GET_ID = 50331705;
pub const CLUSCTL_GROUP_ENUM_COMMON_PROPERTIES = 50331729;
pub const CLUSCTL_GROUP_GET_RO_COMMON_PROPERTIES = 50331733;
pub const CLUSCTL_GROUP_GET_COMMON_PROPERTIES = 50331737;
pub const CLUSCTL_GROUP_SET_COMMON_PROPERTIES = 54526046;
pub const CLUSCTL_GROUP_VALIDATE_COMMON_PROPERTIES = 50331745;
pub const CLUSCTL_GROUP_ENUM_PRIVATE_PROPERTIES = 50331769;
pub const CLUSCTL_GROUP_GET_RO_PRIVATE_PROPERTIES = 50331773;
pub const CLUSCTL_GROUP_GET_PRIVATE_PROPERTIES = 50331777;
pub const CLUSCTL_GROUP_SET_PRIVATE_PROPERTIES = 54526086;
pub const CLUSCTL_GROUP_VALIDATE_PRIVATE_PROPERTIES = 50331785;
pub const CLUSCTL_GROUP_QUERY_DELETE = 50332089;
pub const CLUSCTL_GROUP_GET_COMMON_PROPERTY_FMTS = 50331749;
pub const CLUSCTL_GROUP_GET_PRIVATE_PROPERTY_FMTS = 50331789;
pub const CLUSCTL_GROUP_GET_FAILURE_INFO = 50331673;
pub const CLUSCTL_GROUP_GET_LAST_MOVE_TIME = 50332377;
pub const CLUSCTL_GROUP_SET_CCF_FROM_MASTER = 54537606;
pub const CLUSCTL_NODE_UNKNOWN = 67108864;
pub const CLUSCTL_NODE_GET_CHARACTERISTICS = 67108869;
pub const CLUSCTL_NODE_GET_FLAGS = 67108873;
pub const CLUSCTL_NODE_GET_NAME = 67108905;
pub const CLUSCTL_NODE_GET_ID = 67108921;
pub const CLUSCTL_NODE_ENUM_COMMON_PROPERTIES = 67108945;
pub const CLUSCTL_NODE_GET_RO_COMMON_PROPERTIES = 67108949;
pub const CLUSCTL_NODE_GET_COMMON_PROPERTIES = 67108953;
pub const CLUSCTL_NODE_SET_COMMON_PROPERTIES = 71303262;
pub const CLUSCTL_NODE_VALIDATE_COMMON_PROPERTIES = 67108961;
pub const CLUSCTL_NODE_ENUM_PRIVATE_PROPERTIES = 67108985;
pub const CLUSCTL_NODE_GET_RO_PRIVATE_PROPERTIES = 67108989;
pub const CLUSCTL_NODE_GET_PRIVATE_PROPERTIES = 67108993;
pub const CLUSCTL_NODE_SET_PRIVATE_PROPERTIES = 71303302;
pub const CLUSCTL_NODE_VALIDATE_PRIVATE_PROPERTIES = 67109001;
pub const CLUSCTL_NODE_GET_COMMON_PROPERTY_FMTS = 67108965;
pub const CLUSCTL_NODE_GET_PRIVATE_PROPERTY_FMTS = 67109005;
pub const CLUSCTL_NODE_GET_CLUSTER_SERVICE_ACCOUNT_NAME = 67108929;
pub const CLUSCTL_NODE_GET_STUCK_NODES = 67109565;
pub const CLUSCTL_NODE_INJECT_GEM_FAULT = 67109569;
pub const CLUSCTL_NODE_INTRODUCE_GEM_REPAIR_DELAY = 67109573;
pub const CLUSCTL_NODE_SEND_DUMMY_GEM_MESSAGES = 67109577;
pub const CLUSCTL_NODE_BLOCK_GEM_SEND_RECV = 67109581;
pub const CLUSCTL_NODE_GET_GEMID_VECTOR = 67109585;
pub const CLUSCTL_NETWORK_UNKNOWN = 83886080;
pub const CLUSCTL_NETWORK_GET_CHARACTERISTICS = 83886085;
pub const CLUSCTL_NETWORK_GET_FLAGS = 83886089;
pub const CLUSCTL_NETWORK_GET_NAME = 83886121;
pub const CLUSCTL_NETWORK_GET_ID = 83886137;
pub const CLUSCTL_NETWORK_ENUM_COMMON_PROPERTIES = 83886161;
pub const CLUSCTL_NETWORK_GET_RO_COMMON_PROPERTIES = 83886165;
pub const CLUSCTL_NETWORK_GET_COMMON_PROPERTIES = 83886169;
pub const CLUSCTL_NETWORK_SET_COMMON_PROPERTIES = 88080478;
pub const CLUSCTL_NETWORK_VALIDATE_COMMON_PROPERTIES = 83886177;
pub const CLUSCTL_NETWORK_ENUM_PRIVATE_PROPERTIES = 83886201;
pub const CLUSCTL_NETWORK_GET_RO_PRIVATE_PROPERTIES = 83886205;
pub const CLUSCTL_NETWORK_GET_PRIVATE_PROPERTIES = 83886209;
pub const CLUSCTL_NETWORK_SET_PRIVATE_PROPERTIES = 88080518;
pub const CLUSCTL_NETWORK_VALIDATE_PRIVATE_PROPERTIES = 83886217;
pub const CLUSCTL_NETWORK_GET_COMMON_PROPERTY_FMTS = 83886181;
pub const CLUSCTL_NETWORK_GET_PRIVATE_PROPERTY_FMTS = 83886221;
pub const CLUSCTL_NETINTERFACE_UNKNOWN = 100663296;
pub const CLUSCTL_NETINTERFACE_GET_CHARACTERISTICS = 100663301;
pub const CLUSCTL_NETINTERFACE_GET_FLAGS = 100663305;
pub const CLUSCTL_NETINTERFACE_GET_NAME = 100663337;
pub const CLUSCTL_NETINTERFACE_GET_ID = 100663353;
pub const CLUSCTL_NETINTERFACE_GET_NODE = 100663345;
pub const CLUSCTL_NETINTERFACE_GET_NETWORK = 100663349;
pub const CLUSCTL_NETINTERFACE_ENUM_COMMON_PROPERTIES = 100663377;
pub const CLUSCTL_NETINTERFACE_GET_RO_COMMON_PROPERTIES = 100663381;
pub const CLUSCTL_NETINTERFACE_GET_COMMON_PROPERTIES = 100663385;
pub const CLUSCTL_NETINTERFACE_SET_COMMON_PROPERTIES = 104857694;
pub const CLUSCTL_NETINTERFACE_VALIDATE_COMMON_PROPERTIES = 100663393;
pub const CLUSCTL_NETINTERFACE_ENUM_PRIVATE_PROPERTIES = 100663417;
pub const CLUSCTL_NETINTERFACE_GET_RO_PRIVATE_PROPERTIES = 100663421;
pub const CLUSCTL_NETINTERFACE_GET_PRIVATE_PROPERTIES = 100663425;
pub const CLUSCTL_NETINTERFACE_SET_PRIVATE_PROPERTIES = 104857734;
pub const CLUSCTL_NETINTERFACE_VALIDATE_PRIVATE_PROPERTIES = 100663433;
pub const CLUSCTL_NETINTERFACE_GET_COMMON_PROPERTY_FMTS = 100663397;
pub const CLUSCTL_NETINTERFACE_GET_PRIVATE_PROPERTY_FMTS = 100663437;
pub const CLUSCTL_CLUSTER_UNKNOWN = 117440512;
pub const CLUSCTL_CLUSTER_GET_FQDN = 117440573;
pub const CLUSCTL_CLUSTER_SET_STORAGE_CONFIGURATION = 121635554;
pub const CLUSCTL_CLUSTER_GET_STORAGE_CONFIGURATION = 117441253;
pub const CLUSCTL_CLUSTER_GET_STORAGE_CONFIG_ATTRIBUTES = 117441257;
pub const CLUSCTL_CLUSTER_ENUM_COMMON_PROPERTIES = 117440593;
pub const CLUSCTL_CLUSTER_GET_RO_COMMON_PROPERTIES = 117440597;
pub const CLUSCTL_CLUSTER_GET_COMMON_PROPERTIES = 117440601;
pub const CLUSCTL_CLUSTER_SET_COMMON_PROPERTIES = 121634910;
pub const CLUSCTL_CLUSTER_VALIDATE_COMMON_PROPERTIES = 117440609;
pub const CLUSCTL_CLUSTER_ENUM_PRIVATE_PROPERTIES = 117440633;
pub const CLUSCTL_CLUSTER_GET_RO_PRIVATE_PROPERTIES = 117440637;
pub const CLUSCTL_CLUSTER_GET_PRIVATE_PROPERTIES = 117440641;
pub const CLUSCTL_CLUSTER_SET_PRIVATE_PROPERTIES = 121634950;
pub const CLUSCTL_CLUSTER_VALIDATE_PRIVATE_PROPERTIES = 117440649;
pub const CLUSCTL_CLUSTER_GET_COMMON_PROPERTY_FMTS = 117440613;
pub const CLUSCTL_CLUSTER_GET_PRIVATE_PROPERTY_FMTS = 117440653;
pub const CLUSCTL_CLUSTER_CHECK_VOTER_EVICT = 117440581;
pub const CLUSCTL_CLUSTER_CHECK_VOTER_DOWN = 117440585;
pub const CLUSCTL_CLUSTER_SHUTDOWN = 117440589;
pub const CLUSCTL_CLUSTER_BATCH_BLOCK_KEY = 117441086;
pub const CLUSCTL_CLUSTER_BATCH_UNBLOCK_KEY = 117441089;
pub const CLUSCTL_CLUSTER_GET_SHARED_VOLUME_ID = 117441169;
pub const CLUSCTL_CLUSTER_GET_CLUSDB_TIMESTAMP = 117441193;
pub const CLUSCTL_CLUSTER_GET_GUM_LOCK_OWNER = 117441209;
pub const CLUSCTL_CLUSTER_REMOVE_NODE = 121635566;
pub const CLUSCTL_CLUSTER_SET_ACCOUNT_ACCESS = 121635058;
pub const CLUSCTL_CLUSTER_CLEAR_NODE_CONNECTION_INFO = 121635590;
pub const CLUSCTL_CLUSTER_SET_DNS_DOMAIN = 121635594;
pub const CLUSCTL_CLUSTER_SET_CLUSTER_S2D_ENABLED = 121646434;
pub const CLUSCTL_CLUSTER_SET_CLUSTER_S2D_CACHE_METADATA_RESERVE_BYTES = 121646446;
pub const CLUSCTL_CLUSTER_STORAGE_RENAME_SHARED_VOLUME = 117452246;
pub const CLUSCTL_CLUSTER_STORAGE_RENAME_SHARED_VOLUME_GUID = 117452250;
pub const CLUSCTL_CLUSTER_RELOAD_AUTOLOGGER_CONFIG = 117452242;
pub const CLUSCTL_CLUSTER_ENUM_AFFINITY_RULE_NAMES = 117452253;
pub const CLUSCTL_CLUSTER_GET_NODES_IN_FD = 117452257;
pub const CLUSCTL_CLUSTER_FORCE_FLUSH_DB = 121646566;
pub const CLUSCTL_CLUSTER_GET_CLMUSR_TOKEN = 117440877;
pub const CLUSCTL_CLUSTER_CHECK_VOTER_EVICT_WITNESS = 117440621;
pub const CLUSCTL_CLUSTER_CHECK_VOTER_DOWN_WITNESS = 117440625;
pub const CLUSCTL_GROUPSET_GET_COMMON_PROPERTIES = 134217817;
pub const CLUSCTL_GROUPSET_GET_RO_COMMON_PROPERTIES = 134217813;
pub const CLUSCTL_GROUPSET_SET_COMMON_PROPERTIES = 138412126;
pub const CLUSCTL_GROUPSET_GET_GROUPS = 134229361;
pub const CLUSCTL_GROUPSET_GET_PROVIDER_GROUPS = 134229365;
pub const CLUSCTL_GROUPSET_GET_PROVIDER_GROUPSETS = 134229369;
pub const CLUSCTL_GROUP_GET_PROVIDER_GROUPS = 134229373;
pub const CLUSCTL_GROUP_GET_PROVIDER_GROUPSETS = 134229377;
pub const CLUSCTL_GROUPSET_GET_ID = 134217785;
pub const CLUSCTL_AFFINITYRULE_GET_COMMON_PROPERTIES = 150995033;
pub const CLUSCTL_AFFINITYRULE_GET_RO_COMMON_PROPERTIES = 150995029;
pub const CLUSCTL_AFFINITYRULE_SET_COMMON_PROPERTIES = 155189342;
pub const CLUSCTL_AFFINITYRULE_GET_ID = 150995001;
pub const CLUSCTL_AFFINITYRULE_GET_GROUPNAMES = 151006577;
pub const CLUS_RESCLASS_UNKNOWN = 0;
pub const CLUS_RESCLASS_STORAGE = 1;
pub const CLUS_RESCLASS_NETWORK = 2;
pub const CLUS_RESCLASS_USER = 32768;
pub const CLUS_RESSUBCLASS_SHARED = -2147483648;
pub const CLUS_RESSUBCLASS_STORAGE_SHARED_BUS = -2147483648;
pub const CLUS_RESSUBCLASS_STORAGE_DISK = 1073741824;
pub const CLUS_RESSUBCLASS_STORAGE_REPLICATION = 268435456;
pub const CLUS_RESSUBCLASS_NETWORK_INTERNET_PROTOCOL = -2147483648;
pub const CLUS_CHAR_UNKNOWN = 0;
pub const CLUS_CHAR_QUORUM = 1;
pub const CLUS_CHAR_DELETE_REQUIRES_ALL_NODES = 2;
pub const CLUS_CHAR_LOCAL_QUORUM = 4;
pub const CLUS_CHAR_LOCAL_QUORUM_DEBUG = 8;
pub const CLUS_CHAR_REQUIRES_STATE_CHANGE_REASON = 16;
pub const CLUS_CHAR_BROADCAST_DELETE = 32;
pub const CLUS_CHAR_SINGLE_CLUSTER_INSTANCE = 64;
pub const CLUS_CHAR_SINGLE_GROUP_INSTANCE = 128;
pub const CLUS_CHAR_COEXIST_IN_SHARED_VOLUME_GROUP = 256;
pub const CLUS_CHAR_PLACEMENT_DATA = 512;
pub const CLUS_CHAR_MONITOR_DETACH = 1024;
pub const CLUS_CHAR_MONITOR_REATTACH = 2048;
pub const CLUS_CHAR_OPERATION_CONTEXT = 4096;
pub const CLUS_CHAR_CLONES = 8192;
pub const CLUS_CHAR_NOT_PREEMPTABLE = 16384;
pub const CLUS_CHAR_NOTIFY_NEW_OWNER = 32768;
pub const CLUS_CHAR_SUPPORTS_UNMONITORED_STATE = 65536;
pub const CLUS_CHAR_INFRASTRUCTURE = 131072;
pub const CLUS_CHAR_VETO_DRAIN = 262144;
pub const CLUS_CHAR_DRAIN_LOCAL_OFFLINE = 524288;
pub const CLUS_FLAG_CORE = 1;
pub const CLUSPROP_PIFLAG_STICKY = 1;
pub const CLUSPROP_PIFLAG_REMOVABLE = 2;
pub const CLUSPROP_PIFLAG_USABLE = 4;
pub const CLUSPROP_PIFLAG_DEFAULT_QUORUM = 8;
pub const CLUSPROP_PIFLAG_USABLE_FOR_CSV = 16;
pub const CLUSPROP_PIFLAG_ENCRYPTION_ENABLED = 32;
pub const CLUSPROP_PIFLAG_RAW = 64;
pub const CLUSPROP_PIFLAG_UNKNOWN = -2147483648;
pub const VolumeStateNoFaults = 0;
pub const VolumeStateNoDirectIO = 1;
pub const VolumeStateNoAccess = 2;
pub const VolumeStateInMaintenance = 4;
pub const VolumeStateDismounted = 8;
pub const VolumeBackupNone = 0;
pub const VolumeBackupInProgress = 1;
pub const SharedVolumeStateUnavailable = 0;
pub const SharedVolumeStatePaused = 1;
pub const SharedVolumeStateActive = 2;
pub const SharedVolumeStateActiveRedirected = 3;
pub const SharedVolumeStateActiveVolumeRedirected = 4;
pub const ClusterSharedVolumeRenameInputTypeNone = 0;
pub const ClusterSharedVolumeRenameInputTypeVolumeOffset = 1;
pub const ClusterSharedVolumeRenameInputTypeVolumeId = 2;
pub const ClusterSharedVolumeRenameInputTypeVolumeName = 3;
pub const ClusterSharedVolumeRenameInputTypeVolumeGuid = 4;
pub const MaintenanceModeTypeDisableIsAliveCheck = 1;
pub const MaintenanceModeTypeOfflineResource = 2;
pub const MaintenanceModeTypeUnclusterResource = 3;
pub const CLUSPROP_IPADDR_ENABLENETBIOS_DISABLED = 0;
pub const CLUSPROP_IPADDR_ENABLENETBIOS_ENABLED = 1;
pub const CLUSPROP_IPADDR_ENABLENETBIOS_TRACK_NIC = 2;
pub const FILESHARE_CHANGE_NONE = 0;
pub const FILESHARE_CHANGE_ADD = 1;
pub const FILESHARE_CHANGE_DEL = 2;
pub const FILESHARE_CHANGE_MODIFY = 3;
pub const CLUSTER_RESOURCE_ENUM_DEPENDS = 1;
pub const CLUSTER_RESOURCE_ENUM_PROVIDES = 2;
pub const CLUSTER_RESOURCE_ENUM_NODES = 4;
pub const CLUSTER_RESOURCE_ENUM_ALL = 7;
pub const CLUSTER_RESOURCE_TYPE_ENUM_NODES = 1;
pub const CLUSTER_RESOURCE_TYPE_ENUM_RESOURCES = 2;
pub const CLUSTER_RESOURCE_TYPE_ENUM_ALL = 3;
pub const CLUSTER_NETWORK_ENUM_NETINTERFACES = 1;
pub const CLUSTER_NETWORK_ENUM_ALL = 1;
pub const ClusterNetworkStateUnknown = -1;
pub const ClusterNetworkUnavailable = 0;
pub const ClusterNetworkDown = 1;
pub const ClusterNetworkPartitioned = 2;
pub const ClusterNetworkUp = 3;
pub const ClusterNetworkRoleNone = 0;
pub const ClusterNetworkRoleInternalUse = 1;
pub const ClusterNetworkRoleClientAccess = 2;
pub const ClusterNetworkRoleInternalAndClient = 3;
pub const ClusterNetInterfaceStateUnknown = -1;
pub const ClusterNetInterfaceUnavailable = 0;
pub const ClusterNetInterfaceFailed = 1;
pub const ClusterNetInterfaceUnreachable = 2;
pub const ClusterNetInterfaceUp = 3;
pub const ClusterSetupPhaseInitialize = 1;
pub const ClusterSetupPhaseValidateNodeState = 100;
pub const ClusterSetupPhaseValidateNetft = 102;
pub const ClusterSetupPhaseValidateClusDisk = 103;
pub const ClusterSetupPhaseConfigureClusSvc = 104;
pub const ClusterSetupPhaseStartingClusSvc = 105;
pub const ClusterSetupPhaseQueryClusterNameAccount = 106;
pub const ClusterSetupPhaseValidateClusterNameAccount = 107;
pub const ClusterSetupPhaseCreateClusterAccount = 108;
pub const ClusterSetupPhaseConfigureClusterAccount = 109;
pub const ClusterSetupPhaseFormingCluster = 200;
pub const ClusterSetupPhaseAddClusterProperties = 201;
pub const ClusterSetupPhaseCreateResourceTypes = 202;
pub const ClusterSetupPhaseCreateGroups = 203;
pub const ClusterSetupPhaseCreateIPAddressResources = 204;
pub const ClusterSetupPhaseCreateNetworkName = 205;
pub const ClusterSetupPhaseClusterGroupOnline = 206;
pub const ClusterSetupPhaseGettingCurrentMembership = 300;
pub const ClusterSetupPhaseAddNodeToCluster = 301;
pub const ClusterSetupPhaseNodeUp = 302;
pub const ClusterSetupPhaseApplyNetworkATCIntents = 303;
pub const ClusterSetupPhaseMoveGroup = 400;
pub const ClusterSetupPhaseDeleteGroup = 401;
pub const ClusterSetupPhaseCleanupCOs = 402;
pub const ClusterSetupPhaseOfflineGroup = 403;
pub const ClusterSetupPhaseEvictNode = 404;
pub const ClusterSetupPhaseCleanupNode = 405;
pub const ClusterSetupPhaseCoreGroupCleanup = 406;
pub const ClusterSetupPhaseRepairCNOAccount = 500;
pub const ClusterSetupPhaseRepairDNSPermissions = 501;
pub const ClusterSetupPhaseFailureCleanup = 999;
pub const ClusterSetupPhaseStart = 1;
pub const ClusterSetupPhaseContinue = 2;
pub const ClusterSetupPhaseEnd = 3;
pub const ClusterSetupPhaseReport = 4;
pub const ClusterSetupPhaseInformational = 1;
pub const ClusterSetupPhaseWarning = 2;
pub const ClusterSetupPhaseFatal = 3;
pub const PLACEMENT_OPTIONS_MIN_VALUE = 0;
pub const PLACEMENT_OPTIONS_DEFAULT_PLACEMENT_OPTIONS = 0;
pub const PLACEMENT_OPTIONS_DISABLE_CSV_VM_DEPENDENCY = 1;
pub const PLACEMENT_OPTIONS_CONSIDER_OFFLINE_VMS = 2;
pub const PLACEMENT_OPTIONS_DONT_USE_MEMORY = 4;
pub const PLACEMENT_OPTIONS_DONT_USE_CPU = 8;
pub const PLACEMENT_OPTIONS_DONT_USE_LOCAL_TEMP_DISK = 16;
pub const PLACEMENT_OPTIONS_DONT_RESUME_VMS_WITH_EXISTING_TEMP_DISK = 32;
pub const PLACEMENT_OPTIONS_SAVE_VMS_WITH_LOCAL_DISK_ON_DRAIN_OVERWRITE = 64;
pub const PLACEMENT_OPTIONS_DONT_RESUME_AVAILABILTY_SET_VMS_WITH_EXISTING_TEMP_DISK = 128;
pub const PLACEMENT_OPTIONS_SAVE_AVAILABILTY_SET_VMS_WITH_LOCAL_DISK_ON_DRAIN_OVERWRITE = 256;
pub const PLACEMENT_OPTIONS_AVAILABILITY_SET_DOMAIN_AFFINITY = 512;
pub const PLACEMENT_OPTIONS_ALL = 1023;
pub const GRP_PLACEMENT_OPTIONS_MIN_VALUE = 0;
pub const GRP_PLACEMENT_OPTIONS_DEFAULT = 0;
pub const GRP_PLACEMENT_OPTIONS_DISABLE_AUTOBALANCING = 1;
pub const GRP_PLACEMENT_OPTIONS_ALL = 1;
pub const SrReplicatedDiskTypeNone = 0;
pub const SrReplicatedDiskTypeSource = 1;
pub const SrReplicatedDiskTypeLogSource = 2;
pub const SrReplicatedDiskTypeDestination = 3;
pub const SrReplicatedDiskTypeLogDestination = 4;
pub const SrReplicatedDiskTypeNotInParthership = 5;
pub const SrReplicatedDiskTypeLogNotInParthership = 6;
pub const SrReplicatedDiskTypeOther = 7;
pub const SrDiskReplicationEligibleNone = 0;
pub const SrDiskReplicationEligibleYes = 1;
pub const SrDiskReplicationEligibleOffline = 2;
pub const SrDiskReplicationEligibleNotGpt = 3;
pub const SrDiskReplicationEligiblePartitionLayoutMismatch = 4;
pub const SrDiskReplicationEligibleInsufficientFreeSpace = 5;
pub const SrDiskReplicationEligibleNotInSameSite = 6;
pub const SrDiskReplicationEligibleInSameSite = 7;
pub const SrDiskReplicationEligibleFileSystemNotSupported = 8;
pub const SrDiskReplicationEligibleAlreadyInReplication = 9;
pub const SrDiskReplicationEligibleSameAsSpecifiedDisk = 10;
pub const SrDiskReplicationEligibleOther = 9999;
pub const VmResdllContextTurnOff = 0;
pub const VmResdllContextSave = 1;
pub const VmResdllContextShutdown = 2;
pub const VmResdllContextShutdownForce = 3;
pub const VmResdllContextLiveMigration = 4;
pub const ResdllContextOperationTypeFailback = 0;
pub const ResdllContextOperationTypeDrain = 1;
pub const ResdllContextOperationTypeDrainFailure = 2;
pub const ResdllContextOperationTypeEmbeddedFailure = 3;
pub const ResdllContextOperationTypePreemption = 4;
pub const ResdllContextOperationTypeNetworkDisconnect = 5;
pub const ResdllContextOperationTypeNetworkDisconnectMoveRetry = 6;
pub const LOG_INFORMATION = 0;
pub const LOG_WARNING = 1;
pub const LOG_ERROR = 2;
pub const LOG_SEVERE = 3;
pub const ResourceExitStateContinue = 0;
pub const ResourceExitStateTerminate = 1;
pub const ResourceExitStateMax = 2;
pub const FAILURE_TYPE_GENERAL = 0;
pub const FAILURE_TYPE_EMBEDDED = 1;
pub const FAILURE_TYPE_NETWORK_LOSS = 2;
pub const ClusterResourceApplicationStateUnknown = 1;
pub const ClusterResourceApplicationOSHeartBeat = 2;
pub const ClusterResourceApplicationReady = 3;
pub const RmonInitializing = 0;
pub const RmonIdle = 1;
pub const RmonStartingResource = 2;
pub const RmonInitializingResource = 3;
pub const RmonOnlineResource = 4;
pub const RmonOfflineResource = 5;
pub const RmonShutdownResource = 6;
pub const RmonDeletingResource = 7;
pub const RmonIsAlivePoll = 8;
pub const RmonLooksAlivePoll = 9;
pub const RmonArbitrateResource = 10;
pub const RmonReleaseResource = 11;
pub const RmonResourceControl = 12;
pub const RmonResourceTypeControl = 13;
pub const RmonTerminateResource = 14;
pub const RmonDeadlocked = 15;
pub const ClusterRoleDHCP = 0;
pub const ClusterRoleDTC = 1;
pub const ClusterRoleFileServer = 2;
pub const ClusterRoleGenericApplication = 3;
pub const ClusterRoleGenericScript = 4;
pub const ClusterRoleGenericService = 5;
pub const ClusterRoleISCSINameServer = 6;
pub const ClusterRoleMSMQ = 7;
pub const ClusterRoleNFS = 8;
pub const ClusterRolePrintServer = 9;
pub const ClusterRoleStandAloneNamespaceServer = 10;
pub const ClusterRoleVolumeShadowCopyServiceTask = 11;
pub const ClusterRoleWINS = 12;
pub const ClusterRoleTaskScheduler = 13;
pub const ClusterRoleNetworkFileSystem = 14;
pub const ClusterRoleDFSReplicatedFolder = 15;
pub const ClusterRoleDistributedFileSystem = 16;
pub const ClusterRoleDistributedNetworkName = 17;
pub const ClusterRoleFileShare = 18;
pub const ClusterRoleFileShareWitness = 19;
pub const ClusterRoleHardDisk = 20;
pub const ClusterRoleIPAddress = 21;
pub const ClusterRoleIPV6Address = 22;
pub const ClusterRoleIPV6TunnelAddress = 23;
pub const ClusterRoleISCSITargetServer = 24;
pub const ClusterRoleNetworkName = 25;
pub const ClusterRolePhysicalDisk = 26;
pub const ClusterRoleSODAFileServer = 27;
pub const ClusterRoleStoragePool = 28;
pub const ClusterRoleVirtualMachine = 29;
pub const ClusterRoleVirtualMachineConfiguration = 30;
pub const ClusterRoleVirtualMachineReplicaBroker = 31;
pub const ClusterRoleKeyValueStore = 32;
pub const ClusterRoleUnknown = -1;
pub const ClusterRoleClustered = 0;
pub const ClusterRoleUnclustered = 1;
pub const CLUADMEX_OT_NONE = 0;
pub const CLUADMEX_OT_CLUSTER = 1;
pub const CLUADMEX_OT_NODE = 2;
pub const CLUADMEX_OT_GROUP = 3;
pub const CLUADMEX_OT_RESOURCE = 4;
pub const CLUADMEX_OT_RESOURCETYPE = 5;
pub const CLUADMEX_OT_NETWORK = 6;
pub const CLUADMEX_OT_NETINTERFACE = 7;

pub const aliases = struct {
    pub const CLUSTER_QUORUM_TYPE = i32;
    pub const NODE_CLUSTER_STATE = i32;
    pub const CLUSTER_RESOURCE_STATE_CHANGE_REASON = i32;
    pub const CLUSTER_REG_COMMAND = i32;
    pub const CLUSGROUP_TYPE = i32;
    pub const CLUSTER_MGMT_POINT_TYPE = i32;
    pub const CLUSTER_MGMT_POINT_RESTYPE = i32;
    pub const CLUSTER_CLOUD_TYPE = i32;
    pub const CLUS_GROUP_START_SETTING = i32;
    pub const CLUS_AFFINITY_RULE_TYPE = i32;
    pub const CLUS_ADAPTER_EXCLUSION_TYPE = i32;
    pub const CLUSTER_QUORUM_VALUE = i32;
    pub const CLUSTER_UPGRADE_PHASE = i32;
    pub const CLUSTER_CHANGE = i32;
    pub const CLUSTER_NOTIFICATIONS_VERSION = i32;
    pub const CLUSTER_CHANGE_CLUSTER_V2 = i32;
    pub const CLUSTER_CHANGE_GROUP_V2 = i32;
    pub const CLUSTER_CHANGE_GROUPSET_V2 = i32;
    pub const CLUSTER_CHANGE_RESOURCE_V2 = i32;
    pub const CLUSTER_CHANGE_RESOURCE_TYPE_V2 = i32;
    pub const CLUSTER_CHANGE_NETINTERFACE_V2 = i32;
    pub const CLUSTER_CHANGE_NETWORK_V2 = i32;
    pub const CLUSTER_CHANGE_NODE_V2 = i32;
    pub const CLUSTER_CHANGE_REGISTRY_V2 = i32;
    pub const CLUSTER_CHANGE_QUORUM_V2 = i32;
    pub const CLUSTER_CHANGE_SHARED_VOLUME_V2 = i32;
    pub const CLUSTER_CHANGE_SPACEPORT_V2 = i32;
    pub const CLUSTER_CHANGE_NODE_UPGRADE_PHASE_V2 = i32;
    pub const CLUSTER_OBJECT_TYPE = i32;
    pub const CLUSTERSET_OBJECT_TYPE = i32;
    pub const CLUSTER_ENUM = i32;
    pub const CLUSTER_NODE_ENUM = i32;
    pub const CLUSTER_NODE_STATE = i32;
    pub const CLUSTER_STORAGENODE_STATE = i32;
    pub const CLUSTER_NODE_DRAIN_STATUS = i32;
    pub const CLUSTER_NODE_STATUS = i32;
    pub const CLUSTER_NODE_FAILBACK_STATUS = i32;
    pub const CLUSTER_GROUP_ENUM = i32;
    pub const CLUSTER_GROUP_STATE = i32;
    pub const CLUSTER_GROUP_PRIORITY = i32;
    pub const CLUSTER_GROUP_AUTOFAILBACK_TYPE = i32;
    pub const CLUSTER_NODE_RESUME_FAILBACK_TYPE = i32;
    pub const CLUSTER_RESOURCE_STATE = i32;
    pub const CLUSTER_RESOURCE_RESTART_ACTION = i32;
    pub const CLUSTER_RESOURCE_EMBEDDED_FAILURE_ACTION = i32;
    pub const CLUSTER_RESOURCE_CREATE_FLAGS = i32;
    pub const CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE = i32;
    pub const CLUSTER_PROPERTY_TYPE = i32;
    pub const CLUSTER_PROPERTY_FORMAT = i32;
    pub const CLUSTER_PROPERTY_SYNTAX = u32;
    pub const CLUSTER_CONTROL_OBJECT = i32;
    pub const CLCTL_CODES = i32;
    pub const CLUSCTL_RESOURCE_CODES = i32;
    pub const CLUSCTL_RESOURCE_TYPE_CODES = i32;
    pub const CLUSCTL_GROUP_CODES = i32;
    pub const CLUSCTL_NODE_CODES = i32;
    pub const CLUSCTL_NETWORK_CODES = i32;
    pub const CLUSCTL_NETINTERFACE_CODES = i32;
    pub const CLUSCTL_CLUSTER_CODES = i32;
    pub const CLUSCTL_GROUPSET_CODES = i32;
    pub const CLUSCTL_AFFINITYRULE_CODES = i32;
    pub const CLUSTER_RESOURCE_CLASS = i32;
    pub const CLUS_RESSUBCLASS = i32;
    pub const CLUS_RESSUBCLASS_STORAGE = i32;
    pub const CLUS_RESSUBCLASS_NETWORK = i32;
    pub const CLUS_CHARACTERISTICS = i32;
    pub const CLUS_FLAGS = i32;
    pub const CLUSPROP_PIFLAGS = i32;
    pub const CLUSTER_CSV_VOLUME_FAULT_STATE = i32;
    pub const CLUSTER_SHARED_VOLUME_BACKUP_STATE = i32;
    pub const CLUSTER_SHARED_VOLUME_STATE = i32;
    pub const CLUSTER_SHARED_VOLUME_RENAME_INPUT_TYPE = i32;
    pub const MAINTENANCE_MODE_TYPE_ENUM = i32;
    pub const CLUSPROP_IPADDR_ENABLENETBIOS = i32;
    pub const FILESHARE_CHANGE_ENUM = i32;
    pub const CLUSTER_RESOURCE_ENUM = i32;
    pub const CLUSTER_RESOURCE_TYPE_ENUM = i32;
    pub const CLUSTER_NETWORK_ENUM = i32;
    pub const CLUSTER_NETWORK_STATE = i32;
    pub const CLUSTER_NETWORK_ROLE = i32;
    pub const CLUSTER_NETINTERFACE_STATE = i32;
    pub const CLUSTER_SETUP_PHASE = i32;
    pub const CLUSTER_SETUP_PHASE_TYPE = i32;
    pub const CLUSTER_SETUP_PHASE_SEVERITY = i32;
    pub const PLACEMENT_OPTIONS = i32;
    pub const GRP_PLACEMENT_OPTIONS = i32;
    pub const SR_REPLICATED_DISK_TYPE = i32;
    pub const SR_DISK_REPLICATION_ELIGIBLE = i32;
    pub const VM_RESDLL_CONTEXT = i32;
    pub const RESDLL_CONTEXT_OPERATION_TYPE = i32;
    pub const LOG_LEVEL = i32;
    pub const RESOURCE_EXIT_STATE = i32;
    pub const FAILURE_TYPE = i32;
    pub const CLUSTER_RESOURCE_APPLICATION_STATE = i32;
    pub const RESOURCE_MONITOR_STATE = i32;
    pub const CLUSTER_ROLE = i32;
    pub const CLUSTER_ROLE_STATE = i32;
    pub const CLUADMEX_OBJECT_TYPE = i32;
    pub const HCHANGE = isize;
    pub const HCLUSCRYPTPROVIDER = isize;
    pub const HCLUSENUM = isize;
    pub const HCLUSENUMEX = isize;
    pub const HCLUSTER = isize;
    pub const HGROUP = isize;
    pub const HGROUPENUM = isize;
    pub const HGROUPENUMEX = isize;
    pub const HGROUPSET = isize;
    pub const HGROUPSETENUM = isize;
    pub const HNETINTERFACE = isize;
    pub const HNETINTERFACEENUM = isize;
    pub const HNETWORK = isize;
    pub const HNETWORKENUM = isize;
    pub const HNODE = isize;
    pub const HNODEENUM = isize;
    pub const HNODEENUMEX = isize;
    pub const HREGBATCH = isize;
    pub const HREGBATCHNOTIFICATION = isize;
    pub const HREGBATCHPORT = isize;
    pub const HREGREADBATCH = isize;
    pub const HREGREADBATCHREPLY = isize;
    pub const HRESENUM = isize;
    pub const HRESENUMEX = isize;
    pub const HRESOURCE = isize;
    pub const HRESTYPEENUM = isize;
    pub const PCLUSAPI_PFN_REASON_HANDLER = ?*const anyopaque;
    pub const PCLUSAPI_SET_REASON_HANDLER = ?*const anyopaque;
    pub const PCLUSAPI_GET_NODE_CLUSTER_STATE = ?*const anyopaque;
    pub const PCLUSAPI_OPEN_CLUSTER = ?*const anyopaque;
    pub const PCLUSAPI_OPEN_CLUSTER_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLOSE_CLUSTER = ?*const anyopaque;
    pub const PCLUSAPI_SetClusterName = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_NAME_EX = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_INFORMATION = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_QUORUM_RESOURCE = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_QUORUM_RESOURCE = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_QUORUM_RESOURCE_EX = ?*const anyopaque;
    pub const PCLUSAPI_BACKUP_CLUSTER_DATABASE = ?*const anyopaque;
    pub const PCLUSAPI_RESTORE_CLUSTER_DATABASE = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_NETWORK_PRIORITY_ORDER = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_SERVICE_ACCOUNT_PASSWORD = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_CONTROL = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_CONTROL_EX = ?*const anyopaque;
    pub const PCLUSTER_UPGRADE_PROGRESS_CALLBACK = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_UPGRADE = ?*const anyopaque;
    pub const PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT_V2 = ?*const anyopaque;
    pub const PCLUSAPI_REGISTER_CLUSTER_NOTIFY_V2 = ?*const anyopaque;
    pub const PCLUSAPI_GET_NOTIFY_EVENT_HANDLE_V2 = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_NOTIFY_V2 = ?*const anyopaque;
    pub const PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT = ?*const anyopaque;
    pub const PCLUSAPI_REGISTER_CLUSTER_NOTIFY = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_NOTIFY = ?*const anyopaque;
    pub const PCLUSAPI_CLOSE_CLUSTER_NOTIFY_PORT = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_OPEN_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_GET_ENUM_COUNT = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_CLOSE_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_OPEN_ENUM_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_GET_ENUM_COUNT_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_ENUM_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_CLOSE_ENUM_EX = ?*const anyopaque;
    pub const PCLUSAPI_CREATE_CLUSTER_GROUP_GROUPSET = ?*const anyopaque;
    pub const PCLUSAPI_OPEN_CLUSTER_GROUP_GROUPSET = ?*const anyopaque;
    pub const PCLUSAPI_CLOSE_CLUSTER_GROUP_GROUPSET = ?*const anyopaque;
    pub const PCLUSAPI_DELETE_CLUSTER_GROUP_GROUPSET = ?*const anyopaque;
    pub const PCLUSAPI_DELETE_CLUSTER_GROUP_GROUPSET_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_ADD_GROUP_TO_GROUP_GROUPSET = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_ADD_GROUP_TO_GROUPSET_WITH_DOMAINS_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUPSET = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_GROUPSET_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_GROUP_GROUPSET_CONTROL = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_GROUP_GROUPSET_CONTROL_EX = ?*const anyopaque;
    pub const PCLUSAPI_ADD_CLUSTER_GROUP_DEPENDENCY = ?*const anyopaque;
    pub const PCLUSAPI_ADD_CLUSTER_GROUP_DEPENDENCY_EX = ?*const anyopaque;
    pub const PCLUSAPI_SET_GROUP_DEPENDENCY_EXPRESSION = ?*const anyopaque;
    pub const PCLUSAPI_SET_GROUP_DEPENDENCY_EXPRESSION_EX = ?*const anyopaque;
    pub const PCLUSAPI_REMOVE_CLUSTER_GROUP_DEPENDENCY = ?*const anyopaque;
    pub const PCLUSAPI_REMOVE_CLUSTER_GROUP_DEPENDENCY_EX = ?*const anyopaque;
    pub const PCLUSAPI_ADD_CLUSTER_GROUP_GROUPSET_DEPENDENCY = ?*const anyopaque;
    pub const PCLUSAPI_ADD_CLUSTER_GROUP_GROUPSET_DEPENDENCY_EX = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_GROUP_GROUPSET_DEPENDENCY_EXPRESSION = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_GROUP_GROUPSET_DEPENDENCY_EXPRESSION_EX = ?*const anyopaque;
    pub const PCLUSAPI_REMOVE_CLUSTER_GROUP_GROUPSET_DEPENDENCY = ?*const anyopaque;
    pub const PCLUSAPI_REMOVE_CLUSTER_GROUP_GROUPSET_DEPENDENCY_EX = ?*const anyopaque;
    pub const PCLUSAPI_ADD_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY = ?*const anyopaque;
    pub const PCLUSAPI_ADD_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY_EX = ?*const anyopaque;
    pub const PCLUSAPI_REMOVE_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY = ?*const anyopaque;
    pub const PCLUSAPI_REMOVE_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY_EX = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_FROM_GROUP_GROUPSET = ?*const anyopaque;
    pub const PCLUSAPI_ADD_CROSS_CLUSTER_GROUPSET_DEPENDENCY = ?*const anyopaque;
    pub const PCLUSAPI_REMOVE_CROSS_CLUSTER_GROUPSET_DEPENDENCY = ?*const anyopaque;
    pub const PCLUSAPI_CREATE_CLUSTER_AVAILABILITY_SET = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_CREATE_AFFINITY_RULE = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REMOVE_AFFINITY_RULE = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_ADD_GROUP_TO_AFFINITY_RULE = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REMOVE_GROUP_FROM_AFFINITY_RULE = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_AFFINITY_RULE_CONTROL = ?*const anyopaque;
    pub const PCLUSAPI_OPEN_CLUSTER_NODE = ?*const anyopaque;
    pub const PCLUSAPI_OPEN_CLUSTER_NODE_EX = ?*const anyopaque;
    pub const PCLUSAPI_OPEN_NODE_BY_ID = ?*const anyopaque;
    pub const PCLUSAPI_CLOSE_CLUSTER_NODE = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_NODE_STATE = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_NODE_ID = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_FROM_NODE = ?*const anyopaque;
    pub const PCLUSAPI_PAUSE_CLUSTER_NODE = ?*const anyopaque;
    pub const PCLUSAPI_RESUME_CLUSTER_NODE = ?*const anyopaque;
    pub const PCLUSAPI_EVICT_CLUSTER_NODE = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NODE_OPEN_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NODE_OPEN_ENUM_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NODE_GET_ENUM_COUNT_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NODE_ENUM_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NODE_CLOSE_ENUM_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NODE_GET_ENUM_COUNT = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NODE_CLOSE_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NODE_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_EVICT_CLUSTER_NODE_EX = ?*const anyopaque;
    pub const PCLUSAPI_EVICT_CLUSTER_NODE_EX2 = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_RESOURCE_TYPE_KEY = ?*const anyopaque;
    pub const PCLUSAPI_CREATE_CLUSTER_GROUP = ?*const anyopaque;
    pub const PCLUSAPI_OPEN_CLUSTER_GROUP = ?*const anyopaque;
    pub const PCLUSAPI_OPEN_CLUSTER_GROUP_EX = ?*const anyopaque;
    pub const PCLUSAPI_PAUSE_CLUSTER_NODE_EX = ?*const anyopaque;
    pub const PCLUSAPI_PAUSE_CLUSTER_NODE_EX2 = ?*const anyopaque;
    pub const PCLUSAPI_RESUME_CLUSTER_NODE_EX = ?*const anyopaque;
    pub const PCLUSAPI_RESUME_CLUSTER_NODE_EX2 = ?*const anyopaque;
    pub const PCLUSAPI_CREATE_CLUSTER_GROUPEX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_GROUP_OPEN_ENUM_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_GROUP_GET_ENUM_COUNT_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_GROUP_ENUM_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_GET_ENUM_COUNT_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_ENUM_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_CLOSE_ENUM_EX = ?*const anyopaque;
    pub const PCLUSAPI_RESTART_CLUSTER_RESOURCE = ?*const anyopaque;
    pub const PCLUSAPI_RESTART_CLUSTER_RESOURCE_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLOSE_CLUSTER_GROUP = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_FROM_GROUP = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_GROUP_STATE = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_GROUP_NAME = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_GROUP_NAME_EX = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST_EX = ?*const anyopaque;
    pub const PCLUSAPI_ONLINE_CLUSTER_GROUP = ?*const anyopaque;
    pub const PCLUSAPI_MOVE_CLUSTER_GROUP = ?*const anyopaque;
    pub const PCLUSAPI_OFFLINE_CLUSTER_GROUP = ?*const anyopaque;
    pub const PCLUSAPI_DELETE_CLUSTER_GROUP = ?*const anyopaque;
    pub const PCLUSAPI_DESTROY_CLUSTER_GROUP = ?*const anyopaque;
    pub const PCLUSAPI_DELETE_CLUSTER_GROUP_EX = ?*const anyopaque;
    pub const PCLUSAPI_DESTROY_CLUSTER_GROUP_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_GROUP_OPEN_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_GROUP_GET_ENUM_COUNT = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_GROUP_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_GROUP_CLOSE_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CREATE_CLUSTER_RESOURCE = ?*const anyopaque;
    pub const PCLUSAPI_CREATE_CLUSTER_RESOURCE_EX = ?*const anyopaque;
    pub const PCLUSAPI_OPEN_CLUSTER_RESOURCE = ?*const anyopaque;
    pub const PCLUSAPI_OPEN_CLUSTER_RESOURCE_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLOSE_CLUSTER_RESOURCE = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_FROM_RESOURCE = ?*const anyopaque;
    pub const PCLUSAPI_DELETE_CLUSTER_RESOURCE = ?*const anyopaque;
    pub const PCLUSAPI_DELETE_CLUSTER_RESOURCE_EX = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_RESOURCE_STATE = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_RESOURCE_NAME = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_RESOURCE_NAME_EX = ?*const anyopaque;
    pub const PCLUSAPI_FAIL_CLUSTER_RESOURCE = ?*const anyopaque;
    pub const PCLUSAPI_FAIL_CLUSTER_RESOURCE_EX = ?*const anyopaque;
    pub const PCLUSAPI_ONLINE_CLUSTER_RESOURCE = ?*const anyopaque;
    pub const PCLUSAPI_OFFLINE_CLUSTER_RESOURCE = ?*const anyopaque;
    pub const PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP = ?*const anyopaque;
    pub const PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX = ?*const anyopaque;
    pub const PCLUSAPI_CHANGE_CLUSTER_RESOURCE_GROUP_EX2 = ?*const anyopaque;
    pub const PCLUSAPI_ADD_CLUSTER_RESOURCE_NODE = ?*const anyopaque;
    pub const PCLUSAPI_REMOVE_CLUSTER_RESOURCE_NODE = ?*const anyopaque;
    pub const PCLUSAPI_ADD_CLUSTER_RESOURCE_NODE_EX = ?*const anyopaque;
    pub const PCLUSAPI_REMOVE_CLUSTER_RESOURCE_NODE_EX = ?*const anyopaque;
    pub const PCLUSAPI_ADD_CLUSTER_RESOURCE_DEPENDENCY = ?*const anyopaque;
    pub const PCLUSAPI_REMOVE_CLUSTER_RESOURCE_DEPENDENCY = ?*const anyopaque;
    pub const PCLUSAPI_ADD_CLUSTER_RESOURCE_DEPENDENCY_EX = ?*const anyopaque;
    pub const PCLUSAPI_REMOVE_CLUSTER_RESOURCE_DEPENDENCY_EX = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_RESOURCE_DEPENDENCY_EXPRESSION = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_RESOURCE_DEPENDENCY_EXPRESSION = ?*const anyopaque;
    pub const PCLUSAPI_ADD_RESOURCE_TO_CLUSTER_SHARED_VOLUMES = ?*const anyopaque;
    pub const PCLUSAPI_REMOVE_RESOURCE_FROM_CLUSTER_SHARED_VOLUMES = ?*const anyopaque;
    pub const PCLUSAPI_IS_FILE_ON_CLUSTER_SHARED_VOLUME = ?*const anyopaque;
    pub const PCLUSAPI_SHARED_VOLUME_SET_SNAPSHOT_STATE = ?*const anyopaque;
    pub const PCLUSAPI_CAN_RESOURCE_BE_DEPENDENT = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_CONTROL = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_TYPE_CONTROL = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_GROUP_CONTROL = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_CONTROL_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_CONTROL_AS_USER_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_TYPE_CONTROL_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_TYPE_CONTROL_AS_USER_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_GROUP_CONTROL_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NODE_CONTROL = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NODE_CONTROL_EX = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_RESOURCE_NETWORK_NAME = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_OPEN_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_GET_ENUM_COUNT = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_CLOSE_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE = ?*const anyopaque;
    pub const PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE = ?*const anyopaque;
    pub const PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE_EX = ?*const anyopaque;
    pub const PCLUSAPI_DELETE_CLUSTER_RESOURCE_TYPE_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_TYPE_OPEN_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_TYPE_GET_ENUM_COUNT = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_TYPE_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_RESOURCE_TYPE_CLOSE_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_OPEN_CLUSTER_NETWORK = ?*const anyopaque;
    pub const PCLUSAPI_OPEN_CLUSTER_NETWORK_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLOSE_CLUSTER_NETWORK = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_FROM_NETWORK = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NETWORK_OPEN_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NETWORK_GET_ENUM_COUNT = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NETWORK_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NETWORK_CLOSE_ENUM = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_NETWORK_STATE = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_NETWORK_NAME = ?*const anyopaque;
    pub const PCLUSAPI_SET_CLUSTER_NETWORK_NAME_EX = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_NETWORK_ID = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NETWORK_CONTROL = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NETWORK_CONTROL_EX = ?*const anyopaque;
    pub const PCLUSAPI_OPEN_CLUSTER_NET_INTERFACE = ?*const anyopaque;
    pub const PCLUSAPI_OPEN_CLUSTER_NETINTERFACE_EX = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_NET_INTERFACE = ?*const anyopaque;
    pub const PCLUSAPI_CLOSE_CLUSTER_NET_INTERFACE = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_FROM_NET_INTERFACE = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_NET_INTERFACE_STATE = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NET_INTERFACE_CONTROL = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_NET_INTERFACE_CONTROL_EX = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_KEY = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_GROUP_KEY = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_RESOURCE_KEY = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_NODE_KEY = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_NETWORK_KEY = ?*const anyopaque;
    pub const PCLUSAPI_GET_CLUSTER_NET_INTERFACE_KEY = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_CREATE_KEY = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_CREATE_KEY_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_OPEN_KEY = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_DELETE_KEY = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_DELETE_KEY_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_CLOSE_KEY = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_ENUM_KEY = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_SET_VALUE = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_DELETE_VALUE = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_SET_VALUE_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_DELETE_VALUE_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_QUERY_VALUE = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_ENUM_VALUE = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_QUERY_INFO_KEY = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_GET_KEY_SECURITY = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_SET_KEY_SECURITY = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_SET_KEY_SECURITY_EX = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_SYNC_DATABASE = ?*const anyopaque;
    pub const PCLUSAPI_CLUSTER_REG_CREATE_BATCH = ?*const anyopaque;
    pub const PCLUSTER_REG_BATCH_ADD_COMMAND = ?*const anyopaque;
    pub const PCLUSTER_REG_CLOSE_BATCH = ?*const anyopaque;
    pub const PCLUSTER_REG_BATCH_READ_COMMAND = ?*const anyopaque;
    pub const PCLUSTER_REG_BATCH_CLOSE_NOTIFICATION = ?*const anyopaque;
    pub const PCLUSTER_REG_CREATE_BATCH_NOTIFY_PORT = ?*const anyopaque;
    pub const PCLUSTER_REG_CLOSE_BATCH_NOTIFY_PORT = ?*const anyopaque;
    pub const PCLUSTER_REG_GET_BATCH_NOTIFICATION = ?*const anyopaque;
    pub const PCLUSTER_REG_CREATE_READ_BATCH = ?*const anyopaque;
    pub const PCLUSTER_REG_READ_BATCH_ADD_COMMAND = ?*const anyopaque;
    pub const PCLUSTER_REG_CLOSE_READ_BATCH = ?*const anyopaque;
    pub const PCLUSTER_REG_CLOSE_READ_BATCH_EX = ?*const anyopaque;
    pub const PCLUSTER_REG_READ_BATCH_REPLY_NEXT_COMMAND = ?*const anyopaque;
    pub const PCLUSTER_REG_CLOSE_READ_BATCH_REPLY = ?*const anyopaque;
    pub const PCLUSTER_SET_ACCOUNT_ACCESS = ?*const anyopaque;
    pub const PCLUSTER_SETUP_PROGRESS_CALLBACK = ?*const anyopaque;
    pub const PCLUSAPI_CREATE_CLUSTER = ?*const anyopaque;
    pub const PCLUSAPI_CREATE_CLUSTER_CNOLESS = ?*const anyopaque;
    pub const PCLUSAPI_CREATE_CLUSTER_NAME_ACCOUNT = ?*const anyopaque;
    pub const PCLUSAPI_REPAIR_CLUSTER_NAME_ACCOUNT = ?*const anyopaque;
    pub const PCLUSAPI_REMOVE_CLUSTER_NAME_ACCOUNT = ?*const anyopaque;
    pub const PCLUSAPI_ADD_CLUSTER_NODE = ?*const anyopaque;
    pub const PCLUSAPI_ADD_CLUSTER_NODE_EX = ?*const anyopaque;
    pub const PCLUSAPI_DESTROY_CLUSTER = ?*const anyopaque;
    pub const PSET_RESOURCE_STATUS_ROUTINE_EX = ?*const anyopaque;
    pub const PSET_RESOURCE_STATUS_ROUTINE = ?*const anyopaque;
    pub const PQUORUM_RESOURCE_LOST = ?*const anyopaque;
    pub const PLOG_EVENT_ROUTINE = ?*const anyopaque;
    pub const POPEN_ROUTINE = ?*const anyopaque;
    pub const PCLOSE_ROUTINE = ?*const anyopaque;
    pub const PONLINE_ROUTINE = ?*const anyopaque;
    pub const POFFLINE_ROUTINE = ?*const anyopaque;
    pub const PTERMINATE_ROUTINE = ?*const anyopaque;
    pub const PIS_ALIVE_ROUTINE = ?*const anyopaque;
    pub const PLOOKS_ALIVE_ROUTINE = ?*const anyopaque;
    pub const PARBITRATE_ROUTINE = ?*const anyopaque;
    pub const PRELEASE_ROUTINE = ?*const anyopaque;
    pub const PRESOURCE_CONTROL_ROUTINE = ?*const anyopaque;
    pub const PRESOURCE_TYPE_CONTROL_ROUTINE = ?*const anyopaque;
    pub const POPEN_V2_ROUTINE = ?*const anyopaque;
    pub const PONLINE_V2_ROUTINE = ?*const anyopaque;
    pub const POFFLINE_V2_ROUTINE = ?*const anyopaque;
    pub const PCANCEL_ROUTINE = ?*const anyopaque;
    pub const PBEGIN_RESCALL_ROUTINE = ?*const anyopaque;
    pub const PBEGIN_RESTYPECALL_ROUTINE = ?*const anyopaque;
    pub const PBEGIN_RESCALL_AS_USER_ROUTINE = ?*const anyopaque;
    pub const PBEGIN_RESTYPECALL_AS_USER_ROUTINE = ?*const anyopaque;
    pub const PSTARTUP_ROUTINE = ?*const anyopaque;
    pub const PSET_RESOURCE_LOCKED_MODE_ROUTINE = ?*const anyopaque;
    pub const PSIGNAL_FAILURE_ROUTINE = ?*const anyopaque;
    pub const PSET_RESOURCE_INMEMORY_NODELOCAL_PROPERTIES_ROUTINE = ?*const anyopaque;
    pub const PEND_CONTROL_CALL = ?*const anyopaque;
    pub const PEND_TYPE_CONTROL_CALL = ?*const anyopaque;
    pub const PEXTEND_RES_CONTROL_CALL = ?*const anyopaque;
    pub const PEXTEND_RES_TYPE_CONTROL_CALL = ?*const anyopaque;
    pub const PRAISE_RES_TYPE_NOTIFICATION = ?*const anyopaque;
    pub const PCHANGE_RESOURCE_PROCESS_FOR_DUMPS = ?*const anyopaque;
    pub const PCHANGE_RES_TYPE_PROCESS_FOR_DUMPS = ?*const anyopaque;
    pub const PSET_INTERNAL_STATE = ?*const anyopaque;
    pub const PSET_RESOURCE_LOCKED_MODE_EX_ROUTINE = ?*const anyopaque;
    pub const PREQUEST_DUMP_ROUTINE = ?*const anyopaque;
    pub const PSET_RESOURCE_WPR_POLICY_ROUTINE = ?*const anyopaque;
    pub const PARM_WPR_WATCHDOG_FOR_CURRENT_RESOURCE_CALL_ROUTINE = ?*const anyopaque;
    pub const PSTARTUP_EX_ROUTINE = ?*const anyopaque;
    pub const PRESUTIL_START_RESOURCE_SERVICE = ?*const anyopaque;
    pub const PRESUTIL_VERIFY_RESOURCE_SERVICE = ?*const anyopaque;
    pub const PRESUTIL_STOP_RESOURCE_SERVICE = ?*const anyopaque;
    pub const PRESUTIL_VERIFY_SERVICE = ?*const anyopaque;
    pub const PRESUTIL_STOP_SERVICE = ?*const anyopaque;
    pub const PRESUTIL_CREATE_DIRECTORY_TREE = ?*const anyopaque;
    pub const PRESUTIL_IS_PATH_VALID = ?*const anyopaque;
    pub const PRESUTIL_ENUM_PROPERTIES = ?*const anyopaque;
    pub const PRESUTIL_ENUM_PRIVATE_PROPERTIES = ?*const anyopaque;
    pub const PRESUTIL_GET_PROPERTIES = ?*const anyopaque;
    pub const PRESUTIL_GET_ALL_PROPERTIES = ?*const anyopaque;
    pub const PRESUTIL_GET_PRIVATE_PROPERTIES = ?*const anyopaque;
    pub const PRESUTIL_GET_PROPERTY_SIZE = ?*const anyopaque;
    pub const PRESUTIL_GET_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_VERIFY_PROPERTY_TABLE = ?*const anyopaque;
    pub const PRESUTIL_SET_PROPERTY_TABLE = ?*const anyopaque;
    pub const PRESUTIL_SET_PROPERTY_TABLE_EX = ?*const anyopaque;
    pub const PRESUTIL_SET_PROPERTY_PARAMETER_BLOCK = ?*const anyopaque;
    pub const PRESUTIL_SET_PROPERTY_PARAMETER_BLOCK_EX = ?*const anyopaque;
    pub const PRESUTIL_SET_UNKNOWN_PROPERTIES = ?*const anyopaque;
    pub const PRESUTIL_GET_PROPERTIES_TO_PARAMETER_BLOCK = ?*const anyopaque;
    pub const PRESUTIL_PROPERTY_LIST_FROM_PARAMETER_BLOCK = ?*const anyopaque;
    pub const PRESUTIL_DUP_PARAMETER_BLOCK = ?*const anyopaque;
    pub const PRESUTIL_FREE_PARAMETER_BLOCK = ?*const anyopaque;
    pub const PRESUTIL_ADD_UNKNOWN_PROPERTIES = ?*const anyopaque;
    pub const PRESUTIL_SET_PRIVATE_PROPERTY_LIST = ?*const anyopaque;
    pub const PRESUTIL_VERIFY_PRIVATE_PROPERTY_LIST = ?*const anyopaque;
    pub const PRESUTIL_DUP_STRING = ?*const anyopaque;
    pub const PRESUTIL_GET_BINARY_VALUE = ?*const anyopaque;
    pub const PRESUTIL_GET_SZ_VALUE = ?*const anyopaque;
    pub const PRESUTIL_GET_EXPAND_SZ_VALUE = ?*const anyopaque;
    pub const PRESUTIL_GET_DWORD_VALUE = ?*const anyopaque;
    pub const PRESUTIL_GET_QWORD_VALUE = ?*const anyopaque;
    pub const PRESUTIL_SET_BINARY_VALUE = ?*const anyopaque;
    pub const PRESUTIL_SET_SZ_VALUE = ?*const anyopaque;
    pub const PRESUTIL_SET_EXPAND_SZ_VALUE = ?*const anyopaque;
    pub const PRESUTIL_SET_MULTI_SZ_VALUE = ?*const anyopaque;
    pub const PRESUTIL_SET_DWORD_VALUE = ?*const anyopaque;
    pub const PRESUTIL_SET_QWORD_VALUE = ?*const anyopaque;
    pub const PRESUTIL_GET_BINARY_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_GET_SZ_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_GET_MULTI_SZ_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_GET_DWORD_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_GET_LONG_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_GET_FILETIME_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_GET_ENVIRONMENT_WITH_NET_NAME = ?*const anyopaque;
    pub const PRESUTIL_FREE_ENVIRONMENT = ?*const anyopaque;
    pub const PRESUTIL_EXPAND_ENVIRONMENT_STRINGS = ?*const anyopaque;
    pub const PRESUTIL_SET_RESOURCE_SERVICE_ENVIRONMENT = ?*const anyopaque;
    pub const PRESUTIL_REMOVE_RESOURCE_SERVICE_ENVIRONMENT = ?*const anyopaque;
    pub const PRESUTIL_SET_RESOURCE_SERVICE_START_PARAMETERS = ?*const anyopaque;
    pub const PRESUTIL_FIND_SZ_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_FIND_EXPAND_SZ_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_FIND_EXPANDED_SZ_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_FIND_DWORD_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_FIND_BINARY_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_FIND_MULTI_SZ_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_FIND_LONG_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_FIND_ULARGEINTEGER_PROPERTY = ?*const anyopaque;
    pub const PRESUTIL_FIND_FILETIME_PROPERTY = ?*const anyopaque;
    pub const PWORKER_START_ROUTINE = ?*const anyopaque;
    pub const PCLUSAPI_CLUS_WORKER_CREATE = ?*const anyopaque;
    pub const PCLUSAPIClusWorkerCheckTerminate = ?*const anyopaque;
    pub const PCLUSAPI_CLUS_WORKER_TERMINATE = ?*const anyopaque;
    pub const LPRESOURCE_CALLBACK = ?*const anyopaque;
    pub const LPRESOURCE_CALLBACK_EX = ?*const anyopaque;
    pub const LPGROUP_CALLBACK_EX = ?*const anyopaque;
    pub const LPNODE_CALLBACK = ?*const anyopaque;
    pub const PRESUTIL_RESOURCES_EQUAL = ?*const anyopaque;
    pub const PRESUTIL_RESOURCE_TYPES_EQUAL = ?*const anyopaque;
    pub const PRESUTIL_IS_RESOURCE_CLASS_EQUAL = ?*const anyopaque;
    pub const PRESUTIL_ENUM_RESOURCES = ?*const anyopaque;
    pub const PRESUTIL_ENUM_RESOURCES_EX = ?*const anyopaque;
    pub const PRESUTIL_GET_RESOURCE_DEPENDENCY = ?*const anyopaque;
    pub const PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_NAME = ?*const anyopaque;
    pub const PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_CLASS = ?*const anyopaque;
    pub const PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY = ?*const anyopaque;
    pub const PRESUTIL_GET_RESOURCE_DEPENDENTIP_ADDRESS_PROPS = ?*const anyopaque;
    pub const PRESUTIL_FIND_DEPENDENT_DISK_RESOURCE_DRIVE_LETTER = ?*const anyopaque;
    pub const PRESUTIL_TERMINATE_SERVICE_PROCESS_FROM_RES_DLL = ?*const anyopaque;
    pub const PRESUTIL_GET_PROPERTY_FORMATS = ?*const anyopaque;
    pub const PRESUTIL_GET_CORE_CLUSTER_RESOURCES = ?*const anyopaque;
    pub const PRESUTIL_GET_RESOURCE_NAME = ?*const anyopaque;
    pub const PCLUSTER_IS_PATH_ON_SHARED_VOLUME = ?*const anyopaque;
    pub const PCLUSTER_GET_VOLUME_PATH_NAME = ?*const anyopaque;
    pub const PCLUSTER_GET_VOLUME_NAME_FOR_VOLUME_MOUNT_POINT = ?*const anyopaque;
    pub const PCLUSTER_PREPARE_SHARED_VOLUME_FOR_BACKUP = ?*const anyopaque;
    pub const PCLUSTER_CLEAR_BACKUP_STATE_FOR_SHARED_VOLUME = ?*const anyopaque;
    pub const PRESUTIL_SET_RESOURCE_SERVICE_START_PARAMETERS_EX = ?*const anyopaque;
    pub const PRESUTIL_ENUM_RESOURCES_EX2 = ?*const anyopaque;
    pub const PRESUTIL_GET_RESOURCE_DEPENDENCY_EX = ?*const anyopaque;
    pub const PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_NAME_EX = ?*const anyopaque;
    pub const PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_CLASS_EX = ?*const anyopaque;
    pub const PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY_EX = ?*const anyopaque;
    pub const PRESUTIL_GET_CORE_CLUSTER_RESOURCES_EX = ?*const anyopaque;
    pub const POPEN_CLUSTER_CRYPT_PROVIDER = ?*const anyopaque;
    pub const POPEN_CLUSTER_CRYPT_PROVIDEREX = ?*const anyopaque;
    pub const PCLOSE_CLUSTER_CRYPT_PROVIDER = ?*const anyopaque;
    pub const PCLUSTER_ENCRYPT = ?*const anyopaque;
    pub const PCLUSTER_DECRYPT = ?*const anyopaque;
    pub const PFREE_CLUSTER_CRYPT = ?*const anyopaque;
    pub const PRES_UTIL_VERIFY_SHUTDOWN_SAFE = ?*const anyopaque;
    pub const PREGISTER_APPINSTANCE = ?*const anyopaque;
    pub const PREGISTER_APPINSTANCE_VERSION = ?*const anyopaque;
    pub const PQUERY_APPINSTANCE_VERSION = ?*const anyopaque;
    pub const PRESET_ALL_APPINSTANCE_VERSIONS = ?*const anyopaque;
    pub const SET_APP_INSTANCE_CSV_FLAGS = ?*const anyopaque;
};
