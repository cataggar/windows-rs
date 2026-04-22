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
    .{ "CryptUIDlgViewContext", MethodRecord{ .library = "CRYPTUI", .import = "CryptUIDlgViewContext", .signature = "\x00\x06\x11\x59\x09\x0f\x01\x11\x25\x11\x05\x09\x0f\x01" } },
    .{ "CryptUIDlgSelectCertificateFromStore", MethodRecord{ .library = "CRYPTUI", .import = "CryptUIDlgSelectCertificateFromStore", .signature = "\x00\x07\x0f\x11\x7d\x11\x85\x3d\x11\x25\x11\x05\x11\x05\x09\x09\x0f\x01" } },
    .{ "CertSelectionGetSerializedBlob", MethodRecord{ .library = "CRYPTUI", .import = "CertSelectionGetSerializedBlob", .signature = "\x00\x03\x11\x79\x0f\x11\xbc\x71\x0f\x0f\x01\x0f\x09" } },
    .{ "CryptUIDlgCertMgr", MethodRecord{ .library = "CRYPTUI", .import = "CryptUIDlgCertMgr", .signature = "\x00\x01\x11\x59\x0f\x11\xbc\x75" } },
    .{ "CryptUIWizDigitalSign", MethodRecord{ .library = "CRYPTUI", .import = "CryptUIWizDigitalSign", .signature = "\x00\x05\x11\x59\x09\x11\x25\x11\x05\x0f\x11\xbc\x79\x0f\x0f\x11\xbc\x7d" } },
    .{ "CryptUIWizFreeDigitalSignContext", MethodRecord{ .library = "CRYPTUI", .import = "CryptUIWizFreeDigitalSignContext", .signature = "\x00\x01\x11\x59\x0f\x11\xbc\x7d" } },
    .{ "CryptUIDlgViewCertificateW", MethodRecord{ .library = "CRYPTUI", .import = "CryptUIDlgViewCertificateW", .signature = "\x00\x02\x11\x59\x0f\x11\xbc\x81\x0f\x11\x59" } },
    .{ "CryptUIDlgViewCertificateA", MethodRecord{ .library = "CRYPTUI", .import = "CryptUIDlgViewCertificateA", .signature = "\x00\x02\x11\x59\x0f\x11\xbc\x85\x0f\x11\x59" } },
    .{ "CryptUIWizExport", MethodRecord{ .library = "CRYPTUI", .import = "CryptUIWizExport", .signature = "\x00\x05\x11\x59\x11\x9c\x9d\x11\x25\x11\x05\x0f\x11\xbc\x89\x0f\x01" } },
    .{ "CryptUIWizImport", MethodRecord{ .library = "CRYPTUI", .import = "CryptUIWizImport", .signature = "\x00\x05\x11\x59\x11\x9c\x9d\x11\x25\x11\x05\x0f\x11\xbc\x8d\x11\x85\x3d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x7d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CONTEXT" },
        0x53d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "HCERTSTORE" },
        0x1c9d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.UI", .name = "CRYPTUI_WIZ_FLAGS" },
        0x3c71 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.UI", .name = "CERT_SELECTUI_INPUT" },
        0x3c75 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.UI", .name = "CRYPTUI_CERT_MGR_STRUCT" },
        0x3c79 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.UI", .name = "CRYPTUI_WIZ_DIGITAL_SIGN_INFO" },
        0x3c7d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.UI", .name = "CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT" },
        0x3c81 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.UI", .name = "CRYPTUI_VIEWCERTIFICATE_STRUCTW" },
        0x3c85 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.UI", .name = "CRYPTUI_VIEWCERTIFICATE_STRUCTA" },
        0x3c89 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.UI", .name = "CRYPTUI_WIZ_EXPORT_INFO" },
        0x3c8d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography.UI", .name = "CRYPTUI_WIZ_IMPORT_SRC_INFO" },
        else => null,
    };
}

