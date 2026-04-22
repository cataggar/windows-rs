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
    .{ "CreateFX", MethodRecord{ .library = "XAudio2_8", .import = "CreateFX", .signature = "\x00\x04\x11\x79\x0f\x11\x0d\x0f\x12\x82\xb1\x0f\x01\x09" } },
    .{ "XAudio2CreateWithVersionInfo", MethodRecord{ .library = "XAudio2_8", .import = "XAudio2CreateWithVersionInfo", .signature = "\x00\x04\x11\x79\x0f\x12\xaf\xf9\x09\x09\x09" } },
    .{ "CreateAudioVolumeMeter", MethodRecord{ .library = "XAudio2_8", .import = "CreateAudioVolumeMeter", .signature = "\x00\x01\x11\x79\x0f\x12\x82\xb1" } },
    .{ "CreateAudioReverb", MethodRecord{ .library = "XAudio2_8", .import = "CreateAudioReverb", .signature = "\x00\x01\x11\x79\x0f\x12\x82\xb1" } },
    .{ "CreateHrtfApo", MethodRecord{ .library = "HrtfApo", .import = "CreateHrtfApo", .signature = "\x00\x02\x11\x79\x0f\x11\xaf\xfd\x0f\x12\xb0\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x2ff9 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio.XAudio2", .name = "IXAudio2" },
        0x2ffd => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio.XAudio2", .name = "HrtfApoInit" },
        0x3001 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio.XAudio2", .name = "IXAPO" },
        else => null,
    };
}

