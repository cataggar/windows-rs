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

pub const UI_ALL_COMMANDS = 0;
pub const UI_COLLECTION_INVALIDINDEX = 4294967295;
pub const UI_CONTEXTAVAILABILITY_NOTAVAILABLE = 0;
pub const UI_CONTEXTAVAILABILITY_AVAILABLE = 1;
pub const UI_CONTEXTAVAILABILITY_ACTIVE = 2;
pub const UI_FONTPROPERTIES_NOTAVAILABLE = 0;
pub const UI_FONTPROPERTIES_NOTSET = 1;
pub const UI_FONTPROPERTIES_SET = 2;
pub const UI_FONTVERTICALPOSITION_NOTAVAILABLE = 0;
pub const UI_FONTVERTICALPOSITION_NOTSET = 1;
pub const UI_FONTVERTICALPOSITION_SUPERSCRIPT = 2;
pub const UI_FONTVERTICALPOSITION_SUBSCRIPT = 3;
pub const UI_FONTUNDERLINE_NOTAVAILABLE = 0;
pub const UI_FONTUNDERLINE_NOTSET = 1;
pub const UI_FONTUNDERLINE_SET = 2;
pub const UI_FONTDELTASIZE_GROW = 0;
pub const UI_FONTDELTASIZE_SHRINK = 1;
pub const UI_CONTROLDOCK_TOP = 1;
pub const UI_CONTROLDOCK_BOTTOM = 3;
pub const UI_SWATCHCOLORTYPE_NOCOLOR = 0;
pub const UI_SWATCHCOLORTYPE_AUTOMATIC = 1;
pub const UI_SWATCHCOLORTYPE_RGB = 2;
pub const UI_SWATCHCOLORMODE_NORMAL = 0;
pub const UI_SWATCHCOLORMODE_MONOCHROME = 1;
pub const UI_EVENTTYPE_ApplicationMenuOpened = 0;
pub const UI_EVENTTYPE_RibbonMinimized = 1;
pub const UI_EVENTTYPE_RibbonExpanded = 2;
pub const UI_EVENTTYPE_ApplicationModeSwitched = 3;
pub const UI_EVENTTYPE_TabActivated = 4;
pub const UI_EVENTTYPE_MenuOpened = 5;
pub const UI_EVENTTYPE_CommandExecuted = 6;
pub const UI_EVENTTYPE_TooltipShown = 7;
pub const UI_EVENTLOCATION_Ribbon = 0;
pub const UI_EVENTLOCATION_QAT = 1;
pub const UI_EVENTLOCATION_ApplicationMenu = 2;
pub const UI_EVENTLOCATION_ContextPopup = 3;
pub const UI_INVALIDATIONS_STATE = 1;
pub const UI_INVALIDATIONS_VALUE = 2;
pub const UI_INVALIDATIONS_PROPERTY = 4;
pub const UI_INVALIDATIONS_ALLPROPERTIES = 8;
pub const UI_COLLECTIONCHANGE_INSERT = 0;
pub const UI_COLLECTIONCHANGE_REMOVE = 1;
pub const UI_COLLECTIONCHANGE_REPLACE = 2;
pub const UI_COLLECTIONCHANGE_RESET = 3;
pub const UI_EXECUTIONVERB_EXECUTE = 0;
pub const UI_EXECUTIONVERB_PREVIEW = 1;
pub const UI_EXECUTIONVERB_CANCELPREVIEW = 2;
pub const UI_COMMANDTYPE_UNKNOWN = 0;
pub const UI_COMMANDTYPE_GROUP = 1;
pub const UI_COMMANDTYPE_ACTION = 2;
pub const UI_COMMANDTYPE_ANCHOR = 3;
pub const UI_COMMANDTYPE_CONTEXT = 4;
pub const UI_COMMANDTYPE_COLLECTION = 5;
pub const UI_COMMANDTYPE_COMMANDCOLLECTION = 6;
pub const UI_COMMANDTYPE_DECIMAL = 7;
pub const UI_COMMANDTYPE_BOOLEAN = 8;
pub const UI_COMMANDTYPE_FONT = 9;
pub const UI_COMMANDTYPE_RECENTITEMS = 10;
pub const UI_COMMANDTYPE_COLORANCHOR = 11;
pub const UI_COMMANDTYPE_COLORCOLLECTION = 12;
pub const UI_VIEWTYPE_RIBBON = 1;
pub const UI_VIEWVERB_CREATE = 0;
pub const UI_VIEWVERB_DESTROY = 1;
pub const UI_VIEWVERB_SIZE = 2;
pub const UI_VIEWVERB_ERROR = 3;
pub const UI_OWNERSHIP_TRANSFER = 0;
pub const UI_OWNERSHIP_COPY = 1;

pub const aliases = struct {
    pub const UI_CONTEXTAVAILABILITY = i32;
    pub const UI_FONTPROPERTIES = i32;
    pub const UI_FONTVERTICALPOSITION = i32;
    pub const UI_FONTUNDERLINE = i32;
    pub const UI_FONTDELTASIZE = i32;
    pub const UI_CONTROLDOCK = i32;
    pub const UI_SWATCHCOLORTYPE = i32;
    pub const UI_SWATCHCOLORMODE = i32;
    pub const UI_EVENTTYPE = i32;
    pub const UI_EVENTLOCATION = i32;
    pub const UI_INVALIDATIONS = i32;
    pub const UI_COLLECTIONCHANGE = i32;
    pub const UI_EXECUTIONVERB = i32;
    pub const UI_COMMANDTYPE = i32;
    pub const UI_VIEWTYPE = i32;
    pub const UI_VIEWVERB = i32;
    pub const UI_OWNERSHIP = i32;
};
