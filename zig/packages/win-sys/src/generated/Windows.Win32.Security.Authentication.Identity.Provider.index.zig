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
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const IDENTITIES_ALL = 0;
pub const IDENTITIES_ME_ONLY = 1;
pub const IDENTITY_ASSOCIATED = 1;
pub const IDENTITY_DISASSOCIATED = 2;
pub const IDENTITY_CREATED = 4;
pub const IDENTITY_IMPORTED = 8;
pub const IDENTITY_DELETED = 16;
pub const IDENTITY_PROPCHANGED = 32;
pub const IDENTITY_CONNECTED = 64;
pub const IDENTITY_DISCONNECTED = 128;
pub const IDENTITY_URL_CREATE_ACCOUNT_WIZARD = 0;
pub const IDENTITY_URL_SIGN_IN_WIZARD = 1;
pub const IDENTITY_URL_CHANGE_PASSWORD_WIZARD = 2;
pub const IDENTITY_URL_IFEXISTS_WIZARD = 3;
pub const IDENTITY_URL_ACCOUNT_SETTINGS = 4;
pub const IDENTITY_URL_RESTORE_WIZARD = 5;
pub const IDENTITY_URL_CONNECT_WIZARD = 6;
pub const NOT_CONNECTED = 0;
pub const CONNECTING = 1;
pub const CONNECT_COMPLETED = 2;

pub const aliases = struct {
    pub const IDENTITY_TYPE = i32;
    pub const IdentityUpdateEvent = i32;
    pub const IDENTITY_URL = i32;
    pub const ACCOUNT_STATE = i32;
};
