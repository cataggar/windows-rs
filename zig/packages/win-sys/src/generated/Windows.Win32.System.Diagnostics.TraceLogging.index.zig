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

pub const method_def_by_name = std.static_string_map.StaticStringMap(MethodRecord).initComptime(.{});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const WINEVENT_CHANNEL_CLASSIC_TRACE = 0;
pub const WINEVENT_CHANNEL_GLOBAL_SYSTEM = 8;
pub const WINEVENT_CHANNEL_GLOBAL_APPLICATION = 9;
pub const WINEVENT_CHANNEL_GLOBAL_SECURITY = 10;
pub const WINEVENT_CHANNEL_TRACELOGGING = 11;
pub const WINEVENT_CHANNEL_PROVIDERMETADATA = 12;
pub const WINEVENT_LEVEL_LOG_ALWAYS = 0;
pub const WINEVENT_LEVEL_CRITICAL = 1;
pub const WINEVENT_LEVEL_ERROR = 2;
pub const WINEVENT_LEVEL_WARNING = 3;
pub const WINEVENT_LEVEL_INFO = 4;
pub const WINEVENT_LEVEL_VERBOSE = 5;
pub const WINEVENT_LEVEL_RESERVED_6 = 6;
pub const WINEVENT_LEVEL_RESERVED_7 = 7;
pub const WINEVENT_LEVEL_RESERVED_8 = 8;
pub const WINEVENT_LEVEL_RESERVED_9 = 9;
pub const WINEVENT_LEVEL_RESERVED_10 = 10;
pub const WINEVENT_LEVEL_RESERVED_11 = 11;
pub const WINEVENT_LEVEL_RESERVED_12 = 12;
pub const WINEVENT_LEVEL_RESERVED_13 = 13;
pub const WINEVENT_LEVEL_RESERVED_14 = 14;
pub const WINEVENT_LEVEL_RESERVED_15 = 15;
pub const WINEVENT_OPCODE_INFO = 0;
pub const WINEVENT_OPCODE_START = 1;
pub const WINEVENT_OPCODE_STOP = 2;
pub const WINEVENT_OPCODE_DC_START = 3;
pub const WINEVENT_OPCODE_DC_STOP = 4;
pub const WINEVENT_OPCODE_EXTENSION = 5;
pub const WINEVENT_OPCODE_REPLY = 6;
pub const WINEVENT_OPCODE_RESUME = 7;
pub const WINEVENT_OPCODE_SUSPEND = 8;
pub const WINEVENT_OPCODE_SEND = 9;
pub const WINEVENT_OPCODE_RECEIVE = 240;
pub const WINEVENT_OPCODE_RESERVED_241 = 241;
pub const WINEVENT_OPCODE_RESERVED_242 = 242;
pub const WINEVENT_OPCODE_RESERVED_243 = 243;
pub const WINEVENT_OPCODE_RESERVED_244 = 244;
pub const WINEVENT_OPCODE_RESERVED_245 = 245;
pub const WINEVENT_OPCODE_RESERVED_246 = 246;
pub const WINEVENT_OPCODE_RESERVED_247 = 247;
pub const WINEVENT_OPCODE_RESERVED_248 = 248;
pub const WINEVENT_OPCODE_RESERVED_249 = 249;
pub const WINEVENT_OPCODE_RESERVED_250 = 250;
pub const WINEVENT_OPCODE_RESERVED_251 = 251;
pub const WINEVENT_OPCODE_RESERVED_252 = 252;
pub const WINEVENT_OPCODE_RESERVED_253 = 253;
pub const WINEVENT_OPCODE_RESERVED_254 = 254;
pub const WINEVENT_OPCODE_RESERVED_255 = 255;
pub const WINEVENT_TASK_NONE = 0;
pub const WINEVT_KEYWORD_ANY = 0;
pub const WINEVENT_KEYWORD_RESPONSE_TIME = 281474976710656;
pub const WINEVENT_KEYWORD_RESERVED_49 = 562949953421312;
pub const WINEVENT_KEYWORD_WDI_DIAG = 1125899906842624;
pub const WINEVENT_KEYWORD_SQM = 2251799813685248;
pub const WINEVENT_KEYWORD_AUDIT_FAILURE = 4503599627370496;
pub const WINEVENT_KEYWORD_AUDIT_SUCCESS = 9007199254740992;
pub const WINEVENT_KEYWORD_CORRELATION_HINT = 18014398509481984;
pub const WINEVENT_KEYWORD_EVENTLOG_CLASSIC = 36028797018963968;
pub const WINEVENT_KEYWORD_RESERVED_56 = 72057594037927936;
pub const WINEVENT_KEYWORD_RESERVED_57 = 144115188075855872;
pub const WINEVENT_KEYWORD_RESERVED_58 = 288230376151711744;
pub const WINEVENT_KEYWORD_RESERVED_59 = 576460752303423488;
pub const WINEVENT_KEYWORD_RESERVED_60 = 1152921504606846976;
pub const WINEVENT_KEYWORD_RESERVED_61 = 2305843009213693952;
pub const WINEVENT_KEYWORD_RESERVED_62 = 4611686018427387904;
pub const WINEVENT_KEYWORD_RESERVED_63 = 9223372036854775808;
pub const MSG_category_Devices = 1;
pub const MSG_category_Disk = 2;
pub const MSG_category_Printers = 3;
pub const MSG_category_Services = 4;
pub const MSG_category_Shell = 5;
pub const MSG_category_SystemEvent = 6;
pub const MSG_category_Network = 7;
pub const MSG_channel_Application = 256;
pub const MSG_channel_Security = 257;
pub const MSG_channel_System = 258;
pub const MSG_keyword_AnyKeyword = 268435456;
pub const MSG_keyword_ResponseTime = 268435505;
pub const MSG_keyword_WDIDiag = 268435507;
pub const MSG_keyword_SQM = 268435508;
pub const MSG_keyword_AuditFailure = 268435509;
pub const MSG_keyword_AuditSuccess = 268435510;
pub const MSG_keyword_CorrelationHint = 268435511;
pub const MSG_keyword_Classic = 268435512;
pub const MSG_opcode_Info = 805306368;
pub const MSG_opcode_Start = 805371904;
pub const MSG_opcode_Stop = 805437440;
pub const MSG_opcode_DCStart = 805502976;
pub const MSG_opcode_DCStop = 805568512;
pub const MSG_opcode_Extension = 805634048;
pub const MSG_opcode_Reply = 805699584;
pub const MSG_opcode_Resume = 805765120;
pub const MSG_opcode_Suspend = 805830656;
pub const MSG_opcode_Send = 805896192;
pub const MSG_opcode_Receive = 821035008;
pub const MSG_level_LogAlways = 1342177280;
pub const MSG_level_Critical = 1342177281;
pub const MSG_level_Error = 1342177282;
pub const MSG_level_Warning = 1342177283;
pub const MSG_level_Informational = 1342177284;
pub const MSG_level_Verbose = 1342177285;
pub const MSG_task_None = 1879048192;
pub const MSG_channel_TraceClassic = -1879048191;
pub const MSG_channel_TraceLogging = -1879048190;
pub const MSG_channel_ProviderMetadata = -1879048189;
