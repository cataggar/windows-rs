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
    .{ "DavAddConnection", MethodRecord{ .library = "NETAPI32", .import = "DavAddConnection", .signature = "\x00\x06\x09\x0f\x11\x80\x85\x11\x05\x11\x05\x11\x05\x0f\x05\x09" } },
    .{ "DavDeleteConnection", MethodRecord{ .library = "NETAPI32", .import = "DavDeleteConnection", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "DavGetUNCFromHTTPPath", MethodRecord{ .library = "NETAPI32", .import = "DavGetUNCFromHTTPPath", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "DavGetHTTPFromUNCPath", MethodRecord{ .library = "NETAPI32", .import = "DavGetHTTPFromUNCPath", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "DavGetTheLockOwnerOfTheFile", MethodRecord{ .library = "davclnt", .import = "DavGetTheLockOwnerOfTheFile", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "DavGetExtendedError", MethodRecord{ .library = "NETAPI32", .import = "DavGetExtendedError", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x09\x11\x05\x0f\x09" } },
    .{ "DavFlushFile", MethodRecord{ .library = "NETAPI32", .import = "DavFlushFile", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "DavInvalidateCache", MethodRecord{ .library = "davclnt", .import = "DavInvalidateCache", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "DavCancelConnectionsToServer", MethodRecord{ .library = "davclnt", .import = "DavCancelConnectionsToServer", .signature = "\x00\x02\x09\x11\x05\x11\x59" } },
    .{ "DavRegisterAuthCallback", MethodRecord{ .library = "davclnt", .import = "DavRegisterAuthCallback", .signature = "\x00\x02\x09\x12\xb9\x99\x09" } },
    .{ "DavUnregisterAuthCallback", MethodRecord{ .library = "davclnt", .import = "DavUnregisterAuthCallback", .signature = "\x00\x01\x01\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x3999 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WebDav", .name = "PFNDAVAUTHCALLBACK" },
        else => null,
    };
}

pub const DAV_AUTHN_SCHEME_BASIC = 1;
pub const DAV_AUTHN_SCHEME_NTLM = 2;
pub const DAV_AUTHN_SCHEME_PASSPORT = 4;
pub const DAV_AUTHN_SCHEME_DIGEST = 8;
pub const DAV_AUTHN_SCHEME_NEGOTIATE = 16;
pub const DAV_AUTHN_SCHEME_CERT = 65536;
pub const DAV_AUTHN_SCHEME_FBA = 1048576;
pub const DefaultBehavior = 0;
pub const RetryRequest = 1;
pub const CancelRequest = 2;

pub const aliases = struct {
    pub const AUTHNEXTSTEP = i32;
    pub const PFNDAVAUTHCALLBACK_FREECRED = ?*const anyopaque;
    pub const PFNDAVAUTHCALLBACK = ?*const anyopaque;
};
