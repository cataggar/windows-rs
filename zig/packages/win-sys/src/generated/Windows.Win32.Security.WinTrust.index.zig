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
    .{ "WinVerifyTrust", MethodRecord{ .library = "WINTRUST", .import = "WinVerifyTrust", .signature = "\x00\x03\x08\x11\x25\x0f\x11\x0d\x0f\x01" } },
    .{ "WinVerifyTrustEx", MethodRecord{ .library = "WINTRUST", .import = "WinVerifyTrustEx", .signature = "\x00\x03\x08\x11\x25\x0f\x11\x0d\x0f\x11\xbc\xcd" } },
    .{ "WintrustGetRegPolicyFlags", MethodRecord{ .library = "WINTRUST", .import = "WintrustGetRegPolicyFlags", .signature = "\x00\x01\x01\x0f\x11\x9d\x8d" } },
    .{ "WintrustSetRegPolicyFlags", MethodRecord{ .library = "WINTRUST", .import = "WintrustSetRegPolicyFlags", .signature = "\x00\x01\x11\x59\x11\x9d\x8d" } },
    .{ "WintrustAddActionID", MethodRecord{ .library = "WINTRUST", .import = "WintrustAddActionID", .signature = "\x00\x03\x11\x59\x0f\x11\x0d\x09\x0f\x11\xbc\xd1" } },
    .{ "WintrustRemoveActionID", MethodRecord{ .library = "WINTRUST", .import = "WintrustRemoveActionID", .signature = "\x00\x01\x11\x59\x0f\x11\x0d" } },
    .{ "WintrustLoadFunctionPointers", MethodRecord{ .library = "WINTRUST", .import = "WintrustLoadFunctionPointers", .signature = "\x00\x02\x11\x59\x0f\x11\x0d\x0f\x11\xbc\xd5" } },
    .{ "WintrustAddDefaultForUsage", MethodRecord{ .library = "WINTRUST", .import = "WintrustAddDefaultForUsage", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x11\xbc\xd9" } },
    .{ "WintrustGetDefaultForUsage", MethodRecord{ .library = "WINTRUST", .import = "WintrustGetDefaultForUsage", .signature = "\x00\x03\x11\x59\x11\x9d\x89\x11\x3d\x0f\x11\xbc\xdd" } },
    .{ "WTHelperGetProvSignerFromChain", MethodRecord{ .library = "WINTRUST", .import = "WTHelperGetProvSignerFromChain", .signature = "\x00\x04\x0f\x11\xbc\xe1\x0f\x11\xbc\xe5\x09\x11\x59\x09" } },
    .{ "WTHelperGetProvCertFromChain", MethodRecord{ .library = "WINTRUST", .import = "WTHelperGetProvCertFromChain", .signature = "\x00\x02\x0f\x11\xbc\xe9\x0f\x11\xbc\xe1\x09" } },
    .{ "WTHelperProvDataFromStateData", MethodRecord{ .library = "WINTRUST", .import = "WTHelperProvDataFromStateData", .signature = "\x00\x01\x0f\x11\xbc\xe5\x11\x80\x85" } },
    .{ "WTHelperGetProvPrivateDataFromChain", MethodRecord{ .library = "WINTRUST", .import = "WTHelperGetProvPrivateDataFromChain", .signature = "\x00\x02\x0f\x11\xbc\xed\x0f\x11\xbc\xe5\x0f\x11\x0d" } },
    .{ "WTHelperCertIsSelfSigned", MethodRecord{ .library = "WINTRUST", .import = "WTHelperCertIsSelfSigned", .signature = "\x00\x02\x11\x59\x09\x0f\x11\x85\x35" } },
    .{ "WTHelperCertCheckValidSignature", MethodRecord{ .library = "WINTRUST", .import = "WTHelperCertCheckValidSignature", .signature = "\x00\x01\x11\x79\x0f\x11\xbc\xe5" } },
    .{ "OpenPersonalTrustDBDialogEx", MethodRecord{ .library = "WINTRUST", .import = "OpenPersonalTrustDBDialogEx", .signature = "\x00\x03\x11\x59\x11\x25\x09\x0f\x0f\x01" } },
    .{ "OpenPersonalTrustDBDialog", MethodRecord{ .library = "WINTRUST", .import = "OpenPersonalTrustDBDialog", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "WintrustSetDefaultIncludePEPageHashes", MethodRecord{ .library = "WINTRUST", .import = "WintrustSetDefaultIncludePEPageHashes", .signature = "\x00\x01\x01\x11\x59" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x535 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_INFO" },
        0x1d89 => TypeRefEntry{ .namespace = "Windows.Win32.Security.WinTrust", .name = "WINTRUST_GET_DEFAULT_FOR_USAGE_ACTION" },
        0x1d8d => TypeRefEntry{ .namespace = "Windows.Win32.Security.WinTrust", .name = "WINTRUST_POLICY_FLAGS" },
        0x3ccd => TypeRefEntry{ .namespace = "Windows.Win32.Security.WinTrust", .name = "WINTRUST_DATA" },
        0x3cd1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.WinTrust", .name = "CRYPT_REGISTER_ACTIONID" },
        0x3cd5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.WinTrust", .name = "CRYPT_PROVIDER_FUNCTIONS" },
        0x3cd9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.WinTrust", .name = "CRYPT_PROVIDER_REGDEFUSAGE" },
        0x3cdd => TypeRefEntry{ .namespace = "Windows.Win32.Security.WinTrust", .name = "CRYPT_PROVIDER_DEFUSAGE" },
        0x3ce1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.WinTrust", .name = "CRYPT_PROVIDER_SGNR" },
        0x3ce5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.WinTrust", .name = "CRYPT_PROVIDER_DATA" },
        0x3ce9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.WinTrust", .name = "CRYPT_PROVIDER_CERT" },
        0x3ced => TypeRefEntry{ .namespace = "Windows.Win32.Security.WinTrust", .name = "CRYPT_PROVIDER_PRIVDATA" },
        else => null,
    };
}

pub const DWACTION_ALLOCANDFILL = 1;
pub const DWACTION_FREE = 2;
pub const WTPF_TRUSTTEST = 32;
pub const WTPF_TESTCANBEVALID = 128;
pub const WTPF_IGNOREEXPIRATION = 256;
pub const WTPF_IGNOREREVOKATION = 512;
pub const WTPF_OFFLINEOK_IND = 1024;
pub const WTPF_OFFLINEOK_COM = 2048;
pub const WTPF_OFFLINEOKNBU_IND = 4096;
pub const WTPF_OFFLINEOKNBU_COM = 8192;
pub const WTPF_VERIFY_V1_OFF = 65536;
pub const WTPF_IGNOREREVOCATIONONTS = 131072;
pub const WTPF_ALLOWONLYPERTRUST = 262144;
pub const WTD_USE_IE4_TRUST_FLAG = 1;
pub const WTD_NO_IE4_CHAIN_FLAG = 2;
pub const WTD_NO_POLICY_USAGE_FLAG = 4;
pub const WTD_REVOCATION_CHECK_NONE = 16;
pub const WTD_REVOCATION_CHECK_END_CERT = 32;
pub const WTD_REVOCATION_CHECK_CHAIN = 64;
pub const WTD_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 128;
pub const WTD_SAFER_FLAG = 256;
pub const WTD_HASH_ONLY_FLAG = 512;
pub const WTD_USE_DEFAULT_OSVER_CHECK = 1024;
pub const WTD_LIFETIME_SIGNING_FLAG = 2048;
pub const WTD_CACHE_ONLY_URL_RETRIEVAL = 4096;
pub const WTD_DISABLE_MD2_MD4 = 8192;
pub const WTD_MOTW = 16384;
pub const WTD_UI_ALL = 1;
pub const WTD_UI_NONE = 2;
pub const WTD_UI_NOBAD = 3;
pub const WTD_UI_NOGOOD = 4;
pub const WSS_VERIFY_SPECIFIC = 1;
pub const WSS_GET_SECONDARY_SIG_COUNT = 2;
pub const WTD_STATEACTION_IGNORE = 0;
pub const WTD_STATEACTION_VERIFY = 1;
pub const WTD_STATEACTION_CLOSE = 2;
pub const WTD_STATEACTION_AUTO_CACHE = 3;
pub const WTD_STATEACTION_AUTO_CACHE_FLUSH = 4;
pub const WTD_CHOICE_FILE = 1;
pub const WTD_CHOICE_CATALOG = 2;
pub const WTD_CHOICE_BLOB = 3;
pub const WTD_CHOICE_SIGNER = 4;
pub const WTD_CHOICE_CERT = 5;
pub const WTD_REVOKE_NONE = 0;
pub const WTD_REVOKE_WHOLECHAIN = 1;
pub const WTD_UICONTEXT_EXECUTE = 0;
pub const WTD_UICONTEXT_INSTALL = 1;
pub const WINTRUST_MAX_HEADER_BYTES_TO_MAP_DEFAULT = 10485760;
pub const WINTRUST_MAX_HASH_BYTES_TO_MAP_DEFAULT = 1048576;
pub const WTD_CHOICE_DETACHED_SIG = 6;
pub const WTD_PROV_FLAGS_MASK = 65535;
pub const WTD_USE_LOCAL_MACHINE_CERTS = 8;
pub const WTD_CODE_INTEGRITY_DRIVER_MODE = 32768;
pub const WSS_VERIFY_SEALING = 4;
pub const WSS_INPUT_FLAG_MASK = 7;
pub const WSS_OUT_SEALING_STATUS_VERIFIED = 2147483648;
pub const WSS_OUT_HAS_SEALING_INTENT = 1073741824;
pub const WSS_OUT_FILE_SUPPORTS_SEAL = 536870912;
pub const WSS_OUTPUT_FLAG_MASK = 3758096384;
pub const WINTRUST_DETACHED_SIG_CHOICE_HANDLE = 1;
pub const WINTRUST_DETACHED_SIG_CHOICE_BLOB = 2;
pub const WTCI_DONT_OPEN_STORES = 1;
pub const WTCI_OPEN_ONLY_ROOT = 2;
pub const WTCI_USE_LOCAL_MACHINE = 4;
pub const TRUSTERROR_STEP_WVTPARAMS = 0;
pub const TRUSTERROR_STEP_FILEIO = 2;
pub const TRUSTERROR_STEP_SIP = 3;
pub const TRUSTERROR_STEP_SIPSUBJINFO = 5;
pub const TRUSTERROR_STEP_CATALOGFILE = 6;
pub const TRUSTERROR_STEP_CERTSTORE = 7;
pub const TRUSTERROR_STEP_MESSAGE = 8;
pub const TRUSTERROR_STEP_MSG_SIGNERCOUNT = 9;
pub const TRUSTERROR_STEP_MSG_INNERCNTTYPE = 10;
pub const TRUSTERROR_STEP_MSG_INNERCNT = 11;
pub const TRUSTERROR_STEP_MSG_STORE = 12;
pub const TRUSTERROR_STEP_MSG_SIGNERINFO = 13;
pub const TRUSTERROR_STEP_MSG_SIGNERCERT = 14;
pub const TRUSTERROR_STEP_MSG_CERTCHAIN = 15;
pub const TRUSTERROR_STEP_MSG_COUNTERSIGINFO = 16;
pub const TRUSTERROR_STEP_MSG_COUNTERSIGCERT = 17;
pub const TRUSTERROR_STEP_VERIFY_MSGHASH = 18;
pub const TRUSTERROR_STEP_VERIFY_MSGINDIRECTDATA = 19;
pub const TRUSTERROR_STEP_FINAL_WVTINIT = 30;
pub const TRUSTERROR_STEP_FINAL_INITPROV = 31;
pub const TRUSTERROR_STEP_FINAL_OBJPROV = 32;
pub const TRUSTERROR_STEP_FINAL_SIGPROV = 33;
pub const TRUSTERROR_STEP_FINAL_CERTPROV = 34;
pub const TRUSTERROR_STEP_FINAL_CERTCHKPROV = 35;
pub const TRUSTERROR_STEP_FINAL_POLICYPROV = 36;
pub const TRUSTERROR_STEP_FINAL_UIPROV = 37;
pub const TRUSTERROR_MAX_STEPS = 38;
pub const CPD_CHOICE_SIP = 1;
pub const CPD_USE_NT5_CHAIN_FLAG = 2147483648;
pub const CPD_REVOCATION_CHECK_NONE = 65536;
pub const CPD_REVOCATION_CHECK_END_CERT = 131072;
pub const CPD_REVOCATION_CHECK_CHAIN = 262144;
pub const CPD_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 524288;
pub const CPD_RETURN_LOWER_QUALITY_CHAINS = 1048576;
pub const CPD_RFC3161v21 = 2097152;
pub const CPD_UISTATE_MODE_PROMPT = 0;
pub const CPD_UISTATE_MODE_BLOCK = 1;
pub const CPD_UISTATE_MODE_ALLOW = 2;
pub const CPD_UISTATE_MODE_MASK = 3;
pub const WSS_OBJTRUST_SUPPORT = 1;
pub const WSS_SIGTRUST_SUPPORT = 2;
pub const WSS_CERTTRUST_SUPPORT = 4;
pub const SGNR_TYPE_TIMESTAMP = 16;
pub const CERT_CONFIDENCE_SIG = 268435456;
pub const CERT_CONFIDENCE_TIME = 16777216;
pub const CERT_CONFIDENCE_TIMENEST = 1048576;
pub const CERT_CONFIDENCE_AUTHIDEXT = 65536;
pub const CERT_CONFIDENCE_HYGIENE = 4096;
pub const CERT_CONFIDENCE_HIGHEST = 286330880;
pub const WT_CURRENT_VERSION = 512;
pub const WT_ADD_ACTION_ID_RET_RESULT_FLAG = 1;
pub const SPC_SP_AGENCY_INFO_STRUCT = 2000;
pub const SPC_MINIMAL_CRITERIA_STRUCT = 2001;
pub const SPC_FINANCIAL_CRITERIA_STRUCT = 2002;
pub const SPC_INDIRECT_DATA_CONTENT_STRUCT = 2003;
pub const SPC_PE_IMAGE_DATA_STRUCT = 2004;
pub const SPC_LINK_STRUCT = 2005;
pub const SPC_STATEMENT_TYPE_STRUCT = 2006;
pub const SPC_SP_OPUS_INFO_STRUCT = 2007;
pub const SPC_CAB_DATA_STRUCT = 2008;
pub const SPC_JAVA_CLASS_DATA_STRUCT = 2009;
pub const INTENT_TO_SEAL_ATTRIBUTE_STRUCT = 2010;
pub const SEALING_SIGNATURE_ATTRIBUTE_STRUCT = 2011;
pub const SEALING_TIMESTAMP_ATTRIBUTE_STRUCT = 2012;
pub const SPC_SIGINFO_STRUCT = 2130;
pub const CAT_NAMEVALUE_STRUCT = 2221;
pub const CAT_MEMBERINFO_STRUCT = 2222;
pub const CAT_MEMBERINFO2_STRUCT = 2223;
pub const SPC_UUID_LENGTH = 16;
pub const SPC_URL_LINK_CHOICE = 1;
pub const SPC_MONIKER_LINK_CHOICE = 2;
pub const SPC_FILE_LINK_CHOICE = 3;
pub const WIN_CERT_REVISION_1_0 = 256;
pub const WIN_CERT_REVISION_2_0 = 512;
pub const WIN_CERT_TYPE_X509 = 1;
pub const WIN_CERT_TYPE_PKCS_SIGNED_DATA = 2;
pub const WIN_CERT_TYPE_RESERVED_1 = 3;
pub const WIN_CERT_TYPE_TS_STACK_SIGNED = 4;
pub const WT_TRUSTDBDIALOG_NO_UI_FLAG = 1;
pub const WT_TRUSTDBDIALOG_ONLY_PUB_TAB_FLAG = 2;
pub const WT_TRUSTDBDIALOG_WRITE_LEGACY_REG_FLAG = 256;
pub const WT_TRUSTDBDIALOG_WRITE_IEAK_STORE_FLAG = 512;
pub const CCPI_RESULT_ALLOW = 1;
pub const CCPI_RESULT_DENY = 2;
pub const CCPI_RESULT_AUDIT = 3;

pub const aliases = struct {
    pub const WINTRUST_GET_DEFAULT_FOR_USAGE_ACTION = u32;
    pub const WINTRUST_POLICY_FLAGS = u32;
    pub const WINTRUST_DATA_PROVIDER_FLAGS = u32;
    pub const WINTRUST_DATA_UICHOICE = u32;
    pub const WINTRUST_SIGNATURE_SETTINGS_FLAGS = u32;
    pub const WINTRUST_DATA_STATE_ACTION = u32;
    pub const WINTRUST_DATA_UNION_CHOICE = u32;
    pub const WINTRUST_DATA_REVOCATION_CHECKS = u32;
    pub const WINTRUST_DATA_UICONTEXT = u32;
};
