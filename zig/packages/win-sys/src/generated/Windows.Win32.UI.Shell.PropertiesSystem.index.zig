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
    .{ "PSFormatForDisplay", MethodRecord{ .library = "PROPSYS", .import = "PSFormatForDisplay", .signature = "\x00\x05\x11\x79\x0f\x11\x81\x71\x0f\x11\x82\x01\x11\xc0\x00\x47\x95\x11\x05\x09" } },
    .{ "PSFormatForDisplayAlloc", MethodRecord{ .library = "PROPSYS", .import = "PSFormatForDisplayAlloc", .signature = "\x00\x04\x11\x79\x0f\x11\x81\x71\x0f\x11\x82\x01\x11\xc0\x00\x47\x95\x0f\x11\x05" } },
    .{ "PSFormatPropertyValue", MethodRecord{ .library = "PROPSYS", .import = "PSFormatPropertyValue", .signature = "\x00\x04\x11\x79\x12\x94\xf9\x12\xc0\x00\x47\x99\x11\xc0\x00\x47\x95\x0f\x11\x05" } },
    .{ "PSGetImageReferenceForValue", MethodRecord{ .library = "PROPSYS", .import = "PSGetImageReferenceForValue", .signature = "\x00\x03\x11\x79\x0f\x11\x81\x71\x0f\x11\x82\x01\x0f\x11\x05" } },
    .{ "PSStringFromPropertyKey", MethodRecord{ .library = "PROPSYS", .import = "PSStringFromPropertyKey", .signature = "\x00\x03\x11\x79\x0f\x11\x81\x71\x11\x05\x09" } },
    .{ "PSPropertyKeyFromString", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyKeyFromString", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x81\x71" } },
    .{ "PSCreateMemoryPropertyStore", MethodRecord{ .library = "PROPSYS", .import = "PSCreateMemoryPropertyStore", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSCreateDelayedMultiplexPropertyStore", MethodRecord{ .library = "PROPSYS", .import = "PSCreateDelayedMultiplexPropertyStore", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x47\x9d\x12\xc0\x00\x47\xa1\x0f\x09\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSCreateMultiplexPropertyStore", MethodRecord{ .library = "PROPSYS", .import = "PSCreateMultiplexPropertyStore", .signature = "\x00\x04\x11\x79\x0f\x12\x82\xb1\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSCreatePropertyChangeArray", MethodRecord{ .library = "PROPSYS", .import = "PSCreatePropertyChangeArray", .signature = "\x00\x06\x11\x79\x0f\x11\x81\x71\x0f\x11\xc0\x00\x47\xa5\x0f\x11\x82\x01\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSCreateSimplePropertyChange", MethodRecord{ .library = "PROPSYS", .import = "PSCreateSimplePropertyChange", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x47\xa5\x0f\x11\x81\x71\x0f\x11\x82\x01\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSGetPropertyDescription", MethodRecord{ .library = "PROPSYS", .import = "PSGetPropertyDescription", .signature = "\x00\x03\x11\x79\x0f\x11\x81\x71\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSGetPropertyDescriptionByName", MethodRecord{ .library = "PROPSYS", .import = "PSGetPropertyDescriptionByName", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSLookupPropertyHandlerCLSID", MethodRecord{ .library = "PROPSYS", .import = "PSLookupPropertyHandlerCLSID", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x0d" } },
    .{ "PSGetItemPropertyHandler", MethodRecord{ .library = "PROPSYS", .import = "PSGetItemPropertyHandler", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x11\x59\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSGetItemPropertyHandlerWithCreateObject", MethodRecord{ .library = "PROPSYS", .import = "PSGetItemPropertyHandlerWithCreateObject", .signature = "\x00\x05\x11\x79\x12\x82\xb1\x11\x59\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSGetPropertyValue", MethodRecord{ .library = "PROPSYS", .import = "PSGetPropertyValue", .signature = "\x00\x03\x11\x79\x12\x94\xf9\x12\xc0\x00\x47\x99\x0f\x11\x82\x01" } },
    .{ "PSSetPropertyValue", MethodRecord{ .library = "PROPSYS", .import = "PSSetPropertyValue", .signature = "\x00\x03\x11\x79\x12\x94\xf9\x12\xc0\x00\x47\x99\x0f\x11\x82\x01" } },
    .{ "PSRegisterPropertySchema", MethodRecord{ .library = "PROPSYS", .import = "PSRegisterPropertySchema", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "PSUnregisterPropertySchema", MethodRecord{ .library = "PROPSYS", .import = "PSUnregisterPropertySchema", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "PSRefreshPropertySchema", MethodRecord{ .library = "PROPSYS", .import = "PSRefreshPropertySchema", .signature = "\x00\x00\x11\x79" } },
    .{ "PSEnumeratePropertyDescriptions", MethodRecord{ .library = "PROPSYS", .import = "PSEnumeratePropertyDescriptions", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x47\xa9\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSGetPropertyKeyFromName", MethodRecord{ .library = "PROPSYS", .import = "PSGetPropertyKeyFromName", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x81\x71" } },
    .{ "PSGetNameFromPropertyKey", MethodRecord{ .library = "PROPSYS", .import = "PSGetNameFromPropertyKey", .signature = "\x00\x02\x11\x79\x0f\x11\x81\x71\x0f\x11\x05" } },
    .{ "PSCoerceToCanonicalValue", MethodRecord{ .library = "PROPSYS", .import = "PSCoerceToCanonicalValue", .signature = "\x00\x02\x11\x79\x0f\x11\x81\x71\x0f\x11\x82\x01" } },
    .{ "PSGetPropertyDescriptionListFromString", MethodRecord{ .library = "PROPSYS", .import = "PSGetPropertyDescriptionListFromString", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSCreatePropertyStoreFromPropertySetStorage", MethodRecord{ .library = "PROPSYS", .import = "PSCreatePropertyStoreFromPropertySetStorage", .signature = "\x00\x04\x11\x79\x12\xc0\x00\x40\x0d\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSCreatePropertyStoreFromObject", MethodRecord{ .library = "PROPSYS", .import = "PSCreatePropertyStoreFromObject", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSCreateAdapterFromPropertyStore", MethodRecord{ .library = "PROPSYS", .import = "PSCreateAdapterFromPropertyStore", .signature = "\x00\x03\x11\x79\x12\x94\xf9\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSGetPropertySystem", MethodRecord{ .library = "PROPSYS", .import = "PSGetPropertySystem", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSGetPropertyFromPropertyStorage", MethodRecord{ .library = "PROPSYS", .import = "PSGetPropertyFromPropertyStorage", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x47\xad\x09\x0f\x11\x81\x71\x0f\x11\x82\x01" } },
    .{ "PSGetNamedPropertyFromPropertyStorage", MethodRecord{ .library = "PROPSYS", .import = "PSGetNamedPropertyFromPropertyStorage", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x47\xad\x09\x11\x05\x0f\x11\x82\x01" } },
    .{ "PSPropertyBag_ReadType", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadType", .signature = "\x00\x04\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\x94\x89\x11\x99\x3d" } },
    .{ "PSPropertyBag_ReadStr", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadStr", .signature = "\x00\x04\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x11\x05\x08" } },
    .{ "PSPropertyBag_ReadStrAlloc", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadStrAlloc", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\x05" } },
    .{ "PSPropertyBag_ReadBSTR", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadBSTR", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\x8d\x35" } },
    .{ "PSPropertyBag_WriteStr", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WriteStr", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x11\x05" } },
    .{ "PSPropertyBag_WriteBSTR", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WriteBSTR", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x11\x8d\x35" } },
    .{ "PSPropertyBag_ReadInt", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadInt", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x08" } },
    .{ "PSPropertyBag_WriteInt", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WriteInt", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x08" } },
    .{ "PSPropertyBag_ReadSHORT", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadSHORT", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x06" } },
    .{ "PSPropertyBag_WriteSHORT", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WriteSHORT", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x06" } },
    .{ "PSPropertyBag_ReadLONG", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadLONG", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x08" } },
    .{ "PSPropertyBag_WriteLONG", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WriteLONG", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x08" } },
    .{ "PSPropertyBag_ReadDWORD", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadDWORD", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x09" } },
    .{ "PSPropertyBag_WriteDWORD", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WriteDWORD", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x09" } },
    .{ "PSPropertyBag_ReadBOOL", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadBOOL", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\x59" } },
    .{ "PSPropertyBag_WriteBOOL", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WriteBOOL", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x11\x59" } },
    .{ "PSPropertyBag_ReadPOINTL", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadPOINTL", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\xab\x35" } },
    .{ "PSPropertyBag_WritePOINTL", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WritePOINTL", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\xab\x35" } },
    .{ "PSPropertyBag_ReadPOINTS", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadPOINTS", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\xc0\x00\x47\xb5" } },
    .{ "PSPropertyBag_WritePOINTS", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WritePOINTS", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\xc0\x00\x47\xb5" } },
    .{ "PSPropertyBag_ReadRECTL", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadRECTL", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\xab\x2d" } },
    .{ "PSPropertyBag_WriteRECTL", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WriteRECTL", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\xab\x2d" } },
    .{ "PSPropertyBag_ReadStream", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadStream", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x12\x83\x75" } },
    .{ "PSPropertyBag_WriteStream", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WriteStream", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x12\x83\x75" } },
    .{ "PSPropertyBag_Delete", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_Delete", .signature = "\x00\x02\x11\x79\x12\xc0\x00\x47\xb1\x11\x05" } },
    .{ "PSPropertyBag_ReadULONGLONG", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadULONGLONG", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x0b" } },
    .{ "PSPropertyBag_WriteULONGLONG", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WriteULONGLONG", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0b" } },
    .{ "PSPropertyBag_ReadUnknown", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadUnknown", .signature = "\x00\x04\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PSPropertyBag_WriteUnknown", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WriteUnknown", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x12\x82\xb1" } },
    .{ "PSPropertyBag_ReadGUID", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadGUID", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\x0d" } },
    .{ "PSPropertyBag_WriteGUID", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WriteGUID", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\x0d" } },
    .{ "PSPropertyBag_ReadPropertyKey", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_ReadPropertyKey", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\x81\x71" } },
    .{ "PSPropertyBag_WritePropertyKey", MethodRecord{ .library = "PROPSYS", .import = "PSPropertyBag_WritePropertyKey", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x47\xb1\x11\x05\x0f\x11\x81\x71" } },
    .{ "SHGetPropertyStoreFromIDList", MethodRecord{ .library = "SHELL32", .import = "SHGetPropertyStoreFromIDList", .signature = "\x00\x04\x11\x79\x0f\x11\x9e\x35\x11\xc0\x00\x47\x9d\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHGetPropertyStoreFromParsingName", MethodRecord{ .library = "SHELL32", .import = "SHGetPropertyStoreFromParsingName", .signature = "\x00\x05\x11\x79\x11\x05\x12\x82\xbd\x11\xc0\x00\x47\x9d\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHAddDefaultPropertiesByExt", MethodRecord{ .library = "SHELL32", .import = "SHAddDefaultPropertiesByExt", .signature = "\x00\x02\x11\x79\x11\x05\x12\x94\xf9" } },
    .{ "PifMgr_OpenProperties", MethodRecord{ .library = "SHELL32", .import = "PifMgr_OpenProperties", .signature = "\x00\x04\x11\x80\x85\x11\x05\x11\x05\x09\x09" } },
    .{ "PifMgr_GetProperties", MethodRecord{ .library = "SHELL32", .import = "PifMgr_GetProperties", .signature = "\x00\x05\x08\x11\x80\x85\x11\x3d\x0f\x01\x08\x09" } },
    .{ "PifMgr_SetProperties", MethodRecord{ .library = "SHELL32", .import = "PifMgr_SetProperties", .signature = "\x00\x05\x08\x11\x80\x85\x11\x3d\x0f\x01\x08\x09" } },
    .{ "PifMgr_CloseProperties", MethodRecord{ .library = "SHELL32", .import = "PifMgr_CloseProperties", .signature = "\x00\x02\x11\x80\x85\x11\x80\x85\x09" } },
    .{ "SHPropStgCreate", MethodRecord{ .library = "SHELL32", .import = "SHPropStgCreate", .signature = "\x00\x08\x11\x79\x12\xc0\x00\x40\x0d\x0f\x11\x0d\x0f\x11\x0d\x09\x09\x09\x0f\x12\xc0\x00\x40\x09\x0f\x09" } },
    .{ "SHPropStgReadMultiple", MethodRecord{ .library = "SHELL32", .import = "SHPropStgReadMultiple", .signature = "\x00\x05\x11\x79\x12\xc0\x00\x40\x09\x09\x09\x0f\x11\xc0\x00\x47\xb9\x0f\x11\x82\x01" } },
    .{ "SHPropStgWriteMultiple", MethodRecord{ .library = "SHELL32", .import = "SHPropStgWriteMultiple", .signature = "\x00\x06\x11\x79\x12\xc0\x00\x40\x09\x0f\x09\x09\x0f\x11\xc0\x00\x47\xb9\x0f\x11\x82\x01\x09" } },
    .{ "SHGetPropertyStoreForWindow", MethodRecord{ .library = "SHELL32", .import = "SHGetPropertyStoreForWindow", .signature = "\x00\x03\x11\x79\x11\x25\x0f\x11\x0d\x0f\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x171 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PROPERTYKEY" },
        0x201 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "PROPVARIANT" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x2bd => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IBindCtx" },
        0x375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IStream" },
        0xd35 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BSTR" },
        0x1489 => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "VARIANT" },
        0x14f9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell.PropertiesSystem", .name = "IPropertyStore" },
        0x193d => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "VARENUM" },
        0x1e35 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell.Common", .name = "ITEMIDLIST" },
        0x2b2d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "RECTL" },
        0x2b35 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "POINTL" },
        0x4009 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "IPropertyStorage" },
        0x400d => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "IPropertySetStorage" },
        0x4795 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell.PropertiesSystem", .name = "PROPDESC_FORMAT_FLAGS" },
        0x4799 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell.PropertiesSystem", .name = "IPropertyDescription" },
        0x479d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell.PropertiesSystem", .name = "GETPROPERTYSTOREFLAGS" },
        0x47a1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell.PropertiesSystem", .name = "IDelayedPropertyStoreFactory" },
        0x47a5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell.PropertiesSystem", .name = "PKA_FLAGS" },
        0x47a9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell.PropertiesSystem", .name = "PROPDESC_ENUMFILTER" },
        0x47ad => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell.PropertiesSystem", .name = "PCUSERIALIZEDPROPSTORAGE" },
        0x47b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "IPropertyBag" },
        0x47b5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "POINTS" },
        0x47b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "PROPSPEC" },
        else => null,
    };
}

