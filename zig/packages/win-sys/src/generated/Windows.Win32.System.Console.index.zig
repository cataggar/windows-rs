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
    .{ "AllocConsole", MethodRecord{ .library = "KERNEL32", .import = "AllocConsole", .signature = "\x00\x00\x11\x59" } },
    .{ "AllocConsoleWithOptions", MethodRecord{ .library = "KERNEL32", .import = "AllocConsoleWithOptions", .signature = "\x00\x02\x11\x79\x0f\x11\xc0\x00\x40\x5d\x0f\x11\xc0\x00\x40\x61" } },
    .{ "FreeConsole", MethodRecord{ .library = "KERNEL32", .import = "FreeConsole", .signature = "\x00\x00\x11\x59" } },
    .{ "AttachConsole", MethodRecord{ .library = "KERNEL32", .import = "AttachConsole", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "GetConsoleCP", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleCP", .signature = "\x00\x00\x09" } },
    .{ "GetConsoleOutputCP", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleOutputCP", .signature = "\x00\x00\x09" } },
    .{ "GetConsoleMode", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleMode", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x83\x1d" } },
    .{ "SetConsoleMode", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleMode", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x83\x1d" } },
    .{ "GetNumberOfConsoleInputEvents", MethodRecord{ .library = "KERNEL32", .import = "GetNumberOfConsoleInputEvents", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x09" } },
    .{ "ReadConsoleInputA", MethodRecord{ .library = "KERNEL32", .import = "ReadConsoleInputA", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x65\x09\x0f\x09" } },
    .{ "ReadConsoleInputW", MethodRecord{ .library = "KERNEL32", .import = "ReadConsoleInputW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x65\x09\x0f\x09" } },
    .{ "PeekConsoleInputA", MethodRecord{ .library = "KERNEL32", .import = "PeekConsoleInputA", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x65\x09\x0f\x09" } },
    .{ "PeekConsoleInputW", MethodRecord{ .library = "KERNEL32", .import = "PeekConsoleInputW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x65\x09\x0f\x09" } },
    .{ "ReadConsoleA", MethodRecord{ .library = "KERNEL32", .import = "ReadConsoleA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x09\x0f\x09\x0f\x11\xc0\x00\x40\x69" } },
    .{ "ReadConsoleW", MethodRecord{ .library = "KERNEL32", .import = "ReadConsoleW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x09\x0f\x09\x0f\x11\xc0\x00\x40\x69" } },
    .{ "WriteConsoleA", MethodRecord{ .library = "KERNEL32", .import = "WriteConsoleA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x3d\x09\x0f\x09\x0f\x01" } },
    .{ "WriteConsoleW", MethodRecord{ .library = "KERNEL32", .import = "WriteConsoleW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x05\x09\x0f\x09\x0f\x01" } },
    .{ "SetConsoleCtrlHandler", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleCtrlHandler", .signature = "\x00\x02\x11\x59\x12\xc0\x00\x40\x6d\x11\x59" } },
    .{ "CreatePseudoConsole", MethodRecord{ .library = "KERNEL32", .import = "CreatePseudoConsole", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x40\x71\x11\x80\x85\x11\x80\x85\x09\x0f\x11\xc0\x00\x40\x75" } },
    .{ "ResizePseudoConsole", MethodRecord{ .library = "KERNEL32", .import = "ResizePseudoConsole", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x40\x75\x11\xc0\x00\x40\x71" } },
    .{ "ClosePseudoConsole", MethodRecord{ .library = "KERNEL32", .import = "ClosePseudoConsole", .signature = "\x00\x01\x01\x11\xc0\x00\x40\x75" } },
    .{ "ReleasePseudoConsole", MethodRecord{ .library = "KERNEL32", .import = "ReleasePseudoConsole", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x40\x75" } },
    .{ "FillConsoleOutputCharacterA", MethodRecord{ .library = "KERNEL32", .import = "FillConsoleOutputCharacterA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x8d\x5d\x09\x11\xc0\x00\x40\x71\x0f\x09" } },
    .{ "FillConsoleOutputCharacterW", MethodRecord{ .library = "KERNEL32", .import = "FillConsoleOutputCharacterW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x03\x09\x11\xc0\x00\x40\x71\x0f\x09" } },
    .{ "FillConsoleOutputAttribute", MethodRecord{ .library = "KERNEL32", .import = "FillConsoleOutputAttribute", .signature = "\x00\x05\x11\x59\x11\x80\x85\x07\x09\x11\xc0\x00\x40\x71\x0f\x09" } },
    .{ "GenerateConsoleCtrlEvent", MethodRecord{ .library = "KERNEL32", .import = "GenerateConsoleCtrlEvent", .signature = "\x00\x02\x11\x59\x09\x09" } },
    .{ "CreateConsoleScreenBuffer", MethodRecord{ .library = "KERNEL32", .import = "CreateConsoleScreenBuffer", .signature = "\x00\x05\x11\x80\x85\x09\x09\x0f\x11\x8b\xb5\x09\x0f\x01" } },
    .{ "SetConsoleActiveScreenBuffer", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleActiveScreenBuffer", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "FlushConsoleInputBuffer", MethodRecord{ .library = "KERNEL32", .import = "FlushConsoleInputBuffer", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "SetConsoleCP", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleCP", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "SetConsoleOutputCP", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleOutputCP", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "GetConsoleCursorInfo", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleCursorInfo", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x79" } },
    .{ "SetConsoleCursorInfo", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleCursorInfo", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x79" } },
    .{ "GetConsoleScreenBufferInfo", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleScreenBufferInfo", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x7d" } },
    .{ "GetConsoleScreenBufferInfoEx", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleScreenBufferInfoEx", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x81" } },
    .{ "SetConsoleScreenBufferInfoEx", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleScreenBufferInfoEx", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x81" } },
    .{ "SetConsoleScreenBufferSize", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleScreenBufferSize", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\xc0\x00\x40\x71" } },
    .{ "SetConsoleCursorPosition", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleCursorPosition", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\xc0\x00\x40\x71" } },
    .{ "GetLargestConsoleWindowSize", MethodRecord{ .library = "KERNEL32", .import = "GetLargestConsoleWindowSize", .signature = "\x00\x01\x11\xc0\x00\x40\x71\x11\x80\x85" } },
    .{ "SetConsoleTextAttribute", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleTextAttribute", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\xa0\xa1" } },
    .{ "SetConsoleWindowInfo", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleWindowInfo", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x59\x0f\x11\xc0\x00\x40\x85" } },
    .{ "WriteConsoleOutputCharacterA", MethodRecord{ .library = "KERNEL32", .import = "WriteConsoleOutputCharacterA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x3d\x09\x11\xc0\x00\x40\x71\x0f\x09" } },
    .{ "WriteConsoleOutputCharacterW", MethodRecord{ .library = "KERNEL32", .import = "WriteConsoleOutputCharacterW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x05\x09\x11\xc0\x00\x40\x71\x0f\x09" } },
    .{ "WriteConsoleOutputAttribute", MethodRecord{ .library = "KERNEL32", .import = "WriteConsoleOutputAttribute", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x07\x09\x11\xc0\x00\x40\x71\x0f\x09" } },
    .{ "ReadConsoleOutputCharacterA", MethodRecord{ .library = "KERNEL32", .import = "ReadConsoleOutputCharacterA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x3d\x09\x11\xc0\x00\x40\x71\x0f\x09" } },
    .{ "ReadConsoleOutputCharacterW", MethodRecord{ .library = "KERNEL32", .import = "ReadConsoleOutputCharacterW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x05\x09\x11\xc0\x00\x40\x71\x0f\x09" } },
    .{ "ReadConsoleOutputAttribute", MethodRecord{ .library = "KERNEL32", .import = "ReadConsoleOutputAttribute", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x07\x09\x11\xc0\x00\x40\x71\x0f\x09" } },
    .{ "WriteConsoleInputA", MethodRecord{ .library = "KERNEL32", .import = "WriteConsoleInputA", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x65\x09\x0f\x09" } },
    .{ "WriteConsoleInputW", MethodRecord{ .library = "KERNEL32", .import = "WriteConsoleInputW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x65\x09\x0f\x09" } },
    .{ "ScrollConsoleScreenBufferA", MethodRecord{ .library = "KERNEL32", .import = "ScrollConsoleScreenBufferA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x85\x0f\x11\xc0\x00\x40\x85\x11\xc0\x00\x40\x71\x0f\x11\xc0\x00\x40\x89" } },
    .{ "ScrollConsoleScreenBufferW", MethodRecord{ .library = "KERNEL32", .import = "ScrollConsoleScreenBufferW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x85\x0f\x11\xc0\x00\x40\x85\x11\xc0\x00\x40\x71\x0f\x11\xc0\x00\x40\x89" } },
    .{ "WriteConsoleOutputA", MethodRecord{ .library = "KERNEL32", .import = "WriteConsoleOutputA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x89\x11\xc0\x00\x40\x71\x11\xc0\x00\x40\x71\x0f\x11\xc0\x00\x40\x85" } },
    .{ "WriteConsoleOutputW", MethodRecord{ .library = "KERNEL32", .import = "WriteConsoleOutputW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x89\x11\xc0\x00\x40\x71\x11\xc0\x00\x40\x71\x0f\x11\xc0\x00\x40\x85" } },
    .{ "ReadConsoleOutputA", MethodRecord{ .library = "KERNEL32", .import = "ReadConsoleOutputA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x89\x11\xc0\x00\x40\x71\x11\xc0\x00\x40\x71\x0f\x11\xc0\x00\x40\x85" } },
    .{ "ReadConsoleOutputW", MethodRecord{ .library = "KERNEL32", .import = "ReadConsoleOutputW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x89\x11\xc0\x00\x40\x71\x11\xc0\x00\x40\x71\x0f\x11\xc0\x00\x40\x85" } },
    .{ "GetConsoleTitleA", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleTitleA", .signature = "\x00\x02\x09\x11\x3d\x09" } },
    .{ "GetConsoleTitleW", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleTitleW", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "GetConsoleOriginalTitleA", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleOriginalTitleA", .signature = "\x00\x02\x09\x11\x3d\x09" } },
    .{ "GetConsoleOriginalTitleW", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleOriginalTitleW", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "SetConsoleTitleA", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleTitleA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "SetConsoleTitleW", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleTitleW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "GetNumberOfConsoleMouseButtons", MethodRecord{ .library = "KERNEL32", .import = "GetNumberOfConsoleMouseButtons", .signature = "\x00\x01\x11\x59\x0f\x09" } },
    .{ "GetConsoleFontSize", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleFontSize", .signature = "\x00\x02\x11\xc0\x00\x40\x71\x11\x80\x85\x09" } },
    .{ "GetCurrentConsoleFont", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentConsoleFont", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x59\x0f\x11\xc0\x00\x40\x8d" } },
    .{ "GetCurrentConsoleFontEx", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentConsoleFontEx", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x59\x0f\x11\xc0\x00\x40\x91" } },
    .{ "SetCurrentConsoleFontEx", MethodRecord{ .library = "KERNEL32", .import = "SetCurrentConsoleFontEx", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x59\x0f\x11\xc0\x00\x40\x91" } },
    .{ "GetConsoleSelectionInfo", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleSelectionInfo", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x40\x95" } },
    .{ "GetConsoleHistoryInfo", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleHistoryInfo", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x40\x99" } },
    .{ "SetConsoleHistoryInfo", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleHistoryInfo", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x40\x99" } },
    .{ "GetConsoleDisplayMode", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleDisplayMode", .signature = "\x00\x01\x11\x59\x0f\x09" } },
    .{ "SetConsoleDisplayMode", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleDisplayMode", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x0f\x11\xc0\x00\x40\x71" } },
    .{ "GetConsoleWindow", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleWindow", .signature = "\x00\x00\x11\x25" } },
    .{ "AddConsoleAliasA", MethodRecord{ .library = "KERNEL32", .import = "AddConsoleAliasA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "AddConsoleAliasW", MethodRecord{ .library = "KERNEL32", .import = "AddConsoleAliasW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x05" } },
    .{ "GetConsoleAliasA", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleAliasA", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x09\x11\x3d" } },
    .{ "GetConsoleAliasW", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleAliasW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x09\x11\x05" } },
    .{ "GetConsoleAliasesLengthA", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleAliasesLengthA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "GetConsoleAliasesLengthW", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleAliasesLengthW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "GetConsoleAliasExesLengthA", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleAliasExesLengthA", .signature = "\x00\x00\x09" } },
    .{ "GetConsoleAliasExesLengthW", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleAliasExesLengthW", .signature = "\x00\x00\x09" } },
    .{ "GetConsoleAliasesA", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleAliasesA", .signature = "\x00\x03\x09\x11\x3d\x09\x11\x3d" } },
    .{ "GetConsoleAliasesW", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleAliasesW", .signature = "\x00\x03\x09\x11\x05\x09\x11\x05" } },
    .{ "GetConsoleAliasExesA", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleAliasExesA", .signature = "\x00\x02\x09\x11\x3d\x09" } },
    .{ "GetConsoleAliasExesW", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleAliasExesW", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "ExpungeConsoleCommandHistoryA", MethodRecord{ .library = "KERNEL32", .import = "ExpungeConsoleCommandHistoryA", .signature = "\x00\x01\x01\x11\x3d" } },
    .{ "ExpungeConsoleCommandHistoryW", MethodRecord{ .library = "KERNEL32", .import = "ExpungeConsoleCommandHistoryW", .signature = "\x00\x01\x01\x11\x05" } },
    .{ "SetConsoleNumberOfCommandsA", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleNumberOfCommandsA", .signature = "\x00\x02\x11\x59\x09\x11\x3d" } },
    .{ "SetConsoleNumberOfCommandsW", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleNumberOfCommandsW", .signature = "\x00\x02\x11\x59\x09\x11\x05" } },
    .{ "GetConsoleCommandHistoryLengthA", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleCommandHistoryLengthA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "GetConsoleCommandHistoryLengthW", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleCommandHistoryLengthW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "GetConsoleCommandHistoryA", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleCommandHistoryA", .signature = "\x00\x03\x09\x11\x3d\x09\x11\x3d" } },
    .{ "GetConsoleCommandHistoryW", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleCommandHistoryW", .signature = "\x00\x03\x09\x11\x05\x09\x11\x05" } },
    .{ "GetConsoleProcessList", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleProcessList", .signature = "\x00\x02\x09\x0f\x09\x09" } },
    .{ "GetConsoleKeyboardLayoutNameA", MethodRecord{ .library = "user32", .import = "GetConsoleKeyboardLayoutNameA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "GetConsoleKeyboardLayoutNameW", MethodRecord{ .library = "user32", .import = "GetConsoleKeyboardLayoutNameW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "InvalidateConsoleDIBits", MethodRecord{ .library = "KERNEL32", .import = "InvalidateConsoleDIBits", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x85" } },
    .{ "SetLastConsoleEventActive", MethodRecord{ .library = "KERNEL32", .import = "SetLastConsoleEventActive", .signature = "\x00\x00\x01" } },
    .{ "VDMConsoleOperation", MethodRecord{ .library = "KERNEL32", .import = "VDMConsoleOperation", .signature = "\x00\x02\x11\x59\x09\x0f\x01" } },
    .{ "SetConsoleIcon", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleIcon", .signature = "\x00\x01\x11\x59\x11\x83\x55" } },
    .{ "SetConsoleFont", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleFont", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "GetConsoleFontInfo", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleFontInfo", .signature = "\x00\x04\x09\x11\x80\x85\x11\x59\x09\x0f\x11\xc0\x00\x40\x8d" } },
    .{ "GetNumberOfConsoleFonts", MethodRecord{ .library = "KERNEL32", .import = "GetNumberOfConsoleFonts", .signature = "\x00\x00\x09" } },
    .{ "SetConsoleCursor", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleCursor", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x9a\x2d" } },
    .{ "ShowConsoleCursor", MethodRecord{ .library = "KERNEL32", .import = "ShowConsoleCursor", .signature = "\x00\x02\x08\x11\x80\x85\x11\x59" } },
    .{ "ConsoleMenuControl", MethodRecord{ .library = "KERNEL32", .import = "ConsoleMenuControl", .signature = "\x00\x03\x11\x83\x91\x11\x80\x85\x09\x09" } },
    .{ "SetConsolePalette", MethodRecord{ .library = "KERNEL32", .import = "SetConsolePalette", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x8d\x65\x09" } },
    .{ "RegisterConsoleVDM", MethodRecord{ .library = "KERNEL32", .import = "RegisterConsoleVDM", .signature = "\x00\x09\x11\x59\x09\x11\x80\x85\x11\x80\x85\x11\x80\x85\x09\x0f\x09\x0f\x0f\x01\x11\xc0\x00\x40\x71\x0f\x0f\x01" } },
    .{ "GetConsoleHardwareState", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleHardwareState", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x71\x0f\x11\xc0\x00\x40\x71" } },
    .{ "SetConsoleHardwareState", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleHardwareState", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\xc0\x00\x40\x71\x11\xc0\x00\x40\x71" } },
    .{ "SetConsoleKeyShortcuts", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleKeyShortcuts", .signature = "\x00\x04\x11\x59\x11\x59\x05\x0f\x11\xc0\x00\x40\x9d\x09" } },
    .{ "SetConsoleMenuClose", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleMenuClose", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "GetConsoleInputExeNameA", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleInputExeNameA", .signature = "\x00\x02\x09\x09\x11\x3d" } },
    .{ "GetConsoleInputExeNameW", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleInputExeNameW", .signature = "\x00\x02\x09\x09\x11\x05" } },
    .{ "SetConsoleInputExeNameA", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleInputExeNameA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "SetConsoleInputExeNameW", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleInputExeNameW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "ReadConsoleInputExA", MethodRecord{ .library = "KERNEL32", .import = "ReadConsoleInputExA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x65\x09\x0f\x09\x07" } },
    .{ "ReadConsoleInputExW", MethodRecord{ .library = "KERNEL32", .import = "ReadConsoleInputExW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x65\x09\x0f\x09\x07" } },
    .{ "WriteConsoleInputVDMA", MethodRecord{ .library = "KERNEL32", .import = "WriteConsoleInputVDMA", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x65\x09\x0f\x09" } },
    .{ "WriteConsoleInputVDMW", MethodRecord{ .library = "KERNEL32", .import = "WriteConsoleInputVDMW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x40\x65\x09\x0f\x09" } },
    .{ "GetConsoleNlsMode", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleNlsMode", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x09" } },
    .{ "SetConsoleNlsMode", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleNlsMode", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "GetConsoleCharType", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleCharType", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\xc0\x00\x40\x71\x0f\x09" } },
    .{ "SetConsoleLocalEUDC", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleLocalEUDC", .signature = "\x00\x04\x11\x59\x11\x80\x85\x07\x11\xc0\x00\x40\x71\x11\x3d" } },
    .{ "SetConsoleCursorMode", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleCursorMode", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x59\x11\x59" } },
    .{ "GetConsoleCursorMode", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleCursorMode", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\x59\x0f\x11\x59" } },
    .{ "RegisterConsoleOS2", MethodRecord{ .library = "KERNEL32", .import = "RegisterConsoleOS2", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "SetConsoleOS2OemFormat", MethodRecord{ .library = "KERNEL32", .import = "SetConsoleOS2OemFormat", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "RegisterConsoleIME", MethodRecord{ .library = "KERNEL32", .import = "RegisterConsoleIME", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x09" } },
    .{ "UnregisterConsoleIME", MethodRecord{ .library = "KERNEL32", .import = "UnregisterConsoleIME", .signature = "\x00\x00\x11\x59" } },
    .{ "OpenConsoleW", MethodRecord{ .library = "KERNEL32", .import = "OpenConsoleW", .signature = "\x00\x04\x11\x80\x85\x11\x05\x09\x11\x59\x09" } },
    .{ "DuplicateConsoleHandle", MethodRecord{ .library = "KERNEL32", .import = "DuplicateConsoleHandle", .signature = "\x00\x04\x11\x80\x85\x11\x80\x85\x09\x11\x59\x09" } },
    .{ "CloseConsoleHandle", MethodRecord{ .library = "KERNEL32", .import = "CloseConsoleHandle", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "VerifyConsoleIoHandle", MethodRecord{ .library = "KERNEL32", .import = "VerifyConsoleIoHandle", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "GetConsoleInputWaitHandle", MethodRecord{ .library = "KERNEL32", .import = "GetConsoleInputWaitHandle", .signature = "\x00\x00\x11\x80\x85" } },
    .{ "ConsoleControl", MethodRecord{ .library = "USER32", .import = "ConsoleControl", .signature = "\x00\x03\x11\x84\x71\x11\xc0\x00\x40\xa1\x0f\x01\x09" } },
    .{ "GetStdHandle", MethodRecord{ .library = "KERNEL32", .import = "GetStdHandle", .signature = "\x00\x01\x11\x80\x85\x11\x83\x29" } },
    .{ "SetStdHandle", MethodRecord{ .library = "KERNEL32", .import = "SetStdHandle", .signature = "\x00\x02\x11\x59\x11\x83\x29\x11\x80\x85" } },
    .{ "SetStdHandleEx", MethodRecord{ .library = "KERNEL32", .import = "SetStdHandleEx", .signature = "\x00\x03\x11\x59\x11\x83\x29\x11\x80\x85\x0f\x11\x80\x85" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x31d => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "CONSOLE_MODE" },
        0x329 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "STD_HANDLE" },
        0x355 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HICON" },
        0x391 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HMENU" },
        0x471 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "NTSTATUS" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0xd5d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "CHAR" },
        0xd65 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HPALETTE" },
        0x1a2d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HCURSOR" },
        0x20a1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "CONSOLE_CHARACTER_ATTRIBUTES" },
        0x405d => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "ALLOC_CONSOLE_OPTIONS" },
        0x4061 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "ALLOC_CONSOLE_RESULT" },
        0x4065 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "INPUT_RECORD" },
        0x4069 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "CONSOLE_READCONSOLE_CONTROL" },
        0x406d => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "PHANDLER_ROUTINE" },
        0x4071 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "COORD" },
        0x4075 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "HPCON" },
        0x4079 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "CONSOLE_CURSOR_INFO" },
        0x407d => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "CONSOLE_SCREEN_BUFFER_INFO" },
        0x4081 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "CONSOLE_SCREEN_BUFFER_INFOEX" },
        0x4085 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "SMALL_RECT" },
        0x4089 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "CHAR_INFO" },
        0x408d => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "CONSOLE_FONT_INFO" },
        0x4091 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "CONSOLE_FONT_INFOEX" },
        0x4095 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "CONSOLE_SELECTION_INFO" },
        0x4099 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "CONSOLE_HISTORY_INFO" },
        0x409d => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "APPKEY" },
        0x40a1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Console", .name = "CONSOLECONTROL" },
        else => null,
    };
}

pub const ENABLE_PROCESSED_INPUT = 1;
pub const ENABLE_LINE_INPUT = 2;
pub const ENABLE_ECHO_INPUT = 4;
pub const ENABLE_WINDOW_INPUT = 8;
pub const ENABLE_MOUSE_INPUT = 16;
pub const ENABLE_INSERT_MODE = 32;
pub const ENABLE_QUICK_EDIT_MODE = 64;
pub const ENABLE_EXTENDED_FLAGS = 128;
pub const ENABLE_AUTO_POSITION = 256;
pub const ENABLE_VIRTUAL_TERMINAL_INPUT = 512;
pub const ENABLE_PROCESSED_OUTPUT = 1;
pub const ENABLE_WRAP_AT_EOL_OUTPUT = 2;
pub const ENABLE_VIRTUAL_TERMINAL_PROCESSING = 4;
pub const DISABLE_NEWLINE_AUTO_RETURN = 8;
pub const ENABLE_LVB_GRID_WORLDWIDE = 16;
pub const STD_INPUT_HANDLE = 4294967286;
pub const STD_OUTPUT_HANDLE = 4294967285;
pub const STD_ERROR_HANDLE = 4294967284;
pub const FOREGROUND_BLUE = 1;
pub const FOREGROUND_GREEN = 2;
pub const FOREGROUND_RED = 4;
pub const FOREGROUND_INTENSITY = 8;
pub const BACKGROUND_BLUE = 16;
pub const BACKGROUND_GREEN = 32;
pub const BACKGROUND_RED = 64;
pub const BACKGROUND_INTENSITY = 128;
pub const COMMON_LVB_LEADING_BYTE = 256;
pub const COMMON_LVB_TRAILING_BYTE = 512;
pub const COMMON_LVB_GRID_HORIZONTAL = 1024;
pub const COMMON_LVB_GRID_LVERTICAL = 2048;
pub const COMMON_LVB_GRID_RVERTICAL = 4096;
pub const COMMON_LVB_REVERSE_VIDEO = 16384;
pub const COMMON_LVB_UNDERSCORE = 32768;
pub const COMMON_LVB_SBCSDBCS = 768;
pub const CONSOLE_TEXTMODE_BUFFER = 1;
pub const CONSOLE_SELECTION_INVERTED = 16;
pub const VDM_HIDE_WINDOW = 1;
pub const VDM_IS_ICONIC = 2;
pub const VDM_CLIENT_RECT = 3;
pub const VDM_CLIENT_TO_SCREEN = 4;
pub const VDM_SCREEN_TO_CLIENT = 5;
pub const VDM_IS_HIDDEN = 6;
pub const VDM_FULLSCREEN_NOPAINT = 7;
pub const VDM_SET_VIDEO_MODE = 8;
pub const CONSOLE_UNREGISTER_VDM = 0;
pub const CONSOLE_REGISTER_VDM = 1;
pub const CONSOLE_REGISTER_WOW = 2;
pub const CONSOLE_NOSHORTCUTKEY = 0;
pub const CONSOLE_ALTTAB = 1;
pub const CONSOLE_ALTESC = 2;
pub const CONSOLE_ALTSPACE = 4;
pub const CONSOLE_ALTENTER = 8;
pub const CONSOLE_ALTPRTSC = 16;
pub const CONSOLE_PRTSC = 32;
pub const CONSOLE_CTRLESC = 64;
pub const CONSOLE_MODIFIER_SHIFT = 3;
pub const CONSOLE_MODIFIER_CONTROL = 4;
pub const CONSOLE_MODIFIER_ALT = 8;
pub const CHAR_TYPE_SBCS = 0;
pub const CHAR_TYPE_LEADING = 2;
pub const CHAR_TYPE_TRAILING = 3;
pub const CONSOLE_HANDLE_SIGNATURE = 3;
pub const CONSOLE_HANDLE_NEVERSET = 268435456;
pub const PID_CONSOLE_FORCEV2 = 1;
pub const PID_CONSOLE_WRAPTEXT = 2;
pub const PID_CONSOLE_FILTERONPASTE = 3;
pub const PID_CONSOLE_CTRLKEYSDISABLED = 4;
pub const PID_CONSOLE_LINESELECTION = 5;
pub const PID_CONSOLE_WINDOWTRANSPARENCY = 6;
pub const PID_CONSOLE_WINDOWMAXIMIZED = 7;
pub const PID_CONSOLE_CURSOR_TYPE = 8;
pub const PID_CONSOLE_CURSOR_COLOR = 9;
pub const PID_CONSOLE_INTERCEPT_COPY_PASTE = 10;
pub const PID_CONSOLE_DEFAULTFOREGROUND = 11;
pub const PID_CONSOLE_DEFAULTBACKGROUND = 12;
pub const PID_CONSOLE_TERMINALSCROLLING = 13;
pub const ATTACH_PARENT_PROCESS = 4294967295;
pub const CTRL_C_EVENT = 0;
pub const CTRL_BREAK_EVENT = 1;
pub const CTRL_CLOSE_EVENT = 2;
pub const CTRL_LOGOFF_EVENT = 5;
pub const CTRL_SHUTDOWN_EVENT = 6;
pub const PSEUDOCONSOLE_INHERIT_CURSOR = 1;
pub const CONSOLE_NO_SELECTION = 0;
pub const CONSOLE_SELECTION_IN_PROGRESS = 1;
pub const CONSOLE_SELECTION_NOT_EMPTY = 2;
pub const CONSOLE_MOUSE_SELECTION = 4;
pub const CONSOLE_MOUSE_DOWN = 8;
pub const HISTORY_NO_DUP_FLAG = 1;
pub const CONSOLE_FULLSCREEN = 1;
pub const CONSOLE_FULLSCREEN_HARDWARE = 2;
pub const CONSOLE_FULLSCREEN_MODE = 1;
pub const CONSOLE_WINDOWED_MODE = 2;
pub const RIGHT_ALT_PRESSED = 1;
pub const LEFT_ALT_PRESSED = 2;
pub const RIGHT_CTRL_PRESSED = 4;
pub const LEFT_CTRL_PRESSED = 8;
pub const SHIFT_PRESSED = 16;
pub const NUMLOCK_ON = 32;
pub const SCROLLLOCK_ON = 64;
pub const CAPSLOCK_ON = 128;
pub const ENHANCED_KEY = 256;
pub const NLS_DBCSCHAR = 65536;
pub const NLS_ALPHANUMERIC = 0;
pub const NLS_KATAKANA = 131072;
pub const NLS_HIRAGANA = 262144;
pub const NLS_ROMAN = 4194304;
pub const NLS_IME_CONVERSION = 8388608;
pub const ALTNUMPAD_BIT = 67108864;
pub const NLS_IME_DISABLE = 536870912;
pub const FROM_LEFT_1ST_BUTTON_PRESSED = 1;
pub const RIGHTMOST_BUTTON_PRESSED = 2;
pub const FROM_LEFT_2ND_BUTTON_PRESSED = 4;
pub const FROM_LEFT_3RD_BUTTON_PRESSED = 8;
pub const FROM_LEFT_4TH_BUTTON_PRESSED = 16;
pub const MOUSE_MOVED = 1;
pub const DOUBLE_CLICK = 2;
pub const MOUSE_WHEELED = 4;
pub const MOUSE_HWHEELED = 8;
pub const KEY_EVENT = 1;
pub const MOUSE_EVENT = 2;
pub const WINDOW_BUFFER_SIZE_EVENT = 4;
pub const MENU_EVENT = 8;
pub const FOCUS_EVENT = 16;
pub const ALLOC_CONSOLE_MODE_DEFAULT = 0;
pub const ALLOC_CONSOLE_MODE_NEW_WINDOW = 1;
pub const ALLOC_CONSOLE_MODE_NO_WINDOW = 2;
pub const ALLOC_CONSOLE_RESULT_NO_CONSOLE = 0;
pub const ALLOC_CONSOLE_RESULT_NEW_CONSOLE = 1;
pub const ALLOC_CONSOLE_RESULT_EXISTING_CONSOLE = 2;
pub const Reserved1 = 0;
pub const ConsoleNotifyConsoleApplication = 1;
pub const Reserved2 = 2;
pub const ConsoleSetCaretInfo = 3;
pub const Reserved3 = 4;
pub const ConsoleSetForeground = 5;
pub const ConsoleSetWindowOwner = 6;
pub const ConsoleEndTask = 7;

pub const aliases = struct {
    pub const CONSOLE_MODE = u32;
    pub const STD_HANDLE = u32;
    pub const CONSOLE_CHARACTER_ATTRIBUTES = u16;
    pub const ALLOC_CONSOLE_MODE = i32;
    pub const ALLOC_CONSOLE_RESULT = i32;
    pub const CONSOLECONTROL = i32;
};
