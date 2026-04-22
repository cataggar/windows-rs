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
    .{ "CreateTable", MethodRecord{ .library = "rtm", .import = "CreateTable", .signature = "\x00\x09\x08\x0f\x11\x0d\x12\xbd\xe5\x12\xbd\xe9\x12\xbd\xed\x0f\x01\x09\x09\x0f\x11\xbd\xf5\x0f\x12\xbf\xad" } },
    .{ "CreateIProp", MethodRecord{ .library = "MAPI32", .import = "CreateIProp", .signature = "\x00\x06\x08\x0f\x11\x0d\x12\xbd\xe5\x12\xbd\xe9\x12\xbd\xed\x0f\x01\x0f\x12\xbf\xb1" } },
    .{ "MAPIInitIdle", MethodRecord{ .library = "MAPI32", .import = "MAPIInitIdle", .signature = "\x00\x01\x08\x0f\x01" } },
    .{ "MAPIDeinitIdle", MethodRecord{ .library = "MAPI32", .import = "MAPIDeinitIdle", .signature = "\x00\x00\x01" } },
    .{ "FtgRegisterIdleRoutine", MethodRecord{ .library = "MAPI32", .import = "FtgRegisterIdleRoutine", .signature = "\x00\x05\x0f\x01\x12\xbf\xb5\x0f\x01\x06\x09\x07" } },
    .{ "DeregisterIdleRoutine", MethodRecord{ .library = "MAPI32", .import = "DeregisterIdleRoutine", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "EnableIdleRoutine", MethodRecord{ .library = "MAPI32", .import = "EnableIdleRoutine", .signature = "\x00\x02\x01\x0f\x01\x11\x59" } },
    .{ "ChangeIdleRoutine", MethodRecord{ .library = "MAPI32", .import = "ChangeIdleRoutine", .signature = "\x00\x07\x01\x0f\x01\x12\xbf\xb5\x0f\x01\x06\x09\x07\x07" } },
    .{ "MAPIGetDefaultMalloc", MethodRecord{ .library = "MAPI32", .import = "MAPIGetDefaultMalloc", .signature = "\x00\x00\x12\x82\xd9" } },
    .{ "OpenStreamOnFile", MethodRecord{ .library = "MAPI32", .import = "OpenStreamOnFile", .signature = "\x00\x06\x11\x79\x12\xbd\xe5\x12\xbd\xed\x09\x0f\x04\x0f\x04\x0f\x12\x83\x75" } },
    .{ "PropCopyMore", MethodRecord{ .library = "MAPI32", .import = "PropCopyMore", .signature = "\x00\x04\x08\x0f\x11\xbf\xb9\x0f\x11\xbf\xb9\x12\xbd\xe9\x0f\x01" } },
    .{ "UlPropSize", MethodRecord{ .library = "MAPI32", .import = "UlPropSize", .signature = "\x00\x01\x09\x0f\x11\xbf\xb9" } },
    .{ "FEqualNames", MethodRecord{ .library = "MAPI32", .import = "FEqualNames", .signature = "\x00\x02\x11\x59\x0f\x11\xbf\xbd\x0f\x11\xbf\xbd" } },
    .{ "FPropContainsProp", MethodRecord{ .library = "MAPI32", .import = "FPropContainsProp", .signature = "\x00\x03\x11\x59\x0f\x11\xbf\xb9\x0f\x11\xbf\xb9\x09" } },
    .{ "FPropCompareProp", MethodRecord{ .library = "MAPI32", .import = "FPropCompareProp", .signature = "\x00\x03\x11\x59\x0f\x11\xbf\xb9\x09\x0f\x11\xbf\xb9" } },
    .{ "LPropCompareProp", MethodRecord{ .library = "MAPI32", .import = "LPropCompareProp", .signature = "\x00\x02\x08\x0f\x11\xbf\xb9\x0f\x11\xbf\xb9" } },
    .{ "HrAddColumns", MethodRecord{ .library = "MAPI32", .import = "HrAddColumns", .signature = "\x00\x04\x11\x79\x12\xbf\xc1\x0f\x11\xbd\xf5\x12\xbd\xe5\x12\xbd\xed" } },
    .{ "HrAddColumnsEx", MethodRecord{ .library = "MAPI32", .import = "HrAddColumnsEx", .signature = "\x00\x05\x11\x79\x12\xbf\xc1\x0f\x11\xbd\xf5\x12\xbd\xe5\x12\xbd\xed\x18" } },
    .{ "HrAllocAdviseSink", MethodRecord{ .library = "MAPI32", .import = "HrAllocAdviseSink", .signature = "\x00\x03\x11\x79\x12\xbf\xc5\x0f\x01\x0f\x12\xbf\xc9" } },
    .{ "HrThisThreadAdviseSink", MethodRecord{ .library = "MAPI32", .import = "HrThisThreadAdviseSink", .signature = "\x00\x02\x11\x79\x12\xbf\xc9\x0f\x12\xbf\xc9" } },
    .{ "HrDispatchNotifications", MethodRecord{ .library = "MAPI32", .import = "HrDispatchNotifications", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "BuildDisplayTable", MethodRecord{ .library = "MAPI32", .import = "BuildDisplayTable", .signature = "\x00\x0a\x11\x79\x12\xbd\xe5\x12\xbd\xe9\x12\xbd\xed\x12\x82\xd9\x11\x82\x29\x09\x0f\x11\xbf\xcd\x09\x0f\x12\xbf\xc1\x0f\x12\xbf\xad" } },
    .{ "ScCountNotifications", MethodRecord{ .library = "MAPI32", .import = "ScCountNotifications", .signature = "\x00\x03\x08\x08\x0f\x11\xbf\xd1\x0f\x09" } },
    .{ "ScCopyNotifications", MethodRecord{ .library = "MAPI32", .import = "ScCopyNotifications", .signature = "\x00\x04\x08\x08\x0f\x11\xbf\xd1\x0f\x01\x0f\x09" } },
    .{ "ScRelocNotifications", MethodRecord{ .library = "MAPI32", .import = "ScRelocNotifications", .signature = "\x00\x05\x08\x08\x0f\x11\xbf\xd1\x0f\x01\x0f\x01\x0f\x09" } },
    .{ "ScCountProps", MethodRecord{ .library = "MAPI32", .import = "ScCountProps", .signature = "\x00\x03\x08\x08\x0f\x11\xbf\xb9\x0f\x09" } },
    .{ "LpValFindProp", MethodRecord{ .library = "MAPI32", .import = "LpValFindProp", .signature = "\x00\x03\x0f\x11\xbf\xb9\x09\x09\x0f\x11\xbf\xb9" } },
    .{ "ScCopyProps", MethodRecord{ .library = "MAPI32", .import = "ScCopyProps", .signature = "\x00\x04\x08\x08\x0f\x11\xbf\xb9\x0f\x01\x0f\x09" } },
    .{ "ScRelocProps", MethodRecord{ .library = "MAPI32", .import = "ScRelocProps", .signature = "\x00\x05\x08\x08\x0f\x11\xbf\xb9\x0f\x01\x0f\x01\x0f\x09" } },
    .{ "ScDupPropset", MethodRecord{ .library = "MAPI32", .import = "ScDupPropset", .signature = "\x00\x04\x08\x08\x0f\x11\xbf\xb9\x12\xbd\xe5\x0f\x0f\x11\xbf\xb9" } },
    .{ "UlAddRef", MethodRecord{ .library = "MAPI32", .import = "UlAddRef", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "UlRelease", MethodRecord{ .library = "MAPI32", .import = "UlRelease", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "HrGetOneProp", MethodRecord{ .library = "MAPI32", .import = "HrGetOneProp", .signature = "\x00\x03\x11\x79\x12\xbf\xd5\x09\x0f\x0f\x11\xbf\xb9" } },
    .{ "HrSetOneProp", MethodRecord{ .library = "MAPI32", .import = "HrSetOneProp", .signature = "\x00\x02\x11\x79\x12\xbf\xd5\x0f\x11\xbf\xb9" } },
    .{ "FPropExists", MethodRecord{ .library = "MAPI32", .import = "FPropExists", .signature = "\x00\x02\x11\x59\x12\xbf\xd5\x09" } },
    .{ "PpropFindProp", MethodRecord{ .library = "MAPI32", .import = "PpropFindProp", .signature = "\x00\x03\x0f\x11\xbf\xb9\x0f\x11\xbf\xb9\x09\x09" } },
    .{ "FreePadrlist", MethodRecord{ .library = "MAPI32", .import = "FreePadrlist", .signature = "\x00\x01\x01\x0f\x11\xbf\xd9" } },
    .{ "FreeProws", MethodRecord{ .library = "MAPI32", .import = "FreeProws", .signature = "\x00\x01\x01\x0f\x11\xbf\xdd" } },
    .{ "HrQueryAllRows", MethodRecord{ .library = "MAPI32", .import = "HrQueryAllRows", .signature = "\x00\x06\x11\x79\x12\xbf\xc1\x0f\x11\xbd\xf5\x0f\x11\xbf\xe1\x0f\x11\xbf\xe5\x08\x0f\x0f\x11\xbf\xdd" } },
    .{ "SzFindCh", MethodRecord{ .library = "MAPI32", .import = "SzFindCh", .signature = "\x00\x02\x0f\x04\x0f\x04\x07" } },
    .{ "SzFindLastCh", MethodRecord{ .library = "MAPI32", .import = "SzFindLastCh", .signature = "\x00\x02\x0f\x04\x0f\x04\x07" } },
    .{ "SzFindSz", MethodRecord{ .library = "MAPI32", .import = "SzFindSz", .signature = "\x00\x02\x0f\x04\x0f\x04\x0f\x04" } },
    .{ "UFromSz", MethodRecord{ .library = "MAPI32", .import = "UFromSz", .signature = "\x00\x01\x09\x0f\x04" } },
    .{ "ScUNCFromLocalPath", MethodRecord{ .library = "MAPI32", .import = "ScUNCFromLocalPath", .signature = "\x00\x03\x08\x11\x3d\x11\x3d\x09" } },
    .{ "ScLocalPathFromUNC", MethodRecord{ .library = "MAPI32", .import = "ScLocalPathFromUNC", .signature = "\x00\x03\x08\x11\x3d\x11\x3d\x09" } },
    .{ "FtAddFt", MethodRecord{ .library = "MAPI32", .import = "FtAddFt", .signature = "\x00\x02\x11\x80\x9d\x11\x80\x9d\x11\x80\x9d" } },
    .{ "FtMulDwDw", MethodRecord{ .library = "MAPI32", .import = "FtMulDwDw", .signature = "\x00\x02\x11\x80\x9d\x09\x09" } },
    .{ "FtMulDw", MethodRecord{ .library = "MAPI32", .import = "FtMulDw", .signature = "\x00\x02\x11\x80\x9d\x09\x11\x80\x9d" } },
    .{ "FtSubFt", MethodRecord{ .library = "MAPI32", .import = "FtSubFt", .signature = "\x00\x02\x11\x80\x9d\x11\x80\x9d\x11\x80\x9d" } },
    .{ "FtNegFt", MethodRecord{ .library = "MAPI32", .import = "FtNegFt", .signature = "\x00\x01\x11\x80\x9d\x11\x80\x9d" } },
    .{ "ScCreateConversationIndex", MethodRecord{ .library = "MAPI32", .import = "ScCreateConversationIndex", .signature = "\x00\x04\x08\x09\x0f\x05\x0f\x09\x0f\x0f\x05" } },
    .{ "WrapStoreEntryID", MethodRecord{ .library = "MAPI32", .import = "WrapStoreEntryID", .signature = "\x00\x06\x11\x79\x09\x0f\x04\x09\x0f\x11\xbf\xe9\x0f\x09\x0f\x0f\x11\xbf\xe9" } },
    .{ "RTFSync", MethodRecord{ .library = "MAPI32", .import = "RTFSync", .signature = "\x00\x03\x11\x79\x12\xac\xd9\x09\x0f\x11\x59" } },
    .{ "WrapCompressedRTFStream", MethodRecord{ .library = "MAPI32", .import = "WrapCompressedRTFStream", .signature = "\x00\x03\x11\x79\x12\x83\x75\x09\x0f\x12\x83\x75" } },
    .{ "HrIStorageFromStream", MethodRecord{ .library = "MAPI32", .import = "HrIStorageFromStream", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x0f\x11\x0d\x09\x0f\x12\x99\xb9" } },
    .{ "ScInitMapiUtil", MethodRecord{ .library = "MAPI32", .import = "ScInitMapiUtil", .signature = "\x00\x01\x08\x09" } },
    .{ "DeinitMapiUtil", MethodRecord{ .library = "MAPI32", .import = "DeinitMapiUtil", .signature = "\x00\x00\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x2d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IMalloc" },
        0x375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IStream" },
        0x19b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "IStorage" },
        0x2cd9 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "IMessage" },
        0x3de5 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "LPALLOCATEBUFFER" },
        0x3de9 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "LPALLOCATEMORE" },
        0x3ded => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "LPFREEBUFFER" },
        0x3df5 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "SPropTagArray" },
        0x3fad => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "ITableData" },
        0x3fb1 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "IPropData" },
        0x3fb5 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "PFNIDLE" },
        0x3fb9 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "SPropValue" },
        0x3fbd => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "MAPINAMEID" },
        0x3fc1 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "IMAPITable" },
        0x3fc5 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "LPNOTIFCALLBACK" },
        0x3fc9 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "IMAPIAdviseSink" },
        0x3fcd => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "DTPAGE" },
        0x3fd1 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "NOTIFICATION" },
        0x3fd5 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "IMAPIProp" },
        0x3fd9 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "ADRLIST" },
        0x3fdd => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "SRowSet" },
        0x3fe1 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "SRestriction" },
        0x3fe5 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "SSortOrderSet" },
        0x3fe9 => TypeRefEntry{ .namespace = "Windows.Win32.System.AddressBook", .name = "ENTRYID" },
        else => null,
    };
}