pub const PKEY_PIDSTR_MAX = 10;
pub const GPS_DEFAULT = 0;
pub const GPS_HANDLERPROPERTIESONLY = 1;
pub const GPS_READWRITE = 2;
pub const GPS_TEMPORARY = 4;
pub const GPS_FASTPROPERTIESONLY = 8;
pub const GPS_OPENSLOWITEM = 16;
pub const GPS_DELAYCREATION = 32;
pub const GPS_BESTEFFORT = 64;
pub const GPS_NO_OPLOCK = 128;
pub const GPS_PREFERQUERYPROPERTIES = 256;
pub const GPS_EXTRINSICPROPERTIES = 512;
pub const GPS_EXTRINSICPROPERTIESONLY = 1024;
pub const GPS_VOLATILEPROPERTIES = 2048;
pub const GPS_VOLATILEPROPERTIESONLY = 4096;
pub const GPS_MASK_VALID = 8191;
pub const PKA_SET = 0;
pub const PKA_APPEND = 1;
pub const PKA_DELETE = 2;
pub const PSC_NORMAL = 0;
pub const PSC_NOTINSOURCE = 1;
pub const PSC_DIRTY = 2;
pub const PSC_READONLY = 3;
pub const PET_DISCRETEVALUE = 0;
pub const PET_RANGEDVALUE = 1;
pub const PET_DEFAULTVALUE = 2;
pub const PET_ENDRANGE = 3;
pub const PDTF_DEFAULT = 0;
pub const PDTF_MULTIPLEVALUES = 1;
pub const PDTF_ISINNATE = 2;
pub const PDTF_ISGROUP = 4;
pub const PDTF_CANGROUPBY = 8;
pub const PDTF_CANSTACKBY = 16;
pub const PDTF_ISTREEPROPERTY = 32;
pub const PDTF_INCLUDEINFULLTEXTQUERY = 64;
pub const PDTF_ISVIEWABLE = 128;
pub const PDTF_ISQUERYABLE = 256;
pub const PDTF_CANBEPURGED = 512;
pub const PDTF_SEARCHRAWVALUE = 1024;
pub const PDTF_DONTCOERCEEMPTYSTRINGS = 2048;
pub const PDTF_ALWAYSINSUPPLEMENTALSTORE = 4096;
pub const PDTF_ISSYSTEMPROPERTY = 2147483648;
pub const PDTF_MASK_ALL = 2147491839;
pub const PDVF_DEFAULT = 0;
pub const PDVF_CENTERALIGN = 1;
pub const PDVF_RIGHTALIGN = 2;
pub const PDVF_BEGINNEWGROUP = 4;
pub const PDVF_FILLAREA = 8;
pub const PDVF_SORTDESCENDING = 16;
pub const PDVF_SHOWONLYIFPRESENT = 32;
pub const PDVF_SHOWBYDEFAULT = 64;
pub const PDVF_SHOWINPRIMARYLIST = 128;
pub const PDVF_SHOWINSECONDARYLIST = 256;
pub const PDVF_HIDELABEL = 512;
pub const PDVF_HIDDEN = 2048;
pub const PDVF_CANWRAP = 4096;
pub const PDVF_MASK_ALL = 7167;
pub const PDDT_STRING = 0;
pub const PDDT_NUMBER = 1;
pub const PDDT_BOOLEAN = 2;
pub const PDDT_DATETIME = 3;
pub const PDDT_ENUMERATED = 4;
pub const PDGR_DISCRETE = 0;
pub const PDGR_ALPHANUMERIC = 1;
pub const PDGR_SIZE = 2;
pub const PDGR_DYNAMIC = 3;
pub const PDGR_DATE = 4;
pub const PDGR_PERCENT = 5;
pub const PDGR_ENUMERATED = 6;
pub const PDFF_DEFAULT = 0;
pub const PDFF_PREFIXNAME = 1;
pub const PDFF_FILENAME = 2;
pub const PDFF_ALWAYSKB = 4;
pub const PDFF_RESERVED_RIGHTTOLEFT = 8;
pub const PDFF_SHORTTIME = 16;
pub const PDFF_LONGTIME = 32;
pub const PDFF_HIDETIME = 64;
pub const PDFF_SHORTDATE = 128;
pub const PDFF_LONGDATE = 256;
pub const PDFF_HIDEDATE = 512;
pub const PDFF_RELATIVEDATE = 1024;
pub const PDFF_USEEDITINVITATION = 2048;
pub const PDFF_READONLY = 4096;
pub const PDFF_NOAUTOREADINGORDER = 8192;
pub const PDSD_GENERAL = 0;
pub const PDSD_A_Z = 1;
pub const PDSD_LOWEST_HIGHEST = 2;
pub const PDSD_SMALLEST_BIGGEST = 3;
pub const PDSD_OLDEST_NEWEST = 4;
pub const PDRDT_GENERAL = 0;
pub const PDRDT_DATE = 1;
pub const PDRDT_SIZE = 2;
pub const PDRDT_COUNT = 3;
pub const PDRDT_REVISION = 4;
pub const PDRDT_LENGTH = 5;
pub const PDRDT_DURATION = 6;
pub const PDRDT_SPEED = 7;
pub const PDRDT_RATE = 8;
pub const PDRDT_RATING = 9;
pub const PDRDT_PRIORITY = 10;
pub const PDAT_DEFAULT = 0;
pub const PDAT_FIRST = 1;
pub const PDAT_SUM = 2;
pub const PDAT_AVERAGE = 3;
pub const PDAT_DATERANGE = 4;
pub const PDAT_UNION = 5;
pub const PDAT_MAX = 6;
pub const PDAT_MIN = 7;
pub const PDCOT_NONE = 0;
pub const PDCOT_STRING = 1;
pub const PDCOT_SIZE = 2;
pub const PDCOT_DATETIME = 3;
pub const PDCOT_BOOLEAN = 4;
pub const PDCOT_NUMBER = 5;
pub const PDSIF_DEFAULT = 0;
pub const PDSIF_ININVERTEDINDEX = 1;
pub const PDSIF_ISCOLUMN = 2;
pub const PDSIF_ISCOLUMNSPARSE = 4;
pub const PDSIF_ALWAYSINCLUDE = 8;
pub const PDSIF_USEFORTYPEAHEAD = 16;
pub const PDCIT_NONE = 0;
pub const PDCIT_ONDISK = 1;
pub const PDCIT_INMEMORY = 2;
pub const PDCIT_ONDEMAND = 3;
pub const PDCIT_ONDISKALL = 4;
pub const PDCIT_ONDISKVECTOR = 5;
pub const PDEF_ALL = 0;
pub const PDEF_SYSTEM = 1;
pub const PDEF_NONSYSTEM = 2;
pub const PDEF_VIEWABLE = 3;
pub const PDEF_QUERYABLE = 4;
pub const PDEF_INFULLTEXTQUERY = 5;
pub const PDEF_COLUMN = 6;
pub const FPSPS_DEFAULT = 0;
pub const FPSPS_READONLY = 1;
pub const FPSPS_TREAT_NEW_VALUES_AS_DIRTY = 2;
pub const STS_NONE = 0;
pub const STS_NEEDSUPLOAD = 1;
pub const STS_NEEDSDOWNLOAD = 2;
pub const STS_TRANSFERRING = 4;
pub const STS_PAUSED = 8;
pub const STS_HASERROR = 16;
pub const STS_FETCHING_METADATA = 32;
pub const STS_USER_REQUESTED_REFRESH = 64;
pub const STS_HASWARNING = 128;
pub const STS_EXCLUDED = 256;
pub const STS_INCOMPLETE = 512;
pub const STS_PLACEHOLDER_IFEMPTY = 1024;
pub const PS_NONE = 0;
pub const PS_MARKED_FOR_OFFLINE_AVAILABILITY = 1;
pub const PS_FULL_PRIMARY_STREAM_AVAILABLE = 2;
pub const PS_CREATE_FILE_ACCESSIBLE = 4;
pub const PS_CLOUDFILE_PLACEHOLDER = 8;
pub const PS_DEFAULT = 7;
pub const PS_ALL = 15;
pub const PUIFNF_DEFAULT = 0;
pub const PUIFNF_MNEMONIC = 1;
pub const PUIF_DEFAULT = 0;
pub const PUIF_RIGHTALIGN = 1;
pub const PUIF_NOLABELININFOTIP = 2;
pub const PUIFFDF_DEFAULT = 0;
pub const PUIFFDF_RIGHTTOLEFT = 1;
pub const PUIFFDF_SHORTFORMAT = 2;
pub const PUIFFDF_NOTIME = 4;
pub const PUIFFDF_FRIENDLYDATE = 8;
pub const PDOPS_RUNNING = 1;
pub const PDOPS_PAUSED = 2;
pub const PDOPS_CANCELLED = 3;
pub const PDOPS_STOPPED = 4;
pub const PDOPS_ERRORS = 5;
pub const SESF_NONE = 0;
pub const SESF_SERVICE_QUOTA_NEARING_LIMIT = 1;
pub const SESF_SERVICE_QUOTA_EXCEEDED_LIMIT = 2;
pub const SESF_AUTHENTICATION_ERROR = 4;
pub const SESF_PAUSED_DUE_TO_METERED_NETWORK = 8;
pub const SESF_PAUSED_DUE_TO_DISK_SPACE_FULL = 16;
pub const SESF_PAUSED_DUE_TO_CLIENT_POLICY = 32;
pub const SESF_PAUSED_DUE_TO_SERVICE_POLICY = 64;
pub const SESF_SERVICE_UNAVAILABLE = 128;
pub const SESF_PAUSED_DUE_TO_USER_REQUEST = 256;
pub const SESF_ALL_FLAGS = 511;

