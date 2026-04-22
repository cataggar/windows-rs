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
    .{ "D3D11On12CreateDevice", MethodRecord{ .library = "d3d11", .import = "D3D11On12CreateDevice", .signature = "\x00\x0a\x11\x79\x12\x82\xb1\x09\x0f\x11\x8a\xb5\x09\x0f\x12\x82\xb1\x09\x09\x0f\x12\x8a\xb9\x0f\x12\x8a\xbd\x0f\x11\x8a\xb5" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0xab5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D", .name = "D3D_FEATURE_LEVEL" },
        0xab9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D11", .name = "ID3D11Device" },
        0xabd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D11", .name = "ID3D11DeviceContext" },
        else => null,
    };
}

