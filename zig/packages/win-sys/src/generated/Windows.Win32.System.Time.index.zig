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
    .{ "SystemTimeToTzSpecificLocalTime", MethodRecord{ .library = "KERNEL32", .import = "SystemTimeToTzSpecificLocalTime", .signature = "\x00\x03\x11\x59\x0f\x11\xc0\x00\x45\x3d\x0f\x11\x86\x45\x0f\x11\x86\x45" } },
    .{ "TzSpecificLocalTimeToSystemTime", MethodRecord{ .library = "KERNEL32", .import = "TzSpecificLocalTimeToSystemTime", .signature = "\x00\x03\x11\x59\x0f\x11\xc0\x00\x45\x3d\x0f\x11\x86\x45\x0f\x11\x86\x45" } },
    .{ "FileTimeToSystemTime", MethodRecord{ .library = "KERNEL32", .import = "FileTimeToSystemTime", .signature = "\x00\x02\x11\x59\x0f\x11\x80\x9d\x0f\x11\x86\x45" } },
    .{ "SystemTimeToFileTime", MethodRecord{ .library = "KERNEL32", .import = "SystemTimeToFileTime", .signature = "\x00\x02\x11\x59\x0f\x11\x86\x45\x0f\x11\x80\x9d" } },
    .{ "GetTimeZoneInformation", MethodRecord{ .library = "KERNEL32", .import = "GetTimeZoneInformation", .signature = "\x00\x01\x09\x0f\x11\xc0\x00\x45\x3d" } },
    .{ "SetTimeZoneInformation", MethodRecord{ .library = "KERNEL32", .import = "SetTimeZoneInformation", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x45\x3d" } },
    .{ "SetDynamicTimeZoneInformation", MethodRecord{ .library = "KERNEL32", .import = "SetDynamicTimeZoneInformation", .signature = "\x00\x01\x11\x59\x0f\x11\xc0\x00\x45\x41" } },
    .{ "GetDynamicTimeZoneInformation", MethodRecord{ .library = "KERNEL32", .import = "GetDynamicTimeZoneInformation", .signature = "\x00\x01\x09\x0f\x11\xc0\x00\x45\x41" } },
    .{ "GetTimeZoneInformationForYear", MethodRecord{ .library = "KERNEL32", .import = "GetTimeZoneInformationForYear", .signature = "\x00\x03\x11\x59\x07\x0f\x11\xc0\x00\x45\x41\x0f\x11\xc0\x00\x45\x3d" } },
    .{ "EnumDynamicTimeZoneInformation", MethodRecord{ .library = "ADVAPI32", .import = "EnumDynamicTimeZoneInformation", .signature = "\x00\x02\x09\x09\x0f\x11\xc0\x00\x45\x41" } },
    .{ "GetDynamicTimeZoneInformationEffectiveYears", MethodRecord{ .library = "ADVAPI32", .import = "GetDynamicTimeZoneInformationEffectiveYears", .signature = "\x00\x03\x09\x0f\x11\xc0\x00\x45\x41\x0f\x09\x0f\x09" } },
    .{ "SystemTimeToTzSpecificLocalTimeEx", MethodRecord{ .library = "KERNEL32", .import = "SystemTimeToTzSpecificLocalTimeEx", .signature = "\x00\x03\x11\x59\x0f\x11\xc0\x00\x45\x41\x0f\x11\x86\x45\x0f\x11\x86\x45" } },
    .{ "TzSpecificLocalTimeToSystemTimeEx", MethodRecord{ .library = "KERNEL32", .import = "TzSpecificLocalTimeToSystemTimeEx", .signature = "\x00\x03\x11\x59\x0f\x11\xc0\x00\x45\x41\x0f\x11\x86\x45\x0f\x11\x86\x45" } },
    .{ "LocalFileTimeToLocalSystemTime", MethodRecord{ .library = "KERNEL32", .import = "LocalFileTimeToLocalSystemTime", .signature = "\x00\x03\x11\x59\x0f\x11\xc0\x00\x45\x3d\x0f\x11\x80\x9d\x0f\x11\x86\x45" } },
    .{ "LocalSystemTimeToLocalFileTime", MethodRecord{ .library = "KERNEL32", .import = "LocalSystemTimeToLocalFileTime", .signature = "\x00\x03\x11\x59\x0f\x11\xc0\x00\x45\x3d\x0f\x11\x86\x45\x0f\x11\x80\x9d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x645 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SYSTEMTIME" },
        0x453d => TypeRefEntry{ .namespace = "Windows.Win32.System.Time", .name = "TIME_ZONE_INFORMATION" },
        0x4541 => TypeRefEntry{ .namespace = "Windows.Win32.System.Time", .name = "DYNAMIC_TIME_ZONE_INFORMATION" },
        else => null,
    };
}

pub const TSF_Hardware = 1;
pub const TSF_Authenticated = 2;
pub const TSF_IPv6 = 4;
pub const TSF_SignatureAuthenticated = 8;
pub const TIME_ZONE_ID_INVALID = 4294967295;
