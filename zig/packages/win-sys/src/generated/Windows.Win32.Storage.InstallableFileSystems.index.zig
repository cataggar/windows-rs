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
    .{ "FilterLoad", MethodRecord{ .library = "FLTLIB", .import = "FilterLoad", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "FilterUnload", MethodRecord{ .library = "FLTLIB", .import = "FilterUnload", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "FilterCreate", MethodRecord{ .library = "FLTLIB", .import = "FilterCreate", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\xbe\x01" } },
    .{ "FilterClose", MethodRecord{ .library = "FLTLIB", .import = "FilterClose", .signature = "\x00\x01\x11\x79\x11\xbe\x01" } },
    .{ "FilterInstanceCreate", MethodRecord{ .library = "FLTLIB", .import = "FilterInstanceCreate", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x11\x05\x0f\x11\xbe\x05" } },
    .{ "FilterInstanceClose", MethodRecord{ .library = "FLTLIB", .import = "FilterInstanceClose", .signature = "\x00\x01\x11\x79\x11\xbe\x05" } },
    .{ "FilterAttach", MethodRecord{ .library = "FLTLIB", .import = "FilterAttach", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x11\x05\x09\x11\x05" } },
    .{ "FilterAttachAtAltitude", MethodRecord{ .library = "FLTLIB", .import = "FilterAttachAtAltitude", .signature = "\x00\x06\x11\x79\x11\x05\x11\x05\x11\x05\x11\x05\x09\x11\x05" } },
    .{ "FilterDetach", MethodRecord{ .library = "FLTLIB", .import = "FilterDetach", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x11\x05" } },
    .{ "FilterFindFirst", MethodRecord{ .library = "FLTLIB", .import = "FilterFindFirst", .signature = "\x00\x05\x11\x79\x11\xbe\x09\x0f\x01\x09\x0f\x09\x0f\x11\x80\x85" } },
    .{ "FilterFindNext", MethodRecord{ .library = "FLTLIB", .import = "FilterFindNext", .signature = "\x00\x05\x11\x79\x11\x80\x85\x11\xbe\x09\x0f\x01\x09\x0f\x09" } },
    .{ "FilterFindClose", MethodRecord{ .library = "FLTLIB", .import = "FilterFindClose", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "FilterVolumeFindFirst", MethodRecord{ .library = "FLTLIB", .import = "FilterVolumeFindFirst", .signature = "\x00\x05\x11\x79\x11\xbe\x0d\x0f\x01\x09\x0f\x09\x0f\x11\x80\x85" } },
    .{ "FilterVolumeFindNext", MethodRecord{ .library = "FLTLIB", .import = "FilterVolumeFindNext", .signature = "\x00\x05\x11\x79\x11\x80\x85\x11\xbe\x0d\x0f\x01\x09\x0f\x09" } },
    .{ "FilterVolumeFindClose", MethodRecord{ .library = "FLTLIB", .import = "FilterVolumeFindClose", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "FilterInstanceFindFirst", MethodRecord{ .library = "FLTLIB", .import = "FilterInstanceFindFirst", .signature = "\x00\x06\x11\x79\x11\x05\x11\xbe\x11\x0f\x01\x09\x0f\x09\x0f\x11\x80\x85" } },
    .{ "FilterInstanceFindNext", MethodRecord{ .library = "FLTLIB", .import = "FilterInstanceFindNext", .signature = "\x00\x05\x11\x79\x11\x80\x85\x11\xbe\x11\x0f\x01\x09\x0f\x09" } },
    .{ "FilterInstanceFindClose", MethodRecord{ .library = "FLTLIB", .import = "FilterInstanceFindClose", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "FilterVolumeInstanceFindFirst", MethodRecord{ .library = "FLTLIB", .import = "FilterVolumeInstanceFindFirst", .signature = "\x00\x06\x11\x79\x11\x05\x11\xbe\x11\x0f\x01\x09\x0f\x09\x0f\x11\x80\x85" } },
    .{ "FilterVolumeInstanceFindNext", MethodRecord{ .library = "FLTLIB", .import = "FilterVolumeInstanceFindNext", .signature = "\x00\x05\x11\x79\x11\x80\x85\x11\xbe\x11\x0f\x01\x09\x0f\x09" } },
    .{ "FilterVolumeInstanceFindClose", MethodRecord{ .library = "FLTLIB", .import = "FilterVolumeInstanceFindClose", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "FilterGetInformation", MethodRecord{ .library = "FLTLIB", .import = "FilterGetInformation", .signature = "\x00\x05\x11\x79\x11\xbe\x01\x11\xbe\x09\x0f\x01\x09\x0f\x09" } },
    .{ "FilterInstanceGetInformation", MethodRecord{ .library = "FLTLIB", .import = "FilterInstanceGetInformation", .signature = "\x00\x05\x11\x79\x11\xbe\x05\x11\xbe\x11\x0f\x01\x09\x0f\x09" } },
    .{ "FilterConnectCommunicationPort", MethodRecord{ .library = "FLTLIB", .import = "FilterConnectCommunicationPort", .signature = "\x00\x06\x11\x79\x11\x05\x09\x0f\x01\x07\x0f\x11\x8b\xb5\x0f\x11\x80\x85" } },
    .{ "FilterSendMessage", MethodRecord{ .library = "FLTLIB", .import = "FilterSendMessage", .signature = "\x00\x06\x11\x79\x11\x80\x85\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "FilterGetMessage", MethodRecord{ .library = "FLTLIB", .import = "FilterGetMessage", .signature = "\x00\x04\x11\x79\x11\x80\x85\x0f\x11\xbe\x15\x09\x0f\x11\x8b\xed" } },
    .{ "FilterReplyMessage", MethodRecord{ .library = "FLTLIB", .import = "FilterReplyMessage", .signature = "\x00\x03\x11\x79\x11\x80\x85\x0f\x11\xbe\x19\x09" } },
    .{ "FilterGetDosName", MethodRecord{ .library = "FLTLIB", .import = "FilterGetDosName", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0xbed => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED" },
        0x3e01 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.InstallableFileSystems", .name = "HFILTER" },
        0x3e05 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.InstallableFileSystems", .name = "HFILTER_INSTANCE" },
        0x3e09 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.InstallableFileSystems", .name = "FILTER_INFORMATION_CLASS" },
        0x3e0d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.InstallableFileSystems", .name = "FILTER_VOLUME_INFORMATION_CLASS" },
        0x3e11 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.InstallableFileSystems", .name = "INSTANCE_INFORMATION_CLASS" },
        0x3e15 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.InstallableFileSystems", .name = "FILTER_MESSAGE_HEADER" },
        0x3e19 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.InstallableFileSystems", .name = "FILTER_REPLY_HEADER" },
        else => null,
    };
}

pub const FILTER_NAME_MAX_CHARS = 255;
pub const VOLUME_NAME_MAX_CHARS = 1024;
pub const INSTANCE_NAME_MAX_CHARS = 255;
pub const FLTFL_AGGREGATE_INFO_IS_MINIFILTER = 1;
pub const FLTFL_AGGREGATE_INFO_IS_LEGACYFILTER = 2;
pub const FLTFL_ASI_IS_MINIFILTER = 1;
pub const FLTFL_ASI_IS_LEGACYFILTER = 2;
pub const FLTFL_VSI_DETACHED_VOLUME = 1;
pub const FLTFL_IASI_IS_MINIFILTER = 1;
pub const FLTFL_IASI_IS_LEGACYFILTER = 2;
pub const FLTFL_IASIM_DETACHED_VOLUME = 1;
pub const FLTFL_IASIL_DETACHED_VOLUME = 1;
pub const FLT_PORT_FLAG_SYNC_HANDLE = 1;
pub const WNNC_NET_MSNET = 65536;
pub const WNNC_NET_SMB = 131072;
pub const WNNC_NET_NETWARE = 196608;
pub const WNNC_NET_VINES = 262144;
pub const WNNC_NET_10NET = 327680;
pub const WNNC_NET_LOCUS = 393216;
pub const WNNC_NET_SUN_PC_NFS = 458752;
pub const WNNC_NET_LANSTEP = 524288;
pub const WNNC_NET_9TILES = 589824;
pub const WNNC_NET_LANTASTIC = 655360;
pub const WNNC_NET_AS400 = 720896;
pub const WNNC_NET_FTP_NFS = 786432;
pub const WNNC_NET_PATHWORKS = 851968;
pub const WNNC_NET_LIFENET = 917504;
pub const WNNC_NET_POWERLAN = 983040;
pub const WNNC_NET_BWNFS = 1048576;
pub const WNNC_NET_COGENT = 1114112;
pub const WNNC_NET_FARALLON = 1179648;
pub const WNNC_NET_APPLETALK = 1245184;
pub const WNNC_NET_INTERGRAPH = 1310720;
pub const WNNC_NET_SYMFONET = 1376256;
pub const WNNC_NET_CLEARCASE = 1441792;
pub const WNNC_NET_FRONTIER = 1507328;
pub const WNNC_NET_BMC = 1572864;
pub const WNNC_NET_DCE = 1638400;
pub const WNNC_NET_AVID = 1703936;
pub const WNNC_NET_DOCUSPACE = 1769472;
pub const WNNC_NET_MANGOSOFT = 1835008;
pub const WNNC_NET_SERNET = 1900544;
pub const WNNC_NET_RIVERFRONT1 = 1966080;
pub const WNNC_NET_RIVERFRONT2 = 2031616;
pub const WNNC_NET_DECORB = 2097152;
pub const WNNC_NET_PROTSTOR = 2162688;
pub const WNNC_NET_FJ_REDIR = 2228224;
pub const WNNC_NET_DISTINCT = 2293760;
pub const WNNC_NET_TWINS = 2359296;
pub const WNNC_NET_RDR2SAMPLE = 2424832;
pub const WNNC_NET_CSC = 2490368;
pub const WNNC_NET_3IN1 = 2555904;
pub const WNNC_NET_EXTENDNET = 2686976;
pub const WNNC_NET_STAC = 2752512;
pub const WNNC_NET_FOXBAT = 2818048;
pub const WNNC_NET_YAHOO = 2883584;
pub const WNNC_NET_EXIFS = 2949120;
pub const WNNC_NET_DAV = 3014656;
pub const WNNC_NET_KNOWARE = 3080192;
pub const WNNC_NET_OBJECT_DIRE = 3145728;
pub const WNNC_NET_MASFAX = 3211264;
pub const WNNC_NET_HOB_NFS = 3276800;
pub const WNNC_NET_SHIVA = 3342336;
pub const WNNC_NET_IBMAL = 3407872;
pub const WNNC_NET_LOCK = 3473408;
pub const WNNC_NET_TERMSRV = 3538944;
pub const WNNC_NET_SRT = 3604480;
pub const WNNC_NET_QUINCY = 3670016;
pub const WNNC_NET_OPENAFS = 3735552;
pub const WNNC_NET_AVID1 = 3801088;
pub const WNNC_NET_DFS = 3866624;
pub const WNNC_NET_KWNP = 3932160;
pub const WNNC_NET_ZENWORKS = 3997696;
pub const WNNC_NET_DRIVEONWEB = 4063232;
pub const WNNC_NET_VMWARE = 4128768;
pub const WNNC_NET_RSFX = 4194304;
pub const WNNC_NET_MFILES = 4259840;
pub const WNNC_NET_MS_NFS = 4325376;
pub const WNNC_NET_GOOGLE = 4390912;
pub const WNNC_NET_NDFS = 4456448;
pub const WNNC_NET_DOCUSHARE = 4521984;
pub const WNNC_NET_AURISTOR_FS = 4587520;
pub const WNNC_NET_SECUREAGENT = 4653056;
pub const WNNC_NET_9P = 4718592;
pub const WNNC_CRED_MANAGER = 4294901760;
pub const WNNC_NET_LANMAN = 131072;
pub const FLT_FSTYPE_UNKNOWN = 0;
pub const FLT_FSTYPE_RAW = 1;
pub const FLT_FSTYPE_NTFS = 2;
pub const FLT_FSTYPE_FAT = 3;
pub const FLT_FSTYPE_CDFS = 4;
pub const FLT_FSTYPE_UDFS = 5;
pub const FLT_FSTYPE_LANMAN = 6;
pub const FLT_FSTYPE_WEBDAV = 7;
pub const FLT_FSTYPE_RDPDR = 8;
pub const FLT_FSTYPE_NFS = 9;
pub const FLT_FSTYPE_MS_NETWARE = 10;
pub const FLT_FSTYPE_NETWARE = 11;
pub const FLT_FSTYPE_BSUDF = 12;
pub const FLT_FSTYPE_MUP = 13;
pub const FLT_FSTYPE_RSFX = 14;
pub const FLT_FSTYPE_ROXIO_UDF1 = 15;
pub const FLT_FSTYPE_ROXIO_UDF2 = 16;
pub const FLT_FSTYPE_ROXIO_UDF3 = 17;
pub const FLT_FSTYPE_TACIT = 18;
pub const FLT_FSTYPE_FS_REC = 19;
pub const FLT_FSTYPE_INCD = 20;
pub const FLT_FSTYPE_INCD_FAT = 21;
pub const FLT_FSTYPE_EXFAT = 22;
pub const FLT_FSTYPE_PSFS = 23;
pub const FLT_FSTYPE_GPFS = 24;
pub const FLT_FSTYPE_NPFS = 25;
pub const FLT_FSTYPE_MSFS = 26;
pub const FLT_FSTYPE_CSVFS = 27;
pub const FLT_FSTYPE_REFS = 28;
pub const FLT_FSTYPE_OPENAFS = 29;
pub const FLT_FSTYPE_CIMFS = 30;
pub const FilterFullInformation = 0;
pub const FilterAggregateBasicInformation = 1;
pub const FilterAggregateStandardInformation = 2;
pub const FilterVolumeBasicInformation = 0;
pub const FilterVolumeStandardInformation = 1;
pub const InstanceBasicInformation = 0;
pub const InstancePartialInformation = 1;
pub const InstanceFullInformation = 2;
pub const InstanceAggregateStandardInformation = 3;

pub const aliases = struct {
    pub const FLT_FILESYSTEM_TYPE = i32;
    pub const FILTER_INFORMATION_CLASS = i32;
    pub const FILTER_VOLUME_INFORMATION_CLASS = i32;
    pub const INSTANCE_INFORMATION_CLASS = i32;
};
