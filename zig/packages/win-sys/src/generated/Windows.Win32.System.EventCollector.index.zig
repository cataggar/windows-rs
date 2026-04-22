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
    .{ "EcOpenSubscriptionEnum", MethodRecord{ .library = "WecApi", .import = "EcOpenSubscriptionEnum", .signature = "\x00\x01\x18\x09" } },
    .{ "EcEnumNextSubscription", MethodRecord{ .library = "WecApi", .import = "EcEnumNextSubscription", .signature = "\x00\x04\x11\x59\x18\x09\x11\x05\x0f\x09" } },
    .{ "EcOpenSubscription", MethodRecord{ .library = "WecApi", .import = "EcOpenSubscription", .signature = "\x00\x03\x18\x11\x05\x09\x09" } },
    .{ "EcSetSubscriptionProperty", MethodRecord{ .library = "WecApi", .import = "EcSetSubscriptionProperty", .signature = "\x00\x04\x11\x59\x18\x11\xc0\x00\x41\x89\x09\x0f\x11\xc0\x00\x41\x8d" } },
    .{ "EcGetSubscriptionProperty", MethodRecord{ .library = "WecApi", .import = "EcGetSubscriptionProperty", .signature = "\x00\x06\x11\x59\x18\x11\xc0\x00\x41\x89\x09\x09\x0f\x11\xc0\x00\x41\x8d\x0f\x09" } },
    .{ "EcSaveSubscription", MethodRecord{ .library = "WecApi", .import = "EcSaveSubscription", .signature = "\x00\x02\x11\x59\x18\x09" } },
    .{ "EcDeleteSubscription", MethodRecord{ .library = "WecApi", .import = "EcDeleteSubscription", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "EcGetObjectArraySize", MethodRecord{ .library = "WecApi", .import = "EcGetObjectArraySize", .signature = "\x00\x02\x11\x59\x18\x0f\x09" } },
    .{ "EcSetObjectArrayProperty", MethodRecord{ .library = "WecApi", .import = "EcSetObjectArrayProperty", .signature = "\x00\x05\x11\x59\x18\x11\xc0\x00\x41\x89\x09\x09\x0f\x11\xc0\x00\x41\x8d" } },
    .{ "EcGetObjectArrayProperty", MethodRecord{ .library = "WecApi", .import = "EcGetObjectArrayProperty", .signature = "\x00\x07\x11\x59\x18\x11\xc0\x00\x41\x89\x09\x09\x09\x0f\x11\xc0\x00\x41\x8d\x0f\x09" } },
    .{ "EcInsertObjectArrayElement", MethodRecord{ .library = "WecApi", .import = "EcInsertObjectArrayElement", .signature = "\x00\x02\x11\x59\x18\x09" } },
    .{ "EcRemoveObjectArrayElement", MethodRecord{ .library = "WecApi", .import = "EcRemoveObjectArrayElement", .signature = "\x00\x02\x11\x59\x18\x09" } },
    .{ "EcGetSubscriptionRunTimeStatus", MethodRecord{ .library = "WecApi", .import = "EcGetSubscriptionRunTimeStatus", .signature = "\x00\x07\x11\x59\x11\x05\x11\xc0\x00\x41\x91\x11\x05\x09\x09\x0f\x11\xc0\x00\x41\x8d\x0f\x09" } },
    .{ "EcRetrySubscription", MethodRecord{ .library = "WecApi", .import = "EcRetrySubscription", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x09" } },
    .{ "EcClose", MethodRecord{ .library = "WecApi", .import = "EcClose", .signature = "\x00\x01\x11\x59\x18" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x4189 => TypeRefEntry{ .namespace = "Windows.Win32.System.EventCollector", .name = "EC_SUBSCRIPTION_PROPERTY_ID" },
        0x418d => TypeRefEntry{ .namespace = "Windows.Win32.System.EventCollector", .name = "EC_VARIANT" },
        0x4191 => TypeRefEntry{ .namespace = "Windows.Win32.System.EventCollector", .name = "EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID" },
        else => null,
    };
}

pub const EC_VARIANT_TYPE_MASK = 127;
pub const EC_VARIANT_TYPE_ARRAY = 128;
pub const EC_READ_ACCESS = 1;
pub const EC_WRITE_ACCESS = 2;
pub const EC_OPEN_ALWAYS = 0;
pub const EC_CREATE_NEW = 1;
pub const EC_OPEN_EXISTING = 2;
pub const EcSubscriptionEnabled = 0;
pub const EcSubscriptionEventSources = 1;
pub const EcSubscriptionEventSourceAddress = 2;
pub const EcSubscriptionEventSourceEnabled = 3;
pub const EcSubscriptionEventSourceUserName = 4;
pub const EcSubscriptionEventSourcePassword = 5;
pub const EcSubscriptionDescription = 6;
pub const EcSubscriptionURI = 7;
pub const EcSubscriptionConfigurationMode = 8;
pub const EcSubscriptionExpires = 9;
pub const EcSubscriptionQuery = 10;
pub const EcSubscriptionTransportName = 11;
pub const EcSubscriptionTransportPort = 12;
pub const EcSubscriptionDeliveryMode = 13;
pub const EcSubscriptionDeliveryMaxItems = 14;
pub const EcSubscriptionDeliveryMaxLatencyTime = 15;
pub const EcSubscriptionHeartbeatInterval = 16;
pub const EcSubscriptionLocale = 17;
pub const EcSubscriptionContentFormat = 18;
pub const EcSubscriptionLogFile = 19;
pub const EcSubscriptionPublisherName = 20;
pub const EcSubscriptionCredentialsType = 21;
pub const EcSubscriptionCommonUserName = 22;
pub const EcSubscriptionCommonPassword = 23;
pub const EcSubscriptionHostName = 24;
pub const EcSubscriptionReadExistingEvents = 25;
pub const EcSubscriptionDialect = 26;
pub const EcSubscriptionType = 27;
pub const EcSubscriptionAllowedIssuerCAs = 28;
pub const EcSubscriptionAllowedSubjects = 29;
pub const EcSubscriptionDeniedSubjects = 30;
pub const EcSubscriptionAllowedSourceDomainComputers = 31;
pub const EcSubscriptionPropertyIdEND = 32;
pub const EcSubscriptionCredDefault = 0;
pub const EcSubscriptionCredNegotiate = 1;
pub const EcSubscriptionCredDigest = 2;
pub const EcSubscriptionCredBasic = 3;
pub const EcSubscriptionCredLocalMachine = 4;
pub const EcSubscriptionTypeSourceInitiated = 0;
pub const EcSubscriptionTypeCollectorInitiated = 1;
pub const EcSubscriptionRunTimeStatusActive = 0;
pub const EcSubscriptionRunTimeStatusLastError = 1;
pub const EcSubscriptionRunTimeStatusLastErrorMessage = 2;
pub const EcSubscriptionRunTimeStatusLastErrorTime = 3;
pub const EcSubscriptionRunTimeStatusNextRetryTime = 4;
pub const EcSubscriptionRunTimeStatusEventSources = 5;
pub const EcSubscriptionRunTimeStatusLastHeartbeatTime = 6;
pub const EcSubscriptionRunTimeStatusInfoIdEND = 7;
pub const EcVarTypeNull = 0;
pub const EcVarTypeBoolean = 1;
pub const EcVarTypeUInt32 = 2;
pub const EcVarTypeDateTime = 3;
pub const EcVarTypeString = 4;
pub const EcVarObjectArrayPropertyHandle = 5;
pub const EcConfigurationModeNormal = 0;
pub const EcConfigurationModeCustom = 1;
pub const EcConfigurationModeMinLatency = 2;
pub const EcConfigurationModeMinBandwidth = 3;
pub const EcDeliveryModePull = 1;
pub const EcDeliveryModePush = 2;
pub const EcContentFormatEvents = 1;
pub const EcContentFormatRenderedText = 2;
pub const EcRuntimeStatusActiveStatusDisabled = 1;
pub const EcRuntimeStatusActiveStatusActive = 2;
pub const EcRuntimeStatusActiveStatusInactive = 3;
pub const EcRuntimeStatusActiveStatusTrying = 4;

pub const aliases = struct {
    pub const EC_SUBSCRIPTION_PROPERTY_ID = i32;
    pub const EC_SUBSCRIPTION_CREDENTIALS_TYPE = i32;
    pub const EC_SUBSCRIPTION_TYPE = i32;
    pub const EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID = i32;
    pub const EC_VARIANT_TYPE = i32;
    pub const EC_SUBSCRIPTION_CONFIGURATION_MODE = i32;
    pub const EC_SUBSCRIPTION_DELIVERY_MODE = i32;
    pub const EC_SUBSCRIPTION_CONTENT_FORMAT = i32;
    pub const EC_SUBSCRIPTION_RUNTIME_STATUS_ACTIVE_STATUS = i32;
};
