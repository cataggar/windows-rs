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

pub const GNSS_DRIVER_VERSION_1 = 1;
pub const GNSS_DRIVER_VERSION_2 = 2;
pub const GNSS_DRIVER_VERSION_3 = 3;
pub const GNSS_DRIVER_VERSION_4 = 4;
pub const GNSS_DRIVER_VERSION_5 = 5;
pub const GNSS_DRIVER_VERSION_6 = 6;
pub const IOCTL_GNSS_SEND_PLATFORM_CAPABILITY = 2228228;
pub const IOCTL_GNSS_GET_DEVICE_CAPABILITY = 2228232;
pub const IOCTL_GNSS_SEND_DRIVERCOMMAND = 2228236;
pub const IOCTL_GNSS_START_FIXSESSION = 2228288;
pub const IOCTL_GNSS_MODIFY_FIXSESSION = 2228292;
pub const IOCTL_GNSS_STOP_FIXSESSION = 2228296;
pub const IOCTL_GNSS_GET_FIXDATA = 2228300;
pub const IOCTL_GNSS_INJECT_AGNSS = 2228352;
pub const IOCTL_GNSS_LISTEN_AGNSS = 2228416;
pub const IOCTL_GNSS_LISTEN_ERROR = 2228420;
pub const IOCTL_GNSS_LISTEN_NI = 2228480;
pub const IOCTL_GNSS_SET_SUPL_HSLP = 2228484;
pub const IOCTL_GNSS_CONFIG_SUPL_CERT = 2228488;
pub const IOCTL_GNSS_RESPOND_NI = 2228492;
pub const IOCTL_GNSS_EXECUTE_CWTEST = 2228496;
pub const IOCTL_GNSS_EXECUTE_SELFTEST = 2228500;
pub const IOCTL_GNSS_GET_CHIPSETINFO = 2228504;
pub const IOCTL_GNSS_LISTEN_NMEA = 2228508;
pub const IOCTL_GNSS_SET_V2UPL_CONFIG = 2228512;
pub const IOCTL_GNSS_CREATE_GEOFENCE = 2228544;
pub const IOCTL_GNSS_DELETE_GEOFENCE = 2228548;
pub const IOCTL_GNSS_LISTEN_GEOFENCE_ALERT = 2228552;
pub const IOCTL_GNSS_LISTEN_GEOFENCES_TRACKINGSTATUS = 2228556;
pub const IOCTL_GNSS_LISTEN_DRIVER_REQUEST = 2228608;
pub const IOCTL_GNSS_START_BREADCRUMBING = 2228672;
pub const IOCTL_GNSS_STOP_BREADCRUMBING = 2228676;
pub const IOCTL_GNSS_LISTEN_BREADCRUMBING_ALERT = 2228680;
pub const IOCTL_GNSS_POP_BREADCRUMBS = 2228684;
pub const GNSS_AGNSSFORMAT_XTRA1 = 1;
pub const GNSS_AGNSSFORMAT_XTRA2 = 2;
pub const GNSS_AGNSSFORMAT_LTO = 4;
pub const GNSS_AGNSSFORMAT_XTRA3 = 8;
pub const GNSS_AGNSSFORMAT_XTRA3_1 = 16;
pub const GNSS_AGNSSFORMAT_XTRA3_2 = 32;
pub const GNSS_AGNSSFORMAT_XTRA_INT = 64;
pub const MAX_SERVER_URL_NAME = 260;
pub const MIN_GEOFENCES_REQUIRED = 100;
pub const BREADCRUMBING_UNSUPPORTED = 0;
pub const BREADCRUMBING_VERSION_1 = 1;
pub const MIN_BREADCRUMBS_SUPPORTED = 120;
pub const GNSS_SATELLITE_ANY = 0;
pub const GNSS_SATELLITE_GPS = 1;
pub const GNSS_SATELLITE_GLONASS = 2;
pub const GNSS_SATELLITE_BEIDOU = 4;
pub const GNSS_SATELLITE_GALILEO = 8;
pub const GNSS_OPERMODE_ANY = 0;
pub const GNSS_OPERMODE_MSA = 1;
pub const GNSS_OPERMODE_MSB = 2;
pub const GNSS_OPERMODE_MSS = 4;
pub const GNSS_OPERMODE_CELLID = 8;
pub const GNSS_OPERMODE_AFLT = 16;
pub const GNSS_OPERMODE_OTDOA = 32;
pub const GNSS_NMEALOGGING_NONE = 0;
pub const GNSS_NMEALOGGING_ALL = 255;
pub const GNSS_FIXDETAIL_BASIC = 1;
pub const GNSS_FIXDETAIL_ACCURACY = 2;
pub const GNSS_FIXDETAIL_SATELLITE = 4;
pub const GNSS_MAXSATELLITE = 64;
pub const GNSS_GEOFENCESUPPORT_SUPPORTED = 1;
pub const GNSS_GEOFENCESUPPORT_CIRCLE = 2;
pub const LOCATION_API_VERSION = 1;
pub const REPORT_NOT_SUPPORTED = 0;
pub const REPORT_ERROR = 1;
pub const REPORT_ACCESS_DENIED = 2;
pub const REPORT_INITIALIZING = 3;
pub const REPORT_RUNNING = 4;
pub const GNSS_SetLocationServiceEnabled = 1;
pub const GNSS_SetLocationNIRequestAllowed = 2;
pub const GNSS_ForceSatelliteSystem = 3;
pub const GNSS_ForceOperationMode = 4;
pub const GNSS_ResetEngine = 9;
pub const GNSS_ClearAgnssData = 10;
pub const GNSS_SetSuplVersion = 12;
pub const GNSS_SetNMEALogging = 13;
pub const GNSS_SetUplServerAccessInterval = 14;
pub const GNSS_SetNiTimeoutInterval = 15;
pub const GNSS_ResetGeofencesTracking = 16;
pub const GNSS_SetSuplVersion2 = 17;
pub const GNSS_CustomCommand = 256;
pub const GNSS_FixSession_SingleShot = 1;
pub const GNSS_FixSession_DistanceTracking = 2;
pub const GNSS_FixSession_ContinuousTracking = 3;
pub const GNSS_FixSession_LKG = 4;
pub const GNSS_GeoRegion_Circle = 1;
pub const GNSS_GeofenceState_Unknown = 0;
pub const GNSS_GeofenceState_Entered = 1;
pub const GNSS_GeofenceState_Exited = 2;
pub const GNSS_Event_FixAvailable = 1;
pub const GNSS_Event_RequireAgnss = 2;
pub const GNSS_Event_Error = 3;
pub const GNSS_Event_NiRequest = 12;
pub const GNSS_Event_NmeaData = 13;
pub const GNSS_Event_GeofenceAlertData = 14;
pub const GNSS_Event_GeofencesTrackingStatus = 15;
pub const GNSS_Event_DriverRequest = 16;
pub const GNSS_Event_BreadcrumbAlertEvent = 17;
pub const GNSS_Event_FixAvailable_2 = 18;
pub const GNSS_Event_Custom = 32768;
pub const GNSS_AGNSS_TimeInjection = 1;
pub const GNSS_AGNSS_PositionInjection = 2;
pub const GNSS_AGNSS_BlobInjection = 3;
pub const GNSS_NI_SUPL = 1;
pub const GNSS_NI_CP = 2;
pub const GNSS_NI_V2UPL = 3;
pub const GNSS_NI_Request_SingleShot = 1;
pub const GNSS_NI_Request_AreaTrigger = 2;
pub const GNSS_NI_NoNotifyNoVerify = 1;
pub const GNSS_NI_NotifyOnly = 2;
pub const GNSS_NI_NotifyVerifyDefaultAllow = 3;
pub const GNSS_NI_NotifyVerifyDefaultNotAllow = 4;
pub const GNSS_NI_PrivacyOverride = 5;
pub const SUPL_CONFIG_DATA = 1;
pub const GNSS_Supl_Cert_Inject = 1;
pub const GNSS_Supl_Cert_Delete = 2;
pub const GNSS_Supl_Cert_Purge = 3;
pub const GNSS_Ni_UserResponseAccept = 1;
pub const GNSS_Ni_UserResponseDeny = 2;
pub const GNSS_Ni_UserResponseTimeout = 3;

pub const aliases = struct {
    pub const LOCATION_REPORT_STATUS = i32;
    pub const GNSS_DRIVERCOMMAND_TYPE = i32;
    pub const GNSS_FIXSESSIONTYPE = i32;
    pub const GNSS_GEOREGIONTYPE = i32;
    pub const GNSS_GEOFENCE_STATE = i32;
    pub const GNSS_EVENT_TYPE = i32;
    pub const GNSS_AGNSS_REQUEST_TYPE = i32;
    pub const GNSS_NI_PLANE_TYPE = i32;
    pub const GNSS_NI_REQUEST_TYPE = i32;
    pub const GNSS_NI_NOTIFICATION_TYPE = i32;
    pub const GNSS_DRIVER_REQUEST = i32;
    pub const GNSS_SUPL_CERT_ACTION = i32;
    pub const GNSS_NI_USER_RESPONSE = i32;
};
