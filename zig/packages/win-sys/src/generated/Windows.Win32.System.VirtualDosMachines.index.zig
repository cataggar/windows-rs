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

pub const VDMCONTEXT_i386 = 65536;
pub const VDMCONTEXT_i486 = 65536;
pub const VDM_KGDT_R3_CODE = 24;
pub const VDM_MAXIMUM_SUPPORTED_EXTENSION = 512;
pub const V86FLAGS_CARRY = 1;
pub const V86FLAGS_PARITY = 4;
pub const V86FLAGS_AUXCARRY = 16;
pub const V86FLAGS_ZERO = 64;
pub const V86FLAGS_SIGN = 128;
pub const V86FLAGS_TRACE = 256;
pub const V86FLAGS_INTERRUPT = 512;
pub const V86FLAGS_DIRECTION = 1024;
pub const V86FLAGS_OVERFLOW = 2048;
pub const V86FLAGS_IOPL = 12288;
pub const V86FLAGS_IOPL_BITS = 18;
pub const V86FLAGS_RESUME = 65536;
pub const V86FLAGS_V86 = 131072;
pub const V86FLAGS_ALIGNMENT = 262144;
pub const STATUS_VDM_EVENT = 1073741829;
pub const DBG_SEGLOAD = 0;
pub const DBG_SEGMOVE = 1;
pub const DBG_SEGFREE = 2;
pub const DBG_MODLOAD = 3;
pub const DBG_MODFREE = 4;
pub const DBG_SINGLESTEP = 5;
pub const DBG_BREAK = 6;
pub const DBG_GPFAULT = 7;
pub const DBG_DIVOVERFLOW = 8;
pub const DBG_INSTRFAULT = 9;
pub const DBG_TASKSTART = 10;
pub const DBG_TASKSTOP = 11;
pub const DBG_DLLSTART = 12;
pub const DBG_DLLSTOP = 13;
pub const DBG_ATTACH = 14;
pub const DBG_TOOLHELP = 15;
pub const DBG_STACKFAULT = 16;
pub const DBG_WOWINIT = 17;
pub const DBG_TEMPBP = 18;
pub const DBG_MODMOVE = 19;
pub const DBG_INIT = 20;
pub const DBG_GPFAULT2 = 21;
pub const VDMEVENT_NEEDS_INTERACTIVE = 32768;
pub const VDMEVENT_VERBOSE = 16384;
pub const VDMEVENT_PE = 8192;
pub const VDMEVENT_ALLFLAGS = 57344;
pub const VDMEVENT_V86 = 1;
pub const VDMEVENT_PM16 = 2;
pub const MAX_MODULE_NAME = 9;
pub const MAX_PATH16 = 255;
pub const SN_CODE = 0;
pub const SN_DATA = 1;
pub const SN_V86 = 2;
pub const GLOBAL_ALL = 0;
pub const GLOBAL_LRU = 1;
pub const GLOBAL_FREE = 2;
pub const GT_UNKNOWN = 0;
pub const GT_DGROUP = 1;
pub const GT_DATA = 2;
pub const GT_CODE = 3;
pub const GT_TASK = 4;
pub const GT_RESOURCE = 5;
pub const GT_MODULE = 6;
pub const GT_FREE = 7;
pub const GT_INTERNAL = 8;
pub const GT_SENTINEL = 9;
pub const GT_BURGERMASTER = 10;
pub const GD_USERDEFINED = 0;
pub const GD_CURSORCOMPONENT = 1;
pub const GD_BITMAP = 2;
pub const GD_ICONCOMPONENT = 3;
pub const GD_MENU = 4;
pub const GD_DIALOG = 5;
pub const GD_STRING = 6;
pub const GD_FONTDIR = 7;
pub const GD_FONT = 8;
pub const GD_ACCELERATORS = 9;
pub const GD_RCDATA = 10;
pub const GD_ERRTABLE = 11;
pub const GD_CURSOR = 12;
pub const GD_ICON = 14;
pub const GD_NAMETABLE = 15;
pub const GD_MAX_RESOURCE = 15;
pub const WOW_SYSTEM = 1;
pub const VDMDBG_BREAK_DOSTASK = 1;
pub const VDMDBG_BREAK_WOWTASK = 2;
pub const VDMDBG_BREAK_LOADDLL = 4;
pub const VDMDBG_BREAK_EXCEPTIONS = 8;
pub const VDMDBG_BREAK_DEBUGGER = 16;
pub const VDMDBG_TRACE_HISTORY = 128;
pub const VDMDBG_BREAK_DIVIDEBYZERO = 256;
pub const VDMDBG_INITIAL_FLAGS = 256;
pub const VDMDBG_MAX_SYMBOL_BUFFER = 256;
pub const VDMADDR_V86 = 2;
pub const VDMADDR_PM16 = 4;
pub const VDMADDR_PM32 = 16;

pub const aliases = struct {
    pub const VDMGETTHREADSELECTORENTRYPROC = ?*const anyopaque;
    pub const VDMGETCONTEXTPROC = ?*const anyopaque;
    pub const VDMSETCONTEXTPROC = ?*const anyopaque;
    pub const DEBUGEVENTPROC = ?*const anyopaque;
    pub const PROCESSENUMPROC = ?*const anyopaque;
    pub const TASKENUMPROC = ?*const anyopaque;
    pub const TASKENUMPROCEX = ?*const anyopaque;
    pub const VDMPROCESSEXCEPTIONPROC = ?*const anyopaque;
    pub const VDMGETPOINTERPROC = ?*const anyopaque;
    pub const VDMKILLWOWPROC = ?*const anyopaque;
    pub const VDMDETECTWOWPROC = ?*const anyopaque;
    pub const VDMBREAKTHREADPROC = ?*const anyopaque;
    pub const VDMGETSELECTORMODULEPROC = ?*const anyopaque;
    pub const VDMGETMODULESELECTORPROC = ?*const anyopaque;
    pub const VDMMODULEFIRSTPROC = ?*const anyopaque;
    pub const VDMMODULENEXTPROC = ?*const anyopaque;
    pub const VDMGLOBALFIRSTPROC = ?*const anyopaque;
    pub const VDMGLOBALNEXTPROC = ?*const anyopaque;
    pub const VDMENUMPROCESSWOWPROC = ?*const anyopaque;
    pub const VDMENUMTASKWOWPROC = ?*const anyopaque;
    pub const VDMENUMTASKWOWEXPROC = ?*const anyopaque;
    pub const VDMTERMINATETASKINWOWPROC = ?*const anyopaque;
    pub const VDMSTARTTASKINWOWPROC = ?*const anyopaque;
    pub const VDMGETDBGFLAGSPROC = ?*const anyopaque;
    pub const VDMSETDBGFLAGSPROC = ?*const anyopaque;
    pub const VDMISMODULELOADEDPROC = ?*const anyopaque;
    pub const VDMGETSEGMENTINFOPROC = ?*const anyopaque;
    pub const VDMGETSYMBOLPROC = ?*const anyopaque;
    pub const VDMGETADDREXPRESSIONPROC = ?*const anyopaque;
};
