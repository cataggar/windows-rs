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
    .{ "D3DReadFileToBlob", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DReadFileToBlob", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x12\x8a\xcd" } },
    .{ "D3DWriteBlobToFile", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DWriteBlobToFile", .signature = "\x00\x03\x11\x79\x12\x8a\xcd\x11\x05\x11\x59" } },
    .{ "D3DCompile", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DCompile", .signature = "\x00\x0b\x11\x79\x0f\x01\x19\x11\x3d\x0f\x11\xad\x8d\x12\xad\x91\x11\x3d\x11\x3d\x09\x09\x0f\x12\x8a\xcd\x0f\x12\x8a\xcd" } },
    .{ "D3DCompile2", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DCompile2", .signature = "\x00\x0e\x11\x79\x0f\x01\x19\x11\x3d\x0f\x11\xad\x8d\x12\xad\x91\x11\x3d\x11\x3d\x09\x09\x09\x0f\x01\x19\x0f\x12\x8a\xcd\x0f\x12\x8a\xcd" } },
    .{ "D3DCompileFromFile", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DCompileFromFile", .signature = "\x00\x09\x11\x79\x11\x05\x0f\x11\xad\x8d\x12\xad\x91\x11\x3d\x11\x3d\x09\x09\x0f\x12\x8a\xcd\x0f\x12\x8a\xcd" } },
    .{ "D3DPreprocess", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DPreprocess", .signature = "\x00\x07\x11\x79\x0f\x01\x19\x11\x3d\x0f\x11\xad\x8d\x12\xad\x91\x0f\x12\x8a\xcd\x0f\x12\x8a\xcd" } },
    .{ "D3DGetDebugInfo", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DGetDebugInfo", .signature = "\x00\x03\x11\x79\x0f\x01\x19\x0f\x12\x8a\xcd" } },
    .{ "D3DReflect", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DReflect", .signature = "\x00\x04\x11\x79\x0f\x01\x19\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "D3DReflectLibrary", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DReflectLibrary", .signature = "\x00\x04\x11\x79\x0f\x01\x19\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "D3DDisassemble", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DDisassemble", .signature = "\x00\x05\x11\x79\x0f\x01\x19\x09\x11\x3d\x0f\x12\x8a\xcd" } },
    .{ "D3DDisassembleRegion", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DDisassembleRegion", .signature = "\x00\x08\x11\x79\x0f\x01\x19\x09\x11\x3d\x19\x19\x0f\x19\x0f\x12\x8a\xcd" } },
    .{ "D3DCreateLinker", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DCreateLinker", .signature = "\x00\x01\x11\x79\x0f\x12\xad\x95" } },
    .{ "D3DLoadModule", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DLoadModule", .signature = "\x00\x03\x11\x79\x0f\x01\x19\x0f\x12\xad\x99" } },
    .{ "D3DCreateFunctionLinkingGraph", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DCreateFunctionLinkingGraph", .signature = "\x00\x02\x11\x79\x09\x0f\x12\xad\x9d" } },
    .{ "D3DGetTraceInstructionOffsets", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DGetTraceInstructionOffsets", .signature = "\x00\x07\x11\x79\x0f\x01\x19\x09\x19\x19\x0f\x19\x0f\x19" } },
    .{ "D3DGetInputSignatureBlob", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DGetInputSignatureBlob", .signature = "\x00\x03\x11\x79\x0f\x01\x19\x0f\x12\x8a\xcd" } },
    .{ "D3DGetOutputSignatureBlob", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DGetOutputSignatureBlob", .signature = "\x00\x03\x11\x79\x0f\x01\x19\x0f\x12\x8a\xcd" } },
    .{ "D3DGetInputAndOutputSignatureBlob", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DGetInputAndOutputSignatureBlob", .signature = "\x00\x03\x11\x79\x0f\x01\x19\x0f\x12\x8a\xcd" } },
    .{ "D3DStripShader", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DStripShader", .signature = "\x00\x04\x11\x79\x0f\x01\x19\x09\x0f\x12\x8a\xcd" } },
    .{ "D3DGetBlobPart", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DGetBlobPart", .signature = "\x00\x05\x11\x79\x0f\x01\x19\x11\xad\xa1\x09\x0f\x12\x8a\xcd" } },
    .{ "D3DSetBlobPart", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DSetBlobPart", .signature = "\x00\x07\x11\x79\x0f\x01\x19\x11\xad\xa1\x09\x0f\x01\x19\x0f\x12\x8a\xcd" } },
    .{ "D3DCreateBlob", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DCreateBlob", .signature = "\x00\x02\x11\x79\x19\x0f\x12\x8a\xcd" } },
    .{ "D3DCompressShaders", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DCompressShaders", .signature = "\x00\x04\x11\x79\x09\x0f\x11\xad\xa5\x09\x0f\x12\x8a\xcd" } },
    .{ "D3DDecompressShaders", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DDecompressShaders", .signature = "\x00\x08\x11\x79\x0f\x01\x19\x09\x09\x0f\x09\x09\x0f\x12\x8a\xcd\x0f\x09" } },
    .{ "D3DDisassemble10Effect", MethodRecord{ .library = "D3DCOMPILER_47", .import = "D3DDisassemble10Effect", .signature = "\x00\x03\x11\x79\x12\xad\xa9\x09\x0f\x12\x8a\xcd" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0xacd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D", .name = "ID3DBlob" },
        0x2d8d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D", .name = "D3D_SHADER_MACRO" },
        0x2d91 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D", .name = "ID3DInclude" },
        0x2d95 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D11", .name = "ID3D11Linker" },
        0x2d99 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D11", .name = "ID3D11Module" },
        0x2d9d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D11", .name = "ID3D11FunctionLinkingGraph" },
        0x2da1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D.Fxc", .name = "D3D_BLOB_PART" },
        0x2da5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D.Fxc", .name = "D3D_SHADER_DATA" },
        0x2da9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D10", .name = "ID3D10Effect" },
        else => null,
    };
}

pub const D3D_COMPILER_VERSION = 47;
pub const D3DCOMPILE_DEBUG = 1;
pub const D3DCOMPILE_SKIP_VALIDATION = 2;
pub const D3DCOMPILE_SKIP_OPTIMIZATION = 4;
pub const D3DCOMPILE_PACK_MATRIX_ROW_MAJOR = 8;
pub const D3DCOMPILE_PACK_MATRIX_COLUMN_MAJOR = 16;
pub const D3DCOMPILE_PARTIAL_PRECISION = 32;
pub const D3DCOMPILE_FORCE_VS_SOFTWARE_NO_OPT = 64;
pub const D3DCOMPILE_FORCE_PS_SOFTWARE_NO_OPT = 128;
pub const D3DCOMPILE_NO_PRESHADER = 256;
pub const D3DCOMPILE_AVOID_FLOW_CONTROL = 512;
pub const D3DCOMPILE_PREFER_FLOW_CONTROL = 1024;
pub const D3DCOMPILE_ENABLE_STRICTNESS = 2048;
pub const D3DCOMPILE_ENABLE_BACKWARDS_COMPATIBILITY = 4096;
pub const D3DCOMPILE_IEEE_STRICTNESS = 8192;
pub const D3DCOMPILE_OPTIMIZATION_LEVEL0 = 16384;
pub const D3DCOMPILE_OPTIMIZATION_LEVEL1 = 0;
pub const D3DCOMPILE_OPTIMIZATION_LEVEL3 = 32768;
pub const D3DCOMPILE_RESERVED16 = 65536;
pub const D3DCOMPILE_RESERVED17 = 131072;
pub const D3DCOMPILE_WARNINGS_ARE_ERRORS = 262144;
pub const D3DCOMPILE_RESOURCES_MAY_ALIAS = 524288;
pub const D3DCOMPILE_ENABLE_UNBOUNDED_DESCRIPTOR_TABLES = 1048576;
pub const D3DCOMPILE_ALL_RESOURCES_BOUND = 2097152;
pub const D3DCOMPILE_DEBUG_NAME_FOR_SOURCE = 4194304;
pub const D3DCOMPILE_DEBUG_NAME_FOR_BINARY = 8388608;
pub const D3DCOMPILE_EFFECT_CHILD_EFFECT = 1;
pub const D3DCOMPILE_EFFECT_ALLOW_SLOW_OPS = 2;
pub const D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_LATEST = 0;
pub const D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_0 = 16;
pub const D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_1 = 32;
pub const D3DCOMPILE_SECDATA_MERGE_UAV_SLOTS = 1;
pub const D3DCOMPILE_SECDATA_PRESERVE_TEMPLATE_SLOTS = 2;
pub const D3DCOMPILE_SECDATA_REQUIRE_TEMPLATE_MATCH = 4;
pub const D3D_DISASM_ENABLE_COLOR_CODE = 1;
pub const D3D_DISASM_ENABLE_DEFAULT_VALUE_PRINTS = 2;
pub const D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING = 4;
pub const D3D_DISASM_ENABLE_INSTRUCTION_CYCLE = 8;
pub const D3D_DISASM_DISABLE_DEBUG_INFO = 16;
pub const D3D_DISASM_ENABLE_INSTRUCTION_OFFSET = 32;
pub const D3D_DISASM_INSTRUCTION_ONLY = 64;
pub const D3D_DISASM_PRINT_HEX_LITERALS = 128;
pub const D3D_GET_INST_OFFSETS_INCLUDE_NON_EXECUTABLE = 1;
pub const D3D_COMPRESS_SHADER_KEEP_ALL_PARTS = 1;
pub const D3DCOMPILER_STRIP_REFLECTION_DATA = 1;
pub const D3DCOMPILER_STRIP_DEBUG_INFO = 2;
pub const D3DCOMPILER_STRIP_TEST_BLOBS = 4;
pub const D3DCOMPILER_STRIP_PRIVATE_DATA = 8;
pub const D3DCOMPILER_STRIP_ROOT_SIGNATURE = 16;
pub const D3D_BLOB_INPUT_SIGNATURE_BLOB = 0;
pub const D3D_BLOB_OUTPUT_SIGNATURE_BLOB = 1;
pub const D3D_BLOB_INPUT_AND_OUTPUT_SIGNATURE_BLOB = 2;
pub const D3D_BLOB_PATCH_CONSTANT_SIGNATURE_BLOB = 3;
pub const D3D_BLOB_ALL_SIGNATURE_BLOB = 4;
pub const D3D_BLOB_DEBUG_INFO = 5;
pub const D3D_BLOB_LEGACY_SHADER = 6;
pub const D3D_BLOB_XNA_PREPASS_SHADER = 7;
pub const D3D_BLOB_XNA_SHADER = 8;
pub const D3D_BLOB_PDB = 9;
pub const D3D_BLOB_PRIVATE_DATA = 10;
pub const D3D_BLOB_ROOT_SIGNATURE = 11;
pub const D3D_BLOB_DEBUG_NAME = 12;
pub const D3D_BLOB_TEST_ALTERNATE_SHADER = 32768;
pub const D3D_BLOB_TEST_COMPILE_DETAILS = 32769;
pub const D3D_BLOB_TEST_COMPILE_PERF = 32770;
pub const D3D_BLOB_TEST_COMPILE_REPORT = 32771;

pub const aliases = struct {
    pub const D3DCOMPILER_STRIP_FLAGS = i32;
    pub const D3D_BLOB_PART = i32;
};
