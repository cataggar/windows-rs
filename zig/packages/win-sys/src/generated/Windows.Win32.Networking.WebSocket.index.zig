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
    .{ "WebSocketCreateClientHandle", MethodRecord{ .library = "websocket", .import = "WebSocketCreateClientHandle", .signature = "\x00\x03\x11\x79\x0f\x11\xb2\x6d\x09\x0f\x11\xb2\x71" } },
    .{ "WebSocketBeginClientHandshake", MethodRecord{ .library = "websocket", .import = "WebSocketBeginClientHandshake", .signature = "\x00\x09\x11\x79\x11\xb2\x71\x0f\x11\x3d\x09\x0f\x11\x3d\x09\x0f\x11\xb2\x75\x09\x0f\x0f\x11\xb2\x75\x0f\x09" } },
    .{ "WebSocketEndClientHandshake", MethodRecord{ .library = "websocket", .import = "WebSocketEndClientHandshake", .signature = "\x00\x06\x11\x79\x11\xb2\x71\x0f\x11\xb2\x75\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "WebSocketCreateServerHandle", MethodRecord{ .library = "websocket", .import = "WebSocketCreateServerHandle", .signature = "\x00\x03\x11\x79\x0f\x11\xb2\x6d\x09\x0f\x11\xb2\x71" } },
    .{ "WebSocketBeginServerHandshake", MethodRecord{ .library = "websocket", .import = "WebSocketBeginServerHandshake", .signature = "\x00\x08\x11\x79\x11\xb2\x71\x11\x3d\x0f\x11\x3d\x09\x0f\x11\xb2\x75\x09\x0f\x0f\x11\xb2\x75\x0f\x09" } },
    .{ "WebSocketEndServerHandshake", MethodRecord{ .library = "websocket", .import = "WebSocketEndServerHandshake", .signature = "\x00\x01\x11\x79\x11\xb2\x71" } },
    .{ "WebSocketSend", MethodRecord{ .library = "websocket", .import = "WebSocketSend", .signature = "\x00\x04\x11\x79\x11\xb2\x71\x11\xb2\x79\x0f\x11\xb2\x7d\x0f\x01" } },
    .{ "WebSocketReceive", MethodRecord{ .library = "websocket", .import = "WebSocketReceive", .signature = "\x00\x03\x11\x79\x11\xb2\x71\x0f\x11\xb2\x7d\x0f\x01" } },
    .{ "WebSocketGetAction", MethodRecord{ .library = "websocket", .import = "WebSocketGetAction", .signature = "\x00\x08\x11\x79\x11\xb2\x71\x11\xb2\x81\x0f\x11\xb2\x7d\x0f\x09\x0f\x11\xb2\x85\x0f\x11\xb2\x79\x0f\x0f\x01\x0f\x0f\x01" } },
    .{ "WebSocketCompleteAction", MethodRecord{ .library = "websocket", .import = "WebSocketCompleteAction", .signature = "\x00\x03\x01\x11\xb2\x71\x0f\x01\x09" } },
    .{ "WebSocketAbortHandle", MethodRecord{ .library = "websocket", .import = "WebSocketAbortHandle", .signature = "\x00\x01\x01\x11\xb2\x71" } },
    .{ "WebSocketDeleteHandle", MethodRecord{ .library = "websocket", .import = "WebSocketDeleteHandle", .signature = "\x00\x01\x01\x11\xb2\x71" } },
    .{ "WebSocketGetGlobalProperty", MethodRecord{ .library = "websocket", .import = "WebSocketGetGlobalProperty", .signature = "\x00\x03\x11\x79\x11\xb2\x89\x0f\x01\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x326d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WebSocket", .name = "WEB_SOCKET_PROPERTY" },
        0x3271 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WebSocket", .name = "WEB_SOCKET_HANDLE" },
        0x3275 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WebSocket", .name = "WEB_SOCKET_HTTP_HEADER" },
        0x3279 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WebSocket", .name = "WEB_SOCKET_BUFFER_TYPE" },
        0x327d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WebSocket", .name = "WEB_SOCKET_BUFFER" },
        0x3281 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WebSocket", .name = "WEB_SOCKET_ACTION_QUEUE" },
        0x3285 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WebSocket", .name = "WEB_SOCKET_ACTION" },
        0x3289 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WebSocket", .name = "WEB_SOCKET_PROPERTY_TYPE" },
        else => null,
    };
}

pub const WEB_SOCKET_MAX_CLOSE_REASON_LENGTH = 123;
pub const WEB_SOCKET_SUCCESS_CLOSE_STATUS = 1000;
pub const WEB_SOCKET_ENDPOINT_UNAVAILABLE_CLOSE_STATUS = 1001;
pub const WEB_SOCKET_PROTOCOL_ERROR_CLOSE_STATUS = 1002;
pub const WEB_SOCKET_INVALID_DATA_TYPE_CLOSE_STATUS = 1003;
pub const WEB_SOCKET_EMPTY_CLOSE_STATUS = 1005;
pub const WEB_SOCKET_ABORTED_CLOSE_STATUS = 1006;
pub const WEB_SOCKET_INVALID_PAYLOAD_CLOSE_STATUS = 1007;
pub const WEB_SOCKET_POLICY_VIOLATION_CLOSE_STATUS = 1008;
pub const WEB_SOCKET_MESSAGE_TOO_BIG_CLOSE_STATUS = 1009;
pub const WEB_SOCKET_UNSUPPORTED_EXTENSIONS_CLOSE_STATUS = 1010;
pub const WEB_SOCKET_SERVER_ERROR_CLOSE_STATUS = 1011;
pub const WEB_SOCKET_SECURE_HANDSHAKE_ERROR_CLOSE_STATUS = 1015;
pub const WEB_SOCKET_RECEIVE_BUFFER_SIZE_PROPERTY_TYPE = 0;
pub const WEB_SOCKET_SEND_BUFFER_SIZE_PROPERTY_TYPE = 1;
pub const WEB_SOCKET_DISABLE_MASKING_PROPERTY_TYPE = 2;
pub const WEB_SOCKET_ALLOCATED_BUFFER_PROPERTY_TYPE = 3;
pub const WEB_SOCKET_DISABLE_UTF8_VERIFICATION_PROPERTY_TYPE = 4;
pub const WEB_SOCKET_KEEPALIVE_INTERVAL_PROPERTY_TYPE = 5;
pub const WEB_SOCKET_SUPPORTED_VERSIONS_PROPERTY_TYPE = 6;
pub const WEB_SOCKET_SEND_ACTION_QUEUE = 1;
pub const WEB_SOCKET_RECEIVE_ACTION_QUEUE = 2;
pub const WEB_SOCKET_ALL_ACTION_QUEUE = 3;
pub const WEB_SOCKET_UTF8_MESSAGE_BUFFER_TYPE = -2147483648;
pub const WEB_SOCKET_UTF8_FRAGMENT_BUFFER_TYPE = -2147483647;
pub const WEB_SOCKET_BINARY_MESSAGE_BUFFER_TYPE = -2147483646;
pub const WEB_SOCKET_BINARY_FRAGMENT_BUFFER_TYPE = -2147483645;
pub const WEB_SOCKET_CLOSE_BUFFER_TYPE = -2147483644;
pub const WEB_SOCKET_PING_PONG_BUFFER_TYPE = -2147483643;
pub const WEB_SOCKET_UNSOLICITED_PONG_BUFFER_TYPE = -2147483642;
pub const WEB_SOCKET_NO_ACTION = 0;
pub const WEB_SOCKET_SEND_TO_NETWORK_ACTION = 1;
pub const WEB_SOCKET_INDICATE_SEND_COMPLETE_ACTION = 2;
pub const WEB_SOCKET_RECEIVE_FROM_NETWORK_ACTION = 3;
pub const WEB_SOCKET_INDICATE_RECEIVE_COMPLETE_ACTION = 4;

pub const aliases = struct {
    pub const WEB_SOCKET_CLOSE_STATUS = i32;
    pub const WEB_SOCKET_PROPERTY_TYPE = i32;
    pub const WEB_SOCKET_ACTION_QUEUE = i32;
    pub const WEB_SOCKET_BUFFER_TYPE = i32;
    pub const WEB_SOCKET_ACTION = i32;
    pub const WEB_SOCKET_HANDLE = ?*anyopaque;
};
