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
    .{ "ComDBOpen", MethodRecord{ .library = "MSPORTS", .import = "ComDBOpen", .signature = "\x00\x01\x08\x0f\x11\xac\x29" } },
    .{ "ComDBClose", MethodRecord{ .library = "MSPORTS", .import = "ComDBClose", .signature = "\x00\x01\x08\x11\xac\x29" } },
    .{ "ComDBGetCurrentPortUsage", MethodRecord{ .library = "MSPORTS", .import = "ComDBGetCurrentPortUsage", .signature = "\x00\x05\x08\x11\xac\x29\x0f\x05\x09\x09\x0f\x09" } },
    .{ "ComDBClaimNextFreePort", MethodRecord{ .library = "MSPORTS", .import = "ComDBClaimNextFreePort", .signature = "\x00\x02\x08\x11\xac\x29\x0f\x09" } },
    .{ "ComDBClaimPort", MethodRecord{ .library = "MSPORTS", .import = "ComDBClaimPort", .signature = "\x00\x04\x08\x11\xac\x29\x09\x11\x59\x0f\x11\x59" } },
    .{ "ComDBReleasePort", MethodRecord{ .library = "MSPORTS", .import = "ComDBReleasePort", .signature = "\x00\x02\x08\x11\xac\x29\x09" } },
    .{ "ComDBResizeDatabase", MethodRecord{ .library = "MSPORTS", .import = "ComDBResizeDatabase", .signature = "\x00\x02\x08\x11\xac\x29\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x2c29 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.SerialCommunication", .name = "HCOMDB" },
        else => null,
    };
}

pub const IOCTL_SERIAL_SET_BAUD_RATE = 1769476;
pub const IOCTL_SERIAL_SET_QUEUE_SIZE = 1769480;
pub const IOCTL_SERIAL_SET_LINE_CONTROL = 1769484;
pub const IOCTL_SERIAL_SET_BREAK_ON = 1769488;
pub const IOCTL_SERIAL_SET_BREAK_OFF = 1769492;
pub const IOCTL_SERIAL_IMMEDIATE_CHAR = 1769496;
pub const IOCTL_SERIAL_SET_TIMEOUTS = 1769500;
pub const IOCTL_SERIAL_GET_TIMEOUTS = 1769504;
pub const IOCTL_SERIAL_SET_DTR = 1769508;
pub const IOCTL_SERIAL_CLR_DTR = 1769512;
pub const IOCTL_SERIAL_RESET_DEVICE = 1769516;
pub const IOCTL_SERIAL_SET_RTS = 1769520;
pub const IOCTL_SERIAL_CLR_RTS = 1769524;
pub const IOCTL_SERIAL_SET_XOFF = 1769528;
pub const IOCTL_SERIAL_SET_XON = 1769532;
pub const IOCTL_SERIAL_GET_WAIT_MASK = 1769536;
pub const IOCTL_SERIAL_SET_WAIT_MASK = 1769540;
pub const IOCTL_SERIAL_WAIT_ON_MASK = 1769544;
pub const IOCTL_SERIAL_PURGE = 1769548;
pub const IOCTL_SERIAL_GET_BAUD_RATE = 1769552;
pub const IOCTL_SERIAL_GET_LINE_CONTROL = 1769556;
pub const IOCTL_SERIAL_GET_CHARS = 1769560;
pub const IOCTL_SERIAL_SET_CHARS = 1769564;
pub const IOCTL_SERIAL_GET_HANDFLOW = 1769568;
pub const IOCTL_SERIAL_SET_HANDFLOW = 1769572;
pub const IOCTL_SERIAL_GET_MODEMSTATUS = 1769576;
pub const IOCTL_SERIAL_GET_COMMSTATUS = 1769580;
pub const IOCTL_SERIAL_XOFF_COUNTER = 1769584;
pub const IOCTL_SERIAL_GET_PROPERTIES = 1769588;
pub const IOCTL_SERIAL_GET_DTRRTS = 1769592;
pub const IOCTL_SERIAL_CONFIG_SIZE = 1769600;
pub const IOCTL_SERIAL_GET_COMMCONFIG = 1769604;
pub const IOCTL_SERIAL_SET_COMMCONFIG = 1769608;
pub const IOCTL_SERIAL_GET_STATS = 1769612;
pub const IOCTL_SERIAL_CLEAR_STATS = 1769616;
pub const IOCTL_SERIAL_GET_MODEM_CONTROL = 1769620;
pub const IOCTL_SERIAL_SET_MODEM_CONTROL = 1769624;
pub const IOCTL_SERIAL_SET_FIFO_CONTROL = 1769628;
pub const IOCTL_SERIAL_APPLY_DEFAULT_CONFIGURATION = 1769632;
pub const IOCTL_SERIAL_SET_INTERVAL_TIMER_RESOLUTION = 1769636;
pub const IOCTL_SERIAL_INTERNAL_DO_WAIT_WAKE = 1769476;
pub const IOCTL_SERIAL_INTERNAL_CANCEL_WAIT_WAKE = 1769480;
pub const IOCTL_SERIAL_INTERNAL_BASIC_SETTINGS = 1769484;
pub const IOCTL_SERIAL_INTERNAL_RESTORE_SETTINGS = 1769488;
pub const SERIAL_EV_RXCHAR = 1;
pub const SERIAL_EV_RXFLAG = 2;
pub const SERIAL_EV_TXEMPTY = 4;
pub const SERIAL_EV_CTS = 8;
pub const SERIAL_EV_DSR = 16;
pub const SERIAL_EV_RLSD = 32;
pub const SERIAL_EV_BREAK = 64;
pub const SERIAL_EV_ERR = 128;
pub const SERIAL_EV_RING = 256;
pub const SERIAL_EV_PERR = 512;
pub const SERIAL_EV_RX80FULL = 1024;
pub const SERIAL_EV_EVENT1 = 2048;
pub const SERIAL_EV_EVENT2 = 4096;
pub const SERIAL_PURGE_TXABORT = 1;
pub const SERIAL_PURGE_RXABORT = 2;
pub const SERIAL_PURGE_TXCLEAR = 4;
pub const SERIAL_PURGE_RXCLEAR = 8;
pub const STOP_BIT_1 = 0;
pub const STOP_BITS_1_5 = 1;
pub const STOP_BITS_2 = 2;
pub const NO_PARITY = 0;
pub const ODD_PARITY = 1;
pub const EVEN_PARITY = 2;
pub const MARK_PARITY = 3;
pub const SPACE_PARITY = 4;
pub const SERIAL_LSRMST_ESCAPE = 0;
pub const SERIAL_LSRMST_LSR_DATA = 1;
pub const SERIAL_LSRMST_LSR_NODATA = 2;
pub const SERIAL_LSRMST_MST = 3;
pub const IOCTL_INTERNAL_SERENUM_REMOVE_SELF = 3604999;
pub const COMDB_MIN_PORTS_ARBITRATED = 256;
pub const COMDB_MAX_PORTS_ARBITRATED = 4096;
pub const CDB_REPORT_BITS = 0;
pub const CDB_REPORT_BYTES = 1;
pub const SerenumFirstHalf = 0;
pub const SerenumSecondHalf = 1;
pub const SerenumWhole = 2;

pub const aliases = struct {
    pub const SERENUM_PORTION = i32;
    pub const HCOMDB = ?*anyopaque;
    pub const PSERENUM_READPORT = ?*const anyopaque;
    pub const PSERENUM_WRITEPORT = ?*const anyopaque;
};
