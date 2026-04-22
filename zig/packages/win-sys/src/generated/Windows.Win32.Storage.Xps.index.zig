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
    .{ "DeviceCapabilitiesA", MethodRecord{ .library = "winspool.drv", .import = "DeviceCapabilitiesA", .signature = "\x00\x05\x08\x11\x3d\x11\x3d\x11\xa0\x71\x11\x3d\x0f\x11\x8d\x81" } },
    .{ "DeviceCapabilitiesW", MethodRecord{ .library = "winspool.drv", .import = "DeviceCapabilitiesW", .signature = "\x00\x05\x08\x11\x05\x11\x05\x11\xa0\x71\x11\x05\x0f\x11\x8d\x85" } },
    .{ "Escape", MethodRecord{ .library = "GDI32", .import = "Escape", .signature = "\x00\x05\x08\x11\x83\x5d\x08\x08\x11\x3d\x0f\x01" } },
    .{ "ExtEscape", MethodRecord{ .library = "GDI32", .import = "ExtEscape", .signature = "\x00\x06\x08\x11\x83\x5d\x08\x08\x11\x3d\x08\x11\x3d" } },
    .{ "StartDocA", MethodRecord{ .library = "GDI32", .import = "StartDocA", .signature = "\x00\x02\x08\x11\x83\x5d\x0f\x11\xbf\x99" } },
    .{ "StartDocW", MethodRecord{ .library = "GDI32", .import = "StartDocW", .signature = "\x00\x02\x08\x11\x83\x5d\x0f\x11\xaf\xa9" } },
    .{ "EndDoc", MethodRecord{ .library = "GDI32", .import = "EndDoc", .signature = "\x00\x01\x08\x11\x83\x5d" } },
    .{ "StartPage", MethodRecord{ .library = "GDI32", .import = "StartPage", .signature = "\x00\x01\x08\x11\x83\x5d" } },
    .{ "EndPage", MethodRecord{ .library = "GDI32", .import = "EndPage", .signature = "\x00\x01\x08\x11\x83\x5d" } },
    .{ "AbortDoc", MethodRecord{ .library = "GDI32", .import = "AbortDoc", .signature = "\x00\x01\x08\x11\x83\x5d" } },
    .{ "SetAbortProc", MethodRecord{ .library = "GDI32", .import = "SetAbortProc", .signature = "\x00\x02\x08\x11\x83\x5d\x12\xbf\x9d" } },
    .{ "PrintWindow", MethodRecord{ .library = "USER32", .import = "PrintWindow", .signature = "\x00\x03\x11\x59\x11\x25\x11\x83\x5d\x11\xa0\x6d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x35d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HDC" },
        0xd81 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DEVMODEA" },
        0xd85 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DEVMODEW" },
        0x206d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Xps", .name = "PRINT_WINDOW_FLAGS" },
        0x2071 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Xps", .name = "PRINTER_DEVICE_CAPABILITIES" },
        0x2fa9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Xps", .name = "DOCINFOW" },
        0x3f99 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Xps", .name = "DOCINFOA" },
        0x3f9d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Xps", .name = "ABORTPROC" },
        else => null,
    };
}

