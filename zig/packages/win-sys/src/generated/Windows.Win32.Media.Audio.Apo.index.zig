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

pub const method_def_by_name = std.static_string_map.StaticStringMap(MethodRecord).initComptime(.{});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const APOERR_ALREADY_INITIALIZED = -2005073919;
pub const APOERR_NOT_INITIALIZED = -2005073918;
pub const APOERR_FORMAT_NOT_SUPPORTED = -2005073917;
pub const APOERR_INVALID_APO_CLSID = -2005073916;
pub const APOERR_BUFFERS_OVERLAP = -2005073915;
pub const APOERR_ALREADY_UNLOCKED = -2005073914;
pub const APOERR_NUM_CONNECTIONS_INVALID = -2005073913;
pub const APOERR_INVALID_OUTPUT_MAXFRAMECOUNT = -2005073912;
pub const APOERR_INVALID_CONNECTION_FORMAT = -2005073911;
pub const APOERR_APO_LOCKED = -2005073910;
pub const APOERR_INVALID_COEFFCOUNT = -2005073909;
pub const APOERR_INVALID_COEFFICIENT = -2005073908;
pub const APOERR_INVALID_CURVE_PARAM = -2005073907;
pub const APOERR_INVALID_INPUTID = -2005073906;
pub const AUDIO_MIN_CHANNELS = 1;
pub const AUDIO_MAX_CHANNELS = 4096;
pub const AUDIOMEDIATYPE_EQUAL_FORMAT_TYPES = 2;
pub const AUDIOMEDIATYPE_EQUAL_FORMAT_DATA = 4;
pub const AUDIOMEDIATYPE_EQUAL_FORMAT_USER_DATA = 8;
pub const BUFFER_INVALID = 0;
pub const BUFFER_VALID = 1;
pub const BUFFER_SILENT = 2;
pub const APO_CONNECTION_BUFFER_TYPE_ALLOCATED = 0;
pub const APO_CONNECTION_BUFFER_TYPE_EXTERNAL = 1;
pub const APO_CONNECTION_BUFFER_TYPE_DEPENDANT = 2;
pub const APO_FLAG_NONE = 0;
pub const APO_FLAG_INPLACE = 1;
pub const APO_FLAG_SAMPLESPERFRAME_MUST_MATCH = 2;
pub const APO_FLAG_FRAMESPERSECOND_MUST_MATCH = 4;
pub const APO_FLAG_BITSPERSAMPLE_MUST_MATCH = 8;
pub const APO_FLAG_MIXER = 16;
pub const APO_FLAG_DEFAULT = 14;
pub const AUDIO_FLOW_PULL = 0;
pub const AUDIO_FLOW_PUSH = 1;
pub const eAudioConstrictionOff = 0;
pub const eAudioConstriction48_16 = 1;
pub const eAudioConstriction44_16 = 2;
pub const eAudioConstriction14_14 = 3;
pub const eAudioConstrictionMute = 4;
pub const APO_REFERENCE_STREAM_PROPERTIES_NONE = 0;
pub const APO_REFERENCE_STREAM_PROPERTIES_POST_VOLUME_LOOPBACK = 1;
pub const AUDIO_SYSTEMEFFECT_STATE_OFF = 0;
pub const AUDIO_SYSTEMEFFECT_STATE_ON = 1;
pub const APO_LOG_LEVEL_ALWAYS = 0;
pub const APO_LOG_LEVEL_CRITICAL = 1;
pub const APO_LOG_LEVEL_ERROR = 2;
pub const APO_LOG_LEVEL_WARNING = 3;
pub const APO_LOG_LEVEL_INFO = 4;
pub const APO_LOG_LEVEL_VERBOSE = 5;
pub const APO_NOTIFICATION_TYPE_NONE = 0;
pub const APO_NOTIFICATION_TYPE_ENDPOINT_VOLUME = 1;
pub const APO_NOTIFICATION_TYPE_ENDPOINT_PROPERTY_CHANGE = 2;
pub const APO_NOTIFICATION_TYPE_SYSTEM_EFFECTS_PROPERTY_CHANGE = 3;
pub const APO_NOTIFICATION_TYPE_ENDPOINT_VOLUME2 = 4;
pub const APO_NOTIFICATION_TYPE_DEVICE_ORIENTATION = 5;
pub const APO_NOTIFICATION_TYPE_MICROPHONE_BOOST = 6;
pub const APO_NOTIFICATION_TYPE_AUDIO_ENVIRONMENT_STATE_CHANGE = 7;
pub const DEVICE_NOT_ROTATED = 0;
pub const DEVICE_ROTATED_90_DEGREES_CLOCKWISE = 1;
pub const DEVICE_ROTATED_180_DEGREES_CLOCKWISE = 2;
pub const DEVICE_ROTATED_270_DEGREES_CLOCKWISE = 3;

pub const aliases = struct {
    pub const APO_BUFFER_FLAGS = i32;
    pub const APO_CONNECTION_BUFFER_TYPE = i32;
    pub const APO_FLAG = i32;
    pub const AUDIO_FLOW_TYPE = i32;
    pub const EAudioConstriction = i32;
    pub const APO_REFERENCE_STREAM_PROPERTIES = i32;
    pub const AUDIO_SYSTEMEFFECT_STATE = i32;
    pub const APO_LOG_LEVEL = i32;
    pub const APO_NOTIFICATION_TYPE = i32;
    pub const DEVICE_ORIENTATION_TYPE = i32;
};
