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
    .{ "SetupGetInfInformationA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetInfInformationA", .signature = "\x00\x05\x11\x59\x0f\x01\x09\x0f\x11\xaa\x11\x09\x0f\x09" } },
    .{ "SetupGetInfInformationW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetInfInformationW", .signature = "\x00\x05\x11\x59\x0f\x01\x09\x0f\x11\xaa\x11\x09\x0f\x09" } },
    .{ "SetupQueryInfFileInformationA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueryInfFileInformationA", .signature = "\x00\x05\x11\x59\x0f\x11\xaa\x11\x09\x11\x3d\x09\x0f\x09" } },
    .{ "SetupQueryInfFileInformationW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueryInfFileInformationW", .signature = "\x00\x05\x11\x59\x0f\x11\xaa\x11\x09\x11\x05\x09\x0f\x09" } },
    .{ "SetupQueryInfOriginalFileInformationA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueryInfOriginalFileInformationA", .signature = "\x00\x04\x11\x59\x0f\x11\xaa\x11\x09\x0f\x11\xaa\x15\x0f\x11\xaa\x19" } },
    .{ "SetupQueryInfOriginalFileInformationW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueryInfOriginalFileInformationW", .signature = "\x00\x04\x11\x59\x0f\x11\xaa\x11\x09\x0f\x11\xaa\x15\x0f\x11\xaa\x1d" } },
    .{ "SetupQueryInfVersionInformationA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueryInfVersionInformationA", .signature = "\x00\x06\x11\x59\x0f\x11\xaa\x11\x09\x11\x3d\x11\x3d\x09\x0f\x09" } },
    .{ "SetupQueryInfVersionInformationW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueryInfVersionInformationW", .signature = "\x00\x06\x11\x59\x0f\x11\xaa\x11\x09\x11\x05\x11\x05\x09\x0f\x09" } },
    .{ "SetupGetInfDriverStoreLocationA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetInfDriverStoreLocationA", .signature = "\x00\x06\x11\x59\x11\x3d\x0f\x11\xaa\x15\x11\x3d\x11\x3d\x09\x0f\x09" } },
    .{ "SetupGetInfDriverStoreLocationW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetInfDriverStoreLocationW", .signature = "\x00\x06\x11\x59\x11\x05\x0f\x11\xaa\x15\x11\x05\x11\x05\x09\x0f\x09" } },
    .{ "SetupGetInfPublishedNameA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetInfPublishedNameA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x09\x0f\x09" } },
    .{ "SetupGetInfPublishedNameW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetInfPublishedNameW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x09\x0f\x09" } },
    .{ "SetupGetInfFileListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetInfFileListA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x89\xb9\x11\x3d\x09\x0f\x09" } },
    .{ "SetupGetInfFileListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetInfFileListW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x89\xb9\x11\x05\x09\x0f\x09" } },
    .{ "SetupOpenInfFileW", MethodRecord{ .library = "SETUPAPI", .import = "SetupOpenInfFileW", .signature = "\x00\x04\x0f\x01\x11\x05\x11\x05\x11\x89\xb9\x0f\x09" } },
    .{ "SetupOpenInfFileA", MethodRecord{ .library = "SETUPAPI", .import = "SetupOpenInfFileA", .signature = "\x00\x04\x0f\x01\x11\x3d\x11\x3d\x11\x89\xb9\x0f\x09" } },
    .{ "SetupOpenMasterInf", MethodRecord{ .library = "SETUPAPI", .import = "SetupOpenMasterInf", .signature = "\x00\x00\x0f\x01" } },
    .{ "SetupOpenAppendInfFileW", MethodRecord{ .library = "SETUPAPI", .import = "SetupOpenAppendInfFileW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x01\x0f\x09" } },
    .{ "SetupOpenAppendInfFileA", MethodRecord{ .library = "SETUPAPI", .import = "SetupOpenAppendInfFileA", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x01\x0f\x09" } },
    .{ "SetupCloseInfFile", MethodRecord{ .library = "SETUPAPI", .import = "SetupCloseInfFile", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "SetupFindFirstLineA", MethodRecord{ .library = "SETUPAPI", .import = "SetupFindFirstLineA", .signature = "\x00\x04\x11\x59\x0f\x01\x11\x3d\x11\x3d\x0f\x11\xaa\x21" } },
    .{ "SetupFindFirstLineW", MethodRecord{ .library = "SETUPAPI", .import = "SetupFindFirstLineW", .signature = "\x00\x04\x11\x59\x0f\x01\x11\x05\x11\x05\x0f\x11\xaa\x21" } },
    .{ "SetupFindNextLine", MethodRecord{ .library = "SETUPAPI", .import = "SetupFindNextLine", .signature = "\x00\x02\x11\x59\x0f\x11\xaa\x21\x0f\x11\xaa\x21" } },
    .{ "SetupFindNextMatchLineA", MethodRecord{ .library = "SETUPAPI", .import = "SetupFindNextMatchLineA", .signature = "\x00\x03\x11\x59\x0f\x11\xaa\x21\x11\x3d\x0f\x11\xaa\x21" } },
    .{ "SetupFindNextMatchLineW", MethodRecord{ .library = "SETUPAPI", .import = "SetupFindNextMatchLineW", .signature = "\x00\x03\x11\x59\x0f\x11\xaa\x21\x11\x05\x0f\x11\xaa\x21" } },
    .{ "SetupGetLineByIndexA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetLineByIndexA", .signature = "\x00\x04\x11\x59\x0f\x01\x11\x3d\x09\x0f\x11\xaa\x21" } },
    .{ "SetupGetLineByIndexW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetLineByIndexW", .signature = "\x00\x04\x11\x59\x0f\x01\x11\x05\x09\x0f\x11\xaa\x21" } },
    .{ "SetupGetLineCountA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetLineCountA", .signature = "\x00\x02\x08\x0f\x01\x11\x3d" } },
    .{ "SetupGetLineCountW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetLineCountW", .signature = "\x00\x02\x08\x0f\x01\x11\x05" } },
    .{ "SetupGetLineTextA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetLineTextA", .signature = "\x00\x07\x11\x59\x0f\x11\xaa\x21\x0f\x01\x11\x3d\x11\x3d\x11\x3d\x09\x0f\x09" } },
    .{ "SetupGetLineTextW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetLineTextW", .signature = "\x00\x07\x11\x59\x0f\x11\xaa\x21\x0f\x01\x11\x05\x11\x05\x11\x05\x09\x0f\x09" } },
    .{ "SetupGetFieldCount", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetFieldCount", .signature = "\x00\x01\x09\x0f\x11\xaa\x21" } },
    .{ "SetupGetStringFieldA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetStringFieldA", .signature = "\x00\x05\x11\x59\x0f\x11\xaa\x21\x09\x11\x3d\x09\x0f\x09" } },
    .{ "SetupGetStringFieldW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetStringFieldW", .signature = "\x00\x05\x11\x59\x0f\x11\xaa\x21\x09\x11\x05\x09\x0f\x09" } },
    .{ "SetupGetIntField", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetIntField", .signature = "\x00\x03\x11\x59\x0f\x11\xaa\x21\x09\x0f\x08" } },
    .{ "SetupGetMultiSzFieldA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetMultiSzFieldA", .signature = "\x00\x05\x11\x59\x0f\x11\xaa\x21\x09\x11\x3d\x09\x0f\x09" } },
    .{ "SetupGetMultiSzFieldW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetMultiSzFieldW", .signature = "\x00\x05\x11\x59\x0f\x11\xaa\x21\x09\x11\x05\x09\x0f\x09" } },
    .{ "SetupGetBinaryField", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetBinaryField", .signature = "\x00\x05\x11\x59\x0f\x11\xaa\x21\x09\x0f\x05\x09\x0f\x09" } },
    .{ "SetupGetFileCompressionInfoA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetFileCompressionInfoA", .signature = "\x00\x05\x09\x11\x3d\x0f\x11\x3d\x0f\x09\x0f\x09\x0f\x11\x8a\x29" } },
    .{ "SetupGetFileCompressionInfoW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetFileCompressionInfoW", .signature = "\x00\x05\x09\x11\x05\x0f\x11\x05\x0f\x09\x0f\x09\x0f\x11\x8a\x29" } },
    .{ "SetupGetFileCompressionInfoExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetFileCompressionInfoExA", .signature = "\x00\x07\x11\x59\x11\x3d\x11\x3d\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x11\x8a\x29" } },
    .{ "SetupGetFileCompressionInfoExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetFileCompressionInfoExW", .signature = "\x00\x07\x11\x59\x11\x05\x11\x05\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x11\x8a\x29" } },
    .{ "SetupDecompressOrCopyFileA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDecompressOrCopyFileA", .signature = "\x00\x03\x09\x11\x3d\x11\x3d\x0f\x11\x8a\x29" } },
    .{ "SetupDecompressOrCopyFileW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDecompressOrCopyFileW", .signature = "\x00\x03\x09\x11\x05\x11\x05\x0f\x11\x8a\x29" } },
    .{ "SetupGetSourceFileLocationA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetSourceFileLocationA", .signature = "\x00\x07\x11\x59\x0f\x01\x0f\x11\xaa\x21\x11\x3d\x0f\x09\x11\x3d\x09\x0f\x09" } },
    .{ "SetupGetSourceFileLocationW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetSourceFileLocationW", .signature = "\x00\x07\x11\x59\x0f\x01\x0f\x11\xaa\x21\x11\x05\x0f\x09\x11\x05\x09\x0f\x09" } },
    .{ "SetupGetSourceFileSizeA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetSourceFileSizeA", .signature = "\x00\x06\x11\x59\x0f\x01\x0f\x11\xaa\x21\x11\x3d\x11\x3d\x0f\x09\x09" } },
    .{ "SetupGetSourceFileSizeW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetSourceFileSizeW", .signature = "\x00\x06\x11\x59\x0f\x01\x0f\x11\xaa\x21\x11\x05\x11\x05\x0f\x09\x09" } },
    .{ "SetupGetTargetPathA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetTargetPathA", .signature = "\x00\x06\x11\x59\x0f\x01\x0f\x11\xaa\x21\x11\x3d\x11\x3d\x09\x0f\x09" } },
    .{ "SetupGetTargetPathW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetTargetPathW", .signature = "\x00\x06\x11\x59\x0f\x01\x0f\x11\xaa\x21\x11\x05\x11\x05\x09\x0f\x09" } },
    .{ "SetupSetSourceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupSetSourceListA", .signature = "\x00\x03\x11\x59\x09\x0f\x11\x3d\x09" } },
    .{ "SetupSetSourceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupSetSourceListW", .signature = "\x00\x03\x11\x59\x09\x0f\x11\x05\x09" } },
    .{ "SetupCancelTemporarySourceList", MethodRecord{ .library = "SETUPAPI", .import = "SetupCancelTemporarySourceList", .signature = "\x00\x00\x11\x59" } },
    .{ "SetupAddToSourceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupAddToSourceListA", .signature = "\x00\x02\x11\x59\x09\x11\x3d" } },
    .{ "SetupAddToSourceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupAddToSourceListW", .signature = "\x00\x02\x11\x59\x09\x11\x05" } },
    .{ "SetupRemoveFromSourceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupRemoveFromSourceListA", .signature = "\x00\x02\x11\x59\x09\x11\x3d" } },
    .{ "SetupRemoveFromSourceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupRemoveFromSourceListW", .signature = "\x00\x02\x11\x59\x09\x11\x05" } },
    .{ "SetupQuerySourceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQuerySourceListA", .signature = "\x00\x03\x11\x59\x09\x0f\x0f\x11\x3d\x0f\x09" } },
    .{ "SetupQuerySourceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQuerySourceListW", .signature = "\x00\x03\x11\x59\x09\x0f\x0f\x11\x05\x0f\x09" } },
    .{ "SetupFreeSourceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupFreeSourceListA", .signature = "\x00\x02\x11\x59\x0f\x0f\x11\x3d\x09" } },
    .{ "SetupFreeSourceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupFreeSourceListW", .signature = "\x00\x02\x11\x59\x0f\x0f\x11\x05\x09" } },
    .{ "SetupPromptForDiskA", MethodRecord{ .library = "SETUPAPI", .import = "SetupPromptForDiskA", .signature = "\x00\x0a\x09\x11\x25\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x09\x11\x3d\x09\x0f\x09" } },
    .{ "SetupPromptForDiskW", MethodRecord{ .library = "SETUPAPI", .import = "SetupPromptForDiskW", .signature = "\x00\x0a\x09\x11\x25\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x09\x11\x05\x09\x0f\x09" } },
    .{ "SetupCopyErrorA", MethodRecord{ .library = "SETUPAPI", .import = "SetupCopyErrorA", .signature = "\x00\x0b\x09\x11\x25\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x09\x09\x11\x3d\x09\x0f\x09" } },
    .{ "SetupCopyErrorW", MethodRecord{ .library = "SETUPAPI", .import = "SetupCopyErrorW", .signature = "\x00\x0b\x09\x11\x25\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x09\x09\x11\x05\x09\x0f\x09" } },
    .{ "SetupRenameErrorA", MethodRecord{ .library = "SETUPAPI", .import = "SetupRenameErrorA", .signature = "\x00\x06\x09\x11\x25\x11\x3d\x11\x3d\x11\x3d\x09\x09" } },
    .{ "SetupRenameErrorW", MethodRecord{ .library = "SETUPAPI", .import = "SetupRenameErrorW", .signature = "\x00\x06\x09\x11\x25\x11\x05\x11\x05\x11\x05\x09\x09" } },
    .{ "SetupDeleteErrorA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDeleteErrorA", .signature = "\x00\x05\x09\x11\x25\x11\x3d\x11\x3d\x09\x09" } },
    .{ "SetupDeleteErrorW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDeleteErrorW", .signature = "\x00\x05\x09\x11\x25\x11\x05\x11\x05\x09\x09" } },
    .{ "SetupBackupErrorA", MethodRecord{ .library = "SETUPAPI", .import = "SetupBackupErrorA", .signature = "\x00\x06\x09\x11\x25\x11\x3d\x11\x3d\x11\x3d\x09\x09" } },
    .{ "SetupBackupErrorW", MethodRecord{ .library = "SETUPAPI", .import = "SetupBackupErrorW", .signature = "\x00\x06\x09\x11\x25\x11\x05\x11\x05\x11\x05\x09\x09" } },
    .{ "SetupSetDirectoryIdA", MethodRecord{ .library = "SETUPAPI", .import = "SetupSetDirectoryIdA", .signature = "\x00\x03\x11\x59\x0f\x01\x09\x11\x3d" } },
    .{ "SetupSetDirectoryIdW", MethodRecord{ .library = "SETUPAPI", .import = "SetupSetDirectoryIdW", .signature = "\x00\x03\x11\x59\x0f\x01\x09\x11\x05" } },
    .{ "SetupSetDirectoryIdExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupSetDirectoryIdExA", .signature = "\x00\x06\x11\x59\x0f\x01\x09\x11\x3d\x09\x09\x0f\x01" } },
    .{ "SetupSetDirectoryIdExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupSetDirectoryIdExW", .signature = "\x00\x06\x11\x59\x0f\x01\x09\x11\x05\x09\x09\x0f\x01" } },
    .{ "SetupGetSourceInfoA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetSourceInfoA", .signature = "\x00\x06\x11\x59\x0f\x01\x09\x09\x11\x3d\x09\x0f\x09" } },
    .{ "SetupGetSourceInfoW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetSourceInfoW", .signature = "\x00\x06\x11\x59\x0f\x01\x09\x09\x11\x05\x09\x0f\x09" } },
    .{ "SetupInstallFileA", MethodRecord{ .library = "SETUPAPI", .import = "SetupInstallFileA", .signature = "\x00\x08\x11\x59\x0f\x01\x0f\x11\xaa\x21\x11\x3d\x11\x3d\x11\x3d\x11\x89\x81\x12\xaa\x25\x0f\x01" } },
    .{ "SetupInstallFileW", MethodRecord{ .library = "SETUPAPI", .import = "SetupInstallFileW", .signature = "\x00\x08\x11\x59\x0f\x01\x0f\x11\xaa\x21\x11\x05\x11\x05\x11\x05\x11\x89\x81\x12\xaa\x29\x0f\x01" } },
    .{ "SetupInstallFileExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupInstallFileExA", .signature = "\x00\x09\x11\x59\x0f\x01\x0f\x11\xaa\x21\x11\x3d\x11\x3d\x11\x3d\x11\x89\x81\x12\xaa\x25\x0f\x01\x0f\x11\x59" } },
    .{ "SetupInstallFileExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupInstallFileExW", .signature = "\x00\x09\x11\x59\x0f\x01\x0f\x11\xaa\x21\x11\x05\x11\x05\x11\x05\x11\x89\x81\x12\xaa\x29\x0f\x01\x0f\x11\x59" } },
    .{ "SetupOpenFileQueue", MethodRecord{ .library = "SETUPAPI", .import = "SetupOpenFileQueue", .signature = "\x00\x00\x0f\x01" } },
    .{ "SetupCloseFileQueue", MethodRecord{ .library = "SETUPAPI", .import = "SetupCloseFileQueue", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "SetupSetFileQueueAlternatePlatformA", MethodRecord{ .library = "SETUPAPI", .import = "SetupSetFileQueueAlternatePlatformA", .signature = "\x00\x03\x11\x59\x0f\x01\x0f\x11\xaa\x15\x11\x3d" } },
    .{ "SetupSetFileQueueAlternatePlatformW", MethodRecord{ .library = "SETUPAPI", .import = "SetupSetFileQueueAlternatePlatformW", .signature = "\x00\x03\x11\x59\x0f\x01\x0f\x11\xaa\x15\x11\x05" } },
    .{ "SetupSetPlatformPathOverrideA", MethodRecord{ .library = "SETUPAPI", .import = "SetupSetPlatformPathOverrideA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "SetupSetPlatformPathOverrideW", MethodRecord{ .library = "SETUPAPI", .import = "SetupSetPlatformPathOverrideW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "SetupQueueCopyA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueCopyA", .signature = "\x00\x09\x11\x59\x0f\x01\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "SetupQueueCopyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueCopyW", .signature = "\x00\x09\x11\x59\x0f\x01\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "SetupQueueCopyIndirectA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueCopyIndirectA", .signature = "\x00\x01\x11\x59\x0f\x11\xaa\x2d" } },
    .{ "SetupQueueCopyIndirectW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueCopyIndirectW", .signature = "\x00\x01\x11\x59\x0f\x11\xaa\x31" } },
    .{ "SetupQueueDefaultCopyA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueDefaultCopyA", .signature = "\x00\x06\x11\x59\x0f\x01\x0f\x01\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "SetupQueueDefaultCopyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueDefaultCopyW", .signature = "\x00\x06\x11\x59\x0f\x01\x0f\x01\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "SetupQueueCopySectionA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueCopySectionA", .signature = "\x00\x06\x11\x59\x0f\x01\x11\x3d\x0f\x01\x0f\x01\x11\x3d\x09" } },
    .{ "SetupQueueCopySectionW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueCopySectionW", .signature = "\x00\x06\x11\x59\x0f\x01\x11\x05\x0f\x01\x0f\x01\x11\x05\x09" } },
    .{ "SetupQueueDeleteA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueDeleteA", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x3d\x11\x3d" } },
    .{ "SetupQueueDeleteW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueDeleteW", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x05\x11\x05" } },
    .{ "SetupQueueDeleteSectionA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueDeleteSectionA", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x01\x0f\x01\x11\x3d" } },
    .{ "SetupQueueDeleteSectionW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueDeleteSectionW", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x01\x0f\x01\x11\x05" } },
    .{ "SetupQueueRenameA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueRenameA", .signature = "\x00\x05\x11\x59\x0f\x01\x11\x3d\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "SetupQueueRenameW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueRenameW", .signature = "\x00\x05\x11\x59\x0f\x01\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "SetupQueueRenameSectionA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueRenameSectionA", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x01\x0f\x01\x11\x3d" } },
    .{ "SetupQueueRenameSectionW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueueRenameSectionW", .signature = "\x00\x04\x11\x59\x0f\x01\x0f\x01\x0f\x01\x11\x05" } },
    .{ "SetupCommitFileQueueA", MethodRecord{ .library = "SETUPAPI", .import = "SetupCommitFileQueueA", .signature = "\x00\x04\x11\x59\x11\x25\x0f\x01\x12\xaa\x25\x0f\x01" } },
    .{ "SetupCommitFileQueueW", MethodRecord{ .library = "SETUPAPI", .import = "SetupCommitFileQueueW", .signature = "\x00\x04\x11\x59\x11\x25\x0f\x01\x12\xaa\x29\x0f\x01" } },
    .{ "SetupScanFileQueueA", MethodRecord{ .library = "SETUPAPI", .import = "SetupScanFileQueueA", .signature = "\x00\x06\x11\x59\x0f\x01\x11\x89\xbd\x11\x25\x12\xaa\x25\x0f\x01\x0f\x09" } },
    .{ "SetupScanFileQueueW", MethodRecord{ .library = "SETUPAPI", .import = "SetupScanFileQueueW", .signature = "\x00\x06\x11\x59\x0f\x01\x11\x89\xbd\x11\x25\x12\xaa\x29\x0f\x01\x0f\x09" } },
    .{ "SetupGetFileQueueCount", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetFileQueueCount", .signature = "\x00\x03\x11\x59\x0f\x01\x09\x0f\x09" } },
    .{ "SetupGetFileQueueFlags", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetFileQueueFlags", .signature = "\x00\x02\x11\x59\x0f\x01\x0f\x09" } },
    .{ "SetupSetFileQueueFlags", MethodRecord{ .library = "SETUPAPI", .import = "SetupSetFileQueueFlags", .signature = "\x00\x03\x11\x59\x0f\x01\x09\x09" } },
    .{ "SetupCopyOEMInfA", MethodRecord{ .library = "SETUPAPI", .import = "SetupCopyOEMInfA", .signature = "\x00\x08\x11\x59\x11\x3d\x11\x3d\x11\x89\x89\x11\x89\x81\x11\x3d\x09\x0f\x09\x0f\x11\x3d" } },
    .{ "SetupCopyOEMInfW", MethodRecord{ .library = "SETUPAPI", .import = "SetupCopyOEMInfW", .signature = "\x00\x08\x11\x59\x11\x05\x11\x05\x11\x89\x89\x11\x89\x81\x11\x05\x09\x0f\x09\x0f\x11\x05" } },
    .{ "SetupUninstallOEMInfA", MethodRecord{ .library = "SETUPAPI", .import = "SetupUninstallOEMInfA", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x0f\x01" } },
    .{ "SetupUninstallOEMInfW", MethodRecord{ .library = "SETUPAPI", .import = "SetupUninstallOEMInfW", .signature = "\x00\x03\x11\x59\x11\x05\x09\x0f\x01" } },
    .{ "SetupUninstallNewlyCopiedInfs", MethodRecord{ .library = "SETUPAPI", .import = "SetupUninstallNewlyCopiedInfs", .signature = "\x00\x03\x11\x59\x0f\x01\x09\x0f\x01" } },
    .{ "SetupCreateDiskSpaceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupCreateDiskSpaceListA", .signature = "\x00\x03\x0f\x01\x0f\x01\x09\x09" } },
    .{ "SetupCreateDiskSpaceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupCreateDiskSpaceListW", .signature = "\x00\x03\x0f\x01\x0f\x01\x09\x09" } },
    .{ "SetupDuplicateDiskSpaceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDuplicateDiskSpaceListA", .signature = "\x00\x04\x0f\x01\x0f\x01\x0f\x01\x09\x09" } },
    .{ "SetupDuplicateDiskSpaceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDuplicateDiskSpaceListW", .signature = "\x00\x04\x0f\x01\x0f\x01\x0f\x01\x09\x09" } },
    .{ "SetupDestroyDiskSpaceList", MethodRecord{ .library = "SETUPAPI", .import = "SetupDestroyDiskSpaceList", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "SetupQueryDrivesInDiskSpaceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueryDrivesInDiskSpaceListA", .signature = "\x00\x04\x11\x59\x0f\x01\x11\x3d\x09\x0f\x09" } },
    .{ "SetupQueryDrivesInDiskSpaceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueryDrivesInDiskSpaceListW", .signature = "\x00\x04\x11\x59\x0f\x01\x11\x05\x09\x0f\x09" } },
    .{ "SetupQuerySpaceRequiredOnDriveA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQuerySpaceRequiredOnDriveA", .signature = "\x00\x05\x11\x59\x0f\x01\x11\x3d\x0f\x0a\x0f\x01\x09" } },
    .{ "SetupQuerySpaceRequiredOnDriveW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQuerySpaceRequiredOnDriveW", .signature = "\x00\x05\x11\x59\x0f\x01\x11\x05\x0f\x0a\x0f\x01\x09" } },
    .{ "SetupAdjustDiskSpaceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupAdjustDiskSpaceListA", .signature = "\x00\x05\x11\x59\x0f\x01\x11\x3d\x0a\x0f\x01\x09" } },
    .{ "SetupAdjustDiskSpaceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupAdjustDiskSpaceListW", .signature = "\x00\x05\x11\x59\x0f\x01\x11\x05\x0a\x0f\x01\x09" } },
    .{ "SetupAddToDiskSpaceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupAddToDiskSpaceListA", .signature = "\x00\x06\x11\x59\x0f\x01\x11\x3d\x0a\x11\x89\x85\x0f\x01\x09" } },
    .{ "SetupAddToDiskSpaceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupAddToDiskSpaceListW", .signature = "\x00\x06\x11\x59\x0f\x01\x11\x05\x0a\x11\x89\x85\x0f\x01\x09" } },
    .{ "SetupAddSectionToDiskSpaceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupAddSectionToDiskSpaceListA", .signature = "\x00\x07\x11\x59\x0f\x01\x0f\x01\x0f\x01\x11\x3d\x11\x89\x85\x0f\x01\x09" } },
    .{ "SetupAddSectionToDiskSpaceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupAddSectionToDiskSpaceListW", .signature = "\x00\x07\x11\x59\x0f\x01\x0f\x01\x0f\x01\x11\x05\x11\x89\x85\x0f\x01\x09" } },
    .{ "SetupAddInstallSectionToDiskSpaceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupAddInstallSectionToDiskSpaceListA", .signature = "\x00\x06\x11\x59\x0f\x01\x0f\x01\x0f\x01\x11\x3d\x0f\x01\x09" } },
    .{ "SetupAddInstallSectionToDiskSpaceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupAddInstallSectionToDiskSpaceListW", .signature = "\x00\x06\x11\x59\x0f\x01\x0f\x01\x0f\x01\x11\x05\x0f\x01\x09" } },
    .{ "SetupRemoveFromDiskSpaceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupRemoveFromDiskSpaceListA", .signature = "\x00\x05\x11\x59\x0f\x01\x11\x3d\x11\x89\x85\x0f\x01\x09" } },
    .{ "SetupRemoveFromDiskSpaceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupRemoveFromDiskSpaceListW", .signature = "\x00\x05\x11\x59\x0f\x01\x11\x05\x11\x89\x85\x0f\x01\x09" } },
    .{ "SetupRemoveSectionFromDiskSpaceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupRemoveSectionFromDiskSpaceListA", .signature = "\x00\x07\x11\x59\x0f\x01\x0f\x01\x0f\x01\x11\x3d\x11\x89\x85\x0f\x01\x09" } },
    .{ "SetupRemoveSectionFromDiskSpaceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupRemoveSectionFromDiskSpaceListW", .signature = "\x00\x07\x11\x59\x0f\x01\x0f\x01\x0f\x01\x11\x05\x11\x89\x85\x0f\x01\x09" } },
    .{ "SetupRemoveInstallSectionFromDiskSpaceListA", MethodRecord{ .library = "SETUPAPI", .import = "SetupRemoveInstallSectionFromDiskSpaceListA", .signature = "\x00\x06\x11\x59\x0f\x01\x0f\x01\x0f\x01\x11\x3d\x0f\x01\x09" } },
    .{ "SetupRemoveInstallSectionFromDiskSpaceListW", MethodRecord{ .library = "SETUPAPI", .import = "SetupRemoveInstallSectionFromDiskSpaceListW", .signature = "\x00\x06\x11\x59\x0f\x01\x0f\x01\x0f\x01\x11\x05\x0f\x01\x09" } },
    .{ "SetupIterateCabinetA", MethodRecord{ .library = "SETUPAPI", .import = "SetupIterateCabinetA", .signature = "\x00\x04\x11\x59\x11\x3d\x09\x12\xaa\x25\x0f\x01" } },
    .{ "SetupIterateCabinetW", MethodRecord{ .library = "SETUPAPI", .import = "SetupIterateCabinetW", .signature = "\x00\x04\x11\x59\x11\x05\x09\x12\xaa\x29\x0f\x01" } },
    .{ "SetupPromptReboot", MethodRecord{ .library = "SETUPAPI", .import = "SetupPromptReboot", .signature = "\x00\x03\x08\x0f\x01\x11\x25\x11\x59" } },
    .{ "SetupInitDefaultQueueCallback", MethodRecord{ .library = "SETUPAPI", .import = "SetupInitDefaultQueueCallback", .signature = "\x00\x01\x0f\x01\x11\x25" } },
    .{ "SetupInitDefaultQueueCallbackEx", MethodRecord{ .library = "SETUPAPI", .import = "SetupInitDefaultQueueCallbackEx", .signature = "\x00\x05\x0f\x01\x11\x25\x11\x25\x09\x09\x0f\x01" } },
    .{ "SetupTermDefaultQueueCallback", MethodRecord{ .library = "SETUPAPI", .import = "SetupTermDefaultQueueCallback", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "SetupDefaultQueueCallbackA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDefaultQueueCallbackA", .signature = "\x00\x04\x09\x0f\x01\x09\x19\x19" } },
    .{ "SetupDefaultQueueCallbackW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDefaultQueueCallbackW", .signature = "\x00\x04\x09\x0f\x01\x09\x19\x19" } },
    .{ "SetupInstallFromInfSectionA", MethodRecord{ .library = "SETUPAPI", .import = "SetupInstallFromInfSectionA", .signature = "\x00\x0b\x11\x59\x11\x25\x0f\x01\x11\x3d\x09\x11\x55\x11\x3d\x09\x12\xaa\x25\x0f\x01\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupInstallFromInfSectionW", MethodRecord{ .library = "SETUPAPI", .import = "SetupInstallFromInfSectionW", .signature = "\x00\x0b\x11\x59\x11\x25\x0f\x01\x11\x05\x09\x11\x55\x11\x05\x09\x12\xaa\x29\x0f\x01\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupInstallFilesFromInfSectionA", MethodRecord{ .library = "SETUPAPI", .import = "SetupInstallFilesFromInfSectionA", .signature = "\x00\x06\x11\x59\x0f\x01\x0f\x01\x0f\x01\x11\x3d\x11\x3d\x09" } },
    .{ "SetupInstallFilesFromInfSectionW", MethodRecord{ .library = "SETUPAPI", .import = "SetupInstallFilesFromInfSectionW", .signature = "\x00\x06\x11\x59\x0f\x01\x0f\x01\x0f\x01\x11\x05\x11\x05\x09" } },
    .{ "SetupInstallServicesFromInfSectionA", MethodRecord{ .library = "SETUPAPI", .import = "SetupInstallServicesFromInfSectionA", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x3d\x11\x89\xcd" } },
    .{ "SetupInstallServicesFromInfSectionW", MethodRecord{ .library = "SETUPAPI", .import = "SetupInstallServicesFromInfSectionW", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x05\x11\x89\xcd" } },
    .{ "SetupInstallServicesFromInfSectionExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupInstallServicesFromInfSectionExA", .signature = "\x00\x07\x11\x59\x0f\x01\x11\x3d\x11\x89\xcd\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x01\x0f\x01" } },
    .{ "SetupInstallServicesFromInfSectionExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupInstallServicesFromInfSectionExW", .signature = "\x00\x07\x11\x59\x0f\x01\x11\x05\x11\x89\xcd\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x01\x0f\x01" } },
    .{ "InstallHinfSectionA", MethodRecord{ .library = "SETUPAPI", .import = "InstallHinfSectionA", .signature = "\x00\x04\x01\x11\x25\x11\x82\x29\x11\x3d\x08" } },
    .{ "InstallHinfSectionW", MethodRecord{ .library = "SETUPAPI", .import = "InstallHinfSectionW", .signature = "\x00\x04\x01\x11\x25\x11\x82\x29\x11\x05\x08" } },
    .{ "SetupInitializeFileLogA", MethodRecord{ .library = "SETUPAPI", .import = "SetupInitializeFileLogA", .signature = "\x00\x02\x0f\x01\x11\x3d\x09" } },
    .{ "SetupInitializeFileLogW", MethodRecord{ .library = "SETUPAPI", .import = "SetupInitializeFileLogW", .signature = "\x00\x02\x0f\x01\x11\x05\x09" } },
    .{ "SetupTerminateFileLog", MethodRecord{ .library = "SETUPAPI", .import = "SetupTerminateFileLog", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "SetupLogFileA", MethodRecord{ .library = "SETUPAPI", .import = "SetupLogFileA", .signature = "\x00\x09\x11\x59\x0f\x01\x11\x3d\x11\x3d\x11\x3d\x09\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "SetupLogFileW", MethodRecord{ .library = "SETUPAPI", .import = "SetupLogFileW", .signature = "\x00\x09\x11\x59\x0f\x01\x11\x05\x11\x05\x11\x05\x09\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "SetupRemoveFileLogEntryA", MethodRecord{ .library = "SETUPAPI", .import = "SetupRemoveFileLogEntryA", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x3d\x11\x3d" } },
    .{ "SetupRemoveFileLogEntryW", MethodRecord{ .library = "SETUPAPI", .import = "SetupRemoveFileLogEntryW", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x05\x11\x05" } },
    .{ "SetupQueryFileLogA", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueryFileLogA", .signature = "\x00\x07\x11\x59\x0f\x01\x11\x3d\x11\x3d\x11\xaa\x3d\x11\x3d\x09\x0f\x09" } },
    .{ "SetupQueryFileLogW", MethodRecord{ .library = "SETUPAPI", .import = "SetupQueryFileLogW", .signature = "\x00\x07\x11\x59\x0f\x01\x11\x05\x11\x05\x11\xaa\x3d\x11\x05\x09\x0f\x09" } },
    .{ "SetupOpenLog", MethodRecord{ .library = "SETUPAPI", .import = "SetupOpenLog", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "SetupLogErrorA", MethodRecord{ .library = "SETUPAPI", .import = "SetupLogErrorA", .signature = "\x00\x02\x11\x59\x11\x3d\x09" } },
    .{ "SetupLogErrorW", MethodRecord{ .library = "SETUPAPI", .import = "SetupLogErrorW", .signature = "\x00\x02\x11\x59\x11\x05\x09" } },
    .{ "SetupCloseLog", MethodRecord{ .library = "SETUPAPI", .import = "SetupCloseLog", .signature = "\x00\x00\x01" } },
    .{ "SetupGetThreadLogToken", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetThreadLogToken", .signature = "\x00\x00\x0b" } },
    .{ "SetupSetThreadLogToken", MethodRecord{ .library = "SETUPAPI", .import = "SetupSetThreadLogToken", .signature = "\x00\x01\x01\x0b" } },
    .{ "SetupWriteTextLog", MethodRecord{ .library = "SETUPAPI", .import = "SetupWriteTextLog", .signature = "\x05\x04\x01\x0b\x09\x09\x11\x3d" } },
    .{ "SetupWriteTextLogError", MethodRecord{ .library = "SETUPAPI", .import = "SetupWriteTextLogError", .signature = "\x05\x05\x01\x0b\x09\x09\x09\x11\x3d" } },
    .{ "SetupWriteTextLogInfLine", MethodRecord{ .library = "SETUPAPI", .import = "SetupWriteTextLogInfLine", .signature = "\x00\x04\x01\x0b\x09\x0f\x01\x0f\x11\xaa\x21" } },
    .{ "SetupGetBackupInformationA", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetBackupInformationA", .signature = "\x00\x02\x11\x59\x0f\x01\x0f\x11\xaa\x41" } },
    .{ "SetupGetBackupInformationW", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetBackupInformationW", .signature = "\x00\x02\x11\x59\x0f\x01\x0f\x11\xaa\x45" } },
    .{ "SetupPrepareQueueForRestoreA", MethodRecord{ .library = "SETUPAPI", .import = "SetupPrepareQueueForRestoreA", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x3d\x09" } },
    .{ "SetupPrepareQueueForRestoreW", MethodRecord{ .library = "SETUPAPI", .import = "SetupPrepareQueueForRestoreW", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x05\x09" } },
    .{ "SetupSetNonInteractiveMode", MethodRecord{ .library = "SETUPAPI", .import = "SetupSetNonInteractiveMode", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "SetupGetNonInteractiveMode", MethodRecord{ .library = "SETUPAPI", .import = "SetupGetNonInteractiveMode", .signature = "\x00\x00\x11\x59" } },
    .{ "SetupDiCreateDeviceInfoList", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiCreateDeviceInfoList", .signature = "\x00\x02\x11\xaa\x35\x0f\x11\x0d\x11\x25" } },
    .{ "SetupDiCreateDeviceInfoListExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiCreateDeviceInfoListExA", .signature = "\x00\x04\x11\xaa\x35\x0f\x11\x0d\x11\x25\x11\x3d\x0f\x01" } },
    .{ "SetupDiCreateDeviceInfoListExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiCreateDeviceInfoListExW", .signature = "\x00\x04\x11\xaa\x35\x0f\x11\x0d\x11\x25\x11\x05\x0f\x01" } },
    .{ "SetupDiGetDeviceInfoListClass", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDeviceInfoListClass", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\x0d" } },
    .{ "SetupDiGetDeviceInfoListDetailA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDeviceInfoListDetailA", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x49" } },
    .{ "SetupDiGetDeviceInfoListDetailW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDeviceInfoListDetailW", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x4d" } },
    .{ "SetupDiCreateDeviceInfoA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiCreateDeviceInfoA", .signature = "\x00\x07\x11\x59\x11\xaa\x35\x11\x3d\x0f\x11\x0d\x11\x3d\x11\x25\x11\x8a\x01\x0f\x11\xaa\x39" } },
    .{ "SetupDiCreateDeviceInfoW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiCreateDeviceInfoW", .signature = "\x00\x07\x11\x59\x11\xaa\x35\x11\x05\x0f\x11\x0d\x11\x05\x11\x25\x11\x8a\x01\x0f\x11\xaa\x39" } },
    .{ "SetupDiOpenDeviceInfoA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiOpenDeviceInfoA", .signature = "\x00\x05\x11\x59\x11\xaa\x35\x11\x3d\x11\x25\x09\x0f\x11\xaa\x39" } },
    .{ "SetupDiOpenDeviceInfoW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiOpenDeviceInfoW", .signature = "\x00\x05\x11\x59\x11\xaa\x35\x11\x05\x11\x25\x09\x0f\x11\xaa\x39" } },
    .{ "SetupDiGetDeviceInstanceIdA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDeviceInstanceIdA", .signature = "\x00\x05\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x11\x3d\x09\x0f\x09" } },
    .{ "SetupDiGetDeviceInstanceIdW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDeviceInstanceIdW", .signature = "\x00\x05\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x11\x05\x09\x0f\x09" } },
    .{ "SetupDiDeleteDeviceInfo", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiDeleteDeviceInfo", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiEnumDeviceInfo", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiEnumDeviceInfo", .signature = "\x00\x03\x11\x59\x11\xaa\x35\x09\x0f\x11\xaa\x39" } },
    .{ "SetupDiDestroyDeviceInfoList", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiDestroyDeviceInfoList", .signature = "\x00\x01\x11\x59\x11\xaa\x35" } },
    .{ "SetupDiEnumDeviceInterfaces", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiEnumDeviceInterfaces", .signature = "\x00\x05\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\x0d\x09\x0f\x11\xaa\x51" } },
    .{ "SetupDiCreateDeviceInterfaceA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiCreateDeviceInterfaceA", .signature = "\x00\x06\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\x0d\x11\x3d\x09\x0f\x11\xaa\x51" } },
    .{ "SetupDiCreateDeviceInterfaceW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiCreateDeviceInterfaceW", .signature = "\x00\x06\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\x0d\x11\x05\x09\x0f\x11\xaa\x51" } },
    .{ "SetupDiOpenDeviceInterfaceA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiOpenDeviceInterfaceA", .signature = "\x00\x04\x11\x59\x11\xaa\x35\x11\x3d\x09\x0f\x11\xaa\x51" } },
    .{ "SetupDiOpenDeviceInterfaceW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiOpenDeviceInterfaceW", .signature = "\x00\x04\x11\x59\x11\xaa\x35\x11\x05\x09\x0f\x11\xaa\x51" } },
    .{ "SetupDiGetDeviceInterfaceAlias", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDeviceInterfaceAlias", .signature = "\x00\x04\x11\x59\x11\xaa\x35\x0f\x11\xaa\x51\x0f\x11\x0d\x0f\x11\xaa\x51" } },
    .{ "SetupDiDeleteDeviceInterfaceData", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiDeleteDeviceInterfaceData", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x51" } },
    .{ "SetupDiRemoveDeviceInterface", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiRemoveDeviceInterface", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x51" } },
    .{ "SetupDiGetDeviceInterfaceDetailA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDeviceInterfaceDetailA", .signature = "\x00\x06\x11\x59\x11\xaa\x35\x0f\x11\xaa\x51\x0f\x11\xaa\x55\x09\x0f\x09\x0f\x11\xaa\x39" } },
    .{ "SetupDiGetDeviceInterfaceDetailW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDeviceInterfaceDetailW", .signature = "\x00\x06\x11\x59\x11\xaa\x35\x0f\x11\xaa\x51\x0f\x11\xaa\x59\x09\x0f\x09\x0f\x11\xaa\x39" } },
    .{ "SetupDiInstallDeviceInterfaces", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiInstallDeviceInterfaces", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiSetDeviceInterfaceDefault", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetDeviceInterfaceDefault", .signature = "\x00\x04\x11\x59\x11\xaa\x35\x0f\x11\xaa\x51\x09\x0f\x01" } },
    .{ "SetupDiRegisterDeviceInfo", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiRegisterDeviceInfo", .signature = "\x00\x06\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x09\x12\xaa\x5d\x0f\x01\x0f\x11\xaa\x39" } },
    .{ "SetupDiBuildDriverInfoList", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiBuildDriverInfoList", .signature = "\x00\x03\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x11\x89\x8d" } },
    .{ "SetupDiCancelDriverInfoSearch", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiCancelDriverInfoSearch", .signature = "\x00\x01\x11\x59\x11\xaa\x35" } },
    .{ "SetupDiEnumDriverInfoA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiEnumDriverInfoA", .signature = "\x00\x05\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x11\x89\x8d\x09\x0f\x11\xaa\x61" } },
    .{ "SetupDiEnumDriverInfoW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiEnumDriverInfoW", .signature = "\x00\x05\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x11\x89\x8d\x09\x0f\x11\xaa\x65" } },
    .{ "SetupDiGetSelectedDriverA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetSelectedDriverA", .signature = "\x00\x03\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x61" } },
    .{ "SetupDiGetSelectedDriverW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetSelectedDriverW", .signature = "\x00\x03\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x65" } },
    .{ "SetupDiSetSelectedDriverA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetSelectedDriverA", .signature = "\x00\x03\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x61" } },
    .{ "SetupDiSetSelectedDriverW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetSelectedDriverW", .signature = "\x00\x03\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x65" } },
    .{ "SetupDiGetDriverInfoDetailA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDriverInfoDetailA", .signature = "\x00\x06\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x61\x0f\x11\xaa\x69\x09\x0f\x09" } },
    .{ "SetupDiGetDriverInfoDetailW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDriverInfoDetailW", .signature = "\x00\x06\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x65\x0f\x11\xaa\x6d\x09\x0f\x09" } },
    .{ "SetupDiDestroyDriverInfoList", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiDestroyDriverInfoList", .signature = "\x00\x03\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x11\x89\x8d" } },
    .{ "SetupDiGetClassDevsA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassDevsA", .signature = "\x00\x04\x11\xaa\x35\x0f\x11\x0d\x11\x3d\x11\x25\x11\x8a\x15" } },
    .{ "SetupDiGetClassDevsW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassDevsW", .signature = "\x00\x04\x11\xaa\x35\x0f\x11\x0d\x11\x05\x11\x25\x11\x8a\x15" } },
    .{ "SetupDiGetClassDevsExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassDevsExA", .signature = "\x00\x07\x11\xaa\x35\x0f\x11\x0d\x11\x3d\x11\x25\x11\x8a\x15\x11\xaa\x35\x11\x3d\x0f\x01" } },
    .{ "SetupDiGetClassDevsExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassDevsExW", .signature = "\x00\x07\x11\xaa\x35\x0f\x11\x0d\x11\x05\x11\x25\x11\x8a\x15\x11\xaa\x35\x11\x05\x0f\x01" } },
    .{ "SetupDiGetINFClassA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetINFClassA", .signature = "\x00\x05\x11\x59\x11\x3d\x0f\x11\x0d\x11\x3d\x09\x0f\x09" } },
    .{ "SetupDiGetINFClassW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetINFClassW", .signature = "\x00\x05\x11\x59\x11\x05\x0f\x11\x0d\x11\x05\x09\x0f\x09" } },
    .{ "SetupDiBuildClassInfoList", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiBuildClassInfoList", .signature = "\x00\x04\x11\x59\x09\x0f\x11\x0d\x09\x0f\x09" } },
    .{ "SetupDiBuildClassInfoListExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiBuildClassInfoListExA", .signature = "\x00\x06\x11\x59\x09\x0f\x11\x0d\x09\x0f\x09\x11\x3d\x0f\x01" } },
    .{ "SetupDiBuildClassInfoListExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiBuildClassInfoListExW", .signature = "\x00\x06\x11\x59\x09\x0f\x11\x0d\x09\x0f\x09\x11\x05\x0f\x01" } },
    .{ "SetupDiGetClassDescriptionA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassDescriptionA", .signature = "\x00\x04\x11\x59\x0f\x11\x0d\x11\x3d\x09\x0f\x09" } },
    .{ "SetupDiGetClassDescriptionW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassDescriptionW", .signature = "\x00\x04\x11\x59\x0f\x11\x0d\x11\x05\x09\x0f\x09" } },
    .{ "SetupDiGetClassDescriptionExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassDescriptionExA", .signature = "\x00\x06\x11\x59\x0f\x11\x0d\x11\x3d\x09\x0f\x09\x11\x3d\x0f\x01" } },
    .{ "SetupDiGetClassDescriptionExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassDescriptionExW", .signature = "\x00\x06\x11\x59\x0f\x11\x0d\x11\x05\x09\x0f\x09\x11\x05\x0f\x01" } },
    .{ "SetupDiCallClassInstaller", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiCallClassInstaller", .signature = "\x00\x03\x11\x59\x11\x8a\x19\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiSelectDevice", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSelectDevice", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiSelectBestCompatDrv", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSelectBestCompatDrv", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiInstallDevice", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiInstallDevice", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiInstallDriverFiles", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiInstallDriverFiles", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiRegisterCoDeviceInstallers", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiRegisterCoDeviceInstallers", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiRemoveDevice", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiRemoveDevice", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiUnremoveDevice", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiUnremoveDevice", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiRestartDevices", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiRestartDevices", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiChangeState", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiChangeState", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiInstallClassA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiInstallClassA", .signature = "\x00\x04\x11\x59\x11\x25\x11\x3d\x09\x0f\x01" } },
    .{ "SetupDiInstallClassW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiInstallClassW", .signature = "\x00\x04\x11\x59\x11\x25\x11\x05\x09\x0f\x01" } },
    .{ "SetupDiInstallClassExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiInstallClassExA", .signature = "\x00\x07\x11\x59\x11\x25\x11\x3d\x09\x0f\x01\x0f\x11\x0d\x0f\x01\x0f\x01" } },
    .{ "SetupDiInstallClassExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiInstallClassExW", .signature = "\x00\x07\x11\x59\x11\x25\x11\x05\x09\x0f\x01\x0f\x11\x0d\x0f\x01\x0f\x01" } },
    .{ "SetupDiOpenClassRegKey", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiOpenClassRegKey", .signature = "\x00\x02\x11\x55\x0f\x11\x0d\x09" } },
    .{ "SetupDiOpenClassRegKeyExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiOpenClassRegKeyExA", .signature = "\x00\x05\x11\x55\x0f\x11\x0d\x09\x09\x11\x3d\x0f\x01" } },
    .{ "SetupDiOpenClassRegKeyExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiOpenClassRegKeyExW", .signature = "\x00\x05\x11\x55\x0f\x11\x0d\x09\x09\x11\x05\x0f\x01" } },
    .{ "SetupDiCreateDeviceInterfaceRegKeyA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiCreateDeviceInterfaceRegKeyA", .signature = "\x00\x06\x11\x55\x11\xaa\x35\x0f\x11\xaa\x51\x09\x09\x0f\x01\x11\x3d" } },
    .{ "SetupDiCreateDeviceInterfaceRegKeyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiCreateDeviceInterfaceRegKeyW", .signature = "\x00\x06\x11\x55\x11\xaa\x35\x0f\x11\xaa\x51\x09\x09\x0f\x01\x11\x05" } },
    .{ "SetupDiOpenDeviceInterfaceRegKey", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiOpenDeviceInterfaceRegKey", .signature = "\x00\x04\x11\x55\x11\xaa\x35\x0f\x11\xaa\x51\x09\x09" } },
    .{ "SetupDiDeleteDeviceInterfaceRegKey", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiDeleteDeviceInterfaceRegKey", .signature = "\x00\x03\x11\x59\x11\xaa\x35\x0f\x11\xaa\x51\x09" } },
    .{ "SetupDiCreateDevRegKeyA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiCreateDevRegKeyA", .signature = "\x00\x07\x11\x55\x11\xaa\x35\x0f\x11\xaa\x39\x09\x09\x09\x0f\x01\x11\x3d" } },
    .{ "SetupDiCreateDevRegKeyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiCreateDevRegKeyW", .signature = "\x00\x07\x11\x55\x11\xaa\x35\x0f\x11\xaa\x39\x09\x09\x09\x0f\x01\x11\x05" } },
    .{ "SetupDiOpenDevRegKey", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiOpenDevRegKey", .signature = "\x00\x06\x11\x55\x11\xaa\x35\x0f\x11\xaa\x39\x09\x09\x09\x09" } },
    .{ "SetupDiDeleteDevRegKey", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiDeleteDevRegKey", .signature = "\x00\x05\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x09\x09\x09" } },
    .{ "SetupDiGetHwProfileList", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetHwProfileList", .signature = "\x00\x04\x11\x59\x0f\x09\x09\x0f\x09\x0f\x09" } },
    .{ "SetupDiGetHwProfileListExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetHwProfileListExA", .signature = "\x00\x06\x11\x59\x0f\x09\x09\x0f\x09\x0f\x09\x11\x3d\x0f\x01" } },
    .{ "SetupDiGetHwProfileListExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetHwProfileListExW", .signature = "\x00\x06\x11\x59\x0f\x09\x09\x0f\x09\x0f\x09\x11\x05\x0f\x01" } },
    .{ "SetupDiGetDevicePropertyKeys", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDevicePropertyKeys", .signature = "\x00\x06\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\x8a\x39\x09\x0f\x09\x09" } },
    .{ "SetupDiGetDevicePropertyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDevicePropertyW", .signature = "\x00\x08\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\x8a\x39\x0f\x11\x8a\x3d\x0f\x05\x09\x0f\x09\x09" } },
    .{ "SetupDiSetDevicePropertyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetDevicePropertyW", .signature = "\x00\x07\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\x8a\x39\x11\x8a\x3d\x0f\x05\x09\x09" } },
    .{ "SetupDiGetDeviceInterfacePropertyKeys", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDeviceInterfacePropertyKeys", .signature = "\x00\x06\x11\x59\x11\xaa\x35\x0f\x11\xaa\x51\x0f\x11\x8a\x39\x09\x0f\x09\x09" } },
    .{ "SetupDiGetDeviceInterfacePropertyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDeviceInterfacePropertyW", .signature = "\x00\x08\x11\x59\x11\xaa\x35\x0f\x11\xaa\x51\x0f\x11\x8a\x39\x0f\x11\x8a\x3d\x0f\x05\x09\x0f\x09\x09" } },
    .{ "SetupDiSetDeviceInterfacePropertyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetDeviceInterfacePropertyW", .signature = "\x00\x07\x11\x59\x11\xaa\x35\x0f\x11\xaa\x51\x0f\x11\x8a\x39\x11\x8a\x3d\x0f\x05\x09\x09" } },
    .{ "SetupDiGetClassPropertyKeys", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassPropertyKeys", .signature = "\x00\x05\x11\x59\x0f\x11\x0d\x0f\x11\x8a\x39\x09\x0f\x09\x09" } },
    .{ "SetupDiGetClassPropertyKeysExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassPropertyKeysExW", .signature = "\x00\x07\x11\x59\x0f\x11\x0d\x0f\x11\x8a\x39\x09\x0f\x09\x09\x11\x05\x0f\x01" } },
    .{ "SetupDiGetClassPropertyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassPropertyW", .signature = "\x00\x07\x11\x59\x0f\x11\x0d\x0f\x11\x8a\x39\x0f\x11\x8a\x3d\x0f\x05\x09\x0f\x09\x09" } },
    .{ "SetupDiGetClassPropertyExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassPropertyExW", .signature = "\x00\x09\x11\x59\x0f\x11\x0d\x0f\x11\x8a\x39\x0f\x11\x8a\x3d\x0f\x05\x09\x0f\x09\x09\x11\x05\x0f\x01" } },
    .{ "SetupDiSetClassPropertyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetClassPropertyW", .signature = "\x00\x06\x11\x59\x0f\x11\x0d\x0f\x11\x8a\x39\x11\x8a\x3d\x0f\x05\x09\x09" } },
    .{ "SetupDiSetClassPropertyExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetClassPropertyExW", .signature = "\x00\x08\x11\x59\x0f\x11\x0d\x0f\x11\x8a\x39\x11\x8a\x3d\x0f\x05\x09\x09\x11\x05\x0f\x01" } },
    .{ "SetupDiGetDeviceRegistryPropertyA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDeviceRegistryPropertyA", .signature = "\x00\x07\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x11\x89\xfd\x0f\x09\x0f\x05\x09\x0f\x09" } },
    .{ "SetupDiGetDeviceRegistryPropertyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDeviceRegistryPropertyW", .signature = "\x00\x07\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x11\x89\xfd\x0f\x09\x0f\x05\x09\x0f\x09" } },
    .{ "SetupDiGetClassRegistryPropertyA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassRegistryPropertyA", .signature = "\x00\x08\x11\x59\x0f\x11\x0d\x09\x0f\x09\x0f\x05\x09\x0f\x09\x11\x3d\x0f\x01" } },
    .{ "SetupDiGetClassRegistryPropertyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassRegistryPropertyW", .signature = "\x00\x08\x11\x59\x0f\x11\x0d\x09\x0f\x09\x0f\x05\x09\x0f\x09\x11\x05\x0f\x01" } },
    .{ "SetupDiSetDeviceRegistryPropertyA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetDeviceRegistryPropertyA", .signature = "\x00\x05\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x11\x89\xfd\x0f\x05\x09" } },
    .{ "SetupDiSetDeviceRegistryPropertyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetDeviceRegistryPropertyW", .signature = "\x00\x05\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x11\x89\xfd\x0f\x05\x09" } },
    .{ "SetupDiSetClassRegistryPropertyA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetClassRegistryPropertyA", .signature = "\x00\x06\x11\x59\x0f\x11\x0d\x09\x0f\x05\x09\x11\x3d\x0f\x01" } },
    .{ "SetupDiSetClassRegistryPropertyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetClassRegistryPropertyW", .signature = "\x00\x06\x11\x59\x0f\x11\x0d\x09\x0f\x05\x09\x11\x05\x0f\x01" } },
    .{ "SetupDiGetDeviceInstallParamsA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDeviceInstallParamsA", .signature = "\x00\x03\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x71" } },
    .{ "SetupDiGetDeviceInstallParamsW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDeviceInstallParamsW", .signature = "\x00\x03\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x75" } },
    .{ "SetupDiGetClassInstallParamsA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassInstallParamsA", .signature = "\x00\x05\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x79\x09\x0f\x09" } },
    .{ "SetupDiGetClassInstallParamsW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassInstallParamsW", .signature = "\x00\x05\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x79\x09\x0f\x09" } },
    .{ "SetupDiSetDeviceInstallParamsA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetDeviceInstallParamsA", .signature = "\x00\x03\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x71" } },
    .{ "SetupDiSetDeviceInstallParamsW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetDeviceInstallParamsW", .signature = "\x00\x03\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x75" } },
    .{ "SetupDiSetClassInstallParamsA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetClassInstallParamsA", .signature = "\x00\x04\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x79\x09" } },
    .{ "SetupDiSetClassInstallParamsW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetClassInstallParamsW", .signature = "\x00\x04\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x79\x09" } },
    .{ "SetupDiGetDriverInstallParamsA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDriverInstallParamsA", .signature = "\x00\x04\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x61\x0f\x11\xaa\x7d" } },
    .{ "SetupDiGetDriverInstallParamsW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetDriverInstallParamsW", .signature = "\x00\x04\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x65\x0f\x11\xaa\x7d" } },
    .{ "SetupDiSetDriverInstallParamsA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetDriverInstallParamsA", .signature = "\x00\x04\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x61\x0f\x11\xaa\x7d" } },
    .{ "SetupDiSetDriverInstallParamsW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetDriverInstallParamsW", .signature = "\x00\x04\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x65\x0f\x11\xaa\x7d" } },
    .{ "SetupDiLoadClassIcon", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiLoadClassIcon", .signature = "\x00\x03\x11\x59\x0f\x11\x0d\x0f\x11\x83\x55\x0f\x08" } },
    .{ "SetupDiLoadDeviceIcon", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiLoadDeviceIcon", .signature = "\x00\x06\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x09\x09\x09\x0f\x11\x83\x55" } },
    .{ "SetupDiDrawMiniIcon", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiDrawMiniIcon", .signature = "\x00\x04\x08\x11\x83\x5d\x11\x83\x89\x08\x09" } },
    .{ "SetupDiGetClassBitmapIndex", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassBitmapIndex", .signature = "\x00\x02\x11\x59\x0f\x11\x0d\x0f\x08" } },
    .{ "SetupDiGetClassImageList", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassImageList", .signature = "\x00\x01\x11\x59\x0f\x11\xaa\x81" } },
    .{ "SetupDiGetClassImageListExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassImageListExA", .signature = "\x00\x03\x11\x59\x0f\x11\xaa\x81\x11\x3d\x0f\x01" } },
    .{ "SetupDiGetClassImageListExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassImageListExW", .signature = "\x00\x03\x11\x59\x0f\x11\xaa\x81\x11\x05\x0f\x01" } },
    .{ "SetupDiGetClassImageIndex", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassImageIndex", .signature = "\x00\x03\x11\x59\x0f\x11\xaa\x81\x0f\x11\x0d\x0f\x08" } },
    .{ "SetupDiDestroyClassImageList", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiDestroyClassImageList", .signature = "\x00\x01\x11\x59\x0f\x11\xaa\x81" } },
    .{ "SetupDiGetClassDevPropertySheetsA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassDevPropertySheetsA", .signature = "\x00\x06\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\x83\x3d\x09\x0f\x09\x09" } },
    .{ "SetupDiGetClassDevPropertySheetsW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetClassDevPropertySheetsW", .signature = "\x00\x06\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\x83\x41\x09\x0f\x09\x09" } },
    .{ "SetupDiAskForOEMDisk", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiAskForOEMDisk", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiSelectOEMDrv", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSelectOEMDrv", .signature = "\x00\x03\x11\x59\x11\x25\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiClassNameFromGuidA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiClassNameFromGuidA", .signature = "\x00\x04\x11\x59\x0f\x11\x0d\x11\x3d\x09\x0f\x09" } },
    .{ "SetupDiClassNameFromGuidW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiClassNameFromGuidW", .signature = "\x00\x04\x11\x59\x0f\x11\x0d\x11\x05\x09\x0f\x09" } },
    .{ "SetupDiClassNameFromGuidExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiClassNameFromGuidExA", .signature = "\x00\x06\x11\x59\x0f\x11\x0d\x11\x3d\x09\x0f\x09\x11\x3d\x0f\x01" } },
    .{ "SetupDiClassNameFromGuidExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiClassNameFromGuidExW", .signature = "\x00\x06\x11\x59\x0f\x11\x0d\x11\x05\x09\x0f\x09\x11\x05\x0f\x01" } },
    .{ "SetupDiClassGuidsFromNameA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiClassGuidsFromNameA", .signature = "\x00\x04\x11\x59\x11\x3d\x0f\x11\x0d\x09\x0f\x09" } },
    .{ "SetupDiClassGuidsFromNameW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiClassGuidsFromNameW", .signature = "\x00\x04\x11\x59\x11\x05\x0f\x11\x0d\x09\x0f\x09" } },
    .{ "SetupDiClassGuidsFromNameExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiClassGuidsFromNameExA", .signature = "\x00\x06\x11\x59\x11\x3d\x0f\x11\x0d\x09\x0f\x09\x11\x3d\x0f\x01" } },
    .{ "SetupDiClassGuidsFromNameExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiClassGuidsFromNameExW", .signature = "\x00\x06\x11\x59\x11\x05\x0f\x11\x0d\x09\x0f\x09\x11\x05\x0f\x01" } },
    .{ "SetupDiGetHwProfileFriendlyNameA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetHwProfileFriendlyNameA", .signature = "\x00\x04\x11\x59\x09\x11\x3d\x09\x0f\x09" } },
    .{ "SetupDiGetHwProfileFriendlyNameW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetHwProfileFriendlyNameW", .signature = "\x00\x04\x11\x59\x09\x11\x05\x09\x0f\x09" } },
    .{ "SetupDiGetHwProfileFriendlyNameExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetHwProfileFriendlyNameExA", .signature = "\x00\x06\x11\x59\x09\x11\x3d\x09\x0f\x09\x11\x3d\x0f\x01" } },
    .{ "SetupDiGetHwProfileFriendlyNameExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetHwProfileFriendlyNameExW", .signature = "\x00\x06\x11\x59\x09\x11\x05\x09\x0f\x09\x11\x05\x0f\x01" } },
    .{ "SetupDiGetWizardPage", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetWizardPage", .signature = "\x00\x05\x11\x83\x31\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x85\x09\x09" } },
    .{ "SetupDiGetSelectedDevice", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetSelectedDevice", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiSetSelectedDevice", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiSetSelectedDevice", .signature = "\x00\x02\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39" } },
    .{ "SetupDiGetActualModelsSectionA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetActualModelsSectionA", .signature = "\x00\x06\x11\x59\x0f\x11\xaa\x21\x0f\x11\xaa\x15\x11\x3d\x09\x0f\x09\x0f\x01" } },
    .{ "SetupDiGetActualModelsSectionW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetActualModelsSectionW", .signature = "\x00\x06\x11\x59\x0f\x11\xaa\x21\x0f\x11\xaa\x15\x11\x05\x09\x0f\x09\x0f\x01" } },
    .{ "SetupDiGetActualSectionToInstallA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetActualSectionToInstallA", .signature = "\x00\x06\x11\x59\x0f\x01\x11\x3d\x11\x3d\x09\x0f\x09\x0f\x11\x3d" } },
    .{ "SetupDiGetActualSectionToInstallW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetActualSectionToInstallW", .signature = "\x00\x06\x11\x59\x0f\x01\x11\x05\x11\x05\x09\x0f\x09\x0f\x11\x05" } },
    .{ "SetupDiGetActualSectionToInstallExA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetActualSectionToInstallExA", .signature = "\x00\x08\x11\x59\x0f\x01\x11\x3d\x0f\x11\xaa\x15\x11\x3d\x09\x0f\x09\x0f\x11\x3d\x0f\x01" } },
    .{ "SetupDiGetActualSectionToInstallExW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetActualSectionToInstallExW", .signature = "\x00\x08\x11\x59\x0f\x01\x11\x05\x0f\x11\xaa\x15\x11\x05\x09\x0f\x09\x0f\x11\x05\x0f\x01" } },
    .{ "SetupEnumInfSectionsA", MethodRecord{ .library = "SETUPAPI", .import = "SetupEnumInfSectionsA", .signature = "\x00\x05\x11\x59\x0f\x01\x09\x11\x3d\x09\x0f\x09" } },
    .{ "SetupEnumInfSectionsW", MethodRecord{ .library = "SETUPAPI", .import = "SetupEnumInfSectionsW", .signature = "\x00\x05\x11\x59\x0f\x01\x09\x11\x05\x09\x0f\x09" } },
    .{ "SetupVerifyInfFileA", MethodRecord{ .library = "SETUPAPI", .import = "SetupVerifyInfFileA", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x11\xaa\x15\x0f\x11\xaa\x89" } },
    .{ "SetupVerifyInfFileW", MethodRecord{ .library = "SETUPAPI", .import = "SetupVerifyInfFileW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x11\xaa\x15\x0f\x11\xaa\x8d" } },
    .{ "SetupDiGetCustomDevicePropertyA", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetCustomDevicePropertyA", .signature = "\x00\x08\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x11\x3d\x09\x0f\x09\x0f\x05\x09\x0f\x09" } },
    .{ "SetupDiGetCustomDevicePropertyW", MethodRecord{ .library = "SETUPAPI", .import = "SetupDiGetCustomDevicePropertyW", .signature = "\x00\x08\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x11\x05\x09\x0f\x09\x0f\x05\x09\x0f\x09" } },
    .{ "SetupConfigureWmiFromInfSectionA", MethodRecord{ .library = "SETUPAPI", .import = "SetupConfigureWmiFromInfSectionA", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x3d\x09" } },
    .{ "SetupConfigureWmiFromInfSectionW", MethodRecord{ .library = "SETUPAPI", .import = "SetupConfigureWmiFromInfSectionW", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x05\x09" } },
    .{ "CM_Add_Empty_Log_Conf", MethodRecord{ .library = "CFGMGR32", .import = "CM_Add_Empty_Log_Conf", .signature = "\x00\x04\x11\x8a\x49\x0f\x19\x09\x11\xaa\x91\x09" } },
    .{ "CM_Add_Empty_Log_Conf_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Add_Empty_Log_Conf_Ex", .signature = "\x00\x05\x11\x8a\x49\x0f\x19\x09\x11\xaa\x91\x09\x18" } },
    .{ "CM_Add_IDA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Add_IDA", .signature = "\x00\x03\x11\x8a\x49\x09\x11\x3d\x09" } },
    .{ "CM_Add_IDW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Add_IDW", .signature = "\x00\x03\x11\x8a\x49\x09\x11\x05\x09" } },
    .{ "CM_Add_ID_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Add_ID_ExA", .signature = "\x00\x04\x11\x8a\x49\x09\x11\x3d\x09\x18" } },
    .{ "CM_Add_ID_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Add_ID_ExW", .signature = "\x00\x04\x11\x8a\x49\x09\x11\x05\x09\x18" } },
    .{ "CM_Add_Range", MethodRecord{ .library = "CFGMGR32", .import = "CM_Add_Range", .signature = "\x00\x04\x11\x8a\x49\x0b\x0b\x19\x09" } },
    .{ "CM_Add_Res_Des", MethodRecord{ .library = "CFGMGR32", .import = "CM_Add_Res_Des", .signature = "\x00\x06\x11\x8a\x49\x0f\x19\x19\x09\x0f\x01\x09\x09" } },
    .{ "CM_Add_Res_Des_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Add_Res_Des_Ex", .signature = "\x00\x07\x11\x8a\x49\x0f\x19\x19\x09\x0f\x01\x09\x09\x18" } },
    .{ "CM_Connect_MachineA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Connect_MachineA", .signature = "\x00\x02\x11\x8a\x49\x11\x3d\x0f\x18" } },
    .{ "CM_Connect_MachineW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Connect_MachineW", .signature = "\x00\x02\x11\x8a\x49\x11\x05\x0f\x18" } },
    .{ "CM_Create_DevNodeA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Create_DevNodeA", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x11\x3d\x09\x09" } },
    .{ "CM_Create_DevNodeW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Create_DevNodeW", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x11\x05\x09\x09" } },
    .{ "CM_Create_DevNode_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Create_DevNode_ExA", .signature = "\x00\x05\x11\x8a\x49\x0f\x09\x11\x3d\x09\x09\x18" } },
    .{ "CM_Create_DevNode_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Create_DevNode_ExW", .signature = "\x00\x05\x11\x8a\x49\x0f\x09\x11\x05\x09\x09\x18" } },
    .{ "CM_Create_Range_List", MethodRecord{ .library = "CFGMGR32", .import = "CM_Create_Range_List", .signature = "\x00\x02\x11\x8a\x49\x0f\x19\x09" } },
    .{ "CM_Delete_Class_Key", MethodRecord{ .library = "CFGMGR32", .import = "CM_Delete_Class_Key", .signature = "\x00\x02\x11\x8a\x49\x0f\x11\x0d\x09" } },
    .{ "CM_Delete_Class_Key_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Delete_Class_Key_Ex", .signature = "\x00\x03\x11\x8a\x49\x0f\x11\x0d\x09\x18" } },
    .{ "CM_Delete_DevNode_Key", MethodRecord{ .library = "CFGMGR32", .import = "CM_Delete_DevNode_Key", .signature = "\x00\x03\x11\x8a\x49\x09\x09\x09" } },
    .{ "CM_Delete_DevNode_Key_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Delete_DevNode_Key_Ex", .signature = "\x00\x04\x11\x8a\x49\x09\x09\x09\x18" } },
    .{ "CM_Delete_Range", MethodRecord{ .library = "CFGMGR32", .import = "CM_Delete_Range", .signature = "\x00\x04\x11\x8a\x49\x0b\x0b\x19\x09" } },
    .{ "CM_Detect_Resource_Conflict", MethodRecord{ .library = "CFGMGR32", .import = "CM_Detect_Resource_Conflict", .signature = "\x00\x06\x11\x8a\x49\x09\x09\x0f\x01\x09\x0f\x11\x59\x09" } },
    .{ "CM_Detect_Resource_Conflict_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Detect_Resource_Conflict_Ex", .signature = "\x00\x07\x11\x8a\x49\x09\x09\x0f\x01\x09\x0f\x11\x59\x09\x18" } },
    .{ "CM_Disable_DevNode", MethodRecord{ .library = "CFGMGR32", .import = "CM_Disable_DevNode", .signature = "\x00\x02\x11\x8a\x49\x09\x09" } },
    .{ "CM_Disable_DevNode_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Disable_DevNode_Ex", .signature = "\x00\x03\x11\x8a\x49\x09\x09\x18" } },
    .{ "CM_Disconnect_Machine", MethodRecord{ .library = "CFGMGR32", .import = "CM_Disconnect_Machine", .signature = "\x00\x01\x11\x8a\x49\x18" } },
    .{ "CM_Dup_Range_List", MethodRecord{ .library = "CFGMGR32", .import = "CM_Dup_Range_List", .signature = "\x00\x03\x11\x8a\x49\x19\x19\x09" } },
    .{ "CM_Enable_DevNode", MethodRecord{ .library = "CFGMGR32", .import = "CM_Enable_DevNode", .signature = "\x00\x02\x11\x8a\x49\x09\x09" } },
    .{ "CM_Enable_DevNode_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Enable_DevNode_Ex", .signature = "\x00\x03\x11\x8a\x49\x09\x09\x18" } },
    .{ "CM_Enumerate_Classes", MethodRecord{ .library = "CFGMGR32", .import = "CM_Enumerate_Classes", .signature = "\x00\x03\x11\x8a\x49\x09\x0f\x11\x0d\x11\x89\xb5" } },
    .{ "CM_Enumerate_Classes_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Enumerate_Classes_Ex", .signature = "\x00\x04\x11\x8a\x49\x09\x0f\x11\x0d\x11\x89\xb5\x18" } },
    .{ "CM_Enumerate_EnumeratorsA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Enumerate_EnumeratorsA", .signature = "\x00\x04\x11\x8a\x49\x09\x11\x3d\x0f\x09\x09" } },
    .{ "CM_Enumerate_EnumeratorsW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Enumerate_EnumeratorsW", .signature = "\x00\x04\x11\x8a\x49\x09\x11\x05\x0f\x09\x09" } },
    .{ "CM_Enumerate_Enumerators_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Enumerate_Enumerators_ExA", .signature = "\x00\x05\x11\x8a\x49\x09\x11\x3d\x0f\x09\x09\x18" } },
    .{ "CM_Enumerate_Enumerators_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Enumerate_Enumerators_ExW", .signature = "\x00\x05\x11\x8a\x49\x09\x11\x05\x0f\x09\x09\x18" } },
    .{ "CM_Find_Range", MethodRecord{ .library = "CFGMGR32", .import = "CM_Find_Range", .signature = "\x00\x07\x11\x8a\x49\x0f\x0b\x0b\x09\x0b\x0b\x19\x09" } },
    .{ "CM_First_Range", MethodRecord{ .library = "CFGMGR32", .import = "CM_First_Range", .signature = "\x00\x05\x11\x8a\x49\x19\x0f\x0b\x0f\x0b\x0f\x19\x09" } },
    .{ "CM_Free_Log_Conf", MethodRecord{ .library = "CFGMGR32", .import = "CM_Free_Log_Conf", .signature = "\x00\x02\x11\x8a\x49\x19\x09" } },
    .{ "CM_Free_Log_Conf_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Free_Log_Conf_Ex", .signature = "\x00\x03\x11\x8a\x49\x19\x09\x18" } },
    .{ "CM_Free_Log_Conf_Handle", MethodRecord{ .library = "CFGMGR32", .import = "CM_Free_Log_Conf_Handle", .signature = "\x00\x01\x11\x8a\x49\x19" } },
    .{ "CM_Free_Range_List", MethodRecord{ .library = "CFGMGR32", .import = "CM_Free_Range_List", .signature = "\x00\x02\x11\x8a\x49\x19\x09" } },
    .{ "CM_Free_Res_Des", MethodRecord{ .library = "CFGMGR32", .import = "CM_Free_Res_Des", .signature = "\x00\x03\x11\x8a\x49\x0f\x19\x19\x09" } },
    .{ "CM_Free_Res_Des_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Free_Res_Des_Ex", .signature = "\x00\x04\x11\x8a\x49\x0f\x19\x19\x09\x18" } },
    .{ "CM_Free_Res_Des_Handle", MethodRecord{ .library = "CFGMGR32", .import = "CM_Free_Res_Des_Handle", .signature = "\x00\x01\x11\x8a\x49\x19" } },
    .{ "CM_Get_Child", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Child", .signature = "\x00\x03\x11\x8a\x49\x0f\x09\x09\x09" } },
    .{ "CM_Get_Child_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Child_Ex", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x09\x09\x18" } },
    .{ "CM_Get_Class_NameA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Class_NameA", .signature = "\x00\x04\x11\x8a\x49\x0f\x11\x0d\x11\x3d\x0f\x09\x09" } },
    .{ "CM_Get_Class_NameW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Class_NameW", .signature = "\x00\x04\x11\x8a\x49\x0f\x11\x0d\x11\x05\x0f\x09\x09" } },
    .{ "CM_Get_Class_Name_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Class_Name_ExA", .signature = "\x00\x05\x11\x8a\x49\x0f\x11\x0d\x11\x3d\x0f\x09\x09\x18" } },
    .{ "CM_Get_Class_Name_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Class_Name_ExW", .signature = "\x00\x05\x11\x8a\x49\x0f\x11\x0d\x11\x05\x0f\x09\x09\x18" } },
    .{ "CM_Get_Class_Key_NameA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Class_Key_NameA", .signature = "\x00\x04\x11\x8a\x49\x0f\x11\x0d\x11\x3d\x0f\x09\x09" } },
    .{ "CM_Get_Class_Key_NameW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Class_Key_NameW", .signature = "\x00\x04\x11\x8a\x49\x0f\x11\x0d\x11\x05\x0f\x09\x09" } },
    .{ "CM_Get_Class_Key_Name_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Class_Key_Name_ExA", .signature = "\x00\x05\x11\x8a\x49\x0f\x11\x0d\x11\x3d\x0f\x09\x09\x18" } },
    .{ "CM_Get_Class_Key_Name_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Class_Key_Name_ExW", .signature = "\x00\x05\x11\x8a\x49\x0f\x11\x0d\x11\x05\x0f\x09\x09\x18" } },
    .{ "CM_Get_Depth", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Depth", .signature = "\x00\x03\x11\x8a\x49\x0f\x09\x09\x09" } },
    .{ "CM_Get_Depth_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Depth_Ex", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x09\x09\x18" } },
    .{ "CM_Get_Device_IDA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_IDA", .signature = "\x00\x04\x11\x8a\x49\x09\x11\x3d\x09\x09" } },
    .{ "CM_Get_Device_IDW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_IDW", .signature = "\x00\x04\x11\x8a\x49\x09\x11\x05\x09\x09" } },
    .{ "CM_Get_Device_ID_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_ID_ExA", .signature = "\x00\x05\x11\x8a\x49\x09\x11\x3d\x09\x09\x18" } },
    .{ "CM_Get_Device_ID_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_ID_ExW", .signature = "\x00\x05\x11\x8a\x49\x09\x11\x05\x09\x09\x18" } },
    .{ "CM_Get_Device_ID_ListA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_ID_ListA", .signature = "\x00\x04\x11\x8a\x49\x11\x3d\x11\x3d\x09\x09" } },
    .{ "CM_Get_Device_ID_ListW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_ID_ListW", .signature = "\x00\x04\x11\x8a\x49\x11\x05\x11\x05\x09\x09" } },
    .{ "CM_Get_Device_ID_List_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_ID_List_ExA", .signature = "\x00\x05\x11\x8a\x49\x11\x3d\x11\x3d\x09\x09\x18" } },
    .{ "CM_Get_Device_ID_List_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_ID_List_ExW", .signature = "\x00\x05\x11\x8a\x49\x11\x05\x11\x05\x09\x09\x18" } },
    .{ "CM_Get_Device_ID_List_SizeA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_ID_List_SizeA", .signature = "\x00\x03\x11\x8a\x49\x0f\x09\x11\x3d\x09" } },
    .{ "CM_Get_Device_ID_List_SizeW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_ID_List_SizeW", .signature = "\x00\x03\x11\x8a\x49\x0f\x09\x11\x05\x09" } },
    .{ "CM_Get_Device_ID_List_Size_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_ID_List_Size_ExA", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x11\x3d\x09\x18" } },
    .{ "CM_Get_Device_ID_List_Size_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_ID_List_Size_ExW", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x11\x05\x09\x18" } },
    .{ "CM_Get_Device_ID_Size", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_ID_Size", .signature = "\x00\x03\x11\x8a\x49\x0f\x09\x09\x09" } },
    .{ "CM_Get_Device_ID_Size_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_ID_Size_Ex", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x09\x09\x18" } },
    .{ "CM_Get_DevNode_PropertyW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_DevNode_PropertyW", .signature = "\x00\x06\x11\x8a\x49\x09\x0f\x11\x8a\x39\x0f\x11\x8a\x3d\x0f\x05\x0f\x09\x09" } },
    .{ "CM_Get_DevNode_Property_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_DevNode_Property_ExW", .signature = "\x00\x07\x11\x8a\x49\x09\x0f\x11\x8a\x39\x0f\x11\x8a\x3d\x0f\x05\x0f\x09\x09\x18" } },
    .{ "CM_Get_DevNode_Property_Keys", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_DevNode_Property_Keys", .signature = "\x00\x04\x11\x8a\x49\x09\x0f\x11\x8a\x39\x0f\x09\x09" } },
    .{ "CM_Get_DevNode_Property_Keys_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_DevNode_Property_Keys_Ex", .signature = "\x00\x05\x11\x8a\x49\x09\x0f\x11\x8a\x39\x0f\x09\x09\x18" } },
    .{ "CM_Get_DevNode_Registry_PropertyA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_DevNode_Registry_PropertyA", .signature = "\x00\x06\x11\x8a\x49\x09\x09\x0f\x09\x0f\x01\x0f\x09\x09" } },
    .{ "CM_Get_DevNode_Registry_PropertyW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_DevNode_Registry_PropertyW", .signature = "\x00\x06\x11\x8a\x49\x09\x09\x0f\x09\x0f\x01\x0f\x09\x09" } },
    .{ "CM_Get_DevNode_Registry_Property_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_DevNode_Registry_Property_ExA", .signature = "\x00\x07\x11\x8a\x49\x09\x09\x0f\x09\x0f\x01\x0f\x09\x09\x18" } },
    .{ "CM_Get_DevNode_Registry_Property_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_DevNode_Registry_Property_ExW", .signature = "\x00\x07\x11\x8a\x49\x09\x09\x0f\x09\x0f\x01\x0f\x09\x09\x18" } },
    .{ "CM_Get_DevNode_Custom_PropertyA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_DevNode_Custom_PropertyA", .signature = "\x00\x06\x11\x8a\x49\x09\x11\x3d\x0f\x09\x0f\x01\x0f\x09\x09" } },
    .{ "CM_Get_DevNode_Custom_PropertyW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_DevNode_Custom_PropertyW", .signature = "\x00\x06\x11\x8a\x49\x09\x11\x05\x0f\x09\x0f\x01\x0f\x09\x09" } },
    .{ "CM_Get_DevNode_Custom_Property_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_DevNode_Custom_Property_ExA", .signature = "\x00\x07\x11\x8a\x49\x09\x11\x3d\x0f\x09\x0f\x01\x0f\x09\x09\x18" } },
    .{ "CM_Get_DevNode_Custom_Property_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_DevNode_Custom_Property_ExW", .signature = "\x00\x07\x11\x8a\x49\x09\x11\x05\x0f\x09\x0f\x01\x0f\x09\x09\x18" } },
    .{ "CM_Get_DevNode_Status", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_DevNode_Status", .signature = "\x00\x04\x11\x8a\x49\x0f\x11\x89\xc5\x0f\x11\x89\xc9\x09\x09" } },
    .{ "CM_Get_DevNode_Status_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_DevNode_Status_Ex", .signature = "\x00\x05\x11\x8a\x49\x0f\x11\x89\xc5\x0f\x11\x89\xc9\x09\x09\x18" } },
    .{ "CM_Get_First_Log_Conf", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_First_Log_Conf", .signature = "\x00\x03\x11\x8a\x49\x0f\x19\x09\x11\x89\xc1" } },
    .{ "CM_Get_First_Log_Conf_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_First_Log_Conf_Ex", .signature = "\x00\x04\x11\x8a\x49\x0f\x19\x09\x11\x89\xc1\x18" } },
    .{ "CM_Get_Global_State", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Global_State", .signature = "\x00\x02\x11\x8a\x49\x0f\x09\x09" } },
    .{ "CM_Get_Global_State_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Global_State_Ex", .signature = "\x00\x03\x11\x8a\x49\x0f\x09\x09\x18" } },
    .{ "CM_Get_Hardware_Profile_InfoA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Hardware_Profile_InfoA", .signature = "\x00\x03\x11\x8a\x49\x09\x0f\x11\xaa\x95\x09" } },
    .{ "CM_Get_Hardware_Profile_Info_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Hardware_Profile_Info_ExA", .signature = "\x00\x04\x11\x8a\x49\x09\x0f\x11\xaa\x95\x09\x18" } },
    .{ "CM_Get_Hardware_Profile_InfoW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Hardware_Profile_InfoW", .signature = "\x00\x03\x11\x8a\x49\x09\x0f\x11\xaa\x99\x09" } },
    .{ "CM_Get_Hardware_Profile_Info_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Hardware_Profile_Info_ExW", .signature = "\x00\x04\x11\x8a\x49\x09\x0f\x11\xaa\x99\x09\x18" } },
    .{ "CM_Get_HW_Prof_FlagsA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_HW_Prof_FlagsA", .signature = "\x00\x04\x11\x8a\x49\x11\x3d\x09\x0f\x09\x09" } },
    .{ "CM_Get_HW_Prof_FlagsW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_HW_Prof_FlagsW", .signature = "\x00\x04\x11\x8a\x49\x11\x05\x09\x0f\x09\x09" } },
    .{ "CM_Get_HW_Prof_Flags_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_HW_Prof_Flags_ExA", .signature = "\x00\x05\x11\x8a\x49\x11\x3d\x09\x0f\x09\x09\x18" } },
    .{ "CM_Get_HW_Prof_Flags_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_HW_Prof_Flags_ExW", .signature = "\x00\x05\x11\x8a\x49\x11\x05\x09\x0f\x09\x09\x18" } },
    .{ "CM_Get_Device_Interface_AliasA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_AliasA", .signature = "\x00\x05\x11\x8a\x49\x11\x3d\x0f\x11\x0d\x11\x3d\x0f\x09\x09" } },
    .{ "CM_Get_Device_Interface_AliasW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_AliasW", .signature = "\x00\x05\x11\x8a\x49\x11\x05\x0f\x11\x0d\x11\x05\x0f\x09\x09" } },
    .{ "CM_Get_Device_Interface_Alias_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_Alias_ExA", .signature = "\x00\x06\x11\x8a\x49\x11\x3d\x0f\x11\x0d\x11\x3d\x0f\x09\x09\x18" } },
    .{ "CM_Get_Device_Interface_Alias_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_Alias_ExW", .signature = "\x00\x06\x11\x8a\x49\x11\x05\x0f\x11\x0d\x11\x05\x0f\x09\x09\x18" } },
    .{ "CM_Get_Device_Interface_ListA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_ListA", .signature = "\x00\x05\x11\x8a\x49\x0f\x11\x0d\x11\x3d\x11\x3d\x09\x11\x89\xa9" } },
    .{ "CM_Get_Device_Interface_ListW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_ListW", .signature = "\x00\x05\x11\x8a\x49\x0f\x11\x0d\x11\x05\x11\x05\x09\x11\x89\xa9" } },
    .{ "CM_Get_Device_Interface_List_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_List_ExA", .signature = "\x00\x06\x11\x8a\x49\x0f\x11\x0d\x11\x3d\x11\x3d\x09\x11\x89\xa9\x18" } },
    .{ "CM_Get_Device_Interface_List_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_List_ExW", .signature = "\x00\x06\x11\x8a\x49\x0f\x11\x0d\x11\x05\x11\x05\x09\x11\x89\xa9\x18" } },
    .{ "CM_Get_Device_Interface_List_SizeA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_List_SizeA", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x0f\x11\x0d\x11\x3d\x11\x89\xa9" } },
    .{ "CM_Get_Device_Interface_List_SizeW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_List_SizeW", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x0f\x11\x0d\x11\x05\x11\x89\xa9" } },
    .{ "CM_Get_Device_Interface_List_Size_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_List_Size_ExA", .signature = "\x00\x05\x11\x8a\x49\x0f\x09\x0f\x11\x0d\x11\x3d\x11\x89\xa9\x18" } },
    .{ "CM_Get_Device_Interface_List_Size_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_List_Size_ExW", .signature = "\x00\x05\x11\x8a\x49\x0f\x09\x0f\x11\x0d\x11\x05\x11\x89\xa9\x18" } },
    .{ "CM_Get_Device_Interface_PropertyW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_PropertyW", .signature = "\x00\x06\x11\x8a\x49\x11\x05\x0f\x11\x8a\x39\x0f\x11\x8a\x3d\x0f\x05\x0f\x09\x09" } },
    .{ "CM_Get_Device_Interface_Property_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_Property_ExW", .signature = "\x00\x07\x11\x8a\x49\x11\x05\x0f\x11\x8a\x39\x0f\x11\x8a\x3d\x0f\x05\x0f\x09\x09\x18" } },
    .{ "CM_Get_Device_Interface_Property_KeysW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_Property_KeysW", .signature = "\x00\x04\x11\x8a\x49\x11\x05\x0f\x11\x8a\x39\x0f\x09\x09" } },
    .{ "CM_Get_Device_Interface_Property_Keys_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Device_Interface_Property_Keys_ExW", .signature = "\x00\x05\x11\x8a\x49\x11\x05\x0f\x11\x8a\x39\x0f\x09\x09\x18" } },
    .{ "CM_Get_Log_Conf_Priority", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Log_Conf_Priority", .signature = "\x00\x03\x11\x8a\x49\x19\x0f\x09\x09" } },
    .{ "CM_Get_Log_Conf_Priority_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Log_Conf_Priority_Ex", .signature = "\x00\x04\x11\x8a\x49\x19\x0f\x09\x09\x18" } },
    .{ "CM_Get_Next_Log_Conf", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Next_Log_Conf", .signature = "\x00\x03\x11\x8a\x49\x0f\x19\x19\x09" } },
    .{ "CM_Get_Next_Log_Conf_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Next_Log_Conf_Ex", .signature = "\x00\x04\x11\x8a\x49\x0f\x19\x19\x09\x18" } },
    .{ "CM_Get_Parent", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Parent", .signature = "\x00\x03\x11\x8a\x49\x0f\x09\x09\x09" } },
    .{ "CM_Get_Parent_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Parent_Ex", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x09\x09\x18" } },
    .{ "CM_Get_Res_Des_Data", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Res_Des_Data", .signature = "\x00\x04\x11\x8a\x49\x19\x0f\x01\x09\x09" } },
    .{ "CM_Get_Res_Des_Data_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Res_Des_Data_Ex", .signature = "\x00\x05\x11\x8a\x49\x19\x0f\x01\x09\x09\x18" } },
    .{ "CM_Get_Res_Des_Data_Size", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Res_Des_Data_Size", .signature = "\x00\x03\x11\x8a\x49\x0f\x09\x19\x09" } },
    .{ "CM_Get_Res_Des_Data_Size_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Res_Des_Data_Size_Ex", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x19\x09\x18" } },
    .{ "CM_Get_Sibling", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Sibling", .signature = "\x00\x03\x11\x8a\x49\x0f\x09\x09\x09" } },
    .{ "CM_Get_Sibling_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Sibling_Ex", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x09\x09\x18" } },
    .{ "CM_Get_Version", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Version", .signature = "\x00\x00\x07" } },
    .{ "CM_Get_Version_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Version_Ex", .signature = "\x00\x01\x07\x18" } },
    .{ "CM_Is_Version_Available", MethodRecord{ .library = "CFGMGR32", .import = "CM_Is_Version_Available", .signature = "\x00\x01\x11\x59\x07" } },
    .{ "CM_Is_Version_Available_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Is_Version_Available_Ex", .signature = "\x00\x02\x11\x59\x07\x18" } },
    .{ "CM_Intersect_Range_List", MethodRecord{ .library = "CFGMGR32", .import = "CM_Intersect_Range_List", .signature = "\x00\x04\x11\x8a\x49\x19\x19\x19\x09" } },
    .{ "CM_Invert_Range_List", MethodRecord{ .library = "CFGMGR32", .import = "CM_Invert_Range_List", .signature = "\x00\x04\x11\x8a\x49\x19\x19\x0b\x09" } },
    .{ "CM_Locate_DevNodeA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Locate_DevNodeA", .signature = "\x00\x03\x11\x8a\x49\x0f\x09\x11\x3d\x11\x89\xad" } },
    .{ "CM_Locate_DevNodeW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Locate_DevNodeW", .signature = "\x00\x03\x11\x8a\x49\x0f\x09\x11\x05\x11\x89\xad" } },
    .{ "CM_Locate_DevNode_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Locate_DevNode_ExA", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x11\x3d\x09\x18" } },
    .{ "CM_Locate_DevNode_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Locate_DevNode_ExW", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x11\x05\x09\x18" } },
    .{ "CM_Merge_Range_List", MethodRecord{ .library = "CFGMGR32", .import = "CM_Merge_Range_List", .signature = "\x00\x04\x11\x8a\x49\x19\x19\x19\x09" } },
    .{ "CM_Modify_Res_Des", MethodRecord{ .library = "CFGMGR32", .import = "CM_Modify_Res_Des", .signature = "\x00\x06\x11\x8a\x49\x0f\x19\x19\x09\x0f\x01\x09\x09" } },
    .{ "CM_Modify_Res_Des_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Modify_Res_Des_Ex", .signature = "\x00\x07\x11\x8a\x49\x0f\x19\x19\x09\x0f\x01\x09\x09\x18" } },
    .{ "CM_Move_DevNode", MethodRecord{ .library = "CFGMGR32", .import = "CM_Move_DevNode", .signature = "\x00\x03\x11\x8a\x49\x09\x09\x09" } },
    .{ "CM_Move_DevNode_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Move_DevNode_Ex", .signature = "\x00\x04\x11\x8a\x49\x09\x09\x09\x18" } },
    .{ "CM_Next_Range", MethodRecord{ .library = "CFGMGR32", .import = "CM_Next_Range", .signature = "\x00\x04\x11\x8a\x49\x0f\x19\x0f\x0b\x0f\x0b\x09" } },
    .{ "CM_Get_Next_Res_Des", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Next_Res_Des", .signature = "\x00\x05\x11\x8a\x49\x0f\x19\x19\x11\x89\xa5\x0f\x11\x89\xa5\x09" } },
    .{ "CM_Get_Next_Res_Des_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Next_Res_Des_Ex", .signature = "\x00\x06\x11\x8a\x49\x0f\x19\x19\x11\x89\xa5\x0f\x11\x89\xa5\x09\x18" } },
    .{ "CM_Open_Class_KeyA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Open_Class_KeyA", .signature = "\x00\x06\x11\x8a\x49\x0f\x11\x0d\x11\x3d\x09\x09\x0f\x11\x55\x09" } },
    .{ "CM_Open_Class_KeyW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Open_Class_KeyW", .signature = "\x00\x06\x11\x8a\x49\x0f\x11\x0d\x11\x05\x09\x09\x0f\x11\x55\x09" } },
    .{ "CM_Open_Class_Key_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Open_Class_Key_ExA", .signature = "\x00\x07\x11\x8a\x49\x0f\x11\x0d\x11\x3d\x09\x09\x0f\x11\x55\x09\x18" } },
    .{ "CM_Open_Class_Key_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Open_Class_Key_ExW", .signature = "\x00\x07\x11\x8a\x49\x0f\x11\x0d\x11\x05\x09\x09\x0f\x11\x55\x09\x18" } },
    .{ "CM_Open_DevNode_Key", MethodRecord{ .library = "CFGMGR32", .import = "CM_Open_DevNode_Key", .signature = "\x00\x06\x11\x8a\x49\x09\x09\x09\x09\x0f\x11\x55\x09" } },
    .{ "CM_Open_DevNode_Key_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Open_DevNode_Key_Ex", .signature = "\x00\x07\x11\x8a\x49\x09\x09\x09\x09\x0f\x11\x55\x09\x18" } },
    .{ "CM_Open_Device_Interface_KeyA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Open_Device_Interface_KeyA", .signature = "\x00\x05\x11\x8a\x49\x11\x3d\x09\x09\x0f\x11\x55\x09" } },
    .{ "CM_Open_Device_Interface_KeyW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Open_Device_Interface_KeyW", .signature = "\x00\x05\x11\x8a\x49\x11\x05\x09\x09\x0f\x11\x55\x09" } },
    .{ "CM_Open_Device_Interface_Key_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Open_Device_Interface_Key_ExA", .signature = "\x00\x06\x11\x8a\x49\x11\x3d\x09\x09\x0f\x11\x55\x09\x18" } },
    .{ "CM_Open_Device_Interface_Key_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Open_Device_Interface_Key_ExW", .signature = "\x00\x06\x11\x8a\x49\x11\x05\x09\x09\x0f\x11\x55\x09\x18" } },
    .{ "CM_Delete_Device_Interface_KeyA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Delete_Device_Interface_KeyA", .signature = "\x00\x02\x11\x8a\x49\x11\x3d\x09" } },
    .{ "CM_Delete_Device_Interface_KeyW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Delete_Device_Interface_KeyW", .signature = "\x00\x02\x11\x8a\x49\x11\x05\x09" } },
    .{ "CM_Delete_Device_Interface_Key_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Delete_Device_Interface_Key_ExA", .signature = "\x00\x03\x11\x8a\x49\x11\x3d\x09\x18" } },
    .{ "CM_Delete_Device_Interface_Key_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Delete_Device_Interface_Key_ExW", .signature = "\x00\x03\x11\x8a\x49\x11\x05\x09\x18" } },
    .{ "CM_Query_Arbitrator_Free_Data", MethodRecord{ .library = "CFGMGR32", .import = "CM_Query_Arbitrator_Free_Data", .signature = "\x00\x05\x11\x8a\x49\x0f\x01\x09\x09\x09\x09" } },
    .{ "CM_Query_Arbitrator_Free_Data_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Query_Arbitrator_Free_Data_Ex", .signature = "\x00\x06\x11\x8a\x49\x0f\x01\x09\x09\x09\x09\x18" } },
    .{ "CM_Query_Arbitrator_Free_Size", MethodRecord{ .library = "CFGMGR32", .import = "CM_Query_Arbitrator_Free_Size", .signature = "\x00\x04\x11\x8a\x49\x0f\x09\x09\x09\x09" } },
    .{ "CM_Query_Arbitrator_Free_Size_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Query_Arbitrator_Free_Size_Ex", .signature = "\x00\x05\x11\x8a\x49\x0f\x09\x09\x09\x09\x18" } },
    .{ "CM_Query_Remove_SubTree", MethodRecord{ .library = "CFGMGR32", .import = "CM_Query_Remove_SubTree", .signature = "\x00\x02\x11\x8a\x49\x09\x09" } },
    .{ "CM_Query_Remove_SubTree_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Query_Remove_SubTree_Ex", .signature = "\x00\x03\x11\x8a\x49\x09\x09\x18" } },
    .{ "CM_Query_And_Remove_SubTreeA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Query_And_Remove_SubTreeA", .signature = "\x00\x05\x11\x8a\x49\x09\x0f\x11\xaa\x9d\x11\x3d\x09\x09" } },
    .{ "CM_Query_And_Remove_SubTreeW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Query_And_Remove_SubTreeW", .signature = "\x00\x05\x11\x8a\x49\x09\x0f\x11\xaa\x9d\x11\x05\x09\x09" } },
    .{ "CM_Query_And_Remove_SubTree_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Query_And_Remove_SubTree_ExA", .signature = "\x00\x06\x11\x8a\x49\x09\x0f\x11\xaa\x9d\x11\x3d\x09\x09\x18" } },
    .{ "CM_Query_And_Remove_SubTree_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Query_And_Remove_SubTree_ExW", .signature = "\x00\x06\x11\x8a\x49\x09\x0f\x11\xaa\x9d\x11\x05\x09\x09\x18" } },
    .{ "CM_Request_Device_EjectA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Request_Device_EjectA", .signature = "\x00\x05\x11\x8a\x49\x09\x0f\x11\xaa\x9d\x11\x3d\x09\x09" } },
    .{ "CM_Request_Device_Eject_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Request_Device_Eject_ExA", .signature = "\x00\x06\x11\x8a\x49\x09\x0f\x11\xaa\x9d\x11\x3d\x09\x09\x18" } },
    .{ "CM_Request_Device_EjectW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Request_Device_EjectW", .signature = "\x00\x05\x11\x8a\x49\x09\x0f\x11\xaa\x9d\x11\x05\x09\x09" } },
    .{ "CM_Request_Device_Eject_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Request_Device_Eject_ExW", .signature = "\x00\x06\x11\x8a\x49\x09\x0f\x11\xaa\x9d\x11\x05\x09\x09\x18" } },
    .{ "CM_Reenumerate_DevNode", MethodRecord{ .library = "CFGMGR32", .import = "CM_Reenumerate_DevNode", .signature = "\x00\x02\x11\x8a\x49\x09\x11\x89\xb1" } },
    .{ "CM_Reenumerate_DevNode_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Reenumerate_DevNode_Ex", .signature = "\x00\x03\x11\x8a\x49\x09\x09\x18" } },
    .{ "CM_Register_Device_InterfaceA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Register_Device_InterfaceA", .signature = "\x00\x06\x11\x8a\x49\x09\x0f\x11\x0d\x11\x3d\x11\x3d\x0f\x09\x09" } },
    .{ "CM_Register_Device_InterfaceW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Register_Device_InterfaceW", .signature = "\x00\x06\x11\x8a\x49\x09\x0f\x11\x0d\x11\x05\x11\x05\x0f\x09\x09" } },
    .{ "CM_Register_Device_Interface_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Register_Device_Interface_ExA", .signature = "\x00\x07\x11\x8a\x49\x09\x0f\x11\x0d\x11\x3d\x11\x3d\x0f\x09\x09\x18" } },
    .{ "CM_Register_Device_Interface_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Register_Device_Interface_ExW", .signature = "\x00\x07\x11\x8a\x49\x09\x0f\x11\x0d\x11\x05\x11\x05\x0f\x09\x09\x18" } },
    .{ "CM_Set_DevNode_Problem_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_DevNode_Problem_Ex", .signature = "\x00\x04\x11\x8a\x49\x09\x09\x09\x18" } },
    .{ "CM_Set_DevNode_Problem", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_DevNode_Problem", .signature = "\x00\x03\x11\x8a\x49\x09\x09\x09" } },
    .{ "CM_Unregister_Device_InterfaceA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Unregister_Device_InterfaceA", .signature = "\x00\x02\x11\x8a\x49\x11\x3d\x09" } },
    .{ "CM_Unregister_Device_InterfaceW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Unregister_Device_InterfaceW", .signature = "\x00\x02\x11\x8a\x49\x11\x05\x09" } },
    .{ "CM_Unregister_Device_Interface_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Unregister_Device_Interface_ExA", .signature = "\x00\x03\x11\x8a\x49\x11\x3d\x09\x18" } },
    .{ "CM_Unregister_Device_Interface_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Unregister_Device_Interface_ExW", .signature = "\x00\x03\x11\x8a\x49\x11\x05\x09\x18" } },
    .{ "CM_Register_Device_Driver", MethodRecord{ .library = "CFGMGR32", .import = "CM_Register_Device_Driver", .signature = "\x00\x02\x11\x8a\x49\x09\x09" } },
    .{ "CM_Register_Device_Driver_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Register_Device_Driver_Ex", .signature = "\x00\x03\x11\x8a\x49\x09\x09\x18" } },
    .{ "CM_Remove_SubTree", MethodRecord{ .library = "CFGMGR32", .import = "CM_Remove_SubTree", .signature = "\x00\x02\x11\x8a\x49\x09\x09" } },
    .{ "CM_Remove_SubTree_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Remove_SubTree_Ex", .signature = "\x00\x03\x11\x8a\x49\x09\x09\x18" } },
    .{ "CM_Set_DevNode_PropertyW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_DevNode_PropertyW", .signature = "\x00\x06\x11\x8a\x49\x09\x0f\x11\x8a\x39\x11\x8a\x3d\x0f\x05\x09\x09" } },
    .{ "CM_Set_DevNode_Property_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_DevNode_Property_ExW", .signature = "\x00\x07\x11\x8a\x49\x09\x0f\x11\x8a\x39\x11\x8a\x3d\x0f\x05\x09\x09\x18" } },
    .{ "CM_Set_DevNode_Registry_PropertyA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_DevNode_Registry_PropertyA", .signature = "\x00\x05\x11\x8a\x49\x09\x09\x0f\x01\x09\x09" } },
    .{ "CM_Set_DevNode_Registry_PropertyW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_DevNode_Registry_PropertyW", .signature = "\x00\x05\x11\x8a\x49\x09\x09\x0f\x01\x09\x09" } },
    .{ "CM_Set_DevNode_Registry_Property_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_DevNode_Registry_Property_ExA", .signature = "\x00\x06\x11\x8a\x49\x09\x09\x0f\x01\x09\x09\x18" } },
    .{ "CM_Set_DevNode_Registry_Property_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_DevNode_Registry_Property_ExW", .signature = "\x00\x06\x11\x8a\x49\x09\x09\x0f\x01\x09\x09\x18" } },
    .{ "CM_Set_Device_Interface_PropertyW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_Device_Interface_PropertyW", .signature = "\x00\x06\x11\x8a\x49\x11\x05\x0f\x11\x8a\x39\x11\x8a\x3d\x0f\x05\x09\x09" } },
    .{ "CM_Set_Device_Interface_Property_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_Device_Interface_Property_ExW", .signature = "\x00\x07\x11\x8a\x49\x11\x05\x0f\x11\x8a\x39\x11\x8a\x3d\x0f\x05\x09\x09\x18" } },
    .{ "CM_Is_Dock_Station_Present", MethodRecord{ .library = "CFGMGR32", .import = "CM_Is_Dock_Station_Present", .signature = "\x00\x01\x11\x8a\x49\x0f\x11\x59" } },
    .{ "CM_Is_Dock_Station_Present_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Is_Dock_Station_Present_Ex", .signature = "\x00\x02\x11\x8a\x49\x0f\x11\x59\x18" } },
    .{ "CM_Request_Eject_PC", MethodRecord{ .library = "CFGMGR32", .import = "CM_Request_Eject_PC", .signature = "\x00\x00\x11\x8a\x49" } },
    .{ "CM_Request_Eject_PC_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Request_Eject_PC_Ex", .signature = "\x00\x01\x11\x8a\x49\x18" } },
    .{ "CM_Set_HW_Prof_FlagsA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_HW_Prof_FlagsA", .signature = "\x00\x04\x11\x8a\x49\x11\x3d\x09\x09\x09" } },
    .{ "CM_Set_HW_Prof_FlagsW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_HW_Prof_FlagsW", .signature = "\x00\x04\x11\x8a\x49\x11\x05\x09\x09\x09" } },
    .{ "CM_Set_HW_Prof_Flags_ExA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_HW_Prof_Flags_ExA", .signature = "\x00\x05\x11\x8a\x49\x11\x3d\x09\x09\x09\x18" } },
    .{ "CM_Set_HW_Prof_Flags_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_HW_Prof_Flags_ExW", .signature = "\x00\x05\x11\x8a\x49\x11\x05\x09\x09\x09\x18" } },
    .{ "CM_Setup_DevNode", MethodRecord{ .library = "CFGMGR32", .import = "CM_Setup_DevNode", .signature = "\x00\x02\x11\x8a\x49\x09\x09" } },
    .{ "CM_Setup_DevNode_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Setup_DevNode_Ex", .signature = "\x00\x03\x11\x8a\x49\x09\x09\x18" } },
    .{ "CM_Test_Range_Available", MethodRecord{ .library = "CFGMGR32", .import = "CM_Test_Range_Available", .signature = "\x00\x04\x11\x8a\x49\x0b\x0b\x19\x09" } },
    .{ "CM_Uninstall_DevNode", MethodRecord{ .library = "CFGMGR32", .import = "CM_Uninstall_DevNode", .signature = "\x00\x02\x11\x8a\x49\x09\x09" } },
    .{ "CM_Uninstall_DevNode_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Uninstall_DevNode_Ex", .signature = "\x00\x03\x11\x8a\x49\x09\x09\x18" } },
    .{ "CM_Run_Detection", MethodRecord{ .library = "CFGMGR32", .import = "CM_Run_Detection", .signature = "\x00\x01\x11\x8a\x49\x09" } },
    .{ "CM_Run_Detection_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Run_Detection_Ex", .signature = "\x00\x02\x11\x8a\x49\x09\x18" } },
    .{ "CM_Set_HW_Prof", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_HW_Prof", .signature = "\x00\x02\x11\x8a\x49\x09\x09" } },
    .{ "CM_Set_HW_Prof_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_HW_Prof_Ex", .signature = "\x00\x03\x11\x8a\x49\x09\x09\x18" } },
    .{ "CM_Query_Resource_Conflict_List", MethodRecord{ .library = "CFGMGR32", .import = "CM_Query_Resource_Conflict_List", .signature = "\x00\x07\x11\x8a\x49\x0f\x19\x09\x11\x89\xa5\x0f\x01\x09\x09\x18" } },
    .{ "CM_Free_Resource_Conflict_Handle", MethodRecord{ .library = "CFGMGR32", .import = "CM_Free_Resource_Conflict_Handle", .signature = "\x00\x01\x11\x8a\x49\x19" } },
    .{ "CM_Get_Resource_Conflict_Count", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Resource_Conflict_Count", .signature = "\x00\x02\x11\x8a\x49\x19\x0f\x09" } },
    .{ "CM_Get_Resource_Conflict_DetailsA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Resource_Conflict_DetailsA", .signature = "\x00\x03\x11\x8a\x49\x19\x09\x0f\x11\xaa\xa1" } },
    .{ "CM_Get_Resource_Conflict_DetailsW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Resource_Conflict_DetailsW", .signature = "\x00\x03\x11\x8a\x49\x19\x09\x0f\x11\xaa\xa5" } },
    .{ "CM_Get_Class_PropertyW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Class_PropertyW", .signature = "\x00\x06\x11\x8a\x49\x0f\x11\x0d\x0f\x11\x8a\x39\x0f\x11\x8a\x3d\x0f\x05\x0f\x09\x09" } },
    .{ "CM_Get_Class_Property_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Class_Property_ExW", .signature = "\x00\x07\x11\x8a\x49\x0f\x11\x0d\x0f\x11\x8a\x39\x0f\x11\x8a\x3d\x0f\x05\x0f\x09\x09\x18" } },
    .{ "CM_Get_Class_Property_Keys", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Class_Property_Keys", .signature = "\x00\x04\x11\x8a\x49\x0f\x11\x0d\x0f\x11\x8a\x39\x0f\x09\x09" } },
    .{ "CM_Get_Class_Property_Keys_Ex", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Class_Property_Keys_Ex", .signature = "\x00\x05\x11\x8a\x49\x0f\x11\x0d\x0f\x11\x8a\x39\x0f\x09\x09\x18" } },
    .{ "CM_Set_Class_PropertyW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_Class_PropertyW", .signature = "\x00\x06\x11\x8a\x49\x0f\x11\x0d\x0f\x11\x8a\x39\x11\x8a\x3d\x0f\x05\x09\x09" } },
    .{ "CM_Set_Class_Property_ExW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_Class_Property_ExW", .signature = "\x00\x07\x11\x8a\x49\x0f\x11\x0d\x0f\x11\x8a\x39\x11\x8a\x3d\x0f\x05\x09\x09\x18" } },
    .{ "CM_Get_Class_Registry_PropertyA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Class_Registry_PropertyA", .signature = "\x00\x07\x11\x8a\x49\x0f\x11\x0d\x09\x0f\x09\x0f\x01\x0f\x09\x09\x18" } },
    .{ "CM_Get_Class_Registry_PropertyW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Get_Class_Registry_PropertyW", .signature = "\x00\x07\x11\x8a\x49\x0f\x11\x0d\x09\x0f\x09\x0f\x01\x0f\x09\x09\x18" } },
    .{ "CM_Set_Class_Registry_PropertyA", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_Class_Registry_PropertyA", .signature = "\x00\x06\x11\x8a\x49\x0f\x11\x0d\x09\x0f\x01\x09\x09\x18" } },
    .{ "CM_Set_Class_Registry_PropertyW", MethodRecord{ .library = "CFGMGR32", .import = "CM_Set_Class_Registry_PropertyW", .signature = "\x00\x06\x11\x8a\x49\x0f\x11\x0d\x09\x0f\x01\x09\x09\x18" } },
    .{ "CMP_WaitNoPendingInstallEvents", MethodRecord{ .library = "CFGMGR32", .import = "CMP_WaitNoPendingInstallEvents", .signature = "\x00\x01\x09\x09" } },
    .{ "CM_Register_Notification", MethodRecord{ .library = "CFGMGR32", .import = "CM_Register_Notification", .signature = "\x00\x04\x11\x8a\x49\x0f\x11\xaa\xa9\x0f\x01\x12\xaa\xad\x0f\x11\xaa\xb1" } },
    .{ "CM_Unregister_Notification", MethodRecord{ .library = "CFGMGR32", .import = "CM_Unregister_Notification", .signature = "\x00\x01\x11\x8a\x49\x11\xaa\xb1" } },
    .{ "CM_MapCrToWin32Err", MethodRecord{ .library = "CFGMGR32", .import = "CM_MapCrToWin32Err", .signature = "\x00\x02\x09\x11\x8a\x49\x09" } },
    .{ "UpdateDriverForPlugAndPlayDevicesA", MethodRecord{ .library = "newdev", .import = "UpdateDriverForPlugAndPlayDevicesA", .signature = "\x00\x05\x11\x59\x11\x25\x11\x3d\x11\x3d\x11\x89\xa1\x0f\x11\x59" } },
    .{ "UpdateDriverForPlugAndPlayDevicesW", MethodRecord{ .library = "newdev", .import = "UpdateDriverForPlugAndPlayDevicesW", .signature = "\x00\x05\x11\x59\x11\x25\x11\x05\x11\x05\x11\x89\xa1\x0f\x11\x59" } },
    .{ "DiInstallDevice", MethodRecord{ .library = "newdev", .import = "DiInstallDevice", .signature = "\x00\x06\x11\x59\x11\x25\x11\xaa\x35\x0f\x11\xaa\x39\x0f\x11\xaa\x65\x11\x89\x91\x0f\x11\x59" } },
    .{ "DiInstallDriverW", MethodRecord{ .library = "newdev", .import = "DiInstallDriverW", .signature = "\x00\x04\x11\x59\x11\x25\x11\x05\x11\x89\x95\x0f\x11\x59" } },
    .{ "DiInstallDriverA", MethodRecord{ .library = "newdev", .import = "DiInstallDriverA", .signature = "\x00\x04\x11\x59\x11\x25\x11\x3d\x11\x89\x95\x0f\x11\x59" } },
    .{ "DiUninstallDevice", MethodRecord{ .library = "newdev", .import = "DiUninstallDevice", .signature = "\x00\x05\x11\x59\x11\x25\x11\xaa\x35\x0f\x11\xaa\x39\x09\x0f\x11\x59" } },
    .{ "DiUninstallDriverW", MethodRecord{ .library = "newdev", .import = "DiUninstallDriverW", .signature = "\x00\x04\x11\x59\x11\x25\x11\x05\x11\x89\x99\x0f\x11\x59" } },
    .{ "DiUninstallDriverA", MethodRecord{ .library = "newdev", .import = "DiUninstallDriverA", .signature = "\x00\x04\x11\x59\x11\x25\x11\x3d\x11\x89\x99\x0f\x11\x59" } },
    .{ "DiShowUpdateDevice", MethodRecord{ .library = "newdev", .import = "DiShowUpdateDevice", .signature = "\x00\x05\x11\x59\x11\x25\x11\xaa\x35\x0f\x11\xaa\x39\x09\x0f\x11\x59" } },
    .{ "DiRollbackDriver", MethodRecord{ .library = "newdev", .import = "DiRollbackDriver", .signature = "\x00\x05\x11\x59\x11\xaa\x35\x0f\x11\xaa\x39\x11\x25\x11\x89\x9d\x0f\x11\x59" } },
    .{ "DiShowUpdateDriver", MethodRecord{ .library = "newdev", .import = "DiShowUpdateDriver", .signature = "\x00\x04\x11\x59\x11\x25\x11\x05\x09\x0f\x11\x59" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x55 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "HKEY" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x331 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls", .name = "HPROPSHEETPAGE" },
        0x33d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls", .name = "PROPSHEETHEADERA_V2" },
        0x341 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls", .name = "PROPSHEETHEADERW_V2" },
        0x355 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HICON" },
        0x35d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HDC" },
        0x389 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "RECT" },
        0x981 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_COPY_STYLE" },
        0x985 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SETUP_FILE_OPERATION" },
        0x989 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "OEM_SOURCE_MEDIA_TYPE" },
        0x98d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SETUP_DI_DRIVER_TYPE" },
        0x991 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "DIINSTALLDEVICE_FLAGS" },
        0x995 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "DIINSTALLDRIVER_FLAGS" },
        0x999 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "DIUNINSTALLDRIVER_FLAGS" },
        0x99d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "DIROLLBACKDRIVER_FLAGS" },
        0x9a1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "UPDATEDRIVERFORPLUGANDPLAYDEVICES_FLAGS" },
        0x9a5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "CM_RESTYPE" },
        0x9a9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "CM_GET_DEVICE_INTERFACE_LIST_FLAGS" },
        0x9ad => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "CM_LOCATE_DEVNODE_FLAGS" },
        0x9b1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "CM_REENUMERATE_FLAGS" },
        0x9b5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "CM_ENUMERATE_FLAGS" },
        0x9b9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "INF_STYLE" },
        0x9bd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SETUPSCANFILEQUEUE_FLAGS" },
        0x9c1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "CM_LOG_CONF" },
        0x9c5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "CM_DEVNODE_STATUS_FLAGS" },
        0x9c9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "CM_PROB" },
        0x9cd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SPSVCINST_FLAGS" },
        0x9fd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SETUP_DI_REGISTRY_PROPERTY" },
        0xa01 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SETUP_DI_DEVICE_CREATION_FLAGS" },
        0xa15 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SETUP_DI_GET_CLASS_DEVS_FLAGS" },
        0xa19 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "DI_FUNCTION" },
        0xa29 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "FILE_COMPRESSION_TYPE" },
        0xa39 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "DEVPROPKEY" },
        0xa3d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Properties", .name = "DEVPROPTYPE" },
        0xa49 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "CONFIGRET" },
        0x2a11 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_INF_INFORMATION" },
        0x2a15 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_ALTPLATFORM_INFO_V2" },
        0x2a19 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_ORIGINAL_FILE_INFO_A" },
        0x2a1d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_ORIGINAL_FILE_INFO_W" },
        0x2a21 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "INFCONTEXT" },
        0x2a25 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "PSP_FILE_CALLBACK_A" },
        0x2a29 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "PSP_FILE_CALLBACK_W" },
        0x2a2d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_FILE_COPY_PARAMS_A" },
        0x2a31 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_FILE_COPY_PARAMS_W" },
        0x2a35 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "HDEVINFO" },
        0x2a39 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_DEVINFO_DATA" },
        0x2a3d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SetupFileLogInfo" },
        0x2a41 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_BACKUP_QUEUE_PARAMS_V2_A" },
        0x2a45 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_BACKUP_QUEUE_PARAMS_V2_W" },
        0x2a49 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_DEVINFO_LIST_DETAIL_DATA_A" },
        0x2a4d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_DEVINFO_LIST_DETAIL_DATA_W" },
        0x2a51 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_DEVICE_INTERFACE_DATA" },
        0x2a55 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_DEVICE_INTERFACE_DETAIL_DATA_A" },
        0x2a59 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_DEVICE_INTERFACE_DETAIL_DATA_W" },
        0x2a5d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "PSP_DETSIG_CMPPROC" },
        0x2a61 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_DRVINFO_DATA_V2_A" },
        0x2a65 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_DRVINFO_DATA_V2_W" },
        0x2a69 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_DRVINFO_DETAIL_DATA_A" },
        0x2a6d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_DRVINFO_DETAIL_DATA_W" },
        0x2a71 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_DEVINSTALL_PARAMS_A" },
        0x2a75 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_DEVINSTALL_PARAMS_W" },
        0x2a79 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_CLASSINSTALL_HEADER" },
        0x2a7d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_DRVINSTALL_PARAMS" },
        0x2a81 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_CLASSIMAGELIST_DATA" },
        0x2a85 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_INSTALLWIZARD_DATA" },
        0x2a89 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_INF_SIGNER_INFO_V2_A" },
        0x2a8d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "SP_INF_SIGNER_INFO_V2_W" },
        0x2a91 => TypeRefEntry{ .namespace = "Windows.Win32.Data.HtmlHelp", .name = "PRIORITY" },
        0x2a95 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "HWPROFILEINFO_A" },
        0x2a99 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "HWPROFILEINFO_W" },
        0x2a9d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "PNP_VETO_TYPE" },
        0x2aa1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "CONFLICT_DETAILS_A" },
        0x2aa5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "CONFLICT_DETAILS_W" },
        0x2aa9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "CM_NOTIFY_FILTER" },
        0x2aad => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "PCM_NOTIFY_CALLBACK" },
        0x2ab1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.DeviceAndDriverInstallation", .name = "HCMNOTIFICATION" },
        else => null,
    };
}