pub const PW_CLIENTONLY = 1;
pub const DC_BINNAMES = 12;
pub const DC_BINS = 6;
pub const DC_COLLATE = 22;
pub const DC_COLORDEVICE = 32;
pub const DC_COPIES = 18;
pub const DC_DRIVER = 11;
pub const DC_DUPLEX = 7;
pub const DC_ENUMRESOLUTIONS = 13;
pub const DC_EXTRA = 9;
pub const DC_FIELDS = 1;
pub const DC_FILEDEPENDENCIES = 14;
pub const DC_MAXEXTENT = 5;
pub const DC_MEDIAREADY = 29;
pub const DC_MEDIATYPENAMES = 34;
pub const DC_MEDIATYPES = 35;
pub const DC_MINEXTENT = 4;
pub const DC_ORIENTATION = 17;
pub const DC_NUP = 33;
pub const DC_PAPERNAMES = 16;
pub const DC_PAPERS = 2;
pub const DC_PAPERSIZE = 3;
pub const DC_PERSONALITY = 25;
pub const DC_PRINTERMEM = 28;
pub const DC_PRINTRATE = 26;
pub const DC_PRINTRATEPPM = 31;
pub const DC_PRINTRATEUNIT = 27;
pub const DC_SIZE = 8;
pub const DC_STAPLE = 30;
pub const DC_TRUETYPE = 15;
pub const DC_VERSION = 10;
pub const XPS_E_SIGREQUESTID_DUP = -2142108795;
pub const XPS_E_PACKAGE_NOT_OPENED = -2142108794;
pub const XPS_E_PACKAGE_ALREADY_OPENED = -2142108793;
pub const XPS_E_SIGNATUREID_DUP = -2142108792;
pub const XPS_E_MARKUP_COMPATIBILITY_ELEMENTS = -2142108791;
pub const XPS_E_OBJECT_DETACHED = -2142108790;
pub const XPS_E_INVALID_SIGNATUREBLOCK_MARKUP = -2142108789;
pub const XPS_E_INVALID_NUMBER_OF_POINTS_IN_CURVE_SEGMENTS = -2142108160;
pub const XPS_E_ABSOLUTE_REFERENCE = -2142108159;
pub const XPS_E_INVALID_NUMBER_OF_COLOR_CHANNELS = -2142108158;
pub const XPS_E_INVALID_LANGUAGE = -2142109696;
pub const XPS_E_INVALID_NAME = -2142109695;
pub const XPS_E_INVALID_RESOURCE_KEY = -2142109694;
pub const XPS_E_INVALID_PAGE_SIZE = -2142109693;
pub const XPS_E_INVALID_BLEED_BOX = -2142109692;
pub const XPS_E_INVALID_THUMBNAIL_IMAGE_TYPE = -2142109691;
pub const XPS_E_INVALID_LOOKUP_TYPE = -2142109690;
pub const XPS_E_INVALID_FLOAT = -2142109689;
pub const XPS_E_UNEXPECTED_CONTENT_TYPE = -2142109688;
pub const XPS_E_INVALID_FONT_URI = -2142109686;
pub const XPS_E_INVALID_CONTENT_BOX = -2142109685;
pub const XPS_E_INVALID_MARKUP = -2142109684;
pub const XPS_E_INVALID_XML_ENCODING = -2142109683;
pub const XPS_E_INVALID_CONTENT_TYPE = -2142109682;
pub const XPS_E_INVALID_OBFUSCATED_FONT_URI = -2142109681;
pub const XPS_E_UNEXPECTED_RELATIONSHIP_TYPE = -2142109680;
pub const XPS_E_UNEXPECTED_RESTRICTED_FONT_RELATIONSHIP = -2142109679;
pub const XPS_E_MISSING_NAME = -2142109440;
pub const XPS_E_MISSING_LOOKUP = -2142109439;
pub const XPS_E_MISSING_GLYPHS = -2142109438;
pub const XPS_E_MISSING_SEGMENT_DATA = -2142109437;
pub const XPS_E_MISSING_COLORPROFILE = -2142109436;
pub const XPS_E_MISSING_RELATIONSHIP_TARGET = -2142109435;
pub const XPS_E_MISSING_RESOURCE_RELATIONSHIP = -2142109434;
pub const XPS_E_MISSING_FONTURI = -2142109433;
pub const XPS_E_MISSING_DOCUMENTSEQUENCE_RELATIONSHIP = -2142109432;
pub const XPS_E_MISSING_DOCUMENT = -2142109431;
pub const XPS_E_MISSING_REFERRED_DOCUMENT = -2142109430;
pub const XPS_E_MISSING_REFERRED_PAGE = -2142109429;
pub const XPS_E_MISSING_PAGE_IN_DOCUMENT = -2142109428;
pub const XPS_E_MISSING_PAGE_IN_PAGEREFERENCE = -2142109427;
pub const XPS_E_MISSING_IMAGE_IN_IMAGEBRUSH = -2142109426;
pub const XPS_E_MISSING_RESOURCE_KEY = -2142109425;
pub const XPS_E_MISSING_PART_REFERENCE = -2142109424;
pub const XPS_E_MISSING_RESTRICTED_FONT_RELATIONSHIP = -2142109423;
pub const XPS_E_MISSING_DISCARDCONTROL = -2142109422;
pub const XPS_E_MISSING_PART_STREAM = -2142109421;
pub const XPS_E_UNAVAILABLE_PACKAGE = -2142109420;
pub const XPS_E_DUPLICATE_RESOURCE_KEYS = -2142109184;
pub const XPS_E_MULTIPLE_RESOURCES = -2142109183;
pub const XPS_E_MULTIPLE_DOCUMENTSEQUENCE_RELATIONSHIPS = -2142109182;
pub const XPS_E_MULTIPLE_THUMBNAILS_ON_PAGE = -2142109181;
pub const XPS_E_MULTIPLE_THUMBNAILS_ON_PACKAGE = -2142109180;
pub const XPS_E_MULTIPLE_PRINTTICKETS_ON_PAGE = -2142109179;
pub const XPS_E_MULTIPLE_PRINTTICKETS_ON_DOCUMENT = -2142109178;
pub const XPS_E_MULTIPLE_PRINTTICKETS_ON_DOCUMENTSEQUENCE = -2142109177;
pub const XPS_E_MULTIPLE_REFERENCES_TO_PART = -2142109176;
pub const XPS_E_DUPLICATE_NAMES = -2142109175;
pub const XPS_E_STRING_TOO_LONG = -2142108928;
pub const XPS_E_TOO_MANY_INDICES = -2142108927;
pub const XPS_E_MAPPING_OUT_OF_ORDER = -2142108926;
pub const XPS_E_MAPPING_OUTSIDE_STRING = -2142108925;
pub const XPS_E_MAPPING_OUTSIDE_INDICES = -2142108924;
pub const XPS_E_CARET_OUTSIDE_STRING = -2142108923;
pub const XPS_E_CARET_OUT_OF_ORDER = -2142108922;
pub const XPS_E_ODD_BIDILEVEL = -2142108921;
pub const XPS_E_ONE_TO_ONE_MAPPING_EXPECTED = -2142108920;
pub const XPS_E_RESTRICTED_FONT_NOT_OBFUSCATED = -2142108919;
pub const XPS_E_NEGATIVE_FLOAT = -2142108918;
pub const XPS_E_XKEY_ATTR_PRESENT_OUTSIDE_RES_DICT = -2142108672;
pub const XPS_E_DICTIONARY_ITEM_NAMED = -2142108671;
pub const XPS_E_NESTED_REMOTE_DICTIONARY = -2142108670;
pub const XPS_E_INDEX_OUT_OF_RANGE = -2142108416;
pub const XPS_E_VISUAL_CIRCULAR_REF = -2142108415;
pub const XPS_E_NO_CUSTOM_OBJECTS = -2142108414;
pub const XPS_E_ALREADY_OWNED = -2142108413;
pub const XPS_E_RESOURCE_NOT_OWNED = -2142108412;
pub const XPS_E_UNEXPECTED_COLORPROFILE = -2142108411;
pub const XPS_E_COLOR_COMPONENT_OUT_OF_RANGE = -2142108410;
pub const XPS_E_BOTH_PATHFIGURE_AND_ABBR_SYNTAX_PRESENT = -2142108409;
pub const XPS_E_BOTH_RESOURCE_AND_SOURCEATTR_PRESENT = -2142108408;
pub const XPS_E_BLEED_BOX_PAGE_DIMENSIONS_NOT_IN_SYNC = -2142108407;
pub const XPS_E_RELATIONSHIP_EXTERNAL = -2142108406;
pub const XPS_E_NOT_ENOUGH_GRADIENT_STOPS = -2142108405;
pub const XPS_E_PACKAGE_WRITER_NOT_CLOSED = -2142108404;
pub const PSINJECT_BEGINSTREAM = 1;
pub const PSINJECT_PSADOBE = 2;
pub const PSINJECT_PAGESATEND = 3;
pub const PSINJECT_PAGES = 4;
pub const PSINJECT_DOCNEEDEDRES = 5;
pub const PSINJECT_DOCSUPPLIEDRES = 6;
pub const PSINJECT_PAGEORDER = 7;
pub const PSINJECT_ORIENTATION = 8;
pub const PSINJECT_BOUNDINGBOX = 9;
pub const PSINJECT_DOCUMENTPROCESSCOLORS = 10;
pub const PSINJECT_COMMENTS = 11;
pub const PSINJECT_BEGINDEFAULTS = 12;
pub const PSINJECT_ENDDEFAULTS = 13;
pub const PSINJECT_BEGINPROLOG = 14;
pub const PSINJECT_ENDPROLOG = 15;
pub const PSINJECT_BEGINSETUP = 16;
pub const PSINJECT_ENDSETUP = 17;
pub const PSINJECT_TRAILER = 18;
pub const PSINJECT_EOF = 19;
pub const PSINJECT_ENDSTREAM = 20;
pub const PSINJECT_DOCUMENTPROCESSCOLORSATEND = 21;
pub const PSINJECT_PAGENUMBER = 100;
pub const PSINJECT_BEGINPAGESETUP = 101;
pub const PSINJECT_ENDPAGESETUP = 102;
pub const PSINJECT_PAGETRAILER = 103;
pub const PSINJECT_PLATECOLOR = 104;
pub const PSINJECT_SHOWPAGE = 105;
pub const PSINJECT_PAGEBBOX = 106;
pub const PSINJECT_ENDPAGECOMMENTS = 107;
pub const PSINJECT_VMSAVE = 200;
pub const PSINJECT_VMRESTORE = 201;
pub const XPS_TILE_MODE_NONE = 1;
pub const XPS_TILE_MODE_TILE = 2;
pub const XPS_TILE_MODE_FLIPX = 3;
pub const XPS_TILE_MODE_FLIPY = 4;
pub const XPS_TILE_MODE_FLIPXY = 5;
pub const XPS_COLOR_INTERPOLATION_SCRGBLINEAR = 1;
pub const XPS_COLOR_INTERPOLATION_SRGBLINEAR = 2;
pub const XPS_SPREAD_METHOD_PAD = 1;
pub const XPS_SPREAD_METHOD_REFLECT = 2;
pub const XPS_SPREAD_METHOD_REPEAT = 3;
pub const XPS_STYLE_SIMULATION_NONE = 1;
pub const XPS_STYLE_SIMULATION_ITALIC = 2;
pub const XPS_STYLE_SIMULATION_BOLD = 3;
pub const XPS_STYLE_SIMULATION_BOLDITALIC = 4;
pub const XPS_LINE_CAP_FLAT = 1;
pub const XPS_LINE_CAP_ROUND = 2;
pub const XPS_LINE_CAP_SQUARE = 3;
pub const XPS_LINE_CAP_TRIANGLE = 4;
pub const XPS_DASH_CAP_FLAT = 1;
pub const XPS_DASH_CAP_ROUND = 2;
pub const XPS_DASH_CAP_SQUARE = 3;
pub const XPS_DASH_CAP_TRIANGLE = 4;
pub const XPS_LINE_JOIN_MITER = 1;
pub const XPS_LINE_JOIN_BEVEL = 2;
pub const XPS_LINE_JOIN_ROUND = 3;
pub const XPS_IMAGE_TYPE_JPEG = 1;
pub const XPS_IMAGE_TYPE_PNG = 2;
pub const XPS_IMAGE_TYPE_TIFF = 3;
pub const XPS_IMAGE_TYPE_WDP = 4;
pub const XPS_IMAGE_TYPE_JXR = 5;
pub const XPS_COLOR_TYPE_SRGB = 1;
pub const XPS_COLOR_TYPE_SCRGB = 2;
pub const XPS_COLOR_TYPE_CONTEXT = 3;
pub const XPS_FILL_RULE_EVENODD = 1;
pub const XPS_FILL_RULE_NONZERO = 2;
pub const XPS_SEGMENT_TYPE_ARC_LARGE_CLOCKWISE = 1;
pub const XPS_SEGMENT_TYPE_ARC_LARGE_COUNTERCLOCKWISE = 2;
pub const XPS_SEGMENT_TYPE_ARC_SMALL_CLOCKWISE = 3;
pub const XPS_SEGMENT_TYPE_ARC_SMALL_COUNTERCLOCKWISE = 4;
pub const XPS_SEGMENT_TYPE_BEZIER = 5;
pub const XPS_SEGMENT_TYPE_LINE = 6;
pub const XPS_SEGMENT_TYPE_QUADRATIC_BEZIER = 7;
pub const XPS_SEGMENT_STROKE_PATTERN_ALL = 1;
pub const XPS_SEGMENT_STROKE_PATTERN_NONE = 2;
pub const XPS_SEGMENT_STROKE_PATTERN_MIXED = 3;
pub const XPS_FONT_EMBEDDING_NORMAL = 1;
pub const XPS_FONT_EMBEDDING_OBFUSCATED = 2;
pub const XPS_FONT_EMBEDDING_RESTRICTED = 3;
pub const XPS_FONT_EMBEDDING_RESTRICTED_UNOBFUSCATED = 4;
pub const XPS_OBJECT_TYPE_CANVAS = 1;
pub const XPS_OBJECT_TYPE_GLYPHS = 2;
pub const XPS_OBJECT_TYPE_PATH = 3;
pub const XPS_OBJECT_TYPE_MATRIX_TRANSFORM = 4;
pub const XPS_OBJECT_TYPE_GEOMETRY = 5;
pub const XPS_OBJECT_TYPE_SOLID_COLOR_BRUSH = 6;
pub const XPS_OBJECT_TYPE_IMAGE_BRUSH = 7;
pub const XPS_OBJECT_TYPE_LINEAR_GRADIENT_BRUSH = 8;
pub const XPS_OBJECT_TYPE_RADIAL_GRADIENT_BRUSH = 9;
pub const XPS_OBJECT_TYPE_VISUAL_BRUSH = 10;
pub const XPS_THUMBNAIL_SIZE_VERYSMALL = 1;
pub const XPS_THUMBNAIL_SIZE_SMALL = 2;
pub const XPS_THUMBNAIL_SIZE_MEDIUM = 3;
pub const XPS_THUMBNAIL_SIZE_LARGE = 4;
pub const XPS_INTERLEAVING_OFF = 1;
pub const XPS_INTERLEAVING_ON = 2;
pub const XPS_DOCUMENT_TYPE_UNSPECIFIED = 1;
pub const XPS_DOCUMENT_TYPE_XPS = 2;
pub const XPS_DOCUMENT_TYPE_OPENXPS = 3;
pub const XPS_SIGNATURE_STATUS_INCOMPLIANT = 1;
pub const XPS_SIGNATURE_STATUS_INCOMPLETE = 2;
pub const XPS_SIGNATURE_STATUS_BROKEN = 3;
pub const XPS_SIGNATURE_STATUS_QUESTIONABLE = 4;
pub const XPS_SIGNATURE_STATUS_VALID = 5;
pub const XPS_SIGN_POLICY_NONE = 0;
pub const XPS_SIGN_POLICY_CORE_PROPERTIES = 1;
pub const XPS_SIGN_POLICY_SIGNATURE_RELATIONSHIPS = 2;
pub const XPS_SIGN_POLICY_PRINT_TICKET = 4;
pub const XPS_SIGN_POLICY_DISCARD_CONTROL = 8;
pub const XPS_SIGN_POLICY_ALL = 15;
pub const XPS_SIGN_FLAGS_NONE = 0;
pub const XPS_SIGN_FLAGS_IGNORE_MARKUP_COMPATIBILITY = 1;

