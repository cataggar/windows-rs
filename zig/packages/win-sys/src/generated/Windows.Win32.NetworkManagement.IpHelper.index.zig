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
    .{ "IcmpCreateFile", MethodRecord{ .library = "IPHLPAPI", .import = "IcmpCreateFile", .signature = "\x00\x00\x11\x80\x85" } },
    .{ "Icmp6CreateFile", MethodRecord{ .library = "IPHLPAPI", .import = "Icmp6CreateFile", .signature = "\x00\x00\x11\x80\x85" } },
    .{ "IcmpCloseHandle", MethodRecord{ .library = "IPHLPAPI", .import = "IcmpCloseHandle", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "IcmpSendEcho", MethodRecord{ .library = "IPHLPAPI", .import = "IcmpSendEcho", .signature = "\x00\x08\x09\x11\x80\x85\x09\x0f\x01\x07\x0f\x11\xb6\x11\x0f\x01\x09\x09" } },
    .{ "IcmpSendEcho2", MethodRecord{ .library = "IPHLPAPI", .import = "IcmpSendEcho2", .signature = "\x00\x0b\x09\x11\x80\x85\x11\x80\x85\x12\xb6\x15\x0f\x01\x09\x0f\x01\x07\x0f\x11\xb6\x11\x0f\x01\x09\x09" } },
    .{ "IcmpSendEcho2Ex", MethodRecord{ .library = "IPHLPAPI", .import = "IcmpSendEcho2Ex", .signature = "\x00\x0c\x09\x11\x80\x85\x11\x80\x85\x12\xb6\x15\x0f\x01\x09\x09\x0f\x01\x07\x0f\x11\xb6\x11\x0f\x01\x09\x09" } },
    .{ "Icmp6SendEcho2", MethodRecord{ .library = "IPHLPAPI", .import = "Icmp6SendEcho2", .signature = "\x00\x0c\x09\x11\x80\x85\x11\x80\x85\x12\xb6\x15\x0f\x01\x0f\x11\xb6\x19\x0f\x11\xb6\x19\x0f\x01\x07\x0f\x11\xb6\x11\x0f\x01\x09\x09" } },
    .{ "IcmpParseReplies", MethodRecord{ .library = "IPHLPAPI", .import = "IcmpParseReplies", .signature = "\x00\x02\x09\x0f\x01\x09" } },
    .{ "Icmp6ParseReplies", MethodRecord{ .library = "IPHLPAPI", .import = "Icmp6ParseReplies", .signature = "\x00\x02\x09\x0f\x01\x09" } },
    .{ "GetNumberOfInterfaces", MethodRecord{ .library = "IPHLPAPI", .import = "GetNumberOfInterfaces", .signature = "\x00\x01\x09\x0f\x09" } },
    .{ "GetIfEntry", MethodRecord{ .library = "IPHLPAPI", .import = "GetIfEntry", .signature = "\x00\x01\x09\x0f\x11\xb6\x1d" } },
    .{ "GetIfTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetIfTable", .signature = "\x00\x03\x09\x0f\x11\xb6\x21\x0f\x09\x11\x59" } },
    .{ "GetIpAddrTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpAddrTable", .signature = "\x00\x03\x09\x0f\x11\xb6\x25\x0f\x09\x11\x59" } },
    .{ "GetIpNetTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpNetTable", .signature = "\x00\x03\x09\x0f\x11\xb6\x29\x0f\x09\x11\x59" } },
    .{ "GetIpForwardTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpForwardTable", .signature = "\x00\x03\x09\x0f\x11\xb6\x2d\x0f\x09\x11\x59" } },
    .{ "GetTcpTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetTcpTable", .signature = "\x00\x03\x09\x0f\x11\xb6\x31\x0f\x09\x11\x59" } },
    .{ "GetExtendedTcpTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetExtendedTcpTable", .signature = "\x00\x06\x09\x0f\x01\x0f\x09\x11\x59\x09\x11\xb6\x35\x09" } },
    .{ "GetOwnerModuleFromTcpEntry", MethodRecord{ .library = "IPHLPAPI", .import = "GetOwnerModuleFromTcpEntry", .signature = "\x00\x04\x09\x0f\x11\xb6\x39\x11\xb6\x3d\x0f\x01\x0f\x09" } },
    .{ "GetUdpTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetUdpTable", .signature = "\x00\x03\x09\x0f\x11\xb6\x41\x0f\x09\x11\x59" } },
    .{ "GetExtendedUdpTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetExtendedUdpTable", .signature = "\x00\x06\x09\x0f\x01\x0f\x09\x11\x59\x09\x11\xb6\x45\x09" } },
    .{ "GetOwnerModuleFromUdpEntry", MethodRecord{ .library = "IPHLPAPI", .import = "GetOwnerModuleFromUdpEntry", .signature = "\x00\x04\x09\x0f\x11\xb6\x49\x11\xb6\x3d\x0f\x01\x0f\x09" } },
    .{ "GetTcpTable2", MethodRecord{ .library = "IPHLPAPI", .import = "GetTcpTable2", .signature = "\x00\x03\x09\x0f\x11\xb6\x4d\x0f\x09\x11\x59" } },
    .{ "GetTcp6Table", MethodRecord{ .library = "IPHLPAPI", .import = "GetTcp6Table", .signature = "\x00\x03\x09\x0f\x11\xb6\x51\x0f\x09\x11\x59" } },
    .{ "GetTcp6Table2", MethodRecord{ .library = "IPHLPAPI", .import = "GetTcp6Table2", .signature = "\x00\x03\x09\x0f\x11\xb6\x55\x0f\x09\x11\x59" } },
    .{ "GetPerTcpConnectionEStats", MethodRecord{ .library = "IPHLPAPI", .import = "GetPerTcpConnectionEStats", .signature = "\x00\x0b\x09\x0f\x11\xb6\x59\x11\xb6\x5d\x0f\x05\x09\x09\x0f\x05\x09\x09\x0f\x05\x09\x09" } },
    .{ "SetPerTcpConnectionEStats", MethodRecord{ .library = "IPHLPAPI", .import = "SetPerTcpConnectionEStats", .signature = "\x00\x06\x09\x0f\x11\xb6\x59\x11\xb6\x5d\x0f\x05\x09\x09\x09" } },
    .{ "GetPerTcp6ConnectionEStats", MethodRecord{ .library = "IPHLPAPI", .import = "GetPerTcp6ConnectionEStats", .signature = "\x00\x0b\x09\x0f\x11\xb6\x61\x11\xb6\x5d\x0f\x05\x09\x09\x0f\x05\x09\x09\x0f\x05\x09\x09" } },
    .{ "SetPerTcp6ConnectionEStats", MethodRecord{ .library = "IPHLPAPI", .import = "SetPerTcp6ConnectionEStats", .signature = "\x00\x06\x09\x0f\x11\xb6\x61\x11\xb6\x5d\x0f\x05\x09\x09\x09" } },
    .{ "GetOwnerModuleFromTcp6Entry", MethodRecord{ .library = "IPHLPAPI", .import = "GetOwnerModuleFromTcp6Entry", .signature = "\x00\x04\x09\x0f\x11\xb6\x65\x11\xb6\x3d\x0f\x01\x0f\x09" } },
    .{ "GetUdp6Table", MethodRecord{ .library = "IPHLPAPI", .import = "GetUdp6Table", .signature = "\x00\x03\x09\x0f\x11\xb6\x69\x0f\x09\x11\x59" } },
    .{ "GetOwnerModuleFromUdp6Entry", MethodRecord{ .library = "IPHLPAPI", .import = "GetOwnerModuleFromUdp6Entry", .signature = "\x00\x04\x09\x0f\x11\xb6\x6d\x11\xb6\x3d\x0f\x01\x0f\x09" } },
    .{ "GetOwnerModuleFromPidAndInfo", MethodRecord{ .library = "IPHLPAPI", .import = "GetOwnerModuleFromPidAndInfo", .signature = "\x00\x05\x09\x09\x0f\x0b\x11\xb6\x3d\x0f\x01\x0f\x09" } },
    .{ "GetIpStatistics", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpStatistics", .signature = "\x00\x01\x09\x0f\x11\xb6\x71" } },
    .{ "GetIcmpStatistics", MethodRecord{ .library = "IPHLPAPI", .import = "GetIcmpStatistics", .signature = "\x00\x01\x09\x0f\x11\xb6\x75" } },
    .{ "GetTcpStatistics", MethodRecord{ .library = "IPHLPAPI", .import = "GetTcpStatistics", .signature = "\x00\x01\x09\x0f\x11\xb6\x79" } },
    .{ "GetUdpStatistics", MethodRecord{ .library = "IPHLPAPI", .import = "GetUdpStatistics", .signature = "\x00\x01\x09\x0f\x11\xb6\x7d" } },
    .{ "SetIpStatisticsEx", MethodRecord{ .library = "IPHLPAPI", .import = "SetIpStatisticsEx", .signature = "\x00\x02\x09\x0f\x11\xb6\x71\x09" } },
    .{ "GetIpStatisticsEx", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpStatisticsEx", .signature = "\x00\x02\x09\x0f\x11\xb6\x71\x09" } },
    .{ "GetIcmpStatisticsEx", MethodRecord{ .library = "IPHLPAPI", .import = "GetIcmpStatisticsEx", .signature = "\x00\x02\x09\x0f\x11\xb6\x81\x09" } },
    .{ "GetTcpStatisticsEx", MethodRecord{ .library = "IPHLPAPI", .import = "GetTcpStatisticsEx", .signature = "\x00\x02\x09\x0f\x11\xb6\x79\x09" } },
    .{ "GetUdpStatisticsEx", MethodRecord{ .library = "IPHLPAPI", .import = "GetUdpStatisticsEx", .signature = "\x00\x02\x09\x0f\x11\xb6\x7d\x09" } },
    .{ "GetTcpStatisticsEx2", MethodRecord{ .library = "IPHLPAPI", .import = "GetTcpStatisticsEx2", .signature = "\x00\x02\x09\x0f\x11\xb6\x85\x09" } },
    .{ "GetUdpStatisticsEx2", MethodRecord{ .library = "IPHLPAPI", .import = "GetUdpStatisticsEx2", .signature = "\x00\x02\x09\x0f\x11\xb6\x89\x09" } },
    .{ "SetIfEntry", MethodRecord{ .library = "IPHLPAPI", .import = "SetIfEntry", .signature = "\x00\x01\x09\x0f\x11\xb6\x1d" } },
    .{ "CreateIpForwardEntry", MethodRecord{ .library = "IPHLPAPI", .import = "CreateIpForwardEntry", .signature = "\x00\x01\x09\x0f\x11\xb6\x8d" } },
    .{ "SetIpForwardEntry", MethodRecord{ .library = "IPHLPAPI", .import = "SetIpForwardEntry", .signature = "\x00\x01\x09\x0f\x11\xb6\x8d" } },
    .{ "DeleteIpForwardEntry", MethodRecord{ .library = "IPHLPAPI", .import = "DeleteIpForwardEntry", .signature = "\x00\x01\x09\x0f\x11\xb6\x8d" } },
    .{ "SetIpStatistics", MethodRecord{ .library = "IPHLPAPI", .import = "SetIpStatistics", .signature = "\x00\x01\x09\x0f\x11\xb6\x71" } },
    .{ "SetIpTTL", MethodRecord{ .library = "IPHLPAPI", .import = "SetIpTTL", .signature = "\x00\x01\x09\x09" } },
    .{ "CreateIpNetEntry", MethodRecord{ .library = "IPHLPAPI", .import = "CreateIpNetEntry", .signature = "\x00\x01\x09\x0f\x11\xb6\x91" } },
    .{ "SetIpNetEntry", MethodRecord{ .library = "IPHLPAPI", .import = "SetIpNetEntry", .signature = "\x00\x01\x09\x0f\x11\xb6\x91" } },
    .{ "DeleteIpNetEntry", MethodRecord{ .library = "IPHLPAPI", .import = "DeleteIpNetEntry", .signature = "\x00\x01\x09\x0f\x11\xb6\x91" } },
    .{ "FlushIpNetTable", MethodRecord{ .library = "IPHLPAPI", .import = "FlushIpNetTable", .signature = "\x00\x01\x09\x09" } },
    .{ "CreateProxyArpEntry", MethodRecord{ .library = "IPHLPAPI", .import = "CreateProxyArpEntry", .signature = "\x00\x03\x09\x09\x09\x09" } },
    .{ "DeleteProxyArpEntry", MethodRecord{ .library = "IPHLPAPI", .import = "DeleteProxyArpEntry", .signature = "\x00\x03\x09\x09\x09\x09" } },
    .{ "SetTcpEntry", MethodRecord{ .library = "IPHLPAPI", .import = "SetTcpEntry", .signature = "\x00\x01\x09\x0f\x11\xb6\x59" } },
    .{ "GetInterfaceInfo", MethodRecord{ .library = "IPHLPAPI", .import = "GetInterfaceInfo", .signature = "\x00\x02\x09\x0f\x11\xb6\x95\x0f\x09" } },
    .{ "GetUniDirectionalAdapterInfo", MethodRecord{ .library = "IPHLPAPI", .import = "GetUniDirectionalAdapterInfo", .signature = "\x00\x02\x09\x0f\x11\xb6\x99\x0f\x09" } },
    .{ "NhpAllocateAndGetInterfaceInfoFromStack", MethodRecord{ .library = "IPHLPAPI", .import = "NhpAllocateAndGetInterfaceInfoFromStack", .signature = "\x00\x05\x09\x0f\x0f\x11\xb6\x9d\x0f\x09\x11\x59\x11\x80\x85\x09" } },
    .{ "GetBestInterface", MethodRecord{ .library = "IPHLPAPI", .import = "GetBestInterface", .signature = "\x00\x02\x09\x09\x0f\x09" } },
    .{ "GetBestInterfaceEx", MethodRecord{ .library = "IPHLPAPI", .import = "GetBestInterfaceEx", .signature = "\x00\x02\x09\x0f\x11\xb3\x71\x0f\x09" } },
    .{ "GetBestRoute", MethodRecord{ .library = "IPHLPAPI", .import = "GetBestRoute", .signature = "\x00\x03\x09\x09\x09\x0f\x11\xb6\x8d" } },
    .{ "NotifyAddrChange", MethodRecord{ .library = "IPHLPAPI", .import = "NotifyAddrChange", .signature = "\x00\x02\x09\x0f\x11\x80\x85\x0f\x11\x8b\xed" } },
    .{ "NotifyRouteChange", MethodRecord{ .library = "IPHLPAPI", .import = "NotifyRouteChange", .signature = "\x00\x02\x09\x0f\x11\x80\x85\x0f\x11\x8b\xed" } },
    .{ "CancelIPChangeNotify", MethodRecord{ .library = "IPHLPAPI", .import = "CancelIPChangeNotify", .signature = "\x00\x01\x11\x59\x0f\x11\x8b\xed" } },
    .{ "GetAdapterIndex", MethodRecord{ .library = "IPHLPAPI", .import = "GetAdapterIndex", .signature = "\x00\x02\x09\x11\x05\x0f\x09" } },
    .{ "AddIPAddress", MethodRecord{ .library = "IPHLPAPI", .import = "AddIPAddress", .signature = "\x00\x05\x09\x09\x09\x09\x0f\x09\x0f\x09" } },
    .{ "DeleteIPAddress", MethodRecord{ .library = "IPHLPAPI", .import = "DeleteIPAddress", .signature = "\x00\x01\x09\x09" } },
    .{ "GetNetworkParams", MethodRecord{ .library = "IPHLPAPI", .import = "GetNetworkParams", .signature = "\x00\x02\x11\x81\x01\x0f\x11\xb6\xa1\x0f\x09" } },
    .{ "GetAdaptersInfo", MethodRecord{ .library = "IPHLPAPI", .import = "GetAdaptersInfo", .signature = "\x00\x02\x09\x0f\x11\xb6\xa5\x0f\x09" } },
    .{ "GetAdapterOrderMap", MethodRecord{ .library = "IPHLPAPI", .import = "GetAdapterOrderMap", .signature = "\x00\x00\x0f\x11\xb6\xa9" } },
    .{ "GetAdaptersAddresses", MethodRecord{ .library = "IPHLPAPI", .import = "GetAdaptersAddresses", .signature = "\x00\x05\x09\x09\x11\x98\x09\x0f\x01\x0f\x11\xb6\xad\x0f\x09" } },
    .{ "GetPerAdapterInfo", MethodRecord{ .library = "IPHLPAPI", .import = "GetPerAdapterInfo", .signature = "\x00\x03\x09\x09\x0f\x11\xb6\xb1\x0f\x09" } },
    .{ "GetInterfaceActiveTimestampCapabilities", MethodRecord{ .library = "IPHLPAPI", .import = "GetInterfaceActiveTimestampCapabilities", .signature = "\x00\x02\x09\x0f\x11\xb6\xb5\x0f\x11\xb6\xb9" } },
    .{ "GetInterfaceSupportedTimestampCapabilities", MethodRecord{ .library = "IPHLPAPI", .import = "GetInterfaceSupportedTimestampCapabilities", .signature = "\x00\x02\x09\x0f\x11\xb6\xb5\x0f\x11\xb6\xb9" } },
    .{ "CaptureInterfaceHardwareCrossTimestamp", MethodRecord{ .library = "IPHLPAPI", .import = "CaptureInterfaceHardwareCrossTimestamp", .signature = "\x00\x02\x09\x0f\x11\xb6\xb5\x0f\x11\xb6\xbd" } },
    .{ "RegisterInterfaceTimestampConfigChange", MethodRecord{ .library = "IPHLPAPI", .import = "RegisterInterfaceTimestampConfigChange", .signature = "\x00\x03\x09\x12\xb6\xc1\x0f\x01\x0f\x11\xb6\xc5" } },
    .{ "UnregisterInterfaceTimestampConfigChange", MethodRecord{ .library = "IPHLPAPI", .import = "UnregisterInterfaceTimestampConfigChange", .signature = "\x00\x01\x01\x11\xb6\xc5" } },
    .{ "GetInterfaceCurrentTimestampCapabilities", MethodRecord{ .library = "IPHLPAPI", .import = "GetInterfaceCurrentTimestampCapabilities", .signature = "\x00\x02\x09\x0f\x11\xb6\xb5\x0f\x11\xb6\xb9" } },
    .{ "GetInterfaceHardwareTimestampCapabilities", MethodRecord{ .library = "IPHLPAPI", .import = "GetInterfaceHardwareTimestampCapabilities", .signature = "\x00\x02\x09\x0f\x11\xb6\xb5\x0f\x11\xb6\xb9" } },
    .{ "NotifyIfTimestampConfigChange", MethodRecord{ .library = "IPHLPAPI", .import = "NotifyIfTimestampConfigChange", .signature = "\x00\x03\x09\x0f\x01\x12\xb6\xc1\x0f\x11\xb6\xc5" } },
    .{ "CancelIfTimestampConfigChange", MethodRecord{ .library = "IPHLPAPI", .import = "CancelIfTimestampConfigChange", .signature = "\x00\x01\x01\x11\xb6\xc5" } },
    .{ "IpReleaseAddress", MethodRecord{ .library = "IPHLPAPI", .import = "IpReleaseAddress", .signature = "\x00\x01\x09\x0f\x11\xb6\xc9" } },
    .{ "IpRenewAddress", MethodRecord{ .library = "IPHLPAPI", .import = "IpRenewAddress", .signature = "\x00\x01\x09\x0f\x11\xb6\xc9" } },
    .{ "SendARP", MethodRecord{ .library = "IPHLPAPI", .import = "SendARP", .signature = "\x00\x04\x09\x09\x09\x0f\x01\x0f\x09" } },
    .{ "GetRTTAndHopCount", MethodRecord{ .library = "IPHLPAPI", .import = "GetRTTAndHopCount", .signature = "\x00\x04\x11\x59\x09\x0f\x09\x09\x0f\x09" } },
    .{ "GetFriendlyIfIndex", MethodRecord{ .library = "IPHLPAPI", .import = "GetFriendlyIfIndex", .signature = "\x00\x01\x09\x09" } },
    .{ "EnableRouter", MethodRecord{ .library = "IPHLPAPI", .import = "EnableRouter", .signature = "\x00\x02\x09\x0f\x11\x80\x85\x0f\x11\x8b\xed" } },
    .{ "UnenableRouter", MethodRecord{ .library = "IPHLPAPI", .import = "UnenableRouter", .signature = "\x00\x02\x09\x0f\x11\x8b\xed\x0f\x09" } },
    .{ "DisableMediaSense", MethodRecord{ .library = "IPHLPAPI", .import = "DisableMediaSense", .signature = "\x00\x02\x09\x0f\x11\x80\x85\x0f\x11\x8b\xed" } },
    .{ "RestoreMediaSense", MethodRecord{ .library = "IPHLPAPI", .import = "RestoreMediaSense", .signature = "\x00\x02\x09\x0f\x11\x8b\xed\x0f\x09" } },
    .{ "GetIpErrorString", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpErrorString", .signature = "\x00\x03\x09\x09\x11\x05\x0f\x09" } },
    .{ "ResolveNeighbor", MethodRecord{ .library = "IPHLPAPI", .import = "ResolveNeighbor", .signature = "\x00\x03\x09\x0f\x11\xb3\x71\x0f\x01\x0f\x09" } },
    .{ "CreatePersistentTcpPortReservation", MethodRecord{ .library = "IPHLPAPI", .import = "CreatePersistentTcpPortReservation", .signature = "\x00\x03\x09\x07\x07\x0f\x0b" } },
    .{ "CreatePersistentUdpPortReservation", MethodRecord{ .library = "IPHLPAPI", .import = "CreatePersistentUdpPortReservation", .signature = "\x00\x03\x09\x07\x07\x0f\x0b" } },
    .{ "DeletePersistentTcpPortReservation", MethodRecord{ .library = "IPHLPAPI", .import = "DeletePersistentTcpPortReservation", .signature = "\x00\x02\x09\x07\x07" } },
    .{ "DeletePersistentUdpPortReservation", MethodRecord{ .library = "IPHLPAPI", .import = "DeletePersistentUdpPortReservation", .signature = "\x00\x02\x09\x07\x07" } },
    .{ "LookupPersistentTcpPortReservation", MethodRecord{ .library = "IPHLPAPI", .import = "LookupPersistentTcpPortReservation", .signature = "\x00\x03\x09\x07\x07\x0f\x0b" } },
    .{ "LookupPersistentUdpPortReservation", MethodRecord{ .library = "IPHLPAPI", .import = "LookupPersistentUdpPortReservation", .signature = "\x00\x03\x09\x07\x07\x0f\x0b" } },
    .{ "ParseNetworkString", MethodRecord{ .library = "IPHLPAPI", .import = "ParseNetworkString", .signature = "\x00\x05\x09\x11\x05\x09\x0f\x11\xb6\xcd\x0f\x07\x0f\x05" } },
    .{ "GetIfEntry2", MethodRecord{ .library = "IPHLPAPI", .import = "GetIfEntry2", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb6\xd1" } },
    .{ "GetIfEntry2Ex", MethodRecord{ .library = "IPHLPAPI", .import = "GetIfEntry2Ex", .signature = "\x00\x02\x11\x81\x01\x11\xb6\xd5\x0f\x11\xb6\xd1" } },
    .{ "GetIfTable2", MethodRecord{ .library = "IPHLPAPI", .import = "GetIfTable2", .signature = "\x00\x01\x11\x81\x01\x0f\x0f\x11\xb6\xd9" } },
    .{ "GetIfTable2Ex", MethodRecord{ .library = "IPHLPAPI", .import = "GetIfTable2Ex", .signature = "\x00\x02\x11\x81\x01\x11\xb6\xdd\x0f\x0f\x11\xb6\xd9" } },
    .{ "GetIfStackTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetIfStackTable", .signature = "\x00\x01\x11\x81\x01\x0f\x0f\x11\xb6\xe1" } },
    .{ "GetInvertedIfStackTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetInvertedIfStackTable", .signature = "\x00\x01\x11\x81\x01\x0f\x0f\x11\xb6\xe5" } },
    .{ "GetIpInterfaceEntry", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpInterfaceEntry", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb6\xe9" } },
    .{ "GetIpInterfaceTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpInterfaceTable", .signature = "\x00\x02\x11\x81\x01\x11\x97\xe9\x0f\x0f\x11\xb6\xed" } },
    .{ "InitializeIpInterfaceEntry", MethodRecord{ .library = "IPHLPAPI", .import = "InitializeIpInterfaceEntry", .signature = "\x00\x01\x01\x0f\x11\xb6\xe9" } },
    .{ "NotifyIpInterfaceChange", MethodRecord{ .library = "IPHLPAPI", .import = "NotifyIpInterfaceChange", .signature = "\x00\x05\x11\x81\x01\x11\x97\xe9\x12\xb6\xf1\x0f\x01\x11\x87\x79\x0f\x11\x80\x85" } },
    .{ "SetIpInterfaceEntry", MethodRecord{ .library = "IPHLPAPI", .import = "SetIpInterfaceEntry", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb6\xe9" } },
    .{ "GetIpNetworkConnectionBandwidthEstimates", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpNetworkConnectionBandwidthEstimates", .signature = "\x00\x03\x11\x81\x01\x09\x11\x97\xe9\x0f\x11\xb6\xf5" } },
    .{ "CreateUnicastIpAddressEntry", MethodRecord{ .library = "IPHLPAPI", .import = "CreateUnicastIpAddressEntry", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb6\xf9" } },
    .{ "DeleteUnicastIpAddressEntry", MethodRecord{ .library = "IPHLPAPI", .import = "DeleteUnicastIpAddressEntry", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb6\xf9" } },
    .{ "GetUnicastIpAddressEntry", MethodRecord{ .library = "IPHLPAPI", .import = "GetUnicastIpAddressEntry", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb6\xf9" } },
    .{ "GetUnicastIpAddressTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetUnicastIpAddressTable", .signature = "\x00\x02\x11\x81\x01\x11\x97\xe9\x0f\x0f\x11\xb6\xfd" } },
    .{ "InitializeUnicastIpAddressEntry", MethodRecord{ .library = "IPHLPAPI", .import = "InitializeUnicastIpAddressEntry", .signature = "\x00\x01\x01\x0f\x11\xb6\xf9" } },
    .{ "NotifyUnicastIpAddressChange", MethodRecord{ .library = "IPHLPAPI", .import = "NotifyUnicastIpAddressChange", .signature = "\x00\x05\x11\x81\x01\x11\x97\xe9\x12\xb7\x01\x0f\x01\x11\x87\x79\x0f\x11\x80\x85" } },
    .{ "NotifyStableUnicastIpAddressTable", MethodRecord{ .library = "IPHLPAPI", .import = "NotifyStableUnicastIpAddressTable", .signature = "\x00\x05\x11\x81\x01\x11\x97\xe9\x0f\x0f\x11\xb6\xfd\x12\xb7\x05\x0f\x01\x0f\x11\x80\x85" } },
    .{ "SetUnicastIpAddressEntry", MethodRecord{ .library = "IPHLPAPI", .import = "SetUnicastIpAddressEntry", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb6\xf9" } },
    .{ "CreateAnycastIpAddressEntry", MethodRecord{ .library = "IPHLPAPI", .import = "CreateAnycastIpAddressEntry", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x09" } },
    .{ "DeleteAnycastIpAddressEntry", MethodRecord{ .library = "IPHLPAPI", .import = "DeleteAnycastIpAddressEntry", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x09" } },
    .{ "GetAnycastIpAddressEntry", MethodRecord{ .library = "IPHLPAPI", .import = "GetAnycastIpAddressEntry", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x09" } },
    .{ "GetAnycastIpAddressTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetAnycastIpAddressTable", .signature = "\x00\x02\x11\x81\x01\x11\x97\xe9\x0f\x0f\x11\xb7\x0d" } },
    .{ "GetMulticastIpAddressEntry", MethodRecord{ .library = "IPHLPAPI", .import = "GetMulticastIpAddressEntry", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x11" } },
    .{ "GetMulticastIpAddressTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetMulticastIpAddressTable", .signature = "\x00\x02\x11\x81\x01\x11\x97\xe9\x0f\x0f\x11\xb7\x15" } },
    .{ "CreateIpForwardEntry2", MethodRecord{ .library = "IPHLPAPI", .import = "CreateIpForwardEntry2", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x19" } },
    .{ "DeleteIpForwardEntry2", MethodRecord{ .library = "IPHLPAPI", .import = "DeleteIpForwardEntry2", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x19" } },
    .{ "GetBestRoute2", MethodRecord{ .library = "IPHLPAPI", .import = "GetBestRoute2", .signature = "\x00\x07\x11\x81\x01\x0f\x11\xb6\xb5\x09\x0f\x11\xb7\x1d\x0f\x11\xb7\x1d\x09\x0f\x11\xb7\x19\x0f\x11\xb7\x1d" } },
    .{ "GetIpForwardEntry2", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpForwardEntry2", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x19" } },
    .{ "GetIpForwardTable2", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpForwardTable2", .signature = "\x00\x02\x11\x81\x01\x11\x97\xe9\x0f\x0f\x11\xb7\x21" } },
    .{ "InitializeIpForwardEntry", MethodRecord{ .library = "IPHLPAPI", .import = "InitializeIpForwardEntry", .signature = "\x00\x01\x01\x0f\x11\xb7\x19" } },
    .{ "NotifyRouteChange2", MethodRecord{ .library = "IPHLPAPI", .import = "NotifyRouteChange2", .signature = "\x00\x05\x11\x81\x01\x11\x97\xe9\x12\xb7\x25\x0f\x01\x11\x87\x79\x0f\x11\x80\x85" } },
    .{ "SetIpForwardEntry2", MethodRecord{ .library = "IPHLPAPI", .import = "SetIpForwardEntry2", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x19" } },
    .{ "FlushIpPathTable", MethodRecord{ .library = "IPHLPAPI", .import = "FlushIpPathTable", .signature = "\x00\x01\x11\x81\x01\x11\x97\xe9" } },
    .{ "GetIpPathEntry", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpPathEntry", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x29" } },
    .{ "GetIpPathTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpPathTable", .signature = "\x00\x02\x11\x81\x01\x11\x97\xe9\x0f\x0f\x11\xb7\x2d" } },
    .{ "CreateIpNetEntry2", MethodRecord{ .library = "IPHLPAPI", .import = "CreateIpNetEntry2", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x31" } },
    .{ "DeleteIpNetEntry2", MethodRecord{ .library = "IPHLPAPI", .import = "DeleteIpNetEntry2", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x31" } },
    .{ "FlushIpNetTable2", MethodRecord{ .library = "IPHLPAPI", .import = "FlushIpNetTable2", .signature = "\x00\x02\x11\x81\x01\x11\x97\xe9\x09" } },
    .{ "GetIpNetEntry2", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpNetEntry2", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x31" } },
    .{ "GetIpNetTable2", MethodRecord{ .library = "IPHLPAPI", .import = "GetIpNetTable2", .signature = "\x00\x02\x11\x81\x01\x11\x97\xe9\x0f\x0f\x11\xb7\x35" } },
    .{ "ResolveIpNetEntry2", MethodRecord{ .library = "IPHLPAPI", .import = "ResolveIpNetEntry2", .signature = "\x00\x02\x11\x81\x01\x0f\x11\xb7\x31\x0f\x11\xb7\x1d" } },
    .{ "SetIpNetEntry2", MethodRecord{ .library = "IPHLPAPI", .import = "SetIpNetEntry2", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x31" } },
    .{ "NotifyTeredoPortChange", MethodRecord{ .library = "IPHLPAPI", .import = "NotifyTeredoPortChange", .signature = "\x00\x04\x11\x81\x01\x12\xb7\x39\x0f\x01\x11\x87\x79\x0f\x11\x80\x85" } },
    .{ "GetTeredoPort", MethodRecord{ .library = "IPHLPAPI", .import = "GetTeredoPort", .signature = "\x00\x01\x11\x81\x01\x0f\x07" } },
    .{ "CancelMibChangeNotify2", MethodRecord{ .library = "IPHLPAPI", .import = "CancelMibChangeNotify2", .signature = "\x00\x01\x11\x81\x01\x11\x80\x85" } },
    .{ "FreeMibTable", MethodRecord{ .library = "IPHLPAPI", .import = "FreeMibTable", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "CreateSortedAddressPairs", MethodRecord{ .library = "IPHLPAPI", .import = "CreateSortedAddressPairs", .signature = "\x00\x07\x11\x81\x01\x0f\x11\xb6\x19\x09\x0f\x11\xb6\x19\x09\x09\x0f\x0f\x11\xb7\x3d\x0f\x09" } },
    .{ "ConvertCompartmentGuidToId", MethodRecord{ .library = "IPHLPAPI", .import = "ConvertCompartmentGuidToId", .signature = "\x00\x02\x11\x81\x01\x0f\x11\x0d\x0f\x09" } },
    .{ "ConvertCompartmentIdToGuid", MethodRecord{ .library = "IPHLPAPI", .import = "ConvertCompartmentIdToGuid", .signature = "\x00\x02\x11\x81\x01\x11\xb7\x41\x0f\x11\x0d" } },
    .{ "ConvertInterfaceNameToLuidA", MethodRecord{ .library = "IPHLPAPI", .import = "ConvertInterfaceNameToLuidA", .signature = "\x00\x02\x11\x81\x01\x11\x3d\x0f\x11\xb6\xb5" } },
    .{ "ConvertInterfaceNameToLuidW", MethodRecord{ .library = "IPHLPAPI", .import = "ConvertInterfaceNameToLuidW", .signature = "\x00\x02\x11\x81\x01\x11\x05\x0f\x11\xb6\xb5" } },
    .{ "ConvertInterfaceLuidToNameA", MethodRecord{ .library = "IPHLPAPI", .import = "ConvertInterfaceLuidToNameA", .signature = "\x00\x03\x11\x81\x01\x0f\x11\xb6\xb5\x11\x3d\x19" } },
    .{ "ConvertInterfaceLuidToNameW", MethodRecord{ .library = "IPHLPAPI", .import = "ConvertInterfaceLuidToNameW", .signature = "\x00\x03\x11\x81\x01\x0f\x11\xb6\xb5\x11\x05\x19" } },
    .{ "ConvertInterfaceLuidToIndex", MethodRecord{ .library = "IPHLPAPI", .import = "ConvertInterfaceLuidToIndex", .signature = "\x00\x02\x11\x81\x01\x0f\x11\xb6\xb5\x0f\x09" } },
    .{ "ConvertInterfaceIndexToLuid", MethodRecord{ .library = "IPHLPAPI", .import = "ConvertInterfaceIndexToLuid", .signature = "\x00\x02\x11\x81\x01\x09\x0f\x11\xb6\xb5" } },
    .{ "ConvertInterfaceLuidToAlias", MethodRecord{ .library = "IPHLPAPI", .import = "ConvertInterfaceLuidToAlias", .signature = "\x00\x03\x11\x81\x01\x0f\x11\xb6\xb5\x11\x05\x19" } },
    .{ "ConvertInterfaceAliasToLuid", MethodRecord{ .library = "IPHLPAPI", .import = "ConvertInterfaceAliasToLuid", .signature = "\x00\x02\x11\x81\x01\x11\x05\x0f\x11\xb6\xb5" } },
    .{ "ConvertInterfaceLuidToGuid", MethodRecord{ .library = "IPHLPAPI", .import = "ConvertInterfaceLuidToGuid", .signature = "\x00\x02\x11\x81\x01\x0f\x11\xb6\xb5\x0f\x11\x0d" } },
    .{ "ConvertInterfaceGuidToLuid", MethodRecord{ .library = "IPHLPAPI", .import = "ConvertInterfaceGuidToLuid", .signature = "\x00\x02\x11\x81\x01\x0f\x11\x0d\x0f\x11\xb6\xb5" } },
    .{ "if_nametoindex", MethodRecord{ .library = "IPHLPAPI", .import = "if_nametoindex", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "if_indextoname", MethodRecord{ .library = "IPHLPAPI", .import = "if_indextoname", .signature = "\x00\x02\x11\x3d\x09\x11\x3d" } },
    .{ "GetCurrentThreadCompartmentId", MethodRecord{ .library = "IPHLPAPI", .import = "GetCurrentThreadCompartmentId", .signature = "\x00\x00\x11\xb7\x41" } },
    .{ "SetCurrentThreadCompartmentId", MethodRecord{ .library = "IPHLPAPI", .import = "SetCurrentThreadCompartmentId", .signature = "\x00\x01\x11\x81\x01\x11\xb7\x41" } },
    .{ "GetCurrentThreadCompartmentScope", MethodRecord{ .library = "IPHLPAPI", .import = "GetCurrentThreadCompartmentScope", .signature = "\x00\x02\x01\x0f\x09\x0f\x09" } },
    .{ "SetCurrentThreadCompartmentScope", MethodRecord{ .library = "IPHLPAPI", .import = "SetCurrentThreadCompartmentScope", .signature = "\x00\x01\x11\x81\x01\x09" } },
    .{ "GetJobCompartmentId", MethodRecord{ .library = "IPHLPAPI", .import = "GetJobCompartmentId", .signature = "\x00\x01\x11\xb7\x41\x11\x80\x85" } },
    .{ "SetJobCompartmentId", MethodRecord{ .library = "IPHLPAPI", .import = "SetJobCompartmentId", .signature = "\x00\x02\x11\x81\x01\x11\x80\x85\x11\xb7\x41" } },
    .{ "GetSessionCompartmentId", MethodRecord{ .library = "IPHLPAPI", .import = "GetSessionCompartmentId", .signature = "\x00\x01\x11\xb7\x41\x09" } },
    .{ "SetSessionCompartmentId", MethodRecord{ .library = "IPHLPAPI", .import = "SetSessionCompartmentId", .signature = "\x00\x02\x11\x81\x01\x09\x11\xb7\x41" } },
    .{ "GetDefaultCompartmentId", MethodRecord{ .library = "IPHLPAPI", .import = "GetDefaultCompartmentId", .signature = "\x00\x00\x11\xb7\x41" } },
    .{ "GetNetworkInformation", MethodRecord{ .library = "IPHLPAPI", .import = "GetNetworkInformation", .signature = "\x00\x05\x11\x81\x01\x0f\x11\x0d\x0f\x09\x0f\x09\x11\x05\x09" } },
    .{ "SetNetworkInformation", MethodRecord{ .library = "IPHLPAPI", .import = "SetNetworkInformation", .signature = "\x00\x03\x11\x81\x01\x0f\x11\x0d\x11\xb7\x41\x11\x05" } },
    .{ "ConvertLengthToIpv4Mask", MethodRecord{ .library = "IPHLPAPI", .import = "ConvertLengthToIpv4Mask", .signature = "\x00\x02\x11\x81\x01\x09\x0f\x09" } },
    .{ "ConvertIpv4MaskToLength", MethodRecord{ .library = "IPHLPAPI", .import = "ConvertIpv4MaskToLength", .signature = "\x00\x02\x11\x81\x01\x09\x0f\x05" } },
    .{ "GetDnsSettings", MethodRecord{ .library = "IPHLPAPI", .import = "GetDnsSettings", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x45" } },
    .{ "FreeDnsSettings", MethodRecord{ .library = "IPHLPAPI", .import = "FreeDnsSettings", .signature = "\x00\x01\x01\x0f\x11\xb7\x45" } },
    .{ "SetDnsSettings", MethodRecord{ .library = "IPHLPAPI", .import = "SetDnsSettings", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x45" } },
    .{ "GetInterfaceDnsSettings", MethodRecord{ .library = "IPHLPAPI", .import = "GetInterfaceDnsSettings", .signature = "\x00\x02\x11\x81\x01\x11\x0d\x0f\x11\xb7\x49" } },
    .{ "FreeInterfaceDnsSettings", MethodRecord{ .library = "IPHLPAPI", .import = "FreeInterfaceDnsSettings", .signature = "\x00\x01\x01\x0f\x11\xb7\x49" } },
    .{ "SetInterfaceDnsSettings", MethodRecord{ .library = "IPHLPAPI", .import = "SetInterfaceDnsSettings", .signature = "\x00\x02\x11\x81\x01\x11\x0d\x0f\x11\xb7\x49" } },
    .{ "GetNetworkConnectivityHint", MethodRecord{ .library = "IPHLPAPI", .import = "GetNetworkConnectivityHint", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xb7\x4d" } },
    .{ "GetNetworkConnectivityHintForInterface", MethodRecord{ .library = "IPHLPAPI", .import = "GetNetworkConnectivityHintForInterface", .signature = "\x00\x02\x11\x81\x01\x09\x0f\x11\xb7\x4d" } },
    .{ "NotifyNetworkConnectivityHintChange", MethodRecord{ .library = "IPHLPAPI", .import = "NotifyNetworkConnectivityHintChange", .signature = "\x00\x04\x11\x81\x01\x12\xb7\x51\x0f\x01\x11\x87\x79\x0f\x11\x80\x85" } },
    .{ "CreateFlVirtualInterface", MethodRecord{ .library = "IPHLPAPI", .import = "CreateFlVirtualInterface", .signature = "\x00\x01\x09\x0f\x11\xb7\x55" } },
    .{ "DeleteFlVirtualInterface", MethodRecord{ .library = "IPHLPAPI", .import = "DeleteFlVirtualInterface", .signature = "\x00\x01\x09\x0f\x11\xb7\x55" } },
    .{ "InitializeFlVirtualInterfaceEntry", MethodRecord{ .library = "IPHLPAPI", .import = "InitializeFlVirtualInterfaceEntry", .signature = "\x00\x01\x01\x0f\x11\xb7\x55" } },
    .{ "SetFlVirtualInterface", MethodRecord{ .library = "IPHLPAPI", .import = "SetFlVirtualInterface", .signature = "\x00\x01\x09\x0f\x11\xb7\x55" } },
    .{ "GetFlVirtualInterface", MethodRecord{ .library = "IPHLPAPI", .import = "GetFlVirtualInterface", .signature = "\x00\x01\x09\x0f\x11\xb7\x55" } },
    .{ "GetFlVirtualInterfaceTable", MethodRecord{ .library = "IPHLPAPI", .import = "GetFlVirtualInterfaceTable", .signature = "\x00\x02\x09\x11\x97\xe9\x0f\x0f\x11\xb7\x59" } },
    .{ "PfCreateInterface", MethodRecord{ .library = "IPHLPAPI", .import = "PfCreateInterface", .signature = "\x00\x06\x09\x09\x11\xb7\x5d\x11\xb7\x5d\x11\x59\x11\x59\x0f\x0f\x01" } },
    .{ "PfDeleteInterface", MethodRecord{ .library = "IPHLPAPI", .import = "PfDeleteInterface", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "PfAddFiltersToInterface", MethodRecord{ .library = "IPHLPAPI", .import = "PfAddFiltersToInterface", .signature = "\x00\x06\x09\x0f\x01\x09\x0f\x11\xb7\x61\x09\x0f\x11\xb7\x61\x0f\x0f\x01" } },
    .{ "PfRemoveFiltersFromInterface", MethodRecord{ .library = "IPHLPAPI", .import = "PfRemoveFiltersFromInterface", .signature = "\x00\x05\x09\x0f\x01\x09\x0f\x11\xb7\x61\x09\x0f\x11\xb7\x61" } },
    .{ "PfRemoveFilterHandles", MethodRecord{ .library = "IPHLPAPI", .import = "PfRemoveFilterHandles", .signature = "\x00\x03\x09\x0f\x01\x09\x0f\x0f\x01" } },
    .{ "PfUnBindInterface", MethodRecord{ .library = "IPHLPAPI", .import = "PfUnBindInterface", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "PfBindInterfaceToIndex", MethodRecord{ .library = "IPHLPAPI", .import = "PfBindInterfaceToIndex", .signature = "\x00\x04\x09\x0f\x01\x09\x11\xb7\x65\x0f\x05" } },
    .{ "PfBindInterfaceToIPAddress", MethodRecord{ .library = "IPHLPAPI", .import = "PfBindInterfaceToIPAddress", .signature = "\x00\x03\x09\x0f\x01\x11\xb7\x65\x0f\x05" } },
    .{ "PfRebindFilters", MethodRecord{ .library = "IPHLPAPI", .import = "PfRebindFilters", .signature = "\x00\x02\x09\x0f\x01\x0f\x11\xb7\x69" } },
    .{ "PfAddGlobalFilterToInterface", MethodRecord{ .library = "IPHLPAPI", .import = "PfAddGlobalFilterToInterface", .signature = "\x00\x02\x09\x0f\x01\x11\xb7\x6d" } },
    .{ "PfRemoveGlobalFilterFromInterface", MethodRecord{ .library = "IPHLPAPI", .import = "PfRemoveGlobalFilterFromInterface", .signature = "\x00\x02\x09\x0f\x01\x11\xb7\x6d" } },
    .{ "PfMakeLog", MethodRecord{ .library = "IPHLPAPI", .import = "PfMakeLog", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "PfSetLogBuffer", MethodRecord{ .library = "IPHLPAPI", .import = "PfSetLogBuffer", .signature = "\x00\x07\x09\x0f\x05\x09\x09\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "PfDeleteLog", MethodRecord{ .library = "IPHLPAPI", .import = "PfDeleteLog", .signature = "\x00\x00\x09" } },
    .{ "PfGetInterfaceStatistics", MethodRecord{ .library = "IPHLPAPI", .import = "PfGetInterfaceStatistics", .signature = "\x00\x04\x09\x0f\x01\x0f\x11\xb7\x71\x0f\x09\x11\x59" } },
    .{ "PfTestPacket", MethodRecord{ .library = "IPHLPAPI", .import = "PfTestPacket", .signature = "\x00\x05\x09\x0f\x01\x0f\x01\x09\x0f\x05\x0f\x11\xb7\x5d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0xbed => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED" },
        0x17e9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "ADDRESS_FAMILY" },
        0x1809 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "GET_ADAPTERS_ADDRESSES_FLAGS" },
        0x3371 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKADDR" },
        0x3611 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "IP_OPTION_INFORMATION" },
        0x3615 => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "PIO_APC_ROUTINE" },
        0x3619 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKADDR_IN6" },
        0x361d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IFROW" },
        0x3621 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IFTABLE" },
        0x3625 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPADDRTABLE" },
        0x3629 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPNETTABLE" },
        0x362d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPFORWARDTABLE" },
        0x3631 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_TCPTABLE" },
        0x3635 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "TCP_TABLE_CLASS" },
        0x3639 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_TCPROW_OWNER_MODULE" },
        0x363d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "TCPIP_OWNER_MODULE_INFO_CLASS" },
        0x3641 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_UDPTABLE" },
        0x3645 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "UDP_TABLE_CLASS" },
        0x3649 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_UDPROW_OWNER_MODULE" },
        0x364d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_TCPTABLE2" },
        0x3651 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_TCP6TABLE" },
        0x3655 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_TCP6TABLE2" },
        0x3659 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_TCPROW_LH" },
        0x365d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "TCP_ESTATS_TYPE" },
        0x3661 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_TCP6ROW" },
        0x3665 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_TCP6ROW_OWNER_MODULE" },
        0x3669 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_UDP6TABLE" },
        0x366d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_UDP6ROW_OWNER_MODULE" },
        0x3671 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPSTATS_LH" },
        0x3675 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_ICMP" },
        0x3679 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_TCPSTATS_LH" },
        0x367d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_UDPSTATS" },
        0x3681 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_ICMP_EX_XPSP1" },
        0x3685 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_TCPSTATS2" },
        0x3689 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_UDPSTATS2" },
        0x368d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPFORWARDROW" },
        0x3691 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPNETROW_LH" },
        0x3695 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "IP_INTERFACE_INFO" },
        0x3699 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "IP_UNIDIRECTIONAL_ADAPTER_ADDRESS" },
        0x369d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "IP_INTERFACE_NAME_INFO_W2KSP1" },
        0x36a1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "FIXED_INFO_W2KSP1" },
        0x36a5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "IP_ADAPTER_INFO" },
        0x36a9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "IP_ADAPTER_ORDER_MAP" },
        0x36ad => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "IP_ADAPTER_ADDRESSES_LH" },
        0x36b1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "IP_PER_ADAPTER_INFO_W2KSP1" },
        0x36b5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Ndis", .name = "NET_LUID_LH" },
        0x36b9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "INTERFACE_TIMESTAMP_CAPABILITIES" },
        0x36bd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "INTERFACE_HARDWARE_CROSSTIMESTAMP" },
        0x36c1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK" },
        0x36c5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "HIFTIMESTAMPCHANGE" },
        0x36c9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "IP_ADAPTER_INDEX_MAP" },
        0x36cd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "NET_ADDRESS_INFO" },
        0x36d1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IF_ROW2" },
        0x36d5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IF_ENTRY_LEVEL" },
        0x36d9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IF_TABLE2" },
        0x36dd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IF_TABLE_LEVEL" },
        0x36e1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IFSTACK_TABLE" },
        0x36e5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_INVERTEDIFSTACK_TABLE" },
        0x36e9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPINTERFACE_ROW" },
        0x36ed => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPINTERFACE_TABLE" },
        0x36f1 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "PIPINTERFACE_CHANGE_CALLBACK" },
        0x36f5 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES" },
        0x36f9 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_UNICASTIPADDRESS_ROW" },
        0x36fd => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_UNICASTIPADDRESS_TABLE" },
        0x3701 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "PUNICAST_IPADDRESS_CHANGE_CALLBACK" },
        0x3705 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK" },
        0x3709 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_ANYCASTIPADDRESS_ROW" },
        0x370d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_ANYCASTIPADDRESS_TABLE" },
        0x3711 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_MULTICASTIPADDRESS_ROW" },
        0x3715 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_MULTICASTIPADDRESS_TABLE" },
        0x3719 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPFORWARD_ROW2" },
        0x371d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKADDR_INET" },
        0x3721 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPFORWARD_TABLE2" },
        0x3725 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "PIPFORWARD_CHANGE_CALLBACK" },
        0x3729 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPPATH_ROW" },
        0x372d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPPATH_TABLE" },
        0x3731 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPNET_ROW2" },
        0x3735 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_IPNET_TABLE2" },
        0x3739 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "PTEREDO_PORT_CHANGE_CALLBACK" },
        0x373d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKADDR_IN6_PAIR" },
        0x3741 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Ndis", .name = "NET_IF_COMPARTMENT_ID" },
        0x3745 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "DNS_SETTINGS" },
        0x3749 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "DNS_INTERFACE_SETTINGS" },
        0x374d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "NL_NETWORK_CONNECTIVITY_HINT" },
        0x3751 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK" },
        0x3755 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_FL_VIRTUAL_INTERFACE_ROW" },
        0x3759 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "MIB_FL_VIRTUAL_INTERFACE_TABLE" },
        0x375d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "PFFORWARD_ACTION" },
        0x3761 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "PF_FILTER_DESCRIPTOR" },
        0x3765 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "PFADDRESSTYPE" },
        0x3769 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "PF_LATEBIND_INFO" },
        0x376d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "GLOBAL_FILTER" },
        0x3771 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.IpHelper", .name = "PF_INTERFACE_STATS" },
        else => null,
    };
}

pub const GAA_FLAG_SKIP_UNICAST = 1;
pub const GAA_FLAG_SKIP_ANYCAST = 2;
pub const GAA_FLAG_SKIP_MULTICAST = 4;
pub const GAA_FLAG_SKIP_DNS_SERVER = 8;
pub const GAA_FLAG_INCLUDE_PREFIX = 16;
pub const GAA_FLAG_SKIP_FRIENDLY_NAME = 32;
pub const GAA_FLAG_INCLUDE_WINS_INFO = 64;
pub const GAA_FLAG_INCLUDE_GATEWAYS = 128;
pub const GAA_FLAG_INCLUDE_ALL_INTERFACES = 256;
pub const GAA_FLAG_INCLUDE_ALL_COMPARTMENTS = 512;
pub const GAA_FLAG_INCLUDE_TUNNEL_BINDINGORDER = 1024;
pub const ANY_SIZE = 1;
pub const MAXLEN_PHYSADDR = 8;
pub const MAXLEN_IFDESCR = 256;
pub const MAX_INTERFACE_NAME_LEN = 256;
pub const MIN_IF_TYPE = 1;
pub const IF_TYPE_OTHER = 1;
pub const IF_TYPE_REGULAR_1822 = 2;
pub const IF_TYPE_HDH_1822 = 3;
pub const IF_TYPE_DDN_X25 = 4;
pub const IF_TYPE_RFC877_X25 = 5;
pub const IF_TYPE_ETHERNET_CSMACD = 6;
pub const IF_TYPE_IS088023_CSMACD = 7;
pub const IF_TYPE_ISO88024_TOKENBUS = 8;
pub const IF_TYPE_ISO88025_TOKENRING = 9;
pub const IF_TYPE_ISO88026_MAN = 10;
pub const IF_TYPE_STARLAN = 11;
pub const IF_TYPE_PROTEON_10MBIT = 12;
pub const IF_TYPE_PROTEON_80MBIT = 13;
pub const IF_TYPE_HYPERCHANNEL = 14;
pub const IF_TYPE_FDDI = 15;
pub const IF_TYPE_LAP_B = 16;
pub const IF_TYPE_SDLC = 17;
pub const IF_TYPE_DS1 = 18;
pub const IF_TYPE_E1 = 19;
pub const IF_TYPE_BASIC_ISDN = 20;
pub const IF_TYPE_PRIMARY_ISDN = 21;
pub const IF_TYPE_PROP_POINT2POINT_SERIAL = 22;
pub const IF_TYPE_PPP = 23;
pub const IF_TYPE_SOFTWARE_LOOPBACK = 24;
pub const IF_TYPE_EON = 25;
pub const IF_TYPE_ETHERNET_3MBIT = 26;
pub const IF_TYPE_NSIP = 27;
pub const IF_TYPE_SLIP = 28;
pub const IF_TYPE_ULTRA = 29;
pub const IF_TYPE_DS3 = 30;
pub const IF_TYPE_SIP = 31;
pub const IF_TYPE_FRAMERELAY = 32;
pub const IF_TYPE_RS232 = 33;
pub const IF_TYPE_PARA = 34;
pub const IF_TYPE_ARCNET = 35;
pub const IF_TYPE_ARCNET_PLUS = 36;
pub const IF_TYPE_ATM = 37;
pub const IF_TYPE_MIO_X25 = 38;
pub const IF_TYPE_SONET = 39;
pub const IF_TYPE_X25_PLE = 40;
pub const IF_TYPE_ISO88022_LLC = 41;
pub const IF_TYPE_LOCALTALK = 42;
pub const IF_TYPE_SMDS_DXI = 43;
pub const IF_TYPE_FRAMERELAY_SERVICE = 44;
pub const IF_TYPE_V35 = 45;
pub const IF_TYPE_HSSI = 46;
pub const IF_TYPE_HIPPI = 47;
pub const IF_TYPE_MODEM = 48;
pub const IF_TYPE_AAL5 = 49;
pub const IF_TYPE_SONET_PATH = 50;
pub const IF_TYPE_SONET_VT = 51;
pub const IF_TYPE_SMDS_ICIP = 52;
pub const IF_TYPE_PROP_VIRTUAL = 53;
pub const IF_TYPE_PROP_MULTIPLEXOR = 54;
pub const IF_TYPE_IEEE80212 = 55;
pub const IF_TYPE_FIBRECHANNEL = 56;
pub const IF_TYPE_HIPPIINTERFACE = 57;
pub const IF_TYPE_FRAMERELAY_INTERCONNECT = 58;
pub const IF_TYPE_AFLANE_8023 = 59;
pub const IF_TYPE_AFLANE_8025 = 60;
pub const IF_TYPE_CCTEMUL = 61;
pub const IF_TYPE_FASTETHER = 62;
pub const IF_TYPE_ISDN = 63;
pub const IF_TYPE_V11 = 64;
pub const IF_TYPE_V36 = 65;
pub const IF_TYPE_G703_64K = 66;
pub const IF_TYPE_G703_2MB = 67;
pub const IF_TYPE_QLLC = 68;
pub const IF_TYPE_FASTETHER_FX = 69;
pub const IF_TYPE_CHANNEL = 70;
pub const IF_TYPE_IEEE80211 = 71;
pub const IF_TYPE_IBM370PARCHAN = 72;
pub const IF_TYPE_ESCON = 73;
pub const IF_TYPE_DLSW = 74;
pub const IF_TYPE_ISDN_S = 75;
pub const IF_TYPE_ISDN_U = 76;
pub const IF_TYPE_LAP_D = 77;
pub const IF_TYPE_IPSWITCH = 78;
pub const IF_TYPE_RSRB = 79;
pub const IF_TYPE_ATM_LOGICAL = 80;
pub const IF_TYPE_DS0 = 81;
pub const IF_TYPE_DS0_BUNDLE = 82;
pub const IF_TYPE_BSC = 83;
pub const IF_TYPE_ASYNC = 84;
pub const IF_TYPE_CNR = 85;
pub const IF_TYPE_ISO88025R_DTR = 86;
pub const IF_TYPE_EPLRS = 87;
pub const IF_TYPE_ARAP = 88;
pub const IF_TYPE_PROP_CNLS = 89;
pub const IF_TYPE_HOSTPAD = 90;
pub const IF_TYPE_TERMPAD = 91;
pub const IF_TYPE_FRAMERELAY_MPI = 92;
pub const IF_TYPE_X213 = 93;
pub const IF_TYPE_ADSL = 94;
pub const IF_TYPE_RADSL = 95;
pub const IF_TYPE_SDSL = 96;
pub const IF_TYPE_VDSL = 97;
pub const IF_TYPE_ISO88025_CRFPRINT = 98;
pub const IF_TYPE_MYRINET = 99;
pub const IF_TYPE_VOICE_EM = 100;
pub const IF_TYPE_VOICE_FXO = 101;
pub const IF_TYPE_VOICE_FXS = 102;
pub const IF_TYPE_VOICE_ENCAP = 103;
pub const IF_TYPE_VOICE_OVERIP = 104;
pub const IF_TYPE_ATM_DXI = 105;
pub const IF_TYPE_ATM_FUNI = 106;
pub const IF_TYPE_ATM_IMA = 107;
pub const IF_TYPE_PPPMULTILINKBUNDLE = 108;
pub const IF_TYPE_IPOVER_CDLC = 109;
pub const IF_TYPE_IPOVER_CLAW = 110;
pub const IF_TYPE_STACKTOSTACK = 111;
pub const IF_TYPE_VIRTUALIPADDRESS = 112;
pub const IF_TYPE_MPC = 113;
pub const IF_TYPE_IPOVER_ATM = 114;
pub const IF_TYPE_ISO88025_FIBER = 115;
pub const IF_TYPE_TDLC = 116;
pub const IF_TYPE_GIGABITETHERNET = 117;
pub const IF_TYPE_HDLC = 118;
pub const IF_TYPE_LAP_F = 119;
pub const IF_TYPE_V37 = 120;
pub const IF_TYPE_X25_MLP = 121;
pub const IF_TYPE_X25_HUNTGROUP = 122;
pub const IF_TYPE_TRANSPHDLC = 123;
pub const IF_TYPE_INTERLEAVE = 124;
pub const IF_TYPE_FAST = 125;
pub const IF_TYPE_IP = 126;
pub const IF_TYPE_DOCSCABLE_MACLAYER = 127;
pub const IF_TYPE_DOCSCABLE_DOWNSTREAM = 128;
pub const IF_TYPE_DOCSCABLE_UPSTREAM = 129;
pub const IF_TYPE_A12MPPSWITCH = 130;
pub const IF_TYPE_TUNNEL = 131;
pub const IF_TYPE_COFFEE = 132;
pub const IF_TYPE_CES = 133;
pub const IF_TYPE_ATM_SUBINTERFACE = 134;
pub const IF_TYPE_L2_VLAN = 135;
pub const IF_TYPE_L3_IPVLAN = 136;
pub const IF_TYPE_L3_IPXVLAN = 137;
pub const IF_TYPE_DIGITALPOWERLINE = 138;
pub const IF_TYPE_MEDIAMAILOVERIP = 139;
pub const IF_TYPE_DTM = 140;
pub const IF_TYPE_DCN = 141;
pub const IF_TYPE_IPFORWARD = 142;
pub const IF_TYPE_MSDSL = 143;
pub const IF_TYPE_IEEE1394 = 144;
pub const IF_TYPE_IF_GSN = 145;
pub const IF_TYPE_DVBRCC_MACLAYER = 146;
pub const IF_TYPE_DVBRCC_DOWNSTREAM = 147;
pub const IF_TYPE_DVBRCC_UPSTREAM = 148;
pub const IF_TYPE_ATM_VIRTUAL = 149;
pub const IF_TYPE_MPLS_TUNNEL = 150;
pub const IF_TYPE_SRP = 151;
pub const IF_TYPE_VOICEOVERATM = 152;
pub const IF_TYPE_VOICEOVERFRAMERELAY = 153;
pub const IF_TYPE_IDSL = 154;
pub const IF_TYPE_COMPOSITELINK = 155;
pub const IF_TYPE_SS7_SIGLINK = 156;
pub const IF_TYPE_PROP_WIRELESS_P2P = 157;
pub const IF_TYPE_FR_FORWARD = 158;
pub const IF_TYPE_RFC1483 = 159;
pub const IF_TYPE_USB = 160;
pub const IF_TYPE_IEEE8023AD_LAG = 161;
pub const IF_TYPE_BGP_POLICY_ACCOUNTING = 162;
pub const IF_TYPE_FRF16_MFR_BUNDLE = 163;
pub const IF_TYPE_H323_GATEKEEPER = 164;
pub const IF_TYPE_H323_PROXY = 165;
pub const IF_TYPE_MPLS = 166;
pub const IF_TYPE_MF_SIGLINK = 167;
pub const IF_TYPE_HDSL2 = 168;
pub const IF_TYPE_SHDSL = 169;
pub const IF_TYPE_DS1_FDL = 170;
pub const IF_TYPE_POS = 171;
pub const IF_TYPE_DVB_ASI_IN = 172;
pub const IF_TYPE_DVB_ASI_OUT = 173;
pub const IF_TYPE_PLC = 174;
pub const IF_TYPE_NFAS = 175;
pub const IF_TYPE_TR008 = 176;
pub const IF_TYPE_GR303_RDT = 177;
pub const IF_TYPE_GR303_IDT = 178;
pub const IF_TYPE_ISUP = 179;
pub const IF_TYPE_PROP_DOCS_WIRELESS_MACLAYER = 180;
pub const IF_TYPE_PROP_DOCS_WIRELESS_DOWNSTREAM = 181;
pub const IF_TYPE_PROP_DOCS_WIRELESS_UPSTREAM = 182;
pub const IF_TYPE_HIPERLAN2 = 183;
pub const IF_TYPE_PROP_BWA_P2MP = 184;
pub const IF_TYPE_SONET_OVERHEAD_CHANNEL = 185;
pub const IF_TYPE_DIGITAL_WRAPPER_OVERHEAD_CHANNEL = 186;
pub const IF_TYPE_AAL2 = 187;
pub const IF_TYPE_RADIO_MAC = 188;
pub const IF_TYPE_ATM_RADIO = 189;
pub const IF_TYPE_IMT = 190;
pub const IF_TYPE_MVL = 191;
pub const IF_TYPE_REACH_DSL = 192;
pub const IF_TYPE_FR_DLCI_ENDPT = 193;
pub const IF_TYPE_ATM_VCI_ENDPT = 194;
pub const IF_TYPE_OPTICAL_CHANNEL = 195;
pub const IF_TYPE_OPTICAL_TRANSPORT = 196;
pub const IF_TYPE_IEEE80216_WMAN = 237;
pub const IF_TYPE_WWANPP = 243;
pub const IF_TYPE_WWANPP2 = 244;
pub const IF_TYPE_IEEE802154 = 259;
pub const IF_TYPE_XBOX_WIRELESS = 281;
pub const MAX_IF_TYPE = 281;
pub const IF_CHECK_NONE = 0;
pub const IF_CHECK_MCAST = 1;
pub const IF_CHECK_SEND = 2;
pub const IF_CONNECTION_DEDICATED = 1;
pub const IF_CONNECTION_PASSIVE = 2;
pub const IF_CONNECTION_DEMAND = 3;
pub const IF_ADMIN_STATUS_UP = 1;
pub const IF_ADMIN_STATUS_DOWN = 2;
pub const IF_ADMIN_STATUS_TESTING = 3;
pub const MIB_IF_TYPE_OTHER = 1;
pub const MIB_IF_TYPE_ETHERNET = 6;
pub const MIB_IF_TYPE_TOKENRING = 9;
pub const MIB_IF_TYPE_FDDI = 15;
pub const MIB_IF_TYPE_PPP = 23;
pub const MIB_IF_TYPE_LOOPBACK = 24;
pub const MIB_IF_TYPE_SLIP = 28;
pub const MIB_IF_ADMIN_STATUS_UP = 1;
pub const MIB_IF_ADMIN_STATUS_DOWN = 2;
pub const MIB_IF_ADMIN_STATUS_TESTING = 3;
pub const MIB_IPADDR_PRIMARY = 1;
pub const MIB_IPADDR_DYNAMIC = 4;
pub const MIB_IPADDR_DISCONNECTED = 8;
pub const MIB_IPADDR_DELETED = 64;
pub const MIB_IPADDR_TRANSIENT = 128;
pub const MIB_IPADDR_DNS_ELIGIBLE = 256;
pub const MIB_IPROUTE_METRIC_UNUSED = 4294967295;
pub const MIB_USE_CURRENT_TTL = 4294967295;
pub const MIB_USE_CURRENT_FORWARDING = 4294967295;
pub const ICMP6_INFOMSG_MASK = 128;
pub const IPRTRMGR_PID = 10000;
pub const IF_NUMBER = 0;
pub const IF_TABLE = 1;
pub const IF_ROW = 2;
pub const IP_STATS = 3;
pub const IP_ADDRTABLE = 4;
pub const IP_ADDRROW = 5;
pub const IP_FORWARDNUMBER = 6;
pub const IP_FORWARDTABLE = 7;
pub const IP_FORWARDROW = 8;
pub const IP_NETTABLE = 9;
pub const IP_NETROW = 10;
pub const ICMP_STATS = 11;
pub const TCP_STATS = 12;
pub const TCP_TABLE = 13;
pub const TCP_ROW = 14;
pub const UDP_STATS = 15;
pub const UDP_TABLE = 16;
pub const UDP_ROW = 17;
pub const MCAST_MFE = 18;
pub const MCAST_MFE_STATS = 19;
pub const BEST_IF = 20;
pub const BEST_ROUTE = 21;
pub const PROXY_ARP = 22;
pub const MCAST_IF_ENTRY = 23;
pub const MCAST_GLOBAL = 24;
pub const IF_STATUS = 25;
pub const MCAST_BOUNDARY = 26;
pub const MCAST_SCOPE = 27;
pub const DEST_MATCHING = 28;
pub const DEST_LONGER = 29;
pub const DEST_SHORTER = 30;
pub const ROUTE_MATCHING = 31;
pub const ROUTE_LONGER = 32;
pub const ROUTE_SHORTER = 33;
pub const ROUTE_STATE = 34;
pub const MCAST_MFE_STATS_EX = 35;
pub const IP6_STATS = 36;
pub const UDP6_STATS = 37;
pub const TCP6_STATS = 38;
pub const NUMBER_OF_EXPORTED_VARIABLES = 39;
pub const MAX_SCOPE_NAME_LEN = 255;
pub const MAX_MIB_OFFSET = 8;
pub const MIB_INVALID_TEREDO_PORT_NUMBER = 0;
pub const DNS_SETTINGS_VERSION1 = 1;
pub const DNS_SETTINGS_VERSION2 = 2;
pub const DNS_INTERFACE_SETTINGS_VERSION1 = 1;
pub const DNS_INTERFACE_SETTINGS_VERSION2 = 2;
pub const DNS_INTERFACE_SETTINGS_VERSION3 = 3;
pub const DNS_INTERFACE_SETTINGS_VERSION4 = 4;
pub const DNS_SETTING_IPV6 = 1;
pub const DNS_SETTING_NAMESERVER = 2;
pub const DNS_SETTING_SEARCHLIST = 4;
pub const DNS_SETTING_REGISTRATION_ENABLED = 8;
pub const DNS_SETTING_REGISTER_ADAPTER_NAME = 16;
pub const DNS_SETTING_DOMAIN = 32;
pub const DNS_SETTING_HOSTNAME = 64;
pub const DNS_SETTINGS_ENABLE_LLMNR = 128;
pub const DNS_SETTINGS_QUERY_ADAPTER_NAME = 256;
pub const DNS_SETTING_PROFILE_NAMESERVER = 512;
pub const DNS_SETTING_DISABLE_UNCONSTRAINED_QUERIES = 1024;
pub const DNS_SETTING_SUPPLEMENTAL_SEARCH_LIST = 2048;
pub const DNS_SETTING_DOH = 4096;
pub const DNS_SETTING_DOH_PROFILE = 8192;
pub const DNS_SETTING_ENCRYPTED_DNS_ADAPTER_FLAGS = 16384;
pub const DNS_SETTING_DDR = 32768;
pub const DNS_SETTING_DOT = 65536;
pub const DNS_SETTING_DOT_PROFILE = 131072;
pub const DNS_ENABLE_DOH = 1;
pub const DNS_DOH_POLICY_NOT_CONFIGURED = 4;
pub const DNS_DOH_POLICY_DISABLE = 8;
pub const DNS_DOH_POLICY_AUTO = 16;
pub const DNS_DOH_POLICY_REQUIRED = 32;
pub const DNS_ENCRYPTION_POLICY_NOT_CONFIGURED = 4;
pub const DNS_ENCRYPTION_POLICY_DISABLE = 8;
pub const DNS_ENCRYPTION_POLICY_AUTO = 16;
pub const DNS_ENCRYPTION_POLICY_REQUIRED = 32;
pub const DNS_ENABLE_DDR = 64;
pub const DNS_ENABLE_DOT = 128;
pub const DNS_DOT_POLICY_BLOCK = 256;
pub const DNS_DOH_POLICY_BLOCK = 512;
pub const DNS_ENABLE_DNR = 1024;
pub const DNS_SERVER_PROPERTY_VERSION1 = 1;
pub const DNS_DOH_SERVER_SETTINGS_ENABLE_AUTO = 1;
pub const DNS_DOH_SERVER_SETTINGS_ENABLE = 2;
pub const DNS_DOH_SERVER_SETTINGS_FALLBACK_TO_UDP = 4;
pub const DNS_DOH_AUTO_UPGRADE_SERVER = 8;
pub const DNS_DOH_SERVER_SETTINGS_ENABLE_DDR = 16;
pub const DNS_DOH_SERVER_SETTINGS_MAKE_DDR_NON_BLOCKING = 32;
pub const DNS_DOT_SERVER_SETTINGS_ENABLE = 1;
pub const DNS_DOT_SERVER_SETTINGS_FALLBACK_TO_UDP = 2;
pub const DNS_DOT_AUTO_UPGRADE_SERVER = 4;
pub const DNS_DOT_SERVER_SETTINGS_ENABLE_AUTO = 8;
pub const DNS_DOT_SERVER_SETTINGS_ENABLE_DDR = 16;
pub const DNS_DOT_SERVER_SETTINGS_MAKE_DDR_NON_BLOCKING = 32;
pub const DNS_DDR_ADAPTER_ENABLE_DOH = 1;
pub const DNS_DDR_ADAPTER_ENABLE = 1;
pub const DNS_DDR_ADAPTER_ENABLE_UDP_FALLBACK = 2;
pub const DNS_DDR_ADAPTER_MAKE_DDR_NON_BLOCKING = 4;
pub const TCPIP_OWNING_MODULE_SIZE = 16;
pub const FILTER_ICMP_TYPE_ANY = 255;
pub const FILTER_ICMP_CODE_ANY = 255;
pub const FD_FLAGS_NOSYN = 1;
pub const FD_FLAGS_ALLFLAGS = 1;
pub const LB_SRC_ADDR_USE_SRCADDR_FLAG = 1;
pub const LB_SRC_ADDR_USE_DSTADDR_FLAG = 2;
pub const LB_DST_ADDR_USE_SRCADDR_FLAG = 4;
pub const LB_DST_ADDR_USE_DSTADDR_FLAG = 8;
pub const LB_SRC_MASK_LATE_FLAG = 16;
pub const LB_DST_MASK_LATE_FLAG = 32;
pub const ERROR_BASE = 23000;
pub const PFERROR_NO_PF_INTERFACE = 23000;
pub const PFERROR_NO_FILTERS_GIVEN = 23001;
pub const PFERROR_BUFFER_TOO_SMALL = 23002;
pub const ERROR_IPV6_NOT_IMPLEMENTED = 23003;
pub const IP_EXPORT_INCLUDED = 1;
pub const MAX_ADAPTER_NAME = 128;
pub const IP_STATUS_BASE = 11000;
pub const IP_SUCCESS = 0;
pub const IP_BUF_TOO_SMALL = 11001;
pub const IP_DEST_NET_UNREACHABLE = 11002;
pub const IP_DEST_HOST_UNREACHABLE = 11003;
pub const IP_DEST_PROT_UNREACHABLE = 11004;
pub const IP_DEST_PORT_UNREACHABLE = 11005;
pub const IP_NO_RESOURCES = 11006;
pub const IP_BAD_OPTION = 11007;
pub const IP_HW_ERROR = 11008;
pub const IP_PACKET_TOO_BIG = 11009;
pub const IP_REQ_TIMED_OUT = 11010;
pub const IP_BAD_REQ = 11011;
pub const IP_BAD_ROUTE = 11012;
pub const IP_TTL_EXPIRED_TRANSIT = 11013;
pub const IP_TTL_EXPIRED_REASSEM = 11014;
pub const IP_PARAM_PROBLEM = 11015;
pub const IP_SOURCE_QUENCH = 11016;
pub const IP_OPTION_TOO_BIG = 11017;
pub const IP_BAD_DESTINATION = 11018;
pub const IP_DEST_NO_ROUTE = 11002;
pub const IP_DEST_ADDR_UNREACHABLE = 11003;
pub const IP_DEST_PROHIBITED = 11004;
pub const IP_HOP_LIMIT_EXCEEDED = 11013;
pub const IP_REASSEMBLY_TIME_EXCEEDED = 11014;
pub const IP_PARAMETER_PROBLEM = 11015;
pub const IP_DEST_UNREACHABLE = 11040;
pub const IP_TIME_EXCEEDED = 11041;
pub const IP_BAD_HEADER = 11042;
pub const IP_UNRECOGNIZED_NEXT_HEADER = 11043;
pub const IP_ICMP_ERROR = 11044;
pub const IP_DEST_SCOPE_MISMATCH = 11045;
pub const IP_ADDR_DELETED = 11019;
pub const IP_SPEC_MTU_CHANGE = 11020;
pub const IP_MTU_CHANGE = 11021;
pub const IP_UNLOAD = 11022;
pub const IP_ADDR_ADDED = 11023;
pub const IP_MEDIA_CONNECT = 11024;
pub const IP_MEDIA_DISCONNECT = 11025;
pub const IP_BIND_ADAPTER = 11026;
pub const IP_UNBIND_ADAPTER = 11027;
pub const IP_DEVICE_DOES_NOT_EXIST = 11028;
pub const IP_DUPLICATE_ADDRESS = 11029;
pub const IP_INTERFACE_METRIC_CHANGE = 11030;
pub const IP_RECONFIG_SECFLTR = 11031;
pub const IP_NEGOTIATING_IPSEC = 11032;
pub const IP_INTERFACE_WOL_CAPABILITY_CHANGE = 11033;
pub const IP_DUPLICATE_IPADD = 11034;
pub const IP_GENERAL_FAILURE = 11050;
pub const MAX_IP_STATUS = 11050;
pub const IP_PENDING = 11255;
pub const IP_FLAG_REVERSE = 1;
pub const IP_FLAG_DF = 2;
pub const MAX_OPT_SIZE = 40;
pub const IOCTL_IP_RTCHANGE_NOTIFY_REQUEST = 101;
pub const IOCTL_IP_ADDCHANGE_NOTIFY_REQUEST = 102;
pub const IOCTL_ARP_SEND_REQUEST = 103;
pub const IOCTL_IP_INTERFACE_INFO = 104;
pub const IOCTL_IP_GET_BEST_INTERFACE = 105;
pub const IOCTL_IP_UNIDIRECTIONAL_ADAPTER_ADDRESS = 106;
pub const INTERFACE_TIMESTAMP_CAPABILITIES_VERSION_1 = 1;
pub const INTERFACE_HARDWARE_CROSSTIMESTAMP_VERSION_1 = 1;
pub const NET_STRING_IPV4_ADDRESS = 1;
pub const NET_STRING_IPV4_SERVICE = 2;
pub const NET_STRING_IPV4_NETWORK = 4;
pub const NET_STRING_IPV6_ADDRESS = 8;
pub const NET_STRING_IPV6_ADDRESS_NO_SCOPE = 16;
pub const NET_STRING_IPV6_SERVICE = 32;
pub const NET_STRING_IPV6_SERVICE_NO_SCOPE = 64;
pub const NET_STRING_IPV6_NETWORK = 128;
pub const NET_STRING_NAMED_ADDRESS = 256;
pub const NET_STRING_NAMED_SERVICE = 512;
pub const MAX_ADAPTER_DESCRIPTION_LENGTH = 128;
pub const MAX_ADAPTER_NAME_LENGTH = 256;
pub const MAX_ADAPTER_ADDRESS_LENGTH = 8;
pub const DEFAULT_MINIMUM_ENTITIES = 32;
pub const MAX_HOSTNAME_LEN = 128;
pub const MAX_DOMAIN_NAME_LEN = 128;
pub const MAX_SCOPE_ID_LEN = 256;
pub const MAX_DHCPV6_DUID_LENGTH = 130;
pub const MAX_DNS_SUFFIX_STRING_LENGTH = 256;
pub const BROADCAST_NODETYPE = 1;
pub const PEER_TO_PEER_NODETYPE = 2;
pub const MIXED_NODETYPE = 4;
pub const HYBRID_NODETYPE = 8;
pub const IP_ADAPTER_ADDRESS_DNS_ELIGIBLE = 1;
pub const IP_ADAPTER_ADDRESS_TRANSIENT = 2;
pub const IP_ADAPTER_DDNS_ENABLED = 1;
pub const IP_ADAPTER_REGISTER_ADAPTER_SUFFIX = 2;
pub const IP_ADAPTER_DHCP_ENABLED = 4;
pub const IP_ADAPTER_RECEIVE_ONLY = 8;
pub const IP_ADAPTER_NO_MULTICAST = 16;
pub const IP_ADAPTER_IPV6_OTHER_STATEFUL_CONFIG = 32;
pub const IP_ADAPTER_NETBIOS_OVER_TCPIP_ENABLED = 64;
pub const IP_ADAPTER_IPV4_ENABLED = 128;
pub const IP_ADAPTER_IPV6_ENABLED = 256;
pub const IP_ADAPTER_IPV6_MANAGE_ADDRESS_CONFIG = 512;
pub const GAA_FLAG_SKIP_DNS_INFO = 2048;
pub const IP_ROUTER_MANAGER_VERSION = 1;
pub const IP_GENERAL_INFO_BASE = 4294901760;
pub const IP_IN_FILTER_INFO = 4294901761;
pub const IP_OUT_FILTER_INFO = 4294901762;
pub const IP_GLOBAL_INFO = 4294901763;
pub const IP_INTERFACE_STATUS_INFO = 4294901764;
pub const IP_ROUTE_INFO = 4294901765;
pub const IP_PROT_PRIORITY_INFO = 4294901766;
pub const IP_ROUTER_DISC_INFO = 4294901767;
pub const IP_DEMAND_DIAL_FILTER_INFO = 4294901769;
pub const IP_MCAST_HEARBEAT_INFO = 4294901770;
pub const IP_MCAST_BOUNDARY_INFO = 4294901771;
pub const IP_IPINIP_CFG_INFO = 4294901772;
pub const IP_IFFILTER_INFO = 4294901773;
pub const IP_MCAST_LIMIT_INFO = 4294901774;
pub const IPV6_GLOBAL_INFO = 4294901775;
pub const IPV6_ROUTE_INFO = 4294901776;
pub const IP_IN_FILTER_INFO_V6 = 4294901777;
pub const IP_OUT_FILTER_INFO_V6 = 4294901778;
pub const IP_DEMAND_DIAL_FILTER_INFO_V6 = 4294901779;
pub const IP_IFFILTER_INFO_V6 = 4294901780;
pub const IP_FILTER_ENABLE_INFO = 4294901781;
pub const IP_FILTER_ENABLE_INFO_V6 = 4294901782;
pub const IP_PROT_PRIORITY_INFO_EX = 4294901783;
pub const IF_ACCESS_LOOPBACK = 1;
pub const IF_ACCESS_BROADCAST = 2;
pub const IF_ACCESS_POINT_TO_POINT = 3;
pub const IF_ACCESS_POINTTOPOINT = 3;
pub const IF_ACCESS_POINT_TO_MULTI_POINT = 4;
pub const IF_ACCESS_POINTTOMULTIPOINT = 4;
pub const IF_OPER_STATUS_NON_OPERATIONAL = 0;
pub const IF_OPER_STATUS_UNREACHABLE = 1;
pub const IF_OPER_STATUS_DISCONNECTED = 2;
pub const IF_OPER_STATUS_CONNECTING = 3;
pub const IF_OPER_STATUS_CONNECTED = 4;
pub const IF_OPER_STATUS_OPERATIONAL = 5;
pub const MIB_IPROUTE_TYPE_OTHER = 1;
pub const MIB_IPROUTE_TYPE_INVALID = 2;
pub const MIB_IPROUTE_TYPE_DIRECT = 3;
pub const MIB_IPROUTE_TYPE_INDIRECT = 4;
pub const MIB_IPNET_TYPE_OTHER = 1;
pub const MIB_IPNET_TYPE_INVALID = 2;
pub const MIB_IPNET_TYPE_DYNAMIC = 3;
pub const MIB_IPNET_TYPE_STATIC = 4;
pub const MIB_IP_FORWARDING = 1;
pub const MIB_IP_NOT_FORWARDING = 2;
pub const ICMP6_DST_UNREACH = 1;
pub const ICMP6_PACKET_TOO_BIG = 2;
pub const ICMP6_TIME_EXCEEDED = 3;
pub const ICMP6_PARAM_PROB = 4;
pub const ICMP6_ECHO_REQUEST = 128;
pub const ICMP6_ECHO_REPLY = 129;
pub const ICMP6_MEMBERSHIP_QUERY = 130;
pub const ICMP6_MEMBERSHIP_REPORT = 131;
pub const ICMP6_MEMBERSHIP_REDUCTION = 132;
pub const ND_ROUTER_SOLICIT = 133;
pub const ND_ROUTER_ADVERT = 134;
pub const ND_NEIGHBOR_SOLICIT = 135;
pub const ND_NEIGHBOR_ADVERT = 136;
pub const ND_REDIRECT = 137;
pub const ICMP6_V2_MEMBERSHIP_REPORT = 143;
pub const ICMP4_ECHO_REPLY = 0;
pub const ICMP4_DST_UNREACH = 3;
pub const ICMP4_SOURCE_QUENCH = 4;
pub const ICMP4_REDIRECT = 5;
pub const ICMP4_ECHO_REQUEST = 8;
pub const ICMP4_ROUTER_ADVERT = 9;
pub const ICMP4_ROUTER_SOLICIT = 10;
pub const ICMP4_TIME_EXCEEDED = 11;
pub const ICMP4_PARAM_PROB = 12;
pub const ICMP4_TIMESTAMP_REQUEST = 13;
pub const ICMP4_TIMESTAMP_REPLY = 14;
pub const ICMP4_MASK_REQUEST = 17;
pub const ICMP4_MASK_REPLY = 18;
pub const MIB_TCP_STATE_CLOSED = 1;
pub const MIB_TCP_STATE_LISTEN = 2;
pub const MIB_TCP_STATE_SYN_SENT = 3;
pub const MIB_TCP_STATE_SYN_RCVD = 4;
pub const MIB_TCP_STATE_ESTAB = 5;
pub const MIB_TCP_STATE_FIN_WAIT1 = 6;
pub const MIB_TCP_STATE_FIN_WAIT2 = 7;
pub const MIB_TCP_STATE_CLOSE_WAIT = 8;
pub const MIB_TCP_STATE_CLOSING = 9;
pub const MIB_TCP_STATE_LAST_ACK = 10;
pub const MIB_TCP_STATE_TIME_WAIT = 11;
pub const MIB_TCP_STATE_DELETE_TCB = 12;
pub const MIB_TCP_STATE_RESERVED = 100;
pub const TcpConnectionOffloadStateInHost = 0;
pub const TcpConnectionOffloadStateOffloading = 1;
pub const TcpConnectionOffloadStateOffloaded = 2;
pub const TcpConnectionOffloadStateUploading = 3;
pub const TcpConnectionOffloadStateMax = 4;
pub const TcpRtoAlgorithmOther = 1;
pub const TcpRtoAlgorithmConstant = 2;
pub const TcpRtoAlgorithmRsre = 3;
pub const TcpRtoAlgorithmVanj = 4;
pub const MIB_TCP_RTO_OTHER = 1;
pub const MIB_TCP_RTO_CONSTANT = 2;
pub const MIB_TCP_RTO_RSRE = 3;
pub const MIB_TCP_RTO_VANJ = 4;
pub const TCP_TABLE_BASIC_LISTENER = 0;
pub const TCP_TABLE_BASIC_CONNECTIONS = 1;
pub const TCP_TABLE_BASIC_ALL = 2;
pub const TCP_TABLE_OWNER_PID_LISTENER = 3;
pub const TCP_TABLE_OWNER_PID_CONNECTIONS = 4;
pub const TCP_TABLE_OWNER_PID_ALL = 5;
pub const TCP_TABLE_OWNER_MODULE_LISTENER = 6;
pub const TCP_TABLE_OWNER_MODULE_CONNECTIONS = 7;
pub const TCP_TABLE_OWNER_MODULE_ALL = 8;
pub const UDP_TABLE_BASIC = 0;
pub const UDP_TABLE_OWNER_PID = 1;
pub const UDP_TABLE_OWNER_MODULE = 2;
pub const TCPIP_OWNER_MODULE_INFO_BASIC = 0;
pub const TcpConnectionEstatsSynOpts = 0;
pub const TcpConnectionEstatsData = 1;
pub const TcpConnectionEstatsSndCong = 2;
pub const TcpConnectionEstatsPath = 3;
pub const TcpConnectionEstatsSendBuff = 4;
pub const TcpConnectionEstatsRec = 5;
pub const TcpConnectionEstatsObsRec = 6;
pub const TcpConnectionEstatsBandwidth = 7;
pub const TcpConnectionEstatsFineRtt = 8;
pub const TcpConnectionEstatsMaximum = 9;
pub const TcpBoolOptDisabled = 0;
pub const TcpBoolOptEnabled = 1;
pub const TcpBoolOptUnchanged = -1;
pub const TcpErrorNone = 0;
pub const TcpErrorBelowDataWindow = 1;
pub const TcpErrorAboveDataWindow = 2;
pub const TcpErrorBelowAckWindow = 3;
pub const TcpErrorAboveAckWindow = 4;
pub const TcpErrorBelowTsWindow = 5;
pub const TcpErrorAboveTsWindow = 6;
pub const TcpErrorDataChecksumError = 7;
pub const TcpErrorDataLengthError = 8;
pub const TcpErrorMaxSoftError = 9;
pub const NET_ADDRESS_FORMAT_UNSPECIFIED = 0;
pub const NET_ADDRESS_DNS_NAME = 1;
pub const NET_ADDRESS_IPV4 = 2;
pub const NET_ADDRESS_IPV6 = 3;
pub const MibParameterNotification = 0;
pub const MibAddInstance = 1;
pub const MibDeleteInstance = 2;
pub const MibInitialNotification = 3;
pub const MibIfEntryNormal = 0;
pub const MibIfEntryNormalWithoutStatistics = 2;
pub const MibIfTableNormal = 0;
pub const MibIfTableRaw = 1;
pub const MibIfTableNormalWithoutStatistics = 2;
pub const DnsServerInvalidProperty = 0;
pub const DnsServerDohProperty = 1;
pub const DnsServerDotProperty = 2;
pub const NetFlVirtualInterfaceOriginOid = 0;
pub const NetFlVirtualInterfaceOriginApi = 1;
pub const NetFlVirtualInterfaceOriginDefault = 2;
pub const NetFlIsolationModeNone = 0;
pub const NetFlIsolationModeVlan = 1;
pub const NetFlIsolationModeVsid = 2;
pub const GF_FRAGMENTS = 2;
pub const GF_STRONGHOST = 8;
pub const GF_FRAGCACHE = 9;
pub const PF_ACTION_FORWARD = 0;
pub const PF_ACTION_DROP = 1;
pub const PF_IPV4 = 0;
pub const PF_IPV6 = 1;
pub const PFFT_FILTER = 1;
pub const PFFT_FRAG = 2;
pub const PFFT_SPOOF = 3;

pub const aliases = struct {
    pub const GET_ADAPTERS_ADDRESSES_FLAGS = u32;
    pub const IF_ACCESS_TYPE = i32;
    pub const INTERNAL_IF_OPER_STATUS = i32;
    pub const MIB_IPFORWARD_TYPE = i32;
    pub const MIB_IPNET_TYPE = i32;
    pub const MIB_IPSTATS_FORWARDING = i32;
    pub const ICMP6_TYPE = i32;
    pub const ICMP4_TYPE = i32;
    pub const MIB_TCP_STATE = i32;
    pub const TCP_CONNECTION_OFFLOAD_STATE = i32;
    pub const TCP_RTO_ALGORITHM = i32;
    pub const TCP_TABLE_CLASS = i32;
    pub const UDP_TABLE_CLASS = i32;
    pub const TCPIP_OWNER_MODULE_INFO_CLASS = i32;
    pub const TCP_ESTATS_TYPE = i32;
    pub const TCP_BOOLEAN_OPTIONAL = i32;
    pub const TCP_SOFT_ERROR = i32;
    pub const NET_ADDRESS_FORMAT = i32;
    pub const MIB_NOTIFICATION_TYPE = i32;
    pub const MIB_IF_ENTRY_LEVEL = i32;
    pub const MIB_IF_TABLE_LEVEL = i32;
    pub const DNS_SERVER_PROPERTY_TYPE = i32;
    pub const NET_FL_VIRTUAL_INTERFACE_ORIGIN = i32;
    pub const NET_FL_ISOLATION_MODE = i32;
    pub const GLOBAL_FILTER = i32;
    pub const PFFORWARD_ACTION = i32;
    pub const PFADDRESSTYPE = i32;
    pub const PFFRAMETYPE = i32;
    pub const HIFTIMESTAMPCHANGE = ?*anyopaque;
    pub const PINTERFACE_TIMESTAMP_CONFIG_CHANGE_CALLBACK = ?*const anyopaque;
    pub const PIPINTERFACE_CHANGE_CALLBACK = ?*const anyopaque;
    pub const PUNICAST_IPADDRESS_CHANGE_CALLBACK = ?*const anyopaque;
    pub const PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK = ?*const anyopaque;
    pub const PIPFORWARD_CHANGE_CALLBACK = ?*const anyopaque;
    pub const PTEREDO_PORT_CHANGE_CALLBACK = ?*const anyopaque;
    pub const PNETWORK_CONNECTIVITY_HINT_CHANGE_CALLBACK = ?*const anyopaque;
};
