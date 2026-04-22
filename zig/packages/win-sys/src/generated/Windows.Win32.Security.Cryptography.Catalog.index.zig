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
    .{ "CryptCATOpen", MethodRecord{ .library = "WINTRUST", .import = "CryptCATOpen", .signature = "\x00\x05\x11\x80\x85\x11\x05\x11\x9b\xb1\x19\x11\x9b\xad\x09" } },
    .{ "CryptCATClose", MethodRecord{ .library = "WINTRUST", .import = "CryptCATClose", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "CryptCATStoreFromHandle", MethodRecord{ .library = "WINTRUST", .import = "CryptCATStoreFromHandle", .signature = "\x00\x01\x0f\x11\xbc\x45\x11\x80\x85" } },
    .{ "CryptCATHandleFromStore", MethodRecord{ .library = "WINTRUST", .import = "CryptCATHandleFromStore", .signature = "\x00\x01\x11\x80\x85\x0f\x11\xbc\x45" } },
    .{ "CryptCATPersistStore", MethodRecord{ .library = "WINTRUST", .import = "CryptCATPersistStore", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "CryptCATGetCatAttrInfo", MethodRecord{ .library = "WINTRUST", .import = "CryptCATGetCatAttrInfo", .signature = "\x00\x02\x0f\x11\xbc\x49\x11\x80\x85\x11\x05" } },
    .{ "CryptCATPutCatAttrInfo", MethodRecord{ .library = "WINTRUST", .import = "CryptCATPutCatAttrInfo", .signature = "\x00\x05\x0f\x11\xbc\x49\x11\x80\x85\x11\x05\x09\x09\x0f\x05" } },
    .{ "CryptCATEnumerateCatAttr", MethodRecord{ .library = "WINTRUST", .import = "CryptCATEnumerateCatAttr", .signature = "\x00\x02\x0f\x11\xbc\x49\x11\x80\x85\x0f\x11\xbc\x49" } },
    .{ "CryptCATGetMemberInfo", MethodRecord{ .library = "WINTRUST", .import = "CryptCATGetMemberInfo", .signature = "\x00\x02\x0f\x11\xbc\x4d\x11\x80\x85\x11\x05" } },
    .{ "CryptCATAllocSortedMemberInfo", MethodRecord{ .library = "WINTRUST", .import = "CryptCATAllocSortedMemberInfo", .signature = "\x00\x02\x0f\x11\xbc\x4d\x11\x80\x85\x11\x05" } },
    .{ "CryptCATFreeSortedMemberInfo", MethodRecord{ .library = "WINTRUST", .import = "CryptCATFreeSortedMemberInfo", .signature = "\x00\x02\x01\x11\x80\x85\x0f\x11\xbc\x4d" } },
    .{ "CryptCATGetAttrInfo", MethodRecord{ .library = "WINTRUST", .import = "CryptCATGetAttrInfo", .signature = "\x00\x03\x0f\x11\xbc\x49\x11\x80\x85\x0f\x11\xbc\x4d\x11\x05" } },
    .{ "CryptCATPutMemberInfo", MethodRecord{ .library = "WINTRUST", .import = "CryptCATPutMemberInfo", .signature = "\x00\x07\x0f\x11\xbc\x4d\x11\x80\x85\x11\x05\x11\x05\x0f\x11\x0d\x09\x09\x0f\x05" } },
    .{ "CryptCATPutAttrInfo", MethodRecord{ .library = "WINTRUST", .import = "CryptCATPutAttrInfo", .signature = "\x00\x06\x0f\x11\xbc\x49\x11\x80\x85\x0f\x11\xbc\x4d\x11\x05\x09\x09\x0f\x05" } },
    .{ "CryptCATEnumerateMember", MethodRecord{ .library = "WINTRUST", .import = "CryptCATEnumerateMember", .signature = "\x00\x02\x0f\x11\xbc\x4d\x11\x80\x85\x0f\x11\xbc\x4d" } },
    .{ "CryptCATEnumerateAttr", MethodRecord{ .library = "WINTRUST", .import = "CryptCATEnumerateAttr", .signature = "\x00\x03\x0f\x11\xbc\x49\x11\x80\x85\x0f\x11\xbc\x4d\x0f\x11\xbc\x49" } },
    .{ "CryptCATCDFOpen", MethodRecord{ .library = "WINTRUST", .import = "CryptCATCDFOpen", .signature = "\x00\x02\x0f\x11\xbc\x51\x11\x05\x12\xbc\x55" } },
    .{ "CryptCATCDFClose", MethodRecord{ .library = "WINTRUST", .import = "CryptCATCDFClose", .signature = "\x00\x01\x11\x59\x0f\x11\xbc\x51" } },
    .{ "CryptCATCDFEnumCatAttributes", MethodRecord{ .library = "WINTRUST", .import = "CryptCATCDFEnumCatAttributes", .signature = "\x00\x03\x0f\x11\xbc\x49\x0f\x11\xbc\x51\x0f\x11\xbc\x49\x12\xbc\x55" } },
    .{ "CryptCATCDFEnumMembers", MethodRecord{ .library = "WINTRUST", .import = "CryptCATCDFEnumMembers", .signature = "\x00\x03\x0f\x11\xbc\x4d\x0f\x11\xbc\x51\x0f\x11\xbc\x4d\x12\xbc\x55" } },
    .{ "CryptCATCDFEnumAttributes", MethodRecord{ .library = "WINTRUST", .import = "CryptCATCDFEnumAttributes", .signature = "\x00\x04\x0f\x11\xbc\x49\x0f\x11\xbc\x51\x0f\x11\xbc\x4d\x0f\x11\xbc\x49\x12\xbc\x55" } },
    .{ "IsCatalogFile", MethodRecord{ .library = "WINTRUST", .import = "IsCatalogFile", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x05" } },
    .{ "CryptCATAdminAcquireContext", MethodRecord{ .library = "WINTRUST", .import = "CryptCATAdminAcquireContext", .signature = "\x00\x03\x11\x59\x0f\x18\x0f\x11\x0d\x09" } },
    .{ "CryptCATAdminAcquireContext2", MethodRecord{ .library = "WINTRUST", .import = "CryptCATAdminAcquireContext2", .signature = "\x00\x05\x11\x59\x0f\x18\x0f\x11\x0d\x11\x05\x0f\x11\x85\xb1\x09" } },
    .{ "CryptCATAdminReleaseContext", MethodRecord{ .library = "WINTRUST", .import = "CryptCATAdminReleaseContext", .signature = "\x00\x02\x11\x59\x18\x09" } },
    .{ "CryptCATAdminReleaseCatalogContext", MethodRecord{ .library = "WINTRUST", .import = "CryptCATAdminReleaseCatalogContext", .signature = "\x00\x03\x11\x59\x18\x18\x09" } },
    .{ "CryptCATAdminEnumCatalogFromHash", MethodRecord{ .library = "WINTRUST", .import = "CryptCATAdminEnumCatalogFromHash", .signature = "\x00\x05\x18\x18\x0f\x05\x09\x09\x0f\x18" } },
    .{ "CryptCATAdminCalcHashFromFileHandle", MethodRecord{ .library = "WINTRUST", .import = "CryptCATAdminCalcHashFromFileHandle", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x09\x0f\x05\x09" } },
    .{ "CryptCATAdminCalcHashFromFileHandle2", MethodRecord{ .library = "WINTRUST", .import = "CryptCATAdminCalcHashFromFileHandle2", .signature = "\x00\x05\x11\x59\x18\x11\x80\x85\x0f\x09\x0f\x05\x09" } },
    .{ "CryptCATAdminAddCatalog", MethodRecord{ .library = "WINTRUST", .import = "CryptCATAdminAddCatalog", .signature = "\x00\x04\x18\x18\x11\x05\x11\x05\x09" } },
    .{ "CryptCATAdminRemoveCatalog", MethodRecord{ .library = "WINTRUST", .import = "CryptCATAdminRemoveCatalog", .signature = "\x00\x03\x11\x59\x18\x11\x05\x09" } },
    .{ "CryptCATCatalogInfoFromContext", MethodRecord{ .library = "WINTRUST", .import = "CryptCATCatalogInfoFromContext", .signature = "\x00\x03\x11\x59\x18\x0f\x11\xbc\x59\x09" } },
    .{ "CryptCATAdminResolveCatalogPath", MethodRecord{ .library = "WINTRUST", .import = "CryptCATAdminResolveCatalogPath", .signature = "\x00\x04\x11\x59\x18\x11\x05\x0f\x11\xbc\x59\x09" } },
    .{ "CryptCATAdminPauseServiceForBackup", MethodRecord{ .library = "WINTRUST", .import = "CryptCATAdminPauseServiceForBackup", .signature = "\x00\x02\x11\x59\x09\x11\x59" } },
    .{ "CryptCATCDFEnumMembersByCDFTagEx", MethodRecord{ .library = "WINTRUST", .import = "CryptCATCDFEnumMembersByCDFTagEx", .signature = "\x00\x06\x11\x05\x0f\x11\xbc\x51\x11\x05\x12\xbc\x55\x0f\x0f\x11\xbc\x4d\x11\x59\x0f\x01" } },
    .{ "CryptCATCDFEnumAttributesWithCDFTag", MethodRecord{ .library = "WINTRUST", .import = "CryptCATCDFEnumAttributesWithCDFTag", .signature = "\x00\x05\x0f\x11\xbc\x49\x0f\x11\xbc\x51\x11\x05\x0f\x11\xbc\x4d\x0f\x11\xbc\x49\x12\xbc\x55" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x5b1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_STRONG_SIGN_PARA" },
        0x1bad => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.Catalog", .name = "CRYPTCAT_VERSION" },
        0x1bb1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.Catalog", .name = "CRYPTCAT_OPEN_FLAGS" },
        0x3c45 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.Catalog", .name = "CRYPTCATSTORE" },
        0x3c49 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.Catalog", .name = "CRYPTCATATTRIBUTE" },
        0x3c4d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.Catalog", .name = "CRYPTCATMEMBER" },
        0x3c51 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.Catalog", .name = "CRYPTCATCDF" },
        0x3c55 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.Catalog", .name = "PFN_CDF_PARSE_ERROR_CALLBACK" },
        0x3c59 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.Catalog", .name = "CATALOG_INFO" },
        else => null,
    };
}

pub const CRYPTCAT_VERSION_1 = 256;
pub const CRYPTCAT_VERSION_2 = 512;
pub const CRYPTCAT_OPEN_ALWAYS = 2;
pub const CRYPTCAT_OPEN_CREATENEW = 1;
pub const CRYPTCAT_OPEN_EXISTING = 4;
pub const CRYPTCAT_OPEN_EXCLUDE_PAGE_HASHES = 65536;
pub const CRYPTCAT_OPEN_INCLUDE_PAGE_HASHES = 131072;
pub const CRYPTCAT_OPEN_VERIFYSIGHASH = 268435456;
pub const CRYPTCAT_OPEN_NO_CONTENT_HCRYPTMSG = 536870912;
pub const CRYPTCAT_OPEN_SORTED = 1073741824;
pub const CRYPTCAT_OPEN_FLAGS_MASK = 4294901760;
pub const CRYPTCAT_ATTR_AUTHENTICATED = 268435456;
pub const CRYPTCAT_ATTR_UNAUTHENTICATED = 536870912;
pub const CRYPTCAT_ATTR_NAMEASCII = 1;
pub const CRYPTCAT_ATTR_NAMEOBJID = 2;
pub const CRYPTCAT_ATTR_DATAASCII = 65536;
pub const CRYPTCAT_ATTR_DATABASE64 = 131072;
pub const CRYPTCAT_ATTR_DATAREPLACE = 262144;
pub const CRYPTCAT_ATTR_NO_AUTO_COMPAT_ENTRY = 16777216;
pub const CRYPTCAT_MAX_MEMBERTAG = 64;
pub const CRYPTCAT_MEMBER_SORTED = 1073741824;
pub const CRYPTCAT_E_AREA_HEADER = 0;
pub const CRYPTCAT_E_AREA_MEMBER = 65536;
pub const CRYPTCAT_E_AREA_ATTRIBUTE = 131072;
pub const CRYPTCAT_E_CDF_UNSUPPORTED = 1;
pub const CRYPTCAT_E_CDF_DUPLICATE = 2;
pub const CRYPTCAT_E_CDF_TAGNOTFOUND = 4;
pub const CRYPTCAT_E_CDF_MEMBER_FILE_PATH = 65537;
pub const CRYPTCAT_E_CDF_MEMBER_INDIRECTDATA = 65538;
pub const CRYPTCAT_E_CDF_MEMBER_FILENOTFOUND = 65540;
pub const CRYPTCAT_E_CDF_BAD_GUID_CONV = 131073;
pub const CRYPTCAT_E_CDF_ATTR_TOOFEWVALUES = 131074;
pub const CRYPTCAT_E_CDF_ATTR_TYPECOMBO = 131076;
pub const CRYPTCAT_ADDCATALOG_NONE = 0;
pub const CRYPTCAT_ADDCATALOG_HARDLINK = 1;

pub const aliases = struct {
    pub const CRYPTCAT_VERSION = u32;
    pub const CRYPTCAT_OPEN_FLAGS = u32;
    pub const CRYPTCATATTRIBUTE_FLAGS = u32;
};
