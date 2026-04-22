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
    .{ "WSCEnumProtocols32", MethodRecord{ .library = "WS2_32", .import = "WSCEnumProtocols32", .signature = "\x00\x04\x08\x0f\x08\x0f\x11\xb3\x59\x0f\x09\x0f\x08" } },
    .{ "WSCDeinstallProvider32", MethodRecord{ .library = "WS2_32", .import = "WSCDeinstallProvider32", .signature = "\x00\x02\x08\x0f\x11\x0d\x0f\x08" } },
    .{ "WSCInstallProvider64_32", MethodRecord{ .library = "WS2_32", .import = "WSCInstallProvider64_32", .signature = "\x00\x05\x08\x0f\x11\x0d\x11\x05\x0f\x11\xb3\x59\x09\x0f\x08" } },
    .{ "WSCGetProviderPath32", MethodRecord{ .library = "WS2_32", .import = "WSCGetProviderPath32", .signature = "\x00\x04\x08\x0f\x11\x0d\x11\x05\x0f\x08\x0f\x08" } },
    .{ "WSCUpdateProvider32", MethodRecord{ .library = "WS2_32", .import = "WSCUpdateProvider32", .signature = "\x00\x05\x08\x0f\x11\x0d\x11\x05\x0f\x11\xb3\x59\x09\x0f\x08" } },
    .{ "WSCSetProviderInfo32", MethodRecord{ .library = "WS2_32", .import = "WSCSetProviderInfo32", .signature = "\x00\x06\x08\x0f\x11\x0d\x11\xb3\x5d\x0f\x05\x19\x09\x0f\x08" } },
    .{ "WSCGetProviderInfo32", MethodRecord{ .library = "WS2_32", .import = "WSCGetProviderInfo32", .signature = "\x00\x06\x08\x0f\x11\x0d\x11\xb3\x5d\x0f\x05\x0f\x19\x09\x0f\x08" } },
    .{ "WSCEnumNameSpaceProviders32", MethodRecord{ .library = "WS2_32", .import = "WSCEnumNameSpaceProviders32", .signature = "\x00\x02\x08\x0f\x09\x0f\x11\xb3\x61" } },
    .{ "WSCEnumNameSpaceProvidersEx32", MethodRecord{ .library = "WS2_32", .import = "WSCEnumNameSpaceProvidersEx32", .signature = "\x00\x02\x08\x0f\x09\x0f\x11\xb3\x65" } },
    .{ "WSCInstallNameSpace32", MethodRecord{ .library = "WS2_32", .import = "WSCInstallNameSpace32", .signature = "\x00\x05\x08\x11\x05\x11\x05\x09\x09\x0f\x11\x0d" } },
    .{ "WSCInstallNameSpaceEx32", MethodRecord{ .library = "WS2_32", .import = "WSCInstallNameSpaceEx32", .signature = "\x00\x06\x08\x11\x05\x11\x05\x09\x09\x0f\x11\x0d\x0f\x11\xb3\x69" } },
    .{ "WSCUnInstallNameSpace32", MethodRecord{ .library = "WS2_32", .import = "WSCUnInstallNameSpace32", .signature = "\x00\x01\x08\x0f\x11\x0d" } },
    .{ "WSCEnableNSProvider32", MethodRecord{ .library = "WS2_32", .import = "WSCEnableNSProvider32", .signature = "\x00\x02\x08\x0f\x11\x0d\x11\x59" } },
    .{ "WSCInstallProviderAndChains64_32", MethodRecord{ .library = "WS2_32", .import = "WSCInstallProviderAndChains64_32", .signature = "\x00\x09\x08\x0f\x11\x0d\x11\x05\x11\x05\x11\x05\x09\x0f\x11\xb3\x59\x09\x0f\x09\x0f\x08" } },
    .{ "WSCWriteProviderOrder32", MethodRecord{ .library = "WS2_32", .import = "WSCWriteProviderOrder32", .signature = "\x00\x02\x08\x0f\x09\x09" } },
    .{ "WSCWriteNameSpaceOrder32", MethodRecord{ .library = "WS2_32", .import = "WSCWriteNameSpaceOrder32", .signature = "\x00\x02\x08\x0f\x11\x0d\x09" } },
    .{ "__WSAFDIsSet", MethodRecord{ .library = "WS2_32", .import = "__WSAFDIsSet", .signature = "\x00\x02\x08\x11\xb3\x51\x0f\x11\xb3\x6d" } },
    .{ "accept", MethodRecord{ .library = "WS2_32", .import = "accept", .signature = "\x00\x03\x11\xb3\x51\x11\xb3\x51\x0f\x11\xb3\x71\x0f\x08" } },
    .{ "bind", MethodRecord{ .library = "WS2_32", .import = "bind", .signature = "\x00\x03\x08\x11\xb3\x51\x0f\x11\xb3\x71\x08" } },
    .{ "closesocket", MethodRecord{ .library = "WS2_32", .import = "closesocket", .signature = "\x00\x01\x08\x11\xb3\x51" } },
    .{ "connect", MethodRecord{ .library = "WS2_32", .import = "connect", .signature = "\x00\x03\x08\x11\xb3\x51\x0f\x11\xb3\x71\x08" } },
    .{ "ioctlsocket", MethodRecord{ .library = "WS2_32", .import = "ioctlsocket", .signature = "\x00\x03\x08\x11\xb3\x51\x08\x0f\x09" } },
    .{ "getpeername", MethodRecord{ .library = "WS2_32", .import = "getpeername", .signature = "\x00\x03\x08\x11\xb3\x51\x0f\x11\xb3\x71\x0f\x08" } },
    .{ "getsockname", MethodRecord{ .library = "WS2_32", .import = "getsockname", .signature = "\x00\x03\x08\x11\xb3\x51\x0f\x11\xb3\x71\x0f\x08" } },
    .{ "getsockopt", MethodRecord{ .library = "WS2_32", .import = "getsockopt", .signature = "\x00\x05\x08\x11\xb3\x51\x08\x08\x11\x3d\x0f\x08" } },
    .{ "htonl", MethodRecord{ .library = "WS2_32", .import = "htonl", .signature = "\x00\x01\x09\x09" } },
    .{ "htons", MethodRecord{ .library = "WS2_32", .import = "htons", .signature = "\x00\x01\x07\x07" } },
    .{ "inet_addr", MethodRecord{ .library = "WS2_32", .import = "inet_addr", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "inet_ntoa", MethodRecord{ .library = "WS2_32", .import = "inet_ntoa", .signature = "\x00\x01\x11\x3d\x11\xb3\x75" } },
    .{ "listen", MethodRecord{ .library = "WS2_32", .import = "listen", .signature = "\x00\x02\x08\x11\xb3\x51\x08" } },
    .{ "ntohl", MethodRecord{ .library = "WS2_32", .import = "ntohl", .signature = "\x00\x01\x09\x09" } },
    .{ "ntohs", MethodRecord{ .library = "WS2_32", .import = "ntohs", .signature = "\x00\x01\x07\x07" } },
    .{ "recv", MethodRecord{ .library = "WS2_32", .import = "recv", .signature = "\x00\x04\x08\x11\xb3\x51\x11\x3d\x08\x11\x97\xf1" } },
    .{ "recvfrom", MethodRecord{ .library = "WS2_32", .import = "recvfrom", .signature = "\x00\x06\x08\x11\xb3\x51\x11\x3d\x08\x08\x0f\x11\xb3\x71\x0f\x08" } },
    .{ "select", MethodRecord{ .library = "WS2_32", .import = "select", .signature = "\x00\x05\x08\x08\x0f\x11\xb3\x6d\x0f\x11\xb3\x6d\x0f\x11\xb3\x6d\x0f\x11\xb3\x79" } },
    .{ "send", MethodRecord{ .library = "WS2_32", .import = "send", .signature = "\x00\x04\x08\x11\xb3\x51\x11\x3d\x08\x11\x97\xf1" } },
    .{ "sendto", MethodRecord{ .library = "WS2_32", .import = "sendto", .signature = "\x00\x06\x08\x11\xb3\x51\x11\x3d\x08\x08\x0f\x11\xb3\x71\x08" } },
    .{ "setsockopt", MethodRecord{ .library = "WS2_32", .import = "setsockopt", .signature = "\x00\x05\x08\x11\xb3\x51\x08\x08\x11\x3d\x08" } },
    .{ "shutdown", MethodRecord{ .library = "WS2_32", .import = "shutdown", .signature = "\x00\x02\x08\x11\xb3\x51\x11\x97\xfd" } },
    .{ "socket", MethodRecord{ .library = "WS2_32", .import = "socket", .signature = "\x00\x03\x11\xb3\x51\x08\x11\x98\x01\x08" } },
    .{ "gethostbyaddr", MethodRecord{ .library = "WS2_32", .import = "gethostbyaddr", .signature = "\x00\x03\x0f\x11\xb3\x7d\x11\x3d\x08\x08" } },
    .{ "gethostbyname", MethodRecord{ .library = "WS2_32", .import = "gethostbyname", .signature = "\x00\x01\x0f\x11\xb3\x7d\x11\x3d" } },
    .{ "gethostname", MethodRecord{ .library = "WS2_32", .import = "gethostname", .signature = "\x00\x02\x08\x11\x3d\x08" } },
    .{ "GetHostNameW", MethodRecord{ .library = "WS2_32", .import = "GetHostNameW", .signature = "\x00\x02\x08\x11\x05\x08" } },
    .{ "getservbyport", MethodRecord{ .library = "WS2_32", .import = "getservbyport", .signature = "\x00\x02\x0f\x11\xb3\x81\x08\x11\x3d" } },
    .{ "getservbyname", MethodRecord{ .library = "WS2_32", .import = "getservbyname", .signature = "\x00\x02\x0f\x11\xb3\x81\x11\x3d\x11\x3d" } },
    .{ "getprotobynumber", MethodRecord{ .library = "WS2_32", .import = "getprotobynumber", .signature = "\x00\x01\x0f\x11\xb3\x85\x08" } },
    .{ "getprotobyname", MethodRecord{ .library = "WS2_32", .import = "getprotobyname", .signature = "\x00\x01\x0f\x11\xb3\x85\x11\x3d" } },
    .{ "WSAStartup", MethodRecord{ .library = "WS2_32", .import = "WSAStartup", .signature = "\x00\x02\x08\x07\x0f\x11\xb3\x89" } },
    .{ "WSACleanup", MethodRecord{ .library = "WS2_32", .import = "WSACleanup", .signature = "\x00\x00\x08" } },
    .{ "WSASetLastError", MethodRecord{ .library = "WS2_32", .import = "WSASetLastError", .signature = "\x00\x01\x01\x08" } },
    .{ "WSAGetLastError", MethodRecord{ .library = "WS2_32", .import = "WSAGetLastError", .signature = "\x00\x00\x11\x97\xe5" } },
    .{ "WSAIsBlocking", MethodRecord{ .library = "WS2_32", .import = "WSAIsBlocking", .signature = "\x00\x00\x11\x59" } },
    .{ "WSAUnhookBlockingHook", MethodRecord{ .library = "WS2_32", .import = "WSAUnhookBlockingHook", .signature = "\x00\x00\x08" } },
    .{ "WSASetBlockingHook", MethodRecord{ .library = "WS2_32", .import = "WSASetBlockingHook", .signature = "\x00\x01\x12\x96\xe9\x12\x96\xe9" } },
    .{ "WSACancelBlockingCall", MethodRecord{ .library = "WS2_32", .import = "WSACancelBlockingCall", .signature = "\x00\x00\x08" } },
    .{ "WSAAsyncGetServByName", MethodRecord{ .library = "WS2_32", .import = "WSAAsyncGetServByName", .signature = "\x00\x06\x11\x80\x85\x11\x25\x09\x11\x3d\x11\x3d\x11\x3d\x08" } },
    .{ "WSAAsyncGetServByPort", MethodRecord{ .library = "WS2_32", .import = "WSAAsyncGetServByPort", .signature = "\x00\x06\x11\x80\x85\x11\x25\x09\x08\x11\x3d\x11\x3d\x08" } },
    .{ "WSAAsyncGetProtoByName", MethodRecord{ .library = "WS2_32", .import = "WSAAsyncGetProtoByName", .signature = "\x00\x05\x11\x80\x85\x11\x25\x09\x11\x3d\x11\x3d\x08" } },
    .{ "WSAAsyncGetProtoByNumber", MethodRecord{ .library = "WS2_32", .import = "WSAAsyncGetProtoByNumber", .signature = "\x00\x05\x11\x80\x85\x11\x25\x09\x08\x11\x3d\x08" } },
    .{ "WSAAsyncGetHostByName", MethodRecord{ .library = "WS2_32", .import = "WSAAsyncGetHostByName", .signature = "\x00\x05\x11\x80\x85\x11\x25\x09\x11\x3d\x11\x3d\x08" } },
    .{ "WSAAsyncGetHostByAddr", MethodRecord{ .library = "WS2_32", .import = "WSAAsyncGetHostByAddr", .signature = "\x00\x07\x11\x80\x85\x11\x25\x09\x11\x3d\x08\x08\x11\x3d\x08" } },
    .{ "WSACancelAsyncRequest", MethodRecord{ .library = "WS2_32", .import = "WSACancelAsyncRequest", .signature = "\x00\x01\x08\x11\x80\x85" } },
    .{ "WSAAsyncSelect", MethodRecord{ .library = "WS2_32", .import = "WSAAsyncSelect", .signature = "\x00\x04\x08\x11\xb3\x51\x11\x25\x09\x08" } },
    .{ "WSAAccept", MethodRecord{ .library = "WS2_32", .import = "WSAAccept", .signature = "\x00\x05\x11\xb3\x51\x11\xb3\x51\x0f\x11\xb3\x71\x0f\x08\x12\xb3\x8d\x19" } },
    .{ "WSACloseEvent", MethodRecord{ .library = "WS2_32", .import = "WSACloseEvent", .signature = "\x00\x01\x11\x59\x11\xb3\x55" } },
    .{ "WSAConnect", MethodRecord{ .library = "WS2_32", .import = "WSAConnect", .signature = "\x00\x07\x08\x11\xb3\x51\x0f\x11\xb3\x71\x08\x0f\x11\xb3\x91\x0f\x11\xb3\x91\x0f\x11\xb3\x95\x0f\x11\xb3\x95" } },
    .{ "WSAConnectByNameW", MethodRecord{ .library = "WS2_32", .import = "WSAConnectByNameW", .signature = "\x00\x09\x11\x59\x11\xb3\x51\x11\x05\x11\x05\x0f\x09\x0f\x11\xb3\x71\x0f\x09\x0f\x11\xb3\x71\x0f\x11\xb3\x79\x0f\x11\x8b\xed" } },
    .{ "WSAConnectByNameA", MethodRecord{ .library = "WS2_32", .import = "WSAConnectByNameA", .signature = "\x00\x09\x11\x59\x11\xb3\x51\x11\x3d\x11\x3d\x0f\x09\x0f\x11\xb3\x71\x0f\x09\x0f\x11\xb3\x71\x0f\x11\xb3\x79\x0f\x11\x8b\xed" } },
    .{ "WSAConnectByList", MethodRecord{ .library = "WS2_32", .import = "WSAConnectByList", .signature = "\x00\x08\x11\x59\x11\xb3\x51\x0f\x11\xb3\x99\x0f\x09\x0f\x11\xb3\x71\x0f\x09\x0f\x11\xb3\x71\x0f\x11\xb3\x79\x0f\x11\x8b\xed" } },
    .{ "WSACreateEvent", MethodRecord{ .library = "WS2_32", .import = "WSACreateEvent", .signature = "\x00\x00\x11\xb3\x55" } },
    .{ "WSADuplicateSocketA", MethodRecord{ .library = "WS2_32", .import = "WSADuplicateSocketA", .signature = "\x00\x03\x08\x11\xb3\x51\x09\x0f\x11\xb3\x9d" } },
    .{ "WSADuplicateSocketW", MethodRecord{ .library = "WS2_32", .import = "WSADuplicateSocketW", .signature = "\x00\x03\x08\x11\xb3\x51\x09\x0f\x11\xb3\x59" } },
    .{ "WSAEnumNetworkEvents", MethodRecord{ .library = "WS2_32", .import = "WSAEnumNetworkEvents", .signature = "\x00\x03\x08\x11\xb3\x51\x11\xb3\x55\x0f\x11\xb3\xa1" } },
    .{ "WSAEnumProtocolsA", MethodRecord{ .library = "WS2_32", .import = "WSAEnumProtocolsA", .signature = "\x00\x03\x08\x0f\x08\x0f\x11\xb3\x9d\x0f\x09" } },
    .{ "WSAEnumProtocolsW", MethodRecord{ .library = "WS2_32", .import = "WSAEnumProtocolsW", .signature = "\x00\x03\x08\x0f\x08\x0f\x11\xb3\x59\x0f\x09" } },
    .{ "WSAEventSelect", MethodRecord{ .library = "WS2_32", .import = "WSAEventSelect", .signature = "\x00\x03\x08\x11\xb3\x51\x11\xb3\x55\x08" } },
    .{ "WSAGetOverlappedResult", MethodRecord{ .library = "WS2_32", .import = "WSAGetOverlappedResult", .signature = "\x00\x05\x11\x59\x11\xb3\x51\x0f\x11\x8b\xed\x0f\x09\x11\x59\x0f\x09" } },
    .{ "WSAGetQOSByName", MethodRecord{ .library = "WS2_32", .import = "WSAGetQOSByName", .signature = "\x00\x03\x11\x59\x11\xb3\x51\x0f\x11\xb3\x91\x0f\x11\xb3\x95" } },
    .{ "WSAHtonl", MethodRecord{ .library = "WS2_32", .import = "WSAHtonl", .signature = "\x00\x03\x08\x11\xb3\x51\x09\x0f\x09" } },
    .{ "WSAHtons", MethodRecord{ .library = "WS2_32", .import = "WSAHtons", .signature = "\x00\x03\x08\x11\xb3\x51\x07\x0f\x07" } },
    .{ "WSAIoctl", MethodRecord{ .library = "WS2_32", .import = "WSAIoctl", .signature = "\x00\x09\x08\x11\xb3\x51\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09\x0f\x11\x8b\xed\x12\xb3\xa5" } },
    .{ "WSAJoinLeaf", MethodRecord{ .library = "WS2_32", .import = "WSAJoinLeaf", .signature = "\x00\x08\x11\xb3\x51\x11\xb3\x51\x0f\x11\xb3\x71\x08\x0f\x11\xb3\x91\x0f\x11\xb3\x91\x0f\x11\xb3\x95\x0f\x11\xb3\x95\x09" } },
    .{ "WSANtohl", MethodRecord{ .library = "WS2_32", .import = "WSANtohl", .signature = "\x00\x03\x08\x11\xb3\x51\x09\x0f\x09" } },
    .{ "WSANtohs", MethodRecord{ .library = "WS2_32", .import = "WSANtohs", .signature = "\x00\x03\x08\x11\xb3\x51\x07\x0f\x07" } },
    .{ "WSARecv", MethodRecord{ .library = "WS2_32", .import = "WSARecv", .signature = "\x00\x07\x08\x11\xb3\x51\x0f\x11\xb3\x91\x09\x0f\x09\x0f\x09\x0f\x11\x8b\xed\x12\xb3\xa5" } },
    .{ "WSARecvDisconnect", MethodRecord{ .library = "WS2_32", .import = "WSARecvDisconnect", .signature = "\x00\x02\x08\x11\xb3\x51\x0f\x11\xb3\x91" } },
    .{ "WSARecvFrom", MethodRecord{ .library = "WS2_32", .import = "WSARecvFrom", .signature = "\x00\x09\x08\x11\xb3\x51\x0f\x11\xb3\x91\x09\x0f\x09\x0f\x09\x0f\x11\xb3\x71\x0f\x08\x0f\x11\x8b\xed\x12\xb3\xa5" } },
    .{ "WSAResetEvent", MethodRecord{ .library = "WS2_32", .import = "WSAResetEvent", .signature = "\x00\x01\x11\x59\x11\xb3\x55" } },
    .{ "WSASend", MethodRecord{ .library = "WS2_32", .import = "WSASend", .signature = "\x00\x07\x08\x11\xb3\x51\x0f\x11\xb3\x91\x09\x0f\x09\x09\x0f\x11\x8b\xed\x12\xb3\xa5" } },
    .{ "WSASendMsg", MethodRecord{ .library = "WS2_32", .import = "WSASendMsg", .signature = "\x00\x06\x08\x11\xb3\x51\x0f\x11\xb3\xa9\x09\x0f\x09\x0f\x11\x8b\xed\x12\xb3\xa5" } },
    .{ "WSASendDisconnect", MethodRecord{ .library = "WS2_32", .import = "WSASendDisconnect", .signature = "\x00\x02\x08\x11\xb3\x51\x0f\x11\xb3\x91" } },
    .{ "WSASendTo", MethodRecord{ .library = "WS2_32", .import = "WSASendTo", .signature = "\x00\x09\x08\x11\xb3\x51\x0f\x11\xb3\x91\x09\x0f\x09\x09\x0f\x11\xb3\x71\x08\x0f\x11\x8b\xed\x12\xb3\xa5" } },
    .{ "WSASetEvent", MethodRecord{ .library = "WS2_32", .import = "WSASetEvent", .signature = "\x00\x01\x11\x59\x11\xb3\x55" } },
    .{ "WSASocketA", MethodRecord{ .library = "WS2_32", .import = "WSASocketA", .signature = "\x00\x06\x11\xb3\x51\x08\x08\x08\x0f\x11\xb3\x9d\x09\x09" } },
    .{ "WSASocketW", MethodRecord{ .library = "WS2_32", .import = "WSASocketW", .signature = "\x00\x06\x11\xb3\x51\x08\x08\x08\x0f\x11\xb3\x59\x09\x09" } },
    .{ "WSAWaitForMultipleEvents", MethodRecord{ .library = "WS2_32", .import = "WSAWaitForMultipleEvents", .signature = "\x00\x05\x11\x8d\x15\x09\x0f\x11\x80\x85\x11\x59\x09\x11\x59" } },
    .{ "WSAAddressToStringA", MethodRecord{ .library = "WS2_32", .import = "WSAAddressToStringA", .signature = "\x00\x05\x08\x0f\x11\xb3\x71\x09\x0f\x11\xb3\x9d\x11\x3d\x0f\x09" } },
    .{ "WSAAddressToStringW", MethodRecord{ .library = "WS2_32", .import = "WSAAddressToStringW", .signature = "\x00\x05\x08\x0f\x11\xb3\x71\x09\x0f\x11\xb3\x59\x11\x05\x0f\x09" } },
    .{ "WSAStringToAddressA", MethodRecord{ .library = "WS2_32", .import = "WSAStringToAddressA", .signature = "\x00\x05\x08\x11\x3d\x08\x0f\x11\xb3\x9d\x0f\x11\xb3\x71\x0f\x08" } },
    .{ "WSAStringToAddressW", MethodRecord{ .library = "WS2_32", .import = "WSAStringToAddressW", .signature = "\x00\x05\x08\x11\x05\x08\x0f\x11\xb3\x59\x0f\x11\xb3\x71\x0f\x08" } },
    .{ "WSALookupServiceBeginA", MethodRecord{ .library = "WS2_32", .import = "WSALookupServiceBeginA", .signature = "\x00\x03\x08\x0f\x11\xb3\xad\x09\x0f\x11\x80\x85" } },
    .{ "WSALookupServiceBeginW", MethodRecord{ .library = "WS2_32", .import = "WSALookupServiceBeginW", .signature = "\x00\x03\x08\x0f\x11\xb3\xb1\x09\x0f\x11\x80\x85" } },
    .{ "WSALookupServiceNextA", MethodRecord{ .library = "WS2_32", .import = "WSALookupServiceNextA", .signature = "\x00\x04\x08\x11\x80\x85\x09\x0f\x09\x0f\x11\xb3\xad" } },
    .{ "WSALookupServiceNextW", MethodRecord{ .library = "WS2_32", .import = "WSALookupServiceNextW", .signature = "\x00\x04\x08\x11\x80\x85\x09\x0f\x09\x0f\x11\xb3\xb1" } },
    .{ "WSANSPIoctl", MethodRecord{ .library = "WS2_32", .import = "WSANSPIoctl", .signature = "\x00\x08\x08\x11\x80\x85\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09\x0f\x11\xb3\xb5" } },
    .{ "WSALookupServiceEnd", MethodRecord{ .library = "WS2_32", .import = "WSALookupServiceEnd", .signature = "\x00\x01\x08\x11\x80\x85" } },
    .{ "WSAInstallServiceClassA", MethodRecord{ .library = "WS2_32", .import = "WSAInstallServiceClassA", .signature = "\x00\x01\x08\x0f\x11\xb3\xb9" } },
    .{ "WSAInstallServiceClassW", MethodRecord{ .library = "WS2_32", .import = "WSAInstallServiceClassW", .signature = "\x00\x01\x08\x0f\x11\xb3\xbd" } },
    .{ "WSARemoveServiceClass", MethodRecord{ .library = "WS2_32", .import = "WSARemoveServiceClass", .signature = "\x00\x01\x08\x0f\x11\x0d" } },
    .{ "WSAGetServiceClassInfoA", MethodRecord{ .library = "WS2_32", .import = "WSAGetServiceClassInfoA", .signature = "\x00\x04\x08\x0f\x11\x0d\x0f\x11\x0d\x0f\x09\x0f\x11\xb3\xb9" } },
    .{ "WSAGetServiceClassInfoW", MethodRecord{ .library = "WS2_32", .import = "WSAGetServiceClassInfoW", .signature = "\x00\x04\x08\x0f\x11\x0d\x0f\x11\x0d\x0f\x09\x0f\x11\xb3\xbd" } },
    .{ "WSAEnumNameSpaceProvidersA", MethodRecord{ .library = "WS2_32", .import = "WSAEnumNameSpaceProvidersA", .signature = "\x00\x02\x08\x0f\x09\x0f\x11\xb3\xc1" } },
    .{ "WSAEnumNameSpaceProvidersW", MethodRecord{ .library = "WS2_32", .import = "WSAEnumNameSpaceProvidersW", .signature = "\x00\x02\x08\x0f\x09\x0f\x11\xb3\x61" } },
    .{ "WSAEnumNameSpaceProvidersExA", MethodRecord{ .library = "WS2_32", .import = "WSAEnumNameSpaceProvidersExA", .signature = "\x00\x02\x08\x0f\x09\x0f\x11\xb3\xc5" } },
    .{ "WSAEnumNameSpaceProvidersExW", MethodRecord{ .library = "WS2_32", .import = "WSAEnumNameSpaceProvidersExW", .signature = "\x00\x02\x08\x0f\x09\x0f\x11\xb3\x65" } },
    .{ "WSAGetServiceClassNameByClassIdA", MethodRecord{ .library = "WS2_32", .import = "WSAGetServiceClassNameByClassIdA", .signature = "\x00\x03\x08\x0f\x11\x0d\x11\x3d\x0f\x09" } },
    .{ "WSAGetServiceClassNameByClassIdW", MethodRecord{ .library = "WS2_32", .import = "WSAGetServiceClassNameByClassIdW", .signature = "\x00\x03\x08\x0f\x11\x0d\x11\x05\x0f\x09" } },
    .{ "WSASetServiceA", MethodRecord{ .library = "WS2_32", .import = "WSASetServiceA", .signature = "\x00\x03\x08\x0f\x11\xb3\xad\x11\xb3\xc9\x09" } },
    .{ "WSASetServiceW", MethodRecord{ .library = "WS2_32", .import = "WSASetServiceW", .signature = "\x00\x03\x08\x0f\x11\xb3\xb1\x11\xb3\xc9\x09" } },
    .{ "WSAProviderConfigChange", MethodRecord{ .library = "WS2_32", .import = "WSAProviderConfigChange", .signature = "\x00\x03\x08\x0f\x11\x80\x85\x0f\x11\x8b\xed\x12\xb3\xa5" } },
    .{ "WSAPoll", MethodRecord{ .library = "WS2_32", .import = "WSAPoll", .signature = "\x00\x03\x08\x0f\x11\xb3\xcd\x09\x08" } },
    .{ "ProcessSocketNotifications", MethodRecord{ .library = "WS2_32", .import = "ProcessSocketNotifications", .signature = "\x00\x07\x09\x11\x80\x85\x09\x0f\x11\xb3\xd1\x09\x09\x0f\x11\xb3\xd5\x0f\x09" } },
    .{ "RtlIpv4AddressToStringA", MethodRecord{ .library = "ntdll", .import = "RtlIpv4AddressToStringA", .signature = "\x00\x02\x11\x3d\x0f\x11\xb3\x75\x11\x3d" } },
    .{ "RtlIpv4AddressToStringExA", MethodRecord{ .library = "ntdll", .import = "RtlIpv4AddressToStringExA", .signature = "\x00\x04\x08\x0f\x11\xb3\x75\x07\x11\x3d\x0f\x09" } },
    .{ "RtlIpv4AddressToStringW", MethodRecord{ .library = "ntdll", .import = "RtlIpv4AddressToStringW", .signature = "\x00\x02\x11\x05\x0f\x11\xb3\x75\x11\x05" } },
    .{ "RtlIpv4AddressToStringExW", MethodRecord{ .library = "ntdll", .import = "RtlIpv4AddressToStringExW", .signature = "\x00\x04\x08\x0f\x11\xb3\x75\x07\x11\x05\x0f\x09" } },
    .{ "RtlIpv4StringToAddressA", MethodRecord{ .library = "ntdll", .import = "RtlIpv4StringToAddressA", .signature = "\x00\x04\x08\x11\x3d\x11\x87\x79\x0f\x11\x3d\x0f\x11\xb3\x75" } },
    .{ "RtlIpv4StringToAddressExA", MethodRecord{ .library = "ntdll", .import = "RtlIpv4StringToAddressExA", .signature = "\x00\x04\x08\x11\x3d\x11\x87\x79\x0f\x11\xb3\x75\x0f\x07" } },
    .{ "RtlIpv4StringToAddressW", MethodRecord{ .library = "ntdll", .import = "RtlIpv4StringToAddressW", .signature = "\x00\x04\x08\x11\x05\x11\x87\x79\x0f\x11\x05\x0f\x11\xb3\x75" } },
    .{ "RtlIpv4StringToAddressExW", MethodRecord{ .library = "ntdll", .import = "RtlIpv4StringToAddressExW", .signature = "\x00\x04\x08\x11\x05\x11\x87\x79\x0f\x11\xb3\x75\x0f\x07" } },
    .{ "RtlIpv6AddressToStringA", MethodRecord{ .library = "ntdll", .import = "RtlIpv6AddressToStringA", .signature = "\x00\x02\x11\x3d\x0f\x11\xb3\xd9\x11\x3d" } },
    .{ "RtlIpv6AddressToStringExA", MethodRecord{ .library = "ntdll", .import = "RtlIpv6AddressToStringExA", .signature = "\x00\x05\x08\x0f\x11\xb3\xd9\x09\x07\x11\x3d\x0f\x09" } },
    .{ "RtlIpv6AddressToStringW", MethodRecord{ .library = "ntdll", .import = "RtlIpv6AddressToStringW", .signature = "\x00\x02\x11\x05\x0f\x11\xb3\xd9\x11\x05" } },
    .{ "RtlIpv6AddressToStringExW", MethodRecord{ .library = "ntdll", .import = "RtlIpv6AddressToStringExW", .signature = "\x00\x05\x08\x0f\x11\xb3\xd9\x09\x07\x11\x05\x0f\x09" } },
    .{ "RtlIpv6StringToAddressA", MethodRecord{ .library = "ntdll", .import = "RtlIpv6StringToAddressA", .signature = "\x00\x03\x08\x11\x3d\x0f\x11\x3d\x0f\x11\xb3\xd9" } },
    .{ "RtlIpv6StringToAddressExA", MethodRecord{ .library = "ntdll", .import = "RtlIpv6StringToAddressExA", .signature = "\x00\x04\x08\x11\x3d\x0f\x11\xb3\xd9\x0f\x09\x0f\x07" } },
    .{ "RtlIpv6StringToAddressW", MethodRecord{ .library = "ntdll", .import = "RtlIpv6StringToAddressW", .signature = "\x00\x03\x08\x11\x05\x0f\x11\x05\x0f\x11\xb3\xd9" } },
    .{ "RtlIpv6StringToAddressExW", MethodRecord{ .library = "ntdll", .import = "RtlIpv6StringToAddressExW", .signature = "\x00\x04\x08\x11\x05\x0f\x11\xb3\xd9\x0f\x09\x0f\x07" } },
    .{ "RtlEthernetAddressToStringA", MethodRecord{ .library = "ntdll", .import = "RtlEthernetAddressToStringA", .signature = "\x00\x02\x11\x3d\x0f\x11\xb3\xdd\x11\x3d" } },
    .{ "RtlEthernetAddressToStringW", MethodRecord{ .library = "ntdll", .import = "RtlEthernetAddressToStringW", .signature = "\x00\x02\x11\x05\x0f\x11\xb3\xdd\x11\x05" } },
    .{ "RtlEthernetStringToAddressA", MethodRecord{ .library = "ntdll", .import = "RtlEthernetStringToAddressA", .signature = "\x00\x03\x08\x11\x3d\x0f\x11\x3d\x0f\x11\xb3\xdd" } },
    .{ "RtlEthernetStringToAddressW", MethodRecord{ .library = "ntdll", .import = "RtlEthernetStringToAddressW", .signature = "\x00\x03\x08\x11\x05\x0f\x11\x05\x0f\x11\xb3\xdd" } },
    .{ "WSARecvEx", MethodRecord{ .library = "MSWSOCK", .import = "WSARecvEx", .signature = "\x00\x04\x08\x11\xb3\x51\x11\x3d\x08\x0f\x08" } },
    .{ "TransmitFile", MethodRecord{ .library = "MSWSOCK", .import = "TransmitFile", .signature = "\x00\x07\x11\x59\x11\xb3\x51\x11\x80\x85\x09\x09\x0f\x11\x8b\xed\x0f\x11\xb3\xe1\x09" } },
    .{ "AcceptEx", MethodRecord{ .library = "MSWSOCK", .import = "AcceptEx", .signature = "\x00\x08\x11\x59\x11\xb3\x51\x11\xb3\x51\x0f\x01\x09\x09\x09\x0f\x09\x0f\x11\x8b\xed" } },
    .{ "GetAcceptExSockaddrs", MethodRecord{ .library = "MSWSOCK", .import = "GetAcceptExSockaddrs", .signature = "\x00\x08\x01\x0f\x01\x09\x09\x09\x0f\x0f\x11\xb3\x71\x0f\x08\x0f\x0f\x11\xb3\x71\x0f\x08" } },
    .{ "WSCEnumProtocols", MethodRecord{ .library = "WS2_32", .import = "WSCEnumProtocols", .signature = "\x00\x04\x08\x0f\x08\x0f\x11\xb3\x59\x0f\x09\x0f\x08" } },
    .{ "WSCDeinstallProvider", MethodRecord{ .library = "WS2_32", .import = "WSCDeinstallProvider", .signature = "\x00\x02\x08\x0f\x11\x0d\x0f\x08" } },
    .{ "WSCInstallProvider", MethodRecord{ .library = "WS2_32", .import = "WSCInstallProvider", .signature = "\x00\x05\x08\x0f\x11\x0d\x11\x05\x0f\x11\xb3\x59\x09\x0f\x08" } },
    .{ "WSCGetProviderPath", MethodRecord{ .library = "WS2_32", .import = "WSCGetProviderPath", .signature = "\x00\x04\x08\x0f\x11\x0d\x11\x05\x0f\x08\x0f\x08" } },
    .{ "WSCUpdateProvider", MethodRecord{ .library = "WS2_32", .import = "WSCUpdateProvider", .signature = "\x00\x05\x08\x0f\x11\x0d\x11\x05\x0f\x11\xb3\x59\x09\x0f\x08" } },
    .{ "WSCSetProviderInfo", MethodRecord{ .library = "WS2_32", .import = "WSCSetProviderInfo", .signature = "\x00\x06\x08\x0f\x11\x0d\x11\xb3\x5d\x0f\x05\x19\x09\x0f\x08" } },
    .{ "WSCGetProviderInfo", MethodRecord{ .library = "WS2_32", .import = "WSCGetProviderInfo", .signature = "\x00\x06\x08\x0f\x11\x0d\x11\xb3\x5d\x0f\x05\x0f\x19\x09\x0f\x08" } },
    .{ "WSCSetApplicationCategory", MethodRecord{ .library = "WS2_32", .import = "WSCSetApplicationCategory", .signature = "\x00\x07\x08\x11\x05\x09\x11\x05\x09\x09\x0f\x09\x0f\x08" } },
    .{ "WSCGetApplicationCategory", MethodRecord{ .library = "WS2_32", .import = "WSCGetApplicationCategory", .signature = "\x00\x06\x08\x11\x05\x09\x11\x05\x09\x0f\x09\x0f\x08" } },
    .{ "WPUCompleteOverlappedRequest", MethodRecord{ .library = "WS2_32", .import = "WPUCompleteOverlappedRequest", .signature = "\x00\x05\x08\x11\xb3\x51\x0f\x11\x8b\xed\x09\x09\x0f\x08" } },
    .{ "WSCInstallNameSpace", MethodRecord{ .library = "WS2_32", .import = "WSCInstallNameSpace", .signature = "\x00\x05\x08\x11\x05\x11\x05\x09\x09\x0f\x11\x0d" } },
    .{ "WSCUnInstallNameSpace", MethodRecord{ .library = "WS2_32", .import = "WSCUnInstallNameSpace", .signature = "\x00\x01\x08\x0f\x11\x0d" } },
    .{ "WSCInstallNameSpaceEx", MethodRecord{ .library = "WS2_32", .import = "WSCInstallNameSpaceEx", .signature = "\x00\x06\x08\x11\x05\x11\x05\x09\x09\x0f\x11\x0d\x0f\x11\xb3\x69" } },
    .{ "WSCEnableNSProvider", MethodRecord{ .library = "WS2_32", .import = "WSCEnableNSProvider", .signature = "\x00\x02\x08\x0f\x11\x0d\x11\x59" } },
    .{ "WSAAdvertiseProvider", MethodRecord{ .library = "WS2_32", .import = "WSAAdvertiseProvider", .signature = "\x00\x02\x08\x0f\x11\x0d\x0f\x11\xb3\xe5" } },
    .{ "WSAUnadvertiseProvider", MethodRecord{ .library = "WS2_32", .import = "WSAUnadvertiseProvider", .signature = "\x00\x01\x08\x0f\x11\x0d" } },
    .{ "WSAProviderCompleteAsyncCall", MethodRecord{ .library = "WS2_32", .import = "WSAProviderCompleteAsyncCall", .signature = "\x00\x02\x08\x11\x80\x85\x08" } },
    .{ "EnumProtocolsA", MethodRecord{ .library = "MSWSOCK", .import = "EnumProtocolsA", .signature = "\x00\x03\x08\x0f\x08\x0f\x01\x0f\x09" } },
    .{ "EnumProtocolsW", MethodRecord{ .library = "MSWSOCK", .import = "EnumProtocolsW", .signature = "\x00\x03\x08\x0f\x08\x0f\x01\x0f\x09" } },
    .{ "GetAddressByNameA", MethodRecord{ .library = "MSWSOCK", .import = "GetAddressByNameA", .signature = "\x00\x0a\x08\x09\x0f\x11\x0d\x11\x3d\x0f\x08\x09\x0f\x11\xb3\xe9\x0f\x01\x0f\x09\x11\x3d\x0f\x09" } },
    .{ "GetAddressByNameW", MethodRecord{ .library = "MSWSOCK", .import = "GetAddressByNameW", .signature = "\x00\x0a\x08\x09\x0f\x11\x0d\x11\x05\x0f\x08\x09\x0f\x11\xb3\xe9\x0f\x01\x0f\x09\x11\x05\x0f\x09" } },
    .{ "GetTypeByNameA", MethodRecord{ .library = "MSWSOCK", .import = "GetTypeByNameA", .signature = "\x00\x02\x08\x11\x3d\x0f\x11\x0d" } },
    .{ "GetTypeByNameW", MethodRecord{ .library = "MSWSOCK", .import = "GetTypeByNameW", .signature = "\x00\x02\x08\x11\x05\x0f\x11\x0d" } },
    .{ "GetNameByTypeA", MethodRecord{ .library = "MSWSOCK", .import = "GetNameByTypeA", .signature = "\x00\x03\x08\x0f\x11\x0d\x11\x3d\x09" } },
    .{ "GetNameByTypeW", MethodRecord{ .library = "MSWSOCK", .import = "GetNameByTypeW", .signature = "\x00\x03\x08\x0f\x11\x0d\x11\x05\x09" } },
    .{ "SetServiceA", MethodRecord{ .library = "MSWSOCK", .import = "SetServiceA", .signature = "\x00\x06\x08\x09\x11\x97\xed\x09\x0f\x11\xb3\xed\x0f\x11\xb3\xe9\x0f\x09" } },
    .{ "SetServiceW", MethodRecord{ .library = "MSWSOCK", .import = "SetServiceW", .signature = "\x00\x06\x08\x09\x11\x97\xed\x09\x0f\x11\xb3\xf1\x0f\x11\xb3\xe9\x0f\x09" } },
    .{ "GetServiceA", MethodRecord{ .library = "MSWSOCK", .import = "GetServiceA", .signature = "\x00\x07\x08\x09\x0f\x11\x0d\x11\x3d\x09\x0f\x01\x0f\x09\x0f\x11\xb3\xe9" } },
    .{ "GetServiceW", MethodRecord{ .library = "MSWSOCK", .import = "GetServiceW", .signature = "\x00\x07\x08\x09\x0f\x11\x0d\x11\x05\x09\x0f\x01\x0f\x09\x0f\x11\xb3\xe9" } },
    .{ "getaddrinfo", MethodRecord{ .library = "WS2_32", .import = "getaddrinfo", .signature = "\x00\x04\x08\x11\x3d\x11\x3d\x0f\x11\xb3\xf5\x0f\x0f\x11\xb3\xf5" } },
    .{ "GetAddrInfoW", MethodRecord{ .library = "WS2_32", .import = "GetAddrInfoW", .signature = "\x00\x04\x08\x11\x05\x11\x05\x0f\x11\xb3\xf9\x0f\x0f\x11\xb3\xf9" } },
    .{ "GetAddrInfoExA", MethodRecord{ .library = "WS2_32", .import = "GetAddrInfoExA", .signature = "\x00\x0a\x08\x11\x3d\x11\x3d\x09\x0f\x11\x0d\x0f\x11\xb3\xfd\x0f\x0f\x11\xb3\xfd\x0f\x11\xb3\x79\x0f\x11\x8b\xed\x12\xb4\x01\x0f\x11\x80\x85" } },
    .{ "GetAddrInfoExW", MethodRecord{ .library = "WS2_32", .import = "GetAddrInfoExW", .signature = "\x00\x0a\x08\x11\x05\x11\x05\x09\x0f\x11\x0d\x0f\x11\xb4\x05\x0f\x0f\x11\xb4\x05\x0f\x11\xb3\x79\x0f\x11\x8b\xed\x12\xb4\x01\x0f\x11\x80\x85" } },
    .{ "GetAddrInfoExCancel", MethodRecord{ .library = "WS2_32", .import = "GetAddrInfoExCancel", .signature = "\x00\x01\x08\x0f\x11\x80\x85" } },
    .{ "GetAddrInfoExOverlappedResult", MethodRecord{ .library = "WS2_32", .import = "GetAddrInfoExOverlappedResult", .signature = "\x00\x01\x08\x0f\x11\x8b\xed" } },
    .{ "SetAddrInfoExA", MethodRecord{ .library = "WS2_32", .import = "SetAddrInfoExA", .signature = "\x00\x0c\x08\x11\x3d\x11\x3d\x0f\x11\xb0\xc5\x09\x0f\x11\xb3\x69\x09\x09\x0f\x11\x0d\x0f\x11\xb3\x79\x0f\x11\x8b\xed\x12\xb4\x01\x0f\x11\x80\x85" } },
    .{ "SetAddrInfoExW", MethodRecord{ .library = "WS2_32", .import = "SetAddrInfoExW", .signature = "\x00\x0c\x08\x11\x05\x11\x05\x0f\x11\xb0\xc5\x09\x0f\x11\xb3\x69\x09\x09\x0f\x11\x0d\x0f\x11\xb3\x79\x0f\x11\x8b\xed\x12\xb4\x01\x0f\x11\x80\x85" } },
    .{ "freeaddrinfo", MethodRecord{ .library = "WS2_32", .import = "freeaddrinfo", .signature = "\x00\x01\x01\x0f\x11\xb3\xf5" } },
    .{ "FreeAddrInfoW", MethodRecord{ .library = "WS2_32", .import = "FreeAddrInfoW", .signature = "\x00\x01\x01\x0f\x11\xb3\xf9" } },
    .{ "FreeAddrInfoEx", MethodRecord{ .library = "WS2_32", .import = "FreeAddrInfoEx", .signature = "\x00\x01\x01\x0f\x11\xb3\xfd" } },
    .{ "FreeAddrInfoExW", MethodRecord{ .library = "WS2_32", .import = "FreeAddrInfoExW", .signature = "\x00\x01\x01\x0f\x11\xb4\x05" } },
    .{ "getnameinfo", MethodRecord{ .library = "WS2_32", .import = "getnameinfo", .signature = "\x00\x07\x08\x0f\x11\xb3\x71\x11\xb4\x09\x11\x3d\x09\x11\x3d\x09\x08" } },
    .{ "GetNameInfoW", MethodRecord{ .library = "WS2_32", .import = "GetNameInfoW", .signature = "\x00\x07\x08\x0f\x11\xb3\x71\x11\xb4\x09\x11\x05\x09\x11\x05\x09\x08" } },
    .{ "inet_pton", MethodRecord{ .library = "WS2_32", .import = "inet_pton", .signature = "\x00\x03\x08\x08\x11\x3d\x0f\x01" } },
    .{ "InetPtonW", MethodRecord{ .library = "WS2_32", .import = "InetPtonW", .signature = "\x00\x03\x08\x08\x11\x05\x0f\x01" } },
    .{ "inet_ntop", MethodRecord{ .library = "WS2_32", .import = "inet_ntop", .signature = "\x00\x04\x11\x3d\x08\x0f\x01\x11\x3d\x19" } },
    .{ "InetNtopW", MethodRecord{ .library = "WS2_32", .import = "InetNtopW", .signature = "\x00\x04\x11\x05\x08\x0f\x01\x11\x05\x19" } },
    .{ "WSASetSocketSecurity", MethodRecord{ .library = "fwpuclnt", .import = "WSASetSocketSecurity", .signature = "\x00\x05\x08\x11\xb3\x51\x0f\x11\xb4\x0d\x09\x0f\x11\x8b\xed\x12\xb3\xa5" } },
    .{ "WSAQuerySocketSecurity", MethodRecord{ .library = "fwpuclnt", .import = "WSAQuerySocketSecurity", .signature = "\x00\x07\x08\x11\xb3\x51\x0f\x11\xb4\x11\x09\x0f\x11\xb4\x15\x0f\x09\x0f\x11\x8b\xed\x12\xb3\xa5" } },
    .{ "WSASetSocketPeerTargetName", MethodRecord{ .library = "fwpuclnt", .import = "WSASetSocketPeerTargetName", .signature = "\x00\x05\x08\x11\xb3\x51\x0f\x11\xb4\x19\x09\x0f\x11\x8b\xed\x12\xb3\xa5" } },
    .{ "WSADeleteSocketPeerTargetName", MethodRecord{ .library = "fwpuclnt", .import = "WSADeleteSocketPeerTargetName", .signature = "\x00\x05\x08\x11\xb3\x51\x0f\x11\xb3\x71\x09\x0f\x11\x8b\xed\x12\xb3\xa5" } },
    .{ "WSAImpersonateSocketPeer", MethodRecord{ .library = "fwpuclnt", .import = "WSAImpersonateSocketPeer", .signature = "\x00\x03\x08\x11\xb3\x51\x0f\x11\xb3\x71\x09" } },
    .{ "WSARevertImpersonation", MethodRecord{ .library = "fwpuclnt", .import = "WSARevertImpersonation", .signature = "\x00\x00\x08" } },
    .{ "SetSocketMediaStreamingMode", MethodRecord{ .library = "Windows.Networking", .import = "SetSocketMediaStreamingMode", .signature = "\x00\x01\x11\x79\x11\x59" } },
    .{ "WSCWriteProviderOrder", MethodRecord{ .library = "WS2_32", .import = "WSCWriteProviderOrder", .signature = "\x00\x02\x08\x0f\x09\x09" } },
    .{ "WSCWriteNameSpaceOrder", MethodRecord{ .library = "WS2_32", .import = "WSCWriteNameSpaceOrder", .signature = "\x00\x02\x08\x0f\x11\x0d\x09" } },
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
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0xbed => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED" },
        0xd15 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WAIT_EVENT" },
        0x16e9 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FARPROC" },
        0x17e5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSA_ERROR" },
        0x17ed => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SET_SERVICE_OPERATION" },
        0x17f1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SEND_RECV_FLAGS" },
        0x17fd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WINSOCK_SHUTDOWN_HOW" },
        0x1801 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WINSOCK_SOCKET_TYPE" },
        0x30c5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKET_ADDRESS" },
        0x3351 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKET" },
        0x3355 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSAEVENT" },
        0x3359 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSAPROTOCOL_INFOW" },
        0x335d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSC_PROVIDER_INFO_TYPE" },
        0x3361 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSANAMESPACE_INFOW" },
        0x3365 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSANAMESPACE_INFOEXW" },
        0x3369 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "BLOB" },
        0x336d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "FD_SET" },
        0x3371 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKADDR" },
        0x3375 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "IN_ADDR" },
        0x3379 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "TIMEVAL" },
        0x337d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "HOSTENT" },
        0x3381 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SERVENT" },
        0x3385 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "PROTOENT" },
        0x3389 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSADATA" },
        0x338d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "LPCONDITIONPROC" },
        0x3391 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSABUF" },
        0x3395 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "QOS" },
        0x3399 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKET_ADDRESS_LIST" },
        0x339d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSAPROTOCOL_INFOA" },
        0x33a1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSANETWORKEVENTS" },
        0x33a5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "LPWSAOVERLAPPED_COMPLETION_ROUTINE" },
        0x33a9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSAMSG" },
        0x33ad => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSAQUERYSETA" },
        0x33b1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSAQUERYSETW" },
        0x33b5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSACOMPLETION" },
        0x33b9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSASERVICECLASSINFOA" },
        0x33bd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSASERVICECLASSINFOW" },
        0x33c1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSANAMESPACE_INFOA" },
        0x33c5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSANAMESPACE_INFOEXA" },
        0x33c9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSAESETSERVICEOP" },
        0x33cd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "WSAPOLLFD" },
        0x33d1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCK_NOTIFY_REGISTRATION" },
        0x33d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED_ENTRY" },
        0x33d9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "IN6_ADDR" },
        0x33dd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "DL_EUI48" },
        0x33e1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "TRANSMIT_FILE_BUFFERS" },
        0x33e5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "NSPV2_ROUTINE" },
        0x33e9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SERVICE_ASYNC_INFO" },
        0x33ed => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SERVICE_INFOA" },
        0x33f1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SERVICE_INFOW" },
        0x33f5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "ADDRINFOA" },
        0x33f9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "ADDRINFOW" },
        0x33fd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "ADDRINFOEXA" },
        0x3401 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "LPLOOKUPSERVICE_COMPLETION_ROUTINE" },
        0x3405 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "ADDRINFOEXW" },
        0x3409 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "socklen_t" },
        0x340d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKET_SECURITY_SETTINGS" },
        0x3411 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKET_SECURITY_QUERY_TEMPLATE" },
        0x3415 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKET_SECURITY_QUERY_INFO" },
        0x3419 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKET_PEER_TARGET_NAME" },
        else => null,
    };
}

