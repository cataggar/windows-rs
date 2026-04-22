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
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const IOCTL_CDROM_BASE = 2;
pub const IOCTL_CDROM_UNLOAD_DRIVER = 151560;
pub const IOCTL_CDROM_READ_TOC = 147456;
pub const IOCTL_CDROM_SEEK_AUDIO_MSF = 147460;
pub const IOCTL_CDROM_STOP_AUDIO = 147464;
pub const IOCTL_CDROM_PAUSE_AUDIO = 147468;
pub const IOCTL_CDROM_RESUME_AUDIO = 147472;
pub const IOCTL_CDROM_GET_VOLUME = 147476;
pub const IOCTL_CDROM_PLAY_AUDIO_MSF = 147480;
pub const IOCTL_CDROM_SET_VOLUME = 147496;
pub const IOCTL_CDROM_READ_Q_CHANNEL = 147500;
pub const IOCTL_CDROM_GET_CONTROL = 147508;
pub const OBSOLETE_IOCTL_CDROM_GET_CONTROL = 147508;
pub const IOCTL_CDROM_GET_LAST_SESSION = 147512;
pub const IOCTL_CDROM_RAW_READ = 147518;
pub const IOCTL_CDROM_DISK_TYPE = 131136;
pub const IOCTL_CDROM_GET_DRIVE_GEOMETRY = 147532;
pub const IOCTL_CDROM_GET_DRIVE_GEOMETRY_EX = 147536;
pub const IOCTL_CDROM_READ_TOC_EX = 147540;
pub const IOCTL_CDROM_GET_CONFIGURATION = 147544;
pub const IOCTL_CDROM_EXCLUSIVE_ACCESS = 180316;
pub const IOCTL_CDROM_SET_SPEED = 147552;
pub const IOCTL_CDROM_GET_INQUIRY_DATA = 147556;
pub const IOCTL_CDROM_ENABLE_STREAMING = 147560;
pub const IOCTL_CDROM_SEND_OPC_INFORMATION = 180332;
pub const IOCTL_CDROM_GET_PERFORMANCE = 147568;
pub const IOCTL_CDROM_CHECK_VERIFY = 149504;
pub const IOCTL_CDROM_MEDIA_REMOVAL = 149508;
pub const IOCTL_CDROM_EJECT_MEDIA = 149512;
pub const IOCTL_CDROM_LOAD_MEDIA = 149516;
pub const IOCTL_CDROM_RESERVE = 149520;
pub const IOCTL_CDROM_RELEASE = 149524;
pub const IOCTL_CDROM_FIND_NEW_DEVICES = 149528;
pub const MINIMUM_CDROM_INQUIRY_SIZE = 36;
pub const MAXIMUM_CDROM_INQUIRY_SIZE = 260;
pub const IOCTL_CDROM_SIMBAD = 147468;
pub const MAXIMUM_NUMBER_TRACKS = 100;
pub const MAXIMUM_CDROM_SIZE = 804;
pub const MINIMUM_CDROM_READ_TOC_EX_SIZE = 2;
pub const CDROM_READ_TOC_EX_FORMAT_TOC = 0;
pub const CDROM_READ_TOC_EX_FORMAT_SESSION = 1;
pub const CDROM_READ_TOC_EX_FORMAT_FULL_TOC = 2;
pub const CDROM_READ_TOC_EX_FORMAT_PMA = 3;
pub const CDROM_READ_TOC_EX_FORMAT_ATIP = 4;
pub const CDROM_READ_TOC_EX_FORMAT_CDTEXT = 5;
pub const CDROM_CD_TEXT_PACK_ALBUM_NAME = 128;
pub const CDROM_CD_TEXT_PACK_PERFORMER = 129;
pub const CDROM_CD_TEXT_PACK_SONGWRITER = 130;
pub const CDROM_CD_TEXT_PACK_COMPOSER = 131;
pub const CDROM_CD_TEXT_PACK_ARRANGER = 132;
pub const CDROM_CD_TEXT_PACK_MESSAGES = 133;
pub const CDROM_CD_TEXT_PACK_DISC_ID = 134;
pub const CDROM_CD_TEXT_PACK_GENRE = 135;
pub const CDROM_CD_TEXT_PACK_TOC_INFO = 136;
pub const CDROM_CD_TEXT_PACK_TOC_INFO2 = 137;
pub const CDROM_CD_TEXT_PACK_UPC_EAN = 142;
pub const CDROM_CD_TEXT_PACK_SIZE_INFO = 143;
pub const CDROM_DISK_AUDIO_TRACK = 1;
pub const CDROM_DISK_DATA_TRACK = 2;
pub const IOCTL_CDROM_SUB_Q_CHANNEL = 0;
pub const IOCTL_CDROM_CURRENT_POSITION = 1;
pub const IOCTL_CDROM_MEDIA_CATALOG = 2;
pub const IOCTL_CDROM_TRACK_ISRC = 3;
pub const AUDIO_STATUS_NOT_SUPPORTED = 0;
pub const AUDIO_STATUS_IN_PROGRESS = 17;
pub const AUDIO_STATUS_PAUSED = 18;
pub const AUDIO_STATUS_PLAY_COMPLETE = 19;
pub const AUDIO_STATUS_PLAY_ERROR = 20;
pub const AUDIO_STATUS_NO_STATUS = 21;
pub const ADR_NO_MODE_INFORMATION = 0;
pub const ADR_ENCODES_CURRENT_POSITION = 1;
pub const ADR_ENCODES_MEDIA_CATALOG = 2;
pub const ADR_ENCODES_ISRC = 3;
pub const AUDIO_WITH_PREEMPHASIS = 1;
pub const DIGITAL_COPY_PERMITTED = 2;
pub const AUDIO_DATA_TRACK = 4;
pub const TWO_FOUR_CHANNEL_AUDIO = 8;
pub const CD_RAW_READ_C2_SIZE = 296;
pub const CD_RAW_READ_SUBCODE_SIZE = 96;
pub const CD_RAW_SECTOR_WITH_C2_SIZE = 2648;
pub const CD_RAW_SECTOR_WITH_SUBCODE_SIZE = 2448;
pub const CDROM_EXCLUSIVE_CALLER_LENGTH = 64;
pub const CDROM_LOCK_IGNORE_VOLUME = 1;
pub const CDROM_NO_MEDIA_NOTIFICATIONS = 2;
pub const CDROM_NOT_IN_EXCLUSIVE_MODE = 0;
pub const CDROM_IN_EXCLUSIVE_MODE = 1;
pub const YellowMode2 = 0;
pub const XAForm2 = 1;
pub const CDDA = 2;
pub const RawWithC2AndSubCode = 3;
pub const RawWithC2 = 4;
pub const RawWithSubCode = 5;
pub const MediaBlankTypeFull = 0;
pub const MediaBlankTypeMinimal = 1;
pub const MediaBlankTypeIncompleteTrack = 2;
pub const MediaBlankTypeUnreserveLastTrack = 3;
pub const MediaBlankTypeTrackTail = 4;
pub const MediaBlankTypeUncloseLastSession = 5;
pub const MediaBlankTypeEraseLastSession = 6;
pub const ExclusiveAccessQueryState = 0;
pub const ExclusiveAccessLockDevice = 1;
pub const ExclusiveAccessUnlockDevice = 2;
pub const CdromSetSpeed = 0;
pub const CdromSetStreaming = 1;
pub const CdromDefaultRotation = 0;
pub const CdromCAVRotation = 1;
pub const CdromStreamingDisable = 1;
pub const CdromStreamingEnableForReadOnly = 2;
pub const CdromStreamingEnableForWriteOnly = 3;
pub const CdromStreamingEnableForReadWrite = 4;
pub const SimpleOpcInfo = 1;
pub const CdromPerformanceRequest = 1;
pub const CdromWriteSpeedRequest = 2;
pub const CdromReadPerformance = 1;
pub const CdromWritePerformance = 2;
pub const CdromNominalPerformance = 1;
pub const CdromEntirePerformanceList = 2;
pub const CdromPerformanceExceptionsOnly = 3;
pub const Cdrom10Nominal20Exceptions = 1;

pub const aliases = struct {
    pub const TRACK_MODE_TYPE = i32;
    pub const MEDIA_BLANK_TYPE = i32;
    pub const EXCLUSIVE_ACCESS_REQUEST_TYPE = i32;
    pub const CDROM_SPEED_REQUEST = i32;
    pub const WRITE_ROTATION = i32;
    pub const STREAMING_CONTROL_REQUEST_TYPE = i32;
    pub const CDROM_OPC_INFO_TYPE = i32;
    pub const CDROM_PERFORMANCE_REQUEST_TYPE = i32;
    pub const CDROM_PERFORMANCE_TYPE = i32;
    pub const CDROM_PERFORMANCE_EXCEPTION_TYPE = i32;
    pub const CDROM_PERFORMANCE_TOLERANCE_TYPE = i32;
};
