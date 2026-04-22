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
    .{ "GetPerformanceTime", MethodRecord{ .library = "SensorsUtilsV2", .import = "GetPerformanceTime", .signature = "\x00\x01\x11\x84\x71\x0f\x09" } },
    .{ "InitPropVariantFromFloat", MethodRecord{ .library = "SensorsUtilsV2", .import = "InitPropVariantFromFloat", .signature = "\x00\x02\x11\x79\x0c\x0f\x11\x82\x01" } },
    .{ "PropKeyFindKeyGetPropVariant", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropKeyFindKeyGetPropVariant", .signature = "\x00\x04\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\x81\x71\x11\x87\x79\x0f\x11\x82\x01" } },
    .{ "PropKeyFindKeySetPropVariant", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropKeyFindKeySetPropVariant", .signature = "\x00\x04\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\x81\x71\x11\x87\x79\x0f\x11\x82\x01" } },
    .{ "PropKeyFindKeyGetFileTime", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropKeyFindKeyGetFileTime", .signature = "\x00\x03\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\x81\x71\x0f\x11\x80\x9d" } },
    .{ "PropKeyFindKeyGetGuid", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropKeyFindKeyGetGuid", .signature = "\x00\x03\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\x81\x71\x0f\x11\x0d" } },
    .{ "PropKeyFindKeyGetBool", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropKeyFindKeyGetBool", .signature = "\x00\x03\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\x81\x71\x0f\x11\x59" } },
    .{ "PropKeyFindKeyGetUlong", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropKeyFindKeyGetUlong", .signature = "\x00\x03\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\x81\x71\x0f\x09" } },
    .{ "PropKeyFindKeyGetUshort", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropKeyFindKeyGetUshort", .signature = "\x00\x03\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\x81\x71\x0f\x07" } },
    .{ "PropKeyFindKeyGetFloat", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropKeyFindKeyGetFloat", .signature = "\x00\x03\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\x81\x71\x0f\x0c" } },
    .{ "PropKeyFindKeyGetDouble", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropKeyFindKeyGetDouble", .signature = "\x00\x03\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\x81\x71\x0f\x0d" } },
    .{ "PropKeyFindKeyGetInt32", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropKeyFindKeyGetInt32", .signature = "\x00\x03\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\x81\x71\x0f\x08" } },
    .{ "PropKeyFindKeyGetInt64", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropKeyFindKeyGetInt64", .signature = "\x00\x03\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\x81\x71\x0f\x0a" } },
    .{ "PropKeyFindKeyGetNthUlong", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropKeyFindKeyGetNthUlong", .signature = "\x00\x04\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\x81\x71\x09\x0f\x09" } },
    .{ "PropKeyFindKeyGetNthUshort", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropKeyFindKeyGetNthUshort", .signature = "\x00\x04\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\x81\x71\x09\x0f\x07" } },
    .{ "PropKeyFindKeyGetNthInt64", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropKeyFindKeyGetNthInt64", .signature = "\x00\x04\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\x81\x71\x09\x0f\x0a" } },
    .{ "IsKeyPresentInPropertyList", MethodRecord{ .library = "SensorsUtilsV2", .import = "IsKeyPresentInPropertyList", .signature = "\x00\x02\x11\x87\x79\x0f\x11\xac\x25\x0f\x11\x81\x71" } },
    .{ "IsKeyPresentInCollectionList", MethodRecord{ .library = "SensorsUtilsV2", .import = "IsKeyPresentInCollectionList", .signature = "\x00\x02\x11\x87\x79\x0f\x11\xac\x21\x0f\x11\x81\x71" } },
    .{ "IsCollectionListSame", MethodRecord{ .library = "SensorsUtilsV2", .import = "IsCollectionListSame", .signature = "\x00\x02\x11\x87\x79\x0f\x11\xac\x21\x0f\x11\xac\x21" } },
    .{ "PropVariantGetInformation", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropVariantGetInformation", .signature = "\x00\x05\x11\x84\x71\x0f\x11\x82\x01\x0f\x09\x0f\x09\x0f\x0f\x01\x0f\x11\x8a\x3d" } },
    .{ "PropertiesListCopy", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropertiesListCopy", .signature = "\x00\x02\x11\x84\x71\x0f\x11\xac\x25\x0f\x11\xac\x25" } },
    .{ "PropertiesListGetFillableCount", MethodRecord{ .library = "SensorsUtilsV2", .import = "PropertiesListGetFillableCount", .signature = "\x00\x01\x09\x09" } },
    .{ "CollectionsListGetMarshalledSize", MethodRecord{ .library = "SensorsUtilsV2", .import = "CollectionsListGetMarshalledSize", .signature = "\x00\x01\x09\x0f\x11\xac\x21" } },
    .{ "CollectionsListCopyAndMarshall", MethodRecord{ .library = "SensorsUtilsV2", .import = "CollectionsListCopyAndMarshall", .signature = "\x00\x02\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\xac\x21" } },
    .{ "CollectionsListMarshall", MethodRecord{ .library = "SensorsUtilsV2", .import = "CollectionsListMarshall", .signature = "\x00\x01\x11\x84\x71\x0f\x11\xac\x21" } },
    .{ "CollectionsListGetMarshalledSizeWithoutSerialization", MethodRecord{ .library = "SensorsUtilsV2", .import = "CollectionsListGetMarshalledSizeWithoutSerialization", .signature = "\x00\x01\x09\x0f\x11\xac\x21" } },
    .{ "CollectionsListUpdateMarshalledPointer", MethodRecord{ .library = "SensorsUtilsV2", .import = "CollectionsListUpdateMarshalledPointer", .signature = "\x00\x01\x11\x84\x71\x0f\x11\xac\x21" } },
    .{ "SerializationBufferAllocate", MethodRecord{ .library = "SensorsUtilsV2", .import = "SerializationBufferAllocate", .signature = "\x00\x02\x11\x84\x71\x09\x0f\x0f\x05" } },
    .{ "SerializationBufferFree", MethodRecord{ .library = "SensorsUtilsV2", .import = "SerializationBufferFree", .signature = "\x00\x01\x01\x0f\x05" } },
    .{ "CollectionsListGetSerializedSize", MethodRecord{ .library = "SensorsUtilsV2", .import = "CollectionsListGetSerializedSize", .signature = "\x00\x01\x09\x0f\x11\xac\x21" } },
    .{ "CollectionsListSerializeToBuffer", MethodRecord{ .library = "SensorsUtilsV2", .import = "CollectionsListSerializeToBuffer", .signature = "\x00\x03\x11\x84\x71\x0f\x11\xac\x21\x09\x0f\x05" } },
    .{ "CollectionsListAllocateBufferAndSerialize", MethodRecord{ .library = "SensorsUtilsV2", .import = "CollectionsListAllocateBufferAndSerialize", .signature = "\x00\x03\x11\x84\x71\x0f\x11\xac\x21\x0f\x09\x0f\x0f\x05" } },
    .{ "CollectionsListDeserializeFromBuffer", MethodRecord{ .library = "SensorsUtilsV2", .import = "CollectionsListDeserializeFromBuffer", .signature = "\x00\x03\x11\x84\x71\x09\x0f\x05\x0f\x11\xac\x21" } },
    .{ "SensorCollectionGetAt", MethodRecord{ .library = "SensorsUtilsV2", .import = "SensorCollectionGetAt", .signature = "\x00\x04\x11\x84\x71\x09\x0f\x11\xac\x21\x0f\x11\x81\x71\x0f\x11\x82\x01" } },
    .{ "CollectionsListGetFillableCount", MethodRecord{ .library = "SensorsUtilsV2", .import = "CollectionsListGetFillableCount", .signature = "\x00\x01\x09\x09" } },
    .{ "EvaluateActivityThresholds", MethodRecord{ .library = "SensorsUtilsV2", .import = "EvaluateActivityThresholds", .signature = "\x00\x03\x11\x87\x79\x0f\x11\xac\x21\x0f\x11\xac\x21\x0f\x11\xac\x21" } },
    .{ "CollectionsListSortSubscribedActivitiesByConfidence", MethodRecord{ .library = "SensorsUtilsV2", .import = "CollectionsListSortSubscribedActivitiesByConfidence", .signature = "\x00\x02\x11\x84\x71\x0f\x11\xac\x21\x0f\x11\xac\x21" } },
    .{ "InitPropVariantFromCLSIDArray", MethodRecord{ .library = "SensorsUtilsV2", .import = "InitPropVariantFromCLSIDArray", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x09\x0f\x11\x82\x01" } },
    .{ "IsSensorSubscribed", MethodRecord{ .library = "SensorsUtilsV2", .import = "IsSensorSubscribed", .signature = "\x00\x02\x11\x87\x79\x0f\x11\xac\x21\x11\x0d" } },
    .{ "IsGUIDPresentInList", MethodRecord{ .library = "SensorsUtilsV2", .import = "IsGUIDPresentInList", .signature = "\x00\x03\x11\x87\x79\x0f\x11\x0d\x09\x0f\x11\x0d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x171 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PROPERTYKEY" },
        0x201 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "PROPVARIANT" },
        0x471 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "NTSTATUS" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0xa3d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Properties", .name = "DEVPROPTYPE" },
        0x2c21 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Sensors", .name = "SENSOR_COLLECTION_LIST" },
        0x2c25 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.Sensors", .name = "SENSOR_PROPERTY_LIST" },
        else => null,
    };
}

pub const GNSS_CLEAR_ALL_ASSISTANCE_DATA = 1;
pub const SENSOR_PROPERTY_LIST_HEADER_SIZE = 8;
pub const SENSOR_STATE_MIN = 0;
pub const SENSOR_STATE_READY = 0;
pub const SENSOR_STATE_NOT_AVAILABLE = 1;
pub const SENSOR_STATE_NO_DATA = 2;
pub const SENSOR_STATE_INITIALIZING = 3;
pub const SENSOR_STATE_ACCESS_DENIED = 4;
pub const SENSOR_STATE_ERROR = 5;
pub const SENSOR_STATE_MAX = 5;
pub const SENSOR_CONNECTION_TYPE_PC_INTEGRATED = 0;
pub const SENSOR_CONNECTION_TYPE_PC_ATTACHED = 1;
pub const SENSOR_CONNECTION_TYPE_PC_EXTERNAL = 2;
pub const LOCATION_DESIRED_ACCURACY_DEFAULT = 0;
pub const LOCATION_DESIRED_ACCURACY_HIGH = 1;
pub const LOCATION_POSITION_SOURCE_CELLULAR = 0;
pub const LOCATION_POSITION_SOURCE_SATELLITE = 1;
pub const LOCATION_POSITION_SOURCE_WIFI = 2;
pub const LOCATION_POSITION_SOURCE_IPADDRESS = 3;
pub const LOCATION_POSITION_SOURCE_UNKNOWN = 4;
pub const SIMPLE_DEVICE_ORIENTATION_NOT_ROTATED = 0;
pub const SIMPLE_DEVICE_ORIENTATION_ROTATED_90 = 1;
pub const SIMPLE_DEVICE_ORIENTATION_ROTATED_180 = 2;
pub const SIMPLE_DEVICE_ORIENTATION_ROTATED_270 = 3;
pub const SIMPLE_DEVICE_ORIENTATION_ROTATED_FACE_UP = 4;
pub const SIMPLE_DEVICE_ORIENTATION_ROTATED_FACE_DOWN = 5;
pub const MAGNETOMETER_ACCURACY_UNKNOWN = 0;
pub const MAGNETOMETER_ACCURACY_UNRELIABLE = 1;
pub const MAGNETOMETER_ACCURACY_APPROXIMATE = 2;
pub const MAGNETOMETER_ACCURACY_HIGH = 3;
pub const ActivityStateCount = 8;
pub const ActivityState_Unknown = 1;
pub const ActivityState_Stationary = 2;
pub const ActivityState_Fidgeting = 4;
pub const ActivityState_Walking = 8;
pub const ActivityState_Running = 16;
pub const ActivityState_InVehicle = 32;
pub const ActivityState_Biking = 64;
pub const ActivityState_Idle = 128;
pub const ActivityState_Max = 256;
pub const ActivityState_Force_Dword = -1;
pub const ElevationChangeMode_Unknown = 0;
pub const ElevationChangeMode_Elevator = 1;
pub const ElevationChangeMode_Stepping = 2;
pub const ElevationChangeMode_Max = 3;
pub const ElevationChangeMode_Force_Dword = -1;
pub const MagnetometerAccuracy_Unknown = 0;
pub const MagnetometerAccuracy_Unreliable = 1;
pub const MagnetometerAccuracy_Approximate = 2;
pub const MagnetometerAccuracy_High = 3;
pub const PedometerStepTypeCount = 3;
pub const PedometerStepType_Unknown = 1;
pub const PedometerStepType_Walking = 2;
pub const PedometerStepType_Running = 4;
pub const PedometerStepType_Max = 8;
pub const PedometerStepType_Force_Dword = -1;
pub const ProximityType_ObjectProximity = 0;
pub const ProximityType_HumanProximity = 1;
pub const ProximityType_Force_Dword = -1;
pub const HumanPresenceDetectionTypeCount = 4;
pub const HumanPresenceDetectionType_Undefined = 0;
pub const HumanPresenceDetectionType_VendorDefinedNonBiometric = 1;
pub const HumanPresenceDetectionType_VendorDefinedBiometric = 2;
pub const HumanPresenceDetectionType_FacialBiometric = 4;
pub const HumanPresenceDetectionType_AudioBiometric = 8;
pub const HumanPresenceDetectionType_Force_Dword = -1;
pub const Proximity_Sensor_Human_Presence_Capable = 1;
pub const Proximity_Sensor_Human_Engagement_Capable = 2;
pub const Proximity_Sensor_Human_Head_Azimuth_Capable = 4;
pub const Proximity_Sensor_Human_Head_Altitude_Capable = 8;
pub const Proximity_Sensor_Human_Head_Roll_Capable = 16;
pub const Proximity_Sensor_Human_Head_Pitch_Capable = 32;
pub const Proximity_Sensor_Human_Head_Yaw_Capable = 64;
pub const Proximity_Sensor_Human_Identification_Capable = 128;
pub const Proximity_Sensor_Multi_Person_Detection_Capable = 256;
pub const Proximity_Sensor_Supported_Capabilities = 511;
pub const SimpleDeviceOrientation_NotRotated = 0;
pub const SimpleDeviceOrientation_Rotated90DegreesCounterclockwise = 1;
pub const SimpleDeviceOrientation_Rotated180DegreesCounterclockwise = 2;
pub const SimpleDeviceOrientation_Rotated270DegreesCounterclockwise = 3;
pub const SimpleDeviceOrientation_Faceup = 4;
pub const SimpleDeviceOrientation_Facedown = 5;
pub const SensorState_Initializing = 0;
pub const SensorState_Idle = 1;
pub const SensorState_Active = 2;
pub const SensorState_Error = 3;
pub const SensorConnectionType_Integrated = 0;
pub const SensorConnectionType_Attached = 1;
pub const SensorConnectionType_External = 2;
pub const AXIS_X = 0;
pub const AXIS_Y = 1;
pub const AXIS_Z = 2;
pub const AXIS_MAX = 3;

pub const aliases = struct {
    pub const SensorState = i32;
    pub const SensorConnectionType = i32;
    pub const LOCATION_DESIRED_ACCURACY = i32;
    pub const LOCATION_POSITION_SOURCE = i32;
    pub const SimpleDeviceOrientation = i32;
    pub const MagnetometerAccuracy = i32;
    pub const ACTIVITY_STATE_COUNT = i32;
    pub const ACTIVITY_STATE = i32;
    pub const ELEVATION_CHANGE_MODE = i32;
    pub const MAGNETOMETER_ACCURACY = i32;
    pub const PEDOMETER_STEP_TYPE_COUNT = i32;
    pub const PEDOMETER_STEP_TYPE = i32;
    pub const PROXIMITY_TYPE = i32;
    pub const HUMAN_PRESENCE_DETECTION_TYPE_COUNT = i32;
    pub const HUMAN_PRESENCE_DETECTION_TYPE = i32;
    pub const PROXIMITY_SENSOR_CAPABILITIES = i32;
    pub const SIMPLE_DEVICE_ORIENTATION = i32;
    pub const SENSOR_STATE = i32;
    pub const SENSOR_CONNECTION_TYPES = i32;
    pub const AXIS = i32;
};
