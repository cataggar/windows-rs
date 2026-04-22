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
    .{ "GetTextCharset", MethodRecord{ .library = "GDI32", .import = "GetTextCharset", .signature = "\x00\x01\x08\x11\x83\x5d" } },
    .{ "GetTextCharsetInfo", MethodRecord{ .library = "GDI32", .import = "GetTextCharsetInfo", .signature = "\x00\x03\x08\x11\x83\x5d\x0f\x11\x8f\x29\x09" } },
    .{ "TranslateCharsetInfo", MethodRecord{ .library = "GDI32", .import = "TranslateCharsetInfo", .signature = "\x00\x03\x11\x59\x0f\x09\x0f\x11\x8f\x2d\x11\x8f\x01" } },
    .{ "GetDateFormatA", MethodRecord{ .library = "KERNEL32", .import = "GetDateFormatA", .signature = "\x00\x06\x08\x09\x09\x0f\x11\x86\x45\x11\x3d\x11\x3d\x08" } },
    .{ "GetDateFormatW", MethodRecord{ .library = "KERNEL32", .import = "GetDateFormatW", .signature = "\x00\x06\x08\x09\x09\x0f\x11\x86\x45\x11\x05\x11\x05\x08" } },
    .{ "GetTimeFormatA", MethodRecord{ .library = "KERNEL32", .import = "GetTimeFormatA", .signature = "\x00\x06\x08\x09\x09\x0f\x11\x86\x45\x11\x3d\x11\x3d\x08" } },
    .{ "GetTimeFormatW", MethodRecord{ .library = "KERNEL32", .import = "GetTimeFormatW", .signature = "\x00\x06\x08\x09\x09\x0f\x11\x86\x45\x11\x05\x11\x05\x08" } },
    .{ "GetTimeFormatEx", MethodRecord{ .library = "KERNEL32", .import = "GetTimeFormatEx", .signature = "\x00\x06\x08\x11\x05\x11\x8f\x05\x0f\x11\x86\x45\x11\x05\x11\x05\x08" } },
    .{ "GetDateFormatEx", MethodRecord{ .library = "KERNEL32", .import = "GetDateFormatEx", .signature = "\x00\x07\x08\x11\x05\x11\x8e\xfd\x0f\x11\x86\x45\x11\x05\x11\x05\x08\x11\x05" } },
    .{ "GetDurationFormatEx", MethodRecord{ .library = "KERNEL32", .import = "GetDurationFormatEx", .signature = "\x00\x07\x08\x11\x05\x09\x0f\x11\x86\x45\x0b\x11\x05\x11\x05\x08" } },
    .{ "CompareStringEx", MethodRecord{ .library = "KERNEL32", .import = "CompareStringEx", .signature = "\x00\x09\x11\x8f\x25\x11\x05\x11\x8f\x11\x11\x05\x08\x11\x05\x08\x0f\x11\x8f\x31\x0f\x01\x11\x82\x2d" } },
    .{ "CompareStringOrdinal", MethodRecord{ .library = "KERNEL32", .import = "CompareStringOrdinal", .signature = "\x00\x05\x11\x8f\x25\x11\x05\x08\x11\x05\x08\x11\x59" } },
    .{ "CompareStringW", MethodRecord{ .library = "KERNEL32", .import = "CompareStringW", .signature = "\x00\x06\x11\x8f\x25\x09\x09\x11\x05\x08\x11\x05\x08" } },
    .{ "FoldStringW", MethodRecord{ .library = "KERNEL32", .import = "FoldStringW", .signature = "\x00\x05\x08\x11\x8e\xf9\x11\x05\x08\x11\x05\x08" } },
    .{ "GetStringTypeExW", MethodRecord{ .library = "KERNEL32", .import = "GetStringTypeExW", .signature = "\x00\x05\x11\x59\x09\x09\x11\x05\x08\x0f\x07" } },
    .{ "GetStringTypeW", MethodRecord{ .library = "KERNEL32", .import = "GetStringTypeW", .signature = "\x00\x04\x11\x59\x09\x11\x05\x08\x0f\x07" } },
    .{ "MultiByteToWideChar", MethodRecord{ .library = "KERNEL32", .import = "MultiByteToWideChar", .signature = "\x00\x06\x08\x09\x11\x8f\x0d\x11\x3d\x08\x11\x05\x08" } },
    .{ "WideCharToMultiByte", MethodRecord{ .library = "KERNEL32", .import = "WideCharToMultiByte", .signature = "\x00\x08\x08\x09\x09\x11\x05\x08\x11\x3d\x08\x11\x3d\x0f\x11\x59" } },
    .{ "IsValidCodePage", MethodRecord{ .library = "KERNEL32", .import = "IsValidCodePage", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "GetACP", MethodRecord{ .library = "KERNEL32", .import = "GetACP", .signature = "\x00\x00\x09" } },
    .{ "GetOEMCP", MethodRecord{ .library = "KERNEL32", .import = "GetOEMCP", .signature = "\x00\x00\x09" } },
    .{ "GetCPInfo", MethodRecord{ .library = "KERNEL32", .import = "GetCPInfo", .signature = "\x00\x02\x11\x59\x09\x0f\x11\x8f\x35" } },
    .{ "GetCPInfoExA", MethodRecord{ .library = "KERNEL32", .import = "GetCPInfoExA", .signature = "\x00\x03\x11\x59\x09\x09\x0f\x11\x8f\x39" } },
    .{ "GetCPInfoExW", MethodRecord{ .library = "KERNEL32", .import = "GetCPInfoExW", .signature = "\x00\x03\x11\x59\x09\x09\x0f\x11\x8f\x3d" } },
    .{ "CompareStringA", MethodRecord{ .library = "KERNEL32", .import = "CompareStringA", .signature = "\x00\x06\x11\x8f\x25\x09\x09\x0f\x04\x08\x0f\x04\x08" } },
    .{ "FindNLSString", MethodRecord{ .library = "KERNEL32", .import = "FindNLSString", .signature = "\x00\x07\x08\x09\x09\x11\x05\x08\x11\x05\x08\x0f\x08" } },
    .{ "LCMapStringW", MethodRecord{ .library = "KERNEL32", .import = "LCMapStringW", .signature = "\x00\x06\x08\x09\x09\x11\x05\x08\x11\x05\x08" } },
    .{ "LCMapStringA", MethodRecord{ .library = "KERNEL32", .import = "LCMapStringA", .signature = "\x00\x06\x08\x09\x09\x11\x3d\x08\x11\x3d\x08" } },
    .{ "GetLocaleInfoW", MethodRecord{ .library = "KERNEL32", .import = "GetLocaleInfoW", .signature = "\x00\x04\x08\x09\x09\x11\x05\x08" } },
    .{ "GetLocaleInfoA", MethodRecord{ .library = "KERNEL32", .import = "GetLocaleInfoA", .signature = "\x00\x04\x08\x09\x09\x11\x3d\x08" } },
    .{ "SetLocaleInfoA", MethodRecord{ .library = "KERNEL32", .import = "SetLocaleInfoA", .signature = "\x00\x03\x11\x59\x09\x09\x11\x3d" } },
    .{ "SetLocaleInfoW", MethodRecord{ .library = "KERNEL32", .import = "SetLocaleInfoW", .signature = "\x00\x03\x11\x59\x09\x09\x11\x05" } },
    .{ "GetCalendarInfoA", MethodRecord{ .library = "KERNEL32", .import = "GetCalendarInfoA", .signature = "\x00\x06\x08\x09\x09\x09\x11\x3d\x08\x0f\x09" } },
    .{ "GetCalendarInfoW", MethodRecord{ .library = "KERNEL32", .import = "GetCalendarInfoW", .signature = "\x00\x06\x08\x09\x09\x09\x11\x05\x08\x0f\x09" } },
    .{ "SetCalendarInfoA", MethodRecord{ .library = "KERNEL32", .import = "SetCalendarInfoA", .signature = "\x00\x04\x11\x59\x09\x09\x09\x11\x3d" } },
    .{ "SetCalendarInfoW", MethodRecord{ .library = "KERNEL32", .import = "SetCalendarInfoW", .signature = "\x00\x04\x11\x59\x09\x09\x09\x11\x05" } },
    .{ "IsDBCSLeadByte", MethodRecord{ .library = "KERNEL32", .import = "IsDBCSLeadByte", .signature = "\x00\x01\x11\x59\x05" } },
    .{ "IsDBCSLeadByteEx", MethodRecord{ .library = "KERNEL32", .import = "IsDBCSLeadByteEx", .signature = "\x00\x02\x11\x59\x09\x05" } },
    .{ "LocaleNameToLCID", MethodRecord{ .library = "KERNEL32", .import = "LocaleNameToLCID", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "LCIDToLocaleName", MethodRecord{ .library = "KERNEL32", .import = "LCIDToLocaleName", .signature = "\x00\x04\x08\x09\x11\x05\x08\x09" } },
    .{ "GetDurationFormat", MethodRecord{ .library = "KERNEL32", .import = "GetDurationFormat", .signature = "\x00\x07\x08\x09\x09\x0f\x11\x86\x45\x0b\x11\x05\x11\x05\x08" } },
    .{ "GetNumberFormatA", MethodRecord{ .library = "KERNEL32", .import = "GetNumberFormatA", .signature = "\x00\x06\x08\x09\x09\x11\x3d\x0f\x11\x8f\x41\x11\x3d\x08" } },
    .{ "GetNumberFormatW", MethodRecord{ .library = "KERNEL32", .import = "GetNumberFormatW", .signature = "\x00\x06\x08\x09\x09\x11\x05\x0f\x11\x8f\x45\x11\x05\x08" } },
    .{ "GetCurrencyFormatA", MethodRecord{ .library = "KERNEL32", .import = "GetCurrencyFormatA", .signature = "\x00\x06\x08\x09\x09\x11\x3d\x0f\x11\x8f\x49\x11\x3d\x08" } },
    .{ "GetCurrencyFormatW", MethodRecord{ .library = "KERNEL32", .import = "GetCurrencyFormatW", .signature = "\x00\x06\x08\x09\x09\x11\x05\x0f\x11\x8f\x4d\x11\x05\x08" } },
    .{ "EnumCalendarInfoA", MethodRecord{ .library = "KERNEL32", .import = "EnumCalendarInfoA", .signature = "\x00\x04\x11\x59\x12\x8f\x51\x09\x09\x09" } },
    .{ "EnumCalendarInfoW", MethodRecord{ .library = "KERNEL32", .import = "EnumCalendarInfoW", .signature = "\x00\x04\x11\x59\x12\x8f\x55\x09\x09\x09" } },
    .{ "EnumCalendarInfoExA", MethodRecord{ .library = "KERNEL32", .import = "EnumCalendarInfoExA", .signature = "\x00\x04\x11\x59\x12\x8f\x59\x09\x09\x09" } },
    .{ "EnumCalendarInfoExW", MethodRecord{ .library = "KERNEL32", .import = "EnumCalendarInfoExW", .signature = "\x00\x04\x11\x59\x12\x8f\x5d\x09\x09\x09" } },
    .{ "EnumTimeFormatsA", MethodRecord{ .library = "KERNEL32", .import = "EnumTimeFormatsA", .signature = "\x00\x03\x11\x59\x12\x8f\x61\x09\x11\x8f\x05" } },
    .{ "EnumTimeFormatsW", MethodRecord{ .library = "KERNEL32", .import = "EnumTimeFormatsW", .signature = "\x00\x03\x11\x59\x12\x8f\x65\x09\x11\x8f\x05" } },
    .{ "EnumDateFormatsA", MethodRecord{ .library = "KERNEL32", .import = "EnumDateFormatsA", .signature = "\x00\x03\x11\x59\x12\x8f\x69\x09\x09" } },
    .{ "EnumDateFormatsW", MethodRecord{ .library = "KERNEL32", .import = "EnumDateFormatsW", .signature = "\x00\x03\x11\x59\x12\x8f\x6d\x09\x09" } },
    .{ "EnumDateFormatsExA", MethodRecord{ .library = "KERNEL32", .import = "EnumDateFormatsExA", .signature = "\x00\x03\x11\x59\x12\x8f\x71\x09\x09" } },
    .{ "EnumDateFormatsExW", MethodRecord{ .library = "KERNEL32", .import = "EnumDateFormatsExW", .signature = "\x00\x03\x11\x59\x12\x8f\x75\x09\x09" } },
    .{ "IsValidLanguageGroup", MethodRecord{ .library = "KERNEL32", .import = "IsValidLanguageGroup", .signature = "\x00\x02\x11\x59\x09\x11\x8f\x09" } },
    .{ "GetNLSVersion", MethodRecord{ .library = "KERNEL32", .import = "GetNLSVersion", .signature = "\x00\x03\x11\x59\x09\x09\x0f\x11\x8f\x31" } },
    .{ "IsValidLocale", MethodRecord{ .library = "KERNEL32", .import = "IsValidLocale", .signature = "\x00\x02\x11\x59\x09\x11\x8f\x15" } },
    .{ "GetGeoInfoA", MethodRecord{ .library = "KERNEL32", .import = "GetGeoInfoA", .signature = "\x00\x05\x08\x08\x11\x8f\x79\x11\x3d\x08\x07" } },
    .{ "GetGeoInfoW", MethodRecord{ .library = "KERNEL32", .import = "GetGeoInfoW", .signature = "\x00\x05\x08\x08\x11\x8f\x79\x11\x05\x08\x07" } },
    .{ "GetGeoInfoEx", MethodRecord{ .library = "KERNEL32", .import = "GetGeoInfoEx", .signature = "\x00\x04\x08\x11\x05\x11\x8f\x79\x11\x05\x08" } },
    .{ "EnumSystemGeoID", MethodRecord{ .library = "KERNEL32", .import = "EnumSystemGeoID", .signature = "\x00\x03\x11\x59\x09\x08\x12\x8f\x7d" } },
    .{ "EnumSystemGeoNames", MethodRecord{ .library = "KERNEL32", .import = "EnumSystemGeoNames", .signature = "\x00\x03\x11\x59\x09\x12\x8f\x81\x11\x82\x2d" } },
    .{ "GetUserGeoID", MethodRecord{ .library = "KERNEL32", .import = "GetUserGeoID", .signature = "\x00\x01\x08\x11\x8f\x85" } },
    .{ "GetUserDefaultGeoName", MethodRecord{ .library = "KERNEL32", .import = "GetUserDefaultGeoName", .signature = "\x00\x02\x08\x11\x05\x08" } },
    .{ "SetUserGeoID", MethodRecord{ .library = "KERNEL32", .import = "SetUserGeoID", .signature = "\x00\x01\x11\x59\x08" } },
    .{ "SetUserGeoName", MethodRecord{ .library = "KERNEL32", .import = "SetUserGeoName", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "ConvertDefaultLocale", MethodRecord{ .library = "KERNEL32", .import = "ConvertDefaultLocale", .signature = "\x00\x01\x09\x09" } },
    .{ "GetSystemDefaultUILanguage", MethodRecord{ .library = "KERNEL32", .import = "GetSystemDefaultUILanguage", .signature = "\x00\x00\x07" } },
    .{ "GetThreadLocale", MethodRecord{ .library = "KERNEL32", .import = "GetThreadLocale", .signature = "\x00\x00\x09" } },
    .{ "SetThreadLocale", MethodRecord{ .library = "KERNEL32", .import = "SetThreadLocale", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "GetUserDefaultUILanguage", MethodRecord{ .library = "KERNEL32", .import = "GetUserDefaultUILanguage", .signature = "\x00\x00\x07" } },
    .{ "GetUserDefaultLangID", MethodRecord{ .library = "KERNEL32", .import = "GetUserDefaultLangID", .signature = "\x00\x00\x07" } },
    .{ "GetSystemDefaultLangID", MethodRecord{ .library = "KERNEL32", .import = "GetSystemDefaultLangID", .signature = "\x00\x00\x07" } },
    .{ "GetSystemDefaultLCID", MethodRecord{ .library = "KERNEL32", .import = "GetSystemDefaultLCID", .signature = "\x00\x00\x09" } },
    .{ "GetUserDefaultLCID", MethodRecord{ .library = "KERNEL32", .import = "GetUserDefaultLCID", .signature = "\x00\x00\x09" } },
    .{ "SetThreadUILanguage", MethodRecord{ .library = "KERNEL32", .import = "SetThreadUILanguage", .signature = "\x00\x01\x07\x07" } },
    .{ "GetThreadUILanguage", MethodRecord{ .library = "KERNEL32", .import = "GetThreadUILanguage", .signature = "\x00\x00\x07" } },
    .{ "GetProcessPreferredUILanguages", MethodRecord{ .library = "KERNEL32", .import = "GetProcessPreferredUILanguages", .signature = "\x00\x04\x11\x59\x09\x0f\x09\x11\x05\x0f\x09" } },
    .{ "SetProcessPreferredUILanguages", MethodRecord{ .library = "KERNEL32", .import = "SetProcessPreferredUILanguages", .signature = "\x00\x03\x11\x59\x09\x11\x05\x0f\x09" } },
    .{ "GetUserPreferredUILanguages", MethodRecord{ .library = "KERNEL32", .import = "GetUserPreferredUILanguages", .signature = "\x00\x04\x11\x59\x09\x0f\x09\x11\x05\x0f\x09" } },
    .{ "GetSystemPreferredUILanguages", MethodRecord{ .library = "KERNEL32", .import = "GetSystemPreferredUILanguages", .signature = "\x00\x04\x11\x59\x09\x0f\x09\x11\x05\x0f\x09" } },
    .{ "GetThreadPreferredUILanguages", MethodRecord{ .library = "KERNEL32", .import = "GetThreadPreferredUILanguages", .signature = "\x00\x04\x11\x59\x09\x0f\x09\x11\x05\x0f\x09" } },
    .{ "SetThreadPreferredUILanguages", MethodRecord{ .library = "KERNEL32", .import = "SetThreadPreferredUILanguages", .signature = "\x00\x03\x11\x59\x09\x11\x05\x0f\x09" } },
    .{ "GetFileMUIInfo", MethodRecord{ .library = "KERNEL32", .import = "GetFileMUIInfo", .signature = "\x00\x04\x11\x59\x09\x11\x05\x0f\x11\x8f\x89\x0f\x09" } },
    .{ "GetFileMUIPath", MethodRecord{ .library = "KERNEL32", .import = "GetFileMUIPath", .signature = "\x00\x07\x11\x59\x09\x11\x05\x11\x05\x0f\x09\x11\x05\x0f\x09\x0f\x0b" } },
    .{ "GetUILanguageInfo", MethodRecord{ .library = "KERNEL32", .import = "GetUILanguageInfo", .signature = "\x00\x05\x11\x59\x09\x11\x05\x11\x05\x0f\x09\x0f\x09" } },
    .{ "SetThreadPreferredUILanguages2", MethodRecord{ .library = "KERNEL32", .import = "SetThreadPreferredUILanguages2", .signature = "\x00\x04\x11\x59\x09\x11\x05\x0f\x09\x0f\x11\x8f\x8d" } },
    .{ "RestoreThreadPreferredUILanguages", MethodRecord{ .library = "KERNEL32", .import = "RestoreThreadPreferredUILanguages", .signature = "\x00\x01\x01\x11\x8f\x8d" } },
    .{ "NotifyUILanguageChange", MethodRecord{ .library = "KERNEL32", .import = "NotifyUILanguageChange", .signature = "\x00\x05\x11\x59\x09\x11\x05\x11\x05\x09\x0f\x09" } },
    .{ "GetStringTypeExA", MethodRecord{ .library = "KERNEL32", .import = "GetStringTypeExA", .signature = "\x00\x05\x11\x59\x09\x09\x11\x3d\x08\x0f\x07" } },
    .{ "GetStringTypeA", MethodRecord{ .library = "KERNEL32", .import = "GetStringTypeA", .signature = "\x00\x05\x11\x59\x09\x09\x11\x3d\x08\x0f\x07" } },
    .{ "FoldStringA", MethodRecord{ .library = "KERNEL32", .import = "FoldStringA", .signature = "\x00\x05\x08\x11\x8e\xf9\x11\x3d\x08\x11\x3d\x08" } },
    .{ "EnumSystemLocalesA", MethodRecord{ .library = "KERNEL32", .import = "EnumSystemLocalesA", .signature = "\x00\x02\x11\x59\x12\x8f\x91\x09" } },
    .{ "EnumSystemLocalesW", MethodRecord{ .library = "KERNEL32", .import = "EnumSystemLocalesW", .signature = "\x00\x02\x11\x59\x12\x8f\x95\x09" } },
    .{ "EnumSystemLanguageGroupsA", MethodRecord{ .library = "KERNEL32", .import = "EnumSystemLanguageGroupsA", .signature = "\x00\x03\x11\x59\x12\x8f\x99\x11\x8f\x09\x18" } },
    .{ "EnumSystemLanguageGroupsW", MethodRecord{ .library = "KERNEL32", .import = "EnumSystemLanguageGroupsW", .signature = "\x00\x03\x11\x59\x12\x8f\x9d\x11\x8f\x09\x18" } },
    .{ "EnumLanguageGroupLocalesA", MethodRecord{ .library = "KERNEL32", .import = "EnumLanguageGroupLocalesA", .signature = "\x00\x04\x11\x59\x12\x8f\xa1\x09\x09\x18" } },
    .{ "EnumLanguageGroupLocalesW", MethodRecord{ .library = "KERNEL32", .import = "EnumLanguageGroupLocalesW", .signature = "\x00\x04\x11\x59\x12\x8f\xa5\x09\x09\x18" } },
    .{ "EnumUILanguagesA", MethodRecord{ .library = "KERNEL32", .import = "EnumUILanguagesA", .signature = "\x00\x03\x11\x59\x12\x8f\xa9\x09\x18" } },
    .{ "EnumUILanguagesW", MethodRecord{ .library = "KERNEL32", .import = "EnumUILanguagesW", .signature = "\x00\x03\x11\x59\x12\x8f\xad\x09\x18" } },
    .{ "EnumSystemCodePagesA", MethodRecord{ .library = "KERNEL32", .import = "EnumSystemCodePagesA", .signature = "\x00\x02\x11\x59\x12\x8f\xb1\x11\x8f\x19" } },
    .{ "EnumSystemCodePagesW", MethodRecord{ .library = "KERNEL32", .import = "EnumSystemCodePagesW", .signature = "\x00\x02\x11\x59\x12\x8f\xb5\x11\x8f\x19" } },
    .{ "IdnToAscii", MethodRecord{ .library = "NORMALIZ", .import = "IdnToAscii", .signature = "\x00\x05\x08\x09\x11\x05\x08\x11\x05\x08" } },
    .{ "IdnToUnicode", MethodRecord{ .library = "NORMALIZ", .import = "IdnToUnicode", .signature = "\x00\x05\x08\x09\x11\x05\x08\x11\x05\x08" } },
    .{ "IdnToNameprepUnicode", MethodRecord{ .library = "KERNEL32", .import = "IdnToNameprepUnicode", .signature = "\x00\x05\x08\x09\x11\x05\x08\x11\x05\x08" } },
    .{ "NormalizeString", MethodRecord{ .library = "KERNEL32", .import = "NormalizeString", .signature = "\x00\x05\x08\x11\x8f\xb9\x11\x05\x08\x11\x05\x08" } },
    .{ "IsNormalizedString", MethodRecord{ .library = "KERNEL32", .import = "IsNormalizedString", .signature = "\x00\x03\x11\x59\x11\x8f\xb9\x11\x05\x08" } },
    .{ "VerifyScripts", MethodRecord{ .library = "KERNEL32", .import = "VerifyScripts", .signature = "\x00\x05\x11\x59\x09\x11\x05\x08\x11\x05\x08" } },
    .{ "GetStringScripts", MethodRecord{ .library = "KERNEL32", .import = "GetStringScripts", .signature = "\x00\x05\x08\x09\x11\x05\x08\x11\x05\x08" } },
    .{ "GetLocaleInfoEx", MethodRecord{ .library = "KERNEL32", .import = "GetLocaleInfoEx", .signature = "\x00\x04\x08\x11\x05\x09\x11\x05\x08" } },
    .{ "GetCalendarInfoEx", MethodRecord{ .library = "KERNEL32", .import = "GetCalendarInfoEx", .signature = "\x00\x07\x08\x11\x05\x09\x11\x05\x09\x11\x05\x08\x0f\x09" } },
    .{ "GetNumberFormatEx", MethodRecord{ .library = "KERNEL32", .import = "GetNumberFormatEx", .signature = "\x00\x06\x08\x11\x05\x09\x11\x05\x0f\x11\x8f\x45\x11\x05\x08" } },
    .{ "GetCurrencyFormatEx", MethodRecord{ .library = "KERNEL32", .import = "GetCurrencyFormatEx", .signature = "\x00\x06\x08\x11\x05\x09\x11\x05\x0f\x11\x8f\x4d\x11\x05\x08" } },
    .{ "GetUserDefaultLocaleName", MethodRecord{ .library = "KERNEL32", .import = "GetUserDefaultLocaleName", .signature = "\x00\x02\x08\x11\x05\x08" } },
    .{ "GetSystemDefaultLocaleName", MethodRecord{ .library = "KERNEL32", .import = "GetSystemDefaultLocaleName", .signature = "\x00\x02\x08\x11\x05\x08" } },
    .{ "IsNLSDefinedString", MethodRecord{ .library = "KERNEL32", .import = "IsNLSDefinedString", .signature = "\x00\x05\x11\x59\x09\x09\x0f\x11\x8f\x31\x11\x05\x08" } },
    .{ "GetNLSVersionEx", MethodRecord{ .library = "KERNEL32", .import = "GetNLSVersionEx", .signature = "\x00\x03\x11\x59\x09\x11\x05\x0f\x11\x8f\xbd" } },
    .{ "IsValidNLSVersion", MethodRecord{ .library = "KERNEL32", .import = "IsValidNLSVersion", .signature = "\x00\x03\x09\x09\x11\x05\x0f\x11\x8f\xbd" } },
    .{ "FindNLSStringEx", MethodRecord{ .library = "KERNEL32", .import = "FindNLSStringEx", .signature = "\x00\x0a\x08\x11\x05\x09\x11\x05\x08\x11\x05\x08\x0f\x08\x0f\x11\x8f\x31\x0f\x01\x11\x82\x2d" } },
    .{ "LCMapStringEx", MethodRecord{ .library = "KERNEL32", .import = "LCMapStringEx", .signature = "\x00\x09\x08\x11\x05\x09\x11\x05\x08\x11\x05\x08\x0f\x11\x8f\x31\x0f\x01\x11\x82\x2d" } },
    .{ "IsValidLocaleName", MethodRecord{ .library = "KERNEL32", .import = "IsValidLocaleName", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "EnumCalendarInfoExEx", MethodRecord{ .library = "KERNEL32", .import = "EnumCalendarInfoExEx", .signature = "\x00\x06\x11\x59\x12\x8f\xc1\x11\x05\x09\x11\x05\x09\x11\x82\x2d" } },
    .{ "EnumDateFormatsExEx", MethodRecord{ .library = "KERNEL32", .import = "EnumDateFormatsExEx", .signature = "\x00\x04\x11\x59\x12\x8f\xc5\x11\x05\x11\x8e\xfd\x11\x82\x2d" } },
    .{ "EnumTimeFormatsEx", MethodRecord{ .library = "KERNEL32", .import = "EnumTimeFormatsEx", .signature = "\x00\x04\x11\x59\x12\x8f\xc9\x11\x05\x09\x11\x82\x2d" } },
    .{ "EnumSystemLocalesEx", MethodRecord{ .library = "KERNEL32", .import = "EnumSystemLocalesEx", .signature = "\x00\x04\x11\x59\x12\x8f\xcd\x09\x11\x82\x2d\x0f\x01" } },
    .{ "ResolveLocaleName", MethodRecord{ .library = "KERNEL32", .import = "ResolveLocaleName", .signature = "\x00\x03\x08\x11\x05\x11\x05\x08" } },
    .{ "MappingGetServices", MethodRecord{ .library = "elscore", .import = "MappingGetServices", .signature = "\x00\x03\x11\x79\x0f\x11\x8f\xd1\x0f\x0f\x11\x8f\xd5\x0f\x09" } },
    .{ "MappingFreeServices", MethodRecord{ .library = "elscore", .import = "MappingFreeServices", .signature = "\x00\x01\x11\x79\x0f\x11\x8f\xd5" } },
    .{ "MappingRecognizeText", MethodRecord{ .library = "elscore", .import = "MappingRecognizeText", .signature = "\x00\x06\x11\x79\x0f\x11\x8f\xd5\x11\x05\x09\x09\x0f\x11\x8f\xd9\x0f\x11\x8f\xdd" } },
    .{ "MappingDoAction", MethodRecord{ .library = "elscore", .import = "MappingDoAction", .signature = "\x00\x03\x11\x79\x0f\x11\x8f\xdd\x09\x11\x05" } },
    .{ "MappingFreePropertyBag", MethodRecord{ .library = "elscore", .import = "MappingFreePropertyBag", .signature = "\x00\x01\x11\x79\x0f\x11\x8f\xdd" } },
    .{ "ScriptFreeCache", MethodRecord{ .library = "USP10", .import = "ScriptFreeCache", .signature = "\x00\x01\x11\x79\x0f\x0f\x01" } },
    .{ "ScriptItemize", MethodRecord{ .library = "USP10", .import = "ScriptItemize", .signature = "\x00\x07\x11\x79\x11\x05\x08\x08\x0f\x11\x8f\xe1\x0f\x11\x8f\xe5\x0f\x11\x8f\xe9\x0f\x08" } },
    .{ "ScriptLayout", MethodRecord{ .library = "USP10", .import = "ScriptLayout", .signature = "\x00\x04\x11\x79\x08\x0f\x05\x0f\x08\x0f\x08" } },
    .{ "ScriptShape", MethodRecord{ .library = "USP10", .import = "ScriptShape", .signature = "\x00\x0a\x11\x79\x11\x83\x5d\x0f\x0f\x01\x11\x05\x08\x08\x0f\x11\x8f\xed\x0f\x07\x0f\x07\x0f\x11\x8f\xf1\x0f\x08" } },
    .{ "ScriptPlace", MethodRecord{ .library = "USP10", .import = "ScriptPlace", .signature = "\x00\x09\x11\x79\x11\x83\x5d\x0f\x0f\x01\x0f\x07\x08\x0f\x11\x8f\xf1\x0f\x11\x8f\xed\x0f\x08\x0f\x11\x8f\xf5\x0f\x11\x8d\xc9" } },
    .{ "ScriptTextOut", MethodRecord{ .library = "USP10", .import = "ScriptTextOut", .signature = "\x00\x0e\x11\x79\x11\x83\x5d\x0f\x0f\x01\x08\x08\x09\x0f\x11\x83\x89\x0f\x11\x8f\xed\x11\x05\x08\x0f\x07\x08\x0f\x08\x0f\x08\x0f\x11\x8f\xf5" } },
    .{ "ScriptJustify", MethodRecord{ .library = "USP10", .import = "ScriptJustify", .signature = "\x00\x06\x11\x79\x0f\x11\x8f\xf1\x0f\x08\x08\x08\x08\x0f\x08" } },
    .{ "ScriptBreak", MethodRecord{ .library = "USP10", .import = "ScriptBreak", .signature = "\x00\x04\x11\x79\x11\x05\x08\x0f\x11\x8f\xed\x0f\x11\x8f\xf9" } },
    .{ "ScriptCPtoX", MethodRecord{ .library = "USP10", .import = "ScriptCPtoX", .signature = "\x00\x09\x11\x79\x08\x11\x59\x08\x08\x0f\x07\x0f\x11\x8f\xf1\x0f\x08\x0f\x11\x8f\xed\x0f\x08" } },
    .{ "ScriptXtoCP", MethodRecord{ .library = "USP10", .import = "ScriptXtoCP", .signature = "\x00\x09\x11\x79\x08\x08\x08\x0f\x07\x0f\x11\x8f\xf1\x0f\x08\x0f\x11\x8f\xed\x0f\x08\x0f\x08" } },
    .{ "ScriptGetLogicalWidths", MethodRecord{ .library = "USP10", .import = "ScriptGetLogicalWidths", .signature = "\x00\x07\x11\x79\x0f\x11\x8f\xed\x08\x08\x0f\x08\x0f\x07\x0f\x11\x8f\xf1\x0f\x08" } },
    .{ "ScriptApplyLogicalWidth", MethodRecord{ .library = "USP10", .import = "ScriptApplyLogicalWidth", .signature = "\x00\x09\x11\x79\x0f\x08\x08\x08\x0f\x07\x0f\x11\x8f\xf1\x0f\x08\x0f\x11\x8f\xed\x0f\x11\x8d\xc9\x0f\x08" } },
    .{ "ScriptGetCMap", MethodRecord{ .library = "USP10", .import = "ScriptGetCMap", .signature = "\x00\x06\x11\x79\x11\x83\x5d\x0f\x0f\x01\x11\x05\x08\x09\x0f\x07" } },
    .{ "ScriptGetGlyphABCWidth", MethodRecord{ .library = "USP10", .import = "ScriptGetGlyphABCWidth", .signature = "\x00\x04\x11\x79\x11\x83\x5d\x0f\x0f\x01\x07\x0f\x11\x8d\xc9" } },
    .{ "ScriptGetProperties", MethodRecord{ .library = "USP10", .import = "ScriptGetProperties", .signature = "\x00\x02\x11\x79\x0f\x0f\x0f\x11\x8f\xfd\x0f\x08" } },
    .{ "ScriptGetFontProperties", MethodRecord{ .library = "USP10", .import = "ScriptGetFontProperties", .signature = "\x00\x03\x11\x79\x11\x83\x5d\x0f\x0f\x01\x0f\x11\x90\x01" } },
    .{ "ScriptCacheGetHeight", MethodRecord{ .library = "USP10", .import = "ScriptCacheGetHeight", .signature = "\x00\x03\x11\x79\x11\x83\x5d\x0f\x0f\x01\x0f\x08" } },
    .{ "ScriptStringAnalyse", MethodRecord{ .library = "USP10", .import = "ScriptStringAnalyse", .signature = "\x00\x0d\x11\x79\x11\x83\x5d\x0f\x01\x08\x08\x08\x09\x08\x0f\x11\x8f\xe1\x0f\x11\x8f\xe5\x0f\x08\x0f\x11\x90\x05\x0f\x05\x0f\x0f\x01" } },
    .{ "ScriptStringFree", MethodRecord{ .library = "USP10", .import = "ScriptStringFree", .signature = "\x00\x01\x11\x79\x0f\x0f\x01" } },
    .{ "ScriptString_pSize", MethodRecord{ .library = "USP10", .import = "ScriptString_pSize", .signature = "\x00\x01\x0f\x11\x83\xe9\x0f\x01" } },
    .{ "ScriptString_pcOutChars", MethodRecord{ .library = "USP10", .import = "ScriptString_pcOutChars", .signature = "\x00\x01\x0f\x08\x0f\x01" } },
    .{ "ScriptString_pLogAttr", MethodRecord{ .library = "USP10", .import = "ScriptString_pLogAttr", .signature = "\x00\x01\x0f\x11\x8f\xf9\x0f\x01" } },
    .{ "ScriptStringGetOrder", MethodRecord{ .library = "USP10", .import = "ScriptStringGetOrder", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x09" } },
    .{ "ScriptStringCPtoX", MethodRecord{ .library = "USP10", .import = "ScriptStringCPtoX", .signature = "\x00\x04\x11\x79\x0f\x01\x08\x11\x59\x0f\x08" } },
    .{ "ScriptStringXtoCP", MethodRecord{ .library = "USP10", .import = "ScriptStringXtoCP", .signature = "\x00\x04\x11\x79\x0f\x01\x08\x0f\x08\x0f\x08" } },
    .{ "ScriptStringGetLogicalWidths", MethodRecord{ .library = "USP10", .import = "ScriptStringGetLogicalWidths", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x08" } },
    .{ "ScriptStringValidate", MethodRecord{ .library = "USP10", .import = "ScriptStringValidate", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "ScriptStringOut", MethodRecord{ .library = "USP10", .import = "ScriptStringOut", .signature = "\x00\x08\x11\x79\x0f\x01\x08\x08\x11\x8d\x4d\x0f\x11\x83\x89\x08\x08\x11\x59" } },
    .{ "ScriptIsComplex", MethodRecord{ .library = "USP10", .import = "ScriptIsComplex", .signature = "\x00\x03\x11\x79\x11\x05\x08\x11\x8f\x1d" } },
    .{ "ScriptRecordDigitSubstitution", MethodRecord{ .library = "USP10", .import = "ScriptRecordDigitSubstitution", .signature = "\x00\x02\x11\x79\x09\x0f\x11\x90\x09" } },
    .{ "ScriptApplyDigitSubstitution", MethodRecord{ .library = "USP10", .import = "ScriptApplyDigitSubstitution", .signature = "\x00\x03\x11\x79\x0f\x11\x90\x09\x0f\x11\x8f\xe1\x0f\x11\x8f\xe5" } },
    .{ "ScriptShapeOpenType", MethodRecord{ .library = "USP10", .import = "ScriptShapeOpenType", .signature = "\x00\x10\x11\x79\x11\x83\x5d\x0f\x0f\x01\x0f\x11\x8f\xed\x09\x09\x0f\x08\x0f\x0f\x11\x90\x0d\x08\x11\x05\x08\x08\x0f\x07\x0f\x11\x90\x11\x0f\x07\x0f\x11\x90\x15\x0f\x08" } },
    .{ "ScriptPlaceOpenType", MethodRecord{ .library = "USP10", .import = "ScriptPlaceOpenType", .signature = "\x00\x12\x11\x79\x11\x83\x5d\x0f\x0f\x01\x0f\x11\x8f\xed\x09\x09\x0f\x08\x0f\x0f\x11\x90\x0d\x08\x11\x05\x0f\x07\x0f\x11\x90\x11\x08\x0f\x07\x0f\x11\x90\x15\x08\x0f\x08\x0f\x11\x8f\xf5\x0f\x11\x8d\xc9" } },
    .{ "ScriptItemizeOpenType", MethodRecord{ .library = "USP10", .import = "ScriptItemizeOpenType", .signature = "\x00\x08\x11\x79\x11\x05\x08\x08\x0f\x11\x8f\xe1\x0f\x11\x8f\xe5\x0f\x11\x8f\xe9\x0f\x09\x0f\x08" } },
    .{ "ScriptGetFontScriptTags", MethodRecord{ .library = "USP10", .import = "ScriptGetFontScriptTags", .signature = "\x00\x06\x11\x79\x11\x83\x5d\x0f\x0f\x01\x0f\x11\x8f\xed\x08\x0f\x09\x0f\x08" } },
    .{ "ScriptGetFontLanguageTags", MethodRecord{ .library = "USP10", .import = "ScriptGetFontLanguageTags", .signature = "\x00\x07\x11\x79\x11\x83\x5d\x0f\x0f\x01\x0f\x11\x8f\xed\x09\x08\x0f\x09\x0f\x08" } },
    .{ "ScriptGetFontFeatureTags", MethodRecord{ .library = "USP10", .import = "ScriptGetFontFeatureTags", .signature = "\x00\x08\x11\x79\x11\x83\x5d\x0f\x0f\x01\x0f\x11\x8f\xed\x09\x09\x08\x0f\x09\x0f\x08" } },
    .{ "ScriptGetFontAlternateGlyphs", MethodRecord{ .library = "USP10", .import = "ScriptGetFontAlternateGlyphs", .signature = "\x00\x0a\x11\x79\x11\x83\x5d\x0f\x0f\x01\x0f\x11\x8f\xed\x09\x09\x09\x07\x08\x0f\x07\x0f\x08" } },
    .{ "ScriptSubstituteSingleGlyph", MethodRecord{ .library = "USP10", .import = "ScriptSubstituteSingleGlyph", .signature = "\x00\x09\x11\x79\x11\x83\x5d\x0f\x0f\x01\x0f\x11\x8f\xed\x09\x09\x09\x08\x07\x0f\x07" } },
    .{ "ScriptPositionSingleGlyph", MethodRecord{ .library = "USP10", .import = "ScriptPositionSingleGlyph", .signature = "\x00\x0c\x11\x79\x11\x83\x5d\x0f\x0f\x01\x0f\x11\x8f\xed\x09\x09\x09\x08\x07\x08\x11\x8f\xf5\x0f\x08\x0f\x11\x8f\xf5" } },
    .{ "utf8_nextCharSafeBody", MethodRecord{ .library = "icuuc", .import = "utf8_nextCharSafeBody", .signature = "\x00\x05\x08\x0f\x05\x0f\x08\x08\x08\x04" } },
    .{ "utf8_appendCharSafeBody", MethodRecord{ .library = "icuuc", .import = "utf8_appendCharSafeBody", .signature = "\x00\x05\x08\x0f\x05\x08\x08\x08\x0f\x04" } },
    .{ "utf8_prevCharSafeBody", MethodRecord{ .library = "icuuc", .import = "utf8_prevCharSafeBody", .signature = "\x00\x05\x08\x0f\x05\x08\x0f\x08\x08\x04" } },
    .{ "utf8_back1SafeBody", MethodRecord{ .library = "icuuc", .import = "utf8_back1SafeBody", .signature = "\x00\x03\x08\x0f\x05\x08\x08" } },
    .{ "u_versionFromString", MethodRecord{ .library = "icuuc", .import = "u_versionFromString", .signature = "\x00\x02\x01\x0f\x05\x11\x3d" } },
    .{ "u_versionFromUString", MethodRecord{ .library = "icuuc", .import = "u_versionFromUString", .signature = "\x00\x02\x01\x0f\x05\x0f\x07" } },
    .{ "u_versionToString", MethodRecord{ .library = "icuuc", .import = "u_versionToString", .signature = "\x00\x02\x01\x0f\x05\x11\x3d" } },
    .{ "u_getVersion", MethodRecord{ .library = "icuuc", .import = "u_getVersion", .signature = "\x00\x01\x01\x0f\x05" } },
    .{ "u_errorName", MethodRecord{ .library = "icuuc", .import = "u_errorName", .signature = "\x00\x01\x11\x3d\x11\x90\x19" } },
    .{ "utrace_setLevel", MethodRecord{ .library = "icuuc", .import = "utrace_setLevel", .signature = "\x00\x01\x01\x08" } },
    .{ "utrace_getLevel", MethodRecord{ .library = "icuuc", .import = "utrace_getLevel", .signature = "\x00\x00\x08" } },
    .{ "utrace_setFunctions", MethodRecord{ .library = "icuuc", .import = "utrace_setFunctions", .signature = "\x00\x04\x01\x0f\x01\x12\x90\x1d\x12\x90\x21\x12\x90\x25" } },
    .{ "utrace_getFunctions", MethodRecord{ .library = "icuuc", .import = "utrace_getFunctions", .signature = "\x00\x04\x01\x0f\x0f\x01\x0f\x12\x90\x1d\x0f\x12\x90\x21\x0f\x12\x90\x25" } },
    .{ "utrace_vformat", MethodRecord{ .library = "icuuc", .import = "utrace_vformat", .signature = "\x00\x05\x08\x11\x3d\x08\x08\x11\x3d\x0f\x04" } },
    .{ "utrace_format", MethodRecord{ .library = "icuuc", .import = "utrace_format", .signature = "\x05\x04\x08\x11\x3d\x08\x08\x11\x3d" } },
    .{ "utrace_functionName", MethodRecord{ .library = "icuuc", .import = "utrace_functionName", .signature = "\x00\x01\x11\x3d\x08" } },
    .{ "u_shapeArabic", MethodRecord{ .library = "icuuc", .import = "u_shapeArabic", .signature = "\x00\x06\x08\x0f\x07\x08\x0f\x07\x08\x09\x0f\x11\x90\x19" } },
    .{ "uscript_getCode", MethodRecord{ .library = "icuuc", .import = "uscript_getCode", .signature = "\x00\x04\x08\x11\x3d\x0f\x11\x90\x29\x08\x0f\x11\x90\x19" } },
    .{ "uscript_getName", MethodRecord{ .library = "icuuc", .import = "uscript_getName", .signature = "\x00\x01\x11\x3d\x11\x90\x29" } },
    .{ "uscript_getShortName", MethodRecord{ .library = "icuuc", .import = "uscript_getShortName", .signature = "\x00\x01\x11\x3d\x11\x90\x29" } },
    .{ "uscript_getScript", MethodRecord{ .library = "icuuc", .import = "uscript_getScript", .signature = "\x00\x02\x11\x90\x29\x08\x0f\x11\x90\x19" } },
    .{ "uscript_hasScript", MethodRecord{ .library = "icuuc", .import = "uscript_hasScript", .signature = "\x00\x02\x04\x08\x11\x90\x29" } },
    .{ "uscript_getScriptExtensions", MethodRecord{ .library = "icuuc", .import = "uscript_getScriptExtensions", .signature = "\x00\x04\x08\x08\x0f\x11\x90\x29\x08\x0f\x11\x90\x19" } },
    .{ "uscript_getSampleString", MethodRecord{ .library = "icuuc", .import = "uscript_getSampleString", .signature = "\x00\x04\x08\x11\x90\x29\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uscript_getUsage", MethodRecord{ .library = "icuuc", .import = "uscript_getUsage", .signature = "\x00\x01\x11\x90\x2d\x11\x90\x29" } },
    .{ "uscript_isRightToLeft", MethodRecord{ .library = "icuuc", .import = "uscript_isRightToLeft", .signature = "\x00\x01\x04\x11\x90\x29" } },
    .{ "uscript_breaksBetweenLetters", MethodRecord{ .library = "icuuc", .import = "uscript_breaksBetweenLetters", .signature = "\x00\x01\x04\x11\x90\x29" } },
    .{ "uscript_isCased", MethodRecord{ .library = "icuuc", .import = "uscript_isCased", .signature = "\x00\x01\x04\x11\x90\x29" } },
    .{ "uiter_current32", MethodRecord{ .library = "icuuc", .import = "uiter_current32", .signature = "\x00\x01\x08\x0f\x11\x90\x31" } },
    .{ "uiter_next32", MethodRecord{ .library = "icuuc", .import = "uiter_next32", .signature = "\x00\x01\x08\x0f\x11\x90\x31" } },
    .{ "uiter_previous32", MethodRecord{ .library = "icuuc", .import = "uiter_previous32", .signature = "\x00\x01\x08\x0f\x11\x90\x31" } },
    .{ "uiter_getState", MethodRecord{ .library = "icuuc", .import = "uiter_getState", .signature = "\x00\x01\x09\x0f\x11\x90\x31" } },
    .{ "uiter_setState", MethodRecord{ .library = "icuuc", .import = "uiter_setState", .signature = "\x00\x03\x01\x0f\x11\x90\x31\x09\x0f\x11\x90\x19" } },
    .{ "uiter_setString", MethodRecord{ .library = "icuuc", .import = "uiter_setString", .signature = "\x00\x03\x01\x0f\x11\x90\x31\x0f\x07\x08" } },
    .{ "uiter_setUTF16BE", MethodRecord{ .library = "icuuc", .import = "uiter_setUTF16BE", .signature = "\x00\x03\x01\x0f\x11\x90\x31\x11\x3d\x08" } },
    .{ "uiter_setUTF8", MethodRecord{ .library = "icuuc", .import = "uiter_setUTF8", .signature = "\x00\x03\x01\x0f\x11\x90\x31\x11\x3d\x08" } },
    .{ "uenum_close", MethodRecord{ .library = "icuuc", .import = "uenum_close", .signature = "\x00\x01\x01\x0f\x11\x90\x35" } },
    .{ "uenum_count", MethodRecord{ .library = "icuuc", .import = "uenum_count", .signature = "\x00\x02\x08\x0f\x11\x90\x35\x0f\x11\x90\x19" } },
    .{ "uenum_unext", MethodRecord{ .library = "icuuc", .import = "uenum_unext", .signature = "\x00\x03\x0f\x07\x0f\x11\x90\x35\x0f\x08\x0f\x11\x90\x19" } },
    .{ "uenum_next", MethodRecord{ .library = "icuuc", .import = "uenum_next", .signature = "\x00\x03\x11\x3d\x0f\x11\x90\x35\x0f\x08\x0f\x11\x90\x19" } },
    .{ "uenum_reset", MethodRecord{ .library = "icuuc", .import = "uenum_reset", .signature = "\x00\x02\x01\x0f\x11\x90\x35\x0f\x11\x90\x19" } },
    .{ "uenum_openUCharStringsEnumeration", MethodRecord{ .library = "icuuc", .import = "uenum_openUCharStringsEnumeration", .signature = "\x00\x03\x0f\x11\x90\x35\x0f\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uenum_openCharStringsEnumeration", MethodRecord{ .library = "icuuc", .import = "uenum_openCharStringsEnumeration", .signature = "\x00\x03\x0f\x11\x90\x35\x0f\x0f\x04\x08\x0f\x11\x90\x19" } },
    .{ "uloc_getDefault", MethodRecord{ .library = "icuuc", .import = "uloc_getDefault", .signature = "\x00\x00\x11\x3d" } },
    .{ "uloc_setDefault", MethodRecord{ .library = "icuuc", .import = "uloc_setDefault", .signature = "\x00\x02\x01\x11\x3d\x0f\x11\x90\x19" } },
    .{ "uloc_getLanguage", MethodRecord{ .library = "icuuc", .import = "uloc_getLanguage", .signature = "\x00\x04\x08\x11\x3d\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uloc_getScript", MethodRecord{ .library = "icuuc", .import = "uloc_getScript", .signature = "\x00\x04\x08\x11\x3d\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uloc_getCountry", MethodRecord{ .library = "icuuc", .import = "uloc_getCountry", .signature = "\x00\x04\x08\x11\x3d\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uloc_getVariant", MethodRecord{ .library = "icuuc", .import = "uloc_getVariant", .signature = "\x00\x04\x08\x11\x3d\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uloc_getName", MethodRecord{ .library = "icuuc", .import = "uloc_getName", .signature = "\x00\x04\x08\x11\x3d\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uloc_canonicalize", MethodRecord{ .library = "icuuc", .import = "uloc_canonicalize", .signature = "\x00\x04\x08\x11\x3d\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uloc_getISO3Language", MethodRecord{ .library = "icuuc", .import = "uloc_getISO3Language", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "uloc_getISO3Country", MethodRecord{ .library = "icuuc", .import = "uloc_getISO3Country", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "uloc_getLCID", MethodRecord{ .library = "icuuc", .import = "uloc_getLCID", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "uloc_getDisplayLanguage", MethodRecord{ .library = "icuuc", .import = "uloc_getDisplayLanguage", .signature = "\x00\x05\x08\x11\x3d\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uloc_getDisplayScript", MethodRecord{ .library = "icuuc", .import = "uloc_getDisplayScript", .signature = "\x00\x05\x08\x11\x3d\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uloc_getDisplayCountry", MethodRecord{ .library = "icuuc", .import = "uloc_getDisplayCountry", .signature = "\x00\x05\x08\x11\x3d\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uloc_getDisplayVariant", MethodRecord{ .library = "icuuc", .import = "uloc_getDisplayVariant", .signature = "\x00\x05\x08\x11\x3d\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uloc_getDisplayKeyword", MethodRecord{ .library = "icuuc", .import = "uloc_getDisplayKeyword", .signature = "\x00\x05\x08\x11\x3d\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uloc_getDisplayKeywordValue", MethodRecord{ .library = "icuuc", .import = "uloc_getDisplayKeywordValue", .signature = "\x00\x06\x08\x11\x3d\x11\x3d\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uloc_getDisplayName", MethodRecord{ .library = "icuuc", .import = "uloc_getDisplayName", .signature = "\x00\x05\x08\x11\x3d\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uloc_getAvailable", MethodRecord{ .library = "icuuc", .import = "uloc_getAvailable", .signature = "\x00\x01\x11\x3d\x08" } },
    .{ "uloc_countAvailable", MethodRecord{ .library = "icuuc", .import = "uloc_countAvailable", .signature = "\x00\x00\x08" } },
    .{ "uloc_openAvailableByType", MethodRecord{ .library = "icu", .import = "uloc_openAvailableByType", .signature = "\x00\x02\x0f\x11\x90\x35\x11\x90\x39\x0f\x11\x90\x19" } },
    .{ "uloc_getISOLanguages", MethodRecord{ .library = "icuuc", .import = "uloc_getISOLanguages", .signature = "\x00\x00\x0f\x0f\x04" } },
    .{ "uloc_getISOCountries", MethodRecord{ .library = "icuuc", .import = "uloc_getISOCountries", .signature = "\x00\x00\x0f\x0f\x04" } },
    .{ "uloc_getParent", MethodRecord{ .library = "icuuc", .import = "uloc_getParent", .signature = "\x00\x04\x08\x11\x3d\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uloc_getBaseName", MethodRecord{ .library = "icuuc", .import = "uloc_getBaseName", .signature = "\x00\x04\x08\x11\x3d\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uloc_openKeywords", MethodRecord{ .library = "icuuc", .import = "uloc_openKeywords", .signature = "\x00\x02\x0f\x11\x90\x35\x11\x3d\x0f\x11\x90\x19" } },
    .{ "uloc_getKeywordValue", MethodRecord{ .library = "icuuc", .import = "uloc_getKeywordValue", .signature = "\x00\x05\x08\x11\x3d\x11\x3d\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uloc_setKeywordValue", MethodRecord{ .library = "icuuc", .import = "uloc_setKeywordValue", .signature = "\x00\x05\x08\x11\x3d\x11\x3d\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uloc_isRightToLeft", MethodRecord{ .library = "icuuc", .import = "uloc_isRightToLeft", .signature = "\x00\x01\x04\x11\x3d" } },
    .{ "uloc_getCharacterOrientation", MethodRecord{ .library = "icuuc", .import = "uloc_getCharacterOrientation", .signature = "\x00\x02\x11\x90\x3d\x11\x3d\x0f\x11\x90\x19" } },
    .{ "uloc_getLineOrientation", MethodRecord{ .library = "icuuc", .import = "uloc_getLineOrientation", .signature = "\x00\x02\x11\x90\x3d\x11\x3d\x0f\x11\x90\x19" } },
    .{ "uloc_acceptLanguageFromHTTP", MethodRecord{ .library = "icuuc", .import = "uloc_acceptLanguageFromHTTP", .signature = "\x00\x06\x08\x11\x3d\x08\x0f\x11\x90\x41\x11\x3d\x0f\x11\x90\x35\x0f\x11\x90\x19" } },
    .{ "uloc_acceptLanguage", MethodRecord{ .library = "icuuc", .import = "uloc_acceptLanguage", .signature = "\x00\x07\x08\x11\x3d\x08\x0f\x11\x90\x41\x0f\x0f\x04\x08\x0f\x11\x90\x35\x0f\x11\x90\x19" } },
    .{ "uloc_getLocaleForLCID", MethodRecord{ .library = "icuuc", .import = "uloc_getLocaleForLCID", .signature = "\x00\x04\x08\x09\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uloc_addLikelySubtags", MethodRecord{ .library = "icuuc", .import = "uloc_addLikelySubtags", .signature = "\x00\x04\x08\x11\x3d\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uloc_minimizeSubtags", MethodRecord{ .library = "icuuc", .import = "uloc_minimizeSubtags", .signature = "\x00\x04\x08\x11\x3d\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uloc_forLanguageTag", MethodRecord{ .library = "icuuc", .import = "uloc_forLanguageTag", .signature = "\x00\x05\x08\x11\x3d\x11\x3d\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "uloc_toLanguageTag", MethodRecord{ .library = "icuuc", .import = "uloc_toLanguageTag", .signature = "\x00\x05\x08\x11\x3d\x11\x3d\x08\x04\x0f\x11\x90\x19" } },
    .{ "uloc_toUnicodeLocaleKey", MethodRecord{ .library = "icuuc", .import = "uloc_toUnicodeLocaleKey", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "uloc_toUnicodeLocaleType", MethodRecord{ .library = "icuuc", .import = "uloc_toUnicodeLocaleType", .signature = "\x00\x02\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "uloc_toLegacyKey", MethodRecord{ .library = "icuuc", .import = "uloc_toLegacyKey", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "uloc_toLegacyType", MethodRecord{ .library = "icuuc", .import = "uloc_toLegacyType", .signature = "\x00\x02\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "ures_open", MethodRecord{ .library = "icuuc", .import = "ures_open", .signature = "\x00\x03\x0f\x11\x90\x45\x11\x3d\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ures_openDirect", MethodRecord{ .library = "icuuc", .import = "ures_openDirect", .signature = "\x00\x03\x0f\x11\x90\x45\x11\x3d\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ures_openU", MethodRecord{ .library = "icuuc", .import = "ures_openU", .signature = "\x00\x03\x0f\x11\x90\x45\x0f\x07\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ures_close", MethodRecord{ .library = "icuuc", .import = "ures_close", .signature = "\x00\x01\x01\x0f\x11\x90\x45" } },
    .{ "ures_getVersion", MethodRecord{ .library = "icuuc", .import = "ures_getVersion", .signature = "\x00\x02\x01\x0f\x11\x90\x45\x0f\x05" } },
    .{ "ures_getLocaleByType", MethodRecord{ .library = "icuuc", .import = "ures_getLocaleByType", .signature = "\x00\x03\x11\x3d\x0f\x11\x90\x45\x11\x90\x49\x0f\x11\x90\x19" } },
    .{ "ures_getString", MethodRecord{ .library = "icuuc", .import = "ures_getString", .signature = "\x00\x03\x0f\x07\x0f\x11\x90\x45\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ures_getUTF8String", MethodRecord{ .library = "icuuc", .import = "ures_getUTF8String", .signature = "\x00\x05\x11\x3d\x0f\x11\x90\x45\x11\x3d\x0f\x08\x04\x0f\x11\x90\x19" } },
    .{ "ures_getBinary", MethodRecord{ .library = "icuuc", .import = "ures_getBinary", .signature = "\x00\x03\x0f\x05\x0f\x11\x90\x45\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ures_getIntVector", MethodRecord{ .library = "icuuc", .import = "ures_getIntVector", .signature = "\x00\x03\x0f\x08\x0f\x11\x90\x45\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ures_getUInt", MethodRecord{ .library = "icuuc", .import = "ures_getUInt", .signature = "\x00\x02\x09\x0f\x11\x90\x45\x0f\x11\x90\x19" } },
    .{ "ures_getInt", MethodRecord{ .library = "icuuc", .import = "ures_getInt", .signature = "\x00\x02\x08\x0f\x11\x90\x45\x0f\x11\x90\x19" } },
    .{ "ures_getSize", MethodRecord{ .library = "icuuc", .import = "ures_getSize", .signature = "\x00\x01\x08\x0f\x11\x90\x45" } },
    .{ "ures_getType", MethodRecord{ .library = "icuuc", .import = "ures_getType", .signature = "\x00\x01\x11\x90\x4d\x0f\x11\x90\x45" } },
    .{ "ures_getKey", MethodRecord{ .library = "icuuc", .import = "ures_getKey", .signature = "\x00\x01\x11\x3d\x0f\x11\x90\x45" } },
    .{ "ures_resetIterator", MethodRecord{ .library = "icuuc", .import = "ures_resetIterator", .signature = "\x00\x01\x01\x0f\x11\x90\x45" } },
    .{ "ures_hasNext", MethodRecord{ .library = "icuuc", .import = "ures_hasNext", .signature = "\x00\x01\x04\x0f\x11\x90\x45" } },
    .{ "ures_getNextResource", MethodRecord{ .library = "icuuc", .import = "ures_getNextResource", .signature = "\x00\x03\x0f\x11\x90\x45\x0f\x11\x90\x45\x0f\x11\x90\x45\x0f\x11\x90\x19" } },
    .{ "ures_getNextString", MethodRecord{ .library = "icuuc", .import = "ures_getNextString", .signature = "\x00\x04\x0f\x07\x0f\x11\x90\x45\x0f\x08\x0f\x0f\x04\x0f\x11\x90\x19" } },
    .{ "ures_getByIndex", MethodRecord{ .library = "icuuc", .import = "ures_getByIndex", .signature = "\x00\x04\x0f\x11\x90\x45\x0f\x11\x90\x45\x08\x0f\x11\x90\x45\x0f\x11\x90\x19" } },
    .{ "ures_getStringByIndex", MethodRecord{ .library = "icuuc", .import = "ures_getStringByIndex", .signature = "\x00\x04\x0f\x07\x0f\x11\x90\x45\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ures_getUTF8StringByIndex", MethodRecord{ .library = "icuuc", .import = "ures_getUTF8StringByIndex", .signature = "\x00\x06\x11\x3d\x0f\x11\x90\x45\x08\x11\x3d\x0f\x08\x04\x0f\x11\x90\x19" } },
    .{ "ures_getByKey", MethodRecord{ .library = "icuuc", .import = "ures_getByKey", .signature = "\x00\x04\x0f\x11\x90\x45\x0f\x11\x90\x45\x11\x3d\x0f\x11\x90\x45\x0f\x11\x90\x19" } },
    .{ "ures_getStringByKey", MethodRecord{ .library = "icuuc", .import = "ures_getStringByKey", .signature = "\x00\x04\x0f\x07\x0f\x11\x90\x45\x11\x3d\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ures_getUTF8StringByKey", MethodRecord{ .library = "icuuc", .import = "ures_getUTF8StringByKey", .signature = "\x00\x06\x11\x3d\x0f\x11\x90\x45\x11\x3d\x11\x3d\x0f\x08\x04\x0f\x11\x90\x19" } },
    .{ "ures_openAvailableLocales", MethodRecord{ .library = "icuuc", .import = "ures_openAvailableLocales", .signature = "\x00\x02\x0f\x11\x90\x35\x11\x3d\x0f\x11\x90\x19" } },
    .{ "uldn_open", MethodRecord{ .library = "icuuc", .import = "uldn_open", .signature = "\x00\x03\x0f\x11\x90\x51\x11\x3d\x11\x90\x55\x0f\x11\x90\x19" } },
    .{ "uldn_close", MethodRecord{ .library = "icuuc", .import = "uldn_close", .signature = "\x00\x01\x01\x0f\x11\x90\x51" } },
    .{ "uldn_getLocale", MethodRecord{ .library = "icuuc", .import = "uldn_getLocale", .signature = "\x00\x01\x11\x3d\x0f\x11\x90\x51" } },
    .{ "uldn_getDialectHandling", MethodRecord{ .library = "icuuc", .import = "uldn_getDialectHandling", .signature = "\x00\x01\x11\x90\x55\x0f\x11\x90\x51" } },
    .{ "uldn_localeDisplayName", MethodRecord{ .library = "icuuc", .import = "uldn_localeDisplayName", .signature = "\x00\x05\x08\x0f\x11\x90\x51\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uldn_languageDisplayName", MethodRecord{ .library = "icuuc", .import = "uldn_languageDisplayName", .signature = "\x00\x05\x08\x0f\x11\x90\x51\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uldn_scriptDisplayName", MethodRecord{ .library = "icuuc", .import = "uldn_scriptDisplayName", .signature = "\x00\x05\x08\x0f\x11\x90\x51\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uldn_scriptCodeDisplayName", MethodRecord{ .library = "icuuc", .import = "uldn_scriptCodeDisplayName", .signature = "\x00\x05\x08\x0f\x11\x90\x51\x11\x90\x29\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uldn_regionDisplayName", MethodRecord{ .library = "icuuc", .import = "uldn_regionDisplayName", .signature = "\x00\x05\x08\x0f\x11\x90\x51\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uldn_variantDisplayName", MethodRecord{ .library = "icuuc", .import = "uldn_variantDisplayName", .signature = "\x00\x05\x08\x0f\x11\x90\x51\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uldn_keyDisplayName", MethodRecord{ .library = "icuuc", .import = "uldn_keyDisplayName", .signature = "\x00\x05\x08\x0f\x11\x90\x51\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uldn_keyValueDisplayName", MethodRecord{ .library = "icuuc", .import = "uldn_keyValueDisplayName", .signature = "\x00\x06\x08\x0f\x11\x90\x51\x11\x3d\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uldn_openForContext", MethodRecord{ .library = "icuuc", .import = "uldn_openForContext", .signature = "\x00\x04\x0f\x11\x90\x51\x11\x3d\x0f\x11\x90\x59\x08\x0f\x11\x90\x19" } },
    .{ "uldn_getContext", MethodRecord{ .library = "icuuc", .import = "uldn_getContext", .signature = "\x00\x03\x11\x90\x59\x0f\x11\x90\x51\x11\x90\x5d\x0f\x11\x90\x19" } },
    .{ "ucurr_forLocale", MethodRecord{ .library = "icuuc", .import = "ucurr_forLocale", .signature = "\x00\x04\x08\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucurr_register", MethodRecord{ .library = "icuuc", .import = "ucurr_register", .signature = "\x00\x03\x0f\x01\x0f\x07\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ucurr_unregister", MethodRecord{ .library = "icuuc", .import = "ucurr_unregister", .signature = "\x00\x02\x04\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ucurr_getName", MethodRecord{ .library = "icuuc", .import = "ucurr_getName", .signature = "\x00\x06\x0f\x07\x0f\x07\x11\x3d\x11\x90\x61\x0f\x04\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ucurr_getPluralName", MethodRecord{ .library = "icuuc", .import = "ucurr_getPluralName", .signature = "\x00\x06\x0f\x07\x0f\x07\x11\x3d\x0f\x04\x11\x3d\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ucurr_getDefaultFractionDigits", MethodRecord{ .library = "icuuc", .import = "ucurr_getDefaultFractionDigits", .signature = "\x00\x02\x08\x0f\x07\x0f\x11\x90\x19" } },
    .{ "ucurr_getDefaultFractionDigitsForUsage", MethodRecord{ .library = "icuuc", .import = "ucurr_getDefaultFractionDigitsForUsage", .signature = "\x00\x03\x08\x0f\x07\x11\x90\x65\x0f\x11\x90\x19" } },
    .{ "ucurr_getRoundingIncrement", MethodRecord{ .library = "icuuc", .import = "ucurr_getRoundingIncrement", .signature = "\x00\x02\x0d\x0f\x07\x0f\x11\x90\x19" } },
    .{ "ucurr_getRoundingIncrementForUsage", MethodRecord{ .library = "icuuc", .import = "ucurr_getRoundingIncrementForUsage", .signature = "\x00\x03\x0d\x0f\x07\x11\x90\x65\x0f\x11\x90\x19" } },
    .{ "ucurr_openISOCurrencies", MethodRecord{ .library = "icuuc", .import = "ucurr_openISOCurrencies", .signature = "\x00\x02\x0f\x11\x90\x35\x09\x0f\x11\x90\x19" } },
    .{ "ucurr_isAvailable", MethodRecord{ .library = "icuuc", .import = "ucurr_isAvailable", .signature = "\x00\x04\x04\x0f\x07\x0d\x0d\x0f\x11\x90\x19" } },
    .{ "ucurr_countCurrencies", MethodRecord{ .library = "icuuc", .import = "ucurr_countCurrencies", .signature = "\x00\x03\x08\x11\x3d\x0d\x0f\x11\x90\x19" } },
    .{ "ucurr_forLocaleAndDate", MethodRecord{ .library = "icuuc", .import = "ucurr_forLocaleAndDate", .signature = "\x00\x06\x08\x11\x3d\x0d\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucurr_getKeywordValuesForLocale", MethodRecord{ .library = "icuuc", .import = "ucurr_getKeywordValuesForLocale", .signature = "\x00\x04\x0f\x11\x90\x35\x11\x3d\x11\x3d\x04\x0f\x11\x90\x19" } },
    .{ "ucurr_getNumericCode", MethodRecord{ .library = "icuuc", .import = "ucurr_getNumericCode", .signature = "\x00\x01\x08\x0f\x07" } },
    .{ "ucpmap_get", MethodRecord{ .library = "icu", .import = "ucpmap_get", .signature = "\x00\x02\x09\x0f\x11\x90\x69\x08" } },
    .{ "ucpmap_getRange", MethodRecord{ .library = "icu", .import = "ucpmap_getRange", .signature = "\x00\x07\x08\x0f\x11\x90\x69\x08\x11\x90\x6d\x09\x0f\x12\x90\x71\x0f\x01\x0f\x09" } },
    .{ "ucptrie_openFromBinary", MethodRecord{ .library = "icu", .import = "ucptrie_openFromBinary", .signature = "\x00\x06\x0f\x11\x90\x75\x11\x90\x79\x11\x90\x7d\x0f\x01\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ucptrie_close", MethodRecord{ .library = "icu", .import = "ucptrie_close", .signature = "\x00\x01\x01\x0f\x11\x90\x75" } },
    .{ "ucptrie_getType", MethodRecord{ .library = "icu", .import = "ucptrie_getType", .signature = "\x00\x01\x11\x90\x79\x0f\x11\x90\x75" } },
    .{ "ucptrie_getValueWidth", MethodRecord{ .library = "icu", .import = "ucptrie_getValueWidth", .signature = "\x00\x01\x11\x90\x7d\x0f\x11\x90\x75" } },
    .{ "ucptrie_get", MethodRecord{ .library = "icu", .import = "ucptrie_get", .signature = "\x00\x02\x09\x0f\x11\x90\x75\x08" } },
    .{ "ucptrie_getRange", MethodRecord{ .library = "icu", .import = "ucptrie_getRange", .signature = "\x00\x07\x08\x0f\x11\x90\x75\x08\x11\x90\x6d\x09\x0f\x12\x90\x71\x0f\x01\x0f\x09" } },
    .{ "ucptrie_toBinary", MethodRecord{ .library = "icu", .import = "ucptrie_toBinary", .signature = "\x00\x04\x08\x0f\x11\x90\x75\x0f\x01\x08\x0f\x11\x90\x19" } },
    .{ "ucptrie_internalSmallIndex", MethodRecord{ .library = "icu", .import = "ucptrie_internalSmallIndex", .signature = "\x00\x02\x08\x0f\x11\x90\x75\x08" } },
    .{ "ucptrie_internalSmallU8Index", MethodRecord{ .library = "icu", .import = "ucptrie_internalSmallU8Index", .signature = "\x00\x04\x08\x0f\x11\x90\x75\x08\x05\x05" } },
    .{ "ucptrie_internalU8PrevIndex", MethodRecord{ .library = "icu", .import = "ucptrie_internalU8PrevIndex", .signature = "\x00\x04\x08\x0f\x11\x90\x75\x08\x0f\x05\x0f\x05" } },
    .{ "umutablecptrie_open", MethodRecord{ .library = "icu", .import = "umutablecptrie_open", .signature = "\x00\x03\x0f\x11\x90\x81\x09\x09\x0f\x11\x90\x19" } },
    .{ "umutablecptrie_clone", MethodRecord{ .library = "icu", .import = "umutablecptrie_clone", .signature = "\x00\x02\x0f\x11\x90\x81\x0f\x11\x90\x81\x0f\x11\x90\x19" } },
    .{ "umutablecptrie_close", MethodRecord{ .library = "icu", .import = "umutablecptrie_close", .signature = "\x00\x01\x01\x0f\x11\x90\x81" } },
    .{ "umutablecptrie_fromUCPMap", MethodRecord{ .library = "icu", .import = "umutablecptrie_fromUCPMap", .signature = "\x00\x02\x0f\x11\x90\x81\x0f\x11\x90\x69\x0f\x11\x90\x19" } },
    .{ "umutablecptrie_fromUCPTrie", MethodRecord{ .library = "icu", .import = "umutablecptrie_fromUCPTrie", .signature = "\x00\x02\x0f\x11\x90\x81\x0f\x11\x90\x75\x0f\x11\x90\x19" } },
    .{ "umutablecptrie_get", MethodRecord{ .library = "icu", .import = "umutablecptrie_get", .signature = "\x00\x02\x09\x0f\x11\x90\x81\x08" } },
    .{ "umutablecptrie_getRange", MethodRecord{ .library = "icu", .import = "umutablecptrie_getRange", .signature = "\x00\x07\x08\x0f\x11\x90\x81\x08\x11\x90\x6d\x09\x0f\x12\x90\x71\x0f\x01\x0f\x09" } },
    .{ "umutablecptrie_set", MethodRecord{ .library = "icu", .import = "umutablecptrie_set", .signature = "\x00\x04\x01\x0f\x11\x90\x81\x08\x09\x0f\x11\x90\x19" } },
    .{ "umutablecptrie_setRange", MethodRecord{ .library = "icu", .import = "umutablecptrie_setRange", .signature = "\x00\x05\x01\x0f\x11\x90\x81\x08\x08\x09\x0f\x11\x90\x19" } },
    .{ "umutablecptrie_buildImmutable", MethodRecord{ .library = "icu", .import = "umutablecptrie_buildImmutable", .signature = "\x00\x04\x0f\x11\x90\x75\x0f\x11\x90\x81\x11\x90\x79\x11\x90\x7d\x0f\x11\x90\x19" } },
    .{ "UCNV_FROM_U_CALLBACK_STOP", MethodRecord{ .library = "icuuc", .import = "UCNV_FROM_U_CALLBACK_STOP", .signature = "\x00\x07\x01\x0f\x01\x0f\x11\x90\x85\x0f\x07\x08\x08\x11\x90\x89\x0f\x11\x90\x19" } },
    .{ "UCNV_TO_U_CALLBACK_STOP", MethodRecord{ .library = "icuuc", .import = "UCNV_TO_U_CALLBACK_STOP", .signature = "\x00\x06\x01\x0f\x01\x0f\x11\x90\x8d\x11\x3d\x08\x11\x90\x89\x0f\x11\x90\x19" } },
    .{ "UCNV_FROM_U_CALLBACK_SKIP", MethodRecord{ .library = "icuuc", .import = "UCNV_FROM_U_CALLBACK_SKIP", .signature = "\x00\x07\x01\x0f\x01\x0f\x11\x90\x85\x0f\x07\x08\x08\x11\x90\x89\x0f\x11\x90\x19" } },
    .{ "UCNV_FROM_U_CALLBACK_SUBSTITUTE", MethodRecord{ .library = "icuuc", .import = "UCNV_FROM_U_CALLBACK_SUBSTITUTE", .signature = "\x00\x07\x01\x0f\x01\x0f\x11\x90\x85\x0f\x07\x08\x08\x11\x90\x89\x0f\x11\x90\x19" } },
    .{ "UCNV_FROM_U_CALLBACK_ESCAPE", MethodRecord{ .library = "icuuc", .import = "UCNV_FROM_U_CALLBACK_ESCAPE", .signature = "\x00\x07\x01\x0f\x01\x0f\x11\x90\x85\x0f\x07\x08\x08\x11\x90\x89\x0f\x11\x90\x19" } },
    .{ "UCNV_TO_U_CALLBACK_SKIP", MethodRecord{ .library = "icuuc", .import = "UCNV_TO_U_CALLBACK_SKIP", .signature = "\x00\x06\x01\x0f\x01\x0f\x11\x90\x8d\x11\x3d\x08\x11\x90\x89\x0f\x11\x90\x19" } },
    .{ "UCNV_TO_U_CALLBACK_SUBSTITUTE", MethodRecord{ .library = "icuuc", .import = "UCNV_TO_U_CALLBACK_SUBSTITUTE", .signature = "\x00\x06\x01\x0f\x01\x0f\x11\x90\x8d\x11\x3d\x08\x11\x90\x89\x0f\x11\x90\x19" } },
    .{ "UCNV_TO_U_CALLBACK_ESCAPE", MethodRecord{ .library = "icuuc", .import = "UCNV_TO_U_CALLBACK_ESCAPE", .signature = "\x00\x06\x01\x0f\x01\x0f\x11\x90\x8d\x11\x3d\x08\x11\x90\x89\x0f\x11\x90\x19" } },
    .{ "ucnv_compareNames", MethodRecord{ .library = "icuuc", .import = "ucnv_compareNames", .signature = "\x00\x02\x08\x11\x3d\x11\x3d" } },
    .{ "ucnv_open", MethodRecord{ .library = "icuuc", .import = "ucnv_open", .signature = "\x00\x02\x0f\x11\x90\x91\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ucnv_openU", MethodRecord{ .library = "icuuc", .import = "ucnv_openU", .signature = "\x00\x02\x0f\x11\x90\x91\x0f\x07\x0f\x11\x90\x19" } },
    .{ "ucnv_openCCSID", MethodRecord{ .library = "icuuc", .import = "ucnv_openCCSID", .signature = "\x00\x03\x0f\x11\x90\x91\x08\x11\x90\x95\x0f\x11\x90\x19" } },
    .{ "ucnv_openPackage", MethodRecord{ .library = "icuuc", .import = "ucnv_openPackage", .signature = "\x00\x03\x0f\x11\x90\x91\x11\x3d\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ucnv_safeClone", MethodRecord{ .library = "icuuc", .import = "ucnv_safeClone", .signature = "\x00\x04\x0f\x11\x90\x91\x0f\x11\x90\x91\x0f\x01\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ucnv_clone", MethodRecord{ .library = "icu", .import = "ucnv_clone", .signature = "\x00\x02\x0f\x11\x90\x91\x0f\x11\x90\x91\x0f\x11\x90\x19" } },
    .{ "ucnv_close", MethodRecord{ .library = "icuuc", .import = "ucnv_close", .signature = "\x00\x01\x01\x0f\x11\x90\x91" } },
    .{ "ucnv_getSubstChars", MethodRecord{ .library = "icuuc", .import = "ucnv_getSubstChars", .signature = "\x00\x04\x01\x0f\x11\x90\x91\x11\x3d\x0f\x04\x0f\x11\x90\x19" } },
    .{ "ucnv_setSubstChars", MethodRecord{ .library = "icuuc", .import = "ucnv_setSubstChars", .signature = "\x00\x04\x01\x0f\x11\x90\x91\x11\x3d\x04\x0f\x11\x90\x19" } },
    .{ "ucnv_setSubstString", MethodRecord{ .library = "icuuc", .import = "ucnv_setSubstString", .signature = "\x00\x04\x01\x0f\x11\x90\x91\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucnv_getInvalidChars", MethodRecord{ .library = "icuuc", .import = "ucnv_getInvalidChars", .signature = "\x00\x04\x01\x0f\x11\x90\x91\x11\x3d\x0f\x04\x0f\x11\x90\x19" } },
    .{ "ucnv_getInvalidUChars", MethodRecord{ .library = "icuuc", .import = "ucnv_getInvalidUChars", .signature = "\x00\x04\x01\x0f\x11\x90\x91\x0f\x07\x0f\x04\x0f\x11\x90\x19" } },
    .{ "ucnv_reset", MethodRecord{ .library = "icuuc", .import = "ucnv_reset", .signature = "\x00\x01\x01\x0f\x11\x90\x91" } },
    .{ "ucnv_resetToUnicode", MethodRecord{ .library = "icuuc", .import = "ucnv_resetToUnicode", .signature = "\x00\x01\x01\x0f\x11\x90\x91" } },
    .{ "ucnv_resetFromUnicode", MethodRecord{ .library = "icuuc", .import = "ucnv_resetFromUnicode", .signature = "\x00\x01\x01\x0f\x11\x90\x91" } },
    .{ "ucnv_getMaxCharSize", MethodRecord{ .library = "icuuc", .import = "ucnv_getMaxCharSize", .signature = "\x00\x01\x04\x0f\x11\x90\x91" } },
    .{ "ucnv_getMinCharSize", MethodRecord{ .library = "icuuc", .import = "ucnv_getMinCharSize", .signature = "\x00\x01\x04\x0f\x11\x90\x91" } },
    .{ "ucnv_getDisplayName", MethodRecord{ .library = "icuuc", .import = "ucnv_getDisplayName", .signature = "\x00\x05\x08\x0f\x11\x90\x91\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucnv_getName", MethodRecord{ .library = "icuuc", .import = "ucnv_getName", .signature = "\x00\x02\x11\x3d\x0f\x11\x90\x91\x0f\x11\x90\x19" } },
    .{ "ucnv_getCCSID", MethodRecord{ .library = "icuuc", .import = "ucnv_getCCSID", .signature = "\x00\x02\x08\x0f\x11\x90\x91\x0f\x11\x90\x19" } },
    .{ "ucnv_getPlatform", MethodRecord{ .library = "icuuc", .import = "ucnv_getPlatform", .signature = "\x00\x02\x11\x90\x95\x0f\x11\x90\x91\x0f\x11\x90\x19" } },
    .{ "ucnv_getType", MethodRecord{ .library = "icuuc", .import = "ucnv_getType", .signature = "\x00\x01\x11\x90\x99\x0f\x11\x90\x91" } },
    .{ "ucnv_getStarters", MethodRecord{ .library = "icuuc", .import = "ucnv_getStarters", .signature = "\x00\x03\x01\x0f\x11\x90\x91\x0f\x04\x0f\x11\x90\x19" } },
    .{ "ucnv_getUnicodeSet", MethodRecord{ .library = "icuuc", .import = "ucnv_getUnicodeSet", .signature = "\x00\x04\x01\x0f\x11\x90\x91\x0f\x11\x90\x9d\x11\x90\xa1\x0f\x11\x90\x19" } },
    .{ "ucnv_getToUCallBack", MethodRecord{ .library = "icuuc", .import = "ucnv_getToUCallBack", .signature = "\x00\x03\x01\x0f\x11\x90\x91\x0f\x12\x90\xa5\x0f\x0f\x01" } },
    .{ "ucnv_getFromUCallBack", MethodRecord{ .library = "icuuc", .import = "ucnv_getFromUCallBack", .signature = "\x00\x03\x01\x0f\x11\x90\x91\x0f\x12\x90\xa9\x0f\x0f\x01" } },
    .{ "ucnv_setToUCallBack", MethodRecord{ .library = "icuuc", .import = "ucnv_setToUCallBack", .signature = "\x00\x06\x01\x0f\x11\x90\x91\x12\x90\xa5\x0f\x01\x0f\x12\x90\xa5\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ucnv_setFromUCallBack", MethodRecord{ .library = "icuuc", .import = "ucnv_setFromUCallBack", .signature = "\x00\x06\x01\x0f\x11\x90\x91\x12\x90\xa9\x0f\x01\x0f\x12\x90\xa9\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ucnv_fromUnicode", MethodRecord{ .library = "icuuc", .import = "ucnv_fromUnicode", .signature = "\x00\x08\x01\x0f\x11\x90\x91\x0f\x0f\x04\x11\x3d\x0f\x0f\x07\x0f\x07\x0f\x08\x04\x0f\x11\x90\x19" } },
    .{ "ucnv_toUnicode", MethodRecord{ .library = "icuuc", .import = "ucnv_toUnicode", .signature = "\x00\x08\x01\x0f\x11\x90\x91\x0f\x0f\x07\x0f\x07\x0f\x0f\x04\x11\x3d\x0f\x08\x04\x0f\x11\x90\x19" } },
    .{ "ucnv_fromUChars", MethodRecord{ .library = "icuuc", .import = "ucnv_fromUChars", .signature = "\x00\x06\x08\x0f\x11\x90\x91\x11\x3d\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucnv_toUChars", MethodRecord{ .library = "icuuc", .import = "ucnv_toUChars", .signature = "\x00\x06\x08\x0f\x11\x90\x91\x0f\x07\x08\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "ucnv_getNextUChar", MethodRecord{ .library = "icuuc", .import = "ucnv_getNextUChar", .signature = "\x00\x04\x08\x0f\x11\x90\x91\x0f\x0f\x04\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ucnv_convertEx", MethodRecord{ .library = "icuuc", .import = "ucnv_convertEx", .signature = "\x00\x0d\x01\x0f\x11\x90\x91\x0f\x11\x90\x91\x0f\x0f\x04\x11\x3d\x0f\x0f\x04\x11\x3d\x0f\x07\x0f\x0f\x07\x0f\x0f\x07\x0f\x07\x04\x04\x0f\x11\x90\x19" } },
    .{ "ucnv_convert", MethodRecord{ .library = "icuuc", .import = "ucnv_convert", .signature = "\x00\x07\x08\x11\x3d\x11\x3d\x11\x3d\x08\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "ucnv_toAlgorithmic", MethodRecord{ .library = "icuuc", .import = "ucnv_toAlgorithmic", .signature = "\x00\x07\x08\x11\x90\x99\x0f\x11\x90\x91\x11\x3d\x08\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "ucnv_fromAlgorithmic", MethodRecord{ .library = "icuuc", .import = "ucnv_fromAlgorithmic", .signature = "\x00\x07\x08\x0f\x11\x90\x91\x11\x90\x99\x11\x3d\x08\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "ucnv_flushCache", MethodRecord{ .library = "icuuc", .import = "ucnv_flushCache", .signature = "\x00\x00\x08" } },
    .{ "ucnv_countAvailable", MethodRecord{ .library = "icuuc", .import = "ucnv_countAvailable", .signature = "\x00\x00\x08" } },
    .{ "ucnv_getAvailableName", MethodRecord{ .library = "icuuc", .import = "ucnv_getAvailableName", .signature = "\x00\x01\x11\x3d\x08" } },
    .{ "ucnv_openAllNames", MethodRecord{ .library = "icuuc", .import = "ucnv_openAllNames", .signature = "\x00\x01\x0f\x11\x90\x35\x0f\x11\x90\x19" } },
    .{ "ucnv_countAliases", MethodRecord{ .library = "icuuc", .import = "ucnv_countAliases", .signature = "\x00\x02\x07\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ucnv_getAlias", MethodRecord{ .library = "icuuc", .import = "ucnv_getAlias", .signature = "\x00\x03\x11\x3d\x11\x3d\x07\x0f\x11\x90\x19" } },
    .{ "ucnv_getAliases", MethodRecord{ .library = "icuuc", .import = "ucnv_getAliases", .signature = "\x00\x03\x01\x11\x3d\x0f\x0f\x04\x0f\x11\x90\x19" } },
    .{ "ucnv_openStandardNames", MethodRecord{ .library = "icuuc", .import = "ucnv_openStandardNames", .signature = "\x00\x03\x0f\x11\x90\x35\x11\x3d\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ucnv_countStandards", MethodRecord{ .library = "icuuc", .import = "ucnv_countStandards", .signature = "\x00\x00\x07" } },
    .{ "ucnv_getStandard", MethodRecord{ .library = "icuuc", .import = "ucnv_getStandard", .signature = "\x00\x02\x11\x3d\x07\x0f\x11\x90\x19" } },
    .{ "ucnv_getStandardName", MethodRecord{ .library = "icuuc", .import = "ucnv_getStandardName", .signature = "\x00\x03\x11\x3d\x11\x3d\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ucnv_getCanonicalName", MethodRecord{ .library = "icuuc", .import = "ucnv_getCanonicalName", .signature = "\x00\x03\x11\x3d\x11\x3d\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ucnv_getDefaultName", MethodRecord{ .library = "icuuc", .import = "ucnv_getDefaultName", .signature = "\x00\x00\x11\x3d" } },
    .{ "ucnv_setDefaultName", MethodRecord{ .library = "icuuc", .import = "ucnv_setDefaultName", .signature = "\x00\x01\x01\x11\x3d" } },
    .{ "ucnv_fixFileSeparator", MethodRecord{ .library = "icuuc", .import = "ucnv_fixFileSeparator", .signature = "\x00\x03\x01\x0f\x11\x90\x91\x0f\x07\x08" } },
    .{ "ucnv_isAmbiguous", MethodRecord{ .library = "icuuc", .import = "ucnv_isAmbiguous", .signature = "\x00\x01\x04\x0f\x11\x90\x91" } },
    .{ "ucnv_setFallback", MethodRecord{ .library = "icuuc", .import = "ucnv_setFallback", .signature = "\x00\x02\x01\x0f\x11\x90\x91\x04" } },
    .{ "ucnv_usesFallback", MethodRecord{ .library = "icuuc", .import = "ucnv_usesFallback", .signature = "\x00\x01\x04\x0f\x11\x90\x91" } },
    .{ "ucnv_detectUnicodeSignature", MethodRecord{ .library = "icuuc", .import = "ucnv_detectUnicodeSignature", .signature = "\x00\x04\x11\x3d\x11\x3d\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ucnv_fromUCountPending", MethodRecord{ .library = "icuuc", .import = "ucnv_fromUCountPending", .signature = "\x00\x02\x08\x0f\x11\x90\x91\x0f\x11\x90\x19" } },
    .{ "ucnv_toUCountPending", MethodRecord{ .library = "icuuc", .import = "ucnv_toUCountPending", .signature = "\x00\x02\x08\x0f\x11\x90\x91\x0f\x11\x90\x19" } },
    .{ "ucnv_isFixedWidth", MethodRecord{ .library = "icuuc", .import = "ucnv_isFixedWidth", .signature = "\x00\x02\x04\x0f\x11\x90\x91\x0f\x11\x90\x19" } },
    .{ "ucnv_cbFromUWriteBytes", MethodRecord{ .library = "icuuc", .import = "ucnv_cbFromUWriteBytes", .signature = "\x00\x05\x01\x0f\x11\x90\x85\x11\x3d\x08\x08\x0f\x11\x90\x19" } },
    .{ "ucnv_cbFromUWriteSub", MethodRecord{ .library = "icuuc", .import = "ucnv_cbFromUWriteSub", .signature = "\x00\x03\x01\x0f\x11\x90\x85\x08\x0f\x11\x90\x19" } },
    .{ "ucnv_cbFromUWriteUChars", MethodRecord{ .library = "icuuc", .import = "ucnv_cbFromUWriteUChars", .signature = "\x00\x05\x01\x0f\x11\x90\x85\x0f\x0f\x07\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucnv_cbToUWriteUChars", MethodRecord{ .library = "icuuc", .import = "ucnv_cbToUWriteUChars", .signature = "\x00\x05\x01\x0f\x11\x90\x8d\x0f\x07\x08\x08\x0f\x11\x90\x19" } },
    .{ "ucnv_cbToUWriteSub", MethodRecord{ .library = "icuuc", .import = "ucnv_cbToUWriteSub", .signature = "\x00\x03\x01\x0f\x11\x90\x8d\x08\x0f\x11\x90\x19" } },
    .{ "u_init", MethodRecord{ .library = "icuuc", .import = "u_init", .signature = "\x00\x01\x01\x0f\x11\x90\x19" } },
    .{ "u_cleanup", MethodRecord{ .library = "icuuc", .import = "u_cleanup", .signature = "\x00\x00\x01" } },
    .{ "u_setMemoryFunctions", MethodRecord{ .library = "icuuc", .import = "u_setMemoryFunctions", .signature = "\x00\x05\x01\x0f\x01\x0f\x12\x90\xad\x0f\x12\x90\xb1\x0f\x12\x90\xb5\x0f\x11\x90\x19" } },
    .{ "u_catopen", MethodRecord{ .library = "icuuc", .import = "u_catopen", .signature = "\x00\x03\x0f\x11\x90\x45\x11\x3d\x11\x3d\x0f\x11\x90\x19" } },
    .{ "u_catclose", MethodRecord{ .library = "icuuc", .import = "u_catclose", .signature = "\x00\x01\x01\x0f\x11\x90\x45" } },
    .{ "u_catgets", MethodRecord{ .library = "icuuc", .import = "u_catgets", .signature = "\x00\x06\x0f\x07\x0f\x11\x90\x45\x08\x08\x0f\x07\x0f\x08\x0f\x11\x90\x19" } },
    .{ "u_hasBinaryProperty", MethodRecord{ .library = "icuuc", .import = "u_hasBinaryProperty", .signature = "\x00\x02\x04\x08\x11\x90\xb9" } },
    .{ "u_stringHasBinaryProperty", MethodRecord{ .library = "icu", .import = "u_stringHasBinaryProperty", .signature = "\x00\x03\x04\x0f\x07\x08\x11\x90\xb9" } },
    .{ "u_getBinaryPropertySet", MethodRecord{ .library = "icu", .import = "u_getBinaryPropertySet", .signature = "\x00\x02\x0f\x11\x90\x9d\x11\x90\xb9\x0f\x11\x90\x19" } },
    .{ "u_isUAlphabetic", MethodRecord{ .library = "icuuc", .import = "u_isUAlphabetic", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isULowercase", MethodRecord{ .library = "icuuc", .import = "u_isULowercase", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isUUppercase", MethodRecord{ .library = "icuuc", .import = "u_isUUppercase", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isUWhiteSpace", MethodRecord{ .library = "icuuc", .import = "u_isUWhiteSpace", .signature = "\x00\x01\x04\x08" } },
    .{ "u_getIntPropertyValue", MethodRecord{ .library = "icuuc", .import = "u_getIntPropertyValue", .signature = "\x00\x02\x08\x08\x11\x90\xb9" } },
    .{ "u_getIntPropertyMinValue", MethodRecord{ .library = "icuuc", .import = "u_getIntPropertyMinValue", .signature = "\x00\x01\x08\x11\x90\xb9" } },
    .{ "u_getIntPropertyMaxValue", MethodRecord{ .library = "icuuc", .import = "u_getIntPropertyMaxValue", .signature = "\x00\x01\x08\x11\x90\xb9" } },
    .{ "u_getIntPropertyMap", MethodRecord{ .library = "icu", .import = "u_getIntPropertyMap", .signature = "\x00\x02\x0f\x11\x90\x69\x11\x90\xb9\x0f\x11\x90\x19" } },
    .{ "u_getNumericValue", MethodRecord{ .library = "icuuc", .import = "u_getNumericValue", .signature = "\x00\x01\x0d\x08" } },
    .{ "u_islower", MethodRecord{ .library = "icuuc", .import = "u_islower", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isupper", MethodRecord{ .library = "icuuc", .import = "u_isupper", .signature = "\x00\x01\x04\x08" } },
    .{ "u_istitle", MethodRecord{ .library = "icuuc", .import = "u_istitle", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isdigit", MethodRecord{ .library = "icuuc", .import = "u_isdigit", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isalpha", MethodRecord{ .library = "icuuc", .import = "u_isalpha", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isalnum", MethodRecord{ .library = "icuuc", .import = "u_isalnum", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isxdigit", MethodRecord{ .library = "icuuc", .import = "u_isxdigit", .signature = "\x00\x01\x04\x08" } },
    .{ "u_ispunct", MethodRecord{ .library = "icuuc", .import = "u_ispunct", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isgraph", MethodRecord{ .library = "icuuc", .import = "u_isgraph", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isblank", MethodRecord{ .library = "icuuc", .import = "u_isblank", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isdefined", MethodRecord{ .library = "icuuc", .import = "u_isdefined", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isspace", MethodRecord{ .library = "icuuc", .import = "u_isspace", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isJavaSpaceChar", MethodRecord{ .library = "icuuc", .import = "u_isJavaSpaceChar", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isWhitespace", MethodRecord{ .library = "icuuc", .import = "u_isWhitespace", .signature = "\x00\x01\x04\x08" } },
    .{ "u_iscntrl", MethodRecord{ .library = "icuuc", .import = "u_iscntrl", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isISOControl", MethodRecord{ .library = "icuuc", .import = "u_isISOControl", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isprint", MethodRecord{ .library = "icuuc", .import = "u_isprint", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isbase", MethodRecord{ .library = "icuuc", .import = "u_isbase", .signature = "\x00\x01\x04\x08" } },
    .{ "u_charDirection", MethodRecord{ .library = "icuuc", .import = "u_charDirection", .signature = "\x00\x01\x11\x90\xbd\x08" } },
    .{ "u_isMirrored", MethodRecord{ .library = "icuuc", .import = "u_isMirrored", .signature = "\x00\x01\x04\x08" } },
    .{ "u_charMirror", MethodRecord{ .library = "icuuc", .import = "u_charMirror", .signature = "\x00\x01\x08\x08" } },
    .{ "u_getBidiPairedBracket", MethodRecord{ .library = "icuuc", .import = "u_getBidiPairedBracket", .signature = "\x00\x01\x08\x08" } },
    .{ "u_charType", MethodRecord{ .library = "icuuc", .import = "u_charType", .signature = "\x00\x01\x04\x08" } },
    .{ "u_enumCharTypes", MethodRecord{ .library = "icuuc", .import = "u_enumCharTypes", .signature = "\x00\x02\x01\x0f\x12\x90\xc1\x0f\x01" } },
    .{ "u_getCombiningClass", MethodRecord{ .library = "icuuc", .import = "u_getCombiningClass", .signature = "\x00\x01\x05\x08" } },
    .{ "u_charDigitValue", MethodRecord{ .library = "icuuc", .import = "u_charDigitValue", .signature = "\x00\x01\x08\x08" } },
    .{ "ublock_getCode", MethodRecord{ .library = "icuuc", .import = "ublock_getCode", .signature = "\x00\x01\x11\x90\xc5\x08" } },
    .{ "u_charName", MethodRecord{ .library = "icuuc", .import = "u_charName", .signature = "\x00\x05\x08\x08\x11\x90\xc9\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "u_charFromName", MethodRecord{ .library = "icuuc", .import = "u_charFromName", .signature = "\x00\x03\x08\x11\x90\xc9\x11\x3d\x0f\x11\x90\x19" } },
    .{ "u_enumCharNames", MethodRecord{ .library = "icuuc", .import = "u_enumCharNames", .signature = "\x00\x06\x01\x08\x08\x0f\x12\x90\xcd\x0f\x01\x11\x90\xc9\x0f\x11\x90\x19" } },
    .{ "u_getPropertyName", MethodRecord{ .library = "icuuc", .import = "u_getPropertyName", .signature = "\x00\x02\x11\x3d\x11\x90\xb9\x11\x90\xd1" } },
    .{ "u_getPropertyEnum", MethodRecord{ .library = "icuuc", .import = "u_getPropertyEnum", .signature = "\x00\x01\x11\x90\xb9\x11\x3d" } },
    .{ "u_getPropertyValueName", MethodRecord{ .library = "icuuc", .import = "u_getPropertyValueName", .signature = "\x00\x03\x11\x3d\x11\x90\xb9\x08\x11\x90\xd1" } },
    .{ "u_getPropertyValueEnum", MethodRecord{ .library = "icuuc", .import = "u_getPropertyValueEnum", .signature = "\x00\x02\x08\x11\x90\xb9\x11\x3d" } },
    .{ "u_isIDStart", MethodRecord{ .library = "icuuc", .import = "u_isIDStart", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isIDPart", MethodRecord{ .library = "icuuc", .import = "u_isIDPart", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isIDIgnorable", MethodRecord{ .library = "icuuc", .import = "u_isIDIgnorable", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isJavaIDStart", MethodRecord{ .library = "icuuc", .import = "u_isJavaIDStart", .signature = "\x00\x01\x04\x08" } },
    .{ "u_isJavaIDPart", MethodRecord{ .library = "icuuc", .import = "u_isJavaIDPart", .signature = "\x00\x01\x04\x08" } },
    .{ "u_tolower", MethodRecord{ .library = "icuuc", .import = "u_tolower", .signature = "\x00\x01\x08\x08" } },
    .{ "u_toupper", MethodRecord{ .library = "icuuc", .import = "u_toupper", .signature = "\x00\x01\x08\x08" } },
    .{ "u_totitle", MethodRecord{ .library = "icuuc", .import = "u_totitle", .signature = "\x00\x01\x08\x08" } },
    .{ "u_foldCase", MethodRecord{ .library = "icuuc", .import = "u_foldCase", .signature = "\x00\x02\x08\x08\x09" } },
    .{ "u_digit", MethodRecord{ .library = "icuuc", .import = "u_digit", .signature = "\x00\x02\x08\x08\x04" } },
    .{ "u_forDigit", MethodRecord{ .library = "icuuc", .import = "u_forDigit", .signature = "\x00\x02\x08\x08\x04" } },
    .{ "u_charAge", MethodRecord{ .library = "icuuc", .import = "u_charAge", .signature = "\x00\x02\x01\x08\x0f\x05" } },
    .{ "u_getUnicodeVersion", MethodRecord{ .library = "icuuc", .import = "u_getUnicodeVersion", .signature = "\x00\x01\x01\x0f\x05" } },
    .{ "u_getFC_NFKC_Closure", MethodRecord{ .library = "icuuc", .import = "u_getFC_NFKC_Closure", .signature = "\x00\x04\x08\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ubidi_open", MethodRecord{ .library = "icuuc", .import = "ubidi_open", .signature = "\x00\x00\x0f\x11\x90\xd5" } },
    .{ "ubidi_openSized", MethodRecord{ .library = "icuuc", .import = "ubidi_openSized", .signature = "\x00\x03\x0f\x11\x90\xd5\x08\x08\x0f\x11\x90\x19" } },
    .{ "ubidi_close", MethodRecord{ .library = "icuuc", .import = "ubidi_close", .signature = "\x00\x01\x01\x0f\x11\x90\xd5" } },
    .{ "ubidi_setInverse", MethodRecord{ .library = "icuuc", .import = "ubidi_setInverse", .signature = "\x00\x02\x01\x0f\x11\x90\xd5\x04" } },
    .{ "ubidi_isInverse", MethodRecord{ .library = "icuuc", .import = "ubidi_isInverse", .signature = "\x00\x01\x04\x0f\x11\x90\xd5" } },
    .{ "ubidi_orderParagraphsLTR", MethodRecord{ .library = "icuuc", .import = "ubidi_orderParagraphsLTR", .signature = "\x00\x02\x01\x0f\x11\x90\xd5\x04" } },
    .{ "ubidi_isOrderParagraphsLTR", MethodRecord{ .library = "icuuc", .import = "ubidi_isOrderParagraphsLTR", .signature = "\x00\x01\x04\x0f\x11\x90\xd5" } },
    .{ "ubidi_setReorderingMode", MethodRecord{ .library = "icuuc", .import = "ubidi_setReorderingMode", .signature = "\x00\x02\x01\x0f\x11\x90\xd5\x11\x90\xd9" } },
    .{ "ubidi_getReorderingMode", MethodRecord{ .library = "icuuc", .import = "ubidi_getReorderingMode", .signature = "\x00\x01\x11\x90\xd9\x0f\x11\x90\xd5" } },
    .{ "ubidi_setReorderingOptions", MethodRecord{ .library = "icuuc", .import = "ubidi_setReorderingOptions", .signature = "\x00\x02\x01\x0f\x11\x90\xd5\x09" } },
    .{ "ubidi_getReorderingOptions", MethodRecord{ .library = "icuuc", .import = "ubidi_getReorderingOptions", .signature = "\x00\x01\x09\x0f\x11\x90\xd5" } },
    .{ "ubidi_setContext", MethodRecord{ .library = "icuuc", .import = "ubidi_setContext", .signature = "\x00\x06\x01\x0f\x11\x90\xd5\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ubidi_setPara", MethodRecord{ .library = "icuuc", .import = "ubidi_setPara", .signature = "\x00\x06\x01\x0f\x11\x90\xd5\x0f\x07\x08\x05\x0f\x05\x0f\x11\x90\x19" } },
    .{ "ubidi_setLine", MethodRecord{ .library = "icuuc", .import = "ubidi_setLine", .signature = "\x00\x05\x01\x0f\x11\x90\xd5\x08\x08\x0f\x11\x90\xd5\x0f\x11\x90\x19" } },
    .{ "ubidi_getDirection", MethodRecord{ .library = "icuuc", .import = "ubidi_getDirection", .signature = "\x00\x01\x11\x90\xdd\x0f\x11\x90\xd5" } },
    .{ "ubidi_getBaseDirection", MethodRecord{ .library = "icuuc", .import = "ubidi_getBaseDirection", .signature = "\x00\x02\x11\x90\xdd\x0f\x07\x08" } },
    .{ "ubidi_getText", MethodRecord{ .library = "icuuc", .import = "ubidi_getText", .signature = "\x00\x01\x0f\x07\x0f\x11\x90\xd5" } },
    .{ "ubidi_getLength", MethodRecord{ .library = "icuuc", .import = "ubidi_getLength", .signature = "\x00\x01\x08\x0f\x11\x90\xd5" } },
    .{ "ubidi_getParaLevel", MethodRecord{ .library = "icuuc", .import = "ubidi_getParaLevel", .signature = "\x00\x01\x05\x0f\x11\x90\xd5" } },
    .{ "ubidi_countParagraphs", MethodRecord{ .library = "icuuc", .import = "ubidi_countParagraphs", .signature = "\x00\x01\x08\x0f\x11\x90\xd5" } },
    .{ "ubidi_getParagraph", MethodRecord{ .library = "icuuc", .import = "ubidi_getParagraph", .signature = "\x00\x06\x08\x0f\x11\x90\xd5\x08\x0f\x08\x0f\x08\x0f\x05\x0f\x11\x90\x19" } },
    .{ "ubidi_getParagraphByIndex", MethodRecord{ .library = "icuuc", .import = "ubidi_getParagraphByIndex", .signature = "\x00\x06\x01\x0f\x11\x90\xd5\x08\x0f\x08\x0f\x08\x0f\x05\x0f\x11\x90\x19" } },
    .{ "ubidi_getLevelAt", MethodRecord{ .library = "icuuc", .import = "ubidi_getLevelAt", .signature = "\x00\x02\x05\x0f\x11\x90\xd5\x08" } },
    .{ "ubidi_getLevels", MethodRecord{ .library = "icuuc", .import = "ubidi_getLevels", .signature = "\x00\x02\x0f\x05\x0f\x11\x90\xd5\x0f\x11\x90\x19" } },
    .{ "ubidi_getLogicalRun", MethodRecord{ .library = "icuuc", .import = "ubidi_getLogicalRun", .signature = "\x00\x04\x01\x0f\x11\x90\xd5\x08\x0f\x08\x0f\x05" } },
    .{ "ubidi_countRuns", MethodRecord{ .library = "icuuc", .import = "ubidi_countRuns", .signature = "\x00\x02\x08\x0f\x11\x90\xd5\x0f\x11\x90\x19" } },
    .{ "ubidi_getVisualRun", MethodRecord{ .library = "icuuc", .import = "ubidi_getVisualRun", .signature = "\x00\x04\x11\x90\xdd\x0f\x11\x90\xd5\x08\x0f\x08\x0f\x08" } },
    .{ "ubidi_getVisualIndex", MethodRecord{ .library = "icuuc", .import = "ubidi_getVisualIndex", .signature = "\x00\x03\x08\x0f\x11\x90\xd5\x08\x0f\x11\x90\x19" } },
    .{ "ubidi_getLogicalIndex", MethodRecord{ .library = "icuuc", .import = "ubidi_getLogicalIndex", .signature = "\x00\x03\x08\x0f\x11\x90\xd5\x08\x0f\x11\x90\x19" } },
    .{ "ubidi_getLogicalMap", MethodRecord{ .library = "icuuc", .import = "ubidi_getLogicalMap", .signature = "\x00\x03\x01\x0f\x11\x90\xd5\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ubidi_getVisualMap", MethodRecord{ .library = "icuuc", .import = "ubidi_getVisualMap", .signature = "\x00\x03\x01\x0f\x11\x90\xd5\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ubidi_reorderLogical", MethodRecord{ .library = "icuuc", .import = "ubidi_reorderLogical", .signature = "\x00\x03\x01\x0f\x05\x08\x0f\x08" } },
    .{ "ubidi_reorderVisual", MethodRecord{ .library = "icuuc", .import = "ubidi_reorderVisual", .signature = "\x00\x03\x01\x0f\x05\x08\x0f\x08" } },
    .{ "ubidi_invertMap", MethodRecord{ .library = "icuuc", .import = "ubidi_invertMap", .signature = "\x00\x03\x01\x0f\x08\x0f\x08\x08" } },
    .{ "ubidi_getProcessedLength", MethodRecord{ .library = "icuuc", .import = "ubidi_getProcessedLength", .signature = "\x00\x01\x08\x0f\x11\x90\xd5" } },
    .{ "ubidi_getResultLength", MethodRecord{ .library = "icuuc", .import = "ubidi_getResultLength", .signature = "\x00\x01\x08\x0f\x11\x90\xd5" } },
    .{ "ubidi_getCustomizedClass", MethodRecord{ .library = "icuuc", .import = "ubidi_getCustomizedClass", .signature = "\x00\x02\x11\x90\xbd\x0f\x11\x90\xd5\x08" } },
    .{ "ubidi_setClassCallback", MethodRecord{ .library = "icuuc", .import = "ubidi_setClassCallback", .signature = "\x00\x06\x01\x0f\x11\x90\xd5\x12\x90\xe1\x0f\x01\x0f\x12\x90\xe1\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ubidi_getClassCallback", MethodRecord{ .library = "icuuc", .import = "ubidi_getClassCallback", .signature = "\x00\x03\x01\x0f\x11\x90\xd5\x0f\x12\x90\xe1\x0f\x0f\x01" } },
    .{ "ubidi_writeReordered", MethodRecord{ .library = "icuuc", .import = "ubidi_writeReordered", .signature = "\x00\x05\x08\x0f\x11\x90\xd5\x0f\x07\x08\x07\x0f\x11\x90\x19" } },
    .{ "ubidi_writeReverse", MethodRecord{ .library = "icuuc", .import = "ubidi_writeReverse", .signature = "\x00\x06\x08\x0f\x07\x08\x0f\x07\x08\x07\x0f\x11\x90\x19" } },
    .{ "ubiditransform_transform", MethodRecord{ .library = "icuuc", .import = "ubiditransform_transform", .signature = "\x00\x0c\x09\x0f\x11\x90\xe5\x0f\x07\x08\x0f\x07\x08\x05\x11\x90\xe9\x05\x11\x90\xe9\x11\x90\xed\x09\x0f\x11\x90\x19" } },
    .{ "ubiditransform_open", MethodRecord{ .library = "icuuc", .import = "ubiditransform_open", .signature = "\x00\x01\x0f\x11\x90\xe5\x0f\x11\x90\x19" } },
    .{ "ubiditransform_close", MethodRecord{ .library = "icuuc", .import = "ubiditransform_close", .signature = "\x00\x01\x01\x0f\x11\x90\xe5" } },
    .{ "utext_close", MethodRecord{ .library = "icuuc", .import = "utext_close", .signature = "\x00\x01\x0f\x11\x90\xf1\x0f\x11\x90\xf1" } },
    .{ "utext_openUTF8", MethodRecord{ .library = "icuuc", .import = "utext_openUTF8", .signature = "\x00\x04\x0f\x11\x90\xf1\x0f\x11\x90\xf1\x11\x3d\x0a\x0f\x11\x90\x19" } },
    .{ "utext_openUChars", MethodRecord{ .library = "icuuc", .import = "utext_openUChars", .signature = "\x00\x04\x0f\x11\x90\xf1\x0f\x11\x90\xf1\x0f\x07\x0a\x0f\x11\x90\x19" } },
    .{ "utext_clone", MethodRecord{ .library = "icuuc", .import = "utext_clone", .signature = "\x00\x05\x0f\x11\x90\xf1\x0f\x11\x90\xf1\x0f\x11\x90\xf1\x04\x04\x0f\x11\x90\x19" } },
    .{ "utext_equals", MethodRecord{ .library = "icuuc", .import = "utext_equals", .signature = "\x00\x02\x04\x0f\x11\x90\xf1\x0f\x11\x90\xf1" } },
    .{ "utext_nativeLength", MethodRecord{ .library = "icuuc", .import = "utext_nativeLength", .signature = "\x00\x01\x0a\x0f\x11\x90\xf1" } },
    .{ "utext_isLengthExpensive", MethodRecord{ .library = "icuuc", .import = "utext_isLengthExpensive", .signature = "\x00\x01\x04\x0f\x11\x90\xf1" } },
    .{ "utext_char32At", MethodRecord{ .library = "icuuc", .import = "utext_char32At", .signature = "\x00\x02\x08\x0f\x11\x90\xf1\x0a" } },
    .{ "utext_current32", MethodRecord{ .library = "icuuc", .import = "utext_current32", .signature = "\x00\x01\x08\x0f\x11\x90\xf1" } },
    .{ "utext_next32", MethodRecord{ .library = "icuuc", .import = "utext_next32", .signature = "\x00\x01\x08\x0f\x11\x90\xf1" } },
    .{ "utext_previous32", MethodRecord{ .library = "icuuc", .import = "utext_previous32", .signature = "\x00\x01\x08\x0f\x11\x90\xf1" } },
    .{ "utext_next32From", MethodRecord{ .library = "icuuc", .import = "utext_next32From", .signature = "\x00\x02\x08\x0f\x11\x90\xf1\x0a" } },
    .{ "utext_previous32From", MethodRecord{ .library = "icuuc", .import = "utext_previous32From", .signature = "\x00\x02\x08\x0f\x11\x90\xf1\x0a" } },
    .{ "utext_getNativeIndex", MethodRecord{ .library = "icuuc", .import = "utext_getNativeIndex", .signature = "\x00\x01\x0a\x0f\x11\x90\xf1" } },
    .{ "utext_setNativeIndex", MethodRecord{ .library = "icuuc", .import = "utext_setNativeIndex", .signature = "\x00\x02\x01\x0f\x11\x90\xf1\x0a" } },
    .{ "utext_moveIndex32", MethodRecord{ .library = "icuuc", .import = "utext_moveIndex32", .signature = "\x00\x02\x04\x0f\x11\x90\xf1\x08" } },
    .{ "utext_getPreviousNativeIndex", MethodRecord{ .library = "icuuc", .import = "utext_getPreviousNativeIndex", .signature = "\x00\x01\x0a\x0f\x11\x90\xf1" } },
    .{ "utext_extract", MethodRecord{ .library = "icuuc", .import = "utext_extract", .signature = "\x00\x06\x08\x0f\x11\x90\xf1\x0a\x0a\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "utext_isWritable", MethodRecord{ .library = "icuuc", .import = "utext_isWritable", .signature = "\x00\x01\x04\x0f\x11\x90\xf1" } },
    .{ "utext_hasMetaData", MethodRecord{ .library = "icuuc", .import = "utext_hasMetaData", .signature = "\x00\x01\x04\x0f\x11\x90\xf1" } },
    .{ "utext_replace", MethodRecord{ .library = "icuuc", .import = "utext_replace", .signature = "\x00\x06\x08\x0f\x11\x90\xf1\x0a\x0a\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "utext_copy", MethodRecord{ .library = "icuuc", .import = "utext_copy", .signature = "\x00\x06\x01\x0f\x11\x90\xf1\x0a\x0a\x0a\x04\x0f\x11\x90\x19" } },
    .{ "utext_freeze", MethodRecord{ .library = "icuuc", .import = "utext_freeze", .signature = "\x00\x01\x01\x0f\x11\x90\xf1" } },
    .{ "utext_setup", MethodRecord{ .library = "icuuc", .import = "utext_setup", .signature = "\x00\x03\x0f\x11\x90\xf1\x0f\x11\x90\xf1\x08\x0f\x11\x90\x19" } },
    .{ "uset_openEmpty", MethodRecord{ .library = "icuuc", .import = "uset_openEmpty", .signature = "\x00\x00\x0f\x11\x90\x9d" } },
    .{ "uset_open", MethodRecord{ .library = "icuuc", .import = "uset_open", .signature = "\x00\x02\x0f\x11\x90\x9d\x08\x08" } },
    .{ "uset_openPattern", MethodRecord{ .library = "icuuc", .import = "uset_openPattern", .signature = "\x00\x03\x0f\x11\x90\x9d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uset_openPatternOptions", MethodRecord{ .library = "icuuc", .import = "uset_openPatternOptions", .signature = "\x00\x04\x0f\x11\x90\x9d\x0f\x07\x08\x09\x0f\x11\x90\x19" } },
    .{ "uset_close", MethodRecord{ .library = "icuuc", .import = "uset_close", .signature = "\x00\x01\x01\x0f\x11\x90\x9d" } },
    .{ "uset_clone", MethodRecord{ .library = "icuuc", .import = "uset_clone", .signature = "\x00\x01\x0f\x11\x90\x9d\x0f\x11\x90\x9d" } },
    .{ "uset_isFrozen", MethodRecord{ .library = "icuuc", .import = "uset_isFrozen", .signature = "\x00\x01\x04\x0f\x11\x90\x9d" } },
    .{ "uset_freeze", MethodRecord{ .library = "icuuc", .import = "uset_freeze", .signature = "\x00\x01\x01\x0f\x11\x90\x9d" } },
    .{ "uset_cloneAsThawed", MethodRecord{ .library = "icuuc", .import = "uset_cloneAsThawed", .signature = "\x00\x01\x0f\x11\x90\x9d\x0f\x11\x90\x9d" } },
    .{ "uset_set", MethodRecord{ .library = "icuuc", .import = "uset_set", .signature = "\x00\x03\x01\x0f\x11\x90\x9d\x08\x08" } },
    .{ "uset_applyPattern", MethodRecord{ .library = "icuuc", .import = "uset_applyPattern", .signature = "\x00\x05\x08\x0f\x11\x90\x9d\x0f\x07\x08\x09\x0f\x11\x90\x19" } },
    .{ "uset_applyIntPropertyValue", MethodRecord{ .library = "icuuc", .import = "uset_applyIntPropertyValue", .signature = "\x00\x04\x01\x0f\x11\x90\x9d\x11\x90\xb9\x08\x0f\x11\x90\x19" } },
    .{ "uset_applyPropertyAlias", MethodRecord{ .library = "icuuc", .import = "uset_applyPropertyAlias", .signature = "\x00\x06\x01\x0f\x11\x90\x9d\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uset_resemblesPattern", MethodRecord{ .library = "icuuc", .import = "uset_resemblesPattern", .signature = "\x00\x03\x04\x0f\x07\x08\x08" } },
    .{ "uset_toPattern", MethodRecord{ .library = "icuuc", .import = "uset_toPattern", .signature = "\x00\x05\x08\x0f\x11\x90\x9d\x0f\x07\x08\x04\x0f\x11\x90\x19" } },
    .{ "uset_add", MethodRecord{ .library = "icuuc", .import = "uset_add", .signature = "\x00\x02\x01\x0f\x11\x90\x9d\x08" } },
    .{ "uset_addAll", MethodRecord{ .library = "icuuc", .import = "uset_addAll", .signature = "\x00\x02\x01\x0f\x11\x90\x9d\x0f\x11\x90\x9d" } },
    .{ "uset_addRange", MethodRecord{ .library = "icuuc", .import = "uset_addRange", .signature = "\x00\x03\x01\x0f\x11\x90\x9d\x08\x08" } },
    .{ "uset_addString", MethodRecord{ .library = "icuuc", .import = "uset_addString", .signature = "\x00\x03\x01\x0f\x11\x90\x9d\x0f\x07\x08" } },
    .{ "uset_addAllCodePoints", MethodRecord{ .library = "icuuc", .import = "uset_addAllCodePoints", .signature = "\x00\x03\x01\x0f\x11\x90\x9d\x0f\x07\x08" } },
    .{ "uset_remove", MethodRecord{ .library = "icuuc", .import = "uset_remove", .signature = "\x00\x02\x01\x0f\x11\x90\x9d\x08" } },
    .{ "uset_removeRange", MethodRecord{ .library = "icuuc", .import = "uset_removeRange", .signature = "\x00\x03\x01\x0f\x11\x90\x9d\x08\x08" } },
    .{ "uset_removeString", MethodRecord{ .library = "icuuc", .import = "uset_removeString", .signature = "\x00\x03\x01\x0f\x11\x90\x9d\x0f\x07\x08" } },
    .{ "uset_removeAllCodePoints", MethodRecord{ .library = "icu", .import = "uset_removeAllCodePoints", .signature = "\x00\x03\x01\x0f\x11\x90\x9d\x0f\x07\x08" } },
    .{ "uset_removeAll", MethodRecord{ .library = "icuuc", .import = "uset_removeAll", .signature = "\x00\x02\x01\x0f\x11\x90\x9d\x0f\x11\x90\x9d" } },
    .{ "uset_retain", MethodRecord{ .library = "icuuc", .import = "uset_retain", .signature = "\x00\x03\x01\x0f\x11\x90\x9d\x08\x08" } },
    .{ "uset_retainString", MethodRecord{ .library = "icu", .import = "uset_retainString", .signature = "\x00\x03\x01\x0f\x11\x90\x9d\x0f\x07\x08" } },
    .{ "uset_retainAllCodePoints", MethodRecord{ .library = "icu", .import = "uset_retainAllCodePoints", .signature = "\x00\x03\x01\x0f\x11\x90\x9d\x0f\x07\x08" } },
    .{ "uset_retainAll", MethodRecord{ .library = "icuuc", .import = "uset_retainAll", .signature = "\x00\x02\x01\x0f\x11\x90\x9d\x0f\x11\x90\x9d" } },
    .{ "uset_compact", MethodRecord{ .library = "icuuc", .import = "uset_compact", .signature = "\x00\x01\x01\x0f\x11\x90\x9d" } },
    .{ "uset_complement", MethodRecord{ .library = "icuuc", .import = "uset_complement", .signature = "\x00\x01\x01\x0f\x11\x90\x9d" } },
    .{ "uset_complementRange", MethodRecord{ .library = "icu", .import = "uset_complementRange", .signature = "\x00\x03\x01\x0f\x11\x90\x9d\x08\x08" } },
    .{ "uset_complementString", MethodRecord{ .library = "icu", .import = "uset_complementString", .signature = "\x00\x03\x01\x0f\x11\x90\x9d\x0f\x07\x08" } },
    .{ "uset_complementAllCodePoints", MethodRecord{ .library = "icu", .import = "uset_complementAllCodePoints", .signature = "\x00\x03\x01\x0f\x11\x90\x9d\x0f\x07\x08" } },
    .{ "uset_complementAll", MethodRecord{ .library = "icuuc", .import = "uset_complementAll", .signature = "\x00\x02\x01\x0f\x11\x90\x9d\x0f\x11\x90\x9d" } },
    .{ "uset_clear", MethodRecord{ .library = "icuuc", .import = "uset_clear", .signature = "\x00\x01\x01\x0f\x11\x90\x9d" } },
    .{ "uset_closeOver", MethodRecord{ .library = "icuuc", .import = "uset_closeOver", .signature = "\x00\x02\x01\x0f\x11\x90\x9d\x08" } },
    .{ "uset_removeAllStrings", MethodRecord{ .library = "icuuc", .import = "uset_removeAllStrings", .signature = "\x00\x01\x01\x0f\x11\x90\x9d" } },
    .{ "uset_isEmpty", MethodRecord{ .library = "icuuc", .import = "uset_isEmpty", .signature = "\x00\x01\x04\x0f\x11\x90\x9d" } },
    .{ "uset_hasStrings", MethodRecord{ .library = "icu", .import = "uset_hasStrings", .signature = "\x00\x01\x04\x0f\x11\x90\x9d" } },
    .{ "uset_contains", MethodRecord{ .library = "icuuc", .import = "uset_contains", .signature = "\x00\x02\x04\x0f\x11\x90\x9d\x08" } },
    .{ "uset_containsRange", MethodRecord{ .library = "icuuc", .import = "uset_containsRange", .signature = "\x00\x03\x04\x0f\x11\x90\x9d\x08\x08" } },
    .{ "uset_containsString", MethodRecord{ .library = "icuuc", .import = "uset_containsString", .signature = "\x00\x03\x04\x0f\x11\x90\x9d\x0f\x07\x08" } },
    .{ "uset_indexOf", MethodRecord{ .library = "icuuc", .import = "uset_indexOf", .signature = "\x00\x02\x08\x0f\x11\x90\x9d\x08" } },
    .{ "uset_charAt", MethodRecord{ .library = "icuuc", .import = "uset_charAt", .signature = "\x00\x02\x08\x0f\x11\x90\x9d\x08" } },
    .{ "uset_size", MethodRecord{ .library = "icuuc", .import = "uset_size", .signature = "\x00\x01\x08\x0f\x11\x90\x9d" } },
    .{ "uset_getRangeCount", MethodRecord{ .library = "icu", .import = "uset_getRangeCount", .signature = "\x00\x01\x08\x0f\x11\x90\x9d" } },
    .{ "uset_getItemCount", MethodRecord{ .library = "icuuc", .import = "uset_getItemCount", .signature = "\x00\x01\x08\x0f\x11\x90\x9d" } },
    .{ "uset_getItem", MethodRecord{ .library = "icuuc", .import = "uset_getItem", .signature = "\x00\x07\x08\x0f\x11\x90\x9d\x08\x0f\x08\x0f\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uset_containsAll", MethodRecord{ .library = "icuuc", .import = "uset_containsAll", .signature = "\x00\x02\x04\x0f\x11\x90\x9d\x0f\x11\x90\x9d" } },
    .{ "uset_containsAllCodePoints", MethodRecord{ .library = "icuuc", .import = "uset_containsAllCodePoints", .signature = "\x00\x03\x04\x0f\x11\x90\x9d\x0f\x07\x08" } },
    .{ "uset_containsNone", MethodRecord{ .library = "icuuc", .import = "uset_containsNone", .signature = "\x00\x02\x04\x0f\x11\x90\x9d\x0f\x11\x90\x9d" } },
    .{ "uset_containsSome", MethodRecord{ .library = "icuuc", .import = "uset_containsSome", .signature = "\x00\x02\x04\x0f\x11\x90\x9d\x0f\x11\x90\x9d" } },
    .{ "uset_span", MethodRecord{ .library = "icuuc", .import = "uset_span", .signature = "\x00\x04\x08\x0f\x11\x90\x9d\x0f\x07\x08\x11\x90\xf5" } },
    .{ "uset_spanBack", MethodRecord{ .library = "icuuc", .import = "uset_spanBack", .signature = "\x00\x04\x08\x0f\x11\x90\x9d\x0f\x07\x08\x11\x90\xf5" } },
    .{ "uset_spanUTF8", MethodRecord{ .library = "icuuc", .import = "uset_spanUTF8", .signature = "\x00\x04\x08\x0f\x11\x90\x9d\x11\x3d\x08\x11\x90\xf5" } },
    .{ "uset_spanBackUTF8", MethodRecord{ .library = "icuuc", .import = "uset_spanBackUTF8", .signature = "\x00\x04\x08\x0f\x11\x90\x9d\x11\x3d\x08\x11\x90\xf5" } },
    .{ "uset_equals", MethodRecord{ .library = "icuuc", .import = "uset_equals", .signature = "\x00\x02\x04\x0f\x11\x90\x9d\x0f\x11\x90\x9d" } },
    .{ "uset_serialize", MethodRecord{ .library = "icuuc", .import = "uset_serialize", .signature = "\x00\x04\x08\x0f\x11\x90\x9d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uset_getSerializedSet", MethodRecord{ .library = "icuuc", .import = "uset_getSerializedSet", .signature = "\x00\x03\x04\x0f\x11\x90\xf9\x0f\x07\x08" } },
    .{ "uset_setSerializedToOne", MethodRecord{ .library = "icuuc", .import = "uset_setSerializedToOne", .signature = "\x00\x02\x01\x0f\x11\x90\xf9\x08" } },
    .{ "uset_serializedContains", MethodRecord{ .library = "icuuc", .import = "uset_serializedContains", .signature = "\x00\x02\x04\x0f\x11\x90\xf9\x08" } },
    .{ "uset_getSerializedRangeCount", MethodRecord{ .library = "icuuc", .import = "uset_getSerializedRangeCount", .signature = "\x00\x01\x08\x0f\x11\x90\xf9" } },
    .{ "uset_getSerializedRange", MethodRecord{ .library = "icuuc", .import = "uset_getSerializedRange", .signature = "\x00\x04\x04\x0f\x11\x90\xf9\x08\x0f\x08\x0f\x08" } },
    .{ "unorm2_getNFCInstance", MethodRecord{ .library = "icuuc", .import = "unorm2_getNFCInstance", .signature = "\x00\x01\x0f\x11\x90\xfd\x0f\x11\x90\x19" } },
    .{ "unorm2_getNFDInstance", MethodRecord{ .library = "icuuc", .import = "unorm2_getNFDInstance", .signature = "\x00\x01\x0f\x11\x90\xfd\x0f\x11\x90\x19" } },
    .{ "unorm2_getNFKCInstance", MethodRecord{ .library = "icuuc", .import = "unorm2_getNFKCInstance", .signature = "\x00\x01\x0f\x11\x90\xfd\x0f\x11\x90\x19" } },
    .{ "unorm2_getNFKDInstance", MethodRecord{ .library = "icuuc", .import = "unorm2_getNFKDInstance", .signature = "\x00\x01\x0f\x11\x90\xfd\x0f\x11\x90\x19" } },
    .{ "unorm2_getNFKCCasefoldInstance", MethodRecord{ .library = "icuuc", .import = "unorm2_getNFKCCasefoldInstance", .signature = "\x00\x01\x0f\x11\x90\xfd\x0f\x11\x90\x19" } },
    .{ "unorm2_getInstance", MethodRecord{ .library = "icuuc", .import = "unorm2_getInstance", .signature = "\x00\x04\x0f\x11\x90\xfd\x11\x3d\x11\x3d\x11\x91\x01\x0f\x11\x90\x19" } },
    .{ "unorm2_openFiltered", MethodRecord{ .library = "icuuc", .import = "unorm2_openFiltered", .signature = "\x00\x03\x0f\x11\x90\xfd\x0f\x11\x90\xfd\x0f\x11\x90\x9d\x0f\x11\x90\x19" } },
    .{ "unorm2_close", MethodRecord{ .library = "icuuc", .import = "unorm2_close", .signature = "\x00\x01\x01\x0f\x11\x90\xfd" } },
    .{ "unorm2_normalize", MethodRecord{ .library = "icuuc", .import = "unorm2_normalize", .signature = "\x00\x06\x08\x0f\x11\x90\xfd\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unorm2_normalizeSecondAndAppend", MethodRecord{ .library = "icuuc", .import = "unorm2_normalizeSecondAndAppend", .signature = "\x00\x07\x08\x0f\x11\x90\xfd\x0f\x07\x08\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unorm2_append", MethodRecord{ .library = "icuuc", .import = "unorm2_append", .signature = "\x00\x07\x08\x0f\x11\x90\xfd\x0f\x07\x08\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unorm2_getDecomposition", MethodRecord{ .library = "icuuc", .import = "unorm2_getDecomposition", .signature = "\x00\x05\x08\x0f\x11\x90\xfd\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unorm2_getRawDecomposition", MethodRecord{ .library = "icuuc", .import = "unorm2_getRawDecomposition", .signature = "\x00\x05\x08\x0f\x11\x90\xfd\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unorm2_composePair", MethodRecord{ .library = "icuuc", .import = "unorm2_composePair", .signature = "\x00\x03\x08\x0f\x11\x90\xfd\x08\x08" } },
    .{ "unorm2_getCombiningClass", MethodRecord{ .library = "icuuc", .import = "unorm2_getCombiningClass", .signature = "\x00\x02\x05\x0f\x11\x90\xfd\x08" } },
    .{ "unorm2_isNormalized", MethodRecord{ .library = "icuuc", .import = "unorm2_isNormalized", .signature = "\x00\x04\x04\x0f\x11\x90\xfd\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unorm2_quickCheck", MethodRecord{ .library = "icuuc", .import = "unorm2_quickCheck", .signature = "\x00\x04\x11\x91\x05\x0f\x11\x90\xfd\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unorm2_spanQuickCheckYes", MethodRecord{ .library = "icuuc", .import = "unorm2_spanQuickCheckYes", .signature = "\x00\x04\x08\x0f\x11\x90\xfd\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unorm2_hasBoundaryBefore", MethodRecord{ .library = "icuuc", .import = "unorm2_hasBoundaryBefore", .signature = "\x00\x02\x04\x0f\x11\x90\xfd\x08" } },
    .{ "unorm2_hasBoundaryAfter", MethodRecord{ .library = "icuuc", .import = "unorm2_hasBoundaryAfter", .signature = "\x00\x02\x04\x0f\x11\x90\xfd\x08" } },
    .{ "unorm2_isInert", MethodRecord{ .library = "icuuc", .import = "unorm2_isInert", .signature = "\x00\x02\x04\x0f\x11\x90\xfd\x08" } },
    .{ "unorm_compare", MethodRecord{ .library = "icuuc", .import = "unorm_compare", .signature = "\x00\x06\x08\x0f\x07\x08\x0f\x07\x08\x09\x0f\x11\x90\x19" } },
    .{ "ucnvsel_open", MethodRecord{ .library = "icuuc", .import = "ucnvsel_open", .signature = "\x00\x05\x0f\x11\x91\x09\x0f\x0f\x04\x08\x0f\x11\x90\x9d\x11\x90\xa1\x0f\x11\x90\x19" } },
    .{ "ucnvsel_close", MethodRecord{ .library = "icuuc", .import = "ucnvsel_close", .signature = "\x00\x01\x01\x0f\x11\x91\x09" } },
    .{ "ucnvsel_openFromSerialized", MethodRecord{ .library = "icuuc", .import = "ucnvsel_openFromSerialized", .signature = "\x00\x03\x0f\x11\x91\x09\x0f\x01\x08\x0f\x11\x90\x19" } },
    .{ "ucnvsel_serialize", MethodRecord{ .library = "icuuc", .import = "ucnvsel_serialize", .signature = "\x00\x04\x08\x0f\x11\x91\x09\x0f\x01\x08\x0f\x11\x90\x19" } },
    .{ "ucnvsel_selectForString", MethodRecord{ .library = "icuuc", .import = "ucnvsel_selectForString", .signature = "\x00\x04\x0f\x11\x90\x35\x0f\x11\x91\x09\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucnvsel_selectForUTF8", MethodRecord{ .library = "icuuc", .import = "ucnvsel_selectForUTF8", .signature = "\x00\x04\x0f\x11\x90\x35\x0f\x11\x91\x09\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "u_charsToUChars", MethodRecord{ .library = "icuuc", .import = "u_charsToUChars", .signature = "\x00\x03\x01\x11\x3d\x0f\x07\x08" } },
    .{ "u_UCharsToChars", MethodRecord{ .library = "icuuc", .import = "u_UCharsToChars", .signature = "\x00\x03\x01\x0f\x07\x11\x3d\x08" } },
    .{ "u_strlen", MethodRecord{ .library = "icuuc", .import = "u_strlen", .signature = "\x00\x01\x08\x0f\x07" } },
    .{ "u_countChar32", MethodRecord{ .library = "icuuc", .import = "u_countChar32", .signature = "\x00\x02\x08\x0f\x07\x08" } },
    .{ "u_strHasMoreChar32Than", MethodRecord{ .library = "icuuc", .import = "u_strHasMoreChar32Than", .signature = "\x00\x03\x04\x0f\x07\x08\x08" } },
    .{ "u_strcat", MethodRecord{ .library = "icuuc", .import = "u_strcat", .signature = "\x00\x02\x0f\x07\x0f\x07\x0f\x07" } },
    .{ "u_strncat", MethodRecord{ .library = "icuuc", .import = "u_strncat", .signature = "\x00\x03\x0f\x07\x0f\x07\x0f\x07\x08" } },
    .{ "u_strstr", MethodRecord{ .library = "icuuc", .import = "u_strstr", .signature = "\x00\x02\x0f\x07\x0f\x07\x0f\x07" } },
    .{ "u_strFindFirst", MethodRecord{ .library = "icuuc", .import = "u_strFindFirst", .signature = "\x00\x04\x0f\x07\x0f\x07\x08\x0f\x07\x08" } },
    .{ "u_strchr", MethodRecord{ .library = "icuuc", .import = "u_strchr", .signature = "\x00\x02\x0f\x07\x0f\x07\x07" } },
    .{ "u_strchr32", MethodRecord{ .library = "icuuc", .import = "u_strchr32", .signature = "\x00\x02\x0f\x07\x0f\x07\x08" } },
    .{ "u_strrstr", MethodRecord{ .library = "icuuc", .import = "u_strrstr", .signature = "\x00\x02\x0f\x07\x0f\x07\x0f\x07" } },
    .{ "u_strFindLast", MethodRecord{ .library = "icuuc", .import = "u_strFindLast", .signature = "\x00\x04\x0f\x07\x0f\x07\x08\x0f\x07\x08" } },
    .{ "u_strrchr", MethodRecord{ .library = "icuuc", .import = "u_strrchr", .signature = "\x00\x02\x0f\x07\x0f\x07\x07" } },
    .{ "u_strrchr32", MethodRecord{ .library = "icuuc", .import = "u_strrchr32", .signature = "\x00\x02\x0f\x07\x0f\x07\x08" } },
    .{ "u_strpbrk", MethodRecord{ .library = "icuuc", .import = "u_strpbrk", .signature = "\x00\x02\x0f\x07\x0f\x07\x0f\x07" } },
    .{ "u_strcspn", MethodRecord{ .library = "icuuc", .import = "u_strcspn", .signature = "\x00\x02\x08\x0f\x07\x0f\x07" } },
    .{ "u_strspn", MethodRecord{ .library = "icuuc", .import = "u_strspn", .signature = "\x00\x02\x08\x0f\x07\x0f\x07" } },
    .{ "u_strtok_r", MethodRecord{ .library = "icuuc", .import = "u_strtok_r", .signature = "\x00\x03\x0f\x07\x0f\x07\x0f\x07\x0f\x0f\x07" } },
    .{ "u_strcmp", MethodRecord{ .library = "icuuc", .import = "u_strcmp", .signature = "\x00\x02\x08\x0f\x07\x0f\x07" } },
    .{ "u_strcmpCodePointOrder", MethodRecord{ .library = "icuuc", .import = "u_strcmpCodePointOrder", .signature = "\x00\x02\x08\x0f\x07\x0f\x07" } },
    .{ "u_strCompare", MethodRecord{ .library = "icuuc", .import = "u_strCompare", .signature = "\x00\x05\x08\x0f\x07\x08\x0f\x07\x08\x04" } },
    .{ "u_strCompareIter", MethodRecord{ .library = "icuuc", .import = "u_strCompareIter", .signature = "\x00\x03\x08\x0f\x11\x90\x31\x0f\x11\x90\x31\x04" } },
    .{ "u_strCaseCompare", MethodRecord{ .library = "icuuc", .import = "u_strCaseCompare", .signature = "\x00\x06\x08\x0f\x07\x08\x0f\x07\x08\x09\x0f\x11\x90\x19" } },
    .{ "u_strncmp", MethodRecord{ .library = "icuuc", .import = "u_strncmp", .signature = "\x00\x03\x08\x0f\x07\x0f\x07\x08" } },
    .{ "u_strncmpCodePointOrder", MethodRecord{ .library = "icuuc", .import = "u_strncmpCodePointOrder", .signature = "\x00\x03\x08\x0f\x07\x0f\x07\x08" } },
    .{ "u_strcasecmp", MethodRecord{ .library = "icuuc", .import = "u_strcasecmp", .signature = "\x00\x03\x08\x0f\x07\x0f\x07\x09" } },
    .{ "u_strncasecmp", MethodRecord{ .library = "icuuc", .import = "u_strncasecmp", .signature = "\x00\x04\x08\x0f\x07\x0f\x07\x08\x09" } },
    .{ "u_memcasecmp", MethodRecord{ .library = "icuuc", .import = "u_memcasecmp", .signature = "\x00\x04\x08\x0f\x07\x0f\x07\x08\x09" } },
    .{ "u_strcpy", MethodRecord{ .library = "icuuc", .import = "u_strcpy", .signature = "\x00\x02\x0f\x07\x0f\x07\x0f\x07" } },
    .{ "u_strncpy", MethodRecord{ .library = "icuuc", .import = "u_strncpy", .signature = "\x00\x03\x0f\x07\x0f\x07\x0f\x07\x08" } },
    .{ "u_uastrcpy", MethodRecord{ .library = "icuuc", .import = "u_uastrcpy", .signature = "\x00\x02\x0f\x07\x0f\x07\x11\x3d" } },
    .{ "u_uastrncpy", MethodRecord{ .library = "icuuc", .import = "u_uastrncpy", .signature = "\x00\x03\x0f\x07\x0f\x07\x11\x3d\x08" } },
    .{ "u_austrcpy", MethodRecord{ .library = "icuuc", .import = "u_austrcpy", .signature = "\x00\x02\x11\x3d\x11\x3d\x0f\x07" } },
    .{ "u_austrncpy", MethodRecord{ .library = "icuuc", .import = "u_austrncpy", .signature = "\x00\x03\x11\x3d\x11\x3d\x0f\x07\x08" } },
    .{ "u_memcpy", MethodRecord{ .library = "icuuc", .import = "u_memcpy", .signature = "\x00\x03\x0f\x07\x0f\x07\x0f\x07\x08" } },
    .{ "u_memmove", MethodRecord{ .library = "icuuc", .import = "u_memmove", .signature = "\x00\x03\x0f\x07\x0f\x07\x0f\x07\x08" } },
    .{ "u_memset", MethodRecord{ .library = "icuuc", .import = "u_memset", .signature = "\x00\x03\x0f\x07\x0f\x07\x07\x08" } },
    .{ "u_memcmp", MethodRecord{ .library = "icuuc", .import = "u_memcmp", .signature = "\x00\x03\x08\x0f\x07\x0f\x07\x08" } },
    .{ "u_memcmpCodePointOrder", MethodRecord{ .library = "icuuc", .import = "u_memcmpCodePointOrder", .signature = "\x00\x03\x08\x0f\x07\x0f\x07\x08" } },
    .{ "u_memchr", MethodRecord{ .library = "icuuc", .import = "u_memchr", .signature = "\x00\x03\x0f\x07\x0f\x07\x07\x08" } },
    .{ "u_memchr32", MethodRecord{ .library = "icuuc", .import = "u_memchr32", .signature = "\x00\x03\x0f\x07\x0f\x07\x08\x08" } },
    .{ "u_memrchr", MethodRecord{ .library = "icuuc", .import = "u_memrchr", .signature = "\x00\x03\x0f\x07\x0f\x07\x07\x08" } },
    .{ "u_memrchr32", MethodRecord{ .library = "icuuc", .import = "u_memrchr32", .signature = "\x00\x03\x0f\x07\x0f\x07\x08\x08" } },
    .{ "u_unescape", MethodRecord{ .library = "icuuc", .import = "u_unescape", .signature = "\x00\x03\x08\x11\x3d\x0f\x07\x08" } },
    .{ "u_unescapeAt", MethodRecord{ .library = "icuuc", .import = "u_unescapeAt", .signature = "\x00\x04\x08\x12\x91\x0d\x0f\x08\x08\x0f\x01" } },
    .{ "u_strToUpper", MethodRecord{ .library = "icuuc", .import = "u_strToUpper", .signature = "\x00\x06\x08\x0f\x07\x08\x0f\x07\x08\x11\x3d\x0f\x11\x90\x19" } },
    .{ "u_strToLower", MethodRecord{ .library = "icuuc", .import = "u_strToLower", .signature = "\x00\x06\x08\x0f\x07\x08\x0f\x07\x08\x11\x3d\x0f\x11\x90\x19" } },
    .{ "u_strToTitle", MethodRecord{ .library = "icuuc", .import = "u_strToTitle", .signature = "\x00\x07\x08\x0f\x07\x08\x0f\x07\x08\x0f\x11\x91\x11\x11\x3d\x0f\x11\x90\x19" } },
    .{ "u_strFoldCase", MethodRecord{ .library = "icuuc", .import = "u_strFoldCase", .signature = "\x00\x06\x08\x0f\x07\x08\x0f\x07\x08\x09\x0f\x11\x90\x19" } },
    .{ "u_strToWCS", MethodRecord{ .library = "icuuc", .import = "u_strToWCS", .signature = "\x00\x06\x11\x05\x11\x05\x08\x0f\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "u_strFromWCS", MethodRecord{ .library = "icuuc", .import = "u_strFromWCS", .signature = "\x00\x06\x0f\x07\x0f\x07\x08\x0f\x08\x11\x05\x08\x0f\x11\x90\x19" } },
    .{ "u_strToUTF8", MethodRecord{ .library = "icuuc", .import = "u_strToUTF8", .signature = "\x00\x06\x11\x3d\x11\x3d\x08\x0f\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "u_strFromUTF8", MethodRecord{ .library = "icuuc", .import = "u_strFromUTF8", .signature = "\x00\x06\x0f\x07\x0f\x07\x08\x0f\x08\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "u_strToUTF8WithSub", MethodRecord{ .library = "icuuc", .import = "u_strToUTF8WithSub", .signature = "\x00\x08\x11\x3d\x11\x3d\x08\x0f\x08\x0f\x07\x08\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "u_strFromUTF8WithSub", MethodRecord{ .library = "icuuc", .import = "u_strFromUTF8WithSub", .signature = "\x00\x08\x0f\x07\x0f\x07\x08\x0f\x08\x11\x3d\x08\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "u_strFromUTF8Lenient", MethodRecord{ .library = "icuuc", .import = "u_strFromUTF8Lenient", .signature = "\x00\x06\x0f\x07\x0f\x07\x08\x0f\x08\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "u_strToUTF32", MethodRecord{ .library = "icuuc", .import = "u_strToUTF32", .signature = "\x00\x06\x0f\x08\x0f\x08\x08\x0f\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "u_strFromUTF32", MethodRecord{ .library = "icuuc", .import = "u_strFromUTF32", .signature = "\x00\x06\x0f\x07\x0f\x07\x08\x0f\x08\x0f\x08\x08\x0f\x11\x90\x19" } },
    .{ "u_strToUTF32WithSub", MethodRecord{ .library = "icuuc", .import = "u_strToUTF32WithSub", .signature = "\x00\x08\x0f\x08\x0f\x08\x08\x0f\x08\x0f\x07\x08\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "u_strFromUTF32WithSub", MethodRecord{ .library = "icuuc", .import = "u_strFromUTF32WithSub", .signature = "\x00\x08\x0f\x07\x0f\x07\x08\x0f\x08\x0f\x08\x08\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "u_strToJavaModifiedUTF8", MethodRecord{ .library = "icuuc", .import = "u_strToJavaModifiedUTF8", .signature = "\x00\x06\x11\x3d\x11\x3d\x08\x0f\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "u_strFromJavaModifiedUTF8WithSub", MethodRecord{ .library = "icuuc", .import = "u_strFromJavaModifiedUTF8WithSub", .signature = "\x00\x08\x0f\x07\x0f\x07\x08\x0f\x08\x11\x3d\x08\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ucasemap_open", MethodRecord{ .library = "icuuc", .import = "ucasemap_open", .signature = "\x00\x03\x0f\x11\x91\x15\x11\x3d\x09\x0f\x11\x90\x19" } },
    .{ "ucasemap_close", MethodRecord{ .library = "icuuc", .import = "ucasemap_close", .signature = "\x00\x01\x01\x0f\x11\x91\x15" } },
    .{ "ucasemap_getLocale", MethodRecord{ .library = "icuuc", .import = "ucasemap_getLocale", .signature = "\x00\x01\x11\x3d\x0f\x11\x91\x15" } },
    .{ "ucasemap_getOptions", MethodRecord{ .library = "icuuc", .import = "ucasemap_getOptions", .signature = "\x00\x01\x09\x0f\x11\x91\x15" } },
    .{ "ucasemap_setLocale", MethodRecord{ .library = "icuuc", .import = "ucasemap_setLocale", .signature = "\x00\x03\x01\x0f\x11\x91\x15\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ucasemap_setOptions", MethodRecord{ .library = "icuuc", .import = "ucasemap_setOptions", .signature = "\x00\x03\x01\x0f\x11\x91\x15\x09\x0f\x11\x90\x19" } },
    .{ "ucasemap_getBreakIterator", MethodRecord{ .library = "icuuc", .import = "ucasemap_getBreakIterator", .signature = "\x00\x01\x0f\x11\x91\x11\x0f\x11\x91\x15" } },
    .{ "ucasemap_setBreakIterator", MethodRecord{ .library = "icuuc", .import = "ucasemap_setBreakIterator", .signature = "\x00\x03\x01\x0f\x11\x91\x15\x0f\x11\x91\x11\x0f\x11\x90\x19" } },
    .{ "ucasemap_toTitle", MethodRecord{ .library = "icuuc", .import = "ucasemap_toTitle", .signature = "\x00\x06\x08\x0f\x11\x91\x15\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucasemap_utf8ToLower", MethodRecord{ .library = "icuuc", .import = "ucasemap_utf8ToLower", .signature = "\x00\x06\x08\x0f\x11\x91\x15\x11\x3d\x08\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "ucasemap_utf8ToUpper", MethodRecord{ .library = "icuuc", .import = "ucasemap_utf8ToUpper", .signature = "\x00\x06\x08\x0f\x11\x91\x15\x11\x3d\x08\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "ucasemap_utf8ToTitle", MethodRecord{ .library = "icuuc", .import = "ucasemap_utf8ToTitle", .signature = "\x00\x06\x08\x0f\x11\x91\x15\x11\x3d\x08\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "ucasemap_utf8FoldCase", MethodRecord{ .library = "icuuc", .import = "ucasemap_utf8FoldCase", .signature = "\x00\x06\x08\x0f\x11\x91\x15\x11\x3d\x08\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "usprep_open", MethodRecord{ .library = "icuuc", .import = "usprep_open", .signature = "\x00\x03\x0f\x11\x91\x19\x11\x3d\x11\x3d\x0f\x11\x90\x19" } },
    .{ "usprep_openByType", MethodRecord{ .library = "icuuc", .import = "usprep_openByType", .signature = "\x00\x02\x0f\x11\x91\x19\x11\x91\x1d\x0f\x11\x90\x19" } },
    .{ "usprep_close", MethodRecord{ .library = "icuuc", .import = "usprep_close", .signature = "\x00\x01\x01\x0f\x11\x91\x19" } },
    .{ "usprep_prepare", MethodRecord{ .library = "icuuc", .import = "usprep_prepare", .signature = "\x00\x08\x08\x0f\x11\x91\x19\x0f\x07\x08\x0f\x07\x08\x08\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "uidna_openUTS46", MethodRecord{ .library = "icuuc", .import = "uidna_openUTS46", .signature = "\x00\x02\x0f\x11\x91\x25\x09\x0f\x11\x90\x19" } },
    .{ "uidna_close", MethodRecord{ .library = "icuuc", .import = "uidna_close", .signature = "\x00\x01\x01\x0f\x11\x91\x25" } },
    .{ "uidna_labelToASCII", MethodRecord{ .library = "icuuc", .import = "uidna_labelToASCII", .signature = "\x00\x07\x08\x0f\x11\x91\x25\x0f\x07\x08\x0f\x07\x08\x0f\x11\x91\x29\x0f\x11\x90\x19" } },
    .{ "uidna_labelToUnicode", MethodRecord{ .library = "icuuc", .import = "uidna_labelToUnicode", .signature = "\x00\x07\x08\x0f\x11\x91\x25\x0f\x07\x08\x0f\x07\x08\x0f\x11\x91\x29\x0f\x11\x90\x19" } },
    .{ "uidna_nameToASCII", MethodRecord{ .library = "icuuc", .import = "uidna_nameToASCII", .signature = "\x00\x07\x08\x0f\x11\x91\x25\x0f\x07\x08\x0f\x07\x08\x0f\x11\x91\x29\x0f\x11\x90\x19" } },
    .{ "uidna_nameToUnicode", MethodRecord{ .library = "icuuc", .import = "uidna_nameToUnicode", .signature = "\x00\x07\x08\x0f\x11\x91\x25\x0f\x07\x08\x0f\x07\x08\x0f\x11\x91\x29\x0f\x11\x90\x19" } },
    .{ "uidna_labelToASCII_UTF8", MethodRecord{ .library = "icuuc", .import = "uidna_labelToASCII_UTF8", .signature = "\x00\x07\x08\x0f\x11\x91\x25\x11\x3d\x08\x11\x3d\x08\x0f\x11\x91\x29\x0f\x11\x90\x19" } },
    .{ "uidna_labelToUnicodeUTF8", MethodRecord{ .library = "icuuc", .import = "uidna_labelToUnicodeUTF8", .signature = "\x00\x07\x08\x0f\x11\x91\x25\x11\x3d\x08\x11\x3d\x08\x0f\x11\x91\x29\x0f\x11\x90\x19" } },
    .{ "uidna_nameToASCII_UTF8", MethodRecord{ .library = "icuuc", .import = "uidna_nameToASCII_UTF8", .signature = "\x00\x07\x08\x0f\x11\x91\x25\x11\x3d\x08\x11\x3d\x08\x0f\x11\x91\x29\x0f\x11\x90\x19" } },
    .{ "uidna_nameToUnicodeUTF8", MethodRecord{ .library = "icuuc", .import = "uidna_nameToUnicodeUTF8", .signature = "\x00\x07\x08\x0f\x11\x91\x25\x11\x3d\x08\x11\x3d\x08\x0f\x11\x91\x29\x0f\x11\x90\x19" } },
    .{ "ubrk_open", MethodRecord{ .library = "icuuc", .import = "ubrk_open", .signature = "\x00\x05\x0f\x11\x91\x11\x11\x91\x2d\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ubrk_openRules", MethodRecord{ .library = "icuuc", .import = "ubrk_openRules", .signature = "\x00\x06\x0f\x11\x91\x11\x0f\x07\x08\x0f\x07\x08\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "ubrk_openBinaryRules", MethodRecord{ .library = "icuuc", .import = "ubrk_openBinaryRules", .signature = "\x00\x05\x0f\x11\x91\x11\x0f\x05\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ubrk_safeClone", MethodRecord{ .library = "icuuc", .import = "ubrk_safeClone", .signature = "\x00\x04\x0f\x11\x91\x11\x0f\x11\x91\x11\x0f\x01\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ubrk_clone", MethodRecord{ .library = "icu", .import = "ubrk_clone", .signature = "\x00\x02\x0f\x11\x91\x11\x0f\x11\x91\x11\x0f\x11\x90\x19" } },
    .{ "ubrk_close", MethodRecord{ .library = "icuuc", .import = "ubrk_close", .signature = "\x00\x01\x01\x0f\x11\x91\x11" } },
    .{ "ubrk_setText", MethodRecord{ .library = "icuuc", .import = "ubrk_setText", .signature = "\x00\x04\x01\x0f\x11\x91\x11\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ubrk_setUText", MethodRecord{ .library = "icuuc", .import = "ubrk_setUText", .signature = "\x00\x03\x01\x0f\x11\x91\x11\x0f\x11\x90\xf1\x0f\x11\x90\x19" } },
    .{ "ubrk_current", MethodRecord{ .library = "icuuc", .import = "ubrk_current", .signature = "\x00\x01\x08\x0f\x11\x91\x11" } },
    .{ "ubrk_next", MethodRecord{ .library = "icuuc", .import = "ubrk_next", .signature = "\x00\x01\x08\x0f\x11\x91\x11" } },
    .{ "ubrk_previous", MethodRecord{ .library = "icuuc", .import = "ubrk_previous", .signature = "\x00\x01\x08\x0f\x11\x91\x11" } },
    .{ "ubrk_first", MethodRecord{ .library = "icuuc", .import = "ubrk_first", .signature = "\x00\x01\x08\x0f\x11\x91\x11" } },
    .{ "ubrk_last", MethodRecord{ .library = "icuuc", .import = "ubrk_last", .signature = "\x00\x01\x08\x0f\x11\x91\x11" } },
    .{ "ubrk_preceding", MethodRecord{ .library = "icuuc", .import = "ubrk_preceding", .signature = "\x00\x02\x08\x0f\x11\x91\x11\x08" } },
    .{ "ubrk_following", MethodRecord{ .library = "icuuc", .import = "ubrk_following", .signature = "\x00\x02\x08\x0f\x11\x91\x11\x08" } },
    .{ "ubrk_getAvailable", MethodRecord{ .library = "icuuc", .import = "ubrk_getAvailable", .signature = "\x00\x01\x11\x3d\x08" } },
    .{ "ubrk_countAvailable", MethodRecord{ .library = "icuuc", .import = "ubrk_countAvailable", .signature = "\x00\x00\x08" } },
    .{ "ubrk_isBoundary", MethodRecord{ .library = "icuuc", .import = "ubrk_isBoundary", .signature = "\x00\x02\x04\x0f\x11\x91\x11\x08" } },
    .{ "ubrk_getRuleStatus", MethodRecord{ .library = "icuuc", .import = "ubrk_getRuleStatus", .signature = "\x00\x01\x08\x0f\x11\x91\x11" } },
    .{ "ubrk_getRuleStatusVec", MethodRecord{ .library = "icuuc", .import = "ubrk_getRuleStatusVec", .signature = "\x00\x04\x08\x0f\x11\x91\x11\x0f\x08\x08\x0f\x11\x90\x19" } },
    .{ "ubrk_getLocaleByType", MethodRecord{ .library = "icuuc", .import = "ubrk_getLocaleByType", .signature = "\x00\x03\x11\x3d\x0f\x11\x91\x11\x11\x90\x49\x0f\x11\x90\x19" } },
    .{ "ubrk_refreshUText", MethodRecord{ .library = "icuuc", .import = "ubrk_refreshUText", .signature = "\x00\x03\x01\x0f\x11\x91\x11\x0f\x11\x90\xf1\x0f\x11\x90\x19" } },
    .{ "ubrk_getBinaryRules", MethodRecord{ .library = "icuuc", .import = "ubrk_getBinaryRules", .signature = "\x00\x04\x08\x0f\x11\x91\x11\x0f\x05\x08\x0f\x11\x90\x19" } },
    .{ "u_getDataVersion", MethodRecord{ .library = "icuuc", .import = "u_getDataVersion", .signature = "\x00\x02\x01\x0f\x05\x0f\x11\x90\x19" } },
    .{ "ucal_openTimeZoneIDEnumeration", MethodRecord{ .library = "icuin", .import = "ucal_openTimeZoneIDEnumeration", .signature = "\x00\x04\x0f\x11\x90\x35\x11\x91\x31\x11\x3d\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ucal_openTimeZones", MethodRecord{ .library = "icuin", .import = "ucal_openTimeZones", .signature = "\x00\x01\x0f\x11\x90\x35\x0f\x11\x90\x19" } },
    .{ "ucal_openCountryTimeZones", MethodRecord{ .library = "icuin", .import = "ucal_openCountryTimeZones", .signature = "\x00\x02\x0f\x11\x90\x35\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ucal_getDefaultTimeZone", MethodRecord{ .library = "icuin", .import = "ucal_getDefaultTimeZone", .signature = "\x00\x03\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucal_setDefaultTimeZone", MethodRecord{ .library = "icuin", .import = "ucal_setDefaultTimeZone", .signature = "\x00\x02\x01\x0f\x07\x0f\x11\x90\x19" } },
    .{ "ucal_getHostTimeZone", MethodRecord{ .library = "icu", .import = "ucal_getHostTimeZone", .signature = "\x00\x03\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucal_getDSTSavings", MethodRecord{ .library = "icuin", .import = "ucal_getDSTSavings", .signature = "\x00\x02\x08\x0f\x07\x0f\x11\x90\x19" } },
    .{ "ucal_getNow", MethodRecord{ .library = "icuin", .import = "ucal_getNow", .signature = "\x00\x00\x0d" } },
    .{ "ucal_open", MethodRecord{ .library = "icuin", .import = "ucal_open", .signature = "\x00\x05\x0f\x0f\x01\x0f\x07\x08\x11\x3d\x11\x91\x35\x0f\x11\x90\x19" } },
    .{ "ucal_close", MethodRecord{ .library = "icuin", .import = "ucal_close", .signature = "\x00\x01\x01\x0f\x0f\x01" } },
    .{ "ucal_clone", MethodRecord{ .library = "icuin", .import = "ucal_clone", .signature = "\x00\x02\x0f\x0f\x01\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ucal_setTimeZone", MethodRecord{ .library = "icuin", .import = "ucal_setTimeZone", .signature = "\x00\x04\x01\x0f\x0f\x01\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucal_getTimeZoneID", MethodRecord{ .library = "icuin", .import = "ucal_getTimeZoneID", .signature = "\x00\x04\x08\x0f\x0f\x01\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucal_getTimeZoneDisplayName", MethodRecord{ .library = "icuin", .import = "ucal_getTimeZoneDisplayName", .signature = "\x00\x06\x08\x0f\x0f\x01\x11\x91\x39\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucal_inDaylightTime", MethodRecord{ .library = "icuin", .import = "ucal_inDaylightTime", .signature = "\x00\x02\x04\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ucal_setGregorianChange", MethodRecord{ .library = "icuin", .import = "ucal_setGregorianChange", .signature = "\x00\x03\x01\x0f\x0f\x01\x0d\x0f\x11\x90\x19" } },
    .{ "ucal_getGregorianChange", MethodRecord{ .library = "icuin", .import = "ucal_getGregorianChange", .signature = "\x00\x02\x0d\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ucal_getAttribute", MethodRecord{ .library = "icuin", .import = "ucal_getAttribute", .signature = "\x00\x02\x08\x0f\x0f\x01\x11\x91\x3d" } },
    .{ "ucal_setAttribute", MethodRecord{ .library = "icuin", .import = "ucal_setAttribute", .signature = "\x00\x03\x01\x0f\x0f\x01\x11\x91\x3d\x08" } },
    .{ "ucal_getAvailable", MethodRecord{ .library = "icuin", .import = "ucal_getAvailable", .signature = "\x00\x01\x11\x3d\x08" } },
    .{ "ucal_countAvailable", MethodRecord{ .library = "icuin", .import = "ucal_countAvailable", .signature = "\x00\x00\x08" } },
    .{ "ucal_getMillis", MethodRecord{ .library = "icuin", .import = "ucal_getMillis", .signature = "\x00\x02\x0d\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ucal_setMillis", MethodRecord{ .library = "icuin", .import = "ucal_setMillis", .signature = "\x00\x03\x01\x0f\x0f\x01\x0d\x0f\x11\x90\x19" } },
    .{ "ucal_setDate", MethodRecord{ .library = "icuin", .import = "ucal_setDate", .signature = "\x00\x05\x01\x0f\x0f\x01\x08\x08\x08\x0f\x11\x90\x19" } },
    .{ "ucal_setDateTime", MethodRecord{ .library = "icuin", .import = "ucal_setDateTime", .signature = "\x00\x08\x01\x0f\x0f\x01\x08\x08\x08\x08\x08\x08\x0f\x11\x90\x19" } },
    .{ "ucal_equivalentTo", MethodRecord{ .library = "icuin", .import = "ucal_equivalentTo", .signature = "\x00\x02\x04\x0f\x0f\x01\x0f\x0f\x01" } },
    .{ "ucal_add", MethodRecord{ .library = "icuin", .import = "ucal_add", .signature = "\x00\x04\x01\x0f\x0f\x01\x11\x91\x41\x08\x0f\x11\x90\x19" } },
    .{ "ucal_roll", MethodRecord{ .library = "icuin", .import = "ucal_roll", .signature = "\x00\x04\x01\x0f\x0f\x01\x11\x91\x41\x08\x0f\x11\x90\x19" } },
    .{ "ucal_get", MethodRecord{ .library = "icuin", .import = "ucal_get", .signature = "\x00\x03\x08\x0f\x0f\x01\x11\x91\x41\x0f\x11\x90\x19" } },
    .{ "ucal_set", MethodRecord{ .library = "icuin", .import = "ucal_set", .signature = "\x00\x03\x01\x0f\x0f\x01\x11\x91\x41\x08" } },
    .{ "ucal_isSet", MethodRecord{ .library = "icuin", .import = "ucal_isSet", .signature = "\x00\x02\x04\x0f\x0f\x01\x11\x91\x41" } },
    .{ "ucal_clearField", MethodRecord{ .library = "icuin", .import = "ucal_clearField", .signature = "\x00\x02\x01\x0f\x0f\x01\x11\x91\x41" } },
    .{ "ucal_clear", MethodRecord{ .library = "icuin", .import = "ucal_clear", .signature = "\x00\x01\x01\x0f\x0f\x01" } },
    .{ "ucal_getLimit", MethodRecord{ .library = "icuin", .import = "ucal_getLimit", .signature = "\x00\x04\x08\x0f\x0f\x01\x11\x91\x41\x11\x91\x45\x0f\x11\x90\x19" } },
    .{ "ucal_getLocaleByType", MethodRecord{ .library = "icuin", .import = "ucal_getLocaleByType", .signature = "\x00\x03\x11\x3d\x0f\x0f\x01\x11\x90\x49\x0f\x11\x90\x19" } },
    .{ "ucal_getTZDataVersion", MethodRecord{ .library = "icuin", .import = "ucal_getTZDataVersion", .signature = "\x00\x01\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ucal_getCanonicalTimeZoneID", MethodRecord{ .library = "icuin", .import = "ucal_getCanonicalTimeZoneID", .signature = "\x00\x06\x08\x0f\x07\x08\x0f\x07\x08\x0f\x04\x0f\x11\x90\x19" } },
    .{ "ucal_getType", MethodRecord{ .library = "icuin", .import = "ucal_getType", .signature = "\x00\x02\x11\x3d\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ucal_getKeywordValuesForLocale", MethodRecord{ .library = "icuin", .import = "ucal_getKeywordValuesForLocale", .signature = "\x00\x04\x0f\x11\x90\x35\x11\x3d\x11\x3d\x04\x0f\x11\x90\x19" } },
    .{ "ucal_getDayOfWeekType", MethodRecord{ .library = "icuin", .import = "ucal_getDayOfWeekType", .signature = "\x00\x03\x11\x91\x49\x0f\x0f\x01\x11\x91\x4d\x0f\x11\x90\x19" } },
    .{ "ucal_getWeekendTransition", MethodRecord{ .library = "icuin", .import = "ucal_getWeekendTransition", .signature = "\x00\x03\x08\x0f\x0f\x01\x11\x91\x4d\x0f\x11\x90\x19" } },
    .{ "ucal_isWeekend", MethodRecord{ .library = "icuin", .import = "ucal_isWeekend", .signature = "\x00\x03\x04\x0f\x0f\x01\x0d\x0f\x11\x90\x19" } },
    .{ "ucal_getFieldDifference", MethodRecord{ .library = "icuin", .import = "ucal_getFieldDifference", .signature = "\x00\x04\x08\x0f\x0f\x01\x0d\x11\x91\x41\x0f\x11\x90\x19" } },
    .{ "ucal_getTimeZoneTransitionDate", MethodRecord{ .library = "icuin", .import = "ucal_getTimeZoneTransitionDate", .signature = "\x00\x04\x04\x0f\x0f\x01\x11\x91\x51\x0f\x0d\x0f\x11\x90\x19" } },
    .{ "ucal_getWindowsTimeZoneID", MethodRecord{ .library = "icuin", .import = "ucal_getWindowsTimeZoneID", .signature = "\x00\x05\x08\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucal_getTimeZoneIDForWindowsID", MethodRecord{ .library = "icuin", .import = "ucal_getTimeZoneIDForWindowsID", .signature = "\x00\x06\x08\x0f\x07\x08\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucal_getTimeZoneOffsetFromLocal", MethodRecord{ .library = "icu", .import = "ucal_getTimeZoneOffsetFromLocal", .signature = "\x00\x06\x01\x0f\x0f\x01\x11\x91\x55\x11\x91\x55\x0f\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ucol_open", MethodRecord{ .library = "icuin", .import = "ucol_open", .signature = "\x00\x02\x0f\x11\x91\x59\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ucol_openRules", MethodRecord{ .library = "icuin", .import = "ucol_openRules", .signature = "\x00\x06\x0f\x11\x91\x59\x0f\x07\x08\x11\x91\x5d\x11\x91\x5d\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "ucol_getContractionsAndExpansions", MethodRecord{ .library = "icuin", .import = "ucol_getContractionsAndExpansions", .signature = "\x00\x05\x01\x0f\x11\x91\x59\x0f\x11\x90\x9d\x0f\x11\x90\x9d\x04\x0f\x11\x90\x19" } },
    .{ "ucol_close", MethodRecord{ .library = "icuin", .import = "ucol_close", .signature = "\x00\x01\x01\x0f\x11\x91\x59" } },
    .{ "ucol_strcoll", MethodRecord{ .library = "icuin", .import = "ucol_strcoll", .signature = "\x00\x05\x11\x91\x61\x0f\x11\x91\x59\x0f\x07\x08\x0f\x07\x08" } },
    .{ "ucol_strcollUTF8", MethodRecord{ .library = "icuin", .import = "ucol_strcollUTF8", .signature = "\x00\x06\x11\x91\x61\x0f\x11\x91\x59\x11\x3d\x08\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "ucol_greater", MethodRecord{ .library = "icuin", .import = "ucol_greater", .signature = "\x00\x05\x04\x0f\x11\x91\x59\x0f\x07\x08\x0f\x07\x08" } },
    .{ "ucol_greaterOrEqual", MethodRecord{ .library = "icuin", .import = "ucol_greaterOrEqual", .signature = "\x00\x05\x04\x0f\x11\x91\x59\x0f\x07\x08\x0f\x07\x08" } },
    .{ "ucol_equal", MethodRecord{ .library = "icuin", .import = "ucol_equal", .signature = "\x00\x05\x04\x0f\x11\x91\x59\x0f\x07\x08\x0f\x07\x08" } },
    .{ "ucol_strcollIter", MethodRecord{ .library = "icuin", .import = "ucol_strcollIter", .signature = "\x00\x04\x11\x91\x61\x0f\x11\x91\x59\x0f\x11\x90\x31\x0f\x11\x90\x31\x0f\x11\x90\x19" } },
    .{ "ucol_getStrength", MethodRecord{ .library = "icuin", .import = "ucol_getStrength", .signature = "\x00\x01\x11\x91\x5d\x0f\x11\x91\x59" } },
    .{ "ucol_setStrength", MethodRecord{ .library = "icuin", .import = "ucol_setStrength", .signature = "\x00\x02\x01\x0f\x11\x91\x59\x11\x91\x5d" } },
    .{ "ucol_getReorderCodes", MethodRecord{ .library = "icuin", .import = "ucol_getReorderCodes", .signature = "\x00\x04\x08\x0f\x11\x91\x59\x0f\x08\x08\x0f\x11\x90\x19" } },
    .{ "ucol_setReorderCodes", MethodRecord{ .library = "icuin", .import = "ucol_setReorderCodes", .signature = "\x00\x04\x01\x0f\x11\x91\x59\x0f\x08\x08\x0f\x11\x90\x19" } },
    .{ "ucol_getEquivalentReorderCodes", MethodRecord{ .library = "icuin", .import = "ucol_getEquivalentReorderCodes", .signature = "\x00\x04\x08\x08\x0f\x08\x08\x0f\x11\x90\x19" } },
    .{ "ucol_getDisplayName", MethodRecord{ .library = "icuin", .import = "ucol_getDisplayName", .signature = "\x00\x05\x08\x11\x3d\x11\x3d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucol_getAvailable", MethodRecord{ .library = "icuin", .import = "ucol_getAvailable", .signature = "\x00\x01\x11\x3d\x08" } },
    .{ "ucol_countAvailable", MethodRecord{ .library = "icuin", .import = "ucol_countAvailable", .signature = "\x00\x00\x08" } },
    .{ "ucol_openAvailableLocales", MethodRecord{ .library = "icuin", .import = "ucol_openAvailableLocales", .signature = "\x00\x01\x0f\x11\x90\x35\x0f\x11\x90\x19" } },
    .{ "ucol_getKeywords", MethodRecord{ .library = "icuin", .import = "ucol_getKeywords", .signature = "\x00\x01\x0f\x11\x90\x35\x0f\x11\x90\x19" } },
    .{ "ucol_getKeywordValues", MethodRecord{ .library = "icuin", .import = "ucol_getKeywordValues", .signature = "\x00\x02\x0f\x11\x90\x35\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ucol_getKeywordValuesForLocale", MethodRecord{ .library = "icuin", .import = "ucol_getKeywordValuesForLocale", .signature = "\x00\x04\x0f\x11\x90\x35\x11\x3d\x11\x3d\x04\x0f\x11\x90\x19" } },
    .{ "ucol_getFunctionalEquivalent", MethodRecord{ .library = "icuin", .import = "ucol_getFunctionalEquivalent", .signature = "\x00\x06\x08\x11\x3d\x08\x11\x3d\x11\x3d\x0f\x04\x0f\x11\x90\x19" } },
    .{ "ucol_getRules", MethodRecord{ .library = "icuin", .import = "ucol_getRules", .signature = "\x00\x02\x0f\x07\x0f\x11\x91\x59\x0f\x08" } },
    .{ "ucol_getSortKey", MethodRecord{ .library = "icuin", .import = "ucol_getSortKey", .signature = "\x00\x05\x08\x0f\x11\x91\x59\x0f\x07\x08\x0f\x05\x08" } },
    .{ "ucol_nextSortKeyPart", MethodRecord{ .library = "icuin", .import = "ucol_nextSortKeyPart", .signature = "\x00\x06\x08\x0f\x11\x91\x59\x0f\x11\x90\x31\x0f\x09\x0f\x05\x08\x0f\x11\x90\x19" } },
    .{ "ucol_getBound", MethodRecord{ .library = "icuin", .import = "ucol_getBound", .signature = "\x00\x07\x08\x0f\x05\x08\x11\x91\x65\x09\x0f\x05\x08\x0f\x11\x90\x19" } },
    .{ "ucol_getVersion", MethodRecord{ .library = "icuin", .import = "ucol_getVersion", .signature = "\x00\x02\x01\x0f\x11\x91\x59\x0f\x05" } },
    .{ "ucol_getUCAVersion", MethodRecord{ .library = "icuin", .import = "ucol_getUCAVersion", .signature = "\x00\x02\x01\x0f\x11\x91\x59\x0f\x05" } },
    .{ "ucol_mergeSortkeys", MethodRecord{ .library = "icuin", .import = "ucol_mergeSortkeys", .signature = "\x00\x06\x08\x0f\x05\x08\x0f\x05\x08\x0f\x05\x08" } },
    .{ "ucol_setAttribute", MethodRecord{ .library = "icuin", .import = "ucol_setAttribute", .signature = "\x00\x04\x01\x0f\x11\x91\x59\x11\x91\x69\x11\x91\x5d\x0f\x11\x90\x19" } },
    .{ "ucol_getAttribute", MethodRecord{ .library = "icuin", .import = "ucol_getAttribute", .signature = "\x00\x03\x11\x91\x5d\x0f\x11\x91\x59\x11\x91\x69\x0f\x11\x90\x19" } },
    .{ "ucol_setMaxVariable", MethodRecord{ .library = "icuin", .import = "ucol_setMaxVariable", .signature = "\x00\x03\x01\x0f\x11\x91\x59\x11\x91\x6d\x0f\x11\x90\x19" } },
    .{ "ucol_getMaxVariable", MethodRecord{ .library = "icuin", .import = "ucol_getMaxVariable", .signature = "\x00\x01\x11\x91\x6d\x0f\x11\x91\x59" } },
    .{ "ucol_getVariableTop", MethodRecord{ .library = "icuin", .import = "ucol_getVariableTop", .signature = "\x00\x02\x09\x0f\x11\x91\x59\x0f\x11\x90\x19" } },
    .{ "ucol_safeClone", MethodRecord{ .library = "icuin", .import = "ucol_safeClone", .signature = "\x00\x04\x0f\x11\x91\x59\x0f\x11\x91\x59\x0f\x01\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ucol_clone", MethodRecord{ .library = "icu", .import = "ucol_clone", .signature = "\x00\x02\x0f\x11\x91\x59\x0f\x11\x91\x59\x0f\x11\x90\x19" } },
    .{ "ucol_getRulesEx", MethodRecord{ .library = "icuin", .import = "ucol_getRulesEx", .signature = "\x00\x04\x08\x0f\x11\x91\x59\x11\x91\x71\x0f\x07\x08" } },
    .{ "ucol_getLocaleByType", MethodRecord{ .library = "icuin", .import = "ucol_getLocaleByType", .signature = "\x00\x03\x11\x3d\x0f\x11\x91\x59\x11\x90\x49\x0f\x11\x90\x19" } },
    .{ "ucol_getTailoredSet", MethodRecord{ .library = "icuin", .import = "ucol_getTailoredSet", .signature = "\x00\x02\x0f\x11\x90\x9d\x0f\x11\x91\x59\x0f\x11\x90\x19" } },
    .{ "ucol_cloneBinary", MethodRecord{ .library = "icuin", .import = "ucol_cloneBinary", .signature = "\x00\x04\x08\x0f\x11\x91\x59\x0f\x05\x08\x0f\x11\x90\x19" } },
    .{ "ucol_openBinary", MethodRecord{ .library = "icuin", .import = "ucol_openBinary", .signature = "\x00\x04\x0f\x11\x91\x59\x0f\x05\x08\x0f\x11\x91\x59\x0f\x11\x90\x19" } },
    .{ "ucol_openElements", MethodRecord{ .library = "icuin", .import = "ucol_openElements", .signature = "\x00\x04\x0f\x11\x91\x75\x0f\x11\x91\x59\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucol_keyHashCode", MethodRecord{ .library = "icuin", .import = "ucol_keyHashCode", .signature = "\x00\x02\x08\x0f\x05\x08" } },
    .{ "ucol_closeElements", MethodRecord{ .library = "icuin", .import = "ucol_closeElements", .signature = "\x00\x01\x01\x0f\x11\x91\x75" } },
    .{ "ucol_reset", MethodRecord{ .library = "icuin", .import = "ucol_reset", .signature = "\x00\x01\x01\x0f\x11\x91\x75" } },
    .{ "ucol_next", MethodRecord{ .library = "icuin", .import = "ucol_next", .signature = "\x00\x02\x08\x0f\x11\x91\x75\x0f\x11\x90\x19" } },
    .{ "ucol_previous", MethodRecord{ .library = "icuin", .import = "ucol_previous", .signature = "\x00\x02\x08\x0f\x11\x91\x75\x0f\x11\x90\x19" } },
    .{ "ucol_getMaxExpansion", MethodRecord{ .library = "icuin", .import = "ucol_getMaxExpansion", .signature = "\x00\x02\x08\x0f\x11\x91\x75\x08" } },
    .{ "ucol_setText", MethodRecord{ .library = "icuin", .import = "ucol_setText", .signature = "\x00\x04\x01\x0f\x11\x91\x75\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucol_getOffset", MethodRecord{ .library = "icuin", .import = "ucol_getOffset", .signature = "\x00\x01\x08\x0f\x11\x91\x75" } },
    .{ "ucol_setOffset", MethodRecord{ .library = "icuin", .import = "ucol_setOffset", .signature = "\x00\x03\x01\x0f\x11\x91\x75\x08\x0f\x11\x90\x19" } },
    .{ "ucol_primaryOrder", MethodRecord{ .library = "icuin", .import = "ucol_primaryOrder", .signature = "\x00\x01\x08\x08" } },
    .{ "ucol_secondaryOrder", MethodRecord{ .library = "icuin", .import = "ucol_secondaryOrder", .signature = "\x00\x01\x08\x08" } },
    .{ "ucol_tertiaryOrder", MethodRecord{ .library = "icuin", .import = "ucol_tertiaryOrder", .signature = "\x00\x01\x08\x08" } },
    .{ "ucsdet_open", MethodRecord{ .library = "icuin", .import = "ucsdet_open", .signature = "\x00\x01\x0f\x11\x91\x79\x0f\x11\x90\x19" } },
    .{ "ucsdet_close", MethodRecord{ .library = "icuin", .import = "ucsdet_close", .signature = "\x00\x01\x01\x0f\x11\x91\x79" } },
    .{ "ucsdet_setText", MethodRecord{ .library = "icuin", .import = "ucsdet_setText", .signature = "\x00\x04\x01\x0f\x11\x91\x79\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "ucsdet_setDeclaredEncoding", MethodRecord{ .library = "icuin", .import = "ucsdet_setDeclaredEncoding", .signature = "\x00\x04\x01\x0f\x11\x91\x79\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "ucsdet_detect", MethodRecord{ .library = "icuin", .import = "ucsdet_detect", .signature = "\x00\x02\x0f\x11\x91\x7d\x0f\x11\x91\x79\x0f\x11\x90\x19" } },
    .{ "ucsdet_detectAll", MethodRecord{ .library = "icuin", .import = "ucsdet_detectAll", .signature = "\x00\x03\x0f\x0f\x11\x91\x7d\x0f\x11\x91\x79\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ucsdet_getName", MethodRecord{ .library = "icuin", .import = "ucsdet_getName", .signature = "\x00\x02\x11\x3d\x0f\x11\x91\x7d\x0f\x11\x90\x19" } },
    .{ "ucsdet_getConfidence", MethodRecord{ .library = "icuin", .import = "ucsdet_getConfidence", .signature = "\x00\x02\x08\x0f\x11\x91\x7d\x0f\x11\x90\x19" } },
    .{ "ucsdet_getLanguage", MethodRecord{ .library = "icuin", .import = "ucsdet_getLanguage", .signature = "\x00\x02\x11\x3d\x0f\x11\x91\x7d\x0f\x11\x90\x19" } },
    .{ "ucsdet_getUChars", MethodRecord{ .library = "icuin", .import = "ucsdet_getUChars", .signature = "\x00\x04\x08\x0f\x11\x91\x7d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ucsdet_getAllDetectableCharsets", MethodRecord{ .library = "icuin", .import = "ucsdet_getAllDetectableCharsets", .signature = "\x00\x02\x0f\x11\x90\x35\x0f\x11\x91\x79\x0f\x11\x90\x19" } },
    .{ "ucsdet_isInputFilterEnabled", MethodRecord{ .library = "icuin", .import = "ucsdet_isInputFilterEnabled", .signature = "\x00\x01\x04\x0f\x11\x91\x79" } },
    .{ "ucsdet_enableInputFilter", MethodRecord{ .library = "icuin", .import = "ucsdet_enableInputFilter", .signature = "\x00\x02\x04\x0f\x11\x91\x79\x04" } },
    .{ "ufieldpositer_open", MethodRecord{ .library = "icuin", .import = "ufieldpositer_open", .signature = "\x00\x01\x0f\x11\x91\x81\x0f\x11\x90\x19" } },
    .{ "ufieldpositer_close", MethodRecord{ .library = "icuin", .import = "ufieldpositer_close", .signature = "\x00\x01\x01\x0f\x11\x91\x81" } },
    .{ "ufieldpositer_next", MethodRecord{ .library = "icuin", .import = "ufieldpositer_next", .signature = "\x00\x03\x08\x0f\x11\x91\x81\x0f\x08\x0f\x08" } },
    .{ "ufmt_open", MethodRecord{ .library = "icuin", .import = "ufmt_open", .signature = "\x00\x01\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ufmt_close", MethodRecord{ .library = "icuin", .import = "ufmt_close", .signature = "\x00\x01\x01\x0f\x0f\x01" } },
    .{ "ufmt_getType", MethodRecord{ .library = "icuin", .import = "ufmt_getType", .signature = "\x00\x02\x11\x91\x85\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ufmt_isNumeric", MethodRecord{ .library = "icuin", .import = "ufmt_isNumeric", .signature = "\x00\x01\x04\x0f\x0f\x01" } },
    .{ "ufmt_getDate", MethodRecord{ .library = "icuin", .import = "ufmt_getDate", .signature = "\x00\x02\x0d\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ufmt_getDouble", MethodRecord{ .library = "icuin", .import = "ufmt_getDouble", .signature = "\x00\x02\x0d\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ufmt_getLong", MethodRecord{ .library = "icuin", .import = "ufmt_getLong", .signature = "\x00\x02\x08\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ufmt_getInt64", MethodRecord{ .library = "icuin", .import = "ufmt_getInt64", .signature = "\x00\x02\x0a\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ufmt_getObject", MethodRecord{ .library = "icuin", .import = "ufmt_getObject", .signature = "\x00\x02\x0f\x01\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ufmt_getUChars", MethodRecord{ .library = "icuin", .import = "ufmt_getUChars", .signature = "\x00\x03\x0f\x07\x0f\x0f\x01\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ufmt_getArrayLength", MethodRecord{ .library = "icuin", .import = "ufmt_getArrayLength", .signature = "\x00\x02\x08\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "ufmt_getArrayItemByIndex", MethodRecord{ .library = "icuin", .import = "ufmt_getArrayItemByIndex", .signature = "\x00\x03\x0f\x0f\x01\x0f\x0f\x01\x08\x0f\x11\x90\x19" } },
    .{ "ufmt_getDecNumChars", MethodRecord{ .library = "icuin", .import = "ufmt_getDecNumChars", .signature = "\x00\x03\x11\x3d\x0f\x0f\x01\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ucfpos_open", MethodRecord{ .library = "icu", .import = "ucfpos_open", .signature = "\x00\x01\x0f\x11\x91\x89\x0f\x11\x90\x19" } },
    .{ "ucfpos_reset", MethodRecord{ .library = "icu", .import = "ucfpos_reset", .signature = "\x00\x02\x01\x0f\x11\x91\x89\x0f\x11\x90\x19" } },
    .{ "ucfpos_close", MethodRecord{ .library = "icu", .import = "ucfpos_close", .signature = "\x00\x01\x01\x0f\x11\x91\x89" } },
    .{ "ucfpos_constrainCategory", MethodRecord{ .library = "icu", .import = "ucfpos_constrainCategory", .signature = "\x00\x03\x01\x0f\x11\x91\x89\x08\x0f\x11\x90\x19" } },
    .{ "ucfpos_constrainField", MethodRecord{ .library = "icu", .import = "ucfpos_constrainField", .signature = "\x00\x04\x01\x0f\x11\x91\x89\x08\x08\x0f\x11\x90\x19" } },
    .{ "ucfpos_getCategory", MethodRecord{ .library = "icu", .import = "ucfpos_getCategory", .signature = "\x00\x02\x08\x0f\x11\x91\x89\x0f\x11\x90\x19" } },
    .{ "ucfpos_getField", MethodRecord{ .library = "icu", .import = "ucfpos_getField", .signature = "\x00\x02\x08\x0f\x11\x91\x89\x0f\x11\x90\x19" } },
    .{ "ucfpos_getIndexes", MethodRecord{ .library = "icu", .import = "ucfpos_getIndexes", .signature = "\x00\x04\x01\x0f\x11\x91\x89\x0f\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ucfpos_getInt64IterationContext", MethodRecord{ .library = "icu", .import = "ucfpos_getInt64IterationContext", .signature = "\x00\x02\x0a\x0f\x11\x91\x89\x0f\x11\x90\x19" } },
    .{ "ucfpos_setInt64IterationContext", MethodRecord{ .library = "icu", .import = "ucfpos_setInt64IterationContext", .signature = "\x00\x03\x01\x0f\x11\x91\x89\x0a\x0f\x11\x90\x19" } },
    .{ "ucfpos_matchesField", MethodRecord{ .library = "icu", .import = "ucfpos_matchesField", .signature = "\x00\x04\x04\x0f\x11\x91\x89\x08\x08\x0f\x11\x90\x19" } },
    .{ "ucfpos_setState", MethodRecord{ .library = "icu", .import = "ucfpos_setState", .signature = "\x00\x06\x01\x0f\x11\x91\x89\x08\x08\x08\x08\x0f\x11\x90\x19" } },
    .{ "ufmtval_getString", MethodRecord{ .library = "icu", .import = "ufmtval_getString", .signature = "\x00\x03\x0f\x07\x0f\x11\x91\x8d\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ufmtval_nextPosition", MethodRecord{ .library = "icu", .import = "ufmtval_nextPosition", .signature = "\x00\x03\x04\x0f\x11\x91\x8d\x0f\x11\x91\x89\x0f\x11\x90\x19" } },
    .{ "udtitvfmt_open", MethodRecord{ .library = "icuin", .import = "udtitvfmt_open", .signature = "\x00\x06\x0f\x11\x91\x91\x11\x3d\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "udtitvfmt_close", MethodRecord{ .library = "icuin", .import = "udtitvfmt_close", .signature = "\x00\x01\x01\x0f\x11\x91\x91" } },
    .{ "udtitvfmt_openResult", MethodRecord{ .library = "icu", .import = "udtitvfmt_openResult", .signature = "\x00\x01\x0f\x11\x91\x95\x0f\x11\x90\x19" } },
    .{ "udtitvfmt_resultAsValue", MethodRecord{ .library = "icu", .import = "udtitvfmt_resultAsValue", .signature = "\x00\x02\x0f\x11\x91\x8d\x0f\x11\x91\x95\x0f\x11\x90\x19" } },
    .{ "udtitvfmt_closeResult", MethodRecord{ .library = "icu", .import = "udtitvfmt_closeResult", .signature = "\x00\x01\x01\x0f\x11\x91\x95" } },
    .{ "udtitvfmt_format", MethodRecord{ .library = "icuin", .import = "udtitvfmt_format", .signature = "\x00\x07\x08\x0f\x11\x91\x91\x0d\x0d\x0f\x07\x08\x0f\x11\x91\x99\x0f\x11\x90\x19" } },
    .{ "udtitvfmt_formatToResult", MethodRecord{ .library = "icu", .import = "udtitvfmt_formatToResult", .signature = "\x00\x05\x01\x0f\x11\x91\x91\x0d\x0d\x0f\x11\x91\x95\x0f\x11\x90\x19" } },
    .{ "udtitvfmt_setContext", MethodRecord{ .library = "icu", .import = "udtitvfmt_setContext", .signature = "\x00\x03\x01\x0f\x11\x91\x91\x11\x90\x59\x0f\x11\x90\x19" } },
    .{ "udtitvfmt_getContext", MethodRecord{ .library = "icu", .import = "udtitvfmt_getContext", .signature = "\x00\x03\x11\x90\x59\x0f\x11\x91\x91\x11\x90\x5d\x0f\x11\x90\x19" } },
    .{ "ugender_getInstance", MethodRecord{ .library = "icuin", .import = "ugender_getInstance", .signature = "\x00\x02\x0f\x11\x91\x9d\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ugender_getListGender", MethodRecord{ .library = "icuin", .import = "ugender_getListGender", .signature = "\x00\x04\x11\x91\xa1\x0f\x11\x91\x9d\x0f\x11\x91\xa1\x08\x0f\x11\x90\x19" } },
    .{ "ulistfmt_open", MethodRecord{ .library = "icuuc", .import = "ulistfmt_open", .signature = "\x00\x02\x0f\x11\x91\xa5\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ulistfmt_openForType", MethodRecord{ .library = "icu", .import = "ulistfmt_openForType", .signature = "\x00\x04\x0f\x11\x91\xa5\x11\x3d\x11\x91\xa9\x11\x91\xad\x0f\x11\x90\x19" } },
    .{ "ulistfmt_close", MethodRecord{ .library = "icuuc", .import = "ulistfmt_close", .signature = "\x00\x01\x01\x0f\x11\x91\xa5" } },
    .{ "ulistfmt_openResult", MethodRecord{ .library = "icu", .import = "ulistfmt_openResult", .signature = "\x00\x01\x0f\x11\x91\xb1\x0f\x11\x90\x19" } },
    .{ "ulistfmt_resultAsValue", MethodRecord{ .library = "icu", .import = "ulistfmt_resultAsValue", .signature = "\x00\x02\x0f\x11\x91\x8d\x0f\x11\x91\xb1\x0f\x11\x90\x19" } },
    .{ "ulistfmt_closeResult", MethodRecord{ .library = "icu", .import = "ulistfmt_closeResult", .signature = "\x00\x01\x01\x0f\x11\x91\xb1" } },
    .{ "ulistfmt_format", MethodRecord{ .library = "icuuc", .import = "ulistfmt_format", .signature = "\x00\x07\x08\x0f\x11\x91\xa5\x0f\x0f\x07\x0f\x08\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ulistfmt_formatStringsToResult", MethodRecord{ .library = "icu", .import = "ulistfmt_formatStringsToResult", .signature = "\x00\x06\x01\x0f\x11\x91\xa5\x0f\x0f\x07\x0f\x08\x08\x0f\x11\x91\xb1\x0f\x11\x90\x19" } },
    .{ "ulocdata_open", MethodRecord{ .library = "icuin", .import = "ulocdata_open", .signature = "\x00\x02\x0f\x11\x91\xb5\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ulocdata_close", MethodRecord{ .library = "icuin", .import = "ulocdata_close", .signature = "\x00\x01\x01\x0f\x11\x91\xb5" } },
    .{ "ulocdata_setNoSubstitute", MethodRecord{ .library = "icuin", .import = "ulocdata_setNoSubstitute", .signature = "\x00\x02\x01\x0f\x11\x91\xb5\x04" } },
    .{ "ulocdata_getNoSubstitute", MethodRecord{ .library = "icuin", .import = "ulocdata_getNoSubstitute", .signature = "\x00\x01\x04\x0f\x11\x91\xb5" } },
    .{ "ulocdata_getExemplarSet", MethodRecord{ .library = "icuin", .import = "ulocdata_getExemplarSet", .signature = "\x00\x05\x0f\x11\x90\x9d\x0f\x11\x91\xb5\x0f\x11\x90\x9d\x09\x11\x91\xb9\x0f\x11\x90\x19" } },
    .{ "ulocdata_getDelimiter", MethodRecord{ .library = "icuin", .import = "ulocdata_getDelimiter", .signature = "\x00\x05\x08\x0f\x11\x91\xb5\x11\x91\xbd\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ulocdata_getMeasurementSystem", MethodRecord{ .library = "icuin", .import = "ulocdata_getMeasurementSystem", .signature = "\x00\x02\x11\x91\xc1\x11\x3d\x0f\x11\x90\x19" } },
    .{ "ulocdata_getPaperSize", MethodRecord{ .library = "icuin", .import = "ulocdata_getPaperSize", .signature = "\x00\x04\x01\x11\x3d\x0f\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "ulocdata_getCLDRVersion", MethodRecord{ .library = "icuin", .import = "ulocdata_getCLDRVersion", .signature = "\x00\x02\x01\x0f\x05\x0f\x11\x90\x19" } },
    .{ "ulocdata_getLocaleDisplayPattern", MethodRecord{ .library = "icuin", .import = "ulocdata_getLocaleDisplayPattern", .signature = "\x00\x04\x08\x0f\x11\x91\xb5\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ulocdata_getLocaleSeparator", MethodRecord{ .library = "icuin", .import = "ulocdata_getLocaleSeparator", .signature = "\x00\x04\x08\x0f\x11\x91\xb5\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "u_formatMessage", MethodRecord{ .library = "icuin", .import = "u_formatMessage", .signature = "\x05\x06\x08\x11\x3d\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "u_vformatMessage", MethodRecord{ .library = "icuin", .import = "u_vformatMessage", .signature = "\x00\x07\x08\x11\x3d\x0f\x07\x08\x0f\x07\x08\x0f\x04\x0f\x11\x90\x19" } },
    .{ "u_parseMessage", MethodRecord{ .library = "icuin", .import = "u_parseMessage", .signature = "\x05\x06\x01\x11\x3d\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "u_vparseMessage", MethodRecord{ .library = "icuin", .import = "u_vparseMessage", .signature = "\x00\x07\x01\x11\x3d\x0f\x07\x08\x0f\x07\x08\x0f\x04\x0f\x11\x90\x19" } },
    .{ "u_formatMessageWithError", MethodRecord{ .library = "icuin", .import = "u_formatMessageWithError", .signature = "\x05\x07\x08\x11\x3d\x0f\x07\x08\x0f\x07\x08\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "u_vformatMessageWithError", MethodRecord{ .library = "icuin", .import = "u_vformatMessageWithError", .signature = "\x00\x08\x08\x11\x3d\x0f\x07\x08\x0f\x07\x08\x0f\x11\x91\x21\x0f\x04\x0f\x11\x90\x19" } },
    .{ "u_parseMessageWithError", MethodRecord{ .library = "icuin", .import = "u_parseMessageWithError", .signature = "\x05\x07\x01\x11\x3d\x0f\x07\x08\x0f\x07\x08\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "u_vparseMessageWithError", MethodRecord{ .library = "icuin", .import = "u_vparseMessageWithError", .signature = "\x00\x08\x01\x11\x3d\x0f\x07\x08\x0f\x07\x08\x0f\x04\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "umsg_open", MethodRecord{ .library = "icuin", .import = "umsg_open", .signature = "\x00\x05\x0f\x0f\x01\x0f\x07\x08\x11\x3d\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "umsg_close", MethodRecord{ .library = "icuin", .import = "umsg_close", .signature = "\x00\x01\x01\x0f\x0f\x01" } },
    .{ "umsg_clone", MethodRecord{ .library = "icuin", .import = "umsg_clone", .signature = "\x00\x02\x0f\x01\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "umsg_setLocale", MethodRecord{ .library = "icuin", .import = "umsg_setLocale", .signature = "\x00\x02\x01\x0f\x0f\x01\x11\x3d" } },
    .{ "umsg_getLocale", MethodRecord{ .library = "icuin", .import = "umsg_getLocale", .signature = "\x00\x01\x11\x3d\x0f\x0f\x01" } },
    .{ "umsg_applyPattern", MethodRecord{ .library = "icuin", .import = "umsg_applyPattern", .signature = "\x00\x05\x01\x0f\x0f\x01\x0f\x07\x08\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "umsg_toPattern", MethodRecord{ .library = "icuin", .import = "umsg_toPattern", .signature = "\x00\x04\x08\x0f\x0f\x01\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "umsg_format", MethodRecord{ .library = "icuin", .import = "umsg_format", .signature = "\x05\x04\x08\x0f\x0f\x01\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "umsg_vformat", MethodRecord{ .library = "icuin", .import = "umsg_vformat", .signature = "\x00\x05\x08\x0f\x0f\x01\x0f\x07\x08\x0f\x04\x0f\x11\x90\x19" } },
    .{ "umsg_parse", MethodRecord{ .library = "icuin", .import = "umsg_parse", .signature = "\x05\x05\x01\x0f\x0f\x01\x0f\x07\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "umsg_vparse", MethodRecord{ .library = "icuin", .import = "umsg_vparse", .signature = "\x00\x06\x01\x0f\x0f\x01\x0f\x07\x08\x0f\x08\x0f\x04\x0f\x11\x90\x19" } },
    .{ "umsg_autoQuoteApostrophe", MethodRecord{ .library = "icuin", .import = "umsg_autoQuoteApostrophe", .signature = "\x00\x05\x08\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unum_open", MethodRecord{ .library = "icuin", .import = "unum_open", .signature = "\x00\x06\x0f\x0f\x01\x11\x91\xc5\x0f\x07\x08\x11\x3d\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "unum_close", MethodRecord{ .library = "icuin", .import = "unum_close", .signature = "\x00\x01\x01\x0f\x0f\x01" } },
    .{ "unum_clone", MethodRecord{ .library = "icuin", .import = "unum_clone", .signature = "\x00\x02\x0f\x0f\x01\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "unum_format", MethodRecord{ .library = "icuin", .import = "unum_format", .signature = "\x00\x06\x08\x0f\x0f\x01\x08\x0f\x07\x08\x0f\x11\x91\x99\x0f\x11\x90\x19" } },
    .{ "unum_formatInt64", MethodRecord{ .library = "icuin", .import = "unum_formatInt64", .signature = "\x00\x06\x08\x0f\x0f\x01\x0a\x0f\x07\x08\x0f\x11\x91\x99\x0f\x11\x90\x19" } },
    .{ "unum_formatDouble", MethodRecord{ .library = "icuin", .import = "unum_formatDouble", .signature = "\x00\x06\x08\x0f\x0f\x01\x0d\x0f\x07\x08\x0f\x11\x91\x99\x0f\x11\x90\x19" } },
    .{ "unum_formatDoubleForFields", MethodRecord{ .library = "icuin", .import = "unum_formatDoubleForFields", .signature = "\x00\x06\x08\x0f\x0f\x01\x0d\x0f\x07\x08\x0f\x11\x91\x81\x0f\x11\x90\x19" } },
    .{ "unum_formatDecimal", MethodRecord{ .library = "icuin", .import = "unum_formatDecimal", .signature = "\x00\x07\x08\x0f\x0f\x01\x11\x3d\x08\x0f\x07\x08\x0f\x11\x91\x99\x0f\x11\x90\x19" } },
    .{ "unum_formatDoubleCurrency", MethodRecord{ .library = "icuin", .import = "unum_formatDoubleCurrency", .signature = "\x00\x07\x08\x0f\x0f\x01\x0d\x0f\x07\x0f\x07\x08\x0f\x11\x91\x99\x0f\x11\x90\x19" } },
    .{ "unum_formatUFormattable", MethodRecord{ .library = "icuin", .import = "unum_formatUFormattable", .signature = "\x00\x06\x08\x0f\x0f\x01\x0f\x0f\x01\x0f\x07\x08\x0f\x11\x91\x99\x0f\x11\x90\x19" } },
    .{ "unum_parse", MethodRecord{ .library = "icuin", .import = "unum_parse", .signature = "\x00\x05\x08\x0f\x0f\x01\x0f\x07\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "unum_parseInt64", MethodRecord{ .library = "icuin", .import = "unum_parseInt64", .signature = "\x00\x05\x0a\x0f\x0f\x01\x0f\x07\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "unum_parseDouble", MethodRecord{ .library = "icuin", .import = "unum_parseDouble", .signature = "\x00\x05\x0d\x0f\x0f\x01\x0f\x07\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "unum_parseDecimal", MethodRecord{ .library = "icuin", .import = "unum_parseDecimal", .signature = "\x00\x07\x08\x0f\x0f\x01\x0f\x07\x08\x0f\x08\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "unum_parseDoubleCurrency", MethodRecord{ .library = "icuin", .import = "unum_parseDoubleCurrency", .signature = "\x00\x06\x0d\x0f\x0f\x01\x0f\x07\x08\x0f\x08\x0f\x07\x0f\x11\x90\x19" } },
    .{ "unum_parseToUFormattable", MethodRecord{ .library = "icuin", .import = "unum_parseToUFormattable", .signature = "\x00\x06\x0f\x0f\x01\x0f\x0f\x01\x0f\x0f\x01\x0f\x07\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "unum_applyPattern", MethodRecord{ .library = "icuin", .import = "unum_applyPattern", .signature = "\x00\x06\x01\x0f\x0f\x01\x04\x0f\x07\x08\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "unum_getAvailable", MethodRecord{ .library = "icuin", .import = "unum_getAvailable", .signature = "\x00\x01\x11\x3d\x08" } },
    .{ "unum_countAvailable", MethodRecord{ .library = "icuin", .import = "unum_countAvailable", .signature = "\x00\x00\x08" } },
    .{ "unum_getAttribute", MethodRecord{ .library = "icuin", .import = "unum_getAttribute", .signature = "\x00\x02\x08\x0f\x0f\x01\x11\x91\xc9" } },
    .{ "unum_setAttribute", MethodRecord{ .library = "icuin", .import = "unum_setAttribute", .signature = "\x00\x03\x01\x0f\x0f\x01\x11\x91\xc9\x08" } },
    .{ "unum_getDoubleAttribute", MethodRecord{ .library = "icuin", .import = "unum_getDoubleAttribute", .signature = "\x00\x02\x0d\x0f\x0f\x01\x11\x91\xc9" } },
    .{ "unum_setDoubleAttribute", MethodRecord{ .library = "icuin", .import = "unum_setDoubleAttribute", .signature = "\x00\x03\x01\x0f\x0f\x01\x11\x91\xc9\x0d" } },
    .{ "unum_getTextAttribute", MethodRecord{ .library = "icuin", .import = "unum_getTextAttribute", .signature = "\x00\x05\x08\x0f\x0f\x01\x11\x91\xcd\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unum_setTextAttribute", MethodRecord{ .library = "icuin", .import = "unum_setTextAttribute", .signature = "\x00\x05\x01\x0f\x0f\x01\x11\x91\xcd\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unum_toPattern", MethodRecord{ .library = "icuin", .import = "unum_toPattern", .signature = "\x00\x05\x08\x0f\x0f\x01\x04\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unum_getSymbol", MethodRecord{ .library = "icuin", .import = "unum_getSymbol", .signature = "\x00\x05\x08\x0f\x0f\x01\x11\x91\xd1\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unum_setSymbol", MethodRecord{ .library = "icuin", .import = "unum_setSymbol", .signature = "\x00\x05\x01\x0f\x0f\x01\x11\x91\xd1\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unum_getLocaleByType", MethodRecord{ .library = "icuin", .import = "unum_getLocaleByType", .signature = "\x00\x03\x11\x3d\x0f\x0f\x01\x11\x90\x49\x0f\x11\x90\x19" } },
    .{ "unum_setContext", MethodRecord{ .library = "icuin", .import = "unum_setContext", .signature = "\x00\x03\x01\x0f\x0f\x01\x11\x90\x59\x0f\x11\x90\x19" } },
    .{ "unum_getContext", MethodRecord{ .library = "icuin", .import = "unum_getContext", .signature = "\x00\x03\x11\x90\x59\x0f\x0f\x01\x11\x90\x5d\x0f\x11\x90\x19" } },
    .{ "udat_toCalendarDateField", MethodRecord{ .library = "icuin", .import = "udat_toCalendarDateField", .signature = "\x00\x01\x11\x91\x41\x11\x91\xd5" } },
    .{ "udat_open", MethodRecord{ .library = "icuin", .import = "udat_open", .signature = "\x00\x08\x0f\x0f\x01\x11\x91\xd9\x11\x91\xd9\x11\x3d\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "udat_close", MethodRecord{ .library = "icuin", .import = "udat_close", .signature = "\x00\x01\x01\x0f\x0f\x01" } },
    .{ "udat_getBooleanAttribute", MethodRecord{ .library = "icuin", .import = "udat_getBooleanAttribute", .signature = "\x00\x03\x04\x0f\x0f\x01\x11\x91\xdd\x0f\x11\x90\x19" } },
    .{ "udat_setBooleanAttribute", MethodRecord{ .library = "icuin", .import = "udat_setBooleanAttribute", .signature = "\x00\x04\x01\x0f\x0f\x01\x11\x91\xdd\x04\x0f\x11\x90\x19" } },
    .{ "udat_clone", MethodRecord{ .library = "icuin", .import = "udat_clone", .signature = "\x00\x02\x0f\x0f\x01\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "udat_format", MethodRecord{ .library = "icuin", .import = "udat_format", .signature = "\x00\x06\x08\x0f\x0f\x01\x0d\x0f\x07\x08\x0f\x11\x91\x99\x0f\x11\x90\x19" } },
    .{ "udat_formatCalendar", MethodRecord{ .library = "icuin", .import = "udat_formatCalendar", .signature = "\x00\x06\x08\x0f\x0f\x01\x0f\x0f\x01\x0f\x07\x08\x0f\x11\x91\x99\x0f\x11\x90\x19" } },
    .{ "udat_formatForFields", MethodRecord{ .library = "icuin", .import = "udat_formatForFields", .signature = "\x00\x06\x08\x0f\x0f\x01\x0d\x0f\x07\x08\x0f\x11\x91\x81\x0f\x11\x90\x19" } },
    .{ "udat_formatCalendarForFields", MethodRecord{ .library = "icuin", .import = "udat_formatCalendarForFields", .signature = "\x00\x06\x08\x0f\x0f\x01\x0f\x0f\x01\x0f\x07\x08\x0f\x11\x91\x81\x0f\x11\x90\x19" } },
    .{ "udat_parse", MethodRecord{ .library = "icuin", .import = "udat_parse", .signature = "\x00\x05\x0d\x0f\x0f\x01\x0f\x07\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "udat_parseCalendar", MethodRecord{ .library = "icuin", .import = "udat_parseCalendar", .signature = "\x00\x06\x01\x0f\x0f\x01\x0f\x0f\x01\x0f\x07\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "udat_isLenient", MethodRecord{ .library = "icuin", .import = "udat_isLenient", .signature = "\x00\x01\x04\x0f\x0f\x01" } },
    .{ "udat_setLenient", MethodRecord{ .library = "icuin", .import = "udat_setLenient", .signature = "\x00\x02\x01\x0f\x0f\x01\x04" } },
    .{ "udat_getCalendar", MethodRecord{ .library = "icuin", .import = "udat_getCalendar", .signature = "\x00\x01\x0f\x0f\x01\x0f\x0f\x01" } },
    .{ "udat_setCalendar", MethodRecord{ .library = "icuin", .import = "udat_setCalendar", .signature = "\x00\x02\x01\x0f\x0f\x01\x0f\x0f\x01" } },
    .{ "udat_getNumberFormat", MethodRecord{ .library = "icuin", .import = "udat_getNumberFormat", .signature = "\x00\x01\x0f\x0f\x01\x0f\x0f\x01" } },
    .{ "udat_getNumberFormatForField", MethodRecord{ .library = "icuin", .import = "udat_getNumberFormatForField", .signature = "\x00\x02\x0f\x0f\x01\x0f\x0f\x01\x07" } },
    .{ "udat_adoptNumberFormatForFields", MethodRecord{ .library = "icuin", .import = "udat_adoptNumberFormatForFields", .signature = "\x00\x04\x01\x0f\x0f\x01\x0f\x07\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "udat_setNumberFormat", MethodRecord{ .library = "icuin", .import = "udat_setNumberFormat", .signature = "\x00\x02\x01\x0f\x0f\x01\x0f\x0f\x01" } },
    .{ "udat_adoptNumberFormat", MethodRecord{ .library = "icuin", .import = "udat_adoptNumberFormat", .signature = "\x00\x02\x01\x0f\x0f\x01\x0f\x0f\x01" } },
    .{ "udat_getAvailable", MethodRecord{ .library = "icuin", .import = "udat_getAvailable", .signature = "\x00\x01\x11\x3d\x08" } },
    .{ "udat_countAvailable", MethodRecord{ .library = "icuin", .import = "udat_countAvailable", .signature = "\x00\x00\x08" } },
    .{ "udat_get2DigitYearStart", MethodRecord{ .library = "icuin", .import = "udat_get2DigitYearStart", .signature = "\x00\x02\x0d\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "udat_set2DigitYearStart", MethodRecord{ .library = "icuin", .import = "udat_set2DigitYearStart", .signature = "\x00\x03\x01\x0f\x0f\x01\x0d\x0f\x11\x90\x19" } },
    .{ "udat_toPattern", MethodRecord{ .library = "icuin", .import = "udat_toPattern", .signature = "\x00\x05\x08\x0f\x0f\x01\x04\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "udat_applyPattern", MethodRecord{ .library = "icuin", .import = "udat_applyPattern", .signature = "\x00\x04\x01\x0f\x0f\x01\x04\x0f\x07\x08" } },
    .{ "udat_getSymbols", MethodRecord{ .library = "icuin", .import = "udat_getSymbols", .signature = "\x00\x06\x08\x0f\x0f\x01\x11\x91\xe1\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "udat_countSymbols", MethodRecord{ .library = "icuin", .import = "udat_countSymbols", .signature = "\x00\x02\x08\x0f\x0f\x01\x11\x91\xe1" } },
    .{ "udat_setSymbols", MethodRecord{ .library = "icuin", .import = "udat_setSymbols", .signature = "\x00\x06\x01\x0f\x0f\x01\x11\x91\xe1\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "udat_getLocaleByType", MethodRecord{ .library = "icuin", .import = "udat_getLocaleByType", .signature = "\x00\x03\x11\x3d\x0f\x0f\x01\x11\x90\x49\x0f\x11\x90\x19" } },
    .{ "udat_setContext", MethodRecord{ .library = "icuin", .import = "udat_setContext", .signature = "\x00\x03\x01\x0f\x0f\x01\x11\x90\x59\x0f\x11\x90\x19" } },
    .{ "udat_getContext", MethodRecord{ .library = "icuin", .import = "udat_getContext", .signature = "\x00\x03\x11\x90\x59\x0f\x0f\x01\x11\x90\x5d\x0f\x11\x90\x19" } },
    .{ "udatpg_open", MethodRecord{ .library = "icuin", .import = "udatpg_open", .signature = "\x00\x02\x0f\x0f\x01\x11\x3d\x0f\x11\x90\x19" } },
    .{ "udatpg_openEmpty", MethodRecord{ .library = "icuin", .import = "udatpg_openEmpty", .signature = "\x00\x01\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "udatpg_close", MethodRecord{ .library = "icuin", .import = "udatpg_close", .signature = "\x00\x01\x01\x0f\x0f\x01" } },
    .{ "udatpg_clone", MethodRecord{ .library = "icuin", .import = "udatpg_clone", .signature = "\x00\x02\x0f\x0f\x01\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "udatpg_getBestPattern", MethodRecord{ .library = "icuin", .import = "udatpg_getBestPattern", .signature = "\x00\x06\x08\x0f\x0f\x01\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "udatpg_getBestPatternWithOptions", MethodRecord{ .library = "icuin", .import = "udatpg_getBestPatternWithOptions", .signature = "\x00\x07\x08\x0f\x0f\x01\x0f\x07\x08\x11\x91\xe5\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "udatpg_getSkeleton", MethodRecord{ .library = "icuin", .import = "udatpg_getSkeleton", .signature = "\x00\x06\x08\x0f\x0f\x01\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "udatpg_getBaseSkeleton", MethodRecord{ .library = "icuin", .import = "udatpg_getBaseSkeleton", .signature = "\x00\x06\x08\x0f\x0f\x01\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "udatpg_addPattern", MethodRecord{ .library = "icuin", .import = "udatpg_addPattern", .signature = "\x00\x08\x11\x91\xe9\x0f\x0f\x01\x0f\x07\x08\x04\x0f\x07\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "udatpg_setAppendItemFormat", MethodRecord{ .library = "icuin", .import = "udatpg_setAppendItemFormat", .signature = "\x00\x04\x01\x0f\x0f\x01\x11\x91\xed\x0f\x07\x08" } },
    .{ "udatpg_getAppendItemFormat", MethodRecord{ .library = "icuin", .import = "udatpg_getAppendItemFormat", .signature = "\x00\x03\x0f\x07\x0f\x0f\x01\x11\x91\xed\x0f\x08" } },
    .{ "udatpg_setAppendItemName", MethodRecord{ .library = "icuin", .import = "udatpg_setAppendItemName", .signature = "\x00\x04\x01\x0f\x0f\x01\x11\x91\xed\x0f\x07\x08" } },
    .{ "udatpg_getAppendItemName", MethodRecord{ .library = "icuin", .import = "udatpg_getAppendItemName", .signature = "\x00\x03\x0f\x07\x0f\x0f\x01\x11\x91\xed\x0f\x08" } },
    .{ "udatpg_getFieldDisplayName", MethodRecord{ .library = "icu", .import = "udatpg_getFieldDisplayName", .signature = "\x00\x06\x08\x0f\x0f\x01\x11\x91\xed\x11\x91\xf1\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "udatpg_setDateTimeFormat", MethodRecord{ .library = "icuin", .import = "udatpg_setDateTimeFormat", .signature = "\x00\x03\x01\x0f\x0f\x01\x0f\x07\x08" } },
    .{ "udatpg_getDateTimeFormat", MethodRecord{ .library = "icuin", .import = "udatpg_getDateTimeFormat", .signature = "\x00\x02\x0f\x07\x0f\x0f\x01\x0f\x08" } },
    .{ "udatpg_setDecimal", MethodRecord{ .library = "icuin", .import = "udatpg_setDecimal", .signature = "\x00\x03\x01\x0f\x0f\x01\x0f\x07\x08" } },
    .{ "udatpg_getDecimal", MethodRecord{ .library = "icuin", .import = "udatpg_getDecimal", .signature = "\x00\x02\x0f\x07\x0f\x0f\x01\x0f\x08" } },
    .{ "udatpg_replaceFieldTypes", MethodRecord{ .library = "icuin", .import = "udatpg_replaceFieldTypes", .signature = "\x00\x08\x08\x0f\x0f\x01\x0f\x07\x08\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "udatpg_replaceFieldTypesWithOptions", MethodRecord{ .library = "icuin", .import = "udatpg_replaceFieldTypesWithOptions", .signature = "\x00\x09\x08\x0f\x0f\x01\x0f\x07\x08\x0f\x07\x08\x11\x91\xe5\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "udatpg_openSkeletons", MethodRecord{ .library = "icuin", .import = "udatpg_openSkeletons", .signature = "\x00\x02\x0f\x11\x90\x35\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "udatpg_openBaseSkeletons", MethodRecord{ .library = "icuin", .import = "udatpg_openBaseSkeletons", .signature = "\x00\x02\x0f\x11\x90\x35\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "udatpg_getPatternForSkeleton", MethodRecord{ .library = "icuin", .import = "udatpg_getPatternForSkeleton", .signature = "\x00\x04\x0f\x07\x0f\x0f\x01\x0f\x07\x08\x0f\x08" } },
    .{ "udatpg_getDefaultHourCycle", MethodRecord{ .library = "icu", .import = "udatpg_getDefaultHourCycle", .signature = "\x00\x02\x11\x91\xf5\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "unumf_openForSkeletonAndLocale", MethodRecord{ .library = "icu", .import = "unumf_openForSkeletonAndLocale", .signature = "\x00\x04\x0f\x11\x91\xf9\x0f\x07\x08\x11\x3d\x0f\x11\x90\x19" } },
    .{ "unumf_openForSkeletonAndLocaleWithError", MethodRecord{ .library = "icu", .import = "unumf_openForSkeletonAndLocaleWithError", .signature = "\x00\x05\x0f\x11\x91\xf9\x0f\x07\x08\x11\x3d\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "unumf_openResult", MethodRecord{ .library = "icu", .import = "unumf_openResult", .signature = "\x00\x01\x0f\x11\x91\xfd\x0f\x11\x90\x19" } },
    .{ "unumf_formatInt", MethodRecord{ .library = "icu", .import = "unumf_formatInt", .signature = "\x00\x04\x01\x0f\x11\x91\xf9\x0a\x0f\x11\x91\xfd\x0f\x11\x90\x19" } },
    .{ "unumf_formatDouble", MethodRecord{ .library = "icu", .import = "unumf_formatDouble", .signature = "\x00\x04\x01\x0f\x11\x91\xf9\x0d\x0f\x11\x91\xfd\x0f\x11\x90\x19" } },
    .{ "unumf_formatDecimal", MethodRecord{ .library = "icu", .import = "unumf_formatDecimal", .signature = "\x00\x05\x01\x0f\x11\x91\xf9\x11\x3d\x08\x0f\x11\x91\xfd\x0f\x11\x90\x19" } },
    .{ "unumf_resultAsValue", MethodRecord{ .library = "icu", .import = "unumf_resultAsValue", .signature = "\x00\x02\x0f\x11\x91\x8d\x0f\x11\x91\xfd\x0f\x11\x90\x19" } },
    .{ "unumf_resultToString", MethodRecord{ .library = "icu", .import = "unumf_resultToString", .signature = "\x00\x04\x08\x0f\x11\x91\xfd\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "unumf_resultNextFieldPosition", MethodRecord{ .library = "icu", .import = "unumf_resultNextFieldPosition", .signature = "\x00\x03\x04\x0f\x11\x91\xfd\x0f\x11\x91\x99\x0f\x11\x90\x19" } },
    .{ "unumf_resultGetAllFieldPositions", MethodRecord{ .library = "icu", .import = "unumf_resultGetAllFieldPositions", .signature = "\x00\x03\x01\x0f\x11\x91\xfd\x0f\x11\x91\x81\x0f\x11\x90\x19" } },
    .{ "unumf_resultToDecimalNumber", MethodRecord{ .library = "icu", .import = "unumf_resultToDecimalNumber", .signature = "\x00\x04\x08\x0f\x11\x91\xfd\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "unumf_close", MethodRecord{ .library = "icu", .import = "unumf_close", .signature = "\x00\x01\x01\x0f\x11\x91\xf9" } },
    .{ "unumf_closeResult", MethodRecord{ .library = "icu", .import = "unumf_closeResult", .signature = "\x00\x01\x01\x0f\x11\x91\xfd" } },
    .{ "unumrf_openForSkeletonWithCollapseAndIdentityFallback", MethodRecord{ .library = "icu", .import = "unumrf_openForSkeletonWithCollapseAndIdentityFallback", .signature = "\x00\x07\x0f\x11\x92\x01\x0f\x07\x08\x11\x92\x05\x11\x92\x09\x11\x3d\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "unumrf_openResult", MethodRecord{ .library = "icu", .import = "unumrf_openResult", .signature = "\x00\x01\x0f\x11\x92\x0d\x0f\x11\x90\x19" } },
    .{ "unumrf_formatDoubleRange", MethodRecord{ .library = "icu", .import = "unumrf_formatDoubleRange", .signature = "\x00\x05\x01\x0f\x11\x92\x01\x0d\x0d\x0f\x11\x92\x0d\x0f\x11\x90\x19" } },
    .{ "unumrf_formatDecimalRange", MethodRecord{ .library = "icu", .import = "unumrf_formatDecimalRange", .signature = "\x00\x07\x01\x0f\x11\x92\x01\x11\x3d\x08\x11\x3d\x08\x0f\x11\x92\x0d\x0f\x11\x90\x19" } },
    .{ "unumrf_resultAsValue", MethodRecord{ .library = "icu", .import = "unumrf_resultAsValue", .signature = "\x00\x02\x0f\x11\x91\x8d\x0f\x11\x92\x0d\x0f\x11\x90\x19" } },
    .{ "unumrf_resultGetIdentityResult", MethodRecord{ .library = "icu", .import = "unumrf_resultGetIdentityResult", .signature = "\x00\x02\x11\x92\x11\x0f\x11\x92\x0d\x0f\x11\x90\x19" } },
    .{ "unumrf_resultGetFirstDecimalNumber", MethodRecord{ .library = "icu", .import = "unumrf_resultGetFirstDecimalNumber", .signature = "\x00\x04\x08\x0f\x11\x92\x0d\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "unumrf_resultGetSecondDecimalNumber", MethodRecord{ .library = "icu", .import = "unumrf_resultGetSecondDecimalNumber", .signature = "\x00\x04\x08\x0f\x11\x92\x0d\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "unumrf_close", MethodRecord{ .library = "icu", .import = "unumrf_close", .signature = "\x00\x01\x01\x0f\x11\x92\x01" } },
    .{ "unumrf_closeResult", MethodRecord{ .library = "icu", .import = "unumrf_closeResult", .signature = "\x00\x01\x01\x0f\x11\x92\x0d" } },
    .{ "unumsys_open", MethodRecord{ .library = "icuin", .import = "unumsys_open", .signature = "\x00\x02\x0f\x11\x92\x15\x11\x3d\x0f\x11\x90\x19" } },
    .{ "unumsys_openByName", MethodRecord{ .library = "icuin", .import = "unumsys_openByName", .signature = "\x00\x02\x0f\x11\x92\x15\x11\x3d\x0f\x11\x90\x19" } },
    .{ "unumsys_close", MethodRecord{ .library = "icuin", .import = "unumsys_close", .signature = "\x00\x01\x01\x0f\x11\x92\x15" } },
    .{ "unumsys_openAvailableNames", MethodRecord{ .library = "icuin", .import = "unumsys_openAvailableNames", .signature = "\x00\x01\x0f\x11\x90\x35\x0f\x11\x90\x19" } },
    .{ "unumsys_getName", MethodRecord{ .library = "icuin", .import = "unumsys_getName", .signature = "\x00\x01\x11\x3d\x0f\x11\x92\x15" } },
    .{ "unumsys_isAlgorithmic", MethodRecord{ .library = "icuin", .import = "unumsys_isAlgorithmic", .signature = "\x00\x01\x04\x0f\x11\x92\x15" } },
    .{ "unumsys_getRadix", MethodRecord{ .library = "icuin", .import = "unumsys_getRadix", .signature = "\x00\x01\x08\x0f\x11\x92\x15" } },
    .{ "unumsys_getDescription", MethodRecord{ .library = "icuin", .import = "unumsys_getDescription", .signature = "\x00\x04\x08\x0f\x11\x92\x15\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uplrules_open", MethodRecord{ .library = "icuin", .import = "uplrules_open", .signature = "\x00\x02\x0f\x11\x92\x19\x11\x3d\x0f\x11\x90\x19" } },
    .{ "uplrules_openForType", MethodRecord{ .library = "icuin", .import = "uplrules_openForType", .signature = "\x00\x03\x0f\x11\x92\x19\x11\x3d\x11\x92\x1d\x0f\x11\x90\x19" } },
    .{ "uplrules_close", MethodRecord{ .library = "icuin", .import = "uplrules_close", .signature = "\x00\x01\x01\x0f\x11\x92\x19" } },
    .{ "uplrules_select", MethodRecord{ .library = "icuin", .import = "uplrules_select", .signature = "\x00\x05\x08\x0f\x11\x92\x19\x0d\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uplrules_selectFormatted", MethodRecord{ .library = "icu", .import = "uplrules_selectFormatted", .signature = "\x00\x05\x08\x0f\x11\x92\x19\x0f\x11\x91\xfd\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uplrules_getKeywords", MethodRecord{ .library = "icuin", .import = "uplrules_getKeywords", .signature = "\x00\x02\x0f\x11\x90\x35\x0f\x11\x92\x19\x0f\x11\x90\x19" } },
    .{ "uregex_open", MethodRecord{ .library = "icuin", .import = "uregex_open", .signature = "\x00\x05\x0f\x11\x92\x21\x0f\x07\x08\x09\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "uregex_openUText", MethodRecord{ .library = "icuin", .import = "uregex_openUText", .signature = "\x00\x04\x0f\x11\x92\x21\x0f\x11\x90\xf1\x09\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "uregex_openC", MethodRecord{ .library = "icuin", .import = "uregex_openC", .signature = "\x00\x04\x0f\x11\x92\x21\x11\x3d\x09\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "uregex_close", MethodRecord{ .library = "icuin", .import = "uregex_close", .signature = "\x00\x01\x01\x0f\x11\x92\x21" } },
    .{ "uregex_clone", MethodRecord{ .library = "icuin", .import = "uregex_clone", .signature = "\x00\x02\x0f\x11\x92\x21\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_pattern", MethodRecord{ .library = "icuin", .import = "uregex_pattern", .signature = "\x00\x03\x0f\x07\x0f\x11\x92\x21\x0f\x08\x0f\x11\x90\x19" } },
    .{ "uregex_patternUText", MethodRecord{ .library = "icuin", .import = "uregex_patternUText", .signature = "\x00\x02\x0f\x11\x90\xf1\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_flags", MethodRecord{ .library = "icuin", .import = "uregex_flags", .signature = "\x00\x02\x08\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_setText", MethodRecord{ .library = "icuin", .import = "uregex_setText", .signature = "\x00\x04\x01\x0f\x11\x92\x21\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uregex_setUText", MethodRecord{ .library = "icuin", .import = "uregex_setUText", .signature = "\x00\x03\x01\x0f\x11\x92\x21\x0f\x11\x90\xf1\x0f\x11\x90\x19" } },
    .{ "uregex_getText", MethodRecord{ .library = "icuin", .import = "uregex_getText", .signature = "\x00\x03\x0f\x07\x0f\x11\x92\x21\x0f\x08\x0f\x11\x90\x19" } },
    .{ "uregex_getUText", MethodRecord{ .library = "icuin", .import = "uregex_getUText", .signature = "\x00\x03\x0f\x11\x90\xf1\x0f\x11\x92\x21\x0f\x11\x90\xf1\x0f\x11\x90\x19" } },
    .{ "uregex_refreshUText", MethodRecord{ .library = "icuin", .import = "uregex_refreshUText", .signature = "\x00\x03\x01\x0f\x11\x92\x21\x0f\x11\x90\xf1\x0f\x11\x90\x19" } },
    .{ "uregex_matches", MethodRecord{ .library = "icuin", .import = "uregex_matches", .signature = "\x00\x03\x04\x0f\x11\x92\x21\x08\x0f\x11\x90\x19" } },
    .{ "uregex_matches64", MethodRecord{ .library = "icuin", .import = "uregex_matches64", .signature = "\x00\x03\x04\x0f\x11\x92\x21\x0a\x0f\x11\x90\x19" } },
    .{ "uregex_lookingAt", MethodRecord{ .library = "icuin", .import = "uregex_lookingAt", .signature = "\x00\x03\x04\x0f\x11\x92\x21\x08\x0f\x11\x90\x19" } },
    .{ "uregex_lookingAt64", MethodRecord{ .library = "icuin", .import = "uregex_lookingAt64", .signature = "\x00\x03\x04\x0f\x11\x92\x21\x0a\x0f\x11\x90\x19" } },
    .{ "uregex_find", MethodRecord{ .library = "icuin", .import = "uregex_find", .signature = "\x00\x03\x04\x0f\x11\x92\x21\x08\x0f\x11\x90\x19" } },
    .{ "uregex_find64", MethodRecord{ .library = "icuin", .import = "uregex_find64", .signature = "\x00\x03\x04\x0f\x11\x92\x21\x0a\x0f\x11\x90\x19" } },
    .{ "uregex_findNext", MethodRecord{ .library = "icuin", .import = "uregex_findNext", .signature = "\x00\x02\x04\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_groupCount", MethodRecord{ .library = "icuin", .import = "uregex_groupCount", .signature = "\x00\x02\x08\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_groupNumberFromName", MethodRecord{ .library = "icuin", .import = "uregex_groupNumberFromName", .signature = "\x00\x04\x08\x0f\x11\x92\x21\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uregex_groupNumberFromCName", MethodRecord{ .library = "icuin", .import = "uregex_groupNumberFromCName", .signature = "\x00\x04\x08\x0f\x11\x92\x21\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uregex_group", MethodRecord{ .library = "icuin", .import = "uregex_group", .signature = "\x00\x05\x08\x0f\x11\x92\x21\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uregex_groupUText", MethodRecord{ .library = "icuin", .import = "uregex_groupUText", .signature = "\x00\x05\x0f\x11\x90\xf1\x0f\x11\x92\x21\x08\x0f\x11\x90\xf1\x0f\x0a\x0f\x11\x90\x19" } },
    .{ "uregex_start", MethodRecord{ .library = "icuin", .import = "uregex_start", .signature = "\x00\x03\x08\x0f\x11\x92\x21\x08\x0f\x11\x90\x19" } },
    .{ "uregex_start64", MethodRecord{ .library = "icuin", .import = "uregex_start64", .signature = "\x00\x03\x0a\x0f\x11\x92\x21\x08\x0f\x11\x90\x19" } },
    .{ "uregex_end", MethodRecord{ .library = "icuin", .import = "uregex_end", .signature = "\x00\x03\x08\x0f\x11\x92\x21\x08\x0f\x11\x90\x19" } },
    .{ "uregex_end64", MethodRecord{ .library = "icuin", .import = "uregex_end64", .signature = "\x00\x03\x0a\x0f\x11\x92\x21\x08\x0f\x11\x90\x19" } },
    .{ "uregex_reset", MethodRecord{ .library = "icuin", .import = "uregex_reset", .signature = "\x00\x03\x01\x0f\x11\x92\x21\x08\x0f\x11\x90\x19" } },
    .{ "uregex_reset64", MethodRecord{ .library = "icuin", .import = "uregex_reset64", .signature = "\x00\x03\x01\x0f\x11\x92\x21\x0a\x0f\x11\x90\x19" } },
    .{ "uregex_setRegion", MethodRecord{ .library = "icuin", .import = "uregex_setRegion", .signature = "\x00\x04\x01\x0f\x11\x92\x21\x08\x08\x0f\x11\x90\x19" } },
    .{ "uregex_setRegion64", MethodRecord{ .library = "icuin", .import = "uregex_setRegion64", .signature = "\x00\x04\x01\x0f\x11\x92\x21\x0a\x0a\x0f\x11\x90\x19" } },
    .{ "uregex_setRegionAndStart", MethodRecord{ .library = "icuin", .import = "uregex_setRegionAndStart", .signature = "\x00\x05\x01\x0f\x11\x92\x21\x0a\x0a\x0a\x0f\x11\x90\x19" } },
    .{ "uregex_regionStart", MethodRecord{ .library = "icuin", .import = "uregex_regionStart", .signature = "\x00\x02\x08\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_regionStart64", MethodRecord{ .library = "icuin", .import = "uregex_regionStart64", .signature = "\x00\x02\x0a\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_regionEnd", MethodRecord{ .library = "icuin", .import = "uregex_regionEnd", .signature = "\x00\x02\x08\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_regionEnd64", MethodRecord{ .library = "icuin", .import = "uregex_regionEnd64", .signature = "\x00\x02\x0a\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_hasTransparentBounds", MethodRecord{ .library = "icuin", .import = "uregex_hasTransparentBounds", .signature = "\x00\x02\x04\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_useTransparentBounds", MethodRecord{ .library = "icuin", .import = "uregex_useTransparentBounds", .signature = "\x00\x03\x01\x0f\x11\x92\x21\x04\x0f\x11\x90\x19" } },
    .{ "uregex_hasAnchoringBounds", MethodRecord{ .library = "icuin", .import = "uregex_hasAnchoringBounds", .signature = "\x00\x02\x04\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_useAnchoringBounds", MethodRecord{ .library = "icuin", .import = "uregex_useAnchoringBounds", .signature = "\x00\x03\x01\x0f\x11\x92\x21\x04\x0f\x11\x90\x19" } },
    .{ "uregex_hitEnd", MethodRecord{ .library = "icuin", .import = "uregex_hitEnd", .signature = "\x00\x02\x04\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_requireEnd", MethodRecord{ .library = "icuin", .import = "uregex_requireEnd", .signature = "\x00\x02\x04\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_replaceAll", MethodRecord{ .library = "icuin", .import = "uregex_replaceAll", .signature = "\x00\x06\x08\x0f\x11\x92\x21\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uregex_replaceAllUText", MethodRecord{ .library = "icuin", .import = "uregex_replaceAllUText", .signature = "\x00\x04\x0f\x11\x90\xf1\x0f\x11\x92\x21\x0f\x11\x90\xf1\x0f\x11\x90\xf1\x0f\x11\x90\x19" } },
    .{ "uregex_replaceFirst", MethodRecord{ .library = "icuin", .import = "uregex_replaceFirst", .signature = "\x00\x06\x08\x0f\x11\x92\x21\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uregex_replaceFirstUText", MethodRecord{ .library = "icuin", .import = "uregex_replaceFirstUText", .signature = "\x00\x04\x0f\x11\x90\xf1\x0f\x11\x92\x21\x0f\x11\x90\xf1\x0f\x11\x90\xf1\x0f\x11\x90\x19" } },
    .{ "uregex_appendReplacement", MethodRecord{ .library = "icuin", .import = "uregex_appendReplacement", .signature = "\x00\x06\x08\x0f\x11\x92\x21\x0f\x07\x08\x0f\x0f\x07\x0f\x08\x0f\x11\x90\x19" } },
    .{ "uregex_appendReplacementUText", MethodRecord{ .library = "icuin", .import = "uregex_appendReplacementUText", .signature = "\x00\x04\x01\x0f\x11\x92\x21\x0f\x11\x90\xf1\x0f\x11\x90\xf1\x0f\x11\x90\x19" } },
    .{ "uregex_appendTail", MethodRecord{ .library = "icuin", .import = "uregex_appendTail", .signature = "\x00\x04\x08\x0f\x11\x92\x21\x0f\x0f\x07\x0f\x08\x0f\x11\x90\x19" } },
    .{ "uregex_appendTailUText", MethodRecord{ .library = "icuin", .import = "uregex_appendTailUText", .signature = "\x00\x03\x0f\x11\x90\xf1\x0f\x11\x92\x21\x0f\x11\x90\xf1\x0f\x11\x90\x19" } },
    .{ "uregex_split", MethodRecord{ .library = "icuin", .import = "uregex_split", .signature = "\x00\x07\x08\x0f\x11\x92\x21\x0f\x07\x08\x0f\x08\x0f\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uregex_splitUText", MethodRecord{ .library = "icuin", .import = "uregex_splitUText", .signature = "\x00\x04\x08\x0f\x11\x92\x21\x0f\x0f\x11\x90\xf1\x08\x0f\x11\x90\x19" } },
    .{ "uregex_setTimeLimit", MethodRecord{ .library = "icuin", .import = "uregex_setTimeLimit", .signature = "\x00\x03\x01\x0f\x11\x92\x21\x08\x0f\x11\x90\x19" } },
    .{ "uregex_getTimeLimit", MethodRecord{ .library = "icuin", .import = "uregex_getTimeLimit", .signature = "\x00\x02\x08\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_setStackLimit", MethodRecord{ .library = "icuin", .import = "uregex_setStackLimit", .signature = "\x00\x03\x01\x0f\x11\x92\x21\x08\x0f\x11\x90\x19" } },
    .{ "uregex_getStackLimit", MethodRecord{ .library = "icuin", .import = "uregex_getStackLimit", .signature = "\x00\x02\x08\x0f\x11\x92\x21\x0f\x11\x90\x19" } },
    .{ "uregex_setMatchCallback", MethodRecord{ .library = "icuin", .import = "uregex_setMatchCallback", .signature = "\x00\x04\x01\x0f\x11\x92\x21\x12\x92\x25\x0f\x01\x0f\x11\x90\x19" } },
    .{ "uregex_getMatchCallback", MethodRecord{ .library = "icuin", .import = "uregex_getMatchCallback", .signature = "\x00\x04\x01\x0f\x11\x92\x21\x0f\x12\x92\x25\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "uregex_setFindProgressCallback", MethodRecord{ .library = "icuin", .import = "uregex_setFindProgressCallback", .signature = "\x00\x04\x01\x0f\x11\x92\x21\x12\x92\x29\x0f\x01\x0f\x11\x90\x19" } },
    .{ "uregex_getFindProgressCallback", MethodRecord{ .library = "icuin", .import = "uregex_getFindProgressCallback", .signature = "\x00\x04\x01\x0f\x11\x92\x21\x0f\x12\x92\x29\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "uregion_getRegionFromCode", MethodRecord{ .library = "icuin", .import = "uregion_getRegionFromCode", .signature = "\x00\x02\x0f\x11\x92\x2d\x11\x3d\x0f\x11\x90\x19" } },
    .{ "uregion_getRegionFromNumericCode", MethodRecord{ .library = "icuin", .import = "uregion_getRegionFromNumericCode", .signature = "\x00\x02\x0f\x11\x92\x2d\x08\x0f\x11\x90\x19" } },
    .{ "uregion_getAvailable", MethodRecord{ .library = "icuin", .import = "uregion_getAvailable", .signature = "\x00\x02\x0f\x11\x90\x35\x11\x92\x31\x0f\x11\x90\x19" } },
    .{ "uregion_areEqual", MethodRecord{ .library = "icuin", .import = "uregion_areEqual", .signature = "\x00\x02\x04\x0f\x11\x92\x2d\x0f\x11\x92\x2d" } },
    .{ "uregion_getContainingRegion", MethodRecord{ .library = "icuin", .import = "uregion_getContainingRegion", .signature = "\x00\x01\x0f\x11\x92\x2d\x0f\x11\x92\x2d" } },
    .{ "uregion_getContainingRegionOfType", MethodRecord{ .library = "icuin", .import = "uregion_getContainingRegionOfType", .signature = "\x00\x02\x0f\x11\x92\x2d\x0f\x11\x92\x2d\x11\x92\x31" } },
    .{ "uregion_getContainedRegions", MethodRecord{ .library = "icuin", .import = "uregion_getContainedRegions", .signature = "\x00\x02\x0f\x11\x90\x35\x0f\x11\x92\x2d\x0f\x11\x90\x19" } },
    .{ "uregion_getContainedRegionsOfType", MethodRecord{ .library = "icuin", .import = "uregion_getContainedRegionsOfType", .signature = "\x00\x03\x0f\x11\x90\x35\x0f\x11\x92\x2d\x11\x92\x31\x0f\x11\x90\x19" } },
    .{ "uregion_contains", MethodRecord{ .library = "icuin", .import = "uregion_contains", .signature = "\x00\x02\x04\x0f\x11\x92\x2d\x0f\x11\x92\x2d" } },
    .{ "uregion_getPreferredValues", MethodRecord{ .library = "icuin", .import = "uregion_getPreferredValues", .signature = "\x00\x02\x0f\x11\x90\x35\x0f\x11\x92\x2d\x0f\x11\x90\x19" } },
    .{ "uregion_getRegionCode", MethodRecord{ .library = "icuin", .import = "uregion_getRegionCode", .signature = "\x00\x01\x11\x3d\x0f\x11\x92\x2d" } },
    .{ "uregion_getNumericCode", MethodRecord{ .library = "icuin", .import = "uregion_getNumericCode", .signature = "\x00\x01\x08\x0f\x11\x92\x2d" } },
    .{ "uregion_getType", MethodRecord{ .library = "icuin", .import = "uregion_getType", .signature = "\x00\x01\x11\x92\x31\x0f\x11\x92\x2d" } },
    .{ "ureldatefmt_open", MethodRecord{ .library = "icuin", .import = "ureldatefmt_open", .signature = "\x00\x05\x0f\x11\x92\x35\x11\x3d\x0f\x0f\x01\x11\x92\x39\x11\x90\x59\x0f\x11\x90\x19" } },
    .{ "ureldatefmt_close", MethodRecord{ .library = "icuin", .import = "ureldatefmt_close", .signature = "\x00\x01\x01\x0f\x11\x92\x35" } },
    .{ "ureldatefmt_openResult", MethodRecord{ .library = "icu", .import = "ureldatefmt_openResult", .signature = "\x00\x01\x0f\x11\x92\x3d\x0f\x11\x90\x19" } },
    .{ "ureldatefmt_resultAsValue", MethodRecord{ .library = "icu", .import = "ureldatefmt_resultAsValue", .signature = "\x00\x02\x0f\x11\x91\x8d\x0f\x11\x92\x3d\x0f\x11\x90\x19" } },
    .{ "ureldatefmt_closeResult", MethodRecord{ .library = "icu", .import = "ureldatefmt_closeResult", .signature = "\x00\x01\x01\x0f\x11\x92\x3d" } },
    .{ "ureldatefmt_formatNumeric", MethodRecord{ .library = "icuin", .import = "ureldatefmt_formatNumeric", .signature = "\x00\x06\x08\x0f\x11\x92\x35\x0d\x11\x92\x41\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ureldatefmt_formatNumericToResult", MethodRecord{ .library = "icu", .import = "ureldatefmt_formatNumericToResult", .signature = "\x00\x05\x01\x0f\x11\x92\x35\x0d\x11\x92\x41\x0f\x11\x92\x3d\x0f\x11\x90\x19" } },
    .{ "ureldatefmt_format", MethodRecord{ .library = "icuin", .import = "ureldatefmt_format", .signature = "\x00\x06\x08\x0f\x11\x92\x35\x0d\x11\x92\x41\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "ureldatefmt_formatToResult", MethodRecord{ .library = "icu", .import = "ureldatefmt_formatToResult", .signature = "\x00\x05\x01\x0f\x11\x92\x35\x0d\x11\x92\x41\x0f\x11\x92\x3d\x0f\x11\x90\x19" } },
    .{ "ureldatefmt_combineDateAndTime", MethodRecord{ .library = "icuin", .import = "ureldatefmt_combineDateAndTime", .signature = "\x00\x08\x08\x0f\x11\x92\x35\x0f\x07\x08\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "usearch_open", MethodRecord{ .library = "icuin", .import = "usearch_open", .signature = "\x00\x07\x0f\x11\x92\x45\x0f\x07\x08\x0f\x07\x08\x11\x3d\x0f\x11\x91\x11\x0f\x11\x90\x19" } },
    .{ "usearch_openFromCollator", MethodRecord{ .library = "icuin", .import = "usearch_openFromCollator", .signature = "\x00\x07\x0f\x11\x92\x45\x0f\x07\x08\x0f\x07\x08\x0f\x11\x91\x59\x0f\x11\x91\x11\x0f\x11\x90\x19" } },
    .{ "usearch_close", MethodRecord{ .library = "icuin", .import = "usearch_close", .signature = "\x00\x01\x01\x0f\x11\x92\x45" } },
    .{ "usearch_setOffset", MethodRecord{ .library = "icuin", .import = "usearch_setOffset", .signature = "\x00\x03\x01\x0f\x11\x92\x45\x08\x0f\x11\x90\x19" } },
    .{ "usearch_getOffset", MethodRecord{ .library = "icuin", .import = "usearch_getOffset", .signature = "\x00\x01\x08\x0f\x11\x92\x45" } },
    .{ "usearch_setAttribute", MethodRecord{ .library = "icuin", .import = "usearch_setAttribute", .signature = "\x00\x04\x01\x0f\x11\x92\x45\x11\x92\x49\x11\x92\x4d\x0f\x11\x90\x19" } },
    .{ "usearch_getAttribute", MethodRecord{ .library = "icuin", .import = "usearch_getAttribute", .signature = "\x00\x02\x11\x92\x4d\x0f\x11\x92\x45\x11\x92\x49" } },
    .{ "usearch_getMatchedStart", MethodRecord{ .library = "icuin", .import = "usearch_getMatchedStart", .signature = "\x00\x01\x08\x0f\x11\x92\x45" } },
    .{ "usearch_getMatchedLength", MethodRecord{ .library = "icuin", .import = "usearch_getMatchedLength", .signature = "\x00\x01\x08\x0f\x11\x92\x45" } },
    .{ "usearch_getMatchedText", MethodRecord{ .library = "icuin", .import = "usearch_getMatchedText", .signature = "\x00\x04\x08\x0f\x11\x92\x45\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "usearch_setBreakIterator", MethodRecord{ .library = "icuin", .import = "usearch_setBreakIterator", .signature = "\x00\x03\x01\x0f\x11\x92\x45\x0f\x11\x91\x11\x0f\x11\x90\x19" } },
    .{ "usearch_getBreakIterator", MethodRecord{ .library = "icuin", .import = "usearch_getBreakIterator", .signature = "\x00\x01\x0f\x11\x91\x11\x0f\x11\x92\x45" } },
    .{ "usearch_setText", MethodRecord{ .library = "icuin", .import = "usearch_setText", .signature = "\x00\x04\x01\x0f\x11\x92\x45\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "usearch_getText", MethodRecord{ .library = "icuin", .import = "usearch_getText", .signature = "\x00\x02\x0f\x07\x0f\x11\x92\x45\x0f\x08" } },
    .{ "usearch_getCollator", MethodRecord{ .library = "icuin", .import = "usearch_getCollator", .signature = "\x00\x01\x0f\x11\x91\x59\x0f\x11\x92\x45" } },
    .{ "usearch_setCollator", MethodRecord{ .library = "icuin", .import = "usearch_setCollator", .signature = "\x00\x03\x01\x0f\x11\x92\x45\x0f\x11\x91\x59\x0f\x11\x90\x19" } },
    .{ "usearch_setPattern", MethodRecord{ .library = "icuin", .import = "usearch_setPattern", .signature = "\x00\x04\x01\x0f\x11\x92\x45\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "usearch_getPattern", MethodRecord{ .library = "icuin", .import = "usearch_getPattern", .signature = "\x00\x02\x0f\x07\x0f\x11\x92\x45\x0f\x08" } },
    .{ "usearch_first", MethodRecord{ .library = "icuin", .import = "usearch_first", .signature = "\x00\x02\x08\x0f\x11\x92\x45\x0f\x11\x90\x19" } },
    .{ "usearch_following", MethodRecord{ .library = "icuin", .import = "usearch_following", .signature = "\x00\x03\x08\x0f\x11\x92\x45\x08\x0f\x11\x90\x19" } },
    .{ "usearch_last", MethodRecord{ .library = "icuin", .import = "usearch_last", .signature = "\x00\x02\x08\x0f\x11\x92\x45\x0f\x11\x90\x19" } },
    .{ "usearch_preceding", MethodRecord{ .library = "icuin", .import = "usearch_preceding", .signature = "\x00\x03\x08\x0f\x11\x92\x45\x08\x0f\x11\x90\x19" } },
    .{ "usearch_next", MethodRecord{ .library = "icuin", .import = "usearch_next", .signature = "\x00\x02\x08\x0f\x11\x92\x45\x0f\x11\x90\x19" } },
    .{ "usearch_previous", MethodRecord{ .library = "icuin", .import = "usearch_previous", .signature = "\x00\x02\x08\x0f\x11\x92\x45\x0f\x11\x90\x19" } },
    .{ "usearch_reset", MethodRecord{ .library = "icuin", .import = "usearch_reset", .signature = "\x00\x01\x01\x0f\x11\x92\x45" } },
    .{ "uspoof_open", MethodRecord{ .library = "icuin", .import = "uspoof_open", .signature = "\x00\x01\x0f\x11\x92\x51\x0f\x11\x90\x19" } },
    .{ "uspoof_openFromSerialized", MethodRecord{ .library = "icuin", .import = "uspoof_openFromSerialized", .signature = "\x00\x04\x0f\x11\x92\x51\x0f\x01\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "uspoof_openFromSource", MethodRecord{ .library = "icuin", .import = "uspoof_openFromSource", .signature = "\x00\x07\x0f\x11\x92\x51\x11\x3d\x08\x11\x3d\x08\x0f\x08\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "uspoof_close", MethodRecord{ .library = "icuin", .import = "uspoof_close", .signature = "\x00\x01\x01\x0f\x11\x92\x51" } },
    .{ "uspoof_clone", MethodRecord{ .library = "icuin", .import = "uspoof_clone", .signature = "\x00\x02\x0f\x11\x92\x51\x0f\x11\x92\x51\x0f\x11\x90\x19" } },
    .{ "uspoof_setChecks", MethodRecord{ .library = "icuin", .import = "uspoof_setChecks", .signature = "\x00\x03\x01\x0f\x11\x92\x51\x08\x0f\x11\x90\x19" } },
    .{ "uspoof_getChecks", MethodRecord{ .library = "icuin", .import = "uspoof_getChecks", .signature = "\x00\x02\x08\x0f\x11\x92\x51\x0f\x11\x90\x19" } },
    .{ "uspoof_setRestrictionLevel", MethodRecord{ .library = "icuin", .import = "uspoof_setRestrictionLevel", .signature = "\x00\x02\x01\x0f\x11\x92\x51\x11\x92\x55" } },
    .{ "uspoof_getRestrictionLevel", MethodRecord{ .library = "icuin", .import = "uspoof_getRestrictionLevel", .signature = "\x00\x01\x11\x92\x55\x0f\x11\x92\x51" } },
    .{ "uspoof_setAllowedLocales", MethodRecord{ .library = "icuin", .import = "uspoof_setAllowedLocales", .signature = "\x00\x03\x01\x0f\x11\x92\x51\x11\x3d\x0f\x11\x90\x19" } },
    .{ "uspoof_getAllowedLocales", MethodRecord{ .library = "icuin", .import = "uspoof_getAllowedLocales", .signature = "\x00\x02\x11\x3d\x0f\x11\x92\x51\x0f\x11\x90\x19" } },
    .{ "uspoof_setAllowedChars", MethodRecord{ .library = "icuin", .import = "uspoof_setAllowedChars", .signature = "\x00\x03\x01\x0f\x11\x92\x51\x0f\x11\x90\x9d\x0f\x11\x90\x19" } },
    .{ "uspoof_getAllowedChars", MethodRecord{ .library = "icuin", .import = "uspoof_getAllowedChars", .signature = "\x00\x02\x0f\x11\x90\x9d\x0f\x11\x92\x51\x0f\x11\x90\x19" } },
    .{ "uspoof_check", MethodRecord{ .library = "icuin", .import = "uspoof_check", .signature = "\x00\x05\x08\x0f\x11\x92\x51\x0f\x07\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "uspoof_checkUTF8", MethodRecord{ .library = "icuin", .import = "uspoof_checkUTF8", .signature = "\x00\x05\x08\x0f\x11\x92\x51\x11\x3d\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "uspoof_check2", MethodRecord{ .library = "icuin", .import = "uspoof_check2", .signature = "\x00\x05\x08\x0f\x11\x92\x51\x0f\x07\x08\x0f\x11\x92\x59\x0f\x11\x90\x19" } },
    .{ "uspoof_check2UTF8", MethodRecord{ .library = "icuin", .import = "uspoof_check2UTF8", .signature = "\x00\x05\x08\x0f\x11\x92\x51\x11\x3d\x08\x0f\x11\x92\x59\x0f\x11\x90\x19" } },
    .{ "uspoof_openCheckResult", MethodRecord{ .library = "icuin", .import = "uspoof_openCheckResult", .signature = "\x00\x01\x0f\x11\x92\x59\x0f\x11\x90\x19" } },
    .{ "uspoof_closeCheckResult", MethodRecord{ .library = "icuin", .import = "uspoof_closeCheckResult", .signature = "\x00\x01\x01\x0f\x11\x92\x59" } },
    .{ "uspoof_getCheckResultChecks", MethodRecord{ .library = "icuin", .import = "uspoof_getCheckResultChecks", .signature = "\x00\x02\x08\x0f\x11\x92\x59\x0f\x11\x90\x19" } },
    .{ "uspoof_getCheckResultRestrictionLevel", MethodRecord{ .library = "icuin", .import = "uspoof_getCheckResultRestrictionLevel", .signature = "\x00\x02\x11\x92\x55\x0f\x11\x92\x59\x0f\x11\x90\x19" } },
    .{ "uspoof_getCheckResultNumerics", MethodRecord{ .library = "icuin", .import = "uspoof_getCheckResultNumerics", .signature = "\x00\x02\x0f\x11\x90\x9d\x0f\x11\x92\x59\x0f\x11\x90\x19" } },
    .{ "uspoof_areConfusable", MethodRecord{ .library = "icuin", .import = "uspoof_areConfusable", .signature = "\x00\x06\x08\x0f\x11\x92\x51\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uspoof_areConfusableUTF8", MethodRecord{ .library = "icuin", .import = "uspoof_areConfusableUTF8", .signature = "\x00\x06\x08\x0f\x11\x92\x51\x11\x3d\x08\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uspoof_getSkeleton", MethodRecord{ .library = "icuin", .import = "uspoof_getSkeleton", .signature = "\x00\x07\x08\x0f\x11\x92\x51\x09\x0f\x07\x08\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "uspoof_getSkeletonUTF8", MethodRecord{ .library = "icuin", .import = "uspoof_getSkeletonUTF8", .signature = "\x00\x07\x08\x0f\x11\x92\x51\x09\x11\x3d\x08\x11\x3d\x08\x0f\x11\x90\x19" } },
    .{ "uspoof_getInclusionSet", MethodRecord{ .library = "icuin", .import = "uspoof_getInclusionSet", .signature = "\x00\x01\x0f\x11\x90\x9d\x0f\x11\x90\x19" } },
    .{ "uspoof_getRecommendedSet", MethodRecord{ .library = "icuin", .import = "uspoof_getRecommendedSet", .signature = "\x00\x01\x0f\x11\x90\x9d\x0f\x11\x90\x19" } },
    .{ "uspoof_serialize", MethodRecord{ .library = "icuin", .import = "uspoof_serialize", .signature = "\x00\x04\x08\x0f\x11\x92\x51\x0f\x01\x08\x0f\x11\x90\x19" } },
    .{ "utmscale_getTimeScaleValue", MethodRecord{ .library = "icuin", .import = "utmscale_getTimeScaleValue", .signature = "\x00\x03\x0a\x11\x92\x5d\x11\x92\x61\x0f\x11\x90\x19" } },
    .{ "utmscale_fromInt64", MethodRecord{ .library = "icuin", .import = "utmscale_fromInt64", .signature = "\x00\x03\x0a\x0a\x11\x92\x5d\x0f\x11\x90\x19" } },
    .{ "utmscale_toInt64", MethodRecord{ .library = "icuin", .import = "utmscale_toInt64", .signature = "\x00\x03\x0a\x0a\x11\x92\x5d\x0f\x11\x90\x19" } },
    .{ "utrans_openU", MethodRecord{ .library = "icuin", .import = "utrans_openU", .signature = "\x00\x07\x0f\x0f\x01\x0f\x07\x08\x11\x92\x65\x0f\x07\x08\x0f\x11\x91\x21\x0f\x11\x90\x19" } },
    .{ "utrans_openInverse", MethodRecord{ .library = "icuin", .import = "utrans_openInverse", .signature = "\x00\x02\x0f\x0f\x01\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "utrans_clone", MethodRecord{ .library = "icuin", .import = "utrans_clone", .signature = "\x00\x02\x0f\x0f\x01\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "utrans_close", MethodRecord{ .library = "icuin", .import = "utrans_close", .signature = "\x00\x01\x01\x0f\x0f\x01" } },
    .{ "utrans_getUnicodeID", MethodRecord{ .library = "icuin", .import = "utrans_getUnicodeID", .signature = "\x00\x02\x0f\x07\x0f\x0f\x01\x0f\x08" } },
    .{ "utrans_register", MethodRecord{ .library = "icuin", .import = "utrans_register", .signature = "\x00\x02\x01\x0f\x0f\x01\x0f\x11\x90\x19" } },
    .{ "utrans_unregisterID", MethodRecord{ .library = "icuin", .import = "utrans_unregisterID", .signature = "\x00\x02\x01\x0f\x07\x08" } },
    .{ "utrans_setFilter", MethodRecord{ .library = "icuin", .import = "utrans_setFilter", .signature = "\x00\x04\x01\x0f\x0f\x01\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "utrans_countAvailableIDs", MethodRecord{ .library = "icuin", .import = "utrans_countAvailableIDs", .signature = "\x00\x00\x08" } },
    .{ "utrans_openIDs", MethodRecord{ .library = "icuin", .import = "utrans_openIDs", .signature = "\x00\x01\x0f\x11\x90\x35\x0f\x11\x90\x19" } },
    .{ "utrans_trans", MethodRecord{ .library = "icuin", .import = "utrans_trans", .signature = "\x00\x06\x01\x0f\x0f\x01\x0f\x0f\x01\x0f\x11\x92\x69\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "utrans_transIncremental", MethodRecord{ .library = "icuin", .import = "utrans_transIncremental", .signature = "\x00\x05\x01\x0f\x0f\x01\x0f\x0f\x01\x0f\x11\x92\x69\x0f\x11\x92\x6d\x0f\x11\x90\x19" } },
    .{ "utrans_transUChars", MethodRecord{ .library = "icuin", .import = "utrans_transUChars", .signature = "\x00\x07\x01\x0f\x0f\x01\x0f\x07\x0f\x08\x08\x08\x0f\x08\x0f\x11\x90\x19" } },
    .{ "utrans_transIncrementalUChars", MethodRecord{ .library = "icuin", .import = "utrans_transIncrementalUChars", .signature = "\x00\x06\x01\x0f\x0f\x01\x0f\x07\x0f\x08\x08\x0f\x11\x92\x6d\x0f\x11\x90\x19" } },
    .{ "utrans_toRules", MethodRecord{ .library = "icuin", .import = "utrans_toRules", .signature = "\x00\x05\x08\x0f\x0f\x01\x04\x0f\x07\x08\x0f\x11\x90\x19" } },
    .{ "utrans_getSourceSet", MethodRecord{ .library = "icuin", .import = "utrans_getSourceSet", .signature = "\x00\x04\x0f\x11\x90\x9d\x0f\x0f\x01\x04\x0f\x11\x90\x9d\x0f\x11\x90\x19" } },
    .{ "GetDistanceOfClosestLanguageInList", MethodRecord{ .library = "bcp47mrm", .import = "GetDistanceOfClosestLanguageInList", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x03\x0f\x0d" } },
    .{ "IsWellFormedTag", MethodRecord{ .library = "bcp47mrm", .import = "IsWellFormedTag", .signature = "\x00\x01\x05\x11\x05" } },
    .{ "GetCalendarSupportedDateRange", MethodRecord{ .library = "KERNEL32", .import = "GetCalendarSupportedDateRange", .signature = "\x00\x03\x11\x59\x09\x0f\x11\x92\x71\x0f\x11\x92\x71" } },
    .{ "GetCalendarDateFormatEx", MethodRecord{ .library = "KERNEL32", .import = "GetCalendarDateFormatEx", .signature = "\x00\x06\x11\x59\x11\x05\x09\x0f\x11\x92\x71\x11\x05\x11\x05\x08" } },
    .{ "ConvertSystemTimeToCalDateTime", MethodRecord{ .library = "KERNEL32", .import = "ConvertSystemTimeToCalDateTime", .signature = "\x00\x03\x11\x59\x0f\x11\x86\x45\x09\x0f\x11\x92\x71" } },
    .{ "UpdateCalendarDayOfWeek", MethodRecord{ .library = "KERNEL32", .import = "UpdateCalendarDayOfWeek", .signature = "\x00\x01\x11\x59\x0f\x11\x92\x71" } },
    .{ "AdjustCalendarDate", MethodRecord{ .library = "KERNEL32", .import = "AdjustCalendarDate", .signature = "\x00\x03\x11\x59\x0f\x11\x92\x71\x11\x92\x75\x08" } },
    .{ "ConvertCalDateTimeToSystemTime", MethodRecord{ .library = "KERNEL32", .import = "ConvertCalDateTimeToSystemTime", .signature = "\x00\x02\x11\x59\x0f\x11\x92\x71\x0f\x11\x86\x45" } },
    .{ "IsCalendarLeapYear", MethodRecord{ .library = "KERNEL32", .import = "IsCalendarLeapYear", .signature = "\x00\x03\x11\x59\x09\x09\x09" } },
    .{ "FindStringOrdinal", MethodRecord{ .library = "KERNEL32", .import = "FindStringOrdinal", .signature = "\x00\x06\x08\x09\x11\x05\x08\x11\x05\x08\x11\x59" } },
    .{ "lstrcmpA", MethodRecord{ .library = "KERNEL32", .import = "lstrcmpA", .signature = "\x00\x02\x08\x11\x3d\x11\x3d" } },
    .{ "lstrcmpW", MethodRecord{ .library = "KERNEL32", .import = "lstrcmpW", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
    .{ "lstrcmpiA", MethodRecord{ .library = "KERNEL32", .import = "lstrcmpiA", .signature = "\x00\x02\x08\x11\x3d\x11\x3d" } },
    .{ "lstrcmpiW", MethodRecord{ .library = "KERNEL32", .import = "lstrcmpiW", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
    .{ "lstrcpynA", MethodRecord{ .library = "KERNEL32", .import = "lstrcpynA", .signature = "\x00\x03\x11\x3d\x11\x3d\x11\x3d\x08" } },
    .{ "lstrcpynW", MethodRecord{ .library = "KERNEL32", .import = "lstrcpynW", .signature = "\x00\x03\x11\x05\x11\x05\x11\x05\x08" } },
    .{ "lstrcpyA", MethodRecord{ .library = "KERNEL32", .import = "lstrcpyA", .signature = "\x00\x02\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "lstrcpyW", MethodRecord{ .library = "KERNEL32", .import = "lstrcpyW", .signature = "\x00\x02\x11\x05\x11\x05\x11\x05" } },
    .{ "lstrcatA", MethodRecord{ .library = "KERNEL32", .import = "lstrcatA", .signature = "\x00\x02\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "lstrcatW", MethodRecord{ .library = "KERNEL32", .import = "lstrcatW", .signature = "\x00\x02\x11\x05\x11\x05\x11\x05" } },
    .{ "lstrlenA", MethodRecord{ .library = "KERNEL32", .import = "lstrlenA", .signature = "\x00\x01\x08\x11\x3d" } },
    .{ "lstrlenW", MethodRecord{ .library = "KERNEL32", .import = "lstrlenW", .signature = "\x00\x01\x08\x11\x05" } },
    .{ "IsTextUnicode", MethodRecord{ .library = "ADVAPI32", .import = "IsTextUnicode", .signature = "\x00\x03\x11\x59\x0f\x01\x08\x0f\x11\x8f\x21" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x35d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HDC" },
        0x389 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "RECT" },
        0x3e9 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SIZE" },
        0x645 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SYSTEMTIME" },
        0xd4d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "ETO_OPTIONS" },
        0xdc9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "ABC" },
        0xef9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "FOLD_STRING_MAP_FLAGS" },
        0xefd => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "ENUM_DATE_FORMATS_FLAGS" },
        0xf01 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "TRANSLATE_CHARSET_INFO_FLAGS" },
        0xf05 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "TIME_FORMAT_FLAGS" },
        0xf09 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS" },
        0xf0d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "MULTI_BYTE_TO_WIDE_CHAR_FLAGS" },
        0xf11 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "COMPARE_STRING_FLAGS" },
        0xf15 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "IS_VALID_LOCALE_FLAGS" },
        0xf19 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "ENUM_SYSTEM_CODE_PAGES_FLAGS" },
        0xf1d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SCRIPT_IS_COMPLEX_FLAGS" },
        0xf21 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "IS_TEXT_UNICODE_RESULT" },
        0xf25 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "COMPARESTRING_RESULT" },
        0xf29 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "FONTSIGNATURE" },
        0xf2d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CHARSETINFO" },
        0xf31 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "NLSVERSIONINFO" },
        0xf35 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CPINFO" },
        0xf39 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CPINFOEXA" },
        0xf3d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CPINFOEXW" },
        0xf41 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "NUMBERFMTA" },
        0xf45 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "NUMBERFMTW" },
        0xf49 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CURRENCYFMTA" },
        0xf4d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CURRENCYFMTW" },
        0xf51 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CALINFO_ENUMPROCA" },
        0xf55 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CALINFO_ENUMPROCW" },
        0xf59 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CALINFO_ENUMPROCEXA" },
        0xf5d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CALINFO_ENUMPROCEXW" },
        0xf61 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "TIMEFMT_ENUMPROCA" },
        0xf65 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "TIMEFMT_ENUMPROCW" },
        0xf69 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "DATEFMT_ENUMPROCA" },
        0xf6d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "DATEFMT_ENUMPROCW" },
        0xf71 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "DATEFMT_ENUMPROCEXA" },
        0xf75 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "DATEFMT_ENUMPROCEXW" },
        0xf79 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SYSGEOTYPE" },
        0xf7d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "GEO_ENUMPROC" },
        0xf81 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "GEO_ENUMNAMEPROC" },
        0xf85 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SYSGEOCLASS" },
        0xf89 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "FILEMUIINFO" },
        0xf8d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "HSAVEDUILANGUAGES" },
        0xf91 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "LOCALE_ENUMPROCA" },
        0xf95 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "LOCALE_ENUMPROCW" },
        0xf99 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "LANGUAGEGROUP_ENUMPROCA" },
        0xf9d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "LANGUAGEGROUP_ENUMPROCW" },
        0xfa1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "LANGGROUPLOCALE_ENUMPROCA" },
        0xfa5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "LANGGROUPLOCALE_ENUMPROCW" },
        0xfa9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UILANGUAGE_ENUMPROCA" },
        0xfad => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UILANGUAGE_ENUMPROCW" },
        0xfb1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CODEPAGE_ENUMPROCA" },
        0xfb5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CODEPAGE_ENUMPROCW" },
        0xfb9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "NORM_FORM" },
        0xfbd => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "NLSVERSIONINFOEX" },
        0xfc1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CALINFO_ENUMPROCEXEX" },
        0xfc5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "DATEFMT_ENUMPROCEXEX" },
        0xfc9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "TIMEFMT_ENUMPROCEX" },
        0xfcd => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "LOCALE_ENUMPROCEX" },
        0xfd1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "MAPPING_ENUM_OPTIONS" },
        0xfd5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "MAPPING_SERVICE_INFO" },
        0xfd9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "MAPPING_OPTIONS" },
        0xfdd => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "MAPPING_PROPERTY_BAG" },
        0xfe1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SCRIPT_CONTROL" },
        0xfe5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SCRIPT_STATE" },
        0xfe9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SCRIPT_ITEM" },
        0xfed => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SCRIPT_ANALYSIS" },
        0xff1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SCRIPT_VISATTR" },
        0xff5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "GOFFSET" },
        0xff9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SCRIPT_LOGATTR" },
        0xffd => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SCRIPT_PROPERTIES" },
        0x1001 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SCRIPT_FONTPROPERTIES" },
        0x1005 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SCRIPT_TABDEF" },
        0x1009 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SCRIPT_DIGITSUBSTITUTE" },
        0x100d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "TEXTRANGE_PROPERTIES" },
        0x1011 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SCRIPT_CHARPROP" },
        0x1015 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "SCRIPT_GLYPHPROP" },
        0x1019 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UErrorCode" },
        0x101d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UTraceEntry" },
        0x1021 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UTraceExit" },
        0x1025 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UTraceData" },
        0x1029 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UScriptCode" },
        0x102d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UScriptUsage" },
        0x1031 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCharIterator" },
        0x1035 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UEnumeration" },
        0x1039 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "ULocAvailableType" },
        0x103d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "ULayoutType" },
        0x1041 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UAcceptResult" },
        0x1045 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UResourceBundle" },
        0x1049 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "ULocDataLocaleType" },
        0x104d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UResType" },
        0x1051 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "ULocaleDisplayNames" },
        0x1055 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDialectHandling" },
        0x1059 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDisplayContext" },
        0x105d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDisplayContextType" },
        0x1061 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCurrNameStyle" },
        0x1065 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCurrencyUsage" },
        0x1069 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCPMap" },
        0x106d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCPMapRangeOption" },
        0x1071 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCPMapValueFilter" },
        0x1075 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCPTrie" },
        0x1079 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCPTrieType" },
        0x107d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCPTrieValueWidth" },
        0x1081 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UMutableCPTrie" },
        0x1085 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UConverterFromUnicodeArgs" },
        0x1089 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UConverterCallbackReason" },
        0x108d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UConverterToUnicodeArgs" },
        0x1091 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UConverter" },
        0x1095 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UConverterPlatform" },
        0x1099 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UConverterType" },
        0x109d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "USet" },
        0x10a1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UConverterUnicodeSet" },
        0x10a5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UConverterToUCallback" },
        0x10a9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UConverterFromUCallback" },
        0x10ad => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UMemAllocFn" },
        0x10b1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UMemReallocFn" },
        0x10b5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UMemFreeFn" },
        0x10b9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UProperty" },
        0x10bd => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCharDirection" },
        0x10c1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCharEnumTypeRange" },
        0x10c5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UBlockCode" },
        0x10c9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCharNameChoice" },
        0x10cd => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UEnumCharNamesFn" },
        0x10d1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UPropertyNameChoice" },
        0x10d5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UBiDi" },
        0x10d9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UBiDiReorderingMode" },
        0x10dd => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UBiDiDirection" },
        0x10e1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UBiDiClassCallback" },
        0x10e5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UBiDiTransform" },
        0x10e9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UBiDiOrder" },
        0x10ed => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UBiDiMirroring" },
        0x10f1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UText" },
        0x10f5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "USetSpanCondition" },
        0x10f9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "USerializedSet" },
        0x10fd => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UNormalizer2" },
        0x1101 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UNormalization2Mode" },
        0x1105 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UNormalizationCheckResult" },
        0x1109 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UConverterSelector" },
        0x110d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UNESCAPE_CHAR_AT" },
        0x1111 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UBreakIterator" },
        0x1115 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCaseMap" },
        0x1119 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UStringPrepProfile" },
        0x111d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UStringPrepProfileType" },
        0x1121 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UParseError" },
        0x1125 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UIDNA" },
        0x1129 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UIDNAInfo" },
        0x112d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UBreakIteratorType" },
        0x1131 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "USystemTimeZoneType" },
        0x1135 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCalendarType" },
        0x1139 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCalendarDisplayNameType" },
        0x113d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCalendarAttribute" },
        0x1141 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCalendarDateFields" },
        0x1145 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCalendarLimitType" },
        0x1149 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCalendarWeekdayType" },
        0x114d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCalendarDaysOfWeek" },
        0x1151 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UTimeZoneTransitionType" },
        0x1155 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UTimeZoneLocalOption" },
        0x1159 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCollator" },
        0x115d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UColAttributeValue" },
        0x1161 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCollationResult" },
        0x1165 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UColBoundMode" },
        0x1169 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UColAttribute" },
        0x116d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UColReorderCode" },
        0x1171 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UColRuleOption" },
        0x1175 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCollationElements" },
        0x1179 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCharsetDetector" },
        0x117d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UCharsetMatch" },
        0x1181 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UFieldPositionIterator" },
        0x1185 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UFormattableType" },
        0x1189 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UConstrainedFieldPosition" },
        0x118d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UFormattedValue" },
        0x1191 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDateIntervalFormat" },
        0x1195 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UFormattedDateInterval" },
        0x1199 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UFieldPosition" },
        0x119d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UGenderInfo" },
        0x11a1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UGender" },
        0x11a5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UListFormatter" },
        0x11a9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UListFormatterType" },
        0x11ad => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UListFormatterWidth" },
        0x11b1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UFormattedList" },
        0x11b5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "ULocaleData" },
        0x11b9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "ULocaleDataExemplarSetType" },
        0x11bd => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "ULocaleDataDelimiterType" },
        0x11c1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UMeasurementSystem" },
        0x11c5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UNumberFormatStyle" },
        0x11c9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UNumberFormatAttribute" },
        0x11cd => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UNumberFormatTextAttribute" },
        0x11d1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UNumberFormatSymbol" },
        0x11d5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDateFormatField" },
        0x11d9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDateFormatStyle" },
        0x11dd => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDateFormatBooleanAttribute" },
        0x11e1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDateFormatSymbolType" },
        0x11e5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDateTimePatternMatchOptions" },
        0x11e9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDateTimePatternConflict" },
        0x11ed => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDateTimePatternField" },
        0x11f1 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDateTimePGDisplayWidth" },
        0x11f5 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDateFormatHourCycle" },
        0x11f9 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UNumberFormatter" },
        0x11fd => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UFormattedNumber" },
        0x1201 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UNumberRangeFormatter" },
        0x1205 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UNumberRangeCollapse" },
        0x1209 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UNumberRangeIdentityFallback" },
        0x120d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UFormattedNumberRange" },
        0x1211 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UNumberRangeIdentityResult" },
        0x1215 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UNumberingSystem" },
        0x1219 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UPluralRules" },
        0x121d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UPluralType" },
        0x1221 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "URegularExpression" },
        0x1225 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "URegexMatchCallback" },
        0x1229 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "URegexFindProgressCallback" },
        0x122d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "URegion" },
        0x1231 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "URegionType" },
        0x1235 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "URelativeDateTimeFormatter" },
        0x1239 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDateRelativeDateTimeFormatterStyle" },
        0x123d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UFormattedRelativeDateTime" },
        0x1241 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "URelativeDateTimeUnit" },
        0x1245 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UStringSearch" },
        0x1249 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "USearchAttribute" },
        0x124d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "USearchAttributeValue" },
        0x1251 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "USpoofChecker" },
        0x1255 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "URestrictionLevel" },
        0x1259 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "USpoofCheckResult" },
        0x125d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UDateTimeScale" },
        0x1261 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UTimeScaleValue" },
        0x1265 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UTransDirection" },
        0x1269 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UReplaceableCallbacks" },
        0x126d => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "UTransPosition" },
        0x1271 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CALDATETIME" },
        0x1275 => TypeRefEntry{ .namespace = "Windows.Win32.Globalization", .name = "CALDATETIME_DATEUNIT" },
        else => null,
    };
}

pub const MAP_COMPOSITE = 64;
pub const MAP_EXPAND_LIGATURES = 8192;
pub const MAP_FOLDCZONE = 16;
pub const MAP_FOLDDIGITS = 128;
pub const MAP_PRECOMPOSED = 32;
pub const DATE_SHORTDATE = 1;
pub const DATE_LONGDATE = 2;
pub const DATE_YEARMONTH = 8;
pub const DATE_MONTHDAY = 128;
pub const DATE_AUTOLAYOUT = 64;
pub const DATE_LTRREADING = 16;
pub const DATE_RTLREADING = 32;
pub const DATE_USE_ALT_CALENDAR = 4;
pub const TCI_SRCCHARSET = 1;
pub const TCI_SRCCODEPAGE = 2;
pub const TCI_SRCFONTSIG = 3;
pub const TCI_SRCLOCALE = 4096;
pub const TIME_NOMINUTESORSECONDS = 1;
pub const TIME_NOSECONDS = 2;
pub const TIME_NOTIMEMARKER = 4;
pub const TIME_FORCE24HOURFORMAT = 8;
pub const LGRPID_INSTALLED = 1;
pub const LGRPID_SUPPORTED = 2;
pub const MB_COMPOSITE = 2;
pub const MB_ERR_INVALID_CHARS = 8;
pub const MB_PRECOMPOSED = 1;
pub const MB_USEGLYPHCHARS = 4;
pub const LINGUISTIC_IGNORECASE = 16;
pub const LINGUISTIC_IGNOREDIACRITIC = 32;
pub const NORM_IGNORECASE = 1;
pub const NORM_IGNOREKANATYPE = 65536;
pub const NORM_IGNORENONSPACE = 2;
pub const NORM_IGNORESYMBOLS = 4;
pub const NORM_IGNOREWIDTH = 131072;
pub const NORM_LINGUISTIC_CASING = 134217728;
pub const SORT_DIGITSASNUMBERS = 8;
pub const SORT_STRINGSORT = 4096;
pub const LCID_INSTALLED = 1;
pub const LCID_SUPPORTED = 2;
pub const CP_INSTALLED = 1;
pub const CP_SUPPORTED = 2;
pub const SIC_ASCIIDIGIT = 2;
pub const SIC_COMPLEX = 1;
pub const SIC_NEUTRAL = 4;
pub const IS_TEXT_UNICODE_ASCII16 = 1;
pub const IS_TEXT_UNICODE_REVERSE_ASCII16 = 16;
pub const IS_TEXT_UNICODE_STATISTICS = 2;
pub const IS_TEXT_UNICODE_REVERSE_STATISTICS = 32;
pub const IS_TEXT_UNICODE_CONTROLS = 4;
pub const IS_TEXT_UNICODE_REVERSE_CONTROLS = 64;
pub const IS_TEXT_UNICODE_SIGNATURE = 8;
pub const IS_TEXT_UNICODE_REVERSE_SIGNATURE = 128;
pub const IS_TEXT_UNICODE_ILLEGAL_CHARS = 256;
pub const IS_TEXT_UNICODE_ODD_LENGTH = 512;
pub const IS_TEXT_UNICODE_NULL_BYTES = 4096;
pub const IS_TEXT_UNICODE_UNICODE_MASK = 15;
pub const IS_TEXT_UNICODE_REVERSE_MASK = 240;
pub const IS_TEXT_UNICODE_NOT_UNICODE_MASK = 3840;
pub const IS_TEXT_UNICODE_NOT_ASCII_MASK = 61440;
pub const CSTR_LESS_THAN = 1;
pub const CSTR_EQUAL = 2;
pub const CSTR_GREATER_THAN = 3;
pub const LANG_SYSTEM_DEFAULT = 2048;
pub const LANG_USER_DEFAULT = 1024;
pub const LOCALE_SYSTEM_DEFAULT = 2048;
pub const LOCALE_USER_DEFAULT = 1024;
pub const LOCALE_CUSTOM_DEFAULT = 3072;
pub const LOCALE_CUSTOM_UNSPECIFIED = 4096;
pub const LOCALE_CUSTOM_UI_DEFAULT = 5120;
pub const LOCALE_NEUTRAL = 0;
pub const LOCALE_INVARIANT = 127;
pub const ALL_SERVICE_TYPES = 0;
pub const HIGHLEVEL_SERVICE_TYPES = 1;
pub const LOWLEVEL_SERVICE_TYPES = 2;
pub const ALL_SERVICES = 0;
pub const ONLINE_SERVICES = 1;
pub const OFFLINE_SERVICES = 2;
pub const MAX_LEADBYTES = 12;
pub const MAX_DEFAULTCHAR = 2;
pub const HIGH_SURROGATE_START = 55296;
pub const HIGH_SURROGATE_END = 56319;
pub const LOW_SURROGATE_START = 56320;
pub const LOW_SURROGATE_END = 57343;
pub const WC_COMPOSITECHECK = 512;
pub const WC_DISCARDNS = 16;
pub const WC_SEPCHARS = 32;
pub const WC_DEFAULTCHAR = 64;
pub const WC_ERR_INVALID_CHARS = 128;
pub const WC_NO_BEST_FIT_CHARS = 1024;
pub const CT_CTYPE1 = 1;
pub const CT_CTYPE2 = 2;
pub const CT_CTYPE3 = 4;
pub const C1_UPPER = 1;
pub const C1_LOWER = 2;
pub const C1_DIGIT = 4;
pub const C1_SPACE = 8;
pub const C1_PUNCT = 16;
pub const C1_CNTRL = 32;
pub const C1_BLANK = 64;
pub const C1_XDIGIT = 128;
pub const C1_ALPHA = 256;
pub const C1_DEFINED = 512;
pub const C2_LEFTTORIGHT = 1;
pub const C2_RIGHTTOLEFT = 2;
pub const C2_EUROPENUMBER = 3;
pub const C2_EUROPESEPARATOR = 4;
pub const C2_EUROPETERMINATOR = 5;
pub const C2_ARABICNUMBER = 6;
pub const C2_COMMONSEPARATOR = 7;
pub const C2_BLOCKSEPARATOR = 8;
pub const C2_SEGMENTSEPARATOR = 9;
pub const C2_WHITESPACE = 10;
pub const C2_OTHERNEUTRAL = 11;
pub const C2_NOTAPPLICABLE = 0;
pub const C3_NONSPACING = 1;
pub const C3_DIACRITIC = 2;
pub const C3_VOWELMARK = 4;
pub const C3_SYMBOL = 8;
pub const C3_KATAKANA = 16;
pub const C3_HIRAGANA = 32;
pub const C3_HALFWIDTH = 64;
pub const C3_FULLWIDTH = 128;
pub const C3_IDEOGRAPH = 256;
pub const C3_KASHIDA = 512;
pub const C3_LEXICAL = 1024;
pub const C3_HIGHSURROGATE = 2048;
pub const C3_LOWSURROGATE = 4096;
pub const C3_ALPHA = 32768;
pub const C3_NOTAPPLICABLE = 0;
pub const LCMAP_LOWERCASE = 256;
pub const LCMAP_UPPERCASE = 512;
pub const LCMAP_TITLECASE = 768;
pub const LCMAP_SORTKEY = 1024;
pub const LCMAP_BYTEREV = 2048;
pub const LCMAP_HIRAGANA = 1048576;
pub const LCMAP_KATAKANA = 2097152;
pub const LCMAP_HALFWIDTH = 4194304;
pub const LCMAP_FULLWIDTH = 8388608;
pub const LCMAP_LINGUISTIC_CASING = 16777216;
pub const LCMAP_SIMPLIFIED_CHINESE = 33554432;
pub const LCMAP_TRADITIONAL_CHINESE = 67108864;
pub const LCMAP_SORTHANDLE = 536870912;
pub const LCMAP_HASH = 262144;
pub const FIND_STARTSWITH = 1048576;
pub const FIND_ENDSWITH = 2097152;
pub const FIND_FROMSTART = 4194304;
pub const FIND_FROMEND = 8388608;
pub const LCID_ALTERNATE_SORTS = 4;
pub const LOCALE_ALL = 0;
pub const LOCALE_WINDOWS = 1;
pub const LOCALE_SUPPLEMENTAL = 2;
pub const LOCALE_ALTERNATE_SORTS = 4;
pub const LOCALE_REPLACEMENT = 8;
pub const LOCALE_NEUTRALDATA = 16;
pub const LOCALE_SPECIFICDATA = 32;
pub const CP_ACP = 0;
pub const CP_OEMCP = 1;
pub const CP_MACCP = 2;
pub const CP_THREAD_ACP = 3;
pub const CP_SYMBOL = 42;
pub const CP_UTF7 = 65000;
pub const CP_UTF8 = 65001;
pub const CTRY_DEFAULT = 0;
pub const CTRY_ALBANIA = 355;
pub const CTRY_ALGERIA = 213;
pub const CTRY_ARGENTINA = 54;
pub const CTRY_ARMENIA = 374;
pub const CTRY_AUSTRALIA = 61;
pub const CTRY_AUSTRIA = 43;
pub const CTRY_AZERBAIJAN = 994;
pub const CTRY_BAHRAIN = 973;
pub const CTRY_BELARUS = 375;
pub const CTRY_BELGIUM = 32;
pub const CTRY_BELIZE = 501;
pub const CTRY_BOLIVIA = 591;
pub const CTRY_BRAZIL = 55;
pub const CTRY_BRUNEI_DARUSSALAM = 673;
pub const CTRY_BULGARIA = 359;
pub const CTRY_CANADA = 2;
pub const CTRY_CARIBBEAN = 1;
pub const CTRY_CHILE = 56;
pub const CTRY_COLOMBIA = 57;
pub const CTRY_COSTA_RICA = 506;
pub const CTRY_CROATIA = 385;
pub const CTRY_CZECH = 420;
pub const CTRY_DENMARK = 45;
pub const CTRY_DOMINICAN_REPUBLIC = 1;
pub const CTRY_ECUADOR = 593;
pub const CTRY_EGYPT = 20;
pub const CTRY_EL_SALVADOR = 503;
pub const CTRY_ESTONIA = 372;
pub const CTRY_FAEROE_ISLANDS = 298;
pub const CTRY_FINLAND = 358;
pub const CTRY_FRANCE = 33;
pub const CTRY_GEORGIA = 995;
pub const CTRY_GERMANY = 49;
pub const CTRY_GREECE = 30;
pub const CTRY_GUATEMALA = 502;
pub const CTRY_HONDURAS = 504;
pub const CTRY_HONG_KONG = 852;
pub const CTRY_HUNGARY = 36;
pub const CTRY_ICELAND = 354;
pub const CTRY_INDIA = 91;
pub const CTRY_INDONESIA = 62;
pub const CTRY_IRAN = 981;
pub const CTRY_IRAQ = 964;
pub const CTRY_IRELAND = 353;
pub const CTRY_ISRAEL = 972;
pub const CTRY_ITALY = 39;
pub const CTRY_JAMAICA = 1;
pub const CTRY_JAPAN = 81;
pub const CTRY_JORDAN = 962;
pub const CTRY_KAZAKSTAN = 7;
pub const CTRY_KENYA = 254;
pub const CTRY_KUWAIT = 965;
pub const CTRY_KYRGYZSTAN = 996;
pub const CTRY_LATVIA = 371;
pub const CTRY_LEBANON = 961;
pub const CTRY_LIBYA = 218;
pub const CTRY_LIECHTENSTEIN = 41;
pub const CTRY_LITHUANIA = 370;
pub const CTRY_LUXEMBOURG = 352;
pub const CTRY_MACAU = 853;
pub const CTRY_MACEDONIA = 389;
pub const CTRY_MALAYSIA = 60;
pub const CTRY_MALDIVES = 960;
pub const CTRY_MEXICO = 52;
pub const CTRY_MONACO = 33;
pub const CTRY_MONGOLIA = 976;
pub const CTRY_MOROCCO = 212;
pub const CTRY_NETHERLANDS = 31;
pub const CTRY_NEW_ZEALAND = 64;
pub const CTRY_NICARAGUA = 505;
pub const CTRY_NORWAY = 47;
pub const CTRY_OMAN = 968;
pub const CTRY_PAKISTAN = 92;
pub const CTRY_PANAMA = 507;
pub const CTRY_PARAGUAY = 595;
pub const CTRY_PERU = 51;
pub const CTRY_PHILIPPINES = 63;
pub const CTRY_POLAND = 48;
pub const CTRY_PORTUGAL = 351;
pub const CTRY_PRCHINA = 86;
pub const CTRY_PUERTO_RICO = 1;
pub const CTRY_QATAR = 974;
pub const CTRY_ROMANIA = 40;
pub const CTRY_RUSSIA = 7;
pub const CTRY_SAUDI_ARABIA = 966;
pub const CTRY_SERBIA = 381;
pub const CTRY_SINGAPORE = 65;
pub const CTRY_SLOVAK = 421;
pub const CTRY_SLOVENIA = 386;
pub const CTRY_SOUTH_AFRICA = 27;
pub const CTRY_SOUTH_KOREA = 82;
pub const CTRY_SPAIN = 34;
pub const CTRY_SWEDEN = 46;
pub const CTRY_SWITZERLAND = 41;
pub const CTRY_SYRIA = 963;
pub const CTRY_TAIWAN = 886;
pub const CTRY_TATARSTAN = 7;
pub const CTRY_THAILAND = 66;
pub const CTRY_TRINIDAD_Y_TOBAGO = 1;
pub const CTRY_TUNISIA = 216;
pub const CTRY_TURKEY = 90;
pub const CTRY_UAE = 971;
pub const CTRY_UKRAINE = 380;
pub const CTRY_UNITED_KINGDOM = 44;
pub const CTRY_UNITED_STATES = 1;
pub const CTRY_URUGUAY = 598;
pub const CTRY_UZBEKISTAN = 7;
pub const CTRY_VENEZUELA = 58;
pub const CTRY_VIET_NAM = 84;
pub const CTRY_YEMEN = 967;
pub const CTRY_ZIMBABWE = 263;
pub const LOCALE_NOUSEROVERRIDE = 2147483648;
pub const LOCALE_USE_CP_ACP = 1073741824;
pub const LOCALE_RETURN_NUMBER = 536870912;
pub const LOCALE_RETURN_GENITIVE_NAMES = 268435456;
pub const LOCALE_ALLOW_NEUTRAL_NAMES = 134217728;
pub const LOCALE_SLOCALIZEDDISPLAYNAME = 2;
pub const LOCALE_SENGLISHDISPLAYNAME = 114;
pub const LOCALE_SNATIVEDISPLAYNAME = 115;
pub const LOCALE_SLOCALIZEDLANGUAGENAME = 111;
pub const LOCALE_SENGLISHLANGUAGENAME = 4097;
pub const LOCALE_SNATIVELANGUAGENAME = 4;
pub const LOCALE_SLOCALIZEDCOUNTRYNAME = 6;
pub const LOCALE_SENGLISHCOUNTRYNAME = 4098;
pub const LOCALE_SNATIVECOUNTRYNAME = 8;
pub const LOCALE_IDIALINGCODE = 5;
pub const LOCALE_SLIST = 12;
pub const LOCALE_IMEASURE = 13;
pub const LOCALE_SDECIMAL = 14;
pub const LOCALE_STHOUSAND = 15;
pub const LOCALE_SGROUPING = 16;
pub const LOCALE_IDIGITS = 17;
pub const LOCALE_ILZERO = 18;
pub const LOCALE_INEGNUMBER = 4112;
pub const LOCALE_SNATIVEDIGITS = 19;
pub const LOCALE_SCURRENCY = 20;
pub const LOCALE_SINTLSYMBOL = 21;
pub const LOCALE_SMONDECIMALSEP = 22;
pub const LOCALE_SMONTHOUSANDSEP = 23;
pub const LOCALE_SMONGROUPING = 24;
pub const LOCALE_ICURRDIGITS = 25;
pub const LOCALE_ICURRENCY = 27;
pub const LOCALE_INEGCURR = 28;
pub const LOCALE_SSHORTDATE = 31;
pub const LOCALE_SLONGDATE = 32;
pub const LOCALE_STIMEFORMAT = 4099;
pub const LOCALE_SAM = 40;
pub const LOCALE_SPM = 41;
pub const LOCALE_ICALENDARTYPE = 4105;
pub const LOCALE_IOPTIONALCALENDAR = 4107;
pub const LOCALE_IFIRSTDAYOFWEEK = 4108;
pub const LOCALE_IFIRSTWEEKOFYEAR = 4109;
pub const LOCALE_SDAYNAME1 = 42;
pub const LOCALE_SDAYNAME2 = 43;
pub const LOCALE_SDAYNAME3 = 44;
pub const LOCALE_SDAYNAME4 = 45;
pub const LOCALE_SDAYNAME5 = 46;
pub const LOCALE_SDAYNAME6 = 47;
pub const LOCALE_SDAYNAME7 = 48;
pub const LOCALE_SABBREVDAYNAME1 = 49;
pub const LOCALE_SABBREVDAYNAME2 = 50;
pub const LOCALE_SABBREVDAYNAME3 = 51;
pub const LOCALE_SABBREVDAYNAME4 = 52;
pub const LOCALE_SABBREVDAYNAME5 = 53;
pub const LOCALE_SABBREVDAYNAME6 = 54;
pub const LOCALE_SABBREVDAYNAME7 = 55;
pub const LOCALE_SMONTHNAME1 = 56;
pub const LOCALE_SMONTHNAME2 = 57;
pub const LOCALE_SMONTHNAME3 = 58;
pub const LOCALE_SMONTHNAME4 = 59;
pub const LOCALE_SMONTHNAME5 = 60;
pub const LOCALE_SMONTHNAME6 = 61;
pub const LOCALE_SMONTHNAME7 = 62;
pub const LOCALE_SMONTHNAME8 = 63;
pub const LOCALE_SMONTHNAME9 = 64;
pub const LOCALE_SMONTHNAME10 = 65;
pub const LOCALE_SMONTHNAME11 = 66;
pub const LOCALE_SMONTHNAME12 = 67;
pub const LOCALE_SMONTHNAME13 = 4110;
pub const LOCALE_SABBREVMONTHNAME1 = 68;
pub const LOCALE_SABBREVMONTHNAME2 = 69;
pub const LOCALE_SABBREVMONTHNAME3 = 70;
pub const LOCALE_SABBREVMONTHNAME4 = 71;
pub const LOCALE_SABBREVMONTHNAME5 = 72;
pub const LOCALE_SABBREVMONTHNAME6 = 73;
pub const LOCALE_SABBREVMONTHNAME7 = 74;
pub const LOCALE_SABBREVMONTHNAME8 = 75;
pub const LOCALE_SABBREVMONTHNAME9 = 76;
pub const LOCALE_SABBREVMONTHNAME10 = 77;
pub const LOCALE_SABBREVMONTHNAME11 = 78;
pub const LOCALE_SABBREVMONTHNAME12 = 79;
pub const LOCALE_SABBREVMONTHNAME13 = 4111;
pub const LOCALE_SPOSITIVESIGN = 80;
pub const LOCALE_SNEGATIVESIGN = 81;
pub const LOCALE_IPOSSIGNPOSN = 82;
pub const LOCALE_INEGSIGNPOSN = 83;
pub const LOCALE_IPOSSYMPRECEDES = 84;
pub const LOCALE_IPOSSEPBYSPACE = 85;
pub const LOCALE_INEGSYMPRECEDES = 86;
pub const LOCALE_INEGSEPBYSPACE = 87;
pub const LOCALE_FONTSIGNATURE = 88;
pub const LOCALE_SISO639LANGNAME = 89;
pub const LOCALE_SISO3166CTRYNAME = 90;
pub const LOCALE_IPAPERSIZE = 4106;
pub const LOCALE_SENGCURRNAME = 4103;
pub const LOCALE_SNATIVECURRNAME = 4104;
pub const LOCALE_SYEARMONTH = 4102;
pub const LOCALE_SSORTNAME = 4115;
pub const LOCALE_IDIGITSUBSTITUTION = 4116;
pub const LOCALE_SNAME = 92;
pub const LOCALE_SDURATION = 93;
pub const LOCALE_SSHORTESTDAYNAME1 = 96;
pub const LOCALE_SSHORTESTDAYNAME2 = 97;
pub const LOCALE_SSHORTESTDAYNAME3 = 98;
pub const LOCALE_SSHORTESTDAYNAME4 = 99;
pub const LOCALE_SSHORTESTDAYNAME5 = 100;
pub const LOCALE_SSHORTESTDAYNAME6 = 101;
pub const LOCALE_SSHORTESTDAYNAME7 = 102;
pub const LOCALE_SISO639LANGNAME2 = 103;
pub const LOCALE_SISO3166CTRYNAME2 = 104;
pub const LOCALE_SNAN = 105;
pub const LOCALE_SPOSINFINITY = 106;
pub const LOCALE_SNEGINFINITY = 107;
pub const LOCALE_SSCRIPTS = 108;
pub const LOCALE_SPARENT = 109;
pub const LOCALE_SCONSOLEFALLBACKNAME = 110;
pub const LOCALE_IREADINGLAYOUT = 112;
pub const LOCALE_INEUTRAL = 113;
pub const LOCALE_INEGATIVEPERCENT = 116;
pub const LOCALE_IPOSITIVEPERCENT = 117;
pub const LOCALE_SPERCENT = 118;
pub const LOCALE_SPERMILLE = 119;
pub const LOCALE_SMONTHDAY = 120;
pub const LOCALE_SSHORTTIME = 121;
pub const LOCALE_SOPENTYPELANGUAGETAG = 122;
pub const LOCALE_SSORTLOCALE = 123;
pub const LOCALE_SRELATIVELONGDATE = 124;
pub const LOCALE_ICONSTRUCTEDLOCALE = 125;
pub const LOCALE_SSHORTESTAM = 126;
pub const LOCALE_SSHORTESTPM = 127;
pub const LOCALE_IUSEUTF8LEGACYACP = 1638;
pub const LOCALE_IUSEUTF8LEGACYOEMCP = 2457;
pub const LOCALE_IDEFAULTCODEPAGE = 11;
pub const LOCALE_IDEFAULTANSICODEPAGE = 4100;
pub const LOCALE_IDEFAULTMACCODEPAGE = 4113;
pub const LOCALE_IDEFAULTEBCDICCODEPAGE = 4114;
pub const LOCALE_ILANGUAGE = 1;
pub const LOCALE_SABBREVLANGNAME = 3;
pub const LOCALE_SABBREVCTRYNAME = 7;
pub const LOCALE_IGEOID = 91;
pub const LOCALE_IDEFAULTLANGUAGE = 9;
pub const LOCALE_IDEFAULTCOUNTRY = 10;
pub const LOCALE_IINTLCURRDIGITS = 26;
pub const LOCALE_SDATE = 29;
pub const LOCALE_STIME = 30;
pub const LOCALE_IDATE = 33;
pub const LOCALE_ILDATE = 34;
pub const LOCALE_ITIME = 35;
pub const LOCALE_ITIMEMARKPOSN = 4101;
pub const LOCALE_ICENTURY = 36;
pub const LOCALE_ITLZERO = 37;
pub const LOCALE_IDAYLZERO = 38;
pub const LOCALE_IMONLZERO = 39;
pub const LOCALE_SKEYBOARDSTOINSTALL = 94;
pub const LOCALE_SLANGUAGE = 2;
pub const LOCALE_SLANGDISPLAYNAME = 111;
pub const LOCALE_SENGLANGUAGE = 4097;
pub const LOCALE_SNATIVELANGNAME = 4;
pub const LOCALE_SCOUNTRY = 6;
pub const LOCALE_SENGCOUNTRY = 4098;
pub const LOCALE_SNATIVECTRYNAME = 8;
pub const LOCALE_ICOUNTRY = 5;
pub const LOCALE_S1159 = 40;
pub const LOCALE_S2359 = 41;
pub const CAL_NOUSEROVERRIDE = 2147483648;
pub const CAL_USE_CP_ACP = 1073741824;
pub const CAL_RETURN_NUMBER = 536870912;
pub const CAL_RETURN_GENITIVE_NAMES = 268435456;
pub const CAL_ICALINTVALUE = 1;
pub const CAL_SCALNAME = 2;
pub const CAL_IYEAROFFSETRANGE = 3;
pub const CAL_SERASTRING = 4;
pub const CAL_SSHORTDATE = 5;
pub const CAL_SLONGDATE = 6;
pub const CAL_SDAYNAME1 = 7;
pub const CAL_SDAYNAME2 = 8;
pub const CAL_SDAYNAME3 = 9;
pub const CAL_SDAYNAME4 = 10;
pub const CAL_SDAYNAME5 = 11;
pub const CAL_SDAYNAME6 = 12;
pub const CAL_SDAYNAME7 = 13;
pub const CAL_SABBREVDAYNAME1 = 14;
pub const CAL_SABBREVDAYNAME2 = 15;
pub const CAL_SABBREVDAYNAME3 = 16;
pub const CAL_SABBREVDAYNAME4 = 17;
pub const CAL_SABBREVDAYNAME5 = 18;
pub const CAL_SABBREVDAYNAME6 = 19;
pub const CAL_SABBREVDAYNAME7 = 20;
pub const CAL_SMONTHNAME1 = 21;
pub const CAL_SMONTHNAME2 = 22;
pub const CAL_SMONTHNAME3 = 23;
pub const CAL_SMONTHNAME4 = 24;
pub const CAL_SMONTHNAME5 = 25;
pub const CAL_SMONTHNAME6 = 26;
pub const CAL_SMONTHNAME7 = 27;
pub const CAL_SMONTHNAME8 = 28;
pub const CAL_SMONTHNAME9 = 29;
pub const CAL_SMONTHNAME10 = 30;
pub const CAL_SMONTHNAME11 = 31;
pub const CAL_SMONTHNAME12 = 32;
pub const CAL_SMONTHNAME13 = 33;
pub const CAL_SABBREVMONTHNAME1 = 34;
pub const CAL_SABBREVMONTHNAME2 = 35;
pub const CAL_SABBREVMONTHNAME3 = 36;
pub const CAL_SABBREVMONTHNAME4 = 37;
pub const CAL_SABBREVMONTHNAME5 = 38;
pub const CAL_SABBREVMONTHNAME6 = 39;
pub const CAL_SABBREVMONTHNAME7 = 40;
pub const CAL_SABBREVMONTHNAME8 = 41;
pub const CAL_SABBREVMONTHNAME9 = 42;
pub const CAL_SABBREVMONTHNAME10 = 43;
pub const CAL_SABBREVMONTHNAME11 = 44;
pub const CAL_SABBREVMONTHNAME12 = 45;
pub const CAL_SABBREVMONTHNAME13 = 46;
pub const CAL_SYEARMONTH = 47;
pub const CAL_ITWODIGITYEARMAX = 48;
pub const CAL_SSHORTESTDAYNAME1 = 49;
pub const CAL_SSHORTESTDAYNAME2 = 50;
pub const CAL_SSHORTESTDAYNAME3 = 51;
pub const CAL_SSHORTESTDAYNAME4 = 52;
pub const CAL_SSHORTESTDAYNAME5 = 53;
pub const CAL_SSHORTESTDAYNAME6 = 54;
pub const CAL_SSHORTESTDAYNAME7 = 55;
pub const CAL_SMONTHDAY = 56;
pub const CAL_SABBREVERASTRING = 57;
pub const CAL_SRELATIVELONGDATE = 58;
pub const CAL_SENGLISHERANAME = 59;
pub const CAL_SENGLISHABBREVERANAME = 60;
pub const CAL_SJAPANESEERAFIRSTYEAR = 61;
pub const ENUM_ALL_CALENDARS = 4294967295;
pub const CAL_GREGORIAN = 1;
pub const CAL_GREGORIAN_US = 2;
pub const CAL_JAPAN = 3;
pub const CAL_TAIWAN = 4;
pub const CAL_KOREA = 5;
pub const CAL_HIJRI = 6;
pub const CAL_THAI = 7;
pub const CAL_HEBREW = 8;
pub const CAL_GREGORIAN_ME_FRENCH = 9;
pub const CAL_GREGORIAN_ARABIC = 10;
pub const CAL_GREGORIAN_XLIT_ENGLISH = 11;
pub const CAL_GREGORIAN_XLIT_FRENCH = 12;
pub const CAL_PERSIAN = 22;
pub const CAL_UMALQURA = 23;
pub const LGRPID_WESTERN_EUROPE = 1;
pub const LGRPID_CENTRAL_EUROPE = 2;
pub const LGRPID_BALTIC = 3;
pub const LGRPID_GREEK = 4;
pub const LGRPID_CYRILLIC = 5;
pub const LGRPID_TURKIC = 6;
pub const LGRPID_TURKISH = 6;
pub const LGRPID_JAPANESE = 7;
pub const LGRPID_KOREAN = 8;
pub const LGRPID_TRADITIONAL_CHINESE = 9;
pub const LGRPID_SIMPLIFIED_CHINESE = 10;
pub const LGRPID_THAI = 11;
pub const LGRPID_HEBREW = 12;
pub const LGRPID_ARABIC = 13;
pub const LGRPID_VIETNAMESE = 14;
pub const LGRPID_INDIC = 15;
pub const LGRPID_GEORGIAN = 16;
pub const LGRPID_ARMENIAN = 17;
pub const MUI_LANGUAGE_ID = 4;
pub const MUI_LANGUAGE_NAME = 8;
pub const MUI_MERGE_SYSTEM_FALLBACK = 16;
pub const MUI_MERGE_USER_FALLBACK = 32;
pub const MUI_THREAD_LANGUAGES = 64;
pub const MUI_CONSOLE_FILTER = 256;
pub const MUI_COMPLEX_SCRIPT_FILTER = 512;
pub const MUI_RESET_FILTERS = 1;
pub const MUI_USER_PREFERRED_UI_LANGUAGES = 16;
pub const MUI_USE_INSTALLED_LANGUAGES = 32;
pub const MUI_USE_SEARCH_ALL_LANGUAGES = 64;
pub const MUI_LANG_NEUTRAL_PE_FILE = 256;
pub const MUI_NON_LANG_NEUTRAL_FILE = 512;
pub const MUI_MACHINE_LANGUAGE_SETTINGS = 1024;
pub const MUI_FILETYPE_NOT_LANGUAGE_NEUTRAL = 1;
pub const MUI_FILETYPE_LANGUAGE_NEUTRAL_MAIN = 2;
pub const MUI_FILETYPE_LANGUAGE_NEUTRAL_MUI = 4;
pub const MUI_QUERY_TYPE = 1;
pub const MUI_QUERY_CHECKSUM = 2;
pub const MUI_QUERY_LANGUAGE_NAME = 4;
pub const MUI_QUERY_RESOURCE_TYPES = 8;
pub const MUI_FILEINFO_VERSION = 1;
pub const MUI_FULL_LANGUAGE = 1;
pub const MUI_PARTIAL_LANGUAGE = 2;
pub const MUI_LIP_LANGUAGE = 4;
pub const MUI_LANGUAGE_INSTALLED = 32;
pub const MUI_LANGUAGE_LICENSED = 64;
pub const GEOID_NOT_AVAILABLE = -1;
pub const SORTING_PARADIGM_NLS = 0;
pub const SORTING_PARADIGM_ICU = 16777216;
pub const IDN_ALLOW_UNASSIGNED = 1;
pub const IDN_USE_STD3_ASCII_RULES = 2;
pub const IDN_EMAIL_ADDRESS = 4;
pub const IDN_RAW_PUNYCODE = 8;
pub const VS_ALLOW_LATIN = 1;
pub const GSS_ALLOW_INHERITED_COMMON = 1;
pub const MUI_FORMAT_REG_COMPAT = 1;
pub const MUI_FORMAT_INF_COMPAT = 2;
pub const MUI_VERIFY_FILE_EXISTS = 4;
pub const MUI_SKIP_STRING_CACHE = 8;
pub const MUI_IMMUTABLE_LOOKUP = 16;
pub const MIN_SPELLING_NTDDI = 100794368;
pub const SCRIPT_UNDEFINED = 0;
pub const USP_E_SCRIPT_NOT_IN_FONT = -2147220992;
pub const SGCM_RTL = 1;
pub const SSA_PASSWORD = 1;
pub const SSA_TAB = 2;
pub const SSA_CLIP = 4;
pub const SSA_FIT = 8;
pub const SSA_DZWG = 16;
pub const SSA_FALLBACK = 32;
pub const SSA_BREAK = 64;
pub const SSA_GLYPHS = 128;
pub const SSA_RTL = 256;
pub const SSA_GCP = 512;
pub const SSA_HOTKEY = 1024;
pub const SSA_METAFILE = 2048;
pub const SSA_LINK = 4096;
pub const SSA_HIDEHOTKEY = 8192;
pub const SSA_HOTKEYONLY = 9216;
pub const SSA_FULLMEASURE = 67108864;
pub const SSA_LPKANSIFALLBACK = 134217728;
pub const SSA_PIDX = 268435456;
pub const SSA_LAYOUTRTL = 536870912;
pub const SSA_DONTGLYPH = 1073741824;
pub const SSA_NOKASHIDA = 2147483648;
pub const SCRIPT_DIGITSUBSTITUTE_CONTEXT = 0;
pub const SCRIPT_DIGITSUBSTITUTE_NONE = 1;
pub const SCRIPT_DIGITSUBSTITUTE_NATIONAL = 2;
pub const SCRIPT_DIGITSUBSTITUTE_TRADITIONAL = 3;
pub const UNISCRIBE_OPENTYPE = 256;
pub const SCRIPT_TAG_UNKNOWN = 0;
pub const MUI_LANGUAGE_EXACT = 16;
pub const NLS_CP_CPINFO = 268435456;
pub const NLS_CP_MBTOWC = 1073741824;
pub const NLS_CP_WCTOMB = 2147483648;
pub const U_DISABLE_RENAMING = 1;
pub const U_SHOW_CPLUSPLUS_API = 0;
pub const U_DEFAULT_SHOW_DRAFT = 0;
pub const U_HIDE_DRAFT_API = 1;
pub const U_HIDE_DEPRECATED_API = 1;
pub const U_HIDE_OBSOLETE_API = 1;
pub const U_HIDE_INTERNAL_API = 1;
pub const U_NO_DEFAULT_INCLUDE_UTF_HEADERS = 1;
pub const U_DEBUG = 1;
pub const UCLN_NO_AUTO_CLEANUP = 1;
pub const U_OVERRIDE_CXX_ALLOCATION = 1;
pub const U_ENABLE_TRACING = 0;
pub const UCONFIG_ENABLE_PLUGINS = 0;
pub const U_ENABLE_DYLOAD = 1;
pub const U_CHECK_DYLOAD = 1;
pub const U_HAVE_LIB_SUFFIX = 1;
pub const UCONFIG_ONLY_COLLATION = 0;
pub const UCONFIG_NO_BREAK_ITERATION = 1;
pub const UCONFIG_NO_IDNA = 1;
pub const UCONFIG_NO_FORMATTING = 1;
pub const UCONFIG_NO_TRANSLITERATION = 1;
pub const UCONFIG_NO_REGULAR_EXPRESSIONS = 1;
pub const UCONFIG_NO_FILE_IO = 0;
pub const UCONFIG_NO_CONVERSION = 0;
pub const UCONFIG_NO_LEGACY_CONVERSION = 1;
pub const UCONFIG_ONLY_HTML_CONVERSION = 0;
pub const UCONFIG_NO_NORMALIZATION = 0;
pub const UCONFIG_NO_COLLATION = 1;
pub const UCONFIG_NO_SERVICE = 0;
pub const UCONFIG_HAVE_PARSEALLINPUT = 1;
pub const UCONFIG_NO_FILTERED_BREAK_ITERATION = 0;
pub const U_PF_UNKNOWN = 0;
pub const U_PF_WINDOWS = 1000;
pub const U_PF_MINGW = 1800;
pub const U_PF_CYGWIN = 1900;
pub const U_PF_HPUX = 2100;
pub const U_PF_SOLARIS = 2600;
pub const U_PF_BSD = 3000;
pub const U_PF_AIX = 3100;
pub const U_PF_IRIX = 3200;
pub const U_PF_DARWIN = 3500;
pub const U_PF_IPHONE = 3550;
pub const U_PF_QNX = 3700;
pub const U_PF_LINUX = 4000;
pub const U_PF_BROWSER_NATIVE_CLIENT = 4020;
pub const U_PF_ANDROID = 4050;
pub const U_PF_FUCHSIA = 4100;
pub const U_PF_EMSCRIPTEN = 5010;
pub const U_PF_OS390 = 9000;
pub const U_PF_OS400 = 9400;
pub const U_PLATFORM = 1800;
pub const U_PLATFORM_USES_ONLY_WIN32_API = 1;
pub const U_PLATFORM_HAS_WIN32_API = 1;
pub const U_PLATFORM_IMPLEMENTS_POSIX = 0;
pub const U_PLATFORM_IS_LINUX_BASED = 1;
pub const U_PLATFORM_IS_DARWIN_BASED = 1;
pub const U_HAVE_STDINT_H = 1;
pub const U_HAVE_INTTYPES_H = 1;
pub const U_GCC_MAJOR_MINOR = 0;
pub const U_IS_BIG_ENDIAN = 0;
pub const U_HAVE_PLACEMENT_NEW = 0;
pub const U_HAVE_DEBUG_LOCATION_NEW = 1;
pub const U_CPLUSPLUS_VERSION = 0;
pub const U_ASCII_FAMILY = 0;
pub const U_EBCDIC_FAMILY = 1;
pub const U_CHARSET_FAMILY = 1;
pub const U_CHARSET_IS_UTF8 = 1;
pub const U_HAVE_WCHAR_H = 0;
pub const U_SIZEOF_WCHAR_T = 1;
pub const U_HAVE_WCSCPY = 0;
pub const U_HAVE_CHAR16_T = 1;
pub const U_DEFINE_FALSE_AND_TRUE = 1;
pub const U_SIZEOF_UCHAR = 2;
pub const U_CHAR16_IS_TYPEDEF = 1;
pub const U_SENTINEL = -1;
pub const U8_MAX_LENGTH = 4;
pub const U16_MAX_LENGTH = 2;
pub const U_HIDE_OBSOLETE_UTF_OLD_H = 0;
pub const UTF_SIZE = 16;
pub const UTF8_ERROR_VALUE_1 = 21;
pub const UTF8_ERROR_VALUE_2 = 159;
pub const UTF_ERROR_VALUE = 65535;
pub const UTF8_MAX_CHAR_LENGTH = 4;
pub const UTF16_MAX_CHAR_LENGTH = 2;
pub const UTF32_MAX_CHAR_LENGTH = 1;
pub const UTF_MAX_CHAR_LENGTH = 2;
pub const U_COPYRIGHT_STRING_LENGTH = 128;
pub const U_MAX_VERSION_LENGTH = 4;
pub const U_MAX_VERSION_STRING_LENGTH = 20;
pub const U_MILLIS_PER_SECOND = 1000;
pub const U_MILLIS_PER_MINUTE = 60000;
pub const U_MILLIS_PER_HOUR = 3600000;
pub const U_MILLIS_PER_DAY = 86400000;
pub const U_COMBINED_IMPLEMENTATION = 1;
pub const U_SHAPE_LENGTH_GROW_SHRINK = 0;
pub const U_SHAPE_LAMALEF_RESIZE = 0;
pub const U_SHAPE_LENGTH_FIXED_SPACES_NEAR = 1;
pub const U_SHAPE_LAMALEF_NEAR = 1;
pub const U_SHAPE_LENGTH_FIXED_SPACES_AT_END = 2;
pub const U_SHAPE_LAMALEF_END = 2;
pub const U_SHAPE_LENGTH_FIXED_SPACES_AT_BEGINNING = 3;
pub const U_SHAPE_LAMALEF_BEGIN = 3;
pub const U_SHAPE_LAMALEF_AUTO = 65536;
pub const U_SHAPE_LENGTH_MASK = 65539;
pub const U_SHAPE_LAMALEF_MASK = 65539;
pub const U_SHAPE_TEXT_DIRECTION_LOGICAL = 0;
pub const U_SHAPE_TEXT_DIRECTION_VISUAL_RTL = 0;
pub const U_SHAPE_TEXT_DIRECTION_VISUAL_LTR = 4;
pub const U_SHAPE_TEXT_DIRECTION_MASK = 4;
pub const U_SHAPE_LETTERS_NOOP = 0;
pub const U_SHAPE_LETTERS_SHAPE = 8;
pub const U_SHAPE_LETTERS_UNSHAPE = 16;
pub const U_SHAPE_LETTERS_SHAPE_TASHKEEL_ISOLATED = 24;
pub const U_SHAPE_LETTERS_MASK = 24;
pub const U_SHAPE_DIGITS_NOOP = 0;
pub const U_SHAPE_DIGITS_EN2AN = 32;
pub const U_SHAPE_DIGITS_AN2EN = 64;
pub const U_SHAPE_DIGITS_ALEN2AN_INIT_LR = 96;
pub const U_SHAPE_DIGITS_ALEN2AN_INIT_AL = 128;
pub const U_SHAPE_DIGITS_RESERVED = 160;
pub const U_SHAPE_DIGITS_MASK = 224;
pub const U_SHAPE_DIGIT_TYPE_AN = 0;
pub const U_SHAPE_DIGIT_TYPE_AN_EXTENDED = 256;
pub const U_SHAPE_DIGIT_TYPE_RESERVED = 512;
pub const U_SHAPE_DIGIT_TYPE_MASK = 768;
pub const U_SHAPE_AGGREGATE_TASHKEEL = 16384;
pub const U_SHAPE_AGGREGATE_TASHKEEL_NOOP = 0;
pub const U_SHAPE_AGGREGATE_TASHKEEL_MASK = 16384;
pub const U_SHAPE_PRESERVE_PRESENTATION = 32768;
pub const U_SHAPE_PRESERVE_PRESENTATION_NOOP = 0;
pub const U_SHAPE_PRESERVE_PRESENTATION_MASK = 32768;
pub const U_SHAPE_SEEN_TWOCELL_NEAR = 2097152;
pub const U_SHAPE_SEEN_MASK = 7340032;
pub const U_SHAPE_YEHHAMZA_TWOCELL_NEAR = 16777216;
pub const U_SHAPE_YEHHAMZA_MASK = 58720256;
pub const U_SHAPE_TASHKEEL_BEGIN = 262144;
pub const U_SHAPE_TASHKEEL_END = 393216;
pub const U_SHAPE_TASHKEEL_RESIZE = 524288;
pub const U_SHAPE_TASHKEEL_REPLACE_BY_TATWEEL = 786432;
pub const U_SHAPE_TASHKEEL_MASK = 917504;
pub const U_SHAPE_SPACES_RELATIVE_TO_TEXT_BEGIN_END = 67108864;
pub const U_SHAPE_SPACES_RELATIVE_TO_TEXT_MASK = 67108864;
pub const U_SHAPE_TAIL_NEW_UNICODE = 134217728;
pub const U_SHAPE_TAIL_TYPE_MASK = 134217728;
pub const ULOC_LANG_CAPACITY = 12;
pub const ULOC_COUNTRY_CAPACITY = 4;
pub const ULOC_FULLNAME_CAPACITY = 157;
pub const ULOC_SCRIPT_CAPACITY = 6;
pub const ULOC_KEYWORDS_CAPACITY = 96;
pub const ULOC_KEYWORD_AND_VALUES_CAPACITY = 100;
pub const ULOC_KEYWORD_SEPARATOR_UNICODE = 64;
pub const ULOC_KEYWORD_ASSIGN_UNICODE = 61;
pub const ULOC_KEYWORD_ITEM_SEPARATOR_UNICODE = 59;
pub const UCNV_MAX_CONVERTER_NAME_LENGTH = 60;
pub const UCNV_SI = 15;
pub const UCNV_SO = 14;
pub const U_FOLD_CASE_DEFAULT = 0;
pub const U_FOLD_CASE_EXCLUDE_SPECIAL_I = 1;
pub const U_TITLECASE_WHOLE_STRING = 32;
pub const U_TITLECASE_SENTENCES = 64;
pub const U_TITLECASE_NO_LOWERCASE = 256;
pub const U_TITLECASE_NO_BREAK_ADJUSTMENT = 512;
pub const U_TITLECASE_ADJUST_TO_CASED = 1024;
pub const U_EDITS_NO_RESET = 8192;
pub const U_OMIT_UNCHANGED_TEXT = 16384;
pub const U_COMPARE_CODE_POINT_ORDER = 32768;
pub const U_COMPARE_IGNORE_CASE = 65536;
pub const UNORM_INPUT_IS_FCD = 131072;
pub const UCHAR_MIN_VALUE = 0;
pub const UCHAR_MAX_VALUE = 1114111;
pub const UBIDI_DEFAULT_LTR = 254;
pub const UBIDI_DEFAULT_RTL = 255;
pub const UBIDI_MAX_EXPLICIT_LEVEL = 125;
pub const UBIDI_LEVEL_OVERRIDE = 128;
pub const UBIDI_MAP_NOWHERE = -1;
pub const UBIDI_KEEP_BASE_COMBINING = 1;
pub const UBIDI_DO_MIRRORING = 2;
pub const UBIDI_INSERT_LRM_FOR_NUMERIC = 4;
pub const UBIDI_REMOVE_BIDI_CONTROLS = 8;
pub const UBIDI_OUTPUT_REVERSE = 16;
pub const USPREP_DEFAULT = 0;
pub const USPREP_ALLOW_UNASSIGNED = 1;
pub const USEARCH_DONE = -1;
pub const U_HAVE_STD_STRING = 0;
pub const UCONFIG_FORMAT_FASTPATHS_49 = 1;
pub const U_PLATFORM_HAS_WINUWP_API = 0;
pub const U_IOSTREAM_SOURCE = 199711;
pub const U_HAVE_RVALUE_REFERENCES = 1;
pub const U_USING_ICU_NAMESPACE = 1;
pub const CANITER_SKIP_ZEROES = 1;
pub const NUMSYS_NAME_CAPACITY = 8;
pub const U_HAVE_RBNF = 0;
pub const MAX_MIMECP_NAME = 64;
pub const MAX_MIMECSET_NAME = 50;
pub const MAX_MIMEFACE_NAME = 32;
pub const MAX_RFC1766_NAME = 6;
pub const MAX_LOCALE_NAME = 32;
pub const MAX_SCRIPT_NAME = 48;
pub const CPIOD_PEEK = 1073741824;
pub const CPIOD_FORCE_PROMPT = -2147483648;
pub const UITER_UNKNOWN_INDEX = -2;
pub const UCPTRIE_FAST_SHIFT = 6;
pub const UCPTRIE_FAST_DATA_BLOCK_LENGTH = 64;
pub const UCPTRIE_FAST_DATA_MASK = 63;
pub const UCPTRIE_SMALL_MAX = 4095;
pub const UCPTRIE_ERROR_VALUE_NEG_DATA_OFFSET = 1;
pub const UCPTRIE_HIGH_VALUE_NEG_DATA_OFFSET = 2;
pub const UTEXT_PROVIDER_LENGTH_IS_EXPENSIVE = 1;
pub const UTEXT_PROVIDER_STABLE_CHUNKS = 2;
pub const UTEXT_PROVIDER_WRITABLE = 3;
pub const UTEXT_PROVIDER_HAS_META_DATA = 4;
pub const UTEXT_PROVIDER_OWNS_TEXT = 5;
pub const UTEXT_MAGIC = 878368812;
pub const USET_IGNORE_SPACE = 1;
pub const USET_CASE_INSENSITIVE = 2;
pub const USET_ADD_CASE_MAPPINGS = 4;
pub const USET_SERIALIZED_STATIC_ARRAY_CAPACITY = 8;
pub const U_PARSE_CONTEXT_LEN = 16;
pub const UIDNA_DEFAULT = 0;
pub const UIDNA_USE_STD3_RULES = 2;
pub const UIDNA_CHECK_BIDI = 4;
pub const UIDNA_CHECK_CONTEXTJ = 8;
pub const UIDNA_NONTRANSITIONAL_TO_ASCII = 16;
pub const UIDNA_NONTRANSITIONAL_TO_UNICODE = 32;
pub const UIDNA_CHECK_CONTEXTO = 64;
pub const UIDNA_ERROR_EMPTY_LABEL = 1;
pub const UIDNA_ERROR_LABEL_TOO_LONG = 2;
pub const UIDNA_ERROR_DOMAIN_NAME_TOO_LONG = 4;
pub const UIDNA_ERROR_LEADING_HYPHEN = 8;
pub const UIDNA_ERROR_TRAILING_HYPHEN = 16;
pub const UIDNA_ERROR_HYPHEN_3_4 = 32;
pub const UIDNA_ERROR_LEADING_COMBINING_MARK = 64;
pub const UIDNA_ERROR_DISALLOWED = 128;
pub const UIDNA_ERROR_PUNYCODE = 256;
pub const UIDNA_ERROR_LABEL_HAS_DOT = 512;
pub const UIDNA_ERROR_INVALID_ACE_LABEL = 1024;
pub const UIDNA_ERROR_BIDI = 2048;
pub const UIDNA_ERROR_CONTEXTJ = 4096;
pub const UIDNA_ERROR_CONTEXTO_PUNCTUATION = 8192;
pub const UIDNA_ERROR_CONTEXTO_DIGITS = 16384;
pub const UMSGPAT_ARG_NAME_NOT_NUMBER = -1;
pub const UMSGPAT_ARG_NAME_NOT_VALID = -2;
pub const COMPARE_STRING = 1;
pub const GEO_NATION = 1;
pub const GEO_LATITUDE = 2;
pub const GEO_LONGITUDE = 3;
pub const GEO_ISO2 = 4;
pub const GEO_ISO3 = 5;
pub const GEO_RFC1766 = 6;
pub const GEO_LCID = 7;
pub const GEO_FRIENDLYNAME = 8;
pub const GEO_OFFICIALNAME = 9;
pub const GEO_TIMEZONES = 10;
pub const GEO_OFFICIALLANGUAGES = 11;
pub const GEO_ISO_UN_NUMBER = 12;
pub const GEO_PARENT = 13;
pub const GEO_DIALINGCODE = 14;
pub const GEO_CURRENCYCODE = 15;
pub const GEO_CURRENCYSYMBOL = 16;
pub const GEO_NAME = 17;
pub const GEO_ID = 18;
pub const GEOCLASS_NATION = 16;
pub const GEOCLASS_REGION = 14;
pub const GEOCLASS_ALL = 0;
pub const NormalizationOther = 0;
pub const NormalizationC = 1;
pub const NormalizationD = 2;
pub const NormalizationKC = 5;
pub const NormalizationKD = 6;
pub const WORDLIST_TYPE_IGNORE = 0;
pub const WORDLIST_TYPE_ADD = 1;
pub const WORDLIST_TYPE_EXCLUDE = 2;
pub const WORDLIST_TYPE_AUTOCORRECT = 3;
pub const CORRECTIVE_ACTION_NONE = 0;
pub const CORRECTIVE_ACTION_GET_SUGGESTIONS = 1;
pub const CORRECTIVE_ACTION_REPLACE = 2;
pub const CORRECTIVE_ACTION_DELETE = 3;
pub const SCRIPT_JUSTIFY_NONE = 0;
pub const SCRIPT_JUSTIFY_ARABIC_BLANK = 1;
pub const SCRIPT_JUSTIFY_CHARACTER = 2;
pub const SCRIPT_JUSTIFY_RESERVED1 = 3;
pub const SCRIPT_JUSTIFY_BLANK = 4;
pub const SCRIPT_JUSTIFY_RESERVED2 = 5;
pub const SCRIPT_JUSTIFY_RESERVED3 = 6;
pub const SCRIPT_JUSTIFY_ARABIC_NORMAL = 7;
pub const SCRIPT_JUSTIFY_ARABIC_KASHIDA = 8;
pub const SCRIPT_JUSTIFY_ARABIC_ALEF = 9;
pub const SCRIPT_JUSTIFY_ARABIC_HA = 10;
pub const SCRIPT_JUSTIFY_ARABIC_RA = 11;
pub const SCRIPT_JUSTIFY_ARABIC_BA = 12;
pub const SCRIPT_JUSTIFY_ARABIC_BARA = 13;
pub const SCRIPT_JUSTIFY_ARABIC_SEEN = 14;
pub const SCRIPT_JUSTIFY_ARABIC_SEEN_M = 15;
pub const U_USING_FALLBACK_WARNING = -128;
pub const U_ERROR_WARNING_START = -128;
pub const U_USING_DEFAULT_WARNING = -127;
pub const U_SAFECLONE_ALLOCATED_WARNING = -126;
pub const U_STATE_OLD_WARNING = -125;
pub const U_STRING_NOT_TERMINATED_WARNING = -124;
pub const U_SORT_KEY_TOO_SHORT_WARNING = -123;
pub const U_AMBIGUOUS_ALIAS_WARNING = -122;
pub const U_DIFFERENT_UCA_VERSION = -121;
pub const U_PLUGIN_CHANGED_LEVEL_WARNING = -120;
pub const U_ZERO_ERROR = 0;
pub const U_ILLEGAL_ARGUMENT_ERROR = 1;
pub const U_MISSING_RESOURCE_ERROR = 2;
pub const U_INVALID_FORMAT_ERROR = 3;
pub const U_FILE_ACCESS_ERROR = 4;
pub const U_INTERNAL_PROGRAM_ERROR = 5;
pub const U_MESSAGE_PARSE_ERROR = 6;
pub const U_MEMORY_ALLOCATION_ERROR = 7;
pub const U_INDEX_OUTOFBOUNDS_ERROR = 8;
pub const U_PARSE_ERROR = 9;
pub const U_INVALID_CHAR_FOUND = 10;
pub const U_TRUNCATED_CHAR_FOUND = 11;
pub const U_ILLEGAL_CHAR_FOUND = 12;
pub const U_INVALID_TABLE_FORMAT = 13;
pub const U_INVALID_TABLE_FILE = 14;
pub const U_BUFFER_OVERFLOW_ERROR = 15;
pub const U_UNSUPPORTED_ERROR = 16;
pub const U_RESOURCE_TYPE_MISMATCH = 17;
pub const U_ILLEGAL_ESCAPE_SEQUENCE = 18;
pub const U_UNSUPPORTED_ESCAPE_SEQUENCE = 19;
pub const U_NO_SPACE_AVAILABLE = 20;
pub const U_CE_NOT_FOUND_ERROR = 21;
pub const U_PRIMARY_TOO_LONG_ERROR = 22;
pub const U_STATE_TOO_OLD_ERROR = 23;
pub const U_TOO_MANY_ALIASES_ERROR = 24;
pub const U_ENUM_OUT_OF_SYNC_ERROR = 25;
pub const U_INVARIANT_CONVERSION_ERROR = 26;
pub const U_INVALID_STATE_ERROR = 27;
pub const U_COLLATOR_VERSION_MISMATCH = 28;
pub const U_USELESS_COLLATOR_ERROR = 29;
pub const U_NO_WRITE_PERMISSION = 30;
pub const U_INPUT_TOO_LONG_ERROR = 31;
pub const U_BAD_VARIABLE_DEFINITION = 65536;
pub const U_PARSE_ERROR_START = 65536;
pub const U_MALFORMED_RULE = 65537;
pub const U_MALFORMED_SET = 65538;
pub const U_MALFORMED_SYMBOL_REFERENCE = 65539;
pub const U_MALFORMED_UNICODE_ESCAPE = 65540;
pub const U_MALFORMED_VARIABLE_DEFINITION = 65541;
pub const U_MALFORMED_VARIABLE_REFERENCE = 65542;
pub const U_MISMATCHED_SEGMENT_DELIMITERS = 65543;
pub const U_MISPLACED_ANCHOR_START = 65544;
pub const U_MISPLACED_CURSOR_OFFSET = 65545;
pub const U_MISPLACED_QUANTIFIER = 65546;
pub const U_MISSING_OPERATOR = 65547;
pub const U_MISSING_SEGMENT_CLOSE = 65548;
pub const U_MULTIPLE_ANTE_CONTEXTS = 65549;
pub const U_MULTIPLE_CURSORS = 65550;
pub const U_MULTIPLE_POST_CONTEXTS = 65551;
pub const U_TRAILING_BACKSLASH = 65552;
pub const U_UNDEFINED_SEGMENT_REFERENCE = 65553;
pub const U_UNDEFINED_VARIABLE = 65554;
pub const U_UNQUOTED_SPECIAL = 65555;
pub const U_UNTERMINATED_QUOTE = 65556;
pub const U_RULE_MASK_ERROR = 65557;
pub const U_MISPLACED_COMPOUND_FILTER = 65558;
pub const U_MULTIPLE_COMPOUND_FILTERS = 65559;
pub const U_INVALID_RBT_SYNTAX = 65560;
pub const U_INVALID_PROPERTY_PATTERN = 65561;
pub const U_MALFORMED_PRAGMA = 65562;
pub const U_UNCLOSED_SEGMENT = 65563;
pub const U_ILLEGAL_CHAR_IN_SEGMENT = 65564;
pub const U_VARIABLE_RANGE_EXHAUSTED = 65565;
pub const U_VARIABLE_RANGE_OVERLAP = 65566;
pub const U_ILLEGAL_CHARACTER = 65567;
pub const U_INTERNAL_TRANSLITERATOR_ERROR = 65568;
pub const U_INVALID_ID = 65569;
pub const U_INVALID_FUNCTION = 65570;
pub const U_UNEXPECTED_TOKEN = 65792;
pub const U_FMT_PARSE_ERROR_START = 65792;
pub const U_MULTIPLE_DECIMAL_SEPARATORS = 65793;
pub const U_MULTIPLE_DECIMAL_SEPERATORS = 65793;
pub const U_MULTIPLE_EXPONENTIAL_SYMBOLS = 65794;
pub const U_MALFORMED_EXPONENTIAL_PATTERN = 65795;
pub const U_MULTIPLE_PERCENT_SYMBOLS = 65796;
pub const U_MULTIPLE_PERMILL_SYMBOLS = 65797;
pub const U_MULTIPLE_PAD_SPECIFIERS = 65798;
pub const U_PATTERN_SYNTAX_ERROR = 65799;
pub const U_ILLEGAL_PAD_POSITION = 65800;
pub const U_UNMATCHED_BRACES = 65801;
pub const U_UNSUPPORTED_PROPERTY = 65802;
pub const U_UNSUPPORTED_ATTRIBUTE = 65803;
pub const U_ARGUMENT_TYPE_MISMATCH = 65804;
pub const U_DUPLICATE_KEYWORD = 65805;
pub const U_UNDEFINED_KEYWORD = 65806;
pub const U_DEFAULT_KEYWORD_MISSING = 65807;
pub const U_DECIMAL_NUMBER_SYNTAX_ERROR = 65808;
pub const U_FORMAT_INEXACT_ERROR = 65809;
pub const U_NUMBER_ARG_OUTOFBOUNDS_ERROR = 65810;
pub const U_NUMBER_SKELETON_SYNTAX_ERROR = 65811;
pub const U_BRK_INTERNAL_ERROR = 66048;
pub const U_BRK_ERROR_START = 66048;
pub const U_BRK_HEX_DIGITS_EXPECTED = 66049;
pub const U_BRK_SEMICOLON_EXPECTED = 66050;
pub const U_BRK_RULE_SYNTAX = 66051;
pub const U_BRK_UNCLOSED_SET = 66052;
pub const U_BRK_ASSIGN_ERROR = 66053;
pub const U_BRK_VARIABLE_REDFINITION = 66054;
pub const U_BRK_MISMATCHED_PAREN = 66055;
pub const U_BRK_NEW_LINE_IN_QUOTED_STRING = 66056;
pub const U_BRK_UNDEFINED_VARIABLE = 66057;
pub const U_BRK_INIT_ERROR = 66058;
pub const U_BRK_RULE_EMPTY_SET = 66059;
pub const U_BRK_UNRECOGNIZED_OPTION = 66060;
pub const U_BRK_MALFORMED_RULE_TAG = 66061;
pub const U_REGEX_INTERNAL_ERROR = 66304;
pub const U_REGEX_ERROR_START = 66304;
pub const U_REGEX_RULE_SYNTAX = 66305;
pub const U_REGEX_INVALID_STATE = 66306;
pub const U_REGEX_BAD_ESCAPE_SEQUENCE = 66307;
pub const U_REGEX_PROPERTY_SYNTAX = 66308;
pub const U_REGEX_UNIMPLEMENTED = 66309;
pub const U_REGEX_MISMATCHED_PAREN = 66310;
pub const U_REGEX_NUMBER_TOO_BIG = 66311;
pub const U_REGEX_BAD_INTERVAL = 66312;
pub const U_REGEX_MAX_LT_MIN = 66313;
pub const U_REGEX_INVALID_BACK_REF = 66314;
pub const U_REGEX_INVALID_FLAG = 66315;
pub const U_REGEX_LOOK_BEHIND_LIMIT = 66316;
pub const U_REGEX_SET_CONTAINS_STRING = 66317;
pub const U_REGEX_MISSING_CLOSE_BRACKET = 66319;
pub const U_REGEX_INVALID_RANGE = 66320;
pub const U_REGEX_STACK_OVERFLOW = 66321;
pub const U_REGEX_TIME_OUT = 66322;
pub const U_REGEX_STOPPED_BY_CALLER = 66323;
pub const U_REGEX_PATTERN_TOO_BIG = 66324;
pub const U_REGEX_INVALID_CAPTURE_GROUP_NAME = 66325;
pub const U_IDNA_PROHIBITED_ERROR = 66560;
pub const U_IDNA_ERROR_START = 66560;
pub const U_IDNA_UNASSIGNED_ERROR = 66561;
pub const U_IDNA_CHECK_BIDI_ERROR = 66562;
pub const U_IDNA_STD3_ASCII_RULES_ERROR = 66563;
pub const U_IDNA_ACE_PREFIX_ERROR = 66564;
pub const U_IDNA_VERIFICATION_ERROR = 66565;
pub const U_IDNA_LABEL_TOO_LONG_ERROR = 66566;
pub const U_IDNA_ZERO_LENGTH_LABEL_ERROR = 66567;
pub const U_IDNA_DOMAIN_NAME_TOO_LONG_ERROR = 66568;
pub const U_STRINGPREP_PROHIBITED_ERROR = 66560;
pub const U_STRINGPREP_UNASSIGNED_ERROR = 66561;
pub const U_STRINGPREP_CHECK_BIDI_ERROR = 66562;
pub const U_PLUGIN_ERROR_START = 66816;
pub const U_PLUGIN_TOO_HIGH = 66816;
pub const U_PLUGIN_DIDNT_SET_LEVEL = 66817;
pub const UTRACE_OFF = -1;
pub const UTRACE_ERROR = 0;
pub const UTRACE_WARNING = 3;
pub const UTRACE_OPEN_CLOSE = 5;
pub const UTRACE_INFO = 7;
pub const UTRACE_VERBOSE = 9;
pub const UTRACE_FUNCTION_START = 0;
pub const UTRACE_U_INIT = 0;
pub const UTRACE_U_CLEANUP = 1;
pub const UTRACE_CONVERSION_START = 4096;
pub const UTRACE_UCNV_OPEN = 4096;
pub const UTRACE_UCNV_OPEN_PACKAGE = 4097;
pub const UTRACE_UCNV_OPEN_ALGORITHMIC = 4098;
pub const UTRACE_UCNV_CLONE = 4099;
pub const UTRACE_UCNV_CLOSE = 4100;
pub const UTRACE_UCNV_FLUSH_CACHE = 4101;
pub const UTRACE_UCNV_LOAD = 4102;
pub const UTRACE_UCNV_UNLOAD = 4103;
pub const UTRACE_COLLATION_START = 8192;
pub const UTRACE_UCOL_OPEN = 8192;
pub const UTRACE_UCOL_CLOSE = 8193;
pub const UTRACE_UCOL_STRCOLL = 8194;
pub const UTRACE_UCOL_GET_SORTKEY = 8195;
pub const UTRACE_UCOL_GETLOCALE = 8196;
pub const UTRACE_UCOL_NEXTSORTKEYPART = 8197;
pub const UTRACE_UCOL_STRCOLLITER = 8198;
pub const UTRACE_UCOL_OPEN_FROM_SHORT_STRING = 8199;
pub const UTRACE_UCOL_STRCOLLUTF8 = 8200;
pub const UTRACE_UDATA_START = 12288;
pub const UTRACE_UDATA_RESOURCE = 12288;
pub const UTRACE_UDATA_BUNDLE = 12289;
pub const UTRACE_UDATA_DATA_FILE = 12290;
pub const UTRACE_UDATA_RES_FILE = 12291;
pub const USTRINGTRIE_NO_MATCH = 0;
pub const USTRINGTRIE_NO_VALUE = 1;
pub const USTRINGTRIE_FINAL_VALUE = 2;
pub const USTRINGTRIE_INTERMEDIATE_VALUE = 3;
pub const USCRIPT_INVALID_CODE = -1;
pub const USCRIPT_COMMON = 0;
pub const USCRIPT_INHERITED = 1;
pub const USCRIPT_ARABIC = 2;
pub const USCRIPT_ARMENIAN = 3;
pub const USCRIPT_BENGALI = 4;
pub const USCRIPT_BOPOMOFO = 5;
pub const USCRIPT_CHEROKEE = 6;
pub const USCRIPT_COPTIC = 7;
pub const USCRIPT_CYRILLIC = 8;
pub const USCRIPT_DESERET = 9;
pub const USCRIPT_DEVANAGARI = 10;
pub const USCRIPT_ETHIOPIC = 11;
pub const USCRIPT_GEORGIAN = 12;
pub const USCRIPT_GOTHIC = 13;
pub const USCRIPT_GREEK = 14;
pub const USCRIPT_GUJARATI = 15;
pub const USCRIPT_GURMUKHI = 16;
pub const USCRIPT_HAN = 17;
pub const USCRIPT_HANGUL = 18;
pub const USCRIPT_HEBREW = 19;
pub const USCRIPT_HIRAGANA = 20;
pub const USCRIPT_KANNADA = 21;
pub const USCRIPT_KATAKANA = 22;
pub const USCRIPT_KHMER = 23;
pub const USCRIPT_LAO = 24;
pub const USCRIPT_LATIN = 25;
pub const USCRIPT_MALAYALAM = 26;
pub const USCRIPT_MONGOLIAN = 27;
pub const USCRIPT_MYANMAR = 28;
pub const USCRIPT_OGHAM = 29;
pub const USCRIPT_OLD_ITALIC = 30;
pub const USCRIPT_ORIYA = 31;
pub const USCRIPT_RUNIC = 32;
pub const USCRIPT_SINHALA = 33;
pub const USCRIPT_SYRIAC = 34;
pub const USCRIPT_TAMIL = 35;
pub const USCRIPT_TELUGU = 36;
pub const USCRIPT_THAANA = 37;
pub const USCRIPT_THAI = 38;
pub const USCRIPT_TIBETAN = 39;
pub const USCRIPT_CANADIAN_ABORIGINAL = 40;
pub const USCRIPT_UCAS = 40;
pub const USCRIPT_YI = 41;
pub const USCRIPT_TAGALOG = 42;
pub const USCRIPT_HANUNOO = 43;
pub const USCRIPT_BUHID = 44;
pub const USCRIPT_TAGBANWA = 45;
pub const USCRIPT_BRAILLE = 46;
pub const USCRIPT_CYPRIOT = 47;
pub const USCRIPT_LIMBU = 48;
pub const USCRIPT_LINEAR_B = 49;
pub const USCRIPT_OSMANYA = 50;
pub const USCRIPT_SHAVIAN = 51;
pub const USCRIPT_TAI_LE = 52;
pub const USCRIPT_UGARITIC = 53;
pub const USCRIPT_KATAKANA_OR_HIRAGANA = 54;
pub const USCRIPT_BUGINESE = 55;
pub const USCRIPT_GLAGOLITIC = 56;
pub const USCRIPT_KHAROSHTHI = 57;
pub const USCRIPT_SYLOTI_NAGRI = 58;
pub const USCRIPT_NEW_TAI_LUE = 59;
pub const USCRIPT_TIFINAGH = 60;
pub const USCRIPT_OLD_PERSIAN = 61;
pub const USCRIPT_BALINESE = 62;
pub const USCRIPT_BATAK = 63;
pub const USCRIPT_BLISSYMBOLS = 64;
pub const USCRIPT_BRAHMI = 65;
pub const USCRIPT_CHAM = 66;
pub const USCRIPT_CIRTH = 67;
pub const USCRIPT_OLD_CHURCH_SLAVONIC_CYRILLIC = 68;
pub const USCRIPT_DEMOTIC_EGYPTIAN = 69;
pub const USCRIPT_HIERATIC_EGYPTIAN = 70;
pub const USCRIPT_EGYPTIAN_HIEROGLYPHS = 71;
pub const USCRIPT_KHUTSURI = 72;
pub const USCRIPT_SIMPLIFIED_HAN = 73;
pub const USCRIPT_TRADITIONAL_HAN = 74;
pub const USCRIPT_PAHAWH_HMONG = 75;
pub const USCRIPT_OLD_HUNGARIAN = 76;
pub const USCRIPT_HARAPPAN_INDUS = 77;
pub const USCRIPT_JAVANESE = 78;
pub const USCRIPT_KAYAH_LI = 79;
pub const USCRIPT_LATIN_FRAKTUR = 80;
pub const USCRIPT_LATIN_GAELIC = 81;
pub const USCRIPT_LEPCHA = 82;
pub const USCRIPT_LINEAR_A = 83;
pub const USCRIPT_MANDAIC = 84;
pub const USCRIPT_MANDAEAN = 84;
pub const USCRIPT_MAYAN_HIEROGLYPHS = 85;
pub const USCRIPT_MEROITIC_HIEROGLYPHS = 86;
pub const USCRIPT_MEROITIC = 86;
pub const USCRIPT_NKO = 87;
pub const USCRIPT_ORKHON = 88;
pub const USCRIPT_OLD_PERMIC = 89;
pub const USCRIPT_PHAGS_PA = 90;
pub const USCRIPT_PHOENICIAN = 91;
pub const USCRIPT_MIAO = 92;
pub const USCRIPT_PHONETIC_POLLARD = 92;
pub const USCRIPT_RONGORONGO = 93;
pub const USCRIPT_SARATI = 94;
pub const USCRIPT_ESTRANGELO_SYRIAC = 95;
pub const USCRIPT_WESTERN_SYRIAC = 96;
pub const USCRIPT_EASTERN_SYRIAC = 97;
pub const USCRIPT_TENGWAR = 98;
pub const USCRIPT_VAI = 99;
pub const USCRIPT_VISIBLE_SPEECH = 100;
pub const USCRIPT_CUNEIFORM = 101;
pub const USCRIPT_UNWRITTEN_LANGUAGES = 102;
pub const USCRIPT_UNKNOWN = 103;
pub const USCRIPT_CARIAN = 104;
pub const USCRIPT_JAPANESE = 105;
pub const USCRIPT_LANNA = 106;
pub const USCRIPT_LYCIAN = 107;
pub const USCRIPT_LYDIAN = 108;
pub const USCRIPT_OL_CHIKI = 109;
pub const USCRIPT_REJANG = 110;
pub const USCRIPT_SAURASHTRA = 111;
pub const USCRIPT_SIGN_WRITING = 112;
pub const USCRIPT_SUNDANESE = 113;
pub const USCRIPT_MOON = 114;
pub const USCRIPT_MEITEI_MAYEK = 115;
pub const USCRIPT_IMPERIAL_ARAMAIC = 116;
pub const USCRIPT_AVESTAN = 117;
pub const USCRIPT_CHAKMA = 118;
pub const USCRIPT_KOREAN = 119;
pub const USCRIPT_KAITHI = 120;
pub const USCRIPT_MANICHAEAN = 121;
pub const USCRIPT_INSCRIPTIONAL_PAHLAVI = 122;
pub const USCRIPT_PSALTER_PAHLAVI = 123;
pub const USCRIPT_BOOK_PAHLAVI = 124;
pub const USCRIPT_INSCRIPTIONAL_PARTHIAN = 125;
pub const USCRIPT_SAMARITAN = 126;
pub const USCRIPT_TAI_VIET = 127;
pub const USCRIPT_MATHEMATICAL_NOTATION = 128;
pub const USCRIPT_SYMBOLS = 129;
pub const USCRIPT_BAMUM = 130;
pub const USCRIPT_LISU = 131;
pub const USCRIPT_NAKHI_GEBA = 132;
pub const USCRIPT_OLD_SOUTH_ARABIAN = 133;
pub const USCRIPT_BASSA_VAH = 134;
pub const USCRIPT_DUPLOYAN = 135;
pub const USCRIPT_ELBASAN = 136;
pub const USCRIPT_GRANTHA = 137;
pub const USCRIPT_KPELLE = 138;
pub const USCRIPT_LOMA = 139;
pub const USCRIPT_MENDE = 140;
pub const USCRIPT_MEROITIC_CURSIVE = 141;
pub const USCRIPT_OLD_NORTH_ARABIAN = 142;
pub const USCRIPT_NABATAEAN = 143;
pub const USCRIPT_PALMYRENE = 144;
pub const USCRIPT_KHUDAWADI = 145;
pub const USCRIPT_SINDHI = 145;
pub const USCRIPT_WARANG_CITI = 146;
pub const USCRIPT_AFAKA = 147;
pub const USCRIPT_JURCHEN = 148;
pub const USCRIPT_MRO = 149;
pub const USCRIPT_NUSHU = 150;
pub const USCRIPT_SHARADA = 151;
pub const USCRIPT_SORA_SOMPENG = 152;
pub const USCRIPT_TAKRI = 153;
pub const USCRIPT_TANGUT = 154;
pub const USCRIPT_WOLEAI = 155;
pub const USCRIPT_ANATOLIAN_HIEROGLYPHS = 156;
pub const USCRIPT_KHOJKI = 157;
pub const USCRIPT_TIRHUTA = 158;
pub const USCRIPT_CAUCASIAN_ALBANIAN = 159;
pub const USCRIPT_MAHAJANI = 160;
pub const USCRIPT_AHOM = 161;
pub const USCRIPT_HATRAN = 162;
pub const USCRIPT_MODI = 163;
pub const USCRIPT_MULTANI = 164;
pub const USCRIPT_PAU_CIN_HAU = 165;
pub const USCRIPT_SIDDHAM = 166;
pub const USCRIPT_ADLAM = 167;
pub const USCRIPT_BHAIKSUKI = 168;
pub const USCRIPT_MARCHEN = 169;
pub const USCRIPT_NEWA = 170;
pub const USCRIPT_OSAGE = 171;
pub const USCRIPT_HAN_WITH_BOPOMOFO = 172;
pub const USCRIPT_JAMO = 173;
pub const USCRIPT_SYMBOLS_EMOJI = 174;
pub const USCRIPT_MASARAM_GONDI = 175;
pub const USCRIPT_SOYOMBO = 176;
pub const USCRIPT_ZANABAZAR_SQUARE = 177;
pub const USCRIPT_DOGRA = 178;
pub const USCRIPT_GUNJALA_GONDI = 179;
pub const USCRIPT_MAKASAR = 180;
pub const USCRIPT_MEDEFAIDRIN = 181;
pub const USCRIPT_HANIFI_ROHINGYA = 182;
pub const USCRIPT_SOGDIAN = 183;
pub const USCRIPT_OLD_SOGDIAN = 184;
pub const USCRIPT_ELYMAIC = 185;
pub const USCRIPT_NYIAKENG_PUACHUE_HMONG = 186;
pub const USCRIPT_NANDINAGARI = 187;
pub const USCRIPT_WANCHO = 188;
pub const USCRIPT_CHORASMIAN = 189;
pub const USCRIPT_DIVES_AKURU = 190;
pub const USCRIPT_KHITAN_SMALL_SCRIPT = 191;
pub const USCRIPT_YEZIDI = 192;
pub const USCRIPT_USAGE_NOT_ENCODED = 0;
pub const USCRIPT_USAGE_UNKNOWN = 1;
pub const USCRIPT_USAGE_EXCLUDED = 2;
pub const USCRIPT_USAGE_LIMITED_USE = 3;
pub const USCRIPT_USAGE_ASPIRATIONAL = 4;
pub const USCRIPT_USAGE_RECOMMENDED = 5;
pub const UITER_START = 0;
pub const UITER_CURRENT = 1;
pub const UITER_LIMIT = 2;
pub const UITER_ZERO = 3;
pub const UITER_LENGTH = 4;
pub const ULOC_ACTUAL_LOCALE = 0;
pub const ULOC_VALID_LOCALE = 1;
pub const ULOC_AVAILABLE_DEFAULT = 0;
pub const ULOC_AVAILABLE_ONLY_LEGACY_ALIASES = 1;
pub const ULOC_AVAILABLE_WITH_LEGACY_ALIASES = 2;
pub const ULOC_LAYOUT_LTR = 0;
pub const ULOC_LAYOUT_RTL = 1;
pub const ULOC_LAYOUT_TTB = 2;
pub const ULOC_LAYOUT_BTT = 3;
pub const ULOC_LAYOUT_UNKNOWN = 4;
pub const ULOC_ACCEPT_FAILED = 0;
pub const ULOC_ACCEPT_VALID = 1;
pub const ULOC_ACCEPT_FALLBACK = 2;
pub const URES_NONE = -1;
pub const URES_STRING = 0;
pub const URES_BINARY = 1;
pub const URES_TABLE = 2;
pub const URES_ALIAS = 3;
pub const URES_INT = 7;
pub const URES_ARRAY = 8;
pub const URES_INT_VECTOR = 14;
pub const UDISPCTX_TYPE_DIALECT_HANDLING = 0;
pub const UDISPCTX_TYPE_CAPITALIZATION = 1;
pub const UDISPCTX_TYPE_DISPLAY_LENGTH = 2;
pub const UDISPCTX_TYPE_SUBSTITUTE_HANDLING = 3;
pub const UDISPCTX_STANDARD_NAMES = 0;
pub const UDISPCTX_DIALECT_NAMES = 1;
pub const UDISPCTX_CAPITALIZATION_NONE = 256;
pub const UDISPCTX_CAPITALIZATION_FOR_MIDDLE_OF_SENTENCE = 257;
pub const UDISPCTX_CAPITALIZATION_FOR_BEGINNING_OF_SENTENCE = 258;
pub const UDISPCTX_CAPITALIZATION_FOR_UI_LIST_OR_MENU = 259;
pub const UDISPCTX_CAPITALIZATION_FOR_STANDALONE = 260;
pub const UDISPCTX_LENGTH_FULL = 512;
pub const UDISPCTX_LENGTH_SHORT = 513;
pub const UDISPCTX_SUBSTITUTE = 768;
pub const UDISPCTX_NO_SUBSTITUTE = 769;
pub const ULDN_STANDARD_NAMES = 0;
pub const ULDN_DIALECT_NAMES = 1;
pub const UCURR_USAGE_STANDARD = 0;
pub const UCURR_USAGE_CASH = 1;
pub const UCURR_SYMBOL_NAME = 0;
pub const UCURR_LONG_NAME = 1;
pub const UCURR_NARROW_SYMBOL_NAME = 2;
pub const UCURR_VARIANT_SYMBOL_NAME = 3;
pub const UCURR_ALL = 2147483647;
pub const UCURR_COMMON = 1;
pub const UCURR_UNCOMMON = 2;
pub const UCURR_DEPRECATED = 4;
pub const UCURR_NON_DEPRECATED = 8;
pub const UCPMAP_RANGE_NORMAL = 0;
pub const UCPMAP_RANGE_FIXED_LEAD_SURROGATES = 1;
pub const UCPMAP_RANGE_FIXED_ALL_SURROGATES = 2;
pub const UCPTRIE_TYPE_ANY = -1;
pub const UCPTRIE_TYPE_FAST = 0;
pub const UCPTRIE_TYPE_SMALL = 1;
pub const UCPTRIE_VALUE_BITS_ANY = -1;
pub const UCPTRIE_VALUE_BITS_16 = 0;
pub const UCPTRIE_VALUE_BITS_32 = 1;
pub const UCPTRIE_VALUE_BITS_8 = 2;
pub const UCNV_UNASSIGNED = 0;
pub const UCNV_ILLEGAL = 1;
pub const UCNV_IRREGULAR = 2;
pub const UCNV_RESET = 3;
pub const UCNV_CLOSE = 4;
pub const UCNV_CLONE = 5;
pub const UCNV_UNSUPPORTED_CONVERTER = -1;
pub const UCNV_SBCS = 0;
pub const UCNV_DBCS = 1;
pub const UCNV_MBCS = 2;
pub const UCNV_LATIN_1 = 3;
pub const UCNV_UTF8 = 4;
pub const UCNV_UTF16_BigEndian = 5;
pub const UCNV_UTF16_LittleEndian = 6;
pub const UCNV_UTF32_BigEndian = 7;
pub const UCNV_UTF32_LittleEndian = 8;
pub const UCNV_EBCDIC_STATEFUL = 9;
pub const UCNV_ISO_2022 = 10;
pub const UCNV_LMBCS_1 = 11;
pub const UCNV_LMBCS_2 = 12;
pub const UCNV_LMBCS_3 = 13;
pub const UCNV_LMBCS_4 = 14;
pub const UCNV_LMBCS_5 = 15;
pub const UCNV_LMBCS_6 = 16;
pub const UCNV_LMBCS_8 = 17;
pub const UCNV_LMBCS_11 = 18;
pub const UCNV_LMBCS_16 = 19;
pub const UCNV_LMBCS_17 = 20;
pub const UCNV_LMBCS_18 = 21;
pub const UCNV_LMBCS_19 = 22;
pub const UCNV_LMBCS_LAST = 22;
pub const UCNV_HZ = 23;
pub const UCNV_SCSU = 24;
pub const UCNV_ISCII = 25;
pub const UCNV_US_ASCII = 26;
pub const UCNV_UTF7 = 27;
pub const UCNV_BOCU1 = 28;
pub const UCNV_UTF16 = 29;
pub const UCNV_UTF32 = 30;
pub const UCNV_CESU8 = 31;
pub const UCNV_IMAP_MAILBOX = 32;
pub const UCNV_COMPOUND_TEXT = 33;
pub const UCNV_NUMBER_OF_SUPPORTED_CONVERTER_TYPES = 34;
pub const UCNV_UNKNOWN = -1;
pub const UCNV_IBM = 0;
pub const UCNV_ROUNDTRIP_SET = 0;
pub const UCNV_ROUNDTRIP_AND_FALLBACK_SET = 1;
pub const UCHAR_ALPHABETIC = 0;
pub const UCHAR_BINARY_START = 0;
pub const UCHAR_ASCII_HEX_DIGIT = 1;
pub const UCHAR_BIDI_CONTROL = 2;
pub const UCHAR_BIDI_MIRRORED = 3;
pub const UCHAR_DASH = 4;
pub const UCHAR_DEFAULT_IGNORABLE_CODE_POINT = 5;
pub const UCHAR_DEPRECATED = 6;
pub const UCHAR_DIACRITIC = 7;
pub const UCHAR_EXTENDER = 8;
pub const UCHAR_FULL_COMPOSITION_EXCLUSION = 9;
pub const UCHAR_GRAPHEME_BASE = 10;
pub const UCHAR_GRAPHEME_EXTEND = 11;
pub const UCHAR_GRAPHEME_LINK = 12;
pub const UCHAR_HEX_DIGIT = 13;
pub const UCHAR_HYPHEN = 14;
pub const UCHAR_ID_CONTINUE = 15;
pub const UCHAR_ID_START = 16;
pub const UCHAR_IDEOGRAPHIC = 17;
pub const UCHAR_IDS_BINARY_OPERATOR = 18;
pub const UCHAR_IDS_TRINARY_OPERATOR = 19;
pub const UCHAR_JOIN_CONTROL = 20;
pub const UCHAR_LOGICAL_ORDER_EXCEPTION = 21;
pub const UCHAR_LOWERCASE = 22;
pub const UCHAR_MATH = 23;
pub const UCHAR_NONCHARACTER_CODE_POINT = 24;
pub const UCHAR_QUOTATION_MARK = 25;
pub const UCHAR_RADICAL = 26;
pub const UCHAR_SOFT_DOTTED = 27;
pub const UCHAR_TERMINAL_PUNCTUATION = 28;
pub const UCHAR_UNIFIED_IDEOGRAPH = 29;
pub const UCHAR_UPPERCASE = 30;
pub const UCHAR_WHITE_SPACE = 31;
pub const UCHAR_XID_CONTINUE = 32;
pub const UCHAR_XID_START = 33;
pub const UCHAR_CASE_SENSITIVE = 34;
pub const UCHAR_S_TERM = 35;
pub const UCHAR_VARIATION_SELECTOR = 36;
pub const UCHAR_NFD_INERT = 37;
pub const UCHAR_NFKD_INERT = 38;
pub const UCHAR_NFC_INERT = 39;
pub const UCHAR_NFKC_INERT = 40;
pub const UCHAR_SEGMENT_STARTER = 41;
pub const UCHAR_PATTERN_SYNTAX = 42;
pub const UCHAR_PATTERN_WHITE_SPACE = 43;
pub const UCHAR_POSIX_ALNUM = 44;
pub const UCHAR_POSIX_BLANK = 45;
pub const UCHAR_POSIX_GRAPH = 46;
pub const UCHAR_POSIX_PRINT = 47;
pub const UCHAR_POSIX_XDIGIT = 48;
pub const UCHAR_CASED = 49;
pub const UCHAR_CASE_IGNORABLE = 50;
pub const UCHAR_CHANGES_WHEN_LOWERCASED = 51;
pub const UCHAR_CHANGES_WHEN_UPPERCASED = 52;
pub const UCHAR_CHANGES_WHEN_TITLECASED = 53;
pub const UCHAR_CHANGES_WHEN_CASEFOLDED = 54;
pub const UCHAR_CHANGES_WHEN_CASEMAPPED = 55;
pub const UCHAR_CHANGES_WHEN_NFKC_CASEFOLDED = 56;
pub const UCHAR_EMOJI = 57;
pub const UCHAR_EMOJI_PRESENTATION = 58;
pub const UCHAR_EMOJI_MODIFIER = 59;
pub const UCHAR_EMOJI_MODIFIER_BASE = 60;
pub const UCHAR_EMOJI_COMPONENT = 61;
pub const UCHAR_REGIONAL_INDICATOR = 62;
pub const UCHAR_PREPENDED_CONCATENATION_MARK = 63;
pub const UCHAR_EXTENDED_PICTOGRAPHIC = 64;
pub const UCHAR_BIDI_CLASS = 4096;
pub const UCHAR_INT_START = 4096;
pub const UCHAR_BLOCK = 4097;
pub const UCHAR_CANONICAL_COMBINING_CLASS = 4098;
pub const UCHAR_DECOMPOSITION_TYPE = 4099;
pub const UCHAR_EAST_ASIAN_WIDTH = 4100;
pub const UCHAR_GENERAL_CATEGORY = 4101;
pub const UCHAR_JOINING_GROUP = 4102;
pub const UCHAR_JOINING_TYPE = 4103;
pub const UCHAR_LINE_BREAK = 4104;
pub const UCHAR_NUMERIC_TYPE = 4105;
pub const UCHAR_SCRIPT = 4106;
pub const UCHAR_HANGUL_SYLLABLE_TYPE = 4107;
pub const UCHAR_NFD_QUICK_CHECK = 4108;
pub const UCHAR_NFKD_QUICK_CHECK = 4109;
pub const UCHAR_NFC_QUICK_CHECK = 4110;
pub const UCHAR_NFKC_QUICK_CHECK = 4111;
pub const UCHAR_LEAD_CANONICAL_COMBINING_CLASS = 4112;
pub const UCHAR_TRAIL_CANONICAL_COMBINING_CLASS = 4113;
pub const UCHAR_GRAPHEME_CLUSTER_BREAK = 4114;
pub const UCHAR_SENTENCE_BREAK = 4115;
pub const UCHAR_WORD_BREAK = 4116;
pub const UCHAR_BIDI_PAIRED_BRACKET_TYPE = 4117;
pub const UCHAR_INDIC_POSITIONAL_CATEGORY = 4118;
pub const UCHAR_INDIC_SYLLABIC_CATEGORY = 4119;
pub const UCHAR_VERTICAL_ORIENTATION = 4120;
pub const UCHAR_GENERAL_CATEGORY_MASK = 8192;
pub const UCHAR_MASK_START = 8192;
pub const UCHAR_NUMERIC_VALUE = 12288;
pub const UCHAR_DOUBLE_START = 12288;
pub const UCHAR_AGE = 16384;
pub const UCHAR_STRING_START = 16384;
pub const UCHAR_BIDI_MIRRORING_GLYPH = 16385;
pub const UCHAR_CASE_FOLDING = 16386;
pub const UCHAR_LOWERCASE_MAPPING = 16388;
pub const UCHAR_NAME = 16389;
pub const UCHAR_SIMPLE_CASE_FOLDING = 16390;
pub const UCHAR_SIMPLE_LOWERCASE_MAPPING = 16391;
pub const UCHAR_SIMPLE_TITLECASE_MAPPING = 16392;
pub const UCHAR_SIMPLE_UPPERCASE_MAPPING = 16393;
pub const UCHAR_TITLECASE_MAPPING = 16394;
pub const UCHAR_UPPERCASE_MAPPING = 16396;
pub const UCHAR_BIDI_PAIRED_BRACKET = 16397;
pub const UCHAR_SCRIPT_EXTENSIONS = 28672;
pub const UCHAR_OTHER_PROPERTY_START = 28672;
pub const UCHAR_INVALID_CODE = -1;
pub const U_UNASSIGNED = 0;
pub const U_GENERAL_OTHER_TYPES = 0;
pub const U_UPPERCASE_LETTER = 1;
pub const U_LOWERCASE_LETTER = 2;
pub const U_TITLECASE_LETTER = 3;
pub const U_MODIFIER_LETTER = 4;
pub const U_OTHER_LETTER = 5;
pub const U_NON_SPACING_MARK = 6;
pub const U_ENCLOSING_MARK = 7;
pub const U_COMBINING_SPACING_MARK = 8;
pub const U_DECIMAL_DIGIT_NUMBER = 9;
pub const U_LETTER_NUMBER = 10;
pub const U_OTHER_NUMBER = 11;
pub const U_SPACE_SEPARATOR = 12;
pub const U_LINE_SEPARATOR = 13;
pub const U_PARAGRAPH_SEPARATOR = 14;
pub const U_CONTROL_CHAR = 15;
pub const U_FORMAT_CHAR = 16;
pub const U_PRIVATE_USE_CHAR = 17;
pub const U_SURROGATE = 18;
pub const U_DASH_PUNCTUATION = 19;
pub const U_START_PUNCTUATION = 20;
pub const U_END_PUNCTUATION = 21;
pub const U_CONNECTOR_PUNCTUATION = 22;
pub const U_OTHER_PUNCTUATION = 23;
pub const U_MATH_SYMBOL = 24;
pub const U_CURRENCY_SYMBOL = 25;
pub const U_MODIFIER_SYMBOL = 26;
pub const U_OTHER_SYMBOL = 27;
pub const U_INITIAL_PUNCTUATION = 28;
pub const U_FINAL_PUNCTUATION = 29;
pub const U_CHAR_CATEGORY_COUNT = 30;
pub const U_LEFT_TO_RIGHT = 0;
pub const U_RIGHT_TO_LEFT = 1;
pub const U_EUROPEAN_NUMBER = 2;
pub const U_EUROPEAN_NUMBER_SEPARATOR = 3;
pub const U_EUROPEAN_NUMBER_TERMINATOR = 4;
pub const U_ARABIC_NUMBER = 5;
pub const U_COMMON_NUMBER_SEPARATOR = 6;
pub const U_BLOCK_SEPARATOR = 7;
pub const U_SEGMENT_SEPARATOR = 8;
pub const U_WHITE_SPACE_NEUTRAL = 9;
pub const U_OTHER_NEUTRAL = 10;
pub const U_LEFT_TO_RIGHT_EMBEDDING = 11;
pub const U_LEFT_TO_RIGHT_OVERRIDE = 12;
pub const U_RIGHT_TO_LEFT_ARABIC = 13;
pub const U_RIGHT_TO_LEFT_EMBEDDING = 14;
pub const U_RIGHT_TO_LEFT_OVERRIDE = 15;
pub const U_POP_DIRECTIONAL_FORMAT = 16;
pub const U_DIR_NON_SPACING_MARK = 17;
pub const U_BOUNDARY_NEUTRAL = 18;
pub const U_FIRST_STRONG_ISOLATE = 19;
pub const U_LEFT_TO_RIGHT_ISOLATE = 20;
pub const U_RIGHT_TO_LEFT_ISOLATE = 21;
pub const U_POP_DIRECTIONAL_ISOLATE = 22;
pub const U_BPT_NONE = 0;
pub const U_BPT_OPEN = 1;
pub const U_BPT_CLOSE = 2;
pub const UBLOCK_NO_BLOCK = 0;
pub const UBLOCK_BASIC_LATIN = 1;
pub const UBLOCK_LATIN_1_SUPPLEMENT = 2;
pub const UBLOCK_LATIN_EXTENDED_A = 3;
pub const UBLOCK_LATIN_EXTENDED_B = 4;
pub const UBLOCK_IPA_EXTENSIONS = 5;
pub const UBLOCK_SPACING_MODIFIER_LETTERS = 6;
pub const UBLOCK_COMBINING_DIACRITICAL_MARKS = 7;
pub const UBLOCK_GREEK = 8;
pub const UBLOCK_CYRILLIC = 9;
pub const UBLOCK_ARMENIAN = 10;
pub const UBLOCK_HEBREW = 11;
pub const UBLOCK_ARABIC = 12;
pub const UBLOCK_SYRIAC = 13;
pub const UBLOCK_THAANA = 14;
pub const UBLOCK_DEVANAGARI = 15;
pub const UBLOCK_BENGALI = 16;
pub const UBLOCK_GURMUKHI = 17;
pub const UBLOCK_GUJARATI = 18;
pub const UBLOCK_ORIYA = 19;
pub const UBLOCK_TAMIL = 20;
pub const UBLOCK_TELUGU = 21;
pub const UBLOCK_KANNADA = 22;
pub const UBLOCK_MALAYALAM = 23;
pub const UBLOCK_SINHALA = 24;
pub const UBLOCK_THAI = 25;
pub const UBLOCK_LAO = 26;
pub const UBLOCK_TIBETAN = 27;
pub const UBLOCK_MYANMAR = 28;
pub const UBLOCK_GEORGIAN = 29;
pub const UBLOCK_HANGUL_JAMO = 30;
pub const UBLOCK_ETHIOPIC = 31;
pub const UBLOCK_CHEROKEE = 32;
pub const UBLOCK_UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS = 33;
pub const UBLOCK_OGHAM = 34;
pub const UBLOCK_RUNIC = 35;
pub const UBLOCK_KHMER = 36;
pub const UBLOCK_MONGOLIAN = 37;
pub const UBLOCK_LATIN_EXTENDED_ADDITIONAL = 38;
pub const UBLOCK_GREEK_EXTENDED = 39;
pub const UBLOCK_GENERAL_PUNCTUATION = 40;
pub const UBLOCK_SUPERSCRIPTS_AND_SUBSCRIPTS = 41;
pub const UBLOCK_CURRENCY_SYMBOLS = 42;
pub const UBLOCK_COMBINING_MARKS_FOR_SYMBOLS = 43;
pub const UBLOCK_LETTERLIKE_SYMBOLS = 44;
pub const UBLOCK_NUMBER_FORMS = 45;
pub const UBLOCK_ARROWS = 46;
pub const UBLOCK_MATHEMATICAL_OPERATORS = 47;
pub const UBLOCK_MISCELLANEOUS_TECHNICAL = 48;
pub const UBLOCK_CONTROL_PICTURES = 49;
pub const UBLOCK_OPTICAL_CHARACTER_RECOGNITION = 50;
pub const UBLOCK_ENCLOSED_ALPHANUMERICS = 51;
pub const UBLOCK_BOX_DRAWING = 52;
pub const UBLOCK_BLOCK_ELEMENTS = 53;
pub const UBLOCK_GEOMETRIC_SHAPES = 54;
pub const UBLOCK_MISCELLANEOUS_SYMBOLS = 55;
pub const UBLOCK_DINGBATS = 56;
pub const UBLOCK_BRAILLE_PATTERNS = 57;
pub const UBLOCK_CJK_RADICALS_SUPPLEMENT = 58;
pub const UBLOCK_KANGXI_RADICALS = 59;
pub const UBLOCK_IDEOGRAPHIC_DESCRIPTION_CHARACTERS = 60;
pub const UBLOCK_CJK_SYMBOLS_AND_PUNCTUATION = 61;
pub const UBLOCK_HIRAGANA = 62;
pub const UBLOCK_KATAKANA = 63;
pub const UBLOCK_BOPOMOFO = 64;
pub const UBLOCK_HANGUL_COMPATIBILITY_JAMO = 65;
pub const UBLOCK_KANBUN = 66;
pub const UBLOCK_BOPOMOFO_EXTENDED = 67;
pub const UBLOCK_ENCLOSED_CJK_LETTERS_AND_MONTHS = 68;
pub const UBLOCK_CJK_COMPATIBILITY = 69;
pub const UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A = 70;
pub const UBLOCK_CJK_UNIFIED_IDEOGRAPHS = 71;
pub const UBLOCK_YI_SYLLABLES = 72;
pub const UBLOCK_YI_RADICALS = 73;
pub const UBLOCK_HANGUL_SYLLABLES = 74;
pub const UBLOCK_HIGH_SURROGATES = 75;
pub const UBLOCK_HIGH_PRIVATE_USE_SURROGATES = 76;
pub const UBLOCK_LOW_SURROGATES = 77;
pub const UBLOCK_PRIVATE_USE_AREA = 78;
pub const UBLOCK_PRIVATE_USE = 78;
pub const UBLOCK_CJK_COMPATIBILITY_IDEOGRAPHS = 79;
pub const UBLOCK_ALPHABETIC_PRESENTATION_FORMS = 80;
pub const UBLOCK_ARABIC_PRESENTATION_FORMS_A = 81;
pub const UBLOCK_COMBINING_HALF_MARKS = 82;
pub const UBLOCK_CJK_COMPATIBILITY_FORMS = 83;
pub const UBLOCK_SMALL_FORM_VARIANTS = 84;
pub const UBLOCK_ARABIC_PRESENTATION_FORMS_B = 85;
pub const UBLOCK_SPECIALS = 86;
pub const UBLOCK_HALFWIDTH_AND_FULLWIDTH_FORMS = 87;
pub const UBLOCK_OLD_ITALIC = 88;
pub const UBLOCK_GOTHIC = 89;
pub const UBLOCK_DESERET = 90;
pub const UBLOCK_BYZANTINE_MUSICAL_SYMBOLS = 91;
pub const UBLOCK_MUSICAL_SYMBOLS = 92;
pub const UBLOCK_MATHEMATICAL_ALPHANUMERIC_SYMBOLS = 93;
pub const UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B = 94;
pub const UBLOCK_CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT = 95;
pub const UBLOCK_TAGS = 96;
pub const UBLOCK_CYRILLIC_SUPPLEMENT = 97;
pub const UBLOCK_CYRILLIC_SUPPLEMENTARY = 97;
pub const UBLOCK_TAGALOG = 98;
pub const UBLOCK_HANUNOO = 99;
pub const UBLOCK_BUHID = 100;
pub const UBLOCK_TAGBANWA = 101;
pub const UBLOCK_MISCELLANEOUS_MATHEMATICAL_SYMBOLS_A = 102;
pub const UBLOCK_SUPPLEMENTAL_ARROWS_A = 103;
pub const UBLOCK_SUPPLEMENTAL_ARROWS_B = 104;
pub const UBLOCK_MISCELLANEOUS_MATHEMATICAL_SYMBOLS_B = 105;
pub const UBLOCK_SUPPLEMENTAL_MATHEMATICAL_OPERATORS = 106;
pub const UBLOCK_KATAKANA_PHONETIC_EXTENSIONS = 107;
pub const UBLOCK_VARIATION_SELECTORS = 108;
pub const UBLOCK_SUPPLEMENTARY_PRIVATE_USE_AREA_A = 109;
pub const UBLOCK_SUPPLEMENTARY_PRIVATE_USE_AREA_B = 110;
pub const UBLOCK_LIMBU = 111;
pub const UBLOCK_TAI_LE = 112;
pub const UBLOCK_KHMER_SYMBOLS = 113;
pub const UBLOCK_PHONETIC_EXTENSIONS = 114;
pub const UBLOCK_MISCELLANEOUS_SYMBOLS_AND_ARROWS = 115;
pub const UBLOCK_YIJING_HEXAGRAM_SYMBOLS = 116;
pub const UBLOCK_LINEAR_B_SYLLABARY = 117;
pub const UBLOCK_LINEAR_B_IDEOGRAMS = 118;
pub const UBLOCK_AEGEAN_NUMBERS = 119;
pub const UBLOCK_UGARITIC = 120;
pub const UBLOCK_SHAVIAN = 121;
pub const UBLOCK_OSMANYA = 122;
pub const UBLOCK_CYPRIOT_SYLLABARY = 123;
pub const UBLOCK_TAI_XUAN_JING_SYMBOLS = 124;
pub const UBLOCK_VARIATION_SELECTORS_SUPPLEMENT = 125;
pub const UBLOCK_ANCIENT_GREEK_MUSICAL_NOTATION = 126;
pub const UBLOCK_ANCIENT_GREEK_NUMBERS = 127;
pub const UBLOCK_ARABIC_SUPPLEMENT = 128;
pub const UBLOCK_BUGINESE = 129;
pub const UBLOCK_CJK_STROKES = 130;
pub const UBLOCK_COMBINING_DIACRITICAL_MARKS_SUPPLEMENT = 131;
pub const UBLOCK_COPTIC = 132;
pub const UBLOCK_ETHIOPIC_EXTENDED = 133;
pub const UBLOCK_ETHIOPIC_SUPPLEMENT = 134;
pub const UBLOCK_GEORGIAN_SUPPLEMENT = 135;
pub const UBLOCK_GLAGOLITIC = 136;
pub const UBLOCK_KHAROSHTHI = 137;
pub const UBLOCK_MODIFIER_TONE_LETTERS = 138;
pub const UBLOCK_NEW_TAI_LUE = 139;
pub const UBLOCK_OLD_PERSIAN = 140;
pub const UBLOCK_PHONETIC_EXTENSIONS_SUPPLEMENT = 141;
pub const UBLOCK_SUPPLEMENTAL_PUNCTUATION = 142;
pub const UBLOCK_SYLOTI_NAGRI = 143;
pub const UBLOCK_TIFINAGH = 144;
pub const UBLOCK_VERTICAL_FORMS = 145;
pub const UBLOCK_NKO = 146;
pub const UBLOCK_BALINESE = 147;
pub const UBLOCK_LATIN_EXTENDED_C = 148;
pub const UBLOCK_LATIN_EXTENDED_D = 149;
pub const UBLOCK_PHAGS_PA = 150;
pub const UBLOCK_PHOENICIAN = 151;
pub const UBLOCK_CUNEIFORM = 152;
pub const UBLOCK_CUNEIFORM_NUMBERS_AND_PUNCTUATION = 153;
pub const UBLOCK_COUNTING_ROD_NUMERALS = 154;
pub const UBLOCK_SUNDANESE = 155;
pub const UBLOCK_LEPCHA = 156;
pub const UBLOCK_OL_CHIKI = 157;
pub const UBLOCK_CYRILLIC_EXTENDED_A = 158;
pub const UBLOCK_VAI = 159;
pub const UBLOCK_CYRILLIC_EXTENDED_B = 160;
pub const UBLOCK_SAURASHTRA = 161;
pub const UBLOCK_KAYAH_LI = 162;
pub const UBLOCK_REJANG = 163;
pub const UBLOCK_CHAM = 164;
pub const UBLOCK_ANCIENT_SYMBOLS = 165;
pub const UBLOCK_PHAISTOS_DISC = 166;
pub const UBLOCK_LYCIAN = 167;
pub const UBLOCK_CARIAN = 168;
pub const UBLOCK_LYDIAN = 169;
pub const UBLOCK_MAHJONG_TILES = 170;
pub const UBLOCK_DOMINO_TILES = 171;
pub const UBLOCK_SAMARITAN = 172;
pub const UBLOCK_UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS_EXTENDED = 173;
pub const UBLOCK_TAI_THAM = 174;
pub const UBLOCK_VEDIC_EXTENSIONS = 175;
pub const UBLOCK_LISU = 176;
pub const UBLOCK_BAMUM = 177;
pub const UBLOCK_COMMON_INDIC_NUMBER_FORMS = 178;
pub const UBLOCK_DEVANAGARI_EXTENDED = 179;
pub const UBLOCK_HANGUL_JAMO_EXTENDED_A = 180;
pub const UBLOCK_JAVANESE = 181;
pub const UBLOCK_MYANMAR_EXTENDED_A = 182;
pub const UBLOCK_TAI_VIET = 183;
pub const UBLOCK_MEETEI_MAYEK = 184;
pub const UBLOCK_HANGUL_JAMO_EXTENDED_B = 185;
pub const UBLOCK_IMPERIAL_ARAMAIC = 186;
pub const UBLOCK_OLD_SOUTH_ARABIAN = 187;
pub const UBLOCK_AVESTAN = 188;
pub const UBLOCK_INSCRIPTIONAL_PARTHIAN = 189;
pub const UBLOCK_INSCRIPTIONAL_PAHLAVI = 190;
pub const UBLOCK_OLD_TURKIC = 191;
pub const UBLOCK_RUMI_NUMERAL_SYMBOLS = 192;
pub const UBLOCK_KAITHI = 193;
pub const UBLOCK_EGYPTIAN_HIEROGLYPHS = 194;
pub const UBLOCK_ENCLOSED_ALPHANUMERIC_SUPPLEMENT = 195;
pub const UBLOCK_ENCLOSED_IDEOGRAPHIC_SUPPLEMENT = 196;
pub const UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_C = 197;
pub const UBLOCK_MANDAIC = 198;
pub const UBLOCK_BATAK = 199;
pub const UBLOCK_ETHIOPIC_EXTENDED_A = 200;
pub const UBLOCK_BRAHMI = 201;
pub const UBLOCK_BAMUM_SUPPLEMENT = 202;
pub const UBLOCK_KANA_SUPPLEMENT = 203;
pub const UBLOCK_PLAYING_CARDS = 204;
pub const UBLOCK_MISCELLANEOUS_SYMBOLS_AND_PICTOGRAPHS = 205;
pub const UBLOCK_EMOTICONS = 206;
pub const UBLOCK_TRANSPORT_AND_MAP_SYMBOLS = 207;
pub const UBLOCK_ALCHEMICAL_SYMBOLS = 208;
pub const UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_D = 209;
pub const UBLOCK_ARABIC_EXTENDED_A = 210;
pub const UBLOCK_ARABIC_MATHEMATICAL_ALPHABETIC_SYMBOLS = 211;
pub const UBLOCK_CHAKMA = 212;
pub const UBLOCK_MEETEI_MAYEK_EXTENSIONS = 213;
pub const UBLOCK_MEROITIC_CURSIVE = 214;
pub const UBLOCK_MEROITIC_HIEROGLYPHS = 215;
pub const UBLOCK_MIAO = 216;
pub const UBLOCK_SHARADA = 217;
pub const UBLOCK_SORA_SOMPENG = 218;
pub const UBLOCK_SUNDANESE_SUPPLEMENT = 219;
pub const UBLOCK_TAKRI = 220;
pub const UBLOCK_BASSA_VAH = 221;
pub const UBLOCK_CAUCASIAN_ALBANIAN = 222;
pub const UBLOCK_COPTIC_EPACT_NUMBERS = 223;
pub const UBLOCK_COMBINING_DIACRITICAL_MARKS_EXTENDED = 224;
pub const UBLOCK_DUPLOYAN = 225;
pub const UBLOCK_ELBASAN = 226;
pub const UBLOCK_GEOMETRIC_SHAPES_EXTENDED = 227;
pub const UBLOCK_GRANTHA = 228;
pub const UBLOCK_KHOJKI = 229;
pub const UBLOCK_KHUDAWADI = 230;
pub const UBLOCK_LATIN_EXTENDED_E = 231;
pub const UBLOCK_LINEAR_A = 232;
pub const UBLOCK_MAHAJANI = 233;
pub const UBLOCK_MANICHAEAN = 234;
pub const UBLOCK_MENDE_KIKAKUI = 235;
pub const UBLOCK_MODI = 236;
pub const UBLOCK_MRO = 237;
pub const UBLOCK_MYANMAR_EXTENDED_B = 238;
pub const UBLOCK_NABATAEAN = 239;
pub const UBLOCK_OLD_NORTH_ARABIAN = 240;
pub const UBLOCK_OLD_PERMIC = 241;
pub const UBLOCK_ORNAMENTAL_DINGBATS = 242;
pub const UBLOCK_PAHAWH_HMONG = 243;
pub const UBLOCK_PALMYRENE = 244;
pub const UBLOCK_PAU_CIN_HAU = 245;
pub const UBLOCK_PSALTER_PAHLAVI = 246;
pub const UBLOCK_SHORTHAND_FORMAT_CONTROLS = 247;
pub const UBLOCK_SIDDHAM = 248;
pub const UBLOCK_SINHALA_ARCHAIC_NUMBERS = 249;
pub const UBLOCK_SUPPLEMENTAL_ARROWS_C = 250;
pub const UBLOCK_TIRHUTA = 251;
pub const UBLOCK_WARANG_CITI = 252;
pub const UBLOCK_AHOM = 253;
pub const UBLOCK_ANATOLIAN_HIEROGLYPHS = 254;
pub const UBLOCK_CHEROKEE_SUPPLEMENT = 255;
pub const UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_E = 256;
pub const UBLOCK_EARLY_DYNASTIC_CUNEIFORM = 257;
pub const UBLOCK_HATRAN = 258;
pub const UBLOCK_MULTANI = 259;
pub const UBLOCK_OLD_HUNGARIAN = 260;
pub const UBLOCK_SUPPLEMENTAL_SYMBOLS_AND_PICTOGRAPHS = 261;
pub const UBLOCK_SUTTON_SIGNWRITING = 262;
pub const UBLOCK_ADLAM = 263;
pub const UBLOCK_BHAIKSUKI = 264;
pub const UBLOCK_CYRILLIC_EXTENDED_C = 265;
pub const UBLOCK_GLAGOLITIC_SUPPLEMENT = 266;
pub const UBLOCK_IDEOGRAPHIC_SYMBOLS_AND_PUNCTUATION = 267;
pub const UBLOCK_MARCHEN = 268;
pub const UBLOCK_MONGOLIAN_SUPPLEMENT = 269;
pub const UBLOCK_NEWA = 270;
pub const UBLOCK_OSAGE = 271;
pub const UBLOCK_TANGUT = 272;
pub const UBLOCK_TANGUT_COMPONENTS = 273;
pub const UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_F = 274;
pub const UBLOCK_KANA_EXTENDED_A = 275;
pub const UBLOCK_MASARAM_GONDI = 276;
pub const UBLOCK_NUSHU = 277;
pub const UBLOCK_SOYOMBO = 278;
pub const UBLOCK_SYRIAC_SUPPLEMENT = 279;
pub const UBLOCK_ZANABAZAR_SQUARE = 280;
pub const UBLOCK_CHESS_SYMBOLS = 281;
pub const UBLOCK_DOGRA = 282;
pub const UBLOCK_GEORGIAN_EXTENDED = 283;
pub const UBLOCK_GUNJALA_GONDI = 284;
pub const UBLOCK_HANIFI_ROHINGYA = 285;
pub const UBLOCK_INDIC_SIYAQ_NUMBERS = 286;
pub const UBLOCK_MAKASAR = 287;
pub const UBLOCK_MAYAN_NUMERALS = 288;
pub const UBLOCK_MEDEFAIDRIN = 289;
pub const UBLOCK_OLD_SOGDIAN = 290;
pub const UBLOCK_SOGDIAN = 291;
pub const UBLOCK_EGYPTIAN_HIEROGLYPH_FORMAT_CONTROLS = 292;
pub const UBLOCK_ELYMAIC = 293;
pub const UBLOCK_NANDINAGARI = 294;
pub const UBLOCK_NYIAKENG_PUACHUE_HMONG = 295;
pub const UBLOCK_OTTOMAN_SIYAQ_NUMBERS = 296;
pub const UBLOCK_SMALL_KANA_EXTENSION = 297;
pub const UBLOCK_SYMBOLS_AND_PICTOGRAPHS_EXTENDED_A = 298;
pub const UBLOCK_TAMIL_SUPPLEMENT = 299;
pub const UBLOCK_WANCHO = 300;
pub const UBLOCK_CHORASMIAN = 301;
pub const UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_G = 302;
pub const UBLOCK_DIVES_AKURU = 303;
pub const UBLOCK_KHITAN_SMALL_SCRIPT = 304;
pub const UBLOCK_LISU_SUPPLEMENT = 305;
pub const UBLOCK_SYMBOLS_FOR_LEGACY_COMPUTING = 306;
pub const UBLOCK_TANGUT_SUPPLEMENT = 307;
pub const UBLOCK_YEZIDI = 308;
pub const UBLOCK_INVALID_CODE = -1;
pub const U_EA_NEUTRAL = 0;
pub const U_EA_AMBIGUOUS = 1;
pub const U_EA_HALFWIDTH = 2;
pub const U_EA_FULLWIDTH = 3;
pub const U_EA_NARROW = 4;
pub const U_EA_WIDE = 5;
pub const U_UNICODE_CHAR_NAME = 0;
pub const U_EXTENDED_CHAR_NAME = 2;
pub const U_CHAR_NAME_ALIAS = 3;
pub const U_SHORT_PROPERTY_NAME = 0;
pub const U_LONG_PROPERTY_NAME = 1;
pub const U_DT_NONE = 0;
pub const U_DT_CANONICAL = 1;
pub const U_DT_COMPAT = 2;
pub const U_DT_CIRCLE = 3;
pub const U_DT_FINAL = 4;
pub const U_DT_FONT = 5;
pub const U_DT_FRACTION = 6;
pub const U_DT_INITIAL = 7;
pub const U_DT_ISOLATED = 8;
pub const U_DT_MEDIAL = 9;
pub const U_DT_NARROW = 10;
pub const U_DT_NOBREAK = 11;
pub const U_DT_SMALL = 12;
pub const U_DT_SQUARE = 13;
pub const U_DT_SUB = 14;
pub const U_DT_SUPER = 15;
pub const U_DT_VERTICAL = 16;
pub const U_DT_WIDE = 17;
pub const U_JT_NON_JOINING = 0;
pub const U_JT_JOIN_CAUSING = 1;
pub const U_JT_DUAL_JOINING = 2;
pub const U_JT_LEFT_JOINING = 3;
pub const U_JT_RIGHT_JOINING = 4;
pub const U_JT_TRANSPARENT = 5;
pub const U_JG_NO_JOINING_GROUP = 0;
pub const U_JG_AIN = 1;
pub const U_JG_ALAPH = 2;
pub const U_JG_ALEF = 3;
pub const U_JG_BEH = 4;
pub const U_JG_BETH = 5;
pub const U_JG_DAL = 6;
pub const U_JG_DALATH_RISH = 7;
pub const U_JG_E = 8;
pub const U_JG_FEH = 9;
pub const U_JG_FINAL_SEMKATH = 10;
pub const U_JG_GAF = 11;
pub const U_JG_GAMAL = 12;
pub const U_JG_HAH = 13;
pub const U_JG_TEH_MARBUTA_GOAL = 14;
pub const U_JG_HAMZA_ON_HEH_GOAL = 14;
pub const U_JG_HE = 15;
pub const U_JG_HEH = 16;
pub const U_JG_HEH_GOAL = 17;
pub const U_JG_HETH = 18;
pub const U_JG_KAF = 19;
pub const U_JG_KAPH = 20;
pub const U_JG_KNOTTED_HEH = 21;
pub const U_JG_LAM = 22;
pub const U_JG_LAMADH = 23;
pub const U_JG_MEEM = 24;
pub const U_JG_MIM = 25;
pub const U_JG_NOON = 26;
pub const U_JG_NUN = 27;
pub const U_JG_PE = 28;
pub const U_JG_QAF = 29;
pub const U_JG_QAPH = 30;
pub const U_JG_REH = 31;
pub const U_JG_REVERSED_PE = 32;
pub const U_JG_SAD = 33;
pub const U_JG_SADHE = 34;
pub const U_JG_SEEN = 35;
pub const U_JG_SEMKATH = 36;
pub const U_JG_SHIN = 37;
pub const U_JG_SWASH_KAF = 38;
pub const U_JG_SYRIAC_WAW = 39;
pub const U_JG_TAH = 40;
pub const U_JG_TAW = 41;
pub const U_JG_TEH_MARBUTA = 42;
pub const U_JG_TETH = 43;
pub const U_JG_WAW = 44;
pub const U_JG_YEH = 45;
pub const U_JG_YEH_BARREE = 46;
pub const U_JG_YEH_WITH_TAIL = 47;
pub const U_JG_YUDH = 48;
pub const U_JG_YUDH_HE = 49;
pub const U_JG_ZAIN = 50;
pub const U_JG_FE = 51;
pub const U_JG_KHAPH = 52;
pub const U_JG_ZHAIN = 53;
pub const U_JG_BURUSHASKI_YEH_BARREE = 54;
pub const U_JG_FARSI_YEH = 55;
pub const U_JG_NYA = 56;
pub const U_JG_ROHINGYA_YEH = 57;
pub const U_JG_MANICHAEAN_ALEPH = 58;
pub const U_JG_MANICHAEAN_AYIN = 59;
pub const U_JG_MANICHAEAN_BETH = 60;
pub const U_JG_MANICHAEAN_DALETH = 61;
pub const U_JG_MANICHAEAN_DHAMEDH = 62;
pub const U_JG_MANICHAEAN_FIVE = 63;
pub const U_JG_MANICHAEAN_GIMEL = 64;
pub const U_JG_MANICHAEAN_HETH = 65;
pub const U_JG_MANICHAEAN_HUNDRED = 66;
pub const U_JG_MANICHAEAN_KAPH = 67;
pub const U_JG_MANICHAEAN_LAMEDH = 68;
pub const U_JG_MANICHAEAN_MEM = 69;
pub const U_JG_MANICHAEAN_NUN = 70;
pub const U_JG_MANICHAEAN_ONE = 71;
pub const U_JG_MANICHAEAN_PE = 72;
pub const U_JG_MANICHAEAN_QOPH = 73;
pub const U_JG_MANICHAEAN_RESH = 74;
pub const U_JG_MANICHAEAN_SADHE = 75;
pub const U_JG_MANICHAEAN_SAMEKH = 76;
pub const U_JG_MANICHAEAN_TAW = 77;
pub const U_JG_MANICHAEAN_TEN = 78;
pub const U_JG_MANICHAEAN_TETH = 79;
pub const U_JG_MANICHAEAN_THAMEDH = 80;
pub const U_JG_MANICHAEAN_TWENTY = 81;
pub const U_JG_MANICHAEAN_WAW = 82;
pub const U_JG_MANICHAEAN_YODH = 83;
pub const U_JG_MANICHAEAN_ZAYIN = 84;
pub const U_JG_STRAIGHT_WAW = 85;
pub const U_JG_AFRICAN_FEH = 86;
pub const U_JG_AFRICAN_NOON = 87;
pub const U_JG_AFRICAN_QAF = 88;
pub const U_JG_MALAYALAM_BHA = 89;
pub const U_JG_MALAYALAM_JA = 90;
pub const U_JG_MALAYALAM_LLA = 91;
pub const U_JG_MALAYALAM_LLLA = 92;
pub const U_JG_MALAYALAM_NGA = 93;
pub const U_JG_MALAYALAM_NNA = 94;
pub const U_JG_MALAYALAM_NNNA = 95;
pub const U_JG_MALAYALAM_NYA = 96;
pub const U_JG_MALAYALAM_RA = 97;
pub const U_JG_MALAYALAM_SSA = 98;
pub const U_JG_MALAYALAM_TTA = 99;
pub const U_JG_HANIFI_ROHINGYA_KINNA_YA = 100;
pub const U_JG_HANIFI_ROHINGYA_PA = 101;
pub const U_JG_THIN_YEH = 102;
pub const U_JG_VERTICAL_TAIL = 103;
pub const U_GCB_OTHER = 0;
pub const U_GCB_CONTROL = 1;
pub const U_GCB_CR = 2;
pub const U_GCB_EXTEND = 3;
pub const U_GCB_L = 4;
pub const U_GCB_LF = 5;
pub const U_GCB_LV = 6;
pub const U_GCB_LVT = 7;
pub const U_GCB_T = 8;
pub const U_GCB_V = 9;
pub const U_GCB_SPACING_MARK = 10;
pub const U_GCB_PREPEND = 11;
pub const U_GCB_REGIONAL_INDICATOR = 12;
pub const U_GCB_E_BASE = 13;
pub const U_GCB_E_BASE_GAZ = 14;
pub const U_GCB_E_MODIFIER = 15;
pub const U_GCB_GLUE_AFTER_ZWJ = 16;
pub const U_GCB_ZWJ = 17;
pub const U_WB_OTHER = 0;
pub const U_WB_ALETTER = 1;
pub const U_WB_FORMAT = 2;
pub const U_WB_KATAKANA = 3;
pub const U_WB_MIDLETTER = 4;
pub const U_WB_MIDNUM = 5;
pub const U_WB_NUMERIC = 6;
pub const U_WB_EXTENDNUMLET = 7;
pub const U_WB_CR = 8;
pub const U_WB_EXTEND = 9;
pub const U_WB_LF = 10;
pub const U_WB_MIDNUMLET = 11;
pub const U_WB_NEWLINE = 12;
pub const U_WB_REGIONAL_INDICATOR = 13;
pub const U_WB_HEBREW_LETTER = 14;
pub const U_WB_SINGLE_QUOTE = 15;
pub const U_WB_DOUBLE_QUOTE = 16;
pub const U_WB_E_BASE = 17;
pub const U_WB_E_BASE_GAZ = 18;
pub const U_WB_E_MODIFIER = 19;
pub const U_WB_GLUE_AFTER_ZWJ = 20;
pub const U_WB_ZWJ = 21;
pub const U_WB_WSEGSPACE = 22;
pub const U_SB_OTHER = 0;
pub const U_SB_ATERM = 1;
pub const U_SB_CLOSE = 2;
pub const U_SB_FORMAT = 3;
pub const U_SB_LOWER = 4;
pub const U_SB_NUMERIC = 5;
pub const U_SB_OLETTER = 6;
pub const U_SB_SEP = 7;
pub const U_SB_SP = 8;
pub const U_SB_STERM = 9;
pub const U_SB_UPPER = 10;
pub const U_SB_CR = 11;
pub const U_SB_EXTEND = 12;
pub const U_SB_LF = 13;
pub const U_SB_SCONTINUE = 14;
pub const U_LB_UNKNOWN = 0;
pub const U_LB_AMBIGUOUS = 1;
pub const U_LB_ALPHABETIC = 2;
pub const U_LB_BREAK_BOTH = 3;
pub const U_LB_BREAK_AFTER = 4;
pub const U_LB_BREAK_BEFORE = 5;
pub const U_LB_MANDATORY_BREAK = 6;
pub const U_LB_CONTINGENT_BREAK = 7;
pub const U_LB_CLOSE_PUNCTUATION = 8;
pub const U_LB_COMBINING_MARK = 9;
pub const U_LB_CARRIAGE_RETURN = 10;
pub const U_LB_EXCLAMATION = 11;
pub const U_LB_GLUE = 12;
pub const U_LB_HYPHEN = 13;
pub const U_LB_IDEOGRAPHIC = 14;
pub const U_LB_INSEPARABLE = 15;
pub const U_LB_INSEPERABLE = 15;
pub const U_LB_INFIX_NUMERIC = 16;
pub const U_LB_LINE_FEED = 17;
pub const U_LB_NONSTARTER = 18;
pub const U_LB_NUMERIC = 19;
pub const U_LB_OPEN_PUNCTUATION = 20;
pub const U_LB_POSTFIX_NUMERIC = 21;
pub const U_LB_PREFIX_NUMERIC = 22;
pub const U_LB_QUOTATION = 23;
pub const U_LB_COMPLEX_CONTEXT = 24;
pub const U_LB_SURROGATE = 25;
pub const U_LB_SPACE = 26;
pub const U_LB_BREAK_SYMBOLS = 27;
pub const U_LB_ZWSPACE = 28;
pub const U_LB_NEXT_LINE = 29;
pub const U_LB_WORD_JOINER = 30;
pub const U_LB_H2 = 31;
pub const U_LB_H3 = 32;
pub const U_LB_JL = 33;
pub const U_LB_JT = 34;
pub const U_LB_JV = 35;
pub const U_LB_CLOSE_PARENTHESIS = 36;
pub const U_LB_CONDITIONAL_JAPANESE_STARTER = 37;
pub const U_LB_HEBREW_LETTER = 38;
pub const U_LB_REGIONAL_INDICATOR = 39;
pub const U_LB_E_BASE = 40;
pub const U_LB_E_MODIFIER = 41;
pub const U_LB_ZWJ = 42;
pub const U_NT_NONE = 0;
pub const U_NT_DECIMAL = 1;
pub const U_NT_DIGIT = 2;
pub const U_NT_NUMERIC = 3;
pub const U_HST_NOT_APPLICABLE = 0;
pub const U_HST_LEADING_JAMO = 1;
pub const U_HST_VOWEL_JAMO = 2;
pub const U_HST_TRAILING_JAMO = 3;
pub const U_HST_LV_SYLLABLE = 4;
pub const U_HST_LVT_SYLLABLE = 5;
pub const U_INPC_NA = 0;
pub const U_INPC_BOTTOM = 1;
pub const U_INPC_BOTTOM_AND_LEFT = 2;
pub const U_INPC_BOTTOM_AND_RIGHT = 3;
pub const U_INPC_LEFT = 4;
pub const U_INPC_LEFT_AND_RIGHT = 5;
pub const U_INPC_OVERSTRUCK = 6;
pub const U_INPC_RIGHT = 7;
pub const U_INPC_TOP = 8;
pub const U_INPC_TOP_AND_BOTTOM = 9;
pub const U_INPC_TOP_AND_BOTTOM_AND_RIGHT = 10;
pub const U_INPC_TOP_AND_LEFT = 11;
pub const U_INPC_TOP_AND_LEFT_AND_RIGHT = 12;
pub const U_INPC_TOP_AND_RIGHT = 13;
pub const U_INPC_VISUAL_ORDER_LEFT = 14;
pub const U_INPC_TOP_AND_BOTTOM_AND_LEFT = 15;
pub const U_INSC_OTHER = 0;
pub const U_INSC_AVAGRAHA = 1;
pub const U_INSC_BINDU = 2;
pub const U_INSC_BRAHMI_JOINING_NUMBER = 3;
pub const U_INSC_CANTILLATION_MARK = 4;
pub const U_INSC_CONSONANT = 5;
pub const U_INSC_CONSONANT_DEAD = 6;
pub const U_INSC_CONSONANT_FINAL = 7;
pub const U_INSC_CONSONANT_HEAD_LETTER = 8;
pub const U_INSC_CONSONANT_INITIAL_POSTFIXED = 9;
pub const U_INSC_CONSONANT_KILLER = 10;
pub const U_INSC_CONSONANT_MEDIAL = 11;
pub const U_INSC_CONSONANT_PLACEHOLDER = 12;
pub const U_INSC_CONSONANT_PRECEDING_REPHA = 13;
pub const U_INSC_CONSONANT_PREFIXED = 14;
pub const U_INSC_CONSONANT_SUBJOINED = 15;
pub const U_INSC_CONSONANT_SUCCEEDING_REPHA = 16;
pub const U_INSC_CONSONANT_WITH_STACKER = 17;
pub const U_INSC_GEMINATION_MARK = 18;
pub const U_INSC_INVISIBLE_STACKER = 19;
pub const U_INSC_JOINER = 20;
pub const U_INSC_MODIFYING_LETTER = 21;
pub const U_INSC_NON_JOINER = 22;
pub const U_INSC_NUKTA = 23;
pub const U_INSC_NUMBER = 24;
pub const U_INSC_NUMBER_JOINER = 25;
pub const U_INSC_PURE_KILLER = 26;
pub const U_INSC_REGISTER_SHIFTER = 27;
pub const U_INSC_SYLLABLE_MODIFIER = 28;
pub const U_INSC_TONE_LETTER = 29;
pub const U_INSC_TONE_MARK = 30;
pub const U_INSC_VIRAMA = 31;
pub const U_INSC_VISARGA = 32;
pub const U_INSC_VOWEL = 33;
pub const U_INSC_VOWEL_DEPENDENT = 34;
pub const U_INSC_VOWEL_INDEPENDENT = 35;
pub const U_VO_ROTATED = 0;
pub const U_VO_TRANSFORMED_ROTATED = 1;
pub const U_VO_TRANSFORMED_UPRIGHT = 2;
pub const U_VO_UPRIGHT = 3;
pub const UBIDI_LTR = 0;
pub const UBIDI_RTL = 1;
pub const UBIDI_MIXED = 2;
pub const UBIDI_NEUTRAL = 3;
pub const UBIDI_REORDER_DEFAULT = 0;
pub const UBIDI_REORDER_NUMBERS_SPECIAL = 1;
pub const UBIDI_REORDER_GROUP_NUMBERS_WITH_R = 2;
pub const UBIDI_REORDER_RUNS_ONLY = 3;
pub const UBIDI_REORDER_INVERSE_NUMBERS_AS_L = 4;
pub const UBIDI_REORDER_INVERSE_LIKE_DIRECT = 5;
pub const UBIDI_REORDER_INVERSE_FOR_NUMBERS_SPECIAL = 6;
pub const UBIDI_OPTION_DEFAULT = 0;
pub const UBIDI_OPTION_INSERT_MARKS = 1;
pub const UBIDI_OPTION_REMOVE_CONTROLS = 2;
pub const UBIDI_OPTION_STREAMING = 4;
pub const UBIDI_LOGICAL = 0;
pub const UBIDI_VISUAL = 1;
pub const UBIDI_MIRRORING_OFF = 0;
pub const UBIDI_MIRRORING_ON = 1;
pub const USET_SPAN_NOT_CONTAINED = 0;
pub const USET_SPAN_CONTAINED = 1;
pub const USET_SPAN_SIMPLE = 2;
pub const UNORM2_COMPOSE = 0;
pub const UNORM2_DECOMPOSE = 1;
pub const UNORM2_FCD = 2;
pub const UNORM2_COMPOSE_CONTIGUOUS = 3;
pub const UNORM_NO = 0;
pub const UNORM_YES = 1;
pub const UNORM_MAYBE = 2;
pub const UNORM_NONE = 1;
pub const UNORM_NFD = 2;
pub const UNORM_NFKD = 3;
pub const UNORM_NFC = 4;
pub const UNORM_DEFAULT = 4;
pub const UNORM_NFKC = 5;
pub const UNORM_FCD = 6;
pub const UNORM_MODE_COUNT = 7;
pub const USPREP_RFC3491_NAMEPREP = 0;
pub const USPREP_RFC3530_NFS4_CS_PREP = 1;
pub const USPREP_RFC3530_NFS4_CS_PREP_CI = 2;
pub const USPREP_RFC3530_NFS4_CIS_PREP = 3;
pub const USPREP_RFC3530_NFS4_MIXED_PREP_PREFIX = 4;
pub const USPREP_RFC3530_NFS4_MIXED_PREP_SUFFIX = 5;
pub const USPREP_RFC3722_ISCSI = 6;
pub const USPREP_RFC3920_NODEPREP = 7;
pub const USPREP_RFC3920_RESOURCEPREP = 8;
pub const USPREP_RFC4011_MIB = 9;
pub const USPREP_RFC4013_SASLPREP = 10;
pub const USPREP_RFC4505_TRACE = 11;
pub const USPREP_RFC4518_LDAP = 12;
pub const USPREP_RFC4518_LDAP_CI = 13;
pub const UBRK_CHARACTER = 0;
pub const UBRK_WORD = 1;
pub const UBRK_LINE = 2;
pub const UBRK_SENTENCE = 3;
pub const UBRK_WORD_NONE = 0;
pub const UBRK_WORD_NONE_LIMIT = 100;
pub const UBRK_WORD_NUMBER = 100;
pub const UBRK_WORD_NUMBER_LIMIT = 200;
pub const UBRK_WORD_LETTER = 200;
pub const UBRK_WORD_LETTER_LIMIT = 300;
pub const UBRK_WORD_KANA = 300;
pub const UBRK_WORD_KANA_LIMIT = 400;
pub const UBRK_WORD_IDEO = 400;
pub const UBRK_WORD_IDEO_LIMIT = 500;
pub const UBRK_LINE_SOFT = 0;
pub const UBRK_LINE_SOFT_LIMIT = 100;
pub const UBRK_LINE_HARD = 100;
pub const UBRK_LINE_HARD_LIMIT = 200;
pub const UBRK_SENTENCE_TERM = 0;
pub const UBRK_SENTENCE_TERM_LIMIT = 100;
pub const UBRK_SENTENCE_SEP = 100;
pub const UBRK_SENTENCE_SEP_LIMIT = 200;
pub const UCAL_TRADITIONAL = 0;
pub const UCAL_DEFAULT = 0;
pub const UCAL_GREGORIAN = 1;
pub const UCAL_ERA = 0;
pub const UCAL_YEAR = 1;
pub const UCAL_MONTH = 2;
pub const UCAL_WEEK_OF_YEAR = 3;
pub const UCAL_WEEK_OF_MONTH = 4;
pub const UCAL_DATE = 5;
pub const UCAL_DAY_OF_YEAR = 6;
pub const UCAL_DAY_OF_WEEK = 7;
pub const UCAL_DAY_OF_WEEK_IN_MONTH = 8;
pub const UCAL_AM_PM = 9;
pub const UCAL_HOUR = 10;
pub const UCAL_HOUR_OF_DAY = 11;
pub const UCAL_MINUTE = 12;
pub const UCAL_SECOND = 13;
pub const UCAL_MILLISECOND = 14;
pub const UCAL_ZONE_OFFSET = 15;
pub const UCAL_DST_OFFSET = 16;
pub const UCAL_YEAR_WOY = 17;
pub const UCAL_DOW_LOCAL = 18;
pub const UCAL_EXTENDED_YEAR = 19;
pub const UCAL_JULIAN_DAY = 20;
pub const UCAL_MILLISECONDS_IN_DAY = 21;
pub const UCAL_IS_LEAP_MONTH = 22;
pub const UCAL_FIELD_COUNT = 23;
pub const UCAL_DAY_OF_MONTH = 5;
pub const UCAL_SUNDAY = 1;
pub const UCAL_MONDAY = 2;
pub const UCAL_TUESDAY = 3;
pub const UCAL_WEDNESDAY = 4;
pub const UCAL_THURSDAY = 5;
pub const UCAL_FRIDAY = 6;
pub const UCAL_SATURDAY = 7;
pub const UCAL_JANUARY = 0;
pub const UCAL_FEBRUARY = 1;
pub const UCAL_MARCH = 2;
pub const UCAL_APRIL = 3;
pub const UCAL_MAY = 4;
pub const UCAL_JUNE = 5;
pub const UCAL_JULY = 6;
pub const UCAL_AUGUST = 7;
pub const UCAL_SEPTEMBER = 8;
pub const UCAL_OCTOBER = 9;
pub const UCAL_NOVEMBER = 10;
pub const UCAL_DECEMBER = 11;
pub const UCAL_UNDECIMBER = 12;
pub const UCAL_AM = 0;
pub const UCAL_PM = 1;
pub const UCAL_ZONE_TYPE_ANY = 0;
pub const UCAL_ZONE_TYPE_CANONICAL = 1;
pub const UCAL_ZONE_TYPE_CANONICAL_LOCATION = 2;
pub const UCAL_STANDARD = 0;
pub const UCAL_SHORT_STANDARD = 1;
pub const UCAL_DST = 2;
pub const UCAL_SHORT_DST = 3;
pub const UCAL_LENIENT = 0;
pub const UCAL_FIRST_DAY_OF_WEEK = 1;
pub const UCAL_MINIMAL_DAYS_IN_FIRST_WEEK = 2;
pub const UCAL_REPEATED_WALL_TIME = 3;
pub const UCAL_SKIPPED_WALL_TIME = 4;
pub const UCAL_WALLTIME_LAST = 0;
pub const UCAL_WALLTIME_FIRST = 1;
pub const UCAL_WALLTIME_NEXT_VALID = 2;
pub const UCAL_MINIMUM = 0;
pub const UCAL_MAXIMUM = 1;
pub const UCAL_GREATEST_MINIMUM = 2;
pub const UCAL_LEAST_MAXIMUM = 3;
pub const UCAL_ACTUAL_MINIMUM = 4;
pub const UCAL_ACTUAL_MAXIMUM = 5;
pub const UCAL_WEEKDAY = 0;
pub const UCAL_WEEKEND = 1;
pub const UCAL_WEEKEND_ONSET = 2;
pub const UCAL_WEEKEND_CEASE = 3;
pub const UCAL_TZ_TRANSITION_NEXT = 0;
pub const UCAL_TZ_TRANSITION_NEXT_INCLUSIVE = 1;
pub const UCAL_TZ_TRANSITION_PREVIOUS = 2;
pub const UCAL_TZ_TRANSITION_PREVIOUS_INCLUSIVE = 3;
pub const UCAL_TZ_LOCAL_FORMER = 4;
pub const UCAL_TZ_LOCAL_LATTER = 12;
pub const UCAL_TZ_LOCAL_STANDARD_FORMER = 5;
pub const UCAL_TZ_LOCAL_STANDARD_LATTER = 13;
pub const UCAL_TZ_LOCAL_DAYLIGHT_FORMER = 7;
pub const UCAL_TZ_LOCAL_DAYLIGHT_LATTER = 15;
pub const UCOL_EQUAL = 0;
pub const UCOL_GREATER = 1;
pub const UCOL_LESS = -1;
pub const UCOL_DEFAULT = -1;
pub const UCOL_PRIMARY = 0;
pub const UCOL_SECONDARY = 1;
pub const UCOL_TERTIARY = 2;
pub const UCOL_DEFAULT_STRENGTH = 2;
pub const UCOL_CE_STRENGTH_LIMIT = 3;
pub const UCOL_QUATERNARY = 3;
pub const UCOL_IDENTICAL = 15;
pub const UCOL_STRENGTH_LIMIT = 16;
pub const UCOL_OFF = 16;
pub const UCOL_ON = 17;
pub const UCOL_SHIFTED = 20;
pub const UCOL_NON_IGNORABLE = 21;
pub const UCOL_LOWER_FIRST = 24;
pub const UCOL_UPPER_FIRST = 25;
pub const UCOL_REORDER_CODE_DEFAULT = -1;
pub const UCOL_REORDER_CODE_NONE = 103;
pub const UCOL_REORDER_CODE_OTHERS = 103;
pub const UCOL_REORDER_CODE_SPACE = 4096;
pub const UCOL_REORDER_CODE_FIRST = 4096;
pub const UCOL_REORDER_CODE_PUNCTUATION = 4097;
pub const UCOL_REORDER_CODE_SYMBOL = 4098;
pub const UCOL_REORDER_CODE_CURRENCY = 4099;
pub const UCOL_REORDER_CODE_DIGIT = 4100;
pub const UCOL_FRENCH_COLLATION = 0;
pub const UCOL_ALTERNATE_HANDLING = 1;
pub const UCOL_CASE_FIRST = 2;
pub const UCOL_CASE_LEVEL = 3;
pub const UCOL_NORMALIZATION_MODE = 4;
pub const UCOL_DECOMPOSITION_MODE = 4;
pub const UCOL_STRENGTH = 5;
pub const UCOL_NUMERIC_COLLATION = 7;
pub const UCOL_ATTRIBUTE_COUNT = 8;
pub const UCOL_TAILORING_ONLY = 0;
pub const UCOL_FULL_RULES = 1;
pub const UCOL_BOUND_LOWER = 0;
pub const UCOL_BOUND_UPPER = 1;
pub const UCOL_BOUND_UPPER_LONG = 2;
pub const UFMT_DATE = 0;
pub const UFMT_DOUBLE = 1;
pub const UFMT_LONG = 2;
pub const UFMT_STRING = 3;
pub const UFMT_ARRAY = 4;
pub const UFMT_INT64 = 5;
pub const UFMT_OBJECT = 6;
pub const UFIELD_CATEGORY_UNDEFINED = 0;
pub const UFIELD_CATEGORY_DATE = 1;
pub const UFIELD_CATEGORY_NUMBER = 2;
pub const UFIELD_CATEGORY_LIST = 3;
pub const UFIELD_CATEGORY_RELATIVE_DATETIME = 4;
pub const UFIELD_CATEGORY_DATE_INTERVAL = 5;
pub const UFIELD_CATEGORY_LIST_SPAN = 4099;
pub const UFIELD_CATEGORY_DATE_INTERVAL_SPAN = 4101;
pub const UFIELD_CATEGORY_NUMBER_RANGE_SPAN = 4098;
pub const UGENDER_MALE = 0;
pub const UGENDER_FEMALE = 1;
pub const UGENDER_OTHER = 2;
pub const ULISTFMT_LITERAL_FIELD = 0;
pub const ULISTFMT_ELEMENT_FIELD = 1;
pub const ULISTFMT_TYPE_AND = 0;
pub const ULISTFMT_TYPE_OR = 1;
pub const ULISTFMT_TYPE_UNITS = 2;
pub const ULISTFMT_WIDTH_WIDE = 0;
pub const ULISTFMT_WIDTH_SHORT = 1;
pub const ULISTFMT_WIDTH_NARROW = 2;
pub const ULOCDATA_ES_STANDARD = 0;
pub const ULOCDATA_ES_AUXILIARY = 1;
pub const ULOCDATA_ES_INDEX = 2;
pub const ULOCDATA_ES_PUNCTUATION = 3;
pub const ULOCDATA_QUOTATION_START = 0;
pub const ULOCDATA_QUOTATION_END = 1;
pub const ULOCDATA_ALT_QUOTATION_START = 2;
pub const ULOCDATA_ALT_QUOTATION_END = 3;
pub const UMS_SI = 0;
pub const UMS_US = 1;
pub const UMS_UK = 2;
pub const UNUM_PATTERN_DECIMAL = 0;
pub const UNUM_DECIMAL = 1;
pub const UNUM_CURRENCY = 2;
pub const UNUM_PERCENT = 3;
pub const UNUM_SCIENTIFIC = 4;
pub const UNUM_SPELLOUT = 5;
pub const UNUM_ORDINAL = 6;
pub const UNUM_DURATION = 7;
pub const UNUM_NUMBERING_SYSTEM = 8;
pub const UNUM_PATTERN_RULEBASED = 9;
pub const UNUM_CURRENCY_ISO = 10;
pub const UNUM_CURRENCY_PLURAL = 11;
pub const UNUM_CURRENCY_ACCOUNTING = 12;
pub const UNUM_CASH_CURRENCY = 13;
pub const UNUM_DECIMAL_COMPACT_SHORT = 14;
pub const UNUM_DECIMAL_COMPACT_LONG = 15;
pub const UNUM_CURRENCY_STANDARD = 16;
pub const UNUM_DEFAULT = 1;
pub const UNUM_IGNORE = 0;
pub const UNUM_ROUND_CEILING = 0;
pub const UNUM_ROUND_FLOOR = 1;
pub const UNUM_ROUND_DOWN = 2;
pub const UNUM_ROUND_UP = 3;
pub const UNUM_ROUND_HALFEVEN = 4;
pub const UNUM_ROUND_HALFDOWN = 5;
pub const UNUM_ROUND_HALFUP = 6;
pub const UNUM_ROUND_UNNECESSARY = 7;
pub const UNUM_ROUND_HALF_ODD = 8;
pub const UNUM_ROUND_HALF_CEILING = 9;
pub const UNUM_ROUND_HALF_FLOOR = 10;
pub const UNUM_PAD_BEFORE_PREFIX = 0;
pub const UNUM_PAD_AFTER_PREFIX = 1;
pub const UNUM_PAD_BEFORE_SUFFIX = 2;
pub const UNUM_PAD_AFTER_SUFFIX = 3;
pub const UNUM_SHORT = 0;
pub const UNUM_LONG = 1;
pub const UNUM_CURRENCY_MATCH = 0;
pub const UNUM_CURRENCY_SURROUNDING_MATCH = 1;
pub const UNUM_CURRENCY_INSERT = 2;
pub const UNUM_CURRENCY_SPACING_COUNT = 3;
pub const UNUM_INTEGER_FIELD = 0;
pub const UNUM_FRACTION_FIELD = 1;
pub const UNUM_DECIMAL_SEPARATOR_FIELD = 2;
pub const UNUM_EXPONENT_SYMBOL_FIELD = 3;
pub const UNUM_EXPONENT_SIGN_FIELD = 4;
pub const UNUM_EXPONENT_FIELD = 5;
pub const UNUM_GROUPING_SEPARATOR_FIELD = 6;
pub const UNUM_CURRENCY_FIELD = 7;
pub const UNUM_PERCENT_FIELD = 8;
pub const UNUM_PERMILL_FIELD = 9;
pub const UNUM_SIGN_FIELD = 10;
pub const UNUM_MEASURE_UNIT_FIELD = 11;
pub const UNUM_COMPACT_FIELD = 12;
pub const UNUM_MINIMUM_GROUPING_DIGITS_AUTO = -2;
pub const UNUM_MINIMUM_GROUPING_DIGITS_MIN2 = -3;
pub const UNUM_FORMAT_ATTRIBUTE_VALUE_HIDDEN = 0;
pub const UNUM_PARSE_INT_ONLY = 0;
pub const UNUM_GROUPING_USED = 1;
pub const UNUM_DECIMAL_ALWAYS_SHOWN = 2;
pub const UNUM_MAX_INTEGER_DIGITS = 3;
pub const UNUM_MIN_INTEGER_DIGITS = 4;
pub const UNUM_INTEGER_DIGITS = 5;
pub const UNUM_MAX_FRACTION_DIGITS = 6;
pub const UNUM_MIN_FRACTION_DIGITS = 7;
pub const UNUM_FRACTION_DIGITS = 8;
pub const UNUM_MULTIPLIER = 9;
pub const UNUM_GROUPING_SIZE = 10;
pub const UNUM_ROUNDING_MODE = 11;
pub const UNUM_ROUNDING_INCREMENT = 12;
pub const UNUM_FORMAT_WIDTH = 13;
pub const UNUM_PADDING_POSITION = 14;
pub const UNUM_SECONDARY_GROUPING_SIZE = 15;
pub const UNUM_SIGNIFICANT_DIGITS_USED = 16;
pub const UNUM_MIN_SIGNIFICANT_DIGITS = 17;
pub const UNUM_MAX_SIGNIFICANT_DIGITS = 18;
pub const UNUM_LENIENT_PARSE = 19;
pub const UNUM_PARSE_ALL_INPUT = 20;
pub const UNUM_SCALE = 21;
pub const UNUM_MINIMUM_GROUPING_DIGITS = 22;
pub const UNUM_CURRENCY_USAGE = 23;
pub const UNUM_FORMAT_FAIL_IF_MORE_THAN_MAX_DIGITS = 4096;
pub const UNUM_PARSE_NO_EXPONENT = 4097;
pub const UNUM_PARSE_DECIMAL_MARK_REQUIRED = 4098;
pub const UNUM_PARSE_CASE_SENSITIVE = 4099;
pub const UNUM_SIGN_ALWAYS_SHOWN = 4100;
pub const UNUM_POSITIVE_PREFIX = 0;
pub const UNUM_POSITIVE_SUFFIX = 1;
pub const UNUM_NEGATIVE_PREFIX = 2;
pub const UNUM_NEGATIVE_SUFFIX = 3;
pub const UNUM_PADDING_CHARACTER = 4;
pub const UNUM_CURRENCY_CODE = 5;
pub const UNUM_DEFAULT_RULESET = 6;
pub const UNUM_PUBLIC_RULESETS = 7;
pub const UNUM_DECIMAL_SEPARATOR_SYMBOL = 0;
pub const UNUM_GROUPING_SEPARATOR_SYMBOL = 1;
pub const UNUM_PATTERN_SEPARATOR_SYMBOL = 2;
pub const UNUM_PERCENT_SYMBOL = 3;
pub const UNUM_ZERO_DIGIT_SYMBOL = 4;
pub const UNUM_DIGIT_SYMBOL = 5;
pub const UNUM_MINUS_SIGN_SYMBOL = 6;
pub const UNUM_PLUS_SIGN_SYMBOL = 7;
pub const UNUM_CURRENCY_SYMBOL = 8;
pub const UNUM_INTL_CURRENCY_SYMBOL = 9;
pub const UNUM_MONETARY_SEPARATOR_SYMBOL = 10;
pub const UNUM_EXPONENTIAL_SYMBOL = 11;
pub const UNUM_PERMILL_SYMBOL = 12;
pub const UNUM_PAD_ESCAPE_SYMBOL = 13;
pub const UNUM_INFINITY_SYMBOL = 14;
pub const UNUM_NAN_SYMBOL = 15;
pub const UNUM_SIGNIFICANT_DIGIT_SYMBOL = 16;
pub const UNUM_MONETARY_GROUPING_SEPARATOR_SYMBOL = 17;
pub const UNUM_ONE_DIGIT_SYMBOL = 18;
pub const UNUM_TWO_DIGIT_SYMBOL = 19;
pub const UNUM_THREE_DIGIT_SYMBOL = 20;
pub const UNUM_FOUR_DIGIT_SYMBOL = 21;
pub const UNUM_FIVE_DIGIT_SYMBOL = 22;
pub const UNUM_SIX_DIGIT_SYMBOL = 23;
pub const UNUM_SEVEN_DIGIT_SYMBOL = 24;
pub const UNUM_EIGHT_DIGIT_SYMBOL = 25;
pub const UNUM_NINE_DIGIT_SYMBOL = 26;
pub const UNUM_EXPONENT_MULTIPLICATION_SYMBOL = 27;
pub const UDAT_FULL = 0;
pub const UDAT_LONG = 1;
pub const UDAT_MEDIUM = 2;
pub const UDAT_SHORT = 3;
pub const UDAT_DEFAULT = 2;
pub const UDAT_RELATIVE = 128;
pub const UDAT_FULL_RELATIVE = 128;
pub const UDAT_LONG_RELATIVE = 129;
pub const UDAT_MEDIUM_RELATIVE = 130;
pub const UDAT_SHORT_RELATIVE = 131;
pub const UDAT_NONE = -1;
pub const UDAT_PATTERN = -2;
pub const UDAT_ERA_FIELD = 0;
pub const UDAT_YEAR_FIELD = 1;
pub const UDAT_MONTH_FIELD = 2;
pub const UDAT_DATE_FIELD = 3;
pub const UDAT_HOUR_OF_DAY1_FIELD = 4;
pub const UDAT_HOUR_OF_DAY0_FIELD = 5;
pub const UDAT_MINUTE_FIELD = 6;
pub const UDAT_SECOND_FIELD = 7;
pub const UDAT_FRACTIONAL_SECOND_FIELD = 8;
pub const UDAT_DAY_OF_WEEK_FIELD = 9;
pub const UDAT_DAY_OF_YEAR_FIELD = 10;
pub const UDAT_DAY_OF_WEEK_IN_MONTH_FIELD = 11;
pub const UDAT_WEEK_OF_YEAR_FIELD = 12;
pub const UDAT_WEEK_OF_MONTH_FIELD = 13;
pub const UDAT_AM_PM_FIELD = 14;
pub const UDAT_HOUR1_FIELD = 15;
pub const UDAT_HOUR0_FIELD = 16;
pub const UDAT_TIMEZONE_FIELD = 17;
pub const UDAT_YEAR_WOY_FIELD = 18;
pub const UDAT_DOW_LOCAL_FIELD = 19;
pub const UDAT_EXTENDED_YEAR_FIELD = 20;
pub const UDAT_JULIAN_DAY_FIELD = 21;
pub const UDAT_MILLISECONDS_IN_DAY_FIELD = 22;
pub const UDAT_TIMEZONE_RFC_FIELD = 23;
pub const UDAT_TIMEZONE_GENERIC_FIELD = 24;
pub const UDAT_STANDALONE_DAY_FIELD = 25;
pub const UDAT_STANDALONE_MONTH_FIELD = 26;
pub const UDAT_QUARTER_FIELD = 27;
pub const UDAT_STANDALONE_QUARTER_FIELD = 28;
pub const UDAT_TIMEZONE_SPECIAL_FIELD = 29;
pub const UDAT_YEAR_NAME_FIELD = 30;
pub const UDAT_TIMEZONE_LOCALIZED_GMT_OFFSET_FIELD = 31;
pub const UDAT_TIMEZONE_ISO_FIELD = 32;
pub const UDAT_TIMEZONE_ISO_LOCAL_FIELD = 33;
pub const UDAT_AM_PM_MIDNIGHT_NOON_FIELD = 35;
pub const UDAT_FLEXIBLE_DAY_PERIOD_FIELD = 36;
pub const UDAT_PARSE_ALLOW_WHITESPACE = 0;
pub const UDAT_PARSE_ALLOW_NUMERIC = 1;
pub const UDAT_PARSE_PARTIAL_LITERAL_MATCH = 2;
pub const UDAT_PARSE_MULTIPLE_PATTERNS_FOR_MATCH = 3;
pub const UDAT_BOOLEAN_ATTRIBUTE_COUNT = 4;
pub const UDAT_HOUR_CYCLE_11 = 0;
pub const UDAT_HOUR_CYCLE_12 = 1;
pub const UDAT_HOUR_CYCLE_23 = 2;
pub const UDAT_HOUR_CYCLE_24 = 3;
pub const UDAT_ERAS = 0;
pub const UDAT_MONTHS = 1;
pub const UDAT_SHORT_MONTHS = 2;
pub const UDAT_WEEKDAYS = 3;
pub const UDAT_SHORT_WEEKDAYS = 4;
pub const UDAT_AM_PMS = 5;
pub const UDAT_LOCALIZED_CHARS = 6;
pub const UDAT_ERA_NAMES = 7;
pub const UDAT_NARROW_MONTHS = 8;
pub const UDAT_NARROW_WEEKDAYS = 9;
pub const UDAT_STANDALONE_MONTHS = 10;
pub const UDAT_STANDALONE_SHORT_MONTHS = 11;
pub const UDAT_STANDALONE_NARROW_MONTHS = 12;
pub const UDAT_STANDALONE_WEEKDAYS = 13;
pub const UDAT_STANDALONE_SHORT_WEEKDAYS = 14;
pub const UDAT_STANDALONE_NARROW_WEEKDAYS = 15;
pub const UDAT_QUARTERS = 16;
pub const UDAT_SHORT_QUARTERS = 17;
pub const UDAT_STANDALONE_QUARTERS = 18;
pub const UDAT_STANDALONE_SHORT_QUARTERS = 19;
pub const UDAT_SHORTER_WEEKDAYS = 20;
pub const UDAT_STANDALONE_SHORTER_WEEKDAYS = 21;
pub const UDAT_CYCLIC_YEARS_WIDE = 22;
pub const UDAT_CYCLIC_YEARS_ABBREVIATED = 23;
pub const UDAT_CYCLIC_YEARS_NARROW = 24;
pub const UDAT_ZODIAC_NAMES_WIDE = 25;
pub const UDAT_ZODIAC_NAMES_ABBREVIATED = 26;
pub const UDAT_ZODIAC_NAMES_NARROW = 27;
pub const UDAT_NARROW_QUARTERS = 28;
pub const UDAT_STANDALONE_NARROW_QUARTERS = 29;
pub const UDATPG_ERA_FIELD = 0;
pub const UDATPG_YEAR_FIELD = 1;
pub const UDATPG_QUARTER_FIELD = 2;
pub const UDATPG_MONTH_FIELD = 3;
pub const UDATPG_WEEK_OF_YEAR_FIELD = 4;
pub const UDATPG_WEEK_OF_MONTH_FIELD = 5;
pub const UDATPG_WEEKDAY_FIELD = 6;
pub const UDATPG_DAY_OF_YEAR_FIELD = 7;
pub const UDATPG_DAY_OF_WEEK_IN_MONTH_FIELD = 8;
pub const UDATPG_DAY_FIELD = 9;
pub const UDATPG_DAYPERIOD_FIELD = 10;
pub const UDATPG_HOUR_FIELD = 11;
pub const UDATPG_MINUTE_FIELD = 12;
pub const UDATPG_SECOND_FIELD = 13;
pub const UDATPG_FRACTIONAL_SECOND_FIELD = 14;
pub const UDATPG_ZONE_FIELD = 15;
pub const UDATPG_FIELD_COUNT = 16;
pub const UDATPG_WIDE = 0;
pub const UDATPG_ABBREVIATED = 1;
pub const UDATPG_NARROW = 2;
pub const UDATPG_MATCH_NO_OPTIONS = 0;
pub const UDATPG_MATCH_HOUR_FIELD_LENGTH = 2048;
pub const UDATPG_MATCH_ALL_FIELDS_LENGTH = 65535;
pub const UDATPG_NO_CONFLICT = 0;
pub const UDATPG_BASE_CONFLICT = 1;
pub const UDATPG_CONFLICT = 2;
pub const UNUM_UNIT_WIDTH_NARROW = 0;
pub const UNUM_UNIT_WIDTH_SHORT = 1;
pub const UNUM_UNIT_WIDTH_FULL_NAME = 2;
pub const UNUM_UNIT_WIDTH_ISO_CODE = 3;
pub const UNUM_UNIT_WIDTH_FORMAL = 4;
pub const UNUM_UNIT_WIDTH_VARIANT = 5;
pub const UNUM_UNIT_WIDTH_HIDDEN = 6;
pub const UNUM_UNIT_WIDTH_COUNT = 7;
pub const UNUM_GROUPING_OFF = 0;
pub const UNUM_GROUPING_MIN2 = 1;
pub const UNUM_GROUPING_AUTO = 2;
pub const UNUM_GROUPING_ON_ALIGNED = 3;
pub const UNUM_GROUPING_THOUSANDS = 4;
pub const UNUM_SIGN_AUTO = 0;
pub const UNUM_SIGN_ALWAYS = 1;
pub const UNUM_SIGN_NEVER = 2;
pub const UNUM_SIGN_ACCOUNTING = 3;
pub const UNUM_SIGN_ACCOUNTING_ALWAYS = 4;
pub const UNUM_SIGN_EXCEPT_ZERO = 5;
pub const UNUM_SIGN_ACCOUNTING_EXCEPT_ZERO = 6;
pub const UNUM_SIGN_NEGATIVE = 7;
pub const UNUM_SIGN_ACCOUNTING_NEGATIVE = 8;
pub const UNUM_SIGN_COUNT = 9;
pub const UNUM_DECIMAL_SEPARATOR_AUTO = 0;
pub const UNUM_DECIMAL_SEPARATOR_ALWAYS = 1;
pub const UNUM_DECIMAL_SEPARATOR_COUNT = 2;
pub const UNUM_TRAILING_ZERO_AUTO = 0;
pub const UNUM_TRAILING_ZERO_HIDE_IF_WHOLE = 1;
pub const UNUM_RANGE_COLLAPSE_AUTO = 0;
pub const UNUM_RANGE_COLLAPSE_NONE = 1;
pub const UNUM_RANGE_COLLAPSE_UNIT = 2;
pub const UNUM_RANGE_COLLAPSE_ALL = 3;
pub const UNUM_IDENTITY_FALLBACK_SINGLE_VALUE = 0;
pub const UNUM_IDENTITY_FALLBACK_APPROXIMATELY_OR_SINGLE_VALUE = 1;
pub const UNUM_IDENTITY_FALLBACK_APPROXIMATELY = 2;
pub const UNUM_IDENTITY_FALLBACK_RANGE = 3;
pub const UNUM_IDENTITY_RESULT_EQUAL_BEFORE_ROUNDING = 0;
pub const UNUM_IDENTITY_RESULT_EQUAL_AFTER_ROUNDING = 1;
pub const UNUM_IDENTITY_RESULT_NOT_EQUAL = 2;
pub const UPLURAL_TYPE_CARDINAL = 0;
pub const UPLURAL_TYPE_ORDINAL = 1;
pub const UREGEX_CASE_INSENSITIVE = 2;
pub const UREGEX_COMMENTS = 4;
pub const UREGEX_DOTALL = 32;
pub const UREGEX_LITERAL = 16;
pub const UREGEX_MULTILINE = 8;
pub const UREGEX_UNIX_LINES = 1;
pub const UREGEX_UWORD = 256;
pub const UREGEX_ERROR_ON_UNKNOWN_ESCAPES = 512;
pub const URGN_UNKNOWN = 0;
pub const URGN_TERRITORY = 1;
pub const URGN_WORLD = 2;
pub const URGN_CONTINENT = 3;
pub const URGN_SUBCONTINENT = 4;
pub const URGN_GROUPING = 5;
pub const URGN_DEPRECATED = 6;
pub const UDAT_STYLE_LONG = 0;
pub const UDAT_STYLE_SHORT = 1;
pub const UDAT_STYLE_NARROW = 2;
pub const UDAT_REL_UNIT_YEAR = 0;
pub const UDAT_REL_UNIT_QUARTER = 1;
pub const UDAT_REL_UNIT_MONTH = 2;
pub const UDAT_REL_UNIT_WEEK = 3;
pub const UDAT_REL_UNIT_DAY = 4;
pub const UDAT_REL_UNIT_HOUR = 5;
pub const UDAT_REL_UNIT_MINUTE = 6;
pub const UDAT_REL_UNIT_SECOND = 7;
pub const UDAT_REL_UNIT_SUNDAY = 8;
pub const UDAT_REL_UNIT_MONDAY = 9;
pub const UDAT_REL_UNIT_TUESDAY = 10;
pub const UDAT_REL_UNIT_WEDNESDAY = 11;
pub const UDAT_REL_UNIT_THURSDAY = 12;
pub const UDAT_REL_UNIT_FRIDAY = 13;
pub const UDAT_REL_UNIT_SATURDAY = 14;
pub const UDAT_REL_LITERAL_FIELD = 0;
pub const UDAT_REL_NUMERIC_FIELD = 1;
pub const USEARCH_OVERLAP = 0;
pub const USEARCH_ELEMENT_COMPARISON = 2;
pub const USEARCH_DEFAULT = -1;
pub const USEARCH_OFF = 0;
pub const USEARCH_ON = 1;
pub const USEARCH_STANDARD_ELEMENT_COMPARISON = 2;
pub const USEARCH_PATTERN_BASE_WEIGHT_IS_WILDCARD = 3;
pub const USEARCH_ANY_BASE_WEIGHT_IS_WILDCARD = 4;
pub const USPOOF_SINGLE_SCRIPT_CONFUSABLE = 1;
pub const USPOOF_MIXED_SCRIPT_CONFUSABLE = 2;
pub const USPOOF_WHOLE_SCRIPT_CONFUSABLE = 4;
pub const USPOOF_CONFUSABLE = 7;
pub const USPOOF_RESTRICTION_LEVEL = 16;
pub const USPOOF_INVISIBLE = 32;
pub const USPOOF_CHAR_LIMIT = 64;
pub const USPOOF_MIXED_NUMBERS = 128;
pub const USPOOF_HIDDEN_OVERLAY = 256;
pub const USPOOF_ALL_CHECKS = 65535;
pub const USPOOF_AUX_INFO = 1073741824;
pub const USPOOF_ASCII = 268435456;
pub const USPOOF_SINGLE_SCRIPT_RESTRICTIVE = 536870912;
pub const USPOOF_HIGHLY_RESTRICTIVE = 805306368;
pub const USPOOF_MODERATELY_RESTRICTIVE = 1073741824;
pub const USPOOF_MINIMALLY_RESTRICTIVE = 1342177280;
pub const USPOOF_UNRESTRICTIVE = 1610612736;
pub const USPOOF_RESTRICTION_LEVEL_MASK = 2130706432;
pub const UDTS_JAVA_TIME = 0;
pub const UDTS_UNIX_TIME = 1;
pub const UDTS_ICU4C_TIME = 2;
pub const UDTS_WINDOWS_FILE_TIME = 3;
pub const UDTS_DOTNET_DATE_TIME = 4;
pub const UDTS_MAC_OLD_TIME = 5;
pub const UDTS_MAC_TIME = 6;
pub const UDTS_EXCEL_TIME = 7;
pub const UDTS_DB2_TIME = 8;
pub const UDTS_UNIX_MICROSECONDS_TIME = 9;
pub const UTSV_UNITS_VALUE = 0;
pub const UTSV_EPOCH_OFFSET_VALUE = 1;
pub const UTSV_FROM_MIN_VALUE = 2;
pub const UTSV_FROM_MAX_VALUE = 3;
pub const UTSV_TO_MIN_VALUE = 4;
pub const UTSV_TO_MAX_VALUE = 5;
pub const UTRANS_FORWARD = 0;
pub const UTRANS_REVERSE = 1;
pub const USTRINGTRIE_BUILD_FAST = 0;
pub const USTRINGTRIE_BUILD_SMALL = 1;
pub const UMSGPAT_APOS_DOUBLE_OPTIONAL = 0;
pub const UMSGPAT_APOS_DOUBLE_REQUIRED = 1;
pub const UMSGPAT_PART_TYPE_MSG_START = 0;
pub const UMSGPAT_PART_TYPE_MSG_LIMIT = 1;
pub const UMSGPAT_PART_TYPE_SKIP_SYNTAX = 2;
pub const UMSGPAT_PART_TYPE_INSERT_CHAR = 3;
pub const UMSGPAT_PART_TYPE_REPLACE_NUMBER = 4;
pub const UMSGPAT_PART_TYPE_ARG_START = 5;
pub const UMSGPAT_PART_TYPE_ARG_LIMIT = 6;
pub const UMSGPAT_PART_TYPE_ARG_NUMBER = 7;
pub const UMSGPAT_PART_TYPE_ARG_NAME = 8;
pub const UMSGPAT_PART_TYPE_ARG_TYPE = 9;
pub const UMSGPAT_PART_TYPE_ARG_STYLE = 10;
pub const UMSGPAT_PART_TYPE_ARG_SELECTOR = 11;
pub const UMSGPAT_PART_TYPE_ARG_INT = 12;
pub const UMSGPAT_PART_TYPE_ARG_DOUBLE = 13;
pub const UMSGPAT_ARG_TYPE_NONE = 0;
pub const UMSGPAT_ARG_TYPE_SIMPLE = 1;
pub const UMSGPAT_ARG_TYPE_CHOICE = 2;
pub const UMSGPAT_ARG_TYPE_PLURAL = 3;
pub const UMSGPAT_ARG_TYPE_SELECT = 4;
pub const UMSGPAT_ARG_TYPE_SELECTORDINAL = 5;
pub const U_ALPHAINDEX_NORMAL = 0;
pub const U_ALPHAINDEX_UNDERFLOW = 1;
pub const U_ALPHAINDEX_INFLOW = 2;
pub const U_ALPHAINDEX_OVERFLOW = 3;
pub const UTZNM_UNKNOWN = 0;
pub const UTZNM_LONG_GENERIC = 1;
pub const UTZNM_LONG_STANDARD = 2;
pub const UTZNM_LONG_DAYLIGHT = 4;
pub const UTZNM_SHORT_GENERIC = 8;
pub const UTZNM_SHORT_STANDARD = 16;
pub const UTZNM_SHORT_DAYLIGHT = 32;
pub const UTZNM_EXEMPLAR_LOCATION = 64;
pub const UTZFMT_STYLE_GENERIC_LOCATION = 0;
pub const UTZFMT_STYLE_GENERIC_LONG = 1;
pub const UTZFMT_STYLE_GENERIC_SHORT = 2;
pub const UTZFMT_STYLE_SPECIFIC_LONG = 3;
pub const UTZFMT_STYLE_SPECIFIC_SHORT = 4;
pub const UTZFMT_STYLE_LOCALIZED_GMT = 5;
pub const UTZFMT_STYLE_LOCALIZED_GMT_SHORT = 6;
pub const UTZFMT_STYLE_ISO_BASIC_SHORT = 7;
pub const UTZFMT_STYLE_ISO_BASIC_LOCAL_SHORT = 8;
pub const UTZFMT_STYLE_ISO_BASIC_FIXED = 9;
pub const UTZFMT_STYLE_ISO_BASIC_LOCAL_FIXED = 10;
pub const UTZFMT_STYLE_ISO_BASIC_FULL = 11;
pub const UTZFMT_STYLE_ISO_BASIC_LOCAL_FULL = 12;
pub const UTZFMT_STYLE_ISO_EXTENDED_FIXED = 13;
pub const UTZFMT_STYLE_ISO_EXTENDED_LOCAL_FIXED = 14;
pub const UTZFMT_STYLE_ISO_EXTENDED_FULL = 15;
pub const UTZFMT_STYLE_ISO_EXTENDED_LOCAL_FULL = 16;
pub const UTZFMT_STYLE_ZONE_ID = 17;
pub const UTZFMT_STYLE_ZONE_ID_SHORT = 18;
pub const UTZFMT_STYLE_EXEMPLAR_LOCATION = 19;
pub const UTZFMT_PAT_POSITIVE_HM = 0;
pub const UTZFMT_PAT_POSITIVE_HMS = 1;
pub const UTZFMT_PAT_NEGATIVE_HM = 2;
pub const UTZFMT_PAT_NEGATIVE_HMS = 3;
pub const UTZFMT_PAT_POSITIVE_H = 4;
pub const UTZFMT_PAT_NEGATIVE_H = 5;
pub const UTZFMT_PAT_COUNT = 6;
pub const UTZFMT_TIME_TYPE_UNKNOWN = 0;
pub const UTZFMT_TIME_TYPE_STANDARD = 1;
pub const UTZFMT_TIME_TYPE_DAYLIGHT = 2;
pub const UTZFMT_PARSE_OPTION_NONE = 0;
pub const UTZFMT_PARSE_OPTION_ALL_STYLES = 1;
pub const UTZFMT_PARSE_OPTION_TZ_DATABASE_ABBREVIATIONS = 2;
pub const UMEASFMT_WIDTH_WIDE = 0;
pub const UMEASFMT_WIDTH_SHORT = 1;
pub const UMEASFMT_WIDTH_NARROW = 2;
pub const UMEASFMT_WIDTH_NUMERIC = 3;
pub const UMEASFMT_WIDTH_COUNT = 4;
pub const UDAT_RELATIVE_SECONDS = 0;
pub const UDAT_RELATIVE_MINUTES = 1;
pub const UDAT_RELATIVE_HOURS = 2;
pub const UDAT_RELATIVE_DAYS = 3;
pub const UDAT_RELATIVE_WEEKS = 4;
pub const UDAT_RELATIVE_MONTHS = 5;
pub const UDAT_RELATIVE_YEARS = 6;
pub const UDAT_RELATIVE_UNIT_COUNT = 7;
pub const UDAT_ABSOLUTE_SUNDAY = 0;
pub const UDAT_ABSOLUTE_MONDAY = 1;
pub const UDAT_ABSOLUTE_TUESDAY = 2;
pub const UDAT_ABSOLUTE_WEDNESDAY = 3;
pub const UDAT_ABSOLUTE_THURSDAY = 4;
pub const UDAT_ABSOLUTE_FRIDAY = 5;
pub const UDAT_ABSOLUTE_SATURDAY = 6;
pub const UDAT_ABSOLUTE_DAY = 7;
pub const UDAT_ABSOLUTE_WEEK = 8;
pub const UDAT_ABSOLUTE_MONTH = 9;
pub const UDAT_ABSOLUTE_YEAR = 10;
pub const UDAT_ABSOLUTE_NOW = 11;
pub const UDAT_ABSOLUTE_UNIT_COUNT = 12;
pub const UDAT_DIRECTION_LAST_2 = 0;
pub const UDAT_DIRECTION_LAST = 1;
pub const UDAT_DIRECTION_THIS = 2;
pub const UDAT_DIRECTION_NEXT = 3;
pub const UDAT_DIRECTION_NEXT_2 = 4;
pub const UDAT_DIRECTION_PLAIN = 5;
pub const UDAT_DIRECTION_COUNT = 6;
pub const MIMECONTF_MAILNEWS = 1;
pub const MIMECONTF_BROWSER = 2;
pub const MIMECONTF_MINIMAL = 4;
pub const MIMECONTF_IMPORT = 8;
pub const MIMECONTF_SAVABLE_MAILNEWS = 256;
pub const MIMECONTF_SAVABLE_BROWSER = 512;
pub const MIMECONTF_EXPORT = 1024;
pub const MIMECONTF_PRIVCONVERTER = 65536;
pub const MIMECONTF_VALID = 131072;
pub const MIMECONTF_VALID_NLS = 262144;
pub const MIMECONTF_MIME_IE4 = 268435456;
pub const MIMECONTF_MIME_LATEST = 536870912;
pub const MIMECONTF_MIME_REGISTRY = 1073741824;
pub const sidDefault = 0;
pub const sidMerge = 1;
pub const sidAsciiSym = 2;
pub const sidAsciiLatin = 3;
pub const sidLatin = 4;
pub const sidGreek = 5;
pub const sidCyrillic = 6;
pub const sidArmenian = 7;
pub const sidHebrew = 8;
pub const sidArabic = 9;
pub const sidDevanagari = 10;
pub const sidBengali = 11;
pub const sidGurmukhi = 12;
pub const sidGujarati = 13;
pub const sidOriya = 14;
pub const sidTamil = 15;
pub const sidTelugu = 16;
pub const sidKannada = 17;
pub const sidMalayalam = 18;
pub const sidThai = 19;
pub const sidLao = 20;
pub const sidTibetan = 21;
pub const sidGeorgian = 22;
pub const sidHangul = 23;
pub const sidKana = 24;
pub const sidBopomofo = 25;
pub const sidHan = 26;
pub const sidEthiopic = 27;
pub const sidCanSyllabic = 28;
pub const sidCherokee = 29;
pub const sidYi = 30;
pub const sidBraille = 31;
pub const sidRunic = 32;
pub const sidOgham = 33;
pub const sidSinhala = 34;
pub const sidSyriac = 35;
pub const sidBurmese = 36;
pub const sidKhmer = 37;
pub const sidThaana = 38;
pub const sidMongolian = 39;
pub const sidUserDefined = 40;
pub const sidLim = 41;
pub const sidFEFirst = 23;
pub const sidFELast = 26;
pub const MLCONVCHARF_AUTODETECT = 1;
pub const MLCONVCHARF_ENTITIZE = 2;
pub const MLCONVCHARF_NCR_ENTITIZE = 2;
pub const MLCONVCHARF_NAME_ENTITIZE = 4;
pub const MLCONVCHARF_USEDEFCHAR = 8;
pub const MLCONVCHARF_NOBESTFITCHARS = 16;
pub const MLCONVCHARF_DETECTJPN = 32;
pub const MLDETECTF_MAILNEWS = 1;
pub const MLDETECTF_BROWSER = 2;
pub const MLDETECTF_VALID = 4;
pub const MLDETECTF_VALID_NLS = 8;
pub const MLDETECTF_PRESERVE_ORDER = 16;
pub const MLDETECTF_PREFERRED_ONLY = 32;
pub const MLDETECTF_FILTER_SPECIALCHAR = 64;
pub const MLDETECTF_EURO_UTF8 = 128;
pub const MLDETECTCP_NONE = 0;
pub const MLDETECTCP_7BIT = 1;
pub const MLDETECTCP_8BIT = 2;
pub const MLDETECTCP_DBCS = 4;
pub const MLDETECTCP_HTML = 8;
pub const MLDETECTCP_NUMBER = 16;
pub const SCRIPTCONTF_FIXED_FONT = 1;
pub const SCRIPTCONTF_PROPORTIONAL_FONT = 2;
pub const SCRIPTCONTF_SCRIPT_USER = 65536;
pub const SCRIPTCONTF_SCRIPT_HIDE = 131072;
pub const SCRIPTCONTF_SCRIPT_SYSTEM = 262144;
pub const MLSTR_READ = 1;
pub const MLSTR_WRITE = 2;
pub const EraUnit = 0;
pub const YearUnit = 1;
pub const MonthUnit = 2;
pub const WeekUnit = 3;
pub const DayUnit = 4;
pub const HourUnit = 5;
pub const MinuteUnit = 6;
pub const SecondUnit = 7;
pub const TickUnit = 8;

pub const aliases = struct {
    pub const FOLD_STRING_MAP_FLAGS = u32;
    pub const ENUM_DATE_FORMATS_FLAGS = u32;
    pub const TRANSLATE_CHARSET_INFO_FLAGS = u32;
    pub const TIME_FORMAT_FLAGS = u32;
    pub const ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS = u32;
    pub const MULTI_BYTE_TO_WIDE_CHAR_FLAGS = u32;
    pub const COMPARE_STRING_FLAGS = u32;
    pub const IS_VALID_LOCALE_FLAGS = u32;
    pub const ENUM_SYSTEM_CODE_PAGES_FLAGS = u32;
    pub const SCRIPT_IS_COMPLEX_FLAGS = u32;
    pub const IS_TEXT_UNICODE_RESULT = u32;
    pub const COMPARESTRING_RESULT = i32;
    pub const SYSNLS_FUNCTION = i32;
    pub const SYSGEOTYPE = i32;
    pub const SYSGEOCLASS = i32;
    pub const NORM_FORM = i32;
    pub const WORDLIST_TYPE = i32;
    pub const CORRECTIVE_ACTION = i32;
    pub const SCRIPT_JUSTIFY = i32;
    pub const UErrorCode = i32;
    pub const UTraceLevel = i32;
    pub const UTraceFunctionNumber = i32;
    pub const UStringTrieResult = i32;
    pub const UScriptCode = i32;
    pub const UScriptUsage = i32;
    pub const UCharIteratorOrigin = i32;
    pub const ULocDataLocaleType = i32;
    pub const ULocAvailableType = i32;
    pub const ULayoutType = i32;
    pub const UAcceptResult = i32;
    pub const UResType = i32;
    pub const UDisplayContextType = i32;
    pub const UDisplayContext = i32;
    pub const UDialectHandling = i32;
    pub const UCurrencyUsage = i32;
    pub const UCurrNameStyle = i32;
    pub const UCurrCurrencyType = i32;
    pub const UCPMapRangeOption = i32;
    pub const UCPTrieType = i32;
    pub const UCPTrieValueWidth = i32;
    pub const UConverterCallbackReason = i32;
    pub const UConverterType = i32;
    pub const UConverterPlatform = i32;
    pub const UConverterUnicodeSet = i32;
    pub const UProperty = i32;
    pub const UCharCategory = i32;
    pub const UCharDirection = i32;
    pub const UBidiPairedBracketType = i32;
    pub const UBlockCode = i32;
    pub const UEastAsianWidth = i32;
    pub const UCharNameChoice = i32;
    pub const UPropertyNameChoice = i32;
    pub const UDecompositionType = i32;
    pub const UJoiningType = i32;
    pub const UJoiningGroup = i32;
    pub const UGraphemeClusterBreak = i32;
    pub const UWordBreakValues = i32;
    pub const USentenceBreak = i32;
    pub const ULineBreak = i32;
    pub const UNumericType = i32;
    pub const UHangulSyllableType = i32;
    pub const UIndicPositionalCategory = i32;
    pub const UIndicSyllabicCategory = i32;
    pub const UVerticalOrientation = i32;
    pub const UBiDiDirection = i32;
    pub const UBiDiReorderingMode = i32;
    pub const UBiDiReorderingOption = i32;
    pub const UBiDiOrder = i32;
    pub const UBiDiMirroring = i32;
    pub const USetSpanCondition = i32;
    pub const UNormalization2Mode = i32;
    pub const UNormalizationCheckResult = i32;
    pub const UNormalizationMode = i32;
    pub const UStringPrepProfileType = i32;
    pub const UBreakIteratorType = i32;
    pub const UWordBreak = i32;
    pub const ULineBreakTag = i32;
    pub const USentenceBreakTag = i32;
    pub const UCalendarType = i32;
    pub const UCalendarDateFields = i32;
    pub const UCalendarDaysOfWeek = i32;
    pub const UCalendarMonths = i32;
    pub const UCalendarAMPMs = i32;
    pub const USystemTimeZoneType = i32;
    pub const UCalendarDisplayNameType = i32;
    pub const UCalendarAttribute = i32;
    pub const UCalendarWallTimeOption = i32;
    pub const UCalendarLimitType = i32;
    pub const UCalendarWeekdayType = i32;
    pub const UTimeZoneTransitionType = i32;
    pub const UTimeZoneLocalOption = i32;
    pub const UCollationResult = i32;
    pub const UColAttributeValue = i32;
    pub const UColReorderCode = i32;
    pub const UColAttribute = i32;
    pub const UColRuleOption = i32;
    pub const UColBoundMode = i32;
    pub const UFormattableType = i32;
    pub const UFieldCategory = i32;
    pub const UGender = i32;
    pub const UListFormatterField = i32;
    pub const UListFormatterType = i32;
    pub const UListFormatterWidth = i32;
    pub const ULocaleDataExemplarSetType = i32;
    pub const ULocaleDataDelimiterType = i32;
    pub const UMeasurementSystem = i32;
    pub const UNumberFormatStyle = i32;
    pub const UNumberFormatRoundingMode = i32;
    pub const UNumberFormatPadPosition = i32;
    pub const UNumberCompactStyle = i32;
    pub const UCurrencySpacing = i32;
    pub const UNumberFormatFields = i32;
    pub const UNumberFormatMinimumGroupingDigits = i32;
    pub const UNumberFormatAttributeValue = i32;
    pub const UNumberFormatAttribute = i32;
    pub const UNumberFormatTextAttribute = i32;
    pub const UNumberFormatSymbol = i32;
    pub const UDateFormatStyle = i32;
    pub const UDateFormatField = i32;
    pub const UDateFormatBooleanAttribute = i32;
    pub const UDateFormatHourCycle = i32;
    pub const UDateFormatSymbolType = i32;
    pub const UDateTimePatternField = i32;
    pub const UDateTimePGDisplayWidth = i32;
    pub const UDateTimePatternMatchOptions = i32;
    pub const UDateTimePatternConflict = i32;
    pub const UNumberUnitWidth = i32;
    pub const UNumberGroupingStrategy = i32;
    pub const UNumberSignDisplay = i32;
    pub const UNumberDecimalSeparatorDisplay = i32;
    pub const UNumberTrailingZeroDisplay = i32;
    pub const UNumberRangeCollapse = i32;
    pub const UNumberRangeIdentityFallback = i32;
    pub const UNumberRangeIdentityResult = i32;
    pub const UPluralType = i32;
    pub const URegexpFlag = i32;
    pub const URegionType = i32;
    pub const UDateRelativeDateTimeFormatterStyle = i32;
    pub const URelativeDateTimeUnit = i32;
    pub const URelativeDateTimeFormatterField = i32;
    pub const USearchAttribute = i32;
    pub const USearchAttributeValue = i32;
    pub const USpoofChecks = i32;
    pub const URestrictionLevel = i32;
    pub const UDateTimeScale = i32;
    pub const UTimeScaleValue = i32;
    pub const UTransDirection = i32;
    pub const UStringTrieBuildOption = i32;
    pub const UMessagePatternApostropheMode = i32;
    pub const UMessagePatternPartType = i32;
    pub const UMessagePatternArgType = i32;
    pub const UAlphabeticIndexLabelType = i32;
    pub const UTimeZoneNameType = i32;
    pub const UTimeZoneFormatStyle = i32;
    pub const UTimeZoneFormatGMTOffsetPatternType = i32;
    pub const UTimeZoneFormatTimeType = i32;
    pub const UTimeZoneFormatParseOption = i32;
    pub const UMeasureFormatWidth = i32;
    pub const UDateRelativeUnit = i32;
    pub const UDateAbsoluteUnit = i32;
    pub const UDateDirection = i32;
    pub const MIMECONTF = i32;
    pub const SCRIPTCONTF = i32;
    pub const MLCONVCHAR = i32;
    pub const MLCP = i32;
    pub const MLDETECTCP = i32;
    pub const SCRIPTFONTCONTF = i32;
    pub const MLSTR_FLAGS = i32;
    pub const CALDATETIME_DATEUNIT = i32;
    pub const HSAVEDUILANGUAGES = ?*anyopaque;
    pub const UBiDi = isize;
    pub const UBiDiTransform = isize;
    pub const UBreakIterator = isize;
    pub const UCaseMap = isize;
    pub const UCharsetDetector = isize;
    pub const UCharsetMatch = isize;
    pub const UCollationElements = isize;
    pub const UCollator = isize;
    pub const UConstrainedFieldPosition = isize;
    pub const UConverter = isize;
    pub const UConverterSelector = isize;
    pub const UCPMap = isize;
    pub const UDateFormatSymbols = isize;
    pub const UDateIntervalFormat = isize;
    pub const UEnumeration = isize;
    pub const UFieldPositionIterator = isize;
    pub const UFormattedDateInterval = isize;
    pub const UFormattedList = isize;
    pub const UFormattedNumber = isize;
    pub const UFormattedNumberRange = isize;
    pub const UFormattedRelativeDateTime = isize;
    pub const UFormattedValue = isize;
    pub const UGenderInfo = isize;
    pub const UHashtable = isize;
    pub const UIDNA = isize;
    pub const UListFormatter = isize;
    pub const ULocaleData = isize;
    pub const ULocaleDisplayNames = isize;
    pub const UMutableCPTrie = isize;
    pub const UNormalizer2 = isize;
    pub const UNumberFormatter = isize;
    pub const UNumberRangeFormatter = isize;
    pub const UNumberingSystem = isize;
    pub const UPluralRules = isize;
    pub const URegion = isize;
    pub const URegularExpression = isize;
    pub const URelativeDateTimeFormatter = isize;
    pub const UResourceBundle = isize;
    pub const USearch = isize;
    pub const USet = isize;
    pub const USpoofChecker = isize;
    pub const USpoofCheckResult = isize;
    pub const UStringPrepProfile = isize;
    pub const UStringSearch = isize;
    pub const LOCALE_ENUMPROCA = ?*const anyopaque;
    pub const LOCALE_ENUMPROCW = ?*const anyopaque;
    pub const LANGUAGEGROUP_ENUMPROCA = ?*const anyopaque;
    pub const LANGGROUPLOCALE_ENUMPROCA = ?*const anyopaque;
    pub const UILANGUAGE_ENUMPROCA = ?*const anyopaque;
    pub const CODEPAGE_ENUMPROCA = ?*const anyopaque;
    pub const DATEFMT_ENUMPROCA = ?*const anyopaque;
    pub const DATEFMT_ENUMPROCEXA = ?*const anyopaque;
    pub const TIMEFMT_ENUMPROCA = ?*const anyopaque;
    pub const CALINFO_ENUMPROCA = ?*const anyopaque;
    pub const CALINFO_ENUMPROCEXA = ?*const anyopaque;
    pub const LANGUAGEGROUP_ENUMPROCW = ?*const anyopaque;
    pub const LANGGROUPLOCALE_ENUMPROCW = ?*const anyopaque;
    pub const UILANGUAGE_ENUMPROCW = ?*const anyopaque;
    pub const CODEPAGE_ENUMPROCW = ?*const anyopaque;
    pub const DATEFMT_ENUMPROCW = ?*const anyopaque;
    pub const DATEFMT_ENUMPROCEXW = ?*const anyopaque;
    pub const TIMEFMT_ENUMPROCW = ?*const anyopaque;
    pub const CALINFO_ENUMPROCW = ?*const anyopaque;
    pub const CALINFO_ENUMPROCEXW = ?*const anyopaque;
    pub const GEO_ENUMPROC = ?*const anyopaque;
    pub const GEO_ENUMNAMEPROC = ?*const anyopaque;
    pub const CALINFO_ENUMPROCEXEX = ?*const anyopaque;
    pub const DATEFMT_ENUMPROCEXEX = ?*const anyopaque;
    pub const TIMEFMT_ENUMPROCEX = ?*const anyopaque;
    pub const LOCALE_ENUMPROCEX = ?*const anyopaque;
    pub const PFN_MAPPINGCALLBACKPROC = ?*const anyopaque;
    pub const UTraceEntry = ?*const anyopaque;
    pub const UTraceExit = ?*const anyopaque;
    pub const UTraceData = ?*const anyopaque;
    pub const UCharIteratorGetIndex = ?*const anyopaque;
    pub const UCharIteratorMove = ?*const anyopaque;
    pub const UCharIteratorHasNext = ?*const anyopaque;
    pub const UCharIteratorHasPrevious = ?*const anyopaque;
    pub const UCharIteratorCurrent = ?*const anyopaque;
    pub const UCharIteratorNext = ?*const anyopaque;
    pub const UCharIteratorPrevious = ?*const anyopaque;
    pub const UCharIteratorReserved = ?*const anyopaque;
    pub const UCharIteratorGetState = ?*const anyopaque;
    pub const UCharIteratorSetState = ?*const anyopaque;
    pub const UCPMapValueFilter = ?*const anyopaque;
    pub const UConverterToUCallback = ?*const anyopaque;
    pub const UConverterFromUCallback = ?*const anyopaque;
    pub const UMemAllocFn = ?*const anyopaque;
    pub const UMemReallocFn = ?*const anyopaque;
    pub const UMemFreeFn = ?*const anyopaque;
    pub const UCharEnumTypeRange = ?*const anyopaque;
    pub const UEnumCharNamesFn = ?*const anyopaque;
    pub const UBiDiClassCallback = ?*const anyopaque;
    pub const UTextClone = ?*const anyopaque;
    pub const UTextNativeLength = ?*const anyopaque;
    pub const UTextAccess = ?*const anyopaque;
    pub const UTextExtract = ?*const anyopaque;
    pub const UTextReplace = ?*const anyopaque;
    pub const UTextCopy = ?*const anyopaque;
    pub const UTextMapOffsetToNative = ?*const anyopaque;
    pub const UTextMapNativeIndexToUTF16 = ?*const anyopaque;
    pub const UTextClose = ?*const anyopaque;
    pub const UNESCAPE_CHAR_AT = ?*const anyopaque;
    pub const URegexMatchCallback = ?*const anyopaque;
    pub const URegexFindProgressCallback = ?*const anyopaque;
    pub const UStringCaseMapper = ?*const anyopaque;
};
