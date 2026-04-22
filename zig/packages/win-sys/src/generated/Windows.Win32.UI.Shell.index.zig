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
    .{ "FileIconInit", MethodRecord{ .library = "SHELL32", .import = "#660", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "LoadUserProfileA", MethodRecord{ .library = "USERENV", .import = "LoadUserProfileA", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x9e\x29" } },
    .{ "LoadUserProfileW", MethodRecord{ .library = "USERENV", .import = "LoadUserProfileW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x9e\x2d" } },
    .{ "UnloadUserProfile", MethodRecord{ .library = "USERENV", .import = "UnloadUserProfile", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x80\x85" } },
    .{ "GetProfilesDirectoryA", MethodRecord{ .library = "USERENV", .import = "GetProfilesDirectoryA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x09" } },
    .{ "GetProfilesDirectoryW", MethodRecord{ .library = "USERENV", .import = "GetProfilesDirectoryW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x09" } },
    .{ "GetProfileType", MethodRecord{ .library = "USERENV", .import = "GetProfileType", .signature = "\x00\x01\x11\x59\x0f\x09" } },
    .{ "DeleteProfileA", MethodRecord{ .library = "USERENV", .import = "DeleteProfileA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "DeleteProfileW", MethodRecord{ .library = "USERENV", .import = "DeleteProfileW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x05" } },
    .{ "CreateProfile", MethodRecord{ .library = "USERENV", .import = "CreateProfile", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "GetDefaultUserProfileDirectoryA", MethodRecord{ .library = "USERENV", .import = "GetDefaultUserProfileDirectoryA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x09" } },
    .{ "GetDefaultUserProfileDirectoryW", MethodRecord{ .library = "USERENV", .import = "GetDefaultUserProfileDirectoryW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x09" } },
    .{ "GetAllUsersProfileDirectoryA", MethodRecord{ .library = "USERENV", .import = "GetAllUsersProfileDirectoryA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x09" } },
    .{ "GetAllUsersProfileDirectoryW", MethodRecord{ .library = "USERENV", .import = "GetAllUsersProfileDirectoryW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x09" } },
    .{ "GetUserProfileDirectoryA", MethodRecord{ .library = "USERENV", .import = "GetUserProfileDirectoryA", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x3d\x0f\x09" } },
    .{ "GetUserProfileDirectoryW", MethodRecord{ .library = "USERENV", .import = "GetUserProfileDirectoryW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x05\x0f\x09" } },
    .{ "InitPropVariantFromStrRet", MethodRecord{ .library = "PROPSYS", .import = "InitPropVariantFromStrRet", .signature = "\x00\x03\x11\x79\x0f\x11\x9e\x31\x0f\x11\x9e\x35\x0f\x11\x82\x01" } },
    .{ "PropVariantToStrRet", MethodRecord{ .library = "PROPSYS", .import = "PropVariantToStrRet", .signature = "\x00\x02\x11\x79\x0f\x11\x82\x01\x0f\x11\x9e\x31" } },
    .{ "InitVariantFromStrRet", MethodRecord{ .library = "PROPSYS", .import = "InitVariantFromStrRet", .signature = "\x00\x03\x11\x79\x0f\x11\x9e\x31\x0f\x11\x9e\x35\x0f\x11\x94\x89" } },
    .{ "VariantToStrRet", MethodRecord{ .library = "PROPSYS", .import = "VariantToStrRet", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\x9e\x31" } },
    .{ "SetWindowSubclass", MethodRecord{ .library = "COMCTL32", .import = "SetWindowSubclass", .signature = "\x00\x04\x11\x59\x11\x25\x12\x9e\x39\x19\x19" } },
    .{ "GetWindowSubclass", MethodRecord{ .library = "COMCTL32", .import = "GetWindowSubclass", .signature = "\x00\x04\x11\x59\x11\x25\x12\x9e\x39\x19\x0f\x19" } },
    .{ "RemoveWindowSubclass", MethodRecord{ .library = "COMCTL32", .import = "RemoveWindowSubclass", .signature = "\x00\x03\x11\x59\x11\x25\x12\x9e\x39\x19" } },
    .{ "DefSubclassProc", MethodRecord{ .library = "COMCTL32", .import = "DefSubclassProc", .signature = "\x00\x04\x11\x82\x35\x11\x25\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "SetWindowContextHelpId", MethodRecord{ .library = "USER32", .import = "SetWindowContextHelpId", .signature = "\x00\x02\x11\x59\x11\x25\x09" } },
    .{ "GetWindowContextHelpId", MethodRecord{ .library = "USER32", .import = "GetWindowContextHelpId", .signature = "\x00\x01\x09\x11\x25" } },
    .{ "SetMenuContextHelpId", MethodRecord{ .library = "USER32", .import = "SetMenuContextHelpId", .signature = "\x00\x02\x11\x59\x11\x83\x91\x09" } },
    .{ "GetMenuContextHelpId", MethodRecord{ .library = "USER32", .import = "GetMenuContextHelpId", .signature = "\x00\x01\x09\x11\x83\x91" } },
    .{ "WinHelpA", MethodRecord{ .library = "USER32", .import = "WinHelpA", .signature = "\x00\x04\x11\x59\x11\x25\x11\x3d\x09\x19" } },
    .{ "WinHelpW", MethodRecord{ .library = "USER32", .import = "WinHelpW", .signature = "\x00\x04\x11\x59\x11\x25\x11\x05\x09\x19" } },
    .{ "SHSimpleIDListFromPath", MethodRecord{ .library = "SHELL32", .import = "SHSimpleIDListFromPath", .signature = "\x00\x01\x0f\x11\x9e\x35\x11\x05" } },
    .{ "SHCreateItemFromIDList", MethodRecord{ .library = "SHELL32", .import = "SHCreateItemFromIDList", .signature = "\x00\x03\x11\x79\x0f\x11\x9e\x35\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHCreateItemFromParsingName", MethodRecord{ .library = "SHELL32", .import = "SHCreateItemFromParsingName", .signature = "\x00\x04\x11\x79\x11\x05\x12\x82\xbd\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHCreateItemWithParent", MethodRecord{ .library = "SHELL32", .import = "SHCreateItemWithParent", .signature = "\x00\x05\x11\x79\x0f\x11\x9e\x35\x12\x9e\x3d\x0f\x11\x9e\x35\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHCreateItemFromRelativeName", MethodRecord{ .library = "SHELL32", .import = "SHCreateItemFromRelativeName", .signature = "\x00\x05\x11\x79\x12\x9e\x41\x11\x05\x12\x82\xbd\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHCreateItemInKnownFolder", MethodRecord{ .library = "SHELL32", .import = "SHCreateItemInKnownFolder", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x09\x11\x05\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHGetIDListFromObject", MethodRecord{ .library = "SHELL32", .import = "SHGetIDListFromObject", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x0f\x0f\x11\x9e\x35" } },
    .{ "SHGetItemFromObject", MethodRecord{ .library = "SHELL32", .import = "SHGetItemFromObject", .signature = "\x00\x03\x11\x79\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHGetNameFromIDList", MethodRecord{ .library = "SHELL32", .import = "SHGetNameFromIDList", .signature = "\x00\x03\x11\x79\x0f\x11\x9e\x35\x11\x9e\x45\x0f\x11\x05" } },
    .{ "SHGetItemFromDataObject", MethodRecord{ .library = "SHELL32", .import = "SHGetItemFromDataObject", .signature = "\x00\x04\x11\x79\x12\x99\xad\x11\x9e\x49\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHCreateShellItemArray", MethodRecord{ .library = "SHELL32", .import = "SHCreateShellItemArray", .signature = "\x00\x05\x11\x79\x0f\x11\x9e\x35\x12\x9e\x3d\x09\x0f\x0f\x11\x9e\x35\x0f\x12\x9e\x4d" } },
    .{ "SHCreateShellItemArrayFromDataObject", MethodRecord{ .library = "SHELL32", .import = "SHCreateShellItemArrayFromDataObject", .signature = "\x00\x03\x11\x79\x12\x99\xad\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHCreateShellItemArrayFromIDLists", MethodRecord{ .library = "SHELL32", .import = "SHCreateShellItemArrayFromIDLists", .signature = "\x00\x03\x11\x79\x09\x0f\x0f\x11\x9e\x35\x0f\x12\x9e\x4d" } },
    .{ "SHCreateShellItemArrayFromShellItem", MethodRecord{ .library = "SHELL32", .import = "SHCreateShellItemArrayFromShellItem", .signature = "\x00\x03\x11\x79\x12\x9e\x41\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHCreateAssociationRegistration", MethodRecord{ .library = "SHELL32", .import = "SHCreateAssociationRegistration", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHCreateDefaultExtractIcon", MethodRecord{ .library = "SHELL32", .import = "SHCreateDefaultExtractIcon", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SetCurrentProcessExplicitAppUserModelID", MethodRecord{ .library = "SHELL32", .import = "SetCurrentProcessExplicitAppUserModelID", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "GetCurrentProcessExplicitAppUserModelID", MethodRecord{ .library = "SHELL32", .import = "GetCurrentProcessExplicitAppUserModelID", .signature = "\x00\x01\x11\x79\x0f\x11\x05" } },
    .{ "SHGetTemporaryPropertyForItem", MethodRecord{ .library = "SHELL32", .import = "SHGetTemporaryPropertyForItem", .signature = "\x00\x03\x11\x79\x12\x9e\x41\x0f\x11\x81\x71\x0f\x11\x82\x01" } },
    .{ "SHSetTemporaryPropertyForItem", MethodRecord{ .library = "SHELL32", .import = "SHSetTemporaryPropertyForItem", .signature = "\x00\x03\x11\x79\x12\x9e\x41\x0f\x11\x81\x71\x0f\x11\x82\x01" } },
    .{ "SHShowManageLibraryUI", MethodRecord{ .library = "SHELL32", .import = "SHShowManageLibraryUI", .signature = "\x00\x05\x11\x79\x12\x9e\x41\x11\x25\x11\x05\x11\x05\x11\x9e\x51" } },
    .{ "SHResolveLibrary", MethodRecord{ .library = "SHELL32", .import = "SHResolveLibrary", .signature = "\x00\x01\x11\x79\x12\x9e\x41" } },
    .{ "SHAssocEnumHandlers", MethodRecord{ .library = "SHELL32", .import = "SHAssocEnumHandlers", .signature = "\x00\x03\x11\x79\x11\x05\x11\x9e\x55\x0f\x12\x9e\x59" } },
    .{ "SHAssocEnumHandlersForProtocolByApplication", MethodRecord{ .library = "SHELL32", .import = "SHAssocEnumHandlersForProtocolByApplication", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "HMONITOR_UserSize", MethodRecord{ .library = "OLE32", .import = "HMONITOR_UserSize", .signature = "\x00\x03\x09\x0f\x09\x09\x0f\x11\x8e\xed" } },
    .{ "HMONITOR_UserMarshal", MethodRecord{ .library = "OLE32", .import = "HMONITOR_UserMarshal", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\x8e\xed" } },
    .{ "HMONITOR_UserUnmarshal", MethodRecord{ .library = "OLE32", .import = "HMONITOR_UserUnmarshal", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\x8e\xed" } },
    .{ "HMONITOR_UserFree", MethodRecord{ .library = "OLE32", .import = "HMONITOR_UserFree", .signature = "\x00\x02\x01\x0f\x09\x0f\x11\x8e\xed" } },
    .{ "HMONITOR_UserSize64", MethodRecord{ .library = "OLE32", .import = "HMONITOR_UserSize64", .signature = "\x00\x03\x09\x0f\x09\x09\x0f\x11\x8e\xed" } },
    .{ "HMONITOR_UserMarshal64", MethodRecord{ .library = "OLE32", .import = "HMONITOR_UserMarshal64", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\x8e\xed" } },
    .{ "HMONITOR_UserUnmarshal64", MethodRecord{ .library = "OLE32", .import = "HMONITOR_UserUnmarshal64", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\x8e\xed" } },
    .{ "HMONITOR_UserFree64", MethodRecord{ .library = "OLE32", .import = "HMONITOR_UserFree64", .signature = "\x00\x02\x01\x0f\x09\x0f\x11\x8e\xed" } },
    .{ "SHCreateDefaultPropertiesOp", MethodRecord{ .library = "SHELL32", .import = "SHCreateDefaultPropertiesOp", .signature = "\x00\x02\x11\x79\x12\x9e\x41\x0f\x12\x9e\x5d" } },
    .{ "SHSetDefaultProperties", MethodRecord{ .library = "SHELL32", .import = "SHSetDefaultProperties", .signature = "\x00\x04\x11\x79\x11\x25\x12\x9e\x41\x09\x12\x9e\x61" } },
    .{ "SHGetMalloc", MethodRecord{ .library = "SHELL32", .import = "SHGetMalloc", .signature = "\x00\x01\x11\x79\x0f\x12\x82\xd9" } },
    .{ "SHAlloc", MethodRecord{ .library = "SHELL32", .import = "SHAlloc", .signature = "\x00\x01\x0f\x01\x19" } },
    .{ "SHFree", MethodRecord{ .library = "SHELL32", .import = "SHFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "SHGetIconOverlayIndexA", MethodRecord{ .library = "SHELL32", .import = "SHGetIconOverlayIndexA", .signature = "\x00\x02\x08\x11\x3d\x08" } },
    .{ "SHGetIconOverlayIndexW", MethodRecord{ .library = "SHELL32", .import = "SHGetIconOverlayIndexW", .signature = "\x00\x02\x08\x11\x05\x08" } },
    .{ "ILClone", MethodRecord{ .library = "SHELL32", .import = "ILClone", .signature = "\x00\x01\x0f\x11\x9e\x35\x0f\x11\x9e\x35" } },
    .{ "ILCloneFirst", MethodRecord{ .library = "SHELL32", .import = "ILCloneFirst", .signature = "\x00\x01\x0f\x11\x9e\x35\x0f\x11\x9e\x35" } },
    .{ "ILCombine", MethodRecord{ .library = "SHELL32", .import = "ILCombine", .signature = "\x00\x02\x0f\x11\x9e\x35\x0f\x11\x9e\x35\x0f\x11\x9e\x35" } },
    .{ "ILFree", MethodRecord{ .library = "SHELL32", .import = "ILFree", .signature = "\x00\x01\x01\x0f\x11\x9e\x35" } },
    .{ "ILGetNext", MethodRecord{ .library = "SHELL32", .import = "ILGetNext", .signature = "\x00\x01\x0f\x11\x9e\x35\x0f\x11\x9e\x35" } },
    .{ "ILGetSize", MethodRecord{ .library = "SHELL32", .import = "ILGetSize", .signature = "\x00\x01\x09\x0f\x11\x9e\x35" } },
    .{ "ILFindChild", MethodRecord{ .library = "SHELL32", .import = "ILFindChild", .signature = "\x00\x02\x0f\x11\x9e\x35\x0f\x11\x9e\x35\x0f\x11\x9e\x35" } },
    .{ "ILFindLastID", MethodRecord{ .library = "SHELL32", .import = "ILFindLastID", .signature = "\x00\x01\x0f\x11\x9e\x35\x0f\x11\x9e\x35" } },
    .{ "ILRemoveLastID", MethodRecord{ .library = "SHELL32", .import = "ILRemoveLastID", .signature = "\x00\x01\x11\x59\x0f\x11\x9e\x35" } },
    .{ "ILIsEqual", MethodRecord{ .library = "SHELL32", .import = "ILIsEqual", .signature = "\x00\x02\x11\x59\x0f\x11\x9e\x35\x0f\x11\x9e\x35" } },
    .{ "ILIsParent", MethodRecord{ .library = "SHELL32", .import = "ILIsParent", .signature = "\x00\x03\x11\x59\x0f\x11\x9e\x35\x0f\x11\x9e\x35\x11\x59" } },
    .{ "ILSaveToStream", MethodRecord{ .library = "SHELL32", .import = "ILSaveToStream", .signature = "\x00\x02\x11\x79\x12\x83\x75\x0f\x11\x9e\x35" } },
    .{ "ILLoadFromStreamEx", MethodRecord{ .library = "SHELL32", .import = "ILLoadFromStreamEx", .signature = "\x00\x02\x11\x79\x12\x83\x75\x0f\x0f\x11\x9e\x35" } },
    .{ "ILCreateFromPathA", MethodRecord{ .library = "SHELL32", .import = "ILCreateFromPathA", .signature = "\x00\x01\x0f\x11\x9e\x35\x11\x3d" } },
    .{ "ILCreateFromPathW", MethodRecord{ .library = "SHELL32", .import = "ILCreateFromPathW", .signature = "\x00\x01\x0f\x11\x9e\x35\x11\x05" } },
    .{ "SHILCreateFromPath", MethodRecord{ .library = "SHELL32", .import = "SHILCreateFromPath", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x0f\x11\x9e\x35\x0f\x09" } },
    .{ "ILAppendID", MethodRecord{ .library = "SHELL32", .import = "ILAppendID", .signature = "\x00\x03\x0f\x11\x9e\x35\x0f\x11\x9e\x35\x0f\x11\x9e\x65\x11\x59" } },
    .{ "SHGetPathFromIDListEx", MethodRecord{ .library = "SHELL32", .import = "SHGetPathFromIDListEx", .signature = "\x00\x04\x11\x59\x0f\x11\x9e\x35\x11\x05\x09\x11\x9e\x69" } },
    .{ "SHGetPathFromIDListA", MethodRecord{ .library = "SHELL32", .import = "SHGetPathFromIDListA", .signature = "\x00\x02\x11\x59\x0f\x11\x9e\x35\x11\x3d" } },
    .{ "SHGetPathFromIDListW", MethodRecord{ .library = "SHELL32", .import = "SHGetPathFromIDListW", .signature = "\x00\x02\x11\x59\x0f\x11\x9e\x35\x11\x05" } },
    .{ "SHCreateDirectory", MethodRecord{ .library = "SHELL32", .import = "SHCreateDirectory", .signature = "\x00\x02\x08\x11\x25\x11\x05" } },
    .{ "SHCreateDirectoryExA", MethodRecord{ .library = "SHELL32", .import = "SHCreateDirectoryExA", .signature = "\x00\x03\x08\x11\x25\x11\x3d\x0f\x11\x8b\xb5" } },
    .{ "SHCreateDirectoryExW", MethodRecord{ .library = "SHELL32", .import = "SHCreateDirectoryExW", .signature = "\x00\x03\x08\x11\x25\x11\x05\x0f\x11\x8b\xb5" } },
    .{ "SHOpenFolderAndSelectItems", MethodRecord{ .library = "SHELL32", .import = "SHOpenFolderAndSelectItems", .signature = "\x00\x04\x11\x79\x0f\x11\x9e\x35\x09\x0f\x0f\x11\x9e\x35\x09" } },
    .{ "SHCreateShellItem", MethodRecord{ .library = "SHELL32", .import = "SHCreateShellItem", .signature = "\x00\x04\x11\x79\x0f\x11\x9e\x35\x12\x9e\x3d\x0f\x11\x9e\x35\x0f\x12\x9e\x41" } },
    .{ "SHGetSpecialFolderLocation", MethodRecord{ .library = "SHELL32", .import = "SHGetSpecialFolderLocation", .signature = "\x00\x03\x11\x79\x11\x25\x08\x0f\x0f\x11\x9e\x35" } },
    .{ "SHCloneSpecialIDList", MethodRecord{ .library = "SHELL32", .import = "SHCloneSpecialIDList", .signature = "\x00\x03\x0f\x11\x9e\x35\x11\x25\x08\x11\x59" } },
    .{ "SHGetSpecialFolderPathA", MethodRecord{ .library = "SHELL32", .import = "SHGetSpecialFolderPathA", .signature = "\x00\x04\x11\x59\x11\x25\x11\x3d\x08\x11\x59" } },
    .{ "SHGetSpecialFolderPathW", MethodRecord{ .library = "SHELL32", .import = "SHGetSpecialFolderPathW", .signature = "\x00\x04\x11\x59\x11\x25\x11\x05\x08\x11\x59" } },
    .{ "SHFlushSFCache", MethodRecord{ .library = "SHELL32", .import = "SHFlushSFCache", .signature = "\x00\x00\x01" } },
    .{ "SHGetFolderPathA", MethodRecord{ .library = "SHELL32", .import = "SHGetFolderPathA", .signature = "\x00\x05\x11\x79\x11\x25\x08\x11\x80\x85\x09\x11\x3d" } },
    .{ "SHGetFolderPathW", MethodRecord{ .library = "SHELL32", .import = "SHGetFolderPathW", .signature = "\x00\x05\x11\x79\x11\x25\x08\x11\x80\x85\x09\x11\x05" } },
    .{ "SHGetFolderLocation", MethodRecord{ .library = "SHELL32", .import = "SHGetFolderLocation", .signature = "\x00\x05\x11\x79\x11\x25\x08\x11\x80\x85\x09\x0f\x0f\x11\x9e\x35" } },
    .{ "SHSetFolderPathA", MethodRecord{ .library = "SHELL32", .import = "SHSetFolderPathA", .signature = "\x00\x04\x11\x79\x08\x11\x80\x85\x09\x11\x3d" } },
    .{ "SHSetFolderPathW", MethodRecord{ .library = "SHELL32", .import = "SHSetFolderPathW", .signature = "\x00\x04\x11\x79\x08\x11\x80\x85\x09\x11\x05" } },
    .{ "SHGetFolderPathAndSubDirA", MethodRecord{ .library = "SHELL32", .import = "SHGetFolderPathAndSubDirA", .signature = "\x00\x06\x11\x79\x11\x25\x08\x11\x80\x85\x09\x11\x3d\x11\x3d" } },
    .{ "SHGetFolderPathAndSubDirW", MethodRecord{ .library = "SHELL32", .import = "SHGetFolderPathAndSubDirW", .signature = "\x00\x06\x11\x79\x11\x25\x08\x11\x80\x85\x09\x11\x05\x11\x05" } },
    .{ "SHGetKnownFolderIDList", MethodRecord{ .library = "SHELL32", .import = "SHGetKnownFolderIDList", .signature = "\x00\x04\x11\x79\x0f\x11\x0d\x09\x11\x80\x85\x0f\x0f\x11\x9e\x35" } },
    .{ "SHSetKnownFolderPath", MethodRecord{ .library = "SHELL32", .import = "SHSetKnownFolderPath", .signature = "\x00\x04\x11\x79\x0f\x11\x0d\x09\x11\x80\x85\x11\x05" } },
    .{ "SHGetKnownFolderPath", MethodRecord{ .library = "SHELL32", .import = "SHGetKnownFolderPath", .signature = "\x00\x04\x11\x79\x0f\x11\x0d\x09\x11\x80\x85\x0f\x11\x05" } },
    .{ "SHGetKnownFolderItem", MethodRecord{ .library = "SHELL32", .import = "SHGetKnownFolderItem", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x11\x9e\x71\x11\x80\x85\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHGetSetFolderCustomSettings", MethodRecord{ .library = "SHELL32", .import = "SHGetSetFolderCustomSettings", .signature = "\x00\x03\x11\x79\x0f\x11\x9e\x75\x11\x05\x09" } },
    .{ "SHBrowseForFolderA", MethodRecord{ .library = "SHELL32", .import = "SHBrowseForFolderA", .signature = "\x00\x01\x0f\x11\x9e\x35\x0f\x11\x9e\x79" } },
    .{ "SHBrowseForFolderW", MethodRecord{ .library = "SHELL32", .import = "SHBrowseForFolderW", .signature = "\x00\x01\x0f\x11\x9e\x35\x0f\x11\x9e\x7d" } },
    .{ "SHLoadInProc", MethodRecord{ .library = "SHELL32", .import = "SHLoadInProc", .signature = "\x00\x01\x11\x79\x0f\x11\x0d" } },
    .{ "SHGetDesktopFolder", MethodRecord{ .library = "SHELL32", .import = "SHGetDesktopFolder", .signature = "\x00\x01\x11\x79\x0f\x12\x9e\x3d" } },
    .{ "SHChangeNotify", MethodRecord{ .library = "SHELL32", .import = "SHChangeNotify", .signature = "\x00\x04\x01\x08\x11\x9e\x81\x0f\x01\x0f\x01" } },
    .{ "SHAddToRecentDocs", MethodRecord{ .library = "SHELL32", .import = "SHAddToRecentDocs", .signature = "\x00\x02\x01\x09\x0f\x01" } },
    .{ "SHHandleUpdateImage", MethodRecord{ .library = "SHELL32", .import = "SHHandleUpdateImage", .signature = "\x00\x01\x08\x0f\x11\x9e\x35" } },
    .{ "SHUpdateImageA", MethodRecord{ .library = "SHELL32", .import = "SHUpdateImageA", .signature = "\x00\x04\x01\x11\x3d\x08\x09\x08" } },
    .{ "SHUpdateImageW", MethodRecord{ .library = "SHELL32", .import = "SHUpdateImageW", .signature = "\x00\x04\x01\x11\x05\x08\x09\x08" } },
    .{ "SHChangeNotifyRegister", MethodRecord{ .library = "SHELL32", .import = "SHChangeNotifyRegister", .signature = "\x00\x06\x09\x11\x25\x11\x9e\x85\x08\x09\x08\x0f\x11\x9e\x89" } },
    .{ "SHChangeNotifyDeregister", MethodRecord{ .library = "SHELL32", .import = "SHChangeNotifyDeregister", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "SHChangeNotification_Lock", MethodRecord{ .library = "SHELL32", .import = "SHChangeNotification_Lock", .signature = "\x00\x04\x11\x80\x85\x11\x80\x85\x09\x0f\x0f\x0f\x11\x9e\x35\x0f\x08" } },
    .{ "SHChangeNotification_Unlock", MethodRecord{ .library = "SHELL32", .import = "SHChangeNotification_Unlock", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "SHGetRealIDL", MethodRecord{ .library = "SHELL32", .import = "SHGetRealIDL", .signature = "\x00\x03\x11\x79\x12\x9e\x3d\x0f\x11\x9e\x35\x0f\x0f\x11\x9e\x35" } },
    .{ "SHGetInstanceExplorer", MethodRecord{ .library = "SHELL32", .import = "SHGetInstanceExplorer", .signature = "\x00\x01\x11\x79\x0f\x12\x82\xb1" } },
    .{ "SHGetDataFromIDListA", MethodRecord{ .library = "SHELL32", .import = "SHGetDataFromIDListA", .signature = "\x00\x05\x11\x79\x12\x9e\x3d\x0f\x11\x9e\x35\x11\x9e\x8d\x0f\x01\x08" } },
    .{ "SHGetDataFromIDListW", MethodRecord{ .library = "SHELL32", .import = "SHGetDataFromIDListW", .signature = "\x00\x05\x11\x79\x12\x9e\x3d\x0f\x11\x9e\x35\x11\x9e\x8d\x0f\x01\x08" } },
    .{ "RestartDialog", MethodRecord{ .library = "SHELL32", .import = "RestartDialog", .signature = "\x00\x03\x08\x11\x25\x11\x05\x09" } },
    .{ "RestartDialogEx", MethodRecord{ .library = "SHELL32", .import = "RestartDialogEx", .signature = "\x00\x04\x08\x11\x25\x11\x05\x09\x09" } },
    .{ "SHCoCreateInstance", MethodRecord{ .library = "SHELL32", .import = "SHCoCreateInstance", .signature = "\x00\x05\x11\x79\x11\x05\x0f\x11\x0d\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHCreateDataObject", MethodRecord{ .library = "SHELL32", .import = "SHCreateDataObject", .signature = "\x00\x06\x11\x79\x0f\x11\x9e\x35\x09\x0f\x0f\x11\x9e\x35\x12\x99\xad\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CIDLData_CreateFromIDArray", MethodRecord{ .library = "SHELL32", .import = "CIDLData_CreateFromIDArray", .signature = "\x00\x04\x11\x79\x0f\x11\x9e\x35\x09\x0f\x0f\x11\x9e\x35\x0f\x12\x99\xad" } },
    .{ "SHCreateStdEnumFmtEtc", MethodRecord{ .library = "SHELL32", .import = "SHCreateStdEnumFmtEtc", .signature = "\x00\x03\x11\x79\x09\x0f\x11\x99\xb1\x0f\x12\x9a\x09" } },
    .{ "SHDoDragDrop", MethodRecord{ .library = "SHELL32", .import = "SHDoDragDrop", .signature = "\x00\x05\x11\x79\x11\x25\x12\x99\xad\x12\x99\xd1\x11\x99\xd5\x0f\x11\x99\xd5" } },
    .{ "DAD_SetDragImage", MethodRecord{ .library = "SHELL32", .import = "DAD_SetDragImage", .signature = "\x00\x02\x11\x59\x11\x83\x49\x0f\x11\x83\x71" } },
    .{ "DAD_DragEnterEx", MethodRecord{ .library = "SHELL32", .import = "DAD_DragEnterEx", .signature = "\x00\x02\x11\x59\x11\x25\x11\x83\x71" } },
    .{ "DAD_DragEnterEx2", MethodRecord{ .library = "SHELL32", .import = "DAD_DragEnterEx2", .signature = "\x00\x03\x11\x59\x11\x25\x11\x83\x71\x12\x99\xad" } },
    .{ "DAD_ShowDragImage", MethodRecord{ .library = "SHELL32", .import = "DAD_ShowDragImage", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "DAD_DragMove", MethodRecord{ .library = "SHELL32", .import = "DAD_DragMove", .signature = "\x00\x01\x11\x59\x11\x83\x71" } },
    .{ "DAD_DragLeave", MethodRecord{ .library = "SHELL32", .import = "DAD_DragLeave", .signature = "\x00\x00\x11\x59" } },
    .{ "DAD_AutoScroll", MethodRecord{ .library = "SHELL32", .import = "DAD_AutoScroll", .signature = "\x00\x03\x11\x59\x11\x25\x0f\x11\x9e\x91\x0f\x11\x83\x71" } },
    .{ "ReadCabinetState", MethodRecord{ .library = "SHELL32", .import = "ReadCabinetState", .signature = "\x00\x02\x11\x59\x0f\x11\x9e\x95\x08" } },
    .{ "WriteCabinetState", MethodRecord{ .library = "SHELL32", .import = "WriteCabinetState", .signature = "\x00\x01\x11\x59\x0f\x11\x9e\x95" } },
    .{ "PathMakeUniqueName", MethodRecord{ .library = "SHELL32", .import = "PathMakeUniqueName", .signature = "\x00\x05\x11\x59\x11\x05\x09\x11\x05\x11\x05\x11\x05" } },
    .{ "PathIsExe", MethodRecord{ .library = "SHELL32", .import = "PathIsExe", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathCleanupSpec", MethodRecord{ .library = "SHELL32", .import = "PathCleanupSpec", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
    .{ "PathResolve", MethodRecord{ .library = "SHELL32", .import = "PathResolve", .signature = "\x00\x03\x08\x11\x05\x0f\x0f\x07\x09" } },
    .{ "GetFileNameFromBrowse", MethodRecord{ .library = "SHELL32", .import = "GetFileNameFromBrowse", .signature = "\x00\x07\x11\x59\x11\x25\x11\x05\x09\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "DriveType", MethodRecord{ .library = "SHELL32", .import = "DriveType", .signature = "\x00\x01\x08\x08" } },
    .{ "RealDriveType", MethodRecord{ .library = "SHELL32", .import = "RealDriveType", .signature = "\x00\x02\x08\x08\x11\x59" } },
    .{ "IsNetDrive", MethodRecord{ .library = "SHELL32", .import = "IsNetDrive", .signature = "\x00\x01\x08\x08" } },
    .{ "Shell_MergeMenus", MethodRecord{ .library = "SHELL32", .import = "Shell_MergeMenus", .signature = "\x00\x06\x09\x11\x83\x91\x11\x83\x91\x09\x09\x09\x11\x9e\x99" } },
    .{ "SHObjectProperties", MethodRecord{ .library = "SHELL32", .import = "SHObjectProperties", .signature = "\x00\x04\x11\x59\x11\x25\x09\x11\x05\x11\x05" } },
    .{ "SHFormatDrive", MethodRecord{ .library = "SHELL32", .import = "SHFormatDrive", .signature = "\x00\x04\x09\x11\x25\x09\x11\x9e\x9d\x09" } },
    .{ "SHDestroyPropSheetExtArray", MethodRecord{ .library = "SHELL32", .import = "SHDestroyPropSheetExtArray", .signature = "\x00\x01\x01\x11\x9e\xa1" } },
    .{ "SHAddFromPropSheetExtArray", MethodRecord{ .library = "SHELL32", .import = "SHAddFromPropSheetExtArray", .signature = "\x00\x03\x09\x11\x9e\xa1\x12\x9e\xa5\x11\x82\x2d" } },
    .{ "SHReplaceFromPropSheetExtArray", MethodRecord{ .library = "SHELL32", .import = "SHReplaceFromPropSheetExtArray", .signature = "\x00\x04\x09\x11\x9e\xa1\x09\x12\x9e\xa5\x11\x82\x2d" } },
    .{ "OpenRegStream", MethodRecord{ .library = "SHELL32", .import = "OpenRegStream", .signature = "\x00\x04\x12\x83\x75\x11\x55\x11\x05\x11\x05\x09" } },
    .{ "SHFindFiles", MethodRecord{ .library = "SHELL32", .import = "SHFindFiles", .signature = "\x00\x02\x11\x59\x0f\x11\x9e\x35\x0f\x11\x9e\x35" } },
    .{ "PathGetShortPath", MethodRecord{ .library = "SHELL32", .import = "PathGetShortPath", .signature = "\x00\x01\x01\x11\x05" } },
    .{ "PathYetAnotherMakeUniqueName", MethodRecord{ .library = "SHELL32", .import = "PathYetAnotherMakeUniqueName", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "Win32DeleteFile", MethodRecord{ .library = "SHELL32", .import = "Win32DeleteFile", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "SHRestricted", MethodRecord{ .library = "SHELL32", .import = "SHRestricted", .signature = "\x00\x01\x09\x11\x9e\xa9" } },
    .{ "SignalFileOpen", MethodRecord{ .library = "SHELL32", .import = "SignalFileOpen", .signature = "\x00\x01\x11\x59\x0f\x11\x9e\x35" } },
    .{ "AssocGetDetailsOfPropKey", MethodRecord{ .library = "SHELL32", .import = "AssocGetDetailsOfPropKey", .signature = "\x00\x05\x11\x79\x12\x9e\x3d\x0f\x11\x9e\x35\x0f\x11\x81\x71\x0f\x11\x94\x89\x0f\x11\x59" } },
    .{ "SHStartNetConnectionDialogW", MethodRecord{ .library = "SHELL32", .import = "SHStartNetConnectionDialogW", .signature = "\x00\x03\x11\x79\x11\x25\x11\x05\x09" } },
    .{ "SHDefExtractIconA", MethodRecord{ .library = "SHELL32", .import = "SHDefExtractIconA", .signature = "\x00\x06\x11\x79\x11\x3d\x08\x09\x0f\x11\x83\x55\x0f\x11\x83\x55\x09" } },
    .{ "SHDefExtractIconW", MethodRecord{ .library = "SHELL32", .import = "SHDefExtractIconW", .signature = "\x00\x06\x11\x79\x11\x05\x08\x09\x0f\x11\x83\x55\x0f\x11\x83\x55\x09" } },
    .{ "SHOpenWithDialog", MethodRecord{ .library = "SHELL32", .import = "SHOpenWithDialog", .signature = "\x00\x02\x11\x79\x11\x25\x0f\x11\x9e\xad" } },
    .{ "Shell_GetImageLists", MethodRecord{ .library = "SHELL32", .import = "Shell_GetImageLists", .signature = "\x00\x02\x11\x59\x0f\x11\x83\x49\x0f\x11\x83\x49" } },
    .{ "Shell_GetCachedImageIndex", MethodRecord{ .library = "SHELL32", .import = "Shell_GetCachedImageIndex", .signature = "\x00\x03\x08\x11\x05\x08\x09" } },
    .{ "Shell_GetCachedImageIndexA", MethodRecord{ .library = "SHELL32", .import = "Shell_GetCachedImageIndexA", .signature = "\x00\x03\x08\x11\x3d\x08\x09" } },
    .{ "Shell_GetCachedImageIndexW", MethodRecord{ .library = "SHELL32", .import = "Shell_GetCachedImageIndexW", .signature = "\x00\x03\x08\x11\x05\x08\x09" } },
    .{ "SHValidateUNC", MethodRecord{ .library = "SHELL32", .import = "SHValidateUNC", .signature = "\x00\x03\x11\x59\x11\x25\x11\x05\x09" } },
    .{ "SHSetInstanceExplorer", MethodRecord{ .library = "SHELL32", .import = "SHSetInstanceExplorer", .signature = "\x00\x01\x01\x12\x82\xb1" } },
    .{ "IsUserAnAdmin", MethodRecord{ .library = "SHELL32", .import = "IsUserAnAdmin", .signature = "\x00\x00\x11\x59" } },
    .{ "SHShellFolderView_Message", MethodRecord{ .library = "SHELL32", .import = "SHShellFolderView_Message", .signature = "\x00\x03\x11\x82\x35\x11\x25\x09\x11\x82\x2d" } },
    .{ "SHCreateShellFolderView", MethodRecord{ .library = "SHELL32", .import = "SHCreateShellFolderView", .signature = "\x00\x02\x11\x79\x0f\x11\x9e\xb1\x0f\x12\x9e\xb5" } },
    .{ "CDefFolderMenu_Create2", MethodRecord{ .library = "SHELL32", .import = "CDefFolderMenu_Create2", .signature = "\x00\x09\x11\x79\x0f\x11\x9e\x35\x11\x25\x09\x0f\x0f\x11\x9e\x35\x12\x9e\x3d\x12\x9e\xb9\x09\x0f\x11\x55\x0f\x12\x9e\xbd" } },
    .{ "SHCreateDefaultContextMenu", MethodRecord{ .library = "SHELL32", .import = "SHCreateDefaultContextMenu", .signature = "\x00\x03\x11\x79\x0f\x11\x9e\xc1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHFind_InitMenuPopup", MethodRecord{ .library = "SHELL32", .import = "SHFind_InitMenuPopup", .signature = "\x00\x04\x12\x9e\xbd\x11\x83\x91\x11\x25\x09\x09" } },
    .{ "SHCreateShellFolderViewEx", MethodRecord{ .library = "SHELL32", .import = "SHCreateShellFolderViewEx", .signature = "\x00\x02\x11\x79\x0f\x11\x9e\xc5\x0f\x12\x9e\xb5" } },
    .{ "SHGetSetSettings", MethodRecord{ .library = "SHELL32", .import = "SHGetSetSettings", .signature = "\x00\x03\x01\x0f\x11\x9e\xc9\x11\x9e\xcd\x11\x59" } },
    .{ "SHGetSettings", MethodRecord{ .library = "SHELL32", .import = "SHGetSettings", .signature = "\x00\x02\x01\x0f\x11\x9e\xd1\x09" } },
    .{ "SHBindToParent", MethodRecord{ .library = "SHELL32", .import = "SHBindToParent", .signature = "\x00\x04\x11\x79\x0f\x11\x9e\x35\x0f\x11\x0d\x0f\x0f\x01\x0f\x0f\x11\x9e\x35" } },
    .{ "SHBindToFolderIDListParent", MethodRecord{ .library = "SHELL32", .import = "SHBindToFolderIDListParent", .signature = "\x00\x05\x11\x79\x12\x9e\x3d\x0f\x11\x9e\x35\x0f\x11\x0d\x0f\x0f\x01\x0f\x0f\x11\x9e\x35" } },
    .{ "SHBindToFolderIDListParentEx", MethodRecord{ .library = "SHELL32", .import = "SHBindToFolderIDListParentEx", .signature = "\x00\x06\x11\x79\x12\x9e\x3d\x0f\x11\x9e\x35\x12\x82\xbd\x0f\x11\x0d\x0f\x0f\x01\x0f\x0f\x11\x9e\x35" } },
    .{ "SHBindToObject", MethodRecord{ .library = "SHELL32", .import = "SHBindToObject", .signature = "\x00\x05\x11\x79\x12\x9e\x3d\x0f\x11\x9e\x35\x12\x82\xbd\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHParseDisplayName", MethodRecord{ .library = "SHELL32", .import = "SHParseDisplayName", .signature = "\x00\x05\x11\x79\x11\x05\x12\x82\xbd\x0f\x0f\x11\x9e\x35\x09\x0f\x09" } },
    .{ "SHPathPrepareForWriteA", MethodRecord{ .library = "SHELL32", .import = "SHPathPrepareForWriteA", .signature = "\x00\x04\x11\x79\x11\x25\x12\x82\xb1\x11\x3d\x09" } },
    .{ "SHPathPrepareForWriteW", MethodRecord{ .library = "SHELL32", .import = "SHPathPrepareForWriteW", .signature = "\x00\x04\x11\x79\x11\x25\x12\x82\xb1\x11\x05\x09" } },
    .{ "SHCreateFileExtractIconW", MethodRecord{ .library = "SHELL32", .import = "SHCreateFileExtractIconW", .signature = "\x00\x04\x11\x79\x11\x05\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHLimitInputEdit", MethodRecord{ .library = "SHELL32", .import = "SHLimitInputEdit", .signature = "\x00\x02\x11\x79\x11\x25\x12\x9e\x3d" } },
    .{ "SHGetAttributesFromDataObject", MethodRecord{ .library = "SHELL32", .import = "SHGetAttributesFromDataObject", .signature = "\x00\x04\x11\x79\x12\x99\xad\x09\x0f\x09\x0f\x09" } },
    .{ "SHMapPIDLToSystemImageListIndex", MethodRecord{ .library = "SHELL32", .import = "SHMapPIDLToSystemImageListIndex", .signature = "\x00\x03\x08\x12\x9e\x3d\x0f\x11\x9e\x35\x0f\x08" } },
    .{ "SHCLSIDFromString", MethodRecord{ .library = "SHELL32", .import = "SHCLSIDFromString", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x0d" } },
    .{ "PickIconDlg", MethodRecord{ .library = "SHELL32", .import = "PickIconDlg", .signature = "\x00\x04\x08\x11\x25\x11\x05\x09\x0f\x08" } },
    .{ "StgMakeUniqueName", MethodRecord{ .library = "SHELL32", .import = "StgMakeUniqueName", .signature = "\x00\x05\x11\x79\x12\x99\xb9\x11\x05\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHChangeNotifyRegisterThread", MethodRecord{ .library = "SHELL32", .import = "SHChangeNotifyRegisterThread", .signature = "\x00\x01\x01\x11\x9e\xd5" } },
    .{ "PathQualify", MethodRecord{ .library = "SHELL32", .import = "PathQualify", .signature = "\x00\x01\x01\x11\x05" } },
    .{ "PathIsSlowA", MethodRecord{ .library = "SHELL32", .import = "PathIsSlowA", .signature = "\x00\x02\x11\x59\x11\x3d\x09" } },
    .{ "PathIsSlowW", MethodRecord{ .library = "SHELL32", .import = "PathIsSlowW", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "SHCreatePropSheetExtArray", MethodRecord{ .library = "SHELL32", .import = "SHCreatePropSheetExtArray", .signature = "\x00\x03\x11\x9e\xa1\x11\x55\x11\x05\x09" } },
    .{ "SHOpenPropSheetW", MethodRecord{ .library = "SHELL32", .import = "SHOpenPropSheetW", .signature = "\x00\x07\x11\x59\x11\x05\x0f\x11\x55\x09\x0f\x11\x0d\x12\x99\xad\x12\x9e\xd9\x11\x05" } },
    .{ "SoftwareUpdateMessageBox", MethodRecord{ .library = "SHDOCVW", .import = "SoftwareUpdateMessageBox", .signature = "\x00\x04\x09\x11\x25\x11\x05\x09\x0f\x11\x9e\xdd" } },
    .{ "SHMultiFileProperties", MethodRecord{ .library = "SHELL32", .import = "SHMultiFileProperties", .signature = "\x00\x02\x11\x79\x12\x99\xad\x09" } },
    .{ "SHCreateQueryCancelAutoPlayMoniker", MethodRecord{ .library = "SHELL32", .import = "SHCreateQueryCancelAutoPlayMoniker", .signature = "\x00\x01\x11\x79\x0f\x12\x82\xc9" } },
    .{ "ImportPrivacySettings", MethodRecord{ .library = "SHDOCVW", .import = "ImportPrivacySettings", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x11\x59\x0f\x11\x59" } },
    .{ "GetScaleFactorForDevice", MethodRecord{ .library = "api-ms-win-shcore-scaling-l1-1-0", .import = "GetScaleFactorForDevice", .signature = "\x00\x01\x11\x9e\xe1\x11\x9e\xe5" } },
    .{ "RegisterScaleChangeNotifications", MethodRecord{ .library = "api-ms-win-shcore-scaling-l1-1-0", .import = "RegisterScaleChangeNotifications", .signature = "\x00\x04\x11\x79\x11\x9e\xe5\x11\x25\x09\x0f\x09" } },
    .{ "RevokeScaleChangeNotifications", MethodRecord{ .library = "api-ms-win-shcore-scaling-l1-1-0", .import = "RevokeScaleChangeNotifications", .signature = "\x00\x02\x11\x79\x11\x9e\xe5\x09" } },
    .{ "GetScaleFactorForMonitor", MethodRecord{ .library = "api-ms-win-shcore-scaling-l1-1-1", .import = "GetScaleFactorForMonitor", .signature = "\x00\x02\x11\x79\x11\x8e\xed\x0f\x11\x9e\xe1" } },
    .{ "RegisterScaleChangeEvent", MethodRecord{ .library = "api-ms-win-shcore-scaling-l1-1-1", .import = "RegisterScaleChangeEvent", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x19" } },
    .{ "UnregisterScaleChangeEvent", MethodRecord{ .library = "api-ms-win-shcore-scaling-l1-1-1", .import = "UnregisterScaleChangeEvent", .signature = "\x00\x01\x11\x79\x19" } },
    .{ "GetDpiForShellUIComponent", MethodRecord{ .library = "api-ms-win-shcore-scaling-l1-1-2", .import = "GetDpiForShellUIComponent", .signature = "\x00\x01\x09\x11\x9e\xe9" } },
    .{ "CommandLineToArgvW", MethodRecord{ .library = "SHELL32", .import = "CommandLineToArgvW", .signature = "\x00\x02\x0f\x11\x05\x11\x05\x0f\x08" } },
    .{ "DragQueryFileA", MethodRecord{ .library = "SHELL32", .import = "DragQueryFileA", .signature = "\x00\x04\x09\x11\x9e\xed\x09\x11\x3d\x09" } },
    .{ "DragQueryFileW", MethodRecord{ .library = "SHELL32", .import = "DragQueryFileW", .signature = "\x00\x04\x09\x11\x9e\xed\x09\x11\x05\x09" } },
    .{ "DragQueryPoint", MethodRecord{ .library = "SHELL32", .import = "DragQueryPoint", .signature = "\x00\x02\x11\x59\x11\x9e\xed\x0f\x11\x83\x71" } },
    .{ "DragFinish", MethodRecord{ .library = "SHELL32", .import = "DragFinish", .signature = "\x00\x01\x01\x11\x9e\xed" } },
    .{ "DragAcceptFiles", MethodRecord{ .library = "SHELL32", .import = "DragAcceptFiles", .signature = "\x00\x02\x01\x11\x25\x11\x59" } },
    .{ "ShellExecuteA", MethodRecord{ .library = "SHELL32", .import = "ShellExecuteA", .signature = "\x00\x06\x11\x82\x29\x11\x25\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x11\x9e\xf1" } },
    .{ "ShellExecuteW", MethodRecord{ .library = "SHELL32", .import = "ShellExecuteW", .signature = "\x00\x06\x11\x82\x29\x11\x25\x11\x05\x11\x05\x11\x05\x11\x05\x11\x9e\xf1" } },
    .{ "FindExecutableA", MethodRecord{ .library = "SHELL32", .import = "FindExecutableA", .signature = "\x00\x03\x11\x82\x29\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "FindExecutableW", MethodRecord{ .library = "SHELL32", .import = "FindExecutableW", .signature = "\x00\x03\x11\x82\x29\x11\x05\x11\x05\x11\x05" } },
    .{ "ShellAboutA", MethodRecord{ .library = "SHELL32", .import = "ShellAboutA", .signature = "\x00\x04\x08\x11\x25\x11\x3d\x11\x3d\x11\x83\x55" } },
    .{ "ShellAboutW", MethodRecord{ .library = "SHELL32", .import = "ShellAboutW", .signature = "\x00\x04\x08\x11\x25\x11\x05\x11\x05\x11\x83\x55" } },
    .{ "DuplicateIcon", MethodRecord{ .library = "SHELL32", .import = "DuplicateIcon", .signature = "\x00\x02\x11\x83\x55\x11\x82\x29\x11\x83\x55" } },
    .{ "ExtractAssociatedIconA", MethodRecord{ .library = "SHELL32", .import = "ExtractAssociatedIconA", .signature = "\x00\x03\x11\x83\x55\x11\x82\x29\x11\x3d\x0f\x07" } },
    .{ "ExtractAssociatedIconW", MethodRecord{ .library = "SHELL32", .import = "ExtractAssociatedIconW", .signature = "\x00\x03\x11\x83\x55\x11\x82\x29\x11\x05\x0f\x07" } },
    .{ "ExtractAssociatedIconExA", MethodRecord{ .library = "SHELL32", .import = "ExtractAssociatedIconExA", .signature = "\x00\x04\x11\x83\x55\x11\x82\x29\x11\x3d\x0f\x07\x0f\x07" } },
    .{ "ExtractAssociatedIconExW", MethodRecord{ .library = "SHELL32", .import = "ExtractAssociatedIconExW", .signature = "\x00\x04\x11\x83\x55\x11\x82\x29\x11\x05\x0f\x07\x0f\x07" } },
    .{ "ExtractIconA", MethodRecord{ .library = "SHELL32", .import = "ExtractIconA", .signature = "\x00\x03\x11\x83\x55\x11\x82\x29\x11\x3d\x09" } },
    .{ "ExtractIconW", MethodRecord{ .library = "SHELL32", .import = "ExtractIconW", .signature = "\x00\x03\x11\x83\x55\x11\x82\x29\x11\x05\x09" } },
    .{ "SHAppBarMessage", MethodRecord{ .library = "SHELL32", .import = "SHAppBarMessage", .signature = "\x00\x02\x19\x09\x0f\x11\x9e\xf9" } },
    .{ "DoEnvironmentSubstA", MethodRecord{ .library = "SHELL32", .import = "DoEnvironmentSubstA", .signature = "\x00\x02\x09\x11\x3d\x09" } },
    .{ "DoEnvironmentSubstW", MethodRecord{ .library = "SHELL32", .import = "DoEnvironmentSubstW", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "ExtractIconExA", MethodRecord{ .library = "SHELL32", .import = "ExtractIconExA", .signature = "\x00\x05\x09\x11\x3d\x08\x0f\x11\x83\x55\x0f\x11\x83\x55\x09" } },
    .{ "ExtractIconExW", MethodRecord{ .library = "SHELL32", .import = "ExtractIconExW", .signature = "\x00\x05\x09\x11\x05\x08\x0f\x11\x83\x55\x0f\x11\x83\x55\x09" } },
    .{ "SHFileOperationA", MethodRecord{ .library = "SHELL32", .import = "SHFileOperationA", .signature = "\x00\x01\x08\x0f\x11\x9e\xfd" } },
    .{ "SHFileOperationW", MethodRecord{ .library = "SHELL32", .import = "SHFileOperationW", .signature = "\x00\x01\x08\x0f\x11\x9f\x01" } },
    .{ "SHFreeNameMappings", MethodRecord{ .library = "SHELL32", .import = "SHFreeNameMappings", .signature = "\x00\x01\x01\x11\x80\x85" } },
    .{ "ShellExecuteExA", MethodRecord{ .library = "SHELL32", .import = "ShellExecuteExA", .signature = "\x00\x01\x11\x59\x0f\x11\x9f\x05" } },
    .{ "ShellExecuteExW", MethodRecord{ .library = "SHELL32", .import = "ShellExecuteExW", .signature = "\x00\x01\x11\x59\x0f\x11\x9f\x09" } },
    .{ "SHCreateProcessAsUserW", MethodRecord{ .library = "SHELL32", .import = "SHCreateProcessAsUserW", .signature = "\x00\x01\x11\x59\x0f\x11\x9f\x0d" } },
    .{ "SHEvaluateSystemCommandTemplate", MethodRecord{ .library = "SHELL32", .import = "SHEvaluateSystemCommandTemplate", .signature = "\x00\x04\x11\x79\x11\x05\x0f\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "AssocCreateForClasses", MethodRecord{ .library = "SHELL32", .import = "AssocCreateForClasses", .signature = "\x00\x04\x11\x79\x0f\x11\x9f\x11\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHQueryRecycleBinA", MethodRecord{ .library = "SHELL32", .import = "SHQueryRecycleBinA", .signature = "\x00\x02\x11\x79\x11\x3d\x0f\x11\x9f\x15" } },
    .{ "SHQueryRecycleBinW", MethodRecord{ .library = "SHELL32", .import = "SHQueryRecycleBinW", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x9f\x15" } },
    .{ "SHEmptyRecycleBinA", MethodRecord{ .library = "SHELL32", .import = "SHEmptyRecycleBinA", .signature = "\x00\x03\x11\x79\x11\x25\x11\x3d\x09" } },
    .{ "SHEmptyRecycleBinW", MethodRecord{ .library = "SHELL32", .import = "SHEmptyRecycleBinW", .signature = "\x00\x03\x11\x79\x11\x25\x11\x05\x09" } },
    .{ "SHQueryUserNotificationState", MethodRecord{ .library = "SHELL32", .import = "SHQueryUserNotificationState", .signature = "\x00\x01\x11\x79\x0f\x11\x9f\x19" } },
    .{ "Shell_NotifyIconA", MethodRecord{ .library = "SHELL32", .import = "Shell_NotifyIconA", .signature = "\x00\x02\x11\x59\x11\x9f\x1d\x0f\x11\x9f\x21" } },
    .{ "Shell_NotifyIconW", MethodRecord{ .library = "SHELL32", .import = "Shell_NotifyIconW", .signature = "\x00\x02\x11\x59\x11\x9f\x1d\x0f\x11\x9f\x25" } },
    .{ "Shell_NotifyIconGetRect", MethodRecord{ .library = "SHELL32", .import = "Shell_NotifyIconGetRect", .signature = "\x00\x02\x11\x79\x0f\x11\x9f\x29\x0f\x11\x83\x89" } },
    .{ "SHGetFileInfoA", MethodRecord{ .library = "SHELL32", .import = "SHGetFileInfoA", .signature = "\x00\x05\x19\x11\x3d\x11\x8b\xad\x0f\x11\x9f\x2d\x09\x11\x9f\x31" } },
    .{ "SHGetFileInfoW", MethodRecord{ .library = "SHELL32", .import = "SHGetFileInfoW", .signature = "\x00\x05\x19\x11\x05\x11\x8b\xad\x0f\x11\x9f\x35\x09\x11\x9f\x31" } },
    .{ "SHGetStockIconInfo", MethodRecord{ .library = "SHELL32", .import = "SHGetStockIconInfo", .signature = "\x00\x03\x11\x79\x11\x9f\x39\x11\x9f\x3d\x0f\x11\x9f\x41" } },
    .{ "SHGetDiskFreeSpaceExA", MethodRecord{ .library = "SHELL32", .import = "SHGetDiskFreeSpaceExA", .signature = "\x00\x04\x11\x59\x11\x3d\x0f\x0b\x0f\x0b\x0f\x0b" } },
    .{ "SHGetDiskFreeSpaceExW", MethodRecord{ .library = "SHELL32", .import = "SHGetDiskFreeSpaceExW", .signature = "\x00\x04\x11\x59\x11\x05\x0f\x0b\x0f\x0b\x0f\x0b" } },
    .{ "SHGetNewLinkInfoA", MethodRecord{ .library = "SHELL32", .import = "SHGetNewLinkInfoA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x11\x3d\x0f\x11\x59\x09" } },
    .{ "SHGetNewLinkInfoW", MethodRecord{ .library = "SHELL32", .import = "SHGetNewLinkInfoW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x11\x05\x0f\x11\x59\x09" } },
    .{ "SHInvokePrinterCommandA", MethodRecord{ .library = "SHELL32", .import = "SHInvokePrinterCommandA", .signature = "\x00\x05\x11\x59\x11\x25\x09\x11\x3d\x11\x3d\x11\x59" } },
    .{ "SHInvokePrinterCommandW", MethodRecord{ .library = "SHELL32", .import = "SHInvokePrinterCommandW", .signature = "\x00\x05\x11\x59\x11\x25\x09\x11\x05\x11\x05\x11\x59" } },
    .{ "SHLoadNonloadedIconOverlayIdentifiers", MethodRecord{ .library = "SHELL32", .import = "SHLoadNonloadedIconOverlayIdentifiers", .signature = "\x00\x00\x11\x79" } },
    .{ "SHIsFileAvailableOffline", MethodRecord{ .library = "SHELL32", .import = "SHIsFileAvailableOffline", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x09" } },
    .{ "SHSetLocalizedName", MethodRecord{ .library = "SHELL32", .import = "SHSetLocalizedName", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x08" } },
    .{ "SHRemoveLocalizedName", MethodRecord{ .library = "SHELL32", .import = "SHRemoveLocalizedName", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "SHGetLocalizedName", MethodRecord{ .library = "SHELL32", .import = "SHGetLocalizedName", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x09\x0f\x08" } },
    .{ "ShellMessageBoxA", MethodRecord{ .library = "SHLWAPI", .import = "ShellMessageBoxA", .signature = "\x05\x05\x08\x11\x82\x29\x11\x25\x11\x3d\x11\x3d\x11\x89\x29" } },
    .{ "ShellMessageBoxW", MethodRecord{ .library = "SHLWAPI", .import = "ShellMessageBoxW", .signature = "\x05\x05\x08\x11\x82\x29\x11\x25\x11\x05\x11\x05\x11\x89\x29" } },
    .{ "IsLFNDriveA", MethodRecord{ .library = "SHELL32", .import = "IsLFNDriveA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "IsLFNDriveW", MethodRecord{ .library = "SHELL32", .import = "IsLFNDriveW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "SHEnumerateUnreadMailAccountsW", MethodRecord{ .library = "SHELL32", .import = "SHEnumerateUnreadMailAccountsW", .signature = "\x00\x04\x11\x79\x11\x55\x09\x11\x05\x08" } },
    .{ "SHGetUnreadMailCountW", MethodRecord{ .library = "SHELL32", .import = "SHGetUnreadMailCountW", .signature = "\x00\x06\x11\x79\x11\x55\x11\x05\x0f\x09\x0f\x11\x80\x9d\x11\x05\x08" } },
    .{ "SHSetUnreadMailCountW", MethodRecord{ .library = "SHELL32", .import = "SHSetUnreadMailCountW", .signature = "\x00\x03\x11\x79\x11\x05\x09\x11\x05" } },
    .{ "SHTestTokenMembership", MethodRecord{ .library = "SHELL32", .import = "SHTestTokenMembership", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "SHGetImageList", MethodRecord{ .library = "SHELL32", .import = "SHGetImageList", .signature = "\x00\x03\x11\x79\x08\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "InitNetworkAddressControl", MethodRecord{ .library = "SHELL32", .import = "InitNetworkAddressControl", .signature = "\x00\x00\x11\x59" } },
    .{ "SHGetDriveMedia", MethodRecord{ .library = "SHELL32", .import = "SHGetDriveMedia", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x09" } },
    .{ "StrChrA", MethodRecord{ .library = "SHLWAPI", .import = "StrChrA", .signature = "\x00\x02\x11\x3d\x11\x3d\x07" } },
    .{ "StrChrW", MethodRecord{ .library = "SHLWAPI", .import = "StrChrW", .signature = "\x00\x02\x11\x05\x11\x05\x03" } },
    .{ "StrChrIA", MethodRecord{ .library = "SHLWAPI", .import = "StrChrIA", .signature = "\x00\x02\x11\x3d\x11\x3d\x07" } },
    .{ "StrChrIW", MethodRecord{ .library = "SHLWAPI", .import = "StrChrIW", .signature = "\x00\x02\x11\x05\x11\x05\x03" } },
    .{ "StrChrNW", MethodRecord{ .library = "SHLWAPI", .import = "StrChrNW", .signature = "\x00\x03\x11\x05\x11\x05\x03\x09" } },
    .{ "StrChrNIW", MethodRecord{ .library = "SHLWAPI", .import = "StrChrNIW", .signature = "\x00\x03\x11\x05\x11\x05\x03\x09" } },
    .{ "StrCmpNA", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpNA", .signature = "\x00\x03\x08\x11\x3d\x11\x3d\x08" } },
    .{ "StrCmpNW", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpNW", .signature = "\x00\x03\x08\x11\x05\x11\x05\x08" } },
    .{ "StrCmpNIA", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpNIA", .signature = "\x00\x03\x08\x11\x3d\x11\x3d\x08" } },
    .{ "StrCmpNIW", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpNIW", .signature = "\x00\x03\x08\x11\x05\x11\x05\x08" } },
    .{ "StrCSpnA", MethodRecord{ .library = "SHLWAPI", .import = "StrCSpnA", .signature = "\x00\x02\x08\x11\x3d\x11\x3d" } },
    .{ "StrCSpnW", MethodRecord{ .library = "SHLWAPI", .import = "StrCSpnW", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
    .{ "StrCSpnIA", MethodRecord{ .library = "SHLWAPI", .import = "StrCSpnIA", .signature = "\x00\x02\x08\x11\x3d\x11\x3d" } },
    .{ "StrCSpnIW", MethodRecord{ .library = "SHLWAPI", .import = "StrCSpnIW", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
    .{ "StrDupA", MethodRecord{ .library = "SHLWAPI", .import = "StrDupA", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "StrDupW", MethodRecord{ .library = "SHLWAPI", .import = "StrDupW", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "StrFormatByteSizeEx", MethodRecord{ .library = "SHLWAPI", .import = "StrFormatByteSizeEx", .signature = "\x00\x04\x11\x79\x0b\x11\x9f\x45\x11\x05\x09" } },
    .{ "StrFormatByteSizeA", MethodRecord{ .library = "SHLWAPI", .import = "StrFormatByteSizeA", .signature = "\x00\x03\x11\x3d\x09\x11\x3d\x09" } },
    .{ "StrFormatByteSize64A", MethodRecord{ .library = "SHLWAPI", .import = "StrFormatByteSize64A", .signature = "\x00\x03\x11\x3d\x0a\x11\x3d\x09" } },
    .{ "StrFormatByteSizeW", MethodRecord{ .library = "SHLWAPI", .import = "StrFormatByteSizeW", .signature = "\x00\x03\x11\x05\x0a\x11\x05\x09" } },
    .{ "StrFormatKBSizeW", MethodRecord{ .library = "SHLWAPI", .import = "StrFormatKBSizeW", .signature = "\x00\x03\x11\x05\x0a\x11\x05\x09" } },
    .{ "StrFormatKBSizeA", MethodRecord{ .library = "SHLWAPI", .import = "StrFormatKBSizeA", .signature = "\x00\x03\x11\x3d\x0a\x11\x3d\x09" } },
    .{ "StrFromTimeIntervalA", MethodRecord{ .library = "SHLWAPI", .import = "StrFromTimeIntervalA", .signature = "\x00\x04\x08\x11\x3d\x09\x09\x08" } },
    .{ "StrFromTimeIntervalW", MethodRecord{ .library = "SHLWAPI", .import = "StrFromTimeIntervalW", .signature = "\x00\x04\x08\x11\x05\x09\x09\x08" } },
    .{ "StrIsIntlEqualA", MethodRecord{ .library = "SHLWAPI", .import = "StrIsIntlEqualA", .signature = "\x00\x04\x11\x59\x11\x59\x11\x3d\x11\x3d\x08" } },
    .{ "StrIsIntlEqualW", MethodRecord{ .library = "SHLWAPI", .import = "StrIsIntlEqualW", .signature = "\x00\x04\x11\x59\x11\x59\x11\x05\x11\x05\x08" } },
    .{ "StrNCatA", MethodRecord{ .library = "SHLWAPI", .import = "StrNCatA", .signature = "\x00\x03\x11\x3d\x11\x3d\x11\x3d\x08" } },
    .{ "StrNCatW", MethodRecord{ .library = "SHLWAPI", .import = "StrNCatW", .signature = "\x00\x03\x11\x05\x11\x05\x11\x05\x08" } },
    .{ "StrPBrkA", MethodRecord{ .library = "SHLWAPI", .import = "StrPBrkA", .signature = "\x00\x02\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "StrPBrkW", MethodRecord{ .library = "SHLWAPI", .import = "StrPBrkW", .signature = "\x00\x02\x11\x05\x11\x05\x11\x05" } },
    .{ "StrRChrA", MethodRecord{ .library = "SHLWAPI", .import = "StrRChrA", .signature = "\x00\x03\x11\x3d\x11\x3d\x11\x3d\x07" } },
    .{ "StrRChrW", MethodRecord{ .library = "SHLWAPI", .import = "StrRChrW", .signature = "\x00\x03\x11\x05\x11\x05\x11\x05\x03" } },
    .{ "StrRChrIA", MethodRecord{ .library = "SHLWAPI", .import = "StrRChrIA", .signature = "\x00\x03\x11\x3d\x11\x3d\x11\x3d\x07" } },
    .{ "StrRChrIW", MethodRecord{ .library = "SHLWAPI", .import = "StrRChrIW", .signature = "\x00\x03\x11\x05\x11\x05\x11\x05\x03" } },
    .{ "StrRStrIA", MethodRecord{ .library = "SHLWAPI", .import = "StrRStrIA", .signature = "\x00\x03\x11\x3d\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "StrRStrIW", MethodRecord{ .library = "SHLWAPI", .import = "StrRStrIW", .signature = "\x00\x03\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "StrSpnA", MethodRecord{ .library = "SHLWAPI", .import = "StrSpnA", .signature = "\x00\x02\x08\x11\x3d\x11\x3d" } },
    .{ "StrSpnW", MethodRecord{ .library = "SHLWAPI", .import = "StrSpnW", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
    .{ "StrStrA", MethodRecord{ .library = "SHLWAPI", .import = "StrStrA", .signature = "\x00\x02\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "StrStrW", MethodRecord{ .library = "SHLWAPI", .import = "StrStrW", .signature = "\x00\x02\x11\x05\x11\x05\x11\x05" } },
    .{ "StrStrIA", MethodRecord{ .library = "SHLWAPI", .import = "StrStrIA", .signature = "\x00\x02\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "StrStrIW", MethodRecord{ .library = "SHLWAPI", .import = "StrStrIW", .signature = "\x00\x02\x11\x05\x11\x05\x11\x05" } },
    .{ "StrStrNW", MethodRecord{ .library = "SHLWAPI", .import = "StrStrNW", .signature = "\x00\x03\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "StrStrNIW", MethodRecord{ .library = "SHLWAPI", .import = "StrStrNIW", .signature = "\x00\x03\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "StrToIntA", MethodRecord{ .library = "SHLWAPI", .import = "StrToIntA", .signature = "\x00\x01\x08\x11\x3d" } },
    .{ "StrToIntW", MethodRecord{ .library = "SHLWAPI", .import = "StrToIntW", .signature = "\x00\x01\x08\x11\x05" } },
    .{ "StrToIntExA", MethodRecord{ .library = "SHLWAPI", .import = "StrToIntExA", .signature = "\x00\x03\x11\x59\x11\x3d\x08\x0f\x08" } },
    .{ "StrToIntExW", MethodRecord{ .library = "SHLWAPI", .import = "StrToIntExW", .signature = "\x00\x03\x11\x59\x11\x05\x08\x0f\x08" } },
    .{ "StrToInt64ExA", MethodRecord{ .library = "SHLWAPI", .import = "StrToInt64ExA", .signature = "\x00\x03\x11\x59\x11\x3d\x08\x0f\x0a" } },
    .{ "StrToInt64ExW", MethodRecord{ .library = "SHLWAPI", .import = "StrToInt64ExW", .signature = "\x00\x03\x11\x59\x11\x05\x08\x0f\x0a" } },
    .{ "StrTrimA", MethodRecord{ .library = "SHLWAPI", .import = "StrTrimA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "StrTrimW", MethodRecord{ .library = "SHLWAPI", .import = "StrTrimW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "StrCatW", MethodRecord{ .library = "SHLWAPI", .import = "StrCatW", .signature = "\x00\x02\x11\x05\x11\x05\x11\x05" } },
    .{ "StrCmpW", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpW", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
    .{ "StrCmpIW", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpIW", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
    .{ "StrCpyW", MethodRecord{ .library = "SHLWAPI", .import = "StrCpyW", .signature = "\x00\x02\x11\x05\x11\x05\x11\x05" } },
    .{ "StrCpyNW", MethodRecord{ .library = "SHLWAPI", .import = "StrCpyNW", .signature = "\x00\x03\x11\x05\x11\x05\x11\x05\x08" } },
    .{ "StrCatBuffW", MethodRecord{ .library = "SHLWAPI", .import = "StrCatBuffW", .signature = "\x00\x03\x11\x05\x11\x05\x11\x05\x08" } },
    .{ "StrCatBuffA", MethodRecord{ .library = "SHLWAPI", .import = "StrCatBuffA", .signature = "\x00\x03\x11\x3d\x11\x3d\x11\x3d\x08" } },
    .{ "ChrCmpIA", MethodRecord{ .library = "SHLWAPI", .import = "ChrCmpIA", .signature = "\x00\x02\x11\x59\x07\x07" } },
    .{ "ChrCmpIW", MethodRecord{ .library = "SHLWAPI", .import = "ChrCmpIW", .signature = "\x00\x02\x11\x59\x03\x03" } },
    .{ "wvnsprintfA", MethodRecord{ .library = "SHLWAPI", .import = "wvnsprintfA", .signature = "\x00\x04\x08\x11\x3d\x08\x11\x3d\x0f\x04" } },
    .{ "wvnsprintfW", MethodRecord{ .library = "SHLWAPI", .import = "wvnsprintfW", .signature = "\x00\x04\x08\x11\x05\x08\x11\x05\x0f\x04" } },
    .{ "wnsprintfA", MethodRecord{ .library = "SHLWAPI", .import = "wnsprintfA", .signature = "\x05\x03\x08\x11\x3d\x08\x11\x3d" } },
    .{ "wnsprintfW", MethodRecord{ .library = "SHLWAPI", .import = "wnsprintfW", .signature = "\x05\x03\x08\x11\x05\x08\x11\x05" } },
    .{ "StrRetToStrA", MethodRecord{ .library = "SHLWAPI", .import = "StrRetToStrA", .signature = "\x00\x03\x11\x79\x0f\x11\x9e\x31\x0f\x11\x9e\x35\x0f\x11\x3d" } },
    .{ "StrRetToStrW", MethodRecord{ .library = "SHLWAPI", .import = "StrRetToStrW", .signature = "\x00\x03\x11\x79\x0f\x11\x9e\x31\x0f\x11\x9e\x35\x0f\x11\x05" } },
    .{ "StrRetToBufA", MethodRecord{ .library = "SHLWAPI", .import = "StrRetToBufA", .signature = "\x00\x04\x11\x79\x0f\x11\x9e\x31\x0f\x11\x9e\x35\x11\x3d\x09" } },
    .{ "StrRetToBufW", MethodRecord{ .library = "SHLWAPI", .import = "StrRetToBufW", .signature = "\x00\x04\x11\x79\x0f\x11\x9e\x31\x0f\x11\x9e\x35\x11\x05\x09" } },
    .{ "SHStrDupA", MethodRecord{ .library = "SHLWAPI", .import = "SHStrDupA", .signature = "\x00\x02\x11\x79\x11\x3d\x0f\x11\x05" } },
    .{ "SHStrDupW", MethodRecord{ .library = "SHLWAPI", .import = "SHStrDupW", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "StrCmpLogicalW", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpLogicalW", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
    .{ "StrCatChainW", MethodRecord{ .library = "SHLWAPI", .import = "StrCatChainW", .signature = "\x00\x04\x09\x11\x05\x09\x09\x11\x05" } },
    .{ "StrRetToBSTR", MethodRecord{ .library = "SHLWAPI", .import = "StrRetToBSTR", .signature = "\x00\x03\x11\x79\x0f\x11\x9e\x31\x0f\x11\x9e\x35\x0f\x11\x8d\x35" } },
    .{ "SHLoadIndirectString", MethodRecord{ .library = "SHLWAPI", .import = "SHLoadIndirectString", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x09\x0f\x0f\x01" } },
    .{ "IsCharSpaceA", MethodRecord{ .library = "SHLWAPI", .import = "IsCharSpaceA", .signature = "\x00\x01\x11\x59\x11\x8d\x5d" } },
    .{ "IsCharSpaceW", MethodRecord{ .library = "SHLWAPI", .import = "IsCharSpaceW", .signature = "\x00\x01\x11\x59\x03" } },
    .{ "StrCmpCA", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpCA", .signature = "\x00\x02\x08\x11\x3d\x11\x3d" } },
    .{ "StrCmpCW", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpCW", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
    .{ "StrCmpICA", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpICA", .signature = "\x00\x02\x08\x11\x3d\x11\x3d" } },
    .{ "StrCmpICW", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpICW", .signature = "\x00\x02\x08\x11\x05\x11\x05" } },
    .{ "StrCmpNCA", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpNCA", .signature = "\x00\x03\x08\x11\x3d\x11\x3d\x08" } },
    .{ "StrCmpNCW", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpNCW", .signature = "\x00\x03\x08\x11\x05\x11\x05\x08" } },
    .{ "StrCmpNICA", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpNICA", .signature = "\x00\x03\x08\x11\x3d\x11\x3d\x08" } },
    .{ "StrCmpNICW", MethodRecord{ .library = "SHLWAPI", .import = "StrCmpNICW", .signature = "\x00\x03\x08\x11\x05\x11\x05\x08" } },
    .{ "IntlStrEqWorkerA", MethodRecord{ .library = "SHLWAPI", .import = "IntlStrEqWorkerA", .signature = "\x00\x04\x11\x59\x11\x59\x11\x3d\x11\x3d\x08" } },
    .{ "IntlStrEqWorkerW", MethodRecord{ .library = "SHLWAPI", .import = "IntlStrEqWorkerW", .signature = "\x00\x04\x11\x59\x11\x59\x11\x05\x11\x05\x08" } },
    .{ "PathAddBackslashA", MethodRecord{ .library = "SHLWAPI", .import = "PathAddBackslashA", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "PathAddBackslashW", MethodRecord{ .library = "SHLWAPI", .import = "PathAddBackslashW", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "PathAddExtensionA", MethodRecord{ .library = "SHLWAPI", .import = "PathAddExtensionA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "PathAddExtensionW", MethodRecord{ .library = "SHLWAPI", .import = "PathAddExtensionW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "PathAppendA", MethodRecord{ .library = "SHLWAPI", .import = "PathAppendA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "PathAppendW", MethodRecord{ .library = "SHLWAPI", .import = "PathAppendW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "PathBuildRootA", MethodRecord{ .library = "SHLWAPI", .import = "PathBuildRootA", .signature = "\x00\x02\x11\x3d\x11\x3d\x08" } },
    .{ "PathBuildRootW", MethodRecord{ .library = "SHLWAPI", .import = "PathBuildRootW", .signature = "\x00\x02\x11\x05\x11\x05\x08" } },
    .{ "PathCanonicalizeA", MethodRecord{ .library = "SHLWAPI", .import = "PathCanonicalizeA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "PathCanonicalizeW", MethodRecord{ .library = "SHLWAPI", .import = "PathCanonicalizeW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "PathCombineA", MethodRecord{ .library = "SHLWAPI", .import = "PathCombineA", .signature = "\x00\x03\x11\x3d\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "PathCombineW", MethodRecord{ .library = "SHLWAPI", .import = "PathCombineW", .signature = "\x00\x03\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "PathCompactPathA", MethodRecord{ .library = "SHLWAPI", .import = "PathCompactPathA", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x11\x3d\x09" } },
    .{ "PathCompactPathW", MethodRecord{ .library = "SHLWAPI", .import = "PathCompactPathW", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x11\x05\x09" } },
    .{ "PathCompactPathExA", MethodRecord{ .library = "SHLWAPI", .import = "PathCompactPathExA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x09\x09" } },
    .{ "PathCompactPathExW", MethodRecord{ .library = "SHLWAPI", .import = "PathCompactPathExW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x09\x09" } },
    .{ "PathCommonPrefixA", MethodRecord{ .library = "SHLWAPI", .import = "PathCommonPrefixA", .signature = "\x00\x03\x08\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "PathCommonPrefixW", MethodRecord{ .library = "SHLWAPI", .import = "PathCommonPrefixW", .signature = "\x00\x03\x08\x11\x05\x11\x05\x11\x05" } },
    .{ "PathFileExistsA", MethodRecord{ .library = "SHLWAPI", .import = "PathFileExistsA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathFileExistsW", MethodRecord{ .library = "SHLWAPI", .import = "PathFileExistsW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathFindExtensionA", MethodRecord{ .library = "SHLWAPI", .import = "PathFindExtensionA", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "PathFindExtensionW", MethodRecord{ .library = "SHLWAPI", .import = "PathFindExtensionW", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "PathFindFileNameA", MethodRecord{ .library = "SHLWAPI", .import = "PathFindFileNameA", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "PathFindFileNameW", MethodRecord{ .library = "SHLWAPI", .import = "PathFindFileNameW", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "PathFindNextComponentA", MethodRecord{ .library = "SHLWAPI", .import = "PathFindNextComponentA", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "PathFindNextComponentW", MethodRecord{ .library = "SHLWAPI", .import = "PathFindNextComponentW", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "PathFindOnPathA", MethodRecord{ .library = "SHLWAPI", .import = "PathFindOnPathA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x0f\x04" } },
    .{ "PathFindOnPathW", MethodRecord{ .library = "SHLWAPI", .import = "PathFindOnPathW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x0f\x07" } },
    .{ "PathFindSuffixArrayA", MethodRecord{ .library = "SHLWAPI", .import = "PathFindSuffixArrayA", .signature = "\x00\x03\x11\x3d\x11\x3d\x0f\x11\x3d\x08" } },
    .{ "PathFindSuffixArrayW", MethodRecord{ .library = "SHLWAPI", .import = "PathFindSuffixArrayW", .signature = "\x00\x03\x11\x05\x11\x05\x0f\x11\x05\x08" } },
    .{ "PathGetArgsA", MethodRecord{ .library = "SHLWAPI", .import = "PathGetArgsA", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "PathGetArgsW", MethodRecord{ .library = "SHLWAPI", .import = "PathGetArgsW", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "PathIsLFNFileSpecA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsLFNFileSpecA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathIsLFNFileSpecW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsLFNFileSpecW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathGetCharTypeA", MethodRecord{ .library = "SHLWAPI", .import = "PathGetCharTypeA", .signature = "\x00\x01\x09\x05" } },
    .{ "PathGetCharTypeW", MethodRecord{ .library = "SHLWAPI", .import = "PathGetCharTypeW", .signature = "\x00\x01\x09\x03" } },
    .{ "PathGetDriveNumberA", MethodRecord{ .library = "SHLWAPI", .import = "PathGetDriveNumberA", .signature = "\x00\x01\x08\x11\x3d" } },
    .{ "PathGetDriveNumberW", MethodRecord{ .library = "SHLWAPI", .import = "PathGetDriveNumberW", .signature = "\x00\x01\x08\x11\x05" } },
    .{ "PathIsDirectoryA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsDirectoryA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathIsDirectoryW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsDirectoryW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathIsDirectoryEmptyA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsDirectoryEmptyA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathIsDirectoryEmptyW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsDirectoryEmptyW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathIsFileSpecA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsFileSpecA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathIsFileSpecW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsFileSpecW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathIsPrefixA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsPrefixA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "PathIsPrefixW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsPrefixW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "PathIsRelativeA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsRelativeA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathIsRelativeW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsRelativeW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathIsRootA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsRootA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathIsRootW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsRootW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathIsSameRootA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsSameRootA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "PathIsSameRootW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsSameRootW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "PathIsUNCA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsUNCA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathIsUNCW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsUNCW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathIsNetworkPathA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsNetworkPathA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathIsNetworkPathW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsNetworkPathW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathIsUNCServerA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsUNCServerA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathIsUNCServerW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsUNCServerW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathIsUNCServerShareA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsUNCServerShareA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathIsUNCServerShareW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsUNCServerShareW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathIsContentTypeA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsContentTypeA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "PathIsContentTypeW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsContentTypeW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "PathIsURLA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsURLA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathIsURLW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsURLW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathMakePrettyA", MethodRecord{ .library = "SHLWAPI", .import = "PathMakePrettyA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathMakePrettyW", MethodRecord{ .library = "SHLWAPI", .import = "PathMakePrettyW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathMatchSpecA", MethodRecord{ .library = "SHLWAPI", .import = "PathMatchSpecA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "PathMatchSpecW", MethodRecord{ .library = "SHLWAPI", .import = "PathMatchSpecW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "PathMatchSpecExA", MethodRecord{ .library = "SHLWAPI", .import = "PathMatchSpecExA", .signature = "\x00\x03\x11\x79\x11\x3d\x11\x3d\x09" } },
    .{ "PathMatchSpecExW", MethodRecord{ .library = "SHLWAPI", .import = "PathMatchSpecExW", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x09" } },
    .{ "PathParseIconLocationA", MethodRecord{ .library = "SHLWAPI", .import = "PathParseIconLocationA", .signature = "\x00\x01\x08\x11\x3d" } },
    .{ "PathParseIconLocationW", MethodRecord{ .library = "SHLWAPI", .import = "PathParseIconLocationW", .signature = "\x00\x01\x08\x11\x05" } },
    .{ "PathQuoteSpacesA", MethodRecord{ .library = "SHLWAPI", .import = "PathQuoteSpacesA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathQuoteSpacesW", MethodRecord{ .library = "SHLWAPI", .import = "PathQuoteSpacesW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathRelativePathToA", MethodRecord{ .library = "SHLWAPI", .import = "PathRelativePathToA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x09\x11\x3d\x09" } },
    .{ "PathRelativePathToW", MethodRecord{ .library = "SHLWAPI", .import = "PathRelativePathToW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x09\x11\x05\x09" } },
    .{ "PathRemoveArgsA", MethodRecord{ .library = "SHLWAPI", .import = "PathRemoveArgsA", .signature = "\x00\x01\x01\x11\x3d" } },
    .{ "PathRemoveArgsW", MethodRecord{ .library = "SHLWAPI", .import = "PathRemoveArgsW", .signature = "\x00\x01\x01\x11\x05" } },
    .{ "PathRemoveBackslashA", MethodRecord{ .library = "SHLWAPI", .import = "PathRemoveBackslashA", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "PathRemoveBackslashW", MethodRecord{ .library = "SHLWAPI", .import = "PathRemoveBackslashW", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "PathRemoveBlanksA", MethodRecord{ .library = "SHLWAPI", .import = "PathRemoveBlanksA", .signature = "\x00\x01\x01\x11\x3d" } },
    .{ "PathRemoveBlanksW", MethodRecord{ .library = "SHLWAPI", .import = "PathRemoveBlanksW", .signature = "\x00\x01\x01\x11\x05" } },
    .{ "PathRemoveExtensionA", MethodRecord{ .library = "SHLWAPI", .import = "PathRemoveExtensionA", .signature = "\x00\x01\x01\x11\x3d" } },
    .{ "PathRemoveExtensionW", MethodRecord{ .library = "SHLWAPI", .import = "PathRemoveExtensionW", .signature = "\x00\x01\x01\x11\x05" } },
    .{ "PathRemoveFileSpecA", MethodRecord{ .library = "SHLWAPI", .import = "PathRemoveFileSpecA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathRemoveFileSpecW", MethodRecord{ .library = "SHLWAPI", .import = "PathRemoveFileSpecW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathRenameExtensionA", MethodRecord{ .library = "SHLWAPI", .import = "PathRenameExtensionA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x3d" } },
    .{ "PathRenameExtensionW", MethodRecord{ .library = "SHLWAPI", .import = "PathRenameExtensionW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x05" } },
    .{ "PathSearchAndQualifyA", MethodRecord{ .library = "SHLWAPI", .import = "PathSearchAndQualifyA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x09" } },
    .{ "PathSearchAndQualifyW", MethodRecord{ .library = "SHLWAPI", .import = "PathSearchAndQualifyW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x09" } },
    .{ "PathSetDlgItemPathA", MethodRecord{ .library = "SHLWAPI", .import = "PathSetDlgItemPathA", .signature = "\x00\x03\x01\x11\x25\x08\x11\x3d" } },
    .{ "PathSetDlgItemPathW", MethodRecord{ .library = "SHLWAPI", .import = "PathSetDlgItemPathW", .signature = "\x00\x03\x01\x11\x25\x08\x11\x05" } },
    .{ "PathSkipRootA", MethodRecord{ .library = "SHLWAPI", .import = "PathSkipRootA", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "PathSkipRootW", MethodRecord{ .library = "SHLWAPI", .import = "PathSkipRootW", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "PathStripPathA", MethodRecord{ .library = "SHLWAPI", .import = "PathStripPathA", .signature = "\x00\x01\x01\x11\x3d" } },
    .{ "PathStripPathW", MethodRecord{ .library = "SHLWAPI", .import = "PathStripPathW", .signature = "\x00\x01\x01\x11\x05" } },
    .{ "PathStripToRootA", MethodRecord{ .library = "SHLWAPI", .import = "PathStripToRootA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathStripToRootW", MethodRecord{ .library = "SHLWAPI", .import = "PathStripToRootW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathUnquoteSpacesA", MethodRecord{ .library = "SHLWAPI", .import = "PathUnquoteSpacesA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathUnquoteSpacesW", MethodRecord{ .library = "SHLWAPI", .import = "PathUnquoteSpacesW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathMakeSystemFolderA", MethodRecord{ .library = "SHLWAPI", .import = "PathMakeSystemFolderA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathMakeSystemFolderW", MethodRecord{ .library = "SHLWAPI", .import = "PathMakeSystemFolderW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathUnmakeSystemFolderA", MethodRecord{ .library = "SHLWAPI", .import = "PathUnmakeSystemFolderA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "PathUnmakeSystemFolderW", MethodRecord{ .library = "SHLWAPI", .import = "PathUnmakeSystemFolderW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathIsSystemFolderA", MethodRecord{ .library = "SHLWAPI", .import = "PathIsSystemFolderA", .signature = "\x00\x02\x11\x59\x11\x3d\x09" } },
    .{ "PathIsSystemFolderW", MethodRecord{ .library = "SHLWAPI", .import = "PathIsSystemFolderW", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "PathUndecorateA", MethodRecord{ .library = "SHLWAPI", .import = "PathUndecorateA", .signature = "\x00\x01\x01\x11\x3d" } },
    .{ "PathUndecorateW", MethodRecord{ .library = "SHLWAPI", .import = "PathUndecorateW", .signature = "\x00\x01\x01\x11\x05" } },
    .{ "PathUnExpandEnvStringsA", MethodRecord{ .library = "SHLWAPI", .import = "PathUnExpandEnvStringsA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x09" } },
    .{ "PathUnExpandEnvStringsW", MethodRecord{ .library = "SHLWAPI", .import = "PathUnExpandEnvStringsW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x09" } },
    .{ "UrlCompareA", MethodRecord{ .library = "SHLWAPI", .import = "UrlCompareA", .signature = "\x00\x03\x08\x11\x3d\x11\x3d\x11\x59" } },
    .{ "UrlCompareW", MethodRecord{ .library = "SHLWAPI", .import = "UrlCompareW", .signature = "\x00\x03\x08\x11\x05\x11\x05\x11\x59" } },
    .{ "UrlCombineA", MethodRecord{ .library = "SHLWAPI", .import = "UrlCombineA", .signature = "\x00\x05\x11\x79\x11\x3d\x11\x3d\x11\x3d\x0f\x09\x09" } },
    .{ "UrlCombineW", MethodRecord{ .library = "SHLWAPI", .import = "UrlCombineW", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x11\x05\x0f\x09\x09" } },
    .{ "UrlCanonicalizeA", MethodRecord{ .library = "SHLWAPI", .import = "UrlCanonicalizeA", .signature = "\x00\x04\x11\x79\x11\x3d\x11\x3d\x0f\x09\x09" } },
    .{ "UrlCanonicalizeW", MethodRecord{ .library = "SHLWAPI", .import = "UrlCanonicalizeW", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x0f\x09\x09" } },
    .{ "UrlIsOpaqueA", MethodRecord{ .library = "SHLWAPI", .import = "UrlIsOpaqueA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "UrlIsOpaqueW", MethodRecord{ .library = "SHLWAPI", .import = "UrlIsOpaqueW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "UrlIsNoHistoryA", MethodRecord{ .library = "SHLWAPI", .import = "UrlIsNoHistoryA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "UrlIsNoHistoryW", MethodRecord{ .library = "SHLWAPI", .import = "UrlIsNoHistoryW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "UrlIsA", MethodRecord{ .library = "SHLWAPI", .import = "UrlIsA", .signature = "\x00\x02\x11\x59\x11\x3d\x11\x9f\x49" } },
    .{ "UrlIsW", MethodRecord{ .library = "SHLWAPI", .import = "UrlIsW", .signature = "\x00\x02\x11\x59\x11\x05\x11\x9f\x49" } },
    .{ "UrlGetLocationA", MethodRecord{ .library = "SHLWAPI", .import = "UrlGetLocationA", .signature = "\x00\x01\x11\x3d\x11\x3d" } },
    .{ "UrlGetLocationW", MethodRecord{ .library = "SHLWAPI", .import = "UrlGetLocationW", .signature = "\x00\x01\x11\x05\x11\x05" } },
    .{ "UrlUnescapeA", MethodRecord{ .library = "SHLWAPI", .import = "UrlUnescapeA", .signature = "\x00\x04\x11\x79\x11\x3d\x11\x3d\x0f\x09\x09" } },
    .{ "UrlUnescapeW", MethodRecord{ .library = "SHLWAPI", .import = "UrlUnescapeW", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x0f\x09\x09" } },
    .{ "UrlEscapeA", MethodRecord{ .library = "SHLWAPI", .import = "UrlEscapeA", .signature = "\x00\x04\x11\x79\x11\x3d\x11\x3d\x0f\x09\x09" } },
    .{ "UrlEscapeW", MethodRecord{ .library = "SHLWAPI", .import = "UrlEscapeW", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x0f\x09\x09" } },
    .{ "UrlCreateFromPathA", MethodRecord{ .library = "SHLWAPI", .import = "UrlCreateFromPathA", .signature = "\x00\x04\x11\x79\x11\x3d\x11\x3d\x0f\x09\x09" } },
    .{ "UrlCreateFromPathW", MethodRecord{ .library = "SHLWAPI", .import = "UrlCreateFromPathW", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x0f\x09\x09" } },
    .{ "PathCreateFromUrlA", MethodRecord{ .library = "SHLWAPI", .import = "PathCreateFromUrlA", .signature = "\x00\x04\x11\x79\x11\x3d\x11\x3d\x0f\x09\x09" } },
    .{ "PathCreateFromUrlW", MethodRecord{ .library = "SHLWAPI", .import = "PathCreateFromUrlW", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x0f\x09\x09" } },
    .{ "PathCreateFromUrlAlloc", MethodRecord{ .library = "SHLWAPI", .import = "PathCreateFromUrlAlloc", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\x05\x09" } },
    .{ "UrlHashA", MethodRecord{ .library = "SHLWAPI", .import = "UrlHashA", .signature = "\x00\x03\x11\x79\x11\x3d\x0f\x05\x09" } },
    .{ "UrlHashW", MethodRecord{ .library = "SHLWAPI", .import = "UrlHashW", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x05\x09" } },
    .{ "UrlGetPartW", MethodRecord{ .library = "SHLWAPI", .import = "UrlGetPartW", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x0f\x09\x09\x09" } },
    .{ "UrlGetPartA", MethodRecord{ .library = "SHLWAPI", .import = "UrlGetPartA", .signature = "\x00\x05\x11\x79\x11\x3d\x11\x3d\x0f\x09\x09\x09" } },
    .{ "UrlApplySchemeA", MethodRecord{ .library = "SHLWAPI", .import = "UrlApplySchemeA", .signature = "\x00\x04\x11\x79\x11\x3d\x11\x3d\x0f\x09\x09" } },
    .{ "UrlApplySchemeW", MethodRecord{ .library = "SHLWAPI", .import = "UrlApplySchemeW", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x0f\x09\x09" } },
    .{ "HashData", MethodRecord{ .library = "SHLWAPI", .import = "HashData", .signature = "\x00\x04\x11\x79\x0f\x05\x09\x0f\x05\x09" } },
    .{ "UrlFixupW", MethodRecord{ .library = "SHLWAPI", .import = "UrlFixupW", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x09" } },
    .{ "ParseURLA", MethodRecord{ .library = "SHLWAPI", .import = "ParseURLA", .signature = "\x00\x02\x11\x79\x11\x3d\x0f\x11\x9f\x4d" } },
    .{ "ParseURLW", MethodRecord{ .library = "SHLWAPI", .import = "ParseURLW", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x9f\x51" } },
    .{ "SHDeleteEmptyKeyA", MethodRecord{ .library = "SHLWAPI", .import = "SHDeleteEmptyKeyA", .signature = "\x00\x02\x11\x81\x01\x11\x55\x11\x3d" } },
    .{ "SHDeleteEmptyKeyW", MethodRecord{ .library = "SHLWAPI", .import = "SHDeleteEmptyKeyW", .signature = "\x00\x02\x11\x81\x01\x11\x55\x11\x05" } },
    .{ "SHDeleteKeyA", MethodRecord{ .library = "SHLWAPI", .import = "SHDeleteKeyA", .signature = "\x00\x02\x11\x81\x01\x11\x55\x11\x3d" } },
    .{ "SHDeleteKeyW", MethodRecord{ .library = "SHLWAPI", .import = "SHDeleteKeyW", .signature = "\x00\x02\x11\x81\x01\x11\x55\x11\x05" } },
    .{ "SHRegDuplicateHKey", MethodRecord{ .library = "SHLWAPI", .import = "SHRegDuplicateHKey", .signature = "\x00\x01\x11\x55\x11\x55" } },
    .{ "SHDeleteValueA", MethodRecord{ .library = "SHLWAPI", .import = "SHDeleteValueA", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x3d\x11\x3d" } },
    .{ "SHDeleteValueW", MethodRecord{ .library = "SHLWAPI", .import = "SHDeleteValueW", .signature = "\x00\x03\x11\x81\x01\x11\x55\x11\x05\x11\x05" } },
    .{ "SHGetValueA", MethodRecord{ .library = "SHLWAPI", .import = "SHGetValueA", .signature = "\x00\x06\x11\x81\x01\x11\x55\x11\x3d\x11\x3d\x0f\x09\x0f\x01\x0f\x09" } },
    .{ "SHGetValueW", MethodRecord{ .library = "SHLWAPI", .import = "SHGetValueW", .signature = "\x00\x06\x11\x81\x01\x11\x55\x11\x05\x11\x05\x0f\x09\x0f\x01\x0f\x09" } },
    .{ "SHSetValueA", MethodRecord{ .library = "SHLWAPI", .import = "SHSetValueA", .signature = "\x00\x06\x08\x11\x55\x11\x3d\x11\x3d\x09\x0f\x01\x09" } },
    .{ "SHSetValueW", MethodRecord{ .library = "SHLWAPI", .import = "SHSetValueW", .signature = "\x00\x06\x08\x11\x55\x11\x05\x11\x05\x09\x0f\x01\x09" } },
    .{ "SHRegGetValueA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegGetValueA", .signature = "\x00\x07\x11\x81\x01\x11\x55\x11\x3d\x11\x3d\x08\x0f\x09\x0f\x01\x0f\x09" } },
    .{ "SHRegGetValueW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegGetValueW", .signature = "\x00\x07\x11\x81\x01\x11\x55\x11\x05\x11\x05\x08\x0f\x09\x0f\x01\x0f\x09" } },
    .{ "SHRegGetValueFromHKCUHKLM", MethodRecord{ .library = "SHLWAPI", .import = "SHRegGetValueFromHKCUHKLM", .signature = "\x00\x06\x11\x81\x01\x11\x05\x11\x05\x08\x0f\x09\x0f\x01\x0f\x09" } },
    .{ "SHQueryValueExA", MethodRecord{ .library = "SHLWAPI", .import = "SHQueryValueExA", .signature = "\x00\x06\x11\x81\x01\x11\x55\x11\x3d\x0f\x09\x0f\x09\x0f\x01\x0f\x09" } },
    .{ "SHQueryValueExW", MethodRecord{ .library = "SHLWAPI", .import = "SHQueryValueExW", .signature = "\x00\x06\x11\x81\x01\x11\x55\x11\x05\x0f\x09\x0f\x09\x0f\x01\x0f\x09" } },
    .{ "SHEnumKeyExA", MethodRecord{ .library = "SHLWAPI", .import = "SHEnumKeyExA", .signature = "\x00\x04\x11\x81\x01\x11\x55\x09\x11\x3d\x0f\x09" } },
    .{ "SHEnumKeyExW", MethodRecord{ .library = "SHLWAPI", .import = "SHEnumKeyExW", .signature = "\x00\x04\x11\x81\x01\x11\x55\x09\x11\x05\x0f\x09" } },
    .{ "SHEnumValueA", MethodRecord{ .library = "SHLWAPI", .import = "SHEnumValueA", .signature = "\x00\x07\x11\x81\x01\x11\x55\x09\x11\x3d\x0f\x09\x0f\x09\x0f\x01\x0f\x09" } },
    .{ "SHEnumValueW", MethodRecord{ .library = "SHLWAPI", .import = "SHEnumValueW", .signature = "\x00\x07\x11\x81\x01\x11\x55\x09\x11\x05\x0f\x09\x0f\x09\x0f\x01\x0f\x09" } },
    .{ "SHQueryInfoKeyA", MethodRecord{ .library = "SHLWAPI", .import = "SHQueryInfoKeyA", .signature = "\x00\x05\x11\x81\x01\x11\x55\x0f\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "SHQueryInfoKeyW", MethodRecord{ .library = "SHLWAPI", .import = "SHQueryInfoKeyW", .signature = "\x00\x05\x11\x81\x01\x11\x55\x0f\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "SHCopyKeyA", MethodRecord{ .library = "SHLWAPI", .import = "SHCopyKeyA", .signature = "\x00\x04\x11\x81\x01\x11\x55\x11\x3d\x11\x55\x09" } },
    .{ "SHCopyKeyW", MethodRecord{ .library = "SHLWAPI", .import = "SHCopyKeyW", .signature = "\x00\x04\x11\x81\x01\x11\x55\x11\x05\x11\x55\x09" } },
    .{ "SHRegGetPathA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegGetPathA", .signature = "\x00\x05\x11\x81\x01\x11\x55\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "SHRegGetPathW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegGetPathW", .signature = "\x00\x05\x11\x81\x01\x11\x55\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "SHRegSetPathA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegSetPathA", .signature = "\x00\x05\x11\x81\x01\x11\x55\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "SHRegSetPathW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegSetPathW", .signature = "\x00\x05\x11\x81\x01\x11\x55\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "SHRegCreateUSKeyA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegCreateUSKeyA", .signature = "\x00\x05\x11\x81\x01\x11\x3d\x09\x18\x0f\x18\x09" } },
    .{ "SHRegCreateUSKeyW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegCreateUSKeyW", .signature = "\x00\x05\x11\x81\x01\x11\x05\x09\x18\x0f\x18\x09" } },
    .{ "SHRegOpenUSKeyA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegOpenUSKeyA", .signature = "\x00\x05\x11\x81\x01\x11\x3d\x09\x18\x0f\x18\x11\x59" } },
    .{ "SHRegOpenUSKeyW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegOpenUSKeyW", .signature = "\x00\x05\x11\x81\x01\x11\x05\x09\x18\x0f\x18\x11\x59" } },
    .{ "SHRegQueryUSValueA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegQueryUSValueA", .signature = "\x00\x08\x11\x81\x01\x18\x11\x3d\x0f\x09\x0f\x01\x0f\x09\x11\x59\x0f\x01\x09" } },
    .{ "SHRegQueryUSValueW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegQueryUSValueW", .signature = "\x00\x08\x11\x81\x01\x18\x11\x05\x0f\x09\x0f\x01\x0f\x09\x11\x59\x0f\x01\x09" } },
    .{ "SHRegWriteUSValueA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegWriteUSValueA", .signature = "\x00\x06\x11\x81\x01\x18\x11\x3d\x09\x0f\x01\x09\x09" } },
    .{ "SHRegWriteUSValueW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegWriteUSValueW", .signature = "\x00\x06\x11\x81\x01\x18\x11\x05\x09\x0f\x01\x09\x09" } },
    .{ "SHRegDeleteUSValueA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegDeleteUSValueA", .signature = "\x00\x03\x11\x81\x01\x18\x11\x3d\x11\x9f\x55" } },
    .{ "SHRegDeleteUSValueW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegDeleteUSValueW", .signature = "\x00\x03\x11\x81\x01\x18\x11\x05\x11\x9f\x55" } },
    .{ "SHRegDeleteEmptyUSKeyW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegDeleteEmptyUSKeyW", .signature = "\x00\x03\x11\x81\x01\x18\x11\x05\x11\x9f\x55" } },
    .{ "SHRegDeleteEmptyUSKeyA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegDeleteEmptyUSKeyA", .signature = "\x00\x03\x11\x81\x01\x18\x11\x3d\x11\x9f\x55" } },
    .{ "SHRegEnumUSKeyA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegEnumUSKeyA", .signature = "\x00\x05\x11\x81\x01\x18\x09\x11\x3d\x0f\x09\x11\x9f\x59" } },
    .{ "SHRegEnumUSKeyW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegEnumUSKeyW", .signature = "\x00\x05\x11\x81\x01\x18\x09\x11\x05\x0f\x09\x11\x9f\x59" } },
    .{ "SHRegEnumUSValueA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegEnumUSValueA", .signature = "\x00\x08\x11\x81\x01\x18\x09\x11\x3d\x0f\x09\x0f\x09\x0f\x01\x0f\x09\x11\x9f\x59" } },
    .{ "SHRegEnumUSValueW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegEnumUSValueW", .signature = "\x00\x08\x11\x81\x01\x18\x09\x11\x05\x0f\x09\x0f\x09\x0f\x01\x0f\x09\x11\x9f\x59" } },
    .{ "SHRegQueryInfoUSKeyA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegQueryInfoUSKeyA", .signature = "\x00\x06\x11\x81\x01\x18\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x11\x9f\x59" } },
    .{ "SHRegQueryInfoUSKeyW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegQueryInfoUSKeyW", .signature = "\x00\x06\x11\x81\x01\x18\x0f\x09\x0f\x09\x0f\x09\x0f\x09\x11\x9f\x59" } },
    .{ "SHRegCloseUSKey", MethodRecord{ .library = "SHLWAPI", .import = "SHRegCloseUSKey", .signature = "\x00\x01\x11\x81\x01\x18" } },
    .{ "SHRegGetUSValueA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegGetUSValueA", .signature = "\x00\x08\x11\x81\x01\x11\x3d\x11\x3d\x0f\x09\x0f\x01\x0f\x09\x11\x59\x0f\x01\x09" } },
    .{ "SHRegGetUSValueW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegGetUSValueW", .signature = "\x00\x08\x11\x81\x01\x11\x05\x11\x05\x0f\x09\x0f\x01\x0f\x09\x11\x59\x0f\x01\x09" } },
    .{ "SHRegSetUSValueA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegSetUSValueA", .signature = "\x00\x06\x11\x81\x01\x11\x3d\x11\x3d\x09\x0f\x01\x09\x09" } },
    .{ "SHRegSetUSValueW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegSetUSValueW", .signature = "\x00\x06\x11\x81\x01\x11\x05\x11\x05\x09\x0f\x01\x09\x09" } },
    .{ "SHRegGetIntW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegGetIntW", .signature = "\x00\x03\x08\x11\x55\x11\x05\x08" } },
    .{ "SHRegGetBoolUSValueA", MethodRecord{ .library = "SHLWAPI", .import = "SHRegGetBoolUSValueA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x11\x59\x11\x59" } },
    .{ "SHRegGetBoolUSValueW", MethodRecord{ .library = "SHLWAPI", .import = "SHRegGetBoolUSValueW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x11\x59\x11\x59" } },
    .{ "AssocCreate", MethodRecord{ .library = "SHLWAPI", .import = "AssocCreate", .signature = "\x00\x03\x11\x79\x11\x0d\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "AssocQueryStringA", MethodRecord{ .library = "SHLWAPI", .import = "AssocQueryStringA", .signature = "\x00\x06\x11\x79\x11\x9f\x5d\x11\x9f\x61\x11\x3d\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "AssocQueryStringW", MethodRecord{ .library = "SHLWAPI", .import = "AssocQueryStringW", .signature = "\x00\x06\x11\x79\x11\x9f\x5d\x11\x9f\x61\x11\x05\x11\x05\x11\x05\x0f\x09" } },
    .{ "AssocQueryStringByKeyA", MethodRecord{ .library = "SHLWAPI", .import = "AssocQueryStringByKeyA", .signature = "\x00\x06\x11\x79\x11\x9f\x5d\x11\x9f\x61\x11\x55\x11\x3d\x11\x3d\x0f\x09" } },
    .{ "AssocQueryStringByKeyW", MethodRecord{ .library = "SHLWAPI", .import = "AssocQueryStringByKeyW", .signature = "\x00\x06\x11\x79\x11\x9f\x5d\x11\x9f\x61\x11\x55\x11\x05\x11\x05\x0f\x09" } },
    .{ "AssocQueryKeyA", MethodRecord{ .library = "SHLWAPI", .import = "AssocQueryKeyA", .signature = "\x00\x05\x11\x79\x11\x9f\x5d\x11\x9f\x65\x11\x3d\x11\x3d\x0f\x11\x55" } },
    .{ "AssocQueryKeyW", MethodRecord{ .library = "SHLWAPI", .import = "AssocQueryKeyW", .signature = "\x00\x05\x11\x79\x11\x9f\x5d\x11\x9f\x65\x11\x05\x11\x05\x0f\x11\x55" } },
    .{ "AssocIsDangerous", MethodRecord{ .library = "SHLWAPI", .import = "AssocIsDangerous", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "AssocGetPerceivedType", MethodRecord{ .library = "SHLWAPI", .import = "AssocGetPerceivedType", .signature = "\x00\x04\x11\x79\x11\x05\x0f\x11\x9f\x69\x0f\x09\x0f\x11\x05" } },
    .{ "SHOpenRegStreamA", MethodRecord{ .library = "SHLWAPI", .import = "SHOpenRegStreamA", .signature = "\x00\x04\x12\x83\x75\x11\x55\x11\x3d\x11\x3d\x09" } },
    .{ "SHOpenRegStreamW", MethodRecord{ .library = "SHLWAPI", .import = "SHOpenRegStreamW", .signature = "\x00\x04\x12\x83\x75\x11\x55\x11\x05\x11\x05\x09" } },
    .{ "SHOpenRegStream2A", MethodRecord{ .library = "SHLWAPI", .import = "SHOpenRegStream2A", .signature = "\x00\x04\x12\x83\x75\x11\x55\x11\x3d\x11\x3d\x09" } },
    .{ "SHOpenRegStream2W", MethodRecord{ .library = "SHLWAPI", .import = "SHOpenRegStream2W", .signature = "\x00\x04\x12\x83\x75\x11\x55\x11\x05\x11\x05\x09" } },
    .{ "SHCreateStreamOnFileA", MethodRecord{ .library = "SHLWAPI", .import = "SHCreateStreamOnFileA", .signature = "\x00\x03\x11\x79\x11\x3d\x09\x0f\x12\x83\x75" } },
    .{ "SHCreateStreamOnFileW", MethodRecord{ .library = "SHLWAPI", .import = "SHCreateStreamOnFileW", .signature = "\x00\x03\x11\x79\x11\x05\x09\x0f\x12\x83\x75" } },
    .{ "SHCreateStreamOnFileEx", MethodRecord{ .library = "SHLWAPI", .import = "SHCreateStreamOnFileEx", .signature = "\x00\x06\x11\x79\x11\x05\x09\x09\x11\x59\x12\x83\x75\x0f\x12\x83\x75" } },
    .{ "SHCreateMemStream", MethodRecord{ .library = "SHLWAPI", .import = "SHCreateMemStream", .signature = "\x00\x02\x12\x83\x75\x0f\x05\x09" } },
    .{ "GetAcceptLanguagesA", MethodRecord{ .library = "SHLWAPI", .import = "GetAcceptLanguagesA", .signature = "\x00\x02\x11\x79\x11\x3d\x0f\x09" } },
    .{ "GetAcceptLanguagesW", MethodRecord{ .library = "SHLWAPI", .import = "GetAcceptLanguagesW", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x09" } },
    .{ "IUnknown_Set", MethodRecord{ .library = "SHLWAPI", .import = "IUnknown_Set", .signature = "\x00\x02\x01\x0f\x12\x82\xb1\x12\x82\xb1" } },
    .{ "IUnknown_AtomicRelease", MethodRecord{ .library = "SHLWAPI", .import = "IUnknown_AtomicRelease", .signature = "\x00\x01\x01\x0f\x0f\x01" } },
    .{ "IUnknown_GetWindow", MethodRecord{ .library = "SHLWAPI", .import = "IUnknown_GetWindow", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x0f\x11\x25" } },
    .{ "IUnknown_SetSite", MethodRecord{ .library = "SHLWAPI", .import = "IUnknown_SetSite", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x12\x82\xb1" } },
    .{ "IUnknown_GetSite", MethodRecord{ .library = "SHLWAPI", .import = "IUnknown_GetSite", .signature = "\x00\x03\x11\x79\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "IUnknown_QueryService", MethodRecord{ .library = "SHLWAPI", .import = "IUnknown_QueryService", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x0f\x11\x0d\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "IStream_Read", MethodRecord{ .library = "SHLWAPI", .import = "IStream_Read", .signature = "\x00\x03\x11\x79\x12\x83\x75\x0f\x01\x09" } },
    .{ "IStream_Write", MethodRecord{ .library = "SHLWAPI", .import = "IStream_Write", .signature = "\x00\x03\x11\x79\x12\x83\x75\x0f\x01\x09" } },
    .{ "IStream_Reset", MethodRecord{ .library = "SHLWAPI", .import = "IStream_Reset", .signature = "\x00\x01\x11\x79\x12\x83\x75" } },
    .{ "IStream_Size", MethodRecord{ .library = "SHLWAPI", .import = "IStream_Size", .signature = "\x00\x02\x11\x79\x12\x83\x75\x0f\x0b" } },
    .{ "ConnectToConnectionPoint", MethodRecord{ .library = "SHLWAPI", .import = "ConnectToConnectionPoint", .signature = "\x00\x06\x11\x79\x12\x82\xb1\x0f\x11\x0d\x11\x59\x12\x82\xb1\x0f\x09\x0f\x12\x9f\x6d" } },
    .{ "IStream_ReadPidl", MethodRecord{ .library = "SHLWAPI", .import = "IStream_ReadPidl", .signature = "\x00\x02\x11\x79\x12\x83\x75\x0f\x0f\x11\x9e\x35" } },
    .{ "IStream_WritePidl", MethodRecord{ .library = "SHLWAPI", .import = "IStream_WritePidl", .signature = "\x00\x02\x11\x79\x12\x83\x75\x0f\x11\x9e\x35" } },
    .{ "IStream_ReadStr", MethodRecord{ .library = "SHLWAPI", .import = "IStream_ReadStr", .signature = "\x00\x02\x11\x79\x12\x83\x75\x0f\x11\x05" } },
    .{ "IStream_WriteStr", MethodRecord{ .library = "SHLWAPI", .import = "IStream_WriteStr", .signature = "\x00\x02\x11\x79\x12\x83\x75\x11\x05" } },
    .{ "IStream_Copy", MethodRecord{ .library = "SHLWAPI", .import = "IStream_Copy", .signature = "\x00\x03\x11\x79\x12\x83\x75\x12\x83\x75\x09" } },
    .{ "SHGetViewStatePropertyBag", MethodRecord{ .library = "SHLWAPI", .import = "SHGetViewStatePropertyBag", .signature = "\x00\x05\x11\x79\x0f\x11\x9e\x35\x11\x05\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHFormatDateTimeA", MethodRecord{ .library = "SHLWAPI", .import = "SHFormatDateTimeA", .signature = "\x00\x04\x08\x0f\x11\x80\x9d\x0f\x09\x11\x3d\x09" } },
    .{ "SHFormatDateTimeW", MethodRecord{ .library = "SHLWAPI", .import = "SHFormatDateTimeW", .signature = "\x00\x04\x08\x0f\x11\x80\x9d\x0f\x09\x11\x05\x09" } },
    .{ "SHAnsiToUnicode", MethodRecord{ .library = "SHLWAPI", .import = "SHAnsiToUnicode", .signature = "\x00\x03\x08\x11\x3d\x11\x05\x08" } },
    .{ "SHAnsiToAnsi", MethodRecord{ .library = "SHLWAPI", .import = "SHAnsiToAnsi", .signature = "\x00\x03\x08\x11\x3d\x11\x3d\x08" } },
    .{ "SHUnicodeToAnsi", MethodRecord{ .library = "SHLWAPI", .import = "SHUnicodeToAnsi", .signature = "\x00\x03\x08\x11\x05\x11\x3d\x08" } },
    .{ "SHUnicodeToUnicode", MethodRecord{ .library = "SHLWAPI", .import = "SHUnicodeToUnicode", .signature = "\x00\x03\x08\x11\x05\x11\x05\x08" } },
    .{ "SHMessageBoxCheckA", MethodRecord{ .library = "SHLWAPI", .import = "SHMessageBoxCheckA", .signature = "\x00\x06\x08\x11\x25\x11\x3d\x11\x3d\x09\x08\x11\x3d" } },
    .{ "SHMessageBoxCheckW", MethodRecord{ .library = "SHLWAPI", .import = "SHMessageBoxCheckW", .signature = "\x00\x06\x08\x11\x25\x11\x05\x11\x05\x09\x08\x11\x05" } },
    .{ "SHSendMessageBroadcastA", MethodRecord{ .library = "SHLWAPI", .import = "SHSendMessageBroadcastA", .signature = "\x00\x03\x11\x82\x35\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "SHSendMessageBroadcastW", MethodRecord{ .library = "SHLWAPI", .import = "SHSendMessageBroadcastW", .signature = "\x00\x03\x11\x82\x35\x09\x11\x83\x8d\x11\x82\x2d" } },
    .{ "SHStripMneumonicA", MethodRecord{ .library = "SHLWAPI", .import = "SHStripMneumonicA", .signature = "\x00\x01\x11\x8d\x5d\x11\x3d" } },
    .{ "SHStripMneumonicW", MethodRecord{ .library = "SHLWAPI", .import = "SHStripMneumonicW", .signature = "\x00\x01\x03\x11\x05" } },
    .{ "IsOS", MethodRecord{ .library = "SHLWAPI", .import = "IsOS", .signature = "\x00\x01\x11\x59\x11\x9f\x71" } },
    .{ "SHGlobalCounterGetValue", MethodRecord{ .library = "SHLWAPI", .import = "SHGlobalCounterGetValue", .signature = "\x00\x01\x08\x11\x9f\x75" } },
    .{ "SHGlobalCounterIncrement", MethodRecord{ .library = "SHLWAPI", .import = "SHGlobalCounterIncrement", .signature = "\x00\x01\x08\x11\x9f\x75" } },
    .{ "SHGlobalCounterDecrement", MethodRecord{ .library = "SHLWAPI", .import = "SHGlobalCounterDecrement", .signature = "\x00\x01\x08\x11\x9f\x75" } },
    .{ "SHAllocShared", MethodRecord{ .library = "SHLWAPI", .import = "SHAllocShared", .signature = "\x00\x03\x11\x80\x85\x0f\x01\x09\x09" } },
    .{ "SHFreeShared", MethodRecord{ .library = "SHLWAPI", .import = "SHFreeShared", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "SHLockShared", MethodRecord{ .library = "SHLWAPI", .import = "SHLockShared", .signature = "\x00\x02\x0f\x01\x11\x80\x85\x09" } },
    .{ "SHUnlockShared", MethodRecord{ .library = "SHLWAPI", .import = "SHUnlockShared", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "WhichPlatform", MethodRecord{ .library = "SHLWAPI", .import = "WhichPlatform", .signature = "\x00\x00\x09" } },
    .{ "QISearch", MethodRecord{ .library = "SHLWAPI", .import = "QISearch", .signature = "\x00\x04\x11\x79\x0f\x01\x0f\x11\x9f\x79\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "SHIsLowMemoryMachine", MethodRecord{ .library = "SHLWAPI", .import = "SHIsLowMemoryMachine", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "GetMenuPosFromID", MethodRecord{ .library = "SHLWAPI", .import = "GetMenuPosFromID", .signature = "\x00\x02\x08\x11\x83\x91\x09" } },
    .{ "SHGetInverseCMAP", MethodRecord{ .library = "SHLWAPI", .import = "SHGetInverseCMAP", .signature = "\x00\x02\x11\x79\x0f\x05\x09" } },
    .{ "SHAutoComplete", MethodRecord{ .library = "SHLWAPI", .import = "SHAutoComplete", .signature = "\x00\x02\x11\x79\x11\x25\x11\x9f\x7d" } },
    .{ "SHCreateThreadRef", MethodRecord{ .library = "SHLWAPI", .import = "SHCreateThreadRef", .signature = "\x00\x02\x11\x79\x0f\x08\x0f\x12\x82\xb1" } },
    .{ "SHSetThreadRef", MethodRecord{ .library = "SHLWAPI", .import = "SHSetThreadRef", .signature = "\x00\x01\x11\x79\x12\x82\xb1" } },
    .{ "SHGetThreadRef", MethodRecord{ .library = "SHLWAPI", .import = "SHGetThreadRef", .signature = "\x00\x01\x11\x79\x0f\x12\x82\xb1" } },
    .{ "SHSkipJunction", MethodRecord{ .library = "SHLWAPI", .import = "SHSkipJunction", .signature = "\x00\x02\x11\x59\x12\x82\xbd\x0f\x11\x0d" } },
    .{ "SHCreateThread", MethodRecord{ .library = "SHLWAPI", .import = "SHCreateThread", .signature = "\x00\x04\x11\x59\x12\x9f\x81\x0f\x01\x09\x12\x9f\x81" } },
    .{ "SHCreateThreadWithHandle", MethodRecord{ .library = "SHLWAPI", .import = "SHCreateThreadWithHandle", .signature = "\x00\x05\x11\x59\x12\x9f\x81\x0f\x01\x09\x12\x9f\x81\x0f\x11\x80\x85" } },
    .{ "SHReleaseThreadRef", MethodRecord{ .library = "SHLWAPI", .import = "SHReleaseThreadRef", .signature = "\x00\x00\x11\x79" } },
    .{ "SHCreateShellPalette", MethodRecord{ .library = "SHLWAPI", .import = "SHCreateShellPalette", .signature = "\x00\x01\x11\x8d\x65\x11\x83\x5d" } },
    .{ "ColorRGBToHLS", MethodRecord{ .library = "SHLWAPI", .import = "ColorRGBToHLS", .signature = "\x00\x04\x01\x11\x83\x59\x0f\x07\x0f\x07\x0f\x07" } },
    .{ "ColorHLSToRGB", MethodRecord{ .library = "SHLWAPI", .import = "ColorHLSToRGB", .signature = "\x00\x03\x11\x83\x59\x07\x07\x07" } },
    .{ "ColorAdjustLuma", MethodRecord{ .library = "SHLWAPI", .import = "ColorAdjustLuma", .signature = "\x00\x03\x11\x83\x59\x11\x83\x59\x08\x11\x59" } },
    .{ "IsInternetESCEnabled", MethodRecord{ .library = "SHLWAPI", .import = "IsInternetESCEnabled", .signature = "\x00\x00\x11\x59" } },
    .{ "HlinkCreateFromMoniker", MethodRecord{ .library = "hlink", .import = "HlinkCreateFromMoniker", .signature = "\x00\x08\x11\x79\x12\x82\xc9\x11\x05\x11\x05\x12\x9f\x85\x09\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "HlinkCreateFromString", MethodRecord{ .library = "hlink", .import = "HlinkCreateFromString", .signature = "\x00\x08\x11\x79\x11\x05\x11\x05\x11\x05\x12\x9f\x85\x09\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "HlinkCreateFromData", MethodRecord{ .library = "hlink", .import = "HlinkCreateFromData", .signature = "\x00\x06\x11\x79\x12\x99\xad\x12\x9f\x85\x09\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "HlinkQueryCreateFromData", MethodRecord{ .library = "hlink", .import = "HlinkQueryCreateFromData", .signature = "\x00\x01\x11\x79\x12\x99\xad" } },
    .{ "HlinkClone", MethodRecord{ .library = "hlink", .import = "HlinkClone", .signature = "\x00\x05\x11\x79\x12\x9f\x89\x0f\x11\x0d\x12\x9f\x85\x09\x0f\x0f\x01" } },
    .{ "HlinkCreateBrowseContext", MethodRecord{ .library = "hlink", .import = "HlinkCreateBrowseContext", .signature = "\x00\x03\x11\x79\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "HlinkNavigateToStringReference", MethodRecord{ .library = "hlink", .import = "HlinkNavigateToStringReference", .signature = "\x00\x09\x11\x79\x11\x05\x11\x05\x12\x9f\x85\x09\x12\x9f\x8d\x09\x12\x82\xbd\x12\x82\xd5\x12\x9f\x91" } },
    .{ "HlinkNavigate", MethodRecord{ .library = "hlink", .import = "HlinkNavigate", .signature = "\x00\x06\x11\x79\x12\x9f\x89\x12\x9f\x8d\x09\x12\x82\xbd\x12\x82\xd5\x12\x9f\x91" } },
    .{ "HlinkOnNavigate", MethodRecord{ .library = "hlink", .import = "HlinkOnNavigate", .signature = "\x00\x07\x11\x79\x12\x9f\x8d\x12\x9f\x91\x09\x12\x82\xc9\x11\x05\x11\x05\x0f\x09" } },
    .{ "HlinkUpdateStackItem", MethodRecord{ .library = "hlink", .import = "HlinkUpdateStackItem", .signature = "\x00\x06\x11\x79\x12\x9f\x8d\x12\x9f\x91\x09\x12\x82\xc9\x11\x05\x11\x05" } },
    .{ "HlinkOnRenameDocument", MethodRecord{ .library = "hlink", .import = "HlinkOnRenameDocument", .signature = "\x00\x04\x11\x79\x09\x12\x9f\x91\x12\x82\xc9\x12\x82\xc9" } },
    .{ "HlinkResolveMonikerForData", MethodRecord{ .library = "hlink", .import = "HlinkResolveMonikerForData", .signature = "\x00\x07\x11\x79\x12\x82\xc9\x09\x12\x82\xbd\x09\x0f\x11\x99\xb1\x12\x82\xd5\x12\x82\xc9" } },
    .{ "HlinkResolveStringForData", MethodRecord{ .library = "hlink", .import = "HlinkResolveStringForData", .signature = "\x00\x07\x11\x79\x11\x05\x09\x12\x82\xbd\x09\x0f\x11\x99\xb1\x12\x82\xd5\x12\x82\xc9" } },
    .{ "HlinkParseDisplayName", MethodRecord{ .library = "hlink", .import = "HlinkParseDisplayName", .signature = "\x00\x05\x11\x79\x12\x82\xbd\x11\x05\x11\x59\x0f\x09\x0f\x12\x82\xc9" } },
    .{ "HlinkCreateExtensionServices", MethodRecord{ .library = "hlink", .import = "HlinkCreateExtensionServices", .signature = "\x00\x07\x11\x79\x11\x05\x11\x25\x11\x05\x11\x05\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "HlinkPreprocessMoniker", MethodRecord{ .library = "hlink", .import = "HlinkPreprocessMoniker", .signature = "\x00\x03\x11\x79\x12\x82\xbd\x12\x82\xc9\x0f\x12\x82\xc9" } },
    .{ "OleSaveToStreamEx", MethodRecord{ .library = "hlink", .import = "OleSaveToStreamEx", .signature = "\x00\x03\x11\x79\x12\x82\xb1\x12\x83\x75\x11\x59" } },
    .{ "HlinkSetSpecialReference", MethodRecord{ .library = "hlink", .import = "HlinkSetSpecialReference", .signature = "\x00\x02\x11\x79\x09\x11\x05" } },
    .{ "HlinkGetSpecialReference", MethodRecord{ .library = "hlink", .import = "HlinkGetSpecialReference", .signature = "\x00\x02\x11\x79\x09\x0f\x11\x05" } },
    .{ "HlinkCreateShortcut", MethodRecord{ .library = "hlink", .import = "HlinkCreateShortcut", .signature = "\x00\x06\x11\x79\x09\x12\x9f\x89\x11\x05\x11\x05\x0f\x11\x05\x09" } },
    .{ "HlinkCreateShortcutFromMoniker", MethodRecord{ .library = "hlink", .import = "HlinkCreateShortcutFromMoniker", .signature = "\x00\x07\x11\x79\x09\x12\x82\xc9\x11\x05\x11\x05\x11\x05\x0f\x11\x05\x09" } },
    .{ "HlinkCreateShortcutFromString", MethodRecord{ .library = "hlink", .import = "HlinkCreateShortcutFromString", .signature = "\x00\x07\x11\x79\x09\x11\x05\x11\x05\x11\x05\x11\x05\x0f\x11\x05\x09" } },
    .{ "HlinkResolveShortcut", MethodRecord{ .library = "hlink", .import = "HlinkResolveShortcut", .signature = "\x00\x06\x11\x79\x11\x05\x12\x9f\x85\x09\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "HlinkResolveShortcutToMoniker", MethodRecord{ .library = "hlink", .import = "HlinkResolveShortcutToMoniker", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x12\x82\xc9\x0f\x11\x05" } },
    .{ "HlinkResolveShortcutToString", MethodRecord{ .library = "hlink", .import = "HlinkResolveShortcutToString", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "HlinkIsShortcut", MethodRecord{ .library = "hlink", .import = "HlinkIsShortcut", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "HlinkGetValueFromParams", MethodRecord{ .library = "hlink", .import = "HlinkGetValueFromParams", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x0f\x11\x05" } },
    .{ "HlinkTranslateURL", MethodRecord{ .library = "hlink", .import = "HlinkTranslateURL", .signature = "\x00\x03\x11\x79\x11\x05\x09\x0f\x11\x05" } },
    .{ "PathIsUNCEx", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathIsUNCEx", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x11\x05" } },
    .{ "PathCchIsRoot", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchIsRoot", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "PathCchAddBackslashEx", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchAddBackslashEx", .signature = "\x00\x04\x11\x79\x11\x05\x19\x0f\x11\x05\x0f\x19" } },
    .{ "PathCchAddBackslash", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchAddBackslash", .signature = "\x00\x02\x11\x79\x11\x05\x19" } },
    .{ "PathCchRemoveBackslashEx", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchRemoveBackslashEx", .signature = "\x00\x04\x11\x79\x11\x05\x19\x0f\x11\x05\x0f\x19" } },
    .{ "PathCchRemoveBackslash", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchRemoveBackslash", .signature = "\x00\x02\x11\x79\x11\x05\x19" } },
    .{ "PathCchSkipRoot", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchSkipRoot", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "PathCchStripToRoot", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchStripToRoot", .signature = "\x00\x02\x11\x79\x11\x05\x19" } },
    .{ "PathCchRemoveFileSpec", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchRemoveFileSpec", .signature = "\x00\x02\x11\x79\x11\x05\x19" } },
    .{ "PathCchFindExtension", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchFindExtension", .signature = "\x00\x03\x11\x79\x11\x05\x19\x0f\x11\x05" } },
    .{ "PathCchAddExtension", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchAddExtension", .signature = "\x00\x03\x11\x79\x11\x05\x19\x11\x05" } },
    .{ "PathCchRenameExtension", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchRenameExtension", .signature = "\x00\x03\x11\x79\x11\x05\x19\x11\x05" } },
    .{ "PathCchRemoveExtension", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchRemoveExtension", .signature = "\x00\x02\x11\x79\x11\x05\x19" } },
    .{ "PathCchCanonicalizeEx", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchCanonicalizeEx", .signature = "\x00\x04\x11\x79\x11\x05\x19\x11\x05\x11\x9f\x95" } },
    .{ "PathCchCanonicalize", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchCanonicalize", .signature = "\x00\x03\x11\x79\x11\x05\x19\x11\x05" } },
    .{ "PathCchCombineEx", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchCombineEx", .signature = "\x00\x05\x11\x79\x11\x05\x19\x11\x05\x11\x05\x11\x9f\x95" } },
    .{ "PathCchCombine", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchCombine", .signature = "\x00\x04\x11\x79\x11\x05\x19\x11\x05\x11\x05" } },
    .{ "PathCchAppendEx", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchAppendEx", .signature = "\x00\x04\x11\x79\x11\x05\x19\x11\x05\x11\x9f\x95" } },
    .{ "PathCchAppend", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchAppend", .signature = "\x00\x03\x11\x79\x11\x05\x19\x11\x05" } },
    .{ "PathCchStripPrefix", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathCchStripPrefix", .signature = "\x00\x02\x11\x79\x11\x05\x19" } },
    .{ "PathAllocCombine", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathAllocCombine", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x11\x9f\x95\x0f\x11\x05" } },
    .{ "PathAllocCanonicalize", MethodRecord{ .library = "api-ms-win-core-path-l1-1-0", .import = "PathAllocCanonicalize", .signature = "\x00\x03\x11\x79\x11\x05\x11\x9f\x95\x0f\x11\x05" } },
    .{ "RegisterAppStateChangeNotification", MethodRecord{ .library = "api-ms-win-core-psm-appnotify-l1-1-0", .import = "RegisterAppStateChangeNotification", .signature = "\x00\x03\x09\x12\x9f\x99\x0f\x01\x0f\x11\x9f\x9d" } },
    .{ "UnregisterAppStateChangeNotification", MethodRecord{ .library = "api-ms-win-core-psm-appnotify-l1-1-0", .import = "UnregisterAppStateChangeNotification", .signature = "\x00\x01\x01\x11\x9f\x9d" } },
    .{ "RegisterAppConstrainedChangeNotification", MethodRecord{ .library = "api-ms-win-core-psm-appnotify-l1-1-1", .import = "RegisterAppConstrainedChangeNotification", .signature = "\x00\x03\x09\x12\x9f\xa1\x0f\x01\x0f\x11\x9f\xa5" } },
    .{ "UnregisterAppConstrainedChangeNotification", MethodRecord{ .library = "api-ms-win-core-psm-appnotify-l1-1-1", .import = "UnregisterAppConstrainedChangeNotification", .signature = "\x00\x01\x01\x11\x9f\xa5" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x55 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "HKEY" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x171 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PROPERTYKEY" },
        0x201 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "PROPVARIANT" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x235 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LRESULT" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x2bd => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IBindCtx" },
        0x2c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IMoniker" },
        0x2d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IBindStatusCallback" },
        0x2d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IMalloc" },
        0x349 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls", .name = "HIMAGELIST" },
        0x355 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HICON" },
        0x359 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "COLORREF" },
        0x35d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HDC" },
        0x371 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "POINT" },
        0x375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IStream" },
        0x389 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "RECT" },
        0x38d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WPARAM" },
        0x391 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HMENU" },
        0x929 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MESSAGEBOX_STYLE" },
        0xbad => TypeRefEntry{ .namespace = "Windows.Win32.Storage.FileSystem", .name = "FILE_FLAGS_AND_ATTRIBUTES" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0xd35 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BSTR" },
        0xd5d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "CHAR" },
        0xd65 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HPALETTE" },
        0xeed => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HMONITOR" },
        0x1489 => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "VARIANT" },
        0x19ad => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IDataObject" },
        0x19b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "FORMATETC" },
        0x19b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "IStorage" },
        0x19d1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "IDropSource" },
        0x19d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Ole", .name = "DROPEFFECT" },
        0x1a09 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IEnumFORMATETC" },
        0x1e29 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "PROFILEINFOA" },
        0x1e2d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "PROFILEINFOW" },
        0x1e31 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell.Common", .name = "STRRET" },
        0x1e35 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell.Common", .name = "ITEMIDLIST" },
        0x1e39 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SUBCLASSPROC" },
        0x1e3d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "IShellFolder" },
        0x1e41 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "IShellItem" },
        0x1e45 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SIGDN" },
        0x1e49 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "DATAOBJ_GET_ITEM_FLAGS" },
        0x1e4d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "IShellItemArray" },
        0x1e51 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "LIBRARYMANAGEDIALOGOPTIONS" },
        0x1e55 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "ASSOC_FILTER" },
        0x1e59 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "IEnumAssocHandlers" },
        0x1e5d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "IFileOperation" },
        0x1e61 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "IFileOperationProgressSink" },
        0x1e65 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell.Common", .name = "SHITEMID" },
        0x1e69 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "GPFIDL_FLAGS" },
        0x1e71 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "KNOWN_FOLDER_FLAG" },
        0x1e75 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHFOLDERCUSTOMSETTINGS" },
        0x1e79 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "BROWSEINFOA" },
        0x1e7d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "BROWSEINFOW" },
        0x1e81 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHCNF_FLAGS" },
        0x1e85 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHCNRF_SOURCE" },
        0x1e89 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHChangeNotifyEntry" },
        0x1e8d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHGDFIL_FORMAT" },
        0x1e91 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "AUTO_SCROLL_DATA" },
        0x1e95 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "CABINETSTATE" },
        0x1e99 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "MM_FLAGS" },
        0x1e9d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHFMT_ID" },
        0x1ea1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "HPSXA" },
        0x1ea5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls", .name = "LPFNSVADDPROPSHEETPAGE" },
        0x1ea9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "RESTRICTIONS" },
        0x1ead => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "OPENASINFO" },
        0x1eb1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SFV_CREATE" },
        0x1eb5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "IShellView" },
        0x1eb9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "LPFNDFMCALLBACK" },
        0x1ebd => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "IContextMenu" },
        0x1ec1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "DEFCONTEXTMENU" },
        0x1ec5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "CSFV" },
        0x1ec9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHELLSTATEA" },
        0x1ecd => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SSF_MASK" },
        0x1ed1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHELLFLAGSTATE" },
        0x1ed5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SCNRT_STATUS" },
        0x1ed9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "IShellBrowser" },
        0x1edd => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.Urlmon", .name = "SOFTDISTINFO" },
        0x1ee1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell.Common", .name = "DEVICE_SCALE_FACTOR" },
        0x1ee5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "DISPLAY_DEVICE_TYPE" },
        0x1ee9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHELL_UI_COMPONENT" },
        0x1eed => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "HDROP" },
        0x1ef1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "SHOW_WINDOW_CMD" },
        0x1ef9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "APPBARDATA" },
        0x1efd => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHFILEOPSTRUCTA" },
        0x1f01 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHFILEOPSTRUCTW" },
        0x1f05 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHELLEXECUTEINFOA" },
        0x1f09 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHELLEXECUTEINFOW" },
        0x1f0d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHCREATEPROCESSINFOW" },
        0x1f11 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "ASSOCIATIONELEMENT" },
        0x1f15 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHQUERYRBINFO" },
        0x1f19 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "QUERY_USER_NOTIFICATION_STATE" },
        0x1f1d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "NOTIFY_ICON_MESSAGE" },
        0x1f21 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "NOTIFYICONDATAA" },
        0x1f25 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "NOTIFYICONDATAW" },
        0x1f29 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "NOTIFYICONIDENTIFIER" },
        0x1f2d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHFILEINFOA" },
        0x1f31 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHGFI_FLAGS" },
        0x1f35 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHFILEINFOW" },
        0x1f39 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHSTOCKICONID" },
        0x1f3d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHGSI_FLAGS" },
        0x1f41 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHSTOCKICONINFO" },
        0x1f45 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SFBS_FLAGS" },
        0x1f49 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "URLIS" },
        0x1f4d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "PARSEDURLA" },
        0x1f51 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "PARSEDURLW" },
        0x1f55 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHREGDEL_FLAGS" },
        0x1f59 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHREGENUM_FLAGS" },
        0x1f5d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "ASSOCF" },
        0x1f61 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "ASSOCSTR" },
        0x1f65 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "ASSOCKEY" },
        0x1f69 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell.Common", .name = "PERCEIVED" },
        0x1f6d => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IConnectionPoint" },
        0x1f71 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "OS" },
        0x1f75 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHGLOBALCOUNTER" },
        0x1f79 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "QITAB" },
        0x1f7d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "SHELL_AUTOCOMPLETE_FLAGS" },
        0x1f81 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "LPTHREAD_START_ROUTINE" },
        0x1f85 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "IHlinkSite" },
        0x1f89 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "IHlink" },
        0x1f8d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "IHlinkFrame" },
        0x1f91 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "IHlinkBrowseContext" },
        0x1f95 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "PATHCCH_OPTIONS" },
        0x1f99 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "PAPPSTATE_CHANGE_ROUTINE" },
        0x1f9d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "PAPPSTATE_REGISTRATION" },
        0x1fa1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "PAPPCONSTRAIN_CHANGE_ROUTINE" },
        0x1fa5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Shell", .name = "PAPPCONSTRAIN_REGISTRATION" },
        else => null,
    };
}

pub const HLINK_E_FIRST = -2147221248;
pub const HLINK_S_FIRST = 262400;
pub const WM_CPL_LAUNCH = 2024;
pub const WM_CPL_LAUNCHED = 2025;
pub const CPL_DYNAMIC_RES = 0;
pub const CPL_INIT = 1;
pub const CPL_GETCOUNT = 2;
pub const CPL_INQUIRE = 3;
pub const CPL_SELECT = 4;
pub const CPL_DBLCLK = 5;
pub const CPL_STOP = 6;
pub const CPL_EXIT = 7;
pub const CPL_NEWINQUIRE = 8;
pub const CPL_STARTWPARMSA = 9;
pub const CPL_STARTWPARMSW = 10;
pub const CPL_STARTWPARMS = 10;
pub const CPL_SETUP = 200;
pub const HLINK_S_DONTHIDE = 262400;
pub const PID_FINDDATA = 0;
pub const PID_NETRESOURCE = 1;
pub const PID_DESCRIPTIONID = 2;
pub const PID_WHICHFOLDER = 3;
pub const PID_NETWORKLOCATION = 4;
pub const PID_COMPUTERNAME = 5;
pub const PID_DISPLACED_FROM = 2;
pub const PID_DISPLACED_DATE = 3;
pub const PID_SYNC_COPY_IN = 2;
pub const PID_MISC_STATUS = 2;
pub const PID_MISC_ACCESSCOUNT = 3;
pub const PID_MISC_OWNER = 4;
pub const PID_HTMLINFOTIPFILE = 5;
pub const PID_MISC_PICS = 6;
pub const PID_DISPLAY_PROPERTIES = 0;
pub const PID_INTROTEXT = 1;
pub const PIDSI_ARTIST = 2;
pub const PIDSI_SONGTITLE = 3;
pub const PIDSI_ALBUM = 4;
pub const PIDSI_YEAR = 5;
pub const PIDSI_COMMENT = 6;
pub const PIDSI_TRACK = 7;
pub const PIDSI_GENRE = 11;
pub const PIDSI_LYRICS = 12;
pub const PIDDRSI_PROTECTED = 2;
pub const PIDDRSI_DESCRIPTION = 3;
pub const PIDDRSI_PLAYCOUNT = 4;
pub const PIDDRSI_PLAYSTARTS = 5;
pub const PIDDRSI_PLAYEXPIRES = 6;
pub const PIDVSI_STREAM_NAME = 2;
pub const PIDVSI_FRAME_WIDTH = 3;
pub const PIDVSI_FRAME_HEIGHT = 4;
pub const PIDVSI_TIMELENGTH = 7;
pub const PIDVSI_FRAME_COUNT = 5;
pub const PIDVSI_FRAME_RATE = 6;
pub const PIDVSI_DATA_RATE = 8;
pub const PIDVSI_SAMPLE_SIZE = 9;
pub const PIDVSI_COMPRESSION = 10;
pub const PIDVSI_STREAM_NUMBER = 11;
pub const PIDASI_FORMAT = 2;
pub const PIDASI_TIMELENGTH = 3;
pub const PIDASI_AVG_DATA_RATE = 4;
pub const PIDASI_SAMPLE_RATE = 5;
pub const PIDASI_SAMPLE_SIZE = 6;
pub const PIDASI_CHANNEL_COUNT = 7;
pub const PIDASI_STREAM_NUMBER = 8;
pub const PIDASI_STREAM_NAME = 9;
pub const PIDASI_COMPRESSION = 10;
pub const PID_CONTROLPANEL_CATEGORY = 2;
pub const PID_VOLUME_FREE = 2;
pub const PID_VOLUME_CAPACITY = 3;
pub const PID_VOLUME_FILESYSTEM = 4;
pub const PID_SHARE_CSC_STATUS = 2;
pub const PID_LINK_TARGET = 2;
pub const PID_LINK_TARGET_TYPE = 3;
pub const PID_QUERY_RANK = 2;
pub const IDD_WIZEXTN_FIRST = 20480;
pub const IDD_WIZEXTN_LAST = 20736;
pub const SHPWHF_NORECOMPRESS = 1;
pub const SHPWHF_NONETPLACECREATE = 2;
pub const SHPWHF_NOFILESELECTOR = 4;
pub const SHPWHF_USEMRU = 8;
pub const SHPWHF_ANYLOCATION = 256;
pub const SHPWHF_VALIDATEVIAWEBFOLDERS = 65536;
pub const ACDD_VISIBLE = 1;
pub const NSTCDHPOS_ONTOP = -1;
pub const FVSIF_RECT = 1;
pub const FVSIF_PINNED = 2;
pub const FVSIF_NEWFAILED = 134217728;
pub const FVSIF_NEWFILE = 2147483648;
pub const FVSIF_CANVIEWIT = 1073741824;
pub const FCIDM_TOOLBAR = 40960;
pub const FCIDM_STATUS = 40961;
pub const IDC_OFFLINE_HAND = 103;
pub const IDC_PANTOOL_HAND_OPEN = 104;
pub const IDC_PANTOOL_HAND_CLOSED = 105;
pub const PANE_NONE = 4294967295;
pub const PANE_ZONE = 1;
pub const PANE_OFFLINE = 2;
pub const PANE_PRINTER = 3;
pub const PANE_SSL = 4;
pub const PANE_NAVIGATION = 5;
pub const PANE_PROGRESS = 6;
pub const PANE_PRIVACY = 7;
pub const DWFRF_NORMAL = 0;
pub const DWFRF_DELETECONFIGDATA = 1;
pub const DWFAF_HIDDEN = 1;
pub const DWFAF_GROUP1 = 2;
pub const DWFAF_GROUP2 = 4;
pub const DWFAF_AUTOHIDE = 16;
pub const SHIMSTCAPFLAG_LOCKABLE = 1;
pub const SHIMSTCAPFLAG_PURGEABLE = 2;
pub const ISFB_MASK_STATE = 1;
pub const ISFB_MASK_BKCOLOR = 2;
pub const ISFB_MASK_VIEWMODE = 4;
pub const ISFB_MASK_SHELLFOLDER = 8;
pub const ISFB_MASK_IDLIST = 16;
pub const ISFB_MASK_COLORS = 32;
pub const ISFB_STATE_DEFAULT = 0;
pub const ISFB_STATE_DEBOSSED = 1;
pub const ISFB_STATE_ALLOWRENAME = 2;
pub const ISFB_STATE_NOSHOWTEXT = 4;
pub const ISFB_STATE_CHANNELBAR = 16;
pub const ISFB_STATE_QLINKSMODE = 32;
pub const ISFB_STATE_FULLOPEN = 64;
pub const ISFB_STATE_NONAMESORT = 128;
pub const ISFB_STATE_BTNMINSIZE = 256;
pub const ISFBVIEWMODE_SMALLICONS = 1;
pub const ISFBVIEWMODE_LARGEICONS = 2;
pub const ISFBVIEWMODE_LOGOS = 3;
pub const DBC_GS_IDEAL = 0;
pub const DBC_GS_SIZEDOWN = 1;
pub const DBC_HIDE = 0;
pub const DBC_SHOW = 1;
pub const DBC_SHOWOBSCURE = 2;
pub const SSM_CLEAR = 0;
pub const SSM_SET = 1;
pub const SSM_REFRESH = 2;
pub const SSM_UPDATE = 4;
pub const SCHEME_DISPLAY = 1;
pub const SCHEME_EDIT = 2;
pub const SCHEME_LOCAL = 4;
pub const SCHEME_GLOBAL = 8;
pub const SCHEME_REFRESH = 16;
pub const SCHEME_UPDATE = 32;
pub const SCHEME_DONOTUSE = 64;
pub const SCHEME_CREATE = 128;
pub const GADOF_DIRTY = 1;
pub const SHCDF_UPDATEITEM = 1;
pub const PPCF_ADDQUOTES = 1;
pub const PPCF_ADDARGUMENTS = 3;
pub const PPCF_NODIRECTORIES = 16;
pub const PPCF_FORCEQUALIFY = 64;
pub const PPCF_LONGESTPOSSIBLE = 128;
pub const OPENPROPS_NONE = 0;
pub const OPENPROPS_INHIBITPIF = 32768;
pub const GETPROPS_NONE = 0;
pub const SETPROPS_NONE = 0;
pub const CLOSEPROPS_NONE = 0;
pub const CLOSEPROPS_DISCARD = 1;
pub const TBIF_APPEND = 0;
pub const TBIF_PREPEND = 1;
pub const TBIF_REPLACE = 2;
pub const TBIF_DEFAULT = 0;
pub const TBIF_INTERNETBAR = 65536;
pub const TBIF_STANDARDTOOLBAR = 131072;
pub const TBIF_NOTOOLBAR = 196608;
pub const SFVM_REARRANGE = 1;
pub const SFVM_ADDOBJECT = 3;
pub const SFVM_REMOVEOBJECT = 6;
pub const SFVM_UPDATEOBJECT = 7;
pub const SFVM_GETSELECTEDOBJECTS = 9;
pub const SFVM_SETITEMPOS = 14;
pub const SFVM_SETCLIPBOARD = 16;
pub const SFVM_SETPOINTS = 23;
pub const GIL_OPENICON = 1;
pub const GIL_FORSHELL = 2;
pub const GIL_ASYNC = 32;
pub const GIL_DEFAULTICON = 64;
pub const GIL_FORSHORTCUT = 128;
pub const GIL_CHECKSHIELD = 512;
pub const GIL_SIMULATEDOC = 1;
pub const GIL_PERINSTANCE = 2;
pub const GIL_PERCLASS = 4;
pub const GIL_NOTFILENAME = 8;
pub const GIL_DONTCACHE = 16;
pub const GIL_SHIELD = 512;
pub const GIL_FORCENOSHIELD = 1024;
pub const SIOM_OVERLAYINDEX = 1;
pub const SIOM_ICONINDEX = 2;
pub const SIOM_RESERVED_SHARED = 0;
pub const SIOM_RESERVED_LINK = 1;
pub const SIOM_RESERVED_SLOWFILE = 2;
pub const SIOM_RESERVED_DEFAULT = 3;
pub const OI_DEFAULT = 0;
pub const OI_ASYNC = 4294962926;
pub const IDO_SHGIOI_SHARE = 268435455;
pub const IDO_SHGIOI_LINK = 268435454;
pub const IDO_SHGIOI_SLOWFILE = 4294967293;
pub const IDO_SHGIOI_DEFAULT = 4294967292;
pub const NT_CONSOLE_PROPS_SIG = 2684354562;
pub const NT_FE_CONSOLE_PROPS_SIG = 2684354564;
pub const EXP_DARWIN_ID_SIG = 2684354566;
pub const EXP_SPECIAL_FOLDER_SIG = 2684354565;
pub const EXP_SZ_LINK_SIG = 2684354561;
pub const EXP_SZ_ICON_SIG = 2684354567;
pub const EXP_PROPERTYSTORAGE_SIG = 2684354569;
pub const FCIDM_SHVIEWFIRST = 0;
pub const FCIDM_SHVIEWLAST = 32767;
pub const FCIDM_BROWSERFIRST = 40960;
pub const FCIDM_BROWSERLAST = 48896;
pub const FCIDM_GLOBALFIRST = 32768;
pub const FCIDM_GLOBALLAST = 40959;
pub const FCIDM_MENU_FILE = 32768;
pub const FCIDM_MENU_EDIT = 32832;
pub const FCIDM_MENU_VIEW = 32896;
pub const FCIDM_MENU_VIEW_SEP_OPTIONS = 32897;
pub const FCIDM_MENU_TOOLS = 32960;
pub const FCIDM_MENU_TOOLS_SEP_GOTO = 32961;
pub const FCIDM_MENU_HELP = 33024;
pub const FCIDM_MENU_FIND = 33088;
pub const FCIDM_MENU_EXPLORE = 33104;
pub const FCIDM_MENU_FAVORITES = 33136;
pub const OFASI_EDIT = 1;
pub const OFASI_OPENDESKTOP = 2;
pub const CSIDL_DESKTOP = 0;
pub const CSIDL_INTERNET = 1;
pub const CSIDL_PROGRAMS = 2;
pub const CSIDL_CONTROLS = 3;
pub const CSIDL_PRINTERS = 4;
pub const CSIDL_PERSONAL = 5;
pub const CSIDL_FAVORITES = 6;
pub const CSIDL_STARTUP = 7;
pub const CSIDL_RECENT = 8;
pub const CSIDL_SENDTO = 9;
pub const CSIDL_BITBUCKET = 10;
pub const CSIDL_STARTMENU = 11;
pub const CSIDL_MYDOCUMENTS = 5;
pub const CSIDL_MYMUSIC = 13;
pub const CSIDL_MYVIDEO = 14;
pub const CSIDL_DESKTOPDIRECTORY = 16;
pub const CSIDL_DRIVES = 17;
pub const CSIDL_NETWORK = 18;
pub const CSIDL_NETHOOD = 19;
pub const CSIDL_FONTS = 20;
pub const CSIDL_TEMPLATES = 21;
pub const CSIDL_COMMON_STARTMENU = 22;
pub const CSIDL_COMMON_PROGRAMS = 23;
pub const CSIDL_COMMON_STARTUP = 24;
pub const CSIDL_COMMON_DESKTOPDIRECTORY = 25;
pub const CSIDL_APPDATA = 26;
pub const CSIDL_PRINTHOOD = 27;
pub const CSIDL_LOCAL_APPDATA = 28;
pub const CSIDL_ALTSTARTUP = 29;
pub const CSIDL_COMMON_ALTSTARTUP = 30;
pub const CSIDL_COMMON_FAVORITES = 31;
pub const CSIDL_INTERNET_CACHE = 32;
pub const CSIDL_COOKIES = 33;
pub const CSIDL_HISTORY = 34;
pub const CSIDL_COMMON_APPDATA = 35;
pub const CSIDL_WINDOWS = 36;
pub const CSIDL_SYSTEM = 37;
pub const CSIDL_PROGRAM_FILES = 38;
pub const CSIDL_MYPICTURES = 39;
pub const CSIDL_PROFILE = 40;
pub const CSIDL_SYSTEMX86 = 41;
pub const CSIDL_PROGRAM_FILESX86 = 42;
pub const CSIDL_PROGRAM_FILES_COMMON = 43;
pub const CSIDL_PROGRAM_FILES_COMMONX86 = 44;
pub const CSIDL_COMMON_TEMPLATES = 45;
pub const CSIDL_COMMON_DOCUMENTS = 46;
pub const CSIDL_COMMON_ADMINTOOLS = 47;
pub const CSIDL_ADMINTOOLS = 48;
pub const CSIDL_CONNECTIONS = 49;
pub const CSIDL_COMMON_MUSIC = 53;
pub const CSIDL_COMMON_PICTURES = 54;
pub const CSIDL_COMMON_VIDEO = 55;
pub const CSIDL_RESOURCES = 56;
pub const CSIDL_RESOURCES_LOCALIZED = 57;
pub const CSIDL_COMMON_OEM_LINKS = 58;
pub const CSIDL_CDBURN_AREA = 59;
pub const CSIDL_COMPUTERSNEARME = 61;
pub const CSIDL_FLAG_CREATE = 32768;
pub const CSIDL_FLAG_DONT_VERIFY = 16384;
pub const CSIDL_FLAG_DONT_UNEXPAND = 8192;
pub const CSIDL_FLAG_NO_ALIAS = 4096;
pub const CSIDL_FLAG_PER_USER_INIT = 2048;
pub const CSIDL_FLAG_MASK = 65280;
pub const FCS_READ = 1;
pub const FCS_FORCEWRITE = 2;
pub const FCS_FLAG_DRAGDROP = 2;
pub const FCSM_VIEWID = 1;
pub const FCSM_WEBVIEWTEMPLATE = 2;
pub const FCSM_INFOTIP = 4;
pub const FCSM_CLSID = 8;
pub const FCSM_ICONFILE = 16;
pub const FCSM_LOGO = 32;
pub const FCSM_FLAGS = 64;
pub const BIF_RETURNONLYFSDIRS = 1;
pub const BIF_DONTGOBELOWDOMAIN = 2;
pub const BIF_STATUSTEXT = 4;
pub const BIF_RETURNFSANCESTORS = 8;
pub const BIF_EDITBOX = 16;
pub const BIF_VALIDATE = 32;
pub const BIF_NEWDIALOGSTYLE = 64;
pub const BIF_BROWSEINCLUDEURLS = 128;
pub const BIF_UAHINT = 256;
pub const BIF_NONEWFOLDERBUTTON = 512;
pub const BIF_NOTRANSLATETARGETS = 1024;
pub const BIF_BROWSEFORCOMPUTER = 4096;
pub const BIF_BROWSEFORPRINTER = 8192;
pub const BIF_BROWSEINCLUDEFILES = 16384;
pub const BIF_SHAREABLE = 32768;
pub const BIF_BROWSEFILEJUNCTIONS = 65536;
pub const BFFM_INITIALIZED = 1;
pub const BFFM_SELCHANGED = 2;
pub const BFFM_VALIDATEFAILEDA = 3;
pub const BFFM_VALIDATEFAILEDW = 4;
pub const BFFM_IUNKNOWN = 5;
pub const BFFM_SETSTATUSTEXTA = 1124;
pub const BFFM_ENABLEOK = 1125;
pub const BFFM_SETSELECTIONA = 1126;
pub const BFFM_SETSELECTIONW = 1127;
pub const BFFM_SETSTATUSTEXTW = 1128;
pub const BFFM_SETOKTEXT = 1129;
pub const BFFM_SETEXPANDED = 1130;
pub const BFFM_SETSTATUSTEXT = 1128;
pub const BFFM_SETSELECTION = 1127;
pub const BFFM_VALIDATEFAILED = 4;
pub const CMDID_INTSHORTCUTCREATE = 1;
pub const PROGDLG_NORMAL = 0;
pub const PROGDLG_MODAL = 1;
pub const PROGDLG_AUTOTIME = 2;
pub const PROGDLG_NOTIME = 4;
pub const PROGDLG_NOMINIMIZE = 8;
pub const PROGDLG_NOPROGRESSBAR = 16;
pub const PROGDLG_MARQUEEPROGRESS = 32;
pub const PROGDLG_NOCANCEL = 64;
pub const PDTIMER_RESET = 1;
pub const PDTIMER_PAUSE = 2;
pub const PDTIMER_RESUME = 3;
pub const COMPONENT_TOP = 1073741823;
pub const COMP_TYPE_HTMLDOC = 0;
pub const COMP_TYPE_PICTURE = 1;
pub const COMP_TYPE_WEBSITE = 2;
pub const COMP_TYPE_CONTROL = 3;
pub const COMP_TYPE_CFHTML = 4;
pub const COMP_TYPE_MAX = 4;
pub const IS_NORMAL = 1;
pub const IS_FULLSCREEN = 2;
pub const IS_SPLIT = 4;
pub const AD_APPLY_SAVE = 1;
pub const AD_APPLY_HTMLGEN = 2;
pub const AD_APPLY_REFRESH = 4;
pub const AD_APPLY_FORCE = 8;
pub const AD_APPLY_BUFFERED_REFRESH = 16;
pub const AD_APPLY_DYNAMICREFRESH = 32;
pub const AD_GETWP_BMP = 0;
pub const AD_GETWP_IMAGE = 1;
pub const AD_GETWP_LAST_APPLIED = 2;
pub const WPSTYLE_CENTER = 0;
pub const WPSTYLE_TILE = 1;
pub const WPSTYLE_STRETCH = 2;
pub const WPSTYLE_KEEPASPECT = 3;
pub const WPSTYLE_CROPTOFIT = 4;
pub const WPSTYLE_SPAN = 5;
pub const WPSTYLE_MAX = 6;
pub const COMP_ELEM_TYPE = 1;
pub const COMP_ELEM_CHECKED = 2;
pub const COMP_ELEM_DIRTY = 4;
pub const COMP_ELEM_NOSCROLL = 8;
pub const COMP_ELEM_POS_LEFT = 16;
pub const COMP_ELEM_POS_TOP = 32;
pub const COMP_ELEM_SIZE_WIDTH = 64;
pub const COMP_ELEM_SIZE_HEIGHT = 128;
pub const COMP_ELEM_POS_ZINDEX = 256;
pub const COMP_ELEM_SOURCE = 512;
pub const COMP_ELEM_FRIENDLYNAME = 1024;
pub const COMP_ELEM_SUBSCRIBEDURL = 2048;
pub const COMP_ELEM_ORIGINAL_CSI = 4096;
pub const COMP_ELEM_RESTORED_CSI = 8192;
pub const COMP_ELEM_CURITEMSTATE = 16384;
pub const ADDURL_SILENT = 1;
pub const COMPONENT_DEFAULT_LEFT = 65535;
pub const COMPONENT_DEFAULT_TOP = 65535;
pub const MAX_COLUMN_NAME_LEN = 80;
pub const MAX_COLUMN_DESC_LEN = 128;
pub const DVASPECT_SHORTNAME = 2;
pub const DVASPECT_COPY = 3;
pub const DVASPECT_LINK = 4;
pub const SHCNEE_ORDERCHANGED = 2;
pub const SHCNEE_MSI_CHANGE = 4;
pub const SHCNEE_MSI_UNINSTALL = 5;
pub const NUM_POINTS = 3;
pub const CABINETSTATE_VERSION = 2;
pub const PIFNAMESIZE = 30;
pub const PIFSTARTLOCSIZE = 63;
pub const PIFDEFPATHSIZE = 64;
pub const PIFPARAMSSIZE = 64;
pub const PIFSHPROGSIZE = 64;
pub const PIFSHDATASIZE = 64;
pub const PIFDEFFILESIZE = 80;
pub const PIFMAXFILEPATH = 260;
pub const QCMINFO_PLACE_BEFORE = 0;
pub const QCMINFO_PLACE_AFTER = 1;
pub const SFVSOC_INVALIDATE_ALL = 1;
pub const SFVSOC_NOSCROLL = 2;
pub const SHELLSTATEVERSION_IE4 = 9;
pub const SHELLSTATEVERSION_WIN2K = 10;
pub const SHPPFW_NONE = 0;
pub const SHPPFW_DIRCREATE = 1;
pub const SHPPFW_ASKDIRCREATE = 2;
pub const SHPPFW_IGNOREFILENAME = 4;
pub const SHPPFW_NOWRITECHECK = 8;
pub const SHPPFW_MEDIACHECKONLY = 16;
pub const CMF_NORMAL = 0;
pub const CMF_DEFAULTONLY = 1;
pub const CMF_VERBSONLY = 2;
pub const CMF_EXPLORE = 4;
pub const CMF_NOVERBS = 8;
pub const CMF_CANRENAME = 16;
pub const CMF_NODEFAULT = 32;
pub const CMF_INCLUDESTATIC = 64;
pub const CMF_ITEMMENU = 128;
pub const CMF_EXTENDEDVERBS = 256;
pub const CMF_DISABLEDVERBS = 512;
pub const CMF_ASYNCVERBSTATE = 1024;
pub const CMF_OPTIMIZEFORINVOKE = 2048;
pub const CMF_SYNCCASCADEMENU = 4096;
pub const CMF_DONOTPICKDEFAULT = 8192;
pub const CMF_RESERVED = 4294901760;
pub const GCS_VERBA = 0;
pub const GCS_HELPTEXTA = 1;
pub const GCS_VALIDATEA = 2;
pub const GCS_VERBW = 4;
pub const GCS_HELPTEXTW = 5;
pub const GCS_VALIDATEW = 6;
pub const GCS_VERBICONW = 20;
pub const GCS_UNICODE = 4;
pub const GCS_VERB = 4;
pub const GCS_HELPTEXT = 5;
pub const GCS_VALIDATE = 6;
pub const CMIC_MASK_SHIFT_DOWN = 268435456;
pub const CMIC_MASK_CONTROL_DOWN = 1073741824;
pub const CMIC_MASK_PTINVOKE = 536870912;
pub const IRTIR_TASK_NOT_RUNNING = 0;
pub const IRTIR_TASK_RUNNING = 1;
pub const IRTIR_TASK_SUSPENDED = 2;
pub const IRTIR_TASK_PENDING = 3;
pub const IRTIR_TASK_FINISHED = 4;
pub const ITSAT_DEFAULT_PRIORITY = 268435456;
pub const ITSAT_MAX_PRIORITY = 2147483647;
pub const ITSAT_MIN_PRIORITY = 0;
pub const ITSSFLAG_COMPLETE_ON_DESTROY = 0;
pub const ITSSFLAG_KILL_ON_DESTROY = 1;
pub const ITSSFLAG_FLAGS_MASK = 3;
pub const ITSS_THREAD_TIMEOUT_NO_CHANGE = 4294967294;
pub const CSIDL_FLAG_PFTI_TRACKTARGET = 16384;
pub const SHCIDS_ALLFIELDS = -2147483648;
pub const SHCIDS_CANONICALONLY = 268435456;
pub const SHCIDS_BITMASK = -65536;
pub const SHCIDS_COLUMNMASK = 65535;
pub const BIND_INTERRUPTABLE = 4294967295;
pub const CDBOSC_SETFOCUS = 0;
pub const CDBOSC_KILLFOCUS = 1;
pub const CDBOSC_SELCHANGE = 2;
pub const CDBOSC_RENAME = 3;
pub const CDBOSC_STATECHANGE = 4;
pub const CDB2N_CONTEXTMENU_DONE = 1;
pub const CDB2N_CONTEXTMENU_START = 2;
pub const CDB2GVF_SHOWALLFILES = 1;
pub const CDB2GVF_ISFILESAVE = 2;
pub const CDB2GVF_ALLOWPREVIEWPANE = 4;
pub const CDB2GVF_NOSELECTVERB = 8;
pub const CDB2GVF_NOINCLUDEITEM = 16;
pub const CDB2GVF_ISFOLDERPICKER = 32;
pub const CDB2GVF_ADDSHIELD = 64;
pub const SBSP_DEFBROWSER = 0;
pub const SBSP_SAMEBROWSER = 1;
pub const SBSP_NEWBROWSER = 2;
pub const SBSP_DEFMODE = 0;
pub const SBSP_OPENMODE = 16;
pub const SBSP_EXPLOREMODE = 32;
pub const SBSP_HELPMODE = 64;
pub const SBSP_NOTRANSFERHIST = 128;
pub const SBSP_ABSOLUTE = 0;
pub const SBSP_RELATIVE = 4096;
pub const SBSP_PARENT = 8192;
pub const SBSP_NAVIGATEBACK = 16384;
pub const SBSP_NAVIGATEFORWARD = 32768;
pub const SBSP_ALLOW_AUTONAVIGATE = 65536;
pub const SBSP_KEEPSAMETEMPLATE = 131072;
pub const SBSP_KEEPWORDWHEELTEXT = 262144;
pub const SBSP_ACTIVATE_NOFOCUS = 524288;
pub const SBSP_CREATENOHISTORY = 1048576;
pub const SBSP_PLAYNOSOUND = 2097152;
pub const SBSP_CALLERUNTRUSTED = 8388608;
pub const SBSP_TRUSTFIRSTDOWNLOAD = 16777216;
pub const SBSP_UNTRUSTEDFORDOWNLOAD = 33554432;
pub const SBSP_NOAUTOSELECT = 67108864;
pub const SBSP_WRITENOHISTORY = 134217728;
pub const SBSP_TRUSTEDFORACTIVEX = 268435456;
pub const SBSP_FEEDNAVIGATION = 536870912;
pub const SBSP_REDIRECT = 1073741824;
pub const SBSP_INITIATEDBYHLINKFRAME = 2147483648;
pub const FCW_STATUS = 1;
pub const FCW_TOOLBAR = 2;
pub const FCW_TREE = 3;
pub const FCW_INTERNETBAR = 6;
pub const FCW_PROGRESS = 8;
pub const FCT_MERGE = 1;
pub const FCT_CONFIGABLE = 2;
pub const FCT_ADDTOEND = 4;
pub const ARCONTENT_AUTORUNINF = 2;
pub const ARCONTENT_AUDIOCD = 4;
pub const ARCONTENT_DVDMOVIE = 8;
pub const ARCONTENT_BLANKCD = 16;
pub const ARCONTENT_BLANKDVD = 32;
pub const ARCONTENT_UNKNOWNCONTENT = 64;
pub const ARCONTENT_AUTOPLAYPIX = 128;
pub const ARCONTENT_AUTOPLAYMUSIC = 256;
pub const ARCONTENT_AUTOPLAYVIDEO = 512;
pub const ARCONTENT_VCD = 1024;
pub const ARCONTENT_SVCD = 2048;
pub const ARCONTENT_DVDAUDIO = 4096;
pub const ARCONTENT_BLANKBD = 8192;
pub const ARCONTENT_BLURAY = 16384;
pub const ARCONTENT_CAMERASTORAGE = 32768;
pub const ARCONTENT_CUSTOMEVENT = 65536;
pub const ARCONTENT_NONE = 0;
pub const ARCONTENT_MASK = 131070;
pub const ARCONTENT_PHASE_UNKNOWN = 0;
pub const ARCONTENT_PHASE_PRESNIFF = 268435456;
pub const ARCONTENT_PHASE_SNIFFING = 536870912;
pub const ARCONTENT_PHASE_FINAL = 1073741824;
pub const ARCONTENT_PHASE_MASK = 1879048192;
pub const IEI_PRIORITY_MAX = 2147483647;
pub const IEI_PRIORITY_MIN = 0;
pub const IEIT_PRIORITY_NORMAL = 268435456;
pub const IEIFLAG_ASYNC = 1;
pub const IEIFLAG_CACHE = 2;
pub const IEIFLAG_ASPECT = 4;
pub const IEIFLAG_OFFLINE = 8;
pub const IEIFLAG_GLEAM = 16;
pub const IEIFLAG_SCREEN = 32;
pub const IEIFLAG_ORIGSIZE = 64;
pub const IEIFLAG_NOSTAMP = 128;
pub const IEIFLAG_NOBORDER = 256;
pub const IEIFLAG_QUALITY = 512;
pub const IEIFLAG_REFRESH = 1024;
pub const DBIM_MINSIZE = 1;
pub const DBIM_MAXSIZE = 2;
pub const DBIM_INTEGRAL = 4;
pub const DBIM_ACTUAL = 8;
pub const DBIM_TITLE = 16;
pub const DBIM_MODEFLAGS = 32;
pub const DBIM_BKCOLOR = 64;
pub const DBIMF_NORMAL = 0;
pub const DBIMF_FIXED = 1;
pub const DBIMF_FIXEDBMP = 4;
pub const DBIMF_VARIABLEHEIGHT = 8;
pub const DBIMF_UNDELETEABLE = 16;
pub const DBIMF_DEBOSSED = 32;
pub const DBIMF_BKCOLOR = 64;
pub const DBIMF_USECHEVRON = 128;
pub const DBIMF_BREAK = 256;
pub const DBIMF_ADDTOFRONT = 512;
pub const DBIMF_TOPALIGN = 1024;
pub const DBIMF_NOGRIPPER = 2048;
pub const DBIMF_ALWAYSGRIPPER = 4096;
pub const DBIMF_NOMARGINS = 8192;
pub const DBIF_VIEWMODE_NORMAL = 0;
pub const DBIF_VIEWMODE_VERTICAL = 1;
pub const DBIF_VIEWMODE_FLOATING = 2;
pub const DBIF_VIEWMODE_TRANSPARENT = 4;
pub const DBPC_SELECTFIRST = 4294967295;
pub const THBN_CLICKED = 6144;
pub const BSIM_STATE = 1;
pub const BSIM_STYLE = 2;
pub const BSSF_VISIBLE = 1;
pub const BSSF_NOTITLE = 2;
pub const BSSF_UNDELETEABLE = 4096;
pub const BSIS_AUTOGRIPPER = 0;
pub const BSIS_NOGRIPPER = 1;
pub const BSIS_ALWAYSGRIPPER = 2;
pub const BSIS_LEFTALIGN = 4;
pub const BSIS_SINGLECLICK = 8;
pub const BSIS_NOCONTEXTMENU = 16;
pub const BSIS_NODROPTARGET = 32;
pub const BSIS_NOCAPTION = 64;
pub const BSIS_PREFERNOLINEBREAK = 128;
pub const BSIS_LOCKED = 256;
pub const BSIS_PRESERVEORDERDURINGLAYOUT = 512;
pub const BSIS_FIXEDORDER = 1024;
pub const OF_CAP_CANSWITCHTO = 1;
pub const OF_CAP_CANCLOSE = 2;
pub const SMDM_SHELLFOLDER = 1;
pub const SMDM_HMENU = 2;
pub const SMDM_TOOLBAR = 4;
pub const SMC_INITMENU = 1;
pub const SMC_CREATE = 2;
pub const SMC_EXITMENU = 3;
pub const SMC_GETINFO = 5;
pub const SMC_GETSFINFO = 6;
pub const SMC_GETOBJECT = 7;
pub const SMC_GETSFOBJECT = 8;
pub const SMC_SFEXEC = 9;
pub const SMC_SFSELECTITEM = 10;
pub const SMC_REFRESH = 16;
pub const SMC_DEMOTE = 17;
pub const SMC_PROMOTE = 18;
pub const SMC_DEFAULTICON = 22;
pub const SMC_NEWITEM = 23;
pub const SMC_CHEVRONEXPAND = 25;
pub const SMC_DISPLAYCHEVRONTIP = 42;
pub const SMC_SETSFOBJECT = 45;
pub const SMC_SHCHANGENOTIFY = 46;
pub const SMC_CHEVRONGETTIP = 47;
pub const SMC_SFDDRESTRICTED = 48;
pub const SMC_SFEXEC_MIDDLE = 49;
pub const SMC_GETAUTOEXPANDSTATE = 65;
pub const SMC_AUTOEXPANDCHANGE = 66;
pub const SMC_GETCONTEXTMENUMODIFIER = 67;
pub const SMC_GETBKCONTEXTMENU = 68;
pub const SMC_OPEN = 69;
pub const SMAE_EXPANDED = 1;
pub const SMAE_CONTRACTED = 2;
pub const SMAE_USER = 4;
pub const SMAE_VALID = 7;
pub const SMINIT_DEFAULT = 0;
pub const SMINIT_RESTRICT_DRAGDROP = 2;
pub const SMINIT_TOPLEVEL = 4;
pub const SMINIT_CACHED = 16;
pub const SMINIT_AUTOEXPAND = 256;
pub const SMINIT_AUTOTOOLTIP = 512;
pub const SMINIT_DROPONCONTAINER = 1024;
pub const SMINIT_VERTICAL = 268435456;
pub const SMINIT_HORIZONTAL = 536870912;
pub const SMSET_TOP = 268435456;
pub const SMSET_BOTTOM = 536870912;
pub const SMSET_DONTOWN = 1;
pub const SMINV_REFRESH = 1;
pub const SMINV_ID = 8;
pub const E_PREVIEWHANDLER_DRM_FAIL = -2042494975;
pub const E_PREVIEWHANDLER_NOAUTH = -2042494974;
pub const E_PREVIEWHANDLER_NOTFOUND = -2042494973;
pub const E_PREVIEWHANDLER_CORRUPT = -2042494972;
pub const ISIOI_ICONFILE = 1;
pub const ISIOI_ICONINDEX = 2;
pub const ABM_NEW = 0;
pub const ABM_REMOVE = 1;
pub const ABM_QUERYPOS = 2;
pub const ABM_SETPOS = 3;
pub const ABM_GETSTATE = 4;
pub const ABM_GETTASKBARPOS = 5;
pub const ABM_ACTIVATE = 6;
pub const ABM_GETAUTOHIDEBAR = 7;
pub const ABM_SETAUTOHIDEBAR = 8;
pub const ABM_WINDOWPOSCHANGED = 9;
pub const ABM_SETSTATE = 10;
pub const ABM_GETAUTOHIDEBAREX = 11;
pub const ABM_SETAUTOHIDEBAREX = 12;
pub const ABN_STATECHANGE = 0;
pub const ABN_POSCHANGED = 1;
pub const ABN_FULLSCREENAPP = 2;
pub const ABN_WINDOWARRANGE = 3;
pub const ABS_AUTOHIDE = 1;
pub const ABS_ALWAYSONTOP = 2;
pub const ABE_LEFT = 0;
pub const ABE_TOP = 1;
pub const ABE_RIGHT = 2;
pub const ABE_BOTTOM = 3;
pub const FO_MOVE = 1;
pub const FO_COPY = 2;
pub const FO_DELETE = 3;
pub const FO_RENAME = 4;
pub const PO_DELETE = 19;
pub const PO_RENAME = 20;
pub const PO_PORTCHANGE = 32;
pub const PO_REN_PORT = 52;
pub const SE_ERR_FNF = 2;
pub const SE_ERR_PNF = 3;
pub const SE_ERR_ACCESSDENIED = 5;
pub const SE_ERR_OOM = 8;
pub const SE_ERR_DLLNOTFOUND = 32;
pub const SE_ERR_SHARE = 26;
pub const SE_ERR_ASSOCINCOMPLETE = 27;
pub const SE_ERR_DDETIMEOUT = 28;
pub const SE_ERR_DDEFAIL = 29;
pub const SE_ERR_DDEBUSY = 30;
pub const SE_ERR_NOASSOC = 31;
pub const SEE_MASK_DEFAULT = 0;
pub const SEE_MASK_CLASSNAME = 1;
pub const SEE_MASK_CLASSKEY = 3;
pub const SEE_MASK_IDLIST = 4;
pub const SEE_MASK_INVOKEIDLIST = 12;
pub const SEE_MASK_ICON = 16;
pub const SEE_MASK_HOTKEY = 32;
pub const SEE_MASK_NOCLOSEPROCESS = 64;
pub const SEE_MASK_CONNECTNETDRV = 128;
pub const SEE_MASK_NOASYNC = 256;
pub const SEE_MASK_FLAG_DDEWAIT = 256;
pub const SEE_MASK_DOENVSUBST = 512;
pub const SEE_MASK_FLAG_NO_UI = 1024;
pub const SEE_MASK_UNICODE = 16384;
pub const SEE_MASK_NO_CONSOLE = 32768;
pub const SEE_MASK_ASYNCOK = 1048576;
pub const SEE_MASK_HMONITOR = 2097152;
pub const SEE_MASK_NOZONECHECKS = 8388608;
pub const SEE_MASK_NOQUERYCLASSSTORE = 16777216;
pub const SEE_MASK_WAITFORINPUTIDLE = 33554432;
pub const SEE_MASK_FLAG_LOG_USAGE = 67108864;
pub const SEE_MASK_FLAG_HINST_IS_SITE = 134217728;
pub const SHERB_NOCONFIRMATION = 1;
pub const SHERB_NOPROGRESSUI = 2;
pub const SHERB_NOSOUND = 4;
pub const NIN_SELECT = 1024;
pub const NINF_KEY = 1;
pub const NIN_BALLOONSHOW = 1026;
pub const NIN_BALLOONHIDE = 1027;
pub const NIN_BALLOONTIMEOUT = 1028;
pub const NIN_BALLOONUSERCLICK = 1029;
pub const NIN_POPUPOPEN = 1030;
pub const NIN_POPUPCLOSE = 1031;
pub const NOTIFYICON_VERSION = 3;
pub const NOTIFYICON_VERSION_4 = 4;
pub const SHGNLI_PIDL = 1;
pub const SHGNLI_PREFIXNAME = 2;
pub const SHGNLI_NOUNIQUE = 4;
pub const SHGNLI_NOLNK = 8;
pub const SHGNLI_NOLOCNAME = 16;
pub const SHGNLI_USEURLEXT = 32;
pub const PRINTACTION_OPEN = 0;
pub const PRINTACTION_PROPERTIES = 1;
pub const PRINTACTION_NETINSTALL = 2;
pub const PRINTACTION_NETINSTALLLINK = 3;
pub const PRINTACTION_TESTPAGE = 4;
pub const PRINTACTION_OPENNETPRN = 5;
pub const PRINTACTION_DOCUMENTDEFAULTS = 6;
pub const PRINTACTION_SERVERPROPERTIES = 7;
pub const PRINT_PROP_FORCE_NAME = 1;
pub const OFFLINE_STATUS_LOCAL = 1;
pub const OFFLINE_STATUS_REMOTE = 2;
pub const OFFLINE_STATUS_INCOMPLETE = 4;
pub const SHIL_LARGE = 0;
pub const SHIL_SMALL = 1;
pub const SHIL_EXTRALARGE = 2;
pub const SHIL_SYSSMALL = 3;
pub const SHIL_JUMBO = 4;
pub const SHIL_LAST = 4;
pub const NCM_GETADDRESS = 1025;
pub const NCM_SETALLOWTYPE = 1026;
pub const NCM_GETALLOWTYPE = 1027;
pub const NCM_DISPLAYERRORTIP = 1028;
pub const CREDENTIAL_PROVIDER_NO_DEFAULT = 4294967295;
pub const MAX_SYNCMGR_ID = 64;
pub const MAX_SYNCMGR_PROGRESSTEXT = 260;
pub const MAX_SYNCMGR_NAME = 128;
pub const STIF_DEFAULT = 0;
pub const STIF_SUPPORT_HEX = 1;
pub const GCT_INVALID = 0;
pub const GCT_LFNCHAR = 1;
pub const GCT_SHORTCHAR = 2;
pub const GCT_WILD = 4;
pub const GCT_SEPARATOR = 8;
pub const PMSF_NORMAL = 0;
pub const PMSF_MULTIPLE = 1;
pub const PMSF_DONT_STRIP_SPACES = 65536;
pub const URL_UNESCAPE = 268435456;
pub const URL_ESCAPE_UNSAFE = 536870912;
pub const URL_PLUGGABLE_PROTOCOL = 1073741824;
pub const URL_WININET_COMPATIBILITY = 2147483648;
pub const URL_DONT_ESCAPE_EXTRA_INFO = 33554432;
pub const URL_DONT_UNESCAPE_EXTRA_INFO = 33554432;
pub const URL_BROWSER_MODE = 33554432;
pub const URL_ESCAPE_SPACES_ONLY = 67108864;
pub const URL_DONT_SIMPLIFY = 134217728;
pub const URL_NO_META = 134217728;
pub const URL_UNESCAPE_INPLACE = 1048576;
pub const URL_CONVERT_IF_DOSPATH = 2097152;
pub const URL_UNESCAPE_HIGH_ANSI_ONLY = 4194304;
pub const URL_INTERNAL_PATH = 8388608;
pub const URL_FILE_USE_PATHURL = 65536;
pub const URL_DONT_UNESCAPE = 131072;
pub const URL_ESCAPE_AS_UTF8 = 262144;
pub const URL_UNESCAPE_AS_UTF8 = 262144;
pub const URL_ESCAPE_ASCII_URI_COMPONENT = 524288;
pub const URL_UNESCAPE_URI_COMPONENT = 262144;
pub const URL_ESCAPE_PERCENT = 4096;
pub const URL_ESCAPE_SEGMENT_ONLY = 8192;
pub const URL_PARTFLAG_KEEPSCHEME = 1;
pub const URL_APPLY_DEFAULT = 1;
pub const URL_APPLY_GUESSSCHEME = 2;
pub const URL_APPLY_GUESSFILE = 4;
pub const URL_APPLY_FORCEAPPLY = 8;
pub const SRRF_RT_REG_NONE = 1;
pub const SRRF_RT_REG_SZ = 2;
pub const SRRF_RT_REG_EXPAND_SZ = 4;
pub const SRRF_RT_REG_BINARY = 8;
pub const SRRF_RT_REG_DWORD = 16;
pub const SRRF_RT_REG_MULTI_SZ = 32;
pub const SRRF_RT_REG_QWORD = 64;
pub const SRRF_RT_ANY = 65535;
pub const SRRF_RM_ANY = 0;
pub const SRRF_RM_NORMAL = 65536;
pub const SRRF_RM_SAFE = 131072;
pub const SRRF_RM_SAFENETWORK = 262144;
pub const SRRF_NOEXPAND = 268435456;
pub const SRRF_ZEROONFAILURE = 536870912;
pub const SRRF_NOVIRT = 1073741824;
pub const SHREGSET_HKCU = 1;
pub const SHREGSET_FORCE_HKCU = 2;
pub const SHREGSET_HKLM = 4;
pub const SHREGSET_FORCE_HKLM = 8;
pub const SPMODE_SHELL = 1;
pub const SPMODE_DEBUGOUT = 2;
pub const SPMODE_TEST = 4;
pub const SPMODE_BROWSER = 8;
pub const SPMODE_FLUSH = 16;
pub const SPMODE_EVENT = 32;
pub const SPMODE_MSVM = 64;
pub const SPMODE_FORMATTEXT = 128;
pub const SPMODE_PROFILE = 256;
pub const SPMODE_DEBUGBREAK = 512;
pub const SPMODE_MSGTRACE = 1024;
pub const SPMODE_PERFTAGS = 2048;
pub const SPMODE_MEMWATCH = 4096;
pub const SPMODE_DBMON = 8192;
pub const SPMODE_MULTISTOP = 16384;
pub const SPMODE_EVENTTRACE = 32768;
pub const SHGVSPB_PERUSER = 1;
pub const SHGVSPB_ALLUSERS = 2;
pub const SHGVSPB_PERFOLDER = 4;
pub const SHGVSPB_ALLFOLDERS = 8;
pub const SHGVSPB_INHERIT = 16;
pub const SHGVSPB_ROAM = 32;
pub const SHGVSPB_NOAUTODEFAULTS = 2147483648;
pub const FDTF_SHORTTIME = 1;
pub const FDTF_SHORTDATE = 2;
pub const FDTF_LONGDATE = 4;
pub const FDTF_LONGTIME = 8;
pub const FDTF_RELATIVE = 16;
pub const FDTF_LTRDATE = 256;
pub const FDTF_RTLDATE = 512;
pub const FDTF_NOAUTOREADINGORDER = 1024;
pub const PLATFORM_UNKNOWN = 0;
pub const PLATFORM_IE3 = 1;
pub const PLATFORM_BROWSERONLY = 1;
pub const PLATFORM_INTEGRATED = 2;
pub const ILMM_IE4 = 0;
pub const DLLVER_PLATFORM_WINDOWS = 1;
pub const DLLVER_PLATFORM_NT = 2;
pub const DLLVER_MAJOR_MASK = 18446462598732840960;
pub const DLLVER_MINOR_MASK = 281470681743360;
pub const DLLVER_BUILD_MASK = 4294901760;
pub const DLLVER_QFE_MASK = 65535;
pub const WTS_E_FAILEDEXTRACTION = -2147175936;
pub const WTS_E_EXTRACTIONTIMEDOUT = -2147175935;
pub const WTS_E_SURROGATEUNAVAILABLE = -2147175934;
pub const WTS_E_FASTEXTRACTIONNOTSUPPORTED = -2147175933;
pub const WTS_E_DATAFILEUNAVAILABLE = -2147175932;
pub const WTS_E_EXTRACTIONPENDING = -2147175931;
pub const WTS_E_EXTRACTIONBLOCKED = -2147175930;
pub const WTS_E_NOSTORAGEPROVIDERTHUMBNAILHANDLER = -2147175929;
pub const SHIMGDEC_DEFAULT = 0;
pub const SHIMGDEC_THUMBNAIL = 1;
pub const SHIMGDEC_LOADFULL = 2;
pub const E_NOTVALIDFORANIMATEDIMAGE = -2147221503;
pub const S_SYNCMGR_MISSINGITEMS = 262657;
pub const S_SYNCMGR_RETRYSYNC = 262658;
pub const S_SYNCMGR_CANCELITEM = 262659;
pub const S_SYNCMGR_CANCELALL = 262660;
pub const S_SYNCMGR_ITEMDELETED = 262672;
pub const S_SYNCMGR_ENUMITEMS = 262673;
pub const SYNCMGRPROGRESSITEM_STATUSTEXT = 1;
pub const SYNCMGRPROGRESSITEM_STATUSTYPE = 2;
pub const SYNCMGRPROGRESSITEM_PROGVALUE = 4;
pub const SYNCMGRPROGRESSITEM_MAXVALUE = 8;
pub const SYNCMGRLOGERROR_ERRORFLAGS = 1;
pub const SYNCMGRLOGERROR_ERRORID = 2;
pub const SYNCMGRLOGERROR_ITEMID = 4;
pub const SYNCMGRITEM_ITEMFLAGMASK = 127;
pub const MAX_SYNCMGRITEMNAME = 128;
pub const SYNCMGRHANDLERFLAG_MASK = 15;
pub const MAX_SYNCMGRHANDLERNAME = 32;
pub const SYNCMGRREGISTERFLAGS_MASK = 7;
pub const TLOG_BACK = -1;
pub const TLOG_CURRENT = 0;
pub const TLOG_FORE = 1;
pub const TLMENUF_INCLUDECURRENT = 1;
pub const TLMENUF_BACK = 16;
pub const TLMENUF_FORE = 32;
pub const BSF_REGISTERASDROPTARGET = 1;
pub const BSF_THEATERMODE = 2;
pub const BSF_NOLOCALFILEWARNING = 16;
pub const BSF_UISETBYAUTOMATION = 256;
pub const BSF_RESIZABLE = 512;
pub const BSF_CANMAXIMIZE = 1024;
pub const BSF_TOPBROWSER = 2048;
pub const BSF_NAVNOHISTORY = 4096;
pub const BSF_HTMLNAVCANCELED = 8192;
pub const BSF_DONTSHOWNAVCANCELPAGE = 16384;
pub const BSF_SETNAVIGATABLECODEPAGE = 32768;
pub const BSF_DELEGATEDNAVIGATION = 65536;
pub const BSF_TRUSTEDFORACTIVEX = 131072;
pub const BSF_MERGEDMENUS = 262144;
pub const BSF_FEEDNAVIGATION = 524288;
pub const BSF_FEEDSUBSCRIBED = 1048576;
pub const HLNF_CALLERUNTRUSTED = 2097152;
pub const HLNF_TRUSTEDFORACTIVEX = 4194304;
pub const HLNF_DISABLEWINDOWRESTRICTIONS = 8388608;
pub const HLNF_TRUSTFIRSTDOWNLOAD = 16777216;
pub const HLNF_UNTRUSTEDFORDOWNLOAD = 33554432;
pub const SHHLNF_NOAUTOSELECT = 67108864;
pub const SHHLNF_WRITENOHISTORY = 134217728;
pub const HLNF_EXTERNALNAVIGATE = 268435456;
pub const HLNF_ALLOW_AUTONAVIGATE = 536870912;
pub const HLNF_NEWWINDOWSMANAGED = 2147483648;
pub const INTERNET_MAX_PATH_LENGTH = 2048;
pub const INTERNET_MAX_SCHEME_LENGTH = 32;
pub const VIEW_PRIORITY_RESTRICTED = 112;
pub const VIEW_PRIORITY_CACHEHIT = 80;
pub const VIEW_PRIORITY_STALECACHEHIT = 69;
pub const VIEW_PRIORITY_USEASDEFAULT = 67;
pub const VIEW_PRIORITY_SHELLEXT = 64;
pub const VIEW_PRIORITY_CACHEMISS = 48;
pub const VIEW_PRIORITY_INHERIT = 32;
pub const VIEW_PRIORITY_SHELLEXT_ASBACKUP = 21;
pub const VIEW_PRIORITY_DESPERATE = 16;
pub const VIEW_PRIORITY_NONE = 0;
pub const PATHCCH_MAX_CCH = 32768;
pub const IDS_DESCRIPTION = 1;
pub const ID_APP = 100;
pub const DLG_SCRNSAVECONFIGURE = 2003;
pub const idsIsPassword = 1000;
pub const idsIniFile = 1001;
pub const idsScreenSaver = 1002;
pub const idsPassword = 1003;
pub const idsDifferentPW = 1004;
pub const idsChangePW = 1005;
pub const idsBadOldPW = 1006;
pub const idsAppName = 1007;
pub const idsNoHelpMemory = 1008;
pub const idsHelpFile = 1009;
pub const idsDefKeyword = 1010;
pub const MAXFILELEN = 13;
pub const TITLEBARNAMELEN = 40;
pub const APPNAMEBUFFERLEN = 40;
pub const BUFFLEN = 255;
pub const SCRM_VERIFYPW = 32768;
pub const E_FLAGS = -2147217408;
pub const IS_E_EXEC_FAILED = -2147213310;
pub const URL_E_INVALID_SYNTAX = -2147217407;
pub const URL_E_UNREGISTERED_PROTOCOL = -2147217406;
pub const CPLPAGE_MOUSE_BUTTONS = 1;
pub const CPLPAGE_MOUSE_PTRMOTION = 2;
pub const CPLPAGE_MOUSE_WHEEL = 3;
pub const CPLPAGE_KEYBOARD_SPEED = 1;
pub const CPLPAGE_DISPLAY_BACKGROUND = 1;
pub const DISPID_SELECTIONCHANGED = 200;
pub const DISPID_FILELISTENUMDONE = 201;
pub const DISPID_VERBINVOKED = 202;
pub const DISPID_DEFAULTVERBINVOKED = 203;
pub const DISPID_BEGINDRAG = 204;
pub const DISPID_VIEWMODECHANGED = 205;
pub const DISPID_NOITEMSTATE_CHANGED = 206;
pub const DISPID_CONTENTSCHANGED = 207;
pub const DISPID_FOCUSCHANGED = 208;
pub const DISPID_CHECKSTATECHANGED = 209;
pub const DISPID_ORDERCHANGED = 210;
pub const DISPID_VIEWPAINTDONE = 211;
pub const DISPID_COLUMNSCHANGED = 212;
pub const DISPID_CTRLMOUSEWHEEL = 213;
pub const DISPID_SORTDONE = 214;
pub const DISPID_ICONSIZECHANGED = 215;
pub const DISPID_FOLDERCHANGED = 217;
pub const DISPID_FILTERINVOKED = 218;
pub const DISPID_WORDWHEELEDITED = 219;
pub const DISPID_SELECTEDITEMCHANGED = 220;
pub const DISPID_EXPLORERWINDOWREADY = 221;
pub const DISPID_UPDATEIMAGE = 222;
pub const DISPID_INITIALENUMERATIONDONE = 223;
pub const DISPID_ENTERPRISEIDCHANGED = 224;
pub const DISPID_ENTERPRESSED = 200;
pub const DISPID_SEARCHCOMMAND_START = 1;
pub const DISPID_SEARCHCOMMAND_COMPLETE = 2;
pub const DISPID_SEARCHCOMMAND_ABORT = 3;
pub const DISPID_SEARCHCOMMAND_UPDATE = 4;
pub const DISPID_SEARCHCOMMAND_PROGRESSTEXT = 5;
pub const DISPID_SEARCHCOMMAND_ERROR = 6;
pub const DISPID_SEARCHCOMMAND_RESTORE = 7;
pub const DISPID_IADCCTL_DIRTY = 256;
pub const DISPID_IADCCTL_PUBCAT = 257;
pub const DISPID_IADCCTL_SORT = 258;
pub const DISPID_IADCCTL_FORCEX86 = 259;
pub const DISPID_IADCCTL_SHOWPOSTSETUP = 260;
pub const DISPID_IADCCTL_ONDOMAIN = 261;
pub const DISPID_IADCCTL_DEFAULTCAT = 262;
pub const COPYENGINE_S_YES = 2555905;
pub const COPYENGINE_S_NOT_HANDLED = 2555907;
pub const COPYENGINE_S_USER_RETRY = 2555908;
pub const COPYENGINE_S_USER_IGNORED = 2555909;
pub const COPYENGINE_S_MERGE = 2555910;
pub const COPYENGINE_S_DONT_PROCESS_CHILDREN = 2555912;
pub const COPYENGINE_S_ALREADY_DONE = 2555914;
pub const COPYENGINE_S_PENDING = 2555915;
pub const COPYENGINE_S_KEEP_BOTH = 2555916;
pub const COPYENGINE_S_CLOSE_PROGRAM = 2555917;
pub const COPYENGINE_S_COLLISIONRESOLVED = 2555918;
pub const COPYENGINE_S_PROGRESS_PAUSE = 2555919;
pub const COPYENGINE_S_PENDING_DELETE = 2555920;
pub const COPYENGINE_S_PENDING_BATCH_COPY = 2555921;
pub const COPYENGINE_E_USER_CANCELLED = -2144927744;
pub const COPYENGINE_E_CANCELLED = -2144927743;
pub const COPYENGINE_E_REQUIRES_ELEVATION = -2144927742;
pub const COPYENGINE_E_SAME_FILE = -2144927741;
pub const COPYENGINE_E_DIFF_DIR = -2144927740;
pub const COPYENGINE_E_MANY_SRC_1_DEST = -2144927739;
pub const COPYENGINE_E_DEST_SUBTREE = -2144927735;
pub const COPYENGINE_E_DEST_SAME_TREE = -2144927734;
pub const COPYENGINE_E_FLD_IS_FILE_DEST = -2144927733;
pub const COPYENGINE_E_FILE_IS_FLD_DEST = -2144927732;
pub const COPYENGINE_E_FILE_TOO_LARGE = -2144927731;
pub const COPYENGINE_E_REMOVABLE_FULL = -2144927730;
pub const COPYENGINE_E_DEST_IS_RO_CD = -2144927729;
pub const COPYENGINE_E_DEST_IS_RW_CD = -2144927728;
pub const COPYENGINE_E_DEST_IS_R_CD = -2144927727;
pub const COPYENGINE_E_DEST_IS_RO_DVD = -2144927726;
pub const COPYENGINE_E_DEST_IS_RW_DVD = -2144927725;
pub const COPYENGINE_E_DEST_IS_R_DVD = -2144927724;
pub const COPYENGINE_E_SRC_IS_RO_CD = -2144927723;
pub const COPYENGINE_E_SRC_IS_RW_CD = -2144927722;
pub const COPYENGINE_E_SRC_IS_R_CD = -2144927721;
pub const COPYENGINE_E_SRC_IS_RO_DVD = -2144927720;
pub const COPYENGINE_E_SRC_IS_RW_DVD = -2144927719;
pub const COPYENGINE_E_SRC_IS_R_DVD = -2144927718;
pub const COPYENGINE_E_INVALID_FILES_SRC = -2144927717;
pub const COPYENGINE_E_INVALID_FILES_DEST = -2144927716;
pub const COPYENGINE_E_PATH_TOO_DEEP_SRC = -2144927715;
pub const COPYENGINE_E_PATH_TOO_DEEP_DEST = -2144927714;
pub const COPYENGINE_E_ROOT_DIR_SRC = -2144927713;
pub const COPYENGINE_E_ROOT_DIR_DEST = -2144927712;
pub const COPYENGINE_E_ACCESS_DENIED_SRC = -2144927711;
pub const COPYENGINE_E_ACCESS_DENIED_DEST = -2144927710;
pub const COPYENGINE_E_PATH_NOT_FOUND_SRC = -2144927709;
pub const COPYENGINE_E_PATH_NOT_FOUND_DEST = -2144927708;
pub const COPYENGINE_E_NET_DISCONNECT_SRC = -2144927707;
pub const COPYENGINE_E_NET_DISCONNECT_DEST = -2144927706;
pub const COPYENGINE_E_SHARING_VIOLATION_SRC = -2144927705;
pub const COPYENGINE_E_SHARING_VIOLATION_DEST = -2144927704;
pub const COPYENGINE_E_ALREADY_EXISTS_NORMAL = -2144927703;
pub const COPYENGINE_E_ALREADY_EXISTS_READONLY = -2144927702;
pub const COPYENGINE_E_ALREADY_EXISTS_SYSTEM = -2144927701;
pub const COPYENGINE_E_ALREADY_EXISTS_FOLDER = -2144927700;
pub const COPYENGINE_E_STREAM_LOSS = -2144927699;
pub const COPYENGINE_E_EA_LOSS = -2144927698;
pub const COPYENGINE_E_PROPERTY_LOSS = -2144927697;
pub const COPYENGINE_E_PROPERTIES_LOSS = -2144927696;
pub const COPYENGINE_E_ENCRYPTION_LOSS = -2144927695;
pub const COPYENGINE_E_DISK_FULL = -2144927694;
pub const COPYENGINE_E_DISK_FULL_CLEAN = -2144927693;
pub const COPYENGINE_E_EA_NOT_SUPPORTED = -2144927692;
pub const COPYENGINE_E_CANT_REACH_SOURCE = -2144927691;
pub const COPYENGINE_E_RECYCLE_UNKNOWN_ERROR = -2144927691;
pub const COPYENGINE_E_RECYCLE_FORCE_NUKE = -2144927690;
pub const COPYENGINE_E_RECYCLE_SIZE_TOO_BIG = -2144927689;
pub const COPYENGINE_E_RECYCLE_PATH_TOO_LONG = -2144927688;
pub const COPYENGINE_E_RECYCLE_BIN_NOT_FOUND = -2144927686;
pub const COPYENGINE_E_NEWFILE_NAME_TOO_LONG = -2144927685;
pub const COPYENGINE_E_NEWFOLDER_NAME_TOO_LONG = -2144927684;
pub const COPYENGINE_E_DIR_NOT_EMPTY = -2144927683;
pub const COPYENGINE_E_FAT_MAX_IN_ROOT = -2144927682;
pub const COPYENGINE_E_ACCESSDENIED_READONLY = -2144927681;
pub const COPYENGINE_E_REDIRECTED_TO_WEBPAGE = -2144927680;
pub const COPYENGINE_E_SERVER_BAD_FILE_TYPE = -2144927679;
pub const COPYENGINE_E_INTERNET_ITEM_UNAVAILABLE = -2144927678;
pub const COPYENGINE_E_CANNOT_MOVE_FROM_RECYCLE_BIN = -2144927677;
pub const COPYENGINE_E_CANNOT_MOVE_SHARED_FOLDER = -2144927676;
pub const COPYENGINE_E_INTERNET_ITEM_STORAGE_PROVIDER_ERROR = -2144927675;
pub const COPYENGINE_E_INTERNET_ITEM_STORAGE_PROVIDER_PAUSED = -2144927674;
pub const COPYENGINE_E_REQUIRES_EDP_CONSENT = -2144927673;
pub const COPYENGINE_E_BLOCKED_BY_EDP_POLICY = -2144927672;
pub const COPYENGINE_E_REQUIRES_EDP_CONSENT_FOR_REMOVABLE_DRIVE = -2144927671;
pub const COPYENGINE_E_BLOCKED_BY_EDP_FOR_REMOVABLE_DRIVE = -2144927670;
pub const COPYENGINE_E_RMS_REQUIRES_EDP_CONSENT_FOR_REMOVABLE_DRIVE = -2144927669;
pub const COPYENGINE_E_RMS_BLOCKED_BY_EDP_FOR_REMOVABLE_DRIVE = -2144927668;
pub const COPYENGINE_E_WARNED_BY_DLP_POLICY = -2144927667;
pub const COPYENGINE_E_BLOCKED_BY_DLP_POLICY = -2144927666;
pub const COPYENGINE_E_SILENT_FAIL_BY_DLP_POLICY = -2144927665;
pub const COPYENGINE_E_SUPPRESS_DIALOG = -2144927664;
pub const NETCACHE_E_NEGATIVE_CACHE = -2144927488;
pub const EXECUTE_E_LAUNCH_APPLICATION = -2144927487;
pub const SHELL_E_WRONG_BITDEPTH = -2144927486;
pub const LINK_E_DELETE = -2144927485;
pub const STORE_E_NEWER_VERSION_AVAILABLE = -2144927484;
pub const E_FILE_PLACEHOLDER_NOT_INITIALIZED = -2144927472;
pub const E_FILE_PLACEHOLDER_VERSION_MISMATCH = -2144927471;
pub const E_FILE_PLACEHOLDER_SERVER_TIMED_OUT = -2144927470;
pub const E_FILE_PLACEHOLDER_STORAGEPROVIDER_NOT_FOUND = -2144927469;
pub const CAMERAROLL_E_NO_DOWNSAMPLING_REQUIRED = -2144927456;
pub const E_ACTIVATIONDENIED_USERCLOSE = -2144927440;
pub const E_ACTIVATIONDENIED_SHELLERROR = -2144927439;
pub const E_ACTIVATIONDENIED_SHELLRESTART = -2144927438;
pub const E_ACTIVATIONDENIED_UNEXPECTED = -2144927437;
pub const E_ACTIVATIONDENIED_SHELLNOTREADY = -2144927436;
pub const LIBRARY_E_NO_SAVE_LOCATION = -2144927232;
pub const LIBRARY_E_NO_ACCESSIBLE_LOCATION = -2144927231;
pub const E_USERTILE_UNSUPPORTEDFILETYPE = -2144927216;
pub const E_USERTILE_CHANGEDISABLED = -2144927215;
pub const E_USERTILE_LARGEORDYNAMIC = -2144927214;
pub const E_USERTILE_VIDEOFRAMESIZE = -2144927213;
pub const E_USERTILE_FILESIZE = -2144927212;
pub const IMM_ACC_DOCKING_E_INSUFFICIENTHEIGHT = -2144927184;
pub const IMM_ACC_DOCKING_E_DOCKOCCUPIED = -2144927183;
pub const IMSC_E_SHELL_COMPONENT_STARTUP_FAILURE = -2144927181;
pub const SHC_E_SHELL_COMPONENT_STARTUP_FAILURE = -2144927180;
pub const E_TILE_NOTIFICATIONS_PLATFORM_FAILURE = -2144927159;
pub const E_SHELL_EXTENSION_BLOCKED = -2144926975;
pub const E_IMAGEFEED_CHANGEDISABLED = -2144926960;
pub const ISHCUTCMDID_DOWNLOADICON = 0;
pub const ISHCUTCMDID_INTSHORTCUTCREATE = 1;
pub const ISHCUTCMDID_COMMITHISTORY = 2;
pub const ISHCUTCMDID_SETUSERAWURL = 3;
pub const SFBID_PIDLCHANGED = 0;
pub const DBCID_EMPTY = 0;
pub const DBCID_ONDRAG = 1;
pub const DBCID_CLSIDOFBAR = 2;
pub const DBCID_RESIZE = 3;
pub const DBCID_GETBAR = 4;
pub const DBCID_UPDATESIZE = 5;
pub const BMICON_LARGE = 0;
pub const BMICON_SMALL = 1;
pub const CTF_INSIST = 1;
pub const CTF_THREAD_REF = 2;
pub const CTF_PROCESS_REF = 4;
pub const CTF_COINIT_STA = 8;
pub const CTF_COINIT = 8;
pub const CTF_FREELIBANDEXIT = 16;
pub const CTF_REF_COUNTED = 32;
pub const CTF_WAIT_ALLOWCOM = 64;
pub const CTF_UNUSED = 128;
pub const CTF_INHERITWOW64 = 256;
pub const CTF_WAIT_NO_REENTRANCY = 512;
pub const CTF_KEYBOARD_LOCALE = 1024;
pub const CTF_OLEINITIALIZE = 2048;
pub const CTF_COINIT_MTA = 4096;
pub const CTF_NOADDREFLIB = 8192;
pub const SHGFI_ADDOVERLAYS = 32;
pub const SHGFI_ATTR_SPECIFIED = 131072;
pub const SHGFI_ATTRIBUTES = 2048;
pub const SHGFI_DISPLAYNAME = 512;
pub const SHGFI_EXETYPE = 8192;
pub const SHGFI_ICON = 256;
pub const SHGFI_ICONLOCATION = 4096;
pub const SHGFI_LARGEICON = 0;
pub const SHGFI_LINKOVERLAY = 32768;
pub const SHGFI_OPENICON = 2;
pub const SHGFI_OVERLAYINDEX = 64;
pub const SHGFI_PIDL = 8;
pub const SHGFI_SELECTED = 65536;
pub const SHGFI_SHELLICONSIZE = 4;
pub const SHGFI_SMALLICON = 1;
pub const SHGFI_SYSICONINDEX = 16384;
pub const SHGFI_TYPENAME = 1024;
pub const SHGFI_USEFILEATTRIBUTES = 16;
pub const SHCNE_RENAMEITEM = 1;
pub const SHCNE_CREATE = 2;
pub const SHCNE_DELETE = 4;
pub const SHCNE_MKDIR = 8;
pub const SHCNE_RMDIR = 16;
pub const SHCNE_MEDIAINSERTED = 32;
pub const SHCNE_MEDIAREMOVED = 64;
pub const SHCNE_DRIVEREMOVED = 128;
pub const SHCNE_DRIVEADD = 256;
pub const SHCNE_NETSHARE = 512;
pub const SHCNE_NETUNSHARE = 1024;
pub const SHCNE_ATTRIBUTES = 2048;
pub const SHCNE_UPDATEDIR = 4096;
pub const SHCNE_UPDATEITEM = 8192;
pub const SHCNE_SERVERDISCONNECT = 16384;
pub const SHCNE_UPDATEIMAGE = 32768;
pub const SHCNE_DRIVEADDGUI = 65536;
pub const SHCNE_RENAMEFOLDER = 131072;
pub const SHCNE_FREESPACE = 262144;
pub const SHCNE_EXTENDED_EVENT = 67108864;
pub const SHCNE_ASSOCCHANGED = 134217728;
pub const SHCNE_DISKEVENTS = 145439;
pub const SHCNE_GLOBALEVENTS = 201687520;
pub const SHCNE_ALLEVENTS = 2147483647;
pub const SHCNE_INTERRUPT = 2147483648;
pub const SHCNRF_InterruptLevel = 1;
pub const SHCNRF_ShellLevel = 2;
pub const SHCNRF_RecursiveInterrupt = 4096;
pub const SHCNRF_NewDelivery = 32768;
pub const SHCNF_IDLIST = 0;
pub const SHCNF_PATHA = 1;
pub const SHCNF_PRINTERA = 2;
pub const SHCNF_DWORD = 3;
pub const SHCNF_PATHW = 5;
pub const SHCNF_PRINTERW = 6;
pub const SHCNF_TYPE = 255;
pub const SHCNF_FLUSH = 4096;
pub const SHCNF_FLUSHNOWAIT = 12288;
pub const SHCNF_NOTIFYRECURSIVE = 65536;
pub const SHCNF_PATH = 5;
pub const SHCNF_PRINTER = 6;
pub const QITIPF_DEFAULT = 0;
pub const QITIPF_USENAME = 1;
pub const QITIPF_LINKNOTARGET = 2;
pub const QITIPF_LINKUSETARGET = 4;
pub const QITIPF_USESLOWTIP = 8;
pub const QITIPF_SINGLELINE = 16;
pub const QIF_CACHED = 1;
pub const QIF_DONTEXPANDFOLDER = 2;
pub const SHDID_ROOT_REGITEM = 1;
pub const SHDID_FS_FILE = 2;
pub const SHDID_FS_DIRECTORY = 3;
pub const SHDID_FS_OTHER = 4;
pub const SHDID_COMPUTER_DRIVE35 = 5;
pub const SHDID_COMPUTER_DRIVE525 = 6;
pub const SHDID_COMPUTER_REMOVABLE = 7;
pub const SHDID_COMPUTER_FIXED = 8;
pub const SHDID_COMPUTER_NETDRIVE = 9;
pub const SHDID_COMPUTER_CDROM = 10;
pub const SHDID_COMPUTER_RAMDISK = 11;
pub const SHDID_COMPUTER_OTHER = 12;
pub const SHDID_NET_DOMAIN = 13;
pub const SHDID_NET_SERVER = 14;
pub const SHDID_NET_SHARE = 15;
pub const SHDID_NET_RESTOFNET = 16;
pub const SHDID_NET_OTHER = 17;
pub const SHDID_COMPUTER_IMAGING = 18;
pub const SHDID_COMPUTER_AUDIO = 19;
pub const SHDID_COMPUTER_SHAREDDOCS = 20;
pub const SHDID_MOBILE_DEVICE = 21;
pub const SHDID_REMOTE_DESKTOP_DRIVE = 22;
pub const SHGDFIL_FINDDATA = 1;
pub const SHGDFIL_NETRESOURCE = 2;
pub const SHGDFIL_DESCRIPTIONID = 3;
pub const PRF_VERIFYEXISTS = 1;
pub const PRF_TRYPROGRAMEXTENSIONS = 3;
pub const PRF_FIRSTDIRDEF = 4;
pub const PRF_DONTFINDLNK = 8;
pub const PRF_REQUIREABSOLUTE = 16;
pub const PCS_FATAL = 2147483648;
pub const PCS_REPLACEDCHAR = 1;
pub const PCS_REMOVEDCHAR = 2;
pub const PCS_TRUNCATED = 4;
pub const PCS_PATHTOOLONG = 8;
pub const MM_ADDSEPARATOR = 1;
pub const MM_SUBMENUSHAVEIDS = 2;
pub const MM_DONTREMOVESEPS = 4;
pub const SHOP_PRINTERNAME = 1;
pub const SHOP_FILEPATH = 2;
pub const SHOP_VOLUMEGUID = 4;
pub const SHFMT_ID_DEFAULT = 65535;
pub const SHFMT_OPT_NONE = 0;
pub const SHFMT_OPT_FULL = 1;
pub const SHFMT_OPT_SYSONLY = 2;
pub const SHFMT_ERROR = 4294967295;
pub const SHFMT_CANCEL = 4294967294;
pub const SHFMT_NOFORMAT = 4294967293;
pub const VALIDATEUNC_CONNECT = 1;
pub const VALIDATEUNC_NOUI = 2;
pub const VALIDATEUNC_PRINT = 4;
pub const VALIDATEUNC_PERSIST = 8;
pub const VALIDATEUNC_VALID = 15;
pub const SFVM_MERGEMENU = 1;
pub const SFVM_INVOKECOMMAND = 2;
pub const SFVM_GETHELPTEXT = 3;
pub const SFVM_GETTOOLTIPTEXT = 4;
pub const SFVM_GETBUTTONINFO = 5;
pub const SFVM_GETBUTTONS = 6;
pub const SFVM_INITMENUPOPUP = 7;
pub const SFVM_FSNOTIFY = 14;
pub const SFVM_WINDOWCREATED = 15;
pub const SFVM_GETDETAILSOF = 23;
pub const SFVM_COLUMNCLICK = 24;
pub const SFVM_QUERYFSNOTIFY = 25;
pub const SFVM_DEFITEMCOUNT = 26;
pub const SFVM_DEFVIEWMODE = 27;
pub const SFVM_UNMERGEMENU = 28;
pub const SFVM_UPDATESTATUSBAR = 31;
pub const SFVM_BACKGROUNDENUM = 32;
pub const SFVM_DIDDRAGDROP = 36;
pub const SFVM_SETISFV = 39;
pub const SFVM_THISIDLIST = 41;
pub const SFVM_ADDPROPERTYPAGES = 47;
pub const SFVM_BACKGROUNDENUMDONE = 48;
pub const SFVM_GETNOTIFY = 49;
pub const SFVM_GETSORTDEFAULTS = 53;
pub const SFVM_SIZE = 57;
pub const SFVM_GETZONE = 58;
pub const SFVM_GETPANE = 59;
pub const SFVM_GETHELPTOPIC = 63;
pub const SFVM_GETANIMATION = 68;
pub const SFVS_SELECT_NONE = 0;
pub const SFVS_SELECT_ALLITEMS = 1;
pub const SFVS_SELECT_INVERT = 2;
pub const DFM_MERGECONTEXTMENU = 1;
pub const DFM_INVOKECOMMAND = 2;
pub const DFM_GETHELPTEXT = 5;
pub const DFM_WM_MEASUREITEM = 6;
pub const DFM_WM_DRAWITEM = 7;
pub const DFM_WM_INITMENUPOPUP = 8;
pub const DFM_VALIDATECMD = 9;
pub const DFM_MERGECONTEXTMENU_TOP = 10;
pub const DFM_GETHELPTEXTW = 11;
pub const DFM_INVOKECOMMANDEX = 12;
pub const DFM_MAPCOMMANDNAME = 13;
pub const DFM_GETDEFSTATICID = 14;
pub const DFM_GETVERBW = 15;
pub const DFM_GETVERBA = 16;
pub const DFM_MERGECONTEXTMENU_BOTTOM = 17;
pub const DFM_MODIFYQCMFLAGS = 18;
pub const DFM_CMD_DELETE = -1;
pub const DFM_CMD_MOVE = -2;
pub const DFM_CMD_COPY = -3;
pub const DFM_CMD_LINK = -4;
pub const DFM_CMD_PROPERTIES = -5;
pub const DFM_CMD_NEWFOLDER = -6;
pub const DFM_CMD_PASTE = -7;
pub const DFM_CMD_VIEWLIST = -8;
pub const DFM_CMD_VIEWDETAILS = -9;
pub const DFM_CMD_PASTELINK = -10;
pub const DFM_CMD_PASTESPECIAL = -11;
pub const DFM_CMD_MODALPROP = -12;
pub const DFM_CMD_RENAME = -13;
pub const PID_IS_URL = 2;
pub const PID_IS_NAME = 4;
pub const PID_IS_WORKINGDIR = 5;
pub const PID_IS_HOTKEY = 6;
pub const PID_IS_SHOWCMD = 7;
pub const PID_IS_ICONINDEX = 8;
pub const PID_IS_ICONFILE = 9;
pub const PID_IS_WHATSNEW = 10;
pub const PID_IS_AUTHOR = 11;
pub const PID_IS_DESCRIPTION = 12;
pub const PID_IS_COMMENT = 13;
pub const PID_IS_ROAMED = 15;
pub const PID_INTSITE_WHATSNEW = 2;
pub const PID_INTSITE_AUTHOR = 3;
pub const PID_INTSITE_LASTVISIT = 4;
pub const PID_INTSITE_LASTMOD = 5;
pub const PID_INTSITE_VISITCOUNT = 6;
pub const PID_INTSITE_DESCRIPTION = 7;
pub const PID_INTSITE_COMMENT = 8;
pub const PID_INTSITE_FLAGS = 9;
pub const PID_INTSITE_CONTENTLEN = 10;
pub const PID_INTSITE_CONTENTCODE = 11;
pub const PID_INTSITE_RECURSE = 12;
pub const PID_INTSITE_WATCH = 13;
pub const PID_INTSITE_SUBSCRIPTION = 14;
pub const PID_INTSITE_URL = 15;
pub const PID_INTSITE_TITLE = 16;
pub const PID_INTSITE_CODEPAGE = 18;
pub const PID_INTSITE_TRACKING = 19;
pub const PID_INTSITE_ICONINDEX = 20;
pub const PID_INTSITE_ICONFILE = 21;
pub const PID_INTSITE_ROAMED = 34;
pub const PIDISF_RECENTLYCHANGED = 1;
pub const PIDISF_CACHEDSTICKY = 2;
pub const PIDISF_CACHEIMAGES = 16;
pub const PIDISF_FOLLOWALLLINKS = 32;
pub const PIDISM_GLOBAL = 0;
pub const PIDISM_WATCH = 1;
pub const PIDISM_DONTWATCH = 2;
pub const PIDISR_UP_TO_DATE = 0;
pub const PIDISR_NEEDS_ADD = 1;
pub const PIDISR_NEEDS_UPDATE = 2;
pub const PIDISR_NEEDS_DELETE = 3;
pub const SSF_SHOWALLOBJECTS = 1;
pub const SSF_SHOWEXTENSIONS = 2;
pub const SSF_HIDDENFILEEXTS = 4;
pub const SSF_SERVERADMINUI = 4;
pub const SSF_SHOWCOMPCOLOR = 8;
pub const SSF_SORTCOLUMNS = 16;
pub const SSF_SHOWSYSFILES = 32;
pub const SSF_DOUBLECLICKINWEBVIEW = 128;
pub const SSF_SHOWATTRIBCOL = 256;
pub const SSF_DESKTOPHTML = 512;
pub const SSF_WIN95CLASSIC = 1024;
pub const SSF_DONTPRETTYPATH = 2048;
pub const SSF_SHOWINFOTIP = 8192;
pub const SSF_MAPNETDRVBUTTON = 4096;
pub const SSF_NOCONFIRMRECYCLE = 32768;
pub const SSF_HIDEICONS = 16384;
pub const SSF_FILTER = 65536;
pub const SSF_WEBVIEW = 131072;
pub const SSF_SHOWSUPERHIDDEN = 262144;
pub const SSF_SEPPROCESS = 524288;
pub const SSF_NONETCRAWLING = 1048576;
pub const SSF_STARTPANELON = 2097152;
pub const SSF_SHOWSTARTPAGE = 4194304;
pub const SSF_AUTOCHECKSELECT = 8388608;
pub const SSF_ICONSONLY = 16777216;
pub const SSF_SHOWTYPEOVERLAY = 33554432;
pub const SSF_SHOWSTATUSBAR = 67108864;
pub const ASSOCF_NONE = 0;
pub const ASSOCF_INIT_NOREMAPCLSID = 1;
pub const ASSOCF_INIT_BYEXENAME = 2;
pub const ASSOCF_OPEN_BYEXENAME = 2;
pub const ASSOCF_INIT_DEFAULTTOSTAR = 4;
pub const ASSOCF_INIT_DEFAULTTOFOLDER = 8;
pub const ASSOCF_NOUSERSETTINGS = 16;
pub const ASSOCF_NOTRUNCATE = 32;
pub const ASSOCF_VERIFY = 64;
pub const ASSOCF_REMAPRUNDLL = 128;
pub const ASSOCF_NOFIXUPS = 256;
pub const ASSOCF_IGNOREBASECLASS = 512;
pub const ASSOCF_INIT_IGNOREUNKNOWN = 1024;
pub const ASSOCF_INIT_FIXED_PROGID = 2048;
pub const ASSOCF_IS_PROTOCOL = 4096;
pub const ASSOCF_INIT_FOR_FILE = 8192;
pub const ASSOCF_IS_FULL_URI = 16384;
pub const ASSOCF_PER_MACHINE_ONLY = 32768;
pub const ASSOCF_APP_TO_APP = 65536;
pub const NIM_ADD = 0;
pub const NIM_MODIFY = 1;
pub const NIM_DELETE = 2;
pub const NIM_SETFOCUS = 3;
pub const NIM_SETVERSION = 4;
pub const NIF_MESSAGE = 1;
pub const NIF_ICON = 2;
pub const NIF_TIP = 4;
pub const NIF_STATE = 8;
pub const NIF_INFO = 16;
pub const NIF_GUID = 32;
pub const NIF_REALTIME = 64;
pub const NIF_SHOWTIP = 128;
pub const OS_WINDOWS = 0;
pub const OS_NT = 1;
pub const OS_WIN95ORGREATER = 2;
pub const OS_NT4ORGREATER = 3;
pub const OS_WIN98ORGREATER = 5;
pub const OS_WIN98_GOLD = 6;
pub const OS_WIN2000ORGREATER = 7;
pub const OS_WIN2000PRO = 8;
pub const OS_WIN2000SERVER = 9;
pub const OS_WIN2000ADVSERVER = 10;
pub const OS_WIN2000DATACENTER = 11;
pub const OS_WIN2000TERMINAL = 12;
pub const OS_EMBEDDED = 13;
pub const OS_TERMINALCLIENT = 14;
pub const OS_TERMINALREMOTEADMIN = 15;
pub const OS_WIN95_GOLD = 16;
pub const OS_MEORGREATER = 17;
pub const OS_XPORGREATER = 18;
pub const OS_HOME = 19;
pub const OS_PROFESSIONAL = 20;
pub const OS_DATACENTER = 21;
pub const OS_ADVSERVER = 22;
pub const OS_SERVER = 23;
pub const OS_TERMINALSERVER = 24;
pub const OS_PERSONALTERMINALSERVER = 25;
pub const OS_FASTUSERSWITCHING = 26;
pub const OS_WELCOMELOGONUI = 27;
pub const OS_DOMAINMEMBER = 28;
pub const OS_ANYSERVER = 29;
pub const OS_WOW6432 = 30;
pub const OS_WEBSERVER = 31;
pub const OS_SMALLBUSINESSSERVER = 32;
pub const OS_TABLETPC = 33;
pub const OS_SERVERADMINUI = 34;
pub const OS_MEDIACENTER = 35;
pub const OS_APPLIANCE = 36;
pub const SHACF_DEFAULT = 0;
pub const SHACF_FILESYSTEM = 1;
pub const SHACF_URLALL = 6;
pub const SHACF_URLHISTORY = 2;
pub const SHACF_URLMRU = 4;
pub const SHACF_USETAB = 8;
pub const SHACF_FILESYS_ONLY = 16;
pub const SHACF_FILESYS_DIRS = 32;
pub const SHACF_VIRTUAL_NAMESPACE = 64;
pub const SHACF_AUTOSUGGEST_FORCE_ON = 268435456;
pub const SHACF_AUTOSUGGEST_FORCE_OFF = 536870912;
pub const SHACF_AUTOAPPEND_FORCE_ON = 1073741824;
pub const SHACF_AUTOAPPEND_FORCE_OFF = 2147483648;
pub const HELPINFO_WINDOW = 1;
pub const HELPINFO_MENUITEM = 2;
pub const NIIF_NONE = 0;
pub const NIIF_INFO = 1;
pub const NIIF_WARNING = 2;
pub const NIIF_ERROR = 3;
pub const NIIF_USER = 4;
pub const NIIF_ICON_MASK = 15;
pub const NIIF_NOSOUND = 16;
pub const NIIF_LARGE_ICON = 32;
pub const NIIF_RESPECT_QUIET_TIME = 128;
pub const NIS_HIDDEN = 1;
pub const NIS_SHAREDICON = 2;
pub const GPFIDL_DEFAULT = 0;
pub const GPFIDL_ALTNAME = 1;
pub const GPFIDL_UNCPRINTER = 2;
pub const SHGSI_ICONLOCATION = 0;
pub const SHGSI_ICON = 256;
pub const SHGSI_SYSICONINDEX = 16384;
pub const SHGSI_LINKOVERLAY = 32768;
pub const SHGSI_SELECTED = 65536;
pub const SHGSI_LARGEICON = 0;
pub const SHGSI_SMALLICON = 1;
pub const SHGSI_SHELLICONSIZE = 4;
pub const FOFX_NOSKIPJUNCTIONS = 65536;
pub const FOFX_PREFERHARDLINK = 131072;
pub const FOFX_SHOWELEVATIONPROMPT = 262144;
pub const FOFX_RECYCLEONDELETE = 524288;
pub const FOFX_EARLYFAILURE = 1048576;
pub const FOFX_PRESERVEFILEEXTENSIONS = 2097152;
pub const FOFX_KEEPNEWERFILE = 4194304;
pub const FOFX_NOCOPYHOOKS = 8388608;
pub const FOFX_NOMINIMIZEBOX = 16777216;
pub const FOFX_MOVEACLSACROSSVOLUMES = 33554432;
pub const FOFX_DONTDISPLAYSOURCEPATH = 67108864;
pub const FOFX_DONTDISPLAYDESTPATH = 134217728;
pub const FOFX_REQUIREELEVATION = 268435456;
pub const FOFX_ADDUNDORECORD = 536870912;
pub const FOFX_COPYASDOWNLOAD = 1073741824;
pub const FOFX_DONTDISPLAYLOCATIONS = 2147483648;
pub const FOF_MULTIDESTFILES = 1;
pub const FOF_CONFIRMMOUSE = 2;
pub const FOF_SILENT = 4;
pub const FOF_RENAMEONCOLLISION = 8;
pub const FOF_NOCONFIRMATION = 16;
pub const FOF_WANTMAPPINGHANDLE = 32;
pub const FOF_ALLOWUNDO = 64;
pub const FOF_FILESONLY = 128;
pub const FOF_SIMPLEPROGRESS = 256;
pub const FOF_NOCONFIRMMKDIR = 512;
pub const FOF_NOERRORUI = 1024;
pub const FOF_NOCOPYSECURITYATTRIBS = 2048;
pub const FOF_NORECURSION = 4096;
pub const FOF_NO_CONNECTED_ELEMENTS = 8192;
pub const FOF_WANTNUKEWARNING = 16384;
pub const FOF_NORECURSEREPARSE = 32768;
pub const FOF_NO_UI = 1556;
pub const SHGDN_NORMAL = 0;
pub const SHGDN_INFOLDER = 1;
pub const SHGDN_FOREDITING = 4096;
pub const SHGDN_FORADDRESSBAR = 16384;
pub const SHGDN_FORPARSING = 32768;
pub const SHCONTF_CHECKING_FOR_CHILDREN = 16;
pub const SHCONTF_FOLDERS = 32;
pub const SHCONTF_NONFOLDERS = 64;
pub const SHCONTF_INCLUDEHIDDEN = 128;
pub const SHCONTF_INIT_ON_FIRST_NEXT = 256;
pub const SHCONTF_NETPRINTERSRCH = 512;
pub const SHCONTF_SHAREABLE = 1024;
pub const SHCONTF_STORAGE = 2048;
pub const SHCONTF_NAVIGATION_ENUM = 4096;
pub const SHCONTF_FASTITEMS = 8192;
pub const SHCONTF_FLATLIST = 16384;
pub const SHCONTF_ENABLE_ASYNC = 32768;
pub const SHCONTF_INCLUDESUPERHIDDEN = 65536;
pub const SPFF_NONE = 0;
pub const SPFF_DOWNLOAD_BY_DEFAULT = 1;
pub const SPFF_CREATED_ON_THIS_DEVICE = 2;
pub const MUS_COMPLETE = 0;
pub const MUS_USERINPUTNEEDED = 1;
pub const MUS_FAILED = 2;
pub const FEM_VIEWRESULT = 0;
pub const FEM_NAVIGATION = 1;
pub const FWF_NONE = 0;
pub const FWF_AUTOARRANGE = 1;
pub const FWF_ABBREVIATEDNAMES = 2;
pub const FWF_SNAPTOGRID = 4;
pub const FWF_OWNERDATA = 8;
pub const FWF_BESTFITWINDOW = 16;
pub const FWF_DESKTOP = 32;
pub const FWF_SINGLESEL = 64;
pub const FWF_NOSUBFOLDERS = 128;
pub const FWF_TRANSPARENT = 256;
pub const FWF_NOCLIENTEDGE = 512;
pub const FWF_NOSCROLL = 1024;
pub const FWF_ALIGNLEFT = 2048;
pub const FWF_NOICONS = 4096;
pub const FWF_SHOWSELALWAYS = 8192;
pub const FWF_NOVISIBLE = 16384;
pub const FWF_SINGLECLICKACTIVATE = 32768;
pub const FWF_NOWEBVIEW = 65536;
pub const FWF_HIDEFILENAMES = 131072;
pub const FWF_CHECKSELECT = 262144;
pub const FWF_NOENUMREFRESH = 524288;
pub const FWF_NOGROUPING = 1048576;
pub const FWF_FULLROWSELECT = 2097152;
pub const FWF_NOFILTERS = 4194304;
pub const FWF_NOCOLUMNHEADER = 8388608;
pub const FWF_NOHEADERINALLVIEWS = 16777216;
pub const FWF_EXTENDEDTILES = 33554432;
pub const FWF_TRICHECKSELECT = 67108864;
pub const FWF_AUTOCHECKSELECT = 134217728;
pub const FWF_NOBROWSERVIEWSTATE = 268435456;
pub const FWF_SUBSETGROUPS = 536870912;
pub const FWF_USESEARCHFOLDER = 1073741824;
pub const FWF_ALLOWRTLREADING = -2147483648;
pub const FVM_AUTO = -1;
pub const FVM_FIRST = 1;
pub const FVM_ICON = 1;
pub const FVM_SMALLICON = 2;
pub const FVM_LIST = 3;
pub const FVM_DETAILS = 4;
pub const FVM_THUMBNAIL = 5;
pub const FVM_TILE = 6;
pub const FVM_THUMBSTRIP = 7;
pub const FVM_CONTENT = 8;
pub const FVM_LAST = 8;
pub const FLVM_UNSPECIFIED = -1;
pub const FLVM_FIRST = 1;
pub const FLVM_DETAILS = 1;
pub const FLVM_TILES = 2;
pub const FLVM_ICONS = 3;
pub const FLVM_LIST = 4;
pub const FLVM_CONTENT = 5;
pub const FLVM_LAST = 5;
pub const SVSI_DESELECT = 0;
pub const SVSI_SELECT = 1;
pub const SVSI_EDIT = 3;
pub const SVSI_DESELECTOTHERS = 4;
pub const SVSI_ENSUREVISIBLE = 8;
pub const SVSI_FOCUSED = 16;
pub const SVSI_TRANSLATEPT = 32;
pub const SVSI_SELECTIONMARK = 64;
pub const SVSI_POSITIONITEM = 128;
pub const SVSI_CHECK = 256;
pub const SVSI_CHECK2 = 512;
pub const SVSI_KEYBOARDSELECT = 1025;
pub const SVSI_NOTAKEFOCUS = 1073741824;
pub const SVGIO_BACKGROUND = 0;
pub const SVGIO_SELECTION = 1;
pub const SVGIO_ALLVIEW = 2;
pub const SVGIO_CHECKED = 3;
pub const SVGIO_TYPE_MASK = 15;
pub const SVGIO_FLAG_VIEWORDER = -2147483648;
pub const SVUIA_DEACTIVATE = 0;
pub const SVUIA_ACTIVATE_NOFOCUS = 1;
pub const SVUIA_ACTIVATE_FOCUS = 2;
pub const SVUIA_INPLACEACTIVATE = 3;
pub const SORT_DESCENDING = -1;
pub const SORT_ASCENDING = 1;
pub const FVST_EMPTYTEXT = 0;
pub const CM_MASK_WIDTH = 1;
pub const CM_MASK_DEFAULTWIDTH = 2;
pub const CM_MASK_IDEALWIDTH = 4;
pub const CM_MASK_NAME = 8;
pub const CM_MASK_STATE = 16;
pub const CM_STATE_NONE = 0;
pub const CM_STATE_VISIBLE = 1;
pub const CM_STATE_FIXEDWIDTH = 2;
pub const CM_STATE_NOSORTBYFOLDERNESS = 4;
pub const CM_STATE_ALWAYSVISIBLE = 8;
pub const CM_ENUM_ALL = 1;
pub const CM_ENUM_VISIBLE = 2;
pub const CM_WIDTH_USEDEFAULT = -1;
pub const CM_WIDTH_AUTOSIZE = -2;
pub const SIGDN_NORMALDISPLAY = 0;
pub const SIGDN_PARENTRELATIVEPARSING = -2147385343;
pub const SIGDN_DESKTOPABSOLUTEPARSING = -2147319808;
pub const SIGDN_PARENTRELATIVEEDITING = -2147282943;
pub const SIGDN_DESKTOPABSOLUTEEDITING = -2147172352;
pub const SIGDN_FILESYSPATH = -2147123200;
pub const SIGDN_URL = -2147057664;
pub const SIGDN_PARENTRELATIVEFORADDRESSBAR = -2146975743;
pub const SIGDN_PARENTRELATIVE = -2146959359;
pub const SIGDN_PARENTRELATIVEFORUI = -2146877439;
pub const SICHINT_DISPLAY = 0;
pub const SICHINT_ALLFIELDS = -2147483648;
pub const SICHINT_CANONICAL = 268435456;
pub const SICHINT_TEST_FILESYSPATH_IF_NOT_EQUAL = 536870912;
pub const DOGIF_DEFAULT = 0;
pub const DOGIF_TRAVERSE_LINK = 1;
pub const DOGIF_NO_HDROP = 2;
pub const DOGIF_NO_URL = 4;
pub const DOGIF_ONLY_IF_ONE = 8;
pub const SIIGBF_RESIZETOFIT = 0;
pub const SIIGBF_BIGGERSIZEOK = 1;
pub const SIIGBF_MEMORYONLY = 2;
pub const SIIGBF_ICONONLY = 4;
pub const SIIGBF_THUMBNAILONLY = 8;
pub const SIIGBF_INCACHEONLY = 16;
pub const SIIGBF_CROPTOSQUARE = 32;
pub const SIIGBF_WIDETHUMBNAILS = 64;
pub const SIIGBF_ICONBACKGROUND = 128;
pub const SIIGBF_SCALEUP = 256;
pub const STGOP_MOVE = 1;
pub const STGOP_COPY = 2;
pub const STGOP_SYNC = 3;
pub const STGOP_REMOVE = 5;
pub const STGOP_RENAME = 6;
pub const STGOP_APPLYPROPERTIES = 8;
pub const STGOP_NEW = 10;
pub const TSF_NORMAL = 0;
pub const TSF_FAIL_EXIST = 0;
pub const TSF_RENAME_EXIST = 1;
pub const TSF_OVERWRITE_EXIST = 2;
pub const TSF_ALLOW_DECRYPTION = 4;
pub const TSF_NO_SECURITY = 8;
pub const TSF_COPY_CREATION_TIME = 16;
pub const TSF_COPY_WRITE_TIME = 32;
pub const TSF_USE_FULL_ACCESS = 64;
pub const TSF_DELETE_RECYCLE_IF_POSSIBLE = 128;
pub const TSF_COPY_HARD_LINK = 256;
pub const TSF_COPY_LOCALIZED_NAME = 512;
pub const TSF_MOVE_AS_COPY_DELETE = 1024;
pub const TSF_SUSPEND_SHELLEVENTS = 2048;
pub const TS_NONE = 0;
pub const TS_PERFORMING = 1;
pub const TS_PREPARING = 2;
pub const TS_INDETERMINATE = 4;
pub const SIATTRIBFLAGS_AND = 1;
pub const SIATTRIBFLAGS_OR = 2;
pub const SIATTRIBFLAGS_APPCOMPAT = 3;
pub const SIATTRIBFLAGS_MASK = 3;
pub const SIATTRIBFLAGS_ALLITEMS = 16384;
pub const CATINFO_NORMAL = 0;
pub const CATINFO_COLLAPSED = 1;
pub const CATINFO_HIDDEN = 2;
pub const CATINFO_EXPANDED = 4;
pub const CATINFO_NOHEADER = 8;
pub const CATINFO_NOTCOLLAPSIBLE = 16;
pub const CATINFO_NOHEADERCOUNT = 32;
pub const CATINFO_SUBSETTED = 64;
pub const CATINFO_SEPARATE_IMAGES = 128;
pub const CATINFO_SHOWEMPTY = 256;
pub const CATSORT_DEFAULT = 0;
pub const CATSORT_NAME = 1;
pub const SLR_NONE = 0;
pub const SLR_NO_UI = 1;
pub const SLR_ANY_MATCH = 2;
pub const SLR_UPDATE = 4;
pub const SLR_NOUPDATE = 8;
pub const SLR_NOSEARCH = 16;
pub const SLR_NOTRACK = 32;
pub const SLR_NOLINKINFO = 64;
pub const SLR_INVOKE_MSI = 128;
pub const SLR_NO_UI_WITH_MSG_PUMP = 257;
pub const SLR_OFFER_DELETE_WITHOUT_FILE = 512;
pub const SLR_KNOWNFOLDER = 1024;
pub const SLR_MACHINE_IN_LOCAL_TARGET = 2048;
pub const SLR_UPDATE_MACHINE_AND_SID = 4096;
pub const SLR_NO_OBJECT_ID = 8192;
pub const SLGP_SHORTPATH = 1;
pub const SLGP_UNCPRIORITY = 2;
pub const SLGP_RAWPATH = 4;
pub const SLGP_RELATIVEPRIORITY = 8;
pub const SPINITF_NORMAL = 0;
pub const SPINITF_MODAL = 1;
pub const SPINITF_NOMINIMIZE = 8;
pub const SPBEGINF_NORMAL = 0;
pub const SPBEGINF_AUTOTIME = 2;
pub const SPBEGINF_NOPROGRESSBAR = 16;
pub const SPBEGINF_MARQUEEPROGRESS = 32;
pub const SPBEGINF_NOCANCELBUTTON = 64;
pub const SPACTION_NONE = 0;
pub const SPACTION_MOVING = 1;
pub const SPACTION_COPYING = 2;
pub const SPACTION_RECYCLING = 3;
pub const SPACTION_APPLYINGATTRIBS = 4;
pub const SPACTION_DOWNLOADING = 5;
pub const SPACTION_SEARCHING_INTERNET = 6;
pub const SPACTION_CALCULATING = 7;
pub const SPACTION_UPLOADING = 8;
pub const SPACTION_SEARCHING_FILES = 9;
pub const SPACTION_DELETING = 10;
pub const SPACTION_RENAMING = 11;
pub const SPACTION_FORMATTING = 12;
pub const SPACTION_COPY_MOVING = 13;
pub const SPTEXT_ACTIONDESCRIPTION = 1;
pub const SPTEXT_ACTIONDETAIL = 2;
pub const EXPPS_FILETYPES = 1;
pub const DBID_BANDINFOCHANGED = 0;
pub const DBID_SHOWONLY = 1;
pub const DBID_MAXIMIZEBAND = 2;
pub const DBID_PUSHCHEVRON = 3;
pub const DBID_DELAYINIT = 4;
pub const DBID_FINISHINIT = 5;
pub const DBID_SETWINDOWTHEME = 6;
pub const DBID_PERMITAUTOHIDE = 7;
pub const THBF_ENABLED = 0;
pub const THBF_DISABLED = 1;
pub const THBF_DISMISSONCLICK = 2;
pub const THBF_NOBACKGROUND = 4;
pub const THBF_HIDDEN = 8;
pub const THBF_NONINTERACTIVE = 16;
pub const THB_BITMAP = 1;
pub const THB_ICON = 2;
pub const THB_TOOLTIP = 4;
pub const THB_FLAGS = 8;
pub const TBPF_NOPROGRESS = 0;
pub const TBPF_INDETERMINATE = 1;
pub const TBPF_NORMAL = 2;
pub const TBPF_ERROR = 4;
pub const TBPF_PAUSED = 8;
pub const STPF_NONE = 0;
pub const STPF_USEAPPTHUMBNAILALWAYS = 1;
pub const STPF_USEAPPTHUMBNAILWHENACTIVE = 2;
pub const STPF_USEAPPPEEKALWAYS = 4;
pub const STPF_USEAPPPEEKWHENACTIVE = 8;
pub const EBO_NONE = 0;
pub const EBO_NAVIGATEONCE = 1;
pub const EBO_SHOWFRAMES = 2;
pub const EBO_ALWAYSNAVIGATE = 4;
pub const EBO_NOTRAVELLOG = 8;
pub const EBO_NOWRAPPERWINDOW = 16;
pub const EBO_HTMLSHAREPOINTVIEW = 32;
pub const EBO_NOBORDER = 64;
pub const EBO_NOPERSISTVIEWSTATE = 128;
pub const EBF_NONE = 0;
pub const EBF_SELECTFROMDATAOBJECT = 256;
pub const EBF_NODROPTARGET = 512;
pub const OPPROGDLG_DEFAULT = 0;
pub const OPPROGDLG_ENABLEPAUSE = 128;
pub const OPPROGDLG_ALLOWUNDO = 256;
pub const OPPROGDLG_DONTDISPLAYSOURCEPATH = 512;
pub const OPPROGDLG_DONTDISPLAYDESTPATH = 1024;
pub const OPPROGDLG_NOMULTIDAYESTIMATES = 2048;
pub const OPPROGDLG_DONTDISPLAYLOCATIONS = 4096;
pub const PDM_DEFAULT = 0;
pub const PDM_RUN = 1;
pub const PDM_PREFLIGHT = 2;
pub const PDM_UNDOING = 4;
pub const PDM_ERRORSBLOCKING = 8;
pub const PDM_INDETERMINATE = 16;
pub const FOF2_NONE = 0;
pub const FOF2_MERGEFOLDERSONCOLLISION = 1;
pub const NSWF_DEFAULT = 0;
pub const NSWF_NONE_IMPLIES_ALL = 1;
pub const NSWF_ONE_IMPLIES_ALL = 2;
pub const NSWF_DONT_TRAVERSE_LINKS = 4;
pub const NSWF_DONT_ACCUMULATE_RESULT = 8;
pub const NSWF_TRAVERSE_STREAM_JUNCTIONS = 16;
pub const NSWF_FILESYSTEM_ONLY = 32;
pub const NSWF_SHOW_PROGRESS = 64;
pub const NSWF_FLAG_VIEWORDER = 128;
pub const NSWF_IGNORE_AUTOPLAY_HIDA = 256;
pub const NSWF_ASYNC = 512;
pub const NSWF_DONT_RESOLVE_LINKS = 1024;
pub const NSWF_ACCUMULATE_FOLDERS = 2048;
pub const NSWF_DONT_SORT = 4096;
pub const NSWF_USE_TRANSFER_MEDIUM = 8192;
pub const NSWF_DONT_TRAVERSE_STREAM_JUNCTIONS = 16384;
pub const NSWF_ANY_IMPLIES_ALL = 32768;
pub const BSID_BANDADDED = 0;
pub const BSID_BANDREMOVED = 1;
pub const MBHANDCID_PIDLSELECT = 0;
pub const MPOS_EXECUTE = 0;
pub const MPOS_FULLCANCEL = 1;
pub const MPOS_CANCELLEVEL = 2;
pub const MPOS_SELECTLEFT = 3;
pub const MPOS_SELECTRIGHT = 4;
pub const MPOS_CHILDTRACKING = 5;
pub const MPPF_SETFOCUS = 1;
pub const MPPF_INITIALSELECT = 2;
pub const MPPF_NOANIMATE = 4;
pub const MPPF_KEYBOARD = 16;
pub const MPPF_REPOSITION = 32;
pub const MPPF_FORCEZORDER = 64;
pub const MPPF_FINALSELECT = 128;
pub const MPPF_TOP = 536870912;
pub const MPPF_LEFT = 1073741824;
pub const MPPF_RIGHT = 1610612736;
pub const MPPF_BOTTOM = -2147483648;
pub const MPPF_POS_MASK = -536870912;
pub const MPPF_ALIGN_LEFT = 33554432;
pub const MPPF_ALIGN_RIGHT = 67108864;
pub const FUT_PLAYING = 0;
pub const FUT_EDITING = 1;
pub const FUT_GENERIC = 2;
pub const FDEOR_DEFAULT = 0;
pub const FDEOR_ACCEPT = 1;
pub const FDEOR_REFUSE = 2;
pub const FDESVR_DEFAULT = 0;
pub const FDESVR_ACCEPT = 1;
pub const FDESVR_REFUSE = 2;
pub const FDAP_BOTTOM = 0;
pub const FDAP_TOP = 1;
pub const FOS_OVERWRITEPROMPT = 2;
pub const FOS_STRICTFILETYPES = 4;
pub const FOS_NOCHANGEDIR = 8;
pub const FOS_PICKFOLDERS = 32;
pub const FOS_FORCEFILESYSTEM = 64;
pub const FOS_ALLNONSTORAGEITEMS = 128;
pub const FOS_NOVALIDATE = 256;
pub const FOS_ALLOWMULTISELECT = 512;
pub const FOS_PATHMUSTEXIST = 2048;
pub const FOS_FILEMUSTEXIST = 4096;
pub const FOS_CREATEPROMPT = 8192;
pub const FOS_SHAREAWARE = 16384;
pub const FOS_NOREADONLYRETURN = 32768;
pub const FOS_NOTESTFILECREATE = 65536;
pub const FOS_HIDEMRUPLACES = 131072;
pub const FOS_HIDEPINNEDPLACES = 262144;
pub const FOS_NODEREFERENCELINKS = 1048576;
pub const FOS_OKBUTTONNEEDSINTERACTION = 2097152;
pub const FOS_DONTADDTORECENT = 33554432;
pub const FOS_FORCESHOWHIDDEN = 268435456;
pub const FOS_DEFAULTNOMINIMODE = 536870912;
pub const FOS_FORCEPREVIEWPANEON = 1073741824;
pub const FOS_SUPPORTSTREAMABLEITEMS = 2147483648;
pub const CDCS_INACTIVE = 0;
pub const CDCS_ENABLED = 1;
pub const CDCS_VISIBLE = 2;
pub const CDCS_ENABLEDVISIBLE = 3;
pub const AL_MACHINE = 0;
pub const AL_EFFECTIVE = 1;
pub const AL_USER = 2;
pub const AT_FILEEXTENSION = 0;
pub const AT_URLPROTOCOL = 1;
pub const AT_STARTMENUCLIENT = 2;
pub const AT_MIMETYPE = 3;
pub const BFO_NONE = 0;
pub const BFO_BROWSER_PERSIST_SETTINGS = 1;
pub const BFO_RENAME_FOLDER_OPTIONS_TOINTERNET = 2;
pub const BFO_BOTH_OPTIONS = 4;
pub const BIF_PREFER_INTERNET_SHORTCUT = 8;
pub const BFO_BROWSE_NO_IN_NEW_PROCESS = 16;
pub const BFO_ENABLE_HYPERLINK_TRACKING = 32;
pub const BFO_USE_IE_OFFLINE_SUPPORT = 64;
pub const BFO_SUBSTITUE_INTERNET_START_PAGE = 128;
pub const BFO_USE_IE_LOGOBANDING = 256;
pub const BFO_ADD_IE_TOCAPTIONBAR = 512;
pub const BFO_USE_DIALUP_REF = 1024;
pub const BFO_USE_IE_TOOLBAR = 2048;
pub const BFO_NO_PARENT_FOLDER_SUPPORT = 4096;
pub const BFO_NO_REOPEN_NEXT_RESTART = 8192;
pub const BFO_GO_HOME_PAGE = 16384;
pub const BFO_PREFER_IEPROCESS = 32768;
pub const BFO_SHOW_NAVIGATION_CANCELLED = 65536;
pub const BFO_USE_IE_STATUSBAR = 131072;
pub const BFO_QUERY_ALL = -1;
pub const NWMF_UNLOADING = 1;
pub const NWMF_USERINITED = 2;
pub const NWMF_FIRST = 4;
pub const NWMF_OVERRIDEKEY = 8;
pub const NWMF_SHOWHELP = 16;
pub const NWMF_HTMLDIALOG = 32;
pub const NWMF_FROMDIALOGCHILD = 64;
pub const NWMF_USERREQUESTED = 128;
pub const NWMF_USERALLOWED = 256;
pub const NWMF_FORCEWINDOW = 65536;
pub const NWMF_FORCETAB = 131072;
pub const NWMF_SUGGESTWINDOW = 262144;
pub const NWMF_SUGGESTTAB = 524288;
pub const NWMF_INACTIVETAB = 1048576;
pub const ATTACHMENT_PROMPT_NONE = 0;
pub const ATTACHMENT_PROMPT_SAVE = 1;
pub const ATTACHMENT_PROMPT_EXEC = 2;
pub const ATTACHMENT_PROMPT_EXEC_OR_SAVE = 3;
pub const ATTACHMENT_ACTION_CANCEL = 0;
pub const ATTACHMENT_ACTION_SAVE = 1;
pub const ATTACHMENT_ACTION_EXEC = 2;
pub const SMIM_TYPE = 1;
pub const SMIM_FLAGS = 2;
pub const SMIM_ICON = 4;
pub const SMIT_SEPARATOR = 1;
pub const SMIT_STRING = 2;
pub const SMIF_ICON = 1;
pub const SMIF_ACCELERATOR = 2;
pub const SMIF_DROPTARGET = 4;
pub const SMIF_SUBMENU = 8;
pub const SMIF_CHECKED = 32;
pub const SMIF_DROPCASCADE = 64;
pub const SMIF_HIDDEN = 128;
pub const SMIF_DISABLED = 256;
pub const SMIF_TRACKPOPUP = 512;
pub const SMIF_DEMOTED = 1024;
pub const SMIF_ALTSTATE = 2048;
pub const SMIF_DRAGNDROP = 4096;
pub const SMIF_NEW = 8192;
pub const KF_CATEGORY_VIRTUAL = 1;
pub const KF_CATEGORY_FIXED = 2;
pub const KF_CATEGORY_COMMON = 3;
pub const KF_CATEGORY_PERUSER = 4;
pub const KFDF_LOCAL_REDIRECT_ONLY = 2;
pub const KFDF_ROAMABLE = 4;
pub const KFDF_PRECREATE = 8;
pub const KFDF_STREAM = 16;
pub const KFDF_PUBLISHEXPANDEDPATH = 32;
pub const KFDF_NO_REDIRECT_UI = 64;
pub const KF_REDIRECT_USER_EXCLUSIVE = 1;
pub const KF_REDIRECT_COPY_SOURCE_DACL = 2;
pub const KF_REDIRECT_OWNER_USER = 4;
pub const KF_REDIRECT_SET_OWNER_EXPLICIT = 8;
pub const KF_REDIRECT_CHECK_ONLY = 16;
pub const KF_REDIRECT_WITH_UI = 32;
pub const KF_REDIRECT_UNPIN = 64;
pub const KF_REDIRECT_PIN = 128;
pub const KF_REDIRECT_COPY_CONTENTS = 512;
pub const KF_REDIRECT_DEL_SOURCE_CONTENTS = 1024;
pub const KF_REDIRECT_EXCLUDE_ALL_KNOWN_SUBFOLDERS = 2048;
pub const KF_REDIRECTION_CAPABILITIES_ALLOW_ALL = 255;
pub const KF_REDIRECTION_CAPABILITIES_REDIRECTABLE = 1;
pub const KF_REDIRECTION_CAPABILITIES_DENY_ALL = 1048320;
pub const KF_REDIRECTION_CAPABILITIES_DENY_POLICY_REDIRECTED = 256;
pub const KF_REDIRECTION_CAPABILITIES_DENY_POLICY = 512;
pub const KF_REDIRECTION_CAPABILITIES_DENY_PERMISSIONS = 1024;
pub const FFFP_EXACTMATCH = 0;
pub const FFFP_NEARESTPARENTMATCH = 1;
pub const SHARE_ROLE_INVALID = -1;
pub const SHARE_ROLE_READER = 0;
pub const SHARE_ROLE_CONTRIBUTOR = 1;
pub const SHARE_ROLE_CO_OWNER = 2;
pub const SHARE_ROLE_OWNER = 3;
pub const SHARE_ROLE_CUSTOM = 4;
pub const SHARE_ROLE_MIXED = 5;
pub const DEFSHAREID_USERS = 1;
pub const DEFSHAREID_PUBLIC = 2;
pub const NMCII_NONE = 0;
pub const NMCII_ITEMS = 1;
pub const NMCII_FOLDERS = 2;
pub const NMCSAEI_SELECT = 0;
pub const NMCSAEI_EDIT = 1;
pub const NSTCS_HASEXPANDOS = 1;
pub const NSTCS_HASLINES = 2;
pub const NSTCS_SINGLECLICKEXPAND = 4;
pub const NSTCS_FULLROWSELECT = 8;
pub const NSTCS_SPRINGEXPAND = 16;
pub const NSTCS_HORIZONTALSCROLL = 32;
pub const NSTCS_ROOTHASEXPANDO = 64;
pub const NSTCS_SHOWSELECTIONALWAYS = 128;
pub const NSTCS_NOINFOTIP = 512;
pub const NSTCS_EVENHEIGHT = 1024;
pub const NSTCS_NOREPLACEOPEN = 2048;
pub const NSTCS_DISABLEDRAGDROP = 4096;
pub const NSTCS_NOORDERSTREAM = 8192;
pub const NSTCS_RICHTOOLTIP = 16384;
pub const NSTCS_BORDER = 32768;
pub const NSTCS_NOEDITLABELS = 65536;
pub const NSTCS_TABSTOP = 131072;
pub const NSTCS_FAVORITESMODE = 524288;
pub const NSTCS_AUTOHSCROLL = 1048576;
pub const NSTCS_FADEINOUTEXPANDOS = 2097152;
pub const NSTCS_EMPTYTEXT = 4194304;
pub const NSTCS_CHECKBOXES = 8388608;
pub const NSTCS_PARTIALCHECKBOXES = 16777216;
pub const NSTCS_EXCLUSIONCHECKBOXES = 33554432;
pub const NSTCS_DIMMEDCHECKBOXES = 67108864;
pub const NSTCS_NOINDENTCHECKS = 134217728;
pub const NSTCS_ALLOWJUNCTIONS = 268435456;
pub const NSTCS_SHOWTABSBUTTON = 536870912;
pub const NSTCS_SHOWDELETEBUTTON = 1073741824;
pub const NSTCS_SHOWREFRESHBUTTON = -2147483648;
pub const NSTCRS_VISIBLE = 0;
pub const NSTCRS_HIDDEN = 1;
pub const NSTCRS_EXPANDED = 2;
pub const NSTCIS_NONE = 0;
pub const NSTCIS_SELECTED = 1;
pub const NSTCIS_EXPANDED = 2;
pub const NSTCIS_BOLD = 4;
pub const NSTCIS_DISABLED = 8;
pub const NSTCIS_SELECTEDNOEXPAND = 16;
pub const NSTCGNI_NEXT = 0;
pub const NSTCGNI_NEXTVISIBLE = 1;
pub const NSTCGNI_PREV = 2;
pub const NSTCGNI_PREVVISIBLE = 3;
pub const NSTCGNI_PARENT = 4;
pub const NSTCGNI_CHILD = 5;
pub const NSTCGNI_FIRSTVISIBLE = 6;
pub const NSTCGNI_LASTVISIBLE = 7;
pub const NSTCFC_NONE = 0;
pub const NSTCFC_PINNEDITEMFILTERING = 1;
pub const NSTCFC_DELAY_REGISTER_NOTIFY = 2;
pub const EPS_DONTCARE = 0;
pub const EPS_DEFAULT_ON = 1;
pub const EPS_DEFAULT_OFF = 2;
pub const EPS_STATEMASK = 65535;
pub const EPS_INITIALSTATE = 65536;
pub const EPS_FORCE = 131072;
pub const ECS_ENABLED = 0;
pub const ECS_DISABLED = 1;
pub const ECS_HIDDEN = 2;
pub const ECS_CHECKBOX = 4;
pub const ECS_CHECKED = 8;
pub const ECS_RADIOCHECK = 16;
pub const ECF_DEFAULT = 0;
pub const ECF_HASSUBCOMMANDS = 1;
pub const ECF_HASSPLITBUTTON = 2;
pub const ECF_HIDELABEL = 4;
pub const ECF_ISSEPARATOR = 8;
pub const ECF_HASLUASHIELD = 16;
pub const ECF_SEPARATORBEFORE = 32;
pub const ECF_SEPARATORAFTER = 64;
pub const ECF_ISDROPDOWN = 128;
pub const ECF_TOGGLEABLE = 256;
pub const ECF_AUTOMENUICONS = 512;
pub const CPVIEW_CLASSIC = 0;
pub const CPVIEW_ALLITEMS = 0;
pub const CPVIEW_CATEGORY = 1;
pub const CPVIEW_HOME = 1;
pub const KDC_FREQUENT = 1;
pub const KDC_RECENT = 2;
pub const ADLT_RECENT = 0;
pub const ADLT_FREQUENT = 1;
pub const DSO_SHUFFLEIMAGES = 1;
pub const DSS_ENABLED = 1;
pub const DSS_SLIDESHOW = 2;
pub const DSS_DISABLED_BY_REMOTE_SESSION = 4;
pub const DSD_FORWARD = 0;
pub const DSD_BACKWARD = 1;
pub const DWPOS_CENTER = 0;
pub const DWPOS_TILE = 1;
pub const DWPOS_STRETCH = 2;
pub const DWPOS_FIT = 3;
pub const DWPOS_FILL = 4;
pub const DWPOS_SPAN = 5;
pub const HGSC_NONE = 0;
pub const HGSC_MUSICLIBRARY = 1;
pub const HGSC_PICTURESLIBRARY = 2;
pub const HGSC_VIDEOSLIBRARY = 4;
pub const HGSC_DOCUMENTSLIBRARY = 8;
pub const HGSC_PRINTERS = 16;
pub const LFF_FORCEFILESYSTEM = 1;
pub const LFF_STORAGEITEMS = 2;
pub const LFF_ALLITEMS = 3;
pub const LOF_DEFAULT = 0;
pub const LOF_PINNEDTONAVPANE = 1;
pub const LOF_MASK_ALL = 1;
pub const DSFT_DETECT = 1;
pub const DSFT_PRIVATE = 2;
pub const DSFT_PUBLIC = 3;
pub const LSF_FAILIFTHERE = 0;
pub const LSF_OVERRIDEEXISTING = 1;
pub const LSF_MAKEUNIQUENAME = 2;
pub const DFMR_DEFAULT = 0;
pub const DFMR_NO_STATIC_VERBS = 8;
pub const DFMR_STATIC_VERBS_ONLY = 16;
pub const DFMR_NO_RESOURCE_VERBS = 32;
pub const DFMR_OPTIN_HANDLERS_ONLY = 64;
pub const DFMR_RESOURCE_AND_FOLDER_VERBS_ONLY = 128;
pub const DFMR_USE_SPECIFIED_HANDLERS = 256;
pub const DFMR_USE_SPECIFIED_VERBS = 512;
pub const DFMR_NO_ASYNC_VERBS = 1024;
pub const DFMR_NO_NATIVECPU_VERBS = 2048;
pub const DFMR_NO_NONWOW_VERBS = 4096;
pub const AO_NONE = 0;
pub const AO_DESIGNMODE = 1;
pub const AO_NOERRORUI = 2;
pub const AO_NOSPLASHSCREEN = 4;
pub const AO_PRELAUNCH = 33554432;
pub const LMD_DEFAULT = 0;
pub const LMD_ALLOWUNINDEXABLENETWORKLOCATIONS = 1;
pub const AHTYPE_UNDEFINED = 0;
pub const AHTYPE_USER_APPLICATION = 8;
pub const AHTYPE_ANY_APPLICATION = 16;
pub const AHTYPE_MACHINEDEFAULT = 32;
pub const AHTYPE_PROGID = 64;
pub const AHTYPE_APPLICATION = 128;
pub const AHTYPE_CLASS_APPLICATION = 256;
pub const AHTYPE_ANY_PROGID = 512;
pub const ASSOC_FILTER_NONE = 0;
pub const ASSOC_FILTER_RECOMMENDED = 1;
pub const MAV_UNKNOWN = 0;
pub const MAV_NO_APP_VISIBLE = 1;
pub const MAV_APP_VISIBLE = 2;
pub const PES_UNKNOWN = 0;
pub const PES_RUNNING = 1;
pub const PES_SUSPENDING = 2;
pub const PES_SUSPENDED = 3;
pub const PES_TERMINATED = 4;
pub const AHE_DESKTOP = 0;
pub const AHE_IMMERSIVE = 1;
pub const ECHUIM_DESKTOP = 0;
pub const ECHUIM_IMMERSIVE = 1;
pub const ECHUIM_SYSTEM_LAUNCHER = 2;
pub const AVS_FULLSCREEN_LANDSCAPE = 0;
pub const AVS_FILLED = 1;
pub const AVS_SNAPPED = 2;
pub const AVS_FULLSCREEN_PORTRAIT = 3;
pub const EGK_TOUCH = 0;
pub const EGK_KEYBOARD = 1;
pub const EGK_MOUSE = 2;
pub const NDO_LANDSCAPE = 0;
pub const NDO_PORTRAIT = 1;
pub const AVO_LANDSCAPE = 0;
pub const AVO_PORTRAIT = 1;
pub const ADE_NONE = 0;
pub const ADE_LEFT = 1;
pub const ADE_RIGHT = 2;
pub const AVMW_DEFAULT = 0;
pub const AVMW_320 = 1;
pub const AVMW_500 = 2;
pub const AVSP_DEFAULT = 0;
pub const AVSP_USE_LESS = 1;
pub const AVSP_USE_HALF = 2;
pub const AVSP_USE_MORE = 3;
pub const AVSP_USE_MINIMUM = 4;
pub const AVSP_USE_NONE = 5;
pub const AVSP_CUSTOM = 6;
pub const FP_DEFAULT = 0;
pub const FP_ABOVE = 1;
pub const FP_BELOW = 2;
pub const FP_LEFT = 3;
pub const FP_RIGHT = 4;
pub const BNE_Rendered = 0;
pub const BNE_Hovered = 1;
pub const BNE_Closed = 2;
pub const BNE_Dismissed = 3;
pub const BNE_Button1Clicked = 4;
pub const BNE_Button2Clicked = 5;
pub const SOT_DEFAULT = 0;
pub const SOT_IGNORE_FOLDERNESS = 1;
pub const FVO_DEFAULT = 0;
pub const FVO_VISTALAYOUT = 1;
pub const FVO_CUSTOMPOSITION = 2;
pub const FVO_CUSTOMORDERING = 4;
pub const FVO_SUPPORTHYPERLINKS = 8;
pub const FVO_NOANIMATIONS = 16;
pub const FVO_NOSCROLLTIPS = 32;
pub const SV3CVW3_DEFAULT = 0;
pub const SV3CVW3_NONINTERACTIVE = 1;
pub const SV3CVW3_FORCEVIEWMODE = 2;
pub const SV3CVW3_FORCEFOLDERFLAGS = 4;
pub const VPWF_DEFAULT = 0;
pub const VPWF_ALPHABLEND = 1;
pub const VPCF_TEXT = 1;
pub const VPCF_BACKGROUND = 2;
pub const VPCF_SORTCOLUMN = 3;
pub const VPCF_SUBTEXT = 4;
pub const VPCF_TEXTBACKGROUND = 5;
pub const DSH_ALLOWDROPDESCRIPTIONTEXT = 1;
pub const CDBE_RET_DEFAULT = 0;
pub const CDBE_RET_DONTRUNOTHEREXTS = 1;
pub const CDBE_RET_STOPWIZARD = 2;
pub const CDBE_TYPE_MUSIC = 1;
pub const CDBE_TYPE_DATA = 2;
pub const CDBE_TYPE_ALL = -1;
pub const NSTCS2_DEFAULT = 0;
pub const NSTCS2_INTERRUPTNOTIFICATIONS = 1;
pub const NSTCS2_SHOWNULLSPACEMENU = 2;
pub const NSTCS2_DISPLAYPADDING = 4;
pub const NSTCS2_DISPLAYPINNEDONLY = 8;
pub const NTSCS2_NOSINGLETONAUTOEXPAND = 16;
pub const NTSCS2_NEVERINSERTNONENUMERATED = 32;
pub const NSTCEHT_NOWHERE = 1;
pub const NSTCEHT_ONITEMICON = 2;
pub const NSTCEHT_ONITEMLABEL = 4;
pub const NSTCEHT_ONITEMINDENT = 8;
pub const NSTCEHT_ONITEMBUTTON = 16;
pub const NSTCEHT_ONITEMRIGHT = 32;
pub const NSTCEHT_ONITEMSTATEICON = 64;
pub const NSTCEHT_ONITEM = 70;
pub const NSTCEHT_ONITEMTABBUTTON = 4096;
pub const NSTCECT_LBUTTON = 1;
pub const NSTCECT_MBUTTON = 2;
pub const NSTCECT_RBUTTON = 3;
pub const NSTCECT_BUTTON = 3;
pub const NSTCECT_DBLCLICK = 4;
pub const UR_RESOLUTION_CHANGE = 0;
pub const UR_MONITOR_DISCONNECT = 1;
pub const CSC_UPDATECOMMANDS = -1;
pub const CSC_NAVIGATEFORWARD = 1;
pub const CSC_NAVIGATEBACK = 2;
pub const secureLockIconUnsecure = 0;
pub const secureLockIconMixed = 1;
pub const secureLockIconSecureUnknownBits = 2;
pub const secureLockIconSecure40Bit = 3;
pub const secureLockIconSecure56Bit = 4;
pub const secureLockIconSecureFortezza = 5;
pub const secureLockIconSecure128Bit = 6;
pub const ProtectedModeRedirect = 1;
pub const SWC_EXPLORER = 0;
pub const SWC_BROWSER = 1;
pub const SWC_3RDPARTY = 2;
pub const SWC_CALLBACK = 4;
pub const SWC_DESKTOP = 8;
pub const SWFO_NEEDDISPATCH = 1;
pub const SWFO_INCLUDEPENDING = 2;
pub const SWFO_COOKIEPASSED = 4;
pub const navOpenInNewWindow = 1;
pub const navNoHistory = 2;
pub const navNoReadFromCache = 4;
pub const navNoWriteToCache = 8;
pub const navAllowAutosearch = 16;
pub const navBrowserBar = 32;
pub const navHyperlink = 64;
pub const navEnforceRestricted = 128;
pub const navNewWindowsManaged = 256;
pub const navUntrustedForDownload = 512;
pub const navTrustedForActiveX = 1024;
pub const navOpenInNewTab = 2048;
pub const navOpenInBackgroundTab = 4096;
pub const navKeepWordWheelText = 8192;
pub const navVirtualTab = 16384;
pub const navBlockRedirectsXDomain = 32768;
pub const navOpenNewForegroundTab = 65536;
pub const navTravelLogScreenshot = 131072;
pub const navDeferUnload = 262144;
pub const navSpeculative = 524288;
pub const navSuggestNewWindow = 1048576;
pub const navSuggestNewTab = 2097152;
pub const navReserved1 = 4194304;
pub const navHomepageNavigate = 8388608;
pub const navRefresh = 16777216;
pub const navHostNavigation = 33554432;
pub const navReserved2 = 67108864;
pub const navReserved3 = 134217728;
pub const navReserved4 = 268435456;
pub const navReserved5 = 536870912;
pub const navReserved6 = 1073741824;
pub const navReserved7 = -2147483648;
pub const REFRESH_NORMAL = 0;
pub const REFRESH_IFEXPIRED = 1;
pub const REFRESH_COMPLETELY = 3;
pub const OFS_INACTIVE = -1;
pub const OFS_ONLINE = 0;
pub const OFS_OFFLINE = 1;
pub const OFS_SERVERBACK = 2;
pub const OFS_DIRTYCACHE = 3;
pub const SFVVO_SHOWALLOBJECTS = 1;
pub const SFVVO_SHOWEXTENSIONS = 2;
pub const SFVVO_SHOWCOMPCOLOR = 8;
pub const SFVVO_SHOWSYSFILES = 32;
pub const SFVVO_WIN95CLASSIC = 64;
pub const SFVVO_DOUBLECLICKINWEBVIEW = 128;
pub const SFVVO_DESKTOPHTML = 512;
pub const ssfDESKTOP = 0;
pub const ssfPROGRAMS = 2;
pub const ssfCONTROLS = 3;
pub const ssfPRINTERS = 4;
pub const ssfPERSONAL = 5;
pub const ssfFAVORITES = 6;
pub const ssfSTARTUP = 7;
pub const ssfRECENT = 8;
pub const ssfSENDTO = 9;
pub const ssfBITBUCKET = 10;
pub const ssfSTARTMENU = 11;
pub const ssfDESKTOPDIRECTORY = 16;
pub const ssfDRIVES = 17;
pub const ssfNETWORK = 18;
pub const ssfNETHOOD = 19;
pub const ssfFONTS = 20;
pub const ssfTEMPLATES = 21;
pub const ssfCOMMONSTARTMENU = 22;
pub const ssfCOMMONPROGRAMS = 23;
pub const ssfCOMMONSTARTUP = 24;
pub const ssfCOMMONDESKTOPDIR = 25;
pub const ssfAPPDATA = 26;
pub const ssfPRINTHOOD = 27;
pub const ssfLOCALAPPDATA = 28;
pub const ssfALTSTARTUP = 29;
pub const ssfCOMMONALTSTARTUP = 30;
pub const ssfCOMMONFAVORITES = 31;
pub const ssfINTERNETCACHE = 32;
pub const ssfCOOKIES = 33;
pub const ssfHISTORY = 34;
pub const ssfCOMMONAPPDATA = 35;
pub const ssfWINDOWS = 36;
pub const ssfSYSTEM = 37;
pub const ssfPROGRAMFILES = 38;
pub const ssfMYPICTURES = 39;
pub const ssfPROFILE = 40;
pub const ssfSYSTEMx86 = 41;
pub const ssfPROGRAMFILESx86 = 48;
pub const ACO_NONE = 0;
pub const ACO_AUTOSUGGEST = 1;
pub const ACO_AUTOAPPEND = 2;
pub const ACO_SEARCH = 4;
pub const ACO_FILTERPREFIXES = 8;
pub const ACO_USETAB = 16;
pub const ACO_UPDOWNKEYDROPSLIST = 32;
pub const ACO_RTLREADING = 64;
pub const ACO_WORD_FILTER = 128;
pub const ACO_NOPREFIXFILTERING = 256;
pub const ACEO_NONE = 0;
pub const ACEO_MOSTRECENTFIRST = 1;
pub const ACEO_FIRSTUNUSED = 65536;
pub const SLDF_DEFAULT = 0;
pub const SLDF_HAS_ID_LIST = 1;
pub const SLDF_HAS_LINK_INFO = 2;
pub const SLDF_HAS_NAME = 4;
pub const SLDF_HAS_RELPATH = 8;
pub const SLDF_HAS_WORKINGDIR = 16;
pub const SLDF_HAS_ARGS = 32;
pub const SLDF_HAS_ICONLOCATION = 64;
pub const SLDF_UNICODE = 128;
pub const SLDF_FORCE_NO_LINKINFO = 256;
pub const SLDF_HAS_EXP_SZ = 512;
pub const SLDF_RUN_IN_SEPARATE = 1024;
pub const SLDF_HAS_DARWINID = 4096;
pub const SLDF_RUNAS_USER = 8192;
pub const SLDF_HAS_EXP_ICON_SZ = 16384;
pub const SLDF_NO_PIDL_ALIAS = 32768;
pub const SLDF_FORCE_UNCNAME = 65536;
pub const SLDF_RUN_WITH_SHIMLAYER = 131072;
pub const SLDF_FORCE_NO_LINKTRACK = 262144;
pub const SLDF_ENABLE_TARGET_METADATA = 524288;
pub const SLDF_DISABLE_LINK_PATH_TRACKING = 1048576;
pub const SLDF_DISABLE_KNOWNFOLDER_RELATIVE_TRACKING = 2097152;
pub const SLDF_NO_KF_ALIAS = 4194304;
pub const SLDF_ALLOW_LINK_TO_LINK = 8388608;
pub const SLDF_UNALIAS_ON_SAVE = 16777216;
pub const SLDF_PREFER_ENVIRONMENT_PATH = 33554432;
pub const SLDF_KEEP_LOCAL_IDLIST_FOR_UNC_TARGET = 67108864;
pub const SLDF_PERSIST_VOLUME_ID_RELATIVE = 134217728;
pub const SLDF_VALID = 268433407;
pub const SLDF_RESERVED = -2147483648;
pub const SHGFP_TYPE_CURRENT = 0;
pub const SHGFP_TYPE_DEFAULT = 1;
pub const KF_FLAG_DEFAULT = 0;
pub const KF_FLAG_FORCE_APP_DATA_REDIRECTION = 524288;
pub const KF_FLAG_RETURN_FILTER_REDIRECTION_TARGET = 262144;
pub const KF_FLAG_FORCE_PACKAGE_REDIRECTION = 131072;
pub const KF_FLAG_NO_PACKAGE_REDIRECTION = 65536;
pub const KF_FLAG_FORCE_APPCONTAINER_REDIRECTION = 131072;
pub const KF_FLAG_NO_APPCONTAINER_REDIRECTION = 65536;
pub const KF_FLAG_CREATE = 32768;
pub const KF_FLAG_DONT_VERIFY = 16384;
pub const KF_FLAG_DONT_UNEXPAND = 8192;
pub const KF_FLAG_NO_ALIAS = 4096;
pub const KF_FLAG_INIT = 2048;
pub const KF_FLAG_DEFAULT_PATH = 1024;
pub const KF_FLAG_NOT_PARENT_RELATIVE = 512;
pub const KF_FLAG_SIMPLE_IDLIST = 256;
pub const KF_FLAG_ALIAS_ONLY = -2147483648;
pub const ACLO_NONE = 0;
pub const ACLO_CURRENTDIR = 1;
pub const ACLO_MYCOMPUTER = 2;
pub const ACLO_DESKTOP = 4;
pub const ACLO_FAVORITES = 8;
pub const ACLO_FILESYSONLY = 16;
pub const ACLO_FILESYSDIRS = 32;
pub const ACLO_VIRTUALNAMESPACE = 64;
pub const FD_CLSID = 1;
pub const FD_SIZEPOINT = 2;
pub const FD_ATTRIBUTES = 4;
pub const FD_CREATETIME = 8;
pub const FD_ACCESSTIME = 16;
pub const FD_WRITESTIME = 32;
pub const FD_FILESIZE = 64;
pub const FD_PROGRESSUI = 16384;
pub const FD_LINKUI = 32768;
pub const FD_UNICODE = -2147483648;
pub const DROPIMAGE_INVALID = -1;
pub const DROPIMAGE_NONE = 0;
pub const DROPIMAGE_COPY = 1;
pub const DROPIMAGE_MOVE = 2;
pub const DROPIMAGE_LINK = 4;
pub const DROPIMAGE_LABEL = 6;
pub const DROPIMAGE_WARNING = 7;
pub const DROPIMAGE_NOIMAGE = 8;
pub const SHARD_PIDL = 1;
pub const SHARD_PATHA = 2;
pub const SHARD_PATHW = 3;
pub const SHARD_APPIDINFO = 4;
pub const SHARD_APPIDINFOIDLIST = 5;
pub const SHARD_LINK = 6;
pub const SHARD_APPIDINFOLINK = 7;
pub const SHARD_SHELLITEM = 8;
pub const SCNRT_ENABLE = 0;
pub const SCNRT_DISABLE = 1;
pub const REST_NONE = 0;
pub const REST_NORUN = 1;
pub const REST_NOCLOSE = 2;
pub const REST_NOSAVESET = 4;
pub const REST_NOFILEMENU = 8;
pub const REST_NOSETFOLDERS = 16;
pub const REST_NOSETTASKBAR = 32;
pub const REST_NODESKTOP = 64;
pub const REST_NOFIND = 128;
pub const REST_NODRIVES = 256;
pub const REST_NODRIVEAUTORUN = 512;
pub const REST_NODRIVETYPEAUTORUN = 1024;
pub const REST_NONETHOOD = 2048;
pub const REST_STARTBANNER = 4096;
pub const REST_RESTRICTRUN = 8192;
pub const REST_NOPRINTERTABS = 16384;
pub const REST_NOPRINTERDELETE = 32768;
pub const REST_NOPRINTERADD = 65536;
pub const REST_NOSTARTMENUSUBFOLDERS = 131072;
pub const REST_MYDOCSONNET = 262144;
pub const REST_NOEXITTODOS = 524288;
pub const REST_ENFORCESHELLEXTSECURITY = 1048576;
pub const REST_LINKRESOLVEIGNORELINKINFO = 2097152;
pub const REST_NOCOMMONGROUPS = 4194304;
pub const REST_SEPARATEDESKTOPPROCESS = 8388608;
pub const REST_NOWEB = 16777216;
pub const REST_NOTRAYCONTEXTMENU = 33554432;
pub const REST_NOVIEWCONTEXTMENU = 67108864;
pub const REST_NONETCONNECTDISCONNECT = 134217728;
pub const REST_STARTMENULOGOFF = 268435456;
pub const REST_NOSETTINGSASSIST = 536870912;
pub const REST_NOINTERNETICON = 1073741825;
pub const REST_NORECENTDOCSHISTORY = 1073741826;
pub const REST_NORECENTDOCSMENU = 1073741827;
pub const REST_NOACTIVEDESKTOP = 1073741828;
pub const REST_NOACTIVEDESKTOPCHANGES = 1073741829;
pub const REST_NOFAVORITESMENU = 1073741830;
pub const REST_CLEARRECENTDOCSONEXIT = 1073741831;
pub const REST_CLASSICSHELL = 1073741832;
pub const REST_NOCUSTOMIZEWEBVIEW = 1073741833;
pub const REST_NOHTMLWALLPAPER = 1073741840;
pub const REST_NOCHANGINGWALLPAPER = 1073741841;
pub const REST_NODESKCOMP = 1073741842;
pub const REST_NOADDDESKCOMP = 1073741843;
pub const REST_NODELDESKCOMP = 1073741844;
pub const REST_NOCLOSEDESKCOMP = 1073741845;
pub const REST_NOCLOSE_DRAGDROPBAND = 1073741846;
pub const REST_NOMOVINGBAND = 1073741847;
pub const REST_NOEDITDESKCOMP = 1073741848;
pub const REST_NORESOLVESEARCH = 1073741849;
pub const REST_NORESOLVETRACK = 1073741850;
pub const REST_FORCECOPYACLWITHFILE = 1073741851;
pub const REST_NOFORGETSOFTWAREUPDATE = 1073741853;
pub const REST_NOSETACTIVEDESKTOP = 1073741854;
pub const REST_NOUPDATEWINDOWS = 1073741855;
pub const REST_NOCHANGESTARMENU = 1073741856;
pub const REST_NOFOLDEROPTIONS = 1073741857;
pub const REST_HASFINDCOMPUTERS = 1073741858;
pub const REST_INTELLIMENUS = 1073741859;
pub const REST_RUNDLGMEMCHECKBOX = 1073741860;
pub const REST_ARP_ShowPostSetup = 1073741861;
pub const REST_NOCSC = 1073741862;
pub const REST_NOCONTROLPANEL = 1073741863;
pub const REST_ENUMWORKGROUP = 1073741864;
pub const REST_ARP_NOARP = 1073741865;
pub const REST_ARP_NOREMOVEPAGE = 1073741866;
pub const REST_ARP_NOADDPAGE = 1073741867;
pub const REST_ARP_NOWINSETUPPAGE = 1073741868;
pub const REST_GREYMSIADS = 1073741869;
pub const REST_NOCHANGEMAPPEDDRIVELABEL = 1073741870;
pub const REST_NOCHANGEMAPPEDDRIVECOMMENT = 1073741871;
pub const REST_MaxRecentDocs = 1073741872;
pub const REST_NONETWORKCONNECTIONS = 1073741873;
pub const REST_FORCESTARTMENULOGOFF = 1073741874;
pub const REST_NOWEBVIEW = 1073741875;
pub const REST_NOCUSTOMIZETHISFOLDER = 1073741876;
pub const REST_NOENCRYPTION = 1073741877;
pub const REST_DONTSHOWSUPERHIDDEN = 1073741879;
pub const REST_NOSHELLSEARCHBUTTON = 1073741880;
pub const REST_NOHARDWARETAB = 1073741881;
pub const REST_NORUNASINSTALLPROMPT = 1073741882;
pub const REST_PROMPTRUNASINSTALLNETPATH = 1073741883;
pub const REST_NOMANAGEMYCOMPUTERVERB = 1073741884;
pub const REST_DISALLOWRUN = 1073741886;
pub const REST_NOWELCOMESCREEN = 1073741887;
pub const REST_RESTRICTCPL = 1073741888;
pub const REST_DISALLOWCPL = 1073741889;
pub const REST_NOSMBALLOONTIP = 1073741890;
pub const REST_NOSMHELP = 1073741891;
pub const REST_NOWINKEYS = 1073741892;
pub const REST_NOENCRYPTONMOVE = 1073741893;
pub const REST_NOLOCALMACHINERUN = 1073741894;
pub const REST_NOCURRENTUSERRUN = 1073741895;
pub const REST_NOLOCALMACHINERUNONCE = 1073741896;
pub const REST_NOCURRENTUSERRUNONCE = 1073741897;
pub const REST_FORCEACTIVEDESKTOPON = 1073741898;
pub const REST_NOVIEWONDRIVE = 1073741900;
pub const REST_NONETCRAWL = 1073741901;
pub const REST_NOSHAREDDOCUMENTS = 1073741902;
pub const REST_NOSMMYDOCS = 1073741903;
pub const REST_NOSMMYPICS = 1073741904;
pub const REST_ALLOWBITBUCKDRIVES = 1073741905;
pub const REST_NONLEGACYSHELLMODE = 1073741906;
pub const REST_NOCONTROLPANELBARRICADE = 1073741907;
pub const REST_NOSTARTPAGE = 1073741908;
pub const REST_NOAUTOTRAYNOTIFY = 1073741909;
pub const REST_NOTASKGROUPING = 1073741910;
pub const REST_NOCDBURNING = 1073741911;
pub const REST_MYCOMPNOPROP = 1073741912;
pub const REST_MYDOCSNOPROP = 1073741913;
pub const REST_NOSTARTPANEL = 1073741914;
pub const REST_NODISPLAYAPPEARANCEPAGE = 1073741915;
pub const REST_NOTHEMESTAB = 1073741916;
pub const REST_NOVISUALSTYLECHOICE = 1073741917;
pub const REST_NOSIZECHOICE = 1073741918;
pub const REST_NOCOLORCHOICE = 1073741919;
pub const REST_SETVISUALSTYLE = 1073741920;
pub const REST_STARTRUNNOHOMEPATH = 1073741921;
pub const REST_NOUSERNAMEINSTARTPANEL = 1073741922;
pub const REST_NOMYCOMPUTERICON = 1073741923;
pub const REST_NOSMNETWORKPLACES = 1073741924;
pub const REST_NOSMPINNEDLIST = 1073741925;
pub const REST_NOSMMYMUSIC = 1073741926;
pub const REST_NOSMEJECTPC = 1073741927;
pub const REST_NOSMMOREPROGRAMS = 1073741928;
pub const REST_NOSMMFUPROGRAMS = 1073741929;
pub const REST_NOTRAYITEMSDISPLAY = 1073741930;
pub const REST_NOTOOLBARSONTASKBAR = 1073741931;
pub const REST_NOSMCONFIGUREPROGRAMS = 1073741935;
pub const REST_HIDECLOCK = 1073741936;
pub const REST_NOLOWDISKSPACECHECKS = 1073741937;
pub const REST_NOENTIRENETWORK = 1073741938;
pub const REST_NODESKTOPCLEANUP = 1073741939;
pub const REST_BITBUCKNUKEONDELETE = 1073741940;
pub const REST_BITBUCKCONFIRMDELETE = 1073741941;
pub const REST_BITBUCKNOPROP = 1073741942;
pub const REST_NODISPBACKGROUND = 1073741943;
pub const REST_NODISPSCREENSAVEPG = 1073741944;
pub const REST_NODISPSETTINGSPG = 1073741945;
pub const REST_NODISPSCREENSAVEPREVIEW = 1073741946;
pub const REST_NODISPLAYCPL = 1073741947;
pub const REST_HIDERUNASVERB = 1073741948;
pub const REST_NOTHUMBNAILCACHE = 1073741949;
pub const REST_NOSTRCMPLOGICAL = 1073741950;
pub const REST_NOPUBLISHWIZARD = 1073741951;
pub const REST_NOONLINEPRINTSWIZARD = 1073741952;
pub const REST_NOWEBSERVICES = 1073741953;
pub const REST_ALLOWUNHASHEDWEBVIEW = 1073741954;
pub const REST_ALLOWLEGACYWEBVIEW = 1073741955;
pub const REST_REVERTWEBVIEWSECURITY = 1073741956;
pub const REST_INHERITCONSOLEHANDLES = 1073741958;
pub const REST_NOREMOTERECURSIVEEVENTS = 1073741961;
pub const REST_NOREMOTECHANGENOTIFY = 1073741969;
pub const REST_NOENUMENTIRENETWORK = 1073741971;
pub const REST_NOINTERNETOPENWITH = 1073741973;
pub const REST_DONTRETRYBADNETNAME = 1073741979;
pub const REST_ALLOWFILECLSIDJUNCTIONS = 1073741980;
pub const REST_NOUPNPINSTALL = 1073741981;
pub const REST_ARP_DONTGROUPPATCHES = 1073741996;
pub const REST_ARP_NOCHOOSEPROGRAMSPAGE = 1073741997;
pub const REST_NODISCONNECT = 1090519041;
pub const REST_NOSECURITY = 1090519042;
pub const REST_NOFILEASSOCIATE = 1090519043;
pub const REST_ALLOWCOMMENTTOGGLE = 1090519044;
pub const OAIF_ALLOW_REGISTRATION = 1;
pub const OAIF_REGISTER_EXT = 2;
pub const OAIF_EXEC = 4;
pub const OAIF_FORCE_REGISTRATION = 8;
pub const OAIF_HIDE_REGISTRATION = 32;
pub const OAIF_URL_PROTOCOL = 64;
pub const OAIF_FILE_IS_URI = 128;
pub const IESHORTCUT_NEWBROWSER = 1;
pub const IESHORTCUT_OPENNEWTAB = 2;
pub const IESHORTCUT_FORCENAVIGATE = 4;
pub const IESHORTCUT_BACKGROUNDTAB = 8;
pub const DEVICE_PRIMARY = 0;
pub const DEVICE_IMMERSIVE = 1;
pub const SCF_VALUE_NONE = 0;
pub const SCF_SCALE = 1;
pub const SCF_PHYSICAL = 2;
pub const SHELL_UI_COMPONENT_TASKBARS = 0;
pub const SHELL_UI_COMPONENT_NOTIFICATIONAREA = 1;
pub const SHELL_UI_COMPONENT_DESKBAND = 2;
pub const ASSOCCLASS_SHELL_KEY = 0;
pub const ASSOCCLASS_PROGID_KEY = 1;
pub const ASSOCCLASS_PROGID_STR = 2;
pub const ASSOCCLASS_CLSID_KEY = 3;
pub const ASSOCCLASS_CLSID_STR = 4;
pub const ASSOCCLASS_APP_KEY = 5;
pub const ASSOCCLASS_APP_STR = 6;
pub const ASSOCCLASS_SYSTEM_STR = 7;
pub const ASSOCCLASS_FOLDER = 8;
pub const ASSOCCLASS_STAR = 9;
pub const ASSOCCLASS_FIXED_PROGID_STR = 10;
pub const ASSOCCLASS_PROTOCOL_STR = 11;
pub const QUNS_NOT_PRESENT = 1;
pub const QUNS_BUSY = 2;
pub const QUNS_RUNNING_D3D_FULL_SCREEN = 3;
pub const QUNS_PRESENTATION_MODE = 4;
pub const QUNS_ACCEPTS_NOTIFICATIONS = 5;
pub const QUNS_QUIET_TIME = 6;
pub const QUNS_APP = 7;
pub const SIID_DOCNOASSOC = 0;
pub const SIID_DOCASSOC = 1;
pub const SIID_APPLICATION = 2;
pub const SIID_FOLDER = 3;
pub const SIID_FOLDEROPEN = 4;
pub const SIID_DRIVE525 = 5;
pub const SIID_DRIVE35 = 6;
pub const SIID_DRIVEREMOVE = 7;
pub const SIID_DRIVEFIXED = 8;
pub const SIID_DRIVENET = 9;
pub const SIID_DRIVENETDISABLED = 10;
pub const SIID_DRIVECD = 11;
pub const SIID_DRIVERAM = 12;
pub const SIID_WORLD = 13;
pub const SIID_SERVER = 15;
pub const SIID_PRINTER = 16;
pub const SIID_MYNETWORK = 17;
pub const SIID_FIND = 22;
pub const SIID_HELP = 23;
pub const SIID_SHARE = 28;
pub const SIID_LINK = 29;
pub const SIID_SLOWFILE = 30;
pub const SIID_RECYCLER = 31;
pub const SIID_RECYCLERFULL = 32;
pub const SIID_MEDIACDAUDIO = 40;
pub const SIID_LOCK = 47;
pub const SIID_AUTOLIST = 49;
pub const SIID_PRINTERNET = 50;
pub const SIID_SERVERSHARE = 51;
pub const SIID_PRINTERFAX = 52;
pub const SIID_PRINTERFAXNET = 53;
pub const SIID_PRINTERFILE = 54;
pub const SIID_STACK = 55;
pub const SIID_MEDIASVCD = 56;
pub const SIID_STUFFEDFOLDER = 57;
pub const SIID_DRIVEUNKNOWN = 58;
pub const SIID_DRIVEDVD = 59;
pub const SIID_MEDIADVD = 60;
pub const SIID_MEDIADVDRAM = 61;
pub const SIID_MEDIADVDRW = 62;
pub const SIID_MEDIADVDR = 63;
pub const SIID_MEDIADVDROM = 64;
pub const SIID_MEDIACDAUDIOPLUS = 65;
pub const SIID_MEDIACDRW = 66;
pub const SIID_MEDIACDR = 67;
pub const SIID_MEDIACDBURN = 68;
pub const SIID_MEDIABLANKCD = 69;
pub const SIID_MEDIACDROM = 70;
pub const SIID_AUDIOFILES = 71;
pub const SIID_IMAGEFILES = 72;
pub const SIID_VIDEOFILES = 73;
pub const SIID_MIXEDFILES = 74;
pub const SIID_FOLDERBACK = 75;
pub const SIID_FOLDERFRONT = 76;
pub const SIID_SHIELD = 77;
pub const SIID_WARNING = 78;
pub const SIID_INFO = 79;
pub const SIID_ERROR = 80;
pub const SIID_KEY = 81;
pub const SIID_SOFTWARE = 82;
pub const SIID_RENAME = 83;
pub const SIID_DELETE = 84;
pub const SIID_MEDIAAUDIODVD = 85;
pub const SIID_MEDIAMOVIEDVD = 86;
pub const SIID_MEDIAENHANCEDCD = 87;
pub const SIID_MEDIAENHANCEDDVD = 88;
pub const SIID_MEDIAHDDVD = 89;
pub const SIID_MEDIABLURAY = 90;
pub const SIID_MEDIAVCD = 91;
pub const SIID_MEDIADVDPLUSR = 92;
pub const SIID_MEDIADVDPLUSRW = 93;
pub const SIID_DESKTOPPC = 94;
pub const SIID_MOBILEPC = 95;
pub const SIID_USERS = 96;
pub const SIID_MEDIASMARTMEDIA = 97;
pub const SIID_MEDIACOMPACTFLASH = 98;
pub const SIID_DEVICECELLPHONE = 99;
pub const SIID_DEVICECAMERA = 100;
pub const SIID_DEVICEVIDEOCAMERA = 101;
pub const SIID_DEVICEAUDIOPLAYER = 102;
pub const SIID_NETWORKCONNECT = 103;
pub const SIID_INTERNET = 104;
pub const SIID_ZIPFILE = 105;
pub const SIID_SETTINGS = 106;
pub const SIID_DRIVEHDDVD = 132;
pub const SIID_DRIVEBD = 133;
pub const SIID_MEDIAHDDVDROM = 134;
pub const SIID_MEDIAHDDVDR = 135;
pub const SIID_MEDIAHDDVDRAM = 136;
pub const SIID_MEDIABDROM = 137;
pub const SIID_MEDIABDR = 138;
pub const SIID_MEDIABDRE = 139;
pub const SIID_CLUSTEREDDRIVE = 140;
pub const SIID_MAX_ICONS = 181;
pub const SFBS_FLAGS_ROUND_TO_NEAREST_DISPLAYED_DIGIT = 1;
pub const SFBS_FLAGS_TRUNCATE_UNDISPLAYED_DECIMAL_DIGITS = 2;
pub const URL_SCHEME_INVALID = -1;
pub const URL_SCHEME_UNKNOWN = 0;
pub const URL_SCHEME_FTP = 1;
pub const URL_SCHEME_HTTP = 2;
pub const URL_SCHEME_GOPHER = 3;
pub const URL_SCHEME_MAILTO = 4;
pub const URL_SCHEME_NEWS = 5;
pub const URL_SCHEME_NNTP = 6;
pub const URL_SCHEME_TELNET = 7;
pub const URL_SCHEME_WAIS = 8;
pub const URL_SCHEME_FILE = 9;
pub const URL_SCHEME_MK = 10;
pub const URL_SCHEME_HTTPS = 11;
pub const URL_SCHEME_SHELL = 12;
pub const URL_SCHEME_SNEWS = 13;
pub const URL_SCHEME_LOCAL = 14;
pub const URL_SCHEME_JAVASCRIPT = 15;
pub const URL_SCHEME_VBSCRIPT = 16;
pub const URL_SCHEME_ABOUT = 17;
pub const URL_SCHEME_RES = 18;
pub const URL_SCHEME_MSSHELLROOTED = 19;
pub const URL_SCHEME_MSSHELLIDLIST = 20;
pub const URL_SCHEME_MSHELP = 21;
pub const URL_SCHEME_MSSHELLDEVICE = 22;
pub const URL_SCHEME_WILDCARD = 23;
pub const URL_SCHEME_SEARCH_MS = 24;
pub const URL_SCHEME_SEARCH = 25;
pub const URL_SCHEME_KNOWNFOLDER = 26;
pub const URL_SCHEME_MAXVALUE = 27;
pub const URL_PART_NONE = 0;
pub const URL_PART_SCHEME = 1;
pub const URL_PART_HOSTNAME = 2;
pub const URL_PART_USERNAME = 3;
pub const URL_PART_PASSWORD = 4;
pub const URL_PART_PORT = 5;
pub const URL_PART_QUERY = 6;
pub const URLIS_URL = 0;
pub const URLIS_OPAQUE = 1;
pub const URLIS_NOHISTORY = 2;
pub const URLIS_FILEURL = 3;
pub const URLIS_APPLIABLE = 4;
pub const URLIS_DIRECTORY = 5;
pub const URLIS_HASQUERY = 6;
pub const SHREGDEL_DEFAULT = 0;
pub const SHREGDEL_HKCU = 1;
pub const SHREGDEL_HKLM = 16;
pub const SHREGDEL_BOTH = 17;
pub const SHREGENUM_DEFAULT = 0;
pub const SHREGENUM_HKCU = 1;
pub const SHREGENUM_HKLM = 16;
pub const SHREGENUM_BOTH = 17;
pub const ASSOCSTR_COMMAND = 1;
pub const ASSOCSTR_EXECUTABLE = 2;
pub const ASSOCSTR_FRIENDLYDOCNAME = 3;
pub const ASSOCSTR_FRIENDLYAPPNAME = 4;
pub const ASSOCSTR_NOOPEN = 5;
pub const ASSOCSTR_SHELLNEWVALUE = 6;
pub const ASSOCSTR_DDECOMMAND = 7;
pub const ASSOCSTR_DDEIFEXEC = 8;
pub const ASSOCSTR_DDEAPPLICATION = 9;
pub const ASSOCSTR_DDETOPIC = 10;
pub const ASSOCSTR_INFOTIP = 11;
pub const ASSOCSTR_QUICKTIP = 12;
pub const ASSOCSTR_TILEINFO = 13;
pub const ASSOCSTR_CONTENTTYPE = 14;
pub const ASSOCSTR_DEFAULTICON = 15;
pub const ASSOCSTR_SHELLEXTENSION = 16;
pub const ASSOCSTR_DROPTARGET = 17;
pub const ASSOCSTR_DELEGATEEXECUTE = 18;
pub const ASSOCSTR_SUPPORTED_URI_PROTOCOLS = 19;
pub const ASSOCSTR_PROGID = 20;
pub const ASSOCSTR_APPID = 21;
pub const ASSOCSTR_APPPUBLISHER = 22;
pub const ASSOCSTR_APPICONREFERENCE = 23;
pub const ASSOCSTR_MAX = 24;
pub const ASSOCKEY_SHELLEXECCLASS = 1;
pub const ASSOCKEY_APP = 2;
pub const ASSOCKEY_CLASS = 3;
pub const ASSOCKEY_BASECLASS = 4;
pub const ASSOCKEY_MAX = 5;
pub const ASSOCDATA_MSIDESCRIPTOR = 1;
pub const ASSOCDATA_NOACTIVATEHANDLER = 2;
pub const ASSOCDATA_UNUSED1 = 3;
pub const ASSOCDATA_HASPERUSERASSOC = 4;
pub const ASSOCDATA_EDITFLAGS = 5;
pub const ASSOCDATA_VALUE = 6;
pub const ASSOCDATA_MAX = 7;
pub const ASSOCENUM_NONE = 0;
pub const FTA_None = 0;
pub const FTA_Exclude = 1;
pub const FTA_Show = 2;
pub const FTA_HasExtension = 4;
pub const FTA_NoEdit = 8;
pub const FTA_NoRemove = 16;
pub const FTA_NoNewVerb = 32;
pub const FTA_NoEditVerb = 64;
pub const FTA_NoRemoveVerb = 128;
pub const FTA_NoEditDesc = 256;
pub const FTA_NoEditIcon = 512;
pub const FTA_NoEditDflt = 1024;
pub const FTA_NoEditVerbCmd = 2048;
pub const FTA_NoEditVerbExe = 4096;
pub const FTA_NoDDE = 8192;
pub const FTA_NoEditMIME = 32768;
pub const FTA_OpenIsSafe = 65536;
pub const FTA_AlwaysUnsafe = 131072;
pub const FTA_NoRecentDocs = 1048576;
pub const FTA_SafeForElevation = 2097152;
pub const FTA_AlwaysUseDirectInvoke = 4194304;
pub const GLOBALCOUNTER_SEARCHMANAGER = 0;
pub const GLOBALCOUNTER_SEARCHOPTIONS = 1;
pub const GLOBALCOUNTER_FOLDERSETTINGSCHANGE = 2;
pub const GLOBALCOUNTER_RATINGS = 3;
pub const GLOBALCOUNTER_APPROVEDSITES = 4;
pub const GLOBALCOUNTER_RESTRICTIONS = 5;
pub const GLOBALCOUNTER_SHELLSETTINGSCHANGED = 6;
pub const GLOBALCOUNTER_SYSTEMPIDLCHANGE = 7;
pub const GLOBALCOUNTER_OVERLAYMANAGER = 8;
pub const GLOBALCOUNTER_QUERYASSOCIATIONS = 9;
pub const GLOBALCOUNTER_IESESSIONS = 10;
pub const GLOBALCOUNTER_IEONLY_SESSIONS = 11;
pub const GLOBALCOUNTER_APPLICATION_DESTINATIONS = 12;
pub const __UNUSED_RECYCLE_WAS_GLOBALCOUNTER_CSCSYNCINPROGRESS = 13;
pub const GLOBALCOUNTER_BITBUCKETNUMDELETERS = 14;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_SHARES = 15;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_A = 16;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_B = 17;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_C = 18;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_D = 19;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_E = 20;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_F = 21;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_G = 22;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_H = 23;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_I = 24;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_J = 25;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_K = 26;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_L = 27;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_M = 28;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_N = 29;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_O = 30;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_P = 31;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Q = 32;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_R = 33;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_S = 34;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_T = 35;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_U = 36;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_V = 37;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_W = 38;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_X = 39;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Y = 40;
pub const GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Z = 41;
pub const __UNUSED_RECYCLE_WAS_GLOBALCOUNTER_RECYCLEDIRTYCOUNT_SERVERDRIVE = 42;
pub const __UNUSED_RECYCLE_WAS_GLOBALCOUNTER_RECYCLEGLOBALDIRTYCOUNT = 43;
pub const GLOBALCOUNTER_RECYCLEBINENUM = 44;
pub const GLOBALCOUNTER_RECYCLEBINCORRUPTED = 45;
pub const GLOBALCOUNTER_RATINGS_STATECOUNTER = 46;
pub const GLOBALCOUNTER_PRIVATE_PROFILE_CACHE = 47;
pub const GLOBALCOUNTER_INTERNETTOOLBAR_LAYOUT = 48;
pub const GLOBALCOUNTER_FOLDERDEFINITION_CACHE = 49;
pub const GLOBALCOUNTER_COMMONPLACES_LIST_CACHE = 50;
pub const GLOBALCOUNTER_PRIVATE_PROFILE_CACHE_MACHINEWIDE = 51;
pub const GLOBALCOUNTER_ASSOCCHANGED = 52;
pub const GLOBALCOUNTER_APP_ITEMS_STATE_STORE_CACHE = 53;
pub const GLOBALCOUNTER_SETTINGSYNC_ENABLED = 54;
pub const GLOBALCOUNTER_APPSFOLDER_FILETYPEASSOCIATION_COUNTER = 55;
pub const GLOBALCOUNTER_USERINFOCHANGED = 56;
pub const GLOBALCOUNTER_SYNC_ENGINE_INFORMATION_CACHE_MACHINEWIDE = 57;
pub const GLOBALCOUNTER_BANNERS_DATAMODEL_CACHE_MACHINEWIDE = 58;
pub const GLOBALCOUNTER_MAXIMUMVALUE = 59;
pub const AIM_DISPLAYNAME = 1;
pub const AIM_VERSION = 2;
pub const AIM_PUBLISHER = 4;
pub const AIM_PRODUCTID = 8;
pub const AIM_REGISTEREDOWNER = 16;
pub const AIM_REGISTEREDCOMPANY = 32;
pub const AIM_LANGUAGE = 64;
pub const AIM_SUPPORTURL = 128;
pub const AIM_SUPPORTTELEPHONE = 256;
pub const AIM_HELPLINK = 512;
pub const AIM_INSTALLLOCATION = 1024;
pub const AIM_INSTALLSOURCE = 2048;
pub const AIM_INSTALLDATE = 4096;
pub const AIM_CONTACT = 16384;
pub const AIM_COMMENTS = 32768;
pub const AIM_IMAGE = 131072;
pub const AIM_READMEURL = 262144;
pub const AIM_UPDATEINFOURL = 524288;
pub const APPACTION_INSTALL = 1;
pub const APPACTION_UNINSTALL = 2;
pub const APPACTION_MODIFY = 4;
pub const APPACTION_REPAIR = 8;
pub const APPACTION_UPGRADE = 16;
pub const APPACTION_CANGETSIZE = 32;
pub const APPACTION_MODIFYREMOVE = 128;
pub const APPACTION_ADDLATER = 256;
pub const APPACTION_UNSCHEDULE = 512;
pub const PAI_SOURCE = 1;
pub const PAI_ASSIGNEDTIME = 2;
pub const PAI_PUBLISHEDTIME = 4;
pub const PAI_SCHEDULEDTIME = 8;
pub const PAI_EXPIRETIME = 16;
pub const CPUS_INVALID = 0;
pub const CPUS_LOGON = 1;
pub const CPUS_UNLOCK_WORKSTATION = 2;
pub const CPUS_CHANGE_PASSWORD = 3;
pub const CPUS_CREDUI = 4;
pub const CPUS_PLAP = 5;
pub const CPFT_INVALID = 0;
pub const CPFT_LARGE_TEXT = 1;
pub const CPFT_SMALL_TEXT = 2;
pub const CPFT_COMMAND_LINK = 3;
pub const CPFT_EDIT_TEXT = 4;
pub const CPFT_PASSWORD_TEXT = 5;
pub const CPFT_TILE_IMAGE = 6;
pub const CPFT_CHECKBOX = 7;
pub const CPFT_COMBOBOX = 8;
pub const CPFT_SUBMIT_BUTTON = 9;
pub const CPFS_HIDDEN = 0;
pub const CPFS_DISPLAY_IN_SELECTED_TILE = 1;
pub const CPFS_DISPLAY_IN_DESELECTED_TILE = 2;
pub const CPFS_DISPLAY_IN_BOTH = 3;
pub const CPFIS_NONE = 0;
pub const CPFIS_READONLY = 1;
pub const CPFIS_DISABLED = 2;
pub const CPFIS_FOCUSED = 3;
pub const CPGSR_NO_CREDENTIAL_NOT_FINISHED = 0;
pub const CPGSR_NO_CREDENTIAL_FINISHED = 1;
pub const CPGSR_RETURN_CREDENTIAL_FINISHED = 2;
pub const CPGSR_RETURN_NO_CREDENTIAL_FINISHED = 3;
pub const CPSI_NONE = 0;
pub const CPSI_ERROR = 1;
pub const CPSI_WARNING = 2;
pub const CPSI_SUCCESS = 3;
pub const CPAO_NONE = 0;
pub const CPAO_EMPTY_LOCAL = 1;
pub const CPAO_EMPTY_CONNECTED = 2;
pub const CPCFO_NONE = 0;
pub const CPCFO_ENABLE_PASSWORD_REVEAL = 1;
pub const CPCFO_IS_EMAIL_ADDRESS = 2;
pub const CPCFO_ENABLE_TOUCH_KEYBOARD_AUTO_INVOKE = 4;
pub const CPCFO_NUMBERS_ONLY = 8;
pub const CPCFO_SHOW_ENGLISH_KEYBOARD = 16;
pub const SYNCMGR_HCM_NONE = 0;
pub const SYNCMGR_HCM_PROVIDES_ICON = 1;
pub const SYNCMGR_HCM_EVENT_STORE = 2;
pub const SYNCMGR_HCM_CONFLICT_STORE = 4;
pub const SYNCMGR_HCM_SUPPORTS_CONCURRENT_SESSIONS = 16;
pub const SYNCMGR_HCM_CAN_BROWSE_CONTENT = 65536;
pub const SYNCMGR_HCM_CAN_SHOW_SCHEDULE = 131072;
pub const SYNCMGR_HCM_QUERY_BEFORE_ACTIVATE = 1048576;
pub const SYNCMGR_HCM_QUERY_BEFORE_DEACTIVATE = 2097152;
pub const SYNCMGR_HCM_QUERY_BEFORE_ENABLE = 4194304;
pub const SYNCMGR_HCM_QUERY_BEFORE_DISABLE = 8388608;
pub const SYNCMGR_HCM_VALID_MASK = 15925271;
pub const SYNCMGR_HPM_NONE = 0;
pub const SYNCMGR_HPM_PREVENT_ACTIVATE = 1;
pub const SYNCMGR_HPM_PREVENT_DEACTIVATE = 2;
pub const SYNCMGR_HPM_PREVENT_ENABLE = 4;
pub const SYNCMGR_HPM_PREVENT_DISABLE = 8;
pub const SYNCMGR_HPM_PREVENT_START_SYNC = 16;
pub const SYNCMGR_HPM_PREVENT_STOP_SYNC = 32;
pub const SYNCMGR_HPM_DISABLE_ENABLE = 256;
pub const SYNCMGR_HPM_DISABLE_DISABLE = 512;
pub const SYNCMGR_HPM_DISABLE_START_SYNC = 1024;
pub const SYNCMGR_HPM_DISABLE_STOP_SYNC = 2048;
pub const SYNCMGR_HPM_DISABLE_BROWSE = 4096;
pub const SYNCMGR_HPM_DISABLE_SCHEDULE = 8192;
pub const SYNCMGR_HPM_HIDDEN_BY_DEFAULT = 65536;
pub const SYNCMGR_HPM_BACKGROUND_SYNC_ONLY = 48;
pub const SYNCMGR_HPM_VALID_MASK = 77631;
pub const SYNCMGR_HT_UNSPECIFIED = 0;
pub const SYNCMGR_HT_APPLICATION = 1;
pub const SYNCMGR_HT_DEVICE = 2;
pub const SYNCMGR_HT_FOLDER = 3;
pub const SYNCMGR_HT_SERVICE = 4;
pub const SYNCMGR_HT_COMPUTER = 5;
pub const SYNCMGR_HT_MIN = 0;
pub const SYNCMGR_HT_MAX = 5;
pub const SYNCMGR_ICM_NONE = 0;
pub const SYNCMGR_ICM_PROVIDES_ICON = 1;
pub const SYNCMGR_ICM_EVENT_STORE = 2;
pub const SYNCMGR_ICM_CONFLICT_STORE = 4;
pub const SYNCMGR_ICM_CAN_DELETE = 16;
pub const SYNCMGR_ICM_CAN_BROWSE_CONTENT = 65536;
pub const SYNCMGR_ICM_QUERY_BEFORE_ENABLE = 1048576;
pub const SYNCMGR_ICM_QUERY_BEFORE_DISABLE = 2097152;
pub const SYNCMGR_ICM_QUERY_BEFORE_DELETE = 4194304;
pub const SYNCMGR_ICM_VALID_MASK = 7405591;
pub const SYNCMGR_IPM_NONE = 0;
pub const SYNCMGR_IPM_PREVENT_ENABLE = 1;
pub const SYNCMGR_IPM_PREVENT_DISABLE = 2;
pub const SYNCMGR_IPM_PREVENT_START_SYNC = 4;
pub const SYNCMGR_IPM_PREVENT_STOP_SYNC = 8;
pub const SYNCMGR_IPM_DISABLE_ENABLE = 16;
pub const SYNCMGR_IPM_DISABLE_DISABLE = 32;
pub const SYNCMGR_IPM_DISABLE_START_SYNC = 64;
pub const SYNCMGR_IPM_DISABLE_STOP_SYNC = 128;
pub const SYNCMGR_IPM_DISABLE_BROWSE = 256;
pub const SYNCMGR_IPM_DISABLE_DELETE = 512;
pub const SYNCMGR_IPM_HIDDEN_BY_DEFAULT = 65536;
pub const SYNCMGR_IPM_VALID_MASK = 66303;
pub const SYNCMGR_PS_UPDATING = 1;
pub const SYNCMGR_PS_UPDATING_INDETERMINATE = 2;
pub const SYNCMGR_PS_SUCCEEDED = 3;
pub const SYNCMGR_PS_FAILED = 4;
pub const SYNCMGR_PS_CANCELED = 5;
pub const SYNCMGR_PS_DISCONNECTED = 6;
pub const SYNCMGR_PS_MAX = 6;
pub const SYNCMGR_CR_NONE = 0;
pub const SYNCMGR_CR_CANCEL_ITEM = 1;
pub const SYNCMGR_CR_CANCEL_ALL = 2;
pub const SYNCMGR_CR_MAX = 2;
pub const SYNCMGR_EL_INFORMATION = 1;
pub const SYNCMGR_EL_WARNING = 2;
pub const SYNCMGR_EL_ERROR = 3;
pub const SYNCMGR_EL_MAX = 3;
pub const SYNCMGR_EF_NONE = 0;
pub const SYNCMGR_EF_VALID = 0;
pub const SYNCMGR_CF_NONE = 0;
pub const SYNCMGR_CF_NOWAIT = 0;
pub const SYNCMGR_CF_WAIT = 1;
pub const SYNCMGR_CF_NOUI = 2;
pub const SYNCMGR_CF_VALID = 3;
pub const SYNCMGR_SCF_NONE = 0;
pub const SYNCMGR_SCF_IGNORE_IF_ALREADY_SYNCING = 1;
pub const SYNCMGR_SCF_VALID = 1;
pub const SYNCMGR_UR_ADDED = 0;
pub const SYNCMGR_UR_CHANGED = 1;
pub const SYNCMGR_UR_REMOVED = 2;
pub const SYNCMGR_UR_MAX = 2;
pub const SYNCMGR_CIT_UPDATED = 1;
pub const SYNCMGR_CIT_DELETED = 2;
pub const SYNCMGR_RA_KEEPOTHER = 1;
pub const SYNCMGR_RA_KEEPRECENT = 2;
pub const SYNCMGR_RA_REMOVEFROMSYNCSET = 4;
pub const SYNCMGR_RA_KEEP_SINGLE = 8;
pub const SYNCMGR_RA_KEEP_MULTIPLE = 16;
pub const SYNCMGR_RA_VALID = 31;
pub const SYNCMGR_RF_CONTINUE = 0;
pub const SYNCMGR_RF_REFRESH = 1;
pub const SYNCMGR_RF_CANCEL = 2;
pub const SYNCMGR_PNS_CONTINUE = 0;
pub const SYNCMGR_PNS_DEFAULT = 1;
pub const SYNCMGR_PNS_CANCEL = 2;
pub const SYNCMGR_PC_NO_CHOICE = 0;
pub const SYNCMGR_PC_KEEP_ONE = 1;
pub const SYNCMGR_PC_KEEP_MULTIPLE = 2;
pub const SYNCMGR_PC_KEEP_RECENT = 3;
pub const SYNCMGR_PC_REMOVE_FROM_SYNC_SET = 4;
pub const SYNCMGR_PC_SKIP = 5;
pub const WTS_NONE = 0;
pub const WTS_EXTRACT = 0;
pub const WTS_INCACHEONLY = 1;
pub const WTS_FASTEXTRACT = 2;
pub const WTS_FORCEEXTRACTION = 4;
pub const WTS_SLOWRECLAIM = 8;
pub const WTS_EXTRACTDONOTCACHE = 32;
pub const WTS_SCALETOREQUESTEDSIZE = 64;
pub const WTS_SKIPFASTEXTRACT = 128;
pub const WTS_EXTRACTINPROC = 256;
pub const WTS_CROPTOSQUARE = 512;
pub const WTS_INSTANCESURROGATE = 1024;
pub const WTS_REQUIRESURROGATE = 2048;
pub const WTS_APPSTYLE = 8192;
pub const WTS_WIDETHUMBNAILS = 16384;
pub const WTS_IDEALCACHESIZEONLY = 32768;
pub const WTS_SCALEUP = 65536;
pub const WTS_DEFAULT = 0;
pub const WTS_LOWQUALITY = 1;
pub const WTS_CACHED = 2;
pub const WTSCF_DEFAULT = 0;
pub const WTSCF_APPSTYLE = 1;
pub const WTSCF_SQUARE = 2;
pub const WTSCF_WIDE = 4;
pub const WTSCF_FAST = 8;
pub const WTSAT_UNKNOWN = 0;
pub const WTSAT_RGB = 1;
pub const WTSAT_ARGB = 2;
pub const SYNCMGRSTATUS_STOPPED = 0;
pub const SYNCMGRSTATUS_SKIPPED = 1;
pub const SYNCMGRSTATUS_PENDING = 2;
pub const SYNCMGRSTATUS_UPDATING = 3;
pub const SYNCMGRSTATUS_SUCCEEDED = 4;
pub const SYNCMGRSTATUS_FAILED = 5;
pub const SYNCMGRSTATUS_PAUSED = 6;
pub const SYNCMGRSTATUS_RESUMING = 7;
pub const SYNCMGRSTATUS_UPDATING_INDETERMINATE = 8;
pub const SYNCMGRSTATUS_DELETED = 256;
pub const SYNCMGRLOGLEVEL_INFORMATION = 1;
pub const SYNCMGRLOGLEVEL_WARNING = 2;
pub const SYNCMGRLOGLEVEL_ERROR = 3;
pub const SYNCMGRLOGLEVEL_LOGLEVELMAX = 3;
pub const SYNCMGRERRORFLAG_ENABLEJUMPTEXT = 1;
pub const SYNCMGRITEM_HASPROPERTIES = 1;
pub const SYNCMGRITEM_TEMPORARY = 2;
pub const SYNCMGRITEM_ROAMINGUSER = 4;
pub const SYNCMGRITEM_LASTUPDATETIME = 8;
pub const SYNCMGRITEM_MAYDELETEITEM = 16;
pub const SYNCMGRITEM_HIDDEN = 32;
pub const SYNCMGRFLAG_CONNECT = 1;
pub const SYNCMGRFLAG_PENDINGDISCONNECT = 2;
pub const SYNCMGRFLAG_MANUAL = 3;
pub const SYNCMGRFLAG_IDLE = 4;
pub const SYNCMGRFLAG_INVOKE = 5;
pub const SYNCMGRFLAG_SCHEDULED = 6;
pub const SYNCMGRFLAG_EVENTMASK = 255;
pub const SYNCMGRFLAG_SETTINGS = 256;
pub const SYNCMGRFLAG_MAYBOTHERUSER = 512;
pub const SYNCMGRHANDLER_HASPROPERTIES = 1;
pub const SYNCMGRHANDLER_MAYESTABLISHCONNECTION = 2;
pub const SYNCMGRHANDLER_ALWAYSLISTHANDLER = 4;
pub const SYNCMGRHANDLER_HIDDEN = 8;
pub const SYNCMGRITEMSTATE_UNCHECKED = 0;
pub const SYNCMGRITEMSTATE_CHECKED = 1;
pub const SYNCMGRINVOKE_STARTSYNC = 2;
pub const SYNCMGRINVOKE_MINIMIZED = 4;
pub const SYNCMGRREGISTERFLAG_CONNECT = 1;
pub const SYNCMGRREGISTERFLAG_PENDINGDISCONNECT = 2;
pub const SYNCMGRREGISTERFLAG_IDLE = 4;
pub const ExtractIfNotCached = 0;
pub const ReturnOnlyIfCached = 1;
pub const ResizeThumbnail = 2;
pub const AllowSmallerSize = 4;
pub const TLEF_RELATIVE_INCLUDE_CURRENT = 1;
pub const TLEF_RELATIVE_BACK = 16;
pub const TLEF_RELATIVE_FORE = 32;
pub const TLEF_INCLUDE_UNINVOKEABLE = 64;
pub const TLEF_ABSOLUTE = 49;
pub const TLEF_EXCLUDE_SUBFRAME_ENTRIES = 128;
pub const TLEF_EXCLUDE_ABOUT_PAGES = 256;
pub const HLSR_HOME = 0;
pub const HLSR_SEARCHPAGE = 1;
pub const HLSR_HISTORYFOLDER = 2;
pub const HLSHORTCUTF_DEFAULT = 0;
pub const HLSHORTCUTF_DONTACTUALLYCREATE = 1;
pub const HLSHORTCUTF_USEFILENAMEFROMFRIENDLYNAME = 2;
pub const HLSHORTCUTF_USEUNIQUEFILENAME = 4;
pub const HLSHORTCUTF_MAYUSEEXISTINGSHORTCUT = 8;
pub const HLTRANSLATEF_DEFAULT = 0;
pub const HLTRANSLATEF_DONTAPPLYDEFAULTPREFIX = 1;
pub const HLNF_INTERNALJUMP = 1;
pub const HLNF_OPENINNEWWINDOW = 2;
pub const HLNF_NAVIGATINGBACK = 4;
pub const HLNF_NAVIGATINGFORWARD = 8;
pub const HLNF_NAVIGATINGTOSTACKITEM = 16;
pub const HLNF_CREATENOHISTORY = 32;
pub const HLINKGETREF_DEFAULT = 0;
pub const HLINKGETREF_ABSOLUTE = 1;
pub const HLINKGETREF_RELATIVE = 2;
pub const HLFNAMEF_DEFAULT = 0;
pub const HLFNAMEF_TRYCACHE = 1;
pub const HLFNAMEF_TRYPRETTYTARGET = 2;
pub const HLFNAMEF_TRYFULLTARGET = 4;
pub const HLFNAMEF_TRYWIN95SHORTCUT = 8;
pub const HLINKMISC_RELATIVE = 1;
pub const HLINKSETF_TARGET = 1;
pub const HLINKSETF_LOCATION = 2;
pub const HLINKWHICHMK_CONTAINER = 1;
pub const HLINKWHICHMK_BASE = 2;
pub const HLTB_DOCKEDLEFT = 0;
pub const HLTB_DOCKEDTOP = 1;
pub const HLTB_DOCKEDRIGHT = 2;
pub const HLTB_DOCKEDBOTTOM = 3;
pub const HLTB_FLOATING = 4;
pub const HLBWIF_HASFRAMEWNDINFO = 1;
pub const HLBWIF_HASDOCWNDINFO = 2;
pub const HLBWIF_FRAMEWNDMAXIMIZED = 4;
pub const HLBWIF_DOCWNDMAXIMIZED = 8;
pub const HLBWIF_HASWEBTOOLBARINFO = 16;
pub const HLBWIF_WEBTOOLBARHIDDEN = 32;
pub const HLID_INVALID = 0;
pub const HLID_PREVIOUS = 4294967295;
pub const HLID_NEXT = 4294967294;
pub const HLID_CURRENT = 4294967293;
pub const HLID_STACKBOTTOM = 4294967292;
pub const HLID_STACKTOP = 4294967291;
pub const HLQF_ISVALID = 1;
pub const HLQF_ISCURRENT = 2;
pub const BNS_NORMAL = 0;
pub const BNS_BEGIN_NAVIGATE = 1;
pub const BNS_NAVIGATE = 2;
pub const SBSC_HIDE = 0;
pub const SBSC_SHOW = 1;
pub const SBSC_TOGGLE = 2;
pub const SBSC_QUERY = 3;
pub const SECURELOCK_NOCHANGE = -1;
pub const SECURELOCK_SET_UNSECURE = 0;
pub const SECURELOCK_SET_MIXED = 1;
pub const SECURELOCK_SET_SECUREUNKNOWNBIT = 2;
pub const SECURELOCK_SET_SECURE40BIT = 3;
pub const SECURELOCK_SET_SECURE56BIT = 4;
pub const SECURELOCK_SET_FORTEZZA = 5;
pub const SECURELOCK_SET_SECURE128BIT = 6;
pub const SECURELOCK_FIRSTSUGGEST = 7;
pub const SECURELOCK_SUGGEST_UNSECURE = 7;
pub const SECURELOCK_SUGGEST_MIXED = 8;
pub const SECURELOCK_SUGGEST_SECUREUNKNOWNBIT = 9;
pub const SECURELOCK_SUGGEST_SECURE40BIT = 10;
pub const SECURELOCK_SUGGEST_SECURE56BIT = 11;
pub const SECURELOCK_SUGGEST_FORTEZZA = 12;
pub const SECURELOCK_SUGGEST_SECURE128BIT = 13;
pub const IEPDN_BINDINGUI = 1;
pub const TI_BITMAP = 1;
pub const TI_JPEG = 2;
pub const PATHCCH_NONE = 0;
pub const PATHCCH_ALLOW_LONG_PATHS = 1;
pub const PATHCCH_FORCE_ENABLE_LONG_NAME_PROCESS = 2;
pub const PATHCCH_FORCE_DISABLE_LONG_NAME_PROCESS = 4;
pub const PATHCCH_DO_NOT_NORMALIZE_SEGMENTS = 8;
pub const PATHCCH_ENSURE_IS_EXTENDED_LENGTH_PATH = 16;
pub const PATHCCH_ENSURE_TRAILING_SLASH = 32;
pub const PATHCCH_CANONICALIZE_SLASHES = 64;
pub const IURL_SETURL_FL_GUESS_PROTOCOL = 1;
pub const IURL_SETURL_FL_USE_DEFAULT_PROTOCOL = 2;
pub const IURL_INVOKECOMMAND_FL_ALLOW_UI = 1;
pub const IURL_INVOKECOMMAND_FL_USE_DEFAULT_VERB = 2;
pub const IURL_INVOKECOMMAND_FL_DDEWAIT = 4;
pub const IURL_INVOKECOMMAND_FL_ASYNCOK = 8;
pub const IURL_INVOKECOMMAND_FL_LOG_USAGE = 16;
pub const TRANSLATEURL_FL_GUESS_PROTOCOL = 1;
pub const TRANSLATEURL_FL_USE_DEFAULT_PROTOCOL = 2;
pub const URLASSOCDLG_FL_USE_DEFAULT_NAME = 1;
pub const URLASSOCDLG_FL_REGISTER_ASSOC = 2;
pub const MIMEASSOCDLG_FL_REGISTER_ASSOC = 1;

pub const aliases = struct {
    pub const SHGFI_FLAGS = u32;
    pub const SHCNE_ID = u32;
    pub const SHCNRF_SOURCE = i32;
    pub const SHCNF_FLAGS = u32;
    pub const QITIPF_FLAGS = i32;
    pub const SHDID_ID = i32;
    pub const SHGDFIL_FORMAT = i32;
    pub const PRF_FLAGS = i32;
    pub const PCS_RET = u32;
    pub const MM_FLAGS = u32;
    pub const SHOP_TYPE = i32;
    pub const SHFMT_ID = u32;
    pub const SHFMT_OPT = i32;
    pub const SHFMT_RET = u32;
    pub const VALIDATEUNC_OPTION = i32;
    pub const SFVM_MESSAGE_ID = i32;
    pub const SFVS_SELECT = i32;
    pub const DFM_MESSAGE_ID = i32;
    pub const DFM_CMD = i32;
    pub const PID_IS = i32;
    pub const PID_INTSITE = i32;
    pub const PIDISF_FLAGS = i32;
    pub const PIDISM_OPTIONS = i32;
    pub const PIDISR_INFO = i32;
    pub const SSF_MASK = u32;
    pub const ASSOCF = u32;
    pub const NOTIFY_ICON_MESSAGE = u32;
    pub const NOTIFY_ICON_DATA_FLAGS = u32;
    pub const OS = u32;
    pub const SHELL_AUTOCOMPLETE_FLAGS = u32;
    pub const HELP_INFO_TYPE = i32;
    pub const NOTIFY_ICON_INFOTIP_FLAGS = u32;
    pub const NOTIFY_ICON_STATE = u32;
    pub const GPFIDL_FLAGS = u32;
    pub const SHGSI_FLAGS = u32;
    pub const FILEOPERATION_FLAGS = u32;
    pub const SHGDNF = u32;
    pub const _SHCONTF = i32;
    pub const STORAGE_PROVIDER_FILE_FLAGS = i32;
    pub const MERGE_UPDATE_STATUS = i32;
    pub const FOLDER_ENUM_MODE = i32;
    pub const FOLDERFLAGS = i32;
    pub const FOLDERVIEWMODE = i32;
    pub const FOLDERLOGICALVIEWMODE = i32;
    pub const _SVSIF = i32;
    pub const _SVGIO = i32;
    pub const SVUIA_STATUS = i32;
    pub const SORTDIRECTION = i32;
    pub const FVTEXTTYPE = i32;
    pub const CM_MASK = i32;
    pub const CM_STATE = i32;
    pub const CM_ENUM_FLAGS = i32;
    pub const CM_SET_WIDTH_VALUE = i32;
    pub const SIGDN = i32;
    pub const _SICHINTF = i32;
    pub const DATAOBJ_GET_ITEM_FLAGS = i32;
    pub const SIIGBF = i32;
    pub const STGOP = i32;
    pub const _TRANSFER_SOURCE_FLAGS = i32;
    pub const _TRANSFER_ADVISE_STATE = i32;
    pub const SIATTRIBFLAGS = i32;
    pub const CATEGORYINFO_FLAGS = i32;
    pub const CATSORT_FLAGS = i32;
    pub const SLR_FLAGS = i32;
    pub const SLGP_FLAGS = i32;
    pub const _SPINITF = i32;
    pub const _SPBEGINF = i32;
    pub const SPACTION = i32;
    pub const SPTEXT = i32;
    pub const _EXPPS = i32;
    pub const DESKBANDCID = i32;
    pub const THUMBBUTTONFLAGS = i32;
    pub const THUMBBUTTONMASK = i32;
    pub const TBPFLAG = i32;
    pub const STPFLAG = i32;
    pub const EXPLORER_BROWSER_OPTIONS = i32;
    pub const EXPLORER_BROWSER_FILL_FLAGS = i32;
    pub const _OPPROGDLGF = i32;
    pub const _PDMODE = i32;
    pub const FILE_OPERATION_FLAGS2 = i32;
    pub const NAMESPACEWALKFLAG = i32;
    pub const BANDSITECID = i32;
    pub const MENUBANDHANDLERCID = i32;
    pub const MENUPOPUPSELECT = i32;
    pub const MENUPOPUPPOPUPFLAGS = i32;
    pub const FILE_USAGE_TYPE = i32;
    pub const FDE_OVERWRITE_RESPONSE = i32;
    pub const FDE_SHAREVIOLATION_RESPONSE = i32;
    pub const FDAP = i32;
    pub const FILEOPENDIALOGOPTIONS = u32;
    pub const CDCONTROLSTATEF = i32;
    pub const ASSOCIATIONLEVEL = i32;
    pub const ASSOCIATIONTYPE = i32;
    pub const _BROWSERFRAMEOPTIONS = i32;
    pub const NWMF = i32;
    pub const ATTACHMENT_PROMPT = i32;
    pub const ATTACHMENT_ACTION = i32;
    pub const SMINFOMASK = i32;
    pub const SMINFOTYPE = i32;
    pub const SMINFOFLAGS = i32;
    pub const KF_CATEGORY = i32;
    pub const _KF_DEFINITION_FLAGS = i32;
    pub const _KF_REDIRECT_FLAGS = i32;
    pub const _KF_REDIRECTION_CAPABILITIES = i32;
    pub const FFFP_MODE = i32;
    pub const SHARE_ROLE = i32;
    pub const DEF_SHARE_ID = i32;
    pub const _NMCII_FLAGS = i32;
    pub const _NMCSAEI_FLAGS = i32;
    pub const _NSTCSTYLE = i32;
    pub const _NSTCROOTSTYLE = i32;
    pub const _NSTCITEMSTATE = i32;
    pub const NSTCGNI = i32;
    pub const NSTCFOLDERCAPABILITIES = i32;
    pub const _EXPLORERPANESTATE = i32;
    pub const _EXPCMDSTATE = i32;
    pub const _EXPCMDFLAGS = i32;
    pub const CPVIEW = i32;
    pub const KNOWNDESTCATEGORY = i32;
    pub const APPDOCLISTTYPE = i32;
    pub const DESKTOP_SLIDESHOW_OPTIONS = i32;
    pub const DESKTOP_SLIDESHOW_STATE = i32;
    pub const DESKTOP_SLIDESHOW_DIRECTION = i32;
    pub const DESKTOP_WALLPAPER_POSITION = i32;
    pub const HOMEGROUPSHARINGCHOICES = i32;
    pub const LIBRARYFOLDERFILTER = i32;
    pub const LIBRARYOPTIONFLAGS = i32;
    pub const DEFAULTSAVEFOLDERTYPE = i32;
    pub const LIBRARYSAVEFLAGS = i32;
    pub const DEFAULT_FOLDER_MENU_RESTRICTIONS = i32;
    pub const ACTIVATEOPTIONS = i32;
    pub const LIBRARYMANAGEDIALOGOPTIONS = i32;
    pub const AHTYPE = i32;
    pub const ASSOC_FILTER = i32;
    pub const MONITOR_APP_VISIBILITY = i32;
    pub const PACKAGE_EXECUTION_STATE = i32;
    pub const AHE_TYPE = i32;
    pub const EC_HOST_UI_MODE = i32;
    pub const APPLICATION_VIEW_STATE = i32;
    pub const EDGE_GESTURE_KIND = i32;
    pub const NATIVE_DISPLAY_ORIENTATION = i32;
    pub const APPLICATION_VIEW_ORIENTATION = i32;
    pub const ADJACENT_DISPLAY_EDGES = i32;
    pub const APPLICATION_VIEW_MIN_WIDTH = i32;
    pub const APPLICATION_VIEW_SIZE_PREFERENCE = i32;
    pub const FLYOUT_PLACEMENT = i32;
    pub const BANNER_NOTIFICATION_EVENT = i32;
    pub const SORT_ORDER_TYPE = i32;
    pub const FOLDERVIEWOPTIONS = i32;
    pub const _SV3CVW3_FLAGS = i32;
    pub const VPWATERMARKFLAGS = i32;
    pub const VPCOLORFLAGS = i32;
    pub const DSH_FLAGS = i32;
    pub const CDBURNINGEXTENSIONRET = i32;
    pub const _CDBE_ACTIONS = i32;
    pub const NSTCSTYLE2 = i32;
    pub const _NSTCEHITTEST = i32;
    pub const _NSTCECLICKTYPE = i32;
    pub const UNDOCK_REASON = i32;
    pub const CommandStateChangeConstants = i32;
    pub const SecureLockIconConstants = i32;
    pub const NewProcessCauseConstants = i32;
    pub const ShellWindowTypeConstants = i32;
    pub const ShellWindowFindWindowOptions = i32;
    pub const BrowserNavConstants = i32;
    pub const RefreshConstants = i32;
    pub const OfflineFolderStatus = i32;
    pub const ShellFolderViewOptions = i32;
    pub const ShellSpecialFolderConstants = i32;
    pub const AUTOCOMPLETEOPTIONS = i32;
    pub const ACENUMOPTION = i32;
    pub const SHELL_LINK_DATA_FLAGS = i32;
    pub const SHGFP_TYPE = i32;
    pub const KNOWN_FOLDER_FLAG = i32;
    pub const AUTOCOMPLETELISTOPTIONS = i32;
    pub const FD_FLAGS = i32;
    pub const DROPIMAGETYPE = i32;
    pub const SHARD = i32;
    pub const SCNRT_STATUS = i32;
    pub const RESTRICTIONS = i32;
    pub const OPEN_AS_INFO_FLAGS = i32;
    pub const IESHORTCUTFLAGS = i32;
    pub const DISPLAY_DEVICE_TYPE = i32;
    pub const SCALE_CHANGE_FLAGS = i32;
    pub const SHELL_UI_COMPONENT = i32;
    pub const ASSOCCLASS = i32;
    pub const QUERY_USER_NOTIFICATION_STATE = i32;
    pub const SHSTOCKICONID = i32;
    pub const SFBS_FLAGS = i32;
    pub const URL_SCHEME = i32;
    pub const URL_PART = i32;
    pub const URLIS = i32;
    pub const SHREGDEL_FLAGS = i32;
    pub const SHREGENUM_FLAGS = i32;
    pub const ASSOCSTR = i32;
    pub const ASSOCKEY = i32;
    pub const ASSOCDATA = i32;
    pub const ASSOCENUM = i32;
    pub const FILETYPEATTRIBUTEFLAGS = i32;
    pub const SHGLOBALCOUNTER = i32;
    pub const APPINFODATAFLAGS = i32;
    pub const APPACTIONFLAGS = i32;
    pub const PUBAPPINFOFLAGS = i32;
    pub const CREDENTIAL_PROVIDER_USAGE_SCENARIO = i32;
    pub const CREDENTIAL_PROVIDER_FIELD_TYPE = i32;
    pub const CREDENTIAL_PROVIDER_FIELD_STATE = i32;
    pub const CREDENTIAL_PROVIDER_FIELD_INTERACTIVE_STATE = i32;
    pub const CREDENTIAL_PROVIDER_GET_SERIALIZATION_RESPONSE = i32;
    pub const CREDENTIAL_PROVIDER_STATUS_ICON = i32;
    pub const CREDENTIAL_PROVIDER_ACCOUNT_OPTIONS = i32;
    pub const CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS = i32;
    pub const SYNCMGR_HANDLER_CAPABILITIES = i32;
    pub const SYNCMGR_HANDLER_POLICIES = i32;
    pub const SYNCMGR_HANDLER_TYPE = i32;
    pub const SYNCMGR_ITEM_CAPABILITIES = i32;
    pub const SYNCMGR_ITEM_POLICIES = i32;
    pub const SYNCMGR_PROGRESS_STATUS = i32;
    pub const SYNCMGR_CANCEL_REQUEST = i32;
    pub const SYNCMGR_EVENT_LEVEL = i32;
    pub const SYNCMGR_EVENT_FLAGS = i32;
    pub const SYNCMGR_CONTROL_FLAGS = i32;
    pub const SYNCMGR_SYNC_CONTROL_FLAGS = i32;
    pub const SYNCMGR_UPDATE_REASON = i32;
    pub const SYNCMGR_CONFLICT_ITEM_TYPE = i32;
    pub const SYNCMGR_RESOLUTION_ABILITIES = i32;
    pub const SYNCMGR_RESOLUTION_FEEDBACK = i32;
    pub const SYNCMGR_PRESENTER_NEXT_STEP = i32;
    pub const SYNCMGR_PRESENTER_CHOICE = i32;
    pub const WTS_FLAGS = i32;
    pub const WTS_CACHEFLAGS = i32;
    pub const WTS_CONTEXTFLAGS = i32;
    pub const WTS_ALPHATYPE = i32;
    pub const SYNCMGRSTATUS = i32;
    pub const SYNCMGRLOGLEVEL = i32;
    pub const SYNCMGRERRORFLAGS = i32;
    pub const SYNCMGRITEMFLAGS = i32;
    pub const SYNCMGRFLAG = i32;
    pub const SYNCMGRHANDLERFLAGS = i32;
    pub const SYNCMGRITEMSTATE = i32;
    pub const SYNCMGRINVOKEFLAGS = i32;
    pub const SYNCMGRREGISTERFLAGS = i32;
    pub const ThumbnailStreamCacheOptions = i32;
    pub const TLENUMF = i32;
    pub const HLSR = i32;
    pub const HLSHORTCUTF = i32;
    pub const HLTRANSLATEF = i32;
    pub const HLNF = u32;
    pub const HLINKGETREF = i32;
    pub const HLFNAMEF = i32;
    pub const HLINKMISC = i32;
    pub const HLINKSETF = i32;
    pub const HLINKWHICHMK = i32;
    pub const HLTB_INFO = i32;
    pub const HLBWIF_FLAGS = i32;
    pub const HLID_INFO = u32;
    pub const HLQF_INFO = i32;
    pub const BNSTATE = i32;
    pub const SHELLBROWSERSHOWCONTROL = i32;
    pub const SECURELOCKCODE = i32;
    pub const IEPDNFLAGS = i32;
    pub const TI_FLAGS = i32;
    pub const PATHCCH_OPTIONS = u32;
    pub const IURL_SETURL_FLAGS = i32;
    pub const IURL_INVOKECOMMAND_FLAGS = i32;
    pub const TRANSLATEURL_IN_FLAGS = i32;
    pub const URLASSOCIATIONDIALOG_IN_FLAGS = i32;
    pub const MIMEASSOCIATIONDIALOG_IN_FLAGS = i32;
    pub const HDROP = ?*anyopaque;
    pub const HPSXA = ?*anyopaque;
    pub const PAPPCONSTRAIN_REGISTRATION = isize;
    pub const PAPPSTATE_REGISTRATION = isize;
};
