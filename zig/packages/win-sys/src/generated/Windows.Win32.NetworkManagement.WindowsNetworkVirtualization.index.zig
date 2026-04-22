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
    .{ "WnvOpen", MethodRecord{ .library = "wnvapi", .import = "WnvOpen", .signature = "\x00\x00\x11\x80\x85" } },
    .{ "WnvRequestNotification", MethodRecord{ .library = "wnvapi", .import = "WnvRequestNotification", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x11\xbb\x45\x0f\x11\x8b\xed\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0xbed => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED" },
        0x3b45 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.WindowsNetworkVirtualization", .name = "WNV_NOTIFICATION_PARAM" },
        else => null,
    };
}

pub const WNV_API_MAJOR_VERSION_1 = 1;
pub const WNV_API_MINOR_VERSION_0 = 0;
pub const WnvPolicyMismatchType = 0;
pub const WnvRedirectType = 1;
pub const WnvObjectChangeType = 2;
pub const WnvNotificationTypeMax = 3;
pub const WnvProviderAddressType = 0;
pub const WnvCustomerAddressType = 1;
pub const WnvObjectTypeMax = 2;
pub const WnvCustomerAddressAdded = 0;
pub const WnvCustomerAddressDeleted = 1;
pub const WnvCustomerAddressMoved = 2;
pub const WnvCustomerAddressMax = 3;

pub const aliases = struct {
    pub const WNV_NOTIFICATION_TYPE = i32;
    pub const WNV_OBJECT_TYPE = i32;
    pub const WNV_CA_NOTIFICATION_TYPE = i32;
};
