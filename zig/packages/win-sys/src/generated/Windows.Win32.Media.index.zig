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
    .{ "timeGetSystemTime", MethodRecord{ .library = "WINMM", .import = "timeGetSystemTime", .signature = "\x00\x02\x09\x0f\x11\x81\xa1\x09" } },
    .{ "timeGetTime", MethodRecord{ .library = "WINMM", .import = "timeGetTime", .signature = "\x00\x00\x09" } },
    .{ "timeGetDevCaps", MethodRecord{ .library = "WINMM", .import = "timeGetDevCaps", .signature = "\x00\x02\x09\x0f\x11\xb0\x05\x09" } },
    .{ "timeBeginPeriod", MethodRecord{ .library = "WINMM", .import = "timeBeginPeriod", .signature = "\x00\x01\x09\x09" } },
    .{ "timeEndPeriod", MethodRecord{ .library = "WINMM", .import = "timeEndPeriod", .signature = "\x00\x01\x09\x09" } },
    .{ "timeSetEvent", MethodRecord{ .library = "WINMM", .import = "timeSetEvent", .signature = "\x00\x05\x09\x09\x09\x12\xb0\x09\x19\x09" } },
    .{ "timeKillEvent", MethodRecord{ .library = "WINMM", .import = "timeKillEvent", .signature = "\x00\x01\x09\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x1a1 => TypeRefEntry{ .namespace = "Windows.Win32.Media", .name = "MMTIME" },
        0x3005 => TypeRefEntry{ .namespace = "Windows.Win32.Media", .name = "TIMECAPS" },
        0x3009 => TypeRefEntry{ .namespace = "Windows.Win32.Media", .name = "LPTIMECALLBACK" },
        else => null,
    };
}

pub const ED_DEVCAP_TIMECODE_READ = 4121;
pub const ED_DEVCAP_ATN_READ = 5047;
pub const ED_DEVCAP_RTC_READ = 5050;
pub const TIMERR_NOERROR = 0;
pub const TIMERR_NOCANDO = 97;
pub const TIMERR_STRUCT = 129;
pub const MAXPNAMELEN = 32;
pub const MAXERRORLENGTH = 256;
pub const MM_MICROSOFT = 1;
pub const MM_MIDI_MAPPER = 1;
pub const MM_WAVE_MAPPER = 2;
pub const MM_SNDBLST_MIDIOUT = 3;
pub const MM_SNDBLST_MIDIIN = 4;
pub const MM_SNDBLST_SYNTH = 5;
pub const MM_SNDBLST_WAVEOUT = 6;
pub const MM_SNDBLST_WAVEIN = 7;
pub const MM_ADLIB = 9;
pub const MM_MPU401_MIDIOUT = 10;
pub const MM_MPU401_MIDIIN = 11;
pub const MM_PC_JOYSTICK = 12;
pub const TIME_MS = 1;
pub const TIME_SAMPLES = 2;
pub const TIME_BYTES = 4;
pub const TIME_SMPTE = 8;
pub const TIME_MIDI = 16;
pub const TIME_TICKS = 32;
pub const MM_JOY1MOVE = 928;
pub const MM_JOY2MOVE = 929;
pub const MM_JOY1ZMOVE = 930;
pub const MM_JOY2ZMOVE = 931;
pub const MM_JOY1BUTTONDOWN = 949;
pub const MM_JOY2BUTTONDOWN = 950;
pub const MM_JOY1BUTTONUP = 951;
pub const MM_JOY2BUTTONUP = 952;
pub const MM_MCINOTIFY = 953;
pub const MM_WOM_OPEN = 955;
pub const MM_WOM_CLOSE = 956;
pub const MM_WOM_DONE = 957;
pub const MM_WIM_OPEN = 958;
pub const MM_WIM_CLOSE = 959;
pub const MM_WIM_DATA = 960;
pub const MM_MIM_OPEN = 961;
pub const MM_MIM_CLOSE = 962;
pub const MM_MIM_DATA = 963;
pub const MM_MIM_LONGDATA = 964;
pub const MM_MIM_ERROR = 965;
pub const MM_MIM_LONGERROR = 966;
pub const MM_MOM_OPEN = 967;
pub const MM_MOM_CLOSE = 968;
pub const MM_MOM_DONE = 969;
pub const MM_DRVM_OPEN = 976;
pub const MM_DRVM_CLOSE = 977;
pub const MM_DRVM_DATA = 978;
pub const MM_DRVM_ERROR = 979;
pub const MM_STREAM_OPEN = 980;
pub const MM_STREAM_CLOSE = 981;
pub const MM_STREAM_DONE = 982;
pub const MM_STREAM_ERROR = 983;
pub const MM_MOM_POSITIONCB = 970;
pub const MM_MCISIGNAL = 971;
pub const MM_MIM_MOREDATA = 972;
pub const MM_MIXM_LINE_CHANGE = 976;
pub const MM_MIXM_CONTROL_CHANGE = 977;
pub const MMSYSERR_BASE = 0;
pub const WAVERR_BASE = 32;
pub const MIDIERR_BASE = 64;
pub const TIMERR_BASE = 96;
pub const JOYERR_BASE = 160;
pub const MCIERR_BASE = 256;
pub const MIXERR_BASE = 1024;
pub const MCI_STRING_OFFSET = 512;
pub const MCI_VD_OFFSET = 1024;
pub const MCI_CD_OFFSET = 1088;
pub const MCI_WAVE_OFFSET = 1152;
pub const MCI_SEQ_OFFSET = 1216;
pub const MMSYSERR_NOERROR = 0;
pub const MMSYSERR_ERROR = 1;
pub const MMSYSERR_BADDEVICEID = 2;
pub const MMSYSERR_NOTENABLED = 3;
pub const MMSYSERR_ALLOCATED = 4;
pub const MMSYSERR_INVALHANDLE = 5;
pub const MMSYSERR_NODRIVER = 6;
pub const MMSYSERR_NOMEM = 7;
pub const MMSYSERR_NOTSUPPORTED = 8;
pub const MMSYSERR_BADERRNUM = 9;
pub const MMSYSERR_INVALFLAG = 10;
pub const MMSYSERR_INVALPARAM = 11;
pub const MMSYSERR_HANDLEBUSY = 12;
pub const MMSYSERR_INVALIDALIAS = 13;
pub const MMSYSERR_BADDB = 14;
pub const MMSYSERR_KEYNOTFOUND = 15;
pub const MMSYSERR_READERROR = 16;
pub const MMSYSERR_WRITEERROR = 17;
pub const MMSYSERR_DELETEERROR = 18;
pub const MMSYSERR_VALNOTFOUND = 19;
pub const MMSYSERR_NODRIVERCB = 20;
pub const MMSYSERR_MOREDATA = 21;
pub const MMSYSERR_LASTERROR = 21;
pub const TIME_ONESHOT = 0;
pub const TIME_PERIODIC = 1;
pub const TIME_CALLBACK_FUNCTION = 0;
pub const TIME_CALLBACK_EVENT_SET = 16;
pub const TIME_CALLBACK_EVENT_PULSE = 32;
pub const TIME_KILL_SYNCHRONOUS = 256;

pub const aliases = struct {
    pub const TIMECODE_SAMPLE_FLAGS = u32;
    pub const LPDRVCALLBACK = ?*const anyopaque;
    pub const LPTIMECALLBACK = ?*const anyopaque;
};