pub const FXEQ_MIN_FRAMERATE = 22000;
pub const FXEQ_MAX_FRAMERATE = 48000;
pub const FXMASTERINGLIMITER_MIN_RELEASE = 1;
pub const FXMASTERINGLIMITER_MAX_RELEASE = 20;
pub const FXMASTERINGLIMITER_DEFAULT_RELEASE = 6;
pub const FXMASTERINGLIMITER_MIN_LOUDNESS = 1;
pub const FXMASTERINGLIMITER_MAX_LOUDNESS = 1800;
pub const FXMASTERINGLIMITER_DEFAULT_LOUDNESS = 1000;
pub const FXLOUDNESS_DEFAULT_MOMENTARY_MS = 400;
pub const FXLOUDNESS_DEFAULT_SHORTTERM_MS = 3000;
pub const XAUDIO2_MAX_BUFFER_BYTES = 2147483648;
pub const XAUDIO2_MAX_QUEUED_BUFFERS = 64;
pub const XAUDIO2_MAX_BUFFERS_SYSTEM = 2;
pub const XAUDIO2_MAX_AUDIO_CHANNELS = 64;
pub const XAUDIO2_MIN_SAMPLE_RATE = 1000;
pub const XAUDIO2_MAX_SAMPLE_RATE = 200000;
pub const XAUDIO2_MAX_LOOP_COUNT = 254;
pub const XAUDIO2_MAX_INSTANCES = 8;
pub const XAUDIO2_MAX_RATIO_TIMES_RATE_XMA_MONO = 600000;
pub const XAUDIO2_MAX_RATIO_TIMES_RATE_XMA_MULTICHANNEL = 300000;
pub const XAUDIO2_COMMIT_NOW = 0;
pub const XAUDIO2_COMMIT_ALL = 0;
pub const XAUDIO2_NO_LOOP_REGION = 0;
pub const XAUDIO2_LOOP_INFINITE = 255;
pub const XAUDIO2_DEFAULT_CHANNELS = 0;
pub const XAUDIO2_DEFAULT_SAMPLERATE = 0;
pub const XAUDIO2_DEBUG_ENGINE = 1;
pub const XAUDIO2_VOICE_NOPITCH = 2;
pub const XAUDIO2_VOICE_NOSRC = 4;
pub const XAUDIO2_VOICE_USEFILTER = 8;
pub const XAUDIO2_PLAY_TAILS = 32;
pub const XAUDIO2_END_OF_STREAM = 64;
pub const XAUDIO2_SEND_USEFILTER = 128;
pub const XAUDIO2_VOICE_NOSAMPLESPLAYED = 256;
pub const XAUDIO2_STOP_ENGINE_WHEN_IDLE = 8192;
pub const XAUDIO2_1024_QUANTUM = 32768;
pub const XAUDIO2_NO_VIRTUAL_AUDIO_CLIENT = 65536;
pub const XAUDIO2_QUANTUM_NUMERATOR = 1;
pub const XAUDIO2_QUANTUM_DENOMINATOR = 100;
pub const FACILITY_XAUDIO2 = 2198;
pub const XAUDIO2_E_INVALID_CALL = -2003435519;
pub const XAUDIO2_E_XMA_DECODER_ERROR = -2003435518;
pub const XAUDIO2_E_XAPO_CREATION_FAILED = -2003435517;
pub const XAUDIO2_E_DEVICE_INVALIDATED = -2003435516;
pub const Processor1 = 1;
pub const Processor2 = 2;
pub const Processor3 = 4;
pub const Processor4 = 8;
pub const Processor5 = 16;
pub const Processor6 = 32;
pub const Processor7 = 64;
pub const Processor8 = 128;
pub const Processor9 = 256;
pub const Processor10 = 512;
pub const Processor11 = 1024;
pub const Processor12 = 2048;
pub const Processor13 = 4096;
pub const Processor14 = 8192;
pub const Processor15 = 16384;
pub const Processor16 = 32768;
pub const Processor17 = 65536;
pub const Processor18 = 131072;
pub const Processor19 = 262144;
pub const Processor20 = 524288;
pub const Processor21 = 1048576;
pub const Processor22 = 2097152;
pub const Processor23 = 4194304;
pub const Processor24 = 8388608;
pub const Processor25 = 16777216;
pub const Processor26 = 33554432;
pub const Processor27 = 67108864;
pub const Processor28 = 134217728;
pub const Processor29 = 268435456;
pub const Processor30 = 536870912;
pub const Processor31 = 1073741824;
pub const Processor32 = 2147483648;
pub const XAUDIO2_ANY_PROCESSOR = 4294967295;
pub const XAUDIO2_USE_DEFAULT_PROCESSOR = 0;
pub const XAUDIO2_DEFAULT_PROCESSOR = 1;
pub const XAUDIO2_LOG_ERRORS = 1;
pub const XAUDIO2_LOG_WARNINGS = 2;
pub const XAUDIO2_LOG_INFO = 4;
pub const XAUDIO2_LOG_DETAIL = 8;
pub const XAUDIO2_LOG_API_CALLS = 16;
pub const XAUDIO2_LOG_FUNC_CALLS = 32;
pub const XAUDIO2_LOG_TIMING = 64;
pub const XAUDIO2_LOG_LOCKS = 128;
pub const XAUDIO2_LOG_MEMORY = 256;
pub const XAUDIO2_LOG_STREAMING = 4096;
pub const XAUDIO2FX_REVERB_MIN_FRAMERATE = 20000;
pub const XAUDIO2FX_REVERB_MAX_FRAMERATE = 48000;
pub const XAUDIO2FX_REVERB_MIN_REFLECTIONS_DELAY = 0;
pub const XAUDIO2FX_REVERB_MIN_REVERB_DELAY = 0;
pub const XAUDIO2FX_REVERB_MIN_REAR_DELAY = 0;
pub const XAUDIO2FX_REVERB_MIN_7POINT1_SIDE_DELAY = 0;
pub const XAUDIO2FX_REVERB_MIN_7POINT1_REAR_DELAY = 0;
pub const XAUDIO2FX_REVERB_MIN_POSITION = 0;
pub const XAUDIO2FX_REVERB_MIN_DIFFUSION = 0;
pub const XAUDIO2FX_REVERB_MIN_LOW_EQ_GAIN = 0;
pub const XAUDIO2FX_REVERB_MIN_LOW_EQ_CUTOFF = 0;
pub const XAUDIO2FX_REVERB_MIN_HIGH_EQ_GAIN = 0;
pub const XAUDIO2FX_REVERB_MIN_HIGH_EQ_CUTOFF = 0;
pub const XAUDIO2FX_REVERB_MAX_REFLECTIONS_DELAY = 300;
pub const XAUDIO2FX_REVERB_MAX_REVERB_DELAY = 85;
pub const XAUDIO2FX_REVERB_MAX_REAR_DELAY = 5;
pub const XAUDIO2FX_REVERB_MAX_7POINT1_SIDE_DELAY = 5;
pub const XAUDIO2FX_REVERB_MAX_7POINT1_REAR_DELAY = 20;
pub const XAUDIO2FX_REVERB_MAX_POSITION = 30;
pub const XAUDIO2FX_REVERB_MAX_DIFFUSION = 15;
pub const XAUDIO2FX_REVERB_MAX_LOW_EQ_GAIN = 12;
pub const XAUDIO2FX_REVERB_MAX_LOW_EQ_CUTOFF = 9;
pub const XAUDIO2FX_REVERB_MAX_HIGH_EQ_GAIN = 8;
pub const XAUDIO2FX_REVERB_MAX_HIGH_EQ_CUTOFF = 14;
pub const XAUDIO2FX_REVERB_DEFAULT_REFLECTIONS_DELAY = 5;
pub const XAUDIO2FX_REVERB_DEFAULT_REVERB_DELAY = 5;
pub const XAUDIO2FX_REVERB_DEFAULT_REAR_DELAY = 5;
pub const XAUDIO2FX_REVERB_DEFAULT_7POINT1_SIDE_DELAY = 5;
pub const XAUDIO2FX_REVERB_DEFAULT_7POINT1_REAR_DELAY = 20;
pub const XAUDIO2FX_REVERB_DEFAULT_POSITION = 6;
pub const XAUDIO2FX_REVERB_DEFAULT_POSITION_MATRIX = 27;
pub const XAUDIO2FX_REVERB_DEFAULT_EARLY_DIFFUSION = 8;
pub const XAUDIO2FX_REVERB_DEFAULT_LATE_DIFFUSION = 8;
pub const XAUDIO2FX_REVERB_DEFAULT_LOW_EQ_GAIN = 8;
pub const XAUDIO2FX_REVERB_DEFAULT_LOW_EQ_CUTOFF = 4;
pub const XAUDIO2FX_REVERB_DEFAULT_HIGH_EQ_GAIN = 8;
pub const XAUDIO2FX_REVERB_DEFAULT_HIGH_EQ_CUTOFF = 4;
pub const XAUDIO2FX_REVERB_DEFAULT_DISABLE_LATE_FIELD = 0;
pub const FACILITY_XAPO = 2199;
pub const XAPO_E_FORMAT_UNSUPPORTED = -2003369983;
pub const XAPO_MIN_CHANNELS = 1;
pub const XAPO_MAX_CHANNELS = 64;
pub const XAPO_MIN_FRAMERATE = 1000;
pub const XAPO_MAX_FRAMERATE = 200000;
pub const XAPO_REGISTRATION_STRING_LENGTH = 256;
pub const XAPO_FLAG_CHANNELS_MUST_MATCH = 1;
pub const XAPO_FLAG_FRAMERATE_MUST_MATCH = 2;
pub const XAPO_FLAG_BITSPERSAMPLE_MUST_MATCH = 4;
pub const XAPO_FLAG_BUFFERCOUNT_MUST_MATCH = 8;
pub const XAPO_FLAG_INPLACE_REQUIRED = 32;
pub const XAPO_FLAG_INPLACE_SUPPORTED = 16;
pub const SPEAKER_MONO = 4;
pub const X3DAUDIO_HANDLE_BYTESIZE = 20;
pub const X3DAUDIO_CALCULATE_MATRIX = 1;
pub const X3DAUDIO_CALCULATE_DELAY = 2;
pub const X3DAUDIO_CALCULATE_LPF_DIRECT = 4;
pub const X3DAUDIO_CALCULATE_LPF_REVERB = 8;
pub const X3DAUDIO_CALCULATE_REVERB = 16;
pub const X3DAUDIO_CALCULATE_DOPPLER = 32;
pub const X3DAUDIO_CALCULATE_EMITTER_ANGLE = 64;
pub const X3DAUDIO_CALCULATE_ZEROCENTER = 65536;
pub const X3DAUDIO_CALCULATE_REDIRECT_TO_LFE = 131072;
pub const XAPO_BUFFER_SILENT = 0;
pub const XAPO_BUFFER_VALID = 1;
pub const LowPassFilter = 0;
pub const BandPassFilter = 1;
pub const HighPassFilter = 2;
pub const NotchFilter = 3;
pub const LowPassOnePoleFilter = 4;
pub const HighPassOnePoleFilter = 5;
pub const OmniDirectional = 0;
pub const Cardioid = 1;
pub const Cone = 2;
pub const Small = 0;
pub const Medium = 1;
pub const Large = 2;
pub const Outdoors = 3;
pub const NaturalDecay = 0;
pub const CustomDecay = 1;

pub const aliases = struct {
    pub const XAPO_BUFFER_FLAGS = i32;
    pub const XAUDIO2_FILTER_TYPE = i32;
    pub const HrtfDirectivityType = i32;
    pub const HrtfEnvironment = i32;
    pub const HrtfDistanceDecayType = i32;
};
