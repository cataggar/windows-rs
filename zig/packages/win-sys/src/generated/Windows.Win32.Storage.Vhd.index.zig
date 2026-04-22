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
    .{ "OpenVirtualDisk", MethodRecord{ .library = "VirtDisk", .import = "OpenVirtualDisk", .signature = "\x00\x06\x11\x81\x01\x0f\x11\xbe\xf9\x11\x05\x11\xbe\xfd\x11\xbf\x01\x0f\x11\xbf\x05\x0f\x11\x80\x85" } },
    .{ "CreateVirtualDisk", MethodRecord{ .library = "VirtDisk", .import = "CreateVirtualDisk", .signature = "\x00\x09\x11\x81\x01\x0f\x11\xbe\xf9\x11\x05\x11\xbe\xfd\x11\x82\xad\x11\xbf\x09\x09\x0f\x11\xbf\x0d\x0f\x11\x8b\xed\x0f\x11\x80\x85" } },
    .{ "AttachVirtualDisk", MethodRecord{ .library = "VirtDisk", .import = "AttachVirtualDisk", .signature = "\x00\x06\x11\x81\x01\x11\x80\x85\x11\x82\xad\x11\xbf\x11\x09\x0f\x11\xbf\x15\x0f\x11\x8b\xed" } },
    .{ "DetachVirtualDisk", MethodRecord{ .library = "VirtDisk", .import = "DetachVirtualDisk", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x11\xbf\x19\x09" } },
    .{ "GetVirtualDiskPhysicalPath", MethodRecord{ .library = "VirtDisk", .import = "GetVirtualDiskPhysicalPath", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x0f\x09\x11\x05" } },
    .{ "GetAllAttachedVirtualDiskPhysicalPaths", MethodRecord{ .library = "VirtDisk", .import = "GetAllAttachedVirtualDiskPhysicalPaths", .signature = "\x00\x02\x11\x81\x01\x0f\x09\x11\x05" } },
    .{ "GetStorageDependencyInformation", MethodRecord{ .library = "VirtDisk", .import = "GetStorageDependencyInformation", .signature = "\x00\x05\x11\x81\x01\x11\x80\x85\x11\xbf\x1d\x09\x0f\x11\xbf\x21\x0f\x09" } },
    .{ "GetVirtualDiskInformation", MethodRecord{ .library = "VirtDisk", .import = "GetVirtualDiskInformation", .signature = "\x00\x04\x11\x81\x01\x11\x80\x85\x0f\x09\x0f\x11\xbf\x25\x0f\x09" } },
    .{ "SetVirtualDiskInformation", MethodRecord{ .library = "VirtDisk", .import = "SetVirtualDiskInformation", .signature = "\x00\x02\x11\x81\x01\x11\x80\x85\x0f\x11\xbf\x29" } },
    .{ "EnumerateVirtualDiskMetadata", MethodRecord{ .library = "VirtDisk", .import = "EnumerateVirtualDiskMetadata", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x0f\x09\x0f\x11\x0d" } },
    .{ "GetVirtualDiskMetadata", MethodRecord{ .library = "VirtDisk", .import = "GetVirtualDiskMetadata", .signature = "\x00\x04\x11\x81\x01\x11\x80\x85\x0f\x11\x0d\x0f\x09\x0f\x01" } },
    .{ "SetVirtualDiskMetadata", MethodRecord{ .library = "VirtDisk", .import = "SetVirtualDiskMetadata", .signature = "\x00\x04\x11\x81\x01\x11\x80\x85\x0f\x11\x0d\x09\x0f\x01" } },
    .{ "DeleteVirtualDiskMetadata", MethodRecord{ .library = "VirtDisk", .import = "DeleteVirtualDiskMetadata", .signature = "\x00\x02\x11\x81\x01\x11\x80\x85\x0f\x11\x0d" } },
    .{ "GetVirtualDiskOperationProgress", MethodRecord{ .library = "VirtDisk", .import = "GetVirtualDiskOperationProgress", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x0f\x11\x8b\xed\x0f\x11\xbf\x2d" } },
    .{ "CompactVirtualDisk", MethodRecord{ .library = "VirtDisk", .import = "CompactVirtualDisk", .signature = "\x00\x04\x11\x81\x01\x11\x80\x85\x11\xbf\x31\x0f\x11\xbf\x35\x0f\x11\x8b\xed" } },
    .{ "MergeVirtualDisk", MethodRecord{ .library = "VirtDisk", .import = "MergeVirtualDisk", .signature = "\x00\x04\x11\x81\x01\x11\x80\x85\x11\xbf\x39\x0f\x11\xbf\x3d\x0f\x11\x8b\xed" } },
    .{ "ExpandVirtualDisk", MethodRecord{ .library = "VirtDisk", .import = "ExpandVirtualDisk", .signature = "\x00\x04\x11\x81\x01\x11\x80\x85\x11\xbf\x41\x0f\x11\xbf\x45\x0f\x11\x8b\xed" } },
    .{ "ResizeVirtualDisk", MethodRecord{ .library = "VirtDisk", .import = "ResizeVirtualDisk", .signature = "\x00\x04\x11\x81\x01\x11\x80\x85\x11\xbf\x49\x0f\x11\xbf\x4d\x0f\x11\x8b\xed" } },
    .{ "MirrorVirtualDisk", MethodRecord{ .library = "VirtDisk", .import = "MirrorVirtualDisk", .signature = "\x00\x04\x11\x81\x01\x11\x80\x85\x11\xbf\x51\x0f\x11\xbf\x55\x0f\x11\x8b\xed" } },
    .{ "BreakMirrorVirtualDisk", MethodRecord{ .library = "VirtDisk", .import = "BreakMirrorVirtualDisk", .signature = "\x00\x01\x11\x81\x01\x11\x80\x85" } },
    .{ "AddVirtualDiskParent", MethodRecord{ .library = "VirtDisk", .import = "AddVirtualDiskParent", .signature = "\x00\x02\x11\x81\x01\x11\x80\x85\x11\x05" } },
    .{ "QueryChangesVirtualDisk", MethodRecord{ .library = "VirtDisk", .import = "QueryChangesVirtualDisk", .signature = "\x00\x08\x11\x81\x01\x11\x80\x85\x11\x05\x0b\x0b\x11\xbf\x59\x0f\x11\xbf\x5d\x0f\x09\x0f\x0b" } },
    .{ "TakeSnapshotVhdSet", MethodRecord{ .library = "VirtDisk", .import = "TakeSnapshotVhdSet", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x0f\x11\xbf\x61\x11\xbf\x65" } },
    .{ "DeleteSnapshotVhdSet", MethodRecord{ .library = "VirtDisk", .import = "DeleteSnapshotVhdSet", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x0f\x11\xbf\x69\x11\xbf\x6d" } },
    .{ "ModifyVhdSet", MethodRecord{ .library = "VirtDisk", .import = "ModifyVhdSet", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x0f\x11\xbf\x71\x11\xbf\x75" } },
    .{ "ApplySnapshotVhdSet", MethodRecord{ .library = "VirtDisk", .import = "ApplySnapshotVhdSet", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x0f\x11\xbf\x79\x11\xbf\x7d" } },
    .{ "RawSCSIVirtualDisk", MethodRecord{ .library = "VirtDisk", .import = "RawSCSIVirtualDisk", .signature = "\x00\x04\x11\x81\x01\x11\x80\x85\x0f\x11\xbf\x81\x11\xbf\x85\x0f\x11\xbf\x89" } },
    .{ "ForkVirtualDisk", MethodRecord{ .library = "VirtDisk", .import = "ForkVirtualDisk", .signature = "\x00\x04\x11\x81\x01\x11\x80\x85\x11\xbf\x8d\x0f\x11\xbf\x91\x0f\x11\x8b\xed" } },
    .{ "CompleteForkVirtualDisk", MethodRecord{ .library = "VirtDisk", .import = "CompleteForkVirtualDisk", .signature = "\x00\x01\x11\x81\x01\x11\x80\x85" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0xbed => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED" },
        0x3ef9 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "VIRTUAL_STORAGE_TYPE" },
        0x3efd => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "VIRTUAL_DISK_ACCESS_MASK" },
        0x3f01 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "OPEN_VIRTUAL_DISK_FLAG" },
        0x3f05 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "OPEN_VIRTUAL_DISK_PARAMETERS" },
        0x3f09 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "CREATE_VIRTUAL_DISK_FLAG" },
        0x3f0d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "CREATE_VIRTUAL_DISK_PARAMETERS" },
        0x3f11 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "ATTACH_VIRTUAL_DISK_FLAG" },
        0x3f15 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "ATTACH_VIRTUAL_DISK_PARAMETERS" },
        0x3f19 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "DETACH_VIRTUAL_DISK_FLAG" },
        0x3f1d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "GET_STORAGE_DEPENDENCY_FLAG" },
        0x3f21 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "STORAGE_DEPENDENCY_INFO" },
        0x3f25 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "GET_VIRTUAL_DISK_INFO" },
        0x3f29 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "SET_VIRTUAL_DISK_INFO" },
        0x3f2d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "VIRTUAL_DISK_PROGRESS" },
        0x3f31 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "COMPACT_VIRTUAL_DISK_FLAG" },
        0x3f35 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "COMPACT_VIRTUAL_DISK_PARAMETERS" },
        0x3f39 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "MERGE_VIRTUAL_DISK_FLAG" },
        0x3f3d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "MERGE_VIRTUAL_DISK_PARAMETERS" },
        0x3f41 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "EXPAND_VIRTUAL_DISK_FLAG" },
        0x3f45 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "EXPAND_VIRTUAL_DISK_PARAMETERS" },
        0x3f49 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "RESIZE_VIRTUAL_DISK_FLAG" },
        0x3f4d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "RESIZE_VIRTUAL_DISK_PARAMETERS" },
        0x3f51 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "MIRROR_VIRTUAL_DISK_FLAG" },
        0x3f55 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "MIRROR_VIRTUAL_DISK_PARAMETERS" },
        0x3f59 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "QUERY_CHANGES_VIRTUAL_DISK_FLAG" },
        0x3f5d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "QUERY_CHANGES_VIRTUAL_DISK_RANGE" },
        0x3f61 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "TAKE_SNAPSHOT_VHDSET_PARAMETERS" },
        0x3f65 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "TAKE_SNAPSHOT_VHDSET_FLAG" },
        0x3f69 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "DELETE_SNAPSHOT_VHDSET_PARAMETERS" },
        0x3f6d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "DELETE_SNAPSHOT_VHDSET_FLAG" },
        0x3f71 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "MODIFY_VHDSET_PARAMETERS" },
        0x3f75 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "MODIFY_VHDSET_FLAG" },
        0x3f79 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "APPLY_SNAPSHOT_VHDSET_PARAMETERS" },
        0x3f7d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "APPLY_SNAPSHOT_VHDSET_FLAG" },
        0x3f81 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "RAW_SCSI_VIRTUAL_DISK_PARAMETERS" },
        0x3f85 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "RAW_SCSI_VIRTUAL_DISK_FLAG" },
        0x3f89 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "RAW_SCSI_VIRTUAL_DISK_RESPONSE" },
        0x3f8d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "FORK_VIRTUAL_DISK_FLAG" },
        0x3f91 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Vhd", .name = "FORK_VIRTUAL_DISK_PARAMETERS" },
        else => null,
    };
}