pub const WSA_IO_PENDING = 997;
pub const WSA_IO_INCOMPLETE = 996;
pub const WSA_INVALID_HANDLE = 6;
pub const WSA_INVALID_PARAMETER = 87;
pub const WSA_NOT_ENOUGH_MEMORY = 8;
pub const WSA_OPERATION_ABORTED = 995;
pub const WSA_WAIT_EVENT_0 = 0;
pub const WSA_WAIT_IO_COMPLETION = 192;
pub const WSABASEERR = 10000;
pub const WSAEINTR = 10004;
pub const WSAEBADF = 10009;
pub const WSAEACCES = 10013;
pub const WSAEFAULT = 10014;
pub const WSAEINVAL = 10022;
pub const WSAEMFILE = 10024;
pub const WSAEWOULDBLOCK = 10035;
pub const WSAEINPROGRESS = 10036;
pub const WSAEALREADY = 10037;
pub const WSAENOTSOCK = 10038;
pub const WSAEDESTADDRREQ = 10039;
pub const WSAEMSGSIZE = 10040;
pub const WSAEPROTOTYPE = 10041;
pub const WSAENOPROTOOPT = 10042;
pub const WSAEPROTONOSUPPORT = 10043;
pub const WSAESOCKTNOSUPPORT = 10044;
pub const WSAEOPNOTSUPP = 10045;
pub const WSAEPFNOSUPPORT = 10046;
pub const WSAEAFNOSUPPORT = 10047;
pub const WSAEADDRINUSE = 10048;
pub const WSAEADDRNOTAVAIL = 10049;
pub const WSAENETDOWN = 10050;
pub const WSAENETUNREACH = 10051;
pub const WSAENETRESET = 10052;
pub const WSAECONNABORTED = 10053;
pub const WSAECONNRESET = 10054;
pub const WSAENOBUFS = 10055;
pub const WSAEISCONN = 10056;
pub const WSAENOTCONN = 10057;
pub const WSAESHUTDOWN = 10058;
pub const WSAETOOMANYREFS = 10059;
pub const WSAETIMEDOUT = 10060;
pub const WSAECONNREFUSED = 10061;
pub const WSAELOOP = 10062;
pub const WSAENAMETOOLONG = 10063;
pub const WSAEHOSTDOWN = 10064;
pub const WSAEHOSTUNREACH = 10065;
pub const WSAENOTEMPTY = 10066;
pub const WSAEPROCLIM = 10067;
pub const WSAEUSERS = 10068;
pub const WSAEDQUOT = 10069;
pub const WSAESTALE = 10070;
pub const WSAEREMOTE = 10071;
pub const WSASYSNOTREADY = 10091;
pub const WSAVERNOTSUPPORTED = 10092;
pub const WSANOTINITIALISED = 10093;
pub const WSAEDISCON = 10101;
pub const WSAENOMORE = 10102;
pub const WSAECANCELLED = 10103;
pub const WSAEINVALIDPROCTABLE = 10104;
pub const WSAEINVALIDPROVIDER = 10105;
pub const WSAEPROVIDERFAILEDINIT = 10106;
pub const WSASYSCALLFAILURE = 10107;
pub const WSASERVICE_NOT_FOUND = 10108;
pub const WSATYPE_NOT_FOUND = 10109;
pub const WSA_E_NO_MORE = 10110;
pub const WSA_E_CANCELLED = 10111;
pub const WSAEREFUSED = 10112;
pub const WSAHOST_NOT_FOUND = 11001;
pub const WSATRY_AGAIN = 11002;
pub const WSANO_RECOVERY = 11003;
pub const WSANO_DATA = 11004;
pub const WSA_QOS_RECEIVERS = 11005;
pub const WSA_QOS_SENDERS = 11006;
pub const WSA_QOS_NO_SENDERS = 11007;
pub const WSA_QOS_NO_RECEIVERS = 11008;
pub const WSA_QOS_REQUEST_CONFIRMED = 11009;
pub const WSA_QOS_ADMISSION_FAILURE = 11010;
pub const WSA_QOS_POLICY_FAILURE = 11011;
pub const WSA_QOS_BAD_STYLE = 11012;
pub const WSA_QOS_BAD_OBJECT = 11013;
pub const WSA_QOS_TRAFFIC_CTRL_ERROR = 11014;
pub const WSA_QOS_GENERIC_ERROR = 11015;
pub const WSA_QOS_ESERVICETYPE = 11016;
pub const WSA_QOS_EFLOWSPEC = 11017;
pub const WSA_QOS_EPROVSPECBUF = 11018;
pub const WSA_QOS_EFILTERSTYLE = 11019;
pub const WSA_QOS_EFILTERTYPE = 11020;
pub const WSA_QOS_EFILTERCOUNT = 11021;
pub const WSA_QOS_EOBJLENGTH = 11022;
pub const WSA_QOS_EFLOWCOUNT = 11023;
pub const WSA_QOS_EUNKOWNPSOBJ = 11024;
pub const WSA_QOS_EPOLICYOBJ = 11025;
pub const WSA_QOS_EFLOWDESC = 11026;
pub const WSA_QOS_EPSFLOWSPEC = 11027;
pub const WSA_QOS_EPSFILTERSPEC = 11028;
pub const WSA_QOS_ESDMODEOBJ = 11029;
pub const WSA_QOS_ESHAPERATEOBJ = 11030;
pub const WSA_QOS_RESERVED_PETYPE = 11031;
pub const WSA_SECURE_HOST_NOT_FOUND = 11032;
pub const WSA_IPSEC_NAME_POLICY_ERROR = 11033;
pub const AF_INET = 2;
pub const AF_INET6 = 23;
pub const AF_UNSPEC = 0;
pub const SERVICE_REGISTER = 1;
pub const SERVICE_DEREGISTER = 2;
pub const SERVICE_FLUSH = 3;
pub const SERVICE_ADD_TYPE = 4;
pub const SERVICE_DELETE_TYPE = 5;
pub const MSG_OOB = 1;
pub const MSG_PEEK = 2;
pub const MSG_DONTROUTE = 4;
pub const MSG_WAITALL = 8;
pub const MSG_PUSH_IMMEDIATE = 32;
pub const RESOURCEDISPLAYTYPE_DOMAIN = 1;
pub const RESOURCEDISPLAYTYPE_FILE = 4;
pub const RESOURCEDISPLAYTYPE_GENERIC = 0;
pub const RESOURCEDISPLAYTYPE_GROUP = 5;
pub const RESOURCEDISPLAYTYPE_SERVER = 2;
pub const RESOURCEDISPLAYTYPE_SHARE = 3;
pub const RESOURCEDISPLAYTYPE_TREE = 10;
pub const POLLRDNORM = 256;
pub const POLLRDBAND = 512;
pub const POLLIN = 768;
pub const POLLPRI = 1024;
pub const POLLWRNORM = 16;
pub const POLLOUT = 16;
pub const POLLWRBAND = 32;
pub const POLLERR = 1;
pub const POLLHUP = 2;
pub const POLLNVAL = 4;
pub const SD_RECEIVE = 0;
pub const SD_SEND = 1;
pub const SD_BOTH = 2;
pub const SOCK_STREAM = 1;
pub const SOCK_DGRAM = 2;
pub const SOCK_RAW = 3;
pub const SOCK_RDM = 4;
pub const SOCK_SEQPACKET = 5;
pub const SIO_RCVALL = 2550136833;
pub const SIO_RCVALL_MCAST = 2550136834;
pub const SIO_RCVALL_IGMPMCAST = 2550136835;
pub const SIO_KEEPALIVE_VALS = 2550136836;
pub const SIO_ABSORB_RTRALERT = 2550136837;
pub const SIO_UCAST_IF = 2550136838;
pub const SIO_LIMIT_BROADCASTS = 2550136839;
pub const SIO_INDEX_BIND = 2550136840;
pub const SIO_INDEX_MCASTIF = 2550136841;
pub const SIO_INDEX_ADD_MCAST = 2550136842;
pub const SIO_INDEX_DEL_MCAST = 2550136843;
pub const SIO_RCVALL_MCAST_IF = 2550136845;
pub const SIO_RCVALL_IF = 2550136846;
pub const SIO_LOOPBACK_FAST_PATH = 2550136848;
pub const SIO_TCP_INITIAL_RTO = 2550136849;
pub const SIO_APPLY_TRANSPORT_SETTING = 2550136851;
pub const SIO_QUERY_TRANSPORT_SETTING = 2550136852;
pub const SIO_TCP_SET_ICW = 2550136854;
pub const SIO_TCP_SET_ACK_FREQUENCY = 2550136855;
pub const SIO_SET_PRIORITY_HINT = 2550136856;
pub const SIO_PRIORITY_HINT = 2550136856;
pub const SIO_TCP_INFO = 3623878695;
pub const SIO_CPU_AFFINITY = 2550136853;
pub const SIO_TIMESTAMPING = 2550137067;
pub const TIMESTAMPING_FLAG_RX = 1;
pub const TIMESTAMPING_FLAG_TX = 2;
pub const SO_TIMESTAMP = 12298;
pub const SO_TIMESTAMP_ID = 12299;
pub const SIO_GET_TX_TIMESTAMP = 2550137066;
pub const TCP_INITIAL_RTO_UNSPECIFIED_MAX_SYN_RETRANSMISSIONS = 65535;
pub const TCP_INITIAL_RTO_DEFAULT_RTT = 0;
pub const TCP_INITIAL_RTO_DEFAULT_MAX_SYN_RETRANSMISSIONS = 0;
pub const TCP_INITIAL_RTO_NO_SYN_RETRANSMISSIONS = 65534;
pub const SIO_ACQUIRE_PORT_RESERVATION = 2550136932;
pub const SIO_RELEASE_PORT_RESERVATION = 2550136933;
pub const SIO_ASSOCIATE_PORT_RESERVATION = 2550136934;
pub const SIO_SET_SECURITY = 2550137032;
pub const SIO_QUERY_SECURITY = 3623878857;
pub const SIO_SET_PEER_TARGET_NAME = 2550137034;
pub const SIO_DELETE_PEER_TARGET_NAME = 2550137035;
pub const SIO_QUERY_WFP_CONNECTION_REDIRECT_RECORDS = 2550137052;
pub const SIO_QUERY_WFP_CONNECTION_REDIRECT_CONTEXT = 2550137053;
pub const SIO_SET_WFP_CONNECTION_REDIRECT_RECORDS = 2550137054;
pub const SIO_SOCKET_USAGE_NOTIFICATION = 2550137036;
pub const SOCKET_SETTINGS_GUARANTEE_ENCRYPTION = 1;
pub const SOCKET_SETTINGS_ALLOW_INSECURE = 2;
pub const SOCKET_SETTINGS_IPSEC_SKIP_FILTER_INSTANTIATION = 1;
pub const SOCKET_SETTINGS_IPSEC_OPTIONAL_PEER_NAME_VERIFICATION = 2;
pub const SOCKET_SETTINGS_IPSEC_ALLOW_FIRST_INBOUND_PKT_UNENCRYPTED = 4;
pub const SOCKET_SETTINGS_IPSEC_PEER_NAME_IS_RAW_FORMAT = 8;
pub const SOCKET_QUERY_IPSEC2_ABORT_CONNECTION_ON_FIELD_CHANGE = 1;
pub const SOCKET_QUERY_IPSEC2_FIELD_MASK_MM_SA_ID = 1;
pub const SOCKET_QUERY_IPSEC2_FIELD_MASK_QM_SA_ID = 2;
pub const SOCKET_INFO_CONNECTION_SECURED = 1;
pub const SOCKET_INFO_CONNECTION_ENCRYPTED = 2;
pub const SOCKET_INFO_CONNECTION_IMPERSONATED = 4;
pub const SIO_QUERY_WFP_ALE_ENDPOINT_HANDLE = 1476395213;
pub const SIO_QUERY_RSS_SCALABILITY_INFO = 1476395218;
pub const IN4ADDR_ANY = 0;
pub const IN4ADDR_LOOPBACK = 16777343;
pub const IN4ADDR_BROADCAST = 4294967295;
pub const IN4ADDR_LOOPBACKPREFIX_LENGTH = 8;
pub const IN4ADDR_LINKLOCALPREFIX_LENGTH = 16;
pub const IN4ADDR_MULTICASTPREFIX_LENGTH = 4;
pub const SIO_SET_COMPATIBILITY_MODE = 2550137132;
pub const RIO_MSG_DONT_NOTIFY = 1;
pub const RIO_MSG_DEFER = 2;
pub const RIO_MSG_WAITALL = 4;
pub const RIO_MSG_COMMIT_ONLY = 8;
pub const RIO_MAX_CQ_SIZE = 134217728;
pub const RIO_CORRUPT_CQ = 4294967295;
pub const AF_UNIX = 1;
pub const AF_IMPLINK = 3;
pub const AF_PUP = 4;
pub const AF_CHAOS = 5;
pub const AF_NS = 6;
pub const AF_IPX = 6;
pub const AF_ISO = 7;
pub const AF_OSI = 7;
pub const AF_ECMA = 8;
pub const AF_DATAKIT = 9;
pub const AF_CCITT = 10;
pub const AF_SNA = 11;
pub const AF_DECnet = 12;
pub const AF_DLI = 13;
pub const AF_LAT = 14;
pub const AF_HYLINK = 15;
pub const AF_APPLETALK = 16;
pub const AF_NETBIOS = 17;
pub const AF_VOICEVIEW = 18;
pub const AF_FIREFOX = 19;
pub const AF_UNKNOWN1 = 20;
pub const AF_BAN = 21;
pub const AF_ATM = 22;
pub const AF_CLUSTER = 24;
pub const AF_12844 = 25;
pub const AF_IRDA = 26;
pub const AF_NETDES = 28;
pub const AF_MAX = 29;
pub const AF_TCNPROCESS = 29;
pub const AF_TCNMESSAGE = 30;
pub const AF_ICLFXBM = 31;
pub const AF_LINK = 33;
pub const AF_HYPERV = 34;
pub const SOL_SOCKET = 65535;
pub const SOL_IP = 65531;
pub const SOL_IPV6 = 65530;
pub const SO_DEBUG = 1;
pub const SO_ACCEPTCONN = 2;
pub const SO_REUSEADDR = 4;
pub const SO_KEEPALIVE = 8;
pub const SO_DONTROUTE = 16;
pub const SO_BROADCAST = 32;
pub const SO_USELOOPBACK = 64;
pub const SO_LINGER = 128;
pub const SO_OOBINLINE = 256;
pub const SO_SNDBUF = 4097;
pub const SO_RCVBUF = 4098;
pub const SO_SNDLOWAT = 4099;
pub const SO_RCVLOWAT = 4100;
pub const SO_SNDTIMEO = 4101;
pub const SO_RCVTIMEO = 4102;
pub const SO_ERROR = 4103;
pub const SO_TYPE = 4104;
pub const SO_BSP_STATE = 4105;
pub const SO_GROUP_ID = 8193;
pub const SO_GROUP_PRIORITY = 8194;
pub const SO_MAX_MSG_SIZE = 8195;
pub const SO_CONDITIONAL_ACCEPT = 12290;
pub const SO_PAUSE_ACCEPT = 12291;
pub const SO_COMPARTMENT_ID = 12292;
pub const SO_RANDOMIZE_PORT = 12293;
pub const SO_PORT_SCALABILITY = 12294;
pub const SO_REUSE_UNICASTPORT = 12295;
pub const SO_REUSE_MULTICASTPORT = 12296;
pub const SO_ORIGINAL_DST = 12303;
pub const IP6T_SO_ORIGINAL_DST = 12303;
pub const SO_RECEIVED_HOPLIMIT = 12304;
pub const SO_RECEIVED_PROCESSOR = 12305;
pub const WSK_SO_BASE = 16384;
pub const TCP_NODELAY = 1;
pub const _SS_MAXSIZE = 128;
pub const IOC_UNIX = 0;
pub const IOC_WS2 = 134217728;
pub const IOC_PROTOCOL = 268435456;
pub const IOC_VENDOR = 402653184;
pub const SIO_ASSOCIATE_HANDLE = 2281701377;
pub const SIO_ENABLE_CIRCULAR_QUEUEING = 671088642;
pub const SIO_FIND_ROUTE = 1207959555;
pub const SIO_FLUSH = 671088644;
pub const SIO_GET_BROADCAST_ADDRESS = 1207959557;
pub const SIO_GET_EXTENSION_FUNCTION_POINTER = 3355443206;
pub const SIO_GET_QOS = 3355443207;
pub const SIO_GET_GROUP_QOS = 3355443208;
pub const SIO_MULTIPOINT_LOOPBACK = 2281701385;
pub const SIO_MULTICAST_SCOPE = 2281701386;
pub const SIO_SET_QOS = 2281701387;
pub const SIO_SET_GROUP_QOS = 2281701388;
pub const SIO_TRANSLATE_HANDLE = 3355443213;
pub const SIO_ROUTING_INTERFACE_QUERY = 3355443220;
pub const SIO_ROUTING_INTERFACE_CHANGE = 2281701397;
pub const SIO_ADDRESS_LIST_QUERY = 1207959574;
pub const SIO_ADDRESS_LIST_CHANGE = 671088663;
pub const SIO_QUERY_TARGET_PNP_HANDLE = 1207959576;
pub const SIO_QUERY_RSS_PROCESSOR_INFO = 1207959589;
pub const SIO_ADDRESS_LIST_SORT = 3355443225;
pub const SIO_RESERVED_1 = 2281701402;
pub const SIO_RESERVED_2 = 2281701409;
pub const SIO_GET_MULTIPLE_EXTENSION_FUNCTION_POINTER = 3355443236;
pub const IPPORT_TCPMUX = 1;
pub const IPPORT_ECHO = 7;
pub const IPPORT_DISCARD = 9;
pub const IPPORT_SYSTAT = 11;
pub const IPPORT_DAYTIME = 13;
pub const IPPORT_NETSTAT = 15;
pub const IPPORT_QOTD = 17;
pub const IPPORT_MSP = 18;
pub const IPPORT_CHARGEN = 19;
pub const IPPORT_FTP_DATA = 20;
pub const IPPORT_FTP = 21;
pub const IPPORT_TELNET = 23;
pub const IPPORT_SMTP = 25;
pub const IPPORT_TIMESERVER = 37;
pub const IPPORT_NAMESERVER = 42;
pub const IPPORT_WHOIS = 43;
pub const IPPORT_MTP = 57;
pub const IPPORT_TFTP = 69;
pub const IPPORT_RJE = 77;
pub const IPPORT_FINGER = 79;
pub const IPPORT_TTYLINK = 87;
pub const IPPORT_SUPDUP = 95;
pub const IPPORT_POP3 = 110;
pub const IPPORT_NTP = 123;
pub const IPPORT_EPMAP = 135;
pub const IPPORT_NETBIOS_NS = 137;
pub const IPPORT_NETBIOS_DGM = 138;
pub const IPPORT_NETBIOS_SSN = 139;
pub const IPPORT_IMAP = 143;
pub const IPPORT_SNMP = 161;
pub const IPPORT_SNMP_TRAP = 162;
pub const IPPORT_IMAP3 = 220;
pub const IPPORT_LDAP = 389;
pub const IPPORT_HTTPS = 443;
pub const IPPORT_MICROSOFT_DS = 445;
pub const IPPORT_EXECSERVER = 512;
pub const IPPORT_LOGINSERVER = 513;
pub const IPPORT_CMDSERVER = 514;
pub const IPPORT_EFSSERVER = 520;
pub const IPPORT_BIFFUDP = 512;
pub const IPPORT_WHOSERVER = 513;
pub const IPPORT_ROUTESERVER = 520;
pub const IPPORT_RESERVED = 1024;
pub const IPPORT_REGISTERED_MIN = 1024;
pub const IPPORT_REGISTERED_MAX = 49151;
pub const IPPORT_DYNAMIC_MIN = 49152;
pub const IPPORT_DYNAMIC_MAX = 65535;
pub const IN_CLASSA_NET = 4278190080;
pub const IN_CLASSA_NSHIFT = 24;
pub const IN_CLASSA_HOST = 16777215;
pub const IN_CLASSA_MAX = 128;
pub const IN_CLASSB_NET = 4294901760;
pub const IN_CLASSB_NSHIFT = 16;
pub const IN_CLASSB_HOST = 65535;
pub const IN_CLASSB_MAX = 65536;
pub const IN_CLASSC_NET = 4294967040;
pub const IN_CLASSC_NSHIFT = 8;
pub const IN_CLASSC_HOST = 255;
pub const IN_CLASSD_NET = 4026531840;
pub const IN_CLASSD_NSHIFT = 28;
pub const IN_CLASSD_HOST = 268435455;
pub const INADDR_LOOPBACK = 2130706433;
pub const INADDR_NONE = 4294967295;
pub const IOCPARM_MASK = 127;
pub const IOC_VOID = 536870912;
pub const IOC_OUT = 1073741824;
pub const IOC_IN = 2147483648;
pub const MSG_TRUNC = 256;
pub const MSG_CTRUNC = 512;
pub const MSG_BCAST = 1024;
pub const MSG_MCAST = 2048;
pub const MSG_ERRQUEUE = 4096;
pub const AI_PASSIVE = 1;
pub const AI_CANONNAME = 2;
pub const AI_NUMERICHOST = 4;
pub const AI_NUMERICSERV = 8;
pub const AI_DNS_ONLY = 16;
pub const AI_FORCE_CLEAR_TEXT = 32;
pub const AI_BYPASS_DNS_CACHE = 64;
pub const AI_RETURN_TTL = 128;
pub const AI_ALL = 256;
pub const AI_ADDRCONFIG = 1024;
pub const AI_V4MAPPED = 2048;
pub const AI_NON_AUTHORITATIVE = 16384;
pub const AI_SECURE = 32768;
pub const AI_RETURN_PREFERRED_NAMES = 65536;
pub const AI_FQDN = 131072;
pub const AI_FILESERVER = 262144;
pub const AI_DISABLE_IDN_ENCODING = 524288;
pub const AI_SECURE_WITH_FALLBACK = 1048576;
pub const AI_EXCLUSIVE_CUSTOM_SERVERS = 2097152;
pub const AI_RETURN_RESPONSE_FLAGS = 268435456;
pub const AI_REQUIRE_SECURE = 536870912;
pub const AI_RESOLUTION_HANDLE = 1073741824;
pub const AI_EXTENDED = 2147483648;
pub const ADDRINFOEX_VERSION_2 = 2;
pub const ADDRINFOEX_VERSION_3 = 3;
pub const ADDRINFOEX_VERSION_4 = 4;
pub const ADDRINFOEX_VERSION_5 = 5;
pub const ADDRINFOEX_VERSION_6 = 6;
pub const ADDRINFOEX_VERSION_7 = 7;
pub const AI_DNS_SERVER_TYPE_UDP = 1;
pub const AI_DNS_SERVER_TYPE_DOH = 2;
pub const AI_DNS_SERVER_TYPE_DOT = 3;
pub const AI_DNS_SERVER_UDP_FALLBACK = 1;
pub const AI_DNS_RESPONSE_SECURE = 1;
pub const AI_DNS_RESPONSE_HOSTFILE = 2;
pub const AI_EXTRA_DNSSEC_REQUIRED = 1;
pub const NS_ALL = 0;
pub const NS_SAP = 1;
pub const NS_NDS = 2;
pub const NS_PEER_BROWSE = 3;
pub const NS_SLP = 5;
pub const NS_DHCP = 6;
pub const NS_TCPIP_LOCAL = 10;
pub const NS_TCPIP_HOSTS = 11;
pub const NS_DNS = 12;
pub const NS_NETBT = 13;
pub const NS_WINS = 14;
pub const NS_NLA = 15;
pub const NS_NBP = 20;
pub const NS_MS = 30;
pub const NS_STDA = 31;
pub const NS_NTDS = 32;
pub const NS_EMAIL = 37;
pub const NS_X500 = 40;
pub const NS_NIS = 41;
pub const NS_NISPLUS = 42;
pub const NS_WRQ = 50;
pub const NS_NETDES = 60;
pub const NI_NOFQDN = 1;
pub const NI_NUMERICHOST = 2;
pub const NI_NAMEREQD = 4;
pub const NI_NUMERICSERV = 8;
pub const NI_DGRAM = 16;
pub const NI_MAXHOST = 1025;
pub const NI_MAXSERV = 32;
pub const IFF_UP = 1;
pub const IFF_BROADCAST = 2;
pub const IFF_LOOPBACK = 4;
pub const IFF_POINTTOPOINT = 8;
pub const IFF_MULTICAST = 16;
pub const IP_OPTIONS = 1;
pub const IP_HDRINCL = 2;
pub const IP_TOS = 3;
pub const IP_TTL = 4;
pub const IP_MULTICAST_IF = 9;
pub const IP_MULTICAST_TTL = 10;
pub const IP_MULTICAST_LOOP = 11;
pub const IP_ADD_MEMBERSHIP = 12;
pub const IP_DROP_MEMBERSHIP = 13;
pub const IP_DONTFRAGMENT = 14;
pub const IP_ADD_SOURCE_MEMBERSHIP = 15;
pub const IP_DROP_SOURCE_MEMBERSHIP = 16;
pub const IP_BLOCK_SOURCE = 17;
pub const IP_UNBLOCK_SOURCE = 18;
pub const IP_PKTINFO = 19;
pub const IP_HOPLIMIT = 21;
pub const IP_RECVTTL = 21;
pub const IP_RECEIVE_BROADCAST = 22;
pub const IP_RECVIF = 24;
pub const IP_RECVDSTADDR = 25;
pub const IP_IFLIST = 28;
pub const IP_ADD_IFLIST = 29;
pub const IP_DEL_IFLIST = 30;
pub const IP_UNICAST_IF = 31;
pub const IP_RTHDR = 32;
pub const IP_GET_IFLIST = 33;
pub const IP_RECVRTHDR = 38;
pub const IP_TCLASS = 39;
pub const IP_RECVTCLASS = 40;
pub const IP_RECVTOS = 40;
pub const IP_ORIGINAL_ARRIVAL_IF = 47;
pub const IP_ECN = 50;
pub const IP_RECVECN = 50;
pub const IP_PKTINFO_EX = 51;
pub const IP_WFP_REDIRECT_RECORDS = 60;
pub const IP_WFP_REDIRECT_CONTEXT = 70;
pub const IP_MTU_DISCOVER = 71;
pub const IP_MTU = 73;
pub const IP_NRT_INTERFACE = 74;
pub const IP_RECVERR = 75;
pub const IP_USER_MTU = 76;
pub const IP_UNSPECIFIED_TYPE_OF_SERVICE = -1;
pub const IP_UNSPECIFIED_USER_MTU = 4294967295;
pub const IN6ADDR_LINKLOCALPREFIX_LENGTH = 64;
pub const IN6ADDR_MULTICASTPREFIX_LENGTH = 8;
pub const IN6ADDR_SOLICITEDNODEMULTICASTPREFIX_LENGTH = 104;
pub const IN6ADDR_V4MAPPEDPREFIX_LENGTH = 96;
pub const IN6ADDR_6TO4PREFIX_LENGTH = 16;
pub const IN6ADDR_TEREDOPREFIX_LENGTH = 32;
pub const MCAST_JOIN_GROUP = 41;
pub const MCAST_LEAVE_GROUP = 42;
pub const MCAST_BLOCK_SOURCE = 43;
pub const MCAST_UNBLOCK_SOURCE = 44;
pub const MCAST_JOIN_SOURCE_GROUP = 45;
pub const MCAST_LEAVE_SOURCE_GROUP = 46;
pub const IPV6_HOPOPTS = 1;
pub const IPV6_HDRINCL = 2;
pub const IPV6_UNICAST_HOPS = 4;
pub const IPV6_MULTICAST_IF = 9;
pub const IPV6_MULTICAST_HOPS = 10;
pub const IPV6_MULTICAST_LOOP = 11;
pub const IPV6_ADD_MEMBERSHIP = 12;
pub const IPV6_JOIN_GROUP = 12;
pub const IPV6_DROP_MEMBERSHIP = 13;
pub const IPV6_LEAVE_GROUP = 13;
pub const IPV6_DONTFRAG = 14;
pub const IPV6_PKTINFO = 19;
pub const IPV6_HOPLIMIT = 21;
pub const IPV6_PROTECTION_LEVEL = 23;
pub const IPV6_RECVIF = 24;
pub const IPV6_RECVDSTADDR = 25;
pub const IPV6_CHECKSUM = 26;
pub const IPV6_V6ONLY = 27;
pub const IPV6_IFLIST = 28;
pub const IPV6_ADD_IFLIST = 29;
pub const IPV6_DEL_IFLIST = 30;
pub const IPV6_UNICAST_IF = 31;
pub const IPV6_RTHDR = 32;
pub const IPV6_GET_IFLIST = 33;
pub const IPV6_RECVRTHDR = 38;
pub const IPV6_TCLASS = 39;
pub const IPV6_RECVTCLASS = 40;
pub const IPV6_ECN = 50;
pub const IPV6_RECVECN = 50;
pub const IPV6_PKTINFO_EX = 51;
pub const IPV6_WFP_REDIRECT_RECORDS = 60;
pub const IPV6_WFP_REDIRECT_CONTEXT = 70;
pub const IPV6_MTU_DISCOVER = 71;
pub const IPV6_MTU = 72;
pub const IPV6_NRT_INTERFACE = 74;
pub const IPV6_RECVERR = 75;
pub const IPV6_USER_MTU = 76;
pub const IP_UNSPECIFIED_HOP_LIMIT = -1;
pub const IP_PROTECTION_LEVEL = 23;
pub const PROTECTION_LEVEL_UNRESTRICTED = 10;
pub const PROTECTION_LEVEL_EDGERESTRICTED = 20;
pub const PROTECTION_LEVEL_RESTRICTED = 30;
pub const PROTECTION_LEVEL_DEFAULT = 20;
pub const INET_ADDRSTRLEN = 22;
pub const INET6_ADDRSTRLEN = 65;
pub const TCP_OFFLOAD_NO_PREFERENCE = 0;
pub const TCP_OFFLOAD_NOT_PREFERRED = 1;
pub const TCP_OFFLOAD_PREFERRED = 2;
pub const TCP_EXPEDITED_1122 = 2;
pub const TCP_KEEPALIVE = 3;
pub const TCP_MAXSEG = 4;
pub const TCP_MAXRT = 5;
pub const TCP_STDURG = 6;
pub const TCP_NOURG = 7;
pub const TCP_ATMARK = 8;
pub const TCP_NOSYNRETRIES = 9;
pub const TCP_TIMESTAMPS = 10;
pub const TCP_OFFLOAD_PREFERENCE = 11;
pub const TCP_CONGESTION_ALGORITHM = 12;
pub const TCP_DELAY_FIN_ACK = 13;
pub const TCP_MAXRTMS = 14;
pub const TCP_FASTOPEN = 15;
pub const TCP_KEEPCNT = 16;
pub const TCP_KEEPIDLE = 3;
pub const TCP_KEEPINTVL = 17;
pub const TCP_FAIL_CONNECT_ON_ICMP_ERROR = 18;
pub const TCP_ICMP_ERROR_INFO = 19;
pub const UDP_SEND_MSG_SIZE = 2;
pub const UDP_RECV_MAX_COALESCED_SIZE = 3;
pub const UDP_COALESCED_INFO = 3;
pub const WINDOWS_AF_IRDA = 26;
pub const WINDOWS_PF_IRDA = 26;
pub const WCE_AF_IRDA = 22;
pub const WCE_PF_IRDA = 22;
pub const IRDA_PROTO_SOCK_STREAM = 1;
pub const PF_IRDA = 26;
pub const SOL_IRLMP = 255;
pub const IRLMP_ENUMDEVICES = 16;
pub const IRLMP_IAS_SET = 17;
pub const IRLMP_IAS_QUERY = 18;
pub const IRLMP_SEND_PDU_LEN = 19;
pub const IRLMP_EXCLUSIVE_MODE = 20;
pub const IRLMP_IRLPT_MODE = 21;
pub const IRLMP_9WIRE_MODE = 22;
pub const IRLMP_TINYTP_MODE = 23;
pub const IRLMP_PARAMETERS = 24;
pub const IRLMP_DISCOVERY_MODE = 25;
pub const IRLMP_SHARP_MODE = 32;
pub const IAS_ATTRIB_NO_CLASS = 16;
pub const IAS_ATTRIB_NO_ATTRIB = 0;
pub const IAS_ATTRIB_INT = 1;
pub const IAS_ATTRIB_OCTETSEQ = 2;
pub const IAS_ATTRIB_STR = 3;
pub const IAS_MAX_USER_STRING = 256;
pub const IAS_MAX_OCTET_STRING = 1024;
pub const IAS_MAX_CLASSNAME = 64;
pub const IAS_MAX_ATTRIBNAME = 256;
pub const LmCharSetASCII = 0;
pub const LmCharSetISO_8859_1 = 1;
pub const LmCharSetISO_8859_2 = 2;
pub const LmCharSetISO_8859_3 = 3;
pub const LmCharSetISO_8859_4 = 4;
pub const LmCharSetISO_8859_5 = 5;
pub const LmCharSetISO_8859_6 = 6;
pub const LmCharSetISO_8859_7 = 7;
pub const LmCharSetISO_8859_8 = 8;
pub const LmCharSetISO_8859_9 = 9;
pub const LmCharSetUNICODE = 255;
pub const LM_BAUD_1200 = 1200;
pub const LM_BAUD_2400 = 2400;
pub const LM_BAUD_9600 = 9600;
pub const LM_BAUD_19200 = 19200;
pub const LM_BAUD_38400 = 38400;
pub const LM_BAUD_57600 = 57600;
pub const LM_BAUD_115200 = 115200;
pub const LM_BAUD_576K = 576000;
pub const LM_BAUD_1152K = 1152000;
pub const LM_BAUD_4M = 4000000;
pub const LM_BAUD_16M = 16000000;
pub const SO_CONNDATA = 28672;
pub const SO_CONNOPT = 28673;
pub const SO_DISCDATA = 28674;
pub const SO_DISCOPT = 28675;
pub const SO_CONNDATALEN = 28676;
pub const SO_CONNOPTLEN = 28677;
pub const SO_DISCDATALEN = 28678;
pub const SO_DISCOPTLEN = 28679;
pub const SO_OPENTYPE = 28680;
pub const SO_SYNCHRONOUS_ALERT = 16;
pub const SO_SYNCHRONOUS_NONALERT = 32;
pub const SO_MAXDG = 28681;
pub const SO_MAXPATHDG = 28682;
pub const SO_UPDATE_ACCEPT_CONTEXT = 28683;
pub const SO_CONNECT_TIME = 28684;
pub const SO_UPDATE_CONNECT_CONTEXT = 28688;
pub const TCP_BSDURGENT = 28672;
pub const SIO_UDP_CONNRESET = 2550136844;
pub const SIO_SOCKET_CLOSE_NOTIFY = 2550136845;
pub const SIO_UDP_NETRESET = 2550136847;
pub const TF_DISCONNECT = 1;
pub const TF_REUSE_SOCKET = 2;
pub const TF_WRITE_BEHIND = 4;
pub const TF_USE_DEFAULT_WORKER = 0;
pub const TF_USE_SYSTEM_THREAD = 16;
pub const TF_USE_KERNEL_APC = 32;
pub const TP_ELEMENT_MEMORY = 1;
pub const TP_ELEMENT_FILE = 2;
pub const TP_ELEMENT_EOP = 4;
pub const TP_DISCONNECT = 1;
pub const TP_REUSE_SOCKET = 2;
pub const TP_USE_DEFAULT_WORKER = 0;
pub const TP_USE_SYSTEM_THREAD = 16;
pub const TP_USE_KERNEL_APC = 32;
pub const DE_REUSE_SOCKET = 2;
pub const NLA_ALLUSERS_NETWORK = 1;
pub const NLA_FRIENDLY_NAME = 2;
pub const SIO_BSP_HANDLE = 1207959579;
pub const SIO_BSP_HANDLE_SELECT = 1207959580;
pub const SIO_BSP_HANDLE_POLL = 1207959581;
pub const SIO_BASE_HANDLE = 1207959586;
pub const SIO_EXT_SELECT = 3355443230;
pub const SIO_EXT_POLL = 3355443231;
pub const SIO_EXT_SENDMSG = 3355443232;
pub const SERVICE_RESOURCE = 1;
pub const SERVICE_SERVICE = 2;
pub const SERVICE_LOCAL = 4;
pub const SERVICE_FLAG_DEFER = 1;
pub const SERVICE_FLAG_HARD = 2;
pub const PROP_COMMENT = 1;
pub const PROP_LOCALE = 2;
pub const PROP_DISPLAY_HINT = 4;
pub const PROP_VERSION = 8;
pub const PROP_START_TIME = 16;
pub const PROP_MACHINE = 32;
pub const PROP_ADDRESSES = 256;
pub const PROP_SD = 512;
pub const PROP_ALL = 2147483648;
pub const SERVICE_ADDRESS_FLAG_RPC_CN = 1;
pub const SERVICE_ADDRESS_FLAG_RPC_DG = 2;
pub const SERVICE_ADDRESS_FLAG_RPC_NB = 4;
pub const NS_DEFAULT = 0;
pub const NS_VNS = 50;
pub const NSTYPE_HIERARCHICAL = 1;
pub const NSTYPE_DYNAMIC = 2;
pub const NSTYPE_ENUMERABLE = 4;
pub const NSTYPE_WORKGROUP = 8;
pub const XP_CONNECTIONLESS = 1;
pub const XP_GUARANTEED_DELIVERY = 2;
pub const XP_GUARANTEED_ORDER = 4;
pub const XP_MESSAGE_ORIENTED = 8;
pub const XP_PSEUDO_STREAM = 16;
pub const XP_GRACEFUL_CLOSE = 32;
pub const XP_EXPEDITED_DATA = 64;
pub const XP_CONNECT_DATA = 128;
pub const XP_DISCONNECT_DATA = 256;
pub const XP_SUPPORTS_BROADCAST = 512;
pub const XP_SUPPORTS_MULTICAST = 1024;
pub const XP_BANDWIDTH_ALLOCATION = 2048;
pub const XP_FRAGMENTATION = 4096;
pub const XP_ENCRYPTS = 8192;
pub const RES_SOFT_SEARCH = 1;
pub const RES_FIND_MULTIPLE = 2;
pub const RES_SERVICE = 4;
pub const SET_SERVICE_PARTIAL_SUCCESS = 1;
pub const FD_SETSIZE = 64;
pub const IMPLINK_IP = 155;
pub const IMPLINK_LOWEXPER = 156;
pub const IMPLINK_HIGHEXPER = 158;
pub const WSADESCRIPTION_LEN = 256;
pub const WSASYS_STATUS_LEN = 128;
pub const IP_DEFAULT_MULTICAST_TTL = 1;
pub const IP_DEFAULT_MULTICAST_LOOP = 1;
pub const IP_MAX_MEMBERSHIPS = 20;
pub const SOCKET_ERROR = -1;
pub const PF_UNIX = 1;
pub const PF_IMPLINK = 3;
pub const PF_PUP = 4;
pub const PF_CHAOS = 5;
pub const PF_NS = 6;
pub const PF_IPX = 6;
pub const PF_ISO = 7;
pub const PF_OSI = 7;
pub const PF_ECMA = 8;
pub const PF_DATAKIT = 9;
pub const PF_CCITT = 10;
pub const PF_SNA = 11;
pub const PF_DECnet = 12;
pub const PF_DLI = 13;
pub const PF_LAT = 14;
pub const PF_HYLINK = 15;
pub const PF_APPLETALK = 16;
pub const PF_VOICEVIEW = 18;
pub const PF_FIREFOX = 19;
pub const PF_UNKNOWN1 = 20;
pub const PF_BAN = 21;
pub const PF_MAX = 29;
pub const SOMAXCONN = 5;
pub const MSG_MAXIOVLEN = 16;
pub const MSG_PARTIAL = 32768;
pub const MAXGETHOSTSTRUCT = 1024;
pub const FD_READ = 1;
pub const FD_WRITE = 2;
pub const FD_OOB = 4;
pub const FD_ACCEPT = 8;
pub const FD_CONNECT = 16;
pub const FD_CLOSE = 32;
pub const INCL_WINSOCK_API_PROTOTYPES = 1;
pub const INCL_WINSOCK_API_TYPEDEFS = 0;
pub const ADDR_ANY = 0;
pub const FROM_PROTOCOL_INFO = -1;
pub const SO_PROTOCOL_INFOA = 8196;
pub const SO_PROTOCOL_INFOW = 8197;
pub const SO_PROTOCOL_INFO = 8197;
pub const PVD_CONFIG = 12289;
pub const PF_ATM = 22;
pub const MSG_INTERRUPT = 16;
pub const FD_READ_BIT = 0;
pub const FD_WRITE_BIT = 1;
pub const FD_OOB_BIT = 2;
pub const FD_ACCEPT_BIT = 3;
pub const FD_CONNECT_BIT = 4;
pub const FD_CLOSE_BIT = 5;
pub const FD_QOS_BIT = 6;
pub const FD_GROUP_QOS_BIT = 7;
pub const FD_ROUTING_INTERFACE_CHANGE_BIT = 8;
pub const FD_ADDRESS_LIST_CHANGE_BIT = 9;
pub const FD_MAX_EVENTS = 10;
pub const WSA_MAXIMUM_WAIT_EVENTS = 64;
pub const WSA_WAIT_FAILED = 4294967295;
pub const WSA_WAIT_TIMEOUT = 258;
pub const CF_ACCEPT = 0;
pub const CF_REJECT = 1;
pub const CF_DEFER = 2;
pub const SG_UNCONSTRAINED_GROUP = 1;
pub const SG_CONSTRAINED_GROUP = 2;
pub const MAX_PROTOCOL_CHAIN = 7;
pub const BASE_PROTOCOL = 1;
pub const LAYERED_PROTOCOL = 0;
pub const WSAPROTOCOL_LEN = 255;
pub const PFL_MULTIPLE_PROTO_ENTRIES = 1;
pub const PFL_RECOMMENDED_PROTO_ENTRY = 2;
pub const PFL_HIDDEN = 4;
pub const PFL_MATCHES_PROTOCOL_ZERO = 8;
pub const PFL_NETWORKDIRECT_PROVIDER = 16;
pub const XP1_CONNECTIONLESS = 1;
pub const XP1_GUARANTEED_DELIVERY = 2;
pub const XP1_GUARANTEED_ORDER = 4;
pub const XP1_MESSAGE_ORIENTED = 8;
pub const XP1_PSEUDO_STREAM = 16;
pub const XP1_GRACEFUL_CLOSE = 32;
pub const XP1_EXPEDITED_DATA = 64;
pub const XP1_CONNECT_DATA = 128;
pub const XP1_DISCONNECT_DATA = 256;
pub const XP1_SUPPORT_BROADCAST = 512;
pub const XP1_SUPPORT_MULTIPOINT = 1024;
pub const XP1_MULTIPOINT_CONTROL_PLANE = 2048;
pub const XP1_MULTIPOINT_DATA_PLANE = 4096;
pub const XP1_QOS_SUPPORTED = 8192;
pub const XP1_INTERRUPT = 16384;
pub const XP1_UNI_SEND = 32768;
pub const XP1_UNI_RECV = 65536;
pub const XP1_IFS_HANDLES = 131072;
pub const XP1_PARTIAL_MESSAGE = 262144;
pub const XP1_SAN_SUPPORT_SDP = 524288;
pub const BIGENDIAN = 0;
pub const LITTLEENDIAN = 1;
pub const SECURITY_PROTOCOL_NONE = 0;
pub const JL_SENDER_ONLY = 1;
pub const JL_RECEIVER_ONLY = 2;
pub const JL_BOTH = 4;
pub const WSA_FLAG_OVERLAPPED = 1;
pub const WSA_FLAG_MULTIPOINT_C_ROOT = 2;
pub const WSA_FLAG_MULTIPOINT_C_LEAF = 4;
pub const WSA_FLAG_MULTIPOINT_D_ROOT = 8;
pub const WSA_FLAG_MULTIPOINT_D_LEAF = 16;
pub const WSA_FLAG_ACCESS_SYSTEM_SECURITY = 64;
pub const WSA_FLAG_NO_HANDLE_INHERIT = 128;
pub const WSA_FLAG_REGISTERED_IO = 256;
pub const SIO_NSP_NOTIFY_CHANGE = 2281701401;
pub const TH_NETDEV = 1;
pub const TH_TAPI = 2;
pub const SERVICE_MULTIPLE = 1;
pub const NS_LOCALNAME = 19;
pub const RES_UNUSED_1 = 1;
pub const RES_FLUSH_CACHE = 2;
pub const LUP_DEEP = 1;
pub const LUP_CONTAINERS = 2;
pub const LUP_NOCONTAINERS = 4;
pub const LUP_NEAREST = 8;
pub const LUP_RETURN_NAME = 16;
pub const LUP_RETURN_TYPE = 32;
pub const LUP_RETURN_VERSION = 64;
pub const LUP_RETURN_COMMENT = 128;
pub const LUP_RETURN_ADDR = 256;
pub const LUP_RETURN_BLOB = 512;
pub const LUP_RETURN_ALIASES = 1024;
pub const LUP_RETURN_QUERY_STRING = 2048;
pub const LUP_RETURN_ALL = 4080;
pub const LUP_RES_SERVICE = 32768;
pub const LUP_FLUSHCACHE = 4096;
pub const LUP_FLUSHPREVIOUS = 8192;
pub const LUP_NON_AUTHORITATIVE = 16384;
pub const LUP_SECURE = 32768;
pub const LUP_RETURN_PREFERRED_NAMES = 65536;
pub const LUP_DNS_ONLY = 131072;
pub const LUP_RETURN_RESPONSE_FLAGS = 262144;
pub const LUP_RESERVED_UNUSED = 524288;
pub const LUP_ADDRCONFIG = 1048576;
pub const LUP_DUAL_ADDR = 2097152;
pub const LUP_FILESERVER = 4194304;
pub const LUP_DISABLE_IDN_ENCODING = 8388608;
pub const LUP_API_ANSI = 16777216;
pub const LUP_EXTENDED_QUERYSET = 33554432;
pub const LUP_SECURE_WITH_FALLBACK = 67108864;
pub const LUP_EXCLUSIVE_CUSTOM_SERVERS = 134217728;
pub const LUP_REQUIRE_SECURE = 268435456;
pub const LUP_RETURN_TTL = 536870912;
pub const LUP_FORCE_CLEAR_TEXT = 1073741824;
pub const LUP_RESOLUTION_HANDLE = 2147483648;
pub const RESULT_IS_ALIAS = 1;
pub const RESULT_IS_ADDED = 16;
pub const RESULT_IS_CHANGED = 32;
pub const RESULT_IS_DELETED = 64;
pub const SOCK_NOTIFY_REGISTER_EVENT_NONE = 0;
pub const SOCK_NOTIFY_REGISTER_EVENT_IN = 1;
pub const SOCK_NOTIFY_REGISTER_EVENT_OUT = 2;
pub const SOCK_NOTIFY_REGISTER_EVENT_HANGUP = 4;
pub const SOCK_NOTIFY_EVENT_IN = 1;
pub const SOCK_NOTIFY_EVENT_OUT = 2;
pub const SOCK_NOTIFY_EVENT_HANGUP = 4;
pub const SOCK_NOTIFY_EVENT_ERR = 64;
pub const SOCK_NOTIFY_EVENT_REMOVE = 128;
pub const SOCK_NOTIFY_OP_NONE = 0;
pub const SOCK_NOTIFY_OP_ENABLE = 1;
pub const SOCK_NOTIFY_OP_DISABLE = 2;
pub const SOCK_NOTIFY_OP_REMOVE = 4;
pub const SOCK_NOTIFY_TRIGGER_ONESHOT = 1;
pub const SOCK_NOTIFY_TRIGGER_PERSISTENT = 2;
pub const SOCK_NOTIFY_TRIGGER_LEVEL = 4;
pub const SOCK_NOTIFY_TRIGGER_EDGE = 8;
pub const ATMPROTO_AALUSER = 0;
pub const ATMPROTO_AAL1 = 1;
pub const ATMPROTO_AAL2 = 2;
pub const ATMPROTO_AAL34 = 3;
pub const ATMPROTO_AAL5 = 5;
pub const SAP_FIELD_ABSENT = 4294967294;
pub const SAP_FIELD_ANY = 4294967295;
pub const SAP_FIELD_ANY_AESA_SEL = 4294967290;
pub const SAP_FIELD_ANY_AESA_REST = 4294967291;
pub const ATM_E164 = 1;
pub const ATM_NSAP = 2;
pub const ATM_AESA = 2;
pub const ATM_ADDR_SIZE = 20;
pub const BLLI_L2_ISO_1745 = 1;
pub const BLLI_L2_Q921 = 2;
pub const BLLI_L2_X25L = 6;
pub const BLLI_L2_X25M = 7;
pub const BLLI_L2_ELAPB = 8;
pub const BLLI_L2_HDLC_ARM = 9;
pub const BLLI_L2_HDLC_NRM = 10;
pub const BLLI_L2_HDLC_ABM = 11;
pub const BLLI_L2_LLC = 12;
pub const BLLI_L2_X75 = 13;
pub const BLLI_L2_Q922 = 14;
pub const BLLI_L2_USER_SPECIFIED = 16;
pub const BLLI_L2_ISO_7776 = 17;
pub const BLLI_L3_X25 = 6;
pub const BLLI_L3_ISO_8208 = 7;
pub const BLLI_L3_X223 = 8;
pub const BLLI_L3_SIO_8473 = 9;
pub const BLLI_L3_T70 = 10;
pub const BLLI_L3_ISO_TR9577 = 11;
pub const BLLI_L3_USER_SPECIFIED = 16;
pub const BLLI_L3_IPI_SNAP = 128;
pub const BLLI_L3_IPI_IP = 204;
pub const BHLI_ISO = 0;
pub const BHLI_UserSpecific = 1;
pub const BHLI_HighLayerProfile = 2;
pub const BHLI_VendorSpecificAppId = 3;
pub const AAL5_MODE_MESSAGE = 1;
pub const AAL5_MODE_STREAMING = 2;
pub const AAL5_SSCS_NULL = 0;
pub const AAL5_SSCS_SSCOP_ASSURED = 1;
pub const AAL5_SSCS_SSCOP_NON_ASSURED = 2;
pub const AAL5_SSCS_FRAME_RELAY = 4;
pub const BCOB_A = 1;
pub const BCOB_C = 3;
pub const BCOB_X = 16;
pub const TT_NOIND = 0;
pub const TT_CBR = 4;
pub const TT_VBR = 8;
pub const TR_NOIND = 0;
pub const TR_END_TO_END = 1;
pub const TR_NO_END_TO_END = 2;
pub const CLIP_NOT = 0;
pub const CLIP_SUS = 32;
pub const UP_P2P = 0;
pub const UP_P2MP = 1;
pub const BLLI_L2_MODE_NORMAL = 64;
pub const BLLI_L2_MODE_EXT = 128;
pub const BLLI_L3_MODE_NORMAL = 64;
pub const BLLI_L3_MODE_EXT = 128;
pub const BLLI_L3_PACKET_16 = 4;
pub const BLLI_L3_PACKET_32 = 5;
pub const BLLI_L3_PACKET_64 = 6;
pub const BLLI_L3_PACKET_128 = 7;
pub const BLLI_L3_PACKET_256 = 8;
pub const BLLI_L3_PACKET_512 = 9;
pub const BLLI_L3_PACKET_1024 = 10;
pub const BLLI_L3_PACKET_2048 = 11;
pub const BLLI_L3_PACKET_4096 = 12;
pub const PI_ALLOWED = 0;
pub const PI_RESTRICTED = 64;
pub const PI_NUMBER_NOT_AVAILABLE = 128;
pub const SI_USER_NOT_SCREENED = 0;
pub const SI_USER_PASSED = 1;
pub const SI_USER_FAILED = 2;
pub const SI_NETWORK = 3;
pub const CAUSE_LOC_USER = 0;
pub const CAUSE_LOC_PRIVATE_LOCAL = 1;
pub const CAUSE_LOC_PUBLIC_LOCAL = 2;
pub const CAUSE_LOC_TRANSIT_NETWORK = 3;
pub const CAUSE_LOC_PUBLIC_REMOTE = 4;
pub const CAUSE_LOC_PRIVATE_REMOTE = 5;
pub const CAUSE_LOC_INTERNATIONAL_NETWORK = 7;
pub const CAUSE_LOC_BEYOND_INTERWORKING = 10;
pub const CAUSE_UNALLOCATED_NUMBER = 1;
pub const CAUSE_NO_ROUTE_TO_TRANSIT_NETWORK = 2;
pub const CAUSE_NO_ROUTE_TO_DESTINATION = 3;
pub const CAUSE_VPI_VCI_UNACCEPTABLE = 10;
pub const CAUSE_NORMAL_CALL_CLEARING = 16;
pub const CAUSE_USER_BUSY = 17;
pub const CAUSE_NO_USER_RESPONDING = 18;
pub const CAUSE_CALL_REJECTED = 21;
pub const CAUSE_NUMBER_CHANGED = 22;
pub const CAUSE_USER_REJECTS_CLIR = 23;
pub const CAUSE_DESTINATION_OUT_OF_ORDER = 27;
pub const CAUSE_INVALID_NUMBER_FORMAT = 28;
pub const CAUSE_STATUS_ENQUIRY_RESPONSE = 30;
pub const CAUSE_NORMAL_UNSPECIFIED = 31;
pub const CAUSE_VPI_VCI_UNAVAILABLE = 35;
pub const CAUSE_NETWORK_OUT_OF_ORDER = 38;
pub const CAUSE_TEMPORARY_FAILURE = 41;
pub const CAUSE_ACCESS_INFORMAION_DISCARDED = 43;
pub const CAUSE_NO_VPI_VCI_AVAILABLE = 45;
pub const CAUSE_RESOURCE_UNAVAILABLE = 47;
pub const CAUSE_QOS_UNAVAILABLE = 49;
pub const CAUSE_USER_CELL_RATE_UNAVAILABLE = 51;
pub const CAUSE_BEARER_CAPABILITY_UNAUTHORIZED = 57;
pub const CAUSE_BEARER_CAPABILITY_UNAVAILABLE = 58;
pub const CAUSE_OPTION_UNAVAILABLE = 63;
pub const CAUSE_BEARER_CAPABILITY_UNIMPLEMENTED = 65;
pub const CAUSE_UNSUPPORTED_TRAFFIC_PARAMETERS = 73;
pub const CAUSE_INVALID_CALL_REFERENCE = 81;
pub const CAUSE_CHANNEL_NONEXISTENT = 82;
pub const CAUSE_INCOMPATIBLE_DESTINATION = 88;
pub const CAUSE_INVALID_ENDPOINT_REFERENCE = 89;
pub const CAUSE_INVALID_TRANSIT_NETWORK_SELECTION = 91;
pub const CAUSE_TOO_MANY_PENDING_ADD_PARTY = 92;
pub const CAUSE_AAL_PARAMETERS_UNSUPPORTED = 93;
pub const CAUSE_MANDATORY_IE_MISSING = 96;
pub const CAUSE_UNIMPLEMENTED_MESSAGE_TYPE = 97;
pub const CAUSE_UNIMPLEMENTED_IE = 99;
pub const CAUSE_INVALID_IE_CONTENTS = 100;
pub const CAUSE_INVALID_STATE_FOR_MESSAGE = 101;
pub const CAUSE_RECOVERY_ON_TIMEOUT = 102;
pub const CAUSE_INCORRECT_MESSAGE_LENGTH = 104;
pub const CAUSE_PROTOCOL_ERROR = 111;
pub const CAUSE_COND_UNKNOWN = 0;
pub const CAUSE_COND_PERMANENT = 1;
pub const CAUSE_COND_TRANSIENT = 2;
pub const CAUSE_REASON_USER = 0;
pub const CAUSE_REASON_IE_MISSING = 4;
pub const CAUSE_REASON_IE_INSUFFICIENT = 8;
pub const CAUSE_PU_PROVIDER = 0;
pub const CAUSE_PU_USER = 8;
pub const CAUSE_NA_NORMAL = 0;
pub const CAUSE_NA_ABNORMAL = 4;
pub const QOS_CLASS0 = 0;
pub const QOS_CLASS1 = 1;
pub const QOS_CLASS2 = 2;
pub const QOS_CLASS3 = 3;
pub const QOS_CLASS4 = 4;
pub const TNS_TYPE_NATIONAL = 64;
pub const TNS_PLAN_CARRIER_ID_CODE = 1;
pub const SIO_GET_NUMBER_OF_ATM_DEVICES = 1343619073;
pub const SIO_GET_ATM_ADDRESS = 3491102722;
pub const SIO_ASSOCIATE_PVC = 2417360899;
pub const SIO_GET_ATM_CONNECTION_ID = 1343619076;
pub const WSPDESCRIPTION_LEN = 255;
pub const WSS_OPERATION_IN_PROGRESS = 259;
pub const LSP_SYSTEM = 2147483648;
pub const LSP_INSPECTOR = 1;
pub const LSP_REDIRECTOR = 2;
pub const LSP_PROXY = 4;
pub const LSP_FIREWALL = 8;
pub const LSP_INBOUND_MODIFY = 16;
pub const LSP_OUTBOUND_MODIFY = 32;
pub const LSP_CRYPTO_COMPRESS = 64;
pub const LSP_LOCAL_CACHE = 128;
pub const UDP_NOCHECKSUM = 1;
pub const UDP_CHECKSUM_COVERAGE = 20;
pub const GAI_STRERROR_BUFFER_SIZE = 1024;
pub const IPX_PTYPE = 16384;
pub const IPX_FILTERPTYPE = 16385;
pub const IPX_STOPFILTERPTYPE = 16387;
pub const IPX_DSTYPE = 16386;
pub const IPX_EXTENDED_ADDRESS = 16388;
pub const IPX_RECVHDR = 16389;
pub const IPX_MAXSIZE = 16390;
pub const IPX_ADDRESS = 16391;
pub const IPX_GETNETINFO = 16392;
pub const IPX_GETNETINFO_NORIP = 16393;
pub const IPX_SPXGETCONNECTIONSTATUS = 16395;
pub const IPX_ADDRESS_NOTIFY = 16396;
pub const IPX_MAX_ADAPTER_NUM = 16397;
pub const IPX_RERIPNETNUMBER = 16398;
pub const IPX_RECEIVE_BROADCAST = 16399;
pub const IPX_IMMEDIATESPXACK = 16400;
pub const MAX_MCAST_TTL = 255;
pub const RM_OPTIONSBASE = 1000;
pub const RM_RATE_WINDOW_SIZE = 1001;
pub const RM_SET_MESSAGE_BOUNDARY = 1002;
pub const RM_FLUSHCACHE = 1003;
pub const RM_SENDER_WINDOW_ADVANCE_METHOD = 1004;
pub const RM_SENDER_STATISTICS = 1005;
pub const RM_LATEJOIN = 1006;
pub const RM_SET_SEND_IF = 1007;
pub const RM_ADD_RECEIVE_IF = 1008;
pub const RM_DEL_RECEIVE_IF = 1009;
pub const RM_SEND_WINDOW_ADV_RATE = 1010;
pub const RM_USE_FEC = 1011;
pub const RM_SET_MCAST_TTL = 1012;
pub const RM_RECEIVER_STATISTICS = 1013;
pub const RM_HIGH_SPEED_INTRANET_OPT = 1014;
pub const SENDER_DEFAULT_RATE_KBITS_PER_SEC = 56;
pub const SENDER_DEFAULT_WINDOW_ADV_PERCENTAGE = 15;
pub const MAX_WINDOW_INCREMENT_PERCENTAGE = 25;
pub const SENDER_DEFAULT_LATE_JOINER_PERCENTAGE = 0;
pub const SENDER_MAX_LATE_JOINER_PERCENTAGE = 75;
pub const BITS_PER_BYTE = 8;
pub const LOG2_BITS_PER_BYTE = 3;
pub const UNIX_PATH_MAX = 108;
pub const SIO_AF_UNIX_GETPEERPID = 1476395264;
pub const SIO_AF_UNIX_SETBINDPARENTPATH = 2550137089;
pub const SIO_AF_UNIX_SETCONNPARENTPATH = 2550137090;
pub const ISOPROTO_TP0 = 25;
pub const ISOPROTO_TP1 = 26;
pub const ISOPROTO_TP2 = 27;
pub const ISOPROTO_TP3 = 28;
pub const ISOPROTO_TP4 = 29;
pub const ISOPROTO_TP = 29;
pub const ISOPROTO_CLTP = 30;
pub const ISOPROTO_CLNP = 31;
pub const ISOPROTO_X25 = 32;
pub const ISOPROTO_INACT_NL = 33;
pub const ISOPROTO_ESIS = 34;
pub const ISOPROTO_INTRAISIS = 35;
pub const ISO_MAX_ADDR_LENGTH = 64;
pub const ISO_HIERARCHICAL = 0;
pub const ISO_NON_HIERARCHICAL = 1;
pub const ISO_EXP_DATA_USE = 0;
pub const ISO_EXP_DATA_NUSE = 1;
pub const NSPROTO_IPX = 1000;
pub const NSPROTO_SPX = 1256;
pub const NSPROTO_SPXII = 1257;
pub const NETBIOS_NAME_LENGTH = 16;
pub const NETBIOS_UNIQUE_NAME = 0;
pub const NETBIOS_GROUP_NAME = 1;
pub const NETBIOS_TYPE_QUICK_UNIQUE = 2;
pub const NETBIOS_TYPE_QUICK_GROUP = 3;
pub const VNSPROTO_IPC = 1;
pub const VNSPROTO_RELIABLE_IPC = 2;
pub const VNSPROTO_SPP = 3;
pub const _LITTLE_ENDIAN = 1234;
pub const _BIG_ENDIAN = 4321;
pub const _PDP_ENDIAN = 3412;
pub const BYTE_ORDER = 1234;
pub const DL_ADDRESS_LENGTH_MAXIMUM = 32;
pub const DL_HEADER_LENGTH_MAXIMUM = 64;
pub const SNAP_DSAP = 170;
pub const SNAP_SSAP = 170;
pub const SNAP_CONTROL = 3;
pub const SNAP_OUI = 0;
pub const ETH_LENGTH_OF_HEADER = 14;
pub const ETH_LENGTH_OF_VLAN_HEADER = 4;
pub const ETH_LENGTH_OF_SNAP_HEADER = 8;
pub const ETHERNET_TYPE_MINIMUM = 1536;
pub const ETHERNET_TYPE_IPV4 = 2048;
pub const ETHERNET_TYPE_ARP = 2054;
pub const ETHERNET_TYPE_IPV6 = 34525;
pub const ETHERNET_TYPE_802_1Q = 33024;
pub const ETHERNET_TYPE_802_1AD = 34984;
pub const IP_VER_MASK = 240;
pub const IPV4_VERSION = 4;
pub const MAX_IPV4_PACKET = 65535;
pub const MAX_IPV4_HLEN = 60;
pub const IPV4_MINIMUM_MTU = 576;
pub const IPV4_MIN_MINIMUM_MTU = 352;
pub const IPV4_MAX_MINIMUM_MTU = 576;
pub const SIZEOF_IP_OPT_ROUTING_HEADER = 3;
pub const SIZEOF_IP_OPT_TIMESTAMP_HEADER = 4;
pub const SIZEOF_IP_OPT_SECURITY = 11;
pub const SIZEOF_IP_OPT_STREAMIDENTIFIER = 4;
pub const SIZEOF_IP_OPT_ROUTERALERT = 4;
pub const IP4_OFF_MASK = 65311;
pub const ICMPV4_INVALID_PREFERENCE_LEVEL = 2147483648;
pub const IGMP_QUERY_TYPE = 17;
pub const IGMP_VERSION1_REPORT_TYPE = 18;
pub const IGMP_VERSION2_REPORT_TYPE = 22;
pub const IGMP_LEAVE_GROUP_TYPE = 23;
pub const IGMP_VERSION3_REPORT_TYPE = 34;
pub const IPV6_VERSION = 96;
pub const IPV6_TRAFFIC_CLASS_MASK = 49167;
pub const IPV6_FULL_TRAFFIC_CLASS_MASK = 61455;
pub const IPV6_ECN_MASK = 12288;
pub const IPV6_FLOW_LABEL_MASK = 4294905600;
pub const MAX_IPV6_PAYLOAD = 65535;
pub const IPV6_ECN_SHIFT = 12;
pub const IPV6_MINIMUM_MTU = 1280;
pub const IP6F_OFF_MASK = 63743;
pub const IP6F_RESERVED_MASK = 1536;
pub const IP6F_MORE_FRAG = 256;
pub const EXT_LEN_UNIT = 8;
pub const IP6OPT_TYPE_SKIP = 0;
pub const IP6OPT_TYPE_DISCARD = 64;
pub const IP6OPT_TYPE_FORCEICMP = 128;
pub const IP6OPT_TYPE_ICMP = 192;
pub const IP6OPT_MUTABLE = 32;
pub const ICMP6_DST_UNREACH_NOROUTE = 0;
pub const ICMP6_DST_UNREACH_ADMIN = 1;
pub const ICMP6_DST_UNREACH_BEYONDSCOPE = 2;
pub const ICMP6_DST_UNREACH_ADDR = 3;
pub const ICMP6_DST_UNREACH_NOPORT = 4;
pub const ICMP6_TIME_EXCEED_TRANSIT = 0;
pub const ICMP6_TIME_EXCEED_REASSEMBLY = 1;
pub const ICMP6_PARAMPROB_HEADER = 0;
pub const ICMP6_PARAMPROB_NEXTHEADER = 1;
pub const ICMP6_PARAMPROB_OPTION = 2;
pub const ICMP6_PARAMPROB_FIRSTFRAGMENT = 3;
pub const ICMPV6_ECHO_REQUEST_FLAG_REVERSE = 1;
pub const ND_RA_FLAG_MANAGED = 128;
pub const ND_RA_FLAG_OTHER = 64;
pub const ND_RA_FLAG_HOME_AGENT = 32;
pub const ND_RA_FLAG_PREFERENCE = 24;
pub const ND_NA_FLAG_ROUTER = 2147483648;
pub const ND_NA_FLAG_SOLICITED = 1073741824;
pub const ND_NA_FLAG_OVERRIDE = 536870912;
pub const ND_OPT_PI_FLAG_ONLINK = 128;
pub const ND_OPT_PI_FLAG_AUTO = 64;
pub const ND_OPT_PI_FLAG_ROUTER_ADDR = 32;
pub const ND_OPT_PI_FLAG_SITE_PREFIX = 16;
pub const ND_OPT_PI_FLAG_ROUTE = 1;
pub const ND_OPT_RI_FLAG_PREFERENCE = 24;
pub const ND_OPT_RDNSS_MIN_LEN = 24;
pub const ND_OPT_DNSSL_MIN_LEN = 16;
pub const IN6_EMBEDDEDV4_UOCTET_POSITION = 8;
pub const IN6_EMBEDDEDV4_BITS_IN_BYTE = 8;
pub const TH_MAX_LEN = 60;
pub const TH_FIN = 1;
pub const TH_SYN = 2;
pub const TH_RST = 4;
pub const TH_PSH = 8;
pub const TH_ACK = 16;
pub const TH_URG = 32;
pub const TH_ECE = 64;
pub const TH_CWR = 128;
pub const TH_OPT_EOL = 0;
pub const TH_OPT_NOP = 1;
pub const TH_OPT_MSS = 2;
pub const TH_OPT_WS = 3;
pub const TH_OPT_SACK_PERMITTED = 4;
pub const TH_OPT_SACK = 5;
pub const TH_OPT_TS = 8;
pub const TH_OPT_FASTOPEN = 34;
pub const INVALID_SOCKET = -1;
pub const WSA_INFINITE = 4294967295;
pub const WSA_INVALID_EVENT = 0;
pub const IOC_INOUT = 3221225472;
pub const FIONREAD = 1074030207;
pub const FIONBIO = -2147195266;
pub const FIOASYNC = -2147195267;
pub const SIOCSHIWAT = -2147192064;
pub const SIOCGHIWAT = 1074033409;
pub const SIOCSLOWAT = -2147192062;
pub const SIOCGLOWAT = 1074033411;
pub const SIOCATMARK = 1074033415;
pub const INADDR_ANY = 0;
pub const INADDR_BROADCAST = 4294967295;
pub const SO_DONTLINGER = -129;
pub const SO_EXCLUSIVEADDRUSE = -5;
pub const LM_HB_Extension = 128;
pub const LM_HB1_PnP = 1;
pub const LM_HB1_PDA_Palmtop = 2;
pub const LM_HB1_Computer = 4;
pub const LM_HB1_Printer = 8;
pub const LM_HB1_Modem = 16;
pub const LM_HB1_Fax = 32;
pub const LM_HB1_LANAccess = 64;
pub const LM_HB2_Telephony = 1;
pub const LM_HB2_FileServer = 2;
pub const IPPROTO_HOPOPTS = 0;
pub const IPPROTO_ICMP = 1;
pub const IPPROTO_IGMP = 2;
pub const IPPROTO_GGP = 3;
pub const IPPROTO_IPV4 = 4;
pub const IPPROTO_ST = 5;
pub const IPPROTO_TCP = 6;
pub const IPPROTO_CBT = 7;
pub const IPPROTO_EGP = 8;
pub const IPPROTO_IGP = 9;
pub const IPPROTO_PUP = 12;
pub const IPPROTO_UDP = 17;
pub const IPPROTO_IDP = 22;
pub const IPPROTO_RDP = 27;
pub const IPPROTO_IPV6 = 41;
pub const IPPROTO_ROUTING = 43;
pub const IPPROTO_FRAGMENT = 44;
pub const IPPROTO_ESP = 50;
pub const IPPROTO_AH = 51;
pub const IPPROTO_ICMPV6 = 58;
pub const IPPROTO_NONE = 59;
pub const IPPROTO_DSTOPTS = 60;
pub const IPPROTO_ND = 77;
pub const IPPROTO_ICLFXBM = 78;
pub const IPPROTO_PIM = 103;
pub const IPPROTO_PGM = 113;
pub const IPPROTO_L2TP = 115;
pub const IPPROTO_SCTP = 132;
pub const IPPROTO_RAW = 255;
pub const IPPROTO_MAX = 256;
pub const IPPROTO_RESERVED_RAW = 257;
pub const IPPROTO_RESERVED_IPSEC = 258;
pub const IPPROTO_RESERVED_IPSECOFFLOAD = 259;
pub const IPPROTO_RESERVED_WNV = 260;
pub const IPPROTO_RESERVED_MAX = 261;
pub const IPPROTO_IP = 0;
pub const IPPROTO_RM = 113;
pub const ScopeLevelInterface = 1;
pub const ScopeLevelLink = 2;
pub const ScopeLevelSubnet = 3;
pub const ScopeLevelAdmin = 4;
pub const ScopeLevelSite = 5;
pub const ScopeLevelOrganization = 8;
pub const ScopeLevelGlobal = 14;
pub const ScopeLevelCount = 16;
pub const NSP_NOTIFY_IMMEDIATELY = 0;
pub const NSP_NOTIFY_HWND = 1;
pub const NSP_NOTIFY_EVENT = 2;
pub const NSP_NOTIFY_PORT = 3;
pub const NSP_NOTIFY_APC = 4;
pub const COMP_EQUAL = 0;
pub const COMP_NOTLESS = 1;
pub const RNRSERVICE_REGISTER = 0;
pub const RNRSERVICE_DEREGISTER = 1;
pub const RNRSERVICE_DELETE = 2;
pub const IP_PMTUDISC_NOT_SET = 0;
pub const IP_PMTUDISC_DO = 1;
pub const IP_PMTUDISC_DONT = 2;
pub const IP_PMTUDISC_PROBE = 3;
pub const IP_PMTUDISC_MAX = 4;
pub const MCAST_INCLUDE = 0;
pub const MCAST_EXCLUDE = 1;
pub const E_WINDOW_ADVANCE_BY_TIME = 1;
pub const E_WINDOW_USE_AS_DATA_CACHE = 2;
pub const IpPrefixOriginOther = 0;
pub const IpPrefixOriginManual = 1;
pub const IpPrefixOriginWellKnown = 2;
pub const IpPrefixOriginDhcp = 3;
pub const IpPrefixOriginRouterAdvertisement = 4;
pub const IpPrefixOriginUnchanged = 16;
pub const NlsoOther = 0;
pub const NlsoManual = 1;
pub const NlsoWellKnown = 2;
pub const NlsoDhcp = 3;
pub const NlsoLinkLayerAddress = 4;
pub const NlsoRandom = 5;
pub const IpSuffixOriginOther = 0;
pub const IpSuffixOriginManual = 1;
pub const IpSuffixOriginWellKnown = 2;
pub const IpSuffixOriginDhcp = 3;
pub const IpSuffixOriginLinkLayerAddress = 4;
pub const IpSuffixOriginRandom = 5;
pub const IpSuffixOriginUnchanged = 16;
pub const NldsInvalid = 0;
pub const NldsTentative = 1;
pub const NldsDuplicate = 2;
pub const NldsDeprecated = 3;
pub const NldsPreferred = 4;
pub const IpDadStateInvalid = 0;
pub const IpDadStateTentative = 1;
pub const IpDadStateDuplicate = 2;
pub const IpDadStateDeprecated = 3;
pub const IpDadStatePreferred = 4;
pub const RouteProtocolOther = 1;
pub const RouteProtocolLocal = 2;
pub const RouteProtocolNetMgmt = 3;
pub const RouteProtocolIcmp = 4;
pub const RouteProtocolEgp = 5;
pub const RouteProtocolGgp = 6;
pub const RouteProtocolHello = 7;
pub const RouteProtocolRip = 8;
pub const RouteProtocolIsIs = 9;
pub const RouteProtocolEsIs = 10;
pub const RouteProtocolCisco = 11;
pub const RouteProtocolBbn = 12;
pub const RouteProtocolOspf = 13;
pub const RouteProtocolBgp = 14;
pub const RouteProtocolIdpr = 15;
pub const RouteProtocolEigrp = 16;
pub const RouteProtocolDvmrp = 17;
pub const RouteProtocolRpl = 18;
pub const RouteProtocolDhcp = 19;
pub const MIB_IPPROTO_OTHER = 1;
pub const PROTO_IP_OTHER = 1;
pub const MIB_IPPROTO_LOCAL = 2;
pub const PROTO_IP_LOCAL = 2;
pub const MIB_IPPROTO_NETMGMT = 3;
pub const PROTO_IP_NETMGMT = 3;
pub const MIB_IPPROTO_ICMP = 4;
pub const PROTO_IP_ICMP = 4;
pub const MIB_IPPROTO_EGP = 5;
pub const PROTO_IP_EGP = 5;
pub const MIB_IPPROTO_GGP = 6;
pub const PROTO_IP_GGP = 6;
pub const MIB_IPPROTO_HELLO = 7;
pub const PROTO_IP_HELLO = 7;
pub const MIB_IPPROTO_RIP = 8;
pub const PROTO_IP_RIP = 8;
pub const MIB_IPPROTO_IS_IS = 9;
pub const PROTO_IP_IS_IS = 9;
pub const MIB_IPPROTO_ES_IS = 10;
pub const PROTO_IP_ES_IS = 10;
pub const MIB_IPPROTO_CISCO = 11;
pub const PROTO_IP_CISCO = 11;
pub const MIB_IPPROTO_BBN = 12;
pub const PROTO_IP_BBN = 12;
pub const MIB_IPPROTO_OSPF = 13;
pub const PROTO_IP_OSPF = 13;
pub const MIB_IPPROTO_BGP = 14;
pub const PROTO_IP_BGP = 14;
pub const MIB_IPPROTO_IDPR = 15;
pub const PROTO_IP_IDPR = 15;
pub const MIB_IPPROTO_EIGRP = 16;
pub const PROTO_IP_EIGRP = 16;
pub const MIB_IPPROTO_DVMRP = 17;
pub const PROTO_IP_DVMRP = 17;
pub const MIB_IPPROTO_RPL = 18;
pub const PROTO_IP_RPL = 18;
pub const MIB_IPPROTO_DHCP = 19;
pub const PROTO_IP_DHCP = 19;
pub const MIB_IPPROTO_NT_AUTOSTATIC = 10002;
pub const PROTO_IP_NT_AUTOSTATIC = 10002;
pub const MIB_IPPROTO_NT_STATIC = 10006;
pub const PROTO_IP_NT_STATIC = 10006;
pub const MIB_IPPROTO_NT_STATIC_NON_DOD = 10007;
pub const PROTO_IP_NT_STATIC_NON_DOD = 10007;
pub const NlatUnspecified = 0;
pub const NlatUnicast = 1;
pub const NlatAnycast = 2;
pub const NlatMulticast = 3;
pub const NlatBroadcast = 4;
pub const NlatInvalid = 5;
pub const NlroManual = 0;
pub const NlroWellKnown = 1;
pub const NlroDHCP = 2;
pub const NlroRouterAdvertisement = 3;
pub const Nlro6to4 = 4;
pub const NlnsUnreachable = 0;
pub const NlnsIncomplete = 1;
pub const NlnsProbe = 2;
pub const NlnsDelay = 3;
pub const NlnsStale = 4;
pub const NlnsReachable = 5;
pub const NlnsPermanent = 6;
pub const NlnsMaximum = 7;
pub const LinkLocalAlwaysOff = 0;
pub const LinkLocalDelayed = 1;
pub const LinkLocalAlwaysOn = 2;
pub const LinkLocalUnchanged = -1;
pub const RouterDiscoveryDisabled = 0;
pub const RouterDiscoveryEnabled = 1;
pub const RouterDiscoveryDhcp = 2;
pub const RouterDiscoveryUnchanged = -1;
pub const NlbwDisabled = 0;
pub const NlbwEnabled = 1;
pub const NlbwUnchanged = -1;
pub const NetworkCategoryPublic = 0;
pub const NetworkCategoryPrivate = 1;
pub const NetworkCategoryDomainAuthenticated = 2;
pub const NetworkCategoryUnchanged = -1;
pub const NetworkCategoryUnknown = -1;
pub const NlincCategoryUnknown = 0;
pub const NlincPublic = 1;
pub const NlincPrivate = 2;
pub const NlincDomainAuthenticated = 3;
pub const NlincCategoryStateMax = 4;
pub const NetworkConnectivityLevelHintUnknown = 0;
pub const NetworkConnectivityLevelHintNone = 1;
pub const NetworkConnectivityLevelHintLocalAccess = 2;
pub const NetworkConnectivityLevelHintInternetAccess = 3;
pub const NetworkConnectivityLevelHintConstrainedInternetAccess = 4;
pub const NetworkConnectivityLevelHintHidden = 5;
pub const NetworkConnectivityCostHintUnknown = 0;
pub const NetworkConnectivityCostHintUnrestricted = 1;
pub const NetworkConnectivityCostHintFixed = 2;
pub const NetworkConnectivityCostHintVariable = 3;
pub const TCPSTATE_CLOSED = 0;
pub const TCPSTATE_LISTEN = 1;
pub const TCPSTATE_SYN_SENT = 2;
pub const TCPSTATE_SYN_RCVD = 3;
pub const TCPSTATE_ESTABLISHED = 4;
pub const TCPSTATE_FIN_WAIT_1 = 5;
pub const TCPSTATE_FIN_WAIT_2 = 6;
pub const TCPSTATE_CLOSE_WAIT = 7;
pub const TCPSTATE_CLOSING = 8;
pub const TCPSTATE_LAST_ACK = 9;
pub const TCPSTATE_TIME_WAIT = 10;
pub const TCPSTATE_MAX = 11;
pub const CONTROL_CHANNEL_TRIGGER_STATUS_INVALID = 0;
pub const CONTROL_CHANNEL_TRIGGER_STATUS_SOFTWARE_SLOT_ALLOCATED = 1;
pub const CONTROL_CHANNEL_TRIGGER_STATUS_HARDWARE_SLOT_ALLOCATED = 2;
pub const CONTROL_CHANNEL_TRIGGER_STATUS_POLICY_ERROR = 3;
pub const CONTROL_CHANNEL_TRIGGER_STATUS_SYSTEM_ERROR = 4;
pub const CONTROL_CHANNEL_TRIGGER_STATUS_TRANSPORT_DISCONNECTED = 5;
pub const CONTROL_CHANNEL_TRIGGER_STATUS_SERVICE_UNAVAILABLE = 6;
pub const SocketPriorityHintVeryLow = 0;
pub const SocketPriorityHintLow = 1;
pub const SocketPriorityHintNormal = 2;
pub const SocketMaximumPriorityHintType = 3;
pub const RCVALL_OFF = 0;
pub const RCVALL_ON = 1;
pub const RCVALL_SOCKETLEVELONLY = 2;
pub const RCVALL_IPLEVEL = 3;
pub const TCP_ICW_LEVEL_DEFAULT = 0;
pub const TCP_ICW_LEVEL_HIGH = 1;
pub const TCP_ICW_LEVEL_VERY_HIGH = 2;
pub const TCP_ICW_LEVEL_AGGRESSIVE = 3;
pub const TCP_ICW_LEVEL_EXPERIMENTAL = 4;
pub const TCP_ICW_LEVEL_COMPAT = 254;
pub const TCP_ICW_LEVEL_MAX = 255;
pub const SYSTEM_CRITICAL_SOCKET = 1;
pub const SOCKET_SECURITY_PROTOCOL_DEFAULT = 0;
pub const SOCKET_SECURITY_PROTOCOL_IPSEC = 1;
pub const SOCKET_SECURITY_PROTOCOL_IPSEC2 = 2;
pub const SOCKET_SECURITY_PROTOCOL_INVALID = 3;
pub const WsaBehaviorAll = 0;
pub const WsaBehaviorReceiveBuffering = 1;
pub const WsaBehaviorAutoTuning = 2;
pub const IE_AALParameters = 0;
pub const IE_TrafficDescriptor = 1;
pub const IE_BroadbandBearerCapability = 2;
pub const IE_BHLI = 3;
pub const IE_BLLI = 4;
pub const IE_CalledPartyNumber = 5;
pub const IE_CalledPartySubaddress = 6;
pub const IE_CallingPartyNumber = 7;
pub const IE_CallingPartySubaddress = 8;
pub const IE_Cause = 9;
pub const IE_QOSClass = 10;
pub const IE_TransitNetworkSelection = 11;
pub const AALTYPE_5 = 5;
pub const AALTYPE_USER = 16;
pub const ProviderType_Application = 1;
pub const ProviderType_Service = 2;
pub const ProviderLevel_None = 0;
pub const ProviderLevel_Secondary = 1;
pub const ProviderLevel_Primary = 2;
pub const NLA_RAW_DATA = 0;
pub const NLA_INTERFACE = 1;
pub const NLA_802_1X_LOCATION = 2;
pub const NLA_CONNECTIVITY = 3;
pub const NLA_ICS = 4;
pub const NLA_NETWORK_AD_HOC = 0;
pub const NLA_NETWORK_MANAGED = 1;
pub const NLA_NETWORK_UNMANAGED = 2;
pub const NLA_NETWORK_UNKNOWN = 3;
pub const NLA_INTERNET_UNKNOWN = 0;
pub const NLA_INTERNET_NO = 1;
pub const NLA_INTERNET_YES = 2;
pub const RIO_EVENT_COMPLETION = 1;
pub const RIO_IOCP_COMPLETION = 2;
pub const ProviderInfoLspCategories = 0;
pub const ProviderInfoAudit = 1;
pub const IP_OPT_EOL = 0;
pub const IP_OPT_NOP = 1;
pub const IP_OPT_SECURITY = 130;
pub const IP_OPT_LSRR = 131;
pub const IP_OPT_TS = 68;
pub const IP_OPT_RR = 7;
pub const IP_OPT_SSRR = 137;
pub const IP_OPT_SID = 136;
pub const IP_OPT_ROUTER_ALERT = 148;
pub const IP_OPT_MULTIDEST = 149;
pub const IP_OPTION_TIMESTAMP_ONLY = 0;
pub const IP_OPTION_TIMESTAMP_ADDRESS = 1;
pub const IP_OPTION_TIMESTAMP_SPECIFIC_ADDRESS = 3;
pub const ICMP4_UNREACH_NET = 0;
pub const ICMP4_UNREACH_HOST = 1;
pub const ICMP4_UNREACH_PROTOCOL = 2;
pub const ICMP4_UNREACH_PORT = 3;
pub const ICMP4_UNREACH_FRAG_NEEDED = 4;
pub const ICMP4_UNREACH_SOURCEROUTE_FAILED = 5;
pub const ICMP4_UNREACH_NET_UNKNOWN = 6;
pub const ICMP4_UNREACH_HOST_UNKNOWN = 7;
pub const ICMP4_UNREACH_ISOLATED = 8;
pub const ICMP4_UNREACH_NET_ADMIN = 9;
pub const ICMP4_UNREACH_HOST_ADMIN = 10;
pub const ICMP4_UNREACH_NET_TOS = 11;
pub const ICMP4_UNREACH_HOST_TOS = 12;
pub const ICMP4_UNREACH_ADMIN = 13;
pub const ICMP4_TIME_EXCEED_TRANSIT = 0;
pub const ICMP4_TIME_EXCEED_REASSEMBLY = 1;
pub const ARP_REQUEST = 1;
pub const ARP_RESPONSE = 2;
pub const ARP_HW_ENET = 1;
pub const ARP_HW_802 = 6;
pub const IGMP_MAX_RESP_CODE_TYPE_NORMAL = 0;
pub const IGMP_MAX_RESP_CODE_TYPE_FLOAT = 1;
pub const IP6OPT_PAD1 = 0;
pub const IP6OPT_PADN = 1;
pub const IP6OPT_TUNNEL_LIMIT = 4;
pub const IP6OPT_ROUTER_ALERT = 5;
pub const IP6OPT_JUMBO = 194;
pub const IP6OPT_NSAP_ADDR = 195;
pub const ND_OPT_SOURCE_LINKADDR = 1;
pub const ND_OPT_TARGET_LINKADDR = 2;
pub const ND_OPT_PREFIX_INFORMATION = 3;
pub const ND_OPT_REDIRECTED_HEADER = 4;
pub const ND_OPT_MTU = 5;
pub const ND_OPT_NBMA_SHORTCUT_LIMIT = 6;
pub const ND_OPT_ADVERTISEMENT_INTERVAL = 7;
pub const ND_OPT_HOME_AGENT_INFORMATION = 8;
pub const ND_OPT_SOURCE_ADDR_LIST = 9;
pub const ND_OPT_TARGET_ADDR_LIST = 10;
pub const ND_OPT_ROUTE_INFO = 24;
pub const ND_OPT_RDNSS = 25;
pub const ND_OPT_DNSSL = 31;
pub const ND_OPT_PREF64 = 38;
pub const ND_OPT_PREF64_PREFIX_LENGTH_96 = 0;
pub const ND_OPT_PREF64_PREFIX_LENGTH_64 = 1;
pub const ND_OPT_PREF64_PREFIX_LENGTH_56 = 2;
pub const ND_OPT_PREF64_PREFIX_LENGTH_48 = 3;
pub const ND_OPT_PREF64_PREFIX_LENGTH_40 = 4;
pub const ND_OPT_PREF64_PREFIX_LENGTH_32 = 5;
pub const MLD_MAX_RESP_CODE_TYPE_NORMAL = 0;
pub const MLD_MAX_RESP_CODE_TYPE_FLOAT = 1;
pub const TUNNEL_SUB_TYPE_NONE = 0;
pub const TUNNEL_SUB_TYPE_CP = 1;
pub const TUNNEL_SUB_TYPE_IPTLS = 2;
pub const TUNNEL_SUB_TYPE_HA = 3;
pub const MIT_GUID = 1;
pub const MIT_IF_LUID = 2;
pub const FallbackIndexTcpFastopen = 0;
pub const FallbackIndexMax = 1;