pub const SP_COPY_DELETESOURCE = 1;
pub const SP_COPY_REPLACEONLY = 2;
pub const SP_COPY_NEWER = 4;
pub const SP_COPY_NEWER_OR_SAME = 4;
pub const SP_COPY_NOOVERWRITE = 8;
pub const SP_COPY_NODECOMP = 16;
pub const SP_COPY_LANGUAGEAWARE = 32;
pub const SP_COPY_SOURCE_ABSOLUTE = 64;
pub const SP_COPY_SOURCEPATH_ABSOLUTE = 128;
pub const SP_COPY_IN_USE_NEEDS_REBOOT = 256;
pub const SP_COPY_FORCE_IN_USE = 512;
pub const SP_COPY_NOSKIP = 1024;
pub const SP_COPY_FORCE_NOOVERWRITE = 4096;
pub const SP_COPY_FORCE_NEWER = 8192;
pub const SP_COPY_WARNIFSKIP = 16384;
pub const SP_COPY_NOBROWSE = 32768;
pub const SP_COPY_NEWER_ONLY = 65536;
pub const SP_COPY_RESERVED = 131072;
pub const SP_COPY_OEMINF_CATALOG_ONLY = 262144;
pub const SP_COPY_REPLACE_BOOT_FILE = 524288;
pub const SP_COPY_NOPRUNE = 1048576;
pub const SP_COPY_OEM_F6_INF = 2097152;
pub const SP_COPY_ALREADYDECOMP = 4194304;
pub const SP_COPY_WINDOWS_SIGNED = 16777216;
pub const SP_COPY_PNPLOCKED = 33554432;
pub const SP_COPY_IN_USE_TRY_RENAME = 67108864;
pub const SP_COPY_INBOX_INF = 134217728;
pub const SP_COPY_HARDLINK = 268435456;
pub const FILEOP_DELETE = 2;
pub const FILEOP_COPY = 0;
pub const SPOST_NONE = 0;
pub const SPOST_PATH = 1;
pub const SPOST_URL = 2;
pub const SPDIT_CLASSDRIVER = 1;
pub const SPDIT_COMPATDRIVER = 2;
pub const DIIDFLAG_SHOWSEARCHUI = 1;
pub const DIIDFLAG_NOFINISHINSTALLUI = 2;
pub const DIIDFLAG_INSTALLNULLDRIVER = 4;
pub const DIIDFLAG_INSTALLCOPYINFDRIVERS = 8;
pub const DIIDFLAG_BITS = 15;
pub const DIIRFLAG_BITS = 106;
pub const DIIRFLAG_SYSTEM_BITS = 127;
pub const DIIRFLAG_INF_ALREADY_COPIED = 1;
pub const DIIRFLAG_FORCE_INF = 2;
pub const DIIRFLAG_HW_USING_THE_INF = 4;
pub const DIIRFLAG_HOTPATCH = 8;
pub const DIIRFLAG_NOBACKUP = 16;
pub const DIIRFLAG_PRE_CONFIGURE_INF = 32;
pub const DIIRFLAG_INSTALL_AS_SET = 64;
pub const DIURFLAG_VALID = 3;
pub const DIURFLAG_NO_REMOVE_INF = 1;
pub const DIURFLAG_RESERVED = 2;
pub const ROLLBACK_FLAG_NO_UI = 1;
pub const ROLLBACK_BITS = 1;
pub const INSTALLFLAG_FORCE = 1;
pub const INSTALLFLAG_READONLY = 2;
pub const INSTALLFLAG_NONINTERACTIVE = 4;
pub const INSTALLFLAG_BITS = 7;
pub const ResType_All = 0;
pub const ResType_None = 0;
pub const ResType_Mem = 1;
pub const ResType_IO = 2;
pub const ResType_DMA = 3;
pub const ResType_IRQ = 4;
pub const ResType_DoNotUse = 5;
pub const ResType_BusNumber = 6;
pub const ResType_MemLarge = 7;
pub const ResType_MAX = 7;
pub const ResType_Ignored_Bit = 32768;
pub const ResType_ClassSpecific = 65535;
pub const ResType_Reserved = 32768;
pub const ResType_DevicePrivate = 32769;
pub const ResType_PcCardConfig = 32770;
pub const ResType_MfCardConfig = 32771;
pub const ResType_Connection = 32772;
pub const CM_GET_DEVICE_INTERFACE_LIST_PRESENT = 0;
pub const CM_GET_DEVICE_INTERFACE_LIST_ALL_DEVICES = 1;
pub const CM_GET_DEVICE_INTERFACE_LIST_BITS = 1;
pub const CM_LOCATE_DEVNODE_NORMAL = 0;
pub const CM_LOCATE_DEVNODE_PHANTOM = 1;
pub const CM_LOCATE_DEVNODE_CANCELREMOVE = 2;
pub const CM_LOCATE_DEVNODE_NOVALIDATION = 4;
pub const CM_LOCATE_DEVNODE_BITS = 7;
pub const CM_REENUMERATE_NORMAL = 0;
pub const CM_REENUMERATE_SYNCHRONOUS = 1;
pub const CM_REENUMERATE_RETRY_INSTALLATION = 2;
pub const CM_REENUMERATE_ASYNCHRONOUS = 4;
pub const CM_REENUMERATE_BITS = 7;
pub const CM_ENUMERATE_CLASSES_INSTALLER = 0;
pub const CM_ENUMERATE_CLASSES_INTERFACE = 1;
pub const CM_ENUMERATE_CLASSES_BITS = 1;
pub const INF_STYLE_NONE = 0;
pub const INF_STYLE_OLDNT = 1;
pub const INF_STYLE_WIN4 = 2;
pub const INF_STYLE_CACHE_ENABLE = 16;
pub const INF_STYLE_CACHE_DISABLE = 32;
pub const INF_STYLE_CACHE_IGNORE = 64;
pub const SPQ_SCAN_FILE_PRESENCE = 1;
pub const SPQ_SCAN_FILE_VALIDITY = 2;
pub const SPQ_SCAN_USE_CALLBACK = 4;
pub const SPQ_SCAN_USE_CALLBACKEX = 8;
pub const SPQ_SCAN_INFORM_USER = 16;
pub const SPQ_SCAN_PRUNE_COPY_QUEUE = 32;
pub const SPQ_SCAN_USE_CALLBACK_SIGNERINFO = 64;
pub const SPQ_SCAN_PRUNE_DELREN = 128;
pub const SPQ_SCAN_FILE_PRESENCE_WITHOUT_SOURCE = 256;
pub const SPQ_SCAN_FILE_COMPARISON = 512;
pub const SPQ_SCAN_ACTIVATE_DRP = 1024;
pub const SPQ_SCAN_USE_OEM_CATALOGS = 2048;
pub const BASIC_LOG_CONF = 0;
pub const FILTERED_LOG_CONF = 1;
pub const ALLOC_LOG_CONF = 2;
pub const BOOT_LOG_CONF = 3;
pub const FORCED_LOG_CONF = 4;
pub const OVERRIDE_LOG_CONF = 5;
pub const NUM_LOG_CONF = 6;
pub const DN_CHANGEABLE_FLAGS = 1639670464;
pub const DN_ROOT_ENUMERATED = 1;
pub const DN_DRIVER_LOADED = 2;
pub const DN_ENUM_LOADED = 4;
pub const DN_STARTED = 8;
pub const DN_MANUAL = 16;
pub const DN_NEED_TO_ENUM = 32;
pub const DN_NOT_FIRST_TIME = 64;
pub const DN_HARDWARE_ENUM = 128;
pub const DN_LIAR = 256;
pub const DN_HAS_MARK = 512;
pub const DN_HAS_PROBLEM = 1024;
pub const DN_FILTERED = 2048;
pub const DN_MOVED = 4096;
pub const DN_DISABLEABLE = 8192;
pub const DN_REMOVABLE = 16384;
pub const DN_PRIVATE_PROBLEM = 32768;
pub const DN_MF_PARENT = 65536;
pub const DN_MF_CHILD = 131072;
pub const DN_WILL_BE_REMOVED = 262144;
pub const DN_NOT_FIRST_TIMEE = 524288;
pub const DN_STOP_FREE_RES = 1048576;
pub const DN_REBAL_CANDIDATE = 2097152;
pub const DN_BAD_PARTIAL = 4194304;
pub const DN_NT_ENUMERATOR = 8388608;
pub const DN_NT_DRIVER = 16777216;
pub const DN_NEEDS_LOCKING = 33554432;
pub const DN_ARM_WAKEUP = 67108864;
pub const DN_APM_ENUMERATOR = 134217728;
pub const DN_APM_DRIVER = 268435456;
pub const DN_SILENT_INSTALL = 536870912;
pub const DN_NO_SHOW_IN_DM = 1073741824;
pub const DN_BOOT_LOG_PROB = 2147483648;
pub const DN_NEED_RESTART = 256;
pub const DN_DRIVER_BLOCKED = 64;
pub const DN_LEGACY_DRIVER = 4096;
pub const DN_CHILD_WITH_INVALID_ID = 512;
pub const DN_DEVICE_DISCONNECTED = 33554432;
pub const DN_QUERY_REMOVE_PENDING = 65536;
pub const DN_QUERY_REMOVE_ACTIVE = 131072;
pub const CM_PROB_NOT_CONFIGURED = 1;
pub const CM_PROB_DEVLOADER_FAILED = 2;
pub const CM_PROB_OUT_OF_MEMORY = 3;
pub const CM_PROB_ENTRY_IS_WRONG_TYPE = 4;
pub const CM_PROB_LACKED_ARBITRATOR = 5;
pub const CM_PROB_BOOT_CONFIG_CONFLICT = 6;
pub const CM_PROB_FAILED_FILTER = 7;
pub const CM_PROB_DEVLOADER_NOT_FOUND = 8;
pub const CM_PROB_INVALID_DATA = 9;
pub const CM_PROB_FAILED_START = 10;
pub const CM_PROB_LIAR = 11;
pub const CM_PROB_NORMAL_CONFLICT = 12;
pub const CM_PROB_NOT_VERIFIED = 13;
pub const CM_PROB_NEED_RESTART = 14;
pub const CM_PROB_REENUMERATION = 15;
pub const CM_PROB_PARTIAL_LOG_CONF = 16;
pub const CM_PROB_UNKNOWN_RESOURCE = 17;
pub const CM_PROB_REINSTALL = 18;
pub const CM_PROB_REGISTRY = 19;
pub const CM_PROB_VXDLDR = 20;
pub const CM_PROB_WILL_BE_REMOVED = 21;
pub const CM_PROB_DISABLED = 22;
pub const CM_PROB_DEVLOADER_NOT_READY = 23;
pub const CM_PROB_DEVICE_NOT_THERE = 24;
pub const CM_PROB_MOVED = 25;
pub const CM_PROB_TOO_EARLY = 26;
pub const CM_PROB_NO_VALID_LOG_CONF = 27;
pub const CM_PROB_FAILED_INSTALL = 28;
pub const CM_PROB_HARDWARE_DISABLED = 29;
pub const CM_PROB_CANT_SHARE_IRQ = 30;
pub const CM_PROB_FAILED_ADD = 31;
pub const CM_PROB_DISABLED_SERVICE = 32;
pub const CM_PROB_TRANSLATION_FAILED = 33;
pub const CM_PROB_NO_SOFTCONFIG = 34;
pub const CM_PROB_BIOS_TABLE = 35;
pub const CM_PROB_IRQ_TRANSLATION_FAILED = 36;
pub const CM_PROB_FAILED_DRIVER_ENTRY = 37;
pub const CM_PROB_DRIVER_FAILED_PRIOR_UNLOAD = 38;
pub const CM_PROB_DRIVER_FAILED_LOAD = 39;
pub const CM_PROB_DRIVER_SERVICE_KEY_INVALID = 40;
pub const CM_PROB_LEGACY_SERVICE_NO_DEVICES = 41;
pub const CM_PROB_DUPLICATE_DEVICE = 42;
pub const CM_PROB_FAILED_POST_START = 43;
pub const CM_PROB_HALTED = 44;
pub const CM_PROB_PHANTOM = 45;
pub const CM_PROB_SYSTEM_SHUTDOWN = 46;
pub const CM_PROB_HELD_FOR_EJECT = 47;
pub const CM_PROB_DRIVER_BLOCKED = 48;
pub const CM_PROB_REGISTRY_TOO_LARGE = 49;
pub const CM_PROB_SETPROPERTIES_FAILED = 50;
pub const CM_PROB_WAITING_ON_DEPENDENCY = 51;
pub const CM_PROB_UNSIGNED_DRIVER = 52;
pub const CM_PROB_USED_BY_DEBUGGER = 53;
pub const CM_PROB_DEVICE_RESET = 54;
pub const CM_PROB_CONSOLE_LOCKED = 55;
pub const CM_PROB_NEED_CLASS_CONFIG = 56;
pub const CM_PROB_GUEST_ASSIGNMENT_FAILED = 57;
pub const SPSVCINST_TAGTOFRONT = 1;
pub const SPSVCINST_ASSOCSERVICE = 2;
pub const SPSVCINST_DELETEEVENTLOGENTRY = 4;
pub const SPSVCINST_NOCLOBBER_DISPLAYNAME = 8;
pub const SPSVCINST_NOCLOBBER_STARTTYPE = 16;
pub const SPSVCINST_NOCLOBBER_ERRORCONTROL = 32;
pub const SPSVCINST_NOCLOBBER_LOADORDERGROUP = 64;
pub const SPSVCINST_NOCLOBBER_DEPENDENCIES = 128;
pub const SPSVCINST_NOCLOBBER_DESCRIPTION = 256;
pub const SPSVCINST_STOPSERVICE = 512;
pub const SPSVCINST_CLOBBER_SECURITY = 1024;
pub const SPSVCINST_STARTSERVICE = 2048;
pub const SPSVCINST_NOCLOBBER_REQUIREDPRIVILEGES = 4096;
pub const SPSVCINST_NOCLOBBER_TRIGGERS = 8192;
pub const SPSVCINST_NOCLOBBER_SERVICESIDTYPE = 16384;
pub const SPSVCINST_NOCLOBBER_DELAYEDAUTOSTART = 32768;
pub const SPSVCINST_UNIQUE_NAME = 65536;
pub const SPSVCINST_NOCLOBBER_FAILUREACTIONS = 131072;
pub const SPSVCINST_NOCLOBBER_BOOTFLAGS = 262144;
pub const CM_CDMASK_DEVINST = 1;
pub const CM_CDMASK_RESDES = 2;
pub const CM_CDMASK_FLAGS = 4;
pub const CM_CDMASK_DESCRIPTION = 8;
pub const CM_CDMASK_VALID = 15;
pub const CM_CDFLAGS_DRIVER = 1;
pub const CM_CDFLAGS_ROOT_OWNED = 2;
pub const CM_CDFLAGS_RESERVED = 4;
pub const CM_REMOVAL_POLICY_EXPECT_NO_REMOVAL = 1;
pub const CM_REMOVAL_POLICY_EXPECT_ORDERLY_REMOVAL = 2;
pub const CM_REMOVAL_POLICY_EXPECT_SURPRISE_REMOVAL = 3;
pub const CM_INSTALL_STATE_INSTALLED = 0;
pub const CM_INSTALL_STATE_NEEDS_REINSTALL = 1;
pub const CM_INSTALL_STATE_FAILED_INSTALL = 2;
pub const CM_INSTALL_STATE_FINISH_INSTALL = 3;
pub const CM_DEVCAP_LOCKSUPPORTED = 1;
pub const CM_DEVCAP_EJECTSUPPORTED = 2;
pub const CM_DEVCAP_REMOVABLE = 4;
pub const CM_DEVCAP_DOCKDEVICE = 8;
pub const CM_DEVCAP_UNIQUEID = 16;
pub const CM_DEVCAP_SILENTINSTALL = 32;
pub const CM_DEVCAP_RAWDEVICEOK = 64;
pub const CM_DEVCAP_SURPRISEREMOVALOK = 128;
pub const CM_DEVCAP_HARDWAREDISABLED = 256;
pub const CM_DEVCAP_NONDYNAMIC = 512;
pub const CM_DEVCAP_SECUREDEVICE = 1024;
pub const mDD_Width = 3;
pub const fDD_BYTE = 0;
pub const fDD_WORD = 1;
pub const fDD_DWORD = 2;
pub const fDD_BYTE_AND_WORD = 3;
pub const mDD_BusMaster = 4;
pub const fDD_NoBusMaster = 0;
pub const fDD_BusMaster = 4;
pub const mDD_Type = 24;
pub const fDD_TypeStandard = 0;
pub const fDD_TypeA = 8;
pub const fDD_TypeB = 16;
pub const fDD_TypeF = 24;
pub const fIOD_PortType = 1;
pub const fIOD_Memory = 0;
pub const fIOD_IO = 1;
pub const fIOD_DECODE = 252;
pub const fIOD_10_BIT_DECODE = 4;
pub const fIOD_12_BIT_DECODE = 8;
pub const fIOD_16_BIT_DECODE = 16;
pub const fIOD_POSITIVE_DECODE = 32;
pub const fIOD_PASSIVE_DECODE = 64;
pub const fIOD_WINDOW_DECODE = 128;
pub const fIOD_PORT_BAR = 256;
pub const mIRQD_Share = 1;
pub const fIRQD_Exclusive = 0;
pub const fIRQD_Share = 1;
pub const fIRQD_Share_Bit = 0;
pub const fIRQD_Level_Bit = 1;
pub const mIRQD_Edge_Level = 2;
pub const fIRQD_Level = 0;
pub const fIRQD_Edge = 2;
pub const mMD_MemoryType = 1;
pub const fMD_MemoryType = 1;
pub const fMD_ROM = 0;
pub const fMD_RAM = 1;
pub const mMD_32_24 = 2;
pub const fMD_32_24 = 2;
pub const fMD_24 = 0;
pub const fMD_32 = 2;
pub const mMD_Prefetchable = 4;
pub const fMD_Prefetchable = 4;
pub const fMD_Pref = 4;
pub const fMD_PrefetchDisallowed = 0;
pub const fMD_PrefetchAllowed = 4;
pub const mMD_Readable = 8;
pub const fMD_Readable = 8;
pub const fMD_ReadAllowed = 0;
pub const fMD_ReadDisallowed = 8;
pub const mMD_CombinedWrite = 16;
pub const fMD_CombinedWrite = 16;
pub const fMD_CombinedWriteDisallowed = 0;
pub const fMD_CombinedWriteAllowed = 16;
pub const mMD_Cacheable = 32;
pub const fMD_NonCacheable = 0;
pub const fMD_Cacheable = 32;
pub const fMD_WINDOW_DECODE = 64;
pub const fMD_MEMORY_BAR = 128;
pub const fPMF_AUDIO_ENABLE = 8;
pub const mPCD_IO_8_16 = 1;
pub const fPCD_IO_8 = 0;
pub const fPCD_IO_16 = 1;
pub const mPCD_MEM_8_16 = 2;
pub const fPCD_MEM_8 = 0;
pub const fPCD_MEM_16 = 2;
pub const mPCD_MEM_A_C = 12;
pub const fPCD_MEM1_A = 4;
pub const fPCD_MEM2_A = 8;
pub const fPCD_IO_ZW_8 = 16;
pub const fPCD_IO_SRC_16 = 32;
pub const fPCD_IO_WS_16 = 64;
pub const mPCD_MEM_WS = 768;
pub const fPCD_MEM_WS_ONE = 256;
pub const fPCD_MEM_WS_TWO = 512;
pub const fPCD_MEM_WS_THREE = 768;
pub const fPCD_MEM_A = 4;
pub const fPCD_ATTRIBUTES_PER_WINDOW = 32768;
pub const fPCD_IO1_16 = 65536;
pub const fPCD_IO1_ZW_8 = 131072;
pub const fPCD_IO1_SRC_16 = 262144;
pub const fPCD_IO1_WS_16 = 524288;
pub const fPCD_IO2_16 = 1048576;
pub const fPCD_IO2_ZW_8 = 2097152;
pub const fPCD_IO2_SRC_16 = 4194304;
pub const fPCD_IO2_WS_16 = 8388608;
pub const mPCD_MEM1_WS = 50331648;
pub const fPCD_MEM1_WS_ONE = 16777216;
pub const fPCD_MEM1_WS_TWO = 33554432;
pub const fPCD_MEM1_WS_THREE = 50331648;
pub const fPCD_MEM1_16 = 67108864;
pub const mPCD_MEM2_WS = 805306368;
pub const fPCD_MEM2_WS_ONE = 268435456;
pub const fPCD_MEM2_WS_TWO = 536870912;
pub const fPCD_MEM2_WS_THREE = 805306368;
pub const fPCD_MEM2_16 = 1073741824;
pub const SPDRP_DEVICEDESC = 0;
pub const SPDRP_HARDWAREID = 1;
pub const SPDRP_COMPATIBLEIDS = 2;
pub const SPDRP_UNUSED0 = 3;
pub const SPDRP_SERVICE = 4;
pub const SPDRP_UNUSED1 = 5;
pub const SPDRP_UNUSED2 = 6;
pub const SPDRP_CLASS = 7;
pub const SPDRP_CLASSGUID = 8;
pub const SPDRP_DRIVER = 9;
pub const SPDRP_CONFIGFLAGS = 10;
pub const SPDRP_MFG = 11;
pub const SPDRP_FRIENDLYNAME = 12;
pub const SPDRP_LOCATION_INFORMATION = 13;
pub const SPDRP_PHYSICAL_DEVICE_OBJECT_NAME = 14;
pub const SPDRP_CAPABILITIES = 15;
pub const SPDRP_UI_NUMBER = 16;
pub const SPDRP_UPPERFILTERS = 17;
pub const SPDRP_LOWERFILTERS = 18;
pub const SPDRP_BUSTYPEGUID = 19;
pub const SPDRP_LEGACYBUSTYPE = 20;
pub const SPDRP_BUSNUMBER = 21;
pub const SPDRP_ENUMERATOR_NAME = 22;
pub const SPDRP_SECURITY = 23;
pub const SPDRP_SECURITY_SDS = 24;
pub const SPDRP_DEVTYPE = 25;
pub const SPDRP_EXCLUSIVE = 26;
pub const SPDRP_CHARACTERISTICS = 27;
pub const SPDRP_ADDRESS = 28;
pub const SPDRP_UI_NUMBER_DESC_FORMAT = 29;
pub const SPDRP_DEVICE_POWER_DATA = 30;
pub const SPDRP_REMOVAL_POLICY = 31;
pub const SPDRP_REMOVAL_POLICY_HW_DEFAULT = 32;
pub const SPDRP_REMOVAL_POLICY_OVERRIDE = 33;
pub const SPDRP_INSTALL_STATE = 34;
pub const SPDRP_LOCATION_PATHS = 35;
pub const SPDRP_BASE_CONTAINERID = 36;
pub const SPDRP_MAXIMUM_PROPERTY = 37;
pub const DICD_GENERATE_ID = 1;
pub const DICD_INHERIT_CLASSDRVS = 2;
pub const DNF_DUPDESC = 1;
pub const DNF_OLDDRIVER = 2;
pub const DNF_EXCLUDEFROMLIST = 4;
pub const DNF_NODRIVER = 8;
pub const DNF_LEGACYINF = 16;
pub const DNF_CLASS_DRIVER = 32;
pub const DNF_COMPATIBLE_DRIVER = 64;
pub const DNF_INET_DRIVER = 128;
pub const DNF_UNUSED1 = 256;
pub const DNF_UNUSED2 = 512;
pub const DNF_OLD_INET_DRIVER = 1024;
pub const DNF_BAD_DRIVER = 2048;
pub const DNF_DUPPROVIDER = 4096;
pub const DNF_INF_IS_SIGNED = 8192;
pub const DNF_OEM_F6_INF = 16384;
pub const DNF_DUPDRIVERVER = 32768;
pub const DNF_BASIC_DRIVER = 65536;
pub const DNF_AUTHENTICODE_SIGNED = 131072;
pub const DNF_INSTALLEDDRIVER = 262144;
pub const DNF_ALWAYSEXCLUDEFROMLIST = 524288;
pub const DNF_INBOX_DRIVER = 1048576;
pub const DNF_REQUESTADDITIONALSOFTWARE = 2097152;
pub const DNF_UNUSED_22 = 4194304;
pub const DNF_UNUSED_23 = 8388608;
pub const DNF_UNUSED_24 = 16777216;
pub const DNF_UNUSED_25 = 33554432;
pub const DNF_UNUSED_26 = 67108864;
pub const DNF_UNUSED_27 = 134217728;
pub const DNF_UNUSED_28 = 268435456;
pub const DNF_UNUSED_29 = 536870912;
pub const DNF_UNUSED_30 = 1073741824;
pub const DNF_UNUSED_31 = 2147483648;
pub const DICS_ENABLE = 1;
pub const DICS_DISABLE = 2;
pub const DICS_PROPCHANGE = 3;
pub const DICS_START = 4;
pub const DICS_STOP = 5;
pub const DICS_FLAG_GLOBAL = 1;
pub const DICS_FLAG_CONFIGSPECIFIC = 2;
pub const DICS_FLAG_CONFIGGENERAL = 4;
pub const DI_REMOVEDEVICE_GLOBAL = 1;
pub const DI_REMOVEDEVICE_CONFIGSPECIFIC = 2;
pub const DIGCF_DEFAULT = 1;
pub const DIGCF_PRESENT = 2;
pub const DIGCF_ALLCLASSES = 4;
pub const DIGCF_PROFILE = 8;
pub const DIGCF_DEVICEINTERFACE = 16;
pub const DIGCF_INTERFACEDEVICE = 16;
pub const DIF_SELECTDEVICE = 1;
pub const DIF_INSTALLDEVICE = 2;
pub const DIF_ASSIGNRESOURCES = 3;
pub const DIF_PROPERTIES = 4;
pub const DIF_REMOVE = 5;
pub const DIF_FIRSTTIMESETUP = 6;
pub const DIF_FOUNDDEVICE = 7;
pub const DIF_SELECTCLASSDRIVERS = 8;
pub const DIF_VALIDATECLASSDRIVERS = 9;
pub const DIF_INSTALLCLASSDRIVERS = 10;
pub const DIF_CALCDISKSPACE = 11;
pub const DIF_DESTROYPRIVATEDATA = 12;
pub const DIF_VALIDATEDRIVER = 13;
pub const DIF_DETECT = 15;
pub const DIF_INSTALLWIZARD = 16;
pub const DIF_DESTROYWIZARDDATA = 17;
pub const DIF_PROPERTYCHANGE = 18;
pub const DIF_ENABLECLASS = 19;
pub const DIF_DETECTVERIFY = 20;
pub const DIF_INSTALLDEVICEFILES = 21;
pub const DIF_UNREMOVE = 22;
pub const DIF_SELECTBESTCOMPATDRV = 23;
pub const DIF_ALLOW_INSTALL = 24;
pub const DIF_REGISTERDEVICE = 25;
pub const DIF_NEWDEVICEWIZARD_PRESELECT = 26;
pub const DIF_NEWDEVICEWIZARD_SELECT = 27;
pub const DIF_NEWDEVICEWIZARD_PREANALYZE = 28;
pub const DIF_NEWDEVICEWIZARD_POSTANALYZE = 29;
pub const DIF_NEWDEVICEWIZARD_FINISHINSTALL = 30;
pub const DIF_UNUSED1 = 31;
pub const DIF_INSTALLINTERFACES = 32;
pub const DIF_DETECTCANCEL = 33;
pub const DIF_REGISTER_COINSTALLERS = 34;
pub const DIF_ADDPROPERTYPAGE_ADVANCED = 35;
pub const DIF_ADDPROPERTYPAGE_BASIC = 36;
pub const DIF_RESERVED1 = 37;
pub const DIF_TROUBLESHOOTER = 38;
pub const DIF_POWERMESSAGEWAKE = 39;
pub const DIF_ADDREMOTEPROPERTYPAGE_ADVANCED = 40;
pub const DIF_UPDATEDRIVER_UI = 41;
pub const DIF_FINISHINSTALL_ACTION = 42;
pub const DIF_RESERVED2 = 48;
pub const DIF_MOVEDEVICE = 14;
pub const DI_SHOWOEM = 1;
pub const DI_SHOWCOMPAT = 2;
pub const DI_SHOWCLASS = 4;
pub const DI_SHOWALL = 7;
pub const DI_NOVCP = 8;
pub const DI_DIDCOMPAT = 16;
pub const DI_DIDCLASS = 32;
pub const DI_AUTOASSIGNRES = 64;
pub const DI_NEEDRESTART = 128;
pub const DI_NEEDREBOOT = 256;
pub const DI_NOBROWSE = 512;
pub const DI_MULTMFGS = 1024;
pub const DI_DISABLED = 2048;
pub const DI_GENERALPAGE_ADDED = 4096;
pub const DI_RESOURCEPAGE_ADDED = 8192;
pub const DI_PROPERTIES_CHANGE = 16384;
pub const DI_INF_IS_SORTED = 32768;
pub const DI_ENUMSINGLEINF = 65536;
pub const DI_DONOTCALLCONFIGMG = 131072;
pub const DI_INSTALLDISABLED = 262144;
pub const DI_COMPAT_FROM_CLASS = 524288;
pub const DI_CLASSINSTALLPARAMS = 1048576;
pub const DI_NODI_DEFAULTACTION = 2097152;
pub const DI_QUIETINSTALL = 8388608;
pub const DI_NOFILECOPY = 16777216;
pub const DI_FORCECOPY = 33554432;
pub const DI_DRIVERPAGE_ADDED = 67108864;
pub const DI_USECI_SELECTSTRINGS = 134217728;
pub const DI_OVERRIDE_INFFLAGS = 268435456;
pub const DI_PROPS_NOCHANGEUSAGE = 536870912;
pub const DI_NOSELECTICONS = 1073741824;
pub const DI_NOWRITE_IDS = 2147483648;
pub const DI_UNREMOVEDEVICE_CONFIGSPECIFIC = 2;
pub const DI_FLAGSEX_RESERVED2 = 1;
pub const DI_FLAGSEX_RESERVED3 = 2;
pub const DI_FLAGSEX_CI_FAILED = 4;
pub const DI_FLAGSEX_FINISHINSTALL_ACTION = 8;
pub const DI_FLAGSEX_DIDINFOLIST = 16;
pub const DI_FLAGSEX_DIDCOMPATINFO = 32;
pub const DI_FLAGSEX_FILTERCLASSES = 64;
pub const DI_FLAGSEX_SETFAILEDINSTALL = 128;
pub const DI_FLAGSEX_DEVICECHANGE = 256;
pub const DI_FLAGSEX_ALWAYSWRITEIDS = 512;
pub const DI_FLAGSEX_PROPCHANGE_PENDING = 1024;
pub const DI_FLAGSEX_ALLOWEXCLUDEDDRVS = 2048;
pub const DI_FLAGSEX_NOUIONQUERYREMOVE = 4096;
pub const DI_FLAGSEX_USECLASSFORCOMPAT = 8192;
pub const DI_FLAGSEX_RESERVED4 = 16384;
pub const DI_FLAGSEX_NO_DRVREG_MODIFY = 32768;
pub const DI_FLAGSEX_IN_SYSTEM_SETUP = 65536;
pub const DI_FLAGSEX_INET_DRIVER = 131072;
pub const DI_FLAGSEX_APPENDDRIVERLIST = 262144;
pub const DI_FLAGSEX_PREINSTALLBACKUP = 524288;
pub const DI_FLAGSEX_BACKUPONREPLACE = 1048576;
pub const DI_FLAGSEX_DRIVERLIST_FROM_URL = 2097152;
pub const DI_FLAGSEX_RESERVED1 = 4194304;
pub const DI_FLAGSEX_EXCLUDE_OLD_INET_DRIVERS = 8388608;
pub const DI_FLAGSEX_POWERPAGE_ADDED = 16777216;
pub const DI_FLAGSEX_FILTERSIMILARDRIVERS = 33554432;
pub const DI_FLAGSEX_INSTALLEDDRIVER = 67108864;
pub const DI_FLAGSEX_NO_CLASSLIST_NODE_MERGE = 134217728;
pub const DI_FLAGSEX_ALTPLATFORM_DRVSEARCH = 268435456;
pub const DI_FLAGSEX_RESTART_DEVICE_ONLY = 536870912;
pub const DI_FLAGSEX_RECURSIVESEARCH = 1073741824;
pub const DI_FLAGSEX_SEARCH_PUBLISHED_INFS = 2147483648;
pub const CONFIGFLAG_DISABLED = 1;
pub const CONFIGFLAG_REMOVED = 2;
pub const CONFIGFLAG_MANUAL_INSTALL = 4;
pub const CONFIGFLAG_IGNORE_BOOT_LC = 8;
pub const CONFIGFLAG_NET_BOOT = 16;
pub const CONFIGFLAG_REINSTALL = 32;
pub const CONFIGFLAG_FAILEDINSTALL = 64;
pub const CONFIGFLAG_CANTSTOPACHILD = 128;
pub const CONFIGFLAG_OKREMOVEROM = 256;
pub const CONFIGFLAG_NOREMOVEEXIT = 512;
pub const CONFIGFLAG_FINISH_INSTALL = 1024;
pub const CONFIGFLAG_NEEDS_FORCED_CONFIG = 2048;
pub const CONFIGFLAG_NETBOOT_CARD = 4096;
pub const CONFIGFLAG_PARTIAL_LOG_CONF = 8192;
pub const CONFIGFLAG_SUPPRESS_SURPRISE = 16384;
pub const CONFIGFLAG_VERIFY_HARDWARE = 32768;
pub const CONFIGFLAG_FINISHINSTALL_UI = 65536;
pub const CONFIGFLAG_FINISHINSTALL_ACTION = 131072;
pub const CONFIGFLAG_BOOT_DEVICE = 262144;
pub const CONFIGFLAG_NEEDS_CLASS_CONFIG = 524288;
pub const FILE_COMPRESSION_NONE = 0;
pub const FILE_COMPRESSION_WINLZA = 1;
pub const FILE_COMPRESSION_MSZIP = 2;
pub const FILE_COMPRESSION_NTCAB = 3;
pub const CR_SUCCESS = 0;
pub const CR_DEFAULT = 1;
pub const CR_OUT_OF_MEMORY = 2;
pub const CR_INVALID_POINTER = 3;
pub const CR_INVALID_FLAG = 4;
pub const CR_INVALID_DEVNODE = 5;
pub const CR_INVALID_DEVINST = 5;
pub const CR_INVALID_RES_DES = 6;
pub const CR_INVALID_LOG_CONF = 7;
pub const CR_INVALID_ARBITRATOR = 8;
pub const CR_INVALID_NODELIST = 9;
pub const CR_DEVNODE_HAS_REQS = 10;
pub const CR_DEVINST_HAS_REQS = 10;
pub const CR_INVALID_RESOURCEID = 11;
pub const CR_DLVXD_NOT_FOUND = 12;
pub const CR_NO_SUCH_DEVNODE = 13;
pub const CR_NO_SUCH_DEVINST = 13;
pub const CR_NO_MORE_LOG_CONF = 14;
pub const CR_NO_MORE_RES_DES = 15;
pub const CR_ALREADY_SUCH_DEVNODE = 16;
pub const CR_ALREADY_SUCH_DEVINST = 16;
pub const CR_INVALID_RANGE_LIST = 17;
pub const CR_INVALID_RANGE = 18;
pub const CR_FAILURE = 19;
pub const CR_NO_SUCH_LOGICAL_DEV = 20;
pub const CR_CREATE_BLOCKED = 21;
pub const CR_NOT_SYSTEM_VM = 22;
pub const CR_REMOVE_VETOED = 23;
pub const CR_APM_VETOED = 24;
pub const CR_INVALID_LOAD_TYPE = 25;
pub const CR_BUFFER_SMALL = 26;
pub const CR_NO_ARBITRATOR = 27;
pub const CR_NO_REGISTRY_HANDLE = 28;
pub const CR_REGISTRY_ERROR = 29;
pub const CR_INVALID_DEVICE_ID = 30;
pub const CR_INVALID_DATA = 31;
pub const CR_INVALID_API = 32;
pub const CR_DEVLOADER_NOT_READY = 33;
pub const CR_NEED_RESTART = 34;
pub const CR_NO_MORE_HW_PROFILES = 35;
pub const CR_DEVICE_NOT_THERE = 36;
pub const CR_NO_SUCH_VALUE = 37;
pub const CR_WRONG_TYPE = 38;
pub const CR_INVALID_PRIORITY = 39;
pub const CR_NOT_DISABLEABLE = 40;
pub const CR_FREE_RESOURCES = 41;
pub const CR_QUERY_VETOED = 42;
pub const CR_CANT_SHARE_IRQ = 43;
pub const CR_NO_DEPENDENT = 44;
pub const CR_SAME_RESOURCES = 45;
pub const CR_NO_SUCH_REGISTRY_KEY = 46;
pub const CR_INVALID_MACHINENAME = 47;
pub const CR_REMOTE_COMM_FAILURE = 48;
pub const CR_MACHINE_UNAVAILABLE = 49;
pub const CR_NO_CM_SERVICES = 50;
pub const CR_ACCESS_DENIED = 51;
pub const CR_CALL_NOT_IMPLEMENTED = 52;
pub const CR_INVALID_PROPERTY = 53;
pub const CR_DEVICE_INTERFACE_ACTIVE = 54;
pub const CR_NO_SUCH_DEVICE_INTERFACE = 55;
pub const CR_INVALID_REFERENCE_STRING = 56;
pub const CR_INVALID_CONFLICT_LIST = 57;
pub const CR_INVALID_INDEX = 58;
pub const CR_INVALID_STRUCTURE_SIZE = 59;
pub const NUM_CR_RESULTS = 60;
pub const NUM_CM_PROB_V1 = 37;
pub const NUM_CM_PROB_V2 = 50;
pub const NUM_CM_PROB_V3 = 51;
pub const NUM_CM_PROB_V4 = 52;
pub const NUM_CM_PROB_V5 = 53;
pub const NUM_CM_PROB_V6 = 54;
pub const NUM_CM_PROB_V7 = 55;
pub const NUM_CM_PROB_V8 = 57;
pub const NUM_CM_PROB_V9 = 58;
pub const NUM_CM_PROB = 58;
pub const LCPRI_FORCECONFIG = 0;
pub const LCPRI_BOOTCONFIG = 1;
pub const LCPRI_DESIRED = 8192;
pub const LCPRI_NORMAL = 12288;
pub const LCPRI_LASTBESTCONFIG = 16383;
pub const LCPRI_SUBOPTIMAL = 20480;
pub const LCPRI_LASTSOFTCONFIG = 32767;
pub const LCPRI_RESTART = 32768;
pub const LCPRI_REBOOT = 36864;
pub const LCPRI_POWEROFF = 40960;
pub const LCPRI_HARDRECONFIG = 49152;
pub const LCPRI_HARDWIRED = 57344;
pub const LCPRI_IMPOSSIBLE = 61440;
pub const LCPRI_DISABLED = 65535;
pub const MAX_LCPRI = 65535;
pub const CM_DEVICE_PANEL_SIDE_UNKNOWN = 0;
pub const CM_DEVICE_PANEL_SIDE_TOP = 1;
pub const CM_DEVICE_PANEL_SIDE_BOTTOM = 2;
pub const CM_DEVICE_PANEL_SIDE_LEFT = 3;
pub const CM_DEVICE_PANEL_SIDE_RIGHT = 4;
pub const CM_DEVICE_PANEL_SIDE_FRONT = 5;
pub const CM_DEVICE_PANEL_SIDE_BACK = 6;
pub const CM_DEVICE_PANEL_EDGE_UNKNOWN = 0;
pub const CM_DEVICE_PANEL_EDGE_TOP = 1;
pub const CM_DEVICE_PANEL_EDGE_BOTTOM = 2;
pub const CM_DEVICE_PANEL_EDGE_LEFT = 3;
pub const CM_DEVICE_PANEL_EDGE_RIGHT = 4;
pub const CM_DEVICE_PANEL_SHAPE_UNKNOWN = 0;
pub const CM_DEVICE_PANEL_SHAPE_RECTANGLE = 1;
pub const CM_DEVICE_PANEL_SHAPE_OVAL = 2;
pub const CM_DEVICE_PANEL_ORIENTATION_HORIZONTAL = 0;
pub const CM_DEVICE_PANEL_ORIENTATION_VERTICAL = 1;
pub const CM_DEVICE_PANEL_JOINT_TYPE_UNKNOWN = 0;
pub const CM_DEVICE_PANEL_JOINT_TYPE_PLANAR = 1;
pub const CM_DEVICE_PANEL_JOINT_TYPE_HINGE = 2;
pub const CM_DEVICE_PANEL_JOINT_TYPE_PIVOT = 3;
pub const CM_DEVICE_PANEL_JOINT_TYPE_SWIVEL = 4;
pub const LINE_LEN = 256;
pub const MAX_INF_STRING_LENGTH = 4096;
pub const MAX_INF_SECTION_NAME_LENGTH = 255;
pub const MAX_TITLE_LEN = 60;
pub const MAX_INSTRUCTION_LEN = 256;
pub const MAX_LABEL_LEN = 30;
pub const MAX_SERVICE_NAME_LEN = 256;
pub const MAX_SUBTITLE_LEN = 256;
pub const SP_MAX_MACHINENAME_LENGTH = 263;
pub const SP_ALTPLATFORM_FLAGS_VERSION_RANGE = 1;
pub const SP_ALTPLATFORM_FLAGS_SUITE_MASK = 2;
pub const DIRID_ABSOLUTE = -1;
pub const DIRID_ABSOLUTE_16BIT = 65535;
pub const DIRID_NULL = 0;
pub const DIRID_SRCPATH = 1;
pub const DIRID_WINDOWS = 10;
pub const DIRID_SYSTEM = 11;
pub const DIRID_DRIVERS = 12;
pub const DIRID_IOSUBSYS = 12;
pub const DIRID_DRIVER_STORE = 13;
pub const DIRID_INF = 17;
pub const DIRID_HELP = 18;
pub const DIRID_FONTS = 20;
pub const DIRID_VIEWERS = 21;
pub const DIRID_COLOR = 23;
pub const DIRID_APPS = 24;
pub const DIRID_SHARED = 25;
pub const DIRID_BOOT = 30;
pub const DIRID_SYSTEM16 = 50;
pub const DIRID_SPOOL = 51;
pub const DIRID_SPOOLDRIVERS = 52;
pub const DIRID_USERPROFILE = 53;
pub const DIRID_LOADER = 54;
pub const DIRID_PRINTPROCESSOR = 55;
pub const DIRID_DEFAULT = 11;
pub const DIRID_COMMON_STARTMENU = 16406;
pub const DIRID_COMMON_PROGRAMS = 16407;
pub const DIRID_COMMON_STARTUP = 16408;
pub const DIRID_COMMON_DESKTOPDIRECTORY = 16409;
pub const DIRID_COMMON_FAVORITES = 16415;
pub const DIRID_COMMON_APPDATA = 16419;
pub const DIRID_PROGRAM_FILES = 16422;
pub const DIRID_SYSTEM_X86 = 16425;
pub const DIRID_PROGRAM_FILES_X86 = 16426;
pub const DIRID_PROGRAM_FILES_COMMON = 16427;
pub const DIRID_PROGRAM_FILES_COMMONX86 = 16428;
pub const DIRID_COMMON_TEMPLATES = 16429;
pub const DIRID_COMMON_DOCUMENTS = 16430;
pub const DIRID_USER = 32768;
pub const SPFILENOTIFY_STARTQUEUE = 1;
pub const SPFILENOTIFY_ENDQUEUE = 2;
pub const SPFILENOTIFY_STARTSUBQUEUE = 3;
pub const SPFILENOTIFY_ENDSUBQUEUE = 4;
pub const SPFILENOTIFY_STARTDELETE = 5;
pub const SPFILENOTIFY_ENDDELETE = 6;
pub const SPFILENOTIFY_DELETEERROR = 7;
pub const SPFILENOTIFY_STARTRENAME = 8;
pub const SPFILENOTIFY_ENDRENAME = 9;
pub const SPFILENOTIFY_RENAMEERROR = 10;
pub const SPFILENOTIFY_STARTCOPY = 11;
pub const SPFILENOTIFY_ENDCOPY = 12;
pub const SPFILENOTIFY_COPYERROR = 13;
pub const SPFILENOTIFY_NEEDMEDIA = 14;
pub const SPFILENOTIFY_QUEUESCAN = 15;
pub const SPFILENOTIFY_CABINETINFO = 16;
pub const SPFILENOTIFY_FILEINCABINET = 17;
pub const SPFILENOTIFY_NEEDNEWCABINET = 18;
pub const SPFILENOTIFY_FILEEXTRACTED = 19;
pub const SPFILENOTIFY_FILEOPDELAYED = 20;
pub const SPFILENOTIFY_STARTBACKUP = 21;
pub const SPFILENOTIFY_BACKUPERROR = 22;
pub const SPFILENOTIFY_ENDBACKUP = 23;
pub const SPFILENOTIFY_QUEUESCAN_EX = 24;
pub const SPFILENOTIFY_STARTREGISTRATION = 25;
pub const SPFILENOTIFY_ENDREGISTRATION = 32;
pub const SPFILENOTIFY_QUEUESCAN_SIGNERINFO = 64;
pub const SPFILENOTIFY_LANGMISMATCH = 65536;
pub const SPFILENOTIFY_TARGETEXISTS = 131072;
pub const SPFILENOTIFY_TARGETNEWER = 262144;
pub const FILEOP_RENAME = 1;
pub const FILEOP_BACKUP = 3;
pub const FILEOP_ABORT = 0;
pub const FILEOP_DOIT = 1;
pub const FILEOP_SKIP = 2;
pub const FILEOP_RETRY = 1;
pub const FILEOP_NEWPATH = 4;
pub const COPYFLG_WARN_IF_SKIP = 1;
pub const COPYFLG_NOSKIP = 2;
pub const COPYFLG_NOVERSIONCHECK = 4;
pub const COPYFLG_FORCE_FILE_IN_USE = 8;
pub const COPYFLG_NO_OVERWRITE = 16;
pub const COPYFLG_NO_VERSION_DIALOG = 32;
pub const COPYFLG_OVERWRITE_OLDER_ONLY = 64;
pub const COPYFLG_PROTECTED_WINDOWS_DRIVER_FILE = 256;
pub const COPYFLG_REPLACEONLY = 1024;
pub const COPYFLG_NODECOMP = 2048;
pub const COPYFLG_REPLACE_BOOT_FILE = 4096;
pub const COPYFLG_NOPRUNE = 8192;
pub const COPYFLG_IN_USE_TRY_RENAME = 16384;
pub const DELFLG_IN_USE = 1;
pub const DELFLG_IN_USE1 = 65536;
pub const SPREG_SUCCESS = 0;
pub const SPREG_LOADLIBRARY = 1;
pub const SPREG_GETPROCADDR = 2;
pub const SPREG_REGSVR = 3;
pub const SPREG_DLLINSTALL = 4;
pub const SPREG_TIMEOUT = 5;
pub const SPREG_UNKNOWN = 4294967295;
pub const SPINT_ACTIVE = 1;
pub const SPINT_DEFAULT = 2;
pub const SPINT_REMOVED = 4;
pub const SPID_ACTIVE = 1;
pub const SPID_DEFAULT = 2;
pub const SPID_REMOVED = 4;
pub const ENABLECLASS_QUERY = 0;
pub const ENABLECLASS_SUCCESS = 1;
pub const ENABLECLASS_FAILURE = 2;
pub const MAX_INSTALLWIZARD_DYNAPAGES = 20;
pub const NDW_INSTALLFLAG_DIDFACTDEFS = 1;
pub const NDW_INSTALLFLAG_HARDWAREALLREADYIN = 2;
pub const NDW_INSTALLFLAG_NEEDSHUTDOWN = 512;
pub const NDW_INSTALLFLAG_EXPRESSINTRO = 1024;
pub const NDW_INSTALLFLAG_SKIPISDEVINSTALLED = 2048;
pub const NDW_INSTALLFLAG_NODETECTEDDEVS = 4096;
pub const NDW_INSTALLFLAG_INSTALLSPECIFIC = 8192;
pub const NDW_INSTALLFLAG_SKIPCLASSLIST = 16384;
pub const NDW_INSTALLFLAG_CI_PICKED_OEM = 32768;
pub const NDW_INSTALLFLAG_PCMCIAMODE = 65536;
pub const NDW_INSTALLFLAG_PCMCIADEVICE = 131072;
pub const NDW_INSTALLFLAG_USERCANCEL = 262144;
pub const NDW_INSTALLFLAG_KNOWNCLASS = 524288;
pub const DYNAWIZ_FLAG_PAGESADDED = 1;
pub const DYNAWIZ_FLAG_ANALYZE_HANDLECONFLICT = 8;
pub const DYNAWIZ_FLAG_INSTALLDET_NEXT = 2;
pub const DYNAWIZ_FLAG_INSTALLDET_PREV = 4;
pub const MIN_IDD_DYNAWIZ_RESOURCE_ID = 10000;
pub const MAX_IDD_DYNAWIZ_RESOURCE_ID = 11000;
pub const IDD_DYNAWIZ_FIRSTPAGE = 10000;
pub const IDD_DYNAWIZ_SELECT_PREVPAGE = 10001;
pub const IDD_DYNAWIZ_SELECT_NEXTPAGE = 10002;
pub const IDD_DYNAWIZ_ANALYZE_PREVPAGE = 10003;
pub const IDD_DYNAWIZ_ANALYZE_NEXTPAGE = 10004;
pub const IDD_DYNAWIZ_SELECTDEV_PAGE = 10009;
pub const IDD_DYNAWIZ_ANALYZEDEV_PAGE = 10010;
pub const IDD_DYNAWIZ_INSTALLDETECTEDDEVS_PAGE = 10011;
pub const IDD_DYNAWIZ_SELECTCLASS_PAGE = 10012;
pub const IDD_DYNAWIZ_INSTALLDETECTED_PREVPAGE = 10006;
pub const IDD_DYNAWIZ_INSTALLDETECTED_NEXTPAGE = 10007;
pub const IDD_DYNAWIZ_INSTALLDETECTED_NODEVS = 10008;
pub const DRIVER_HARDWAREID_RANK = 4095;
pub const DRIVER_HARDWAREID_MASK = 2147487743;
pub const DRIVER_UNTRUSTED_RANK = 2147483648;
pub const DRIVER_W9X_SUSPECT_RANK = 3221225472;
pub const DRIVER_COMPATID_RANK = 16383;
pub const DRIVER_UNTRUSTED_HARDWAREID_RANK = 36863;
pub const DRIVER_UNTRUSTED_COMPATID_RANK = 49151;
pub const DRIVER_W9X_SUSPECT_HARDWAREID_RANK = 53247;
pub const DRIVER_W9X_SUSPECT_COMPATID_RANK = 65535;
pub const SPPSR_SELECT_DEVICE_RESOURCES = 1;
pub const SPPSR_ENUM_BASIC_DEVICE_PROPERTIES = 2;
pub const SPPSR_ENUM_ADV_DEVICE_PROPERTIES = 3;
pub const INFINFO_INF_SPEC_IS_HINF = 1;
pub const INFINFO_INF_NAME_IS_ABSOLUTE = 2;
pub const INFINFO_DEFAULT_SEARCH = 3;
pub const INFINFO_REVERSE_DEFAULT_SEARCH = 4;
pub const INFINFO_INF_PATH_LIST_SEARCH = 5;
pub const SRCLIST_TEMPORARY = 1;
pub const SRCLIST_NOBROWSE = 2;
pub const SRCLIST_SYSTEM = 16;
pub const SRCLIST_USER = 32;
pub const SRCLIST_SYSIFADMIN = 64;
pub const SRCLIST_SUBDIRS = 256;
pub const SRCLIST_APPEND = 512;
pub const SRCLIST_NOSTRIPPLATFORM = 1024;
pub const IDF_NOBROWSE = 1;
pub const IDF_NOSKIP = 2;
pub const IDF_NODETAILS = 4;
pub const IDF_NOCOMPRESSED = 8;
pub const IDF_CHECKFIRST = 256;
pub const IDF_NOBEEP = 512;
pub const IDF_NOFOREGROUND = 1024;
pub const IDF_WARNIFSKIP = 2048;
pub const IDF_NOREMOVABLEMEDIAPROMPT = 4096;
pub const IDF_USEDISKNAMEASPROMPT = 8192;
pub const IDF_OEMDISK = 2147483648;
pub const DPROMPT_SUCCESS = 0;
pub const DPROMPT_CANCEL = 1;
pub const DPROMPT_SKIPFILE = 2;
pub const DPROMPT_BUFFERTOOSMALL = 3;
pub const DPROMPT_OUTOFMEMORY = 4;
pub const SETDIRID_NOT_FULL_PATH = 1;
pub const SRCINFO_PATH = 1;
pub const SRCINFO_TAGFILE = 2;
pub const SRCINFO_DESCRIPTION = 3;
pub const SRCINFO_FLAGS = 4;
pub const SRCINFO_TAGFILE2 = 5;
pub const SRC_FLAGS_CABFILE = 16;
pub const SP_FLAG_CABINETCONTINUATION = 2048;
pub const SP_BACKUP_BACKUPPASS = 1;
pub const SP_BACKUP_DEMANDPASS = 2;
pub const SP_BACKUP_SPECIAL = 4;
pub const SP_BACKUP_BOOTFILE = 8;
pub const SPQ_DELAYED_COPY = 1;
pub const SPQ_FLAG_BACKUP_AWARE = 1;
pub const SPQ_FLAG_ABORT_IF_UNSIGNED = 2;
pub const SPQ_FLAG_FILES_MODIFIED = 4;
pub const SPQ_FLAG_DO_SHUFFLEMOVE = 8;
pub const SPQ_FLAG_VALID = 15;
pub const SPOST_MAX = 3;
pub const SUOI_FORCEDELETE = 1;
pub const SUOI_INTERNAL1 = 2;
pub const SPDSL_IGNORE_DISK = 1;
pub const SPDSL_DISALLOW_NEGATIVE_ADJUST = 2;
pub const SPFILEQ_FILE_IN_USE = 1;
pub const SPFILEQ_REBOOT_RECOMMENDED = 2;
pub const SPFILEQ_REBOOT_IN_PROGRESS = 4;
pub const FLG_ADDREG_DELREG_BIT = 32768;
pub const FLG_ADDREG_BINVALUETYPE = 1;
pub const FLG_ADDREG_NOCLOBBER = 2;
pub const FLG_ADDREG_DELVAL = 4;
pub const FLG_ADDREG_APPEND = 8;
pub const FLG_ADDREG_KEYONLY = 16;
pub const FLG_ADDREG_OVERWRITEONLY = 32;
pub const FLG_ADDREG_64BITKEY = 4096;
pub const FLG_ADDREG_KEYONLY_COMMON = 8192;
pub const FLG_ADDREG_32BITKEY = 16384;
pub const FLG_ADDREG_TYPE_SZ = 0;
pub const FLG_ADDREG_TYPE_MULTI_SZ = 65536;
pub const FLG_ADDREG_TYPE_EXPAND_SZ = 131072;
pub const FLG_DELREG_VALUE = 0;
pub const FLG_DELREG_TYPE_SZ = 0;
pub const FLG_DELREG_TYPE_MULTI_SZ = 65536;
pub const FLG_DELREG_TYPE_EXPAND_SZ = 131072;
pub const FLG_DELREG_64BITKEY = 4096;
pub const FLG_DELREG_KEYONLY_COMMON = 8192;
pub const FLG_DELREG_32BITKEY = 16384;
pub const FLG_DELREG_OPERATION_MASK = 254;
pub const FLG_BITREG_CLEARBITS = 0;
pub const FLG_BITREG_SETBITS = 1;
pub const FLG_BITREG_64BITKEY = 4096;
pub const FLG_BITREG_32BITKEY = 16384;
pub const FLG_INI2REG_64BITKEY = 4096;
pub const FLG_INI2REG_32BITKEY = 16384;
pub const FLG_REGSVR_DLLREGISTER = 1;
pub const FLG_REGSVR_DLLINSTALL = 2;
pub const FLG_PROFITEM_CURRENTUSER = 1;
pub const FLG_PROFITEM_DELETE = 2;
pub const FLG_PROFITEM_GROUP = 4;
pub const FLG_PROFITEM_CSIDL = 8;
pub const FLG_ADDPROPERTY_NOCLOBBER = 1;
pub const FLG_ADDPROPERTY_OVERWRITEONLY = 2;
pub const FLG_ADDPROPERTY_APPEND = 4;
pub const FLG_ADDPROPERTY_OR = 8;
pub const FLG_ADDPROPERTY_AND = 16;
pub const FLG_DELPROPERTY_MULTI_SZ_DELSTRING = 1;
pub const SPINST_LOGCONFIG = 1;
pub const SPINST_INIFILES = 2;
pub const SPINST_REGISTRY = 4;
pub const SPINST_INI2REG = 8;
pub const SPINST_FILES = 16;
pub const SPINST_BITREG = 32;
pub const SPINST_REGSVR = 64;
pub const SPINST_UNREGSVR = 128;
pub const SPINST_PROFILEITEMS = 256;
pub const SPINST_COPYINF = 512;
pub const SPINST_PROPERTIES = 1024;
pub const SPINST_ALL = 2047;
pub const SPINST_SINGLESECTION = 65536;
pub const SPINST_LOGCONFIG_IS_FORCED = 131072;
pub const SPINST_LOGCONFIGS_ARE_OVERRIDES = 262144;
pub const SPINST_REGISTERCALLBACKAWARE = 524288;
pub const SPINST_DEVICEINSTALL = 1048576;
pub const SPFILELOG_SYSTEMLOG = 1;
pub const SPFILELOG_FORCENEW = 2;
pub const SPFILELOG_QUERYONLY = 4;
pub const SPFILELOG_OEMFILE = 1;
pub const LogSevInformation = 0;
pub const LogSevWarning = 1;
pub const LogSevError = 2;
pub const LogSevFatalError = 3;
pub const LogSevMaximum = 4;
pub const DIOD_INHERIT_CLASSDRVS = 2;
pub const DIOD_CANCEL_REMOVE = 4;
pub const DIODI_NO_ADD = 1;
pub const SPRDI_FIND_DUPS = 1;
pub const SPDIT_NODRIVER = 0;
pub const DIBCI_NOINSTALLCLASS = 1;
pub const DIBCI_NODISPLAYCLASS = 2;
pub const DIOCR_INSTALLER = 1;
pub const DIOCR_INTERFACE = 2;
pub const DIREG_DEV = 1;
pub const DIREG_DRV = 2;
pub const DIREG_BOTH = 4;
pub const DICLASSPROP_INSTALLER = 1;
pub const DICLASSPROP_INTERFACE = 2;
pub const SPCRP_UPPERFILTERS = 17;
pub const SPCRP_LOWERFILTERS = 18;
pub const SPCRP_SECURITY = 23;
pub const SPCRP_SECURITY_SDS = 24;
pub const SPCRP_DEVTYPE = 25;
pub const SPCRP_EXCLUSIVE = 26;
pub const SPCRP_CHARACTERISTICS = 27;
pub const SPCRP_MAXIMUM_PROPERTY = 28;
pub const DMI_MASK = 1;
pub const DMI_BKCOLOR = 2;
pub const DMI_USERECT = 4;
pub const DIGCDP_FLAG_BASIC = 1;
pub const DIGCDP_FLAG_ADVANCED = 2;
pub const DIGCDP_FLAG_REMOTE_BASIC = 3;
pub const DIGCDP_FLAG_REMOTE_ADVANCED = 4;
pub const IDI_RESOURCEFIRST = 159;
pub const IDI_RESOURCE = 159;
pub const IDI_RESOURCELAST = 161;
pub const IDI_RESOURCEOVERLAYFIRST = 161;
pub const IDI_RESOURCEOVERLAYLAST = 161;
pub const IDI_CONFLICT = 161;
pub const IDI_CLASSICON_OVERLAYFIRST = 500;
pub const IDI_CLASSICON_OVERLAYLAST = 502;
pub const IDI_PROBLEM_OVL = 500;
pub const IDI_DISABLED_OVL = 501;
pub const IDI_FORCED_OVL = 502;
pub const SPWPT_SELECTDEVICE = 1;
pub const SPWP_USE_DEVINFO_DATA = 1;
pub const SIGNERSCORE_UNKNOWN = 4278190080;
pub const SIGNERSCORE_W9X_SUSPECT = 3221225472;
pub const SIGNERSCORE_UNSIGNED = 2147483648;
pub const SIGNERSCORE_AUTHENTICODE = 251658240;
pub const SIGNERSCORE_WHQL = 218103813;
pub const SIGNERSCORE_UNCLASSIFIED = 218103812;
pub const SIGNERSCORE_INBOX = 218103811;
pub const SIGNERSCORE_LOGO_STANDARD = 218103810;
pub const SIGNERSCORE_LOGO_PREMIUM = 218103809;
pub const SIGNERSCORE_MASK = 4278190080;
pub const SIGNERSCORE_SIGNED_MASK = 4026531840;
pub const DICUSTOMDEVPROP_MERGE_MULTISZ = 1;
pub const SCWMI_CLOBBER_SECURITY = 1;
pub const MAX_DEVICE_ID_LEN = 200;
pub const MAX_DEVNODE_ID_LEN = 200;
pub const MAX_GUID_STRING_LEN = 39;
pub const MAX_CLASS_NAME_LEN = 32;
pub const MAX_PROFILE_LEN = 80;
pub const MAX_CONFIG_VALUE = 9999;
pub const MAX_INSTANCE_VALUE = 9999;
pub const MAX_MEM_REGISTERS = 9;
pub const MAX_IO_PORTS = 20;
pub const MAX_IRQS = 7;
pub const MAX_DMA_CHANNELS = 7;
pub const DWORD_MAX = 4294967295;
pub const CONFIGMG_VERSION = 1024;
pub const IO_ALIAS_10_BIT_DECODE = 4;
pub const IO_ALIAS_12_BIT_DECODE = 16;
pub const IO_ALIAS_16_BIT_DECODE = 0;
pub const IO_ALIAS_POSITIVE_DECODE = 255;
pub const IOA_Local = 255;
pub const CM_RESDES_WIDTH_DEFAULT = 0;
pub const CM_RESDES_WIDTH_32 = 1;
pub const CM_RESDES_WIDTH_64 = 2;
pub const CM_RESDES_WIDTH_BITS = 3;
pub const PCD_MAX_MEMORY = 2;
pub const PCD_MAX_IO = 2;
pub const mPMF_AUDIO_ENABLE = 8;
pub const CM_HWPI_NOT_DOCKABLE = 0;
pub const CM_HWPI_UNDOCKED = 1;
pub const CM_HWPI_DOCKED = 2;
pub const CM_ADD_RANGE_ADDIFCONFLICT = 0;
pub const CM_ADD_RANGE_DONOTADDIFCONFLICT = 1;
pub const CM_ADD_RANGE_BITS = 1;
pub const LOG_CONF_BITS = 7;
pub const PRIORITY_EQUAL_FIRST = 8;
pub const PRIORITY_EQUAL_LAST = 0;
pub const PRIORITY_BIT = 8;
pub const RegDisposition_OpenAlways = 0;
pub const RegDisposition_OpenExisting = 1;
pub const RegDisposition_Bits = 1;
pub const CM_ADD_ID_HARDWARE = 0;
pub const CM_ADD_ID_COMPATIBLE = 1;
pub const CM_ADD_ID_BITS = 1;
pub const CM_CREATE_DEVNODE_NORMAL = 0;
pub const CM_CREATE_DEVNODE_NO_WAIT_INSTALL = 1;
pub const CM_CREATE_DEVNODE_PHANTOM = 2;
pub const CM_CREATE_DEVNODE_GENERATE_ID = 4;
pub const CM_CREATE_DEVNODE_DO_NOT_INSTALL = 8;
pub const CM_CREATE_DEVNODE_BITS = 15;
pub const CM_CREATE_DEVINST_NORMAL = 0;
pub const CM_CREATE_DEVINST_NO_WAIT_INSTALL = 1;
pub const CM_CREATE_DEVINST_PHANTOM = 2;
pub const CM_CREATE_DEVINST_GENERATE_ID = 4;
pub const CM_CREATE_DEVINST_DO_NOT_INSTALL = 8;
pub const CM_CREATE_DEVINST_BITS = 15;
pub const CM_DELETE_CLASS_ONLY = 0;
pub const CM_DELETE_CLASS_SUBKEYS = 1;
pub const CM_DELETE_CLASS_INTERFACE = 2;
pub const CM_DELETE_CLASS_BITS = 3;
pub const CM_DETECT_NEW_PROFILE = 1;
pub const CM_DETECT_CRASHED = 2;
pub const CM_DETECT_HWPROF_FIRST_BOOT = 4;
pub const CM_DETECT_RUN = 2147483648;
pub const CM_DETECT_BITS = 2147483655;
pub const CM_DISABLE_POLITE = 0;
pub const CM_DISABLE_ABSOLUTE = 1;
pub const CM_DISABLE_HARDWARE = 2;
pub const CM_DISABLE_UI_NOT_OK = 4;
pub const CM_DISABLE_PERSIST = 8;
pub const CM_DISABLE_BITS = 15;
pub const CM_GETIDLIST_FILTER_NONE = 0;
pub const CM_GETIDLIST_FILTER_ENUMERATOR = 1;
pub const CM_GETIDLIST_FILTER_SERVICE = 2;
pub const CM_GETIDLIST_FILTER_EJECTRELATIONS = 4;
pub const CM_GETIDLIST_FILTER_REMOVALRELATIONS = 8;
pub const CM_GETIDLIST_FILTER_POWERRELATIONS = 16;
pub const CM_GETIDLIST_FILTER_BUSRELATIONS = 32;
pub const CM_GETIDLIST_DONOTGENERATE = 268435520;
pub const CM_GETIDLIST_FILTER_BITS = 268435583;
pub const CM_GETIDLIST_FILTER_TRANSPORTRELATIONS = 128;
pub const CM_GETIDLIST_FILTER_PRESENT = 256;
pub const CM_GETIDLIST_FILTER_CLASS = 512;
pub const CM_DRP_DEVICEDESC = 1;
pub const CM_DRP_HARDWAREID = 2;
pub const CM_DRP_COMPATIBLEIDS = 3;
pub const CM_DRP_UNUSED0 = 4;
pub const CM_DRP_SERVICE = 5;
pub const CM_DRP_UNUSED1 = 6;
pub const CM_DRP_UNUSED2 = 7;
pub const CM_DRP_CLASS = 8;
pub const CM_DRP_CLASSGUID = 9;
pub const CM_DRP_DRIVER = 10;
pub const CM_DRP_CONFIGFLAGS = 11;
pub const CM_DRP_MFG = 12;
pub const CM_DRP_FRIENDLYNAME = 13;
pub const CM_DRP_LOCATION_INFORMATION = 14;
pub const CM_DRP_PHYSICAL_DEVICE_OBJECT_NAME = 15;
pub const CM_DRP_CAPABILITIES = 16;
pub const CM_DRP_UI_NUMBER = 17;
pub const CM_DRP_UPPERFILTERS = 18;
pub const CM_CRP_UPPERFILTERS = 18;
pub const CM_DRP_LOWERFILTERS = 19;
pub const CM_CRP_LOWERFILTERS = 19;
pub const CM_DRP_BUSTYPEGUID = 20;
pub const CM_DRP_LEGACYBUSTYPE = 21;
pub const CM_DRP_BUSNUMBER = 22;
pub const CM_DRP_ENUMERATOR_NAME = 23;
pub const CM_DRP_SECURITY = 24;
pub const CM_CRP_SECURITY = 24;
pub const CM_DRP_SECURITY_SDS = 25;
pub const CM_CRP_SECURITY_SDS = 25;
pub const CM_DRP_DEVTYPE = 26;
pub const CM_CRP_DEVTYPE = 26;
pub const CM_DRP_EXCLUSIVE = 27;
pub const CM_CRP_EXCLUSIVE = 27;
pub const CM_DRP_CHARACTERISTICS = 28;
pub const CM_CRP_CHARACTERISTICS = 28;
pub const CM_DRP_ADDRESS = 29;
pub const CM_DRP_UI_NUMBER_DESC_FORMAT = 30;
pub const CM_DRP_DEVICE_POWER_DATA = 31;
pub const CM_DRP_REMOVAL_POLICY = 32;
pub const CM_DRP_REMOVAL_POLICY_HW_DEFAULT = 33;
pub const CM_DRP_REMOVAL_POLICY_OVERRIDE = 34;
pub const CM_DRP_INSTALL_STATE = 35;
pub const CM_DRP_LOCATION_PATHS = 36;
pub const CM_DRP_BASE_CONTAINERID = 37;
pub const CM_DRP_MIN = 1;
pub const CM_CRP_MIN = 1;
pub const CM_DRP_MAX = 37;
pub const CM_CRP_MAX = 37;
pub const CM_OPEN_CLASS_KEY_INSTALLER = 0;
pub const CM_OPEN_CLASS_KEY_INTERFACE = 1;
pub const CM_OPEN_CLASS_KEY_BITS = 1;
pub const CM_REMOVE_UI_OK = 0;
pub const CM_REMOVE_UI_NOT_OK = 1;
pub const CM_REMOVE_NO_RESTART = 2;
pub const CM_REMOVE_DISABLE = 4;
pub const CM_REMOVE_BITS = 7;
pub const CM_QUERY_REMOVE_UI_OK = 0;
pub const CM_QUERY_REMOVE_UI_NOT_OK = 1;
pub const CM_REGISTER_DEVICE_DRIVER_STATIC = 0;
pub const CM_REGISTER_DEVICE_DRIVER_DISABLEABLE = 1;
pub const CM_REGISTER_DEVICE_DRIVER_REMOVABLE = 2;
pub const CM_REGISTER_DEVICE_DRIVER_BITS = 3;
pub const CM_REGISTRY_HARDWARE = 0;
pub const CM_REGISTRY_SOFTWARE = 1;
pub const CM_REGISTRY_USER = 256;
pub const CM_REGISTRY_CONFIG = 512;
pub const CM_REGISTRY_BITS = 769;
pub const CM_SET_DEVNODE_PROBLEM_NORMAL = 0;
pub const CM_SET_DEVNODE_PROBLEM_OVERRIDE = 1;
pub const CM_SET_DEVNODE_PROBLEM_BITS = 1;
pub const CM_SET_DEVINST_PROBLEM_NORMAL = 0;
pub const CM_SET_DEVINST_PROBLEM_OVERRIDE = 1;
pub const CM_SET_DEVINST_PROBLEM_BITS = 1;
pub const CM_SET_HW_PROF_FLAGS_UI_NOT_OK = 1;
pub const CM_SET_HW_PROF_FLAGS_BITS = 1;
pub const CM_SETUP_DEVNODE_READY = 0;
pub const CM_SETUP_DEVINST_READY = 0;
pub const CM_SETUP_DOWNLOAD = 1;
pub const CM_SETUP_WRITE_LOG_CONFS = 2;
pub const CM_SETUP_PROP_CHANGE = 3;
pub const CM_SETUP_DEVNODE_RESET = 4;
pub const CM_SETUP_DEVINST_RESET = 4;
pub const CM_SETUP_DEVNODE_CONFIG = 5;
pub const CM_SETUP_DEVINST_CONFIG = 5;
pub const CM_SETUP_DEVNODE_CONFIG_CLASS = 6;
pub const CM_SETUP_DEVINST_CONFIG_CLASS = 6;
pub const CM_SETUP_DEVNODE_CONFIG_EXTENSIONS = 7;
pub const CM_SETUP_DEVINST_CONFIG_EXTENSIONS = 7;
pub const CM_SETUP_DEVNODE_CONFIG_RESET = 8;
pub const CM_SETUP_DEVINST_CONFIG_RESET = 8;
pub const CM_SETUP_BITS = 15;
pub const CM_QUERY_ARBITRATOR_RAW = 0;
pub const CM_QUERY_ARBITRATOR_TRANSLATED = 1;
pub const CM_QUERY_ARBITRATOR_BITS = 1;
pub const CM_CUSTOMDEVPROP_MERGE_MULTISZ = 1;
pub const CM_CUSTOMDEVPROP_BITS = 1;
pub const CM_NAME_ATTRIBUTE_NAME_RETRIEVED_FROM_DEVICE = 1;
pub const CM_NAME_ATTRIBUTE_USER_ASSIGNED_NAME = 2;
pub const CM_CLASS_PROPERTY_INSTALLER = 0;
pub const CM_CLASS_PROPERTY_INTERFACE = 1;
pub const CM_CLASS_PROPERTY_BITS = 1;
pub const CM_NOTIFY_FILTER_FLAG_ALL_INTERFACE_CLASSES = 1;
pub const CM_NOTIFY_FILTER_FLAG_ALL_DEVICE_INSTANCES = 2;
pub const CM_GLOBAL_STATE_CAN_DO_UI = 1;
pub const CM_GLOBAL_STATE_ON_BIG_STACK = 2;
pub const CM_GLOBAL_STATE_SERVICES_AVAILABLE = 4;
pub const CM_GLOBAL_STATE_SHUTTING_DOWN = 8;
pub const CM_GLOBAL_STATE_DETECTION_PENDING = 16;
pub const CM_GLOBAL_STATE_REBOOT_REQUIRED = 32;
pub const MAX_KEY_LEN = 100;
pub const MAX_PRIORITYSTR_LEN = 16;
pub const MAX_INF_FLAG = 20;
pub const MAX_INFSTR_STRKEY_LEN = 32;
pub const SetupFileLogSourceFilename = 0;
pub const SetupFileLogChecksum = 1;
pub const SetupFileLogDiskTagfile = 2;
pub const SetupFileLogDiskDescription = 3;
pub const SetupFileLogOtherInfo = 4;
pub const SetupFileLogMax = 5;
pub const PNP_VetoTypeUnknown = 0;
pub const PNP_VetoLegacyDevice = 1;
pub const PNP_VetoPendingClose = 2;
pub const PNP_VetoWindowsApp = 3;
pub const PNP_VetoWindowsService = 4;
pub const PNP_VetoOutstandingOpen = 5;
pub const PNP_VetoDevice = 6;
pub const PNP_VetoDriver = 7;
pub const PNP_VetoIllegalDeviceRequest = 8;
pub const PNP_VetoInsufficientPower = 9;
pub const PNP_VetoNonDisableable = 10;
pub const PNP_VetoLegacyDriver = 11;
pub const PNP_VetoInsufficientRights = 12;
pub const PNP_VetoAlreadyRemoved = 13;
pub const CM_NOTIFY_FILTER_TYPE_DEVICEINTERFACE = 0;
pub const CM_NOTIFY_FILTER_TYPE_DEVICEHANDLE = 1;
pub const CM_NOTIFY_FILTER_TYPE_DEVICEINSTANCE = 2;
pub const CM_NOTIFY_FILTER_TYPE_MAX = 3;
pub const CM_NOTIFY_ACTION_DEVICEINTERFACEARRIVAL = 0;
pub const CM_NOTIFY_ACTION_DEVICEINTERFACEREMOVAL = 1;
pub const CM_NOTIFY_ACTION_DEVICEQUERYREMOVE = 2;
pub const CM_NOTIFY_ACTION_DEVICEQUERYREMOVEFAILED = 3;
pub const CM_NOTIFY_ACTION_DEVICEREMOVEPENDING = 4;
pub const CM_NOTIFY_ACTION_DEVICEREMOVECOMPLETE = 5;
pub const CM_NOTIFY_ACTION_DEVICECUSTOMEVENT = 6;
pub const CM_NOTIFY_ACTION_DEVICEINSTANCEENUMERATED = 7;
pub const CM_NOTIFY_ACTION_DEVICEINSTANCESTARTED = 8;
pub const CM_NOTIFY_ACTION_DEVICEINSTANCEREMOVED = 9;
pub const CM_NOTIFY_ACTION_MAX = 10;

