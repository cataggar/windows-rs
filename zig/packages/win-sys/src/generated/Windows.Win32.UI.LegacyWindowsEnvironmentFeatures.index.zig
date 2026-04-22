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

pub const EVCF_HASSETTINGS = 1;
pub const EVCF_ENABLEBYDEFAULT = 2;
pub const EVCF_REMOVEFROMLIST = 4;
pub const EVCF_ENABLEBYDEFAULT_AUTO = 8;
pub const EVCF_DONTSHOWIFZERO = 16;
pub const EVCF_SETTINGSMODE = 32;
pub const EVCF_OUTOFDISKSPACE = 64;
pub const EVCF_USERCONSENTOBTAINED = 128;
pub const EVCF_SYSTEMAUTORUN = 256;
pub const EVCCBF_LASTNOTIFICATION = 1;
pub const STATEBITS_FLAT = 1;
pub const REC_S_IDIDTHEUPDATES = 266240;
pub const REC_S_NOTCOMPLETE = 266241;
pub const REC_S_NOTCOMPLETEBUTPROPAGATE = 266242;
pub const REC_E_ABORTED = -2147217408;
pub const REC_E_NOCALLBACK = -2147217407;
pub const REC_E_NORESIDUES = -2147217406;
pub const REC_E_TOODIFFERENT = -2147217405;
pub const REC_E_INEEDTODOTHEUPDATES = -2147217404;
pub const RECONCILEF_MAYBOTHERUSER = 1;
pub const RECONCILEF_FEEDBACKWINDOWVALID = 2;
pub const RECONCILEF_NORESIDUESOK = 4;
pub const RECONCILEF_OMITSELFRESIDUE = 8;
pub const RECONCILEF_RESUMERECONCILIATION = 16;
pub const RECONCILEF_YOUMAYDOTHEUPDATES = 32;
pub const RECONCILEF_ONLYYOUWERECHANGED = 64;
pub const ALL_RECONCILE_FLAGS = 127;

pub const aliases = struct {
    pub const EMPTY_VOLUME_CACHE_FLAGS = u32;
    pub const RECONCILEF = i32;
};
