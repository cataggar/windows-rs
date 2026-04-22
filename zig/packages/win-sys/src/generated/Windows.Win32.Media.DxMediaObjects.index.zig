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
    .{ "DMORegister", MethodRecord{ .library = "msdmo", .import = "DMORegister", .signature = "\x00\x08\x11\x79\x11\x05\x0f\x11\x0d\x0f\x11\x0d\x09\x09\x0f\x11\xb0\x0d\x09\x0f\x11\xb0\x0d" } },
    .{ "DMOUnregister", MethodRecord{ .library = "msdmo", .import = "DMOUnregister", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x0d" } },
    .{ "DMOEnum", MethodRecord{ .library = "msdmo", .import = "DMOEnum", .signature = "\x00\x07\x11\x79\x0f\x11\x0d\x09\x09\x0f\x11\xb0\x0d\x09\x0f\x11\xb0\x0d\x0f\x12\xb0\x11" } },
    .{ "DMOGetTypes", MethodRecord{ .library = "msdmo", .import = "DMOGetTypes", .signature = "\x00\x07\x11\x79\x0f\x11\x0d\x09\x0f\x09\x0f\x11\xb0\x0d\x09\x0f\x09\x0f\x11\xb0\x0d" } },
    .{ "DMOGetName", MethodRecord{ .library = "msdmo", .import = "DMOGetName", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x11\x05" } },
    .{ "MoInitMediaType", MethodRecord{ .library = "msdmo", .import = "MoInitMediaType", .signature = "\x00\x02\x11\x79\x0f\x11\xb0\x15\x09" } },
    .{ "MoFreeMediaType", MethodRecord{ .library = "msdmo", .import = "MoFreeMediaType", .signature = "\x00\x01\x11\x79\x0f\x11\xb0\x15" } },
    .{ "MoCopyMediaType", MethodRecord{ .library = "msdmo", .import = "MoCopyMediaType", .signature = "\x00\x02\x11\x79\x0f\x11\xb0\x15\x0f\x11\xb0\x15" } },
    .{ "MoCreateMediaType", MethodRecord{ .library = "msdmo", .import = "MoCreateMediaType", .signature = "\x00\x02\x11\x79\x0f\x0f\x11\xb0\x15\x09" } },
    .{ "MoDeleteMediaType", MethodRecord{ .library = "msdmo", .import = "MoDeleteMediaType", .signature = "\x00\x01\x11\x79\x0f\x11\xb0\x15" } },
    .{ "MoDuplicateMediaType", MethodRecord{ .library = "msdmo", .import = "MoDuplicateMediaType", .signature = "\x00\x02\x11\x79\x0f\x0f\x11\xb0\x15\x0f\x11\xb0\x15" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x300d => TypeRefEntry{ .namespace = "Windows.Win32.Media.DxMediaObjects", .name = "DMO_PARTIAL_MEDIATYPE" },
        0x3011 => TypeRefEntry{ .namespace = "Windows.Win32.Media.DxMediaObjects", .name = "IEnumDMO" },
        0x3015 => TypeRefEntry{ .namespace = "Windows.Win32.Media.DxMediaObjects", .name = "DMO_MEDIA_TYPE" },
        else => null,
    };
}

pub const DMO_E_INVALIDSTREAMINDEX = -2147220991;
pub const DMO_E_INVALIDTYPE = -2147220990;
pub const DMO_E_TYPE_NOT_SET = -2147220989;
pub const DMO_E_NOTACCEPTING = -2147220988;
pub const DMO_E_TYPE_NOT_ACCEPTED = -2147220987;
pub const DMO_E_NO_MORE_ITEMS = -2147220986;
pub const DMO_INPUT_DATA_BUFFERF_SYNCPOINT = 1;
pub const DMO_INPUT_DATA_BUFFERF_TIME = 2;
pub const DMO_INPUT_DATA_BUFFERF_TIMELENGTH = 4;
pub const DMO_INPUT_DATA_BUFFERF_DISCONTINUITY = 8;
pub const DMO_OUTPUT_DATA_BUFFERF_SYNCPOINT = 1;
pub const DMO_OUTPUT_DATA_BUFFERF_TIME = 2;
pub const DMO_OUTPUT_DATA_BUFFERF_TIMELENGTH = 4;
pub const DMO_OUTPUT_DATA_BUFFERF_DISCONTINUITY = 8;
pub const DMO_OUTPUT_DATA_BUFFERF_INCOMPLETE = 16777216;
pub const DMO_INPUT_STATUSF_ACCEPT_DATA = 1;
pub const DMO_INPUT_STREAMF_WHOLE_SAMPLES = 1;
pub const DMO_INPUT_STREAMF_SINGLE_SAMPLE_PER_BUFFER = 2;
pub const DMO_INPUT_STREAMF_FIXED_SAMPLE_SIZE = 4;
pub const DMO_INPUT_STREAMF_HOLDS_BUFFERS = 8;
pub const DMO_OUTPUT_STREAMF_WHOLE_SAMPLES = 1;
pub const DMO_OUTPUT_STREAMF_SINGLE_SAMPLE_PER_BUFFER = 2;
pub const DMO_OUTPUT_STREAMF_FIXED_SAMPLE_SIZE = 4;
pub const DMO_OUTPUT_STREAMF_DISCARDABLE = 8;
pub const DMO_OUTPUT_STREAMF_OPTIONAL = 16;
pub const DMO_SET_TYPEF_TEST_ONLY = 1;
pub const DMO_SET_TYPEF_CLEAR = 2;
pub const DMO_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER = 1;
pub const DMO_INPLACE_NORMAL = 0;
pub const DMO_INPLACE_ZERO = 1;
pub const DMO_QUALITY_STATUS_ENABLED = 1;
pub const DMO_VOSF_NEEDS_PREVIOUS_SAMPLE = 1;
pub const DMO_REGISTERF_IS_KEYED = 1;
pub const DMO_ENUMF_INCLUDE_KEYED = 1;

pub const aliases = struct {
    pub const _DMO_INPUT_DATA_BUFFER_FLAGS = i32;
    pub const _DMO_OUTPUT_DATA_BUFFER_FLAGS = i32;
    pub const _DMO_INPUT_STATUS_FLAGS = i32;
    pub const _DMO_INPUT_STREAM_INFO_FLAGS = i32;
    pub const _DMO_OUTPUT_STREAM_INFO_FLAGS = i32;
    pub const _DMO_SET_TYPE_FLAGS = i32;
    pub const _DMO_PROCESS_OUTPUT_FLAGS = i32;
    pub const _DMO_INPLACE_PROCESS_FLAGS = i32;
    pub const _DMO_QUALITY_STATUS_FLAGS = i32;
    pub const _DMO_VIDEO_OUTPUT_STREAM_FLAGS = i32;
    pub const DMO_REGISTER_FLAGS = i32;
    pub const DMO_ENUM_FLAGS = i32;
};
