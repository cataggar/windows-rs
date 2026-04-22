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
    .{ "Dhcpv6CApiInitialize", MethodRecord{ .library = "dhcpcsvc6", .import = "Dhcpv6CApiInitialize", .signature = "\x00\x01\x01\x0f\x09" } },
    .{ "Dhcpv6CApiCleanup", MethodRecord{ .library = "dhcpcsvc6", .import = "Dhcpv6CApiCleanup", .signature = "\x00\x00\x01" } },
    .{ "Dhcpv6RequestParams", MethodRecord{ .library = "dhcpcsvc6", .import = "Dhcpv6RequestParams", .signature = "\x00\x07\x09\x11\x59\x0f\x01\x11\x05\x0f\x11\xb4\x1d\x11\xb4\x21\x0f\x05\x0f\x09" } },
    .{ "Dhcpv6RequestPrefix", MethodRecord{ .library = "dhcpcsvc6", .import = "Dhcpv6RequestPrefix", .signature = "\x00\x04\x09\x11\x05\x0f\x11\xb4\x1d\x0f\x11\xb4\x25\x0f\x09" } },
    .{ "Dhcpv6RenewPrefix", MethodRecord{ .library = "dhcpcsvc6", .import = "Dhcpv6RenewPrefix", .signature = "\x00\x05\x09\x11\x05\x0f\x11\xb4\x1d\x0f\x11\xb4\x25\x0f\x09\x09" } },
    .{ "Dhcpv6ReleasePrefix", MethodRecord{ .library = "dhcpcsvc6", .import = "Dhcpv6ReleasePrefix", .signature = "\x00\x03\x09\x11\x05\x0f\x11\xb4\x1d\x0f\x11\xb4\x25" } },
    .{ "DhcpCApiInitialize", MethodRecord{ .library = "dhcpcsvc", .import = "DhcpCApiInitialize", .signature = "\x00\x01\x09\x0f\x09" } },
    .{ "DhcpCApiCleanup", MethodRecord{ .library = "dhcpcsvc", .import = "DhcpCApiCleanup", .signature = "\x00\x00\x01" } },
    .{ "DhcpRequestParams", MethodRecord{ .library = "dhcpcsvc", .import = "DhcpRequestParams", .signature = "\x00\x09\x09\x09\x0f\x01\x11\x05\x0f\x11\xb4\x29\x11\xb4\x2d\x11\xb4\x2d\x0f\x05\x0f\x09\x11\x05" } },
    .{ "DhcpUndoRequestParams", MethodRecord{ .library = "dhcpcsvc", .import = "DhcpUndoRequestParams", .signature = "\x00\x04\x09\x09\x0f\x01\x11\x05\x11\x05" } },
    .{ "DhcpRegisterParamChange", MethodRecord{ .library = "dhcpcsvc", .import = "DhcpRegisterParamChange", .signature = "\x00\x06\x09\x09\x0f\x01\x11\x05\x0f\x11\xb4\x29\x11\xb4\x2d\x0f\x01" } },
    .{ "DhcpDeRegisterParamChange", MethodRecord{ .library = "dhcpcsvc", .import = "DhcpDeRegisterParamChange", .signature = "\x00\x03\x09\x09\x0f\x01\x0f\x01" } },
    .{ "DhcpRemoveDNSRegistrations", MethodRecord{ .library = "dhcpcsvc", .import = "DhcpRemoveDNSRegistrations", .signature = "\x00\x00\x09" } },
    .{ "DhcpGetOriginalSubnetMask", MethodRecord{ .library = "dhcpcsvc", .import = "DhcpGetOriginalSubnetMask", .signature = "\x00\x02\x09\x11\x05\x0f\x09" } },
    .{ "DhcpAddFilterV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpAddFilterV4", .signature = "\x00\x03\x09\x11\x05\x0f\x11\xb4\x31\x11\x59" } },
    .{ "DhcpDeleteFilterV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpDeleteFilterV4", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb4\x35" } },
    .{ "DhcpSetFilterV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetFilterV4", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb4\x39" } },
    .{ "DhcpGetFilterV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetFilterV4", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb4\x39" } },
    .{ "DhcpEnumFilterV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumFilterV4", .signature = "\x00\x07\x09\x11\x05\x0f\x11\xb4\x35\x09\x11\xb4\x3d\x0f\x0f\x11\xb4\x41\x0f\x09\x0f\x09" } },
    .{ "DhcpCreateSubnet", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpCreateSubnet", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\x45" } },
    .{ "DhcpSetSubnetInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetSubnetInfo", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\x45" } },
    .{ "DhcpGetSubnetInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetSubnetInfo", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x0f\x11\xb4\x45" } },
    .{ "DhcpEnumSubnets", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumSubnets", .signature = "\x00\x06\x09\x11\x05\x0f\x09\x09\x0f\x0f\x11\xb4\x49\x0f\x09\x0f\x09" } },
    .{ "DhcpAddSubnetElement", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpAddSubnetElement", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\x4d" } },
    .{ "DhcpEnumSubnetElements", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumSubnetElements", .signature = "\x00\x08\x09\x11\x05\x09\x11\xb4\x51\x0f\x09\x09\x0f\x0f\x11\xb4\x55\x0f\x09\x0f\x09" } },
    .{ "DhcpRemoveSubnetElement", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpRemoveSubnetElement", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\xb4\x4d\x11\xb4\x59" } },
    .{ "DhcpDeleteSubnet", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpDeleteSubnet", .signature = "\x00\x03\x09\x11\x05\x09\x11\xb4\x59" } },
    .{ "DhcpCreateOption", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpCreateOption", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\x5d" } },
    .{ "DhcpSetOptionInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetOptionInfo", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\x5d" } },
    .{ "DhcpGetOptionInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetOptionInfo", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x0f\x11\xb4\x5d" } },
    .{ "DhcpEnumOptions", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumOptions", .signature = "\x00\x06\x09\x11\x05\x0f\x09\x09\x0f\x0f\x11\xb4\x61\x0f\x09\x0f\x09" } },
    .{ "DhcpRemoveOption", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpRemoveOption", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "DhcpSetOptionValue", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetOptionValue", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\xb4\x65\x0f\x11\xb4\x69" } },
    .{ "DhcpSetOptionValues", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetOptionValues", .signature = "\x00\x03\x09\x11\x05\x0f\x11\xb4\x65\x0f\x11\xb4\x6d" } },
    .{ "DhcpGetOptionValue", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetOptionValue", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\xb4\x65\x0f\x0f\x11\xb4\x71" } },
    .{ "DhcpEnumOptionValues", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumOptionValues", .signature = "\x00\x07\x09\x11\x05\x0f\x11\xb4\x65\x0f\x09\x09\x0f\x0f\x11\xb4\x6d\x0f\x09\x0f\x09" } },
    .{ "DhcpRemoveOptionValue", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpRemoveOptionValue", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\x65" } },
    .{ "DhcpCreateClientInfoVQ", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpCreateClientInfoVQ", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb4\x75" } },
    .{ "DhcpSetClientInfoVQ", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetClientInfoVQ", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb4\x75" } },
    .{ "DhcpGetClientInfoVQ", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetClientInfoVQ", .signature = "\x00\x03\x09\x11\x05\x0f\x11\xb4\x79\x0f\x0f\x11\xb4\x75" } },
    .{ "DhcpEnumSubnetClientsVQ", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumSubnetClientsVQ", .signature = "\x00\x07\x09\x11\x05\x09\x0f\x09\x09\x0f\x0f\x11\xb4\x7d\x0f\x09\x0f\x09" } },
    .{ "DhcpEnumSubnetClientsFilterStatusInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumSubnetClientsFilterStatusInfo", .signature = "\x00\x07\x09\x11\x05\x09\x0f\x09\x09\x0f\x0f\x11\xb4\x81\x0f\x09\x0f\x09" } },
    .{ "DhcpCreateClientInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpCreateClientInfo", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb4\x85" } },
    .{ "DhcpSetClientInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetClientInfo", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb4\x85" } },
    .{ "DhcpGetClientInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetClientInfo", .signature = "\x00\x03\x09\x11\x05\x0f\x11\xb4\x79\x0f\x0f\x11\xb4\x85" } },
    .{ "DhcpDeleteClientInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpDeleteClientInfo", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb4\x79" } },
    .{ "DhcpEnumSubnetClients", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumSubnetClients", .signature = "\x00\x07\x09\x11\x05\x09\x0f\x09\x09\x0f\x0f\x11\xb4\x89\x0f\x09\x0f\x09" } },
    .{ "DhcpGetClientOptions", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetClientOptions", .signature = "\x00\x04\x09\x11\x05\x09\x09\x0f\x0f\x11\xb4\x8d" } },
    .{ "DhcpGetMibInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetMibInfo", .signature = "\x00\x02\x09\x11\x05\x0f\x0f\x11\xb4\x91" } },
    .{ "DhcpServerSetConfig", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerSetConfig", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\x95" } },
    .{ "DhcpServerGetConfig", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerGetConfig", .signature = "\x00\x02\x09\x11\x05\x0f\x0f\x11\xb4\x95" } },
    .{ "DhcpScanDatabase", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpScanDatabase", .signature = "\x00\x04\x09\x11\x05\x09\x09\x0f\x0f\x11\xb4\x99" } },
    .{ "DhcpRpcFreeMemory", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpRpcFreeMemory", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "DhcpGetVersion", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetVersion", .signature = "\x00\x03\x09\x11\x05\x0f\x09\x0f\x09" } },
    .{ "DhcpAddSubnetElementV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpAddSubnetElementV4", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\x9d" } },
    .{ "DhcpEnumSubnetElementsV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumSubnetElementsV4", .signature = "\x00\x08\x09\x11\x05\x09\x11\xb4\x51\x0f\x09\x09\x0f\x0f\x11\xb4\xa1\x0f\x09\x0f\x09" } },
    .{ "DhcpRemoveSubnetElementV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpRemoveSubnetElementV4", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\xb4\x9d\x11\xb4\x59" } },
    .{ "DhcpCreateClientInfoV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpCreateClientInfoV4", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb4\xa5" } },
    .{ "DhcpSetClientInfoV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetClientInfoV4", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb4\xa5" } },
    .{ "DhcpGetClientInfoV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetClientInfoV4", .signature = "\x00\x03\x09\x11\x05\x0f\x11\xb4\x79\x0f\x0f\x11\xb4\xa5" } },
    .{ "DhcpEnumSubnetClientsV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumSubnetClientsV4", .signature = "\x00\x07\x09\x11\x05\x09\x0f\x09\x09\x0f\x0f\x11\xb4\xa9\x0f\x09\x0f\x09" } },
    .{ "DhcpServerSetConfigV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerSetConfigV4", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\xad" } },
    .{ "DhcpServerGetConfigV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerGetConfigV4", .signature = "\x00\x02\x09\x11\x05\x0f\x0f\x11\xb4\xad" } },
    .{ "DhcpSetSuperScopeV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetSuperScopeV4", .signature = "\x00\x04\x09\x11\x05\x09\x11\x05\x11\x59" } },
    .{ "DhcpDeleteSuperScopeV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpDeleteSuperScopeV4", .signature = "\x00\x02\x09\x11\x05\x11\x05" } },
    .{ "DhcpGetSuperScopeInfoV4", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetSuperScopeInfoV4", .signature = "\x00\x02\x09\x11\x05\x0f\x0f\x11\xb4\xb1" } },
    .{ "DhcpEnumSubnetClientsV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumSubnetClientsV5", .signature = "\x00\x07\x09\x11\x05\x09\x0f\x09\x09\x0f\x0f\x11\xb4\xb5\x0f\x09\x0f\x09" } },
    .{ "DhcpCreateOptionV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpCreateOptionV5", .signature = "\x00\x06\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x11\xb4\x5d" } },
    .{ "DhcpSetOptionInfoV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetOptionInfoV5", .signature = "\x00\x06\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x11\xb4\x5d" } },
    .{ "DhcpGetOptionInfoV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetOptionInfoV5", .signature = "\x00\x06\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x0f\x11\xb4\x5d" } },
    .{ "DhcpEnumOptionsV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumOptionsV5", .signature = "\x00\x09\x09\x11\x05\x09\x11\x05\x11\x05\x0f\x09\x09\x0f\x0f\x11\xb4\x61\x0f\x09\x0f\x09" } },
    .{ "DhcpRemoveOptionV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpRemoveOptionV5", .signature = "\x00\x05\x09\x11\x05\x09\x09\x11\x05\x11\x05" } },
    .{ "DhcpSetOptionValueV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetOptionValueV5", .signature = "\x00\x07\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x11\xb4\x65\x0f\x11\xb4\x69" } },
    .{ "DhcpSetOptionValuesV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetOptionValuesV5", .signature = "\x00\x06\x09\x11\x05\x09\x11\x05\x11\x05\x0f\x11\xb4\x65\x0f\x11\xb4\x6d" } },
    .{ "DhcpGetOptionValueV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetOptionValueV5", .signature = "\x00\x07\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x11\xb4\x65\x0f\x0f\x11\xb4\x71" } },
    .{ "DhcpGetOptionValueV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetOptionValueV6", .signature = "\x00\x07\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x11\xb4\xb9\x0f\x0f\x11\xb4\x71" } },
    .{ "DhcpEnumOptionValuesV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumOptionValuesV5", .signature = "\x00\x0a\x09\x11\x05\x09\x11\x05\x11\x05\x0f\x11\xb4\x65\x0f\x09\x09\x0f\x0f\x11\xb4\x6d\x0f\x09\x0f\x09" } },
    .{ "DhcpRemoveOptionValueV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpRemoveOptionValueV5", .signature = "\x00\x06\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x11\xb4\x65" } },
    .{ "DhcpCreateClass", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpCreateClass", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\xbd" } },
    .{ "DhcpModifyClass", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpModifyClass", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\xbd" } },
    .{ "DhcpDeleteClass", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpDeleteClass", .signature = "\x00\x03\x09\x11\x05\x09\x11\x05" } },
    .{ "DhcpGetClassInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetClassInfo", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\xb4\xbd\x0f\x0f\x11\xb4\xbd" } },
    .{ "DhcpEnumClasses", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumClasses", .signature = "\x00\x07\x09\x11\x05\x09\x0f\x09\x09\x0f\x0f\x11\xb4\xc1\x0f\x09\x0f\x09" } },
    .{ "DhcpGetAllOptions", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetAllOptions", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x0f\x11\xb4\xc5" } },
    .{ "DhcpGetAllOptionsV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetAllOptionsV6", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x0f\x11\xb4\xc5" } },
    .{ "DhcpGetAllOptionValues", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetAllOptionValues", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\xb4\x65\x0f\x0f\x11\xb4\xc9" } },
    .{ "DhcpGetAllOptionValuesV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetAllOptionValuesV6", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\xb4\xb9\x0f\x0f\x11\xb4\xc9" } },
    .{ "DhcpEnumServers", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumServers", .signature = "\x00\x05\x09\x09\x0f\x01\x0f\x0f\x11\xb4\xcd\x0f\x01\x0f\x01" } },
    .{ "DhcpAddServer", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpAddServer", .signature = "\x00\x05\x09\x09\x0f\x01\x0f\x11\xb4\xd1\x0f\x01\x0f\x01" } },
    .{ "DhcpDeleteServer", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpDeleteServer", .signature = "\x00\x05\x09\x09\x0f\x01\x0f\x11\xb4\xd1\x0f\x01\x0f\x01" } },
    .{ "DhcpGetServerBindingInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetServerBindingInfo", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x0f\x11\xb4\xd5" } },
    .{ "DhcpSetServerBindingInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetServerBindingInfo", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\xd5" } },
    .{ "DhcpAddSubnetElementV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpAddSubnetElementV5", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\xd9" } },
    .{ "DhcpEnumSubnetElementsV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumSubnetElementsV5", .signature = "\x00\x08\x09\x11\x05\x09\x11\xb4\x51\x0f\x09\x09\x0f\x0f\x11\xb4\xdd\x0f\x09\x0f\x09" } },
    .{ "DhcpRemoveSubnetElementV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpRemoveSubnetElementV5", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\xb4\xd9\x11\xb4\x59" } },
    .{ "DhcpV4EnumSubnetReservations", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4EnumSubnetReservations", .signature = "\x00\x07\x09\x11\x05\x09\x0f\x09\x09\x0f\x0f\x11\xb4\xe1\x0f\x09\x0f\x09" } },
    .{ "DhcpCreateOptionV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpCreateOptionV6", .signature = "\x00\x06\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x11\xb4\x5d" } },
    .{ "DhcpRemoveOptionV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpRemoveOptionV6", .signature = "\x00\x05\x09\x11\x05\x09\x09\x11\x05\x11\x05" } },
    .{ "DhcpEnumOptionsV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumOptionsV6", .signature = "\x00\x09\x09\x11\x05\x09\x11\x05\x11\x05\x0f\x09\x09\x0f\x0f\x11\xb4\x61\x0f\x09\x0f\x09" } },
    .{ "DhcpRemoveOptionValueV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpRemoveOptionValueV6", .signature = "\x00\x06\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x11\xb4\xb9" } },
    .{ "DhcpGetOptionInfoV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetOptionInfoV6", .signature = "\x00\x06\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x0f\x11\xb4\x5d" } },
    .{ "DhcpSetOptionInfoV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetOptionInfoV6", .signature = "\x00\x06\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x11\xb4\x5d" } },
    .{ "DhcpSetOptionValueV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetOptionValueV6", .signature = "\x00\x07\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x11\xb4\xb9\x0f\x11\xb4\x69" } },
    .{ "DhcpGetSubnetInfoVQ", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetSubnetInfoVQ", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x0f\x11\xb4\xe5" } },
    .{ "DhcpCreateSubnetVQ", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpCreateSubnetVQ", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\xe5" } },
    .{ "DhcpSetSubnetInfoVQ", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetSubnetInfoVQ", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\xe5" } },
    .{ "DhcpEnumOptionValuesV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumOptionValuesV6", .signature = "\x00\x0a\x09\x11\x05\x09\x11\x05\x11\x05\x0f\x11\xb4\xb9\x0f\x09\x09\x0f\x0f\x11\xb4\x6d\x0f\x09\x0f\x09" } },
    .{ "DhcpDsInit", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpDsInit", .signature = "\x00\x00\x09" } },
    .{ "DhcpDsCleanup", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpDsCleanup", .signature = "\x00\x00\x01" } },
    .{ "DhcpSetThreadOptions", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetThreadOptions", .signature = "\x00\x02\x09\x09\x0f\x01" } },
    .{ "DhcpGetThreadOptions", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetThreadOptions", .signature = "\x00\x02\x09\x0f\x09\x0f\x01" } },
    .{ "DhcpServerQueryAttribute", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerQueryAttribute", .signature = "\x00\x04\x09\x11\x05\x09\x09\x0f\x0f\x11\xb4\xe9" } },
    .{ "DhcpServerQueryAttributes", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerQueryAttributes", .signature = "\x00\x05\x09\x11\x05\x09\x09\x0f\x09\x0f\x0f\x11\xb4\xed" } },
    .{ "DhcpServerRedoAuthorization", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerRedoAuthorization", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "DhcpAuditLogSetParams", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpAuditLogSetParams", .signature = "\x00\x06\x09\x11\x05\x09\x11\x05\x09\x09\x09" } },
    .{ "DhcpAuditLogGetParams", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpAuditLogGetParams", .signature = "\x00\x06\x09\x11\x05\x09\x0f\x11\x05\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "DhcpServerQueryDnsRegCredentials", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerQueryDnsRegCredentials", .signature = "\x00\x05\x09\x11\x05\x09\x11\x05\x09\x11\x05" } },
    .{ "DhcpServerSetDnsRegCredentials", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerSetDnsRegCredentials", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "DhcpServerSetDnsRegCredentialsV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerSetDnsRegCredentialsV5", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "DhcpServerBackupDatabase", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerBackupDatabase", .signature = "\x00\x02\x09\x11\x05\x11\x05" } },
    .{ "DhcpServerRestoreDatabase", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerRestoreDatabase", .signature = "\x00\x02\x09\x11\x05\x11\x05" } },
    .{ "DhcpServerSetConfigVQ", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerSetConfigVQ", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb4\xf1" } },
    .{ "DhcpServerGetConfigVQ", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerGetConfigVQ", .signature = "\x00\x02\x09\x11\x05\x0f\x0f\x11\xb4\xf1" } },
    .{ "DhcpGetServerSpecificStrings", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetServerSpecificStrings", .signature = "\x00\x02\x09\x11\x05\x0f\x0f\x11\xb4\xf5" } },
    .{ "DhcpServerAuditlogParamsFree", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerAuditlogParamsFree", .signature = "\x00\x01\x01\x0f\x11\xb4\xf1" } },
    .{ "DhcpCreateSubnetV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpCreateSubnetV6", .signature = "\x00\x03\x09\x11\x05\x11\xb4\xf9\x0f\x11\xb4\xfd" } },
    .{ "DhcpDeleteSubnetV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpDeleteSubnetV6", .signature = "\x00\x03\x09\x11\x05\x11\xb4\xf9\x11\xb4\x59" } },
    .{ "DhcpEnumSubnetsV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumSubnetsV6", .signature = "\x00\x06\x09\x11\x05\x0f\x09\x09\x0f\x0f\x11\xb5\x01\x0f\x09\x0f\x09" } },
    .{ "DhcpAddSubnetElementV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpAddSubnetElementV6", .signature = "\x00\x03\x09\x11\x05\x11\xb4\xf9\x0f\x11\xb5\x05" } },
    .{ "DhcpRemoveSubnetElementV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpRemoveSubnetElementV6", .signature = "\x00\x04\x09\x11\x05\x11\xb4\xf9\x0f\x11\xb5\x05\x11\xb4\x59" } },
    .{ "DhcpEnumSubnetElementsV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumSubnetElementsV6", .signature = "\x00\x08\x09\x11\x05\x11\xb4\xf9\x11\xb5\x09\x0f\x09\x09\x0f\x0f\x11\xb5\x0d\x0f\x09\x0f\x09" } },
    .{ "DhcpGetSubnetInfoV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetSubnetInfoV6", .signature = "\x00\x03\x09\x11\x05\x11\xb4\xf9\x0f\x0f\x11\xb4\xfd" } },
    .{ "DhcpEnumSubnetClientsV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumSubnetClientsV6", .signature = "\x00\x07\x09\x11\x05\x11\xb4\xf9\x0f\x11\xb4\xf9\x09\x0f\x0f\x11\xb5\x11\x0f\x09\x0f\x09" } },
    .{ "DhcpServerGetConfigV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerGetConfigV6", .signature = "\x00\x03\x09\x11\x05\x0f\x11\xb4\xb9\x0f\x0f\x11\xb5\x15" } },
    .{ "DhcpServerSetConfigV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpServerSetConfigV6", .signature = "\x00\x04\x09\x11\x05\x0f\x11\xb4\xb9\x09\x0f\x11\xb5\x15" } },
    .{ "DhcpSetSubnetInfoV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetSubnetInfoV6", .signature = "\x00\x03\x09\x11\x05\x11\xb4\xf9\x0f\x11\xb4\xfd" } },
    .{ "DhcpGetMibInfoV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetMibInfoV6", .signature = "\x00\x02\x09\x11\x05\x0f\x0f\x11\xb5\x19" } },
    .{ "DhcpGetServerBindingInfoV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetServerBindingInfoV6", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x0f\x11\xb5\x1d" } },
    .{ "DhcpSetServerBindingInfoV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetServerBindingInfoV6", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb5\x1d" } },
    .{ "DhcpSetClientInfoV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetClientInfoV6", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb5\x21" } },
    .{ "DhcpGetClientInfoV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetClientInfoV6", .signature = "\x00\x03\x09\x11\x05\x0f\x11\xb5\x25\x0f\x0f\x11\xb5\x21" } },
    .{ "DhcpDeleteClientInfoV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpDeleteClientInfoV6", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb5\x25" } },
    .{ "DhcpCreateClassV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpCreateClassV6", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb5\x29" } },
    .{ "DhcpModifyClassV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpModifyClassV6", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb5\x29" } },
    .{ "DhcpDeleteClassV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpDeleteClassV6", .signature = "\x00\x03\x09\x11\x05\x09\x11\x05" } },
    .{ "DhcpEnumClassesV6", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpEnumClassesV6", .signature = "\x00\x07\x09\x11\x05\x09\x0f\x09\x09\x0f\x0f\x11\xb5\x2d\x0f\x09\x0f\x09" } },
    .{ "DhcpSetSubnetDelayOffer", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpSetSubnetDelayOffer", .signature = "\x00\x03\x09\x11\x05\x09\x07" } },
    .{ "DhcpGetSubnetDelayOffer", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetSubnetDelayOffer", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x07" } },
    .{ "DhcpGetMibInfoV5", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpGetMibInfoV5", .signature = "\x00\x02\x09\x11\x05\x0f\x0f\x11\xb5\x31" } },
    .{ "DhcpAddSecurityGroup", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpAddSecurityGroup", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "DhcpV4GetOptionValue", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4GetOptionValue", .signature = "\x00\x07\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x11\xb4\x65\x0f\x0f\x11\xb4\x71" } },
    .{ "DhcpV4SetOptionValue", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4SetOptionValue", .signature = "\x00\x07\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x11\xb4\x65\x0f\x11\xb4\x69" } },
    .{ "DhcpV4SetOptionValues", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4SetOptionValues", .signature = "\x00\x06\x09\x11\x05\x09\x11\x05\x11\x05\x0f\x11\xb4\x65\x0f\x11\xb4\x6d" } },
    .{ "DhcpV4RemoveOptionValue", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4RemoveOptionValue", .signature = "\x00\x06\x09\x11\x05\x09\x09\x11\x05\x11\x05\x0f\x11\xb4\x65" } },
    .{ "DhcpV4GetAllOptionValues", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4GetAllOptionValues", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\xb4\x65\x0f\x0f\x11\xb5\x35" } },
    .{ "DhcpV4FailoverCreateRelationship", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4FailoverCreateRelationship", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb5\x39" } },
    .{ "DhcpV4FailoverSetRelationship", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4FailoverSetRelationship", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\xb5\x39" } },
    .{ "DhcpV4FailoverDeleteRelationship", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4FailoverDeleteRelationship", .signature = "\x00\x02\x09\x11\x05\x11\x05" } },
    .{ "DhcpV4FailoverGetRelationship", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4FailoverGetRelationship", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x0f\x11\xb5\x39" } },
    .{ "DhcpV4FailoverEnumRelationship", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4FailoverEnumRelationship", .signature = "\x00\x06\x09\x11\x05\x0f\x09\x09\x0f\x0f\x11\xb5\x3d\x0f\x09\x0f\x09" } },
    .{ "DhcpV4FailoverAddScopeToRelationship", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4FailoverAddScopeToRelationship", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb5\x39" } },
    .{ "DhcpV4FailoverDeleteScopeFromRelationship", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4FailoverDeleteScopeFromRelationship", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb5\x39" } },
    .{ "DhcpV4FailoverGetScopeRelationship", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4FailoverGetScopeRelationship", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x0f\x11\xb5\x39" } },
    .{ "DhcpV4FailoverGetScopeStatistics", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4FailoverGetScopeStatistics", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x0f\x11\xb5\x41" } },
    .{ "DhcpV4FailoverGetClientInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4FailoverGetClientInfo", .signature = "\x00\x03\x09\x11\x05\x0f\x11\xb4\x79\x0f\x0f\x11\xb5\x45" } },
    .{ "DhcpV4FailoverGetSystemTime", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4FailoverGetSystemTime", .signature = "\x00\x03\x09\x11\x05\x0f\x09\x0f\x09" } },
    .{ "DhcpV4FailoverGetAddressStatus", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4FailoverGetAddressStatus", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x09" } },
    .{ "DhcpV4FailoverTriggerAddrAllocation", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4FailoverTriggerAddrAllocation", .signature = "\x00\x02\x09\x11\x05\x11\x05" } },
    .{ "DhcpHlprCreateV4Policy", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprCreateV4Policy", .signature = "\x00\x08\x09\x11\x05\x11\x59\x09\x09\x11\xb5\x49\x11\x05\x11\x59\x0f\x0f\x11\xb5\x4d" } },
    .{ "DhcpHlprCreateV4PolicyEx", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprCreateV4PolicyEx", .signature = "\x00\x08\x09\x11\x05\x11\x59\x09\x09\x11\xb5\x49\x11\x05\x11\x59\x0f\x0f\x11\xb5\x51" } },
    .{ "DhcpHlprAddV4PolicyExpr", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprAddV4PolicyExpr", .signature = "\x00\x04\x09\x0f\x11\xb5\x4d\x09\x11\xb5\x49\x0f\x09" } },
    .{ "DhcpHlprAddV4PolicyCondition", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprAddV4PolicyCondition", .signature = "\x00\x0a\x09\x0f\x11\xb5\x4d\x09\x11\xb5\x55\x09\x09\x11\x05\x11\xb5\x59\x0f\x05\x09\x0f\x09" } },
    .{ "DhcpHlprAddV4PolicyRange", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprAddV4PolicyRange", .signature = "\x00\x02\x09\x0f\x11\xb5\x4d\x0f\x11\xb5\x5d" } },
    .{ "DhcpHlprResetV4PolicyExpr", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprResetV4PolicyExpr", .signature = "\x00\x01\x09\x0f\x11\xb5\x4d" } },
    .{ "DhcpHlprModifyV4PolicyExpr", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprModifyV4PolicyExpr", .signature = "\x00\x02\x09\x0f\x11\xb5\x4d\x11\xb5\x49" } },
    .{ "DhcpHlprFreeV4Policy", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprFreeV4Policy", .signature = "\x00\x01\x01\x0f\x11\xb5\x4d" } },
    .{ "DhcpHlprFreeV4PolicyArray", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprFreeV4PolicyArray", .signature = "\x00\x01\x01\x0f\x11\xb5\x61" } },
    .{ "DhcpHlprFreeV4PolicyEx", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprFreeV4PolicyEx", .signature = "\x00\x01\x01\x0f\x11\xb5\x51" } },
    .{ "DhcpHlprFreeV4PolicyExArray", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprFreeV4PolicyExArray", .signature = "\x00\x01\x01\x0f\x11\xb5\x65" } },
    .{ "DhcpHlprFreeV4DhcpProperty", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprFreeV4DhcpProperty", .signature = "\x00\x01\x01\x0f\x11\xb5\x69" } },
    .{ "DhcpHlprFreeV4DhcpPropertyArray", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprFreeV4DhcpPropertyArray", .signature = "\x00\x01\x01\x0f\x11\xb5\x6d" } },
    .{ "DhcpHlprFindV4DhcpProperty", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprFindV4DhcpProperty", .signature = "\x00\x03\x0f\x11\xb5\x69\x0f\x11\xb5\x6d\x11\xb5\x71\x11\xb5\x75" } },
    .{ "DhcpHlprIsV4PolicySingleUC", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprIsV4PolicySingleUC", .signature = "\x00\x01\x11\x59\x0f\x11\xb5\x4d" } },
    .{ "DhcpV4QueryPolicyEnforcement", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4QueryPolicyEnforcement", .signature = "\x00\x04\x09\x11\x05\x11\x59\x09\x0f\x11\x59" } },
    .{ "DhcpV4SetPolicyEnforcement", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4SetPolicyEnforcement", .signature = "\x00\x04\x09\x11\x05\x11\x59\x09\x11\x59" } },
    .{ "DhcpHlprIsV4PolicyWellFormed", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprIsV4PolicyWellFormed", .signature = "\x00\x01\x11\x59\x0f\x11\xb5\x4d" } },
    .{ "DhcpHlprIsV4PolicyValid", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpHlprIsV4PolicyValid", .signature = "\x00\x01\x09\x0f\x11\xb5\x4d" } },
    .{ "DhcpV4CreatePolicy", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4CreatePolicy", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb5\x4d" } },
    .{ "DhcpV4GetPolicy", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4GetPolicy", .signature = "\x00\x05\x09\x11\x05\x11\x59\x09\x11\x05\x0f\x0f\x11\xb5\x4d" } },
    .{ "DhcpV4SetPolicy", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4SetPolicy", .signature = "\x00\x06\x09\x11\x05\x09\x11\x59\x09\x11\x05\x0f\x11\xb5\x4d" } },
    .{ "DhcpV4DeletePolicy", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4DeletePolicy", .signature = "\x00\x04\x09\x11\x05\x11\x59\x09\x11\x05" } },
    .{ "DhcpV4EnumPolicies", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4EnumPolicies", .signature = "\x00\x08\x09\x11\x05\x0f\x09\x09\x11\x59\x09\x0f\x0f\x11\xb5\x61\x0f\x09\x0f\x09" } },
    .{ "DhcpV4AddPolicyRange", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4AddPolicyRange", .signature = "\x00\x04\x09\x11\x05\x09\x11\x05\x0f\x11\xb5\x5d" } },
    .{ "DhcpV4RemovePolicyRange", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4RemovePolicyRange", .signature = "\x00\x04\x09\x11\x05\x09\x11\x05\x0f\x11\xb5\x5d" } },
    .{ "DhcpV6SetStatelessStoreParams", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV6SetStatelessStoreParams", .signature = "\x00\x05\x09\x11\x05\x11\x59\x11\xb4\xf9\x09\x0f\x11\xb5\x79" } },
    .{ "DhcpV6GetStatelessStoreParams", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV6GetStatelessStoreParams", .signature = "\x00\x04\x09\x11\x05\x11\x59\x11\xb4\xf9\x0f\x0f\x11\xb5\x79" } },
    .{ "DhcpV6GetStatelessStatistics", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV6GetStatelessStatistics", .signature = "\x00\x02\x09\x11\x05\x0f\x0f\x11\xb5\x7d" } },
    .{ "DhcpV4CreateClientInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4CreateClientInfo", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb5\x81" } },
    .{ "DhcpV4EnumSubnetClients", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4EnumSubnetClients", .signature = "\x00\x07\x09\x11\x05\x09\x0f\x09\x09\x0f\x0f\x11\xb5\x85\x0f\x09\x0f\x09" } },
    .{ "DhcpV4GetClientInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4GetClientInfo", .signature = "\x00\x03\x09\x11\x05\x0f\x11\xb4\x79\x0f\x0f\x11\xb5\x81" } },
    .{ "DhcpV6CreateClientInfo", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV6CreateClientInfo", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb5\x21" } },
    .{ "DhcpV4GetFreeIPAddress", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4GetFreeIPAddress", .signature = "\x00\x06\x09\x11\x05\x09\x09\x09\x09\x0f\x0f\x11\xb4\x49" } },
    .{ "DhcpV6GetFreeIPAddress", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV6GetFreeIPAddress", .signature = "\x00\x06\x09\x11\x05\x11\xb4\xf9\x11\xb4\xf9\x11\xb4\xf9\x09\x0f\x0f\x11\xb5\x01" } },
    .{ "DhcpV4CreateClientInfoEx", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4CreateClientInfoEx", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb5\x89" } },
    .{ "DhcpV4EnumSubnetClientsEx", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4EnumSubnetClientsEx", .signature = "\x00\x07\x09\x11\x05\x09\x0f\x09\x09\x0f\x0f\x11\xb5\x8d\x0f\x09\x0f\x09" } },
    .{ "DhcpV4GetClientInfoEx", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4GetClientInfoEx", .signature = "\x00\x03\x09\x11\x05\x0f\x11\xb4\x79\x0f\x0f\x11\xb5\x89" } },
    .{ "DhcpV4CreatePolicyEx", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4CreatePolicyEx", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xb5\x51" } },
    .{ "DhcpV4GetPolicyEx", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4GetPolicyEx", .signature = "\x00\x05\x09\x11\x05\x11\x59\x09\x11\x05\x0f\x0f\x11\xb5\x51" } },
    .{ "DhcpV4SetPolicyEx", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4SetPolicyEx", .signature = "\x00\x06\x09\x11\x05\x09\x11\x59\x09\x11\x05\x0f\x11\xb5\x51" } },
    .{ "DhcpV4EnumPoliciesEx", MethodRecord{ .library = "DHCPSAPI", .import = "DhcpV4EnumPoliciesEx", .signature = "\x00\x08\x09\x11\x05\x0f\x09\x09\x11\x59\x09\x0f\x0f\x11\xb5\x65\x0f\x09\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x341d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCPV6CAPI_CLASSID" },
        0x3421 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCPV6CAPI_PARAMS_ARRAY" },
        0x3425 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCPV6PrefixLeaseInformation" },
        0x3429 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCPCAPI_CLASSID" },
        0x342d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCPCAPI_PARAMS_ARRAY" },
        0x3431 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_FILTER_ADD_INFO" },
        0x3435 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_ADDR_PATTERN" },
        0x3439 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_FILTER_GLOBAL_INFO" },
        0x343d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_FILTER_LIST_TYPE" },
        0x3441 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_FILTER_ENUM_INFO" },
        0x3445 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SUBNET_INFO" },
        0x3449 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_IP_ARRAY" },
        0x344d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SUBNET_ELEMENT_DATA" },
        0x3451 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SUBNET_ELEMENT_TYPE" },
        0x3455 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SUBNET_ELEMENT_INFO_ARRAY" },
        0x3459 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_FORCE_FLAG" },
        0x345d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_OPTION" },
        0x3461 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_OPTION_ARRAY" },
        0x3465 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_OPTION_SCOPE_INFO" },
        0x3469 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_OPTION_DATA" },
        0x346d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_OPTION_VALUE_ARRAY" },
        0x3471 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_OPTION_VALUE" },
        0x3475 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLIENT_INFO_VQ" },
        0x3479 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SEARCH_INFO" },
        0x347d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLIENT_INFO_ARRAY_VQ" },
        0x3481 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY" },
        0x3485 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLIENT_INFO" },
        0x3489 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLIENT_INFO_ARRAY" },
        0x348d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_OPTION_LIST" },
        0x3491 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_MIB_INFO" },
        0x3495 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SERVER_CONFIG_INFO" },
        0x3499 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SCAN_LIST" },
        0x349d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SUBNET_ELEMENT_DATA_V4" },
        0x34a1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4" },
        0x34a5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLIENT_INFO_V4" },
        0x34a9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLIENT_INFO_ARRAY_V4" },
        0x34ad => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SERVER_CONFIG_INFO_V4" },
        0x34b1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SUPER_SCOPE_TABLE" },
        0x34b5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLIENT_INFO_ARRAY_V5" },
        0x34b9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_OPTION_SCOPE_INFO6" },
        0x34bd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLASS_INFO" },
        0x34c1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLASS_INFO_ARRAY" },
        0x34c5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_ALL_OPTIONS" },
        0x34c9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_ALL_OPTION_VALUES" },
        0x34cd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCPDS_SERVERS" },
        0x34d1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCPDS_SERVER" },
        0x34d5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_BIND_ELEMENT_ARRAY" },
        0x34d9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SUBNET_ELEMENT_DATA_V5" },
        0x34dd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5" },
        0x34e1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_RESERVATION_INFO_ARRAY" },
        0x34e5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SUBNET_INFO_VQ" },
        0x34e9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_ATTRIB" },
        0x34ed => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_ATTRIB_ARRAY" },
        0x34f1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SERVER_CONFIG_INFO_VQ" },
        0x34f5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SERVER_SPECIFIC_STRINGS" },
        0x34f9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_IPV6_ADDRESS" },
        0x34fd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SUBNET_INFO_V6" },
        0x3501 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCPV6_IP_ARRAY" },
        0x3505 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SUBNET_ELEMENT_DATA_V6" },
        0x3509 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SUBNET_ELEMENT_TYPE_V6" },
        0x350d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6" },
        0x3511 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLIENT_INFO_ARRAY_V6" },
        0x3515 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SERVER_CONFIG_INFO_V6" },
        0x3519 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_MIB_INFO_V6" },
        0x351d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCPV6_BIND_ELEMENT_ARRAY" },
        0x3521 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLIENT_INFO_V6" },
        0x3525 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_SEARCH_INFO_V6" },
        0x3529 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLASS_INFO_V6" },
        0x352d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLASS_INFO_ARRAY_V6" },
        0x3531 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_MIB_INFO_V5" },
        0x3535 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_ALL_OPTION_VALUES_PB" },
        0x3539 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_FAILOVER_RELATIONSHIP" },
        0x353d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_FAILOVER_RELATIONSHIP_ARRAY" },
        0x3541 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_FAILOVER_STATISTICS" },
        0x3545 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCPV4_FAILOVER_CLIENT_INFO" },
        0x3549 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_POL_LOGIC_OPER" },
        0x354d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_POLICY" },
        0x3551 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_POLICY_EX" },
        0x3555 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_POL_ATTR_TYPE" },
        0x3559 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_POL_COMPARATOR" },
        0x355d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_IP_RANGE" },
        0x3561 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_POLICY_ARRAY" },
        0x3565 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_POLICY_EX_ARRAY" },
        0x3569 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_PROPERTY" },
        0x356d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_PROPERTY_ARRAY" },
        0x3571 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_PROPERTY_ID" },
        0x3575 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_PROPERTY_TYPE" },
        0x3579 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCPV6_STATELESS_PARAMS" },
        0x357d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCPV6_STATELESS_STATS" },
        0x3581 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLIENT_INFO_PB" },
        0x3585 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLIENT_INFO_PB_ARRAY" },
        0x3589 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLIENT_INFO_EX" },
        0x358d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Dhcp", .name = "DHCP_CLIENT_INFO_EX_ARRAY" },
        else => null,
    };
}

pub const OPTION_PAD = 0;
pub const OPTION_SUBNET_MASK = 1;
pub const OPTION_TIME_OFFSET = 2;
pub const OPTION_ROUTER_ADDRESS = 3;
pub const OPTION_TIME_SERVERS = 4;
pub const OPTION_IEN116_NAME_SERVERS = 5;
pub const OPTION_DOMAIN_NAME_SERVERS = 6;
pub const OPTION_LOG_SERVERS = 7;
pub const OPTION_COOKIE_SERVERS = 8;
pub const OPTION_LPR_SERVERS = 9;
pub const OPTION_IMPRESS_SERVERS = 10;
pub const OPTION_RLP_SERVERS = 11;
pub const OPTION_HOST_NAME = 12;
pub const OPTION_BOOT_FILE_SIZE = 13;
pub const OPTION_MERIT_DUMP_FILE = 14;
pub const OPTION_DOMAIN_NAME = 15;
pub const OPTION_SWAP_SERVER = 16;
pub const OPTION_ROOT_DISK = 17;
pub const OPTION_EXTENSIONS_PATH = 18;
pub const OPTION_BE_A_ROUTER = 19;
pub const OPTION_NON_LOCAL_SOURCE_ROUTING = 20;
pub const OPTION_POLICY_FILTER_FOR_NLSR = 21;
pub const OPTION_MAX_REASSEMBLY_SIZE = 22;
pub const OPTION_DEFAULT_TTL = 23;
pub const OPTION_PMTU_AGING_TIMEOUT = 24;
pub const OPTION_PMTU_PLATEAU_TABLE = 25;
pub const OPTION_MTU = 26;
pub const OPTION_ALL_SUBNETS_MTU = 27;
pub const OPTION_BROADCAST_ADDRESS = 28;
pub const OPTION_PERFORM_MASK_DISCOVERY = 29;
pub const OPTION_BE_A_MASK_SUPPLIER = 30;
pub const OPTION_PERFORM_ROUTER_DISCOVERY = 31;
pub const OPTION_ROUTER_SOLICITATION_ADDR = 32;
pub const OPTION_STATIC_ROUTES = 33;
pub const OPTION_TRAILERS = 34;
pub const OPTION_ARP_CACHE_TIMEOUT = 35;
pub const OPTION_ETHERNET_ENCAPSULATION = 36;
pub const OPTION_TTL = 37;
pub const OPTION_KEEP_ALIVE_INTERVAL = 38;
pub const OPTION_KEEP_ALIVE_DATA_SIZE = 39;
pub const OPTION_NETWORK_INFO_SERVICE_DOM = 40;
pub const OPTION_NETWORK_INFO_SERVERS = 41;
pub const OPTION_NETWORK_TIME_SERVERS = 42;
pub const OPTION_VENDOR_SPEC_INFO = 43;
pub const OPTION_NETBIOS_NAME_SERVER = 44;
pub const OPTION_NETBIOS_DATAGRAM_SERVER = 45;
pub const OPTION_NETBIOS_NODE_TYPE = 46;
pub const OPTION_NETBIOS_SCOPE_OPTION = 47;
pub const OPTION_XWINDOW_FONT_SERVER = 48;
pub const OPTION_XWINDOW_DISPLAY_MANAGER = 49;
pub const OPTION_REQUESTED_ADDRESS = 50;
pub const OPTION_LEASE_TIME = 51;
pub const OPTION_OK_TO_OVERLAY = 52;
pub const OPTION_MESSAGE_TYPE = 53;
pub const OPTION_SERVER_IDENTIFIER = 54;
pub const OPTION_PARAMETER_REQUEST_LIST = 55;
pub const OPTION_MESSAGE = 56;
pub const OPTION_MESSAGE_LENGTH = 57;
pub const OPTION_RENEWAL_TIME = 58;
pub const OPTION_REBIND_TIME = 59;
pub const OPTION_CLIENT_CLASS_INFO = 60;
pub const OPTION_CLIENT_ID = 61;
pub const OPTION_TFTP_SERVER_NAME = 66;
pub const OPTION_BOOTFILE_NAME = 67;
pub const OPTION_IPV6_ONLY_PREFERRED = 108;
pub const OPTION_DNR = 162;
pub const OPTION_MSFT_IE_PROXY = 252;
pub const OPTION_END = 255;
pub const DHCPCAPI_REQUEST_PERSISTENT = 1;
pub const DHCPCAPI_REQUEST_SYNCHRONOUS = 2;
pub const DHCPCAPI_REQUEST_ASYNCHRONOUS = 4;
pub const DHCPCAPI_REQUEST_CANCEL = 8;
pub const DHCPCAPI_REQUEST_MASK = 15;
pub const DHCPCAPI_REGISTER_HANDLE_EVENT = 1;
pub const DHCPCAPI_DEREGISTER_HANDLE_EVENT = 1;
pub const ERROR_DHCP_REGISTRY_INIT_FAILED = 20000;
pub const ERROR_DHCP_DATABASE_INIT_FAILED = 20001;
pub const ERROR_DHCP_RPC_INIT_FAILED = 20002;
pub const ERROR_DHCP_NETWORK_INIT_FAILED = 20003;
pub const ERROR_DHCP_SUBNET_EXITS = 20004;
pub const ERROR_DHCP_SUBNET_NOT_PRESENT = 20005;
pub const ERROR_DHCP_PRIMARY_NOT_FOUND = 20006;
pub const ERROR_DHCP_ELEMENT_CANT_REMOVE = 20007;
pub const ERROR_DHCP_OPTION_EXITS = 20009;
pub const ERROR_DHCP_OPTION_NOT_PRESENT = 20010;
pub const ERROR_DHCP_ADDRESS_NOT_AVAILABLE = 20011;
pub const ERROR_DHCP_RANGE_FULL = 20012;
pub const ERROR_DHCP_JET_ERROR = 20013;
pub const ERROR_DHCP_CLIENT_EXISTS = 20014;
pub const ERROR_DHCP_INVALID_DHCP_MESSAGE = 20015;
pub const ERROR_DHCP_INVALID_DHCP_CLIENT = 20016;
pub const ERROR_DHCP_SERVICE_PAUSED = 20017;
pub const ERROR_DHCP_NOT_RESERVED_CLIENT = 20018;
pub const ERROR_DHCP_RESERVED_CLIENT = 20019;
pub const ERROR_DHCP_RANGE_TOO_SMALL = 20020;
pub const ERROR_DHCP_IPRANGE_EXITS = 20021;
pub const ERROR_DHCP_RESERVEDIP_EXITS = 20022;
pub const ERROR_DHCP_INVALID_RANGE = 20023;
pub const ERROR_DHCP_RANGE_EXTENDED = 20024;
pub const ERROR_EXTEND_TOO_SMALL = 20025;
pub const WARNING_EXTENDED_LESS = 20026;
pub const ERROR_DHCP_JET_CONV_REQUIRED = 20027;
pub const ERROR_SERVER_INVALID_BOOT_FILE_TABLE = 20028;
pub const ERROR_SERVER_UNKNOWN_BOOT_FILE_NAME = 20029;
pub const ERROR_DHCP_SUPER_SCOPE_NAME_TOO_LONG = 20030;
pub const ERROR_DHCP_IP_ADDRESS_IN_USE = 20032;
pub const ERROR_DHCP_LOG_FILE_PATH_TOO_LONG = 20033;
pub const ERROR_DHCP_UNSUPPORTED_CLIENT = 20034;
pub const ERROR_DHCP_JET97_CONV_REQUIRED = 20036;
pub const ERROR_DHCP_ROGUE_INIT_FAILED = 20037;
pub const ERROR_DHCP_ROGUE_SAMSHUTDOWN = 20038;
pub const ERROR_DHCP_ROGUE_NOT_AUTHORIZED = 20039;
pub const ERROR_DHCP_ROGUE_DS_UNREACHABLE = 20040;
pub const ERROR_DHCP_ROGUE_DS_CONFLICT = 20041;
pub const ERROR_DHCP_ROGUE_NOT_OUR_ENTERPRISE = 20042;
pub const ERROR_DHCP_ROGUE_STANDALONE_IN_DS = 20043;
pub const ERROR_DHCP_CLASS_NOT_FOUND = 20044;
pub const ERROR_DHCP_CLASS_ALREADY_EXISTS = 20045;
pub const ERROR_DHCP_SCOPE_NAME_TOO_LONG = 20046;
pub const ERROR_DHCP_DEFAULT_SCOPE_EXITS = 20047;
pub const ERROR_DHCP_CANT_CHANGE_ATTRIBUTE = 20048;
pub const ERROR_DHCP_IPRANGE_CONV_ILLEGAL = 20049;
pub const ERROR_DHCP_NETWORK_CHANGED = 20050;
pub const ERROR_DHCP_CANNOT_MODIFY_BINDINGS = 20051;
pub const ERROR_DHCP_SUBNET_EXISTS = 20052;
pub const ERROR_DHCP_MSCOPE_EXISTS = 20053;
pub const ERROR_MSCOPE_RANGE_TOO_SMALL = 20054;
pub const ERROR_DHCP_EXEMPTION_EXISTS = 20055;
pub const ERROR_DHCP_EXEMPTION_NOT_PRESENT = 20056;
pub const ERROR_DHCP_INVALID_PARAMETER_OPTION32 = 20057;
pub const ERROR_DDS_NO_DS_AVAILABLE = 20070;
pub const ERROR_DDS_NO_DHCP_ROOT = 20071;
pub const ERROR_DDS_UNEXPECTED_ERROR = 20072;
pub const ERROR_DDS_TOO_MANY_ERRORS = 20073;
pub const ERROR_DDS_DHCP_SERVER_NOT_FOUND = 20074;
pub const ERROR_DDS_OPTION_ALREADY_EXISTS = 20075;
pub const ERROR_DDS_OPTION_DOES_NOT_EXIST = 20076;
pub const ERROR_DDS_CLASS_EXISTS = 20077;
pub const ERROR_DDS_CLASS_DOES_NOT_EXIST = 20078;
pub const ERROR_DDS_SERVER_ALREADY_EXISTS = 20079;
pub const ERROR_DDS_SERVER_DOES_NOT_EXIST = 20080;
pub const ERROR_DDS_SERVER_ADDRESS_MISMATCH = 20081;
pub const ERROR_DDS_SUBNET_EXISTS = 20082;
pub const ERROR_DDS_SUBNET_HAS_DIFF_SSCOPE = 20083;
pub const ERROR_DDS_SUBNET_NOT_PRESENT = 20084;
pub const ERROR_DDS_RESERVATION_NOT_PRESENT = 20085;
pub const ERROR_DDS_RESERVATION_CONFLICT = 20086;
pub const ERROR_DDS_POSSIBLE_RANGE_CONFLICT = 20087;
pub const ERROR_DDS_RANGE_DOES_NOT_EXIST = 20088;
pub const ERROR_DHCP_DELETE_BUILTIN_CLASS = 20089;
pub const ERROR_DHCP_INVALID_SUBNET_PREFIX = 20091;
pub const ERROR_DHCP_INVALID_DELAY = 20092;
pub const ERROR_DHCP_LINKLAYER_ADDRESS_EXISTS = 20093;
pub const ERROR_DHCP_LINKLAYER_ADDRESS_RESERVATION_EXISTS = 20094;
pub const ERROR_DHCP_LINKLAYER_ADDRESS_DOES_NOT_EXIST = 20095;
pub const ERROR_DHCP_HARDWARE_ADDRESS_TYPE_ALREADY_EXEMPT = 20101;
pub const ERROR_DHCP_UNDEFINED_HARDWARE_ADDRESS_TYPE = 20102;
pub const ERROR_DHCP_OPTION_TYPE_MISMATCH = 20103;
pub const ERROR_DHCP_POLICY_BAD_PARENT_EXPR = 20104;
pub const ERROR_DHCP_POLICY_EXISTS = 20105;
pub const ERROR_DHCP_POLICY_RANGE_EXISTS = 20106;
pub const ERROR_DHCP_POLICY_RANGE_BAD = 20107;
pub const ERROR_DHCP_RANGE_INVALID_IN_SERVER_POLICY = 20108;
pub const ERROR_DHCP_INVALID_POLICY_EXPRESSION = 20109;
pub const ERROR_DHCP_INVALID_PROCESSING_ORDER = 20110;
pub const ERROR_DHCP_POLICY_NOT_FOUND = 20111;
pub const ERROR_SCOPE_RANGE_POLICY_RANGE_CONFLICT = 20112;
pub const ERROR_DHCP_FO_SCOPE_ALREADY_IN_RELATIONSHIP = 20113;
pub const ERROR_DHCP_FO_RELATIONSHIP_EXISTS = 20114;
pub const ERROR_DHCP_FO_RELATIONSHIP_DOES_NOT_EXIST = 20115;
pub const ERROR_DHCP_FO_SCOPE_NOT_IN_RELATIONSHIP = 20116;
pub const ERROR_DHCP_FO_RELATION_IS_SECONDARY = 20117;
pub const ERROR_DHCP_FO_NOT_SUPPORTED = 20118;
pub const ERROR_DHCP_FO_TIME_OUT_OF_SYNC = 20119;
pub const ERROR_DHCP_FO_STATE_NOT_NORMAL = 20120;
pub const ERROR_DHCP_NO_ADMIN_PERMISSION = 20121;
pub const ERROR_DHCP_SERVER_NOT_REACHABLE = 20122;
pub const ERROR_DHCP_SERVER_NOT_RUNNING = 20123;
pub const ERROR_DHCP_SERVER_NAME_NOT_RESOLVED = 20124;
pub const ERROR_DHCP_FO_RELATIONSHIP_NAME_TOO_LONG = 20125;
pub const ERROR_DHCP_REACHED_END_OF_SELECTION = 20126;
pub const ERROR_DHCP_FO_ADDSCOPE_LEASES_NOT_SYNCED = 20127;
pub const ERROR_DHCP_FO_MAX_RELATIONSHIPS = 20128;
pub const ERROR_DHCP_FO_IPRANGE_TYPE_CONV_ILLEGAL = 20129;
pub const ERROR_DHCP_FO_MAX_ADD_SCOPES = 20130;
pub const ERROR_DHCP_FO_BOOT_NOT_SUPPORTED = 20131;
pub const ERROR_DHCP_FO_RANGE_PART_OF_REL = 20132;
pub const ERROR_DHCP_FO_SCOPE_SYNC_IN_PROGRESS = 20133;
pub const ERROR_DHCP_FO_FEATURE_NOT_SUPPORTED = 20134;
pub const ERROR_DHCP_POLICY_FQDN_RANGE_UNSUPPORTED = 20135;
pub const ERROR_DHCP_POLICY_FQDN_OPTION_UNSUPPORTED = 20136;
pub const ERROR_DHCP_POLICY_EDIT_FQDN_UNSUPPORTED = 20137;
pub const ERROR_DHCP_NAP_NOT_SUPPORTED = 20138;
pub const ERROR_LAST_DHCP_SERVER_ERROR = 20139;
pub const DHCP_SUBNET_INFO_VQ_FLAG_QUARANTINE = 1;
pub const MAX_PATTERN_LENGTH = 255;
pub const MAC_ADDRESS_LENGTH = 6;
pub const HWTYPE_ETHERNET_10MB = 1;
pub const FILTER_STATUS_NONE = 1;
pub const FILTER_STATUS_FULL_MATCH_IN_ALLOW_LIST = 2;
pub const FILTER_STATUS_FULL_MATCH_IN_DENY_LIST = 4;
pub const FILTER_STATUS_WILDCARD_MATCH_IN_ALLOW_LIST = 8;
pub const FILTER_STATUS_WILDCARD_MATCH_IN_DENY_LIST = 16;
pub const Set_APIProtocolSupport = 1;
pub const Set_DatabaseName = 2;
pub const Set_DatabasePath = 4;
pub const Set_BackupPath = 8;
pub const Set_BackupInterval = 16;
pub const Set_DatabaseLoggingFlag = 32;
pub const Set_RestoreFlag = 64;
pub const Set_DatabaseCleanupInterval = 128;
pub const Set_DebugFlag = 256;
pub const Set_PingRetries = 512;
pub const Set_BootFileTable = 1024;
pub const Set_AuditLogState = 2048;
pub const Set_QuarantineON = 4096;
pub const Set_QuarantineDefFail = 8192;
pub const CLIENT_TYPE_UNSPECIFIED = 0;
pub const CLIENT_TYPE_DHCP = 1;
pub const CLIENT_TYPE_BOOTP = 2;
pub const CLIENT_TYPE_RESERVATION_FLAG = 4;
pub const CLIENT_TYPE_NONE = 100;
pub const Set_UnicastFlag = 1;
pub const Set_RapidCommitFlag = 2;
pub const Set_PreferredLifetime = 4;
pub const Set_ValidLifetime = 8;
pub const Set_T1 = 16;
pub const Set_T2 = 32;
pub const Set_PreferredLifetimeIATA = 64;
pub const Set_ValidLifetimeIATA = 128;
pub const V5_ADDRESS_STATE_OFFERED = 0;
pub const V5_ADDRESS_STATE_ACTIVE = 1;
pub const V5_ADDRESS_STATE_DECLINED = 2;
pub const V5_ADDRESS_STATE_DOOM = 3;
pub const V5_ADDRESS_BIT_DELETED = 128;
pub const V5_ADDRESS_BIT_UNREGISTERED = 64;
pub const V5_ADDRESS_BIT_BOTH_REC = 32;
pub const V5_ADDRESS_EX_BIT_DISABLE_PTR_RR = 1;
pub const DNS_FLAG_ENABLED = 1;
pub const DNS_FLAG_UPDATE_DOWNLEVEL = 2;
pub const DNS_FLAG_CLEANUP_EXPIRED = 4;
pub const DNS_FLAG_UPDATE_BOTH_ALWAYS = 16;
pub const DNS_FLAG_UPDATE_DHCID = 32;
pub const DNS_FLAG_DISABLE_PTR_UPDATE = 64;
pub const DNS_FLAG_HAS_DNS_SUFFIX = 128;
pub const DHCP_OPT_ENUM_IGNORE_VENDOR = 1;
pub const DHCP_OPT_ENUM_USE_CLASSNAME = 2;
pub const DHCP_FLAGS_DONT_ACCESS_DS = 1;
pub const DHCP_FLAGS_DONT_DO_RPC = 2;
pub const DHCP_FLAGS_OPTION_IS_VENDOR = 3;
pub const DHCP_ATTRIB_BOOL_IS_ROGUE = 1;
pub const DHCP_ATTRIB_BOOL_IS_DYNBOOTP = 2;
pub const DHCP_ATTRIB_BOOL_IS_PART_OF_DSDC = 3;
pub const DHCP_ATTRIB_BOOL_IS_BINDING_AWARE = 4;
pub const DHCP_ATTRIB_BOOL_IS_ADMIN = 5;
pub const DHCP_ATTRIB_ULONG_RESTORE_STATUS = 6;
pub const DHCP_ATTRIB_TYPE_BOOL = 1;
pub const DHCP_ATTRIB_TYPE_ULONG = 2;
pub const DHCP_ENDPOINT_FLAG_CANT_MODIFY = 1;
pub const QUARANTIN_OPTION_BASE = 43220;
pub const QUARANTINE_SCOPE_QUARPROFILE_OPTION = 43221;
pub const QUARANTINE_CONFIG_OPTION = 43222;
pub const ADDRESS_TYPE_IANA = 0;
pub const ADDRESS_TYPE_IATA = 1;
pub const DHCP_MIN_DELAY = 0;
pub const DHCP_MAX_DELAY = 1000;
pub const DHCP_FAILOVER_DELETE_SCOPES = 1;
pub const DHCP_FAILOVER_MAX_NUM_ADD_SCOPES = 400;
pub const DHCP_FAILOVER_MAX_NUM_REL = 31;
pub const MCLT = 1;
pub const SAFEPERIOD = 2;
pub const CHANGESTATE = 4;
pub const PERCENTAGE = 8;
pub const MODE = 16;
pub const PREVSTATE = 32;
pub const SHAREDSECRET = 64;
pub const DHCP_CONTROL_START = 1;
pub const DHCP_CONTROL_STOP = 2;
pub const DHCP_CONTROL_PAUSE = 3;
pub const DHCP_CONTROL_CONTINUE = 4;
pub const DHCP_DROP_DUPLICATE = 1;
pub const DHCP_DROP_NOMEM = 2;
pub const DHCP_DROP_INTERNAL_ERROR = 3;
pub const DHCP_DROP_TIMEOUT = 4;
pub const DHCP_DROP_UNAUTH = 5;
pub const DHCP_DROP_PAUSED = 6;
pub const DHCP_DROP_NO_SUBNETS = 7;
pub const DHCP_DROP_INVALID = 8;
pub const DHCP_DROP_WRONG_SERVER = 9;
pub const DHCP_DROP_NOADDRESS = 10;
pub const DHCP_DROP_PROCESSED = 11;
pub const DHCP_DROP_GEN_FAILURE = 256;
pub const DHCP_SEND_PACKET = 268435456;
pub const DHCP_PROB_CONFLICT = 536870913;
pub const DHCP_PROB_DECLINE = 536870914;
pub const DHCP_PROB_RELEASE = 536870915;
pub const DHCP_PROB_NACKED = 536870916;
pub const DHCP_GIVE_ADDRESS_NEW = 805306369;
pub const DHCP_GIVE_ADDRESS_OLD = 805306370;
pub const DHCP_CLIENT_BOOTP = 805306371;
pub const DHCP_CLIENT_DHCP = 805306372;
pub const DHCPV6_OPTION_CLIENTID = 1;
pub const DHCPV6_OPTION_SERVERID = 2;
pub const DHCPV6_OPTION_IA_NA = 3;
pub const DHCPV6_OPTION_IA_TA = 4;
pub const DHCPV6_OPTION_ORO = 6;
pub const DHCPV6_OPTION_PREFERENCE = 7;
pub const DHCPV6_OPTION_UNICAST = 12;
pub const DHCPV6_OPTION_RAPID_COMMIT = 14;
pub const DHCPV6_OPTION_USER_CLASS = 15;
pub const DHCPV6_OPTION_VENDOR_CLASS = 16;
pub const DHCPV6_OPTION_VENDOR_OPTS = 17;
pub const DHCPV6_OPTION_RECONF_MSG = 19;
pub const DHCPV6_OPTION_SIP_SERVERS_NAMES = 21;
pub const DHCPV6_OPTION_SIP_SERVERS_ADDRS = 22;
pub const DHCPV6_OPTION_DNS_SERVERS = 23;
pub const DHCPV6_OPTION_DOMAIN_LIST = 24;
pub const DHCPV6_OPTION_IA_PD = 25;
pub const DHCPV6_OPTION_NIS_SERVERS = 27;
pub const DHCPV6_OPTION_NISP_SERVERS = 28;
pub const DHCPV6_OPTION_NIS_DOMAIN_NAME = 29;
pub const DHCPV6_OPTION_NISP_DOMAIN_NAME = 30;
pub const DHCPV6_OPTION_DNR = 144;
pub const STATUS_NO_ERROR = 0;
pub const STATUS_UNSPECIFIED_FAILURE = 1;
pub const STATUS_NO_BINDING = 3;
pub const STATUS_NOPREFIX_AVAIL = 6;
pub const DhcpFullForce = 0;
pub const DhcpNoForce = 1;
pub const DhcpFailoverForce = 2;
pub const DhcpSubnetEnabled = 0;
pub const DhcpSubnetDisabled = 1;
pub const DhcpSubnetEnabledSwitched = 2;
pub const DhcpSubnetDisabledSwitched = 3;
pub const DhcpSubnetInvalidState = 4;
pub const DhcpIpRanges = 0;
pub const DhcpSecondaryHosts = 1;
pub const DhcpReservedIps = 2;
pub const DhcpExcludedIpRanges = 3;
pub const DhcpIpUsedClusters = 4;
pub const DhcpIpRangesDhcpOnly = 5;
pub const DhcpIpRangesDhcpBootp = 6;
pub const DhcpIpRangesBootpOnly = 7;
pub const Deny = 0;
pub const Allow = 1;
pub const DhcpByteOption = 0;
pub const DhcpWordOption = 1;
pub const DhcpDWordOption = 2;
pub const DhcpDWordDWordOption = 3;
pub const DhcpIpAddressOption = 4;
pub const DhcpStringDataOption = 5;
pub const DhcpBinaryDataOption = 6;
pub const DhcpEncapsulatedDataOption = 7;
pub const DhcpIpv6AddressOption = 8;
pub const DhcpUnaryElementTypeOption = 0;
pub const DhcpArrayTypeOption = 1;
pub const DhcpDefaultOptions = 0;
pub const DhcpGlobalOptions = 1;
pub const DhcpSubnetOptions = 2;
pub const DhcpReservedOptions = 3;
pub const DhcpMScopeOptions = 4;
pub const DhcpDefaultOptions6 = 0;
pub const DhcpScopeOptions6 = 1;
pub const DhcpReservedOptions6 = 2;
pub const DhcpGlobalOptions6 = 3;
pub const NOQUARANTINE = 0;
pub const RESTRICTEDACCESS = 1;
pub const DROPPACKET = 2;
pub const PROBATION = 3;
pub const EXEMPT = 4;
pub const DEFAULTQUARSETTING = 5;
pub const NOQUARINFO = 6;
pub const DhcpClientIpAddress = 0;
pub const DhcpClientHardwareAddress = 1;
pub const DhcpClientName = 2;
pub const DhcpPropTypeByte = 0;
pub const DhcpPropTypeWord = 1;
pub const DhcpPropTypeDword = 2;
pub const DhcpPropTypeString = 3;
pub const DhcpPropTypeBinary = 4;
pub const DhcpPropIdPolicyDnsSuffix = 0;
pub const DhcpPropIdClientAddressStateEx = 1;
pub const DhcpRegistryFix = 0;
pub const DhcpDatabaseFix = 1;
pub const Dhcpv6IpRanges = 0;
pub const Dhcpv6ReservedIps = 1;
pub const Dhcpv6ExcludedIpRanges = 2;
pub const Dhcpv6ClientIpAddress = 0;
pub const Dhcpv6ClientDUID = 1;
pub const Dhcpv6ClientName = 2;
pub const DhcpAttrHWAddr = 0;
pub const DhcpAttrOption = 1;
pub const DhcpAttrSubOption = 2;
pub const DhcpAttrFqdn = 3;
pub const DhcpAttrFqdnSingleLabel = 4;
pub const DhcpCompEqual = 0;
pub const DhcpCompNotEqual = 1;
pub const DhcpCompBeginsWith = 2;
pub const DhcpCompNotBeginWith = 3;
pub const DhcpCompEndsWith = 4;
pub const DhcpCompNotEndWith = 5;
pub const DhcpLogicalOr = 0;
pub const DhcpLogicalAnd = 1;
pub const DhcpUpdatePolicyName = 1;
pub const DhcpUpdatePolicyOrder = 2;
pub const DhcpUpdatePolicyExpr = 4;
pub const DhcpUpdatePolicyRanges = 8;
pub const DhcpUpdatePolicyDescr = 16;
pub const DhcpUpdatePolicyStatus = 32;
pub const DhcpUpdatePolicyDnsSuffix = 64;
pub const DhcpStatelessPurgeInterval = 1;
pub const DhcpStatelessStatus = 2;
pub const LoadBalance = 0;
pub const HotStandby = 1;
pub const PrimaryServer = 0;
pub const SecondaryServer = 1;
pub const NO_STATE = 0;
pub const INIT = 1;
pub const STARTUP = 2;
pub const NORMAL = 3;
pub const COMMUNICATION_INT = 4;
pub const PARTNER_DOWN = 5;
pub const POTENTIAL_CONFLICT = 6;
pub const CONFLICT_DONE = 7;
pub const RESOLUTION_INT = 8;
pub const RECOVER = 9;
pub const RECOVER_WAIT = 10;
pub const RECOVER_DONE = 11;
pub const PAUSED = 12;
pub const SHUTDOWN = 13;

pub const aliases = struct {
    pub const StatusCode = i32;
    pub const DHCP_FORCE_FLAG = i32;
    pub const DHCP_SUBNET_STATE = i32;
    pub const DHCP_SUBNET_ELEMENT_TYPE = i32;
    pub const DHCP_FILTER_LIST_TYPE = i32;
    pub const DHCP_OPTION_DATA_TYPE = i32;
    pub const DHCP_OPTION_TYPE = i32;
    pub const DHCP_OPTION_SCOPE_TYPE = i32;
    pub const DHCP_OPTION_SCOPE_TYPE6 = i32;
    pub const QuarantineStatus = i32;
    pub const DHCP_SEARCH_INFO_TYPE = i32;
    pub const DHCP_PROPERTY_TYPE = i32;
    pub const DHCP_PROPERTY_ID = i32;
    pub const DHCP_SCAN_FLAG = i32;
    pub const DHCP_SUBNET_ELEMENT_TYPE_V6 = i32;
    pub const DHCP_SEARCH_INFO_TYPE_V6 = i32;
    pub const DHCP_POL_ATTR_TYPE = i32;
    pub const DHCP_POL_COMPARATOR = i32;
    pub const DHCP_POL_LOGIC_OPER = i32;
    pub const DHCP_POLICY_FIELDS_TO_UPDATE = i32;
    pub const DHCPV6_STATELESS_PARAM_TYPE = i32;
    pub const DHCP_FAILOVER_MODE = i32;
    pub const DHCP_FAILOVER_SERVER = i32;
    pub const FSM_STATE = i32;
    pub const LPDHCP_CONTROL = ?*const anyopaque;
    pub const LPDHCP_NEWPKT = ?*const anyopaque;
    pub const LPDHCP_DROP_SEND = ?*const anyopaque;
    pub const LPDHCP_PROB = ?*const anyopaque;
    pub const LPDHCP_GIVE_ADDRESS = ?*const anyopaque;
    pub const LPDHCP_HANDLE_OPTIONS = ?*const anyopaque;
    pub const LPDHCP_DELETE_CLIENT = ?*const anyopaque;
    pub const LPDHCP_ENTRY_POINT_FUNC = ?*const anyopaque;
};
