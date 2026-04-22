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
    .{ "UalStart", MethodRecord{ .library = "ualapi", .import = "UalStart", .signature = "\x00\x01\x11\x79\x0f\x11\xc0\x01\x64\xa8" } },
    .{ "UalStop", MethodRecord{ .library = "ualapi", .import = "UalStop", .signature = "\x00\x01\x11\x79\x0f\x11\xc0\x01\x64\xa8" } },
    .{ "UalInstrument", MethodRecord{ .library = "ualapi", .import = "UalInstrument", .signature = "\x00\x01\x11\x79\x0f\x11\xc0\x01\x64\xa8" } },
    .{ "UalRegisterProduct", MethodRecord{ .library = "ualapi", .import = "UalRegisterProduct", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x164a8 => TypeRefEntry{ .namespace = "Windows.Win32.System.UserAccessLogging", .name = "UAL_DATA_BLOB" },
        else => null,
    };
}

