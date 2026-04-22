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
    .{ "WinBioEnumServiceProviders", MethodRecord{ .library = "winbio", .import = "WinBioEnumServiceProviders", .signature = "\x00\x03\x11\x79\x09\x0f\x0f\x11\xa9\x5d\x0f\x19" } },
    .{ "WinBioEnumBiometricUnits", MethodRecord{ .library = "winbio", .import = "WinBioEnumBiometricUnits", .signature = "\x00\x03\x11\x79\x09\x0f\x0f\x11\xa9\x61\x0f\x19" } },
    .{ "WinBioEnumDatabases", MethodRecord{ .library = "winbio", .import = "WinBioEnumDatabases", .signature = "\x00\x03\x11\x79\x09\x0f\x0f\x11\xa9\x65\x0f\x19" } },
    .{ "WinBioAsyncOpenFramework", MethodRecord{ .library = "winbio", .import = "WinBioAsyncOpenFramework", .signature = "\x00\x07\x11\x79\x11\xa9\x69\x11\x25\x09\x12\xa9\x6d\x0f\x01\x11\x59\x0f\x09" } },
    .{ "WinBioCloseFramework", MethodRecord{ .library = "winbio", .import = "WinBioCloseFramework", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "WinBioAsyncEnumServiceProviders", MethodRecord{ .library = "winbio", .import = "WinBioAsyncEnumServiceProviders", .signature = "\x00\x02\x11\x79\x09\x09" } },
    .{ "WinBioAsyncEnumBiometricUnits", MethodRecord{ .library = "winbio", .import = "WinBioAsyncEnumBiometricUnits", .signature = "\x00\x02\x11\x79\x09\x09" } },
    .{ "WinBioAsyncEnumDatabases", MethodRecord{ .library = "winbio", .import = "WinBioAsyncEnumDatabases", .signature = "\x00\x02\x11\x79\x09\x09" } },
    .{ "WinBioAsyncMonitorFrameworkChanges", MethodRecord{ .library = "winbio", .import = "WinBioAsyncMonitorFrameworkChanges", .signature = "\x00\x02\x11\x79\x09\x09" } },
    .{ "WinBioOpenSession", MethodRecord{ .library = "winbio", .import = "WinBioOpenSession", .signature = "\x00\x07\x11\x79\x09\x11\x89\x49\x09\x0f\x09\x19\x0f\x11\x0d\x0f\x09" } },
    .{ "WinBioAsyncOpenSession", MethodRecord{ .library = "winbio", .import = "WinBioAsyncOpenSession", .signature = "\x00\x0d\x11\x79\x09\x11\x89\x49\x09\x0f\x09\x19\x0f\x11\x0d\x11\xa9\x69\x11\x25\x09\x12\xa9\x6d\x0f\x01\x11\x59\x0f\x09" } },
    .{ "WinBioCloseSession", MethodRecord{ .library = "winbio", .import = "WinBioCloseSession", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "WinBioVerify", MethodRecord{ .library = "winbio", .import = "WinBioVerify", .signature = "\x00\x06\x11\x79\x09\x0f\x11\xa9\x71\x05\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "WinBioVerifyWithCallback", MethodRecord{ .library = "winbio", .import = "WinBioVerifyWithCallback", .signature = "\x00\x05\x11\x79\x09\x0f\x11\xa9\x71\x05\x12\xa9\x75\x0f\x01" } },
    .{ "WinBioIdentify", MethodRecord{ .library = "winbio", .import = "WinBioIdentify", .signature = "\x00\x05\x11\x79\x09\x0f\x09\x0f\x11\xa9\x71\x0f\x05\x0f\x09" } },
    .{ "WinBioIdentifyWithCallback", MethodRecord{ .library = "winbio", .import = "WinBioIdentifyWithCallback", .signature = "\x00\x03\x11\x79\x09\x12\xa9\x79\x0f\x01" } },
    .{ "WinBioWait", MethodRecord{ .library = "winbio", .import = "WinBioWait", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "WinBioCancel", MethodRecord{ .library = "winbio", .import = "WinBioCancel", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "WinBioLocateSensor", MethodRecord{ .library = "winbio", .import = "WinBioLocateSensor", .signature = "\x00\x02\x11\x79\x09\x0f\x09" } },
    .{ "WinBioLocateSensorWithCallback", MethodRecord{ .library = "winbio", .import = "WinBioLocateSensorWithCallback", .signature = "\x00\x03\x11\x79\x09\x12\xa9\x7d\x0f\x01" } },
    .{ "WinBioEnrollBegin", MethodRecord{ .library = "winbio", .import = "WinBioEnrollBegin", .signature = "\x00\x03\x11\x79\x09\x05\x09" } },
    .{ "WinBioEnrollSelect", MethodRecord{ .library = "winbio", .import = "WinBioEnrollSelect", .signature = "\x00\x02\x11\x79\x09\x0b" } },
    .{ "WinBioEnrollCapture", MethodRecord{ .library = "winbio", .import = "WinBioEnrollCapture", .signature = "\x00\x02\x11\x79\x09\x0f\x09" } },
    .{ "WinBioEnrollCaptureWithCallback", MethodRecord{ .library = "winbio", .import = "WinBioEnrollCaptureWithCallback", .signature = "\x00\x03\x11\x79\x09\x12\xa9\x81\x0f\x01" } },
    .{ "WinBioEnrollCommit", MethodRecord{ .library = "winbio", .import = "WinBioEnrollCommit", .signature = "\x00\x03\x11\x79\x09\x0f\x11\xa9\x71\x0f\x05" } },
    .{ "WinBioEnrollDiscard", MethodRecord{ .library = "winbio", .import = "WinBioEnrollDiscard", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "WinBioEnumEnrollments", MethodRecord{ .library = "winbio", .import = "WinBioEnumEnrollments", .signature = "\x00\x05\x11\x79\x09\x09\x0f\x11\xa9\x71\x0f\x0f\x05\x0f\x19" } },
    .{ "WinBioImproveBegin", MethodRecord{ .library = "winbio", .import = "WinBioImproveBegin", .signature = "\x00\x02\x11\x79\x09\x09" } },
    .{ "WinBioImproveEnd", MethodRecord{ .library = "winbio", .import = "WinBioImproveEnd", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "WinBioRegisterEventMonitor", MethodRecord{ .library = "winbio", .import = "WinBioRegisterEventMonitor", .signature = "\x00\x04\x11\x79\x09\x09\x12\xa9\x85\x0f\x01" } },
    .{ "WinBioUnregisterEventMonitor", MethodRecord{ .library = "winbio", .import = "WinBioUnregisterEventMonitor", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "WinBioMonitorPresence", MethodRecord{ .library = "winbio", .import = "WinBioMonitorPresence", .signature = "\x00\x02\x11\x79\x09\x09" } },
    .{ "WinBioCaptureSample", MethodRecord{ .library = "winbio", .import = "WinBioCaptureSample", .signature = "\x00\x07\x11\x79\x09\x05\x05\x0f\x09\x0f\x0f\x11\xa9\x89\x0f\x19\x0f\x09" } },
    .{ "WinBioCaptureSampleWithCallback", MethodRecord{ .library = "winbio", .import = "WinBioCaptureSampleWithCallback", .signature = "\x00\x05\x11\x79\x09\x05\x05\x12\xa9\x8d\x0f\x01" } },
    .{ "WinBioDeleteTemplate", MethodRecord{ .library = "winbio", .import = "WinBioDeleteTemplate", .signature = "\x00\x04\x11\x79\x09\x09\x0f\x11\xa9\x71\x05" } },
    .{ "WinBioLockUnit", MethodRecord{ .library = "winbio", .import = "WinBioLockUnit", .signature = "\x00\x02\x11\x79\x09\x09" } },
    .{ "WinBioUnlockUnit", MethodRecord{ .library = "winbio", .import = "WinBioUnlockUnit", .signature = "\x00\x02\x11\x79\x09\x09" } },
    .{ "WinBioControlUnit", MethodRecord{ .library = "winbio", .import = "WinBioControlUnit", .signature = "\x00\x0a\x11\x79\x09\x09\x11\x89\x45\x09\x0f\x05\x19\x0f\x05\x19\x0f\x19\x0f\x09" } },
    .{ "WinBioControlUnitPrivileged", MethodRecord{ .library = "winbio", .import = "WinBioControlUnitPrivileged", .signature = "\x00\x0a\x11\x79\x09\x09\x11\x89\x45\x09\x0f\x05\x19\x0f\x05\x19\x0f\x19\x0f\x09" } },
    .{ "WinBioGetProperty", MethodRecord{ .library = "winbio", .import = "WinBioGetProperty", .signature = "\x00\x08\x11\x79\x09\x09\x09\x09\x0f\x11\xa9\x71\x05\x0f\x0f\x01\x0f\x19" } },
    .{ "WinBioSetProperty", MethodRecord{ .library = "winbio", .import = "WinBioSetProperty", .signature = "\x00\x08\x11\x79\x09\x09\x09\x09\x0f\x11\xa9\x71\x05\x0f\x01\x19" } },
    .{ "WinBioFree", MethodRecord{ .library = "winbio", .import = "WinBioFree", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "WinBioSetCredential", MethodRecord{ .library = "winbio", .import = "WinBioSetCredential", .signature = "\x00\x04\x11\x79\x11\xa9\x91\x0f\x05\x19\x11\xa9\x95" } },
    .{ "WinBioRemoveCredential", MethodRecord{ .library = "winbio", .import = "WinBioRemoveCredential", .signature = "\x00\x02\x11\x79\x11\xa9\x71\x11\xa9\x91" } },
    .{ "WinBioRemoveAllCredentials", MethodRecord{ .library = "winbio", .import = "WinBioRemoveAllCredentials", .signature = "\x00\x00\x11\x79" } },
    .{ "WinBioRemoveAllDomainCredentials", MethodRecord{ .library = "winbio", .import = "WinBioRemoveAllDomainCredentials", .signature = "\x00\x00\x11\x79" } },
    .{ "WinBioGetCredentialState", MethodRecord{ .library = "winbio", .import = "WinBioGetCredentialState", .signature = "\x00\x03\x11\x79\x11\xa9\x71\x11\xa9\x91\x0f\x11\xa9\x99" } },
    .{ "WinBioLogonIdentifiedUser", MethodRecord{ .library = "winbio", .import = "WinBioLogonIdentifiedUser", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "WinBioGetEnrolledFactors", MethodRecord{ .library = "winbio", .import = "WinBioGetEnrolledFactors", .signature = "\x00\x02\x11\x79\x0f\x11\xa9\x71\x0f\x09" } },
    .{ "WinBioGetEnabledSetting", MethodRecord{ .library = "winbio", .import = "WinBioGetEnabledSetting", .signature = "\x00\x02\x01\x0f\x05\x0f\x11\x89\x41" } },
    .{ "WinBioGetLogonSetting", MethodRecord{ .library = "winbio", .import = "WinBioGetLogonSetting", .signature = "\x00\x02\x01\x0f\x05\x0f\x11\x89\x41" } },
    .{ "WinBioGetDomainLogonSetting", MethodRecord{ .library = "winbio", .import = "WinBioGetDomainLogonSetting", .signature = "\x00\x02\x01\x0f\x05\x0f\x11\x89\x41" } },
    .{ "WinBioIsESSCapable", MethodRecord{ .library = "winbio", .import = "WinBioIsESSCapable", .signature = "\x00\x01\x11\x79\x0f\x05" } },
    .{ "WinBioAcquireFocus", MethodRecord{ .library = "winbio", .import = "WinBioAcquireFocus", .signature = "\x00\x00\x11\x79" } },
    .{ "WinBioReleaseFocus", MethodRecord{ .library = "winbio", .import = "WinBioReleaseFocus", .signature = "\x00\x00\x11\x79" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x941 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "WINBIO_SETTING_SOURCE" },
        0x945 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "WINBIO_COMPONENT" },
        0x949 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "WINBIO_POOL" },
        0x295d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "WINBIO_BSP_SCHEMA" },
        0x2961 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "WINBIO_UNIT_SCHEMA" },
        0x2965 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "WINBIO_STORAGE_SCHEMA" },
        0x2969 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "WINBIO_ASYNC_NOTIFICATION_METHOD" },
        0x296d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "PWINBIO_ASYNC_COMPLETION_CALLBACK" },
        0x2971 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "WINBIO_IDENTITY" },
        0x2975 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "PWINBIO_VERIFY_CALLBACK" },
        0x2979 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "PWINBIO_IDENTIFY_CALLBACK" },
        0x297d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "PWINBIO_LOCATE_SENSOR_CALLBACK" },
        0x2981 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "PWINBIO_ENROLL_CAPTURE_CALLBACK" },
        0x2985 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "PWINBIO_EVENT_CALLBACK" },
        0x2989 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "WINBIO_BIR" },
        0x298d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "PWINBIO_CAPTURE_CALLBACK" },
        0x2991 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "WINBIO_CREDENTIAL_TYPE" },
        0x2995 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "WINBIO_CREDENTIAL_FORMAT" },
        0x2999 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.BiometricFramework", .name = "WINBIO_CREDENTIAL_STATE" },
        else => null,
    };
}

