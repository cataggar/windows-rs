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
    .{ "DevCreateObjectQuery", MethodRecord{ .library = "api-ms-win-devices-query-l1-1-0", .import = "DevCreateObjectQuery", .signature = "\x00\x09\x11\x79\x11\xc0\x00\x5a\x79\x09\x09\x0f\x11\xc0\x00\x5a\x91\x09\x0f\x11\xc0\x00\x54\x40\x12\xc0\x00\x54\x64\x0f\x01\x0f\x11\xa3\x64" } },
    .{ "DevCreateObjectQueryEx", MethodRecord{ .library = "api-ms-win-devices-query-l1-1-1", .import = "DevCreateObjectQueryEx", .signature = "\x00\x0b\x11\x79\x11\xc0\x00\x5a\x79\x09\x09\x0f\x11\xc0\x00\x5a\x91\x09\x0f\x11\xc0\x00\x54\x40\x09\x0f\x11\xc0\x00\x54\x60\x12\xc0\x00\x54\x64\x0f\x01\x0f\x11\xa3\x64" } },
    .{ "DevCreateObjectQueryFromId", MethodRecord{ .library = "api-ms-win-devices-query-l1-1-0", .import = "DevCreateObjectQueryFromId", .signature = "\x00\x0a\x11\x79\x11\xc0\x00\x5a\x79\x11\x05\x09\x09\x0f\x11\xc0\x00\x5a\x91\x09\x0f\x11\xc0\x00\x54\x40\x12\xc0\x00\x54\x64\x0f\x01\x0f\x11\xa3\x64" } },
    .{ "DevCreateObjectQueryFromIdEx", MethodRecord{ .library = "api-ms-win-devices-query-l1-1-1", .import = "DevCreateObjectQueryFromIdEx", .signature = "\x00\x0c\x11\x79\x11\xc0\x00\x5a\x79\x11\x05\x09\x09\x0f\x11\xc0\x00\x5a\x91\x09\x0f\x11\xc0\x00\x54\x40\x09\x0f\x11\xc0\x00\x54\x60\x12\xc0\x00\x54\x64\x0f\x01\x0f\x11\xa3\x64" } },
    .{ "DevCreateObjectQueryFromIds", MethodRecord{ .library = "api-ms-win-devices-query-l1-1-0", .import = "DevCreateObjectQueryFromIds", .signature = "\x00\x0a\x11\x79\x11\xc0\x00\x5a\x79\x11\x05\x09\x09\x0f\x11\xc0\x00\x5a\x91\x09\x0f\x11\xc0\x00\x54\x40\x12\xc0\x00\x54\x64\x0f\x01\x0f\x11\xa3\x64" } },
    .{ "DevCreateObjectQueryFromIdsEx", MethodRecord{ .library = "api-ms-win-devices-query-l1-1-1", .import = "DevCreateObjectQueryFromIdsEx", .signature = "\x00\x0c\x11\x79\x11\xc0\x00\x5a\x79\x11\x05\x09\x09\x0f\x11\xc0\x00\x5a\x91\x09\x0f\x11\xc0\x00\x54\x40\x09\x0f\x11\xc0\x00\x54\x60\x12\xc0\x00\x54\x64\x0f\x01\x0f\x11\xa3\x64" } },
    .{ "DevCloseObjectQuery", MethodRecord{ .library = "api-ms-win-devices-query-l1-1-0", .import = "DevCloseObjectQuery", .signature = "\x00\x01\x01\x11\xa3\x64" } },
    .{ "DevGetObjects", MethodRecord{ .library = "api-ms-win-devices-query-l1-1-0", .import = "DevGetObjects", .signature = "\x00\x08\x11\x79\x11\xc0\x00\x5a\x79\x09\x09\x0f\x11\xc0\x00\x5a\x91\x09\x0f\x11\xc0\x00\x54\x40\x0f\x09\x0f\x0f\x11\xc0\x00\x54\x54" } },
    .{ "DevGetObjectsEx", MethodRecord{ .library = "api-ms-win-devices-query-l1-1-1", .import = "DevGetObjectsEx", .signature = "\x00\x0a\x11\x79\x11\xc0\x00\x5a\x79\x09\x09\x0f\x11\xc0\x00\x5a\x91\x09\x0f\x11\xc0\x00\x54\x40\x09\x0f\x11\xc0\x00\x54\x60\x0f\x09\x0f\x0f\x11\xc0\x00\x54\x54" } },
    .{ "DevFreeObjects", MethodRecord{ .library = "api-ms-win-devices-query-l1-1-0", .import = "DevFreeObjects", .signature = "\x00\x02\x01\x09\x0f\x11\xc0\x00\x54\x54" } },
    .{ "DevGetObjectProperties", MethodRecord{ .library = "api-ms-win-devices-query-l1-1-0", .import = "DevGetObjectProperties", .signature = "\x00\x07\x11\x79\x11\xc0\x00\x5a\x79\x11\x05\x09\x09\x0f\x11\xc0\x00\x5a\x91\x0f\x09\x0f\x0f\x11\xab\x69" } },
    .{ "DevGetObjectPropertiesEx", MethodRecord{ .library = "api-ms-win-devices-query-l1-1-1", .import = "DevGetObjectPropertiesEx", .signature = "\x00\x09\x11\x79\x11\xc0\x00\x5a\x79\x11\x05\x09\x09\x0f\x11\xc0\x00\x5a\x91\x09\x0f\x11\xc0\x00\x54\x60\x0f\x09\x0f\x0f\x11\xab\x69" } },
    .{ "DevFreeObjectProperties", MethodRecord{ .library = "api-ms-win-devices-query-l1-1-0", .import = "DevFreeObjectProperties", .signature = "\x00\x02\x01\x09\x0f\x11\xab\x69" } },
    .{ "DevFindProperty", MethodRecord{ .library = "api-ms-win-devices-query-l1-1-0", .import = "DevFindProperty", .signature = "\x00\x05\x0f\x11\xab\x69\x0f\x11\x8a\x39\x11\xc0\x00\x5a\x95\x11\x05\x09\x0f\x11\xab\x69" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0xa39 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "DEVPROPKEY" },
        0x2364 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceQuery", .name = "HDEVQUERY" },
        0x2b69 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Properties", .name = "DEVPROPERTY" },
        0x5440 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceQuery", .name = "DEVPROP_FILTER_EXPRESSION" },
        0x5454 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceQuery", .name = "DEV_OBJECT" },
        0x5460 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceQuery", .name = "DEV_QUERY_PARAMETER" },
        0x5464 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceQuery", .name = "PDEV_QUERY_RESULT_CALLBACK" },
        0x5a79 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceQuery", .name = "DEV_OBJECT_TYPE" },
        0x5a91 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Properties", .name = "DEVPROPCOMPKEY" },
        0x5a95 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Properties", .name = "DEVPROPSTORE" },
        else => null,
    };
}

