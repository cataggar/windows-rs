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
    .{ "RtlInitializeSListHead", MethodRecord{ .library = "ntdll", .import = "RtlInitializeSListHead", .signature = "\x00\x01\x01\x0f\x11\xa3\xd1" } },
    .{ "RtlFirstEntrySList", MethodRecord{ .library = "ntdll", .import = "RtlFirstEntrySList", .signature = "\x00\x01\x0f\x11\x94\xa5\x0f\x11\xa3\xd1" } },
    .{ "RtlInterlockedPopEntrySList", MethodRecord{ .library = "ntdll", .import = "RtlInterlockedPopEntrySList", .signature = "\x00\x01\x0f\x11\x94\xa5\x0f\x11\xa3\xd1" } },
    .{ "RtlInterlockedPushEntrySList", MethodRecord{ .library = "ntdll", .import = "RtlInterlockedPushEntrySList", .signature = "\x00\x02\x0f\x11\x94\xa5\x0f\x11\xa3\xd1\x0f\x11\x94\xa5" } },
    .{ "RtlInterlockedPushListSListEx", MethodRecord{ .library = "ntdll", .import = "RtlInterlockedPushListSListEx", .signature = "\x00\x04\x0f\x11\x94\xa5\x0f\x11\xa3\xd1\x0f\x11\x94\xa5\x0f\x11\x94\xa5\x09" } },
    .{ "RtlInterlockedFlushSList", MethodRecord{ .library = "ntdll", .import = "RtlInterlockedFlushSList", .signature = "\x00\x01\x0f\x11\x94\xa5\x0f\x11\xa3\xd1" } },
    .{ "RtlQueryDepthSList", MethodRecord{ .library = "ntdll", .import = "RtlQueryDepthSList", .signature = "\x00\x01\x07\x0f\x11\xa3\xd1" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x14a5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Kernel", .name = "SLIST_ENTRY" },
        0x23d1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Kernel", .name = "SLIST_HEADER" },
        else => null,
    };
}

pub const ExceptionContinueExecution = 0;
pub const ExceptionContinueSearch = 1;
pub const ExceptionNestedException = 2;
pub const ExceptionCollidedUnwind = 3;
pub const OBJ_HANDLE_TAGBITS = 3;
pub const RTL_BALANCED_NODE_RESERVED_PARENT_MASK = 3;
pub const NULL64 = 0;
pub const MAXUCHAR = 255;
pub const MAXUSHORT = 65535;
pub const MAXULONG = 4294967295;
pub const NotificationEvent = 0;
pub const SynchronizationEvent = 1;
pub const NotificationTimer = 0;
pub const SynchronizationTimer = 1;
pub const WaitAll = 0;
pub const WaitAny = 1;
pub const WaitNotification = 2;
pub const WaitDequeue = 3;
pub const WaitDpc = 4;
pub const NtProductWinNt = 1;
pub const NtProductLanManNt = 2;
pub const NtProductServer = 3;
pub const SmallBusiness = 0;
pub const Enterprise = 1;
pub const BackOffice = 2;
pub const CommunicationServer = 3;
pub const TerminalServer = 4;
pub const SmallBusinessRestricted = 5;
pub const EmbeddedNT = 6;
pub const DataCenter = 7;
pub const SingleUserTS = 8;
pub const Personal = 9;
pub const Blade = 10;
pub const EmbeddedRestricted = 11;
pub const SecurityAppliance = 12;
pub const StorageServer = 13;
pub const ComputeServer = 14;
pub const WHServer = 15;
pub const PhoneNT = 16;
pub const MultiUserTS = 17;
pub const MaxSuiteType = 18;
pub const UNSPECIFIED_COMPARTMENT_ID = 0;
pub const DEFAULT_COMPARTMENT_ID = 1;

pub const aliases = struct {
    pub const EXCEPTION_DISPOSITION = i32;
    pub const EVENT_TYPE = i32;
    pub const TIMER_TYPE = i32;
    pub const WAIT_TYPE = i32;
    pub const NT_PRODUCT_TYPE = i32;
    pub const SUITE_TYPE = i32;
    pub const COMPARTMENT_ID = i32;
};
