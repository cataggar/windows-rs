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

pub const method_def_by_name = std.static_string_map.StaticStringMap(MethodRecord).initComptime(.{});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const RDCE_TABLE_FULL = 2147745793;
pub const RDCE_TABLE_CORRUPT = 2147745794;
pub const MSRDC_SIGNATURE_HASHSIZE = 16;
pub const SimilarityFileIdMinSize = 4;
pub const SimilarityFileIdMaxSize = 32;
pub const MSRDC_VERSION = 65536;
pub const MSRDC_MINIMUM_COMPATIBLE_APP_VERSION = 65536;
pub const MSRDC_MINIMUM_DEPTH = 1;
pub const MSRDC_MAXIMUM_DEPTH = 8;
pub const MSRDC_MINIMUM_COMPAREBUFFER = 100000;
pub const MSRDC_MAXIMUM_COMPAREBUFFER = 1073741824;
pub const MSRDC_DEFAULT_COMPAREBUFFER = 3200000;
pub const MSRDC_MINIMUM_INPUTBUFFERSIZE = 1024;
pub const MSRDC_MINIMUM_HORIZONSIZE = 128;
pub const MSRDC_MAXIMUM_HORIZONSIZE = 16384;
pub const MSRDC_MINIMUM_HASHWINDOWSIZE = 2;
pub const MSRDC_MAXIMUM_HASHWINDOWSIZE = 96;
pub const MSRDC_DEFAULT_HASHWINDOWSIZE_1 = 48;
pub const MSRDC_DEFAULT_HORIZONSIZE_1 = 1024;
pub const MSRDC_DEFAULT_HASHWINDOWSIZE_N = 2;
pub const MSRDC_DEFAULT_HORIZONSIZE_N = 128;
pub const MSRDC_MAXIMUM_TRAITVALUE = 63;
pub const MSRDC_MINIMUM_MATCHESREQUIRED = 1;
pub const MSRDC_MAXIMUM_MATCHESREQUIRED = 16;
pub const RDC_NoError = 0;
pub const RDC_HeaderVersionNewer = 1;
pub const RDC_HeaderVersionOlder = 2;
pub const RDC_HeaderMissingOrCorrupt = 3;
pub const RDC_HeaderWrongType = 4;
pub const RDC_DataMissingOrCorrupt = 5;
pub const RDC_DataTooManyRecords = 6;
pub const RDC_FileChecksumMismatch = 7;
pub const RDC_ApplicationError = 8;
pub const RDC_Aborted = 9;
pub const RDC_Win32Error = 10;
pub const RDCGENTYPE_Unused = 0;
pub const RDCGENTYPE_FilterMax = 1;
pub const RDCNEED_SOURCE = 0;
pub const RDCNEED_TARGET = 1;
pub const RDCNEED_SEED = 2;
pub const RDCNEED_SEED_MAX = 255;
pub const RDCTABLE_InvalidOrUnknown = 0;
pub const RDCTABLE_Existing = 1;
pub const RDCTABLE_New = 2;
pub const RDCMAPPING_Undefined = 0;
pub const RDCMAPPING_ReadOnly = 1;
pub const RDCMAPPING_ReadWrite = 2;

pub const aliases = struct {
    pub const RDC_ErrorCode = i32;
    pub const GeneratorParametersType = i32;
    pub const RdcNeedType = i32;
    pub const RdcCreatedTables = i32;
    pub const RdcMappingAccessMode = i32;
};
