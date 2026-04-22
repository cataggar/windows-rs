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
    .{ "WerReportCreate", MethodRecord{ .library = "wer", .import = "WerReportCreate", .signature = "\x00\x04\x11\x79\x11\x05\x11\xc0\x00\x41\x45\x0f\x11\xc0\x00\x41\x49\x0f\x11\xc0\x00\x41\x4d" } },
    .{ "WerReportSetParameter", MethodRecord{ .library = "wer", .import = "WerReportSetParameter", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\x4d\x09\x11\x05\x11\x05" } },
    .{ "WerReportAddFile", MethodRecord{ .library = "wer", .import = "WerReportAddFile", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\x4d\x11\x05\x11\xc0\x00\x41\x51\x11\xa1\x25" } },
    .{ "WerReportSetUIOption", MethodRecord{ .library = "wer", .import = "WerReportSetUIOption", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x41\x4d\x11\xc0\x00\x41\x55\x11\x05" } },
    .{ "WerReportSubmit", MethodRecord{ .library = "wer", .import = "WerReportSubmit", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\x4d\x11\xc0\x00\x41\x59\x11\xa1\x29\x0f\x11\xc0\x00\x41\x5d" } },
    .{ "WerReportAddDump", MethodRecord{ .library = "wer", .import = "WerReportAddDump", .signature = "\x00\x07\x11\x79\x11\xc0\x00\x41\x4d\x11\x80\x85\x11\x80\x85\x11\xc0\x00\x41\x61\x0f\x11\xc0\x00\x41\x65\x0f\x11\xc0\x00\x41\x69\x09" } },
    .{ "WerReportCloseHandle", MethodRecord{ .library = "wer", .import = "WerReportCloseHandle", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x41\x4d" } },
    .{ "WerRegisterFile", MethodRecord{ .library = "KERNEL32", .import = "WerRegisterFile", .signature = "\x00\x03\x11\x79\x11\x05\x11\xc0\x00\x41\x6d\x11\xa1\x25" } },
    .{ "WerUnregisterFile", MethodRecord{ .library = "KERNEL32", .import = "WerUnregisterFile", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "WerRegisterMemoryBlock", MethodRecord{ .library = "KERNEL32", .import = "WerRegisterMemoryBlock", .signature = "\x00\x02\x11\x79\x0f\x01\x09" } },
    .{ "WerUnregisterMemoryBlock", MethodRecord{ .library = "KERNEL32", .import = "WerUnregisterMemoryBlock", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "WerRegisterExcludedMemoryBlock", MethodRecord{ .library = "KERNEL32", .import = "WerRegisterExcludedMemoryBlock", .signature = "\x00\x02\x11\x79\x0f\x01\x09" } },
    .{ "WerUnregisterExcludedMemoryBlock", MethodRecord{ .library = "KERNEL32", .import = "WerUnregisterExcludedMemoryBlock", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "WerRegisterCustomMetadata", MethodRecord{ .library = "KERNEL32", .import = "WerRegisterCustomMetadata", .signature = "\x00\x02\x11\x79\x11\x05\x11\x05" } },
    .{ "WerUnregisterCustomMetadata", MethodRecord{ .library = "KERNEL32", .import = "WerUnregisterCustomMetadata", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "WerRegisterAdditionalProcess", MethodRecord{ .library = "KERNEL32", .import = "WerRegisterAdditionalProcess", .signature = "\x00\x02\x11\x79\x09\x09" } },
    .{ "WerUnregisterAdditionalProcess", MethodRecord{ .library = "KERNEL32", .import = "WerUnregisterAdditionalProcess", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "WerRegisterAppLocalDump", MethodRecord{ .library = "KERNEL32", .import = "WerRegisterAppLocalDump", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "WerUnregisterAppLocalDump", MethodRecord{ .library = "KERNEL32", .import = "WerUnregisterAppLocalDump", .signature = "\x00\x00\x11\x79" } },
    .{ "WerSetFlags", MethodRecord{ .library = "KERNEL32", .import = "WerSetFlags", .signature = "\x00\x01\x11\x79\x11\xa1\x2d" } },
    .{ "WerGetFlags", MethodRecord{ .library = "KERNEL32", .import = "WerGetFlags", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\xa1\x2d" } },
    .{ "WerAddExcludedApplication", MethodRecord{ .library = "wer", .import = "WerAddExcludedApplication", .signature = "\x00\x02\x11\x79\x11\x05\x11\x59" } },
    .{ "WerRemoveExcludedApplication", MethodRecord{ .library = "wer", .import = "WerRemoveExcludedApplication", .signature = "\x00\x02\x11\x79\x11\x05\x11\x59" } },
    .{ "WerRegisterRuntimeExceptionModule", MethodRecord{ .library = "KERNEL32", .import = "WerRegisterRuntimeExceptionModule", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x01" } },
    .{ "WerUnregisterRuntimeExceptionModule", MethodRecord{ .library = "KERNEL32", .import = "WerUnregisterRuntimeExceptionModule", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x01" } },
    .{ "WerStoreOpen", MethodRecord{ .library = "wer", .import = "WerStoreOpen", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x41\x71\x0f\x11\xc0\x00\x41\x75" } },
    .{ "WerStoreClose", MethodRecord{ .library = "wer", .import = "WerStoreClose", .signature = "\x00\x01\x01\x11\xc0\x00\x41\x75" } },
    .{ "WerStoreGetFirstReportKey", MethodRecord{ .library = "wer", .import = "WerStoreGetFirstReportKey", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x41\x75\x0f\x11\x05" } },
    .{ "WerStoreGetNextReportKey", MethodRecord{ .library = "wer", .import = "WerStoreGetNextReportKey", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x41\x75\x0f\x11\x05" } },
    .{ "WerStoreQueryReportMetadataV2", MethodRecord{ .library = "wer", .import = "WerStoreQueryReportMetadataV2", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x41\x75\x11\x05\x0f\x11\xc0\x00\x41\x79" } },
    .{ "WerStoreQueryReportMetadataV3", MethodRecord{ .library = "wer", .import = "WerStoreQueryReportMetadataV3", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x41\x75\x11\x05\x0f\x11\xc0\x00\x41\x7d" } },
    .{ "WerFreeString", MethodRecord{ .library = "wer", .import = "WerFreeString", .signature = "\x00\x01\x01\x11\x05" } },
    .{ "WerStorePurge", MethodRecord{ .library = "wer", .import = "WerStorePurge", .signature = "\x00\x00\x11\x79" } },
    .{ "WerStoreGetReportCount", MethodRecord{ .library = "wer", .import = "WerStoreGetReportCount", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x41\x75\x0f\x09" } },
    .{ "WerStoreGetSizeOnDisk", MethodRecord{ .library = "wer", .import = "WerStoreGetSizeOnDisk", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x41\x75\x0f\x0b" } },
    .{ "WerStoreQueryReportMetadataV1", MethodRecord{ .library = "wer", .import = "WerStoreQueryReportMetadataV1", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x41\x75\x11\x05\x0f\x11\xc0\x00\x41\x81" } },
    .{ "WerStoreUploadReport", MethodRecord{ .library = "wer", .import = "WerStoreUploadReport", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x41\x75\x11\x05\x09\x0f\x11\xc0\x00\x41\x5d" } },
    .{ "ReportFault", MethodRecord{ .library = "faultrep", .import = "ReportFault", .signature = "\x00\x02\x11\xc0\x00\x41\x85\x0f\x11\x87\xc1\x09" } },
    .{ "AddERExcludedApplicationA", MethodRecord{ .library = "faultrep", .import = "AddERExcludedApplicationA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "AddERExcludedApplicationW", MethodRecord{ .library = "faultrep", .import = "AddERExcludedApplicationW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "WerReportHang", MethodRecord{ .library = "faultrep", .import = "WerReportHang", .signature = "\x00\x02\x11\x79\x11\x25\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x7c1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "EXCEPTION_POINTERS" },
        0x2125 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_FILE" },
        0x2129 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_SUBMIT_FLAGS" },
        0x212d => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_FAULT_REPORTING" },
        0x4145 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_REPORT_TYPE" },
        0x4149 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_REPORT_INFORMATION" },
        0x414d => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "HREPORT" },
        0x4151 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_FILE_TYPE" },
        0x4155 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_REPORT_UI" },
        0x4159 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_CONSENT" },
        0x415d => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_SUBMIT_RESULT" },
        0x4161 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_DUMP_TYPE" },
        0x4165 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_EXCEPTION_INFORMATION" },
        0x4169 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_DUMP_CUSTOM_OPTIONS" },
        0x416d => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_REGISTER_FILE_TYPE" },
        0x4171 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "REPORT_STORE_TYPES" },
        0x4175 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "HREPORTSTORE" },
        0x4179 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_REPORT_METADATA_V2" },
        0x417d => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_REPORT_METADATA_V3" },
        0x4181 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "WER_REPORT_METADATA_V1" },
        0x4185 => TypeRefEntry{ .namespace = "Windows.Win32.System.ErrorReporting", .name = "EFaultRepRetVal" },
        else => null,
    };
}

pub const WER_FILE_ANONYMOUS_DATA = 2;
pub const WER_FILE_DELETE_WHEN_DONE = 1;
pub const WER_SUBMIT_ADD_REGISTERED_DATA = 16;
pub const WER_SUBMIT_HONOR_RECOVERY = 1;
pub const WER_SUBMIT_HONOR_RESTART = 2;
pub const WER_SUBMIT_NO_ARCHIVE = 256;
pub const WER_SUBMIT_NO_CLOSE_UI = 64;
pub const WER_SUBMIT_NO_QUEUE = 128;
pub const WER_SUBMIT_OUTOFPROCESS = 32;
pub const WER_SUBMIT_OUTOFPROCESS_ASYNC = 1024;
pub const WER_SUBMIT_QUEUE = 4;
pub const WER_SUBMIT_SHOW_DEBUG = 8;
pub const WER_SUBMIT_START_MINIMIZED = 512;
pub const WER_SUBMIT_BYPASS_DATA_THROTTLING = 2048;
pub const WER_SUBMIT_ARCHIVE_PARAMETERS_ONLY = 4096;
pub const WER_SUBMIT_REPORT_MACHINE_ID = 8192;
pub const WER_FAULT_REPORTING_FLAG_DISABLE_THREAD_SUSPENSION = 4;
pub const WER_FAULT_REPORTING_FLAG_NOHEAP = 1;
pub const WER_FAULT_REPORTING_FLAG_QUEUE = 2;
pub const WER_FAULT_REPORTING_FLAG_QUEUE_UPLOAD = 8;
pub const WER_FAULT_REPORTING_ALWAYS_SHOW_UI = 16;
pub const WER_FAULT_REPORTING_NO_UI = 32;
pub const WER_FAULT_REPORTING_FLAG_NO_HEAP_ON_QUEUE = 64;
pub const WER_FAULT_REPORTING_DISABLE_SNAPSHOT_CRASH = 128;
pub const WER_FAULT_REPORTING_DISABLE_SNAPSHOT_HANG = 256;
pub const WER_FAULT_REPORTING_CRITICAL = 512;
pub const WER_FAULT_REPORTING_DURABLE = 1024;
pub const WER_MAX_TOTAL_PARAM_LENGTH = 1720;
pub const WER_MAX_PREFERRED_MODULES = 128;
pub const WER_MAX_PREFERRED_MODULES_BUFFER = 256;
pub const WER_P0 = 0;
pub const WER_P1 = 1;
pub const WER_P2 = 2;
pub const WER_P3 = 3;
pub const WER_P4 = 4;
pub const WER_P5 = 5;
pub const WER_P6 = 6;
pub const WER_P7 = 7;
pub const WER_P8 = 8;
pub const WER_P9 = 9;
pub const WER_FILE_COMPRESSED = 4;
pub const WER_SUBMIT_BYPASS_POWER_THROTTLING = 16384;
pub const WER_SUBMIT_BYPASS_NETWORK_COST_THROTTLING = 32768;
pub const WER_DUMP_MASK_START = 1;
pub const WER_DUMP_NOHEAP_ONQUEUE = 1;
pub const WER_DUMP_AUXILIARY = 2;
pub const WER_DUMP_AUX_PROMOTE = 4;
pub const WER_MAX_REGISTERED_ENTRIES = 512;
pub const WER_MAX_REGISTERED_METADATA = 8;
pub const WER_MAX_REGISTERED_DUMPCOLLECTION = 4;
pub const WER_METADATA_KEY_MAX_LENGTH = 64;
pub const WER_METADATA_VALUE_MAX_LENGTH = 128;
pub const WER_MAX_SIGNATURE_NAME_LENGTH = 128;
pub const WER_MAX_EVENT_NAME_LENGTH = 64;
pub const WER_MAX_PARAM_LENGTH = 260;
pub const WER_MAX_PARAM_COUNT = 10;
pub const WER_MAX_FRIENDLY_EVENT_NAME_LENGTH = 128;
pub const WER_MAX_APPLICATION_NAME_LENGTH = 128;
pub const WER_MAX_DESCRIPTION_LENGTH = 512;
pub const WER_MAX_BUCKET_ID_STRING_LENGTH = 260;
pub const WER_MAX_LOCAL_DUMP_SUBPATH_LENGTH = 64;
pub const WER_MAX_REGISTERED_RUNTIME_EXCEPTION_MODULES = 16;
pub const WerUIAdditionalDataDlgHeader = 1;
pub const WerUIIconFilePath = 2;
pub const WerUIConsentDlgHeader = 3;
pub const WerUIConsentDlgBody = 4;
pub const WerUIOnlineSolutionCheckText = 5;
pub const WerUIOfflineSolutionCheckText = 6;
pub const WerUICloseText = 7;
pub const WerUICloseDlgHeader = 8;
pub const WerUICloseDlgBody = 9;
pub const WerUICloseDlgButtonText = 10;
pub const WerUIMax = 11;
pub const WerRegFileTypeUserDocument = 1;
pub const WerRegFileTypeOther = 2;
pub const WerRegFileTypeMax = 3;
pub const WerFileTypeMicrodump = 1;
pub const WerFileTypeMinidump = 2;
pub const WerFileTypeHeapdump = 3;
pub const WerFileTypeUserDocument = 4;
pub const WerFileTypeOther = 5;
pub const WerFileTypeTriagedump = 6;
pub const WerFileTypeCustomDump = 7;
pub const WerFileTypeAuxiliaryDump = 8;
pub const WerFileTypeEtlTrace = 9;
pub const WerFileTypeAuxiliaryHeapDump = 10;
pub const WerFileTypeMax = 11;
pub const WerReportQueued = 1;
pub const WerReportUploaded = 2;
pub const WerReportDebug = 3;
pub const WerReportFailed = 4;
pub const WerDisabled = 5;
pub const WerReportCancelled = 6;
pub const WerDisabledQueue = 7;
pub const WerReportAsync = 8;
pub const WerCustomAction = 9;
pub const WerThrottled = 10;
pub const WerReportUploadedCab = 11;
pub const WerStorageLocationNotFound = 12;
pub const WerSubmitResultMax = 13;
pub const WerReportNonCritical = 0;
pub const WerReportCritical = 1;
pub const WerReportApplicationCrash = 2;
pub const WerReportApplicationHang = 3;
pub const WerReportKernel = 4;
pub const WerReportInvalid = 5;
pub const WerConsentNotAsked = 1;
pub const WerConsentApproved = 2;
pub const WerConsentDenied = 3;
pub const WerConsentAlwaysPrompt = 4;
pub const WerConsentMax = 5;
pub const WerDumpTypeNone = 0;
pub const WerDumpTypeMicroDump = 1;
pub const WerDumpTypeMiniDump = 2;
pub const WerDumpTypeHeapDump = 3;
pub const WerDumpTypeTriageDump = 4;
pub const WerDumpTypeMax = 5;
pub const E_STORE_USER_ARCHIVE = 0;
pub const E_STORE_USER_QUEUE = 1;
pub const E_STORE_MACHINE_ARCHIVE = 2;
pub const E_STORE_MACHINE_QUEUE = 3;
pub const E_STORE_INVALID = 4;
pub const frrvOk = 0;
pub const frrvOkManifest = 1;
pub const frrvOkQueued = 2;
pub const frrvErr = 3;
pub const frrvErrNoDW = 4;
pub const frrvErrTimeout = 5;
pub const frrvLaunchDebugger = 6;
pub const frrvOkHeadless = 7;
pub const frrvErrAnotherInstance = 8;
pub const frrvErrNoMemory = 9;
pub const frrvErrDoubleFault = 10;

pub const aliases = struct {
    pub const WER_FILE = u32;
    pub const WER_SUBMIT_FLAGS = u32;
    pub const WER_FAULT_REPORTING = u32;
    pub const WER_REPORT_UI = i32;
    pub const WER_REGISTER_FILE_TYPE = i32;
    pub const WER_FILE_TYPE = i32;
    pub const WER_SUBMIT_RESULT = i32;
    pub const WER_REPORT_TYPE = i32;
    pub const WER_CONSENT = i32;
    pub const WER_DUMP_TYPE = i32;
    pub const REPORT_STORE_TYPES = i32;
    pub const EFaultRepRetVal = i32;
};