pub const WINBIO_SETTING_SOURCE_INVALID = 0;
pub const WINBIO_SETTING_SOURCE_DEFAULT = 1;
pub const WINBIO_SETTING_SOURCE_LOCAL = 3;
pub const WINBIO_SETTING_SOURCE_POLICY = 2;
pub const WINBIO_COMPONENT_SENSOR = 1;
pub const WINBIO_COMPONENT_ENGINE = 2;
pub const WINBIO_COMPONENT_STORAGE = 3;
pub const WINBIO_POOL_SYSTEM = 1;
pub const WINBIO_POOL_PRIVATE = 2;
pub const WINBIO_MAX_STRING_LEN = 256;
pub const WINBIO_SCP_VERSION_1 = 1;
pub const WINBIO_SCP_RANDOM_SIZE_V1 = 32;
pub const WINBIO_SCP_DIGEST_SIZE_V1 = 32;
pub const WINBIO_SCP_CURVE_FIELD_SIZE_V1 = 32;
pub const WINBIO_SCP_PUBLIC_KEY_SIZE_V1 = 65;
pub const WINBIO_SCP_PRIVATE_KEY_SIZE_V1 = 32;
pub const WINBIO_SCP_SIGNATURE_SIZE_V1 = 64;
pub const WINBIO_SCP_ENCRYPTION_BLOCK_SIZE_V1 = 16;
pub const WINBIO_SCP_ENCRYPTION_KEY_SIZE_V1 = 32;
pub const WINBIO_BIR_ALIGN_SIZE = 8;
pub const WINBIO_BIR_ALGIN_SIZE = 8;
pub const WINBIO_DATA_FLAG_PRIVACY = 2;
pub const WINBIO_DATA_FLAG_INTEGRITY = 1;
pub const WINBIO_DATA_FLAG_SIGNED = 4;
pub const WINBIO_DATA_FLAG_RAW = 32;
pub const WINBIO_DATA_FLAG_INTERMEDIATE = 64;
pub const WINBIO_DATA_FLAG_PROCESSED = 128;
pub const WINBIO_DATA_FLAG_OPTION_MASK_PRESENT = 8;
pub const WINBIO_ANSI_381_PIXELS_PER_INCH = 1;
pub const WINBIO_ANSI_381_PIXELS_PER_CM = 2;
pub const WINBIO_ANSI_381_IMG_UNCOMPRESSED = 0;
pub const WINBIO_ANSI_381_IMG_BIT_PACKED = 1;
pub const WINBIO_ANSI_381_IMG_COMPRESSED_WSQ = 2;
pub const WINBIO_ANSI_381_IMG_COMPRESSED_JPEG = 3;
pub const WINBIO_ANSI_381_IMG_COMPRESSED_JPEG2000 = 4;
pub const WINBIO_ANSI_381_IMG_COMPRESSED_PNG = 5;
pub const WINBIO_ANSI_381_IMP_TYPE_LIVE_SCAN_PLAIN = 0;
pub const WINBIO_ANSI_381_IMP_TYPE_LIVE_SCAN_ROLLED = 1;
pub const WINBIO_ANSI_381_IMP_TYPE_NONLIVE_SCAN_PLAIN = 2;
pub const WINBIO_ANSI_381_IMP_TYPE_NONLIVE_SCAN_ROLLED = 3;
pub const WINBIO_ANSI_381_IMP_TYPE_LATENT = 7;
pub const WINBIO_ANSI_381_IMP_TYPE_SWIPE = 8;
pub const WINBIO_ANSI_381_IMP_TYPE_LIVE_SCAN_CONTACTLESS = 9;
pub const FACILITY_WINBIO = 9;
pub const FACILITY_NONE = 0;
pub const WINBIO_E_UNSUPPORTED_FACTOR = -2146861055;
pub const WINBIO_E_INVALID_UNIT = -2146861054;
pub const WINBIO_E_UNKNOWN_ID = -2146861053;
pub const WINBIO_E_CANCELED = -2146861052;
pub const WINBIO_E_NO_MATCH = -2146861051;
pub const WINBIO_E_CAPTURE_ABORTED = -2146861050;
pub const WINBIO_E_ENROLLMENT_IN_PROGRESS = -2146861049;
pub const WINBIO_E_BAD_CAPTURE = -2146861048;
pub const WINBIO_E_INVALID_CONTROL_CODE = -2146861047;
pub const WINBIO_E_DATA_COLLECTION_IN_PROGRESS = -2146861045;
pub const WINBIO_E_UNSUPPORTED_DATA_FORMAT = -2146861044;
pub const WINBIO_E_UNSUPPORTED_DATA_TYPE = -2146861043;
pub const WINBIO_E_UNSUPPORTED_PURPOSE = -2146861042;
pub const WINBIO_E_INVALID_DEVICE_STATE = -2146861041;
pub const WINBIO_E_DEVICE_BUSY = -2146861040;
pub const WINBIO_E_DATABASE_CANT_CREATE = -2146861039;
pub const WINBIO_E_DATABASE_CANT_OPEN = -2146861038;
pub const WINBIO_E_DATABASE_CANT_CLOSE = -2146861037;
pub const WINBIO_E_DATABASE_CANT_ERASE = -2146861036;
pub const WINBIO_E_DATABASE_CANT_FIND = -2146861035;
pub const WINBIO_E_DATABASE_ALREADY_EXISTS = -2146861034;
pub const WINBIO_E_DATABASE_FULL = -2146861032;
pub const WINBIO_E_DATABASE_LOCKED = -2146861031;
pub const WINBIO_E_DATABASE_CORRUPTED = -2146861030;
pub const WINBIO_E_DATABASE_NO_SUCH_RECORD = -2146861029;
pub const WINBIO_E_DUPLICATE_ENROLLMENT = -2146861028;
pub const WINBIO_E_DATABASE_READ_ERROR = -2146861027;
pub const WINBIO_E_DATABASE_WRITE_ERROR = -2146861026;
pub const WINBIO_E_DATABASE_NO_RESULTS = -2146861025;
pub const WINBIO_E_DATABASE_NO_MORE_RECORDS = -2146861024;
pub const WINBIO_E_DATABASE_EOF = -2146861023;
pub const WINBIO_E_DATABASE_BAD_INDEX_VECTOR = -2146861022;
pub const WINBIO_E_INCORRECT_BSP = -2146861020;
pub const WINBIO_E_INCORRECT_SENSOR_POOL = -2146861019;
pub const WINBIO_E_NO_CAPTURE_DATA = -2146861018;
pub const WINBIO_E_INVALID_SENSOR_MODE = -2146861017;
pub const WINBIO_E_LOCK_VIOLATION = -2146861014;
pub const WINBIO_E_DUPLICATE_TEMPLATE = -2146861013;
pub const WINBIO_E_INVALID_OPERATION = -2146861012;
pub const WINBIO_E_SESSION_BUSY = -2146861011;
pub const WINBIO_E_CRED_PROV_DISABLED = -2146861008;
pub const WINBIO_E_CRED_PROV_NO_CREDENTIAL = -2146861007;
pub const WINBIO_E_DISABLED = -2146861006;
pub const WINBIO_E_CONFIGURATION_FAILURE = -2146861005;
pub const WINBIO_E_SENSOR_UNAVAILABLE = -2146861004;
pub const WINBIO_E_SAS_ENABLED = -2146861003;
pub const WINBIO_E_DEVICE_FAILURE = -2146861002;
pub const WINBIO_E_FAST_USER_SWITCH_DISABLED = -2146861001;
pub const WINBIO_E_NOT_ACTIVE_CONSOLE = -2146861000;
pub const WINBIO_E_EVENT_MONITOR_ACTIVE = -2146860999;
pub const WINBIO_E_INVALID_PROPERTY_TYPE = -2146860998;
pub const WINBIO_E_INVALID_PROPERTY_ID = -2146860997;
pub const WINBIO_E_UNSUPPORTED_PROPERTY = -2146860996;
pub const WINBIO_E_ADAPTER_INTEGRITY_FAILURE = -2146860995;
pub const WINBIO_E_INCORRECT_SESSION_TYPE = -2146860994;
pub const WINBIO_E_SESSION_HANDLE_CLOSED = -2146860993;
pub const WINBIO_E_DEADLOCK_DETECTED = -2146860992;
pub const WINBIO_E_NO_PREBOOT_IDENTITY = -2146860991;
pub const WINBIO_E_MAX_ERROR_COUNT_EXCEEDED = -2146860990;
pub const WINBIO_E_AUTO_LOGON_DISABLED = -2146860989;
pub const WINBIO_E_INVALID_TICKET = -2146860988;
pub const WINBIO_E_TICKET_QUOTA_EXCEEDED = -2146860987;
pub const WINBIO_E_DATA_PROTECTION_FAILURE = -2146860986;
pub const WINBIO_E_CRED_PROV_SECURITY_LOCKOUT = -2146860985;
pub const WINBIO_E_UNSUPPORTED_POOL_TYPE = -2146860984;
pub const WINBIO_E_SELECTION_REQUIRED = -2146860983;
pub const WINBIO_E_PRESENCE_MONITOR_ACTIVE = -2146860982;
pub const WINBIO_E_INVALID_SUBFACTOR = -2146860981;
pub const WINBIO_E_INVALID_CALIBRATION_FORMAT_ARRAY = -2146860980;
pub const WINBIO_E_NO_SUPPORTED_CALIBRATION_FORMAT = -2146860979;
pub const WINBIO_E_UNSUPPORTED_SENSOR_CALIBRATION_FORMAT = -2146860978;
pub const WINBIO_E_CALIBRATION_BUFFER_TOO_SMALL = -2146860977;
pub const WINBIO_E_CALIBRATION_BUFFER_TOO_LARGE = -2146860976;
pub const WINBIO_E_CALIBRATION_BUFFER_INVALID = -2146860975;
pub const WINBIO_E_INVALID_KEY_IDENTIFIER = -2146860974;
pub const WINBIO_E_KEY_CREATION_FAILED = -2146860973;
pub const WINBIO_E_KEY_IDENTIFIER_BUFFER_TOO_SMALL = -2146860972;
pub const WINBIO_E_PROPERTY_UNAVAILABLE = -2146860971;
pub const WINBIO_E_POLICY_PROTECTION_UNAVAILABLE = -2146860970;
pub const WINBIO_E_INSECURE_SENSOR = -2146860969;
pub const WINBIO_E_INVALID_BUFFER_ID = -2146860968;
pub const WINBIO_E_INVALID_BUFFER = -2146860967;
pub const WINBIO_E_TRUSTLET_INTEGRITY_FAIL = -2146860966;
pub const WINBIO_E_ENROLLMENT_CANCELED_BY_SUSPEND = -2146860965;
pub const WINBIO_I_MORE_DATA = 589825;
pub const WINBIO_I_EXTENDED_STATUS_INFORMATION = 589826;
pub const IOCTL_BIOMETRIC_VENDOR = 4464640;
pub const WINBIO_WBDI_MAJOR_VERSION = 1;
pub const WINBIO_WBDI_MINOR_VERSION = 0;
pub const WINBIO_ANTI_SPOOF_DISABLE = 0;
pub const WINBIO_ANTI_SPOOF_ENABLE = 1;
pub const WINBIO_ANTI_SPOOF_REMOVE = 2;
pub const WINBIO_POLICY_UNKNOWN = 0;
pub const WINBIO_POLICY_DEFAULT = 1;
pub const WINBIO_POLICY_LOCAL = 2;
pub const WINBIO_POLICY_ADMIN = 3;
pub const WINBIO_CREDENTIAL_PASSWORD = 1;
pub const WINBIO_CREDENTIAL_ALL = -1;
pub const WINBIO_PASSWORD_GENERIC = 1;
pub const WINBIO_PASSWORD_PACKED = 2;
pub const WINBIO_PASSWORD_PROTECTED = 3;
pub const WINBIO_CREDENTIAL_NOT_SET = 1;
pub const WINBIO_CREDENTIAL_SET = 2;
pub const WINBIO_ESS_REQUIRES_TPM2 = 1;
pub const WINBIO_ESS_REQUIRES_VBS_CAPABLE = 2;
pub const WINBIO_ESS_REQUIRES_NON_VBS_WINDOWS_HELLO_ABSENCE = 4;
pub const WINBIO_ESS_REQUIRES_VBS_WINDOWS_HELLO = 8;
pub const WINBIO_ESS_REQUIRES_VBS_RUNNING = 16;
pub const WINBIO_ESS_REQUIRES_VBS_ENCRYPTION_KEY = 32;
pub const WINBIO_ESS_REQUIRES_ENABLEMENT = 64;
pub const WINBIO_ESS_MANAGED_BY_POLICY = 128;
pub const WINBIO_ESS_REQUIRES_NON_VBS_BIOMETRIC_ENROLLMENT_ABSENCE = 256;
pub const WINBIO_ESS_REQUIRES_VBS_BIOMETRIC_ENROLLMENT = 512;
pub const WINBIO_ESS_REQUIRES_FACE_SENSOR = 1024;
pub const WINBIO_ESS_REQUIRES_FPR_SENSOR = 2048;
pub const WINBIO_ESS_REQUIRES_ISOLATED_PROCESS = 4096;
pub const WINBIO_ESS_BLOCKED_NON_ESS_FPR = 8192;
pub const WINBIO_ESS_BLOCKED_NON_ESS_CAMERA = 16384;
pub const WINBIO_ESS_SOURCE_DEFAULT = 32768;
pub const WINBIO_ASYNC_NOTIFY_NONE = 0;
pub const WINBIO_ASYNC_NOTIFY_CALLBACK = 1;
pub const WINBIO_ASYNC_NOTIFY_MESSAGE = 2;
pub const WINBIO_ASYNC_NOTIFY_MAXIMUM_VALUE = 3;

