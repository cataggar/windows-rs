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
    .{ "QOSCreateHandle", MethodRecord{ .library = "qwave", .import = "QOSCreateHandle", .signature = "\x00\x02\x11\x59\x0f\x11\xb8\x79\x0f\x11\x80\x85" } },
    .{ "QOSCloseHandle", MethodRecord{ .library = "qwave", .import = "QOSCloseHandle", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "QOSStartTrackingClient", MethodRecord{ .library = "qwave", .import = "QOSStartTrackingClient", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xb3\x71\x09" } },
    .{ "QOSStopTrackingClient", MethodRecord{ .library = "qwave", .import = "QOSStopTrackingClient", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xb3\x71\x09" } },
    .{ "QOSEnumerateFlows", MethodRecord{ .library = "qwave", .import = "QOSEnumerateFlows", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x09\x0f\x01" } },
    .{ "QOSAddSocketToFlow", MethodRecord{ .library = "qwave", .import = "QOSAddSocketToFlow", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\xb3\x51\x0f\x11\xb3\x71\x11\xb8\x7d\x09\x0f\x09" } },
    .{ "QOSRemoveSocketFromFlow", MethodRecord{ .library = "qwave", .import = "QOSRemoveSocketFromFlow", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\xb3\x51\x09\x09" } },
    .{ "QOSSetFlow", MethodRecord{ .library = "qwave", .import = "QOSSetFlow", .signature = "\x00\x07\x11\x59\x11\x80\x85\x09\x11\xb8\x81\x09\x0f\x01\x09\x0f\x11\x8b\xed" } },
    .{ "QOSQueryFlow", MethodRecord{ .library = "qwave", .import = "QOSQueryFlow", .signature = "\x00\x07\x11\x59\x11\x80\x85\x09\x11\xb8\x85\x0f\x09\x0f\x01\x09\x0f\x11\x8b\xed" } },
    .{ "QOSNotifyFlow", MethodRecord{ .library = "qwave", .import = "QOSNotifyFlow", .signature = "\x00\x07\x11\x59\x11\x80\x85\x09\x11\xb8\x89\x0f\x09\x0f\x01\x09\x0f\x11\x8b\xed" } },
    .{ "QOSCancel", MethodRecord{ .library = "qwave", .import = "QOSCancel", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x8b\xed" } },
    .{ "TcRegisterClient", MethodRecord{ .library = "TRAFFIC", .import = "TcRegisterClient", .signature = "\x00\x04\x09\x09\x11\x80\x85\x0f\x11\xb8\x8d\x0f\x11\x80\x85" } },
    .{ "TcEnumerateInterfaces", MethodRecord{ .library = "TRAFFIC", .import = "TcEnumerateInterfaces", .signature = "\x00\x03\x09\x11\x80\x85\x0f\x09\x0f\x11\xb8\x91" } },
    .{ "TcOpenInterfaceA", MethodRecord{ .library = "TRAFFIC", .import = "TcOpenInterfaceA", .signature = "\x00\x04\x09\x11\x3d\x11\x80\x85\x11\x80\x85\x0f\x11\x80\x85" } },
    .{ "TcOpenInterfaceW", MethodRecord{ .library = "TRAFFIC", .import = "TcOpenInterfaceW", .signature = "\x00\x04\x09\x11\x05\x11\x80\x85\x11\x80\x85\x0f\x11\x80\x85" } },
    .{ "TcCloseInterface", MethodRecord{ .library = "TRAFFIC", .import = "TcCloseInterface", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "TcQueryInterface", MethodRecord{ .library = "TRAFFIC", .import = "TcQueryInterface", .signature = "\x00\x05\x09\x11\x80\x85\x0f\x11\x0d\x11\x87\x79\x0f\x09\x0f\x01" } },
    .{ "TcSetInterface", MethodRecord{ .library = "TRAFFIC", .import = "TcSetInterface", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x11\x0d\x09\x0f\x01" } },
    .{ "TcQueryFlowA", MethodRecord{ .library = "TRAFFIC", .import = "TcQueryFlowA", .signature = "\x00\x04\x09\x11\x3d\x0f\x11\x0d\x0f\x09\x0f\x01" } },
    .{ "TcQueryFlowW", MethodRecord{ .library = "TRAFFIC", .import = "TcQueryFlowW", .signature = "\x00\x04\x09\x11\x05\x0f\x11\x0d\x0f\x09\x0f\x01" } },
    .{ "TcSetFlowA", MethodRecord{ .library = "TRAFFIC", .import = "TcSetFlowA", .signature = "\x00\x04\x09\x11\x3d\x0f\x11\x0d\x09\x0f\x01" } },
    .{ "TcSetFlowW", MethodRecord{ .library = "TRAFFIC", .import = "TcSetFlowW", .signature = "\x00\x04\x09\x11\x05\x0f\x11\x0d\x09\x0f\x01" } },
    .{ "TcAddFlow", MethodRecord{ .library = "TRAFFIC", .import = "TcAddFlow", .signature = "\x00\x05\x09\x11\x80\x85\x11\x80\x85\x09\x0f\x11\xb8\x95\x0f\x11\x80\x85" } },
    .{ "TcGetFlowNameA", MethodRecord{ .library = "TRAFFIC", .import = "TcGetFlowNameA", .signature = "\x00\x03\x09\x11\x80\x85\x09\x11\x3d" } },
    .{ "TcGetFlowNameW", MethodRecord{ .library = "TRAFFIC", .import = "TcGetFlowNameW", .signature = "\x00\x03\x09\x11\x80\x85\x09\x11\x05" } },
    .{ "TcModifyFlow", MethodRecord{ .library = "TRAFFIC", .import = "TcModifyFlow", .signature = "\x00\x02\x09\x11\x80\x85\x0f\x11\xb8\x95" } },
    .{ "TcAddFilter", MethodRecord{ .library = "TRAFFIC", .import = "TcAddFilter", .signature = "\x00\x03\x09\x11\x80\x85\x0f\x11\xb8\x99\x0f\x11\x80\x85" } },
    .{ "TcDeregisterClient", MethodRecord{ .library = "TRAFFIC", .import = "TcDeregisterClient", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "TcDeleteFlow", MethodRecord{ .library = "TRAFFIC", .import = "TcDeleteFlow", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "TcDeleteFilter", MethodRecord{ .library = "TRAFFIC", .import = "TcDeleteFilter", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "TcEnumerateFlows", MethodRecord{ .library = "TRAFFIC", .import = "TcEnumerateFlows", .signature = "\x00\x05\x09\x11\x80\x85\x0f\x11\x80\x85\x0f\x09\x0f\x09\x0f\x11\xb8\x9d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0xbed => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED" },
        0x3351 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKET" },
        0x3371 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WinSock", .name = "SOCKADDR" },
        0x3879 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.QoS", .name = "QOS_VERSION" },
        0x387d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.QoS", .name = "QOS_TRAFFIC_TYPE" },
        0x3881 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.QoS", .name = "QOS_SET_FLOW" },
        0x3885 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.QoS", .name = "QOS_QUERY_FLOW" },
        0x3889 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.QoS", .name = "QOS_NOTIFY_FLOW" },
        0x388d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.QoS", .name = "TCI_CLIENT_FUNC_LIST" },
        0x3891 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.QoS", .name = "TC_IFC_DESCRIPTOR" },
        0x3895 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.QoS", .name = "TC_GEN_FLOW" },
        0x3899 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.QoS", .name = "TC_GEN_FILTER" },
        0x389d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.QoS", .name = "ENUMERATION_BUFFER" },
        else => null,
    };
}

pub const QOS_MAX_OBJECT_STRING_LENGTH = 256;
pub const QOS_TRAFFIC_GENERAL_ID_BASE = 4000;
pub const SERVICETYPE_NOTRAFFIC = 0;
pub const SERVICETYPE_BESTEFFORT = 1;
pub const SERVICETYPE_CONTROLLEDLOAD = 2;
pub const SERVICETYPE_GUARANTEED = 3;
pub const SERVICETYPE_NETWORK_UNAVAILABLE = 4;
pub const SERVICETYPE_GENERAL_INFORMATION = 5;
pub const SERVICETYPE_NOCHANGE = 6;
pub const SERVICETYPE_NONCONFORMING = 9;
pub const SERVICETYPE_NETWORK_CONTROL = 10;
pub const SERVICETYPE_QUALITATIVE = 13;
pub const SERVICE_BESTEFFORT = 2147549184;
pub const SERVICE_CONTROLLEDLOAD = 2147614720;
pub const SERVICE_GUARANTEED = 2147745792;
pub const SERVICE_QUALITATIVE = 2149580800;
pub const SERVICE_NO_TRAFFIC_CONTROL = 2164260864;
pub const SERVICE_NO_QOS_SIGNALING = 1073741824;
pub const QOS_NOT_SPECIFIED = 4294967295;
pub const POSITIVE_INFINITY_RATE = 4294967294;
pub const QOS_GENERAL_ID_BASE = 2000;
pub const TC_NONCONF_BORROW = 0;
pub const TC_NONCONF_SHAPE = 1;
pub const TC_NONCONF_DISCARD = 2;
pub const TC_NONCONF_BORROW_PLUS = 3;
pub const CURRENT_TCI_VERSION = 2;
pub const TC_NOTIFY_IFC_UP = 1;
pub const TC_NOTIFY_IFC_CLOSE = 2;
pub const TC_NOTIFY_IFC_CHANGE = 3;
pub const TC_NOTIFY_PARAM_CHANGED = 4;
pub const TC_NOTIFY_FLOW_CLOSE = 5;
pub const MAX_STRING_LENGTH = 256;
pub const QOS_OUTGOING_DEFAULT_MINIMUM_BANDWIDTH = 4294967295;
pub const QOS_QUERYFLOW_FRESH = 1;
pub const QOS_NON_ADAPTIVE_FLOW = 2;
pub const RSVP_OBJECT_ID_BASE = 1000;
pub const RSVP_DEFAULT_STYLE = 0;
pub const RSVP_WILDCARD_STYLE = 1;
pub const RSVP_FIXED_FILTER_STYLE = 2;
pub const RSVP_SHARED_EXPLICIT_STYLE = 3;
pub const AD_FLAG_BREAK_BIT = 1;
pub const mIOC_IN = 2147483648;
pub const mIOC_OUT = 1073741824;
pub const mIOC_VENDOR = 67108864;
pub const mCOMPANY = 402653184;
pub const ioctl_code = 1;
pub const QOSSPBASE = 50000;
pub const ALLOWED_TO_SEND_DATA = 50001;
pub const ABLE_TO_RECV_RSVP = 50002;
pub const LINE_RATE = 50003;
pub const LOCAL_TRAFFIC_CONTROL = 50004;
pub const LOCAL_QOSABILITY = 50005;
pub const END_TO_END_QOSABILITY = 50006;
pub const INFO_NOT_AVAILABLE = 4294967295;
pub const ANY_DEST_ADDR = 4294967295;
pub const MODERATELY_DELAY_SENSITIVE = 4294967293;
pub const HIGHLY_DELAY_SENSITIVE = 4294967294;
pub const QOSSP_ERR_BASE = 56000;
pub const GQOS_NO_ERRORCODE = 0;
pub const GQOS_NO_ERRORVALUE = 0;
pub const GQOS_ERRORCODE_UNKNOWN = 4294967295;
pub const GQOS_ERRORVALUE_UNKNOWN = 4294967295;
pub const GQOS_NET_ADMISSION = 56100;
pub const GQOS_NET_POLICY = 56200;
pub const GQOS_RSVP = 56300;
pub const GQOS_API = 56400;
pub const GQOS_KERNEL_TC_SYS = 56500;
pub const GQOS_RSVP_SYS = 56600;
pub const GQOS_KERNEL_TC = 56700;
pub const PE_TYPE_APPID = 3;
pub const PE_ATTRIB_TYPE_POLICY_LOCATOR = 1;
pub const POLICY_LOCATOR_SUB_TYPE_ASCII_DN = 1;
pub const POLICY_LOCATOR_SUB_TYPE_UNICODE_DN = 2;
pub const POLICY_LOCATOR_SUB_TYPE_ASCII_DN_ENC = 3;
pub const POLICY_LOCATOR_SUB_TYPE_UNICODE_DN_ENC = 4;
pub const PE_ATTRIB_TYPE_CREDENTIAL = 2;
pub const CREDENTIAL_SUB_TYPE_ASCII_ID = 1;
pub const CREDENTIAL_SUB_TYPE_UNICODE_ID = 2;
pub const CREDENTIAL_SUB_TYPE_KERBEROS_TKT = 3;
pub const CREDENTIAL_SUB_TYPE_X509_V3_CERT = 4;
pub const CREDENTIAL_SUB_TYPE_PGP_CERT = 5;
pub const TCBASE = 7500;
pub const ERROR_INCOMPATIBLE_TCI_VERSION = 7501;
pub const ERROR_INVALID_SERVICE_TYPE = 7502;
pub const ERROR_INVALID_TOKEN_RATE = 7503;
pub const ERROR_INVALID_PEAK_RATE = 7504;
pub const ERROR_INVALID_SD_MODE = 7505;
pub const ERROR_INVALID_QOS_PRIORITY = 7506;
pub const ERROR_INVALID_TRAFFIC_CLASS = 7507;
pub const ERROR_INVALID_ADDRESS_TYPE = 7508;
pub const ERROR_DUPLICATE_FILTER = 7509;
pub const ERROR_FILTER_CONFLICT = 7510;
pub const ERROR_ADDRESS_TYPE_NOT_SUPPORTED = 7511;
pub const ERROR_TC_SUPPORTED_OBJECTS_EXIST = 7512;
pub const ERROR_INCOMPATABLE_QOS = 7513;
pub const ERROR_TC_NOT_SUPPORTED = 7514;
pub const ERROR_TC_OBJECT_LENGTH_INVALID = 7515;
pub const ERROR_INVALID_FLOW_MODE = 7516;
pub const ERROR_INVALID_DIFFSERV_FLOW = 7517;
pub const ERROR_DS_MAPPING_EXISTS = 7518;
pub const ERROR_INVALID_SHAPE_RATE = 7519;
pub const ERROR_INVALID_DS_CLASS = 7520;
pub const ERROR_TOO_MANY_CLIENTS = 7521;
pub const FSCTL_TCP_BASE = 18;
pub const IF_MIB_STATS_ID = 1;
pub const IP_MIB_STATS_ID = 1;
pub const IP_MIB_ADDRTABLE_ENTRY_ID = 258;
pub const IP_INTFC_INFO_ID = 259;
pub const MAX_PHYSADDR_SIZE = 8;
pub const SIPAEV_PREBOOT_CERT = 0;
pub const SIPAEV_POST_CODE = 1;
pub const SIPAEV_UNUSED = 2;
pub const SIPAEV_NO_ACTION = 3;
pub const SIPAEV_SEPARATOR = 4;
pub const SIPAEV_ACTION = 5;
pub const SIPAEV_EVENT_TAG = 6;
pub const SIPAEV_S_CRTM_CONTENTS = 7;
pub const SIPAEV_S_CRTM_VERSION = 8;
pub const SIPAEV_CPU_MICROCODE = 9;
pub const SIPAEV_PLATFORM_CONFIG_FLAGS = 10;
pub const SIPAEV_TABLE_OF_DEVICES = 11;
pub const SIPAEV_COMPACT_HASH = 12;
pub const SIPAEV_IPL = 13;
pub const SIPAEV_IPL_PARTITION_DATA = 14;
pub const SIPAEV_NONHOST_CODE = 15;
pub const SIPAEV_NONHOST_CONFIG = 16;
pub const SIPAEV_NONHOST_INFO = 17;
pub const SIPAEV_OMIT_BOOT_DEVICE_EVENTS = 18;
pub const SIPAEV_EFI_EVENT_BASE = 2147483648;
pub const SIPAEV_EFI_VARIABLE_DRIVER_CONFIG = 2147483649;
pub const SIPAEV_EFI_VARIABLE_BOOT = 2147483650;
pub const SIPAEV_EFI_BOOT_SERVICES_APPLICATION = 2147483651;
pub const SIPAEV_EFI_BOOT_SERVICES_DRIVER = 2147483652;
pub const SIPAEV_EFI_RUNTIME_SERVICES_DRIVER = 2147483653;
pub const SIPAEV_EFI_GPT_EVENT = 2147483654;
pub const SIPAEV_EFI_ACTION = 2147483655;
pub const SIPAEV_EFI_PLATFORM_FIRMWARE_BLOB = 2147483656;
pub const SIPAEV_EFI_HANDOFF_TABLES = 2147483657;
pub const SIPAEV_EFI_PLATFORM_FIRMWARE_BLOB2 = 2147483658;
pub const SIPAEV_EFI_HANDOFF_TABLES2 = 2147483659;
pub const SIPAEV_EFI_VARIABLE_BOOT2 = 2147483660;
pub const SIPAEV_EFI_HCRTM_EVENT = 2147483664;
pub const SIPAEV_EFI_VARIABLE_AUTHORITY = 2147483872;
pub const SIPAEV_EFI_SPDM_FIRMWARE_BLOB = 2147483873;
pub const SIPAEV_EFI_SPDM_FIRMWARE_CONFIG = 2147483874;
pub const SIPAEV_TXT_EVENT_BASE = 1024;
pub const SIPAEV_TXT_PCR_MAPPING = 1025;
pub const SIPAEV_TXT_HASH_START = 1026;
pub const SIPAEV_TXT_COMBINED_HASH = 1027;
pub const SIPAEV_TXT_MLE_HASH = 1028;
pub const SIPAEV_TXT_BIOSAC_REG_DATA = 1034;
pub const SIPAEV_TXT_CPU_SCRTM_STAT = 1035;
pub const SIPAEV_TXT_LCP_CONTROL_HASH = 1036;
pub const SIPAEV_TXT_ELEMENTS_HASH = 1037;
pub const SIPAEV_TXT_STM_HASH = 1038;
pub const SIPAEV_TXT_OSSINITDATA_CAP_HASH = 1039;
pub const SIPAEV_TXT_SINIT_PUBKEY_HASH = 1040;
pub const SIPAEV_TXT_LCP_HASH = 1041;
pub const SIPAEV_TXT_LCP_DETAILS_HASH = 1042;
pub const SIPAEV_TXT_LCP_AUTHORITIES_HASH = 1043;
pub const SIPAEV_TXT_NV_INFO_HASH = 1044;
pub const SIPAEV_TXT_COLD_BOOT_BIOS_HASH = 1045;
pub const SIPAEV_TXT_KM_HASH = 1046;
pub const SIPAEV_TXT_BPM_HASH = 1047;
pub const SIPAEV_TXT_KM_INFO_HASH = 1048;
pub const SIPAEV_TXT_BPM_INFO_HASH = 1049;
pub const SIPAEV_TXT_BOOT_POL_HASH = 1050;
pub const SIPAEV_TXT_RANDOM_VALUE = 1278;
pub const SIPAEV_TXT_CAP_VALUE = 1279;
pub const SIPAEV_AMD_SL_EVENT_BASE = 32768;
pub const SIPAEV_AMD_SL_LOAD = 32769;
pub const SIPAEV_AMD_SL_PSP_FW_SPLT = 32770;
pub const SIPAEV_AMD_SL_TSME_RB_FUSE = 32771;
pub const SIPAEV_AMD_SL_PUB_KEY = 32772;
pub const SIPAEV_AMD_SL_SVN = 32773;
pub const SIPAEV_AMD_SL_LOAD_1 = 32774;
pub const SIPAEV_AMD_SL_SEPARATOR = 32775;
pub const SIPAEV_AMD_NO_ACTION = 3;
pub const SIPAEV_AMD_BASE_2 = 33280;
pub const SIPAEV_AMD_SPL_TABLE_ROM = 33281;
pub const SIPAEV_AMD_PSP_BL_STAGE_1 = 33282;
pub const SIPAEV_AMD_PSP_KEYDB = 33283;
pub const SIPAEV_AMD_SPL_TABLE_FW = 33284;
pub const SIPAEV_AMD_PSP_BL_STAGE_2 = 33285;
pub const SIPAEV_AMD_PSP_L0_SEC_POL = 33286;
pub const SIPAEV_AMD_PMFW0 = 33287;
pub const SIPAEV_AMD_MP2_CONFIG = 33288;
pub const SIPAEV_AMD_MP2_FW = 33289;
pub const SIPAEV_AMD_ABL_1 = 33290;
pub const SIPAEV_AMD_ABL_2 = 33291;
pub const SIPAEV_AMD_ABL_3 = 33292;
pub const SIPAEV_AMD_ABL_4 = 33293;
pub const SIPAEV_AMD_ABL_5 = 33294;
pub const SIPAEV_AMD_ABL_6 = 33295;
pub const SIPAEV_AMD_ABL_7 = 33296;
pub const SIPAEV_AMD_ABL_8 = 33297;
pub const SIPAEV_AMD_ABL_9 = 33298;
pub const SIPAEV_AMD_ABL_10 = 33299;
pub const SIPAEV_AMD_ABL_11 = 33300;
pub const SIPAEV_AMD_ABL_12 = 33301;
pub const SIPAEV_AMD_ABL_13 = 33302;
pub const SIPAEV_AMD_ABL_14 = 33303;
pub const SIPAEV_AMD_ABL_15 = 33304;
pub const SIPAEV_AMD_ABL_16 = 33305;
pub const SIPAEV_AMD_ABL_17 = 33306;
pub const SIPAEV_AMD_ABL_18 = 33307;
pub const SIPAEV_AMD_ABL_19 = 33308;
pub const SIPAEV_AMD_ABL_20 = 33309;
pub const SIPAEV_AMD_ABL_21 = 33310;
pub const SIPAEV_AMD_ABL_22 = 33311;
pub const SIPAEV_AMD_ABL_23 = 33312;
pub const SIPAEV_AMD_ABL_24 = 33313;
pub const SIPAEV_AMD_ABL_25 = 33314;
pub const SIPAEV_AMD_ABL_26 = 33315;
pub const SIPAEV_AMD_ABL_27 = 33316;
pub const SIPAEV_AMD_ABL_28 = 33317;
pub const SIPAEV_AMD_ABL_29 = 33318;
pub const SIPAEV_AMD_ABL_30 = 33319;
pub const SIPAEV_AMD_ABL_31 = 33320;
pub const SIPAEV_AMD_ABL_32 = 33321;
pub const SIPAEV_AMD_ABL_33 = 33322;
pub const SIPAEV_AMD_ABL_34 = 33323;
pub const SIPAEV_AMD_ABL_35 = 33324;
pub const SIPAEV_AMD_ABL_36 = 33325;
pub const SIPAEV_AMD_ABL_37 = 33326;
pub const SIPAEV_AMD_ABL_38 = 33327;
pub const SIPAEV_AMD_ABL_39 = 33328;
pub const SIPAEV_AMD_ABL_40 = 33329;
pub const SIPAEV_AMD_ABL_41 = 33330;
pub const SIPAEV_AMD_ABL_42 = 33331;
pub const SIPAEV_AMD_ABL_43 = 33332;
pub const SIPAEV_AMD_ABL_44 = 33333;
pub const SIPAEV_AMD_ABL_45 = 33334;
pub const SIPAEV_AMD_ABL_46 = 33335;
pub const SIPAEV_AMD_ABL_47 = 33336;
pub const SIPAEV_AMD_ABL_48 = 33337;
pub const SIPAEV_AMD_MID_SMU = 33338;
pub const SIPAEV_AMD_PM_FW1 = 33339;
pub const SIPAEV_AMD_VBL_1 = 33340;
pub const SIPAEV_AMD_VBL_2 = 33341;
pub const SIPAEV_AMD_VBL_3 = 33342;
pub const SIPAEV_AMD_VBL_4 = 33343;
pub const SIPAEV_AMD_VBL_5 = 33344;
pub const SIPAEV_AMD_VBL_6 = 33345;
pub const SIPAEV_AMD_VBL_7 = 33346;
pub const SIPAEV_AMD_VBL_8 = 33347;
pub const SIPAEV_AMD_VBL_9 = 33348;
pub const SIPAEV_AMD_VBL_10 = 33349;
pub const SIPAEV_AMD_PSP_L1_SEC_POL = 33350;
pub const SIPAEV_AMD_IP_DISCOVERY = 33351;
pub const SIPAEV_AMD_SYS_DRV = 33352;
pub const SIPAEV_AMD_TOS = 33353;
pub const SIPAEV_AMD_PSP_TOS_KEYDB = 33354;
pub const SIPAEV_AMD_ABL_TOC = 33355;
pub const SIPAEV_AMD_PMU1_DATA = 33356;
pub const SIPAEV_AMD_PMU2_DATA = 33357;
pub const SIPAEV_AMD_PMU1 = 33358;
pub const SIPAEV_AMD_PMU2 = 33359;
pub const SIPAEV_AMD_MPIO_FW = 33360;
pub const SIPAEV_AMD_MP5 = 33361;
pub const SIPAEV_AMD_MPCCX = 33362;
pub const SIPAEV_AMD_GMI3 = 33363;
pub const SIPAEV_AMD_TPMLITE = 33364;
pub const SIPAEV_AMD_PSP_SPIROM_CONFIG = 33365;
pub const SIPAEV_AMD_PSP_DF_RIB_TOC = 33366;
pub const SIPAEV_AMD_PSP_DF_RIB0 = 33367;
pub const SIPAEV_AMD_PSP_DF_RIB1 = 33368;
pub const SIPAEV_AMD_PSP_DF_RIB2 = 33369;
pub const SIPAEV_AMD_PSP_DF_RIB3 = 33370;
pub const SIPAEV_AMD_PSP_DF_RIB4 = 33371;
pub const SIPAEV_AMD_PSP_DF_RIB5 = 33372;
pub const SIPAEV_AMD_PSP_DF_RIB6 = 33373;
pub const SIPAEV_AMD_PSP_DF_RIB7 = 33374;
pub const SIPAEV_AMD_PSP_DF_RIB8 = 33375;
pub const SIPAEV_AMD_PSP_DF_RIB9 = 33376;
pub const SIPAEV_AMD_PSP_DF_RIB10 = 33377;
pub const SIPAEV_AMD_PSP_DF_RIB11 = 33378;
pub const SIPAEV_AMD_PSP_DF_RIB12 = 33379;
pub const SIPAEV_AMD_PSP_DF_RIB13 = 33380;
pub const SIPAEV_AMD_PSP_DF_RIB14 = 33381;
pub const SIPAEV_AMD_PSP_DF_RIB15 = 33382;
pub const SIPAEV_AMD_SECURE_DEBUG_UNLOCK = 33383;
pub const SIPAEV_AMD_PSP_BL_END = 33535;
pub const SIPAEV_AMD_FTPM_DRV = 33536;
pub const SIPAEV_AMD_DRTM_DRV = 33537;
pub const SIPAEV_AMD_AGESA_DRV = 33538;
pub const SIPAEV_AMD_PSP_END = 33791;
pub const SIPAEV_ARM_BASE = 36864;
pub const SIPAEV_ARM_PCR_SCHEMA = 36865;
pub const SIPAEV_ARM_DCE = 36866;
pub const SIPAEV_ARM_DCE_PUBKEY = 36867;
pub const SIPAEV_ARM_DLME = 36868;
pub const SIPAEV_ARM_DLME_ENTRY_POINT = 36869;
pub const SIPAEV_ARM_DEBUG_CONFIG = 36870;
pub const SIPAEV_ARM_NONSECURE_CONFIG = 36871;
pub const SIPAEV_ARM_DCE_SECONDARY = 36872;
pub const SIPAEV_ARM_TZFW = 36873;
pub const SIPAEV_ARM_SEPARATOR = 36874;
pub const SIPAEV_ARM_DLME_PUBKEY = 36875;
pub const SIPAEV_ARM_DLME_SVN = 36876;
pub const SIPAEV_ARM_NO_ACTION = 36877;
pub const SIPAEV_ARM_SECURE_INT_DISABLE = 36878;
pub const SIPAEVENTTYPE_NONMEASURED = 2147483648;
pub const SIPAEVENTTYPE_AGGREGATION = 1073741824;
pub const SIPAEVENTTYPE_CONTAINER = 65536;
pub const SIPAEVENTTYPE_INFORMATION = 131072;
pub const SIPAEVENTTYPE_ERROR = 196608;
pub const SIPAEVENTTYPE_PREOSPARAMETER = 262144;
pub const SIPAEVENTTYPE_OSPARAMETER = 327680;
pub const SIPAEVENTTYPE_AUTHORITY = 393216;
pub const SIPAEVENTTYPE_LOADEDMODULE = 458752;
pub const SIPAEVENTTYPE_TRUSTPOINT = 524288;
pub const SIPAEVENTTYPE_ELAM = 589824;
pub const SIPAEVENTTYPE_VBS = 655360;
pub const SIPAEVENTTYPE_KSR = 720896;
pub const SIPAEVENTTYPE_DRTM = 786432;
pub const SIPAERROR_FIRMWAREFAILURE = 196609;
pub const SIPAERROR_INTERNALFAILURE = 196611;
pub const SIPAERROR_HYPERVISORFAILURE = 196613;
pub const SIPAEVENT_INFORMATION = 131073;
pub const SIPAEVENT_BOOTCOUNTER = 131074;
pub const SIPAEVENT_TRANSFER_CONTROL = 131075;
pub const SIPAEVENT_APPLICATION_RETURN = 131076;
pub const SIPAEVENT_BITLOCKER_UNLOCK = 131077;
pub const SIPAEVENT_EVENTCOUNTER = 131078;
pub const SIPAEVENT_COUNTERID = 131079;
pub const SIPAEVENT_MORBIT_NOT_CANCELABLE = 131080;
pub const SIPAEVENT_APPLICATION_SVN = 131081;
pub const SIPAEVENT_SVN_CHAIN_STATUS = 131082;
pub const SIPAEVENT_IDK_GENERATION_STATUS = 131084;
pub const SIPAEVENT_MORBIT_API_STATUS = 131083;
pub const SIPAEVENT_BOOTDEBUGGING = 262145;
pub const SIPAEVENT_BOOT_REVOCATION_LIST = 262146;
pub const SIPAEVENT_OSKERNELDEBUG = 327681;
pub const SIPAEVENT_CODEINTEGRITY = 327682;
pub const SIPAEVENT_TESTSIGNING = 327683;
pub const SIPAEVENT_DATAEXECUTIONPREVENTION = 327684;
pub const SIPAEVENT_SAFEMODE = 327685;
pub const SIPAEVENT_WINPE = 327686;
pub const SIPAEVENT_PHYSICALADDRESSEXTENSION = 327687;
pub const SIPAEVENT_OSDEVICE = 327688;
pub const SIPAEVENT_SYSTEMROOT = 327689;
pub const SIPAEVENT_HYPERVISOR_LAUNCH_TYPE = 327690;
pub const SIPAEVENT_HYPERVISOR_PATH = 327691;
pub const SIPAEVENT_HYPERVISOR_IOMMU_POLICY = 327692;
pub const SIPAEVENT_HYPERVISOR_DEBUG = 327693;
pub const SIPAEVENT_DRIVER_LOAD_POLICY = 327694;
pub const SIPAEVENT_SI_POLICY = 327695;
pub const SIPAEVENT_HYPERVISOR_MMIO_NX_POLICY = 327696;
pub const SIPAEVENT_HYPERVISOR_MSR_FILTER_POLICY = 327697;
pub const SIPAEVENT_VSM_LAUNCH_TYPE = 327698;
pub const SIPAEVENT_OS_REVOCATION_LIST = 327699;
pub const SIPAEVENT_SMT_STATUS = 327700;
pub const SIPAEVENT_VSM_IDK_INFO = 327712;
pub const SIPAEVENT_FLIGHTSIGNING = 327713;
pub const SIPAEVENT_PAGEFILE_ENCRYPTION_ENABLED = 327714;
pub const SIPAEVENT_VSM_IDKS_INFO = 327715;
pub const SIPAEVENT_HIBERNATION_DISABLED = 327716;
pub const SIPAEVENT_DUMPS_DISABLED = 327717;
pub const SIPAEVENT_DUMP_ENCRYPTION_ENABLED = 327718;
pub const SIPAEVENT_DUMP_ENCRYPTION_KEY_DIGEST = 327719;
pub const SIPAEVENT_LSAISO_CONFIG = 327720;
pub const SIPAEVENT_SBCP_INFO = 327721;
pub const SIPAEVENT_HYPERVISOR_BOOT_DMA_PROTECTION = 327728;
pub const SIPAEVENT_SI_POLICY_SIGNER = 327729;
pub const SIPAEVENT_SI_POLICY_UPDATE_SIGNER = 327730;
pub const SIPAEVENT_REFS_VOLUME_CHECKPOINT_RECORD_CHECKSUM = 327731;
pub const SIPAEVENT_REFS_ROLLBACK_PROTECTION_FROZEN_VOLUME_CHECKSUM = 327732;
pub const SIPAEVENT_REFS_ROLLBACK_PROTECTION_USER_PAYLOAD_HASH = 327733;
pub const SIPAEVENT_REFS_ROLLBACK_PROTECTION_VERIFICATION_SUCCEEDED = 327734;
pub const SIPAEVENT_REFS_ROLLBACK_PROTECTION_VOLUME_FIRST_EVER_MOUNT = 327735;
pub const SIPAEVENT_VSM_SEALED_SI_POLICY = 327738;
pub const SIPAEVENT_VSM_DRTM_KEYROLL_DETECTED = 327739;
pub const SIPAEVENT_VSM_SRTM_UNSEAL_POLICY = 327740;
pub const SIPAEVENT_VSM_SRTM_ANTI_ROLLBACK_COUNTER = 327741;
pub const SIPAEVENT_VTL1_DUMP_CONFIG = 327744;
pub const SIPAEVENT_NOAUTHORITY = 393217;
pub const SIPAEVENT_AUTHORITYPUBKEY = 393218;
pub const SIPAEVENT_FILEPATH = 458753;
pub const SIPAEVENT_IMAGESIZE = 458754;
pub const SIPAEVENT_HASHALGORITHMID = 458755;
pub const SIPAEVENT_AUTHENTICODEHASH = 458756;
pub const SIPAEVENT_AUTHORITYISSUER = 458757;
pub const SIPAEVENT_AUTHORITYSERIAL = 458758;
pub const SIPAEVENT_IMAGEBASE = 458759;
pub const SIPAEVENT_AUTHORITYPUBLISHER = 458760;
pub const SIPAEVENT_AUTHORITYSHA1THUMBPRINT = 458761;
pub const SIPAEVENT_IMAGEVALIDATED = 458762;
pub const SIPAEVENT_MODULE_SVN = 458763;
pub const SIPAEVENT_MODULE_PLUTON = 458764;
pub const SIPAEVENT_MODULE_ORIGINAL_FILENAME = 458765;
pub const SIPAEVENT_MODULE_VERSION = 458766;
pub const SIPAEVENT_PUBLISHER_OEMNAME = 458767;
pub const SIPAEVENT_ELAM_KEYNAME = 589825;
pub const SIPAEVENT_ELAM_CONFIGURATION = 589826;
pub const SIPAEVENT_ELAM_POLICY = 589827;
pub const SIPAEVENT_ELAM_MEASURED = 589828;
pub const SIPAEVENT_VBS_VSM_REQUIRED = 655361;
pub const SIPAEVENT_VBS_SECUREBOOT_REQUIRED = 655362;
pub const SIPAEVENT_VBS_IOMMU_REQUIRED = 655363;
pub const SIPAEVENT_VBS_MMIO_NX_REQUIRED = 655364;
pub const SIPAEVENT_VBS_MSR_FILTERING_REQUIRED = 655365;
pub const SIPAEVENT_VBS_MANDATORY_ENFORCEMENT = 655366;
pub const SIPAEVENT_VBS_HVCI_POLICY = 655367;
pub const SIPAEVENT_VBS_MICROSOFT_BOOT_CHAIN_REQUIRED = 655368;
pub const SIPAEVENT_VBS_DUMP_USES_AMEROOT = 655369;
pub const SIPAEVENT_VBS_VSM_NOSECRETS_ENFORCED = 655370;
pub const SIPAEVENT_KSR_SIGNATURE = 720897;
pub const SIPAEVENT_DRTM_STATE_AUTH = 786433;
pub const SIPAEVENT_DRTM_SMM_LEVEL = 786434;
pub const SIPAEVENT_DRTM_AMD_SMM_HASH = 786435;
pub const SIPAEVENT_DRTM_AMD_SMM_SIGNER_KEY = 786436;
pub const FVEB_UNLOCK_FLAG_NONE = 0;
pub const FVEB_UNLOCK_FLAG_CACHED = 1;
pub const FVEB_UNLOCK_FLAG_MEDIA = 2;
pub const FVEB_UNLOCK_FLAG_TPM = 4;
pub const FVEB_UNLOCK_FLAG_PIN = 16;
pub const FVEB_UNLOCK_FLAG_EXTERNAL = 32;
pub const FVEB_UNLOCK_FLAG_RECOVERY = 64;
pub const FVEB_UNLOCK_FLAG_PASSPHRASE = 128;
pub const FVEB_UNLOCK_FLAG_NBP = 256;
pub const FVEB_UNLOCK_FLAG_AUK_OSFVEINFO = 512;
pub const OSDEVICE_TYPE_UNKNOWN = 0;
pub const OSDEVICE_TYPE_BLOCKIO_HARDDISK = 65537;
pub const OSDEVICE_TYPE_BLOCKIO_REMOVABLEDISK = 65538;
pub const OSDEVICE_TYPE_BLOCKIO_CDROM = 65539;
pub const OSDEVICE_TYPE_BLOCKIO_PARTITION = 65540;
pub const OSDEVICE_TYPE_BLOCKIO_FILE = 65541;
pub const OSDEVICE_TYPE_BLOCKIO_RAMDISK = 65542;
pub const OSDEVICE_TYPE_BLOCKIO_VIRTUALHARDDISK = 65543;
pub const OSDEVICE_TYPE_SERIAL = 131072;
pub const OSDEVICE_TYPE_UDP = 196608;
pub const OSDEVICE_TYPE_VMBUS = 262144;
pub const OSDEVICE_TYPE_COMPOSITE = 327680;
pub const OSDEVICE_TYPE_CIMFS = 393216;
pub const SIPAHDRSIGNATURE = 1279476311;
pub const SIPALOGVERSION = 1;
pub const SIPAKSRHDRSIGNATURE = 1297240907;
pub const WBCL_DIGEST_ALG_ID_SHA_1 = 4;
pub const WBCL_DIGEST_ALG_ID_SHA_2_256 = 11;
pub const WBCL_DIGEST_ALG_ID_SHA_2_384 = 12;
pub const WBCL_DIGEST_ALG_ID_SHA_2_512 = 13;
pub const WBCL_DIGEST_ALG_ID_SM3_256 = 18;
pub const WBCL_DIGEST_ALG_ID_SHA3_256 = 39;
pub const WBCL_DIGEST_ALG_ID_SHA3_384 = 40;
pub const WBCL_DIGEST_ALG_ID_SHA3_512 = 41;
pub const WBCL_DIGEST_ALG_BITMAP_SHA_1 = 1;
pub const WBCL_DIGEST_ALG_BITMAP_SHA_2_256 = 2;
pub const WBCL_DIGEST_ALG_BITMAP_SHA_2_384 = 4;
pub const WBCL_DIGEST_ALG_BITMAP_SHA_2_512 = 8;
pub const WBCL_DIGEST_ALG_BITMAP_SM3_256 = 16;
pub const WBCL_DIGEST_ALG_BITMAP_SHA3_256 = 32;
pub const WBCL_DIGEST_ALG_BITMAP_SHA3_384 = 64;
pub const WBCL_DIGEST_ALG_BITMAP_SHA3_512 = 128;
pub const MAX_PLUTON_UPGRADE_FILENAME_LENGTH = 64;
pub const WBCL_MAX_PLUTON_UPGRADE_HASH_LEN = 64;
pub const WBCL_HASH_LEN_SHA1 = 20;
pub const QOSTrafficTypeBestEffort = 0;
pub const QOSTrafficTypeBackground = 1;
pub const QOSTrafficTypeExcellentEffort = 2;
pub const QOSTrafficTypeAudioVideo = 3;
pub const QOSTrafficTypeVoice = 4;
pub const QOSTrafficTypeControl = 5;
pub const QOSSetTrafficType = 0;
pub const QOSSetOutgoingRate = 1;
pub const QOSSetOutgoingDSCPValue = 2;
pub const QOSFlowRateNotApplicable = 0;
pub const QOSFlowRateContentChange = 1;
pub const QOSFlowRateCongestion = 2;
pub const QOSFlowRateHigherContentEncoding = 3;
pub const QOSFlowRateUserCaused = 4;
pub const QOSShapeOnly = 0;
pub const QOSShapeAndMark = 1;
pub const QOSUseNonConformantMarkings = 2;
pub const QOSQueryFlowFundamentals = 0;
pub const QOSQueryPacketPriority = 1;
pub const QOSQueryOutgoingRate = 2;
pub const QOSNotifyCongested = 0;
pub const QOSNotifyUncongested = 1;
pub const QOSNotifyAvailable = 2;
pub const FILTERSPECV4 = 1;
pub const FILTERSPECV6 = 2;
pub const FILTERSPECV6_FLOW = 3;
pub const FILTERSPECV4_GPI = 4;
pub const FILTERSPECV6_GPI = 5;
pub const FILTERSPEC_END = 6;

pub const aliases = struct {
    pub const QOS_TRAFFIC_TYPE = i32;
    pub const QOS_SET_FLOW = i32;
    pub const QOS_FLOWRATE_REASON = i32;
    pub const QOS_SHAPING = i32;
    pub const QOS_QUERY_FLOW = i32;
    pub const QOS_NOTIFY_FLOW = i32;
    pub const FilterType = i32;
    pub const RHANDLE = ?*anyopaque;
};
