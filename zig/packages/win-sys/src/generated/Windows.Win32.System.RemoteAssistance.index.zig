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

pub const DISPID_EVENT_ON_STATE_CHANGED = 5;
pub const DISPID_EVENT_ON_TERMINATION = 6;
pub const DISPID_EVENT_ON_CONTEXT_DATA = 7;
pub const DISPID_EVENT_ON_SEND_ERROR = 8;
pub const RSS_UNKNOWN = 0;
pub const RSS_READY = 1;
pub const RSS_INVITATION = 2;
pub const RSS_ACCEPTED = 3;
pub const RSS_CONNECTED = 4;
pub const RSS_CANCELLED = 5;
pub const RSS_DECLINED = 6;
pub const RSS_TERMINATED = 7;
pub const RSF_NONE = 0;
pub const RSF_INVITER = 1;
pub const RSF_INVITEE = 2;
pub const RSF_ORIGINAL_INVITER = 4;
pub const RSF_REMOTE_LEGACYSESSION = 8;
pub const RSF_REMOTE_WIN7SESSION = 16;

pub const aliases = struct {
    pub const RENDEZVOUS_SESSION_STATE = i32;
    pub const RENDEZVOUS_SESSION_FLAGS = i32;
};
