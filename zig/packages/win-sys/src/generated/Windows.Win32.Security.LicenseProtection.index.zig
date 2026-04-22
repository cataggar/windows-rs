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
    .{ "RegisterLicenseKeyWithExpiration", MethodRecord{ .library = "licenseprotection", .import = "RegisterLicenseKeyWithExpiration", .signature = "\x00\x03\x11\x79\x11\x05\x09\x0f\x11\xc0\x00\xa2\x91" } },
    .{ "ValidateLicenseKeyProtection", MethodRecord{ .library = "licenseprotection", .import = "ValidateLicenseKeyProtection", .signature = "\x00\x04\x11\x79\x11\x05\x0f\x11\x80\x9d\x0f\x11\x80\x9d\x0f\x11\xc0\x00\xa2\x91" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0xa291 => TypeRefEntry{ .namespace = "Windows.Win32.Security.LicenseProtection", .name = "LicenseProtectionStatus" },
        else => null,
    };
}

pub const Success = 0;
pub const LicenseKeyNotFound = 1;
pub const LicenseKeyUnprotected = 2;
pub const LicenseKeyCorrupted = 3;
pub const LicenseKeyAlreadyExists = 4;

pub const aliases = struct {
    pub const LicenseProtectionStatus = i32;
};
