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
    .{ "GlobalMemoryStatusEx", MethodRecord{ .library = "KERNEL32", .import = "GlobalMemoryStatusEx", .signature = "\x00\x01\x11\x59\x0f\x11\xa3\x3d" } },
    .{ "GetSystemInfo", MethodRecord{ .library = "KERNEL32", .import = "GetSystemInfo", .signature = "\x00\x01\x01\x0f\x11\xa3\x41" } },
    .{ "GetSystemTime", MethodRecord{ .library = "KERNEL32", .import = "GetSystemTime", .signature = "\x00\x01\x01\x0f\x11\x86\x45" } },
    .{ "GetSystemTimeAsFileTime", MethodRecord{ .library = "KERNEL32", .import = "GetSystemTimeAsFileTime", .signature = "\x00\x01\x01\x0f\x11\x80\x9d" } },
    .{ "GetLocalTime", MethodRecord{ .library = "KERNEL32", .import = "GetLocalTime", .signature = "\x00\x01\x01\x0f\x11\x86\x45" } },
    .{ "IsUserCetAvailableInEnvironment", MethodRecord{ .library = "KERNEL32", .import = "IsUserCetAvailableInEnvironment", .signature = "\x00\x01\x11\x59\x11\xa2\xad" } },
    .{ "GetSystemLeapSecondInformation", MethodRecord{ .library = "KERNEL32", .import = "GetSystemLeapSecondInformation", .signature = "\x00\x02\x11\x59\x0f\x11\x59\x0f\x09" } },
    .{ "GetVersion", MethodRecord{ .library = "KERNEL32", .import = "GetVersion", .signature = "\x00\x00\x09" } },
    .{ "SetLocalTime", MethodRecord{ .library = "KERNEL32", .import = "SetLocalTime", .signature = "\x00\x01\x11\x59\x0f\x11\x86\x45" } },
    .{ "GetTickCount", MethodRecord{ .library = "KERNEL32", .import = "GetTickCount", .signature = "\x00\x00\x09" } },
    .{ "GetTickCount64", MethodRecord{ .library = "KERNEL32", .import = "GetTickCount64", .signature = "\x00\x00\x0b" } },
    .{ "GetSystemTimeAdjustment", MethodRecord{ .library = "KERNEL32", .import = "GetSystemTimeAdjustment", .signature = "\x00\x03\x11\x59\x0f\x09\x0f\x09\x0f\x11\x59" } },
    .{ "GetSystemTimeAdjustmentPrecise", MethodRecord{ .library = "api-ms-win-core-sysinfo-l1-2-4", .import = "GetSystemTimeAdjustmentPrecise", .signature = "\x00\x03\x11\x59\x0f\x0b\x0f\x0b\x0f\x11\x59" } },
    .{ "GetSystemDirectoryA", MethodRecord{ .library = "KERNEL32", .import = "GetSystemDirectoryA", .signature = "\x00\x02\x09\x11\x3d\x09" } },
    .{ "GetSystemDirectoryW", MethodRecord{ .library = "KERNEL32", .import = "GetSystemDirectoryW", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "GetWindowsDirectoryA", MethodRecord{ .library = "KERNEL32", .import = "GetWindowsDirectoryA", .signature = "\x00\x02\x09\x11\x3d\x09" } },
    .{ "GetWindowsDirectoryW", MethodRecord{ .library = "KERNEL32", .import = "GetWindowsDirectoryW", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "GetSystemWindowsDirectoryA", MethodRecord{ .library = "KERNEL32", .import = "GetSystemWindowsDirectoryA", .signature = "\x00\x02\x09\x11\x3d\x09" } },
    .{ "GetSystemWindowsDirectoryW", MethodRecord{ .library = "KERNEL32", .import = "GetSystemWindowsDirectoryW", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "GetComputerNameExA", MethodRecord{ .library = "KERNEL32", .import = "GetComputerNameExA", .signature = "\x00\x03\x11\x59\x11\xa3\x45\x11\x3d\x0f\x09" } },
    .{ "GetComputerNameExW", MethodRecord{ .library = "KERNEL32", .import = "GetComputerNameExW", .signature = "\x00\x03\x11\x59\x11\xa3\x45\x11\x05\x0f\x09" } },
    .{ "SetComputerNameExW", MethodRecord{ .library = "KERNEL32", .import = "SetComputerNameExW", .signature = "\x00\x02\x11\x59\x11\xa3\x45\x11\x05" } },
    .{ "SetSystemTime", MethodRecord{ .library = "KERNEL32", .import = "SetSystemTime", .signature = "\x00\x01\x11\x59\x0f\x11\x86\x45" } },
    .{ "GetVersionExA", MethodRecord{ .library = "KERNEL32", .import = "GetVersionExA", .signature = "\x00\x01\x11\x59\x0f\x11\xa3\x49" } },
    .{ "GetVersionExW", MethodRecord{ .library = "KERNEL32", .import = "GetVersionExW", .signature = "\x00\x01\x11\x59\x0f\x11\xa3\x4d" } },
    .{ "GetLogicalProcessorInformation", MethodRecord{ .library = "KERNEL32", .import = "GetLogicalProcessorInformation", .signature = "\x00\x02\x11\x59\x0f\x11\xa3\x51\x0f\x09" } },
    .{ "GetLogicalProcessorInformationEx", MethodRecord{ .library = "KERNEL32", .import = "GetLogicalProcessorInformationEx", .signature = "\x00\x03\x11\x59\x11\xa3\x55\x0f\x11\xa3\x59\x0f\x09" } },
    .{ "GetNativeSystemInfo", MethodRecord{ .library = "KERNEL32", .import = "GetNativeSystemInfo", .signature = "\x00\x01\x01\x0f\x11\xa3\x41" } },
    .{ "GetSystemTimePreciseAsFileTime", MethodRecord{ .library = "KERNEL32", .import = "GetSystemTimePreciseAsFileTime", .signature = "\x00\x01\x01\x0f\x11\x80\x9d" } },
    .{ "GetProductInfo", MethodRecord{ .library = "KERNEL32", .import = "GetProductInfo", .signature = "\x00\x05\x11\x59\x09\x09\x09\x09\x0f\x11\xa2\xb1" } },
    .{ "VerSetConditionMask", MethodRecord{ .library = "KERNEL32", .import = "VerSetConditionMask", .signature = "\x00\x03\x0b\x0b\x11\xa2\x9d\x05" } },
    .{ "GetOsSafeBootMode", MethodRecord{ .library = "api-ms-win-core-sysinfo-l1-2-0", .import = "GetOsSafeBootMode", .signature = "\x00\x01\x11\x59\x0f\x09" } },
    .{ "EnumSystemFirmwareTables", MethodRecord{ .library = "KERNEL32", .import = "EnumSystemFirmwareTables", .signature = "\x00\x03\x09\x11\xa2\xa9\x0f\x05\x09" } },
    .{ "GetSystemFirmwareTable", MethodRecord{ .library = "KERNEL32", .import = "GetSystemFirmwareTable", .signature = "\x00\x04\x09\x11\xa2\xa9\x09\x0f\x05\x09" } },
    .{ "DnsHostnameToComputerNameExW", MethodRecord{ .library = "KERNEL32", .import = "DnsHostnameToComputerNameExW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x0f\x09" } },
    .{ "GetPhysicallyInstalledSystemMemory", MethodRecord{ .library = "KERNEL32", .import = "GetPhysicallyInstalledSystemMemory", .signature = "\x00\x01\x11\x59\x0f\x0b" } },
    .{ "SetComputerNameEx2W", MethodRecord{ .library = "KERNEL32", .import = "SetComputerNameEx2W", .signature = "\x00\x03\x11\x59\x11\xa3\x45\x09\x11\x05" } },
    .{ "SetSystemTimeAdjustment", MethodRecord{ .library = "KERNEL32", .import = "SetSystemTimeAdjustment", .signature = "\x00\x02\x11\x59\x09\x11\x59" } },
    .{ "SetSystemTimeAdjustmentPrecise", MethodRecord{ .library = "api-ms-win-core-sysinfo-l1-2-4", .import = "SetSystemTimeAdjustmentPrecise", .signature = "\x00\x02\x11\x59\x0b\x11\x59" } },
    .{ "GetProcessorSystemCycleTime", MethodRecord{ .library = "KERNEL32", .import = "GetProcessorSystemCycleTime", .signature = "\x00\x03\x11\x59\x07\x0f\x11\xa3\x5d\x0f\x09" } },
    .{ "GetOsManufacturingMode", MethodRecord{ .library = "api-ms-win-core-sysinfo-l1-2-3", .import = "GetOsManufacturingMode", .signature = "\x00\x01\x11\x59\x0f\x11\x59" } },
    .{ "GetIntegratedDisplaySize", MethodRecord{ .library = "api-ms-win-core-sysinfo-l1-2-3", .import = "GetIntegratedDisplaySize", .signature = "\x00\x01\x11\x79\x0f\x0d" } },
    .{ "SetComputerNameA", MethodRecord{ .library = "KERNEL32", .import = "SetComputerNameA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "SetComputerNameW", MethodRecord{ .library = "KERNEL32", .import = "SetComputerNameW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "SetComputerNameExA", MethodRecord{ .library = "KERNEL32", .import = "SetComputerNameExA", .signature = "\x00\x02\x11\x59\x11\xa3\x45\x11\x3d" } },
    .{ "GetDeveloperDriveEnablementState", MethodRecord{ .library = "api-ms-win-core-sysinfo-l1-2-6", .import = "GetDeveloperDriveEnablementState", .signature = "\x00\x00\x11\xa3\x61" } },
    .{ "GetRuntimeAttestationReport", MethodRecord{ .library = "KERNEL32", .import = "GetRuntimeAttestationReport", .signature = "\x00\x05\x11\x59\x0f\x05\x07\x0b\x0f\x01\x0f\x09" } },
    .{ "GetSystemCpuSetInformation", MethodRecord{ .library = "KERNEL32", .import = "GetSystemCpuSetInformation", .signature = "\x00\x05\x11\x59\x0f\x11\xa3\x65\x09\x0f\x09\x11\x80\x85\x09" } },
    .{ "GetSystemWow64DirectoryA", MethodRecord{ .library = "KERNEL32", .import = "GetSystemWow64DirectoryA", .signature = "\x00\x02\x09\x11\x3d\x09" } },
    .{ "GetSystemWow64DirectoryW", MethodRecord{ .library = "KERNEL32", .import = "GetSystemWow64DirectoryW", .signature = "\x00\x02\x09\x11\x05\x09" } },
    .{ "GetSystemWow64Directory2A", MethodRecord{ .library = "api-ms-win-core-wow64-l1-1-1", .import = "GetSystemWow64Directory2A", .signature = "\x00\x03\x09\x11\x3d\x09\x11\xa2\xa1" } },
    .{ "GetSystemWow64Directory2W", MethodRecord{ .library = "api-ms-win-core-wow64-l1-1-1", .import = "GetSystemWow64Directory2W", .signature = "\x00\x03\x09\x11\x05\x09\x11\xa2\xa1" } },
    .{ "IsWow64GuestMachineSupported", MethodRecord{ .library = "KERNEL32", .import = "IsWow64GuestMachineSupported", .signature = "\x00\x02\x11\x79\x11\xa2\xa1\x0f\x11\x59" } },
    .{ "RtlGetProductInfo", MethodRecord{ .library = "ntdll", .import = "RtlGetProductInfo", .signature = "\x00\x05\x11\x87\x79\x09\x09\x09\x09\x0f\x09" } },
    .{ "RtlOsDeploymentState", MethodRecord{ .library = "ntdll", .import = "RtlOsDeploymentState", .signature = "\x00\x01\x11\xa3\x69\x09" } },
    .{ "RtlGetSystemGlobalData", MethodRecord{ .library = "ntdllk", .import = "RtlGetSystemGlobalData", .signature = "\x00\x03\x09\x11\xa3\x6d\x0f\x01\x09" } },
    .{ "RtlGetDeviceFamilyInfoEnum", MethodRecord{ .library = "ntdll", .import = "RtlGetDeviceFamilyInfoEnum", .signature = "\x00\x03\x01\x0f\x0b\x0f\x11\xa2\xb5\x0f\x11\xa2\xb9" } },
    .{ "RtlConvertDeviceFamilyInfoToString", MethodRecord{ .library = "ntdll", .import = "RtlConvertDeviceFamilyInfoToString", .signature = "\x00\x04\x09\x0f\x09\x0f\x09\x11\x05\x11\x05" } },
    .{ "RtlSwitchedVVI", MethodRecord{ .library = "ntdll", .import = "RtlSwitchedVVI", .signature = "\x00\x03\x09\x0f\x11\xa3\x71\x09\x0b" } },
    .{ "GlobalMemoryStatus", MethodRecord{ .library = "KERNEL32", .import = "GlobalMemoryStatus", .signature = "\x00\x01\x01\x0f\x11\xa3\x75" } },
    .{ "GetSystemDEPPolicy", MethodRecord{ .library = "KERNEL32", .import = "GetSystemDEPPolicy", .signature = "\x00\x00\x11\xa3\x79" } },
    .{ "GetFirmwareType", MethodRecord{ .library = "KERNEL32", .import = "GetFirmwareType", .signature = "\x00\x01\x11\x59\x0f\x11\xa3\x7d" } },
    .{ "VerifyVersionInfoA", MethodRecord{ .library = "KERNEL32", .import = "VerifyVersionInfoA", .signature = "\x00\x03\x11\x59\x0f\x11\xa3\x81\x11\xa2\x9d\x0b" } },
    .{ "VerifyVersionInfoW", MethodRecord{ .library = "KERNEL32", .import = "VerifyVersionInfoW", .signature = "\x00\x03\x11\x59\x0f\x11\xa3\x71\x11\xa2\x9d\x0b" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x645 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SYSTEMTIME" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0x229d => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "VER_FLAGS" },
        0x22a1 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "IMAGE_FILE_MACHINE" },
        0x22a9 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "FIRMWARE_TABLE_PROVIDER" },
        0x22ad => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "USER_CET_ENVIRONMENT" },
        0x22b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "OS_PRODUCT_TYPE" },
        0x22b5 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "DEVICEFAMILYINFOENUM" },
        0x22b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "DEVICEFAMILYDEVICEFORM" },
        0x233d => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "MEMORYSTATUSEX" },
        0x2341 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "SYSTEM_INFO" },
        0x2345 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "COMPUTER_NAME_FORMAT" },
        0x2349 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "OSVERSIONINFOA" },
        0x234d => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "OSVERSIONINFOW" },
        0x2351 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "SYSTEM_LOGICAL_PROCESSOR_INFORMATION" },
        0x2355 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "LOGICAL_PROCESSOR_RELATIONSHIP" },
        0x2359 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX" },
        0x235d => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION" },
        0x2361 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "DEVELOPER_DRIVE_ENABLEMENT_STATE" },
        0x2365 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "SYSTEM_CPU_SET_INFORMATION" },
        0x2369 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "OS_DEPLOYEMENT_STATE_VALUES" },
        0x236d => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "RTL_SYSTEM_GLOBAL_DATA_ID" },
        0x2371 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "OSVERSIONINFOEXW" },
        0x2375 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "MEMORYSTATUS" },
        0x2379 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "DEP_SYSTEM_POLICY_TYPE" },
        0x237d => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "FIRMWARE_TYPE" },
        0x2381 => TypeRefEntry{ .namespace = "Windows.Win32.System.SystemInformation", .name = "OSVERSIONINFOEXA" },
        else => null,
    };
}

