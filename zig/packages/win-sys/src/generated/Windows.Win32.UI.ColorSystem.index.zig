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
    .{ "SetICMMode", MethodRecord{ .library = "GDI32", .import = "SetICMMode", .signature = "\x00\x02\x08\x11\x83\x5d\x11\xa4\xd9" } },
    .{ "CheckColorsInGamut", MethodRecord{ .library = "GDI32", .import = "CheckColorsInGamut", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x0f\x11\xc0\x00\x46\xa1\x0f\x01\x09" } },
    .{ "GetColorSpace", MethodRecord{ .library = "GDI32", .import = "GetColorSpace", .signature = "\x00\x01\x11\xc0\x00\x46\xa5\x11\x83\x5d" } },
    .{ "GetLogColorSpaceA", MethodRecord{ .library = "GDI32", .import = "GetLogColorSpaceA", .signature = "\x00\x03\x11\x59\x11\xc0\x00\x46\xa5\x0f\x11\xc0\x00\x46\xa9\x09" } },
    .{ "GetLogColorSpaceW", MethodRecord{ .library = "GDI32", .import = "GetLogColorSpaceW", .signature = "\x00\x03\x11\x59\x11\xc0\x00\x46\xa5\x0f\x11\xc0\x00\x46\xad\x09" } },
    .{ "CreateColorSpaceA", MethodRecord{ .library = "GDI32", .import = "CreateColorSpaceA", .signature = "\x00\x01\x11\xc0\x00\x46\xa5\x0f\x11\xc0\x00\x46\xa9" } },
    .{ "CreateColorSpaceW", MethodRecord{ .library = "GDI32", .import = "CreateColorSpaceW", .signature = "\x00\x01\x11\xc0\x00\x46\xa5\x0f\x11\xc0\x00\x46\xad" } },
    .{ "SetColorSpace", MethodRecord{ .library = "GDI32", .import = "SetColorSpace", .signature = "\x00\x02\x11\xc0\x00\x46\xa5\x11\x83\x5d\x11\xc0\x00\x46\xa5" } },
    .{ "DeleteColorSpace", MethodRecord{ .library = "GDI32", .import = "DeleteColorSpace", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x46\xa5" } },
    .{ "GetICMProfileA", MethodRecord{ .library = "GDI32", .import = "GetICMProfileA", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x0f\x09\x11\x3d" } },
    .{ "GetICMProfileW", MethodRecord{ .library = "GDI32", .import = "GetICMProfileW", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x0f\x09\x11\x05" } },
    .{ "SetICMProfileA", MethodRecord{ .library = "GDI32", .import = "SetICMProfileA", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x11\x3d" } },
    .{ "SetICMProfileW", MethodRecord{ .library = "GDI32", .import = "SetICMProfileW", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x11\x05" } },
    .{ "GetDeviceGammaRamp", MethodRecord{ .library = "GDI32", .import = "GetDeviceGammaRamp", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x01" } },
    .{ "SetDeviceGammaRamp", MethodRecord{ .library = "GDI32", .import = "SetDeviceGammaRamp", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x01" } },
    .{ "ColorMatchToTarget", MethodRecord{ .library = "GDI32", .import = "ColorMatchToTarget", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x11\x83\x5d\x11\xa4\xdd" } },
    .{ "EnumICMProfilesA", MethodRecord{ .library = "GDI32", .import = "EnumICMProfilesA", .signature = "\x00\x03\x08\x11\x83\x5d\x12\xc0\x00\x46\xb1\x11\x82\x2d" } },
    .{ "EnumICMProfilesW", MethodRecord{ .library = "GDI32", .import = "EnumICMProfilesW", .signature = "\x00\x03\x08\x11\x83\x5d\x12\xc0\x00\x46\xb5\x11\x82\x2d" } },
    .{ "UpdateICMRegKeyA", MethodRecord{ .library = "GDI32", .import = "UpdateICMRegKeyA", .signature = "\x00\x04\x11\x59\x09\x11\x3d\x11\x3d\x11\xa4\xd5" } },
    .{ "UpdateICMRegKeyW", MethodRecord{ .library = "GDI32", .import = "UpdateICMRegKeyW", .signature = "\x00\x04\x11\x59\x09\x11\x05\x11\x05\x11\xa4\xd5" } },
    .{ "ColorCorrectPalette", MethodRecord{ .library = "GDI32", .import = "ColorCorrectPalette", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x11\x8d\x65\x09\x09" } },
    .{ "OpenColorProfileA", MethodRecord{ .library = "mscms", .import = "OpenColorProfileA", .signature = "\x00\x04\x18\x0f\x11\xc0\x00\x46\xb9\x09\x09\x09" } },
    .{ "OpenColorProfileW", MethodRecord{ .library = "mscms", .import = "OpenColorProfileW", .signature = "\x00\x04\x18\x0f\x11\xc0\x00\x46\xb9\x09\x09\x09" } },
    .{ "CloseColorProfile", MethodRecord{ .library = "mscms", .import = "CloseColorProfile", .signature = "\x00\x01\x11\x59\x18" } },
    .{ "GetColorProfileFromHandle", MethodRecord{ .library = "mscms", .import = "GetColorProfileFromHandle", .signature = "\x00\x03\x11\x59\x18\x0f\x05\x0f\x09" } },
    .{ "IsColorProfileValid", MethodRecord{ .library = "mscms", .import = "IsColorProfileValid", .signature = "\x00\x02\x11\x59\x18\x0f\x11\x59" } },
    .{ "CreateProfileFromLogColorSpaceA", MethodRecord{ .library = "mscms", .import = "CreateProfileFromLogColorSpaceA", .signature = "\x00\x02\x11\x59\x0f\x11\xc0\x00\x46\xa9\x0f\x0f\x05" } },
    .{ "CreateProfileFromLogColorSpaceW", MethodRecord{ .library = "mscms", .import = "CreateProfileFromLogColorSpaceW", .signature = "\x00\x02\x11\x59\x0f\x11\xc0\x00\x46\xad\x0f\x0f\x05" } },
    .{ "GetCountColorProfileElements", MethodRecord{ .library = "mscms", .import = "GetCountColorProfileElements", .signature = "\x00\x02\x11\x59\x18\x0f\x09" } },
    .{ "GetColorProfileHeader", MethodRecord{ .library = "mscms", .import = "GetColorProfileHeader", .signature = "\x00\x02\x11\x59\x18\x0f\x11\xc0\x00\x46\xbd" } },
    .{ "GetColorProfileElementTag", MethodRecord{ .library = "mscms", .import = "GetColorProfileElementTag", .signature = "\x00\x03\x11\x59\x18\x09\x0f\x09" } },
    .{ "IsColorProfileTagPresent", MethodRecord{ .library = "mscms", .import = "IsColorProfileTagPresent", .signature = "\x00\x03\x11\x59\x18\x09\x0f\x11\x59" } },
    .{ "GetColorProfileElement", MethodRecord{ .library = "mscms", .import = "GetColorProfileElement", .signature = "\x00\x06\x11\x59\x18\x09\x09\x0f\x09\x0f\x01\x0f\x11\x59" } },
    .{ "SetColorProfileHeader", MethodRecord{ .library = "mscms", .import = "SetColorProfileHeader", .signature = "\x00\x02\x11\x59\x18\x0f\x11\xc0\x00\x46\xbd" } },
    .{ "SetColorProfileElementSize", MethodRecord{ .library = "mscms", .import = "SetColorProfileElementSize", .signature = "\x00\x03\x11\x59\x18\x09\x09" } },
    .{ "SetColorProfileElement", MethodRecord{ .library = "mscms", .import = "SetColorProfileElement", .signature = "\x00\x05\x11\x59\x18\x09\x09\x0f\x09\x0f\x01" } },
    .{ "SetColorProfileElementReference", MethodRecord{ .library = "mscms", .import = "SetColorProfileElementReference", .signature = "\x00\x03\x11\x59\x18\x09\x09" } },
    .{ "GetPS2ColorSpaceArray", MethodRecord{ .library = "mscms", .import = "GetPS2ColorSpaceArray", .signature = "\x00\x06\x11\x59\x18\x09\x09\x0f\x05\x0f\x09\x0f\x11\x59" } },
    .{ "GetPS2ColorRenderingIntent", MethodRecord{ .library = "mscms", .import = "GetPS2ColorRenderingIntent", .signature = "\x00\x04\x11\x59\x18\x09\x0f\x05\x0f\x09" } },
    .{ "GetPS2ColorRenderingDictionary", MethodRecord{ .library = "mscms", .import = "GetPS2ColorRenderingDictionary", .signature = "\x00\x05\x11\x59\x18\x09\x0f\x05\x0f\x09\x0f\x11\x59" } },
    .{ "GetNamedProfileInfo", MethodRecord{ .library = "mscms", .import = "GetNamedProfileInfo", .signature = "\x00\x02\x11\x59\x18\x0f\x11\xc0\x00\x46\xc1" } },
    .{ "ConvertColorNameToIndex", MethodRecord{ .library = "mscms", .import = "ConvertColorNameToIndex", .signature = "\x00\x04\x11\x59\x18\x0f\x0f\x04\x0f\x09\x09" } },
    .{ "ConvertIndexToColorName", MethodRecord{ .library = "mscms", .import = "ConvertIndexToColorName", .signature = "\x00\x04\x11\x59\x18\x0f\x09\x0f\x0f\x04\x09" } },
    .{ "CreateDeviceLinkProfile", MethodRecord{ .library = "mscms", .import = "CreateDeviceLinkProfile", .signature = "\x00\x07\x11\x59\x0f\x18\x09\x0f\x09\x09\x09\x0f\x0f\x05\x09" } },
    .{ "CreateColorTransformA", MethodRecord{ .library = "mscms", .import = "CreateColorTransformA", .signature = "\x00\x04\x18\x0f\x11\xc0\x00\x46\xa9\x18\x18\x09" } },
    .{ "CreateColorTransformW", MethodRecord{ .library = "mscms", .import = "CreateColorTransformW", .signature = "\x00\x04\x18\x0f\x11\xc0\x00\x46\xad\x18\x18\x09" } },
    .{ "CreateMultiProfileTransform", MethodRecord{ .library = "mscms", .import = "CreateMultiProfileTransform", .signature = "\x00\x06\x18\x0f\x18\x09\x0f\x09\x09\x09\x09" } },
    .{ "DeleteColorTransform", MethodRecord{ .library = "mscms", .import = "DeleteColorTransform", .signature = "\x00\x01\x11\x59\x18" } },
    .{ "TranslateBitmapBits", MethodRecord{ .library = "mscms", .import = "TranslateBitmapBits", .signature = "\x00\x0b\x11\x59\x18\x0f\x01\x11\xc0\x00\x46\xc5\x09\x09\x09\x0f\x01\x11\xc0\x00\x46\xc5\x09\x12\xc0\x00\x46\xc9\x11\x82\x2d" } },
    .{ "CheckBitmapBits", MethodRecord{ .library = "mscms", .import = "CheckBitmapBits", .signature = "\x00\x09\x11\x59\x18\x0f\x01\x11\xc0\x00\x46\xc5\x09\x09\x09\x0f\x05\x12\xc0\x00\x46\xc9\x11\x82\x2d" } },
    .{ "TranslateColors", MethodRecord{ .library = "mscms", .import = "TranslateColors", .signature = "\x00\x06\x11\x59\x18\x0f\x11\xc0\x00\x46\xcd\x09\x11\xc0\x00\x46\xd1\x0f\x11\xc0\x00\x46\xcd\x11\xc0\x00\x46\xd1" } },
    .{ "CheckColors", MethodRecord{ .library = "mscms", .import = "CheckColors", .signature = "\x00\x05\x11\x59\x18\x0f\x11\xc0\x00\x46\xcd\x09\x11\xc0\x00\x46\xd1\x0f\x05" } },
    .{ "GetCMMInfo", MethodRecord{ .library = "mscms", .import = "GetCMMInfo", .signature = "\x00\x02\x09\x18\x09" } },
    .{ "RegisterCMMA", MethodRecord{ .library = "mscms", .import = "RegisterCMMA", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x11\x3d" } },
    .{ "RegisterCMMW", MethodRecord{ .library = "mscms", .import = "RegisterCMMW", .signature = "\x00\x03\x11\x59\x11\x05\x09\x11\x05" } },
    .{ "UnregisterCMMA", MethodRecord{ .library = "mscms", .import = "UnregisterCMMA", .signature = "\x00\x02\x11\x59\x11\x3d\x09" } },
    .{ "UnregisterCMMW", MethodRecord{ .library = "mscms", .import = "UnregisterCMMW", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "SelectCMM", MethodRecord{ .library = "mscms", .import = "SelectCMM", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "GetColorDirectoryA", MethodRecord{ .library = "mscms", .import = "GetColorDirectoryA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "GetColorDirectoryW", MethodRecord{ .library = "mscms", .import = "GetColorDirectoryW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x0f\x09" } },
    .{ "InstallColorProfileA", MethodRecord{ .library = "mscms", .import = "InstallColorProfileA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "InstallColorProfileW", MethodRecord{ .library = "mscms", .import = "InstallColorProfileW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "UninstallColorProfileA", MethodRecord{ .library = "mscms", .import = "UninstallColorProfileA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x59" } },
    .{ "UninstallColorProfileW", MethodRecord{ .library = "mscms", .import = "UninstallColorProfileW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x59" } },
    .{ "EnumColorProfilesA", MethodRecord{ .library = "mscms", .import = "EnumColorProfilesA", .signature = "\x00\x05\x11\x59\x11\x3d\x0f\x11\xc0\x00\x46\xd5\x0f\x05\x0f\x09\x0f\x09" } },
    .{ "EnumColorProfilesW", MethodRecord{ .library = "mscms", .import = "EnumColorProfilesW", .signature = "\x00\x05\x11\x59\x11\x05\x0f\x11\xc0\x00\x46\xd9\x0f\x05\x0f\x09\x0f\x09" } },
    .{ "SetStandardColorSpaceProfileA", MethodRecord{ .library = "mscms", .import = "SetStandardColorSpaceProfileA", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x11\x3d" } },
    .{ "SetStandardColorSpaceProfileW", MethodRecord{ .library = "mscms", .import = "SetStandardColorSpaceProfileW", .signature = "\x00\x03\x11\x59\x11\x05\x09\x11\x05" } },
    .{ "GetStandardColorSpaceProfileA", MethodRecord{ .library = "mscms", .import = "GetStandardColorSpaceProfileA", .signature = "\x00\x04\x11\x59\x11\x3d\x09\x11\x3d\x0f\x09" } },
    .{ "GetStandardColorSpaceProfileW", MethodRecord{ .library = "mscms", .import = "GetStandardColorSpaceProfileW", .signature = "\x00\x04\x11\x59\x11\x05\x09\x11\x05\x0f\x09" } },
    .{ "AssociateColorProfileWithDeviceA", MethodRecord{ .library = "mscms", .import = "AssociateColorProfileWithDeviceA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "AssociateColorProfileWithDeviceW", MethodRecord{ .library = "mscms", .import = "AssociateColorProfileWithDeviceW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x05" } },
    .{ "DisassociateColorProfileFromDeviceA", MethodRecord{ .library = "mscms", .import = "DisassociateColorProfileFromDeviceA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "DisassociateColorProfileFromDeviceW", MethodRecord{ .library = "mscms", .import = "DisassociateColorProfileFromDeviceW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x05" } },
    .{ "SetupColorMatchingW", MethodRecord{ .library = "ICMUI", .import = "SetupColorMatchingW", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x46\xdd" } },
    .{ "SetupColorMatchingA", MethodRecord{ .library = "ICMUI", .import = "SetupColorMatchingA", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x46\xe1" } },
    .{ "WcsAssociateColorProfileWithDevice", MethodRecord{ .library = "mscms", .import = "WcsAssociateColorProfileWithDevice", .signature = "\x00\x03\x11\x59\x11\xc0\x00\x46\xe5\x11\x05\x11\x05" } },
    .{ "WcsDisassociateColorProfileFromDevice", MethodRecord{ .library = "mscms", .import = "WcsDisassociateColorProfileFromDevice", .signature = "\x00\x03\x11\x59\x11\xc0\x00\x46\xe5\x11\x05\x11\x05" } },
    .{ "WcsEnumColorProfilesSize", MethodRecord{ .library = "mscms", .import = "WcsEnumColorProfilesSize", .signature = "\x00\x03\x11\x59\x11\xc0\x00\x46\xe5\x0f\x11\xc0\x00\x46\xd9\x0f\x09" } },
    .{ "WcsEnumColorProfiles", MethodRecord{ .library = "mscms", .import = "WcsEnumColorProfiles", .signature = "\x00\x05\x11\x59\x11\xc0\x00\x46\xe5\x0f\x11\xc0\x00\x46\xd9\x0f\x05\x09\x0f\x09" } },
    .{ "WcsGetDefaultColorProfileSize", MethodRecord{ .library = "mscms", .import = "WcsGetDefaultColorProfileSize", .signature = "\x00\x06\x11\x59\x11\xc0\x00\x46\xe5\x11\x05\x11\xc0\x00\x46\xe9\x11\xc0\x00\x46\xed\x09\x0f\x09" } },
    .{ "WcsGetDefaultColorProfile", MethodRecord{ .library = "mscms", .import = "WcsGetDefaultColorProfile", .signature = "\x00\x07\x11\x59\x11\xc0\x00\x46\xe5\x11\x05\x11\xc0\x00\x46\xe9\x11\xc0\x00\x46\xed\x09\x09\x11\x05" } },
    .{ "WcsSetDefaultColorProfile", MethodRecord{ .library = "mscms", .import = "WcsSetDefaultColorProfile", .signature = "\x00\x06\x11\x59\x11\xc0\x00\x46\xe5\x11\x05\x11\xc0\x00\x46\xe9\x11\xc0\x00\x46\xed\x09\x11\x05" } },
    .{ "WcsSetDefaultRenderingIntent", MethodRecord{ .library = "mscms", .import = "WcsSetDefaultRenderingIntent", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x46\xe5\x09" } },
    .{ "WcsGetDefaultRenderingIntent", MethodRecord{ .library = "mscms", .import = "WcsGetDefaultRenderingIntent", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x46\xe5\x0f\x09" } },
    .{ "WcsGetUsePerUserProfiles", MethodRecord{ .library = "mscms", .import = "WcsGetUsePerUserProfiles", .signature = "\x00\x03\x11\x59\x11\x05\x09\x0f\x11\x59" } },
    .{ "WcsSetUsePerUserProfiles", MethodRecord{ .library = "mscms", .import = "WcsSetUsePerUserProfiles", .signature = "\x00\x03\x11\x59\x11\x05\x09\x11\x59" } },
    .{ "WcsTranslateColors", MethodRecord{ .library = "mscms", .import = "WcsTranslateColors", .signature = "\x00\x0a\x11\x59\x18\x09\x09\x11\xc0\x00\x46\xf1\x09\x0f\x01\x09\x11\xc0\x00\x46\xf1\x09\x0f\x01" } },
    .{ "WcsCheckColors", MethodRecord{ .library = "mscms", .import = "WcsCheckColors", .signature = "\x00\x07\x11\x59\x18\x09\x09\x11\xc0\x00\x46\xf1\x09\x0f\x01\x0f\x05" } },
    .{ "CMCheckColors", MethodRecord{ .library = "ICM32", .import = "CMCheckColors", .signature = "\x00\x05\x11\x59\x18\x0f\x11\xc0\x00\x46\xcd\x09\x11\xc0\x00\x46\xd1\x0f\x05" } },
    .{ "CMCheckRGBs", MethodRecord{ .library = "ICM32", .import = "CMCheckRGBs", .signature = "\x00\x09\x11\x59\x18\x0f\x01\x11\xc0\x00\x46\xc5\x09\x09\x09\x0f\x05\x12\xc0\x00\x46\xc9\x11\x82\x2d" } },
    .{ "CMConvertColorNameToIndex", MethodRecord{ .library = "ICM32", .import = "CMConvertColorNameToIndex", .signature = "\x00\x04\x11\x59\x18\x0f\x0f\x04\x0f\x09\x09" } },
    .{ "CMConvertIndexToColorName", MethodRecord{ .library = "ICM32", .import = "CMConvertIndexToColorName", .signature = "\x00\x04\x11\x59\x18\x0f\x09\x0f\x0f\x04\x09" } },
    .{ "CMCreateDeviceLinkProfile", MethodRecord{ .library = "ICM32", .import = "CMCreateDeviceLinkProfile", .signature = "\x00\x06\x11\x59\x0f\x18\x09\x0f\x09\x09\x09\x0f\x0f\x05" } },
    .{ "CMCreateMultiProfileTransform", MethodRecord{ .library = "ICM32", .import = "CMCreateMultiProfileTransform", .signature = "\x00\x05\x18\x0f\x18\x09\x0f\x09\x09\x09" } },
    .{ "CMCreateProfileW", MethodRecord{ .library = "ICM32", .import = "CMCreateProfileW", .signature = "\x00\x02\x11\x59\x0f\x11\xc0\x00\x46\xad\x0f\x0f\x01" } },
    .{ "CMCreateTransform", MethodRecord{ .library = "ICM32", .import = "CMCreateTransform", .signature = "\x00\x03\x18\x0f\x11\xc0\x00\x46\xa9\x0f\x01\x0f\x01" } },
    .{ "CMCreateTransformW", MethodRecord{ .library = "ICM32", .import = "CMCreateTransformW", .signature = "\x00\x03\x18\x0f\x11\xc0\x00\x46\xad\x0f\x01\x0f\x01" } },
    .{ "CMCreateTransformExt", MethodRecord{ .library = "ICM32", .import = "CMCreateTransformExt", .signature = "\x00\x04\x18\x0f\x11\xc0\x00\x46\xa9\x0f\x01\x0f\x01\x09" } },
    .{ "CMCheckColorsInGamut", MethodRecord{ .library = "ICM32", .import = "CMCheckColorsInGamut", .signature = "\x00\x04\x11\x59\x18\x0f\x11\xc0\x00\x46\xa1\x0f\x05\x09" } },
    .{ "CMCreateProfile", MethodRecord{ .library = "ICM32", .import = "CMCreateProfile", .signature = "\x00\x02\x11\x59\x0f\x11\xc0\x00\x46\xa9\x0f\x0f\x01" } },
    .{ "CMTranslateRGB", MethodRecord{ .library = "ICM32", .import = "CMTranslateRGB", .signature = "\x00\x04\x11\x59\x18\x11\x83\x59\x0f\x09\x09" } },
    .{ "CMTranslateRGBs", MethodRecord{ .library = "ICM32", .import = "CMTranslateRGBs", .signature = "\x00\x09\x11\x59\x18\x0f\x01\x11\xc0\x00\x46\xc5\x09\x09\x09\x0f\x01\x11\xc0\x00\x46\xc5\x09" } },
    .{ "CMCreateTransformExtW", MethodRecord{ .library = "ICM32", .import = "CMCreateTransformExtW", .signature = "\x00\x04\x18\x0f\x11\xc0\x00\x46\xad\x0f\x01\x0f\x01\x09" } },
    .{ "CMDeleteTransform", MethodRecord{ .library = "ICM32", .import = "CMDeleteTransform", .signature = "\x00\x01\x11\x59\x18" } },
    .{ "CMGetInfo", MethodRecord{ .library = "ICM32", .import = "CMGetInfo", .signature = "\x00\x01\x09\x09" } },
    .{ "CMGetNamedProfileInfo", MethodRecord{ .library = "ICM32", .import = "CMGetNamedProfileInfo", .signature = "\x00\x02\x11\x59\x18\x0f\x11\xc0\x00\x46\xc1" } },
    .{ "CMIsProfileValid", MethodRecord{ .library = "ICM32", .import = "CMIsProfileValid", .signature = "\x00\x02\x11\x59\x18\x0f\x11\x59" } },
    .{ "CMTranslateColors", MethodRecord{ .library = "ICM32", .import = "CMTranslateColors", .signature = "\x00\x06\x11\x59\x18\x0f\x11\xc0\x00\x46\xcd\x09\x11\xc0\x00\x46\xd1\x0f\x11\xc0\x00\x46\xcd\x11\xc0\x00\x46\xd1" } },
    .{ "CMTranslateRGBsExt", MethodRecord{ .library = "ICM32", .import = "CMTranslateRGBsExt", .signature = "\x00\x0b\x11\x59\x18\x0f\x01\x11\xc0\x00\x46\xc5\x09\x09\x09\x0f\x01\x11\xc0\x00\x46\xc5\x09\x12\xc0\x00\x46\xc9\x11\x82\x2d" } },
    .{ "WcsOpenColorProfileA", MethodRecord{ .library = "mscms", .import = "WcsOpenColorProfileA", .signature = "\x00\x07\x18\x0f\x11\xc0\x00\x46\xb9\x0f\x11\xc0\x00\x46\xb9\x0f\x11\xc0\x00\x46\xb9\x09\x09\x09\x09" } },
    .{ "WcsOpenColorProfileW", MethodRecord{ .library = "mscms", .import = "WcsOpenColorProfileW", .signature = "\x00\x07\x18\x0f\x11\xc0\x00\x46\xb9\x0f\x11\xc0\x00\x46\xb9\x0f\x11\xc0\x00\x46\xb9\x09\x09\x09\x09" } },
    .{ "WcsCreateIccProfile", MethodRecord{ .library = "mscms", .import = "WcsCreateIccProfile", .signature = "\x00\x02\x18\x18\x09" } },
    .{ "WcsGetCalibrationManagementState", MethodRecord{ .library = "mscms", .import = "WcsGetCalibrationManagementState", .signature = "\x00\x01\x11\x59\x0f\x11\x59" } },
    .{ "WcsSetCalibrationManagementState", MethodRecord{ .library = "mscms", .import = "WcsSetCalibrationManagementState", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "ColorProfileAddDisplayAssociation", MethodRecord{ .library = "mscms", .import = "ColorProfileAddDisplayAssociation", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x46\xe5\x11\x05\x11\x93\x69\x09\x11\x59\x11\x59" } },
    .{ "ColorProfileRemoveDisplayAssociation", MethodRecord{ .library = "mscms", .import = "ColorProfileRemoveDisplayAssociation", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x46\xe5\x11\x05\x11\x93\x69\x09\x11\x59" } },
    .{ "ColorProfileSetDisplayDefaultAssociation", MethodRecord{ .library = "mscms", .import = "ColorProfileSetDisplayDefaultAssociation", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x46\xe5\x11\x05\x11\xc0\x00\x46\xe9\x11\xc0\x00\x46\xed\x11\x93\x69\x09" } },
    .{ "ColorProfileGetDisplayList", MethodRecord{ .library = "mscms", .import = "ColorProfileGetDisplayList", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x46\xe5\x11\x93\x69\x09\x0f\x0f\x11\x05\x0f\x09" } },
    .{ "ColorProfileGetDisplayDefault", MethodRecord{ .library = "mscms", .import = "ColorProfileGetDisplayDefault", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x46\xe5\x11\x93\x69\x09\x11\xc0\x00\x46\xe9\x11\xc0\x00\x46\xed\x0f\x11\x05" } },
    .{ "ColorProfileGetDisplayUserScope", MethodRecord{ .library = "mscms", .import = "ColorProfileGetDisplayUserScope", .signature = "\x00\x03\x11\x79\x11\x93\x69\x09\x0f\x11\xc0\x00\x46\xe5" } },
    .{ "ColorProfileGetDeviceCapabilities", MethodRecord{ .library = "mscms", .import = "ColorProfileGetDeviceCapabilities", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x46\xe5\x11\x93\x69\x09\x11\xc0\x00\x46\xf5\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x359 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "COLORREF" },
        0x35d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HDC" },
        0xd65 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HPALETTE" },
        0x1369 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LUID" },
        0x24d5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "ICM_COMMAND" },
        0x24d9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "ICM_MODE" },
        0x24dd => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "COLOR_MATCH_TO_TARGET_ACTION" },
        0x46a1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "RGBTRIPLE" },
        0x46a5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "HCOLORSPACE" },
        0x46a9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "LOGCOLORSPACEA" },
        0x46ad => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "LOGCOLORSPACEW" },
        0x46b1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "ICMENUMPROCA" },
        0x46b5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "ICMENUMPROCW" },
        0x46b9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "PROFILE" },
        0x46bd => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "PROFILEHEADER" },
        0x46c1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "NAMED_PROFILE_INFO" },
        0x46c5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "BMFORMAT" },
        0x46c9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "LPBMCALLBACKFN" },
        0x46cd => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "COLOR" },
        0x46d1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "COLORTYPE" },
        0x46d5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "ENUMTYPEA" },
        0x46d9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "ENUMTYPEW" },
        0x46dd => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "COLORMATCHSETUPW" },
        0x46e1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "COLORMATCHSETUPA" },
        0x46e5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "WCS_PROFILE_MANAGEMENT_SCOPE" },
        0x46e9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "COLORPROFILETYPE" },
        0x46ed => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "COLORPROFILESUBTYPE" },
        0x46f1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "COLORDATATYPE" },
        0x46f5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.ColorSystem", .name = "WCS_DEVICE_CAPABILITIES_TYPE" },
        else => null,
    };
}

pub const ICM_ADDPROFILE = 1;
pub const ICM_DELETEPROFILE = 2;
pub const ICM_QUERYPROFILE = 3;
pub const ICM_SETDEFAULTPROFILE = 4;
pub const ICM_REGISTERICMATCHER = 5;
pub const ICM_UNREGISTERICMATCHER = 6;
pub const ICM_QUERYMATCH = 7;
pub const ICM_OFF = 1;
pub const ICM_ON = 2;
pub const ICM_QUERY = 3;
pub const ICM_DONE_OUTSIDEDC = 4;
pub const CS_ENABLE = 1;
pub const CS_DISABLE = 2;
pub const CS_DELETE_TRANSFORM = 3;
pub const LCS_CALIBRATED_RGB = 0;
pub const LCS_sRGB = 1934772034;
pub const LCS_WINDOWS_COLOR_SPACE = 1466527264;
pub const MAX_COLOR_CHANNELS = 8;
pub const INTENT_PERCEPTUAL = 0;
pub const INTENT_RELATIVE_COLORIMETRIC = 1;
pub const INTENT_SATURATION = 2;
pub const INTENT_ABSOLUTE_COLORIMETRIC = 3;
pub const FLAG_EMBEDDEDPROFILE = 1;
pub const FLAG_DEPENDENTONDATA = 2;
pub const FLAG_ENABLE_CHROMATIC_ADAPTATION = 33554432;
pub const ATTRIB_TRANSPARENCY = 1;
pub const ATTRIB_MATTE = 2;
pub const PROFILE_FILENAME = 1;
pub const PROFILE_MEMBUFFER = 2;
pub const PROFILE_READ = 1;
pub const PROFILE_READWRITE = 2;
pub const INDEX_DONT_CARE = 0;
pub const CMM_FROM_PROFILE = 0;
pub const ENUM_TYPE_VERSION = 768;
pub const ET_DEVICENAME = 1;
pub const ET_MEDIATYPE = 2;
pub const ET_DITHERMODE = 4;
pub const ET_RESOLUTION = 8;
pub const ET_CMMTYPE = 16;
pub const ET_CLASS = 32;
pub const ET_DATACOLORSPACE = 64;
pub const ET_CONNECTIONSPACE = 128;
pub const ET_SIGNATURE = 256;
pub const ET_PLATFORM = 512;
pub const ET_PROFILEFLAGS = 1024;
pub const ET_MANUFACTURER = 2048;
pub const ET_MODEL = 4096;
pub const ET_ATTRIBUTES = 8192;
pub const ET_RENDERINGINTENT = 16384;
pub const ET_CREATOR = 32768;
pub const ET_DEVICECLASS = 65536;
pub const ET_STANDARDDISPLAYCOLOR = 131072;
pub const ET_EXTENDEDDISPLAYCOLOR = 262144;
pub const PROOF_MODE = 1;
pub const NORMAL_MODE = 2;
pub const BEST_MODE = 3;
pub const ENABLE_GAMUT_CHECKING = 65536;
pub const USE_RELATIVE_COLORIMETRIC = 131072;
pub const FAST_TRANSLATE = 262144;
pub const PRESERVEBLACK = 1048576;
pub const WCS_ALWAYS = 2097152;
pub const SEQUENTIAL_TRANSFORM = 2155872256;
pub const RESERVED = 2147483648;
pub const CSA_A = 1;
pub const CSA_ABC = 2;
pub const CSA_DEF = 3;
pub const CSA_DEFG = 4;
pub const CSA_GRAY = 5;
pub const CSA_RGB = 6;
pub const CSA_CMYK = 7;
pub const CSA_Lab = 8;
pub const CMM_WIN_VERSION = 0;
pub const CMM_IDENT = 1;
pub const CMM_DRIVER_VERSION = 2;
pub const CMM_DLL_VERSION = 3;
pub const CMM_VERSION = 4;
pub const CMM_DESCRIPTION = 5;
pub const CMM_LOGOICON = 6;
pub const CMS_FORWARD = 0;
pub const CMS_BACKWARD = 1;
pub const COLOR_MATCH_VERSION = 512;
pub const CMS_DISABLEICM = 1;
pub const CMS_ENABLEPROOFING = 2;
pub const CMS_SETRENDERINTENT = 4;
pub const CMS_SETPROOFINTENT = 8;
pub const CMS_SETMONITORPROFILE = 16;
pub const CMS_SETPRINTERPROFILE = 32;
pub const CMS_SETTARGETPROFILE = 64;
pub const CMS_USEHOOK = 128;
pub const CMS_USEAPPLYCALLBACK = 256;
pub const CMS_USEDESCRIPTION = 512;
pub const CMS_DISABLEINTENT = 1024;
pub const CMS_DISABLERENDERINTENT = 2048;
pub const CMS_MONITOROVERFLOW = -2147483648;
pub const CMS_PRINTEROVERFLOW = 1073741824;
pub const CMS_TARGETOVERFLOW = 536870912;
pub const DONT_USE_EMBEDDED_WCS_PROFILES = 1;
pub const WCS_DEFAULT = 0;
pub const WCS_ICCONLY = 65536;
pub const COLOR_GRAY = 1;
pub const COLOR_RGB = 2;
pub const COLOR_XYZ = 3;
pub const COLOR_Yxy = 4;
pub const COLOR_Lab = 5;
pub const COLOR_3_CHANNEL = 6;
pub const COLOR_CMYK = 7;
pub const COLOR_5_CHANNEL = 8;
pub const COLOR_6_CHANNEL = 9;
pub const COLOR_7_CHANNEL = 10;
pub const COLOR_8_CHANNEL = 11;
pub const COLOR_NAMED = 12;
pub const CPT_ICC = 0;
pub const CPT_DMP = 1;
pub const CPT_CAMP = 2;
pub const CPT_GMMP = 3;
pub const CPST_PERCEPTUAL = 0;
pub const CPST_RELATIVE_COLORIMETRIC = 1;
pub const CPST_SATURATION = 2;
pub const CPST_ABSOLUTE_COLORIMETRIC = 3;
pub const CPST_NONE = 4;
pub const CPST_RGB_WORKING_SPACE = 5;
pub const CPST_CUSTOM_WORKING_SPACE = 6;
pub const CPST_STANDARD_DISPLAY_COLOR_MODE = 7;
pub const CPST_EXTENDED_DISPLAY_COLOR_MODE = 8;
pub const COLOR_BYTE = 1;
pub const COLOR_WORD = 2;
pub const COLOR_FLOAT = 3;
pub const COLOR_S2DOT13FIXED = 4;
pub const COLOR_10b_R10G10B10A2 = 5;
pub const COLOR_10b_R10G10B10A2_XR = 6;
pub const COLOR_FLOAT16 = 7;
pub const BM_x555RGB = 0;
pub const BM_x555XYZ = 257;
pub const BM_x555Yxy = 258;
pub const BM_x555Lab = 259;
pub const BM_x555G3CH = 260;
pub const BM_RGBTRIPLETS = 2;
pub const BM_BGRTRIPLETS = 4;
pub const BM_XYZTRIPLETS = 513;
pub const BM_YxyTRIPLETS = 514;
pub const BM_LabTRIPLETS = 515;
pub const BM_G3CHTRIPLETS = 516;
pub const BM_5CHANNEL = 517;
pub const BM_6CHANNEL = 518;
pub const BM_7CHANNEL = 519;
pub const BM_8CHANNEL = 520;
pub const BM_GRAY = 521;
pub const BM_xRGBQUADS = 8;
pub const BM_xBGRQUADS = 16;
pub const BM_xG3CHQUADS = 772;
pub const BM_KYMCQUADS = 773;
pub const BM_CMYKQUADS = 32;
pub const BM_10b_RGB = 9;
pub const BM_10b_XYZ = 1025;
pub const BM_10b_Yxy = 1026;
pub const BM_10b_Lab = 1027;
pub const BM_10b_G3CH = 1028;
pub const BM_NAMED_INDEX = 1029;
pub const BM_16b_RGB = 10;
pub const BM_16b_XYZ = 1281;
pub const BM_16b_Yxy = 1282;
pub const BM_16b_Lab = 1283;
pub const BM_16b_G3CH = 1284;
pub const BM_16b_GRAY = 1285;
pub const BM_565RGB = 1;
pub const BM_32b_scRGB = 1537;
pub const BM_32b_scARGB = 1538;
pub const BM_S2DOT13FIXED_scRGB = 1539;
pub const BM_S2DOT13FIXED_scARGB = 1540;
pub const BM_R10G10B10A2 = 1793;
pub const BM_R10G10B10A2_XR = 1794;
pub const BM_R16G16B16A16_FLOAT = 1795;
pub const WCS_PROFILE_MANAGEMENT_SCOPE_SYSTEM_WIDE = 0;
pub const WCS_PROFILE_MANAGEMENT_SCOPE_CURRENT_USER = 1;
pub const VideoCardGammaTable = 1;
pub const MicrosoftHardwareColorV2 = 2;

pub const aliases = struct {
    pub const ICM_COMMAND = u32;
    pub const ICM_MODE = i32;
    pub const COLOR_MATCH_TO_TARGET_ACTION = u32;
    pub const LCSCSTYPE = i32;
    pub const COLORTYPE = i32;
    pub const COLORPROFILETYPE = i32;
    pub const COLORPROFILESUBTYPE = i32;
    pub const COLORDATATYPE = i32;
    pub const BMFORMAT = i32;
    pub const WCS_PROFILE_MANAGEMENT_SCOPE = i32;
    pub const WCS_DEVICE_CAPABILITIES_TYPE = i32;
    pub const HCOLORSPACE = ?*anyopaque;
    pub const ICMENUMPROCA = ?*const anyopaque;
    pub const ICMENUMPROCW = ?*const anyopaque;
    pub const LPBMCALLBACKFN = ?*const anyopaque;
    pub const PCMSCALLBACKW = ?*const anyopaque;
    pub const PCMSCALLBACKA = ?*const anyopaque;
};
