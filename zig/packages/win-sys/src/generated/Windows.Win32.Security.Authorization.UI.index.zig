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
    .{ "CreateSecurityPage", MethodRecord{ .library = "ACLUI", .import = "CreateSecurityPage", .signature = "\x00\x01\x11\x83\x31\x12\xbc\x3d" } },
    .{ "EditSecurity", MethodRecord{ .library = "ACLUI", .import = "EditSecurity", .signature = "\x00\x02\x11\x59\x11\x25\x12\xbc\x3d" } },
    .{ "EditSecurityAdvanced", MethodRecord{ .library = "ACLUI", .import = "EditSecurityAdvanced", .signature = "\x00\x03\x11\x79\x11\x25\x12\xbc\x3d\x11\xbc\x41" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x331 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Controls", .name = "HPROPSHEETPAGE" },
        0x3c3d => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization.UI", .name = "ISecurityInformation" },
        0x3c41 => TypeRefEntry{ .namespace = "Windows.Win32.Security.Authorization.UI", .name = "SI_PAGE_TYPE" },
        else => null,
    };
}

pub const SI_ADVANCED = 16;
pub const SI_EDIT_AUDITS = 2;
pub const SI_EDIT_PROPERTIES = 128;
pub const SI_AUDITS_ELEVATION_REQUIRED = 33554432;
pub const SI_DISABLE_DENY_ACE = 2147483648;
pub const SI_EDIT_EFFECTIVE = 131072;
pub const SI_ENABLE_CENTRAL_POLICY = 1073741824;
pub const SI_ENABLE_EDIT_ATTRIBUTE_CONDITION = 536870912;
pub const SI_MAY_WRITE = 268435456;
pub const SI_NO_ADDITIONAL_PERMISSION = 2097152;
pub const SI_OWNER_ELEVATION_REQUIRED = 67108864;
pub const SI_PERMS_ELEVATION_REQUIRED = 16777216;
pub const SI_RESET_DACL = 262144;
pub const SI_RESET_OWNER = 1048576;
pub const SI_RESET_SACL = 524288;
pub const SI_SCOPE_ELEVATION_REQUIRED = 134217728;
pub const SI_VIEW_ONLY = 4194304;
pub const SI_EDIT_PERMS = 0;
pub const SI_EDIT_OWNER = 1;
pub const SI_CONTAINER = 4;
pub const SI_READONLY = 8;
pub const SI_RESET = 32;
pub const SI_OWNER_READONLY = 64;
pub const SI_OWNER_RECURSE = 256;
pub const SI_NO_ACL_PROTECT = 512;
pub const SI_NO_TREE_APPLY = 1024;
pub const SI_PAGE_TITLE = 2048;
pub const SI_SERVER_IS_DC = 4096;
pub const SI_RESET_DACL_TREE = 16384;
pub const SI_RESET_SACL_TREE = 32768;
pub const SI_OBJECT_GUID = 65536;
pub const SI_ACCESS_SPECIFIC = 65536;
pub const SI_ACCESS_GENERAL = 131072;
pub const SI_ACCESS_CONTAINER = 262144;
pub const SI_ACCESS_PROPERTY = 524288;
pub const DOBJ_RES_CONT = 1;
pub const DOBJ_RES_ROOT = 2;
pub const DOBJ_VOL_NTACLS = 4;
pub const DOBJ_COND_NTACLS = 8;
pub const DOBJ_RIBBON_LAUNCH = 16;
pub const SECURITY_OBJECT_ID_OBJECT_SD = 1;
pub const SECURITY_OBJECT_ID_SHARE = 2;
pub const SECURITY_OBJECT_ID_CENTRAL_POLICY = 3;
pub const SECURITY_OBJECT_ID_CENTRAL_ACCESS_RULE = 4;
pub const SI_PAGE_PERM = 0;
pub const SI_PAGE_ADVPERM = 1;
pub const SI_PAGE_AUDIT = 2;
pub const SI_PAGE_OWNER = 3;
pub const SI_PAGE_EFFECTIVE = 4;
pub const SI_PAGE_TAKEOWNERSHIP = 5;
pub const SI_PAGE_SHARE = 6;
pub const SI_SHOW_DEFAULT = 0;
pub const SI_SHOW_PERM_ACTIVATED = 1;
pub const SI_SHOW_AUDIT_ACTIVATED = 2;
pub const SI_SHOW_OWNER_ACTIVATED = 3;
pub const SI_SHOW_EFFECTIVE_ACTIVATED = 4;
pub const SI_SHOW_SHARE_ACTIVATED = 5;
pub const SI_SHOW_CENTRAL_POLICY_ACTIVATED = 6;

pub const aliases = struct {
    pub const SECURITY_INFO_PAGE_FLAGS = u32;
    pub const SI_OBJECT_INFO_FLAGS = u32;
    pub const SI_PAGE_TYPE = i32;
    pub const SI_PAGE_ACTIVATED = i32;
};
