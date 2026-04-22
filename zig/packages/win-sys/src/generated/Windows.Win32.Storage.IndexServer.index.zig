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
    .{ "LoadIFilter", MethodRecord{ .library = "query", .import = "LoadIFilter", .signature = "\x00\x03\x11\x79\x11\x05\x12\x82\xb1\x0f\x0f\x01" } },
    .{ "LoadIFilterEx", MethodRecord{ .library = "query", .import = "LoadIFilterEx", .signature = "\x00\x04\x11\x79\x11\x05\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "BindIFilterFromStorage", MethodRecord{ .library = "query", .import = "BindIFilterFromStorage", .signature = "\x00\x03\x11\x79\x12\x99\xb9\x12\x82\xb1\x0f\x0f\x01" } },
    .{ "BindIFilterFromStream", MethodRecord{ .library = "query", .import = "BindIFilterFromStream", .signature = "\x00\x03\x11\x79\x12\x83\x75\x12\x82\xb1\x0f\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IStream" },
        0x19b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "IStorage" },
        else => null,
    };
}

pub const CI_VERSION_WDS30 = 258;
pub const CI_VERSION_WDS40 = 265;
pub const CI_VERSION_WIN70 = 1792;
pub const LIFF_LOAD_DEFINED_FILTER = 1;
pub const LIFF_IMPLEMENT_TEXT_FILTER_FALLBACK_POLICY = 2;
pub const LIFF_FORCE_TEXT_FILTER_FALLBACK = 3;
pub const PID_FILENAME = 100;
pub const DBPROP_CI_CATALOG_NAME = 2;
pub const DBPROP_CI_INCLUDE_SCOPES = 3;
pub const DBPROP_CI_DEPTHS = 4;
pub const DBPROP_CI_SCOPE_FLAGS = 4;
pub const DBPROP_CI_EXCLUDE_SCOPES = 5;
pub const DBPROP_CI_SECURITY_ID = 6;
pub const DBPROP_CI_QUERY_TYPE = 7;
pub const DBPROP_CI_PROVIDER = 8;
pub const CI_PROVIDER_MSSEARCH = 1;
pub const CI_PROVIDER_INDEXING_SERVICE = 2;
pub const CI_PROVIDER_ALL = 4294967295;
pub const DBPROP_DEFAULT_EQUALS_BEHAVIOR = 2;
pub const DBPROP_USECONTENTINDEX = 2;
pub const DBPROP_DEFERNONINDEXEDTRIMMING = 3;
pub const DBPROP_USEEXTENDEDDBTYPES = 4;
pub const DBPROP_IGNORENOISEONLYCLAUSES = 5;
pub const DBPROP_GENERICOPTIONS_STRING = 6;
pub const DBPROP_FIRSTROWS = 7;
pub const DBPROP_DEFERCATALOGVERIFICATION = 8;
pub const DBPROP_CATALOGLISTID = 9;
pub const DBPROP_GENERATEPARSETREE = 10;
pub const DBPROP_APPLICATION_NAME = 11;
pub const DBPROP_FREETEXTANYTERM = 12;
pub const DBPROP_FREETEXTUSESTEMMING = 13;
pub const DBPROP_IGNORESBRI = 14;
pub const DBPROP_DONOTCOMPUTEEXPENSIVEPROPS = 15;
pub const DBPROP_ENABLEROWSETEVENTS = 16;
pub const DBPROP_SESSION_ID = 17;
pub const DBPROP_QUERY_ID = 18;
pub const DBPROP_MACHINE = 2;
pub const DBPROP_CLIENT_CLSID = 3;
pub const MSIDXSPROP_ROWSETQUERYSTATUS = 2;
pub const MSIDXSPROP_COMMAND_LOCALE_STRING = 3;
pub const MSIDXSPROP_QUERY_RESTRICTION = 4;
pub const MSIDXSPROP_PARSE_TREE = 5;
pub const MSIDXSPROP_MAX_RANK = 6;
pub const MSIDXSPROP_RESULTS_FOUND = 7;
pub const MSIDXSPROP_WHEREID = 8;
pub const MSIDXSPROP_SERVER_VERSION = 9;
pub const MSIDXSPROP_SERVER_WINVER_MAJOR = 10;
pub const MSIDXSPROP_SERVER_WINVER_MINOR = 11;
pub const MSIDXSPROP_SERVER_NLSVERSION = 12;
pub const MSIDXSPROP_SERVER_NLSVER_DEFINED = 13;
pub const MSIDXSPROP_SAME_SORTORDER_USED = 14;
pub const STAT_BUSY = 0;
pub const STAT_ERROR = 1;
pub const STAT_DONE = 2;
pub const STAT_REFRESH = 3;
pub const STAT_PARTIAL_SCOPE = 8;
pub const STAT_NOISE_WORDS = 16;
pub const STAT_CONTENT_OUT_OF_DATE = 32;
pub const STAT_REFRESH_INCOMPLETE = 64;
pub const STAT_CONTENT_QUERY_INCOMPLETE = 128;
pub const STAT_TIME_LIMIT_EXCEEDED = 256;
pub const STAT_SHARING_VIOLATION = 512;
pub const STAT_MISSING_RELDOC = 1024;
pub const STAT_MISSING_PROP_IN_RELDOC = 2048;
pub const STAT_RELDOC_ACCESS_DENIED = 4096;
pub const STAT_COALESCE_COMP_ALL_NOISE = 8192;
pub const QUERY_SHALLOW = 0;
pub const QUERY_DEEP = 1;
pub const QUERY_PHYSICAL_PATH = 0;
pub const QUERY_VIRTUAL_PATH = 2;
pub const PROPID_QUERY_WORKID = 5;
pub const PROPID_QUERY_UNFILTERED = 7;
pub const PROPID_QUERY_VIRTUALPATH = 9;
pub const PROPID_QUERY_LASTSEENTIME = 10;
pub const CICAT_STOPPED = 1;
pub const CICAT_READONLY = 2;
pub const CICAT_WRITABLE = 4;
pub const CICAT_NO_QUERY = 8;
pub const CICAT_GET_STATE = 16;
pub const CICAT_ALL_OPENED = 32;
pub const CI_STATE_SHADOW_MERGE = 1;
pub const CI_STATE_MASTER_MERGE = 2;
pub const CI_STATE_CONTENT_SCAN_REQUIRED = 4;
pub const CI_STATE_ANNEALING_MERGE = 8;
pub const CI_STATE_SCANNING = 16;
pub const CI_STATE_RECOVERING = 32;
pub const CI_STATE_INDEX_MIGRATION_MERGE = 64;
pub const CI_STATE_LOW_MEMORY = 128;
pub const CI_STATE_HIGH_IO = 256;
pub const CI_STATE_MASTER_MERGE_PAUSED = 512;
pub const CI_STATE_READ_ONLY = 1024;
pub const CI_STATE_BATTERY_POWER = 2048;
pub const CI_STATE_USER_ACTIVE = 4096;
pub const CI_STATE_STARTING = 8192;
pub const CI_STATE_READING_USNS = 16384;
pub const CI_STATE_DELETION_MERGE = 32768;
pub const CI_STATE_LOW_DISK = 65536;
pub const CI_STATE_HIGH_CPU = 131072;
pub const CI_STATE_BATTERY_POLICY = 262144;
pub const GENERATE_METHOD_EXACT = 0;
pub const GENERATE_METHOD_PREFIX = 1;
pub const GENERATE_METHOD_INFLECT = 2;
pub const SCOPE_FLAG_MASK = 255;
pub const SCOPE_FLAG_INCLUDE = 1;
pub const SCOPE_FLAG_DEEP = 2;
pub const SCOPE_TYPE_MASK = 4294967040;
pub const SCOPE_TYPE_WINPATH = 256;
pub const SCOPE_TYPE_VPATH = 512;
pub const PROPID_QUERY_RANKVECTOR = 2;
pub const PROPID_QUERY_RANK = 3;
pub const PROPID_QUERY_HITCOUNT = 4;
pub const PROPID_QUERY_ALL = 6;
pub const PROPID_STG_CONTENTS = 19;
pub const VECTOR_RANK_MIN = 0;
pub const VECTOR_RANK_MAX = 1;
pub const VECTOR_RANK_INNER = 2;
pub const VECTOR_RANK_DICE = 3;
pub const VECTOR_RANK_JACCARD = 4;
pub const DBSETFUNC_NONE = 0;
pub const DBSETFUNC_ALL = 1;
pub const DBSETFUNC_DISTINCT = 2;
pub const PROXIMITY_UNIT_WORD = 0;
pub const PROXIMITY_UNIT_SENTENCE = 1;
pub const PROXIMITY_UNIT_PARAGRAPH = 2;
pub const PROXIMITY_UNIT_CHAPTER = 3;
pub const NOT_AN_ERROR = 524288;
pub const FILTER_E_END_OF_CHUNKS = -2147215616;
pub const FILTER_E_NO_MORE_TEXT = -2147215615;
pub const FILTER_E_NO_MORE_VALUES = -2147215614;
pub const FILTER_E_ACCESS = -2147215613;
pub const FILTER_W_MONIKER_CLIPPED = 268036;
pub const FILTER_E_NO_TEXT = -2147215611;
pub const FILTER_E_NO_VALUES = -2147215610;
pub const FILTER_E_EMBEDDING_UNAVAILABLE = -2147215609;
pub const FILTER_E_LINK_UNAVAILABLE = -2147215608;
pub const FILTER_S_LAST_TEXT = 268041;
pub const FILTER_S_LAST_VALUES = 268042;
pub const FILTER_E_PASSWORD = -2147215605;
pub const FILTER_E_UNKNOWNFORMAT = -2147215604;
pub const IFILTER_INIT_CANON_PARAGRAPHS = 1;
pub const IFILTER_INIT_HARD_LINE_BREAKS = 2;
pub const IFILTER_INIT_CANON_HYPHENS = 4;
pub const IFILTER_INIT_CANON_SPACES = 8;
pub const IFILTER_INIT_APPLY_INDEX_ATTRIBUTES = 16;
pub const IFILTER_INIT_APPLY_OTHER_ATTRIBUTES = 32;
pub const IFILTER_INIT_APPLY_CRAWL_ATTRIBUTES = 256;
pub const IFILTER_INIT_INDEXING_ONLY = 64;
pub const IFILTER_INIT_SEARCH_LINKS = 128;
pub const IFILTER_INIT_FILTER_OWNED_VALUE_OK = 512;
pub const IFILTER_INIT_FILTER_AGGRESSIVE_BREAK = 1024;
pub const IFILTER_INIT_DISABLE_EMBEDDED = 2048;
pub const IFILTER_INIT_EMIT_FORMATTING = 4096;
pub const IFILTER_FLAGS_OLE_PROPERTIES = 1;
pub const CHUNK_TEXT = 1;
pub const CHUNK_VALUE = 2;
pub const CHUNK_FILTER_OWNED_VALUE = 4;
pub const CHUNK_IMAGE = 8;
pub const CHUNK_NO_BREAK = 0;
pub const CHUNK_EOW = 1;
pub const CHUNK_EOS = 2;
pub const CHUNK_EOP = 3;
pub const CHUNK_EOC = 4;
pub const FILTER_PIXELFORMAT_BGRA8 = 0;
pub const FILTER_PIXELFORMAT_PBGRA8 = 1;
pub const FILTER_PIXELFORMAT_BGR8 = 2;
pub const WORDREP_BREAK_EOW = 0;
pub const WORDREP_BREAK_EOS = 1;
pub const WORDREP_BREAK_EOP = 2;
pub const WORDREP_BREAK_EOC = 3;
pub const DBKIND_GUID_NAME = 0;
pub const DBKIND_GUID_PROPID = 1;
pub const DBKIND_NAME = 2;
pub const DBKIND_PGUID_NAME = 3;
pub const DBKIND_PGUID_PROPID = 4;
pub const DBKIND_PROPID = 5;
pub const DBKIND_GUID = 6;

pub const aliases = struct {
    pub const IFILTER_INIT = i32;
    pub const IFILTER_FLAGS = i32;
    pub const CHUNKSTATE = i32;
    pub const CHUNK_BREAKTYPE = i32;
    pub const IMAGE_PIXELFORMAT = i32;
    pub const WORDREP_BREAK_TYPE = i32;
    pub const DBKINDENUM = i32;
};
