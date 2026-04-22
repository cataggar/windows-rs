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

pub const IOCTL_NFCDTA_CONFIG_RF_DISCOVERY = 2233344;
pub const IOCTL_NFCDTA_REMOTE_DEV_GET_NEXT = 2233348;
pub const IOCTL_NFCDTA_REMOTE_DEV_CONNECT = 2233352;
pub const IOCTL_NFCDTA_REMOTE_DEV_DISCONNECT = 2233356;
pub const IOCTL_NFCDTA_REMOTE_DEV_TRANSCEIVE = 2233360;
pub const IOCTL_NFCDTA_REMOTE_DEV_RECV = 2233364;
pub const IOCTL_NFCDTA_REMOTE_DEV_SEND = 2233368;
pub const IOCTL_NFCDTA_REMOTE_DEV_CHECK_PRESENCE = 2233372;
pub const IOCTL_NFCDTA_CONFIG_P2P_PARAM = 2233376;
pub const IOCTL_NFCDTA_SET_RF_CONFIG = 2233380;
pub const IOCTL_NFCDTA_REMOTE_DEV_NDEF_WRITE = 2233408;
pub const IOCTL_NFCDTA_REMOTE_DEV_NDEF_READ = 2233412;
pub const IOCTL_NFCDTA_REMOTE_DEV_NDEF_CONVERT_READ_ONLY = 2233416;
pub const IOCTL_NFCDTA_REMOTE_DEV_NDEF_CHECK = 2233420;
pub const IOCTL_NFCDTA_LLCP_CONFIG = 2233472;
pub const IOCTL_NFCDTA_LLCP_ACTIVATE = 2233476;
pub const IOCTL_NFCDTA_LLCP_DEACTIVATE = 2233480;
pub const IOCTL_NFCDTA_LLCP_DISCOVER_SERVICES = 2233484;
pub const IOCTL_NFCDTA_LLCP_LINK_STATUS_CHECK = 2233488;
pub const IOCTL_NFCDTA_LLCP_GET_NEXT_LINK_STATUS = 2233492;
pub const IOCTL_NFCDTA_LLCP_SOCKET_CREATE = 2233496;
pub const IOCTL_NFCDTA_LLCP_SOCKET_CLOSE = 2233500;
pub const IOCTL_NFCDTA_LLCP_SOCKET_BIND = 2233504;
pub const IOCTL_NFCDTA_LLCP_SOCKET_LISTEN = 2233508;
pub const IOCTL_NFCDTA_LLCP_SOCKET_ACCEPT = 2233512;
pub const IOCTL_NFCDTA_LLCP_SOCKET_CONNECT = 2233516;
pub const IOCTL_NFCDTA_LLCP_SOCKET_DISCONNECT = 2233520;
pub const IOCTL_NFCDTA_LLCP_SOCKET_RECV = 2233524;
pub const IOCTL_NFCDTA_LLCP_SOCKET_RECV_FROM = 2233528;
pub const IOCTL_NFCDTA_LLCP_SOCKET_SEND = 2233532;
pub const IOCTL_NFCDTA_LLCP_SOCKET_SNED_TO = 2233536;
pub const IOCTL_NFCDTA_LLCP_SOCKET_GET_NEXT_ERROR = 2233540;
pub const IOCTL_NFCDTA_SNEP_INIT_SERVER = 2233600;
pub const IOCTL_NFCDTA_SNEP_DEINIT_SERVER = 2233604;
pub const IOCTL_NFCDTA_SNEP_SERVER_GET_NEXT_CONNECTION = 2233608;
pub const IOCTL_NFCDTA_SNEP_SERVER_ACCEPT = 2233612;
pub const IOCTL_NFCDTA_SNEP_SERVER_GET_NEXT_REQUEST = 2233616;
pub const IOCTL_NFCDTA_SNEP_SERVER_SEND_RESPONSE = 2233620;
pub const IOCTL_NFCDTA_SNEP_INIT_CLIENT = 2233664;
pub const IOCTL_NFCDTA_SNEP_DEINIT_CLIENT = 2233668;
pub const IOCTL_NFCDTA_SNEP_CLIENT_PUT = 2233672;
pub const IOCTL_NFCDTA_SNEP_CLIENT_GET = 2233676;
pub const IOCTL_NFCDTA_SE_ENUMERATE = 2233728;
pub const IOCTL_NFCDTA_SE_SET_EMULATION_MODE = 2233732;
pub const IOCTL_NFCDTA_SE_SET_ROUTING_TABLE = 2233736;
pub const IOCTL_NFCDTA_SE_GET_NEXT_EVENT = 2233740;
pub const MAX_ATR_LENGTH = 48;
pub const MAX_UID_SIZE = 16;
pub const MAX_LLCP_SERVICE_NAME_SIZE = 256;
pub const MAX_SNEP_SERVER_NAME_SIZE = 256;
pub const NFCRMDDI_IOCTL_BASE = 80;
pub const IOCTL_NFCRM_SET_RADIO_STATE = 5308804;
pub const IOCTL_NFCRM_QUERY_RADIO_STATE = 5308808;
pub const IOCTL_NFCSERM_SET_RADIO_STATE = 5308812;
pub const IOCTL_NFCSERM_QUERY_RADIO_STATE = 5308816;
pub const IOCTL_NFCSE_ENUM_ENDPOINTS = 2230272;
pub const IOCTL_NFCSE_SUBSCRIBE_FOR_EVENT = 2230276;
pub const IOCTL_NFCSE_GET_NEXT_EVENT = 2230280;
pub const IOCTL_NFCSE_SET_CARD_EMULATION_MODE = 2230284;
pub const IOCTL_NFCSE_GET_NFCC_CAPABILITIES = 2230288;
pub const IOCTL_NFCSE_GET_ROUTING_TABLE = 2230292;
pub const IOCTL_NFCSE_SET_ROUTING_TABLE = 2230296;
pub const IOCTL_NFCSE_HCE_REMOTE_RECV = 2230592;
pub const IOCTL_NFCSE_HCE_REMOTE_SEND = 2230596;
pub const IOCTL_NFCSE_SET_POWER_MODE = 2230600;
pub const EVT_TRANSACTION_TAG_AID = 129;
pub const EVT_TRANSACTION_TAG_PARAMETERS = 130;
pub const EVT_TRANSACTION_PARAMETER_MAX_LEN = 255;
pub const ISO_7816_MINIMUM_AID_LENGTH = 5;
pub const ISO_7816_MAXIMUM_AID_LENGTH = 16;
pub const Integrated = 0;
pub const External = 1;
pub const DeviceHost = 2;
pub const ExternalReaderArrival = 0;
pub const ExternalReaderDeparture = 1;
pub const ApplicationSelected = 2;
pub const Transaction = 3;
pub const HceActivated = 4;
pub const HceDeactivated = 5;
pub const ExternalFieldEnter = 6;
pub const ExternalFieldExit = 7;
pub const EmulationOff = 0;
pub const EmulationOnPowerIndependent = 1;
pub const EmulationOnPowerDependent = 2;
pub const EmulationStealthListen = 3;
pub const RoutingTypeTech = 0;
pub const RoutingTypeProtocol = 1;
pub const RoutingTypeAid = 2;
pub const SEPowerMode_ForceOn = 0;
pub const SEPowerMode_AllowOff = 1;
pub const RfDiscoveryConfig = 0;
pub const RfDiscoveryStart = 1;
pub const RFDiscoveryResume = 2;
pub const NfcDepDefault = 0;
pub const NfcDepPoll = 1;
pub const NfcDepListen = 2;
pub const NfcType1Tag = 0;
pub const NfcType2Tag = 1;
pub const NfcType3Tag = 2;
pub const NfcType4Tag = 3;
pub const NfcIP1Target = 4;
pub const NfcIP1Initiator = 5;
pub const NfcReader = 6;
pub const IdleMode = 0;
pub const SleepMode = 1;
pub const Discovery = 2;
pub const ConnectionOriented = 0;
pub const Connectionless = 1;
pub const LinkActivated = 0;
pub const LinkDeactivated = 1;
pub const NfcConnectBySap = 0;
pub const NfcConnectByUri = 1;
pub const NfcLlcpErrorDisconnected = 0;
pub const NfcLlcpErrorFrameRejected = 1;
pub const NfcLlcpErrorBusyCondition = 2;
pub const NfcLlcpErrorNotBusyCondition = 3;
pub const DefaultSnepServer = 0;
pub const ExtendedSnepServer = 1;
pub const SnepRequestGet = 0;
pub const SnepRequestPut = 1;
pub const EmulationDisabled = 0;
pub const EmulationEnabled = 1;

pub const aliases = struct {
    pub const SECURE_ELEMENT_TYPE = i32;
    pub const SECURE_ELEMENT_EVENT_TYPE = i32;
    pub const SECURE_ELEMENT_CARD_EMULATION_MODE = i32;
    pub const SECURE_ELEMENT_ROUTING_TYPE = i32;
    pub const SECURE_ELEMENT_POWER_MODE = i32;
    pub const NFC_RF_DISCOVERY_MODE = i32;
    pub const NFC_P2P_MODE = i32;
    pub const NFC_DEVICE_TYPE = i32;
    pub const NFC_RELEASE_TYPE = i32;
    pub const NFC_LLCP_SOCKET_TYPE = i32;
    pub const NFC_LLCP_LINK_STATUS = i32;
    pub const NFC_LLCP_SOCKET_CONNECT_TYPE = i32;
    pub const NFC_LLCP_SOCKET_ERROR = i32;
    pub const NFC_SNEP_SERVER_TYPE = i32;
    pub const NFC_SNEP_REQUEST_TYPE = i32;
    pub const NFC_SE_EMULATION_MODE = i32;
};
