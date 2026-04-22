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
    .{ "RefreshPolicy", MethodRecord{ .library = "USERENV", .import = "RefreshPolicy", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "RefreshPolicyEx", MethodRecord{ .library = "USERENV", .import = "RefreshPolicyEx", .signature = "\x00\x02\x11\x59\x11\x59\x09" } },
    .{ "EnterCriticalPolicySection", MethodRecord{ .library = "USERENV", .import = "EnterCriticalPolicySection", .signature = "\x00\x01\x11\x80\x85\x11\x59" } },
    .{ "LeaveCriticalPolicySection", MethodRecord{ .library = "USERENV", .import = "LeaveCriticalPolicySection", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "RegisterGPNotification", MethodRecord{ .library = "USERENV", .import = "RegisterGPNotification", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x59" } },
    .{ "UnregisterGPNotification", MethodRecord{ .library = "USERENV", .import = "UnregisterGPNotification", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "GetGPOListA", MethodRecord{ .library = "USERENV", .import = "GetGPOListA", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x3d\x11\x3d\x11\x3d\x09\x0f\x0f\x11\xc0\x00\x41\xc1" } },
    .{ "GetGPOListW", MethodRecord{ .library = "USERENV", .import = "GetGPOListW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x05\x11\x05\x11\x05\x09\x0f\x0f\x11\xc0\x00\x41\xc5" } },
    .{ "FreeGPOListA", MethodRecord{ .library = "USERENV", .import = "FreeGPOListA", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x41\xc1" } },
    .{ "FreeGPOListW", MethodRecord{ .library = "USERENV", .import = "FreeGPOListW", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x41\xc5" } },
    .{ "GetAppliedGPOListA", MethodRecord{ .library = "USERENV", .import = "GetAppliedGPOListA", .signature = "\x00\x05\x09\x09\x11\x3d\x11\x81\x15\x0f\x11\x0d\x0f\x0f\x11\xc0\x00\x41\xc1" } },
    .{ "GetAppliedGPOListW", MethodRecord{ .library = "USERENV", .import = "GetAppliedGPOListW", .signature = "\x00\x05\x09\x09\x11\x05\x11\x81\x15\x0f\x11\x0d\x0f\x0f\x11\xc0\x00\x41\xc5" } },
    .{ "ProcessGroupPolicyCompleted", MethodRecord{ .library = "USERENV", .import = "ProcessGroupPolicyCompleted", .signature = "\x00\x03\x09\x0f\x11\x0d\x19\x09" } },
    .{ "ProcessGroupPolicyCompletedEx", MethodRecord{ .library = "USERENV", .import = "ProcessGroupPolicyCompletedEx", .signature = "\x00\x04\x09\x0f\x11\x0d\x19\x09\x11\x79" } },
    .{ "RsopAccessCheckByType", MethodRecord{ .library = "USERENV", .import = "RsopAccessCheckByType", .signature = "\x00\x0b\x11\x79\x11\x82\xad\x11\x81\x15\x0f\x01\x09\x0f\x11\x9d\x0d\x09\x0f\x11\x9d\x05\x0f\x11\x9d\x09\x0f\x09\x0f\x09\x0f\x11\x59" } },
    .{ "RsopFileAccessCheck", MethodRecord{ .library = "USERENV", .import = "RsopFileAccessCheck", .signature = "\x00\x05\x11\x79\x11\x05\x0f\x01\x09\x0f\x09\x0f\x11\x59" } },
    .{ "RsopSetPolicySettingStatus", MethodRecord{ .library = "USERENV", .import = "RsopSetPolicySettingStatus", .signature = "\x00\x05\x11\x79\x09\x12\xc0\x00\x41\xc9\x12\xc0\x00\x41\xcd\x09\x0f\x11\xc0\x00\x41\xd1" } },
    .{ "RsopResetPolicySettingStatus", MethodRecord{ .library = "USERENV", .import = "RsopResetPolicySettingStatus", .signature = "\x00\x03\x11\x79\x09\x12\xc0\x00\x41\xc9\x12\xc0\x00\x41\xcd" } },
    .{ "GenerateGPNotification", MethodRecord{ .library = "USERENV", .import = "GenerateGPNotification", .signature = "\x00\x03\x09\x11\x59\x11\x05\x09" } },
    .{ "InstallApplication", MethodRecord{ .library = "ADVAPI32", .import = "InstallApplication", .signature = "\x00\x01\x09\x0f\x11\xc0\x00\x41\xd5" } },
    .{ "UninstallApplication", MethodRecord{ .library = "ADVAPI32", .import = "UninstallApplication", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "CommandLineFromMsiDescriptor", MethodRecord{ .library = "ADVAPI32", .import = "CommandLineFromMsiDescriptor", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x09" } },
    .{ "GetManagedApplications", MethodRecord{ .library = "ADVAPI32", .import = "GetManagedApplications", .signature = "\x00\x05\x09\x0f\x11\x0d\x09\x09\x0f\x09\x0f\x0f\x11\xc0\x00\x41\xd9" } },
    .{ "GetLocalManagedApplications", MethodRecord{ .library = "ADVAPI32", .import = "GetLocalManagedApplications", .signature = "\x00\x03\x09\x11\x59\x0f\x09\x0f\x0f\x11\xc0\x00\x41\xdd" } },
    .{ "GetLocalManagedApplicationData", MethodRecord{ .library = "ADVAPI32", .import = "GetLocalManagedApplicationData", .signature = "\x00\x03\x01\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "GetManagedApplicationCategories", MethodRecord{ .library = "ADVAPI32", .import = "GetManagedApplicationCategories", .signature = "\x00\x02\x09\x09\x0f\x11\xc0\x00\x41\xe1" } },
    .{ "CreateGPOLink", MethodRecord{ .library = "GPEDIT", .import = "CreateGPOLink", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x11\x59" } },
    .{ "DeleteGPOLink", MethodRecord{ .library = "GPEDIT", .import = "DeleteGPOLink", .signature = "\x00\x02\x11\x79\x11\x05\x11\x05" } },
    .{ "DeleteAllGPOLinks", MethodRecord{ .library = "GPEDIT", .import = "DeleteAllGPOLinks", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "BrowseForGPO", MethodRecord{ .library = "GPEDIT", .import = "BrowseForGPO", .signature = "\x00\x01\x11\x79\x0f\x11\xc0\x00\x41\xe5" } },
    .{ "ImportRSoPData", MethodRecord{ .library = "GPEDIT", .import = "ImportRSoPData", .signature = "\x00\x02\x11\x79\x11\x05\x11\x05" } },
    .{ "ExportRSoPData", MethodRecord{ .library = "GPEDIT", .import = "ExportRSoPData", .signature = "\x00\x02\x11\x79\x11\x05\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x115 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSID" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x1d05 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "GENERIC_MAPPING" },
        0x1d09 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PRIVILEGE_SET" },
        0x1d0d => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "OBJECT_TYPE_LIST" },
        0x41c1 => TypeRefEntry{ .namespace = "Windows.Win32.System.GroupPolicy", .name = "GROUP_POLICY_OBJECTA" },
        0x41c5 => TypeRefEntry{ .namespace = "Windows.Win32.System.GroupPolicy", .name = "GROUP_POLICY_OBJECTW" },
        0x41c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Wmi", .name = "IWbemServices" },
        0x41cd => TypeRefEntry{ .namespace = "Windows.Win32.System.Wmi", .name = "IWbemClassObject" },
        0x41d1 => TypeRefEntry{ .namespace = "Windows.Win32.System.GroupPolicy", .name = "POLICYSETTINGSTATUSINFO" },
        0x41d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.GroupPolicy", .name = "INSTALLDATA" },
        0x41d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.GroupPolicy", .name = "MANAGEDAPPLICATION" },
        0x41dd => TypeRefEntry{ .namespace = "Windows.Win32.System.GroupPolicy", .name = "LOCALMANAGEDAPPLICATION" },
        0x41e1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "APPCATEGORYINFOLIST" },
        0x41e5 => TypeRefEntry{ .namespace = "Windows.Win32.System.GroupPolicy", .name = "GPOBROWSEINFO" },
        else => null,
    };
}

pub const GPO_OPEN_LOAD_REGISTRY = 1;
pub const GPO_OPEN_READ_ONLY = 2;
pub const GPO_OPTION_DISABLE_USER = 1;
pub const GPO_OPTION_DISABLE_MACHINE = 2;
pub const GPO_SECTION_ROOT = 0;
pub const GPO_SECTION_USER = 1;
pub const GPO_SECTION_MACHINE = 2;
pub const GPM_USE_PDC = 0;
pub const GPM_USE_ANYDC = 1;
pub const GPM_DONOTUSE_W2KDC = 2;
pub const GPM_DONOT_VALIDATEDC = 1;
pub const GPM_MIGRATIONTABLE_ONLY = 1;
pub const GPM_PROCESS_SECURITY = 2;
pub const RSOP_NO_COMPUTER = 65536;
pub const RSOP_NO_USER = 131072;
pub const RSOP_PLANNING_ASSUME_SLOW_LINK = 1;
pub const RSOP_PLANNING_ASSUME_LOOPBACK_MERGE = 2;
pub const RSOP_PLANNING_ASSUME_LOOPBACK_REPLACE = 4;
pub const RSOP_PLANNING_ASSUME_USER_WQLFILTER_TRUE = 8;
pub const RSOP_PLANNING_ASSUME_COMP_WQLFILTER_TRUE = 16;
pub const PI_NOUI = 1;
pub const PI_APPLYPOLICY = 2;
pub const PT_TEMPORARY = 1;
pub const PT_ROAMING = 2;
pub const PT_MANDATORY = 4;
pub const PT_ROAMING_PREEXISTING = 8;
pub const RP_FORCE = 1;
pub const RP_SYNC = 2;
pub const GPC_BLOCK_POLICY = 1;
pub const GPO_FLAG_DISABLE = 1;
pub const GPO_FLAG_FORCE = 2;
pub const GPO_LIST_FLAG_MACHINE = 1;
pub const GPO_LIST_FLAG_SITEONLY = 2;
pub const GPO_LIST_FLAG_NO_WMIFILTERS = 4;
pub const GPO_LIST_FLAG_NO_SECURITYFILTERS = 8;
pub const GPO_INFO_FLAG_MACHINE = 1;
pub const GPO_INFO_FLAG_BACKGROUND = 16;
pub const GPO_INFO_FLAG_SLOWLINK = 32;
pub const GPO_INFO_FLAG_VERBOSE = 64;
pub const GPO_INFO_FLAG_NOCHANGES = 128;
pub const GPO_INFO_FLAG_LINKTRANSITION = 256;
pub const GPO_INFO_FLAG_LOGRSOP_TRANSITION = 512;
pub const GPO_INFO_FLAG_FORCED_REFRESH = 1024;
pub const GPO_INFO_FLAG_SAFEMODE_BOOT = 2048;
pub const GPO_INFO_FLAG_ASYNC_FOREGROUND = 4096;
pub const FLAG_NO_GPO_FILTER = 2147483648;
pub const FLAG_NO_CSE_INVOKE = 1073741824;
pub const FLAG_ASSUME_SLOW_LINK = 536870912;
pub const FLAG_LOOPBACK_MERGE = 268435456;
pub const FLAG_LOOPBACK_REPLACE = 134217728;
pub const FLAG_ASSUME_USER_WQLFILTER_TRUE = 67108864;
pub const FLAG_ASSUME_COMP_WQLFILTER_TRUE = 33554432;
pub const FLAG_PLANNING_MODE = 16777216;
pub const FLAG_NO_USER = 1;
pub const FLAG_NO_COMPUTER = 2;
pub const FLAG_FORCE_CREATENAMESPACE = 4;
pub const RSOP_USER_ACCESS_DENIED = 1;
pub const RSOP_COMPUTER_ACCESS_DENIED = 2;
pub const RSOP_TEMPNAMESPACE_EXISTS = 4;
pub const LOCALSTATE_ASSIGNED = 1;
pub const LOCALSTATE_PUBLISHED = 2;
pub const LOCALSTATE_UNINSTALL_UNMANAGED = 4;
pub const LOCALSTATE_POLICYREMOVE_ORPHAN = 8;
pub const LOCALSTATE_POLICYREMOVE_UNINSTALL = 16;
pub const LOCALSTATE_ORPHANED = 32;
pub const LOCALSTATE_UNINSTALLED = 64;
pub const MANAGED_APPS_USERAPPLICATIONS = 1;
pub const MANAGED_APPS_FROMCATEGORY = 2;
pub const MANAGED_APPS_INFOLEVEL_DEFAULT = 65536;
pub const MANAGED_APPTYPE_WINDOWSINSTALLER = 1;
pub const MANAGED_APPTYPE_SETUPEXE = 2;
pub const MANAGED_APPTYPE_UNSUPPORTED = 3;
pub const RSOP_INFO_FLAG_DIAGNOSTIC_MODE = 1;
pub const GPO_BROWSE_DISABLENEW = 1;
pub const GPO_BROWSE_NOCOMPUTERS = 2;
pub const GPO_BROWSE_NODSGPOS = 4;
pub const GPO_BROWSE_OPENBUTTON = 8;
pub const GPO_BROWSE_INITTOALL = 16;
pub const GPO_BROWSE_NOUSERGPOS = 32;
pub const GPO_BROWSE_SENDAPPLYONEDIT = 64;
pub const rsopUnknown = 0;
pub const rsopPlanning = 1;
pub const rsopLogging = 2;
pub const permGPOApply = 65536;
pub const permGPORead = 65792;
pub const permGPOEdit = 65793;
pub const permGPOEditSecurityAndDelete = 65794;
pub const permGPOCustom = 65795;
pub const permWMIFilterEdit = 131072;
pub const permWMIFilterFullControl = 131073;
pub const permWMIFilterCustom = 131074;
pub const permSOMLink = 1835008;
pub const permSOMLogging = 1573120;
pub const permSOMPlanning = 1573376;
pub const permSOMWMICreate = 1049344;
pub const permSOMWMIFullControl = 1049345;
pub const permSOMGPOCreate = 1049600;
pub const permStarterGPORead = 197888;
pub const permStarterGPOEdit = 197889;
pub const permStarterGPOFullControl = 197890;
pub const permStarterGPOCustom = 197891;
pub const permSOMStarterGPOCreate = 1049856;
pub const gpoPermissions = 0;
pub const gpoEffectivePermissions = 1;
pub const gpoDisplayName = 2;
pub const gpoWMIFilter = 3;
pub const gpoID = 4;
pub const gpoComputerExtensions = 5;
pub const gpoUserExtensions = 6;
pub const somLinks = 7;
pub const gpoDomain = 8;
pub const backupMostRecent = 9;
pub const starterGPOPermissions = 10;
pub const starterGPOEffectivePermissions = 11;
pub const starterGPODisplayName = 12;
pub const starterGPOID = 13;
pub const starterGPODomain = 14;
pub const opEquals = 0;
pub const opContains = 1;
pub const opNotContains = 2;
pub const opNotEquals = 3;
pub const repXML = 0;
pub const repHTML = 1;
pub const repInfraXML = 2;
pub const repInfraRefreshXML = 3;
pub const repClientHealthXML = 4;
pub const repClientHealthRefreshXML = 5;
pub const typeUser = 0;
pub const typeComputer = 1;
pub const typeLocalGroup = 2;
pub const typeGlobalGroup = 3;
pub const typeUniversalGroup = 4;
pub const typeUNCPath = 5;
pub const typeUnknown = 6;
pub const opDestinationSameAsSource = 0;
pub const opDestinationNone = 1;
pub const opDestinationByRelativeName = 2;
pub const opDestinationSet = 3;
pub const opReportLegacy = 0;
pub const opReportComments = 1;
pub const somSite = 0;
pub const somDomain = 1;
pub const somOU = 2;
pub const typeGPO = 0;
pub const typeStarterGPO = 1;
pub const typeSystem = 0;
pub const typeCustom = 1;
pub const GPLinkUnknown = 0;
pub const GPLinkMachine = 1;
pub const GPLinkSite = 2;
pub const GPLinkDomain = 3;
pub const GPLinkOrganizationalUnit = 4;
pub const RSOPUnspecified = 0;
pub const RSOPApplied = 1;
pub const RSOPIgnored = 2;
pub const RSOPFailed = 3;
pub const RSOPSubsettingFailed = 4;
pub const APPNAME = 1;
pub const FILEEXT = 2;
pub const PROGID = 3;
pub const COMCLASS = 4;
pub const ABSENT = 0;
pub const ASSIGNED = 1;
pub const PUBLISHED = 2;
pub const GPOTypeLocal = 0;
pub const GPOTypeRemote = 1;
pub const GPOTypeDS = 2;
pub const GPOTypeLocalUser = 3;
pub const GPOTypeLocalGroup = 4;
pub const GPHintUnknown = 0;
pub const GPHintMachine = 1;
pub const GPHintSite = 2;
pub const GPHintDomain = 3;
pub const GPHintOrganizationalUnit = 4;

pub const aliases = struct {
    pub const GPO_OPEN_FLAGS = u32;
    pub const GPO_OPTIONS = u32;
    pub const GPO_SECTION = u32;
    pub const GPMRSOPMode = i32;
    pub const GPMPermissionType = i32;
    pub const GPMSearchProperty = i32;
    pub const GPMSearchOperation = i32;
    pub const GPMReportType = i32;
    pub const GPMEntryType = i32;
    pub const GPMDestinationOption = i32;
    pub const GPMReportingOptions = i32;
    pub const GPMSOMType = i32;
    pub const GPMBackupType = i32;
    pub const GPMStarterGPOType = i32;
    pub const GPO_LINK = i32;
    pub const SETTINGSTATUS = i32;
    pub const INSTALLSPECTYPE = i32;
    pub const APPSTATE = i32;
    pub const GROUP_POLICY_OBJECT_TYPE = i32;
    pub const GROUP_POLICY_HINT_TYPE = i32;
};
