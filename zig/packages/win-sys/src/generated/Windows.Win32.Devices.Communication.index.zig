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
    .{ "ClearCommBreak", MethodRecord{ .library = "KERNEL32", .import = "ClearCommBreak", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "ClearCommError", MethodRecord{ .library = "KERNEL32", .import = "ClearCommError", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\x89\x51\x0f\x11\xa9\xfd" } },
    .{ "SetupComm", MethodRecord{ .library = "KERNEL32", .import = "SetupComm", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x09" } },
    .{ "EscapeCommFunction", MethodRecord{ .library = "KERNEL32", .import = "EscapeCommFunction", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x89\x5d" } },
    .{ "GetCommConfig", MethodRecord{ .library = "KERNEL32", .import = "GetCommConfig", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xaa\x01\x0f\x09" } },
    .{ "GetCommMask", MethodRecord{ .library = "KERNEL32", .import = "GetCommMask", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x89\x59" } },
    .{ "GetCommProperties", MethodRecord{ .library = "KERNEL32", .import = "GetCommProperties", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xaa\x05" } },
    .{ "GetCommModemStatus", MethodRecord{ .library = "KERNEL32", .import = "GetCommModemStatus", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x89\x4d" } },
    .{ "GetCommState", MethodRecord{ .library = "KERNEL32", .import = "GetCommState", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xaa\x09" } },
    .{ "GetCommTimeouts", MethodRecord{ .library = "KERNEL32", .import = "GetCommTimeouts", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x9a\x81" } },
    .{ "PurgeComm", MethodRecord{ .library = "KERNEL32", .import = "PurgeComm", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x89\x55" } },
    .{ "SetCommBreak", MethodRecord{ .library = "KERNEL32", .import = "SetCommBreak", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "SetCommConfig", MethodRecord{ .library = "KERNEL32", .import = "SetCommConfig", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xaa\x01\x09" } },
    .{ "SetCommMask", MethodRecord{ .library = "KERNEL32", .import = "SetCommMask", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x89\x59" } },
    .{ "SetCommState", MethodRecord{ .library = "KERNEL32", .import = "SetCommState", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xaa\x09" } },
    .{ "SetCommTimeouts", MethodRecord{ .library = "KERNEL32", .import = "SetCommTimeouts", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x9a\x81" } },
    .{ "TransmitCommChar", MethodRecord{ .library = "KERNEL32", .import = "TransmitCommChar", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x8d\x5d" } },
    .{ "WaitCommEvent", MethodRecord{ .library = "KERNEL32", .import = "WaitCommEvent", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\x89\x59\x0f\x11\x8b\xed" } },
    .{ "OpenCommPort", MethodRecord{ .library = "api-ms-win-core-comm-l1-1-1", .import = "OpenCommPort", .signature = "\x00\x03\x11\x80\x85\x09\x09\x09" } },
    .{ "GetCommPorts", MethodRecord{ .library = "api-ms-win-core-comm-l1-1-2", .import = "GetCommPorts", .signature = "\x00\x03\x09\x0f\x09\x09\x0f\x09" } },
    .{ "BuildCommDCBA", MethodRecord{ .library = "KERNEL32", .import = "BuildCommDCBA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x11\xaa\x09" } },
    .{ "BuildCommDCBW", MethodRecord{ .library = "KERNEL32", .import = "BuildCommDCBW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x11\xaa\x09" } },
    .{ "BuildCommDCBAndTimeoutsA", MethodRecord{ .library = "KERNEL32", .import = "BuildCommDCBAndTimeoutsA", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x11\xaa\x09\x0f\x11\x9a\x81" } },
    .{ "BuildCommDCBAndTimeoutsW", MethodRecord{ .library = "KERNEL32", .import = "BuildCommDCBAndTimeoutsW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x11\xaa\x09\x0f\x11\x9a\x81" } },
    .{ "CommConfigDialogA", MethodRecord{ .library = "KERNEL32", .import = "CommConfigDialogA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x25\x0f\x11\xaa\x01" } },
    .{ "CommConfigDialogW", MethodRecord{ .library = "KERNEL32", .import = "CommConfigDialogW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x25\x0f\x11\xaa\x01" } },
    .{ "GetDefaultCommConfigA", MethodRecord{ .library = "KERNEL32", .import = "GetDefaultCommConfigA", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x11\xaa\x01\x0f\x09" } },
    .{ "GetDefaultCommConfigW", MethodRecord{ .library = "KERNEL32", .import = "GetDefaultCommConfigW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x11\xaa\x01\x0f\x09" } },
    .{ "SetDefaultCommConfigA", MethodRecord{ .library = "KERNEL32", .import = "SetDefaultCommConfigA", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x11\xaa\x01\x09" } },
    .{ "SetDefaultCommConfigW", MethodRecord{ .library = "KERNEL32", .import = "SetDefaultCommConfigW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x11\xaa\x01\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x94d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Communication", .name = "MODEM_STATUS_FLAGS" },
        0x951 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Communication", .name = "CLEAR_COMM_ERROR_FLAGS" },
        0x955 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Communication", .name = "PURGE_COMM_FLAGS" },
        0x959 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Communication", .name = "COMM_EVENT_MASK" },
        0x95d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Communication", .name = "ESCAPE_COMM_FUNCTION" },
        0xbed => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED" },
        0xd5d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "CHAR" },
        0x1a81 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Communication", .name = "COMMTIMEOUTS" },
        0x29fd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Communication", .name = "COMSTAT" },
        0x2a01 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Communication", .name = "COMMCONFIG" },
        0x2a05 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Communication", .name = "COMMPROP" },
        0x2a09 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Communication", .name = "DCB" },
        else => null,
    };
}

pub const MS_CTS_ON = 16;
pub const MS_DSR_ON = 32;
pub const MS_RING_ON = 64;
pub const MS_RLSD_ON = 128;
pub const CE_BREAK = 16;
pub const CE_FRAME = 8;
pub const CE_OVERRUN = 2;
pub const CE_RXOVER = 1;
pub const CE_RXPARITY = 4;
pub const PURGE_RXABORT = 2;
pub const PURGE_RXCLEAR = 8;
pub const PURGE_TXABORT = 1;
pub const PURGE_TXCLEAR = 4;
pub const EV_BREAK = 64;
pub const EV_CTS = 8;
pub const EV_DSR = 16;
pub const EV_ERR = 128;
pub const EV_EVENT1 = 2048;
pub const EV_EVENT2 = 4096;
pub const EV_PERR = 512;
pub const EV_RING = 256;
pub const EV_RLSD = 32;
pub const EV_RX80FULL = 1024;
pub const EV_RXCHAR = 1;
pub const EV_RXFLAG = 2;
pub const EV_TXEMPTY = 4;
pub const CLRBREAK = 9;
pub const CLRDTR = 6;
pub const CLRRTS = 4;
pub const SETBREAK = 8;
pub const SETDTR = 5;
pub const SETRTS = 3;
pub const SETXOFF = 1;
pub const SETXON = 2;
pub const DIALOPTION_BILLING = 64;
pub const DIALOPTION_DIALTONE = 256;
pub const DIALOPTION_QUIET = 128;
pub const MDMSPKR_CALLSETUP = 8;
pub const MDMSPKR_DIAL = 2;
pub const MDMSPKR_OFF = 1;
pub const MDMSPKR_ON = 4;
pub const STOPBITS_10 = 1;
pub const STOPBITS_15 = 2;
pub const STOPBITS_20 = 4;
pub const PARITY_NONE = 256;
pub const PARITY_ODD = 512;
pub const PARITY_EVEN = 1024;
pub const PARITY_MARK = 2048;
pub const PARITY_SPACE = 4096;
pub const MDMVOL_HIGH = 2;
pub const MDMVOL_LOW = 0;
pub const MDMVOL_MEDIUM = 1;
pub const MDMVOLFLAG_HIGH = 4;
pub const MDMVOLFLAG_LOW = 1;
pub const MDMVOLFLAG_MEDIUM = 2;
pub const MDMSPKRFLAG_CALLSETUP = 8;
pub const MDMSPKRFLAG_DIAL = 2;
pub const MDMSPKRFLAG_OFF = 1;
pub const MDMSPKRFLAG_ON = 4;
pub const ONESTOPBIT = 0;
pub const ONE5STOPBITS = 1;
pub const TWOSTOPBITS = 2;
pub const EVENPARITY = 2;
pub const MARKPARITY = 3;
pub const NOPARITY = 0;
pub const ODDPARITY = 1;
pub const SPACEPARITY = 4;
pub const MDM_COMPRESSION = 1;
pub const MDM_ERROR_CONTROL = 2;
pub const MDM_FORCED_EC = 4;
pub const MDM_CELLULAR = 8;
pub const MDM_FLOWCONTROL_HARD = 16;
pub const MDM_FLOWCONTROL_SOFT = 32;
pub const MDM_CCITT_OVERRIDE = 64;
pub const MDM_SPEED_ADJUST = 128;
pub const MDM_TONE_DIAL = 256;
pub const MDM_BLIND_DIAL = 512;
pub const MDM_V23_OVERRIDE = 1024;
pub const MDM_DIAGNOSTICS = 2048;
pub const MDM_MASK_BEARERMODE = 61440;
pub const MDM_SHIFT_BEARERMODE = 12;
pub const MDM_MASK_PROTOCOLID = 983040;
pub const MDM_SHIFT_PROTOCOLID = 16;
pub const MDM_MASK_PROTOCOLDATA = 267386880;
pub const MDM_SHIFT_PROTOCOLDATA = 20;
pub const MDM_SHIFT_PROTOCOLINFO = 16;
pub const MDM_SHIFT_EXTENDEDINFO = 12;
pub const MDM_BEARERMODE_ANALOG = 0;
pub const MDM_BEARERMODE_ISDN = 1;
pub const MDM_BEARERMODE_GSM = 2;
pub const MDM_PROTOCOLID_DEFAULT = 0;
pub const MDM_PROTOCOLID_HDLCPPP = 1;
pub const MDM_PROTOCOLID_V128 = 2;
pub const MDM_PROTOCOLID_X75 = 3;
pub const MDM_PROTOCOLID_V110 = 4;
pub const MDM_PROTOCOLID_V120 = 5;
pub const MDM_PROTOCOLID_AUTO = 6;
pub const MDM_PROTOCOLID_ANALOG = 7;
pub const MDM_PROTOCOLID_GPRS = 8;
pub const MDM_PROTOCOLID_PIAFS = 9;
pub const MDM_SHIFT_HDLCPPP_SPEED = 0;
pub const MDM_MASK_HDLCPPP_SPEED = 7;
pub const MDM_HDLCPPP_SPEED_DEFAULT = 0;
pub const MDM_HDLCPPP_SPEED_64K = 1;
pub const MDM_HDLCPPP_SPEED_56K = 2;
pub const MDM_SHIFT_HDLCPPP_AUTH = 3;
pub const MDM_MASK_HDLCPPP_AUTH = 56;
pub const MDM_HDLCPPP_AUTH_DEFAULT = 0;
pub const MDM_HDLCPPP_AUTH_NONE = 1;
pub const MDM_HDLCPPP_AUTH_PAP = 2;
pub const MDM_HDLCPPP_AUTH_CHAP = 3;
pub const MDM_HDLCPPP_AUTH_MSCHAP = 4;
pub const MDM_SHIFT_HDLCPPP_ML = 6;
pub const MDM_MASK_HDLCPPP_ML = 192;
pub const MDM_HDLCPPP_ML_DEFAULT = 0;
pub const MDM_HDLCPPP_ML_NONE = 1;
pub const MDM_HDLCPPP_ML_2 = 2;
pub const MDM_SHIFT_V120_SPEED = 0;
pub const MDM_MASK_V120_SPEED = 7;
pub const MDM_V120_SPEED_DEFAULT = 0;
pub const MDM_V120_SPEED_64K = 1;
pub const MDM_V120_SPEED_56K = 2;
pub const MDM_SHIFT_V120_ML = 6;
pub const MDM_MASK_V120_ML = 192;
pub const MDM_V120_ML_DEFAULT = 0;
pub const MDM_V120_ML_NONE = 1;
pub const MDM_V120_ML_2 = 2;
pub const MDM_SHIFT_X75_DATA = 0;
pub const MDM_MASK_X75_DATA = 7;
pub const MDM_X75_DATA_DEFAULT = 0;
pub const MDM_X75_DATA_64K = 1;
pub const MDM_X75_DATA_128K = 2;
pub const MDM_X75_DATA_T_70 = 3;
pub const MDM_X75_DATA_BTX = 4;
pub const MDM_SHIFT_V110_SPEED = 0;
pub const MDM_MASK_V110_SPEED = 15;
pub const MDM_V110_SPEED_DEFAULT = 0;
pub const MDM_V110_SPEED_1DOT2K = 1;
pub const MDM_V110_SPEED_2DOT4K = 2;
pub const MDM_V110_SPEED_4DOT8K = 3;
pub const MDM_V110_SPEED_9DOT6K = 4;
pub const MDM_V110_SPEED_12DOT0K = 5;
pub const MDM_V110_SPEED_14DOT4K = 6;
pub const MDM_V110_SPEED_19DOT2K = 7;
pub const MDM_V110_SPEED_28DOT8K = 8;
pub const MDM_V110_SPEED_38DOT4K = 9;
pub const MDM_V110_SPEED_57DOT6K = 10;
pub const MDM_SHIFT_AUTO_SPEED = 0;
pub const MDM_MASK_AUTO_SPEED = 7;
pub const MDM_AUTO_SPEED_DEFAULT = 0;
pub const MDM_SHIFT_AUTO_ML = 6;
pub const MDM_MASK_AUTO_ML = 192;
pub const MDM_AUTO_ML_DEFAULT = 0;
pub const MDM_AUTO_ML_NONE = 1;
pub const MDM_AUTO_ML_2 = 2;
pub const MDM_ANALOG_RLP_ON = 0;
pub const MDM_ANALOG_RLP_OFF = 1;
pub const MDM_ANALOG_V34 = 2;
pub const MDM_PIAFS_INCOMING = 0;
pub const MDM_PIAFS_OUTGOING = 1;
pub const MAXLENGTH_NAI = 72;
pub const MAXLENGTH_UICCDATASTORE = 10;

pub const aliases = struct {
    pub const MODEM_STATUS_FLAGS = u32;
    pub const CLEAR_COMM_ERROR_FLAGS = u32;
    pub const PURGE_COMM_FLAGS = u32;
    pub const COMM_EVENT_MASK = u32;
    pub const ESCAPE_COMM_FUNCTION = u32;
    pub const MODEMDEVCAPS_DIAL_OPTIONS = u32;
    pub const MODEMSETTINGS_SPEAKER_MODE = u32;
    pub const COMMPROP_STOP_PARITY = u16;
    pub const MODEM_SPEAKER_VOLUME = u32;
    pub const MODEMDEVCAPS_SPEAKER_VOLUME = u32;
    pub const MODEMDEVCAPS_SPEAKER_MODE = u32;
    pub const DCB_STOP_BITS = u8;
    pub const DCB_PARITY = u8;
};
