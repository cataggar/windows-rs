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
    .{ "GetDeviceRegistrationInfo", MethodRecord{ .library = "MDMRegistration", .import = "GetDeviceRegistrationInfo", .signature = "\x00\x02\x11\x79\x11\xaf\xc9\x0f\x0f\x01" } },
    .{ "IsDeviceRegisteredWithManagement", MethodRecord{ .library = "MDMRegistration", .import = "IsDeviceRegisteredWithManagement", .signature = "\x00\x03\x11\x79\x0f\x11\x59\x09\x11\x05" } },
    .{ "IsManagementRegistrationAllowed", MethodRecord{ .library = "MDMRegistration", .import = "IsManagementRegistrationAllowed", .signature = "\x00\x01\x11\x79\x0f\x11\x59" } },
    .{ "IsMdmUxWithoutAadAllowed", MethodRecord{ .library = "MDMRegistration", .import = "IsMdmUxWithoutAadAllowed", .signature = "\x00\x01\x11\x79\x0f\x11\x59" } },
    .{ "SetManagedExternally", MethodRecord{ .library = "MDMRegistration", .import = "SetManagedExternally", .signature = "\x00\x01\x11\x79\x11\x59" } },
    .{ "DiscoverManagementService", MethodRecord{ .library = "MDMRegistration", .import = "DiscoverManagementService", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x0f\x11\xaf\xcd" } },
    .{ "RegisterDeviceWithManagementUsingAADCredentials", MethodRecord{ .library = "MDMRegistration", .import = "RegisterDeviceWithManagementUsingAADCredentials", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "RegisterDeviceWithManagementUsingAADDeviceCredentials", MethodRecord{ .library = "MDMRegistration", .import = "RegisterDeviceWithManagementUsingAADDeviceCredentials", .signature = "\x00\x00\x11\x79" } },
    .{ "RegisterDeviceWithManagementUsingAADDeviceCredentials2", MethodRecord{ .library = "MDMRegistration", .import = "RegisterDeviceWithManagementUsingAADDeviceCredentials2", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "RegisterDeviceWithManagement", MethodRecord{ .library = "MDMRegistration", .import = "RegisterDeviceWithManagement", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x11\x05" } },
    .{ "UnregisterDeviceWithManagement", MethodRecord{ .library = "MDMRegistration", .import = "UnregisterDeviceWithManagement", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "GetDeviceManagementConfigInfo", MethodRecord{ .library = "MDMRegistration", .import = "GetDeviceManagementConfigInfo", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x09\x11\x05" } },
    .{ "SetDeviceManagementConfigInfo", MethodRecord{ .library = "MDMRegistration", .import = "SetDeviceManagementConfigInfo", .signature = "\x00\x02\x11\x79\x11\x05\x11\x05" } },
    .{ "GetManagementAppHyperlink", MethodRecord{ .library = "MDMRegistration", .import = "GetManagementAppHyperlink", .signature = "\x00\x02\x11\x79\x09\x11\x05" } },
    .{ "DiscoverManagementServiceEx", MethodRecord{ .library = "MDMRegistration", .import = "DiscoverManagementServiceEx", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x0f\x0f\x11\xaf\xcd" } },
    .{ "RegisterDeviceWithLocalManagement", MethodRecord{ .library = "MDMLocalManagement", .import = "RegisterDeviceWithLocalManagement", .signature = "\x00\x01\x11\x79\x0f\x11\x59" } },
    .{ "ApplyLocalManagementSyncML", MethodRecord{ .library = "MDMLocalManagement", .import = "ApplyLocalManagementSyncML", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "UnregisterDeviceWithLocalManagement", MethodRecord{ .library = "MDMLocalManagement", .import = "UnregisterDeviceWithLocalManagement", .signature = "\x00\x00\x11\x79" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x2fc9 => TypeRefEntry{ .namespace = "Windows.Win32.Management.MobileDeviceManagementRegistration", .name = "REGISTRATION_INFORMATION_CLASS" },
        0x2fcd => TypeRefEntry{ .namespace = "Windows.Win32.Management.MobileDeviceManagementRegistration", .name = "MANAGEMENT_SERVICE_INFO" },
        else => null,
    };
}

pub const MENROLL_E_DEVICE_MESSAGE_FORMAT_ERROR = -2145910783;
pub const MENROLL_E_DEVICE_AUTHENTICATION_ERROR = -2145910782;
pub const MENROLL_E_DEVICE_AUTHORIZATION_ERROR = -2145910781;
pub const MENROLL_E_DEVICE_CERTIFICATEREQUEST_ERROR = -2145910780;
pub const MENROLL_E_DEVICE_CONFIGMGRSERVER_ERROR = -2145910779;
pub const MENROLL_E_DEVICE_INTERNALSERVICE_ERROR = -2145910778;
pub const MENROLL_E_DEVICE_INVALIDSECURITY_ERROR = -2145910777;
pub const MENROLL_E_DEVICE_UNKNOWN_ERROR = -2145910776;
pub const MENROLL_E_ENROLLMENT_IN_PROGRESS = -2145910775;
pub const MENROLL_E_DEVICE_ALREADY_ENROLLED = -2145910774;
pub const MENROLL_E_DISCOVERY_SEC_CERT_DATE_INVALID = -2145910771;
pub const MENROLL_E_PASSWORD_NEEDED = -2145910770;
pub const MENROLL_E_WAB_ERROR = -2145910769;
pub const MENROLL_E_CONNECTIVITY = -2145910768;
pub const MENROLL_E_INVALIDSSLCERT = -2145910766;
pub const MENROLL_E_DEVICECAPREACHED = -2145910765;
pub const MENROLL_E_DEVICENOTSUPPORTED = -2145910764;
pub const MENROLL_E_NOT_SUPPORTED = -2145910763;
pub const MENROLL_E_NOTELIGIBLETORENEW = -2145910762;
pub const MENROLL_E_INMAINTENANCE = -2145910761;
pub const MENROLL_E_USER_LICENSE = -2145910760;
pub const MENROLL_E_ENROLLMENTDATAINVALID = -2145910759;
pub const MENROLL_E_INSECUREREDIRECT = -2145910758;
pub const MENROLL_E_PLATFORM_WRONG_STATE = -2145910757;
pub const MENROLL_E_PLATFORM_LICENSE_ERROR = -2145910756;
pub const MENROLL_E_PLATFORM_UNKNOWN_ERROR = -2145910755;
pub const MENROLL_E_PROV_CSP_CERTSTORE = -2145910754;
pub const MENROLL_E_PROV_CSP_W7 = -2145910753;
pub const MENROLL_E_PROV_CSP_DMCLIENT = -2145910752;
pub const MENROLL_E_PROV_CSP_PFW = -2145910751;
pub const MENROLL_E_PROV_CSP_MISC = -2145910750;
pub const MENROLL_E_PROV_UNKNOWN = -2145910749;
pub const MENROLL_E_PROV_SSLCERTNOTFOUND = -2145910748;
pub const MENROLL_E_PROV_CSP_APPMGMT = -2145910747;
pub const MENROLL_E_DEVICE_MANAGEMENT_BLOCKED = -2145910746;
pub const MENROLL_E_CERTPOLICY_PRIVATEKEYCREATION_FAILED = -2145910745;
pub const MENROLL_E_CERTAUTH_FAILED_TO_FIND_CERT = -2145910744;
pub const MENROLL_E_EMPTY_MESSAGE = -2145910743;
pub const MENROLL_E_USER_CANCELLED = -2145910736;
pub const MENROLL_E_MDM_NOT_CONFIGURED = -2145910735;
pub const MENROLL_E_CUSTOMSERVERERROR = -2145910734;
pub const MENROLL_E_SERVER429 = -2145910733;
pub const MDM_REGISTRATION_FACILITY_CODE = 25;
pub const DEVICE_ENROLLER_FACILITY_CODE = 24;
pub const MREGISTER_E_DEVICE_MESSAGE_FORMAT_ERROR = -2145845247;
pub const MREGISTER_E_DEVICE_AUTHENTICATION_ERROR = -2145845246;
pub const MREGISTER_E_DEVICE_AUTHORIZATION_ERROR = -2145845245;
pub const MREGISTER_E_DEVICE_CERTIFCATEREQUEST_ERROR = -2145845244;
pub const MENROLL_E_DEVICE_CERTIFCATEREQUEST_ERROR = -2145910780;
pub const MREGISTER_E_DEVICE_CONFIGMGRSERVER_ERROR = -2145845243;
pub const MREGISTER_E_DEVICE_INTERNALSERVICE_ERROR = -2145845242;
pub const MREGISTER_E_DEVICE_INVALIDSECURITY_ERROR = -2145845241;
pub const MREGISTER_E_DEVICE_UNKNOWN_ERROR = -2145845240;
pub const MREGISTER_E_REGISTRATION_IN_PROGRESS = -2145845239;
pub const MREGISTER_E_DEVICE_ALREADY_REGISTERED = -2145845238;
pub const MREGISTER_E_DEVICE_NOT_REGISTERED = -2145845237;
pub const MENROLL_E_DEVICE_NOT_ENROLLED = -2145910773;
pub const MREGISTER_E_DISCOVERY_REDIRECTED = -2145845236;
pub const MREGISTER_E_DEVICE_NOT_AD_REGISTERED_ERROR = -2145845235;
pub const MREGISTER_E_DISCOVERY_FAILED = -2145845234;
pub const MENROLL_E_NOTSUPPORTED = -2145910763;
pub const MENROLL_E_USERLICENSE = -2145910760;
pub const MENROLL_E_USER_CANCELED = -2145910742;
pub const DEVICEREGISTRATIONTYPE_MDM_ONLY = 0;
pub const DEVICEREGISTRATIONTYPE_MAM = 5;
pub const DEVICEREGISTRATIONTYPE_MDM_DEVICEWIDE_WITH_AAD = 6;
pub const DEVICEREGISTRATIONTYPE_MDM_USERSPECIFIC_WITH_AAD = 13;
pub const DeviceRegistrationBasicInfo = 1;
pub const MaxDeviceInfoClass = 2;

pub const aliases = struct {
    pub const REGISTRATION_INFORMATION_CLASS = i32;
};