pub const aliases = struct {
    pub const WINBIO_SETTING_SOURCE = u32;
    pub const WINBIO_COMPONENT = u32;
    pub const WINBIO_POOL = u32;
    pub const WINBIO_ANTI_SPOOF_POLICY_ACTION = i32;
    pub const WINBIO_POLICY_SOURCE = i32;
    pub const WINBIO_CREDENTIAL_TYPE = i32;
    pub const WINBIO_CREDENTIAL_FORMAT = i32;
    pub const WINBIO_CREDENTIAL_STATE = i32;
    pub const WINBIO_ESS_STATE_FLAGS = i32;
    pub const WINBIO_ASYNC_NOTIFICATION_METHOD = i32;
    pub const WINIBIO_SENSOR_CONTEXT = isize;
    pub const WINIBIO_ENGINE_CONTEXT = isize;
    pub const WINIBIO_STORAGE_CONTEXT = isize;
    pub const PWINBIO_ASYNC_COMPLETION_CALLBACK = ?*const anyopaque;
    pub const PWINBIO_VERIFY_CALLBACK = ?*const anyopaque;
    pub const PWINBIO_IDENTIFY_CALLBACK = ?*const anyopaque;
    pub const PWINBIO_LOCATE_SENSOR_CALLBACK = ?*const anyopaque;
    pub const PWINBIO_ENROLL_CAPTURE_CALLBACK = ?*const anyopaque;
    pub const PWINBIO_EVENT_CALLBACK = ?*const anyopaque;
    pub const PWINBIO_CAPTURE_CALLBACK = ?*const anyopaque;
    pub const PIBIO_SENSOR_ATTACH_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_DETACH_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_CLEAR_CONTEXT_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_QUERY_STATUS_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_RESET_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_SET_MODE_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_SET_INDICATOR_STATUS_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_GET_INDICATOR_STATUS_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_START_CAPTURE_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_FINISH_CAPTURE_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_CANCEL_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_CONTROL_UNIT_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_PIPELINE_INIT_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_PIPELINE_CLEANUP_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_ACTIVATE_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_DEACTIVATE_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_CONNECT_SECURE_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_START_CAPTURE_EX_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_START_NOTIFY_WAKE_FN = ?*const anyopaque;
    pub const PIBIO_SENSOR_FINISH_NOTIFY_WAKE_FN = ?*const anyopaque;
    pub const PWINBIO_QUERY_SENSOR_INTERFACE_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_ATTACH_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_DETACH_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_CLEAR_CONTEXT_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_SET_HASH_ALGORITHM_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_VERIFY_FEATURE_SET_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_CREATE_ENROLLMENT_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_UPDATE_ENROLLMENT_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_COMMIT_ENROLLMENT_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_DISCARD_ENROLLMENT_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_CONTROL_UNIT_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_CONTROL_UNIT_PRIVILEGED_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_RESERVED_1_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_PIPELINE_INIT_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_PIPELINE_CLEANUP_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_ACTIVATE_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_DEACTIVATE_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_QUERY_EXTENDED_INFO_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_IDENTIFY_ALL_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_REFRESH_CACHE_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_CREATE_KEY_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_CREATE_ENROLLMENT_AUTHENTICATED_FN = ?*const anyopaque;
    pub const PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN = ?*const anyopaque;
    pub const PWINBIO_QUERY_ENGINE_INTERFACE_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_ATTACH_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_DETACH_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_CLEAR_CONTEXT_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_CREATE_DATABASE_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_ERASE_DATABASE_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_OPEN_DATABASE_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_CLOSE_DATABASE_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_GET_DATA_FORMAT_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_GET_DATABASE_SIZE_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_ADD_RECORD_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_DELETE_RECORD_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_QUERY_BY_SUBJECT_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_QUERY_BY_CONTENT_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_GET_RECORD_COUNT_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_FIRST_RECORD_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_NEXT_RECORD_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_GET_CURRENT_RECORD_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_CONTROL_UNIT_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_PIPELINE_INIT_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_PIPELINE_CLEANUP_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_ACTIVATE_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_DEACTIVATE_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_RESERVED_1_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_RESERVED_2_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN = ?*const anyopaque;
    pub const PIBIO_STORAGE_UPDATE_RECORD_COMMIT_FN = ?*const anyopaque;
    pub const PWINBIO_QUERY_STORAGE_INTERFACE_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_SET_UNIT_STATUS_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_VSM_CACHE_CLEAR_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_BEGIN_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_NEXT_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_END_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_BEGIN_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_END_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_2_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_3_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_ALLOCATE_MEMORY_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_FREE_MEMORY_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_GET_PROPERTY_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_LOCK_AND_VALIDATE_SECURE_BUFFER_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_RELEASE_SECURE_BUFFER_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_VSM_QUERY_AUTHORIZED_ENROLLMENTS_FN = ?*const anyopaque;
    pub const PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN = ?*const anyopaque;
};
