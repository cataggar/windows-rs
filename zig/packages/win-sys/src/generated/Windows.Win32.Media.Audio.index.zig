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
    .{ "CoRegisterMessageFilter", MethodRecord{ .library = "OLE32", .import = "CoRegisterMessageFilter", .signature = "\x00\x02\x11\x79\x12\x81\x7d\x0f\x12\x81\x7d" } },
    .{ "sndPlaySoundA", MethodRecord{ .library = "WINMM", .import = "sndPlaySoundA", .signature = "\x00\x02\x11\x59\x11\x3d\x09" } },
    .{ "sndPlaySoundW", MethodRecord{ .library = "WINMM", .import = "sndPlaySoundW", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "PlaySoundA", MethodRecord{ .library = "WINMM", .import = "PlaySoundA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x81\x81\x11\x81\x85" } },
    .{ "PlaySoundW", MethodRecord{ .library = "WINMM", .import = "PlaySoundW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x81\x81\x11\x81\x85" } },
    .{ "waveOutGetNumDevs", MethodRecord{ .library = "WINMM", .import = "waveOutGetNumDevs", .signature = "\x00\x00\x09" } },
    .{ "waveOutGetDevCapsA", MethodRecord{ .library = "WINMM", .import = "waveOutGetDevCapsA", .signature = "\x00\x03\x09\x19\x0f\x11\x81\x89\x09" } },
    .{ "waveOutGetDevCapsW", MethodRecord{ .library = "WINMM", .import = "waveOutGetDevCapsW", .signature = "\x00\x03\x09\x19\x0f\x11\x81\x8d\x09" } },
    .{ "waveOutGetVolume", MethodRecord{ .library = "WINMM", .import = "waveOutGetVolume", .signature = "\x00\x02\x09\x11\x81\x91\x0f\x09" } },
    .{ "waveOutSetVolume", MethodRecord{ .library = "WINMM", .import = "waveOutSetVolume", .signature = "\x00\x02\x09\x11\x81\x91\x09" } },
    .{ "waveOutGetErrorTextA", MethodRecord{ .library = "WINMM", .import = "waveOutGetErrorTextA", .signature = "\x00\x03\x09\x09\x11\x3d\x09" } },
    .{ "waveOutGetErrorTextW", MethodRecord{ .library = "WINMM", .import = "waveOutGetErrorTextW", .signature = "\x00\x03\x09\x09\x11\x05\x09" } },
    .{ "waveOutOpen", MethodRecord{ .library = "WINMM", .import = "waveOutOpen", .signature = "\x00\x06\x09\x0f\x11\x81\x91\x09\x0f\x11\x81\x95\x19\x19\x11\x81\x99" } },
    .{ "waveOutClose", MethodRecord{ .library = "WINMM", .import = "waveOutClose", .signature = "\x00\x01\x09\x11\x81\x91" } },
    .{ "waveOutPrepareHeader", MethodRecord{ .library = "WINMM", .import = "waveOutPrepareHeader", .signature = "\x00\x03\x09\x11\x81\x91\x0f\x11\x81\x9d\x09" } },
    .{ "waveOutUnprepareHeader", MethodRecord{ .library = "WINMM", .import = "waveOutUnprepareHeader", .signature = "\x00\x03\x09\x11\x81\x91\x0f\x11\x81\x9d\x09" } },
    .{ "waveOutWrite", MethodRecord{ .library = "WINMM", .import = "waveOutWrite", .signature = "\x00\x03\x09\x11\x81\x91\x0f\x11\x81\x9d\x09" } },
    .{ "waveOutPause", MethodRecord{ .library = "WINMM", .import = "waveOutPause", .signature = "\x00\x01\x09\x11\x81\x91" } },
    .{ "waveOutRestart", MethodRecord{ .library = "WINMM", .import = "waveOutRestart", .signature = "\x00\x01\x09\x11\x81\x91" } },
    .{ "waveOutReset", MethodRecord{ .library = "WINMM", .import = "waveOutReset", .signature = "\x00\x01\x09\x11\x81\x91" } },
    .{ "waveOutBreakLoop", MethodRecord{ .library = "WINMM", .import = "waveOutBreakLoop", .signature = "\x00\x01\x09\x11\x81\x91" } },
    .{ "waveOutGetPosition", MethodRecord{ .library = "WINMM", .import = "waveOutGetPosition", .signature = "\x00\x03\x09\x11\x81\x91\x0f\x11\x81\xa1\x09" } },
    .{ "waveOutGetPitch", MethodRecord{ .library = "WINMM", .import = "waveOutGetPitch", .signature = "\x00\x02\x09\x11\x81\x91\x0f\x09" } },
    .{ "waveOutSetPitch", MethodRecord{ .library = "WINMM", .import = "waveOutSetPitch", .signature = "\x00\x02\x09\x11\x81\x91\x09" } },
    .{ "waveOutGetPlaybackRate", MethodRecord{ .library = "WINMM", .import = "waveOutGetPlaybackRate", .signature = "\x00\x02\x09\x11\x81\x91\x0f\x09" } },
    .{ "waveOutSetPlaybackRate", MethodRecord{ .library = "WINMM", .import = "waveOutSetPlaybackRate", .signature = "\x00\x02\x09\x11\x81\x91\x09" } },
    .{ "waveOutGetID", MethodRecord{ .library = "WINMM", .import = "waveOutGetID", .signature = "\x00\x02\x09\x11\x81\x91\x0f\x09" } },
    .{ "waveOutMessage", MethodRecord{ .library = "WINMM", .import = "waveOutMessage", .signature = "\x00\x04\x09\x11\x81\x91\x09\x19\x19" } },
    .{ "waveInGetNumDevs", MethodRecord{ .library = "WINMM", .import = "waveInGetNumDevs", .signature = "\x00\x00\x09" } },
    .{ "waveInGetDevCapsA", MethodRecord{ .library = "WINMM", .import = "waveInGetDevCapsA", .signature = "\x00\x03\x09\x19\x0f\x11\x81\xa5\x09" } },
    .{ "waveInGetDevCapsW", MethodRecord{ .library = "WINMM", .import = "waveInGetDevCapsW", .signature = "\x00\x03\x09\x19\x0f\x11\x81\xa9\x09" } },
    .{ "waveInGetErrorTextA", MethodRecord{ .library = "WINMM", .import = "waveInGetErrorTextA", .signature = "\x00\x03\x09\x09\x11\x3d\x09" } },
    .{ "waveInGetErrorTextW", MethodRecord{ .library = "WINMM", .import = "waveInGetErrorTextW", .signature = "\x00\x03\x09\x09\x11\x05\x09" } },
    .{ "waveInOpen", MethodRecord{ .library = "WINMM", .import = "waveInOpen", .signature = "\x00\x06\x09\x0f\x11\x81\xad\x09\x0f\x11\x81\x95\x19\x19\x11\x81\x99" } },
    .{ "waveInClose", MethodRecord{ .library = "WINMM", .import = "waveInClose", .signature = "\x00\x01\x09\x11\x81\xad" } },
    .{ "waveInPrepareHeader", MethodRecord{ .library = "WINMM", .import = "waveInPrepareHeader", .signature = "\x00\x03\x09\x11\x81\xad\x0f\x11\x81\x9d\x09" } },
    .{ "waveInUnprepareHeader", MethodRecord{ .library = "WINMM", .import = "waveInUnprepareHeader", .signature = "\x00\x03\x09\x11\x81\xad\x0f\x11\x81\x9d\x09" } },
    .{ "waveInAddBuffer", MethodRecord{ .library = "WINMM", .import = "waveInAddBuffer", .signature = "\x00\x03\x09\x11\x81\xad\x0f\x11\x81\x9d\x09" } },
    .{ "waveInStart", MethodRecord{ .library = "WINMM", .import = "waveInStart", .signature = "\x00\x01\x09\x11\x81\xad" } },
    .{ "waveInStop", MethodRecord{ .library = "WINMM", .import = "waveInStop", .signature = "\x00\x01\x09\x11\x81\xad" } },
    .{ "waveInReset", MethodRecord{ .library = "WINMM", .import = "waveInReset", .signature = "\x00\x01\x09\x11\x81\xad" } },
    .{ "waveInGetPosition", MethodRecord{ .library = "WINMM", .import = "waveInGetPosition", .signature = "\x00\x03\x09\x11\x81\xad\x0f\x11\x81\xa1\x09" } },
    .{ "waveInGetID", MethodRecord{ .library = "WINMM", .import = "waveInGetID", .signature = "\x00\x02\x09\x11\x81\xad\x0f\x09" } },
    .{ "waveInMessage", MethodRecord{ .library = "WINMM", .import = "waveInMessage", .signature = "\x00\x04\x09\x11\x81\xad\x09\x19\x19" } },
    .{ "midiOutGetNumDevs", MethodRecord{ .library = "WINMM", .import = "midiOutGetNumDevs", .signature = "\x00\x00\x09" } },
    .{ "midiStreamOpen", MethodRecord{ .library = "WINMM", .import = "midiStreamOpen", .signature = "\x00\x06\x09\x0f\x11\x81\xb1\x0f\x09\x09\x19\x19\x09" } },
    .{ "midiStreamClose", MethodRecord{ .library = "WINMM", .import = "midiStreamClose", .signature = "\x00\x01\x09\x11\x81\xb1" } },
    .{ "midiStreamProperty", MethodRecord{ .library = "WINMM", .import = "midiStreamProperty", .signature = "\x00\x03\x09\x11\x81\xb1\x0f\x05\x09" } },
    .{ "midiStreamPosition", MethodRecord{ .library = "WINMM", .import = "midiStreamPosition", .signature = "\x00\x03\x09\x11\x81\xb1\x0f\x11\x81\xa1\x09" } },
    .{ "midiStreamOut", MethodRecord{ .library = "WINMM", .import = "midiStreamOut", .signature = "\x00\x03\x09\x11\x81\xb1\x0f\x11\x81\xb5\x09" } },
    .{ "midiStreamPause", MethodRecord{ .library = "WINMM", .import = "midiStreamPause", .signature = "\x00\x01\x09\x11\x81\xb1" } },
    .{ "midiStreamRestart", MethodRecord{ .library = "WINMM", .import = "midiStreamRestart", .signature = "\x00\x01\x09\x11\x81\xb1" } },
    .{ "midiStreamStop", MethodRecord{ .library = "WINMM", .import = "midiStreamStop", .signature = "\x00\x01\x09\x11\x81\xb1" } },
    .{ "midiConnect", MethodRecord{ .library = "WINMM", .import = "midiConnect", .signature = "\x00\x03\x09\x11\x81\xb9\x11\x81\xbd\x0f\x01" } },
    .{ "midiDisconnect", MethodRecord{ .library = "WINMM", .import = "midiDisconnect", .signature = "\x00\x03\x09\x11\x81\xb9\x11\x81\xbd\x0f\x01" } },
    .{ "midiOutGetDevCapsA", MethodRecord{ .library = "WINMM", .import = "midiOutGetDevCapsA", .signature = "\x00\x03\x09\x19\x0f\x11\x81\xc1\x09" } },
    .{ "midiOutGetDevCapsW", MethodRecord{ .library = "WINMM", .import = "midiOutGetDevCapsW", .signature = "\x00\x03\x09\x19\x0f\x11\x81\xc5\x09" } },
    .{ "midiOutGetVolume", MethodRecord{ .library = "WINMM", .import = "midiOutGetVolume", .signature = "\x00\x02\x09\x11\x81\xbd\x0f\x09" } },
    .{ "midiOutSetVolume", MethodRecord{ .library = "WINMM", .import = "midiOutSetVolume", .signature = "\x00\x02\x09\x11\x81\xbd\x09" } },
    .{ "midiOutGetErrorTextA", MethodRecord{ .library = "WINMM", .import = "midiOutGetErrorTextA", .signature = "\x00\x03\x09\x09\x11\x3d\x09" } },
    .{ "midiOutGetErrorTextW", MethodRecord{ .library = "WINMM", .import = "midiOutGetErrorTextW", .signature = "\x00\x03\x09\x09\x11\x05\x09" } },
    .{ "midiOutOpen", MethodRecord{ .library = "WINMM", .import = "midiOutOpen", .signature = "\x00\x05\x09\x0f\x11\x81\xbd\x09\x19\x19\x11\x81\x99" } },
    .{ "midiOutClose", MethodRecord{ .library = "WINMM", .import = "midiOutClose", .signature = "\x00\x01\x09\x11\x81\xbd" } },
    .{ "midiOutPrepareHeader", MethodRecord{ .library = "WINMM", .import = "midiOutPrepareHeader", .signature = "\x00\x03\x09\x11\x81\xbd\x0f\x11\x81\xb5\x09" } },
    .{ "midiOutUnprepareHeader", MethodRecord{ .library = "WINMM", .import = "midiOutUnprepareHeader", .signature = "\x00\x03\x09\x11\x81\xbd\x0f\x11\x81\xb5\x09" } },
    .{ "midiOutShortMsg", MethodRecord{ .library = "WINMM", .import = "midiOutShortMsg", .signature = "\x00\x02\x09\x11\x81\xbd\x09" } },
    .{ "midiOutLongMsg", MethodRecord{ .library = "WINMM", .import = "midiOutLongMsg", .signature = "\x00\x03\x09\x11\x81\xbd\x0f\x11\x81\xb5\x09" } },
    .{ "midiOutReset", MethodRecord{ .library = "WINMM", .import = "midiOutReset", .signature = "\x00\x01\x09\x11\x81\xbd" } },
    .{ "midiOutCachePatches", MethodRecord{ .library = "WINMM", .import = "midiOutCachePatches", .signature = "\x00\x04\x09\x11\x81\xbd\x09\x0f\x07\x09" } },
    .{ "midiOutCacheDrumPatches", MethodRecord{ .library = "WINMM", .import = "midiOutCacheDrumPatches", .signature = "\x00\x04\x09\x11\x81\xbd\x09\x0f\x07\x09" } },
    .{ "midiOutGetID", MethodRecord{ .library = "WINMM", .import = "midiOutGetID", .signature = "\x00\x02\x09\x11\x81\xbd\x0f\x09" } },
    .{ "midiOutMessage", MethodRecord{ .library = "WINMM", .import = "midiOutMessage", .signature = "\x00\x04\x09\x11\x81\xbd\x09\x19\x19" } },
    .{ "midiInGetNumDevs", MethodRecord{ .library = "WINMM", .import = "midiInGetNumDevs", .signature = "\x00\x00\x09" } },
    .{ "midiInGetDevCapsA", MethodRecord{ .library = "WINMM", .import = "midiInGetDevCapsA", .signature = "\x00\x03\x09\x19\x0f\x11\x81\xc9\x09" } },
    .{ "midiInGetDevCapsW", MethodRecord{ .library = "WINMM", .import = "midiInGetDevCapsW", .signature = "\x00\x03\x09\x19\x0f\x11\x81\xcd\x09" } },
    .{ "midiInGetErrorTextA", MethodRecord{ .library = "WINMM", .import = "midiInGetErrorTextA", .signature = "\x00\x03\x09\x09\x11\x3d\x09" } },
    .{ "midiInGetErrorTextW", MethodRecord{ .library = "WINMM", .import = "midiInGetErrorTextW", .signature = "\x00\x03\x09\x09\x11\x05\x09" } },
    .{ "midiInOpen", MethodRecord{ .library = "WINMM", .import = "midiInOpen", .signature = "\x00\x05\x09\x0f\x11\x81\xd1\x09\x19\x19\x11\x81\x99" } },
    .{ "midiInClose", MethodRecord{ .library = "WINMM", .import = "midiInClose", .signature = "\x00\x01\x09\x11\x81\xd1" } },
    .{ "midiInPrepareHeader", MethodRecord{ .library = "WINMM", .import = "midiInPrepareHeader", .signature = "\x00\x03\x09\x11\x81\xd1\x0f\x11\x81\xb5\x09" } },
    .{ "midiInUnprepareHeader", MethodRecord{ .library = "WINMM", .import = "midiInUnprepareHeader", .signature = "\x00\x03\x09\x11\x81\xd1\x0f\x11\x81\xb5\x09" } },
    .{ "midiInAddBuffer", MethodRecord{ .library = "WINMM", .import = "midiInAddBuffer", .signature = "\x00\x03\x09\x11\x81\xd1\x0f\x11\x81\xb5\x09" } },
    .{ "midiInStart", MethodRecord{ .library = "WINMM", .import = "midiInStart", .signature = "\x00\x01\x09\x11\x81\xd1" } },
    .{ "midiInStop", MethodRecord{ .library = "WINMM", .import = "midiInStop", .signature = "\x00\x01\x09\x11\x81\xd1" } },
    .{ "midiInReset", MethodRecord{ .library = "WINMM", .import = "midiInReset", .signature = "\x00\x01\x09\x11\x81\xd1" } },
    .{ "midiInGetID", MethodRecord{ .library = "WINMM", .import = "midiInGetID", .signature = "\x00\x02\x09\x11\x81\xd1\x0f\x09" } },
    .{ "midiInMessage", MethodRecord{ .library = "WINMM", .import = "midiInMessage", .signature = "\x00\x04\x09\x11\x81\xd1\x09\x19\x19" } },
    .{ "auxGetNumDevs", MethodRecord{ .library = "WINMM", .import = "auxGetNumDevs", .signature = "\x00\x00\x09" } },
    .{ "auxGetDevCapsA", MethodRecord{ .library = "WINMM", .import = "auxGetDevCapsA", .signature = "\x00\x03\x09\x19\x0f\x11\x81\xd5\x09" } },
    .{ "auxGetDevCapsW", MethodRecord{ .library = "WINMM", .import = "auxGetDevCapsW", .signature = "\x00\x03\x09\x19\x0f\x11\x81\xd9\x09" } },
    .{ "auxSetVolume", MethodRecord{ .library = "WINMM", .import = "auxSetVolume", .signature = "\x00\x02\x09\x09\x09" } },
    .{ "auxGetVolume", MethodRecord{ .library = "WINMM", .import = "auxGetVolume", .signature = "\x00\x02\x09\x09\x0f\x09" } },
    .{ "auxOutMessage", MethodRecord{ .library = "WINMM", .import = "auxOutMessage", .signature = "\x00\x04\x09\x09\x09\x19\x19" } },
    .{ "mixerGetNumDevs", MethodRecord{ .library = "WINMM", .import = "mixerGetNumDevs", .signature = "\x00\x00\x09" } },
    .{ "mixerGetDevCapsA", MethodRecord{ .library = "WINMM", .import = "mixerGetDevCapsA", .signature = "\x00\x03\x09\x19\x0f\x11\x81\xdd\x09" } },
    .{ "mixerGetDevCapsW", MethodRecord{ .library = "WINMM", .import = "mixerGetDevCapsW", .signature = "\x00\x03\x09\x19\x0f\x11\x81\xe1\x09" } },
    .{ "mixerOpen", MethodRecord{ .library = "WINMM", .import = "mixerOpen", .signature = "\x00\x05\x09\x0f\x11\x81\xe5\x09\x19\x19\x09" } },
    .{ "mixerClose", MethodRecord{ .library = "WINMM", .import = "mixerClose", .signature = "\x00\x01\x09\x11\x81\xe5" } },
    .{ "mixerMessage", MethodRecord{ .library = "WINMM", .import = "mixerMessage", .signature = "\x00\x04\x09\x11\x81\xe5\x09\x19\x19" } },
    .{ "mixerGetLineInfoA", MethodRecord{ .library = "WINMM", .import = "mixerGetLineInfoA", .signature = "\x00\x03\x09\x11\x81\xe9\x0f\x11\x81\xed\x09" } },
    .{ "mixerGetLineInfoW", MethodRecord{ .library = "WINMM", .import = "mixerGetLineInfoW", .signature = "\x00\x03\x09\x11\x81\xe9\x0f\x11\x81\xf1\x09" } },
    .{ "mixerGetID", MethodRecord{ .library = "WINMM", .import = "mixerGetID", .signature = "\x00\x03\x09\x11\x81\xe9\x0f\x09\x09" } },
    .{ "mixerGetLineControlsA", MethodRecord{ .library = "WINMM", .import = "mixerGetLineControlsA", .signature = "\x00\x03\x09\x11\x81\xe9\x0f\x11\x81\xf5\x09" } },
    .{ "mixerGetLineControlsW", MethodRecord{ .library = "WINMM", .import = "mixerGetLineControlsW", .signature = "\x00\x03\x09\x11\x81\xe9\x0f\x11\x81\xf9\x09" } },
    .{ "mixerGetControlDetailsA", MethodRecord{ .library = "WINMM", .import = "mixerGetControlDetailsA", .signature = "\x00\x03\x09\x11\x81\xe9\x0f\x11\x81\xfd\x09" } },
    .{ "mixerGetControlDetailsW", MethodRecord{ .library = "WINMM", .import = "mixerGetControlDetailsW", .signature = "\x00\x03\x09\x11\x81\xe9\x0f\x11\x81\xfd\x09" } },
    .{ "mixerSetControlDetails", MethodRecord{ .library = "WINMM", .import = "mixerSetControlDetails", .signature = "\x00\x03\x09\x11\x81\xe9\x0f\x11\x81\xfd\x09" } },
    .{ "ActivateAudioInterfaceAsync", MethodRecord{ .library = "MMDevAPI", .import = "ActivateAudioInterfaceAsync", .signature = "\x00\x05\x11\x79\x11\x05\x0f\x11\x0d\x0f\x11\x82\x01\x12\x82\x05\x0f\x12\x82\x09" } },
    .{ "CreateRenderAudioStateMonitor", MethodRecord{ .library = "Windows.Media.MediaControl", .import = "CreateRenderAudioStateMonitor", .signature = "\x00\x01\x11\x79\x0f\x12\x82\x11" } },
    .{ "CreateRenderAudioStateMonitorForCategory", MethodRecord{ .library = "Windows.Media.MediaControl", .import = "CreateRenderAudioStateMonitorForCategory", .signature = "\x00\x02\x11\x79\x11\x82\x15\x0f\x12\x82\x11" } },
    .{ "CreateRenderAudioStateMonitorForCategoryAndDeviceRole", MethodRecord{ .library = "Windows.Media.MediaControl", .import = "CreateRenderAudioStateMonitorForCategoryAndDeviceRole", .signature = "\x00\x03\x11\x79\x11\x82\x15\x11\x82\x19\x0f\x12\x82\x11" } },
    .{ "CreateRenderAudioStateMonitorForCategoryAndDeviceId", MethodRecord{ .library = "Windows.Media.MediaControl", .import = "CreateRenderAudioStateMonitorForCategoryAndDeviceId", .signature = "\x00\x03\x11\x79\x11\x82\x15\x11\x05\x0f\x12\x82\x11" } },
    .{ "CreateCaptureAudioStateMonitor", MethodRecord{ .library = "Windows.Media.MediaControl", .import = "CreateCaptureAudioStateMonitor", .signature = "\x00\x01\x11\x79\x0f\x12\x82\x11" } },
    .{ "CreateCaptureAudioStateMonitorForCategory", MethodRecord{ .library = "Windows.Media.MediaControl", .import = "CreateCaptureAudioStateMonitorForCategory", .signature = "\x00\x02\x11\x79\x11\x82\x15\x0f\x12\x82\x11" } },
    .{ "CreateCaptureAudioStateMonitorForCategoryAndDeviceRole", MethodRecord{ .library = "Windows.Media.MediaControl", .import = "CreateCaptureAudioStateMonitorForCategoryAndDeviceRole", .signature = "\x00\x03\x11\x79\x11\x82\x15\x11\x82\x19\x0f\x12\x82\x11" } },
    .{ "CreateCaptureAudioStateMonitorForCategoryAndDeviceId", MethodRecord{ .library = "Windows.Media.MediaControl", .import = "CreateCaptureAudioStateMonitorForCategoryAndDeviceId", .signature = "\x00\x03\x11\x79\x11\x82\x15\x11\x05\x0f\x12\x82\x11" } },
    .{ "acmGetVersion", MethodRecord{ .library = "MSACM32", .import = "acmGetVersion", .signature = "\x00\x00\x09" } },
    .{ "acmMetrics", MethodRecord{ .library = "MSACM32", .import = "acmMetrics", .signature = "\x00\x03\x09\x11\x82\x1d\x09\x0f\x01" } },
    .{ "acmDriverEnum", MethodRecord{ .library = "MSACM32", .import = "acmDriverEnum", .signature = "\x00\x03\x09\x12\x82\x21\x19\x09" } },
    .{ "acmDriverID", MethodRecord{ .library = "MSACM32", .import = "acmDriverID", .signature = "\x00\x03\x09\x11\x82\x1d\x0f\x11\x82\x25\x09" } },
    .{ "acmDriverAddA", MethodRecord{ .library = "MSACM32", .import = "acmDriverAddA", .signature = "\x00\x05\x09\x0f\x11\x82\x25\x11\x82\x29\x11\x82\x2d\x09\x09" } },
    .{ "acmDriverAddW", MethodRecord{ .library = "MSACM32", .import = "acmDriverAddW", .signature = "\x00\x05\x09\x0f\x11\x82\x25\x11\x82\x29\x11\x82\x2d\x09\x09" } },
    .{ "acmDriverRemove", MethodRecord{ .library = "MSACM32", .import = "acmDriverRemove", .signature = "\x00\x02\x09\x11\x82\x25\x09" } },
    .{ "acmDriverOpen", MethodRecord{ .library = "MSACM32", .import = "acmDriverOpen", .signature = "\x00\x03\x09\x0f\x11\x82\x31\x11\x82\x25\x09" } },
    .{ "acmDriverClose", MethodRecord{ .library = "MSACM32", .import = "acmDriverClose", .signature = "\x00\x02\x09\x11\x82\x31\x09" } },
    .{ "acmDriverMessage", MethodRecord{ .library = "MSACM32", .import = "acmDriverMessage", .signature = "\x00\x04\x11\x82\x35\x11\x82\x31\x09\x11\x82\x2d\x11\x82\x2d" } },
    .{ "acmDriverPriority", MethodRecord{ .library = "MSACM32", .import = "acmDriverPriority", .signature = "\x00\x03\x09\x11\x82\x25\x09\x09" } },
    .{ "acmDriverDetailsA", MethodRecord{ .library = "MSACM32", .import = "acmDriverDetailsA", .signature = "\x00\x03\x09\x11\x82\x25\x0f\x11\x82\x39\x09" } },
    .{ "acmDriverDetailsW", MethodRecord{ .library = "MSACM32", .import = "acmDriverDetailsW", .signature = "\x00\x03\x09\x11\x82\x25\x0f\x11\x82\x3d\x09" } },
    .{ "acmFormatTagDetailsA", MethodRecord{ .library = "MSACM32", .import = "acmFormatTagDetailsA", .signature = "\x00\x03\x09\x11\x82\x31\x0f\x11\x82\x41\x09" } },
    .{ "acmFormatTagDetailsW", MethodRecord{ .library = "MSACM32", .import = "acmFormatTagDetailsW", .signature = "\x00\x03\x09\x11\x82\x31\x0f\x11\x82\x45\x09" } },
    .{ "acmFormatTagEnumA", MethodRecord{ .library = "MSACM32", .import = "acmFormatTagEnumA", .signature = "\x00\x05\x09\x11\x82\x31\x0f\x11\x82\x41\x12\x82\x49\x19\x09" } },
    .{ "acmFormatTagEnumW", MethodRecord{ .library = "MSACM32", .import = "acmFormatTagEnumW", .signature = "\x00\x05\x09\x11\x82\x31\x0f\x11\x82\x45\x12\x82\x4d\x19\x09" } },
    .{ "acmFormatDetailsA", MethodRecord{ .library = "MSACM32", .import = "acmFormatDetailsA", .signature = "\x00\x03\x09\x11\x82\x31\x0f\x11\x82\x51\x09" } },
    .{ "acmFormatDetailsW", MethodRecord{ .library = "MSACM32", .import = "acmFormatDetailsW", .signature = "\x00\x03\x09\x11\x82\x31\x0f\x11\x82\x55\x09" } },
    .{ "acmFormatEnumA", MethodRecord{ .library = "MSACM32", .import = "acmFormatEnumA", .signature = "\x00\x05\x09\x11\x82\x31\x0f\x11\x82\x51\x12\x82\x59\x19\x09" } },
    .{ "acmFormatEnumW", MethodRecord{ .library = "MSACM32", .import = "acmFormatEnumW", .signature = "\x00\x05\x09\x11\x82\x31\x0f\x11\x82\x55\x12\x82\x5d\x19\x09" } },
    .{ "acmFormatSuggest", MethodRecord{ .library = "MSACM32", .import = "acmFormatSuggest", .signature = "\x00\x05\x09\x11\x82\x31\x0f\x11\x81\x95\x0f\x11\x81\x95\x09\x09" } },
    .{ "acmFormatChooseA", MethodRecord{ .library = "MSACM32", .import = "acmFormatChooseA", .signature = "\x00\x01\x09\x0f\x11\x82\x61" } },
    .{ "acmFormatChooseW", MethodRecord{ .library = "MSACM32", .import = "acmFormatChooseW", .signature = "\x00\x01\x09\x0f\x11\x82\x65" } },
    .{ "acmFilterTagDetailsA", MethodRecord{ .library = "MSACM32", .import = "acmFilterTagDetailsA", .signature = "\x00\x03\x09\x11\x82\x31\x0f\x11\x82\x69\x09" } },
    .{ "acmFilterTagDetailsW", MethodRecord{ .library = "MSACM32", .import = "acmFilterTagDetailsW", .signature = "\x00\x03\x09\x11\x82\x31\x0f\x11\x82\x6d\x09" } },
    .{ "acmFilterTagEnumA", MethodRecord{ .library = "MSACM32", .import = "acmFilterTagEnumA", .signature = "\x00\x05\x09\x11\x82\x31\x0f\x11\x82\x69\x12\x82\x71\x19\x09" } },
    .{ "acmFilterTagEnumW", MethodRecord{ .library = "MSACM32", .import = "acmFilterTagEnumW", .signature = "\x00\x05\x09\x11\x82\x31\x0f\x11\x82\x6d\x12\x82\x75\x19\x09" } },
    .{ "acmFilterDetailsA", MethodRecord{ .library = "MSACM32", .import = "acmFilterDetailsA", .signature = "\x00\x03\x09\x11\x82\x31\x0f\x11\x82\x79\x09" } },
    .{ "acmFilterDetailsW", MethodRecord{ .library = "MSACM32", .import = "acmFilterDetailsW", .signature = "\x00\x03\x09\x11\x82\x31\x0f\x11\x82\x7d\x09" } },
    .{ "acmFilterEnumA", MethodRecord{ .library = "MSACM32", .import = "acmFilterEnumA", .signature = "\x00\x05\x09\x11\x82\x31\x0f\x11\x82\x79\x12\x82\x81\x19\x09" } },
    .{ "acmFilterEnumW", MethodRecord{ .library = "MSACM32", .import = "acmFilterEnumW", .signature = "\x00\x05\x09\x11\x82\x31\x0f\x11\x82\x7d\x12\x82\x85\x19\x09" } },
    .{ "acmFilterChooseA", MethodRecord{ .library = "MSACM32", .import = "acmFilterChooseA", .signature = "\x00\x01\x09\x0f\x11\x82\x89" } },
    .{ "acmFilterChooseW", MethodRecord{ .library = "MSACM32", .import = "acmFilterChooseW", .signature = "\x00\x01\x09\x0f\x11\x82\x8d" } },
    .{ "acmStreamOpen", MethodRecord{ .library = "MSACM32", .import = "acmStreamOpen", .signature = "\x00\x08\x09\x0f\x11\x82\x91\x11\x82\x31\x0f\x11\x81\x95\x0f\x11\x81\x95\x0f\x11\x82\x95\x19\x19\x09" } },
    .{ "acmStreamClose", MethodRecord{ .library = "MSACM32", .import = "acmStreamClose", .signature = "\x00\x02\x09\x11\x82\x91\x09" } },
    .{ "acmStreamSize", MethodRecord{ .library = "MSACM32", .import = "acmStreamSize", .signature = "\x00\x04\x09\x11\x82\x91\x09\x0f\x09\x09" } },
    .{ "acmStreamReset", MethodRecord{ .library = "MSACM32", .import = "acmStreamReset", .signature = "\x00\x02\x09\x11\x82\x91\x09" } },
    .{ "acmStreamMessage", MethodRecord{ .library = "MSACM32", .import = "acmStreamMessage", .signature = "\x00\x04\x09\x11\x82\x91\x09\x11\x82\x2d\x11\x82\x2d" } },
    .{ "acmStreamConvert", MethodRecord{ .library = "MSACM32", .import = "acmStreamConvert", .signature = "\x00\x03\x09\x11\x82\x91\x0f\x11\x82\x99\x09" } },
    .{ "acmStreamPrepareHeader", MethodRecord{ .library = "MSACM32", .import = "acmStreamPrepareHeader", .signature = "\x00\x03\x09\x11\x82\x91\x0f\x11\x82\x99\x09" } },
    .{ "acmStreamUnprepareHeader", MethodRecord{ .library = "MSACM32", .import = "acmStreamUnprepareHeader", .signature = "\x00\x03\x09\x11\x82\x91\x0f\x11\x82\x99\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x17d => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "IMessageFilter" },
        0x181 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HMODULE" },
        0x185 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "SND_FLAGS" },
        0x189 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "WAVEOUTCAPSA" },
        0x18d => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "WAVEOUTCAPSW" },
        0x191 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "HWAVEOUT" },
        0x195 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "WAVEFORMATEX" },
        0x199 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "MIDI_WAVE_OPEN_TYPE" },
        0x19d => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "WAVEHDR" },
        0x1a1 => TypeRefEntry{ .namespace = "Windows.Win32.Media", .name = "MMTIME" },
        0x1a5 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "WAVEINCAPSA" },
        0x1a9 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "WAVEINCAPSW" },
        0x1ad => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "HWAVEIN" },
        0x1b1 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "HMIDISTRM" },
        0x1b5 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "MIDIHDR" },
        0x1b9 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "HMIDI" },
        0x1bd => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "HMIDIOUT" },
        0x1c1 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "MIDIOUTCAPSA" },
        0x1c5 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "MIDIOUTCAPSW" },
        0x1c9 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "MIDIINCAPSA" },
        0x1cd => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "MIDIINCAPSW" },
        0x1d1 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "HMIDIIN" },
        0x1d5 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "AUXCAPSA" },
        0x1d9 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "AUXCAPSW" },
        0x1dd => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "MIXERCAPSA" },
        0x1e1 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "MIXERCAPSW" },
        0x1e5 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "HMIXER" },
        0x1e9 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "HMIXEROBJ" },
        0x1ed => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "MIXERLINEA" },
        0x1f1 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "MIXERLINEW" },
        0x1f5 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "MIXERLINECONTROLSA" },
        0x1f9 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "MIXERLINECONTROLSW" },
        0x1fd => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "MIXERCONTROLDETAILS" },
        0x201 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "PROPVARIANT" },
        0x205 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "IActivateAudioInterfaceCompletionHandler" },
        0x209 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "IActivateAudioInterfaceAsyncOperation" },
        0x211 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "IAudioStateMonitor" },
        0x215 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "AUDIO_STREAM_CATEGORY" },
        0x219 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ERole" },
        0x21d => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "HACMOBJ" },
        0x221 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMDRIVERENUMCB" },
        0x225 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "HACMDRIVERID" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x231 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "HACMDRIVER" },
        0x235 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LRESULT" },
        0x239 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMDRIVERDETAILSA" },
        0x23d => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMDRIVERDETAILSW" },
        0x241 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFORMATTAGDETAILSA" },
        0x245 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFORMATTAGDETAILSW" },
        0x249 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFORMATTAGENUMCBA" },
        0x24d => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFORMATTAGENUMCBW" },
        0x251 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFORMATDETAILSA" },
        0x255 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "tACMFORMATDETAILSW" },
        0x259 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFORMATENUMCBA" },
        0x25d => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFORMATENUMCBW" },
        0x261 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFORMATCHOOSEA" },
        0x265 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFORMATCHOOSEW" },
        0x269 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFILTERTAGDETAILSA" },
        0x26d => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFILTERTAGDETAILSW" },
        0x271 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFILTERTAGENUMCBA" },
        0x275 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFILTERTAGENUMCBW" },
        0x279 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFILTERDETAILSA" },
        0x27d => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFILTERDETAILSW" },
        0x281 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFILTERENUMCBA" },
        0x285 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFILTERENUMCBW" },
        0x289 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFILTERCHOOSEA" },
        0x28d => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMFILTERCHOOSEW" },
        0x291 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "HACMSTREAM" },
        0x295 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "WAVEFILTER" },
        0x299 => TypeRefEntry{ .namespace = "Windows.Win32.Media.Audio", .name = "ACMSTREAMHEADER" },
        else => null,
    };
}

