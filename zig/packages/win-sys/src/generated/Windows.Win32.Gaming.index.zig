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
    .{ "HasExpandedResources", MethodRecord{ .library = "api-ms-win-gaming-expandedresources-l1-1-0", .import = "HasExpandedResources", .signature = "\x00\x01\x11\x79\x0f\x11\x59" } },
    .{ "GetExpandedResourceExclusiveCpuCount", MethodRecord{ .library = "api-ms-win-gaming-expandedresources-l1-1-0", .import = "GetExpandedResourceExclusiveCpuCount", .signature = "\x00\x01\x11\x79\x0f\x09" } },
    .{ "ReleaseExclusiveCpuSets", MethodRecord{ .library = "api-ms-win-gaming-expandedresources-l1-1-0", .import = "ReleaseExclusiveCpuSets", .signature = "\x00\x00\x11\x79" } },
    .{ "GetGamingDeviceModelInformation", MethodRecord{ .library = "api-ms-win-gaming-deviceinformation-l1-1-0", .import = "GetGamingDeviceModelInformation", .signature = "\x00\x01\x11\x79\x0f\x11\xad\x51" } },
    .{ "ShowGameInviteUI", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-0", .import = "ShowGameInviteUI", .signature = "\x00\x06\x11\x79\x11\xad\x55\x11\xad\x55\x11\xad\x55\x11\xad\x55\x12\xad\x59\x0f\x01" } },
    .{ "ShowPlayerPickerUI", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-0", .import = "ShowPlayerPickerUI", .signature = "\x00\x09\x11\x79\x11\xad\x55\x0f\x11\xad\x55\x19\x0f\x11\xad\x55\x19\x19\x19\x12\xad\x5d\x0f\x01" } },
    .{ "ShowProfileCardUI", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-0", .import = "ShowProfileCardUI", .signature = "\x00\x03\x11\x79\x11\xad\x55\x12\xad\x59\x0f\x01" } },
    .{ "ShowChangeFriendRelationshipUI", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-0", .import = "ShowChangeFriendRelationshipUI", .signature = "\x00\x03\x11\x79\x11\xad\x55\x12\xad\x59\x0f\x01" } },
    .{ "ShowTitleAchievementsUI", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-0", .import = "ShowTitleAchievementsUI", .signature = "\x00\x03\x11\x79\x09\x12\xad\x59\x0f\x01" } },
    .{ "ProcessPendingGameUI", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-0", .import = "ProcessPendingGameUI", .signature = "\x00\x01\x11\x79\x11\x59" } },
    .{ "TryCancelPendingGameUI", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-0", .import = "TryCancelPendingGameUI", .signature = "\x00\x00\x11\x59" } },
    .{ "CheckGamingPrivilegeWithUI", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-1", .import = "CheckGamingPrivilegeWithUI", .signature = "\x00\x06\x11\x79\x09\x11\xad\x55\x11\xad\x55\x11\xad\x55\x12\xad\x59\x0f\x01" } },
    .{ "CheckGamingPrivilegeSilently", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-1", .import = "CheckGamingPrivilegeSilently", .signature = "\x00\x04\x11\x79\x09\x11\xad\x55\x11\xad\x55\x0f\x11\x59" } },
    .{ "ShowGameInviteUIForUser", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-2", .import = "ShowGameInviteUIForUser", .signature = "\x00\x07\x11\x79\x12\xad\x61\x11\xad\x55\x11\xad\x55\x11\xad\x55\x11\xad\x55\x12\xad\x59\x0f\x01" } },
    .{ "ShowPlayerPickerUIForUser", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-2", .import = "ShowPlayerPickerUIForUser", .signature = "\x00\x0a\x11\x79\x12\xad\x61\x11\xad\x55\x0f\x11\xad\x55\x19\x0f\x11\xad\x55\x19\x19\x19\x12\xad\x5d\x0f\x01" } },
    .{ "ShowProfileCardUIForUser", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-2", .import = "ShowProfileCardUIForUser", .signature = "\x00\x04\x11\x79\x12\xad\x61\x11\xad\x55\x12\xad\x59\x0f\x01" } },
    .{ "ShowChangeFriendRelationshipUIForUser", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-2", .import = "ShowChangeFriendRelationshipUIForUser", .signature = "\x00\x04\x11\x79\x12\xad\x61\x11\xad\x55\x12\xad\x59\x0f\x01" } },
    .{ "ShowTitleAchievementsUIForUser", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-2", .import = "ShowTitleAchievementsUIForUser", .signature = "\x00\x04\x11\x79\x12\xad\x61\x09\x12\xad\x59\x0f\x01" } },
    .{ "CheckGamingPrivilegeWithUIForUser", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-2", .import = "CheckGamingPrivilegeWithUIForUser", .signature = "\x00\x07\x11\x79\x12\xad\x61\x09\x11\xad\x55\x11\xad\x55\x11\xad\x55\x12\xad\x59\x0f\x01" } },
    .{ "CheckGamingPrivilegeSilentlyForUser", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-2", .import = "CheckGamingPrivilegeSilentlyForUser", .signature = "\x00\x05\x11\x79\x12\xad\x61\x09\x11\xad\x55\x11\xad\x55\x0f\x11\x59" } },
    .{ "ShowGameInviteUIWithContext", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-3", .import = "ShowGameInviteUIWithContext", .signature = "\x00\x07\x11\x79\x11\xad\x55\x11\xad\x55\x11\xad\x55\x11\xad\x55\x11\xad\x55\x12\xad\x59\x0f\x01" } },
    .{ "ShowGameInviteUIWithContextForUser", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-3", .import = "ShowGameInviteUIWithContextForUser", .signature = "\x00\x08\x11\x79\x12\xad\x61\x11\xad\x55\x11\xad\x55\x11\xad\x55\x11\xad\x55\x11\xad\x55\x12\xad\x59\x0f\x01" } },
    .{ "ShowGameInfoUI", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-4", .import = "ShowGameInfoUI", .signature = "\x00\x03\x11\x79\x09\x12\xad\x59\x0f\x01" } },
    .{ "ShowGameInfoUIForUser", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-4", .import = "ShowGameInfoUIForUser", .signature = "\x00\x04\x11\x79\x12\xad\x61\x09\x12\xad\x59\x0f\x01" } },
    .{ "ShowFindFriendsUI", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-4", .import = "ShowFindFriendsUI", .signature = "\x00\x02\x11\x79\x12\xad\x59\x0f\x01" } },
    .{ "ShowFindFriendsUIForUser", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-4", .import = "ShowFindFriendsUIForUser", .signature = "\x00\x03\x11\x79\x12\xad\x61\x12\xad\x59\x0f\x01" } },
    .{ "ShowCustomizeUserProfileUI", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-4", .import = "ShowCustomizeUserProfileUI", .signature = "\x00\x02\x11\x79\x12\xad\x59\x0f\x01" } },
    .{ "ShowCustomizeUserProfileUIForUser", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-4", .import = "ShowCustomizeUserProfileUIForUser", .signature = "\x00\x03\x11\x79\x12\xad\x61\x12\xad\x59\x0f\x01" } },
    .{ "ShowUserSettingsUI", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-4", .import = "ShowUserSettingsUI", .signature = "\x00\x02\x11\x79\x12\xad\x59\x0f\x01" } },
    .{ "ShowUserSettingsUIForUser", MethodRecord{ .library = "api-ms-win-gaming-tcui-l1-1-4", .import = "ShowUserSettingsUIForUser", .signature = "\x00\x03\x11\x79\x12\xad\x61\x12\xad\x59\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2d51 => TypeRefEntry{ .namespace = "Windows.Win32.Gaming", .name = "GAMING_DEVICE_MODEL_INFORMATION" },
        0x2d55 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "HSTRING" },
        0x2d59 => TypeRefEntry{ .namespace = "Windows.Win32.Gaming", .name = "GameUICompletionRoutine" },
        0x2d5d => TypeRefEntry{ .namespace = "Windows.Win32.Gaming", .name = "PlayerPickerUICompletionRoutine" },
        0x2d61 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "IInspectable" },
        else => null,
    };
}

pub const GIS_NOT_INSTALLED = 1;
pub const GIS_CURRENT_USER = 2;
pub const GIS_ALL_USERS = 3;
pub const GAMESTATS_OPEN_OPENORCREATE = 0;
pub const GAMESTATS_OPEN_OPENONLY = 1;
pub const GAMESTATS_OPEN_CREATED = 0;
pub const GAMESTATS_OPEN_OPENED = 1;
pub const GAMING_DEVICE_VENDOR_ID_NONE = 0;
pub const GAMING_DEVICE_VENDOR_ID_MICROSOFT = -1024700366;
pub const GAMING_DEVICE_DEVICE_ID_NONE = 0;
pub const GAMING_DEVICE_DEVICE_ID_XBOX_ONE = 1988865574;
pub const GAMING_DEVICE_DEVICE_ID_XBOX_ONE_S = 712204761;
pub const GAMING_DEVICE_DEVICE_ID_XBOX_ONE_X = 1523980231;
pub const GAMING_DEVICE_DEVICE_ID_XBOX_ONE_X_DEVKIT = 284675555;
pub const GAMING_DEVICE_DEVICE_ID_XBOX_SERIES_S = 489159355;
pub const GAMING_DEVICE_DEVICE_ID_XBOX_SERIES_X = 796540415;
pub const GAMING_DEVICE_DEVICE_ID_XBOX_SERIES_X_DEVKIT = -561359263;
pub const XPRIVILEGE_BROADCAST = 190;
pub const XPRIVILEGE_VIEW_FRIENDS_LIST = 197;
pub const XPRIVILEGE_GAME_DVR = 198;
pub const XPRIVILEGE_SHARE_KINECT_CONTENT = 199;
pub const XPRIVILEGE_MULTIPLAYER_PARTIES = 203;
pub const XPRIVILEGE_COMMUNICATION_VOICE_INGAME = 205;
pub const XPRIVILEGE_COMMUNICATION_VOICE_SKYPE = 206;
pub const XPRIVILEGE_CLOUD_GAMING_MANAGE_SESSION = 207;
pub const XPRIVILEGE_CLOUD_GAMING_JOIN_SESSION = 208;
pub const XPRIVILEGE_CLOUD_SAVED_GAMES = 209;
pub const XPRIVILEGE_SHARE_CONTENT = 211;
pub const XPRIVILEGE_PREMIUM_CONTENT = 214;
pub const XPRIVILEGE_SUBSCRIPTION_CONTENT = 219;
pub const XPRIVILEGE_SOCIAL_NETWORK_SHARING = 220;
pub const XPRIVILEGE_PREMIUM_VIDEO = 224;
pub const XPRIVILEGE_VIDEO_COMMUNICATIONS = 235;
pub const XPRIVILEGE_PURCHASE_CONTENT = 245;
pub const XPRIVILEGE_USER_CREATED_CONTENT = 247;
pub const XPRIVILEGE_PROFILE_VIEWING = 249;
pub const XPRIVILEGE_COMMUNICATIONS = 252;
pub const XPRIVILEGE_MULTIPLAYER_SESSIONS = 254;
pub const XPRIVILEGE_ADD_FRIEND = 255;
pub const XBL_IDP_AUTH_TOKEN_STATUS_SUCCESS = 0;
pub const XBL_IDP_AUTH_TOKEN_STATUS_OFFLINE_SUCCESS = 1;
pub const XBL_IDP_AUTH_TOKEN_STATUS_NO_ACCOUNT_SET = 2;
pub const XBL_IDP_AUTH_TOKEN_STATUS_LOAD_MSA_ACCOUNT_FAILED = 3;
pub const XBL_IDP_AUTH_TOKEN_STATUS_XBOX_VETO = 4;
pub const XBL_IDP_AUTH_TOKEN_STATUS_MSA_INTERRUPT = 5;
pub const XBL_IDP_AUTH_TOKEN_STATUS_OFFLINE_NO_CONSENT = 6;
pub const XBL_IDP_AUTH_TOKEN_STATUS_VIEW_NOT_SET = 7;
pub const XBL_IDP_AUTH_TOKEN_STATUS_UNKNOWN = -1;

pub const aliases = struct {
    pub const GAME_INSTALL_SCOPE = i32;
    pub const GAMESTATS_OPEN_TYPE = i32;
    pub const GAMESTATS_OPEN_RESULT = i32;
    pub const GAMING_DEVICE_VENDOR_ID = i32;
    pub const GAMING_DEVICE_DEVICE_ID = i32;
    pub const KnownGamingPrivileges = i32;
    pub const XBL_IDP_AUTH_TOKEN_STATUS = i32;
};
