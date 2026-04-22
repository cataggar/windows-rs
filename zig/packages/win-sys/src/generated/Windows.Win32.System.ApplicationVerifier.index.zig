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
    .{ "VerifierEnumerateResource", MethodRecord{ .library = "verifier", .import = "VerifierEnumerateResource", .signature = "\x00\x05\x09\x11\x80\x85\x11\xa0\x7d\x09\x12\xbf\xed\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x207d => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationVerifier", .name = "VERIFIER_ENUM_RESOURCE_FLAGS" },
        0x3fed => TypeRefEntry{ .namespace = "Windows.Win32.System.ApplicationVerifier", .name = "AVRF_RESOURCE_ENUMERATE_CALLBACK" },
        else => null,
    };
}

pub const AVRF_ENUM_RESOURCES_FLAGS_DONT_RESOLVE_TRACES = 2;
pub const AVRF_ENUM_RESOURCES_FLAGS_SUSPEND = 1;
pub const AVRF_MAX_TRACES = 32;
pub const AllocationStateUnknown = 0;
pub const AllocationStateBusy = 1;
pub const AllocationStateFree = 2;
pub const HeapFullPageHeap = 1073741824;
pub const HeapMetadata = -2147483648;
pub const HeapStateMask = -65536;
pub const HeapEnumerationEverything = 0;
pub const HeapEnumerationStop = -1;
pub const OperationDbUnused = 0;
pub const OperationDbOPEN = 1;
pub const OperationDbCLOSE = 2;
pub const OperationDbBADREF = 3;
pub const AvrfResourceHeapAllocation = 0;
pub const AvrfResourceHandleTrace = 1;
pub const AvrfResourceMax = 2;

pub const aliases = struct {
    pub const VERIFIER_ENUM_RESOURCE_FLAGS = u32;
    pub const eUserAllocationState = i32;
    pub const eHeapAllocationState = i32;
    pub const eHeapEnumerationLevel = i32;
    pub const eHANDLE_TRACE_OPERATIONS = i32;
    pub const eAvrfResourceTypes = i32;
    pub const AVRF_RESOURCE_ENUMERATE_CALLBACK = ?*const anyopaque;
    pub const AVRF_HEAPALLOCATION_ENUMERATE_CALLBACK = ?*const anyopaque;
    pub const AVRF_HANDLEOPERATION_ENUMERATE_CALLBACK = ?*const anyopaque;
};