pub const MIXERCONTROL_CONTROLTYPE_CUSTOM = 0;
pub const MIXERCONTROL_CONTROLTYPE_BOOLEANMETER = 268500992;
pub const MIXERCONTROL_CONTROLTYPE_SIGNEDMETER = 268566528;
pub const MIXERCONTROL_CONTROLTYPE_PEAKMETER = 268566529;
pub const MIXERCONTROL_CONTROLTYPE_UNSIGNEDMETER = 268632064;
pub const MIXERCONTROL_CONTROLTYPE_BOOLEAN = 536936448;
pub const MIXERCONTROL_CONTROLTYPE_ONOFF = 536936449;
pub const MIXERCONTROL_CONTROLTYPE_MUTE = 536936450;
pub const MIXERCONTROL_CONTROLTYPE_MONO = 536936451;
pub const MIXERCONTROL_CONTROLTYPE_LOUDNESS = 536936452;
pub const MIXERCONTROL_CONTROLTYPE_STEREOENH = 536936453;
pub const MIXERCONTROL_CONTROLTYPE_BASS_BOOST = 536945271;
pub const MIXERCONTROL_CONTROLTYPE_BUTTON = 553713664;
pub const MIXERCONTROL_CONTROLTYPE_DECIBELS = 805568512;
pub const MIXERCONTROL_CONTROLTYPE_SIGNED = 805437440;
pub const MIXERCONTROL_CONTROLTYPE_UNSIGNED = 805502976;
pub const MIXERCONTROL_CONTROLTYPE_PERCENT = 805634048;
pub const MIXERCONTROL_CONTROLTYPE_SLIDER = 1073872896;
pub const MIXERCONTROL_CONTROLTYPE_PAN = 1073872897;
pub const MIXERCONTROL_CONTROLTYPE_QSOUNDPAN = 1073872898;
pub const MIXERCONTROL_CONTROLTYPE_FADER = 1342373888;
pub const MIXERCONTROL_CONTROLTYPE_VOLUME = 1342373889;
pub const MIXERCONTROL_CONTROLTYPE_BASS = 1342373890;
pub const MIXERCONTROL_CONTROLTYPE_TREBLE = 1342373891;
pub const MIXERCONTROL_CONTROLTYPE_EQUALIZER = 1342373892;
pub const MIXERCONTROL_CONTROLTYPE_SINGLESELECT = 1879113728;
pub const MIXERCONTROL_CONTROLTYPE_MUX = 1879113729;
pub const MIXERCONTROL_CONTROLTYPE_MULTIPLESELECT = 1895890944;
pub const MIXERCONTROL_CONTROLTYPE_MIXER = 1895890945;
pub const MIXERCONTROL_CONTROLTYPE_MICROTIME = 1610809344;
pub const MIXERCONTROL_CONTROLTYPE_MILLITIME = 1627586560;
pub const WAVE_MAPPER = 4294967295;
pub const ENDPOINT_FORMAT_RESET_MIX_ONLY = 1;
pub const ENDPOINT_HARDWARE_SUPPORT_VOLUME = 1;
pub const ENDPOINT_HARDWARE_SUPPORT_MUTE = 2;
pub const ENDPOINT_HARDWARE_SUPPORT_METER = 4;
pub const AUDIOCLOCK_CHARACTERISTIC_FIXED_FREQ = 1;
pub const AMBISONICS_PARAM_VERSION_1 = 1;
pub const AUDCLNT_E_NOT_INITIALIZED = -2004287487;
pub const AUDCLNT_E_ALREADY_INITIALIZED = -2004287486;
pub const AUDCLNT_E_WRONG_ENDPOINT_TYPE = -2004287485;
pub const AUDCLNT_E_DEVICE_INVALIDATED = -2004287484;
pub const AUDCLNT_E_NOT_STOPPED = -2004287483;
pub const AUDCLNT_E_BUFFER_TOO_LARGE = -2004287482;
pub const AUDCLNT_E_OUT_OF_ORDER = -2004287481;
pub const AUDCLNT_E_UNSUPPORTED_FORMAT = -2004287480;
pub const AUDCLNT_E_INVALID_SIZE = -2004287479;
pub const AUDCLNT_E_DEVICE_IN_USE = -2004287478;
pub const AUDCLNT_E_BUFFER_OPERATION_PENDING = -2004287477;
pub const AUDCLNT_E_THREAD_NOT_REGISTERED = -2004287476;
pub const AUDCLNT_E_EXCLUSIVE_MODE_NOT_ALLOWED = -2004287474;
pub const AUDCLNT_E_ENDPOINT_CREATE_FAILED = -2004287473;
pub const AUDCLNT_E_SERVICE_NOT_RUNNING = -2004287472;
pub const AUDCLNT_E_EVENTHANDLE_NOT_EXPECTED = -2004287471;
pub const AUDCLNT_E_EXCLUSIVE_MODE_ONLY = -2004287470;
pub const AUDCLNT_E_BUFDURATION_PERIOD_NOT_EQUAL = -2004287469;
pub const AUDCLNT_E_EVENTHANDLE_NOT_SET = -2004287468;
pub const AUDCLNT_E_INCORRECT_BUFFER_SIZE = -2004287467;
pub const AUDCLNT_E_BUFFER_SIZE_ERROR = -2004287466;
pub const AUDCLNT_E_CPUUSAGE_EXCEEDED = -2004287465;
pub const AUDCLNT_E_BUFFER_ERROR = -2004287464;
pub const AUDCLNT_E_BUFFER_SIZE_NOT_ALIGNED = -2004287463;
pub const AUDCLNT_E_INVALID_DEVICE_PERIOD = -2004287456;
pub const AUDCLNT_E_INVALID_STREAM_FLAG = -2004287455;
pub const AUDCLNT_E_ENDPOINT_OFFLOAD_NOT_CAPABLE = -2004287454;
pub const AUDCLNT_E_OUT_OF_OFFLOAD_RESOURCES = -2004287453;
pub const AUDCLNT_E_OFFLOAD_MODE_ONLY = -2004287452;
pub const AUDCLNT_E_NONOFFLOAD_MODE_ONLY = -2004287451;
pub const AUDCLNT_E_RESOURCES_INVALIDATED = -2004287450;
pub const AUDCLNT_E_RAW_MODE_UNSUPPORTED = -2004287449;
pub const AUDCLNT_E_ENGINE_PERIODICITY_LOCKED = -2004287448;
pub const AUDCLNT_E_ENGINE_FORMAT_LOCKED = -2004287447;
pub const AUDCLNT_E_HEADTRACKING_ENABLED = -2004287440;
pub const AUDCLNT_E_HEADTRACKING_UNSUPPORTED = -2004287424;
pub const AUDCLNT_E_EFFECT_NOT_AVAILABLE = -2004287423;
pub const AUDCLNT_E_EFFECT_STATE_READ_ONLY = -2004287422;
pub const AUDCLNT_E_POST_VOLUME_LOOPBACK_UNSUPPORTED = -2004287421;
pub const AUDCLNT_S_BUFFER_EMPTY = 143196161;
pub const AUDCLNT_S_THREAD_ALREADY_REGISTERED = 143196162;
pub const AUDCLNT_S_POSITION_STALLED = 143196163;
pub const AUDCLNT_STREAMFLAGS_CROSSPROCESS = 65536;
pub const AUDCLNT_STREAMFLAGS_LOOPBACK = 131072;
pub const AUDCLNT_STREAMFLAGS_EVENTCALLBACK = 262144;
pub const AUDCLNT_STREAMFLAGS_NOPERSIST = 524288;
pub const AUDCLNT_STREAMFLAGS_RATEADJUST = 1048576;
pub const AUDCLNT_STREAMFLAGS_SRC_DEFAULT_QUALITY = 134217728;
pub const AUDCLNT_STREAMFLAGS_AUTOCONVERTPCM = 2147483648;
pub const AUDCLNT_SESSIONFLAGS_EXPIREWHENUNOWNED = 268435456;
pub const AUDCLNT_SESSIONFLAGS_DISPLAY_HIDE = 536870912;
pub const AUDCLNT_SESSIONFLAGS_DISPLAY_HIDEWHENEXPIRED = 1073741824;
pub const SPTLAUDCLNT_E_DESTROYED = -2004287232;
pub const SPTLAUDCLNT_E_OUT_OF_ORDER = -2004287231;
pub const SPTLAUDCLNT_E_RESOURCES_INVALIDATED = -2004287230;
pub const SPTLAUDCLNT_E_NO_MORE_OBJECTS = -2004287229;
pub const SPTLAUDCLNT_E_PROPERTY_NOT_SUPPORTED = -2004287228;
pub const SPTLAUDCLNT_E_ERRORS_IN_OBJECT_CALLS = -2004287227;
pub const SPTLAUDCLNT_E_METADATA_FORMAT_NOT_SUPPORTED = -2004287226;
pub const SPTLAUDCLNT_E_STREAM_NOT_AVAILABLE = -2004287225;
pub const SPTLAUDCLNT_E_INVALID_LICENSE = -2004287224;
pub const SPTLAUDCLNT_E_STREAM_NOT_STOPPED = -2004287222;
pub const SPTLAUDCLNT_E_STATIC_OBJECT_NOT_AVAILABLE = -2004287221;
pub const SPTLAUDCLNT_E_OBJECT_ALREADY_ACTIVE = -2004287220;
pub const SPTLAUDCLNT_E_INTERNAL = -2004287219;
pub const DEVICE_STATEMASK_ALL = 15;
pub const ENDPOINT_SYSFX_ENABLED = 0;
pub const ENDPOINT_SYSFX_DISABLED = 1;
pub const SPATIAL_AUDIO_STANDARD_COMMANDS_START = 200;
pub const SPATIAL_AUDIO_POSITION = 200;
pub const SPTLAUD_MD_CLNT_E_COMMAND_NOT_FOUND = -2004286976;
pub const SPTLAUD_MD_CLNT_E_OBJECT_NOT_INITIALIZED = -2004286975;
pub const SPTLAUD_MD_CLNT_E_INVALID_ARGS = -2004286974;
pub const SPTLAUD_MD_CLNT_E_METADATA_FORMAT_NOT_FOUND = -2004286973;
pub const SPTLAUD_MD_CLNT_E_VALUE_BUFFER_INCORRECT_SIZE = -2004286972;
pub const SPTLAUD_MD_CLNT_E_MEMORY_BOUNDS = -2004286971;
pub const SPTLAUD_MD_CLNT_E_NO_MORE_COMMANDS = -2004286970;
pub const SPTLAUD_MD_CLNT_E_BUFFER_ALREADY_ATTACHED = -2004286969;
pub const SPTLAUD_MD_CLNT_E_BUFFER_NOT_ATTACHED = -2004286968;
pub const SPTLAUD_MD_CLNT_E_FRAMECOUNT_OUT_OF_RANGE = -2004286967;
pub const SPTLAUD_MD_CLNT_E_NO_ITEMS_FOUND = -2004286960;
pub const SPTLAUD_MD_CLNT_E_ITEM_COPY_OVERFLOW = -2004286959;
pub const SPTLAUD_MD_CLNT_E_NO_ITEMS_OPEN = -2004286958;
pub const SPTLAUD_MD_CLNT_E_ITEMS_ALREADY_OPEN = -2004286957;
pub const SPTLAUD_MD_CLNT_E_ATTACH_FAILED_INTERNAL_BUFFER = -2004286956;
pub const SPTLAUD_MD_CLNT_E_DETACH_FAILED_INTERNAL_BUFFER = -2004286955;
pub const SPTLAUD_MD_CLNT_E_NO_BUFFER_ATTACHED = -2004286954;
pub const SPTLAUD_MD_CLNT_E_NO_MORE_ITEMS = -2004286953;
pub const SPTLAUD_MD_CLNT_E_FRAMEOFFSET_OUT_OF_RANGE = -2004286952;
pub const SPTLAUD_MD_CLNT_E_ITEM_MUST_HAVE_COMMANDS = -2004286951;
pub const SPTLAUD_MD_CLNT_E_NO_ITEMOFFSET_WRITTEN = -2004286944;
pub const SPTLAUD_MD_CLNT_E_NO_ITEMS_WRITTEN = -2004286943;
pub const SPTLAUD_MD_CLNT_E_COMMAND_ALREADY_WRITTEN = -2004286942;
pub const SPTLAUD_MD_CLNT_E_FORMAT_MISMATCH = -2004286941;
pub const SPTLAUD_MD_CLNT_E_BUFFER_STILL_ATTACHED = -2004286940;
pub const SPTLAUD_MD_CLNT_E_ITEMS_LOCKED_FOR_WRITING = -2004286939;
pub const WAVERR_BADFORMAT = 32;
pub const WAVERR_STILLPLAYING = 33;
pub const WAVERR_UNPREPARED = 34;
pub const WAVERR_SYNC = 35;
pub const WAVERR_LASTERROR = 35;
pub const WHDR_DONE = 1;
pub const WHDR_PREPARED = 2;
pub const WHDR_BEGINLOOP = 4;
pub const WHDR_ENDLOOP = 8;
pub const WHDR_INQUEUE = 16;
pub const WAVECAPS_PITCH = 1;
pub const WAVECAPS_PLAYBACKRATE = 2;
pub const WAVECAPS_VOLUME = 4;
pub const WAVECAPS_LRVOLUME = 8;
pub const WAVECAPS_SYNC = 16;
pub const WAVECAPS_SAMPLEACCURATE = 32;
pub const WAVE_INVALIDFORMAT = 0;
pub const WAVE_FORMAT_1M08 = 1;
pub const WAVE_FORMAT_1S08 = 2;
pub const WAVE_FORMAT_1M16 = 4;
pub const WAVE_FORMAT_1S16 = 8;
pub const WAVE_FORMAT_2M08 = 16;
pub const WAVE_FORMAT_2S08 = 32;
pub const WAVE_FORMAT_2M16 = 64;
pub const WAVE_FORMAT_2S16 = 128;
pub const WAVE_FORMAT_4M08 = 256;
pub const WAVE_FORMAT_4S08 = 512;
pub const WAVE_FORMAT_4M16 = 1024;
pub const WAVE_FORMAT_4S16 = 2048;
pub const WAVE_FORMAT_44M08 = 256;
pub const WAVE_FORMAT_44S08 = 512;
pub const WAVE_FORMAT_44M16 = 1024;
pub const WAVE_FORMAT_44S16 = 2048;
pub const WAVE_FORMAT_48M08 = 4096;
pub const WAVE_FORMAT_48S08 = 8192;
pub const WAVE_FORMAT_48M16 = 16384;
pub const WAVE_FORMAT_48S16 = 32768;
pub const WAVE_FORMAT_96M08 = 65536;
pub const WAVE_FORMAT_96S08 = 131072;
pub const WAVE_FORMAT_96M16 = 262144;
pub const WAVE_FORMAT_96S16 = 524288;
pub const WAVE_FORMAT_PCM = 1;
pub const MIDIERR_UNPREPARED = 64;
pub const MIDIERR_STILLPLAYING = 65;
pub const MIDIERR_NOMAP = 66;
pub const MIDIERR_NOTREADY = 67;
pub const MIDIERR_NODEVICE = 68;
pub const MIDIERR_INVALIDSETUP = 69;
pub const MIDIERR_BADOPENMODE = 70;
pub const MIDIERR_DONT_CONTINUE = 71;
pub const MIDIERR_LASTERROR = 71;
pub const MIDIPATCHSIZE = 128;
pub const MIDI_CACHE_ALL = 1;
pub const MIDI_CACHE_BESTFIT = 2;
pub const MIDI_CACHE_QUERY = 3;
pub const MIDI_UNCACHE = 4;
pub const MOD_MIDIPORT = 1;
pub const MOD_SYNTH = 2;
pub const MOD_SQSYNTH = 3;
pub const MOD_FMSYNTH = 4;
pub const MOD_MAPPER = 5;
pub const MOD_WAVETABLE = 6;
pub const MOD_SWSYNTH = 7;
pub const MIDICAPS_VOLUME = 1;
pub const MIDICAPS_LRVOLUME = 2;
pub const MIDICAPS_CACHE = 4;
pub const MIDICAPS_STREAM = 8;
pub const MHDR_DONE = 1;
pub const MHDR_PREPARED = 2;
pub const MHDR_INQUEUE = 4;
pub const MHDR_ISSTRM = 8;
pub const MEVT_F_SHORT = 0;
pub const MEVT_F_LONG = -2147483648;
pub const MEVT_F_CALLBACK = 1073741824;
pub const MEVT_SHORTMSG = 0;
pub const MEVT_TEMPO = 1;
pub const MEVT_NOP = 2;
pub const MEVT_LONGMSG = 128;
pub const MEVT_COMMENT = 130;
pub const MEVT_VERSION = 132;
pub const MIDISTRM_ERROR = -2;
pub const MIDIPROP_SET = -2147483648;
pub const MIDIPROP_GET = 1073741824;
pub const MIDIPROP_TIMEDIV = 1;
pub const MIDIPROP_TEMPO = 2;
pub const AUXCAPS_CDAUDIO = 1;
pub const AUXCAPS_AUXIN = 2;
pub const AUXCAPS_VOLUME = 1;
pub const AUXCAPS_LRVOLUME = 2;
pub const MIXER_SHORT_NAME_CHARS = 16;
pub const MIXER_LONG_NAME_CHARS = 64;
pub const MIXERR_INVALLINE = 1024;
pub const MIXERR_INVALCONTROL = 1025;
pub const MIXERR_INVALVALUE = 1026;
pub const MIXERR_LASTERROR = 1026;
pub const MIXER_OBJECTF_HANDLE = -2147483648;
pub const MIXER_OBJECTF_MIXER = 0;
pub const MIXER_OBJECTF_WAVEOUT = 268435456;
pub const MIXER_OBJECTF_WAVEIN = 536870912;
pub const MIXER_OBJECTF_MIDIOUT = 805306368;
pub const MIXER_OBJECTF_MIDIIN = 1073741824;
pub const MIXER_OBJECTF_AUX = 1342177280;
pub const MIXERLINE_LINEF_ACTIVE = 1;
pub const MIXERLINE_LINEF_DISCONNECTED = 32768;
pub const MIXERLINE_LINEF_SOURCE = -2147483648;
pub const MIXERLINE_COMPONENTTYPE_DST_FIRST = 0;
pub const MIXERLINE_COMPONENTTYPE_DST_LAST = 8;
pub const MIXERLINE_COMPONENTTYPE_SRC_FIRST = 4096;
pub const MIXERLINE_COMPONENTTYPE_SRC_LAST = 4106;
pub const MIXERLINE_TARGETTYPE_UNDEFINED = 0;
pub const MIXERLINE_TARGETTYPE_WAVEOUT = 1;
pub const MIXERLINE_TARGETTYPE_WAVEIN = 2;
pub const MIXERLINE_TARGETTYPE_MIDIOUT = 3;
pub const MIXERLINE_TARGETTYPE_MIDIIN = 4;
pub const MIXERLINE_TARGETTYPE_AUX = 5;
pub const MIXER_GETLINEINFOF_DESTINATION = 0;
pub const MIXER_GETLINEINFOF_SOURCE = 1;
pub const MIXER_GETLINEINFOF_LINEID = 2;
pub const MIXER_GETLINEINFOF_COMPONENTTYPE = 3;
pub const MIXER_GETLINEINFOF_TARGETTYPE = 4;
pub const MIXER_GETLINEINFOF_QUERYMASK = 15;
pub const MIXERCONTROL_CONTROLF_UNIFORM = 1;
pub const MIXERCONTROL_CONTROLF_MULTIPLE = 2;
pub const MIXERCONTROL_CONTROLF_DISABLED = -2147483648;
pub const MIXERCONTROL_CT_CLASS_MASK = -268435456;
pub const MIXERCONTROL_CT_CLASS_CUSTOM = 0;
pub const MIXERCONTROL_CT_CLASS_METER = 268435456;
pub const MIXERCONTROL_CT_CLASS_SWITCH = 536870912;
pub const MIXERCONTROL_CT_CLASS_NUMBER = 805306368;
pub const MIXERCONTROL_CT_CLASS_SLIDER = 1073741824;
pub const MIXERCONTROL_CT_CLASS_FADER = 1342177280;
pub const MIXERCONTROL_CT_CLASS_TIME = 1610612736;
pub const MIXERCONTROL_CT_CLASS_LIST = 1879048192;
pub const MIXERCONTROL_CT_SUBCLASS_MASK = 251658240;
pub const MIXERCONTROL_CT_SC_SWITCH_BOOLEAN = 0;
pub const MIXERCONTROL_CT_SC_SWITCH_BUTTON = 16777216;
pub const MIXERCONTROL_CT_SC_METER_POLLED = 0;
pub const MIXERCONTROL_CT_SC_TIME_MICROSECS = 0;
pub const MIXERCONTROL_CT_SC_TIME_MILLISECS = 16777216;
pub const MIXERCONTROL_CT_SC_LIST_SINGLE = 0;
pub const MIXERCONTROL_CT_SC_LIST_MULTIPLE = 16777216;
pub const MIXERCONTROL_CT_UNITS_MASK = 16711680;
pub const MIXERCONTROL_CT_UNITS_CUSTOM = 0;
pub const MIXERCONTROL_CT_UNITS_BOOLEAN = 65536;
pub const MIXERCONTROL_CT_UNITS_SIGNED = 131072;
pub const MIXERCONTROL_CT_UNITS_UNSIGNED = 196608;
pub const MIXERCONTROL_CT_UNITS_DECIBELS = 262144;
pub const MIXERCONTROL_CT_UNITS_PERCENT = 327680;
pub const MIXER_GETLINECONTROLSF_ALL = 0;
pub const MIXER_GETLINECONTROLSF_ONEBYID = 1;
pub const MIXER_GETLINECONTROLSF_ONEBYTYPE = 2;
pub const MIXER_GETLINECONTROLSF_QUERYMASK = 15;
pub const MIXER_GETCONTROLDETAILSF_VALUE = 0;
pub const MIXER_GETCONTROLDETAILSF_LISTTEXT = 1;
pub const MIXER_GETCONTROLDETAILSF_QUERYMASK = 15;
pub const MIXER_SETCONTROLDETAILSF_VALUE = 0;
pub const MIXER_SETCONTROLDETAILSF_CUSTOM = 1;
pub const MIXER_SETCONTROLDETAILSF_QUERYMASK = 15;
pub const DRV_MAPPER_PREFERRED_INPUT_GET = 16384;
pub const DRV_MAPPER_PREFERRED_OUTPUT_GET = 16386;
pub const DRVM_MAPPER = 8192;
pub const DRVM_MAPPER_STATUS = 8192;
pub const WIDM_MAPPER_STATUS = 8192;
pub const WAVEIN_MAPPER_STATUS_DEVICE = 0;
pub const WAVEIN_MAPPER_STATUS_MAPPED = 1;
pub const WAVEIN_MAPPER_STATUS_FORMAT = 2;
pub const WODM_MAPPER_STATUS = 8192;
pub const WAVEOUT_MAPPER_STATUS_DEVICE = 0;
pub const WAVEOUT_MAPPER_STATUS_MAPPED = 1;
pub const WAVEOUT_MAPPER_STATUS_FORMAT = 2;
pub const ACMERR_BASE = 512;
pub const ACMERR_NOTPOSSIBLE = 512;
pub const ACMERR_BUSY = 513;
pub const ACMERR_UNPREPARED = 514;
pub const ACMERR_CANCELED = 515;
pub const ACM_METRIC_COUNT_DRIVERS = 1;
pub const ACM_METRIC_COUNT_CODECS = 2;
pub const ACM_METRIC_COUNT_CONVERTERS = 3;
pub const ACM_METRIC_COUNT_FILTERS = 4;
pub const ACM_METRIC_COUNT_DISABLED = 5;
pub const ACM_METRIC_COUNT_HARDWARE = 6;
pub const ACM_METRIC_COUNT_LOCAL_DRIVERS = 20;
pub const ACM_METRIC_COUNT_LOCAL_CODECS = 21;
pub const ACM_METRIC_COUNT_LOCAL_CONVERTERS = 22;
pub const ACM_METRIC_COUNT_LOCAL_FILTERS = 23;
pub const ACM_METRIC_COUNT_LOCAL_DISABLED = 24;
pub const ACM_METRIC_HARDWARE_WAVE_INPUT = 30;
pub const ACM_METRIC_HARDWARE_WAVE_OUTPUT = 31;
pub const ACM_METRIC_MAX_SIZE_FORMAT = 50;
pub const ACM_METRIC_MAX_SIZE_FILTER = 51;
pub const ACM_METRIC_DRIVER_SUPPORT = 100;
pub const ACM_METRIC_DRIVER_PRIORITY = 101;
pub const ACM_DRIVERENUMF_NOLOCAL = 1073741824;
pub const ACM_DRIVERENUMF_DISABLED = -2147483648;
pub const ACM_DRIVERADDF_NAME = 1;
pub const ACM_DRIVERADDF_FUNCTION = 3;
pub const ACM_DRIVERADDF_NOTIFYHWND = 4;
pub const ACM_DRIVERADDF_TYPEMASK = 7;
pub const ACM_DRIVERADDF_LOCAL = 0;
pub const ACM_DRIVERADDF_GLOBAL = 8;
pub const ACMDM_USER = 16384;
pub const ACMDM_RESERVED_LOW = 24576;
pub const ACMDM_RESERVED_HIGH = 28671;
pub const ACMDM_DRIVER_ABOUT = 24587;
pub const ACM_DRIVERPRIORITYF_ENABLE = 1;
pub const ACM_DRIVERPRIORITYF_DISABLE = 2;
pub const ACM_DRIVERPRIORITYF_ABLEMASK = 3;
pub const ACM_DRIVERPRIORITYF_BEGIN = 65536;
pub const ACM_DRIVERPRIORITYF_END = 131072;
pub const ACM_DRIVERPRIORITYF_DEFERMASK = 196608;
pub const ACMDRIVERDETAILS_SHORTNAME_CHARS = 32;
pub const ACMDRIVERDETAILS_LONGNAME_CHARS = 128;
pub const ACMDRIVERDETAILS_COPYRIGHT_CHARS = 80;
pub const ACMDRIVERDETAILS_LICENSING_CHARS = 128;
pub const ACMDRIVERDETAILS_FEATURES_CHARS = 512;
pub const ACMDRIVERDETAILS_SUPPORTF_CODEC = 1;
pub const ACMDRIVERDETAILS_SUPPORTF_CONVERTER = 2;
pub const ACMDRIVERDETAILS_SUPPORTF_FILTER = 4;
pub const ACMDRIVERDETAILS_SUPPORTF_HARDWARE = 8;
pub const ACMDRIVERDETAILS_SUPPORTF_ASYNC = 16;
pub const ACMDRIVERDETAILS_SUPPORTF_LOCAL = 1073741824;
pub const ACMDRIVERDETAILS_SUPPORTF_DISABLED = -2147483648;
pub const ACMFORMATTAGDETAILS_FORMATTAG_CHARS = 48;
pub const ACM_FORMATTAGDETAILSF_INDEX = 0;
pub const ACM_FORMATTAGDETAILSF_FORMATTAG = 1;
pub const ACM_FORMATTAGDETAILSF_LARGESTSIZE = 2;
pub const ACM_FORMATTAGDETAILSF_QUERYMASK = 15;
pub const ACMFORMATDETAILS_FORMAT_CHARS = 128;
pub const ACM_FORMATDETAILSF_INDEX = 0;
pub const ACM_FORMATDETAILSF_FORMAT = 1;
pub const ACM_FORMATDETAILSF_QUERYMASK = 15;
pub const ACM_FORMATENUMF_WFORMATTAG = 65536;
pub const ACM_FORMATENUMF_NCHANNELS = 131072;
pub const ACM_FORMATENUMF_NSAMPLESPERSEC = 262144;
pub const ACM_FORMATENUMF_WBITSPERSAMPLE = 524288;
pub const ACM_FORMATENUMF_CONVERT = 1048576;
pub const ACM_FORMATENUMF_SUGGEST = 2097152;
pub const ACM_FORMATENUMF_HARDWARE = 4194304;
pub const ACM_FORMATENUMF_INPUT = 8388608;
pub const ACM_FORMATENUMF_OUTPUT = 16777216;
pub const ACM_FORMATSUGGESTF_WFORMATTAG = 65536;
pub const ACM_FORMATSUGGESTF_NCHANNELS = 131072;
pub const ACM_FORMATSUGGESTF_NSAMPLESPERSEC = 262144;
pub const ACM_FORMATSUGGESTF_WBITSPERSAMPLE = 524288;
pub const ACM_FORMATSUGGESTF_TYPEMASK = 16711680;
pub const MM_ACM_FORMATCHOOSE = 32768;
pub const FORMATCHOOSE_MESSAGE = 0;
pub const FORMATCHOOSE_FORMATTAG_VERIFY = 0;
pub const FORMATCHOOSE_FORMAT_VERIFY = 1;
pub const FORMATCHOOSE_CUSTOM_VERIFY = 2;
pub const ACMFORMATCHOOSE_STYLEF_SHOWHELP = 4;
pub const ACMFORMATCHOOSE_STYLEF_ENABLEHOOK = 8;
pub const ACMFORMATCHOOSE_STYLEF_ENABLETEMPLATE = 16;
pub const ACMFORMATCHOOSE_STYLEF_ENABLETEMPLATEHANDLE = 32;
pub const ACMFORMATCHOOSE_STYLEF_INITTOWFXSTRUCT = 64;
pub const ACMFORMATCHOOSE_STYLEF_CONTEXTHELP = 128;
pub const ACMFILTERTAGDETAILS_FILTERTAG_CHARS = 48;
pub const ACM_FILTERTAGDETAILSF_INDEX = 0;
pub const ACM_FILTERTAGDETAILSF_FILTERTAG = 1;
pub const ACM_FILTERTAGDETAILSF_LARGESTSIZE = 2;
pub const ACM_FILTERTAGDETAILSF_QUERYMASK = 15;
pub const ACMFILTERDETAILS_FILTER_CHARS = 128;
pub const ACM_FILTERDETAILSF_INDEX = 0;
pub const ACM_FILTERDETAILSF_FILTER = 1;
pub const ACM_FILTERDETAILSF_QUERYMASK = 15;
pub const ACM_FILTERENUMF_DWFILTERTAG = 65536;
pub const MM_ACM_FILTERCHOOSE = 32768;
pub const FILTERCHOOSE_MESSAGE = 0;
pub const FILTERCHOOSE_FILTERTAG_VERIFY = 0;
pub const FILTERCHOOSE_FILTER_VERIFY = 1;
pub const FILTERCHOOSE_CUSTOM_VERIFY = 2;
pub const ACMFILTERCHOOSE_STYLEF_SHOWHELP = 4;
pub const ACMFILTERCHOOSE_STYLEF_ENABLEHOOK = 8;
pub const ACMFILTERCHOOSE_STYLEF_ENABLETEMPLATE = 16;
pub const ACMFILTERCHOOSE_STYLEF_ENABLETEMPLATEHANDLE = 32;
pub const ACMFILTERCHOOSE_STYLEF_INITTOFILTERSTRUCT = 64;
pub const ACMFILTERCHOOSE_STYLEF_CONTEXTHELP = 128;
pub const ACMSTREAMHEADER_STATUSF_DONE = 65536;
pub const ACMSTREAMHEADER_STATUSF_PREPARED = 131072;
pub const ACMSTREAMHEADER_STATUSF_INQUEUE = 1048576;
pub const ACM_STREAMOPENF_QUERY = 1;
pub const ACM_STREAMOPENF_ASYNC = 2;
pub const ACM_STREAMOPENF_NONREALTIME = 4;
pub const ACM_STREAMSIZEF_SOURCE = 0;
pub const ACM_STREAMSIZEF_DESTINATION = 1;
pub const ACM_STREAMSIZEF_QUERYMASK = 15;
pub const ACM_STREAMCONVERTF_BLOCKALIGN = 4;
pub const ACM_STREAMCONVERTF_START = 16;
pub const ACM_STREAMCONVERTF_END = 32;
pub const SND_RING = 1048576;
pub const SND_ALIAS_START = 0;
pub const ACMDM_DRIVER_NOTIFY = 24577;
pub const ACMDM_DRIVER_DETAILS = 24586;
pub const ACMDM_HARDWARE_WAVE_CAPS_INPUT = 24596;
pub const ACMDM_HARDWARE_WAVE_CAPS_OUTPUT = 24597;
pub const ACMDM_FORMATTAG_DETAILS = 24601;
pub const ACMDM_FORMAT_DETAILS = 24602;
pub const ACMDM_FORMAT_SUGGEST = 24603;
pub const ACMDM_FILTERTAG_DETAILS = 24626;
pub const ACMDM_FILTER_DETAILS = 24627;
pub const ACMDM_STREAM_OPEN = 24652;
pub const ACMDM_STREAM_CLOSE = 24653;
pub const ACMDM_STREAM_SIZE = 24654;
pub const ACMDM_STREAM_CONVERT = 24655;
pub const ACMDM_STREAM_RESET = 24656;
pub const ACMDM_STREAM_PREPARE = 24657;
pub const ACMDM_STREAM_UNPREPARE = 24658;
pub const ACMDM_STREAM_UPDATE = 24659;
pub const CALLBACK_TYPEMASK = 458752;
pub const CALLBACK_NULL = 0;
pub const CALLBACK_WINDOW = 65536;
pub const CALLBACK_TASK = 131072;
pub const CALLBACK_FUNCTION = 196608;
pub const CALLBACK_THREAD = 131072;
pub const CALLBACK_EVENT = 327680;
pub const WAVE_FORMAT_QUERY = 1;
pub const WAVE_ALLOWSYNC = 2;
pub const WAVE_MAPPED = 4;
pub const WAVE_FORMAT_DIRECT = 8;
pub const WAVE_FORMAT_DIRECT_QUERY = 9;
pub const WAVE_MAPPED_DEFAULT_COMMUNICATION_DEVICE = 16;
pub const MIDI_IO_STATUS = 32;
pub const SND_APPLICATION = 128;
pub const SND_ALIAS = 65536;
pub const SND_ALIAS_ID = 1114112;
pub const SND_FILENAME = 131072;
pub const SND_RESOURCE = 262148;
pub const SND_ASYNC = 1;
pub const SND_NODEFAULT = 2;
pub const SND_LOOP = 8;
pub const SND_MEMORY = 4;
pub const SND_NOSTOP = 16;
pub const SND_NOWAIT = 8192;
pub const SND_PURGE = 64;
pub const SND_SENTRY = 524288;
pub const SND_SYNC = 0;
pub const SND_SYSTEM = 2097152;
pub const MIXERLINE_COMPONENTTYPE_DST_DIGITAL = 1;
pub const MIXERLINE_COMPONENTTYPE_DST_HEADPHONES = 5;
pub const MIXERLINE_COMPONENTTYPE_DST_LINE = 2;
pub const MIXERLINE_COMPONENTTYPE_DST_MONITOR = 3;
pub const MIXERLINE_COMPONENTTYPE_DST_SPEAKERS = 4;
pub const MIXERLINE_COMPONENTTYPE_DST_TELEPHONE = 6;
pub const MIXERLINE_COMPONENTTYPE_DST_UNDEFINED = 0;
pub const MIXERLINE_COMPONENTTYPE_DST_VOICEIN = 8;
pub const MIXERLINE_COMPONENTTYPE_DST_WAVEIN = 7;
pub const MIXERLINE_COMPONENTTYPE_SRC_ANALOG = 4106;
pub const MIXERLINE_COMPONENTTYPE_SRC_AUXILIARY = 4105;
pub const MIXERLINE_COMPONENTTYPE_SRC_COMPACTDISC = 4101;
pub const MIXERLINE_COMPONENTTYPE_SRC_DIGITAL = 4097;
pub const MIXERLINE_COMPONENTTYPE_SRC_LINE = 4098;
pub const MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE = 4099;
pub const MIXERLINE_COMPONENTTYPE_SRC_PCSPEAKER = 4103;
pub const MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER = 4100;
pub const MIXERLINE_COMPONENTTYPE_SRC_TELEPHONE = 4102;
pub const MIXERLINE_COMPONENTTYPE_SRC_UNDEFINED = 4096;
pub const MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT = 4104;
pub const DEVICE_STATE_ACTIVE = 1;
pub const DEVICE_STATE_DISABLED = 2;
pub const DEVICE_STATE_NOTPRESENT = 4;
pub const DEVICE_STATE_UNPLUGGED = 8;
pub const AUDCLNT_SHAREMODE_SHARED = 0;
pub const AUDCLNT_SHAREMODE_EXCLUSIVE = 1;
pub const AudioCategory_Other = 0;
pub const AudioCategory_ForegroundOnlyMedia = 1;
pub const AudioCategory_Communications = 3;
pub const AudioCategory_Alerts = 4;
pub const AudioCategory_SoundEffects = 5;
pub const AudioCategory_GameEffects = 6;
pub const AudioCategory_GameMedia = 7;
pub const AudioCategory_GameChat = 8;
pub const AudioCategory_Speech = 9;
pub const AudioCategory_Movie = 10;
pub const AudioCategory_Media = 11;
pub const AudioCategory_FarFieldSpeech = 12;
pub const AudioCategory_UniformSpeech = 13;
pub const AudioCategory_VoiceTyping = 14;
pub const AudioSessionStateInactive = 0;
pub const AudioSessionStateActive = 1;
pub const AudioSessionStateExpired = 2;
pub const AUDCLNT_BUFFERFLAGS_DATA_DISCONTINUITY = 1;
pub const AUDCLNT_BUFFERFLAGS_SILENT = 2;
pub const AUDCLNT_BUFFERFLAGS_TIMESTAMP_ERROR = 4;
pub const AUDCLNT_STREAMOPTIONS_NONE = 0;
pub const AUDCLNT_STREAMOPTIONS_RAW = 1;
pub const AUDCLNT_STREAMOPTIONS_MATCH_FORMAT = 2;
pub const AUDCLNT_STREAMOPTIONS_AMBISONICS = 4;
pub const AUDCLNT_STREAMOPTIONS_POST_VOLUME_LOOPBACK = 8;
pub const AUDIO_DUCKING_OPTIONS_DEFAULT = 0;
pub const AUDIO_DUCKING_OPTIONS_DO_NOT_DUCK_OTHER_STREAMS = 1;
pub const AUDIO_EFFECT_STATE_OFF = 0;
pub const AUDIO_EFFECT_STATE_ON = 1;
pub const AMBISONICS_TYPE_FULL3D = 0;
pub const AMBISONICS_CHANNEL_ORDERING_ACN = 0;
pub const AMBISONICS_NORMALIZATION_SN3D = 0;
pub const AMBISONICS_NORMALIZATION_N3D = 1;
pub const AudioObjectType_None = 0;
pub const AudioObjectType_Dynamic = 1;
pub const AudioObjectType_FrontLeft = 2;
pub const AudioObjectType_FrontRight = 4;
pub const AudioObjectType_FrontCenter = 8;
pub const AudioObjectType_LowFrequency = 16;
pub const AudioObjectType_SideLeft = 32;
pub const AudioObjectType_SideRight = 64;
pub const AudioObjectType_BackLeft = 128;
pub const AudioObjectType_BackRight = 256;
pub const AudioObjectType_TopFrontLeft = 512;
pub const AudioObjectType_TopFrontRight = 1024;
pub const AudioObjectType_TopBackLeft = 2048;
pub const AudioObjectType_TopBackRight = 4096;
pub const AudioObjectType_BottomFrontLeft = 8192;
pub const AudioObjectType_BottomFrontRight = 16384;
pub const AudioObjectType_BottomBackLeft = 32768;
pub const AudioObjectType_BottomBackRight = 65536;
pub const AudioObjectType_BackCenter = 131072;
pub const AudioObjectType_StereoLeft = 262144;
pub const AudioObjectType_StereoRight = 524288;
pub const SPATIAL_AUDIO_STREAM_OPTIONS_NONE = 0;
pub const SPATIAL_AUDIO_STREAM_OPTIONS_OFFLOAD = 1;
pub const SpatialAudioHrtfDirectivity_OmniDirectional = 0;
pub const SpatialAudioHrtfDirectivity_Cardioid = 1;
pub const SpatialAudioHrtfDirectivity_Cone = 2;
pub const SpatialAudioHrtfEnvironment_Small = 0;
pub const SpatialAudioHrtfEnvironment_Medium = 1;
pub const SpatialAudioHrtfEnvironment_Large = 2;
pub const SpatialAudioHrtfEnvironment_Outdoors = 3;
pub const SpatialAudioHrtfEnvironment_Average = 4;
pub const SpatialAudioHrtfDistanceDecay_NaturalDecay = 0;
pub const SpatialAudioHrtfDistanceDecay_CustomDecay = 1;
pub const eRender = 0;
pub const eCapture = 1;
pub const eAll = 2;
pub const EDataFlow_enum_count = 3;
pub const eConsole = 0;
pub const eMultimedia = 1;
pub const eCommunications = 2;
pub const ERole_enum_count = 3;
pub const RemoteNetworkDevice = 0;
pub const Speakers = 1;
pub const LineLevel = 2;
pub const Headphones = 3;
pub const Microphone = 4;
pub const Headset = 5;
pub const Handset = 6;
pub const UnknownDigitalPassthrough = 7;
pub const SPDIF = 8;
pub const DigitalAudioDisplayDevice = 9;
pub const UnknownFormFactor = 10;
pub const EndpointFormFactor_enum_count = 11;
pub const AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE_DEFAULT = 0;
pub const AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE_USER = 1;
pub const AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE_VOLATILE = 2;
pub const AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE_ENUM_COUNT = 3;
pub const In = 0;
pub const Out = 1;
pub const Connector = 0;
pub const Subunit = 1;
pub const Unknown_Connector = 0;
pub const Physical_Internal = 1;
pub const Physical_External = 2;
pub const Software_IO = 3;
pub const Software_Fixed = 4;
pub const Network = 5;
pub const DisconnectReasonDeviceRemoval = 0;
pub const DisconnectReasonServerShutdown = 1;
pub const DisconnectReasonFormatChanged = 2;
pub const DisconnectReasonSessionLogoff = 3;
pub const DisconnectReasonSessionDisconnected = 4;
pub const DisconnectReasonExclusiveModeOverride = 5;
pub const SpatialAudioMetadataWriterOverflow_Fail = 0;
pub const SpatialAudioMetadataWriterOverflow_MergeWithNew = 1;
pub const SpatialAudioMetadataWriterOverflow_MergeWithLast = 2;
pub const SpatialAudioMetadataCopy_Overwrite = 0;
pub const SpatialAudioMetadataCopy_Append = 1;
pub const SpatialAudioMetadataCopy_AppendMergeWithLast = 2;
pub const SpatialAudioMetadataCopy_AppendMergeWithFirst = 3;
pub const PROCESS_LOOPBACK_MODE_INCLUDE_TARGET_PROCESS_TREE = 0;
pub const PROCESS_LOOPBACK_MODE_EXCLUDE_TARGET_PROCESS_TREE = 1;
pub const AUDIOCLIENT_ACTIVATION_TYPE_DEFAULT = 0;
pub const AUDIOCLIENT_ACTIVATION_TYPE_PROCESS_LOOPBACK = 1;
pub const Muted = 0;
pub const Low = 1;
pub const Full = 2;

