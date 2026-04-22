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
    .{ "CommonPropertySheetUIA", MethodRecord{ .library = "COMPSTUI", .import = "CommonPropertySheetUIA", .signature = "\x00\x04\x08\x11\x25\x12\xaf\x51\x11\x82\x2d\x0f\x09" } },
    .{ "CommonPropertySheetUIW", MethodRecord{ .library = "COMPSTUI", .import = "CommonPropertySheetUIW", .signature = "\x00\x04\x08\x11\x25\x12\xaf\x51\x11\x82\x2d\x0f\x09" } },
    .{ "GetCPSUIUserData", MethodRecord{ .library = "COMPSTUI", .import = "GetCPSUIUserData", .signature = "\x00\x01\x19\x11\x25" } },
    .{ "SetCPSUIUserData", MethodRecord{ .library = "COMPSTUI", .import = "SetCPSUIUserData", .signature = "\x00\x02\x11\x59\x11\x25\x19" } },
    .{ "EnumPrintersA", MethodRecord{ .library = "winspool.drv", .import = "EnumPrintersA", .signature = "\x00\x07\x11\x59\x09\x11\x3d\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "EnumPrintersW", MethodRecord{ .library = "winspool.drv", .import = "EnumPrintersW", .signature = "\x00\x07\x11\x59\x09\x11\x05\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "GetSpoolFileHandle", MethodRecord{ .library = "winspool.drv", .import = "GetSpoolFileHandle", .signature = "\x00\x01\x11\x80\x85\x11\xaf\x55" } },
    .{ "CommitSpoolData", MethodRecord{ .library = "winspool.drv", .import = "CommitSpoolData", .signature = "\x00\x03\x11\x80\x85\x11\xaf\x55\x11\x80\x85\x09" } },
    .{ "CloseSpoolFileHandle", MethodRecord{ .library = "winspool.drv", .import = "CloseSpoolFileHandle", .signature = "\x00\x02\x11\x59\x11\xaf\x55\x11\x80\x85" } },
    .{ "OpenPrinterA", MethodRecord{ .library = "winspool.drv", .import = "OpenPrinterA", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x11\xaf\x55\x0f\x11\xaf\x59" } },
    .{ "OpenPrinterW", MethodRecord{ .library = "winspool.drv", .import = "OpenPrinterW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x11\xaf\x55\x0f\x11\xaf\x5d" } },
    .{ "ResetPrinterA", MethodRecord{ .library = "winspool.drv", .import = "ResetPrinterA", .signature = "\x00\x02\x11\x59\x11\xaf\x55\x0f\x11\xaf\x59" } },
    .{ "ResetPrinterW", MethodRecord{ .library = "winspool.drv", .import = "ResetPrinterW", .signature = "\x00\x02\x11\x59\x11\xaf\x55\x0f\x11\xaf\x5d" } },
    .{ "SetJobA", MethodRecord{ .library = "winspool.drv", .import = "SetJobA", .signature = "\x00\x05\x11\x59\x11\xaf\x55\x09\x09\x0f\x05\x09" } },
    .{ "SetJobW", MethodRecord{ .library = "winspool.drv", .import = "SetJobW", .signature = "\x00\x05\x11\x59\x11\xaf\x55\x09\x09\x0f\x05\x09" } },
    .{ "GetJobA", MethodRecord{ .library = "winspool.drv", .import = "GetJobA", .signature = "\x00\x06\x11\x59\x11\xaf\x55\x09\x09\x0f\x05\x09\x0f\x09" } },
    .{ "GetJobW", MethodRecord{ .library = "winspool.drv", .import = "GetJobW", .signature = "\x00\x06\x11\x59\x11\xaf\x55\x09\x09\x0f\x05\x09\x0f\x09" } },
    .{ "EnumJobsA", MethodRecord{ .library = "winspool.drv", .import = "EnumJobsA", .signature = "\x00\x08\x11\x59\x11\xaf\x55\x09\x09\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "EnumJobsW", MethodRecord{ .library = "winspool.drv", .import = "EnumJobsW", .signature = "\x00\x08\x11\x59\x11\xaf\x55\x09\x09\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "AddPrinterA", MethodRecord{ .library = "winspool.drv", .import = "AddPrinterA", .signature = "\x00\x03\x11\xaf\x55\x11\x3d\x09\x0f\x05" } },
    .{ "AddPrinterW", MethodRecord{ .library = "winspool.drv", .import = "AddPrinterW", .signature = "\x00\x03\x11\xaf\x55\x11\x05\x09\x0f\x05" } },
    .{ "DeletePrinter", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinter", .signature = "\x00\x01\x11\x59\x11\xaf\x55" } },
    .{ "SetPrinterA", MethodRecord{ .library = "winspool.drv", .import = "SetPrinterA", .signature = "\x00\x04\x11\x59\x11\xaf\x55\x09\x0f\x05\x09" } },
    .{ "SetPrinterW", MethodRecord{ .library = "winspool.drv", .import = "SetPrinterW", .signature = "\x00\x04\x11\x59\x11\xaf\x55\x09\x0f\x05\x09" } },
    .{ "GetPrinterA", MethodRecord{ .library = "winspool.drv", .import = "GetPrinterA", .signature = "\x00\x05\x11\x59\x11\xaf\x55\x09\x0f\x05\x09\x0f\x09" } },
    .{ "GetPrinterW", MethodRecord{ .library = "winspool.drv", .import = "GetPrinterW", .signature = "\x00\x05\x11\x59\x11\xaf\x55\x09\x0f\x05\x09\x0f\x09" } },
    .{ "AddPrinterDriverA", MethodRecord{ .library = "winspool.drv", .import = "AddPrinterDriverA", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x0f\x05" } },
    .{ "AddPrinterDriverW", MethodRecord{ .library = "winspool.drv", .import = "AddPrinterDriverW", .signature = "\x00\x03\x11\x59\x11\x05\x09\x0f\x05" } },
    .{ "AddPrinterDriverExA", MethodRecord{ .library = "winspool.drv", .import = "AddPrinterDriverExA", .signature = "\x00\x04\x11\x59\x11\x3d\x09\x0f\x05\x09" } },
    .{ "AddPrinterDriverExW", MethodRecord{ .library = "winspool.drv", .import = "AddPrinterDriverExW", .signature = "\x00\x04\x11\x59\x11\x05\x09\x0f\x05\x09" } },
    .{ "EnumPrinterDriversA", MethodRecord{ .library = "winspool.drv", .import = "EnumPrinterDriversA", .signature = "\x00\x07\x11\x59\x11\x3d\x11\x3d\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "EnumPrinterDriversW", MethodRecord{ .library = "winspool.drv", .import = "EnumPrinterDriversW", .signature = "\x00\x07\x11\x59\x11\x05\x11\x05\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "GetPrinterDriverA", MethodRecord{ .library = "winspool.drv", .import = "GetPrinterDriverA", .signature = "\x00\x06\x11\x59\x11\xaf\x55\x11\x3d\x09\x0f\x05\x09\x0f\x09" } },
    .{ "GetPrinterDriverW", MethodRecord{ .library = "winspool.drv", .import = "GetPrinterDriverW", .signature = "\x00\x06\x11\x59\x11\xaf\x55\x11\x05\x09\x0f\x05\x09\x0f\x09" } },
    .{ "GetPrinterDriverDirectoryA", MethodRecord{ .library = "winspool.drv", .import = "GetPrinterDriverDirectoryA", .signature = "\x00\x06\x11\x59\x11\x3d\x11\x3d\x09\x0f\x05\x09\x0f\x09" } },
    .{ "GetPrinterDriverDirectoryW", MethodRecord{ .library = "winspool.drv", .import = "GetPrinterDriverDirectoryW", .signature = "\x00\x06\x11\x59\x11\x05\x11\x05\x09\x0f\x05\x09\x0f\x09" } },
    .{ "DeletePrinterDriverA", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterDriverA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "DeletePrinterDriverW", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterDriverW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x05" } },
    .{ "DeletePrinterDriverExA", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterDriverExA", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x11\x3d\x09\x09" } },
    .{ "DeletePrinterDriverExW", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterDriverExW", .signature = "\x00\x05\x11\x59\x11\x05\x11\x05\x11\x05\x09\x09" } },
    .{ "AddPrintProcessorA", MethodRecord{ .library = "winspool.drv", .import = "AddPrintProcessorA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "AddPrintProcessorW", MethodRecord{ .library = "winspool.drv", .import = "AddPrintProcessorW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "EnumPrintProcessorsA", MethodRecord{ .library = "winspool.drv", .import = "EnumPrintProcessorsA", .signature = "\x00\x07\x11\x59\x11\x3d\x11\x3d\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "EnumPrintProcessorsW", MethodRecord{ .library = "winspool.drv", .import = "EnumPrintProcessorsW", .signature = "\x00\x07\x11\x59\x11\x05\x11\x05\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "GetPrintProcessorDirectoryA", MethodRecord{ .library = "winspool.drv", .import = "GetPrintProcessorDirectoryA", .signature = "\x00\x06\x11\x59\x11\x3d\x11\x3d\x09\x0f\x05\x09\x0f\x09" } },
    .{ "GetPrintProcessorDirectoryW", MethodRecord{ .library = "winspool.drv", .import = "GetPrintProcessorDirectoryW", .signature = "\x00\x06\x11\x59\x11\x05\x11\x05\x09\x0f\x05\x09\x0f\x09" } },
    .{ "EnumPrintProcessorDatatypesA", MethodRecord{ .library = "winspool.drv", .import = "EnumPrintProcessorDatatypesA", .signature = "\x00\x07\x11\x59\x11\x3d\x11\x3d\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "EnumPrintProcessorDatatypesW", MethodRecord{ .library = "winspool.drv", .import = "EnumPrintProcessorDatatypesW", .signature = "\x00\x07\x11\x59\x11\x05\x11\x05\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "DeletePrintProcessorA", MethodRecord{ .library = "winspool.drv", .import = "DeletePrintProcessorA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "DeletePrintProcessorW", MethodRecord{ .library = "winspool.drv", .import = "DeletePrintProcessorW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x05" } },
    .{ "StartDocPrinterA", MethodRecord{ .library = "winspool.drv", .import = "StartDocPrinterA", .signature = "\x00\x03\x09\x11\xaf\x55\x09\x0f\x11\xaf\x61" } },
    .{ "StartDocPrinterW", MethodRecord{ .library = "winspool.drv", .import = "StartDocPrinterW", .signature = "\x00\x03\x09\x11\xaf\x55\x09\x0f\x11\xaf\x65" } },
    .{ "StartPagePrinter", MethodRecord{ .library = "winspool.drv", .import = "StartPagePrinter", .signature = "\x00\x01\x11\x59\x11\xaf\x55" } },
    .{ "WritePrinter", MethodRecord{ .library = "winspool.drv", .import = "WritePrinter", .signature = "\x00\x04\x11\x59\x11\xaf\x55\x0f\x01\x09\x0f\x09" } },
    .{ "FlushPrinter", MethodRecord{ .library = "winspool.drv", .import = "FlushPrinter", .signature = "\x00\x05\x11\x59\x11\xaf\x55\x0f\x01\x09\x0f\x09\x09" } },
    .{ "EndPagePrinter", MethodRecord{ .library = "winspool.drv", .import = "EndPagePrinter", .signature = "\x00\x01\x11\x59\x11\xaf\x55" } },
    .{ "AbortPrinter", MethodRecord{ .library = "winspool.drv", .import = "AbortPrinter", .signature = "\x00\x01\x11\x59\x11\xaf\x55" } },
    .{ "ReadPrinter", MethodRecord{ .library = "winspool.drv", .import = "ReadPrinter", .signature = "\x00\x04\x11\x59\x11\xaf\x55\x0f\x01\x09\x0f\x09" } },
    .{ "EndDocPrinter", MethodRecord{ .library = "winspool.drv", .import = "EndDocPrinter", .signature = "\x00\x01\x11\x59\x11\xaf\x55" } },
    .{ "AddJobA", MethodRecord{ .library = "winspool.drv", .import = "AddJobA", .signature = "\x00\x05\x11\x59\x11\xaf\x55\x09\x0f\x05\x09\x0f\x09" } },
    .{ "AddJobW", MethodRecord{ .library = "winspool.drv", .import = "AddJobW", .signature = "\x00\x05\x11\x59\x11\xaf\x55\x09\x0f\x05\x09\x0f\x09" } },
    .{ "ScheduleJob", MethodRecord{ .library = "winspool.drv", .import = "ScheduleJob", .signature = "\x00\x02\x11\x59\x11\xaf\x55\x09" } },
    .{ "PrinterProperties", MethodRecord{ .library = "winspool.drv", .import = "PrinterProperties", .signature = "\x00\x02\x11\x59\x11\x25\x11\xaf\x55" } },
    .{ "DocumentPropertiesA", MethodRecord{ .library = "winspool.drv", .import = "DocumentPropertiesA", .signature = "\x00\x06\x08\x11\x25\x11\xaf\x55\x11\x3d\x0f\x11\x8d\x81\x0f\x11\x8d\x81\x09" } },
    .{ "DocumentPropertiesW", MethodRecord{ .library = "winspool.drv", .import = "DocumentPropertiesW", .signature = "\x00\x06\x08\x11\x25\x11\xaf\x55\x11\x05\x0f\x11\x8d\x85\x0f\x11\x8d\x85\x09" } },
    .{ "AdvancedDocumentPropertiesA", MethodRecord{ .library = "winspool.drv", .import = "AdvancedDocumentPropertiesA", .signature = "\x00\x05\x08\x11\x25\x11\xaf\x55\x11\x3d\x0f\x11\x8d\x81\x0f\x11\x8d\x81" } },
    .{ "AdvancedDocumentPropertiesW", MethodRecord{ .library = "winspool.drv", .import = "AdvancedDocumentPropertiesW", .signature = "\x00\x05\x08\x11\x25\x11\xaf\x55\x11\x05\x0f\x11\x8d\x85\x0f\x11\x8d\x85" } },
    .{ "ExtDeviceMode", MethodRecord{ .library = "winspool.drv", .import = "ExtDeviceMode", .signature = "\x00\x08\x08\x11\x25\x11\x80\x85\x0f\x11\x8d\x81\x11\x3d\x11\x3d\x0f\x11\x8d\x81\x11\x3d\x09" } },
    .{ "GetPrinterDataA", MethodRecord{ .library = "winspool.drv", .import = "GetPrinterDataA", .signature = "\x00\x06\x09\x11\xaf\x55\x11\x3d\x0f\x09\x0f\x05\x09\x0f\x09" } },
    .{ "GetPrinterDataW", MethodRecord{ .library = "winspool.drv", .import = "GetPrinterDataW", .signature = "\x00\x06\x09\x11\xaf\x55\x11\x05\x0f\x09\x0f\x05\x09\x0f\x09" } },
    .{ "GetPrinterDataExA", MethodRecord{ .library = "winspool.drv", .import = "GetPrinterDataExA", .signature = "\x00\x07\x09\x11\xaf\x55\x11\x3d\x11\x3d\x0f\x09\x0f\x05\x09\x0f\x09" } },
    .{ "GetPrinterDataExW", MethodRecord{ .library = "winspool.drv", .import = "GetPrinterDataExW", .signature = "\x00\x07\x09\x11\xaf\x55\x11\x05\x11\x05\x0f\x09\x0f\x05\x09\x0f\x09" } },
    .{ "EnumPrinterDataA", MethodRecord{ .library = "winspool.drv", .import = "EnumPrinterDataA", .signature = "\x00\x09\x09\x11\xaf\x55\x09\x11\x3d\x09\x0f\x09\x0f\x09\x0f\x05\x09\x0f\x09" } },
    .{ "EnumPrinterDataW", MethodRecord{ .library = "winspool.drv", .import = "EnumPrinterDataW", .signature = "\x00\x09\x09\x11\xaf\x55\x09\x11\x05\x09\x0f\x09\x0f\x09\x0f\x05\x09\x0f\x09" } },
    .{ "EnumPrinterDataExA", MethodRecord{ .library = "winspool.drv", .import = "EnumPrinterDataExA", .signature = "\x00\x06\x09\x11\xaf\x55\x11\x3d\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "EnumPrinterDataExW", MethodRecord{ .library = "winspool.drv", .import = "EnumPrinterDataExW", .signature = "\x00\x06\x09\x11\xaf\x55\x11\x05\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "EnumPrinterKeyA", MethodRecord{ .library = "winspool.drv", .import = "EnumPrinterKeyA", .signature = "\x00\x05\x09\x11\xaf\x55\x11\x3d\x11\x3d\x09\x0f\x09" } },
    .{ "EnumPrinterKeyW", MethodRecord{ .library = "winspool.drv", .import = "EnumPrinterKeyW", .signature = "\x00\x05\x09\x11\xaf\x55\x11\x05\x11\x05\x09\x0f\x09" } },
    .{ "SetPrinterDataA", MethodRecord{ .library = "winspool.drv", .import = "SetPrinterDataA", .signature = "\x00\x05\x09\x11\xaf\x55\x11\x3d\x09\x0f\x05\x09" } },
    .{ "SetPrinterDataW", MethodRecord{ .library = "winspool.drv", .import = "SetPrinterDataW", .signature = "\x00\x05\x09\x11\xaf\x55\x11\x05\x09\x0f\x05\x09" } },
    .{ "SetPrinterDataExA", MethodRecord{ .library = "winspool.drv", .import = "SetPrinterDataExA", .signature = "\x00\x06\x09\x11\xaf\x55\x11\x3d\x11\x3d\x09\x0f\x05\x09" } },
    .{ "SetPrinterDataExW", MethodRecord{ .library = "winspool.drv", .import = "SetPrinterDataExW", .signature = "\x00\x06\x09\x11\xaf\x55\x11\x05\x11\x05\x09\x0f\x05\x09" } },
    .{ "DeletePrinterDataA", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterDataA", .signature = "\x00\x02\x09\x11\xaf\x55\x11\x3d" } },
    .{ "DeletePrinterDataW", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterDataW", .signature = "\x00\x02\x09\x11\xaf\x55\x11\x05" } },
    .{ "DeletePrinterDataExA", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterDataExA", .signature = "\x00\x03\x09\x11\xaf\x55\x11\x3d\x11\x3d" } },
    .{ "DeletePrinterDataExW", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterDataExW", .signature = "\x00\x03\x09\x11\xaf\x55\x11\x05\x11\x05" } },
    .{ "DeletePrinterKeyA", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterKeyA", .signature = "\x00\x02\x09\x11\xaf\x55\x11\x3d" } },
    .{ "DeletePrinterKeyW", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterKeyW", .signature = "\x00\x02\x09\x11\xaf\x55\x11\x05" } },
    .{ "WaitForPrinterChange", MethodRecord{ .library = "winspool.drv", .import = "WaitForPrinterChange", .signature = "\x00\x02\x09\x11\xaf\x55\x09" } },
    .{ "FindFirstPrinterChangeNotification", MethodRecord{ .library = "winspool.drv", .import = "FindFirstPrinterChangeNotification", .signature = "\x00\x04\x11\xaf\x69\x11\xaf\x55\x09\x09\x0f\x01" } },
    .{ "FindNextPrinterChangeNotification", MethodRecord{ .library = "winspool.drv", .import = "FindNextPrinterChangeNotification", .signature = "\x00\x04\x11\x59\x11\xaf\x69\x0f\x09\x0f\x01\x0f\x0f\x01" } },
    .{ "FreePrinterNotifyInfo", MethodRecord{ .library = "winspool.drv", .import = "FreePrinterNotifyInfo", .signature = "\x00\x01\x11\x59\x0f\x11\xaf\x6d" } },
    .{ "FindClosePrinterChangeNotification", MethodRecord{ .library = "winspool.drv", .import = "FindClosePrinterChangeNotification", .signature = "\x00\x01\x11\x59\x11\xaf\x69" } },
    .{ "PrinterMessageBoxA", MethodRecord{ .library = "winspool.drv", .import = "PrinterMessageBoxA", .signature = "\x00\x06\x09\x11\xaf\x55\x09\x11\x25\x11\x3d\x11\x3d\x09" } },
    .{ "PrinterMessageBoxW", MethodRecord{ .library = "winspool.drv", .import = "PrinterMessageBoxW", .signature = "\x00\x06\x09\x11\xaf\x55\x09\x11\x25\x11\x05\x11\x05\x09" } },
    .{ "ClosePrinter", MethodRecord{ .library = "winspool.drv", .import = "ClosePrinter", .signature = "\x00\x01\x11\x59\x11\xaf\x55" } },
    .{ "AddFormA", MethodRecord{ .library = "winspool.drv", .import = "AddFormA", .signature = "\x00\x03\x11\x59\x11\xaf\x55\x09\x0f\x05" } },
    .{ "AddFormW", MethodRecord{ .library = "winspool.drv", .import = "AddFormW", .signature = "\x00\x03\x11\x59\x11\xaf\x55\x09\x0f\x05" } },
    .{ "DeleteFormA", MethodRecord{ .library = "winspool.drv", .import = "DeleteFormA", .signature = "\x00\x02\x11\x59\x11\xaf\x55\x11\x3d" } },
    .{ "DeleteFormW", MethodRecord{ .library = "winspool.drv", .import = "DeleteFormW", .signature = "\x00\x02\x11\x59\x11\xaf\x55\x11\x05" } },
    .{ "GetFormA", MethodRecord{ .library = "winspool.drv", .import = "GetFormA", .signature = "\x00\x06\x11\x59\x11\xaf\x55\x11\x3d\x09\x0f\x05\x09\x0f\x09" } },
    .{ "GetFormW", MethodRecord{ .library = "winspool.drv", .import = "GetFormW", .signature = "\x00\x06\x11\x59\x11\xaf\x55\x11\x05\x09\x0f\x05\x09\x0f\x09" } },
    .{ "SetFormA", MethodRecord{ .library = "winspool.drv", .import = "SetFormA", .signature = "\x00\x04\x11\x59\x11\xaf\x55\x11\x3d\x09\x0f\x05" } },
    .{ "SetFormW", MethodRecord{ .library = "winspool.drv", .import = "SetFormW", .signature = "\x00\x04\x11\x59\x11\xaf\x55\x11\x05\x09\x0f\x05" } },
    .{ "EnumFormsA", MethodRecord{ .library = "winspool.drv", .import = "EnumFormsA", .signature = "\x00\x06\x11\x59\x11\xaf\x55\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "EnumFormsW", MethodRecord{ .library = "winspool.drv", .import = "EnumFormsW", .signature = "\x00\x06\x11\x59\x11\xaf\x55\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "EnumMonitorsA", MethodRecord{ .library = "winspool.drv", .import = "EnumMonitorsA", .signature = "\x00\x06\x11\x59\x11\x3d\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "EnumMonitorsW", MethodRecord{ .library = "winspool.drv", .import = "EnumMonitorsW", .signature = "\x00\x06\x11\x59\x11\x05\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "AddMonitorA", MethodRecord{ .library = "winspool.drv", .import = "AddMonitorA", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x0f\x05" } },
    .{ "AddMonitorW", MethodRecord{ .library = "winspool.drv", .import = "AddMonitorW", .signature = "\x00\x03\x11\x59\x11\x05\x09\x0f\x05" } },
    .{ "DeleteMonitorA", MethodRecord{ .library = "winspool.drv", .import = "DeleteMonitorA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "DeleteMonitorW", MethodRecord{ .library = "winspool.drv", .import = "DeleteMonitorW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x05" } },
    .{ "EnumPortsA", MethodRecord{ .library = "winspool.drv", .import = "EnumPortsA", .signature = "\x00\x06\x11\x59\x11\x3d\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "EnumPortsW", MethodRecord{ .library = "winspool.drv", .import = "EnumPortsW", .signature = "\x00\x06\x11\x59\x11\x05\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "AddPortA", MethodRecord{ .library = "winspool.drv", .import = "AddPortA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x25\x11\x3d" } },
    .{ "AddPortW", MethodRecord{ .library = "winspool.drv", .import = "AddPortW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x25\x11\x05" } },
    .{ "ConfigurePortA", MethodRecord{ .library = "winspool.drv", .import = "ConfigurePortA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x25\x11\x3d" } },
    .{ "ConfigurePortW", MethodRecord{ .library = "winspool.drv", .import = "ConfigurePortW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x25\x11\x05" } },
    .{ "DeletePortA", MethodRecord{ .library = "winspool.drv", .import = "DeletePortA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x25\x11\x3d" } },
    .{ "DeletePortW", MethodRecord{ .library = "winspool.drv", .import = "DeletePortW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x25\x11\x05" } },
    .{ "XcvDataW", MethodRecord{ .library = "winspool.drv", .import = "XcvDataW", .signature = "\x00\x08\x11\x59\x11\x80\x85\x11\x05\x0f\x05\x09\x0f\x05\x09\x0f\x09\x0f\x09" } },
    .{ "GetDefaultPrinterA", MethodRecord{ .library = "winspool.drv", .import = "GetDefaultPrinterA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x09" } },
    .{ "GetDefaultPrinterW", MethodRecord{ .library = "winspool.drv", .import = "GetDefaultPrinterW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x09" } },
    .{ "SetDefaultPrinterA", MethodRecord{ .library = "winspool.drv", .import = "SetDefaultPrinterA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "SetDefaultPrinterW", MethodRecord{ .library = "winspool.drv", .import = "SetDefaultPrinterW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "SetPortA", MethodRecord{ .library = "winspool.drv", .import = "SetPortA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x09\x0f\x05" } },
    .{ "SetPortW", MethodRecord{ .library = "winspool.drv", .import = "SetPortW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x09\x0f\x05" } },
    .{ "AddPrinterConnectionA", MethodRecord{ .library = "winspool.drv", .import = "AddPrinterConnectionA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "AddPrinterConnectionW", MethodRecord{ .library = "winspool.drv", .import = "AddPrinterConnectionW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "DeletePrinterConnectionA", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterConnectionA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "DeletePrinterConnectionW", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterConnectionW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "ConnectToPrinterDlg", MethodRecord{ .library = "winspool.drv", .import = "ConnectToPrinterDlg", .signature = "\x00\x02\x11\x80\x85\x11\x25\x09" } },
    .{ "AddPrintProvidorA", MethodRecord{ .library = "winspool.drv", .import = "AddPrintProvidorA", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x0f\x05" } },
    .{ "AddPrintProvidorW", MethodRecord{ .library = "winspool.drv", .import = "AddPrintProvidorW", .signature = "\x00\x03\x11\x59\x11\x05\x09\x0f\x05" } },
    .{ "DeletePrintProvidorA", MethodRecord{ .library = "winspool.drv", .import = "DeletePrintProvidorA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "DeletePrintProvidorW", MethodRecord{ .library = "winspool.drv", .import = "DeletePrintProvidorW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x05" } },
    .{ "IsValidDevmodeA", MethodRecord{ .library = "winspool.drv", .import = "IsValidDevmodeA", .signature = "\x00\x02\x11\x59\x0f\x11\x8d\x81\x19" } },
    .{ "IsValidDevmodeW", MethodRecord{ .library = "winspool.drv", .import = "IsValidDevmodeW", .signature = "\x00\x02\x11\x59\x0f\x11\x8d\x85\x19" } },
    .{ "OpenPrinter2A", MethodRecord{ .library = "winspool.drv", .import = "OpenPrinter2A", .signature = "\x00\x04\x11\x59\x11\x3d\x0f\x11\xaf\x55\x0f\x11\xaf\x59\x0f\x11\xaf\x71" } },
    .{ "OpenPrinter2W", MethodRecord{ .library = "winspool.drv", .import = "OpenPrinter2W", .signature = "\x00\x04\x11\x59\x11\x05\x0f\x11\xaf\x55\x0f\x11\xaf\x5d\x0f\x11\xaf\x75" } },
    .{ "AddPrinterConnection2A", MethodRecord{ .library = "winspool.drv", .import = "AddPrinterConnection2A", .signature = "\x00\x04\x11\x59\x11\x25\x11\x3d\x09\x0f\x01" } },
    .{ "AddPrinterConnection2W", MethodRecord{ .library = "winspool.drv", .import = "AddPrinterConnection2W", .signature = "\x00\x04\x11\x59\x11\x25\x11\x05\x09\x0f\x01" } },
    .{ "InstallPrinterDriverFromPackageA", MethodRecord{ .library = "winspool.drv", .import = "InstallPrinterDriverFromPackageA", .signature = "\x00\x05\x11\x79\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "InstallPrinterDriverFromPackageW", MethodRecord{ .library = "winspool.drv", .import = "InstallPrinterDriverFromPackageW", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "UploadPrinterDriverPackageA", MethodRecord{ .library = "winspool.drv", .import = "UploadPrinterDriverPackageA", .signature = "\x00\x07\x11\x79\x11\x3d\x11\x3d\x11\x3d\x09\x11\x25\x11\x3d\x0f\x09" } },
    .{ "UploadPrinterDriverPackageW", MethodRecord{ .library = "winspool.drv", .import = "UploadPrinterDriverPackageW", .signature = "\x00\x07\x11\x79\x11\x05\x11\x05\x11\x05\x09\x11\x25\x11\x05\x0f\x09" } },
    .{ "GetCorePrinterDriversA", MethodRecord{ .library = "winspool.drv", .import = "GetCorePrinterDriversA", .signature = "\x00\x05\x11\x79\x11\x3d\x11\x3d\x11\x3d\x09\x0f\x11\xaf\x79" } },
    .{ "GetCorePrinterDriversW", MethodRecord{ .library = "winspool.drv", .import = "GetCorePrinterDriversW", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x11\x05\x09\x0f\x11\xaf\x7d" } },
    .{ "CorePrinterDriverInstalledA", MethodRecord{ .library = "winspool.drv", .import = "CorePrinterDriverInstalledA", .signature = "\x00\x06\x11\x79\x11\x3d\x11\x3d\x11\x0d\x11\x80\x9d\x0b\x0f\x11\x59" } },
    .{ "CorePrinterDriverInstalledW", MethodRecord{ .library = "winspool.drv", .import = "CorePrinterDriverInstalledW", .signature = "\x00\x06\x11\x79\x11\x05\x11\x05\x11\x0d\x11\x80\x9d\x0b\x0f\x11\x59" } },
    .{ "GetPrinterDriverPackagePathA", MethodRecord{ .library = "winspool.drv", .import = "GetPrinterDriverPackagePathA", .signature = "\x00\x07\x11\x79\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x09\x0f\x09" } },
    .{ "GetPrinterDriverPackagePathW", MethodRecord{ .library = "winspool.drv", .import = "GetPrinterDriverPackagePathW", .signature = "\x00\x07\x11\x79\x11\x05\x11\x05\x11\x05\x11\x05\x11\x05\x09\x0f\x09" } },
    .{ "DeletePrinterDriverPackageA", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterDriverPackageA", .signature = "\x00\x03\x11\x79\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "DeletePrinterDriverPackageW", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterDriverPackageW", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x11\x05" } },
    .{ "ReportJobProcessingProgress", MethodRecord{ .library = "winspool.drv", .import = "ReportJobProcessingProgress", .signature = "\x00\x04\x11\x79\x11\x80\x85\x09\x11\xaf\x81\x11\xaf\x85" } },
    .{ "GetPrinterDriver2A", MethodRecord{ .library = "winspool.drv", .import = "GetPrinterDriver2A", .signature = "\x00\x07\x11\x59\x11\x25\x11\xaf\x55\x11\x3d\x09\x0f\x05\x09\x0f\x09" } },
    .{ "GetPrinterDriver2W", MethodRecord{ .library = "winspool.drv", .import = "GetPrinterDriver2W", .signature = "\x00\x07\x11\x59\x11\x25\x11\xaf\x55\x11\x05\x09\x0f\x05\x09\x0f\x09" } },
    .{ "GetPrintExecutionData", MethodRecord{ .library = "winspool.drv", .import = "GetPrintExecutionData", .signature = "\x00\x01\x11\x59\x0f\x11\xaf\x89" } },
    .{ "GetJobNamedPropertyValue", MethodRecord{ .library = "winspool.drv", .import = "GetJobNamedPropertyValue", .signature = "\x00\x04\x09\x11\xaf\x55\x09\x11\x05\x0f\x11\xaf\x8d" } },
    .{ "FreePrintPropertyValue", MethodRecord{ .library = "winspool.drv", .import = "FreePrintPropertyValue", .signature = "\x00\x01\x01\x0f\x11\xaf\x8d" } },
    .{ "FreePrintNamedPropertyArray", MethodRecord{ .library = "winspool.drv", .import = "FreePrintNamedPropertyArray", .signature = "\x00\x02\x01\x09\x0f\x0f\x11\xaf\x91" } },
    .{ "SetJobNamedProperty", MethodRecord{ .library = "winspool.drv", .import = "SetJobNamedProperty", .signature = "\x00\x03\x09\x11\xaf\x55\x09\x0f\x11\xaf\x91" } },
    .{ "DeleteJobNamedProperty", MethodRecord{ .library = "winspool.drv", .import = "DeleteJobNamedProperty", .signature = "\x00\x03\x09\x11\xaf\x55\x09\x11\x05" } },
    .{ "EnumJobNamedProperties", MethodRecord{ .library = "winspool.drv", .import = "EnumJobNamedProperties", .signature = "\x00\x04\x09\x11\xaf\x55\x09\x0f\x09\x0f\x0f\x11\xaf\x91" } },
    .{ "GetPrintOutputInfo", MethodRecord{ .library = "winspool.drv", .import = "GetPrintOutputInfo", .signature = "\x00\x04\x11\x79\x11\x25\x11\x05\x0f\x11\x80\x85\x0f\x11\x05" } },
    .{ "DevQueryPrintEx", MethodRecord{ .library = "winspool.drv", .import = "DevQueryPrintEx", .signature = "\x00\x01\x11\x59\x0f\x11\xaf\x95" } },
    .{ "RegisterForPrintAsyncNotifications", MethodRecord{ .library = "winspool.drv", .import = "RegisterForPrintAsyncNotifications", .signature = "\x00\x06\x11\x79\x11\x05\x0f\x11\x0d\x11\xaf\x99\x11\xaf\x9d\x12\xaf\xa1\x0f\x11\x80\x85" } },
    .{ "UnRegisterForPrintAsyncNotifications", MethodRecord{ .library = "winspool.drv", .import = "UnRegisterForPrintAsyncNotifications", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "CreatePrintAsyncNotifyChannel", MethodRecord{ .library = "winspool.drv", .import = "CreatePrintAsyncNotifyChannel", .signature = "\x00\x06\x11\x79\x11\x05\x0f\x11\x0d\x11\xaf\x99\x11\xaf\x9d\x12\xaf\xa1\x0f\x12\xaf\xa5" } },
    .{ "RouterUnregisterForPrintAsyncNotifications", MethodRecord{ .library = "SPOOLSS", .import = "RouterUnregisterForPrintAsyncNotifications", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "RouterCreatePrintAsyncNotificationChannel", MethodRecord{ .library = "SPOOLSS", .import = "RouterCreatePrintAsyncNotificationChannel", .signature = "\x00\x06\x11\x79\x11\x05\x0f\x11\x0d\x11\xaf\x99\x11\xaf\x9d\x12\xaf\xa1\x0f\x12\xaf\xa5" } },
    .{ "RouterGetPrintClassObject", MethodRecord{ .library = "SPOOLSS", .import = "RouterGetPrintClassObject", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "GdiGetSpoolFileHandle", MethodRecord{ .library = "GDI32", .import = "GdiGetSpoolFileHandle", .signature = "\x00\x03\x11\x80\x85\x11\x05\x0f\x11\x8d\x85\x11\x05" } },
    .{ "GdiDeleteSpoolFileHandle", MethodRecord{ .library = "GDI32", .import = "GdiDeleteSpoolFileHandle", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "GdiGetPageCount", MethodRecord{ .library = "GDI32", .import = "GdiGetPageCount", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "GdiGetDC", MethodRecord{ .library = "GDI32", .import = "GdiGetDC", .signature = "\x00\x01\x11\x83\x5d\x11\x80\x85" } },
    .{ "GdiGetPageHandle", MethodRecord{ .library = "GDI32", .import = "GdiGetPageHandle", .signature = "\x00\x03\x11\x80\x85\x11\x80\x85\x09\x0f\x09" } },
    .{ "GdiStartDocEMF", MethodRecord{ .library = "GDI32", .import = "GdiStartDocEMF", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xaf\xa9" } },
    .{ "GdiStartPageEMF", MethodRecord{ .library = "GDI32", .import = "GdiStartPageEMF", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "GdiPlayPageEMF", MethodRecord{ .library = "GDI32", .import = "GdiPlayPageEMF", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x80\x85\x0f\x11\x83\x89\x0f\x11\x83\x89\x0f\x11\x83\x89" } },
    .{ "GdiEndPageEMF", MethodRecord{ .library = "GDI32", .import = "GdiEndPageEMF", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "GdiEndDocEMF", MethodRecord{ .library = "GDI32", .import = "GdiEndDocEMF", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "GdiGetDevmodeForPage", MethodRecord{ .library = "GDI32", .import = "GdiGetDevmodeForPage", .signature = "\x00\x04\x11\x59\x11\x80\x85\x09\x0f\x0f\x11\x8d\x85\x0f\x0f\x11\x8d\x85" } },
    .{ "GdiResetDCEMF", MethodRecord{ .library = "GDI32", .import = "GdiResetDCEMF", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x8d\x85" } },
    .{ "GetJobAttributes", MethodRecord{ .library = "SPOOLSS", .import = "GetJobAttributes", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x11\x8d\x85\x0f\x11\xaf\xad" } },
    .{ "GetJobAttributesEx", MethodRecord{ .library = "SPOOLSS", .import = "GetJobAttributesEx", .signature = "\x00\x06\x11\x59\x11\x05\x0f\x11\x8d\x85\x09\x0f\x05\x09\x09" } },
    .{ "CreatePrinterIC", MethodRecord{ .library = "winspool.drv", .import = "CreatePrinterIC", .signature = "\x00\x02\x11\x80\x85\x11\xaf\x55\x0f\x11\x8d\x85" } },
    .{ "PlayGdiScriptOnPrinterIC", MethodRecord{ .library = "winspool.drv", .import = "PlayGdiScriptOnPrinterIC", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x05\x09\x0f\x05\x09\x09" } },
    .{ "DeletePrinterIC", MethodRecord{ .library = "winspool.drv", .import = "DeletePrinterIC", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "DevQueryPrint", MethodRecord{ .library = "winspool.drv", .import = "DevQueryPrint", .signature = "\x00\x03\x11\x59\x11\xaf\x55\x0f\x11\x8d\x81\x0f\x09" } },
    .{ "RevertToPrinterSelf", MethodRecord{ .library = "SPOOLSS", .import = "RevertToPrinterSelf", .signature = "\x00\x00\x11\x80\x85" } },
    .{ "ImpersonatePrinterClient", MethodRecord{ .library = "SPOOLSS", .import = "ImpersonatePrinterClient", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "ReplyPrinterChangeNotification", MethodRecord{ .library = "SPOOLSS", .import = "ReplyPrinterChangeNotification", .signature = "\x00\x04\x11\x59\x11\xaf\x55\x09\x0f\x09\x0f\x01" } },
    .{ "ReplyPrinterChangeNotificationEx", MethodRecord{ .library = "SPOOLSS", .import = "ReplyPrinterChangeNotificationEx", .signature = "\x00\x05\x11\x59\x11\x80\x85\x09\x09\x0f\x09\x0f\x01" } },
    .{ "PartialReplyPrinterChangeNotification", MethodRecord{ .library = "SPOOLSS", .import = "PartialReplyPrinterChangeNotification", .signature = "\x00\x02\x11\x59\x11\xaf\x55\x0f\x11\xaf\xb1" } },
    .{ "RouterAllocPrinterNotifyInfo", MethodRecord{ .library = "SPOOLSS", .import = "RouterAllocPrinterNotifyInfo", .signature = "\x00\x01\x0f\x11\xaf\x6d\x09" } },
    .{ "RouterFreePrinterNotifyInfo", MethodRecord{ .library = "SPOOLSS", .import = "RouterFreePrinterNotifyInfo", .signature = "\x00\x01\x11\x59\x0f\x11\xaf\x6d" } },
    .{ "RouterAllocBidiResponseContainer", MethodRecord{ .library = "SPOOLSS", .import = "RouterAllocBidiResponseContainer", .signature = "\x00\x01\x0f\x11\x9a\x89\x09" } },
    .{ "RouterAllocBidiMem", MethodRecord{ .library = "SPOOLSS", .import = "RouterAllocBidiMem", .signature = "\x00\x01\x0f\x01\x19" } },
    .{ "RouterFreeBidiResponseContainer", MethodRecord{ .library = "winspool.drv", .import = "RouterFreeBidiResponseContainer", .signature = "\x00\x01\x09\x0f\x11\x9a\x89" } },
    .{ "RouterFreeBidiMem", MethodRecord{ .library = "SPOOLSS", .import = "RouterFreeBidiMem", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "AppendPrinterNotifyInfoData", MethodRecord{ .library = "SPOOLSS", .import = "AppendPrinterNotifyInfoData", .signature = "\x00\x03\x11\x59\x0f\x11\xaf\x6d\x0f\x11\xaf\xb1\x09" } },
    .{ "CallRouterFindFirstPrinterChangeNotification", MethodRecord{ .library = "SPOOLSS", .import = "CallRouterFindFirstPrinterChangeNotification", .signature = "\x00\x05\x09\x11\x80\x85\x09\x09\x11\x80\x85\x0f\x11\xaf\xb5" } },
    .{ "ProvidorFindFirstPrinterChangeNotification", MethodRecord{ .library = "SPOOLSS", .import = "ProvidorFindFirstPrinterChangeNotification", .signature = "\x00\x06\x11\x59\x11\xaf\x55\x09\x09\x11\x80\x85\x0f\x01\x0f\x01" } },
    .{ "ProvidorFindClosePrinterChangeNotification", MethodRecord{ .library = "SPOOLSS", .import = "ProvidorFindClosePrinterChangeNotification", .signature = "\x00\x01\x11\x59\x11\xaf\x55" } },
    .{ "SpoolerFindFirstPrinterChangeNotification", MethodRecord{ .library = "SPOOLSS", .import = "SpoolerFindFirstPrinterChangeNotification", .signature = "\x00\x08\x11\x59\x11\xaf\x55\x09\x09\x0f\x01\x0f\x01\x0f\x01\x0f\x11\x80\x85\x0f\x11\x80\x85" } },
    .{ "SpoolerFindNextPrinterChangeNotification", MethodRecord{ .library = "SPOOLSS", .import = "SpoolerFindNextPrinterChangeNotification", .signature = "\x00\x04\x11\x59\x11\xaf\x55\x0f\x09\x0f\x01\x0f\x0f\x01" } },
    .{ "SpoolerRefreshPrinterChangeNotification", MethodRecord{ .library = "SPOOLSS", .import = "SpoolerRefreshPrinterChangeNotification", .signature = "\x00\x04\x11\x59\x11\xaf\x55\x09\x0f\x11\xaf\xb5\x0f\x0f\x11\xaf\x6d" } },
    .{ "SpoolerFreePrinterNotifyInfo", MethodRecord{ .library = "SPOOLSS", .import = "SpoolerFreePrinterNotifyInfo", .signature = "\x00\x01\x01\x0f\x11\xaf\x6d" } },
    .{ "SpoolerFindClosePrinterChangeNotification", MethodRecord{ .library = "SPOOLSS", .import = "SpoolerFindClosePrinterChangeNotification", .signature = "\x00\x01\x11\x59\x11\xaf\x55" } },
    .{ "SpoolerCopyFileEvent", MethodRecord{ .library = "mscms", .import = "SpoolerCopyFileEvent", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x09" } },
    .{ "GenerateCopyFilePaths", MethodRecord{ .library = "mscms", .import = "GenerateCopyFilePaths", .signature = "\x00\x09\x09\x11\x05\x11\x05\x0f\x05\x09\x11\x05\x0f\x09\x11\x05\x0f\x09\x09" } },
    .{ "SplPromptUIInUsersSession", MethodRecord{ .library = "SPOOLSS", .import = "SplPromptUIInUsersSession", .signature = "\x00\x04\x11\x59\x11\xaf\x55\x09\x0f\x11\xaf\xb9\x0f\x09" } },
    .{ "SplIsSessionZero", MethodRecord{ .library = "SPOOLSS", .import = "SplIsSessionZero", .signature = "\x00\x03\x09\x11\xaf\x55\x09\x0f\x11\x59" } },
    .{ "AddPrintDeviceObject", MethodRecord{ .library = "SPOOLSS", .import = "AddPrintDeviceObject", .signature = "\x00\x02\x11\x79\x11\xaf\x55\x0f\x11\x80\x85" } },
    .{ "UpdatePrintDeviceObject", MethodRecord{ .library = "SPOOLSS", .import = "UpdatePrintDeviceObject", .signature = "\x00\x02\x11\x79\x11\xaf\x55\x11\x80\x85" } },
    .{ "RemovePrintDeviceObject", MethodRecord{ .library = "SPOOLSS", .import = "RemovePrintDeviceObject", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x35d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HDC" },
        0x389 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "RECT" },
        0xd81 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DEVMODEA" },
        0xd85 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DEVMODEW" },
        0x1a89 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "BIDI_RESPONSE_CONTAINER" },
        0x2f51 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "PFNPROPSHEETUI" },
        0x2f55 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "PRINTER_HANDLE" },
        0x2f59 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "PRINTER_DEFAULTSA" },
        0x2f5d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "PRINTER_DEFAULTSW" },
        0x2f61 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "DOC_INFO_1A" },
        0x2f65 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "DOC_INFO_1W" },
        0x2f69 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "FINDPRINTERCHANGENOTIFICATION_HANDLE" },
        0x2f6d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "PRINTER_NOTIFY_INFO" },
        0x2f71 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "PRINTER_OPTIONSA" },
        0x2f75 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "PRINTER_OPTIONSW" },
        0x2f79 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "CORE_PRINTER_DRIVERA" },
        0x2f7d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "CORE_PRINTER_DRIVERW" },
        0x2f81 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "EPrintXPSJobOperation" },
        0x2f85 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "EPrintXPSJobProgress" },
        0x2f89 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "PRINT_EXECUTION_DATA" },
        0x2f8d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "PrintPropertyValue" },
        0x2f91 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "PrintNamedProperty" },
        0x2f95 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "DEVQUERYPRINT_INFO" },
        0x2f99 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "PrintAsyncNotifyUserFilter" },
        0x2f9d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "PrintAsyncNotifyConversationStyle" },
        0x2fa1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "IPrintAsyncNotifyCallback" },
        0x2fa5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "IPrintAsyncNotifyChannel" },
        0x2fa9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Xps", .name = "DOCINFOW" },
        0x2fad => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "ATTRIBUTE_INFO_3" },
        0x2fb1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "PRINTER_NOTIFY_INFO_DATA" },
        0x2fb5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "PRINTER_NOTIFY_OPTIONS" },
        0x2fb9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing", .name = "SHOWUIPARAMS" },
        else => null,
    };
}

pub const PRINTER_ALL_ACCESS = 983052;
pub const PRINTER_READ = 131080;
pub const PRINTER_WRITE = 131080;
pub const PRINTER_EXECUTE = 131080;
pub const SERVER_ALL_ACCESS = 983043;
pub const SERVER_READ = 131074;
pub const SERVER_WRITE = 131075;
pub const SERVER_EXECUTE = 131074;
pub const PRINTER_DELETE = 65536;
pub const PRINTER_READ_CONTROL = 131072;
pub const PRINTER_WRITE_DAC = 262144;
pub const PRINTER_WRITE_OWNER = 524288;
pub const PRINTER_SYNCHRONIZE = 1048576;
pub const PRINTER_STANDARD_RIGHTS_REQUIRED = 983040;
pub const PRINTER_STANDARD_RIGHTS_READ = 131072;
pub const PRINTER_STANDARD_RIGHTS_WRITE = 131072;
pub const PRINTER_STANDARD_RIGHTS_EXECUTE = 131072;
pub const SERVER_ACCESS_ADMINISTER = 1;
pub const SERVER_ACCESS_ENUMERATE = 2;
pub const PRINTER_ACCESS_ADMINISTER = 4;
pub const PRINTER_ACCESS_USE = 8;
pub const PRINTER_ACCESS_MANAGE_LIMITED = 64;
pub const USB_PRINTER_INTERFACE_CLASSIC = 1;
pub const USB_PRINTER_INTERFACE_IPP = 2;
pub const USB_PRINTER_INTERFACE_DUAL = 3;
pub const USB_PRINT_IPP_COMPAT_ID = 1;
pub const USB_PRINT_IPP_FAXOUT = 2;
pub const USBPRINT_IOCTL_INDEX = 0;
pub const IOCTL_USBPRINT_GET_LPT_STATUS = 2228272;
pub const IOCTL_USBPRINT_GET_1284_ID = 2228276;
pub const IOCTL_USBPRINT_VENDOR_SET_COMMAND = 2228280;
pub const IOCTL_USBPRINT_VENDOR_GET_COMMAND = 2228284;
pub const IOCTL_USBPRINT_SOFT_RESET = 2228288;
pub const IOCTL_USBPRINT_GET_PROTOCOL = 2228292;
pub const IOCTL_USBPRINT_SET_PROTOCOL = 2228296;
pub const IOCTL_USBPRINT_GET_INTERFACE_TYPE = 2228300;
pub const IOCTL_USBPRINT_SET_PORT_NUMBER = 2228304;
pub const IOCTL_USBPRINT_ADD_MSIPP_COMPAT_ID = 2228308;
pub const IOCTL_USBPRINT_SET_DEVICE_ID = 2228312;
pub const IOCTL_USBPRINT_ADD_CHILD_DEVICE = 2228316;
pub const IOCTL_USBPRINT_CYCLE_PORT = 2228320;
pub const IOCTL_USBPRINT_GET_MFG_MDL_ID = 2228324;
pub const TVOT_2STATES = 0;
pub const TVOT_3STATES = 1;
pub const TVOT_UDARROW = 2;
pub const TVOT_TRACKBAR = 3;
pub const TVOT_SCROLLBAR = 4;
pub const TVOT_LISTBOX = 5;
pub const TVOT_COMBOBOX = 6;
pub const TVOT_EDITBOX = 7;
pub const TVOT_PUSHBUTTON = 8;
pub const TVOT_CHKBOX = 9;
pub const TVOT_NSTATES_EX = 10;
pub const CHKBOXS_FALSE_TRUE = 0;
pub const CHKBOXS_NO_YES = 1;
pub const CHKBOXS_OFF_ON = 2;
pub const CHKBOXS_FALSE_PDATA = 3;
pub const CHKBOXS_NO_PDATA = 4;
pub const CHKBOXS_OFF_PDATA = 5;
pub const CHKBOXS_NONE_PDATA = 6;
pub const PUSHBUTTON_TYPE_DLGPROC = 0;
pub const PUSHBUTTON_TYPE_CALLBACK = 1;
pub const PUSHBUTTON_TYPE_HTCLRADJ = 2;
pub const PUSHBUTTON_TYPE_HTSETUP = 3;
pub const MAX_RES_STR_CHARS = 160;
pub const OPTPF_HIDE = 1;
pub const OPTPF_DISABLED = 2;
pub const OPTPF_ICONID_AS_HICON = 4;
pub const OPTPF_OVERLAY_WARNING_ICON = 8;
pub const OPTPF_OVERLAY_STOP_ICON = 16;
pub const OPTPF_OVERLAY_NO_ICON = 32;
pub const OPTPF_USE_HDLGTEMPLATE = 64;
pub const OPTPF_MASK = 127;
pub const OPTCF_HIDE = 1;
pub const OPTCF_MASK = 1;
pub const OPTTF_TYPE_DISABLED = 1;
pub const OPTTF_NOSPACE_BEFORE_POSTFIX = 2;
pub const OPTTF_MASK = 3;
pub const OTS_LBCB_SORT = 1;
pub const OTS_LBCB_PROPPAGE_LBUSECB = 2;
pub const OTS_LBCB_PROPPAGE_CBUSELB = 4;
pub const OTS_LBCB_INCL_ITEM_NONE = 8;
pub const OTS_LBCB_NO_ICON16_IN_ITEM = 16;
pub const OTS_PUSH_INCL_SETUP_TITLE = 32;
pub const OTS_PUSH_NO_DOT_DOT_DOT = 64;
pub const OTS_PUSH_ENABLE_ALWAYS = 128;
pub const OTS_MASK = 255;
pub const EPF_PUSH_TYPE_DLGPROC = 1;
pub const EPF_INCL_SETUP_TITLE = 2;
pub const EPF_NO_DOT_DOT_DOT = 4;
pub const EPF_ICONID_AS_HICON = 8;
pub const EPF_OVERLAY_WARNING_ICON = 16;
pub const EPF_OVERLAY_STOP_ICON = 32;
pub const EPF_OVERLAY_NO_ICON = 64;
pub const EPF_USE_HDLGTEMPLATE = 128;
pub const EPF_MASK = 255;
pub const ECBF_CHECKNAME_AT_FRONT = 1;
pub const ECBF_CHECKNAME_ONLY_ENABLED = 2;
pub const ECBF_ICONID_AS_HICON = 4;
pub const ECBF_OVERLAY_WARNING_ICON = 8;
pub const ECBF_OVERLAY_ECBICON_IF_CHECKED = 16;
pub const ECBF_OVERLAY_STOP_ICON = 32;
pub const ECBF_OVERLAY_NO_ICON = 64;
pub const ECBF_CHECKNAME_ONLY = 128;
pub const ECBF_MASK = 255;
pub const OPTIF_COLLAPSE = 1;
pub const OPTIF_HIDE = 2;
pub const OPTIF_CALLBACK = 4;
pub const OPTIF_CHANGED = 8;
pub const OPTIF_CHANGEONCE = 16;
pub const OPTIF_DISABLED = 32;
pub const OPTIF_ECB_CHECKED = 64;
pub const OPTIF_EXT_HIDE = 128;
pub const OPTIF_EXT_DISABLED = 256;
pub const OPTIF_SEL_AS_HICON = 512;
pub const OPTIF_EXT_IS_EXTPUSH = 1024;
pub const OPTIF_NO_GROUPBOX_NAME = 2048;
pub const OPTIF_OVERLAY_WARNING_ICON = 4096;
pub const OPTIF_OVERLAY_STOP_ICON = 8192;
pub const OPTIF_OVERLAY_NO_ICON = 16384;
pub const OPTIF_INITIAL_TVITEM = 32768;
pub const OPTIF_HAS_POIEXT = 65536;
pub const OPTIF_MASK = 131071;
pub const DMPUB_NONE = 0;
pub const DMPUB_FIRST = 1;
pub const DMPUB_ORIENTATION = 1;
pub const DMPUB_SCALE = 2;
pub const DMPUB_COPIES_COLLATE = 3;
pub const DMPUB_DEFSOURCE = 4;
pub const DMPUB_PRINTQUALITY = 5;
pub const DMPUB_COLOR = 6;
pub const DMPUB_DUPLEX = 7;
pub const DMPUB_TTOPTION = 8;
pub const DMPUB_FORMNAME = 9;
pub const DMPUB_ICMMETHOD = 10;
pub const DMPUB_ICMINTENT = 11;
pub const DMPUB_MEDIATYPE = 12;
pub const DMPUB_DITHERTYPE = 13;
pub const DMPUB_OUTPUTBIN = 14;
pub const DMPUB_QUALITY = 15;
pub const DMPUB_NUP = 16;
pub const DMPUB_PAGEORDER = 17;
pub const DMPUB_NUP_DIRECTION = 18;
pub const DMPUB_MANUAL_DUPLEX = 19;
pub const DMPUB_STAPLE = 20;
pub const DMPUB_BOOKLET_EDGE = 21;
pub const DMPUB_LAST = 21;
pub const DMPUB_OEM_PAPER_ITEM = 97;
pub const DMPUB_OEM_GRAPHIC_ITEM = 98;
pub const DMPUB_OEM_ROOT_ITEM = 99;
pub const DMPUB_USER = 100;
pub const OIEXTF_ANSI_STRING = 1;
pub const CPSUICB_REASON_SEL_CHANGED = 0;
pub const CPSUICB_REASON_PUSHBUTTON = 1;
pub const CPSUICB_REASON_ECB_CHANGED = 2;
pub const CPSUICB_REASON_DLGPROC = 3;
pub const CPSUICB_REASON_UNDO_CHANGES = 4;
pub const CPSUICB_REASON_EXTPUSH = 5;
pub const CPSUICB_REASON_APPLYNOW = 6;
pub const CPSUICB_REASON_OPTITEM_SETFOCUS = 7;
pub const CPSUICB_REASON_ITEMS_REVERTED = 8;
pub const CPSUICB_REASON_ABOUT = 9;
pub const CPSUICB_REASON_SETACTIVE = 10;
pub const CPSUICB_REASON_KILLACTIVE = 11;
pub const CPSUICB_ACTION_NONE = 0;
pub const CPSUICB_ACTION_OPTIF_CHANGED = 1;
pub const CPSUICB_ACTION_REINIT_ITEMS = 2;
pub const CPSUICB_ACTION_NO_APPLY_EXIT = 3;
pub const CPSUICB_ACTION_ITEMS_APPLIED = 4;
pub const DP_STD_TREEVIEWPAGE = 65535;
pub const DP_STD_DOCPROPPAGE2 = 65534;
pub const DP_STD_DOCPROPPAGE1 = 65533;
pub const DP_STD_RESERVED_START = 65520;
pub const MAX_DLGPAGE_COUNT = 64;
pub const DPF_ICONID_AS_HICON = 1;
pub const DPF_USE_HDLGTEMPLATE = 2;
pub const CPSUIF_UPDATE_PERMISSION = 1;
pub const CPSUIF_ICONID_AS_HICON = 2;
pub const CPSUIF_ABOUT_CALLBACK = 4;
pub const CPSFUNC_ADD_HPROPSHEETPAGE = 0;
pub const CPSFUNC_ADD_PROPSHEETPAGEW = 1;
pub const CPSFUNC_ADD_PCOMPROPSHEETUIA = 2;
pub const CPSFUNC_ADD_PCOMPROPSHEETUIW = 3;
pub const CPSFUNC_ADD_PFNPROPSHEETUIA = 4;
pub const CPSFUNC_ADD_PFNPROPSHEETUIW = 5;
pub const CPSFUNC_DELETE_HCOMPROPSHEET = 6;
pub const CPSFUNC_SET_HSTARTPAGE = 7;
pub const CPSFUNC_GET_PAGECOUNT = 8;
pub const CPSFUNC_SET_RESULT = 9;
pub const CPSFUNC_GET_HPSUIPAGES = 10;
pub const CPSFUNC_LOAD_CPSUI_STRINGA = 11;
pub const CPSFUNC_LOAD_CPSUI_STRINGW = 12;
pub const CPSFUNC_LOAD_CPSUI_ICON = 13;
pub const CPSFUNC_GET_PFNPROPSHEETUI_ICON = 14;
pub const CPSFUNC_ADD_PROPSHEETPAGEA = 15;
pub const CPSFUNC_INSERT_PSUIPAGEA = 16;
pub const CPSFUNC_INSERT_PSUIPAGEW = 17;
pub const CPSFUNC_SET_PSUIPAGE_TITLEA = 18;
pub const CPSFUNC_SET_PSUIPAGE_TITLEW = 19;
pub const CPSFUNC_SET_PSUIPAGE_ICON = 20;
pub const CPSFUNC_SET_DATABLOCK = 21;
pub const CPSFUNC_QUERY_DATABLOCK = 22;
pub const CPSFUNC_SET_DMPUB_HIDEBITS = 23;
pub const CPSFUNC_IGNORE_CPSUI_PSN_APPLY = 24;
pub const CPSFUNC_DO_APPLY_CPSUI = 25;
pub const CPSFUNC_SET_FUSION_CONTEXT = 26;
pub const MAX_CPSFUNC_INDEX = 26;
pub const CPSFUNC_ADD_PCOMPROPSHEETUI = 3;
pub const CPSFUNC_ADD_PFNPROPSHEETUI = 5;
pub const CPSFUNC_LOAD_CPSUI_STRING = 12;
pub const CPSFUNC_ADD_PROPSHEETPAGE = 1;
pub const CPSFUNC_INSERT_PSUIPAGE = 17;
pub const CPSFUNC_SET_PSUIPAGE_TITLE = 19;
pub const SR_OWNER = 0;
pub const SR_OWNER_PARENT = 1;
pub const PSUIPAGEINSERT_GROUP_PARENT = 0;
pub const PSUIPAGEINSERT_PCOMPROPSHEETUI = 1;
pub const PSUIPAGEINSERT_PFNPROPSHEETUI = 2;
pub const PSUIPAGEINSERT_PROPSHEETPAGE = 3;
pub const PSUIPAGEINSERT_HPROPSHEETPAGE = 4;
pub const PSUIPAGEINSERT_DLL = 5;
pub const MAX_PSUIPAGEINSERT_INDEX = 5;
pub const INSPSUIPAGE_MODE_BEFORE = 0;
pub const INSPSUIPAGE_MODE_AFTER = 1;
pub const INSPSUIPAGE_MODE_FIRST_CHILD = 2;
pub const INSPSUIPAGE_MODE_LAST_CHILD = 3;
pub const INSPSUIPAGE_MODE_INDEX = 4;
pub const SSP_TVPAGE = 10000;
pub const SSP_STDPAGE1 = 10001;
pub const SSP_STDPAGE2 = 10002;
pub const APPLYCPSUI_NO_NEWDEF = 1;
pub const APPLYCPSUI_OK_CANCEL_BUTTON = 2;
pub const PROPSHEETUI_REASON_INIT = 0;
pub const PROPSHEETUI_REASON_GET_INFO_HEADER = 1;
pub const PROPSHEETUI_REASON_DESTROY = 2;
pub const PROPSHEETUI_REASON_SET_RESULT = 3;
pub const PROPSHEETUI_REASON_GET_ICON = 4;
pub const PROPSHEETUI_REASON_BEFORE_INIT = 5;
pub const MAX_PROPSHEETUI_REASON_INDEX = 5;
pub const PROPSHEETUI_INFO_VERSION = 256;
pub const PSUIINFO_UNICODE = 1;
pub const PSUIHDRF_OBSOLETE = 1;
pub const PSUIHDRF_NOAPPLYNOW = 2;
pub const PSUIHDRF_PROPTITLE = 4;
pub const PSUIHDRF_USEHICON = 8;
pub const PSUIHDRF_DEFTITLE = 16;
pub const PSUIHDRF_EXACT_PTITLE = 32;
pub const CPSUI_CANCEL = 0;
pub const CPSUI_OK = 1;
pub const CPSUI_RESTARTWINDOWS = 2;
pub const CPSUI_REBOOTSYSTEM = 3;
pub const ERR_CPSUI_GETLASTERROR = -1;
pub const ERR_CPSUI_ALLOCMEM_FAILED = -2;
pub const ERR_CPSUI_INVALID_PDATA = -3;
pub const ERR_CPSUI_INVALID_LPARAM = -4;
pub const ERR_CPSUI_NULL_HINST = -5;
pub const ERR_CPSUI_NULL_CALLERNAME = -6;
pub const ERR_CPSUI_NULL_OPTITEMNAME = -7;
pub const ERR_CPSUI_NO_PROPSHEETPAGE = -8;
pub const ERR_CPSUI_TOO_MANY_PROPSHEETPAGES = -9;
pub const ERR_CPSUI_CREATEPROPPAGE_FAILED = -10;
pub const ERR_CPSUI_MORE_THAN_ONE_TVPAGE = -11;
pub const ERR_CPSUI_MORE_THAN_ONE_STDPAGE = -12;
pub const ERR_CPSUI_INVALID_PDLGPAGE = -13;
pub const ERR_CPSUI_INVALID_DLGPAGE_CBSIZE = -14;
pub const ERR_CPSUI_TOO_MANY_DLGPAGES = -15;
pub const ERR_CPSUI_INVALID_DLGPAGEIDX = -16;
pub const ERR_CPSUI_SUBITEM_DIFF_DLGPAGEIDX = -17;
pub const ERR_CPSUI_NULL_POPTITEM = -18;
pub const ERR_CPSUI_INVALID_OPTITEM_CBSIZE = -19;
pub const ERR_CPSUI_INVALID_OPTTYPE_CBSIZE = -20;
pub const ERR_CPSUI_INVALID_OPTTYPE_COUNT = -21;
pub const ERR_CPSUI_NULL_POPTPARAM = -22;
pub const ERR_CPSUI_INVALID_OPTPARAM_CBSIZE = -23;
pub const ERR_CPSUI_INVALID_EDITBOX_PSEL = -24;
pub const ERR_CPSUI_INVALID_EDITBOX_BUF_SIZE = -25;
pub const ERR_CPSUI_INVALID_ECB_CBSIZE = -26;
pub const ERR_CPSUI_NULL_ECB_PTITLE = -27;
pub const ERR_CPSUI_NULL_ECB_PCHECKEDNAME = -28;
pub const ERR_CPSUI_INVALID_DMPUBID = -29;
pub const ERR_CPSUI_INVALID_DMPUB_TVOT = -30;
pub const ERR_CPSUI_CREATE_TRACKBAR_FAILED = -31;
pub const ERR_CPSUI_CREATE_UDARROW_FAILED = -32;
pub const ERR_CPSUI_CREATE_IMAGELIST_FAILED = -33;
pub const ERR_CPSUI_INVALID_TVOT_TYPE = -34;
pub const ERR_CPSUI_INVALID_LBCB_TYPE = -35;
pub const ERR_CPSUI_SUBITEM_DIFF_OPTIF_HIDE = -36;
pub const ERR_CPSUI_INVALID_PUSHBUTTON_TYPE = -38;
pub const ERR_CPSUI_INVALID_EXTPUSH_CBSIZE = -39;
pub const ERR_CPSUI_NULL_EXTPUSH_DLGPROC = -40;
pub const ERR_CPSUI_NO_EXTPUSH_DLGTEMPLATEID = -41;
pub const ERR_CPSUI_NULL_EXTPUSH_CALLBACK = -42;
pub const ERR_CPSUI_DMCOPIES_USE_EXTPUSH = -43;
pub const ERR_CPSUI_ZERO_OPTITEM = -44;
pub const ERR_CPSUI_FUNCTION_NOT_IMPLEMENTED = -9999;
pub const ERR_CPSUI_INTERNAL_ERROR = -10000;
pub const IDI_CPSUI_ICONID_FIRST = 64000;
pub const IDI_CPSUI_EMPTY = 64000;
pub const IDI_CPSUI_SEL_NONE = 64001;
pub const IDI_CPSUI_WARNING = 64002;
pub const IDI_CPSUI_NO = 64003;
pub const IDI_CPSUI_YES = 64004;
pub const IDI_CPSUI_FALSE = 64005;
pub const IDI_CPSUI_TRUE = 64006;
pub const IDI_CPSUI_OFF = 64007;
pub const IDI_CPSUI_ON = 64008;
pub const IDI_CPSUI_PAPER_OUTPUT = 64009;
pub const IDI_CPSUI_ENVELOPE = 64010;
pub const IDI_CPSUI_MEM = 64011;
pub const IDI_CPSUI_FONTCARTHDR = 64012;
pub const IDI_CPSUI_FONTCART = 64013;
pub const IDI_CPSUI_STAPLER_ON = 64014;
pub const IDI_CPSUI_STAPLER_OFF = 64015;
pub const IDI_CPSUI_HT_HOST = 64016;
pub const IDI_CPSUI_HT_DEVICE = 64017;
pub const IDI_CPSUI_TT_PRINTASGRAPHIC = 64018;
pub const IDI_CPSUI_TT_DOWNLOADSOFT = 64019;
pub const IDI_CPSUI_TT_DOWNLOADVECT = 64020;
pub const IDI_CPSUI_TT_SUBDEV = 64021;
pub const IDI_CPSUI_PORTRAIT = 64022;
pub const IDI_CPSUI_LANDSCAPE = 64023;
pub const IDI_CPSUI_ROT_LAND = 64024;
pub const IDI_CPSUI_AUTOSEL = 64025;
pub const IDI_CPSUI_PAPER_TRAY = 64026;
pub const IDI_CPSUI_PAPER_TRAY2 = 64027;
pub const IDI_CPSUI_PAPER_TRAY3 = 64028;
pub const IDI_CPSUI_TRANSPARENT = 64029;
pub const IDI_CPSUI_COLLATE = 64030;
pub const IDI_CPSUI_DUPLEX_NONE = 64031;
pub const IDI_CPSUI_DUPLEX_HORZ = 64032;
pub const IDI_CPSUI_DUPLEX_VERT = 64033;
pub const IDI_CPSUI_RES_DRAFT = 64034;
pub const IDI_CPSUI_RES_LOW = 64035;
pub const IDI_CPSUI_RES_MEDIUM = 64036;
pub const IDI_CPSUI_RES_HIGH = 64037;
pub const IDI_CPSUI_RES_PRESENTATION = 64038;
pub const IDI_CPSUI_MONO = 64039;
pub const IDI_CPSUI_COLOR = 64040;
pub const IDI_CPSUI_DITHER_NONE = 64041;
pub const IDI_CPSUI_DITHER_COARSE = 64042;
pub const IDI_CPSUI_DITHER_FINE = 64043;
pub const IDI_CPSUI_DITHER_LINEART = 64044;
pub const IDI_CPSUI_SCALING = 64045;
pub const IDI_CPSUI_COPY = 64046;
pub const IDI_CPSUI_HTCLRADJ = 64047;
pub const IDI_CPSUI_HALFTONE_SETUP = 64048;
pub const IDI_CPSUI_WATERMARK = 64049;
pub const IDI_CPSUI_ERROR = 64050;
pub const IDI_CPSUI_ICM_OPTION = 64051;
pub const IDI_CPSUI_ICM_METHOD = 64052;
pub const IDI_CPSUI_ICM_INTENT = 64053;
pub const IDI_CPSUI_STD_FORM = 64054;
pub const IDI_CPSUI_OUTBIN = 64055;
pub const IDI_CPSUI_OUTPUT = 64056;
pub const IDI_CPSUI_GRAPHIC = 64057;
pub const IDI_CPSUI_ADVANCE = 64058;
pub const IDI_CPSUI_DOCUMENT = 64059;
pub const IDI_CPSUI_DEVICE = 64060;
pub const IDI_CPSUI_DEVICE2 = 64061;
pub const IDI_CPSUI_PRINTER = 64062;
pub const IDI_CPSUI_PRINTER2 = 64063;
pub const IDI_CPSUI_PRINTER3 = 64064;
pub const IDI_CPSUI_PRINTER4 = 64065;
pub const IDI_CPSUI_OPTION = 64066;
pub const IDI_CPSUI_OPTION2 = 64067;
pub const IDI_CPSUI_STOP = 64068;
pub const IDI_CPSUI_NOTINSTALLED = 64069;
pub const IDI_CPSUI_WARNING_OVERLAY = 64070;
pub const IDI_CPSUI_STOP_WARNING_OVERLAY = 64071;
pub const IDI_CPSUI_GENERIC_OPTION = 64072;
pub const IDI_CPSUI_GENERIC_ITEM = 64073;
pub const IDI_CPSUI_RUN_DIALOG = 64074;
pub const IDI_CPSUI_QUESTION = 64075;
pub const IDI_CPSUI_FORMTRAYASSIGN = 64076;
pub const IDI_CPSUI_PRINTER_FOLDER = 64077;
pub const IDI_CPSUI_INSTALLABLE_OPTION = 64078;
pub const IDI_CPSUI_PRINTER_FEATURE = 64079;
pub const IDI_CPSUI_DEVICE_FEATURE = 64080;
pub const IDI_CPSUI_FONTSUB = 64081;
pub const IDI_CPSUI_POSTSCRIPT = 64082;
pub const IDI_CPSUI_TELEPHONE = 64083;
pub const IDI_CPSUI_DUPLEX_NONE_L = 64084;
pub const IDI_CPSUI_DUPLEX_HORZ_L = 64085;
pub const IDI_CPSUI_DUPLEX_VERT_L = 64086;
pub const IDI_CPSUI_LF_PEN_PLOTTER = 64087;
pub const IDI_CPSUI_SF_PEN_PLOTTER = 64088;
pub const IDI_CPSUI_LF_RASTER_PLOTTER = 64089;
pub const IDI_CPSUI_SF_RASTER_PLOTTER = 64090;
pub const IDI_CPSUI_ROLL_PAPER = 64091;
pub const IDI_CPSUI_PEN_CARROUSEL = 64092;
pub const IDI_CPSUI_PLOTTER_PEN = 64093;
pub const IDI_CPSUI_MANUAL_FEED = 64094;
pub const IDI_CPSUI_FAX = 64095;
pub const IDI_CPSUI_PAGE_PROTECT = 64096;
pub const IDI_CPSUI_ENVELOPE_FEED = 64097;
pub const IDI_CPSUI_FONTCART_SLOT = 64098;
pub const IDI_CPSUI_LAYOUT_BMP_PORTRAIT = 64099;
pub const IDI_CPSUI_LAYOUT_BMP_ARROWL = 64100;
pub const IDI_CPSUI_LAYOUT_BMP_ARROWS = 64101;
pub const IDI_CPSUI_LAYOUT_BMP_BOOKLETL = 64102;
pub const IDI_CPSUI_LAYOUT_BMP_BOOKLETP = 64103;
pub const IDI_CPSUI_LAYOUT_BMP_ARROWLR = 64104;
pub const IDI_CPSUI_LAYOUT_BMP_ROT_PORT = 64105;
pub const IDI_CPSUI_LAYOUT_BMP_BOOKLETL_NB = 64106;
pub const IDI_CPSUI_LAYOUT_BMP_BOOKLETP_NB = 64107;
pub const IDI_CPSUI_ROT_PORT = 64110;
pub const IDI_CPSUI_NUP_BORDER = 64111;
pub const IDI_CPSUI_ICONID_LAST = 64111;
pub const IDS_CPSUI_STRID_FIRST = 64700;
pub const IDS_CPSUI_SETUP = 64700;
pub const IDS_CPSUI_MORE = 64701;
pub const IDS_CPSUI_CHANGE = 64702;
pub const IDS_CPSUI_OPTION = 64703;
pub const IDS_CPSUI_OF = 64704;
pub const IDS_CPSUI_RANGE_FROM = 64705;
pub const IDS_CPSUI_TO = 64706;
pub const IDS_CPSUI_COLON_SEP = 64707;
pub const IDS_CPSUI_LEFT_ANGLE = 64708;
pub const IDS_CPSUI_RIGHT_ANGLE = 64709;
pub const IDS_CPSUI_SLASH_SEP = 64710;
pub const IDS_CPSUI_PERCENT = 64711;
pub const IDS_CPSUI_LBCB_NOSEL = 64712;
pub const IDS_CPSUI_PROPERTIES = 64713;
pub const IDS_CPSUI_DEFAULTDOCUMENT = 64714;
pub const IDS_CPSUI_DOCUMENT = 64715;
pub const IDS_CPSUI_ADVANCEDOCUMENT = 64716;
pub const IDS_CPSUI_PRINTER = 64717;
pub const IDS_CPSUI_AUTOSELECT = 64718;
pub const IDS_CPSUI_PAPER_OUTPUT = 64719;
pub const IDS_CPSUI_GRAPHIC = 64720;
pub const IDS_CPSUI_OPTIONS = 64721;
pub const IDS_CPSUI_ADVANCED = 64722;
pub const IDS_CPSUI_STDDOCPROPTAB = 64723;
pub const IDS_CPSUI_STDDOCPROPTVTAB = 64724;
pub const IDS_CPSUI_DEVICEOPTIONS = 64725;
pub const IDS_CPSUI_FALSE = 64726;
pub const IDS_CPSUI_TRUE = 64727;
pub const IDS_CPSUI_NO = 64728;
pub const IDS_CPSUI_YES = 64729;
pub const IDS_CPSUI_OFF = 64730;
pub const IDS_CPSUI_ON = 64731;
pub const IDS_CPSUI_DEFAULT = 64732;
pub const IDS_CPSUI_ERROR = 64733;
pub const IDS_CPSUI_NONE = 64734;
pub const IDS_CPSUI_NOT = 64735;
pub const IDS_CPSUI_EXIST = 64736;
pub const IDS_CPSUI_NOTINSTALLED = 64737;
pub const IDS_CPSUI_ORIENTATION = 64738;
pub const IDS_CPSUI_SCALING = 64739;
pub const IDS_CPSUI_NUM_OF_COPIES = 64740;
pub const IDS_CPSUI_SOURCE = 64741;
pub const IDS_CPSUI_PRINTQUALITY = 64742;
pub const IDS_CPSUI_RESOLUTION = 64743;
pub const IDS_CPSUI_COLOR_APPERANCE = 64744;
pub const IDS_CPSUI_DUPLEX = 64745;
pub const IDS_CPSUI_TTOPTION = 64746;
pub const IDS_CPSUI_FORMNAME = 64747;
pub const IDS_CPSUI_ICM = 64748;
pub const IDS_CPSUI_ICMMETHOD = 64749;
pub const IDS_CPSUI_ICMINTENT = 64750;
pub const IDS_CPSUI_MEDIA = 64751;
pub const IDS_CPSUI_DITHERING = 64752;
pub const IDS_CPSUI_PORTRAIT = 64753;
pub const IDS_CPSUI_LANDSCAPE = 64754;
pub const IDS_CPSUI_ROT_LAND = 64755;
pub const IDS_CPSUI_COLLATE = 64756;
pub const IDS_CPSUI_COLLATED = 64757;
pub const IDS_CPSUI_PRINTFLDSETTING = 64758;
pub const IDS_CPSUI_DRAFT = 64759;
pub const IDS_CPSUI_LOW = 64760;
pub const IDS_CPSUI_MEDIUM = 64761;
pub const IDS_CPSUI_HIGH = 64762;
pub const IDS_CPSUI_PRESENTATION = 64763;
pub const IDS_CPSUI_COLOR = 64764;
pub const IDS_CPSUI_GRAYSCALE = 64765;
pub const IDS_CPSUI_MONOCHROME = 64766;
pub const IDS_CPSUI_SIMPLEX = 64767;
pub const IDS_CPSUI_HORIZONTAL = 64768;
pub const IDS_CPSUI_VERTICAL = 64769;
pub const IDS_CPSUI_LONG_SIDE = 64770;
pub const IDS_CPSUI_SHORT_SIDE = 64771;
pub const IDS_CPSUI_TT_PRINTASGRAPHIC = 64772;
pub const IDS_CPSUI_TT_DOWNLOADSOFT = 64773;
pub const IDS_CPSUI_TT_DOWNLOADVECT = 64774;
pub const IDS_CPSUI_TT_SUBDEV = 64775;
pub const IDS_CPSUI_ICM_BLACKWHITE = 64776;
pub const IDS_CPSUI_ICM_NO = 64777;
pub const IDS_CPSUI_ICM_YES = 64778;
pub const IDS_CPSUI_ICM_SATURATION = 64779;
pub const IDS_CPSUI_ICM_CONTRAST = 64780;
pub const IDS_CPSUI_ICM_COLORMETRIC = 64781;
pub const IDS_CPSUI_STANDARD = 64782;
pub const IDS_CPSUI_GLOSSY = 64783;
pub const IDS_CPSUI_TRANSPARENCY = 64784;
pub const IDS_CPSUI_REGULAR = 64785;
pub const IDS_CPSUI_BOND = 64786;
pub const IDS_CPSUI_COARSE = 64787;
pub const IDS_CPSUI_FINE = 64788;
pub const IDS_CPSUI_LINEART = 64789;
pub const IDS_CPSUI_ERRDIFFUSE = 64790;
pub const IDS_CPSUI_HALFTONE = 64791;
pub const IDS_CPSUI_HTCLRADJ = 64792;
pub const IDS_CPSUI_USE_HOST_HT = 64793;
pub const IDS_CPSUI_USE_DEVICE_HT = 64794;
pub const IDS_CPSUI_USE_PRINTER_HT = 64795;
pub const IDS_CPSUI_OUTBINASSIGN = 64796;
pub const IDS_CPSUI_WATERMARK = 64797;
pub const IDS_CPSUI_FORMTRAYASSIGN = 64798;
pub const IDS_CPSUI_UPPER_TRAY = 64799;
pub const IDS_CPSUI_ONLYONE = 64800;
pub const IDS_CPSUI_LOWER_TRAY = 64801;
pub const IDS_CPSUI_MIDDLE_TRAY = 64802;
pub const IDS_CPSUI_MANUAL_TRAY = 64803;
pub const IDS_CPSUI_ENVELOPE_TRAY = 64804;
pub const IDS_CPSUI_ENVMANUAL_TRAY = 64805;
pub const IDS_CPSUI_TRACTOR_TRAY = 64806;
pub const IDS_CPSUI_SMALLFMT_TRAY = 64807;
pub const IDS_CPSUI_LARGEFMT_TRAY = 64808;
pub const IDS_CPSUI_LARGECAP_TRAY = 64809;
pub const IDS_CPSUI_CASSETTE_TRAY = 64810;
pub const IDS_CPSUI_DEFAULT_TRAY = 64811;
pub const IDS_CPSUI_FORMSOURCE = 64812;
pub const IDS_CPSUI_MANUALFEED = 64813;
pub const IDS_CPSUI_PRINTERMEM_KB = 64814;
pub const IDS_CPSUI_PRINTERMEM_MB = 64815;
pub const IDS_CPSUI_PAGEPROTECT = 64816;
pub const IDS_CPSUI_HALFTONE_SETUP = 64817;
pub const IDS_CPSUI_INSTFONTCART = 64818;
pub const IDS_CPSUI_SLOT1 = 64819;
pub const IDS_CPSUI_SLOT2 = 64820;
pub const IDS_CPSUI_SLOT3 = 64821;
pub const IDS_CPSUI_SLOT4 = 64822;
pub const IDS_CPSUI_LEFT_SLOT = 64823;
pub const IDS_CPSUI_RIGHT_SLOT = 64824;
pub const IDS_CPSUI_STAPLER = 64825;
pub const IDS_CPSUI_STAPLER_ON = 64826;
pub const IDS_CPSUI_STAPLER_OFF = 64827;
pub const IDS_CPSUI_STACKER = 64828;
pub const IDS_CPSUI_MAILBOX = 64829;
pub const IDS_CPSUI_COPY = 64830;
pub const IDS_CPSUI_COPIES = 64831;
pub const IDS_CPSUI_TOTAL = 64832;
pub const IDS_CPSUI_MAKE = 64833;
pub const IDS_CPSUI_PRINT = 64834;
pub const IDS_CPSUI_FAX = 64835;
pub const IDS_CPSUI_PLOT = 64836;
pub const IDS_CPSUI_SLOW = 64837;
pub const IDS_CPSUI_FAST = 64838;
pub const IDS_CPSUI_ROTATED = 64839;
pub const IDS_CPSUI_RESET = 64840;
pub const IDS_CPSUI_ALL = 64841;
pub const IDS_CPSUI_DEVICE = 64842;
pub const IDS_CPSUI_SETTINGS = 64843;
pub const IDS_CPSUI_REVERT = 64844;
pub const IDS_CPSUI_CHANGES = 64845;
pub const IDS_CPSUI_CHANGED = 64846;
pub const IDS_CPSUI_WARNING = 64847;
pub const IDS_CPSUI_ABOUT = 64848;
pub const IDS_CPSUI_VERSION = 64849;
pub const IDS_CPSUI_NO_NAME = 64850;
pub const IDS_CPSUI_SETTING = 64851;
pub const IDS_CPSUI_DEVICE_SETTINGS = 64852;
pub const IDS_CPSUI_STDDOCPROPTAB1 = 64853;
pub const IDS_CPSUI_STDDOCPROPTAB2 = 64854;
pub const IDS_CPSUI_PAGEORDER = 64855;
pub const IDS_CPSUI_FRONTTOBACK = 64856;
pub const IDS_CPSUI_BACKTOFRONT = 64857;
pub const IDS_CPSUI_QUALITY_SETTINGS = 64858;
pub const IDS_CPSUI_QUALITY_DRAFT = 64859;
pub const IDS_CPSUI_QUALITY_BETTER = 64860;
pub const IDS_CPSUI_QUALITY_BEST = 64861;
pub const IDS_CPSUI_QUALITY_CUSTOM = 64862;
pub const IDS_CPSUI_OUTPUTBIN = 64863;
pub const IDS_CPSUI_NUP = 64864;
pub const IDS_CPSUI_NUP_NORMAL = 64865;
pub const IDS_CPSUI_NUP_TWOUP = 64866;
pub const IDS_CPSUI_NUP_FOURUP = 64867;
pub const IDS_CPSUI_NUP_SIXUP = 64868;
pub const IDS_CPSUI_NUP_NINEUP = 64869;
pub const IDS_CPSUI_NUP_SIXTEENUP = 64870;
pub const IDS_CPSUI_SIDE1 = 64871;
pub const IDS_CPSUI_SIDE2 = 64872;
pub const IDS_CPSUI_BOOKLET = 64873;
pub const IDS_CPSUI_POSTER = 64874;
pub const IDS_CPSUI_POSTER_2x2 = 64875;
pub const IDS_CPSUI_POSTER_3x3 = 64876;
pub const IDS_CPSUI_POSTER_4x4 = 64877;
pub const IDS_CPSUI_NUP_DIRECTION = 64878;
pub const IDS_CPSUI_RIGHT_THEN_DOWN = 64879;
pub const IDS_CPSUI_DOWN_THEN_RIGHT = 64880;
pub const IDS_CPSUI_LEFT_THEN_DOWN = 64881;
pub const IDS_CPSUI_DOWN_THEN_LEFT = 64882;
pub const IDS_CPSUI_MANUAL_DUPLEX = 64883;
pub const IDS_CPSUI_MANUAL_DUPLEX_ON = 64884;
pub const IDS_CPSUI_MANUAL_DUPLEX_OFF = 64885;
pub const IDS_CPSUI_ROT_PORT = 64886;
pub const IDS_CPSUI_STAPLE = 64887;
pub const IDS_CPSUI_BOOKLET_EDGE = 64888;
pub const IDS_CPSUI_BOOKLET_EDGE_LEFT = 64889;
pub const IDS_CPSUI_BOOKLET_EDGE_RIGHT = 64890;
pub const IDS_CPSUI_NUP_BORDER = 64891;
pub const IDS_CPSUI_NUP_BORDERED = 64892;
pub const IDS_CPSUI_STRID_LAST = 64892;
pub const MXDC_ESCAPE = 4122;
pub const MXDCOP_GET_FILENAME = 14;
pub const MXDCOP_PRINTTICKET_FIXED_DOC_SEQ = 22;
pub const MXDCOP_PRINTTICKET_FIXED_DOC = 24;
pub const MXDCOP_PRINTTICKET_FIXED_PAGE = 26;
pub const MXDCOP_SET_S0PAGE = 28;
pub const MXDCOP_SET_S0PAGE_RESOURCE = 30;
pub const MXDCOP_SET_XPSPASSTHRU_MODE = 32;
pub const S_DEVCAP_OUTPUT_FULL_REPLACEMENT = 318465;
pub const E_VERSION_NOT_SUPPORTED = 2147745793;
pub const S_NO_CONFLICT = 262145;
pub const S_CONFLICT_RESOLVED = 262146;
pub const PRINTER_OEMINTF_VERSION = 65536;
pub const OEM_MODE_PUBLISHER = 1;
pub const OEMGI_GETSIGNATURE = 1;
pub const OEMGI_GETINTERFACEVERSION = 2;
pub const OEMGI_GETVERSION = 3;
pub const OEMGI_GETPUBLISHERINFO = 4;
pub const OEMGI_GETREQUESTEDHELPERINTERFACES = 5;
pub const OEMPUBLISH_DEFAULT = 0;
pub const OEMPUBLISH_IPRINTCOREHELPER = 1;
pub const OEMDM_SIZE = 1;
pub const OEMDM_DEFAULT = 2;
pub const OEMDM_CONVERT = 3;
pub const OEMDM_MERGE = 4;
pub const OEMGDS_MIN_DOCSTICKY = 1;
pub const OEMGDS_PSDM_FLAGS = 1;
pub const OEMGDS_PSDM_DIALECT = 2;
pub const OEMGDS_PSDM_TTDLFMT = 3;
pub const OEMGDS_PSDM_NUP = 4;
pub const OEMGDS_PSDM_PSLEVEL = 5;
pub const OEMGDS_PSDM_CUSTOMSIZE = 6;
pub const OEMGDS_UNIDM_GPDVER = 16384;
pub const OEMGDS_UNIDM_FLAGS = 16385;
pub const OEMGDS_MIN_PRINTERSTICKY = 32768;
pub const OEMGDS_PRINTFLAGS = 32768;
pub const OEMGDS_FREEMEM = 32769;
pub const OEMGDS_JOBTIMEOUT = 32770;
pub const OEMGDS_WAITTIMEOUT = 32771;
pub const OEMGDS_PROTOCOL = 32772;
pub const OEMGDS_MINOUTLINE = 32773;
pub const OEMGDS_MAXBITMAP = 32774;
pub const OEMGDS_MAX = 65536;
pub const GPD_OEMCUSTOMDATA = 1;
pub const MV_UPDATE = 1;
pub const MV_RELATIVE = 2;
pub const MV_GRAPHICS = 4;
pub const MV_PHYSICAL = 8;
pub const MV_SENDXMOVECMD = 16;
pub const MV_SENDYMOVECMD = 32;
pub const OEMTTY_INFO_MARGINS = 1;
pub const OEMTTY_INFO_CODEPAGE = 2;
pub const OEMTTY_INFO_NUM_UFMS = 3;
pub const OEMTTY_INFO_UFM_IDS = 4;
pub const UFOFLAG_TTFONT = 1;
pub const UFOFLAG_TTDOWNLOAD_BITMAP = 2;
pub const UFOFLAG_TTDOWNLOAD_TTOUTLINE = 4;
pub const UFOFLAG_TTOUTLINE_BOLD_SIM = 8;
pub const UFOFLAG_TTOUTLINE_ITALIC_SIM = 16;
pub const UFOFLAG_TTOUTLINE_VERTICAL = 32;
pub const UFOFLAG_TTSUBSTITUTED = 64;
pub const UFO_GETINFO_FONTOBJ = 1;
pub const UFO_GETINFO_GLYPHSTRING = 2;
pub const UFO_GETINFO_GLYPHBITMAP = 3;
pub const UFO_GETINFO_GLYPHWIDTH = 4;
pub const UFO_GETINFO_MEMORY = 5;
pub const UFO_GETINFO_STDVARIABLE = 6;
pub const FNT_INFO_PRINTDIRINCCDEGREES = 0;
pub const FNT_INFO_GRAYPERCENTAGE = 1;
pub const FNT_INFO_NEXTFONTID = 2;
pub const FNT_INFO_NEXTGLYPH = 3;
pub const FNT_INFO_FONTHEIGHT = 4;
pub const FNT_INFO_FONTWIDTH = 5;
pub const FNT_INFO_FONTBOLD = 6;
pub const FNT_INFO_FONTITALIC = 7;
pub const FNT_INFO_FONTUNDERLINE = 8;
pub const FNT_INFO_FONTSTRIKETHRU = 9;
pub const FNT_INFO_CURRENTFONTID = 10;
pub const FNT_INFO_TEXTYRES = 11;
pub const FNT_INFO_TEXTXRES = 12;
pub const FNT_INFO_FONTMAXWIDTH = 13;
pub const FNT_INFO_MAX = 14;
pub const TTDOWNLOAD_DONTCARE = 0;
pub const TTDOWNLOAD_GRAPHICS = 1;
pub const TTDOWNLOAD_BITMAP = 2;
pub const TTDOWNLOAD_TTOUTLINE = 3;
pub const TYPE_UNICODE = 1;
pub const TYPE_TRANSDATA = 2;
pub const TYPE_GLYPHHANDLE = 3;
pub const TYPE_GLYPHID = 4;
pub const PDEV_ADJUST_PAPER_MARGIN_TYPE = 1;
pub const PDEV_HOSTFONT_ENABLED_TYPE = 2;
pub const PDEV_USE_TRUE_COLOR_TYPE = 3;
pub const PDEV_ADJUST_GRAPHICS_RESOLUTION_TYPE = 4;
pub const PDEV_ADJUST_IMAGEABLE_ORIGIN_AREA_TYPE = 8;
pub const PDEV_ADJUST_PHYSICAL_PAPER_SIZE_TYPE = 16;
pub const OEMCUIP_DOCPROP = 1;
pub const OEMCUIP_PRNPROP = 2;
pub const CUSTOMPARAM_WIDTH = 0;
pub const CUSTOMPARAM_HEIGHT = 1;
pub const CUSTOMPARAM_WIDTHOFFSET = 2;
pub const CUSTOMPARAM_HEIGHTOFFSET = 3;
pub const CUSTOMPARAM_ORIENTATION = 4;
pub const CUSTOMPARAM_MAX = 5;
pub const SETOPTIONS_FLAG_RESOLVE_CONFLICT = 1;
pub const SETOPTIONS_FLAG_KEEP_CONFLICT = 2;
pub const SETOPTIONS_RESULT_NO_CONFLICT = 0;
pub const SETOPTIONS_RESULT_CONFLICT_RESOLVED = 1;
pub const SETOPTIONS_RESULT_CONFLICT_REMAINED = 2;
pub const UNIFM_VERSION_1_0 = 65536;
pub const UFM_SOFT = 1;
pub const UFM_CART = 2;
pub const UFM_SCALABLE = 4;
pub const DF_TYPE_HPINTELLIFONT = 0;
pub const DF_TYPE_TRUETYPE = 1;
pub const DF_TYPE_PST1 = 2;
pub const DF_TYPE_CAPSL = 3;
pub const DF_TYPE_OEM1 = 4;
pub const DF_TYPE_OEM2 = 5;
pub const DF_NOITALIC = 1;
pub const DF_NOUNDER = 2;
pub const DF_XM_CR = 4;
pub const DF_NO_BOLD = 8;
pub const DF_NO_DOUBLE_UNDERLINE = 16;
pub const DF_NO_STRIKETHRU = 32;
pub const DF_BKSP_OK = 64;
pub const UNI_GLYPHSETDATA_VERSION_1_0 = 65536;
pub const MTYPE_FORMAT_MASK = 7;
pub const MTYPE_COMPOSE = 1;
pub const MTYPE_DIRECT = 2;
pub const MTYPE_PAIRED = 4;
pub const MTYPE_DOUBLEBYTECHAR_MASK = 24;
pub const MTYPE_SINGLE = 8;
pub const MTYPE_DOUBLE = 16;
pub const MTYPE_PREDEFIN_MASK = 224;
pub const MTYPE_REPLACE = 32;
pub const MTYPE_ADD = 64;
pub const MTYPE_DISABLE = 128;
pub const CC_NOPRECNV = 65535;
pub const CC_DEFAULT = 0;
pub const CC_CP437 = -1;
pub const CC_CP850 = -2;
pub const CC_CP863 = -3;
pub const CC_BIG5 = -10;
pub const CC_ISC = -11;
pub const CC_JIS = -12;
pub const CC_JIS_ANK = -13;
pub const CC_NS86 = -14;
pub const CC_TCA = -15;
pub const CC_GB2312 = -16;
pub const CC_SJIS = -17;
pub const CC_WANSUNG = -18;
pub const UFF_VERSION_NUMBER = 65537;
pub const FONT_DIR_SORTED = 1;
pub const FONT_FL_UFM = 1;
pub const FONT_FL_IFI = 2;
pub const FONT_FL_SOFTFONT = 4;
pub const FONT_FL_PERMANENT_SF = 8;
pub const FONT_FL_DEVICEFONT = 16;
pub const FONT_FL_GLYPHSET_GTT = 32;
pub const FONT_FL_GLYPHSET_RLE = 64;
pub const FONT_FL_RESERVED = 32768;
pub const FG_CANCHANGE = 128;
pub const WM_FI_FILENAME = 900;
pub const UNKNOWN_PROTOCOL = 0;
pub const PROTOCOL_UNKNOWN_TYPE = 0;
pub const RAWTCP = 1;
pub const PROTOCOL_RAWTCP_TYPE = 1;
pub const LPR = 2;
pub const PROTOCOL_LPR_TYPE = 2;
pub const MAX_PORTNAME_LEN = 64;
pub const MAX_NETWORKNAME_LEN = 49;
pub const MAX_NETWORKNAME2_LEN = 128;
pub const MAX_SNMP_COMMUNITY_STR_LEN = 33;
pub const MAX_QUEUENAME_LEN = 33;
pub const MAX_IPADDR_STR_LEN = 16;
pub const MAX_ADDRESS_STR_LEN = 13;
pub const MAX_DEVICEDESCRIPTION_STR_LEN = 257;
pub const DPS_NOPERMISSION = 1;
pub const DM_ADVANCED = 16;
pub const DM_NOPERMISSION = 32;
pub const DM_USER_DEFAULT = 64;
pub const DM_PROMPT_NON_MODAL = 1073741824;
pub const DM_INVALIDATE_DRIVER_CACHE = 536870912;
pub const DM_RESERVED = 2147483648;
pub const CDM_CONVERT = 1;
pub const CDM_CONVERT351 = 2;
pub const CDM_DRIVER_DEFAULT = 4;
pub const DOCUMENTEVENT_FIRST = 1;
pub const DOCUMENTEVENT_CREATEDCPRE = 1;
pub const DOCUMENTEVENT_CREATEDCPOST = 2;
pub const DOCUMENTEVENT_RESETDCPRE = 3;
pub const DOCUMENTEVENT_RESETDCPOST = 4;
pub const DOCUMENTEVENT_STARTDOC = 5;
pub const DOCUMENTEVENT_STARTDOCPRE = 5;
pub const DOCUMENTEVENT_STARTPAGE = 6;
pub const DOCUMENTEVENT_ENDPAGE = 7;
pub const DOCUMENTEVENT_ENDDOC = 8;
pub const DOCUMENTEVENT_ENDDOCPRE = 8;
pub const DOCUMENTEVENT_ABORTDOC = 9;
pub const DOCUMENTEVENT_DELETEDC = 10;
pub const DOCUMENTEVENT_ESCAPE = 11;
pub const DOCUMENTEVENT_ENDDOCPOST = 12;
pub const DOCUMENTEVENT_STARTDOCPOST = 13;
pub const DOCUMENTEVENT_QUERYFILTER = 14;
pub const DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPRE = 1;
pub const DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPRE = 2;
pub const DOCUMENTEVENT_XPS_ADDFIXEDPAGEEPRE = 3;
pub const DOCUMENTEVENT_XPS_ADDFIXEDPAGEPOST = 4;
pub const DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPOST = 5;
pub const DOCUMENTEVENT_XPS_CANCELJOB = 6;
pub const DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPRINTTICKETPRE = 7;
pub const DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPRINTTICKETPRE = 8;
pub const DOCUMENTEVENT_XPS_ADDFIXEDPAGEPRINTTICKETPRE = 9;
pub const DOCUMENTEVENT_XPS_ADDFIXEDPAGEPRINTTICKETPOST = 10;
pub const DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTPRINTTICKETPOST = 11;
pub const DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPRINTTICKETPOST = 12;
pub const DOCUMENTEVENT_XPS_ADDFIXEDDOCUMENTSEQUENCEPOST = 13;
pub const DOCUMENTEVENT_LAST = 15;
pub const DOCUMENTEVENT_SPOOLED = 65536;
pub const DOCUMENTEVENT_SUCCESS = 1;
pub const DOCUMENTEVENT_UNSUPPORTED = 0;
pub const DOCUMENTEVENT_FAILURE = -1;
pub const PRINTER_EVENT_CONFIGURATION_CHANGE = 0;
pub const PRINTER_EVENT_ADD_CONNECTION = 1;
pub const PRINTER_EVENT_DELETE_CONNECTION = 2;
pub const PRINTER_EVENT_INITIALIZE = 3;
pub const PRINTER_EVENT_DELETE = 4;
pub const PRINTER_EVENT_CACHE_REFRESH = 5;
pub const PRINTER_EVENT_CACHE_DELETE = 6;
pub const PRINTER_EVENT_ATTRIBUTES_CHANGED = 7;
pub const PRINTER_EVENT_CONFIGURATION_UPDATE = 8;
pub const PRINTER_EVENT_ADD_CONNECTION_NO_UI = 9;
pub const PRINTER_EVENT_DELETE_CONNECTION_NO_UI = 10;
pub const PRINTER_EVENT_FLAG_NO_UI = 1;
pub const DRIVER_EVENT_INITIALIZE = 1;
pub const DRIVER_EVENT_DELETE = 2;
pub const BORDER_PRINT = 0;
pub const NO_BORDER_PRINT = 1;
pub const NORMAL_PRINT = 0;
pub const REVERSE_PRINT = 1;
pub const BOOKLET_PRINT = 2;
pub const NO_COLOR_OPTIMIZATION = 0;
pub const COLOR_OPTIMIZATION = 1;
pub const REVERSE_PAGES_FOR_REVERSE_DUPLEX = 1;
pub const DONT_SEND_EXTRA_PAGES_FOR_DUPLEX = 2;
pub const RIGHT_THEN_DOWN = 1;
pub const DOWN_THEN_RIGHT = 2;
pub const LEFT_THEN_DOWN = 4;
pub const DOWN_THEN_LEFT = 8;
pub const BOOKLET_EDGE_LEFT = 0;
pub const BOOKLET_EDGE_RIGHT = 1;
pub const QCP_DEVICEPROFILE = 0;
pub const QCP_SOURCEPROFILE = 1;
pub const QCP_PROFILEMEMORY = 1;
pub const QCP_PROFILEDISK = 2;
pub const EMF_PP_COLOR_OPTIMIZATION = 1;
pub const PRINTER_NOTIFY_STATUS_ENDPOINT = 1;
pub const PRINTER_NOTIFY_STATUS_POLL = 2;
pub const PRINTER_NOTIFY_STATUS_INFO = 4;
pub const ROUTER_UNKNOWN = 0;
pub const ROUTER_SUCCESS = 1;
pub const ROUTER_STOP_ROUTING = 2;
pub const DOC_INFO_INTERNAL_LEVEL = 100;
pub const SPLCLIENT_INFO_INTERNAL_LEVEL = 100;
pub const FILL_WITH_DEFAULTS = 1;
pub const PRINTER_NOTIFY_INFO_DATA_COMPACT = 1;
pub const COPYFILE_EVENT_SET_PRINTER_DATAEX = 1;
pub const COPYFILE_EVENT_DELETE_PRINTER = 2;
pub const COPYFILE_EVENT_ADD_PRINTER_CONNECTION = 3;
pub const COPYFILE_EVENT_DELETE_PRINTER_CONNECTION = 4;
pub const COPYFILE_EVENT_FILES_CHANGED = 5;
pub const COPYFILE_FLAG_CLIENT_SPOOLER = 1;
pub const COPYFILE_FLAG_SERVER_SPOOLER = 2;
pub const DSPRINT_PUBLISH = 1;
pub const DSPRINT_UPDATE = 2;
pub const DSPRINT_UNPUBLISH = 4;
pub const DSPRINT_REPUBLISH = 8;
pub const DSPRINT_PENDING = 2147483648;
pub const PRINTER_CONTROL_PAUSE = 1;
pub const PRINTER_CONTROL_RESUME = 2;
pub const PRINTER_CONTROL_PURGE = 3;
pub const PRINTER_CONTROL_SET_STATUS = 4;
pub const PRINTER_STATUS_PAUSED = 1;
pub const PRINTER_STATUS_ERROR = 2;
pub const PRINTER_STATUS_PENDING_DELETION = 4;
pub const PRINTER_STATUS_PAPER_JAM = 8;
pub const PRINTER_STATUS_PAPER_OUT = 16;
pub const PRINTER_STATUS_MANUAL_FEED = 32;
pub const PRINTER_STATUS_PAPER_PROBLEM = 64;
pub const PRINTER_STATUS_OFFLINE = 128;
pub const PRINTER_STATUS_IO_ACTIVE = 256;
pub const PRINTER_STATUS_BUSY = 512;
pub const PRINTER_STATUS_PRINTING = 1024;
pub const PRINTER_STATUS_OUTPUT_BIN_FULL = 2048;
pub const PRINTER_STATUS_NOT_AVAILABLE = 4096;
pub const PRINTER_STATUS_WAITING = 8192;
pub const PRINTER_STATUS_PROCESSING = 16384;
pub const PRINTER_STATUS_INITIALIZING = 32768;
pub const PRINTER_STATUS_WARMING_UP = 65536;
pub const PRINTER_STATUS_TONER_LOW = 131072;
pub const PRINTER_STATUS_NO_TONER = 262144;
pub const PRINTER_STATUS_PAGE_PUNT = 524288;
pub const PRINTER_STATUS_USER_INTERVENTION = 1048576;
pub const PRINTER_STATUS_OUT_OF_MEMORY = 2097152;
pub const PRINTER_STATUS_DOOR_OPEN = 4194304;
pub const PRINTER_STATUS_SERVER_UNKNOWN = 8388608;
pub const PRINTER_STATUS_POWER_SAVE = 16777216;
pub const PRINTER_STATUS_SERVER_OFFLINE = 33554432;
pub const PRINTER_STATUS_DRIVER_UPDATE_NEEDED = 67108864;
pub const PRINTER_ATTRIBUTE_QUEUED = 1;
pub const PRINTER_ATTRIBUTE_DIRECT = 2;
pub const PRINTER_ATTRIBUTE_DEFAULT = 4;
pub const PRINTER_ATTRIBUTE_SHARED = 8;
pub const PRINTER_ATTRIBUTE_NETWORK = 16;
pub const PRINTER_ATTRIBUTE_HIDDEN = 32;
pub const PRINTER_ATTRIBUTE_LOCAL = 64;
pub const PRINTER_ATTRIBUTE_ENABLE_DEVQ = 128;
pub const PRINTER_ATTRIBUTE_KEEPPRINTEDJOBS = 256;
pub const PRINTER_ATTRIBUTE_DO_COMPLETE_FIRST = 512;
pub const PRINTER_ATTRIBUTE_WORK_OFFLINE = 1024;
pub const PRINTER_ATTRIBUTE_ENABLE_BIDI = 2048;
pub const PRINTER_ATTRIBUTE_RAW_ONLY = 4096;
pub const PRINTER_ATTRIBUTE_PUBLISHED = 8192;
pub const PRINTER_ATTRIBUTE_FAX = 16384;
pub const PRINTER_ATTRIBUTE_TS = 32768;
pub const PRINTER_ATTRIBUTE_PUSHED_USER = 131072;
pub const PRINTER_ATTRIBUTE_PUSHED_MACHINE = 262144;
pub const PRINTER_ATTRIBUTE_MACHINE = 524288;
pub const PRINTER_ATTRIBUTE_FRIENDLY_NAME = 1048576;
pub const PRINTER_ATTRIBUTE_TS_GENERIC_DRIVER = 2097152;
pub const PRINTER_ATTRIBUTE_PER_USER = 4194304;
pub const PRINTER_ATTRIBUTE_ENTERPRISE_CLOUD = 8388608;
pub const NO_PRIORITY = 0;
pub const MAX_PRIORITY = 99;
pub const MIN_PRIORITY = 1;
pub const DEF_PRIORITY = 1;
pub const JOB_CONTROL_PAUSE = 1;
pub const JOB_CONTROL_RESUME = 2;
pub const JOB_CONTROL_CANCEL = 3;
pub const JOB_CONTROL_RESTART = 4;
pub const JOB_CONTROL_DELETE = 5;
pub const JOB_CONTROL_SENT_TO_PRINTER = 6;
pub const JOB_CONTROL_LAST_PAGE_EJECTED = 7;
pub const JOB_CONTROL_RETAIN = 8;
pub const JOB_CONTROL_RELEASE = 9;
pub const JOB_CONTROL_SEND_TOAST = 10;
pub const JOB_CONTROL_PENDING_ON_DEVICE = 11;
pub const JOB_STATUS_PAUSED = 1;
pub const JOB_STATUS_ERROR = 2;
pub const JOB_STATUS_DELETING = 4;
pub const JOB_STATUS_SPOOLING = 8;
pub const JOB_STATUS_PRINTING = 16;
pub const JOB_STATUS_OFFLINE = 32;
pub const JOB_STATUS_PAPEROUT = 64;
pub const JOB_STATUS_PRINTED = 128;
pub const JOB_STATUS_DELETED = 256;
pub const JOB_STATUS_BLOCKED_DEVQ = 512;
pub const JOB_STATUS_USER_INTERVENTION = 1024;
pub const JOB_STATUS_RESTART = 2048;
pub const JOB_STATUS_COMPLETE = 4096;
pub const JOB_STATUS_RETAINED = 8192;
pub const JOB_STATUS_RENDERING_LOCALLY = 16384;
pub const JOB_POSITION_UNSPECIFIED = 0;
pub const PRINTER_DRIVER_PACKAGE_AWARE = 1;
pub const PRINTER_DRIVER_XPS = 2;
pub const PRINTER_DRIVER_SANDBOX_ENABLED = 4;
pub const PRINTER_DRIVER_CLASS = 8;
pub const PRINTER_DRIVER_DERIVED = 16;
pub const PRINTER_DRIVER_NOT_SHAREABLE = 32;
pub const PRINTER_DRIVER_CATEGORY_FAX = 64;
pub const PRINTER_DRIVER_CATEGORY_FILE = 128;
pub const PRINTER_DRIVER_CATEGORY_VIRTUAL = 256;
pub const PRINTER_DRIVER_CATEGORY_SERVICE = 512;
pub const PRINTER_DRIVER_SOFT_RESET_REQUIRED = 1024;
pub const PRINTER_DRIVER_SANDBOX_DISABLED = 2048;
pub const PRINTER_DRIVER_CATEGORY_3D = 4096;
pub const PRINTER_DRIVER_CATEGORY_CLOUD = 8192;
pub const DRIVER_KERNELMODE = 1;
pub const DRIVER_USERMODE = 2;
pub const DPD_DELETE_UNUSED_FILES = 1;
pub const DPD_DELETE_SPECIFIC_VERSION = 2;
pub const DPD_DELETE_ALL_FILES = 4;
pub const APD_STRICT_UPGRADE = 1;
pub const APD_STRICT_DOWNGRADE = 2;
pub const APD_COPY_ALL_FILES = 4;
pub const APD_COPY_NEW_FILES = 8;
pub const APD_COPY_FROM_DIRECTORY = 16;
pub const STRING_NONE = 1;
pub const STRING_MUIDLL = 2;
pub const STRING_LANGPAIR = 4;
pub const MAX_FORM_KEYWORD_LENGTH = 64;
pub const DI_CHANNEL = 1;
pub const DI_READ_SPOOL_JOB = 3;
pub const DI_MEMORYMAP_WRITE = 1;
pub const FORM_USER = 0;
pub const FORM_BUILTIN = 1;
pub const FORM_PRINTER = 2;
pub const PPCAPS_RIGHT_THEN_DOWN = 1;
pub const PPCAPS_DOWN_THEN_RIGHT = 2;
pub const PPCAPS_LEFT_THEN_DOWN = 4;
pub const PPCAPS_DOWN_THEN_LEFT = 8;
pub const PPCAPS_BORDER_PRINT = 1;
pub const PPCAPS_BOOKLET_EDGE = 1;
pub const PPCAPS_REVERSE_PAGES_FOR_REVERSE_DUPLEX = 1;
pub const PPCAPS_DONT_SEND_EXTRA_PAGES_FOR_DUPLEX = 2;
pub const PPCAPS_SQUARE_SCALING = 1;
pub const PORT_TYPE_WRITE = 1;
pub const PORT_TYPE_READ = 2;
pub const PORT_TYPE_REDIRECTED = 4;
pub const PORT_TYPE_NET_ATTACHED = 8;
pub const PORT_STATUS_TYPE_ERROR = 1;
pub const PORT_STATUS_TYPE_WARNING = 2;
pub const PORT_STATUS_TYPE_INFO = 3;
pub const PORT_STATUS_OFFLINE = 1;
pub const PORT_STATUS_PAPER_JAM = 2;
pub const PORT_STATUS_PAPER_OUT = 3;
pub const PORT_STATUS_OUTPUT_BIN_FULL = 4;
pub const PORT_STATUS_PAPER_PROBLEM = 5;
pub const PORT_STATUS_NO_TONER = 6;
pub const PORT_STATUS_DOOR_OPEN = 7;
pub const PORT_STATUS_USER_INTERVENTION = 8;
pub const PORT_STATUS_OUT_OF_MEMORY = 9;
pub const PORT_STATUS_TONER_LOW = 10;
pub const PORT_STATUS_WARMING_UP = 11;
pub const PORT_STATUS_POWER_SAVE = 12;
pub const PRINTER_ENUM_DEFAULT = 1;
pub const PRINTER_ENUM_LOCAL = 2;
pub const PRINTER_ENUM_CONNECTIONS = 4;
pub const PRINTER_ENUM_FAVORITE = 4;
pub const PRINTER_ENUM_NAME = 8;
pub const PRINTER_ENUM_REMOTE = 16;
pub const PRINTER_ENUM_SHARED = 32;
pub const PRINTER_ENUM_NETWORK = 64;
pub const PRINTER_ENUM_EXPAND = 16384;
pub const PRINTER_ENUM_CONTAINER = 32768;
pub const PRINTER_ENUM_ICONMASK = 16711680;
pub const PRINTER_ENUM_ICON1 = 65536;
pub const PRINTER_ENUM_ICON2 = 131072;
pub const PRINTER_ENUM_ICON3 = 262144;
pub const PRINTER_ENUM_ICON4 = 524288;
pub const PRINTER_ENUM_ICON5 = 1048576;
pub const PRINTER_ENUM_ICON6 = 2097152;
pub const PRINTER_ENUM_ICON7 = 4194304;
pub const PRINTER_ENUM_ICON8 = 8388608;
pub const PRINTER_ENUM_HIDE = 16777216;
pub const PRINTER_ENUM_CATEGORY_ALL = 33554432;
pub const PRINTER_ENUM_CATEGORY_3D = 67108864;
pub const SPOOL_FILE_PERSISTENT = 1;
pub const SPOOL_FILE_TEMPORARY = 2;
pub const PRINTER_NOTIFY_TYPE = 0;
pub const JOB_NOTIFY_TYPE = 1;
pub const SERVER_NOTIFY_TYPE = 2;
pub const PRINTER_NOTIFY_FIELD_SERVER_NAME = 0;
pub const PRINTER_NOTIFY_FIELD_PRINTER_NAME = 1;
pub const PRINTER_NOTIFY_FIELD_SHARE_NAME = 2;
pub const PRINTER_NOTIFY_FIELD_PORT_NAME = 3;
pub const PRINTER_NOTIFY_FIELD_DRIVER_NAME = 4;
pub const PRINTER_NOTIFY_FIELD_COMMENT = 5;
pub const PRINTER_NOTIFY_FIELD_LOCATION = 6;
pub const PRINTER_NOTIFY_FIELD_DEVMODE = 7;
pub const PRINTER_NOTIFY_FIELD_SEPFILE = 8;
pub const PRINTER_NOTIFY_FIELD_PRINT_PROCESSOR = 9;
pub const PRINTER_NOTIFY_FIELD_PARAMETERS = 10;
pub const PRINTER_NOTIFY_FIELD_DATATYPE = 11;
pub const PRINTER_NOTIFY_FIELD_SECURITY_DESCRIPTOR = 12;
pub const PRINTER_NOTIFY_FIELD_ATTRIBUTES = 13;
pub const PRINTER_NOTIFY_FIELD_PRIORITY = 14;
pub const PRINTER_NOTIFY_FIELD_DEFAULT_PRIORITY = 15;
pub const PRINTER_NOTIFY_FIELD_START_TIME = 16;
pub const PRINTER_NOTIFY_FIELD_UNTIL_TIME = 17;
pub const PRINTER_NOTIFY_FIELD_STATUS = 18;
pub const PRINTER_NOTIFY_FIELD_STATUS_STRING = 19;
pub const PRINTER_NOTIFY_FIELD_CJOBS = 20;
pub const PRINTER_NOTIFY_FIELD_AVERAGE_PPM = 21;
pub const PRINTER_NOTIFY_FIELD_TOTAL_PAGES = 22;
pub const PRINTER_NOTIFY_FIELD_PAGES_PRINTED = 23;
pub const PRINTER_NOTIFY_FIELD_TOTAL_BYTES = 24;
pub const PRINTER_NOTIFY_FIELD_BYTES_PRINTED = 25;
pub const PRINTER_NOTIFY_FIELD_OBJECT_GUID = 26;
pub const PRINTER_NOTIFY_FIELD_FRIENDLY_NAME = 27;
pub const PRINTER_NOTIFY_FIELD_BRANCH_OFFICE_PRINTING = 28;
pub const JOB_NOTIFY_FIELD_PRINTER_NAME = 0;
pub const JOB_NOTIFY_FIELD_MACHINE_NAME = 1;
pub const JOB_NOTIFY_FIELD_PORT_NAME = 2;
pub const JOB_NOTIFY_FIELD_USER_NAME = 3;
pub const JOB_NOTIFY_FIELD_NOTIFY_NAME = 4;
pub const JOB_NOTIFY_FIELD_DATATYPE = 5;
pub const JOB_NOTIFY_FIELD_PRINT_PROCESSOR = 6;
pub const JOB_NOTIFY_FIELD_PARAMETERS = 7;
pub const JOB_NOTIFY_FIELD_DRIVER_NAME = 8;
pub const JOB_NOTIFY_FIELD_DEVMODE = 9;
pub const JOB_NOTIFY_FIELD_STATUS = 10;
pub const JOB_NOTIFY_FIELD_STATUS_STRING = 11;
pub const JOB_NOTIFY_FIELD_SECURITY_DESCRIPTOR = 12;
pub const JOB_NOTIFY_FIELD_DOCUMENT = 13;
pub const JOB_NOTIFY_FIELD_PRIORITY = 14;
pub const JOB_NOTIFY_FIELD_POSITION = 15;
pub const JOB_NOTIFY_FIELD_SUBMITTED = 16;
pub const JOB_NOTIFY_FIELD_START_TIME = 17;
pub const JOB_NOTIFY_FIELD_UNTIL_TIME = 18;
pub const JOB_NOTIFY_FIELD_TIME = 19;
pub const JOB_NOTIFY_FIELD_TOTAL_PAGES = 20;
pub const JOB_NOTIFY_FIELD_PAGES_PRINTED = 21;
pub const JOB_NOTIFY_FIELD_TOTAL_BYTES = 22;
pub const JOB_NOTIFY_FIELD_BYTES_PRINTED = 23;
pub const JOB_NOTIFY_FIELD_REMOTE_JOB_ID = 24;
pub const SERVER_NOTIFY_FIELD_PRINT_DRIVER_ISOLATION_GROUP = 0;
pub const PRINTER_NOTIFY_CATEGORY_ALL = 4096;
pub const PRINTER_NOTIFY_CATEGORY_3D = 8192;
pub const PRINTER_NOTIFY_OPTIONS_REFRESH = 1;
pub const PRINTER_NOTIFY_INFO_DISCARDED = 1;
pub const BIDI_ACCESS_ADMINISTRATOR = 1;
pub const BIDI_ACCESS_USER = 2;
pub const ERROR_BIDI_STATUS_OK = 0;
pub const ERROR_BIDI_ERROR_BASE = 13000;
pub const ERROR_BIDI_STATUS_WARNING = 13001;
pub const ERROR_BIDI_SCHEMA_READ_ONLY = 13002;
pub const ERROR_BIDI_SERVER_OFFLINE = 13003;
pub const ERROR_BIDI_DEVICE_OFFLINE = 13004;
pub const ERROR_BIDI_SCHEMA_NOT_SUPPORTED = 13005;
pub const ERROR_BIDI_SET_DIFFERENT_TYPE = 13006;
pub const ERROR_BIDI_SET_MULTIPLE_SCHEMAPATH = 13007;
pub const ERROR_BIDI_SET_INVALID_SCHEMAPATH = 13008;
pub const ERROR_BIDI_SET_UNKNOWN_FAILURE = 13009;
pub const ERROR_BIDI_SCHEMA_WRITE_ONLY = 13010;
pub const ERROR_BIDI_GET_REQUIRES_ARGUMENT = 13011;
pub const ERROR_BIDI_GET_ARGUMENT_NOT_SUPPORTED = 13012;
pub const ERROR_BIDI_GET_MISSING_ARGUMENT = 13013;
pub const ERROR_BIDI_DEVICE_CONFIG_UNCHANGED = 13014;
pub const ERROR_BIDI_NO_LOCALIZED_RESOURCES = 13015;
pub const ERROR_BIDI_NO_BIDI_SCHEMA_EXTENSIONS = 13016;
pub const ERROR_BIDI_UNSUPPORTED_CLIENT_LANGUAGE = 13017;
pub const ERROR_BIDI_UNSUPPORTED_RESOURCE_FORMAT = 13018;
pub const PRINTER_CHANGE_ADD_PRINTER = 1;
pub const PRINTER_CHANGE_SET_PRINTER = 2;
pub const PRINTER_CHANGE_DELETE_PRINTER = 4;
pub const PRINTER_CHANGE_FAILED_CONNECTION_PRINTER = 8;
pub const PRINTER_CHANGE_PRINTER = 255;
pub const PRINTER_CHANGE_ADD_JOB = 256;
pub const PRINTER_CHANGE_SET_JOB = 512;
pub const PRINTER_CHANGE_DELETE_JOB = 1024;
pub const PRINTER_CHANGE_WRITE_JOB = 2048;
pub const PRINTER_CHANGE_JOB = 65280;
pub const PRINTER_CHANGE_ADD_FORM = 65536;
pub const PRINTER_CHANGE_SET_FORM = 131072;
pub const PRINTER_CHANGE_DELETE_FORM = 262144;
pub const PRINTER_CHANGE_FORM = 458752;
pub const PRINTER_CHANGE_ADD_PORT = 1048576;
pub const PRINTER_CHANGE_CONFIGURE_PORT = 2097152;
pub const PRINTER_CHANGE_DELETE_PORT = 4194304;
pub const PRINTER_CHANGE_PORT = 7340032;
pub const PRINTER_CHANGE_ADD_PRINT_PROCESSOR = 16777216;
pub const PRINTER_CHANGE_DELETE_PRINT_PROCESSOR = 67108864;
pub const PRINTER_CHANGE_PRINT_PROCESSOR = 117440512;
pub const PRINTER_CHANGE_SERVER = 134217728;
pub const PRINTER_CHANGE_ADD_PRINTER_DRIVER = 268435456;
pub const PRINTER_CHANGE_SET_PRINTER_DRIVER = 536870912;
pub const PRINTER_CHANGE_DELETE_PRINTER_DRIVER = 1073741824;
pub const PRINTER_CHANGE_PRINTER_DRIVER = 1879048192;
pub const PRINTER_CHANGE_TIMEOUT = 2147483648;
pub const PRINTER_CHANGE_ALL = 2138570751;
pub const PRINTER_ERROR_INFORMATION = 2147483648;
pub const PRINTER_ERROR_WARNING = 1073741824;
pub const PRINTER_ERROR_SEVERE = 536870912;
pub const PRINTER_ERROR_OUTOFPAPER = 1;
pub const PRINTER_ERROR_JAM = 2;
pub const PRINTER_ERROR_OUTOFTONER = 4;
pub const JOB_ACCESS_ADMINISTER = 16;
pub const JOB_ACCESS_READ = 32;
pub const PRINTER_CONNECTION_MISMATCH = 32;
pub const PRINTER_CONNECTION_NO_UI = 64;
pub const IPDFP_COPY_ALL_FILES = 1;
pub const UPDP_SILENT_UPLOAD = 1;
pub const UPDP_UPLOAD_ALWAYS = 2;
pub const UPDP_CHECK_DRIVERSTORE = 4;
pub const DISPID_PRINTSCHEMA_ELEMENT = 10000;
pub const DISPID_PRINTSCHEMA_ELEMENT_XMLNODE = 10001;
pub const DISPID_PRINTSCHEMA_ELEMENT_NAME = 10002;
pub const DISPID_PRINTSCHEMA_ELEMENT_NAMESPACEURI = 10003;
pub const DISPID_PRINTSCHEMA_DISPLAYABLEELEMENT = 10100;
pub const DISPID_PRINTSCHEMA_DISPLAYABLEELEMENT_DISPLAYNAME = 10101;
pub const DISPID_PRINTSCHEMA_OPTION = 10200;
pub const DISPID_PRINTSCHEMA_OPTION_SELECTED = 10201;
pub const DISPID_PRINTSCHEMA_OPTION_CONSTRAINED = 10202;
pub const DISPID_PRINTSCHEMA_OPTION_GETPROPERTYVALUE = 10203;
pub const DISPID_PRINTSCHEMA_PAGEMEDIASIZEOPTION = 10300;
pub const DISPID_PRINTSCHEMA_PAGEMEDIASIZEOPTION_WIDTH = 10301;
pub const DISPID_PRINTSCHEMA_PAGEMEDIASIZEOPTION_HEIGHT = 10302;
pub const DISPID_PRINTSCHEMA_NUPOPTION = 10400;
pub const DISPID_PRINTSCHEMA_NUPOPTION_PAGESPERSHEET = 10401;
pub const DISPID_PRINTSCHEMA_OPTIONCOLLECTION = 10500;
pub const DISPID_PRINTSCHEMA_OPTIONCOLLECTION_COUNT = 10501;
pub const DISPID_PRINTSCHEMA_OPTIONCOLLECTION_GETAT = 10502;
pub const DISPID_PRINTSCHEMA_FEATURE = 10600;
pub const DISPID_PRINTSCHEMA_FEATURE_SELECTEDOPTION = 10601;
pub const DISPID_PRINTSCHEMA_FEATURE_SELECTIONTYPE = 10602;
pub const DISPID_PRINTSCHEMA_FEATURE_GETOPTION = 10603;
pub const DISPID_PRINTSCHEMA_FEATURE_DISPLAYUI = 10604;
pub const DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE = 10700;
pub const DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_IMAGEABLE_WIDTH = 10701;
pub const DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_IMAGEABLE_HEIGHT = 10702;
pub const DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_ORIGIN_WIDTH = 10703;
pub const DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_ORIGIN_HEIGHT = 10704;
pub const DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_EXTENT_WIDTH = 10705;
pub const DISPID_PRINTSCHEMA_PAGEIMAGEABLESIZE_EXTENT_HEIGHT = 10706;
pub const DISPID_PRINTSCHEMA_CAPABILITIES = 10800;
pub const DISPID_PRINTSCHEMA_CAPABILITIES_GETFEATURE_KEYNAME = 10801;
pub const DISPID_PRINTSCHEMA_CAPABILITIES_GETFEATURE = 10802;
pub const DISPID_PRINTSCHEMA_CAPABILITIES_PAGEIMAGEABLESIZE = 10803;
pub const DISPID_PRINTSCHEMA_CAPABILITIES_JOBCOPIESMINVALUE = 10804;
pub const DISPID_PRINTSCHEMA_CAPABILITIES_JOBCOPIESMAXVALUE = 10805;
pub const DISPID_PRINTSCHEMA_CAPABILITIES_GETSELECTEDOPTION = 10806;
pub const DISPID_PRINTSCHEMA_CAPABILITIES_GETOPTIONS = 10807;
pub const DISPID_PRINTSCHEMA_CAPABILITIES_GETPARAMETERDEFINITION = 10808;
pub const DISPID_PRINTSCHEMA_ASYNCOPERATION = 10900;
pub const DISPID_PRINTSCHEMA_ASYNCOPERATION_START = 10901;
pub const DISPID_PRINTSCHEMA_ASYNCOPERATION_CANCEL = 10902;
pub const DISPID_PRINTSCHEMA_TICKET = 11000;
pub const DISPID_PRINTSCHEMA_TICKET_GETFEATURE_KEYNAME = 11001;
pub const DISPID_PRINTSCHEMA_TICKET_GETFEATURE = 11002;
pub const DISPID_PRINTSCHEMA_TICKET_VALIDATEASYNC = 11003;
pub const DISPID_PRINTSCHEMA_TICKET_COMMITASYNC = 11004;
pub const DISPID_PRINTSCHEMA_TICKET_NOTIFYXMLCHANGED = 11005;
pub const DISPID_PRINTSCHEMA_TICKET_GETCAPABILITIES = 11006;
pub const DISPID_PRINTSCHEMA_TICKET_JOBCOPIESALLDOCUMENTS = 11007;
pub const DISPID_PRINTSCHEMA_TICKET_GETPARAMETERINITIALIZER = 11008;
pub const DISPID_PRINTSCHEMA_ASYNCOPERATIONEVENT = 11100;
pub const DISPID_PRINTSCHEMA_ASYNCOPERATIONEVENT_COMPLETED = 11101;
pub const DISPID_PRINTERSCRIPTABLESEQUENTIALSTREAM = 11200;
pub const DISPID_PRINTERSCRIPTABLESEQUENTIALSTREAM_READ = 11201;
pub const DISPID_PRINTERSCRIPTABLESEQUENTIALSTREAM_WRITE = 11202;
pub const DISPID_PRINTERSCRIPTABLESTREAM = 11300;
pub const DISPID_PRINTERSCRIPTABLESTREAM_COMMIT = 11301;
pub const DISPID_PRINTERSCRIPTABLESTREAM_SEEK = 11302;
pub const DISPID_PRINTERSCRIPTABLESTREAM_SETSIZE = 11303;
pub const DISPID_PRINTERPROPERTYBAG = 11400;
pub const DISPID_PRINTERPROPERTYBAG_GETBOOL = 11401;
pub const DISPID_PRINTERPROPERTYBAG_SETBOOL = 11402;
pub const DISPID_PRINTERPROPERTYBAG_GETINT32 = 11403;
pub const DISPID_PRINTERPROPERTYBAG_SETINT32 = 11404;
pub const DISPID_PRINTERPROPERTYBAG_GETSTRING = 11405;
pub const DISPID_PRINTERPROPERTYBAG_SETSTRING = 11406;
pub const DISPID_PRINTERPROPERTYBAG_GETBYTES = 11407;
pub const DISPID_PRINTERPROPERTYBAG_SETBYTES = 11408;
pub const DISPID_PRINTERPROPERTYBAG_GETREADSTREAM = 11409;
pub const DISPID_PRINTERPROPERTYBAG_GETWRITESTREAM = 11410;
pub const DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETSTREAMASXML = 11411;
pub const DISPID_PRINTERSCRIPTABLEPROPERTYBAG = 11500;
pub const DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETBOOL = 11501;
pub const DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETBOOL = 11502;
pub const DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETINT32 = 11503;
pub const DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETINT32 = 11504;
pub const DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETSTRING = 11505;
pub const DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETSTRING = 11506;
pub const DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETBYTES = 11507;
pub const DISPID_PRINTERSCRIPTABLEPROPERTYBAG_SETBYTES = 11508;
pub const DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETREADSTREAM = 11509;
pub const DISPID_PRINTERSCRIPTABLEPROPERTYBAG_GETWRITESTREAM = 11510;
pub const DISPID_PRINTERQUEUE = 11600;
pub const DISPID_PRINTERQUEUE_HANDLE = 11601;
pub const DISPID_PRINTERQUEUE_NAME = 11602;
pub const DISPID_PRINTERQUEUE_SENDBIDIQUERY = 11603;
pub const DISPID_PRINTERQUEUE_GETPROPERTIES = 11604;
pub const DISPID_PRINTERQUEUE_SENDBIDISETREQUESTASYNC = 11605;
pub const DISPID_PRINTERQUEUE_GETPRINTERQUEUEVIEW = 11606;
pub const DISPID_PRINTERQUEUEEVENT = 11700;
pub const DISPID_PRINTERQUEUEEVENT_ONBIDIRESPONSERECEIVED = 11701;
pub const DISPID_PRINTEREXTENSION_CONTEXT = 11800;
pub const DISPID_PRINTEREXTENSION_CONTEXT_PRINTERQUEUE = 11801;
pub const DISPID_PRINTEREXTENSION_CONTEXT_PRINTSCHEMATICKET = 11802;
pub const DISPID_PRINTEREXTENSION_CONTEXT_DRIVERPROPERTIES = 11803;
pub const DISPID_PRINTEREXTENSION_CONTEXT_USERPROPERTIES = 11804;
pub const DISPID_PRINTEREXTENSION_REQUEST = 11900;
pub const DISPID_PRINTEREXTENSION_REQUEST_CANCEL = 11901;
pub const DISPID_PRINTEREXTENSION_REQUEST_COMPLETE = 11902;
pub const DISPID_PRINTEREXTENSION_EVENTARGS = 12000;
pub const DISPID_PRINTEREXTENSION_EVENTARGS_BIDINOTIFICATION = 12001;
pub const DISPID_PRINTEREXTENSION_EVENTARGS_REASONID = 12002;
pub const DISPID_PRINTEREXTENSION_EVENTARGS_REQUEST = 12003;
pub const DISPID_PRINTEREXTENSION_EVENTARGS_SOURCEAPPLICATION = 12004;
pub const DISPID_PRINTEREXTENSION_EVENTARGS_DETAILEDREASONID = 12005;
pub const DISPID_PRINTEREXTENSION_EVENTARGS_WINDOWMODAL = 12006;
pub const DISPID_PRINTEREXTENSION_EVENTARGS_WINDOWPARENT = 12007;
pub const DISPID_PRINTEREXTENSION_CONTEXTCOLLECTION = 12100;
pub const DISPID_PRINTEREXTENSION_CONTEXTCOLLECTION_COUNT = 12101;
pub const DISPID_PRINTEREXTENSION_CONTEXTCOLLECTION_GETAT = 12102;
pub const DISPID_PRINTEREXTENSION_EVENT = 12200;
pub const DISPID_PRINTEREXTENSION_EVENT_ONDRIVEREVENT = 12201;
pub const DISPID_PRINTEREXTENSION_EVENT_ONPRINTERQUEUESENUMERATED = 12202;
pub const DISPID_PRINTERSCRIPTCONTEXT = 12300;
pub const DISPID_PRINTERSCRIPTCONTEXT_DRIVERPROPERTIES = 12301;
pub const DISPID_PRINTERSCRIPTCONTEXT_QUEUEPROPERTIES = 12302;
pub const DISPID_PRINTERSCRIPTCONTEXT_USERPROPERTIES = 12303;
pub const DISPID_PRINTSCHEMA_PARAMETERINITIALIZER = 12400;
pub const DISPID_PRINTSCHEMA_PARAMETERINITIALIZER_VALUE = 12401;
pub const DISPID_PRINTSCHEMA_PARAMETERDEFINITION = 12500;
pub const DISPID_PRINTSCHEMA_PARAMETERDEFINITION_USERINPUTREQUIRED = 12501;
pub const DISPID_PRINTSCHEMA_PARAMETERDEFINITION_UNITTYPE = 12502;
pub const DISPID_PRINTSCHEMA_PARAMETERDEFINITION_DATATYPE = 12503;
pub const DISPID_PRINTSCHEMA_PARAMETERDEFINITION_RANGEMIN = 12504;
pub const DISPID_PRINTSCHEMA_PARAMETERDEFINITION_RANGEMAX = 12505;
pub const DISPID_PRINTJOBCOLLECTION = 12600;
pub const DISPID_PRINTJOBCOLLECTION_COUNT = 12601;
pub const DISPID_PRINTJOBCOLLECTION_GETAT = 12602;
pub const DISPID_PRINTERQUEUEVIEW = 12700;
pub const DISPID_PRINTERQUEUEVIEW_SETVIEWRANGE = 12701;
pub const DISPID_PRINTERQUEUEVIEW_EVENT = 12800;
pub const DISPID_PRINTERQUEUEVIEW_EVENT_ONCHANGED = 12801;
pub const Compression_NotCompressed = 0;
pub const Compression_Normal = 1;
pub const Compression_Small = 2;
pub const Compression_Fast = 3;
pub const Font_Normal = 0;
pub const Font_Obfusticate = 1;
pub const XpsJob_DocumentSequenceAdded = 0;
pub const XpsJob_FixedDocumentAdded = 1;
pub const XpsJob_FixedPageAdded = 2;
pub const Xps_Restricted_Font_Installable = 0;
pub const Xps_Restricted_Font_NoEmbedding = 2;
pub const Xps_Restricted_Font_PreviewPrint = 4;
pub const Xps_Restricted_Font_Editable = 8;
pub const BIDI_NULL = 0;
pub const BIDI_INT = 1;
pub const BIDI_FLOAT = 2;
pub const BIDI_BOOL = 3;
pub const BIDI_STRING = 4;
pub const BIDI_TEXT = 5;
pub const BIDI_ENUM = 6;
pub const BIDI_BLOB = 7;
pub const PRINTER_OPTION_NO_CACHE = 1;
pub const PRINTER_OPTION_CACHE = 2;
pub const PRINTER_OPTION_CLIENT_CHANGE = 4;
pub const PRINTER_OPTION_NO_CLIENT_DATA = 8;
pub const kPropertyTypeString = 1;
pub const kPropertyTypeInt32 = 2;
pub const kPropertyTypeInt64 = 3;
pub const kPropertyTypeByte = 4;
pub const kPropertyTypeTime = 5;
pub const kPropertyTypeDevMode = 6;
pub const kPropertyTypeSD = 7;
pub const kPropertyTypeNotificationReply = 8;
pub const kPropertyTypeNotificationOptions = 9;
pub const kPropertyTypeBuffer = 10;
pub const kAddingDocumentSequence = 0;
pub const kDocumentSequenceAdded = 1;
pub const kAddingFixedDocument = 2;
pub const kFixedDocumentAdded = 3;
pub const kAddingFixedPage = 4;
pub const kFixedPageAdded = 5;
pub const kResourceAdded = 6;
pub const kFontAdded = 7;
pub const kImageAdded = 8;
pub const kXpsDocumentCommitted = 9;
pub const kJobProduction = 1;
pub const kJobConsumption = 2;
pub const PRINT_EXECUTION_CONTEXT_APPLICATION = 0;
pub const PRINT_EXECUTION_CONTEXT_SPOOLER_SERVICE = 1;
pub const PRINT_EXECUTION_CONTEXT_SPOOLER_ISOLATION_HOST = 2;
pub const PRINT_EXECUTION_CONTEXT_FILTER_PIPELINE = 3;
pub const PRINT_EXECUTION_CONTEXT_WOW64 = 4;
pub const MXDC_LANDSCAPE_ROTATE_COUNTERCLOCKWISE_90_DEGREES = 90;
pub const MXDC_LANDSCAPE_ROTATE_NONE = 0;
pub const MXDC_LANDSCAPE_ROTATE_COUNTERCLOCKWISE_270_DEGREES = -90;
pub const MXDC_IMAGETYPE_JPEGHIGH_COMPRESSION = 1;
pub const MXDC_IMAGETYPE_JPEGMEDIUM_COMPRESSION = 2;
pub const MXDC_IMAGETYPE_JPEGLOW_COMPRESSION = 3;
pub const MXDC_IMAGETYPE_PNG = 4;
pub const MXDC_RESOURCE_TTF = 0;
pub const MXDC_RESOURCE_JPEG = 1;
pub const MXDC_RESOURCE_PNG = 2;
pub const MXDC_RESOURCE_TIFF = 3;
pub const MXDC_RESOURCE_WDP = 4;
pub const MXDC_RESOURCE_DICTIONARY = 5;
pub const MXDC_RESOURCE_ICC_PROFILE = 6;
pub const MXDC_RESOURCE_JPEG_THUMBNAIL = 7;
pub const MXDC_RESOURCE_PNG_THUMBNAIL = 8;
pub const MXDC_RESOURCE_MAX = 9;
pub const kADT_UNKNOWN = 0;
pub const kADT_BOOL = 1;
pub const kADT_INT = 2;
pub const kADT_LONG = 3;
pub const kADT_DWORD = 4;
pub const kADT_ASCII = 5;
pub const kADT_UNICODE = 6;
pub const kADT_BINARY = 7;
pub const kADT_SIZE = 8;
pub const kADT_RECT = 9;
pub const kADT_CUSTOMSIZEPARAMS = 10;
pub const PTSHIM_DEFAULT = 0;
pub const PTSHIM_NOSNAPSHOT = 1;
pub const PrintSchemaConstrainedSetting_None = 0;
pub const PrintSchemaConstrainedSetting_PrintTicket = 1;
pub const PrintSchemaConstrainedSetting_Admin = 2;
pub const PrintSchemaConstrainedSetting_Device = 3;
pub const PrintSchemaSelectionType_PickOne = 0;
pub const PrintSchemaSelectionType_PickMany = 1;
pub const PrintSchemaParameterDataType_Integer = 0;
pub const PrintSchemaParameterDataType_NumericString = 1;
pub const PrintSchemaParameterDataType_String = 2;
pub const PrintJobStatus_Paused = 1;
pub const PrintJobStatus_Error = 2;
pub const PrintJobStatus_Deleting = 4;
pub const PrintJobStatus_Spooling = 8;
pub const PrintJobStatus_Printing = 16;
pub const PrintJobStatus_Offline = 32;
pub const PrintJobStatus_PaperOut = 64;
pub const PrintJobStatus_Printed = 128;
pub const PrintJobStatus_Deleted = 256;
pub const PrintJobStatus_BlockedDeviceQueue = 512;
pub const PrintJobStatus_UserIntervention = 1024;
pub const PrintJobStatus_Restarted = 2048;
pub const PrintJobStatus_Complete = 4096;
pub const PrintJobStatus_Retained = 8192;
pub const kPerUser = 0;
pub const kAllUsers = 1;
pub const kBiDirectional = 0;
pub const kUniDirectional = 1;
pub const CHANNEL_CLOSED_BY_SERVER = 1;
pub const CHANNEL_CLOSED_BY_ANOTHER_LISTENER = 2;
pub const CHANNEL_CLOSED_BY_SAME_LISTENER = 3;
pub const CHANNEL_RELEASED_BY_LISTENER = 4;
pub const UNIRECTIONAL_NOTIFICATION_LOST = 5;
pub const ASYNC_NOTIFICATION_FAILURE = 6;
pub const NO_LISTENERS = 7;
pub const CHANNEL_ALREADY_CLOSED = 8;
pub const CHANNEL_ALREADY_OPENED = 9;
pub const CHANNEL_WAITING_FOR_CLIENT_NOTIFICATION = 10;
pub const CHANNEL_NOT_OPENED = 11;
pub const ASYNC_CALL_ALREADY_PARKED = 12;
pub const NOT_REGISTERED = 13;
pub const ALREADY_UNREGISTERED = 14;
pub const ALREADY_REGISTERED = 15;
pub const CHANNEL_ACQUIRED = 16;
pub const ASYNC_CALL_IN_PROGRESS = 17;
pub const MAX_NOTIFICATION_SIZE_EXCEEDED = 18;
pub const INTERNAL_NOTIFICATION_QUEUE_IS_FULL = 19;
pub const INVALID_NOTIFICATION_TYPE = 20;
pub const MAX_REGISTRATION_COUNT_EXCEEDED = 21;
pub const MAX_CHANNEL_COUNT_EXCEEDED = 22;
pub const LOCAL_ONLY_REGISTRATION = 23;
pub const REMOTE_ONLY_REGISTRATION = 24;
pub const kInvalidJobState = 0;
pub const kLogJobPrinted = 1;
pub const kLogJobRendered = 2;
pub const kLogJobError = 3;
pub const kLogJobPipelineError = 4;
pub const kLogOfflineFileFull = 5;
pub const NOTIFICATION_COMMAND_NOTIFY = 0;
pub const NOTIFICATION_COMMAND_CONTEXT_ACQUIRE = 1;
pub const NOTIFICATION_COMMAND_CONTEXT_RELEASE = 2;
pub const NOTIFICATION_CONFIG_CREATE_EVENT = 1;
pub const NOTIFICATION_CONFIG_REGISTER_CALLBACK = 2;
pub const NOTIFICATION_CONFIG_EVENT_TRIGGER = 4;
pub const NOTIFICATION_CONFIG_ASYNC_CHANNEL = 8;
pub const kMessageBox = 0;
pub const XPSRAS_RENDERING_MODE_ANTIALIASED = 0;
pub const XPSRAS_RENDERING_MODE_ALIASED = 1;
pub const XPSRAS_PIXEL_FORMAT_32BPP_PBGRA_UINT_SRGB = 1;
pub const XPSRAS_PIXEL_FORMAT_64BPP_PRGBA_HALF_SCRGB = 2;
pub const XPSRAS_PIXEL_FORMAT_128BPP_PRGBA_FLOAT_SCRGB = 3;
pub const XPSRAS_BACKGROUND_COLOR_TRANSPARENT = 0;
pub const XPSRAS_BACKGROUND_COLOR_OPAQUE = 1;
pub const FinalPageCount = 0;
pub const IntermediatePageCount = 1;

pub const aliases = struct {
    pub const PRINTER_ACCESS_RIGHTS = u32;
    pub const EXpsCompressionOptions = i32;
    pub const EXpsFontOptions = i32;
    pub const EXpsJobConsumption = i32;
    pub const EXpsFontRestriction = i32;
    pub const BIDI_TYPE = i32;
    pub const PRINTER_OPTION_FLAGS = i32;
    pub const EPrintPropertyType = i32;
    pub const EPrintXPSJobProgress = i32;
    pub const EPrintXPSJobOperation = i32;
    pub const PRINT_EXECUTION_CONTEXT = i32;
    pub const MXDC_LANDSCAPE_ROTATION_ENUMS = i32;
    pub const MXDC_IMAGE_TYPE_ENUMS = i32;
    pub const MXDC_S0_PAGE_ENUMS = i32;
    pub const EATTRIBUTE_DATATYPE = i32;
    pub const SHIMOPTS = i32;
    pub const PrintSchemaConstrainedSetting = i32;
    pub const PrintSchemaSelectionType = i32;
    pub const PrintSchemaParameterDataType = i32;
    pub const PrintJobStatus = i32;
    pub const PrintAsyncNotifyUserFilter = i32;
    pub const PrintAsyncNotifyConversationStyle = i32;
    pub const PrintAsyncNotifyError = i32;
    pub const EBranchOfficeJobEventType = i32;
    pub const NOTIFICATION_CALLBACK_COMMANDS = i32;
    pub const NOTIFICATION_CONFIG_FLAGS = i32;
    pub const UI_TYPE = i32;
    pub const XPSRAS_RENDERING_MODE = i32;
    pub const XPSRAS_PIXEL_FORMAT = i32;
    pub const XPSRAS_BACKGROUND_COLOR = i32;
    pub const PageCountType = i32;
};
