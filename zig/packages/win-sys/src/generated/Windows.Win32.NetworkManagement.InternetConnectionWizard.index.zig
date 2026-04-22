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

pub const ICW_MAX_ACCTNAME = 256;
pub const ICW_MAX_PASSWORD = 256;
pub const ICW_MAX_LOGONNAME = 256;
pub const ICW_MAX_SERVERNAME = 64;
pub const ICW_MAX_RASNAME = 256;
pub const ICW_MAX_EMAILNAME = 64;
pub const ICW_MAX_EMAILADDR = 128;
pub const ICW_CHECKSTATUS = 1;
pub const ICW_LAUNCHFULL = 256;
pub const ICW_LAUNCHMANUAL = 512;
pub const ICW_USE_SHELLNEXT = 1024;
pub const ICW_FULL_SMARTSTART = 2048;
pub const ICW_FULLPRESENT = 1;
pub const ICW_MANUALPRESENT = 2;
pub const ICW_ALREADYRUN = 4;
pub const ICW_LAUNCHEDFULL = 256;
pub const ICW_LAUNCHEDMANUAL = 512;
pub const ICW_USEDEFAULTS = 1;

pub const aliases = struct {
    pub const PFNCHECKCONNECTIONWIZARD = ?*const anyopaque;
    pub const PFNSETSHELLNEXT = ?*const anyopaque;
};
