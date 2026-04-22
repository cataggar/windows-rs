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
    .{ "MAPIFreeBuffer", MethodRecord{ .library = "MAPI32", .import = "MAPIFreeBuffer", .signature = "\x00\x01\x09\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const MAPI_OLE = 1;
pub const MAPI_OLE_STATIC = 2;
pub const MAPI_ORIG = 0;
pub const MAPI_TO = 1;
pub const MAPI_CC = 2;
pub const MAPI_BCC = 3;
pub const MAPI_UNREAD = 1;
pub const MAPI_RECEIPT_REQUESTED = 2;
pub const MAPI_SENT = 4;
pub const MAPI_LOGON_UI = 1;
pub const MAPI_PASSWORD_UI = 131072;
pub const MAPI_NEW_SESSION = 2;
pub const MAPI_FORCE_DOWNLOAD = 4096;
pub const MAPI_EXTENDED = 32;
pub const MAPI_DIALOG = 8;
pub const MAPI_FORCE_UNICODE = 262144;
pub const MAPI_UNREAD_ONLY = 32;
pub const MAPI_GUARANTEE_FIFO = 256;
pub const MAPI_LONG_MSGID = 16384;
pub const MAPI_PEEK = 128;
pub const MAPI_SUPPRESS_ATTACH = 2048;
pub const MAPI_ENVELOPE_ONLY = 64;
pub const MAPI_BODY_AS_FILE = 512;
pub const MAPI_AB_NOMODIFY = 1024;
pub const SUCCESS_SUCCESS = 0;
pub const MAPI_USER_ABORT = 1;
pub const MAPI_E_USER_ABORT = 1;
pub const MAPI_E_FAILURE = 2;
pub const MAPI_E_LOGON_FAILURE = 3;
pub const MAPI_E_LOGIN_FAILURE = 3;
pub const MAPI_E_DISK_FULL = 4;
pub const MAPI_E_INSUFFICIENT_MEMORY = 5;
pub const MAPI_E_ACCESS_DENIED = 6;
pub const MAPI_E_TOO_MANY_SESSIONS = 8;
pub const MAPI_E_TOO_MANY_FILES = 9;
pub const MAPI_E_TOO_MANY_RECIPIENTS = 10;
pub const MAPI_E_ATTACHMENT_NOT_FOUND = 11;
pub const MAPI_E_ATTACHMENT_OPEN_FAILURE = 12;
pub const MAPI_E_ATTACHMENT_WRITE_FAILURE = 13;
pub const MAPI_E_UNKNOWN_RECIPIENT = 14;
pub const MAPI_E_BAD_RECIPTYPE = 15;
pub const MAPI_E_NO_MESSAGES = 16;
pub const MAPI_E_INVALID_MESSAGE = 17;
pub const MAPI_E_TEXT_TOO_LARGE = 18;
pub const MAPI_E_INVALID_SESSION = 19;
pub const MAPI_E_TYPE_NOT_SUPPORTED = 20;
pub const MAPI_E_AMBIGUOUS_RECIPIENT = 21;
pub const MAPI_E_AMBIG_RECIP = 21;
pub const MAPI_E_MESSAGE_IN_USE = 22;
pub const MAPI_E_NETWORK_FAILURE = 23;
pub const MAPI_E_INVALID_EDITFIELDS = 24;
pub const MAPI_E_INVALID_RECIPS = 25;
pub const MAPI_E_NOT_SUPPORTED = 26;
pub const MAPI_E_UNICODE_NOT_SUPPORTED = 27;
pub const MAPI_E_ATTACHMENT_TOO_LARGE = 28;
