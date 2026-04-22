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
    .{ "WebAuthNGetApiVersionNumber", MethodRecord{ .library = "webauthn", .import = "WebAuthNGetApiVersionNumber", .signature = "\x00\x00\x09" } },
    .{ "WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable", MethodRecord{ .library = "webauthn", .import = "WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable", .signature = "\x00\x01\x11\x79\x0f\x11\x59" } },
    .{ "WebAuthNAuthenticatorMakeCredential", MethodRecord{ .library = "webauthn", .import = "WebAuthNAuthenticatorMakeCredential", .signature = "\x00\x07\x11\x79\x11\x25\x0f\x11\xbb\x79\x0f\x11\xbb\x7d\x0f\x11\xbb\x81\x0f\x11\xbb\x85\x0f\x11\xbb\x89\x0f\x0f\x11\xbb\x8d" } },
    .{ "WebAuthNAuthenticatorGetAssertion", MethodRecord{ .library = "webauthn", .import = "WebAuthNAuthenticatorGetAssertion", .signature = "\x00\x05\x11\x79\x11\x25\x11\x05\x0f\x11\xbb\x85\x0f\x11\xbb\x91\x0f\x0f\x11\xbb\x95" } },
    .{ "WebAuthNFreeCredentialAttestation", MethodRecord{ .library = "webauthn", .import = "WebAuthNFreeCredentialAttestation", .signature = "\x00\x01\x01\x0f\x11\xbb\x8d" } },
    .{ "WebAuthNFreeAssertion", MethodRecord{ .library = "webauthn", .import = "WebAuthNFreeAssertion", .signature = "\x00\x01\x01\x0f\x11\xbb\x95" } },
    .{ "WebAuthNGetCancellationId", MethodRecord{ .library = "webauthn", .import = "WebAuthNGetCancellationId", .signature = "\x00\x01\x11\x79\x0f\x11\x0d" } },
    .{ "WebAuthNCancelCurrentOperation", MethodRecord{ .library = "webauthn", .import = "WebAuthNCancelCurrentOperation", .signature = "\x00\x01\x11\x79\x0f\x11\x0d" } },
    .{ "WebAuthNGetPlatformCredentialList", MethodRecord{ .library = "webauthn", .import = "WebAuthNGetPlatformCredentialList", .signature = "\x00\x02\x11\x79\x0f\x11\xbb\x99\x0f\x0f\x11\xbb\x9d" } },
    .{ "WebAuthNFreePlatformCredentialList", MethodRecord{ .library = "webauthn", .import = "WebAuthNFreePlatformCredentialList", .signature = "\x00\x01\x01\x0f\x11\xbb\x9d" } },
    .{ "WebAuthNDeletePlatformCredential", MethodRecord{ .library = "webauthn", .import = "WebAuthNDeletePlatformCredential", .signature = "\x00\x02\x11\x79\x09\x0f\x05" } },
    .{ "WebAuthNGetAuthenticatorList", MethodRecord{ .library = "webauthn", .import = "WebAuthNGetAuthenticatorList", .signature = "\x00\x02\x11\x79\x0f\x11\xbb\xa1\x0f\x0f\x11\xbb\xa5" } },
    .{ "WebAuthNFreeAuthenticatorList", MethodRecord{ .library = "webauthn", .import = "WebAuthNFreeAuthenticatorList", .signature = "\x00\x01\x01\x0f\x11\xbb\xa5" } },
    .{ "WebAuthNGetErrorName", MethodRecord{ .library = "webauthn", .import = "WebAuthNGetErrorName", .signature = "\x00\x01\x11\x05\x11\x79" } },
    .{ "WebAuthNGetW3CExceptionDOMError", MethodRecord{ .library = "webauthn", .import = "WebAuthNGetW3CExceptionDOMError", .signature = "\x00\x01\x11\x79\x11\x79" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x3b79 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.WebAuthn", .name = "WEBAUTHN_RP_ENTITY_INFORMATION" },
        0x3b7d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.WebAuthn", .name = "WEBAUTHN_USER_ENTITY_INFORMATION" },
        0x3b81 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.WebAuthn", .name = "WEBAUTHN_COSE_CREDENTIAL_PARAMETERS" },
        0x3b85 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.WebAuthn", .name = "WEBAUTHN_CLIENT_DATA" },
        0x3b89 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.WebAuthn", .name = "WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS" },
        0x3b8d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.WebAuthn", .name = "WEBAUTHN_CREDENTIAL_ATTESTATION" },
        0x3b91 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.WebAuthn", .name = "WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS" },
        0x3b95 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.WebAuthn", .name = "WEBAUTHN_ASSERTION" },
        0x3b99 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.WebAuthn", .name = "WEBAUTHN_GET_CREDENTIALS_OPTIONS" },
        0x3b9d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.WebAuthn", .name = "WEBAUTHN_CREDENTIAL_DETAILS_LIST" },
        0x3ba1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.WebAuthn", .name = "WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS" },
        0x3ba5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authentication.WebAuthn", .name = "WEBAUTHN_AUTHENTICATOR_DETAILS_LIST" },
        else => null,
    };
}

