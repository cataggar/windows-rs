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
    .{ "Direct3DCreate9On12Ex", MethodRecord{ .library = "d3d9", .import = "Direct3DCreate9On12Ex", .signature = "\x00\x04\x11\x79\x09\x0f\x11\xad\xd1\x09\x0f\x12\x8a\xf5" } },
    .{ "Direct3DCreate9On12", MethodRecord{ .library = "d3d9", .import = "Direct3DCreate9On12", .signature = "\x00\x03\x12\x8a\xf1\x09\x0f\x11\xad\xd1\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0xaf1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D9", .name = "IDirect3D9" },
        0xaf5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D9", .name = "IDirect3D9Ex" },
        0x2dd1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Direct3D9on12", .name = "D3D9ON12_ARGS" },
        else => null,
    };
}

pub const MAX_D3D9ON12_QUEUES = 2;
