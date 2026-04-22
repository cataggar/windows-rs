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
    .{ "GetIScsiVersionInformation", MethodRecord{ .library = "ISCSIDSC", .import = "GetIScsiVersionInformation", .signature = "\x00\x01\x09\x0f\x11\x8a\x4d" } },
    .{ "GetIScsiTargetInformationW", MethodRecord{ .library = "ISCSIDSC", .import = "GetIScsiTargetInformationW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x8a\x51\x0f\x09\x0f\x01" } },
    .{ "GetIScsiTargetInformationA", MethodRecord{ .library = "ISCSIDSC", .import = "GetIScsiTargetInformationA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x11\x8a\x51\x0f\x09\x0f\x01" } },
    .{ "AddIScsiConnectionW", MethodRecord{ .library = "ISCSIDSC", .import = "AddIScsiConnectionW", .signature = "\x00\x09\x09\x0f\x11\x8a\x55\x0f\x01\x09\x0f\x11\x8a\x59\x0b\x0f\x11\x8a\x5d\x09\x11\x3d\x0f\x11\x8a\x55" } },
    .{ "AddIScsiConnectionA", MethodRecord{ .library = "ISCSIDSC", .import = "AddIScsiConnectionA", .signature = "\x00\x09\x09\x0f\x11\x8a\x55\x0f\x01\x09\x0f\x11\x8a\x61\x0b\x0f\x11\x8a\x5d\x09\x11\x3d\x0f\x11\x8a\x55" } },
    .{ "RemoveIScsiConnection", MethodRecord{ .library = "ISCSIDSC", .import = "RemoveIScsiConnection", .signature = "\x00\x02\x09\x0f\x11\x8a\x55\x0f\x11\x8a\x55" } },
    .{ "ReportIScsiTargetsW", MethodRecord{ .library = "ISCSIDSC", .import = "ReportIScsiTargetsW", .signature = "\x00\x03\x09\x11\x87\x79\x0f\x09\x11\x05" } },
    .{ "ReportIScsiTargetsA", MethodRecord{ .library = "ISCSIDSC", .import = "ReportIScsiTargetsA", .signature = "\x00\x03\x09\x11\x87\x79\x0f\x09\x11\x3d" } },
    .{ "AddIScsiStaticTargetW", MethodRecord{ .library = "ISCSIDSC", .import = "AddIScsiStaticTargetW", .signature = "\x00\x07\x09\x11\x05\x11\x05\x09\x11\x87\x79\x0f\x11\x8a\x65\x0f\x11\x8a\x5d\x0f\x11\x8a\x69" } },
    .{ "AddIScsiStaticTargetA", MethodRecord{ .library = "ISCSIDSC", .import = "AddIScsiStaticTargetA", .signature = "\x00\x07\x09\x11\x3d\x11\x3d\x09\x11\x87\x79\x0f\x11\x8a\x6d\x0f\x11\x8a\x5d\x0f\x11\x8a\x71" } },
    .{ "RemoveIScsiStaticTargetW", MethodRecord{ .library = "ISCSIDSC", .import = "RemoveIScsiStaticTargetW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "RemoveIScsiStaticTargetA", MethodRecord{ .library = "ISCSIDSC", .import = "RemoveIScsiStaticTargetA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "AddIScsiSendTargetPortalW", MethodRecord{ .library = "ISCSIDSC", .import = "AddIScsiSendTargetPortalW", .signature = "\x00\x05\x09\x11\x05\x09\x0f\x11\x8a\x5d\x0b\x0f\x11\x8a\x59" } },
    .{ "AddIScsiSendTargetPortalA", MethodRecord{ .library = "ISCSIDSC", .import = "AddIScsiSendTargetPortalA", .signature = "\x00\x05\x09\x11\x3d\x09\x0f\x11\x8a\x5d\x0b\x0f\x11\x8a\x61" } },
    .{ "RemoveIScsiSendTargetPortalW", MethodRecord{ .library = "ISCSIDSC", .import = "RemoveIScsiSendTargetPortalW", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\x8a\x59" } },
    .{ "RemoveIScsiSendTargetPortalA", MethodRecord{ .library = "ISCSIDSC", .import = "RemoveIScsiSendTargetPortalA", .signature = "\x00\x03\x09\x11\x3d\x09\x0f\x11\x8a\x61" } },
    .{ "RefreshIScsiSendTargetPortalW", MethodRecord{ .library = "ISCSIDSC", .import = "RefreshIScsiSendTargetPortalW", .signature = "\x00\x03\x09\x11\x05\x09\x0f\x11\x8a\x59" } },
    .{ "RefreshIScsiSendTargetPortalA", MethodRecord{ .library = "ISCSIDSC", .import = "RefreshIScsiSendTargetPortalA", .signature = "\x00\x03\x09\x11\x3d\x09\x0f\x11\x8a\x61" } },
    .{ "ReportIScsiSendTargetPortalsW", MethodRecord{ .library = "ISCSIDSC", .import = "ReportIScsiSendTargetPortalsW", .signature = "\x00\x02\x09\x0f\x09\x0f\x11\x8a\x75" } },
    .{ "ReportIScsiSendTargetPortalsA", MethodRecord{ .library = "ISCSIDSC", .import = "ReportIScsiSendTargetPortalsA", .signature = "\x00\x02\x09\x0f\x09\x0f\x11\x8a\x79" } },
    .{ "ReportIScsiSendTargetPortalsExW", MethodRecord{ .library = "ISCSIDSC", .import = "ReportIScsiSendTargetPortalsExW", .signature = "\x00\x03\x09\x0f\x09\x0f\x09\x0f\x11\x8a\x7d" } },
    .{ "ReportIScsiSendTargetPortalsExA", MethodRecord{ .library = "ISCSIDSC", .import = "ReportIScsiSendTargetPortalsExA", .signature = "\x00\x03\x09\x0f\x09\x0f\x09\x0f\x11\x8a\x81" } },
    .{ "LoginIScsiTargetW", MethodRecord{ .library = "ISCSIDSC", .import = "LoginIScsiTargetW", .signature = "\x00\x0d\x09\x11\x05\x11\x87\x79\x11\x05\x09\x0f\x11\x8a\x59\x0b\x0f\x11\x8a\x65\x0f\x11\x8a\x5d\x09\x11\x3d\x11\x87\x79\x0f\x11\x8a\x55\x0f\x11\x8a\x55" } },
    .{ "LoginIScsiTargetA", MethodRecord{ .library = "ISCSIDSC", .import = "LoginIScsiTargetA", .signature = "\x00\x0d\x09\x11\x3d\x11\x87\x79\x11\x3d\x09\x0f\x11\x8a\x61\x0b\x0f\x11\x8a\x6d\x0f\x11\x8a\x5d\x09\x11\x3d\x11\x87\x79\x0f\x11\x8a\x55\x0f\x11\x8a\x55" } },
    .{ "ReportIScsiPersistentLoginsW", MethodRecord{ .library = "ISCSIDSC", .import = "ReportIScsiPersistentLoginsW", .signature = "\x00\x03\x09\x0f\x09\x0f\x11\x8a\x85\x0f\x09" } },
    .{ "ReportIScsiPersistentLoginsA", MethodRecord{ .library = "ISCSIDSC", .import = "ReportIScsiPersistentLoginsA", .signature = "\x00\x03\x09\x0f\x09\x0f\x11\x8a\x89\x0f\x09" } },
    .{ "LogoutIScsiTarget", MethodRecord{ .library = "ISCSIDSC", .import = "LogoutIScsiTarget", .signature = "\x00\x01\x09\x0f\x11\x8a\x55" } },
    .{ "RemoveIScsiPersistentTargetW", MethodRecord{ .library = "ISCSIDSC", .import = "RemoveIScsiPersistentTargetW", .signature = "\x00\x04\x09\x11\x05\x09\x11\x05\x0f\x11\x8a\x59" } },
    .{ "RemoveIScsiPersistentTargetA", MethodRecord{ .library = "ISCSIDSC", .import = "RemoveIScsiPersistentTargetA", .signature = "\x00\x04\x09\x11\x3d\x09\x11\x3d\x0f\x11\x8a\x61" } },
    .{ "SendScsiInquiry", MethodRecord{ .library = "ISCSIDSC", .import = "SendScsiInquiry", .signature = "\x00\x09\x09\x0f\x11\x8a\x55\x0b\x05\x05\x0f\x05\x0f\x09\x0f\x05\x0f\x09\x0f\x05" } },
    .{ "SendScsiReadCapacity", MethodRecord{ .library = "ISCSIDSC", .import = "SendScsiReadCapacity", .signature = "\x00\x07\x09\x0f\x11\x8a\x55\x0b\x0f\x05\x0f\x09\x0f\x05\x0f\x09\x0f\x05" } },
    .{ "SendScsiReportLuns", MethodRecord{ .library = "ISCSIDSC", .import = "SendScsiReportLuns", .signature = "\x00\x06\x09\x0f\x11\x8a\x55\x0f\x05\x0f\x09\x0f\x05\x0f\x09\x0f\x05" } },
    .{ "ReportIScsiInitiatorListW", MethodRecord{ .library = "ISCSIDSC", .import = "ReportIScsiInitiatorListW", .signature = "\x00\x02\x09\x0f\x09\x11\x05" } },
    .{ "ReportIScsiInitiatorListA", MethodRecord{ .library = "ISCSIDSC", .import = "ReportIScsiInitiatorListA", .signature = "\x00\x02\x09\x0f\x09\x11\x3d" } },
    .{ "ReportActiveIScsiTargetMappingsW", MethodRecord{ .library = "ISCSIDSC", .import = "ReportActiveIScsiTargetMappingsW", .signature = "\x00\x03\x09\x0f\x09\x0f\x09\x0f\x11\x8a\x65" } },
    .{ "ReportActiveIScsiTargetMappingsA", MethodRecord{ .library = "ISCSIDSC", .import = "ReportActiveIScsiTargetMappingsA", .signature = "\x00\x03\x09\x0f\x09\x0f\x09\x0f\x11\x8a\x6d" } },
    .{ "SetIScsiTunnelModeOuterAddressW", MethodRecord{ .library = "ISCSIDSC", .import = "SetIScsiTunnelModeOuterAddressW", .signature = "\x00\x05\x09\x11\x05\x09\x11\x05\x11\x05\x11\x87\x79" } },
    .{ "SetIScsiTunnelModeOuterAddressA", MethodRecord{ .library = "ISCSIDSC", .import = "SetIScsiTunnelModeOuterAddressA", .signature = "\x00\x05\x09\x11\x3d\x09\x11\x3d\x11\x3d\x11\x87\x79" } },
    .{ "SetIScsiIKEInfoW", MethodRecord{ .library = "ISCSIDSC", .import = "SetIScsiIKEInfoW", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\x8a\x8d\x11\x87\x79" } },
    .{ "SetIScsiIKEInfoA", MethodRecord{ .library = "ISCSIDSC", .import = "SetIScsiIKEInfoA", .signature = "\x00\x04\x09\x11\x3d\x09\x0f\x11\x8a\x8d\x11\x87\x79" } },
    .{ "GetIScsiIKEInfoW", MethodRecord{ .library = "ISCSIDSC", .import = "GetIScsiIKEInfoW", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x09\x0f\x11\x8a\x8d" } },
    .{ "GetIScsiIKEInfoA", MethodRecord{ .library = "ISCSIDSC", .import = "GetIScsiIKEInfoA", .signature = "\x00\x04\x09\x11\x3d\x09\x0f\x09\x0f\x11\x8a\x8d" } },
    .{ "SetIScsiGroupPresharedKey", MethodRecord{ .library = "ISCSIDSC", .import = "SetIScsiGroupPresharedKey", .signature = "\x00\x03\x09\x09\x0f\x05\x11\x87\x79" } },
    .{ "SetIScsiInitiatorCHAPSharedSecret", MethodRecord{ .library = "ISCSIDSC", .import = "SetIScsiInitiatorCHAPSharedSecret", .signature = "\x00\x02\x09\x09\x0f\x05" } },
    .{ "SetIScsiInitiatorRADIUSSharedSecret", MethodRecord{ .library = "ISCSIDSC", .import = "SetIScsiInitiatorRADIUSSharedSecret", .signature = "\x00\x02\x09\x09\x0f\x05" } },
    .{ "SetIScsiInitiatorNodeNameW", MethodRecord{ .library = "ISCSIDSC", .import = "SetIScsiInitiatorNodeNameW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "SetIScsiInitiatorNodeNameA", MethodRecord{ .library = "ISCSIDSC", .import = "SetIScsiInitiatorNodeNameA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "GetIScsiInitiatorNodeNameW", MethodRecord{ .library = "ISCSIDSC", .import = "GetIScsiInitiatorNodeNameW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "GetIScsiInitiatorNodeNameA", MethodRecord{ .library = "ISCSIDSC", .import = "GetIScsiInitiatorNodeNameA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "AddISNSServerW", MethodRecord{ .library = "ISCSIDSC", .import = "AddISNSServerW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "AddISNSServerA", MethodRecord{ .library = "ISCSIDSC", .import = "AddISNSServerA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "RemoveISNSServerW", MethodRecord{ .library = "ISCSIDSC", .import = "RemoveISNSServerW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "RemoveISNSServerA", MethodRecord{ .library = "ISCSIDSC", .import = "RemoveISNSServerA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "RefreshISNSServerW", MethodRecord{ .library = "ISCSIDSC", .import = "RefreshISNSServerW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "RefreshISNSServerA", MethodRecord{ .library = "ISCSIDSC", .import = "RefreshISNSServerA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "ReportISNSServerListW", MethodRecord{ .library = "ISCSIDSC", .import = "ReportISNSServerListW", .signature = "\x00\x02\x09\x0f\x09\x11\x05" } },
    .{ "ReportISNSServerListA", MethodRecord{ .library = "ISCSIDSC", .import = "ReportISNSServerListA", .signature = "\x00\x02\x09\x0f\x09\x11\x3d" } },
    .{ "GetIScsiSessionListW", MethodRecord{ .library = "ISCSIDSC", .import = "GetIScsiSessionListW", .signature = "\x00\x03\x09\x0f\x09\x0f\x09\x0f\x11\x8a\x91" } },
    .{ "GetIScsiSessionListA", MethodRecord{ .library = "ISCSIDSC", .import = "GetIScsiSessionListA", .signature = "\x00\x03\x09\x0f\x09\x0f\x09\x0f\x11\x8a\x95" } },
    .{ "GetIScsiSessionListEx", MethodRecord{ .library = "ISCSIDSC", .import = "GetIScsiSessionListEx", .signature = "\x00\x03\x09\x0f\x09\x0f\x09\x0f\x11\x8a\x99" } },
    .{ "GetDevicesForIScsiSessionW", MethodRecord{ .library = "ISCSIDSC", .import = "GetDevicesForIScsiSessionW", .signature = "\x00\x03\x09\x0f\x11\x8a\x55\x0f\x09\x0f\x11\x8a\x9d" } },
    .{ "GetDevicesForIScsiSessionA", MethodRecord{ .library = "ISCSIDSC", .import = "GetDevicesForIScsiSessionA", .signature = "\x00\x03\x09\x0f\x11\x8a\x55\x0f\x09\x0f\x11\x8a\xa1" } },
    .{ "SetupPersistentIScsiVolumes", MethodRecord{ .library = "ISCSIDSC", .import = "SetupPersistentIScsiVolumes", .signature = "\x00\x00\x09" } },
    .{ "SetupPersistentIScsiDevices", MethodRecord{ .library = "ISCSIDSC", .import = "SetupPersistentIScsiDevices", .signature = "\x00\x00\x09" } },
    .{ "AddPersistentIScsiDeviceW", MethodRecord{ .library = "ISCSIDSC", .import = "AddPersistentIScsiDeviceW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "AddPersistentIScsiDeviceA", MethodRecord{ .library = "ISCSIDSC", .import = "AddPersistentIScsiDeviceA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "RemovePersistentIScsiDeviceW", MethodRecord{ .library = "ISCSIDSC", .import = "RemovePersistentIScsiDeviceW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "RemovePersistentIScsiDeviceA", MethodRecord{ .library = "ISCSIDSC", .import = "RemovePersistentIScsiDeviceA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "ClearPersistentIScsiDevices", MethodRecord{ .library = "ISCSIDSC", .import = "ClearPersistentIScsiDevices", .signature = "\x00\x00\x09" } },
    .{ "ReportPersistentIScsiDevicesW", MethodRecord{ .library = "ISCSIDSC", .import = "ReportPersistentIScsiDevicesW", .signature = "\x00\x02\x09\x0f\x09\x11\x05" } },
    .{ "ReportPersistentIScsiDevicesA", MethodRecord{ .library = "ISCSIDSC", .import = "ReportPersistentIScsiDevicesA", .signature = "\x00\x02\x09\x0f\x09\x11\x3d" } },
    .{ "ReportIScsiTargetPortalsW", MethodRecord{ .library = "ISCSIDSC", .import = "ReportIScsiTargetPortalsW", .signature = "\x00\x05\x09\x11\x05\x11\x05\x0f\x07\x0f\x09\x0f\x11\x8a\x59" } },
    .{ "ReportIScsiTargetPortalsA", MethodRecord{ .library = "ISCSIDSC", .import = "ReportIScsiTargetPortalsA", .signature = "\x00\x05\x09\x11\x3d\x11\x3d\x0f\x07\x0f\x09\x0f\x11\x8a\x61" } },
    .{ "AddRadiusServerW", MethodRecord{ .library = "ISCSIDSC", .import = "AddRadiusServerW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "AddRadiusServerA", MethodRecord{ .library = "ISCSIDSC", .import = "AddRadiusServerA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "RemoveRadiusServerW", MethodRecord{ .library = "ISCSIDSC", .import = "RemoveRadiusServerW", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "RemoveRadiusServerA", MethodRecord{ .library = "ISCSIDSC", .import = "RemoveRadiusServerA", .signature = "\x00\x01\x09\x11\x3d" } },
    .{ "ReportRadiusServerListW", MethodRecord{ .library = "ISCSIDSC", .import = "ReportRadiusServerListW", .signature = "\x00\x02\x09\x0f\x09\x11\x05" } },
    .{ "ReportRadiusServerListA", MethodRecord{ .library = "ISCSIDSC", .import = "ReportRadiusServerListA", .signature = "\x00\x02\x09\x0f\x09\x11\x3d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0xa4d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_VERSION_INFO" },
        0xa51 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "TARGET_INFORMATION_CLASS" },
        0xa55 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_UNIQUE_SESSION_ID" },
        0xa59 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_TARGET_PORTALW" },
        0xa5d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_LOGIN_OPTIONS" },
        0xa61 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_TARGET_PORTALA" },
        0xa65 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_TARGET_MAPPINGW" },
        0xa69 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_TARGET_PORTAL_GROUPW" },
        0xa6d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_TARGET_MAPPINGA" },
        0xa71 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_TARGET_PORTAL_GROUPA" },
        0xa75 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_TARGET_PORTAL_INFOW" },
        0xa79 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_TARGET_PORTAL_INFOA" },
        0xa7d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_TARGET_PORTAL_INFO_EXW" },
        0xa81 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_TARGET_PORTAL_INFO_EXA" },
        0xa85 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "PERSISTENT_ISCSI_LOGIN_INFOW" },
        0xa89 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "PERSISTENT_ISCSI_LOGIN_INFOA" },
        0xa8d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "IKE_AUTHENTICATION_INFORMATION" },
        0xa91 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_SESSION_INFOW" },
        0xa95 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_SESSION_INFOA" },
        0xa99 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_SESSION_INFO_EX" },
        0xa9d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_DEVICE_ON_SESSIONW" },
        0xaa1 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.IscsiDisc", .name = "ISCSI_DEVICE_ON_SESSIONA" },
        else => null,
    };
}

pub const IOCTL_SCSI_BASE = 4;
pub const FILE_DEVICE_SCSI = 27;
pub const IOCTL_SCSI_PASS_THROUGH = 315396;
pub const IOCTL_SCSI_MINIPORT = 315400;
pub const IOCTL_SCSI_GET_INQUIRY_DATA = 266252;
pub const IOCTL_SCSI_GET_CAPABILITIES = 266256;
pub const IOCTL_SCSI_PASS_THROUGH_DIRECT = 315412;
pub const IOCTL_SCSI_GET_ADDRESS = 266264;
pub const IOCTL_SCSI_RESCAN_BUS = 266268;
pub const IOCTL_SCSI_GET_DUMP_POINTERS = 266272;
pub const IOCTL_SCSI_FREE_DUMP_POINTERS = 266276;
pub const IOCTL_IDE_PASS_THROUGH = 315432;
pub const IOCTL_ATA_PASS_THROUGH = 315436;
pub const IOCTL_ATA_PASS_THROUGH_DIRECT = 315440;
pub const IOCTL_ATA_MINIPORT = 315444;
pub const IOCTL_MINIPORT_PROCESS_SERVICE_IRP = 315448;
pub const IOCTL_MPIO_PASS_THROUGH_PATH = 315452;
pub const IOCTL_MPIO_PASS_THROUGH_PATH_DIRECT = 315456;
pub const IOCTL_SCSI_PASS_THROUGH_EX = 315460;
pub const IOCTL_SCSI_PASS_THROUGH_DIRECT_EX = 315464;
pub const IOCTL_MPIO_PASS_THROUGH_PATH_EX = 315468;
pub const IOCTL_MPIO_PASS_THROUGH_PATH_DIRECT_EX = 315472;
pub const ATA_FLAGS_DRDY_REQUIRED = 1;
pub const ATA_FLAGS_DATA_IN = 2;
pub const ATA_FLAGS_DATA_OUT = 4;
pub const ATA_FLAGS_48BIT_COMMAND = 8;
pub const ATA_FLAGS_USE_DMA = 16;
pub const ATA_FLAGS_NO_MULTIPLE = 32;
pub const NRB_FUNCTION_NVCACHE_INFO = 236;
pub const NRB_FUNCTION_SPINDLE_STATUS = 229;
pub const NRB_FUNCTION_NVCACHE_POWER_MODE_SET = 0;
pub const NRB_FUNCTION_NVCACHE_POWER_MODE_RETURN = 1;
pub const NRB_FUNCTION_FLUSH_NVCACHE = 20;
pub const NRB_FUNCTION_QUERY_PINNED_SET = 18;
pub const NRB_FUNCTION_QUERY_CACHE_MISS = 19;
pub const NRB_FUNCTION_ADD_LBAS_PINNED_SET = 16;
pub const NRB_FUNCTION_REMOVE_LBAS_PINNED_SET = 17;
pub const NRB_FUNCTION_QUERY_ASCENDER_STATUS = 208;
pub const NRB_FUNCTION_QUERY_HYBRID_DISK_STATUS = 209;
pub const NRB_FUNCTION_PASS_HINT_PAYLOAD = 224;
pub const NRB_FUNCTION_NVSEPARATED_INFO = 192;
pub const NRB_FUNCTION_NVSEPARATED_FLUSH = 193;
pub const NRB_FUNCTION_NVSEPARATED_WB_DISABLE = 194;
pub const NRB_FUNCTION_NVSEPARATED_WB_REVERT_DEFAULT = 195;
pub const NRB_SUCCESS = 0;
pub const NRB_ILLEGAL_REQUEST = 1;
pub const NRB_INVALID_PARAMETER = 2;
pub const NRB_INPUT_DATA_OVERRUN = 3;
pub const NRB_INPUT_DATA_UNDERRUN = 4;
pub const NRB_OUTPUT_DATA_OVERRUN = 5;
pub const NRB_OUTPUT_DATA_UNDERRUN = 6;
pub const NV_SEP_CACHE_PARAMETER_VERSION_1 = 1;
pub const NV_SEP_CACHE_PARAMETER_VERSION = 1;
pub const STORAGE_DIAGNOSTIC_STATUS_SUCCESS = 0;
pub const STORAGE_DIAGNOSTIC_STATUS_BUFFER_TOO_SMALL = 1;
pub const STORAGE_DIAGNOSTIC_STATUS_UNSUPPORTED_VERSION = 2;
pub const STORAGE_DIAGNOSTIC_STATUS_INVALID_PARAMETER = 3;
pub const STORAGE_DIAGNOSTIC_STATUS_INVALID_SIGNATURE = 4;
pub const STORAGE_DIAGNOSTIC_STATUS_INVALID_TARGET_TYPE = 5;
pub const STORAGE_DIAGNOSTIC_STATUS_MORE_DATA = 6;
pub const MINIPORT_DSM_NOTIFICATION_VERSION_1 = 1;
pub const MINIPORT_DSM_NOTIFICATION_VERSION = 1;
pub const MINIPORT_DSM_PROFILE_UNKNOWN = 0;
pub const MINIPORT_DSM_PROFILE_PAGE_FILE = 1;
pub const MINIPORT_DSM_PROFILE_HIBERNATION_FILE = 2;
pub const MINIPORT_DSM_PROFILE_CRASHDUMP_FILE = 3;
pub const MINIPORT_DSM_NOTIFY_FLAG_BEGIN = 1;
pub const MINIPORT_DSM_NOTIFY_FLAG_END = 2;
pub const HYBRID_FUNCTION_GET_INFO = 1;
pub const HYBRID_FUNCTION_DISABLE_CACHING_MEDIUM = 16;
pub const HYBRID_FUNCTION_ENABLE_CACHING_MEDIUM = 17;
pub const HYBRID_FUNCTION_SET_DIRTY_THRESHOLD = 18;
pub const HYBRID_FUNCTION_DEMOTE_BY_SIZE = 19;
pub const HYBRID_STATUS_SUCCESS = 0;
pub const HYBRID_STATUS_ILLEGAL_REQUEST = 1;
pub const HYBRID_STATUS_INVALID_PARAMETER = 2;
pub const HYBRID_STATUS_OUTPUT_BUFFER_TOO_SMALL = 3;
pub const HYBRID_STATUS_ENABLE_REFCOUNT_HOLD = 16;
pub const HYBRID_REQUEST_BLOCK_STRUCTURE_VERSION = 1;
pub const HYBRID_REQUEST_INFO_STRUCTURE_VERSION = 1;
pub const FIRMWARE_FUNCTION_GET_INFO = 1;
pub const FIRMWARE_FUNCTION_DOWNLOAD = 2;
pub const FIRMWARE_FUNCTION_ACTIVATE = 3;
pub const FIRMWARE_STATUS_SUCCESS = 0;
pub const FIRMWARE_STATUS_ERROR = 1;
pub const FIRMWARE_STATUS_ILLEGAL_REQUEST = 2;
pub const FIRMWARE_STATUS_INVALID_PARAMETER = 3;
pub const FIRMWARE_STATUS_INPUT_BUFFER_TOO_BIG = 4;
pub const FIRMWARE_STATUS_OUTPUT_BUFFER_TOO_SMALL = 5;
pub const FIRMWARE_STATUS_INVALID_SLOT = 6;
pub const FIRMWARE_STATUS_INVALID_IMAGE = 7;
pub const FIRMWARE_STATUS_CONTROLLER_ERROR = 16;
pub const FIRMWARE_STATUS_POWER_CYCLE_REQUIRED = 32;
pub const FIRMWARE_STATUS_DEVICE_ERROR = 64;
pub const FIRMWARE_STATUS_INTERFACE_CRC_ERROR = 128;
pub const FIRMWARE_STATUS_UNCORRECTABLE_DATA_ERROR = 129;
pub const FIRMWARE_STATUS_MEDIA_CHANGE = 130;
pub const FIRMWARE_STATUS_ID_NOT_FOUND = 131;
pub const FIRMWARE_STATUS_MEDIA_CHANGE_REQUEST = 132;
pub const FIRMWARE_STATUS_COMMAND_ABORT = 133;
pub const FIRMWARE_STATUS_END_OF_MEDIA = 134;
pub const FIRMWARE_STATUS_ILLEGAL_LENGTH = 135;
pub const FIRMWARE_REQUEST_BLOCK_STRUCTURE_VERSION = 1;
pub const FIRMWARE_REQUEST_FLAG_CONTROLLER = 1;
pub const FIRMWARE_REQUEST_FLAG_LAST_SEGMENT = 2;
pub const FIRMWARE_REQUEST_FLAG_FIRST_SEGMENT = 4;
pub const FIRMWARE_REQUEST_FLAG_SWITCH_TO_FIRMWARE_WITHOUT_RESET = 268435456;
pub const FIRMWARE_REQUEST_FLAG_REPLACE_AND_SWITCH_UPON_RESET = 536870912;
pub const FIRMWARE_REQUEST_FLAG_REPLACE_EXISTING_IMAGE = 1073741824;
pub const FIRMWARE_REQUEST_FLAG_SWITCH_TO_EXISTING_FIRMWARE = 2147483648;
pub const STORAGE_FIRMWARE_INFO_STRUCTURE_VERSION = 1;
pub const STORAGE_FIRMWARE_INFO_STRUCTURE_VERSION_V2 = 2;
pub const STORAGE_FIRMWARE_INFO_INVALID_SLOT = 255;
pub const STORAGE_FIRMWARE_SLOT_INFO_V2_REVISION_LENGTH = 16;
pub const STORAGE_FIRMWARE_DOWNLOAD_STRUCTURE_VERSION = 1;
pub const STORAGE_FIRMWARE_DOWNLOAD_STRUCTURE_VERSION_V2 = 2;
pub const STORAGE_FIRMWARE_ACTIVATE_STRUCTURE_VERSION = 1;
pub const DUMP_POINTERS_VERSION_1 = 1;
pub const DUMP_POINTERS_VERSION_2 = 2;
pub const DUMP_POINTERS_VERSION_3 = 3;
pub const DUMP_POINTERS_VERSION_4 = 4;
pub const DUMP_DRIVER_NAME_LENGTH = 15;
pub const DUMP_EX_FLAG_SUPPORT_64BITMEMORY = 1;
pub const DUMP_EX_FLAG_SUPPORT_DD_TELEMETRY = 2;
pub const DUMP_EX_FLAG_RESUME_SUPPORT = 4;
pub const DUMP_EX_FLAG_DRIVER_FULL_PATH_SUPPORT = 8;
pub const SCSI_IOCTL_DATA_OUT = 0;
pub const SCSI_IOCTL_DATA_IN = 1;
pub const SCSI_IOCTL_DATA_UNSPECIFIED = 2;
pub const SCSI_IOCTL_DATA_BIDIRECTIONAL = 3;
pub const MPIO_IOCTL_FLAG_USE_PATHID = 1;
pub const MPIO_IOCTL_FLAG_USE_SCSIADDRESS = 2;
pub const MPIO_IOCTL_FLAG_INVOLVE_DSM = 4;
pub const MAX_ISCSI_HBANAME_LEN = 256;
pub const MAX_ISCSI_NAME_LEN = 223;
pub const MAX_ISCSI_ALIAS_LEN = 255;
pub const MAX_ISCSI_PORTAL_NAME_LEN = 256;
pub const MAX_ISCSI_PORTAL_ALIAS_LEN = 256;
pub const MAX_ISCSI_TEXT_ADDRESS_LEN = 256;
pub const MAX_ISCSI_PORTAL_ADDRESS_LEN = 256;
pub const MAX_ISCSI_DISCOVERY_DOMAIN_LEN = 256;
pub const MAX_RADIUS_ADDRESS_LEN = 41;
pub const ISCSI_LOGIN_FLAG_REQUIRE_IPSEC = 1;
pub const ISCSI_LOGIN_FLAG_MULTIPATH_ENABLED = 2;
pub const ISCSI_LOGIN_FLAG_RESERVED1 = 4;
pub const ISCSI_LOGIN_FLAG_ALLOW_PORTAL_HOPPING = 8;
pub const ISCSI_LOGIN_FLAG_USE_RADIUS_RESPONSE = 16;
pub const ISCSI_LOGIN_FLAG_USE_RADIUS_VERIFICATION = 32;
pub const ISCSI_LOGIN_OPTIONS_VERSION = 0;
pub const ISCSI_TARGET_FLAG_HIDE_STATIC_TARGET = 2;
pub const ISCSI_TARGET_FLAG_MERGE_TARGET_INFORMATION = 4;
pub const NVSEPWriteCacheTypeUnknown = 0;
pub const NVSEPWriteCacheTypeNone = 1;
pub const NVSEPWriteCacheTypeWriteBack = 2;
pub const NVSEPWriteCacheTypeWriteThrough = 3;
pub const MpStorageDiagnosticLevelDefault = 0;
pub const MpStorageDiagnosticLevelMax = 1;
pub const MpStorageDiagnosticTargetTypeUndefined = 0;
pub const MpStorageDiagnosticTargetTypeMiniport = 2;
pub const MpStorageDiagnosticTargetTypeHbaFirmware = 3;
pub const MpStorageDiagnosticTargetTypeMax = 4;
pub const NvCacheTypeUnknown = 0;
pub const NvCacheTypeNone = 1;
pub const NvCacheTypeWriteBack = 2;
pub const NvCacheTypeWriteThrough = 3;
pub const NvCacheStatusUnknown = 0;
pub const NvCacheStatusDisabling = 1;
pub const NvCacheStatusDisabled = 2;
pub const NvCacheStatusEnabled = 3;
pub const ISCSI_DIGEST_TYPE_NONE = 0;
pub const ISCSI_DIGEST_TYPE_CRC32C = 1;
pub const ISCSI_NO_AUTH_TYPE = 0;
pub const ISCSI_CHAP_AUTH_TYPE = 1;
pub const ISCSI_MUTUAL_CHAP_AUTH_TYPE = 2;
pub const IKE_AUTHENTICATION_PRESHARED_KEY_METHOD = 1;
pub const ISCSI_TCP_PROTOCOL_TYPE = 0;
pub const ProtocolType = 0;
pub const TargetAlias = 1;
pub const DiscoveryMechanisms = 2;
pub const PortalGroups = 3;
pub const PersistentTargetMappings = 4;
pub const InitiatorName = 5;
pub const TargetFlags = 6;
pub const LoginOptions = 7;

pub const aliases = struct {
    pub const NV_SEP_WRITE_CACHE_TYPE = i32;
    pub const MP_STORAGE_DIAGNOSTIC_LEVEL = i32;
    pub const MP_STORAGE_DIAGNOSTIC_TARGET_TYPE = i32;
    pub const NVCACHE_TYPE = i32;
    pub const NVCACHE_STATUS = i32;
    pub const ISCSI_DIGEST_TYPES = i32;
    pub const ISCSI_AUTH_TYPES = i32;
    pub const IKE_AUTHENTICATION_METHOD = i32;
    pub const TARGETPROTOCOLTYPE = i32;
    pub const TARGET_INFORMATION_CLASS = i32;
    pub const _ADAPTER_OBJECT = isize;
};
