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
    .{ "GetCurrentPackageId", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentPackageId", .signature = "\x00\x02\x11\x81\x01\x0f\x09\x0f\x05" } },
    .{ "GetCurrentPackageFullName", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentPackageFullName", .signature = "\x00\x02\x11\x81\x01\x0f\x09\x11\x05" } },
    .{ "GetCurrentPackageFamilyName", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentPackageFamilyName", .signature = "\x00\x02\x11\x81\x01\x0f\x09\x11\x05" } },
    .{ "GetCurrentPackagePath", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentPackagePath", .signature = "\x00\x02\x11\x81\x01\x0f\x09\x11\x05" } },
    .{ "GetPackageId", MethodRecord{ .library = "KERNEL32", .import = "GetPackageId", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x0f\x09\x0f\x05" } },
    .{ "GetPackageFullName", MethodRecord{ .library = "KERNEL32", .import = "GetPackageFullName", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x0f\x09\x11\x05" } },
    .{ "GetPackageFullNameFromToken", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-1", .import = "GetPackageFullNameFromToken", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x0f\x09\x11\x05" } },
    .{ "GetPackageFamilyName", MethodRecord{ .library = "KERNEL32", .import = "GetPackageFamilyName", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x0f\x09\x11\x05" } },
    .{ "GetPackageFamilyNameFromToken", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-1", .import = "GetPackageFamilyNameFromToken", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x0f\x09\x11\x05" } },
    .{ "GetPackagePath", MethodRecord{ .library = "KERNEL32", .import = "GetPackagePath", .signature = "\x00\x04\x11\x81\x01\x0f\x11\x81\x05\x09\x0f\x09\x11\x05" } },
    .{ "GetPackagePathByFullName", MethodRecord{ .library = "KERNEL32", .import = "GetPackagePathByFullName", .signature = "\x00\x03\x11\x81\x01\x11\x05\x0f\x09\x11\x05" } },
    .{ "GetStagedPackagePathByFullName", MethodRecord{ .library = "KERNEL32", .import = "GetStagedPackagePathByFullName", .signature = "\x00\x03\x11\x81\x01\x11\x05\x0f\x09\x11\x05" } },
    .{ "GetPackagePathByFullName2", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-3", .import = "GetPackagePathByFullName2", .signature = "\x00\x04\x11\x81\x01\x11\x05\x11\x81\x09\x0f\x09\x11\x05" } },
    .{ "GetStagedPackagePathByFullName2", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-3", .import = "GetStagedPackagePathByFullName2", .signature = "\x00\x04\x11\x81\x01\x11\x05\x11\x81\x09\x0f\x09\x11\x05" } },
    .{ "GetCurrentPackageInfo2", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-3", .import = "GetCurrentPackageInfo2", .signature = "\x00\x05\x11\x81\x01\x09\x11\x81\x09\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "GetCurrentPackagePath2", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-3", .import = "GetCurrentPackagePath2", .signature = "\x00\x03\x11\x81\x01\x11\x81\x09\x0f\x09\x11\x05" } },
    .{ "GetCurrentApplicationUserModelId", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentApplicationUserModelId", .signature = "\x00\x02\x11\x81\x01\x0f\x09\x11\x05" } },
    .{ "GetApplicationUserModelId", MethodRecord{ .library = "KERNEL32", .import = "GetApplicationUserModelId", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x0f\x09\x11\x05" } },
    .{ "GetApplicationUserModelIdFromToken", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-1", .import = "GetApplicationUserModelIdFromToken", .signature = "\x00\x03\x11\x81\x01\x11\x80\x85\x0f\x09\x11\x05" } },
    .{ "VerifyPackageFullName", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-1", .import = "VerifyPackageFullName", .signature = "\x00\x01\x11\x81\x01\x11\x05" } },
    .{ "VerifyPackageFamilyName", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-1", .import = "VerifyPackageFamilyName", .signature = "\x00\x01\x11\x81\x01\x11\x05" } },
    .{ "VerifyPackageId", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-1", .import = "VerifyPackageId", .signature = "\x00\x01\x11\x81\x01\x0f\x11\x81\x05" } },
    .{ "VerifyApplicationUserModelId", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-1", .import = "VerifyApplicationUserModelId", .signature = "\x00\x01\x11\x81\x01\x11\x05" } },
    .{ "VerifyPackageRelativeApplicationId", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-1", .import = "VerifyPackageRelativeApplicationId", .signature = "\x00\x01\x11\x81\x01\x11\x05" } },
    .{ "PackageIdFromFullName", MethodRecord{ .library = "KERNEL32", .import = "PackageIdFromFullName", .signature = "\x00\x04\x11\x81\x01\x11\x05\x09\x0f\x09\x0f\x05" } },
    .{ "PackageFullNameFromId", MethodRecord{ .library = "KERNEL32", .import = "PackageFullNameFromId", .signature = "\x00\x03\x11\x81\x01\x0f\x11\x81\x05\x0f\x09\x11\x05" } },
    .{ "PackageFamilyNameFromId", MethodRecord{ .library = "KERNEL32", .import = "PackageFamilyNameFromId", .signature = "\x00\x03\x11\x81\x01\x0f\x11\x81\x05\x0f\x09\x11\x05" } },
    .{ "PackageFamilyNameFromFullName", MethodRecord{ .library = "KERNEL32", .import = "PackageFamilyNameFromFullName", .signature = "\x00\x03\x11\x81\x01\x11\x05\x0f\x09\x11\x05" } },
    .{ "PackageNameAndPublisherIdFromFamilyName", MethodRecord{ .library = "KERNEL32", .import = "PackageNameAndPublisherIdFromFamilyName", .signature = "\x00\x05\x11\x81\x01\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "FormatApplicationUserModelId", MethodRecord{ .library = "KERNEL32", .import = "FormatApplicationUserModelId", .signature = "\x00\x04\x11\x81\x01\x11\x05\x11\x05\x0f\x09\x11\x05" } },
    .{ "ParseApplicationUserModelId", MethodRecord{ .library = "KERNEL32", .import = "ParseApplicationUserModelId", .signature = "\x00\x05\x11\x81\x01\x11\x05\x0f\x09\x11\x05\x0f\x09\x11\x05" } },
    .{ "GetPackagesByPackageFamily", MethodRecord{ .library = "KERNEL32", .import = "GetPackagesByPackageFamily", .signature = "\x00\x05\x11\x81\x01\x11\x05\x0f\x09\x0f\x11\x05\x0f\x09\x11\x05" } },
    .{ "FindPackagesByPackageFamily", MethodRecord{ .library = "KERNEL32", .import = "FindPackagesByPackageFamily", .signature = "\x00\x07\x11\x81\x01\x11\x05\x09\x0f\x09\x0f\x11\x05\x0f\x09\x11\x05\x0f\x09" } },
    .{ "GetStagedPackageOrigin", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-1", .import = "GetStagedPackageOrigin", .signature = "\x00\x02\x11\x81\x01\x11\x05\x0f\x11\x81\x0d" } },
    .{ "GetCurrentPackageInfo", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentPackageInfo", .signature = "\x00\x04\x11\x81\x01\x09\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "OpenPackageInfoByFullName", MethodRecord{ .library = "KERNEL32", .import = "OpenPackageInfoByFullName", .signature = "\x00\x03\x11\x81\x01\x11\x05\x09\x0f\x0f\x11\x81\x11" } },
    .{ "OpenPackageInfoByFullNameForUser", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-1", .import = "OpenPackageInfoByFullNameForUser", .signature = "\x00\x04\x11\x81\x01\x11\x81\x15\x11\x05\x09\x0f\x0f\x11\x81\x11" } },
    .{ "ClosePackageInfo", MethodRecord{ .library = "KERNEL32", .import = "ClosePackageInfo", .signature = "\x00\x01\x11\x81\x01\x0f\x11\x81\x11" } },
    .{ "GetPackageInfo", MethodRecord{ .library = "KERNEL32", .import = "GetPackageInfo", .signature = "\x00\x05\x11\x81\x01\x0f\x11\x81\x11\x09\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "GetPackageApplicationIds", MethodRecord{ .library = "KERNEL32", .import = "GetPackageApplicationIds", .signature = "\x00\x04\x11\x81\x01\x0f\x11\x81\x11\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "GetPackageInfo2", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-3", .import = "GetPackageInfo2", .signature = "\x00\x06\x11\x81\x01\x0f\x11\x81\x11\x09\x11\x81\x09\x0f\x09\x0f\x05\x0f\x09" } },
    .{ "CheckIsMSIXPackage", MethodRecord{ .library = "KERNEL32", .import = "CheckIsMSIXPackage", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x59" } },
    .{ "TryCreatePackageDependency", MethodRecord{ .library = "KERNELBASE", .import = "TryCreatePackageDependency", .signature = "\x00\x08\x11\x79\x11\x81\x15\x11\x05\x11\x81\x19\x11\x81\x1d\x11\x81\x21\x11\x05\x11\x81\x25\x0f\x11\x05" } },
    .{ "TryCreatePackageDependency2", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-7", .import = "TryCreatePackageDependency2", .signature = "\x00\x09\x11\x79\x11\x81\x15\x11\x05\x11\x81\x19\x11\x81\x1d\x11\x81\x21\x11\x05\x11\x81\x25\x0f\x11\x80\x9d\x0f\x11\x05" } },
    .{ "DeletePackageDependency", MethodRecord{ .library = "KERNELBASE", .import = "DeletePackageDependency", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "AddPackageDependency", MethodRecord{ .library = "KERNELBASE", .import = "AddPackageDependency", .signature = "\x00\x05\x11\x79\x11\x05\x08\x11\x81\x29\x0f\x11\x81\x2d\x0f\x11\x05" } },
    .{ "AddPackageDependency2", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-7", .import = "AddPackageDependency2", .signature = "\x00\x05\x11\x79\x11\x05\x08\x11\x81\x31\x0f\x11\x81\x2d\x0f\x11\x05" } },
    .{ "RemovePackageDependency", MethodRecord{ .library = "KERNELBASE", .import = "RemovePackageDependency", .signature = "\x00\x01\x11\x79\x11\x81\x2d" } },
    .{ "GetResolvedPackageFullNameForPackageDependency", MethodRecord{ .library = "KERNELBASE", .import = "GetResolvedPackageFullNameForPackageDependency", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "GetResolvedPackageFullNameForPackageDependency2", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-7", .import = "GetResolvedPackageFullNameForPackageDependency2", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "GetIdForPackageDependencyContext", MethodRecord{ .library = "KERNELBASE", .import = "GetIdForPackageDependencyContext", .signature = "\x00\x02\x11\x79\x11\x81\x2d\x0f\x11\x05" } },
    .{ "GetPackageGraphRevisionId", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-6", .import = "GetPackageGraphRevisionId", .signature = "\x00\x00\x09" } },
    .{ "FindPackageDependency", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-7", .import = "FindPackageDependency", .signature = "\x00\x03\x11\x79\x0f\x11\x81\x35\x0f\x09\x0f\x0f\x11\x05" } },
    .{ "GetPackageDependencyInformation", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-7", .import = "GetPackageDependencyInformation", .signature = "\x00\x09\x11\x79\x11\x05\x0f\x11\x81\x15\x0f\x11\x05\x0f\x11\x81\x19\x0f\x11\x81\x1d\x0f\x11\x81\x21\x0f\x11\x05\x0f\x11\x81\x25\x0f\x11\x80\x9d" } },
    .{ "GetProcessesUsingPackageDependency", MethodRecord{ .library = "api-ms-win-appmodel-runtime-l1-1-7", .import = "GetProcessesUsingPackageDependency", .signature = "\x00\x05\x11\x79\x11\x05\x11\x81\x15\x11\x59\x0f\x09\x0f\x0f\x09" } },
    .{ "AppPolicyGetLifecycleManagement", MethodRecord{ .library = "KERNEL32", .import = "AppPolicyGetLifecycleManagement", .signature = "\x00\x02\x11\x81\x01\x11\x80\x85\x0f\x11\x81\x39" } },
    .{ "AppPolicyGetWindowingModel", MethodRecord{ .library = "KERNEL32", .import = "AppPolicyGetWindowingModel", .signature = "\x00\x02\x11\x81\x01\x11\x80\x85\x0f\x11\x81\x3d" } },
    .{ "AppPolicyGetMediaFoundationCodecLoading", MethodRecord{ .library = "KERNEL32", .import = "AppPolicyGetMediaFoundationCodecLoading", .signature = "\x00\x02\x11\x81\x01\x11\x80\x85\x0f\x11\x81\x41" } },
    .{ "AppPolicyGetClrCompat", MethodRecord{ .library = "KERNEL32", .import = "AppPolicyGetClrCompat", .signature = "\x00\x02\x11\x81\x01\x11\x80\x85\x0f\x11\x81\x45" } },
    .{ "AppPolicyGetThreadInitializationType", MethodRecord{ .library = "KERNEL32", .import = "AppPolicyGetThreadInitializationType", .signature = "\x00\x02\x11\x81\x01\x11\x80\x85\x0f\x11\x81\x49" } },
    .{ "AppPolicyGetShowDeveloperDiagnostic", MethodRecord{ .library = "KERNEL32", .import = "AppPolicyGetShowDeveloperDiagnostic", .signature = "\x00\x02\x11\x81\x01\x11\x80\x85\x0f\x11\x81\x4d" } },
    .{ "AppPolicyGetProcessTerminationMethod", MethodRecord{ .library = "KERNEL32", .import = "AppPolicyGetProcessTerminationMethod", .signature = "\x00\x02\x11\x81\x01\x11\x80\x85\x0f\x11\x81\x51" } },
    .{ "AppPolicyGetCreateFileAccess", MethodRecord{ .library = "KERNEL32", .import = "AppPolicyGetCreateFileAccess", .signature = "\x00\x02\x11\x81\x01\x11\x80\x85\x0f\x11\x81\x55" } },
    .{ "CreatePackageVirtualizationContext", MethodRecord{ .library = "KERNEL32", .import = "CreatePackageVirtualizationContext", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x81\x59" } },
    .{ "ActivatePackageVirtualizationContext", MethodRecord{ .library = "KERNEL32", .import = "ActivatePackageVirtualizationContext", .signature = "\x00\x02\x11\x79\x11\x81\x59\x0f\x19" } },
    .{ "ReleasePackageVirtualizationContext", MethodRecord{ .library = "KERNEL32", .import = "ReleasePackageVirtualizationContext", .signature = "\x00\x01\x01\x11\x81\x59" } },
    .{ "DeactivatePackageVirtualizationContext", MethodRecord{ .library = "KERNEL32", .import = "DeactivatePackageVirtualizationContext", .signature = "\x00\x01\x01\x19" } },
    .{ "DuplicatePackageVirtualizationContext", MethodRecord{ .library = "KERNEL32", .import = "DuplicatePackageVirtualizationContext", .signature = "\x00\x02\x11\x79\x11\x81\x59\x0f\x11\x81\x59" } },
    .{ "GetCurrentPackageVirtualizationContext", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentPackageVirtualizationContext", .signature = "\x00\x00\x11\x81\x59" } },
    .{ "GetProcessesInVirtualizationContext", MethodRecord{ .library = "KERNEL32", .import = "GetProcessesInVirtualizationContext", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x09\x0f\x0f\x11\x80\x85" } },
    .{ "GetCurrentPackageInfo3", MethodRecord{ .library = "KERNEL32", .import = "GetCurrentPackageInfo3", .signature = "\x00\x05\x11\x79\x09\x11\x81\x5d\x0f\x09\x0f\x01\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x101 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WIN32_ERROR" },
        0x105 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "PACKAGE_ID" },
        0x109 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "PackagePathType" },
        0x10d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "PackageOrigin" },
        0x111 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "_PACKAGE_INFO_REFERENCE" },
        0x115 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSID" },
        0x119 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "PACKAGE_VERSION" },
        0x11d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "PackageDependencyProcessorArchitectures" },
        0x121 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "PackageDependencyLifetimeKind" },
        0x125 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "CreatePackageDependencyOptions" },
        0x129 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "AddPackageDependencyOptions" },
        0x12d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "PACKAGEDEPENDENCY_CONTEXT" },
        0x131 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "AddPackageDependencyOptions2" },
        0x135 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "FindPackageDependencyCriteria" },
        0x139 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "AppPolicyLifecycleManagement" },
        0x13d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "AppPolicyWindowingModel" },
        0x141 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "AppPolicyMediaFoundationCodecLoading" },
        0x145 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "AppPolicyClrCompat" },
        0x149 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "AppPolicyThreadInitializationType" },
        0x14d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "AppPolicyShowDeveloperDiagnostic" },
        0x151 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "AppPolicyProcessTerminationMethod" },
        0x155 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "AppPolicyCreateFileAccess" },
        0x159 => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE" },
        0x15d => TypeRefEntry{ .namespace = "Windows.Win32.Storage.Packaging.Appx", .name = "PackageInfo3Type" },
        else => null,
    };
}

pub const PACKAGE_FULL_NAME_MIN_LENGTH = 30;
pub const PACKAGE_FULL_NAME_MAX_LENGTH = 127;
pub const PACKAGE_FAMILY_NAME_MIN_LENGTH = 17;
pub const PACKAGE_FAMILY_NAME_MAX_LENGTH = 64;
pub const PACKAGE_GRAPH_MAX_SIZE = 641;
pub const APPLICATION_USER_MODEL_ID_MIN_LENGTH = 20;
pub const APPLICATION_USER_MODEL_ID_MAX_LENGTH = 130;
pub const PACKAGE_PROPERTY_FRAMEWORK = 1;
pub const PACKAGE_PROPERTY_RESOURCE = 2;
pub const PACKAGE_PROPERTY_BUNDLE = 4;
pub const PACKAGE_PROPERTY_OPTIONAL = 8;
pub const PACKAGE_FILTER_HEAD = 16;
pub const PACKAGE_FILTER_DIRECT = 32;
pub const PACKAGE_FILTER_RESOURCE = 64;
pub const PACKAGE_FILTER_BUNDLE = 128;
pub const PACKAGE_INFORMATION_BASIC = 0;
pub const PACKAGE_INFORMATION_FULL = 256;
pub const PACKAGE_PROPERTY_DEVELOPMENT_MODE = 65536;
pub const PACKAGE_FILTER_OPTIONAL = 131072;
pub const PACKAGE_PROPERTY_IS_IN_RELATED_SET = 262144;
pub const PACKAGE_FILTER_IS_IN_RELATED_SET = 262144;
pub const PACKAGE_PROPERTY_STATIC = 524288;
pub const PACKAGE_FILTER_STATIC = 524288;
pub const PACKAGE_PROPERTY_DYNAMIC = 1048576;
pub const PACKAGE_FILTER_DYNAMIC = 1048576;
pub const PACKAGE_PROPERTY_HOSTRUNTIME = 2097152;
pub const PACKAGE_FILTER_HOSTRUNTIME = 2097152;
pub const PACKAGE_FILTER_ALL_LOADED = 0;
pub const PACKAGE_DEPENDENCY_RANK_DEFAULT = 0;
pub const PACKAGE_ARCHITECTURE_MIN_LENGTH = 3;
pub const PACKAGE_ARCHITECTURE_MAX_LENGTH = 7;
pub const PACKAGE_VERSION_MIN_LENGTH = 7;
pub const PACKAGE_VERSION_MAX_LENGTH = 23;
pub const PACKAGE_NAME_MIN_LENGTH = 3;
pub const PACKAGE_NAME_MAX_LENGTH = 50;
pub const PACKAGE_PUBLISHER_MIN_LENGTH = 3;
pub const PACKAGE_PUBLISHER_MAX_LENGTH = 8192;
pub const PACKAGE_PUBLISHERID_MIN_LENGTH = 13;
pub const PACKAGE_PUBLISHERID_MAX_LENGTH = 13;
pub const PACKAGE_RESOURCEID_MIN_LENGTH = 0;
pub const PACKAGE_RESOURCEID_MAX_LENGTH = 30;
pub const PACKAGE_MIN_DEPENDENCIES = 0;
pub const PACKAGE_MAX_DEPENDENCIES = 128;
pub const PACKAGE_FAMILY_MIN_RESOURCE_PACKAGES = 0;
pub const PACKAGE_FAMILY_MAX_RESOURCE_PACKAGES = 512;
pub const PACKAGE_GRAPH_MIN_SIZE = 1;
pub const PACKAGE_APPLICATIONS_MIN_COUNT = 0;
pub const PACKAGE_APPLICATIONS_MAX_COUNT = 100;
pub const PACKAGE_RELATIVE_APPLICATION_ID_MIN_LENGTH = 2;
pub const PACKAGE_RELATIVE_APPLICATION_ID_MAX_LENGTH = 65;
pub const APPX_COMPRESSION_OPTION_NONE = 0;
pub const APPX_COMPRESSION_OPTION_NORMAL = 1;
pub const APPX_COMPRESSION_OPTION_MAXIMUM = 2;
pub const APPX_COMPRESSION_OPTION_FAST = 3;
pub const APPX_COMPRESSION_OPTION_SUPERFAST = 4;
pub const APPX_FOOTPRINT_FILE_TYPE_MANIFEST = 0;
pub const APPX_FOOTPRINT_FILE_TYPE_BLOCKMAP = 1;
pub const APPX_FOOTPRINT_FILE_TYPE_SIGNATURE = 2;
pub const APPX_FOOTPRINT_FILE_TYPE_CODEINTEGRITY = 3;
pub const APPX_FOOTPRINT_FILE_TYPE_CONTENTGROUPMAP = 4;
pub const APPX_BUNDLE_FOOTPRINT_FILE_TYPE_FIRST = 0;
pub const APPX_BUNDLE_FOOTPRINT_FILE_TYPE_MANIFEST = 0;
pub const APPX_BUNDLE_FOOTPRINT_FILE_TYPE_BLOCKMAP = 1;
pub const APPX_BUNDLE_FOOTPRINT_FILE_TYPE_SIGNATURE = 2;
pub const APPX_BUNDLE_FOOTPRINT_FILE_TYPE_LAST = 2;
pub const APPX_CAPABILITY_INTERNET_CLIENT = 1;
pub const APPX_CAPABILITY_INTERNET_CLIENT_SERVER = 2;
pub const APPX_CAPABILITY_PRIVATE_NETWORK_CLIENT_SERVER = 4;
pub const APPX_CAPABILITY_DOCUMENTS_LIBRARY = 8;
pub const APPX_CAPABILITY_PICTURES_LIBRARY = 16;
pub const APPX_CAPABILITY_VIDEOS_LIBRARY = 32;
pub const APPX_CAPABILITY_MUSIC_LIBRARY = 64;
pub const APPX_CAPABILITY_ENTERPRISE_AUTHENTICATION = 128;
pub const APPX_CAPABILITY_SHARED_USER_CERTIFICATES = 256;
pub const APPX_CAPABILITY_REMOVABLE_STORAGE = 512;
pub const APPX_CAPABILITY_APPOINTMENTS = 1024;
pub const APPX_CAPABILITY_CONTACTS = 2048;
pub const APPX_PACKAGE_ARCHITECTURE_X86 = 0;
pub const APPX_PACKAGE_ARCHITECTURE_ARM = 5;
pub const APPX_PACKAGE_ARCHITECTURE_X64 = 9;
pub const APPX_PACKAGE_ARCHITECTURE_NEUTRAL = 11;
pub const APPX_PACKAGE_ARCHITECTURE_ARM64 = 12;
pub const APPX_PACKAGE_ARCHITECTURE2_X86 = 0;
pub const APPX_PACKAGE_ARCHITECTURE2_ARM = 5;
pub const APPX_PACKAGE_ARCHITECTURE2_X64 = 9;
pub const APPX_PACKAGE_ARCHITECTURE2_NEUTRAL = 11;
pub const APPX_PACKAGE_ARCHITECTURE2_ARM64 = 12;
pub const APPX_PACKAGE_ARCHITECTURE2_X86_ON_ARM64 = 14;
pub const APPX_PACKAGE_ARCHITECTURE2_UNKNOWN = 65535;
pub const APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE_APPLICATION = 0;
pub const APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE_RESOURCE = 1;
pub const DX_FEATURE_LEVEL_UNSPECIFIED = 0;
pub const DX_FEATURE_LEVEL_9 = 1;
pub const DX_FEATURE_LEVEL_10 = 2;
pub const DX_FEATURE_LEVEL_11 = 3;
pub const APPX_CAPABILITY_CLASS_DEFAULT = 0;
pub const APPX_CAPABILITY_CLASS_GENERAL = 1;
pub const APPX_CAPABILITY_CLASS_RESTRICTED = 2;
pub const APPX_CAPABILITY_CLASS_WINDOWS = 4;
pub const APPX_CAPABILITY_CLASS_ALL = 7;
pub const APPX_CAPABILITY_CLASS_CUSTOM = 8;
pub const APPX_PACKAGING_CONTEXT_CHANGE_TYPE_START = 0;
pub const APPX_PACKAGING_CONTEXT_CHANGE_TYPE_CHANGE = 1;
pub const APPX_PACKAGING_CONTEXT_CHANGE_TYPE_DETAILS = 2;
pub const APPX_PACKAGING_CONTEXT_CHANGE_TYPE_END = 3;
pub const APPX_ENCRYPTED_PACKAGE_OPTION_NONE = 0;
pub const APPX_ENCRYPTED_PACKAGE_OPTION_DIFFUSION = 1;
pub const APPX_ENCRYPTED_PACKAGE_OPTION_PAGE_HASHING = 2;
pub const APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION_APPEND_DELTA = 0;
pub const APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_NONE = 0;
pub const APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_SKIP_VALIDATION = 1;
pub const APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTION_LOCALIZED = 2;
pub const PackagePathType_Install = 0;
pub const PackagePathType_Mutable = 1;
pub const PackagePathType_Effective = 2;
pub const PackagePathType_MachineExternal = 3;
pub const PackagePathType_UserExternal = 4;
pub const PackagePathType_EffectiveExternal = 5;
pub const PackageOrigin_Unknown = 0;
pub const PackageOrigin_Unsigned = 1;
pub const PackageOrigin_Inbox = 2;
pub const PackageOrigin_Store = 3;
pub const PackageOrigin_DeveloperUnsigned = 4;
pub const PackageOrigin_DeveloperSigned = 5;
pub const PackageOrigin_LineOfBusiness = 6;
pub const CreatePackageDependencyOptions_None = 0;
pub const CreatePackageDependencyOptions_DoNotVerifyDependencyResolution = 1;
pub const CreatePackageDependencyOptions_ScopeIsSystem = 2;
pub const PackageDependencyLifetimeKind_Process = 0;
pub const PackageDependencyLifetimeKind_FilePath = 1;
pub const PackageDependencyLifetimeKind_RegistryKey = 2;
pub const AddPackageDependencyOptions_None = 0;
pub const AddPackageDependencyOptions_PrependIfRankCollision = 1;
pub const AddPackageDependencyOptions2_None = 0;
pub const AddPackageDependencyOptions2_PrependIfRankCollision = 1;
pub const AddPackageDependencyOptions2_SpecifiedPackageFamilyOnly = 2;
pub const PackageDependencyProcessorArchitectures_None = 0;
pub const PackageDependencyProcessorArchitectures_Neutral = 1;
pub const PackageDependencyProcessorArchitectures_X86 = 2;
pub const PackageDependencyProcessorArchitectures_X64 = 4;
pub const PackageDependencyProcessorArchitectures_Arm = 8;
pub const PackageDependencyProcessorArchitectures_Arm64 = 16;
pub const PackageDependencyProcessorArchitectures_X86A64 = 32;
pub const AppPolicyLifecycleManagement_Unmanaged = 0;
pub const AppPolicyLifecycleManagement_Managed = 1;
pub const AppPolicyWindowingModel_None = 0;
pub const AppPolicyWindowingModel_Universal = 1;
pub const AppPolicyWindowingModel_ClassicDesktop = 2;
pub const AppPolicyWindowingModel_ClassicPhone = 3;
pub const AppPolicyMediaFoundationCodecLoading_All = 0;
pub const AppPolicyMediaFoundationCodecLoading_InboxOnly = 1;
pub const AppPolicyClrCompat_Other = 0;
pub const AppPolicyClrCompat_ClassicDesktop = 1;
pub const AppPolicyClrCompat_Universal = 2;
pub const AppPolicyClrCompat_PackagedDesktop = 3;
pub const AppPolicyThreadInitializationType_None = 0;
pub const AppPolicyThreadInitializationType_InitializeWinRT = 1;
pub const AppPolicyShowDeveloperDiagnostic_None = 0;
pub const AppPolicyShowDeveloperDiagnostic_ShowUI = 1;
pub const AppPolicyProcessTerminationMethod_ExitProcess = 0;
pub const AppPolicyProcessTerminationMethod_TerminateProcess = 1;
pub const AppPolicyCreateFileAccess_Full = 0;
pub const AppPolicyCreateFileAccess_Limited = 1;
pub const PackageInfo3Type_PackageInfoGeneration = 16;

pub const aliases = struct {
    pub const APPX_COMPRESSION_OPTION = i32;
    pub const APPX_FOOTPRINT_FILE_TYPE = i32;
    pub const APPX_BUNDLE_FOOTPRINT_FILE_TYPE = i32;
    pub const APPX_CAPABILITIES = i32;
    pub const APPX_PACKAGE_ARCHITECTURE = i32;
    pub const APPX_PACKAGE_ARCHITECTURE2 = i32;
    pub const APPX_BUNDLE_PAYLOAD_PACKAGE_TYPE = i32;
    pub const DX_FEATURE_LEVEL = i32;
    pub const APPX_CAPABILITY_CLASS_TYPE = i32;
    pub const APPX_PACKAGING_CONTEXT_CHANGE_TYPE = i32;
    pub const APPX_ENCRYPTED_PACKAGE_OPTIONS = i32;
    pub const APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION = i32;
    pub const APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS = i32;
    pub const PackagePathType = i32;
    pub const PackageOrigin = i32;
    pub const CreatePackageDependencyOptions = i32;
    pub const PackageDependencyLifetimeKind = i32;
    pub const AddPackageDependencyOptions = i32;
    pub const AddPackageDependencyOptions2 = i32;
    pub const PackageDependencyProcessorArchitectures = i32;
    pub const AppPolicyLifecycleManagement = i32;
    pub const AppPolicyWindowingModel = i32;
    pub const AppPolicyMediaFoundationCodecLoading = i32;
    pub const AppPolicyClrCompat = i32;
    pub const AppPolicyThreadInitializationType = i32;
    pub const AppPolicyShowDeveloperDiagnostic = i32;
    pub const AppPolicyProcessTerminationMethod = i32;
    pub const AppPolicyCreateFileAccess = i32;
    pub const PackageInfo3Type = i32;
    pub const PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE = ?*anyopaque;
    pub const PACKAGEDEPENDENCY_CONTEXT = ?*anyopaque;
};
