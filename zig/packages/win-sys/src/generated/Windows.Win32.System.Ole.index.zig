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
    .{ "SafeArrayAllocDescriptor", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayAllocDescriptor", .signature = "\x00\x02\x11\x79\x09\x0f\x0f\x11\x99\x39" } },
    .{ "SafeArrayAllocDescriptorEx", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayAllocDescriptorEx", .signature = "\x00\x03\x11\x79\x11\x99\x3d\x09\x0f\x0f\x11\x99\x39" } },
    .{ "SafeArrayAllocData", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayAllocData", .signature = "\x00\x01\x11\x79\x0f\x11\x99\x39" } },
    .{ "SafeArrayCreate", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayCreate", .signature = "\x00\x03\x0f\x11\x99\x39\x11\x99\x3d\x09\x0f\x11\x99\x41" } },
    .{ "SafeArrayCreateEx", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayCreateEx", .signature = "\x00\x04\x0f\x11\x99\x39\x11\x99\x3d\x09\x0f\x11\x99\x41\x0f\x01" } },
    .{ "SafeArrayCopyData", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayCopyData", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x39\x0f\x11\x99\x39" } },
    .{ "SafeArrayReleaseDescriptor", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayReleaseDescriptor", .signature = "\x00\x01\x01\x0f\x11\x99\x39" } },
    .{ "SafeArrayDestroyDescriptor", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayDestroyDescriptor", .signature = "\x00\x01\x11\x79\x0f\x11\x99\x39" } },
    .{ "SafeArrayReleaseData", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayReleaseData", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "SafeArrayDestroyData", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayDestroyData", .signature = "\x00\x01\x11\x79\x0f\x11\x99\x39" } },
    .{ "SafeArrayAddRef", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayAddRef", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x39\x0f\x0f\x01" } },
    .{ "SafeArrayDestroy", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayDestroy", .signature = "\x00\x01\x11\x79\x0f\x11\x99\x39" } },
    .{ "SafeArrayRedim", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayRedim", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x39\x0f\x11\x99\x41" } },
    .{ "SafeArrayGetDim", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayGetDim", .signature = "\x00\x01\x09\x0f\x11\x99\x39" } },
    .{ "SafeArrayGetElemsize", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayGetElemsize", .signature = "\x00\x01\x09\x0f\x11\x99\x39" } },
    .{ "SafeArrayGetUBound", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayGetUBound", .signature = "\x00\x03\x11\x79\x0f\x11\x99\x39\x09\x0f\x08" } },
    .{ "SafeArrayGetLBound", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayGetLBound", .signature = "\x00\x03\x11\x79\x0f\x11\x99\x39\x09\x0f\x08" } },
    .{ "SafeArrayLock", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayLock", .signature = "\x00\x01\x11\x79\x0f\x11\x99\x39" } },
    .{ "SafeArrayUnlock", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayUnlock", .signature = "\x00\x01\x11\x79\x0f\x11\x99\x39" } },
    .{ "SafeArrayAccessData", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayAccessData", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x39\x0f\x0f\x01" } },
    .{ "SafeArrayUnaccessData", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayUnaccessData", .signature = "\x00\x01\x11\x79\x0f\x11\x99\x39" } },
    .{ "SafeArrayGetElement", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayGetElement", .signature = "\x00\x03\x11\x79\x0f\x11\x99\x39\x0f\x08\x0f\x01" } },
    .{ "SafeArrayPutElement", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayPutElement", .signature = "\x00\x03\x11\x79\x0f\x11\x99\x39\x0f\x08\x0f\x01" } },
    .{ "SafeArrayCopy", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayCopy", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x39\x0f\x0f\x11\x99\x39" } },
    .{ "SafeArrayPtrOfIndex", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayPtrOfIndex", .signature = "\x00\x03\x11\x79\x0f\x11\x99\x39\x0f\x08\x0f\x0f\x01" } },
    .{ "SafeArraySetRecordInfo", MethodRecord{ .library = "OLEAUT32", .import = "SafeArraySetRecordInfo", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x39\x12\x99\x45" } },
    .{ "SafeArrayGetRecordInfo", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayGetRecordInfo", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x39\x0f\x12\x99\x45" } },
    .{ "SafeArraySetIID", MethodRecord{ .library = "OLEAUT32", .import = "SafeArraySetIID", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x39\x0f\x11\x0d" } },
    .{ "SafeArrayGetIID", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayGetIID", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x39\x0f\x11\x0d" } },
    .{ "SafeArrayGetVartype", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayGetVartype", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x39\x0f\x11\x99\x3d" } },
    .{ "SafeArrayCreateVector", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayCreateVector", .signature = "\x00\x03\x0f\x11\x99\x39\x11\x99\x3d\x08\x09" } },
    .{ "SafeArrayCreateVectorEx", MethodRecord{ .library = "OLEAUT32", .import = "SafeArrayCreateVectorEx", .signature = "\x00\x04\x0f\x11\x99\x39\x11\x99\x3d\x08\x09\x0f\x01" } },
    .{ "VectorFromBstr", MethodRecord{ .library = "OLEAUT32", .import = "VectorFromBstr", .signature = "\x00\x02\x11\x79\x11\x8d\x35\x0f\x0f\x11\x99\x39" } },
    .{ "BstrFromVector", MethodRecord{ .library = "OLEAUT32", .import = "BstrFromVector", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x39\x0f\x11\x8d\x35" } },
    .{ "VarUI1FromI2", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromI2", .signature = "\x00\x02\x11\x79\x06\x0f\x05" } },
    .{ "VarUI1FromI4", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromI4", .signature = "\x00\x02\x11\x79\x08\x0f\x05" } },
    .{ "VarUI1FromI8", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromI8", .signature = "\x00\x02\x11\x79\x0a\x0f\x05" } },
    .{ "VarUI1FromR4", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromR4", .signature = "\x00\x02\x11\x79\x0c\x0f\x05" } },
    .{ "VarUI1FromR8", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromR8", .signature = "\x00\x02\x11\x79\x0d\x0f\x05" } },
    .{ "VarUI1FromCy", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromCy", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x05" } },
    .{ "VarUI1FromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromDate", .signature = "\x00\x02\x11\x79\x0d\x0f\x05" } },
    .{ "VarUI1FromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromStr", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x05" } },
    .{ "VarUI1FromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromDisp", .signature = "\x00\x03\x11\x79\x12\x99\x4d\x09\x0f\x05" } },
    .{ "VarUI1FromBool", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromBool", .signature = "\x00\x02\x11\x79\x11\x8d\x31\x0f\x05" } },
    .{ "VarUI1FromI1", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromI1", .signature = "\x00\x02\x11\x79\x11\x8d\x5d\x0f\x05" } },
    .{ "VarUI1FromUI2", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromUI2", .signature = "\x00\x02\x11\x79\x07\x0f\x05" } },
    .{ "VarUI1FromUI4", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromUI4", .signature = "\x00\x02\x11\x79\x09\x0f\x05" } },
    .{ "VarUI1FromUI8", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromUI8", .signature = "\x00\x02\x11\x79\x0b\x0f\x05" } },
    .{ "VarUI1FromDec", MethodRecord{ .library = "OLEAUT32", .import = "VarUI1FromDec", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x05" } },
    .{ "VarI2FromUI1", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromUI1", .signature = "\x00\x02\x11\x79\x05\x0f\x06" } },
    .{ "VarI2FromI4", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromI4", .signature = "\x00\x02\x11\x79\x08\x0f\x06" } },
    .{ "VarI2FromI8", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromI8", .signature = "\x00\x02\x11\x79\x0a\x0f\x06" } },
    .{ "VarI2FromR4", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromR4", .signature = "\x00\x02\x11\x79\x0c\x0f\x06" } },
    .{ "VarI2FromR8", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromR8", .signature = "\x00\x02\x11\x79\x0d\x0f\x06" } },
    .{ "VarI2FromCy", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromCy", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x06" } },
    .{ "VarI2FromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromDate", .signature = "\x00\x02\x11\x79\x0d\x0f\x06" } },
    .{ "VarI2FromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromStr", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x06" } },
    .{ "VarI2FromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromDisp", .signature = "\x00\x03\x11\x79\x12\x99\x4d\x09\x0f\x06" } },
    .{ "VarI2FromBool", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromBool", .signature = "\x00\x02\x11\x79\x11\x8d\x31\x0f\x06" } },
    .{ "VarI2FromI1", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromI1", .signature = "\x00\x02\x11\x79\x11\x8d\x5d\x0f\x06" } },
    .{ "VarI2FromUI2", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromUI2", .signature = "\x00\x02\x11\x79\x07\x0f\x06" } },
    .{ "VarI2FromUI4", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromUI4", .signature = "\x00\x02\x11\x79\x09\x0f\x06" } },
    .{ "VarI2FromUI8", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromUI8", .signature = "\x00\x02\x11\x79\x0b\x0f\x06" } },
    .{ "VarI2FromDec", MethodRecord{ .library = "OLEAUT32", .import = "VarI2FromDec", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x06" } },
    .{ "VarI4FromUI1", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromUI1", .signature = "\x00\x02\x11\x79\x05\x0f\x08" } },
    .{ "VarI4FromI2", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromI2", .signature = "\x00\x02\x11\x79\x06\x0f\x08" } },
    .{ "VarI4FromI8", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromI8", .signature = "\x00\x02\x11\x79\x0a\x0f\x08" } },
    .{ "VarI4FromR4", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromR4", .signature = "\x00\x02\x11\x79\x0c\x0f\x08" } },
    .{ "VarI4FromR8", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromR8", .signature = "\x00\x02\x11\x79\x0d\x0f\x08" } },
    .{ "VarI4FromCy", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromCy", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x08" } },
    .{ "VarI4FromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromDate", .signature = "\x00\x02\x11\x79\x0d\x0f\x08" } },
    .{ "VarI4FromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromStr", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x08" } },
    .{ "VarI4FromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromDisp", .signature = "\x00\x03\x11\x79\x12\x99\x4d\x09\x0f\x08" } },
    .{ "VarI4FromBool", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromBool", .signature = "\x00\x02\x11\x79\x11\x8d\x31\x0f\x08" } },
    .{ "VarI4FromI1", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromI1", .signature = "\x00\x02\x11\x79\x11\x8d\x5d\x0f\x08" } },
    .{ "VarI4FromUI2", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromUI2", .signature = "\x00\x02\x11\x79\x07\x0f\x08" } },
    .{ "VarI4FromUI4", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromUI4", .signature = "\x00\x02\x11\x79\x09\x0f\x08" } },
    .{ "VarI4FromUI8", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromUI8", .signature = "\x00\x02\x11\x79\x0b\x0f\x08" } },
    .{ "VarI4FromDec", MethodRecord{ .library = "OLEAUT32", .import = "VarI4FromDec", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x08" } },
    .{ "VarI8FromUI1", MethodRecord{ .library = "OLEAUT32", .import = "VarI8FromUI1", .signature = "\x00\x02\x11\x79\x05\x0f\x0a" } },
    .{ "VarI8FromI2", MethodRecord{ .library = "OLEAUT32", .import = "VarI8FromI2", .signature = "\x00\x02\x11\x79\x06\x0f\x0a" } },
    .{ "VarI8FromR4", MethodRecord{ .library = "OLEAUT32", .import = "VarI8FromR4", .signature = "\x00\x02\x11\x79\x0c\x0f\x0a" } },
    .{ "VarI8FromR8", MethodRecord{ .library = "OLEAUT32", .import = "VarI8FromR8", .signature = "\x00\x02\x11\x79\x0d\x0f\x0a" } },
    .{ "VarI8FromCy", MethodRecord{ .library = "OLEAUT32", .import = "VarI8FromCy", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x0a" } },
    .{ "VarI8FromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarI8FromDate", .signature = "\x00\x02\x11\x79\x0d\x0f\x0a" } },
    .{ "VarI8FromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarI8FromStr", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x0a" } },
    .{ "VarI8FromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarI8FromDisp", .signature = "\x00\x03\x11\x79\x12\x99\x4d\x09\x0f\x0a" } },
    .{ "VarI8FromBool", MethodRecord{ .library = "OLEAUT32", .import = "VarI8FromBool", .signature = "\x00\x02\x11\x79\x11\x8d\x31\x0f\x0a" } },
    .{ "VarI8FromI1", MethodRecord{ .library = "OLEAUT32", .import = "VarI8FromI1", .signature = "\x00\x02\x11\x79\x11\x8d\x5d\x0f\x0a" } },
    .{ "VarI8FromUI2", MethodRecord{ .library = "OLEAUT32", .import = "VarI8FromUI2", .signature = "\x00\x02\x11\x79\x07\x0f\x0a" } },
    .{ "VarI8FromUI4", MethodRecord{ .library = "OLEAUT32", .import = "VarI8FromUI4", .signature = "\x00\x02\x11\x79\x09\x0f\x0a" } },
    .{ "VarI8FromUI8", MethodRecord{ .library = "OLEAUT32", .import = "VarI8FromUI8", .signature = "\x00\x02\x11\x79\x0b\x0f\x0a" } },
    .{ "VarI8FromDec", MethodRecord{ .library = "OLEAUT32", .import = "VarI8FromDec", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x0a" } },
    .{ "VarR4FromUI1", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromUI1", .signature = "\x00\x02\x11\x79\x05\x0f\x0c" } },
    .{ "VarR4FromI2", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromI2", .signature = "\x00\x02\x11\x79\x06\x0f\x0c" } },
    .{ "VarR4FromI4", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromI4", .signature = "\x00\x02\x11\x79\x08\x0f\x0c" } },
    .{ "VarR4FromI8", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromI8", .signature = "\x00\x02\x11\x79\x0a\x0f\x0c" } },
    .{ "VarR4FromR8", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromR8", .signature = "\x00\x02\x11\x79\x0d\x0f\x0c" } },
    .{ "VarR4FromCy", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromCy", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x0c" } },
    .{ "VarR4FromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromDate", .signature = "\x00\x02\x11\x79\x0d\x0f\x0c" } },
    .{ "VarR4FromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromStr", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x0c" } },
    .{ "VarR4FromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromDisp", .signature = "\x00\x03\x11\x79\x12\x99\x4d\x09\x0f\x0c" } },
    .{ "VarR4FromBool", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromBool", .signature = "\x00\x02\x11\x79\x11\x8d\x31\x0f\x0c" } },
    .{ "VarR4FromI1", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromI1", .signature = "\x00\x02\x11\x79\x11\x8d\x5d\x0f\x0c" } },
    .{ "VarR4FromUI2", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromUI2", .signature = "\x00\x02\x11\x79\x07\x0f\x0c" } },
    .{ "VarR4FromUI4", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromUI4", .signature = "\x00\x02\x11\x79\x09\x0f\x0c" } },
    .{ "VarR4FromUI8", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromUI8", .signature = "\x00\x02\x11\x79\x0b\x0f\x0c" } },
    .{ "VarR4FromDec", MethodRecord{ .library = "OLEAUT32", .import = "VarR4FromDec", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x0c" } },
    .{ "VarR8FromUI1", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromUI1", .signature = "\x00\x02\x11\x79\x05\x0f\x0d" } },
    .{ "VarR8FromI2", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromI2", .signature = "\x00\x02\x11\x79\x06\x0f\x0d" } },
    .{ "VarR8FromI4", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromI4", .signature = "\x00\x02\x11\x79\x08\x0f\x0d" } },
    .{ "VarR8FromI8", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromI8", .signature = "\x00\x02\x11\x79\x0a\x0f\x0d" } },
    .{ "VarR8FromR4", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromR4", .signature = "\x00\x02\x11\x79\x0c\x0f\x0d" } },
    .{ "VarR8FromCy", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromCy", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x0d" } },
    .{ "VarR8FromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromDate", .signature = "\x00\x02\x11\x79\x0d\x0f\x0d" } },
    .{ "VarR8FromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromStr", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x0d" } },
    .{ "VarR8FromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromDisp", .signature = "\x00\x03\x11\x79\x12\x99\x4d\x09\x0f\x0d" } },
    .{ "VarR8FromBool", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromBool", .signature = "\x00\x02\x11\x79\x11\x8d\x31\x0f\x0d" } },
    .{ "VarR8FromI1", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromI1", .signature = "\x00\x02\x11\x79\x11\x8d\x5d\x0f\x0d" } },
    .{ "VarR8FromUI2", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromUI2", .signature = "\x00\x02\x11\x79\x07\x0f\x0d" } },
    .{ "VarR8FromUI4", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromUI4", .signature = "\x00\x02\x11\x79\x09\x0f\x0d" } },
    .{ "VarR8FromUI8", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromUI8", .signature = "\x00\x02\x11\x79\x0b\x0f\x0d" } },
    .{ "VarR8FromDec", MethodRecord{ .library = "OLEAUT32", .import = "VarR8FromDec", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x0d" } },
    .{ "VarDateFromUI1", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromUI1", .signature = "\x00\x02\x11\x79\x05\x0f\x0d" } },
    .{ "VarDateFromI2", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromI2", .signature = "\x00\x02\x11\x79\x06\x0f\x0d" } },
    .{ "VarDateFromI4", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromI4", .signature = "\x00\x02\x11\x79\x08\x0f\x0d" } },
    .{ "VarDateFromI8", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromI8", .signature = "\x00\x02\x11\x79\x0a\x0f\x0d" } },
    .{ "VarDateFromR4", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromR4", .signature = "\x00\x02\x11\x79\x0c\x0f\x0d" } },
    .{ "VarDateFromR8", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromR8", .signature = "\x00\x02\x11\x79\x0d\x0f\x0d" } },
    .{ "VarDateFromCy", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromCy", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x0d" } },
    .{ "VarDateFromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromStr", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x0d" } },
    .{ "VarDateFromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromDisp", .signature = "\x00\x03\x11\x79\x12\x99\x4d\x09\x0f\x0d" } },
    .{ "VarDateFromBool", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromBool", .signature = "\x00\x02\x11\x79\x11\x8d\x31\x0f\x0d" } },
    .{ "VarDateFromI1", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromI1", .signature = "\x00\x02\x11\x79\x11\x8d\x5d\x0f\x0d" } },
    .{ "VarDateFromUI2", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromUI2", .signature = "\x00\x02\x11\x79\x07\x0f\x0d" } },
    .{ "VarDateFromUI4", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromUI4", .signature = "\x00\x02\x11\x79\x09\x0f\x0d" } },
    .{ "VarDateFromUI8", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromUI8", .signature = "\x00\x02\x11\x79\x0b\x0f\x0d" } },
    .{ "VarDateFromDec", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromDec", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x0d" } },
    .{ "VarCyFromUI1", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromUI1", .signature = "\x00\x02\x11\x79\x05\x0f\x11\x99\x49" } },
    .{ "VarCyFromI2", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromI2", .signature = "\x00\x02\x11\x79\x06\x0f\x11\x99\x49" } },
    .{ "VarCyFromI4", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromI4", .signature = "\x00\x02\x11\x79\x08\x0f\x11\x99\x49" } },
    .{ "VarCyFromI8", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromI8", .signature = "\x00\x02\x11\x79\x0a\x0f\x11\x99\x49" } },
    .{ "VarCyFromR4", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromR4", .signature = "\x00\x02\x11\x79\x0c\x0f\x11\x99\x49" } },
    .{ "VarCyFromR8", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromR8", .signature = "\x00\x02\x11\x79\x0d\x0f\x11\x99\x49" } },
    .{ "VarCyFromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromDate", .signature = "\x00\x02\x11\x79\x0d\x0f\x11\x99\x49" } },
    .{ "VarCyFromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromStr", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x11\x99\x49" } },
    .{ "VarCyFromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromDisp", .signature = "\x00\x03\x11\x79\x12\x99\x4d\x09\x0f\x11\x99\x49" } },
    .{ "VarCyFromBool", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromBool", .signature = "\x00\x02\x11\x79\x11\x8d\x31\x0f\x11\x99\x49" } },
    .{ "VarCyFromI1", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromI1", .signature = "\x00\x02\x11\x79\x11\x8d\x5d\x0f\x11\x99\x49" } },
    .{ "VarCyFromUI2", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromUI2", .signature = "\x00\x02\x11\x79\x07\x0f\x11\x99\x49" } },
    .{ "VarCyFromUI4", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromUI4", .signature = "\x00\x02\x11\x79\x09\x0f\x11\x99\x49" } },
    .{ "VarCyFromUI8", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromUI8", .signature = "\x00\x02\x11\x79\x0b\x0f\x11\x99\x49" } },
    .{ "VarCyFromDec", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFromDec", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x11\x99\x49" } },
    .{ "VarBstrFromUI1", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromUI1", .signature = "\x00\x04\x11\x79\x05\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBstrFromI2", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromI2", .signature = "\x00\x04\x11\x79\x06\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBstrFromI4", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromI4", .signature = "\x00\x04\x11\x79\x08\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBstrFromI8", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromI8", .signature = "\x00\x04\x11\x79\x0a\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBstrFromR4", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromR4", .signature = "\x00\x04\x11\x79\x0c\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBstrFromR8", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromR8", .signature = "\x00\x04\x11\x79\x0d\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBstrFromCy", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromCy", .signature = "\x00\x04\x11\x79\x11\x99\x49\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBstrFromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromDate", .signature = "\x00\x04\x11\x79\x0d\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBstrFromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromDisp", .signature = "\x00\x04\x11\x79\x12\x99\x4d\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBstrFromBool", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromBool", .signature = "\x00\x04\x11\x79\x11\x8d\x31\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBstrFromI1", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromI1", .signature = "\x00\x04\x11\x79\x11\x8d\x5d\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBstrFromUI2", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromUI2", .signature = "\x00\x04\x11\x79\x07\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBstrFromUI4", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromUI4", .signature = "\x00\x04\x11\x79\x09\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBstrFromUI8", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromUI8", .signature = "\x00\x04\x11\x79\x0b\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBstrFromDec", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrFromDec", .signature = "\x00\x04\x11\x79\x0f\x11\x99\x51\x09\x09\x0f\x11\x8d\x35" } },
    .{ "VarBoolFromUI1", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromUI1", .signature = "\x00\x02\x11\x79\x05\x0f\x11\x8d\x31" } },
    .{ "VarBoolFromI2", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromI2", .signature = "\x00\x02\x11\x79\x06\x0f\x11\x8d\x31" } },
    .{ "VarBoolFromI4", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromI4", .signature = "\x00\x02\x11\x79\x08\x0f\x11\x8d\x31" } },
    .{ "VarBoolFromI8", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromI8", .signature = "\x00\x02\x11\x79\x0a\x0f\x11\x8d\x31" } },
    .{ "VarBoolFromR4", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromR4", .signature = "\x00\x02\x11\x79\x0c\x0f\x11\x8d\x31" } },
    .{ "VarBoolFromR8", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromR8", .signature = "\x00\x02\x11\x79\x0d\x0f\x11\x8d\x31" } },
    .{ "VarBoolFromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromDate", .signature = "\x00\x02\x11\x79\x0d\x0f\x11\x8d\x31" } },
    .{ "VarBoolFromCy", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromCy", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x11\x8d\x31" } },
    .{ "VarBoolFromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromStr", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x11\x8d\x31" } },
    .{ "VarBoolFromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromDisp", .signature = "\x00\x03\x11\x79\x12\x99\x4d\x09\x0f\x11\x8d\x31" } },
    .{ "VarBoolFromI1", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromI1", .signature = "\x00\x02\x11\x79\x11\x8d\x5d\x0f\x11\x8d\x31" } },
    .{ "VarBoolFromUI2", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromUI2", .signature = "\x00\x02\x11\x79\x07\x0f\x11\x8d\x31" } },
    .{ "VarBoolFromUI4", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromUI4", .signature = "\x00\x02\x11\x79\x09\x0f\x11\x8d\x31" } },
    .{ "VarBoolFromUI8", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromUI8", .signature = "\x00\x02\x11\x79\x0b\x0f\x11\x8d\x31" } },
    .{ "VarBoolFromDec", MethodRecord{ .library = "OLEAUT32", .import = "VarBoolFromDec", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x11\x8d\x31" } },
    .{ "VarI1FromUI1", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromUI1", .signature = "\x00\x02\x11\x79\x05\x11\x3d" } },
    .{ "VarI1FromI2", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromI2", .signature = "\x00\x02\x11\x79\x06\x11\x3d" } },
    .{ "VarI1FromI4", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromI4", .signature = "\x00\x02\x11\x79\x08\x11\x3d" } },
    .{ "VarI1FromI8", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromI8", .signature = "\x00\x02\x11\x79\x0a\x11\x3d" } },
    .{ "VarI1FromR4", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromR4", .signature = "\x00\x02\x11\x79\x0c\x11\x3d" } },
    .{ "VarI1FromR8", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromR8", .signature = "\x00\x02\x11\x79\x0d\x11\x3d" } },
    .{ "VarI1FromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromDate", .signature = "\x00\x02\x11\x79\x0d\x11\x3d" } },
    .{ "VarI1FromCy", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromCy", .signature = "\x00\x02\x11\x79\x11\x99\x49\x11\x3d" } },
    .{ "VarI1FromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromStr", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x11\x3d" } },
    .{ "VarI1FromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromDisp", .signature = "\x00\x03\x11\x79\x12\x99\x4d\x09\x11\x3d" } },
    .{ "VarI1FromBool", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromBool", .signature = "\x00\x02\x11\x79\x11\x8d\x31\x11\x3d" } },
    .{ "VarI1FromUI2", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromUI2", .signature = "\x00\x02\x11\x79\x07\x11\x3d" } },
    .{ "VarI1FromUI4", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromUI4", .signature = "\x00\x02\x11\x79\x09\x11\x3d" } },
    .{ "VarI1FromUI8", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromUI8", .signature = "\x00\x02\x11\x79\x0b\x11\x3d" } },
    .{ "VarI1FromDec", MethodRecord{ .library = "OLEAUT32", .import = "VarI1FromDec", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x11\x3d" } },
    .{ "VarUI2FromUI1", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromUI1", .signature = "\x00\x02\x11\x79\x05\x0f\x07" } },
    .{ "VarUI2FromI2", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromI2", .signature = "\x00\x02\x11\x79\x06\x0f\x07" } },
    .{ "VarUI2FromI4", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromI4", .signature = "\x00\x02\x11\x79\x08\x0f\x07" } },
    .{ "VarUI2FromI8", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromI8", .signature = "\x00\x02\x11\x79\x0a\x0f\x07" } },
    .{ "VarUI2FromR4", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromR4", .signature = "\x00\x02\x11\x79\x0c\x0f\x07" } },
    .{ "VarUI2FromR8", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromR8", .signature = "\x00\x02\x11\x79\x0d\x0f\x07" } },
    .{ "VarUI2FromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromDate", .signature = "\x00\x02\x11\x79\x0d\x0f\x07" } },
    .{ "VarUI2FromCy", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromCy", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x07" } },
    .{ "VarUI2FromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromStr", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x07" } },
    .{ "VarUI2FromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromDisp", .signature = "\x00\x03\x11\x79\x12\x99\x4d\x09\x0f\x07" } },
    .{ "VarUI2FromBool", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromBool", .signature = "\x00\x02\x11\x79\x11\x8d\x31\x0f\x07" } },
    .{ "VarUI2FromI1", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromI1", .signature = "\x00\x02\x11\x79\x11\x8d\x5d\x0f\x07" } },
    .{ "VarUI2FromUI4", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromUI4", .signature = "\x00\x02\x11\x79\x09\x0f\x07" } },
    .{ "VarUI2FromUI8", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromUI8", .signature = "\x00\x02\x11\x79\x0b\x0f\x07" } },
    .{ "VarUI2FromDec", MethodRecord{ .library = "OLEAUT32", .import = "VarUI2FromDec", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x07" } },
    .{ "VarUI4FromUI1", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromUI1", .signature = "\x00\x02\x11\x79\x05\x0f\x09" } },
    .{ "VarUI4FromI2", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromI2", .signature = "\x00\x02\x11\x79\x06\x0f\x09" } },
    .{ "VarUI4FromI4", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromI4", .signature = "\x00\x02\x11\x79\x08\x0f\x09" } },
    .{ "VarUI4FromI8", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromI8", .signature = "\x00\x02\x11\x79\x0a\x0f\x09" } },
    .{ "VarUI4FromR4", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromR4", .signature = "\x00\x02\x11\x79\x0c\x0f\x09" } },
    .{ "VarUI4FromR8", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromR8", .signature = "\x00\x02\x11\x79\x0d\x0f\x09" } },
    .{ "VarUI4FromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromDate", .signature = "\x00\x02\x11\x79\x0d\x0f\x09" } },
    .{ "VarUI4FromCy", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromCy", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x09" } },
    .{ "VarUI4FromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromStr", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x09" } },
    .{ "VarUI4FromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromDisp", .signature = "\x00\x03\x11\x79\x12\x99\x4d\x09\x0f\x09" } },
    .{ "VarUI4FromBool", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromBool", .signature = "\x00\x02\x11\x79\x11\x8d\x31\x0f\x09" } },
    .{ "VarUI4FromI1", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromI1", .signature = "\x00\x02\x11\x79\x11\x8d\x5d\x0f\x09" } },
    .{ "VarUI4FromUI2", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromUI2", .signature = "\x00\x02\x11\x79\x07\x0f\x09" } },
    .{ "VarUI4FromUI8", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromUI8", .signature = "\x00\x02\x11\x79\x0b\x0f\x09" } },
    .{ "VarUI4FromDec", MethodRecord{ .library = "OLEAUT32", .import = "VarUI4FromDec", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x09" } },
    .{ "VarUI8FromUI1", MethodRecord{ .library = "OLEAUT32", .import = "VarUI8FromUI1", .signature = "\x00\x02\x11\x79\x05\x0f\x0b" } },
    .{ "VarUI8FromI2", MethodRecord{ .library = "OLEAUT32", .import = "VarUI8FromI2", .signature = "\x00\x02\x11\x79\x06\x0f\x0b" } },
    .{ "VarUI8FromI8", MethodRecord{ .library = "OLEAUT32", .import = "VarUI8FromI8", .signature = "\x00\x02\x11\x79\x0a\x0f\x0b" } },
    .{ "VarUI8FromR4", MethodRecord{ .library = "OLEAUT32", .import = "VarUI8FromR4", .signature = "\x00\x02\x11\x79\x0c\x0f\x0b" } },
    .{ "VarUI8FromR8", MethodRecord{ .library = "OLEAUT32", .import = "VarUI8FromR8", .signature = "\x00\x02\x11\x79\x0d\x0f\x0b" } },
    .{ "VarUI8FromCy", MethodRecord{ .library = "OLEAUT32", .import = "VarUI8FromCy", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x0b" } },
    .{ "VarUI8FromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarUI8FromDate", .signature = "\x00\x02\x11\x79\x0d\x0f\x0b" } },
    .{ "VarUI8FromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarUI8FromStr", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x0b" } },
    .{ "VarUI8FromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarUI8FromDisp", .signature = "\x00\x03\x11\x79\x12\x99\x4d\x09\x0f\x0b" } },
    .{ "VarUI8FromBool", MethodRecord{ .library = "OLEAUT32", .import = "VarUI8FromBool", .signature = "\x00\x02\x11\x79\x11\x8d\x31\x0f\x0b" } },
    .{ "VarUI8FromI1", MethodRecord{ .library = "OLEAUT32", .import = "VarUI8FromI1", .signature = "\x00\x02\x11\x79\x11\x8d\x5d\x0f\x0b" } },
    .{ "VarUI8FromUI2", MethodRecord{ .library = "OLEAUT32", .import = "VarUI8FromUI2", .signature = "\x00\x02\x11\x79\x07\x0f\x0b" } },
    .{ "VarUI8FromUI4", MethodRecord{ .library = "OLEAUT32", .import = "VarUI8FromUI4", .signature = "\x00\x02\x11\x79\x09\x0f\x0b" } },
    .{ "VarUI8FromDec", MethodRecord{ .library = "OLEAUT32", .import = "VarUI8FromDec", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x0b" } },
    .{ "VarDecFromUI1", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromUI1", .signature = "\x00\x02\x11\x79\x05\x0f\x11\x99\x51" } },
    .{ "VarDecFromI2", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromI2", .signature = "\x00\x02\x11\x79\x06\x0f\x11\x99\x51" } },
    .{ "VarDecFromI4", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromI4", .signature = "\x00\x02\x11\x79\x08\x0f\x11\x99\x51" } },
    .{ "VarDecFromI8", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromI8", .signature = "\x00\x02\x11\x79\x0a\x0f\x11\x99\x51" } },
    .{ "VarDecFromR4", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromR4", .signature = "\x00\x02\x11\x79\x0c\x0f\x11\x99\x51" } },
    .{ "VarDecFromR8", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromR8", .signature = "\x00\x02\x11\x79\x0d\x0f\x11\x99\x51" } },
    .{ "VarDecFromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromDate", .signature = "\x00\x02\x11\x79\x0d\x0f\x11\x99\x51" } },
    .{ "VarDecFromCy", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromCy", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x11\x99\x51" } },
    .{ "VarDecFromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromStr", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x11\x99\x51" } },
    .{ "VarDecFromDisp", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromDisp", .signature = "\x00\x03\x11\x79\x12\x99\x4d\x09\x0f\x11\x99\x51" } },
    .{ "VarDecFromBool", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromBool", .signature = "\x00\x02\x11\x79\x11\x8d\x31\x0f\x11\x99\x51" } },
    .{ "VarDecFromI1", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromI1", .signature = "\x00\x02\x11\x79\x11\x8d\x5d\x0f\x11\x99\x51" } },
    .{ "VarDecFromUI2", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromUI2", .signature = "\x00\x02\x11\x79\x07\x0f\x11\x99\x51" } },
    .{ "VarDecFromUI4", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromUI4", .signature = "\x00\x02\x11\x79\x09\x0f\x11\x99\x51" } },
    .{ "VarDecFromUI8", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFromUI8", .signature = "\x00\x02\x11\x79\x0b\x0f\x11\x99\x51" } },
    .{ "VarParseNumFromStr", MethodRecord{ .library = "OLEAUT32", .import = "VarParseNumFromStr", .signature = "\x00\x05\x11\x79\x11\x05\x09\x09\x0f\x11\x99\x55\x0f\x05" } },
    .{ "VarNumFromParseNum", MethodRecord{ .library = "OLEAUT32", .import = "VarNumFromParseNum", .signature = "\x00\x04\x11\x79\x0f\x11\x99\x55\x0f\x05\x09\x0f\x11\x94\x89" } },
    .{ "VarAdd", MethodRecord{ .library = "OLEAUT32", .import = "VarAdd", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarAnd", MethodRecord{ .library = "OLEAUT32", .import = "VarAnd", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarCat", MethodRecord{ .library = "OLEAUT32", .import = "VarCat", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarDiv", MethodRecord{ .library = "OLEAUT32", .import = "VarDiv", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarEqv", MethodRecord{ .library = "OLEAUT32", .import = "VarEqv", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarIdiv", MethodRecord{ .library = "OLEAUT32", .import = "VarIdiv", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarImp", MethodRecord{ .library = "OLEAUT32", .import = "VarImp", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarMod", MethodRecord{ .library = "OLEAUT32", .import = "VarMod", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarMul", MethodRecord{ .library = "OLEAUT32", .import = "VarMul", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarOr", MethodRecord{ .library = "OLEAUT32", .import = "VarOr", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarPow", MethodRecord{ .library = "OLEAUT32", .import = "VarPow", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarSub", MethodRecord{ .library = "OLEAUT32", .import = "VarSub", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarXor", MethodRecord{ .library = "OLEAUT32", .import = "VarXor", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarAbs", MethodRecord{ .library = "OLEAUT32", .import = "VarAbs", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarFix", MethodRecord{ .library = "OLEAUT32", .import = "VarFix", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarInt", MethodRecord{ .library = "OLEAUT32", .import = "VarInt", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarNeg", MethodRecord{ .library = "OLEAUT32", .import = "VarNeg", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarNot", MethodRecord{ .library = "OLEAUT32", .import = "VarNot", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "VarRound", MethodRecord{ .library = "OLEAUT32", .import = "VarRound", .signature = "\x00\x03\x11\x79\x0f\x11\x94\x89\x08\x0f\x11\x94\x89" } },
    .{ "VarCmp", MethodRecord{ .library = "OLEAUT32", .import = "VarCmp", .signature = "\x00\x04\x11\x99\x59\x0f\x11\x94\x89\x0f\x11\x94\x89\x09\x09" } },
    .{ "VarDecAdd", MethodRecord{ .library = "OLEAUT32", .import = "VarDecAdd", .signature = "\x00\x03\x11\x79\x0f\x11\x99\x51\x0f\x11\x99\x51\x0f\x11\x99\x51" } },
    .{ "VarDecDiv", MethodRecord{ .library = "OLEAUT32", .import = "VarDecDiv", .signature = "\x00\x03\x11\x79\x0f\x11\x99\x51\x0f\x11\x99\x51\x0f\x11\x99\x51" } },
    .{ "VarDecMul", MethodRecord{ .library = "OLEAUT32", .import = "VarDecMul", .signature = "\x00\x03\x11\x79\x0f\x11\x99\x51\x0f\x11\x99\x51\x0f\x11\x99\x51" } },
    .{ "VarDecSub", MethodRecord{ .library = "OLEAUT32", .import = "VarDecSub", .signature = "\x00\x03\x11\x79\x0f\x11\x99\x51\x0f\x11\x99\x51\x0f\x11\x99\x51" } },
    .{ "VarDecAbs", MethodRecord{ .library = "OLEAUT32", .import = "VarDecAbs", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x11\x99\x51" } },
    .{ "VarDecFix", MethodRecord{ .library = "OLEAUT32", .import = "VarDecFix", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x11\x99\x51" } },
    .{ "VarDecInt", MethodRecord{ .library = "OLEAUT32", .import = "VarDecInt", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x11\x99\x51" } },
    .{ "VarDecNeg", MethodRecord{ .library = "OLEAUT32", .import = "VarDecNeg", .signature = "\x00\x02\x11\x79\x0f\x11\x99\x51\x0f\x11\x99\x51" } },
    .{ "VarDecRound", MethodRecord{ .library = "OLEAUT32", .import = "VarDecRound", .signature = "\x00\x03\x11\x79\x0f\x11\x99\x51\x08\x0f\x11\x99\x51" } },
    .{ "VarDecCmp", MethodRecord{ .library = "OLEAUT32", .import = "VarDecCmp", .signature = "\x00\x02\x11\x99\x59\x0f\x11\x99\x51\x0f\x11\x99\x51" } },
    .{ "VarDecCmpR8", MethodRecord{ .library = "OLEAUT32", .import = "VarDecCmpR8", .signature = "\x00\x02\x11\x99\x59\x0f\x11\x99\x51\x0d" } },
    .{ "VarCyAdd", MethodRecord{ .library = "OLEAUT32", .import = "VarCyAdd", .signature = "\x00\x03\x11\x79\x11\x99\x49\x11\x99\x49\x0f\x11\x99\x49" } },
    .{ "VarCyMul", MethodRecord{ .library = "OLEAUT32", .import = "VarCyMul", .signature = "\x00\x03\x11\x79\x11\x99\x49\x11\x99\x49\x0f\x11\x99\x49" } },
    .{ "VarCyMulI4", MethodRecord{ .library = "OLEAUT32", .import = "VarCyMulI4", .signature = "\x00\x03\x11\x79\x11\x99\x49\x08\x0f\x11\x99\x49" } },
    .{ "VarCyMulI8", MethodRecord{ .library = "OLEAUT32", .import = "VarCyMulI8", .signature = "\x00\x03\x11\x79\x11\x99\x49\x0a\x0f\x11\x99\x49" } },
    .{ "VarCySub", MethodRecord{ .library = "OLEAUT32", .import = "VarCySub", .signature = "\x00\x03\x11\x79\x11\x99\x49\x11\x99\x49\x0f\x11\x99\x49" } },
    .{ "VarCyAbs", MethodRecord{ .library = "OLEAUT32", .import = "VarCyAbs", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x11\x99\x49" } },
    .{ "VarCyFix", MethodRecord{ .library = "OLEAUT32", .import = "VarCyFix", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x11\x99\x49" } },
    .{ "VarCyInt", MethodRecord{ .library = "OLEAUT32", .import = "VarCyInt", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x11\x99\x49" } },
    .{ "VarCyNeg", MethodRecord{ .library = "OLEAUT32", .import = "VarCyNeg", .signature = "\x00\x02\x11\x79\x11\x99\x49\x0f\x11\x99\x49" } },
    .{ "VarCyRound", MethodRecord{ .library = "OLEAUT32", .import = "VarCyRound", .signature = "\x00\x03\x11\x79\x11\x99\x49\x08\x0f\x11\x99\x49" } },
    .{ "VarCyCmp", MethodRecord{ .library = "OLEAUT32", .import = "VarCyCmp", .signature = "\x00\x02\x11\x99\x59\x11\x99\x49\x11\x99\x49" } },
    .{ "VarCyCmpR8", MethodRecord{ .library = "OLEAUT32", .import = "VarCyCmpR8", .signature = "\x00\x02\x11\x99\x59\x11\x99\x49\x0d" } },
    .{ "VarBstrCat", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrCat", .signature = "\x00\x03\x11\x79\x11\x8d\x35\x11\x8d\x35\x0f\x11\x8d\x35" } },
    .{ "VarBstrCmp", MethodRecord{ .library = "OLEAUT32", .import = "VarBstrCmp", .signature = "\x00\x04\x11\x79\x11\x8d\x35\x11\x8d\x35\x09\x09" } },
    .{ "VarR8Pow", MethodRecord{ .library = "OLEAUT32", .import = "VarR8Pow", .signature = "\x00\x03\x11\x79\x0d\x0d\x0f\x0d" } },
    .{ "VarR4CmpR8", MethodRecord{ .library = "OLEAUT32", .import = "VarR4CmpR8", .signature = "\x00\x02\x11\x99\x59\x0c\x0d" } },
    .{ "VarR8Round", MethodRecord{ .library = "OLEAUT32", .import = "VarR8Round", .signature = "\x00\x03\x11\x79\x0d\x08\x0f\x0d" } },
    .{ "VarDateFromUdate", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromUdate", .signature = "\x00\x03\x11\x79\x0f\x11\x99\x5d\x09\x0f\x0d" } },
    .{ "VarDateFromUdateEx", MethodRecord{ .library = "OLEAUT32", .import = "VarDateFromUdateEx", .signature = "\x00\x04\x11\x79\x0f\x11\x99\x5d\x09\x09\x0f\x0d" } },
    .{ "VarUdateFromDate", MethodRecord{ .library = "OLEAUT32", .import = "VarUdateFromDate", .signature = "\x00\x03\x11\x79\x0d\x09\x0f\x11\x99\x5d" } },
    .{ "GetAltMonthNames", MethodRecord{ .library = "OLEAUT32", .import = "GetAltMonthNames", .signature = "\x00\x02\x11\x79\x09\x0f\x0f\x11\x05" } },
    .{ "VarFormat", MethodRecord{ .library = "OLEAUT32", .import = "VarFormat", .signature = "\x00\x06\x11\x79\x0f\x11\x94\x89\x11\x05\x11\x99\x61\x11\x99\x65\x09\x0f\x11\x8d\x35" } },
    .{ "VarFormatDateTime", MethodRecord{ .library = "OLEAUT32", .import = "VarFormatDateTime", .signature = "\x00\x04\x11\x79\x0f\x11\x94\x89\x11\x99\x69\x09\x0f\x11\x8d\x35" } },
    .{ "VarFormatNumber", MethodRecord{ .library = "OLEAUT32", .import = "VarFormatNumber", .signature = "\x00\x07\x11\x79\x0f\x11\x94\x89\x08\x11\x99\x6d\x11\x99\x71\x11\x99\x75\x09\x0f\x11\x8d\x35" } },
    .{ "VarFormatPercent", MethodRecord{ .library = "OLEAUT32", .import = "VarFormatPercent", .signature = "\x00\x07\x11\x79\x0f\x11\x94\x89\x08\x11\x99\x6d\x11\x99\x71\x11\x99\x75\x09\x0f\x11\x8d\x35" } },
    .{ "VarFormatCurrency", MethodRecord{ .library = "OLEAUT32", .import = "VarFormatCurrency", .signature = "\x00\x07\x11\x79\x0f\x11\x94\x89\x08\x08\x08\x08\x09\x0f\x11\x8d\x35" } },
    .{ "VarWeekdayName", MethodRecord{ .library = "OLEAUT32", .import = "VarWeekdayName", .signature = "\x00\x05\x11\x79\x08\x08\x08\x09\x0f\x11\x8d\x35" } },
    .{ "VarMonthName", MethodRecord{ .library = "OLEAUT32", .import = "VarMonthName", .signature = "\x00\x04\x11\x79\x08\x08\x09\x0f\x11\x8d\x35" } },
    .{ "VarFormatFromTokens", MethodRecord{ .library = "OLEAUT32", .import = "VarFormatFromTokens", .signature = "\x00\x06\x11\x79\x0f\x11\x94\x89\x11\x05\x0f\x05\x09\x0f\x11\x8d\x35\x09" } },
    .{ "VarTokenizeFormatString", MethodRecord{ .library = "OLEAUT32", .import = "VarTokenizeFormatString", .signature = "\x00\x07\x11\x79\x11\x05\x0f\x05\x08\x11\x99\x61\x11\x99\x65\x09\x0f\x08" } },
    .{ "LHashValOfNameSysA", MethodRecord{ .library = "OLEAUT32", .import = "LHashValOfNameSysA", .signature = "\x00\x03\x09\x11\x99\x79\x09\x11\x3d" } },
    .{ "LHashValOfNameSys", MethodRecord{ .library = "OLEAUT32", .import = "LHashValOfNameSys", .signature = "\x00\x03\x09\x11\x99\x79\x09\x11\x05" } },
    .{ "LoadTypeLib", MethodRecord{ .library = "OLEAUT32", .import = "LoadTypeLib", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x12\x99\x7d" } },
    .{ "LoadTypeLibEx", MethodRecord{ .library = "OLEAUT32", .import = "LoadTypeLibEx", .signature = "\x00\x03\x11\x79\x11\x05\x11\x99\x81\x0f\x12\x99\x7d" } },
    .{ "LoadRegTypeLib", MethodRecord{ .library = "OLEAUT32", .import = "LoadRegTypeLib", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x07\x07\x09\x0f\x12\x99\x7d" } },
    .{ "QueryPathOfRegTypeLib", MethodRecord{ .library = "OLEAUT32", .import = "QueryPathOfRegTypeLib", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x07\x07\x09\x0f\x11\x8d\x35" } },
    .{ "RegisterTypeLib", MethodRecord{ .library = "OLEAUT32", .import = "RegisterTypeLib", .signature = "\x00\x03\x11\x79\x12\x99\x7d\x11\x05\x11\x05" } },
    .{ "UnRegisterTypeLib", MethodRecord{ .library = "OLEAUT32", .import = "UnRegisterTypeLib", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x07\x07\x09\x11\x99\x79" } },
    .{ "RegisterTypeLibForUser", MethodRecord{ .library = "OLEAUT32", .import = "RegisterTypeLibForUser", .signature = "\x00\x03\x11\x79\x12\x99\x7d\x11\x05\x11\x05" } },
    .{ "UnRegisterTypeLibForUser", MethodRecord{ .library = "OLEAUT32", .import = "UnRegisterTypeLibForUser", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x07\x07\x09\x11\x99\x79" } },
    .{ "CreateTypeLib", MethodRecord{ .library = "OLEAUT32", .import = "CreateTypeLib", .signature = "\x00\x03\x11\x79\x11\x99\x79\x11\x05\x0f\x12\x99\x85" } },
    .{ "CreateTypeLib2", MethodRecord{ .library = "OLEAUT32", .import = "CreateTypeLib2", .signature = "\x00\x03\x11\x79\x11\x99\x79\x11\x05\x0f\x12\x99\x89" } },
    .{ "DispGetParam", MethodRecord{ .library = "OLEAUT32", .import = "DispGetParam", .signature = "\x00\x05\x11\x79\x0f\x11\x99\x8d\x09\x11\x99\x3d\x0f\x11\x94\x89\x0f\x09" } },
    .{ "DispGetIDsOfNames", MethodRecord{ .library = "OLEAUT32", .import = "DispGetIDsOfNames", .signature = "\x00\x04\x11\x79\x12\x99\x91\x0f\x11\x05\x09\x0f\x08" } },
    .{ "DispInvoke", MethodRecord{ .library = "OLEAUT32", .import = "DispInvoke", .signature = "\x00\x08\x11\x79\x0f\x01\x12\x99\x91\x08\x07\x0f\x11\x99\x8d\x0f\x11\x94\x89\x0f\x11\x99\x95\x0f\x09" } },
    .{ "CreateDispTypeInfo", MethodRecord{ .library = "OLEAUT32", .import = "CreateDispTypeInfo", .signature = "\x00\x03\x11\x79\x0f\x11\x99\x99\x09\x0f\x12\x99\x91" } },
    .{ "CreateStdDispatch", MethodRecord{ .library = "OLEAUT32", .import = "CreateStdDispatch", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x0f\x01\x12\x99\x91\x0f\x12\x82\xb1" } },
    .{ "DispCallFunc", MethodRecord{ .library = "OLEAUT32", .import = "DispCallFunc", .signature = "\x00\x08\x11\x79\x0f\x01\x19\x11\x99\x9d\x11\x99\x3d\x09\x0f\x07\x0f\x0f\x11\x94\x89\x0f\x11\x94\x89" } },
    .{ "RegisterActiveObject", MethodRecord{ .library = "OLEAUT32", .import = "RegisterActiveObject", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x0f\x11\x0d\x11\x99\xa1\x0f\x09" } },
    .{ "RevokeActiveObject", MethodRecord{ .library = "OLEAUT32", .import = "RevokeActiveObject", .signature = "\x00\x02\x11\x79\x09\x0f\x01" } },
    .{ "GetActiveObject", MethodRecord{ .library = "OLEAUT32", .import = "GetActiveObject", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x01\x0f\x12\x82\xb1" } },
    .{ "CreateErrorInfo", MethodRecord{ .library = "OLEAUT32", .import = "CreateErrorInfo", .signature = "\x00\x01\x11\x79\x0f\x12\x99\xa5" } },
    .{ "GetRecordInfoFromTypeInfo", MethodRecord{ .library = "OLEAUT32", .import = "GetRecordInfoFromTypeInfo", .signature = "\x00\x02\x11\x79\x12\x99\x91\x0f\x12\x99\x45" } },
    .{ "GetRecordInfoFromGuids", MethodRecord{ .library = "OLEAUT32", .import = "GetRecordInfoFromGuids", .signature = "\x00\x06\x11\x79\x0f\x11\x0d\x09\x09\x09\x0f\x11\x0d\x0f\x12\x99\x45" } },
    .{ "OaBuildVersion", MethodRecord{ .library = "OLEAUT32", .import = "OaBuildVersion", .signature = "\x00\x00\x09" } },
    .{ "ClearCustData", MethodRecord{ .library = "OLEAUT32", .import = "ClearCustData", .signature = "\x00\x01\x01\x0f\x11\x99\xa9" } },
    .{ "OaEnablePerUserTLibRegistration", MethodRecord{ .library = "OLEAUT32", .import = "OaEnablePerUserTLibRegistration", .signature = "\x00\x00\x01" } },
    .{ "OleBuildVersion", MethodRecord{ .library = "ole32", .import = "OleBuildVersion", .signature = "\x00\x00\x09" } },
    .{ "OleInitialize", MethodRecord{ .library = "OLE32", .import = "OleInitialize", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "OleUninitialize", MethodRecord{ .library = "OLE32", .import = "OleUninitialize", .signature = "\x00\x00\x01" } },
    .{ "OleQueryLinkFromData", MethodRecord{ .library = "OLE32", .import = "OleQueryLinkFromData", .signature = "\x00\x01\x11\x79\x12\x99\xad" } },
    .{ "OleQueryCreateFromData", MethodRecord{ .library = "OLE32", .import = "OleQueryCreateFromData", .signature = "\x00\x01\x11\x79\x12\x99\xad" } },
    .{ "OleCreate", MethodRecord{ .library = "OLE32", .import = "OleCreate", .signature = "\x00\x07\x11\x79\x0f\x11\x0d\x0f\x11\x0d\x09\x0f\x11\x99\xb1\x12\x99\xb5\x12\x99\xb9\x0f\x0f\x01" } },
    .{ "OleCreateEx", MethodRecord{ .library = "ole32", .import = "OleCreateEx", .signature = "\x00\x0c\x11\x79\x0f\x11\x0d\x0f\x11\x0d\x11\x99\xbd\x09\x09\x0f\x09\x0f\x11\x99\xb1\x12\x99\xc1\x0f\x09\x12\x99\xb5\x12\x99\xb9\x0f\x0f\x01" } },
    .{ "OleCreateFromData", MethodRecord{ .library = "OLE32", .import = "OleCreateFromData", .signature = "\x00\x07\x11\x79\x12\x99\xad\x0f\x11\x0d\x09\x0f\x11\x99\xb1\x12\x99\xb5\x12\x99\xb9\x0f\x0f\x01" } },
    .{ "OleCreateFromDataEx", MethodRecord{ .library = "ole32", .import = "OleCreateFromDataEx", .signature = "\x00\x0c\x11\x79\x12\x99\xad\x0f\x11\x0d\x11\x99\xbd\x09\x09\x0f\x09\x0f\x11\x99\xb1\x12\x99\xc1\x0f\x09\x12\x99\xb5\x12\x99\xb9\x0f\x0f\x01" } },
    .{ "OleCreateLinkFromData", MethodRecord{ .library = "OLE32", .import = "OleCreateLinkFromData", .signature = "\x00\x07\x11\x79\x12\x99\xad\x0f\x11\x0d\x09\x0f\x11\x99\xb1\x12\x99\xb5\x12\x99\xb9\x0f\x0f\x01" } },
    .{ "OleCreateLinkFromDataEx", MethodRecord{ .library = "ole32", .import = "OleCreateLinkFromDataEx", .signature = "\x00\x0c\x11\x79\x12\x99\xad\x0f\x11\x0d\x11\x99\xbd\x09\x09\x0f\x09\x0f\x11\x99\xb1\x12\x99\xc1\x0f\x09\x12\x99\xb5\x12\x99\xb9\x0f\x0f\x01" } },
    .{ "OleCreateStaticFromData", MethodRecord{ .library = "OLE32", .import = "OleCreateStaticFromData", .signature = "\x00\x07\x11\x79\x12\x99\xad\x0f\x11\x0d\x09\x0f\x11\x99\xb1\x12\x99\xb5\x12\x99\xb9\x0f\x0f\x01" } },
    .{ "OleCreateLink", MethodRecord{ .library = "ole32", .import = "OleCreateLink", .signature = "\x00\x07\x11\x79\x12\x82\xc9\x0f\x11\x0d\x09\x0f\x11\x99\xb1\x12\x99\xb5\x12\x99\xb9\x0f\x0f\x01" } },
    .{ "OleCreateLinkEx", MethodRecord{ .library = "ole32", .import = "OleCreateLinkEx", .signature = "\x00\x0c\x11\x79\x12\x82\xc9\x0f\x11\x0d\x11\x99\xbd\x09\x09\x0f\x09\x0f\x11\x99\xb1\x12\x99\xc1\x0f\x09\x12\x99\xb5\x12\x99\xb9\x0f\x0f\x01" } },
    .{ "OleCreateLinkToFile", MethodRecord{ .library = "OLE32", .import = "OleCreateLinkToFile", .signature = "\x00\x07\x11\x79\x11\x05\x0f\x11\x0d\x09\x0f\x11\x99\xb1\x12\x99\xb5\x12\x99\xb9\x0f\x0f\x01" } },
    .{ "OleCreateLinkToFileEx", MethodRecord{ .library = "ole32", .import = "OleCreateLinkToFileEx", .signature = "\x00\x0c\x11\x79\x11\x05\x0f\x11\x0d\x11\x99\xbd\x09\x09\x0f\x09\x0f\x11\x99\xb1\x12\x99\xc1\x0f\x09\x12\x99\xb5\x12\x99\xb9\x0f\x0f\x01" } },
    .{ "OleCreateFromFile", MethodRecord{ .library = "OLE32", .import = "OleCreateFromFile", .signature = "\x00\x08\x11\x79\x0f\x11\x0d\x11\x05\x0f\x11\x0d\x09\x0f\x11\x99\xb1\x12\x99\xb5\x12\x99\xb9\x0f\x0f\x01" } },
    .{ "OleCreateFromFileEx", MethodRecord{ .library = "ole32", .import = "OleCreateFromFileEx", .signature = "\x00\x0d\x11\x79\x0f\x11\x0d\x11\x05\x0f\x11\x0d\x11\x99\xbd\x09\x09\x0f\x09\x0f\x11\x99\xb1\x12\x99\xc1\x0f\x09\x12\x99\xb5\x12\x99\xb9\x0f\x0f\x01" } },
    .{ "OleLoad", MethodRecord{ .library = "OLE32", .import = "OleLoad", .signature = "\x00\x04\x11\x79\x12\x99\xb9\x0f\x11\x0d\x12\x99\xb5\x0f\x0f\x01" } },
    .{ "OleSave", MethodRecord{ .library = "OLE32", .import = "OleSave", .signature = "\x00\x03\x11\x79\x12\x99\xc5\x12\x99\xb9\x11\x59" } },
    .{ "OleLoadFromStream", MethodRecord{ .library = "OLE32", .import = "OleLoadFromStream", .signature = "\x00\x03\x11\x79\x12\x83\x75\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "OleSaveToStream", MethodRecord{ .library = "OLE32", .import = "OleSaveToStream", .signature = "\x00\x02\x11\x79\x12\x99\xc9\x12\x83\x75" } },
    .{ "OleSetContainedObject", MethodRecord{ .library = "OLE32", .import = "OleSetContainedObject", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x11\x59" } },
    .{ "OleNoteObjectVisible", MethodRecord{ .library = "ole32", .import = "OleNoteObjectVisible", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x11\x59" } },
    .{ "RegisterDragDrop", MethodRecord{ .library = "OLE32", .import = "RegisterDragDrop", .signature = "\x00\x02\x11\x79\x11\x25\x12\x99\xcd" } },
    .{ "RevokeDragDrop", MethodRecord{ .library = "OLE32", .import = "RevokeDragDrop", .signature = "\x00\x01\x11\x79\x11\x25" } },
    .{ "DoDragDrop", MethodRecord{ .library = "OLE32", .import = "DoDragDrop", .signature = "\x00\x04\x11\x79\x12\x99\xad\x12\x99\xd1\x11\x99\xd5\x0f\x11\x99\xd5" } },
    .{ "OleSetClipboard", MethodRecord{ .library = "OLE32", .import = "OleSetClipboard", .signature = "\x00\x01\x11\x79\x12\x99\xad" } },
    .{ "OleGetClipboard", MethodRecord{ .library = "OLE32", .import = "OleGetClipboard", .signature = "\x00\x01\x11\x79\x0f\x12\x99\xad" } },
    .{ "OleGetClipboardWithEnterpriseInfo", MethodRecord{ .library = "ole32", .import = "OleGetClipboardWithEnterpriseInfo", .signature = "\x00\x05\x11\x79\x0f\x12\x99\xad\x0f\x11\x05\x0f\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "OleFlushClipboard", MethodRecord{ .library = "OLE32", .import = "OleFlushClipboard", .signature = "\x00\x00\x11\x79" } },
    .{ "OleIsCurrentClipboard", MethodRecord{ .library = "OLE32", .import = "OleIsCurrentClipboard", .signature = "\x00\x01\x11\x79\x12\x99\xad" } },
    .{ "OleCreateMenuDescriptor", MethodRecord{ .library = "OLE32", .import = "OleCreateMenuDescriptor", .signature = "\x00\x02\x18\x11\x83\x91\x0f\x11\x99\xd9" } },
    .{ "OleSetMenuDescriptor", MethodRecord{ .library = "OLE32", .import = "OleSetMenuDescriptor", .signature = "\x00\x05\x11\x79\x18\x11\x25\x11\x25\x12\x99\xdd\x12\x99\xe1" } },
    .{ "OleDestroyMenuDescriptor", MethodRecord{ .library = "OLE32", .import = "OleDestroyMenuDescriptor", .signature = "\x00\x01\x11\x79\x18" } },
    .{ "OleTranslateAccelerator", MethodRecord{ .library = "OLE32", .import = "OleTranslateAccelerator", .signature = "\x00\x03\x11\x79\x12\x99\xdd\x0f\x11\x99\xe5\x0f\x11\x99\xe9" } },
    .{ "OleDuplicateData", MethodRecord{ .library = "OLE32", .import = "OleDuplicateData", .signature = "\x00\x03\x11\x80\x85\x11\x80\x85\x11\x99\xed\x11\x99\xf1" } },
    .{ "OleDraw", MethodRecord{ .library = "OLE32", .import = "OleDraw", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x09\x11\x83\x5d\x0f\x11\x83\x89" } },
    .{ "OleRun", MethodRecord{ .library = "OLE32", .import = "OleRun", .signature = "\x00\x01\x11\x79\x12\x82\xb1" } },
    .{ "OleIsRunning", MethodRecord{ .library = "OLE32", .import = "OleIsRunning", .signature = "\x00\x01\x11\x59\x12\x99\xf5" } },
    .{ "OleLockRunning", MethodRecord{ .library = "OLE32", .import = "OleLockRunning", .signature = "\x00\x03\x11\x79\x12\x82\xb1\x11\x59\x11\x59" } },
    .{ "ReleaseStgMedium", MethodRecord{ .library = "OLE32", .import = "ReleaseStgMedium", .signature = "\x00\x01\x01\x0f\x11\x99\xf9" } },
    .{ "CreateOleAdviseHolder", MethodRecord{ .library = "OLE32", .import = "CreateOleAdviseHolder", .signature = "\x00\x01\x11\x79\x0f\x12\x99\xfd" } },
    .{ "OleCreateDefaultHandler", MethodRecord{ .library = "ole32", .import = "OleCreateDefaultHandler", .signature = "\x00\x04\x11\x79\x0f\x11\x0d\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "OleCreateEmbeddingHelper", MethodRecord{ .library = "OLE32", .import = "OleCreateEmbeddingHelper", .signature = "\x00\x06\x11\x79\x0f\x11\x0d\x12\x82\xb1\x11\x9a\x01\x12\x96\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "IsAccelerator", MethodRecord{ .library = "OLE32", .import = "IsAccelerator", .signature = "\x00\x04\x11\x59\x11\x9a\x05\x08\x0f\x11\x99\xe9\x0f\x07" } },
    .{ "OleGetIconOfFile", MethodRecord{ .library = "ole32", .import = "OleGetIconOfFile", .signature = "\x00\x02\x11\x8d\x39\x11\x05\x11\x59" } },
    .{ "OleGetIconOfClass", MethodRecord{ .library = "OLE32", .import = "OleGetIconOfClass", .signature = "\x00\x03\x11\x8d\x39\x0f\x11\x0d\x11\x05\x11\x59" } },
    .{ "OleMetafilePictFromIconAndLabel", MethodRecord{ .library = "ole32", .import = "OleMetafilePictFromIconAndLabel", .signature = "\x00\x04\x11\x8d\x39\x11\x83\x55\x11\x05\x11\x05\x09" } },
    .{ "OleRegGetUserType", MethodRecord{ .library = "OLE32", .import = "OleRegGetUserType", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x09\x0f\x11\x05" } },
    .{ "OleRegGetMiscStatus", MethodRecord{ .library = "OLE32", .import = "OleRegGetMiscStatus", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x09\x0f\x09" } },
    .{ "OleRegEnumFormatEtc", MethodRecord{ .library = "ole32", .import = "OleRegEnumFormatEtc", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x09\x0f\x12\x9a\x09" } },
    .{ "OleRegEnumVerbs", MethodRecord{ .library = "OLE32", .import = "OleRegEnumVerbs", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x12\x9a\x0d" } },
    .{ "OleConvertOLESTREAMToIStorage2", MethodRecord{ .library = "ole32", .import = "OleConvertOLESTREAMToIStorage2", .signature = "\x00\x06\x11\x79\x0f\x11\x9a\x11\x12\x99\xb9\x0f\x11\x9a\x15\x09\x0f\x01\x12\x9a\x19" } },
    .{ "OleDoAutoConvert", MethodRecord{ .library = "ole32", .import = "OleDoAutoConvert", .signature = "\x00\x02\x11\x79\x12\x99\xb9\x0f\x11\x0d" } },
    .{ "OleGetAutoConvert", MethodRecord{ .library = "OLE32", .import = "OleGetAutoConvert", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x0d" } },
    .{ "OleSetAutoConvert", MethodRecord{ .library = "ole32", .import = "OleSetAutoConvert", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x0d" } },
    .{ "OleConvertOLESTREAMToIStorageEx2", MethodRecord{ .library = "ole32", .import = "OleConvertOLESTREAMToIStorageEx2", .signature = "\x00\x0a\x11\x79\x0f\x11\x9a\x11\x12\x99\xb9\x0f\x07\x0f\x08\x0f\x08\x0f\x09\x0f\x11\x99\xf9\x09\x0f\x01\x12\x9a\x19" } },
    .{ "HRGN_UserSize", MethodRecord{ .library = "OLE32", .import = "HRGN_UserSize", .signature = "\x00\x03\x09\x0f\x09\x09\x0f\x11\x83\xe1" } },
    .{ "HRGN_UserMarshal", MethodRecord{ .library = "OLE32", .import = "HRGN_UserMarshal", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\x83\xe1" } },
    .{ "HRGN_UserUnmarshal", MethodRecord{ .library = "OLE32", .import = "HRGN_UserUnmarshal", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\x83\xe1" } },
    .{ "HRGN_UserFree", MethodRecord{ .library = "OLE32", .import = "HRGN_UserFree", .signature = "\x00\x02\x01\x0f\x09\x0f\x11\x83\xe1" } },
    .{ "HRGN_UserSize64", MethodRecord{ .library = "api-ms-win-core-marshal-l1-1-0", .import = "HRGN_UserSize64", .signature = "\x00\x03\x09\x0f\x09\x09\x0f\x11\x83\xe1" } },
    .{ "HRGN_UserMarshal64", MethodRecord{ .library = "api-ms-win-core-marshal-l1-1-0", .import = "HRGN_UserMarshal64", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\x83\xe1" } },
    .{ "HRGN_UserUnmarshal64", MethodRecord{ .library = "api-ms-win-core-marshal-l1-1-0", .import = "HRGN_UserUnmarshal64", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\x83\xe1" } },
    .{ "HRGN_UserFree64", MethodRecord{ .library = "api-ms-win-core-marshal-l1-1-0", .import = "HRGN_UserFree64", .signature = "\x00\x02\x01\x0f\x09\x0f\x11\x83\xe1" } },
    .{ "OleCreatePropertyFrame", MethodRecord{ .library = "OLEAUT32", .import = "OleCreatePropertyFrame", .signature = "\x00\x0b\x11\x79\x11\x25\x09\x09\x11\x05\x09\x0f\x12\x82\xb1\x09\x0f\x11\x0d\x09\x09\x0f\x01" } },
    .{ "OleCreatePropertyFrameIndirect", MethodRecord{ .library = "OLEAUT32", .import = "OleCreatePropertyFrameIndirect", .signature = "\x00\x01\x11\x79\x0f\x11\x9a\x1d" } },
    .{ "OleTranslateColor", MethodRecord{ .library = "OLEAUT32", .import = "OleTranslateColor", .signature = "\x00\x03\x11\x79\x09\x11\x8d\x65\x0f\x11\x83\x59" } },
    .{ "OleCreateFontIndirect", MethodRecord{ .library = "OLEAUT32", .import = "OleCreateFontIndirect", .signature = "\x00\x03\x11\x79\x0f\x11\x9a\x21\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "OleCreatePictureIndirect", MethodRecord{ .library = "OLEAUT32", .import = "OleCreatePictureIndirect", .signature = "\x00\x04\x11\x79\x0f\x11\x9a\x25\x0f\x11\x0d\x11\x59\x0f\x0f\x01" } },
    .{ "OleLoadPicture", MethodRecord{ .library = "OLEAUT32", .import = "OleLoadPicture", .signature = "\x00\x05\x11\x79\x12\x83\x75\x08\x11\x59\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "OleLoadPictureEx", MethodRecord{ .library = "OLEAUT32", .import = "OleLoadPictureEx", .signature = "\x00\x08\x11\x79\x12\x83\x75\x08\x11\x59\x0f\x11\x0d\x09\x09\x11\x9a\x29\x0f\x0f\x01" } },
    .{ "OleLoadPicturePath", MethodRecord{ .library = "OLEAUT32", .import = "OleLoadPicturePath", .signature = "\x00\x06\x11\x79\x11\x05\x12\x82\xb1\x09\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "OleLoadPictureFile", MethodRecord{ .library = "OLEAUT32", .import = "OleLoadPictureFile", .signature = "\x00\x02\x11\x79\x11\x94\x89\x0f\x12\x99\x4d" } },
    .{ "OleLoadPictureFileEx", MethodRecord{ .library = "OLEAUT32", .import = "OleLoadPictureFileEx", .signature = "\x00\x05\x11\x79\x11\x94\x89\x09\x09\x11\x9a\x29\x0f\x12\x99\x4d" } },
    .{ "OleSavePictureFile", MethodRecord{ .library = "OLEAUT32", .import = "OleSavePictureFile", .signature = "\x00\x02\x11\x79\x12\x99\x4d\x11\x8d\x35" } },
    .{ "OleIconToCursor", MethodRecord{ .library = "OLEAUT32", .import = "OleIconToCursor", .signature = "\x00\x02\x11\x9a\x2d\x11\x82\x29\x11\x83\x55" } },
    .{ "OleUIAddVerbMenuW", MethodRecord{ .library = "oledlg", .import = "OleUIAddVerbMenuW", .signature = "\x00\x09\x11\x59\x12\x99\xf5\x11\x05\x11\x83\x91\x09\x09\x09\x11\x59\x09\x0f\x11\x83\x91" } },
    .{ "OleUIAddVerbMenuA", MethodRecord{ .library = "oledlg", .import = "OleUIAddVerbMenuA", .signature = "\x00\x09\x11\x59\x12\x99\xf5\x11\x3d\x11\x83\x91\x09\x09\x09\x11\x59\x09\x0f\x11\x83\x91" } },
    .{ "OleUIInsertObjectW", MethodRecord{ .library = "oledlg", .import = "OleUIInsertObjectW", .signature = "\x00\x01\x09\x0f\x11\x9a\x31" } },
    .{ "OleUIInsertObjectA", MethodRecord{ .library = "oledlg", .import = "OleUIInsertObjectA", .signature = "\x00\x01\x09\x0f\x11\x9a\x35" } },
    .{ "OleUIPasteSpecialW", MethodRecord{ .library = "oledlg", .import = "OleUIPasteSpecialW", .signature = "\x00\x01\x09\x0f\x11\x9a\x39" } },
    .{ "OleUIPasteSpecialA", MethodRecord{ .library = "oledlg", .import = "OleUIPasteSpecialA", .signature = "\x00\x01\x09\x0f\x11\x9a\x3d" } },
    .{ "OleUIEditLinksW", MethodRecord{ .library = "oledlg", .import = "OleUIEditLinksW", .signature = "\x00\x01\x09\x0f\x11\x9a\x41" } },
    .{ "OleUIEditLinksA", MethodRecord{ .library = "oledlg", .import = "OleUIEditLinksA", .signature = "\x00\x01\x09\x0f\x11\x9a\x45" } },
    .{ "OleUIChangeIconW", MethodRecord{ .library = "oledlg", .import = "OleUIChangeIconW", .signature = "\x00\x01\x09\x0f\x11\x9a\x49" } },
    .{ "OleUIChangeIconA", MethodRecord{ .library = "oledlg", .import = "OleUIChangeIconA", .signature = "\x00\x01\x09\x0f\x11\x9a\x4d" } },
    .{ "OleUIConvertW", MethodRecord{ .library = "oledlg", .import = "OleUIConvertW", .signature = "\x00\x01\x09\x0f\x11\x9a\x51" } },
    .{ "OleUIConvertA", MethodRecord{ .library = "oledlg", .import = "OleUIConvertA", .signature = "\x00\x01\x09\x0f\x11\x9a\x55" } },
    .{ "OleUICanConvertOrActivateAs", MethodRecord{ .library = "oledlg", .import = "OleUICanConvertOrActivateAs", .signature = "\x00\x03\x11\x59\x0f\x11\x0d\x11\x59\x07" } },
    .{ "OleUIBusyW", MethodRecord{ .library = "oledlg", .import = "OleUIBusyW", .signature = "\x00\x01\x09\x0f\x11\x9a\x59" } },
    .{ "OleUIBusyA", MethodRecord{ .library = "oledlg", .import = "OleUIBusyA", .signature = "\x00\x01\x09\x0f\x11\x9a\x5d" } },
    .{ "OleUIChangeSourceW", MethodRecord{ .library = "oledlg", .import = "OleUIChangeSourceW", .signature = "\x00\x01\x09\x0f\x11\x9a\x61" } },
    .{ "OleUIChangeSourceA", MethodRecord{ .library = "oledlg", .import = "OleUIChangeSourceA", .signature = "\x00\x01\x09\x0f\x11\x9a\x65" } },
    .{ "OleUIObjectPropertiesW", MethodRecord{ .library = "oledlg", .import = "OleUIObjectPropertiesW", .signature = "\x00\x01\x09\x0f\x11\x9a\x69" } },
    .{ "OleUIObjectPropertiesA", MethodRecord{ .library = "oledlg", .import = "OleUIObjectPropertiesA", .signature = "\x00\x01\x09\x0f\x11\x9a\x6d" } },
    .{ "OleUIPromptUserW", MethodRecord{ .library = "oledlg", .import = "OleUIPromptUserW", .signature = "\x05\x02\x08\x08\x11\x25" } },
    .{ "OleUIPromptUserA", MethodRecord{ .library = "oledlg", .import = "OleUIPromptUserA", .signature = "\x05\x02\x08\x08\x11\x25" } },
    .{ "OleUIUpdateLinksW", MethodRecord{ .library = "oledlg", .import = "OleUIUpdateLinksW", .signature = "\x00\x04\x11\x59\x12\x9a\x71\x11\x25\x11\x05\x08" } },
    .{ "OleUIUpdateLinksA", MethodRecord{ .library = "oledlg", .import = "OleUIUpdateLinksA", .signature = "\x00\x04\x11\x59\x12\x9a\x75\x11\x25\x11\x3d\x08" } },
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
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x2c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IMoniker" },
        0x355 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HICON" },
        0x359 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "COLORREF" },
        0x35d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HDC" },
        0x375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IStream" },
        0x389 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "RECT" },
        0x391 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HMENU" },
        0x3e1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HRGN" },
        0xd31 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "VARIANT_BOOL" },
        0xd35 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BSTR" },
        0xd39 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HGLOBAL" },
        0xd5d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "CHAR" },
        0xd65 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HPALETTE" },
        0x1489 => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "VARIANT" },
        0x1609 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IClassFactory" },
        0x1939 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "SAFEARRAY" },
        0x193d => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "VARENUM" },
        0x1941 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "SAFEARRAYBOUND" },
        0x1945 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "IRecordInfo" },
        0x1949 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "CY" },
        0x194d => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IDispatch" },
        0x1951 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "DECIMAL" },
        0x1955 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "NUMPARSE" },
        0x1959 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "VARCMP" },
        0x195d => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "UDATE" },
        0x1961 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "VARFORMAT_FIRST_DAY" },
        0x1965 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "VARFORMAT_FIRST_WEEK" },
        0x1969 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "VARFORMAT_NAMED_FORMAT" },
        0x196d => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "VARFORMAT_LEADING_DIGIT" },
        0x1971 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "VARFORMAT_PARENTHESES" },
        0x1975 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "VARFORMAT_GROUP" },
        0x1979 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "SYSKIND" },
        0x197d => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "ITypeLib" },
        0x1981 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "REGKIND" },
        0x1985 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "ICreateTypeLib" },
        0x1989 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "ICreateTypeLib2" },
        0x198d => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "DISPPARAMS" },
        0x1991 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "ITypeInfo" },
        0x1995 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "EXCEPINFO" },
        0x1999 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "INTERFACEDATA" },
        0x199d => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "CALLCONV" },
        0x19a1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "ACTIVEOBJECT_FLAGS" },
        0x19a5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "ICreateErrorInfo" },
        0x19a9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "CUSTDATA" },
        0x19ad => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IDataObject" },
        0x19b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "FORMATETC" },
        0x19b5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "IOleClientSite" },
        0x19b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "IStorage" },
        0x19bd => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLECREATE" },
        0x19c1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IAdviseSink" },
        0x19c5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "IPersistStorage" },
        0x19c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IPersistStream" },
        0x19cd => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "IDropTarget" },
        0x19d1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "IDropSource" },
        0x19d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "DROPEFFECT" },
        0x19d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEMENUGROUPWIDTHS" },
        0x19dd => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "IOleInPlaceFrame" },
        0x19e1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "IOleInPlaceActiveObject" },
        0x19e5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEINPLACEFRAMEINFO" },
        0x19e9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MSG" },
        0x19ed => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "CLIPBOARD_FORMAT" },
        0x19f1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "GLOBAL_ALLOC_FLAGS" },
        0x19f5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "IOleObject" },
        0x19f9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "STGMEDIUM" },
        0x19fd => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "IOleAdviseHolder" },
        0x1a01 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "EMBDHLP_FLAGS" },
        0x1a05 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HACCEL" },
        0x1a09 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IEnumFORMATETC" },
        0x1a0d => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "IEnumOLEVERB" },
        0x1a11 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "OLESTREAM" },
        0x1a15 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "DVTARGETDEVICE" },
        0x1a19 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLESTREAMQUERYCONVERTOLELINKCALLBACK" },
        0x1a1d => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OCPFIPARAMS" },
        0x1a21 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "FONTDESC" },
        0x1a25 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "PICTDESC" },
        0x1a29 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "LOAD_PICTURE_FLAGS" },
        0x1a2d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HCURSOR" },
        0x1a31 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUIINSERTOBJECTW" },
        0x1a35 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUIINSERTOBJECTA" },
        0x1a39 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUIPASTESPECIALW" },
        0x1a3d => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUIPASTESPECIALA" },
        0x1a41 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUIEDITLINKSW" },
        0x1a45 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUIEDITLINKSA" },
        0x1a49 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUICHANGEICONW" },
        0x1a4d => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUICHANGEICONA" },
        0x1a51 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUICONVERTW" },
        0x1a55 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUICONVERTA" },
        0x1a59 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUIBUSYW" },
        0x1a5d => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUIBUSYA" },
        0x1a61 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUICHANGESOURCEW" },
        0x1a65 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUICHANGESOURCEA" },
        0x1a69 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUIOBJECTPROPSW" },
        0x1a6d => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "OLEUIOBJECTPROPSA" },
        0x1a71 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "IOleUILinkContainerW" },
        0x1a75 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "IOleUILinkContainerA" },
        else => null,
    };
}

pub const CTL_E_ILLEGALFUNCTIONCALL = -2146828283;
pub const CONNECT_E_FIRST = -2147220992;
pub const SELFREG_E_FIRST = -2147220992;
pub const PERPROP_E_FIRST = -2147220992;
pub const OLECMDERR_E_FIRST = -2147221248;
pub const OLECMDERR_E_DISABLED = -2147221247;
pub const OLECMDERR_E_NOHELP = -2147221246;
pub const OLECMDERR_E_CANCELED = -2147221245;
pub const OLECMDERR_E_UNKNOWNGROUP = -2147221244;
pub const CONNECT_E_NOCONNECTION = -2147220992;
pub const CONNECT_E_ADVISELIMIT = -2147220991;
pub const CONNECT_E_CANNOTCONNECT = -2147220990;
pub const CONNECT_E_OVERRIDDEN = -2147220989;
pub const SELFREG_E_TYPELIB = -2147220992;
pub const SELFREG_E_CLASS = -2147220991;
pub const PERPROP_E_NOPAGEAVAILABLE = -2147220992;
pub const CONNECT_E_LAST = -2147220977;
pub const CONNECT_S_FIRST = 262656;
pub const CONNECT_S_LAST = 262671;
pub const SELFREG_E_LAST = -2147220977;
pub const SELFREG_S_FIRST = 262656;
pub const SELFREG_S_LAST = 262671;
pub const PERPROP_E_LAST = -2147220977;
pub const PERPROP_S_FIRST = 262656;
pub const PERPROP_S_LAST = 262671;
pub const OLEIVERB_PROPERTIES = -7;
pub const VT_STREAMED_PROPSET = 73;
pub const VT_STORED_PROPSET = 74;
pub const VT_BLOB_PROPSET = 75;
pub const VT_VERBOSE_ENUM = 76;
pub const OCM__BASE = 8192;
pub const DISPID_AUTOSIZE = -500;
pub const DISPID_BACKCOLOR = -501;
pub const DISPID_BACKSTYLE = -502;
pub const DISPID_BORDERCOLOR = -503;
pub const DISPID_BORDERSTYLE = -504;
pub const DISPID_BORDERWIDTH = -505;
pub const DISPID_DRAWMODE = -507;
pub const DISPID_DRAWSTYLE = -508;
pub const DISPID_DRAWWIDTH = -509;
pub const DISPID_FILLCOLOR = -510;
pub const DISPID_FILLSTYLE = -511;
pub const DISPID_FONT = -512;
pub const DISPID_FORECOLOR = -513;
pub const DISPID_ENABLED = -514;
pub const DISPID_HWND = -515;
pub const DISPID_TABSTOP = -516;
pub const DISPID_TEXT = -517;
pub const DISPID_CAPTION = -518;
pub const DISPID_BORDERVISIBLE = -519;
pub const DISPID_APPEARANCE = -520;
pub const DISPID_MOUSEPOINTER = -521;
pub const DISPID_MOUSEICON = -522;
pub const DISPID_PICTURE = -523;
pub const DISPID_VALID = -524;
pub const DISPID_READYSTATE = -525;
pub const DISPID_LISTINDEX = -526;
pub const DISPID_SELECTED = -527;
pub const DISPID_LIST = -528;
pub const DISPID_COLUMN = -529;
pub const DISPID_LISTCOUNT = -531;
pub const DISPID_MULTISELECT = -532;
pub const DISPID_MAXLENGTH = -533;
pub const DISPID_PASSWORDCHAR = -534;
pub const DISPID_SCROLLBARS = -535;
pub const DISPID_WORDWRAP = -536;
pub const DISPID_MULTILINE = -537;
pub const DISPID_NUMBEROFROWS = -538;
pub const DISPID_NUMBEROFCOLUMNS = -539;
pub const DISPID_DISPLAYSTYLE = -540;
pub const DISPID_GROUPNAME = -541;
pub const DISPID_IMEMODE = -542;
pub const DISPID_ACCELERATOR = -543;
pub const DISPID_ENTERKEYBEHAVIOR = -544;
pub const DISPID_TABKEYBEHAVIOR = -545;
pub const DISPID_SELTEXT = -546;
pub const DISPID_SELSTART = -547;
pub const DISPID_SELLENGTH = -548;
pub const DISPID_REFRESH = -550;
pub const DISPID_DOCLICK = -551;
pub const DISPID_ABOUTBOX = -552;
pub const DISPID_ADDITEM = -553;
pub const DISPID_CLEAR = -554;
pub const DISPID_REMOVEITEM = -555;
pub const DISPID_CLICK = -600;
pub const DISPID_DBLCLICK = -601;
pub const DISPID_KEYDOWN = -602;
pub const DISPID_KEYPRESS = -603;
pub const DISPID_KEYUP = -604;
pub const DISPID_MOUSEDOWN = -605;
pub const DISPID_MOUSEMOVE = -606;
pub const DISPID_MOUSEUP = -607;
pub const DISPID_ERROREVENT = -608;
pub const DISPID_READYSTATECHANGE = -609;
pub const DISPID_CLICK_VALUE = -610;
pub const DISPID_RIGHTTOLEFT = -611;
pub const DISPID_TOPTOBOTTOM = -612;
pub const DISPID_THIS = -613;
pub const DISPID_AMBIENT_BACKCOLOR = -701;
pub const DISPID_AMBIENT_DISPLAYNAME = -702;
pub const DISPID_AMBIENT_FONT = -703;
pub const DISPID_AMBIENT_FORECOLOR = -704;
pub const DISPID_AMBIENT_LOCALEID = -705;
pub const DISPID_AMBIENT_MESSAGEREFLECT = -706;
pub const DISPID_AMBIENT_SCALEUNITS = -707;
pub const DISPID_AMBIENT_TEXTALIGN = -708;
pub const DISPID_AMBIENT_USERMODE = -709;
pub const DISPID_AMBIENT_UIDEAD = -710;
pub const DISPID_AMBIENT_SHOWGRABHANDLES = -711;
pub const DISPID_AMBIENT_SHOWHATCHING = -712;
pub const DISPID_AMBIENT_DISPLAYASDEFAULT = -713;
pub const DISPID_AMBIENT_SUPPORTSMNEMONICS = -714;
pub const DISPID_AMBIENT_AUTOCLIP = -715;
pub const DISPID_AMBIENT_APPEARANCE = -716;
pub const DISPID_AMBIENT_CODEPAGE = -725;
pub const DISPID_AMBIENT_PALETTE = -726;
pub const DISPID_AMBIENT_CHARSET = -727;
pub const DISPID_AMBIENT_TRANSFERPRIORITY = -728;
pub const DISPID_AMBIENT_RIGHTTOLEFT = -732;
pub const DISPID_AMBIENT_TOPTOBOTTOM = -733;
pub const DISPID_Name = -800;
pub const DISPID_Delete = -801;
pub const DISPID_Object = -802;
pub const DISPID_Parent = -803;
pub const DISPID_FONT_NAME = 0;
pub const DISPID_FONT_SIZE = 2;
pub const DISPID_FONT_BOLD = 3;
pub const DISPID_FONT_ITALIC = 4;
pub const DISPID_FONT_UNDER = 5;
pub const DISPID_FONT_STRIKE = 6;
pub const DISPID_FONT_WEIGHT = 7;
pub const DISPID_FONT_CHARSET = 8;
pub const DISPID_FONT_CHANGED = 9;
pub const DISPID_PICT_HANDLE = 0;
pub const DISPID_PICT_HPAL = 2;
pub const DISPID_PICT_TYPE = 3;
pub const DISPID_PICT_WIDTH = 4;
pub const DISPID_PICT_HEIGHT = 5;
pub const DISPID_PICT_RENDER = 6;
pub const GC_WCH_SIBLING = 1;
pub const TIFLAGS_EXTENDDISPATCHONLY = 1;
pub const OLECMDERR_E_NOTSUPPORTED = -2147221248;
pub const MSOCMDERR_E_FIRST = -2147221248;
pub const MSOCMDERR_E_NOTSUPPORTED = -2147221248;
pub const MSOCMDERR_E_DISABLED = -2147221247;
pub const MSOCMDERR_E_NOHELP = -2147221246;
pub const MSOCMDERR_E_CANCELED = -2147221245;
pub const MSOCMDERR_E_UNKNOWNGROUP = -2147221244;
pub const OLECMD_TASKDLGID_ONBEFOREUNLOAD = 1;
pub const OLECMDARGINDEX_SHOWPAGEACTIONMENU_HWND = 0;
pub const OLECMDARGINDEX_SHOWPAGEACTIONMENU_X = 1;
pub const OLECMDARGINDEX_SHOWPAGEACTIONMENU_Y = 2;
pub const OLECMDARGINDEX_ACTIVEXINSTALL_PUBLISHER = 0;
pub const OLECMDARGINDEX_ACTIVEXINSTALL_DISPLAYNAME = 1;
pub const OLECMDARGINDEX_ACTIVEXINSTALL_CLSID = 2;
pub const OLECMDARGINDEX_ACTIVEXINSTALL_INSTALLSCOPE = 3;
pub const OLECMDARGINDEX_ACTIVEXINSTALL_SOURCEURL = 4;
pub const INSTALL_SCOPE_INVALID = 0;
pub const INSTALL_SCOPE_MACHINE = 1;
pub const INSTALL_SCOPE_USER = 2;
pub const MK_ALT = 32;
pub const DD_DEFSCROLLINSET = 11;
pub const DD_DEFSCROLLDELAY = 50;
pub const DD_DEFSCROLLINTERVAL = 50;
pub const DD_DEFDRAGDELAY = 200;
pub const DD_DEFDRAGMINDIST = 2;
pub const OT_LINK = 1;
pub const OT_EMBEDDED = 2;
pub const OT_STATIC = 3;
pub const OLEVERB_PRIMARY = 0;
pub const OF_SET = 1;
pub const OF_GET = 2;
pub const OF_HANDLER = 4;
pub const WIN32 = 100;
pub const OLESTREAM_CONVERSION_DEFAULT = 0;
pub const OLESTREAM_CONVERSION_DISABLEOLELINK = 1;
pub const IDC_OLEUIHELP = 99;
pub const IDC_IO_CREATENEW = 2100;
pub const IDC_IO_CREATEFROMFILE = 2101;
pub const IDC_IO_LINKFILE = 2102;
pub const IDC_IO_OBJECTTYPELIST = 2103;
pub const IDC_IO_DISPLAYASICON = 2104;
pub const IDC_IO_CHANGEICON = 2105;
pub const IDC_IO_FILE = 2106;
pub const IDC_IO_FILEDISPLAY = 2107;
pub const IDC_IO_RESULTIMAGE = 2108;
pub const IDC_IO_RESULTTEXT = 2109;
pub const IDC_IO_ICONDISPLAY = 2110;
pub const IDC_IO_OBJECTTYPETEXT = 2111;
pub const IDC_IO_FILETEXT = 2112;
pub const IDC_IO_FILETYPE = 2113;
pub const IDC_IO_INSERTCONTROL = 2114;
pub const IDC_IO_ADDCONTROL = 2115;
pub const IDC_IO_CONTROLTYPELIST = 2116;
pub const IDC_PS_PASTE = 500;
pub const IDC_PS_PASTELINK = 501;
pub const IDC_PS_SOURCETEXT = 502;
pub const IDC_PS_PASTELIST = 503;
pub const IDC_PS_PASTELINKLIST = 504;
pub const IDC_PS_DISPLAYLIST = 505;
pub const IDC_PS_DISPLAYASICON = 506;
pub const IDC_PS_ICONDISPLAY = 507;
pub const IDC_PS_CHANGEICON = 508;
pub const IDC_PS_RESULTIMAGE = 509;
pub const IDC_PS_RESULTTEXT = 510;
pub const IDC_CI_GROUP = 120;
pub const IDC_CI_CURRENT = 121;
pub const IDC_CI_CURRENTICON = 122;
pub const IDC_CI_DEFAULT = 123;
pub const IDC_CI_DEFAULTICON = 124;
pub const IDC_CI_FROMFILE = 125;
pub const IDC_CI_FROMFILEEDIT = 126;
pub const IDC_CI_ICONLIST = 127;
pub const IDC_CI_LABEL = 128;
pub const IDC_CI_LABELEDIT = 129;
pub const IDC_CI_BROWSE = 130;
pub const IDC_CI_ICONDISPLAY = 131;
pub const IDC_CV_OBJECTTYPE = 150;
pub const IDC_CV_DISPLAYASICON = 152;
pub const IDC_CV_CHANGEICON = 153;
pub const IDC_CV_ACTIVATELIST = 154;
pub const IDC_CV_CONVERTTO = 155;
pub const IDC_CV_ACTIVATEAS = 156;
pub const IDC_CV_RESULTTEXT = 157;
pub const IDC_CV_CONVERTLIST = 158;
pub const IDC_CV_ICONDISPLAY = 165;
pub const IDC_EL_CHANGESOURCE = 201;
pub const IDC_EL_AUTOMATIC = 202;
pub const IDC_EL_CANCELLINK = 209;
pub const IDC_EL_UPDATENOW = 210;
pub const IDC_EL_OPENSOURCE = 211;
pub const IDC_EL_MANUAL = 212;
pub const IDC_EL_LINKSOURCE = 216;
pub const IDC_EL_LINKTYPE = 217;
pub const IDC_EL_LINKSLISTBOX = 206;
pub const IDC_EL_COL1 = 220;
pub const IDC_EL_COL2 = 221;
pub const IDC_EL_COL3 = 222;
pub const IDC_BZ_RETRY = 600;
pub const IDC_BZ_ICON = 601;
pub const IDC_BZ_MESSAGE1 = 602;
pub const IDC_BZ_SWITCHTO = 604;
pub const IDC_UL_METER = 1029;
pub const IDC_UL_STOP = 1030;
pub const IDC_UL_PERCENT = 1031;
pub const IDC_UL_PROGRESS = 1032;
pub const IDC_PU_LINKS = 900;
pub const IDC_PU_TEXT = 901;
pub const IDC_PU_CONVERT = 902;
pub const IDC_PU_ICON = 908;
pub const IDC_GP_OBJECTNAME = 1009;
pub const IDC_GP_OBJECTTYPE = 1010;
pub const IDC_GP_OBJECTSIZE = 1011;
pub const IDC_GP_CONVERT = 1013;
pub const IDC_GP_OBJECTICON = 1014;
pub const IDC_GP_OBJECTLOCATION = 1022;
pub const IDC_VP_PERCENT = 1000;
pub const IDC_VP_CHANGEICON = 1001;
pub const IDC_VP_EDITABLE = 1002;
pub const IDC_VP_ASICON = 1003;
pub const IDC_VP_RELATIVE = 1005;
pub const IDC_VP_SPIN = 1006;
pub const IDC_VP_SCALETXT = 1034;
pub const IDC_VP_ICONDISPLAY = 1021;
pub const IDC_VP_RESULTIMAGE = 1033;
pub const IDC_LP_OPENSOURCE = 1006;
pub const IDC_LP_UPDATENOW = 1007;
pub const IDC_LP_BREAKLINK = 1008;
pub const IDC_LP_LINKSOURCE = 1012;
pub const IDC_LP_CHANGESOURCE = 1015;
pub const IDC_LP_AUTOMATIC = 1016;
pub const IDC_LP_MANUAL = 1017;
pub const IDC_LP_DATE = 1018;
pub const IDC_LP_TIME = 1019;
pub const IDD_INSERTOBJECT = 1000;
pub const IDD_CHANGEICON = 1001;
pub const IDD_CONVERT = 1002;
pub const IDD_PASTESPECIAL = 1003;
pub const IDD_EDITLINKS = 1004;
pub const IDD_BUSY = 1006;
pub const IDD_UPDATELINKS = 1007;
pub const IDD_CHANGESOURCE = 1009;
pub const IDD_INSERTFILEBROWSE = 1010;
pub const IDD_CHANGEICONBROWSE = 1011;
pub const IDD_CONVERTONLY = 1012;
pub const IDD_CHANGESOURCE4 = 1013;
pub const IDD_GNRLPROPS = 1100;
pub const IDD_VIEWPROPS = 1101;
pub const IDD_LINKPROPS = 1102;
pub const IDD_CONVERT4 = 1103;
pub const IDD_CONVERTONLY4 = 1104;
pub const IDD_EDITLINKS4 = 1105;
pub const IDD_GNRLPROPS4 = 1106;
pub const IDD_LINKPROPS4 = 1107;
pub const IDD_PASTESPECIAL4 = 1108;
pub const IDD_CANNOTUPDATELINK = 1008;
pub const IDD_LINKSOURCEUNAVAILABLE = 1020;
pub const IDD_SERVERNOTFOUND = 1023;
pub const IDD_OUTOFMEMORY = 1024;
pub const IDD_SERVERNOTREGW = 1021;
pub const IDD_LINKTYPECHANGEDW = 1022;
pub const IDD_SERVERNOTREGA = 1025;
pub const IDD_LINKTYPECHANGEDA = 1026;
pub const IDD_SERVERNOTREG = 1021;
pub const IDD_LINKTYPECHANGED = 1022;
pub const ID_BROWSE_CHANGEICON = 1;
pub const ID_BROWSE_INSERTFILE = 2;
pub const ID_BROWSE_ADDCONTROL = 3;
pub const ID_BROWSE_CHANGESOURCE = 4;
pub const OLEUI_FALSE = 0;
pub const OLEUI_SUCCESS = 1;
pub const OLEUI_OK = 1;
pub const OLEUI_CANCEL = 2;
pub const OLEUI_ERR_STANDARDMIN = 100;
pub const OLEUI_ERR_OLEMEMALLOC = 100;
pub const OLEUI_ERR_STRUCTURENULL = 101;
pub const OLEUI_ERR_STRUCTUREINVALID = 102;
pub const OLEUI_ERR_CBSTRUCTINCORRECT = 103;
pub const OLEUI_ERR_HWNDOWNERINVALID = 104;
pub const OLEUI_ERR_LPSZCAPTIONINVALID = 105;
pub const OLEUI_ERR_LPFNHOOKINVALID = 106;
pub const OLEUI_ERR_HINSTANCEINVALID = 107;
pub const OLEUI_ERR_LPSZTEMPLATEINVALID = 108;
pub const OLEUI_ERR_HRESOURCEINVALID = 109;
pub const OLEUI_ERR_FINDTEMPLATEFAILURE = 110;
pub const OLEUI_ERR_LOADTEMPLATEFAILURE = 111;
pub const OLEUI_ERR_DIALOGFAILURE = 112;
pub const OLEUI_ERR_LOCALMEMALLOC = 113;
pub const OLEUI_ERR_GLOBALMEMALLOC = 114;
pub const OLEUI_ERR_LOADSTRING = 115;
pub const OLEUI_ERR_STANDARDMAX = 116;
pub const OLEUI_IOERR_LPSZFILEINVALID = 116;
pub const OLEUI_IOERR_LPSZLABELINVALID = 117;
pub const OLEUI_IOERR_HICONINVALID = 118;
pub const OLEUI_IOERR_LPFORMATETCINVALID = 119;
pub const OLEUI_IOERR_PPVOBJINVALID = 120;
pub const OLEUI_IOERR_LPIOLECLIENTSITEINVALID = 121;
pub const OLEUI_IOERR_LPISTORAGEINVALID = 122;
pub const OLEUI_IOERR_SCODEHASERROR = 123;
pub const OLEUI_IOERR_LPCLSIDEXCLUDEINVALID = 124;
pub const OLEUI_IOERR_CCHFILEINVALID = 125;
pub const PS_MAXLINKTYPES = 8;
pub const OLEUI_IOERR_SRCDATAOBJECTINVALID = 116;
pub const OLEUI_IOERR_ARRPASTEENTRIESINVALID = 117;
pub const OLEUI_IOERR_ARRLINKTYPESINVALID = 118;
pub const OLEUI_PSERR_CLIPBOARDCHANGED = 119;
pub const OLEUI_PSERR_GETCLIPBOARDFAILED = 120;
pub const OLEUI_ELERR_LINKCNTRNULL = 116;
pub const OLEUI_ELERR_LINKCNTRINVALID = 117;
pub const OLEUI_CIERR_MUSTHAVECLSID = 116;
pub const OLEUI_CIERR_MUSTHAVECURRENTMETAFILE = 117;
pub const OLEUI_CIERR_SZICONEXEINVALID = 118;
pub const OLEUI_CTERR_CLASSIDINVALID = 117;
pub const OLEUI_CTERR_DVASPECTINVALID = 118;
pub const OLEUI_CTERR_CBFORMATINVALID = 119;
pub const OLEUI_CTERR_HMETAPICTINVALID = 120;
pub const OLEUI_CTERR_STRINGINVALID = 121;
pub const OLEUI_BZERR_HTASKINVALID = 116;
pub const OLEUI_BZ_SWITCHTOSELECTED = 117;
pub const OLEUI_BZ_RETRYSELECTED = 118;
pub const OLEUI_BZ_CALLUNBLOCKED = 119;
pub const OLEUI_CSERR_LINKCNTRNULL = 116;
pub const OLEUI_CSERR_LINKCNTRINVALID = 117;
pub const OLEUI_CSERR_FROMNOTNULL = 118;
pub const OLEUI_CSERR_TONOTNULL = 119;
pub const OLEUI_CSERR_SOURCENULL = 120;
pub const OLEUI_CSERR_SOURCEINVALID = 121;
pub const OLEUI_CSERR_SOURCEPARSERROR = 122;
pub const OLEUI_CSERR_SOURCEPARSEERROR = 122;
pub const OLEUI_OPERR_SUBPROPNULL = 116;
pub const OLEUI_OPERR_SUBPROPINVALID = 117;
pub const OLEUI_OPERR_PROPSHEETNULL = 118;
pub const OLEUI_OPERR_PROPSHEETINVALID = 119;
pub const OLEUI_OPERR_SUPPROP = 120;
pub const OLEUI_OPERR_PROPSINVALID = 121;
pub const OLEUI_OPERR_PAGESINCORRECT = 122;
pub const OLEUI_OPERR_INVALIDPAGES = 123;
pub const OLEUI_OPERR_NOTSUPPORTED = 124;
pub const OLEUI_OPERR_DLGPROCNOTNULL = 125;
pub const OLEUI_OPERR_LPARAMNOTZERO = 126;
pub const OLEUI_GPERR_STRINGINVALID = 127;
pub const OLEUI_GPERR_CLASSIDINVALID = 128;
pub const OLEUI_GPERR_LPCLSIDEXCLUDEINVALID = 129;
pub const OLEUI_GPERR_CBFORMATINVALID = 130;
pub const OLEUI_VPERR_METAPICTINVALID = 131;
pub const OLEUI_VPERR_DVASPECTINVALID = 132;
pub const OLEUI_LPERR_LINKCNTRNULL = 133;
pub const OLEUI_LPERR_LINKCNTRINVALID = 134;
pub const OLEUI_OPERR_PROPERTYSHEET = 135;
pub const OLEUI_OPERR_OBJINFOINVALID = 136;
pub const OLEUI_OPERR_LINKINFOINVALID = 137;
pub const OLEUI_QUERY_GETCLASSID = 65280;
pub const OLEUI_QUERY_LINKBROKEN = 65281;
pub const DISPID_UNKNOWN = -1;
pub const DISPID_VALUE = 0;
pub const DISPID_PROPERTYPUT = -3;
pub const DISPID_NEWENUM = -4;
pub const DISPID_EVALUATE = -5;
pub const DISPID_CONSTRUCTOR = -6;
pub const DISPID_DESTRUCTOR = -7;
pub const DISPID_COLLECT = -8;
pub const STDOLE_MAJORVERNUM = 1;
pub const STDOLE_MINORVERNUM = 0;
pub const STDOLE_LCID = 0;
pub const STDOLE2_MAJORVERNUM = 2;
pub const STDOLE2_MINORVERNUM = 0;
pub const STDOLE2_LCID = 0;
pub const VAR_TIMEVALUEONLY = 1;
pub const VAR_DATEVALUEONLY = 2;
pub const VAR_VALIDDATE = 4;
pub const VAR_CALENDAR_HIJRI = 8;
pub const VAR_LOCALBOOL = 16;
pub const VAR_FORMAT_NOSUBSTITUTE = 32;
pub const VAR_FOURDIGITYEARS = 64;
pub const LOCALE_USE_NLS = 268435456;
pub const VAR_CALENDAR_THAI = 128;
pub const VAR_CALENDAR_GREGORIAN = 256;
pub const VTDATEGRE_MAX = 2958465;
pub const VTDATEGRE_MIN = -657434;
pub const MEMBERID_NIL = -1;
pub const ID_DEFAULTINST = -2;
pub const LOAD_TLB_AS_32BIT = 32;
pub const LOAD_TLB_AS_64BIT = 64;
pub const fdexNameCaseSensitive = 1;
pub const fdexNameEnsure = 2;
pub const fdexNameImplicit = 4;
pub const fdexNameCaseInsensitive = 8;
pub const fdexNameInternal = 16;
pub const fdexNameNoDynamicProperties = 32;
pub const fdexEnumDefault = 1;
pub const fdexEnumAll = 2;
pub const DISPATCH_CONSTRUCT = 16384;
pub const DISPID_STARTENUM = -1;
pub const CF_TEXT = 1;
pub const CF_BITMAP = 2;
pub const CF_METAFILEPICT = 3;
pub const CF_SYLK = 4;
pub const CF_DIF = 5;
pub const CF_TIFF = 6;
pub const CF_OEMTEXT = 7;
pub const CF_DIB = 8;
pub const CF_PALETTE = 9;
pub const CF_PENDATA = 10;
pub const CF_RIFF = 11;
pub const CF_WAVE = 12;
pub const CF_UNICODETEXT = 13;
pub const CF_ENHMETAFILE = 14;
pub const CF_HDROP = 15;
pub const CF_LOCALE = 16;
pub const CF_DIBV5 = 17;
pub const CF_MAX = 18;
pub const CF_OWNERDISPLAY = 128;
pub const CF_DSPTEXT = 129;
pub const CF_DSPBITMAP = 130;
pub const CF_DSPMETAFILEPICT = 131;
pub const CF_DSPENHMETAFILE = 142;
pub const CF_PRIVATEFIRST = 512;
pub const CF_PRIVATELAST = 767;
pub const CF_GDIOBJFIRST = 768;
pub const CF_GDIOBJLAST = 1023;
pub const OLEIVERB_PRIMARY = 0;
pub const OLEIVERB_SHOW = -1;
pub const OLEIVERB_OPEN = -2;
pub const OLEIVERB_HIDE = -3;
pub const OLEIVERB_UIACTIVATE = -4;
pub const OLEIVERB_INPLACEACTIVATE = -5;
pub const OLEIVERB_DISCARDUNDOSTATE = -6;
pub const UPDFCACHE_ALL = 2147483647;
pub const UPDFCACHE_ALLBUTNODATACACHE = 2147483646;
pub const UPDFCACHE_NORMALCACHE = 8;
pub const UPDFCACHE_IFBLANK = 16;
pub const UPDFCACHE_ONLYIFBLANK = 2147483648;
pub const UPDFCACHE_NODATACACHE = 1;
pub const UPDFCACHE_ONSAVECACHE = 2;
pub const UPDFCACHE_ONSTOPCACHE = 4;
pub const UPDFCACHE_IFBLANKORONSAVECACHE = 18;
pub const GCW_WCH_SIBLING = 1;
pub const GC_WCH_CONTAINER = 2;
pub const GC_WCH_CONTAINED = 3;
pub const GC_WCH_ALL = 4;
pub const GC_WCH_FREVERSEDIR = 134217728;
pub const GC_WCH_FONLYAFTER = 268435456;
pub const GC_WCH_FONLYBEFORE = 536870912;
pub const GC_WCH_FSELECTED = 1073741824;
pub const MULTICLASSINFO_GETTYPEINFO = 1;
pub const MULTICLASSINFO_GETNUMRESERVEDDISPIDS = 2;
pub const MULTICLASSINFO_GETIIDPRIMARY = 4;
pub const MULTICLASSINFO_GETIIDSOURCE = 8;
pub const DROPEFFECT_NONE = 0;
pub const DROPEFFECT_COPY = 1;
pub const DROPEFFECT_MOVE = 2;
pub const DROPEFFECT_LINK = 4;
pub const DROPEFFECT_SCROLL = 2147483648;
pub const KEYMOD_SHIFT = 1;
pub const KEYMOD_CONTROL = 2;
pub const KEYMOD_ALT = 4;
pub const ACTIVEOBJECT_STRONG = 0;
pub const ACTIVEOBJECT_WEAK = 1;
pub const BZ_DISABLECANCELBUTTON = 1;
pub const BZ_DISABLESWITCHTOBUTTON = 2;
pub const BZ_DISABLERETRYBUTTON = 4;
pub const BZ_NOTRESPONDINGDIALOG = 8;
pub const CF_SHOWHELPBUTTON = 1;
pub const CF_SETCONVERTDEFAULT = 2;
pub const CF_SETACTIVATEDEFAULT = 4;
pub const CF_SELECTCONVERTTO = 8;
pub const CF_SELECTACTIVATEAS = 16;
pub const CF_DISABLEDISPLAYASICON = 32;
pub const CF_DISABLEACTIVATEAS = 64;
pub const CF_HIDECHANGEICON = 128;
pub const CF_CONVERTONLY = 256;
pub const CIF_SHOWHELP = 1;
pub const CIF_SELECTCURRENT = 2;
pub const CIF_SELECTDEFAULT = 4;
pub const CIF_SELECTFROMFILE = 8;
pub const CIF_USEICONEXE = 16;
pub const CSF_SHOWHELP = 1;
pub const CSF_VALIDSOURCE = 2;
pub const CSF_ONLYGETSOURCE = 4;
pub const CSF_EXPLORER = 8;
pub const ELF_SHOWHELP = 1;
pub const ELF_DISABLEUPDATENOW = 2;
pub const ELF_DISABLEOPENSOURCE = 4;
pub const ELF_DISABLECHANGESOURCE = 8;
pub const ELF_DISABLECANCELLINK = 16;
pub const IOF_SHOWHELP = 1;
pub const IOF_SELECTCREATENEW = 2;
pub const IOF_SELECTCREATEFROMFILE = 4;
pub const IOF_CHECKLINK = 8;
pub const IOF_CHECKDISPLAYASICON = 16;
pub const IOF_CREATENEWOBJECT = 32;
pub const IOF_CREATEFILEOBJECT = 64;
pub const IOF_CREATELINKOBJECT = 128;
pub const IOF_DISABLELINK = 256;
pub const IOF_VERIFYSERVERSEXIST = 512;
pub const IOF_DISABLEDISPLAYASICON = 1024;
pub const IOF_HIDECHANGEICON = 2048;
pub const IOF_SHOWINSERTCONTROL = 4096;
pub const IOF_SELECTCREATECONTROL = 8192;
pub const OPF_OBJECTISLINK = 1;
pub const OPF_NOFILLDEFAULT = 2;
pub const OPF_SHOWHELP = 4;
pub const OPF_DISABLECONVERT = 8;
pub const VPF_SELECTRELATIVE = 1;
pub const VPF_DISABLERELATIVE = 2;
pub const VPF_DISABLESCALE = 4;
pub const PARAMFLAG_NONE = 0;
pub const PARAMFLAG_FIN = 1;
pub const PARAMFLAG_FOUT = 2;
pub const PARAMFLAG_FLCID = 4;
pub const PARAMFLAG_FRETVAL = 8;
pub const PARAMFLAG_FOPT = 16;
pub const PARAMFLAG_FHASDEFAULT = 32;
pub const PARAMFLAG_FHASCUSTDATA = 64;
pub const NUMPRS_LEADING_WHITE = 1;
pub const NUMPRS_TRAILING_WHITE = 2;
pub const NUMPRS_LEADING_PLUS = 4;
pub const NUMPRS_TRAILING_PLUS = 8;
pub const NUMPRS_LEADING_MINUS = 16;
pub const NUMPRS_TRAILING_MINUS = 32;
pub const NUMPRS_HEX_OCT = 64;
pub const NUMPRS_PARENS = 128;
pub const NUMPRS_DECIMAL = 256;
pub const NUMPRS_THOUSANDS = 512;
pub const NUMPRS_CURRENCY = 1024;
pub const NUMPRS_EXPONENT = 2048;
pub const NUMPRS_USE_ALL = 4096;
pub const NUMPRS_STD = 8191;
pub const NUMPRS_NEG = 65536;
pub const NUMPRS_INEXACT = 131072;
pub const PICTYPE_UNINITIALIZED = -1;
pub const PICTYPE_NONE = 0;
pub const PICTYPE_BITMAP = 1;
pub const PICTYPE_METAFILE = 2;
pub const PICTYPE_ICON = 3;
pub const PICTYPE_ENHMETAFILE = 4;
pub const VARCMP_LT = 0;
pub const VARCMP_EQ = 1;
pub const VARCMP_GT = 2;
pub const VARCMP_NULL = 3;
pub const PSF_SHOWHELP = 1;
pub const PSF_SELECTPASTE = 2;
pub const PSF_SELECTPASTELINK = 4;
pub const PSF_CHECKDISPLAYASICON = 8;
pub const PSF_DISABLEDISPLAYASICON = 16;
pub const PSF_HIDECHANGEICON = 32;
pub const PSF_STAYONCLIPBOARDCHANGE = 64;
pub const PSF_NOREFRESHDATAOBJECT = 128;
pub const EMBDHLP_INPROC_HANDLER = 0;
pub const EMBDHLP_INPROC_SERVER = 1;
pub const EMBDHLP_CREATENOW = 0;
pub const EMBDHLP_DELAYCREATE = 65536;
pub const fdexPropCanGet = 1;
pub const fdexPropCannotGet = 2;
pub const fdexPropCanPut = 4;
pub const fdexPropCannotPut = 8;
pub const fdexPropCanPutRef = 16;
pub const fdexPropCannotPutRef = 32;
pub const fdexPropNoSideEffects = 64;
pub const fdexPropDynamicType = 128;
pub const fdexPropCanCall = 256;
pub const fdexPropCannotCall = 512;
pub const fdexPropCanConstruct = 1024;
pub const fdexPropCannotConstruct = 2048;
pub const fdexPropCanSourceEvents = 4096;
pub const fdexPropCannotSourceEvents = 8192;
pub const LP_DEFAULT = 0;
pub const LP_MONOCHROME = 1;
pub const LP_VGACOLOR = 2;
pub const LP_COLOR = 4;
pub const OLECREATE_ZERO = 0;
pub const OLECREATE_LEAVERUNNING = 1;
pub const VARFORMAT_FIRST_DAY_SYSTEMDEFAULT = 0;
pub const VARFORMAT_FIRST_DAY_MONDAY = 1;
pub const VARFORMAT_FIRST_DAY_TUESDAY = 2;
pub const VARFORMAT_FIRST_DAY_WEDNESDAY = 3;
pub const VARFORMAT_FIRST_DAY_THURSDAY = 4;
pub const VARFORMAT_FIRST_DAY_FRIDAY = 5;
pub const VARFORMAT_FIRST_DAY_SATURDAY = 6;
pub const VARFORMAT_FIRST_DAY_SUNDAY = 7;
pub const VARFORMAT_FIRST_WEEK_SYSTEMDEFAULT = 0;
pub const VARFORMAT_FIRST_WEEK_CONTAINS_JANUARY_FIRST = 1;
pub const VARFORMAT_FIRST_WEEK_LARGER_HALF_IN_CURRENT_YEAR = 2;
pub const VARFORMAT_FIRST_WEEK_HAS_SEVEN_DAYS = 3;
pub const VARFORMAT_NAMED_FORMAT_GENERALDATE = 0;
pub const VARFORMAT_NAMED_FORMAT_LONGDATE = 1;
pub const VARFORMAT_NAMED_FORMAT_SHORTDATE = 2;
pub const VARFORMAT_NAMED_FORMAT_LONGTIME = 3;
pub const VARFORMAT_NAMED_FORMAT_SHORTTIME = 4;
pub const VARFORMAT_LEADING_DIGIT_SYSTEMDEFAULT = -2;
pub const VARFORMAT_LEADING_DIGIT_INCLUDED = -1;
pub const VARFORMAT_LEADING_DIGIT_NOTINCLUDED = 0;
pub const VARFORMAT_PARENTHESES_SYSTEMDEFAULT = -2;
pub const VARFORMAT_PARENTHESES_USED = -1;
pub const VARFORMAT_PARENTHESES_NOTUSED = 0;
pub const VARFORMAT_GROUP_SYSTEMDEFAULT = -2;
pub const VARFORMAT_GROUP_THOUSANDS = -1;
pub const VARFORMAT_GROUP_NOTTHOUSANDS = 0;
pub const SF_ERROR = 10;
pub const SF_I1 = 16;
pub const SF_I2 = 2;
pub const SF_I4 = 3;
pub const SF_I8 = 20;
pub const SF_BSTR = 8;
pub const SF_UNKNOWN = 13;
pub const SF_DISPATCH = 9;
pub const SF_VARIANT = 12;
pub const SF_RECORD = 36;
pub const SF_HAVEIID = 32781;
pub const TYPEFLAG_FAPPOBJECT = 1;
pub const TYPEFLAG_FCANCREATE = 2;
pub const TYPEFLAG_FLICENSED = 4;
pub const TYPEFLAG_FPREDECLID = 8;
pub const TYPEFLAG_FHIDDEN = 16;
pub const TYPEFLAG_FCONTROL = 32;
pub const TYPEFLAG_FDUAL = 64;
pub const TYPEFLAG_FNONEXTENSIBLE = 128;
pub const TYPEFLAG_FOLEAUTOMATION = 256;
pub const TYPEFLAG_FRESTRICTED = 512;
pub const TYPEFLAG_FAGGREGATABLE = 1024;
pub const TYPEFLAG_FREPLACEABLE = 2048;
pub const TYPEFLAG_FDISPATCHABLE = 4096;
pub const TYPEFLAG_FREVERSEBIND = 8192;
pub const TYPEFLAG_FPROXY = 16384;
pub const LIBFLAG_FRESTRICTED = 1;
pub const LIBFLAG_FCONTROL = 2;
pub const LIBFLAG_FHIDDEN = 4;
pub const LIBFLAG_FHASDISKIMAGE = 8;
pub const CHANGEKIND_ADDMEMBER = 0;
pub const CHANGEKIND_DELETEMEMBER = 1;
pub const CHANGEKIND_SETNAMES = 2;
pub const CHANGEKIND_SETDOCUMENTATION = 3;
pub const CHANGEKIND_GENERAL = 4;
pub const CHANGEKIND_INVALIDATE = 5;
pub const CHANGEKIND_CHANGEFAILED = 6;
pub const CHANGEKIND_MAX = 7;
pub const DISCARDCACHE_SAVEIFDIRTY = 0;
pub const DISCARDCACHE_NOSAVE = 1;
pub const OLEGETMONIKER_ONLYIFTHERE = 1;
pub const OLEGETMONIKER_FORCEASSIGN = 2;
pub const OLEGETMONIKER_UNASSIGN = 3;
pub const OLEGETMONIKER_TEMPFORUSER = 4;
pub const OLEWHICHMK_CONTAINER = 1;
pub const OLEWHICHMK_OBJREL = 2;
pub const OLEWHICHMK_OBJFULL = 3;
pub const USERCLASSTYPE_FULL = 1;
pub const USERCLASSTYPE_SHORT = 2;
pub const USERCLASSTYPE_APPNAME = 3;
pub const OLEMISC_RECOMPOSEONRESIZE = 1;
pub const OLEMISC_ONLYICONIC = 2;
pub const OLEMISC_INSERTNOTREPLACE = 4;
pub const OLEMISC_STATIC = 8;
pub const OLEMISC_CANTLINKINSIDE = 16;
pub const OLEMISC_CANLINKBYOLE1 = 32;
pub const OLEMISC_ISLINKOBJECT = 64;
pub const OLEMISC_INSIDEOUT = 128;
pub const OLEMISC_ACTIVATEWHENVISIBLE = 256;
pub const OLEMISC_RENDERINGISDEVICEINDEPENDENT = 512;
pub const OLEMISC_INVISIBLEATRUNTIME = 1024;
pub const OLEMISC_ALWAYSRUN = 2048;
pub const OLEMISC_ACTSLIKEBUTTON = 4096;
pub const OLEMISC_ACTSLIKELABEL = 8192;
pub const OLEMISC_NOUIACTIVATE = 16384;
pub const OLEMISC_ALIGNABLE = 32768;
pub const OLEMISC_SIMPLEFRAME = 65536;
pub const OLEMISC_SETCLIENTSITEFIRST = 131072;
pub const OLEMISC_IMEMODE = 262144;
pub const OLEMISC_IGNOREACTIVATEWHENVISIBLE = 524288;
pub const OLEMISC_WANTSTOMENUMERGE = 1048576;
pub const OLEMISC_SUPPORTSMULTILEVELUNDO = 2097152;
pub const OLECLOSE_SAVEIFDIRTY = 0;
pub const OLECLOSE_NOSAVE = 1;
pub const OLECLOSE_PROMPTSAVE = 2;
pub const OLERENDER_NONE = 0;
pub const OLERENDER_DRAW = 1;
pub const OLERENDER_FORMAT = 2;
pub const OLERENDER_ASIS = 3;
pub const OLEUPDATE_ALWAYS = 1;
pub const OLEUPDATE_ONCALL = 3;
pub const OLELINKBIND_EVENIFCLASSDIFF = 1;
pub const BINDSPEED_INDEFINITE = 1;
pub const BINDSPEED_MODERATE = 2;
pub const BINDSPEED_IMMEDIATE = 3;
pub const OLECONTF_EMBEDDINGS = 1;
pub const OLECONTF_LINKS = 2;
pub const OLECONTF_OTHERS = 4;
pub const OLECONTF_ONLYUSER = 8;
pub const OLECONTF_ONLYIFRUNNING = 16;
pub const OLEVERBATTRIB_NEVERDIRTIES = 1;
pub const OLEVERBATTRIB_ONCONTAINERMENU = 2;
pub const REGKIND_DEFAULT = 0;
pub const REGKIND_REGISTER = 1;
pub const REGKIND_NONE = 2;
pub const UAS_NORMAL = 0;
pub const UAS_BLOCKED = 1;
pub const UAS_NOPARENTENABLE = 2;
pub const UAS_MASK = 3;
pub const READYSTATE_UNINITIALIZED = 0;
pub const READYSTATE_LOADING = 1;
pub const READYSTATE_LOADED = 2;
pub const READYSTATE_INTERACTIVE = 3;
pub const READYSTATE_COMPLETE = 4;
pub const GUIDKIND_DEFAULT_SOURCE_DISP_IID = 1;
pub const CTRLINFO_EATS_RETURN = 1;
pub const CTRLINFO_EATS_ESCAPE = 2;
pub const XFORMCOORDS_POSITION = 1;
pub const XFORMCOORDS_SIZE = 2;
pub const XFORMCOORDS_HIMETRICTOCONTAINER = 4;
pub const XFORMCOORDS_CONTAINERTOHIMETRIC = 8;
pub const XFORMCOORDS_EVENTCOMPAT = 16;
pub const PROPPAGESTATUS_DIRTY = 1;
pub const PROPPAGESTATUS_VALIDATE = 2;
pub const PROPPAGESTATUS_CLEAN = 4;
pub const PICTURE_SCALABLE = 1;
pub const PICTURE_TRANSPARENT = 2;
pub const ACTIVATE_WINDOWLESS = 1;
pub const OLEDC_NODRAW = 1;
pub const OLEDC_PAINTBKGND = 2;
pub const OLEDC_OFFSCREEN = 4;
pub const VIEWSTATUS_OPAQUE = 1;
pub const VIEWSTATUS_SOLIDBKGND = 2;
pub const VIEWSTATUS_DVASPECTOPAQUE = 4;
pub const VIEWSTATUS_DVASPECTTRANSPARENT = 8;
pub const VIEWSTATUS_SURFACE = 16;
pub const VIEWSTATUS_3DSURFACE = 32;
pub const HITRESULT_OUTSIDE = 0;
pub const HITRESULT_TRANSPARENT = 1;
pub const HITRESULT_CLOSE = 2;
pub const HITRESULT_HIT = 3;
pub const DVEXTENT_CONTENT = 0;
pub const DVEXTENT_INTEGRAL = 1;
pub const DVASPECTINFOFLAG_CANOPTIMIZE = 1;
pub const POINTERINACTIVE_ACTIVATEONENTRY = 1;
pub const POINTERINACTIVE_DEACTIVATEONLEAVE = 2;
pub const POINTERINACTIVE_ACTIVATEONDRAG = 4;
pub const PROPBAG2_TYPE_UNDEFINED = 0;
pub const PROPBAG2_TYPE_DATA = 1;
pub const PROPBAG2_TYPE_URL = 2;
pub const PROPBAG2_TYPE_OBJECT = 3;
pub const PROPBAG2_TYPE_STREAM = 4;
pub const PROPBAG2_TYPE_STORAGE = 5;
pub const PROPBAG2_TYPE_MONIKER = 6;
pub const QACONTAINER_SHOWHATCHING = 1;
pub const QACONTAINER_SHOWGRABHANDLES = 2;
pub const QACONTAINER_USERMODE = 4;
pub const QACONTAINER_DISPLAYASDEFAULT = 8;
pub const QACONTAINER_UIDEAD = 16;
pub const QACONTAINER_AUTOCLIP = 32;
pub const QACONTAINER_MESSAGEREFLECT = 64;
pub const QACONTAINER_SUPPORTSMNEMONICS = 128;
pub const triUnchecked = 0;
pub const triChecked = 1;
pub const triGray = 2;
pub const DOCMISC_CANCREATEMULTIPLEVIEWS = 1;
pub const DOCMISC_SUPPORTCOMPLEXRECTANGLES = 2;
pub const DOCMISC_CANTOPENEDIT = 4;
pub const DOCMISC_NOFILESUPPORT = 8;
pub const PRINTFLAG_MAYBOTHERUSER = 1;
pub const PRINTFLAG_PROMPTUSER = 2;
pub const PRINTFLAG_USERMAYCHANGEPRINTER = 4;
pub const PRINTFLAG_RECOMPOSETODEVICE = 8;
pub const PRINTFLAG_DONTACTUALLYPRINT = 16;
pub const PRINTFLAG_FORCEPROPERTIES = 32;
pub const PRINTFLAG_PRINTTOFILE = 64;
pub const OLECMDF_SUPPORTED = 1;
pub const OLECMDF_ENABLED = 2;
pub const OLECMDF_LATCHED = 4;
pub const OLECMDF_NINCHED = 8;
pub const OLECMDF_INVISIBLE = 16;
pub const OLECMDF_DEFHIDEONCTXTMENU = 32;
pub const OLECMDTEXTF_NONE = 0;
pub const OLECMDTEXTF_NAME = 1;
pub const OLECMDTEXTF_STATUS = 2;
pub const OLECMDEXECOPT_DODEFAULT = 0;
pub const OLECMDEXECOPT_PROMPTUSER = 1;
pub const OLECMDEXECOPT_DONTPROMPTUSER = 2;
pub const OLECMDEXECOPT_SHOWHELP = 3;
pub const OLECMDID_OPEN = 1;
pub const OLECMDID_NEW = 2;
pub const OLECMDID_SAVE = 3;
pub const OLECMDID_SAVEAS = 4;
pub const OLECMDID_SAVECOPYAS = 5;
pub const OLECMDID_PRINT = 6;
pub const OLECMDID_PRINTPREVIEW = 7;
pub const OLECMDID_PAGESETUP = 8;
pub const OLECMDID_SPELL = 9;
pub const OLECMDID_PROPERTIES = 10;
pub const OLECMDID_CUT = 11;
pub const OLECMDID_COPY = 12;
pub const OLECMDID_PASTE = 13;
pub const OLECMDID_PASTESPECIAL = 14;
pub const OLECMDID_UNDO = 15;
pub const OLECMDID_REDO = 16;
pub const OLECMDID_SELECTALL = 17;
pub const OLECMDID_CLEARSELECTION = 18;
pub const OLECMDID_ZOOM = 19;
pub const OLECMDID_GETZOOMRANGE = 20;
pub const OLECMDID_UPDATECOMMANDS = 21;
pub const OLECMDID_REFRESH = 22;
pub const OLECMDID_STOP = 23;
pub const OLECMDID_HIDETOOLBARS = 24;
pub const OLECMDID_SETPROGRESSMAX = 25;
pub const OLECMDID_SETPROGRESSPOS = 26;
pub const OLECMDID_SETPROGRESSTEXT = 27;
pub const OLECMDID_SETTITLE = 28;
pub const OLECMDID_SETDOWNLOADSTATE = 29;
pub const OLECMDID_STOPDOWNLOAD = 30;
pub const OLECMDID_ONTOOLBARACTIVATED = 31;
pub const OLECMDID_FIND = 32;
pub const OLECMDID_DELETE = 33;
pub const OLECMDID_HTTPEQUIV = 34;
pub const OLECMDID_HTTPEQUIV_DONE = 35;
pub const OLECMDID_ENABLE_INTERACTION = 36;
pub const OLECMDID_ONUNLOAD = 37;
pub const OLECMDID_PROPERTYBAG2 = 38;
pub const OLECMDID_PREREFRESH = 39;
pub const OLECMDID_SHOWSCRIPTERROR = 40;
pub const OLECMDID_SHOWMESSAGE = 41;
pub const OLECMDID_SHOWFIND = 42;
pub const OLECMDID_SHOWPAGESETUP = 43;
pub const OLECMDID_SHOWPRINT = 44;
pub const OLECMDID_CLOSE = 45;
pub const OLECMDID_ALLOWUILESSSAVEAS = 46;
pub const OLECMDID_DONTDOWNLOADCSS = 47;
pub const OLECMDID_UPDATEPAGESTATUS = 48;
pub const OLECMDID_PRINT2 = 49;
pub const OLECMDID_PRINTPREVIEW2 = 50;
pub const OLECMDID_SETPRINTTEMPLATE = 51;
pub const OLECMDID_GETPRINTTEMPLATE = 52;
pub const OLECMDID_PAGEACTIONBLOCKED = 55;
pub const OLECMDID_PAGEACTIONUIQUERY = 56;
pub const OLECMDID_FOCUSVIEWCONTROLS = 57;
pub const OLECMDID_FOCUSVIEWCONTROLSQUERY = 58;
pub const OLECMDID_SHOWPAGEACTIONMENU = 59;
pub const OLECMDID_ADDTRAVELENTRY = 60;
pub const OLECMDID_UPDATETRAVELENTRY = 61;
pub const OLECMDID_UPDATEBACKFORWARDSTATE = 62;
pub const OLECMDID_OPTICAL_ZOOM = 63;
pub const OLECMDID_OPTICAL_GETZOOMRANGE = 64;
pub const OLECMDID_WINDOWSTATECHANGED = 65;
pub const OLECMDID_ACTIVEXINSTALLSCOPE = 66;
pub const OLECMDID_UPDATETRAVELENTRY_DATARECOVERY = 67;
pub const OLECMDID_SHOWTASKDLG = 68;
pub const OLECMDID_POPSTATEEVENT = 69;
pub const OLECMDID_VIEWPORT_MODE = 70;
pub const OLECMDID_LAYOUT_VIEWPORT_WIDTH = 71;
pub const OLECMDID_VISUAL_VIEWPORT_EXCLUDE_BOTTOM = 72;
pub const OLECMDID_USER_OPTICAL_ZOOM = 73;
pub const OLECMDID_PAGEAVAILABLE = 74;
pub const OLECMDID_GETUSERSCALABLE = 75;
pub const OLECMDID_UPDATE_CARET = 76;
pub const OLECMDID_ENABLE_VISIBILITY = 77;
pub const OLECMDID_MEDIA_PLAYBACK = 78;
pub const OLECMDID_SETFAVICON = 79;
pub const OLECMDID_SET_HOST_FULLSCREENMODE = 80;
pub const OLECMDID_EXITFULLSCREEN = 81;
pub const OLECMDID_SCROLLCOMPLETE = 82;
pub const OLECMDID_ONBEFOREUNLOAD = 83;
pub const OLECMDID_SHOWMESSAGE_BLOCKABLE = 84;
pub const OLECMDID_SHOWTASKDLG_BLOCKABLE = 85;
pub const MEDIAPLAYBACK_RESUME = 0;
pub const MEDIAPLAYBACK_PAUSE = 1;
pub const MEDIAPLAYBACK_PAUSE_AND_SUSPEND = 2;
pub const MEDIAPLAYBACK_RESUME_FROM_SUSPEND = 3;
pub const IGNOREMIME_PROMPT = 1;
pub const IGNOREMIME_TEXT = 2;
pub const WPCSETTING_LOGGING_ENABLED = 1;
pub const WPCSETTING_FILEDOWNLOAD_BLOCKED = 2;
pub const OLECMDIDF_REFRESH_NORMAL = 0;
pub const OLECMDIDF_REFRESH_IFEXPIRED = 1;
pub const OLECMDIDF_REFRESH_CONTINUE = 2;
pub const OLECMDIDF_REFRESH_COMPLETELY = 3;
pub const OLECMDIDF_REFRESH_NO_CACHE = 4;
pub const OLECMDIDF_REFRESH_RELOAD = 5;
pub const OLECMDIDF_REFRESH_LEVELMASK = 255;
pub const OLECMDIDF_REFRESH_CLEARUSERINPUT = 4096;
pub const OLECMDIDF_REFRESH_PROMPTIFOFFLINE = 8192;
pub const OLECMDIDF_REFRESH_THROUGHSCRIPT = 16384;
pub const OLECMDIDF_REFRESH_SKIPBEFOREUNLOADEVENT = 32768;
pub const OLECMDIDF_REFRESH_PAGEACTION_ACTIVEXINSTALL = 65536;
pub const OLECMDIDF_REFRESH_PAGEACTION_FILEDOWNLOAD = 131072;
pub const OLECMDIDF_REFRESH_PAGEACTION_LOCALMACHINE = 262144;
pub const OLECMDIDF_REFRESH_PAGEACTION_POPUPWINDOW = 524288;
pub const OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNLOCALMACHINE = 1048576;
pub const OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNTRUSTED = 2097152;
pub const OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNINTRANET = 4194304;
pub const OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNINTERNET = 8388608;
pub const OLECMDIDF_REFRESH_PAGEACTION_PROTLOCKDOWNRESTRICTED = 16777216;
pub const OLECMDIDF_REFRESH_PAGEACTION_MIXEDCONTENT = 33554432;
pub const OLECMDIDF_REFRESH_PAGEACTION_INVALID_CERT = 67108864;
pub const OLECMDIDF_REFRESH_PAGEACTION_ALLOW_VERSION = 134217728;
pub const OLECMDIDF_PAGEACTION_FILEDOWNLOAD = 1;
pub const OLECMDIDF_PAGEACTION_ACTIVEXINSTALL = 2;
pub const OLECMDIDF_PAGEACTION_ACTIVEXTRUSTFAIL = 4;
pub const OLECMDIDF_PAGEACTION_ACTIVEXUSERDISABLE = 8;
pub const OLECMDIDF_PAGEACTION_ACTIVEXDISALLOW = 16;
pub const OLECMDIDF_PAGEACTION_ACTIVEXUNSAFE = 32;
pub const OLECMDIDF_PAGEACTION_POPUPWINDOW = 64;
pub const OLECMDIDF_PAGEACTION_LOCALMACHINE = 128;
pub const OLECMDIDF_PAGEACTION_MIMETEXTPLAIN = 256;
pub const OLECMDIDF_PAGEACTION_SCRIPTNAVIGATE = 512;
pub const OLECMDIDF_PAGEACTION_SCRIPTNAVIGATE_ACTIVEXINSTALL = 512;
pub const OLECMDIDF_PAGEACTION_PROTLOCKDOWNLOCALMACHINE = 1024;
pub const OLECMDIDF_PAGEACTION_PROTLOCKDOWNTRUSTED = 2048;
pub const OLECMDIDF_PAGEACTION_PROTLOCKDOWNINTRANET = 4096;
pub const OLECMDIDF_PAGEACTION_PROTLOCKDOWNINTERNET = 8192;
pub const OLECMDIDF_PAGEACTION_PROTLOCKDOWNRESTRICTED = 16384;
pub const OLECMDIDF_PAGEACTION_PROTLOCKDOWNDENY = 32768;
pub const OLECMDIDF_PAGEACTION_POPUPALLOWED = 65536;
pub const OLECMDIDF_PAGEACTION_SCRIPTPROMPT = 131072;
pub const OLECMDIDF_PAGEACTION_ACTIVEXUSERAPPROVAL = 262144;
pub const OLECMDIDF_PAGEACTION_MIXEDCONTENT = 524288;
pub const OLECMDIDF_PAGEACTION_INVALID_CERT = 1048576;
pub const OLECMDIDF_PAGEACTION_INTRANETZONEREQUEST = 2097152;
pub const OLECMDIDF_PAGEACTION_XSSFILTERED = 4194304;
pub const OLECMDIDF_PAGEACTION_SPOOFABLEIDNHOST = 8388608;
pub const OLECMDIDF_PAGEACTION_ACTIVEX_EPM_INCOMPATIBLE = 16777216;
pub const OLECMDIDF_PAGEACTION_SCRIPTNAVIGATE_ACTIVEXUSERAPPROVAL = 33554432;
pub const OLECMDIDF_PAGEACTION_WPCBLOCKED = 67108864;
pub const OLECMDIDF_PAGEACTION_WPCBLOCKED_ACTIVEX = 134217728;
pub const OLECMDIDF_PAGEACTION_EXTENSION_COMPAT_BLOCKED = 268435456;
pub const OLECMDIDF_PAGEACTION_NORESETACTIVEX = 536870912;
pub const OLECMDIDF_PAGEACTION_GENERIC_STATE = 1073741824;
pub const OLECMDIDF_PAGEACTION_RESET = -2147483648;
pub const OLECMDIDF_BROWSERSTATE_EXTENSIONSOFF = 1;
pub const OLECMDIDF_BROWSERSTATE_IESECURITY = 2;
pub const OLECMDIDF_BROWSERSTATE_PROTECTEDMODE_OFF = 4;
pub const OLECMDIDF_BROWSERSTATE_RESET = 8;
pub const OLECMDIDF_BROWSERSTATE_REQUIRESACTIVEX = 16;
pub const OLECMDIDF_BROWSERSTATE_DESKTOPHTMLDIALOG = 32;
pub const OLECMDIDF_BROWSERSTATE_BLOCKEDVERSION = 64;
pub const OLECMDIDF_OPTICAL_ZOOM_NOPERSIST = 1;
pub const OLECMDIDF_OPTICAL_ZOOM_NOLAYOUT = 16;
pub const OLECMDIDF_OPTICAL_ZOOM_NOTRANSIENT = 32;
pub const OLECMDIDF_OPTICAL_ZOOM_RELOADFORNEWTAB = 64;
pub const PAGEACTION_UI_DEFAULT = 0;
pub const PAGEACTION_UI_MODAL = 1;
pub const PAGEACTION_UI_MODELESS = 2;
pub const PAGEACTION_UI_SILENT = 3;
pub const OLECMDIDF_WINDOWSTATE_USERVISIBLE = 1;
pub const OLECMDIDF_WINDOWSTATE_ENABLED = 2;
pub const OLECMDIDF_WINDOWSTATE_USERVISIBLE_VALID = 65536;
pub const OLECMDIDF_WINDOWSTATE_ENABLED_VALID = 131072;
pub const OLECMDIDF_VIEWPORTMODE_FIXED_LAYOUT_WIDTH = 1;
pub const OLECMDIDF_VIEWPORTMODE_EXCLUDE_VISUAL_BOTTOM = 2;
pub const OLECMDIDF_VIEWPORTMODE_FIXED_LAYOUT_WIDTH_VALID = 65536;
pub const OLECMDIDF_VIEWPORTMODE_EXCLUDE_VISUAL_BOTTOM_VALID = 131072;
pub const OLEUIPASTE_ENABLEICON = 2048;
pub const OLEUIPASTE_PASTEONLY = 0;
pub const OLEUIPASTE_PASTE = 512;
pub const OLEUIPASTE_LINKANYTYPE = 1024;
pub const OLEUIPASTE_LINKTYPE1 = 1;
pub const OLEUIPASTE_LINKTYPE2 = 2;
pub const OLEUIPASTE_LINKTYPE3 = 4;
pub const OLEUIPASTE_LINKTYPE4 = 8;
pub const OLEUIPASTE_LINKTYPE5 = 16;
pub const OLEUIPASTE_LINKTYPE6 = 32;
pub const OLEUIPASTE_LINKTYPE7 = 64;
pub const OLEUIPASTE_LINKTYPE8 = 128;

pub const aliases = struct {
    pub const CLIPBOARD_FORMAT = u16;
    pub const OLEIVERB = i32;
    pub const UPDFCACHE_FLAGS = u32;
    pub const ENUM_CONTROLS_WHICH_FLAGS = u32;
    pub const MULTICLASSINFO_FLAGS = u32;
    pub const DROPEFFECT = u32;
    pub const KEYMODIFIERS = u32;
    pub const ACTIVEOBJECT_FLAGS = u32;
    pub const BUSY_DIALOG_FLAGS = u32;
    pub const UI_CONVERT_FLAGS = u32;
    pub const CHANGE_ICON_FLAGS = u32;
    pub const CHANGE_SOURCE_FLAGS = u32;
    pub const EDIT_LINKS_FLAGS = u32;
    pub const INSERT_OBJECT_FLAGS = u32;
    pub const OBJECT_PROPERTIES_FLAGS = u32;
    pub const VIEW_OBJECT_PROPERTIES_FLAGS = u32;
    pub const PARAMFLAGS = u16;
    pub const NUMPARSE_FLAGS = u32;
    pub const PICTYPE = i16;
    pub const VARCMP = u32;
    pub const PASTE_SPECIAL_FLAGS = u32;
    pub const EMBDHLP_FLAGS = u32;
    pub const FDEX_PROP_FLAGS = u32;
    pub const LOAD_PICTURE_FLAGS = u32;
    pub const OLECREATE = u32;
    pub const VARFORMAT_FIRST_DAY = i32;
    pub const VARFORMAT_FIRST_WEEK = i32;
    pub const VARFORMAT_NAMED_FORMAT = i32;
    pub const VARFORMAT_LEADING_DIGIT = i32;
    pub const VARFORMAT_PARENTHESES = i32;
    pub const VARFORMAT_GROUP = i32;
    pub const SF_TYPE = i32;
    pub const TYPEFLAGS = i32;
    pub const LIBFLAGS = i32;
    pub const CHANGEKIND = i32;
    pub const DISCARDCACHE = i32;
    pub const OLEGETMONIKER = i32;
    pub const OLEWHICHMK = i32;
    pub const USERCLASSTYPE = i32;
    pub const OLEMISC = i32;
    pub const OLECLOSE = i32;
    pub const OLERENDER = i32;
    pub const OLEUPDATE = i32;
    pub const OLELINKBIND = i32;
    pub const BINDSPEED = i32;
    pub const OLECONTF = i32;
    pub const OLEVERBATTRIB = i32;
    pub const REGKIND = i32;
    pub const UASFLAGS = i32;
    pub const READYSTATE = i32;
    pub const GUIDKIND = i32;
    pub const CTRLINFO = i32;
    pub const XFORMCOORDS = i32;
    pub const PROPPAGESTATUS = i32;
    pub const PICTUREATTRIBUTES = i32;
    pub const ACTIVATEFLAGS = i32;
    pub const OLEDCFLAGS = i32;
    pub const VIEWSTATUS = i32;
    pub const HITRESULT = i32;
    pub const DVEXTENTMODE = i32;
    pub const DVASPECTINFOFLAG = i32;
    pub const POINTERINACTIVE = i32;
    pub const PROPBAG2_TYPE = i32;
    pub const QACONTAINERFLAGS = i32;
    pub const OLE_TRISTATE = i32;
    pub const DOCMISC = i32;
    pub const PRINTFLAG = i32;
    pub const OLECMDF = i32;
    pub const OLECMDTEXTF = i32;
    pub const OLECMDEXECOPT = i32;
    pub const OLECMDID = i32;
    pub const MEDIAPLAYBACK_STATE = i32;
    pub const IGNOREMIME = i32;
    pub const WPCSETTING = i32;
    pub const OLECMDID_REFRESHFLAG = i32;
    pub const OLECMDID_PAGEACTIONFLAG = i32;
    pub const OLECMDID_BROWSERSTATEFLAG = i32;
    pub const OLECMDID_OPTICAL_ZOOMFLAG = i32;
    pub const PAGEACTION_UI = i32;
    pub const OLECMDID_WINDOWSTATE_FLAG = i32;
    pub const OLECMDID_VIEWPORT_MODE_FLAG = i32;
    pub const OLEUIPASTEFLAG = i32;
};