pub const aliases = struct {
    pub const WSA_ERROR = i32;
    pub const ADDRESS_FAMILY = u16;
    pub const SET_SERVICE_OPERATION = u32;
    pub const SEND_RECV_FLAGS = i32;
    pub const RESOURCE_DISPLAY_TYPE = u32;
    pub const WSAPOLL_EVENT_FLAGS = i16;
    pub const WINSOCK_SHUTDOWN_HOW = i32;
    pub const WINSOCK_SOCKET_TYPE = i32;
    pub const IPPROTO = i32;
    pub const SCOPE_LEVEL = i32;
    pub const WSACOMPLETIONTYPE = i32;
    pub const WSAECOMPARATOR = i32;
    pub const WSAESETSERVICEOP = i32;
    pub const PMTUD_STATE = i32;
    pub const MULTICAST_MODE_TYPE = i32;
    pub const eWINDOW_ADVANCE_METHOD = i32;
    pub const NL_PREFIX_ORIGIN = i32;
    pub const NL_SUFFIX_ORIGIN = i32;
    pub const NL_DAD_STATE = i32;
    pub const NL_ROUTE_PROTOCOL = i32;
    pub const NL_ADDRESS_TYPE = i32;
    pub const NL_ROUTE_ORIGIN = i32;
    pub const NL_NEIGHBOR_STATE = i32;
    pub const NL_LINK_LOCAL_ADDRESS_BEHAVIOR = i32;
    pub const NL_ROUTER_DISCOVERY_BEHAVIOR = i32;
    pub const NL_BANDWIDTH_FLAG = i32;
    pub const NL_NETWORK_CATEGORY = i32;
    pub const NL_INTERFACE_NETWORK_CATEGORY_STATE = i32;
    pub const NL_NETWORK_CONNECTIVITY_LEVEL_HINT = i32;
    pub const NL_NETWORK_CONNECTIVITY_COST_HINT = i32;
    pub const TCPSTATE = i32;
    pub const CONTROL_CHANNEL_TRIGGER_STATUS = i32;
    pub const SOCKET_PRIORITY_HINT = i32;
    pub const RCVALL_VALUE = i32;
    pub const TCP_ICW_LEVEL = i32;
    pub const SOCKET_USAGE_TYPE = i32;
    pub const SOCKET_SECURITY_PROTOCOL = i32;
    pub const WSA_COMPATIBILITY_BEHAVIOR_ID = i32;
    pub const Q2931_IE_TYPE = i32;
    pub const AAL_TYPE = i32;
    pub const NAPI_PROVIDER_TYPE = i32;
    pub const NAPI_PROVIDER_LEVEL = i32;
    pub const NLA_BLOB_DATA_TYPE = i32;
    pub const NLA_CONNECTIVITY_TYPE = i32;
    pub const NLA_INTERNET = i32;
    pub const RIO_NOTIFICATION_COMPLETION_TYPE = i32;
    pub const WSC_PROVIDER_INFO_TYPE = i32;
    pub const IPV4_OPTION_TYPE = i32;
    pub const IP_OPTION_TIMESTAMP_FLAGS = i32;
    pub const ICMP4_UNREACH_CODE = i32;
    pub const ICMP4_TIME_EXCEED_CODE = i32;
    pub const ARP_OPCODE = i32;
    pub const ARP_HARDWARE_TYPE = i32;
    pub const IGMP_MAX_RESP_CODE_TYPE = i32;
    pub const IPV6_OPTION_TYPE = i32;
    pub const ND_OPTION_TYPE = i32;
    pub const ND_OPT_PREF64_PREFIX_LENGTH_CODE = i32;
    pub const MLD_MAX_RESP_CODE_TYPE = i32;
    pub const TUNNEL_SUB_TYPE = i32;
    pub const NPI_MODULEID_TYPE = i32;
    pub const FALLBACK_INDEX = i32;
};
