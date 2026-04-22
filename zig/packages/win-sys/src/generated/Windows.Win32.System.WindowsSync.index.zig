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

pub const SYNC_VERSION_FLAG_FROM_FEED = 1;
pub const SYNC_VERSION_FLAG_HAS_BY = 2;
pub const SYNC_SERIALIZE_REPLICA_KEY_MAP = 1;
pub const SYNC_FILTER_INFO_FLAG_ITEM_LIST = 1;
pub const SYNC_FILTER_INFO_FLAG_CHANGE_UNIT_LIST = 2;
pub const SYNC_FILTER_INFO_FLAG_CUSTOM = 4;
pub const SYNC_FILTER_INFO_COMBINED = 8;
pub const SYNC_CHANGE_FLAG_DELETED = 1;
pub const SYNC_CHANGE_FLAG_DOES_NOT_EXIST = 2;
pub const SYNC_CHANGE_FLAG_GHOST = 4;
pub const SCC_DEFAULT = 0;
pub const SCC_CAN_CREATE_WITHOUT_UI = 1;
pub const SCC_CAN_MODIFY_WITHOUT_UI = 2;
pub const SCC_CREATE_NOT_SUPPORTED = 4;
pub const SCC_MODIFY_NOT_SUPPORTED = 8;
pub const SPC_DEFAULT = 0;
pub const SYNC_PROVIDER_STATE_ENABLED = 1;
pub const SYNC_PROVIDER_STATE_DIRTY = 2;
pub const SYNC_PROVIDER_CONFIGURATION_VERSION = 1;
pub const SYNC_PROVIDER_CONFIGUI_CONFIGURATION_VERSION = 1;
pub const SYNC_32_BIT_SUPPORTED = 1;
pub const SYNC_64_BIT_SUPPORTED = 2;
pub const SPR_SOURCE = 0;
pub const SPR_DESTINATION = 1;
pub const CRP_NONE = 0;
pub const CRP_DESTINATION_PROVIDER_WINS = 1;
pub const CRP_SOURCE_PROVIDER_WINS = 2;
pub const CRP_LAST = 3;
pub const SPS_CHANGE_DETECTION = 0;
pub const SPS_CHANGE_ENUMERATION = 1;
pub const SPS_CHANGE_APPLICATION = 2;
pub const SFEA_FULL_ENUMERATION = 0;
pub const SFEA_PARTIAL_SYNC = 1;
pub const SFEA_ABORT = 2;
pub const SRA_DEFER = 0;
pub const SRA_ACCEPT_DESTINATION_PROVIDER = 1;
pub const SRA_ACCEPT_SOURCE_PROVIDER = 2;
pub const SRA_MERGE = 3;
pub const SRA_TRANSFER_AND_DEFER = 4;
pub const SRA_LAST = 5;
pub const SYNC_STATISTICS_RANGE_COUNT = 0;
pub const SYNC_SERIALIZATION_VERSION_V1 = 1;
pub const SYNC_SERIALIZATION_VERSION_V2 = 4;
pub const SYNC_SERIALIZATION_VERSION_V3 = 5;
pub const FT_CURRENT_ITEMS_ONLY = 0;
pub const FT_CURRENT_ITEMS_AND_VERSIONS_FOR_MOVED_OUT_ITEMS = 1;
pub const SCRA_DEFER = 0;
pub const SCRA_ACCEPT_DESTINATION_PROVIDER = 1;
pub const SCRA_ACCEPT_SOURCE_PROVIDER = 2;
pub const SCRA_TRANSFER_AND_DEFER = 3;
pub const SCRA_MERGE = 4;
pub const SCRA_RENAME_SOURCE = 5;
pub const SCRA_RENAME_DESTINATION = 6;
pub const CCR_OTHER = 0;
pub const CCR_COLLISION = 1;
pub const CCR_NOPARENT = 2;
pub const CCR_IDENTITY = 3;
pub const KCCR_COOKIE_KNOWLEDGE_EQUAL = 0;
pub const KCCR_COOKIE_KNOWLEDGE_CONTAINED = 1;
pub const KCCR_COOKIE_KNOWLEDGE_CONTAINS = 2;
pub const KCCR_COOKIE_KNOWLEDGE_NOT_COMPARABLE = 3;
pub const FCT_INTERSECTION = 0;
pub const SRE_PROVIDER_ADDED = 0;
pub const SRE_PROVIDER_REMOVED = 1;
pub const SRE_PROVIDER_UPDATED = 2;
pub const SRE_PROVIDER_STATE_CHANGED = 3;
pub const SRE_CONFIGUI_ADDED = 4;
pub const SRE_CONFIGUI_REMOVED = 5;
pub const SRE_CONFIGUI_UPDATED = 6;

pub const aliases = struct {
    pub const SYNC_PROVIDER_ROLE = i32;
    pub const CONFLICT_RESOLUTION_POLICY = i32;
    pub const SYNC_PROGRESS_STAGE = i32;
    pub const SYNC_FULL_ENUMERATION_ACTION = i32;
    pub const SYNC_RESOLVE_ACTION = i32;
    pub const SYNC_STATISTICS = i32;
    pub const SYNC_SERIALIZATION_VERSION = i32;
    pub const FILTERING_TYPE = i32;
    pub const SYNC_CONSTRAINT_RESOLVE_ACTION = i32;
    pub const CONSTRAINT_CONFLICT_REASON = i32;
    pub const KNOWLEDGE_COOKIE_COMPARISON_RESULT = i32;
    pub const FILTER_COMBINATION_TYPE = i32;
    pub const SYNC_REGISTRATION_EVENT = i32;
};
