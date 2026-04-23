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
    .{ "CreateDirect3D11DeviceFromDXGIDevice", MethodRecord{ .library = "d3d11", .import = "CreateDirect3D11DeviceFromDXGIDevice", .signature = "\x00\x02\x11\x79\x12\xad\x75\x0f\x12\xad\x61" } },
    .{ "CreateDirect3D11SurfaceFromDXGISurface", MethodRecord{ .library = "d3d11", .import = "CreateDirect3D11SurfaceFromDXGISurface", .signature = "\x00\x02\x11\x79\x12\xad\x81\x0f\x12\xad\x61" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2d61 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "IInspectable" },
        0x2d75 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Dxgi", .name = "IDXGIDevice" },
        0x2d81 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Dxgi", .name = "IDXGISurface" },
        else => null,
    };
}
