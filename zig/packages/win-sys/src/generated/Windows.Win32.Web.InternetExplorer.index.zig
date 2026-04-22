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
    .{ "IEAssociateThreadWithTab", MethodRecord{ .library = "Ieframe", .import = "IEAssociateThreadWithTab", .signature = "\x00\x02\x11\x79\x09\x09" } },
    .{ "IEDisassociateThreadWithTab", MethodRecord{ .library = "Ieframe", .import = "IEDisassociateThreadWithTab", .signature = "\x00\x02\x11\x79\x09\x09" } },
    .{ "IEIsInPrivateBrowsing", MethodRecord{ .library = "Ieframe", .import = "IEIsInPrivateBrowsing", .signature = "\x00\x00\x11\x59" } },
    .{ "IEInPrivateFilteringEnabled", MethodRecord{ .library = "Ieframe", .import = "IEInPrivateFilteringEnabled", .signature = "\x00\x00\x11\x59" } },
    .{ "IETrackingProtectionEnabled", MethodRecord{ .library = "Ieframe", .import = "IETrackingProtectionEnabled", .signature = "\x00\x00\x11\x59" } },
    .{ "IESaveFile", MethodRecord{ .library = "Ieframe", .import = "IESaveFile", .signature = "\x00\x02\x11\x79\x11\x80\x85\x11\x05" } },
    .{ "IECancelSaveFile", MethodRecord{ .library = "Ieframe", .import = "IECancelSaveFile", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "IEShowSaveFileDialog", MethodRecord{ .library = "Ieframe", .import = "IEShowSaveFileDialog", .signature = "\x00\x09\x11\x79\x11\x25\x11\x05\x11\x05\x11\x05\x11\x05\x09\x09\x0f\x11\x05\x0f\x11\x80\x85" } },
    .{ "IEShowOpenFileDialog", MethodRecord{ .library = "Ieframe", .import = "IEShowOpenFileDialog", .signature = "\x00\x09\x11\x79\x11\x25\x11\x05\x09\x11\x05\x11\x05\x11\x05\x09\x09\x0f\x11\x80\x85" } },
    .{ "IEGetWriteableLowHKCU", MethodRecord{ .library = "Ieframe", .import = "IEGetWriteableLowHKCU", .signature = "\x00\x01\x11\x79\x0f\x11\x55" } },
    .{ "IEGetWriteableFolderPath", MethodRecord{ .library = "Ieframe", .import = "IEGetWriteableFolderPath", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "IEIsProtectedModeProcess", MethodRecord{ .library = "Ieframe", .import = "IEIsProtectedModeProcess", .signature = "\x00\x01\x11\x79\x0f\x11\x59" } },
    .{ "IEIsProtectedModeURL", MethodRecord{ .library = "Ieframe", .import = "IEIsProtectedModeURL", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "IELaunchURL", MethodRecord{ .library = "Ieframe", .import = "IELaunchURL", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\xa3\xe5\x0f\x01" } },
    .{ "IERefreshElevationPolicy", MethodRecord{ .library = "Ieframe", .import = "IERefreshElevationPolicy", .signature = "\x00\x00\x11\x79" } },
    .{ "IEGetProtectedModeCookie", MethodRecord{ .library = "Ieframe", .import = "IEGetProtectedModeCookie", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x11\x05\x0f\x09\x09" } },
    .{ "IESetProtectedModeCookie", MethodRecord{ .library = "Ieframe", .import = "IESetProtectedModeCookie", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "IERegisterWritableRegistryKey", MethodRecord{ .library = "Ieframe", .import = "IERegisterWritableRegistryKey", .signature = "\x00\x03\x11\x79\x11\x0d\x11\x05\x11\x59" } },
    .{ "IERegisterWritableRegistryValue", MethodRecord{ .library = "Ieframe", .import = "IERegisterWritableRegistryValue", .signature = "\x00\x06\x11\x79\x11\x0d\x11\x05\x11\x05\x09\x0f\x05\x09" } },
    .{ "IEUnregisterWritableRegistry", MethodRecord{ .library = "Ieframe", .import = "IEUnregisterWritableRegistry", .signature = "\x00\x01\x11\x79\x11\x0d" } },
    .{ "IERegCreateKeyEx", MethodRecord{ .library = "Ieframe", .import = "IERegCreateKeyEx", .signature = "\x00\x08\x11\x79\x11\x05\x09\x11\x05\x09\x09\x0f\x11\x8b\xb5\x0f\x11\x55\x0f\x09" } },
    .{ "IERegSetValueEx", MethodRecord{ .library = "Ieframe", .import = "IERegSetValueEx", .signature = "\x00\x06\x11\x79\x11\x05\x11\x05\x09\x09\x0f\x05\x09" } },
    .{ "IECreateFile", MethodRecord{ .library = "Ieframe", .import = "IECreateFile", .signature = "\x00\x07\x11\x80\x85\x11\x05\x09\x09\x0f\x11\x8b\xb5\x09\x09\x11\x80\x85" } },
    .{ "IEDeleteFile", MethodRecord{ .library = "Ieframe", .import = "IEDeleteFile", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "IERemoveDirectory", MethodRecord{ .library = "Ieframe", .import = "IERemoveDirectory", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "IEMoveFileEx", MethodRecord{ .library = "Ieframe", .import = "IEMoveFileEx", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x09" } },
    .{ "IECreateDirectory", MethodRecord{ .library = "Ieframe", .import = "IECreateDirectory", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x11\x8b\xb5" } },
    .{ "IEGetFileAttributesEx", MethodRecord{ .library = "Ieframe", .import = "IEGetFileAttributesEx", .signature = "\x00\x03\x11\x59\x11\x05\x11\x8b\xd9\x0f\x01" } },
    .{ "IEFindFirstFile", MethodRecord{ .library = "Ieframe", .import = "IEFindFirstFile", .signature = "\x00\x02\x11\x80\x85\x11\x05\x0f\x11\x8b\xc5" } },
    .{ "RatingEnable", MethodRecord{ .library = "MSRATING", .import = "RatingEnable", .signature = "\x00\x03\x11\x79\x11\x25\x11\x3d\x11\x59" } },
    .{ "RatingEnableW", MethodRecord{ .library = "MSRATING", .import = "RatingEnableW", .signature = "\x00\x03\x11\x79\x11\x25\x11\x05\x11\x59" } },
    .{ "RatingCheckUserAccess", MethodRecord{ .library = "MSRATING", .import = "RatingCheckUserAccess", .signature = "\x00\x06\x11\x79\x11\x3d\x11\x3d\x11\x3d\x0f\x05\x09\x0f\x0f\x01" } },
    .{ "RatingCheckUserAccessW", MethodRecord{ .library = "MSRATING", .import = "RatingCheckUserAccessW", .signature = "\x00\x06\x11\x79\x11\x05\x11\x05\x11\x05\x0f\x05\x09\x0f\x0f\x01" } },
    .{ "RatingAccessDeniedDialog", MethodRecord{ .library = "MSRATING", .import = "RatingAccessDeniedDialog", .signature = "\x00\x04\x11\x79\x11\x25\x11\x3d\x11\x3d\x0f\x01" } },
    .{ "RatingAccessDeniedDialogW", MethodRecord{ .library = "MSRATING", .import = "RatingAccessDeniedDialogW", .signature = "\x00\x04\x11\x79\x11\x25\x11\x05\x11\x05\x0f\x01" } },
    .{ "RatingAccessDeniedDialog2", MethodRecord{ .library = "MSRATING", .import = "RatingAccessDeniedDialog2", .signature = "\x00\x03\x11\x79\x11\x25\x11\x3d\x0f\x01" } },
    .{ "RatingAccessDeniedDialog2W", MethodRecord{ .library = "MSRATING", .import = "RatingAccessDeniedDialog2W", .signature = "\x00\x03\x11\x79\x11\x25\x11\x05\x0f\x01" } },
    .{ "RatingFreeDetails", MethodRecord{ .library = "MSRATING", .import = "RatingFreeDetails", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "RatingObtainCancel", MethodRecord{ .library = "MSRATING", .import = "RatingObtainCancel", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "RatingObtainQuery", MethodRecord{ .library = "MSRATING", .import = "RatingObtainQuery", .signature = "\x00\x04\x11\x79\x11\x3d\x09\x18\x0f\x11\x80\x85" } },
    .{ "RatingObtainQueryW", MethodRecord{ .library = "MSRATING", .import = "RatingObtainQueryW", .signature = "\x00\x04\x11\x79\x11\x05\x09\x18\x0f\x11\x80\x85" } },
    .{ "RatingSetupUI", MethodRecord{ .library = "MSRATING", .import = "RatingSetupUI", .signature = "\x00\x02\x11\x79\x11\x25\x11\x3d" } },
    .{ "RatingSetupUIW", MethodRecord{ .library = "MSRATING", .import = "RatingSetupUIW", .signature = "\x00\x02\x11\x79\x11\x25\x11\x05" } },
    .{ "RatingAddToApprovedSites", MethodRecord{ .library = "MSRATING", .import = "RatingAddToApprovedSites", .signature = "\x00\x07\x11\x79\x11\x25\x09\x0f\x05\x11\x05\x11\x59\x11\x59\x11\x59" } },
    .{ "RatingClickedOnPRFInternal", MethodRecord{ .library = "MSRATING", .import = "RatingClickedOnPRFInternal", .signature = "\x00\x04\x11\x79\x11\x25\x11\x82\x29\x11\x3d\x08" } },
    .{ "RatingClickedOnRATInternal", MethodRecord{ .library = "MSRATING", .import = "RatingClickedOnRATInternal", .signature = "\x00\x04\x11\x79\x11\x25\x11\x82\x29\x11\x3d\x08" } },
    .{ "RatingEnabledQuery", MethodRecord{ .library = "MSRATING", .import = "RatingEnabledQuery", .signature = "\x00\x00\x11\x79" } },
    .{ "RatingInit", MethodRecord{ .library = "MSRATING", .import = "RatingInit", .signature = "\x00\x00\x11\x79" } },
    .{ "CreateMIMEMap", MethodRecord{ .library = "ImgUtil", .import = "CreateMIMEMap", .signature = "\x00\x01\x11\x79\x0f\x12\xc0\x00\x48\x89" } },
    .{ "DecodeImage", MethodRecord{ .library = "ImgUtil", .import = "DecodeImage", .signature = "\x00\x03\x11\x79\x12\x83\x75\x12\xc0\x00\x48\x89\x12\x82\xb1" } },
    .{ "SniffStream", MethodRecord{ .library = "ImgUtil", .import = "SniffStream", .signature = "\x00\x03\x11\x79\x12\x83\x75\x0f\x09\x0f\x12\x83\x75" } },
    .{ "GetMaxMIMEIDBytes", MethodRecord{ .library = "ImgUtil", .import = "GetMaxMIMEIDBytes", .signature = "\x00\x01\x11\x79\x0f\x09" } },
    .{ "IdentifyMIMEType", MethodRecord{ .library = "ImgUtil", .import = "IdentifyMIMEType", .signature = "\x00\x03\x11\x79\x0f\x05\x09\x0f\x09" } },
    .{ "ComputeInvCMAP", MethodRecord{ .library = "ImgUtil", .import = "ComputeInvCMAP", .signature = "\x00\x04\x11\x79\x0f\x11\x84\x2d\x09\x0f\x05\x09" } },
    .{ "DitherTo8", MethodRecord{ .library = "ImgUtil", .import = "DitherTo8", .signature = "\x00\x0e\x11\x79\x0f\x05\x08\x0f\x05\x08\x0f\x11\x0d\x0f\x11\x84\x2d\x0f\x11\x84\x2d\x0f\x05\x08\x08\x08\x08\x08\x08" } },
    .{ "CreateDDrawSurfaceOnDIB", MethodRecord{ .library = "ImgUtil", .import = "CreateDDrawSurfaceOnDIB", .signature = "\x00\x02\x11\x79\x11\x83\x51\x0f\x12\xc0\x00\x48\x8d" } },
    .{ "DecodeImageEx", MethodRecord{ .library = "ImgUtil", .import = "DecodeImageEx", .signature = "\x00\x04\x11\x79\x12\x83\x75\x12\xc0\x00\x48\x89\x12\x82\xb1\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x55 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "HKEY" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x351 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HBITMAP" },
        0x375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IStream" },
        0x42d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "RGBQUAD" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0xbc5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "WIN32_FIND_DATAA" },
        0xbd9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "GET_FILEEX_INFO_LEVELS" },
        0x23e5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PROCESS_INFORMATION" },
        0x4889 => TypeRefEntry{ .namespace = "Windows.Win32.Web.InternetExplorer", .name = "IMapMIMEToCLSID" },
        0x488d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.DirectDraw", .name = "IDirectDrawSurface" },
        else => null,
    };
}

pub const DISPID_AMBIENT_OFFLINEIFNOTCONNECTED = -5501;
pub const DISPID_AMBIENT_SILENT = -5502;
pub const DISPID_BEFORENAVIGATE = 100;
pub const DISPID_NAVIGATECOMPLETE = 101;
pub const DISPID_STATUSTEXTCHANGE = 102;
pub const DISPID_QUIT = 103;
pub const DISPID_DOWNLOADCOMPLETE = 104;
pub const DISPID_COMMANDSTATECHANGE = 105;
pub const DISPID_DOWNLOADBEGIN = 106;
pub const DISPID_NEWWINDOW = 107;
pub const DISPID_PROGRESSCHANGE = 108;
pub const DISPID_WINDOWMOVE = 109;
pub const DISPID_WINDOWRESIZE = 110;
pub const DISPID_WINDOWACTIVATE = 111;
pub const DISPID_PROPERTYCHANGE = 112;
pub const DISPID_TITLECHANGE = 113;
pub const DISPID_TITLEICONCHANGE = 114;
pub const DISPID_FRAMEBEFORENAVIGATE = 200;
pub const DISPID_FRAMENAVIGATECOMPLETE = 201;
pub const DISPID_FRAMENEWWINDOW = 204;
pub const DISPID_BEFORENAVIGATE2 = 250;
pub const DISPID_NEWWINDOW2 = 251;
pub const DISPID_NAVIGATECOMPLETE2 = 252;
pub const DISPID_ONQUIT = 253;
pub const DISPID_ONVISIBLE = 254;
pub const DISPID_ONTOOLBAR = 255;
pub const DISPID_ONMENUBAR = 256;
pub const DISPID_ONSTATUSBAR = 257;
pub const DISPID_ONFULLSCREEN = 258;
pub const DISPID_DOCUMENTCOMPLETE = 259;
pub const DISPID_ONTHEATERMODE = 260;
pub const DISPID_ONADDRESSBAR = 261;
pub const DISPID_WINDOWSETRESIZABLE = 262;
pub const DISPID_WINDOWCLOSING = 263;
pub const DISPID_WINDOWSETLEFT = 264;
pub const DISPID_WINDOWSETTOP = 265;
pub const DISPID_WINDOWSETWIDTH = 266;
pub const DISPID_WINDOWSETHEIGHT = 267;
pub const DISPID_CLIENTTOHOSTWINDOW = 268;
pub const DISPID_SETSECURELOCKICON = 269;
pub const DISPID_FILEDOWNLOAD = 270;
pub const DISPID_NAVIGATEERROR = 271;
pub const DISPID_PRIVACYIMPACTEDSTATECHANGE = 272;
pub const DISPID_NEWWINDOW3 = 273;
pub const DISPID_VIEWUPDATE = 281;
pub const DISPID_SETPHISHINGFILTERSTATUS = 282;
pub const DISPID_WINDOWSTATECHANGED = 283;
pub const DISPID_NEWPROCESS = 284;
pub const DISPID_THIRDPARTYURLBLOCKED = 285;
pub const DISPID_REDIRECTXDOMAINBLOCKED = 286;
pub const DISPID_WEBWORKERSTARTED = 288;
pub const DISPID_WEBWORKERFINISHED = 289;
pub const DISPID_BEFORESCRIPTEXECUTE = 290;
pub const DISPID_PRINTTEMPLATEINSTANTIATION = 225;
pub const DISPID_PRINTTEMPLATETEARDOWN = 226;
pub const DISPID_UPDATEPAGESTATUS = 227;
pub const DISPID_WINDOWREGISTERED = 200;
pub const DISPID_WINDOWREVOKED = 201;
pub const DISPID_RESETFIRSTBOOTMODE = 1;
pub const DISPID_RESETSAFEMODE = 2;
pub const DISPID_REFRESHOFFLINEDESKTOP = 3;
pub const DISPID_ADDFAVORITE = 4;
pub const DISPID_ADDCHANNEL = 5;
pub const DISPID_ADDDESKTOPCOMPONENT = 6;
pub const DISPID_ISSUBSCRIBED = 7;
pub const DISPID_NAVIGATEANDFIND = 8;
pub const DISPID_IMPORTEXPORTFAVORITES = 9;
pub const DISPID_AUTOCOMPLETESAVEFORM = 10;
pub const DISPID_AUTOSCAN = 11;
pub const DISPID_AUTOCOMPLETEATTACH = 12;
pub const DISPID_SHOWBROWSERUI = 13;
pub const DISPID_ADDSEARCHPROVIDER = 14;
pub const DISPID_RUNONCESHOWN = 15;
pub const DISPID_SKIPRUNONCE = 16;
pub const DISPID_CUSTOMIZESETTINGS = 17;
pub const DISPID_SQMENABLED = 18;
pub const DISPID_PHISHINGENABLED = 19;
pub const DISPID_BRANDIMAGEURI = 20;
pub const DISPID_SKIPTABSWELCOME = 21;
pub const DISPID_DIAGNOSECONNECTION = 22;
pub const DISPID_CUSTOMIZECLEARTYPE = 23;
pub const DISPID_ISSEARCHPROVIDERINSTALLED = 24;
pub const DISPID_ISSEARCHMIGRATED = 25;
pub const DISPID_DEFAULTSEARCHPROVIDER = 26;
pub const DISPID_RUNONCEREQUIREDSETTINGSCOMPLETE = 27;
pub const DISPID_RUNONCEHASSHOWN = 28;
pub const DISPID_SEARCHGUIDEURL = 29;
pub const DISPID_ADDSERVICE = 30;
pub const DISPID_ISSERVICEINSTALLED = 31;
pub const DISPID_ADDTOFAVORITESBAR = 32;
pub const DISPID_BUILDNEWTABPAGE = 33;
pub const DISPID_SETRECENTLYCLOSEDVISIBLE = 34;
pub const DISPID_SETACTIVITIESVISIBLE = 35;
pub const DISPID_CONTENTDISCOVERYRESET = 36;
pub const DISPID_INPRIVATEFILTERINGENABLED = 37;
pub const DISPID_SUGGESTEDSITESENABLED = 38;
pub const DISPID_ENABLESUGGESTEDSITES = 39;
pub const DISPID_NAVIGATETOSUGGESTEDSITES = 40;
pub const DISPID_SHOWTABSHELP = 41;
pub const DISPID_SHOWINPRIVATEHELP = 42;
pub const DISPID_ISSITEMODE = 43;
pub const DISPID_SETSITEMODEICONOVERLAY = 44;
pub const DISPID_CLEARSITEMODEICONOVERLAY = 45;
pub const DISPID_UPDATETHUMBNAILBUTTON = 46;
pub const DISPID_SETTHUMBNAILBUTTONS = 47;
pub const DISPID_ADDTHUMBNAILBUTTONS = 48;
pub const DISPID_ADDSITEMODE = 49;
pub const DISPID_SETSITEMODEPROPERTIES = 50;
pub const DISPID_SITEMODECREATEJUMPLIST = 51;
pub const DISPID_SITEMODEADDJUMPLISTITEM = 52;
pub const DISPID_SITEMODECLEARJUMPLIST = 53;
pub const DISPID_SITEMODEADDBUTTONSTYLE = 54;
pub const DISPID_SITEMODESHOWBUTTONSTYLE = 55;
pub const DISPID_SITEMODESHOWJUMPLIST = 56;
pub const DISPID_ADDTRACKINGPROTECTIONLIST = 57;
pub const DISPID_SITEMODEACTIVATE = 58;
pub const DISPID_ISSITEMODEFIRSTRUN = 59;
pub const DISPID_TRACKINGPROTECTIONENABLED = 60;
pub const DISPID_ACTIVEXFILTERINGENABLED = 61;
pub const DISPID_PROVISIONNETWORKS = 62;
pub const DISPID_REPORTSAFEURL = 63;
pub const DISPID_SITEMODEREFRESHBADGE = 64;
pub const DISPID_SITEMODECLEARBADGE = 65;
pub const DISPID_DIAGNOSECONNECTIONUILESS = 66;
pub const DISPID_LAUNCHNETWORKCLIENTHELP = 67;
pub const DISPID_CHANGEDEFAULTBROWSER = 68;
pub const DISPID_STOPPERIODICUPDATE = 69;
pub const DISPID_STARTPERIODICUPDATE = 70;
pub const DISPID_CLEARNOTIFICATION = 71;
pub const DISPID_ENABLENOTIFICATIONQUEUE = 72;
pub const DISPID_PINNEDSITESTATE = 73;
pub const DISPID_LAUNCHINTERNETOPTIONS = 74;
pub const DISPID_STARTPERIODICUPDATEBATCH = 75;
pub const DISPID_ENABLENOTIFICATIONQUEUESQUARE = 76;
pub const DISPID_ENABLENOTIFICATIONQUEUEWIDE = 77;
pub const DISPID_ENABLENOTIFICATIONQUEUELARGE = 78;
pub const DISPID_SCHEDULEDTILENOTIFICATION = 79;
pub const DISPID_REMOVESCHEDULEDTILENOTIFICATION = 80;
pub const DISPID_STARTBADGEUPDATE = 81;
pub const DISPID_STOPBADGEUPDATE = 82;
pub const DISPID_ISMETAREFERRERAVAILABLE = 83;
pub const DISPID_SETEXPERIMENTALFLAG = 84;
pub const DISPID_GETEXPERIMENTALFLAG = 85;
pub const DISPID_SETEXPERIMENTALVALUE = 86;
pub const DISPID_GETEXPERIMENTALVALUE = 87;
pub const DISPID_HASNEEDIEAUTOLAUNCHFLAG = 88;
pub const DISPID_GETNEEDIEAUTOLAUNCHFLAG = 89;
pub const DISPID_SETNEEDIEAUTOLAUNCHFLAG = 90;
pub const DISPID_LAUNCHIE = 91;
pub const DISPID_RESETEXPERIMENTALFLAGS = 92;
pub const DISPID_GETCVLISTDATA = 93;
pub const DISPID_GETCVLISTLOCALDATA = 94;
pub const DISPID_GETEMIELISTDATA = 95;
pub const DISPID_GETEMIELISTLOCALDATA = 96;
pub const DISPID_OPENFAVORITESPANE = 97;
pub const DISPID_OPENFAVORITESSETTINGS = 98;
pub const DISPID_LAUNCHINHVSI = 99;
pub const DISPID_GETNEEDHVSIAUTOLAUNCHFLAG = 100;
pub const DISPID_SETNEEDHVSIAUTOLAUNCHFLAG = 101;
pub const DISPID_HASNEEDHVSIAUTOLAUNCHFLAG = 102;
pub const DISPID_GETOSSKU = 103;
pub const DISPID_SETMSDEFAULTS = 104;
pub const DISPID_SHELLUIHELPERLAST = 105;
pub const DISPID_ADVANCEERROR = 10;
pub const DISPID_RETREATERROR = 11;
pub const DISPID_CANADVANCEERROR = 12;
pub const DISPID_CANRETREATERROR = 13;
pub const DISPID_GETERRORLINE = 14;
pub const DISPID_GETERRORCHAR = 15;
pub const DISPID_GETERRORCODE = 16;
pub const DISPID_GETERRORMSG = 17;
pub const DISPID_GETERRORURL = 18;
pub const DISPID_GETDETAILSSTATE = 19;
pub const DISPID_SETDETAILSSTATE = 20;
pub const DISPID_GETPERERRSTATE = 21;
pub const DISPID_SETPERERRSTATE = 22;
pub const DISPID_GETALWAYSSHOWLOCKSTATE = 23;
pub const DISPID_FAVSELECTIONCHANGE = 1;
pub const DISPID_SELECTIONCHANGE = 2;
pub const DISPID_DOUBLECLICK = 3;
pub const DISPID_INITIALIZED = 4;
pub const DISPID_MOVESELECTIONUP = 1;
pub const DISPID_MOVESELECTIONDOWN = 2;
pub const DISPID_RESETSORT = 3;
pub const DISPID_NEWFOLDER = 4;
pub const DISPID_SYNCHRONIZE = 5;
pub const DISPID_IMPORT = 6;
pub const DISPID_EXPORT = 7;
pub const DISPID_INVOKECONTEXTMENU = 8;
pub const DISPID_MOVESELECTIONTO = 9;
pub const DISPID_SUBSCRIPTIONSENABLED = 10;
pub const DISPID_CREATESUBSCRIPTION = 11;
pub const DISPID_DELETESUBSCRIPTION = 12;
pub const DISPID_SETROOT = 13;
pub const DISPID_ENUMOPTIONS = 14;
pub const DISPID_SELECTEDITEM = 15;
pub const DISPID_ROOT = 16;
pub const DISPID_DEPTH = 17;
pub const DISPID_MODE = 18;
pub const DISPID_FLAGS = 19;
pub const DISPID_TVFLAGS = 20;
pub const DISPID_NSCOLUMNS = 21;
pub const DISPID_COUNTVIEWTYPES = 22;
pub const DISPID_SETVIEWTYPE = 23;
pub const DISPID_SELECTEDITEMS = 24;
pub const DISPID_EXPAND = 25;
pub const DISPID_UNSELECTALL = 26;
pub const TF_NAVIGATE = 2142153644;
pub const REGSTR_VAL_SMOOTHSCROLL_DEF = 1;
pub const REGSTR_VAL_USEICM_DEF = 0;
pub const MAX_SEARCH_FORMAT_STRING = 255;
pub const REGSTR_VAL_SECURITYWARNONSEND_DEF = 1;
pub const REGSTR_VAL_SECURITYWARNONSENDALWAYS_DEF = 1;
pub const REGSTR_VAL_SECURITYWARNONVIEW_DEF = 1;
pub const REGSTR_VAL_SECURITYALLOWCOOKIES_DEF = 1;
pub const REGSTR_VAL_SECURITYWARNONZONECROSSING_DEF = 1;
pub const REGSTR_VAL_SECURITYWARNONBADCERTVIEWING_DEF = 1;
pub const REGSTR_VAL_SECURITYWARNONBADCERTSENDING_DEF = 1;
pub const REGSTR_VAL_SECURITYDISABLECACHINGOFSSLPAGES_DEF = 0;
pub const REGSTR_VAL_SECURITYACTIVEX_DEF = 1;
pub const REGSTR_VAL_SECURITYACTICEXSCRIPTS_DEF = 1;
pub const REGSTR_VAL_SECURITYJAVA_DEF = 1;
pub const REGSTR_VAL_JAVAJIT_DEF = 0;
pub const REGSTR_VAL_JAVALOGGING_DEF = 0;
pub const REGSTR_VAL_VISIBLEBANDS_DEF = 7;
pub const TOOLSBAND = 1;
pub const ADDRESSBAND = 2;
pub const LINKSBAND = 4;
pub const REGSTR_VAL_SCHANNELENABLEPROTOCOL_DEF = 1;
pub const IE_USE_OE_PRESENT_HKEY = -2147483646;
pub const IE_USE_OE_MAIL_HKEY = -2147483647;
pub const IE_USE_OE_NEWS_HKEY = -2147483647;
pub const REGSTR_VAL_FONT_SIZE_DEF = 2;
pub const IECMDID_CLEAR_AUTOCOMPLETE_FOR_FORMS = 0;
pub const IECMDID_SETID_AUTOCOMPLETE_FOR_FORMS = 1;
pub const IECMDID_BEFORENAVIGATE_GETSHELLBROWSE = 2;
pub const IECMDID_BEFORENAVIGATE_DOEXTERNALBROWSE = 3;
pub const IECMDID_BEFORENAVIGATE_GETIDLIST = 4;
pub const IECMDID_SET_INVOKE_DEFAULT_BROWSER_ON_NEW_WINDOW = 5;
pub const IECMDID_GET_INVOKE_DEFAULT_BROWSER_ON_NEW_WINDOW = 6;
pub const IECMDID_ARG_CLEAR_FORMS_ALL = 0;
pub const IECMDID_ARG_CLEAR_FORMS_ALL_BUT_PASSWORDS = 1;
pub const IECMDID_ARG_CLEAR_FORMS_PASSWORDS_ONLY = 2;
pub const msoedmEnable = 1;
pub const msoedmDisable = 2;
pub const msoedmDontOpen = 3;
pub const msoslUndefined = 0;
pub const msoslNone = 1;
pub const msoslMedium = 2;
pub const msoslHigh = 3;
pub const msodsvNoMacros = 0;
pub const msodsvUnsigned = 1;
pub const msodsvPassedTrusted = 2;
pub const msodsvFailed = 3;
pub const msodsvLowSecurityLevel = 4;
pub const msodsvPassedTrustedCert = 5;
pub const STATURL_QUERYFLAG_ISCACHED = 65536;
pub const STATURL_QUERYFLAG_NOURL = 131072;
pub const STATURL_QUERYFLAG_NOTITLE = 262144;
pub const STATURL_QUERYFLAG_TOPLEVEL = 524288;
pub const STATURLFLAG_ISCACHED = 1;
pub const STATURLFLAG_ISTOPLEVEL = 2;
pub const SURFACE_LOCK_EXCLUSIVE = 1;
pub const SURFACE_LOCK_ALLOW_DISCARD = 2;
pub const SURFACE_LOCK_WAIT = 4;
pub const E_SURFACE_NOSURFACE = -2147434496;
pub const E_SURFACE_UNKNOWN_FORMAT = -2147434495;
pub const E_SURFACE_NOTMYPOINTER = -2147434494;
pub const E_SURFACE_DISCARDED = -2147434493;
pub const E_SURFACE_NODC = -2147434492;
pub const E_SURFACE_NOTMYDC = -2147434491;
pub const S_SURFACE_DISCARDED = 49155;
pub const COLOR_NO_TRANSPARENT = 4294967295;
pub const IMGDECODE_EVENT_PROGRESS = 1;
pub const IMGDECODE_EVENT_PALETTE = 2;
pub const IMGDECODE_EVENT_BEGINBITS = 4;
pub const IMGDECODE_EVENT_BITSCOMPLETE = 8;
pub const IMGDECODE_EVENT_USEDDRAW = 16;
pub const IMGDECODE_HINT_TOPDOWN = 1;
pub const IMGDECODE_HINT_BOTTOMUP = 2;
pub const IMGDECODE_HINT_FULLWIDTH = 4;
pub const MAPMIME_DEFAULT = 0;
pub const MAPMIME_CLSID = 1;
pub const MAPMIME_DISABLE = 2;
pub const MAPMIME_DEFAULT_ALWAYS = 3;
pub const TIMERMODE_NORMAL = 0;
pub const TIMERMODE_VISIBILITYAWARE = 1;
pub const ExtensionValidationContextNone = 0;
pub const ExtensionValidationContextDynamic = 1;
pub const ExtensionValidationContextParsed = 2;
pub const ExtensionValidationResultNone = 0;
pub const ExtensionValidationResultDoNotInstantiate = 1;
pub const ExtensionValidationResultArrestPageLoad = 2;
pub const FINDFRAME_NONE = 0;
pub const FINDFRAME_JUSTTESTEXISTENCE = 1;
pub const FINDFRAME_INTERNAL = -2147483648;
pub const FRAMEOPTIONS_SCROLL_YES = 1;
pub const FRAMEOPTIONS_SCROLL_NO = 2;
pub const FRAMEOPTIONS_SCROLL_AUTO = 4;
pub const FRAMEOPTIONS_NORESIZE = 8;
pub const FRAMEOPTIONS_NO3DBORDER = 16;
pub const FRAMEOPTIONS_DESKTOP = 32;
pub const FRAMEOPTIONS_BROWSERBAND = 64;
pub const NAVIGATEFRAME_FL_RECORD = 1;
pub const NAVIGATEFRAME_FL_POST = 2;
pub const NAVIGATEFRAME_FL_NO_DOC_CACHE = 4;
pub const NAVIGATEFRAME_FL_NO_IMAGE_CACHE = 8;
pub const NAVIGATEFRAME_FL_AUTH_FAIL_CACHE_OK = 16;
pub const NAVIGATEFRAME_FL_SENDING_FROM_FORM = 32;
pub const NAVIGATEFRAME_FL_REALLY_SENDING_FROM_FORM = 64;
pub const MediaPlayback = 0;
pub const MediaRecording = 1;
pub const MediaCasting = 2;
pub const SCMP_TOP = 0;
pub const SCMP_BOTTOM = 1;
pub const SCMP_LEFT = 2;
pub const SCMP_RIGHT = 3;
pub const SCMP_FULL = 4;
pub const INTERNETEXPLORERCONFIGURATION_HOST = 1;
pub const INTERNETEXPLORERCONFIGURATION_WEB_DRIVER = 2;
pub const INTERNETEXPLORERCONFIGURATION_WEB_DRIVER_EDGE = 4;
pub const IELAUNCHOPTION_SCRIPTDEBUG = 1;
pub const IELAUNCHOPTION_FORCE_COMPAT = 2;
pub const IELAUNCHOPTION_FORCE_EDGE = 4;
pub const IELAUNCHOPTION_LOCK_ENGINE = 8;
pub const OS_E_NOTFOUND = -2147287038;
pub const OS_E_NOTSUPPORTED = -2147467231;
pub const OS_E_CANCELLED = -2147471631;
pub const OS_E_GPDISABLED = -1072886820;
pub const ActivityContentNone = -1;
pub const ActivityContentDocument = 0;
pub const ActivityContentSelection = 1;
pub const ActivityContentLink = 2;
pub const ActivityContentCount = 3;
pub const ADDURL_FIRST = 0;
pub const ADDURL_ADDTOHISTORYANDCACHE = 0;
pub const ADDURL_ADDTOCACHE = 1;
pub const ADDURL_Max = 2147483647;

pub const aliases = struct {
    pub const ExtensionValidationContexts = i32;
    pub const ExtensionValidationResults = i32;
    pub const FINDFRAME_FLAGS = i32;
    pub const FRAMEOPTIONS_FLAGS = i32;
    pub const NAVIGATEFRAME_FLAGS = i32;
    pub const MEDIA_ACTIVITY_NOTIFY_TYPE = i32;
    pub const SCROLLABLECONTEXTMENU_PLACEMENT = i32;
    pub const INTERNETEXPLORERCONFIGURATION = i32;
    pub const IELAUNCHOPTION_FLAGS = i32;
    pub const OpenServiceErrors = i32;
    pub const OpenServiceActivityContentType = i32;
    pub const ADDURL_FLAG = i32;
};
