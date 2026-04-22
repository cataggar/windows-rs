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
    .{ "DirectSoundCreate", MethodRecord{ .library = "DSOUND", .import = "DirectSoundCreate", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x12\xaf\xd1\x12\x82\xb1" } },
    .{ "DirectSoundEnumerateA", MethodRecord{ .library = "DSOUND", .import = "DirectSoundEnumerateA", .signature = "\x00\x02\x11\x79\x12\xaf\xd5\x0f\x01" } },
    .{ "DirectSoundEnumerateW", MethodRecord{ .library = "DSOUND", .import = "DirectSoundEnumerateW", .signature = "\x00\x02\x11\x79\x12\xaf\xd9\x0f\x01" } },
    .{ "DirectSoundCaptureCreate", MethodRecord{ .library = "DSOUND", .import = "DirectSoundCaptureCreate", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x12\xaf\xdd\x12\x82\xb1" } },
    .{ "DirectSoundCaptureEnumerateA", MethodRecord{ .library = "DSOUND", .import = "DirectSoundCaptureEnumerateA", .signature = "\x00\x02\x11\x79\x12\xaf\xd5\x0f\x01" } },
    .{ "DirectSoundCaptureEnumerateW", MethodRecord{ .library = "DSOUND", .import = "DirectSoundCaptureEnumerateW", .signature = "\x00\x02\x11\x79\x12\xaf\xd9\x0f\x01" } },
    .{ "DirectSoundCreate8", MethodRecord{ .library = "DSOUND", .import = "DirectSoundCreate8", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x12\xaf\xe1\x12\x82\xb1" } },
    .{ "DirectSoundCaptureCreate8", MethodRecord{ .library = "DSOUND", .import = "DirectSoundCaptureCreate8", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x12\xaf\xdd\x12\x82\xb1" } },
    .{ "DirectSoundFullDuplexCreate", MethodRecord{ .library = "DSOUND", .import = "DirectSoundFullDuplexCreate", .signature = "\x00\x0a\x11\x79\x0f\x11\x0d\x0f\x11\x0d\x0f\x11\xaf\xe5\x0f\x11\xaf\xe9\x11\x25\x09\x0f\x12\xaf\xed\x0f\x12\xaf\xf1\x0f\x12\xaf\xf5\x12\x82\xb1" } },
    .{ "GetDeviceID", MethodRecord{ .library = "DSOUND", .import = "GetDeviceID", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x0d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x2fd1 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio.DirectSound", .name = "IDirectSound" },
        0x2fd5 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio.DirectSound", .name = "LPDSENUMCALLBACKA" },
        0x2fd9 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio.DirectSound", .name = "LPDSENUMCALLBACKW" },
        0x2fdd => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio.DirectSound", .name = "IDirectSoundCapture" },
        0x2fe1 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio.DirectSound", .name = "IDirectSound8" },
        0x2fe5 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio.DirectSound", .name = "DSCBUFFERDESC" },
        0x2fe9 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio.DirectSound", .name = "DSBUFFERDESC" },
        0x2fed => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio.DirectSound", .name = "IDirectSoundFullDuplex" },
        0x2ff1 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio.DirectSound", .name = "IDirectSoundCaptureBuffer8" },
        0x2ff5 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio.DirectSound", .name = "IDirectSoundBuffer8" },
        else => null,
    };
}

pub const DIRECTSOUND_VERSION = 1792;
pub const _FACDS = 2168;
pub const DSFX_LOCHARDWARE = 1;
pub const DSFX_LOCSOFTWARE = 2;
pub const DSCFX_LOCHARDWARE = 1;
pub const DSCFX_LOCSOFTWARE = 2;
pub const DSCFXR_LOCHARDWARE = 16;
pub const DSCFXR_LOCSOFTWARE = 32;
pub const KSPROPERTY_SUPPORT_GET = 1;
pub const KSPROPERTY_SUPPORT_SET = 2;
pub const DSFXGARGLE_WAVE_TRIANGLE = 0;
pub const DSFXGARGLE_WAVE_SQUARE = 1;
pub const DSFXGARGLE_RATEHZ_MIN = 1;
pub const DSFXGARGLE_RATEHZ_MAX = 1000;
pub const DSFXCHORUS_WAVE_TRIANGLE = 0;
pub const DSFXCHORUS_WAVE_SIN = 1;
pub const DSFXCHORUS_PHASE_MIN = 0;
pub const DSFXCHORUS_PHASE_MAX = 4;
pub const DSFXCHORUS_PHASE_NEG_180 = 0;
pub const DSFXCHORUS_PHASE_NEG_90 = 1;
pub const DSFXCHORUS_PHASE_ZERO = 2;
pub const DSFXCHORUS_PHASE_90 = 3;
pub const DSFXCHORUS_PHASE_180 = 4;
pub const DSFXFLANGER_WAVE_TRIANGLE = 0;
pub const DSFXFLANGER_WAVE_SIN = 1;
pub const DSFXFLANGER_PHASE_MIN = 0;
pub const DSFXFLANGER_PHASE_MAX = 4;
pub const DSFXFLANGER_PHASE_NEG_180 = 0;
pub const DSFXFLANGER_PHASE_NEG_90 = 1;
pub const DSFXFLANGER_PHASE_ZERO = 2;
pub const DSFXFLANGER_PHASE_90 = 3;
pub const DSFXFLANGER_PHASE_180 = 4;
pub const DSFXECHO_PANDELAY_MIN = 0;
pub const DSFXECHO_PANDELAY_MAX = 1;
pub const DSFX_I3DL2REVERB_ROOM_MIN = -10000;
pub const DSFX_I3DL2REVERB_ROOM_MAX = 0;
pub const DSFX_I3DL2REVERB_ROOM_DEFAULT = -1000;
pub const DSFX_I3DL2REVERB_ROOMHF_MIN = -10000;
pub const DSFX_I3DL2REVERB_ROOMHF_MAX = 0;
pub const DSFX_I3DL2REVERB_ROOMHF_DEFAULT = -100;
pub const DSFX_I3DL2REVERB_REFLECTIONS_MIN = -10000;
pub const DSFX_I3DL2REVERB_REFLECTIONS_MAX = 1000;
pub const DSFX_I3DL2REVERB_REFLECTIONS_DEFAULT = -2602;
pub const DSFX_I3DL2REVERB_REVERB_MIN = -10000;
pub const DSFX_I3DL2REVERB_REVERB_MAX = 2000;
pub const DSFX_I3DL2REVERB_REVERB_DEFAULT = 200;
pub const DSFX_I3DL2REVERB_QUALITY_MIN = 0;
pub const DSFX_I3DL2REVERB_QUALITY_MAX = 3;
pub const DSFX_I3DL2REVERB_QUALITY_DEFAULT = 2;
pub const DSCFX_AEC_MODE_PASS_THROUGH = 0;
pub const DSCFX_AEC_MODE_HALF_DUPLEX = 1;
pub const DSCFX_AEC_MODE_FULL_DUPLEX = 2;
pub const DSCFX_AEC_STATUS_HISTORY_UNINITIALIZED = 0;
pub const DSCFX_AEC_STATUS_HISTORY_CONTINUOUSLY_CONVERGED = 1;
pub const DSCFX_AEC_STATUS_HISTORY_PREVIOUSLY_DIVERGED = 2;
pub const DSCFX_AEC_STATUS_CURRENTLY_CONVERGED = 8;
pub const DS_NO_VIRTUALIZATION = 142082058;
pub const DSCAPS_PRIMARYMONO = 1;
pub const DSCAPS_PRIMARYSTEREO = 2;
pub const DSCAPS_PRIMARY8BIT = 4;
pub const DSCAPS_PRIMARY16BIT = 8;
pub const DSCAPS_CONTINUOUSRATE = 16;
pub const DSCAPS_EMULDRIVER = 32;
pub const DSCAPS_CERTIFIED = 64;
pub const DSCAPS_SECONDARYMONO = 256;
pub const DSCAPS_SECONDARYSTEREO = 512;
pub const DSCAPS_SECONDARY8BIT = 1024;
pub const DSCAPS_SECONDARY16BIT = 2048;
pub const DSSCL_NORMAL = 1;
pub const DSSCL_PRIORITY = 2;
pub const DSSCL_EXCLUSIVE = 3;
pub const DSSCL_WRITEPRIMARY = 4;
pub const DSSPEAKER_DIRECTOUT = 0;
pub const DSSPEAKER_HEADPHONE = 1;
pub const DSSPEAKER_MONO = 2;
pub const DSSPEAKER_QUAD = 3;
pub const DSSPEAKER_STEREO = 4;
pub const DSSPEAKER_SURROUND = 5;
pub const DSSPEAKER_5POINT1 = 6;
pub const DSSPEAKER_7POINT1 = 7;
pub const DSSPEAKER_7POINT1_SURROUND = 8;
pub const DSSPEAKER_5POINT1_SURROUND = 9;
pub const DSSPEAKER_7POINT1_WIDE = 7;
pub const DSSPEAKER_5POINT1_BACK = 6;
pub const DSSPEAKER_GEOMETRY_MIN = 5;
pub const DSSPEAKER_GEOMETRY_NARROW = 10;
pub const DSSPEAKER_GEOMETRY_WIDE = 20;
pub const DSSPEAKER_GEOMETRY_MAX = 180;
pub const DSBCAPS_PRIMARYBUFFER = 1;
pub const DSBCAPS_STATIC = 2;
pub const DSBCAPS_LOCHARDWARE = 4;
pub const DSBCAPS_LOCSOFTWARE = 8;
pub const DSBCAPS_CTRL3D = 16;
pub const DSBCAPS_CTRLFREQUENCY = 32;
pub const DSBCAPS_CTRLPAN = 64;
pub const DSBCAPS_CTRLVOLUME = 128;
pub const DSBCAPS_CTRLPOSITIONNOTIFY = 256;
pub const DSBCAPS_CTRLFX = 512;
pub const DSBCAPS_STICKYFOCUS = 16384;
pub const DSBCAPS_GLOBALFOCUS = 32768;
pub const DSBCAPS_GETCURRENTPOSITION2 = 65536;
pub const DSBCAPS_MUTE3DATMAXDISTANCE = 131072;
pub const DSBCAPS_LOCDEFER = 262144;
pub const DSBCAPS_TRUEPLAYPOSITION = 524288;
pub const DSBPLAY_LOOPING = 1;
pub const DSBPLAY_LOCHARDWARE = 2;
pub const DSBPLAY_LOCSOFTWARE = 4;
pub const DSBPLAY_TERMINATEBY_TIME = 8;
pub const DSBPLAY_TERMINATEBY_DISTANCE = 16;
pub const DSBPLAY_TERMINATEBY_PRIORITY = 32;
pub const DSBSTATUS_PLAYING = 1;
pub const DSBSTATUS_BUFFERLOST = 2;
pub const DSBSTATUS_LOOPING = 4;
pub const DSBSTATUS_LOCHARDWARE = 8;
pub const DSBSTATUS_LOCSOFTWARE = 16;
pub const DSBSTATUS_TERMINATED = 32;
pub const DSBLOCK_FROMWRITECURSOR = 1;
pub const DSBLOCK_ENTIREBUFFER = 2;
pub const DSBFREQUENCY_ORIGINAL = 0;
pub const DSBFREQUENCY_MIN = 100;
pub const DSBFREQUENCY_MAX = 200000;
pub const DSBPAN_LEFT = -10000;
pub const DSBPAN_CENTER = 0;
pub const DSBPAN_RIGHT = 10000;
pub const DSBVOLUME_MIN = -10000;
pub const DSBVOLUME_MAX = 0;
pub const DSBSIZE_MIN = 4;
pub const DSBSIZE_MAX = 268435455;
pub const DSBSIZE_FX_MIN = 150;
pub const DSBNOTIFICATIONS_MAX = 100000;
pub const DS3DMODE_NORMAL = 0;
pub const DS3DMODE_HEADRELATIVE = 1;
pub const DS3DMODE_DISABLE = 2;
pub const DS3D_IMMEDIATE = 0;
pub const DS3D_DEFERRED = 1;
pub const DS3D_MINCONEANGLE = 0;
pub const DS3D_MAXCONEANGLE = 360;
pub const DS3D_DEFAULTCONEANGLE = 360;
pub const DS3D_DEFAULTCONEOUTSIDEVOLUME = 0;
pub const DSCCAPS_EMULDRIVER = 32;
pub const DSCCAPS_CERTIFIED = 64;
pub const DSCCAPS_MULTIPLECAPTURE = 1;
pub const DSCBCAPS_WAVEMAPPED = 2147483648;
pub const DSCBCAPS_CTRLFX = 512;
pub const DSCBLOCK_ENTIREBUFFER = 1;
pub const DSCBSTATUS_CAPTURING = 1;
pub const DSCBSTATUS_LOOPING = 2;
pub const DSCBSTART_LOOPING = 1;
pub const DSBPN_OFFSETSTOP = 4294967295;
pub const DS_CERTIFIED = 0;
pub const DS_UNCERTIFIED = 1;
pub const DSFXR_PRESENT = 0;
pub const DSFXR_LOCHARDWARE = 1;
pub const DSFXR_LOCSOFTWARE = 2;
pub const DSFXR_UNALLOCATED = 3;
pub const DSFXR_FAILED = 4;
pub const DSFXR_UNKNOWN = 5;
pub const DSFXR_SENDLOOP = 6;
pub const DSFX_I3DL2_MATERIAL_PRESET_SINGLEWINDOW = 0;
pub const DSFX_I3DL2_MATERIAL_PRESET_DOUBLEWINDOW = 1;
pub const DSFX_I3DL2_MATERIAL_PRESET_THINDOOR = 2;
pub const DSFX_I3DL2_MATERIAL_PRESET_THICKDOOR = 3;
pub const DSFX_I3DL2_MATERIAL_PRESET_WOODWALL = 4;
pub const DSFX_I3DL2_MATERIAL_PRESET_BRICKWALL = 5;
pub const DSFX_I3DL2_MATERIAL_PRESET_STONEWALL = 6;
pub const DSFX_I3DL2_MATERIAL_PRESET_CURTAIN = 7;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_DEFAULT = 0;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_GENERIC = 1;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_PADDEDCELL = 2;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_ROOM = 3;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_BATHROOM = 4;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_LIVINGROOM = 5;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_STONEROOM = 6;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_AUDITORIUM = 7;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_CONCERTHALL = 8;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_CAVE = 9;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_ARENA = 10;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_HANGAR = 11;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_CARPETEDHALLWAY = 12;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_HALLWAY = 13;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_STONECORRIDOR = 14;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_ALLEY = 15;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_FOREST = 16;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_CITY = 17;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_MOUNTAINS = 18;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_QUARRY = 19;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_PLAIN = 20;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_PARKINGLOT = 21;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_SEWERPIPE = 22;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_UNDERWATER = 23;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_SMALLROOM = 24;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_MEDIUMROOM = 25;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_LARGEROOM = 26;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_MEDIUMHALL = 27;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_LARGEHALL = 28;
pub const DSFX_I3DL2_ENVIRONMENT_PRESET_PLATE = 29;
