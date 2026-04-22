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

pub const UpdateImpactLevel_None = 0;
pub const UpdateImpactLevel_Low = 1;
pub const UpdateImpactLevel_Medium = 2;
pub const UpdateImpactLevel_High = 3;
pub const UpdateAssessmentStatus_Latest = 0;
pub const UpdateAssessmentStatus_NotLatestSoftRestriction = 1;
pub const UpdateAssessmentStatus_NotLatestHardRestriction = 2;
pub const UpdateAssessmentStatus_NotLatestEndOfSupport = 3;
pub const UpdateAssessmentStatus_NotLatestServicingTrain = 4;
pub const UpdateAssessmentStatus_NotLatestDeferredFeature = 5;
pub const UpdateAssessmentStatus_NotLatestDeferredQuality = 6;
pub const UpdateAssessmentStatus_NotLatestPausedFeature = 7;
pub const UpdateAssessmentStatus_NotLatestPausedQuality = 8;
pub const UpdateAssessmentStatus_NotLatestManaged = 9;
pub const UpdateAssessmentStatus_NotLatestUnknown = 10;
pub const UpdateAssessmentStatus_NotLatestTargetedVersion = 11;

pub const aliases = struct {
    pub const UpdateImpactLevel = i32;
    pub const UpdateAssessmentStatus = i32;
};
