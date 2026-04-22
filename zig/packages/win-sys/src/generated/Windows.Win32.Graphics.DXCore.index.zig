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
    .{ "DXCoreCreateAdapterFactory", MethodRecord{ .library = "DXCORE", .import = "DXCoreCreateAdapterFactory", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        else => null,
    };
}

pub const _FACDXCORE = 2176;
pub const InstanceLuid = 0;
pub const DriverVersion = 1;
pub const DriverDescription = 2;
pub const HardwareID = 3;
pub const KmdModelVersion = 4;
pub const ComputePreemptionGranularity = 5;
pub const GraphicsPreemptionGranularity = 6;
pub const DedicatedAdapterMemory = 7;
pub const DedicatedSystemMemory = 8;
pub const SharedSystemMemory = 9;
pub const AcgCompatible = 10;
pub const IsHardware = 11;
pub const IsIntegrated = 12;
pub const IsDetachable = 13;
pub const HardwareIDParts = 14;
pub const PhysicalAdapterCount = 15;
pub const AdapterEngineCount = 16;
pub const AdapterEngineName = 17;
pub const IsDriverUpdateInProgress = 0;
pub const AdapterMemoryBudget = 1;
pub const AdapterMemoryUsageBytes = 2;
pub const AdapterMemoryUsageByProcessBytes = 3;
pub const AdapterEngineRunningTimeMicroseconds = 4;
pub const AdapterEngineRunningTimeByProcessMicroseconds = 5;
pub const AdapterTemperatureCelsius = 6;
pub const AdapterInUseProcessCount = 7;
pub const AdapterInUseProcessSet = 8;
pub const AdapterEngineFrequencyHertz = 9;
pub const AdapterMemoryFrequencyHertz = 10;
pub const Local = 0;
pub const NonLocal = 1;
pub const AdapterListStale = 0;
pub const AdapterNoLongerValid = 1;
pub const AdapterBudgetChange = 2;
pub const AdapterHardwareContentProtectionTeardown = 3;
pub const Hardware = 0;
pub const MinimumPower = 1;
pub const HighPerformance = 2;
pub const Graphics = 0;
pub const Compute = 1;
pub const Media = 2;
pub const MachineLearning = 3;
pub const None = 0;
pub const D3D11 = 1;
pub const D3D12 = 2;
pub const GPU = 1;
pub const ComputeAccelerator = 2;
pub const NPU = 4;
pub const MediaAccelerator = 8;
pub const Dedicated = 0;
pub const Shared = 1;

pub const aliases = struct {
    pub const DXCoreAdapterProperty = u32;
    pub const DXCoreAdapterState = u32;
    pub const DXCoreSegmentGroup = u32;
    pub const DXCoreNotificationType = u32;
    pub const DXCoreAdapterPreference = u32;
    pub const DXCoreWorkload = u32;
    pub const DXCoreRuntimeFilterFlags = u32;
    pub const DXCoreHardwareTypeFilterFlags = u32;
    pub const DXCoreMemoryType = u32;
    pub const PFN_DXCORE_NOTIFICATION_CALLBACK = ?*const anyopaque;
};
