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
    .{ "WMIsContentProtected", MethodRecord{ .library = "WMVCore", .import = "WMIsContentProtected", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x59" } },
    .{ "WMCreateWriter", MethodRecord{ .library = "WMVCore", .import = "WMCreateWriter", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x0f\x12\xb0\x31" } },
    .{ "WMCreateReader", MethodRecord{ .library = "WMVCore", .import = "WMCreateReader", .signature = "\x00\x03\x11\x79\x12\x82\xb1\x09\x0f\x12\xb0\x35" } },
    .{ "WMCreateSyncReader", MethodRecord{ .library = "WMVCore", .import = "WMCreateSyncReader", .signature = "\x00\x03\x11\x79\x12\x82\xb1\x09\x0f\x12\xb0\x39" } },
    .{ "WMCreateEditor", MethodRecord{ .library = "WMVCore", .import = "WMCreateEditor", .signature = "\x00\x01\x11\x79\x0f\x12\xb0\x3d" } },
    .{ "WMCreateIndexer", MethodRecord{ .library = "WMVCore", .import = "WMCreateIndexer", .signature = "\x00\x01\x11\x79\x0f\x12\xb0\x41" } },
    .{ "WMCreateBackupRestorer", MethodRecord{ .library = "WMVCore", .import = "WMCreateBackupRestorer", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x0f\x12\xb0\x45" } },
    .{ "WMCreateProfileManager", MethodRecord{ .library = "WMVCore", .import = "WMCreateProfileManager", .signature = "\x00\x01\x11\x79\x0f\x12\xb0\x49" } },
    .{ "WMCreateWriterFileSink", MethodRecord{ .library = "WMVCore", .import = "WMCreateWriterFileSink", .signature = "\x00\x01\x11\x79\x0f\x12\xb0\x4d" } },
    .{ "WMCreateWriterNetworkSink", MethodRecord{ .library = "WMVCore", .import = "WMCreateWriterNetworkSink", .signature = "\x00\x01\x11\x79\x0f\x12\xb0\x51" } },
    .{ "WMCreateWriterPushSink", MethodRecord{ .library = "WMVCore", .import = "WMCreateWriterPushSink", .signature = "\x00\x01\x11\x79\x0f\x12\xb0\x55" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x3031 => TypeRefEntry{ .namespace = "Windows.Win32.Media.WindowsMediaFormat", .name = "IWMWriter" },
        0x3035 => TypeRefEntry{ .namespace = "Windows.Win32.Media.WindowsMediaFormat", .name = "IWMReader" },
        0x3039 => TypeRefEntry{ .namespace = "Windows.Win32.Media.WindowsMediaFormat", .name = "IWMSyncReader" },
        0x303d => TypeRefEntry{ .namespace = "Windows.Win32.Media.WindowsMediaFormat", .name = "IWMMetadataEditor" },
        0x3041 => TypeRefEntry{ .namespace = "Windows.Win32.Media.WindowsMediaFormat", .name = "IWMIndexer" },
        0x3045 => TypeRefEntry{ .namespace = "Windows.Win32.Media.WindowsMediaFormat", .name = "IWMLicenseBackup" },
        0x3049 => TypeRefEntry{ .namespace = "Windows.Win32.Media.WindowsMediaFormat", .name = "IWMProfileManager" },
        0x304d => TypeRefEntry{ .namespace = "Windows.Win32.Media.WindowsMediaFormat", .name = "IWMWriterFileSink" },
        0x3051 => TypeRefEntry{ .namespace = "Windows.Win32.Media.WindowsMediaFormat", .name = "IWMWriterNetworkSink" },
        0x3055 => TypeRefEntry{ .namespace = "Windows.Win32.Media.WindowsMediaFormat", .name = "IWMWriterPushSink" },
        else => null,
    };
}

pub const WMT_VIDEOIMAGE_SAMPLE_INPUT_FRAME = 1;
pub const WMT_VIDEOIMAGE_SAMPLE_OUTPUT_FRAME = 2;
pub const WMT_VIDEOIMAGE_SAMPLE_USES_CURRENT_INPUT_FRAME = 4;
pub const WMT_VIDEOIMAGE_SAMPLE_USES_PREVIOUS_INPUT_FRAME = 8;
pub const WMT_VIDEOIMAGE_SAMPLE_MOTION = 1;
pub const WMT_VIDEOIMAGE_SAMPLE_ROTATION = 2;
pub const WMT_VIDEOIMAGE_SAMPLE_BLENDING = 4;
pub const WMT_VIDEOIMAGE_SAMPLE_ADV_BLENDING = 8;
pub const WMT_VIDEOIMAGE_INTEGER_DENOMINATOR = 65536;
pub const WMT_VIDEOIMAGE_MAGIC_NUMBER = 491406834;
pub const WMT_VIDEOIMAGE_MAGIC_NUMBER_2 = 491406835;
pub const WMT_VIDEOIMAGE_TRANSITION_BOW_TIE = 11;
pub const WMT_VIDEOIMAGE_TRANSITION_CIRCLE = 12;
pub const WMT_VIDEOIMAGE_TRANSITION_CROSS_FADE = 13;
pub const WMT_VIDEOIMAGE_TRANSITION_DIAGONAL = 14;
pub const WMT_VIDEOIMAGE_TRANSITION_DIAMOND = 15;
pub const WMT_VIDEOIMAGE_TRANSITION_FADE_TO_COLOR = 16;
pub const WMT_VIDEOIMAGE_TRANSITION_FILLED_V = 17;
pub const WMT_VIDEOIMAGE_TRANSITION_FLIP = 18;
pub const WMT_VIDEOIMAGE_TRANSITION_INSET = 19;
pub const WMT_VIDEOIMAGE_TRANSITION_IRIS = 20;
pub const WMT_VIDEOIMAGE_TRANSITION_PAGE_ROLL = 21;
pub const WMT_VIDEOIMAGE_TRANSITION_RECTANGLE = 23;
pub const WMT_VIDEOIMAGE_TRANSITION_REVEAL = 24;
pub const WMT_VIDEOIMAGE_TRANSITION_SLIDE = 27;
pub const WMT_VIDEOIMAGE_TRANSITION_SPLIT = 29;
pub const WMT_VIDEOIMAGE_TRANSITION_STAR = 30;
pub const WMT_VIDEOIMAGE_TRANSITION_WHEEL = 31;
pub const WM_SampleExtension_ContentType_Size = 1;
pub const WM_SampleExtension_PixelAspectRatio_Size = 2;
pub const WM_SampleExtension_Timecode_Size = 14;
pub const WM_SampleExtension_SampleDuration_Size = 2;
pub const WM_SampleExtension_ChromaLocation_Size = 1;
pub const WM_SampleExtension_ColorSpaceInfo_Size = 3;
pub const WM_CT_REPEAT_FIRST_FIELD = 16;
pub const WM_CT_BOTTOM_FIELD_FIRST = 32;
pub const WM_CT_TOP_FIELD_FIRST = 64;
pub const WM_CT_INTERLACED = 128;
pub const WM_CL_INTERLACED420 = 0;
pub const WM_CL_PROGRESSIVE420 = 1;
pub const WM_MAX_VIDEO_STREAMS = 63;
pub const WM_MAX_STREAMS = 63;
pub const WMDRM_IMPORT_INIT_STRUCT_DEFINED = 1;
pub const DRM_OPL_TYPES = 1;
pub const g_dwWMSpecialAttributes = 20;
pub const g_dwWMContentAttributes = 5;
pub const g_dwWMNSCAttributes = 5;
pub const AM_CONFIGASFWRITER_PARAM_AUTOINDEX = 1;
pub const AM_CONFIGASFWRITER_PARAM_MULTIPASS = 2;
pub const AM_CONFIGASFWRITER_PARAM_DONTCOMPRESS = 3;
pub const WEBSTREAM_SAMPLE_TYPE_FILE = 1;
pub const WEBSTREAM_SAMPLE_TYPE_RENDER = 2;
pub const WM_SF_CLEANPOINT = 1;
pub const WM_SF_DISCONTINUITY = 2;
pub const WM_SF_DATALOSS = 4;
pub const WM_SFEX_NOTASYNCPOINT = 2;
pub const WM_SFEX_DATALOSS = 4;
pub const WMT_ERROR = 0;
pub const WMT_OPENED = 1;
pub const WMT_BUFFERING_START = 2;
pub const WMT_BUFFERING_STOP = 3;
pub const WMT_EOF = 4;
pub const WMT_END_OF_FILE = 4;
pub const WMT_END_OF_SEGMENT = 5;
pub const WMT_END_OF_STREAMING = 6;
pub const WMT_LOCATING = 7;
pub const WMT_CONNECTING = 8;
pub const WMT_NO_RIGHTS = 9;
pub const WMT_MISSING_CODEC = 10;
pub const WMT_STARTED = 11;
pub const WMT_STOPPED = 12;
pub const WMT_CLOSED = 13;
pub const WMT_STRIDING = 14;
pub const WMT_TIMER = 15;
pub const WMT_INDEX_PROGRESS = 16;
pub const WMT_SAVEAS_START = 17;
pub const WMT_SAVEAS_STOP = 18;
pub const WMT_NEW_SOURCEFLAGS = 19;
pub const WMT_NEW_METADATA = 20;
pub const WMT_BACKUPRESTORE_BEGIN = 21;
pub const WMT_SOURCE_SWITCH = 22;
pub const WMT_ACQUIRE_LICENSE = 23;
pub const WMT_INDIVIDUALIZE = 24;
pub const WMT_NEEDS_INDIVIDUALIZATION = 25;
pub const WMT_NO_RIGHTS_EX = 26;
pub const WMT_BACKUPRESTORE_END = 27;
pub const WMT_BACKUPRESTORE_CONNECTING = 28;
pub const WMT_BACKUPRESTORE_DISCONNECTING = 29;
pub const WMT_ERROR_WITHURL = 30;
pub const WMT_RESTRICTED_LICENSE = 31;
pub const WMT_CLIENT_CONNECT = 32;
pub const WMT_CLIENT_DISCONNECT = 33;
pub const WMT_NATIVE_OUTPUT_PROPS_CHANGED = 34;
pub const WMT_RECONNECT_START = 35;
pub const WMT_RECONNECT_END = 36;
pub const WMT_CLIENT_CONNECT_EX = 37;
pub const WMT_CLIENT_DISCONNECT_EX = 38;
pub const WMT_SET_FEC_SPAN = 39;
pub const WMT_PREROLL_READY = 40;
pub const WMT_PREROLL_COMPLETE = 41;
pub const WMT_CLIENT_PROPERTIES = 42;
pub const WMT_LICENSEURL_SIGNATURE_STATE = 43;
pub const WMT_INIT_PLAYLIST_BURN = 44;
pub const WMT_TRANSCRYPTOR_INIT = 45;
pub const WMT_TRANSCRYPTOR_SEEKED = 46;
pub const WMT_TRANSCRYPTOR_READ = 47;
pub const WMT_TRANSCRYPTOR_CLOSED = 48;
pub const WMT_PROXIMITY_RESULT = 49;
pub const WMT_PROXIMITY_COMPLETED = 50;
pub const WMT_CONTENT_ENABLER = 51;
pub const WMT_OFF = 0;
pub const WMT_CLEANPOINT_ONLY = 1;
pub const WMT_ON = 2;
pub const WMT_IT_NONE = 0;
pub const WMT_IT_BITMAP = 1;
pub const WMT_IT_JPEG = 2;
pub const WMT_IT_GIF = 3;
pub const WMT_TYPE_DWORD = 0;
pub const WMT_TYPE_STRING = 1;
pub const WMT_TYPE_BINARY = 2;
pub const WMT_TYPE_BOOL = 3;
pub const WMT_TYPE_QWORD = 4;
pub const WMT_TYPE_WORD = 5;
pub const WMT_TYPE_GUID = 6;
pub const WMT_IMAGETYPE_BITMAP = 1;
pub const WMT_IMAGETYPE_JPEG = 2;
pub const WMT_IMAGETYPE_GIF = 3;
pub const WMT_VER_4_0 = 262144;
pub const WMT_VER_7_0 = 458752;
pub const WMT_VER_8_0 = 524288;
pub const WMT_VER_9_0 = 589824;
pub const WMT_Storage_Format_MP3 = 0;
pub const WMT_Storage_Format_V1 = 1;
pub const WMT_DRMLA_UNTRUSTED = 0;
pub const WMT_DRMLA_TRUSTED = 1;
pub const WMT_DRMLA_TAMPERED = 2;
pub const WMT_Transport_Type_Unreliable = 0;
pub const WMT_Transport_Type_Reliable = 1;
pub const WMT_PROTOCOL_HTTP = 0;
pub const WMT_PLAY_MODE_AUTOSELECT = 0;
pub const WMT_PLAY_MODE_LOCAL = 1;
pub const WMT_PLAY_MODE_DOWNLOAD = 2;
pub const WMT_PLAY_MODE_STREAMING = 3;
pub const WMT_PROXY_SETTING_NONE = 0;
pub const WMT_PROXY_SETTING_MANUAL = 1;
pub const WMT_PROXY_SETTING_AUTO = 2;
pub const WMT_PROXY_SETTING_BROWSER = 3;
pub const WMT_PROXY_SETTING_MAX = 4;
pub const WMT_CODECINFO_AUDIO = 0;
pub const WMT_CODECINFO_VIDEO = 1;
pub const WMT_CODECINFO_UNKNOWN = -1;
pub const WM_DM_NOTINTERLACED = 0;
pub const WM_DM_DEINTERLACE_NORMAL = 1;
pub const WM_DM_DEINTERLACE_HALFSIZE = 2;
pub const WM_DM_DEINTERLACE_HALFSIZEDOUBLERATE = 3;
pub const WM_DM_DEINTERLACE_INVERSETELECINE = 4;
pub const WM_DM_DEINTERLACE_VERTICALHALFSIZEDOUBLERATE = 5;
pub const WM_DM_IT_DISABLE_COHERENT_MODE = 0;
pub const WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_AA_TOP = 1;
pub const WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BB_TOP = 2;
pub const WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BC_TOP = 3;
pub const WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_CD_TOP = 4;
pub const WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_DD_TOP = 5;
pub const WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_AA_BOTTOM = 6;
pub const WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BB_BOTTOM = 7;
pub const WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_BC_BOTTOM = 8;
pub const WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_CD_BOTTOM = 9;
pub const WM_DM_IT_FIRST_FRAME_IN_CLIP_IS_DD_BOTTOM = 10;
pub const WMT_OFFSET_FORMAT_100NS = 0;
pub const WMT_OFFSET_FORMAT_FRAME_NUMBERS = 1;
pub const WMT_OFFSET_FORMAT_PLAYLIST_OFFSET = 2;
pub const WMT_OFFSET_FORMAT_TIMECODE = 3;
pub const WMT_OFFSET_FORMAT_100NS_APPROXIMATE = 4;
pub const WMT_IT_PRESENTATION_TIME = 0;
pub const WMT_IT_FRAME_NUMBERS = 1;
pub const WMT_IT_TIMECODE = 2;
pub const WMT_IT_NEAREST_DATA_UNIT = 1;
pub const WMT_IT_NEAREST_OBJECT = 2;
pub const WMT_IT_NEAREST_CLEAN_POINT = 3;
pub const WMT_FM_SINGLE_BUFFERS = 1;
pub const WMT_FM_FILESINK_DATA_UNITS = 2;
pub const WMT_FM_FILESINK_UNBUFFERED = 4;
pub const WMT_MS_CLASS_MUSIC = 0;
pub const WMT_MS_CLASS_SPEECH = 1;
pub const WMT_MS_CLASS_MIXED = 2;
pub const WMT_WMETYPE_AUDIO = 1;
pub const WMT_WMETYPE_VIDEO = 2;
pub const WM_PLAYBACK_DRC_HIGH = 0;
pub const WM_PLAYBACK_DRC_MEDIUM = 1;
pub const WM_PLAYBACK_DRC_LOW = 2;
pub const WMT_TIMECODE_FRAMERATE_30 = 0;
pub const WMT_TIMECODE_FRAMERATE_30DROP = 1;
pub const WMT_TIMECODE_FRAMERATE_25 = 2;
pub const WMT_TIMECODE_FRAMERATE_24 = 3;
pub const WMT_CREDENTIAL_SAVE = 1;
pub const WMT_CREDENTIAL_DONT_CACHE = 2;
pub const WMT_CREDENTIAL_CLEAR_TEXT = 4;
pub const WMT_CREDENTIAL_PROXY = 8;
pub const WMT_CREDENTIAL_ENCRYPT = 16;
pub const WM_AETYPE_INCLUDE = 105;
pub const WM_AETYPE_EXCLUDE = 101;
pub const WMT_RIGHT_PLAYBACK = 1;
pub const WMT_RIGHT_COPY_TO_NON_SDMI_DEVICE = 2;
pub const WMT_RIGHT_COPY_TO_CD = 8;
pub const WMT_RIGHT_COPY_TO_SDMI_DEVICE = 16;
pub const WMT_RIGHT_ONE_TIME = 32;
pub const WMT_RIGHT_SAVE_STREAM_PROTECTED = 64;
pub const WMT_RIGHT_COPY = 128;
pub const WMT_RIGHT_COLLABORATIVE_PLAY = 256;
pub const WMT_RIGHT_SDMI_TRIGGER = 65536;
pub const WMT_RIGHT_SDMI_NOMORECOPIES = 131072;
pub const NETSOURCE_URLCREDPOLICY_SETTING_SILENTLOGONOK = 0;
pub const NETSOURCE_URLCREDPOLICY_SETTING_MUSTPROMPTUSER = 1;
pub const NETSOURCE_URLCREDPOLICY_SETTING_ANONYMOUSONLY = 2;

pub const aliases = struct {
    pub const _AM_ASFWRITERCONFIG_PARAM = i32;
    pub const WEBSTREAM_SAMPLE_TYPE = i32;
    pub const WM_SF_TYPE = i32;
    pub const WM_SFEX_TYPE = i32;
    pub const WMT_STATUS = i32;
    pub const WMT_STREAM_SELECTION = i32;
    pub const WMT_IMAGE_TYPE = i32;
    pub const WMT_ATTR_DATATYPE = i32;
    pub const WMT_ATTR_IMAGETYPE = i32;
    pub const WMT_VERSION = i32;
    pub const WMT_STORAGE_FORMAT = i32;
    pub const WMT_DRMLA_TRUST = i32;
    pub const WMT_TRANSPORT_TYPE = i32;
    pub const WMT_NET_PROTOCOL = i32;
    pub const WMT_PLAY_MODE = i32;
    pub const WMT_PROXY_SETTINGS = i32;
    pub const WMT_CODEC_INFO_TYPE = i32;
    pub const WM_DM_INTERLACED_TYPE = i32;
    pub const WM_DM_IT_FIRST_FRAME_COHERENCY = i32;
    pub const WMT_OFFSET_FORMAT = i32;
    pub const WMT_INDEXER_TYPE = i32;
    pub const WMT_INDEX_TYPE = i32;
    pub const WMT_FILESINK_MODE = i32;
    pub const WMT_MUSICSPEECH_CLASS_MODE = i32;
    pub const WMT_WATERMARK_ENTRY_TYPE = i32;
    pub const WM_PLAYBACK_DRC_LEVEL = i32;
    pub const WMT_TIMECODE_FRAMERATE = i32;
    pub const WMT_CREDENTIAL_FLAGS = i32;
    pub const WM_AETYPE = i32;
    pub const WMT_RIGHTS = i32;
    pub const NETSOURCE_URLCREDPOLICY_SETTINGS = i32;
};