pub const PROP_ID_SECURE_MIN = 26608;
pub const PROP_ID_SECURE_MAX = 26623;
pub const MAPI_DIM = 1;
pub const fMapiUnicode = 0;
pub const hrSuccess = 0;
pub const MAPI_P1 = 268435456;
pub const MAPI_SUBMITTED = 2147483648;
pub const MAPI_SHORTTERM = 128;
pub const MAPI_NOTRECIP = 64;
pub const MAPI_THISSESSION = 32;
pub const MAPI_NOW = 16;
pub const MAPI_NOTRESERVED = 8;
pub const MAPI_COMPOUND = 128;
pub const cchProfileNameMax = 64;
pub const cchProfilePassMax = 64;
pub const MV_FLAG = 4096;
pub const PROP_ID_NULL = 0;
pub const PROP_ID_INVALID = 65535;
pub const MV_INSTANCE = 8192;
pub const TABLE_CHANGED = 1;
pub const TABLE_ERROR = 2;
pub const TABLE_ROW_ADDED = 3;
pub const TABLE_ROW_DELETED = 4;
pub const TABLE_ROW_MODIFIED = 5;
pub const TABLE_SORT_DONE = 6;
pub const TABLE_RESTRICT_DONE = 7;
pub const TABLE_SETCOL_DONE = 8;
pub const TABLE_RELOAD = 9;
pub const MAPI_ERROR_VERSION = 0;
pub const MAPI_USE_DEFAULT = 64;
pub const MNID_ID = 0;
pub const MNID_STRING = 1;
pub const WAB_LOCAL_CONTAINERS = 1048576;
pub const WAB_PROFILE_CONTENTS = 2097152;
pub const WAB_IGNORE_PROFILES = 8388608;
pub const MAPI_ONE_OFF_NO_RICH_INFO = 1;
pub const UI_SERVICE = 2;
pub const SERVICE_UI_ALWAYS = 2;
pub const SERVICE_UI_ALLOWED = 16;
pub const UI_CURRENT_PROVIDER_FIRST = 4;
pub const WABOBJECT_LDAPURL_RETURN_MAILUSER = 1;
pub const WABOBJECT_ME_NEW = 1;
pub const WABOBJECT_ME_NOCREATE = 2;
pub const WAB_VCARD_FILE = 0;
pub const WAB_VCARD_STREAM = 1;
pub const WAB_USE_OE_SENDMAIL = 1;
pub const WAB_ENABLE_PROFILES = 4194304;
pub const WAB_DISPLAY_LDAPURL = 1;
pub const WAB_CONTEXT_ADRLIST = 2;
pub const WAB_DISPLAY_ISNTDS = 4;
pub const E_IMAPI_REQUEST_CANCELLED = -1062600702;
pub const E_IMAPI_RECORDER_REQUIRED = -1062600701;
pub const S_IMAPI_SPEEDADJUSTED = 11141124;
pub const S_IMAPI_ROTATIONADJUSTED = 11141125;
pub const S_IMAPI_BOTHADJUSTED = 11141126;
pub const E_IMAPI_BURN_VERIFICATION_FAILED = -1062600697;
pub const S_IMAPI_COMMAND_HAS_SENSE_DATA = 11141632;
pub const E_IMAPI_RECORDER_NO_SUCH_MODE_PAGE = -1062600191;
pub const E_IMAPI_RECORDER_MEDIA_NO_MEDIA = -1062600190;
pub const E_IMAPI_RECORDER_MEDIA_INCOMPATIBLE = -1062600189;
pub const E_IMAPI_RECORDER_MEDIA_UPSIDE_DOWN = -1062600188;
pub const E_IMAPI_RECORDER_MEDIA_BECOMING_READY = -1062600187;
pub const E_IMAPI_RECORDER_MEDIA_FORMAT_IN_PROGRESS = -1062600186;
pub const E_IMAPI_RECORDER_MEDIA_BUSY = -1062600185;
pub const E_IMAPI_RECORDER_INVALID_MODE_PARAMETERS = -1062600184;
pub const E_IMAPI_RECORDER_MEDIA_WRITE_PROTECTED = -1062600183;
pub const E_IMAPI_RECORDER_NO_SUCH_FEATURE = -1062600182;
pub const E_IMAPI_RECORDER_FEATURE_IS_NOT_CURRENT = -1062600181;
pub const E_IMAPI_RECORDER_GET_CONFIGURATION_NOT_SUPPORTED = -1062600180;
pub const E_IMAPI_RECORDER_COMMAND_TIMEOUT = -1062600179;
pub const E_IMAPI_RECORDER_DVD_STRUCTURE_NOT_PRESENT = -1062600178;
pub const E_IMAPI_RECORDER_MEDIA_SPEED_MISMATCH = -1062600177;
pub const E_IMAPI_RECORDER_LOCKED = -1062600176;
pub const E_IMAPI_RECORDER_CLIENT_NAME_IS_NOT_VALID = -1062600175;
pub const E_IMAPI_RECORDER_MEDIA_NOT_FORMATTED = -1062600174;
pub const E_IMAPI_RECORDER_INVALID_RESPONSE_FROM_DEVICE = -1062599937;
pub const E_IMAPI_LOSS_OF_STREAMING = -1062599936;
pub const E_IMAPI_UNEXPECTED_RESPONSE_FROM_DEVICE = -1062599935;
pub const S_IMAPI_WRITE_NOT_IN_PROGRESS = 11141890;
pub const E_IMAPI_DF2DATA_WRITE_IN_PROGRESS = -1062599680;
pub const E_IMAPI_DF2DATA_WRITE_NOT_IN_PROGRESS = -1062599679;
pub const E_IMAPI_DF2DATA_INVALID_MEDIA_STATE = -1062599678;
pub const E_IMAPI_DF2DATA_STREAM_NOT_SUPPORTED = -1062599677;
pub const E_IMAPI_DF2DATA_STREAM_TOO_LARGE_FOR_CURRENT_MEDIA = -1062599676;
pub const E_IMAPI_DF2DATA_MEDIA_NOT_BLANK = -1062599675;
pub const E_IMAPI_DF2DATA_MEDIA_IS_NOT_SUPPORTED = -1062599674;
pub const E_IMAPI_DF2DATA_RECORDER_NOT_SUPPORTED = -1062599673;
pub const E_IMAPI_DF2DATA_CLIENT_NAME_IS_NOT_VALID = -1062599672;
pub const E_IMAPI_DF2TAO_WRITE_IN_PROGRESS = -1062599424;
pub const E_IMAPI_DF2TAO_WRITE_NOT_IN_PROGRESS = -1062599423;
pub const E_IMAPI_DF2TAO_MEDIA_IS_NOT_PREPARED = -1062599422;
pub const E_IMAPI_DF2TAO_MEDIA_IS_PREPARED = -1062599421;
pub const E_IMAPI_DF2TAO_PROPERTY_FOR_BLANK_MEDIA_ONLY = -1062599420;
pub const E_IMAPI_DF2TAO_TABLE_OF_CONTENTS_EMPTY_DISC = -1062599419;
pub const E_IMAPI_DF2TAO_MEDIA_IS_NOT_BLANK = -1062599418;
pub const E_IMAPI_DF2TAO_MEDIA_IS_NOT_SUPPORTED = -1062599417;
pub const E_IMAPI_DF2TAO_TRACK_LIMIT_REACHED = -1062599416;
pub const E_IMAPI_DF2TAO_NOT_ENOUGH_SPACE = -1062599415;
pub const E_IMAPI_DF2TAO_NO_RECORDER_SPECIFIED = -1062599414;
pub const E_IMAPI_DF2TAO_INVALID_ISRC = -1062599413;
pub const E_IMAPI_DF2TAO_INVALID_MCN = -1062599412;
pub const E_IMAPI_DF2TAO_STREAM_NOT_SUPPORTED = -1062599411;
pub const E_IMAPI_DF2TAO_RECORDER_NOT_SUPPORTED = -1062599410;
pub const E_IMAPI_DF2TAO_CLIENT_NAME_IS_NOT_VALID = -1062599409;
pub const E_IMAPI_DF2RAW_WRITE_IN_PROGRESS = -1062599168;
pub const E_IMAPI_DF2RAW_WRITE_NOT_IN_PROGRESS = -1062599167;
pub const E_IMAPI_DF2RAW_MEDIA_IS_NOT_PREPARED = -1062599166;
pub const E_IMAPI_DF2RAW_MEDIA_IS_PREPARED = -1062599165;
pub const E_IMAPI_DF2RAW_CLIENT_NAME_IS_NOT_VALID = -1062599164;
pub const E_IMAPI_DF2RAW_MEDIA_IS_NOT_BLANK = -1062599162;
pub const E_IMAPI_DF2RAW_MEDIA_IS_NOT_SUPPORTED = -1062599161;
pub const E_IMAPI_DF2RAW_NOT_ENOUGH_SPACE = -1062599159;
pub const E_IMAPI_DF2RAW_NO_RECORDER_SPECIFIED = -1062599158;
pub const E_IMAPI_DF2RAW_STREAM_NOT_SUPPORTED = -1062599155;
pub const E_IMAPI_DF2RAW_DATA_BLOCK_TYPE_NOT_SUPPORTED = -1062599154;
pub const E_IMAPI_DF2RAW_STREAM_LEADIN_TOO_SHORT = -1062599153;
pub const E_IMAPI_DF2RAW_RECORDER_NOT_SUPPORTED = -1062599152;
pub const E_IMAPI_ERASE_RECORDER_IN_USE = -2136340224;
pub const E_IMAPI_ERASE_ONLY_ONE_RECORDER_SUPPORTED = -2136340223;
pub const E_IMAPI_ERASE_DISC_INFORMATION_TOO_SMALL = -2136340222;
pub const E_IMAPI_ERASE_MODE_PAGE_2A_TOO_SMALL = -2136340221;
pub const E_IMAPI_ERASE_MEDIA_IS_NOT_ERASABLE = -2136340220;
pub const E_IMAPI_ERASE_DRIVE_FAILED_ERASE_COMMAND = -2136340219;
pub const E_IMAPI_ERASE_TOOK_LONGER_THAN_ONE_HOUR = -2136340218;
pub const E_IMAPI_ERASE_UNEXPECTED_DRIVE_RESPONSE_DURING_ERASE = -2136340217;
pub const E_IMAPI_ERASE_DRIVE_FAILED_SPINUP_COMMAND = -2136340216;
pub const E_IMAPI_ERASE_MEDIA_IS_NOT_SUPPORTED = -1062598391;
pub const E_IMAPI_ERASE_RECORDER_NOT_SUPPORTED = -1062598390;
pub const E_IMAPI_ERASE_CLIENT_NAME_IS_NOT_VALID = -1062598389;
pub const E_IMAPI_RAW_IMAGE_IS_READ_ONLY = -2136339968;
pub const E_IMAPI_RAW_IMAGE_TOO_MANY_TRACKS = -2136339967;
pub const E_IMAPI_RAW_IMAGE_SECTOR_TYPE_NOT_SUPPORTED = -2136339966;
pub const E_IMAPI_RAW_IMAGE_NO_TRACKS = -2136339965;
pub const E_IMAPI_RAW_IMAGE_TRACKS_ALREADY_ADDED = -2136339964;
pub const E_IMAPI_RAW_IMAGE_INSUFFICIENT_SPACE = -2136339963;
pub const E_IMAPI_RAW_IMAGE_TOO_MANY_TRACK_INDEXES = -2136339962;
pub const E_IMAPI_RAW_IMAGE_TRACK_INDEX_NOT_FOUND = -2136339961;
pub const S_IMAPI_RAW_IMAGE_TRACK_INDEX_ALREADY_EXISTS = 11143688;
pub const E_IMAPI_RAW_IMAGE_TRACK_INDEX_OFFSET_ZERO_CANNOT_BE_CLEARED = -2136339959;
pub const E_IMAPI_RAW_IMAGE_TRACK_INDEX_TOO_CLOSE_TO_OTHER_INDEX = -2136339958;
pub const FACILITY_IMAPI2 = 170;
pub const IMAPI_E_FSI_INTERNAL_ERROR = -1062555392;
pub const IMAPI_E_INVALID_PARAM = -1062555391;
pub const IMAPI_E_READONLY = -1062555390;
pub const IMAPI_E_NO_OUTPUT = -1062555389;
pub const IMAPI_E_INVALID_VOLUME_NAME = -1062555388;
pub const IMAPI_E_INVALID_DATE = -1062555387;
pub const IMAPI_E_FILE_SYSTEM_NOT_EMPTY = -1062555386;
pub const IMAPI_E_NOT_FILE = -1062555384;
pub const IMAPI_E_NOT_DIR = -1062555383;
pub const IMAPI_E_DIR_NOT_EMPTY = -1062555382;
pub const IMAPI_E_NOT_IN_FILE_SYSTEM = -1062555381;
pub const IMAPI_E_INVALID_PATH = -1062555376;
pub const IMAPI_E_RESTRICTED_NAME_VIOLATION = -1062555375;
pub const IMAPI_E_DUP_NAME = -1062555374;
pub const IMAPI_E_NO_UNIQUE_NAME = -1062555373;
pub const IMAPI_E_ITEM_NOT_FOUND = -1062555368;
pub const IMAPI_E_FILE_NOT_FOUND = -1062555367;
pub const IMAPI_E_DIR_NOT_FOUND = -1062555366;
pub const IMAPI_E_IMAGE_SIZE_LIMIT = -1062555360;
pub const IMAPI_E_IMAGE_TOO_BIG = -1062555359;
pub const IMAPI_E_DATA_STREAM_INCONSISTENCY = -1062555352;
pub const IMAPI_E_DATA_STREAM_READ_FAILURE = -1062555351;
pub const IMAPI_E_DATA_STREAM_CREATE_FAILURE = -1062555350;
pub const IMAPI_E_DIRECTORY_READ_FAILURE = -1062555349;
pub const IMAPI_E_TOO_MANY_DIRS = -1062555344;
pub const IMAPI_E_ISO9660_LEVELS = -1062555343;
pub const IMAPI_E_DATA_TOO_BIG = -1062555342;
pub const IMAPI_E_INCOMPATIBLE_PREVIOUS_SESSION = -1062555341;
pub const IMAPI_E_STASHFILE_OPEN_FAILURE = -1062555336;
pub const IMAPI_E_STASHFILE_SEEK_FAILURE = -1062555335;
pub const IMAPI_E_STASHFILE_WRITE_FAILURE = -1062555334;
pub const IMAPI_E_STASHFILE_READ_FAILURE = -1062555333;
pub const IMAPI_E_INVALID_WORKING_DIRECTORY = -1062555328;
pub const IMAPI_E_WORKING_DIRECTORY_SPACE = -1062555327;
pub const IMAPI_E_STASHFILE_MOVE = -1062555326;
pub const IMAPI_E_BOOT_IMAGE_DATA = -1062555320;
pub const IMAPI_E_BOOT_OBJECT_CONFLICT = -1062555319;
pub const IMAPI_E_BOOT_EMULATION_IMAGE_SIZE_MISMATCH = -1062555318;
pub const IMAPI_E_EMPTY_DISC = -1062555312;
pub const IMAPI_E_NO_SUPPORTED_FILE_SYSTEM = -1062555311;
pub const IMAPI_E_FILE_SYSTEM_NOT_FOUND = -1062555310;
pub const IMAPI_E_FILE_SYSTEM_READ_CONSISTENCY_ERROR = -1062555309;
pub const IMAPI_E_FILE_SYSTEM_FEATURE_NOT_SUPPORTED = -1062555308;
pub const IMAPI_E_IMPORT_TYPE_COLLISION_FILE_EXISTS_AS_DIRECTORY = -1062555307;
pub const IMAPI_E_IMPORT_SEEK_FAILURE = -1062555306;
pub const IMAPI_E_IMPORT_READ_FAILURE = -1062555305;
pub const IMAPI_E_DISC_MISMATCH = -1062555304;
pub const IMAPI_E_IMPORT_MEDIA_NOT_ALLOWED = -1062555303;
pub const IMAPI_E_UDF_NOT_WRITE_COMPATIBLE = -1062555302;
pub const IMAPI_E_INCOMPATIBLE_MULTISESSION_TYPE = -1062555301;
pub const IMAPI_E_NO_COMPATIBLE_MULTISESSION_TYPE = -1062555300;
pub const IMAPI_E_MULTISESSION_NOT_SET = -1062555299;
pub const IMAPI_E_IMPORT_TYPE_COLLISION_DIRECTORY_EXISTS_AS_FILE = -1062555298;
pub const IMAPI_S_IMAGE_FEATURE_NOT_SUPPORTED = 11186527;
pub const IMAPI_E_PROPERTY_NOT_ACCESSIBLE = -1062555296;
pub const IMAPI_E_UDF_REVISION_CHANGE_NOT_ALLOWED = -1062555295;
pub const IMAPI_E_BAD_MULTISESSION_PARAMETER = -1062555294;
pub const IMAPI_E_FILE_SYSTEM_CHANGE_NOT_ALLOWED = -1062555293;
pub const IMAPI_E_IMAGEMANAGER_IMAGE_NOT_ALIGNED = -1062555136;
pub const IMAPI_E_IMAGEMANAGER_NO_VALID_VD_FOUND = -1062555135;
pub const IMAPI_E_IMAGEMANAGER_NO_IMAGE = -1062555134;
pub const IMAPI_E_IMAGEMANAGER_IMAGE_TOO_BIG = -1062555133;
pub const MAPI_E_CALL_FAILED = -2147467259;
pub const MAPI_E_NOT_ENOUGH_MEMORY = -2147024882;
pub const MAPI_E_INVALID_PARAMETER = -2147024809;
pub const MAPI_E_INTERFACE_NOT_SUPPORTED = -2147467262;
pub const MAPI_E_NO_ACCESS = -2147024891;
pub const TAD_ALL_ROWS = 1;
pub const PRILOWEST = -32768;
pub const PRIHIGHEST = 32767;
pub const PRIUSER = 0;
pub const genderUnspecified = 0;
pub const genderFemale = 1;
pub const genderMale = 2;

pub const aliases = struct {
    pub const Gender = i32;
    pub const LPWABACTIONITEM = isize;
};
