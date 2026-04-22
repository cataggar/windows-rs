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
    .{ "SetEnvironmentStringsW", MethodRecord{ .library = "KERNEL32", .import = "SetEnvironmentStringsW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "GetCommandLineA", MethodRecord{ .library = "KERNEL32", .import = "GetCommandLineA", .signature = "\x00\x00\x11\x3d" } },
    .{ "GetCommandLineW", MethodRecord{ .library = "KERNEL32", .import = "GetCommandLineW", .signature = "\x00\x00\x11\x05" } },
    .{ "GetEnvironmentStrings", MethodRecord{ .library = "KERNEL32", .import = "GetEnvironmentStrings", .signature = "\x00\x00\x11\x3d" } },
    .{ "GetEnvironmentStringsW", MethodRecord{ .library = "KERNEL32", .import = "GetEnvironmentStringsW", .signature = "\x00\x00\x11\x05" } },
    .{ "FreeEnvironmentStringsA", MethodRecord{ .library = "KERNEL32", .import = "FreeEnvironmentStringsA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "FreeEnvironmentStringsW", MethodRecord{ .library = "KERNEL32", .import = "FreeEnvironmentStringsW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "GetEnvironmentVariableA", MethodRecord{ .library = "KERNEL32", .import = "GetEnvironmentVariableA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x09" } },
    .{ "GetEnvironmentVariableW", MethodRecord{ .library = "KERNEL32", .import = "GetEnvironmentVariableW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "SetEnvironmentVariableA", MethodRecord{ .library = "KERNEL32", .import = "SetEnvironmentVariableA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "SetEnvironmentVariableW", MethodRecord{ .library = "KERNEL32", .import = "SetEnvironmentVariableW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "ExpandEnvironmentStringsA", MethodRecord{ .library = "KERNEL32", .import = "ExpandEnvironmentStringsA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x09" } },
    .{ "ExpandEnvironmentStringsW", MethodRecord{ .library = "KERNEL32", .import = "ExpandEnvironmentStringsW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "SetCurrentDirectoryA", MethodRecord{ .library = "KERNEL32", .import = "SetCurrentDirectoryA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "SetCurrentDirectoryW", MethodRecord{ .library = "KERNEL32", .import = "SetCurrentDirectoryW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "GetCurrentDirectoryA", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentDirectoryA", .signature = "\x00\x02\x09\x09\x11\x3d" } },
    .{ "GetCurrentDirectoryW", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentDirectoryW", .signature = "\x00\x02\x09\x09\x11\x05" } },
    .{ "NeedCurrentDirectoryForExePathA", MethodRecord{ .library = "KERNEL32", .import = "NeedCurrentDirectoryForExePathA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "NeedCurrentDirectoryForExePathW", MethodRecord{ .library = "KERNEL32", .import = "NeedCurrentDirectoryForExePathW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "CreateEnvironmentBlock", MethodRecord{ .library = "USERENV", .import = "CreateEnvironmentBlock", .signature = "\x00\x03\x11\x59\x0f\x0f\x01\x11\x80\x85\x11\x59" } },
    .{ "DestroyEnvironmentBlock", MethodRecord{ .library = "USERENV", .import = "DestroyEnvironmentBlock", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "ExpandEnvironmentStringsForUserA", MethodRecord{ .library = "USERENV", .import = "ExpandEnvironmentStringsForUserA", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x3d\x11\x3d\x09" } },
    .{ "ExpandEnvironmentStringsForUserW", MethodRecord{ .library = "USERENV", .import = "ExpandEnvironmentStringsForUserW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x05\x11\x05\x09" } },
    .{ "IsEnclaveTypeSupported", MethodRecord{ .library = "KERNEL32", .import = "IsEnclaveTypeSupported", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "CreateEnclave", MethodRecord{ .library = "KERNEL32", .import = "CreateEnclave", .signature = "\x00\x08\x0f\x01\x11\x80\x85\x0f\x01\x19\x19\x09\x0f\x01\x09\x0f\x09" } },
    .{ "LoadEnclaveData", MethodRecord{ .library = "KERNEL32", .import = "LoadEnclaveData", .signature = "\x00\x09\x11\x59\x11\x80\x85\x0f\x01\x0f\x01\x19\x09\x0f\x01\x09\x0f\x19\x0f\x09" } },
    .{ "InitializeEnclave", MethodRecord{ .library = "KERNEL32", .import = "InitializeEnclave", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x0f\x01\x09\x0f\x09" } },
    .{ "LoadEnclaveImageA", MethodRecord{ .library = "api-ms-win-core-enclave-l1-1-1", .import = "LoadEnclaveImageA", .signature = "\x00\x02\x11\x59\x0f\x01\x11\x3d" } },
    .{ "LoadEnclaveImageW", MethodRecord{ .library = "api-ms-win-core-enclave-l1-1-1", .import = "LoadEnclaveImageW", .signature = "\x00\x02\x11\x59\x0f\x01\x11\x05" } },
    .{ "CallEnclave", MethodRecord{ .library = "vertdll", .import = "CallEnclave", .signature = "\x00\x04\x11\x59\x18\x0f\x01\x11\x59\x0f\x0f\x01" } },
    .{ "TerminateEnclave", MethodRecord{ .library = "vertdll", .import = "TerminateEnclave", .signature = "\x00\x02\x11\x59\x0f\x01\x11\x59" } },
    .{ "DeleteEnclave", MethodRecord{ .library = "api-ms-win-core-enclave-l1-1-1", .import = "DeleteEnclave", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "EnclaveGetAttestationReport", MethodRecord{ .library = "vertdll", .import = "EnclaveGetAttestationReport", .signature = "\x00\x04\x11\x79\x0f\x05\x0f\x01\x09\x0f\x09" } },
    .{ "EnclaveVerifyAttestationReport", MethodRecord{ .library = "vertdll", .import = "EnclaveVerifyAttestationReport", .signature = "\x00\x03\x11\x79\x09\x0f\x01\x09" } },
    .{ "EnclaveSealData", MethodRecord{ .library = "vertdll", .import = "EnclaveSealData", .signature = "\x00\x07\x11\x79\x0f\x01\x09\x11\xc0\x00\x41\x35\x09\x0f\x01\x09\x0f\x09" } },
    .{ "EnclaveUnsealData", MethodRecord{ .library = "vertdll", .import = "EnclaveUnsealData", .signature = "\x00\x07\x11\x79\x0f\x01\x09\x0f\x01\x09\x0f\x09\x0f\x11\xc0\x00\x41\x39\x0f\x09" } },
    .{ "EnclaveEncryptDataForTrustlet", MethodRecord{ .library = "vertdll", .import = "EnclaveEncryptDataForTrustlet", .signature = "\x00\x06\x11\x79\x0f\x01\x09\x0f\x11\xc0\x00\x41\x3d\x0f\x01\x09\x0f\x09" } },
    .{ "EnclaveGetEnclaveInformation", MethodRecord{ .library = "vertdll", .import = "EnclaveGetEnclaveInformation", .signature = "\x00\x02\x11\x79\x09\x0f\x11\xc0\x00\x41\x41" } },
    .{ "EnclaveUsesAttestedKeys", MethodRecord{ .library = "vertdll", .import = "EnclaveUsesAttestedKeys", .signature = "\x00\x00\x11\x87\x79" } },
    .{ "EnclaveRestrictContainingProcessAccess", MethodRecord{ .library = "vertdll", .import = "EnclaveRestrictContainingProcessAccess", .signature = "\x00\x02\x11\x79\x11\x59\x0f\x11\x59" } },
    .{ "EnclaveCopyIntoEnclave", MethodRecord{ .library = "vertdll", .import = "EnclaveCopyIntoEnclave", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x01\x19" } },
    .{ "EnclaveCopyOutOfEnclave", MethodRecord{ .library = "vertdll", .import = "EnclaveCopyOutOfEnclave", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x01\x19" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0x4135 => TypeRefEntry{ .namespace = "Windows.Win32.System.Environment", .name = "ENCLAVE_SEALING_IDENTITY_POLICY" },
        0x4139 => TypeRefEntry{ .namespace = "Windows.Win32.System.Environment", .name = "ENCLAVE_IDENTITY" },
        0x413d => TypeRefEntry{ .namespace = "Windows.Win32.System.Environment", .name = "TRUSTLET_BINDING_DATA" },
        0x4141 => TypeRefEntry{ .namespace = "Windows.Win32.System.Environment", .name = "ENCLAVE_INFORMATION" },
        else => null,
    };
}

pub const ENCLAVE_RUNTIME_POLICY_ALLOW_FULL_DEBUG = 1;
pub const ENCLAVE_RUNTIME_POLICY_ALLOW_DYNAMIC_DEBUG = 2;
pub const ENCLAVE_UNSEAL_FLAG_STALE_KEY = 1;
pub const ENCLAVE_FLAG_FULL_DEBUG_ENABLED = 1;
pub const ENCLAVE_FLAG_DYNAMIC_DEBUG_ENABLED = 2;
pub const ENCLAVE_FLAG_DYNAMIC_DEBUG_ACTIVE = 4;
pub const VBS_ENCLAVE_REPORT_PKG_HEADER_VERSION_CURRENT = 1;
pub const VBS_ENCLAVE_REPORT_SIGNATURE_SCHEME_SHA256_RSA_PSS_SHA256 = 1;
pub const VBS_ENCLAVE_REPORT_VERSION_CURRENT = 1;
pub const ENCLAVE_REPORT_DATA_LENGTH = 64;
pub const VBS_ENCLAVE_VARDATA_INVALID = 0;
pub const VBS_ENCLAVE_VARDATA_MODULE = 1;
pub const ENCLAVE_VBS_BASIC_KEY_FLAG_MEASUREMENT = 1;
pub const ENCLAVE_VBS_BASIC_KEY_FLAG_FAMILY_ID = 2;
pub const ENCLAVE_VBS_BASIC_KEY_FLAG_IMAGE_ID = 4;
pub const ENCLAVE_VBS_BASIC_KEY_FLAG_DEBUG_KEY = 8;
pub const ENCLAVE_IDENTITY_POLICY_SEAL_INVALID = 0;
pub const ENCLAVE_IDENTITY_POLICY_SEAL_EXACT_CODE = 1;
pub const ENCLAVE_IDENTITY_POLICY_SEAL_SAME_PRIMARY_CODE = 2;
pub const ENCLAVE_IDENTITY_POLICY_SEAL_SAME_IMAGE = 3;
pub const ENCLAVE_IDENTITY_POLICY_SEAL_SAME_FAMILY = 4;
pub const ENCLAVE_IDENTITY_POLICY_SEAL_SAME_AUTHOR = 5;

pub const aliases = struct {
    pub const ENCLAVE_SEALING_IDENTITY_POLICY = i32;
};
