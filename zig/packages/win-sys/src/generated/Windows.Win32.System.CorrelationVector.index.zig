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
    .{ "RtlInitializeCorrelationVector", MethodRecord{ .library = "ntdll", .import = "RtlInitializeCorrelationVector", .signature = "\x00\x03\x09\x0f\x11\xbd\xb9\x08\x0f\x11\x0d" } },
    .{ "RtlIncrementCorrelationVector", MethodRecord{ .library = "ntdll", .import = "RtlIncrementCorrelationVector", .signature = "\x00\x01\x09\x0f\x11\xbd\xb9" } },
    .{ "RtlExtendCorrelationVector", MethodRecord{ .library = "ntdll", .import = "RtlExtendCorrelationVector", .signature = "\x00\x01\x09\x0f\x11\xbd\xb9" } },
    .{ "RtlValidateCorrelationVector", MethodRecord{ .library = "ntdll", .import = "RtlValidateCorrelationVector", .signature = "\x00\x01\x09\x0f\x11\xbd\xb9" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3db9 => TypeRefEntry{ .namespace = "Windows.Win32.System.CorrelationVector", .name = "CORRELATION_VECTOR" },
        else => null,
    };
}

pub const RTL_CORRELATION_VECTOR_STRING_LENGTH = 129;
pub const RTL_CORRELATION_VECTOR_V1_PREFIX_LENGTH = 16;
pub const RTL_CORRELATION_VECTOR_V1_LENGTH = 64;
pub const RTL_CORRELATION_VECTOR_V2_PREFIX_LENGTH = 22;
pub const RTL_CORRELATION_VECTOR_V2_LENGTH = 128;
