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
    .{ "StartXpsPrintJob", MethodRecord{ .library = "XPSPRINT", .import = "StartXpsPrintJob", .signature = "\x00\x0a\x11\x79\x11\x05\x11\x05\x11\x05\x11\x80\x85\x11\x80\x85\x0f\x05\x09\x0f\x12\xbf\xa1\x0f\x12\xbf\xa5\x0f\x12\xbf\xa5" } },
    .{ "StartXpsPrintJob1", MethodRecord{ .library = "XPSPRINT", .import = "StartXpsPrintJob1", .signature = "\x00\x07\x11\x79\x11\x05\x11\x05\x11\x05\x11\x80\x85\x11\x80\x85\x0f\x12\xbf\xa1\x0f\x12\xbf\xa9" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x3fa1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Xps.Printing", .name = "IXpsPrintJob" },
        0x3fa5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Xps.Printing", .name = "IXpsPrintJobStream" },
        0x3fa9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Xps", .name = "IXpsOMPackageTarget" },
        else => null,
    };
}

pub const XPS_JOB_IN_PROGRESS = 0;
pub const XPS_JOB_COMPLETED = 1;
pub const XPS_JOB_CANCELLED = 2;
pub const XPS_JOB_FAILED = 3;
pub const PrintDocumentPackageCompletion_InProgress = 0;
pub const PrintDocumentPackageCompletion_Completed = 1;
pub const PrintDocumentPackageCompletion_Canceled = 2;
pub const PrintDocumentPackageCompletion_Failed = 3;

pub const aliases = struct {
    pub const XPS_JOB_COMPLETION = i32;
    pub const PrintDocumentPackageCompletion = i32;
};
