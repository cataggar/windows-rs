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
    .{ "GetCORSystemDirectory", MethodRecord{ .library = "MSCorEE", .import = "GetCORSystemDirectory", .signature = "\x00\x03\x11\x79\x11\x05\x09\x0f\x09" } },
    .{ "GetCORVersion", MethodRecord{ .library = "MSCorEE", .import = "GetCORVersion", .signature = "\x00\x03\x11\x79\x11\x05\x09\x0f\x09" } },
    .{ "GetFileVersion", MethodRecord{ .library = "MSCorEE", .import = "GetFileVersion", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x09\x0f\x09" } },
    .{ "GetCORRequiredVersion", MethodRecord{ .library = "MSCorEE", .import = "GetCORRequiredVersion", .signature = "\x00\x03\x11\x79\x11\x05\x09\x0f\x09" } },
    .{ "GetRequestedRuntimeInfo", MethodRecord{ .library = "MSCorEE", .import = "GetRequestedRuntimeInfo", .signature = "\x00\x0b\x11\x79\x11\x05\x11\x05\x11\x05\x09\x09\x11\x05\x09\x0f\x09\x11\x05\x09\x0f\x09" } },
    .{ "GetRequestedRuntimeVersion", MethodRecord{ .library = "MSCorEE", .import = "GetRequestedRuntimeVersion", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x09\x0f\x09" } },
    .{ "CorBindToRuntimeHost", MethodRecord{ .library = "MSCorEE", .import = "CorBindToRuntimeHost", .signature = "\x00\x08\x11\x79\x11\x05\x11\x05\x11\x05\x0f\x01\x09\x0f\x11\x0d\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CorBindToRuntimeEx", MethodRecord{ .library = "MSCorEE", .import = "CorBindToRuntimeEx", .signature = "\x00\x06\x11\x79\x11\x05\x11\x05\x09\x0f\x11\x0d\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CorBindToRuntimeByCfg", MethodRecord{ .library = "MSCorEE", .import = "CorBindToRuntimeByCfg", .signature = "\x00\x06\x11\x79\x12\x83\x75\x09\x09\x0f\x11\x0d\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CorBindToRuntime", MethodRecord{ .library = "MSCorEE", .import = "CorBindToRuntime", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x0f\x11\x0d\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CorBindToCurrentRuntime", MethodRecord{ .library = "MSCorEE", .import = "CorBindToCurrentRuntime", .signature = "\x00\x04\x11\x79\x11\x05\x0f\x11\x0d\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "ClrCreateManagedInstance", MethodRecord{ .library = "MSCorEE", .import = "ClrCreateManagedInstance", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CorMarkThreadInThreadPool", MethodRecord{ .library = "MSCorEE", .import = "CorMarkThreadInThreadPool", .signature = "\x00\x00\x01" } },
    .{ "RunDll32ShimW", MethodRecord{ .library = "MSCorEE", .import = "RunDll32ShimW", .signature = "\x00\x04\x11\x79\x11\x25\x11\x82\x29\x11\x05\x08" } },
    .{ "LoadLibraryShim", MethodRecord{ .library = "MSCorEE", .import = "LoadLibraryShim", .signature = "\x00\x04\x11\x79\x11\x05\x11\x05\x0f\x01\x0f\x11\x81\x81" } },
    .{ "CallFunctionShim", MethodRecord{ .library = "MSCorEE", .import = "CallFunctionShim", .signature = "\x00\x06\x11\x79\x11\x05\x11\x3d\x0f\x01\x0f\x01\x11\x05\x0f\x01" } },
    .{ "GetRealProcAddress", MethodRecord{ .library = "MSCorEE", .import = "GetRealProcAddress", .signature = "\x00\x02\x11\x79\x11\x3d\x0f\x0f\x01" } },
    .{ "CorExitProcess", MethodRecord{ .library = "MSCorEE", .import = "CorExitProcess", .signature = "\x00\x01\x01\x08" } },
    .{ "LoadStringRC", MethodRecord{ .library = "MSCorEE", .import = "LoadStringRC", .signature = "\x00\x04\x11\x79\x09\x11\x05\x08\x08" } },
    .{ "LoadStringRCEx", MethodRecord{ .library = "MSCorEE", .import = "LoadStringRCEx", .signature = "\x00\x06\x11\x79\x09\x09\x11\x05\x08\x08\x0f\x08" } },
    .{ "LockClrVersion", MethodRecord{ .library = "MSCorEE", .import = "LockClrVersion", .signature = "\x00\x03\x11\x79\x12\xbf\xf1\x0f\x12\xbf\xf1\x0f\x12\xbf\xf1" } },
    .{ "CreateDebuggingInterfaceFromVersion", MethodRecord{ .library = "MSCorEE", .import = "CreateDebuggingInterfaceFromVersion", .signature = "\x00\x03\x11\x79\x08\x11\x05\x0f\x12\x82\xb1" } },
    .{ "GetVersionFromProcess", MethodRecord{ .library = "MSCorEE", .import = "GetVersionFromProcess", .signature = "\x00\x04\x11\x79\x11\x80\x85\x11\x05\x09\x0f\x09" } },
    .{ "CorLaunchApplication", MethodRecord{ .library = "MSCorEE", .import = "CorLaunchApplication", .signature = "\x00\x07\x11\x79\x11\xbf\xf5\x11\x05\x09\x0f\x11\x05\x09\x0f\x11\x05\x0f\x11\xa3\xe5" } },
    .{ "GetRequestedRuntimeVersionForCLSID", MethodRecord{ .library = "MSCorEE", .import = "GetRequestedRuntimeVersionForCLSID", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x11\x05\x09\x0f\x09\x11\xbf\xf9" } },
    .{ "GetCLRIdentityManager", MethodRecord{ .library = "MSCorEE", .import = "GetCLRIdentityManager", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x12\x82\xb1" } },
    .{ "CLRCreateInstance", MethodRecord{ .library = "MSCorEE", .import = "CLRCreateInstance", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x0f\x11\x0d\x0f\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x181 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HMODULE" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IStream" },
        0x23e5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Threading", .name = "PROCESS_INFORMATION" },
        0x3ff1 => TypeRefEntry{ .namespace = "Windows.Win32.System.ClrHosting", .name = "FLockClrVersionCallback" },
        0x3ff5 => TypeRefEntry{ .namespace = "Windows.Win32.System.ClrHosting", .name = "HOST_TYPE" },
        0x3ff9 => TypeRefEntry{ .namespace = "Windows.Win32.System.ClrHosting", .name = "CLSID_RESOLUTION_FLAGS" },
        else => null,
    };
}

pub const CLR_MAJOR_VERSION = 4;
pub const CLR_MINOR_VERSION = 0;
pub const CLR_BUILD_VERSION = 22220;
pub const CLR_ASSEMBLY_MAJOR_VERSION = 4;
pub const CLR_ASSEMBLY_MINOR_VERSION = 0;
pub const CLR_ASSEMBLY_BUILD_VERSION = 0;
pub const BucketParamsCount = 10;
pub const BucketParamLength = 255;
pub const COR_GC_COUNTS = 1;
pub const COR_GC_MEMORYUSAGE = 2;
pub const COR_GC_THREAD_HAS_PROMOTED_BYTES = 1;
pub const HOST_TYPE_DEFAULT = 0;
pub const HOST_TYPE_APPLAUNCH = 1;
pub const HOST_TYPE_CORFLAG = 2;
pub const STARTUP_CONCURRENT_GC = 1;
pub const STARTUP_LOADER_OPTIMIZATION_MASK = 6;
pub const STARTUP_LOADER_OPTIMIZATION_SINGLE_DOMAIN = 2;
pub const STARTUP_LOADER_OPTIMIZATION_MULTI_DOMAIN = 4;
pub const STARTUP_LOADER_OPTIMIZATION_MULTI_DOMAIN_HOST = 6;
pub const STARTUP_LOADER_SAFEMODE = 16;
pub const STARTUP_LOADER_SETPREFERENCE = 256;
pub const STARTUP_SERVER_GC = 4096;
pub const STARTUP_HOARD_GC_VM = 8192;
pub const STARTUP_SINGLE_VERSION_HOSTING_INTERFACE = 16384;
pub const STARTUP_LEGACY_IMPERSONATION = 65536;
pub const STARTUP_DISABLE_COMMITTHREADSTACK = 131072;
pub const STARTUP_ALWAYSFLOW_IMPERSONATION = 262144;
pub const STARTUP_TRIM_GC_COMMIT = 524288;
pub const STARTUP_ETW = 1048576;
pub const STARTUP_ARM = 4194304;
pub const CLSID_RESOLUTION_DEFAULT = 0;
pub const CLSID_RESOLUTION_REGISTERED = 1;
pub const RUNTIME_INFO_UPGRADE_VERSION = 1;
pub const RUNTIME_INFO_REQUEST_IA64 = 2;
pub const RUNTIME_INFO_REQUEST_AMD64 = 4;
pub const RUNTIME_INFO_REQUEST_X86 = 8;
pub const RUNTIME_INFO_DONT_RETURN_DIRECTORY = 16;
pub const RUNTIME_INFO_DONT_RETURN_VERSION = 32;
pub const RUNTIME_INFO_DONT_SHOW_ERROR_DIALOG = 64;
pub const RUNTIME_INFO_IGNORE_ERROR_MODE = 4096;
pub const RUNTIME_INFO_REQUEST_ARM64 = 8192;
pub const APPDOMAIN_SECURITY_DEFAULT = 0;
pub const APPDOMAIN_SECURITY_SANDBOXED = 1;
pub const APPDOMAIN_SECURITY_FORBID_CROSSAD_REVERSE_PINVOKE = 2;
pub const APPDOMAIN_FORCE_TRIVIAL_WAIT_OPERATIONS = 8;
pub const eMemoryAvailableLow = 1;
pub const eMemoryAvailableNeutral = 2;
pub const eMemoryAvailableHigh = 3;
pub const eTaskCritical = 0;
pub const eAppDomainCritical = 1;
pub const eProcessCritical = 2;
pub const WAIT_MSGPUMP = 1;
pub const WAIT_ALERTABLE = 2;
pub const WAIT_NOTINDEADLOCK = 4;
pub const MALLOC_THREADSAFE = 1;
pub const MALLOC_EXECUTABLE = 2;
pub const TT_DEBUGGERHELPER = 1;
pub const TT_GC = 2;
pub const TT_FINALIZER = 4;
pub const TT_THREADPOOL_TIMER = 8;
pub const TT_THREADPOOL_GATE = 16;
pub const TT_THREADPOOL_WORKER = 32;
pub const TT_THREADPOOL_IOCOMPLETION = 64;
pub const TT_ADUNLOAD = 128;
pub const TT_USER = 256;
pub const TT_THREADPOOL_WAIT = 512;
pub const TT_UNKNOWN = -2147483648;
pub const eSymbolReadingNever = 0;
pub const eSymbolReadingAlways = 1;
pub const eSymbolReadingFullTrustOnly = 2;
pub const DUMP_FLAVOR_Mini = 0;
pub const DUMP_FLAVOR_CriticalCLRState = 1;
pub const DUMP_FLAVOR_NonHeapCLRState = 2;
pub const DUMP_FLAVOR_Default = 0;
pub const DUMP_ITEM_None = 0;
pub const Parameter1 = 0;
pub const Parameter2 = 1;
pub const Parameter3 = 2;
pub const Parameter4 = 3;
pub const Parameter5 = 4;
pub const Parameter6 = 5;
pub const Parameter7 = 6;
pub const Parameter8 = 7;
pub const Parameter9 = 8;
pub const InvalidBucketParamIndex = 9;
pub const OPR_ThreadAbort = 0;
pub const OPR_ThreadRudeAbortInNonCriticalRegion = 1;
pub const OPR_ThreadRudeAbortInCriticalRegion = 2;
pub const OPR_AppDomainUnload = 3;
pub const OPR_AppDomainRudeUnload = 4;
pub const OPR_ProcessExit = 5;
pub const OPR_FinalizerRun = 6;
pub const MaxClrOperation = 7;
pub const FAIL_NonCriticalResource = 0;
pub const FAIL_CriticalResource = 1;
pub const FAIL_FatalRuntime = 2;
pub const FAIL_OrphanedLock = 3;
pub const FAIL_StackOverflow = 4;
pub const FAIL_AccessViolation = 5;
pub const FAIL_CodeContract = 6;
pub const MaxClrFailure = 7;
pub const eRuntimeDeterminedPolicy = 0;
pub const eHostDeterminedPolicy = 1;
pub const eNoAction = 0;
pub const eThrowException = 1;
pub const eAbortThread = 2;
pub const eRudeAbortThread = 3;
pub const eUnloadAppDomain = 4;
pub const eRudeUnloadAppDomain = 5;
pub const eExitProcess = 6;
pub const eFastExitProcess = 7;
pub const eRudeExitProcess = 8;
pub const eDisableRuntime = 9;
pub const MaxPolicyAction = 10;
pub const Event_DomainUnload = 0;
pub const Event_ClrDisabled = 1;
pub const Event_MDAFired = 2;
pub const Event_StackOverflow = 3;
pub const MaxClrEvent = 4;
pub const SO_Managed = 0;
pub const SO_ClrEngine = 1;
pub const SO_Other = 2;
pub const CLR_ASSEMBLY_IDENTITY_FLAGS_DEFAULT = 0;
pub const HOST_BINDING_POLICY_MODIFY_DEFAULT = 0;
pub const HOST_BINDING_POLICY_MODIFY_CHAIN = 1;
pub const HOST_BINDING_POLICY_MODIFY_REMOVE = 2;
pub const HOST_BINDING_POLICY_MODIFY_MAX = 3;
pub const ePolicyLevelNone = 0;
pub const ePolicyLevelRetargetable = 1;
pub const ePolicyUnifiedToCLR = 2;
pub const ePolicyLevelApp = 4;
pub const ePolicyLevelPublisher = 8;
pub const ePolicyLevelHost = 16;
pub const ePolicyLevelAdmin = 32;
pub const ePolicyPortability = 64;
pub const HOST_APPLICATION_BINDING_POLICY = 1;
pub const eNoChecks = 0;
pub const eSynchronization = 1;
pub const eSharedState = 2;
pub const eExternalProcessMgmt = 4;
pub const eSelfAffectingProcessMgmt = 8;
pub const eExternalThreading = 16;
pub const eSelfAffectingThreading = 32;
pub const eSecurityInfrastructure = 64;
pub const eUI = 128;
pub const eMayLeakOnAbort = 256;
pub const eAll = 511;
pub const eInitializeNewDomainFlags_None = 0;
pub const eInitializeNewDomainFlags_NoSecurityChanges = 2;
pub const eCurrentContext = 0;
pub const eRestrictedContext = 1;
pub const METAHOST_POLICY_HIGHCOMPAT = 0;
pub const METAHOST_POLICY_APPLY_UPGRADE_POLICY = 8;
pub const METAHOST_POLICY_EMULATE_EXE_LAUNCH = 16;
pub const METAHOST_POLICY_SHOW_ERROR_DIALOG = 32;
pub const METAHOST_POLICY_USE_PROCESS_IMAGE_PATH = 64;
pub const METAHOST_POLICY_ENSURE_SKU_SUPPORTED = 128;
pub const METAHOST_POLICY_IGNORE_ERROR_MODE = 4096;
pub const METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_UNSET = 0;
pub const METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_TRUE = 1;
pub const METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_FALSE = 2;
pub const METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_MASK = 3;
pub const CLR_DEBUGGING_MANAGED_EVENT_PENDING = 1;
pub const CLR_DEBUGGING_MANAGED_EVENT_DEBUGGER_LAUNCH = 2;

pub const aliases = struct {
    pub const COR_GC_STAT_TYPES = i32;
    pub const COR_GC_THREAD_STATS_TYPES = i32;
    pub const HOST_TYPE = i32;
    pub const STARTUP_FLAGS = i32;
    pub const CLSID_RESOLUTION_FLAGS = i32;
    pub const RUNTIME_INFO_FLAGS = i32;
    pub const APPDOMAIN_SECURITY_FLAGS = i32;
    pub const EMemoryAvailable = i32;
    pub const EMemoryCriticalLevel = i32;
    pub const WAIT_OPTION = i32;
    pub const MALLOC_TYPE = i32;
    pub const ETaskType = i32;
    pub const ESymbolReadingPolicy = i32;
    pub const ECustomDumpFlavor = i32;
    pub const ECustomDumpItemKind = i32;
    pub const BucketParameterIndex = i32;
    pub const EClrOperation = i32;
    pub const EClrFailure = i32;
    pub const EClrUnhandledException = i32;
    pub const EPolicyAction = i32;
    pub const EClrEvent = i32;
    pub const StackOverflowType = i32;
    pub const ECLRAssemblyIdentityFlags = i32;
    pub const EHostBindingPolicyModifyFlags = i32;
    pub const EBindPolicyLevels = i32;
    pub const EHostApplicationPolicy = i32;
    pub const EApiCategories = i32;
    pub const EInitializeNewDomainFlags = i32;
    pub const EContextType = i32;
    pub const METAHOST_POLICY_FLAGS = i32;
    pub const METAHOST_CONFIG_FLAGS = i32;
    pub const CLR_DEBUGGING_PROCESS_FLAGS = i32;
    pub const FLockClrVersionCallback = ?*const anyopaque;
    pub const FExecuteInAppDomainCallback = ?*const anyopaque;
    pub const PTLS_CALLBACK_FUNCTION = ?*const anyopaque;
    pub const CLRCreateInstanceFnPtr = ?*const anyopaque;
    pub const CreateInterfaceFnPtr = ?*const anyopaque;
    pub const CallbackThreadSetFnPtr = ?*const anyopaque;
    pub const CallbackThreadUnsetFnPtr = ?*const anyopaque;
    pub const RuntimeLoadedCallbackFnPtr = ?*const anyopaque;
};