pub const WEBAUTHN_API_VERSION_1 = 1;
pub const WEBAUTHN_API_VERSION_2 = 2;
pub const WEBAUTHN_API_VERSION_3 = 3;
pub const WEBAUTHN_API_VERSION_4 = 4;
pub const WEBAUTHN_API_VERSION_5 = 5;
pub const WEBAUTHN_API_VERSION_6 = 6;
pub const WEBAUTHN_API_VERSION_7 = 7;
pub const WEBAUTHN_API_VERSION_8 = 8;
pub const WEBAUTHN_API_VERSION_9 = 9;
pub const WEBAUTHN_API_CURRENT_VERSION = 9;
pub const WEBAUTHN_RP_ENTITY_INFORMATION_VERSION_1 = 1;
pub const WEBAUTHN_RP_ENTITY_INFORMATION_CURRENT_VERSION = 1;
pub const WEBAUTHN_MAX_USER_ID_LENGTH = 64;
pub const WEBAUTHN_USER_ENTITY_INFORMATION_VERSION_1 = 1;
pub const WEBAUTHN_USER_ENTITY_INFORMATION_CURRENT_VERSION = 1;
pub const WEBAUTHN_CLIENT_DATA_CURRENT_VERSION = 1;
pub const WEBAUTHN_COSE_ALGORITHM_ECDSA_P256_WITH_SHA256 = -7;
pub const WEBAUTHN_COSE_ALGORITHM_ECDSA_P384_WITH_SHA384 = -35;
pub const WEBAUTHN_COSE_ALGORITHM_ECDSA_P521_WITH_SHA512 = -36;
pub const WEBAUTHN_COSE_ALGORITHM_RSASSA_PKCS1_V1_5_WITH_SHA256 = -257;
pub const WEBAUTHN_COSE_ALGORITHM_RSASSA_PKCS1_V1_5_WITH_SHA384 = -258;
pub const WEBAUTHN_COSE_ALGORITHM_RSASSA_PKCS1_V1_5_WITH_SHA512 = -259;
pub const WEBAUTHN_COSE_ALGORITHM_RSA_PSS_WITH_SHA256 = -37;
pub const WEBAUTHN_COSE_ALGORITHM_RSA_PSS_WITH_SHA384 = -38;
pub const WEBAUTHN_COSE_ALGORITHM_RSA_PSS_WITH_SHA512 = -39;
pub const WEBAUTHN_COSE_CREDENTIAL_PARAMETER_CURRENT_VERSION = 1;
pub const WEBAUTHN_CREDENTIAL_CURRENT_VERSION = 1;
pub const WEBAUTHN_CTAP_TRANSPORT_USB = 1;
pub const WEBAUTHN_CTAP_TRANSPORT_NFC = 2;
pub const WEBAUTHN_CTAP_TRANSPORT_BLE = 4;
pub const WEBAUTHN_CTAP_TRANSPORT_TEST = 8;
pub const WEBAUTHN_CTAP_TRANSPORT_INTERNAL = 16;
pub const WEBAUTHN_CTAP_TRANSPORT_HYBRID = 32;
pub const WEBAUTHN_CTAP_TRANSPORT_SMART_CARD = 64;
pub const WEBAUTHN_CTAP_TRANSPORT_FLAGS_MASK = 127;
pub const WEBAUTHN_CREDENTIAL_EX_CURRENT_VERSION = 1;
pub const CTAPCBOR_HYBRID_STORAGE_LINKED_DATA_VERSION_1 = 1;
pub const CTAPCBOR_HYBRID_STORAGE_LINKED_DATA_CURRENT_VERSION = 1;
pub const WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS_VERSION_1 = 1;
pub const WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS_CURRENT_VERSION = 1;
pub const WEBAUTHN_AUTHENTICATOR_DETAILS_VERSION_1 = 1;
pub const WEBAUTHN_AUTHENTICATOR_DETAILS_CURRENT_VERSION = 1;
pub const WEBAUTHN_CREDENTIAL_DETAILS_VERSION_1 = 1;
pub const WEBAUTHN_CREDENTIAL_DETAILS_VERSION_2 = 2;
pub const WEBAUTHN_CREDENTIAL_DETAILS_VERSION_3 = 3;
pub const WEBAUTHN_CREDENTIAL_DETAILS_VERSION_4 = 4;
pub const WEBAUTHN_CREDENTIAL_DETAILS_CURRENT_VERSION = 4;
pub const WEBAUTHN_GET_CREDENTIALS_OPTIONS_VERSION_1 = 1;
pub const WEBAUTHN_GET_CREDENTIALS_OPTIONS_CURRENT_VERSION = 1;
pub const WEBAUTHN_CTAP_ONE_HMAC_SECRET_LENGTH = 32;
pub const WEBAUTHN_USER_VERIFICATION_ANY = 0;
pub const WEBAUTHN_USER_VERIFICATION_OPTIONAL = 1;
pub const WEBAUTHN_USER_VERIFICATION_OPTIONAL_WITH_CREDENTIAL_ID_LIST = 2;
pub const WEBAUTHN_USER_VERIFICATION_REQUIRED = 3;
pub const WEBAUTHN_AUTHENTICATOR_ATTACHMENT_ANY = 0;
pub const WEBAUTHN_AUTHENTICATOR_ATTACHMENT_PLATFORM = 1;
pub const WEBAUTHN_AUTHENTICATOR_ATTACHMENT_CROSS_PLATFORM = 2;
pub const WEBAUTHN_AUTHENTICATOR_ATTACHMENT_CROSS_PLATFORM_U2F_V2 = 3;
pub const WEBAUTHN_USER_VERIFICATION_REQUIREMENT_ANY = 0;
pub const WEBAUTHN_USER_VERIFICATION_REQUIREMENT_REQUIRED = 1;
pub const WEBAUTHN_USER_VERIFICATION_REQUIREMENT_PREFERRED = 2;
pub const WEBAUTHN_USER_VERIFICATION_REQUIREMENT_DISCOURAGED = 3;
pub const WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_ANY = 0;
pub const WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_NONE = 1;
pub const WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_INDIRECT = 2;
pub const WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_DIRECT = 3;
pub const WEBAUTHN_ENTERPRISE_ATTESTATION_NONE = 0;
pub const WEBAUTHN_ENTERPRISE_ATTESTATION_VENDOR_FACILITATED = 1;
pub const WEBAUTHN_ENTERPRISE_ATTESTATION_PLATFORM_MANAGED = 2;
pub const WEBAUTHN_LARGE_BLOB_SUPPORT_NONE = 0;
pub const WEBAUTHN_LARGE_BLOB_SUPPORT_REQUIRED = 1;
pub const WEBAUTHN_LARGE_BLOB_SUPPORT_PREFERRED = 2;
pub const WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_1 = 1;
pub const WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_2 = 2;
pub const WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_3 = 3;
pub const WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_4 = 4;
pub const WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_5 = 5;
pub const WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_6 = 6;
pub const WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_7 = 7;
pub const WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_8 = 8;
pub const WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_9 = 9;
pub const WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_CURRENT_VERSION = 9;
pub const WEBAUTHN_CRED_LARGE_BLOB_OPERATION_NONE = 0;
pub const WEBAUTHN_CRED_LARGE_BLOB_OPERATION_GET = 1;
pub const WEBAUTHN_CRED_LARGE_BLOB_OPERATION_SET = 2;
pub const WEBAUTHN_CRED_LARGE_BLOB_OPERATION_DELETE = 3;
pub const WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_1 = 1;
pub const WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_2 = 2;
pub const WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_3 = 3;
pub const WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_4 = 4;
pub const WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_5 = 5;
pub const WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_6 = 6;
pub const WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_7 = 7;
pub const WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_8 = 8;
pub const WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_9 = 9;
pub const WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_CURRENT_VERSION = 9;
pub const WEBAUTHN_AUTHENTICATOR_HMAC_SECRET_VALUES_FLAG = 1048576;
pub const WEBAUTHN_ATTESTATION_DECODE_NONE = 0;
pub const WEBAUTHN_ATTESTATION_DECODE_COMMON = 1;
pub const WEBAUTHN_COMMON_ATTESTATION_CURRENT_VERSION = 1;
pub const WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_1 = 1;
pub const WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_2 = 2;
pub const WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_3 = 3;
pub const WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_4 = 4;
pub const WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_5 = 5;
pub const WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_6 = 6;
pub const WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_7 = 7;
pub const WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_8 = 8;
pub const WEBAUTHN_CREDENTIAL_ATTESTATION_CURRENT_VERSION = 8;
pub const WEBAUTHN_CRED_LARGE_BLOB_STATUS_NONE = 0;
pub const WEBAUTHN_CRED_LARGE_BLOB_STATUS_SUCCESS = 1;
pub const WEBAUTHN_CRED_LARGE_BLOB_STATUS_NOT_SUPPORTED = 2;
pub const WEBAUTHN_CRED_LARGE_BLOB_STATUS_INVALID_DATA = 3;
pub const WEBAUTHN_CRED_LARGE_BLOB_STATUS_INVALID_PARAMETER = 4;
pub const WEBAUTHN_CRED_LARGE_BLOB_STATUS_NOT_FOUND = 5;
pub const WEBAUTHN_CRED_LARGE_BLOB_STATUS_MULTIPLE_CREDENTIALS = 6;
pub const WEBAUTHN_CRED_LARGE_BLOB_STATUS_LACK_OF_SPACE = 7;
pub const WEBAUTHN_CRED_LARGE_BLOB_STATUS_PLATFORM_ERROR = 8;
pub const WEBAUTHN_CRED_LARGE_BLOB_STATUS_AUTHENTICATOR_ERROR = 9;
pub const WEBAUTHN_ASSERTION_VERSION_1 = 1;
pub const WEBAUTHN_ASSERTION_VERSION_2 = 2;
pub const WEBAUTHN_ASSERTION_VERSION_3 = 3;
pub const WEBAUTHN_ASSERTION_VERSION_4 = 4;
pub const WEBAUTHN_ASSERTION_VERSION_5 = 5;
pub const WEBAUTHN_ASSERTION_VERSION_6 = 6;
pub const WEBAUTHN_ASSERTION_CURRENT_VERSION = 6;
pub const EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_VERSION_1 = 1;
pub const EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_CURRENT_VERSION = 1;
pub const EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_VERSION_1 = 1;
pub const EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_CURRENT_VERSION = 1;
pub const EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_VERSION_1 = 1;
pub const EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_CURRENT_VERSION = 1;
pub const EXPERIMENTAL_WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_VERSION_1 = 1;
pub const EXPERIMENTAL_WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_CURRENT_VERSION = 1;
pub const EXPERIMENTAL_WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_VERSION_1 = 1;
pub const EXPERIMENTAL_WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_CURRENT_VERSION = 1;
pub const WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_VERSION_1 = 1;
pub const WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_CURRENT_VERSION = 1;
pub const WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_VERSION_1 = 1;
pub const WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_CURRENT_VERSION = 1;
pub const WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_VERSION_1 = 1;
pub const WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_CURRENT_VERSION = 1;
pub const WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_VERSION_1 = 1;
pub const WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_CURRENT_VERSION = 1;
pub const WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_VERSION_1 = 1;
pub const WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_CURRENT_VERSION = 1;
pub const PluginAuthenticatorState_Unknown = 0;
pub const PluginAuthenticatorState_Disabled = 1;
pub const PluginAuthenticatorState_Enabled = 2;
pub const PerformUv = 1;
pub const GetUvCount = 2;
pub const GetPubKey = 3;
pub const AuthenticatorState_Disabled = 0;
pub const AuthenticatorState_Enabled = 1;
pub const PerformUserVerification = 1;
pub const GetUserVerificationCount = 2;
pub const GetPublicKey = 3;
pub const WEBAUTHN_PLUGIN_REQUEST_TYPE_CTAP2_CBOR = 1;
pub const PluginLocked = 0;
pub const PluginUnlocked = 1;

pub const aliases = struct {
    pub const EXPERIMENTAL_PLUGIN_AUTHENTICATOR_STATE = i32;
    pub const EXPERIMENTAL_WEBAUTHN_PLUGIN_PERFORM_UV_OPERATION_TYPE = i32;
    pub const AUTHENTICATOR_STATE = i32;
    pub const WEBAUTHN_PLUGIN_PERFORM_UV_OPERATION_TYPE = i32;
    pub const WEBAUTHN_PLUGIN_REQUEST_TYPE = i32;
    pub const PLUGIN_LOCK_STATUS = i32;
};
