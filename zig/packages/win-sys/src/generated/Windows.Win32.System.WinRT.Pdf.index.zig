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
    .{ "PdfCreateRenderer", MethodRecord{ .library = "Windows.Data.Pdf", .import = "PdfCreateRenderer", .signature = "\x00\x02\x11\x79\x12\xad\x75\x0f\x12\xc0\x00\xc4\xcd" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2d75 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Dxgi", .name = "IDXGIDevice" },
        0xc4cd => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT.Pdf", .name = "IPdfRendererNative" },
        else => null,
    };
}

pub const aliases = struct {
    pub const PFN_PDF_CREATE_RENDERER = ?*const anyopaque;
};
