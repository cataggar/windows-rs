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
    .{ "DxcCreateInstance", MethodRecord{ .library = "dxcompiler", .import = "DxcCreateInstance", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "DxcCreateInstance2", MethodRecord{ .library = "dxcompiler", .import = "DxcCreateInstance2", .signature = "\x00\x04\x11\x79\x12\x82\xd9\x0f\x11\x0d\x0f\x11\x0d\x0f\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IMalloc" },
        else => null,
    };
}

pub const DXC_HASHFLAG_INCLUDES_SOURCE = 1;
pub const DxcValidatorFlags_Default = 0;
pub const DxcValidatorFlags_InPlaceEdit = 1;
pub const DxcValidatorFlags_RootSignatureOnly = 2;
pub const DxcValidatorFlags_ModuleOnly = 4;
pub const DxcValidatorFlags_ValidMask = 7;
pub const DxcVersionInfoFlags_None = 0;
pub const DxcVersionInfoFlags_Debug = 1;
pub const DxcVersionInfoFlags_Internal = 2;
pub const DXC_CP_ACP = 0;
pub const DXC_CP_UTF16 = 1200;
pub const DXC_CP_UTF8 = 65001;
pub const DXC_CP_UTF32 = 12000;
pub const DXC_CP_WIDE = 1200;
pub const DXC_OUT_NONE = 0;
pub const DXC_OUT_OBJECT = 1;
pub const DXC_OUT_ERRORS = 2;
pub const DXC_OUT_PDB = 3;
pub const DXC_OUT_SHADER_HASH = 4;
pub const DXC_OUT_DISASSEMBLY = 5;
pub const DXC_OUT_HLSL = 6;
pub const DXC_OUT_TEXT = 7;
pub const DXC_OUT_REFLECTION = 8;
pub const DXC_OUT_ROOT_SIGNATURE = 9;
pub const DXC_OUT_EXTRA_OUTPUTS = 10;
pub const DXC_OUT_REMARKS = 11;
pub const DXC_OUT_TIME_REPORT = 12;
pub const DXC_OUT_TIME_TRACE = 13;
pub const DXC_OUT_LAST = 13;
pub const DXC_OUT_NUM_ENUMS = 14;

pub const aliases = struct {
    pub const DXC_CP = u32;
    pub const DXC_OUT_KIND = i32;
    pub const DxcCreateInstanceProc = ?*const anyopaque;
    pub const DxcCreateInstance2Proc = ?*const anyopaque;
};
