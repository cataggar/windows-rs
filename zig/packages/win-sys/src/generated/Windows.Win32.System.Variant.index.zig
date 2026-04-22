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
    .{ "VARIANT_UserSize", MethodRecord{ .library = "OLEAUT32", .import = "VARIANT_UserSize", .signature = "\x00\x03\x09\x0f\x09\x09\x0f\x11\x94\x89" } },
    .{ "VARIANT_UserMarshal", MethodRecord{ .library = "OLEAUT32", .import = "VARIANT_UserMarshal", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\x94\x89" } },
    .{ "VARIANT_UserUnmarshal", MethodRecord{ .library = "OLEAUT32", .import = "VARIANT_UserUnmarshal", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\x94\x89" } },
    .{ "VARIANT_UserFree", MethodRecord{ .library = "OLEAUT32", .import = "VARIANT_UserFree", .signature = "\x00\x02\x01\x0f\x09\x0f\x11\x94\x89" } },
    .{ "VARIANT_UserSize64", MethodRecord{ .library = "OLEAUT32", .import = "VARIANT_UserSize64", .signature = "\x00\x03\x09\x0f\x09\x09\x0f\x11\x94\x89" } },
    .{ "VARIANT_UserMarshal64", MethodRecord{ .library = "OLEAUT32", .import = "VARIANT_UserMarshal64", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\x94\x89" } },
    .{ "VARIANT_UserUnmarshal64", MethodRecord{ .library = "OLEAUT32", .import = "VARIANT_UserUnmarshal64", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\x94\x89" } },
    .{ "VARIANT_UserFree64", MethodRecord{ .library = "OLEAUT32", .import = "VARIANT_UserFree64", .signature = "\x00\x02\x01\x0f\x09\x0f\x11\x94\x89" } },
    .{ "DosDateTimeToVariantTime", MethodRecord{ .library = "OLEAUT32", .import = "DosDateTimeToVariantTime", .signature = "\x00\x03\x08\x07\x07\x0f\x0d" } },
    .{ "VariantTimeToDosDateTime", MethodRecord{ .library = "OLEAUT32", .import = "VariantTimeToDosDateTime", .signature = "\x00\x03\x08\x0d\x0f\x07\x0f\x07" } },
    .{ "SystemTimeToVariantTime", MethodRecord{ .library = "OLEAUT32", .import = "SystemTimeToVariantTime", .signature = "\x00\x02\x08\x0f\x11\x86\x45\x0f\x0d" } },
    .{ "VariantTimeToSystemTime", MethodRecord{ .library = "OLEAUT32", .import = "VariantTimeToSystemTime", .signature = "\x00\x02\x08\x0d\x0f\x11\x86\x45" } },
    .{ "VariantInit", MethodRecord{ .library = "OLEAUT32", .import = "VariantInit", .signature = "\x00\x01\x01\x0f\x11\x94\x89" } },
    .{ "VariantClear", MethodRecord{ .library = "OLEAUT32", .import = "VariantClear", .signature = "\x00\x01\x11\x79\x0f\x11\x94\x89" } },
    .{ "VariantCopy", MethodRecord{ .library = "OLEAUT32", .import = "VariantCopy", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VariantCopyInd", MethodRecord{ .library = "OLEAUT32", .import = "VariantCopyInd", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VariantChangeType", MethodRecord{ .library = "OLEAUT32", .import = "VariantChangeType", .signature = "\x00\x04\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x11\xa3\x35\x11\x99\x3d" } },
    .{ "VariantChangeTypeEx", MethodRecord{ .library = "OLEAUT32", .import = "VariantChangeTypeEx", .signature = "\x00\x05\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x09\x11\xa3\x35\x11\x99\x3d" } },
    .{ "InitVariantFromResource", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromResource", .signature = "\x00\x03\x11\x79\x11\x82\x29\x09\x0f\x11\x94\x89" } },
    .{ "InitVariantFromBuffer", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromBuffer", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\x94\x89" } },
    .{ "InitVariantFromGUIDAsString", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromGUIDAsString", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x94\x89" } },
    .{ "InitVariantFromFileTime", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromFileTime", .signature = "\x00\x02\x11\x79\x0f\x11\x80\x9d\x0f\x11\x94\x89" } },
    .{ "InitVariantFromFileTimeArray", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromFileTimeArray", .signature = "\x00\x03\x11\x79\x0f\x11\x80\x9d\x09\x0f\x11\x94\x89" } },
    .{ "InitVariantFromVariantArrayElem", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromVariantArrayElem", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x09\x0f\x11\x94\x89" } },
    .{ "InitVariantFromBooleanArray", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromBooleanArray", .signature = "\x00\x03\x11\x79\x0f\x11\x59\x09\x0f\x11\x94\x89" } },
    .{ "InitVariantFromInt16Array", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromInt16Array", .signature = "\x00\x03\x11\x79\x0f\x06\x09\x0f\x11\x94\x89" } },
    .{ "InitVariantFromUInt16Array", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromUInt16Array", .signature = "\x00\x03\x11\x79\x0f\x07\x09\x0f\x11\x94\x89" } },
    .{ "InitVariantFromInt32Array", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromInt32Array", .signature = "\x00\x03\x11\x79\x0f\x08\x09\x0f\x11\x94\x89" } },
    .{ "InitVariantFromUInt32Array", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromUInt32Array", .signature = "\x00\x03\x11\x79\x0f\x09\x09\x0f\x11\x94\x89" } },
    .{ "InitVariantFromInt64Array", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromInt64Array", .signature = "\x00\x03\x11\x79\x0f\x0a\x09\x0f\x11\x94\x89" } },
    .{ "InitVariantFromUInt64Array", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromUInt64Array", .signature = "\x00\x03\x11\x79\x0f\x0b\x09\x0f\x11\x94\x89" } },
    .{ "InitVariantFromDoubleArray", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromDoubleArray", .signature = "\x00\x03\x11\x79\x0f\x0d\x09\x0f\x11\x94\x89" } },
    .{ "InitVariantFromStringArray", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromStringArray", .signature = "\x00\x03\x11\x79\x0f\x11\x05\x09\x0f\x11\x94\x89" } },
    .{ "VariantToBooleanWithDefault", MethodRecord{ .library = "PROPSYS", .import = "VariantToBooleanWithDefault", .signature = "\x00\x02\x11\x59\x0f\x11\x94\x89\x11\x59" } },
    .{ "VariantToInt16WithDefault", MethodRecord{ .library = "PROPSYS", .import = "VariantToInt16WithDefault", .signature = "\x00\x02\x06\x0f\x11\x94\x89\x06" } },
    .{ "VariantToUInt16WithDefault", MethodRecord{ .library = "PROPSYS", .import = "VariantToUInt16WithDefault", .signature = "\x00\x02\x07\x0f\x11\x94\x89\x07" } },
    .{ "VariantToInt32WithDefault", MethodRecord{ .library = "PROPSYS", .import = "VariantToInt32WithDefault", .signature = "\x00\x02\x08\x0f\x11\x94\x89\x08" } },
    .{ "VariantToUInt32WithDefault", MethodRecord{ .library = "PROPSYS", .import = "VariantToUInt32WithDefault", .signature = "\x00\x02\x09\x0f\x11\x94\x89\x09" } },
    .{ "VariantToInt64WithDefault", MethodRecord{ .library = "PROPSYS", .import = "VariantToInt64WithDefault", .signature = "\x00\x02\x0a\x0f\x11\x94\x89\x0a" } },
    .{ "VariantToUInt64WithDefault", MethodRecord{ .library = "PROPSYS", .import = "VariantToUInt64WithDefault", .signature = "\x00\x02\x0b\x0f\x11\x94\x89\x0b" } },
    .{ "VariantToDoubleWithDefault", MethodRecord{ .library = "PROPSYS", .import = "VariantToDoubleWithDefault", .signature = "\x00\x02\x0d\x0f\x11\x94\x89\x0d" } },
    .{ "VariantToStringWithDefault", MethodRecord{ .library = "PROPSYS", .import = "VariantToStringWithDefault", .signature = "\x00\x02\x11\x05\x0f\x11\x94\x89\x11\x05" } },
    .{ "VariantToBoolean", MethodRecord{ .library = "PROPSYS", .import = "VariantToBoolean", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\x59" } },
    .{ "VariantToInt16", MethodRecord{ .library = "PROPSYS", .import = "VariantToInt16", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x06" } },
    .{ "VariantToUInt16", MethodRecord{ .library = "PROPSYS", .import = "VariantToUInt16", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x07" } },
    .{ "VariantToInt32", MethodRecord{ .library = "PROPSYS", .import = "VariantToInt32", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x08" } },
    .{ "VariantToUInt32", MethodRecord{ .library = "PROPSYS", .import = "VariantToUInt32", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x09" } },
    .{ "VariantToInt64", MethodRecord{ .library = "PROPSYS", .import = "VariantToInt64", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x0a" } },
    .{ "VariantToUInt64", MethodRecord{ .library = "PROPSYS", .import = "VariantToUInt64", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x0b" } },
    .{ "VariantToDouble", MethodRecord{ .library = "PROPSYS", .import = "VariantToDouble", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x0d" } },
    .{ "VariantToBuffer", MethodRecord{ .library = "PROPSYS", .import = "VariantToBuffer", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x01\x09" } },
    .{ "VariantToGUID", MethodRecord{ .library = "PROPSYS", .import = "VariantToGUID", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\x0d" } },
    .{ "VariantToString", MethodRecord{ .library = "PROPSYS", .import = "VariantToString", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x11\x05\x09" } },
    .{ "VariantToStringAlloc", MethodRecord{ .library = "PROPSYS", .import = "VariantToStringAlloc", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\x05" } },
    .{ "VariantToDosDateTime", MethodRecord{ .library = "PROPSYS", .import = "VariantToDosDateTime", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x07\x0f\x07" } },
    .{ "VariantToFileTime", MethodRecord{ .library = "PROPSYS", .import = "VariantToFileTime", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x11\xc0\x00\x40\x19\x0f\x11\x80\x9d" } },
    .{ "VariantGetElementCount", MethodRecord{ .library = "PROPSYS", .import = "VariantGetElementCount", .signature = "\x00\x01\x09\x0f\x11\x94\x89" } },
    .{ "VariantToBooleanArray", MethodRecord{ .library = "PROPSYS", .import = "VariantToBooleanArray", .signature = "\x00\x04\x11\x79\x0f\x11\x94\x89\x0f\x11\x59\x09\x0f\x09" } },
    .{ "VariantToInt16Array", MethodRecord{ .library = "PROPSYS", .import = "VariantToInt16Array", .signature = "\x00\x04\x11\x79\x0f\x11\x94\x89\x0f\x06\x09\x0f\x09" } },
    .{ "VariantToUInt16Array", MethodRecord{ .library = "PROPSYS", .import = "VariantToUInt16Array", .signature = "\x00\x04\x11\x79\x0f\x11\x94\x89\x0f\x07\x09\x0f\x09" } },
    .{ "VariantToInt32Array", MethodRecord{ .library = "PROPSYS", .import = "VariantToInt32Array", .signature = "\x00\x04\x11\x79\x0f\x11\x94\x89\x0f\x08\x09\x0f\x09" } },
    .{ "VariantToUInt32Array", MethodRecord{ .library = "PROPSYS", .import = "VariantToUInt32Array", .signature = "\x00\x04\x11\x79\x0f\x11\x94\x89\x0f\x09\x09\x0f\x09" } },
    .{ "VariantToInt64Array", MethodRecord{ .library = "PROPSYS", .import = "VariantToInt64Array", .signature = "\x00\x04\x11\x79\x0f\x11\x94\x89\x0f\x0a\x09\x0f\x09" } },
    .{ "VariantToUInt64Array", MethodRecord{ .library = "PROPSYS", .import = "VariantToUInt64Array", .signature = "\x00\x04\x11\x79\x0f\x11\x94\x89\x0f\x0b\x09\x0f\x09" } },
    .{ "VariantToDoubleArray", MethodRecord{ .library = "PROPSYS", .import = "VariantToDoubleArray", .signature = "\x00\x04\x11\x79\x0f\x11\x94\x89\x0f\x0d\x09\x0f\x09" } },
    .{ "VariantToStringArray", MethodRecord{ .library = "PROPSYS", .import = "VariantToStringArray", .signature = "\x00\x04\x11\x79\x0f\x11\x94\x89\x0f\x11\x05\x09\x0f\x09" } },
    .{ "VariantToBooleanArrayAlloc", MethodRecord{ .library = "PROPSYS", .import = "VariantToBooleanArrayAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x0f\x11\x59\x0f\x09" } },
    .{ "VariantToInt16ArrayAlloc", MethodRecord{ .library = "PROPSYS", .import = "VariantToInt16ArrayAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x0f\x06\x0f\x09" } },
    .{ "VariantToUInt16ArrayAlloc", MethodRecord{ .library = "PROPSYS", .import = "VariantToUInt16ArrayAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x0f\x07\x0f\x09" } },
    .{ "VariantToInt32ArrayAlloc", MethodRecord{ .library = "PROPSYS", .import = "VariantToInt32ArrayAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x0f\x08\x0f\x09" } },
    .{ "VariantToUInt32ArrayAlloc", MethodRecord{ .library = "PROPSYS", .import = "VariantToUInt32ArrayAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x0f\x09\x0f\x09" } },
    .{ "VariantToInt64ArrayAlloc", MethodRecord{ .library = "PROPSYS", .import = "VariantToInt64ArrayAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x0f\x0a\x0f\x09" } },
    .{ "VariantToUInt64ArrayAlloc", MethodRecord{ .library = "PROPSYS", .import = "VariantToUInt64ArrayAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x0f\x0b\x0f\x09" } },
    .{ "VariantToDoubleArrayAlloc", MethodRecord{ .library = "PROPSYS", .import = "VariantToDoubleArrayAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x0f\x0d\x0f\x09" } },
    .{ "VariantToStringArrayAlloc", MethodRecord{ .library = "PROPSYS", .import = "VariantToStringArrayAlloc", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x0f\x11\x05\x0f\x09" } },
    .{ "VariantGetBooleanElem", MethodRecord{ .library = "PROPSYS", .import = "VariantGetBooleanElem", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x09\x0f\x11\x59" } },
    .{ "VariantGetInt16Elem", MethodRecord{ .library = "PROPSYS", .import = "VariantGetInt16Elem", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x09\x0f\x06" } },
    .{ "VariantGetUInt16Elem", MethodRecord{ .library = "PROPSYS", .import = "VariantGetUInt16Elem", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x09\x0f\x07" } },
    .{ "VariantGetInt32Elem", MethodRecord{ .library = "PROPSYS", .import = "VariantGetInt32Elem", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x09\x0f\x08" } },
    .{ "VariantGetUInt32Elem", MethodRecord{ .library = "PROPSYS", .import = "VariantGetUInt32Elem", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x09\x0f\x09" } },
    .{ "VariantGetInt64Elem", MethodRecord{ .library = "PROPSYS", .import = "VariantGetInt64Elem", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x09\x0f\x0a" } },
    .{ "VariantGetUInt64Elem", MethodRecord{ .library = "PROPSYS", .import = "VariantGetUInt64Elem", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x09\x0f\x0b" } },
    .{ "VariantGetDoubleElem", MethodRecord{ .library = "PROPSYS", .import = "VariantGetDoubleElem", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x09\x0f\x0d" } },
    .{ "VariantGetStringElem", MethodRecord{ .library = "PROPSYS", .import = "VariantGetStringElem", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x09\x0f\x11\x05" } },
    .{ "ClearVariantArray", MethodRecord{ .library = "PROPSYS", .import = "ClearVariantArray", .signature = "\x00\x02\x01\x0f\x11\x94\x89\x09" } },
    .{ "VariantCompare", MethodRecord{ .library = "PROPSYS", .import = "VariantCompare", .signature = "\x00\x02\x08\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x645 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SYSTEMTIME" },
        0x1489 => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "VARIANT" },
        0x193d => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "VARENUM" },
        0x2335 => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "VAR_CHANGE_FLAGS" },
        0x4019 => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "PSTIME_FLAGS" },
        else => null,
    };
}

pub const VARIANT_NOVALUEPROP = 1;
pub const VARIANT_ALPHABOOL = 2;
pub const VARIANT_NOUSEROVERRIDE = 4;
pub const VARIANT_CALENDAR_HIJRI = 8;
pub const VARIANT_LOCALBOOL = 16;
pub const VARIANT_CALENDAR_THAI = 32;
pub const VARIANT_CALENDAR_GREGORIAN = 64;
pub const VARIANT_USE_NLS = 128;
pub const VT_EMPTY = 0;
pub const VT_NULL = 1;
pub const VT_I2 = 2;
pub const VT_I4 = 3;
pub const VT_R4 = 4;
pub const VT_R8 = 5;
pub const VT_CY = 6;
pub const VT_DATE = 7;
pub const VT_BSTR = 8;
pub const VT_DISPATCH = 9;
pub const VT_ERROR = 10;
pub const VT_BOOL = 11;
pub const VT_VARIANT = 12;
pub const VT_UNKNOWN = 13;
pub const VT_DECIMAL = 14;
pub const VT_I1 = 16;
pub const VT_UI1 = 17;
pub const VT_UI2 = 18;
pub const VT_UI4 = 19;
pub const VT_I8 = 20;
pub const VT_UI8 = 21;
pub const VT_INT = 22;
pub const VT_UINT = 23;
pub const VT_VOID = 24;
pub const VT_HRESULT = 25;
pub const VT_PTR = 26;
pub const VT_SAFEARRAY = 27;
pub const VT_CARRAY = 28;
pub const VT_USERDEFINED = 29;
pub const VT_LPSTR = 30;
pub const VT_LPWSTR = 31;
pub const VT_RECORD = 36;
pub const VT_INT_PTR = 37;
pub const VT_UINT_PTR = 38;
pub const VT_FILETIME = 64;
pub const VT_BLOB = 65;
pub const VT_STREAM = 66;
pub const VT_STORAGE = 67;
pub const VT_STREAMED_OBJECT = 68;
pub const VT_STORED_OBJECT = 69;
pub const VT_BLOB_OBJECT = 70;
pub const VT_CF = 71;
pub const VT_CLSID = 72;
pub const VT_VERSIONED_STREAM = 73;
pub const VT_BSTR_BLOB = 4095;
pub const VT_VECTOR = 4096;
pub const VT_ARRAY = 8192;
pub const VT_BYREF = 16384;
pub const VT_RESERVED = 32768;
pub const VT_ILLEGAL = 65535;
pub const VT_ILLEGALMASKED = 4095;
pub const VT_TYPEMASK = 4095;
pub const PSTF_UTC = 0;
pub const PSTF_LOCAL = 1;
pub const DPF_NONE = 0;
pub const DPF_MARQUEE = 1;
pub const DPF_MARQUEE_COMPLETE = 2;
pub const DPF_ERROR = 4;
pub const DPF_WARNING = 8;
pub const DPF_STOPPED = 16;

pub const aliases = struct {
    pub const VAR_CHANGE_FLAGS = u16;
    pub const VARENUM = u16;
    pub const PSTIME_FLAGS = i32;
    pub const DRAWPROGRESSFLAGS = i32;
};
