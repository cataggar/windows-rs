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
    .{ "MsiCloseHandle", MethodRecord{ .library = "msi", .import = "MsiCloseHandle", .signature = "\x00\x01\x09\x11\x15" } },
    .{ "MsiCloseAllHandles", MethodRecord{ .library = "msi", .import = "MsiCloseAllHandles", .signature = "\x00\x00\x09" } },
    .{ "MsiSetInternalUI", MethodRecord{ .library = "msi", .import = "MsiSetInternalUI", .signature = "\x00\x02\x11\x21\x11\x21\x0f\x11\x25" } },
    .{ "MsiSetExternalUIA", MethodRecord{ .library = "msi", .import = "MsiSetExternalUIA", .signature = "\x00\x03\x12\x29\x12\x29\x09\x0f\x01" } },
    .{ "MsiSetExternalUIW", MethodRecord{ .library = "msi", .import = "MsiSetExternalUIW", .signature = "\x00\x03\x12\x31\x12\x31\x09\x0f\x01" } },
    .{ "MsiSetExternalUIRecord", MethodRecord{ .library = "msi", .import = "MsiSetExternalUIRecord", .signature = "\x00\x04\x09\x12\x39\x09\x0f\x01\x12\x39" } },
    .{ "MsiEnableLogA", MethodRecord{ .library = "msi", .import = "MsiEnableLogA", .signature = "\x00\x03\x09\x09\x11\x3d\x09" } },
    .{ "MsiEnableLogW", MethodRecord{ .library = "msi", .import = "MsiEnableLogW", .signature = "\x00\x03\x09\x09\x11\x05\x09" } },
    .{ "MsiQueryProductStateA", MethodRecord{ .library = "msi", .import = "MsiQueryProductStateA", .signature = "\x00\x01\x11\x45\x11\x3d" } },
    .{ "MsiQueryProductStateW", MethodRecord{ .library = "msi", .import = "MsiQueryProductStateW", .signature = "\x00\x01\x11\x45\x11\x05" } },
    .{ "MsiGetProductInfoA", MethodRecord{ .library = "msi", .import = "MsiGetProductInfoA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "MsiGetProductInfoW", MethodRecord{ .library = "msi", .import = "MsiGetProductInfoW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x05\x0f\x09" } },
    .{ "MsiGetProductInfoExA", MethodRecord{ .library = "msi", .import = "MsiGetProductInfoExA", .signature = "\x00\x06\x09\x11\x3d\x11\x3d\x11\x4d\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "MsiGetProductInfoExW", MethodRecord{ .library = "msi", .import = "MsiGetProductInfoExW", .signature = "\x00\x06\x09\x11\x05\x11\x05\x11\x4d\x11\x05\x11\x05\x0f\x09" } },
    .{ "MsiInstallProductA", MethodRecord{ .library = "msi", .import = "MsiInstallProductA", .signature = "\x00\x02\x09\x11\x3d\x11\x3d" } },
    .{ "MsiInstallProductW", MethodRecord{ .library = "msi", .import = "MsiInstallProductW", .signature = "\x00\x02\x09\x11\x05\x11\x05" } },
    .{ "MsiConfigureProductA", MethodRecord{ .library = "msi", .import = "MsiConfigureProductA", .signature = "\x00\x03\x09\x11\x3d\x11\x51\x11\x45" } },
    .{ "MsiConfigureProductW", MethodRecord{ .library = "msi", .import = "MsiConfigureProductW", .signature = "\x00\x03\x09\x11\x05\x11\x51\x11\x45" } },
    .{ "MsiConfigureProductExA", MethodRecord{ .library = "msi", .import = "MsiConfigureProductExA", .signature = "\x00\x04\x09\x11\x3d\x11\x51\x11\x45\x11\x3d" } },
    .{ "MsiConfigureProductExW", MethodRecord{ .library = "msi", .import = "MsiConfigureProductExW", .signature = "\x00\x04\x09\x11\x05\x11\x51\x11\x45\x11\x05" } },
    .{ "MsiReinstallProductA", MethodRecord{ .library = "msi", .import = "MsiReinstallProductA", .signature = "\x00\x02\x09\x11\x3d\x09" } },
    .{ "MsiReinstallProductW", MethodRecord{ .library = "msi", .import = "MsiReinstallProductW", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "MsiAdvertiseProductExA", MethodRecord{ .library = "msi", .import = "MsiAdvertiseProductExA", .signature = "\x00\x06\x09\x11\x3d\x11\x3d\x11\x3d\x07\x09\x09" } },
    .{ "MsiAdvertiseProductExW", MethodRecord{ .library = "msi", .import = "MsiAdvertiseProductExW", .signature = "\x00\x06\x09\x11\x05\x11\x05\x11\x05\x07\x09\x09" } },
    .{ "MsiAdvertiseProductA", MethodRecord{ .library = "msi", .import = "MsiAdvertiseProductA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x11\x3d\x07" } },
    .{ "MsiAdvertiseProductW", MethodRecord{ .library = "msi", .import = "MsiAdvertiseProductW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x05\x07" } },
    .{ "MsiProcessAdvertiseScriptA", MethodRecord{ .library = "msi", .import = "MsiProcessAdvertiseScriptA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x11\x55\x11\x59\x11\x59" } },
    .{ "MsiProcessAdvertiseScriptW", MethodRecord{ .library = "msi", .import = "MsiProcessAdvertiseScriptW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x55\x11\x59\x11\x59" } },
    .{ "MsiAdvertiseScriptA", MethodRecord{ .library = "msi", .import = "MsiAdvertiseScriptA", .signature = "\x00\x04\x09\x11\x3d\x09\x0f\x11\x55\x11\x59" } },
    .{ "MsiAdvertiseScriptW", MethodRecord{ .library = "msi", .import = "MsiAdvertiseScriptW", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\x55\x11\x59" } },
    .{ "MsiGetProductInfoFromScriptA", MethodRecord{ .library = "msi", .import = "MsiGetProductInfoFromScriptA", .signature = "\x00\x08\x09\x11\x3d\x11\x3d\x0f\x07\x0f\x09\x11\x3d\x0f\x09\x11\x3d\x0f\x09" } },
    .{ "MsiGetProductInfoFromScriptW", MethodRecord{ .library = "msi", .import = "MsiGetProductInfoFromScriptW", .signature = "\x00\x08\x09\x11\x05\x11\x05\x0f\x07\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09" } },
    .{ "MsiGetProductCodeA", MethodRecord{ .library = "msi", .import = "MsiGetProductCodeA", .signature = "\x00\x02\x09\x11\x3d\x11\x3d" } },
    .{ "MsiGetProductCodeW", MethodRecord{ .library = "msi", .import = "MsiGetProductCodeW", .signature = "\x00\x02\x09\x11\x05\x11\x05" } },
    .{ "MsiGetUserInfoA", MethodRecord{ .library = "msi", .import = "MsiGetUserInfoA", .signature = "\x00\x07\x11\x5d\x11\x3d\x11\x3d\x0f\x09\x11\x3d\x0f\x09\x11\x3d\x0f\x09" } },
    .{ "MsiGetUserInfoW", MethodRecord{ .library = "msi", .import = "MsiGetUserInfoW", .signature = "\x00\x07\x11\x5d\x11\x05\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09" } },
    .{ "MsiCollectUserInfoA", MethodRecord{ .library = "msi", .import = "MsiCollectUserInfoA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "MsiCollectUserInfoW", MethodRecord{ .library = "msi", .import = "MsiCollectUserInfoW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "MsiApplyPatchA", MethodRecord{ .library = "msi", .import = "MsiApplyPatchA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x11\x61\x11\x3d" } },
    .{ "MsiApplyPatchW", MethodRecord{ .library = "msi", .import = "MsiApplyPatchW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x61\x11\x05" } },
    .{ "MsiGetPatchInfoA", MethodRecord{ .library = "msi", .import = "MsiGetPatchInfoA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "MsiGetPatchInfoW", MethodRecord{ .library = "msi", .import = "MsiGetPatchInfoW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x05\x0f\x09" } },
    .{ "MsiEnumPatchesA", MethodRecord{ .library = "msi", .import = "MsiEnumPatchesA", .signature = "\x00\x05\x09\x11\x3d\x09\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "MsiEnumPatchesW", MethodRecord{ .library = "msi", .import = "MsiEnumPatchesW", .signature = "\x00\x05\x09\x11\x05\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "MsiRemovePatchesA", MethodRecord{ .library = "msi", .import = "MsiRemovePatchesA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x11\x61\x11\x3d" } },
    .{ "MsiRemovePatchesW", MethodRecord{ .library = "msi", .import = "MsiRemovePatchesW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x61\x11\x05" } },
    .{ "MsiExtractPatchXMLDataA", MethodRecord{ .library = "msi", .import = "MsiExtractPatchXMLDataA", .signature = "\x00\x04\x09\x11\x3d\x09\x11\x3d\x0f\x09" } },
    .{ "MsiExtractPatchXMLDataW", MethodRecord{ .library = "msi", .import = "MsiExtractPatchXMLDataW", .signature = "\x00\x04\x09\x11\x05\x09\x11\x05\x0f\x09" } },
    .{ "MsiGetPatchInfoExA", MethodRecord{ .library = "msi", .import = "MsiGetPatchInfoExA", .signature = "\x00\x07\x09\x11\x3d\x11\x3d\x11\x3d\x11\x4d\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "MsiGetPatchInfoExW", MethodRecord{ .library = "msi", .import = "MsiGetPatchInfoExW", .signature = "\x00\x07\x09\x11\x05\x11\x05\x11\x05\x11\x4d\x11\x05\x11\x05\x0f\x09" } },
    .{ "MsiApplyMultiplePatchesA", MethodRecord{ .library = "msi", .import = "MsiApplyMultiplePatchesA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "MsiApplyMultiplePatchesW", MethodRecord{ .library = "msi", .import = "MsiApplyMultiplePatchesW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x11\x05" } },
    .{ "MsiDeterminePatchSequenceA", MethodRecord{ .library = "msi", .import = "MsiDeterminePatchSequenceA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x11\x4d\x09\x0f\x11\x69" } },
    .{ "MsiDeterminePatchSequenceW", MethodRecord{ .library = "msi", .import = "MsiDeterminePatchSequenceW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x4d\x09\x0f\x11\x6d" } },
    .{ "MsiDetermineApplicablePatchesA", MethodRecord{ .library = "msi", .import = "MsiDetermineApplicablePatchesA", .signature = "\x00\x03\x09\x11\x3d\x09\x0f\x11\x69" } },
    .{ "MsiDetermineApplicablePatchesW", MethodRecord{ .library = "msi", .import = "MsiDetermineApplicablePatchesW", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\x6d" } },
    .{ "MsiEnumPatchesExA", MethodRecord{ .library = "msi", .import = "MsiEnumPatchesExA", .signature = "\x00\x0a\x09\x11\x3d\x11\x3d\x09\x09\x09\x11\x3d\x11\x3d\x0f\x11\x4d\x11\x3d\x0f\x09" } },
    .{ "MsiEnumPatchesExW", MethodRecord{ .library = "msi", .import = "MsiEnumPatchesExW", .signature = "\x00\x0a\x09\x11\x05\x11\x05\x09\x09\x09\x11\x05\x11\x05\x0f\x11\x4d\x11\x05\x0f\x09" } },
    .{ "MsiQueryFeatureStateA", MethodRecord{ .library = "msi", .import = "MsiQueryFeatureStateA", .signature = "\x00\x02\x11\x45\x11\x3d\x11\x3d" } },
    .{ "MsiQueryFeatureStateW", MethodRecord{ .library = "msi", .import = "MsiQueryFeatureStateW", .signature = "\x00\x02\x11\x45\x11\x05\x11\x05" } },
    .{ "MsiQueryFeatureStateExA", MethodRecord{ .library = "msi", .import = "MsiQueryFeatureStateExA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x11\x4d\x11\x3d\x0f\x11\x45" } },
    .{ "MsiQueryFeatureStateExW", MethodRecord{ .library = "msi", .import = "MsiQueryFeatureStateExW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x4d\x11\x05\x0f\x11\x45" } },
    .{ "MsiUseFeatureA", MethodRecord{ .library = "msi", .import = "MsiUseFeatureA", .signature = "\x00\x02\x11\x45\x11\x3d\x11\x3d" } },
    .{ "MsiUseFeatureW", MethodRecord{ .library = "msi", .import = "MsiUseFeatureW", .signature = "\x00\x02\x11\x45\x11\x05\x11\x05" } },
    .{ "MsiUseFeatureExA", MethodRecord{ .library = "msi", .import = "MsiUseFeatureExA", .signature = "\x00\x04\x11\x45\x11\x3d\x11\x3d\x09\x09" } },
    .{ "MsiUseFeatureExW", MethodRecord{ .library = "msi", .import = "MsiUseFeatureExW", .signature = "\x00\x04\x11\x45\x11\x05\x11\x05\x09\x09" } },
    .{ "MsiGetFeatureUsageA", MethodRecord{ .library = "msi", .import = "MsiGetFeatureUsageA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x0f\x09\x0f\x07" } },
    .{ "MsiGetFeatureUsageW", MethodRecord{ .library = "msi", .import = "MsiGetFeatureUsageW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x0f\x09\x0f\x07" } },
    .{ "MsiConfigureFeatureA", MethodRecord{ .library = "msi", .import = "MsiConfigureFeatureA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x11\x45" } },
    .{ "MsiConfigureFeatureW", MethodRecord{ .library = "msi", .import = "MsiConfigureFeatureW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x11\x45" } },
    .{ "MsiReinstallFeatureA", MethodRecord{ .library = "msi", .import = "MsiReinstallFeatureA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x09" } },
    .{ "MsiReinstallFeatureW", MethodRecord{ .library = "msi", .import = "MsiReinstallFeatureW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "MsiProvideComponentA", MethodRecord{ .library = "msi", .import = "MsiProvideComponentA", .signature = "\x00\x06\x09\x11\x3d\x11\x3d\x11\x3d\x09\x11\x3d\x0f\x09" } },
    .{ "MsiProvideComponentW", MethodRecord{ .library = "msi", .import = "MsiProvideComponentW", .signature = "\x00\x06\x09\x11\x05\x11\x05\x11\x05\x09\x11\x05\x0f\x09" } },
    .{ "MsiProvideQualifiedComponentA", MethodRecord{ .library = "msi", .import = "MsiProvideQualifiedComponentA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x09\x11\x3d\x0f\x09" } },
    .{ "MsiProvideQualifiedComponentW", MethodRecord{ .library = "msi", .import = "MsiProvideQualifiedComponentW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x09\x11\x05\x0f\x09" } },
    .{ "MsiProvideQualifiedComponentExA", MethodRecord{ .library = "msi", .import = "MsiProvideQualifiedComponentExA", .signature = "\x00\x08\x09\x11\x3d\x11\x3d\x09\x11\x3d\x09\x09\x11\x3d\x0f\x09" } },
    .{ "MsiProvideQualifiedComponentExW", MethodRecord{ .library = "msi", .import = "MsiProvideQualifiedComponentExW", .signature = "\x00\x08\x09\x11\x05\x11\x05\x09\x11\x05\x09\x09\x11\x05\x0f\x09" } },
    .{ "MsiGetComponentPathA", MethodRecord{ .library = "msi", .import = "MsiGetComponentPathA", .signature = "\x00\x04\x11\x45\x11\x3d\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "MsiGetComponentPathW", MethodRecord{ .library = "msi", .import = "MsiGetComponentPathW", .signature = "\x00\x04\x11\x45\x11\x05\x11\x05\x11\x05\x0f\x09" } },
    .{ "MsiGetComponentPathExA", MethodRecord{ .library = "msi", .import = "MsiGetComponentPathExA", .signature = "\x00\x06\x11\x45\x11\x3d\x11\x3d\x11\x3d\x11\x4d\x11\x3d\x0f\x09" } },
    .{ "MsiGetComponentPathExW", MethodRecord{ .library = "msi", .import = "MsiGetComponentPathExW", .signature = "\x00\x06\x11\x45\x11\x05\x11\x05\x11\x05\x11\x4d\x11\x05\x0f\x09" } },
    .{ "MsiProvideAssemblyA", MethodRecord{ .library = "msi", .import = "MsiProvideAssemblyA", .signature = "\x00\x06\x09\x11\x3d\x11\x3d\x09\x11\x71\x11\x3d\x0f\x09" } },
    .{ "MsiProvideAssemblyW", MethodRecord{ .library = "msi", .import = "MsiProvideAssemblyW", .signature = "\x00\x06\x09\x11\x05\x11\x05\x09\x11\x71\x11\x05\x0f\x09" } },
    .{ "MsiQueryComponentStateA", MethodRecord{ .library = "msi", .import = "MsiQueryComponentStateA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x11\x4d\x11\x3d\x0f\x11\x45" } },
    .{ "MsiQueryComponentStateW", MethodRecord{ .library = "msi", .import = "MsiQueryComponentStateW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x4d\x11\x05\x0f\x11\x45" } },
    .{ "MsiEnumProductsA", MethodRecord{ .library = "msi", .import = "MsiEnumProductsA", .signature = "\x00\x02\x09\x09\x11\x3d" } },
    .{ "MsiEnumProductsW", MethodRecord{ .library = "msi", .import = "MsiEnumProductsW", .signature = "\x00\x02\x09\x09\x11\x05" } },
    .{ "MsiEnumProductsExA", MethodRecord{ .library = "msi", .import = "MsiEnumProductsExA", .signature = "\x00\x08\x09\x11\x3d\x11\x3d\x09\x09\x11\x3d\x0f\x11\x4d\x11\x3d\x0f\x09" } },
    .{ "MsiEnumProductsExW", MethodRecord{ .library = "msi", .import = "MsiEnumProductsExW", .signature = "\x00\x08\x09\x11\x05\x11\x05\x09\x09\x11\x05\x0f\x11\x4d\x11\x05\x0f\x09" } },
    .{ "MsiEnumRelatedProductsA", MethodRecord{ .library = "msi", .import = "MsiEnumRelatedProductsA", .signature = "\x00\x04\x09\x11\x3d\x09\x09\x11\x3d" } },
    .{ "MsiEnumRelatedProductsW", MethodRecord{ .library = "msi", .import = "MsiEnumRelatedProductsW", .signature = "\x00\x04\x09\x11\x05\x09\x09\x11\x05" } },
    .{ "MsiEnumFeaturesA", MethodRecord{ .library = "msi", .import = "MsiEnumFeaturesA", .signature = "\x00\x04\x09\x11\x3d\x09\x11\x3d\x11\x3d" } },
    .{ "MsiEnumFeaturesW", MethodRecord{ .library = "msi", .import = "MsiEnumFeaturesW", .signature = "\x00\x04\x09\x11\x05\x09\x11\x05\x11\x05" } },
    .{ "MsiEnumComponentsA", MethodRecord{ .library = "msi", .import = "MsiEnumComponentsA", .signature = "\x00\x02\x09\x09\x11\x3d" } },
    .{ "MsiEnumComponentsW", MethodRecord{ .library = "msi", .import = "MsiEnumComponentsW", .signature = "\x00\x02\x09\x09\x11\x05" } },
    .{ "MsiEnumComponentsExA", MethodRecord{ .library = "msi", .import = "MsiEnumComponentsExA", .signature = "\x00\x07\x09\x11\x3d\x09\x09\x11\x3d\x0f\x11\x4d\x11\x3d\x0f\x09" } },
    .{ "MsiEnumComponentsExW", MethodRecord{ .library = "msi", .import = "MsiEnumComponentsExW", .signature = "\x00\x07\x09\x11\x05\x09\x09\x11\x05\x0f\x11\x4d\x11\x05\x0f\x09" } },
    .{ "MsiEnumClientsA", MethodRecord{ .library = "msi", .import = "MsiEnumClientsA", .signature = "\x00\x03\x09\x11\x3d\x09\x11\x3d" } },
    .{ "MsiEnumClientsW", MethodRecord{ .library = "msi", .import = "MsiEnumClientsW", .signature = "\x00\x03\x09\x11\x05\x09\x11\x05" } },
    .{ "MsiEnumClientsExA", MethodRecord{ .library = "msi", .import = "MsiEnumClientsExA", .signature = "\x00\x08\x09\x11\x3d\x11\x3d\x09\x09\x11\x3d\x0f\x11\x4d\x11\x3d\x0f\x09" } },
    .{ "MsiEnumClientsExW", MethodRecord{ .library = "msi", .import = "MsiEnumClientsExW", .signature = "\x00\x08\x09\x11\x05\x11\x05\x09\x09\x11\x05\x0f\x11\x4d\x11\x05\x0f\x09" } },
    .{ "MsiEnumComponentQualifiersA", MethodRecord{ .library = "msi", .import = "MsiEnumComponentQualifiersA", .signature = "\x00\x06\x09\x11\x3d\x09\x11\x3d\x0f\x09\x11\x3d\x0f\x09" } },
    .{ "MsiEnumComponentQualifiersW", MethodRecord{ .library = "msi", .import = "MsiEnumComponentQualifiersW", .signature = "\x00\x06\x09\x11\x05\x09\x11\x05\x0f\x09\x11\x05\x0f\x09" } },
    .{ "MsiOpenProductA", MethodRecord{ .library = "msi", .import = "MsiOpenProductA", .signature = "\x00\x02\x09\x11\x3d\x0f\x11\x15" } },
    .{ "MsiOpenProductW", MethodRecord{ .library = "msi", .import = "MsiOpenProductW", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x15" } },
    .{ "MsiOpenPackageA", MethodRecord{ .library = "msi", .import = "MsiOpenPackageA", .signature = "\x00\x02\x09\x11\x3d\x0f\x11\x15" } },
    .{ "MsiOpenPackageW", MethodRecord{ .library = "msi", .import = "MsiOpenPackageW", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x15" } },
    .{ "MsiOpenPackageExA", MethodRecord{ .library = "msi", .import = "MsiOpenPackageExA", .signature = "\x00\x03\x09\x11\x3d\x09\x0f\x11\x15" } },
    .{ "MsiOpenPackageExW", MethodRecord{ .library = "msi", .import = "MsiOpenPackageExW", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\x15" } },
    .{ "MsiGetPatchFileListA", MethodRecord{ .library = "msi", .import = "MsiGetPatchFileListA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x0f\x09\x0f\x0f\x11\x15" } },
    .{ "MsiGetPatchFileListW", MethodRecord{ .library = "msi", .import = "MsiGetPatchFileListW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x0f\x09\x0f\x0f\x11\x15" } },
    .{ "MsiGetProductPropertyA", MethodRecord{ .library = "msi", .import = "MsiGetProductPropertyA", .signature = "\x00\x04\x09\x11\x15\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "MsiGetProductPropertyW", MethodRecord{ .library = "msi", .import = "MsiGetProductPropertyW", .signature = "\x00\x04\x09\x11\x15\x11\x05\x11\x05\x0f\x09" } },
    .{ "MsiVerifyPackageA", MethodRecord{ .library = "msi", .import = "MsiVerifyPackageA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "MsiVerifyPackageW", MethodRecord{ .library = "msi", .import = "MsiVerifyPackageW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "MsiGetFeatureInfoA", MethodRecord{ .library = "msi", .import = "MsiGetFeatureInfoA", .signature = "\x00\x07\x09\x11\x15\x11\x3d\x0f\x09\x11\x3d\x0f\x09\x11\x3d\x0f\x09" } },
    .{ "MsiGetFeatureInfoW", MethodRecord{ .library = "msi", .import = "MsiGetFeatureInfoW", .signature = "\x00\x07\x09\x11\x15\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09" } },
    .{ "MsiInstallMissingComponentA", MethodRecord{ .library = "msi", .import = "MsiInstallMissingComponentA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x11\x45" } },
    .{ "MsiInstallMissingComponentW", MethodRecord{ .library = "msi", .import = "MsiInstallMissingComponentW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x11\x45" } },
    .{ "MsiInstallMissingFileA", MethodRecord{ .library = "msi", .import = "MsiInstallMissingFileA", .signature = "\x00\x02\x09\x11\x3d\x11\x3d" } },
    .{ "MsiInstallMissingFileW", MethodRecord{ .library = "msi", .import = "MsiInstallMissingFileW", .signature = "\x00\x02\x09\x11\x05\x11\x05" } },
    .{ "MsiLocateComponentA", MethodRecord{ .library = "msi", .import = "MsiLocateComponentA", .signature = "\x00\x03\x11\x45\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "MsiLocateComponentW", MethodRecord{ .library = "msi", .import = "MsiLocateComponentW", .signature = "\x00\x03\x11\x45\x11\x05\x11\x05\x0f\x09" } },
    .{ "MsiSourceListClearAllA", MethodRecord{ .library = "msi", .import = "MsiSourceListClearAllA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x09" } },
    .{ "MsiSourceListClearAllW", MethodRecord{ .library = "msi", .import = "MsiSourceListClearAllW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "MsiSourceListAddSourceA", MethodRecord{ .library = "msi", .import = "MsiSourceListAddSourceA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x09\x11\x3d" } },
    .{ "MsiSourceListAddSourceW", MethodRecord{ .library = "msi", .import = "MsiSourceListAddSourceW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x09\x11\x05" } },
    .{ "MsiSourceListForceResolutionA", MethodRecord{ .library = "msi", .import = "MsiSourceListForceResolutionA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x09" } },
    .{ "MsiSourceListForceResolutionW", MethodRecord{ .library = "msi", .import = "MsiSourceListForceResolutionW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "MsiSourceListAddSourceExA", MethodRecord{ .library = "msi", .import = "MsiSourceListAddSourceExA", .signature = "\x00\x06\x09\x11\x3d\x11\x3d\x11\x4d\x09\x11\x3d\x09" } },
    .{ "MsiSourceListAddSourceExW", MethodRecord{ .library = "msi", .import = "MsiSourceListAddSourceExW", .signature = "\x00\x06\x09\x11\x05\x11\x05\x11\x4d\x09\x11\x05\x09" } },
    .{ "MsiSourceListAddMediaDiskA", MethodRecord{ .library = "msi", .import = "MsiSourceListAddMediaDiskA", .signature = "\x00\x07\x09\x11\x3d\x11\x3d\x11\x4d\x09\x09\x11\x3d\x11\x3d" } },
    .{ "MsiSourceListAddMediaDiskW", MethodRecord{ .library = "msi", .import = "MsiSourceListAddMediaDiskW", .signature = "\x00\x07\x09\x11\x05\x11\x05\x11\x4d\x09\x09\x11\x05\x11\x05" } },
    .{ "MsiSourceListClearSourceA", MethodRecord{ .library = "msi", .import = "MsiSourceListClearSourceA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x11\x4d\x09\x11\x3d" } },
    .{ "MsiSourceListClearSourceW", MethodRecord{ .library = "msi", .import = "MsiSourceListClearSourceW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x4d\x09\x11\x05" } },
    .{ "MsiSourceListClearMediaDiskA", MethodRecord{ .library = "msi", .import = "MsiSourceListClearMediaDiskA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x11\x4d\x09\x09" } },
    .{ "MsiSourceListClearMediaDiskW", MethodRecord{ .library = "msi", .import = "MsiSourceListClearMediaDiskW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x4d\x09\x09" } },
    .{ "MsiSourceListClearAllExA", MethodRecord{ .library = "msi", .import = "MsiSourceListClearAllExA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x11\x4d\x09" } },
    .{ "MsiSourceListClearAllExW", MethodRecord{ .library = "msi", .import = "MsiSourceListClearAllExW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x4d\x09" } },
    .{ "MsiSourceListForceResolutionExA", MethodRecord{ .library = "msi", .import = "MsiSourceListForceResolutionExA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x11\x4d\x09" } },
    .{ "MsiSourceListForceResolutionExW", MethodRecord{ .library = "msi", .import = "MsiSourceListForceResolutionExW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x4d\x09" } },
    .{ "MsiSourceListSetInfoA", MethodRecord{ .library = "msi", .import = "MsiSourceListSetInfoA", .signature = "\x00\x06\x09\x11\x3d\x11\x3d\x11\x4d\x09\x11\x3d\x11\x3d" } },
    .{ "MsiSourceListSetInfoW", MethodRecord{ .library = "msi", .import = "MsiSourceListSetInfoW", .signature = "\x00\x06\x09\x11\x05\x11\x05\x11\x4d\x09\x11\x05\x11\x05" } },
    .{ "MsiSourceListGetInfoA", MethodRecord{ .library = "msi", .import = "MsiSourceListGetInfoA", .signature = "\x00\x07\x09\x11\x3d\x11\x3d\x11\x4d\x09\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "MsiSourceListGetInfoW", MethodRecord{ .library = "msi", .import = "MsiSourceListGetInfoW", .signature = "\x00\x07\x09\x11\x05\x11\x05\x11\x4d\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "MsiSourceListEnumSourcesA", MethodRecord{ .library = "msi", .import = "MsiSourceListEnumSourcesA", .signature = "\x00\x07\x09\x11\x3d\x11\x3d\x11\x4d\x09\x09\x11\x3d\x0f\x09" } },
    .{ "MsiSourceListEnumSourcesW", MethodRecord{ .library = "msi", .import = "MsiSourceListEnumSourcesW", .signature = "\x00\x07\x09\x11\x05\x11\x05\x11\x4d\x09\x09\x11\x05\x0f\x09" } },
    .{ "MsiSourceListEnumMediaDisksA", MethodRecord{ .library = "msi", .import = "MsiSourceListEnumMediaDisksA", .signature = "\x00\x0a\x09\x11\x3d\x11\x3d\x11\x4d\x09\x09\x0f\x09\x11\x3d\x0f\x09\x11\x3d\x0f\x09" } },
    .{ "MsiSourceListEnumMediaDisksW", MethodRecord{ .library = "msi", .import = "MsiSourceListEnumMediaDisksW", .signature = "\x00\x0a\x09\x11\x05\x11\x05\x11\x4d\x09\x09\x0f\x09\x11\x05\x0f\x09\x11\x05\x0f\x09" } },
    .{ "MsiGetFileVersionA", MethodRecord{ .library = "msi", .import = "MsiGetFileVersionA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x0f\x09\x11\x3d\x0f\x09" } },
    .{ "MsiGetFileVersionW", MethodRecord{ .library = "msi", .import = "MsiGetFileVersionW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x0f\x09\x11\x05\x0f\x09" } },
    .{ "MsiGetFileHashA", MethodRecord{ .library = "msi", .import = "MsiGetFileHashA", .signature = "\x00\x03\x09\x11\x3d\x09\x0f\x11\x75" } },
    .{ "MsiGetFileHashW", MethodRecord{ .library = "msi", .import = "MsiGetFileHashW", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\x75" } },
    .{ "MsiGetFileSignatureInformationA", MethodRecord{ .library = "msi", .import = "MsiGetFileSignatureInformationA", .signature = "\x00\x05\x11\x79\x11\x3d\x09\x0f\x0f\x11\x7d\x0f\x05\x0f\x09" } },
    .{ "MsiGetFileSignatureInformationW", MethodRecord{ .library = "msi", .import = "MsiGetFileSignatureInformationW", .signature = "\x00\x05\x11\x79\x11\x05\x09\x0f\x0f\x11\x7d\x0f\x05\x0f\x09" } },
    .{ "MsiGetShortcutTargetA", MethodRecord{ .library = "msi", .import = "MsiGetShortcutTargetA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "MsiGetShortcutTargetW", MethodRecord{ .library = "msi", .import = "MsiGetShortcutTargetW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "MsiIsProductElevatedA", MethodRecord{ .library = "msi", .import = "MsiIsProductElevatedA", .signature = "\x00\x02\x09\x11\x3d\x0f\x11\x59" } },
    .{ "MsiIsProductElevatedW", MethodRecord{ .library = "msi", .import = "MsiIsProductElevatedW", .signature = "\x00\x02\x09\x11\x05\x0f\x11\x59" } },
    .{ "MsiNotifySidChangeA", MethodRecord{ .library = "msi", .import = "MsiNotifySidChangeA", .signature = "\x00\x02\x09\x11\x3d\x11\x3d" } },
    .{ "MsiNotifySidChangeW", MethodRecord{ .library = "msi", .import = "MsiNotifySidChangeW", .signature = "\x00\x02\x09\x11\x05\x11\x05" } },
    .{ "MsiBeginTransactionA", MethodRecord{ .library = "msi", .import = "MsiBeginTransactionA", .signature = "\x00\x04\x09\x11\x3d\x09\x0f\x11\x15\x0f\x11\x80\x85" } },
    .{ "MsiBeginTransactionW", MethodRecord{ .library = "msi", .import = "MsiBeginTransactionW", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\x15\x0f\x11\x80\x85" } },
    .{ "MsiEndTransaction", MethodRecord{ .library = "msi", .import = "MsiEndTransaction", .signature = "\x00\x01\x09\x11\x80\x89" } },
    .{ "MsiJoinTransaction", MethodRecord{ .library = "msi", .import = "MsiJoinTransaction", .signature = "\x00\x03\x09\x11\x15\x09\x0f\x11\x80\x85" } },
    .{ "MsiDatabaseOpenViewA", MethodRecord{ .library = "msi", .import = "MsiDatabaseOpenViewA", .signature = "\x00\x03\x09\x11\x15\x11\x3d\x0f\x11\x15" } },
    .{ "MsiDatabaseOpenViewW", MethodRecord{ .library = "msi", .import = "MsiDatabaseOpenViewW", .signature = "\x00\x03\x09\x11\x15\x11\x05\x0f\x11\x15" } },
    .{ "MsiViewGetErrorA", MethodRecord{ .library = "msi", .import = "MsiViewGetErrorA", .signature = "\x00\x03\x11\x80\x8d\x11\x15\x11\x3d\x0f\x09" } },
    .{ "MsiViewGetErrorW", MethodRecord{ .library = "msi", .import = "MsiViewGetErrorW", .signature = "\x00\x03\x11\x80\x8d\x11\x15\x11\x05\x0f\x09" } },
    .{ "MsiViewExecute", MethodRecord{ .library = "msi", .import = "MsiViewExecute", .signature = "\x00\x02\x09\x11\x15\x11\x15" } },
    .{ "MsiViewFetch", MethodRecord{ .library = "msi", .import = "MsiViewFetch", .signature = "\x00\x02\x09\x11\x15\x0f\x11\x15" } },
    .{ "MsiViewModify", MethodRecord{ .library = "msi", .import = "MsiViewModify", .signature = "\x00\x03\x09\x11\x15\x11\x80\x91\x11\x15" } },
    .{ "MsiViewGetColumnInfo", MethodRecord{ .library = "msi", .import = "MsiViewGetColumnInfo", .signature = "\x00\x03\x09\x11\x15\x11\x80\x95\x0f\x11\x15" } },
    .{ "MsiViewClose", MethodRecord{ .library = "msi", .import = "MsiViewClose", .signature = "\x00\x01\x09\x11\x15" } },
    .{ "MsiDatabaseGetPrimaryKeysA", MethodRecord{ .library = "msi", .import = "MsiDatabaseGetPrimaryKeysA", .signature = "\x00\x03\x09\x11\x15\x11\x3d\x0f\x11\x15" } },
    .{ "MsiDatabaseGetPrimaryKeysW", MethodRecord{ .library = "msi", .import = "MsiDatabaseGetPrimaryKeysW", .signature = "\x00\x03\x09\x11\x15\x11\x05\x0f\x11\x15" } },
    .{ "MsiDatabaseIsTablePersistentA", MethodRecord{ .library = "msi", .import = "MsiDatabaseIsTablePersistentA", .signature = "\x00\x02\x11\x80\x99\x11\x15\x11\x3d" } },
    .{ "MsiDatabaseIsTablePersistentW", MethodRecord{ .library = "msi", .import = "MsiDatabaseIsTablePersistentW", .signature = "\x00\x02\x11\x80\x99\x11\x15\x11\x05" } },
    .{ "MsiGetSummaryInformationA", MethodRecord{ .library = "msi", .import = "MsiGetSummaryInformationA", .signature = "\x00\x04\x09\x11\x15\x11\x3d\x09\x0f\x11\x15" } },
    .{ "MsiGetSummaryInformationW", MethodRecord{ .library = "msi", .import = "MsiGetSummaryInformationW", .signature = "\x00\x04\x09\x11\x15\x11\x05\x09\x0f\x11\x15" } },
    .{ "MsiSummaryInfoGetPropertyCount", MethodRecord{ .library = "msi", .import = "MsiSummaryInfoGetPropertyCount", .signature = "\x00\x02\x09\x11\x15\x0f\x09" } },
    .{ "MsiSummaryInfoSetPropertyA", MethodRecord{ .library = "msi", .import = "MsiSummaryInfoSetPropertyA", .signature = "\x00\x06\x09\x11\x15\x09\x09\x08\x0f\x11\x80\x9d\x11\x3d" } },
    .{ "MsiSummaryInfoSetPropertyW", MethodRecord{ .library = "msi", .import = "MsiSummaryInfoSetPropertyW", .signature = "\x00\x06\x09\x11\x15\x09\x09\x08\x0f\x11\x80\x9d\x11\x05" } },
    .{ "MsiSummaryInfoGetPropertyA", MethodRecord{ .library = "msi", .import = "MsiSummaryInfoGetPropertyA", .signature = "\x00\x07\x09\x11\x15\x09\x0f\x09\x0f\x08\x0f\x11\x80\x9d\x11\x3d\x0f\x09" } },
    .{ "MsiSummaryInfoGetPropertyW", MethodRecord{ .library = "msi", .import = "MsiSummaryInfoGetPropertyW", .signature = "\x00\x07\x09\x11\x15\x09\x0f\x09\x0f\x08\x0f\x11\x80\x9d\x11\x05\x0f\x09" } },
    .{ "MsiSummaryInfoPersist", MethodRecord{ .library = "msi", .import = "MsiSummaryInfoPersist", .signature = "\x00\x01\x09\x11\x15" } },
    .{ "MsiOpenDatabaseA", MethodRecord{ .library = "msi", .import = "MsiOpenDatabaseA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x0f\x11\x15" } },
    .{ "MsiOpenDatabaseW", MethodRecord{ .library = "msi", .import = "MsiOpenDatabaseW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x11\x15" } },
    .{ "MsiDatabaseImportA", MethodRecord{ .library = "msi", .import = "MsiDatabaseImportA", .signature = "\x00\x03\x09\x11\x15\x11\x3d\x11\x3d" } },
    .{ "MsiDatabaseImportW", MethodRecord{ .library = "msi", .import = "MsiDatabaseImportW", .signature = "\x00\x03\x09\x11\x15\x11\x05\x11\x05" } },
    .{ "MsiDatabaseExportA", MethodRecord{ .library = "msi", .import = "MsiDatabaseExportA", .signature = "\x00\x04\x09\x11\x15\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "MsiDatabaseExportW", MethodRecord{ .library = "msi", .import = "MsiDatabaseExportW", .signature = "\x00\x04\x09\x11\x15\x11\x05\x11\x05\x11\x05" } },
    .{ "MsiDatabaseMergeA", MethodRecord{ .library = "msi", .import = "MsiDatabaseMergeA", .signature = "\x00\x03\x09\x11\x15\x11\x15\x11\x3d" } },
    .{ "MsiDatabaseMergeW", MethodRecord{ .library = "msi", .import = "MsiDatabaseMergeW", .signature = "\x00\x03\x09\x11\x15\x11\x15\x11\x05" } },
    .{ "MsiDatabaseGenerateTransformA", MethodRecord{ .library = "msi", .import = "MsiDatabaseGenerateTransformA", .signature = "\x00\x05\x09\x11\x15\x11\x15\x11\x3d\x08\x08" } },
    .{ "MsiDatabaseGenerateTransformW", MethodRecord{ .library = "msi", .import = "MsiDatabaseGenerateTransformW", .signature = "\x00\x05\x09\x11\x15\x11\x15\x11\x05\x08\x08" } },
    .{ "MsiDatabaseApplyTransformA", MethodRecord{ .library = "msi", .import = "MsiDatabaseApplyTransformA", .signature = "\x00\x03\x09\x11\x15\x11\x3d\x11\x80\xa1" } },
    .{ "MsiDatabaseApplyTransformW", MethodRecord{ .library = "msi", .import = "MsiDatabaseApplyTransformW", .signature = "\x00\x03\x09\x11\x15\x11\x05\x11\x80\xa1" } },
    .{ "MsiCreateTransformSummaryInfoA", MethodRecord{ .library = "msi", .import = "MsiCreateTransformSummaryInfoA", .signature = "\x00\x05\x09\x11\x15\x11\x15\x11\x3d\x11\x80\xa1\x11\x80\xa5" } },
    .{ "MsiCreateTransformSummaryInfoW", MethodRecord{ .library = "msi", .import = "MsiCreateTransformSummaryInfoW", .signature = "\x00\x05\x09\x11\x15\x11\x15\x11\x05\x11\x80\xa1\x11\x80\xa5" } },
    .{ "MsiDatabaseCommit", MethodRecord{ .library = "msi", .import = "MsiDatabaseCommit", .signature = "\x00\x01\x09\x11\x15" } },
    .{ "MsiGetDatabaseState", MethodRecord{ .library = "msi", .import = "MsiGetDatabaseState", .signature = "\x00\x01\x11\x80\xa9\x11\x15" } },
    .{ "MsiCreateRecord", MethodRecord{ .library = "msi", .import = "MsiCreateRecord", .signature = "\x00\x01\x11\x15\x09" } },
    .{ "MsiRecordIsNull", MethodRecord{ .library = "msi", .import = "MsiRecordIsNull", .signature = "\x00\x02\x11\x59\x11\x15\x09" } },
    .{ "MsiRecordDataSize", MethodRecord{ .library = "msi", .import = "MsiRecordDataSize", .signature = "\x00\x02\x09\x11\x15\x09" } },
    .{ "MsiRecordSetInteger", MethodRecord{ .library = "msi", .import = "MsiRecordSetInteger", .signature = "\x00\x03\x09\x11\x15\x09\x08" } },
    .{ "MsiRecordSetStringA", MethodRecord{ .library = "msi", .import = "MsiRecordSetStringA", .signature = "\x00\x03\x09\x11\x15\x09\x11\x3d" } },
    .{ "MsiRecordSetStringW", MethodRecord{ .library = "msi", .import = "MsiRecordSetStringW", .signature = "\x00\x03\x09\x11\x15\x09\x11\x05" } },
    .{ "MsiRecordGetInteger", MethodRecord{ .library = "msi", .import = "MsiRecordGetInteger", .signature = "\x00\x02\x08\x11\x15\x09" } },
    .{ "MsiRecordGetStringA", MethodRecord{ .library = "msi", .import = "MsiRecordGetStringA", .signature = "\x00\x04\x09\x11\x15\x09\x11\x3d\x0f\x09" } },
    .{ "MsiRecordGetStringW", MethodRecord{ .library = "msi", .import = "MsiRecordGetStringW", .signature = "\x00\x04\x09\x11\x15\x09\x11\x05\x0f\x09" } },
    .{ "MsiRecordGetFieldCount", MethodRecord{ .library = "msi", .import = "MsiRecordGetFieldCount", .signature = "\x00\x01\x09\x11\x15" } },
    .{ "MsiRecordSetStreamA", MethodRecord{ .library = "msi", .import = "MsiRecordSetStreamA", .signature = "\x00\x03\x09\x11\x15\x09\x11\x3d" } },
    .{ "MsiRecordSetStreamW", MethodRecord{ .library = "msi", .import = "MsiRecordSetStreamW", .signature = "\x00\x03\x09\x11\x15\x09\x11\x05" } },
    .{ "MsiRecordReadStream", MethodRecord{ .library = "msi", .import = "MsiRecordReadStream", .signature = "\x00\x04\x09\x11\x15\x09\x11\x3d\x0f\x09" } },
    .{ "MsiRecordClearData", MethodRecord{ .library = "msi", .import = "MsiRecordClearData", .signature = "\x00\x01\x09\x11\x15" } },
    .{ "MsiGetActiveDatabase", MethodRecord{ .library = "msi", .import = "MsiGetActiveDatabase", .signature = "\x00\x01\x11\x15\x11\x15" } },
    .{ "MsiSetPropertyA", MethodRecord{ .library = "msi", .import = "MsiSetPropertyA", .signature = "\x00\x03\x09\x11\x15\x11\x3d\x11\x3d" } },
    .{ "MsiSetPropertyW", MethodRecord{ .library = "msi", .import = "MsiSetPropertyW", .signature = "\x00\x03\x09\x11\x15\x11\x05\x11\x05" } },
    .{ "MsiGetPropertyA", MethodRecord{ .library = "msi", .import = "MsiGetPropertyA", .signature = "\x00\x04\x09\x11\x15\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "MsiGetPropertyW", MethodRecord{ .library = "msi", .import = "MsiGetPropertyW", .signature = "\x00\x04\x09\x11\x15\x11\x05\x11\x05\x0f\x09" } },
    .{ "MsiGetLanguage", MethodRecord{ .library = "msi", .import = "MsiGetLanguage", .signature = "\x00\x01\x07\x11\x15" } },
    .{ "MsiGetMode", MethodRecord{ .library = "msi", .import = "MsiGetMode", .signature = "\x00\x02\x11\x59\x11\x15\x11\x80\xad" } },
    .{ "MsiSetMode", MethodRecord{ .library = "msi", .import = "MsiSetMode", .signature = "\x00\x03\x09\x11\x15\x11\x80\xad\x11\x59" } },
    .{ "MsiFormatRecordA", MethodRecord{ .library = "msi", .import = "MsiFormatRecordA", .signature = "\x00\x04\x09\x11\x15\x11\x15\x11\x3d\x0f\x09" } },
    .{ "MsiFormatRecordW", MethodRecord{ .library = "msi", .import = "MsiFormatRecordW", .signature = "\x00\x04\x09\x11\x15\x11\x15\x11\x05\x0f\x09" } },
    .{ "MsiDoActionA", MethodRecord{ .library = "msi", .import = "MsiDoActionA", .signature = "\x00\x02\x09\x11\x15\x11\x3d" } },
    .{ "MsiDoActionW", MethodRecord{ .library = "msi", .import = "MsiDoActionW", .signature = "\x00\x02\x09\x11\x15\x11\x05" } },
    .{ "MsiSequenceA", MethodRecord{ .library = "msi", .import = "MsiSequenceA", .signature = "\x00\x03\x09\x11\x15\x11\x3d\x08" } },
    .{ "MsiSequenceW", MethodRecord{ .library = "msi", .import = "MsiSequenceW", .signature = "\x00\x03\x09\x11\x15\x11\x05\x08" } },
    .{ "MsiProcessMessage", MethodRecord{ .library = "msi", .import = "MsiProcessMessage", .signature = "\x00\x03\x08\x11\x15\x11\x80\xb1\x11\x15" } },
    .{ "MsiEvaluateConditionA", MethodRecord{ .library = "msi", .import = "MsiEvaluateConditionA", .signature = "\x00\x02\x11\x80\x99\x11\x15\x11\x3d" } },
    .{ "MsiEvaluateConditionW", MethodRecord{ .library = "msi", .import = "MsiEvaluateConditionW", .signature = "\x00\x02\x11\x80\x99\x11\x15\x11\x05" } },
    .{ "MsiGetFeatureStateA", MethodRecord{ .library = "msi", .import = "MsiGetFeatureStateA", .signature = "\x00\x04\x09\x11\x15\x11\x3d\x0f\x11\x45\x0f\x11\x45" } },
    .{ "MsiGetFeatureStateW", MethodRecord{ .library = "msi", .import = "MsiGetFeatureStateW", .signature = "\x00\x04\x09\x11\x15\x11\x05\x0f\x11\x45\x0f\x11\x45" } },
    .{ "MsiSetFeatureStateA", MethodRecord{ .library = "msi", .import = "MsiSetFeatureStateA", .signature = "\x00\x03\x09\x11\x15\x11\x3d\x11\x45" } },
    .{ "MsiSetFeatureStateW", MethodRecord{ .library = "msi", .import = "MsiSetFeatureStateW", .signature = "\x00\x03\x09\x11\x15\x11\x05\x11\x45" } },
    .{ "MsiSetFeatureAttributesA", MethodRecord{ .library = "msi", .import = "MsiSetFeatureAttributesA", .signature = "\x00\x03\x09\x11\x15\x11\x3d\x09" } },
    .{ "MsiSetFeatureAttributesW", MethodRecord{ .library = "msi", .import = "MsiSetFeatureAttributesW", .signature = "\x00\x03\x09\x11\x15\x11\x05\x09" } },
    .{ "MsiGetComponentStateA", MethodRecord{ .library = "msi", .import = "MsiGetComponentStateA", .signature = "\x00\x04\x09\x11\x15\x11\x3d\x0f\x11\x45\x0f\x11\x45" } },
    .{ "MsiGetComponentStateW", MethodRecord{ .library = "msi", .import = "MsiGetComponentStateW", .signature = "\x00\x04\x09\x11\x15\x11\x05\x0f\x11\x45\x0f\x11\x45" } },
    .{ "MsiSetComponentStateA", MethodRecord{ .library = "msi", .import = "MsiSetComponentStateA", .signature = "\x00\x03\x09\x11\x15\x11\x3d\x11\x45" } },
    .{ "MsiSetComponentStateW", MethodRecord{ .library = "msi", .import = "MsiSetComponentStateW", .signature = "\x00\x03\x09\x11\x15\x11\x05\x11\x45" } },
    .{ "MsiGetFeatureCostA", MethodRecord{ .library = "msi", .import = "MsiGetFeatureCostA", .signature = "\x00\x05\x09\x11\x15\x11\x3d\x11\x80\xb5\x11\x45\x0f\x08" } },
    .{ "MsiGetFeatureCostW", MethodRecord{ .library = "msi", .import = "MsiGetFeatureCostW", .signature = "\x00\x05\x09\x11\x15\x11\x05\x11\x80\xb5\x11\x45\x0f\x08" } },
    .{ "MsiEnumComponentCostsA", MethodRecord{ .library = "msi", .import = "MsiEnumComponentCostsA", .signature = "\x00\x08\x09\x11\x15\x11\x3d\x09\x11\x45\x11\x3d\x0f\x09\x0f\x08\x0f\x08" } },
    .{ "MsiEnumComponentCostsW", MethodRecord{ .library = "msi", .import = "MsiEnumComponentCostsW", .signature = "\x00\x08\x09\x11\x15\x11\x05\x09\x11\x45\x11\x05\x0f\x09\x0f\x08\x0f\x08" } },
    .{ "MsiSetInstallLevel", MethodRecord{ .library = "msi", .import = "MsiSetInstallLevel", .signature = "\x00\x02\x09\x11\x15\x08" } },
    .{ "MsiGetFeatureValidStatesA", MethodRecord{ .library = "msi", .import = "MsiGetFeatureValidStatesA", .signature = "\x00\x03\x09\x11\x15\x11\x3d\x0f\x09" } },
    .{ "MsiGetFeatureValidStatesW", MethodRecord{ .library = "msi", .import = "MsiGetFeatureValidStatesW", .signature = "\x00\x03\x09\x11\x15\x11\x05\x0f\x09" } },
    .{ "MsiGetSourcePathA", MethodRecord{ .library = "msi", .import = "MsiGetSourcePathA", .signature = "\x00\x04\x09\x11\x15\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "MsiGetSourcePathW", MethodRecord{ .library = "msi", .import = "MsiGetSourcePathW", .signature = "\x00\x04\x09\x11\x15\x11\x05\x11\x05\x0f\x09" } },
    .{ "MsiGetTargetPathA", MethodRecord{ .library = "msi", .import = "MsiGetTargetPathA", .signature = "\x00\x04\x09\x11\x15\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "MsiGetTargetPathW", MethodRecord{ .library = "msi", .import = "MsiGetTargetPathW", .signature = "\x00\x04\x09\x11\x15\x11\x05\x11\x05\x0f\x09" } },
    .{ "MsiSetTargetPathA", MethodRecord{ .library = "msi", .import = "MsiSetTargetPathA", .signature = "\x00\x03\x09\x11\x15\x11\x3d\x11\x3d" } },
    .{ "MsiSetTargetPathW", MethodRecord{ .library = "msi", .import = "MsiSetTargetPathW", .signature = "\x00\x03\x09\x11\x15\x11\x05\x11\x05" } },
    .{ "MsiVerifyDiskSpace", MethodRecord{ .library = "msi", .import = "MsiVerifyDiskSpace", .signature = "\x00\x01\x09\x11\x15" } },
    .{ "MsiEnableUIPreview", MethodRecord{ .library = "msi", .import = "MsiEnableUIPreview", .signature = "\x00\x02\x09\x11\x15\x0f\x11\x15" } },
    .{ "MsiPreviewDialogA", MethodRecord{ .library = "msi", .import = "MsiPreviewDialogA", .signature = "\x00\x02\x09\x11\x15\x11\x3d" } },
    .{ "MsiPreviewDialogW", MethodRecord{ .library = "msi", .import = "MsiPreviewDialogW", .signature = "\x00\x02\x09\x11\x15\x11\x05" } },
    .{ "MsiPreviewBillboardA", MethodRecord{ .library = "msi", .import = "MsiPreviewBillboardA", .signature = "\x00\x03\x09\x11\x15\x11\x3d\x11\x3d" } },
    .{ "MsiPreviewBillboardW", MethodRecord{ .library = "msi", .import = "MsiPreviewBillboardW", .signature = "\x00\x03\x09\x11\x15\x11\x05\x11\x05" } },
    .{ "MsiGetLastErrorRecord", MethodRecord{ .library = "msi", .import = "MsiGetLastErrorRecord", .signature = "\x00\x00\x11\x15" } },
    .{ "SfcGetNextProtectedFile", MethodRecord{ .library = "sfc", .import = "SfcGetNextProtectedFile", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x80\xb9" } },
    .{ "SfcIsFileProtected", MethodRecord{ .library = "sfc", .import = "SfcIsFileProtected", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x05" } },
    .{ "SfcIsKeyProtected", MethodRecord{ .library = "sfc", .import = "SfcIsKeyProtected", .signature = "\x00\x03\x11\x59\x11\x55\x11\x05\x09" } },
    .{ "SfpVerifyFile", MethodRecord{ .library = "sfc", .import = "SfpVerifyFile", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x09" } },
    .{ "CreatePatchFileA", MethodRecord{ .library = "mspatchc", .import = "CreatePatchFileA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x11\x3d\x09\x0f\x11\x80\xbd" } },
    .{ "CreatePatchFileW", MethodRecord{ .library = "mspatchc", .import = "CreatePatchFileW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x11\x05\x09\x0f\x11\x80\xbd" } },
    .{ "CreatePatchFileByHandles", MethodRecord{ .library = "mspatchc", .import = "CreatePatchFileByHandles", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x80\x85\x11\x80\x85\x09\x0f\x11\x80\xbd" } },
    .{ "CreatePatchFileExA", MethodRecord{ .library = "mspatchc", .import = "CreatePatchFileExA", .signature = "\x00\x08\x11\x59\x09\x0f\x11\x80\xc1\x11\x3d\x11\x3d\x09\x0f\x11\x80\xbd\x12\x80\xc5\x0f\x01" } },
    .{ "CreatePatchFileExW", MethodRecord{ .library = "mspatchc", .import = "CreatePatchFileExW", .signature = "\x00\x08\x11\x59\x09\x0f\x11\x80\xc9\x11\x05\x11\x05\x09\x0f\x11\x80\xbd\x12\x80\xc5\x0f\x01" } },
    .{ "CreatePatchFileByHandlesEx", MethodRecord{ .library = "mspatchc", .import = "CreatePatchFileByHandlesEx", .signature = "\x00\x08\x11\x59\x09\x0f\x11\x80\xcd\x11\x80\x85\x11\x80\x85\x09\x0f\x11\x80\xbd\x12\x80\xc5\x0f\x01" } },
    .{ "ExtractPatchHeaderToFileA", MethodRecord{ .library = "mspatchc", .import = "ExtractPatchHeaderToFileA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "ExtractPatchHeaderToFileW", MethodRecord{ .library = "mspatchc", .import = "ExtractPatchHeaderToFileW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "ExtractPatchHeaderToFileByHandles", MethodRecord{ .library = "mspatchc", .import = "ExtractPatchHeaderToFileByHandles", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x80\x85" } },
    .{ "TestApplyPatchToFileA", MethodRecord{ .library = "mspatcha", .import = "TestApplyPatchToFileA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x09" } },
    .{ "TestApplyPatchToFileW", MethodRecord{ .library = "mspatcha", .import = "TestApplyPatchToFileW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x09" } },
    .{ "TestApplyPatchToFileByHandles", MethodRecord{ .library = "mspatcha", .import = "TestApplyPatchToFileByHandles", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x80\x85\x09" } },
    .{ "TestApplyPatchToFileByBuffers", MethodRecord{ .library = "mspatcha", .import = "TestApplyPatchToFileByBuffers", .signature = "\x00\x06\x11\x59\x0f\x05\x09\x0f\x05\x09\x0f\x09\x09" } },
    .{ "ApplyPatchToFileA", MethodRecord{ .library = "mspatcha", .import = "ApplyPatchToFileA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "ApplyPatchToFileW", MethodRecord{ .library = "mspatcha", .import = "ApplyPatchToFileW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "ApplyPatchToFileByHandles", MethodRecord{ .library = "mspatcha", .import = "ApplyPatchToFileByHandles", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x80\x85\x11\x80\x85\x09" } },
    .{ "ApplyPatchToFileExA", MethodRecord{ .library = "mspatcha", .import = "ApplyPatchToFileExA", .signature = "\x00\x06\x11\x59\x11\x3d\x11\x3d\x11\x3d\x09\x12\x80\xc5\x0f\x01" } },
    .{ "ApplyPatchToFileExW", MethodRecord{ .library = "mspatcha", .import = "ApplyPatchToFileExW", .signature = "\x00\x06\x11\x59\x11\x05\x11\x05\x11\x05\x09\x12\x80\xc5\x0f\x01" } },
    .{ "ApplyPatchToFileByHandlesEx", MethodRecord{ .library = "mspatcha", .import = "ApplyPatchToFileByHandlesEx", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x80\x85\x11\x80\x85\x09\x12\x80\xc5\x0f\x01" } },
    .{ "ApplyPatchToFileByBuffers", MethodRecord{ .library = "mspatcha", .import = "ApplyPatchToFileByBuffers", .signature = "\x00\x0b\x11\x59\x0f\x05\x09\x0f\x05\x09\x0f\x0f\x05\x09\x0f\x09\x0f\x11\x80\x9d\x09\x12\x80\xc5\x0f\x01" } },
    .{ "GetFilePatchSignatureA", MethodRecord{ .library = "mspatcha", .import = "GetFilePatchSignatureA", .signature = "\x00\x09\x11\x59\x11\x3d\x09\x0f\x01\x09\x0f\x11\x80\xd1\x09\x0f\x11\x80\xd5\x09\x11\x3d" } },
    .{ "GetFilePatchSignatureW", MethodRecord{ .library = "mspatcha", .import = "GetFilePatchSignatureW", .signature = "\x00\x09\x11\x59\x11\x05\x09\x0f\x01\x09\x0f\x11\x80\xd1\x09\x0f\x11\x80\xd5\x09\x11\x05" } },
    .{ "GetFilePatchSignatureByHandle", MethodRecord{ .library = "mspatcha", .import = "GetFilePatchSignatureByHandle", .signature = "\x00\x09\x11\x59\x11\x80\x85\x09\x0f\x01\x09\x0f\x11\x80\xd1\x09\x0f\x11\x80\xd5\x09\x11\x3d" } },
    .{ "GetFilePatchSignatureByBuffer", MethodRecord{ .library = "mspatcha", .import = "GetFilePatchSignatureByBuffer", .signature = "\x00\x0a\x11\x59\x0f\x05\x09\x09\x0f\x01\x09\x0f\x11\x80\xd1\x09\x0f\x11\x80\xd5\x09\x11\x3d" } },
    .{ "NormalizeFileForPatchSignature", MethodRecord{ .library = "mspatcha", .import = "NormalizeFileForPatchSignature", .signature = "\x00\x0a\x08\x0f\x01\x09\x09\x0f\x11\x80\xbd\x09\x09\x09\x0f\x11\x80\xd1\x09\x0f\x11\x80\xd5" } },
    .{ "GetDeltaInfoB", MethodRecord{ .library = "msdelta", .import = "GetDeltaInfoB", .signature = "\x00\x02\x11\x59\x11\x80\xd9\x0f\x11\x80\xdd" } },
    .{ "GetDeltaInfoA", MethodRecord{ .library = "msdelta", .import = "GetDeltaInfoA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x11\x80\xdd" } },
    .{ "GetDeltaInfoW", MethodRecord{ .library = "msdelta", .import = "GetDeltaInfoW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x11\x80\xdd" } },
    .{ "ApplyDeltaGetReverseB", MethodRecord{ .library = "msdelta", .import = "ApplyDeltaGetReverseB", .signature = "\x00\x06\x11\x59\x0a\x11\x80\xd9\x11\x80\xd9\x0f\x11\x80\x9d\x0f\x11\x80\xe1\x0f\x11\x80\xe1" } },
    .{ "ApplyDeltaB", MethodRecord{ .library = "msdelta", .import = "ApplyDeltaB", .signature = "\x00\x04\x11\x59\x0a\x11\x80\xd9\x11\x80\xd9\x0f\x11\x80\xe1" } },
    .{ "ApplyDeltaProvidedB", MethodRecord{ .library = "msdelta", .import = "ApplyDeltaProvidedB", .signature = "\x00\x05\x11\x59\x0a\x11\x80\xd9\x11\x80\xd9\x0f\x01\x19" } },
    .{ "ApplyDeltaA", MethodRecord{ .library = "msdelta", .import = "ApplyDeltaA", .signature = "\x00\x04\x11\x59\x0a\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "ApplyDeltaW", MethodRecord{ .library = "msdelta", .import = "ApplyDeltaW", .signature = "\x00\x04\x11\x59\x0a\x11\x05\x11\x05\x11\x05" } },
    .{ "CreateDeltaB", MethodRecord{ .library = "msdelta", .import = "CreateDeltaB", .signature = "\x00\x0b\x11\x59\x0a\x0a\x0a\x11\x80\xd9\x11\x80\xd9\x11\x80\xd9\x11\x80\xd9\x11\x80\xd9\x0f\x11\x80\x9d\x11\x80\xe5\x0f\x11\x80\xe1" } },
    .{ "CreateDeltaA", MethodRecord{ .library = "msdelta", .import = "CreateDeltaA", .signature = "\x00\x0b\x11\x59\x0a\x0a\x0a\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x11\x80\xd9\x0f\x11\x80\x9d\x11\x80\xe5\x11\x3d" } },
    .{ "CreateDeltaW", MethodRecord{ .library = "msdelta", .import = "CreateDeltaW", .signature = "\x00\x0b\x11\x59\x0a\x0a\x0a\x11\x05\x11\x05\x11\x05\x11\x05\x11\x80\xd9\x0f\x11\x80\x9d\x11\x80\xe5\x11\x05" } },
    .{ "GetDeltaSignatureB", MethodRecord{ .library = "msdelta", .import = "GetDeltaSignatureB", .signature = "\x00\x04\x11\x59\x0a\x11\x80\xe5\x11\x80\xd9\x0f\x11\x80\xe9" } },
    .{ "GetDeltaSignatureA", MethodRecord{ .library = "msdelta", .import = "GetDeltaSignatureA", .signature = "\x00\x04\x11\x59\x0a\x11\x80\xe5\x11\x3d\x0f\x11\x80\xe9" } },
    .{ "GetDeltaSignatureW", MethodRecord{ .library = "msdelta", .import = "GetDeltaSignatureW", .signature = "\x00\x04\x11\x59\x0a\x11\x80\xe5\x11\x05\x0f\x11\x80\xe9" } },
    .{ "DeltaNormalizeProvidedB", MethodRecord{ .library = "msdelta", .import = "DeltaNormalizeProvidedB", .signature = "\x00\x05\x11\x59\x0a\x0a\x11\x80\xd9\x0f\x01\x19" } },
    .{ "DeltaFree", MethodRecord{ .library = "msdelta", .import = "DeltaFree", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "CreateActCtxA", MethodRecord{ .library = "KERNEL32", .import = "CreateActCtxA", .signature = "\x00\x01\x11\x80\x85\x0f\x11\x80\xed" } },
    .{ "CreateActCtxW", MethodRecord{ .library = "KERNEL32", .import = "CreateActCtxW", .signature = "\x00\x01\x11\x80\x85\x0f\x11\x80\xf5" } },
    .{ "AddRefActCtx", MethodRecord{ .library = "KERNEL32", .import = "AddRefActCtx", .signature = "\x00\x01\x01\x11\x80\x85" } },
    .{ "ReleaseActCtx", MethodRecord{ .library = "KERNEL32", .import = "ReleaseActCtx", .signature = "\x00\x01\x01\x11\x80\x85" } },
    .{ "ZombifyActCtx", MethodRecord{ .library = "KERNEL32", .import = "ZombifyActCtx", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "ActivateActCtx", MethodRecord{ .library = "KERNEL32", .import = "ActivateActCtx", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x19" } },
    .{ "DeactivateActCtx", MethodRecord{ .library = "KERNEL32", .import = "DeactivateActCtx", .signature = "\x00\x02\x11\x59\x09\x19" } },
    .{ "GetCurrentActCtx", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentActCtx", .signature = "\x00\x01\x11\x59\x0f\x11\x80\x85" } },
    .{ "FindActCtxSectionStringA", MethodRecord{ .library = "KERNEL32", .import = "FindActCtxSectionStringA", .signature = "\x00\x05\x11\x59\x09\x0f\x11\x0d\x09\x11\x3d\x0f\x11\x80\xf9" } },
    .{ "FindActCtxSectionStringW", MethodRecord{ .library = "KERNEL32", .import = "FindActCtxSectionStringW", .signature = "\x00\x05\x11\x59\x09\x0f\x11\x0d\x09\x11\x05\x0f\x11\x80\xf9" } },
    .{ "FindActCtxSectionGuid", MethodRecord{ .library = "KERNEL32", .import = "FindActCtxSectionGuid", .signature = "\x00\x05\x11\x59\x09\x0f\x11\x0d\x09\x0f\x11\x0d\x0f\x11\x80\xf9" } },
    .{ "QueryActCtxW", MethodRecord{ .library = "KERNEL32", .import = "QueryActCtxW", .signature = "\x00\x07\x11\x59\x09\x11\x80\x85\x0f\x01\x09\x0f\x01\x19\x0f\x19" } },
    .{ "QueryActCtxSettingsW", MethodRecord{ .library = "KERNEL32", .import = "QueryActCtxSettingsW", .signature = "\x00\x07\x11\x59\x09\x11\x80\x85\x11\x05\x11\x05\x11\x05\x19\x0f\x19" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x15 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSIHANDLE" },
        0x21 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "INSTALLUILEVEL" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x29 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "INSTALLUI_HANDLERA" },
        0x31 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "INSTALLUI_HANDLERW" },
        0x39 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "PINSTALLUI_HANDLER_RECORD" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x45 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "INSTALLSTATE" },
        0x4d => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSIINSTALLCONTEXT" },
        0x51 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "INSTALLLEVEL" },
        0x55 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "HKEY" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x5d => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "USERINFOSTATE" },
        0x61 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "INSTALLTYPE" },
        0x69 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSIPATCHSEQUENCEINFOA" },
        0x6d => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSIPATCHSEQUENCEINFOW" },
        0x71 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSIASSEMBLYINFO" },
        0x75 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSIFILEHASHINFO" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x7d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "CERT_CONTEXT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x89 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSITRANSACTIONSTATE" },
        0x8d => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSIDBERROR" },
        0x91 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSIMODIFY" },
        0x95 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSICOLINFO" },
        0x99 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSICONDITION" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0xa1 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSITRANSFORM_ERROR" },
        0xa5 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSITRANSFORM_VALIDATE" },
        0xa9 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSIDBSTATE" },
        0xad => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSIRUNMODE" },
        0xb1 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "INSTALLMESSAGE" },
        0xb5 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "MSICOSTTREE" },
        0xb9 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "PROTECTED_FILE_DATA" },
        0xbd => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "PATCH_OPTION_DATA" },
        0xc1 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "PATCH_OLD_FILE_INFO_A" },
        0xc5 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "PPATCH_PROGRESS_CALLBACK" },
        0xc9 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "PATCH_OLD_FILE_INFO_W" },
        0xcd => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "PATCH_OLD_FILE_INFO_H" },
        0xd1 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "PATCH_IGNORE_RANGE" },
        0xd5 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "PATCH_RETAIN_RANGE" },
        0xd9 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "DELTA_INPUT" },
        0xdd => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "DELTA_HEADER_INFO" },
        0xe1 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "DELTA_OUTPUT" },
        0xe5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Cryptography", .name = "ALG_ID" },
        0xe9 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "DELTA_HASH" },
        0xed => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "ACTCTXA" },
        0xf5 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "ACTCTXW" },
        0xf9 => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationInstallationAndServicing", .name = "ACTCTX_SECTION_KEYED_DATA" },
        else => null,
    };
}

pub const MSIDBOPEN_READONLY = 0;
pub const MSIDBOPEN_TRANSACT = 1;
pub const MSIDBOPEN_DIRECT = 2;
pub const MSIDBOPEN_CREATE = 3;
pub const MSIDBOPEN_CREATEDIRECT = 4;
pub const MSIDBOPEN_PATCHFILE = 16;
pub const UIALL = 32768;
pub const LOGTOKEN_TYPE_MASK = 3;
pub const LOGTOKEN_UNSPECIFIED = 0;
pub const LOGTOKEN_NO_LOG = 1;
pub const LOGTOKEN_SETUPAPI_APPLOG = 2;
pub const LOGTOKEN_SETUPAPI_DEVLOG = 3;
pub const TXTLOG_SETUPAPI_DEVLOG = 1;
pub const TXTLOG_SETUPAPI_CMDLINE = 2;
pub const TXTLOG_SETUPAPI_BITS = 3;
pub const TXTLOG_ERROR = 1;
pub const TXTLOG_WARNING = 2;
pub const TXTLOG_SYSTEM_STATE_CHANGE = 3;
pub const TXTLOG_SUMMARY = 4;
pub const TXTLOG_DETAILS = 5;
pub const TXTLOG_VERBOSE = 6;
pub const TXTLOG_VERY_VERBOSE = 7;
pub const TXTLOG_RESERVED_FLAGS = 65520;
pub const TXTLOG_TIMESTAMP = 65536;
pub const TXTLOG_DEPTH_INCR = 131072;
pub const TXTLOG_DEPTH_DECR = 262144;
pub const TXTLOG_TAB_1 = 524288;
pub const TXTLOG_FLUSH_FILE = 1048576;
pub const TXTLOG_DEVINST = 1;
pub const TXTLOG_INF = 2;
pub const TXTLOG_FILEQ = 4;
pub const TXTLOG_COPYFILES = 8;
pub const TXTLOG_SIGVERIF = 32;
pub const TXTLOG_BACKUP = 128;
pub const TXTLOG_UI = 256;
pub const TXTLOG_UTIL = 512;
pub const TXTLOG_INFDB = 1024;
pub const TXTLOG_DRVSETUP = 4194304;
pub const TXTLOG_POLICY = 8388608;
pub const TXTLOG_NEWDEV = 16777216;
pub const TXTLOG_UMPNPMGR = 33554432;
pub const TXTLOG_DRIVER_STORE = 67108864;
pub const TXTLOG_SETUP = 134217728;
pub const TXTLOG_CMI = 268435456;
pub const TXTLOG_DEVMGR = 536870912;
pub const TXTLOG_INSTALLER = 1073741824;
pub const TXTLOG_VENDOR = 2147483648;
pub const _WIN32_MSM = 100;
pub const _WIN32_MSI = 500;
pub const MAX_GUID_CHARS = 38;
pub const MAX_FEATURE_CHARS = 38;
pub const MSI_INVALID_HASH_IS_FATAL = 1;
pub const ERROR_ROLLBACK_DISABLED = 1653;
pub const MSI_NULL_INTEGER = 2147483648;
pub const INSTALLMESSAGE_TYPEMASK = -16777216;
pub const STREAM_FORMAT_COMPLIB_MODULE = 0;
pub const STREAM_FORMAT_COMPLIB_MANIFEST = 1;
pub const STREAM_FORMAT_WIN32_MODULE = 2;
pub const STREAM_FORMAT_WIN32_MANIFEST = 4;
pub const IASSEMBLYCACHEITEM_COMMIT_FLAG_REFRESH = 1;
pub const ASSEMBLYINFO_FLAG_INSTALLED = 1;
pub const ASSEMBLYINFO_FLAG_PAYLOADRESIDENT = 2;
pub const IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_INSTALLED = 1;
pub const IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_REFRESHED = 2;
pub const IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_ALREADY_INSTALLED = 3;
pub const SFC_DISABLE_NORMAL = 0;
pub const SFC_DISABLE_ASK = 1;
pub const SFC_DISABLE_ONCE = 2;
pub const SFC_DISABLE_SETUP = 3;
pub const SFC_DISABLE_NOPOPUPS = 4;
pub const SFC_SCAN_NORMAL = 0;
pub const SFC_SCAN_ALWAYS = 1;
pub const SFC_SCAN_ONCE = 2;
pub const SFC_SCAN_IMMEDIATE = 3;
pub const SFC_QUOTA_DEFAULT = 50;
pub const PID_TITLE = 2;
pub const PID_SUBJECT = 3;
pub const PID_AUTHOR = 4;
pub const PID_KEYWORDS = 5;
pub const PID_COMMENTS = 6;
pub const PID_TEMPLATE = 7;
pub const PID_LASTAUTHOR = 8;
pub const PID_REVNUMBER = 9;
pub const PID_EDITTIME = 10;
pub const PID_LASTPRINTED = 11;
pub const PID_CREATE_DTM = 12;
pub const PID_LASTSAVE_DTM = 13;
pub const PID_PAGECOUNT = 14;
pub const PID_WORDCOUNT = 15;
pub const PID_CHARCOUNT = 16;
pub const PID_THUMBNAIL = 17;
pub const PID_APPNAME = 18;
pub const PID_MSIVERSION = 14;
pub const PID_MSISOURCE = 15;
pub const PID_MSIRESTRICT = 16;
pub const PATCH_OPTION_USE_BEST = 0;
pub const PATCH_OPTION_USE_LZX_BEST = 3;
pub const PATCH_OPTION_USE_LZX_A = 1;
pub const PATCH_OPTION_USE_LZX_B = 2;
pub const PATCH_OPTION_USE_LZX_LARGE = 4;
pub const PATCH_OPTION_NO_BINDFIX = 65536;
pub const PATCH_OPTION_NO_LOCKFIX = 131072;
pub const PATCH_OPTION_NO_REBASE = 262144;
pub const PATCH_OPTION_FAIL_IF_SAME_FILE = 524288;
pub const PATCH_OPTION_FAIL_IF_BIGGER = 1048576;
pub const PATCH_OPTION_NO_CHECKSUM = 2097152;
pub const PATCH_OPTION_NO_RESTIMEFIX = 4194304;
pub const PATCH_OPTION_NO_TIMESTAMP = 8388608;
pub const PATCH_OPTION_SIGNATURE_MD5 = 16777216;
pub const PATCH_OPTION_INTERLEAVE_FILES = 1073741824;
pub const PATCH_OPTION_RESERVED1 = 2147483648;
pub const PATCH_OPTION_VALID_FLAGS = 3237937159;
pub const PATCH_SYMBOL_NO_IMAGEHLP = 1;
pub const PATCH_SYMBOL_NO_FAILURES = 2;
pub const PATCH_SYMBOL_UNDECORATED_TOO = 4;
pub const PATCH_SYMBOL_RESERVED1 = 2147483648;
pub const PATCH_TRANSFORM_PE_RESOURCE_2 = 256;
pub const PATCH_TRANSFORM_PE_IRELOC_2 = 512;
pub const APPLY_OPTION_FAIL_IF_EXACT = 1;
pub const APPLY_OPTION_FAIL_IF_CLOSE = 2;
pub const APPLY_OPTION_TEST_ONLY = 4;
pub const APPLY_OPTION_VALID_FLAGS = 7;
pub const ERROR_PATCH_ENCODE_FAILURE = 3222155521;
pub const ERROR_PATCH_INVALID_OPTIONS = 3222155522;
pub const ERROR_PATCH_SAME_FILE = 3222155523;
pub const ERROR_PATCH_RETAIN_RANGES_DIFFER = 3222155524;
pub const ERROR_PATCH_BIGGER_THAN_COMPRESSED = 3222155525;
pub const ERROR_PATCH_IMAGEHLP_FAILURE = 3222155526;
pub const ERROR_PATCH_DECODE_FAILURE = 3222159617;
pub const ERROR_PATCH_CORRUPT = 3222159618;
pub const ERROR_PATCH_NEWER_FORMAT = 3222159619;
pub const ERROR_PATCH_WRONG_FILE = 3222159620;
pub const ERROR_PATCH_NOT_NECESSARY = 3222159621;
pub const ERROR_PATCH_NOT_AVAILABLE = 3222159622;
pub const ERROR_PCW_BASE = 3222163713;
pub const ERROR_PCW_PCP_DOESNT_EXIST = 3222163713;
pub const ERROR_PCW_PCP_BAD_FORMAT = 3222163714;
pub const ERROR_PCW_CANT_CREATE_TEMP_FOLDER = 3222163715;
pub const ERROR_PCW_MISSING_PATCH_PATH = 3222163716;
pub const ERROR_PCW_CANT_OVERWRITE_PATCH = 3222163717;
pub const ERROR_PCW_CANT_CREATE_PATCH_FILE = 3222163718;
pub const ERROR_PCW_MISSING_PATCH_GUID = 3222163719;
pub const ERROR_PCW_BAD_PATCH_GUID = 3222163720;
pub const ERROR_PCW_BAD_GUIDS_TO_REPLACE = 3222163721;
pub const ERROR_PCW_BAD_TARGET_PRODUCT_CODE_LIST = 3222163722;
pub const ERROR_PCW_NO_UPGRADED_IMAGES_TO_PATCH = 3222163723;
pub const ERROR_PCW_BAD_API_PATCHING_SYMBOL_FLAGS = 3222163725;
pub const ERROR_PCW_OODS_COPYING_MSI = 3222163726;
pub const ERROR_PCW_UPGRADED_IMAGE_NAME_TOO_LONG = 3222163727;
pub const ERROR_PCW_BAD_UPGRADED_IMAGE_NAME = 3222163728;
pub const ERROR_PCW_DUP_UPGRADED_IMAGE_NAME = 3222163729;
pub const ERROR_PCW_UPGRADED_IMAGE_PATH_TOO_LONG = 3222163730;
pub const ERROR_PCW_UPGRADED_IMAGE_PATH_EMPTY = 3222163731;
pub const ERROR_PCW_UPGRADED_IMAGE_PATH_NOT_EXIST = 3222163732;
pub const ERROR_PCW_UPGRADED_IMAGE_PATH_NOT_MSI = 3222163733;
pub const ERROR_PCW_UPGRADED_IMAGE_COMPRESSED = 3222163734;
pub const ERROR_PCW_TARGET_IMAGE_NAME_TOO_LONG = 3222163735;
pub const ERROR_PCW_BAD_TARGET_IMAGE_NAME = 3222163736;
pub const ERROR_PCW_DUP_TARGET_IMAGE_NAME = 3222163737;
pub const ERROR_PCW_TARGET_IMAGE_PATH_TOO_LONG = 3222163738;
pub const ERROR_PCW_TARGET_IMAGE_PATH_EMPTY = 3222163739;
pub const ERROR_PCW_TARGET_IMAGE_PATH_NOT_EXIST = 3222163740;
pub const ERROR_PCW_TARGET_IMAGE_PATH_NOT_MSI = 3222163741;
pub const ERROR_PCW_TARGET_IMAGE_COMPRESSED = 3222163742;
pub const ERROR_PCW_TARGET_BAD_PROD_VALIDATE = 3222163743;
pub const ERROR_PCW_TARGET_BAD_PROD_CODE_VAL = 3222163744;
pub const ERROR_PCW_UPGRADED_MISSING_SRC_FILES = 3222163745;
pub const ERROR_PCW_TARGET_MISSING_SRC_FILES = 3222163746;
pub const ERROR_PCW_IMAGE_FAMILY_NAME_TOO_LONG = 3222163747;
pub const ERROR_PCW_BAD_IMAGE_FAMILY_NAME = 3222163748;
pub const ERROR_PCW_DUP_IMAGE_FAMILY_NAME = 3222163749;
pub const ERROR_PCW_BAD_IMAGE_FAMILY_SRC_PROP = 3222163750;
pub const ERROR_PCW_UFILEDATA_LONG_FILE_TABLE_KEY = 3222163751;
pub const ERROR_PCW_UFILEDATA_BLANK_FILE_TABLE_KEY = 3222163752;
pub const ERROR_PCW_UFILEDATA_MISSING_FILE_TABLE_KEY = 3222163753;
pub const ERROR_PCW_EXTFILE_LONG_FILE_TABLE_KEY = 3222163754;
pub const ERROR_PCW_EXTFILE_BLANK_FILE_TABLE_KEY = 3222163755;
pub const ERROR_PCW_EXTFILE_BAD_FAMILY_FIELD = 3222163756;
pub const ERROR_PCW_EXTFILE_LONG_PATH_TO_FILE = 3222163757;
pub const ERROR_PCW_EXTFILE_BLANK_PATH_TO_FILE = 3222163758;
pub const ERROR_PCW_EXTFILE_MISSING_FILE = 3222163759;
pub const ERROR_PCW_BAD_FILE_SEQUENCE_START = 3222163770;
pub const ERROR_PCW_CANT_COPY_FILE_TO_TEMP_FOLDER = 3222163771;
pub const ERROR_PCW_CANT_CREATE_ONE_PATCH_FILE = 3222163772;
pub const ERROR_PCW_BAD_IMAGE_FAMILY_DISKID = 3222163773;
pub const ERROR_PCW_BAD_IMAGE_FAMILY_FILESEQSTART = 3222163774;
pub const ERROR_PCW_BAD_UPGRADED_IMAGE_FAMILY = 3222163775;
pub const ERROR_PCW_BAD_TARGET_IMAGE_UPGRADED = 3222163776;
pub const ERROR_PCW_DUP_TARGET_IMAGE_PACKCODE = 3222163777;
pub const ERROR_PCW_UFILEDATA_BAD_UPGRADED_FIELD = 3222163778;
pub const ERROR_PCW_MISMATCHED_PRODUCT_CODES = 3222163779;
pub const ERROR_PCW_MISMATCHED_PRODUCT_VERSIONS = 3222163780;
pub const ERROR_PCW_CANNOT_WRITE_DDF = 3222163781;
pub const ERROR_PCW_CANNOT_RUN_MAKECAB = 3222163782;
pub const ERROR_PCW_WRITE_SUMMARY_PROPERTIES = 3222163787;
pub const ERROR_PCW_TFILEDATA_LONG_FILE_TABLE_KEY = 3222163788;
pub const ERROR_PCW_TFILEDATA_BLANK_FILE_TABLE_KEY = 3222163789;
pub const ERROR_PCW_TFILEDATA_MISSING_FILE_TABLE_KEY = 3222163790;
pub const ERROR_PCW_TFILEDATA_BAD_TARGET_FIELD = 3222163791;
pub const ERROR_PCW_UPGRADED_IMAGE_PATCH_PATH_TOO_LONG = 3222163792;
pub const ERROR_PCW_UPGRADED_IMAGE_PATCH_PATH_NOT_EXIST = 3222163793;
pub const ERROR_PCW_UPGRADED_IMAGE_PATCH_PATH_NOT_MSI = 3222163794;
pub const ERROR_PCW_DUP_UPGRADED_IMAGE_PACKCODE = 3222163795;
pub const ERROR_PCW_UFILEIGNORE_BAD_UPGRADED_FIELD = 3222163796;
pub const ERROR_PCW_UFILEIGNORE_LONG_FILE_TABLE_KEY = 3222163797;
pub const ERROR_PCW_UFILEIGNORE_BLANK_FILE_TABLE_KEY = 3222163798;
pub const ERROR_PCW_UFILEIGNORE_BAD_FILE_TABLE_KEY = 3222163799;
pub const ERROR_PCW_FAMILY_RANGE_NAME_TOO_LONG = 3222163800;
pub const ERROR_PCW_BAD_FAMILY_RANGE_NAME = 3222163801;
pub const ERROR_PCW_FAMILY_RANGE_LONG_FILE_TABLE_KEY = 3222163802;
pub const ERROR_PCW_FAMILY_RANGE_BLANK_FILE_TABLE_KEY = 3222163803;
pub const ERROR_PCW_FAMILY_RANGE_LONG_RETAIN_OFFSETS = 3222163804;
pub const ERROR_PCW_FAMILY_RANGE_BLANK_RETAIN_OFFSETS = 3222163805;
pub const ERROR_PCW_FAMILY_RANGE_BAD_RETAIN_OFFSETS = 3222163806;
pub const ERROR_PCW_FAMILY_RANGE_LONG_RETAIN_LENGTHS = 3222163807;
pub const ERROR_PCW_FAMILY_RANGE_BLANK_RETAIN_LENGTHS = 3222163808;
pub const ERROR_PCW_FAMILY_RANGE_BAD_RETAIN_LENGTHS = 3222163809;
pub const ERROR_PCW_FAMILY_RANGE_COUNT_MISMATCH = 3222163810;
pub const ERROR_PCW_EXTFILE_LONG_IGNORE_OFFSETS = 3222163811;
pub const ERROR_PCW_EXTFILE_BAD_IGNORE_OFFSETS = 3222163812;
pub const ERROR_PCW_EXTFILE_LONG_IGNORE_LENGTHS = 3222163813;
pub const ERROR_PCW_EXTFILE_BAD_IGNORE_LENGTHS = 3222163814;
pub const ERROR_PCW_EXTFILE_IGNORE_COUNT_MISMATCH = 3222163815;
pub const ERROR_PCW_EXTFILE_LONG_RETAIN_OFFSETS = 3222163816;
pub const ERROR_PCW_EXTFILE_BAD_RETAIN_OFFSETS = 3222163817;
pub const ERROR_PCW_TFILEDATA_LONG_IGNORE_OFFSETS = 3222163819;
pub const ERROR_PCW_TFILEDATA_BAD_IGNORE_OFFSETS = 3222163820;
pub const ERROR_PCW_TFILEDATA_LONG_IGNORE_LENGTHS = 3222163821;
pub const ERROR_PCW_TFILEDATA_BAD_IGNORE_LENGTHS = 3222163822;
pub const ERROR_PCW_TFILEDATA_IGNORE_COUNT_MISMATCH = 3222163823;
pub const ERROR_PCW_TFILEDATA_LONG_RETAIN_OFFSETS = 3222163824;
pub const ERROR_PCW_TFILEDATA_BAD_RETAIN_OFFSETS = 3222163825;
pub const ERROR_PCW_CANT_GENERATE_TRANSFORM = 3222163827;
pub const ERROR_PCW_CANT_CREATE_SUMMARY_INFO = 3222163828;
pub const ERROR_PCW_CANT_GENERATE_TRANSFORM_POUND = 3222163829;
pub const ERROR_PCW_CANT_CREATE_SUMMARY_INFO_POUND = 3222163830;
pub const ERROR_PCW_BAD_UPGRADED_IMAGE_PRODUCT_CODE = 3222163831;
pub const ERROR_PCW_BAD_UPGRADED_IMAGE_PRODUCT_VERSION = 3222163832;
pub const ERROR_PCW_BAD_UPGRADED_IMAGE_UPGRADE_CODE = 3222163833;
pub const ERROR_PCW_BAD_TARGET_IMAGE_PRODUCT_CODE = 3222163834;
pub const ERROR_PCW_BAD_TARGET_IMAGE_PRODUCT_VERSION = 3222163835;
pub const ERROR_PCW_BAD_TARGET_IMAGE_UPGRADE_CODE = 3222163836;
pub const ERROR_PCW_MATCHED_PRODUCT_VERSIONS = 3222163837;
pub const ERROR_PCW_OBSOLETION_WITH_SEQUENCE_DATA = 3222163838;
pub const ERROR_PCW_OBSOLETION_WITH_MSI30 = 3222163839;
pub const ERROR_PCW_OBSOLETION_WITH_PATCHSEQUENCE = 3222163840;
pub const ERROR_PCW_CANNOT_CREATE_TABLE = 3222163841;
pub const ERROR_PCW_CANT_GENERATE_SEQUENCEINFO_MAJORUPGD = 3222163842;
pub const ERROR_PCW_MAJOR_UPGD_WITHOUT_SEQUENCING = 3222163843;
pub const ERROR_PCW_BAD_PRODUCTVERSION_VALIDATION = 3222163844;
pub const ERROR_PCW_BAD_TRANSFORMSET = 3222163845;
pub const ERROR_PCW_BAD_TGT_UPD_IMAGES = 3222163846;
pub const ERROR_PCW_BAD_SUPERCEDENCE = 3222163847;
pub const ERROR_PCW_BAD_SEQUENCE = 3222163848;
pub const ERROR_PCW_BAD_TARGET = 3222163849;
pub const ERROR_PCW_NULL_PATCHFAMILY = 3222163850;
pub const ERROR_PCW_NULL_SEQUENCE_NUMBER = 3222163851;
pub const ERROR_PCW_BAD_VERSION_STRING = 3222163852;
pub const ERROR_PCW_BAD_MAJOR_VERSION = 3222163853;
pub const ERROR_PCW_SEQUENCING_BAD_TARGET = 3222163854;
pub const ERROR_PCW_PATCHMETADATA_PROP_NOT_SET = 3222163855;
pub const ERROR_PCW_INVALID_PATCHMETADATA_PROP = 3222163856;
pub const ERROR_PCW_INVALID_SUPERCEDENCE = 3222163857;
pub const ERROR_PCW_DUPLICATE_SEQUENCE_RECORD = 3222163858;
pub const ERROR_PCW_WRONG_PATCHMETADATA_STRD_PROP = 3222163859;
pub const ERROR_PCW_INVALID_PARAMETER = 3222163860;
pub const ERROR_PCW_CREATEFILE_LOG_FAILED = 3222163861;
pub const ERROR_PCW_INVALID_LOG_LEVEL = 3222163862;
pub const ERROR_PCW_INVALID_UI_LEVEL = 3222163863;
pub const ERROR_PCW_ERROR_WRITING_TO_LOG = 3222163864;
pub const ERROR_PCW_OUT_OF_MEMORY = 3222163865;
pub const ERROR_PCW_UNKNOWN_ERROR = 3222163866;
pub const ERROR_PCW_UNKNOWN_INFO = 3222163867;
pub const ERROR_PCW_UNKNOWN_WARN = 3222163868;
pub const ERROR_PCW_OPEN_VIEW = 3222163869;
pub const ERROR_PCW_EXECUTE_VIEW = 3222163870;
pub const ERROR_PCW_VIEW_FETCH = 3222163871;
pub const ERROR_PCW_FAILED_EXPAND_PATH = 3222163872;
pub const ERROR_PCW_INTERNAL_ERROR = 3222163969;
pub const ERROR_PCW_INVALID_PCP_PROPERTY = 3222163970;
pub const ERROR_PCW_INVALID_PCP_TARGETIMAGES = 3222163971;
pub const ERROR_PCW_LAX_VALIDATION_FLAGS = 3222163972;
pub const ERROR_PCW_FAILED_CREATE_TRANSFORM = 3222163973;
pub const ERROR_PCW_CANT_DELETE_TEMP_FOLDER = 3222163974;
pub const ERROR_PCW_MISSING_DIRECTORY_TABLE = 3222163975;
pub const ERROR_PCW_INVALID_SUPERSEDENCE_VALUE = 3222163976;
pub const ERROR_PCW_INVALID_PATCH_TYPE_SEQUENCING = 3222163977;
pub const ERROR_PCW_CANT_READ_FILE = 3222163978;
pub const ERROR_PCW_TARGET_WRONG_PRODUCT_VERSION_COMP = 3222163979;
pub const ERROR_PCW_INVALID_PCP_UPGRADEDFILESTOIGNORE = 3222163980;
pub const ERROR_PCW_INVALID_PCP_UPGRADEDIMAGES = 3222163981;
pub const ERROR_PCW_INVALID_PCP_EXTERNALFILES = 3222163982;
pub const ERROR_PCW_INVALID_PCP_IMAGEFAMILIES = 3222163983;
pub const ERROR_PCW_INVALID_PCP_PATCHSEQUENCE = 3222163984;
pub const ERROR_PCW_INVALID_PCP_TARGETFILES_OPTIONALDATA = 3222163985;
pub const ERROR_PCW_INVALID_PCP_UPGRADEDFILES_OPTIONALDATA = 3222163986;
pub const ERROR_PCW_MISSING_PATCHMETADATA = 3222163987;
pub const ERROR_PCW_IMAGE_PATH_NOT_EXIST = 3222163988;
pub const ERROR_PCW_INVALID_RANGE_ELEMENT = 3222163989;
pub const ERROR_PCW_INVALID_MAJOR_VERSION = 3222163990;
pub const ERROR_PCW_INVALID_PCP_PROPERTIES = 3222163991;
pub const ERROR_PCW_INVALID_PCP_FAMILYFILERANGES = 3222163992;
pub const INFO_BASE = 3222229249;
pub const INFO_PASSED_MAIN_CONTROL = 3222229249;
pub const INFO_ENTERING_PHASE_I_VALIDATION = 3222229250;
pub const INFO_ENTERING_PHASE_I = 3222229251;
pub const INFO_PCP_PATH = 3222229252;
pub const INFO_TEMP_DIR = 3222229253;
pub const INFO_SET_OPTIONS = 3222229254;
pub const INFO_PROPERTY = 3222229255;
pub const INFO_ENTERING_PHASE_II = 3222229256;
pub const INFO_ENTERING_PHASE_III = 3222229257;
pub const INFO_ENTERING_PHASE_IV = 3222229258;
pub const INFO_ENTERING_PHASE_V = 3222229259;
pub const INFO_GENERATING_METADATA = 3222229265;
pub const INFO_TEMP_DIR_CLEANUP = 3222229266;
pub const INFO_PATCHCACHE_FILEINFO_FAILURE = 3222229267;
pub const INFO_PATCHCACHE_PCI_READFAILURE = 3222229268;
pub const INFO_PATCHCACHE_PCI_WRITEFAILURE = 3222229269;
pub const INFO_USING_USER_MSI_FOR_PATCH_TABLES = 3222229270;
pub const INFO_SUCCESSFUL_PATCH_CREATION = 3222229271;
pub const WARN_BASE = 3222294785;
pub const WARN_MAJOR_UPGRADE_PATCH = 3222294785;
pub const WARN_SEQUENCE_DATA_GENERATION_DISABLED = 3222294786;
pub const WARN_SEQUENCE_DATA_SUPERSEDENCE_IGNORED = 3222294787;
pub const WARN_IMPROPER_TRANSFORM_VALIDATION = 3222294788;
pub const WARN_PCW_MISMATCHED_PRODUCT_CODES = 3222294789;
pub const WARN_PCW_MISMATCHED_PRODUCT_VERSIONS = 3222294790;
pub const WARN_INVALID_TRANSFORM_VALIDATION = 3222294791;
pub const WARN_BAD_MAJOR_VERSION = 3222294792;
pub const WARN_FILE_VERSION_DOWNREV = 3222294793;
pub const WARN_EQUAL_FILE_VERSION = 3222294794;
pub const WARN_PATCHPROPERTYNOTSET = 3222294795;
pub const WARN_OBSOLETION_WITH_SEQUENCE_DATA = 3222294802;
pub const WARN_OBSOLETION_WITH_MSI30 = 3222294801;
pub const WARN_OBSOLETION_WITH_PATCHSEQUENCE = 3222294803;
pub const DELTA_MAX_HASH_SIZE = 32;
pub const cchMaxInteger = 12;
pub const LOGNONE = 0;
pub const LOGINFO = 1;
pub const LOGWARN = 2;
pub const LOGERR = 4;
pub const LOGPERFMESSAGES = 8;
pub const LOGALL = 15;
pub const UINONE = 0;
pub const UILOGBITS = 15;
pub const DEFAULT_MINIMUM_REQUIRED_MSI_VERSION = 100;
pub const DEFAULT_FILE_SEQUENCE_START = 2;
pub const DEFAULT_DISK_ID = 2;
pub const MSIASSEMBLYINFO_NETASSEMBLY = 0;
pub const MSIASSEMBLYINFO_WIN32ASSEMBLY = 1;
pub const IASSEMBLYCACHE_UNINSTALL_DISPOSITION_UNINSTALLED = 1;
pub const IASSEMBLYCACHE_UNINSTALL_DISPOSITION_STILL_IN_USE = 2;
pub const IASSEMBLYCACHE_UNINSTALL_DISPOSITION_ALREADY_UNINSTALLED = 3;
pub const IASSEMBLYCACHE_UNINSTALL_DISPOSITION_DELETE_PENDING = 4;
pub const QUERYASMINFO_FLAG_VALIDATE = 1;
pub const ieUnknown = 0;
pub const ieError = 1;
pub const ieWarning = 2;
pub const ieInfo = 3;
pub const ieStatusGetCUB = 0;
pub const ieStatusICECount = 1;
pub const ieStatusMerge = 2;
pub const ieStatusSummaryInfo = 3;
pub const ieStatusCreateEngine = 4;
pub const ieStatusStarting = 5;
pub const ieStatusRunICE = 6;
pub const ieStatusShutdown = 7;
pub const ieStatusSuccess = 8;
pub const ieStatusFail = 9;
pub const ieStatusCancel = 10;
pub const msmErrorLanguageUnsupported = 1;
pub const msmErrorLanguageFailed = 2;
pub const msmErrorExclusion = 3;
pub const msmErrorTableMerge = 4;
pub const msmErrorResequenceMerge = 5;
pub const msmErrorFileCreate = 6;
pub const msmErrorDirCreate = 7;
pub const msmErrorFeatureRequired = 8;
pub const INSTALLMESSAGE_FATALEXIT = 0;
pub const INSTALLMESSAGE_ERROR = 16777216;
pub const INSTALLMESSAGE_WARNING = 33554432;
pub const INSTALLMESSAGE_USER = 50331648;
pub const INSTALLMESSAGE_INFO = 67108864;
pub const INSTALLMESSAGE_FILESINUSE = 83886080;
pub const INSTALLMESSAGE_RESOLVESOURCE = 100663296;
pub const INSTALLMESSAGE_OUTOFDISKSPACE = 117440512;
pub const INSTALLMESSAGE_ACTIONSTART = 134217728;
pub const INSTALLMESSAGE_ACTIONDATA = 150994944;
pub const INSTALLMESSAGE_PROGRESS = 167772160;
pub const INSTALLMESSAGE_COMMONDATA = 184549376;
pub const INSTALLMESSAGE_INITIALIZE = 201326592;
pub const INSTALLMESSAGE_TERMINATE = 218103808;
pub const INSTALLMESSAGE_SHOWDIALOG = 234881024;
pub const INSTALLMESSAGE_PERFORMANCE = 251658240;
pub const INSTALLMESSAGE_RMFILESINUSE = 419430400;
pub const INSTALLMESSAGE_INSTALLSTART = 436207616;
pub const INSTALLMESSAGE_INSTALLEND = 452984832;
pub const INSTALLUILEVEL_NOCHANGE = 0;
pub const INSTALLUILEVEL_DEFAULT = 1;
pub const INSTALLUILEVEL_NONE = 2;
pub const INSTALLUILEVEL_BASIC = 3;
pub const INSTALLUILEVEL_REDUCED = 4;
pub const INSTALLUILEVEL_FULL = 5;
pub const INSTALLUILEVEL_ENDDIALOG = 128;
pub const INSTALLUILEVEL_PROGRESSONLY = 64;
pub const INSTALLUILEVEL_HIDECANCEL = 32;
pub const INSTALLUILEVEL_SOURCERESONLY = 256;
pub const INSTALLUILEVEL_UACONLY = 512;
pub const INSTALLSTATE_NOTUSED = -7;
pub const INSTALLSTATE_BADCONFIG = -6;
pub const INSTALLSTATE_INCOMPLETE = -5;
pub const INSTALLSTATE_SOURCEABSENT = -4;
pub const INSTALLSTATE_MOREDATA = -3;
pub const INSTALLSTATE_INVALIDARG = -2;
pub const INSTALLSTATE_UNKNOWN = -1;
pub const INSTALLSTATE_BROKEN = 0;
pub const INSTALLSTATE_ADVERTISED = 1;
pub const INSTALLSTATE_REMOVED = 1;
pub const INSTALLSTATE_ABSENT = 2;
pub const INSTALLSTATE_LOCAL = 3;
pub const INSTALLSTATE_SOURCE = 4;
pub const INSTALLSTATE_DEFAULT = 5;
pub const USERINFOSTATE_MOREDATA = -3;
pub const USERINFOSTATE_INVALIDARG = -2;
pub const USERINFOSTATE_UNKNOWN = -1;
pub const USERINFOSTATE_ABSENT = 0;
pub const USERINFOSTATE_PRESENT = 1;
pub const INSTALLLEVEL_DEFAULT = 0;
pub const INSTALLLEVEL_MINIMUM = 1;
pub const INSTALLLEVEL_MAXIMUM = 65535;
pub const REINSTALLMODE_REPAIR = 1;
pub const REINSTALLMODE_FILEMISSING = 2;
pub const REINSTALLMODE_FILEOLDERVERSION = 4;
pub const REINSTALLMODE_FILEEQUALVERSION = 8;
pub const REINSTALLMODE_FILEEXACT = 16;
pub const REINSTALLMODE_FILEVERIFY = 32;
pub const REINSTALLMODE_FILEREPLACE = 64;
pub const REINSTALLMODE_MACHINEDATA = 128;
pub const REINSTALLMODE_USERDATA = 256;
pub const REINSTALLMODE_SHORTCUT = 512;
pub const REINSTALLMODE_PACKAGE = 1024;
pub const INSTALLLOGMODE_FATALEXIT = 1;
pub const INSTALLLOGMODE_ERROR = 2;
pub const INSTALLLOGMODE_WARNING = 4;
pub const INSTALLLOGMODE_USER = 8;
pub const INSTALLLOGMODE_INFO = 16;
pub const INSTALLLOGMODE_RESOLVESOURCE = 64;
pub const INSTALLLOGMODE_OUTOFDISKSPACE = 128;
pub const INSTALLLOGMODE_ACTIONSTART = 256;
pub const INSTALLLOGMODE_ACTIONDATA = 512;
pub const INSTALLLOGMODE_COMMONDATA = 2048;
pub const INSTALLLOGMODE_PROPERTYDUMP = 1024;
pub const INSTALLLOGMODE_VERBOSE = 4096;
pub const INSTALLLOGMODE_EXTRADEBUG = 8192;
pub const INSTALLLOGMODE_LOGONLYONERROR = 16384;
pub const INSTALLLOGMODE_LOGPERFORMANCE = 32768;
pub const INSTALLLOGMODE_PROGRESS = 1024;
pub const INSTALLLOGMODE_INITIALIZE = 4096;
pub const INSTALLLOGMODE_TERMINATE = 8192;
pub const INSTALLLOGMODE_SHOWDIALOG = 16384;
pub const INSTALLLOGMODE_FILESINUSE = 32;
pub const INSTALLLOGMODE_RMFILESINUSE = 33554432;
pub const INSTALLLOGMODE_INSTALLSTART = 67108864;
pub const INSTALLLOGMODE_INSTALLEND = 134217728;
pub const INSTALLLOGATTRIBUTES_APPEND = 1;
pub const INSTALLLOGATTRIBUTES_FLUSHEACHLINE = 2;
pub const INSTALLFEATUREATTRIBUTE_FAVORLOCAL = 1;
pub const INSTALLFEATUREATTRIBUTE_FAVORSOURCE = 2;
pub const INSTALLFEATUREATTRIBUTE_FOLLOWPARENT = 4;
pub const INSTALLFEATUREATTRIBUTE_FAVORADVERTISE = 8;
pub const INSTALLFEATUREATTRIBUTE_DISALLOWADVERTISE = 16;
pub const INSTALLFEATUREATTRIBUTE_NOUNSUPPORTEDADVERTISE = 32;
pub const INSTALLMODE_NODETECTION_ANY = -4;
pub const INSTALLMODE_NOSOURCERESOLUTION = -3;
pub const INSTALLMODE_NODETECTION = -2;
pub const INSTALLMODE_EXISTING = -1;
pub const INSTALLMODE_DEFAULT = 0;
pub const MSIPATCHSTATE_INVALID = 0;
pub const MSIPATCHSTATE_APPLIED = 1;
pub const MSIPATCHSTATE_SUPERSEDED = 2;
pub const MSIPATCHSTATE_OBSOLETED = 4;
pub const MSIPATCHSTATE_REGISTERED = 8;
pub const MSIPATCHSTATE_ALL = 15;
pub const MSIINSTALLCONTEXT_FIRSTVISIBLE = 0;
pub const MSIINSTALLCONTEXT_NONE = 0;
pub const MSIINSTALLCONTEXT_USERMANAGED = 1;
pub const MSIINSTALLCONTEXT_USERUNMANAGED = 2;
pub const MSIINSTALLCONTEXT_MACHINE = 4;
pub const MSIINSTALLCONTEXT_ALL = 7;
pub const MSIINSTALLCONTEXT_ALLUSERMANAGED = 8;
pub const MSIPATCH_DATATYPE_PATCHFILE = 0;
pub const MSIPATCH_DATATYPE_XMLPATH = 1;
pub const MSIPATCH_DATATYPE_XMLBLOB = 2;
pub const SCRIPTFLAGS_CACHEINFO = 1;
pub const SCRIPTFLAGS_SHORTCUTS = 4;
pub const SCRIPTFLAGS_MACHINEASSIGN = 8;
pub const SCRIPTFLAGS_REGDATA_CNFGINFO = 32;
pub const SCRIPTFLAGS_VALIDATE_TRANSFORMS_LIST = 64;
pub const SCRIPTFLAGS_REGDATA_CLASSINFO = 128;
pub const SCRIPTFLAGS_REGDATA_EXTENSIONINFO = 256;
pub const SCRIPTFLAGS_REGDATA_APPINFO = 384;
pub const SCRIPTFLAGS_REGDATA = 416;
pub const ADVERTISEFLAGS_MACHINEASSIGN = 0;
pub const ADVERTISEFLAGS_USERASSIGN = 1;
pub const INSTALLTYPE_DEFAULT = 0;
pub const INSTALLTYPE_NETWORK_IMAGE = 1;
pub const INSTALLTYPE_SINGLE_INSTANCE = 2;
pub const MSIARCHITECTUREFLAGS_X86 = 1;
pub const MSIARCHITECTUREFLAGS_IA64 = 2;
pub const MSIARCHITECTUREFLAGS_AMD64 = 4;
pub const MSIARCHITECTUREFLAGS_ARM = 8;
pub const MSIOPENPACKAGEFLAGS_IGNOREMACHINESTATE = 1;
pub const MSIADVERTISEOPTIONFLAGS_INSTANCE = 1;
pub const MSISOURCETYPE_UNKNOWN = 0;
pub const MSISOURCETYPE_NETWORK = 1;
pub const MSISOURCETYPE_URL = 2;
pub const MSISOURCETYPE_MEDIA = 4;
pub const MSICODE_PRODUCT = 0;
pub const MSICODE_PATCH = 1073741824;
pub const MSITRANSACTION_CHAIN_EMBEDDEDUI = 1;
pub const MSITRANSACTION_JOIN_EXISTING_EMBEDDEDUI = 2;
pub const MSITRANSACTIONSTATE_ROLLBACK = 0;
pub const MSITRANSACTIONSTATE_COMMIT = 1;
pub const MSIDBSTATE_ERROR = -1;
pub const MSIDBSTATE_READ = 0;
pub const MSIDBSTATE_WRITE = 1;
pub const MSIMODIFY_SEEK = -1;
pub const MSIMODIFY_REFRESH = 0;
pub const MSIMODIFY_INSERT = 1;
pub const MSIMODIFY_UPDATE = 2;
pub const MSIMODIFY_ASSIGN = 3;
pub const MSIMODIFY_REPLACE = 4;
pub const MSIMODIFY_MERGE = 5;
pub const MSIMODIFY_DELETE = 6;
pub const MSIMODIFY_INSERT_TEMPORARY = 7;
pub const MSIMODIFY_VALIDATE = 8;
pub const MSIMODIFY_VALIDATE_NEW = 9;
pub const MSIMODIFY_VALIDATE_FIELD = 10;
pub const MSIMODIFY_VALIDATE_DELETE = 11;
pub const MSICOLINFO_NAMES = 0;
pub const MSICOLINFO_TYPES = 1;
pub const MSICONDITION_FALSE = 0;
pub const MSICONDITION_TRUE = 1;
pub const MSICONDITION_NONE = 2;
pub const MSICONDITION_ERROR = 3;
pub const MSICOSTTREE_SELFONLY = 0;
pub const MSICOSTTREE_CHILDREN = 1;
pub const MSICOSTTREE_PARENTS = 2;
pub const MSICOSTTREE_RESERVED = 3;
pub const MSIDBERROR_INVALIDARG = -3;
pub const MSIDBERROR_MOREDATA = -2;
pub const MSIDBERROR_FUNCTIONERROR = -1;
pub const MSIDBERROR_NOERROR = 0;
pub const MSIDBERROR_DUPLICATEKEY = 1;
pub const MSIDBERROR_REQUIRED = 2;
pub const MSIDBERROR_BADLINK = 3;
pub const MSIDBERROR_OVERFLOW = 4;
pub const MSIDBERROR_UNDERFLOW = 5;
pub const MSIDBERROR_NOTINSET = 6;
pub const MSIDBERROR_BADVERSION = 7;
pub const MSIDBERROR_BADCASE = 8;
pub const MSIDBERROR_BADGUID = 9;
pub const MSIDBERROR_BADWILDCARD = 10;
pub const MSIDBERROR_BADIDENTIFIER = 11;
pub const MSIDBERROR_BADLANGUAGE = 12;
pub const MSIDBERROR_BADFILENAME = 13;
pub const MSIDBERROR_BADPATH = 14;
pub const MSIDBERROR_BADCONDITION = 15;
pub const MSIDBERROR_BADFORMATTED = 16;
pub const MSIDBERROR_BADTEMPLATE = 17;
pub const MSIDBERROR_BADDEFAULTDIR = 18;
pub const MSIDBERROR_BADREGPATH = 19;
pub const MSIDBERROR_BADCUSTOMSOURCE = 20;
pub const MSIDBERROR_BADPROPERTY = 21;
pub const MSIDBERROR_MISSINGDATA = 22;
pub const MSIDBERROR_BADCATEGORY = 23;
pub const MSIDBERROR_BADKEYTABLE = 24;
pub const MSIDBERROR_BADMAXMINVALUES = 25;
pub const MSIDBERROR_BADCABINET = 26;
pub const MSIDBERROR_BADSHORTCUT = 27;
pub const MSIDBERROR_STRINGOVERFLOW = 28;
pub const MSIDBERROR_BADLOCALIZEATTRIB = 29;
pub const MSIRUNMODE_ADMIN = 0;
pub const MSIRUNMODE_ADVERTISE = 1;
pub const MSIRUNMODE_MAINTENANCE = 2;
pub const MSIRUNMODE_ROLLBACKENABLED = 3;
pub const MSIRUNMODE_LOGENABLED = 4;
pub const MSIRUNMODE_OPERATIONS = 5;
pub const MSIRUNMODE_REBOOTATEND = 6;
pub const MSIRUNMODE_REBOOTNOW = 7;
pub const MSIRUNMODE_CABINET = 8;
pub const MSIRUNMODE_SOURCESHORTNAMES = 9;
pub const MSIRUNMODE_TARGETSHORTNAMES = 10;
pub const MSIRUNMODE_RESERVED11 = 11;
pub const MSIRUNMODE_WINDOWS9X = 12;
pub const MSIRUNMODE_ZAWENABLED = 13;
pub const MSIRUNMODE_RESERVED14 = 14;
pub const MSIRUNMODE_RESERVED15 = 15;
pub const MSIRUNMODE_SCHEDULED = 16;
pub const MSIRUNMODE_ROLLBACK = 17;
pub const MSIRUNMODE_COMMIT = 18;
pub const MSITRANSFORM_ERROR_ADDEXISTINGROW = 1;
pub const MSITRANSFORM_ERROR_DELMISSINGROW = 2;
pub const MSITRANSFORM_ERROR_ADDEXISTINGTABLE = 4;
pub const MSITRANSFORM_ERROR_DELMISSINGTABLE = 8;
pub const MSITRANSFORM_ERROR_UPDATEMISSINGROW = 16;
pub const MSITRANSFORM_ERROR_CHANGECODEPAGE = 32;
pub const MSITRANSFORM_ERROR_VIEWTRANSFORM = 256;
pub const MSITRANSFORM_ERROR_NONE = 0;
pub const MSITRANSFORM_VALIDATE_LANGUAGE = 1;
pub const MSITRANSFORM_VALIDATE_PRODUCT = 2;
pub const MSITRANSFORM_VALIDATE_PLATFORM = 4;
pub const MSITRANSFORM_VALIDATE_MAJORVERSION = 8;
pub const MSITRANSFORM_VALIDATE_MINORVERSION = 16;
pub const MSITRANSFORM_VALIDATE_UPDATEVERSION = 32;
pub const MSITRANSFORM_VALIDATE_NEWLESSBASEVERSION = 64;
pub const MSITRANSFORM_VALIDATE_NEWLESSEQUALBASEVERSION = 128;
pub const MSITRANSFORM_VALIDATE_NEWEQUALBASEVERSION = 256;
pub const MSITRANSFORM_VALIDATE_NEWGREATEREQUALBASEVERSION = 512;
pub const MSITRANSFORM_VALIDATE_NEWGREATERBASEVERSION = 1024;
pub const MSITRANSFORM_VALIDATE_UPGRADECODE = 2048;
pub const ASM_NAME_PUBLIC_KEY = 0;
pub const ASM_NAME_PUBLIC_KEY_TOKEN = 1;
pub const ASM_NAME_HASH_VALUE = 2;
pub const ASM_NAME_NAME = 3;
pub const ASM_NAME_MAJOR_VERSION = 4;
pub const ASM_NAME_MINOR_VERSION = 5;
pub const ASM_NAME_BUILD_NUMBER = 6;
pub const ASM_NAME_REVISION_NUMBER = 7;
pub const ASM_NAME_CULTURE = 8;
pub const ASM_NAME_PROCESSOR_ID_ARRAY = 9;
pub const ASM_NAME_OSINFO_ARRAY = 10;
pub const ASM_NAME_HASH_ALGID = 11;
pub const ASM_NAME_ALIAS = 12;
pub const ASM_NAME_CODEBASE_URL = 13;
pub const ASM_NAME_CODEBASE_LASTMOD = 14;
pub const ASM_NAME_NULL_PUBLIC_KEY = 15;
pub const ASM_NAME_NULL_PUBLIC_KEY_TOKEN = 16;
pub const ASM_NAME_CUSTOM = 17;
pub const ASM_NAME_NULL_CUSTOM = 18;
pub const ASM_NAME_MVID = 19;
pub const ASM_NAME_MAX_PARAMS = 20;
pub const ASM_BINDF_FORCE_CACHE_INSTALL = 1;
pub const ASM_BINDF_RFS_INTEGRITY_CHECK = 2;
pub const ASM_BINDF_RFS_MODULE_CHECK = 4;
pub const ASM_BINDF_BINPATH_PROBE_ONLY = 8;
pub const ASM_BINDF_SHARED_BINPATH_HINT = 16;
pub const ASM_BINDF_PARENT_ASM_HINT = 32;
pub const ASM_DISPLAYF_VERSION = 1;
pub const ASM_DISPLAYF_CULTURE = 2;
pub const ASM_DISPLAYF_PUBLIC_KEY_TOKEN = 4;
pub const ASM_DISPLAYF_PUBLIC_KEY = 8;
pub const ASM_DISPLAYF_CUSTOM = 16;
pub const ASM_DISPLAYF_PROCESSORARCHITECTURE = 32;
pub const ASM_DISPLAYF_LANGUAGEID = 64;
pub const ASM_CMPF_NAME = 1;
pub const ASM_CMPF_MAJOR_VERSION = 2;
pub const ASM_CMPF_MINOR_VERSION = 4;
pub const ASM_CMPF_BUILD_NUMBER = 8;
pub const ASM_CMPF_REVISION_NUMBER = 16;
pub const ASM_CMPF_PUBLIC_KEY_TOKEN = 32;
pub const ASM_CMPF_CULTURE = 64;
pub const ASM_CMPF_CUSTOM = 128;
pub const ASM_CMPF_ALL = 255;
pub const ASM_CMPF_DEFAULT = 256;
pub const CANOF_PARSE_DISPLAY_NAME = 1;
pub const CANOF_SET_DEFAULT_VALUES = 2;
pub const msidbControlAttributesVisible = 1;
pub const msidbControlAttributesEnabled = 2;
pub const msidbControlAttributesSunken = 4;
pub const msidbControlAttributesIndirect = 8;
pub const msidbControlAttributesInteger = 16;
pub const msidbControlAttributesRTLRO = 32;
pub const msidbControlAttributesRightAligned = 64;
pub const msidbControlAttributesLeftScroll = 128;
pub const msidbControlAttributesBiDi = 224;
pub const msidbControlAttributesTransparent = 65536;
pub const msidbControlAttributesNoPrefix = 131072;
pub const msidbControlAttributesNoWrap = 262144;
pub const msidbControlAttributesFormatSize = 524288;
pub const msidbControlAttributesUsersLanguage = 1048576;
pub const msidbControlAttributesMultiline = 65536;
pub const msidbControlAttributesPasswordInput = 2097152;
pub const msidbControlAttributesProgress95 = 65536;
pub const msidbControlAttributesRemovableVolume = 65536;
pub const msidbControlAttributesFixedVolume = 131072;
pub const msidbControlAttributesRemoteVolume = 262144;
pub const msidbControlAttributesCDROMVolume = 524288;
pub const msidbControlAttributesRAMDiskVolume = 1048576;
pub const msidbControlAttributesFloppyVolume = 2097152;
pub const msidbControlShowRollbackCost = 4194304;
pub const msidbControlAttributesSorted = 65536;
pub const msidbControlAttributesComboList = 131072;
pub const msidbControlAttributesImageHandle = 65536;
pub const msidbControlAttributesPushLike = 131072;
pub const msidbControlAttributesBitmap = 262144;
pub const msidbControlAttributesIcon = 524288;
pub const msidbControlAttributesFixedSize = 1048576;
pub const msidbControlAttributesIconSize16 = 2097152;
pub const msidbControlAttributesIconSize32 = 4194304;
pub const msidbControlAttributesIconSize48 = 6291456;
pub const msidbControlAttributesElevationShield = 8388608;
pub const msidbControlAttributesHasBorder = 16777216;
pub const msidbLocatorTypeDirectory = 0;
pub const msidbLocatorTypeFileName = 1;
pub const msidbLocatorTypeRawValue = 2;
pub const msidbLocatorType64bit = 16;
pub const msidbComponentAttributesLocalOnly = 0;
pub const msidbComponentAttributesSourceOnly = 1;
pub const msidbComponentAttributesOptional = 2;
pub const msidbComponentAttributesRegistryKeyPath = 4;
pub const msidbComponentAttributesSharedDllRefCount = 8;
pub const msidbComponentAttributesPermanent = 16;
pub const msidbComponentAttributesODBCDataSource = 32;
pub const msidbComponentAttributesTransitive = 64;
pub const msidbComponentAttributesNeverOverwrite = 128;
pub const msidbComponentAttributes64bit = 256;
pub const msidbComponentAttributesDisableRegistryReflection = 512;
pub const msidbComponentAttributesUninstallOnSupersedence = 1024;
pub const msidbComponentAttributesShared = 2048;
pub const msidbAssemblyAttributesURT = 0;
pub const msidbAssemblyAttributesWin32 = 1;
pub const msidbCustomActionTypeDll = 1;
pub const msidbCustomActionTypeExe = 2;
pub const msidbCustomActionTypeTextData = 3;
pub const msidbCustomActionTypeJScript = 5;
pub const msidbCustomActionTypeVBScript = 6;
pub const msidbCustomActionTypeInstall = 7;
pub const msidbCustomActionTypeBinaryData = 0;
pub const msidbCustomActionTypeSourceFile = 16;
pub const msidbCustomActionTypeDirectory = 32;
pub const msidbCustomActionTypeProperty = 48;
pub const msidbCustomActionTypeContinue = 64;
pub const msidbCustomActionTypeAsync = 128;
pub const msidbCustomActionTypeFirstSequence = 256;
pub const msidbCustomActionTypeOncePerProcess = 512;
pub const msidbCustomActionTypeClientRepeat = 768;
pub const msidbCustomActionTypeInScript = 1024;
pub const msidbCustomActionTypeRollback = 256;
pub const msidbCustomActionTypeCommit = 512;
pub const msidbCustomActionTypeNoImpersonate = 2048;
pub const msidbCustomActionTypeTSAware = 16384;
pub const msidbCustomActionType64BitScript = 4096;
pub const msidbCustomActionTypeHideTarget = 8192;
pub const msidbCustomActionTypePatchUninstall = 32768;
pub const msidbDialogAttributesVisible = 1;
pub const msidbDialogAttributesModal = 2;
pub const msidbDialogAttributesMinimize = 4;
pub const msidbDialogAttributesSysModal = 8;
pub const msidbDialogAttributesKeepModeless = 16;
pub const msidbDialogAttributesTrackDiskSpace = 32;
pub const msidbDialogAttributesUseCustomPalette = 64;
pub const msidbDialogAttributesRTLRO = 128;
pub const msidbDialogAttributesRightAligned = 256;
pub const msidbDialogAttributesLeftScroll = 512;
pub const msidbDialogAttributesBiDi = 896;
pub const msidbDialogAttributesError = 65536;
pub const msidbFeatureAttributesFavorLocal = 0;
pub const msidbFeatureAttributesFavorSource = 1;
pub const msidbFeatureAttributesFollowParent = 2;
pub const msidbFeatureAttributesFavorAdvertise = 4;
pub const msidbFeatureAttributesDisallowAdvertise = 8;
pub const msidbFeatureAttributesUIDisallowAbsent = 16;
pub const msidbFeatureAttributesNoUnsupportedAdvertise = 32;
pub const msidbFileAttributesReadOnly = 1;
pub const msidbFileAttributesHidden = 2;
pub const msidbFileAttributesSystem = 4;
pub const msidbFileAttributesReserved0 = 8;
pub const msidbFileAttributesIsolatedComp = 16;
pub const msidbFileAttributesReserved1 = 64;
pub const msidbFileAttributesReserved2 = 128;
pub const msidbFileAttributesReserved3 = 256;
pub const msidbFileAttributesVital = 512;
pub const msidbFileAttributesChecksum = 1024;
pub const msidbFileAttributesPatchAdded = 4096;
pub const msidbFileAttributesNoncompressed = 8192;
pub const msidbFileAttributesCompressed = 16384;
pub const msidbFileAttributesReserved4 = 32768;
pub const msidbIniFileActionAddLine = 0;
pub const msidbIniFileActionCreateLine = 1;
pub const msidbIniFileActionRemoveLine = 2;
pub const msidbIniFileActionAddTag = 3;
pub const msidbIniFileActionRemoveTag = 4;
pub const msidbMoveFileOptionsMove = 1;
pub const msidbODBCDataSourceRegistrationPerMachine = 0;
pub const msidbODBCDataSourceRegistrationPerUser = 1;
pub const msidbClassAttributesRelativePath = 1;
pub const msidbPatchAttributesNonVital = 1;
pub const msidbRegistryRootClassesRoot = 0;
pub const msidbRegistryRootCurrentUser = 1;
pub const msidbRegistryRootLocalMachine = 2;
pub const msidbRegistryRootUsers = 3;
pub const msidbRemoveFileInstallModeOnInstall = 1;
pub const msidbRemoveFileInstallModeOnRemove = 2;
pub const msidbRemoveFileInstallModeOnBoth = 3;
pub const msidbServiceControlEventStart = 1;
pub const msidbServiceControlEventStop = 2;
pub const msidbServiceControlEventDelete = 8;
pub const msidbServiceControlEventUninstallStart = 16;
pub const msidbServiceControlEventUninstallStop = 32;
pub const msidbServiceControlEventUninstallDelete = 128;
pub const msidbServiceConfigEventInstall = 1;
pub const msidbServiceConfigEventUninstall = 2;
pub const msidbServiceConfigEventReinstall = 4;
pub const msidbServiceInstallErrorControlVital = 32768;
pub const msidbTextStyleStyleBitsBold = 1;
pub const msidbTextStyleStyleBitsItalic = 2;
pub const msidbTextStyleStyleBitsUnderline = 4;
pub const msidbTextStyleStyleBitsStrike = 8;
pub const msidbUpgradeAttributesMigrateFeatures = 1;
pub const msidbUpgradeAttributesOnlyDetect = 2;
pub const msidbUpgradeAttributesIgnoreRemoveFailure = 4;
pub const msidbUpgradeAttributesVersionMinInclusive = 256;
pub const msidbUpgradeAttributesVersionMaxInclusive = 512;
pub const msidbUpgradeAttributesLanguagesExclusive = 1024;
pub const msidbEmbeddedUI = 1;
pub const msidbEmbeddedHandlesBasic = 2;
pub const msidbSumInfoSourceTypeSFN = 1;
pub const msidbSumInfoSourceTypeCompressed = 2;
pub const msidbSumInfoSourceTypeAdminImage = 4;
pub const msidbSumInfoSourceTypeLUAPackage = 8;
pub const msirbRebootImmediate = 1;
pub const msirbRebootDeferred = 2;
pub const msirbRebootUndeterminedReason = 0;
pub const msirbRebootInUseFilesReason = 1;
pub const msirbRebootScheduleRebootReason = 2;
pub const msirbRebootForceRebootReason = 3;
pub const msirbRebootCustomActionReason = 4;
pub const msifiFastInstallNoSR = 1;
pub const msifiFastInstallQuickCosting = 2;
pub const msifiFastInstallLessPrgMsg = 4;
pub const TILE_TEMPLATE_INVALID = 0;
pub const TILE_TEMPLATE_FLIP = 5;
pub const TILE_TEMPLATE_DEEPLINK = 13;
pub const TILE_TEMPLATE_CYCLE = 14;
pub const TILE_TEMPLATE_METROCOUNT = 1;
pub const TILE_TEMPLATE_AGILESTORE = 2;
pub const TILE_TEMPLATE_GAMES = 3;
pub const TILE_TEMPLATE_CALENDAR = 4;
pub const TILE_TEMPLATE_MUSICVIDEO = 7;
pub const TILE_TEMPLATE_PEOPLE = 10;
pub const TILE_TEMPLATE_CONTACT = 11;
pub const TILE_TEMPLATE_GROUP = 12;
pub const TILE_TEMPLATE_DEFAULT = 15;
pub const TILE_TEMPLATE_BADGE = 16;
pub const TILE_TEMPLATE_BLOCK = 17;
pub const TILE_TEMPLATE_TEXT01 = 18;
pub const TILE_TEMPLATE_TEXT02 = 19;
pub const TILE_TEMPLATE_TEXT03 = 20;
pub const TILE_TEMPLATE_TEXT04 = 21;
pub const TILE_TEMPLATE_TEXT05 = 22;
pub const TILE_TEMPLATE_TEXT06 = 23;
pub const TILE_TEMPLATE_TEXT07 = 24;
pub const TILE_TEMPLATE_TEXT08 = 25;
pub const TILE_TEMPLATE_TEXT09 = 26;
pub const TILE_TEMPLATE_TEXT10 = 27;
pub const TILE_TEMPLATE_TEXT11 = 28;
pub const TILE_TEMPLATE_IMAGE = 29;
pub const TILE_TEMPLATE_IMAGECOLLECTION = 30;
pub const TILE_TEMPLATE_IMAGEANDTEXT01 = 31;
pub const TILE_TEMPLATE_IMAGEANDTEXT02 = 32;
pub const TILE_TEMPLATE_BLOCKANDTEXT01 = 33;
pub const TILE_TEMPLATE_BLOCKANDTEXT02 = 34;
pub const TILE_TEMPLATE_PEEKIMAGEANDTEXT01 = 35;
pub const TILE_TEMPLATE_PEEKIMAGEANDTEXT02 = 36;
pub const TILE_TEMPLATE_PEEKIMAGEANDTEXT03 = 37;
pub const TILE_TEMPLATE_PEEKIMAGEANDTEXT04 = 38;
pub const TILE_TEMPLATE_PEEKIMAGE01 = 39;
pub const TILE_TEMPLATE_PEEKIMAGE02 = 40;
pub const TILE_TEMPLATE_PEEKIMAGE03 = 41;
pub const TILE_TEMPLATE_PEEKIMAGE04 = 42;
pub const TILE_TEMPLATE_PEEKIMAGE05 = 43;
pub const TILE_TEMPLATE_PEEKIMAGE06 = 44;
pub const TILE_TEMPLATE_PEEKIMAGECOLLECTION01 = 45;
pub const TILE_TEMPLATE_PEEKIMAGECOLLECTION02 = 46;
pub const TILE_TEMPLATE_PEEKIMAGECOLLECTION03 = 47;
pub const TILE_TEMPLATE_PEEKIMAGECOLLECTION04 = 48;
pub const TILE_TEMPLATE_PEEKIMAGECOLLECTION05 = 49;
pub const TILE_TEMPLATE_PEEKIMAGECOLLECTION06 = 50;
pub const TILE_TEMPLATE_SMALLIMAGEANDTEXT01 = 51;
pub const TILE_TEMPLATE_SMALLIMAGEANDTEXT02 = 52;
pub const TILE_TEMPLATE_SMALLIMAGEANDTEXT03 = 53;
pub const TILE_TEMPLATE_SMALLIMAGEANDTEXT04 = 54;
pub const TILE_TEMPLATE_SMALLIMAGEANDTEXT05 = 55;
pub const TILE_TEMPLATE_METROCOUNTQUEUE = 56;
pub const TILE_TEMPLATE_SEARCH = 57;
pub const TILE_TEMPLATE_TILEFLYOUT01 = 58;
pub const TILE_TEMPLATE_FOLDER = 59;
pub const TILE_TEMPLATE_ALL = 100;
pub const PM_APP_GENRE_GAMES = 0;
pub const PM_APP_GENRE_OTHER = 1;
pub const PM_APP_GENRE_INVALID = 2;
pub const PM_APPLICATION_INSTALL_NORMAL = 0;
pub const PM_APPLICATION_INSTALL_IN_ROM = 1;
pub const PM_APPLICATION_INSTALL_PA = 2;
pub const PM_APPLICATION_INSTALL_DEBUG = 3;
pub const PM_APPLICATION_INSTALL_ENTERPRISE = 4;
pub const PM_APPLICATION_INSTALL_INVALID = 5;
pub const PM_APPLICATION_STATE_MIN = 0;
pub const PM_APPLICATION_STATE_INSTALLED = 1;
pub const PM_APPLICATION_STATE_INSTALLING = 2;
pub const PM_APPLICATION_STATE_UPDATING = 3;
pub const PM_APPLICATION_STATE_UNINSTALLING = 4;
pub const PM_APPLICATION_STATE_LICENSE_UPDATING = 5;
pub const PM_APPLICATION_STATE_MOVING = 6;
pub const PM_APPLICATION_STATE_DISABLED_SD_CARD = 7;
pub const PM_APPLICATION_STATE_DISABLED_ENTERPRISE = 8;
pub const PM_APPLICATION_STATE_DISABLED_BACKING_UP = 9;
pub const PM_APPLICATION_STATE_DISABLED_MDIL_BINDING = 10;
pub const PM_APPLICATION_STATE_MAX = 10;
pub const PM_APPLICATION_STATE_INVALID = 11;
pub const PM_APPLICATION_HUBTYPE_NONMUSIC = 0;
pub const PM_APPLICATION_HUBTYPE_MUSIC = 1;
pub const PM_APPLICATION_HUBTYPE_INVALID = 2;
pub const PM_TILE_HUBTYPE_MUSIC = 1;
pub const PM_TILE_HUBTYPE_MOSETTINGS = 268435456;
pub const PM_TILE_HUBTYPE_GAMES = 536870912;
pub const PM_TILE_HUBTYPE_APPLIST = 1073741824;
pub const PM_TILE_HUBTYPE_STARTMENU = -2147483648;
pub const PM_TILE_HUBTYPE_LOCKSCREEN = 16777216;
pub const PM_TILE_HUBTYPE_KIDZONE = 33554432;
pub const PM_TILE_HUBTYPE_CACHED = 67108864;
pub const PM_TILE_HUBTYPE_INVALID = 67108865;
pub const PM_STARTTILE_TYPE_PRIMARY = 1;
pub const PM_STARTTILE_TYPE_SECONDARY = 2;
pub const PM_STARTTILE_TYPE_APPLIST = 3;
pub const PM_STARTTILE_TYPE_APPLISTPRIMARY = 4;
pub const PM_STARTTILE_TYPE_INVALID = 5;
pub const PM_TASK_TYPE_NORMAL = 0;
pub const PM_TASK_TYPE_DEFAULT = 1;
pub const PM_TASK_TYPE_SETTINGS = 2;
pub const PM_TASK_TYPE_BACKGROUNDSERVICEAGENT = 3;
pub const PM_TASK_TYPE_BACKGROUNDWORKER = 4;
pub const PM_TASK_TYPE_INVALID = 5;
pub const PACKMAN_RUNTIME_NATIVE = 1;
pub const PACKMAN_RUNTIME_SILVERLIGHTMOBILE = 2;
pub const PACKMAN_RUNTIME_XNA = 3;
pub const PACKMAN_RUNTIME_MODERN_NATIVE = 4;
pub const PACKMAN_RUNTIME_JUPITER = 5;
pub const PACKMAN_RUNTIME_INVALID = 6;
pub const PM_ACTIVATION_POLICY_RESUME = 0;
pub const PM_ACTIVATION_POLICY_RESUMESAMEPARAMS = 1;
pub const PM_ACTIVATION_POLICY_REPLACE = 2;
pub const PM_ACTIVATION_POLICY_REPLACESAMEPARAMS = 3;
pub const PM_ACTIVATION_POLICY_MULTISESSION = 4;
pub const PM_ACTIVATION_POLICY_REPLACE_IGNOREFOREGROUND = 5;
pub const PM_ACTIVATION_POLICY_UNKNOWN = 6;
pub const PM_ACTIVATION_POLICY_INVALID = 7;
pub const PM_TASK_TRANSITION_DEFAULT = 0;
pub const PM_TASK_TRANSITION_NONE = 1;
pub const PM_TASK_TRANSITION_TURNSTILE = 2;
pub const PM_TASK_TRANSITION_SLIDE = 3;
pub const PM_TASK_TRANSITION_SWIVEL = 4;
pub const PM_TASK_TRANSITION_READERBOARD = 5;
pub const PM_TASK_TRANSITION_CUSTOM = 6;
pub const PM_TASK_TRANSITION_INVALID = 7;
pub const PM_APP_FILTER_ALL = 0;
pub const PM_APP_FILTER_VISIBLE = 1;
pub const PM_APP_FILTER_GENRE = 2;
pub const PM_APP_FILTER_NONGAMES = 3;
pub const PM_APP_FILTER_HUBTYPE = 4;
pub const PM_APP_FILTER_PINABLEONKIDZONE = 5;
pub const PM_APP_FILTER_ALL_INCLUDE_MODERN = 6;
pub const PM_APP_FILTER_FRAMEWORK = 7;
pub const PM_APP_FILTER_MAX = 8;
pub const PM_TILE_FILTER_APPLIST = 8;
pub const PM_TILE_FILTER_PINNED = 9;
pub const PM_TILE_FILTER_HUBTYPE = 10;
pub const PM_TILE_FILTER_APP_ALL = 11;
pub const PM_TILE_FILTER_MAX = 12;
pub const PM_TASK_FILTER_APP_ALL = 12;
pub const PM_TASK_FILTER_TASK_TYPE = 13;
pub const PM_TASK_FILTER_DEHYD_SUPRESSING = 14;
pub const PM_TASK_FILTER_APP_TASK_TYPE = 15;
pub const PM_TASK_FILTER_BGEXECUTION = 16;
pub const PM_TASK_FILTER_MAX = 17;
pub const PM_ENUM_EXTENSION_FILTER_BY_CONSUMER = 17;
pub const PM_ENUM_EXTENSION_FILTER_APPCONNECT = 17;
pub const PM_ENUM_EXTENSION_FILTER_PROTOCOL_ALL = 18;
pub const PM_ENUM_EXTENSION_FILTER_FTASSOC_FILETYPE_ALL = 19;
pub const PM_ENUM_EXTENSION_FILTER_FTASSOC_CONTENTTYPE_ALL = 20;
pub const PM_ENUM_EXTENSION_FILTER_FTASSOC_APPLICATION_ALL = 21;
pub const PM_ENUM_EXTENSION_FILTER_SHARETARGET_ALL = 22;
pub const PM_ENUM_EXTENSION_FILTER_FILEOPENPICKER_ALL = 23;
pub const PM_ENUM_EXTENSION_FILTER_FILESAVEPICKER_ALL = 24;
pub const PM_ENUM_EXTENSION_FILTER_CACHEDFILEUPDATER_ALL = 25;
pub const PM_ENUM_EXTENSION_FILTER_MAX = 26;
pub const PM_ENUM_BSA_FILTER_ALL = 26;
pub const PM_ENUM_BSA_FILTER_BY_TASKID = 27;
pub const PM_ENUM_BSA_FILTER_BY_PRODUCTID = 28;
pub const PM_ENUM_BSA_FILTER_BY_PERIODIC = 29;
pub const PM_ENUM_BSA_FILTER_BY_ALL_LAUNCHONBOOT = 30;
pub const PM_ENUM_BSA_FILTER_MAX = 31;
pub const PM_ENUM_BW_FILTER_BOOTWORKER_ALL = 31;
pub const PM_ENUM_BW_FILTER_BY_TASKID = 32;
pub const PM_ENUM_BW_FILTER_MAX = 33;
pub const PM_LIVETILE_RECURRENCE_TYPE_INSTANT = 0;
pub const PM_LIVETILE_RECURRENCE_TYPE_ONETIME = 1;
pub const PM_LIVETILE_RECURRENCE_TYPE_INTERVAL = 2;
pub const PM_LIVETILE_RECURRENCE_TYPE_MAX = 2;
pub const PM_TILE_SIZE_SMALL = 0;
pub const PM_TILE_SIZE_MEDIUM = 1;
pub const PM_TILE_SIZE_LARGE = 2;
pub const PM_TILE_SIZE_SQUARE310X310 = 3;
pub const PM_TILE_SIZE_TALL150X310 = 4;
pub const PM_TILE_SIZE_INVALID = 5;
pub const PM_LOGO_SIZE_SMALL = 0;
pub const PM_LOGO_SIZE_MEDIUM = 1;
pub const PM_LOGO_SIZE_LARGE = 2;
pub const PM_LOGO_SIZE_INVALID = 3;
pub const ACTCTX_RUN_LEVEL_UNSPECIFIED = 0;
pub const ACTCTX_RUN_LEVEL_AS_INVOKER = 1;
pub const ACTCTX_RUN_LEVEL_HIGHEST_AVAILABLE = 2;
pub const ACTCTX_RUN_LEVEL_REQUIRE_ADMIN = 3;
pub const ACTCTX_RUN_LEVEL_NUMBERS = 4;
pub const ACTCTX_COMPATIBILITY_ELEMENT_TYPE_UNKNOWN = 0;
pub const ACTCTX_COMPATIBILITY_ELEMENT_TYPE_OS = 1;
pub const ACTCTX_COMPATIBILITY_ELEMENT_TYPE_MITIGATION = 2;
pub const ACTCTX_COMPATIBILITY_ELEMENT_TYPE_MAXVERSIONTESTED = 3;

pub const aliases = struct {
    pub const MSIASSEMBLYINFO = u32;
    pub const IASSEMBLYCACHE_UNINSTALL_DISPOSITION = u32;
    pub const QUERYASMINFO_FLAGS = u32;
    pub const RESULTTYPES = i32;
    pub const STATUSTYPES = i32;
    pub const msmErrorType = i32;
    pub const INSTALLMESSAGE = i32;
    pub const INSTALLUILEVEL = i32;
    pub const INSTALLSTATE = i32;
    pub const USERINFOSTATE = i32;
    pub const INSTALLLEVEL = i32;
    pub const REINSTALLMODE = i32;
    pub const INSTALLLOGMODE = i32;
    pub const INSTALLLOGATTRIBUTES = i32;
    pub const INSTALLFEATUREATTRIBUTE = i32;
    pub const INSTALLMODE = i32;
    pub const MSIPATCHSTATE = i32;
    pub const MSIINSTALLCONTEXT = i32;
    pub const MSIPATCHDATATYPE = i32;
    pub const SCRIPTFLAGS = i32;
    pub const ADVERTISEFLAGS = i32;
    pub const INSTALLTYPE = i32;
    pub const MSIARCHITECTUREFLAGS = i32;
    pub const MSIOPENPACKAGEFLAGS = i32;
    pub const MSIADVERTISEOPTIONFLAGS = i32;
    pub const MSISOURCETYPE = i32;
    pub const MSICODE = i32;
    pub const MSITRANSACTION = i32;
    pub const MSITRANSACTIONSTATE = u32;
    pub const MSIDBSTATE = i32;
    pub const MSIMODIFY = i32;
    pub const MSICOLINFO = i32;
    pub const MSICONDITION = i32;
    pub const MSICOSTTREE = i32;
    pub const MSIDBERROR = i32;
    pub const MSIRUNMODE = i32;
    pub const MSITRANSFORM_ERROR = i32;
    pub const MSITRANSFORM_VALIDATE = i32;
    pub const ASM_NAME = i32;
    pub const ASM_BIND_FLAGS = i32;
    pub const ASM_DISPLAY_FLAGS = i32;
    pub const ASM_CMP_FLAGS = i32;
    pub const CREATE_ASM_NAME_OBJ_FLAGS = i32;
    pub const msidbControlAttributes = i32;
    pub const msidbLocatorType = i32;
    pub const msidbComponentAttributes = i32;
    pub const msidbAssemblyAttributes = i32;
    pub const msidbCustomActionType = i32;
    pub const msidbDialogAttributes = i32;
    pub const msidbFeatureAttributes = i32;
    pub const msidbFileAttributes = i32;
    pub const msidbIniFileAction = i32;
    pub const msidbMoveFileOptions = i32;
    pub const msidbODBCDataSourceRegistration = i32;
    pub const msidbClassAttributes = i32;
    pub const msidbPatchAttributes = i32;
    pub const msidbRegistryRoot = i32;
    pub const msidbRemoveFileInstallMode = i32;
    pub const msidbServiceControlEvent = i32;
    pub const msidbServiceConfigEvent = i32;
    pub const msidbServiceInstallErrorControl = i32;
    pub const msidbTextStyleStyleBits = i32;
    pub const msidbUpgradeAttributes = i32;
    pub const msidbEmbeddedUIAttributes = i32;
    pub const msidbSumInfoSourceType = i32;
    pub const msirbRebootType = i32;
    pub const msirbRebootReason = i32;
    pub const msifiFastInstallBits = i32;
    pub const TILE_TEMPLATE_TYPE = i32;
    pub const PM_APP_GENRE = i32;
    pub const PM_APPLICATION_INSTALL_TYPE = i32;
    pub const PM_APPLICATION_STATE = i32;
    pub const PM_APPLICATION_HUBTYPE = i32;
    pub const PM_TILE_HUBTYPE = i32;
    pub const PM_STARTTILE_TYPE = i32;
    pub const PM_TASK_TYPE = i32;
    pub const PACKMAN_RUNTIME = i32;
    pub const PM_ACTIVATION_POLICY = i32;
    pub const PM_TASK_TRANSITION = i32;
    pub const PM_ENUM_APP_FILTER = i32;
    pub const PM_ENUM_TILE_FILTER = i32;
    pub const PM_ENUM_TASK_FILTER = i32;
    pub const PM_ENUM_EXTENSION_FILTER = i32;
    pub const PM_ENUM_BSA_FILTER = i32;
    pub const PM_ENUM_BW_FILTER = i32;
    pub const PM_LIVETILE_RECURRENCE_TYPE = i32;
    pub const PM_TILE_SIZE = i32;
    pub const PM_LOGO_SIZE = i32;
    pub const ACTCTX_REQUESTED_RUN_LEVEL = i32;
    pub const ACTCTX_COMPATIBILITY_ELEMENT_TYPE = i32;
    pub const MSIHANDLE = u32;
    pub const LPDISPLAYVAL = ?*const anyopaque;
    pub const LPEVALCOMCALLBACK = ?*const anyopaque;
    pub const INSTALLUI_HANDLERA = ?*const anyopaque;
    pub const INSTALLUI_HANDLERW = ?*const anyopaque;
    pub const PINSTALLUI_HANDLER_RECORD = ?*const anyopaque;
    pub const PPATCH_PROGRESS_CALLBACK = ?*const anyopaque;
    pub const PPATCH_SYMLOAD_CALLBACK = ?*const anyopaque;
};