pub const VER_MINORVERSION = 1;
pub const VER_MAJORVERSION = 2;
pub const VER_BUILDNUMBER = 4;
pub const VER_PLATFORMID = 8;
pub const VER_SERVICEPACKMINOR = 16;
pub const VER_SERVICEPACKMAJOR = 32;
pub const VER_SUITENAME = 64;
pub const VER_PRODUCT_TYPE = 128;
pub const IMAGE_FILE_MACHINE_AXP64 = 644;
pub const IMAGE_FILE_MACHINE_I386 = 332;
pub const IMAGE_FILE_MACHINE_IA64 = 512;
pub const IMAGE_FILE_MACHINE_AMD64 = 34404;
pub const IMAGE_FILE_MACHINE_UNKNOWN = 0;
pub const IMAGE_FILE_MACHINE_TARGET_HOST = 1;
pub const IMAGE_FILE_MACHINE_R3000 = 354;
pub const IMAGE_FILE_MACHINE_R4000 = 358;
pub const IMAGE_FILE_MACHINE_R10000 = 360;
pub const IMAGE_FILE_MACHINE_WCEMIPSV2 = 361;
pub const IMAGE_FILE_MACHINE_ALPHA = 388;
pub const IMAGE_FILE_MACHINE_SH3 = 418;
pub const IMAGE_FILE_MACHINE_SH3DSP = 419;
pub const IMAGE_FILE_MACHINE_SH3E = 420;
pub const IMAGE_FILE_MACHINE_SH4 = 422;
pub const IMAGE_FILE_MACHINE_SH5 = 424;
pub const IMAGE_FILE_MACHINE_ARM = 448;
pub const IMAGE_FILE_MACHINE_THUMB = 450;
pub const IMAGE_FILE_MACHINE_ARMNT = 452;
pub const IMAGE_FILE_MACHINE_AM33 = 467;
pub const IMAGE_FILE_MACHINE_POWERPC = 496;
pub const IMAGE_FILE_MACHINE_POWERPCFP = 497;
pub const IMAGE_FILE_MACHINE_MIPS16 = 614;
pub const IMAGE_FILE_MACHINE_ALPHA64 = 644;
pub const IMAGE_FILE_MACHINE_MIPSFPU = 870;
pub const IMAGE_FILE_MACHINE_MIPSFPU16 = 1126;
pub const IMAGE_FILE_MACHINE_TRICORE = 1312;
pub const IMAGE_FILE_MACHINE_CEF = 3311;
pub const IMAGE_FILE_MACHINE_EBC = 3772;
pub const IMAGE_FILE_MACHINE_M32R = 36929;
pub const IMAGE_FILE_MACHINE_ARM64 = 43620;
pub const IMAGE_FILE_MACHINE_CEE = 49390;
pub const PROCESSOR_ARCHITECTURE_INTEL = 0;
pub const PROCESSOR_ARCHITECTURE_MIPS = 1;
pub const PROCESSOR_ARCHITECTURE_ALPHA = 2;
pub const PROCESSOR_ARCHITECTURE_PPC = 3;
pub const PROCESSOR_ARCHITECTURE_SHX = 4;
pub const PROCESSOR_ARCHITECTURE_ARM = 5;
pub const PROCESSOR_ARCHITECTURE_IA64 = 6;
pub const PROCESSOR_ARCHITECTURE_ALPHA64 = 7;
pub const PROCESSOR_ARCHITECTURE_MSIL = 8;
pub const PROCESSOR_ARCHITECTURE_AMD64 = 9;
pub const PROCESSOR_ARCHITECTURE_IA32_ON_WIN64 = 10;
pub const PROCESSOR_ARCHITECTURE_NEUTRAL = 11;
pub const PROCESSOR_ARCHITECTURE_ARM64 = 12;
pub const PROCESSOR_ARCHITECTURE_ARM32_ON_WIN64 = 13;
pub const PROCESSOR_ARCHITECTURE_IA32_ON_ARM64 = 14;
pub const PROCESSOR_ARCHITECTURE_UNKNOWN = 65535;
pub const ACPI = 1094930505;
pub const FIRM = 1179210317;
pub const RSMB = 1381190978;
pub const USER_CET_ENVIRONMENT_WIN32_PROCESS = 0;
pub const USER_CET_ENVIRONMENT_SGX2_ENCLAVE = 2;
pub const USER_CET_ENVIRONMENT_VBS_ENCLAVE = 16;
pub const USER_CET_ENVIRONMENT_VBS_BASIC_ENCLAVE = 17;
pub const PRODUCT_UNDEFINED = 0;
pub const PRODUCT_ULTIMATE = 1;
pub const PRODUCT_HOME_BASIC = 2;
pub const PRODUCT_HOME_PREMIUM = 3;
pub const PRODUCT_ENTERPRISE = 4;
pub const PRODUCT_HOME_BASIC_N = 5;
pub const PRODUCT_BUSINESS = 6;
pub const PRODUCT_STANDARD_SERVER = 7;
pub const PRODUCT_DATACENTER_SERVER = 8;
pub const PRODUCT_SMALLBUSINESS_SERVER = 9;
pub const PRODUCT_ENTERPRISE_SERVER = 10;
pub const PRODUCT_STARTER = 11;
pub const PRODUCT_DATACENTER_SERVER_CORE = 12;
pub const PRODUCT_STANDARD_SERVER_CORE = 13;
pub const PRODUCT_ENTERPRISE_SERVER_CORE = 14;
pub const PRODUCT_ENTERPRISE_SERVER_IA64 = 15;
pub const PRODUCT_BUSINESS_N = 16;
pub const PRODUCT_WEB_SERVER = 17;
pub const PRODUCT_CLUSTER_SERVER = 18;
pub const PRODUCT_HOME_SERVER = 19;
pub const PRODUCT_STORAGE_EXPRESS_SERVER = 20;
pub const PRODUCT_STORAGE_STANDARD_SERVER = 21;
pub const PRODUCT_STORAGE_WORKGROUP_SERVER = 22;
pub const PRODUCT_STORAGE_ENTERPRISE_SERVER = 23;
pub const PRODUCT_SERVER_FOR_SMALLBUSINESS = 24;
pub const PRODUCT_SMALLBUSINESS_SERVER_PREMIUM = 25;
pub const PRODUCT_HOME_PREMIUM_N = 26;
pub const PRODUCT_ENTERPRISE_N = 27;
pub const PRODUCT_ULTIMATE_N = 28;
pub const PRODUCT_WEB_SERVER_CORE = 29;
pub const PRODUCT_MEDIUMBUSINESS_SERVER_MANAGEMENT = 30;
pub const PRODUCT_MEDIUMBUSINESS_SERVER_SECURITY = 31;
pub const PRODUCT_MEDIUMBUSINESS_SERVER_MESSAGING = 32;
pub const PRODUCT_SERVER_FOUNDATION = 33;
pub const PRODUCT_HOME_PREMIUM_SERVER = 34;
pub const PRODUCT_SERVER_FOR_SMALLBUSINESS_V = 35;
pub const PRODUCT_STANDARD_SERVER_V = 36;
pub const PRODUCT_DATACENTER_SERVER_V = 37;
pub const PRODUCT_ENTERPRISE_SERVER_V = 38;
pub const PRODUCT_DATACENTER_SERVER_CORE_V = 39;
pub const PRODUCT_STANDARD_SERVER_CORE_V = 40;
pub const PRODUCT_ENTERPRISE_SERVER_CORE_V = 41;
pub const PRODUCT_HYPERV = 42;
pub const PRODUCT_STORAGE_EXPRESS_SERVER_CORE = 43;
pub const PRODUCT_STORAGE_STANDARD_SERVER_CORE = 44;
pub const PRODUCT_STORAGE_WORKGROUP_SERVER_CORE = 45;
pub const PRODUCT_STORAGE_ENTERPRISE_SERVER_CORE = 46;
pub const PRODUCT_STARTER_N = 47;
pub const PRODUCT_PROFESSIONAL = 48;
pub const PRODUCT_PROFESSIONAL_N = 49;
pub const PRODUCT_SB_SOLUTION_SERVER = 50;
pub const PRODUCT_SERVER_FOR_SB_SOLUTIONS = 51;
pub const PRODUCT_STANDARD_SERVER_SOLUTIONS = 52;
pub const PRODUCT_STANDARD_SERVER_SOLUTIONS_CORE = 53;
pub const PRODUCT_SB_SOLUTION_SERVER_EM = 54;
pub const PRODUCT_SERVER_FOR_SB_SOLUTIONS_EM = 55;
pub const PRODUCT_SOLUTION_EMBEDDEDSERVER = 56;
pub const PRODUCT_SOLUTION_EMBEDDEDSERVER_CORE = 57;
pub const PRODUCT_PROFESSIONAL_EMBEDDED = 58;
pub const PRODUCT_ESSENTIALBUSINESS_SERVER_MGMT = 59;
pub const PRODUCT_ESSENTIALBUSINESS_SERVER_ADDL = 60;
pub const PRODUCT_ESSENTIALBUSINESS_SERVER_MGMTSVC = 61;
pub const PRODUCT_ESSENTIALBUSINESS_SERVER_ADDLSVC = 62;
pub const PRODUCT_SMALLBUSINESS_SERVER_PREMIUM_CORE = 63;
pub const PRODUCT_CLUSTER_SERVER_V = 64;
pub const PRODUCT_EMBEDDED = 65;
pub const PRODUCT_STARTER_E = 66;
pub const PRODUCT_HOME_BASIC_E = 67;
pub const PRODUCT_HOME_PREMIUM_E = 68;
pub const PRODUCT_PROFESSIONAL_E = 69;
pub const PRODUCT_ENTERPRISE_E = 70;
pub const PRODUCT_ULTIMATE_E = 71;
pub const PRODUCT_ENTERPRISE_EVALUATION = 72;
pub const PRODUCT_MULTIPOINT_STANDARD_SERVER = 76;
pub const PRODUCT_MULTIPOINT_PREMIUM_SERVER = 77;
pub const PRODUCT_STANDARD_EVALUATION_SERVER = 79;
pub const PRODUCT_DATACENTER_EVALUATION_SERVER = 80;
pub const PRODUCT_ENTERPRISE_N_EVALUATION = 84;
pub const PRODUCT_EMBEDDED_AUTOMOTIVE = 85;
pub const PRODUCT_EMBEDDED_INDUSTRY_A = 86;
pub const PRODUCT_THINPC = 87;
pub const PRODUCT_EMBEDDED_A = 88;
pub const PRODUCT_EMBEDDED_INDUSTRY = 89;
pub const PRODUCT_EMBEDDED_E = 90;
pub const PRODUCT_EMBEDDED_INDUSTRY_E = 91;
pub const PRODUCT_EMBEDDED_INDUSTRY_A_E = 92;
pub const PRODUCT_STORAGE_WORKGROUP_EVALUATION_SERVER = 95;
pub const PRODUCT_STORAGE_STANDARD_EVALUATION_SERVER = 96;
pub const PRODUCT_CORE_ARM = 97;
pub const PRODUCT_CORE_N = 98;
pub const PRODUCT_CORE_COUNTRYSPECIFIC = 99;
pub const PRODUCT_CORE_SINGLELANGUAGE = 100;
pub const PRODUCT_CORE = 101;
pub const PRODUCT_PROFESSIONAL_WMC = 103;
pub const PRODUCT_EMBEDDED_INDUSTRY_EVAL = 105;
pub const PRODUCT_EMBEDDED_INDUSTRY_E_EVAL = 106;
pub const PRODUCT_EMBEDDED_EVAL = 107;
pub const PRODUCT_EMBEDDED_E_EVAL = 108;
pub const PRODUCT_NANO_SERVER = 109;
pub const PRODUCT_CLOUD_STORAGE_SERVER = 110;
pub const PRODUCT_CORE_CONNECTED = 111;
pub const PRODUCT_PROFESSIONAL_STUDENT = 112;
pub const PRODUCT_CORE_CONNECTED_N = 113;
pub const PRODUCT_PROFESSIONAL_STUDENT_N = 114;
pub const PRODUCT_CORE_CONNECTED_SINGLELANGUAGE = 115;
pub const PRODUCT_CORE_CONNECTED_COUNTRYSPECIFIC = 116;
pub const PRODUCT_CONNECTED_CAR = 117;
pub const PRODUCT_INDUSTRY_HANDHELD = 118;
pub const PRODUCT_PPI_PRO = 119;
pub const PRODUCT_ARM64_SERVER = 120;
pub const PRODUCT_EDUCATION = 121;
pub const PRODUCT_EDUCATION_N = 122;
pub const PRODUCT_IOTUAP = 123;
pub const PRODUCT_CLOUD_HOST_INFRASTRUCTURE_SERVER = 124;
pub const PRODUCT_ENTERPRISE_S = 125;
pub const PRODUCT_ENTERPRISE_S_N = 126;
pub const PRODUCT_PROFESSIONAL_S = 127;
pub const PRODUCT_PROFESSIONAL_S_N = 128;
pub const PRODUCT_ENTERPRISE_S_EVALUATION = 129;
pub const PRODUCT_ENTERPRISE_S_N_EVALUATION = 130;
pub const PRODUCT_HOLOGRAPHIC = 135;
pub const PRODUCT_HOLOGRAPHIC_BUSINESS = 136;
pub const PRODUCT_PRO_SINGLE_LANGUAGE = 138;
pub const PRODUCT_PRO_CHINA = 139;
pub const PRODUCT_ENTERPRISE_SUBSCRIPTION = 140;
pub const PRODUCT_ENTERPRISE_SUBSCRIPTION_N = 141;
pub const PRODUCT_DATACENTER_NANO_SERVER = 143;
pub const PRODUCT_STANDARD_NANO_SERVER = 144;
pub const PRODUCT_DATACENTER_A_SERVER_CORE = 145;
pub const PRODUCT_STANDARD_A_SERVER_CORE = 146;
pub const PRODUCT_DATACENTER_WS_SERVER_CORE = 147;
pub const PRODUCT_STANDARD_WS_SERVER_CORE = 148;
pub const PRODUCT_UTILITY_VM = 149;
pub const PRODUCT_DATACENTER_EVALUATION_SERVER_CORE = 159;
pub const PRODUCT_STANDARD_EVALUATION_SERVER_CORE = 160;
pub const PRODUCT_PRO_WORKSTATION = 161;
pub const PRODUCT_PRO_WORKSTATION_N = 162;
pub const PRODUCT_PRO_FOR_EDUCATION = 164;
pub const PRODUCT_PRO_FOR_EDUCATION_N = 165;
pub const PRODUCT_AZURE_SERVER_CORE = 168;
pub const PRODUCT_AZURE_NANO_SERVER = 169;
pub const PRODUCT_ENTERPRISEG = 171;
pub const PRODUCT_ENTERPRISEGN = 172;
pub const PRODUCT_SERVERRDSH = 175;
pub const PRODUCT_CLOUD = 178;
pub const PRODUCT_CLOUDN = 179;
pub const PRODUCT_HUBOS = 180;
pub const PRODUCT_ONECOREUPDATEOS = 182;
pub const PRODUCT_CLOUDE = 183;
pub const PRODUCT_IOTOS = 185;
pub const PRODUCT_CLOUDEN = 186;
pub const PRODUCT_IOTEDGEOS = 187;
pub const PRODUCT_IOTENTERPRISE = 188;
pub const PRODUCT_LITE = 189;
pub const PRODUCT_IOTENTERPRISES = 191;
pub const PRODUCT_XBOX_SYSTEMOS = 192;
pub const PRODUCT_XBOX_GAMEOS = 194;
pub const PRODUCT_XBOX_ERAOS = 195;
pub const PRODUCT_XBOX_DURANGOHOSTOS = 196;
pub const PRODUCT_XBOX_SCARLETTHOSTOS = 197;
pub const PRODUCT_XBOX_KEYSTONE = 198;
pub const PRODUCT_AZURE_SERVER_CLOUDHOST = 199;
pub const PRODUCT_AZURE_SERVER_CLOUDMOS = 200;
pub const PRODUCT_CLOUDEDITIONN = 202;
pub const PRODUCT_CLOUDEDITION = 203;
pub const PRODUCT_VALIDATION = 204;
pub const PRODUCT_IOTENTERPRISESK = 205;
pub const PRODUCT_IOTENTERPRISEK = 206;
pub const PRODUCT_IOTENTERPRISESEVAL = 207;
pub const PRODUCT_AZURE_SERVER_AGENTBRIDGE = 208;
pub const PRODUCT_AZURE_SERVER_NANOHOST = 209;
pub const PRODUCT_WNC = 210;
pub const PRODUCT_AZURESTACKHCI_SERVER_CORE = 406;
pub const PRODUCT_DATACENTER_SERVER_AZURE_EDITION = 407;
pub const PRODUCT_DATACENTER_SERVER_CORE_AZURE_EDITION = 408;
pub const PRODUCT_DATACENTER_WS_SERVER_CORE_AZURE_EDITION = 409;
pub const PRODUCT_UNLICENSED = 2882382797;
pub const DEVICEFAMILYINFOENUM_UAP = 0;
pub const DEVICEFAMILYINFOENUM_WINDOWS_8X = 1;
pub const DEVICEFAMILYINFOENUM_WINDOWS_PHONE_8X = 2;
pub const DEVICEFAMILYINFOENUM_DESKTOP = 3;
pub const DEVICEFAMILYINFOENUM_MOBILE = 4;
pub const DEVICEFAMILYINFOENUM_XBOX = 5;
pub const DEVICEFAMILYINFOENUM_TEAM = 6;
pub const DEVICEFAMILYINFOENUM_IOT = 7;
pub const DEVICEFAMILYINFOENUM_IOT_HEADLESS = 8;
pub const DEVICEFAMILYINFOENUM_SERVER = 9;
pub const DEVICEFAMILYINFOENUM_HOLOGRAPHIC = 10;
pub const DEVICEFAMILYINFOENUM_XBOXSRA = 11;
pub const DEVICEFAMILYINFOENUM_XBOXERA = 12;
pub const DEVICEFAMILYINFOENUM_SERVER_NANO = 13;
pub const DEVICEFAMILYINFOENUM_8828080 = 14;
pub const DEVICEFAMILYINFOENUM_7067329 = 15;
pub const DEVICEFAMILYINFOENUM_WINDOWS_CORE = 16;
pub const DEVICEFAMILYINFOENUM_WINDOWS_CORE_HEADLESS = 17;
pub const DEVICEFAMILYINFOENUM_MAX = 17;
pub const DEVICEFAMILYDEVICEFORM_UNKNOWN = 0;
pub const DEVICEFAMILYDEVICEFORM_PHONE = 1;
pub const DEVICEFAMILYDEVICEFORM_TABLET = 2;
pub const DEVICEFAMILYDEVICEFORM_DESKTOP = 3;
pub const DEVICEFAMILYDEVICEFORM_NOTEBOOK = 4;
pub const DEVICEFAMILYDEVICEFORM_CONVERTIBLE = 5;
pub const DEVICEFAMILYDEVICEFORM_DETACHABLE = 6;
pub const DEVICEFAMILYDEVICEFORM_ALLINONE = 7;
pub const DEVICEFAMILYDEVICEFORM_STICKPC = 8;
pub const DEVICEFAMILYDEVICEFORM_PUCK = 9;
pub const DEVICEFAMILYDEVICEFORM_LARGESCREEN = 10;
pub const DEVICEFAMILYDEVICEFORM_HMD = 11;
pub const DEVICEFAMILYDEVICEFORM_INDUSTRY_HANDHELD = 12;
pub const DEVICEFAMILYDEVICEFORM_INDUSTRY_TABLET = 13;
pub const DEVICEFAMILYDEVICEFORM_BANKING = 14;
pub const DEVICEFAMILYDEVICEFORM_BUILDING_AUTOMATION = 15;
pub const DEVICEFAMILYDEVICEFORM_DIGITAL_SIGNAGE = 16;
pub const DEVICEFAMILYDEVICEFORM_GAMING = 17;
pub const DEVICEFAMILYDEVICEFORM_HOME_AUTOMATION = 18;
pub const DEVICEFAMILYDEVICEFORM_INDUSTRIAL_AUTOMATION = 19;
pub const DEVICEFAMILYDEVICEFORM_KIOSK = 20;
pub const DEVICEFAMILYDEVICEFORM_MAKER_BOARD = 21;
pub const DEVICEFAMILYDEVICEFORM_MEDICAL = 22;
pub const DEVICEFAMILYDEVICEFORM_NETWORKING = 23;
pub const DEVICEFAMILYDEVICEFORM_POINT_OF_SERVICE = 24;
pub const DEVICEFAMILYDEVICEFORM_PRINTING = 25;
pub const DEVICEFAMILYDEVICEFORM_THIN_CLIENT = 26;
pub const DEVICEFAMILYDEVICEFORM_TOY = 27;
pub const DEVICEFAMILYDEVICEFORM_VENDING = 28;
pub const DEVICEFAMILYDEVICEFORM_INDUSTRY_OTHER = 29;
pub const DEVICEFAMILYDEVICEFORM_XBOX_ONE = 30;
pub const DEVICEFAMILYDEVICEFORM_XBOX_ONE_S = 31;
pub const DEVICEFAMILYDEVICEFORM_XBOX_ONE_X = 32;
pub const DEVICEFAMILYDEVICEFORM_XBOX_ONE_X_DEVKIT = 33;
pub const DEVICEFAMILYDEVICEFORM_XBOX_SERIES_X = 34;
pub const DEVICEFAMILYDEVICEFORM_XBOX_SERIES_X_DEVKIT = 35;
pub const DEVICEFAMILYDEVICEFORM_XBOX_SERIES_S = 36;
pub const DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_01 = 37;
pub const DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_02 = 38;
pub const DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_03 = 39;
pub const DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_04 = 40;
pub const DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_05 = 41;
pub const DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_06 = 42;
pub const DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_07 = 43;
pub const DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_08 = 44;
pub const DEVICEFAMILYDEVICEFORM_XBOX_RESERVED_09 = 45;
pub const DEVICEFAMILYDEVICEFORM_GAMING_HANDHELD = 46;
pub const DEVICEFAMILYDEVICEFORM_GAMING_CONSOLE = 47;
pub const DEVICEFAMILYDEVICEFORM_MAX = 47;
pub const NTDDI_WIN2K = 83886080;
pub const NTDDI_WINXP = 83951616;
pub const NTDDI_WINXPSP2 = 83952128;
pub const NTDDI_WS03SP1 = 84017408;
pub const NTDDI_VISTA = 100663296;
pub const NTDDI_VISTASP1 = 100663552;
pub const NTDDI_WIN7 = 100728832;
pub const NTDDI_WIN8 = 100794368;
pub const NTDDI_WINBLUE = 100859904;
pub const NTDDI_WINTHRESHOLD = 167772160;
pub const SYSTEM_CPU_SET_INFORMATION_PARKED = 1;
pub const SYSTEM_CPU_SET_INFORMATION_ALLOCATED = 2;
pub const SYSTEM_CPU_SET_INFORMATION_ALLOCATED_TO_TARGET_PROCESS = 4;
pub const SYSTEM_CPU_SET_INFORMATION_REALTIME = 8;
pub const _WIN32_WINNT_NT4 = 1024;
pub const _WIN32_WINNT_WIN2K = 1280;
pub const _WIN32_WINNT_WINXP = 1281;
pub const _WIN32_WINNT_WS03 = 1282;
pub const _WIN32_WINNT_WIN6 = 1536;
pub const _WIN32_WINNT_VISTA = 1536;
pub const _WIN32_WINNT_WS08 = 1536;
pub const _WIN32_WINNT_LONGHORN = 1536;
pub const _WIN32_WINNT_WIN7 = 1537;
pub const _WIN32_WINNT_WIN8 = 1538;
pub const _WIN32_WINNT_WINBLUE = 1539;
pub const _WIN32_WINNT_WINTHRESHOLD = 2560;
pub const _WIN32_WINNT_WIN10 = 2560;
pub const _WIN32_IE_IE20 = 512;
pub const _WIN32_IE_IE30 = 768;
pub const _WIN32_IE_IE302 = 770;
pub const _WIN32_IE_IE40 = 1024;
pub const _WIN32_IE_IE401 = 1025;
pub const _WIN32_IE_IE50 = 1280;
pub const _WIN32_IE_IE501 = 1281;
pub const _WIN32_IE_IE55 = 1360;
pub const _WIN32_IE_IE60 = 1536;
pub const _WIN32_IE_IE60SP1 = 1537;
pub const _WIN32_IE_IE60SP2 = 1539;
pub const _WIN32_IE_IE70 = 1792;
pub const _WIN32_IE_IE80 = 2048;
pub const _WIN32_IE_IE90 = 2304;
pub const _WIN32_IE_IE100 = 2560;
pub const _WIN32_IE_IE110 = 2560;
pub const _WIN32_IE_NT4 = 512;
pub const _WIN32_IE_NT4SP1 = 512;
pub const _WIN32_IE_NT4SP2 = 512;
pub const _WIN32_IE_NT4SP3 = 770;
pub const _WIN32_IE_NT4SP4 = 1025;
pub const _WIN32_IE_NT4SP5 = 1025;
pub const _WIN32_IE_NT4SP6 = 1280;
pub const _WIN32_IE_WIN98 = 1025;
pub const _WIN32_IE_WIN98SE = 1280;
pub const _WIN32_IE_WINME = 1360;
pub const _WIN32_IE_WIN2K = 1281;
pub const _WIN32_IE_WIN2KSP1 = 1281;
pub const _WIN32_IE_WIN2KSP2 = 1281;
pub const _WIN32_IE_WIN2KSP3 = 1281;
pub const _WIN32_IE_WIN2KSP4 = 1281;
pub const _WIN32_IE_XP = 1536;
pub const _WIN32_IE_XPSP1 = 1537;
pub const _WIN32_IE_XPSP2 = 1539;
pub const _WIN32_IE_WS03 = 1538;
pub const _WIN32_IE_WS03SP1 = 1539;
pub const _WIN32_IE_WIN6 = 1792;
pub const _WIN32_IE_LONGHORN = 1792;
pub const _WIN32_IE_WIN7 = 2048;
pub const _WIN32_IE_WIN8 = 2560;
pub const _WIN32_IE_WINBLUE = 2560;
pub const _WIN32_IE_WINTHRESHOLD = 2560;
pub const _WIN32_IE_WIN10 = 2560;
pub const NTDDI_WIN4 = 67108864;
pub const NTDDI_WIN2KSP1 = 83886336;
pub const NTDDI_WIN2KSP2 = 83886592;
pub const NTDDI_WIN2KSP3 = 83886848;
pub const NTDDI_WIN2KSP4 = 83887104;
pub const NTDDI_WINXPSP1 = 83951872;
pub const NTDDI_WINXPSP3 = 83952384;
pub const NTDDI_WINXPSP4 = 83952640;
pub const NTDDI_WS03 = 84017152;
pub const NTDDI_WS03SP2 = 84017664;
pub const NTDDI_WS03SP3 = 84017920;
pub const NTDDI_WS03SP4 = 84018176;
pub const NTDDI_WIN6 = 100663296;
pub const NTDDI_WIN6SP1 = 100663552;
pub const NTDDI_WIN6SP2 = 100663808;
pub const NTDDI_WIN6SP3 = 100664064;
pub const NTDDI_WIN6SP4 = 100664320;
pub const NTDDI_VISTASP2 = 100663808;
pub const NTDDI_VISTASP3 = 100664064;
pub const NTDDI_VISTASP4 = 100664320;
pub const NTDDI_LONGHORN = 100663296;
pub const NTDDI_WS08 = 100663552;
pub const NTDDI_WS08SP2 = 100663808;
pub const NTDDI_WS08SP3 = 100664064;
pub const NTDDI_WS08SP4 = 100664320;
pub const NTDDI_WIN10 = 167772160;
pub const NTDDI_WIN10_TH2 = 167772161;
pub const NTDDI_WIN10_RS1 = 167772162;
pub const NTDDI_WIN10_RS2 = 167772163;
pub const NTDDI_WIN10_RS3 = 167772164;
pub const NTDDI_WIN10_RS4 = 167772165;
pub const NTDDI_WIN10_RS5 = 167772166;
pub const NTDDI_WIN10_19H1 = 167772167;
pub const NTDDI_WIN10_VB = 167772168;
pub const NTDDI_WIN10_MN = 167772169;
pub const NTDDI_WIN10_FE = 167772170;
pub const NTDDI_WIN10_CO = 167772171;
pub const NTDDI_WIN10_NI = 167772172;
pub const NTDDI_WIN10_CU = 167772173;
pub const NTDDI_WIN11_ZN = 167772174;
pub const NTDDI_WIN11_GA = 167772175;
pub const NTDDI_WIN11_GE = 167772176;
pub const WDK_NTDDI_VERSION = 167772176;
pub const OSVERSION_MASK = 4294901760;
pub const SPVERSION_MASK = 65280;
pub const SUBVERSION_MASK = 255;
pub const NTDDI_VERSION = 167772176;
pub const SCEX2_ALT_NETBIOS_NAME = 1;
pub const ComputerNameNetBIOS = 0;
pub const ComputerNameDnsHostname = 1;
pub const ComputerNameDnsDomain = 2;
pub const ComputerNameDnsFullyQualified = 3;
pub const ComputerNamePhysicalNetBIOS = 4;
pub const ComputerNamePhysicalDnsHostname = 5;
pub const ComputerNamePhysicalDnsDomain = 6;
pub const ComputerNamePhysicalDnsFullyQualified = 7;
pub const ComputerNameMax = 8;
pub const DeveloperDriveEnablementStateError = 0;
pub const DeveloperDriveEnabled = 1;
pub const DeveloperDriveDisabledBySystemPolicy = 2;
pub const DeveloperDriveDisabledByGroupPolicy = 3;
pub const FirmwareTypeUnknown = 0;
pub const FirmwareTypeBios = 1;
pub const FirmwareTypeUefi = 2;
pub const FirmwareTypeMax = 3;
pub const RelationProcessorCore = 0;
pub const RelationNumaNode = 1;
pub const RelationCache = 2;
pub const RelationProcessorPackage = 3;
pub const RelationGroup = 4;
pub const RelationProcessorDie = 5;
pub const RelationNumaNodeEx = 6;
pub const RelationProcessorModule = 7;
pub const RelationAll = 65535;
pub const CacheUnified = 0;
pub const CacheInstruction = 1;
pub const CacheData = 2;
pub const CacheTrace = 3;
pub const CacheUnknown = 4;
pub const CpuSetInformation = 0;
pub const OS_DEPLOYMENT_STANDARD = 1;
pub const OS_DEPLOYMENT_COMPACT = 2;
pub const GlobalDataIdUnknown = 0;
pub const GlobalDataIdRngSeedVersion = 1;
pub const GlobalDataIdInterruptTime = 2;
pub const GlobalDataIdTimeZoneBias = 3;
pub const GlobalDataIdImageNumberLow = 4;
pub const GlobalDataIdImageNumberHigh = 5;
pub const GlobalDataIdTimeZoneId = 6;
pub const GlobalDataIdNtMajorVersion = 7;
pub const GlobalDataIdNtMinorVersion = 8;
pub const GlobalDataIdSystemExpirationDate = 9;
pub const GlobalDataIdKdDebuggerEnabled = 10;
pub const GlobalDataIdCyclesPerYield = 11;
pub const GlobalDataIdSafeBootMode = 12;
pub const GlobalDataIdLastSystemRITEventTickCount = 13;
pub const GlobalDataIdConsoleSharedDataFlags = 14;
pub const GlobalDataIdNtSystemRootDrive = 15;
pub const GlobalDataIdQpcBypassEnabled = 16;
pub const GlobalDataIdQpcData = 17;
pub const GlobalDataIdQpcBias = 18;
pub const DEPPolicyAlwaysOff = 0;
pub const DEPPolicyAlwaysOn = 1;
pub const DEPPolicyOptIn = 2;
pub const DEPPolicyOptOut = 3;
pub const DEPTotalPolicyCount = 4;