pub const CRYPTUI_WIZ_NO_UI = 1;
pub const CRYPTUI_WIZ_IGNORE_NO_UI_FLAG_FOR_CSPS = 2;
pub const CRYPTUI_WIZ_NO_UI_EXCEPT_CSP = 3;
pub const CRYPTUI_WIZ_IMPORT_ALLOW_CERT = 131072;
pub const CRYPTUI_WIZ_IMPORT_ALLOW_CRL = 262144;
pub const CRYPTUI_WIZ_IMPORT_ALLOW_CTL = 524288;
pub const CRYPTUI_WIZ_IMPORT_NO_CHANGE_DEST_STORE = 65536;
pub const CRYPTUI_WIZ_IMPORT_TO_LOCALMACHINE = 1048576;
pub const CRYPTUI_WIZ_IMPORT_TO_CURRENTUSER = 2097152;
pub const CRYPTUI_WIZ_IMPORT_REMOTE_DEST_STORE = 4194304;
pub const CRYPTUI_WIZ_EXPORT_PRIVATE_KEY = 256;
pub const CRYPTUI_WIZ_EXPORT_NO_DELETE_PRIVATE_KEY = 512;
pub const CRYPTUI_HIDE_HIERARCHYPAGE = 1;
pub const CRYPTUI_HIDE_DETAILPAGE = 2;
pub const CRYPTUI_DISABLE_EDITPROPERTIES = 4;
pub const CRYPTUI_ENABLE_EDITPROPERTIES = 8;
pub const CRYPTUI_DISABLE_ADDTOSTORE = 16;
pub const CRYPTUI_ENABLE_ADDTOSTORE = 32;
pub const CRYPTUI_ACCEPT_DECLINE_STYLE = 64;
pub const CRYPTUI_IGNORE_UNTRUSTED_ROOT = 128;
pub const CRYPTUI_DONT_OPEN_STORES = 256;
pub const CRYPTUI_ONLY_OPEN_ROOT_STORE = 512;
pub const CRYPTUI_WARN_UNTRUSTED_ROOT = 1024;
pub const CRYPTUI_ENABLE_REVOCATION_CHECKING = 2048;
pub const CRYPTUI_WARN_REMOTE_TRUST = 4096;
pub const CRYPTUI_DISABLE_EXPORT = 8192;
pub const CRYPTUI_ENABLE_REVOCATION_CHECK_END_CERT = 16384;
pub const CRYPTUI_ENABLE_REVOCATION_CHECK_CHAIN = 32768;
pub const CRYPTUI_ENABLE_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 2048;
pub const CRYPTUI_DISABLE_HTMLLINK = 65536;
pub const CRYPTUI_DISABLE_ISSUERSTATEMENT = 131072;
pub const CRYPTUI_CACHE_ONLY_URL_RETRIEVAL = 262144;
pub const CSS_HIDE_PROPERTIES = 1;
pub const CSS_ENABLEHOOK = 2;
pub const CSS_ALLOWMULTISELECT = 4;
pub const CSS_SHOW_HELP = 16;
pub const CSS_ENABLETEMPLATE = 32;
pub const CSS_ENABLETEMPLATEHANDLE = 64;
pub const CRYPTUI_WIZ_IMPORT_SUBJECT_FILE = 1;
pub const CRYPTUI_WIZ_IMPORT_SUBJECT_CERT_CONTEXT = 2;
pub const CRYPTUI_WIZ_IMPORT_SUBJECT_CTL_CONTEXT = 3;
pub const CRYPTUI_WIZ_IMPORT_SUBJECT_CRL_CONTEXT = 4;
pub const CRYPTUI_WIZ_IMPORT_SUBJECT_CERT_STORE = 5;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_BLOB = 2;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_FILE = 1;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_NONE = 0;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_CERT = 1;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_STORE = 2;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_PVK = 3;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_NONE = 0;
pub const CRYPTUI_WIZ_EXPORT_CERT_CONTEXT = 1;
pub const CRYPTUI_WIZ_EXPORT_CTL_CONTEXT = 2;
pub const CRYPTUI_WIZ_EXPORT_CRL_CONTEXT = 3;
pub const CRYPTUI_WIZ_EXPORT_CERT_STORE = 4;
pub const CRYPTUI_WIZ_EXPORT_CERT_STORE_CERTIFICATES_ONLY = 5;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_COMMERCIAL = 1;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_INDIVIDUAL = 2;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE = 1;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_PVK_PROV = 2;
pub const CM_ENABLEHOOK = 1;
pub const CM_SHOW_HELP = 2;
pub const CM_SHOW_HELPICON = 4;
pub const CM_ENABLETEMPLATE = 8;
pub const CM_HIDE_ADVANCEPAGE = 16;
pub const CM_HIDE_TRUSTPAGE = 32;
pub const CM_NO_NAMECHANGE = 64;
pub const CM_NO_EDITTRUST = 128;
pub const CM_HIDE_DETAILPAGE = 256;
pub const CM_ADD_CERT_STORES = 512;
pub const CRYPTUI_WIZ_EXPORT_FORMAT_DER = 1;
pub const CRYPTUI_WIZ_EXPORT_FORMAT_PFX = 2;
pub const CRYPTUI_WIZ_EXPORT_FORMAT_PKCS7 = 3;
pub const CRYPTUI_WIZ_EXPORT_FORMAT_BASE64 = 4;
pub const CRYPTUI_WIZ_EXPORT_FORMAT_CRL = 6;
pub const CRYPTUI_WIZ_EXPORT_FORMAT_CTL = 7;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_ADD_CHAIN = 1;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_ADD_CHAIN_NO_ROOT = 2;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_ADD_NONE = 0;
pub const CTL_MODIFY_REQUEST_ADD_TRUSTED = 3;
pub const CTL_MODIFY_REQUEST_ADD_NOT_TRUSTED = 1;
pub const CTL_MODIFY_REQUEST_REMOVE = 2;
pub const CRYTPDLG_FLAGS_MASK = 4278190080;
pub const CRYPTDLG_REVOCATION_DEFAULT = 0;
pub const CRYPTDLG_REVOCATION_ONLINE = 2147483648;
pub const CRYPTDLG_REVOCATION_CACHE = 1073741824;
pub const CRYPTDLG_REVOCATION_NONE = 536870912;
pub const CRYPTDLG_CACHE_ONLY_URL_RETRIEVAL = 268435456;
pub const CRYPTDLG_DISABLE_AIA = 134217728;
pub const CRYPTDLG_POLICY_MASK = 65535;
pub const POLICY_IGNORE_NON_CRITICAL_BC = 1;
pub const CRYPTDLG_ACTION_MASK = 4294901760;
pub const ACTION_REVOCATION_DEFAULT_ONLINE = 65536;
pub const ACTION_REVOCATION_DEFAULT_CACHE = 131072;
pub const CERT_DISPWELL_SELECT = 1;
pub const CERT_DISPWELL_TRUST_CA_CERT = 2;
pub const CERT_DISPWELL_TRUST_LEAF_CERT = 3;
pub const CERT_DISPWELL_TRUST_ADD_CA_CERT = 4;
pub const CERT_DISPWELL_TRUST_ADD_LEAF_CERT = 5;
pub const CERT_DISPWELL_DISTRUST_CA_CERT = 6;
pub const CERT_DISPWELL_DISTRUST_LEAF_CERT = 7;
pub const CERT_DISPWELL_DISTRUST_ADD_CA_CERT = 8;
pub const CERT_DISPWELL_DISTRUST_ADD_LEAF_CERT = 9;
pub const CSS_SELECTCERT_MASK = 16777215;
pub const SELCERT_PROPERTIES = 100;
pub const SELCERT_FINEPRINT = 101;
pub const SELCERT_CERTLIST = 102;
pub const SELCERT_ISSUED_TO = 103;
pub const SELCERT_VALIDITY = 104;
pub const SELCERT_ALGORITHM = 105;
pub const SELCERT_SERIAL_NUM = 106;
pub const SELCERT_THUMBPRINT = 107;
pub const CM_VIEWFLAGS_MASK = 16777215;
pub const CERTVIEW_CRYPTUI_LPARAM = 8388608;
pub const CERT_FILTER_OP_EXISTS = 1;
pub const CERT_FILTER_OP_NOT_EXISTS = 2;
pub const CERT_FILTER_OP_EQUALITY = 3;
pub const CERT_FILTER_INCLUDE_V1_CERTS = 1;
pub const CERT_FILTER_VALID_TIME_RANGE = 2;
pub const CERT_FILTER_VALID_SIGNATURE = 4;
pub const CERT_FILTER_LEAF_CERTS_ONLY = 8;
pub const CERT_FILTER_ISSUER_CERTS_ONLY = 16;
pub const CERT_FILTER_KEY_EXISTS = 32;
pub const CERT_VALIDITY_BEFORE_START = 1;
pub const CERT_VALIDITY_AFTER_END = 2;
pub const CERT_VALIDITY_SIGNATURE_FAILS = 4;
pub const CERT_VALIDITY_CERTIFICATE_REVOKED = 8;
pub const CERT_VALIDITY_KEY_USAGE_EXT_FAILURE = 16;
pub const CERT_VALIDITY_EXTENDED_USAGE_FAILURE = 32;
pub const CERT_VALIDITY_NAME_CONSTRAINTS_FAILURE = 64;
pub const CERT_VALIDITY_UNKNOWN_CRITICAL_EXTENSION = 128;
pub const CERT_VALIDITY_ISSUER_INVALID = 256;
pub const CERT_VALIDITY_OTHER_EXTENSION_FAILURE = 512;
pub const CERT_VALIDITY_PERIOD_NESTING_FAILURE = 1024;
pub const CERT_VALIDITY_OTHER_ERROR = 2048;
pub const CERT_VALIDITY_ISSUER_DISTRUST = 33554432;
pub const CERT_VALIDITY_EXPLICITLY_DISTRUSTED = 16777216;
pub const CERT_VALIDITY_NO_ISSUER_CERT_FOUND = 268435456;
pub const CERT_VALIDITY_NO_CRL_FOUND = 536870912;
pub const CERT_VALIDITY_CRL_OUT_OF_DATE = 1073741824;
pub const CERT_VALIDITY_NO_TRUST_DATA = 2147483648;
pub const CERT_VALIDITY_MASK_TRUST = 4294901760;
pub const CERT_VALIDITY_MASK_VALIDITY = 65535;
pub const CERT_TRUST_MASK = 16777215;
pub const CERT_TRUST_DO_FULL_SEARCH = 1;
pub const CERT_TRUST_PERMIT_MISSING_CRLS = 2;
pub const CERT_TRUST_DO_FULL_TRUST = 5;
pub const CERT_CREDENTIAL_PROVIDER_ID = -509;
pub const CRYPTUI_SELECT_ISSUEDTO_COLUMN = 1;
pub const CRYPTUI_SELECT_ISSUEDBY_COLUMN = 2;
pub const CRYPTUI_SELECT_INTENDEDUSE_COLUMN = 4;
pub const CRYPTUI_SELECT_FRIENDLYNAME_COLUMN = 8;
pub const CRYPTUI_SELECT_LOCATION_COLUMN = 16;
pub const CRYPTUI_SELECT_EXPIRATION_COLUMN = 32;
pub const CRYPTUI_CERT_MGR_TAB_MASK = 15;
pub const CRYPTUI_CERT_MGR_PUBLISHER_TAB = 4;
pub const CRYPTUI_CERT_MGR_SINGLE_TAB_FLAG = 32768;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_EXCLUDE_PAGE_HASHES = 2;
pub const CRYPTUI_WIZ_DIGITAL_SIGN_INCLUDE_PAGE_HASHES = 4;
pub const CRYPTUI_WIZ_EXPORT_FORMAT_SERIALIZED_CERT_STORE = 5;

