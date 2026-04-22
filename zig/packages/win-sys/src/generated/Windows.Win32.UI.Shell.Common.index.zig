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

pub const PERCEIVEDFLAG_UNDEFINED = 0;
pub const PERCEIVEDFLAG_SOFTCODED = 1;
pub const PERCEIVEDFLAG_HARDCODED = 2;
pub const PERCEIVEDFLAG_NATIVESUPPORT = 4;
pub const PERCEIVEDFLAG_GDIPLUS = 16;
pub const PERCEIVEDFLAG_WMSDK = 32;
pub const PERCEIVEDFLAG_ZIPFOLDER = 64;
pub const STRRET_WSTR = 0;
pub const STRRET_OFFSET = 1;
pub const STRRET_CSTR = 2;
pub const PERCEIVED_TYPE_FIRST = -3;
pub const PERCEIVED_TYPE_CUSTOM = -3;
pub const PERCEIVED_TYPE_UNSPECIFIED = -2;
pub const PERCEIVED_TYPE_FOLDER = -1;
pub const PERCEIVED_TYPE_UNKNOWN = 0;
pub const PERCEIVED_TYPE_TEXT = 1;
pub const PERCEIVED_TYPE_IMAGE = 2;
pub const PERCEIVED_TYPE_AUDIO = 3;
pub const PERCEIVED_TYPE_VIDEO = 4;
pub const PERCEIVED_TYPE_COMPRESSED = 5;
pub const PERCEIVED_TYPE_DOCUMENT = 6;
pub const PERCEIVED_TYPE_SYSTEM = 7;
pub const PERCEIVED_TYPE_APPLICATION = 8;
pub const PERCEIVED_TYPE_GAMEMEDIA = 9;
pub const PERCEIVED_TYPE_CONTACTS = 10;
pub const PERCEIVED_TYPE_LAST = 10;
pub const SHCOLSTATE_DEFAULT = 0;
pub const SHCOLSTATE_TYPE_STR = 1;
pub const SHCOLSTATE_TYPE_INT = 2;
pub const SHCOLSTATE_TYPE_DATE = 3;
pub const SHCOLSTATE_TYPEMASK = 15;
pub const SHCOLSTATE_ONBYDEFAULT = 16;
pub const SHCOLSTATE_SLOW = 32;
pub const SHCOLSTATE_EXTENDED = 64;
pub const SHCOLSTATE_SECONDARYUI = 128;
pub const SHCOLSTATE_HIDDEN = 256;
pub const SHCOLSTATE_PREFER_VARCMP = 512;
pub const SHCOLSTATE_PREFER_FMTCMP = 1024;
pub const SHCOLSTATE_NOSORTBYFOLDERNESS = 2048;
pub const SHCOLSTATE_VIEWONLY = 65536;
pub const SHCOLSTATE_BATCHREAD = 131072;
pub const SHCOLSTATE_NO_GROUPBY = 262144;
pub const SHCOLSTATE_FIXED_WIDTH = 4096;
pub const SHCOLSTATE_NODPISCALE = 8192;
pub const SHCOLSTATE_FIXED_RATIO = 16384;
pub const SHCOLSTATE_DISPLAYMASK = 61440;
pub const DEVICE_SCALE_FACTOR_INVALID = 0;
pub const SCALE_100_PERCENT = 100;
pub const SCALE_120_PERCENT = 120;
pub const SCALE_125_PERCENT = 125;
pub const SCALE_140_PERCENT = 140;
pub const SCALE_150_PERCENT = 150;
pub const SCALE_160_PERCENT = 160;
pub const SCALE_175_PERCENT = 175;
pub const SCALE_180_PERCENT = 180;
pub const SCALE_200_PERCENT = 200;
pub const SCALE_225_PERCENT = 225;
pub const SCALE_250_PERCENT = 250;
pub const SCALE_300_PERCENT = 300;
pub const SCALE_350_PERCENT = 350;
pub const SCALE_400_PERCENT = 400;
pub const SCALE_450_PERCENT = 450;
pub const SCALE_500_PERCENT = 500;

pub const aliases = struct {
    pub const STRRET_TYPE = i32;
    pub const PERCEIVED = i32;
    pub const SHCOLSTATE = i32;
    pub const DEVICE_SCALE_FACTOR = i32;
};
