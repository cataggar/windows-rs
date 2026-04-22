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

pub const DODownloadState_Created = 0;
pub const DODownloadState_Transferring = 1;
pub const DODownloadState_Transferred = 2;
pub const DODownloadState_Finalized = 3;
pub const DODownloadState_Aborted = 4;
pub const DODownloadState_Paused = 5;
pub const DODownloadCostPolicy_Always = 0;
pub const DODownloadCostPolicy_Unrestricted = 1;
pub const DODownloadCostPolicy_Standard = 2;
pub const DODownloadCostPolicy_NoRoaming = 3;
pub const DODownloadCostPolicy_NoSurcharge = 4;
pub const DODownloadCostPolicy_NoCellular = 5;
pub const DODownloadProperty_Id = 0;
pub const DODownloadProperty_Uri = 1;
pub const DODownloadProperty_ContentId = 2;
pub const DODownloadProperty_DisplayName = 3;
pub const DODownloadProperty_LocalPath = 4;
pub const DODownloadProperty_HttpCustomHeaders = 5;
pub const DODownloadProperty_CostPolicy = 6;
pub const DODownloadProperty_SecurityFlags = 7;
pub const DODownloadProperty_CallbackFreqPercent = 8;
pub const DODownloadProperty_CallbackFreqSeconds = 9;
pub const DODownloadProperty_NoProgressTimeoutSeconds = 10;
pub const DODownloadProperty_ForegroundPriority = 11;
pub const DODownloadProperty_BlockingMode = 12;
pub const DODownloadProperty_CallbackInterface = 13;
pub const DODownloadProperty_StreamInterface = 14;
pub const DODownloadProperty_SecurityContext = 15;
pub const DODownloadProperty_NetworkToken = 16;
pub const DODownloadProperty_CorrelationVector = 17;
pub const DODownloadProperty_DecryptionInfo = 18;
pub const DODownloadProperty_IntegrityCheckInfo = 19;
pub const DODownloadProperty_IntegrityCheckMandatory = 20;
pub const DODownloadProperty_TotalSizeBytes = 21;
pub const DODownloadProperty_DisallowOnCellular = 22;
pub const DODownloadProperty_HttpCustomAuthHeaders = 23;
pub const DODownloadProperty_HttpAllowSecureToNonSecureRedirect = 24;
pub const DODownloadProperty_NonVolatile = 25;
pub const DODownloadProperty_HttpRedirectionTarget = 26;
pub const DODownloadProperty_HttpResponseHeaders = 27;
pub const DODownloadProperty_HttpServerIPAddress = 28;
pub const DODownloadProperty_HttpStatusCode = 29;

pub const aliases = struct {
    pub const DODownloadState = i32;
    pub const DODownloadCostPolicy = i32;
    pub const DODownloadProperty = i32;
};