pub const aliases = struct {
    pub const CRYPTUI_WIZ_FLAGS = u32;
    pub const CRYPTUI_VIEWCERTIFICATE_FLAGS = u32;
    pub const CERT_SELECT_STRUCT_FLAGS = u32;
    pub const CRYPTUI_WIZ_IMPORT_SUBJECT_OPTION = u32;
    pub const CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT = u32;
    pub const CRYPTUI_WIZ_DIGITAL_SIGN = u32;
    pub const CRYPTUI_WIZ_EXPORT_SUBJECT = u32;
    pub const CRYPTUI_WIZ_DIGITAL_SIGN_SIG_TYPE = u32;
    pub const CRYPTUI_WIZ_DIGITAL_SIGN_PVK_OPTION = u32;
    pub const CERT_VIEWPROPERTIES_STRUCT_FLAGS = u32;
    pub const CRYPTUI_WIZ_EXPORT_FORMAT = u32;
    pub const CRYPTUI_WIZ_DIGITAL_ADDITIONAL_CERT_CHOICE = u32;
    pub const CTL_MODIFY_REQUEST_OPERATION = u32;
    pub const PFNCMFILTERPROC = ?*const anyopaque;
    pub const PFNCMHOOKPROC = ?*const anyopaque;
    pub const PFNTRUSTHELPER = ?*const anyopaque;
    pub const PFNCFILTERPROC = ?*const anyopaque;
};