pub const aliases = struct {
    pub const SP_COPY_STYLE = u32;
    pub const SETUP_FILE_OPERATION = u32;
    pub const OEM_SOURCE_MEDIA_TYPE = u32;
    pub const SETUP_DI_DRIVER_TYPE = u32;
    pub const DIINSTALLDEVICE_FLAGS = u32;
    pub const DIINSTALLDRIVER_FLAGS = u32;
    pub const DIUNINSTALLDRIVER_FLAGS = u32;
    pub const DIROLLBACKDRIVER_FLAGS = u32;
    pub const UPDATEDRIVERFORPLUGANDPLAYDEVICES_FLAGS = u32;
    pub const CM_RESTYPE = u32;
    pub const CM_GET_DEVICE_INTERFACE_LIST_FLAGS = u32;
    pub const CM_LOCATE_DEVNODE_FLAGS = u32;
    pub const CM_REENUMERATE_FLAGS = u32;
    pub const CM_ENUMERATE_FLAGS = u32;
    pub const INF_STYLE = u32;
    pub const SETUPSCANFILEQUEUE_FLAGS = u32;
    pub const CM_LOG_CONF = u32;
    pub const CM_DEVNODE_STATUS_FLAGS = u32;
    pub const CM_PROB = u32;
    pub const SPSVCINST_FLAGS = u32;
    pub const CM_CDMASK = u32;
    pub const CM_CDFLAGS = u32;
    pub const CM_REMOVAL_POLICY = u32;
    pub const CM_INSTALL_STATE = u32;
    pub const CM_DEVCAP = u32;
    pub const DD_FLAGS = u32;
    pub const IOD_DESFLAGS = u32;
    pub const IRQD_FLAGS = u32;
    pub const MD_FLAGS = u32;
    pub const PMF_FLAGS = u32;
    pub const PCD_FLAGS = u32;
    pub const SETUP_DI_REGISTRY_PROPERTY = u32;
    pub const SETUP_DI_DEVICE_CREATION_FLAGS = u32;
    pub const SETUP_DI_DRIVER_INSTALL_FLAGS = u32;
    pub const SETUP_DI_STATE_CHANGE = u32;
    pub const SETUP_DI_PROPERTY_CHANGE_SCOPE = u32;
    pub const SETUP_DI_REMOVE_DEVICE_SCOPE = u32;
    pub const SETUP_DI_GET_CLASS_DEVS_FLAGS = u32;
    pub const DI_FUNCTION = u32;
    pub const SETUP_DI_DEVICE_INSTALL_FLAGS = u32;
    pub const SETUP_DI_DEVICE_INSTALL_FLAGS_EX = u32;
    pub const SETUP_DI_DEVICE_CONFIGURATION_FLAGS = u32;
    pub const FILE_COMPRESSION_TYPE = u32;
    pub const CONFIGRET = u32;
    pub const SetupFileLogInfo = i32;
    pub const PNP_VETO_TYPE = i32;
    pub const CM_NOTIFY_FILTER_TYPE = i32;
    pub const CM_NOTIFY_ACTION = i32;
};