pub const DEVPROP_OPERATOR_MODIFIER_NOT = 65536;
pub const DEVPROP_OPERATOR_MODIFIER_IGNORE_CASE = 131072;
pub const DEVPROP_OPERATOR_NONE = 0;
pub const DEVPROP_OPERATOR_EXISTS = 1;
pub const DEVPROP_OPERATOR_NOT_EXISTS = 65537;
pub const DEVPROP_OPERATOR_EQUALS = 2;
pub const DEVPROP_OPERATOR_NOT_EQUALS = 65538;
pub const DEVPROP_OPERATOR_GREATER_THAN = 3;
pub const DEVPROP_OPERATOR_LESS_THAN = 4;
pub const DEVPROP_OPERATOR_GREATER_THAN_EQUALS = 5;
pub const DEVPROP_OPERATOR_LESS_THAN_EQUALS = 6;
pub const DEVPROP_OPERATOR_EQUALS_IGNORE_CASE = 131074;
pub const DEVPROP_OPERATOR_NOT_EQUALS_IGNORE_CASE = 196610;
pub const DEVPROP_OPERATOR_BITWISE_AND = 7;
pub const DEVPROP_OPERATOR_BITWISE_OR = 8;
pub const DEVPROP_OPERATOR_BEGINS_WITH = 9;
pub const DEVPROP_OPERATOR_ENDS_WITH = 10;
pub const DEVPROP_OPERATOR_CONTAINS = 11;
pub const DEVPROP_OPERATOR_BEGINS_WITH_IGNORE_CASE = 131081;
pub const DEVPROP_OPERATOR_ENDS_WITH_IGNORE_CASE = 131082;
pub const DEVPROP_OPERATOR_CONTAINS_IGNORE_CASE = 131083;
pub const DEVPROP_OPERATOR_LIST_CONTAINS = 4096;
pub const DEVPROP_OPERATOR_LIST_ELEMENT_BEGINS_WITH = 8192;
pub const DEVPROP_OPERATOR_LIST_ELEMENT_ENDS_WITH = 12288;
pub const DEVPROP_OPERATOR_LIST_ELEMENT_CONTAINS = 16384;
pub const DEVPROP_OPERATOR_LIST_CONTAINS_IGNORE_CASE = 135168;
pub const DEVPROP_OPERATOR_LIST_ELEMENT_BEGINS_WITH_IGNORE_CASE = 139264;
pub const DEVPROP_OPERATOR_LIST_ELEMENT_ENDS_WITH_IGNORE_CASE = 143360;
pub const DEVPROP_OPERATOR_LIST_ELEMENT_CONTAINS_IGNORE_CASE = 147456;
pub const DEVPROP_OPERATOR_AND_OPEN = 1048576;
pub const DEVPROP_OPERATOR_AND_CLOSE = 2097152;
pub const DEVPROP_OPERATOR_OR_OPEN = 3145728;
pub const DEVPROP_OPERATOR_OR_CLOSE = 4194304;
pub const DEVPROP_OPERATOR_NOT_OPEN = 5242880;
pub const DEVPROP_OPERATOR_NOT_CLOSE = 6291456;
pub const DEVPROP_OPERATOR_ARRAY_CONTAINS = 268435456;
pub const DEVPROP_OPERATOR_MASK_EVAL = 4095;
pub const DEVPROP_OPERATOR_MASK_LIST = 61440;
pub const DEVPROP_OPERATOR_MASK_MODIFIER = 983040;
pub const DEVPROP_OPERATOR_MASK_NOT_LOGICAL = 4027580415;
pub const DEVPROP_OPERATOR_MASK_LOGICAL = 267386880;
pub const DEVPROP_OPERATOR_MASK_ARRAY = 4026531840;
pub const DevObjectTypeUnknown = 0;
pub const DevObjectTypeDeviceInterface = 1;
pub const DevObjectTypeDeviceContainer = 2;
pub const DevObjectTypeDevice = 3;
pub const DevObjectTypeDeviceInterfaceClass = 4;
pub const DevObjectTypeAEP = 5;
pub const DevObjectTypeAEPContainer = 6;
pub const DevObjectTypeDeviceInstallerClass = 7;
pub const DevObjectTypeDeviceInterfaceDisplay = 8;
pub const DevObjectTypeDeviceContainerDisplay = 9;
pub const DevObjectTypeAEPService = 10;
pub const DevObjectTypeDevicePanel = 11;
pub const DevObjectTypeAEPProtocol = 12;
pub const DevQueryFlagNone = 0;
pub const DevQueryFlagUpdateResults = 1;
pub const DevQueryFlagAllProperties = 2;
pub const DevQueryFlagLocalize = 4;
pub const DevQueryFlagAsyncClose = 8;
pub const DevQueryStateInitialized = 0;
pub const DevQueryStateEnumCompleted = 1;
pub const DevQueryStateAborted = 2;
pub const DevQueryStateClosed = 3;
pub const DevQueryResultStateChange = 0;
pub const DevQueryResultAdd = 1;
pub const DevQueryResultUpdate = 2;
pub const DevQueryResultRemove = 3;

pub const aliases = struct {
    pub const DEVPROP_OPERATOR = u32;
    pub const DEV_OBJECT_TYPE = i32;
    pub const DEV_QUERY_FLAGS = i32;
    pub const DEV_QUERY_STATE = i32;
    pub const DEV_QUERY_RESULT_ACTION = i32;
    pub const HDEVQUERY = ?*anyopaque;
};
