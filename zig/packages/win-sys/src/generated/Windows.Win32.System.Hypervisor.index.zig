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
    .{ "WHvGetCapability", MethodRecord{ .library = "WinHvPlatform", .import = "WHvGetCapability", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xe9\x0f\x01\x09\x0f\x09" } },
    .{ "WHvCreatePartition", MethodRecord{ .library = "WinHvPlatform", .import = "WHvCreatePartition", .signature = "\x00\x01\x11\x79\x0f\x11\xc0\x00\x41\xed" } },
    .{ "WHvSetupPartition", MethodRecord{ .library = "WinHvPlatform", .import = "WHvSetupPartition", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x41\xed" } },
    .{ "WHvResetPartition", MethodRecord{ .library = "WinHvPlatform", .import = "WHvResetPartition", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x41\xed" } },
    .{ "WHvDeletePartition", MethodRecord{ .library = "WinHvPlatform", .import = "WHvDeletePartition", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x41\xed" } },
    .{ "WHvGetPartitionProperty", MethodRecord{ .library = "WinHvPlatform", .import = "WHvGetPartitionProperty", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x41\xed\x11\xc0\x00\x41\xf1\x0f\x01\x09\x0f\x09" } },
    .{ "WHvSetPartitionProperty", MethodRecord{ .library = "WinHvPlatform", .import = "WHvSetPartitionProperty", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xed\x11\xc0\x00\x41\xf1\x0f\x01\x09" } },
    .{ "WHvSuspendPartitionTime", MethodRecord{ .library = "WinHvPlatform", .import = "WHvSuspendPartitionTime", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x41\xed" } },
    .{ "WHvResumePartitionTime", MethodRecord{ .library = "WinHvPlatform", .import = "WHvResumePartitionTime", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x41\xed" } },
    .{ "WHvMapGpaRange", MethodRecord{ .library = "WinHvPlatform", .import = "WHvMapGpaRange", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x41\xed\x0f\x01\x0b\x0b\x11\xc0\x00\x41\xf5" } },
    .{ "WHvMapGpaRange2", MethodRecord{ .library = "WinHvPlatform", .import = "WHvMapGpaRange2", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x41\xed\x11\x80\x85\x0f\x01\x0b\x0b\x11\xc0\x00\x41\xf5" } },
    .{ "WHvUnmapGpaRange", MethodRecord{ .library = "WinHvPlatform", .import = "WHvUnmapGpaRange", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x41\xed\x0b\x0b" } },
    .{ "WHvTranslateGva", MethodRecord{ .library = "WinHvPlatform", .import = "WHvTranslateGva", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x41\xed\x09\x0b\x11\xc0\x00\x41\xf9\x0f\x11\xc0\x00\x41\xfd\x0f\x0b" } },
    .{ "WHvCreateVirtualProcessor", MethodRecord{ .library = "WinHvPlatform", .import = "WHvCreateVirtualProcessor", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x41\xed\x09\x09" } },
    .{ "WHvCreateVirtualProcessor2", MethodRecord{ .library = "WinHvPlatform", .import = "WHvCreateVirtualProcessor2", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xed\x09\x0f\x11\xc0\x00\x42\x01\x09" } },
    .{ "WHvDeleteVirtualProcessor", MethodRecord{ .library = "WinHvPlatform", .import = "WHvDeleteVirtualProcessor", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x41\xed\x09" } },
    .{ "WHvRunVirtualProcessor", MethodRecord{ .library = "WinHvPlatform", .import = "WHvRunVirtualProcessor", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xed\x09\x0f\x01\x09" } },
    .{ "WHvCancelRunVirtualProcessor", MethodRecord{ .library = "WinHvPlatform", .import = "WHvCancelRunVirtualProcessor", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x41\xed\x09\x09" } },
    .{ "WHvGetVirtualProcessorRegisters", MethodRecord{ .library = "WinHvPlatform", .import = "WHvGetVirtualProcessorRegisters", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x41\xed\x09\x0f\x11\xc0\x00\x42\x05\x09\x0f\x11\xc0\x00\x42\x09" } },
    .{ "WHvSetVirtualProcessorRegisters", MethodRecord{ .library = "WinHvPlatform", .import = "WHvSetVirtualProcessorRegisters", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x41\xed\x09\x0f\x11\xc0\x00\x42\x05\x09\x0f\x11\xc0\x00\x42\x09" } },
    .{ "WHvGetVirtualProcessorInterruptControllerState", MethodRecord{ .library = "WinHvPlatform", .import = "WHvGetVirtualProcessorInterruptControllerState", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x41\xed\x09\x0f\x01\x09\x0f\x09" } },
    .{ "WHvSetVirtualProcessorInterruptControllerState", MethodRecord{ .library = "WinHvPlatform", .import = "WHvSetVirtualProcessorInterruptControllerState", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xed\x09\x0f\x01\x09" } },
    .{ "WHvRequestInterrupt", MethodRecord{ .library = "WinHvPlatform", .import = "WHvRequestInterrupt", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x41\xed\x0f\x11\xc0\x00\x42\x0d\x09" } },
    .{ "WHvGetVirtualProcessorXsaveState", MethodRecord{ .library = "WinHvPlatform", .import = "WHvGetVirtualProcessorXsaveState", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x41\xed\x09\x0f\x01\x09\x0f\x09" } },
    .{ "WHvSetVirtualProcessorXsaveState", MethodRecord{ .library = "WinHvPlatform", .import = "WHvSetVirtualProcessorXsaveState", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xed\x09\x0f\x01\x09" } },
    .{ "WHvQueryGpaRangeDirtyBitmap", MethodRecord{ .library = "WinHvPlatform", .import = "WHvQueryGpaRangeDirtyBitmap", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x41\xed\x0b\x0b\x0f\x0b\x09" } },
    .{ "WHvGetPartitionCounters", MethodRecord{ .library = "WinHvPlatform", .import = "WHvGetPartitionCounters", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x41\xed\x11\xc0\x00\x42\x11\x0f\x01\x09\x0f\x09" } },
    .{ "WHvGetVirtualProcessorCounters", MethodRecord{ .library = "WinHvPlatform", .import = "WHvGetVirtualProcessorCounters", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x41\xed\x09\x11\xc0\x00\x42\x15\x0f\x01\x09\x0f\x09" } },
    .{ "WHvGetVirtualProcessorInterruptControllerState2", MethodRecord{ .library = "WinHvPlatform", .import = "WHvGetVirtualProcessorInterruptControllerState2", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x41\xed\x09\x0f\x01\x09\x0f\x09" } },
    .{ "WHvSetVirtualProcessorInterruptControllerState2", MethodRecord{ .library = "WinHvPlatform", .import = "WHvSetVirtualProcessorInterruptControllerState2", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xed\x09\x0f\x01\x09" } },
    .{ "WHvRegisterPartitionDoorbellEvent", MethodRecord{ .library = "WinHvPlatform", .import = "WHvRegisterPartitionDoorbellEvent", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x41\xed\x0f\x11\xc0\x00\x42\x19\x11\x80\x85" } },
    .{ "WHvUnregisterPartitionDoorbellEvent", MethodRecord{ .library = "WinHvPlatform", .import = "WHvUnregisterPartitionDoorbellEvent", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x41\xed\x0f\x11\xc0\x00\x42\x19" } },
    .{ "WHvAdviseGpaRange", MethodRecord{ .library = "WinHvPlatform", .import = "WHvAdviseGpaRange", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x41\xed\x0f\x11\xc0\x00\x42\x1d\x09\x11\xc0\x00\x42\x21\x0f\x01\x09" } },
    .{ "WHvReadGpaRange", MethodRecord{ .library = "WinHvPlatform", .import = "WHvReadGpaRange", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x41\xed\x09\x0b\x11\xc0\x00\x42\x25\x0f\x01\x09" } },
    .{ "WHvWriteGpaRange", MethodRecord{ .library = "WinHvPlatform", .import = "WHvWriteGpaRange", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x41\xed\x09\x0b\x11\xc0\x00\x42\x25\x0f\x01\x09" } },
    .{ "WHvSignalVirtualProcessorSynicEvent", MethodRecord{ .library = "WinHvPlatform", .import = "WHvSignalVirtualProcessorSynicEvent", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x41\xed\x11\xc0\x00\x42\x29\x0f\x11\x59" } },
    .{ "WHvGetVirtualProcessorState", MethodRecord{ .library = "WinHvPlatform", .import = "WHvGetVirtualProcessorState", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x41\xed\x09\x11\xc0\x00\x42\x2d\x0f\x01\x09\x0f\x09" } },
    .{ "WHvSetVirtualProcessorState", MethodRecord{ .library = "WinHvPlatform", .import = "WHvSetVirtualProcessorState", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x41\xed\x09\x11\xc0\x00\x42\x2d\x0f\x01\x09" } },
    .{ "WHvAllocateVpciResource", MethodRecord{ .library = "WinHvPlatform", .import = "WHvAllocateVpciResource", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x11\xc0\x00\x42\x31\x0f\x01\x09\x0f\x11\x80\x85" } },
    .{ "WHvCreateVpciDevice", MethodRecord{ .library = "WinHvPlatform", .import = "WHvCreateVpciDevice", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x41\xed\x0b\x11\x80\x85\x11\xc0\x00\x42\x35\x11\x80\x85" } },
    .{ "WHvDeleteVpciDevice", MethodRecord{ .library = "WinHvPlatform", .import = "WHvDeleteVpciDevice", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x41\xed\x0b" } },
    .{ "WHvGetVpciDeviceProperty", MethodRecord{ .library = "WinHvPlatform", .import = "WHvGetVpciDeviceProperty", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x41\xed\x0b\x11\xc0\x00\x42\x39\x0f\x01\x09\x0f\x09" } },
    .{ "WHvGetVpciDeviceNotification", MethodRecord{ .library = "WinHvPlatform", .import = "WHvGetVpciDeviceNotification", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xed\x0b\x0f\x11\xc0\x00\x42\x3d\x09" } },
    .{ "WHvMapVpciDeviceMmioRanges", MethodRecord{ .library = "WinHvPlatform", .import = "WHvMapVpciDeviceMmioRanges", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xed\x0b\x0f\x09\x0f\x0f\x11\xc0\x00\x42\x41" } },
    .{ "WHvUnmapVpciDeviceMmioRanges", MethodRecord{ .library = "WinHvPlatform", .import = "WHvUnmapVpciDeviceMmioRanges", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x41\xed\x0b" } },
    .{ "WHvSetVpciDevicePowerState", MethodRecord{ .library = "WinHvPlatform", .import = "WHvSetVpciDevicePowerState", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x41\xed\x0b\x11\xc0\x00\x42\x45" } },
    .{ "WHvReadVpciDeviceRegister", MethodRecord{ .library = "WinHvPlatform", .import = "WHvReadVpciDeviceRegister", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xed\x0b\x0f\x11\xc0\x00\x42\x49\x0f\x01" } },
    .{ "WHvWriteVpciDeviceRegister", MethodRecord{ .library = "WinHvPlatform", .import = "WHvWriteVpciDeviceRegister", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xed\x0b\x0f\x11\xc0\x00\x42\x49\x0f\x01" } },
    .{ "WHvMapVpciDeviceInterrupt", MethodRecord{ .library = "WinHvPlatform", .import = "WHvMapVpciDeviceInterrupt", .signature = "\x00\x07\x11\x79\x11\xc0\x00\x41\xed\x0b\x09\x09\x0f\x11\xc0\x00\x42\x4d\x0f\x0b\x0f\x09" } },
    .{ "WHvUnmapVpciDeviceInterrupt", MethodRecord{ .library = "WinHvPlatform", .import = "WHvUnmapVpciDeviceInterrupt", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x41\xed\x0b\x09" } },
    .{ "WHvRetargetVpciDeviceInterrupt", MethodRecord{ .library = "WinHvPlatform", .import = "WHvRetargetVpciDeviceInterrupt", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x41\xed\x0b\x0b\x09\x0f\x11\xc0\x00\x42\x4d" } },
    .{ "WHvRequestVpciDeviceInterrupt", MethodRecord{ .library = "WinHvPlatform", .import = "WHvRequestVpciDeviceInterrupt", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xed\x0b\x0b\x09" } },
    .{ "WHvGetVpciDeviceInterruptTarget", MethodRecord{ .library = "WinHvPlatform", .import = "WHvGetVpciDeviceInterruptTarget", .signature = "\x00\x07\x11\x79\x11\xc0\x00\x41\xed\x0b\x09\x09\x0f\x11\xc0\x00\x42\x4d\x09\x0f\x09" } },
    .{ "WHvCreateTrigger", MethodRecord{ .library = "WinHvPlatform", .import = "WHvCreateTrigger", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xed\x0f\x11\xc0\x00\x42\x51\x0f\x0f\x01\x0f\x11\x80\x85" } },
    .{ "WHvUpdateTriggerParameters", MethodRecord{ .library = "WinHvPlatform", .import = "WHvUpdateTriggerParameters", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x41\xed\x0f\x11\xc0\x00\x42\x51\x0f\x01" } },
    .{ "WHvDeleteTrigger", MethodRecord{ .library = "WinHvPlatform", .import = "WHvDeleteTrigger", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x41\xed\x0f\x01" } },
    .{ "WHvCreateNotificationPort", MethodRecord{ .library = "WinHvPlatform", .import = "WHvCreateNotificationPort", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xed\x0f\x11\xc0\x00\x42\x55\x11\x80\x85\x0f\x0f\x01" } },
    .{ "WHvSetNotificationPortProperty", MethodRecord{ .library = "WinHvPlatform", .import = "WHvSetNotificationPortProperty", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\xed\x0f\x01\x11\xc0\x00\x42\x59\x0b" } },
    .{ "WHvDeleteNotificationPort", MethodRecord{ .library = "WinHvPlatform", .import = "WHvDeleteNotificationPort", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x41\xed\x0f\x01" } },
    .{ "WHvPostVirtualProcessorSynicMessage", MethodRecord{ .library = "WinHvPlatform", .import = "WHvPostVirtualProcessorSynicMessage", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x41\xed\x09\x09\x0f\x01\x09" } },
    .{ "WHvGetVirtualProcessorCpuidOutput", MethodRecord{ .library = "WinHvPlatform", .import = "WHvGetVirtualProcessorCpuidOutput", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x41\xed\x09\x09\x09\x0f\x11\xc0\x00\x42\x5d" } },
    .{ "WHvGetInterruptTargetVpSet", MethodRecord{ .library = "WinHvPlatform", .import = "WHvGetInterruptTargetVpSet", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x41\xed\x0b\x11\xc0\x00\x42\x61\x0f\x09\x09\x0f\x09" } },
    .{ "WHvStartPartitionMigration", MethodRecord{ .library = "WinHvPlatform", .import = "WHvStartPartitionMigration", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x41\xed\x0f\x11\x80\x85" } },
    .{ "WHvCancelPartitionMigration", MethodRecord{ .library = "WinHvPlatform", .import = "WHvCancelPartitionMigration", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x41\xed" } },
    .{ "WHvCompletePartitionMigration", MethodRecord{ .library = "WinHvPlatform", .import = "WHvCompletePartitionMigration", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x41\xed" } },
    .{ "WHvAcceptPartitionMigration", MethodRecord{ .library = "WinHvPlatform", .import = "WHvAcceptPartitionMigration", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\xc0\x00\x41\xed" } },
    .{ "WHvEmulatorCreateEmulator", MethodRecord{ .library = "WinHvEmulation", .import = "WHvEmulatorCreateEmulator", .signature = "\x00\x02\x11\x79\x0f\x11\xc0\x00\x42\x65\x0f\x0f\x01" } },
    .{ "WHvEmulatorDestroyEmulator", MethodRecord{ .library = "WinHvEmulation", .import = "WHvEmulatorDestroyEmulator", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "WHvEmulatorTryIoEmulation", MethodRecord{ .library = "WinHvEmulation", .import = "WHvEmulatorTryIoEmulation", .signature = "\x00\x05\x11\x79\x0f\x01\x0f\x01\x0f\x11\xc0\x00\x42\x69\x0f\x11\xc0\x00\x42\x6d\x0f\x11\xc0\x00\x42\x71" } },
    .{ "WHvEmulatorTryMmioEmulation", MethodRecord{ .library = "WinHvEmulation", .import = "WHvEmulatorTryMmioEmulation", .signature = "\x00\x05\x11\x79\x0f\x01\x0f\x01\x0f\x11\xc0\x00\x42\x69\x0f\x11\xc0\x00\x42\x75\x0f\x11\xc0\x00\x42\x71" } },
    .{ "HdvInitializeDeviceHost", MethodRecord{ .library = "vmdevicehost", .import = "HdvInitializeDeviceHost", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x42\x79\x0f\x0f\x01" } },
    .{ "HdvInitializeDeviceHostEx", MethodRecord{ .library = "vmdevicehost", .import = "HdvInitializeDeviceHostEx", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x42\x79\x11\xc0\x00\x42\x7d\x0f\x0f\x01" } },
    .{ "HdvTeardownDeviceHost", MethodRecord{ .library = "vmdevicehost", .import = "HdvTeardownDeviceHost", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "HdvCreateDeviceInstance", MethodRecord{ .library = "vmdevicehost", .import = "HdvCreateDeviceInstance", .signature = "\x00\x07\x11\x79\x0f\x01\x11\xc0\x00\x42\x81\x0f\x11\x0d\x0f\x11\x0d\x0f\x01\x0f\x01\x0f\x0f\x01" } },
    .{ "HdvReadGuestMemory", MethodRecord{ .library = "vmdevicehost", .import = "HdvReadGuestMemory", .signature = "\x00\x04\x11\x79\x0f\x01\x0b\x09\x0f\x05" } },
    .{ "HdvWriteGuestMemory", MethodRecord{ .library = "vmdevicehost", .import = "HdvWriteGuestMemory", .signature = "\x00\x04\x11\x79\x0f\x01\x0b\x09\x0f\x05" } },
    .{ "HdvCreateGuestMemoryAperture", MethodRecord{ .library = "vmdevicehost", .import = "HdvCreateGuestMemoryAperture", .signature = "\x00\x05\x11\x79\x0f\x01\x0b\x09\x11\x59\x0f\x0f\x01" } },
    .{ "HdvDestroyGuestMemoryAperture", MethodRecord{ .library = "vmdevicehost", .import = "HdvDestroyGuestMemoryAperture", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x01" } },
    .{ "HdvDeliverGuestInterrupt", MethodRecord{ .library = "vmdevicehost", .import = "HdvDeliverGuestInterrupt", .signature = "\x00\x03\x11\x79\x0f\x01\x0b\x09" } },
    .{ "HdvRegisterDoorbell", MethodRecord{ .library = "vmdevicehost", .import = "HdvRegisterDoorbell", .signature = "\x00\x06\x11\x79\x0f\x01\x11\xc0\x00\x42\x85\x0b\x0b\x0b\x11\x80\x85" } },
    .{ "HdvUnregisterDoorbell", MethodRecord{ .library = "vmdevicehost", .import = "HdvUnregisterDoorbell", .signature = "\x00\x05\x11\x79\x0f\x01\x11\xc0\x00\x42\x85\x0b\x0b\x0b" } },
    .{ "HdvCreateSectionBackedMmioRange", MethodRecord{ .library = "vmdevicehost", .import = "HdvCreateSectionBackedMmioRange", .signature = "\x00\x07\x11\x79\x0f\x01\x11\xc0\x00\x42\x85\x0b\x0b\x11\xc0\x00\x42\x89\x11\x80\x85\x0b" } },
    .{ "HdvDestroySectionBackedMmioRange", MethodRecord{ .library = "vmdevicehost", .import = "HdvDestroySectionBackedMmioRange", .signature = "\x00\x03\x11\x79\x0f\x01\x11\xc0\x00\x42\x85\x0b" } },
    .{ "LocateSavedStateFiles", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "LocateSavedStateFiles", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x0f\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "LoadSavedStateFile", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "LoadSavedStateFile", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x0f\x01" } },
    .{ "ApplyPendingSavedStateFileReplayLog", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "ApplyPendingSavedStateFileReplayLog", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "LoadSavedStateFiles", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "LoadSavedStateFiles", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x0f\x0f\x01" } },
    .{ "ReleaseSavedStateFiles", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "ReleaseSavedStateFiles", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "GetGuestEnabledVirtualTrustLevels", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetGuestEnabledVirtualTrustLevels", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x09" } },
    .{ "GetGuestOsInfo", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetGuestOsInfo", .signature = "\x00\x03\x11\x79\x0f\x01\x05\x0f\x11\xc0\x00\x42\x8d" } },
    .{ "GetVpCount", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetVpCount", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x09" } },
    .{ "GetArchitecture", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetArchitecture", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\xc0\x00\x42\x91" } },
    .{ "ForceArchitecture", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "ForceArchitecture", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x11\xc0\x00\x42\x91" } },
    .{ "GetActiveVirtualTrustLevel", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetActiveVirtualTrustLevel", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x05" } },
    .{ "GetEnabledVirtualTrustLevels", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetEnabledVirtualTrustLevels", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x09" } },
    .{ "ForceActiveVirtualTrustLevel", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "ForceActiveVirtualTrustLevel", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x05" } },
    .{ "IsActiveVirtualTrustLevelEnabled", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "IsActiveVirtualTrustLevelEnabled", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\x59" } },
    .{ "IsNestedVirtualizationEnabled", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "IsNestedVirtualizationEnabled", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x11\x59" } },
    .{ "GetNestedVirtualizationMode", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetNestedVirtualizationMode", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\x59" } },
    .{ "ForceNestedHostMode", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "ForceNestedHostMode", .signature = "\x00\x04\x11\x79\x0f\x01\x09\x11\x59\x0f\x11\x59" } },
    .{ "InKernelSpace", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "InKernelSpace", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\x59" } },
    .{ "GetRegisterValue", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetRegisterValue", .signature = "\x00\x04\x11\x79\x0f\x01\x09\x09\x0f\x11\xc0\x00\x42\x95" } },
    .{ "GetPagingMode", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetPagingMode", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\xc0\x00\x42\x99" } },
    .{ "ForcePagingMode", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "ForcePagingMode", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x11\xc0\x00\x42\x99" } },
    .{ "ReadGuestPhysicalAddress", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "ReadGuestPhysicalAddress", .signature = "\x00\x05\x11\x79\x0f\x01\x0b\x0f\x01\x09\x0f\x09" } },
    .{ "GuestVirtualAddressToPhysicalAddress", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GuestVirtualAddressToPhysicalAddress", .signature = "\x00\x05\x11\x79\x0f\x01\x09\x0b\x0f\x0b\x0f\x0b" } },
    .{ "GetGuestPhysicalMemoryChunks", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetGuestPhysicalMemoryChunks", .signature = "\x00\x04\x11\x79\x0f\x01\x0f\x0b\x0f\x11\xc0\x00\x42\x9d\x0f\x0b" } },
    .{ "GuestPhysicalAddressToRawSavedMemoryOffset", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GuestPhysicalAddressToRawSavedMemoryOffset", .signature = "\x00\x03\x11\x79\x0f\x01\x0b\x0f\x0b" } },
    .{ "ReadGuestRawSavedMemory", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "ReadGuestRawSavedMemory", .signature = "\x00\x05\x11\x79\x0f\x01\x0b\x0f\x01\x09\x0f\x09" } },
    .{ "GetGuestRawSavedMemorySize", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetGuestRawSavedMemorySize", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x0b" } },
    .{ "SetMemoryBlockCacheLimit", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "SetMemoryBlockCacheLimit", .signature = "\x00\x02\x11\x79\x0f\x01\x0b" } },
    .{ "GetMemoryBlockCacheLimit", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetMemoryBlockCacheLimit", .signature = "\x00\x02\x11\x79\x0f\x01\x0f\x0b" } },
    .{ "ApplyGuestMemoryFix", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "ApplyGuestMemoryFix", .signature = "\x00\x05\x11\x79\x0f\x01\x09\x0b\x0f\x01\x09" } },
    .{ "LoadSavedStateSymbolProvider", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "LoadSavedStateSymbolProvider", .signature = "\x00\x03\x11\x79\x0f\x01\x11\x05\x11\x59" } },
    .{ "ReleaseSavedStateSymbolProvider", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "ReleaseSavedStateSymbolProvider", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "GetSavedStateSymbolProviderHandle", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetSavedStateSymbolProviderHandle", .signature = "\x00\x01\x11\x80\x85\x0f\x01" } },
    .{ "SetSavedStateSymbolProviderDebugInfoCallback", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "SetSavedStateSymbolProviderDebugInfoCallback", .signature = "\x00\x02\x11\x79\x0f\x01\x12\xc0\x00\x42\xa1" } },
    .{ "LoadSavedStateModuleSymbols", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "LoadSavedStateModuleSymbols", .signature = "\x00\x05\x11\x79\x0f\x01\x11\x3d\x11\x3d\x0b\x09" } },
    .{ "LoadSavedStateModuleSymbolsEx", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "LoadSavedStateModuleSymbolsEx", .signature = "\x00\x06\x11\x79\x0f\x01\x11\x3d\x09\x11\x3d\x0b\x09" } },
    .{ "ResolveSavedStateGlobalVariableAddress", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "ResolveSavedStateGlobalVariableAddress", .signature = "\x00\x05\x11\x79\x0f\x01\x09\x11\x3d\x0f\x0b\x0f\x09" } },
    .{ "ReadSavedStateGlobalVariable", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "ReadSavedStateGlobalVariable", .signature = "\x00\x05\x11\x79\x0f\x01\x09\x11\x3d\x0f\x01\x09" } },
    .{ "GetSavedStateSymbolTypeSize", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetSavedStateSymbolTypeSize", .signature = "\x00\x04\x11\x79\x0f\x01\x09\x11\x3d\x0f\x09" } },
    .{ "FindSavedStateSymbolFieldInType", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "FindSavedStateSymbolFieldInType", .signature = "\x00\x06\x11\x79\x0f\x01\x09\x11\x3d\x11\x05\x0f\x09\x0f\x11\x59" } },
    .{ "GetSavedStateSymbolFieldInfo", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "GetSavedStateSymbolFieldInfo", .signature = "\x00\x04\x11\x79\x0f\x01\x09\x11\x3d\x0f\x11\x05" } },
    .{ "ScanMemoryForDosImages", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "ScanMemoryForDosImages", .signature = "\x00\x08\x11\x79\x0f\x01\x09\x0b\x0b\x0f\x01\x12\xc0\x00\x42\xa5\x0f\x0b\x09" } },
    .{ "CallStackUnwind", MethodRecord{ .library = "VmSavedStateDumpProvider", .import = "CallStackUnwind", .signature = "\x00\x06\x11\x79\x0f\x01\x09\x0f\x11\xc0\x00\x42\xa9\x09\x09\x0f\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x41e9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_CAPABILITY_CODE" },
        0x41ed => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_PARTITION_HANDLE" },
        0x41f1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_PARTITION_PROPERTY_CODE" },
        0x41f5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_MAP_GPA_RANGE_FLAGS" },
        0x41f9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_TRANSLATE_GVA_FLAGS" },
        0x41fd => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_TRANSLATE_GVA_RESULT" },
        0x4201 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_VIRTUAL_PROCESSOR_PROPERTY" },
        0x4205 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_REGISTER_NAME" },
        0x4209 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_REGISTER_VALUE" },
        0x420d => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_INTERRUPT_CONTROL" },
        0x4211 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_PARTITION_COUNTER_SET" },
        0x4215 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_PROCESSOR_COUNTER_SET" },
        0x4219 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_DOORBELL_MATCH_DATA" },
        0x421d => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_MEMORY_RANGE_ENTRY" },
        0x4221 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_ADVISE_GPA_RANGE_CODE" },
        0x4225 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_ACCESS_GPA_CONTROLS" },
        0x4229 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_SYNIC_EVENT_PARAMETERS" },
        0x422d => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_VIRTUAL_PROCESSOR_STATE_TYPE" },
        0x4231 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_ALLOCATE_VPCI_RESOURCE_FLAGS" },
        0x4235 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_CREATE_VPCI_DEVICE_FLAGS" },
        0x4239 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_VPCI_DEVICE_PROPERTY_CODE" },
        0x423d => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_VPCI_DEVICE_NOTIFICATION" },
        0x4241 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_VPCI_MMIO_MAPPING" },
        0x4245 => TypeRefEntry{ .namespace = "Windows.Win32.System.Power", .name = "DEVICE_POWER_STATE" },
        0x4249 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_VPCI_DEVICE_REGISTER" },
        0x424d => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_VPCI_INTERRUPT_TARGET" },
        0x4251 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_TRIGGER_PARAMETERS" },
        0x4255 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_NOTIFICATION_PORT_PARAMETERS" },
        0x4259 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_NOTIFICATION_PORT_PROPERTY_CODE" },
        0x425d => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_CPUID_OUTPUT" },
        0x4261 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_INTERRUPT_DESTINATION_MODE" },
        0x4265 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_EMULATOR_CALLBACKS" },
        0x4269 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_VP_EXIT_CONTEXT" },
        0x426d => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_X64_IO_PORT_ACCESS_CONTEXT" },
        0x4271 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_EMULATOR_STATUS" },
        0x4275 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "WHV_MEMORY_ACCESS_CONTEXT" },
        0x4279 => TypeRefEntry{ .namespace = "Windows.Win32.System.HostComputeSystem", .name = "HCS_SYSTEM" },
        0x427d => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "HDV_DEVICE_HOST_FLAGS" },
        0x4281 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "HDV_DEVICE_TYPE" },
        0x4285 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "HDV_PCI_BAR_SELECTOR" },
        0x4289 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "HDV_MMIO_MAPPING_FLAGS" },
        0x428d => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "GUEST_OS_INFO" },
        0x4291 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "VIRTUAL_PROCESSOR_ARCH" },
        0x4295 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "VIRTUAL_PROCESSOR_REGISTER" },
        0x4299 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "PAGING_MODE" },
        0x429d => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "GPA_MEMORY_CHUNK" },
        0x42a1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK" },
        0x42a5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "FOUND_IMAGE_CALLBACK" },
        0x42a9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Hypervisor", .name = "MODULE_INFO" },
        else => null,
    };
}

pub const HVSOCKET_CONNECT_TIMEOUT = 1;
pub const HVSOCKET_CONNECT_TIMEOUT_MAX = 300000;
pub const HVSOCKET_CONNECTED_SUSPEND = 4;
pub const HVSOCKET_HIGH_VTL = 8;
pub const HV_PROTOCOL_RAW = 1;
pub const HVSOCKET_ADDRESS_FLAG_PASSTHRU = 1;
pub const WHV_PROCESSOR_FEATURES_BANKS_COUNT = 2;
pub const WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS_COUNT = 1;
pub const WHV_READ_WRITE_GPA_RANGE_MAX_SIZE = 16;
pub const WHV_HYPERCALL_CONTEXT_MAX_XMM_REGISTERS = 6;
pub const WHV_MAX_DEVICE_ID_SIZE_IN_CHARS = 200;
pub const WHV_VPCI_TYPE0_BAR_COUNT = 6;
pub const WHV_ANY_VP = 4294967295;
pub const WHV_SYNIC_MESSAGE_SIZE = 256;
pub const IOCTL_VMGENCOUNTER_READ = 3325956;
pub const HDV_PCI_BAR_COUNT = 6;
pub const WHvCapabilityCodeHypervisorPresent = 0;
pub const WHvCapabilityCodeFeatures = 1;
pub const WHvCapabilityCodeExtendedVmExits = 2;
pub const WHvCapabilityCodeExceptionExitBitmap = 3;
pub const WHvCapabilityCodeX64MsrExitBitmap = 4;
pub const WHvCapabilityCodeGpaRangePopulateFlags = 5;
pub const WHvCapabilityCodeSchedulerFeatures = 6;
pub const WHvCapabilityCodeProcessorVendor = 4096;
pub const WHvCapabilityCodeProcessorFeatures = 4097;
pub const WHvCapabilityCodeProcessorClFlushSize = 4098;
pub const WHvCapabilityCodeProcessorXsaveFeatures = 4099;
pub const WHvCapabilityCodeProcessorClockFrequency = 4100;
pub const WHvCapabilityCodeInterruptClockFrequency = 4101;
pub const WHvCapabilityCodeProcessorFeaturesBanks = 4102;
pub const WHvCapabilityCodeProcessorFrequencyCap = 4103;
pub const WHvCapabilityCodeSyntheticProcessorFeaturesBanks = 4104;
pub const WHvCapabilityCodeProcessorPerfmonFeatures = 4105;
pub const WHvProcessorVendorAmd = 0;
pub const WHvProcessorVendorIntel = 1;
pub const WHvProcessorVendorHygon = 2;
pub const WHvPartitionPropertyCodeExtendedVmExits = 1;
pub const WHvPartitionPropertyCodeExceptionExitBitmap = 2;
pub const WHvPartitionPropertyCodeSeparateSecurityDomain = 3;
pub const WHvPartitionPropertyCodeNestedVirtualization = 4;
pub const WHvPartitionPropertyCodeX64MsrExitBitmap = 5;
pub const WHvPartitionPropertyCodePrimaryNumaNode = 6;
pub const WHvPartitionPropertyCodeCpuReserve = 7;
pub const WHvPartitionPropertyCodeCpuCap = 8;
pub const WHvPartitionPropertyCodeCpuWeight = 9;
pub const WHvPartitionPropertyCodeCpuGroupId = 10;
pub const WHvPartitionPropertyCodeProcessorFrequencyCap = 11;
pub const WHvPartitionPropertyCodeAllowDeviceAssignment = 12;
pub const WHvPartitionPropertyCodeDisableSmt = 13;
pub const WHvPartitionPropertyCodeProcessorFeatures = 4097;
pub const WHvPartitionPropertyCodeProcessorClFlushSize = 4098;
pub const WHvPartitionPropertyCodeCpuidExitList = 4099;
pub const WHvPartitionPropertyCodeCpuidResultList = 4100;
pub const WHvPartitionPropertyCodeLocalApicEmulationMode = 4101;
pub const WHvPartitionPropertyCodeProcessorXsaveFeatures = 4102;
pub const WHvPartitionPropertyCodeProcessorClockFrequency = 4103;
pub const WHvPartitionPropertyCodeInterruptClockFrequency = 4104;
pub const WHvPartitionPropertyCodeApicRemoteReadSupport = 4105;
pub const WHvPartitionPropertyCodeProcessorFeaturesBanks = 4106;
pub const WHvPartitionPropertyCodeReferenceTime = 4107;
pub const WHvPartitionPropertyCodeSyntheticProcessorFeaturesBanks = 4108;
pub const WHvPartitionPropertyCodeCpuidResultList2 = 4109;
pub const WHvPartitionPropertyCodeProcessorPerfmonFeatures = 4110;
pub const WHvPartitionPropertyCodeMsrActionList = 4111;
pub const WHvPartitionPropertyCodeUnimplementedMsrAction = 4112;
pub const WHvPartitionPropertyCodeProcessorCount = 8191;
pub const WHvMemoryAccessRead = 0;
pub const WHvMemoryAccessWrite = 1;
pub const WHvMemoryAccessExecute = 2;
pub const WHvX64CpuidResult2FlagSubleafSpecific = 1;
pub const WHvX64CpuidResult2FlagVpSpecific = 2;
pub const WHvMsrActionArchitectureDefault = 0;
pub const WHvMsrActionIgnoreWriteReadZero = 1;
pub const WHvMsrActionExit = 2;
pub const WHvX64ExceptionTypeDivideErrorFault = 0;
pub const WHvX64ExceptionTypeDebugTrapOrFault = 1;
pub const WHvX64ExceptionTypeBreakpointTrap = 3;
pub const WHvX64ExceptionTypeOverflowTrap = 4;
pub const WHvX64ExceptionTypeBoundRangeFault = 5;
pub const WHvX64ExceptionTypeInvalidOpcodeFault = 6;
pub const WHvX64ExceptionTypeDeviceNotAvailableFault = 7;
pub const WHvX64ExceptionTypeDoubleFaultAbort = 8;
pub const WHvX64ExceptionTypeInvalidTaskStateSegmentFault = 10;
pub const WHvX64ExceptionTypeSegmentNotPresentFault = 11;
pub const WHvX64ExceptionTypeStackFault = 12;
pub const WHvX64ExceptionTypeGeneralProtectionFault = 13;
pub const WHvX64ExceptionTypePageFault = 14;
pub const WHvX64ExceptionTypeFloatingPointErrorFault = 16;
pub const WHvX64ExceptionTypeAlignmentCheckFault = 17;
pub const WHvX64ExceptionTypeMachineCheckAbort = 18;
pub const WHvX64ExceptionTypeSimdFloatingPointFault = 19;
pub const WHvX64LocalApicEmulationModeNone = 0;
pub const WHvX64LocalApicEmulationModeXApic = 1;
pub const WHvX64LocalApicEmulationModeX2Apic = 2;
pub const WHvMapGpaRangeFlagNone = 0;
pub const WHvMapGpaRangeFlagRead = 1;
pub const WHvMapGpaRangeFlagWrite = 2;
pub const WHvMapGpaRangeFlagExecute = 4;
pub const WHvMapGpaRangeFlagTrackDirtyPages = 8;
pub const WHvTranslateGvaFlagNone = 0;
pub const WHvTranslateGvaFlagValidateRead = 1;
pub const WHvTranslateGvaFlagValidateWrite = 2;
pub const WHvTranslateGvaFlagValidateExecute = 4;
pub const WHvTranslateGvaFlagPrivilegeExempt = 8;
pub const WHvTranslateGvaFlagSetPageTableBits = 16;
pub const WHvTranslateGvaFlagEnforceSmap = 256;
pub const WHvTranslateGvaFlagOverrideSmap = 512;
pub const WHvTranslateGvaResultSuccess = 0;
pub const WHvTranslateGvaResultPageNotPresent = 1;
pub const WHvTranslateGvaResultPrivilegeViolation = 2;
pub const WHvTranslateGvaResultInvalidPageTableFlags = 3;
pub const WHvTranslateGvaResultGpaUnmapped = 4;
pub const WHvTranslateGvaResultGpaNoReadAccess = 5;
pub const WHvTranslateGvaResultGpaNoWriteAccess = 6;
pub const WHvTranslateGvaResultGpaIllegalOverlayAccess = 7;
pub const WHvTranslateGvaResultIntercept = 8;
pub const WHvCacheTypeUncached = 0;
pub const WHvCacheTypeWriteCombining = 1;
pub const WHvCacheTypeWriteThrough = 4;
pub const WHvCacheTypeWriteBack = 6;
pub const WHvX64RegisterRax = 0;
pub const WHvX64RegisterRcx = 1;
pub const WHvX64RegisterRdx = 2;
pub const WHvX64RegisterRbx = 3;
pub const WHvX64RegisterRsp = 4;
pub const WHvX64RegisterRbp = 5;
pub const WHvX64RegisterRsi = 6;
pub const WHvX64RegisterRdi = 7;
pub const WHvX64RegisterR8 = 8;
pub const WHvX64RegisterR9 = 9;
pub const WHvX64RegisterR10 = 10;
pub const WHvX64RegisterR11 = 11;
pub const WHvX64RegisterR12 = 12;
pub const WHvX64RegisterR13 = 13;
pub const WHvX64RegisterR14 = 14;
pub const WHvX64RegisterR15 = 15;
pub const WHvX64RegisterRip = 16;
pub const WHvX64RegisterRflags = 17;
pub const WHvX64RegisterEs = 18;
pub const WHvX64RegisterCs = 19;
pub const WHvX64RegisterSs = 20;
pub const WHvX64RegisterDs = 21;
pub const WHvX64RegisterFs = 22;
pub const WHvX64RegisterGs = 23;
pub const WHvX64RegisterLdtr = 24;
pub const WHvX64RegisterTr = 25;
pub const WHvX64RegisterIdtr = 26;
pub const WHvX64RegisterGdtr = 27;
pub const WHvX64RegisterCr0 = 28;
pub const WHvX64RegisterCr2 = 29;
pub const WHvX64RegisterCr3 = 30;
pub const WHvX64RegisterCr4 = 31;
pub const WHvX64RegisterCr8 = 32;
pub const WHvX64RegisterDr0 = 33;
pub const WHvX64RegisterDr1 = 34;
pub const WHvX64RegisterDr2 = 35;
pub const WHvX64RegisterDr3 = 36;
pub const WHvX64RegisterDr6 = 37;
pub const WHvX64RegisterDr7 = 38;
pub const WHvX64RegisterXCr0 = 39;
pub const WHvX64RegisterVirtualCr0 = 40;
pub const WHvX64RegisterVirtualCr3 = 41;
pub const WHvX64RegisterVirtualCr4 = 42;
pub const WHvX64RegisterVirtualCr8 = 43;
pub const WHvX64RegisterXmm0 = 4096;
pub const WHvX64RegisterXmm1 = 4097;
pub const WHvX64RegisterXmm2 = 4098;
pub const WHvX64RegisterXmm3 = 4099;
pub const WHvX64RegisterXmm4 = 4100;
pub const WHvX64RegisterXmm5 = 4101;
pub const WHvX64RegisterXmm6 = 4102;
pub const WHvX64RegisterXmm7 = 4103;
pub const WHvX64RegisterXmm8 = 4104;
pub const WHvX64RegisterXmm9 = 4105;
pub const WHvX64RegisterXmm10 = 4106;
pub const WHvX64RegisterXmm11 = 4107;
pub const WHvX64RegisterXmm12 = 4108;
pub const WHvX64RegisterXmm13 = 4109;
pub const WHvX64RegisterXmm14 = 4110;
pub const WHvX64RegisterXmm15 = 4111;
pub const WHvX64RegisterFpMmx0 = 4112;
pub const WHvX64RegisterFpMmx1 = 4113;
pub const WHvX64RegisterFpMmx2 = 4114;
pub const WHvX64RegisterFpMmx3 = 4115;
pub const WHvX64RegisterFpMmx4 = 4116;
pub const WHvX64RegisterFpMmx5 = 4117;
pub const WHvX64RegisterFpMmx6 = 4118;
pub const WHvX64RegisterFpMmx7 = 4119;
pub const WHvX64RegisterFpControlStatus = 4120;
pub const WHvX64RegisterXmmControlStatus = 4121;
pub const WHvX64RegisterTsc = 8192;
pub const WHvX64RegisterEfer = 8193;
pub const WHvX64RegisterKernelGsBase = 8194;
pub const WHvX64RegisterApicBase = 8195;
pub const WHvX64RegisterPat = 8196;
pub const WHvX64RegisterSysenterCs = 8197;
pub const WHvX64RegisterSysenterEip = 8198;
pub const WHvX64RegisterSysenterEsp = 8199;
pub const WHvX64RegisterStar = 8200;
pub const WHvX64RegisterLstar = 8201;
pub const WHvX64RegisterCstar = 8202;
pub const WHvX64RegisterSfmask = 8203;
pub const WHvX64RegisterInitialApicId = 8204;
pub const WHvX64RegisterMsrMtrrCap = 8205;
pub const WHvX64RegisterMsrMtrrDefType = 8206;
pub const WHvX64RegisterMsrMtrrPhysBase0 = 8208;
pub const WHvX64RegisterMsrMtrrPhysBase1 = 8209;
pub const WHvX64RegisterMsrMtrrPhysBase2 = 8210;
pub const WHvX64RegisterMsrMtrrPhysBase3 = 8211;
pub const WHvX64RegisterMsrMtrrPhysBase4 = 8212;
pub const WHvX64RegisterMsrMtrrPhysBase5 = 8213;
pub const WHvX64RegisterMsrMtrrPhysBase6 = 8214;
pub const WHvX64RegisterMsrMtrrPhysBase7 = 8215;
pub const WHvX64RegisterMsrMtrrPhysBase8 = 8216;
pub const WHvX64RegisterMsrMtrrPhysBase9 = 8217;
pub const WHvX64RegisterMsrMtrrPhysBaseA = 8218;
pub const WHvX64RegisterMsrMtrrPhysBaseB = 8219;
pub const WHvX64RegisterMsrMtrrPhysBaseC = 8220;
pub const WHvX64RegisterMsrMtrrPhysBaseD = 8221;
pub const WHvX64RegisterMsrMtrrPhysBaseE = 8222;
pub const WHvX64RegisterMsrMtrrPhysBaseF = 8223;
pub const WHvX64RegisterMsrMtrrPhysMask0 = 8256;
pub const WHvX64RegisterMsrMtrrPhysMask1 = 8257;
pub const WHvX64RegisterMsrMtrrPhysMask2 = 8258;
pub const WHvX64RegisterMsrMtrrPhysMask3 = 8259;
pub const WHvX64RegisterMsrMtrrPhysMask4 = 8260;
pub const WHvX64RegisterMsrMtrrPhysMask5 = 8261;
pub const WHvX64RegisterMsrMtrrPhysMask6 = 8262;
pub const WHvX64RegisterMsrMtrrPhysMask7 = 8263;
pub const WHvX64RegisterMsrMtrrPhysMask8 = 8264;
pub const WHvX64RegisterMsrMtrrPhysMask9 = 8265;
pub const WHvX64RegisterMsrMtrrPhysMaskA = 8266;
pub const WHvX64RegisterMsrMtrrPhysMaskB = 8267;
pub const WHvX64RegisterMsrMtrrPhysMaskC = 8268;
pub const WHvX64RegisterMsrMtrrPhysMaskD = 8269;
pub const WHvX64RegisterMsrMtrrPhysMaskE = 8270;
pub const WHvX64RegisterMsrMtrrPhysMaskF = 8271;
pub const WHvX64RegisterMsrMtrrFix64k00000 = 8304;
pub const WHvX64RegisterMsrMtrrFix16k80000 = 8305;
pub const WHvX64RegisterMsrMtrrFix16kA0000 = 8306;
pub const WHvX64RegisterMsrMtrrFix4kC0000 = 8307;
pub const WHvX64RegisterMsrMtrrFix4kC8000 = 8308;
pub const WHvX64RegisterMsrMtrrFix4kD0000 = 8309;
pub const WHvX64RegisterMsrMtrrFix4kD8000 = 8310;
pub const WHvX64RegisterMsrMtrrFix4kE0000 = 8311;
pub const WHvX64RegisterMsrMtrrFix4kE8000 = 8312;
pub const WHvX64RegisterMsrMtrrFix4kF0000 = 8313;
pub const WHvX64RegisterMsrMtrrFix4kF8000 = 8314;
pub const WHvX64RegisterTscAux = 8315;
pub const WHvX64RegisterBndcfgs = 8316;
pub const WHvX64RegisterMCount = 8318;
pub const WHvX64RegisterACount = 8319;
pub const WHvX64RegisterSpecCtrl = 8324;
pub const WHvX64RegisterPredCmd = 8325;
pub const WHvX64RegisterTscVirtualOffset = 8327;
pub const WHvX64RegisterTsxCtrl = 8328;
pub const WHvX64RegisterXss = 8331;
pub const WHvX64RegisterUCet = 8332;
pub const WHvX64RegisterSCet = 8333;
pub const WHvX64RegisterSsp = 8334;
pub const WHvX64RegisterPl0Ssp = 8335;
pub const WHvX64RegisterPl1Ssp = 8336;
pub const WHvX64RegisterPl2Ssp = 8337;
pub const WHvX64RegisterPl3Ssp = 8338;
pub const WHvX64RegisterInterruptSspTableAddr = 8339;
pub const WHvX64RegisterTscDeadline = 8341;
pub const WHvX64RegisterTscAdjust = 8342;
pub const WHvX64RegisterUmwaitControl = 8344;
pub const WHvX64RegisterXfd = 8345;
pub const WHvX64RegisterXfdErr = 8346;
pub const WHvX64RegisterApicId = 12290;
pub const WHvX64RegisterApicVersion = 12291;
pub const WHvX64RegisterApicTpr = 12296;
pub const WHvX64RegisterApicPpr = 12298;
pub const WHvX64RegisterApicEoi = 12299;
pub const WHvX64RegisterApicLdr = 12301;
pub const WHvX64RegisterApicSpurious = 12303;
pub const WHvX64RegisterApicIsr0 = 12304;
pub const WHvX64RegisterApicIsr1 = 12305;
pub const WHvX64RegisterApicIsr2 = 12306;
pub const WHvX64RegisterApicIsr3 = 12307;
pub const WHvX64RegisterApicIsr4 = 12308;
pub const WHvX64RegisterApicIsr5 = 12309;
pub const WHvX64RegisterApicIsr6 = 12310;
pub const WHvX64RegisterApicIsr7 = 12311;
pub const WHvX64RegisterApicTmr0 = 12312;
pub const WHvX64RegisterApicTmr1 = 12313;
pub const WHvX64RegisterApicTmr2 = 12314;
pub const WHvX64RegisterApicTmr3 = 12315;
pub const WHvX64RegisterApicTmr4 = 12316;
pub const WHvX64RegisterApicTmr5 = 12317;
pub const WHvX64RegisterApicTmr6 = 12318;
pub const WHvX64RegisterApicTmr7 = 12319;
pub const WHvX64RegisterApicIrr0 = 12320;
pub const WHvX64RegisterApicIrr1 = 12321;
pub const WHvX64RegisterApicIrr2 = 12322;
pub const WHvX64RegisterApicIrr3 = 12323;
pub const WHvX64RegisterApicIrr4 = 12324;
pub const WHvX64RegisterApicIrr5 = 12325;
pub const WHvX64RegisterApicIrr6 = 12326;
pub const WHvX64RegisterApicIrr7 = 12327;
pub const WHvX64RegisterApicEse = 12328;
pub const WHvX64RegisterApicIcr = 12336;
pub const WHvX64RegisterApicLvtTimer = 12338;
pub const WHvX64RegisterApicLvtThermal = 12339;
pub const WHvX64RegisterApicLvtPerfmon = 12340;
pub const WHvX64RegisterApicLvtLint0 = 12341;
pub const WHvX64RegisterApicLvtLint1 = 12342;
pub const WHvX64RegisterApicLvtError = 12343;
pub const WHvX64RegisterApicInitCount = 12344;
pub const WHvX64RegisterApicCurrentCount = 12345;
pub const WHvX64RegisterApicDivide = 12350;
pub const WHvX64RegisterApicSelfIpi = 12351;
pub const WHvRegisterSint0 = 16384;
pub const WHvRegisterSint1 = 16385;
pub const WHvRegisterSint2 = 16386;
pub const WHvRegisterSint3 = 16387;
pub const WHvRegisterSint4 = 16388;
pub const WHvRegisterSint5 = 16389;
pub const WHvRegisterSint6 = 16390;
pub const WHvRegisterSint7 = 16391;
pub const WHvRegisterSint8 = 16392;
pub const WHvRegisterSint9 = 16393;
pub const WHvRegisterSint10 = 16394;
pub const WHvRegisterSint11 = 16395;
pub const WHvRegisterSint12 = 16396;
pub const WHvRegisterSint13 = 16397;
pub const WHvRegisterSint14 = 16398;
pub const WHvRegisterSint15 = 16399;
pub const WHvRegisterScontrol = 16400;
pub const WHvRegisterSversion = 16401;
pub const WHvRegisterSiefp = 16402;
pub const WHvRegisterSimp = 16403;
pub const WHvRegisterEom = 16404;
pub const WHvRegisterVpRuntime = 20480;
pub const WHvX64RegisterHypercall = 20481;
pub const WHvRegisterGuestOsId = 20482;
pub const WHvRegisterVpAssistPage = 20499;
pub const WHvRegisterReferenceTsc = 20503;
pub const WHvRegisterReferenceTscSequence = 20506;
pub const WHvRegisterPendingInterruption = -2147483648;
pub const WHvRegisterInterruptState = -2147483647;
pub const WHvRegisterPendingEvent = -2147483646;
pub const WHvX64RegisterDeliverabilityNotifications = -2147483644;
pub const WHvRegisterInternalActivityState = -2147483643;
pub const WHvX64RegisterPendingDebugException = -2147483642;
pub const WHvX64PendingEventException = 0;
pub const WHvX64PendingEventExtInt = 5;
pub const WHvRunVpExitReasonNone = 0;
pub const WHvRunVpExitReasonMemoryAccess = 1;
pub const WHvRunVpExitReasonX64IoPortAccess = 2;
pub const WHvRunVpExitReasonUnrecoverableException = 4;
pub const WHvRunVpExitReasonInvalidVpRegisterValue = 5;
pub const WHvRunVpExitReasonUnsupportedFeature = 6;
pub const WHvRunVpExitReasonX64InterruptWindow = 7;
pub const WHvRunVpExitReasonX64Halt = 8;
pub const WHvRunVpExitReasonX64ApicEoi = 9;
pub const WHvRunVpExitReasonSynicSintDeliverable = 10;
pub const WHvRunVpExitReasonX64MsrAccess = 4096;
pub const WHvRunVpExitReasonX64Cpuid = 4097;
pub const WHvRunVpExitReasonException = 4098;
pub const WHvRunVpExitReasonX64Rdtsc = 4099;
pub const WHvRunVpExitReasonX64ApicSmiTrap = 4100;
pub const WHvRunVpExitReasonHypercall = 4101;
pub const WHvRunVpExitReasonX64ApicInitSipiTrap = 4102;
pub const WHvRunVpExitReasonX64ApicWriteTrap = 4103;
pub const WHvRunVpExitReasonCanceled = 8193;
pub const WHvUnsupportedFeatureIntercept = 1;
pub const WHvUnsupportedFeatureTaskSwitchTss = 2;
pub const WHvRunVpCancelReasonUser = 0;
pub const WHvX64PendingInterrupt = 0;
pub const WHvX64PendingNmi = 2;
pub const WHvX64PendingException = 3;
pub const WHvX64ApicWriteTypeLdr = 208;
pub const WHvX64ApicWriteTypeDfr = 224;
pub const WHvX64ApicWriteTypeSvr = 240;
pub const WHvX64ApicWriteTypeLint0 = 848;
pub const WHvX64ApicWriteTypeLint1 = 864;
pub const WHvX64InterruptTypeFixed = 0;
pub const WHvX64InterruptTypeLowestPriority = 1;
pub const WHvX64InterruptTypeNmi = 4;
pub const WHvX64InterruptTypeInit = 5;
pub const WHvX64InterruptTypeSipi = 6;
pub const WHvX64InterruptTypeLocalInt1 = 9;
pub const WHvX64InterruptDestinationModePhysical = 0;
pub const WHvX64InterruptDestinationModeLogical = 1;
pub const WHvX64InterruptTriggerModeEdge = 0;
pub const WHvX64InterruptTriggerModeLevel = 1;
pub const WHvPartitionCounterSetMemory = 0;
pub const WHvProcessorCounterSetRuntime = 0;
pub const WHvProcessorCounterSetIntercepts = 1;
pub const WHvProcessorCounterSetEvents = 2;
pub const WHvProcessorCounterSetApic = 3;
pub const WHvProcessorCounterSetSyntheticFeatures = 4;
pub const WHvAdviseGpaRangeCodePopulate = 0;
pub const WHvAdviseGpaRangeCodePin = 1;
pub const WHvAdviseGpaRangeCodeUnpin = 2;
pub const WHvVirtualProcessorStateTypeSynicMessagePage = 0;
pub const WHvVirtualProcessorStateTypeSynicEventFlagPage = 1;
pub const WHvVirtualProcessorStateTypeSynicTimerState = 2;
pub const WHvVirtualProcessorStateTypeInterruptControllerState2 = 4096;
pub const WHvVirtualProcessorStateTypeXsaveState = 4097;
pub const WHvAllocateVpciResourceFlagNone = 0;
pub const WHvAllocateVpciResourceFlagAllowDirectP2P = 1;
pub const WHvVpciDeviceNotificationUndefined = 0;
pub const WHvVpciDeviceNotificationMmioRemapping = 1;
pub const WHvVpciDeviceNotificationSurpriseRemoval = 2;
pub const WHvCreateVpciDeviceFlagNone = 0;
pub const WHvCreateVpciDeviceFlagPhysicallyBacked = 1;
pub const WHvCreateVpciDeviceFlagUseLogicalInterrupts = 2;
pub const WHvVpciDevicePropertyCodeUndefined = 0;
pub const WHvVpciDevicePropertyCodeHardwareIDs = 1;
pub const WHvVpciDevicePropertyCodeProbedBARs = 2;
pub const WHvVpciMmioRangeFlagReadAccess = 1;
pub const WHvVpciMmioRangeFlagWriteAccess = 2;
pub const WHvVpciConfigSpace = -1;
pub const WHvVpciBar0 = 0;
pub const WHvVpciBar1 = 1;
pub const WHvVpciBar2 = 2;
pub const WHvVpciBar3 = 3;
pub const WHvVpciBar4 = 4;
pub const WHvVpciBar5 = 5;
pub const WHvVpciInterruptTargetFlagNone = 0;
pub const WHvVpciInterruptTargetFlagMulticast = 1;
pub const WHvTriggerTypeInterrupt = 0;
pub const WHvTriggerTypeSynicEvent = 1;
pub const WHvTriggerTypeDeviceInterrupt = 2;
pub const WHvVirtualProcessorPropertyCodeNumaNode = 0;
pub const WHvNotificationPortTypeEvent = 2;
pub const WHvNotificationPortTypeDoorbell = 4;
pub const WHvNotificationPortPropertyPreferredTargetVp = 1;
pub const WHvNotificationPortPropertyPreferredTargetDuration = 5;
pub const HdvDeviceTypeUndefined = 0;
pub const HdvDeviceTypePCI = 1;
pub const HdvDeviceHostFlagNone = 0;
pub const HdvDeviceHostFlagInitializeComSecurity = 1;
pub const HDV_PCI_BAR0 = 0;
pub const HDV_PCI_BAR1 = 1;
pub const HDV_PCI_BAR2 = 2;
pub const HDV_PCI_BAR3 = 3;
pub const HDV_PCI_BAR4 = 4;
pub const HDV_PCI_BAR5 = 5;
pub const HDV_DOORBELL_FLAG_TRIGGER_SIZE_ANY = 0;
pub const HDV_DOORBELL_FLAG_TRIGGER_SIZE_BYTE = 1;
pub const HDV_DOORBELL_FLAG_TRIGGER_SIZE_WORD = 2;
pub const HDV_DOORBELL_FLAG_TRIGGER_SIZE_DWORD = 3;
pub const HDV_DOORBELL_FLAG_TRIGGER_SIZE_QWORD = 4;
pub const HDV_DOORBELL_FLAG_TRIGGER_ANY_VALUE = -2147483648;
pub const HdvMmioMappingFlagNone = 0;
pub const HdvMmioMappingFlagWriteable = 1;
pub const HdvMmioMappingFlagExecutable = 2;
pub const HdvPciDeviceInterfaceVersionInvalid = 0;
pub const HdvPciDeviceInterfaceVersion1 = 1;
pub const Paging_Invalid = 0;
pub const Paging_NonPaged = 1;
pub const Paging_32Bit = 2;
pub const Paging_Pae = 3;
pub const Paging_Long = 4;
pub const Paging_Armv8 = 5;
pub const Arch_Unknown = 0;
pub const Arch_x86 = 1;
pub const Arch_x64 = 2;
pub const Arch_Armv8 = 3;
pub const ProcessorVendor_Unknown = 0;
pub const ProcessorVendor_Amd = 1;
pub const ProcessorVendor_Intel = 2;
pub const ProcessorVendor_Hygon = 3;
pub const ProcessorVendor_Arm = 4;
pub const GuestOsVendorUndefined = 0;
pub const GuestOsVendorMicrosoft = 1;
pub const GuestOsVendorHPE = 2;
pub const GuestOsVendorLANCOM = 512;
pub const GuestOsMicrosoftUndefined = 0;
pub const GuestOsMicrosoftMSDOS = 1;
pub const GuestOsMicrosoftWindows3x = 2;
pub const GuestOsMicrosoftWindows9x = 3;
pub const GuestOsMicrosoftWindowsNT = 4;
pub const GuestOsMicrosoftWindowsCE = 5;
pub const GuestOsOpenSourceUndefined = 0;
pub const GuestOsOpenSourceLinux = 1;
pub const GuestOsOpenSourceFreeBSD = 2;
pub const GuestOsOpenSourceXen = 3;
pub const GuestOsOpenSourceIllumos = 4;
pub const X64_RegisterRax = 0;
pub const X64_RegisterRcx = 1;
pub const X64_RegisterRdx = 2;
pub const X64_RegisterRbx = 3;
pub const X64_RegisterRsp = 4;
pub const X64_RegisterRbp = 5;
pub const X64_RegisterRsi = 6;
pub const X64_RegisterRdi = 7;
pub const X64_RegisterR8 = 8;
pub const X64_RegisterR9 = 9;
pub const X64_RegisterR10 = 10;
pub const X64_RegisterR11 = 11;
pub const X64_RegisterR12 = 12;
pub const X64_RegisterR13 = 13;
pub const X64_RegisterR14 = 14;
pub const X64_RegisterR15 = 15;
pub const X64_RegisterRip = 16;
pub const X64_RegisterRFlags = 17;
pub const X64_RegisterXmm0 = 18;
pub const X64_RegisterXmm1 = 19;
pub const X64_RegisterXmm2 = 20;
pub const X64_RegisterXmm3 = 21;
pub const X64_RegisterXmm4 = 22;
pub const X64_RegisterXmm5 = 23;
pub const X64_RegisterXmm6 = 24;
pub const X64_RegisterXmm7 = 25;
pub const X64_RegisterXmm8 = 26;
pub const X64_RegisterXmm9 = 27;
pub const X64_RegisterXmm10 = 28;
pub const X64_RegisterXmm11 = 29;
pub const X64_RegisterXmm12 = 30;
pub const X64_RegisterXmm13 = 31;
pub const X64_RegisterXmm14 = 32;
pub const X64_RegisterXmm15 = 33;
pub const X64_RegisterFpMmx0 = 34;
pub const X64_RegisterFpMmx1 = 35;
pub const X64_RegisterFpMmx2 = 36;
pub const X64_RegisterFpMmx3 = 37;
pub const X64_RegisterFpMmx4 = 38;
pub const X64_RegisterFpMmx5 = 39;
pub const X64_RegisterFpMmx6 = 40;
pub const X64_RegisterFpMmx7 = 41;
pub const X64_RegisterFpControlStatus = 42;
pub const X64_RegisterXmmControlStatus = 43;
pub const X64_RegisterCr0 = 44;
pub const X64_RegisterCr2 = 45;
pub const X64_RegisterCr3 = 46;
pub const X64_RegisterCr4 = 47;
pub const X64_RegisterCr8 = 48;
pub const X64_RegisterEfer = 49;
pub const X64_RegisterDr0 = 50;
pub const X64_RegisterDr1 = 51;
pub const X64_RegisterDr2 = 52;
pub const X64_RegisterDr3 = 53;
pub const X64_RegisterDr6 = 54;
pub const X64_RegisterDr7 = 55;
pub const X64_RegisterEs = 56;
pub const X64_RegisterCs = 57;
pub const X64_RegisterSs = 58;
pub const X64_RegisterDs = 59;
pub const X64_RegisterFs = 60;
pub const X64_RegisterGs = 61;
pub const X64_RegisterLdtr = 62;
pub const X64_RegisterTr = 63;
pub const X64_RegisterIdtr = 64;
pub const X64_RegisterGdtr = 65;
pub const X64_RegisterMax = 66;
pub const ARM64_RegisterX0 = 67;
pub const ARM64_RegisterX1 = 68;
pub const ARM64_RegisterX2 = 69;
pub const ARM64_RegisterX3 = 70;
pub const ARM64_RegisterX4 = 71;
pub const ARM64_RegisterX5 = 72;
pub const ARM64_RegisterX6 = 73;
pub const ARM64_RegisterX7 = 74;
pub const ARM64_RegisterX8 = 75;
pub const ARM64_RegisterX9 = 76;
pub const ARM64_RegisterX10 = 77;
pub const ARM64_RegisterX11 = 78;
pub const ARM64_RegisterX12 = 79;
pub const ARM64_RegisterX13 = 80;
pub const ARM64_RegisterX14 = 81;
pub const ARM64_RegisterX15 = 82;
pub const ARM64_RegisterX16 = 83;
pub const ARM64_RegisterX17 = 84;
pub const ARM64_RegisterX18 = 85;
pub const ARM64_RegisterX19 = 86;
pub const ARM64_RegisterX20 = 87;
pub const ARM64_RegisterX21 = 88;
pub const ARM64_RegisterX22 = 89;
pub const ARM64_RegisterX23 = 90;
pub const ARM64_RegisterX24 = 91;
pub const ARM64_RegisterX25 = 92;
pub const ARM64_RegisterX26 = 93;
pub const ARM64_RegisterX27 = 94;
pub const ARM64_RegisterX28 = 95;
pub const ARM64_RegisterXFp = 96;
pub const ARM64_RegisterXLr = 97;
pub const ARM64_RegisterPc = 98;
pub const ARM64_RegisterSpEl0 = 99;
pub const ARM64_RegisterSpEl1 = 100;
pub const ARM64_RegisterCpsr = 101;
pub const ARM64_RegisterQ0 = 102;
pub const ARM64_RegisterQ1 = 103;
pub const ARM64_RegisterQ2 = 104;
pub const ARM64_RegisterQ3 = 105;
pub const ARM64_RegisterQ4 = 106;
pub const ARM64_RegisterQ5 = 107;
pub const ARM64_RegisterQ6 = 108;
pub const ARM64_RegisterQ7 = 109;
pub const ARM64_RegisterQ8 = 110;
pub const ARM64_RegisterQ9 = 111;
pub const ARM64_RegisterQ10 = 112;
pub const ARM64_RegisterQ11 = 113;
pub const ARM64_RegisterQ12 = 114;
pub const ARM64_RegisterQ13 = 115;
pub const ARM64_RegisterQ14 = 116;
pub const ARM64_RegisterQ15 = 117;
pub const ARM64_RegisterQ16 = 118;
pub const ARM64_RegisterQ17 = 119;
pub const ARM64_RegisterQ18 = 120;
pub const ARM64_RegisterQ19 = 121;
pub const ARM64_RegisterQ20 = 122;
pub const ARM64_RegisterQ21 = 123;
pub const ARM64_RegisterQ22 = 124;
pub const ARM64_RegisterQ23 = 125;
pub const ARM64_RegisterQ24 = 126;
pub const ARM64_RegisterQ25 = 127;
pub const ARM64_RegisterQ26 = 128;
pub const ARM64_RegisterQ27 = 129;
pub const ARM64_RegisterQ28 = 130;
pub const ARM64_RegisterQ29 = 131;
pub const ARM64_RegisterQ30 = 132;
pub const ARM64_RegisterQ31 = 133;
pub const ARM64_RegisterFpStatus = 134;
pub const ARM64_RegisterFpControl = 135;
pub const ARM64_RegisterEsrEl1 = 136;
pub const ARM64_RegisterSpsrEl1 = 137;
pub const ARM64_RegisterFarEl1 = 138;
pub const ARM64_RegisterParEl1 = 139;
pub const ARM64_RegisterElrEl1 = 140;
pub const ARM64_RegisterTtbr0El1 = 141;
pub const ARM64_RegisterTtbr1El1 = 142;
pub const ARM64_RegisterVbarEl1 = 143;
pub const ARM64_RegisterSctlrEl1 = 144;
pub const ARM64_RegisterActlrEl1 = 145;
pub const ARM64_RegisterTcrEl1 = 146;
pub const ARM64_RegisterMairEl1 = 147;
pub const ARM64_RegisterAmairEl1 = 148;
pub const ARM64_RegisterTpidrEl0 = 149;
pub const ARM64_RegisterTpidrroEl0 = 150;
pub const ARM64_RegisterTpidrEl1 = 151;
pub const ARM64_RegisterContextIdrEl1 = 152;
pub const ARM64_RegisterCpacrEl1 = 153;
pub const ARM64_RegisterCsselrEl1 = 154;
pub const ARM64_RegisterCntkctlEl1 = 155;
pub const ARM64_RegisterCntvCvalEl0 = 156;
pub const ARM64_RegisterCntvCtlEl0 = 157;
pub const ARM64_RegisterMax = 158;

pub const aliases = struct {
    pub const WHV_CAPABILITY_CODE = i32;
    pub const WHV_PROCESSOR_VENDOR = i32;
    pub const WHV_PARTITION_PROPERTY_CODE = i32;
    pub const WHV_MEMORY_ACCESS_TYPE = i32;
    pub const WHV_X64_CPUID_RESULT2_FLAGS = i32;
    pub const WHV_MSR_ACTION = i32;
    pub const WHV_EXCEPTION_TYPE = i32;
    pub const WHV_X64_LOCAL_APIC_EMULATION_MODE = i32;
    pub const WHV_MAP_GPA_RANGE_FLAGS = i32;
    pub const WHV_TRANSLATE_GVA_FLAGS = i32;
    pub const WHV_TRANSLATE_GVA_RESULT_CODE = i32;
    pub const WHV_CACHE_TYPE = i32;
    pub const WHV_REGISTER_NAME = i32;
    pub const WHV_X64_PENDING_EVENT_TYPE = i32;
    pub const WHV_RUN_VP_EXIT_REASON = i32;
    pub const WHV_X64_UNSUPPORTED_FEATURE_CODE = i32;
    pub const WHV_RUN_VP_CANCEL_REASON = i32;
    pub const WHV_X64_PENDING_INTERRUPTION_TYPE = i32;
    pub const WHV_X64_APIC_WRITE_TYPE = i32;
    pub const WHV_INTERRUPT_TYPE = i32;
    pub const WHV_INTERRUPT_DESTINATION_MODE = i32;
    pub const WHV_INTERRUPT_TRIGGER_MODE = i32;
    pub const WHV_PARTITION_COUNTER_SET = i32;
    pub const WHV_PROCESSOR_COUNTER_SET = i32;
    pub const WHV_ADVISE_GPA_RANGE_CODE = i32;
    pub const WHV_VIRTUAL_PROCESSOR_STATE_TYPE = i32;
    pub const WHV_ALLOCATE_VPCI_RESOURCE_FLAGS = i32;
    pub const WHV_VPCI_DEVICE_NOTIFICATION_TYPE = i32;
    pub const WHV_CREATE_VPCI_DEVICE_FLAGS = i32;
    pub const WHV_VPCI_DEVICE_PROPERTY_CODE = i32;
    pub const WHV_VPCI_MMIO_RANGE_FLAGS = i32;
    pub const WHV_VPCI_DEVICE_REGISTER_SPACE = i32;
    pub const WHV_VPCI_INTERRUPT_TARGET_FLAGS = i32;
    pub const WHV_TRIGGER_TYPE = i32;
    pub const WHV_VIRTUAL_PROCESSOR_PROPERTY_CODE = i32;
    pub const WHV_NOTIFICATION_PORT_TYPE = i32;
    pub const WHV_NOTIFICATION_PORT_PROPERTY_CODE = i32;
    pub const HDV_DEVICE_TYPE = i32;
    pub const HDV_DEVICE_HOST_FLAGS = i32;
    pub const HDV_PCI_BAR_SELECTOR = i32;
    pub const HDV_DOORBELL_FLAGS = i32;
    pub const HDV_MMIO_MAPPING_FLAGS = i32;
    pub const HDV_PCI_INTERFACE_VERSION = i32;
    pub const PAGING_MODE = i32;
    pub const VIRTUAL_PROCESSOR_ARCH = i32;
    pub const VIRTUAL_PROCESSOR_VENDOR = i32;
    pub const GUEST_OS_VENDOR = i32;
    pub const GUEST_OS_MICROSOFT_IDS = i32;
    pub const GUEST_OS_OPENSOURCE_IDS = i32;
    pub const REGISTER_ID = i32;
    pub const WHV_PARTITION_HANDLE = isize;
    pub const WHV_EMULATOR_IO_PORT_CALLBACK = ?*const anyopaque;
    pub const WHV_EMULATOR_MEMORY_CALLBACK = ?*const anyopaque;
    pub const WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK = ?*const anyopaque;
    pub const WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK = ?*const anyopaque;
    pub const WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK = ?*const anyopaque;
    pub const HDV_PCI_DEVICE_INITIALIZE = ?*const anyopaque;
    pub const HDV_PCI_DEVICE_TEARDOWN = ?*const anyopaque;
    pub const HDV_PCI_DEVICE_SET_CONFIGURATION = ?*const anyopaque;
    pub const HDV_PCI_DEVICE_GET_DETAILS = ?*const anyopaque;
    pub const HDV_PCI_DEVICE_START = ?*const anyopaque;
    pub const HDV_PCI_DEVICE_STOP = ?*const anyopaque;
    pub const HDV_PCI_READ_CONFIG_SPACE = ?*const anyopaque;
    pub const HDV_PCI_WRITE_CONFIG_SPACE = ?*const anyopaque;
    pub const HDV_PCI_READ_INTERCEPTED_MEMORY = ?*const anyopaque;
    pub const HDV_PCI_WRITE_INTERCEPTED_MEMORY = ?*const anyopaque;
    pub const GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK = ?*const anyopaque;
    pub const FOUND_IMAGE_CALLBACK = ?*const anyopaque;
};