pub const VIRTUAL_STORAGE_TYPE_DEVICE_UNKNOWN = 0;
pub const VIRTUAL_STORAGE_TYPE_DEVICE_ISO = 1;
pub const VIRTUAL_STORAGE_TYPE_DEVICE_VHD = 2;
pub const VIRTUAL_STORAGE_TYPE_DEVICE_VHDX = 3;
pub const VIRTUAL_STORAGE_TYPE_DEVICE_VHDSET = 4;
pub const OPEN_VIRTUAL_DISK_RW_DEPTH_DEFAULT = 1;
pub const CREATE_VIRTUAL_DISK_PARAMETERS_DEFAULT_BLOCK_SIZE = 0;
pub const CREATE_VIRTUAL_DISK_PARAMETERS_DEFAULT_SECTOR_SIZE = 0;
pub const VIRTUAL_DISK_MAXIMUM_CHANGE_TRACKING_ID_LENGTH = 256;
pub const MERGE_VIRTUAL_DISK_DEFAULT_MERGE_DEPTH = 1;
pub const OPEN_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0;
pub const OPEN_VIRTUAL_DISK_VERSION_1 = 1;
pub const OPEN_VIRTUAL_DISK_VERSION_2 = 2;
pub const OPEN_VIRTUAL_DISK_VERSION_3 = 3;
pub const VIRTUAL_DISK_ACCESS_NONE = 0;
pub const VIRTUAL_DISK_ACCESS_ATTACH_RO = 65536;
pub const VIRTUAL_DISK_ACCESS_ATTACH_RW = 131072;
pub const VIRTUAL_DISK_ACCESS_DETACH = 262144;
pub const VIRTUAL_DISK_ACCESS_GET_INFO = 524288;
pub const VIRTUAL_DISK_ACCESS_CREATE = 1048576;
pub const VIRTUAL_DISK_ACCESS_METAOPS = 2097152;
pub const VIRTUAL_DISK_ACCESS_READ = 851968;
pub const VIRTUAL_DISK_ACCESS_ALL = 4128768;
pub const VIRTUAL_DISK_ACCESS_WRITABLE = 3276800;
pub const OPEN_VIRTUAL_DISK_FLAG_NONE = 0;
pub const OPEN_VIRTUAL_DISK_FLAG_NO_PARENTS = 1;
pub const OPEN_VIRTUAL_DISK_FLAG_BLANK_FILE = 2;
pub const OPEN_VIRTUAL_DISK_FLAG_BOOT_DRIVE = 4;
pub const OPEN_VIRTUAL_DISK_FLAG_CACHED_IO = 8;
pub const OPEN_VIRTUAL_DISK_FLAG_CUSTOM_DIFF_CHAIN = 16;
pub const OPEN_VIRTUAL_DISK_FLAG_PARENT_CACHED_IO = 32;
pub const OPEN_VIRTUAL_DISK_FLAG_VHDSET_FILE_ONLY = 64;
pub const OPEN_VIRTUAL_DISK_FLAG_IGNORE_RELATIVE_PARENT_LOCATOR = 128;
pub const OPEN_VIRTUAL_DISK_FLAG_NO_WRITE_HARDENING = 256;
pub const OPEN_VIRTUAL_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES = 512;
pub const OPEN_VIRTUAL_DISK_FLAG_SUPPORT_SPARSE_FILES_ANY_FS = 1024;
pub const OPEN_VIRTUAL_DISK_FLAG_SUPPORT_ENCRYPTED_FILES = 2048;
pub const CREATE_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0;
pub const CREATE_VIRTUAL_DISK_VERSION_1 = 1;
pub const CREATE_VIRTUAL_DISK_VERSION_2 = 2;
pub const CREATE_VIRTUAL_DISK_VERSION_3 = 3;
pub const CREATE_VIRTUAL_DISK_VERSION_4 = 4;
pub const CREATE_VIRTUAL_DISK_FLAG_NONE = 0;
pub const CREATE_VIRTUAL_DISK_FLAG_FULL_PHYSICAL_ALLOCATION = 1;
pub const CREATE_VIRTUAL_DISK_FLAG_PREVENT_WRITES_TO_SOURCE_DISK = 2;
pub const CREATE_VIRTUAL_DISK_FLAG_DO_NOT_COPY_METADATA_FROM_PARENT = 4;
pub const CREATE_VIRTUAL_DISK_FLAG_CREATE_BACKING_STORAGE = 8;
pub const CREATE_VIRTUAL_DISK_FLAG_USE_CHANGE_TRACKING_SOURCE_LIMIT = 16;
pub const CREATE_VIRTUAL_DISK_FLAG_PRESERVE_PARENT_CHANGE_TRACKING_STATE = 32;
pub const CREATE_VIRTUAL_DISK_FLAG_VHD_SET_USE_ORIGINAL_BACKING_STORAGE = 64;
pub const CREATE_VIRTUAL_DISK_FLAG_SPARSE_FILE = 128;
pub const CREATE_VIRTUAL_DISK_FLAG_PMEM_COMPATIBLE = 256;
pub const CREATE_VIRTUAL_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES = 512;
pub const CREATE_VIRTUAL_DISK_FLAG_SUPPORT_SPARSE_FILES_ANY_FS = 1024;
pub const ATTACH_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0;
pub const ATTACH_VIRTUAL_DISK_VERSION_1 = 1;
pub const ATTACH_VIRTUAL_DISK_VERSION_2 = 2;
pub const ATTACH_VIRTUAL_DISK_FLAG_NONE = 0;
pub const ATTACH_VIRTUAL_DISK_FLAG_READ_ONLY = 1;
pub const ATTACH_VIRTUAL_DISK_FLAG_NO_DRIVE_LETTER = 2;
pub const ATTACH_VIRTUAL_DISK_FLAG_PERMANENT_LIFETIME = 4;
pub const ATTACH_VIRTUAL_DISK_FLAG_NO_LOCAL_HOST = 8;
pub const ATTACH_VIRTUAL_DISK_FLAG_NO_SECURITY_DESCRIPTOR = 16;
pub const ATTACH_VIRTUAL_DISK_FLAG_BYPASS_DEFAULT_ENCRYPTION_POLICY = 32;
pub const ATTACH_VIRTUAL_DISK_FLAG_NON_PNP = 64;
pub const ATTACH_VIRTUAL_DISK_FLAG_RESTRICTED_RANGE = 128;
pub const ATTACH_VIRTUAL_DISK_FLAG_SINGLE_PARTITION = 256;
pub const ATTACH_VIRTUAL_DISK_FLAG_REGISTER_VOLUME = 512;
pub const ATTACH_VIRTUAL_DISK_FLAG_AT_BOOT = 1024;
pub const DETACH_VIRTUAL_DISK_FLAG_NONE = 0;
pub const DEPENDENT_DISK_FLAG_NONE = 0;
pub const DEPENDENT_DISK_FLAG_MULT_BACKING_FILES = 1;
pub const DEPENDENT_DISK_FLAG_FULLY_ALLOCATED = 2;
pub const DEPENDENT_DISK_FLAG_READ_ONLY = 4;
pub const DEPENDENT_DISK_FLAG_REMOTE = 8;
pub const DEPENDENT_DISK_FLAG_SYSTEM_VOLUME = 16;
pub const DEPENDENT_DISK_FLAG_SYSTEM_VOLUME_PARENT = 32;
pub const DEPENDENT_DISK_FLAG_REMOVABLE = 64;
pub const DEPENDENT_DISK_FLAG_NO_DRIVE_LETTER = 128;
pub const DEPENDENT_DISK_FLAG_PARENT = 256;
pub const DEPENDENT_DISK_FLAG_NO_HOST_DISK = 512;
pub const DEPENDENT_DISK_FLAG_PERMANENT_LIFETIME = 1024;
pub const DEPENDENT_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES = 2048;
pub const DEPENDENT_DISK_FLAG_ALWAYS_ALLOW_SPARSE = 4096;
pub const DEPENDENT_DISK_FLAG_SUPPORT_ENCRYPTED_FILES = 8192;
pub const STORAGE_DEPENDENCY_INFO_VERSION_UNSPECIFIED = 0;
pub const STORAGE_DEPENDENCY_INFO_VERSION_1 = 1;
pub const STORAGE_DEPENDENCY_INFO_VERSION_2 = 2;
pub const GET_STORAGE_DEPENDENCY_FLAG_NONE = 0;
pub const GET_STORAGE_DEPENDENCY_FLAG_HOST_VOLUMES = 1;
pub const GET_STORAGE_DEPENDENCY_FLAG_DISK_HANDLE = 2;
pub const GET_VIRTUAL_DISK_INFO_UNSPECIFIED = 0;
pub const GET_VIRTUAL_DISK_INFO_SIZE = 1;
pub const GET_VIRTUAL_DISK_INFO_IDENTIFIER = 2;
pub const GET_VIRTUAL_DISK_INFO_PARENT_LOCATION = 3;
pub const GET_VIRTUAL_DISK_INFO_PARENT_IDENTIFIER = 4;
pub const GET_VIRTUAL_DISK_INFO_PARENT_TIMESTAMP = 5;
pub const GET_VIRTUAL_DISK_INFO_VIRTUAL_STORAGE_TYPE = 6;
pub const GET_VIRTUAL_DISK_INFO_PROVIDER_SUBTYPE = 7;
pub const GET_VIRTUAL_DISK_INFO_IS_4K_ALIGNED = 8;
pub const GET_VIRTUAL_DISK_INFO_PHYSICAL_DISK = 9;
pub const GET_VIRTUAL_DISK_INFO_VHD_PHYSICAL_SECTOR_SIZE = 10;
pub const GET_VIRTUAL_DISK_INFO_SMALLEST_SAFE_VIRTUAL_SIZE = 11;
pub const GET_VIRTUAL_DISK_INFO_FRAGMENTATION = 12;
pub const GET_VIRTUAL_DISK_INFO_IS_LOADED = 13;
pub const GET_VIRTUAL_DISK_INFO_VIRTUAL_DISK_ID = 14;
pub const GET_VIRTUAL_DISK_INFO_CHANGE_TRACKING_STATE = 15;
pub const SET_VIRTUAL_DISK_INFO_UNSPECIFIED = 0;
pub const SET_VIRTUAL_DISK_INFO_PARENT_PATH = 1;
pub const SET_VIRTUAL_DISK_INFO_IDENTIFIER = 2;
pub const SET_VIRTUAL_DISK_INFO_PARENT_PATH_WITH_DEPTH = 3;
pub const SET_VIRTUAL_DISK_INFO_PHYSICAL_SECTOR_SIZE = 4;
pub const SET_VIRTUAL_DISK_INFO_VIRTUAL_DISK_ID = 5;
pub const SET_VIRTUAL_DISK_INFO_CHANGE_TRACKING_STATE = 6;
pub const SET_VIRTUAL_DISK_INFO_PARENT_LOCATOR = 7;
pub const COMPACT_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0;
pub const COMPACT_VIRTUAL_DISK_VERSION_1 = 1;
pub const COMPACT_VIRTUAL_DISK_FLAG_NONE = 0;
pub const COMPACT_VIRTUAL_DISK_FLAG_NO_ZERO_SCAN = 1;
pub const COMPACT_VIRTUAL_DISK_FLAG_NO_BLOCK_MOVES = 2;
pub const MERGE_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0;
pub const MERGE_VIRTUAL_DISK_VERSION_1 = 1;
pub const MERGE_VIRTUAL_DISK_VERSION_2 = 2;
pub const MERGE_VIRTUAL_DISK_FLAG_NONE = 0;
pub const EXPAND_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0;
pub const EXPAND_VIRTUAL_DISK_VERSION_1 = 1;
pub const EXPAND_VIRTUAL_DISK_FLAG_NONE = 0;
pub const EXPAND_VIRTUAL_DISK_FLAG_NOTIFY_CHANGE = 1;
pub const RESIZE_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0;
pub const RESIZE_VIRTUAL_DISK_VERSION_1 = 1;
pub const RESIZE_VIRTUAL_DISK_FLAG_NONE = 0;
pub const RESIZE_VIRTUAL_DISK_FLAG_ALLOW_UNSAFE_VIRTUAL_SIZE = 1;
pub const RESIZE_VIRTUAL_DISK_FLAG_RESIZE_TO_SMALLEST_SAFE_VIRTUAL_SIZE = 2;
pub const MIRROR_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0;
pub const MIRROR_VIRTUAL_DISK_VERSION_1 = 1;
pub const MIRROR_VIRTUAL_DISK_FLAG_NONE = 0;
pub const MIRROR_VIRTUAL_DISK_FLAG_EXISTING_FILE = 1;
pub const MIRROR_VIRTUAL_DISK_FLAG_SKIP_MIRROR_ACTIVATION = 2;
pub const MIRROR_VIRTUAL_DISK_FLAG_ENABLE_SMB_COMPRESSION = 4;
pub const MIRROR_VIRTUAL_DISK_FLAG_IS_LIVE_MIGRATION = 8;
pub const QUERY_CHANGES_VIRTUAL_DISK_FLAG_NONE = 0;
pub const TAKE_SNAPSHOT_VHDSET_FLAG_NONE = 0;
pub const TAKE_SNAPSHOT_VHDSET_FLAG_WRITEABLE = 1;
pub const TAKE_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED = 0;
pub const TAKE_SNAPSHOT_VHDSET_VERSION_1 = 1;
pub const DELETE_SNAPSHOT_VHDSET_FLAG_NONE = 0;
pub const DELETE_SNAPSHOT_VHDSET_FLAG_PERSIST_RCT = 1;
pub const DELETE_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED = 0;
pub const DELETE_SNAPSHOT_VHDSET_VERSION_1 = 1;
pub const MODIFY_VHDSET_UNSPECIFIED = 0;
pub const MODIFY_VHDSET_SNAPSHOT_PATH = 1;
pub const MODIFY_VHDSET_REMOVE_SNAPSHOT = 2;
pub const MODIFY_VHDSET_DEFAULT_SNAPSHOT_PATH = 3;
pub const MODIFY_VHDSET_FLAG_NONE = 0;
pub const MODIFY_VHDSET_FLAG_WRITEABLE_SNAPSHOT = 1;
pub const APPLY_SNAPSHOT_VHDSET_FLAG_NONE = 0;
pub const APPLY_SNAPSHOT_VHDSET_FLAG_WRITEABLE = 1;
pub const APPLY_SNAPSHOT_VHDSET_VERSION_UNSPECIFIED = 0;
pub const APPLY_SNAPSHOT_VHDSET_VERSION_1 = 1;
pub const RAW_SCSI_VIRTUAL_DISK_FLAG_NONE = 0;
pub const RAW_SCSI_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0;
pub const RAW_SCSI_VIRTUAL_DISK_VERSION_1 = 1;
pub const FORK_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0;
pub const FORK_VIRTUAL_DISK_VERSION_1 = 1;
pub const FORK_VIRTUAL_DISK_FLAG_NONE = 0;
pub const FORK_VIRTUAL_DISK_FLAG_EXISTING_FILE = 1;