pub const aliases = struct {
    pub const GETPROPERTYSTOREFLAGS = i32;
    pub const PKA_FLAGS = i32;
    pub const PSC_STATE = i32;
    pub const PROPENUMTYPE = i32;
    pub const PROPDESC_TYPE_FLAGS = u32;
    pub const PROPDESC_VIEW_FLAGS = i32;
    pub const PROPDESC_DISPLAYTYPE = i32;
    pub const PROPDESC_GROUPING_RANGE = i32;
    pub const PROPDESC_FORMAT_FLAGS = i32;
    pub const PROPDESC_SORTDESCRIPTION = i32;
    pub const PROPDESC_RELATIVEDESCRIPTION_TYPE = i32;
    pub const PROPDESC_AGGREGATION_TYPE = i32;
    pub const PROPDESC_CONDITION_TYPE = i32;
    pub const PROPDESC_SEARCHINFO_FLAGS = i32;
    pub const PROPDESC_COLUMNINDEX_TYPE = i32;
    pub const PROPDESC_ENUMFILTER = i32;
    pub const _PERSIST_SPROPSTORE_FLAGS = i32;
    pub const SYNC_TRANSFER_STATUS = i32;
    pub const PLACEHOLDER_STATES = i32;
    pub const PROPERTYUI_NAME_FLAGS = i32;
    pub const PROPERTYUI_FLAGS = i32;
    pub const PROPERTYUI_FORMAT_FLAGS = i32;
    pub const PDOPSTATUS = i32;
    pub const SYNC_ENGINE_STATE_FLAGS = i32;
    pub const SERIALIZEDPROPSTORAGE = isize;
    pub const PCUSERIALIZEDPROPSTORAGE = isize;
};
