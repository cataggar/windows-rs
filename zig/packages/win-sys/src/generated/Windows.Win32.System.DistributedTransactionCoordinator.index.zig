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
    .{ "DtcGetTransactionManager", MethodRecord{ .library = "XOLEHLP", .import = "DtcGetTransactionManager", .signature = "\x00\x07\x11\x79\x11\x3d\x11\x3d\x0f\x11\x0d\x09\x07\x0f\x01\x0f\x0f\x01" } },
    .{ "DtcGetTransactionManagerC", MethodRecord{ .library = "XOLEHLP", .import = "DtcGetTransactionManagerC", .signature = "\x00\x07\x11\x79\x11\x3d\x11\x3d\x0f\x11\x0d\x09\x07\x0f\x01\x0f\x0f\x01" } },
    .{ "DtcGetTransactionManagerExA", MethodRecord{ .library = "XOLEHLP", .import = "DtcGetTransactionManagerExA", .signature = "\x00\x06\x11\x79\x11\x3d\x11\x3d\x0f\x11\x0d\x09\x0f\x01\x0f\x0f\x01" } },
    .{ "DtcGetTransactionManagerExW", MethodRecord{ .library = "XOLEHLP", .import = "DtcGetTransactionManagerExW", .signature = "\x00\x06\x11\x79\x11\x05\x11\x05\x0f\x11\x0d\x09\x0f\x01\x0f\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        else => null,
    };
}

