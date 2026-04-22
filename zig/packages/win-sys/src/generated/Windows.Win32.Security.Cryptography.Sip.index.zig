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
    .{ "CryptSIPGetSignedDataMsg", MethodRecord{ .library = "WINTRUST", .import = "CryptSIPGetSignedDataMsg", .signature = "\x00\x05\x11\x59\x0f\x11\xbc\x5d\x0f\x11\x85\x01\x09\x0f\x09\x0f\x05" } },
    .{ "CryptSIPPutSignedDataMsg", MethodRecord{ .library = "WINTRUST", .import = "CryptSIPPutSignedDataMsg", .signature = "\x00\x05\x11\x59\x0f\x11\xbc\x5d\x11\x85\x01\x0f\x09\x09\x0f\x05" } },
    .{ "CryptSIPCreateIndirectData", MethodRecord{ .library = "WINTRUST", .import = "CryptSIPCreateIndirectData", .signature = "\x00\x03\x11\x59\x0f\x11\xbc\x5d\x0f\x09\x0f\x11\xbc\x61" } },
    .{ "CryptSIPVerifyIndirectData", MethodRecord{ .library = "WINTRUST", .import = "CryptSIPVerifyIndirectData", .signature = "\x00\x02\x11\x59\x0f\x11\xbc\x5d\x0f\x11\xbc\x61" } },
    .{ "CryptSIPRemoveSignedDataMsg", MethodRecord{ .library = "WINTRUST", .import = "CryptSIPRemoveSignedDataMsg", .signature = "\x00\x02\x11\x59\x0f\x11\xbc\x5d\x09" } },
    .{ "CryptSIPLoad", MethodRecord{ .library = "CRYPT32", .import = "CryptSIPLoad", .signature = "\x00\x03\x11\x59\x0f\x11\x0d\x09\x0f\x11\xbc\x65" } },
    .{ "CryptSIPRetrieveSubjectGuid", MethodRecord{ .library = "CRYPT32", .import = "CryptSIPRetrieveSubjectGuid", .signature = "\x00\x03\x11\x59\x11\x05\x11\x80\x85\x0f\x11\x0d" } },
    .{ "CryptSIPRetrieveSubjectGuidForCatalogFile", MethodRecord{ .library = "CRYPT32", .import = "CryptSIPRetrieveSubjectGuidForCatalogFile", .signature = "\x00\x03\x11\x59\x11\x05\x11\x80\x85\x0f\x11\x0d" } },
    .{ "CryptSIPAddProvider", MethodRecord{ .library = "CRYPT32", .import = "CryptSIPAddProvider", .signature = "\x00\x01\x11\x59\x0f\x11\xbc\x69" } },
    .{ "CryptSIPRemoveProvider", MethodRecord{ .library = "CRYPT32", .import = "CryptSIPRemoveProvider", .signature = "\x00\x01\x11\x59\x0f\x11\x0d" } },
    .{ "CryptSIPGetCaps", MethodRecord{ .library = "WINTRUST", .import = "CryptSIPGetCaps", .signature = "\x00\x02\x11\x59\x0f\x11\xbc\x5d\x0f\x11\xbc\x6d" } },
    .{ "CryptSIPGetSealedDigest", MethodRecord{ .library = "WINTRUST", .import = "CryptSIPGetSealedDigest", .signature = "\x00\x05\x11\x59\x0f\x11\xbc\x5d\x0f\x05\x09\x0f\x05\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x501 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_QUERY_ENCODING_TYPE" },
        0x3c5d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.Sip", .name = "SIP_SUBJECTINFO" },
        0x3c61 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.Sip", .name = "SIP_INDIRECT_DATA" },
        0x3c65 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.Sip", .name = "SIP_DISPATCH_INFO" },
        0x3c69 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.Sip", .name = "SIP_ADD_NEWPROVIDER" },
        0x3c6d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.Sip", .name = "SIP_CAP_SET_V3" },
        else => null,
    };
}

pub const MSSIP_FLAGS_PROHIBIT_RESIZE_ON_CREATE = 65536;
pub const MSSIP_FLAGS_USE_CATALOG = 131072;
pub const MSSIP_FLAGS_MULTI_HASH = 262144;
pub const SPC_RELAXED_PE_MARKER_CHECK = 2048;
pub const SPC_MARKER_CHECK_SKIP_SIP_INDIRECT_DATA_FLAG = 1;
pub const SPC_MARKER_CHECK_CURRENTLY_SUPPORTED_FLAGS = 1;
pub const MSSIP_ADDINFO_NONE = 0;
pub const MSSIP_ADDINFO_FLAT = 1;
pub const MSSIP_ADDINFO_CATMEMBER = 2;
pub const MSSIP_ADDINFO_BLOB = 3;
pub const MSSIP_ADDINFO_DETACHEDSIG = 4;
pub const MSSIP_ADDINFO_NONMSSIP = 500;
pub const SIP_CAP_SET_VERSION_2 = 2;
pub const SIP_CAP_SET_VERSION_3 = 3;
pub const SIP_CAP_SET_CUR_VER = 3;
pub const SIP_CAP_FLAG_SEALING = 1;
pub const SIP_MAX_MAGIC_NUMBER = 4;
