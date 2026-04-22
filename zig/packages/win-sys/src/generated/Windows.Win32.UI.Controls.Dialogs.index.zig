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
    .{ "GetOpenFileNameA", MethodRecord{ .library = "COMDLG32", .import = "GetOpenFileNameA", .signature = "\x00\x01\x11\x59\x0f\x11\x97\x19" } },
    .{ "GetOpenFileNameW", MethodRecord{ .library = "COMDLG32", .import = "GetOpenFileNameW", .signature = "\x00\x01\x11\x59\x0f\x11\x97\x1d" } },
    .{ "GetSaveFileNameA", MethodRecord{ .library = "COMDLG32", .import = "GetSaveFileNameA", .signature = "\x00\x01\x11\x59\x0f\x11\x97\x19" } },
    .{ "GetSaveFileNameW", MethodRecord{ .library = "COMDLG32", .import = "GetSaveFileNameW", .signature = "\x00\x01\x11\x59\x0f\x11\x97\x1d" } },
    .{ "GetFileTitleA", MethodRecord{ .library = "COMDLG32", .import = "GetFileTitleA", .signature = "\x00\x03\x06\x11\x3d\x11\x3d\x07" } },
    .{ "GetFileTitleW", MethodRecord{ .library = "COMDLG32", .import = "GetFileTitleW", .signature = "\x00\x03\x06\x11\x05\x11\x05\x07" } },
    .{ "ChooseColorA", MethodRecord{ .library = "COMDLG32", .import = "ChooseColorA", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x46\xf9" } },
    .{ "ChooseColorW", MethodRecord{ .library = "COMDLG32", .import = "ChooseColorW", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x46\xfd" } },
    .{ "FindTextA", MethodRecord{ .library = "COMDLG32", .import = "FindTextA", .signature = "\x00\x01\x11\x25\x0f\x11\xc0\x00\x47\x01" } },
    .{ "FindTextW", MethodRecord{ .library = "COMDLG32", .import = "FindTextW", .signature = "\x00\x01\x11\x25\x0f\x11\xc0\x00\x47\x05" } },
    .{ "ReplaceTextA", MethodRecord{ .library = "COMDLG32", .import = "ReplaceTextA", .signature = "\x00\x01\x11\x25\x0f\x11\xc0\x00\x47\x01" } },
    .{ "ReplaceTextW", MethodRecord{ .library = "COMDLG32", .import = "ReplaceTextW", .signature = "\x00\x01\x11\x25\x0f\x11\xc0\x00\x47\x05" } },
    .{ "ChooseFontA", MethodRecord{ .library = "COMDLG32", .import = "ChooseFontA", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x47\x09" } },
    .{ "ChooseFontW", MethodRecord{ .library = "COMDLG32", .import = "ChooseFontW", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x47\x0d" } },
    .{ "PrintDlgA", MethodRecord{ .library = "COMDLG32", .import = "PrintDlgA", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x47\x11" } },
    .{ "PrintDlgW", MethodRecord{ .library = "COMDLG32", .import = "PrintDlgW", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x47\x15" } },
    .{ "PrintDlgExA", MethodRecord{ .library = "COMDLG32", .import = "PrintDlgExA", .signature = "\x00\x01\x11\x79\x0f\x11\xc0\x00\x47\x19" } },
    .{ "PrintDlgExW", MethodRecord{ .library = "COMDLG32", .import = "PrintDlgExW", .signature = "\x00\x01\x11\x79\x0f\x11\xc0\x00\x47\x1d" } },
    .{ "CommDlgExtendedError", MethodRecord{ .library = "COMDLG32", .import = "CommDlgExtendedError", .signature = "\x00\x00\x11\xa4\xe5" } },
    .{ "PageSetupDlgA", MethodRecord{ .library = "COMDLG32", .import = "PageSetupDlgA", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x47\x21" } },
    .{ "PageSetupDlgW", MethodRecord{ .library = "COMDLG32", .import = "PageSetupDlgW", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x47\x25" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x1719 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "OPENFILENAMEA" },
        0x171d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "OPENFILENAMEW" },
        0x24e5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "COMMON_DLG_ERRORS" },
        0x46f9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "CHOOSECOLORA" },
        0x46fd => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "CHOOSECOLORW" },
        0x4701 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "FINDREPLACEA" },
        0x4705 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "FINDREPLACEW" },
        0x4709 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "CHOOSEFONTA" },
        0x470d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "CHOOSEFONTW" },
        0x4711 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "PRINTDLGA" },
        0x4715 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "PRINTDLGW" },
        0x4719 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "PRINTDLGEXA" },
        0x471d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "PRINTDLGEXW" },
        0x4721 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "PAGESETUPDLGA" },
        0x4725 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls.Dialogs", .name = "PAGESETUPDLGW" },
        else => null,
    };
}

pub const CDERR_DIALOGFAILURE = 65535;
pub const CDERR_GENERALCODES = 0;
pub const CDERR_STRUCTSIZE = 1;
pub const CDERR_INITIALIZATION = 2;
pub const CDERR_NOTEMPLATE = 3;
pub const CDERR_NOHINSTANCE = 4;
pub const CDERR_LOADSTRFAILURE = 5;
pub const CDERR_FINDRESFAILURE = 6;
pub const CDERR_LOADRESFAILURE = 7;
pub const CDERR_LOCKRESFAILURE = 8;
pub const CDERR_MEMALLOCFAILURE = 9;
pub const CDERR_MEMLOCKFAILURE = 10;
pub const CDERR_NOHOOK = 11;
pub const CDERR_REGISTERMSGFAIL = 12;
pub const PDERR_PRINTERCODES = 4096;
pub const PDERR_SETUPFAILURE = 4097;
pub const PDERR_PARSEFAILURE = 4098;
pub const PDERR_RETDEFFAILURE = 4099;
pub const PDERR_LOADDRVFAILURE = 4100;
pub const PDERR_GETDEVMODEFAIL = 4101;
pub const PDERR_INITFAILURE = 4102;
pub const PDERR_NODEVICES = 4103;
pub const PDERR_NODEFAULTPRN = 4104;
pub const PDERR_DNDMMISMATCH = 4105;
pub const PDERR_CREATEICFAILURE = 4106;
pub const PDERR_PRINTERNOTFOUND = 4107;
pub const PDERR_DEFAULTDIFFERENT = 4108;
pub const CFERR_CHOOSEFONTCODES = 8192;
pub const CFERR_NOFONTS = 8193;
pub const CFERR_MAXLESSTHANMIN = 8194;
pub const FNERR_FILENAMECODES = 12288;
pub const FNERR_SUBCLASSFAILURE = 12289;
pub const FNERR_INVALIDFILENAME = 12290;
pub const FNERR_BUFFERTOOSMALL = 12291;
pub const FRERR_FINDREPLACECODES = 16384;
pub const FRERR_BUFFERLENGTHZERO = 16385;
pub const CCERR_CHOOSECOLORCODES = 20480;
pub const CC_RGBINIT = 1;
pub const CC_FULLOPEN = 2;
pub const CC_PREVENTFULLOPEN = 4;
pub const CC_SHOWHELP = 8;
pub const CC_ENABLEHOOK = 16;
pub const CC_ENABLETEMPLATE = 32;
pub const CC_ENABLETEMPLATEHANDLE = 64;
pub const CC_SOLIDCOLOR = 128;
pub const CC_ANYCOLOR = 256;
pub const OFN_READONLY = 1;
pub const OFN_OVERWRITEPROMPT = 2;
pub const OFN_HIDEREADONLY = 4;
pub const OFN_NOCHANGEDIR = 8;
pub const OFN_SHOWHELP = 16;
pub const OFN_ENABLEHOOK = 32;
pub const OFN_ENABLETEMPLATE = 64;
pub const OFN_ENABLETEMPLATEHANDLE = 128;
pub const OFN_NOVALIDATE = 256;
pub const OFN_ALLOWMULTISELECT = 512;
pub const OFN_EXTENSIONDIFFERENT = 1024;
pub const OFN_PATHMUSTEXIST = 2048;
pub const OFN_FILEMUSTEXIST = 4096;
pub const OFN_CREATEPROMPT = 8192;
pub const OFN_SHAREAWARE = 16384;
pub const OFN_NOREADONLYRETURN = 32768;
pub const OFN_NOTESTFILECREATE = 65536;
pub const OFN_NONETWORKBUTTON = 131072;
pub const OFN_NOLONGNAMES = 262144;
pub const OFN_EXPLORER = 524288;
pub const OFN_NODEREFERENCELINKS = 1048576;
pub const OFN_LONGNAMES = 2097152;
pub const OFN_ENABLEINCLUDENOTIFY = 4194304;
pub const OFN_ENABLESIZING = 8388608;
pub const OFN_DONTADDTORECENT = 33554432;
pub const OFN_FORCESHOWHIDDEN = 268435456;
pub const OFN_EX_NONE = 0;
pub const OFN_EX_NOPLACESBAR = 1;
pub const PSD_DEFAULTMINMARGINS = 0;
pub const PSD_DISABLEMARGINS = 16;
pub const PSD_DISABLEORIENTATION = 256;
pub const PSD_DISABLEPAGEPAINTING = 524288;
pub const PSD_DISABLEPAPER = 512;
pub const PSD_DISABLEPRINTER = 32;
pub const PSD_ENABLEPAGEPAINTHOOK = 262144;
pub const PSD_ENABLEPAGESETUPHOOK = 8192;
pub const PSD_ENABLEPAGESETUPTEMPLATE = 32768;
pub const PSD_ENABLEPAGESETUPTEMPLATEHANDLE = 131072;
pub const PSD_INHUNDREDTHSOFMILLIMETERS = 8;
pub const PSD_INTHOUSANDTHSOFINCHES = 4;
pub const PSD_INWININIINTLMEASURE = 0;
pub const PSD_MARGINS = 2;
pub const PSD_MINMARGINS = 1;
pub const PSD_NONETWORKBUTTON = 2097152;
pub const PSD_NOWARNING = 128;
pub const PSD_RETURNDEFAULT = 1024;
pub const PSD_SHOWHELP = 2048;
pub const CF_APPLY = 512;
pub const CF_ANSIONLY = 1024;
pub const CF_BOTH = 3;
pub const CF_EFFECTS = 256;
pub const CF_ENABLEHOOK = 8;
pub const CF_ENABLETEMPLATE = 16;
pub const CF_ENABLETEMPLATEHANDLE = 32;
pub const CF_FIXEDPITCHONLY = 16384;
pub const CF_FORCEFONTEXIST = 65536;
pub const CF_INACTIVEFONTS = 33554432;
pub const CF_INITTOLOGFONTSTRUCT = 64;
pub const CF_LIMITSIZE = 8192;
pub const CF_NOOEMFONTS = 2048;
pub const CF_NOFACESEL = 524288;
pub const CF_NOSCRIPTSEL = 8388608;
pub const CF_NOSIMULATIONS = 4096;
pub const CF_NOSIZESEL = 2097152;
pub const CF_NOSTYLESEL = 1048576;
pub const CF_NOVECTORFONTS = 2048;
pub const CF_NOVERTFONTS = 16777216;
pub const CF_PRINTERFONTS = 2;
pub const CF_SCALABLEONLY = 131072;
pub const CF_SCREENFONTS = 1;
pub const CF_SCRIPTSONLY = 1024;
pub const CF_SELECTSCRIPT = 4194304;
pub const CF_SHOWHELP = 4;
pub const CF_TTONLY = 262144;
pub const CF_USESTYLE = 128;
pub const CF_WYSIWYG = 32768;
pub const FR_DOWN = 1;
pub const FR_WHOLEWORD = 2;
pub const FR_MATCHCASE = 4;
pub const FR_FINDNEXT = 8;
pub const FR_REPLACE = 16;
pub const FR_REPLACEALL = 32;
pub const FR_DIALOGTERM = 64;
pub const FR_SHOWHELP = 128;
pub const FR_ENABLEHOOK = 256;
pub const FR_ENABLETEMPLATE = 512;
pub const FR_NOUPDOWN = 1024;
pub const FR_NOMATCHCASE = 2048;
pub const FR_NOWHOLEWORD = 4096;
pub const FR_ENABLETEMPLATEHANDLE = 8192;
pub const FR_HIDEUPDOWN = 16384;
pub const FR_HIDEMATCHCASE = 32768;
pub const FR_HIDEWHOLEWORD = 65536;
pub const FR_RAW = 131072;
pub const FR_SHOWWRAPAROUND = 262144;
pub const FR_NOWRAPAROUND = 524288;
pub const FR_WRAPAROUND = 1048576;
pub const FR_MATCHDIAC = 536870912;
pub const FR_MATCHKASHIDA = 1073741824;
pub const FR_MATCHALEFHAMZA = 2147483648;
pub const PD_ALLPAGES = 0;
pub const PD_COLLATE = 16;
pub const PD_CURRENTPAGE = 4194304;
pub const PD_DISABLEPRINTTOFILE = 524288;
pub const PD_ENABLEPRINTTEMPLATE = 16384;
pub const PD_ENABLEPRINTTEMPLATEHANDLE = 65536;
pub const PD_EXCLUSIONFLAGS = 16777216;
pub const PD_HIDEPRINTTOFILE = 1048576;
pub const PD_NOCURRENTPAGE = 8388608;
pub const PD_NOPAGENUMS = 8;
pub const PD_NOSELECTION = 4;
pub const PD_NOWARNING = 128;
pub const PD_PAGENUMS = 2;
pub const PD_PRINTTOFILE = 32;
pub const PD_RETURNDC = 256;
pub const PD_RETURNDEFAULT = 1024;
pub const PD_RETURNIC = 512;
pub const PD_SELECTION = 1;
pub const PD_USEDEVMODECOPIES = 262144;
pub const PD_USEDEVMODECOPIESANDCOLLATE = 262144;
pub const PD_USELARGETEMPLATE = 268435456;
pub const PD_ENABLEPRINTHOOK = 4096;
pub const PD_ENABLESETUPHOOK = 8192;
pub const PD_ENABLESETUPTEMPLATE = 32768;
pub const PD_ENABLESETUPTEMPLATEHANDLE = 131072;
pub const PD_NONETWORKBUTTON = 2097152;
pub const PD_PRINTSETUP = 64;
pub const PD_SHOWHELP = 2048;
pub const BOLD_FONTTYPE = 256;
pub const ITALIC_FONTTYPE = 512;
pub const PRINTER_FONTTYPE = 16384;
pub const REGULAR_FONTTYPE = 1024;
pub const SCREEN_FONTTYPE = 8192;
pub const SIMULATED_FONTTYPE = 32768;
pub const OFN_SHAREFALLTHROUGH = 2;
pub const OFN_SHARENOWARN = 1;
pub const OFN_SHAREWARN = 0;
pub const CDN_INITDONE = 4294966695;
pub const CDN_SELCHANGE = 4294966694;
pub const CDN_FOLDERCHANGE = 4294966693;
pub const CDN_SHAREVIOLATION = 4294966692;
pub const CDN_HELP = 4294966691;
pub const CDN_FILEOK = 4294966690;
pub const CDN_TYPECHANGE = 4294966689;
pub const CDN_INCLUDEITEM = 4294966688;
pub const CDM_FIRST = 1124;
pub const CDM_LAST = 1224;
pub const CDM_GETSPEC = 1124;
pub const CDM_GETFILEPATH = 1125;
pub const CDM_GETFOLDERPATH = 1126;
pub const CDM_GETFOLDERIDLIST = 1127;
pub const CDM_SETCONTROLTEXT = 1128;
pub const CDM_HIDECONTROL = 1129;
pub const CDM_SETDEFEXT = 1130;
pub const FRM_FIRST = 1124;
pub const FRM_LAST = 1224;
pub const FRM_SETOPERATIONRESULT = 1124;
pub const FRM_SETOPERATIONRESULTTEXT = 1125;
pub const PS_OPENTYPE_FONTTYPE = 65536;
pub const TT_OPENTYPE_FONTTYPE = 131072;
pub const TYPE1_FONTTYPE = 262144;
pub const SYMBOL_FONTTYPE = 524288;
pub const WM_CHOOSEFONT_GETLOGFONT = 1025;
pub const WM_CHOOSEFONT_SETLOGFONT = 1125;
pub const WM_CHOOSEFONT_SETFLAGS = 1126;
pub const CD_LBSELNOITEMS = -1;
pub const CD_LBSELCHANGE = 0;
pub const CD_LBSELSUB = 1;
pub const CD_LBSELADD = 2;
pub const START_PAGE_GENERAL = 4294967295;
pub const PD_RESULT_CANCEL = 0;
pub const PD_RESULT_PRINT = 1;
pub const PD_RESULT_APPLY = 2;
pub const DN_DEFAULTPRN = 1;
pub const WM_PSD_FULLPAGERECT = 1025;
pub const WM_PSD_MINMARGINRECT = 1026;
pub const WM_PSD_MARGINRECT = 1027;
pub const WM_PSD_GREEKTEXTRECT = 1028;
pub const WM_PSD_ENVSTAMPRECT = 1029;
pub const WM_PSD_YAFULLPAGERECT = 1030;
pub const DLG_COLOR = 10;
pub const COLOR_HUESCROLL = 700;
pub const COLOR_SATSCROLL = 701;
pub const COLOR_LUMSCROLL = 702;
pub const COLOR_HUE = 703;
pub const COLOR_SAT = 704;
pub const COLOR_LUM = 705;
pub const COLOR_RED = 706;
pub const COLOR_GREEN = 707;
pub const COLOR_BLUE = 708;
pub const COLOR_CURRENT = 709;
pub const COLOR_RAINBOW = 710;
pub const COLOR_SAVE = 711;
pub const COLOR_ADD = 712;
pub const COLOR_SOLID = 713;
pub const COLOR_TUNE = 714;
pub const COLOR_SCHEMES = 715;
pub const COLOR_ELEMENT = 716;
pub const COLOR_SAMPLES = 717;
pub const COLOR_PALETTE = 718;
pub const COLOR_MIX = 719;
pub const COLOR_BOX1 = 720;
pub const COLOR_CUSTOM1 = 721;
pub const COLOR_HUEACCEL = 723;
pub const COLOR_SATACCEL = 724;
pub const COLOR_LUMACCEL = 725;
pub const COLOR_REDACCEL = 726;
pub const COLOR_GREENACCEL = 727;
pub const COLOR_BLUEACCEL = 728;
pub const COLOR_SOLID_LEFT = 730;
pub const COLOR_SOLID_RIGHT = 731;
pub const NUM_BASIC_COLORS = 48;
pub const NUM_CUSTOM_COLORS = 16;

pub const aliases = struct {
    pub const COMMON_DLG_ERRORS = u32;
    pub const CHOOSECOLOR_FLAGS = u32;
    pub const OPEN_FILENAME_FLAGS = u32;
    pub const OPEN_FILENAME_FLAGS_EX = u32;
    pub const PAGESETUPDLG_FLAGS = u32;
    pub const CHOOSEFONT_FLAGS = u32;
    pub const FINDREPLACE_FLAGS = u32;
    pub const PRINTDLGEX_FLAGS = u32;
    pub const CHOOSEFONT_FONT_TYPE = u16;
};
