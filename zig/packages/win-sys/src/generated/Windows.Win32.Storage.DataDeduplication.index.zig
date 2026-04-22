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

pub const DEDUP_CHUNKLIB_MAX_CHUNKS_ENUM = 1024;
pub const DEDUP_RECONSTRUCT_UNOPTIMIZED = 1;
pub const DEDUP_RECONSTRUCT_OPTIMIZED = 2;
pub const DEDUP_PT_MinChunkSizeBytes = 1;
pub const DEDUP_PT_MaxChunkSizeBytes = 2;
pub const DEDUP_PT_AvgChunkSizeBytes = 3;
pub const DEDUP_PT_InvariantChunking = 4;
pub const DEDUP_PT_DisableStrongHashComputation = 5;
pub const DedupDataPortManagerOption_None = 0;
pub const DedupDataPortManagerOption_AutoStart = 1;
pub const DedupDataPortManagerOption_SkipReconciliation = 2;
pub const DedupDataPortVolumeStatus_Unknown = 0;
pub const DedupDataPortVolumeStatus_NotEnabled = 1;
pub const DedupDataPortVolumeStatus_NotAvailable = 2;
pub const DedupDataPortVolumeStatus_Initializing = 3;
pub const DedupDataPortVolumeStatus_Ready = 4;
pub const DedupDataPortVolumeStatus_Maintenance = 5;
pub const DedupDataPortVolumeStatus_Shutdown = 6;
pub const DedupDataPortRequestStatus_Unknown = 0;
pub const DedupDataPortRequestStatus_Queued = 1;
pub const DedupDataPortRequestStatus_Processing = 2;
pub const DedupDataPortRequestStatus_Partial = 3;
pub const DedupDataPortRequestStatus_Complete = 4;
pub const DedupDataPortRequestStatus_Failed = 5;
pub const DedupChunkFlags_None = 0;
pub const DedupChunkFlags_Compressed = 1;
pub const DedupChunkingAlgorithm_Unknonwn = 0;
pub const DedupChunkingAlgorithm_V1 = 1;
pub const DedupHashingAlgorithm_Unknonwn = 0;
pub const DedupHashingAlgorithm_V1 = 1;
pub const DedupCompressionAlgorithm_Unknonwn = 0;
pub const DedupCompressionAlgorithm_Xpress = 1;

pub const aliases = struct {
    pub const DEDUP_BACKUP_SUPPORT_PARAM_TYPE = i32;
    pub const DEDUP_SET_PARAM_TYPE = i32;
    pub const DedupDataPortManagerOption = i32;
    pub const DedupDataPortVolumeStatus = i32;
    pub const DedupDataPortRequestStatus = i32;
    pub const DedupChunkFlags = i32;
    pub const DedupChunkingAlgorithm = i32;
    pub const DedupHashingAlgorithm = i32;
    pub const DedupCompressionAlgorithm = i32;
};
