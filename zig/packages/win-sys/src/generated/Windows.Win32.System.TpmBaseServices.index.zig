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
    .{ "Tbsi_Context_Create", MethodRecord{ .library = "tbs", .import = "Tbsi_Context_Create", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x45\x45\x0f\x0f\x01" } },
    .{ "Tbsi_Tpm_Vendor_Maintenance_Mode", MethodRecord{ .library = "tbs", .import = "Tbsi_Tpm_Vendor_Maintenance_Mode", .signature = "\x00\x02\x09\x0f\x11\xc0\x00\x45\x45\x0f\x0f\x01" } },
    .{ "Tbsip_Context_Close", MethodRecord{ .library = "tbs", .import = "Tbsip_Context_Close", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "Tbsip_Submit_Command", MethodRecord{ .library = "tbs", .import = "Tbsip_Submit_Command", .signature = "\x00\x07\x09\x0f\x01\x11\xa3\x31\x11\xa3\x2d\x0f\x05\x09\x0f\x05\x0f\x09" } },
    .{ "Tbsip_Cancel_Commands", MethodRecord{ .library = "tbs", .import = "Tbsip_Cancel_Commands", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "Tbsi_Physical_Presence_Command", MethodRecord{ .library = "tbs", .import = "Tbsi_Physical_Presence_Command", .signature = "\x00\x05\x09\x0f\x01\x0f\x05\x09\x0f\x05\x0f\x09" } },
    .{ "Tbsi_Get_TCG_Log", MethodRecord{ .library = "tbs", .import = "Tbsi_Get_TCG_Log", .signature = "\x00\x03\x09\x0f\x01\x0f\x05\x0f\x09" } },
    .{ "Tbsi_GetDeviceInfo", MethodRecord{ .library = "tbs", .import = "Tbsi_GetDeviceInfo", .signature = "\x00\x02\x09\x09\x0f\x01" } },
    .{ "Tbsi_Get_OwnerAuth", MethodRecord{ .library = "tbs", .import = "Tbsi_Get_OwnerAuth", .signature = "\x00\x04\x09\x0f\x01\x09\x0f\x05\x0f\x09" } },
    .{ "Tbsi_Revoke_Attestation", MethodRecord{ .library = "tbs", .import = "Tbsi_Revoke_Attestation", .signature = "\x00\x00\x09" } },
    .{ "GetDeviceID", MethodRecord{ .library = "tbs", .import = "GetDeviceID", .signature = "\x00\x04\x11\x79\x0f\x05\x09\x0f\x09\x0f\x11\x59" } },
    .{ "GetDeviceIDString", MethodRecord{ .library = "tbs", .import = "GetDeviceIDString", .signature = "\x00\x04\x11\x79\x11\x05\x09\x0f\x09\x0f\x11\x59" } },
    .{ "Tbsi_Create_Windows_Key", MethodRecord{ .library = "tbs", .import = "Tbsi_Create_Windows_Key", .signature = "\x00\x01\x09\x09" } },
    .{ "Tbsi_Get_TCG_Log_Ex", MethodRecord{ .library = "tbs", .import = "Tbsi_Get_TCG_Log_Ex", .signature = "\x00\x03\x09\x09\x0f\x05\x0f\x09" } },
    .{ "Tbsi_Is_Tpm_Present", MethodRecord{ .library = "tbs", .import = "Tbsi_Is_Tpm_Present", .signature = "\x00\x00\x11\x59" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x232d => TypeRefEntry{ .namespace = "Windows.Win32.System.TpmBaseServices", .name = "TBS_COMMAND_PRIORITY" },
        0x2331 => TypeRefEntry{ .namespace = "Windows.Win32.System.TpmBaseServices", .name = "TBS_COMMAND_LOCALITY" },
        0x4545 => TypeRefEntry{ .namespace = "Windows.Win32.System.TpmBaseServices", .name = "TBS_CONTEXT_PARAMS" },
        else => null,
    };
}

pub const TBS_COMMAND_PRIORITY_LOW = 100;
pub const TBS_COMMAND_PRIORITY_NORMAL = 200;
pub const TBS_COMMAND_PRIORITY_SYSTEM = 400;
pub const TBS_COMMAND_PRIORITY_HIGH = 300;
pub const TBS_COMMAND_PRIORITY_MAX = 2147483648;
pub const TBS_COMMAND_LOCALITY_ZERO = 0;
pub const TBS_COMMAND_LOCALITY_ONE = 1;
pub const TBS_COMMAND_LOCALITY_TWO = 2;
pub const TBS_COMMAND_LOCALITY_THREE = 3;
pub const TBS_COMMAND_LOCALITY_FOUR = 4;
pub const TBS_CONTEXT_VERSION_ONE = 1;
pub const TBS_SUCCESS = 0;
pub const TBS_OWNERAUTH_TYPE_FULL = 1;
pub const TBS_OWNERAUTH_TYPE_ADMIN = 2;
pub const TBS_OWNERAUTH_TYPE_USER = 3;
pub const TBS_OWNERAUTH_TYPE_ENDORSEMENT = 4;
pub const TBS_OWNERAUTH_TYPE_ENDORSEMENT_20 = 12;
pub const TBS_OWNERAUTH_TYPE_STORAGE_20 = 13;
pub const TBS_CONTEXT_VERSION_TWO = 2;
pub const TPM_WNF_INFO_CLEAR_SUCCESSFUL = 1;
pub const TPM_WNF_INFO_OWNERSHIP_SUCCESSFUL = 2;
pub const TPM_WNF_INFO_NO_REBOOT_REQUIRED = 1;
pub const TPM_VERSION_UNKNOWN = 0;
pub const TPM_VERSION_12 = 1;
pub const TPM_VERSION_20 = 2;
pub const TPM_IFTYPE_UNKNOWN = 0;
pub const TPM_IFTYPE_1 = 1;
pub const TPM_IFTYPE_TRUSTZONE = 2;
pub const TPM_IFTYPE_HW = 3;
pub const TPM_IFTYPE_EMULATOR = 4;
pub const TPM_IFTYPE_SPB = 5;
pub const TBS_TCGLOG_SRTM_CURRENT = 0;
pub const TBS_TCGLOG_DRTM_CURRENT = 1;
pub const TBS_TCGLOG_SRTM_BOOT = 2;
pub const TBS_TCGLOG_SRTM_RESUME = 3;
pub const TBS_TCGLOG_DRTM_BOOT = 4;
pub const TBS_TCGLOG_DRTM_RESUME = 5;

pub const aliases = struct {
    pub const TBS_COMMAND_PRIORITY = u32;
    pub const TBS_COMMAND_LOCALITY = u32;
};
