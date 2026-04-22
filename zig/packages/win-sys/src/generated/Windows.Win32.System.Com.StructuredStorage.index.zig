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
    .{ "CoGetInstanceFromFile", MethodRecord{ .library = "OLE32", .import = "CoGetInstanceFromFile", .signature = "\x00\x08\x11\x79\x0f\x11\x82\xfd\x0f\x11\x0d\x12\x82\xb1\x11\x82\xe9\x09\x11\x05\x09\x0f\x11\x83\x01" } },
    .{ "CoGetInstanceFromIStorage", MethodRecord{ .library = "OLE32", .import = "CoGetInstanceFromIStorage", .signature = "\x00\x07\x11\x79\x0f\x11\x82\xfd\x0f\x11\x0d\x12\x82\xb1\x11\x82\xe9\x12\x99\xb9\x09\x0f\x11\x83\x01" } },
    .{ "StgOpenAsyncDocfileOnIFillLockBytes", MethodRecord{ .library = "ole32", .import = "StgOpenAsyncDocfileOnIFillLockBytes", .signature = "\x00\x04\x11\x79\x12\xbf\xfd\x09\x09\x0f\x12\x99\xb9" } },
    .{ "StgGetIFillLockBytesOnILockBytes", MethodRecord{ .library = "ole32", .import = "StgGetIFillLockBytesOnILockBytes", .signature = "\x00\x02\x11\x79\x12\xc0\x00\x40\x01\x0f\x12\xbf\xfd" } },
    .{ "StgGetIFillLockBytesOnFile", MethodRecord{ .library = "ole32", .import = "StgGetIFillLockBytesOnFile", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x12\xbf\xfd" } },
    .{ "StgOpenLayoutDocfile", MethodRecord{ .library = "dflayout", .import = "StgOpenLayoutDocfile", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x12\x99\xb9" } },
    .{ "CreateStreamOnHGlobal", MethodRecord{ .library = "OLE32", .import = "CreateStreamOnHGlobal", .signature = "\x00\x03\x11\x79\x11\x8d\x39\x11\x59\x0f\x12\x83\x75" } },
    .{ "GetHGlobalFromStream", MethodRecord{ .library = "OLE32", .import = "GetHGlobalFromStream", .signature = "\x00\x02\x11\x79\x12\x83\x75\x0f\x11\x8d\x39" } },
    .{ "CoGetInterfaceAndReleaseStream", MethodRecord{ .library = "OLE32", .import = "CoGetInterfaceAndReleaseStream", .signature = "\x00\x03\x11\x79\x12\x83\x75\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "PropVariantCopy", MethodRecord{ .library = "OLE32", .import = "PropVariantCopy", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x11\x82\x01" } },
    .{ "PropVariantClear", MethodRecord{ .library = "OLE32", .import = "PropVariantClear", .signature = "\x00\x01\x11\x79\x0f\x11\x82\x01" } },
    .{ "FreePropVariantArray", MethodRecord{ .library = "OLE32", .import = "FreePropVariantArray", .signature = "\x00\x02\x11\x79\x09\x0f\x11\x82\x01" } },
    .{ "StgCreateDocfile", MethodRecord{ .library = "OLE32", .import = "StgCreateDocfile", .signature = "\x00\x04\x11\x79\x11\x05\x11\xa0\x9d\x09\x0f\x12\x99\xb9" } },
    .{ "StgCreateDocfileOnILockBytes", MethodRecord{ .library = "OLE32", .import = "StgCreateDocfileOnILockBytes", .signature = "\x00\x04\x11\x79\x12\xc0\x00\x40\x01\x11\xa0\x9d\x09\x0f\x12\x99\xb9" } },
    .{ "StgOpenStorage", MethodRecord{ .library = "OLE32", .import = "StgOpenStorage", .signature = "\x00\x06\x11\x79\x11\x05\x12\x99\xb9\x11\xa0\x9d\x0f\x0f\x07\x09\x0f\x12\x99\xb9" } },
    .{ "StgOpenStorageOnILockBytes", MethodRecord{ .library = "OLE32", .import = "StgOpenStorageOnILockBytes", .signature = "\x00\x06\x11\x79\x12\xc0\x00\x40\x01\x12\x99\xb9\x11\xa0\x9d\x0f\x0f\x07\x09\x0f\x12\x99\xb9" } },
    .{ "StgIsStorageFile", MethodRecord{ .library = "OLE32", .import = "StgIsStorageFile", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "StgIsStorageILockBytes", MethodRecord{ .library = "OLE32", .import = "StgIsStorageILockBytes", .signature = "\x00\x01\x11\x79\x12\xc0\x00\x40\x01" } },
    .{ "StgSetTimes", MethodRecord{ .library = "OLE32", .import = "StgSetTimes", .signature = "\x00\x04\x11\x79\x11\x05\x0f\x11\x80\x9d\x0f\x11\x80\x9d\x0f\x11\x80\x9d" } },
    .{ "StgCreateStorageEx", MethodRecord{ .library = "OLE32", .import = "StgCreateStorageEx", .signature = "\x00\x08\x11\x79\x11\x05\x11\xa0\x9d\x11\xa0\x99\x09\x0f\x11\xc0\x00\x40\x05\x11\x82\xad\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "StgOpenStorageEx", MethodRecord{ .library = "OLE32", .import = "StgOpenStorageEx", .signature = "\x00\x08\x11\x79\x11\x05\x11\xa0\x9d\x11\xa0\x99\x09\x0f\x11\xc0\x00\x40\x05\x11\x82\xad\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "StgCreatePropStg", MethodRecord{ .library = "OLE32", .import = "StgCreatePropStg", .signature = "\x00\x06\x11\x79\x12\x82\xb1\x0f\x11\x0d\x0f\x11\x0d\x09\x09\x0f\x12\xc0\x00\x40\x09" } },
    .{ "StgOpenPropStg", MethodRecord{ .library = "OLE32", .import = "StgOpenPropStg", .signature = "\x00\x05\x11\x79\x12\x82\xb1\x0f\x11\x0d\x09\x09\x0f\x12\xc0\x00\x40\x09" } },
    .{ "StgCreatePropSetStg", MethodRecord{ .library = "OLE32", .import = "StgCreatePropSetStg", .signature = "\x00\x03\x11\x79\x12\x99\xb9\x09\x0f\x12\xc0\x00\x40\x0d" } },
    .{ "FmtIdToPropStgName", MethodRecord{ .library = "OLE32", .import = "FmtIdToPropStgName", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x11\x05" } },
    .{ "PropStgNameToFmtId", MethodRecord{ .library = "OLE32", .import = "PropStgNameToFmtId", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x0d" } },
    .{ "ReadClassStg", MethodRecord{ .library = "OLE32", .import = "ReadClassStg", .signature = "\x00\x02\x11\x79\x12\x99\xb9\x0f\x11\x0d" } },
    .{ "WriteClassStg", MethodRecord{ .library = "OLE32", .import = "WriteClassStg", .signature = "\x00\x02\x11\x79\x12\x99\xb9\x0f\x11\x0d" } },
    .{ "ReadClassStm", MethodRecord{ .library = "OLE32", .import = "ReadClassStm", .signature = "\x00\x02\x11\x79\x12\x83\x75\x0f\x11\x0d" } },
    .{ "WriteClassStm", MethodRecord{ .library = "OLE32", .import = "WriteClassStm", .signature = "\x00\x02\x11\x79\x12\x83\x75\x0f\x11\x0d" } },
    .{ "GetHGlobalFromILockBytes", MethodRecord{ .library = "OLE32", .import = "GetHGlobalFromILockBytes", .signature = "\x00\x02\x11\x79\x12\xc0\x00\x40\x01\x0f\x11\x8d\x39" } },
    .{ "CreateILockBytesOnHGlobal", MethodRecord{ .library = "OLE32", .import = "CreateILockBytesOnHGlobal", .signature = "\x00\x03\x11\x79\x11\x8d\x39\x11\x59\x0f\x12\xc0\x00\x40\x01" } },
    .{ "GetConvertStg", MethodRecord{ .library = "OLE32", .import = "GetConvertStg", .signature = "\x00\x01\x11\x79\x12\x99\xb9" } },
    .{ "StgConvertVariantToProperty", MethodRecord{ .library = "ole32", .import = "StgConvertVariantToProperty", .signature = "\x00\x07\x0f\x11\xc0\x00\x40\x11\x0f\x11\x82\x01\x07\x0f\x11\xc0\x00\x40\x11\x0f\x09\x09\x11\x87\x79\x0f\x09" } },
    .{ "StgConvertPropertyToVariant", MethodRecord{ .library = "ole32", .import = "StgConvertPropertyToVariant", .signature = "\x00\x04\x11\x87\x79\x0f\x11\xc0\x00\x40\x11\x07\x0f\x11\x82\x01\x12\xc0\x00\x40\x15" } },
    .{ "StgPropertyLengthAsVariant", MethodRecord{ .library = "ole32", .import = "StgPropertyLengthAsVariant", .signature = "\x00\x04\x09\x0f\x11\xc0\x00\x40\x11\x09\x07\x05" } },
    .{ "WriteFmtUserTypeStg", MethodRecord{ .library = "OLE32", .import = "WriteFmtUserTypeStg", .signature = "\x00\x03\x11\x79\x12\x99\xb9\x07\x11\x05" } },
    .{ "ReadFmtUserTypeStg", MethodRecord{ .library = "OLE32", .import = "ReadFmtUserTypeStg", .signature = "\x00\x03\x11\x79\x12\x99\xb9\x0f\x07\x0f\x11\x05" } },
    .{ "OleConvertOLESTREAMToIStorage", MethodRecord{ .library = "ole32", .import = "OleConvertOLESTREAMToIStorage", .signature = "\x00\x03\x11\x79\x0f\x11\x9a\x11\x12\x99\xb9\x0f\x11\x9a\x15" } },
    .{ "OleConvertIStorageToOLESTREAM", MethodRecord{ .library = "ole32", .import = "OleConvertIStorageToOLESTREAM", .signature = "\x00\x02\x11\x79\x12\x99\xb9\x0f\x11\x9a\x11" } },
    .{ "SetConvertStg", MethodRecord{ .library = "OLE32", .import = "SetConvertStg", .signature = "\x00\x02\x11\x79\x12\x99\xb9\x11\x59" } },
    .{ "OleConvertIStorageToOLESTREAMEx", MethodRecord{ .library = "ole32", .import = "OleConvertIStorageToOLESTREAMEx", .signature = "\x00\x07\x11\x79\x12\x99\xb9\x07\x08\x08\x09\x0f\x11\x99\xf9\x0f\x11\x9a\x11" } },
    .{ "OleConvertOLESTREAMToIStorageEx", MethodRecord{ .library = "ole32", .import = "OleConvertOLESTREAMToIStorageEx", .signature = "\x00\x07\x11\x79\x0f\x11\x9a\x11\x12\x99\xb9\x0f\x07\x0f\x08\x0f\x08\x0f\x09\x0f\x11\x99\xf9" } },
    .{ "PropVariantToWinRTPropertyValue", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToWinRTPropertyValue", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "WinRTPropertyValueToPropVariant", MethodRecord{ .library = "PROPSYS", .import = "WinRTPropertyValueToPropVariant", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromResource", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromResource", .signature = "\x00\x03\x11\x79\x11\x82\x29\x09\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromBuffer", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromBuffer", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromCLSID", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromCLSID", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromGUIDAsString", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromGUIDAsString", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromFileTime", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromFileTime", .signature = "\x00\x02\x11\x79\x0f\x11\x80\x9d\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromPropVariantVectorElem", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromPropVariantVectorElem", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x09\x0f\x11\x82\x01" } },
    .{ "InitPropVariantVectorFromPropVariant", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantVectorFromPropVariant", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromBooleanVector", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromBooleanVector", .signature = "\x00\x03\x11\x79\x0f\x11\x59\x09\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromInt16Vector", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromInt16Vector", .signature = "\x00\x03\x11\x79\x0f\x06\x09\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromUInt16Vector", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromUInt16Vector", .signature = "\x00\x03\x11\x79\x0f\x07\x09\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromInt32Vector", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromInt32Vector", .signature = "\x00\x03\x11\x79\x0f\x08\x09\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromUInt32Vector", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromUInt32Vector", .signature = "\x00\x03\x11\x79\x0f\x09\x09\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromInt64Vector", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromInt64Vector", .signature = "\x00\x03\x11\x79\x0f\x0a\x09\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromUInt64Vector", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromUInt64Vector", .signature = "\x00\x03\x11\x79\x0f\x0b\x09\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromDoubleVector", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromDoubleVector", .signature = "\x00\x03\x11\x79\x0f\x0d\x09\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromFileTimeVector", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromFileTimeVector", .signature = "\x00\x03\x11\x79\x0f\x11\x80\x9d\x09\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromStringVector", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromStringVector", .signature = "\x00\x03\x11\x79\x0f\x11\x05\x09\x0f\x11\x82\x01" } },
    .{ "InitPropVariantFromStringAsVector", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromStringAsVector", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x82\x01" } },
    .{ "PropVariantToBooleanWithDefault", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToBooleanWithDefault", .signature = "\x00\x02\x11\x59\x0f\x11\x82\x01\x11\x59" } },
    .{ "PropVariantToInt16WithDefault", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToInt16WithDefault", .signature = "\x00\x02\x06\x0f\x11\x82\x01\x06" } },
    .{ "PropVariantToUInt16WithDefault", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToUInt16WithDefault", .signature = "\x00\x02\x07\x0f\x11\x82\x01\x07" } },
    .{ "PropVariantToInt32WithDefault", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToInt32WithDefault", .signature = "\x00\x02\x08\x0f\x11\x82\x01\x08" } },
    .{ "PropVariantToUInt32WithDefault", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToUInt32WithDefault", .signature = "\x00\x02\x09\x0f\x11\x82\x01\x09" } },
    .{ "PropVariantToInt64WithDefault", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToInt64WithDefault", .signature = "\x00\x02\x0a\x0f\x11\x82\x01\x0a" } },
    .{ "PropVariantToUInt64WithDefault", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToUInt64WithDefault", .signature = "\x00\x02\x0b\x0f\x11\x82\x01\x0b" } },
    .{ "PropVariantToDoubleWithDefault", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToDoubleWithDefault", .signature = "\x00\x02\x0d\x0f\x11\x82\x01\x0d" } },
    .{ "PropVariantToStringWithDefault", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToStringWithDefault", .signature = "\x00\x02\x11\x05\x0f\x11\x82\x01\x11\x05" } },
    .{ "PropVariantToBoolean", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToBoolean", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x11\x59" } },
    .{ "PropVariantToInt16", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToInt16", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x06" } },
    .{ "PropVariantToUInt16", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToUInt16", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x07" } },
    .{ "PropVariantToInt32", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToInt32", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x08" } },
    .{ "PropVariantToUInt32", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToUInt32", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x09" } },
    .{ "PropVariantToInt64", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToInt64", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x0a" } },
    .{ "PropVariantToUInt64", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToUInt64", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x0b" } },
    .{ "PropVariantToDouble", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToDouble", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x0d" } },
    .{ "PropVariantToBuffer", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToBuffer", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x0f\x01\x09" } },
    .{ "PropVariantToString", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToString", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x11\x05\x09" } },
    .{ "PropVariantToGUID", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToGUID", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x11\x0d" } },
    .{ "PropVariantToStringAlloc", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToStringAlloc", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x11\x05" } },
    .{ "PropVariantToBSTR", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToBSTR", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x11\x8d\x35" } },
    .{ "PropVariantToFileTime", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToFileTime", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x11\xc0\x00\x40\x19\x0f\x11\x80\x9d" } },
    .{ "PropVariantGetElementCount", MethodRecord{ .library = "PROPSYS", .import = "PropVariantGetElementCount", .signature = "\x00\x01\x09\x0f\x11\x82\x01" } },
    .{ "PropVariantToBooleanVector", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToBooleanVector", .signature = "\x00\x04\x11\x79\x0f\x11\x82\x01\x0f\x11\x59\x09\x0f\x09" } },
    .{ "PropVariantToInt16Vector", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToInt16Vector", .signature = "\x00\x04\x11\x79\x0f\x11\x82\x01\x0f\x06\x09\x0f\x09" } },
    .{ "PropVariantToUInt16Vector", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToUInt16Vector", .signature = "\x00\x04\x11\x79\x0f\x11\x82\x01\x0f\x07\x09\x0f\x09" } },
    .{ "PropVariantToInt32Vector", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToInt32Vector", .signature = "\x00\x04\x11\x79\x0f\x11\x82\x01\x0f\x08\x09\x0f\x09" } },
    .{ "PropVariantToUInt32Vector", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToUInt32Vector", .signature = "\x00\x04\x11\x79\x0f\x11\x82\x01\x0f\x09\x09\x0f\x09" } },
    .{ "PropVariantToInt64Vector", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToInt64Vector", .signature = "\x00\x04\x11\x79\x0f\x11\x82\x01\x0f\x0a\x09\x0f\x09" } },
    .{ "PropVariantToUInt64Vector", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToUInt64Vector", .signature = "\x00\x04\x11\x79\x0f\x11\x82\x01\x0f\x0b\x09\x0f\x09" } },
    .{ "PropVariantToDoubleVector", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToDoubleVector", .signature = "\x00\x04\x11\x79\x0f\x11\x82\x01\x0f\x0d\x09\x0f\x09" } },
    .{ "PropVariantToFileTimeVector", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToFileTimeVector", .signature = "\x00\x04\x11\x79\x0f\x11\x82\x01\x0f\x11\x80\x9d\x09\x0f\x09" } },
    .{ "PropVariantToStringVector", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToStringVector", .signature = "\x00\x04\x11\x79\x0f\x11\x82\x01\x0f\x11\x05\x09\x0f\x09" } },
    .{ "PropVariantToBooleanVectorAlloc", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToBooleanVectorAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x0f\x0f\x11\x59\x0f\x09" } },
    .{ "PropVariantToInt16VectorAlloc", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToInt16VectorAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x0f\x0f\x06\x0f\x09" } },
    .{ "PropVariantToUInt16VectorAlloc", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToUInt16VectorAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x0f\x0f\x07\x0f\x09" } },
    .{ "PropVariantToInt32VectorAlloc", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToInt32VectorAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x0f\x0f\x08\x0f\x09" } },
    .{ "PropVariantToUInt32VectorAlloc", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToUInt32VectorAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x0f\x0f\x09\x0f\x09" } },
    .{ "PropVariantToInt64VectorAlloc", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToInt64VectorAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x0f\x0f\x0a\x0f\x09" } },
    .{ "PropVariantToUInt64VectorAlloc", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToUInt64VectorAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x0f\x0f\x0b\x0f\x09" } },
    .{ "PropVariantToDoubleVectorAlloc", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToDoubleVectorAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x0f\x0f\x0d\x0f\x09" } },
    .{ "PropVariantToFileTimeVectorAlloc", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToFileTimeVectorAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x0f\x0f\x11\x80\x9d\x0f\x09" } },
    .{ "PropVariantToStringVectorAlloc", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToStringVectorAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x0f\x0f\x11\x05\x0f\x09" } },
    .{ "PropVariantGetBooleanElem", MethodRecord{ .library = "PROPSYS", .import = "PropVariantGetBooleanElem", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x09\x0f\x11\x59" } },
    .{ "PropVariantGetInt16Elem", MethodRecord{ .library = "PROPSYS", .import = "PropVariantGetInt16Elem", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x09\x0f\x06" } },
    .{ "PropVariantGetUInt16Elem", MethodRecord{ .library = "PROPSYS", .import = "PropVariantGetUInt16Elem", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x09\x0f\x07" } },
    .{ "PropVariantGetInt32Elem", MethodRecord{ .library = "PROPSYS", .import = "PropVariantGetInt32Elem", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x09\x0f\x08" } },
    .{ "PropVariantGetUInt32Elem", MethodRecord{ .library = "PROPSYS", .import = "PropVariantGetUInt32Elem", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x09\x0f\x09" } },
    .{ "PropVariantGetInt64Elem", MethodRecord{ .library = "PROPSYS", .import = "PropVariantGetInt64Elem", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x09\x0f\x0a" } },
    .{ "PropVariantGetUInt64Elem", MethodRecord{ .library = "PROPSYS", .import = "PropVariantGetUInt64Elem", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x09\x0f\x0b" } },
    .{ "PropVariantGetDoubleElem", MethodRecord{ .library = "PROPSYS", .import = "PropVariantGetDoubleElem", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x09\x0f\x0d" } },
    .{ "PropVariantGetFileTimeElem", MethodRecord{ .library = "PROPSYS", .import = "PropVariantGetFileTimeElem", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x09\x0f\x11\x80\x9d" } },
    .{ "PropVariantGetStringElem", MethodRecord{ .library = "PROPSYS", .import = "PropVariantGetStringElem", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x09\x0f\x11\x05" } },
    .{ "ClearPropVariantArray", MethodRecord{ .library = "PROPSYS", .import = "ClearPropVariantArray", .signature = "\x00\x02\x01\x0f\x11\x82\x01\x09" } },
    .{ "PropVariantCompareEx", MethodRecord{ .library = "PROPSYS", .import = "PropVariantCompareEx", .signature = "\x00\x04\x08\x0f\x11\x82\x01\x0f\x11\x82\x01\x11\xc0\x00\x40\x1d\x11\xc0\x00\x40\x21" } },
    .{ "PropVariantChangeType", MethodRecord{ .library = "PROPSYS", .import = "PropVariantChangeType", .signature = "\x00\x04\x11\x79\x0f\x11\x82\x01\x0f\x11\x82\x01\x11\xc0\x00\x40\x25\x11\x99\x3d" } },
    .{ "PropVariantToVariant", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToVariant", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x11\x94\x89" } },
    .{ "VariantToPropVariant", MethodRecord{ .library = "PROPSYS", .import = "VariantToPropVariant", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\x82\x01" } },
    .{ "StgSerializePropVariant", MethodRecord{ .library = "PROPSYS", .import = "StgSerializePropVariant", .signature = "\x00\x03\x11\x79\x0f\x11\x82\x01\x0f\x0f\x11\xc0\x00\x40\x11\x0f\x09" } },
    .{ "StgDeserializePropVariant", MethodRecord{ .library = "PROPSYS", .import = "StgDeserializePropVariant", .signature = "\x00\x03\x11\x79\x0f\x11\xc0\x00\x40\x11\x09\x0f\x11\x82\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x201 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "PROPVARIANT" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x2e9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "CLSCTX" },
        0x2fd => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "COSERVERINFO" },
        0x301 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "MULTI_QI" },
        0x375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IStream" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0xd35 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BSTR" },
        0xd39 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HGLOBAL" },
        0x1489 => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "VARIANT" },
        0x193d => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "VARENUM" },
        0x19b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "IStorage" },
        0x19f9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "STGMEDIUM" },
        0x1a11 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "OLESTREAM" },
        0x1a15 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "DVTARGETDEVICE" },
        0x2099 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "STGFMT" },
        0x209d => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "STGM" },
        0x3ffd => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "IFillLockBytes" },
        0x4001 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "ILockBytes" },
        0x4005 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "STGOPTIONS" },
        0x4009 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "IPropertyStorage" },
        0x400d => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "IPropertySetStorage" },
        0x4011 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "SERIALIZEDPROPERTYVALUE" },
        0x4015 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "IMemoryAllocator" },
        0x4019 => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "PSTIME_FLAGS" },
        0x401d => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "PROPVAR_COMPARE_UNIT" },
        0x4021 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "PROPVAR_COMPARE_FLAGS" },
        0x4025 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "PROPVAR_CHANGE_FLAGS" },
        else => null,
    };
}

pub const PRSPEC_LPWSTR = 0;
pub const PRSPEC_PROPID = 1;
pub const STGFMT_STORAGE = 0;
pub const STGFMT_NATIVE = 1;
pub const STGFMT_FILE = 3;
pub const STGFMT_ANY = 4;
pub const STGFMT_DOCFILE = 5;
pub const STGFMT_DOCUMENT = 0;
pub const PROPSETFLAG_DEFAULT = 0;
pub const PROPSETFLAG_NONSIMPLE = 1;
pub const PROPSETFLAG_ANSI = 2;
pub const PROPSETFLAG_UNBUFFERED = 4;
pub const PROPSETFLAG_CASE_SENSITIVE = 8;
pub const PROPSET_BEHAVIOR_CASE_SENSITIVE = 1;
pub const PID_DICTIONARY = 0;
pub const PID_CODEPAGE = 1;
pub const PID_FIRST_USABLE = 2;
pub const PID_FIRST_NAME_DEFAULT = 4095;
pub const PID_LOCALE = 2147483648;
pub const PID_MODIFY_TIME = 2147483649;
pub const PID_SECURITY = 2147483650;
pub const PID_BEHAVIOR = 2147483651;
pub const PID_ILLEGAL = 4294967295;
pub const PID_MIN_READONLY = 2147483648;
pub const PID_MAX_READONLY = 3221225471;
pub const PRSPEC_INVALID = 4294967295;
pub const PROPSETHDR_OSVERSION_UNKNOWN = 4294967295;
pub const PIDDI_THUMBNAIL = 2;
pub const PIDSI_TITLE = 2;
pub const PIDSI_SUBJECT = 3;
pub const PIDSI_AUTHOR = 4;
pub const PIDSI_KEYWORDS = 5;
pub const PIDSI_COMMENTS = 6;
pub const PIDSI_TEMPLATE = 7;
pub const PIDSI_LASTAUTHOR = 8;
pub const PIDSI_REVNUMBER = 9;
pub const PIDSI_EDITTIME = 10;
pub const PIDSI_LASTPRINTED = 11;
pub const PIDSI_CREATE_DTM = 12;
pub const PIDSI_LASTSAVE_DTM = 13;
pub const PIDSI_PAGECOUNT = 14;
pub const PIDSI_WORDCOUNT = 15;
pub const PIDSI_CHARCOUNT = 16;
pub const PIDSI_THUMBNAIL = 17;
pub const PIDSI_APPNAME = 18;
pub const PIDSI_DOC_SECURITY = 19;
pub const PIDDSI_CATEGORY = 2;
pub const PIDDSI_PRESFORMAT = 3;
pub const PIDDSI_BYTECOUNT = 4;
pub const PIDDSI_LINECOUNT = 5;
pub const PIDDSI_PARCOUNT = 6;
pub const PIDDSI_SLIDECOUNT = 7;
pub const PIDDSI_NOTECOUNT = 8;
pub const PIDDSI_HIDDENCOUNT = 9;
pub const PIDDSI_MMCLIPCOUNT = 10;
pub const PIDDSI_SCALE = 11;
pub const PIDDSI_HEADINGPAIR = 12;
pub const PIDDSI_DOCPARTS = 13;
pub const PIDDSI_MANAGER = 14;
pub const PIDDSI_COMPANY = 15;
pub const PIDDSI_LINKSDIRTY = 16;
pub const PIDMSI_EDITOR = 2;
pub const PIDMSI_SUPPLIER = 3;
pub const PIDMSI_SOURCE = 4;
pub const PIDMSI_SEQUENCE_NO = 5;
pub const PIDMSI_PROJECT = 6;
pub const PIDMSI_STATUS = 7;
pub const PIDMSI_OWNER = 8;
pub const PIDMSI_RATING = 9;
pub const PIDMSI_PRODUCTION = 10;
pub const PIDMSI_COPYRIGHT = 11;
pub const CWCSTORAGENAME = 32;
pub const STGOPTIONS_VERSION = 1;
pub const CCH_MAX_PROPSTG_NAME = 31;
pub const STGMOVE_MOVE = 0;
pub const STGMOVE_COPY = 1;
pub const STGMOVE_SHALLOWCOPY = 2;
pub const PIDMSI_STATUS_NORMAL = 0;
pub const PIDMSI_STATUS_NEW = 1;
pub const PIDMSI_STATUS_PRELIM = 2;
pub const PIDMSI_STATUS_DRAFT = 3;
pub const PIDMSI_STATUS_INPROGRESS = 4;
pub const PIDMSI_STATUS_EDIT = 5;
pub const PIDMSI_STATUS_REVIEW = 6;
pub const PIDMSI_STATUS_PROOF = 7;
pub const PIDMSI_STATUS_FINAL = 8;
pub const PIDMSI_STATUS_OTHER = 32767;
pub const PVCU_DEFAULT = 0;
pub const PVCU_SECOND = 1;
pub const PVCU_MINUTE = 2;
pub const PVCU_HOUR = 3;
pub const PVCU_DAY = 4;
pub const PVCU_MONTH = 5;
pub const PVCU_YEAR = 6;
pub const PVCF_DEFAULT = 0;
pub const PVCF_TREATEMPTYASGREATERTHAN = 1;
pub const PVCF_USESTRCMP = 2;
pub const PVCF_USESTRCMPC = 4;
pub const PVCF_USESTRCMPI = 8;
pub const PVCF_USESTRCMPIC = 16;
pub const PVCF_DIGITSASNUMBERS_CASESENSITIVE = 32;
pub const PVCHF_DEFAULT = 0;
pub const PVCHF_NOVALUEPROP = 1;
pub const PVCHF_ALPHABOOL = 2;
pub const PVCHF_NOUSEROVERRIDE = 4;
pub const PVCHF_LOCALBOOL = 8;
pub const PVCHF_NOHEXSTRING = 16;

pub const aliases = struct {
    pub const PROPSPEC_KIND = u32;
    pub const STGFMT = u32;
    pub const STGMOVE = i32;
    pub const PIDMSI_STATUS_VALUE = i32;
    pub const PROPVAR_COMPARE_UNIT = i32;
    pub const PROPVAR_COMPARE_FLAGS = i32;
    pub const PROPVAR_CHANGE_FLAGS = i32;
};
