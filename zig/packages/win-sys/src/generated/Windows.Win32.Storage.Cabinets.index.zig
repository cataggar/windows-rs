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
    .{ "FCICreate", MethodRecord{ .library = "Cabinet", .import = "FCICreate", .signature = "\x00\x0d\x0f\x01\x0f\x11\xbc\xf1\x12\xbc\xf5\x12\xbc\xf9\x12\xbc\xfd\x12\xbd\x01\x12\xbd\x05\x12\xbd\x09\x12\xbd\x0d\x12\xbd\x11\x12\xbd\x15\x12\xbd\x19\x0f\x11\xbd\x1d\x0f\x01" } },
    .{ "FCIAddFile", MethodRecord{ .library = "Cabinet", .import = "FCIAddFile", .signature = "\x00\x08\x11\x59\x0f\x01\x11\x3d\x11\x3d\x11\x59\x12\xbd\x21\x12\xbd\x25\x12\xbd\x29\x07" } },
    .{ "FCIFlushCabinet", MethodRecord{ .library = "Cabinet", .import = "FCIFlushCabinet", .signature = "\x00\x04\x11\x59\x0f\x01\x11\x59\x12\xbd\x21\x12\xbd\x25" } },
    .{ "FCIFlushFolder", MethodRecord{ .library = "Cabinet", .import = "FCIFlushFolder", .signature = "\x00\x03\x11\x59\x0f\x01\x12\xbd\x21\x12\xbd\x25" } },
    .{ "FCIDestroy", MethodRecord{ .library = "Cabinet", .import = "FCIDestroy", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "FDICreate", MethodRecord{ .library = "Cabinet", .import = "FDICreate", .signature = "\x00\x09\x0f\x01\x12\xbd\x2d\x12\xbd\x31\x12\xbd\x35\x12\xbd\x39\x12\xbd\x3d\x12\xbd\x41\x12\xbd\x45\x11\x9f\xf1\x0f\x11\xbc\xf1" } },
    .{ "FDIIsCabinet", MethodRecord{ .library = "Cabinet", .import = "FDIIsCabinet", .signature = "\x00\x03\x11\x59\x0f\x01\x18\x0f\x11\xbd\x49" } },
    .{ "FDICopy", MethodRecord{ .library = "Cabinet", .import = "FDICopy", .signature = "\x00\x07\x11\x59\x0f\x01\x11\x3d\x11\x3d\x08\x12\xbd\x4d\x12\xbd\x51\x0f\x01" } },
    .{ "FDIDestroy", MethodRecord{ .library = "Cabinet", .import = "FDIDestroy", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "FDITruncateCabinet", MethodRecord{ .library = "Cabinet", .import = "FDITruncateCabinet", .signature = "\x00\x03\x11\x59\x0f\x01\x11\x3d\x07" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x1ff1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "FDICREATE_CPU_TYPE" },
        0x3cf1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "ERF" },
        0x3cf5 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFCIFILEPLACED" },
        0x3cf9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFCIALLOC" },
        0x3cfd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFCIFREE" },
        0x3d01 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFCIOPEN" },
        0x3d05 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFCIREAD" },
        0x3d09 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFCIWRITE" },
        0x3d0d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFCICLOSE" },
        0x3d11 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFCISEEK" },
        0x3d15 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFCIDELETE" },
        0x3d19 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFCIGETTEMPFILE" },
        0x3d1d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "CCAB" },
        0x3d21 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFCIGETNEXTCABINET" },
        0x3d25 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFCISTATUS" },
        0x3d29 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFCIGETOPENINFO" },
        0x3d2d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNALLOC" },
        0x3d31 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFREE" },
        0x3d35 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNOPEN" },
        0x3d39 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNREAD" },
        0x3d3d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNWRITE" },
        0x3d41 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNCLOSE" },
        0x3d45 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNSEEK" },
        0x3d49 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "FDICABINETINFO" },
        0x3d4d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFDINOTIFY" },
        0x3d51 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Cabinets", .name = "PFNFDIDECRYPT" },
        else => null,
    };
}

