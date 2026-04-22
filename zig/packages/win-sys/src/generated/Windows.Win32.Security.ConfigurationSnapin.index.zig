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

pub const SCE_LOG_LEVEL_ALWAYS = 0;
pub const SCE_LOG_LEVEL_ERROR = 1;
pub const SCE_LOG_LEVEL_DETAIL = 2;
pub const SCE_LOG_LEVEL_DEBUG = 3;
pub const SCESTATUS_SUCCESS = 0;
pub const SCESTATUS_INVALID_PARAMETER = 1;
pub const SCESTATUS_RECORD_NOT_FOUND = 2;
pub const SCESTATUS_INVALID_DATA = 3;
pub const SCESTATUS_OBJECT_EXIST = 4;
pub const SCESTATUS_BUFFER_TOO_SMALL = 5;
pub const SCESTATUS_PROFILE_NOT_FOUND = 6;
pub const SCESTATUS_BAD_FORMAT = 7;
pub const SCESTATUS_NOT_ENOUGH_RESOURCE = 8;
pub const SCESTATUS_ACCESS_DENIED = 9;
pub const SCESTATUS_CANT_DELETE = 10;
pub const SCESTATUS_PREFIX_OVERFLOW = 11;
pub const SCESTATUS_OTHER_ERROR = 12;
pub const SCESTATUS_ALREADY_RUNNING = 13;
pub const SCESTATUS_SERVICE_NOT_SUPPORT = 14;
pub const SCESTATUS_MOD_NOT_FOUND = 15;
pub const SCESTATUS_EXCEPTION_IN_SERVER = 16;
pub const SCESTATUS_NO_TEMPLATE_GIVEN = 17;
pub const SCESTATUS_NO_MAPPING = 18;
pub const SCESTATUS_TRUST_FAIL = 19;
pub const SCESVC_ENUMERATION_MAX = 100;
pub const SceSvcConfigurationInfo = 0;
pub const SceSvcMergedPolicyInfo = 1;
pub const SceSvcAnalysisInfo = 2;
pub const SceSvcInternalUse = 3;

pub const aliases = struct {
    pub const SCE_LOG_ERR_LEVEL = i32;
    pub const SCESVC_INFO_TYPE = i32;
};
