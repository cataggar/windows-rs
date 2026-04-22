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
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const FD_EVENTID_PRIVATE = 100;
pub const FD_EVENTID = 1000;
pub const FD_EVENTID_SEARCHCOMPLETE = 1000;
pub const FD_EVENTID_ASYNCTHREADEXIT = 1001;
pub const FD_EVENTID_SEARCHSTART = 1002;
pub const FD_EVENTID_IPADDRESSCHANGE = 1003;
pub const FD_EVENTID_QUERYREFRESH = 1004;
pub const FD_Visibility_Default = 0;
pub const FD_Visibility_Hidden = 1;
pub const PNPX_INSTALLSTATE_NOTINSTALLED = 0;
pub const PNPX_INSTALLSTATE_INSTALLED = 1;
pub const PNPX_INSTALLSTATE_INSTALLING = 2;
pub const PNPX_INSTALLSTATE_FAILED = 3;
pub const FD_LONGHORN = 1;
pub const MAX_FDCONSTRAINTNAME_LENGTH = 100;
pub const MAX_FDCONSTRAINTVALUE_LENGTH = 1000;
pub const E_FDPAIRING_NOCONNECTION = -1882193919;
pub const E_FDPAIRING_HWFAILURE = -1882193918;
pub const E_FDPAIRING_AUTHFAILURE = -1882193917;
pub const E_FDPAIRING_CONNECTTIMEOUT = -1882193916;
pub const E_FDPAIRING_TOOMANYCONNECTIONS = -1882193915;
pub const E_FDPAIRING_AUTHNOTALLOWED = -1882193914;
pub const E_FDPAIRING_IPBUSDISABLED = -1882193913;
pub const E_FDPAIRING_NOPROFILES = -1882193912;
pub const QC_EQUALS = 0;
pub const QC_NOTEQUAL = 1;
pub const QC_LESSTHAN = 2;
pub const QC_LESSTHANOREQUAL = 3;
pub const QC_GREATERTHAN = 4;
pub const QC_GREATERTHANOREQUAL = 5;
pub const QC_STARTSWITH = 6;
pub const QC_EXISTS = 7;
pub const QC_DOESNOTEXIST = 8;
pub const QC_CONTAINS = 9;
pub const SVF_SYSTEM = 0;
pub const SVF_USER = 1;
pub const QUA_ADD = 0;
pub const QUA_REMOVE = 1;
pub const QUA_CHANGE = 2;
pub const QCT_PROVIDER = 0;
pub const QCT_LAYERED = 1;

pub const aliases = struct {
    pub const PropertyConstraint = i32;
    pub const SystemVisibilityFlags = i32;
    pub const QueryUpdateAction = i32;
    pub const QueryCategoryType = i32;
};
