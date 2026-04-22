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
    .{ "FaxConnectFaxServerA", MethodRecord{ .library = "WINFAX", .import = "FaxConnectFaxServerA", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x11\x80\x85" } },
    .{ "FaxConnectFaxServerW", MethodRecord{ .library = "WINFAX", .import = "FaxConnectFaxServerW", .signature = "\x00\x02\x11\x59\x11\x05\x0f\x11\x80\x85" } },
    .{ "FaxClose", MethodRecord{ .library = "WINFAX", .import = "FaxClose", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "FaxOpenPort", MethodRecord{ .library = "WINFAX", .import = "FaxOpenPort", .signature = "\x00\x04\x11\x59\x11\x80\x85\x09\x09\x0f\x11\x80\x85" } },
    .{ "FaxCompleteJobParamsA", MethodRecord{ .library = "WINFAX", .import = "FaxCompleteJobParamsA", .signature = "\x00\x02\x11\x59\x0f\x0f\x11\xab\x79\x0f\x0f\x11\xab\x7d" } },
    .{ "FaxCompleteJobParamsW", MethodRecord{ .library = "WINFAX", .import = "FaxCompleteJobParamsW", .signature = "\x00\x02\x11\x59\x0f\x0f\x11\xab\x81\x0f\x0f\x11\xab\x85" } },
    .{ "FaxSendDocumentA", MethodRecord{ .library = "WINFAX", .import = "FaxSendDocumentA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x3d\x0f\x11\xab\x79\x0f\x11\xab\x7d\x0f\x09" } },
    .{ "FaxSendDocumentW", MethodRecord{ .library = "WINFAX", .import = "FaxSendDocumentW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x05\x0f\x11\xab\x81\x0f\x11\xab\x85\x0f\x09" } },
    .{ "FaxSendDocumentForBroadcastA", MethodRecord{ .library = "WINFAX", .import = "FaxSendDocumentForBroadcastA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x3d\x0f\x09\x12\xab\x89\x0f\x01" } },
    .{ "FaxSendDocumentForBroadcastW", MethodRecord{ .library = "WINFAX", .import = "FaxSendDocumentForBroadcastW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x05\x0f\x09\x12\xab\x8d\x0f\x01" } },
    .{ "FaxEnumJobsA", MethodRecord{ .library = "WINFAX", .import = "FaxEnumJobsA", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\x91\x0f\x09" } },
    .{ "FaxEnumJobsW", MethodRecord{ .library = "WINFAX", .import = "FaxEnumJobsW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\x95\x0f\x09" } },
    .{ "FaxGetJobA", MethodRecord{ .library = "WINFAX", .import = "FaxGetJobA", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x0f\x0f\x11\xab\x91" } },
    .{ "FaxGetJobW", MethodRecord{ .library = "WINFAX", .import = "FaxGetJobW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x0f\x0f\x11\xab\x95" } },
    .{ "FaxSetJobA", MethodRecord{ .library = "WINFAX", .import = "FaxSetJobA", .signature = "\x00\x04\x11\x59\x11\x80\x85\x09\x09\x0f\x11\xab\x91" } },
    .{ "FaxSetJobW", MethodRecord{ .library = "WINFAX", .import = "FaxSetJobW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x09\x09\x0f\x11\xab\x95" } },
    .{ "FaxGetPageData", MethodRecord{ .library = "WINFAX", .import = "FaxGetPageData", .signature = "\x00\x06\x11\x59\x11\x80\x85\x09\x0f\x0f\x05\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "FaxGetDeviceStatusA", MethodRecord{ .library = "WINFAX", .import = "FaxGetDeviceStatusA", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\x99" } },
    .{ "FaxGetDeviceStatusW", MethodRecord{ .library = "WINFAX", .import = "FaxGetDeviceStatusW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\x9d" } },
    .{ "FaxAbort", MethodRecord{ .library = "WINFAX", .import = "FaxAbort", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "FaxGetConfigurationA", MethodRecord{ .library = "WINFAX", .import = "FaxGetConfigurationA", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\xa1" } },
    .{ "FaxGetConfigurationW", MethodRecord{ .library = "WINFAX", .import = "FaxGetConfigurationW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\xa5" } },
    .{ "FaxSetConfigurationA", MethodRecord{ .library = "WINFAX", .import = "FaxSetConfigurationA", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xab\xa1" } },
    .{ "FaxSetConfigurationW", MethodRecord{ .library = "WINFAX", .import = "FaxSetConfigurationW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xab\xa5" } },
    .{ "FaxGetLoggingCategoriesA", MethodRecord{ .library = "WINFAX", .import = "FaxGetLoggingCategoriesA", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\xa9\x0f\x09" } },
    .{ "FaxGetLoggingCategoriesW", MethodRecord{ .library = "WINFAX", .import = "FaxGetLoggingCategoriesW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\xad\x0f\x09" } },
    .{ "FaxSetLoggingCategoriesA", MethodRecord{ .library = "WINFAX", .import = "FaxSetLoggingCategoriesA", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xab\xa9\x09" } },
    .{ "FaxSetLoggingCategoriesW", MethodRecord{ .library = "WINFAX", .import = "FaxSetLoggingCategoriesW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\xab\xad\x09" } },
    .{ "FaxEnumPortsA", MethodRecord{ .library = "WINFAX", .import = "FaxEnumPortsA", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\xb1\x0f\x09" } },
    .{ "FaxEnumPortsW", MethodRecord{ .library = "WINFAX", .import = "FaxEnumPortsW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\xb5\x0f\x09" } },
    .{ "FaxGetPortA", MethodRecord{ .library = "WINFAX", .import = "FaxGetPortA", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\xb1" } },
    .{ "FaxGetPortW", MethodRecord{ .library = "WINFAX", .import = "FaxGetPortW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\xb5" } },
    .{ "FaxSetPortA", MethodRecord{ .library = "WINFAX", .import = "FaxSetPortA", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xab\xb1" } },
    .{ "FaxSetPortW", MethodRecord{ .library = "WINFAX", .import = "FaxSetPortW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xab\xb5" } },
    .{ "FaxEnumRoutingMethodsA", MethodRecord{ .library = "WINFAX", .import = "FaxEnumRoutingMethodsA", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\xb9\x0f\x09" } },
    .{ "FaxEnumRoutingMethodsW", MethodRecord{ .library = "WINFAX", .import = "FaxEnumRoutingMethodsW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\xbd\x0f\x09" } },
    .{ "FaxEnableRoutingMethodA", MethodRecord{ .library = "WINFAX", .import = "FaxEnableRoutingMethodA", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x3d\x11\x59" } },
    .{ "FaxEnableRoutingMethodW", MethodRecord{ .library = "WINFAX", .import = "FaxEnableRoutingMethodW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x05\x11\x59" } },
    .{ "FaxEnumGlobalRoutingInfoA", MethodRecord{ .library = "WINFAX", .import = "FaxEnumGlobalRoutingInfoA", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\xc1\x0f\x09" } },
    .{ "FaxEnumGlobalRoutingInfoW", MethodRecord{ .library = "WINFAX", .import = "FaxEnumGlobalRoutingInfoW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x0f\x11\xab\xc5\x0f\x09" } },
    .{ "FaxSetGlobalRoutingInfoA", MethodRecord{ .library = "WINFAX", .import = "FaxSetGlobalRoutingInfoA", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xab\xc1" } },
    .{ "FaxSetGlobalRoutingInfoW", MethodRecord{ .library = "WINFAX", .import = "FaxSetGlobalRoutingInfoW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\xab\xc5" } },
    .{ "FaxGetRoutingInfoA", MethodRecord{ .library = "WINFAX", .import = "FaxGetRoutingInfoA", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x3d\x0f\x0f\x05\x0f\x09" } },
    .{ "FaxGetRoutingInfoW", MethodRecord{ .library = "WINFAX", .import = "FaxGetRoutingInfoW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x05\x0f\x0f\x05\x0f\x09" } },
    .{ "FaxSetRoutingInfoA", MethodRecord{ .library = "WINFAX", .import = "FaxSetRoutingInfoA", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x3d\x0f\x05\x09" } },
    .{ "FaxSetRoutingInfoW", MethodRecord{ .library = "WINFAX", .import = "FaxSetRoutingInfoW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x11\x05\x0f\x05\x09" } },
    .{ "FaxInitializeEventQueue", MethodRecord{ .library = "WINFAX", .import = "FaxInitializeEventQueue", .signature = "\x00\x05\x11\x59\x11\x80\x85\x11\x80\x85\x19\x11\x25\x09" } },
    .{ "FaxFreeBuffer", MethodRecord{ .library = "WINFAX", .import = "FaxFreeBuffer", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "FaxStartPrintJobA", MethodRecord{ .library = "WINFAX", .import = "FaxStartPrintJobA", .signature = "\x00\x04\x11\x59\x11\x3d\x0f\x11\xab\xc9\x0f\x09\x0f\x11\xab\xcd" } },
    .{ "FaxStartPrintJobW", MethodRecord{ .library = "WINFAX", .import = "FaxStartPrintJobW", .signature = "\x00\x04\x11\x59\x11\x05\x0f\x11\xab\xd1\x0f\x09\x0f\x11\xab\xd5" } },
    .{ "FaxPrintCoverPageA", MethodRecord{ .library = "WINFAX", .import = "FaxPrintCoverPageA", .signature = "\x00\x02\x11\x59\x0f\x11\xab\xcd\x0f\x11\xab\x7d" } },
    .{ "FaxPrintCoverPageW", MethodRecord{ .library = "WINFAX", .import = "FaxPrintCoverPageW", .signature = "\x00\x02\x11\x59\x0f\x11\xab\xd5\x0f\x11\xab\x85" } },
    .{ "FaxRegisterServiceProviderW", MethodRecord{ .library = "WINFAX", .import = "FaxRegisterServiceProviderW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "FaxUnregisterServiceProviderW", MethodRecord{ .library = "WINFAX", .import = "FaxUnregisterServiceProviderW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "FaxRegisterRoutingExtensionW", MethodRecord{ .library = "WINFAX", .import = "FaxRegisterRoutingExtensionW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x05\x11\x05\x11\x05\x12\xab\xd9\x0f\x01" } },
    .{ "FaxAccessCheck", MethodRecord{ .library = "WINFAX", .import = "FaxAccessCheck", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "CanSendToFaxRecipient", MethodRecord{ .library = "fxsutility", .import = "CanSendToFaxRecipient", .signature = "\x00\x00\x11\x59" } },
    .{ "SendToFaxRecipient", MethodRecord{ .library = "fxsutility", .import = "SendToFaxRecipient", .signature = "\x00\x02\x09\x11\xab\xdd\x11\x05" } },
    .{ "StiCreateInstanceW", MethodRecord{ .library = "STI", .import = "StiCreateInstanceW", .signature = "\x00\x04\x11\x79\x11\x82\x29\x09\x0f\x12\xab\xe1\x12\x82\xb1" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x2b79 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_JOB_PARAMA" },
        0x2b7d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_COVERPAGE_INFOA" },
        0x2b81 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_JOB_PARAMW" },
        0x2b85 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_COVERPAGE_INFOW" },
        0x2b89 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "PFAX_RECIPIENT_CALLBACKA" },
        0x2b8d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "PFAX_RECIPIENT_CALLBACKW" },
        0x2b91 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_JOB_ENTRYA" },
        0x2b95 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_JOB_ENTRYW" },
        0x2b99 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_DEVICE_STATUSA" },
        0x2b9d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_DEVICE_STATUSW" },
        0x2ba1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_CONFIGURATIONA" },
        0x2ba5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_CONFIGURATIONW" },
        0x2ba9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_LOG_CATEGORYA" },
        0x2bad => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_LOG_CATEGORYW" },
        0x2bb1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_PORT_INFOA" },
        0x2bb5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_PORT_INFOW" },
        0x2bb9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_ROUTING_METHODA" },
        0x2bbd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_ROUTING_METHODW" },
        0x2bc1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_GLOBAL_ROUTING_INFOA" },
        0x2bc5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_GLOBAL_ROUTING_INFOW" },
        0x2bc9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_PRINT_INFOA" },
        0x2bcd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_CONTEXT_INFOA" },
        0x2bd1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_PRINT_INFOW" },
        0x2bd5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "FAX_CONTEXT_INFOW" },
        0x2bd9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "PFAX_ROUTING_INSTALLATION_CALLBACKW" },
        0x2bdd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "SendToMode" },
        0x2be1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Fax", .name = "IStillImageW" },
        else => null,
    };
}

pub const prv_DEFAULT_PREFETCH_SIZE = 100;
pub const FS_INITIALIZING = 536870912;
pub const FS_DIALING = 536870913;
pub const FS_TRANSMITTING = 536870914;
pub const FS_RECEIVING = 536870916;
pub const FS_COMPLETED = 536870920;
pub const FS_HANDLED = 536870928;
pub const FS_LINE_UNAVAILABLE = 536870944;
pub const FS_BUSY = 536870976;
pub const FS_NO_ANSWER = 536871040;
pub const FS_BAD_ADDRESS = 536871168;
pub const FS_NO_DIAL_TONE = 536871424;
pub const FS_DISCONNECTED = 536871936;
pub const FS_FATAL_ERROR = 536872960;
pub const FS_NOT_FAX_CALL = 536875008;
pub const FS_CALL_DELAYED = 536879104;
pub const FS_CALL_BLACKLISTED = 536887296;
pub const FS_USER_ABORT = 538968064;
pub const FS_ANSWERED = 545259520;
pub const FAXDEVRECEIVE_SIZE = 4096;
pub const FAXDEVREPORTSTATUS_SIZE = 4096;
pub const FAX_ERR_START = 7001;
pub const FAX_ERR_SRV_OUTOFMEMORY = 7001;
pub const FAX_ERR_GROUP_NOT_FOUND = 7002;
pub const FAX_ERR_BAD_GROUP_CONFIGURATION = 7003;
pub const FAX_ERR_GROUP_IN_USE = 7004;
pub const FAX_ERR_RULE_NOT_FOUND = 7005;
pub const FAX_ERR_NOT_NTFS = 7006;
pub const FAX_ERR_DIRECTORY_IN_USE = 7007;
pub const FAX_ERR_FILE_ACCESS_DENIED = 7008;
pub const FAX_ERR_MESSAGE_NOT_FOUND = 7009;
pub const FAX_ERR_DEVICE_NUM_LIMIT_EXCEEDED = 7010;
pub const FAX_ERR_NOT_SUPPORTED_ON_THIS_SKU = 7011;
pub const FAX_ERR_VERSION_MISMATCH = 7012;
pub const FAX_ERR_RECIPIENTS_LIMIT = 7013;
pub const FAX_ERR_END = 7013;
pub const FAX_E_SRV_OUTOFMEMORY = -2147214503;
pub const FAX_E_GROUP_NOT_FOUND = -2147214502;
pub const FAX_E_BAD_GROUP_CONFIGURATION = -2147214501;
pub const FAX_E_GROUP_IN_USE = -2147214500;
pub const FAX_E_RULE_NOT_FOUND = -2147214499;
pub const FAX_E_NOT_NTFS = -2147214498;
pub const FAX_E_DIRECTORY_IN_USE = -2147214497;
pub const FAX_E_FILE_ACCESS_DENIED = -2147214496;
pub const FAX_E_MESSAGE_NOT_FOUND = -2147214495;
pub const FAX_E_DEVICE_NUM_LIMIT_EXCEEDED = -2147214494;
pub const FAX_E_NOT_SUPPORTED_ON_THIS_SKU = -2147214493;
pub const FAX_E_VERSION_MISMATCH = -2147214492;
pub const FAX_E_RECIPIENTS_LIMIT = -2147214491;
pub const JT_UNKNOWN = 0;
pub const JT_SEND = 1;
pub const JT_RECEIVE = 2;
pub const JT_ROUTING = 3;
pub const JT_FAIL_RECEIVE = 4;
pub const JS_PENDING = 0;
pub const JS_INPROGRESS = 1;
pub const JS_DELETING = 2;
pub const JS_FAILED = 4;
pub const JS_PAUSED = 8;
pub const JS_NOLINE = 16;
pub const JS_RETRYING = 32;
pub const JS_RETRIES_EXCEEDED = 64;
pub const FPS_DIALING = 536870913;
pub const FPS_SENDING = 536870914;
pub const FPS_RECEIVING = 536870916;
pub const FPS_COMPLETED = 536870920;
pub const FPS_HANDLED = 536870928;
pub const FPS_UNAVAILABLE = 536870944;
pub const FPS_BUSY = 536870976;
pub const FPS_NO_ANSWER = 536871040;
pub const FPS_BAD_ADDRESS = 536871168;
pub const FPS_NO_DIAL_TONE = 536871424;
pub const FPS_DISCONNECTED = 536871936;
pub const FPS_FATAL_ERROR = 536872960;
pub const FPS_NOT_FAX_CALL = 536875008;
pub const FPS_CALL_DELAYED = 536879104;
pub const FPS_CALL_BLACKLISTED = 536887296;
pub const FPS_INITIALIZING = 536903680;
pub const FPS_OFFLINE = 536936448;
pub const FPS_RINGING = 537001984;
pub const FPS_AVAILABLE = 537919488;
pub const FPS_ABORTING = 538968064;
pub const FPS_ROUTING = 541065216;
pub const FPS_ANSWERED = 545259520;
pub const FPF_RECEIVE = 1;
pub const FPF_SEND = 2;
pub const FPF_VIRTUAL = 4;
pub const FEI_DIALING = 1;
pub const FEI_SENDING = 2;
pub const FEI_RECEIVING = 3;
pub const FEI_COMPLETED = 4;
pub const FEI_BUSY = 5;
pub const FEI_NO_ANSWER = 6;
pub const FEI_BAD_ADDRESS = 7;
pub const FEI_NO_DIAL_TONE = 8;
pub const FEI_DISCONNECTED = 9;
pub const FEI_FATAL_ERROR = 10;
pub const FEI_NOT_FAX_CALL = 11;
pub const FEI_CALL_DELAYED = 12;
pub const FEI_CALL_BLACKLISTED = 13;
pub const FEI_RINGING = 14;
pub const FEI_ABORTING = 15;
pub const FEI_ROUTING = 16;
pub const FEI_MODEM_POWERED_ON = 17;
pub const FEI_MODEM_POWERED_OFF = 18;
pub const FEI_IDLE = 19;
pub const FEI_FAXSVC_ENDED = 20;
pub const FEI_ANSWERED = 21;
pub const FEI_JOB_QUEUED = 22;
pub const FEI_DELETED = 23;
pub const FEI_INITIALIZING = 24;
pub const FEI_LINE_UNAVAILABLE = 25;
pub const FEI_HANDLED = 26;
pub const FEI_FAXSVC_STARTED = 27;
pub const FEI_NEVENTS = 27;
pub const FAX_JOB_SUBMIT = 1;
pub const FAX_JOB_QUERY = 2;
pub const FAX_CONFIG_QUERY = 4;
pub const FAX_CONFIG_SET = 8;
pub const FAX_PORT_QUERY = 16;
pub const FAX_PORT_SET = 32;
pub const FAX_JOB_MANAGE = 64;
pub const STI_UNICODE = 1;
pub const STI_VERSION_FLAG_MASK = 4278190080;
pub const STI_VERSION_FLAG_UNICODE = 16777216;
pub const STI_VERSION_REAL = 2;
pub const STI_VERSION_MIN_ALLOWED = 2;
pub const STI_VERSION = 2;
pub const STI_MAX_INTERNAL_NAME_LENGTH = 128;
pub const STI_GENCAP_COMMON_MASK = 255;
pub const STI_GENCAP_NOTIFICATIONS = 1;
pub const STI_GENCAP_POLLING_NEEDED = 2;
pub const STI_GENCAP_GENERATE_ARRIVALEVENT = 4;
pub const STI_GENCAP_AUTO_PORTSELECT = 8;
pub const STI_GENCAP_WIA = 16;
pub const STI_GENCAP_SUBSET = 32;
pub const WIA_INCOMPAT_XP = 1;
pub const STI_HW_CONFIG_UNKNOWN = 1;
pub const STI_HW_CONFIG_SCSI = 2;
pub const STI_HW_CONFIG_USB = 4;
pub const STI_HW_CONFIG_SERIAL = 8;
pub const STI_HW_CONFIG_PARALLEL = 16;
pub const STI_DEVSTATUS_ONLINE_STATE = 1;
pub const STI_DEVSTATUS_EVENTS_STATE = 2;
pub const STI_ONLINESTATE_OPERATIONAL = 1;
pub const STI_ONLINESTATE_PENDING = 2;
pub const STI_ONLINESTATE_ERROR = 4;
pub const STI_ONLINESTATE_PAUSED = 8;
pub const STI_ONLINESTATE_PAPER_JAM = 16;
pub const STI_ONLINESTATE_PAPER_PROBLEM = 32;
pub const STI_ONLINESTATE_OFFLINE = 64;
pub const STI_ONLINESTATE_IO_ACTIVE = 128;
pub const STI_ONLINESTATE_BUSY = 256;
pub const STI_ONLINESTATE_TRANSFERRING = 512;
pub const STI_ONLINESTATE_INITIALIZING = 1024;
pub const STI_ONLINESTATE_WARMING_UP = 2048;
pub const STI_ONLINESTATE_USER_INTERVENTION = 4096;
pub const STI_ONLINESTATE_POWER_SAVE = 8192;
pub const STI_EVENTHANDLING_ENABLED = 1;
pub const STI_EVENTHANDLING_POLLING = 2;
pub const STI_EVENTHANDLING_PENDING = 4;
pub const STI_DIAGCODE_HWPRESENCE = 1;
pub const STI_TRACE_INFORMATION = 1;
pub const STI_TRACE_WARNING = 2;
pub const STI_TRACE_ERROR = 4;
pub const STI_SUBSCRIBE_FLAG_WINDOW = 1;
pub const STI_SUBSCRIBE_FLAG_EVENT = 2;
pub const MAX_NOTIFICATION_DATA = 64;
pub const STI_DEVICE_CREATE_STATUS = 1;
pub const STI_DEVICE_CREATE_DATA = 2;
pub const STI_DEVICE_CREATE_BOTH = 3;
pub const STI_DEVICE_CREATE_MASK = 65535;
pub const STIEDFL_ALLDEVICES = 0;
pub const STIEDFL_ATTACHEDONLY = 1;
pub const STI_RAW_RESERVED = 4096;
pub const STI_OK = 0;
pub const STI_ERROR_NO_ERROR = 0;
pub const STI_NOTCONNECTED = 1;
pub const STI_CHANGENOEFFECT = 1;
pub const STIERR_OLD_VERSION = -2147023746;
pub const STIERR_BETA_VERSION = -2147023743;
pub const STIERR_BADDRIVER = -2147024777;
pub const STIERR_DEVICENOTREG = -2147221164;
pub const STIERR_OBJECTNOTFOUND = -2147024894;
pub const STIERR_INVALID_PARAM = -2147024809;
pub const STIERR_NOINTERFACE = -2147467262;
pub const STIERR_GENERIC = -2147467259;
pub const STIERR_OUTOFMEMORY = -2147024882;
pub const STIERR_UNSUPPORTED = -2147467263;
pub const STIERR_NOT_INITIALIZED = -2147024875;
pub const STIERR_ALREADY_INITIALIZED = -2147023649;
pub const STIERR_DEVICE_LOCKED = -2147024863;
pub const STIERR_READONLY = -2147024891;
pub const STIERR_NOTINITIALIZED = -2147024891;
pub const STIERR_NEEDS_LOCK = -2147024738;
pub const STIERR_SHARING_VIOLATION = -2147024864;
pub const STIERR_HANDLEEXISTS = -2147024713;
pub const STIERR_INVALID_DEVICE_NAME = -2147024773;
pub const STIERR_INVALID_HW_TYPE = -2147024883;
pub const STIERR_NOEVENTS = -2147024637;
pub const STIERR_DEVICE_NOTREADY = -2147024875;
pub const IS_DIGITAL_CAMERA_VAL = 1;
pub const SUPPORTS_MSCPLUS_VAL = 1;
pub const STI_USD_GENCAP_NATIVE_PUSHSUPPORT = 1;
pub const STI_DEVICE_CREATE_FOR_MONITOR = 16777216;
pub const lDEFAULT_PREFETCH_SIZE = 100;
pub const wcharREASSIGN_RECIPIENTS_DELIMITER = 59;
pub const FAXLOG_LEVEL_NONE = 0;
pub const FAXLOG_LEVEL_MIN = 1;
pub const FAXLOG_LEVEL_MED = 2;
pub const FAXLOG_LEVEL_MAX = 3;
pub const FAXLOG_CATEGORY_INIT = 1;
pub const FAXLOG_CATEGORY_OUTBOUND = 2;
pub const FAXLOG_CATEGORY_INBOUND = 3;
pub const FAXLOG_CATEGORY_UNKNOWN = 4;
pub const JC_UNKNOWN = 0;
pub const JC_DELETE = 1;
pub const JC_PAUSE = 2;
pub const JC_RESUME = 3;
pub const JSA_NOW = 0;
pub const JSA_SPECIFIC_TIME = 1;
pub const JSA_DISCOUNT_PERIOD = 2;
pub const DRT_NONE = 0;
pub const DRT_EMAIL = 1;
pub const DRT_INBOX = 2;
pub const PORT_OPEN_QUERY = 1;
pub const PORT_OPEN_MODIFY = 2;
pub const fjsPENDING = 1;
pub const fjsINPROGRESS = 2;
pub const fjsFAILED = 8;
pub const fjsPAUSED = 16;
pub const fjsNOLINE = 32;
pub const fjsRETRYING = 64;
pub const fjsRETRIES_EXCEEDED = 128;
pub const fjsCOMPLETED = 256;
pub const fjsCANCELED = 512;
pub const fjsCANCELING = 1024;
pub const fjsROUTING = 2048;
pub const fjesNONE = 0;
pub const fjesDISCONNECTED = 1;
pub const fjesINITIALIZING = 2;
pub const fjesDIALING = 3;
pub const fjesTRANSMITTING = 4;
pub const fjesANSWERED = 5;
pub const fjesRECEIVING = 6;
pub const fjesLINE_UNAVAILABLE = 7;
pub const fjesBUSY = 8;
pub const fjesNO_ANSWER = 9;
pub const fjesBAD_ADDRESS = 10;
pub const fjesNO_DIAL_TONE = 11;
pub const fjesFATAL_ERROR = 12;
pub const fjesCALL_DELAYED = 13;
pub const fjesCALL_BLACKLISTED = 14;
pub const fjesNOT_FAX_CALL = 15;
pub const fjesPARTIALLY_RECEIVED = 16;
pub const fjesHANDLED = 17;
pub const fjesCALL_COMPLETED = 18;
pub const fjesCALL_ABORTED = 19;
pub const fjesPROPRIETARY = 16777216;
pub const fjoVIEW = 1;
pub const fjoPAUSE = 2;
pub const fjoRESUME = 4;
pub const fjoRESTART = 8;
pub const fjoDELETE = 16;
pub const fjoRECIPIENT_INFO = 32;
pub const fjoSENDER_INFO = 64;
pub const fjtSEND = 0;
pub const fjtRECEIVE = 1;
pub const fjtROUTING = 2;
pub const fsetNONE = 0;
pub const fsetIN_QUEUE = 1;
pub const fsetOUT_QUEUE = 2;
pub const fsetCONFIG = 4;
pub const fsetACTIVITY = 8;
pub const fsetQUEUE_STATE = 16;
pub const fsetIN_ARCHIVE = 32;
pub const fsetOUT_ARCHIVE = 64;
pub const fsetFXSSVC_ENDED = 128;
pub const fsetDEVICE_STATUS = 256;
pub const fsetINCOMING_CALL = 512;
pub const fsAPI_VERSION_0 = 0;
pub const fsAPI_VERSION_1 = 65536;
pub const fsAPI_VERSION_2 = 131072;
pub const fsAPI_VERSION_3 = 196608;
pub const fsatANONYMOUS = 0;
pub const fsatBASIC = 1;
pub const fsatNTLM = 2;
pub const frtNONE = 0;
pub const frtMAIL = 1;
pub const frtMSGBOX = 4;
pub const farSUBMIT_LOW = 1;
pub const farSUBMIT_NORMAL = 2;
pub const farSUBMIT_HIGH = 4;
pub const farQUERY_JOBS = 8;
pub const farMANAGE_JOBS = 16;
pub const farQUERY_CONFIG = 32;
pub const farMANAGE_CONFIG = 64;
pub const farQUERY_IN_ARCHIVE = 128;
pub const farMANAGE_IN_ARCHIVE = 256;
pub const farQUERY_OUT_ARCHIVE = 512;
pub const farMANAGE_OUT_ARCHIVE = 1024;
pub const fptLOW = 0;
pub const fptNORMAL = 1;
pub const fptHIGH = 2;
pub const fcptNONE = 0;
pub const fcptLOCAL = 1;
pub const fcptSERVER = 2;
pub const fstNOW = 0;
pub const fstSPECIFIC_TIME = 1;
pub const fstDISCOUNT_PERIOD = 2;
pub const fpsSUCCESS = 0;
pub const fpsSERVER_ERROR = 1;
pub const fpsBAD_GUID = 2;
pub const fpsBAD_VERSION = 3;
pub const fpsCANT_LOAD = 4;
pub const fpsCANT_LINK = 5;
pub const fpsCANT_INIT = 6;
pub const fdrmNO_ANSWER = 0;
pub const fdrmAUTO_ANSWER = 1;
pub const fdrmMANUAL_ANSWER = 2;
pub const fllNONE = 0;
pub const fllMIN = 1;
pub const fllMED = 2;
pub const fllMAX = 3;
pub const fgsALL_DEV_VALID = 0;
pub const fgsEMPTY = 1;
pub const fgsALL_DEV_NOT_VALID = 2;
pub const fgsSOME_DEV_NOT_VALID = 3;
pub const frsVALID = 0;
pub const frsEMPTY_GROUP = 1;
pub const frsALL_GROUP_DEV_NOT_VALID = 2;
pub const frsSOME_GROUP_DEV_NOT_VALID = 3;
pub const frsBAD_DEVICE = 4;
pub const faetNONE = 0;
pub const faetIN_QUEUE = 1;
pub const faetOUT_QUEUE = 2;
pub const faetIN_ARCHIVE = 4;
pub const faetOUT_ARCHIVE = 8;
pub const faetFXSSVC_ENDED = 16;
pub const far2SUBMIT_LOW = 1;
pub const far2SUBMIT_NORMAL = 2;
pub const far2SUBMIT_HIGH = 4;
pub const far2QUERY_OUT_JOBS = 8;
pub const far2MANAGE_OUT_JOBS = 16;
pub const far2QUERY_CONFIG = 32;
pub const far2MANAGE_CONFIG = 64;
pub const far2QUERY_ARCHIVES = 128;
pub const far2MANAGE_ARCHIVES = 256;
pub const far2MANAGE_RECEIVE_FOLDER = 512;
pub const frrcANY_CODE = 0;
pub const QUERY_STATUS = -1;
pub const STATUS_DISABLE = 0;
pub const STATUS_ENABLE = 1;
pub const DEV_ID_SRC_FAX = 0;
pub const DEV_ID_SRC_TAPI = 1;
pub const SEND_TO_FAX_RECIPIENT_ATTACHMENT = 0;
pub const StiDeviceTypeDefault = 0;
pub const StiDeviceTypeScanner = 1;
pub const StiDeviceTypeDigitalCamera = 2;
pub const StiDeviceTypeStreamingVideo = 3;

pub const aliases = struct {
    pub const FAX_ENUM_LOG_LEVELS = i32;
    pub const FAX_ENUM_LOG_CATEGORIES = i32;
    pub const FAX_ENUM_JOB_COMMANDS = i32;
    pub const FAX_ENUM_JOB_SEND_ATTRIBUTES = i32;
    pub const FAX_ENUM_DELIVERY_REPORT_TYPES = i32;
    pub const FAX_ENUM_PORT_OPEN_TYPE = i32;
    pub const FAX_JOB_STATUS_ENUM = i32;
    pub const FAX_JOB_EXTENDED_STATUS_ENUM = i32;
    pub const FAX_JOB_OPERATIONS_ENUM = i32;
    pub const FAX_JOB_TYPE_ENUM = i32;
    pub const FAX_SERVER_EVENTS_TYPE_ENUM = i32;
    pub const FAX_SERVER_APIVERSION_ENUM = i32;
    pub const FAX_SMTP_AUTHENTICATION_TYPE_ENUM = i32;
    pub const FAX_RECEIPT_TYPE_ENUM = i32;
    pub const FAX_ACCESS_RIGHTS_ENUM = i32;
    pub const FAX_PRIORITY_TYPE_ENUM = i32;
    pub const FAX_COVERPAGE_TYPE_ENUM = i32;
    pub const FAX_SCHEDULE_TYPE_ENUM = i32;
    pub const FAX_PROVIDER_STATUS_ENUM = i32;
    pub const FAX_DEVICE_RECEIVE_MODE_ENUM = i32;
    pub const FAX_LOG_LEVEL_ENUM = i32;
    pub const FAX_GROUP_STATUS_ENUM = i32;
    pub const FAX_RULE_STATUS_ENUM = i32;
    pub const FAX_ACCOUNT_EVENTS_TYPE_ENUM = i32;
    pub const FAX_ACCESS_RIGHTS_ENUM_2 = i32;
    pub const FAX_ROUTING_RULE_CODE_ENUM = i32;
    pub const FAXROUTE_ENABLE = i32;
    pub const FAX_ENUM_DEVICE_ID_SOURCE = i32;
    pub const SendToMode = i32;
    pub const STI_DEVICE_MJ_TYPE = i32;
};
