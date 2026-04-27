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

pub const CONTENT_ID_GLANCE = 0;
pub const SIDESHOW_EVENTID_APPLICATION_ENTER = 4294901760;
pub const SIDESHOW_EVENTID_APPLICATION_EXIT = 4294901761;
pub const CONTENT_ID_HOME = 1;
pub const VERSION_1_WINDOWS_7 = 0;
pub const SIDESHOW_SCREEN_TYPE_BITMAP = 0;
pub const SIDESHOW_SCREEN_TYPE_TEXT = 1;
pub const SIDESHOW_COLOR_TYPE_COLOR = 0;
pub const SIDESHOW_COLOR_TYPE_GREYSCALE = 1;
pub const SIDESHOW_COLOR_TYPE_BLACK_AND_WHITE = 2;
pub const SCF_EVENT_NAVIGATION = 1;
pub const SCF_EVENT_MENUACTION = 2;
pub const SCF_EVENT_CONTEXTMENU = 3;
pub const SCF_BUTTON_MENU = 1;
pub const SCF_BUTTON_SELECT = 2;
pub const SCF_BUTTON_UP = 3;
pub const SCF_BUTTON_DOWN = 4;
pub const SCF_BUTTON_LEFT = 5;
pub const SCF_BUTTON_RIGHT = 6;
pub const SCF_BUTTON_PLAY = 7;
pub const SCF_BUTTON_PAUSE = 8;
pub const SCF_BUTTON_FASTFORWARD = 9;
pub const SCF_BUTTON_REWIND = 10;
pub const SCF_BUTTON_STOP = 11;
pub const SCF_BUTTON_BACK = 65280;

pub const aliases = struct {
    pub const SIDESHOW_SCREEN_TYPE = i32;
    pub const SIDESHOW_COLOR_TYPE = i32;
    pub const SCF_EVENT_IDS = i32;
    pub const SCF_BUTTON_IDS = i32;
};