pub const cpuUNKNOWN = -1;
pub const cpu80286 = 0;
pub const cpu80386 = 1;
pub const INCLUDED_FCI = 1;
pub const _A_NAME_IS_UTF = 128;
pub const _A_EXEC = 64;
pub const statusFile = 0;
pub const statusFolder = 1;
pub const statusCabinet = 2;
pub const INCLUDED_TYPES_FCI_FDI = 1;
pub const CB_MAX_DISK = 2147483647;
pub const CB_MAX_FILENAME = 256;
pub const CB_MAX_CABINET_NAME = 256;
pub const CB_MAX_CAB_PATH = 256;
pub const CB_MAX_DISK_NAME = 256;
pub const tcompMASK_TYPE = 15;
pub const tcompTYPE_NONE = 0;
pub const tcompTYPE_MSZIP = 1;
pub const tcompTYPE_QUANTUM = 2;
pub const tcompTYPE_LZX = 3;
pub const tcompBAD = 15;
pub const tcompMASK_LZX_WINDOW = 7936;
pub const tcompLZX_WINDOW_LO = 3840;
pub const tcompLZX_WINDOW_HI = 5376;
pub const tcompSHIFT_LZX_WINDOW = 8;
pub const tcompMASK_QUANTUM_LEVEL = 240;
pub const tcompQUANTUM_LEVEL_LO = 16;
pub const tcompQUANTUM_LEVEL_HI = 112;
pub const tcompSHIFT_QUANTUM_LEVEL = 4;
pub const tcompMASK_QUANTUM_MEM = 7936;
pub const tcompQUANTUM_MEM_LO = 2560;
pub const tcompQUANTUM_MEM_HI = 5376;
pub const tcompSHIFT_QUANTUM_MEM = 8;
pub const tcompMASK_RESERVED = 57344;
pub const INCLUDED_FDI = 1;
pub const FCIERR_NONE = 0;
pub const FCIERR_OPEN_SRC = 1;
pub const FCIERR_READ_SRC = 2;
pub const FCIERR_ALLOC_FAIL = 3;
pub const FCIERR_TEMP_FILE = 4;
pub const FCIERR_BAD_COMPR_TYPE = 5;
pub const FCIERR_CAB_FILE = 6;
pub const FCIERR_USER_ABORT = 7;
pub const FCIERR_MCI_FAIL = 8;
pub const FCIERR_CAB_FORMAT_LIMIT = 9;
pub const FDIERROR_NONE = 0;
pub const FDIERROR_CABINET_NOT_FOUND = 1;
pub const FDIERROR_NOT_A_CABINET = 2;
pub const FDIERROR_UNKNOWN_CABINET_VERSION = 3;
pub const FDIERROR_CORRUPT_CABINET = 4;
pub const FDIERROR_ALLOC_FAIL = 5;
pub const FDIERROR_BAD_COMPR_TYPE = 6;
pub const FDIERROR_MDI_FAIL = 7;
pub const FDIERROR_TARGET_FILE = 8;
pub const FDIERROR_RESERVE_MISMATCH = 9;
pub const FDIERROR_WRONG_CABINET = 10;
pub const FDIERROR_USER_ABORT = 11;
pub const FDIERROR_EOF = 12;
pub const fdidtNEW_CABINET = 0;
pub const fdidtNEW_FOLDER = 1;
pub const fdidtDECRYPT = 2;
pub const fdintCABINET_INFO = 0;
pub const fdintPARTIAL_FILE = 1;
pub const fdintCOPY_FILE = 2;
pub const fdintCLOSE_FILE_INFO = 3;
pub const fdintNEXT_CABINET = 4;
pub const fdintENUMERATE = 5;

pub const aliases = struct {
    pub const FDICREATE_CPU_TYPE = i32;
    pub const FCIERROR = i32;
    pub const FDIERROR = i32;
    pub const FDIDECRYPTTYPE = i32;
    pub const FDINOTIFICATIONTYPE = i32;
};