pub const aliases = struct {
    pub const PRINT_WINDOW_FLAGS = u32;
    pub const PRINTER_DEVICE_CAPABILITIES = u16;
    pub const PSINJECT_POINT = u16;
    pub const XPS_TILE_MODE = i32;
    pub const XPS_COLOR_INTERPOLATION = i32;
    pub const XPS_SPREAD_METHOD = i32;
    pub const XPS_STYLE_SIMULATION = i32;
    pub const XPS_LINE_CAP = i32;
    pub const XPS_DASH_CAP = i32;
    pub const XPS_LINE_JOIN = i32;
    pub const XPS_IMAGE_TYPE = i32;
    pub const XPS_COLOR_TYPE = i32;
    pub const XPS_FILL_RULE = i32;
    pub const XPS_SEGMENT_TYPE = i32;
    pub const XPS_SEGMENT_STROKE_PATTERN = i32;
    pub const XPS_FONT_EMBEDDING = i32;
    pub const XPS_OBJECT_TYPE = i32;
    pub const XPS_THUMBNAIL_SIZE = i32;
    pub const XPS_INTERLEAVING = i32;
    pub const XPS_DOCUMENT_TYPE = i32;
    pub const XPS_SIGNATURE_STATUS = i32;
    pub const XPS_SIGN_POLICY = i32;
    pub const XPS_SIGN_FLAGS = i32;
};