pub const DTCINSTALL_E_CLIENT_ALREADY_INSTALLED = 384;
pub const DTCINSTALL_E_SERVER_ALREADY_INSTALLED = 385;
pub const XA_SWITCH_F_DTC = 1;
pub const XA_FMTID_DTC = 4478019;
pub const XA_FMTID_DTC_VER1 = 21255235;
pub const XIDDATASIZE = 128;
pub const MAXGTRIDSIZE = 64;
pub const MAXBQUALSIZE = 64;
pub const RMNAMESZ = 32;
pub const MAXINFOSIZE = 256;
pub const TMNOFLAGS = 0;
pub const TMREGISTER = 1;
pub const TMNOMIGRATE = 2;
pub const TMUSEASYNC = 4;
pub const TMASYNC = -2147483648;
pub const TMONEPHASE = 1073741824;
pub const TMFAIL = 536870912;
pub const TMNOWAIT = 268435456;
pub const TMRESUME = 134217728;
pub const TMSUCCESS = 67108864;
pub const TMSUSPEND = 33554432;
pub const TMSTARTRSCAN = 16777216;
pub const TMENDRSCAN = 8388608;
pub const TMMULTIPLE = 4194304;
pub const TMJOIN = 2097152;
pub const TMMIGRATE = 1048576;
pub const TM_JOIN = 2;
pub const TM_RESUME = 1;
pub const TM_OK = 0;
pub const TMER_TMERR = -1;
pub const TMER_INVAL = -2;
pub const TMER_PROTO = -3;
pub const XA_RBBASE = 100;
pub const XA_RBROLLBACK = 100;
pub const XA_RBCOMMFAIL = 101;
pub const XA_RBDEADLOCK = 102;
pub const XA_RBINTEGRITY = 103;
pub const XA_RBOTHER = 104;
pub const XA_RBPROTO = 105;
pub const XA_RBTIMEOUT = 106;
pub const XA_RBTRANSIENT = 107;
pub const XA_RBEND = 107;
pub const XA_NOMIGRATE = 9;
pub const XA_HEURHAZ = 8;
pub const XA_HEURCOM = 7;
pub const XA_HEURRB = 6;
pub const XA_HEURMIX = 5;
pub const XA_RETRY = 4;
pub const XA_RDONLY = 3;
pub const XA_OK = 0;
pub const XAER_ASYNC = -2;
pub const XAER_RMERR = -3;
pub const XAER_NOTA = -4;
pub const XAER_INVAL = -5;
pub const XAER_PROTO = -6;
pub const XAER_RMFAIL = -7;
pub const XAER_DUPID = -8;
pub const XAER_OUTSIDE = -9;
pub const DTC_INSTALL_OVERWRITE_CLIENT = 1;
pub const DTC_INSTALL_OVERWRITE_SERVER = 2;
pub const OLE_TM_CONFIG_VERSION_1 = 1;
pub const OLE_TM_CONFIG_VERSION_2 = 2;
pub const OLE_TM_FLAG_NONE = 0;
pub const OLE_TM_FLAG_NODEMANDSTART = 1;
pub const OLE_TM_FLAG_NOAGILERECOVERY = 2;
pub const OLE_TM_FLAG_QUERY_SERVICE_LOCKSTATUS = 2147483648;
pub const OLE_TM_FLAG_INTERNAL_TO_TM = 1073741824;
pub const DTC_STATUS_UNKNOWN = 0;
pub const DTC_STATUS_STARTING = 1;
pub const DTC_STATUS_STARTED = 2;
pub const DTC_STATUS_PAUSING = 3;
pub const DTC_STATUS_PAUSED = 4;
pub const DTC_STATUS_CONTINUING = 5;
pub const DTC_STATUS_STOPPING = 6;
pub const DTC_STATUS_STOPPED = 7;
pub const DTC_STATUS_E_CANTCONTROL = 8;
pub const DTC_STATUS_FAILED = 9;
pub const MAX_TRAN_DESC = 40;
pub const ISOLATIONLEVEL_UNSPECIFIED = -1;
pub const ISOLATIONLEVEL_CHAOS = 16;
pub const ISOLATIONLEVEL_READUNCOMMITTED = 256;
pub const ISOLATIONLEVEL_BROWSE = 256;
pub const ISOLATIONLEVEL_CURSORSTABILITY = 4096;
pub const ISOLATIONLEVEL_READCOMMITTED = 4096;
pub const ISOLATIONLEVEL_REPEATABLEREAD = 65536;
pub const ISOLATIONLEVEL_SERIALIZABLE = 1048576;
pub const ISOLATIONLEVEL_ISOLATED = 1048576;
pub const ISOFLAG_RETAIN_COMMIT_DC = 1;
pub const ISOFLAG_RETAIN_COMMIT = 2;
pub const ISOFLAG_RETAIN_COMMIT_NO = 3;
pub const ISOFLAG_RETAIN_ABORT_DC = 4;
pub const ISOFLAG_RETAIN_ABORT = 8;
pub const ISOFLAG_RETAIN_ABORT_NO = 12;
pub const ISOFLAG_RETAIN_DONTCARE = 5;
pub const ISOFLAG_RETAIN_BOTH = 10;
pub const ISOFLAG_RETAIN_NONE = 15;
pub const ISOFLAG_OPTIMISTIC = 16;
pub const ISOFLAG_READONLY = 32;
pub const XACTTC_NONE = 0;
pub const XACTTC_SYNC_PHASEONE = 1;
pub const XACTTC_SYNC_PHASETWO = 2;
pub const XACTTC_SYNC = 2;
pub const XACTTC_ASYNC_PHASEONE = 4;
pub const XACTTC_ASYNC = 4;
pub const XACTRM_OPTIMISTICLASTWINS = 1;
pub const XACTRM_NOREADONLYPREPARES = 2;
pub const XACTCONST_TIMEOUTINFINITE = 0;
pub const XACTHEURISTIC_ABORT = 1;
pub const XACTHEURISTIC_COMMIT = 2;
pub const XACTHEURISTIC_DAMAGE = 3;
pub const XACTHEURISTIC_DANGER = 4;
pub const XACTSTAT_NONE = 0;
pub const XACTSTAT_OPENNORMAL = 1;
pub const XACTSTAT_OPENREFUSED = 2;
pub const XACTSTAT_PREPARING = 4;
pub const XACTSTAT_PREPARED = 8;
pub const XACTSTAT_PREPARERETAINING = 16;
pub const XACTSTAT_PREPARERETAINED = 32;
pub const XACTSTAT_COMMITTING = 64;
pub const XACTSTAT_COMMITRETAINING = 128;
pub const XACTSTAT_ABORTING = 256;
pub const XACTSTAT_ABORTED = 512;
pub const XACTSTAT_COMMITTED = 1024;
pub const XACTSTAT_HEURISTIC_ABORT = 2048;
pub const XACTSTAT_HEURISTIC_COMMIT = 4096;
pub const XACTSTAT_HEURISTIC_DAMAGE = 8192;
pub const XACTSTAT_HEURISTIC_DANGER = 16384;
pub const XACTSTAT_FORCED_ABORT = 32768;
pub const XACTSTAT_FORCED_COMMIT = 65536;
pub const XACTSTAT_INDOUBT = 131072;
pub const XACTSTAT_CLOSED = 262144;
pub const XACTSTAT_OPEN = 3;
pub const XACTSTAT_NOTPREPARED = 524227;
pub const XACTSTAT_ALL = 524287;
pub const NO_AUTHENTICATION_REQUIRED = 0;
pub const INCOMING_AUTHENTICATION_REQUIRED = 1;
pub const MUTUAL_AUTHENTICATION_REQUIRED = 2;
pub const LOCAL_APPLICATIONTYPE = 0;
pub const CLUSTERRESOURCE_APPLICATIONTYPE = 1;
pub const XACT_E_CONNECTION_REQUEST_DENIED = -2147168000;
pub const XACT_E_TOOMANY_ENLISTMENTS = -2147167999;
pub const XACT_E_DUPLICATE_GUID = -2147167998;
pub const XACT_E_NOTSINGLEPHASE = -2147167997;
pub const XACT_E_RECOVERYALREADYDONE = -2147167996;
pub const XACT_E_PROTOCOL = -2147167995;
pub const XACT_E_RM_FAILURE = -2147167994;
pub const XACT_E_RECOVERY_FAILED = -2147167993;
pub const XACT_E_LU_NOT_FOUND = -2147167992;
pub const XACT_E_DUPLICATE_LU = -2147167991;
pub const XACT_E_LU_NOT_CONNECTED = -2147167990;
pub const XACT_E_DUPLICATE_TRANSID = -2147167989;
pub const XACT_E_LU_BUSY = -2147167988;
pub const XACT_E_LU_NO_RECOVERY_PROCESS = -2147167987;
pub const XACT_E_LU_DOWN = -2147167986;
pub const XACT_E_LU_RECOVERING = -2147167985;
pub const XACT_E_LU_RECOVERY_MISMATCH = -2147167984;
pub const XACT_E_RM_UNAVAILABLE = -2147167983;
pub const XACT_E_LRMRECOVERYALREADYDONE = -2147167982;
pub const XACT_E_NOLASTRESOURCEINTERFACE = -2147167981;
pub const XACT_S_NONOTIFY = 315648;
pub const XACT_OK_NONOTIFY = 315649;
pub const dwUSER_MS_SQLSERVER = 65535;
pub const DTCINITIATEDRECOVERYWORK_CHECKLUSTATUS = 1;
pub const DTCINITIATEDRECOVERYWORK_TRANS = 2;
pub const DTCINITIATEDRECOVERYWORK_TMDOWN = 3;
pub const DTCLUXLN_COLD = 1;
pub const DTCLUXLN_WARM = 2;
pub const DTCLUXLNCONFIRMATION_CONFIRM = 1;
pub const DTCLUXLNCONFIRMATION_LOGNAMEMISMATCH = 2;
pub const DTCLUXLNCONFIRMATION_COLDWARMMISMATCH = 3;
pub const DTCLUXLNCONFIRMATION_OBSOLETE = 4;
pub const DTCLUXLNRESPONSE_OK_SENDOURXLNBACK = 1;
pub const DTCLUXLNRESPONSE_OK_SENDCONFIRMATION = 2;
pub const DTCLUXLNRESPONSE_LOGNAMEMISMATCH = 3;
pub const DTCLUXLNRESPONSE_COLDWARMMISMATCH = 4;
pub const DTCLUXLNERROR_PROTOCOL = 1;
pub const DTCLUXLNERROR_LOGNAMEMISMATCH = 2;
pub const DTCLUXLNERROR_COLDWARMMISMATCH = 3;
pub const DTCLUCOMPARESTATE_COMMITTED = 1;
pub const DTCLUCOMPARESTATE_HEURISTICCOMMITTED = 2;
pub const DTCLUCOMPARESTATE_HEURISTICMIXED = 3;
pub const DTCLUCOMPARESTATE_HEURISTICRESET = 4;
pub const DTCLUCOMPARESTATE_INDOUBT = 5;
pub const DTCLUCOMPARESTATE_RESET = 6;
pub const DTCLUCOMPARESTATESCONFIRMATION_CONFIRM = 1;
pub const DTCLUCOMPARESTATESCONFIRMATION_PROTOCOL = 2;
pub const DTCLUCOMPARESTATESERROR_PROTOCOL = 1;
pub const DTCLUCOMPARESTATESRESPONSE_OK = 1;
pub const DTCLUCOMPARESTATESRESPONSE_PROTOCOL = 2;

pub const aliases = struct {
    pub const DTC_STATUS_ = i32;
    pub const TX_MISC_CONSTANTS = i32;
    pub const ISOLATIONLEVEL = i32;
    pub const ISOFLAG = i32;
    pub const XACTTC = i32;
    pub const XACTRM = i32;
    pub const XACTCONST = i32;
    pub const XACTHEURISTIC = i32;
    pub const XACTSTAT = i32;
    pub const AUTHENTICATION_LEVEL = i32;
    pub const APPLICATIONTYPE = i32;
    pub const XACT_DTC_CONSTANTS = i32;
    pub const DTCINITIATEDRECOVERYWORK = i32;
    pub const DTCLUXLN = i32;
    pub const DTCLUXLNCONFIRMATION = i32;
    pub const DTCLUXLNRESPONSE = i32;
    pub const DTCLUXLNERROR = i32;
    pub const DTCLUCOMPARESTATE = i32;
    pub const DTCLUCOMPARESTATESCONFIRMATION = i32;
    pub const DTCLUCOMPARESTATESERROR = i32;
    pub const DTCLUCOMPARESTATESRESPONSE = i32;
};
