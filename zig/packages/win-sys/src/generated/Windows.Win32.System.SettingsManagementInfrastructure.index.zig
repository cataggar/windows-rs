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

pub const WCM_SETTINGS_ID_FLAG_REFERENCE = 0;
pub const WCM_SETTINGS_ID_FLAG_DEFINITION = 1;
pub const LINK_STORE_TO_ENGINE_INSTANCE = 1;
pub const LIMITED_VALIDATION_MODE = 1;
pub const WCM_E_INTERNALERROR = -2145255424;
pub const WCM_E_STATENODENOTFOUND = -2145255423;
pub const WCM_E_STATENODENOTALLOWED = -2145255422;
pub const WCM_E_ATTRIBUTENOTFOUND = -2145255421;
pub const WCM_E_ATTRIBUTENOTALLOWED = -2145255420;
pub const WCM_E_INVALIDVALUE = -2145255419;
pub const WCM_E_INVALIDVALUEFORMAT = -2145255418;
pub const WCM_E_TYPENOTSPECIFIED = -2145255417;
pub const WCM_E_INVALIDDATATYPE = -2145255416;
pub const WCM_E_NOTPOSITIONED = -2145255415;
pub const WCM_E_READONLYITEM = -2145255414;
pub const WCM_E_INVALIDPATH = -2145255413;
pub const WCM_E_WRONGESCAPESTRING = -2145255412;
pub const WCM_E_INVALIDVERSIONFORMAT = -2145255411;
pub const WCM_E_INVALIDLANGUAGEFORMAT = -2145255410;
pub const WCM_E_KEYNOTCHANGEABLE = -2145255409;
pub const WCM_E_EXPRESSIONNOTFOUND = -2145255408;
pub const WCM_E_SUBSTITUTIONNOTFOUND = -2145255407;
pub const WCM_E_USERALREADYREGISTERED = -2145255406;
pub const WCM_E_USERNOTFOUND = -2145255405;
pub const WCM_E_NAMESPACENOTFOUND = -2145255404;
pub const WCM_E_NAMESPACEALREADYREGISTERED = -2145255403;
pub const WCM_E_STORECORRUPTED = -2145255402;
pub const WCM_E_INVALIDEXPRESSIONSYNTAX = -2145255401;
pub const WCM_E_NOTIFICATIONNOTFOUND = -2145255400;
pub const WCM_E_CONFLICTINGASSERTION = -2145255399;
pub const WCM_E_ASSERTIONFAILED = -2145255398;
pub const WCM_E_DUPLICATENAME = -2145255397;
pub const WCM_E_INVALIDKEY = -2145255396;
pub const WCM_E_INVALIDSTREAM = -2145255395;
pub const WCM_E_HANDLERNOTFOUND = -2145255394;
pub const WCM_E_INVALIDHANDLERSYNTAX = -2145255393;
pub const WCM_E_VALIDATIONFAILED = -2145255392;
pub const WCM_E_RESTRICTIONFAILED = -2145255391;
pub const WCM_E_MANIFESTCOMPILATIONFAILED = -2145255390;
pub const WCM_E_CYCLICREFERENCE = -2145255389;
pub const WCM_E_MIXTYPEASSERTION = -2145255388;
pub const WCM_E_NOTSUPPORTEDFUNCTION = -2145255387;
pub const WCM_E_VALUETOOBIG = -2145255386;
pub const WCM_E_INVALIDATTRIBUTECOMBINATION = -2145255385;
pub const WCM_E_ABORTOPERATION = -2145255384;
pub const WCM_E_MISSINGCONFIGURATION = -2145255383;
pub const WCM_E_INVALIDPROCESSORFORMAT = -2145255382;
pub const WCM_E_SOURCEMANEMPTYVALUE = -2145255381;
pub const WCM_S_INTERNALERROR = 2232320;
pub const WCM_S_ATTRIBUTENOTFOUND = 2232321;
pub const WCM_S_LEGACYSETTINGWARNING = 2232322;
pub const WCM_S_INVALIDATTRIBUTECOMBINATION = 2232324;
pub const WCM_S_ATTRIBUTENOTALLOWED = 2232325;
pub const WCM_S_NAMESPACENOTFOUND = 2232326;
pub const WCM_E_UNKNOWNRESULT = -2145251325;
pub const OfflineMode = 1;
pub const OnlineMode = 2;
pub const SharedEnumeration = 1;
pub const UserEnumeration = 2;
pub const AllEnumeration = 3;
pub const dataTypeByte = 1;
pub const dataTypeSByte = 2;
pub const dataTypeUInt16 = 3;
pub const dataTypeInt16 = 4;
pub const dataTypeUInt32 = 5;
pub const dataTypeInt32 = 6;
pub const dataTypeUInt64 = 7;
pub const dataTypeInt64 = 8;
pub const dataTypeBoolean = 11;
pub const dataTypeString = 12;
pub const dataTypeFlagArray = 32768;
pub const settingTypeScalar = 1;
pub const settingTypeComplex = 2;
pub const settingTypeList = 3;
pub const restrictionFacetMaxLength = 1;
pub const restrictionFacetEnumeration = 2;
pub const restrictionFacetMaxInclusive = 4;
pub const restrictionFacetMinInclusive = 8;
pub const UnknownStatus = 0;
pub const UserRegistered = 1;
pub const UserUnregistered = 2;
pub const UserLoaded = 3;
pub const UserUnloaded = 4;
pub const ReadOnlyAccess = 1;
pub const ReadWriteAccess = 2;

pub const aliases = struct {
    pub const WcmTargetMode = i32;
    pub const WcmNamespaceEnumerationFlags = i32;
    pub const WcmDataType = i32;
    pub const WcmSettingType = i32;
    pub const WcmRestrictionFacets = i32;
    pub const WcmUserStatus = i32;
    pub const WcmNamespaceAccess = i32;
};