pub const aliases = struct {
    pub const MIDI_WAVE_OPEN_TYPE = u32;
    pub const SND_FLAGS = u32;
    pub const MIXERLINE_COMPONENTTYPE = u32;
    pub const DEVICE_STATE = u32;
    pub const AUDCLNT_SHAREMODE = i32;
    pub const AUDIO_STREAM_CATEGORY = i32;
    pub const AudioSessionState = i32;
    pub const _AUDCLNT_BUFFERFLAGS = i32;
    pub const AUDCLNT_STREAMOPTIONS = i32;
    pub const AUDIO_DUCKING_OPTIONS = i32;
    pub const AUDIO_EFFECT_STATE = i32;
    pub const AMBISONICS_TYPE = i32;
    pub const AMBISONICS_CHANNEL_ORDERING = i32;
    pub const AMBISONICS_NORMALIZATION = i32;
    pub const AudioObjectType = i32;
    pub const SPATIAL_AUDIO_STREAM_OPTIONS = i32;
    pub const SpatialAudioHrtfDirectivityType = i32;
    pub const SpatialAudioHrtfEnvironmentType = i32;
    pub const SpatialAudioHrtfDistanceDecayType = i32;
    pub const EDataFlow = i32;
    pub const ERole = i32;
    pub const EndpointFormFactor = i32;
    pub const AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE = i32;
    pub const DataFlow = i32;
    pub const PartType = i32;
    pub const ConnectorType = i32;
    pub const AudioSessionDisconnectReason = i32;
    pub const SpatialAudioMetadataWriterOverflowMode = i32;
    pub const SpatialAudioMetadataCopyMode = i32;
    pub const PROCESS_LOOPBACK_MODE = i32;
    pub const AUDIOCLIENT_ACTIVATION_TYPE = i32;
    pub const AudioStateMonitorSoundLevel = i32;
    pub const HMIDI = ?*anyopaque;
    pub const HMIDIIN = ?*anyopaque;
    pub const HMIDIOUT = ?*anyopaque;
    pub const HMIDISTRM = ?*anyopaque;
    pub const HMIXER = ?*anyopaque;
    pub const HMIXEROBJ = ?*anyopaque;
    pub const HWAVE = ?*anyopaque;
    pub const HWAVEOUT = ?*anyopaque;
    pub const HWAVEIN = ?*anyopaque;
    pub const HACMDRIVERID = ?*anyopaque;
    pub const HACMDRIVER = ?*anyopaque;
    pub const HACMSTREAM = ?*anyopaque;
    pub const HACMOBJ = ?*anyopaque;
};
