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
    .{ "WNetAddConnectionA", MethodRecord{ .library = "MPR", .import = "WNetAddConnectionA", .signature = "\x00\x03\x11\x81\x01\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "WNetAddConnectionW", MethodRecord{ .library = "MPR", .import = "WNetAddConnectionW", .signature = "\x00\x03\x11\x81\x01\x11\x05\x11\x05\x11\x05" } },
    .{ "WNetAddConnection2A", MethodRecord{ .library = "MPR", .import = "WNetAddConnection2A", .signature = "\x00\x04\x11\x81\x01\x0f\x11\xbb\x49\x11\x3d\x11\x3d\x11\x99\x15" } },
    .{ "WNetAddConnection2W", MethodRecord{ .library = "MPR", .import = "WNetAddConnection2W", .signature = "\x00\x04\x11\x81\x01\x0f\x11\xbb\x4d\x11\x05\x11\x05\x11\x99\x15" } },
    .{ "WNetAddConnection3A", MethodRecord{ .library = "MPR", .import = "WNetAddConnection3A", .signature = "\x00\x05\x11\x81\x01\x11\x25\x0f\x11\xbb\x49\x11\x3d\x11\x3d\x11\x99\x15" } },
    .{ "WNetAddConnection3W", MethodRecord{ .library = "MPR", .import = "WNetAddConnection3W", .signature = "\x00\x05\x11\x81\x01\x11\x25\x0f\x11\xbb\x4d\x11\x05\x11\x05\x11\x99\x15" } },
    .{ "WNetAddConnection4A", MethodRecord{ .library = "MPR", .import = "WNetAddConnection4A", .signature = "\x00\x07\x11\x81\x01\x11\x25\x0f\x11\xbb\x49\x0f\x01\x09\x11\x99\x15\x0f\x05\x09" } },
    .{ "WNetAddConnection4W", MethodRecord{ .library = "MPR", .import = "WNetAddConnection4W", .signature = "\x00\x07\x11\x81\x01\x11\x25\x0f\x11\xbb\x4d\x0f\x01\x09\x11\x99\x15\x0f\x05\x09" } },
    .{ "WNetCancelConnectionA", MethodRecord{ .library = "MPR", .import = "WNetCancelConnectionA", .signature = "\x00\x02\x11\x81\x01\x11\x3d\x11\x59" } },
    .{ "WNetCancelConnectionW", MethodRecord{ .library = "MPR", .import = "WNetCancelConnectionW", .signature = "\x00\x02\x11\x81\x01\x11\x05\x11\x59" } },
    .{ "WNetCancelConnection2A", MethodRecord{ .library = "MPR", .import = "WNetCancelConnection2A", .signature = "\x00\x03\x11\x81\x01\x11\x3d\x11\x99\x15\x11\x59" } },
    .{ "WNetCancelConnection2W", MethodRecord{ .library = "MPR", .import = "WNetCancelConnection2W", .signature = "\x00\x03\x11\x81\x01\x11\x05\x11\x99\x15\x11\x59" } },
    .{ "WNetGetConnectionA", MethodRecord{ .library = "MPR", .import = "WNetGetConnectionA", .signature = "\x00\x03\x11\x81\x01\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "WNetGetConnectionW", MethodRecord{ .library = "MPR", .import = "WNetGetConnectionW", .signature = "\x00\x03\x11\x81\x01\x11\x05\x11\x05\x0f\x09" } },
    .{ "WNetUseConnectionA", MethodRecord{ .library = "MPR", .import = "WNetUseConnectionA", .signature = "\x00\x08\x11\x81\x01\x11\x25\x0f\x11\xbb\x49\x11\x3d\x11\x3d\x11\x99\x15\x11\x3d\x0f\x09\x0f\x09" } },
    .{ "WNetUseConnectionW", MethodRecord{ .library = "MPR", .import = "WNetUseConnectionW", .signature = "\x00\x08\x11\x81\x01\x11\x25\x0f\x11\xbb\x4d\x11\x05\x11\x05\x11\x99\x15\x11\x05\x0f\x09\x0f\x09" } },
    .{ "WNetUseConnection4A", MethodRecord{ .library = "MPR", .import = "WNetUseConnection4A", .signature = "\x00\x0a\x11\x81\x01\x11\x25\x0f\x11\xbb\x49\x0f\x01\x09\x09\x0f\x05\x09\x11\x3d\x0f\x09\x0f\x09" } },
    .{ "WNetUseConnection4W", MethodRecord{ .library = "MPR", .import = "WNetUseConnection4W", .signature = "\x00\x0a\x11\x81\x01\x11\x25\x0f\x11\xbb\x4d\x0f\x01\x09\x09\x0f\x05\x09\x11\x05\x0f\x09\x0f\x09" } },
    .{ "WNetConnectionDialog", MethodRecord{ .library = "MPR", .import = "WNetConnectionDialog", .signature = "\x00\x02\x11\x81\x01\x11\x25\x09" } },
    .{ "WNetDisconnectDialog", MethodRecord{ .library = "MPR", .import = "WNetDisconnectDialog", .signature = "\x00\x02\x11\x81\x01\x11\x25\x09" } },
    .{ "WNetConnectionDialog1A", MethodRecord{ .library = "MPR", .import = "WNetConnectionDialog1A", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xbb\x51" } },
    .{ "WNetConnectionDialog1W", MethodRecord{ .library = "MPR", .import = "WNetConnectionDialog1W", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xbb\x55" } },
    .{ "WNetDisconnectDialog1A", MethodRecord{ .library = "MPR", .import = "WNetDisconnectDialog1A", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xbb\x59" } },
    .{ "WNetDisconnectDialog1W", MethodRecord{ .library = "MPR", .import = "WNetDisconnectDialog1W", .signature = "\x00\x01\x11\x81\x01\x0f\x11\xbb\x5d" } },
    .{ "WNetOpenEnumA", MethodRecord{ .library = "MPR", .import = "WNetOpenEnumA", .signature = "\x00\x05\x11\x81\x01\x11\x99\x29\x11\x99\x21\x11\x99\x11\x0f\x11\xbb\x49\x0f\x11\x80\x85" } },
    .{ "WNetOpenEnumW", MethodRecord{ .library = "MPR", .import = "WNetOpenEnumW", .signature = "\x00\x05\x11\x81\x01\x11\x99\x29\x11\x99\x21\x11\x99\x11\x0f\x11\xbb\x4d\x0f\x11\x80\x85" } },
    .{ "WNetEnumResourceA", MethodRecord{ .library = "MPR", .import = "WNetEnumResourceA", .signature = "\x00\x04\x11\x81\x01\x11\x80\x85\x0f\x09\x0f\x01\x0f\x09" } },
    .{ "WNetEnumResourceW", MethodRecord{ .library = "MPR", .import = "WNetEnumResourceW", .signature = "\x00\x04\x11\x81\x01\x11\x80\x85\x0f\x09\x0f\x01\x0f\x09" } },
    .{ "WNetCloseEnum", MethodRecord{ .library = "MPR", .import = "WNetCloseEnum", .signature = "\x00\x01\x11\x81\x01\x11\x80\x85" } },
    .{ "WNetGetResourceParentA", MethodRecord{ .library = "MPR", .import = "WNetGetResourceParentA", .signature = "\x00\x03\x11\x81\x01\x0f\x11\xbb\x49\x0f\x01\x0f\x09" } },
    .{ "WNetGetResourceParentW", MethodRecord{ .library = "MPR", .import = "WNetGetResourceParentW", .signature = "\x00\x03\x11\x81\x01\x0f\x11\xbb\x4d\x0f\x01\x0f\x09" } },
    .{ "WNetGetResourceInformationA", MethodRecord{ .library = "MPR", .import = "WNetGetResourceInformationA", .signature = "\x00\x04\x11\x81\x01\x0f\x11\xbb\x49\x0f\x01\x0f\x09\x0f\x11\x3d" } },
    .{ "WNetGetResourceInformationW", MethodRecord{ .library = "MPR", .import = "WNetGetResourceInformationW", .signature = "\x00\x04\x11\x81\x01\x0f\x11\xbb\x4d\x0f\x01\x0f\x09\x0f\x11\x05" } },
    .{ "WNetGetUniversalNameA", MethodRecord{ .library = "MPR", .import = "WNetGetUniversalNameA", .signature = "\x00\x04\x11\x81\x01\x11\x3d\x11\x99\x09\x0f\x01\x0f\x09" } },
    .{ "WNetGetUniversalNameW", MethodRecord{ .library = "MPR", .import = "WNetGetUniversalNameW", .signature = "\x00\x04\x11\x81\x01\x11\x05\x11\x99\x09\x0f\x01\x0f\x09" } },
    .{ "WNetGetUserA", MethodRecord{ .library = "MPR", .import = "WNetGetUserA", .signature = "\x00\x03\x11\x81\x01\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "WNetGetUserW", MethodRecord{ .library = "MPR", .import = "WNetGetUserW", .signature = "\x00\x03\x11\x81\x01\x11\x05\x11\x05\x0f\x09" } },
    .{ "WNetGetProviderNameA", MethodRecord{ .library = "MPR", .import = "WNetGetProviderNameA", .signature = "\x00\x03\x11\x81\x01\x09\x11\x3d\x0f\x09" } },
    .{ "WNetGetProviderNameW", MethodRecord{ .library = "MPR", .import = "WNetGetProviderNameW", .signature = "\x00\x03\x11\x81\x01\x09\x11\x05\x0f\x09" } },
    .{ "WNetGetNetworkInformationA", MethodRecord{ .library = "MPR", .import = "WNetGetNetworkInformationA", .signature = "\x00\x02\x11\x81\x01\x11\x3d\x0f\x11\xbb\x61" } },
    .{ "WNetGetNetworkInformationW", MethodRecord{ .library = "MPR", .import = "WNetGetNetworkInformationW", .signature = "\x00\x02\x11\x81\x01\x11\x05\x0f\x11\xbb\x61" } },
    .{ "WNetGetLastErrorA", MethodRecord{ .library = "MPR", .import = "WNetGetLastErrorA", .signature = "\x00\x05\x11\x81\x01\x0f\x09\x11\x3d\x09\x11\x3d\x09" } },
    .{ "WNetGetLastErrorW", MethodRecord{ .library = "MPR", .import = "WNetGetLastErrorW", .signature = "\x00\x05\x11\x81\x01\x0f\x09\x11\x05\x09\x11\x05\x09" } },
    .{ "MultinetGetConnectionPerformanceA", MethodRecord{ .library = "MPR", .import = "MultinetGetConnectionPerformanceA", .signature = "\x00\x02\x09\x0f\x11\xbb\x49\x0f\x11\xbb\x65" } },
    .{ "MultinetGetConnectionPerformanceW", MethodRecord{ .library = "MPR", .import = "MultinetGetConnectionPerformanceW", .signature = "\x00\x02\x09\x0f\x11\xbb\x4d\x0f\x11\xbb\x65" } },
    .{ "NPAddConnection", MethodRecord{ .library = "davclnt", .import = "NPAddConnection", .signature = "\x00\x03\x09\x0f\x11\xbb\x4d\x11\x05\x11\x05" } },
    .{ "NPAddConnection3", MethodRecord{ .library = "davclnt", .import = "NPAddConnection3", .signature = "\x00\x05\x09\x11\x25\x0f\x11\xbb\x4d\x11\x05\x11\x05\x11\x99\x15" } },
    .{ "NPAddConnection4", MethodRecord{ .library = "NTLANMAN", .import = "NPAddConnection4", .signature = "\x00\x07\x09\x11\x25\x0f\x11\xbb\x4d\x0f\x01\x09\x09\x0f\x05\x09" } },
    .{ "NPCancelConnection", MethodRecord{ .library = "davclnt", .import = "NPCancelConnection", .signature = "\x00\x02\x09\x11\x05\x11\x59" } },
    .{ "NPCancelConnection2", MethodRecord{ .library = "NTLANMAN", .import = "NPCancelConnection2", .signature = "\x00\x03\x09\x11\x05\x11\x59\x09" } },
    .{ "NPGetConnection", MethodRecord{ .library = "davclnt", .import = "NPGetConnection", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "NPGetConnection3", MethodRecord{ .library = "NTLANMAN", .import = "NPGetConnection3", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x01\x0f\x09" } },
    .{ "NPGetUniversalName", MethodRecord{ .library = "davclnt", .import = "NPGetUniversalName", .signature = "\x00\x04\x09\x11\x05\x11\x99\x09\x0f\x01\x0f\x09" } },
    .{ "NPGetConnectionPerformance", MethodRecord{ .library = "NTLANMAN", .import = "NPGetConnectionPerformance", .signature = "\x00\x02\x09\x11\x05\x0f\x11\xbb\x65" } },
    .{ "NPOpenEnum", MethodRecord{ .library = "davclnt", .import = "NPOpenEnum", .signature = "\x00\x05\x09\x09\x09\x09\x0f\x11\xbb\x4d\x0f\x11\x80\x85" } },
    .{ "NPEnumResource", MethodRecord{ .library = "davclnt", .import = "NPEnumResource", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x09\x0f\x01\x0f\x09" } },
    .{ "NPCloseEnum", MethodRecord{ .library = "davclnt", .import = "NPCloseEnum", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "NPGetCaps", MethodRecord{ .library = "davclnt", .import = "NPGetCaps", .signature = "\x00\x01\x09\x09" } },
    .{ "NPGetUser", MethodRecord{ .library = "davclnt", .import = "NPGetUser", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "NPGetPersistentUseOptionsForConnection", MethodRecord{ .library = "NTLANMAN", .import = "NPGetPersistentUseOptionsForConnection", .signature = "\x00\x05\x09\x11\x05\x0f\x05\x09\x0f\x05\x0f\x09" } },
    .{ "NPGetResourceParent", MethodRecord{ .library = "davclnt", .import = "NPGetResourceParent", .signature = "\x00\x03\x09\x0f\x11\xbb\x4d\x0f\x01\x0f\x09" } },
    .{ "NPGetResourceInformation", MethodRecord{ .library = "davclnt", .import = "NPGetResourceInformation", .signature = "\x00\x04\x09\x0f\x11\xbb\x4d\x0f\x01\x0f\x09\x0f\x11\x05" } },
    .{ "NPFormatNetworkName", MethodRecord{ .library = "davclnt", .import = "NPFormatNetworkName", .signature = "\x00\x05\x09\x11\x05\x11\x05\x0f\x09\x11\x99\x25\x09" } },
    .{ "WNetSetLastErrorA", MethodRecord{ .library = "MPR", .import = "WNetSetLastErrorA", .signature = "\x00\x03\x01\x09\x11\x3d\x11\x3d" } },
    .{ "WNetSetLastErrorW", MethodRecord{ .library = "MPR", .import = "WNetSetLastErrorW", .signature = "\x00\x03\x01\x09\x11\x05\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x1909 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WNet", .name = "UNC_INFO_LEVEL" },
        0x1911 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WNet", .name = "WNET_OPEN_ENUM_USAGE" },
        0x1915 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WNet", .name = "NET_CONNECT_FLAGS" },
        0x1921 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WNet", .name = "NET_RESOURCE_TYPE" },
        0x1925 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WNet", .name = "NETWORK_NAME_FORMAT_FLAGS" },
        0x1929 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WNet", .name = "NET_RESOURCE_SCOPE" },
        0x3b49 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WNet", .name = "NETRESOURCEA" },
        0x3b4d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WNet", .name = "NETRESOURCEW" },
        0x3b51 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WNet", .name = "CONNECTDLGSTRUCTA" },
        0x3b55 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WNet", .name = "CONNECTDLGSTRUCTW" },
        0x3b59 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WNet", .name = "DISCDLGSTRUCTA" },
        0x3b5d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WNet", .name = "DISCDLGSTRUCTW" },
        0x3b61 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WNet", .name = "NETINFOSTRUCT" },
        0x3b65 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WNet", .name = "NETCONNECTINFOSTRUCT" },
        else => null,
    };
}

pub const UNIVERSAL_NAME_INFO_LEVEL = 1;
pub const REMOTE_NAME_INFO_LEVEL = 2;
pub const WNPERM_DLG_PERM = 0;
pub const WNPERM_DLG_AUDIT = 1;
pub const WNPERM_DLG_OWNER = 2;
pub const RESOURCEUSAGE_NONE = 0;
pub const RESOURCEUSAGE_CONNECTABLE = 1;
pub const RESOURCEUSAGE_CONTAINER = 2;
pub const RESOURCEUSAGE_ATTACHED = 16;
pub const RESOURCEUSAGE_ALL = 19;
pub const CONNECT_UPDATE_PROFILE = 1;
pub const CONNECT_UPDATE_RECENT = 2;
pub const CONNECT_TEMPORARY = 4;
pub const CONNECT_INTERACTIVE = 8;
pub const CONNECT_PROMPT = 16;
pub const CONNECT_NEED_DRIVE = 32;
pub const CONNECT_REFCOUNT = 64;
pub const CONNECT_REDIRECT = 128;
pub const CONNECT_LOCALDRIVE = 256;
pub const CONNECT_CURRENT_MEDIA = 512;
pub const CONNECT_DEFERRED = 1024;
pub const CONNECT_RESERVED = 4278190080;
pub const CONNECT_COMMANDLINE = 2048;
pub const CONNECT_CMD_SAVECRED = 4096;
pub const CONNECT_CRED_RESET = 8192;
pub const CONNECT_REQUIRE_INTEGRITY = 16384;
pub const CONNECT_REQUIRE_PRIVACY = 32768;
pub const CONNECT_WRITE_THROUGH_SEMANTICS = 65536;
pub const CONNECT_GLOBAL_MAPPING = 262144;
pub const WNPS_FILE = 0;
pub const WNPS_DIR = 1;
pub const WNPS_MULT = 2;
pub const WNDN_MKDIR = 1;
pub const WNDN_RMDIR = 2;
pub const WNDN_MVDIR = 3;
pub const RESOURCETYPE_ANY = 0;
pub const RESOURCETYPE_DISK = 1;
pub const RESOURCETYPE_PRINT = 2;
pub const WNFMT_MULTILINE = 1;
pub const WNFMT_ABBREVIATED = 2;
pub const RESOURCE_CONNECTED = 1;
pub const RESOURCE_CONTEXT = 5;
pub const RESOURCE_GLOBALNET = 2;
pub const RESOURCE_REMEMBERED = 3;
pub const NETINFO_DLL16 = 1;
pub const NETINFO_DISKRED = 4;
pub const NETINFO_PRINTERRED = 8;
pub const CONNDLG_RO_PATH = 1;
pub const CONNDLG_CONN_POINT = 2;
pub const CONNDLG_USE_MRU = 4;
pub const CONNDLG_HIDE_BOX = 8;
pub const CONNDLG_PERSIST = 16;
pub const CONNDLG_NOT_PERSIST = 32;
pub const DISC_UPDATE_PROFILE = 1;
pub const DISC_NO_FORCE = 64;
pub const WNGETCON_CONNECTED = 0;
pub const WNGETCON_DISCONNECTED = 1;
pub const WNNC_SPEC_VERSION = 1;
pub const WNNC_SPEC_VERSION51 = 327681;
pub const WNNC_NET_TYPE = 2;
pub const WNNC_NET_NONE = 0;
pub const WNNC_DRIVER_VERSION = 3;
pub const WNNC_USER = 4;
pub const WNNC_USR_GETUSER = 1;
pub const WNNC_CONNECTION = 6;
pub const WNNC_CON_ADDCONNECTION = 1;
pub const WNNC_CON_CANCELCONNECTION = 2;
pub const WNNC_CON_GETCONNECTIONS = 4;
pub const WNNC_CON_ADDCONNECTION3 = 8;
pub const WNNC_CON_ADDCONNECTION4 = 16;
pub const WNNC_CON_CANCELCONNECTION2 = 32;
pub const WNNC_CON_GETPERFORMANCE = 64;
pub const WNNC_CON_DEFER = 128;
pub const WNNC_DIALOG = 8;
pub const WNNC_DLG_DEVICEMODE = 1;
pub const WNNC_DLG_PROPERTYDIALOG = 32;
pub const WNNC_DLG_SEARCHDIALOG = 64;
pub const WNNC_DLG_FORMATNETWORKNAME = 128;
pub const WNNC_DLG_PERMISSIONEDITOR = 256;
pub const WNNC_DLG_GETRESOURCEPARENT = 512;
pub const WNNC_DLG_GETRESOURCEINFORMATION = 2048;
pub const WNNC_ADMIN = 9;
pub const WNNC_ADM_GETDIRECTORYTYPE = 1;
pub const WNNC_ADM_DIRECTORYNOTIFY = 2;
pub const WNNC_ENUMERATION = 11;
pub const WNNC_ENUM_GLOBAL = 1;
pub const WNNC_ENUM_LOCAL = 2;
pub const WNNC_ENUM_CONTEXT = 4;
pub const WNNC_ENUM_SHAREABLE = 8;
pub const WNNC_START = 12;
pub const WNNC_WAIT_FOR_START = 1;
pub const WNNC_CONNECTION_FLAGS = 13;
pub const WNTYPE_DRIVE = 1;
pub const WNTYPE_FILE = 2;
pub const WNTYPE_PRINTER = 3;
pub const WNTYPE_COMM = 4;
pub const WNSRCH_REFRESH_FIRST_LEVEL = 1;
pub const WNDT_NORMAL = 0;
pub const WNDT_NETWORK = 1;
pub const WN_NETWORK_CLASS = 1;
pub const WN_CREDENTIAL_CLASS = 2;
pub const WN_PRIMARY_AUTHENT_CLASS = 4;
pub const WN_SERVICE_CLASS = 8;
pub const WN_VALID_LOGON_ACCOUNT = 1;
pub const WN_NT_PASSWORD_CHANGED = 2;
pub const NOTIFY_PRE = 1;
pub const NOTIFY_POST = 2;
pub const WNPERMC_PERM = 1;
pub const WNPERMC_AUDIT = 2;
pub const WNPERMC_OWNER = 4;
pub const RESOURCE_RECENT = 4;
pub const RESOURCETYPE_RESERVED = 8;
pub const RESOURCETYPE_UNKNOWN = 4294967295;
pub const RESOURCEUSAGE_NOLOCALDEVICE = 4;
pub const RESOURCEUSAGE_SIBLING = 8;
pub const RESOURCEUSAGE_RESERVED = 2147483648;
pub const RESOURCEDISPLAYTYPE_NETWORK = 6;
pub const RESOURCEDISPLAYTYPE_ROOT = 7;
pub const RESOURCEDISPLAYTYPE_SHAREADMIN = 8;
pub const RESOURCEDISPLAYTYPE_DIRECTORY = 9;
pub const RESOURCEDISPLAYTYPE_NDSCONTAINER = 11;
pub const NETPROPERTY_PERSISTENT = 1;
pub const WNFMT_INENUM = 16;
pub const WNFMT_CONNECTION = 32;
pub const WNCON_FORNETCARD = 1;
pub const WNCON_NOTROUTED = 2;
pub const WNCON_SLOWLINK = 4;
pub const WNCON_DYNAMIC = 8;

pub const aliases = struct {
    pub const UNC_INFO_LEVEL = u32;
    pub const WNPERM_DLG = u32;
    pub const WNET_OPEN_ENUM_USAGE = u32;
    pub const NET_CONNECT_FLAGS = u32;
    pub const NP_PROPERTY_DIALOG_SELECTION = u32;
    pub const NPDIRECTORY_NOTIFY_OPERATION = u32;
    pub const NET_RESOURCE_TYPE = u32;
    pub const NETWORK_NAME_FORMAT_FLAGS = u32;
    pub const NET_RESOURCE_SCOPE = u32;
    pub const NETINFOSTRUCT_CHARACTERISTICS = u32;
    pub const CONNECTDLGSTRUCT_FLAGS = u32;
    pub const DISCDLGSTRUCT_FLAGS = u32;
};
