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
    .{ "Netbios", MethodRecord{ .library = "NETAPI32", .import = "Netbios", .signature = "\x00\x01\x05\x0f\x11\xb7\x89" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x3789 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.NetBios", .name = "NCB" },
        else => null,
    };
}

pub const NCBNAMSZ = 16;
pub const MAX_LANA = 254;
pub const NAME_FLAGS_MASK = 135;
pub const GROUP_NAME = 128;
pub const UNIQUE_NAME = 0;
pub const REGISTERING = 0;
pub const REGISTERED = 4;
pub const DEREGISTERED = 5;
pub const DUPLICATE = 6;
pub const DUPLICATE_DEREG = 7;
pub const LISTEN_OUTSTANDING = 1;
pub const CALL_PENDING = 2;
pub const SESSION_ESTABLISHED = 3;
pub const HANGUP_PENDING = 4;
pub const HANGUP_COMPLETE = 5;
pub const SESSION_ABORTED = 6;
pub const NCBCALL = 16;
pub const NCBLISTEN = 17;
pub const NCBHANGUP = 18;
pub const NCBSEND = 20;
pub const NCBRECV = 21;
pub const NCBRECVANY = 22;
pub const NCBCHAINSEND = 23;
pub const NCBDGSEND = 32;
pub const NCBDGRECV = 33;
pub const NCBDGSENDBC = 34;
pub const NCBDGRECVBC = 35;
pub const NCBADDNAME = 48;
pub const NCBDELNAME = 49;
pub const NCBRESET = 50;
pub const NCBASTAT = 51;
pub const NCBSSTAT = 52;
pub const NCBCANCEL = 53;
pub const NCBADDGRNAME = 54;
pub const NCBENUM = 55;
pub const NCBUNLINK = 112;
pub const NCBSENDNA = 113;
pub const NCBCHAINSENDNA = 114;
pub const NCBLANSTALERT = 115;
pub const NCBACTION = 119;
pub const NCBFINDNAME = 120;
pub const NCBTRACE = 121;
pub const ASYNCH = 128;
pub const NRC_GOODRET = 0;
pub const NRC_BUFLEN = 1;
pub const NRC_ILLCMD = 3;
pub const NRC_CMDTMO = 5;
pub const NRC_INCOMP = 6;
pub const NRC_BADDR = 7;
pub const NRC_SNUMOUT = 8;
pub const NRC_NORES = 9;
pub const NRC_SCLOSED = 10;
pub const NRC_CMDCAN = 11;
pub const NRC_DUPNAME = 13;
pub const NRC_NAMTFUL = 14;
pub const NRC_ACTSES = 15;
pub const NRC_LOCTFUL = 17;
pub const NRC_REMTFUL = 18;
pub const NRC_ILLNN = 19;
pub const NRC_NOCALL = 20;
pub const NRC_NOWILD = 21;
pub const NRC_INUSE = 22;
pub const NRC_NAMERR = 23;
pub const NRC_SABORT = 24;
pub const NRC_NAMCONF = 25;
pub const NRC_IFBUSY = 33;
pub const NRC_TOOMANY = 34;
pub const NRC_BRIDGE = 35;
pub const NRC_CANOCCR = 36;
pub const NRC_CANCEL = 38;
pub const NRC_DUPENV = 48;
pub const NRC_ENVNOTDEF = 52;
pub const NRC_OSRESNOTAV = 53;
pub const NRC_MAXAPPS = 54;
pub const NRC_NOSAPS = 55;
pub const NRC_NORESOURCES = 56;
pub const NRC_INVADDRESS = 57;
pub const NRC_INVDDID = 59;
pub const NRC_LOCKFAIL = 60;
pub const NRC_OPENERR = 63;
pub const NRC_SYSTEM = 64;
pub const NRC_PENDING = 255;
