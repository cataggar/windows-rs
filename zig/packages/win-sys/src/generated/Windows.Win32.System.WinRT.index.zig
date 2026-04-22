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
    .{ "CoDecodeProxy", MethodRecord{ .library = "OLE32", .import = "CoDecodeProxy", .signature = "\x00\x03\x11\x79\x09\x0b\x0f\x11\xc0\x00\x45\xc1" } },
    .{ "RoGetAgileReference", MethodRecord{ .library = "OLE32", .import = "RoGetAgileReference", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x45\xc5\x0f\x11\x0d\x12\x82\xb1\x0f\x12\xc0\x00\x45\xc9" } },
    .{ "HSTRING_UserSize", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "HSTRING_UserSize", .signature = "\x00\x03\x09\x0f\x09\x09\x0f\x11\xad\x55" } },
    .{ "HSTRING_UserMarshal", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "HSTRING_UserMarshal", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\xad\x55" } },
    .{ "HSTRING_UserUnmarshal", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "HSTRING_UserUnmarshal", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\xad\x55" } },
    .{ "HSTRING_UserFree", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "HSTRING_UserFree", .signature = "\x00\x02\x01\x0f\x09\x0f\x11\xad\x55" } },
    .{ "HSTRING_UserSize64", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "HSTRING_UserSize64", .signature = "\x00\x03\x09\x0f\x09\x09\x0f\x11\xad\x55" } },
    .{ "HSTRING_UserMarshal64", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "HSTRING_UserMarshal64", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\xad\x55" } },
    .{ "HSTRING_UserUnmarshal64", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "HSTRING_UserUnmarshal64", .signature = "\x00\x03\x0f\x05\x0f\x09\x0f\x05\x0f\x11\xad\x55" } },
    .{ "HSTRING_UserFree64", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "HSTRING_UserFree64", .signature = "\x00\x02\x01\x0f\x09\x0f\x11\xad\x55" } },
    .{ "WindowsCreateString", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsCreateString", .signature = "\x00\x03\x11\x79\x11\x05\x09\x0f\x11\xad\x55" } },
    .{ "WindowsCreateStringReference", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsCreateStringReference", .signature = "\x00\x04\x11\x79\x11\x05\x09\x0f\x11\xc0\x00\x45\xcd\x0f\x11\xad\x55" } },
    .{ "WindowsDeleteString", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsDeleteString", .signature = "\x00\x01\x11\x79\x11\xad\x55" } },
    .{ "WindowsDuplicateString", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsDuplicateString", .signature = "\x00\x02\x11\x79\x11\xad\x55\x0f\x11\xad\x55" } },
    .{ "WindowsGetStringLen", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsGetStringLen", .signature = "\x00\x01\x09\x11\xad\x55" } },
    .{ "WindowsGetStringRawBuffer", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsGetStringRawBuffer", .signature = "\x00\x02\x11\x05\x11\xad\x55\x0f\x09" } },
    .{ "WindowsIsStringEmpty", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsIsStringEmpty", .signature = "\x00\x01\x11\x59\x11\xad\x55" } },
    .{ "WindowsStringHasEmbeddedNull", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsStringHasEmbeddedNull", .signature = "\x00\x02\x11\x79\x11\xad\x55\x0f\x11\x59" } },
    .{ "WindowsCompareStringOrdinal", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsCompareStringOrdinal", .signature = "\x00\x03\x11\x79\x11\xad\x55\x11\xad\x55\x0f\x08" } },
    .{ "WindowsSubstring", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsSubstring", .signature = "\x00\x03\x11\x79\x11\xad\x55\x09\x0f\x11\xad\x55" } },
    .{ "WindowsSubstringWithSpecifiedLength", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsSubstringWithSpecifiedLength", .signature = "\x00\x04\x11\x79\x11\xad\x55\x09\x09\x0f\x11\xad\x55" } },
    .{ "WindowsConcatString", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsConcatString", .signature = "\x00\x03\x11\x79\x11\xad\x55\x11\xad\x55\x0f\x11\xad\x55" } },
    .{ "WindowsReplaceString", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsReplaceString", .signature = "\x00\x04\x11\x79\x11\xad\x55\x11\xad\x55\x11\xad\x55\x0f\x11\xad\x55" } },
    .{ "WindowsTrimStringStart", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsTrimStringStart", .signature = "\x00\x03\x11\x79\x11\xad\x55\x11\xad\x55\x0f\x11\xad\x55" } },
    .{ "WindowsTrimStringEnd", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsTrimStringEnd", .signature = "\x00\x03\x11\x79\x11\xad\x55\x11\xad\x55\x0f\x11\xad\x55" } },
    .{ "WindowsPreallocateStringBuffer", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsPreallocateStringBuffer", .signature = "\x00\x03\x11\x79\x09\x0f\x0f\x07\x0f\x11\xc0\x00\x45\xd1" } },
    .{ "WindowsPromoteStringBuffer", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsPromoteStringBuffer", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x45\xd1\x0f\x11\xad\x55" } },
    .{ "WindowsDeleteStringBuffer", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsDeleteStringBuffer", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x45\xd1" } },
    .{ "WindowsInspectString", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-0", .import = "WindowsInspectString", .signature = "\x00\x06\x11\x79\x19\x07\x12\xc0\x00\x45\xd5\x0f\x01\x0f\x09\x0f\x19" } },
    .{ "WindowsInspectString2", MethodRecord{ .library = "api-ms-win-core-winrt-string-l1-1-1", .import = "WindowsInspectString2", .signature = "\x00\x06\x11\x79\x0b\x07\x12\xc0\x00\x45\xd9\x0f\x01\x0f\x09\x0f\x0b" } },
    .{ "CreateDispatcherQueueController", MethodRecord{ .library = "CoreMessaging", .import = "CreateDispatcherQueueController", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x45\xdd\x0f\x12\xc0\x00\x45\xe1" } },
    .{ "RoInitialize", MethodRecord{ .library = "api-ms-win-core-winrt-l1-1-0", .import = "RoInitialize", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x45\xe5" } },
    .{ "RoUninitialize", MethodRecord{ .library = "api-ms-win-core-winrt-l1-1-0", .import = "RoUninitialize", .signature = "\x00\x00\x01" } },
    .{ "RoActivateInstance", MethodRecord{ .library = "api-ms-win-core-winrt-l1-1-0", .import = "RoActivateInstance", .signature = "\x00\x02\x11\x79\x11\xad\x55\x0f\x12\xad\x61" } },
    .{ "RoRegisterActivationFactories", MethodRecord{ .library = "api-ms-win-core-winrt-l1-1-0", .import = "RoRegisterActivationFactories", .signature = "\x00\x04\x11\x79\x0f\x11\xad\x55\x0f\x12\xc0\x00\x45\xe9\x09\x0f\x11\xc0\x00\x45\xed" } },
    .{ "RoRevokeActivationFactories", MethodRecord{ .library = "api-ms-win-core-winrt-l1-1-0", .import = "RoRevokeActivationFactories", .signature = "\x00\x01\x01\x11\xc0\x00\x45\xed" } },
    .{ "RoGetActivationFactory", MethodRecord{ .library = "api-ms-win-core-winrt-l1-1-0", .import = "RoGetActivationFactory", .signature = "\x00\x03\x11\x79\x11\xad\x55\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "RoRegisterForApartmentShutdown", MethodRecord{ .library = "api-ms-win-core-winrt-l1-1-0", .import = "RoRegisterForApartmentShutdown", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x45\xf1\x0f\x0b\x0f\x11\xc0\x00\x45\xf5" } },
    .{ "RoUnregisterForApartmentShutdown", MethodRecord{ .library = "api-ms-win-core-winrt-l1-1-0", .import = "RoUnregisterForApartmentShutdown", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x45\xf5" } },
    .{ "RoGetApartmentIdentifier", MethodRecord{ .library = "api-ms-win-core-winrt-l1-1-0", .import = "RoGetApartmentIdentifier", .signature = "\x00\x01\x11\x79\x0f\x0b" } },
    .{ "RoGetBufferMarshaler", MethodRecord{ .library = "api-ms-win-core-winrt-robuffer-l1-1-0", .import = "RoGetBufferMarshaler", .signature = "\x00\x01\x11\x79\x0f\x12\xc0\x00\x45\xf9" } },
    .{ "RoGetErrorReportingFlags", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-0", .import = "RoGetErrorReportingFlags", .signature = "\x00\x01\x11\x79\x0f\x09" } },
    .{ "RoSetErrorReportingFlags", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-0", .import = "RoSetErrorReportingFlags", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "RoResolveRestrictedErrorInfoReference", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-0", .import = "RoResolveRestrictedErrorInfoReference", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x12\xc0\x00\x45\xfd" } },
    .{ "SetRestrictedErrorInfo", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-0", .import = "SetRestrictedErrorInfo", .signature = "\x00\x01\x11\x79\x12\xc0\x00\x45\xfd" } },
    .{ "GetRestrictedErrorInfo", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-0", .import = "GetRestrictedErrorInfo", .signature = "\x00\x01\x11\x79\x0f\x12\xc0\x00\x45\xfd" } },
    .{ "RoOriginateErrorW", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-0", .import = "RoOriginateErrorW", .signature = "\x00\x03\x11\x59\x11\x79\x09\x11\x05" } },
    .{ "RoOriginateError", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-0", .import = "RoOriginateError", .signature = "\x00\x02\x11\x59\x11\x79\x11\xad\x55" } },
    .{ "RoTransformErrorW", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-0", .import = "RoTransformErrorW", .signature = "\x00\x04\x11\x59\x11\x79\x11\x79\x09\x11\x05" } },
    .{ "RoTransformError", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-0", .import = "RoTransformError", .signature = "\x00\x03\x11\x59\x11\x79\x11\x79\x11\xad\x55" } },
    .{ "RoCaptureErrorContext", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-0", .import = "RoCaptureErrorContext", .signature = "\x00\x01\x11\x79\x11\x79" } },
    .{ "RoFailFastWithErrorContext", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-0", .import = "RoFailFastWithErrorContext", .signature = "\x00\x01\x01\x11\x79" } },
    .{ "RoOriginateLanguageException", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-1", .import = "RoOriginateLanguageException", .signature = "\x00\x03\x11\x59\x11\x79\x11\xad\x55\x12\x82\xb1" } },
    .{ "RoClearError", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-1", .import = "RoClearError", .signature = "\x00\x00\x01" } },
    .{ "RoReportUnhandledError", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-1", .import = "RoReportUnhandledError", .signature = "\x00\x01\x11\x79\x12\xc0\x00\x45\xfd" } },
    .{ "RoInspectThreadErrorInfo", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-1", .import = "RoInspectThreadErrorInfo", .signature = "\x00\x05\x11\x79\x19\x07\x12\xc0\x00\x46\x01\x0f\x01\x0f\x19" } },
    .{ "RoInspectCapturedStackBackTrace", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-1", .import = "RoInspectCapturedStackBackTrace", .signature = "\x00\x06\x11\x79\x19\x07\x12\xc0\x00\x46\x01\x0f\x01\x0f\x09\x0f\x19" } },
    .{ "RoGetMatchingRestrictedErrorInfo", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-1", .import = "RoGetMatchingRestrictedErrorInfo", .signature = "\x00\x02\x11\x79\x11\x79\x0f\x12\xc0\x00\x45\xfd" } },
    .{ "RoReportFailedDelegate", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-1", .import = "RoReportFailedDelegate", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x12\xc0\x00\x45\xfd" } },
    .{ "IsErrorPropagationEnabled", MethodRecord{ .library = "api-ms-win-core-winrt-error-l1-1-1", .import = "IsErrorPropagationEnabled", .signature = "\x00\x00\x11\x59" } },
    .{ "RoGetServerActivatableClasses", MethodRecord{ .library = "api-ms-win-core-winrt-registration-l1-1-0", .import = "RoGetServerActivatableClasses", .signature = "\x00\x03\x11\x79\x11\xad\x55\x0f\x0f\x11\xad\x55\x0f\x09" } },
    .{ "CreateRandomAccessStreamOnFile", MethodRecord{ .library = "api-ms-win-shcore-stream-winrt-l1-1-0", .import = "CreateRandomAccessStreamOnFile", .signature = "\x00\x04\x11\x79\x11\x05\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CreateRandomAccessStreamOverStream", MethodRecord{ .library = "api-ms-win-shcore-stream-winrt-l1-1-0", .import = "CreateRandomAccessStreamOverStream", .signature = "\x00\x04\x11\x79\x12\x83\x75\x11\xc0\x00\x46\x05\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CreateStreamOverRandomAccessStream", MethodRecord{ .library = "api-ms-win-shcore-stream-winrt-l1-1-0", .import = "CreateStreamOverRandomAccessStream", .signature = "\x00\x03\x11\x79\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CreateControlInput", MethodRecord{ .library = "Windows.UI", .import = "CreateControlInput", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CreateControlInputEx", MethodRecord{ .library = "Windows.UI", .import = "CreateControlInputEx", .signature = "\x00\x03\x11\x79\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IStream" },
        0x2d55 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "HSTRING" },
        0x2d61 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "IInspectable" },
        0x45c1 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "ServerInformation" },
        0x45c5 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "AgileReferenceOptions" },
        0x45c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "IAgileReference" },
        0x45cd => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "HSTRING_HEADER" },
        0x45d1 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "HSTRING_BUFFER" },
        0x45d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "PINSPECT_HSTRING_CALLBACK" },
        0x45d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "PINSPECT_HSTRING_CALLBACK2" },
        0x45dd => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "DispatcherQueueOptions" },
        0x45e1 => TypeRefEntry{ .namespace = "Windows.System", .name = "DispatcherQueueController" },
        0x45e5 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "RO_INIT_TYPE" },
        0x45e9 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "PFNGETACTIVATIONFACTORY" },
        0x45ed => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "RO_REGISTRATION_COOKIE" },
        0x45f1 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "IApartmentShutdown" },
        0x45f5 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "APARTMENT_SHUTDOWN_REGISTRATION_COOKIE" },
        0x45f9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.Marshal", .name = "IMarshal" },
        0x45fd => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "IRestrictedErrorInfo" },
        0x4601 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "PINSPECT_MEMORY_CALLBACK" },
        0x4605 => TypeRefEntry{ .namespace = "Windows.Win32.System.WinRT", .name = "BSOS_OPTIONS" },
        else => null,
    };
}

pub const MAX_ERROR_MESSAGE_CHARS = 512;
pub const ACTIVATIONTYPE_UNCATEGORIZED = 0;
pub const ACTIVATIONTYPE_FROM_MONIKER = 1;
pub const ACTIVATIONTYPE_FROM_DATA = 2;
pub const ACTIVATIONTYPE_FROM_STORAGE = 4;
pub const ACTIVATIONTYPE_FROM_STREAM = 8;
pub const ACTIVATIONTYPE_FROM_FILE = 16;
pub const AGILEREFERENCE_DEFAULT = 0;
pub const AGILEREFERENCE_DELAYEDMARSHAL = 1;
pub const BaseTrust = 0;
pub const PartialTrust = 1;
pub const FullTrust = 2;
pub const DQTAT_COM_NONE = 0;
pub const DQTAT_COM_ASTA = 1;
pub const DQTAT_COM_STA = 2;
pub const DQTYPE_THREAD_DEDICATED = 1;
pub const DQTYPE_THREAD_CURRENT = 2;
pub const CASTING_CONNECTION_ERROR_STATUS_SUCCEEDED = 0;
pub const CASTING_CONNECTION_ERROR_STATUS_DEVICE_DID_NOT_RESPOND = 1;
pub const CASTING_CONNECTION_ERROR_STATUS_DEVICE_ERROR = 2;
pub const CASTING_CONNECTION_ERROR_STATUS_DEVICE_LOCKED = 3;
pub const CASTING_CONNECTION_ERROR_STATUS_PROTECTED_PLAYBACK_FAILED = 4;
pub const CASTING_CONNECTION_ERROR_STATUS_INVALID_CASTING_SOURCE = 5;
pub const CASTING_CONNECTION_ERROR_STATUS_UNKNOWN = 6;
pub const CASTING_CONNECTION_STATE_DISCONNECTED = 0;
pub const CASTING_CONNECTION_STATE_CONNECTED = 1;
pub const CASTING_CONNECTION_STATE_RENDERING = 2;
pub const CASTING_CONNECTION_STATE_DISCONNECTING = 3;
pub const CASTING_CONNECTION_STATE_CONNECTING = 4;
pub const RO_INIT_SINGLETHREADED = 0;
pub const RO_INIT_MULTITHREADED = 1;
pub const RO_ERROR_REPORTING_NONE = 0;
pub const RO_ERROR_REPORTING_SUPPRESSEXCEPTIONS = 1;
pub const RO_ERROR_REPORTING_FORCEEXCEPTIONS = 2;
pub const RO_ERROR_REPORTING_USESETERRORINFO = 4;
pub const RO_ERROR_REPORTING_SUPPRESSSETERRORINFO = 8;
pub const BSOS_DEFAULT = 0;
pub const BSOS_PREFERDESTINATIONSTREAM = 1;

pub const aliases = struct {
    pub const ACTIVATIONTYPE = i32;
    pub const AgileReferenceOptions = i32;
    pub const TrustLevel = i32;
    pub const DISPATCHERQUEUE_THREAD_APARTMENTTYPE = i32;
    pub const DISPATCHERQUEUE_THREAD_TYPE = i32;
    pub const CASTING_CONNECTION_ERROR_STATUS = i32;
    pub const CASTING_CONNECTION_STATE = i32;
    pub const RO_INIT_TYPE = i32;
    pub const RO_ERROR_REPORTING_FLAGS = i32;
    pub const BSOS_OPTIONS = i32;
    pub const HSTRING = ?*anyopaque;
    pub const HSTRING_BUFFER = ?*anyopaque;
    pub const APARTMENT_SHUTDOWN_REGISTRATION_COOKIE = ?*anyopaque;
    pub const RO_REGISTRATION_COOKIE = isize;
    pub const PINSPECT_HSTRING_CALLBACK = ?*const anyopaque;
    pub const PINSPECT_HSTRING_CALLBACK2 = ?*const anyopaque;
    pub const PFNGETACTIVATIONFACTORY = ?*const anyopaque;
    pub const PINSPECT_MEMORY_CALLBACK = ?*const anyopaque;
};
