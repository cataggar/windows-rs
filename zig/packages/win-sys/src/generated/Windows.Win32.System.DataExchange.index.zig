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
    .{ "DdeSetQualityOfService", MethodRecord{ .library = "USER32", .import = "DdeSetQualityOfService", .signature = "\x00\x03\x11\x59\x11\x25\x0f\x11\xc0\x00\x40\xa5\x0f\x11\xc0\x00\x40\xa5" } },
    .{ "ImpersonateDdeClientWindow", MethodRecord{ .library = "USER32", .import = "ImpersonateDdeClientWindow", .signature = "\x00\x02\x11\x59\x11\x25\x11\x25" } },
    .{ "PackDDElParam", MethodRecord{ .library = "USER32", .import = "PackDDElParam", .signature = "\x00\x03\x11\x82\x2d\x09\x19\x19" } },
    .{ "UnpackDDElParam", MethodRecord{ .library = "USER32", .import = "UnpackDDElParam", .signature = "\x00\x04\x11\x59\x09\x11\x82\x2d\x0f\x19\x0f\x19" } },
    .{ "FreeDDElParam", MethodRecord{ .library = "USER32", .import = "FreeDDElParam", .signature = "\x00\x02\x11\x59\x09\x11\x82\x2d" } },
    .{ "ReuseDDElParam", MethodRecord{ .library = "USER32", .import = "ReuseDDElParam", .signature = "\x00\x05\x11\x82\x2d\x11\x82\x2d\x09\x09\x19\x19" } },
    .{ "DdeInitializeA", MethodRecord{ .library = "USER32", .import = "DdeInitializeA", .signature = "\x00\x04\x09\x0f\x09\x12\xc0\x00\x40\xa9\x11\xa0\xa9\x09" } },
    .{ "DdeInitializeW", MethodRecord{ .library = "USER32", .import = "DdeInitializeW", .signature = "\x00\x04\x09\x0f\x09\x12\xc0\x00\x40\xa9\x11\xa0\xa9\x09" } },
    .{ "DdeUninitialize", MethodRecord{ .library = "USER32", .import = "DdeUninitialize", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "DdeConnectList", MethodRecord{ .library = "USER32", .import = "DdeConnectList", .signature = "\x00\x05\x11\xc0\x00\x40\xad\x09\x11\xc0\x00\x40\xb1\x11\xc0\x00\x40\xb1\x11\xc0\x00\x40\xad\x0f\x11\xc0\x00\x40\xb5" } },
    .{ "DdeQueryNextServer", MethodRecord{ .library = "USER32", .import = "DdeQueryNextServer", .signature = "\x00\x02\x11\xc0\x00\x40\xb9\x11\xc0\x00\x40\xad\x11\xc0\x00\x40\xb9" } },
    .{ "DdeDisconnectList", MethodRecord{ .library = "USER32", .import = "DdeDisconnectList", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x40\xad" } },
    .{ "DdeConnect", MethodRecord{ .library = "USER32", .import = "DdeConnect", .signature = "\x00\x04\x11\xc0\x00\x40\xb9\x09\x11\xc0\x00\x40\xb1\x11\xc0\x00\x40\xb1\x0f\x11\xc0\x00\x40\xb5" } },
    .{ "DdeDisconnect", MethodRecord{ .library = "USER32", .import = "DdeDisconnect", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x40\xb9" } },
    .{ "DdeReconnect", MethodRecord{ .library = "USER32", .import = "DdeReconnect", .signature = "\x00\x01\x11\xc0\x00\x40\xb9\x11\xc0\x00\x40\xb9" } },
    .{ "DdeQueryConvInfo", MethodRecord{ .library = "USER32", .import = "DdeQueryConvInfo", .signature = "\x00\x03\x09\x11\xc0\x00\x40\xb9\x09\x0f\x11\xc0\x00\x40\xbd" } },
    .{ "DdeSetUserHandle", MethodRecord{ .library = "USER32", .import = "DdeSetUserHandle", .signature = "\x00\x03\x11\x59\x11\xc0\x00\x40\xb9\x09\x19" } },
    .{ "DdeAbandonTransaction", MethodRecord{ .library = "USER32", .import = "DdeAbandonTransaction", .signature = "\x00\x03\x11\x59\x09\x11\xc0\x00\x40\xb9\x09" } },
    .{ "DdePostAdvise", MethodRecord{ .library = "USER32", .import = "DdePostAdvise", .signature = "\x00\x03\x11\x59\x09\x11\xc0\x00\x40\xb1\x11\xc0\x00\x40\xb1" } },
    .{ "DdeEnableCallback", MethodRecord{ .library = "USER32", .import = "DdeEnableCallback", .signature = "\x00\x03\x11\x59\x09\x11\xc0\x00\x40\xb9\x11\xa0\xa5" } },
    .{ "DdeImpersonateClient", MethodRecord{ .library = "USER32", .import = "DdeImpersonateClient", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x40\xb9" } },
    .{ "DdeNameService", MethodRecord{ .library = "USER32", .import = "DdeNameService", .signature = "\x00\x04\x11\xc0\x00\x40\xc1\x09\x11\xc0\x00\x40\xb1\x11\xc0\x00\x40\xb1\x11\xa0\xad" } },
    .{ "DdeClientTransaction", MethodRecord{ .library = "USER32", .import = "DdeClientTransaction", .signature = "\x00\x08\x11\xc0\x00\x40\xc1\x0f\x05\x09\x11\xc0\x00\x40\xb9\x11\xc0\x00\x40\xb1\x09\x11\xa0\xb1\x09\x0f\x09" } },
    .{ "DdeCreateDataHandle", MethodRecord{ .library = "USER32", .import = "DdeCreateDataHandle", .signature = "\x00\x07\x11\xc0\x00\x40\xc1\x09\x0f\x05\x09\x09\x11\xc0\x00\x40\xb1\x09\x09" } },
    .{ "DdeAddData", MethodRecord{ .library = "USER32", .import = "DdeAddData", .signature = "\x00\x04\x11\xc0\x00\x40\xc1\x11\xc0\x00\x40\xc1\x0f\x05\x09\x09" } },
    .{ "DdeGetData", MethodRecord{ .library = "USER32", .import = "DdeGetData", .signature = "\x00\x04\x09\x11\xc0\x00\x40\xc1\x0f\x05\x09\x09" } },
    .{ "DdeAccessData", MethodRecord{ .library = "USER32", .import = "DdeAccessData", .signature = "\x00\x02\x0f\x05\x11\xc0\x00\x40\xc1\x0f\x09" } },
    .{ "DdeUnaccessData", MethodRecord{ .library = "USER32", .import = "DdeUnaccessData", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x40\xc1" } },
    .{ "DdeFreeDataHandle", MethodRecord{ .library = "USER32", .import = "DdeFreeDataHandle", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x40\xc1" } },
    .{ "DdeGetLastError", MethodRecord{ .library = "USER32", .import = "DdeGetLastError", .signature = "\x00\x01\x09\x09" } },
    .{ "DdeCreateStringHandleA", MethodRecord{ .library = "USER32", .import = "DdeCreateStringHandleA", .signature = "\x00\x03\x11\xc0\x00\x40\xb1\x09\x11\x3d\x08" } },
    .{ "DdeCreateStringHandleW", MethodRecord{ .library = "USER32", .import = "DdeCreateStringHandleW", .signature = "\x00\x03\x11\xc0\x00\x40\xb1\x09\x11\x05\x08" } },
    .{ "DdeQueryStringA", MethodRecord{ .library = "USER32", .import = "DdeQueryStringA", .signature = "\x00\x05\x09\x09\x11\xc0\x00\x40\xb1\x11\x3d\x09\x08" } },
    .{ "DdeQueryStringW", MethodRecord{ .library = "USER32", .import = "DdeQueryStringW", .signature = "\x00\x05\x09\x09\x11\xc0\x00\x40\xb1\x11\x05\x09\x08" } },
    .{ "DdeFreeStringHandle", MethodRecord{ .library = "USER32", .import = "DdeFreeStringHandle", .signature = "\x00\x02\x11\x59\x09\x11\xc0\x00\x40\xb1" } },
    .{ "DdeKeepStringHandle", MethodRecord{ .library = "USER32", .import = "DdeKeepStringHandle", .signature = "\x00\x02\x11\x59\x09\x11\xc0\x00\x40\xb1" } },
    .{ "DdeCmpStringHandles", MethodRecord{ .library = "USER32", .import = "DdeCmpStringHandles", .signature = "\x00\x02\x08\x11\xc0\x00\x40\xb1\x11\xc0\x00\x40\xb1" } },
    .{ "SetWinMetaFileBits", MethodRecord{ .library = "GDI32", .import = "SetWinMetaFileBits", .signature = "\x00\x04\x11\x8e\x41\x09\x0f\x05\x11\x83\x5d\x0f\x11\xc0\x00\x40\xc5" } },
    .{ "OpenClipboard", MethodRecord{ .library = "USER32", .import = "OpenClipboard", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "CloseClipboard", MethodRecord{ .library = "USER32", .import = "CloseClipboard", .signature = "\x00\x00\x11\x59" } },
    .{ "GetClipboardSequenceNumber", MethodRecord{ .library = "USER32", .import = "GetClipboardSequenceNumber", .signature = "\x00\x00\x09" } },
    .{ "GetClipboardOwner", MethodRecord{ .library = "USER32", .import = "GetClipboardOwner", .signature = "\x00\x00\x11\x25" } },
    .{ "SetClipboardViewer", MethodRecord{ .library = "USER32", .import = "SetClipboardViewer", .signature = "\x00\x01\x11\x25\x11\x25" } },
    .{ "GetClipboardViewer", MethodRecord{ .library = "USER32", .import = "GetClipboardViewer", .signature = "\x00\x00\x11\x25" } },
    .{ "ChangeClipboardChain", MethodRecord{ .library = "USER32", .import = "ChangeClipboardChain", .signature = "\x00\x02\x11\x59\x11\x25\x11\x25" } },
    .{ "SetClipboardData", MethodRecord{ .library = "USER32", .import = "SetClipboardData", .signature = "\x00\x02\x11\x80\x85\x09\x11\x80\x85" } },
    .{ "GetClipboardData", MethodRecord{ .library = "USER32", .import = "GetClipboardData", .signature = "\x00\x01\x11\x80\x85\x09" } },
    .{ "RegisterClipboardFormatA", MethodRecord{ .library = "USER32", .import = "RegisterClipboardFormatA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "RegisterClipboardFormatW", MethodRecord{ .library = "USER32", .import = "RegisterClipboardFormatW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "CountClipboardFormats", MethodRecord{ .library = "USER32", .import = "CountClipboardFormats", .signature = "\x00\x00\x08" } },
    .{ "EnumClipboardFormats", MethodRecord{ .library = "USER32", .import = "EnumClipboardFormats", .signature = "\x00\x01\x09\x09" } },
    .{ "GetClipboardFormatNameA", MethodRecord{ .library = "USER32", .import = "GetClipboardFormatNameA", .signature = "\x00\x03\x08\x09\x11\x3d\x08" } },
    .{ "GetClipboardFormatNameW", MethodRecord{ .library = "USER32", .import = "GetClipboardFormatNameW", .signature = "\x00\x03\x08\x09\x11\x05\x08" } },
    .{ "EmptyClipboard", MethodRecord{ .library = "USER32", .import = "EmptyClipboard", .signature = "\x00\x00\x11\x59" } },
    .{ "IsClipboardFormatAvailable", MethodRecord{ .library = "USER32", .import = "IsClipboardFormatAvailable", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "GetPriorityClipboardFormat", MethodRecord{ .library = "USER32", .import = "GetPriorityClipboardFormat", .signature = "\x00\x02\x08\x0f\x09\x08" } },
    .{ "GetOpenClipboardWindow", MethodRecord{ .library = "USER32", .import = "GetOpenClipboardWindow", .signature = "\x00\x00\x11\x25" } },
    .{ "AddClipboardFormatListener", MethodRecord{ .library = "USER32", .import = "AddClipboardFormatListener", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "RemoveClipboardFormatListener", MethodRecord{ .library = "USER32", .import = "RemoveClipboardFormatListener", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "GetUpdatedClipboardFormats", MethodRecord{ .library = "USER32", .import = "GetUpdatedClipboardFormats", .signature = "\x00\x03\x11\x59\x0f\x09\x09\x0f\x09" } },
    .{ "GlobalDeleteAtom", MethodRecord{ .library = "KERNEL32", .import = "GlobalDeleteAtom", .signature = "\x00\x01\x07\x07" } },
    .{ "InitAtomTable", MethodRecord{ .library = "KERNEL32", .import = "InitAtomTable", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "DeleteAtom", MethodRecord{ .library = "KERNEL32", .import = "DeleteAtom", .signature = "\x00\x01\x07\x07" } },
    .{ "GlobalAddAtomA", MethodRecord{ .library = "KERNEL32", .import = "GlobalAddAtomA", .signature = "\x00\x01\x07\x11\x3d" } },
    .{ "GlobalAddAtomW", MethodRecord{ .library = "KERNEL32", .import = "GlobalAddAtomW", .signature = "\x00\x01\x07\x11\x05" } },
    .{ "GlobalAddAtomExA", MethodRecord{ .library = "KERNEL32", .import = "GlobalAddAtomExA", .signature = "\x00\x02\x07\x11\x3d\x09" } },
    .{ "GlobalAddAtomExW", MethodRecord{ .library = "KERNEL32", .import = "GlobalAddAtomExW", .signature = "\x00\x02\x07\x11\x05\x09" } },
    .{ "GlobalFindAtomA", MethodRecord{ .library = "KERNEL32", .import = "GlobalFindAtomA", .signature = "\x00\x01\x07\x11\x3d" } },
    .{ "GlobalFindAtomW", MethodRecord{ .library = "KERNEL32", .import = "GlobalFindAtomW", .signature = "\x00\x01\x07\x11\x05" } },
    .{ "GlobalGetAtomNameA", MethodRecord{ .library = "KERNEL32", .import = "GlobalGetAtomNameA", .signature = "\x00\x03\x09\x07\x11\x3d\x08" } },
    .{ "GlobalGetAtomNameW", MethodRecord{ .library = "KERNEL32", .import = "GlobalGetAtomNameW", .signature = "\x00\x03\x09\x07\x11\x05\x08" } },
    .{ "AddAtomA", MethodRecord{ .library = "KERNEL32", .import = "AddAtomA", .signature = "\x00\x01\x07\x11\x3d" } },
    .{ "AddAtomW", MethodRecord{ .library = "KERNEL32", .import = "AddAtomW", .signature = "\x00\x01\x07\x11\x05" } },
    .{ "FindAtomA", MethodRecord{ .library = "KERNEL32", .import = "FindAtomA", .signature = "\x00\x01\x07\x11\x3d" } },
    .{ "FindAtomW", MethodRecord{ .library = "KERNEL32", .import = "FindAtomW", .signature = "\x00\x01\x07\x11\x05" } },
    .{ "GetAtomNameA", MethodRecord{ .library = "KERNEL32", .import = "GetAtomNameA", .signature = "\x00\x03\x09\x07\x11\x3d\x08" } },
    .{ "GetAtomNameW", MethodRecord{ .library = "KERNEL32", .import = "GetAtomNameW", .signature = "\x00\x03\x09\x07\x11\x05\x08" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x35d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HDC" },
        0xe41 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HENHMETAFILE" },
        0x20a5 => TypeRefEntry{ .namespace = "Windows.Win32.System.DataExchange", .name = "DDE_ENABLE_CALLBACK_CMD" },
        0x20a9 => TypeRefEntry{ .namespace = "Windows.Win32.System.DataExchange", .name = "DDE_INITIALIZE_COMMAND" },
        0x20ad => TypeRefEntry{ .namespace = "Windows.Win32.System.DataExchange", .name = "DDE_NAME_SERVICE_CMD" },
        0x20b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.DataExchange", .name = "DDE_CLIENT_TRANSACTION_TYPE" },
        0x40a5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_QUALITY_OF_SERVICE" },
        0x40a9 => TypeRefEntry{ .namespace = "Windows.Win32.System.DataExchange", .name = "PFNCALLBACK" },
        0x40ad => TypeRefEntry{ .namespace = "Windows.Win32.System.DataExchange", .name = "HCONVLIST" },
        0x40b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.DataExchange", .name = "HSZ" },
        0x40b5 => TypeRefEntry{ .namespace = "Windows.Win32.System.DataExchange", .name = "CONVCONTEXT" },
        0x40b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.DataExchange", .name = "HCONV" },
        0x40bd => TypeRefEntry{ .namespace = "Windows.Win32.System.DataExchange", .name = "CONVINFO" },
        0x40c1 => TypeRefEntry{ .namespace = "Windows.Win32.System.DataExchange", .name = "HDDEDATA" },
        0x40c5 => TypeRefEntry{ .namespace = "Windows.Win32.System.DataExchange", .name = "METAFILEPICT" },
        else => null,
    };
}

pub const EC_ENABLEALL = 0;
pub const EC_ENABLEONE = 128;
pub const EC_DISABLE = 8;
pub const EC_QUERYWAITING = 2;
pub const APPCLASS_MONITOR = 1;
pub const APPCLASS_STANDARD = 0;
pub const APPCMD_CLIENTONLY = 16;
pub const APPCMD_FILTERINITS = 32;
pub const CBF_FAIL_ALLSVRXACTIONS = 258048;
pub const CBF_FAIL_ADVISES = 16384;
pub const CBF_FAIL_CONNECTIONS = 8192;
pub const CBF_FAIL_EXECUTES = 32768;
pub const CBF_FAIL_POKES = 65536;
pub const CBF_FAIL_REQUESTS = 131072;
pub const CBF_FAIL_SELFCONNECTIONS = 4096;
pub const CBF_SKIP_ALLNOTIFICATIONS = 3932160;
pub const CBF_SKIP_CONNECT_CONFIRMS = 262144;
pub const CBF_SKIP_DISCONNECTS = 2097152;
pub const CBF_SKIP_REGISTRATIONS = 524288;
pub const CBF_SKIP_UNREGISTRATIONS = 1048576;
pub const MF_CALLBACKS = 134217728;
pub const MF_CONV = 1073741824;
pub const MF_ERRORS = 268435456;
pub const MF_HSZ_INFO = 16777216;
pub const MF_LINKS = 536870912;
pub const MF_POSTMSGS = 67108864;
pub const MF_SENDMSGS = 33554432;
pub const DNS_REGISTER = 1;
pub const DNS_UNREGISTER = 2;
pub const DNS_FILTERON = 4;
pub const DNS_FILTEROFF = 8;
pub const XTYP_ADVSTART = 4144;
pub const XTYP_ADVSTOP = 32832;
pub const XTYP_EXECUTE = 16464;
pub const XTYP_POKE = 16528;
pub const XTYP_REQUEST = 8368;
pub const XTYP_ADVDATA = 16400;
pub const XTYP_ADVREQ = 8226;
pub const XTYP_CONNECT = 4194;
pub const XTYP_CONNECT_CONFIRM = 32882;
pub const XTYP_DISCONNECT = 32962;
pub const XTYP_MONITOR = 33010;
pub const XTYP_REGISTER = 32930;
pub const XTYP_UNREGISTER = 32978;
pub const XTYP_WILDCONNECT = 8418;
pub const XTYP_XACT_COMPLETE = 32896;
pub const XST_ADVACKRCVD = 13;
pub const XST_ADVDATAACKRCVD = 16;
pub const XST_ADVDATASENT = 15;
pub const XST_ADVSENT = 11;
pub const XST_CONNECTED = 2;
pub const XST_DATARCVD = 6;
pub const XST_EXECACKRCVD = 10;
pub const XST_EXECSENT = 9;
pub const XST_INCOMPLETE = 1;
pub const XST_INIT1 = 3;
pub const XST_INIT2 = 4;
pub const XST_NULL = 0;
pub const XST_POKEACKRCVD = 8;
pub const XST_POKESENT = 7;
pub const XST_REQSENT = 5;
pub const XST_UNADVACKRCVD = 14;
pub const XST_UNADVSENT = 12;
pub const ST_ADVISE = 2;
pub const ST_BLOCKED = 8;
pub const ST_BLOCKNEXT = 128;
pub const ST_CLIENT = 16;
pub const ST_CONNECTED = 1;
pub const ST_INLIST = 64;
pub const ST_ISLOCAL = 4;
pub const ST_ISSELF = 256;
pub const ST_TERMINATED = 32;
pub const WM_DDE_FIRST = 992;
pub const WM_DDE_INITIATE = 992;
pub const WM_DDE_TERMINATE = 993;
pub const WM_DDE_ADVISE = 994;
pub const WM_DDE_UNADVISE = 995;
pub const WM_DDE_ACK = 996;
pub const WM_DDE_DATA = 997;
pub const WM_DDE_REQUEST = 998;
pub const WM_DDE_POKE = 999;
pub const WM_DDE_EXECUTE = 1000;
pub const WM_DDE_LAST = 1000;
pub const CADV_LATEACK = 65535;
pub const DDE_FACK = 32768;
pub const DDE_FBUSY = 16384;
pub const DDE_FDEFERUPD = 16384;
pub const DDE_FACKREQ = 32768;
pub const DDE_FRELEASE = 8192;
pub const DDE_FREQUESTED = 4096;
pub const DDE_FAPPSTATUS = 255;
pub const DDE_FNOTPROCESSED = 0;
pub const MSGF_DDEMGR = 32769;
pub const CP_WINANSI = 1004;
pub const CP_WINUNICODE = 1200;
pub const CP_WINNEUTRAL = 1200;
pub const XTYPF_NOBLOCK = 2;
pub const XTYPF_NODATA = 4;
pub const XTYPF_ACKREQ = 8;
pub const XCLASS_MASK = 64512;
pub const XCLASS_BOOL = 4096;
pub const XCLASS_DATA = 8192;
pub const XCLASS_FLAGS = 16384;
pub const XCLASS_NOTIFICATION = 32768;
pub const XTYP_MASK = 240;
pub const XTYP_SHIFT = 4;
pub const TIMEOUT_ASYNC = 4294967295;
pub const QID_SYNC = 4294967295;
pub const APPCMD_MASK = 4080;
pub const APPCLASS_MASK = 15;
pub const HDATA_APPOWNED = 1;
pub const DMLERR_NO_ERROR = 0;
pub const DMLERR_FIRST = 16384;
pub const DMLERR_ADVACKTIMEOUT = 16384;
pub const DMLERR_BUSY = 16385;
pub const DMLERR_DATAACKTIMEOUT = 16386;
pub const DMLERR_DLL_NOT_INITIALIZED = 16387;
pub const DMLERR_DLL_USAGE = 16388;
pub const DMLERR_EXECACKTIMEOUT = 16389;
pub const DMLERR_INVALIDPARAMETER = 16390;
pub const DMLERR_LOW_MEMORY = 16391;
pub const DMLERR_MEMORY_ERROR = 16392;
pub const DMLERR_NOTPROCESSED = 16393;
pub const DMLERR_NO_CONV_ESTABLISHED = 16394;
pub const DMLERR_POKEACKTIMEOUT = 16395;
pub const DMLERR_POSTMSG_FAILED = 16396;
pub const DMLERR_REENTRANCY = 16397;
pub const DMLERR_SERVER_DIED = 16398;
pub const DMLERR_SYS_ERROR = 16399;
pub const DMLERR_UNADVACKTIMEOUT = 16400;
pub const DMLERR_UNFOUND_QUEUE_ID = 16401;
pub const DMLERR_LAST = 16401;
pub const MH_CREATE = 1;
pub const MH_KEEP = 2;
pub const MH_DELETE = 3;
pub const MH_CLEANUP = 4;
pub const MAX_MONITORS = 4;
pub const MF_MASK = 4278190080;

pub const aliases = struct {
    pub const DDE_ENABLE_CALLBACK_CMD = u32;
    pub const DDE_INITIALIZE_COMMAND = u32;
    pub const DDE_NAME_SERVICE_CMD = u32;
    pub const DDE_CLIENT_TRANSACTION_TYPE = u32;
    pub const CONVINFO_CONVERSATION_STATE = u32;
    pub const CONVINFO_STATUS = u32;
};
