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
    .{ "HeapCreate", MethodRecord{ .library = "KERNEL32", .import = "HeapCreate", .signature = "\x00\x03\x11\x80\x85\x11\xa1\x81\x19\x19" } },
    .{ "HeapDestroy", MethodRecord{ .library = "KERNEL32", .import = "HeapDestroy", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "HeapAlloc", MethodRecord{ .library = "KERNEL32", .import = "HeapAlloc", .signature = "\x00\x03\x0f\x01\x11\x80\x85\x11\xa1\x81\x19" } },
    .{ "HeapReAlloc", MethodRecord{ .library = "KERNEL32", .import = "HeapReAlloc", .signature = "\x00\x04\x0f\x01\x11\x80\x85\x11\xa1\x81\x0f\x01\x19" } },
    .{ "HeapFree", MethodRecord{ .library = "KERNEL32", .import = "HeapFree", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\xa1\x81\x0f\x01" } },
    .{ "HeapSize", MethodRecord{ .library = "KERNEL32", .import = "HeapSize", .signature = "\x00\x03\x19\x11\x80\x85\x11\xa1\x81\x0f\x01" } },
    .{ "GetProcessHeap", MethodRecord{ .library = "KERNEL32", .import = "GetProcessHeap", .signature = "\x00\x00\x11\x80\x85" } },
    .{ "HeapCompact", MethodRecord{ .library = "KERNEL32", .import = "HeapCompact", .signature = "\x00\x02\x19\x11\x80\x85\x11\xa1\x81" } },
    .{ "HeapSetInformation", MethodRecord{ .library = "KERNEL32", .import = "HeapSetInformation", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\xc0\x00\x42\xd9\x0f\x01\x19" } },
    .{ "HeapValidate", MethodRecord{ .library = "KERNEL32", .import = "HeapValidate", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\xa1\x81\x0f\x01" } },
    .{ "HeapSummary", MethodRecord{ .library = "KERNEL32", .import = "HeapSummary", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x0f\x11\xc0\x00\x42\xdd" } },
    .{ "GetProcessHeaps", MethodRecord{ .library = "KERNEL32", .import = "GetProcessHeaps", .signature = "\x00\x02\x09\x09\x0f\x11\x80\x85" } },
    .{ "HeapLock", MethodRecord{ .library = "KERNEL32", .import = "HeapLock", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "HeapUnlock", MethodRecord{ .library = "KERNEL32", .import = "HeapUnlock", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "HeapWalk", MethodRecord{ .library = "KERNEL32", .import = "HeapWalk", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xc0\x00\x42\xe1" } },
    .{ "HeapQueryInformation", MethodRecord{ .library = "KERNEL32", .import = "HeapQueryInformation", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\xc0\x00\x42\xd9\x0f\x01\x19\x0f\x19" } },
    .{ "VirtualAlloc", MethodRecord{ .library = "KERNEL32", .import = "VirtualAlloc", .signature = "\x00\x04\x0f\x01\x0f\x01\x19\x11\xa1\x91\x11\xa1\x85" } },
    .{ "VirtualProtect", MethodRecord{ .library = "KERNEL32", .import = "VirtualProtect", .signature = "\x00\x04\x11\x59\x0f\x01\x19\x11\xa1\x85\x0f\x11\xa1\x85" } },
    .{ "VirtualFree", MethodRecord{ .library = "KERNEL32", .import = "VirtualFree", .signature = "\x00\x03\x11\x59\x0f\x01\x19\x11\xa1\x8d" } },
    .{ "VirtualQuery", MethodRecord{ .library = "KERNEL32", .import = "VirtualQuery", .signature = "\x00\x03\x19\x0f\x01\x0f\x11\xc0\x00\x42\xe5\x19" } },
    .{ "VirtualAllocEx", MethodRecord{ .library = "KERNEL32", .import = "VirtualAllocEx", .signature = "\x00\x05\x0f\x01\x11\x80\x85\x0f\x01\x19\x11\xa1\x91\x11\xa1\x85" } },
    .{ "VirtualProtectEx", MethodRecord{ .library = "KERNEL32", .import = "VirtualProtectEx", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x19\x11\xa1\x85\x0f\x11\xa1\x85" } },
    .{ "VirtualQueryEx", MethodRecord{ .library = "KERNEL32", .import = "VirtualQueryEx", .signature = "\x00\x04\x19\x11\x80\x85\x0f\x01\x0f\x11\xc0\x00\x42\xe5\x19" } },
    .{ "CreateFileMappingW", MethodRecord{ .library = "KERNEL32", .import = "CreateFileMappingW", .signature = "\x00\x06\x11\x80\x85\x11\x80\x85\x0f\x11\x8b\xb5\x11\xa1\x85\x09\x09\x11\x05" } },
    .{ "OpenFileMappingW", MethodRecord{ .library = "KERNEL32", .import = "OpenFileMappingW", .signature = "\x00\x03\x11\x80\x85\x09\x11\x59\x11\x05" } },
    .{ "MapViewOfFile", MethodRecord{ .library = "KERNEL32", .import = "MapViewOfFile", .signature = "\x00\x05\x11\xc0\x00\x42\xe9\x11\x80\x85\x11\xa1\x7d\x09\x09\x19" } },
    .{ "MapViewOfFileEx", MethodRecord{ .library = "KERNEL32", .import = "MapViewOfFileEx", .signature = "\x00\x06\x11\xc0\x00\x42\xe9\x11\x80\x85\x11\xa1\x7d\x09\x09\x19\x0f\x01" } },
    .{ "VirtualFreeEx", MethodRecord{ .library = "KERNEL32", .import = "VirtualFreeEx", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x01\x19\x11\xa1\x8d" } },
    .{ "FlushViewOfFile", MethodRecord{ .library = "KERNEL32", .import = "FlushViewOfFile", .signature = "\x00\x02\x11\x59\x0f\x01\x19" } },
    .{ "UnmapViewOfFile", MethodRecord{ .library = "KERNEL32", .import = "UnmapViewOfFile", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x42\xe9" } },
    .{ "GetLargePageMinimum", MethodRecord{ .library = "KERNEL32", .import = "GetLargePageMinimum", .signature = "\x00\x00\x19" } },
    .{ "GetProcessWorkingSetSizeEx", MethodRecord{ .library = "KERNEL32", .import = "GetProcessWorkingSetSizeEx", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x19\x0f\x19\x0f\x09" } },
    .{ "SetProcessWorkingSetSizeEx", MethodRecord{ .library = "KERNEL32", .import = "SetProcessWorkingSetSizeEx", .signature = "\x00\x04\x11\x59\x11\x80\x85\x19\x19\x11\xa1\x9d" } },
    .{ "VirtualLock", MethodRecord{ .library = "KERNEL32", .import = "VirtualLock", .signature = "\x00\x02\x11\x59\x0f\x01\x19" } },
    .{ "VirtualUnlock", MethodRecord{ .library = "KERNEL32", .import = "VirtualUnlock", .signature = "\x00\x02\x11\x59\x0f\x01\x19" } },
    .{ "GetWriteWatch", MethodRecord{ .library = "KERNEL32", .import = "GetWriteWatch", .signature = "\x00\x06\x09\x09\x0f\x01\x19\x0f\x0f\x01\x0f\x19\x0f\x09" } },
    .{ "ResetWriteWatch", MethodRecord{ .library = "KERNEL32", .import = "ResetWriteWatch", .signature = "\x00\x02\x09\x0f\x01\x19" } },
    .{ "CreateMemoryResourceNotification", MethodRecord{ .library = "KERNEL32", .import = "CreateMemoryResourceNotification", .signature = "\x00\x01\x11\x80\x85\x11\xc0\x00\x42\xed" } },
    .{ "QueryMemoryResourceNotification", MethodRecord{ .library = "KERNEL32", .import = "QueryMemoryResourceNotification", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x59" } },
    .{ "GetSystemFileCacheSize", MethodRecord{ .library = "KERNEL32", .import = "GetSystemFileCacheSize", .signature = "\x00\x03\x11\x59\x0f\x19\x0f\x19\x0f\x09" } },
    .{ "SetSystemFileCacheSize", MethodRecord{ .library = "KERNEL32", .import = "SetSystemFileCacheSize", .signature = "\x00\x03\x11\x59\x19\x19\x09" } },
    .{ "CreateFileMappingNumaW", MethodRecord{ .library = "KERNEL32", .import = "CreateFileMappingNumaW", .signature = "\x00\x07\x11\x80\x85\x11\x80\x85\x0f\x11\x8b\xb5\x11\xa1\x85\x09\x09\x11\x05\x09" } },
    .{ "PrefetchVirtualMemory", MethodRecord{ .library = "KERNEL32", .import = "PrefetchVirtualMemory", .signature = "\x00\x04\x11\x59\x11\x80\x85\x19\x0f\x11\xc0\x00\x42\xf1\x09" } },
    .{ "CreateFileMappingFromApp", MethodRecord{ .library = "KERNEL32", .import = "CreateFileMappingFromApp", .signature = "\x00\x05\x11\x80\x85\x11\x80\x85\x0f\x11\x8b\xb5\x11\xa1\x85\x0b\x11\x05" } },
    .{ "MapViewOfFileFromApp", MethodRecord{ .library = "KERNEL32", .import = "MapViewOfFileFromApp", .signature = "\x00\x04\x11\xc0\x00\x42\xe9\x11\x80\x85\x11\xa1\x7d\x0b\x19" } },
    .{ "UnmapViewOfFileEx", MethodRecord{ .library = "KERNEL32", .import = "UnmapViewOfFileEx", .signature = "\x00\x02\x11\x59\x11\xc0\x00\x42\xe9\x11\xa1\x89" } },
    .{ "AllocateUserPhysicalPages", MethodRecord{ .library = "KERNEL32", .import = "AllocateUserPhysicalPages", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x19\x0f\x19" } },
    .{ "FreeUserPhysicalPages", MethodRecord{ .library = "KERNEL32", .import = "FreeUserPhysicalPages", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x19\x0f\x19" } },
    .{ "MapUserPhysicalPages", MethodRecord{ .library = "KERNEL32", .import = "MapUserPhysicalPages", .signature = "\x00\x03\x11\x59\x0f\x01\x19\x0f\x19" } },
    .{ "AllocateUserPhysicalPagesNuma", MethodRecord{ .library = "KERNEL32", .import = "AllocateUserPhysicalPagesNuma", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0f\x19\x0f\x19\x09" } },
    .{ "VirtualAllocExNuma", MethodRecord{ .library = "KERNEL32", .import = "VirtualAllocExNuma", .signature = "\x00\x06\x0f\x01\x11\x80\x85\x0f\x01\x19\x11\xa1\x91\x09\x09" } },
    .{ "GetMemoryErrorHandlingCapabilities", MethodRecord{ .library = "KERNEL32", .import = "GetMemoryErrorHandlingCapabilities", .signature = "\x00\x01\x11\x59\x0f\x09" } },
    .{ "RegisterBadMemoryNotification", MethodRecord{ .library = "KERNEL32", .import = "RegisterBadMemoryNotification", .signature = "\x00\x01\x0f\x01\x12\xc0\x00\x42\xf5" } },
    .{ "UnregisterBadMemoryNotification", MethodRecord{ .library = "KERNEL32", .import = "UnregisterBadMemoryNotification", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "OfferVirtualMemory", MethodRecord{ .library = "KERNEL32", .import = "OfferVirtualMemory", .signature = "\x00\x03\x09\x0f\x01\x19\x11\xc0\x00\x42\xf9" } },
    .{ "ReclaimVirtualMemory", MethodRecord{ .library = "KERNEL32", .import = "ReclaimVirtualMemory", .signature = "\x00\x02\x09\x0f\x01\x19" } },
    .{ "DiscardVirtualMemory", MethodRecord{ .library = "KERNEL32", .import = "DiscardVirtualMemory", .signature = "\x00\x02\x09\x0f\x01\x19" } },
    .{ "SetProcessValidCallTargets", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-3", .import = "SetProcessValidCallTargets", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x19\x09\x0f\x11\xc0\x00\x42\xfd" } },
    .{ "SetProcessValidCallTargetsForMappedView", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-7", .import = "SetProcessValidCallTargetsForMappedView", .signature = "\x00\x07\x11\x59\x11\x80\x85\x0f\x01\x19\x09\x0f\x11\xc0\x00\x42\xfd\x11\x80\x85\x0b" } },
    .{ "VirtualAllocFromApp", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-3", .import = "VirtualAllocFromApp", .signature = "\x00\x04\x0f\x01\x0f\x01\x19\x11\xa1\x91\x09" } },
    .{ "VirtualProtectFromApp", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-3", .import = "VirtualProtectFromApp", .signature = "\x00\x04\x11\x59\x0f\x01\x19\x09\x0f\x09" } },
    .{ "OpenFileMappingFromApp", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-3", .import = "OpenFileMappingFromApp", .signature = "\x00\x03\x11\x80\x85\x09\x11\x59\x11\x05" } },
    .{ "QueryVirtualMemoryInformation", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-4", .import = "QueryVirtualMemoryInformation", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x01\x11\xc0\x00\x43\x01\x0f\x01\x19\x0f\x19" } },
    .{ "MapViewOfFileNuma2", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-5", .import = "MapViewOfFileNuma2", .signature = "\x00\x08\x11\xc0\x00\x42\xe9\x11\x80\x85\x11\x80\x85\x0b\x0f\x01\x19\x09\x09\x09" } },
    .{ "UnmapViewOfFile2", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-5", .import = "UnmapViewOfFile2", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\xc0\x00\x42\xe9\x11\xa1\x89" } },
    .{ "VirtualUnlockEx", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-5", .import = "VirtualUnlockEx", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x01\x19" } },
    .{ "VirtualAlloc2", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-6", .import = "VirtualAlloc2", .signature = "\x00\x07\x0f\x01\x11\x80\x85\x0f\x01\x19\x11\xa1\x91\x09\x0f\x11\xc0\x00\x43\x05\x09" } },
    .{ "MapViewOfFile3", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-6", .import = "MapViewOfFile3", .signature = "\x00\x09\x11\xc0\x00\x42\xe9\x11\x80\x85\x11\x80\x85\x0f\x01\x0b\x19\x11\xa1\x91\x09\x0f\x11\xc0\x00\x43\x05\x09" } },
    .{ "VirtualAlloc2FromApp", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-6", .import = "VirtualAlloc2FromApp", .signature = "\x00\x07\x0f\x01\x11\x80\x85\x0f\x01\x19\x11\xa1\x91\x09\x0f\x11\xc0\x00\x43\x05\x09" } },
    .{ "MapViewOfFile3FromApp", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-6", .import = "MapViewOfFile3FromApp", .signature = "\x00\x09\x11\xc0\x00\x42\xe9\x11\x80\x85\x11\x80\x85\x0f\x01\x0b\x19\x11\xa1\x91\x09\x0f\x11\xc0\x00\x43\x05\x09" } },
    .{ "CreateFileMapping2", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-7", .import = "CreateFileMapping2", .signature = "\x00\x09\x11\x80\x85\x11\x80\x85\x0f\x11\x8b\xb5\x09\x11\xa1\x85\x09\x0b\x11\x05\x0f\x11\xc0\x00\x43\x05\x09" } },
    .{ "AllocateUserPhysicalPages2", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-8", .import = "AllocateUserPhysicalPages2", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x19\x0f\x19\x0f\x11\xc0\x00\x43\x05\x09" } },
    .{ "OpenDedicatedMemoryPartition", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-8", .import = "OpenDedicatedMemoryPartition", .signature = "\x00\x04\x11\x80\x85\x11\x80\x85\x0b\x09\x11\x59" } },
    .{ "QueryPartitionInformation", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-8", .import = "QueryPartitionInformation", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\xc0\x00\x43\x09\x0f\x01\x09" } },
    .{ "GetMemoryNumaClosestInitiatorNode", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-9", .import = "GetMemoryNumaClosestInitiatorNode", .signature = "\x00\x02\x11\x59\x09\x0f\x09" } },
    .{ "GetMemoryNumaPerformanceInformation", MethodRecord{ .library = "api-ms-win-core-memory-l1-1-9", .import = "GetMemoryNumaPerformanceInformation", .signature = "\x00\x03\x11\x59\x09\x05\x0f\x0f\x11\xc0\x00\x43\x0d" } },
    .{ "RtlCompareMemory", MethodRecord{ .library = "KERNEL32", .import = "RtlCompareMemory", .signature = "\x00\x03\x19\x0f\x01\x0f\x01\x19" } },
    .{ "RtlCrc32", MethodRecord{ .library = "ntdll", .import = "RtlCrc32", .signature = "\x00\x03\x09\x0f\x01\x19\x09" } },
    .{ "RtlCrc64", MethodRecord{ .library = "ntdll", .import = "RtlCrc64", .signature = "\x00\x03\x0b\x0f\x01\x19\x0b" } },
    .{ "RtlIsZeroMemory", MethodRecord{ .library = "ntdll", .import = "RtlIsZeroMemory", .signature = "\x00\x02\x11\x87\x79\x0f\x01\x19" } },
    .{ "GlobalAlloc", MethodRecord{ .library = "KERNEL32", .import = "GlobalAlloc", .signature = "\x00\x02\x11\x8d\x39\x11\x99\xf1\x19" } },
    .{ "GlobalReAlloc", MethodRecord{ .library = "KERNEL32", .import = "GlobalReAlloc", .signature = "\x00\x03\x11\x8d\x39\x11\x8d\x39\x19\x09" } },
    .{ "GlobalSize", MethodRecord{ .library = "KERNEL32", .import = "GlobalSize", .signature = "\x00\x01\x19\x11\x8d\x39" } },
    .{ "GlobalUnlock", MethodRecord{ .library = "KERNEL32", .import = "GlobalUnlock", .signature = "\x00\x01\x11\x59\x11\x8d\x39" } },
    .{ "GlobalLock", MethodRecord{ .library = "KERNEL32", .import = "GlobalLock", .signature = "\x00\x01\x0f\x01\x11\x8d\x39" } },
    .{ "GlobalFlags", MethodRecord{ .library = "KERNEL32", .import = "GlobalFlags", .signature = "\x00\x01\x09\x11\x8d\x39" } },
    .{ "GlobalHandle", MethodRecord{ .library = "KERNEL32", .import = "GlobalHandle", .signature = "\x00\x01\x11\x8d\x39\x0f\x01" } },
    .{ "LocalAlloc", MethodRecord{ .library = "KERNEL32", .import = "LocalAlloc", .signature = "\x00\x02\x11\x8d\x3d\x11\xa1\x95\x19" } },
    .{ "LocalReAlloc", MethodRecord{ .library = "KERNEL32", .import = "LocalReAlloc", .signature = "\x00\x03\x11\x8d\x3d\x11\x8d\x3d\x19\x09" } },
    .{ "LocalLock", MethodRecord{ .library = "KERNEL32", .import = "LocalLock", .signature = "\x00\x01\x0f\x01\x11\x8d\x3d" } },
    .{ "LocalHandle", MethodRecord{ .library = "KERNEL32", .import = "LocalHandle", .signature = "\x00\x01\x11\x8d\x3d\x0f\x01" } },
    .{ "LocalUnlock", MethodRecord{ .library = "KERNEL32", .import = "LocalUnlock", .signature = "\x00\x01\x11\x59\x11\x8d\x3d" } },
    .{ "LocalSize", MethodRecord{ .library = "KERNEL32", .import = "LocalSize", .signature = "\x00\x01\x19\x11\x8d\x3d" } },
    .{ "LocalFlags", MethodRecord{ .library = "KERNEL32", .import = "LocalFlags", .signature = "\x00\x01\x09\x11\x8d\x3d" } },
    .{ "CreateFileMappingA", MethodRecord{ .library = "KERNEL32", .import = "CreateFileMappingA", .signature = "\x00\x06\x11\x80\x85\x11\x80\x85\x0f\x11\x8b\xb5\x11\xa1\x85\x09\x09\x11\x3d" } },
    .{ "CreateFileMappingNumaA", MethodRecord{ .library = "KERNEL32", .import = "CreateFileMappingNumaA", .signature = "\x00\x07\x11\x80\x85\x11\x80\x85\x0f\x11\x8b\xb5\x11\xa1\x85\x09\x09\x11\x3d\x09" } },
    .{ "OpenFileMappingA", MethodRecord{ .library = "KERNEL32", .import = "OpenFileMappingA", .signature = "\x00\x03\x11\x80\x85\x09\x11\x59\x11\x3d" } },
    .{ "MapViewOfFileExNuma", MethodRecord{ .library = "KERNEL32", .import = "MapViewOfFileExNuma", .signature = "\x00\x07\x11\xc0\x00\x42\xe9\x11\x80\x85\x11\xa1\x7d\x09\x09\x19\x0f\x01\x09" } },
    .{ "IsBadReadPtr", MethodRecord{ .library = "KERNEL32", .import = "IsBadReadPtr", .signature = "\x00\x02\x11\x59\x0f\x01\x19" } },
    .{ "IsBadWritePtr", MethodRecord{ .library = "KERNEL32", .import = "IsBadWritePtr", .signature = "\x00\x02\x11\x59\x0f\x01\x19" } },
    .{ "IsBadCodePtr", MethodRecord{ .library = "KERNEL32", .import = "IsBadCodePtr", .signature = "\x00\x01\x11\x59\x12\x96\xe9" } },
    .{ "IsBadStringPtrA", MethodRecord{ .library = "KERNEL32", .import = "IsBadStringPtrA", .signature = "\x00\x02\x11\x59\x11\x3d\x19" } },
    .{ "IsBadStringPtrW", MethodRecord{ .library = "KERNEL32", .import = "IsBadStringPtrW", .signature = "\x00\x02\x11\x59\x11\x05\x19" } },
    .{ "MapUserPhysicalPagesScatter", MethodRecord{ .library = "KERNEL32", .import = "MapUserPhysicalPagesScatter", .signature = "\x00\x03\x11\x59\x0f\x0f\x01\x19\x0f\x19" } },
    .{ "AddSecureMemoryCacheCallback", MethodRecord{ .library = "KERNEL32", .import = "AddSecureMemoryCacheCallback", .signature = "\x00\x01\x11\x59\x12\xc0\x00\x43\x11" } },
    .{ "RemoveSecureMemoryCacheCallback", MethodRecord{ .library = "KERNEL32", .import = "RemoveSecureMemoryCacheCallback", .signature = "\x00\x01\x11\x59\x12\xc0\x00\x43\x11" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0xd39 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HGLOBAL" },
        0xd3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HLOCAL" },
        0x16e9 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FARPROC" },
        0x19f1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "GLOBAL_ALLOC_FLAGS" },
        0x217d => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "FILE_MAP" },
        0x2181 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "HEAP_FLAGS" },
        0x2185 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "PAGE_PROTECTION_FLAGS" },
        0x2189 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "UNMAP_VIEW_OF_FILE_FLAGS" },
        0x218d => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "VIRTUAL_FREE_TYPE" },
        0x2191 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "VIRTUAL_ALLOCATION_TYPE" },
        0x2195 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "LOCAL_ALLOC_FLAGS" },
        0x219d => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "SETPROCESSWORKINGSETSIZEEX_FLAGS" },
        0x42d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "HEAP_INFORMATION_CLASS" },
        0x42dd => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "HEAP_SUMMARY" },
        0x42e1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "PROCESS_HEAP_ENTRY" },
        0x42e5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "MEMORY_BASIC_INFORMATION" },
        0x42e9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "MEMORY_MAPPED_VIEW_ADDRESS" },
        0x42ed => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "MEMORY_RESOURCE_NOTIFICATION_TYPE" },
        0x42f1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "WIN32_MEMORY_RANGE_ENTRY" },
        0x42f5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "PBAD_MEMORY_CALLBACK_ROUTINE" },
        0x42f9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "OFFER_PRIORITY" },
        0x42fd => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "CFG_CALL_TARGET_INFO" },
        0x4301 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "WIN32_MEMORY_INFORMATION_CLASS" },
        0x4305 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "MEM_EXTENDED_PARAMETER" },
        0x4309 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "WIN32_MEMORY_PARTITION_INFORMATION_CLASS" },
        0x430d => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "WIN32_MEMORY_NUMA_PERFORMANCE_INFORMATION_OUTPUT" },
        0x4311 => TypeRefEntry{ .namespace = "Windows.Win32.System.Memory", .name = "PSECURE_MEMORY_CACHE_CALLBACK" },
        else => null,
    };
}

pub const SECTION_ALL_ACCESS = 983071;
pub const SECTION_QUERY = 1;
pub const SECTION_MAP_WRITE = 2;
pub const SECTION_MAP_READ = 4;
pub const SECTION_MAP_EXECUTE = 8;
pub const SECTION_EXTEND_SIZE = 16;
pub const SECTION_MAP_EXECUTE_EXPLICIT = 32;
pub const FILE_MAP_WRITE = 2;
pub const FILE_MAP_READ = 4;
pub const FILE_MAP_ALL_ACCESS = 983071;
pub const FILE_MAP_EXECUTE = 32;
pub const FILE_MAP_COPY = 1;
pub const FILE_MAP_RESERVE = 2147483648;
pub const FILE_MAP_TARGETS_INVALID = 1073741824;
pub const FILE_MAP_LARGE_PAGES = 536870912;
pub const HEAP_NONE = 0;
pub const HEAP_NO_SERIALIZE = 1;
pub const HEAP_GROWABLE = 2;
pub const HEAP_GENERATE_EXCEPTIONS = 4;
pub const HEAP_ZERO_MEMORY = 8;
pub const HEAP_REALLOC_IN_PLACE_ONLY = 16;
pub const HEAP_TAIL_CHECKING_ENABLED = 32;
pub const HEAP_FREE_CHECKING_ENABLED = 64;
pub const HEAP_DISABLE_COALESCE_ON_FREE = 128;
pub const HEAP_CREATE_ALIGN_16 = 65536;
pub const HEAP_CREATE_ENABLE_TRACING = 131072;
pub const HEAP_CREATE_ENABLE_EXECUTE = 262144;
pub const HEAP_MAXIMUM_TAG = 4095;
pub const HEAP_PSEUDO_TAG_FLAG = 32768;
pub const HEAP_TAG_SHIFT = 18;
pub const HEAP_CREATE_SEGMENT_HEAP = 256;
pub const HEAP_CREATE_HARDENED = 512;
pub const PAGE_NOACCESS = 1;
pub const PAGE_READONLY = 2;
pub const PAGE_READWRITE = 4;
pub const PAGE_WRITECOPY = 8;
pub const PAGE_EXECUTE = 16;
pub const PAGE_EXECUTE_READ = 32;
pub const PAGE_EXECUTE_READWRITE = 64;
pub const PAGE_EXECUTE_WRITECOPY = 128;
pub const PAGE_GUARD = 256;
pub const PAGE_NOCACHE = 512;
pub const PAGE_WRITECOMBINE = 1024;
pub const PAGE_GRAPHICS_NOACCESS = 2048;
pub const PAGE_GRAPHICS_READONLY = 4096;
pub const PAGE_GRAPHICS_READWRITE = 8192;
pub const PAGE_GRAPHICS_EXECUTE = 16384;
pub const PAGE_GRAPHICS_EXECUTE_READ = 32768;
pub const PAGE_GRAPHICS_EXECUTE_READWRITE = 65536;
pub const PAGE_GRAPHICS_COHERENT = 131072;
pub const PAGE_GRAPHICS_NOCACHE = 262144;
pub const PAGE_ENCLAVE_THREAD_CONTROL = 2147483648;
pub const PAGE_REVERT_TO_FILE_MAP = 2147483648;
pub const PAGE_TARGETS_NO_UPDATE = 1073741824;
pub const PAGE_TARGETS_INVALID = 1073741824;
pub const PAGE_ENCLAVE_UNVALIDATED = 536870912;
pub const PAGE_ENCLAVE_MASK = 268435456;
pub const PAGE_ENCLAVE_DECOMMIT = 268435456;
pub const PAGE_ENCLAVE_SS_FIRST = 268435457;
pub const PAGE_ENCLAVE_SS_REST = 268435458;
pub const SEC_PARTITION_OWNER_HANDLE = 262144;
pub const SEC_64K_PAGES = 524288;
pub const SEC_FILE = 8388608;
pub const SEC_IMAGE = 16777216;
pub const SEC_PROTECTED_IMAGE = 33554432;
pub const SEC_RESERVE = 67108864;
pub const SEC_COMMIT = 134217728;
pub const SEC_NOCACHE = 268435456;
pub const SEC_WRITECOMBINE = 1073741824;
pub const SEC_LARGE_PAGES = 2147483648;
pub const SEC_IMAGE_NO_EXECUTE = 285212672;
pub const MEM_UNMAP_NONE = 0;
pub const MEM_UNMAP_WITH_TRANSIENT_BOOST = 1;
pub const MEM_PRESERVE_PLACEHOLDER = 2;
pub const MEM_DECOMMIT = 16384;
pub const MEM_RELEASE = 32768;
pub const MEM_COMMIT = 4096;
pub const MEM_RESERVE = 8192;
pub const MEM_RESET = 524288;
pub const MEM_RESET_UNDO = 16777216;
pub const MEM_REPLACE_PLACEHOLDER = 16384;
pub const MEM_LARGE_PAGES = 536870912;
pub const MEM_RESERVE_PLACEHOLDER = 262144;
pub const MEM_FREE = 65536;
pub const LHND = 66;
pub const LMEM_FIXED = 0;
pub const LMEM_MOVEABLE = 2;
pub const LMEM_ZEROINIT = 64;
pub const LPTR = 64;
pub const NONZEROLHND = 2;
pub const NONZEROLPTR = 0;
pub const GHND = 66;
pub const GMEM_FIXED = 0;
pub const GMEM_MOVEABLE = 2;
pub const GMEM_ZEROINIT = 64;
pub const GPTR = 64;
pub const MEM_PRIVATE = 131072;
pub const MEM_MAPPED = 262144;
pub const MEM_IMAGE = 16777216;
pub const QUOTA_LIMITS_HARDWS_MIN_ENABLE = 1;
pub const QUOTA_LIMITS_HARDWS_MIN_DISABLE = 2;
pub const QUOTA_LIMITS_HARDWS_MAX_ENABLE = 4;
pub const QUOTA_LIMITS_HARDWS_MAX_DISABLE = 8;
pub const FILE_CACHE_MAX_HARD_ENABLE = 1;
pub const FILE_CACHE_MAX_HARD_DISABLE = 2;
pub const FILE_CACHE_MIN_HARD_ENABLE = 4;
pub const FILE_CACHE_MIN_HARD_DISABLE = 8;
pub const MEHC_PATROL_SCRUBBER_PRESENT = 1;
pub const WIN32_MEMORY_NUMA_PERFORMANCE_ALL_TARGET_NODE = 4294967295;
pub const WIN32_MEMORY_NUMA_PERFORMANCE_READ_LATENCY = 1;
pub const WIN32_MEMORY_NUMA_PERFORMANCE_READ_BANDWIDTH = 2;
pub const WIN32_MEMORY_NUMA_PERFORMANCE_WRITE_LATENCY = 4;
pub const WIN32_MEMORY_NUMA_PERFORMANCE_WRITE_BANDWIDTH = 8;
pub const LowMemoryResourceNotification = 0;
pub const HighMemoryResourceNotification = 1;
pub const VmOfferPriorityVeryLow = 1;
pub const VmOfferPriorityLow = 2;
pub const VmOfferPriorityBelowNormal = 3;
pub const VmOfferPriorityNormal = 4;
pub const MemoryRegionInfo = 0;
pub const MemoryPartitionInfo = 0;
pub const MemoryPartitionDedicatedMemoryInfo = 1;
pub const MemExtendedParameterInvalidType = 0;
pub const MemExtendedParameterAddressRequirements = 1;
pub const MemExtendedParameterNumaNode = 2;
pub const MemExtendedParameterPartitionHandle = 3;
pub const MemExtendedParameterUserPhysicalHandle = 4;
pub const MemExtendedParameterAttributeFlags = 5;
pub const MemExtendedParameterImageMachine = 6;
pub const MemExtendedParameterMax = 7;
pub const MemDedicatedAttributeReadBandwidth = 0;
pub const MemDedicatedAttributeReadLatency = 1;
pub const MemDedicatedAttributeWriteBandwidth = 2;
pub const MemDedicatedAttributeWriteLatency = 3;
pub const MemDedicatedAttributeMax = 4;
pub const MemSectionExtendedParameterInvalidType = 0;
pub const MemSectionExtendedParameterUserPhysicalFlags = 1;
pub const MemSectionExtendedParameterNumaNode = 2;
pub const MemSectionExtendedParameterSigningLevel = 3;
pub const MemSectionExtendedParameterMax = 4;
pub const HeapCompatibilityInformation = 0;
pub const HeapEnableTerminationOnCorruption = 1;
pub const HeapOptimizeResources = 3;
pub const HeapTag = 7;

pub const aliases = struct {
    pub const SECTION_FLAGS = u32;
    pub const FILE_MAP = u32;
    pub const HEAP_FLAGS = u32;
    pub const PAGE_PROTECTION_FLAGS = u32;
    pub const UNMAP_VIEW_OF_FILE_FLAGS = u32;
    pub const VIRTUAL_FREE_TYPE = u32;
    pub const VIRTUAL_ALLOCATION_TYPE = u32;
    pub const LOCAL_ALLOC_FLAGS = u32;
    pub const GLOBAL_ALLOC_FLAGS = u32;
    pub const PAGE_TYPE = u32;
    pub const SETPROCESSWORKINGSETSIZEEX_FLAGS = u32;
    pub const MEMORY_RESOURCE_NOTIFICATION_TYPE = i32;
    pub const OFFER_PRIORITY = i32;
    pub const WIN32_MEMORY_INFORMATION_CLASS = i32;
    pub const WIN32_MEMORY_PARTITION_INFORMATION_CLASS = i32;
    pub const MEM_EXTENDED_PARAMETER_TYPE = i32;
    pub const MEM_DEDICATED_ATTRIBUTE_TYPE = i32;
    pub const MEM_SECTION_EXTENDED_PARAMETER_TYPE = i32;
    pub const HEAP_INFORMATION_CLASS = i32;
    pub const MEMORY_MAPPED_VIEW_ADDRESS = ?*anyopaque;
    pub const AtlThunkData_t = isize;
};
