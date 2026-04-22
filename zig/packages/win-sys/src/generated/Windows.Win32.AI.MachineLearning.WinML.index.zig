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
    .{ "WinMLCreateRuntime", MethodRecord{ .library = "winml", .import = "WinMLCreateRuntime", .signature = "\x00\x01\x11\x79\x0f\x12\xa8\x11" } },
    .{ "MLCreateOperatorRegistry", MethodRecord{ .library = "windows.ai.machinelearning", .import = "MLCreateOperatorRegistry", .signature = "\x00\x01\x11\x79\x0f\x12\xa8\x15" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2811 => TypeRefEntry{ .namespace = "Windows.Win32.AI.MachineLearning.WinML", .name = "IWinMLRuntime" },
        0x2815 => TypeRefEntry{ .namespace = "Windows.Win32.AI.MachineLearning.WinML", .name = "IMLOperatorRegistry" },
        else => null,
    };
}

pub const WINML_TENSOR_DIMENSION_COUNT_MAX = 4;
pub const WINML_TENSOR_UNDEFINED = 0;
pub const WINML_TENSOR_FLOAT = 1;
pub const WINML_TENSOR_UINT8 = 2;
pub const WINML_TENSOR_INT8 = 3;
pub const WINML_TENSOR_UINT16 = 4;
pub const WINML_TENSOR_INT16 = 5;
pub const WINML_TENSOR_INT32 = 6;
pub const WINML_TENSOR_INT64 = 7;
pub const WINML_TENSOR_STRING = 8;
pub const WINML_TENSOR_BOOLEAN = 9;
pub const WINML_TENSOR_FLOAT16 = 10;
pub const WINML_TENSOR_DOUBLE = 11;
pub const WINML_TENSOR_UINT32 = 12;
pub const WINML_TENSOR_UINT64 = 13;
pub const WINML_TENSOR_COMPLEX64 = 14;
pub const WINML_TENSOR_COMPLEX128 = 15;
pub const WINML_FEATURE_UNDEFINED = 0;
pub const WINML_FEATURE_TENSOR = 1;
pub const WINML_FEATURE_SEQUENCE = 2;
pub const WINML_FEATURE_MAP = 3;
pub const WINML_FEATURE_IMAGE = 4;
pub const WINML_BINDING_UNDEFINED = 0;
pub const WINML_BINDING_TENSOR = 1;
pub const WINML_BINDING_SEQUENCE = 2;
pub const WINML_BINDING_MAP = 3;
pub const WINML_BINDING_IMAGE = 4;
pub const WINML_BINDING_RESOURCE = 5;
pub const WINML_RUNTIME_CNTK = 0;
pub const Undefined = 0;
pub const Float = 2;
pub const Int = 3;
pub const String = 4;
pub const FloatArray = 7;
pub const IntArray = 8;
pub const StringArray = 9;
pub const UInt8 = 2;
pub const Int8 = 3;
pub const UInt16 = 4;
pub const Int16 = 5;
pub const Int32 = 6;
pub const Int64 = 7;
pub const Bool = 9;
pub const Float16 = 10;
pub const Double = 11;
pub const UInt32 = 12;
pub const UInt64 = 13;
pub const Complex64 = 14;
pub const Complex128 = 15;
pub const Tensor = 1;
pub const SequenceTensor = 2;
pub const Primitive = 3;
pub const Single = 0;
pub const Optional = 1;
pub const Variadic = 2;
pub const EdgeDescription = 0;
pub const Label = 1;
pub const None = 0;
pub const AllowDynamicInputShapes = 1;
pub const Cpu = 1;
pub const D3D12 = 2;

pub const aliases = struct {
    pub const WINML_TENSOR_DATA_TYPE = i32;
    pub const WINML_FEATURE_TYPE = i32;
    pub const WINML_BINDING_TYPE = i32;
    pub const WINML_RUNTIME_TYPE = i32;
    pub const MLOperatorAttributeType = u32;
    pub const MLOperatorTensorDataType = u32;
    pub const MLOperatorEdgeType = u32;
    pub const MLOperatorParameterOptions = u32;
    pub const MLOperatorSchemaEdgeTypeFormat = i32;
    pub const MLOperatorKernelOptions = u32;
    pub const MLOperatorExecutionType = u32;
};
