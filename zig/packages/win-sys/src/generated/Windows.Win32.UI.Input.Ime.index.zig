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
    .{ "ImmInstallIMEA", MethodRecord{ .library = "IMM32", .import = "ImmInstallIMEA", .signature = "\x00\x02\x11\xc0\x00\x47\x2d\x11\x3d\x11\x3d" } },
    .{ "ImmInstallIMEW", MethodRecord{ .library = "IMM32", .import = "ImmInstallIMEW", .signature = "\x00\x02\x11\xc0\x00\x47\x2d\x11\x05\x11\x05" } },
    .{ "ImmGetDefaultIMEWnd", MethodRecord{ .library = "IMM32", .import = "ImmGetDefaultIMEWnd", .signature = "\x00\x01\x11\x25\x11\x25" } },
    .{ "ImmGetDescriptionA", MethodRecord{ .library = "IMM32", .import = "ImmGetDescriptionA", .signature = "\x00\x03\x09\x11\xc0\x00\x47\x2d\x11\x3d\x09" } },
    .{ "ImmGetDescriptionW", MethodRecord{ .library = "IMM32", .import = "ImmGetDescriptionW", .signature = "\x00\x03\x09\x11\xc0\x00\x47\x2d\x11\x05\x09" } },
    .{ "ImmGetIMEFileNameA", MethodRecord{ .library = "IMM32", .import = "ImmGetIMEFileNameA", .signature = "\x00\x03\x09\x11\xc0\x00\x47\x2d\x11\x3d\x09" } },
    .{ "ImmGetIMEFileNameW", MethodRecord{ .library = "IMM32", .import = "ImmGetIMEFileNameW", .signature = "\x00\x03\x09\x11\xc0\x00\x47\x2d\x11\x05\x09" } },
    .{ "ImmGetProperty", MethodRecord{ .library = "IMM32", .import = "ImmGetProperty", .signature = "\x00\x02\x09\x11\xc0\x00\x47\x2d\x09" } },
    .{ "ImmIsIME", MethodRecord{ .library = "IMM32", .import = "ImmIsIME", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x47\x2d" } },
    .{ "ImmSimulateHotKey", MethodRecord{ .library = "IMM32", .import = "ImmSimulateHotKey", .signature = "\x00\x02\x11\x59\x11\x25\x11\xa6\x89" } },
    .{ "ImmCreateContext", MethodRecord{ .library = "IMM32", .import = "ImmCreateContext", .signature = "\x00\x00\x11\xc0\x00\x47\x31" } },
    .{ "ImmDestroyContext", MethodRecord{ .library = "IMM32", .import = "ImmDestroyContext", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x47\x31" } },
    .{ "ImmGetContext", MethodRecord{ .library = "IMM32", .import = "ImmGetContext", .signature = "\x00\x01\x11\xc0\x00\x47\x31\x11\x25" } },
    .{ "ImmReleaseContext", MethodRecord{ .library = "IMM32", .import = "ImmReleaseContext", .signature = "\x00\x02\x11\x59\x11\x25\x11\xc0\x00\x47\x31" } },
    .{ "ImmAssociateContext", MethodRecord{ .library = "IMM32", .import = "ImmAssociateContext", .signature = "\x00\x02\x11\xc0\x00\x47\x31\x11\x25\x11\xc0\x00\x47\x31" } },
    .{ "ImmAssociateContextEx", MethodRecord{ .library = "IMM32", .import = "ImmAssociateContextEx", .signature = "\x00\x03\x11\x59\x11\x25\x11\xc0\x00\x47\x31\x09" } },
    .{ "ImmGetCompositionStringA", MethodRecord{ .library = "IMM32", .import = "ImmGetCompositionStringA", .signature = "\x00\x04\x08\x11\xc0\x00\x47\x31\x11\xa6\x81\x0f\x01\x09" } },
    .{ "ImmGetCompositionStringW", MethodRecord{ .library = "IMM32", .import = "ImmGetCompositionStringW", .signature = "\x00\x04\x08\x11\xc0\x00\x47\x31\x11\xa6\x81\x0f\x01\x09" } },
    .{ "ImmSetCompositionStringA", MethodRecord{ .library = "IMM32", .import = "ImmSetCompositionStringA", .signature = "\x00\x06\x11\x59\x11\xc0\x00\x47\x31\x11\xa6\x61\x0f\x01\x09\x0f\x01\x09" } },
    .{ "ImmSetCompositionStringW", MethodRecord{ .library = "IMM32", .import = "ImmSetCompositionStringW", .signature = "\x00\x06\x11\x59\x11\xc0\x00\x47\x31\x11\xa6\x61\x0f\x01\x09\x0f\x01\x09" } },
    .{ "ImmGetCandidateListCountA", MethodRecord{ .library = "IMM32", .import = "ImmGetCandidateListCountA", .signature = "\x00\x02\x09\x11\xc0\x00\x47\x31\x0f\x09" } },
    .{ "ImmGetCandidateListCountW", MethodRecord{ .library = "IMM32", .import = "ImmGetCandidateListCountW", .signature = "\x00\x02\x09\x11\xc0\x00\x47\x31\x0f\x09" } },
    .{ "ImmGetCandidateListA", MethodRecord{ .library = "IMM32", .import = "ImmGetCandidateListA", .signature = "\x00\x04\x09\x11\xc0\x00\x47\x31\x09\x0f\x11\xc0\x00\x47\x35\x09" } },
    .{ "ImmGetCandidateListW", MethodRecord{ .library = "IMM32", .import = "ImmGetCandidateListW", .signature = "\x00\x04\x09\x11\xc0\x00\x47\x31\x09\x0f\x11\xc0\x00\x47\x35\x09" } },
    .{ "ImmGetGuideLineA", MethodRecord{ .library = "IMM32", .import = "ImmGetGuideLineA", .signature = "\x00\x04\x09\x11\xc0\x00\x47\x31\x11\xa6\x65\x11\x3d\x09" } },
    .{ "ImmGetGuideLineW", MethodRecord{ .library = "IMM32", .import = "ImmGetGuideLineW", .signature = "\x00\x04\x09\x11\xc0\x00\x47\x31\x11\xa6\x65\x11\x05\x09" } },
    .{ "ImmGetConversionStatus", MethodRecord{ .library = "IMM32", .import = "ImmGetConversionStatus", .signature = "\x00\x03\x11\x59\x11\xc0\x00\x47\x31\x0f\x11\xa6\x79\x0f\x11\xa6\x7d" } },
    .{ "ImmSetConversionStatus", MethodRecord{ .library = "IMM32", .import = "ImmSetConversionStatus", .signature = "\x00\x03\x11\x59\x11\xc0\x00\x47\x31\x11\xa6\x79\x11\xa6\x7d" } },
    .{ "ImmGetOpenStatus", MethodRecord{ .library = "IMM32", .import = "ImmGetOpenStatus", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x47\x31" } },
    .{ "ImmSetOpenStatus", MethodRecord{ .library = "IMM32", .import = "ImmSetOpenStatus", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x47\x31\x11\x59" } },
    .{ "ImmGetCompositionFontA", MethodRecord{ .library = "IMM32", .import = "ImmGetCompositionFontA", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x47\x31\x0f\x11\x8d\x95" } },
    .{ "ImmGetCompositionFontW", MethodRecord{ .library = "IMM32", .import = "ImmGetCompositionFontW", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x47\x31\x0f\x11\x83\xfd" } },
    .{ "ImmSetCompositionFontA", MethodRecord{ .library = "IMM32", .import = "ImmSetCompositionFontA", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x47\x31\x0f\x11\x8d\x95" } },
    .{ "ImmSetCompositionFontW", MethodRecord{ .library = "IMM32", .import = "ImmSetCompositionFontW", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x47\x31\x0f\x11\x83\xfd" } },
    .{ "ImmConfigureIMEA", MethodRecord{ .library = "IMM32", .import = "ImmConfigureIMEA", .signature = "\x00\x04\x11\x59\x11\xc0\x00\x47\x2d\x11\x25\x09\x0f\x01" } },
    .{ "ImmConfigureIMEW", MethodRecord{ .library = "IMM32", .import = "ImmConfigureIMEW", .signature = "\x00\x04\x11\x59\x11\xc0\x00\x47\x2d\x11\x25\x09\x0f\x01" } },
    .{ "ImmEscapeA", MethodRecord{ .library = "IMM32", .import = "ImmEscapeA", .signature = "\x00\x04\x11\x82\x35\x11\xc0\x00\x47\x2d\x11\xc0\x00\x47\x31\x11\xa6\x85\x0f\x01" } },
    .{ "ImmEscapeW", MethodRecord{ .library = "IMM32", .import = "ImmEscapeW", .signature = "\x00\x04\x11\x82\x35\x11\xc0\x00\x47\x2d\x11\xc0\x00\x47\x31\x11\xa6\x85\x0f\x01" } },
    .{ "ImmGetConversionListA", MethodRecord{ .library = "IMM32", .import = "ImmGetConversionListA", .signature = "\x00\x06\x09\x11\xc0\x00\x47\x2d\x11\xc0\x00\x47\x31\x11\x3d\x0f\x11\xc0\x00\x47\x35\x09\x11\xa6\x71" } },
    .{ "ImmGetConversionListW", MethodRecord{ .library = "IMM32", .import = "ImmGetConversionListW", .signature = "\x00\x06\x09\x11\xc0\x00\x47\x2d\x11\xc0\x00\x47\x31\x11\x05\x0f\x11\xc0\x00\x47\x35\x09\x11\xa6\x71" } },
    .{ "ImmNotifyIME", MethodRecord{ .library = "IMM32", .import = "ImmNotifyIME", .signature = "\x00\x04\x11\x59\x11\xc0\x00\x47\x31\x11\xa6\x6d\x11\xa6\x69\x09" } },
    .{ "ImmGetStatusWindowPos", MethodRecord{ .library = "IMM32", .import = "ImmGetStatusWindowPos", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x47\x31\x0f\x11\x83\x71" } },
    .{ "ImmSetStatusWindowPos", MethodRecord{ .library = "IMM32", .import = "ImmSetStatusWindowPos", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x47\x31\x0f\x11\x83\x71" } },
    .{ "ImmGetCompositionWindow", MethodRecord{ .library = "IMM32", .import = "ImmGetCompositionWindow", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x47\x31\x0f\x11\xc0\x00\x47\x39" } },
    .{ "ImmSetCompositionWindow", MethodRecord{ .library = "IMM32", .import = "ImmSetCompositionWindow", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x47\x31\x0f\x11\xc0\x00\x47\x39" } },
    .{ "ImmGetCandidateWindow", MethodRecord{ .library = "IMM32", .import = "ImmGetCandidateWindow", .signature = "\x00\x03\x11\x59\x11\xc0\x00\x47\x31\x09\x0f\x11\xc0\x00\x47\x3d" } },
    .{ "ImmSetCandidateWindow", MethodRecord{ .library = "IMM32", .import = "ImmSetCandidateWindow", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x47\x31\x0f\x11\xc0\x00\x47\x3d" } },
    .{ "ImmIsUIMessageA", MethodRecord{ .library = "IMM32", .import = "ImmIsUIMessageA", .signature = "\x00\x04\x11\x59\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "ImmIsUIMessageW", MethodRecord{ .library = "IMM32", .import = "ImmIsUIMessageW", .signature = "\x00\x04\x11\x59\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "ImmGetVirtualKey", MethodRecord{ .library = "IMM32", .import = "ImmGetVirtualKey", .signature = "\x00\x01\x09\x11\x25" } },
    .{ "ImmRegisterWordA", MethodRecord{ .library = "IMM32", .import = "ImmRegisterWordA", .signature = "\x00\x04\x11\x59\x11\xc0\x00\x47\x2d\x11\x3d\x09\x11\x3d" } },
    .{ "ImmRegisterWordW", MethodRecord{ .library = "IMM32", .import = "ImmRegisterWordW", .signature = "\x00\x04\x11\x59\x11\xc0\x00\x47\x2d\x11\x05\x09\x11\x05" } },
    .{ "ImmUnregisterWordA", MethodRecord{ .library = "IMM32", .import = "ImmUnregisterWordA", .signature = "\x00\x04\x11\x59\x11\xc0\x00\x47\x2d\x11\x3d\x09\x11\x3d" } },
    .{ "ImmUnregisterWordW", MethodRecord{ .library = "IMM32", .import = "ImmUnregisterWordW", .signature = "\x00\x04\x11\x59\x11\xc0\x00\x47\x2d\x11\x05\x09\x11\x05" } },
    .{ "ImmGetRegisterWordStyleA", MethodRecord{ .library = "IMM32", .import = "ImmGetRegisterWordStyleA", .signature = "\x00\x03\x09\x11\xc0\x00\x47\x2d\x09\x0f\x11\xc0\x00\x47\x41" } },
    .{ "ImmGetRegisterWordStyleW", MethodRecord{ .library = "IMM32", .import = "ImmGetRegisterWordStyleW", .signature = "\x00\x03\x09\x11\xc0\x00\x47\x2d\x09\x0f\x11\xc0\x00\x47\x45" } },
    .{ "ImmEnumRegisterWordA", MethodRecord{ .library = "IMM32", .import = "ImmEnumRegisterWordA", .signature = "\x00\x06\x09\x11\xc0\x00\x47\x2d\x12\xc0\x00\x47\x49\x11\x3d\x09\x11\x3d\x0f\x01" } },
    .{ "ImmEnumRegisterWordW", MethodRecord{ .library = "IMM32", .import = "ImmEnumRegisterWordW", .signature = "\x00\x06\x09\x11\xc0\x00\x47\x2d\x12\xc0\x00\x47\x4d\x11\x05\x09\x11\x05\x0f\x01" } },
    .{ "ImmDisableIME", MethodRecord{ .library = "IMM32", .import = "ImmDisableIME", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "ImmEnumInputContext", MethodRecord{ .library = "IMM32", .import = "ImmEnumInputContext", .signature = "\x00\x03\x11\x59\x09\x12\xc0\x00\x47\x51\x11\x82\x2d" } },
    .{ "ImmGetImeMenuItemsA", MethodRecord{ .library = "IMM32", .import = "ImmGetImeMenuItemsA", .signature = "\x00\x06\x09\x11\xc0\x00\x47\x31\x09\x09\x0f\x11\xc0\x00\x47\x55\x0f\x11\xc0\x00\x47\x55\x09" } },
    .{ "ImmGetImeMenuItemsW", MethodRecord{ .library = "IMM32", .import = "ImmGetImeMenuItemsW", .signature = "\x00\x06\x09\x11\xc0\x00\x47\x31\x09\x09\x0f\x11\xc0\x00\x47\x59\x0f\x11\xc0\x00\x47\x59\x09" } },
    .{ "ImmDisableTextFrameService", MethodRecord{ .library = "IMM32", .import = "ImmDisableTextFrameService", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "ImmDisableLegacyIME", MethodRecord{ .library = "IMM32", .import = "ImmDisableLegacyIME", .signature = "\x00\x00\x11\x59" } },
    .{ "ImmGetHotKey", MethodRecord{ .library = "IMM32", .import = "ImmGetHotKey", .signature = "\x00\x04\x11\x59\x09\x0f\x09\x0f\x09\x0f\x11\xc0\x00\x47\x2d" } },
    .{ "ImmSetHotKey", MethodRecord{ .library = "IMM32", .import = "ImmSetHotKey", .signature = "\x00\x04\x11\x59\x09\x09\x09\x11\xc0\x00\x47\x2d" } },
    .{ "ImmGenerateMessage", MethodRecord{ .library = "IMM32", .import = "ImmGenerateMessage", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x47\x31" } },
    .{ "ImmRequestMessageA", MethodRecord{ .library = "IMM32", .import = "ImmRequestMessageA", .signature = "\x00\x03\x11\x82\x35\x11\xc0\x00\x47\x31\x11\x83\x8d\x11\x82\x2d" } },
    .{ "ImmRequestMessageW", MethodRecord{ .library = "IMM32", .import = "ImmRequestMessageW", .signature = "\x00\x03\x11\x82\x35\x11\xc0\x00\x47\x31\x11\x83\x8d\x11\x82\x2d" } },
    .{ "ImmCreateSoftKeyboard", MethodRecord{ .library = "IMM32", .import = "ImmCreateSoftKeyboard", .signature = "\x00\x04\x11\x25\x09\x11\x25\x08\x08" } },
    .{ "ImmDestroySoftKeyboard", MethodRecord{ .library = "IMM32", .import = "ImmDestroySoftKeyboard", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "ImmShowSoftKeyboard", MethodRecord{ .library = "IMM32", .import = "ImmShowSoftKeyboard", .signature = "\x00\x02\x11\x59\x11\x25\x08" } },
    .{ "ImmLockIMC", MethodRecord{ .library = "IMM32", .import = "ImmLockIMC", .signature = "\x00\x01\x0f\x11\xc0\x00\x47\x5d\x11\xc0\x00\x47\x31" } },
    .{ "ImmUnlockIMC", MethodRecord{ .library = "IMM32", .import = "ImmUnlockIMC", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x47\x31" } },
    .{ "ImmGetIMCLockCount", MethodRecord{ .library = "IMM32", .import = "ImmGetIMCLockCount", .signature = "\x00\x01\x09\x11\xc0\x00\x47\x31" } },
    .{ "ImmCreateIMCC", MethodRecord{ .library = "IMM32", .import = "ImmCreateIMCC", .signature = "\x00\x01\x11\xc0\x00\x47\x61\x09" } },
    .{ "ImmDestroyIMCC", MethodRecord{ .library = "IMM32", .import = "ImmDestroyIMCC", .signature = "\x00\x01\x11\xc0\x00\x47\x61\x11\xc0\x00\x47\x61" } },
    .{ "ImmLockIMCC", MethodRecord{ .library = "IMM32", .import = "ImmLockIMCC", .signature = "\x00\x01\x0f\x01\x11\xc0\x00\x47\x61" } },
    .{ "ImmUnlockIMCC", MethodRecord{ .library = "IMM32", .import = "ImmUnlockIMCC", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x47\x61" } },
    .{ "ImmGetIMCCLockCount", MethodRecord{ .library = "IMM32", .import = "ImmGetIMCCLockCount", .signature = "\x00\x01\x09\x11\xc0\x00\x47\x61" } },
    .{ "ImmReSizeIMCC", MethodRecord{ .library = "IMM32", .import = "ImmReSizeIMCC", .signature = "\x00\x02\x11\xc0\x00\x47\x61\x11\xc0\x00\x47\x61\x09" } },
    .{ "ImmGetIMCCSize", MethodRecord{ .library = "IMM32", .import = "ImmGetIMCCSize", .signature = "\x00\x01\x09\x11\xc0\x00\x47\x61" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x235 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LRESULT" },
        0x371 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "POINT" },
        0x38d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WPARAM" },
        0x3fd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "LOGFONTW" },
        0xd95 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "LOGFONTA" },
        0x2661 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "SET_COMPOSITION_STRING_TYPE" },
        0x2665 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "GET_GUIDE_LINE_TYPE" },
        0x2669 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "NOTIFY_IME_INDEX" },
        0x266d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "NOTIFY_IME_ACTION" },
        0x2671 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "GET_CONVERSION_LIST_FLAG" },
        0x2679 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "IME_CONVERSION_MODE" },
        0x267d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "IME_SENTENCE_MODE" },
        0x2681 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "IME_COMPOSITION_STRING" },
        0x2685 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "IME_ESCAPE" },
        0x2689 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "IME_HOTKEY_IDENTIFIER" },
        0x472d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.KeyboardAndMouse", .name = "HKL" },
        0x4731 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "HIMC" },
        0x4735 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "CANDIDATELIST" },
        0x4739 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "COMPOSITIONFORM" },
        0x473d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "CANDIDATEFORM" },
        0x4741 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "STYLEBUFA" },
        0x4745 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "STYLEBUFW" },
        0x4749 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "REGISTERWORDENUMPROCA" },
        0x474d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "REGISTERWORDENUMPROCW" },
        0x4751 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "IMCENUMPROC" },
        0x4755 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "IMEMENUITEMINFOA" },
        0x4759 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "IMEMENUITEMINFOW" },
        0x475d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "INPUTCONTEXT" },
        0x4761 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Ime", .name = "HIMCC" },
        else => null,
    };
}

pub const SCS_SETSTR = 9;
pub const SCS_CHANGEATTR = 18;
pub const SCS_CHANGECLAUSE = 36;
pub const SCS_SETRECONVERTSTRING = 65536;
pub const SCS_QUERYRECONVERTSTRING = 131072;
pub const GGL_LEVEL = 1;
pub const GGL_INDEX = 2;
pub const GGL_STRING = 3;
pub const GGL_PRIVATE = 4;
pub const CPS_CANCEL = 4;
pub const CPS_COMPLETE = 1;
pub const CPS_CONVERT = 2;
pub const CPS_REVERT = 3;
pub const NI_CHANGECANDIDATELIST = 19;
pub const NI_CLOSECANDIDATE = 17;
pub const NI_COMPOSITIONSTR = 21;
pub const NI_IMEMENUSELECTED = 24;
pub const NI_OPENCANDIDATE = 16;
pub const NI_SELECTCANDIDATESTR = 18;
pub const NI_SETCANDIDATE_PAGESIZE = 23;
pub const NI_SETCANDIDATE_PAGESTART = 22;
pub const GCL_CONVERSION = 1;
pub const GCL_REVERSECONVERSION = 2;
pub const GCL_REVERSE_LENGTH = 3;
pub const IMEPADREQ_INSERTSTRING = 4097;
pub const IMEPADREQ_SENDCONTROL = 4100;
pub const IMEPADREQ_SETAPPLETSIZE = 4104;
pub const IMEPADREQ_GETCOMPOSITIONSTRING = 4102;
pub const IMEPADREQ_GETCOMPOSITIONSTRINGINFO = 4108;
pub const IMEPADREQ_DELETESTRING = 4112;
pub const IMEPADREQ_CHANGESTRING = 4113;
pub const IMEPADREQ_GETAPPLHWND = 4116;
pub const IMEPADREQ_FORCEIMEPADWINDOWSHOW = 4117;
pub const IMEPADREQ_POSTMODALNOTIFY = 4118;
pub const IMEPADREQ_GETDEFAULTUILANGID = 4119;
pub const IMEPADREQ_GETAPPLETUISTYLE = 4121;
pub const IMEPADREQ_SETAPPLETUISTYLE = 4122;
pub const IMEPADREQ_ISAPPLETACTIVE = 4123;
pub const IMEPADREQ_ISIMEPADWINDOWVISIBLE = 4124;
pub const IMEPADREQ_SETAPPLETMINMAXSIZE = 4125;
pub const IMEPADREQ_GETCONVERSIONSTATUS = 4126;
pub const IMEPADREQ_GETVERSION = 4127;
pub const IMEPADREQ_GETCURRENTIMEINFO = 4128;
pub const IME_CMODE_ALPHANUMERIC = 0;
pub const IME_CMODE_NATIVE = 1;
pub const IME_CMODE_CHINESE = 1;
pub const IME_CMODE_HANGUL = 1;
pub const IME_CMODE_JAPANESE = 1;
pub const IME_CMODE_KATAKANA = 2;
pub const IME_CMODE_LANGUAGE = 3;
pub const IME_CMODE_FULLSHAPE = 8;
pub const IME_CMODE_ROMAN = 16;
pub const IME_CMODE_CHARCODE = 32;
pub const IME_CMODE_HANJACONVERT = 64;
pub const IME_CMODE_NATIVESYMBOL = 128;
pub const IME_CMODE_HANGEUL = 1;
pub const IME_CMODE_SOFTKBD = 128;
pub const IME_CMODE_NOCONVERSION = 256;
pub const IME_CMODE_EUDC = 512;
pub const IME_CMODE_SYMBOL = 1024;
pub const IME_CMODE_FIXED = 2048;
pub const IME_CMODE_RESERVED = 4026531840;
pub const IME_SMODE_NONE = 0;
pub const IME_SMODE_PLAURALCLAUSE = 1;
pub const IME_SMODE_SINGLECONVERT = 2;
pub const IME_SMODE_AUTOMATIC = 4;
pub const IME_SMODE_PHRASEPREDICT = 8;
pub const IME_SMODE_CONVERSATION = 16;
pub const IME_SMODE_RESERVED = 61440;
pub const GCS_COMPREADSTR = 1;
pub const GCS_COMPREADATTR = 2;
pub const GCS_COMPREADCLAUSE = 4;
pub const GCS_COMPSTR = 8;
pub const GCS_COMPATTR = 16;
pub const GCS_COMPCLAUSE = 32;
pub const GCS_CURSORPOS = 128;
pub const GCS_DELTASTART = 256;
pub const GCS_RESULTREADSTR = 512;
pub const GCS_RESULTREADCLAUSE = 1024;
pub const GCS_RESULTSTR = 2048;
pub const GCS_RESULTCLAUSE = 4096;
pub const IME_ESC_QUERY_SUPPORT = 3;
pub const IME_ESC_RESERVED_FIRST = 4;
pub const IME_ESC_RESERVED_LAST = 2047;
pub const IME_ESC_PRIVATE_FIRST = 2048;
pub const IME_ESC_PRIVATE_LAST = 4095;
pub const IME_ESC_SEQUENCE_TO_INTERNAL = 4097;
pub const IME_ESC_GET_EUDC_DICTIONARY = 4099;
pub const IME_ESC_SET_EUDC_DICTIONARY = 4100;
pub const IME_ESC_MAX_KEY = 4101;
pub const IME_ESC_IME_NAME = 4102;
pub const IME_ESC_SYNC_HOTKEY = 4103;
pub const IME_ESC_HANJA_MODE = 4104;
pub const IME_ESC_AUTOMATA = 4105;
pub const IME_ESC_PRIVATE_HOTKEY = 4106;
pub const IME_ESC_GETHELPFILENAME = 4107;
pub const IME_CHOTKEY_IME_NONIME_TOGGLE = 16;
pub const IME_CHOTKEY_SHAPE_TOGGLE = 17;
pub const IME_CHOTKEY_SYMBOL_TOGGLE = 18;
pub const IME_JHOTKEY_CLOSE_OPEN = 48;
pub const IME_KHOTKEY_SHAPE_TOGGLE = 80;
pub const IME_KHOTKEY_HANJACONVERT = 81;
pub const IME_KHOTKEY_ENGLISH = 82;
pub const IME_THOTKEY_IME_NONIME_TOGGLE = 112;
pub const IME_THOTKEY_SHAPE_TOGGLE = 113;
pub const IME_THOTKEY_SYMBOL_TOGGLE = 114;
pub const IME_ITHOTKEY_RESEND_RESULTSTR = 512;
pub const IME_ITHOTKEY_PREVIOUS_COMPOSITION = 513;
pub const IME_ITHOTKEY_UISTYLE_TOGGLE = 514;
pub const IME_ITHOTKEY_RECONVERTSTRING = 515;
pub const FEID_NONE = 0;
pub const FEID_CHINESE_TRADITIONAL = 1;
pub const FEID_CHINESE_SIMPLIFIED = 2;
pub const FEID_CHINESE_HONGKONG = 3;
pub const FEID_CHINESE_SINGAPORE = 4;
pub const FEID_JAPANESE = 5;
pub const FEID_KOREAN = 6;
pub const FEID_KOREAN_JOHAB = 7;
pub const INFOMASK_NONE = 0;
pub const INFOMASK_QUERY_CAND = 1;
pub const INFOMASK_APPLY_CAND = 2;
pub const INFOMASK_APPLY_CAND_EX = 4;
pub const INFOMASK_STRING_FIX = 65536;
pub const INFOMASK_HIDE_CAND = 131072;
pub const INFOMASK_BLOCK_CAND = 262144;
pub const IMEFAREASTINFO_TYPE_DEFAULT = 0;
pub const IMEFAREASTINFO_TYPE_READING = 1;
pub const IMEFAREASTINFO_TYPE_COMMENT = 2;
pub const IMEFAREASTINFO_TYPE_COSTTIME = 3;
pub const CHARINFO_APPLETID_MASK = 4278190080;
pub const CHARINFO_FEID_MASK = 15728640;
pub const CHARINFO_CHARID_MASK = 65535;
pub const MAX_APPLETTITLE = 64;
pub const MAX_FONTFACE = 32;
pub const IPACFG_NONE = 0;
pub const IPACFG_PROPERTY = 1;
pub const IPACFG_HELP = 2;
pub const IPACFG_TITLE = 65536;
pub const IPACFG_TITLEFONTFACE = 131072;
pub const IPACFG_CATEGORY = 262144;
pub const IPACFG_LANG = 16;
pub const IPACID_NONE = 0;
pub const IPACID_SOFTKEY = 1;
pub const IPACID_HANDWRITING = 2;
pub const IPACID_STROKESEARCH = 3;
pub const IPACID_RADICALSEARCH = 4;
pub const IPACID_SYMBOLSEARCH = 5;
pub const IPACID_VOICE = 6;
pub const IPACID_EPWING = 7;
pub const IPACID_OCR = 8;
pub const IPACID_CHARLIST = 9;
pub const IPACID_USER = 256;
pub const IMEPADREQ_FIRST = 4096;
pub const IMEPADREQ_INSERTSTRINGCANDIDATE = 4098;
pub const IMEPADREQ_INSERTITEMCANDIDATE = 4099;
pub const IMEPADREQ_SENDKEYCONTROL = 4101;
pub const IMEPADREQ_GETSELECTEDSTRING = 4103;
pub const IMEPADREQ_SETAPPLETDATA = 4105;
pub const IMEPADREQ_GETAPPLETDATA = 4106;
pub const IMEPADREQ_SETTITLEFONT = 4107;
pub const IMEPADREQ_GETCOMPOSITIONSTRINGID = 4109;
pub const IMEPADREQ_INSERTSTRINGCANDIDATEINFO = 4110;
pub const IMEPADREQ_CHANGESTRINGCANDIDATEINFO = 4111;
pub const IMEPADREQ_INSERTSTRINGINFO = 4114;
pub const IMEPADREQ_CHANGESTRINGINFO = 4115;
pub const IMEPADREQ_GETCURRENTUILANGID = 4120;
pub const IMEPADCTRL_CONVERTALL = 1;
pub const IMEPADCTRL_DETERMINALL = 2;
pub const IMEPADCTRL_DETERMINCHAR = 3;
pub const IMEPADCTRL_CLEARALL = 4;
pub const IMEPADCTRL_CARETSET = 5;
pub const IMEPADCTRL_CARETLEFT = 6;
pub const IMEPADCTRL_CARETRIGHT = 7;
pub const IMEPADCTRL_CARETTOP = 8;
pub const IMEPADCTRL_CARETBOTTOM = 9;
pub const IMEPADCTRL_CARETBACKSPACE = 10;
pub const IMEPADCTRL_CARETDELETE = 11;
pub const IMEPADCTRL_PHRASEDELETE = 12;
pub const IMEPADCTRL_INSERTSPACE = 13;
pub const IMEPADCTRL_INSERTFULLSPACE = 14;
pub const IMEPADCTRL_INSERTHALFSPACE = 15;
pub const IMEPADCTRL_ONIME = 16;
pub const IMEPADCTRL_OFFIME = 17;
pub const IMEPADCTRL_ONPRECONVERSION = 18;
pub const IMEPADCTRL_OFFPRECONVERSION = 19;
pub const IMEPADCTRL_PHONETICCANDIDATE = 20;
pub const IMEKEYCTRLMASK_ALT = 1;
pub const IMEKEYCTRLMASK_CTRL = 2;
pub const IMEKEYCTRLMASK_SHIFT = 4;
pub const IMEKEYCTRL_UP = 1;
pub const IMEKEYCTRL_DOWN = 0;
pub const IMEPN_FIRST = 256;
pub const IMEPN_ACTIVATE = 257;
pub const IMEPN_INACTIVATE = 258;
pub const IMEPN_SHOW = 260;
pub const IMEPN_HIDE = 261;
pub const IMEPN_SIZECHANGING = 262;
pub const IMEPN_SIZECHANGED = 263;
pub const IMEPN_CONFIG = 264;
pub const IMEPN_HELP = 265;
pub const IMEPN_QUERYCAND = 266;
pub const IMEPN_APPLYCAND = 267;
pub const IMEPN_APPLYCANDEX = 268;
pub const IMEPN_SETTINGCHANGED = 269;
pub const IMEPN_USER = 356;
pub const IPAWS_ENABLED = 1;
pub const IPAWS_SIZINGNOTIFY = 4;
pub const IPAWS_VERTICALFIXED = 256;
pub const IPAWS_HORIZONTALFIXED = 512;
pub const IPAWS_SIZEFIXED = 768;
pub const IPAWS_MAXWIDTHFIXED = 4096;
pub const IPAWS_MAXHEIGHTFIXED = 8192;
pub const IPAWS_MAXSIZEFIXED = 12288;
pub const IPAWS_MINWIDTHFIXED = 65536;
pub const IPAWS_MINHEIGHTFIXED = 131072;
pub const IPAWS_MINSIZEFIXED = 196608;
pub const STYLE_DESCRIPTION_SIZE = 32;
pub const IMEMENUITEM_STRING_SIZE = 80;
pub const IMC_GETCANDIDATEPOS = 7;
pub const IMC_SETCANDIDATEPOS = 8;
pub const IMC_GETCOMPOSITIONFONT = 9;
pub const IMC_SETCOMPOSITIONFONT = 10;
pub const IMC_GETCOMPOSITIONWINDOW = 11;
pub const IMC_SETCOMPOSITIONWINDOW = 12;
pub const IMC_GETSTATUSWINDOWPOS = 15;
pub const IMC_SETSTATUSWINDOWPOS = 16;
pub const IMC_CLOSESTATUSWINDOW = 33;
pub const IMC_OPENSTATUSWINDOW = 34;
pub const NI_FINALIZECONVERSIONRESULT = 20;
pub const ISC_SHOWUICANDIDATEWINDOW = 1;
pub const ISC_SHOWUICOMPOSITIONWINDOW = 2147483648;
pub const ISC_SHOWUIGUIDELINE = 1073741824;
pub const ISC_SHOWUIALLCANDIDATEWINDOW = 15;
pub const ISC_SHOWUIALL = 3221225487;
pub const MOD_LEFT = 32768;
pub const MOD_RIGHT = 16384;
pub const MOD_ON_KEYUP = 2048;
pub const MOD_IGNORE_ALL_MODIFIER = 1024;
pub const IME_HOTKEY_DSWITCH_FIRST = 256;
pub const IME_HOTKEY_DSWITCH_LAST = 287;
pub const IME_HOTKEY_PRIVATE_FIRST = 512;
pub const IME_HOTKEY_PRIVATE_LAST = 543;
pub const CS_INSERTCHAR = 8192;
pub const CS_NOMOVECARET = 16384;
pub const IMEVER_0310 = 196618;
pub const IMEVER_0400 = 262144;
pub const IME_PROP_AT_CARET = 65536;
pub const IME_PROP_SPECIAL_UI = 131072;
pub const IME_PROP_CANDLIST_START_FROM_1 = 262144;
pub const IME_PROP_UNICODE = 524288;
pub const IME_PROP_COMPLETE_ON_UNSELECT = 1048576;
pub const UI_CAP_2700 = 1;
pub const UI_CAP_ROT90 = 2;
pub const UI_CAP_ROTANY = 4;
pub const SCS_CAP_COMPSTR = 1;
pub const SCS_CAP_MAKEREAD = 2;
pub const SCS_CAP_SETRECONVERTSTRING = 4;
pub const SELECT_CAP_CONVERSION = 1;
pub const SELECT_CAP_SENTENCE = 2;
pub const GL_LEVEL_NOGUIDELINE = 0;
pub const GL_LEVEL_FATAL = 1;
pub const GL_LEVEL_ERROR = 2;
pub const GL_LEVEL_WARNING = 3;
pub const GL_LEVEL_INFORMATION = 4;
pub const GL_ID_UNKNOWN = 0;
pub const GL_ID_NOMODULE = 1;
pub const GL_ID_NODICTIONARY = 16;
pub const GL_ID_CANNOTSAVE = 17;
pub const GL_ID_NOCONVERT = 32;
pub const GL_ID_TYPINGERROR = 33;
pub const GL_ID_TOOMANYSTROKE = 34;
pub const GL_ID_READINGCONFLICT = 35;
pub const GL_ID_INPUTREADING = 36;
pub const GL_ID_INPUTRADICAL = 37;
pub const GL_ID_INPUTCODE = 38;
pub const GL_ID_INPUTSYMBOL = 39;
pub const GL_ID_CHOOSECANDIDATE = 40;
pub const GL_ID_REVERSECONVERSION = 41;
pub const GL_ID_PRIVATE_FIRST = 32768;
pub const GL_ID_PRIVATE_LAST = 65535;
pub const ATTR_INPUT = 0;
pub const ATTR_TARGET_CONVERTED = 1;
pub const ATTR_CONVERTED = 2;
pub const ATTR_TARGET_NOTCONVERTED = 3;
pub const ATTR_INPUT_ERROR = 4;
pub const ATTR_FIXEDCONVERTED = 5;
pub const CFS_DEFAULT = 0;
pub const CFS_RECT = 1;
pub const CFS_POINT = 2;
pub const CFS_FORCE_POSITION = 32;
pub const CFS_CANDIDATEPOS = 64;
pub const CFS_EXCLUDE = 128;
pub const IME_CAND_UNKNOWN = 0;
pub const IME_CAND_READ = 1;
pub const IME_CAND_CODE = 2;
pub const IME_CAND_MEANING = 3;
pub const IME_CAND_RADICAL = 4;
pub const IME_CAND_STROKE = 5;
pub const IMN_CLOSESTATUSWINDOW = 1;
pub const IMN_OPENSTATUSWINDOW = 2;
pub const IMN_CHANGECANDIDATE = 3;
pub const IMN_CLOSECANDIDATE = 4;
pub const IMN_OPENCANDIDATE = 5;
pub const IMN_SETCONVERSIONMODE = 6;
pub const IMN_SETSENTENCEMODE = 7;
pub const IMN_SETOPENSTATUS = 8;
pub const IMN_SETCANDIDATEPOS = 9;
pub const IMN_SETCOMPOSITIONFONT = 10;
pub const IMN_SETCOMPOSITIONWINDOW = 11;
pub const IMN_SETSTATUSWINDOWPOS = 12;
pub const IMN_GUIDELINE = 13;
pub const IMN_PRIVATE = 14;
pub const IMR_COMPOSITIONWINDOW = 1;
pub const IMR_CANDIDATEWINDOW = 2;
pub const IMR_COMPOSITIONFONT = 3;
pub const IMR_RECONVERTSTRING = 4;
pub const IMR_CONFIRMRECONVERTSTRING = 5;
pub const IMR_QUERYCHARPOSITION = 6;
pub const IMR_DOCUMENTFEED = 7;
pub const IMM_ERROR_NODATA = -1;
pub const IMM_ERROR_GENERAL = -2;
pub const IME_CONFIG_GENERAL = 1;
pub const IME_CONFIG_REGISTERWORD = 2;
pub const IME_CONFIG_SELECTDICTIONARY = 3;
pub const IME_REGWORD_STYLE_EUDC = 1;
pub const IME_REGWORD_STYLE_USER_FIRST = 2147483648;
pub const IME_REGWORD_STYLE_USER_LAST = 4294967295;
pub const IACE_CHILDREN = 1;
pub const IACE_DEFAULT = 16;
pub const IACE_IGNORENOCONTEXT = 32;
pub const IGIMIF_RIGHTMENU = 1;
pub const IGIMII_CMODE = 1;
pub const IGIMII_SMODE = 2;
pub const IGIMII_CONFIGURE = 4;
pub const IGIMII_TOOLS = 8;
pub const IGIMII_HELP = 16;
pub const IGIMII_OTHER = 32;
pub const IGIMII_INPUTTOOLS = 64;
pub const IMFT_RADIOCHECK = 1;
pub const IMFT_SEPARATOR = 2;
pub const IMFT_SUBMENU = 4;
pub const SOFTKEYBOARD_TYPE_T1 = 1;
pub const SOFTKEYBOARD_TYPE_C1 = 2;
pub const IMMGWL_IMC = 0;
pub const IMMGWLP_IMC = 0;
pub const IMC_SETCONVERSIONMODE = 2;
pub const IMC_SETSENTENCEMODE = 4;
pub const IMC_SETOPENSTATUS = 6;
pub const IMC_GETSOFTKBDFONT = 17;
pub const IMC_SETSOFTKBDFONT = 18;
pub const IMC_GETSOFTKBDPOS = 19;
pub const IMC_SETSOFTKBDPOS = 20;
pub const IMC_GETSOFTKBDSUBTYPE = 21;
pub const IMC_SETSOFTKBDSUBTYPE = 22;
pub const IMC_SETSOFTKBDDATA = 24;
pub const NI_CONTEXTUPDATED = 3;
pub const IME_SYSINFO_WINLOGON = 1;
pub const INIT_STATUSWNDPOS = 1;
pub const INIT_CONVERSION = 2;
pub const INIT_SENTENCE = 4;
pub const INIT_LOGFONT = 8;
pub const INIT_COMPFORM = 16;
pub const INIT_SOFTKBDPOS = 32;
pub const IME_PROP_END_UNLOAD = 1;
pub const IME_PROP_KBD_CHAR_FIRST = 2;
pub const IME_PROP_IGNORE_UPKEYS = 4;
pub const IME_PROP_NEED_ALTKEY = 8;
pub const IME_PROP_NO_KEYS_ON_CLOSE = 16;
pub const IME_PROP_ACCEPT_WIDE_VKEY = 32;
pub const UI_CAP_SOFTKBD = 65536;
pub const IMN_SOFTKBDDESTROYED = 17;
pub const IME_UI_CLASS_NAME_SIZE = 16;
pub const IME_ESC_STRING_BUFFER_SIZE = 80;
pub const IFEC_S_ALREADY_DEFAULT = 291840;
pub const FELANG_REQ_CONV = 65536;
pub const FELANG_REQ_RECONV = 131072;
pub const FELANG_REQ_REV = 196608;
pub const FELANG_CMODE_MONORUBY = 2;
pub const FELANG_CMODE_NOPRUNING = 4;
pub const FELANG_CMODE_KATAKANAOUT = 8;
pub const FELANG_CMODE_HIRAGANAOUT = 0;
pub const FELANG_CMODE_HALFWIDTHOUT = 16;
pub const FELANG_CMODE_FULLWIDTHOUT = 32;
pub const FELANG_CMODE_BOPOMOFO = 64;
pub const FELANG_CMODE_HANGUL = 128;
pub const FELANG_CMODE_PINYIN = 256;
pub const FELANG_CMODE_PRECONV = 512;
pub const FELANG_CMODE_RADICAL = 1024;
pub const FELANG_CMODE_UNKNOWNREADING = 2048;
pub const FELANG_CMODE_MERGECAND = 4096;
pub const FELANG_CMODE_ROMAN = 8192;
pub const FELANG_CMODE_BESTFIRST = 16384;
pub const FELANG_CMODE_USENOREVWORDS = 32768;
pub const FELANG_CMODE_NONE = 16777216;
pub const FELANG_CMODE_PLAURALCLAUSE = 33554432;
pub const FELANG_CMODE_SINGLECONVERT = 67108864;
pub const FELANG_CMODE_AUTOMATIC = 134217728;
pub const FELANG_CMODE_PHRASEPREDICT = 268435456;
pub const FELANG_CMODE_CONVERSATION = 536870912;
pub const FELANG_CMODE_NAME = 268435456;
pub const FELANG_CMODE_NOINVISIBLECHAR = 1073741824;
pub const E_NOCAND = 48;
pub const E_NOTENOUGH_BUFFER = 49;
pub const E_NOTENOUGH_WDD = 50;
pub const E_LARGEINPUT = 51;
pub const FELANG_CLMN_WBREAK = 1;
pub const FELANG_CLMN_NOWBREAK = 2;
pub const FELANG_CLMN_PBREAK = 4;
pub const FELANG_CLMN_NOPBREAK = 8;
pub const FELANG_CLMN_FIXR = 16;
pub const FELANG_CLMN_FIXD = 32;
pub const FELANG_INVALD_PO = 65535;
pub const IFED_POS_NONE = 0;
pub const IFED_POS_NOUN = 1;
pub const IFED_POS_VERB = 2;
pub const IFED_POS_ADJECTIVE = 4;
pub const IFED_POS_ADJECTIVE_VERB = 8;
pub const IFED_POS_ADVERB = 16;
pub const IFED_POS_ADNOUN = 32;
pub const IFED_POS_CONJUNCTION = 64;
pub const IFED_POS_INTERJECTION = 128;
pub const IFED_POS_INDEPENDENT = 255;
pub const IFED_POS_INFLECTIONALSUFFIX = 256;
pub const IFED_POS_PREFIX = 512;
pub const IFED_POS_SUFFIX = 1024;
pub const IFED_POS_AFFIX = 1536;
pub const IFED_POS_TANKANJI = 2048;
pub const IFED_POS_IDIOMS = 4096;
pub const IFED_POS_SYMBOLS = 8192;
pub const IFED_POS_PARTICLE = 16384;
pub const IFED_POS_AUXILIARY_VERB = 32768;
pub const IFED_POS_SUB_VERB = 65536;
pub const IFED_POS_DEPENDENT = 114688;
pub const IFED_POS_ALL = 131071;
pub const IFED_SELECT_NONE = 0;
pub const IFED_SELECT_READING = 1;
pub const IFED_SELECT_DISPLAY = 2;
pub const IFED_SELECT_POS = 4;
pub const IFED_SELECT_COMMENT = 8;
pub const IFED_SELECT_ALL = 15;
pub const IFED_REG_NONE = 0;
pub const IFED_REG_USER = 1;
pub const IFED_REG_AUTO = 2;
pub const IFED_REG_GRAMMAR = 4;
pub const IFED_REG_ALL = 7;
pub const IFED_TYPE_NONE = 0;
pub const IFED_TYPE_GENERAL = 1;
pub const IFED_TYPE_NAMEPLACE = 2;
pub const IFED_TYPE_SPEECH = 4;
pub const IFED_TYPE_REVERSE = 8;
pub const IFED_TYPE_ENGLISH = 16;
pub const IFED_TYPE_ALL = 31;
pub const IFED_S_MORE_ENTRIES = 291328;
pub const IFED_S_EMPTY_DICTIONARY = 291329;
pub const IFED_S_WORD_EXISTS = 291330;
pub const IFED_S_COMMENT_CHANGED = 291331;
pub const IFED_E_NOT_FOUND = -2147192064;
pub const IFED_E_INVALID_FORMAT = -2147192063;
pub const IFED_E_OPEN_FAILED = -2147192062;
pub const IFED_E_WRITE_FAILED = -2147192061;
pub const IFED_E_NO_ENTRY = -2147192060;
pub const IFED_E_REGISTER_FAILED = -2147192059;
pub const IFED_E_NOT_USER_DIC = -2147192058;
pub const IFED_E_NOT_SUPPORTED = -2147192057;
pub const IFED_E_USER_COMMENT = -2147192056;
pub const IFED_E_REGISTER_ILLEGAL_POS = -2147192055;
pub const IFED_E_REGISTER_IMPROPER_WORD = -2147192054;
pub const IFED_E_REGISTER_DISCONNECTED = -2147192053;
pub const cbCommentMax = 256;
pub const wchPrivate1 = 57344;
pub const POS_UNDEFINED = 0;
pub const JPOS_UNDEFINED = 0;
pub const JPOS_MEISHI_FUTSU = 100;
pub const JPOS_MEISHI_SAHEN = 101;
pub const JPOS_MEISHI_ZAHEN = 102;
pub const JPOS_MEISHI_KEIYOUDOUSHI = 103;
pub const JPOS_HUKUSIMEISHI = 104;
pub const JPOS_MEISA_KEIDOU = 105;
pub const JPOS_JINMEI = 106;
pub const JPOS_JINMEI_SEI = 107;
pub const JPOS_JINMEI_MEI = 108;
pub const JPOS_CHIMEI = 109;
pub const JPOS_CHIMEI_KUNI = 110;
pub const JPOS_CHIMEI_KEN = 111;
pub const JPOS_CHIMEI_GUN = 112;
pub const JPOS_CHIMEI_KU = 113;
pub const JPOS_CHIMEI_SHI = 114;
pub const JPOS_CHIMEI_MACHI = 115;
pub const JPOS_CHIMEI_MURA = 116;
pub const JPOS_CHIMEI_EKI = 117;
pub const JPOS_SONOTA = 118;
pub const JPOS_SHAMEI = 119;
pub const JPOS_SOSHIKI = 120;
pub const JPOS_KENCHIKU = 121;
pub const JPOS_BUPPIN = 122;
pub const JPOS_DAIMEISHI = 123;
pub const JPOS_DAIMEISHI_NINSHOU = 124;
pub const JPOS_DAIMEISHI_SHIJI = 125;
pub const JPOS_KAZU = 126;
pub const JPOS_KAZU_SURYOU = 127;
pub const JPOS_KAZU_SUSHI = 128;
pub const JPOS_5DAN_AWA = 200;
pub const JPOS_5DAN_KA = 201;
pub const JPOS_5DAN_GA = 202;
pub const JPOS_5DAN_SA = 203;
pub const JPOS_5DAN_TA = 204;
pub const JPOS_5DAN_NA = 205;
pub const JPOS_5DAN_BA = 206;
pub const JPOS_5DAN_MA = 207;
pub const JPOS_5DAN_RA = 208;
pub const JPOS_5DAN_AWAUON = 209;
pub const JPOS_5DAN_KASOKUON = 210;
pub const JPOS_5DAN_RAHEN = 211;
pub const JPOS_4DAN_HA = 212;
pub const JPOS_1DAN = 213;
pub const JPOS_TOKUSHU_KAHEN = 214;
pub const JPOS_TOKUSHU_SAHENSURU = 215;
pub const JPOS_TOKUSHU_SAHEN = 216;
pub const JPOS_TOKUSHU_ZAHEN = 217;
pub const JPOS_TOKUSHU_NAHEN = 218;
pub const JPOS_KURU_KI = 219;
pub const JPOS_KURU_KITA = 220;
pub const JPOS_KURU_KITARA = 221;
pub const JPOS_KURU_KITARI = 222;
pub const JPOS_KURU_KITAROU = 223;
pub const JPOS_KURU_KITE = 224;
pub const JPOS_KURU_KUREBA = 225;
pub const JPOS_KURU_KO = 226;
pub const JPOS_KURU_KOI = 227;
pub const JPOS_KURU_KOYOU = 228;
pub const JPOS_SURU_SA = 229;
pub const JPOS_SURU_SI = 230;
pub const JPOS_SURU_SITA = 231;
pub const JPOS_SURU_SITARA = 232;
pub const JPOS_SURU_SIATRI = 233;
pub const JPOS_SURU_SITAROU = 234;
pub const JPOS_SURU_SITE = 235;
pub const JPOS_SURU_SIYOU = 236;
pub const JPOS_SURU_SUREBA = 237;
pub const JPOS_SURU_SE = 238;
pub const JPOS_SURU_SEYO = 239;
pub const JPOS_KEIYOU = 300;
pub const JPOS_KEIYOU_GARU = 301;
pub const JPOS_KEIYOU_GE = 302;
pub const JPOS_KEIYOU_ME = 303;
pub const JPOS_KEIYOU_YUU = 304;
pub const JPOS_KEIYOU_U = 305;
pub const JPOS_KEIDOU = 400;
pub const JPOS_KEIDOU_NO = 401;
pub const JPOS_KEIDOU_TARU = 402;
pub const JPOS_KEIDOU_GARU = 403;
pub const JPOS_FUKUSHI = 500;
pub const JPOS_FUKUSHI_SAHEN = 501;
pub const JPOS_FUKUSHI_NI = 502;
pub const JPOS_FUKUSHI_NANO = 503;
pub const JPOS_FUKUSHI_DA = 504;
pub const JPOS_FUKUSHI_TO = 505;
pub const JPOS_FUKUSHI_TOSURU = 506;
pub const JPOS_RENTAISHI = 600;
pub const JPOS_RENTAISHI_SHIJI = 601;
pub const JPOS_SETSUZOKUSHI = 650;
pub const JPOS_KANDOUSHI = 670;
pub const JPOS_SETTOU = 700;
pub const JPOS_SETTOU_KAKU = 701;
pub const JPOS_SETTOU_SAI = 702;
pub const JPOS_SETTOU_FUKU = 703;
pub const JPOS_SETTOU_MI = 704;
pub const JPOS_SETTOU_DAISHOU = 705;
pub const JPOS_SETTOU_KOUTEI = 706;
pub const JPOS_SETTOU_CHOUTAN = 707;
pub const JPOS_SETTOU_SHINKYU = 708;
pub const JPOS_SETTOU_JINMEI = 709;
pub const JPOS_SETTOU_CHIMEI = 710;
pub const JPOS_SETTOU_SONOTA = 711;
pub const JPOS_SETTOU_JOSUSHI = 712;
pub const JPOS_SETTOU_TEINEI_O = 713;
pub const JPOS_SETTOU_TEINEI_GO = 714;
pub const JPOS_SETTOU_TEINEI_ON = 715;
pub const JPOS_SETSUBI = 800;
pub const JPOS_SETSUBI_TEKI = 801;
pub const JPOS_SETSUBI_SEI = 802;
pub const JPOS_SETSUBI_KA = 803;
pub const JPOS_SETSUBI_CHU = 804;
pub const JPOS_SETSUBI_FU = 805;
pub const JPOS_SETSUBI_RYU = 806;
pub const JPOS_SETSUBI_YOU = 807;
pub const JPOS_SETSUBI_KATA = 808;
pub const JPOS_SETSUBI_MEISHIRENDAKU = 809;
pub const JPOS_SETSUBI_JINMEI = 810;
pub const JPOS_SETSUBI_CHIMEI = 811;
pub const JPOS_SETSUBI_KUNI = 812;
pub const JPOS_SETSUBI_KEN = 813;
pub const JPOS_SETSUBI_GUN = 814;
pub const JPOS_SETSUBI_KU = 815;
pub const JPOS_SETSUBI_SHI = 816;
pub const JPOS_SETSUBI_MACHI = 817;
pub const JPOS_SETSUBI_CHOU = 818;
pub const JPOS_SETSUBI_MURA = 819;
pub const JPOS_SETSUBI_SON = 820;
pub const JPOS_SETSUBI_EKI = 821;
pub const JPOS_SETSUBI_SONOTA = 822;
pub const JPOS_SETSUBI_SHAMEI = 823;
pub const JPOS_SETSUBI_SOSHIKI = 824;
pub const JPOS_SETSUBI_KENCHIKU = 825;
pub const JPOS_RENYOU_SETSUBI = 826;
pub const JPOS_SETSUBI_JOSUSHI = 827;
pub const JPOS_SETSUBI_JOSUSHIPLUS = 828;
pub const JPOS_SETSUBI_JIKAN = 829;
pub const JPOS_SETSUBI_JIKANPLUS = 830;
pub const JPOS_SETSUBI_TEINEI = 831;
pub const JPOS_SETSUBI_SAN = 832;
pub const JPOS_SETSUBI_KUN = 833;
pub const JPOS_SETSUBI_SAMA = 834;
pub const JPOS_SETSUBI_DONO = 835;
pub const JPOS_SETSUBI_FUKUSU = 836;
pub const JPOS_SETSUBI_TACHI = 837;
pub const JPOS_SETSUBI_RA = 838;
pub const JPOS_TANKANJI = 900;
pub const JPOS_TANKANJI_KAO = 901;
pub const JPOS_KANYOUKU = 902;
pub const JPOS_DOKURITSUGO = 903;
pub const JPOS_FUTEIGO = 904;
pub const JPOS_KIGOU = 905;
pub const JPOS_EIJI = 906;
pub const JPOS_KUTEN = 907;
pub const JPOS_TOUTEN = 908;
pub const JPOS_KANJI = 909;
pub const JPOS_OPENBRACE = 910;
pub const JPOS_CLOSEBRACE = 911;
pub const JPOS_YOKUSEI = 912;
pub const JPOS_TANSHUKU = 913;
pub const VERSION_ID_JAPANESE = 16777216;
pub const VERSION_ID_KOREAN = 33554432;
pub const VERSION_ID_CHINESE_TRADITIONAL = 67108864;
pub const VERSION_ID_CHINESE_SIMPLIFIED = 134217728;
pub const FID_MSIME_VERSION = 0;
pub const VERSION_MOUSE_OPERATION = 1;
pub const IMEMOUSERET_NOTHANDLED = -1;
pub const IMEMOUSE_VERSION = 255;
pub const IMEMOUSE_NONE = 0;
pub const IMEMOUSE_LDOWN = 1;
pub const IMEMOUSE_RDOWN = 2;
pub const IMEMOUSE_MDOWN = 4;
pub const IMEMOUSE_WUP = 16;
pub const IMEMOUSE_WDOWN = 32;
pub const FID_RECONVERT_VERSION = 268435456;
pub const VERSION_RECONVERSION = 1;
pub const VERSION_DOCUMENTFEED = 1;
pub const VERSION_QUERYPOSITION = 1;
pub const VERSION_MODEBIAS = 1;
pub const MODEBIAS_GETVERSION = 0;
pub const MODEBIAS_SETVALUE = 1;
pub const MODEBIAS_GETVALUE = 2;
pub const MODEBIASMODE_DEFAULT = 0;
pub const MODEBIASMODE_FILENAME = 1;
pub const MODEBIASMODE_READING = 2;
pub const MODEBIASMODE_DIGIT = 4;
pub const SHOWIMEPAD_DEFAULT = 0;
pub const SHOWIMEPAD_CATEGORY = 1;
pub const SHOWIMEPAD_GUID = 2;
pub const FID_MSIME_KMS_VERSION = 1;
pub const FID_MSIME_KMS_INIT = 2;
pub const FID_MSIME_KMS_TERM = 3;
pub const FID_MSIME_KMS_DEL_KEYLIST = 4;
pub const FID_MSIME_KMS_NOTIFY = 5;
pub const FID_MSIME_KMS_GETMAP = 6;
pub const FID_MSIME_KMS_INVOKE = 7;
pub const FID_MSIME_KMS_SETMAP = 8;
pub const FID_MSIME_KMS_FUNCDESC = 9;
pub const FID_MSIME_KMS_GETMAPSEAMLESS = 10;
pub const FID_MSIME_KMS_GETMAPFAST = 11;
pub const IMEKMS_NOCOMPOSITION = 0;
pub const IMEKMS_COMPOSITION = 1;
pub const IMEKMS_SELECTION = 2;
pub const IMEKMS_IMEOFF = 3;
pub const IMEKMS_2NDLEVEL = 4;
pub const IMEKMS_INPTGL = 5;
pub const IMEKMS_CANDIDATE = 6;
pub const IMEKMS_TYPECAND = 7;
pub const RECONVOPT_NONE = 0;
pub const RECONVOPT_USECANCELNOTIFY = 1;
pub const GCSEX_CANCELRECONVERT = 268435456;
pub const IFED_REG_HEAD = 0;
pub const IFED_REG_TAIL = 1;
pub const IFED_REG_DEL = 2;
pub const IFED_UNKNOWN = 0;
pub const IFED_MSIME2_BIN_SYSTEM = 1;
pub const IFED_MSIME2_BIN_USER = 2;
pub const IFED_MSIME2_TEXT_USER = 3;
pub const IFED_MSIME95_BIN_SYSTEM = 4;
pub const IFED_MSIME95_BIN_USER = 5;
pub const IFED_MSIME95_TEXT_USER = 6;
pub const IFED_MSIME97_BIN_SYSTEM = 7;
pub const IFED_MSIME97_BIN_USER = 8;
pub const IFED_MSIME97_TEXT_USER = 9;
pub const IFED_MSIME98_BIN_SYSTEM = 10;
pub const IFED_MSIME98_BIN_USER = 11;
pub const IFED_MSIME98_TEXT_USER = 12;
pub const IFED_ACTIVE_DICT = 13;
pub const IFED_ATOK9 = 14;
pub const IFED_ATOK10 = 15;
pub const IFED_NEC_AI_ = 16;
pub const IFED_WX_II = 17;
pub const IFED_WX_III = 18;
pub const IFED_VJE_20 = 19;
pub const IFED_MSIME98_SYSTEM_CE = 20;
pub const IFED_MSIME_BIN_SYSTEM = 21;
pub const IFED_MSIME_BIN_USER = 22;
pub const IFED_MSIME_TEXT_USER = 23;
pub const IFED_PIME2_BIN_USER = 24;
pub const IFED_PIME2_BIN_SYSTEM = 25;
pub const IFED_PIME2_BIN_STANDARD_SYSTEM = 26;
pub const IFED_UCT_NONE = 0;
pub const IFED_UCT_STRING_SJIS = 1;
pub const IFED_UCT_STRING_UNICODE = 2;
pub const IFED_UCT_USER_DEFINED = 3;
pub const IFED_UCT_MAX = 4;
pub const IFED_REL_NONE = 0;
pub const IFED_REL_NO = 1;
pub const IFED_REL_GA = 2;
pub const IFED_REL_WO = 3;
pub const IFED_REL_NI = 4;
pub const IFED_REL_DE = 5;
pub const IFED_REL_YORI = 6;
pub const IFED_REL_KARA = 7;
pub const IFED_REL_MADE = 8;
pub const IFED_REL_HE = 9;
pub const IFED_REL_TO = 10;
pub const IFED_REL_IDEOM = 11;
pub const IFED_REL_FUKU_YOUGEN = 12;
pub const IFED_REL_KEIYOU_YOUGEN = 13;
pub const IFED_REL_KEIDOU1_YOUGEN = 14;
pub const IFED_REL_KEIDOU2_YOUGEN = 15;
pub const IFED_REL_TAIGEN = 16;
pub const IFED_REL_YOUGEN = 17;
pub const IFED_REL_RENTAI_MEI = 18;
pub const IFED_REL_RENSOU = 19;
pub const IFED_REL_KEIYOU_TO_YOUGEN = 20;
pub const IFED_REL_KEIYOU_TARU_YOUGEN = 21;
pub const IFED_REL_UNKNOWN1 = 22;
pub const IFED_REL_UNKNOWN2 = 23;
pub const IFED_REL_ALL = 24;

pub const aliases = struct {
    pub const SET_COMPOSITION_STRING_TYPE = u32;
    pub const GET_GUIDE_LINE_TYPE = u32;
    pub const NOTIFY_IME_INDEX = u32;
    pub const NOTIFY_IME_ACTION = u32;
    pub const GET_CONVERSION_LIST_FLAG = u32;
    pub const IME_PAD_REQUEST_FLAGS = u32;
    pub const IME_CONVERSION_MODE = u32;
    pub const IME_SENTENCE_MODE = u32;
    pub const IME_COMPOSITION_STRING = u32;
    pub const IME_ESCAPE = u32;
    pub const IME_HOTKEY_IDENTIFIER = u32;
    pub const IMEREG = i32;
    pub const IMEFMT = i32;
    pub const IMEUCT = i32;
    pub const IMEREL = i32;
    pub const HIMC = ?*anyopaque;
    pub const HIMCC = ?*anyopaque;
    pub const IMCENUMPROC = ?*const anyopaque;
    pub const REGISTERWORDENUMPROCA = ?*const anyopaque;
    pub const REGISTERWORDENUMPROCW = ?*const anyopaque;
    pub const PFNLOG = ?*const anyopaque;
    pub const fpCreateIFECommonInstanceType = ?*const anyopaque;
    pub const fpCreateIFELanguageInstanceType = ?*const anyopaque;
    pub const fpCreateIFEDictionaryInstanceType = ?*const anyopaque;
};
