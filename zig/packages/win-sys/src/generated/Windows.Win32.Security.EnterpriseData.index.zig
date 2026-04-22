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
    .{ "SrpCreateThreadNetworkContext", MethodRecord{ .library = "srpapi", .import = "SrpCreateThreadNetworkContext", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\xc0\x00\x89\x18" } },
    .{ "SrpCloseThreadNetworkContext", MethodRecord{ .library = "srpapi", .import = "SrpCloseThreadNetworkContext", .signature = "\x00\x01\x11\x79\x0f\x11\xc0\x00\x89\x18" } },
    .{ "SrpSetTokenEnterpriseId", MethodRecord{ .library = "srpapi", .import = "SrpSetTokenEnterpriseId", .signature = "\x00\x02\x11\x79\x11\x80\x85\x11\x05" } },
    .{ "SrpGetEnterpriseIds", MethodRecord{ .library = "srpapi", .import = "SrpGetEnterpriseIds", .signature = "\x00\x04\x11\x79\x11\x80\x85\x0f\x09\x0f\x11\x05\x0f\x09" } },
    .{ "SrpEnablePermissiveModeFileEncryption", MethodRecord{ .library = "srpapi", .import = "SrpEnablePermissiveModeFileEncryption", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "SrpDisablePermissiveModeFileEncryption", MethodRecord{ .library = "srpapi", .import = "SrpDisablePermissiveModeFileEncryption", .signature = "\x00\x00\x11\x79" } },
    .{ "SrpGetEnterprisePolicy", MethodRecord{ .library = "srpapi", .import = "SrpGetEnterprisePolicy", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\xc0\x00\x71\xe5" } },
    .{ "SrpIsTokenService", MethodRecord{ .library = "srpapi", .import = "SrpIsTokenService", .signature = "\x00\x02\x11\x84\x71\x11\x80\x85\x0f\x05" } },
    .{ "SrpDoesPolicyAllowAppExecution", MethodRecord{ .library = "srpapi", .import = "SrpDoesPolicyAllowAppExecution", .signature = "\x00\x02\x11\x79\x0f\x11\x81\x05\x0f\x11\x59" } },
    .{ "SrpIsAllowed", MethodRecord{ .library = "srpapi", .import = "SrpIsAllowed", .signature = "\x00\x01\x11\x84\x71\x0f\x11\xa7\x18" } },
    .{ "SrpHostingInitialize", MethodRecord{ .library = "srpapi", .import = "SrpHostingInitialize", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x71\xed\x11\xc0\x00\x71\xe9\x0f\x01\x09" } },
    .{ "SrpHostingTerminate", MethodRecord{ .library = "srpapi", .import = "SrpHostingTerminate", .signature = "\x00\x01\x01\x11\xc0\x00\x71\xe9" } },
    .{ "ProtectFileToEnterpriseIdentity", MethodRecord{ .library = "efswrt", .import = "ProtectFileToEnterpriseIdentity", .signature = "\x00\x02\x11\x79\x11\x05\x11\x05" } },
    .{ "UnprotectFile", MethodRecord{ .library = "efswrt", .import = "UnprotectFile", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\xc0\x00\x89\x28" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x105 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "PACKAGE_ID" },
        0x471 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "NTSTATUS" },
        0x2718 => TypeRefEntry{ .namespace = "Windows.Win32.Security.EnterpriseData", .name = "_SRP_REQUEST" },
        0x71e5 => TypeRefEntry{ .namespace = "Windows.Win32.Security.EnterpriseData", .name = "ENTERPRISE_DATA_POLICIES" },
        0x71e9 => TypeRefEntry{ .namespace = "Windows.Win32.Security.EnterpriseData", .name = "SRPHOSTING_TYPE" },
        0x71ed => TypeRefEntry{ .namespace = "Windows.Win32.Security.EnterpriseData", .name = "SRPHOSTING_VERSION" },
        0x8918 => TypeRefEntry{ .namespace = "Windows.Win32.Security.EnterpriseData", .name = "HTHREAD_NETWORK_CONTEXT" },
        0x8928 => TypeRefEntry{ .namespace = "Windows.Win32.Security.EnterpriseData", .name = "FILE_UNPROTECT_OPTIONS" },
        else => null,
    };
}

pub const ENTERPRISE_POLICY_NONE = 0;
pub const ENTERPRISE_POLICY_ALLOWED = 1;
pub const ENTERPRISE_POLICY_ENLIGHTENED = 2;
pub const ENTERPRISE_POLICY_EXEMPT = 4;
pub const SRPHOSTING_TYPE_NONE = 0;
pub const SRPHOSTING_TYPE_WINHTTP = 1;
pub const SRPHOSTING_TYPE_WININET = 2;
pub const SRPHOSTING_VERSION1 = 1;

pub const aliases = struct {
    pub const ENTERPRISE_DATA_POLICIES = i32;
    pub const SRPHOSTING_TYPE = i32;
    pub const SRPHOSTING_VERSION = i32;
    pub const _SRP_REQUEST = isize;
};
