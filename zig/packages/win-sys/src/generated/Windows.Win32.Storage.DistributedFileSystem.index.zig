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
    .{ "NetDfsAdd", MethodRecord{ .library = "NETAPI32", .import = "NetDfsAdd", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "NetDfsAddStdRoot", MethodRecord{ .library = "NETAPI32", .import = "NetDfsAddStdRoot", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "NetDfsRemoveStdRoot", MethodRecord{ .library = "NETAPI32", .import = "NetDfsRemoveStdRoot", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "NetDfsAddFtRoot", MethodRecord{ .library = "NETAPI32", .import = "NetDfsAddFtRoot", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "NetDfsRemoveFtRoot", MethodRecord{ .library = "NETAPI32", .import = "NetDfsRemoveFtRoot", .signature = "\x00\x04\x09\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "NetDfsRemoveFtRootForced", MethodRecord{ .library = "NETAPI32", .import = "NetDfsRemoveFtRootForced", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "NetDfsRemove", MethodRecord{ .library = "NETAPI32", .import = "NetDfsRemove", .signature = "\x00\x03\x09\x11\x05\x11\x05\x11\x05" } },
    .{ "NetDfsEnum", MethodRecord{ .library = "NETAPI32", .import = "NetDfsEnum", .signature = "\x00\x06\x09\x11\x05\x09\x09\x0f\x0f\x05\x0f\x09\x0f\x09" } },
    .{ "NetDfsGetInfo", MethodRecord{ .library = "NETAPI32", .import = "NetDfsGetInfo", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x09\x0f\x0f\x05" } },
    .{ "NetDfsSetInfo", MethodRecord{ .library = "NETAPI32", .import = "NetDfsSetInfo", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x09\x0f\x05" } },
    .{ "NetDfsGetClientInfo", MethodRecord{ .library = "NETAPI32", .import = "NetDfsGetClientInfo", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x09\x0f\x0f\x05" } },
    .{ "NetDfsSetClientInfo", MethodRecord{ .library = "NETAPI32", .import = "NetDfsSetClientInfo", .signature = "\x00\x05\x09\x11\x05\x11\x05\x11\x05\x09\x0f\x05" } },
    .{ "NetDfsMove", MethodRecord{ .library = "NETAPI32", .import = "NetDfsMove", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "NetDfsAddRootTarget", MethodRecord{ .library = "NETAPI32", .import = "NetDfsAddRootTarget", .signature = "\x00\x05\x09\x11\x05\x11\x05\x09\x11\x05\x09" } },
    .{ "NetDfsRemoveRootTarget", MethodRecord{ .library = "NETAPI32", .import = "NetDfsRemoveRootTarget", .signature = "\x00\x03\x09\x11\x05\x11\x05\x09" } },
    .{ "NetDfsGetSecurity", MethodRecord{ .library = "NETAPI32", .import = "NetDfsGetSecurity", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\x82\xad\x0f\x09" } },
    .{ "NetDfsSetSecurity", MethodRecord{ .library = "NETAPI32", .import = "NetDfsSetSecurity", .signature = "\x00\x03\x09\x11\x05\x09\x11\x82\xad" } },
    .{ "NetDfsGetStdContainerSecurity", MethodRecord{ .library = "NETAPI32", .import = "NetDfsGetStdContainerSecurity", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\x82\xad\x0f\x09" } },
    .{ "NetDfsSetStdContainerSecurity", MethodRecord{ .library = "NETAPI32", .import = "NetDfsSetStdContainerSecurity", .signature = "\x00\x03\x09\x11\x05\x09\x11\x82\xad" } },
    .{ "NetDfsGetFtContainerSecurity", MethodRecord{ .library = "NETAPI32", .import = "NetDfsGetFtContainerSecurity", .signature = "\x00\x04\x09\x11\x05\x09\x0f\x11\x82\xad\x0f\x09" } },
    .{ "NetDfsSetFtContainerSecurity", MethodRecord{ .library = "NETAPI32", .import = "NetDfsSetFtContainerSecurity", .signature = "\x00\x03\x09\x11\x05\x09\x11\x82\xad" } },
    .{ "NetDfsGetSupportedNamespaceVersion", MethodRecord{ .library = "NETAPI32", .import = "NetDfsGetSupportedNamespaceVersion", .signature = "\x00\x03\x09\x11\x9b\x05\x11\x05\x0f\x0f\x11\x9b\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x1b05 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.DistributedFileSystem", .name = "DFS_NAMESPACE_VERSION_ORIGIN" },
        0x1b09 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.DistributedFileSystem", .name = "DFS_SUPPORTED_NAMESPACE_VERSION_INFO" },
        else => null,
    };
}

pub const FSCTL_DFS_BASE = 6;
pub const DFS_VOLUME_STATES = 15;
pub const DFS_VOLUME_STATE_OK = 1;
pub const DFS_VOLUME_STATE_INCONSISTENT = 2;
pub const DFS_VOLUME_STATE_OFFLINE = 3;
pub const DFS_VOLUME_STATE_ONLINE = 4;
pub const DFS_VOLUME_STATE_RESYNCHRONIZE = 16;
pub const DFS_VOLUME_STATE_STANDBY = 32;
pub const DFS_VOLUME_STATE_FORCE_SYNC = 64;
pub const DFS_VOLUME_FLAVORS = 768;
pub const DFS_VOLUME_FLAVOR_UNUSED1 = 0;
pub const DFS_VOLUME_FLAVOR_STANDALONE = 256;
pub const DFS_VOLUME_FLAVOR_AD_BLOB = 512;
pub const DFS_STORAGE_FLAVOR_UNUSED2 = 768;
pub const DFS_STORAGE_STATES = 15;
pub const DFS_STORAGE_STATE_OFFLINE = 1;
pub const DFS_STORAGE_STATE_ONLINE = 2;
pub const DFS_STORAGE_STATE_ACTIVE = 4;
pub const DFS_PROPERTY_FLAG_INSITE_REFERRALS = 1;
pub const DFS_PROPERTY_FLAG_ROOT_SCALABILITY = 2;
pub const DFS_PROPERTY_FLAG_SITE_COSTING = 4;
pub const DFS_PROPERTY_FLAG_TARGET_FAILBACK = 8;
pub const DFS_PROPERTY_FLAG_CLUSTER_ENABLED = 16;
pub const DFS_PROPERTY_FLAG_ABDE = 32;
pub const DFS_ADD_VOLUME = 1;
pub const DFS_RESTORE_VOLUME = 2;
pub const NET_DFS_SETDC_FLAGS = 0;
pub const NET_DFS_SETDC_TIMEOUT = 1;
pub const NET_DFS_SETDC_INITPKT = 2;
pub const DFS_SITE_PRIMARY = 1;
pub const DFS_MOVE_FLAG_REPLACE_IF_EXISTS = 1;
pub const DFS_FORCE_REMOVE = 2147483648;
pub const FSCTL_DFS_GET_PKT_ENTRY_STATE = 401340;
pub const DfsInvalidPriorityClass = -1;
pub const DfsSiteCostNormalPriorityClass = 0;
pub const DfsGlobalHighPriorityClass = 1;
pub const DfsSiteCostHighPriorityClass = 2;
pub const DfsSiteCostLowPriorityClass = 3;
pub const DfsGlobalLowPriorityClass = 4;
pub const DFS_NAMESPACE_VERSION_ORIGIN_COMBINED = 0;
pub const DFS_NAMESPACE_VERSION_ORIGIN_SERVER = 1;
pub const DFS_NAMESPACE_VERSION_ORIGIN_DOMAIN = 2;

pub const aliases = struct {
    pub const DFS_TARGET_PRIORITY_CLASS = i32;
    pub const DFS_NAMESPACE_VERSION_ORIGIN = i32;
};
