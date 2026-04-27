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
    .{ "CheckDeveloperLicense", MethodRecord{ .library = "WSClient", .import = "CheckDeveloperLicense", .signature = "\x00\x01\x11\x79\x0f\x11\x80\x9d" } },
    .{ "AcquireDeveloperLicense", MethodRecord{ .library = "WSClient", .import = "AcquireDeveloperLicense", .signature = "\x00\x02\x11\x79\x11\x25\x0f\x11\x80\x9d" } },
    .{ "RemoveDeveloperLicense", MethodRecord{ .library = "WSClient", .import = "RemoveDeveloperLicense", .signature = "\x00\x01\x11\x79\x11\x25" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        else => null,
    };
}

