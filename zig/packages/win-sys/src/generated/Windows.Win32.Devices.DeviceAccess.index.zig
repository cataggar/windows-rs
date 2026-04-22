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
    .{ "CreateDeviceAccessInstance", MethodRecord{ .library = "deviceaccess", .import = "CreateDeviceAccessInstance", .signature = "\x00\x03\x11\x79\x11\x05\x09\x0f\x12\xaa\x0d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2a0d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAccess", .name = "ICreateDeviceAccessAsync" },
        else => null,
    };
}

pub const ED_BASE = 4096;
pub const DEV_PORT_SIM = 1;
pub const DEV_PORT_COM1 = 2;
pub const DEV_PORT_COM2 = 3;
pub const DEV_PORT_COM3 = 4;
pub const DEV_PORT_COM4 = 5;
pub const DEV_PORT_DIAQ = 6;
pub const DEV_PORT_ARTI = 7;
pub const DEV_PORT_1394 = 8;
pub const DEV_PORT_USB = 9;
pub const DEV_PORT_MIN = 1;
pub const DEV_PORT_MAX = 9;
pub const ED_TOP = 1;
pub const ED_MIDDLE = 2;
pub const ED_BOTTOM = 4;
pub const ED_LEFT = 256;
pub const ED_CENTER = 512;
pub const ED_RIGHT = 1024;
pub const ED_AUDIO_ALL = 268435456;
pub const ED_AUDIO_1 = 1;
pub const ED_AUDIO_2 = 2;
pub const ED_AUDIO_3 = 4;
pub const ED_AUDIO_4 = 8;
pub const ED_AUDIO_5 = 16;
pub const ED_AUDIO_6 = 32;
pub const ED_AUDIO_7 = 64;
pub const ED_AUDIO_8 = 128;
pub const ED_AUDIO_9 = 256;
pub const ED_AUDIO_10 = 512;
pub const ED_AUDIO_11 = 1024;
pub const ED_AUDIO_12 = 2048;
pub const ED_AUDIO_13 = 4096;
pub const ED_AUDIO_14 = 8192;
pub const ED_AUDIO_15 = 16384;
pub const ED_AUDIO_16 = 32768;
pub const ED_AUDIO_17 = 65536;
pub const ED_AUDIO_18 = 131072;
pub const ED_AUDIO_19 = 262144;
pub const ED_AUDIO_20 = 524288;
pub const ED_AUDIO_21 = 1048576;
pub const ED_AUDIO_22 = 2097152;
pub const ED_AUDIO_23 = 4194304;
pub const ED_AUDIO_24 = 8388608;
pub const ED_VIDEO = 33554432;