pub const aliases = struct {
    pub const VER_FLAGS = u32;
    pub const IMAGE_FILE_MACHINE = u16;
    pub const PROCESSOR_ARCHITECTURE = u16;
    pub const FIRMWARE_TABLE_PROVIDER = u32;
    pub const USER_CET_ENVIRONMENT = u32;
    pub const OS_PRODUCT_TYPE = u32;
    pub const DEVICEFAMILYINFOENUM = u32;
    pub const DEVICEFAMILYDEVICEFORM = u32;
    pub const COMPUTER_NAME_FORMAT = i32;
    pub const DEVELOPER_DRIVE_ENABLEMENT_STATE = i32;
    pub const FIRMWARE_TYPE = i32;
    pub const LOGICAL_PROCESSOR_RELATIONSHIP = i32;
    pub const PROCESSOR_CACHE_TYPE = i32;
    pub const CPU_SET_INFORMATION_TYPE = i32;
    pub const OS_DEPLOYEMENT_STATE_VALUES = i32;
    pub const RTL_SYSTEM_GLOBAL_DATA_ID = i32;
    pub const DEP_SYSTEM_POLICY_TYPE = i32;
    pub const PGET_SYSTEM_WOW64_DIRECTORY_A = ?*const anyopaque;
    pub const PGET_SYSTEM_WOW64_DIRECTORY_W = ?*const anyopaque;
};
