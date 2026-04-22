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
    .{ "PTQuerySchemaVersionSupport", MethodRecord{ .library = "prntvpt", .import = "PTQuerySchemaVersionSupport", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x09" } },
    .{ "PTOpenProvider", MethodRecord{ .library = "prntvpt", .import = "PTOpenProvider", .signature = "\x00\x03\x11\x79\x11\x05\x09\x0f\x11\xaf\xbd" } },
    .{ "PTOpenProviderEx", MethodRecord{ .library = "prntvpt", .import = "PTOpenProviderEx", .signature = "\x00\x05\x11\x79\x11\x05\x09\x09\x0f\x11\xaf\xbd\x0f\x09" } },
    .{ "PTCloseProvider", MethodRecord{ .library = "prntvpt", .import = "PTCloseProvider", .signature = "\x00\x01\x11\x79\x11\xaf\xbd" } },
    .{ "PTReleaseMemory", MethodRecord{ .library = "prntvpt", .import = "PTReleaseMemory", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "PTGetPrintCapabilities", MethodRecord{ .library = "prntvpt", .import = "PTGetPrintCapabilities", .signature = "\x00\x04\x11\x79\x11\xaf\xbd\x12\x83\x75\x12\x83\x75\x0f\x11\x8d\x35" } },
    .{ "PTGetPrintDeviceCapabilities", MethodRecord{ .library = "prntvpt", .import = "PTGetPrintDeviceCapabilities", .signature = "\x00\x04\x11\x79\x11\xaf\xbd\x12\x83\x75\x12\x83\x75\x0f\x11\x8d\x35" } },
    .{ "PTGetPrintDeviceResources", MethodRecord{ .library = "prntvpt", .import = "PTGetPrintDeviceResources", .signature = "\x00\x05\x11\x79\x11\xaf\xbd\x11\x05\x12\x83\x75\x12\x83\x75\x0f\x11\x8d\x35" } },
    .{ "PTMergeAndValidatePrintTicket", MethodRecord{ .library = "prntvpt", .import = "PTMergeAndValidatePrintTicket", .signature = "\x00\x06\x11\x79\x11\xaf\xbd\x12\x83\x75\x12\x83\x75\x11\xaf\xc1\x12\x83\x75\x0f\x11\x8d\x35" } },
    .{ "PTConvertPrintTicketToDevMode", MethodRecord{ .library = "prntvpt", .import = "PTConvertPrintTicketToDevMode", .signature = "\x00\x07\x11\x79\x11\xaf\xbd\x12\x83\x75\x11\xaf\xc5\x11\xaf\xc1\x0f\x09\x0f\x0f\x11\x8d\x81\x0f\x11\x8d\x35" } },
    .{ "PTConvertDevModeToPrintTicket", MethodRecord{ .library = "prntvpt", .import = "PTConvertDevModeToPrintTicket", .signature = "\x00\x05\x11\x79\x11\xaf\xbd\x09\x0f\x11\x8d\x81\x11\xaf\xc1\x12\x83\x75" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IStream" },
        0xd35 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BSTR" },
        0xd81 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DEVMODEA" },
        0x2fbd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing.PrintTicket", .name = "HPTPROVIDER" },
        0x2fc1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing.PrintTicket", .name = "EPrintTicketScope" },
        0x2fc5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Printing.PrintTicket", .name = "EDefaultDevmodeType" },
        else => null,
    };
}

pub const PRINTTICKET_ISTREAM_APIS = 1;
pub const S_PT_NO_CONFLICT = 262145;
pub const S_PT_CONFLICT_RESOLVED = 262146;
pub const E_PRINTTICKET_FORMAT = 2147745795;
pub const E_PRINTCAPABILITIES_FORMAT = 2147745796;
pub const E_DELTA_PRINTTICKET_FORMAT = 2147745797;
pub const E_PRINTDEVICECAPABILITIES_FORMAT = 2147745798;
pub const kUserDefaultDevmode = 0;
pub const kPrinterDefaultDevmode = 1;
pub const kPTPageScope = 0;
pub const kPTDocumentScope = 1;
pub const kPTJobScope = 2;

pub const aliases = struct {
    pub const EDefaultDevmodeType = i32;
    pub const EPrintTicketScope = i32;
    pub const HPTPROVIDER = ?*anyopaque;
};