pub const aliases = struct {
    pub const OPEN_VIRTUAL_DISK_VERSION = i32;
    pub const VIRTUAL_DISK_ACCESS_MASK = i32;
    pub const OPEN_VIRTUAL_DISK_FLAG = i32;
    pub const CREATE_VIRTUAL_DISK_VERSION = i32;
    pub const CREATE_VIRTUAL_DISK_FLAG = i32;
    pub const ATTACH_VIRTUAL_DISK_VERSION = i32;
    pub const ATTACH_VIRTUAL_DISK_FLAG = i32;
    pub const DETACH_VIRTUAL_DISK_FLAG = i32;
    pub const DEPENDENT_DISK_FLAG = i32;
    pub const STORAGE_DEPENDENCY_INFO_VERSION = i32;
    pub const GET_STORAGE_DEPENDENCY_FLAG = i32;
    pub const GET_VIRTUAL_DISK_INFO_VERSION = i32;
    pub const SET_VIRTUAL_DISK_INFO_VERSION = i32;
    pub const COMPACT_VIRTUAL_DISK_VERSION = i32;
    pub const COMPACT_VIRTUAL_DISK_FLAG = i32;
    pub const MERGE_VIRTUAL_DISK_VERSION = i32;
    pub const MERGE_VIRTUAL_DISK_FLAG = i32;
    pub const EXPAND_VIRTUAL_DISK_VERSION = i32;
    pub const EXPAND_VIRTUAL_DISK_FLAG = i32;
    pub const RESIZE_VIRTUAL_DISK_VERSION = i32;
    pub const RESIZE_VIRTUAL_DISK_FLAG = i32;
    pub const MIRROR_VIRTUAL_DISK_VERSION = i32;
    pub const MIRROR_VIRTUAL_DISK_FLAG = i32;
    pub const QUERY_CHANGES_VIRTUAL_DISK_FLAG = i32;
    pub const TAKE_SNAPSHOT_VHDSET_FLAG = i32;
    pub const TAKE_SNAPSHOT_VHDSET_VERSION = i32;
    pub const DELETE_SNAPSHOT_VHDSET_FLAG = i32;
    pub const DELETE_SNAPSHOT_VHDSET_VERSION = i32;
    pub const MODIFY_VHDSET_VERSION = i32;
    pub const MODIFY_VHDSET_FLAG = i32;
    pub const APPLY_SNAPSHOT_VHDSET_FLAG = i32;
    pub const APPLY_SNAPSHOT_VHDSET_VERSION = i32;
    pub const RAW_SCSI_VIRTUAL_DISK_FLAG = i32;
    pub const RAW_SCSI_VIRTUAL_DISK_VERSION = i32;
    pub const FORK_VIRTUAL_DISK_VERSION = i32;
    pub const FORK_VIRTUAL_DISK_FLAG = i32;
};
