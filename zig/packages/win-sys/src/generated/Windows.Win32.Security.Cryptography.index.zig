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
    .{ "SystemPrng", MethodRecord{ .library = "BCryptPrimitives", .import = "SystemPrng", .signature = "\x00\x02\x11\x59\x0f\x05\x19" } },
    .{ "ProcessPrng", MethodRecord{ .library = "BCryptPrimitives", .import = "ProcessPrng", .signature = "\x00\x02\x11\x59\x0f\x05\x19" } },
    .{ "CryptAcquireContextA", MethodRecord{ .library = "ADVAPI32", .import = "CryptAcquireContextA", .signature = "\x00\x05\x11\x59\x0f\x19\x11\x3d\x11\x3d\x09\x09" } },
    .{ "CryptAcquireContextW", MethodRecord{ .library = "ADVAPI32", .import = "CryptAcquireContextW", .signature = "\x00\x05\x11\x59\x0f\x19\x11\x05\x11\x05\x09\x09" } },
    .{ "CryptReleaseContext", MethodRecord{ .library = "ADVAPI32", .import = "CryptReleaseContext", .signature = "\x00\x02\x11\x59\x19\x09" } },
    .{ "CryptGenKey", MethodRecord{ .library = "ADVAPI32", .import = "CryptGenKey", .signature = "\x00\x04\x11\x59\x19\x11\x80\xe5\x11\x84\x61\x0f\x19" } },
    .{ "CryptDeriveKey", MethodRecord{ .library = "ADVAPI32", .import = "CryptDeriveKey", .signature = "\x00\x05\x11\x59\x19\x11\x80\xe5\x19\x09\x0f\x19" } },
    .{ "CryptDestroyKey", MethodRecord{ .library = "ADVAPI32", .import = "CryptDestroyKey", .signature = "\x00\x01\x11\x59\x19" } },
    .{ "CryptSetKeyParam", MethodRecord{ .library = "ADVAPI32", .import = "CryptSetKeyParam", .signature = "\x00\x04\x11\x59\x19\x11\x84\x65\x0f\x05\x09" } },
    .{ "CryptGetKeyParam", MethodRecord{ .library = "ADVAPI32", .import = "CryptGetKeyParam", .signature = "\x00\x05\x11\x59\x19\x11\x84\x65\x0f\x05\x0f\x09\x09" } },
    .{ "CryptSetHashParam", MethodRecord{ .library = "ADVAPI32", .import = "CryptSetHashParam", .signature = "\x00\x04\x11\x59\x19\x11\x84\x69\x0f\x05\x09" } },
    .{ "CryptGetHashParam", MethodRecord{ .library = "ADVAPI32", .import = "CryptGetHashParam", .signature = "\x00\x05\x11\x59\x19\x09\x0f\x05\x0f\x09\x09" } },
    .{ "CryptSetProvParam", MethodRecord{ .library = "ADVAPI32", .import = "CryptSetProvParam", .signature = "\x00\x04\x11\x59\x19\x11\x84\x6d\x0f\x05\x09" } },
    .{ "CryptGetProvParam", MethodRecord{ .library = "ADVAPI32", .import = "CryptGetProvParam", .signature = "\x00\x05\x11\x59\x19\x09\x0f\x05\x0f\x09\x09" } },
    .{ "CryptGenRandom", MethodRecord{ .library = "ADVAPI32", .import = "CryptGenRandom", .signature = "\x00\x03\x11\x59\x19\x09\x0f\x05" } },
    .{ "CryptGetUserKey", MethodRecord{ .library = "ADVAPI32", .import = "CryptGetUserKey", .signature = "\x00\x03\x11\x59\x19\x09\x0f\x19" } },
    .{ "CryptExportKey", MethodRecord{ .library = "ADVAPI32", .import = "CryptExportKey", .signature = "\x00\x06\x11\x59\x19\x19\x09\x11\x84\x61\x0f\x05\x0f\x09" } },
    .{ "CryptImportKey", MethodRecord{ .library = "ADVAPI32", .import = "CryptImportKey", .signature = "\x00\x06\x11\x59\x19\x0f\x05\x09\x19\x11\x84\x61\x0f\x19" } },
    .{ "CryptEncrypt", MethodRecord{ .library = "ADVAPI32", .import = "CryptEncrypt", .signature = "\x00\x07\x11\x59\x19\x19\x11\x59\x09\x0f\x05\x0f\x09\x09" } },
    .{ "CryptDecrypt", MethodRecord{ .library = "ADVAPI32", .import = "CryptDecrypt", .signature = "\x00\x06\x11\x59\x19\x19\x11\x59\x09\x0f\x05\x0f\x09" } },
    .{ "CryptCreateHash", MethodRecord{ .library = "ADVAPI32", .import = "CryptCreateHash", .signature = "\x00\x05\x11\x59\x19\x11\x80\xe5\x19\x09\x0f\x19" } },
    .{ "CryptHashData", MethodRecord{ .library = "ADVAPI32", .import = "CryptHashData", .signature = "\x00\x04\x11\x59\x19\x0f\x05\x09\x09" } },
    .{ "CryptHashSessionKey", MethodRecord{ .library = "ADVAPI32", .import = "CryptHashSessionKey", .signature = "\x00\x03\x11\x59\x19\x19\x09" } },
    .{ "CryptDestroyHash", MethodRecord{ .library = "ADVAPI32", .import = "CryptDestroyHash", .signature = "\x00\x01\x11\x59\x19" } },
    .{ "CryptSignHashA", MethodRecord{ .library = "ADVAPI32", .import = "CryptSignHashA", .signature = "\x00\x06\x11\x59\x19\x09\x11\x3d\x09\x0f\x05\x0f\x09" } },
    .{ "CryptSignHashW", MethodRecord{ .library = "ADVAPI32", .import = "CryptSignHashW", .signature = "\x00\x06\x11\x59\x19\x09\x11\x05\x09\x0f\x05\x0f\x09" } },
    .{ "CryptVerifySignatureA", MethodRecord{ .library = "ADVAPI32", .import = "CryptVerifySignatureA", .signature = "\x00\x06\x11\x59\x19\x0f\x05\x09\x19\x11\x3d\x09" } },
    .{ "CryptVerifySignatureW", MethodRecord{ .library = "ADVAPI32", .import = "CryptVerifySignatureW", .signature = "\x00\x06\x11\x59\x19\x0f\x05\x09\x19\x11\x05\x09" } },
    .{ "CryptSetProviderA", MethodRecord{ .library = "ADVAPI32", .import = "CryptSetProviderA", .signature = "\x00\x02\x11\x59\x11\x3d\x09" } },
    .{ "CryptSetProviderW", MethodRecord{ .library = "ADVAPI32", .import = "CryptSetProviderW", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "CryptSetProviderExA", MethodRecord{ .library = "ADVAPI32", .import = "CryptSetProviderExA", .signature = "\x00\x04\x11\x59\x11\x3d\x09\x0f\x09\x09" } },
    .{ "CryptSetProviderExW", MethodRecord{ .library = "ADVAPI32", .import = "CryptSetProviderExW", .signature = "\x00\x04\x11\x59\x11\x05\x09\x0f\x09\x09" } },
    .{ "CryptGetDefaultProviderA", MethodRecord{ .library = "ADVAPI32", .import = "CryptGetDefaultProviderA", .signature = "\x00\x05\x11\x59\x09\x0f\x09\x09\x11\x3d\x0f\x09" } },
    .{ "CryptGetDefaultProviderW", MethodRecord{ .library = "ADVAPI32", .import = "CryptGetDefaultProviderW", .signature = "\x00\x05\x11\x59\x09\x0f\x09\x09\x11\x05\x0f\x09" } },
    .{ "CryptEnumProviderTypesA", MethodRecord{ .library = "ADVAPI32", .import = "CryptEnumProviderTypesA", .signature = "\x00\x06\x11\x59\x09\x0f\x09\x09\x0f\x09\x11\x3d\x0f\x09" } },
    .{ "CryptEnumProviderTypesW", MethodRecord{ .library = "ADVAPI32", .import = "CryptEnumProviderTypesW", .signature = "\x00\x06\x11\x59\x09\x0f\x09\x09\x0f\x09\x11\x05\x0f\x09" } },
    .{ "CryptEnumProvidersA", MethodRecord{ .library = "ADVAPI32", .import = "CryptEnumProvidersA", .signature = "\x00\x06\x11\x59\x09\x0f\x09\x09\x0f\x09\x11\x3d\x0f\x09" } },
    .{ "CryptEnumProvidersW", MethodRecord{ .library = "ADVAPI32", .import = "CryptEnumProvidersW", .signature = "\x00\x06\x11\x59\x09\x0f\x09\x09\x0f\x09\x11\x05\x0f\x09" } },
    .{ "CryptContextAddRef", MethodRecord{ .library = "ADVAPI32", .import = "CryptContextAddRef", .signature = "\x00\x03\x11\x59\x19\x0f\x09\x09" } },
    .{ "CryptDuplicateKey", MethodRecord{ .library = "ADVAPI32", .import = "CryptDuplicateKey", .signature = "\x00\x04\x11\x59\x19\x0f\x09\x09\x0f\x19" } },
    .{ "CryptDuplicateHash", MethodRecord{ .library = "ADVAPI32", .import = "CryptDuplicateHash", .signature = "\x00\x04\x11\x59\x19\x0f\x09\x09\x0f\x19" } },
    .{ "BCryptOpenAlgorithmProvider", MethodRecord{ .library = "bcrypt", .import = "BCryptOpenAlgorithmProvider", .signature = "\x00\x04\x11\x84\x71\x0f\x11\x84\x5d\x11\x05\x11\x05\x11\x84\x75" } },
    .{ "BCryptEnumAlgorithms", MethodRecord{ .library = "bcrypt", .import = "BCryptEnumAlgorithms", .signature = "\x00\x04\x11\x84\x71\x11\x84\x79\x0f\x09\x0f\x0f\x11\x84\x7d\x09" } },
    .{ "BCryptEnumProviders", MethodRecord{ .library = "bcrypt", .import = "BCryptEnumProviders", .signature = "\x00\x04\x11\x84\x71\x11\x05\x0f\x09\x0f\x0f\x11\x84\x81\x09" } },
    .{ "BCryptGetProperty", MethodRecord{ .library = "bcrypt", .import = "BCryptGetProperty", .signature = "\x00\x06\x11\x84\x71\x11\x84\x85\x11\x05\x0f\x05\x09\x0f\x09\x09" } },
    .{ "BCryptSetProperty", MethodRecord{ .library = "bcrypt", .import = "BCryptSetProperty", .signature = "\x00\x05\x11\x84\x71\x11\x84\x85\x11\x05\x0f\x05\x09\x09" } },
    .{ "BCryptCloseAlgorithmProvider", MethodRecord{ .library = "bcrypt", .import = "BCryptCloseAlgorithmProvider", .signature = "\x00\x02\x11\x84\x71\x11\x84\x5d\x09" } },
    .{ "BCryptFreeBuffer", MethodRecord{ .library = "bcrypt", .import = "BCryptFreeBuffer", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "BCryptGenerateSymmetricKey", MethodRecord{ .library = "bcrypt", .import = "BCryptGenerateSymmetricKey", .signature = "\x00\x07\x11\x84\x71\x11\x84\x5d\x0f\x11\x84\x89\x0f\x05\x09\x0f\x05\x09\x09" } },
    .{ "BCryptGenerateKeyPair", MethodRecord{ .library = "bcrypt", .import = "BCryptGenerateKeyPair", .signature = "\x00\x04\x11\x84\x71\x11\x84\x5d\x0f\x11\x84\x89\x09\x09" } },
    .{ "BCryptEncrypt", MethodRecord{ .library = "bcrypt", .import = "BCryptEncrypt", .signature = "\x00\x0a\x11\x84\x71\x11\x84\x89\x0f\x05\x09\x0f\x01\x0f\x05\x09\x0f\x05\x09\x0f\x09\x11\x84\x8d" } },
    .{ "BCryptDecrypt", MethodRecord{ .library = "bcrypt", .import = "BCryptDecrypt", .signature = "\x00\x0a\x11\x84\x71\x11\x84\x89\x0f\x05\x09\x0f\x01\x0f\x05\x09\x0f\x05\x09\x0f\x09\x11\x84\x8d" } },
    .{ "BCryptExportKey", MethodRecord{ .library = "bcrypt", .import = "BCryptExportKey", .signature = "\x00\x07\x11\x84\x71\x11\x84\x89\x11\x84\x89\x11\x05\x0f\x05\x09\x0f\x09\x09" } },
    .{ "BCryptImportKey", MethodRecord{ .library = "bcrypt", .import = "BCryptImportKey", .signature = "\x00\x09\x11\x84\x71\x11\x84\x5d\x11\x84\x89\x11\x05\x0f\x11\x84\x89\x0f\x05\x09\x0f\x05\x09\x09" } },
    .{ "BCryptImportKeyPair", MethodRecord{ .library = "bcrypt", .import = "BCryptImportKeyPair", .signature = "\x00\x07\x11\x84\x71\x11\x84\x5d\x11\x84\x89\x11\x05\x0f\x11\x84\x89\x0f\x05\x09\x09" } },
    .{ "BCryptDuplicateKey", MethodRecord{ .library = "bcrypt", .import = "BCryptDuplicateKey", .signature = "\x00\x05\x11\x84\x71\x11\x84\x89\x0f\x11\x84\x89\x0f\x05\x09\x09" } },
    .{ "BCryptFinalizeKeyPair", MethodRecord{ .library = "bcrypt", .import = "BCryptFinalizeKeyPair", .signature = "\x00\x02\x11\x84\x71\x11\x84\x89\x09" } },
    .{ "BCryptDestroyKey", MethodRecord{ .library = "bcrypt", .import = "BCryptDestroyKey", .signature = "\x00\x01\x11\x84\x71\x11\x84\x89" } },
    .{ "BCryptDestroySecret", MethodRecord{ .library = "bcrypt", .import = "BCryptDestroySecret", .signature = "\x00\x01\x11\x84\x71\x11\x84\x91" } },
    .{ "BCryptSignHash", MethodRecord{ .library = "bcrypt", .import = "BCryptSignHash", .signature = "\x00\x08\x11\x84\x71\x11\x84\x89\x0f\x01\x0f\x05\x09\x0f\x05\x09\x0f\x09\x11\x84\x8d" } },
    .{ "BCryptVerifySignature", MethodRecord{ .library = "bcrypt", .import = "BCryptVerifySignature", .signature = "\x00\x07\x11\x84\x71\x11\x84\x89\x0f\x01\x0f\x05\x09\x0f\x05\x09\x11\x84\x8d" } },
    .{ "BCryptSecretAgreement", MethodRecord{ .library = "bcrypt", .import = "BCryptSecretAgreement", .signature = "\x00\x04\x11\x84\x71\x11\x84\x89\x11\x84\x89\x0f\x11\x84\x91\x09" } },
    .{ "BCryptDeriveKey", MethodRecord{ .library = "bcrypt", .import = "BCryptDeriveKey", .signature = "\x00\x07\x11\x84\x71\x11\x84\x91\x11\x05\x0f\x11\x84\x95\x0f\x05\x09\x0f\x09\x09" } },
    .{ "BCryptKeyDerivation", MethodRecord{ .library = "bcrypt", .import = "BCryptKeyDerivation", .signature = "\x00\x06\x11\x84\x71\x11\x84\x89\x0f\x11\x84\x95\x0f\x05\x09\x0f\x09\x09" } },
    .{ "BCryptCreateHash", MethodRecord{ .library = "bcrypt", .import = "BCryptCreateHash", .signature = "\x00\x07\x11\x84\x71\x11\x84\x5d\x0f\x11\x84\x99\x0f\x05\x09\x0f\x05\x09\x09" } },
    .{ "BCryptHashData", MethodRecord{ .library = "bcrypt", .import = "BCryptHashData", .signature = "\x00\x04\x11\x84\x71\x11\x84\x99\x0f\x05\x09\x09" } },
    .{ "BCryptFinishHash", MethodRecord{ .library = "bcrypt", .import = "BCryptFinishHash", .signature = "\x00\x04\x11\x84\x71\x11\x84\x99\x0f\x05\x09\x09" } },
    .{ "BCryptCreateMultiHash", MethodRecord{ .library = "bcrypt", .import = "BCryptCreateMultiHash", .signature = "\x00\x08\x11\x84\x71\x11\x84\x5d\x0f\x11\x84\x99\x09\x0f\x05\x09\x0f\x05\x09\x09" } },
    .{ "BCryptProcessMultiOperations", MethodRecord{ .library = "bcrypt", .import = "BCryptProcessMultiOperations", .signature = "\x00\x05\x11\x84\x71\x11\x84\x85\x11\x84\x9d\x0f\x01\x09\x09" } },
    .{ "BCryptDuplicateHash", MethodRecord{ .library = "bcrypt", .import = "BCryptDuplicateHash", .signature = "\x00\x05\x11\x84\x71\x11\x84\x99\x0f\x11\x84\x99\x0f\x05\x09\x09" } },
    .{ "BCryptDestroyHash", MethodRecord{ .library = "bcrypt", .import = "BCryptDestroyHash", .signature = "\x00\x01\x11\x84\x71\x11\x84\x99" } },
    .{ "BCryptHash", MethodRecord{ .library = "bcrypt", .import = "BCryptHash", .signature = "\x00\x07\x11\x84\x71\x11\x84\x5d\x0f\x05\x09\x0f\x05\x09\x0f\x05\x09" } },
    .{ "BCryptGenRandom", MethodRecord{ .library = "bcrypt", .import = "BCryptGenRandom", .signature = "\x00\x04\x11\x84\x71\x11\x84\x5d\x0f\x05\x09\x11\x84\xa1" } },
    .{ "BCryptDeriveKeyCapi", MethodRecord{ .library = "bcrypt", .import = "BCryptDeriveKeyCapi", .signature = "\x00\x05\x11\x84\x71\x11\x84\x99\x11\x84\x5d\x0f\x05\x09\x09" } },
    .{ "BCryptDeriveKeyPBKDF2", MethodRecord{ .library = "bcrypt", .import = "BCryptDeriveKeyPBKDF2", .signature = "\x00\x09\x11\x84\x71\x11\x84\x5d\x0f\x05\x09\x0f\x05\x09\x0b\x0f\x05\x09\x09" } },
    .{ "BCryptEncapsulate", MethodRecord{ .library = "bcrypt", .import = "BCryptEncapsulate", .signature = "\x00\x08\x11\x84\x71\x11\x84\x89\x0f\x05\x09\x0f\x09\x0f\x05\x09\x0f\x09\x09" } },
    .{ "BCryptDecapsulate", MethodRecord{ .library = "bcrypt", .import = "BCryptDecapsulate", .signature = "\x00\x07\x11\x84\x71\x11\x84\x89\x0f\x05\x09\x0f\x05\x09\x0f\x09\x09" } },
    .{ "BCryptQueryProviderRegistration", MethodRecord{ .library = "bcrypt", .import = "BCryptQueryProviderRegistration", .signature = "\x00\x05\x11\x84\x71\x11\x05\x11\x84\xa5\x11\x84\xa9\x0f\x09\x0f\x0f\x11\x84\xad" } },
    .{ "BCryptEnumRegisteredProviders", MethodRecord{ .library = "bcrypt", .import = "BCryptEnumRegisteredProviders", .signature = "\x00\x02\x11\x84\x71\x0f\x09\x0f\x0f\x11\x84\xb1" } },
    .{ "BCryptCreateContext", MethodRecord{ .library = "bcrypt", .import = "BCryptCreateContext", .signature = "\x00\x03\x11\x84\x71\x11\x84\xb5\x11\x05\x0f\x11\x84\xb9" } },
    .{ "BCryptDeleteContext", MethodRecord{ .library = "bcrypt", .import = "BCryptDeleteContext", .signature = "\x00\x02\x11\x84\x71\x11\x84\xb5\x11\x05" } },
    .{ "BCryptEnumContexts", MethodRecord{ .library = "bcrypt", .import = "BCryptEnumContexts", .signature = "\x00\x03\x11\x84\x71\x11\x84\xb5\x0f\x09\x0f\x0f\x11\x84\xbd" } },
    .{ "BCryptConfigureContext", MethodRecord{ .library = "bcrypt", .import = "BCryptConfigureContext", .signature = "\x00\x03\x11\x84\x71\x11\x84\xb5\x11\x05\x0f\x11\x84\xb9" } },
    .{ "BCryptQueryContextConfiguration", MethodRecord{ .library = "bcrypt", .import = "BCryptQueryContextConfiguration", .signature = "\x00\x04\x11\x84\x71\x11\x84\xb5\x11\x05\x0f\x09\x0f\x0f\x11\x84\xb9" } },
    .{ "BCryptAddContextFunction", MethodRecord{ .library = "bcrypt", .import = "BCryptAddContextFunction", .signature = "\x00\x05\x11\x84\x71\x11\x84\xb5\x11\x05\x11\x84\xa9\x11\x05\x09" } },
    .{ "BCryptRemoveContextFunction", MethodRecord{ .library = "bcrypt", .import = "BCryptRemoveContextFunction", .signature = "\x00\x04\x11\x84\x71\x11\x84\xb5\x11\x05\x11\x84\xa9\x11\x05" } },
    .{ "BCryptEnumContextFunctions", MethodRecord{ .library = "bcrypt", .import = "BCryptEnumContextFunctions", .signature = "\x00\x05\x11\x84\x71\x11\x84\xb5\x11\x05\x11\x84\xa9\x0f\x09\x0f\x0f\x11\x84\xc1" } },
    .{ "BCryptConfigureContextFunction", MethodRecord{ .library = "bcrypt", .import = "BCryptConfigureContextFunction", .signature = "\x00\x05\x11\x84\x71\x11\x84\xb5\x11\x05\x11\x84\xa9\x11\x05\x0f\x11\x84\xc5" } },
    .{ "BCryptQueryContextFunctionConfiguration", MethodRecord{ .library = "bcrypt", .import = "BCryptQueryContextFunctionConfiguration", .signature = "\x00\x06\x11\x84\x71\x11\x84\xb5\x11\x05\x11\x84\xa9\x11\x05\x0f\x09\x0f\x0f\x11\x84\xc5" } },
    .{ "BCryptEnumContextFunctionProviders", MethodRecord{ .library = "bcrypt", .import = "BCryptEnumContextFunctionProviders", .signature = "\x00\x06\x11\x84\x71\x11\x84\xb5\x11\x05\x11\x84\xa9\x11\x05\x0f\x09\x0f\x0f\x11\x84\xc9" } },
    .{ "BCryptSetContextFunctionProperty", MethodRecord{ .library = "bcrypt", .import = "BCryptSetContextFunctionProperty", .signature = "\x00\x07\x11\x84\x71\x11\x84\xb5\x11\x05\x11\x84\xa9\x11\x05\x11\x05\x09\x0f\x05" } },
    .{ "BCryptQueryContextFunctionProperty", MethodRecord{ .library = "bcrypt", .import = "BCryptQueryContextFunctionProperty", .signature = "\x00\x07\x11\x84\x71\x11\x84\xb5\x11\x05\x11\x84\xa9\x11\x05\x11\x05\x0f\x09\x0f\x0f\x05" } },
    .{ "BCryptRegisterConfigChangeNotify", MethodRecord{ .library = "bcrypt", .import = "BCryptRegisterConfigChangeNotify", .signature = "\x00\x01\x11\x84\x71\x0f\x11\x80\x85" } },
    .{ "BCryptUnregisterConfigChangeNotify", MethodRecord{ .library = "bcrypt", .import = "BCryptUnregisterConfigChangeNotify", .signature = "\x00\x01\x11\x84\x71\x11\x80\x85" } },
    .{ "BCryptResolveProviders", MethodRecord{ .library = "bcrypt", .import = "BCryptResolveProviders", .signature = "\x00\x08\x11\x84\x71\x11\x05\x09\x11\x05\x11\x05\x11\x84\xa5\x11\x84\xcd\x0f\x09\x0f\x0f\x11\x84\xd1" } },
    .{ "BCryptGetFipsAlgorithmMode", MethodRecord{ .library = "bcrypt", .import = "BCryptGetFipsAlgorithmMode", .signature = "\x00\x01\x11\x84\x71\x0f\x05" } },
    .{ "NCryptOpenStorageProvider", MethodRecord{ .library = "ncrypt", .import = "NCryptOpenStorageProvider", .signature = "\x00\x03\x11\x79\x0f\x11\x84\xd5\x11\x05\x09" } },
    .{ "NCryptEnumAlgorithms", MethodRecord{ .library = "ncrypt", .import = "NCryptEnumAlgorithms", .signature = "\x00\x05\x11\x79\x11\x84\xd5\x11\x84\xd9\x0f\x09\x0f\x0f\x11\x84\xdd\x09" } },
    .{ "NCryptIsAlgSupported", MethodRecord{ .library = "ncrypt", .import = "NCryptIsAlgSupported", .signature = "\x00\x03\x11\x79\x11\x84\xd5\x11\x05\x09" } },
    .{ "NCryptEnumKeys", MethodRecord{ .library = "ncrypt", .import = "NCryptEnumKeys", .signature = "\x00\x05\x11\x79\x11\x84\xd5\x11\x05\x0f\x0f\x11\x84\xe1\x0f\x0f\x01\x11\x84\xe5" } },
    .{ "NCryptEnumStorageProviders", MethodRecord{ .library = "ncrypt", .import = "NCryptEnumStorageProviders", .signature = "\x00\x03\x11\x79\x0f\x09\x0f\x0f\x11\x84\xe9\x09" } },
    .{ "NCryptFreeBuffer", MethodRecord{ .library = "ncrypt", .import = "NCryptFreeBuffer", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "NCryptOpenKey", MethodRecord{ .library = "ncrypt", .import = "NCryptOpenKey", .signature = "\x00\x05\x11\x79\x11\x84\xd5\x0f\x11\x84\xed\x11\x05\x11\x84\xf1\x11\x84\xe5" } },
    .{ "NCryptCreatePersistedKey", MethodRecord{ .library = "ncrypt", .import = "NCryptCreatePersistedKey", .signature = "\x00\x06\x11\x79\x11\x84\xd5\x0f\x11\x84\xed\x11\x05\x11\x05\x11\x84\xf1\x11\x84\xe5" } },
    .{ "NCryptGetProperty", MethodRecord{ .library = "ncrypt", .import = "NCryptGetProperty", .signature = "\x00\x06\x11\x79\x11\x84\xf5\x11\x05\x0f\x05\x09\x0f\x09\x11\x84\xf9" } },
    .{ "NCryptSetProperty", MethodRecord{ .library = "ncrypt", .import = "NCryptSetProperty", .signature = "\x00\x05\x11\x79\x11\x84\xf5\x11\x05\x0f\x05\x09\x11\x84\xe5" } },
    .{ "NCryptFinalizeKey", MethodRecord{ .library = "ncrypt", .import = "NCryptFinalizeKey", .signature = "\x00\x02\x11\x79\x11\x84\xed\x11\x84\xe5" } },
    .{ "NCryptEncrypt", MethodRecord{ .library = "ncrypt", .import = "NCryptEncrypt", .signature = "\x00\x08\x11\x79\x11\x84\xed\x0f\x05\x09\x0f\x01\x0f\x05\x09\x0f\x09\x11\x84\xe5" } },
    .{ "NCryptDecrypt", MethodRecord{ .library = "ncrypt", .import = "NCryptDecrypt", .signature = "\x00\x08\x11\x79\x11\x84\xed\x0f\x05\x09\x0f\x01\x0f\x05\x09\x0f\x09\x11\x84\xe5" } },
    .{ "NCryptEncapsulate", MethodRecord{ .library = "ncrypt", .import = "NCryptEncapsulate", .signature = "\x00\x08\x11\x79\x11\x84\xed\x0f\x05\x09\x0f\x09\x0f\x05\x09\x0f\x09\x09" } },
    .{ "NCryptDecapsulate", MethodRecord{ .library = "ncrypt", .import = "NCryptDecapsulate", .signature = "\x00\x07\x11\x79\x11\x84\xed\x0f\x05\x09\x0f\x05\x09\x0f\x09\x09" } },
    .{ "NCryptImportKey", MethodRecord{ .library = "ncrypt", .import = "NCryptImportKey", .signature = "\x00\x08\x11\x79\x11\x84\xd5\x11\x84\xed\x11\x05\x0f\x11\x84\x95\x0f\x11\x84\xed\x0f\x05\x09\x11\x84\xe5" } },
    .{ "NCryptExportKey", MethodRecord{ .library = "ncrypt", .import = "NCryptExportKey", .signature = "\x00\x08\x11\x79\x11\x84\xed\x11\x84\xed\x11\x05\x0f\x11\x84\x95\x0f\x05\x09\x0f\x09\x11\x84\xe5" } },
    .{ "NCryptSignHash", MethodRecord{ .library = "ncrypt", .import = "NCryptSignHash", .signature = "\x00\x08\x11\x79\x11\x84\xed\x0f\x01\x0f\x05\x09\x0f\x05\x09\x0f\x09\x11\x84\xe5" } },
    .{ "NCryptVerifySignature", MethodRecord{ .library = "ncrypt", .import = "NCryptVerifySignature", .signature = "\x00\x07\x11\x79\x11\x84\xed\x0f\x01\x0f\x05\x09\x0f\x05\x09\x11\x84\xe5" } },
    .{ "NCryptDeleteKey", MethodRecord{ .library = "ncrypt", .import = "NCryptDeleteKey", .signature = "\x00\x02\x11\x79\x11\x84\xed\x09" } },
    .{ "NCryptFreeObject", MethodRecord{ .library = "ncrypt", .import = "NCryptFreeObject", .signature = "\x00\x01\x11\x79\x11\x84\xf5" } },
    .{ "NCryptIsKeyHandle", MethodRecord{ .library = "ncrypt", .import = "NCryptIsKeyHandle", .signature = "\x00\x01\x11\x59\x11\x84\xed" } },
    .{ "NCryptTranslateHandle", MethodRecord{ .library = "ncrypt", .import = "NCryptTranslateHandle", .signature = "\x00\x06\x11\x79\x0f\x11\x84\xd5\x0f\x11\x84\xed\x19\x19\x11\x84\xf1\x09" } },
    .{ "NCryptNotifyChangeKey", MethodRecord{ .library = "ncrypt", .import = "NCryptNotifyChangeKey", .signature = "\x00\x03\x11\x79\x11\x84\xd5\x0f\x11\x80\x85\x11\x84\xe5" } },
    .{ "NCryptSecretAgreement", MethodRecord{ .library = "ncrypt", .import = "NCryptSecretAgreement", .signature = "\x00\x04\x11\x79\x11\x84\xed\x11\x84\xed\x0f\x11\x84\xfd\x11\x84\xe5" } },
    .{ "NCryptDeriveKey", MethodRecord{ .library = "ncrypt", .import = "NCryptDeriveKey", .signature = "\x00\x07\x11\x79\x11\x84\xfd\x11\x05\x0f\x11\x84\x95\x0f\x05\x09\x0f\x09\x09" } },
    .{ "NCryptKeyDerivation", MethodRecord{ .library = "ncrypt", .import = "NCryptKeyDerivation", .signature = "\x00\x06\x11\x79\x11\x84\xed\x0f\x11\x84\x95\x0f\x05\x09\x0f\x09\x09" } },
    .{ "NCryptCreateClaim", MethodRecord{ .library = "ncrypt", .import = "NCryptCreateClaim", .signature = "\x00\x08\x11\x79\x11\x84\xed\x11\x84\xed\x09\x0f\x11\x84\x95\x0f\x05\x09\x0f\x09\x09" } },
    .{ "NCryptVerifyClaim", MethodRecord{ .library = "ncrypt", .import = "NCryptVerifyClaim", .signature = "\x00\x08\x11\x79\x11\x84\xed\x11\x84\xed\x09\x0f\x11\x84\x95\x0f\x05\x09\x0f\x11\x84\x95\x09" } },
    .{ "CryptFormatObject", MethodRecord{ .library = "CRYPT32", .import = "CryptFormatObject", .signature = "\x00\x09\x11\x59\x11\x85\x01\x09\x09\x0f\x01\x11\x3d\x0f\x05\x09\x0f\x01\x0f\x09" } },
    .{ "CryptEncodeObjectEx", MethodRecord{ .library = "CRYPT32", .import = "CryptEncodeObjectEx", .signature = "\x00\x07\x11\x59\x11\x85\x01\x11\x3d\x0f\x01\x11\x85\x05\x0f\x11\x85\x09\x0f\x01\x0f\x09" } },
    .{ "CryptEncodeObject", MethodRecord{ .library = "CRYPT32", .import = "CryptEncodeObject", .signature = "\x00\x05\x11\x59\x11\x85\x01\x11\x3d\x0f\x01\x0f\x05\x0f\x09" } },
    .{ "CryptDecodeObjectEx", MethodRecord{ .library = "CRYPT32", .import = "CryptDecodeObjectEx", .signature = "\x00\x08\x11\x59\x11\x85\x01\x11\x3d\x0f\x05\x09\x09\x0f\x11\x85\x0d\x0f\x01\x0f\x09" } },
    .{ "CryptDecodeObject", MethodRecord{ .library = "CRYPT32", .import = "CryptDecodeObject", .signature = "\x00\x07\x11\x59\x11\x85\x01\x11\x3d\x0f\x05\x09\x09\x0f\x01\x0f\x09" } },
    .{ "CryptInstallOIDFunctionAddress", MethodRecord{ .library = "CRYPT32", .import = "CryptInstallOIDFunctionAddress", .signature = "\x00\x06\x11\x59\x11\x81\x81\x09\x11\x3d\x09\x0f\x11\x85\x11\x09" } },
    .{ "CryptInitOIDFunctionSet", MethodRecord{ .library = "CRYPT32", .import = "CryptInitOIDFunctionSet", .signature = "\x00\x02\x0f\x01\x11\x3d\x09" } },
    .{ "CryptGetOIDFunctionAddress", MethodRecord{ .library = "CRYPT32", .import = "CryptGetOIDFunctionAddress", .signature = "\x00\x06\x11\x59\x0f\x01\x09\x11\x3d\x09\x0f\x0f\x01\x0f\x0f\x01" } },
    .{ "CryptGetDefaultOIDDllList", MethodRecord{ .library = "CRYPT32", .import = "CryptGetDefaultOIDDllList", .signature = "\x00\x04\x11\x59\x0f\x01\x09\x11\x05\x0f\x09" } },
    .{ "CryptGetDefaultOIDFunctionAddress", MethodRecord{ .library = "CRYPT32", .import = "CryptGetDefaultOIDFunctionAddress", .signature = "\x00\x06\x11\x59\x0f\x01\x09\x11\x05\x09\x0f\x0f\x01\x0f\x0f\x01" } },
    .{ "CryptFreeOIDFunctionAddress", MethodRecord{ .library = "CRYPT32", .import = "CryptFreeOIDFunctionAddress", .signature = "\x00\x02\x11\x59\x0f\x01\x09" } },
    .{ "CryptRegisterOIDFunction", MethodRecord{ .library = "CRYPT32", .import = "CryptRegisterOIDFunction", .signature = "\x00\x05\x11\x59\x09\x11\x3d\x11\x3d\x11\x05\x11\x3d" } },
    .{ "CryptUnregisterOIDFunction", MethodRecord{ .library = "CRYPT32", .import = "CryptUnregisterOIDFunction", .signature = "\x00\x03\x11\x59\x09\x11\x3d\x11\x3d" } },
    .{ "CryptRegisterDefaultOIDFunction", MethodRecord{ .library = "CRYPT32", .import = "CryptRegisterDefaultOIDFunction", .signature = "\x00\x04\x11\x59\x09\x11\x3d\x09\x11\x05" } },
    .{ "CryptUnregisterDefaultOIDFunction", MethodRecord{ .library = "CRYPT32", .import = "CryptUnregisterDefaultOIDFunction", .signature = "\x00\x03\x11\x59\x09\x11\x3d\x11\x05" } },
    .{ "CryptSetOIDFunctionValue", MethodRecord{ .library = "CRYPT32", .import = "CryptSetOIDFunctionValue", .signature = "\x00\x07\x11\x59\x09\x11\x3d\x11\x3d\x11\x05\x11\x85\x19\x0f\x05\x09" } },
    .{ "CryptGetOIDFunctionValue", MethodRecord{ .library = "CRYPT32", .import = "CryptGetOIDFunctionValue", .signature = "\x00\x07\x11\x59\x09\x11\x3d\x11\x3d\x11\x05\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "CryptEnumOIDFunction", MethodRecord{ .library = "CRYPT32", .import = "CryptEnumOIDFunction", .signature = "\x00\x06\x11\x59\x09\x11\x3d\x11\x3d\x09\x0f\x01\x12\x85\x1d" } },
    .{ "CryptFindOIDInfo", MethodRecord{ .library = "CRYPT32", .import = "CryptFindOIDInfo", .signature = "\x00\x03\x0f\x11\x85\x21\x09\x0f\x01\x09" } },
    .{ "CryptRegisterOIDInfo", MethodRecord{ .library = "CRYPT32", .import = "CryptRegisterOIDInfo", .signature = "\x00\x02\x11\x59\x0f\x11\x85\x21\x09" } },
    .{ "CryptUnregisterOIDInfo", MethodRecord{ .library = "CRYPT32", .import = "CryptUnregisterOIDInfo", .signature = "\x00\x01\x11\x59\x0f\x11\x85\x21" } },
    .{ "CryptEnumOIDInfo", MethodRecord{ .library = "CRYPT32", .import = "CryptEnumOIDInfo", .signature = "\x00\x04\x11\x59\x09\x09\x0f\x01\x12\x85\x25" } },
    .{ "CryptFindLocalizedName", MethodRecord{ .library = "CRYPT32", .import = "CryptFindLocalizedName", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "CryptMsgOpenToEncode", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgOpenToEncode", .signature = "\x00\x06\x0f\x01\x09\x09\x11\x85\x29\x0f\x01\x11\x3d\x0f\x11\x85\x2d" } },
    .{ "CryptMsgCalculateEncodedLength", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgCalculateEncodedLength", .signature = "\x00\x06\x09\x09\x09\x09\x0f\x01\x11\x3d\x09" } },
    .{ "CryptMsgOpenToDecode", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgOpenToDecode", .signature = "\x00\x06\x0f\x01\x09\x09\x09\x11\x85\x31\x0f\x11\x85\x35\x0f\x11\x85\x2d" } },
    .{ "CryptMsgDuplicate", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgDuplicate", .signature = "\x00\x01\x0f\x01\x0f\x01" } },
    .{ "CryptMsgClose", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgClose", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "CryptMsgUpdate", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgUpdate", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x05\x09\x11\x59" } },
    .{ "CryptMsgGetParam", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgGetParam", .signature = "\x00\x05\x11\x59\x0f\x01\x09\x09\x0f\x01\x0f\x09" } },
    .{ "CryptMsgControl", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgControl", .signature = "\x00\x04\x11\x59\x0f\x01\x09\x09\x0f\x01" } },
    .{ "CryptMsgVerifyCountersignatureEncoded", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgVerifyCountersignatureEncoded", .signature = "\x00\x07\x11\x59\x11\x85\x31\x09\x0f\x05\x09\x0f\x05\x09\x0f\x11\x85\x35" } },
    .{ "CryptMsgVerifyCountersignatureEncodedEx", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgVerifyCountersignatureEncodedEx", .signature = "\x00\x0a\x11\x59\x11\x85\x31\x09\x0f\x05\x09\x0f\x05\x09\x09\x0f\x01\x09\x0f\x01" } },
    .{ "CryptMsgCountersign", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgCountersign", .signature = "\x00\x04\x11\x59\x0f\x01\x09\x09\x0f\x11\x85\x39" } },
    .{ "CryptMsgCountersignEncoded", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgCountersignEncoded", .signature = "\x00\x07\x11\x59\x09\x0f\x05\x09\x09\x0f\x11\x85\x39\x0f\x05\x0f\x09" } },
    .{ "CertOpenStore", MethodRecord{ .library = "CRYPT32", .import = "CertOpenStore", .signature = "\x00\x05\x11\x85\x3d\x11\x3d\x11\x85\x01\x11\x85\x31\x11\x85\x41\x0f\x01" } },
    .{ "CertDuplicateStore", MethodRecord{ .library = "CRYPT32", .import = "CertDuplicateStore", .signature = "\x00\x01\x11\x85\x3d\x11\x85\x3d" } },
    .{ "CertSaveStore", MethodRecord{ .library = "CRYPT32", .import = "CertSaveStore", .signature = "\x00\x06\x11\x59\x11\x85\x3d\x11\x85\x01\x11\x85\x45\x11\x85\x49\x0f\x01\x09" } },
    .{ "CertCloseStore", MethodRecord{ .library = "CRYPT32", .import = "CertCloseStore", .signature = "\x00\x02\x11\x59\x11\x85\x3d\x09" } },
    .{ "CertGetSubjectCertificateFromStore", MethodRecord{ .library = "CRYPT32", .import = "CertGetSubjectCertificateFromStore", .signature = "\x00\x03\x0f\x11\x7d\x11\x85\x3d\x11\x85\x01\x0f\x11\x85\x35" } },
    .{ "CertEnumCertificatesInStore", MethodRecord{ .library = "CRYPT32", .import = "CertEnumCertificatesInStore", .signature = "\x00\x02\x0f\x11\x7d\x11\x85\x3d\x0f\x11\x7d" } },
    .{ "CertFindCertificateInStore", MethodRecord{ .library = "CRYPT32", .import = "CertFindCertificateInStore", .signature = "\x00\x06\x0f\x11\x7d\x11\x85\x3d\x11\x85\x01\x09\x11\x85\x4d\x0f\x01\x0f\x11\x7d" } },
    .{ "CertGetIssuerCertificateFromStore", MethodRecord{ .library = "CRYPT32", .import = "CertGetIssuerCertificateFromStore", .signature = "\x00\x04\x0f\x11\x7d\x11\x85\x3d\x0f\x11\x7d\x0f\x11\x7d\x0f\x09" } },
    .{ "CertVerifySubjectCertificateContext", MethodRecord{ .library = "CRYPT32", .import = "CertVerifySubjectCertificateContext", .signature = "\x00\x03\x11\x59\x0f\x11\x7d\x0f\x11\x7d\x0f\x09" } },
    .{ "CertDuplicateCertificateContext", MethodRecord{ .library = "CRYPT32", .import = "CertDuplicateCertificateContext", .signature = "\x00\x01\x0f\x11\x7d\x0f\x11\x7d" } },
    .{ "CertCreateCertificateContext", MethodRecord{ .library = "CRYPT32", .import = "CertCreateCertificateContext", .signature = "\x00\x03\x0f\x11\x7d\x11\x85\x01\x0f\x05\x09" } },
    .{ "CertFreeCertificateContext", MethodRecord{ .library = "CRYPT32", .import = "CertFreeCertificateContext", .signature = "\x00\x01\x11\x59\x0f\x11\x7d" } },
    .{ "CertSetCertificateContextProperty", MethodRecord{ .library = "CRYPT32", .import = "CertSetCertificateContextProperty", .signature = "\x00\x04\x11\x59\x0f\x11\x7d\x09\x09\x0f\x01" } },
    .{ "CertGetCertificateContextProperty", MethodRecord{ .library = "CRYPT32", .import = "CertGetCertificateContextProperty", .signature = "\x00\x04\x11\x59\x0f\x11\x7d\x09\x0f\x01\x0f\x09" } },
    .{ "CertEnumCertificateContextProperties", MethodRecord{ .library = "CRYPT32", .import = "CertEnumCertificateContextProperties", .signature = "\x00\x02\x09\x0f\x11\x7d\x09" } },
    .{ "CertCreateCTLEntryFromCertificateContextProperties", MethodRecord{ .library = "CRYPT32", .import = "CertCreateCTLEntryFromCertificateContextProperties", .signature = "\x00\x07\x11\x59\x0f\x11\x7d\x09\x0f\x11\x85\x51\x09\x0f\x01\x0f\x11\x85\x55\x0f\x09" } },
    .{ "CertSetCertificateContextPropertiesFromCTLEntry", MethodRecord{ .library = "CRYPT32", .import = "CertSetCertificateContextPropertiesFromCTLEntry", .signature = "\x00\x03\x11\x59\x0f\x11\x7d\x0f\x11\x85\x55\x09" } },
    .{ "CertGetCRLFromStore", MethodRecord{ .library = "CRYPT32", .import = "CertGetCRLFromStore", .signature = "\x00\x04\x0f\x11\x85\x59\x11\x85\x3d\x0f\x11\x7d\x0f\x11\x85\x59\x0f\x09" } },
    .{ "CertEnumCRLsInStore", MethodRecord{ .library = "CRYPT32", .import = "CertEnumCRLsInStore", .signature = "\x00\x02\x0f\x11\x85\x59\x11\x85\x3d\x0f\x11\x85\x59" } },
    .{ "CertFindCRLInStore", MethodRecord{ .library = "CRYPT32", .import = "CertFindCRLInStore", .signature = "\x00\x06\x0f\x11\x85\x59\x11\x85\x3d\x11\x85\x01\x09\x09\x0f\x01\x0f\x11\x85\x59" } },
    .{ "CertDuplicateCRLContext", MethodRecord{ .library = "CRYPT32", .import = "CertDuplicateCRLContext", .signature = "\x00\x01\x0f\x11\x85\x59\x0f\x11\x85\x59" } },
    .{ "CertCreateCRLContext", MethodRecord{ .library = "CRYPT32", .import = "CertCreateCRLContext", .signature = "\x00\x03\x0f\x11\x85\x59\x11\x85\x01\x0f\x05\x09" } },
    .{ "CertFreeCRLContext", MethodRecord{ .library = "CRYPT32", .import = "CertFreeCRLContext", .signature = "\x00\x01\x11\x59\x0f\x11\x85\x59" } },
    .{ "CertSetCRLContextProperty", MethodRecord{ .library = "CRYPT32", .import = "CertSetCRLContextProperty", .signature = "\x00\x04\x11\x59\x0f\x11\x85\x59\x09\x09\x0f\x01" } },
    .{ "CertGetCRLContextProperty", MethodRecord{ .library = "CRYPT32", .import = "CertGetCRLContextProperty", .signature = "\x00\x04\x11\x59\x0f\x11\x85\x59\x09\x0f\x01\x0f\x09" } },
    .{ "CertEnumCRLContextProperties", MethodRecord{ .library = "CRYPT32", .import = "CertEnumCRLContextProperties", .signature = "\x00\x02\x09\x0f\x11\x85\x59\x09" } },
    .{ "CertFindCertificateInCRL", MethodRecord{ .library = "CRYPT32", .import = "CertFindCertificateInCRL", .signature = "\x00\x05\x11\x59\x0f\x11\x7d\x0f\x11\x85\x59\x09\x0f\x01\x0f\x0f\x11\x85\x5d" } },
    .{ "CertIsValidCRLForCertificate", MethodRecord{ .library = "CRYPT32", .import = "CertIsValidCRLForCertificate", .signature = "\x00\x04\x11\x59\x0f\x11\x7d\x0f\x11\x85\x59\x09\x0f\x01" } },
    .{ "CertAddEncodedCertificateToStore", MethodRecord{ .library = "CRYPT32", .import = "CertAddEncodedCertificateToStore", .signature = "\x00\x06\x11\x59\x11\x85\x3d\x11\x85\x01\x0f\x05\x09\x09\x0f\x0f\x11\x7d" } },
    .{ "CertAddCertificateContextToStore", MethodRecord{ .library = "CRYPT32", .import = "CertAddCertificateContextToStore", .signature = "\x00\x04\x11\x59\x11\x85\x3d\x0f\x11\x7d\x09\x0f\x0f\x11\x7d" } },
    .{ "CertAddSerializedElementToStore", MethodRecord{ .library = "CRYPT32", .import = "CertAddSerializedElementToStore", .signature = "\x00\x08\x11\x59\x11\x85\x3d\x0f\x05\x09\x09\x09\x09\x0f\x09\x0f\x0f\x01" } },
    .{ "CertDeleteCertificateFromStore", MethodRecord{ .library = "CRYPT32", .import = "CertDeleteCertificateFromStore", .signature = "\x00\x01\x11\x59\x0f\x11\x7d" } },
    .{ "CertAddEncodedCRLToStore", MethodRecord{ .library = "CRYPT32", .import = "CertAddEncodedCRLToStore", .signature = "\x00\x06\x11\x59\x11\x85\x3d\x11\x85\x01\x0f\x05\x09\x09\x0f\x0f\x11\x85\x59" } },
    .{ "CertAddCRLContextToStore", MethodRecord{ .library = "CRYPT32", .import = "CertAddCRLContextToStore", .signature = "\x00\x04\x11\x59\x11\x85\x3d\x0f\x11\x85\x59\x09\x0f\x0f\x11\x85\x59" } },
    .{ "CertDeleteCRLFromStore", MethodRecord{ .library = "CRYPT32", .import = "CertDeleteCRLFromStore", .signature = "\x00\x01\x11\x59\x0f\x11\x85\x59" } },
    .{ "CertSerializeCertificateStoreElement", MethodRecord{ .library = "CRYPT32", .import = "CertSerializeCertificateStoreElement", .signature = "\x00\x04\x11\x59\x0f\x11\x7d\x09\x0f\x05\x0f\x09" } },
    .{ "CertSerializeCRLStoreElement", MethodRecord{ .library = "CRYPT32", .import = "CertSerializeCRLStoreElement", .signature = "\x00\x04\x11\x59\x0f\x11\x85\x59\x09\x0f\x05\x0f\x09" } },
    .{ "CertDuplicateCTLContext", MethodRecord{ .library = "CRYPT32", .import = "CertDuplicateCTLContext", .signature = "\x00\x01\x0f\x11\x85\x61\x0f\x11\x85\x61" } },
    .{ "CertCreateCTLContext", MethodRecord{ .library = "CRYPT32", .import = "CertCreateCTLContext", .signature = "\x00\x03\x0f\x11\x85\x61\x09\x0f\x05\x09" } },
    .{ "CertFreeCTLContext", MethodRecord{ .library = "CRYPT32", .import = "CertFreeCTLContext", .signature = "\x00\x01\x11\x59\x0f\x11\x85\x61" } },
    .{ "CertSetCTLContextProperty", MethodRecord{ .library = "CRYPT32", .import = "CertSetCTLContextProperty", .signature = "\x00\x04\x11\x59\x0f\x11\x85\x61\x09\x09\x0f\x01" } },
    .{ "CertGetCTLContextProperty", MethodRecord{ .library = "CRYPT32", .import = "CertGetCTLContextProperty", .signature = "\x00\x04\x11\x59\x0f\x11\x85\x61\x09\x0f\x01\x0f\x09" } },
    .{ "CertEnumCTLContextProperties", MethodRecord{ .library = "CRYPT32", .import = "CertEnumCTLContextProperties", .signature = "\x00\x02\x09\x0f\x11\x85\x61\x09" } },
    .{ "CertEnumCTLsInStore", MethodRecord{ .library = "CRYPT32", .import = "CertEnumCTLsInStore", .signature = "\x00\x02\x0f\x11\x85\x61\x11\x85\x3d\x0f\x11\x85\x61" } },
    .{ "CertFindSubjectInCTL", MethodRecord{ .library = "CRYPT32", .import = "CertFindSubjectInCTL", .signature = "\x00\x05\x0f\x11\x85\x55\x09\x09\x0f\x01\x0f\x11\x85\x61\x09" } },
    .{ "CertFindCTLInStore", MethodRecord{ .library = "CRYPT32", .import = "CertFindCTLInStore", .signature = "\x00\x06\x0f\x11\x85\x61\x11\x85\x3d\x09\x09\x11\x85\x65\x0f\x01\x0f\x11\x85\x61" } },
    .{ "CertAddEncodedCTLToStore", MethodRecord{ .library = "CRYPT32", .import = "CertAddEncodedCTLToStore", .signature = "\x00\x06\x11\x59\x11\x85\x3d\x11\x85\x01\x0f\x05\x09\x09\x0f\x0f\x11\x85\x61" } },
    .{ "CertAddCTLContextToStore", MethodRecord{ .library = "CRYPT32", .import = "CertAddCTLContextToStore", .signature = "\x00\x04\x11\x59\x11\x85\x3d\x0f\x11\x85\x61\x09\x0f\x0f\x11\x85\x61" } },
    .{ "CertSerializeCTLStoreElement", MethodRecord{ .library = "CRYPT32", .import = "CertSerializeCTLStoreElement", .signature = "\x00\x04\x11\x59\x0f\x11\x85\x61\x09\x0f\x05\x0f\x09" } },
    .{ "CertDeleteCTLFromStore", MethodRecord{ .library = "CRYPT32", .import = "CertDeleteCTLFromStore", .signature = "\x00\x01\x11\x59\x0f\x11\x85\x61" } },
    .{ "CertAddCertificateLinkToStore", MethodRecord{ .library = "CRYPT32", .import = "CertAddCertificateLinkToStore", .signature = "\x00\x04\x11\x59\x11\x85\x3d\x0f\x11\x7d\x09\x0f\x0f\x11\x7d" } },
    .{ "CertAddCRLLinkToStore", MethodRecord{ .library = "CRYPT32", .import = "CertAddCRLLinkToStore", .signature = "\x00\x04\x11\x59\x11\x85\x3d\x0f\x11\x85\x59\x09\x0f\x0f\x11\x85\x59" } },
    .{ "CertAddCTLLinkToStore", MethodRecord{ .library = "CRYPT32", .import = "CertAddCTLLinkToStore", .signature = "\x00\x04\x11\x59\x11\x85\x3d\x0f\x11\x85\x61\x09\x0f\x0f\x11\x85\x61" } },
    .{ "CertAddStoreToCollection", MethodRecord{ .library = "CRYPT32", .import = "CertAddStoreToCollection", .signature = "\x00\x04\x11\x59\x11\x85\x3d\x11\x85\x3d\x09\x09" } },
    .{ "CertRemoveStoreFromCollection", MethodRecord{ .library = "CRYPT32", .import = "CertRemoveStoreFromCollection", .signature = "\x00\x02\x01\x11\x85\x3d\x11\x85\x3d" } },
    .{ "CertControlStore", MethodRecord{ .library = "CRYPT32", .import = "CertControlStore", .signature = "\x00\x04\x11\x59\x11\x85\x3d\x11\x85\x69\x09\x0f\x01" } },
    .{ "CertSetStoreProperty", MethodRecord{ .library = "CRYPT32", .import = "CertSetStoreProperty", .signature = "\x00\x04\x11\x59\x11\x85\x3d\x09\x09\x0f\x01" } },
    .{ "CertGetStoreProperty", MethodRecord{ .library = "CRYPT32", .import = "CertGetStoreProperty", .signature = "\x00\x04\x11\x59\x11\x85\x3d\x09\x0f\x01\x0f\x09" } },
    .{ "CertCreateContext", MethodRecord{ .library = "CRYPT32", .import = "CertCreateContext", .signature = "\x00\x06\x0f\x01\x09\x09\x0f\x05\x09\x09\x0f\x11\x85\x6d" } },
    .{ "CertRegisterSystemStore", MethodRecord{ .library = "CRYPT32", .import = "CertRegisterSystemStore", .signature = "\x00\x04\x11\x59\x0f\x01\x09\x0f\x11\x85\x71\x0f\x01" } },
    .{ "CertRegisterPhysicalStore", MethodRecord{ .library = "CRYPT32", .import = "CertRegisterPhysicalStore", .signature = "\x00\x05\x11\x59\x0f\x01\x09\x11\x05\x0f\x11\x85\x75\x0f\x01" } },
    .{ "CertUnregisterSystemStore", MethodRecord{ .library = "CRYPT32", .import = "CertUnregisterSystemStore", .signature = "\x00\x02\x11\x59\x0f\x01\x09" } },
    .{ "CertUnregisterPhysicalStore", MethodRecord{ .library = "CRYPT32", .import = "CertUnregisterPhysicalStore", .signature = "\x00\x03\x11\x59\x0f\x01\x09\x11\x05" } },
    .{ "CertEnumSystemStoreLocation", MethodRecord{ .library = "CRYPT32", .import = "CertEnumSystemStoreLocation", .signature = "\x00\x03\x11\x59\x09\x0f\x01\x12\x85\x79" } },
    .{ "CertEnumSystemStore", MethodRecord{ .library = "CRYPT32", .import = "CertEnumSystemStore", .signature = "\x00\x04\x11\x59\x09\x0f\x01\x0f\x01\x12\x85\x7d" } },
    .{ "CertEnumPhysicalStore", MethodRecord{ .library = "CRYPT32", .import = "CertEnumPhysicalStore", .signature = "\x00\x04\x11\x59\x0f\x01\x09\x0f\x01\x12\x85\x81" } },
    .{ "CertGetEnhancedKeyUsage", MethodRecord{ .library = "CRYPT32", .import = "CertGetEnhancedKeyUsage", .signature = "\x00\x04\x11\x59\x0f\x11\x7d\x09\x0f\x11\x85\x85\x0f\x09" } },
    .{ "CertSetEnhancedKeyUsage", MethodRecord{ .library = "CRYPT32", .import = "CertSetEnhancedKeyUsage", .signature = "\x00\x02\x11\x59\x0f\x11\x7d\x0f\x11\x85\x85" } },
    .{ "CertAddEnhancedKeyUsageIdentifier", MethodRecord{ .library = "CRYPT32", .import = "CertAddEnhancedKeyUsageIdentifier", .signature = "\x00\x02\x11\x59\x0f\x11\x7d\x11\x3d" } },
    .{ "CertRemoveEnhancedKeyUsageIdentifier", MethodRecord{ .library = "CRYPT32", .import = "CertRemoveEnhancedKeyUsageIdentifier", .signature = "\x00\x02\x11\x59\x0f\x11\x7d\x11\x3d" } },
    .{ "CertGetValidUsages", MethodRecord{ .library = "CRYPT32", .import = "CertGetValidUsages", .signature = "\x00\x05\x11\x59\x09\x0f\x0f\x11\x7d\x0f\x08\x0f\x11\x3d\x0f\x09" } },
    .{ "CryptMsgGetAndVerifySigner", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgGetAndVerifySigner", .signature = "\x00\x06\x11\x59\x0f\x01\x09\x0f\x11\x85\x3d\x09\x0f\x0f\x11\x7d\x0f\x09" } },
    .{ "CryptMsgSignCTL", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgSignCTL", .signature = "\x00\x07\x11\x59\x09\x0f\x05\x09\x0f\x11\x85\x89\x09\x0f\x05\x0f\x09" } },
    .{ "CryptMsgEncodeAndSignCTL", MethodRecord{ .library = "CRYPT32", .import = "CryptMsgEncodeAndSignCTL", .signature = "\x00\x06\x11\x59\x09\x0f\x11\x85\x8d\x0f\x11\x85\x89\x09\x0f\x05\x0f\x09" } },
    .{ "CertFindSubjectInSortedCTL", MethodRecord{ .library = "CRYPT32", .import = "CertFindSubjectInSortedCTL", .signature = "\x00\x05\x11\x59\x0f\x11\x85\x91\x0f\x11\x85\x61\x09\x0f\x01\x0f\x11\x85\x91" } },
    .{ "CertEnumSubjectInSortedCTL", MethodRecord{ .library = "CRYPT32", .import = "CertEnumSubjectInSortedCTL", .signature = "\x00\x04\x11\x59\x0f\x11\x85\x61\x0f\x0f\x01\x0f\x11\x85\x91\x0f\x11\x85\x91" } },
    .{ "CertVerifyCTLUsage", MethodRecord{ .library = "CRYPT32", .import = "CertVerifyCTLUsage", .signature = "\x00\x07\x11\x59\x09\x09\x0f\x01\x0f\x11\x85\x85\x09\x0f\x11\x85\x95\x0f\x11\x85\x99" } },
    .{ "CertVerifyRevocation", MethodRecord{ .library = "CRYPT32", .import = "CertVerifyRevocation", .signature = "\x00\x07\x11\x59\x09\x09\x09\x0f\x0f\x01\x09\x0f\x11\x85\x9d\x0f\x11\x85\xa1" } },
    .{ "CertCompareIntegerBlob", MethodRecord{ .library = "CRYPT32", .import = "CertCompareIntegerBlob", .signature = "\x00\x02\x11\x59\x0f\x11\x85\x91\x0f\x11\x85\x91" } },
    .{ "CertCompareCertificate", MethodRecord{ .library = "CRYPT32", .import = "CertCompareCertificate", .signature = "\x00\x03\x11\x59\x11\x85\x01\x0f\x11\x85\x35\x0f\x11\x85\x35" } },
    .{ "CertCompareCertificateName", MethodRecord{ .library = "CRYPT32", .import = "CertCompareCertificateName", .signature = "\x00\x03\x11\x59\x11\x85\x01\x0f\x11\x85\x91\x0f\x11\x85\x91" } },
    .{ "CertIsRDNAttrsInCertificateName", MethodRecord{ .library = "CRYPT32", .import = "CertIsRDNAttrsInCertificateName", .signature = "\x00\x04\x11\x59\x11\x85\x01\x09\x0f\x11\x85\x91\x0f\x11\x85\xa5" } },
    .{ "CertComparePublicKeyInfo", MethodRecord{ .library = "CRYPT32", .import = "CertComparePublicKeyInfo", .signature = "\x00\x03\x11\x59\x11\x85\x01\x0f\x11\x85\xa9\x0f\x11\x85\xa9" } },
    .{ "CertGetPublicKeyLength", MethodRecord{ .library = "CRYPT32", .import = "CertGetPublicKeyLength", .signature = "\x00\x02\x09\x11\x85\x01\x0f\x11\x85\xa9" } },
    .{ "CryptVerifyCertificateSignature", MethodRecord{ .library = "CRYPT32", .import = "CryptVerifyCertificateSignature", .signature = "\x00\x05\x11\x59\x11\x85\x31\x11\x85\x01\x0f\x05\x09\x0f\x11\x85\xa9" } },
    .{ "CryptVerifyCertificateSignatureEx", MethodRecord{ .library = "CRYPT32", .import = "CryptVerifyCertificateSignatureEx", .signature = "\x00\x08\x11\x59\x11\x85\x31\x11\x85\x01\x09\x0f\x01\x09\x0f\x01\x11\x85\xad\x0f\x01" } },
    .{ "CertIsStrongHashToSign", MethodRecord{ .library = "CRYPT32", .import = "CertIsStrongHashToSign", .signature = "\x00\x03\x11\x59\x0f\x11\x85\xb1\x11\x05\x0f\x11\x7d" } },
    .{ "CryptHashToBeSigned", MethodRecord{ .library = "CRYPT32", .import = "CryptHashToBeSigned", .signature = "\x00\x06\x11\x59\x11\x85\x31\x11\x85\x01\x0f\x05\x09\x0f\x05\x0f\x09" } },
    .{ "CryptHashCertificate", MethodRecord{ .library = "CRYPT32", .import = "CryptHashCertificate", .signature = "\x00\x07\x11\x59\x11\x85\x31\x11\x80\xe5\x09\x0f\x05\x09\x0f\x05\x0f\x09" } },
    .{ "CryptHashCertificate2", MethodRecord{ .library = "CRYPT32", .import = "CryptHashCertificate2", .signature = "\x00\x07\x11\x59\x11\x05\x09\x0f\x01\x0f\x05\x09\x0f\x05\x0f\x09" } },
    .{ "CryptSignCertificate", MethodRecord{ .library = "CRYPT32", .import = "CryptSignCertificate", .signature = "\x00\x09\x11\x59\x11\x85\xb5\x09\x11\x85\x01\x0f\x05\x09\x0f\x11\x85\xb9\x0f\x01\x0f\x05\x0f\x09" } },
    .{ "CryptSignAndEncodeCertificate", MethodRecord{ .library = "CRYPT32", .import = "CryptSignAndEncodeCertificate", .signature = "\x00\x09\x11\x59\x11\x85\xb5\x11\x84\xf1\x11\x85\x01\x11\x3d\x0f\x01\x0f\x11\x85\xb9\x0f\x01\x0f\x05\x0f\x09" } },
    .{ "CertVerifyTimeValidity", MethodRecord{ .library = "CRYPT32", .import = "CertVerifyTimeValidity", .signature = "\x00\x02\x08\x0f\x11\x80\x9d\x0f\x11\x85\x35" } },
    .{ "CertVerifyCRLTimeValidity", MethodRecord{ .library = "CRYPT32", .import = "CertVerifyCRLTimeValidity", .signature = "\x00\x02\x08\x0f\x11\x80\x9d\x0f\x11\x85\xbd" } },
    .{ "CertVerifyValidityNesting", MethodRecord{ .library = "CRYPT32", .import = "CertVerifyValidityNesting", .signature = "\x00\x02\x11\x59\x0f\x11\x85\x35\x0f\x11\x85\x35" } },
    .{ "CertVerifyCRLRevocation", MethodRecord{ .library = "CRYPT32", .import = "CertVerifyCRLRevocation", .signature = "\x00\x04\x11\x59\x11\x85\x01\x0f\x11\x85\x35\x09\x0f\x0f\x11\x85\xbd" } },
    .{ "CertAlgIdToOID", MethodRecord{ .library = "CRYPT32", .import = "CertAlgIdToOID", .signature = "\x00\x01\x11\x3d\x09" } },
    .{ "CertOIDToAlgId", MethodRecord{ .library = "CRYPT32", .import = "CertOIDToAlgId", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "CertFindExtension", MethodRecord{ .library = "CRYPT32", .import = "CertFindExtension", .signature = "\x00\x03\x0f\x11\x85\xc1\x11\x3d\x09\x0f\x11\x85\xc1" } },
    .{ "CertFindAttribute", MethodRecord{ .library = "CRYPT32", .import = "CertFindAttribute", .signature = "\x00\x03\x0f\x11\x85\x51\x11\x3d\x09\x0f\x11\x85\x51" } },
    .{ "CertFindRDNAttr", MethodRecord{ .library = "CRYPT32", .import = "CertFindRDNAttr", .signature = "\x00\x02\x0f\x11\x85\xc5\x11\x3d\x0f\x11\x85\xc9" } },
    .{ "CertGetIntendedKeyUsage", MethodRecord{ .library = "CRYPT32", .import = "CertGetIntendedKeyUsage", .signature = "\x00\x04\x11\x59\x11\x85\x01\x0f\x11\x85\x35\x0f\x05\x09" } },
    .{ "CryptInstallDefaultContext", MethodRecord{ .library = "CRYPT32", .import = "CryptInstallDefaultContext", .signature = "\x00\x06\x11\x59\x19\x11\x85\xcd\x0f\x01\x11\x85\xd1\x0f\x01\x0f\x0f\x01" } },
    .{ "CryptUninstallDefaultContext", MethodRecord{ .library = "CRYPT32", .import = "CryptUninstallDefaultContext", .signature = "\x00\x03\x11\x59\x0f\x01\x09\x0f\x01" } },
    .{ "CryptExportPublicKeyInfo", MethodRecord{ .library = "CRYPT32", .import = "CryptExportPublicKeyInfo", .signature = "\x00\x05\x11\x59\x11\x85\xb5\x09\x11\x85\x01\x0f\x11\x85\xa9\x0f\x09" } },
    .{ "CryptExportPublicKeyInfoEx", MethodRecord{ .library = "CRYPT32", .import = "CryptExportPublicKeyInfoEx", .signature = "\x00\x08\x11\x59\x11\x85\xb5\x09\x11\x85\x01\x11\x3d\x09\x0f\x01\x0f\x11\x85\xa9\x0f\x09" } },
    .{ "CryptExportPublicKeyInfoFromBCryptKeyHandle", MethodRecord{ .library = "CRYPT32", .import = "CryptExportPublicKeyInfoFromBCryptKeyHandle", .signature = "\x00\x07\x11\x59\x11\x84\x89\x11\x85\x01\x11\x3d\x09\x0f\x01\x0f\x11\x85\xa9\x0f\x09" } },
    .{ "CryptImportPublicKeyInfo", MethodRecord{ .library = "CRYPT32", .import = "CryptImportPublicKeyInfo", .signature = "\x00\x04\x11\x59\x19\x11\x85\x01\x0f\x11\x85\xa9\x0f\x19" } },
    .{ "CryptImportPublicKeyInfoEx", MethodRecord{ .library = "CRYPT32", .import = "CryptImportPublicKeyInfoEx", .signature = "\x00\x07\x11\x59\x19\x11\x85\x01\x0f\x11\x85\xa9\x11\x80\xe5\x09\x0f\x01\x0f\x19" } },
    .{ "CryptImportPublicKeyInfoEx2", MethodRecord{ .library = "CRYPT32", .import = "CryptImportPublicKeyInfoEx2", .signature = "\x00\x05\x11\x59\x11\x85\x01\x0f\x11\x85\xa9\x11\x85\xd5\x0f\x01\x0f\x11\x84\x89" } },
    .{ "CryptAcquireCertificatePrivateKey", MethodRecord{ .library = "CRYPT32", .import = "CryptAcquireCertificatePrivateKey", .signature = "\x00\x06\x11\x59\x0f\x11\x7d\x11\x85\xd9\x0f\x01\x0f\x11\x85\xb5\x0f\x11\x84\xf1\x0f\x11\x59" } },
    .{ "CryptFindCertificateKeyProvInfo", MethodRecord{ .library = "CRYPT32", .import = "CryptFindCertificateKeyProvInfo", .signature = "\x00\x03\x11\x59\x0f\x11\x7d\x11\x85\xdd\x0f\x01" } },
    .{ "CryptImportPKCS8", MethodRecord{ .library = "CRYPT32", .import = "CryptImportPKCS8", .signature = "\x00\x04\x11\x59\x11\x85\xe1\x11\x84\x61\x0f\x19\x0f\x01" } },
    .{ "CryptExportPKCS8", MethodRecord{ .library = "CRYPT32", .import = "CryptExportPKCS8", .signature = "\x00\x07\x11\x59\x19\x09\x11\x3d\x09\x0f\x01\x0f\x05\x0f\x09" } },
    .{ "CryptHashPublicKeyInfo", MethodRecord{ .library = "CRYPT32", .import = "CryptHashPublicKeyInfo", .signature = "\x00\x07\x11\x59\x11\x85\x31\x11\x80\xe5\x09\x11\x85\x01\x0f\x11\x85\xa9\x0f\x05\x0f\x09" } },
    .{ "CertRDNValueToStrA", MethodRecord{ .library = "CRYPT32", .import = "CertRDNValueToStrA", .signature = "\x00\x04\x09\x09\x0f\x11\x85\x91\x11\x3d\x09" } },
    .{ "CertRDNValueToStrW", MethodRecord{ .library = "CRYPT32", .import = "CertRDNValueToStrW", .signature = "\x00\x04\x09\x09\x0f\x11\x85\x91\x11\x05\x09" } },
    .{ "CertNameToStrA", MethodRecord{ .library = "CRYPT32", .import = "CertNameToStrA", .signature = "\x00\x05\x09\x11\x85\x01\x0f\x11\x85\x91\x11\x85\xe5\x11\x3d\x09" } },
    .{ "CertNameToStrW", MethodRecord{ .library = "CRYPT32", .import = "CertNameToStrW", .signature = "\x00\x05\x09\x11\x85\x01\x0f\x11\x85\x91\x11\x85\xe5\x11\x05\x09" } },
    .{ "CertStrToNameA", MethodRecord{ .library = "CRYPT32", .import = "CertStrToNameA", .signature = "\x00\x07\x11\x59\x11\x85\x01\x11\x3d\x11\x85\xe5\x0f\x01\x0f\x05\x0f\x09\x0f\x11\x3d" } },
    .{ "CertStrToNameW", MethodRecord{ .library = "CRYPT32", .import = "CertStrToNameW", .signature = "\x00\x07\x11\x59\x11\x85\x01\x11\x05\x11\x85\xe5\x0f\x01\x0f\x05\x0f\x09\x0f\x11\x05" } },
    .{ "CertGetNameStringA", MethodRecord{ .library = "CRYPT32", .import = "CertGetNameStringA", .signature = "\x00\x06\x09\x0f\x11\x7d\x09\x09\x0f\x01\x11\x3d\x09" } },
    .{ "CertGetNameStringW", MethodRecord{ .library = "CRYPT32", .import = "CertGetNameStringW", .signature = "\x00\x06\x09\x0f\x11\x7d\x09\x09\x0f\x01\x11\x05\x09" } },
    .{ "CryptSignMessage", MethodRecord{ .library = "CRYPT32", .import = "CryptSignMessage", .signature = "\x00\x07\x11\x59\x0f\x11\x85\xe9\x11\x59\x09\x0f\x0f\x05\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "CryptVerifyMessageSignature", MethodRecord{ .library = "CRYPT32", .import = "CryptVerifyMessageSignature", .signature = "\x00\x07\x11\x59\x0f\x11\x85\xed\x09\x0f\x05\x09\x0f\x05\x0f\x09\x0f\x0f\x11\x7d" } },
    .{ "CryptGetMessageSignerCount", MethodRecord{ .library = "CRYPT32", .import = "CryptGetMessageSignerCount", .signature = "\x00\x03\x08\x09\x0f\x05\x09" } },
    .{ "CryptGetMessageCertificates", MethodRecord{ .library = "CRYPT32", .import = "CryptGetMessageCertificates", .signature = "\x00\x05\x11\x85\x3d\x09\x11\x85\x31\x09\x0f\x05\x09" } },
    .{ "CryptVerifyDetachedMessageSignature", MethodRecord{ .library = "CRYPT32", .import = "CryptVerifyDetachedMessageSignature", .signature = "\x00\x08\x11\x59\x0f\x11\x85\xed\x09\x0f\x05\x09\x09\x0f\x0f\x05\x0f\x09\x0f\x0f\x11\x7d" } },
    .{ "CryptEncryptMessage", MethodRecord{ .library = "CRYPT32", .import = "CryptEncryptMessage", .signature = "\x00\x07\x11\x59\x0f\x11\x85\xf1\x09\x0f\x0f\x11\x7d\x0f\x05\x09\x0f\x05\x0f\x09" } },
    .{ "CryptDecryptMessage", MethodRecord{ .library = "CRYPT32", .import = "CryptDecryptMessage", .signature = "\x00\x06\x11\x59\x0f\x11\x85\xf5\x0f\x05\x09\x0f\x05\x0f\x09\x0f\x0f\x11\x7d" } },
    .{ "CryptSignAndEncryptMessage", MethodRecord{ .library = "CRYPT32", .import = "CryptSignAndEncryptMessage", .signature = "\x00\x08\x11\x59\x0f\x11\x85\xe9\x0f\x11\x85\xf1\x09\x0f\x0f\x11\x7d\x0f\x05\x09\x0f\x05\x0f\x09" } },
    .{ "CryptDecryptAndVerifyMessageSignature", MethodRecord{ .library = "CRYPT32", .import = "CryptDecryptAndVerifyMessageSignature", .signature = "\x00\x09\x11\x59\x0f\x11\x85\xf5\x0f\x11\x85\xed\x09\x0f\x05\x09\x0f\x05\x0f\x09\x0f\x0f\x11\x7d\x0f\x0f\x11\x7d" } },
    .{ "CryptDecodeMessage", MethodRecord{ .library = "CRYPT32", .import = "CryptDecodeMessage", .signature = "\x00\x0d\x11\x59\x09\x0f\x11\x85\xf5\x0f\x11\x85\xed\x09\x0f\x05\x09\x09\x0f\x09\x0f\x09\x0f\x05\x0f\x09\x0f\x0f\x11\x7d\x0f\x0f\x11\x7d" } },
    .{ "CryptHashMessage", MethodRecord{ .library = "CRYPT32", .import = "CryptHashMessage", .signature = "\x00\x09\x11\x59\x0f\x11\x85\xf9\x11\x59\x09\x0f\x0f\x05\x0f\x09\x0f\x05\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "CryptVerifyMessageHash", MethodRecord{ .library = "CRYPT32", .import = "CryptVerifyMessageHash", .signature = "\x00\x07\x11\x59\x0f\x11\x85\xf9\x0f\x05\x09\x0f\x05\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "CryptVerifyDetachedMessageHash", MethodRecord{ .library = "CRYPT32", .import = "CryptVerifyDetachedMessageHash", .signature = "\x00\x08\x11\x59\x0f\x11\x85\xf9\x0f\x05\x09\x09\x0f\x0f\x05\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "CryptSignMessageWithKey", MethodRecord{ .library = "CRYPT32", .import = "CryptSignMessageWithKey", .signature = "\x00\x05\x11\x59\x0f\x11\x85\xfd\x0f\x05\x09\x0f\x05\x0f\x09" } },
    .{ "CryptVerifyMessageSignatureWithKey", MethodRecord{ .library = "CRYPT32", .import = "CryptVerifyMessageSignatureWithKey", .signature = "\x00\x06\x11\x59\x0f\x11\x86\x01\x0f\x11\x85\xa9\x0f\x05\x09\x0f\x05\x0f\x09" } },
    .{ "CertOpenSystemStoreA", MethodRecord{ .library = "CRYPT32", .import = "CertOpenSystemStoreA", .signature = "\x00\x02\x11\x85\x3d\x11\x85\x31\x11\x3d" } },
    .{ "CertOpenSystemStoreW", MethodRecord{ .library = "CRYPT32", .import = "CertOpenSystemStoreW", .signature = "\x00\x02\x11\x85\x3d\x11\x85\x31\x11\x05" } },
    .{ "CertAddEncodedCertificateToSystemStoreA", MethodRecord{ .library = "CRYPT32", .import = "CertAddEncodedCertificateToSystemStoreA", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x05\x09" } },
    .{ "CertAddEncodedCertificateToSystemStoreW", MethodRecord{ .library = "CRYPT32", .import = "CertAddEncodedCertificateToSystemStoreW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x05\x09" } },
    .{ "FindCertsByIssuer", MethodRecord{ .library = "WINTRUST", .import = "FindCertsByIssuer", .signature = "\x00\x07\x11\x79\x0f\x11\x86\x05\x0f\x09\x0f\x09\x0f\x05\x09\x11\x05\x09" } },
    .{ "CryptQueryObject", MethodRecord{ .library = "CRYPT32", .import = "CryptQueryObject", .signature = "\x00\x0b\x11\x59\x11\x86\x09\x0f\x01\x11\x86\x0d\x11\x86\x11\x09\x0f\x11\x85\x01\x0f\x11\x86\x15\x0f\x11\x86\x19\x0f\x11\x85\x3d\x0f\x0f\x01\x0f\x0f\x01" } },
    .{ "CryptMemAlloc", MethodRecord{ .library = "CRYPT32", .import = "CryptMemAlloc", .signature = "\x00\x01\x0f\x01\x09" } },
    .{ "CryptMemRealloc", MethodRecord{ .library = "CRYPT32", .import = "CryptMemRealloc", .signature = "\x00\x02\x0f\x01\x0f\x01\x09" } },
    .{ "CryptMemFree", MethodRecord{ .library = "CRYPT32", .import = "CryptMemFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "CryptCreateAsyncHandle", MethodRecord{ .library = "CRYPT32", .import = "CryptCreateAsyncHandle", .signature = "\x00\x02\x11\x59\x09\x0f\x11\x86\x1d" } },
    .{ "CryptSetAsyncParam", MethodRecord{ .library = "CRYPT32", .import = "CryptSetAsyncParam", .signature = "\x00\x04\x11\x59\x11\x86\x1d\x11\x3d\x0f\x01\x12\x86\x21" } },
    .{ "CryptGetAsyncParam", MethodRecord{ .library = "CRYPT32", .import = "CryptGetAsyncParam", .signature = "\x00\x04\x11\x59\x11\x86\x1d\x11\x3d\x0f\x0f\x01\x0f\x12\x86\x21" } },
    .{ "CryptCloseAsyncHandle", MethodRecord{ .library = "CRYPT32", .import = "CryptCloseAsyncHandle", .signature = "\x00\x01\x11\x59\x11\x86\x1d" } },
    .{ "CryptRetrieveObjectByUrlA", MethodRecord{ .library = "CRYPTNET", .import = "CryptRetrieveObjectByUrlA", .signature = "\x00\x09\x11\x59\x11\x3d\x11\x3d\x09\x09\x0f\x0f\x01\x11\x86\x1d\x0f\x11\x86\x25\x0f\x01\x0f\x11\x86\x29" } },
    .{ "CryptRetrieveObjectByUrlW", MethodRecord{ .library = "CRYPTNET", .import = "CryptRetrieveObjectByUrlW", .signature = "\x00\x09\x11\x59\x11\x05\x11\x3d\x09\x09\x0f\x0f\x01\x11\x86\x1d\x0f\x11\x86\x25\x0f\x01\x0f\x11\x86\x29" } },
    .{ "CryptInstallCancelRetrieval", MethodRecord{ .library = "CRYPTNET", .import = "CryptInstallCancelRetrieval", .signature = "\x00\x04\x11\x59\x12\x86\x2d\x0f\x01\x09\x0f\x01" } },
    .{ "CryptUninstallCancelRetrieval", MethodRecord{ .library = "CRYPTNET", .import = "CryptUninstallCancelRetrieval", .signature = "\x00\x02\x11\x59\x09\x0f\x01" } },
    .{ "CryptGetObjectUrl", MethodRecord{ .library = "CRYPTNET", .import = "CryptGetObjectUrl", .signature = "\x00\x08\x11\x59\x11\x3d\x0f\x01\x11\x86\x31\x0f\x11\x86\x35\x0f\x09\x0f\x11\x86\x39\x0f\x09\x0f\x01" } },
    .{ "CertCreateSelfSignCertificate", MethodRecord{ .library = "CRYPT32", .import = "CertCreateSelfSignCertificate", .signature = "\x00\x08\x0f\x11\x7d\x11\x85\xb5\x0f\x11\x85\x91\x11\x86\x3d\x0f\x11\x86\x41\x0f\x11\x85\xb9\x0f\x11\x86\x45\x0f\x11\x86\x45\x0f\x11\x86\x49" } },
    .{ "CryptGetKeyIdentifierProperty", MethodRecord{ .library = "CRYPT32", .import = "CryptGetKeyIdentifierProperty", .signature = "\x00\x07\x11\x59\x0f\x11\x85\x91\x09\x09\x11\x05\x0f\x01\x0f\x01\x0f\x09" } },
    .{ "CryptSetKeyIdentifierProperty", MethodRecord{ .library = "CRYPT32", .import = "CryptSetKeyIdentifierProperty", .signature = "\x00\x06\x11\x59\x0f\x11\x85\x91\x09\x09\x11\x05\x0f\x01\x0f\x01" } },
    .{ "CryptEnumKeyIdentifierProperties", MethodRecord{ .library = "CRYPT32", .import = "CryptEnumKeyIdentifierProperties", .signature = "\x00\x07\x11\x59\x0f\x11\x85\x91\x09\x09\x11\x05\x0f\x01\x0f\x01\x12\x86\x4d" } },
    .{ "CryptCreateKeyIdentifierFromCSP", MethodRecord{ .library = "CRYPT32", .import = "CryptCreateKeyIdentifierFromCSP", .signature = "\x00\x08\x11\x59\x11\x85\x01\x11\x3d\x0f\x11\x86\x51\x09\x09\x0f\x01\x0f\x05\x0f\x09" } },
    .{ "CertCreateCertificateChainEngine", MethodRecord{ .library = "CRYPT32", .import = "CertCreateCertificateChainEngine", .signature = "\x00\x02\x11\x59\x0f\x11\x86\x55\x0f\x11\x86\x59" } },
    .{ "CertFreeCertificateChainEngine", MethodRecord{ .library = "CRYPT32", .import = "CertFreeCertificateChainEngine", .signature = "\x00\x01\x01\x11\x86\x59" } },
    .{ "CertResyncCertificateChainEngine", MethodRecord{ .library = "CRYPT32", .import = "CertResyncCertificateChainEngine", .signature = "\x00\x01\x11\x59\x11\x86\x59" } },
    .{ "CertGetCertificateChain", MethodRecord{ .library = "CRYPT32", .import = "CertGetCertificateChain", .signature = "\x00\x08\x11\x59\x11\x86\x59\x0f\x11\x7d\x0f\x11\x80\x9d\x11\x85\x3d\x0f\x11\x86\x5d\x09\x0f\x01\x0f\x0f\x11\x86\x61" } },
    .{ "CertFreeCertificateChain", MethodRecord{ .library = "CRYPT32", .import = "CertFreeCertificateChain", .signature = "\x00\x01\x01\x0f\x11\x86\x61" } },
    .{ "CertDuplicateCertificateChain", MethodRecord{ .library = "CRYPT32", .import = "CertDuplicateCertificateChain", .signature = "\x00\x01\x0f\x11\x86\x61\x0f\x11\x86\x61" } },
    .{ "CertFindChainInStore", MethodRecord{ .library = "CRYPT32", .import = "CertFindChainInStore", .signature = "\x00\x06\x0f\x11\x86\x61\x11\x85\x3d\x11\x85\x01\x11\x86\x65\x09\x0f\x01\x0f\x11\x86\x61" } },
    .{ "CertVerifyCertificateChainPolicy", MethodRecord{ .library = "CRYPT32", .import = "CertVerifyCertificateChainPolicy", .signature = "\x00\x04\x11\x59\x11\x3d\x0f\x11\x86\x61\x0f\x11\x86\x69\x0f\x11\x86\x6d" } },
    .{ "CryptStringToBinaryA", MethodRecord{ .library = "CRYPT32", .import = "CryptStringToBinaryA", .signature = "\x00\x07\x11\x59\x11\x3d\x09\x11\x86\x71\x0f\x05\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "CryptStringToBinaryW", MethodRecord{ .library = "CRYPT32", .import = "CryptStringToBinaryW", .signature = "\x00\x07\x11\x59\x11\x05\x09\x11\x86\x71\x0f\x05\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "CryptBinaryToStringA", MethodRecord{ .library = "CRYPT32", .import = "CryptBinaryToStringA", .signature = "\x00\x05\x11\x59\x0f\x05\x09\x11\x86\x71\x11\x3d\x0f\x09" } },
    .{ "CryptBinaryToStringW", MethodRecord{ .library = "CRYPT32", .import = "CryptBinaryToStringW", .signature = "\x00\x05\x11\x59\x0f\x05\x09\x11\x86\x71\x11\x05\x0f\x09" } },
    .{ "PFXImportCertStore", MethodRecord{ .library = "CRYPT32", .import = "PFXImportCertStore", .signature = "\x00\x03\x11\x85\x3d\x0f\x11\x85\x91\x11\x05\x11\x84\x61" } },
    .{ "PFXIsPFXBlob", MethodRecord{ .library = "CRYPT32", .import = "PFXIsPFXBlob", .signature = "\x00\x01\x11\x59\x0f\x11\x85\x91" } },
    .{ "PFXVerifyPassword", MethodRecord{ .library = "CRYPT32", .import = "PFXVerifyPassword", .signature = "\x00\x03\x11\x59\x0f\x11\x85\x91\x11\x05\x09" } },
    .{ "PFXExportCertStoreEx", MethodRecord{ .library = "CRYPT32", .import = "PFXExportCertStoreEx", .signature = "\x00\x05\x11\x59\x11\x85\x3d\x0f\x11\x85\x91\x11\x05\x0f\x01\x09" } },
    .{ "PFXExportCertStore", MethodRecord{ .library = "CRYPT32", .import = "PFXExportCertStore", .signature = "\x00\x04\x11\x59\x11\x85\x3d\x0f\x11\x85\x91\x11\x05\x09" } },
    .{ "CertOpenServerOcspResponse", MethodRecord{ .library = "CRYPT32", .import = "CertOpenServerOcspResponse", .signature = "\x00\x03\x0f\x01\x0f\x11\x86\x61\x09\x0f\x11\x86\x75" } },
    .{ "CertAddRefServerOcspResponse", MethodRecord{ .library = "CRYPT32", .import = "CertAddRefServerOcspResponse", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "CertCloseServerOcspResponse", MethodRecord{ .library = "CRYPT32", .import = "CertCloseServerOcspResponse", .signature = "\x00\x02\x01\x0f\x01\x09" } },
    .{ "CertGetServerOcspResponseContext", MethodRecord{ .library = "CRYPT32", .import = "CertGetServerOcspResponseContext", .signature = "\x00\x03\x0f\x11\x86\x79\x0f\x01\x09\x0f\x01" } },
    .{ "CertAddRefServerOcspResponseContext", MethodRecord{ .library = "CRYPT32", .import = "CertAddRefServerOcspResponseContext", .signature = "\x00\x01\x01\x0f\x11\x86\x79" } },
    .{ "CertFreeServerOcspResponseContext", MethodRecord{ .library = "CRYPT32", .import = "CertFreeServerOcspResponseContext", .signature = "\x00\x01\x01\x0f\x11\x86\x79" } },
    .{ "CertRetrieveLogoOrBiometricInfo", MethodRecord{ .library = "CRYPT32", .import = "CertRetrieveLogoOrBiometricInfo", .signature = "\x00\x09\x11\x59\x0f\x11\x7d\x11\x3d\x09\x09\x09\x0f\x01\x0f\x0f\x05\x0f\x09\x0f\x11\x05" } },
    .{ "CertSelectCertificateChains", MethodRecord{ .library = "CRYPT32", .import = "CertSelectCertificateChains", .signature = "\x00\x08\x11\x59\x0f\x11\x0d\x09\x0f\x11\x86\x7d\x09\x0f\x11\x86\x81\x11\x85\x3d\x0f\x09\x0f\x0f\x0f\x11\x86\x61" } },
    .{ "CertFreeCertificateChainList", MethodRecord{ .library = "CRYPT32", .import = "CertFreeCertificateChainList", .signature = "\x00\x01\x01\x0f\x0f\x11\x86\x61" } },
    .{ "CryptRetrieveTimeStamp", MethodRecord{ .library = "CRYPT32", .import = "CryptRetrieveTimeStamp", .signature = "\x00\x0a\x11\x59\x11\x05\x09\x09\x11\x3d\x0f\x11\x86\x85\x0f\x05\x09\x0f\x0f\x11\x86\x89\x0f\x0f\x11\x7d\x0f\x11\x85\x3d" } },
    .{ "CryptVerifyTimeStampSignature", MethodRecord{ .library = "CRYPT32", .import = "CryptVerifyTimeStampSignature", .signature = "\x00\x08\x11\x59\x0f\x05\x09\x0f\x05\x09\x11\x85\x3d\x0f\x0f\x11\x86\x89\x0f\x0f\x11\x7d\x0f\x11\x85\x3d" } },
    .{ "CertIsWeakHash", MethodRecord{ .library = "CRYPT32", .import = "CertIsWeakHash", .signature = "\x00\x06\x11\x59\x09\x11\x05\x09\x0f\x11\x86\x61\x0f\x11\x80\x9d\x11\x05" } },
    .{ "CryptProtectData", MethodRecord{ .library = "CRYPT32", .import = "CryptProtectData", .signature = "\x00\x07\x11\x59\x0f\x11\x85\x91\x11\x05\x0f\x11\x85\x91\x0f\x01\x0f\x11\x86\x8d\x09\x0f\x11\x85\x91" } },
    .{ "CryptUnprotectData", MethodRecord{ .library = "CRYPT32", .import = "CryptUnprotectData", .signature = "\x00\x07\x11\x59\x0f\x11\x85\x91\x0f\x11\x05\x0f\x11\x85\x91\x0f\x01\x0f\x11\x86\x8d\x09\x0f\x11\x85\x91" } },
    .{ "CryptUpdateProtectedState", MethodRecord{ .library = "CRYPT32", .import = "CryptUpdateProtectedState", .signature = "\x00\x05\x11\x59\x11\x81\x15\x11\x05\x09\x0f\x09\x0f\x09" } },
    .{ "CryptProtectMemory", MethodRecord{ .library = "CRYPT32", .import = "CryptProtectMemory", .signature = "\x00\x03\x11\x59\x0f\x01\x09\x09" } },
    .{ "CryptUnprotectMemory", MethodRecord{ .library = "CRYPT32", .import = "CryptUnprotectMemory", .signature = "\x00\x03\x11\x59\x0f\x01\x09\x09" } },
    .{ "NCryptRegisterProtectionDescriptorName", MethodRecord{ .library = "ncrypt", .import = "NCryptRegisterProtectionDescriptorName", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x09" } },
    .{ "NCryptQueryProtectionDescriptorName", MethodRecord{ .library = "ncrypt", .import = "NCryptQueryProtectionDescriptorName", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x0f\x19\x09" } },
    .{ "NCryptCreateProtectionDescriptor", MethodRecord{ .library = "ncrypt", .import = "NCryptCreateProtectionDescriptor", .signature = "\x00\x03\x11\x79\x11\x05\x09\x0f\x11\x86\x91" } },
    .{ "NCryptCloseProtectionDescriptor", MethodRecord{ .library = "ncrypt", .import = "NCryptCloseProtectionDescriptor", .signature = "\x00\x01\x11\x79\x11\x86\x91" } },
    .{ "NCryptGetProtectionDescriptorInfo", MethodRecord{ .library = "ncrypt", .import = "NCryptGetProtectionDescriptorInfo", .signature = "\x00\x04\x11\x79\x11\x86\x91\x0f\x11\x86\x95\x09\x0f\x0f\x01" } },
    .{ "NCryptProtectSecret", MethodRecord{ .library = "ncrypt", .import = "NCryptProtectSecret", .signature = "\x00\x08\x11\x79\x11\x86\x91\x09\x0f\x05\x09\x0f\x11\x86\x95\x11\x25\x0f\x0f\x05\x0f\x09" } },
    .{ "NCryptUnprotectSecret", MethodRecord{ .library = "ncrypt", .import = "NCryptUnprotectSecret", .signature = "\x00\x08\x11\x79\x0f\x11\x86\x91\x11\x84\xe5\x0f\x05\x09\x0f\x11\x86\x95\x11\x25\x0f\x0f\x05\x0f\x09" } },
    .{ "NCryptStreamOpenToProtect", MethodRecord{ .library = "ncrypt", .import = "NCryptStreamOpenToProtect", .signature = "\x00\x05\x11\x79\x11\x86\x91\x09\x11\x25\x0f\x11\x86\x99\x0f\x11\x86\x9d" } },
    .{ "NCryptStreamOpenToUnprotect", MethodRecord{ .library = "ncrypt", .import = "NCryptStreamOpenToUnprotect", .signature = "\x00\x04\x11\x79\x0f\x11\x86\x99\x09\x11\x25\x0f\x11\x86\x9d" } },
    .{ "NCryptStreamOpenToUnprotectEx", MethodRecord{ .library = "ncrypt", .import = "NCryptStreamOpenToUnprotectEx", .signature = "\x00\x04\x11\x79\x0f\x11\x86\xa1\x09\x11\x25\x0f\x11\x86\x9d" } },
    .{ "NCryptStreamUpdate", MethodRecord{ .library = "ncrypt", .import = "NCryptStreamUpdate", .signature = "\x00\x04\x11\x79\x11\x86\x9d\x0f\x05\x19\x11\x59" } },
    .{ "NCryptStreamClose", MethodRecord{ .library = "ncrypt", .import = "NCryptStreamClose", .signature = "\x00\x01\x11\x79\x11\x86\x9d" } },
    .{ "SignError", MethodRecord{ .library = "Mssign32", .import = "SignError", .signature = "\x00\x00\x11\x79" } },
    .{ "SignerFreeSignerContext", MethodRecord{ .library = "Mssign32", .import = "SignerFreeSignerContext", .signature = "\x00\x01\x11\x79\x0f\x11\x86\xa5" } },
    .{ "SignerSign", MethodRecord{ .library = "Mssign32", .import = "SignerSign", .signature = "\x00\x07\x11\x79\x0f\x11\x86\xa9\x0f\x11\x86\xad\x0f\x11\x86\xb1\x0f\x11\x86\xb5\x11\x05\x0f\x11\x86\xb9\x0f\x01" } },
    .{ "SignerSignEx", MethodRecord{ .library = "Mssign32", .import = "SignerSignEx", .signature = "\x00\x09\x11\x79\x11\x86\xbd\x0f\x11\x86\xa9\x0f\x11\x86\xad\x0f\x11\x86\xb1\x0f\x11\x86\xb5\x11\x05\x0f\x11\x86\xb9\x0f\x01\x0f\x0f\x11\x86\xa5" } },
    .{ "SignerSignEx2", MethodRecord{ .library = "Mssign32", .import = "SignerSignEx2", .signature = "\x00\x0d\x11\x79\x11\x86\xbd\x0f\x11\x86\xa9\x0f\x11\x86\xad\x0f\x11\x86\xb1\x0f\x11\x86\xb5\x11\x86\xc1\x11\x3d\x11\x05\x0f\x11\x86\xb9\x0f\x01\x0f\x0f\x11\x86\xa5\x0f\x11\x85\xb1\x0f\x01" } },
    .{ "SignerSignEx3", MethodRecord{ .library = "Mssign32", .import = "SignerSignEx3", .signature = "\x00\x0e\x11\x79\x11\x86\xbd\x0f\x11\x86\xa9\x0f\x11\x86\xad\x0f\x11\x86\xb1\x0f\x11\x86\xb5\x11\x86\xc1\x11\x3d\x11\x05\x0f\x11\x86\xb9\x0f\x01\x0f\x0f\x11\x86\xa5\x0f\x11\x85\xb1\x0f\x11\x86\xc5\x0f\x01" } },
    .{ "SignerTimeStamp", MethodRecord{ .library = "Mssign32", .import = "SignerTimeStamp", .signature = "\x00\x04\x11\x79\x0f\x11\x86\xa9\x11\x05\x0f\x11\x86\xb9\x0f\x01" } },
    .{ "SignerTimeStampEx", MethodRecord{ .library = "Mssign32", .import = "SignerTimeStampEx", .signature = "\x00\x06\x11\x79\x09\x0f\x11\x86\xa9\x11\x05\x0f\x11\x86\xb9\x0f\x01\x0f\x0f\x11\x86\xa5" } },
    .{ "SignerTimeStampEx2", MethodRecord{ .library = "Mssign32", .import = "SignerTimeStampEx2", .signature = "\x00\x07\x11\x79\x11\x86\xc1\x0f\x11\x86\xa9\x11\x05\x11\x80\xe5\x0f\x11\x86\xb9\x0f\x01\x0f\x0f\x11\x86\xa5" } },
    .{ "SignerTimeStampEx3", MethodRecord{ .library = "Mssign32", .import = "SignerTimeStampEx3", .signature = "\x00\x0a\x11\x79\x11\x86\xc1\x09\x0f\x11\x86\xa9\x11\x05\x11\x05\x0f\x11\x86\xb9\x0f\x01\x0f\x0f\x11\x86\xa5\x0f\x11\x85\xb1\x0f\x01" } },
    .{ "CryptXmlClose", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlClose", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "CryptXmlGetTransforms", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlGetTransforms", .signature = "\x00\x01\x11\x79\x0f\x0f\x11\x86\xc9" } },
    .{ "CryptXmlOpenToEncode", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlOpenToEncode", .signature = "\x00\x07\x11\x79\x0f\x11\x86\xc9\x11\x86\xcd\x11\x05\x0f\x11\x86\xd1\x09\x0f\x11\x86\xd5\x0f\x0f\x01" } },
    .{ "CryptXmlOpenToDecode", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlOpenToDecode", .signature = "\x00\x06\x11\x79\x0f\x11\x86\xc9\x11\x86\xcd\x0f\x11\x86\xd1\x09\x0f\x11\x86\xd5\x0f\x0f\x01" } },
    .{ "CryptXmlAddObject", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlAddObject", .signature = "\x00\x06\x11\x79\x0f\x01\x09\x0f\x11\x86\xd1\x09\x0f\x11\x86\xd5\x0f\x0f\x11\x86\xd9" } },
    .{ "CryptXmlCreateReference", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlCreateReference", .signature = "\x00\x09\x11\x79\x0f\x01\x09\x11\x05\x11\x05\x11\x05\x0f\x11\x86\xdd\x09\x0f\x11\x86\xdd\x0f\x0f\x01" } },
    .{ "CryptXmlDigestReference", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlDigestReference", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\x86\xe1" } },
    .{ "CryptXmlSetHMACSecret", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlSetHMACSecret", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x05\x09" } },
    .{ "CryptXmlSign", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlSign", .signature = "\x00\x08\x11\x79\x0f\x01\x11\x85\xb5\x11\x84\xf1\x11\x86\xcd\x11\x86\xe5\x0f\x01\x0f\x11\x86\xdd\x0f\x11\x86\xdd" } },
    .{ "CryptXmlImportPublicKey", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlImportPublicKey", .signature = "\x00\x03\x11\x79\x11\x86\xcd\x0f\x11\x86\xe9\x0f\x11\x84\x89" } },
    .{ "CryptXmlVerifySignature", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlVerifySignature", .signature = "\x00\x03\x11\x79\x0f\x01\x11\x84\x89\x11\x86\xcd" } },
    .{ "CryptXmlGetDocContext", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlGetDocContext", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x0f\x11\x86\xed" } },
    .{ "CryptXmlGetSignature", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlGetSignature", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x0f\x11\x86\xf1" } },
    .{ "CryptXmlGetReference", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlGetReference", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x0f\x11\x86\xf5" } },
    .{ "CryptXmlGetStatus", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlGetStatus", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x11\x86\xf9" } },
    .{ "CryptXmlEncode", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlEncode", .signature = "\x00\x06\x11\x79\x0f\x01\x11\x86\xfd\x0f\x11\x86\xd1\x09\x0f\x01\x12\x87\x01" } },
    .{ "CryptXmlGetAlgorithmInfo", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlGetAlgorithmInfo", .signature = "\x00\x03\x11\x79\x0f\x11\x86\xdd\x11\x86\xcd\x0f\x0f\x11\x87\x05" } },
    .{ "CryptXmlFindAlgorithmInfo", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlFindAlgorithmInfo", .signature = "\x00\x04\x0f\x11\x87\x05\x09\x0f\x01\x09\x09" } },
    .{ "CryptXmlEnumAlgorithmInfo", MethodRecord{ .library = "CRYPTXML", .import = "CryptXmlEnumAlgorithmInfo", .signature = "\x00\x04\x11\x79\x09\x09\x0f\x01\x12\x87\x09" } },
    .{ "GetToken", MethodRecord{ .library = "infocardapi", .import = "GetToken", .signature = "\x00\x04\x11\x79\x09\x0f\x11\x87\x0d\x0f\x0f\x11\x87\x11\x0f\x0f\x11\x87\x15" } },
    .{ "ManageCardSpace", MethodRecord{ .library = "infocardapi", .import = "ManageCardSpace", .signature = "\x00\x00\x11\x79" } },
    .{ "ImportInformationCard", MethodRecord{ .library = "infocardapi", .import = "ImportInformationCard", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "Encrypt", MethodRecord{ .library = "infocardapi", .import = "Encrypt", .signature = "\x00\x06\x11\x79\x0f\x11\x87\x15\x11\x59\x09\x0f\x05\x0f\x09\x0f\x0f\x05" } },
    .{ "Decrypt", MethodRecord{ .library = "infocardapi", .import = "Decrypt", .signature = "\x00\x06\x11\x79\x0f\x11\x87\x15\x11\x59\x09\x0f\x05\x0f\x09\x0f\x0f\x05" } },
    .{ "SignHash", MethodRecord{ .library = "infocardapi", .import = "SignHash", .signature = "\x00\x06\x11\x79\x0f\x11\x87\x15\x09\x0f\x05\x11\x05\x0f\x09\x0f\x0f\x05" } },
    .{ "VerifyHash", MethodRecord{ .library = "infocardapi", .import = "VerifyHash", .signature = "\x00\x07\x11\x79\x0f\x11\x87\x15\x09\x0f\x05\x11\x05\x09\x0f\x05\x0f\x11\x59" } },
    .{ "GetCryptoTransform", MethodRecord{ .library = "infocardapi", .import = "GetCryptoTransform", .signature = "\x00\x08\x11\x79\x0f\x11\x87\x15\x09\x11\x87\x19\x09\x11\x87\x1d\x09\x0f\x05\x0f\x0f\x11\x87\x15" } },
    .{ "GetKeyedHash", MethodRecord{ .library = "infocardapi", .import = "GetKeyedHash", .signature = "\x00\x02\x11\x79\x0f\x11\x87\x15\x0f\x0f\x11\x87\x15" } },
    .{ "TransformBlock", MethodRecord{ .library = "infocardapi", .import = "TransformBlock", .signature = "\x00\x05\x11\x79\x0f\x11\x87\x15\x09\x0f\x05\x0f\x09\x0f\x0f\x05" } },
    .{ "TransformFinalBlock", MethodRecord{ .library = "infocardapi", .import = "TransformFinalBlock", .signature = "\x00\x05\x11\x79\x0f\x11\x87\x15\x09\x0f\x05\x0f\x09\x0f\x0f\x05" } },
    .{ "HashCore", MethodRecord{ .library = "infocardapi", .import = "HashCore", .signature = "\x00\x03\x11\x79\x0f\x11\x87\x15\x09\x0f\x05" } },
    .{ "HashFinal", MethodRecord{ .library = "infocardapi", .import = "HashFinal", .signature = "\x00\x05\x11\x79\x0f\x11\x87\x15\x09\x0f\x05\x0f\x09\x0f\x0f\x05" } },
    .{ "FreeToken", MethodRecord{ .library = "infocardapi", .import = "FreeToken", .signature = "\x00\x01\x11\x59\x0f\x11\x87\x11" } },
    .{ "CloseCryptoHandle", MethodRecord{ .library = "infocardapi", .import = "CloseCryptoHandle", .signature = "\x00\x01\x11\x79\x0f\x11\x87\x15" } },
    .{ "GenerateDerivedKey", MethodRecord{ .library = "infocardapi", .import = "GenerateDerivedKey", .signature = "\x00\x0a\x11\x79\x0f\x11\x87\x15\x09\x0f\x05\x09\x0f\x05\x09\x09\x11\x05\x0f\x09\x0f\x0f\x05" } },
    .{ "GetBrowserToken", MethodRecord{ .library = "infocardapi", .import = "GetBrowserToken", .signature = "\x00\x04\x11\x79\x09\x0f\x01\x0f\x09\x0f\x0f\x05" } },
    .{ "GetCipherInterface", MethodRecord{ .library = "bcryptprimitives", .import = "GetCipherInterface", .signature = "\x00\x04\x11\x84\x71\x11\x05\x11\x05\x0f\x0f\x11\x87\x21\x09" } },
    .{ "GetHashInterface", MethodRecord{ .library = "bcryptprimitives", .import = "GetHashInterface", .signature = "\x00\x04\x11\x84\x71\x11\x05\x11\x05\x0f\x0f\x11\x87\x25\x09" } },
    .{ "GetAsymmetricEncryptionInterface", MethodRecord{ .library = "bcryptprimitives", .import = "GetAsymmetricEncryptionInterface", .signature = "\x00\x04\x11\x84\x71\x11\x05\x11\x05\x0f\x0f\x11\x87\x29\x09" } },
    .{ "GetSecretAgreementInterface", MethodRecord{ .library = "bcryptprimitives", .import = "GetSecretAgreementInterface", .signature = "\x00\x04\x11\x84\x71\x11\x05\x11\x05\x0f\x0f\x11\x87\x2d\x09" } },
    .{ "GetSignatureInterface", MethodRecord{ .library = "bcryptprimitives", .import = "GetSignatureInterface", .signature = "\x00\x04\x11\x84\x71\x11\x05\x11\x05\x0f\x0f\x11\x87\x31\x09" } },
    .{ "GetRngInterface", MethodRecord{ .library = "bcryptprimitives", .import = "GetRngInterface", .signature = "\x00\x03\x11\x84\x71\x11\x05\x0f\x0f\x11\x87\x35\x09" } },
    .{ "GetKeyDerivationInterface", MethodRecord{ .library = "bcryptprimitives", .import = "GetKeyDerivationInterface", .signature = "\x00\x04\x11\x84\x71\x11\x05\x11\x05\x0f\x0f\x11\x87\x39\x09" } },
    .{ "BCryptRegisterProvider", MethodRecord{ .library = "bcrypt", .import = "BCryptRegisterProvider", .signature = "\x00\x03\x11\x84\x71\x11\x05\x09\x0f\x11\x84\xad" } },
    .{ "BCryptUnregisterProvider", MethodRecord{ .library = "bcrypt", .import = "BCryptUnregisterProvider", .signature = "\x00\x01\x11\x84\x71\x11\x05" } },
    .{ "BCryptAddContextFunctionProvider", MethodRecord{ .library = "bcrypt", .import = "BCryptAddContextFunctionProvider", .signature = "\x00\x06\x11\x84\x71\x09\x11\x05\x09\x11\x05\x11\x05\x09" } },
    .{ "BCryptRemoveContextFunctionProvider", MethodRecord{ .library = "bcrypt", .import = "BCryptRemoveContextFunctionProvider", .signature = "\x00\x05\x11\x84\x71\x09\x11\x05\x09\x11\x05\x11\x05" } },
    .{ "GetKeyStorageInterface", MethodRecord{ .library = "ncrypt", .import = "GetKeyStorageInterface", .signature = "\x00\x03\x11\x84\x71\x11\x05\x0f\x0f\x11\x87\x3d\x09" } },
    .{ "SslChangeNotify", MethodRecord{ .library = "ncrypt", .import = "SslChangeNotify", .signature = "\x00\x02\x11\x79\x11\x80\x85\x09" } },
    .{ "SslComputeClientAuthHash", MethodRecord{ .library = "ncrypt", .import = "SslComputeClientAuthHash", .signature = "\x00\x08\x11\x79\x11\x84\xd5\x11\x84\xed\x11\x87\x41\x11\x05\x0f\x05\x09\x0f\x09\x09" } },
    .{ "SslComputeEapKeyBlock", MethodRecord{ .library = "ncrypt", .import = "SslComputeEapKeyBlock", .signature = "\x00\x08\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x05\x09\x0f\x05\x09\x0f\x09\x09" } },
    .{ "SslComputeFinishedHash", MethodRecord{ .library = "ncrypt", .import = "SslComputeFinishedHash", .signature = "\x00\x06\x11\x79\x11\x84\xd5\x11\x84\xed\x11\x87\x41\x0f\x05\x09\x09" } },
    .{ "SslCreateEphemeralKey", MethodRecord{ .library = "ncrypt", .import = "SslCreateEphemeralKey", .signature = "\x00\x09\x11\x79\x11\x84\xd5\x0f\x11\x84\xed\x09\x09\x09\x09\x0f\x05\x09\x09" } },
    .{ "SslCreateHandshakeHash", MethodRecord{ .library = "ncrypt", .import = "SslCreateHandshakeHash", .signature = "\x00\x05\x11\x79\x11\x84\xd5\x0f\x11\x87\x41\x09\x09\x09" } },
    .{ "SslDecryptPacket", MethodRecord{ .library = "ncrypt", .import = "SslDecryptPacket", .signature = "\x00\x09\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x05\x09\x0f\x05\x09\x0f\x09\x0b\x09" } },
    .{ "SslEncryptPacket", MethodRecord{ .library = "ncrypt", .import = "SslEncryptPacket", .signature = "\x00\x0a\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x05\x09\x0f\x05\x09\x0f\x09\x0b\x09\x09" } },
    .{ "SslEnumCipherSuites", MethodRecord{ .library = "ncrypt", .import = "SslEnumCipherSuites", .signature = "\x00\x05\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x0f\x11\x87\x45\x0f\x0f\x01\x09" } },
    .{ "SslEnumCipherSuitesEx", MethodRecord{ .library = "ncrypt", .import = "SslEnumCipherSuitesEx", .signature = "\x00\x05\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x0f\x11\x87\x49\x0f\x0f\x01\x09" } },
    .{ "SslEnumEccCurves", MethodRecord{ .library = "ncrypt", .import = "SslEnumEccCurves", .signature = "\x00\x04\x11\x79\x11\x84\xd5\x0f\x09\x0f\x0f\x11\x87\x4d\x09" } },
    .{ "SslEnumProtocolProviders", MethodRecord{ .library = "ncrypt", .import = "SslEnumProtocolProviders", .signature = "\x00\x03\x11\x79\x0f\x09\x0f\x0f\x11\x84\xe9\x09" } },
    .{ "SslExportKey", MethodRecord{ .library = "ncrypt", .import = "SslExportKey", .signature = "\x00\x07\x11\x79\x11\x84\xd5\x11\x84\xed\x11\x05\x0f\x05\x09\x0f\x09\x09" } },
    .{ "SslFreeBuffer", MethodRecord{ .library = "ncrypt", .import = "SslFreeBuffer", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "SslFreeObject", MethodRecord{ .library = "ncrypt", .import = "SslFreeObject", .signature = "\x00\x02\x11\x79\x11\x84\xf5\x09" } },
    .{ "SslGenerateMasterKey", MethodRecord{ .library = "ncrypt", .import = "SslGenerateMasterKey", .signature = "\x00\x0b\x11\x79\x11\x84\xd5\x11\x84\xed\x11\x84\xed\x0f\x11\x84\xed\x09\x09\x0f\x11\x84\x95\x0f\x05\x09\x0f\x09\x09" } },
    .{ "SslGenerateSessionKeys", MethodRecord{ .library = "ncrypt", .import = "SslGenerateSessionKeys", .signature = "\x00\x06\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x11\x84\xed\x0f\x11\x84\xed\x0f\x11\x84\x95\x09" } },
    .{ "SslGetKeyProperty", MethodRecord{ .library = "ncrypt", .import = "SslGetKeyProperty", .signature = "\x00\x05\x11\x79\x11\x84\xed\x11\x05\x0f\x0f\x05\x0f\x09\x09" } },
    .{ "SslGetProviderProperty", MethodRecord{ .library = "ncrypt", .import = "SslGetProviderProperty", .signature = "\x00\x06\x11\x79\x11\x84\xd5\x11\x05\x0f\x0f\x05\x0f\x09\x0f\x0f\x01\x09" } },
    .{ "SslHashHandshake", MethodRecord{ .library = "ncrypt", .import = "SslHashHandshake", .signature = "\x00\x05\x11\x79\x11\x84\xd5\x11\x87\x41\x0f\x05\x09\x09" } },
    .{ "SslImportKey", MethodRecord{ .library = "ncrypt", .import = "SslImportKey", .signature = "\x00\x06\x11\x79\x11\x84\xd5\x0f\x11\x84\xed\x11\x05\x0f\x05\x09\x09" } },
    .{ "SslImportMasterKey", MethodRecord{ .library = "ncrypt", .import = "SslImportMasterKey", .signature = "\x00\x09\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x11\x84\xed\x09\x09\x0f\x11\x84\x95\x0f\x05\x09\x09" } },
    .{ "SslLookupCipherSuiteInfo", MethodRecord{ .library = "ncrypt", .import = "SslLookupCipherSuiteInfo", .signature = "\x00\x06\x11\x79\x11\x84\xd5\x09\x09\x09\x0f\x11\x87\x45\x09" } },
    .{ "SslOpenPrivateKey", MethodRecord{ .library = "ncrypt", .import = "SslOpenPrivateKey", .signature = "\x00\x04\x11\x79\x11\x84\xd5\x0f\x11\x84\xed\x0f\x11\x7d\x09" } },
    .{ "SslOpenProvider", MethodRecord{ .library = "ncrypt", .import = "SslOpenProvider", .signature = "\x00\x03\x11\x79\x0f\x11\x84\xd5\x11\x05\x09" } },
    .{ "SslSignHash", MethodRecord{ .library = "ncrypt", .import = "SslSignHash", .signature = "\x00\x08\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x05\x09\x0f\x05\x09\x0f\x09\x09" } },
    .{ "SslVerifySignature", MethodRecord{ .library = "ncrypt", .import = "SslVerifySignature", .signature = "\x00\x07\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x05\x09\x0f\x05\x09\x09" } },
    .{ "SslLookupCipherLengths", MethodRecord{ .library = "ncrypt", .import = "SslLookupCipherLengths", .signature = "\x00\x07\x11\x79\x11\x84\xd5\x09\x09\x09\x0f\x11\x87\x51\x09\x09" } },
    .{ "SslCreateClientAuthHash", MethodRecord{ .library = "ncrypt", .import = "SslCreateClientAuthHash", .signature = "\x00\x06\x11\x79\x11\x84\xd5\x0f\x11\x87\x41\x09\x09\x11\x05\x09" } },
    .{ "SslGetCipherSuitePRFHashAlgorithm", MethodRecord{ .library = "ncrypt", .import = "SslGetCipherSuitePRFHashAlgorithm", .signature = "\x00\x06\x11\x79\x11\x84\xd5\x09\x09\x09\x11\x05\x09" } },
    .{ "SslComputeSessionHash", MethodRecord{ .library = "ncrypt", .import = "SslComputeSessionHash", .signature = "\x00\x07\x11\x79\x11\x84\xd5\x11\x87\x41\x09\x0f\x05\x09\x0f\x09\x09" } },
    .{ "SslGeneratePreMasterKey", MethodRecord{ .library = "ncrypt", .import = "SslGeneratePreMasterKey", .signature = "\x00\x0a\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x11\x84\xed\x09\x09\x0f\x11\x84\x95\x0f\x05\x09\x0f\x09\x09" } },
    .{ "SslExportKeyingMaterial", MethodRecord{ .library = "ncrypt", .import = "SslExportKeyingMaterial", .signature = "\x00\x0a\x11\x79\x11\x84\xd5\x11\x84\xed\x11\x3d\x0f\x05\x09\x0f\x05\x07\x0f\x05\x09\x09" } },
    .{ "SslExtractEarlyKey", MethodRecord{ .library = "ncrypt", .import = "SslExtractEarlyKey", .signature = "\x00\x07\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x11\x84\xed\x09\x09\x0f\x11\x84\x95\x09" } },
    .{ "SslExtractHandshakeKey", MethodRecord{ .library = "ncrypt", .import = "SslExtractHandshakeKey", .signature = "\x00\x07\x11\x79\x11\x84\xd5\x11\x84\xed\x11\x84\xed\x11\x84\xed\x0f\x11\x84\xed\x0f\x11\x84\x95\x09" } },
    .{ "SslExtractMasterKey", MethodRecord{ .library = "ncrypt", .import = "SslExtractMasterKey", .signature = "\x00\x05\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x11\x84\xed\x0f\x11\x84\x95\x09" } },
    .{ "SslExpandTrafficKeys", MethodRecord{ .library = "ncrypt", .import = "SslExpandTrafficKeys", .signature = "\x00\x07\x11\x79\x11\x84\xd5\x11\x84\xed\x11\x87\x41\x0f\x11\x84\xed\x0f\x11\x84\xed\x0f\x11\x84\x95\x09" } },
    .{ "SslExpandWriteKey", MethodRecord{ .library = "ncrypt", .import = "SslExpandWriteKey", .signature = "\x00\x05\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x11\x84\xed\x0f\x11\x84\x95\x09" } },
    .{ "SslExpandExporterMasterKey", MethodRecord{ .library = "ncrypt", .import = "SslExpandExporterMasterKey", .signature = "\x00\x06\x11\x79\x11\x84\xd5\x11\x84\xed\x11\x87\x41\x0f\x11\x84\xed\x0f\x11\x84\x95\x09" } },
    .{ "SslExpandResumptionMasterKey", MethodRecord{ .library = "ncrypt", .import = "SslExpandResumptionMasterKey", .signature = "\x00\x06\x11\x79\x11\x84\xd5\x11\x84\xed\x11\x87\x41\x0f\x11\x84\xed\x0f\x11\x84\x95\x09" } },
    .{ "SslDuplicateTranscriptHash", MethodRecord{ .library = "ncrypt", .import = "SslDuplicateTranscriptHash", .signature = "\x00\x04\x11\x79\x11\x84\xd5\x11\x87\x41\x0f\x11\x87\x41\x09" } },
    .{ "SslExpandBinderKey", MethodRecord{ .library = "ncrypt", .import = "SslExpandBinderKey", .signature = "\x00\x05\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x11\x84\xed\x0f\x11\x84\x95\x09" } },
    .{ "SslExpandPreSharedKey", MethodRecord{ .library = "ncrypt", .import = "SslExpandPreSharedKey", .signature = "\x00\x07\x11\x79\x11\x84\xd5\x11\x84\xed\x0f\x05\x09\x0f\x11\x84\xed\x0f\x11\x84\x95\x09" } },
    .{ "GetSChannelInterface", MethodRecord{ .library = "ncrypt", .import = "GetSChannelInterface", .signature = "\x00\x03\x11\x84\x71\x11\x05\x0f\x0f\x11\x87\x59\x09" } },
    .{ "SslIncrementProviderReferenceCount", MethodRecord{ .library = "ncrypt", .import = "SslIncrementProviderReferenceCount", .signature = "\x00\x01\x11\x79\x11\x84\xd5" } },
    .{ "SslDecrementProviderReferenceCount", MethodRecord{ .library = "ncrypt", .import = "SslDecrementProviderReferenceCount", .signature = "\x00\x01\x11\x79\x11\x84\xd5" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x7d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CONTEXT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0xe5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "ALG_ID" },
        0x115 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSID" },
        0x181 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HMODULE" },
        0x45d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_ALG_HANDLE" },
        0x461 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_KEY_FLAGS" },
        0x465 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_KEY_PARAM_ID" },
        0x469 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_SET_HASH_PARAM" },
        0x46d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_SET_PROV_PARAM_ID" },
        0x471 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "NTSTATUS" },
        0x475 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_OPEN_ALGORITHM_PROVIDER_FLAGS" },
        0x479 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_OPERATION" },
        0x47d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_ALGORITHM_IDENTIFIER" },
        0x481 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_PROVIDER_NAME" },
        0x485 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_HANDLE" },
        0x489 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_KEY_HANDLE" },
        0x48d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_FLAGS" },
        0x491 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_SECRET_HANDLE" },
        0x495 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCryptBufferDesc" },
        0x499 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_HASH_HANDLE" },
        0x49d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_MULTI_OPERATION_TYPE" },
        0x4a1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPTGENRANDOM_FLAGS" },
        0x4a5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_QUERY_PROVIDER_MODE" },
        0x4a9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_INTERFACE" },
        0x4ad => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_PROVIDER_REG" },
        0x4b1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_PROVIDERS" },
        0x4b5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_TABLE" },
        0x4b9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_CONTEXT_CONFIG" },
        0x4bd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_CONTEXTS" },
        0x4c1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_CONTEXT_FUNCTIONS" },
        0x4c5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_CONTEXT_FUNCTION_CONFIG" },
        0x4c9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_CONTEXT_FUNCTION_PROVIDERS" },
        0x4cd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_RESOLVE_PROVIDERS_FLAGS" },
        0x4d1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_PROVIDER_REFS" },
        0x4d5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_PROV_HANDLE" },
        0x4d9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_OPERATION" },
        0x4dd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCryptAlgorithmName" },
        0x4e1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCryptKeyName" },
        0x4e5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_FLAGS" },
        0x4e9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCryptProviderName" },
        0x4ed => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_KEY_HANDLE" },
        0x4f1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_KEY_SPEC" },
        0x4f5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_HANDLE" },
        0x4f9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "OBJECT_SECURITY_INFORMATION" },
        0x4fd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_SECRET_HANDLE" },
        0x501 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_QUERY_ENCODING_TYPE" },
        0x505 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_ENCODE_OBJECT_FLAGS" },
        0x509 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_ENCODE_PARA" },
        0x50d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_DECODE_PARA" },
        0x511 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_OID_FUNC_ENTRY" },
        0x519 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "REG_VALUE_TYPE" },
        0x51d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "PFN_CRYPT_ENUM_OID_FUNC" },
        0x521 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_OID_INFO" },
        0x525 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "PFN_CRYPT_ENUM_OID_INFO" },
        0x529 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_MSG_TYPE" },
        0x52d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CMSG_STREAM_INFO" },
        0x531 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "HCRYPTPROV_LEGACY" },
        0x535 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_INFO" },
        0x539 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CMSG_SIGNER_ENCODE_INFO" },
        0x53d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "HCERTSTORE" },
        0x541 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_OPEN_STORE_FLAGS" },
        0x545 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_STORE_SAVE_AS" },
        0x549 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_STORE_SAVE_TO" },
        0x54d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_FIND_FLAGS" },
        0x551 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_ATTRIBUTE" },
        0x555 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CTL_ENTRY" },
        0x559 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRL_CONTEXT" },
        0x55d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRL_ENTRY" },
        0x561 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CTL_CONTEXT" },
        0x565 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_FIND_TYPE" },
        0x569 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CONTROL_STORE_FLAGS" },
        0x56d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CREATE_CONTEXT_PARA" },
        0x571 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_SYSTEM_STORE_INFO" },
        0x575 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_PHYSICAL_STORE_INFO" },
        0x579 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "PFN_CERT_ENUM_SYSTEM_STORE_LOCATION" },
        0x57d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "PFN_CERT_ENUM_SYSTEM_STORE" },
        0x581 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "PFN_CERT_ENUM_PHYSICAL_STORE" },
        0x585 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CTL_USAGE" },
        0x589 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CMSG_SIGNED_ENCODE_INFO" },
        0x58d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CTL_INFO" },
        0x591 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_INTEGER_BLOB" },
        0x595 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CTL_VERIFY_USAGE_PARA" },
        0x599 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CTL_VERIFY_USAGE_STATUS" },
        0x59d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_REVOCATION_PARA" },
        0x5a1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_REVOCATION_STATUS" },
        0x5a5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_RDN" },
        0x5a9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_PUBLIC_KEY_INFO" },
        0x5ad => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_VERIFY_CERT_FLAGS" },
        0x5b1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_STRONG_SIGN_PARA" },
        0x5b5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "HCRYPTPROV_OR_NCRYPT_KEY_HANDLE" },
        0x5b9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_ALGORITHM_IDENTIFIER" },
        0x5bd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRL_INFO" },
        0x5c1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_EXTENSION" },
        0x5c5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_RDN_ATTR" },
        0x5c9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_NAME_INFO" },
        0x5cd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_DEFAULT_CONTEXT_TYPE" },
        0x5d1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_DEFAULT_CONTEXT_FLAGS" },
        0x5d5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_IMPORT_PUBLIC_KEY_FLAGS" },
        0x5d9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_ACQUIRE_FLAGS" },
        0x5dd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_FIND_FLAGS" },
        0x5e1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_PKCS8_IMPORT_PARAMS" },
        0x5e5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_STRING_TYPE" },
        0x5e9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_SIGN_MESSAGE_PARA" },
        0x5ed => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_VERIFY_MESSAGE_PARA" },
        0x5f1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_ENCRYPT_MESSAGE_PARA" },
        0x5f5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_DECRYPT_MESSAGE_PARA" },
        0x5f9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_HASH_MESSAGE_PARA" },
        0x5fd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_KEY_SIGN_MESSAGE_PARA" },
        0x601 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_KEY_VERIFY_MESSAGE_PARA" },
        0x605 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CHAIN" },
        0x609 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_QUERY_OBJECT_TYPE" },
        0x60d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_QUERY_CONTENT_TYPE_FLAGS" },
        0x611 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_QUERY_FORMAT_TYPE_FLAGS" },
        0x615 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_QUERY_CONTENT_TYPE" },
        0x619 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_QUERY_FORMAT_TYPE" },
        0x61d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "HCRYPTASYNC" },
        0x621 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "PFN_CRYPT_ASYNC_PARAM_FREE_FUNC" },
        0x625 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_CREDENTIALS" },
        0x629 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_RETRIEVE_AUX_INFO" },
        0x62d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "PFN_CRYPT_CANCEL_RETRIEVAL" },
        0x631 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_GET_URL_FLAGS" },
        0x635 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_URL_ARRAY" },
        0x639 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_URL_INFO" },
        0x63d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CREATE_SELFSIGN_FLAGS" },
        0x641 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_KEY_PROV_INFO" },
        0x645 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SYSTEMTIME" },
        0x649 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_EXTENSIONS" },
        0x64d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "PFN_CRYPT_ENUM_KEYID_PROP" },
        0x651 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "PUBLICKEYSTRUC" },
        0x655 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CHAIN_ENGINE_CONFIG" },
        0x659 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "HCERTCHAINENGINE" },
        0x65d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CHAIN_PARA" },
        0x661 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CHAIN_CONTEXT" },
        0x665 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_FIND_CHAIN_IN_STORE_FLAGS" },
        0x669 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CHAIN_POLICY_PARA" },
        0x66d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CHAIN_POLICY_STATUS" },
        0x671 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_STRING" },
        0x675 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_SERVER_OCSP_RESPONSE_OPEN_PARA" },
        0x679 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_SERVER_OCSP_RESPONSE_CONTEXT" },
        0x67d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_SELECT_CHAIN_PARA" },
        0x681 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_SELECT_CRITERIA" },
        0x685 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_TIMESTAMP_PARA" },
        0x689 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_TIMESTAMP_CONTEXT" },
        0x68d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPTPROTECT_PROMPTSTRUCT" },
        0x691 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "NCRYPT_DESCRIPTOR_HANDLE" },
        0x695 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_ALLOC_PARA" },
        0x699 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_PROTECT_STREAM_INFO" },
        0x69d => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "NCRYPT_STREAM_HANDLE" },
        0x6a1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_PROTECT_STREAM_INFO_EX" },
        0x6a5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "SIGNER_CONTEXT" },
        0x6a9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "SIGNER_SUBJECT_INFO" },
        0x6ad => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "SIGNER_CERT" },
        0x6b1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "SIGNER_SIGNATURE_INFO" },
        0x6b5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "SIGNER_PROVIDER_INFO" },
        0x6b9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_ATTRIBUTES" },
        0x6bd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "SIGNER_SIGN_FLAGS" },
        0x6c1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "SIGNER_TIMESTAMP_FLAGS" },
        0x6c5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "SIGNER_DIGEST_SIGN_INFO" },
        0x6c9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_TRANSFORM_CHAIN_CONFIG" },
        0x6cd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_FLAGS" },
        0x6d1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_PROPERTY" },
        0x6d5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_BLOB" },
        0x6d9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_OBJECT" },
        0x6dd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_ALGORITHM" },
        0x6e1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_DATA_PROVIDER" },
        0x6e5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_KEYINFO_SPEC" },
        0x6e9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_KEY_VALUE" },
        0x6ed => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_DOC_CTXT" },
        0x6f1 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_SIGNATURE" },
        0x6f5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_REFERENCE" },
        0x6f9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_STATUS" },
        0x6fd => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_CHARSET" },
        0x701 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "PFN_CRYPT_XML_WRITE_CALLBACK" },
        0x705 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CRYPT_XML_ALGORITHM_INFO" },
        0x709 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "PFN_CRYPT_XML_ENUM_ALG_INFO" },
        0x70d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "POLICY_ELEMENT" },
        0x711 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "GENERIC_XML_TOKEN" },
        0x715 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "INFORMATIONCARD_CRYPTO_HANDLE" },
        0x719 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "PaddingMode" },
        0x71d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "Direction" },
        0x721 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_CIPHER_FUNCTION_TABLE" },
        0x725 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_HASH_FUNCTION_TABLE" },
        0x729 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_ASYMMETRIC_ENCRYPTION_FUNCTION_TABLE" },
        0x72d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_SECRET_AGREEMENT_FUNCTION_TABLE" },
        0x731 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_SIGNATURE_FUNCTION_TABLE" },
        0x735 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_RNG_FUNCTION_TABLE" },
        0x739 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "BCRYPT_KEY_DERIVATION_FUNCTION_TABLE" },
        0x73d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_KEY_STORAGE_FUNCTION_TABLE" },
        0x741 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_HASH_HANDLE" },
        0x745 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_SSL_CIPHER_SUITE" },
        0x749 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_SSL_CIPHER_SUITE_EX" },
        0x74d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_SSL_ECC_CURVE" },
        0x751 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_SSL_CIPHER_LENGTHS" },
        0x759 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "NCRYPT_SSL_FUNCTION_TABLE" },
        else => null,
    };
}

pub const CERT_SYSTEM_STORE_CURRENT_USER = 65536;
pub const CERT_SYSTEM_STORE_LOCAL_MACHINE = 131072;
pub const CERT_COMPARE_SHIFT = 16;
pub const BCRYPT_OBJECT_ALIGNMENT = 16;
pub const KDF_HASH_ALGORITHM = 0;
pub const KDF_SECRET_PREPEND = 1;
pub const KDF_SECRET_APPEND = 2;
pub const KDF_HMAC_KEY = 3;
pub const KDF_TLS_PRF_LABEL = 4;
pub const KDF_TLS_PRF_SEED = 5;
pub const KDF_SECRET_HANDLE = 6;
pub const KDF_TLS_PRF_PROTOCOL = 7;
pub const KDF_ALGORITHMID = 8;
pub const KDF_PARTYUINFO = 9;
pub const KDF_PARTYVINFO = 10;
pub const KDF_SUPPPUBINFO = 11;
pub const KDF_SUPPPRIVINFO = 12;
pub const KDF_LABEL = 13;
pub const KDF_CONTEXT = 14;
pub const KDF_SALT = 15;
pub const KDF_ITERATION_COUNT = 16;
pub const KDF_GENERIC_PARAMETER = 17;
pub const KDF_KEYBITLENGTH = 18;
pub const KDF_HKDF_SALT = 19;
pub const KDF_HKDF_INFO = 20;
pub const KDF_USE_SECRET_AS_HMAC_KEY_FLAG = 1;
pub const BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO_VERSION = 1;
pub const BCRYPT_AUTH_MODE_CHAIN_CALLS_FLAG = 1;
pub const BCRYPT_AUTH_MODE_IN_PROGRESS_FLAG = 2;
pub const BCRYPT_PKCS11_RSA_AES_WRAP_BLOB_MAGIC = 1464877394;
pub const BCRYPT_SUPPORTED_PAD_ROUTER = 1;
pub const BCRYPT_SUPPORTED_PAD_PKCS1_ENC = 2;
pub const BCRYPT_SUPPORTED_PAD_PKCS1_SIG = 4;
pub const BCRYPT_SUPPORTED_PAD_OAEP = 8;
pub const BCRYPT_SUPPORTED_PAD_PSS = 16;
pub const BCRYPT_GENERATE_IV = 32;
pub const BCRYPT_PAD_PKCS1_OPTIONAL_HASH_OID = 16;
pub const BCRYPT_PAD_PQDSA = 32;
pub const BCRYPT_MLDSA_EXTERNAL_MU = 64;
pub const BCRYPTBUFFER_VERSION = 0;
pub const BCRYPT_ECDH_PUBLIC_P256_MAGIC = 827016005;
pub const BCRYPT_ECDH_PRIVATE_P256_MAGIC = 843793221;
pub const BCRYPT_ECDH_PUBLIC_P384_MAGIC = 860570437;
pub const BCRYPT_ECDH_PRIVATE_P384_MAGIC = 877347653;
pub const BCRYPT_ECDH_PUBLIC_P521_MAGIC = 894124869;
pub const BCRYPT_ECDH_PRIVATE_P521_MAGIC = 910902085;
pub const BCRYPT_ECDH_PUBLIC_GENERIC_MAGIC = 1347109701;
pub const BCRYPT_ECDH_PRIVATE_GENERIC_MAGIC = 1447772997;
pub const BCRYPT_ECDSA_PUBLIC_P256_MAGIC = 827540293;
pub const BCRYPT_ECDSA_PRIVATE_P256_MAGIC = 844317509;
pub const BCRYPT_ECDSA_PUBLIC_P384_MAGIC = 861094725;
pub const BCRYPT_ECDSA_PRIVATE_P384_MAGIC = 877871941;
pub const BCRYPT_ECDSA_PUBLIC_P521_MAGIC = 894649157;
pub const BCRYPT_ECDSA_PRIVATE_P521_MAGIC = 911426373;
pub const BCRYPT_ECDSA_PUBLIC_GENERIC_MAGIC = 1346650949;
pub const BCRYPT_ECDSA_PRIVATE_GENERIC_MAGIC = 1447314245;
pub const BCRYPT_ECC_FULLKEY_BLOB_V1 = 1;
pub const BCRYPT_DH_PARAMETERS_MAGIC = 1297107012;
pub const BCRYPT_DSA_PUBLIC_MAGIC_V2 = 843206724;
pub const BCRYPT_DSA_PRIVATE_MAGIC_V2 = 844517444;
pub const BCRYPT_KEY_DATA_BLOB_MAGIC = 1296188491;
pub const BCRYPT_KEY_DATA_BLOB_VERSION1 = 1;
pub const BCRYPT_MLDSA_PUBLIC_MAGIC = 1263555396;
pub const BCRYPT_MLDSA_PRIVATE_MAGIC = 1263752004;
pub const BCRYPT_MLDSA_PRIVATE_SEED_MAGIC = 1397969732;
pub const BCRYPT_SLHDSA_PUBLIC_MAGIC = 1263552595;
pub const BCRYPT_SLHDSA_PRIVATE_MAGIC = 1263749203;
pub const BCRYPT_LMS_PUBLIC_MAGIC = 1263553868;
pub const BCRYPT_XMSS_PUBLIC_MAGIC = 1263553880;
pub const BCRYPT_MLKEM_PUBLIC_MAGIC = 1347112013;
pub const BCRYPT_MLKEM_PRIVATE_MAGIC = 1380666445;
pub const BCRYPT_MLKEM_PRIVATE_SEED_MAGIC = 1397443661;
pub const BCRYPT_DSA_PARAMETERS_MAGIC = 1297109828;
pub const BCRYPT_DSA_PARAMETERS_MAGIC_V2 = 843927620;
pub const BCRYPT_ECC_PARAMETERS_MAGIC = 1346585413;
pub const BCRYPT_KEY_DERIVATION_INTERFACE = 7;
pub const BCRYPT_KEY_ENCAPSULATION_INTERFACE = 8;
pub const BCRYPT_MD2_ALG_HANDLE = 1;
pub const BCRYPT_MD4_ALG_HANDLE = 17;
pub const BCRYPT_MD5_ALG_HANDLE = 33;
pub const BCRYPT_SHA1_ALG_HANDLE = 49;
pub const BCRYPT_SHA256_ALG_HANDLE = 65;
pub const BCRYPT_SHA384_ALG_HANDLE = 81;
pub const BCRYPT_SHA512_ALG_HANDLE = 97;
pub const BCRYPT_RC4_ALG_HANDLE = 113;
pub const BCRYPT_RNG_ALG_HANDLE = 129;
pub const BCRYPT_HMAC_MD5_ALG_HANDLE = 145;
pub const BCRYPT_HMAC_SHA1_ALG_HANDLE = 161;
pub const BCRYPT_HMAC_SHA256_ALG_HANDLE = 177;
pub const BCRYPT_HMAC_SHA384_ALG_HANDLE = 193;
pub const BCRYPT_HMAC_SHA512_ALG_HANDLE = 209;
pub const BCRYPT_RSA_ALG_HANDLE = 225;
pub const BCRYPT_ECDSA_ALG_HANDLE = 241;
pub const BCRYPT_AES_CMAC_ALG_HANDLE = 257;
pub const BCRYPT_AES_GMAC_ALG_HANDLE = 273;
pub const BCRYPT_HMAC_MD2_ALG_HANDLE = 289;
pub const BCRYPT_HMAC_MD4_ALG_HANDLE = 305;
pub const BCRYPT_3DES_CBC_ALG_HANDLE = 321;
pub const BCRYPT_3DES_ECB_ALG_HANDLE = 337;
pub const BCRYPT_3DES_CFB_ALG_HANDLE = 353;
pub const BCRYPT_3DES_112_CBC_ALG_HANDLE = 369;
pub const BCRYPT_3DES_112_ECB_ALG_HANDLE = 385;
pub const BCRYPT_3DES_112_CFB_ALG_HANDLE = 401;
pub const BCRYPT_AES_CBC_ALG_HANDLE = 417;
pub const BCRYPT_AES_ECB_ALG_HANDLE = 433;
pub const BCRYPT_AES_CFB_ALG_HANDLE = 449;
pub const BCRYPT_AES_CCM_ALG_HANDLE = 465;
pub const BCRYPT_AES_GCM_ALG_HANDLE = 481;
pub const BCRYPT_DES_CBC_ALG_HANDLE = 497;
pub const BCRYPT_DES_ECB_ALG_HANDLE = 513;
pub const BCRYPT_DES_CFB_ALG_HANDLE = 529;
pub const BCRYPT_DESX_CBC_ALG_HANDLE = 545;
pub const BCRYPT_DESX_ECB_ALG_HANDLE = 561;
pub const BCRYPT_DESX_CFB_ALG_HANDLE = 577;
pub const BCRYPT_RC2_CBC_ALG_HANDLE = 593;
pub const BCRYPT_RC2_ECB_ALG_HANDLE = 609;
pub const BCRYPT_RC2_CFB_ALG_HANDLE = 625;
pub const BCRYPT_DH_ALG_HANDLE = 641;
pub const BCRYPT_ECDH_ALG_HANDLE = 657;
pub const BCRYPT_ECDH_P256_ALG_HANDLE = 673;
pub const BCRYPT_ECDH_P384_ALG_HANDLE = 689;
pub const BCRYPT_ECDH_P521_ALG_HANDLE = 705;
pub const BCRYPT_DSA_ALG_HANDLE = 721;
pub const BCRYPT_ECDSA_P256_ALG_HANDLE = 737;
pub const BCRYPT_ECDSA_P384_ALG_HANDLE = 753;
pub const BCRYPT_ECDSA_P521_ALG_HANDLE = 769;
pub const BCRYPT_RSA_SIGN_ALG_HANDLE = 785;
pub const BCRYPT_CAPI_KDF_ALG_HANDLE = 801;
pub const BCRYPT_PBKDF2_ALG_HANDLE = 817;
pub const BCRYPT_SP800108_CTR_HMAC_ALG_HANDLE = 833;
pub const BCRYPT_SP80056A_CONCAT_ALG_HANDLE = 849;
pub const BCRYPT_TLS1_1_KDF_ALG_HANDLE = 865;
pub const BCRYPT_TLS1_2_KDF_ALG_HANDLE = 881;
pub const BCRYPT_XTS_AES_ALG_HANDLE = 897;
pub const BCRYPT_HKDF_ALG_HANDLE = 913;
pub const BCRYPT_CHACHA20_POLY1305_ALG_HANDLE = 929;
pub const BCRYPT_SHA3_256_ALG_HANDLE = 945;
pub const BCRYPT_SHA3_384_ALG_HANDLE = 961;
pub const BCRYPT_SHA3_512_ALG_HANDLE = 977;
pub const BCRYPT_HMAC_SHA3_256_ALG_HANDLE = 993;
pub const BCRYPT_HMAC_SHA3_384_ALG_HANDLE = 1009;
pub const BCRYPT_HMAC_SHA3_512_ALG_HANDLE = 1025;
pub const BCRYPT_CSHAKE128_ALG_HANDLE = 1041;
pub const BCRYPT_CSHAKE256_ALG_HANDLE = 1057;
pub const BCRYPT_KMAC128_ALG_HANDLE = 1073;
pub const BCRYPT_KMAC256_ALG_HANDLE = 1089;
pub const BCRYPT_SHAKE128_ALG_HANDLE = 1105;
pub const BCRYPT_SHAKE256_ALG_HANDLE = 1121;
pub const BCRYPT_MLDSA_ALG_HANDLE = 1137;
pub const BCRYPT_MLKEM_ALG_HANDLE = 1153;
pub const BCRYPT_CAPI_AES_FLAG = 16;
pub const BCRYPT_MULTI_FLAG = 64;
pub const BCRYPT_HASH_DONT_RESET_FLAG = 1;
pub const BCRYPT_TLS_CBC_HMAC_VERIFY_FLAG = 4;
pub const BCRYPT_BUFFERS_LOCKED_FLAG = 64;
pub const BCRYPT_EXTENDED_KEYSIZE = 128;
pub const BCRYPT_ENABLE_INCOMPATIBLE_FIPS_CHECKS = 256;
pub const BCRYPT_KEY_DERIVATION_OPERATION = 64;
pub const BCRYPT_KEY_ENCAPSULATION_OPERATION = 128;
pub const BCRYPT_PUBLIC_KEY_FLAG = 1;
pub const BCRYPT_PRIVATE_KEY_FLAG = 2;
pub const BCRYPT_NO_KEY_VALIDATION = 8;
pub const BCRYPT_KEY_VALIDATION_RANGE = 16;
pub const BCRYPT_KEY_VALIDATION_RANGE_AND_ORDER = 24;
pub const BCRYPT_KEY_VALIDATION_REGENERATE = 32;
pub const BCRYPT_HASH_INTERFACE_MAJORVERSION_2 = 2;
pub const CRYPT_OVERWRITE = 1;
pub const CRYPT_PRIORITY_TOP = 0;
pub const CRYPT_PRIORITY_BOTTOM = 4294967295;
pub const CRYPT_XML_BLOB_MAX = 2147483640;
pub const CRYPT_XML_ID_MAX = 256;
pub const CRYPT_XML_SIGNATURES_MAX = 16;
pub const CRYPT_XML_TRANSFORM_MAX = 16;
pub const CRYPT_XML_SIGNATURE_VALUE_MAX = 2048;
pub const CRYPT_XML_DIGEST_VALUE_MAX = 128;
pub const CRYPT_XML_OBJECTS_MAX = 256;
pub const CRYPT_XML_REFERENCES_MAX = 32760;
pub const CRYPT_XML_E_BASE = -2146885376;
pub const CRYPT_XML_E_LARGE = -2146885375;
pub const CRYPT_XML_E_TOO_MANY_TRANSFORMS = -2146885374;
pub const CRYPT_XML_E_ENCODING = -2146885373;
pub const CRYPT_XML_E_ALGORITHM = -2146885372;
pub const CRYPT_XML_E_TRANSFORM = -2146885371;
pub const CRYPT_XML_E_HANDLE = -2146885370;
pub const CRYPT_XML_E_OPERATION = -2146885369;
pub const CRYPT_XML_E_UNRESOLVED_REFERENCE = -2146885368;
pub const CRYPT_XML_E_INVALID_DIGEST = -2146885367;
pub const CRYPT_XML_E_INVALID_SIGNATURE = -2146885366;
pub const CRYPT_XML_E_HASH_FAILED = -2146885365;
pub const CRYPT_XML_E_SIGN_FAILED = -2146885364;
pub const CRYPT_XML_E_VERIFY_FAILED = -2146885363;
pub const CRYPT_XML_E_TOO_MANY_SIGNATURES = -2146885362;
pub const CRYPT_XML_E_INVALID_KEYVALUE = -2146885361;
pub const CRYPT_XML_E_UNEXPECTED_XML = -2146885360;
pub const CRYPT_XML_E_SIGNER = -2146885359;
pub const CRYPT_XML_E_NON_UNIQUE_ID = -2146885358;
pub const CRYPT_XML_E_LAST = -2146885358;
pub const CRYPT_XML_FLAG_ALWAYS_RETURN_ENCODED_OBJECT = 1073741824;
pub const CRYPT_XML_FLAG_ENFORCE_ID_NCNAME_FORMAT = 536870912;
pub const CRYPT_XML_FLAG_ENFORCE_ID_NAME_FORMAT = 134217728;
pub const CRYPT_XML_FLAG_ECDSA_DSIG11 = 67108864;
pub const CRYPT_XML_STATUS_NO_ERROR = 0;
pub const CRYPT_XML_FLAG_ADD_OBJECT_CREATE_COPY = 1;
pub const CRYPT_XML_FLAG_CREATE_REFERENCE_AS_OBJECT = 1;
pub const CRYPT_XML_DIGEST_REFERENCE_DATA_TRANSFORMED = 1;
pub const CRYPT_XML_ALGORITHM_INFO_FIND_BY_URI = 1;
pub const CRYPT_XML_ALGORITHM_INFO_FIND_BY_NAME = 2;
pub const CRYPT_XML_ALGORITHM_INFO_FIND_BY_CNG_ALGID = 3;
pub const CRYPT_XML_ALGORITHM_INFO_FIND_BY_CNG_SIGN_ALGID = 4;
pub const dwFORCE_KEY_PROTECTION_DISABLED = 0;
pub const dwFORCE_KEY_PROTECTION_USER_SELECT = 1;
pub const dwFORCE_KEY_PROTECTION_HIGH = 2;
pub const CRYPTPROTECT_PROMPT_ON_UNPROTECT = 1;
pub const CRYPTPROTECT_PROMPT_ON_PROTECT = 2;
pub const CRYPTPROTECT_PROMPT_RESERVED = 4;
pub const CRYPTPROTECT_PROMPT_STRONG = 8;
pub const CRYPTPROTECT_PROMPT_REQUIRE_STRONG = 16;
pub const CRYPTPROTECT_UI_FORBIDDEN = 1;
pub const CRYPTPROTECT_LOCAL_MACHINE = 4;
pub const CRYPTPROTECT_CRED_SYNC = 8;
pub const CRYPTPROTECT_AUDIT = 16;
pub const CRYPTPROTECT_NO_RECOVERY = 32;
pub const CRYPTPROTECT_VERIFY_PROTECTION = 64;
pub const CRYPTPROTECT_CRED_REGENERATE = 128;
pub const CRYPTPROTECT_FIRST_RESERVED_FLAGVAL = 268435455;
pub const CRYPTPROTECT_LAST_RESERVED_FLAGVAL = 4294967295;
pub const CRYPTPROTECTMEMORY_BLOCK_SIZE = 16;
pub const CRYPTPROTECTMEMORY_SAME_PROCESS = 0;
pub const CRYPTPROTECTMEMORY_CROSS_PROCESS = 1;
pub const CRYPTPROTECTMEMORY_SAME_LOGON = 2;
pub const NCRYPT_MAX_KEY_NAME_LENGTH = 512;
pub const NCRYPT_MAX_ALG_ID_LENGTH = 512;
pub const NCRYPT_KEY_DERIVATION_INTERFACE = 7;
pub const NCRYPT_KEY_ENCAPSULATION_INTERFACE = 8;
pub const NCRYPT_KEY_PROTECTION_INTERFACE = 65540;
pub const NCRYPTBUFFER_VERSION = 0;
pub const NCRYPTBUFFER_EMPTY = 0;
pub const NCRYPTBUFFER_DATA = 1;
pub const NCRYPTBUFFER_PROTECTION_DESCRIPTOR_STRING = 3;
pub const NCRYPTBUFFER_PROTECTION_FLAGS = 4;
pub const NCRYPTBUFFER_SSL_CLIENT_RANDOM = 20;
pub const NCRYPTBUFFER_SSL_SERVER_RANDOM = 21;
pub const NCRYPTBUFFER_SSL_HIGHEST_VERSION = 22;
pub const NCRYPTBUFFER_SSL_CLEAR_KEY = 23;
pub const NCRYPTBUFFER_SSL_KEY_ARG_DATA = 24;
pub const NCRYPTBUFFER_SSL_SESSION_HASH = 25;
pub const NCRYPTBUFFER_PKCS_OID = 40;
pub const NCRYPTBUFFER_PKCS_ALG_OID = 41;
pub const NCRYPTBUFFER_PKCS_ALG_PARAM = 42;
pub const NCRYPTBUFFER_PKCS_ALG_ID = 43;
pub const NCRYPTBUFFER_PKCS_ATTRS = 44;
pub const NCRYPTBUFFER_PKCS_KEY_NAME = 45;
pub const NCRYPTBUFFER_PKCS_SECRET = 46;
pub const NCRYPTBUFFER_CERT_BLOB = 47;
pub const NCRYPTBUFFER_CLAIM_IDBINDING_NONCE = 48;
pub const NCRYPTBUFFER_CLAIM_KEYATTESTATION_NONCE = 49;
pub const NCRYPTBUFFER_KEY_PROPERTY_FLAGS = 50;
pub const NCRYPTBUFFER_ATTESTATIONSTATEMENT_BLOB = 51;
pub const NCRYPTBUFFER_ATTESTATION_CLAIM_TYPE = 52;
pub const NCRYPTBUFFER_ATTESTATION_CLAIM_CHALLENGE_REQUIRED = 53;
pub const NCRYPTBUFFER_ECC_CURVE_NAME = 60;
pub const NCRYPTBUFFER_ECC_PARAMETERS = 61;
pub const NCRYPTBUFFER_TPM_SEAL_PASSWORD = 70;
pub const NCRYPTBUFFER_TPM_SEAL_POLICYINFO = 71;
pub const NCRYPTBUFFER_TPM_SEAL_TICKET = 72;
pub const NCRYPTBUFFER_TPM_SEAL_NO_DA_PROTECTION = 73;
pub const NCRYPTBUFFER_TPM_PLATFORM_CLAIM_PCR_MASK = 80;
pub const NCRYPTBUFFER_TPM_PLATFORM_CLAIM_NONCE = 81;
pub const NCRYPTBUFFER_TPM_PLATFORM_CLAIM_STATIC_CREATE = 82;
pub const NCRYPTBUFFER_ATTESTATION_STATEMENT_SIGNATURE_HASH = 90;
pub const NCRYPTBUFFER_ATTESTATION_STATEMENT_SIGNATURE_PADDING_SCHEME = 91;
pub const NCRYPTBUFFER_ATTESTATION_STATEMENT_SIGNATURE_PADDING_ALGO = 92;
pub const NCRYPTBUFFER_ATTESTATION_STATEMENT_SIGNATURE_PADDING_SALT_SIZE = 93;
pub const NCRYPTBUFFER_ATTESTATION_STATEMENT_SIGNATURE_PADDING_SALT = 93;
pub const NCRYPTBUFFER_ATTESTATION_STATEMENT_NONCE = 49;
pub const NCRYPTBUFFER_VBS_ATTESTATION_STATEMENT_ROOT_DETAILS = 94;
pub const NCRYPTBUFFER_VBS_ATTESTATION_STATEMENT_IDENTITY_DETAILS = 95;
pub const NCRYPTBUFFER_PKCS_AES_KEY_BITS = 96;
pub const NCRYPTBUFFER_PKCS_PADDING_ALGO = 97;
pub const NCRYPTBUFFER_PKCS_PADDING_LABEL = 98;
pub const NCRYPT_CIPHER_NO_PADDING_FLAG = 0;
pub const NCRYPT_CIPHER_BLOCK_PADDING_FLAG = 1;
pub const NCRYPT_CIPHER_OTHER_PADDING_FLAG = 2;
pub const NCRYPT_PLATFORM_ATTEST_MAGIC = 1146110288;
pub const NCRYPT_KEY_ATTEST_MAGIC = 1146110283;
pub const NCRYPT_CLAIM_AUTHORITY_ONLY = 1;
pub const NCRYPT_CLAIM_SUBJECT_ONLY = 2;
pub const NCRYPT_CLAIM_AUTHORITY_AND_SUBJECT = 3;
pub const NCRYPT_CLAIM_VBS_KEY_ATTESTATION_STATEMENT = 4;
pub const NCRYPT_CLAIM_VBS_ROOT = 5;
pub const NCRYPT_CLAIM_VBS_IDENTITY = 6;
pub const NCRYPT_CLAIM_WEB_AUTH_SUBJECT_ONLY = 258;
pub const NCRYPT_CLAIM_UNKNOWN = 4096;
pub const NCRYPT_CLAIM_PLATFORM = 65536;
pub const NCRYPT_CLAIM_WEB_AUTH_SUBJECT_ONLY_V2 = 259;
pub const NCRYPT_ISOLATED_KEY_FLAG_CREATED_IN_ISOLATION = 1;
pub const NCRYPT_ISOLATED_KEY_FLAG_IMPORT_ONLY = 2;
pub const NCRYPT_ISOLATED_KEY_FLAG_PER_BOOT_KEY = 4;
pub const NCRYPT_VBS_KEY_FLAG_CREATED_IN_ISOLATION = 1;
pub const NCRYPT_VBS_KEY_FLAG_IMPORT_ONLY = 2;
pub const NCRYPT_VBS_KEY_FLAG_PER_BOOT_KEY = 4;
pub const NCRYPT_VBS_KEY_FLAG_IMPORT_EPHEMERAL_ONLY = 8;
pub const NCRYPT_ISOLATED_KEY_ATTESTED_ATTRIBUTES_V0 = 0;
pub const NCRYPT_ISOLATED_KEY_ATTESTED_ATTRIBUTES_CURRENT_VERSION = 0;
pub const NCRYPT_VBS_KEY_ATTESTED_ATTRIBUTES_CURRENT_VERSION = 0;
pub const NCRYPT_EXPORTED_ISOLATED_KEY_HEADER_V0 = 0;
pub const NCRYPT_EXPORTED_ISOLATED_KEY_HEADER_CURRENT_VERSION = 0;
pub const NCRYPT_VBS_ROOT_ATTESTATION_HEADER_V0 = 0;
pub const NCRYPT_VBS_ROOT_ATTESTATION_HEADER_CURRENT_VERSION = 0;
pub const VBS_ROOT_ATTESTATION_HEADER_MAGIC = 1212371542;
pub const NCRYPT_VBS_IDENTITY_ATTESTATION_PADDING_V0 = 0;
pub const NCRYPT_VBS_IDENTITY_ATTESTATION_PADDING_CURRENT_VERSION = 0;
pub const NCRYPT_VBS_IDENTITY_ATTESTATION_HEADER_V0 = 0;
pub const NCRYPT_VBS_IDENTITY_ATTESTATION_HEADER_CURRENT_VERSION = 0;
pub const VBS_IDENTITY_ATTESTATION_HEADER_MAGIC = 1212369238;
pub const NCRYPT_VBS_KEY_ATTESTATION_STATEMENT_V1 = 1;
pub const NCRYPT_VBS_KEY_ATTESTATION_STATEMENT_V2 = 2;
pub const NCRYPT_VBS_KEY_ATTESTATION_STATEMENT_CURRENT_VERSION = 2;
pub const VBS_KEY_ATTESTATION_STATEMENT_MAGIC = 1396788054;
pub const NCRYPT_TPM_PLATFORM_ATTESTATION_STATEMENT_V0 = 0;
pub const NCRYPT_TPM_PLATFORM_ATTESTATION_STATEMENT_CURRENT_VERSION = 0;
pub const NCRYPT_PAD_CIPHER_FLAG = 16;
pub const NCRYPT_PAD_PQDSA_FLAG = 32;
pub const NCRYPT_ATTESTATION_FLAG = 32;
pub const NCRYPT_SEALING_FLAG = 256;
pub const NCRYPT_DO_NOT_FINALIZE_FLAG = 1024;
pub const NCRYPT_EXPORT_LEGACY_FLAG = 2048;
pub const NCRYPT_IGNORE_DEVICE_STATE_FLAG = 4096;
pub const NCRYPT_TREAT_NIST_AS_GENERIC_ECC_FLAG = 8192;
pub const NCRYPT_NO_CACHED_PASSWORD = 16384;
pub const NCRYPT_PROTECT_TO_LOCAL_SYSTEM = 32768;
pub const NCRYPT_REQUIRE_KDS_LRPC_BIND_FLAG = 536870912;
pub const NCRYPT_PREFER_VIRTUAL_ISOLATION_FLAG = 65536;
pub const NCRYPT_USE_VIRTUAL_ISOLATION_FLAG = 131072;
pub const NCRYPT_USE_PER_BOOT_KEY_FLAG = 262144;
pub const NCRYPT_PREFER_VBS_FLAG = 65536;
pub const NCRYPT_REQUIRE_VBS_FLAG = 131072;
pub const NCRYPT_USE_VBS_PER_BOOT_KEY_FLAG = 262144;
pub const NCRYPT_VBS_RETURN_CLAIM_DETAILS_FLAG = 1048576;
pub const NCRYPT_KEY_DERIVATION_OPERATION = 64;
pub const NCRYPT_KEY_ENCAPSULATION_OPERATION = 128;
pub const NCRYPT_AUTHORITY_KEY_FLAG = 256;
pub const NCRYPT_EXTENDED_ERRORS_FLAG = 268435456;
pub const IFX_RSA_KEYGEN_VUL_NOT_AFFECTED = 0;
pub const IFX_RSA_KEYGEN_VUL_AFFECTED_LEVEL_1 = 1;
pub const IFX_RSA_KEYGEN_VUL_AFFECTED_LEVEL_2 = 2;
pub const NCRYPT_TPM_PSS_SALT_SIZE_UNKNOWN = 0;
pub const NCRYPT_TPM_PSS_SALT_SIZE_MAXIMUM = 1;
pub const NCRYPT_TPM_PSS_SALT_SIZE_HASHSIZE = 2;
pub const NCRYPT_TPM_PAD_PSS_IGNORE_SALT = 32;
pub const NCRYPT_TPM12_PROVIDER = 65536;
pub const NCRYPT_PCP_SIGNATURE_KEY = 1;
pub const NCRYPT_PCP_ENCRYPTION_KEY = 2;
pub const NCRYPT_PCP_STORAGE_KEY = 4;
pub const NCRYPT_PCP_IDENTITY_KEY = 8;
pub const NCRYPT_PCP_HMACVERIFICATION_KEY = 16;
pub const NCRYPT_MAX_PROPERTY_NAME = 64;
pub const NCRYPT_MAX_PROPERTY_DATA = 1048576;
pub const NCRYPT_ALLOW_EXPORT_FLAG = 1;
pub const NCRYPT_ALLOW_PLAINTEXT_EXPORT_FLAG = 2;
pub const NCRYPT_ALLOW_ARCHIVING_FLAG = 4;
pub const NCRYPT_ALLOW_PLAINTEXT_ARCHIVING_FLAG = 8;
pub const NCRYPT_ALLOW_PKCS11_RSA_AES_EXPORT_FLAG = 16;
pub const NCRYPT_IMPL_HARDWARE_FLAG = 1;
pub const NCRYPT_IMPL_SOFTWARE_FLAG = 2;
pub const NCRYPT_IMPL_REMOVABLE_FLAG = 8;
pub const NCRYPT_IMPL_HARDWARE_RNG_FLAG = 16;
pub const NCRYPT_IMPL_VIRTUAL_ISOLATION_FLAG = 32;
pub const NCRYPT_ALLOW_DECRYPT_FLAG = 1;
pub const NCRYPT_ALLOW_SIGNING_FLAG = 2;
pub const NCRYPT_ALLOW_KEY_AGREEMENT_FLAG = 4;
pub const NCRYPT_ALLOW_KEY_ENVELOPE_FLAG = 8;
pub const NCRYPT_ALLOW_KEY_IMPORT_FLAG = 8;
pub const NCRYPT_ALLOW_KEY_ATTESTATION_FLAG = 16;
pub const NCRYPT_ALLOW_KEY_IMPORT_EPHEMERAL_FLAG = 32;
pub const NCRYPT_ALLOW_ALL_USAGES = 16777215;
pub const NCRYPT_UI_PROTECT_KEY_FLAG = 1;
pub const NCRYPT_UI_FORCE_HIGH_PROTECTION_FLAG = 2;
pub const NCRYPT_UI_FINGERPRINT_PROTECTION_FLAG = 4;
pub const NCRYPT_UI_APPCONTAINER_ACCESS_MEDIUM_FLAG = 8;
pub const NCRYPT_PIN_CACHE_DISABLE_DPL_FLAG = 1;
pub const NCRYPT_PIN_CACHE_REQUIRE_GESTURE_FLAG = 1;
pub const NCRYPT_PIN_CACHE_APPLICATION_TICKET_BYTE_LENGTH = 90;
pub const NCRYPT_PIN_CACHE_CLEAR_FOR_CALLING_PROCESS_OPTION = 1;
pub const NCRYPT_KEY_ACCESS_POLICY_VERSION = 1;
pub const NCRYPT_ALLOW_SILENT_KEY_ACCESS = 1;
pub const NCRYPT_CIPHER_KEY_BLOB_MAGIC = 1380470851;
pub const NCRYPT_KDF_KEY_BLOB_MAGIC = 826688587;
pub const NCRYPT_PROTECTED_KEY_BLOB_MAGIC = 1263817296;
pub const NCRYPT_TPM_LOADABLE_KEY_BLOB_MAGIC = 1297371211;
pub const NCRYPT_TPM_PERSISTENT_KEY_BLOB_MAGIC = 1297371211;
pub const NCRYPT_PQ_PRIVATE_BLOB_MAGIC = 1380995408;
pub const NCRYPT_NAMED_DESCRIPTOR_FLAG = 1;
pub const NCRYPT_PROTECTION_INFO_TYPE_DESCRIPTOR_STRING = 1;
pub const ALG_CLASS_ANY = 0;
pub const ALG_CLASS_SIGNATURE = 8192;
pub const ALG_CLASS_MSG_ENCRYPT = 16384;
pub const ALG_CLASS_DATA_ENCRYPT = 24576;
pub const ALG_CLASS_HASH = 32768;
pub const ALG_CLASS_KEY_EXCHANGE = 40960;
pub const ALG_CLASS_ALL = 57344;
pub const ALG_TYPE_ANY = 0;
pub const ALG_TYPE_DSS = 512;
pub const ALG_TYPE_RSA = 1024;
pub const ALG_TYPE_BLOCK = 1536;
pub const ALG_TYPE_STREAM = 2048;
pub const ALG_TYPE_DH = 2560;
pub const ALG_TYPE_SECURECHANNEL = 3072;
pub const ALG_TYPE_ECDH = 3584;
pub const ALG_TYPE_THIRDPARTY = 4096;
pub const ALG_SID_ANY = 0;
pub const ALG_SID_THIRDPARTY_ANY = 0;
pub const ALG_SID_RSA_ANY = 0;
pub const ALG_SID_RSA_PKCS = 1;
pub const ALG_SID_RSA_MSATWORK = 2;
pub const ALG_SID_RSA_ENTRUST = 3;
pub const ALG_SID_RSA_PGP = 4;
pub const ALG_SID_DSS_ANY = 0;
pub const ALG_SID_DSS_PKCS = 1;
pub const ALG_SID_DSS_DMS = 2;
pub const ALG_SID_ECDSA = 3;
pub const ALG_SID_DES = 1;
pub const ALG_SID_3DES = 3;
pub const ALG_SID_DESX = 4;
pub const ALG_SID_IDEA = 5;
pub const ALG_SID_CAST = 6;
pub const ALG_SID_SAFERSK64 = 7;
pub const ALG_SID_SAFERSK128 = 8;
pub const ALG_SID_3DES_112 = 9;
pub const ALG_SID_CYLINK_MEK = 12;
pub const ALG_SID_RC5 = 13;
pub const ALG_SID_AES_128 = 14;
pub const ALG_SID_AES_192 = 15;
pub const ALG_SID_AES_256 = 16;
pub const ALG_SID_AES = 17;
pub const ALG_SID_SKIPJACK = 10;
pub const ALG_SID_TEK = 11;
pub const CRYPT_MODE_CBCI = 6;
pub const CRYPT_MODE_CFBP = 7;
pub const CRYPT_MODE_OFBP = 8;
pub const CRYPT_MODE_CBCOFM = 9;
pub const CRYPT_MODE_CBCOFMI = 10;
pub const ALG_SID_RC2 = 2;
pub const ALG_SID_RC4 = 1;
pub const ALG_SID_SEAL = 2;
pub const ALG_SID_DH_SANDF = 1;
pub const ALG_SID_DH_EPHEM = 2;
pub const ALG_SID_AGREED_KEY_ANY = 3;
pub const ALG_SID_KEA = 4;
pub const ALG_SID_ECDH = 5;
pub const ALG_SID_ECDH_EPHEM = 6;
pub const ALG_SID_MD2 = 1;
pub const ALG_SID_MD4 = 2;
pub const ALG_SID_MD5 = 3;
pub const ALG_SID_SHA = 4;
pub const ALG_SID_SHA1 = 4;
pub const ALG_SID_MAC = 5;
pub const ALG_SID_RIPEMD = 6;
pub const ALG_SID_RIPEMD160 = 7;
pub const ALG_SID_SSL3SHAMD5 = 8;
pub const ALG_SID_HMAC = 9;
pub const ALG_SID_TLS1PRF = 10;
pub const ALG_SID_HASH_REPLACE_OWF = 11;
pub const ALG_SID_SHA_256 = 12;
pub const ALG_SID_SHA_384 = 13;
pub const ALG_SID_SHA_512 = 14;
pub const ALG_SID_SSL3_MASTER = 1;
pub const ALG_SID_SCHANNEL_MASTER_HASH = 2;
pub const ALG_SID_SCHANNEL_MAC_KEY = 3;
pub const ALG_SID_PCT1_MASTER = 4;
pub const ALG_SID_SSL2_MASTER = 5;
pub const ALG_SID_TLS1_MASTER = 6;
pub const ALG_SID_SCHANNEL_ENC_KEY = 7;
pub const ALG_SID_ECMQV = 1;
pub const ALG_SID_EXAMPLE = 80;
pub const SIGNATURE_RESOURCE_NUMBER = 666;
pub const CRYPT_VERIFYCONTEXT = 4026531840;
pub const CRYPT_NEWKEYSET = 8;
pub const CRYPT_DELETEKEYSET = 16;
pub const CRYPT_SILENT = 64;
pub const CRYPT_DEFAULT_CONTAINER_OPTIONAL = 128;
pub const CRYPT_UPDATE_KEY = 8;
pub const CRYPT_USER_PROTECTED_STRONG = 1048576;
pub const RSA1024BIT_KEY = 67108864;
pub const CRYPT_SERVER = 1024;
pub const KEY_LENGTH_MASK = 4294901760;
pub const CRYPT_DECRYPT_RSA_NO_PADDING_CHECK = 32;
pub const CRYPT_SECRETDIGEST = 1;
pub const CRYPT_OWF_REPL_LM_HASH = 1;
pub const CRYPT_LITTLE_ENDIAN = 1;
pub const CRYPT_NOHASHOID = 1;
pub const CRYPT_TYPE2_FORMAT = 2;
pub const CRYPT_X931_FORMAT = 4;
pub const CRYPT_MACHINE_DEFAULT = 1;
pub const CRYPT_USER_DEFAULT = 2;
pub const CRYPT_DELETE_DEFAULT = 4;
pub const SIMPLEBLOB = 1;
pub const PUBLICKEYBLOB = 6;
pub const PRIVATEKEYBLOB = 7;
pub const PLAINTEXTKEYBLOB = 8;
pub const OPAQUEKEYBLOB = 9;
pub const PUBLICKEYBLOBEX = 10;
pub const SYMMETRICWRAPKEYBLOB = 11;
pub const KEYSTATEBLOB = 12;
pub const CRYPT_USERDATA = 1;
pub const KP_IV = 1;
pub const KP_PADDING = 3;
pub const KP_MODE = 4;
pub const KP_MODE_BITS = 5;
pub const KP_P = 11;
pub const KP_G = 12;
pub const KP_Q = 13;
pub const KP_X = 14;
pub const KP_Y = 15;
pub const KP_RA = 16;
pub const KP_RB = 17;
pub const KP_INFO = 18;
pub const KP_EFFECTIVE_KEYLEN = 19;
pub const KP_SCHANNEL_ALG = 20;
pub const KP_CLIENT_RANDOM = 21;
pub const KP_SERVER_RANDOM = 22;
pub const KP_RP = 23;
pub const KP_PRECOMP_MD5 = 24;
pub const KP_PRECOMP_SHA = 25;
pub const KP_CLEAR_KEY = 27;
pub const KP_PUB_EX_LEN = 28;
pub const KP_PUB_EX_VAL = 29;
pub const KP_KEYVAL = 30;
pub const KP_ADMIN_PIN = 31;
pub const KP_KEYEXCHANGE_PIN = 32;
pub const KP_SIGNATURE_PIN = 33;
pub const KP_PREHASH = 34;
pub const KP_ROUNDS = 35;
pub const KP_OAEP_PARAMS = 36;
pub const KP_CMS_KEY_INFO = 37;
pub const KP_CMS_DH_KEY_INFO = 38;
pub const KP_PUB_PARAMS = 39;
pub const KP_VERIFY_PARAMS = 40;
pub const KP_HIGHEST_VERSION = 41;
pub const KP_PIN_ID = 43;
pub const KP_PIN_INFO = 44;
pub const PKCS5_PADDING = 1;
pub const RANDOM_PADDING = 2;
pub const ZERO_PADDING = 3;
pub const CRYPT_MODE_CBC = 1;
pub const CRYPT_MODE_ECB = 2;
pub const CRYPT_MODE_OFB = 3;
pub const CRYPT_MODE_CFB = 4;
pub const CRYPT_MODE_CTS = 5;
pub const CRYPT_ENCRYPT = 1;
pub const CRYPT_DECRYPT = 2;
pub const CRYPT_EXPORT = 4;
pub const CRYPT_READ = 8;
pub const CRYPT_WRITE = 16;
pub const CRYPT_MAC = 32;
pub const CRYPT_EXPORT_KEY = 64;
pub const CRYPT_IMPORT_KEY = 128;
pub const CRYPT_ARCHIVE = 256;
pub const HP_ALGID = 1;
pub const HP_HASHSIZE = 4;
pub const HP_TLS1PRF_LABEL = 6;
pub const HP_TLS1PRF_SEED = 7;
pub const CRYPT_FAILED = 0;
pub const CRYPT_SUCCEED = 1;
pub const PP_ENUMALGS = 1;
pub const PP_ENUMCONTAINERS = 2;
pub const PP_IMPTYPE = 3;
pub const PP_NAME = 4;
pub const PP_VERSION = 5;
pub const PP_CONTAINER = 6;
pub const PP_CHANGE_PASSWORD = 7;
pub const PP_CERTCHAIN = 9;
pub const PP_KEY_TYPE_SUBTYPE = 10;
pub const PP_PROVTYPE = 16;
pub const PP_KEYSTORAGE = 17;
pub const PP_APPLI_CERT = 18;
pub const PP_SYM_KEYSIZE = 19;
pub const PP_SESSION_KEYSIZE = 20;
pub const PP_ENUMALGS_EX = 22;
pub const PP_ENUMMANDROOTS = 25;
pub const PP_ENUMELECTROOTS = 26;
pub const PP_KEYSET_TYPE = 27;
pub const PP_ADMIN_PIN = 31;
pub const PP_SIG_KEYSIZE_INC = 34;
pub const PP_KEYX_KEYSIZE_INC = 35;
pub const PP_UNIQUE_CONTAINER = 36;
pub const PP_SGC_INFO = 37;
pub const PP_KEYSPEC = 39;
pub const PP_ENUMEX_SIGNING_PROT = 40;
pub const PP_CRYPT_COUNT_KEY_USE = 41;
pub const PP_SMARTCARD_GUID = 45;
pub const PP_SMARTCARD_READER_ICON = 47;
pub const CRYPT_FIRST = 1;
pub const CRYPT_NEXT = 2;
pub const CRYPT_SGC_ENUM = 4;
pub const CRYPT_IMPL_HARDWARE = 1;
pub const CRYPT_IMPL_SOFTWARE = 2;
pub const CRYPT_IMPL_MIXED = 3;
pub const CRYPT_IMPL_UNKNOWN = 4;
pub const CRYPT_IMPL_REMOVABLE = 8;
pub const CRYPT_SEC_DESCR = 1;
pub const CRYPT_PSTORE = 2;
pub const CRYPT_UI_PROMPT = 4;
pub const CRYPT_FLAG_PCT1 = 1;
pub const CRYPT_FLAG_SSL2 = 2;
pub const CRYPT_FLAG_SSL3 = 4;
pub const CRYPT_FLAG_TLS1 = 8;
pub const CRYPT_FLAG_IPSEC = 16;
pub const CRYPT_FLAG_SIGNING = 32;
pub const CRYPT_SGC = 1;
pub const CRYPT_FASTSGC = 2;
pub const PP_CONTEXT_INFO = 11;
pub const PP_DISMISS_PIN_UI_SEC = 49;
pub const PP_IS_PFX_EPHEMERAL = 50;
pub const PROV_RSA_FULL = 1;
pub const PROV_RSA_SIG = 2;
pub const PROV_DSS = 3;
pub const PROV_FORTEZZA = 4;
pub const PROV_MS_EXCHANGE = 5;
pub const PROV_SSL = 6;
pub const PROV_RSA_SCHANNEL = 12;
pub const PROV_DSS_DH = 13;
pub const PROV_EC_ECDSA_SIG = 14;
pub const PROV_EC_ECNRA_SIG = 15;
pub const PROV_EC_ECDSA_FULL = 16;
pub const PROV_EC_ECNRA_FULL = 17;
pub const PROV_DH_SCHANNEL = 18;
pub const PROV_SPYRUS_LYNKS = 20;
pub const PROV_RNG = 21;
pub const PROV_INTEL_SEC = 22;
pub const PROV_REPLACE_OWF = 23;
pub const PROV_RSA_AES = 24;
pub const PROV_STT_MER = 7;
pub const PROV_STT_ACQ = 8;
pub const PROV_STT_BRND = 9;
pub const PROV_STT_ROOT = 10;
pub const PROV_STT_ISS = 11;
pub const MAXUIDLEN = 64;
pub const cPRIV_KEY_CACHE_MAX_ITEMS_DEFAULT = 20;
pub const cPRIV_KEY_CACHE_PURGE_INTERVAL_SECONDS_DEFAULT = 86400;
pub const CUR_BLOB_VERSION = 2;
pub const SCHANNEL_MAC_KEY = 0;
pub const SCHANNEL_ENC_KEY = 1;
pub const INTERNATIONAL_USAGE = 1;
pub const CERT_RDN_TYPE_MASK = 255;
pub const CERT_RDN_FLAGS_MASK = 4278190080;
pub const CERT_RDN_ENABLE_T61_UNICODE_FLAG = 2147483648;
pub const CERT_RDN_ENABLE_UTF8_UNICODE_FLAG = 536870912;
pub const CERT_RDN_FORCE_UTF8_UNICODE_FLAG = 268435456;
pub const CERT_RDN_DISABLE_CHECK_TYPE_FLAG = 1073741824;
pub const CERT_RDN_DISABLE_IE4_UTF8_FLAG = 16777216;
pub const CERT_RDN_ENABLE_PUNYCODE_FLAG = 33554432;
pub const CRYPT_ECC_PRIVATE_KEY_INFO_v1 = 1;
pub const CERT_V1 = 0;
pub const CERT_V2 = 1;
pub const CERT_V3 = 2;
pub const CERT_INFO_VERSION_FLAG = 1;
pub const CERT_INFO_SERIAL_NUMBER_FLAG = 2;
pub const CERT_INFO_SIGNATURE_ALGORITHM_FLAG = 3;
pub const CERT_INFO_ISSUER_FLAG = 4;
pub const CERT_INFO_NOT_BEFORE_FLAG = 5;
pub const CERT_INFO_NOT_AFTER_FLAG = 6;
pub const CERT_INFO_SUBJECT_FLAG = 7;
pub const CERT_INFO_SUBJECT_PUBLIC_KEY_INFO_FLAG = 8;
pub const CERT_INFO_ISSUER_UNIQUE_ID_FLAG = 9;
pub const CERT_INFO_SUBJECT_UNIQUE_ID_FLAG = 10;
pub const CERT_INFO_EXTENSION_FLAG = 11;
pub const CRL_V1 = 0;
pub const CRL_V2 = 1;
pub const CERT_BUNDLE_CERTIFICATE = 0;
pub const CERT_BUNDLE_CRL = 1;
pub const CERT_REQUEST_V1 = 0;
pub const CERT_KEYGEN_REQUEST_V1 = 0;
pub const CTL_V1 = 0;
pub const CERT_ENCODING_TYPE_MASK = 65535;
pub const CMSG_ENCODING_TYPE_MASK = 4294901760;
pub const CRYPT_ASN_ENCODING = 1;
pub const CRYPT_NDR_ENCODING = 2;
pub const X509_NDR_ENCODING = 2;
pub const PKCS_7_NDR_ENCODING = 131072;
pub const CRYPT_FORMAT_STR_MULTI_LINE = 1;
pub const CRYPT_FORMAT_STR_NO_HEX = 16;
pub const CRYPT_FORMAT_SIMPLE = 1;
pub const CRYPT_FORMAT_X509 = 2;
pub const CRYPT_FORMAT_OID = 4;
pub const CRYPT_FORMAT_RDN_SEMICOLON = 256;
pub const CRYPT_FORMAT_RDN_CRLF = 512;
pub const CRYPT_FORMAT_RDN_UNQUOTE = 1024;
pub const CRYPT_FORMAT_RDN_REVERSE = 2048;
pub const CRYPT_FORMAT_COMMA = 4096;
pub const CRYPT_FORMAT_SEMICOLON = 256;
pub const CRYPT_FORMAT_CRLF = 512;
pub const CRYPT_ENCODE_NO_SIGNATURE_BYTE_REVERSAL_FLAG = 8;
pub const CRYPT_UNICODE_NAME_ENCODE_FORCE_UTF8_UNICODE_FLAG = 268435456;
pub const CRYPT_SORTED_CTL_ENCODE_HASHED_SUBJECT_IDENTIFIER_FLAG = 65536;
pub const CRYPT_ENCODE_ENABLE_UTF8PERCENT_FLAG = 262144;
pub const CRYPT_DECODE_NOCOPY_FLAG = 1;
pub const CRYPT_DECODE_TO_BE_SIGNED_FLAG = 2;
pub const CRYPT_DECODE_SHARE_OID_STRING_FLAG = 4;
pub const CRYPT_DECODE_NO_SIGNATURE_BYTE_REVERSAL_FLAG = 8;
pub const CRYPT_DECODE_ALLOC_FLAG = 32768;
pub const CRYPT_UNICODE_NAME_DECODE_DISABLE_IE4_UTF8_FLAG = 16777216;
pub const CRYPT_DECODE_ENABLE_PUNYCODE_FLAG = 33554432;
pub const CRYPT_DECODE_ENABLE_UTF8PERCENT_FLAG = 67108864;
pub const CRYPT_ENCODE_DECODE_NONE = 0;
pub const X509_CERT = 1;
pub const X509_CERT_TO_BE_SIGNED = 2;
pub const X509_CERT_CRL_TO_BE_SIGNED = 3;
pub const X509_CERT_REQUEST_TO_BE_SIGNED = 4;
pub const X509_NAME_VALUE = 6;
pub const X509_PUBLIC_KEY_INFO = 8;
pub const X509_EXTENSIONS = 5;
pub const X509_NAME = 7;
pub const WINCRYPT_X509_EXTENSIONS = 5;
pub const WINCRYPT_X509_NAME = 7;
pub const X509_AUTHORITY_KEY_ID = 9;
pub const X509_KEY_ATTRIBUTES = 10;
pub const X509_KEY_USAGE_RESTRICTION = 11;
pub const X509_ALTERNATE_NAME = 12;
pub const X509_BASIC_CONSTRAINTS = 13;
pub const X509_KEY_USAGE = 14;
pub const X509_BASIC_CONSTRAINTS2 = 15;
pub const X509_CERT_POLICIES = 16;
pub const PKCS_UTC_TIME = 17;
pub const PKCS_TIME_REQUEST = 18;
pub const RSA_CSP_PUBLICKEYBLOB = 19;
pub const X509_UNICODE_NAME = 20;
pub const X509_KEYGEN_REQUEST_TO_BE_SIGNED = 21;
pub const PKCS_ATTRIBUTE = 22;
pub const PKCS_CONTENT_INFO_SEQUENCE_OF_ANY = 23;
pub const X509_UNICODE_NAME_VALUE = 24;
pub const X509_ANY_STRING = 6;
pub const X509_UNICODE_ANY_STRING = 24;
pub const X509_OCTET_STRING = 25;
pub const X509_BITS = 26;
pub const X509_INTEGER = 27;
pub const X509_MULTI_BYTE_INTEGER = 28;
pub const X509_ENUMERATED = 29;
pub const X509_CHOICE_OF_TIME = 30;
pub const X509_AUTHORITY_KEY_ID2 = 31;
pub const X509_AUTHORITY_INFO_ACCESS = 32;
pub const X509_SUBJECT_INFO_ACCESS = 32;
pub const X509_CRL_REASON_CODE = 29;
pub const PKCS_CONTENT_INFO = 33;
pub const X509_SEQUENCE_OF_ANY = 34;
pub const X509_CRL_DIST_POINTS = 35;
pub const X509_ENHANCED_KEY_USAGE = 36;
pub const PKCS_CTL = 37;
pub const X509_MULTI_BYTE_UINT = 38;
pub const X509_DSS_PUBLICKEY = 38;
pub const X509_DSS_PARAMETERS = 39;
pub const X509_DSS_SIGNATURE = 40;
pub const PKCS_RC2_CBC_PARAMETERS = 41;
pub const PKCS_SMIME_CAPABILITIES = 42;
pub const X509_QC_STATEMENTS_EXT = 42;
pub const PKCS_RSA_PRIVATE_KEY = 43;
pub const PKCS_PRIVATE_KEY_INFO = 44;
pub const PKCS_ENCRYPTED_PRIVATE_KEY_INFO = 45;
pub const X509_PKIX_POLICY_QUALIFIER_USERNOTICE = 46;
pub const X509_DH_PUBLICKEY = 38;
pub const X509_DH_PARAMETERS = 47;
pub const PKCS_ATTRIBUTES = 48;
pub const PKCS_SORTED_CTL = 49;
pub const X509_ECC_SIGNATURE = 47;
pub const X942_DH_PARAMETERS = 50;
pub const X509_BITS_WITHOUT_TRAILING_ZEROES = 51;
pub const X942_OTHER_INFO = 52;
pub const X509_CERT_PAIR = 53;
pub const X509_ISSUING_DIST_POINT = 54;
pub const X509_NAME_CONSTRAINTS = 55;
pub const X509_POLICY_MAPPINGS = 56;
pub const X509_POLICY_CONSTRAINTS = 57;
pub const X509_CROSS_CERT_DIST_POINTS = 58;
pub const CMC_DATA = 59;
pub const CMC_RESPONSE = 60;
pub const CMC_STATUS = 61;
pub const CMC_ADD_EXTENSIONS = 62;
pub const CMC_ADD_ATTRIBUTES = 63;
pub const X509_CERTIFICATE_TEMPLATE = 64;
pub const OCSP_SIGNED_REQUEST = 65;
pub const OCSP_BASIC_SIGNED_RESPONSE = 68;
pub const OCSP_BASIC_RESPONSE = 69;
pub const OCSP_REQUEST = 66;
pub const OCSP_RESPONSE = 67;
pub const WINCRYPT_OCSP_REQUEST = 66;
pub const WINCRYPT_OCSP_RESPONSE = 67;
pub const X509_LOGOTYPE_EXT = 70;
pub const X509_BIOMETRIC_EXT = 71;
pub const CNG_RSA_PUBLIC_KEY_BLOB = 72;
pub const X509_OBJECT_IDENTIFIER = 73;
pub const X509_ALGORITHM_IDENTIFIER = 74;
pub const PKCS_RSA_SSA_PSS_PARAMETERS = 75;
pub const PKCS_RSAES_OAEP_PARAMETERS = 76;
pub const ECC_CMS_SHARED_INFO = 77;
pub const TIMESTAMP_REQUEST = 78;
pub const TIMESTAMP_RESPONSE = 79;
pub const TIMESTAMP_INFO = 80;
pub const X509_CERT_BUNDLE = 81;
pub const X509_ECC_PRIVATE_KEY = 82;
pub const CNG_RSA_PRIVATE_KEY_BLOB = 83;
pub const X509_SUBJECT_DIR_ATTRS = 84;
pub const X509_ECC_PARAMETERS = 85;
pub const PKCS7_SIGNER_INFO = 500;
pub const WINCRYPT_PKCS7_SIGNER_INFO = 500;
pub const CMS_SIGNER_INFO = 501;
pub const SITE_PIN_RULES_ALL_SUBDOMAINS_FLAG = 1;
pub const CERT_ROOT_PROGRAM_FLAG_OU = 16;
pub const CERT_ROOT_PROGRAM_FLAG_ADDRESS = 8;
pub const CERT_UNICODE_RDN_ERR_INDEX_MASK = 1023;
pub const CERT_UNICODE_RDN_ERR_INDEX_SHIFT = 22;
pub const CERT_UNICODE_ATTR_ERR_INDEX_MASK = 63;
pub const CERT_UNICODE_ATTR_ERR_INDEX_SHIFT = 16;
pub const CERT_UNICODE_VALUE_ERR_INDEX_MASK = 65535;
pub const CERT_UNICODE_VALUE_ERR_INDEX_SHIFT = 0;
pub const CERT_DIGITAL_SIGNATURE_KEY_USAGE = 128;
pub const CERT_NON_REPUDIATION_KEY_USAGE = 64;
pub const CERT_KEY_ENCIPHERMENT_KEY_USAGE = 32;
pub const CERT_DATA_ENCIPHERMENT_KEY_USAGE = 16;
pub const CERT_KEY_AGREEMENT_KEY_USAGE = 8;
pub const CERT_KEY_CERT_SIGN_KEY_USAGE = 4;
pub const CERT_OFFLINE_CRL_SIGN_KEY_USAGE = 2;
pub const CERT_CRL_SIGN_KEY_USAGE = 2;
pub const CERT_ENCIPHER_ONLY_KEY_USAGE = 1;
pub const CERT_DECIPHER_ONLY_KEY_USAGE = 128;
pub const CERT_ALT_NAME_X400_ADDRESS = 4;
pub const CERT_ALT_NAME_EDI_PARTY_NAME = 6;
pub const CERT_ALT_NAME_ENTRY_ERR_INDEX_MASK = 255;
pub const CERT_ALT_NAME_ENTRY_ERR_INDEX_SHIFT = 16;
pub const CERT_ALT_NAME_VALUE_ERR_INDEX_MASK = 65535;
pub const CERT_ALT_NAME_VALUE_ERR_INDEX_SHIFT = 0;
pub const CERT_CA_SUBJECT_FLAG = 128;
pub const CERT_END_ENTITY_SUBJECT_FLAG = 64;
pub const CRL_REASON_PRIVILEGE_WITHDRAWN = 9;
pub const CRL_REASON_AA_COMPROMISE = 10;
pub const CRL_DIST_POINT_NO_NAME = 0;
pub const CRL_DIST_POINT_FULL_NAME = 1;
pub const CRL_DIST_POINT_ISSUER_RDN_NAME = 2;
pub const CRL_REASON_UNUSED_FLAG = 128;
pub const CRL_REASON_KEY_COMPROMISE_FLAG = 64;
pub const CRL_REASON_CA_COMPROMISE_FLAG = 32;
pub const CRL_REASON_AFFILIATION_CHANGED_FLAG = 16;
pub const CRL_REASON_SUPERSEDED_FLAG = 8;
pub const CRL_REASON_CESSATION_OF_OPERATION_FLAG = 4;
pub const CRL_REASON_CERTIFICATE_HOLD_FLAG = 2;
pub const CRL_REASON_PRIVILEGE_WITHDRAWN_FLAG = 1;
pub const CRL_REASON_AA_COMPROMISE_FLAG = 128;
pub const CRL_DIST_POINT_ERR_INDEX_MASK = 127;
pub const CRL_DIST_POINT_ERR_INDEX_SHIFT = 24;
pub const CRL_DIST_POINT_ERR_CRL_ISSUER_BIT = -2147483648;
pub const CROSS_CERT_DIST_POINT_ERR_INDEX_MASK = 255;
pub const CROSS_CERT_DIST_POINT_ERR_INDEX_SHIFT = 24;
pub const CERT_EXCLUDED_SUBTREE_BIT = -2147483648;
pub const SORTED_CTL_EXT_HASHED_SUBJECT_IDENTIFIER_FLAG = 1;
pub const CERT_DSS_R_LEN = 20;
pub const CERT_DSS_S_LEN = 20;
pub const CRYPT_X942_COUNTER_BYTE_LENGTH = 4;
pub const CRYPT_X942_KEY_LENGTH_BYTE_LENGTH = 4;
pub const CRYPT_ECC_CMS_SHARED_INFO_SUPPPUBINFO_BYTE_LENGTH = 4;
pub const CRYPT_RC2_40BIT_VERSION = 160;
pub const CRYPT_RC2_56BIT_VERSION = 52;
pub const CRYPT_RC2_64BIT_VERSION = 120;
pub const CRYPT_RC2_128BIT_VERSION = 58;
pub const PKCS_RSA_SSA_PSS_TRAILER_FIELD_BC = 1;
pub const NETSCAPE_SSL_CLIENT_AUTH_CERT_TYPE = 128;
pub const NETSCAPE_SSL_SERVER_AUTH_CERT_TYPE = 64;
pub const NETSCAPE_SMIME_CERT_TYPE = 32;
pub const NETSCAPE_SIGN_CERT_TYPE = 16;
pub const NETSCAPE_SSL_CA_CERT_TYPE = 4;
pub const NETSCAPE_SMIME_CA_CERT_TYPE = 2;
pub const NETSCAPE_SIGN_CA_CERT_TYPE = 1;
pub const CMC_TAGGED_CERT_REQUEST_CHOICE = 1;
pub const CMC_OTHER_INFO_NO_CHOICE = 0;
pub const CMC_OTHER_INFO_FAIL_CHOICE = 1;
pub const CMC_OTHER_INFO_PEND_CHOICE = 2;
pub const CMC_STATUS_SUCCESS = 0;
pub const CMC_STATUS_FAILED = 2;
pub const CMC_STATUS_PENDING = 3;
pub const CMC_STATUS_NO_SUPPORT = 4;
pub const CMC_STATUS_CONFIRM_REQUIRED = 5;
pub const CMC_FAIL_BAD_ALG = 0;
pub const CMC_FAIL_BAD_MESSAGE_CHECK = 1;
pub const CMC_FAIL_BAD_REQUEST = 2;
pub const CMC_FAIL_BAD_TIME = 3;
pub const CMC_FAIL_BAD_CERT_ID = 4;
pub const CMC_FAIL_UNSUPORTED_EXT = 5;
pub const CMC_FAIL_MUST_ARCHIVE_KEYS = 6;
pub const CMC_FAIL_BAD_IDENTITY = 7;
pub const CMC_FAIL_POP_REQUIRED = 8;
pub const CMC_FAIL_POP_FAILED = 9;
pub const CMC_FAIL_NO_KEY_REUSE = 10;
pub const CMC_FAIL_INTERNAL_CA_ERROR = 11;
pub const CMC_FAIL_TRY_LATER = 12;
pub const CERT_BIOMETRIC_PICTURE_TYPE = 0;
pub const CERT_BIOMETRIC_SIGNATURE_TYPE = 1;
pub const OCSP_REQUEST_V1 = 0;
pub const OCSP_SUCCESSFUL_RESPONSE = 0;
pub const OCSP_MALFORMED_REQUEST_RESPONSE = 1;
pub const OCSP_INTERNAL_ERROR_RESPONSE = 2;
pub const OCSP_TRY_LATER_RESPONSE = 3;
pub const OCSP_SIG_REQUIRED_RESPONSE = 5;
pub const OCSP_UNAUTHORIZED_RESPONSE = 6;
pub const OCSP_BASIC_GOOD_CERT_STATUS = 0;
pub const OCSP_BASIC_REVOKED_CERT_STATUS = 1;
pub const OCSP_BASIC_UNKNOWN_CERT_STATUS = 2;
pub const OCSP_BASIC_RESPONSE_V1 = 0;
pub const OCSP_BASIC_BY_NAME_RESPONDER_ID = 1;
pub const OCSP_BASIC_BY_KEY_RESPONDER_ID = 2;
pub const CRYPT_INSTALL_OID_FUNC_BEFORE_FLAG = 1;
pub const CRYPT_GET_INSTALLED_OID_FUNC_FLAG = 1;
pub const CRYPT_REGISTER_FIRST_INDEX = 0;
pub const CRYPT_REGISTER_LAST_INDEX = 4294967295;
pub const CRYPT_MATCH_ANY_ENCODING_TYPE = 4294967295;
pub const CALG_OID_INFO_CNG_ONLY = 4294967295;
pub const CALG_OID_INFO_PARAMETERS = 4294967294;
pub const CALG_OID_INFO_PQ = 4294967293;
pub const CRYPT_HASH_ALG_OID_GROUP_ID = 1;
pub const CRYPT_ENCRYPT_ALG_OID_GROUP_ID = 2;
pub const CRYPT_PUBKEY_ALG_OID_GROUP_ID = 3;
pub const CRYPT_SIGN_ALG_OID_GROUP_ID = 4;
pub const CRYPT_RDN_ATTR_OID_GROUP_ID = 5;
pub const CRYPT_EXT_OR_ATTR_OID_GROUP_ID = 6;
pub const CRYPT_ENHKEY_USAGE_OID_GROUP_ID = 7;
pub const CRYPT_POLICY_OID_GROUP_ID = 8;
pub const CRYPT_TEMPLATE_OID_GROUP_ID = 9;
pub const CRYPT_KDF_OID_GROUP_ID = 10;
pub const CRYPT_LAST_OID_GROUP_ID = 10;
pub const CRYPT_FIRST_ALG_OID_GROUP_ID = 1;
pub const CRYPT_LAST_ALG_OID_GROUP_ID = 4;
pub const CRYPT_OID_PQ_EXTRA_INFO_FLAGS_INDEX = 0;
pub const CRYPT_OID_PQ_EXTRA_INFO_PUBLIC_MAGIC_INDEX = 1;
pub const CRYPT_OID_PQ_EXTRA_INFO_PRIVATE_MAGIC_INDEX = 2;
pub const CRYPT_OID_PQ_EXTRA_INFO_PUBLIC_KEY_LENGTH_INDEX = 3;
pub const CRYPT_OID_PQ_EXTRA_INFO_PRIVATE_KEY_LENGTH_INDEX = 4;
pub const CRYPT_OID_PQ_EXTRA_INFO_SIGNATURE_LENGTH_INDEX = 5;
pub const CRYPT_OID_PQ_EXTRA_INFO_MAX_LENGTH = 6;
pub const CRYPT_OID_INHIBIT_SIGNATURE_FORMAT_FLAG = 1;
pub const CRYPT_OID_USE_PUBKEY_PARA_FOR_PKCS7_FLAG = 2;
pub const CRYPT_OID_NO_NULL_ALGORITHM_PARA_FLAG = 4;
pub const CRYPT_OID_PUBKEY_SIGN_ONLY_FLAG = 2147483648;
pub const CRYPT_OID_PUBKEY_ENCRYPT_ONLY_FLAG = 1073741824;
pub const CRYPT_OID_USE_CURVE_NAME_FOR_ENCODE_FLAG = 536870912;
pub const CRYPT_OID_USE_CURVE_PARAMETERS_FOR_ENCODE_FLAG = 268435456;
pub const CRYPT_OID_PUBKEY_PURE_ONLY_FLAG = 134217728;
pub const CRYPT_OID_PUBKEY_PREHASH_ONLY_FLAG = 67108864;
pub const CRYPT_OID_INFO_OID_KEY = 1;
pub const CRYPT_OID_INFO_NAME_KEY = 2;
pub const CRYPT_OID_INFO_ALGID_KEY = 3;
pub const CRYPT_OID_INFO_SIGN_KEY = 4;
pub const CRYPT_OID_INFO_CNG_ALGID_KEY = 5;
pub const CRYPT_OID_INFO_CNG_SIGN_KEY = 6;
pub const CRYPT_OID_INFO_OID_KEY_FLAGS_MASK = 4294901760;
pub const CRYPT_OID_INFO_PUBKEY_PURE_KEY_FLAG = 134217728;
pub const CRYPT_OID_INFO_PUBKEY_PREHASH_KEY_FLAG = 67108864;
pub const CRYPT_OID_DISABLE_SEARCH_DS_FLAG = 2147483648;
pub const CRYPT_OID_PREFER_CNG_ALGID_FLAG = 1073741824;
pub const CRYPT_OID_INFO_OID_GROUP_BIT_LEN_MASK = 268369920;
pub const CRYPT_OID_INFO_OID_GROUP_BIT_LEN_SHIFT = 16;
pub const CRYPT_INSTALL_OID_INFO_BEFORE_FLAG = 1;
pub const CRYPT_LOCALIZED_NAME_ENCODING_TYPE = 0;
pub const CERT_STRONG_SIGN_SERIALIZED_INFO_CHOICE = 1;
pub const CERT_STRONG_SIGN_OID_INFO_CHOICE = 2;
pub const CMSG_ENCRYPTED = 6;
pub const CMSG_MAIL_LIST_HANDLE_KEY_CHOICE = 1;
pub const CMSG_KEY_TRANS_RECIPIENT = 1;
pub const CMSG_KEY_AGREE_RECIPIENT = 2;
pub const CMSG_MAIL_LIST_RECIPIENT = 3;
pub const CMSG_SP3_COMPATIBLE_ENCRYPT_FLAG = 2147483648;
pub const CMSG_RC4_NO_SALT_FLAG = 1073741824;
pub const CMSG_INDEFINITE_LENGTH = 4294967295;
pub const CMSG_BARE_CONTENT_FLAG = 1;
pub const CMSG_LENGTH_ONLY_FLAG = 2;
pub const CMSG_DETACHED_FLAG = 4;
pub const CMSG_AUTHENTICATED_ATTRIBUTES_FLAG = 8;
pub const CMSG_CONTENTS_OCTETS_FLAG = 16;
pub const CMSG_MAX_LENGTH_FLAG = 32;
pub const CMSG_CMS_ENCAPSULATED_CONTENT_FLAG = 64;
pub const CMSG_SIGNED_DATA_NO_SIGN_FLAG = 128;
pub const CMSG_CRYPT_RELEASE_CONTEXT_FLAG = 32768;
pub const CMSG_TYPE_PARAM = 1;
pub const CMSG_CONTENT_PARAM = 2;
pub const CMSG_BARE_CONTENT_PARAM = 3;
pub const CMSG_INNER_CONTENT_TYPE_PARAM = 4;
pub const CMSG_SIGNER_COUNT_PARAM = 5;
pub const CMSG_SIGNER_INFO_PARAM = 6;
pub const CMSG_SIGNER_CERT_INFO_PARAM = 7;
pub const CMSG_SIGNER_HASH_ALGORITHM_PARAM = 8;
pub const CMSG_SIGNER_AUTH_ATTR_PARAM = 9;
pub const CMSG_SIGNER_UNAUTH_ATTR_PARAM = 10;
pub const CMSG_CERT_COUNT_PARAM = 11;
pub const CMSG_CERT_PARAM = 12;
pub const CMSG_CRL_COUNT_PARAM = 13;
pub const CMSG_CRL_PARAM = 14;
pub const CMSG_ENVELOPE_ALGORITHM_PARAM = 15;
pub const CMSG_RECIPIENT_COUNT_PARAM = 17;
pub const CMSG_RECIPIENT_INDEX_PARAM = 18;
pub const CMSG_RECIPIENT_INFO_PARAM = 19;
pub const CMSG_HASH_ALGORITHM_PARAM = 20;
pub const CMSG_HASH_DATA_PARAM = 21;
pub const CMSG_COMPUTED_HASH_PARAM = 22;
pub const CMSG_ENCRYPT_PARAM = 26;
pub const CMSG_ENCRYPTED_DIGEST = 27;
pub const CMSG_ENCODED_SIGNER = 28;
pub const CMSG_ENCODED_MESSAGE = 29;
pub const CMSG_VERSION_PARAM = 30;
pub const CMSG_ATTR_CERT_COUNT_PARAM = 31;
pub const CMSG_ATTR_CERT_PARAM = 32;
pub const CMSG_CMS_RECIPIENT_COUNT_PARAM = 33;
pub const CMSG_CMS_RECIPIENT_INDEX_PARAM = 34;
pub const CMSG_CMS_RECIPIENT_ENCRYPTED_KEY_INDEX_PARAM = 35;
pub const CMSG_CMS_RECIPIENT_INFO_PARAM = 36;
pub const CMSG_UNPROTECTED_ATTR_PARAM = 37;
pub const CMSG_SIGNER_CERT_ID_PARAM = 38;
pub const CMSG_CMS_SIGNER_INFO_PARAM = 39;
pub const CMSG_SIGNED_DATA_V1 = 1;
pub const CMSG_SIGNED_DATA_V3 = 3;
pub const CMSG_SIGNED_DATA_PKCS_1_5_VERSION = 1;
pub const CMSG_SIGNED_DATA_CMS_VERSION = 3;
pub const CMSG_SIGNER_INFO_V1 = 1;
pub const CMSG_SIGNER_INFO_V3 = 3;
pub const CMSG_SIGNER_INFO_PKCS_1_5_VERSION = 1;
pub const CMSG_SIGNER_INFO_CMS_VERSION = 3;
pub const CMSG_HASHED_DATA_V0 = 0;
pub const CMSG_HASHED_DATA_V2 = 2;
pub const CMSG_HASHED_DATA_PKCS_1_5_VERSION = 0;
pub const CMSG_HASHED_DATA_CMS_VERSION = 2;
pub const CMSG_ENVELOPED_DATA_V0 = 0;
pub const CMSG_ENVELOPED_DATA_V2 = 2;
pub const CMSG_ENVELOPED_DATA_PKCS_1_5_VERSION = 0;
pub const CMSG_ENVELOPED_DATA_CMS_VERSION = 2;
pub const CMSG_ENVELOPED_RECIPIENT_V0 = 0;
pub const CMSG_ENVELOPED_RECIPIENT_V2 = 2;
pub const CMSG_ENVELOPED_RECIPIENT_V3 = 3;
pub const CMSG_ENVELOPED_RECIPIENT_V4 = 4;
pub const CMSG_KEY_TRANS_PKCS_1_5_VERSION = 0;
pub const CMSG_KEY_TRANS_CMS_VERSION = 2;
pub const CMSG_KEY_AGREE_VERSION = 3;
pub const CMSG_MAIL_LIST_VERSION = 4;
pub const CMSG_CTRL_VERIFY_SIGNATURE = 1;
pub const CMSG_CTRL_DECRYPT = 2;
pub const CMSG_CTRL_VERIFY_HASH = 5;
pub const CMSG_CTRL_ADD_SIGNER = 6;
pub const CMSG_CTRL_DEL_SIGNER = 7;
pub const CMSG_CTRL_ADD_SIGNER_UNAUTH_ATTR = 8;
pub const CMSG_CTRL_DEL_SIGNER_UNAUTH_ATTR = 9;
pub const CMSG_CTRL_ADD_CERT = 10;
pub const CMSG_CTRL_DEL_CERT = 11;
pub const CMSG_CTRL_ADD_CRL = 12;
pub const CMSG_CTRL_DEL_CRL = 13;
pub const CMSG_CTRL_ADD_ATTR_CERT = 14;
pub const CMSG_CTRL_DEL_ATTR_CERT = 15;
pub const CMSG_CTRL_KEY_TRANS_DECRYPT = 16;
pub const CMSG_CTRL_KEY_AGREE_DECRYPT = 17;
pub const CMSG_CTRL_MAIL_LIST_DECRYPT = 18;
pub const CMSG_CTRL_VERIFY_SIGNATURE_EX = 19;
pub const CMSG_CTRL_ADD_CMS_SIGNER_INFO = 20;
pub const CMSG_CTRL_ENABLE_STRONG_SIGNATURE = 21;
pub const CMSG_VERIFY_SIGNER_PUBKEY = 1;
pub const CMSG_VERIFY_SIGNER_CERT = 2;
pub const CMSG_VERIFY_SIGNER_CHAIN = 3;
pub const CMSG_VERIFY_SIGNER_NULL = 4;
pub const CMSG_VERIFY_COUNTER_SIGN_ENABLE_STRONG_FLAG = 1;
pub const CMSG_DEFAULT_INSTALLABLE_FUNC_OID = 1;
pub const CMSG_CONTENT_ENCRYPT_PAD_ENCODED_LEN_FLAG = 1;
pub const CMSG_CONTENT_ENCRYPT_FREE_PARA_FLAG = 1;
pub const CMSG_CONTENT_ENCRYPT_FREE_OBJID_FLAG = 2;
pub const CMSG_CONTENT_ENCRYPT_RELEASE_CONTEXT_FLAG = 32768;
pub const CMSG_KEY_TRANS_ENCRYPT_FREE_PARA_FLAG = 1;
pub const CMSG_KEY_TRANS_ENCRYPT_FREE_OBJID_FLAG = 2;
pub const CMSG_KEY_AGREE_ENCRYPT_FREE_PARA_FLAG = 1;
pub const CMSG_KEY_AGREE_ENCRYPT_FREE_MATERIAL_FLAG = 2;
pub const CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_ALG_FLAG = 4;
pub const CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_PARA_FLAG = 8;
pub const CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_BITS_FLAG = 16;
pub const CMSG_KEY_AGREE_ENCRYPT_FREE_OBJID_FLAG = 32;
pub const CMSG_MAIL_LIST_ENCRYPT_FREE_PARA_FLAG = 1;
pub const CMSG_MAIL_LIST_ENCRYPT_FREE_OBJID_FLAG = 2;
pub const CERT_KEY_PROV_HANDLE_PROP_ID = 1;
pub const CERT_KEY_PROV_INFO_PROP_ID = 2;
pub const CERT_SHA1_HASH_PROP_ID = 3;
pub const CERT_MD5_HASH_PROP_ID = 4;
pub const CERT_HASH_PROP_ID = 3;
pub const CERT_KEY_CONTEXT_PROP_ID = 5;
pub const CERT_KEY_SPEC_PROP_ID = 6;
pub const CERT_IE30_RESERVED_PROP_ID = 7;
pub const CERT_PUBKEY_HASH_RESERVED_PROP_ID = 8;
pub const CERT_ENHKEY_USAGE_PROP_ID = 9;
pub const CERT_CTL_USAGE_PROP_ID = 9;
pub const CERT_NEXT_UPDATE_LOCATION_PROP_ID = 10;
pub const CERT_FRIENDLY_NAME_PROP_ID = 11;
pub const CERT_PVK_FILE_PROP_ID = 12;
pub const CERT_DESCRIPTION_PROP_ID = 13;
pub const CERT_ACCESS_STATE_PROP_ID = 14;
pub const CERT_SIGNATURE_HASH_PROP_ID = 15;
pub const CERT_SMART_CARD_DATA_PROP_ID = 16;
pub const CERT_EFS_PROP_ID = 17;
pub const CERT_FORTEZZA_DATA_PROP_ID = 18;
pub const CERT_ARCHIVED_PROP_ID = 19;
pub const CERT_KEY_IDENTIFIER_PROP_ID = 20;
pub const CERT_AUTO_ENROLL_PROP_ID = 21;
pub const CERT_PUBKEY_ALG_PARA_PROP_ID = 22;
pub const CERT_CROSS_CERT_DIST_POINTS_PROP_ID = 23;
pub const CERT_ISSUER_PUBLIC_KEY_MD5_HASH_PROP_ID = 24;
pub const CERT_SUBJECT_PUBLIC_KEY_MD5_HASH_PROP_ID = 25;
pub const CERT_ENROLLMENT_PROP_ID = 26;
pub const CERT_DATE_STAMP_PROP_ID = 27;
pub const CERT_ISSUER_SERIAL_NUMBER_MD5_HASH_PROP_ID = 28;
pub const CERT_SUBJECT_NAME_MD5_HASH_PROP_ID = 29;
pub const CERT_EXTENDED_ERROR_INFO_PROP_ID = 30;
pub const CERT_RENEWAL_PROP_ID = 64;
pub const CERT_ARCHIVED_KEY_HASH_PROP_ID = 65;
pub const CERT_AUTO_ENROLL_RETRY_PROP_ID = 66;
pub const CERT_AIA_URL_RETRIEVED_PROP_ID = 67;
pub const CERT_AUTHORITY_INFO_ACCESS_PROP_ID = 68;
pub const CERT_BACKED_UP_PROP_ID = 69;
pub const CERT_OCSP_RESPONSE_PROP_ID = 70;
pub const CERT_REQUEST_ORIGINATOR_PROP_ID = 71;
pub const CERT_SOURCE_LOCATION_PROP_ID = 72;
pub const CERT_SOURCE_URL_PROP_ID = 73;
pub const CERT_NEW_KEY_PROP_ID = 74;
pub const CERT_OCSP_CACHE_PREFIX_PROP_ID = 75;
pub const CERT_SMART_CARD_ROOT_INFO_PROP_ID = 76;
pub const CERT_NO_AUTO_EXPIRE_CHECK_PROP_ID = 77;
pub const CERT_NCRYPT_KEY_HANDLE_PROP_ID = 78;
pub const CERT_HCRYPTPROV_OR_NCRYPT_KEY_HANDLE_PROP_ID = 79;
pub const CERT_SUBJECT_INFO_ACCESS_PROP_ID = 80;
pub const CERT_CA_OCSP_AUTHORITY_INFO_ACCESS_PROP_ID = 81;
pub const CERT_CA_DISABLE_CRL_PROP_ID = 82;
pub const CERT_ROOT_PROGRAM_CERT_POLICIES_PROP_ID = 83;
pub const CERT_ROOT_PROGRAM_NAME_CONSTRAINTS_PROP_ID = 84;
pub const CERT_SUBJECT_OCSP_AUTHORITY_INFO_ACCESS_PROP_ID = 85;
pub const CERT_SUBJECT_DISABLE_CRL_PROP_ID = 86;
pub const CERT_CEP_PROP_ID = 87;
pub const CERT_SIGN_HASH_CNG_ALG_PROP_ID = 89;
pub const CERT_SCARD_PIN_ID_PROP_ID = 90;
pub const CERT_SCARD_PIN_INFO_PROP_ID = 91;
pub const CERT_SUBJECT_PUB_KEY_BIT_LENGTH_PROP_ID = 92;
pub const CERT_PUB_KEY_CNG_ALG_BIT_LENGTH_PROP_ID = 93;
pub const CERT_ISSUER_PUB_KEY_BIT_LENGTH_PROP_ID = 94;
pub const CERT_ISSUER_CHAIN_SIGN_HASH_CNG_ALG_PROP_ID = 95;
pub const CERT_ISSUER_CHAIN_PUB_KEY_CNG_ALG_BIT_LENGTH_PROP_ID = 96;
pub const CERT_NO_EXPIRE_NOTIFICATION_PROP_ID = 97;
pub const CERT_AUTH_ROOT_SHA256_HASH_PROP_ID = 98;
pub const CERT_NCRYPT_KEY_HANDLE_TRANSFER_PROP_ID = 99;
pub const CERT_HCRYPTPROV_TRANSFER_PROP_ID = 100;
pub const CERT_SMART_CARD_READER_PROP_ID = 101;
pub const CERT_SEND_AS_TRUSTED_ISSUER_PROP_ID = 102;
pub const CERT_KEY_REPAIR_ATTEMPTED_PROP_ID = 103;
pub const CERT_DISALLOWED_FILETIME_PROP_ID = 104;
pub const CERT_ROOT_PROGRAM_CHAIN_POLICIES_PROP_ID = 105;
pub const CERT_SMART_CARD_READER_NON_REMOVABLE_PROP_ID = 106;
pub const CERT_SHA256_HASH_PROP_ID = 107;
pub const CERT_SCEP_SERVER_CERTS_PROP_ID = 108;
pub const CERT_SCEP_RA_SIGNATURE_CERT_PROP_ID = 109;
pub const CERT_SCEP_RA_ENCRYPTION_CERT_PROP_ID = 110;
pub const CERT_SCEP_CA_CERT_PROP_ID = 111;
pub const CERT_SCEP_SIGNER_CERT_PROP_ID = 112;
pub const CERT_SCEP_NONCE_PROP_ID = 113;
pub const CERT_SCEP_ENCRYPT_HASH_CNG_ALG_PROP_ID = 114;
pub const CERT_SCEP_FLAGS_PROP_ID = 115;
pub const CERT_SCEP_GUID_PROP_ID = 116;
pub const CERT_SERIALIZABLE_KEY_CONTEXT_PROP_ID = 117;
pub const CERT_ISOLATED_KEY_PROP_ID = 118;
pub const CERT_SERIAL_CHAIN_PROP_ID = 119;
pub const CERT_KEY_CLASSIFICATION_PROP_ID = 120;
pub const CERT_OCSP_MUST_STAPLE_PROP_ID = 121;
pub const CERT_DISALLOWED_ENHKEY_USAGE_PROP_ID = 122;
pub const CERT_NONCOMPLIANT_ROOT_URL_PROP_ID = 123;
pub const CERT_PIN_SHA256_HASH_PROP_ID = 124;
pub const CERT_CLR_DELETE_KEY_PROP_ID = 125;
pub const CERT_NOT_BEFORE_FILETIME_PROP_ID = 126;
pub const CERT_NOT_BEFORE_ENHKEY_USAGE_PROP_ID = 127;
pub const CERT_DISALLOWED_CA_FILETIME_PROP_ID = 128;
pub const CERT_SHA1_SHA256_HASH_PROP_ID = 129;
pub const CERT_FIRST_RESERVED_PROP_ID = 130;
pub const CERT_LAST_RESERVED_PROP_ID = 32767;
pub const CERT_FIRST_USER_PROP_ID = 32768;
pub const CERT_LAST_USER_PROP_ID = 65535;
pub const CERT_ACCESS_STATE_WRITE_PERSIST_FLAG = 1;
pub const CERT_ACCESS_STATE_SYSTEM_STORE_FLAG = 2;
pub const CERT_ACCESS_STATE_LM_SYSTEM_STORE_FLAG = 4;
pub const CERT_ACCESS_STATE_GP_SYSTEM_STORE_FLAG = 8;
pub const CERT_ACCESS_STATE_SHARED_USER_FLAG = 16;
pub const CERT_STORE_PROV_MSG = 1;
pub const CERT_STORE_PROV_MEMORY = 2;
pub const CERT_STORE_PROV_FILE = 3;
pub const CERT_STORE_PROV_REG = 4;
pub const CERT_STORE_PROV_PKCS7 = 5;
pub const CERT_STORE_PROV_SERIALIZED = 6;
pub const CERT_STORE_PROV_FILENAME_A = 7;
pub const CERT_STORE_PROV_FILENAME_W = 8;
pub const CERT_STORE_PROV_FILENAME = 8;
pub const CERT_STORE_PROV_SYSTEM_A = 9;
pub const CERT_STORE_PROV_SYSTEM_W = 10;
pub const CERT_STORE_PROV_SYSTEM = 10;
pub const CERT_STORE_PROV_COLLECTION = 11;
pub const CERT_STORE_PROV_SYSTEM_REGISTRY_A = 12;
pub const CERT_STORE_PROV_SYSTEM_REGISTRY_W = 13;
pub const CERT_STORE_PROV_SYSTEM_REGISTRY = 13;
pub const CERT_STORE_PROV_PHYSICAL_W = 14;
pub const CERT_STORE_PROV_PHYSICAL = 14;
pub const CERT_STORE_PROV_SMART_CARD_W = 15;
pub const CERT_STORE_PROV_SMART_CARD = 15;
pub const CERT_STORE_PROV_LDAP_W = 16;
pub const CERT_STORE_PROV_LDAP = 16;
pub const CERT_STORE_PROV_PKCS12 = 17;
pub const CERT_STORE_SIGNATURE_FLAG = 1;
pub const CERT_STORE_TIME_VALIDITY_FLAG = 2;
pub const CERT_STORE_REVOCATION_FLAG = 4;
pub const CERT_STORE_NO_CRL_FLAG = 65536;
pub const CERT_STORE_NO_ISSUER_FLAG = 131072;
pub const CERT_STORE_BASE_CRL_FLAG = 256;
pub const CERT_STORE_DELTA_CRL_FLAG = 512;
pub const CERT_STORE_UNSAFE_PHYSICAL_FLAG = 32;
pub const CERT_STORE_SHARE_STORE_FLAG = 64;
pub const CERT_STORE_MANIFOLD_FLAG = 256;
pub const CERT_SYSTEM_STORE_MASK = 4294901760;
pub const CERT_SYSTEM_STORE_UNPROTECTED_FLAG = 1073741824;
pub const CERT_SYSTEM_STORE_DEFER_READ_FLAG = 536870912;
pub const CERT_SYSTEM_STORE_LOCATION_SHIFT = 16;
pub const CERT_SYSTEM_STORE_CURRENT_USER_ID = 1;
pub const CERT_SYSTEM_STORE_LOCAL_MACHINE_ID = 2;
pub const CERT_SYSTEM_STORE_CURRENT_SERVICE_ID = 4;
pub const CERT_SYSTEM_STORE_SERVICES_ID = 5;
pub const CERT_SYSTEM_STORE_USERS_ID = 6;
pub const CERT_SYSTEM_STORE_CURRENT_USER_GROUP_POLICY_ID = 7;
pub const CERT_SYSTEM_STORE_LOCAL_MACHINE_GROUP_POLICY_ID = 8;
pub const CERT_SYSTEM_STORE_LOCAL_MACHINE_ENTERPRISE_ID = 9;
pub const CERT_SYSTEM_STORE_LOCAL_MACHINE_WCOS_ID = 10;
pub const CERT_PROT_ROOT_DISABLE_CURRENT_USER_FLAG = 1;
pub const CERT_PROT_ROOT_INHIBIT_ADD_AT_INIT_FLAG = 2;
pub const CERT_PROT_ROOT_INHIBIT_PURGE_LM_FLAG = 4;
pub const CERT_PROT_ROOT_DISABLE_LM_AUTH_FLAG = 8;
pub const CERT_PROT_ROOT_ONLY_LM_GPT_FLAG = 8;
pub const CERT_PROT_ROOT_DISABLE_NT_AUTH_REQUIRED_FLAG = 16;
pub const CERT_PROT_ROOT_DISABLE_NOT_DEFINED_NAME_CONSTRAINT_FLAG = 32;
pub const CERT_PROT_ROOT_DISABLE_PEER_TRUST = 65536;
pub const CERT_TRUST_PUB_ALLOW_TRUST_MASK = 3;
pub const CERT_TRUST_PUB_ALLOW_END_USER_TRUST = 0;
pub const CERT_TRUST_PUB_ALLOW_MACHINE_ADMIN_TRUST = 1;
pub const CERT_TRUST_PUB_ALLOW_ENTERPRISE_ADMIN_TRUST = 2;
pub const CERT_TRUST_PUB_CHECK_PUBLISHER_REV_FLAG = 256;
pub const CERT_TRUST_PUB_CHECK_TIMESTAMP_REV_FLAG = 512;
pub const CERT_AUTH_ROOT_AUTO_UPDATE_DISABLE_UNTRUSTED_ROOT_LOGGING_FLAG = 1;
pub const CERT_AUTH_ROOT_AUTO_UPDATE_DISABLE_PARTIAL_CHAIN_LOGGING_FLAG = 2;
pub const CERT_AUTO_UPDATE_DISABLE_RANDOM_QUERY_STRING_FLAG = 4;
pub const CERT_REGISTRY_STORE_REMOTE_FLAG = 65536;
pub const CERT_REGISTRY_STORE_SERIALIZED_FLAG = 131072;
pub const CERT_REGISTRY_STORE_CLIENT_GPT_FLAG = 2147483648;
pub const CERT_REGISTRY_STORE_LM_GPT_FLAG = 16777216;
pub const CERT_REGISTRY_STORE_ROAMING_FLAG = 262144;
pub const CERT_REGISTRY_STORE_MY_IE_DIRTY_FLAG = 524288;
pub const CERT_REGISTRY_STORE_EXTERNAL_FLAG = 1048576;
pub const CERT_FILE_STORE_COMMIT_ENABLE_FLAG = 65536;
pub const CERT_LDAP_STORE_SIGN_FLAG = 65536;
pub const CERT_LDAP_STORE_AREC_EXCLUSIVE_FLAG = 131072;
pub const CERT_LDAP_STORE_OPENED_FLAG = 262144;
pub const CERT_LDAP_STORE_UNBIND_FLAG = 524288;
pub const CERT_STORE_PROV_GP_SYSTEM_STORE_FLAG = 32;
pub const CERT_STORE_PROV_SHARED_USER_FLAG = 64;
pub const CERT_STORE_PROV_CLOSE_FUNC = 0;
pub const CERT_STORE_PROV_READ_CERT_FUNC = 1;
pub const CERT_STORE_PROV_WRITE_CERT_FUNC = 2;
pub const CERT_STORE_PROV_DELETE_CERT_FUNC = 3;
pub const CERT_STORE_PROV_SET_CERT_PROPERTY_FUNC = 4;
pub const CERT_STORE_PROV_READ_CRL_FUNC = 5;
pub const CERT_STORE_PROV_WRITE_CRL_FUNC = 6;
pub const CERT_STORE_PROV_DELETE_CRL_FUNC = 7;
pub const CERT_STORE_PROV_SET_CRL_PROPERTY_FUNC = 8;
pub const CERT_STORE_PROV_READ_CTL_FUNC = 9;
pub const CERT_STORE_PROV_WRITE_CTL_FUNC = 10;
pub const CERT_STORE_PROV_DELETE_CTL_FUNC = 11;
pub const CERT_STORE_PROV_SET_CTL_PROPERTY_FUNC = 12;
pub const CERT_STORE_PROV_CONTROL_FUNC = 13;
pub const CERT_STORE_PROV_FIND_CERT_FUNC = 14;
pub const CERT_STORE_PROV_FREE_FIND_CERT_FUNC = 15;
pub const CERT_STORE_PROV_GET_CERT_PROPERTY_FUNC = 16;
pub const CERT_STORE_PROV_FIND_CRL_FUNC = 17;
pub const CERT_STORE_PROV_FREE_FIND_CRL_FUNC = 18;
pub const CERT_STORE_PROV_GET_CRL_PROPERTY_FUNC = 19;
pub const CERT_STORE_PROV_FIND_CTL_FUNC = 20;
pub const CERT_STORE_PROV_FREE_FIND_CTL_FUNC = 21;
pub const CERT_STORE_PROV_GET_CTL_PROPERTY_FUNC = 22;
pub const CERT_STORE_PROV_WRITE_ADD_FLAG = 1;
pub const CERT_STORE_SAVE_AS_PKCS12 = 3;
pub const CERT_CLOSE_STORE_FORCE_FLAG = 1;
pub const CERT_CLOSE_STORE_CHECK_FLAG = 2;
pub const CERT_COMPARE_MASK = 65535;
pub const CERT_COMPARE_ANY = 0;
pub const CERT_COMPARE_SHA1_HASH = 1;
pub const CERT_COMPARE_NAME = 2;
pub const CERT_COMPARE_ATTR = 3;
pub const CERT_COMPARE_MD5_HASH = 4;
pub const CERT_COMPARE_PROPERTY = 5;
pub const CERT_COMPARE_PUBLIC_KEY = 6;
pub const CERT_COMPARE_HASH = 1;
pub const CERT_COMPARE_NAME_STR_A = 7;
pub const CERT_COMPARE_NAME_STR_W = 8;
pub const CERT_COMPARE_KEY_SPEC = 9;
pub const CERT_COMPARE_ENHKEY_USAGE = 10;
pub const CERT_COMPARE_CTL_USAGE = 10;
pub const CERT_COMPARE_SUBJECT_CERT = 11;
pub const CERT_COMPARE_ISSUER_OF = 12;
pub const CERT_COMPARE_EXISTING = 13;
pub const CERT_COMPARE_SIGNATURE_HASH = 14;
pub const CERT_COMPARE_KEY_IDENTIFIER = 15;
pub const CERT_COMPARE_CERT_ID = 16;
pub const CERT_COMPARE_CROSS_CERT_DIST_POINTS = 17;
pub const CERT_COMPARE_PUBKEY_MD5_HASH = 18;
pub const CERT_COMPARE_SUBJECT_INFO_ACCESS = 19;
pub const CERT_COMPARE_HASH_STR = 20;
pub const CERT_COMPARE_HAS_PRIVATE_KEY = 21;
pub const CERT_COMPARE_SHA256_HASH = 22;
pub const CERT_COMPARE_SHA1_SHA256_HASH = 23;
pub const CERT_SET_PROPERTY_IGNORE_PERSIST_ERROR_FLAG = 2147483648;
pub const CERT_SET_PROPERTY_INHIBIT_PERSIST_FLAG = 1073741824;
pub const CTL_ENTRY_FROM_PROP_CHAIN_FLAG = 1;
pub const CRL_FIND_ANY = 0;
pub const CRL_FIND_ISSUED_BY = 1;
pub const CRL_FIND_EXISTING = 2;
pub const CRL_FIND_ISSUED_FOR = 3;
pub const CRL_FIND_ISSUED_BY_AKI_FLAG = 1;
pub const CRL_FIND_ISSUED_BY_SIGNATURE_FLAG = 2;
pub const CRL_FIND_ISSUED_BY_DELTA_FLAG = 4;
pub const CRL_FIND_ISSUED_BY_BASE_FLAG = 8;
pub const CRL_FIND_ISSUED_FOR_SET_STRONG_PROPERTIES_FLAG = 16;
pub const CERT_STORE_ADD_NEW = 1;
pub const CERT_STORE_ADD_USE_EXISTING = 2;
pub const CERT_STORE_ADD_REPLACE_EXISTING = 3;
pub const CERT_STORE_ADD_ALWAYS = 4;
pub const CERT_STORE_ADD_REPLACE_EXISTING_INHERIT_PROPERTIES = 5;
pub const CERT_STORE_ADD_NEWER = 6;
pub const CERT_STORE_ADD_NEWER_INHERIT_PROPERTIES = 7;
pub const CERT_STORE_CERTIFICATE_CONTEXT = 1;
pub const CERT_STORE_CRL_CONTEXT = 2;
pub const CERT_STORE_CTL_CONTEXT = 3;
pub const CTL_ANY_SUBJECT_TYPE = 1;
pub const CTL_CERT_SUBJECT_TYPE = 2;
pub const CTL_FIND_NO_LIST_ID_CBDATA = 4294967295;
pub const CERT_STORE_CTRL_RESYNC = 1;
pub const CERT_STORE_CTRL_NOTIFY_CHANGE = 2;
pub const CERT_STORE_CTRL_COMMIT = 3;
pub const CERT_STORE_CTRL_AUTO_RESYNC = 4;
pub const CERT_STORE_CTRL_CANCEL_NOTIFY = 5;
pub const CERT_STORE_LOCALIZED_NAME_PROP_ID = 4096;
pub const CERT_CREATE_CONTEXT_NOCOPY_FLAG = 1;
pub const CERT_CREATE_CONTEXT_SORTED_FLAG = 2;
pub const CERT_CREATE_CONTEXT_NO_HCRYPTMSG_FLAG = 4;
pub const CERT_CREATE_CONTEXT_NO_ENTRY_FLAG = 8;
pub const CERT_PHYSICAL_STORE_ADD_ENABLE_FLAG = 1;
pub const CERT_PHYSICAL_STORE_OPEN_DISABLE_FLAG = 2;
pub const CERT_PHYSICAL_STORE_REMOTE_OPEN_DISABLE_FLAG = 4;
pub const CERT_PHYSICAL_STORE_INSERT_COMPUTER_NAME_ENABLE_FLAG = 8;
pub const CERT_PHYSICAL_STORE_PREDEFINED_ENUM_FLAG = 1;
pub const CMSG_TRUSTED_SIGNER_FLAG = 1;
pub const CMSG_SIGNER_ONLY_FLAG = 2;
pub const CMSG_USE_SIGNER_INDEX_FLAG = 4;
pub const CMSG_CMS_ENCAPSULATED_CTL_FLAG = 32768;
pub const CMSG_ENCODE_SORTED_CTL_FLAG = 1;
pub const CMSG_ENCODE_HASHED_SUBJECT_IDENTIFIER_FLAG = 2;
pub const CERT_VERIFY_INHIBIT_CTL_UPDATE_FLAG = 1;
pub const CERT_VERIFY_TRUSTED_SIGNERS_FLAG = 2;
pub const CERT_VERIFY_NO_TIME_CHECK_FLAG = 4;
pub const CERT_VERIFY_ALLOW_MORE_USAGE_FLAG = 8;
pub const CERT_VERIFY_UPDATED_CTL_FLAG = 1;
pub const CERT_CONTEXT_REVOCATION_TYPE = 1;
pub const CERT_VERIFY_REV_CHAIN_FLAG = 1;
pub const CERT_VERIFY_CACHE_ONLY_BASED_REVOCATION = 2;
pub const CERT_VERIFY_REV_ACCUMULATIVE_TIMEOUT_FLAG = 4;
pub const CERT_VERIFY_REV_SERVER_OCSP_FLAG = 8;
pub const CERT_VERIFY_REV_NO_OCSP_FAILOVER_TO_CRL_FLAG = 16;
pub const CERT_VERIFY_REV_SERVER_OCSP_WIRE_ONLY_FLAG = 32;
pub const CERT_UNICODE_IS_RDN_ATTRS_FLAG = 1;
pub const CERT_CASE_INSENSITIVE_IS_RDN_ATTRS_FLAG = 2;
pub const CRYPT_VERIFY_CERT_SIGN_SUBJECT_BLOB = 1;
pub const CRYPT_VERIFY_CERT_SIGN_SUBJECT_CERT = 2;
pub const CRYPT_VERIFY_CERT_SIGN_SUBJECT_CRL = 3;
pub const CRYPT_VERIFY_CERT_SIGN_SUBJECT_OCSP_BASIC_SIGNED_RESPONSE = 4;
pub const CRYPT_VERIFY_CERT_SIGN_ISSUER_PUBKEY = 1;
pub const CRYPT_VERIFY_CERT_SIGN_ISSUER_CERT = 2;
pub const CRYPT_VERIFY_CERT_SIGN_ISSUER_CHAIN = 3;
pub const CRYPT_VERIFY_CERT_SIGN_ISSUER_NULL = 4;
pub const CRYPT_VERIFY_CERT_SIGN_CHECK_WEAK_HASH_FLAG = 8;
pub const CRYPT_DELETE_KEYSET = 16;
pub const CERT_XML_NAME_STR = 4;
pub const CERT_NAME_STR_SEMICOLON_FLAG = 1073741824;
pub const CERT_NAME_STR_NO_PLUS_FLAG = 536870912;
pub const CERT_NAME_STR_NO_QUOTING_FLAG = 268435456;
pub const CERT_NAME_STR_CRLF_FLAG = 134217728;
pub const CERT_NAME_STR_COMMA_FLAG = 67108864;
pub const CERT_NAME_STR_REVERSE_FLAG = 33554432;
pub const CERT_NAME_STR_FORWARD_FLAG = 16777216;
pub const CERT_NAME_STR_DISABLE_IE4_UTF8_FLAG = 65536;
pub const CERT_NAME_STR_ENABLE_T61_UNICODE_FLAG = 131072;
pub const CERT_NAME_STR_ENABLE_UTF8_UNICODE_FLAG = 262144;
pub const CERT_NAME_STR_FORCE_UTF8_DIR_STR_FLAG = 524288;
pub const CERT_NAME_STR_DISABLE_UTF8_DIR_STR_FLAG = 1048576;
pub const CERT_NAME_STR_ENABLE_PUNYCODE_FLAG = 2097152;
pub const CERT_NAME_EMAIL_TYPE = 1;
pub const CERT_NAME_RDN_TYPE = 2;
pub const CERT_NAME_ATTR_TYPE = 3;
pub const CERT_NAME_SIMPLE_DISPLAY_TYPE = 4;
pub const CERT_NAME_FRIENDLY_DISPLAY_TYPE = 5;
pub const CERT_NAME_DNS_TYPE = 6;
pub const CERT_NAME_URL_TYPE = 7;
pub const CERT_NAME_UPN_TYPE = 8;
pub const CERT_NAME_ISSUER_FLAG = 1;
pub const CERT_NAME_DISABLE_IE4_UTF8_FLAG = 65536;
pub const CERT_NAME_SEARCH_ALL_NAMES_FLAG = 2;
pub const CRYPT_MESSAGE_BARE_CONTENT_OUT_FLAG = 1;
pub const CRYPT_MESSAGE_ENCAPSULATED_CONTENT_OUT_FLAG = 2;
pub const CRYPT_MESSAGE_KEYID_SIGNER_FLAG = 4;
pub const CRYPT_MESSAGE_SILENT_KEYSET_FLAG = 64;
pub const CRYPT_MESSAGE_KEYID_RECIPIENT_FLAG = 4;
pub const CREDENTIAL_OID_PASSWORD_CREDENTIALS_A = 1;
pub const CREDENTIAL_OID_PASSWORD_CREDENTIALS_W = 2;
pub const CREDENTIAL_OID_PASSWORD_CREDENTIALS = 2;
pub const CONTEXT_OID_CERTIFICATE = 1;
pub const CONTEXT_OID_CRL = 2;
pub const CONTEXT_OID_CTL = 3;
pub const CONTEXT_OID_PKCS7 = 4;
pub const CONTEXT_OID_CAPI2_ANY = 5;
pub const CONTEXT_OID_OCSP_RESP = 6;
pub const CRYPT_RETRIEVE_MULTIPLE_OBJECTS = 1;
pub const CRYPT_CACHE_ONLY_RETRIEVAL = 2;
pub const CRYPT_WIRE_ONLY_RETRIEVAL = 4;
pub const CRYPT_DONT_CACHE_RESULT = 8;
pub const CRYPT_ASYNC_RETRIEVAL = 16;
pub const CRYPT_STICKY_CACHE_RETRIEVAL = 4096;
pub const CRYPT_LDAP_SCOPE_BASE_ONLY_RETRIEVAL = 8192;
pub const CRYPT_OFFLINE_CHECK_RETRIEVAL = 16384;
pub const CRYPT_LDAP_INSERT_ENTRY_ATTRIBUTE = 32768;
pub const CRYPT_LDAP_SIGN_RETRIEVAL = 65536;
pub const CRYPT_NO_AUTH_RETRIEVAL = 131072;
pub const CRYPT_LDAP_AREC_EXCLUSIVE_RETRIEVAL = 262144;
pub const CRYPT_AIA_RETRIEVAL = 524288;
pub const CRYPT_HTTP_POST_RETRIEVAL = 1048576;
pub const CRYPT_PROXY_CACHE_RETRIEVAL = 2097152;
pub const CRYPT_NOT_MODIFIED_RETRIEVAL = 4194304;
pub const CRYPT_ENABLE_SSL_REVOCATION_RETRIEVAL = 8388608;
pub const CRYPT_RANDOM_QUERY_STRING_RETRIEVAL = 67108864;
pub const CRYPT_ENABLE_FILE_RETRIEVAL = 134217728;
pub const CRYPT_CREATE_NEW_FLUSH_ENTRY = 268435456;
pub const CRYPT_VERIFY_CONTEXT_SIGNATURE = 32;
pub const CRYPT_VERIFY_DATA_HASH = 64;
pub const CRYPT_KEEP_TIME_VALID = 128;
pub const CRYPT_DONT_VERIFY_SIGNATURE = 256;
pub const CRYPT_DONT_CHECK_TIME_VALIDITY = 512;
pub const CRYPT_CHECK_FRESHNESS_TIME_VALIDITY = 1024;
pub const CRYPT_ACCUMULATIVE_TIMEOUT = 2048;
pub const CRYPT_OCSP_ONLY_RETRIEVAL = 16777216;
pub const CRYPT_NO_OCSP_FAILOVER_TO_CRL_RETRIEVAL = 33554432;
pub const CRYPTNET_URL_CACHE_PRE_FETCH_NONE = 0;
pub const CRYPTNET_URL_CACHE_PRE_FETCH_BLOB = 1;
pub const CRYPTNET_URL_CACHE_PRE_FETCH_CRL = 2;
pub const CRYPTNET_URL_CACHE_PRE_FETCH_OCSP = 3;
pub const CRYPTNET_URL_CACHE_PRE_FETCH_AUTOROOT_CAB = 5;
pub const CRYPTNET_URL_CACHE_PRE_FETCH_DISALLOWED_CERT_CAB = 6;
pub const CRYPTNET_URL_CACHE_PRE_FETCH_PIN_RULES_CAB = 7;
pub const CRYPTNET_URL_CACHE_DEFAULT_FLUSH = 0;
pub const CRYPTNET_URL_CACHE_DISABLE_FLUSH = 4294967295;
pub const CRYPTNET_URL_CACHE_RESPONSE_NONE = 0;
pub const CRYPTNET_URL_CACHE_RESPONSE_HTTP = 1;
pub const CRYPTNET_URL_CACHE_RESPONSE_VALIDATED = 32768;
pub const CRYPT_RETRIEVE_MAX_ERROR_CONTENT_LENGTH = 4096;
pub const CRYPT_PARAM_ASYNC_RETRIEVAL_COMPLETION = 1;
pub const CRYPT_PARAM_CANCEL_ASYNC_RETRIEVAL = 2;
pub const URL_OID_CERTIFICATE_ISSUER = 1;
pub const URL_OID_CERTIFICATE_CRL_DIST_POINT = 2;
pub const URL_OID_CTL_ISSUER = 3;
pub const URL_OID_CTL_NEXT_UPDATE = 4;
pub const URL_OID_CRL_ISSUER = 5;
pub const URL_OID_CERTIFICATE_FRESHEST_CRL = 6;
pub const URL_OID_CRL_FRESHEST_CRL = 7;
pub const URL_OID_CROSS_CERT_DIST_POINT = 8;
pub const URL_OID_CERTIFICATE_OCSP = 9;
pub const URL_OID_CERTIFICATE_OCSP_AND_CRL_DIST_POINT = 10;
pub const URL_OID_CERTIFICATE_CRL_DIST_POINT_AND_OCSP = 11;
pub const URL_OID_CROSS_CERT_SUBJECT_INFO_ACCESS = 12;
pub const URL_OID_CERTIFICATE_ONLY_OCSP = 13;
pub const TIME_VALID_OID_GET_CTL = 1;
pub const TIME_VALID_OID_GET_CRL = 2;
pub const TIME_VALID_OID_GET_CRL_FROM_CERT = 3;
pub const TIME_VALID_OID_GET_FRESHEST_CRL_FROM_CERT = 4;
pub const TIME_VALID_OID_GET_FRESHEST_CRL_FROM_CRL = 5;
pub const TIME_VALID_OID_FLUSH_CTL = 1;
pub const TIME_VALID_OID_FLUSH_CRL = 2;
pub const TIME_VALID_OID_FLUSH_CRL_FROM_CERT = 3;
pub const TIME_VALID_OID_FLUSH_FRESHEST_CRL_FROM_CERT = 4;
pub const TIME_VALID_OID_FLUSH_FRESHEST_CRL_FROM_CRL = 5;
pub const CRYPT_KEYID_MACHINE_FLAG = 32;
pub const CRYPT_KEYID_ALLOC_FLAG = 32768;
pub const CRYPT_KEYID_DELETE_FLAG = 16;
pub const CRYPT_KEYID_SET_NEW_FLAG = 8192;
pub const CERT_CHAIN_MAX_AIA_URL_COUNT_IN_CERT_DEFAULT = 5;
pub const CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_COUNT_PER_CHAIN_DEFAULT = 3;
pub const CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_BYTE_COUNT_DEFAULT = 100000;
pub const CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_CERT_COUNT_DEFAULT = 10;
pub const CERT_CHAIN_MAX_SSL_TIME_UPDATED_EVENT_COUNT_DEFAULT = 5;
pub const CERT_CHAIN_MAX_SSL_TIME_UPDATED_EVENT_COUNT_DISABLE = 4294967295;
pub const CERT_CHAIN_ENABLE_MD2_MD4_FLAG = 1;
pub const CERT_CHAIN_ENABLE_WEAK_RSA_ROOT_FLAG = 2;
pub const CERT_CHAIN_ENABLE_WEAK_LOGGING_FLAG = 4;
pub const CERT_CHAIN_ENABLE_ONLY_WEAK_LOGGING_FLAG = 8;
pub const CERT_CHAIN_MIN_RSA_PUB_KEY_BIT_LENGTH_DEFAULT = 1023;
pub const CERT_CHAIN_MIN_RSA_PUB_KEY_BIT_LENGTH_DISABLE = 4294967295;
pub const CERT_CHAIN_MIN_WEAK_RSA_PUB_KEY_BIT_LENGTH_DEFAULT = 2047;
pub const CERT_CHAIN_MIN_WEAK_RSA_PUB_KEY_BIT_LENGTH_DISABLE = 4294967295;
pub const CERT_CHAIN_MIN_TELEMETRY_RSA_PUB_KEY_BIT_LENGTH_DEFAULT = 2047;
pub const CERT_CHAIN_MIN_TELEMETRY_RSA_PUB_KEY_BIT_LENGTH_DISABLE = 4294967295;
pub const CERT_CHAIN_MIN_PUB_KEY_BIT_LENGTH_DISABLE = 4294967295;
pub const CERT_CHAIN_ENABLE_WEAK_SETTINGS_FLAG = 2147483648;
pub const CERT_CHAIN_DISABLE_ECC_PARA_FLAG = 16;
pub const CERT_CHAIN_DISABLE_ALL_EKU_WEAK_FLAG = 65536;
pub const CERT_CHAIN_ENABLE_ALL_EKU_HYGIENE_FLAG = 131072;
pub const CERT_CHAIN_DISABLE_OPT_IN_SERVER_AUTH_WEAK_FLAG = 262144;
pub const CERT_CHAIN_DISABLE_SERVER_AUTH_WEAK_FLAG = 1048576;
pub const CERT_CHAIN_ENABLE_SERVER_AUTH_HYGIENE_FLAG = 2097152;
pub const CERT_CHAIN_DISABLE_CODE_SIGNING_WEAK_FLAG = 4194304;
pub const CERT_CHAIN_DISABLE_MOTW_CODE_SIGNING_WEAK_FLAG = 8388608;
pub const CERT_CHAIN_ENABLE_CODE_SIGNING_HYGIENE_FLAG = 16777216;
pub const CERT_CHAIN_ENABLE_MOTW_CODE_SIGNING_HYGIENE_FLAG = 33554432;
pub const CERT_CHAIN_DISABLE_TIMESTAMP_WEAK_FLAG = 67108864;
pub const CERT_CHAIN_DISABLE_MOTW_TIMESTAMP_WEAK_FLAG = 134217728;
pub const CERT_CHAIN_ENABLE_TIMESTAMP_HYGIENE_FLAG = 268435456;
pub const CERT_CHAIN_ENABLE_MOTW_TIMESTAMP_HYGIENE_FLAG = 536870912;
pub const CERT_CHAIN_MOTW_IGNORE_AFTER_TIME_WEAK_FLAG = 1073741824;
pub const CERT_CHAIN_DISABLE_FILE_HASH_WEAK_FLAG = 4096;
pub const CERT_CHAIN_DISABLE_MOTW_FILE_HASH_WEAK_FLAG = 8192;
pub const CERT_CHAIN_DISABLE_TIMESTAMP_HASH_WEAK_FLAG = 16384;
pub const CERT_CHAIN_DISABLE_MOTW_TIMESTAMP_HASH_WEAK_FLAG = 32768;
pub const CERT_CHAIN_OPT_IN_WEAK_FLAGS = 262144;
pub const CERT_CHAIN_AUTO_CURRENT_USER = 1;
pub const CERT_CHAIN_AUTO_LOCAL_MACHINE = 2;
pub const CERT_CHAIN_AUTO_IMPERSONATED = 3;
pub const CERT_CHAIN_AUTO_PROCESS_INFO = 4;
pub const CERT_CHAIN_AUTO_PINRULE_INFO = 5;
pub const CERT_CHAIN_AUTO_NETWORK_INFO = 6;
pub const CERT_CHAIN_AUTO_SERIAL_LOCAL_MACHINE = 7;
pub const CERT_CHAIN_AUTO_HPKP_RULE_INFO = 8;
pub const CERT_CHAIN_AUTO_FLUSH_DISABLE_FLAG = 1;
pub const CERT_CHAIN_AUTO_LOG_CREATE_FLAG = 2;
pub const CERT_CHAIN_AUTO_LOG_FREE_FLAG = 4;
pub const CERT_CHAIN_AUTO_LOG_FLUSH_FLAG = 8;
pub const CERT_SRV_OCSP_RESP_MIN_SYNC_CERT_FILE_SECONDS_DEFAULT = 5;
pub const CRYPTNET_MAX_CACHED_OCSP_PER_CRL_COUNT_DEFAULT = 500;
pub const CRYPTNET_OCSP_AFTER_CRL_DISABLE = 4294967295;
pub const CRYPTNET_PRE_FETCH_AFTER_PUBLISH_PRE_FETCH_DIVISOR_DEFAULT = 10;
pub const CRYPTNET_PRE_FETCH_BEFORE_NEXT_UPDATE_PRE_FETCH_DIVISOR_DEFAULT = 20;
pub const CRYPTNET_PRE_FETCH_VALIDITY_PERIOD_AFTER_NEXT_UPDATE_PRE_FETCH_DIVISOR_DEFAULT = 10;
pub const CRYPTNET_PRE_FETCH_TRIGGER_DISABLE = 4294967295;
pub const CRYPTNET_PRE_FETCH_SCAN_AFTER_TRIGGER_DELAY_SECONDS_DEFAULT = 60;
pub const CRYPTNET_CACHED_OCSP_SWITCH_TO_CRL_COUNT_DEFAULT = 50;
pub const CRYPTNET_CRL_BEFORE_OCSP_ENABLE = 4294967295;
pub const CERT_CHAIN_OPTION_DISABLE_AIA_URL_RETRIEVAL = 2;
pub const CERT_CHAIN_OPTION_ENABLE_SIA_URL_RETRIEVAL = 4;
pub const CERT_CHAIN_CRL_VALIDITY_EXT_PERIOD_HOURS_DEFAULT = 12;
pub const CERT_CHAIN_CACHE_END_CERT = 1;
pub const CERT_CHAIN_THREAD_STORE_SYNC = 2;
pub const CERT_CHAIN_CACHE_ONLY_URL_RETRIEVAL = 4;
pub const CERT_CHAIN_USE_LOCAL_MACHINE_STORE = 8;
pub const CERT_CHAIN_ENABLE_CACHE_AUTO_UPDATE = 16;
pub const CERT_CHAIN_ENABLE_SHARE_STORE = 32;
pub const CERT_CHAIN_EXCLUSIVE_ENABLE_CA_FLAG = 1;
pub const CERT_TRUST_NO_ERROR = 0;
pub const CERT_TRUST_IS_NOT_TIME_VALID = 1;
pub const CERT_TRUST_IS_NOT_TIME_NESTED = 2;
pub const CERT_TRUST_IS_REVOKED = 4;
pub const CERT_TRUST_IS_NOT_SIGNATURE_VALID = 8;
pub const CERT_TRUST_IS_NOT_VALID_FOR_USAGE = 16;
pub const CERT_TRUST_IS_UNTRUSTED_ROOT = 32;
pub const CERT_TRUST_REVOCATION_STATUS_UNKNOWN = 64;
pub const CERT_TRUST_IS_CYCLIC = 128;
pub const CERT_TRUST_INVALID_EXTENSION = 256;
pub const CERT_TRUST_INVALID_POLICY_CONSTRAINTS = 512;
pub const CERT_TRUST_INVALID_BASIC_CONSTRAINTS = 1024;
pub const CERT_TRUST_INVALID_NAME_CONSTRAINTS = 2048;
pub const CERT_TRUST_HAS_NOT_SUPPORTED_NAME_CONSTRAINT = 4096;
pub const CERT_TRUST_HAS_NOT_DEFINED_NAME_CONSTRAINT = 8192;
pub const CERT_TRUST_HAS_NOT_PERMITTED_NAME_CONSTRAINT = 16384;
pub const CERT_TRUST_HAS_EXCLUDED_NAME_CONSTRAINT = 32768;
pub const CERT_TRUST_IS_OFFLINE_REVOCATION = 16777216;
pub const CERT_TRUST_NO_ISSUANCE_CHAIN_POLICY = 33554432;
pub const CERT_TRUST_IS_EXPLICIT_DISTRUST = 67108864;
pub const CERT_TRUST_HAS_NOT_SUPPORTED_CRITICAL_EXT = 134217728;
pub const CERT_TRUST_HAS_WEAK_SIGNATURE = 1048576;
pub const CERT_TRUST_HAS_WEAK_HYGIENE = 2097152;
pub const CERT_TRUST_HAS_MIN_TELEMETRY_RSA = 4194304;
pub const CERT_TRUST_HAS_MIN_WEAK_RSA = 8388608;
pub const CERT_TRUST_IS_PARTIAL_CHAIN = 65536;
pub const CERT_TRUST_CTL_IS_NOT_TIME_VALID = 131072;
pub const CERT_TRUST_CTL_IS_NOT_SIGNATURE_VALID = 262144;
pub const CERT_TRUST_CTL_IS_NOT_VALID_FOR_USAGE = 524288;
pub const CERT_TRUST_HAS_EXACT_MATCH_ISSUER = 1;
pub const CERT_TRUST_HAS_KEY_MATCH_ISSUER = 2;
pub const CERT_TRUST_HAS_NAME_MATCH_ISSUER = 4;
pub const CERT_TRUST_IS_SELF_SIGNED = 8;
pub const CERT_TRUST_AUTO_UPDATE_CA_REVOCATION = 16;
pub const CERT_TRUST_AUTO_UPDATE_END_REVOCATION = 32;
pub const CERT_TRUST_NO_OCSP_FAILOVER_TO_CRL = 64;
pub const CERT_TRUST_IS_KEY_ROLLOVER = 128;
pub const CERT_TRUST_SSL_HANDSHAKE_OCSP = 262144;
pub const CERT_TRUST_SSL_TIME_VALID_OCSP = 524288;
pub const CERT_TRUST_SSL_RECONNECT_OCSP = 1048576;
pub const CERT_TRUST_HAS_PREFERRED_ISSUER = 256;
pub const CERT_TRUST_HAS_ISSUANCE_CHAIN_POLICY = 512;
pub const CERT_TRUST_HAS_VALID_NAME_CONSTRAINTS = 1024;
pub const CERT_TRUST_IS_PEER_TRUSTED = 2048;
pub const CERT_TRUST_HAS_CRL_VALIDITY_EXTENDED = 4096;
pub const CERT_TRUST_IS_FROM_EXCLUSIVE_TRUST_STORE = 8192;
pub const CERT_TRUST_IS_CA_TRUSTED = 16384;
pub const CERT_TRUST_HAS_AUTO_UPDATE_WEAK_SIGNATURE = 32768;
pub const CERT_TRUST_HAS_ALLOW_WEAK_SIGNATURE = 131072;
pub const CERT_TRUST_BEFORE_DISALLOWED_CA_FILETIME = 2097152;
pub const CERT_TRUST_IS_COMPLEX_CHAIN = 65536;
pub const CERT_TRUST_SSL_TIME_VALID = 16777216;
pub const CERT_TRUST_NO_TIME_CHECK = 33554432;
pub const USAGE_MATCH_TYPE_AND = 0;
pub const USAGE_MATCH_TYPE_OR = 1;
pub const CERT_CHAIN_STRONG_SIGN_DISABLE_END_CHECK_FLAG = 1;
pub const CERT_CHAIN_REVOCATION_CHECK_END_CERT = 268435456;
pub const CERT_CHAIN_REVOCATION_CHECK_CHAIN = 536870912;
pub const CERT_CHAIN_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 1073741824;
pub const CERT_CHAIN_REVOCATION_CHECK_CACHE_ONLY = 2147483648;
pub const CERT_CHAIN_REVOCATION_ACCUMULATIVE_TIMEOUT = 134217728;
pub const CERT_CHAIN_REVOCATION_CHECK_OCSP_CERT = 67108864;
pub const CERT_CHAIN_DISABLE_PASS1_QUALITY_FILTERING = 64;
pub const CERT_CHAIN_RETURN_LOWER_QUALITY_CONTEXTS = 128;
pub const CERT_CHAIN_DISABLE_AUTH_ROOT_AUTO_UPDATE = 256;
pub const CERT_CHAIN_TIMESTAMP_TIME = 512;
pub const CERT_CHAIN_ENABLE_PEER_TRUST = 1024;
pub const CERT_CHAIN_DISABLE_MY_PEER_TRUST = 2048;
pub const CERT_CHAIN_DISABLE_MD2_MD4 = 4096;
pub const CERT_CHAIN_DISABLE_AIA = 8192;
pub const CERT_CHAIN_HAS_MOTW = 16384;
pub const CERT_CHAIN_ONLY_ADDITIONAL_AND_AUTH_ROOT = 32768;
pub const CERT_CHAIN_OPT_IN_WEAK_SIGNATURE = 65536;
pub const CERT_CHAIN_ENABLE_DISALLOWED_CA = 131072;
pub const REVOCATION_OID_CRL_REVOCATION = 1;
pub const CERT_CHAIN_FIND_BY_ISSUER = 1;
pub const CERT_CHAIN_POLICY_BASE = 1;
pub const CERT_CHAIN_POLICY_AUTHENTICODE = 2;
pub const CERT_CHAIN_POLICY_AUTHENTICODE_TS = 3;
pub const CERT_CHAIN_POLICY_SSL = 4;
pub const CERT_CHAIN_POLICY_BASIC_CONSTRAINTS = 5;
pub const CERT_CHAIN_POLICY_NT_AUTH = 6;
pub const CERT_CHAIN_POLICY_MICROSOFT_ROOT = 7;
pub const CERT_CHAIN_POLICY_EV = 8;
pub const CERT_CHAIN_POLICY_SSL_F12 = 9;
pub const CERT_CHAIN_POLICY_SSL_HPKP_HEADER = 10;
pub const CERT_CHAIN_POLICY_THIRD_PARTY_ROOT = 11;
pub const CERT_CHAIN_POLICY_SSL_KEY_PIN = 12;
pub const CERT_CHAIN_POLICY_CT = 13;
pub const SSL_F12_ERROR_TEXT_LENGTH = 256;
pub const CERT_CHAIN_POLICY_SSL_F12_SUCCESS_LEVEL = 0;
pub const CERT_CHAIN_POLICY_SSL_F12_WARNING_LEVEL = 1;
pub const CERT_CHAIN_POLICY_SSL_F12_ERROR_LEVEL = 2;
pub const CERT_CHAIN_POLICY_SSL_F12_NONE_CATEGORY = 0;
pub const CERT_CHAIN_POLICY_SSL_F12_WEAK_CRYPTO_CATEGORY = 1;
pub const CERT_CHAIN_POLICY_SSL_F12_ROOT_PROGRAM_CATEGORY = 2;
pub const SSL_HPKP_PKP_HEADER_INDEX = 0;
pub const SSL_HPKP_PKP_RO_HEADER_INDEX = 1;
pub const SSL_HPKP_HEADER_COUNT = 2;
pub const SSL_KEY_PIN_ERROR_TEXT_LENGTH = 512;
pub const CERT_CHAIN_POLICY_SSL_KEY_PIN_MISMATCH_ERROR = -2;
pub const CERT_CHAIN_POLICY_SSL_KEY_PIN_MITM_ERROR = -1;
pub const CERT_CHAIN_POLICY_SSL_KEY_PIN_SUCCESS = 0;
pub const CERT_CHAIN_POLICY_SSL_KEY_PIN_MITM_WARNING = 1;
pub const CERT_CHAIN_POLICY_SSL_KEY_PIN_MISMATCH_WARNING = 2;
pub const CERT_CHAIN_POLICY_CT_ERROR_UNDECODABLE_SCT_EXTENSION = -112;
pub const CERT_CHAIN_POLICY_CT_ERROR_UNRETRIEVABLE_SCT_EXTENSION = -111;
pub const CERT_CHAIN_POLICY_CT_ERROR_MISSING_SCT_EXTENSION = -110;
pub const CERT_CHAIN_POLICY_CT_ERROR_INVALID_ISSUER_CERT = -101;
pub const CERT_CHAIN_POLICY_CT_ERROR_INVALID_SUBJECT_CERT = -100;
pub const CERT_CHAIN_POLICY_CT_ERROR_CANNOT_VALIDATE_SCT = -50;
pub const CERT_CHAIN_POLICY_CT_ERROR_SCT_VALIDATION_STATUS_INSUFFICIENT = -4;
pub const CERT_CHAIN_POLICY_CT_ERROR_SCT_VALIDATION_STATUS_UNKNOWN_VERSION = -3;
pub const CERT_CHAIN_POLICY_CT_ERROR_SCT_VALIDATION_STATUS_UNKNOWN_LOG = -2;
pub const CERT_CHAIN_POLICY_CT_ERROR_SCT_VALIDATION_STATUS_INVALID = -1;
pub const CERT_CHAIN_POLICY_CT_SUCCESS_SCT_VALIDIDATION_STATUS_VALID = 0;
pub const CERT_CHAIN_POLICY_CT_WARNING_OUT_OF_MEMORY = 1;
pub const CERT_CHAIN_POLICY_CT_WARNING_BEFORE_CODE_SIGNING_CT_LOGGING = 2;
pub const CERT_CHAIN_POLICY_CT_WARNING_NOT_THIRD_PARTY_CERT = 3;
pub const CERT_CHAIN_POLICY_CT_WARNING_EXPIRED_ROOT_CTL = 4;
pub const CERT_CHAIN_POLICY_CT_WARNING_INVALID_CHAIN_CONTEXT = 50;
pub const CERT_CHAIN_POLICY_CT_WARNING_NOT_SUPPORTED_CA = 51;
pub const CERT_CHAIN_POLICY_CT_WARNING_MISSING_ROOT_CTL = 52;
pub const CERT_CHAIN_POLICY_CT_WARNING_MISSING_CT_EXT = 60;
pub const CERT_CHAIN_POLICY_CT_WARNING_INVALID_CT_EXT = 61;
pub const CERT_CHAIN_POLICY_CT_WARNING_UNABLE_TO_DECODE_EXT = 62;
pub const CERT_CHAIN_POLICY_CT_WARNING_UNABLE_TO_DECODE_PARAMETERS = 70;
pub const CERT_CHAIN_POLICY_CT_WARNING_INVALID_TEMP_FILE = 80;
pub const CERT_CHAIN_POLICY_CT_WARNING_CANNOT_CREATE_TEMP_FILE = 81;
pub const CERT_CHAIN_POLICY_CT_WARNING_CANNOT_WRITE_TEMP_FILE = 82;
pub const CERT_CHAIN_POLICY_CT_WARNING_CANNOT_LOAD_CTLOG_STORE_FILE = 83;
pub const CERT_CHAIN_POLICY_CT_WARNING_FAILED_INIT = 90;
pub const CERT_CHAIN_POLICY_CT_WARNING_HASHING_ERROR = 200;
pub const CERT_CHAIN_POLICY_CT_WARNING_INVALID_STR = 201;
pub const CERT_CHAIN_POLICY_CT_WARNING_CANNOT_CREATE_POLICY = 300;
pub const CRYPT_STRING_BASE64URI = 13;
pub const CRYPT_STRING_ENCODEMASK = 255;
pub const CRYPT_STRING_RESERVED100 = 256;
pub const CRYPT_STRING_RESERVED200 = 512;
pub const CRYPT_STRING_PERCENTESCAPE = 134217728;
pub const CRYPT_STRING_HASHDATA = 268435456;
pub const CRYPT_STRING_NOCRLF = 1073741824;
pub const CRYPT_STRING_NOCR = 2147483648;
pub const PKCS12_IMPORT_SILENT = 64;
pub const PKCS12_ONLY_CERTIFICATES = 1024;
pub const PKCS12_ONLY_NOT_ENCRYPTED_CERTIFICATES = 2048;
pub const PKCS12_VIRTUAL_ISOLATION_KEY = 65536;
pub const PKCS12_IMPORT_RESERVED_MASK = 4294901760;
pub const PKCS12_NAMED_NO_PERSIST_KEY = 131072;
pub const PKCS12_ONLY_CERTIFICATES_PROVIDER_TYPE = 0;
pub const REPORT_NO_PRIVATE_KEY = 1;
pub const REPORT_NOT_ABLE_TO_EXPORT_PRIVATE_KEY = 2;
pub const EXPORT_PRIVATE_KEYS = 4;
pub const PKCS12_PROTECT_TO_DOMAIN_SIDS = 32;
pub const PKCS12_EXPORT_SILENT = 64;
pub const PKCS12_EXPORT_PBES2_PARAMS = 128;
pub const PKCS12_DISABLE_ENCRYPT_CERTIFICATES = 256;
pub const PKCS12_ENCRYPT_CERTIFICATES = 512;
pub const PKCS12_EXPORT_ECC_CURVE_PARAMETERS = 4096;
pub const PKCS12_EXPORT_ECC_CURVE_OID = 8192;
pub const PKCS12_EXPORT_RESERVED_MASK = 4294901760;
pub const CERT_SERVER_OCSP_RESPONSE_OPEN_PARA_READ_FLAG = 1;
pub const CERT_SERVER_OCSP_RESPONSE_OPEN_PARA_WRITE_FLAG = 2;
pub const CERT_SERVER_OCSP_RESPONSE_ASYNC_FLAG = 1;
pub const CERT_RETRIEVE_ISSUER_LOGO = 1;
pub const CERT_RETRIEVE_SUBJECT_LOGO = 2;
pub const CERT_RETRIEVE_COMMUNITY_LOGO = 3;
pub const CERT_RETRIEVE_BIOMETRIC_PREDEFINED_BASE_TYPE = 1000;
pub const CERT_SELECT_MAX_PARA = 500;
pub const CERT_SELECT_BY_ISSUER_DISPLAYNAME = 12;
pub const CERT_SELECT_BY_FRIENDLYNAME = 13;
pub const CERT_SELECT_BY_THUMBPRINT = 14;
pub const CERT_SELECT_ALLOW_EXPIRED = 1;
pub const CERT_SELECT_TRUSTED_ROOT = 2;
pub const CERT_SELECT_DISALLOW_SELFSIGNED = 4;
pub const CERT_SELECT_HAS_PRIVATE_KEY = 8;
pub const CERT_SELECT_HAS_KEY_FOR_SIGNATURE = 16;
pub const CERT_SELECT_HAS_KEY_FOR_KEY_EXCHANGE = 32;
pub const CERT_SELECT_HARDWARE_ONLY = 64;
pub const CERT_SELECT_ALLOW_DUPLICATES = 128;
pub const CERT_SELECT_IGNORE_AUTOSELECT = 256;
pub const TIMESTAMP_FAILURE_BAD_ALG = 0;
pub const TIMESTAMP_FAILURE_BAD_REQUEST = 2;
pub const TIMESTAMP_FAILURE_BAD_FORMAT = 5;
pub const TIMESTAMP_FAILURE_TIME_NOT_AVAILABLE = 14;
pub const TIMESTAMP_FAILURE_POLICY_NOT_SUPPORTED = 15;
pub const TIMESTAMP_FAILURE_EXTENSION_NOT_SUPPORTED = 16;
pub const TIMESTAMP_FAILURE_INFO_NOT_AVAILABLE = 17;
pub const TIMESTAMP_FAILURE_SYSTEM_FAILURE = 25;
pub const TIMESTAMP_DONT_HASH_DATA = 1;
pub const TIMESTAMP_VERIFY_CONTEXT_SIGNATURE = 32;
pub const TIMESTAMP_NO_AUTH_RETRIEVAL = 131072;
pub const CRYPT_OBJECT_LOCATOR_SPN_NAME_TYPE = 1;
pub const CRYPT_OBJECT_LOCATOR_LAST_RESERVED_NAME_TYPE = 32;
pub const CRYPT_OBJECT_LOCATOR_FIRST_RESERVED_USER_NAME_TYPE = 33;
pub const CRYPT_OBJECT_LOCATOR_LAST_RESERVED_USER_NAME_TYPE = 65535;
pub const CERT_FILE_HASH_USE_TYPE = 1;
pub const CERT_TIMESTAMP_HASH_USE_TYPE = 2;
pub const RECIPIENTPOLICYV1 = 1;
pub const RECIPIENTPOLICYV2 = 2;
pub const E_ICARD_COMMUNICATION = -1073413888;
pub const E_ICARD_DATA_ACCESS = -1073413887;
pub const E_ICARD_EXPORT = -1073413886;
pub const E_ICARD_IDENTITY = -1073413885;
pub const E_ICARD_IMPORT = -1073413884;
pub const E_ICARD_ARGUMENT = -1073413883;
pub const E_ICARD_REQUEST = -1073413882;
pub const E_ICARD_INFORMATIONCARD = -1073413881;
pub const E_ICARD_STOREKEY = -1073413880;
pub const E_ICARD_LOGOVALIDATION = -1073413879;
pub const E_ICARD_PASSWORDVALIDATION = -1073413878;
pub const E_ICARD_POLICY = -1073413877;
pub const E_ICARD_PROCESSDIED = -1073413876;
pub const E_ICARD_SERVICEBUSY = -1073413875;
pub const E_ICARD_SERVICE = -1073413874;
pub const E_ICARD_SHUTTINGDOWN = -1073413873;
pub const E_ICARD_TOKENCREATION = -1073413872;
pub const E_ICARD_TRUSTEXCHANGE = -1073413871;
pub const E_ICARD_UNTRUSTED = -1073413870;
pub const E_ICARD_USERCANCELLED = -1073413869;
pub const E_ICARD_STORE_IMPORT = -1073413868;
pub const E_ICARD_FAIL = -1073413867;
pub const E_ICARD_UI_INITIALIZATION = -1073413862;
pub const E_ICARD_REFRESH_REQUIRED = -1073413760;
pub const E_ICARD_MISSING_APPLIESTO = -1073413759;
pub const E_ICARD_INVALID_PROOF_KEY = -1073413758;
pub const E_ICARD_UNKNOWN_REFERENCE = -1073413757;
pub const E_ICARD_FAILED_REQUIRED_CLAIMS = -1073413756;
pub const AUDIT_CARD_WRITTEN = 1074070016;
pub const AUDIT_CARD_DELETE = 1074070017;
pub const AUDIT_CARD_IMPORT = 1074070018;
pub const AUDIT_STORE_IMPORT = 1074070019;
pub const AUDIT_STORE_EXPORT = 1074070020;
pub const AUDIT_STORE_DELETE = 1074070021;
pub const AUDIT_SERVICE_IDLE_STOP = 1074070022;
pub const BCRYPT_ECC_PARAMETER_HEADER_V1 = 1;
pub const BCRYPT_COPY_AFTER_PADDING_CHECK_FAILURE_FLAG = 256;
pub const NCRYPT_SSL_CLIENT_FLAG = 1;
pub const NCRYPT_SSL_SERVER_FLAG = 2;
pub const SSL2_PROTOCOL_VERSION = 2;
pub const SSL3_PROTOCOL_VERSION = 768;
pub const TLS1_PROTOCOL_VERSION = 769;
pub const TLS1_0_PROTOCOL_VERSION = 769;
pub const TLS1_1_PROTOCOL_VERSION = 770;
pub const TLS1_2_PROTOCOL_VERSION = 771;
pub const TLS1_3_PROTOCOL_VERSION = 772;
pub const DTLS1_0_PROTOCOL_VERSION = 65279;
pub const DTLS1_2_PROTOCOL_VERSION = 65277;
pub const TLS_RSA_WITH_NULL_MD5 = 1;
pub const TLS_RSA_WITH_NULL_SHA = 2;
pub const TLS_RSA_EXPORT_WITH_RC4_40_MD5 = 3;
pub const TLS_RSA_WITH_RC4_128_MD5 = 4;
pub const TLS_RSA_WITH_RC4_128_SHA = 5;
pub const TLS_RSA_WITH_DES_CBC_SHA = 9;
pub const TLS_RSA_WITH_3DES_EDE_CBC_SHA = 10;
pub const TLS_DHE_DSS_WITH_DES_CBC_SHA = 18;
pub const TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA = 19;
pub const TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA = 22;
pub const TLS_RSA_WITH_AES_128_CBC_SHA = 47;
pub const TLS_DHE_DSS_WITH_AES_128_CBC_SHA = 50;
pub const TLS_DHE_RSA_WITH_AES_128_CBC_SHA = 51;
pub const TLS_RSA_WITH_AES_256_CBC_SHA = 53;
pub const TLS_DHE_DSS_WITH_AES_256_CBC_SHA = 56;
pub const TLS_DHE_RSA_WITH_AES_256_CBC_SHA = 57;
pub const TLS_RSA_EXPORT1024_WITH_DES_CBC_SHA = 98;
pub const TLS_DHE_DSS_EXPORT1024_WITH_DES_CBC_SHA = 99;
pub const TLS_RSA_EXPORT1024_WITH_RC4_56_SHA = 100;
pub const TLS_RSA_WITH_NULL_SHA256 = 59;
pub const TLS_RSA_WITH_AES_128_CBC_SHA256 = 60;
pub const TLS_RSA_WITH_AES_256_CBC_SHA256 = 61;
pub const TLS_DHE_DSS_WITH_AES_128_CBC_SHA256 = 64;
pub const TLS_DHE_DSS_WITH_AES_256_CBC_SHA256 = 106;
pub const TLS_RSA_WITH_AES_128_GCM_SHA256 = 156;
pub const TLS_RSA_WITH_AES_256_GCM_SHA384 = 157;
pub const TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 = 158;
pub const TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 = 159;
pub const TLS_PSK_WITH_AES_128_GCM_SHA256 = 168;
pub const TLS_PSK_WITH_AES_256_GCM_SHA384 = 169;
pub const TLS_PSK_WITH_AES_128_CBC_SHA256 = 174;
pub const TLS_PSK_WITH_AES_256_CBC_SHA384 = 175;
pub const TLS_PSK_WITH_NULL_SHA256 = 176;
pub const TLS_PSK_WITH_NULL_SHA384 = 177;
pub const TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA = 49161;
pub const TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA = 49171;
pub const TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA = 49162;
pub const TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA = 49172;
pub const TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 = 49187;
pub const TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 = 49188;
pub const TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 = 49195;
pub const TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 = 49196;
pub const TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 = 49191;
pub const TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 = 49192;
pub const TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 = 49199;
pub const TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 = 49200;
pub const TLS_AES_128_GCM_SHA256 = 4865;
pub const TLS_AES_256_GCM_SHA384 = 4866;
pub const SSL_CK_RC4_128_WITH_MD5 = 65664;
pub const SSL_CK_RC4_128_EXPORT40_WITH_MD5 = 131200;
pub const SSL_CK_RC2_128_CBC_WITH_MD5 = 196736;
pub const SSL_CK_RC2_128_CBC_EXPORT40_WITH_MD5 = 262272;
pub const SSL_CK_IDEA_128_CBC_WITH_MD5 = 327808;
pub const SSL_CK_DES_64_CBC_WITH_MD5 = 393280;
pub const SSL_CK_DES_192_EDE3_CBC_WITH_MD5 = 458944;
pub const TLS_ECC_P256_CURVE_KEY_TYPE = 23;
pub const TLS_ECC_P384_CURVE_KEY_TYPE = 24;
pub const TLS_ECC_P521_CURVE_KEY_TYPE = 25;
pub const NCRYPT_SSL_MAX_NAME_SIZE = 64;
pub const NCRYPT_SSL_CIPHER_SUITE_EX_VERSION = 1;
pub const NCRYPT_SSL_CIPHER_LENGTHS_BLOCK_PADDING = 1;
pub const MSCRYPT_ECC_MAX_OID_LENGTH = 255;
pub const MSCRYPT_ECC_MAX_CURVE_NAME_LENGTH = 255;
pub const NCRYPT_SSL_EAP_PRF_FIELD = 255;
pub const NCRYPT_SSL_EAP_ID = 0;
pub const NCRYPT_SSL_EAP_TTLSV0_ID = 1;
pub const NCRYPT_SSL_EAP_TTLSV0_CHLNG_ID = 2;
pub const NCRYPT_SSL_EAP_FAST_ID = 3;
pub const NCRYPT_SSL_SIGN_INCLUDE_HASHOID = 1;
pub const NCRYPT_SSL_SIGN_USE_PSS_PADDING = 2;
pub const NCRYPT_SSL_EXTERNAL_PSK_FLAG = 1;
pub const NCRYPT_SSL_RESUMPTION_PSK_FLAG = 2;
pub const CRYPT_PROVIDER_IOCTL__GET_SCHANNEL_INTERFACE = 4145180;
pub const CRYPT_PROVSTRUC_VERSION_V3 = 3;
pub const CRYPT_MAX_PROVIDER_ID = 999;
pub const CRYPT_SIG_RESOURCE_VERSION = 256;
pub const CRYPT_EXTERNAL_SIGNATURE_LENGTH = 136;
pub const CRYPT_SIG_RESOURCE_NUMBER = 666;
pub const CRYPT_MAC_RESOURCE_NUMBER = 667;
pub const CUR_OFFLOAD_VERSION = 1;
pub const ROLE_PIN_ALWAYS = 3;
pub const ROLE_PUK = 4;
pub const CLMD_PIV_CERT_DATA_CURRENT_VERSION = 0;
pub const CLMD_PIV_GENERATE_ASYMMETRIC_KEY_CURRENT_VERSION = 0;
pub const CLMD_PIV_PUBLIC_KEY_DATA_CURRENT_VERSION = 0;
pub const CLMD_FILE_TAG_PIV_AUTH_CERT = 6275333;
pub const CLMD_FILE_TAG_SIG_CERT = 6275338;
pub const CLMD_FILE_TAG_KEY_MGMT_CERT = 6275339;
pub const CLMD_FILE_TAG_CARD_AUTH_CERT = 6275329;
pub const CLMD_FILE_TAG_CHUID = 6275330;
pub const CLMD_FILE_TAG_CARD_CAPABILITY_CONTAINER = 6275335;
pub const CLMD_FILE_TAG_UNSIGNED_CHUID = 6275332;
pub const CLMD_FILE_TAG_FINGERPRINT = 6275331;
pub const CLMD_FILE_TAG_SECURITY_OBJECT = 6275334;
pub const CLMD_FILE_TAG_FACIAL_IMAGE = 6275336;
pub const CLMD_FILE_TAG_PRINTED_INFORMATION = 6275337;
pub const CLMD_FILE_TAG_KEY_HISTORY = 6275340;
pub const CLMD_FILE_TAG_FIRST_RETIRED_KEY_MGMT_KEY = 6275341;
pub const CLMD_FILE_TAG_LAST_RETIRED_KEY_MGMT_KEY = 6275360;
pub const SCARD_PROVIDER_CARD_MODULE = 2147483649;
pub const CARD_DATA_VALUE_UNKNOWN = 4294967295;
pub const AT_ECDSA_P256 = 3;
pub const AT_ECDSA_P384 = 4;
pub const AT_ECDSA_P521 = 5;
pub const AT_ECDHE_P256 = 6;
pub const AT_ECDHE_P384 = 7;
pub const AT_ECDHE_P521 = 8;
pub const CARD_CACHE_FILE_CURRENT_VERSION = 1;
pub const MAX_CONTAINER_NAME_LEN = 39;
pub const CONTAINER_MAP_VALID_CONTAINER = 1;
pub const CONTAINER_MAP_DEFAULT_CONTAINER = 2;
pub const CARD_CAPABILITIES_CURRENT_VERSION = 1;
pub const MAX_PINS = 8;
pub const ROLE_EVERYONE = 0;
pub const ROLE_USER = 1;
pub const ROLE_ADMIN = 2;
pub const PIN_SET_NONE = 0;
pub const PIN_SET_ALL_ROLES = 255;
pub const PIN_CHANGE_FLAG_UNBLOCK = 1;
pub const PIN_CHANGE_FLAG_CHANGEPIN = 2;
pub const CP_CACHE_MODE_GLOBAL_CACHE = 1;
pub const CP_CACHE_MODE_SESSION_ONLY = 2;
pub const CP_CACHE_MODE_NO_CACHE = 3;
pub const CARD_AUTHENTICATE_GENERATE_SESSION_PIN = 268435456;
pub const CARD_AUTHENTICATE_SESSION_PIN = 536870912;
pub const CARD_PIN_STRENGTH_PLAINTEXT = 1;
pub const CARD_PIN_STRENGTH_SESSION_PIN = 2;
pub const CARD_PIN_SILENT_CONTEXT = 64;
pub const PIN_CACHE_POLICY_CURRENT_VERSION = 6;
pub const PIN_INFO_CURRENT_VERSION = 6;
pub const PIN_INFO_REQUIRE_SECURE_ENTRY = 1;
pub const CARD_CREATE_CONTAINER_KEY_GEN = 1;
pub const CARD_CREATE_CONTAINER_KEY_IMPORT = 2;
pub const CONTAINER_INFO_CURRENT_VERSION = 1;
pub const CARD_AUTHENTICATE_PIN_CHALLENGE_RESPONSE = 1;
pub const CARD_AUTHENTICATE_PIN_PIN = 2;
pub const CARD_FILE_INFO_CURRENT_VERSION = 1;
pub const CARD_FREE_SPACE_INFO_CURRENT_VERSION = 1;
pub const CARD_KEY_SIZES_CURRENT_VERSION = 1;
pub const CARD_RSA_KEY_DECRYPT_INFO_VERSION_ONE = 1;
pub const CARD_RSA_KEY_DECRYPT_INFO_VERSION_TWO = 2;
pub const CARD_RSA_KEY_DECRYPT_INFO_CURRENT_VERSION = 2;
pub const CARD_PADDING_INFO_PRESENT = 1073741824;
pub const CARD_BUFFER_SIZE_ONLY = 536870912;
pub const CARD_PADDING_NONE = 1;
pub const CARD_PADDING_PKCS1 = 2;
pub const CARD_PADDING_PSS = 4;
pub const CARD_PADDING_OAEP = 8;
pub const CARD_SIGNING_INFO_BASIC_VERSION = 1;
pub const CARD_SIGNING_INFO_CURRENT_VERSION = 2;
pub const CARD_DH_AGREEMENT_INFO_VERSION = 2;
pub const CARD_DERIVE_KEY_VERSION = 1;
pub const CARD_DERIVE_KEY_VERSION_TWO = 2;
pub const CARD_DERIVE_KEY_CURRENT_VERSION = 2;
pub const CARD_RETURN_KEY_HANDLE = 16777216;
pub const CARD_SECURE_KEY_INJECTION_NO_CARD_MODE = 1;
pub const CARD_KEY_IMPORT_PLAIN_TEXT = 1;
pub const CARD_KEY_IMPORT_RSA_KEYEST = 2;
pub const CARD_KEY_IMPORT_ECC_KEYEST = 4;
pub const CARD_KEY_IMPORT_SHARED_SYMMETRIC = 8;
pub const CARD_CIPHER_OPERATION = 1;
pub const CARD_ASYMMETRIC_OPERATION = 2;
pub const CARD_IMPORT_KEYPAIR_VERSION_SEVEN = 7;
pub const CARD_IMPORT_KEYPAIR_CURRENT_VERSION = 7;
pub const CARD_CHANGE_AUTHENTICATOR_VERSION_SEVEN = 7;
pub const CARD_CHANGE_AUTHENTICATOR_CURRENT_VERSION = 7;
pub const CARD_CHANGE_AUTHENTICATOR_RESPONSE_VERSION_SEVEN = 7;
pub const CARD_CHANGE_AUTHENTICATOR_RESPONSE_CURRENT_VERSION = 7;
pub const CARD_AUTHENTICATE_VERSION_SEVEN = 7;
pub const CARD_AUTHENTICATE_CURRENT_VERSION = 7;
pub const CARD_AUTHENTICATE_RESPONSE_VERSION_SEVEN = 7;
pub const CARD_AUTHENTICATE_RESPONSE_CURRENT_VERSION = 7;
pub const CARD_DATA_VERSION_SEVEN = 7;
pub const CARD_DATA_VERSION_SIX = 6;
pub const CARD_DATA_VERSION_FIVE = 5;
pub const CARD_DATA_VERSION_FOUR = 4;
pub const CARD_DATA_CURRENT_VERSION = 7;
pub const BCRYPT_CIPHER_OPERATION = 1;
pub const BCRYPT_HASH_OPERATION = 2;
pub const BCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION = 4;
pub const BCRYPT_SECRET_AGREEMENT_OPERATION = 8;
pub const BCRYPT_SIGNATURE_OPERATION = 16;
pub const BCRYPT_RNG_OPERATION = 32;
pub const NCRYPT_CIPHER_OPERATION = 1;
pub const NCRYPT_HASH_OPERATION = 2;
pub const NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION = 4;
pub const NCRYPT_SECRET_AGREEMENT_OPERATION = 8;
pub const NCRYPT_SIGNATURE_OPERATION = 16;
pub const CERT_FIND_ANY = 0;
pub const CERT_FIND_CERT_ID = 1048576;
pub const CERT_FIND_CTL_USAGE = 655360;
pub const CERT_FIND_ENHKEY_USAGE = 655360;
pub const CERT_FIND_EXISTING = 851968;
pub const CERT_FIND_HASH = 65536;
pub const CERT_FIND_HAS_PRIVATE_KEY = 1376256;
pub const CERT_FIND_ISSUER_ATTR = 196612;
pub const CERT_FIND_ISSUER_NAME = 131076;
pub const CERT_FIND_ISSUER_OF = 786432;
pub const CERT_FIND_ISSUER_STR = 524292;
pub const CERT_FIND_KEY_IDENTIFIER = 983040;
pub const CERT_FIND_KEY_SPEC = 589824;
pub const CERT_FIND_MD5_HASH = 262144;
pub const CERT_FIND_PROPERTY = 327680;
pub const CERT_FIND_PUBLIC_KEY = 393216;
pub const CERT_FIND_SHA1_HASH = 65536;
pub const CERT_FIND_SIGNATURE_HASH = 917504;
pub const CERT_FIND_SUBJECT_ATTR = 196615;
pub const CERT_FIND_SUBJECT_CERT = 720896;
pub const CERT_FIND_SUBJECT_NAME = 131079;
pub const CERT_FIND_SUBJECT_STR = 524295;
pub const CERT_FIND_CROSS_CERT_DIST_POINTS = 1114112;
pub const CERT_FIND_PUBKEY_MD5_HASH = 1179648;
pub const CERT_FIND_SHA256_HASH = 1441792;
pub const CERT_FIND_SHA1_SHA256_HASH = 1507328;
pub const CERT_FIND_SUBJECT_STR_A = 458759;
pub const CERT_FIND_SUBJECT_STR_W = 524295;
pub const CERT_FIND_ISSUER_STR_A = 458756;
pub const CERT_FIND_ISSUER_STR_W = 524292;
pub const CERT_FIND_SUBJECT_INFO_ACCESS = 1245184;
pub const CERT_FIND_HASH_STR = 1310720;
pub const CERT_FIND_OPTIONAL_ENHKEY_USAGE_FLAG = 1;
pub const CERT_FIND_EXT_ONLY_ENHKEY_USAGE_FLAG = 2;
pub const CERT_FIND_PROP_ONLY_ENHKEY_USAGE_FLAG = 4;
pub const CERT_FIND_NO_ENHKEY_USAGE_FLAG = 8;
pub const CERT_FIND_OR_ENHKEY_USAGE_FLAG = 16;
pub const CERT_FIND_VALID_ENHKEY_USAGE_FLAG = 32;
pub const CERT_FIND_OPTIONAL_CTL_USAGE_FLAG = 1;
pub const CERT_FIND_EXT_ONLY_CTL_USAGE_FLAG = 2;
pub const CERT_FIND_PROP_ONLY_CTL_USAGE_FLAG = 4;
pub const CERT_FIND_NO_CTL_USAGE_FLAG = 8;
pub const CERT_FIND_OR_CTL_USAGE_FLAG = 16;
pub const CERT_FIND_VALID_CTL_USAGE_FLAG = 32;
pub const CERT_QUERY_OBJECT_FILE = 1;
pub const CERT_QUERY_OBJECT_BLOB = 2;
pub const CERT_QUERY_CONTENT_CERT = 1;
pub const CERT_QUERY_CONTENT_CTL = 2;
pub const CERT_QUERY_CONTENT_CRL = 3;
pub const CERT_QUERY_CONTENT_SERIALIZED_STORE = 4;
pub const CERT_QUERY_CONTENT_SERIALIZED_CERT = 5;
pub const CERT_QUERY_CONTENT_SERIALIZED_CTL = 6;
pub const CERT_QUERY_CONTENT_SERIALIZED_CRL = 7;
pub const CERT_QUERY_CONTENT_PKCS7_SIGNED = 8;
pub const CERT_QUERY_CONTENT_PKCS7_UNSIGNED = 9;
pub const CERT_QUERY_CONTENT_PKCS7_SIGNED_EMBED = 10;
pub const CERT_QUERY_CONTENT_PKCS10 = 11;
pub const CERT_QUERY_CONTENT_PFX = 12;
pub const CERT_QUERY_CONTENT_CERT_PAIR = 13;
pub const CERT_QUERY_CONTENT_PFX_AND_LOAD = 14;
pub const CERT_QUERY_CONTENT_FLAG_CERT = 2;
pub const CERT_QUERY_CONTENT_FLAG_CTL = 4;
pub const CERT_QUERY_CONTENT_FLAG_CRL = 8;
pub const CERT_QUERY_CONTENT_FLAG_SERIALIZED_STORE = 16;
pub const CERT_QUERY_CONTENT_FLAG_SERIALIZED_CERT = 32;
pub const CERT_QUERY_CONTENT_FLAG_SERIALIZED_CTL = 64;
pub const CERT_QUERY_CONTENT_FLAG_SERIALIZED_CRL = 128;
pub const CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED = 256;
pub const CERT_QUERY_CONTENT_FLAG_PKCS7_UNSIGNED = 512;
pub const CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED_EMBED = 1024;
pub const CERT_QUERY_CONTENT_FLAG_PKCS10 = 2048;
pub const CERT_QUERY_CONTENT_FLAG_PFX = 4096;
pub const CERT_QUERY_CONTENT_FLAG_CERT_PAIR = 8192;
pub const CERT_QUERY_CONTENT_FLAG_PFX_AND_LOAD = 16384;
pub const CERT_QUERY_CONTENT_FLAG_ALL = 16382;
pub const CERT_QUERY_CONTENT_FLAG_ALL_ISSUER_CERT = 818;
pub const CERT_QUERY_FORMAT_BINARY = 1;
pub const CERT_QUERY_FORMAT_BASE64_ENCODED = 2;
pub const CERT_QUERY_FORMAT_ASN_ASCII_HEX_ENCODED = 3;
pub const CERT_QUERY_FORMAT_FLAG_BINARY = 2;
pub const CERT_QUERY_FORMAT_FLAG_BASE64_ENCODED = 4;
pub const CERT_QUERY_FORMAT_FLAG_ASN_ASCII_HEX_ENCODED = 8;
pub const CERT_QUERY_FORMAT_FLAG_ALL = 14;
pub const X509_ASN_ENCODING = 1;
pub const PKCS_7_ASN_ENCODING = 65536;
pub const CERT_RDN_ANY_TYPE = 0;
pub const CERT_RDN_NUMERIC_STRING = 3;
pub const CERT_RDN_PRINTABLE_STRING = 4;
pub const CERT_RDN_T61_STRING = 5;
pub const CERT_RDN_VIDEOTEX_STRING = 6;
pub const CERT_RDN_IA5_STRING = 7;
pub const CERT_RDN_GRAPHIC_STRING = 8;
pub const CERT_RDN_ISO646_STRING = 9;
pub const CERT_RDN_GENERAL_STRING = 10;
pub const CERT_RDN_INT4_STRING = 11;
pub const CERT_RDN_UNICODE_STRING = 12;
pub const CERT_RDN_BMP_STRING = 12;
pub const CERT_RDN_ENCODED_BLOB = 1;
pub const CERT_RDN_OCTET_STRING = 2;
pub const CERT_RDN_TELETEX_STRING = 5;
pub const CERT_RDN_UNIVERSAL_STRING = 11;
pub const CERT_RDN_UTF8_STRING = 13;
pub const CERT_RDN_VISIBLE_STRING = 9;
pub const CERT_SIMPLE_NAME_STR = 1;
pub const CERT_OID_NAME_STR = 2;
pub const CERT_X500_NAME_STR = 3;
pub const CRYPT_LOCAL = 1;
pub const CRYPT_DOMAIN = 2;
pub const AT_KEYEXCHANGE = 1;
pub const AT_SIGNATURE = 2;
pub const CERT_NCRYPT_KEY_SPEC = 4294967295;
pub const BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE = 3;
pub const BCRYPT_CIPHER_INTERFACE = 1;
pub const BCRYPT_HASH_INTERFACE = 2;
pub const BCRYPT_RNG_INTERFACE = 6;
pub const BCRYPT_SECRET_AGREEMENT_INTERFACE = 4;
pub const BCRYPT_SIGNATURE_INTERFACE = 5;
pub const NCRYPT_KEY_STORAGE_INTERFACE = 65537;
pub const NCRYPT_SCHANNEL_INTERFACE = 65538;
pub const NCRYPT_SCHANNEL_SIGNATURE_INTERFACE = 65539;
pub const BCRYPT_BLOCK_PADDING = 1;
pub const BCRYPT_PAD_NONE = 1;
pub const BCRYPT_PAD_OAEP = 4;
pub const BCRYPT_PAD_PKCS1 = 2;
pub const BCRYPT_PAD_PSS = 8;
pub const NCRYPT_SILENT_FLAG = 64;
pub const NCRYPT_NO_PADDING_FLAG = 1;
pub const NCRYPT_PAD_OAEP_FLAG = 4;
pub const NCRYPT_PAD_PKCS1_FLAG = 2;
pub const NCRYPT_REGISTER_NOTIFY_FLAG = 1;
pub const NCRYPT_UNREGISTER_NOTIFY_FLAG = 2;
pub const NCRYPT_MACHINE_KEY_FLAG = 32;
pub const NCRYPT_UNPROTECT_NO_DECRYPT = 1;
pub const NCRYPT_OVERWRITE_KEY_FLAG = 128;
pub const NCRYPT_NO_KEY_VALIDATION = 8;
pub const NCRYPT_WRITE_KEY_TO_LEGACY_STORE_FLAG = 512;
pub const NCRYPT_PAD_PSS_FLAG = 8;
pub const NCRYPT_PERSIST_FLAG = 2147483648;
pub const NCRYPT_PERSIST_ONLY_FLAG = 1073741824;
pub const CRYPT_STRING_BASE64HEADER = 0;
pub const CRYPT_STRING_BASE64 = 1;
pub const CRYPT_STRING_BINARY = 2;
pub const CRYPT_STRING_BASE64REQUESTHEADER = 3;
pub const CRYPT_STRING_HEX = 4;
pub const CRYPT_STRING_HEXASCII = 5;
pub const CRYPT_STRING_BASE64X509CRLHEADER = 9;
pub const CRYPT_STRING_HEXADDR = 10;
pub const CRYPT_STRING_HEXASCIIADDR = 11;
pub const CRYPT_STRING_HEXRAW = 12;
pub const CRYPT_STRING_STRICT = 536870912;
pub const CRYPT_STRING_BASE64_ANY = 6;
pub const CRYPT_STRING_ANY = 7;
pub const CRYPT_STRING_HEX_ANY = 8;
pub const CRYPT_OID_INFO_PUBKEY_SIGN_KEY_FLAG = 2147483648;
pub const CRYPT_OID_INFO_PUBKEY_ENCRYPT_KEY_FLAG = 1073741824;
pub const CRYPT_XML_FLAG_DISABLE_EXTENSIONS = 268435456;
pub const CRYPT_XML_FLAG_NO_SERIALIZE = 2147483648;
pub const CRYPT_XML_SIGN_ADD_KEYVALUE = 1;
pub const CRYPT_ENCODE_ALLOC_FLAG = 32768;
pub const CRYPT_ENCODE_ENABLE_PUNYCODE_FLAG = 131072;
pub const CRYPT_UNICODE_NAME_ENCODE_DISABLE_CHECK_TYPE_FLAG = 1073741824;
pub const CRYPT_UNICODE_NAME_ENCODE_ENABLE_T61_UNICODE_FLAG = 2147483648;
pub const CRYPT_UNICODE_NAME_ENCODE_ENABLE_UTF8_UNICODE_FLAG = 536870912;
pub const CRYPT_OBJECT_LOCATOR_RELEASE_SYSTEM_SHUTDOWN = 1;
pub const CRYPT_OBJECT_LOCATOR_RELEASE_SERVICE_STOP = 2;
pub const CRYPT_OBJECT_LOCATOR_RELEASE_PROCESS_EXIT = 3;
pub const CRYPT_OBJECT_LOCATOR_RELEASE_DLL_UNLOAD = 4;
pub const CRYPT_ACQUIRE_CACHE_FLAG = 1;
pub const CRYPT_ACQUIRE_USE_PROV_INFO_FLAG = 2;
pub const CRYPT_ACQUIRE_COMPARE_KEY_FLAG = 4;
pub const CRYPT_ACQUIRE_NO_HEALING = 8;
pub const CRYPT_ACQUIRE_SILENT_FLAG = 64;
pub const CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG = 128;
pub const CRYPT_ACQUIRE_NCRYPT_KEY_FLAGS_MASK = 458752;
pub const CRYPT_ACQUIRE_ALLOW_NCRYPT_KEY_FLAG = 65536;
pub const CRYPT_ACQUIRE_PREFER_NCRYPT_KEY_FLAG = 131072;
pub const CRYPT_ACQUIRE_ONLY_NCRYPT_KEY_FLAG = 262144;
pub const CRYPT_GET_URL_FROM_PROPERTY = 1;
pub const CRYPT_GET_URL_FROM_EXTENSION = 2;
pub const CRYPT_GET_URL_FROM_UNAUTH_ATTRIBUTE = 4;
pub const CRYPT_GET_URL_FROM_AUTH_ATTRIBUTE = 8;
pub const CERT_STORE_SAVE_AS_PKCS7 = 2;
pub const CERT_STORE_SAVE_AS_STORE = 1;
pub const CRYPT_ANY = 4;
pub const CRYPT_UM = 1;
pub const CRYPT_KM = 2;
pub const CRYPT_MM = 3;
pub const CERT_CHAIN_FIND_BY_ISSUER_COMPARE_KEY_FLAG = 1;
pub const CERT_CHAIN_FIND_BY_ISSUER_COMPLEX_CHAIN_FLAG = 2;
pub const CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_FLAG = 32768;
pub const CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_URL_FLAG = 4;
pub const CERT_CHAIN_FIND_BY_ISSUER_LOCAL_MACHINE_FLAG = 8;
pub const CERT_CHAIN_FIND_BY_ISSUER_NO_KEY_FLAG = 16384;
pub const CERT_STORE_CTRL_COMMIT_FORCE_FLAG = 1;
pub const CERT_STORE_CTRL_COMMIT_CLEAR_FLAG = 2;
pub const CERT_STORE_CTRL_INHIBIT_DUPLICATE_HANDLE_FLAG = 1;
pub const BCRYPT_ALG_HANDLE_HMAC_FLAG = 8;
pub const BCRYPT_PROV_DISPATCH = 1;
pub const BCRYPT_HASH_REUSABLE_FLAG = 32;
pub const CERT_STORE_SAVE_TO_FILE = 1;
pub const CERT_STORE_SAVE_TO_FILENAME = 4;
pub const CERT_STORE_SAVE_TO_FILENAME_A = 3;
pub const CERT_STORE_SAVE_TO_FILENAME_W = 4;
pub const CERT_STORE_SAVE_TO_MEMORY = 2;
pub const PP_CLIENT_HWND = 1;
pub const PP_DELETEKEY = 24;
pub const PP_KEYEXCHANGE_ALG = 14;
pub const PP_KEYEXCHANGE_PIN = 32;
pub const PP_KEYEXCHANGE_KEYSIZE = 12;
pub const PP_KEYSET_SEC_DESCR = 8;
pub const PP_PIN_PROMPT_STRING = 44;
pub const PP_ROOT_CERTSTORE = 46;
pub const PP_SIGNATURE_ALG = 15;
pub const PP_SIGNATURE_PIN = 33;
pub const PP_SIGNATURE_KEYSIZE = 13;
pub const PP_UI_PROMPT = 21;
pub const PP_USE_HARDWARE_RNG = 38;
pub const PP_USER_CERTSTORE = 42;
pub const PP_SECURE_KEYEXCHANGE_PIN = 47;
pub const PP_SECURE_SIGNATURE_PIN = 48;
pub const PP_SMARTCARD_READER = 43;
pub const KP_ALGID = 7;
pub const KP_CERTIFICATE = 26;
pub const KP_PERMISSIONS = 6;
pub const KP_SALT = 2;
pub const KP_SALT_EX = 10;
pub const KP_BLOCKLEN = 8;
pub const KP_GET_USE_COUNT = 42;
pub const KP_KEYLEN = 9;
pub const CRYPT_EXPORTABLE = 1;
pub const CRYPT_USER_PROTECTED = 2;
pub const CRYPT_ARCHIVABLE = 16384;
pub const CRYPT_CREATE_IV = 512;
pub const CRYPT_CREATE_SALT = 4;
pub const CRYPT_DATA_KEY = 2048;
pub const CRYPT_FORCE_KEY_PROTECTION_HIGH = 32768;
pub const CRYPT_KEK = 1024;
pub const CRYPT_INITIATOR = 64;
pub const CRYPT_NO_SALT = 16;
pub const CRYPT_ONLINE = 128;
pub const CRYPT_PREGEN = 64;
pub const CRYPT_RECIPIENT = 16;
pub const CRYPT_SF = 256;
pub const CRYPT_SGCKEY = 8192;
pub const CRYPT_VOLATILE = 4096;
pub const CRYPT_MACHINE_KEYSET = 32;
pub const CRYPT_USER_KEYSET = 4096;
pub const PKCS12_PREFER_CNG_KSP = 256;
pub const PKCS12_ALWAYS_CNG_KSP = 512;
pub const PKCS12_ALLOW_OVERWRITE_KEY = 16384;
pub const PKCS12_NO_PERSIST_KEY = 32768;
pub const PKCS12_INCLUDE_EXTENDED_PROPERTIES = 16;
pub const CRYPT_OAEP = 64;
pub const CRYPT_BLOB_VER3 = 128;
pub const CRYPT_DESTROYKEY = 4;
pub const CRYPT_SSL2_FALLBACK = 2;
pub const CRYPT_Y_ONLY = 1;
pub const CRYPT_IPSEC_HMAC_KEY = 256;
pub const CERT_SET_KEY_PROV_HANDLE_PROP_ID = 1;
pub const CERT_SET_KEY_CONTEXT_PROP_ID = 1;
pub const CMSG_DATA = 1;
pub const CMSG_SIGNED = 2;
pub const CMSG_ENVELOPED = 3;
pub const CMSG_SIGNED_AND_ENVELOPED = 4;
pub const CMSG_HASHED = 5;
pub const CERT_STORE_BACKUP_RESTORE_FLAG = 2048;
pub const CERT_STORE_CREATE_NEW_FLAG = 8192;
pub const CERT_STORE_DEFER_CLOSE_UNTIL_LAST_FREE_FLAG = 4;
pub const CERT_STORE_DELETE_FLAG = 16;
pub const CERT_STORE_ENUM_ARCHIVED_FLAG = 512;
pub const CERT_STORE_MAXIMUM_ALLOWED_FLAG = 4096;
pub const CERT_STORE_NO_CRYPT_RELEASE_FLAG = 1;
pub const CERT_STORE_OPEN_EXISTING_FLAG = 16384;
pub const CERT_STORE_READONLY_FLAG = 32768;
pub const CERT_STORE_SET_LOCALIZED_NAME_FLAG = 2;
pub const CERT_STORE_SHARE_CONTEXT_FLAG = 128;
pub const CERT_STORE_UPDATE_KEYID_FLAG = 1024;
pub const CRYPT_DEFAULT_CONTEXT_AUTO_RELEASE_FLAG = 1;
pub const CRYPT_DEFAULT_CONTEXT_PROCESS_FLAG = 2;
pub const CRYPT_VERIFY_CERT_SIGN_DISABLE_MD2_MD4_FLAG = 1;
pub const CRYPT_VERIFY_CERT_SIGN_SET_STRONG_PROPERTIES_FLAG = 2;
pub const CRYPT_VERIFY_CERT_SIGN_RETURN_STRONG_PROPERTIES_FLAG = 4;
pub const HP_HMAC_INFO = 5;
pub const HP_HASHVAL = 2;
pub const CERT_SYSTEM_STORE_LOCATION_MASK = 16711680;
pub const CERT_SYSTEM_STORE_RELOCATE_FLAG = 2147483648;
pub const CERT_CREATE_SELFSIGN_NO_KEY_INFO = 2;
pub const CERT_CREATE_SELFSIGN_NO_SIGN = 1;
pub const CRYPT_DEFAULT_CONTEXT_CERT_SIGN_OID = 1;
pub const CRYPT_DEFAULT_CONTEXT_MULTI_CERT_SIGN_OID = 2;
pub const CRYPT_ALL_FUNCTIONS = 1;
pub const CRYPT_ALL_PROVIDERS = 2;
pub const CTL_FIND_ANY = 0;
pub const CTL_FIND_SHA1_HASH = 1;
pub const CTL_FIND_MD5_HASH = 2;
pub const CTL_FIND_USAGE = 3;
pub const CTL_FIND_SAME_USAGE_FLAG = 1;
pub const CTL_FIND_EXISTING = 5;
pub const CTL_FIND_SUBJECT = 4;
pub const CRYPT_FIND_USER_KEYSET_FLAG = 1;
pub const CRYPT_FIND_MACHINE_KEYSET_FLAG = 2;
pub const CRYPT_FIND_SILENT_KEYSET_FLAG = 64;
pub const CRYPT_MIN_DEPENDENCIES = 1;
pub const CRYPT_PROCESS_ISOLATE = 65536;
pub const CRL_REASON_UNSPECIFIED = 0;
pub const CRL_REASON_KEY_COMPROMISE = 1;
pub const CRL_REASON_CA_COMPROMISE = 2;
pub const CRL_REASON_AFFILIATION_CHANGED = 3;
pub const CRL_REASON_SUPERSEDED = 4;
pub const CRL_REASON_CESSATION_OF_OPERATION = 5;
pub const CRL_REASON_CERTIFICATE_HOLD = 6;
pub const CRL_REASON_REMOVE_FROM_CRL = 8;
pub const CERT_ROOT_PROGRAM_FLAG_LSC = 64;
pub const CERT_ROOT_PROGRAM_FLAG_ORG = 128;
pub const CERT_ROOT_PROGRAM_FLAG_SUBJECT_LOGO = 32;
pub const CRYPT_XML_KEY_VALUE_TYPE_DSA = 1;
pub const CRYPT_XML_KEY_VALUE_TYPE_RSA = 2;
pub const CRYPT_XML_KEY_VALUE_TYPE_ECDSA = 3;
pub const CRYPT_XML_KEY_VALUE_TYPE_CUSTOM = 4;
pub const CERT_LOGOTYPE_NO_IMAGE_RESOLUTION_CHOICE = 0;
pub const CERT_LOGOTYPE_BITS_IMAGE_RESOLUTION_CHOICE = 1;
pub const CERT_LOGOTYPE_TABLE_SIZE_IMAGE_RESOLUTION_CHOICE = 2;
pub const CMSG_KEY_AGREE_EPHEMERAL_KEY_CHOICE = 1;
pub const CMSG_KEY_AGREE_STATIC_KEY_CHOICE = 2;
pub const CERT_LOGOTYPE_DIRECT_INFO_CHOICE = 1;
pub const CERT_LOGOTYPE_INDIRECT_INFO_CHOICE = 2;
pub const CERT_STORE_PROV_EXTERNAL_FLAG = 1;
pub const CERT_STORE_PROV_DELETED_FLAG = 2;
pub const CERT_STORE_PROV_NO_PERSIST_FLAG = 4;
pub const CERT_STORE_PROV_SYSTEM_STORE_FLAG = 8;
pub const CERT_STORE_PROV_LM_SYSTEM_STORE_FLAG = 16;
pub const CMSG_KEY_AGREE_ORIGINATOR_CERT = 1;
pub const CMSG_KEY_AGREE_ORIGINATOR_PUBLIC_KEY = 2;
pub const CRYPT_EXCLUSIVE = 1;
pub const CRYPT_OVERRIDE = 65536;
pub const BCRYPT_DSA_PUBLIC_MAGIC = 1112560452;
pub const BCRYPT_DSA_PRIVATE_MAGIC = 1448104772;
pub const CRYPT_XML_X509DATA_TYPE_ISSUER_SERIAL = 1;
pub const CRYPT_XML_X509DATA_TYPE_SKI = 2;
pub const CRYPT_XML_X509DATA_TYPE_SUBJECT_NAME = 3;
pub const CRYPT_XML_X509DATA_TYPE_CERTIFICATE = 4;
pub const CRYPT_XML_X509DATA_TYPE_CRL = 5;
pub const CRYPT_XML_X509DATA_TYPE_CUSTOM = 6;
pub const CERT_BIOMETRIC_PREDEFINED_DATA_CHOICE = 1;
pub const CERT_BIOMETRIC_OID_DATA_CHOICE = 2;
pub const CERT_CHAIN_POLICY_IGNORE_NOT_TIME_VALID_FLAG = 1;
pub const CERT_CHAIN_POLICY_IGNORE_CTL_NOT_TIME_VALID_FLAG = 2;
pub const CERT_CHAIN_POLICY_IGNORE_NOT_TIME_NESTED_FLAG = 4;
pub const CERT_CHAIN_POLICY_IGNORE_INVALID_BASIC_CONSTRAINTS_FLAG = 8;
pub const CERT_CHAIN_POLICY_IGNORE_ALL_NOT_TIME_VALID_FLAGS = 7;
pub const CERT_CHAIN_POLICY_ALLOW_UNKNOWN_CA_FLAG = 16;
pub const CERT_CHAIN_POLICY_IGNORE_WRONG_USAGE_FLAG = 32;
pub const CERT_CHAIN_POLICY_IGNORE_INVALID_NAME_FLAG = 64;
pub const CERT_CHAIN_POLICY_IGNORE_INVALID_POLICY_FLAG = 128;
pub const CERT_CHAIN_POLICY_IGNORE_END_REV_UNKNOWN_FLAG = 256;
pub const CERT_CHAIN_POLICY_IGNORE_CTL_SIGNER_REV_UNKNOWN_FLAG = 512;
pub const CERT_CHAIN_POLICY_IGNORE_CA_REV_UNKNOWN_FLAG = 1024;
pub const CERT_CHAIN_POLICY_IGNORE_ROOT_REV_UNKNOWN_FLAG = 2048;
pub const CERT_CHAIN_POLICY_IGNORE_ALL_REV_UNKNOWN_FLAGS = 3840;
pub const CERT_CHAIN_POLICY_ALLOW_TESTROOT_FLAG = 32768;
pub const CERT_CHAIN_POLICY_TRUST_TESTROOT_FLAG = 16384;
pub const CERT_CHAIN_POLICY_IGNORE_NOT_SUPPORTED_CRITICAL_EXT_FLAG = 8192;
pub const CERT_CHAIN_POLICY_IGNORE_PEER_TRUST_FLAG = 4096;
pub const CERT_CHAIN_POLICY_IGNORE_WEAK_SIGNATURE_FLAG = 134217728;
pub const BASIC_CONSTRAINTS_CERT_CHAIN_POLICY_CA_FLAG = 2147483648;
pub const BASIC_CONSTRAINTS_CERT_CHAIN_POLICY_END_ENTITY_FLAG = 1073741824;
pub const MICROSOFT_ROOT_CERT_CHAIN_POLICY_ENABLE_TEST_ROOT_FLAG = 65536;
pub const MICROSOFT_ROOT_CERT_CHAIN_POLICY_CHECK_APPLICATION_ROOT_FLAG = 131072;
pub const MICROSOFT_ROOT_CERT_CHAIN_POLICY_DISABLE_FLIGHT_ROOT_FLAG = 262144;
pub const CERT_STRONG_SIGN_ENABLE_CRL_CHECK = 1;
pub const CERT_STRONG_SIGN_ENABLE_OCSP_CHECK = 2;
pub const CERT_LOGOTYPE_GRAY_SCALE_IMAGE_INFO_CHOICE = 1;
pub const CERT_LOGOTYPE_COLOR_IMAGE_INFO_CHOICE = 2;
pub const CRYPT_XML_STATUS_INTERNAL_REFERENCE = 1;
pub const CRYPT_XML_STATUS_KEY_AVAILABLE = 2;
pub const CRYPT_XML_STATUS_DIGESTING = 4;
pub const CRYPT_XML_STATUS_DIGEST_VALID = 8;
pub const CRYPT_XML_STATUS_SIGNATURE_VALID = 65536;
pub const CRYPT_XML_STATUS_OPENED_TO_ENCODE = 2147483648;
pub const CRYPT_XML_TRANSFORM_ON_STREAM = 1;
pub const CRYPT_XML_TRANSFORM_ON_NODESET = 2;
pub const CRYPT_XML_TRANSFORM_URI_QUERY_STRING = 3;
pub const CRYPT_XML_GROUP_ID_HASH = 1;
pub const CRYPT_XML_GROUP_ID_SIGN = 2;
pub const CERT_SELECT_BY_ENHKEY_USAGE = 1;
pub const CERT_SELECT_BY_KEY_USAGE = 2;
pub const CERT_SELECT_BY_POLICY_OID = 3;
pub const CERT_SELECT_BY_PROV_NAME = 4;
pub const CERT_SELECT_BY_EXTENSION = 5;
pub const CERT_SELECT_BY_SUBJECT_HOST_NAME = 6;
pub const CERT_SELECT_BY_ISSUER_ATTR = 7;
pub const CERT_SELECT_BY_SUBJECT_ATTR = 8;
pub const CERT_SELECT_BY_ISSUER_NAME = 9;
pub const CERT_SELECT_BY_PUBLIC_KEY = 10;
pub const CERT_SELECT_BY_TLS_SIGNATURES = 11;
pub const BCRYPT_RSAPUBLIC_MAGIC = 826364754;
pub const BCRYPT_RSAPRIVATE_MAGIC = 843141970;
pub const BCRYPT_RSAFULLPRIVATE_MAGIC = 859919186;
pub const CRYPT_XML_KEYINFO_TYPE_KEYNAME = 1;
pub const CRYPT_XML_KEYINFO_TYPE_KEYVALUE = 2;
pub const CRYPT_XML_KEYINFO_TYPE_RETRIEVAL = 3;
pub const CRYPT_XML_KEYINFO_TYPE_X509DATA = 4;
pub const CRYPT_XML_KEYINFO_TYPE_CUSTOM = 5;
pub const TIMESTAMP_VERSION = 1;
pub const CERT_ID_ISSUER_SERIAL_NUMBER = 1;
pub const CERT_ID_KEY_IDENTIFIER = 2;
pub const CERT_ID_SHA1_HASH = 3;
pub const AUTHTYPE_CLIENT = 1;
pub const AUTHTYPE_SERVER = 2;
pub const BCRYPT_DH_PUBLIC_MAGIC = 1112557636;
pub const BCRYPT_DH_PRIVATE_MAGIC = 1448101956;
pub const CRYPT_XML_STATUS_ERROR_NOT_RESOLVED = 1;
pub const CRYPT_XML_STATUS_ERROR_DIGEST_INVALID = 2;
pub const CRYPT_XML_STATUS_ERROR_NOT_SUPPORTED_ALGORITHM = 5;
pub const CRYPT_XML_STATUS_ERROR_NOT_SUPPORTED_TRANSFORM = 8;
pub const CRYPT_XML_STATUS_ERROR_SIGNATURE_INVALID = 65536;
pub const CRYPT_XML_STATUS_ERROR_KEYINFO_NOT_PARSED = 131072;
pub const TIMESTAMP_STATUS_GRANTED = 0;
pub const TIMESTAMP_STATUS_GRANTED_WITH_MODS = 1;
pub const TIMESTAMP_STATUS_REJECTED = 2;
pub const TIMESTAMP_STATUS_WAITING = 3;
pub const TIMESTAMP_STATUS_REVOCATION_WARNING = 4;
pub const TIMESTAMP_STATUS_REVOKED = 5;
pub const NCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE = 3;
pub const NCRYPT_SECRET_AGREEMENT_INTERFACE = 4;
pub const NCRYPT_SIGNATURE_INTERFACE = 5;
pub const BCRYPT_RNG_USE_ENTROPY_IN_BUFFER = 1;
pub const BCRYPT_USE_SYSTEM_PREFERRED_RNG = 2;
pub const SIG_APPEND = 4096;
pub const SPC_INC_PE_RESOURCES_FLAG = 128;
pub const SPC_INC_PE_DEBUG_INFO_FLAG = 64;
pub const SPC_INC_PE_IMPORT_ADDR_TABLE_FLAG = 32;
pub const SPC_EXC_PE_PAGE_HASHES_FLAG = 16;
pub const SPC_INC_PE_PAGE_HASHES_FLAG = 256;
pub const SPC_DIGEST_GENERATE_FLAG = 512;
pub const SPC_DIGEST_SIGN_FLAG = 1024;
pub const SPC_DIGEST_SIGN_EX_FLAG = 16384;
pub const SIGNER_TIMESTAMP_AUTHENTICODE = 1;
pub const SIGNER_TIMESTAMP_RFC3161 = 2;
pub const SIGNER_SUBJECT_FILE = 1;
pub const SIGNER_SUBJECT_BLOB = 2;
pub const SIGNER_NO_ATTR = 0;
pub const SIGNER_AUTHCODE_ATTR = 1;
pub const PVK_TYPE_FILE_NAME = 1;
pub const PVK_TYPE_KEYCONTAINER = 2;
pub const SIGNER_CERT_POLICY_STORE = 1;
pub const SIGNER_CERT_POLICY_CHAIN = 2;
pub const SIGNER_CERT_POLICY_SPC = 4;
pub const SIGNER_CERT_POLICY_CHAIN_NO_ROOT = 8;
pub const SIGNER_CERT_SPC_FILE = 1;
pub const SIGNER_CERT_STORE = 2;
pub const SIGNER_CERT_SPC_CHAIN = 3;
pub const CALG_MD2 = 32769;
pub const CALG_MD4 = 32770;
pub const CALG_MD5 = 32771;
pub const CALG_SHA = 32772;
pub const CALG_SHA1 = 32772;
pub const CALG_MAC = 32773;
pub const CALG_RSA_SIGN = 9216;
pub const CALG_DSS_SIGN = 8704;
pub const CALG_NO_SIGN = 8192;
pub const CALG_RSA_KEYX = 41984;
pub const CALG_DES = 26113;
pub const CALG_3DES_112 = 26121;
pub const CALG_3DES = 26115;
pub const CALG_DESX = 26116;
pub const CALG_RC2 = 26114;
pub const CALG_RC4 = 26625;
pub const CALG_SEAL = 26626;
pub const CALG_DH_SF = 43521;
pub const CALG_DH_EPHEM = 43522;
pub const CALG_AGREEDKEY_ANY = 43523;
pub const CALG_KEA_KEYX = 43524;
pub const CALG_HUGHES_MD5 = 40963;
pub const CALG_SKIPJACK = 26122;
pub const CALG_TEK = 26123;
pub const CALG_CYLINK_MEK = 26124;
pub const CALG_SSL3_SHAMD5 = 32776;
pub const CALG_SSL3_MASTER = 19457;
pub const CALG_SCHANNEL_MASTER_HASH = 19458;
pub const CALG_SCHANNEL_MAC_KEY = 19459;
pub const CALG_SCHANNEL_ENC_KEY = 19463;
pub const CALG_PCT1_MASTER = 19460;
pub const CALG_SSL2_MASTER = 19461;
pub const CALG_TLS1_MASTER = 19462;
pub const CALG_RC5 = 26125;
pub const CALG_HMAC = 32777;
pub const CALG_TLS1PRF = 32778;
pub const CALG_HASH_REPLACE_OWF = 32779;
pub const CALG_AES_128 = 26126;
pub const CALG_AES_192 = 26127;
pub const CALG_AES_256 = 26128;
pub const CALG_AES = 26129;
pub const CALG_SHA_256 = 32780;
pub const CALG_SHA_384 = 32781;
pub const CALG_SHA_512 = 32782;
pub const CALG_ECDH = 43525;
pub const CALG_ECDH_EPHEM = 44550;
pub const CALG_ECMQV = 40961;
pub const CALG_ECDSA = 8707;
pub const CALG_NULLCIPHER = 24576;
pub const CALG_THIRDPARTY_KEY_EXCHANGE = 45056;
pub const CALG_THIRDPARTY_SIGNATURE = 12288;
pub const CALG_THIRDPARTY_CIPHER = 28672;
pub const CALG_THIRDPARTY_HASH = 36864;
pub const BCRYPT_ECC_PRIME_SHORT_WEIERSTRASS_CURVE = 1;
pub const BCRYPT_ECC_PRIME_TWISTED_EDWARDS_CURVE = 2;
pub const BCRYPT_ECC_PRIME_MONTGOMERY_CURVE = 3;
pub const BCRYPT_NO_CURVE_GENERATION_ALG_ID = 0;
pub const DSA_HASH_ALGORITHM_SHA1 = 0;
pub const DSA_HASH_ALGORITHM_SHA256 = 1;
pub const DSA_HASH_ALGORITHM_SHA512 = 2;
pub const DSA_FIPS186_2 = 0;
pub const DSA_FIPS186_3 = 1;
pub const BCRYPT_HASH_OPERATION_HASH_DATA = 1;
pub const BCRYPT_HASH_OPERATION_FINISH_HASH = 2;
pub const BCRYPT_OPERATION_TYPE_HASH = 1;
pub const KeyTypeOther = 0;
pub const KeyTypeVirtualSmartCard = 1;
pub const KeyTypePhysicalSmartCard = 2;
pub const KeyTypePassport = 3;
pub const KeyTypePassportRemote = 4;
pub const KeyTypePassportSmartCard = 5;
pub const KeyTypeHardware = 6;
pub const KeyTypeSoftware = 7;
pub const KeyTypeSelfSigned = 8;
pub const CRYPT_XML_CHARSET_AUTO = 0;
pub const CRYPT_XML_CHARSET_UTF8 = 1;
pub const CRYPT_XML_CHARSET_UTF16LE = 2;
pub const CRYPT_XML_CHARSET_UTF16BE = 3;
pub const CRYPT_XML_PROPERTY_MAX_HEAP_SIZE = 1;
pub const CRYPT_XML_PROPERTY_SIGNATURE_LOCATION = 2;
pub const CRYPT_XML_PROPERTY_MAX_SIGNATURES = 3;
pub const CRYPT_XML_PROPERTY_DOC_DECLARATION = 4;
pub const CRYPT_XML_PROPERTY_XML_OUTPUT_CHARSET = 5;
pub const CRYPT_XML_KEYINFO_SPEC_NONE = 0;
pub const CRYPT_XML_KEYINFO_SPEC_ENCODED = 1;
pub const CRYPT_XML_KEYINFO_SPEC_PARAM = 2;
pub const Asymmetric = 1;
pub const Symmetric = 2;
pub const Transform = 3;
pub const Hash = 4;
pub const None = 1;
pub const PKCS7 = 2;
pub const Zeros = 3;
pub const ANSIX923 = 4;
pub const ISO10126 = 5;
pub const DirectionEncrypt = 1;
pub const DirectionDecrypt = 2;
pub const ENUM_SETUPPROP_INVALID = -1;
pub const ENUM_SETUPPROP_CATYPE = 0;
pub const ENUM_SETUPPROP_CAKEYINFORMATION = 1;
pub const ENUM_SETUPPROP_INTERACTIVE = 2;
pub const ENUM_SETUPPROP_CANAME = 3;
pub const ENUM_SETUPPROP_CADSSUFFIX = 4;
pub const ENUM_SETUPPROP_VALIDITYPERIOD = 5;
pub const ENUM_SETUPPROP_VALIDITYPERIODUNIT = 6;
pub const ENUM_SETUPPROP_EXPIRATIONDATE = 7;
pub const ENUM_SETUPPROP_PRESERVEDATABASE = 8;
pub const ENUM_SETUPPROP_DATABASEDIRECTORY = 9;
pub const ENUM_SETUPPROP_LOGDIRECTORY = 10;
pub const ENUM_SETUPPROP_SHAREDFOLDER = 11;
pub const ENUM_SETUPPROP_PARENTCAMACHINE = 12;
pub const ENUM_SETUPPROP_PARENTCANAME = 13;
pub const ENUM_SETUPPROP_REQUESTFILE = 14;
pub const ENUM_SETUPPROP_WEBCAMACHINE = 15;
pub const ENUM_SETUPPROP_WEBCANAME = 16;
pub const ENUM_CEPSETUPPROP_USELOCALSYSTEM = 0;
pub const ENUM_CEPSETUPPROP_USECHALLENGE = 1;
pub const ENUM_CEPSETUPPROP_RANAME_CN = 2;
pub const ENUM_CEPSETUPPROP_RANAME_EMAIL = 3;
pub const ENUM_CEPSETUPPROP_RANAME_COMPANY = 4;
pub const ENUM_CEPSETUPPROP_RANAME_DEPT = 5;
pub const ENUM_CEPSETUPPROP_RANAME_CITY = 6;
pub const ENUM_CEPSETUPPROP_RANAME_STATE = 7;
pub const ENUM_CEPSETUPPROP_RANAME_COUNTRY = 8;
pub const ENUM_CEPSETUPPROP_SIGNINGKEYINFORMATION = 9;
pub const ENUM_CEPSETUPPROP_EXCHANGEKEYINFORMATION = 10;
pub const ENUM_CEPSETUPPROP_CAINFORMATION = 11;
pub const ENUM_CEPSETUPPROP_MSCEPURL = 12;
pub const ENUM_CEPSETUPPROP_CHALLENGEURL = 13;
pub const ENUM_CESSETUPPROP_USE_IISAPPPOOLIDENTITY = 0;
pub const ENUM_CESSETUPPROP_CACONFIG = 1;
pub const ENUM_CESSETUPPROP_AUTHENTICATION = 2;
pub const ENUM_CESSETUPPROP_SSLCERTHASH = 3;
pub const ENUM_CESSETUPPROP_URL = 4;
pub const ENUM_CESSETUPPROP_RENEWALONLY = 5;
pub const ENUM_CESSETUPPROP_ALLOW_KEYBASED_RENEWAL = 6;
pub const ENUM_CEPSETUPPROP_AUTHENTICATION = 0;
pub const ENUM_CEPSETUPPROP_SSLCERTHASH = 1;
pub const ENUM_CEPSETUPPROP_URL = 2;
pub const ENUM_CEPSETUPPROP_KEYBASED_RENEWAL = 3;
pub const InvalidDirAc = 0;
pub const UserCreateDeleteDirAc = 1;
pub const AdminCreateDeleteDirAc = 2;
pub const InvalidAc = 0;
pub const EveryoneReadUserWriteAc = 1;
pub const UserWriteExecuteAc = 2;
pub const EveryoneReadAdminWriteAc = 3;
pub const UnknownAc = 4;
pub const UserReadWriteAc = 5;
pub const AdminReadWriteAc = 6;
pub const AlphaNumericPinType = 0;
pub const ExternalPinType = 1;
pub const ChallengeResponsePinType = 2;
pub const EmptyPinType = 3;
pub const AuthenticationPin = 0;
pub const DigitalSignaturePin = 1;
pub const EncryptionPin = 2;
pub const NonRepudiationPin = 3;
pub const AdministratorPin = 4;
pub const PrimaryCardPin = 5;
pub const UnblockOnlyPin = 6;
pub const PinCacheNormal = 0;
pub const PinCacheTimed = 1;
pub const PinCacheNone = 2;
pub const PinCacheAlwaysPrompt = 3;

pub const aliases = struct {
    pub const BCRYPT_OPERATION = u32;
    pub const NCRYPT_OPERATION = u32;
    pub const CERT_FIND_FLAGS = u32;
    pub const CERT_QUERY_OBJECT_TYPE = u32;
    pub const CERT_QUERY_CONTENT_TYPE = u32;
    pub const CERT_QUERY_CONTENT_TYPE_FLAGS = u32;
    pub const CERT_QUERY_FORMAT_TYPE = u32;
    pub const CERT_QUERY_FORMAT_TYPE_FLAGS = u32;
    pub const CERT_QUERY_ENCODING_TYPE = u32;
    pub const CERT_RDN_ATTR_VALUE_TYPE = i32;
    pub const CERT_STRING_TYPE = u32;
    pub const BCRYPT_TABLE = u32;
    pub const CERT_KEY_SPEC = u32;
    pub const BCRYPT_INTERFACE = u32;
    pub const BCRYPT_FLAGS = u32;
    pub const NCRYPT_FLAGS = u32;
    pub const CRYPT_STRING = u32;
    pub const CRYPT_IMPORT_PUBLIC_KEY_FLAGS = u32;
    pub const CRYPT_XML_FLAGS = u32;
    pub const CRYPT_ENCODE_OBJECT_FLAGS = u32;
    pub const CRYPT_OBJECT_LOCATOR_RELEASE_REASON = u32;
    pub const CRYPT_ACQUIRE_FLAGS = u32;
    pub const CRYPT_GET_URL_FLAGS = u32;
    pub const CERT_STORE_SAVE_AS = u32;
    pub const BCRYPT_QUERY_PROVIDER_MODE = u32;
    pub const CERT_FIND_CHAIN_IN_STORE_FLAGS = u32;
    pub const CERT_CONTROL_STORE_FLAGS = u32;
    pub const BCRYPT_OPEN_ALGORITHM_PROVIDER_FLAGS = u32;
    pub const CERT_STORE_SAVE_TO = u32;
    pub const CRYPT_SET_PROV_PARAM_ID = u32;
    pub const CRYPT_KEY_PARAM_ID = u32;
    pub const CRYPT_KEY_FLAGS = u32;
    pub const CRYPT_MSG_TYPE = u32;
    pub const CERT_OPEN_STORE_FLAGS = u32;
    pub const CRYPT_DEFAULT_CONTEXT_FLAGS = u32;
    pub const CRYPT_VERIFY_CERT_FLAGS = u32;
    pub const CRYPT_SET_HASH_PARAM = u32;
    pub const CERT_SYSTEM_STORE_FLAGS = u32;
    pub const CERT_CREATE_SELFSIGN_FLAGS = u32;
    pub const CRYPT_DEFAULT_CONTEXT_TYPE = u32;
    pub const BCRYPT_RESOLVE_PROVIDERS_FLAGS = u32;
    pub const CERT_FIND_TYPE = u32;
    pub const CRYPT_FIND_FLAGS = u32;
    pub const CRYPT_IMAGE_REF_FLAGS = u32;
    pub const CERT_REVOCATION_STATUS_REASON = u32;
    pub const CERT_ROOT_PROGRAM_FLAGS = u32;
    pub const CRYPT_XML_KEY_VALUE_TYPE = u32;
    pub const CERT_LOGOTYPE_CHOICE = u32;
    pub const CMSG_KEY_AGREE_OPTION = u32;
    pub const CERT_LOGOTYPE_OPTION = u32;
    pub const CERT_STORE_PROV_FLAGS = u32;
    pub const CMSG_KEY_AGREE_ORIGINATOR = u32;
    pub const CRYPT_CONTEXT_CONFIG_FLAGS = u32;
    pub const BCRYPT_DSA_MAGIC = u32;
    pub const CRYPT_XML_X509DATA_TYPE = u32;
    pub const CERT_BIOMETRIC_DATA_TYPE = u32;
    pub const CERT_CHAIN_POLICY_FLAGS = u32;
    pub const CERT_STRONG_SIGN_FLAGS = u32;
    pub const CERT_LOGOTYPE_IMAGE_INFO_TYPE = u32;
    pub const CRYPT_XML_STATUS_INFO_STATUS = u32;
    pub const CRYPT_XML_TRANSFORM_FLAGS = u32;
    pub const CRYPT_XML_GROUP_ID = u32;
    pub const CERT_SELECT_CRITERIA_TYPE = u32;
    pub const BCRYPT_RSAKEY_BLOB_MAGIC = u32;
    pub const CRYPT_XML_KEYINFO_TYPE = u32;
    pub const CRYPT_TIMESTAMP_VERSION = u32;
    pub const CERT_ID_OPTION = u32;
    pub const HTTPSPOLICY_CALLBACK_DATA_AUTH_TYPE = u32;
    pub const BCRYPT_DH_KEY_BLOB_MAGIC = u32;
    pub const CRYPT_XML_STATUS_ERROR_STATUS = u32;
    pub const CRYPT_TIMESTAMP_RESPONSE_STATUS = u32;
    pub const NCRYPT_ALGORITHM_NAME_CLASS = u32;
    pub const BCRYPTGENRANDOM_FLAGS = u32;
    pub const SIGNER_SIGN_FLAGS = u32;
    pub const SIGNER_TIMESTAMP_FLAGS = u32;
    pub const SIGNER_SUBJECT_CHOICE = u32;
    pub const SIGNER_SIGNATURE_ATTRIBUTE_CHOICE = u32;
    pub const SIGNER_PRIVATE_KEY_CHOICE = u32;
    pub const SIGNER_CERT_POLICY = u32;
    pub const SIGNER_CERT_CHOICE = u32;
    pub const ALG_ID = u32;
    pub const ECC_CURVE_TYPE_ENUM = i32;
    pub const ECC_CURVE_ALG_ID_ENUM = i32;
    pub const HASHALGORITHM_ENUM = i32;
    pub const DSAFIPSVERSION_ENUM = i32;
    pub const BCRYPT_HASH_OPERATION_TYPE = i32;
    pub const BCRYPT_MULTI_OPERATION_TYPE = i32;
    pub const CertKeyType = u32;
    pub const CRYPT_XML_CHARSET = i32;
    pub const CRYPT_XML_PROPERTY_ID = i32;
    pub const CRYPT_XML_KEYINFO_SPEC = i32;
    pub const HandleType = i32;
    pub const PaddingMode = i32;
    pub const Direction = i32;
    pub const CASetupProperty = i32;
    pub const MSCEPSetupProperty = i32;
    pub const CESSetupProperty = i32;
    pub const CEPSetupProperty = i32;
    pub const CARD_DIRECTORY_ACCESS_CONDITION = i32;
    pub const CARD_FILE_ACCESS_CONDITION = i32;
    pub const SECRET_TYPE = i32;
    pub const SECRET_PURPOSE = i32;
    pub const PIN_CACHE_POLICY_TYPE = i32;
    pub const HCRYPTASYNC = isize;
    pub const HCERTCHAINENGINE = ?*anyopaque;
    pub const BCRYPT_ALG_HANDLE = ?*anyopaque;
    pub const BCRYPT_KEY_HANDLE = ?*anyopaque;
    pub const BCRYPT_HASH_HANDLE = ?*anyopaque;
    pub const BCRYPT_SECRET_HANDLE = ?*anyopaque;
    pub const NCRYPT_PROV_HANDLE = usize;
    pub const NCRYPT_KEY_HANDLE = usize;
    pub const BCRYPT_HANDLE = ?*anyopaque;
    pub const NCRYPT_HANDLE = usize;
    pub const NCRYPT_HASH_HANDLE = usize;
    pub const NCRYPT_SECRET_HANDLE = usize;
    pub const HCRYPTPROV_LEGACY = usize;
    pub const HCRYPTPROV_OR_NCRYPT_KEY_HANDLE = usize;
    pub const HCERTSTORE = ?*anyopaque;
    pub const HCERTSTOREPROV = ?*anyopaque;
};
