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

pub const method_def_by_name = std.static_string_map.StaticStringMap(MethodRecord).initComptime(.{});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const maxSoHAttributeCount = 100;
pub const maxSoHAttributeSize = 4000;
pub const minNetworkSoHSize = 12;
pub const maxNetworkSoHSize = 4000;
pub const maxStringLength = 1024;
pub const maxSystemHealthEntityCount = 20;
pub const maxEnforcerCount = 20;
pub const maxPrivateDataSize = 200;
pub const maxConnectionCountPerEnforcer = 20;
pub const freshSoHRequest = 1;
pub const shaFixup = 1;
pub const failureCategoryCount = 5;
pub const ComponentTypeEnforcementClientSoH = 1;
pub const ComponentTypeEnforcementClientRp = 2;
pub const percentageNotSupported = 101;
pub const isolationStateNotRestricted = 1;
pub const isolationStateInProbation = 2;
pub const isolationStateRestrictedAccess = 3;
pub const extendedIsolationStateNoData = 0;
pub const extendedIsolationStateTransition = 1;
pub const extendedIsolationStateInfected = 2;
pub const extendedIsolationStateUnknown = 3;
pub const tracingLevelUndefined = 0;
pub const tracingLevelBasic = 1;
pub const tracingLevelAdvanced = 2;
pub const tracingLevelDebug = 3;
pub const failureCategoryNone = 0;
pub const failureCategoryOther = 1;
pub const failureCategoryClientComponent = 2;
pub const failureCategoryClientCommunication = 3;
pub const failureCategoryServerComponent = 4;
pub const failureCategoryServerCommunication = 5;
pub const fixupStateSuccess = 0;
pub const fixupStateInProgress = 1;
pub const fixupStateCouldNotUpdate = 2;
pub const napNotifyTypeUnknown = 0;
pub const napNotifyTypeServiceState = 1;
pub const napNotifyTypeQuarState = 2;
pub const remoteConfigTypeMachine = 1;
pub const remoteConfigTypeConfigBlob = 2;

pub const aliases = struct {
    pub const IsolationState = i32;
    pub const ExtendedIsolationState = i32;
    pub const NapTracingLevel = i32;
    pub const FailureCategory = i32;
    pub const FixupState = i32;
    pub const NapNotifyType = i32;
    pub const RemoteConfigurationType = i32;
};
