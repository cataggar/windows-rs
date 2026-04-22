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
    .{ "CreateXmlReader", MethodRecord{ .library = "XmlLite", .import = "CreateXmlReader", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x0f\x01\x12\x82\xd9" } },
    .{ "CreateXmlReaderInputWithEncodingCodePage", MethodRecord{ .library = "XmlLite", .import = "CreateXmlReaderInputWithEncodingCodePage", .signature = "\x00\x06\x11\x79\x12\x82\xb1\x12\x82\xd9\x09\x11\x59\x11\x05\x0f\x12\x82\xb1" } },
    .{ "CreateXmlReaderInputWithEncodingName", MethodRecord{ .library = "XmlLite", .import = "CreateXmlReaderInputWithEncodingName", .signature = "\x00\x06\x11\x79\x12\x82\xb1\x12\x82\xd9\x11\x05\x11\x59\x11\x05\x0f\x12\x82\xb1" } },
    .{ "CreateXmlWriter", MethodRecord{ .library = "XmlLite", .import = "CreateXmlWriter", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x0f\x01\x12\x82\xd9" } },
    .{ "CreateXmlWriterOutputWithEncodingCodePage", MethodRecord{ .library = "XmlLite", .import = "CreateXmlWriterOutputWithEncodingCodePage", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x12\x82\xd9\x09\x0f\x12\x82\xb1" } },
    .{ "CreateXmlWriterOutputWithEncodingName", MethodRecord{ .library = "XmlLite", .import = "CreateXmlWriterOutputWithEncodingName", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x12\x82\xd9\x11\x05\x0f\x12\x82\xb1" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x2d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IMalloc" },
        else => null,
    };
}

pub const XmlNodeType_None = 0;
pub const XmlNodeType_Element = 1;
pub const XmlNodeType_Attribute = 2;
pub const XmlNodeType_Text = 3;
pub const XmlNodeType_CDATA = 4;
pub const XmlNodeType_ProcessingInstruction = 7;
pub const XmlNodeType_Comment = 8;
pub const XmlNodeType_DocumentType = 10;
pub const XmlNodeType_Whitespace = 13;
pub const XmlNodeType_EndElement = 15;
pub const XmlNodeType_XmlDeclaration = 17;
pub const _XmlNodeType_Last = 17;
pub const XmlConformanceLevel_Auto = 0;
pub const XmlConformanceLevel_Fragment = 1;
pub const XmlConformanceLevel_Document = 2;
pub const _XmlConformanceLevel_Last = 2;
pub const DtdProcessing_Prohibit = 0;
pub const DtdProcessing_Parse = 1;
pub const _DtdProcessing_Last = 1;
pub const XmlReadState_Initial = 0;
pub const XmlReadState_Interactive = 1;
pub const XmlReadState_Error = 2;
pub const XmlReadState_EndOfFile = 3;
pub const XmlReadState_Closed = 4;
pub const XmlReaderProperty_MultiLanguage = 0;
pub const XmlReaderProperty_ConformanceLevel = 1;
pub const XmlReaderProperty_RandomAccess = 2;
pub const XmlReaderProperty_XmlResolver = 3;
pub const XmlReaderProperty_DtdProcessing = 4;
pub const XmlReaderProperty_ReadState = 5;
pub const XmlReaderProperty_MaxElementDepth = 6;
pub const XmlReaderProperty_MaxEntityExpansion = 7;
pub const _XmlReaderProperty_Last = 7;
pub const MX_E_MX = -1072894464;
pub const MX_E_INPUTEND = -1072894463;
pub const MX_E_ENCODING = -1072894462;
pub const MX_E_ENCODINGSWITCH = -1072894461;
pub const MX_E_ENCODINGSIGNATURE = -1072894460;
pub const WC_E_WC = -1072894432;
pub const WC_E_WHITESPACE = -1072894431;
pub const WC_E_SEMICOLON = -1072894430;
pub const WC_E_GREATERTHAN = -1072894429;
pub const WC_E_QUOTE = -1072894428;
pub const WC_E_EQUAL = -1072894427;
pub const WC_E_LESSTHAN = -1072894426;
pub const WC_E_HEXDIGIT = -1072894425;
pub const WC_E_DIGIT = -1072894424;
pub const WC_E_LEFTBRACKET = -1072894423;
pub const WC_E_LEFTPAREN = -1072894422;
pub const WC_E_XMLCHARACTER = -1072894421;
pub const WC_E_NAMECHARACTER = -1072894420;
pub const WC_E_SYNTAX = -1072894419;
pub const WC_E_CDSECT = -1072894418;
pub const WC_E_COMMENT = -1072894417;
pub const WC_E_CONDSECT = -1072894416;
pub const WC_E_DECLATTLIST = -1072894415;
pub const WC_E_DECLDOCTYPE = -1072894414;
pub const WC_E_DECLELEMENT = -1072894413;
pub const WC_E_DECLENTITY = -1072894412;
pub const WC_E_DECLNOTATION = -1072894411;
pub const WC_E_NDATA = -1072894410;
pub const WC_E_PUBLIC = -1072894409;
pub const WC_E_SYSTEM = -1072894408;
pub const WC_E_NAME = -1072894407;
pub const WC_E_ROOTELEMENT = -1072894406;
pub const WC_E_ELEMENTMATCH = -1072894405;
pub const WC_E_UNIQUEATTRIBUTE = -1072894404;
pub const WC_E_TEXTXMLDECL = -1072894403;
pub const WC_E_LEADINGXML = -1072894402;
pub const WC_E_TEXTDECL = -1072894401;
pub const WC_E_XMLDECL = -1072894400;
pub const WC_E_ENCNAME = -1072894399;
pub const WC_E_PUBLICID = -1072894398;
pub const WC_E_PESINTERNALSUBSET = -1072894397;
pub const WC_E_PESBETWEENDECLS = -1072894396;
pub const WC_E_NORECURSION = -1072894395;
pub const WC_E_ENTITYCONTENT = -1072894394;
pub const WC_E_UNDECLAREDENTITY = -1072894393;
pub const WC_E_PARSEDENTITY = -1072894392;
pub const WC_E_NOEXTERNALENTITYREF = -1072894391;
pub const WC_E_PI = -1072894390;
pub const WC_E_SYSTEMID = -1072894389;
pub const WC_E_QUESTIONMARK = -1072894388;
pub const WC_E_CDSECTEND = -1072894387;
pub const WC_E_MOREDATA = -1072894386;
pub const WC_E_DTDPROHIBITED = -1072894385;
pub const WC_E_INVALIDXMLSPACE = -1072894384;
pub const NC_E_NC = -1072894368;
pub const NC_E_QNAMECHARACTER = -1072894367;
pub const NC_E_QNAMECOLON = -1072894366;
pub const NC_E_NAMECOLON = -1072894365;
pub const NC_E_DECLAREDPREFIX = -1072894364;
pub const NC_E_UNDECLAREDPREFIX = -1072894363;
pub const NC_E_EMPTYURI = -1072894362;
pub const NC_E_XMLPREFIXRESERVED = -1072894361;
pub const NC_E_XMLNSPREFIXRESERVED = -1072894360;
pub const NC_E_XMLURIRESERVED = -1072894359;
pub const NC_E_XMLNSURIRESERVED = -1072894358;
pub const SC_E_SC = -1072894336;
pub const SC_E_MAXELEMENTDEPTH = -1072894335;
pub const SC_E_MAXENTITYEXPANSION = -1072894334;
pub const WR_E_WR = -1072894208;
pub const WR_E_NONWHITESPACE = -1072894207;
pub const WR_E_NSPREFIXDECLARED = -1072894206;
pub const WR_E_NSPREFIXWITHEMPTYNSURI = -1072894205;
pub const WR_E_DUPLICATEATTRIBUTE = -1072894204;
pub const WR_E_XMLNSPREFIXDECLARATION = -1072894203;
pub const WR_E_XMLPREFIXDECLARATION = -1072894202;
pub const WR_E_XMLURIDECLARATION = -1072894201;
pub const WR_E_XMLNSURIDECLARATION = -1072894200;
pub const WR_E_NAMESPACEUNDECLARED = -1072894199;
pub const WR_E_INVALIDXMLSPACE = -1072894198;
pub const WR_E_INVALIDACTION = -1072894197;
pub const WR_E_INVALIDSURROGATEPAIR = -1072894196;
pub const XML_E_INVALID_DECIMAL = -1072898019;
pub const XML_E_INVALID_HEXIDECIMAL = -1072898018;
pub const XML_E_INVALID_UNICODE = -1072898017;
pub const XML_E_INVALIDENCODING = -1072897938;
pub const XmlStandalone_Omit = 0;
pub const XmlStandalone_Yes = 1;
pub const XmlStandalone_No = 2;
pub const _XmlStandalone_Last = 2;
pub const XmlWriterProperty_MultiLanguage = 0;
pub const XmlWriterProperty_Indent = 1;
pub const XmlWriterProperty_ByteOrderMark = 2;
pub const XmlWriterProperty_OmitXmlDeclaration = 3;
pub const XmlWriterProperty_ConformanceLevel = 4;
pub const XmlWriterProperty_CompactEmptyElement = 5;
pub const _XmlWriterProperty_Last = 5;

pub const aliases = struct {
    pub const XmlNodeType = i32;
    pub const XmlConformanceLevel = i32;
    pub const DtdProcessing = i32;
    pub const XmlReadState = i32;
    pub const XmlReaderProperty = i32;
    pub const XmlError = i32;
    pub const XmlStandalone = i32;
    pub const XmlWriterProperty = i32;
};
