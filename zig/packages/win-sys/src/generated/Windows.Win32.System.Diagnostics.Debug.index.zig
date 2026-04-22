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
    .{ "ReadProcessMemory", MethodRecord{ .library = "KERNEL32", .import = "ReadProcessMemory", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x0f\x01\x19\x0f\x19" } },
    .{ "WriteProcessMemory", MethodRecord{ .library = "KERNEL32", .import = "WriteProcessMemory", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x0f\x01\x19\x0f\x19" } },
    .{ "GetThreadContext", MethodRecord{ .library = "KERNEL32", .import = "GetThreadContext", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x87\x99" } },
    .{ "SetThreadContext", MethodRecord{ .library = "KERNEL32", .import = "SetThreadContext", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x87\x99" } },
    .{ "FlushInstructionCache", MethodRecord{ .library = "KERNEL32", .import = "FlushInstructionCache", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x01\x19" } },
    .{ "Wow64GetThreadContext", MethodRecord{ .library = "KERNEL32", .import = "Wow64GetThreadContext", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x87\xa1" } },
    .{ "Wow64SetThreadContext", MethodRecord{ .library = "KERNEL32", .import = "Wow64SetThreadContext", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x87\xa1" } },
    .{ "RtlCaptureContext2", MethodRecord{ .library = "KERNEL32", .import = "RtlCaptureContext2", .signature = "\x00\x01\x01\x0f\x11\x87\x99" } },
    .{ "RtlAddFunctionTable", MethodRecord{ .library = "KERNEL32", .import = "RtlAddFunctionTable", .signature = "\x00\x03\x11\x87\x79\x0f\x11\x87\xa5\x09\x0b" } },
    .{ "RtlDeleteFunctionTable", MethodRecord{ .library = "KERNEL32", .import = "RtlDeleteFunctionTable", .signature = "\x00\x01\x11\x87\x79\x0f\x11\x87\xa5" } },
    .{ "RtlInstallFunctionTableCallback", MethodRecord{ .library = "KERNEL32", .import = "RtlInstallFunctionTableCallback", .signature = "\x00\x06\x11\x87\x79\x0b\x0b\x09\x12\x87\x89\x0f\x01\x11\x05" } },
    .{ "RtlAddGrowableFunctionTable", MethodRecord{ .library = "ntdll", .import = "RtlAddGrowableFunctionTable", .signature = "\x00\x06\x09\x0f\x0f\x01\x0f\x11\x87\xa5\x09\x09\x19\x19" } },
    .{ "RtlGrowFunctionTable", MethodRecord{ .library = "ntdll", .import = "RtlGrowFunctionTable", .signature = "\x00\x02\x01\x0f\x01\x09" } },
    .{ "RtlDeleteGrowableFunctionTable", MethodRecord{ .library = "ntdll", .import = "RtlDeleteGrowableFunctionTable", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "RtlLookupFunctionEntry", MethodRecord{ .library = "KERNEL32", .import = "RtlLookupFunctionEntry", .signature = "\x00\x03\x0f\x11\x87\xa5\x0b\x0f\x0b\x0f\x11\x87\x8d" } },
    .{ "RtlUnwindEx", MethodRecord{ .library = "KERNEL32", .import = "RtlUnwindEx", .signature = "\x00\x06\x01\x0f\x01\x0f\x01\x0f\x11\x87\xa9\x0f\x01\x0f\x11\x87\x99\x0f\x11\x87\x8d" } },
    .{ "RtlVirtualUnwind", MethodRecord{ .library = "KERNEL32", .import = "RtlVirtualUnwind", .signature = "\x00\x08\x12\x87\x91\x11\x87\x95\x0b\x0b\x0f\x11\x87\xa5\x0f\x11\x87\x99\x0f\x0f\x01\x0f\x0b\x0f\x11\x87\x9d" } },
    .{ "CheckSumMappedFile", MethodRecord{ .library = "imagehlp", .import = "CheckSumMappedFile", .signature = "\x00\x04\x0f\x11\x87\xad\x0f\x01\x09\x0f\x09\x0f\x09" } },
    .{ "GetImageConfigInformation", MethodRecord{ .library = "imagehlp", .import = "GetImageConfigInformation", .signature = "\x00\x02\x11\x59\x0f\x11\x87\xb1\x0f\x11\x87\xb5" } },
    .{ "SetImageConfigInformation", MethodRecord{ .library = "imagehlp", .import = "SetImageConfigInformation", .signature = "\x00\x02\x11\x59\x0f\x11\x87\xb1\x0f\x11\x87\xb5" } },
    .{ "ImageNtHeader", MethodRecord{ .library = "dbghelp", .import = "ImageNtHeader", .signature = "\x00\x01\x0f\x11\x87\xad\x0f\x01" } },
    .{ "ImageRvaToSection", MethodRecord{ .library = "dbghelp", .import = "ImageRvaToSection", .signature = "\x00\x03\x0f\x11\x87\xb9\x0f\x11\x87\xad\x0f\x01\x09" } },
    .{ "ImageRvaToVa", MethodRecord{ .library = "dbghelp", .import = "ImageRvaToVa", .signature = "\x00\x04\x0f\x01\x0f\x11\x87\xad\x0f\x01\x09\x0f\x0f\x11\x87\xb9" } },
    .{ "RtlCaptureStackBackTrace", MethodRecord{ .library = "KERNEL32", .import = "RtlCaptureStackBackTrace", .signature = "\x00\x04\x07\x09\x09\x0f\x0f\x01\x0f\x09" } },
    .{ "RtlCaptureContext", MethodRecord{ .library = "KERNEL32", .import = "RtlCaptureContext", .signature = "\x00\x01\x01\x0f\x11\x87\x99" } },
    .{ "RtlUnwind", MethodRecord{ .library = "KERNEL32", .import = "RtlUnwind", .signature = "\x00\x04\x01\x0f\x01\x0f\x01\x0f\x11\x87\xa9\x0f\x01" } },
    .{ "RtlRestoreContext", MethodRecord{ .library = "KERNEL32", .import = "RtlRestoreContext", .signature = "\x00\x02\x01\x0f\x11\x87\x99\x0f\x11\x87\xa9" } },
    .{ "RtlRaiseException", MethodRecord{ .library = "KERNEL32", .import = "RtlRaiseException", .signature = "\x00\x01\x01\x0f\x11\x87\xa9" } },
    .{ "RtlPcToFileHeader", MethodRecord{ .library = "KERNEL32", .import = "RtlPcToFileHeader", .signature = "\x00\x02\x0f\x01\x0f\x01\x0f\x0f\x01" } },
    .{ "IsDebuggerPresent", MethodRecord{ .library = "KERNEL32", .import = "IsDebuggerPresent", .signature = "\x00\x00\x11\x59" } },
    .{ "DebugBreak", MethodRecord{ .library = "KERNEL32", .import = "DebugBreak", .signature = "\x00\x00\x01" } },
    .{ "OutputDebugStringA", MethodRecord{ .library = "KERNEL32", .import = "OutputDebugStringA", .signature = "\x00\x01\x01\x11\x3d" } },
    .{ "OutputDebugStringW", MethodRecord{ .library = "KERNEL32", .import = "OutputDebugStringW", .signature = "\x00\x01\x01\x11\x05" } },
    .{ "ContinueDebugEvent", MethodRecord{ .library = "KERNEL32", .import = "ContinueDebugEvent", .signature = "\x00\x03\x11\x59\x09\x09\x11\x84\x71" } },
    .{ "WaitForDebugEvent", MethodRecord{ .library = "KERNEL32", .import = "WaitForDebugEvent", .signature = "\x00\x02\x11\x59\x0f\x11\x87\xbd\x09" } },
    .{ "DebugActiveProcess", MethodRecord{ .library = "KERNEL32", .import = "DebugActiveProcess", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "DebugActiveProcessStop", MethodRecord{ .library = "KERNEL32", .import = "DebugActiveProcessStop", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "CheckRemoteDebuggerPresent", MethodRecord{ .library = "KERNEL32", .import = "CheckRemoteDebuggerPresent", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x59" } },
    .{ "WaitForDebugEventEx", MethodRecord{ .library = "KERNEL32", .import = "WaitForDebugEventEx", .signature = "\x00\x02\x11\x59\x0f\x11\x87\xbd\x09" } },
    .{ "EncodePointer", MethodRecord{ .library = "KERNEL32", .import = "EncodePointer", .signature = "\x00\x01\x0f\x01\x0f\x01" } },
    .{ "DecodePointer", MethodRecord{ .library = "KERNEL32", .import = "DecodePointer", .signature = "\x00\x01\x0f\x01\x0f\x01" } },
    .{ "EncodeSystemPointer", MethodRecord{ .library = "KERNEL32", .import = "EncodeSystemPointer", .signature = "\x00\x01\x0f\x01\x0f\x01" } },
    .{ "DecodeSystemPointer", MethodRecord{ .library = "KERNEL32", .import = "DecodeSystemPointer", .signature = "\x00\x01\x0f\x01\x0f\x01" } },
    .{ "EncodeRemotePointer", MethodRecord{ .library = "api-ms-win-core-util-l1-1-1", .import = "EncodeRemotePointer", .signature = "\x00\x03\x11\x79\x11\x80\x85\x0f\x01\x0f\x0f\x01" } },
    .{ "DecodeRemotePointer", MethodRecord{ .library = "api-ms-win-core-util-l1-1-1", .import = "DecodeRemotePointer", .signature = "\x00\x03\x11\x79\x11\x80\x85\x0f\x01\x0f\x0f\x01" } },
    .{ "Beep", MethodRecord{ .library = "KERNEL32", .import = "Beep", .signature = "\x00\x02\x11\x59\x09\x09" } },
    .{ "RaiseException", MethodRecord{ .library = "KERNEL32", .import = "RaiseException", .signature = "\x00\x04\x01\x09\x09\x09\x0f\x19" } },
    .{ "UnhandledExceptionFilter", MethodRecord{ .library = "KERNEL32", .import = "UnhandledExceptionFilter", .signature = "\x00\x01\x08\x0f\x11\x87\xc1" } },
    .{ "SetUnhandledExceptionFilter", MethodRecord{ .library = "KERNEL32", .import = "SetUnhandledExceptionFilter", .signature = "\x00\x01\x12\x87\xc5\x12\x87\xc5" } },
    .{ "GetErrorMode", MethodRecord{ .library = "KERNEL32", .import = "GetErrorMode", .signature = "\x00\x00\x09" } },
    .{ "SetErrorMode", MethodRecord{ .library = "KERNEL32", .import = "SetErrorMode", .signature = "\x00\x01\x11\x87\xc9\x11\x87\xc9" } },
    .{ "AddVectoredExceptionHandler", MethodRecord{ .library = "KERNEL32", .import = "AddVectoredExceptionHandler", .signature = "\x00\x02\x0f\x01\x09\x12\x87\xcd" } },
    .{ "RemoveVectoredExceptionHandler", MethodRecord{ .library = "KERNEL32", .import = "RemoveVectoredExceptionHandler", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "AddVectoredContinueHandler", MethodRecord{ .library = "KERNEL32", .import = "AddVectoredContinueHandler", .signature = "\x00\x02\x0f\x01\x09\x12\x87\xcd" } },
    .{ "RemoveVectoredContinueHandler", MethodRecord{ .library = "KERNEL32", .import = "RemoveVectoredContinueHandler", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "RaiseFailFastException", MethodRecord{ .library = "KERNEL32", .import = "RaiseFailFastException", .signature = "\x00\x03\x01\x0f\x11\x87\xa9\x0f\x11\x87\x99\x09" } },
    .{ "FatalAppExitA", MethodRecord{ .library = "KERNEL32", .import = "FatalAppExitA", .signature = "\x00\x02\x01\x09\x11\x3d" } },
    .{ "FatalAppExitW", MethodRecord{ .library = "KERNEL32", .import = "FatalAppExitW", .signature = "\x00\x02\x01\x09\x11\x05" } },
    .{ "GetThreadErrorMode", MethodRecord{ .library = "KERNEL32", .import = "GetThreadErrorMode", .signature = "\x00\x00\x09" } },
    .{ "SetThreadErrorMode", MethodRecord{ .library = "KERNEL32", .import = "SetThreadErrorMode", .signature = "\x00\x02\x11\x59\x11\x87\xc9\x0f\x11\x87\xc9" } },
    .{ "TerminateProcessOnMemoryExhaustion", MethodRecord{ .library = "api-ms-win-core-errorhandling-l1-1-3", .import = "TerminateProcessOnMemoryExhaustion", .signature = "\x00\x01\x01\x19" } },
    .{ "OpenThreadWaitChainSession", MethodRecord{ .library = "ADVAPI32", .import = "OpenThreadWaitChainSession", .signature = "\x00\x02\x0f\x01\x11\x87\xd1\x12\x87\xd5" } },
    .{ "CloseThreadWaitChainSession", MethodRecord{ .library = "ADVAPI32", .import = "CloseThreadWaitChainSession", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "GetThreadWaitChain", MethodRecord{ .library = "ADVAPI32", .import = "GetThreadWaitChain", .signature = "\x00\x07\x11\x59\x0f\x01\x19\x11\x87\xd9\x09\x0f\x09\x0f\x11\x87\xdd\x0f\x11\x59" } },
    .{ "RegisterWaitChainCOMCallback", MethodRecord{ .library = "ADVAPI32", .import = "RegisterWaitChainCOMCallback", .signature = "\x00\x02\x01\x12\x87\xe1\x12\x87\xe5" } },
    .{ "MiniDumpWriteDump", MethodRecord{ .library = "dbghelp", .import = "MiniDumpWriteDump", .signature = "\x00\x07\x11\x59\x11\x80\x85\x09\x11\x80\x85\x11\x87\xe9\x0f\x11\x87\xed\x0f\x11\x87\xf1\x0f\x11\x87\xf5" } },
    .{ "MiniDumpReadDumpStream", MethodRecord{ .library = "dbghelp", .import = "MiniDumpReadDumpStream", .signature = "\x00\x05\x11\x59\x0f\x01\x09\x0f\x0f\x11\x87\xf9\x0f\x0f\x01\x0f\x09" } },
    .{ "BindImage", MethodRecord{ .library = "imagehlp", .import = "BindImage", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "BindImageEx", MethodRecord{ .library = "imagehlp", .import = "BindImageEx", .signature = "\x00\x05\x11\x59\x09\x11\x3d\x11\x3d\x11\x3d\x12\x87\xfd" } },
    .{ "ReBaseImage", MethodRecord{ .library = "imagehlp", .import = "ReBaseImage", .signature = "\x00\x0b\x11\x59\x11\x3d\x11\x3d\x11\x59\x11\x59\x11\x59\x09\x0f\x09\x0f\x19\x0f\x09\x0f\x19\x09" } },
    .{ "ReBaseImage64", MethodRecord{ .library = "imagehlp", .import = "ReBaseImage64", .signature = "\x00\x0b\x11\x59\x11\x3d\x11\x3d\x11\x59\x11\x59\x11\x59\x09\x0f\x09\x0f\x0b\x0f\x09\x0f\x0b\x09" } },
    .{ "MapFileAndCheckSumA", MethodRecord{ .library = "imagehlp", .import = "MapFileAndCheckSumA", .signature = "\x00\x03\x09\x11\x3d\x0f\x09\x0f\x09" } },
    .{ "MapFileAndCheckSumW", MethodRecord{ .library = "imagehlp", .import = "MapFileAndCheckSumW", .signature = "\x00\x03\x09\x11\x05\x0f\x09\x0f\x09" } },
    .{ "GetImageUnusedHeaderBytes", MethodRecord{ .library = "imagehlp", .import = "GetImageUnusedHeaderBytes", .signature = "\x00\x02\x09\x0f\x11\x87\xb1\x0f\x09" } },
    .{ "ImageGetDigestStream", MethodRecord{ .library = "imagehlp", .import = "ImageGetDigestStream", .signature = "\x00\x04\x11\x59\x11\x80\x85\x09\x12\x88\x09\x0f\x01" } },
    .{ "ImageAddCertificate", MethodRecord{ .library = "imagehlp", .import = "ImageAddCertificate", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\x88\x0d\x0f\x09" } },
    .{ "ImageRemoveCertificate", MethodRecord{ .library = "imagehlp", .import = "ImageRemoveCertificate", .signature = "\x00\x02\x11\x59\x11\x80\x85\x09" } },
    .{ "ImageEnumerateCertificates", MethodRecord{ .library = "imagehlp", .import = "ImageEnumerateCertificates", .signature = "\x00\x05\x11\x59\x11\x80\x85\x07\x0f\x09\x0f\x09\x09" } },
    .{ "ImageGetCertificateData", MethodRecord{ .library = "imagehlp", .import = "ImageGetCertificateData", .signature = "\x00\x04\x11\x59\x11\x80\x85\x09\x0f\x11\x88\x0d\x0f\x09" } },
    .{ "ImageGetCertificateHeader", MethodRecord{ .library = "imagehlp", .import = "ImageGetCertificateHeader", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x0f\x11\x88\x0d" } },
    .{ "ImageLoad", MethodRecord{ .library = "imagehlp", .import = "ImageLoad", .signature = "\x00\x02\x0f\x11\x87\xb1\x11\x3d\x11\x3d" } },
    .{ "ImageUnload", MethodRecord{ .library = "imagehlp", .import = "ImageUnload", .signature = "\x00\x01\x11\x59\x0f\x11\x87\xb1" } },
    .{ "MapAndLoad", MethodRecord{ .library = "imagehlp", .import = "MapAndLoad", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x0f\x11\x87\xb1\x11\x59\x11\x59" } },
    .{ "UnMapAndLoad", MethodRecord{ .library = "imagehlp", .import = "UnMapAndLoad", .signature = "\x00\x01\x11\x59\x0f\x11\x87\xb1" } },
    .{ "TouchFileTimes", MethodRecord{ .library = "imagehlp", .import = "TouchFileTimes", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x86\x45" } },
    .{ "UpdateDebugInfoFile", MethodRecord{ .library = "imagehlp", .import = "UpdateDebugInfoFile", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x11\x3d\x0f\x11\x88\x01" } },
    .{ "UpdateDebugInfoFileEx", MethodRecord{ .library = "imagehlp", .import = "UpdateDebugInfoFileEx", .signature = "\x00\x05\x11\x59\x11\x3d\x11\x3d\x11\x3d\x0f\x11\x88\x01\x09" } },
    .{ "SymFindDebugInfoFile", MethodRecord{ .library = "dbghelp", .import = "SymFindDebugInfoFile", .signature = "\x00\x05\x11\x80\x85\x11\x80\x85\x11\x3d\x11\x3d\x12\x88\x11\x0f\x01" } },
    .{ "SymFindDebugInfoFileW", MethodRecord{ .library = "dbghelp", .import = "SymFindDebugInfoFileW", .signature = "\x00\x05\x11\x80\x85\x11\x80\x85\x11\x05\x11\x05\x12\x88\x15\x0f\x01" } },
    .{ "FindDebugInfoFile", MethodRecord{ .library = "dbghelp", .import = "FindDebugInfoFile", .signature = "\x00\x03\x11\x80\x85\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "FindDebugInfoFileEx", MethodRecord{ .library = "dbghelp", .import = "FindDebugInfoFileEx", .signature = "\x00\x05\x11\x80\x85\x11\x3d\x11\x3d\x11\x3d\x12\x88\x11\x0f\x01" } },
    .{ "FindDebugInfoFileExW", MethodRecord{ .library = "dbghelp", .import = "FindDebugInfoFileExW", .signature = "\x00\x05\x11\x80\x85\x11\x05\x11\x05\x11\x05\x12\x88\x15\x0f\x01" } },
    .{ "SymFindFileInPath", MethodRecord{ .library = "dbghelp", .import = "SymFindFileInPath", .signature = "\x00\x0a\x11\x59\x11\x80\x85\x11\x3d\x11\x3d\x0f\x01\x09\x09\x11\x88\x19\x11\x3d\x12\x88\x1d\x0f\x01" } },
    .{ "SymFindFileInPathW", MethodRecord{ .library = "dbghelp", .import = "SymFindFileInPathW", .signature = "\x00\x0a\x11\x59\x11\x80\x85\x11\x05\x11\x05\x0f\x01\x09\x09\x11\x88\x19\x11\x05\x12\x88\x21\x0f\x01" } },
    .{ "SymFindExecutableImage", MethodRecord{ .library = "dbghelp", .import = "SymFindExecutableImage", .signature = "\x00\x05\x11\x80\x85\x11\x80\x85\x11\x3d\x11\x3d\x12\x88\x25\x0f\x01" } },
    .{ "SymFindExecutableImageW", MethodRecord{ .library = "dbghelp", .import = "SymFindExecutableImageW", .signature = "\x00\x05\x11\x80\x85\x11\x80\x85\x11\x05\x11\x05\x12\x88\x29\x0f\x01" } },
    .{ "FindExecutableImage", MethodRecord{ .library = "dbghelp", .import = "FindExecutableImage", .signature = "\x00\x03\x11\x80\x85\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "FindExecutableImageEx", MethodRecord{ .library = "dbghelp", .import = "FindExecutableImageEx", .signature = "\x00\x05\x11\x80\x85\x11\x3d\x11\x3d\x11\x3d\x12\x88\x25\x0f\x01" } },
    .{ "FindExecutableImageExW", MethodRecord{ .library = "dbghelp", .import = "FindExecutableImageExW", .signature = "\x00\x05\x11\x80\x85\x11\x05\x11\x05\x11\x05\x12\x88\x29\x0f\x01" } },
    .{ "ImageDirectoryEntryToDataEx", MethodRecord{ .library = "dbghelp", .import = "ImageDirectoryEntryToDataEx", .signature = "\x00\x05\x0f\x01\x0f\x01\x11\x87\x79\x11\x88\x2d\x0f\x09\x0f\x0f\x11\x87\xb9" } },
    .{ "ImageDirectoryEntryToData", MethodRecord{ .library = "dbghelp", .import = "ImageDirectoryEntryToData", .signature = "\x00\x04\x0f\x01\x0f\x01\x11\x87\x79\x11\x88\x2d\x0f\x09" } },
    .{ "SearchTreeForFile", MethodRecord{ .library = "dbghelp", .import = "SearchTreeForFile", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "SearchTreeForFileW", MethodRecord{ .library = "dbghelp", .import = "SearchTreeForFileW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x05" } },
    .{ "EnumDirTree", MethodRecord{ .library = "dbghelp", .import = "EnumDirTree", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x3d\x11\x3d\x11\x3d\x12\x88\x31\x0f\x01" } },
    .{ "EnumDirTreeW", MethodRecord{ .library = "dbghelp", .import = "EnumDirTreeW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x05\x11\x05\x11\x05\x12\x88\x35\x0f\x01" } },
    .{ "MakeSureDirectoryPathExists", MethodRecord{ .library = "dbghelp", .import = "MakeSureDirectoryPathExists", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "UnDecorateSymbolName", MethodRecord{ .library = "dbghelp", .import = "UnDecorateSymbolName", .signature = "\x00\x04\x09\x11\x3d\x11\x3d\x09\x09" } },
    .{ "UnDecorateSymbolNameW", MethodRecord{ .library = "dbghelp", .import = "UnDecorateSymbolNameW", .signature = "\x00\x04\x09\x11\x05\x11\x05\x09\x09" } },
    .{ "StackWalk64", MethodRecord{ .library = "dbghelp", .import = "StackWalk64", .signature = "\x00\x09\x11\x59\x09\x11\x80\x85\x11\x80\x85\x0f\x11\x88\x39\x0f\x01\x12\x88\x3d\x12\x88\x41\x12\x88\x45\x12\x88\x49" } },
    .{ "StackWalkEx", MethodRecord{ .library = "dbghelp", .import = "StackWalkEx", .signature = "\x00\x0a\x11\x59\x09\x11\x80\x85\x11\x80\x85\x0f\x11\x88\x4d\x0f\x01\x12\x88\x3d\x12\x88\x41\x12\x88\x45\x12\x88\x49\x09" } },
    .{ "StackWalk2", MethodRecord{ .library = "dbghelp", .import = "StackWalk2", .signature = "\x00\x0b\x11\x59\x09\x11\x80\x85\x11\x80\x85\x0f\x11\x88\x4d\x0f\x01\x12\x88\x3d\x12\x88\x41\x12\x88\x45\x12\x88\x49\x12\x88\x51\x09" } },
    .{ "ImagehlpApiVersion", MethodRecord{ .library = "dbghelp", .import = "ImagehlpApiVersion", .signature = "\x00\x00\x0f\x11\x88\x69" } },
    .{ "ImagehlpApiVersionEx", MethodRecord{ .library = "dbghelp", .import = "ImagehlpApiVersionEx", .signature = "\x00\x01\x0f\x11\x88\x69\x0f\x11\x88\x69" } },
    .{ "GetTimestampForLoadedLibrary", MethodRecord{ .library = "dbghelp", .import = "GetTimestampForLoadedLibrary", .signature = "\x00\x01\x09\x11\x81\x81" } },
    .{ "SymSetParentWindow", MethodRecord{ .library = "dbghelp", .import = "SymSetParentWindow", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "SymGetParentWindow", MethodRecord{ .library = "dbghelp", .import = "SymGetParentWindow", .signature = "\x00\x01\x11\x59\x0f\x11\x25" } },
    .{ "SymSetHomeDirectory", MethodRecord{ .library = "dbghelp", .import = "SymSetHomeDirectory", .signature = "\x00\x02\x11\x3d\x11\x80\x85\x11\x3d" } },
    .{ "SymSetHomeDirectoryW", MethodRecord{ .library = "dbghelp", .import = "SymSetHomeDirectoryW", .signature = "\x00\x02\x11\x05\x11\x80\x85\x11\x05" } },
    .{ "SymGetHomeDirectory", MethodRecord{ .library = "dbghelp", .import = "SymGetHomeDirectory", .signature = "\x00\x03\x11\x3d\x09\x11\x3d\x19" } },
    .{ "SymGetHomeDirectoryW", MethodRecord{ .library = "dbghelp", .import = "SymGetHomeDirectoryW", .signature = "\x00\x03\x11\x05\x09\x11\x05\x19" } },
    .{ "SymGetOmaps", MethodRecord{ .library = "dbghelp", .import = "SymGetOmaps", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0b\x0f\x0f\x11\x88\x6d\x0f\x0b\x0f\x0f\x11\x88\x6d\x0f\x0b" } },
    .{ "SymSetOptions", MethodRecord{ .library = "dbghelp", .import = "SymSetOptions", .signature = "\x00\x01\x09\x09" } },
    .{ "SymGetOptions", MethodRecord{ .library = "dbghelp", .import = "SymGetOptions", .signature = "\x00\x00\x09" } },
    .{ "SymCleanup", MethodRecord{ .library = "dbghelp", .import = "SymCleanup", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "SymGetExtendedOption", MethodRecord{ .library = "dbghelp", .import = "SymGetExtendedOption", .signature = "\x00\x01\x11\x59\x11\x88\x71" } },
    .{ "SymSetExtendedOption", MethodRecord{ .library = "dbghelp", .import = "SymSetExtendedOption", .signature = "\x00\x02\x11\x59\x11\x88\x71\x11\x59" } },
    .{ "SymMatchString", MethodRecord{ .library = "dbghelp", .import = "SymMatchString", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x59" } },
    .{ "SymMatchStringA", MethodRecord{ .library = "dbghelp", .import = "SymMatchStringA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x3d\x11\x59" } },
    .{ "SymMatchStringW", MethodRecord{ .library = "dbghelp", .import = "SymMatchStringW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x05\x11\x59" } },
    .{ "SymEnumSourceFiles", MethodRecord{ .library = "dbghelp", .import = "SymEnumSourceFiles", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x11\x3d\x12\x88\x75\x0f\x01" } },
    .{ "SymEnumSourceFilesW", MethodRecord{ .library = "dbghelp", .import = "SymEnumSourceFilesW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x11\x05\x12\x88\x79\x0f\x01" } },
    .{ "SymEnumerateModules64", MethodRecord{ .library = "dbghelp", .import = "SymEnumerateModules64", .signature = "\x00\x03\x11\x59\x11\x80\x85\x12\x88\x7d\x0f\x01" } },
    .{ "SymEnumerateModulesW64", MethodRecord{ .library = "dbghelp", .import = "SymEnumerateModulesW64", .signature = "\x00\x03\x11\x59\x11\x80\x85\x12\x88\x81\x0f\x01" } },
    .{ "EnumerateLoadedModulesEx", MethodRecord{ .library = "dbghelp", .import = "EnumerateLoadedModulesEx", .signature = "\x00\x03\x11\x59\x11\x80\x85\x12\x88\x89\x0f\x01" } },
    .{ "EnumerateLoadedModulesExW", MethodRecord{ .library = "dbghelp", .import = "EnumerateLoadedModulesExW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x12\x88\x8d\x0f\x01" } },
    .{ "EnumerateLoadedModules64", MethodRecord{ .library = "dbghelp", .import = "EnumerateLoadedModules64", .signature = "\x00\x03\x11\x59\x11\x80\x85\x12\x88\x89\x0f\x01" } },
    .{ "EnumerateLoadedModulesW64", MethodRecord{ .library = "dbghelp", .import = "EnumerateLoadedModulesW64", .signature = "\x00\x03\x11\x59\x11\x80\x85\x12\x88\x8d\x0f\x01" } },
    .{ "SymFunctionTableAccess64", MethodRecord{ .library = "dbghelp", .import = "SymFunctionTableAccess64", .signature = "\x00\x02\x0f\x01\x11\x80\x85\x0b" } },
    .{ "SymFunctionTableAccess64AccessRoutines", MethodRecord{ .library = "dbghelp", .import = "SymFunctionTableAccess64AccessRoutines", .signature = "\x00\x04\x0f\x01\x11\x80\x85\x0b\x12\x88\x3d\x12\x88\x45" } },
    .{ "SymGetUnwindInfo", MethodRecord{ .library = "dbghelp", .import = "SymGetUnwindInfo", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x0f\x01\x0f\x09" } },
    .{ "SymGetModuleInfo64", MethodRecord{ .library = "dbghelp", .import = "SymGetModuleInfo64", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0b\x0f\x11\x88\x95" } },
    .{ "SymGetModuleInfoW64", MethodRecord{ .library = "dbghelp", .import = "SymGetModuleInfoW64", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0b\x0f\x11\x88\x99" } },
    .{ "SymGetModuleBase64", MethodRecord{ .library = "dbghelp", .import = "SymGetModuleBase64", .signature = "\x00\x02\x0b\x11\x80\x85\x0b" } },
    .{ "SymEnumLines", MethodRecord{ .library = "dbghelp", .import = "SymEnumLines", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0b\x11\x3d\x11\x3d\x12\x88\xa5\x0f\x01" } },
    .{ "SymEnumLinesW", MethodRecord{ .library = "dbghelp", .import = "SymEnumLinesW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0b\x11\x05\x11\x05\x12\x88\xa9\x0f\x01" } },
    .{ "SymGetLineFromAddr64", MethodRecord{ .library = "dbghelp", .import = "SymGetLineFromAddr64", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x0f\x09\x0f\x11\x88\xad" } },
    .{ "SymGetLineFromAddrW64", MethodRecord{ .library = "dbghelp", .import = "SymGetLineFromAddrW64", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x0f\x09\x0f\x11\x88\xb1" } },
    .{ "SymGetLineFromInlineContext", MethodRecord{ .library = "dbghelp", .import = "SymGetLineFromInlineContext", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0b\x09\x0b\x0f\x09\x0f\x11\x88\xad" } },
    .{ "SymGetLineFromInlineContextW", MethodRecord{ .library = "dbghelp", .import = "SymGetLineFromInlineContextW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0b\x09\x0b\x0f\x09\x0f\x11\x88\xb1" } },
    .{ "SymEnumSourceLines", MethodRecord{ .library = "dbghelp", .import = "SymEnumSourceLines", .signature = "\x00\x08\x11\x59\x11\x80\x85\x0b\x11\x3d\x11\x3d\x09\x09\x12\x88\xa5\x0f\x01" } },
    .{ "SymEnumSourceLinesW", MethodRecord{ .library = "dbghelp", .import = "SymEnumSourceLinesW", .signature = "\x00\x08\x11\x59\x11\x80\x85\x0b\x11\x05\x11\x05\x09\x09\x12\x88\xa9\x0f\x01" } },
    .{ "SymAddrIncludeInlineTrace", MethodRecord{ .library = "dbghelp", .import = "SymAddrIncludeInlineTrace", .signature = "\x00\x02\x09\x11\x80\x85\x0b" } },
    .{ "SymCompareInlineTrace", MethodRecord{ .library = "dbghelp", .import = "SymCompareInlineTrace", .signature = "\x00\x06\x09\x11\x80\x85\x0b\x09\x0b\x0b\x0b" } },
    .{ "SymQueryInlineTrace", MethodRecord{ .library = "dbghelp", .import = "SymQueryInlineTrace", .signature = "\x00\x07\x11\x59\x11\x80\x85\x0b\x09\x0b\x0b\x0f\x09\x0f\x09" } },
    .{ "SymGetLineFromName64", MethodRecord{ .library = "dbghelp", .import = "SymGetLineFromName64", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x3d\x11\x3d\x09\x0f\x08\x0f\x11\x88\xad" } },
    .{ "SymGetLineFromNameW64", MethodRecord{ .library = "dbghelp", .import = "SymGetLineFromNameW64", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x05\x11\x05\x09\x0f\x08\x0f\x11\x88\xb1" } },
    .{ "SymGetLineNext64", MethodRecord{ .library = "dbghelp", .import = "SymGetLineNext64", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x88\xad" } },
    .{ "SymGetLineNextW64", MethodRecord{ .library = "dbghelp", .import = "SymGetLineNextW64", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x88\xb1" } },
    .{ "SymGetLinePrev64", MethodRecord{ .library = "dbghelp", .import = "SymGetLinePrev64", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x88\xad" } },
    .{ "SymGetLinePrevW64", MethodRecord{ .library = "dbghelp", .import = "SymGetLinePrevW64", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x88\xb1" } },
    .{ "SymGetFileLineOffsets64", MethodRecord{ .library = "dbghelp", .import = "SymGetFileLineOffsets64", .signature = "\x00\x05\x09\x11\x80\x85\x11\x3d\x11\x3d\x0f\x0b\x09" } },
    .{ "SymMatchFileName", MethodRecord{ .library = "dbghelp", .import = "SymMatchFileName", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x3d\x0f\x11\x3d\x0f\x11\x3d" } },
    .{ "SymMatchFileNameW", MethodRecord{ .library = "dbghelp", .import = "SymMatchFileNameW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x05\x0f\x11\x05\x0f\x11\x05" } },
    .{ "SymGetSourceFile", MethodRecord{ .library = "dbghelp", .import = "SymGetSourceFile", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0b\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "SymGetSourceFileW", MethodRecord{ .library = "dbghelp", .import = "SymGetSourceFileW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0b\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "SymGetSourceFileToken", MethodRecord{ .library = "dbghelp", .import = "SymGetSourceFileToken", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x11\x3d\x0f\x0f\x01\x0f\x09" } },
    .{ "SymGetSourceFileTokenByTokenName", MethodRecord{ .library = "dbghelp", .import = "SymGetSourceFileTokenByTokenName", .signature = "\x00\x07\x11\x59\x11\x80\x85\x0b\x11\x3d\x11\x3d\x11\x3d\x0f\x0f\x01\x0f\x09" } },
    .{ "SymGetSourceFileChecksumW", MethodRecord{ .library = "dbghelp", .import = "SymGetSourceFileChecksumW", .signature = "\x00\x07\x11\x59\x11\x80\x85\x0b\x11\x05\x0f\x09\x0f\x05\x09\x0f\x09" } },
    .{ "SymGetSourceFileChecksum", MethodRecord{ .library = "dbghelp", .import = "SymGetSourceFileChecksum", .signature = "\x00\x07\x11\x59\x11\x80\x85\x0b\x11\x3d\x0f\x09\x0f\x05\x09\x0f\x09" } },
    .{ "SymGetSourceFileTokenW", MethodRecord{ .library = "dbghelp", .import = "SymGetSourceFileTokenW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x11\x05\x0f\x0f\x01\x0f\x09" } },
    .{ "SymGetSourceFileTokenByTokenNameW", MethodRecord{ .library = "dbghelp", .import = "SymGetSourceFileTokenByTokenNameW", .signature = "\x00\x07\x11\x59\x11\x80\x85\x0b\x11\x05\x11\x05\x11\x05\x0f\x0f\x01\x0f\x09" } },
    .{ "SymGetSourceFileFromToken", MethodRecord{ .library = "dbghelp", .import = "SymGetSourceFileFromToken", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x11\x3d\x11\x3d\x09" } },
    .{ "SymGetSourceFileFromTokenByTokenName", MethodRecord{ .library = "dbghelp", .import = "SymGetSourceFileFromTokenByTokenName", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x01\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "SymGetSourceFileFromTokenW", MethodRecord{ .library = "dbghelp", .import = "SymGetSourceFileFromTokenW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x11\x05\x11\x05\x09" } },
    .{ "SymGetSourceFileFromTokenByTokenNameW", MethodRecord{ .library = "dbghelp", .import = "SymGetSourceFileFromTokenByTokenNameW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x01\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "SymGetSourceVarFromToken", MethodRecord{ .library = "dbghelp", .import = "SymGetSourceVarFromToken", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x01\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "SymGetSourceVarFromTokenW", MethodRecord{ .library = "dbghelp", .import = "SymGetSourceVarFromTokenW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0f\x01\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "SymEnumSourceFileTokens", MethodRecord{ .library = "dbghelp", .import = "SymEnumSourceFileTokens", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0b\x12\x88\xb9" } },
    .{ "SymInitialize", MethodRecord{ .library = "dbghelp", .import = "SymInitialize", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x3d\x11\x59" } },
    .{ "SymInitializeW", MethodRecord{ .library = "dbghelp", .import = "SymInitializeW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x05\x11\x59" } },
    .{ "SymGetSearchPath", MethodRecord{ .library = "dbghelp", .import = "SymGetSearchPath", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x3d\x09" } },
    .{ "SymGetSearchPathW", MethodRecord{ .library = "dbghelp", .import = "SymGetSearchPathW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x05\x09" } },
    .{ "SymSetSearchPath", MethodRecord{ .library = "dbghelp", .import = "SymSetSearchPath", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x3d" } },
    .{ "SymSetSearchPathW", MethodRecord{ .library = "dbghelp", .import = "SymSetSearchPathW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x05" } },
    .{ "SymLoadModuleEx", MethodRecord{ .library = "dbghelp", .import = "SymLoadModuleEx", .signature = "\x00\x08\x0b\x11\x80\x85\x11\x80\x85\x11\x3d\x11\x3d\x0b\x09\x0f\x11\x88\xbd\x11\x88\xc1" } },
    .{ "SymLoadModuleExW", MethodRecord{ .library = "dbghelp", .import = "SymLoadModuleExW", .signature = "\x00\x08\x0b\x11\x80\x85\x11\x80\x85\x11\x05\x11\x05\x0b\x09\x0f\x11\x88\xbd\x11\x88\xc1" } },
    .{ "SymUnloadModule64", MethodRecord{ .library = "dbghelp", .import = "SymUnloadModule64", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0b" } },
    .{ "SymUnDName64", MethodRecord{ .library = "dbghelp", .import = "SymUnDName64", .signature = "\x00\x03\x11\x59\x0f\x11\x88\xc5\x11\x3d\x09" } },
    .{ "SymRegisterCallback64", MethodRecord{ .library = "dbghelp", .import = "SymRegisterCallback64", .signature = "\x00\x03\x11\x59\x11\x80\x85\x12\x88\xcd\x0b" } },
    .{ "SymRegisterCallbackW64", MethodRecord{ .library = "dbghelp", .import = "SymRegisterCallbackW64", .signature = "\x00\x03\x11\x59\x11\x80\x85\x12\x88\xcd\x0b" } },
    .{ "SymRegisterFunctionEntryCallback64", MethodRecord{ .library = "dbghelp", .import = "SymRegisterFunctionEntryCallback64", .signature = "\x00\x03\x11\x59\x11\x80\x85\x12\x88\xd1\x0b" } },
    .{ "SymSetContext", MethodRecord{ .library = "dbghelp", .import = "SymSetContext", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0f\x11\x88\xdd\x0f\x01" } },
    .{ "SymSetScopeFromAddr", MethodRecord{ .library = "dbghelp", .import = "SymSetScopeFromAddr", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0b" } },
    .{ "SymSetScopeFromInlineContext", MethodRecord{ .library = "dbghelp", .import = "SymSetScopeFromInlineContext", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0b\x09" } },
    .{ "SymSetScopeFromIndex", MethodRecord{ .library = "dbghelp", .import = "SymSetScopeFromIndex", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0b\x09" } },
    .{ "SymEnumProcesses", MethodRecord{ .library = "dbghelp", .import = "SymEnumProcesses", .signature = "\x00\x02\x11\x59\x12\x88\xe1\x0f\x01" } },
    .{ "SymFromAddr", MethodRecord{ .library = "dbghelp", .import = "SymFromAddr", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x0f\x0b\x0f\x11\x88\xe5" } },
    .{ "SymFromAddrW", MethodRecord{ .library = "dbghelp", .import = "SymFromAddrW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x0f\x0b\x0f\x11\x88\xe9" } },
    .{ "SymFromInlineContext", MethodRecord{ .library = "dbghelp", .import = "SymFromInlineContext", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x09\x0f\x0b\x0f\x11\x88\xe5" } },
    .{ "SymFromInlineContextW", MethodRecord{ .library = "dbghelp", .import = "SymFromInlineContextW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x09\x0f\x0b\x0f\x11\x88\xe9" } },
    .{ "SymFromToken", MethodRecord{ .library = "dbghelp", .import = "SymFromToken", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x09\x0f\x11\x88\xe5" } },
    .{ "SymFromTokenW", MethodRecord{ .library = "dbghelp", .import = "SymFromTokenW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x09\x0f\x11\x88\xe9" } },
    .{ "SymNext", MethodRecord{ .library = "dbghelp", .import = "SymNext", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x88\xe5" } },
    .{ "SymNextW", MethodRecord{ .library = "dbghelp", .import = "SymNextW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x88\xe9" } },
    .{ "SymPrev", MethodRecord{ .library = "dbghelp", .import = "SymPrev", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x88\xe5" } },
    .{ "SymPrevW", MethodRecord{ .library = "dbghelp", .import = "SymPrevW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x88\xe9" } },
    .{ "SymFromName", MethodRecord{ .library = "dbghelp", .import = "SymFromName", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x3d\x0f\x11\x88\xe5" } },
    .{ "SymFromNameW", MethodRecord{ .library = "dbghelp", .import = "SymFromNameW", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x05\x0f\x11\x88\xe9" } },
    .{ "SymEnumSymbols", MethodRecord{ .library = "dbghelp", .import = "SymEnumSymbols", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x11\x3d\x12\x88\xed\x0f\x01" } },
    .{ "SymEnumSymbolsEx", MethodRecord{ .library = "dbghelp", .import = "SymEnumSymbolsEx", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0b\x11\x3d\x12\x88\xed\x0f\x01\x09" } },
    .{ "SymEnumSymbolsW", MethodRecord{ .library = "dbghelp", .import = "SymEnumSymbolsW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x11\x05\x12\x88\xf1\x0f\x01" } },
    .{ "SymEnumSymbolsExW", MethodRecord{ .library = "dbghelp", .import = "SymEnumSymbolsExW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0b\x11\x05\x12\x88\xf1\x0f\x01\x09" } },
    .{ "SymEnumSymbolsForAddr", MethodRecord{ .library = "dbghelp", .import = "SymEnumSymbolsForAddr", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x12\x88\xed\x0f\x01" } },
    .{ "SymEnumSymbolsForAddrW", MethodRecord{ .library = "dbghelp", .import = "SymEnumSymbolsForAddrW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x12\x88\xf1\x0f\x01" } },
    .{ "SymSearch", MethodRecord{ .library = "dbghelp", .import = "SymSearch", .signature = "\x00\x09\x11\x59\x11\x80\x85\x0b\x09\x09\x11\x3d\x0b\x12\x88\xed\x0f\x01\x09" } },
    .{ "SymSearchW", MethodRecord{ .library = "dbghelp", .import = "SymSearchW", .signature = "\x00\x09\x11\x59\x11\x80\x85\x0b\x09\x09\x11\x05\x0b\x12\x88\xf1\x0f\x01\x09" } },
    .{ "SymGetScope", MethodRecord{ .library = "dbghelp", .import = "SymGetScope", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x09\x0f\x11\x88\xe5" } },
    .{ "SymGetScopeW", MethodRecord{ .library = "dbghelp", .import = "SymGetScopeW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x09\x0f\x11\x88\xe9" } },
    .{ "SymFromIndex", MethodRecord{ .library = "dbghelp", .import = "SymFromIndex", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x09\x0f\x11\x88\xe5" } },
    .{ "SymFromIndexW", MethodRecord{ .library = "dbghelp", .import = "SymFromIndexW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x09\x0f\x11\x88\xe9" } },
    .{ "SymGetTypeInfo", MethodRecord{ .library = "dbghelp", .import = "SymGetTypeInfo", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x09\x11\x88\xf5\x0f\x01" } },
    .{ "SymGetTypeInfoEx", MethodRecord{ .library = "dbghelp", .import = "SymGetTypeInfoEx", .signature = "\x00\x03\x11\x59\x11\x80\x85\x0b\x0f\x11\x88\xf9" } },
    .{ "SymEnumTypes", MethodRecord{ .library = "dbghelp", .import = "SymEnumTypes", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x12\x88\xed\x0f\x01" } },
    .{ "SymEnumTypesW", MethodRecord{ .library = "dbghelp", .import = "SymEnumTypesW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x12\x88\xf1\x0f\x01" } },
    .{ "SymEnumTypesByName", MethodRecord{ .library = "dbghelp", .import = "SymEnumTypesByName", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x11\x3d\x12\x88\xed\x0f\x01" } },
    .{ "SymEnumTypesByNameW", MethodRecord{ .library = "dbghelp", .import = "SymEnumTypesByNameW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x11\x05\x12\x88\xf1\x0f\x01" } },
    .{ "SymGetTypeFromName", MethodRecord{ .library = "dbghelp", .import = "SymGetTypeFromName", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x11\x3d\x0f\x11\x88\xe5" } },
    .{ "SymGetTypeFromNameW", MethodRecord{ .library = "dbghelp", .import = "SymGetTypeFromNameW", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x11\x05\x0f\x11\x88\xe9" } },
    .{ "SymAddSymbol", MethodRecord{ .library = "dbghelp", .import = "SymAddSymbol", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0b\x11\x3d\x0b\x09\x09" } },
    .{ "SymAddSymbolW", MethodRecord{ .library = "dbghelp", .import = "SymAddSymbolW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x0b\x11\x05\x0b\x09\x09" } },
    .{ "SymDeleteSymbol", MethodRecord{ .library = "dbghelp", .import = "SymDeleteSymbol", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x11\x3d\x0b\x09" } },
    .{ "SymDeleteSymbolW", MethodRecord{ .library = "dbghelp", .import = "SymDeleteSymbolW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x11\x05\x0b\x09" } },
    .{ "SymRefreshModuleList", MethodRecord{ .library = "dbghelp", .import = "SymRefreshModuleList", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "SymAddSourceStream", MethodRecord{ .library = "dbghelp", .import = "SymAddSourceStream", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x11\x3d\x0f\x05\x19" } },
    .{ "SymAddSourceStreamA", MethodRecord{ .library = "dbghelp", .import = "SymAddSourceStreamA", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x11\x3d\x0f\x05\x19" } },
    .{ "SymAddSourceStreamW", MethodRecord{ .library = "dbghelp", .import = "SymAddSourceStreamW", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0b\x11\x05\x0f\x05\x19" } },
    .{ "SymSrvIsStoreW", MethodRecord{ .library = "dbghelp", .import = "SymSrvIsStoreW", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x05" } },
    .{ "SymSrvIsStore", MethodRecord{ .library = "dbghelp", .import = "SymSrvIsStore", .signature = "\x00\x02\x11\x59\x11\x80\x85\x11\x3d" } },
    .{ "SymSrvDeltaName", MethodRecord{ .library = "dbghelp", .import = "SymSrvDeltaName", .signature = "\x00\x05\x11\x3d\x11\x80\x85\x11\x3d\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "SymSrvDeltaNameW", MethodRecord{ .library = "dbghelp", .import = "SymSrvDeltaNameW", .signature = "\x00\x05\x11\x05\x11\x80\x85\x11\x05\x11\x05\x11\x05\x11\x05" } },
    .{ "SymSrvGetSupplement", MethodRecord{ .library = "dbghelp", .import = "SymSrvGetSupplement", .signature = "\x00\x04\x11\x3d\x11\x80\x85\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "SymSrvGetSupplementW", MethodRecord{ .library = "dbghelp", .import = "SymSrvGetSupplementW", .signature = "\x00\x04\x11\x05\x11\x80\x85\x11\x05\x11\x05\x11\x05" } },
    .{ "SymSrvGetFileIndexes", MethodRecord{ .library = "dbghelp", .import = "SymSrvGetFileIndexes", .signature = "\x00\x05\x11\x59\x11\x3d\x0f\x11\x0d\x0f\x09\x0f\x09\x09" } },
    .{ "SymSrvGetFileIndexesW", MethodRecord{ .library = "dbghelp", .import = "SymSrvGetFileIndexesW", .signature = "\x00\x05\x11\x59\x11\x05\x0f\x11\x0d\x0f\x09\x0f\x09\x09" } },
    .{ "SymSrvGetFileIndexStringW", MethodRecord{ .library = "dbghelp", .import = "SymSrvGetFileIndexStringW", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x05\x11\x05\x11\x05\x19\x09" } },
    .{ "SymSrvGetFileIndexString", MethodRecord{ .library = "dbghelp", .import = "SymSrvGetFileIndexString", .signature = "\x00\x06\x11\x59\x11\x80\x85\x11\x3d\x11\x3d\x11\x3d\x19\x09" } },
    .{ "SymSrvGetFileIndexInfo", MethodRecord{ .library = "dbghelp", .import = "SymSrvGetFileIndexInfo", .signature = "\x00\x03\x11\x59\x11\x3d\x0f\x11\x88\xfd\x09" } },
    .{ "SymSrvGetFileIndexInfoW", MethodRecord{ .library = "dbghelp", .import = "SymSrvGetFileIndexInfoW", .signature = "\x00\x03\x11\x59\x11\x05\x0f\x11\x89\x01\x09" } },
    .{ "SymSrvStoreSupplement", MethodRecord{ .library = "dbghelp", .import = "SymSrvStoreSupplement", .signature = "\x00\x05\x11\x3d\x11\x80\x85\x11\x3d\x11\x3d\x11\x3d\x09" } },
    .{ "SymSrvStoreSupplementW", MethodRecord{ .library = "dbghelp", .import = "SymSrvStoreSupplementW", .signature = "\x00\x05\x11\x05\x11\x80\x85\x11\x05\x11\x05\x11\x05\x09" } },
    .{ "SymSrvStoreFile", MethodRecord{ .library = "dbghelp", .import = "SymSrvStoreFile", .signature = "\x00\x04\x11\x3d\x11\x80\x85\x11\x3d\x11\x3d\x11\x89\x05" } },
    .{ "SymSrvStoreFileW", MethodRecord{ .library = "dbghelp", .import = "SymSrvStoreFileW", .signature = "\x00\x04\x11\x05\x11\x80\x85\x11\x05\x11\x05\x11\x89\x05" } },
    .{ "SymGetSymbolFile", MethodRecord{ .library = "dbghelp", .import = "SymGetSymbolFile", .signature = "\x00\x08\x11\x59\x11\x80\x85\x11\x3d\x11\x3d\x09\x11\x3d\x19\x11\x3d\x19" } },
    .{ "SymGetSymbolFileW", MethodRecord{ .library = "dbghelp", .import = "SymGetSymbolFileW", .signature = "\x00\x08\x11\x59\x11\x80\x85\x11\x05\x11\x05\x09\x11\x05\x19\x11\x05\x19" } },
    .{ "DbgHelpCreateUserDump", MethodRecord{ .library = "dbghelp", .import = "DbgHelpCreateUserDump", .signature = "\x00\x03\x11\x59\x11\x3d\x12\x89\x09\x0f\x01" } },
    .{ "DbgHelpCreateUserDumpW", MethodRecord{ .library = "dbghelp", .import = "DbgHelpCreateUserDumpW", .signature = "\x00\x03\x11\x59\x11\x05\x12\x89\x09\x0f\x01" } },
    .{ "SymGetSymFromAddr64", MethodRecord{ .library = "dbghelp", .import = "SymGetSymFromAddr64", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x0f\x0b\x0f\x11\x88\xc5" } },
    .{ "SymGetSymFromName64", MethodRecord{ .library = "dbghelp", .import = "SymGetSymFromName64", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x3d\x0f\x11\x88\xc5" } },
    .{ "FindFileInPath", MethodRecord{ .library = "dbghelp", .import = "FindFileInPath", .signature = "\x00\x08\x11\x59\x11\x80\x85\x11\x3d\x11\x3d\x0f\x01\x09\x09\x09\x11\x3d" } },
    .{ "FindFileInSearchPath", MethodRecord{ .library = "dbghelp", .import = "FindFileInSearchPath", .signature = "\x00\x07\x11\x59\x11\x80\x85\x11\x3d\x11\x3d\x09\x09\x09\x11\x3d" } },
    .{ "SymEnumSym", MethodRecord{ .library = "dbghelp", .import = "SymEnumSym", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x12\x88\xed\x0f\x01" } },
    .{ "SymEnumerateSymbols64", MethodRecord{ .library = "dbghelp", .import = "SymEnumerateSymbols64", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x12\x89\x11\x0f\x01" } },
    .{ "SymEnumerateSymbolsW64", MethodRecord{ .library = "dbghelp", .import = "SymEnumerateSymbolsW64", .signature = "\x00\x04\x11\x59\x11\x80\x85\x0b\x12\x89\x15\x0f\x01" } },
    .{ "SymLoadModule64", MethodRecord{ .library = "dbghelp", .import = "SymLoadModule64", .signature = "\x00\x06\x0b\x11\x80\x85\x11\x80\x85\x11\x3d\x11\x3d\x0b\x09" } },
    .{ "SymGetSymNext64", MethodRecord{ .library = "dbghelp", .import = "SymGetSymNext64", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x88\xc5" } },
    .{ "SymGetSymPrev64", MethodRecord{ .library = "dbghelp", .import = "SymGetSymPrev64", .signature = "\x00\x02\x11\x59\x11\x80\x85\x0f\x11\x88\xc5" } },
    .{ "SetCheckUserInterruptShared", MethodRecord{ .library = "dbghelp", .import = "SetCheckUserInterruptShared", .signature = "\x00\x01\x01\x12\x89\x21" } },
    .{ "GetSymLoadError", MethodRecord{ .library = "dbghelp", .import = "GetSymLoadError", .signature = "\x00\x00\x09" } },
    .{ "SetSymLoadError", MethodRecord{ .library = "dbghelp", .import = "SetSymLoadError", .signature = "\x00\x01\x01\x09" } },
    .{ "ReportSymbolLoadSummary", MethodRecord{ .library = "dbghelp", .import = "ReportSymbolLoadSummary", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x05\x0f\x11\x89\x25" } },
    .{ "RemoveInvalidModuleList", MethodRecord{ .library = "dbghelp", .import = "RemoveInvalidModuleList", .signature = "\x00\x01\x01\x11\x80\x85" } },
    .{ "RangeMapCreate", MethodRecord{ .library = "dbghelp", .import = "RangeMapCreate", .signature = "\x00\x00\x0f\x01" } },
    .{ "RangeMapFree", MethodRecord{ .library = "dbghelp", .import = "RangeMapFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "RangeMapAddPeImageSections", MethodRecord{ .library = "dbghelp", .import = "RangeMapAddPeImageSections", .signature = "\x00\x07\x11\x59\x0f\x01\x11\x05\x0f\x01\x09\x0b\x0b\x09" } },
    .{ "RangeMapRemove", MethodRecord{ .library = "dbghelp", .import = "RangeMapRemove", .signature = "\x00\x02\x11\x59\x0f\x01\x0b" } },
    .{ "RangeMapRead", MethodRecord{ .library = "dbghelp", .import = "RangeMapRead", .signature = "\x00\x06\x11\x59\x0f\x01\x0b\x0f\x01\x09\x09\x0f\x09" } },
    .{ "RangeMapWrite", MethodRecord{ .library = "dbghelp", .import = "RangeMapWrite", .signature = "\x00\x06\x11\x59\x0f\x01\x0b\x0f\x01\x09\x09\x0f\x09" } },
    .{ "MessageBeep", MethodRecord{ .library = "USER32", .import = "MessageBeep", .signature = "\x00\x01\x11\x59\x11\x89\x29" } },
    .{ "FatalExit", MethodRecord{ .library = "KERNEL32", .import = "FatalExit", .signature = "\x00\x01\x01\x08" } },
    .{ "GetThreadSelectorEntry", MethodRecord{ .library = "KERNEL32", .import = "GetThreadSelectorEntry", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x0f\x11\x89\x31" } },
    .{ "Wow64GetThreadSelectorEntry", MethodRecord{ .library = "KERNEL32", .import = "Wow64GetThreadSelectorEntry", .signature = "\x00\x03\x11\x59\x11\x80\x85\x09\x0f\x11\x89\x35" } },
    .{ "DebugSetProcessKillOnExit", MethodRecord{ .library = "KERNEL32", .import = "DebugSetProcessKillOnExit", .signature = "\x00\x01\x11\x59\x11\x59" } },
    .{ "DebugBreakProcess", MethodRecord{ .library = "KERNEL32", .import = "DebugBreakProcess", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "FormatMessageA", MethodRecord{ .library = "KERNEL32", .import = "FormatMessageA", .signature = "\x00\x07\x09\x11\x89\x39\x0f\x01\x09\x09\x11\x3d\x09\x0f\x0f\x04" } },
    .{ "FormatMessageW", MethodRecord{ .library = "KERNEL32", .import = "FormatMessageW", .signature = "\x00\x07\x09\x11\x89\x39\x0f\x01\x09\x09\x11\x05\x09\x0f\x0f\x04" } },
    .{ "CopyContext", MethodRecord{ .library = "KERNEL32", .import = "CopyContext", .signature = "\x00\x03\x11\x59\x0f\x11\x87\x99\x11\x89\x3d\x0f\x11\x87\x99" } },
    .{ "InitializeContext", MethodRecord{ .library = "KERNEL32", .import = "InitializeContext", .signature = "\x00\x04\x11\x59\x0f\x01\x11\x89\x3d\x0f\x0f\x11\x87\x99\x0f\x09" } },
    .{ "InitializeContext2", MethodRecord{ .library = "KERNEL32", .import = "InitializeContext2", .signature = "\x00\x05\x11\x59\x0f\x01\x11\x89\x3d\x0f\x0f\x11\x87\x99\x0f\x09\x0b" } },
    .{ "GetEnabledXStateFeatures", MethodRecord{ .library = "KERNEL32", .import = "GetEnabledXStateFeatures", .signature = "\x00\x00\x0b" } },
    .{ "GetXStateFeaturesMask", MethodRecord{ .library = "KERNEL32", .import = "GetXStateFeaturesMask", .signature = "\x00\x02\x11\x59\x0f\x11\x87\x99\x0f\x0b" } },
    .{ "LocateXStateFeature", MethodRecord{ .library = "KERNEL32", .import = "LocateXStateFeature", .signature = "\x00\x03\x0f\x01\x0f\x11\x87\x99\x09\x0f\x09" } },
    .{ "SetXStateFeaturesMask", MethodRecord{ .library = "KERNEL32", .import = "SetXStateFeaturesMask", .signature = "\x00\x02\x11\x59\x0f\x11\x87\x99\x0b" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x181 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HMODULE" },
        0x471 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "NTSTATUS" },
        0x645 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SYSTEMTIME" },
        0x779 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOLEAN" },
        0x789 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PGET_RUNTIME_FUNCTION_CALLBACK" },
        0x78d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "UNWIND_HISTORY_TABLE" },
        0x791 => TypeRefEntry{ .namespace = "Windows.Win32.System.Kernel", .name = "EXCEPTION_ROUTINE" },
        0x795 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "RTL_VIRTUAL_UNWIND_HANDLER_TYPE" },
        0x799 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "CONTEXT" },
        0x79d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "KNONVOLATILE_CONTEXT_POINTERS" },
        0x7a1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "WOW64_CONTEXT" },
        0x7a5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGE_RUNTIME_FUNCTION_ENTRY" },
        0x7a9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "EXCEPTION_RECORD" },
        0x7ad => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGE_NT_HEADERS64" },
        0x7b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "LOADED_IMAGE" },
        0x7b5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGE_LOAD_CONFIG_DIRECTORY64" },
        0x7b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGE_SECTION_HEADER" },
        0x7bd => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "DEBUG_EVENT" },
        0x7c1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "EXCEPTION_POINTERS" },
        0x7c5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "LPTOP_LEVEL_EXCEPTION_FILTER" },
        0x7c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "THREAD_ERROR_MODE" },
        0x7cd => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PVECTORED_EXCEPTION_HANDLER" },
        0x7d1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "OPEN_THREAD_WAIT_CHAIN_SESSION_FLAGS" },
        0x7d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PWAITCHAINCALLBACK" },
        0x7d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "WAIT_CHAIN_THREAD_OPTIONS" },
        0x7dd => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "WAITCHAIN_NODE_INFO" },
        0x7e1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PCOGETCALLSTATE" },
        0x7e5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PCOGETACTIVATIONSTATE" },
        0x7e9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "MINIDUMP_TYPE" },
        0x7ed => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "MINIDUMP_EXCEPTION_INFORMATION" },
        0x7f1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "MINIDUMP_USER_STREAM_INFORMATION" },
        0x7f5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "MINIDUMP_CALLBACK_INFORMATION" },
        0x7f9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "MINIDUMP_DIRECTORY" },
        0x7fd => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PIMAGEHLP_STATUS_ROUTINE" },
        0x801 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGE_NT_HEADERS32" },
        0x809 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "DIGEST_FUNCTION" },
        0x80d => TypeRefEntry{ .namespace = "Windows.Win32.Security.WinTrust", .name = "WIN_CERTIFICATE" },
        0x811 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PFIND_DEBUG_FILE_CALLBACK" },
        0x815 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PFIND_DEBUG_FILE_CALLBACKW" },
        0x819 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "SYM_FIND_ID_OPTION" },
        0x81d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PFINDFILEINPATHCALLBACK" },
        0x821 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PFINDFILEINPATHCALLBACKW" },
        0x825 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PFIND_EXE_FILE_CALLBACK" },
        0x829 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PFIND_EXE_FILE_CALLBACKW" },
        0x82d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGE_DIRECTORY_ENTRY" },
        0x831 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PENUMDIRTREE_CALLBACK" },
        0x835 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PENUMDIRTREE_CALLBACKW" },
        0x839 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "STACKFRAME64" },
        0x83d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PREAD_PROCESS_MEMORY_ROUTINE64" },
        0x841 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PFUNCTION_TABLE_ACCESS_ROUTINE64" },
        0x845 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PGET_MODULE_BASE_ROUTINE64" },
        0x849 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PTRANSLATE_ADDRESS_ROUTINE64" },
        0x84d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "STACKFRAME_EX" },
        0x851 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PGET_TARGET_ATTRIBUTE_VALUE64" },
        0x869 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "API_VERSION" },
        0x86d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "OMAP" },
        0x871 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGEHLP_EXTENDED_OPTIONS" },
        0x875 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PSYM_ENUMSOURCEFILES_CALLBACK" },
        0x879 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PSYM_ENUMSOURCEFILES_CALLBACKW" },
        0x87d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PSYM_ENUMMODULES_CALLBACK64" },
        0x881 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PSYM_ENUMMODULES_CALLBACKW64" },
        0x889 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PENUMLOADED_MODULES_CALLBACK64" },
        0x88d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PENUMLOADED_MODULES_CALLBACKW64" },
        0x895 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGEHLP_MODULE64" },
        0x899 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGEHLP_MODULEW64" },
        0x8a5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PSYM_ENUMLINES_CALLBACK" },
        0x8a9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PSYM_ENUMLINES_CALLBACKW" },
        0x8ad => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGEHLP_LINE64" },
        0x8b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGEHLP_LINEW64" },
        0x8b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PENUMSOURCEFILETOKENSCALLBACK" },
        0x8bd => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "MODLOAD_DATA" },
        0x8c1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "SYM_LOAD_FLAGS" },
        0x8c5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGEHLP_SYMBOL64" },
        0x8cd => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PSYMBOL_REGISTERED_CALLBACK64" },
        0x8d1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PSYMBOL_FUNCENTRY_CALLBACK64" },
        0x8dd => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGEHLP_STACK_FRAME" },
        0x8e1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PSYM_ENUMPROCESSES_CALLBACK" },
        0x8e5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "SYMBOL_INFO" },
        0x8e9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "SYMBOL_INFOW" },
        0x8ed => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PSYM_ENUMERATESYMBOLS_CALLBACK" },
        0x8f1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PSYM_ENUMERATESYMBOLS_CALLBACKW" },
        0x8f5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGEHLP_SYMBOL_TYPE_INFO" },
        0x8f9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "IMAGEHLP_GET_TYPE_INFO_PARAMS" },
        0x8fd => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "SYMSRV_INDEX_INFO" },
        0x901 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "SYMSRV_INDEX_INFOW" },
        0x905 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "SYM_SRV_STORE_FILE_FLAGS" },
        0x909 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PDBGHELP_CREATE_USER_DUMP_CALLBACK" },
        0x911 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PSYM_ENUMSYMBOLS_CALLBACK64" },
        0x915 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "PSYM_ENUMSYMBOLS_CALLBACK64W" },
        0x921 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "LPCALL_BACK_USER_INTERRUPT_ROUTINE" },
        0x925 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "DBGHELP_DATA_REPORT_STRUCT" },
        0x929 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "MESSAGEBOX_STYLE" },
        0x931 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "LDT_ENTRY" },
        0x935 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "WOW64_LDT_ENTRY" },
        0x939 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "FORMAT_MESSAGE_OPTIONS" },
        0x93d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug", .name = "CONTEXT_FLAGS" },
        else => null,
    };
}

pub const EXCEPTION_EXECUTE_HANDLER = 1;
pub const EXCEPTION_CONTINUE_SEARCH = 0;
pub const EXCEPTION_CONTINUE_EXECUTION = -1;
pub const WOW64_SIZE_OF_80387_REGISTERS = 80;
pub const WOW64_MAXIMUM_SUPPORTED_EXTENSION = 512;
pub const MAX_SYM_NAME = 2000;
pub const BIND_NO_BOUND_IMPORTS = 1;
pub const BIND_NO_UPDATE = 2;
pub const BIND_ALL_IMAGES = 4;
pub const BIND_CACHE_IMPORT_DLLS = 8;
pub const BIND_REPORT_64BIT_VA = 16;
pub const CHECKSUM_SUCCESS = 0;
pub const CHECKSUM_OPEN_FAILURE = 1;
pub const CHECKSUM_MAP_FAILURE = 2;
pub const CHECKSUM_MAPVIEW_FAILURE = 3;
pub const CHECKSUM_UNICODE_FAILURE = 4;
pub const SPLITSYM_REMOVE_PRIVATE = 1;
pub const SPLITSYM_EXTRACT_ALL = 2;
pub const SPLITSYM_SYMBOLPATH_IS_SRC = 4;
pub const CERT_PE_IMAGE_DIGEST_DEBUG_INFO = 1;
pub const CERT_PE_IMAGE_DIGEST_RESOURCES = 2;
pub const CERT_PE_IMAGE_DIGEST_ALL_IMPORT_INFO = 4;
pub const CERT_PE_IMAGE_DIGEST_NON_PE_INFO = 8;
pub const CERT_SECTION_TYPE_ANY = 255;
pub const ERROR_IMAGE_NOT_STRIPPED = 34816;
pub const ERROR_NO_DBG_POINTER = 34817;
pub const ERROR_NO_PDB_POINTER = 34818;
pub const UNDNAME_COMPLETE = 0;
pub const UNDNAME_NO_LEADING_UNDERSCORES = 1;
pub const UNDNAME_NO_MS_KEYWORDS = 2;
pub const UNDNAME_NO_FUNCTION_RETURNS = 4;
pub const UNDNAME_NO_ALLOCATION_MODEL = 8;
pub const UNDNAME_NO_ALLOCATION_LANGUAGE = 16;
pub const UNDNAME_NO_MS_THISTYPE = 32;
pub const UNDNAME_NO_CV_THISTYPE = 64;
pub const UNDNAME_NO_THISTYPE = 96;
pub const UNDNAME_NO_ACCESS_SPECIFIERS = 128;
pub const UNDNAME_NO_THROW_SIGNATURES = 256;
pub const UNDNAME_NO_MEMBER_TYPE = 512;
pub const UNDNAME_NO_RETURN_UDT_MODEL = 1024;
pub const UNDNAME_32_BIT_DECODE = 2048;
pub const UNDNAME_NAME_ONLY = 4096;
pub const UNDNAME_NO_ARGUMENTS = 8192;
pub const UNDNAME_NO_SPECIAL_SYMS = 16384;
pub const DBHHEADER_PDBGUID = 3;
pub const INLINE_FRAME_CONTEXT_INIT = 0;
pub const INLINE_FRAME_CONTEXT_IGNORE = 4294967295;
pub const TARGET_ATTRIBUTE_PACMASK = 1;
pub const SYM_STKWALK_DEFAULT = 0;
pub const SYM_STKWALK_FORCE_FRAMEPTR = 1;
pub const SYM_STKWALK_ZEROEXTEND_PTRS = 2;
pub const API_VERSION_NUMBER = 12;
pub const SYMFLAG_NULL = 524288;
pub const SYMFLAG_FUNC_NO_RETURN = 1048576;
pub const SYMFLAG_SYNTHETIC_ZEROBASE = 2097152;
pub const SYMFLAG_PUBLIC_CODE = 4194304;
pub const SYMFLAG_REGREL_ALIASINDIR = 8388608;
pub const SYMFLAG_FIXUP_ARM64X = 16777216;
pub const SYMFLAG_GLOBAL = 33554432;
pub const SYMFLAG_COMPLEX = 67108864;
pub const SYMFLAG_RESET = 2147483648;
pub const IMAGEHLP_MODULE_REGION_DLLBASE = 1;
pub const IMAGEHLP_MODULE_REGION_DLLRANGE = 2;
pub const IMAGEHLP_MODULE_REGION_ADDITIONAL = 4;
pub const IMAGEHLP_MODULE_REGION_JIT = 8;
pub const IMAGEHLP_MODULE_REGION_ALL = 255;
pub const CBA_DEFERRED_SYMBOL_LOAD_START = 1;
pub const CBA_DEFERRED_SYMBOL_LOAD_COMPLETE = 2;
pub const CBA_DEFERRED_SYMBOL_LOAD_FAILURE = 3;
pub const CBA_SYMBOLS_UNLOADED = 4;
pub const CBA_DUPLICATE_SYMBOL = 5;
pub const CBA_READ_MEMORY = 6;
pub const CBA_DEFERRED_SYMBOL_LOAD_CANCEL = 7;
pub const CBA_SET_OPTIONS = 8;
pub const CBA_EVENT = 16;
pub const CBA_DEFERRED_SYMBOL_LOAD_PARTIAL = 32;
pub const CBA_DEBUG_INFO = 268435456;
pub const CBA_SRCSRV_INFO = 536870912;
pub const CBA_SRCSRV_EVENT = 1073741824;
pub const CBA_UPDATE_STATUS_BAR = 1342177280;
pub const CBA_ENGINE_PRESENT = 1610612736;
pub const CBA_CHECK_ENGOPT_DISALLOW_NETWORK_PATHS = 1879048192;
pub const CBA_CHECK_ARM_MACHINE_THUMB_TYPE_OVERRIDE = 2147483648;
pub const CBA_XML_LOG = 2415919104;
pub const CBA_MAP_JIT_SYMBOL = 2684354560;
pub const EVENT_SRCSPEW_START = 100;
pub const EVENT_SRCSPEW = 100;
pub const EVENT_SRCSPEW_END = 199;
pub const DSLFLAG_MISMATCHED_PDB = 1;
pub const DSLFLAG_MISMATCHED_DBG = 2;
pub const FLAG_ENGINE_PRESENT = 4;
pub const FLAG_ENGOPT_DISALLOW_NETWORK_PATHS = 8;
pub const FLAG_OVERRIDE_ARM_MACHINE_TYPE = 16;
pub const SYMOPT_CASE_INSENSITIVE = 1;
pub const SYMOPT_UNDNAME = 2;
pub const SYMOPT_DEFERRED_LOADS = 4;
pub const SYMOPT_NO_CPP = 8;
pub const SYMOPT_LOAD_LINES = 16;
pub const SYMOPT_OMAP_FIND_NEAREST = 32;
pub const SYMOPT_LOAD_ANYTHING = 64;
pub const SYMOPT_IGNORE_CVREC = 128;
pub const SYMOPT_NO_UNQUALIFIED_LOADS = 256;
pub const SYMOPT_FAIL_CRITICAL_ERRORS = 512;
pub const SYMOPT_EXACT_SYMBOLS = 1024;
pub const SYMOPT_ALLOW_ABSOLUTE_SYMBOLS = 2048;
pub const SYMOPT_IGNORE_NT_SYMPATH = 4096;
pub const SYMOPT_INCLUDE_32BIT_MODULES = 8192;
pub const SYMOPT_PUBLICS_ONLY = 16384;
pub const SYMOPT_NO_PUBLICS = 32768;
pub const SYMOPT_AUTO_PUBLICS = 65536;
pub const SYMOPT_NO_IMAGE_SEARCH = 131072;
pub const SYMOPT_SECURE = 262144;
pub const SYMOPT_NO_PROMPTS = 524288;
pub const SYMOPT_OVERWRITE = 1048576;
pub const SYMOPT_IGNORE_IMAGEDIR = 2097152;
pub const SYMOPT_FLAT_DIRECTORY = 4194304;
pub const SYMOPT_FAVOR_COMPRESSED = 8388608;
pub const SYMOPT_ALLOW_ZERO_ADDRESS = 16777216;
pub const SYMOPT_DISABLE_SYMSRV_AUTODETECT = 33554432;
pub const SYMOPT_READONLY_CACHE = 67108864;
pub const SYMOPT_SYMPATH_LAST = 134217728;
pub const SYMOPT_DISABLE_FAST_SYMBOLS = 268435456;
pub const SYMOPT_DISABLE_SYMSRV_TIMEOUT = 536870912;
pub const SYMOPT_DISABLE_SRVSTAR_ON_STARTUP = 1073741824;
pub const SYMOPT_DEBUG = 2147483648;
pub const SYM_INLINE_COMP_ERROR = 0;
pub const SYM_INLINE_COMP_IDENTICAL = 1;
pub const SYM_INLINE_COMP_STEPIN = 2;
pub const SYM_INLINE_COMP_STEPOUT = 3;
pub const SYM_INLINE_COMP_STEPOVER = 4;
pub const SYM_INLINE_COMP_DIFFERENT = 5;
pub const ESLFLAG_FULLPATH = 1;
pub const ESLFLAG_NEAREST = 2;
pub const ESLFLAG_PREV = 4;
pub const ESLFLAG_NEXT = 8;
pub const ESLFLAG_INLINE_SITE = 16;
pub const SYMENUM_OPTIONS_DEFAULT = 1;
pub const SYMENUM_OPTIONS_INLINE = 2;
pub const SYMSEARCH_MASKOBJS = 1;
pub const SYMSEARCH_RECURSE = 2;
pub const SYMSEARCH_GLOBALSONLY = 4;
pub const SYMSEARCH_ALLITEMS = 8;
pub const EXT_OUTPUT_VER = 1;
pub const SYMSRV_VERSION = 2;
pub const SSRVOPT_CALLBACK = 1;
pub const SSRVOPT_OLDGUIDPTR = 16;
pub const SSRVOPT_UNATTENDED = 32;
pub const SSRVOPT_NOCOPY = 64;
pub const SSRVOPT_GETPATH = 64;
pub const SSRVOPT_PARENTWIN = 128;
pub const SSRVOPT_PARAMTYPE = 256;
pub const SSRVOPT_SECURE = 512;
pub const SSRVOPT_TRACE = 1024;
pub const SSRVOPT_SETCONTEXT = 2048;
pub const SSRVOPT_PROXY = 4096;
pub const SSRVOPT_DOWNSTREAM_STORE = 8192;
pub const SSRVOPT_OVERWRITE = 16384;
pub const SSRVOPT_RESETTOU = 32768;
pub const SSRVOPT_CALLBACKW = 65536;
pub const SSRVOPT_FLAT_DEFAULT_STORE = 131072;
pub const SSRVOPT_PROXYW = 262144;
pub const SSRVOPT_MESSAGE = 524288;
pub const SSRVOPT_SERVICE = 1048576;
pub const SSRVOPT_FAVOR_COMPRESSED = 2097152;
pub const SSRVOPT_STRING = 4194304;
pub const SSRVOPT_WINHTTP = 8388608;
pub const SSRVOPT_WININET = 16777216;
pub const SSRVOPT_DONT_UNCOMPRESS = 33554432;
pub const SSRVOPT_DISABLE_PING_HOST = 67108864;
pub const SSRVOPT_DISABLE_TIMEOUT = 134217728;
pub const SSRVOPT_ENABLE_COMM_MSG = 268435456;
pub const SSRVOPT_URI_FILTER = 536870912;
pub const SSRVOPT_URI_TIERS = 1073741824;
pub const SSRVOPT_RETRY_APP_HANG = 2147483648;
pub const SSRVOPT_MAX = 2147483648;
pub const NUM_SSRVOPTS = 32;
pub const SSRVURI_HTTP_NORMAL = 1;
pub const SSRVURI_HTTP_COMPRESSED = 2;
pub const SSRVURI_HTTP_FILEPTR = 4;
pub const SSRVURI_UNC_NORMAL = 16;
pub const SSRVURI_UNC_COMPRESSED = 32;
pub const SSRVURI_UNC_FILEPTR = 64;
pub const SSRVURI_HTTP_MASK = 15;
pub const SSRVURI_UNC_MASK = 240;
pub const SSRVURI_ALL = 255;
pub const SSRVURI_NORMAL = 1;
pub const SSRVURI_COMPRESSED = 2;
pub const SSRVURI_FILEPTR = 4;
pub const SSRVACTION_TRACE = 1;
pub const SSRVACTION_QUERYCANCEL = 2;
pub const SSRVACTION_EVENT = 3;
pub const SSRVACTION_EVENTW = 4;
pub const SSRVACTION_SIZE = 5;
pub const SSRVACTION_HTTPSTATUS = 6;
pub const SSRVACTION_XMLOUTPUT = 7;
pub const SSRVACTION_CHECKSUMSTATUS = 8;
pub const SYMSTOREOPT_ALT_INDEX = 16;
pub const SYMSTOREOPT_UNICODE = 32;
pub const SYMF_OMAP_GENERATED = 1;
pub const SYMF_OMAP_MODIFIED = 2;
pub const SYMF_REGISTER = 8;
pub const SYMF_REGREL = 16;
pub const SYMF_FRAMEREL = 32;
pub const SYMF_PARAMETER = 64;
pub const SYMF_LOCAL = 128;
pub const SYMF_CONSTANT = 256;
pub const SYMF_EXPORT = 512;
pub const SYMF_FORWARDER = 1024;
pub const SYMF_FUNCTION = 2048;
pub const SYMF_VIRTUAL = 4096;
pub const SYMF_THUNK = 8192;
pub const SYMF_TLSREL = 16384;
pub const IMAGEHLP_SYMBOL_INFO_VALUEPRESENT = 1;
pub const IMAGEHLP_SYMBOL_INFO_REGISTER = 8;
pub const IMAGEHLP_SYMBOL_INFO_REGRELATIVE = 16;
pub const IMAGEHLP_SYMBOL_INFO_FRAMERELATIVE = 32;
pub const IMAGEHLP_SYMBOL_INFO_PARAMETER = 64;
pub const IMAGEHLP_SYMBOL_INFO_LOCAL = 128;
pub const IMAGEHLP_SYMBOL_INFO_CONSTANT = 256;
pub const IMAGEHLP_SYMBOL_FUNCTION = 2048;
pub const IMAGEHLP_SYMBOL_VIRTUAL = 4096;
pub const IMAGEHLP_SYMBOL_THUNK = 8192;
pub const IMAGEHLP_SYMBOL_INFO_TLSRELATIVE = 16384;
pub const IMAGEHLP_RMAP_MAPPED_FLAT = 1;
pub const IMAGEHLP_RMAP_BIG_ENDIAN = 2;
pub const IMAGEHLP_RMAP_IGNORE_MISCOMPARE = 4;
pub const IMAGEHLP_RMAP_FIXUP_ARM64X = 268435456;
pub const IMAGEHLP_RMAP_LOAD_RW_DATA_SECTIONS = 536870912;
pub const IMAGEHLP_RMAP_OMIT_SHARED_RW_DATA_SECTIONS = 1073741824;
pub const IMAGEHLP_RMAP_FIXUP_IMAGEBASE = 2147483648;
pub const DMP_PHYSICAL_MEMORY_BLOCK_SIZE_32 = 700;
pub const DMP_CONTEXT_RECORD_SIZE_32 = 1200;
pub const DMP_RESERVED_0_SIZE_32 = 1760;
pub const DMP_RESERVED_2_SIZE_32 = 16;
pub const DMP_RESERVED_3_SIZE_32 = 56;
pub const DMP_PHYSICAL_MEMORY_BLOCK_SIZE_64 = 700;
pub const DMP_CONTEXT_RECORD_SIZE_64 = 3000;
pub const DMP_RESERVED_0_SIZE_64 = 4008;
pub const DMP_HEADER_COMMENT_SIZE = 128;
pub const DUMP_SUMMARY_VALID_KERNEL_VA = 1;
pub const DUMP_SUMMARY_VALID_CURRENT_USER_VA = 2;
pub const MINIDUMP_VERSION = 42899;
pub const MINIDUMP_MISC1_PROCESSOR_POWER_INFO = 4;
pub const MINIDUMP_MISC3_PROCESS_INTEGRITY = 16;
pub const MINIDUMP_MISC3_PROCESS_EXECUTE_FLAGS = 32;
pub const MINIDUMP_MISC3_TIMEZONE = 64;
pub const MINIDUMP_MISC3_PROTECTED_PROCESS = 128;
pub const MINIDUMP_MISC4_BUILDSTRING = 256;
pub const MINIDUMP_MISC5_PROCESS_COOKIE = 512;
pub const MINIDUMP_SYSMEMINFO1_FILECACHE_TRANSITIONREPURPOSECOUNT_FLAGS = 1;
pub const MINIDUMP_SYSMEMINFO1_BASICPERF = 2;
pub const MINIDUMP_SYSMEMINFO1_PERF_CCTOTALDIRTYPAGES_CCDIRTYPAGETHRESHOLD = 4;
pub const MINIDUMP_SYSMEMINFO1_PERF_RESIDENTAVAILABLEPAGES_SHAREDCOMMITPAGES = 8;
pub const MINIDUMP_SYSMEMINFO1_PERF_MDLPAGESALLOCATED_PFNDATABASECOMMITTEDPAGES = 16;
pub const MINIDUMP_SYSMEMINFO1_PERF_SYSTEMPAGETABLECOMMITTEDPAGES_CONTIGUOUSPAGESALLOCATED = 32;
pub const MINIDUMP_PROCESS_VM_COUNTERS = 1;
pub const MINIDUMP_PROCESS_VM_COUNTERS_VIRTUALSIZE = 2;
pub const MINIDUMP_PROCESS_VM_COUNTERS_EX = 4;
pub const MINIDUMP_PROCESS_VM_COUNTERS_EX2 = 8;
pub const MINIDUMP_PROCESS_VM_COUNTERS_JOB = 16;
pub const INTERFACESAFE_FOR_UNTRUSTED_CALLER = 1;
pub const INTERFACESAFE_FOR_UNTRUSTED_DATA = 2;
pub const INTERFACE_USES_DISPEX = 4;
pub const INTERFACE_USES_SECURITY_MANAGER = 8;
pub const WCT_MAX_NODE_COUNT = 16;
pub const WCT_OBJNAME_LENGTH = 128;
pub const WCT_NETWORK_IO_FLAG = 8;
pub const WHEA_ERROR_SOURCE_DESCRIPTOR_VERSION_10 = 10;
pub const WHEA_ERROR_SOURCE_DESCRIPTOR_VERSION_11 = 11;
pub const WHEA_MAX_MC_BANKS = 32;
pub const WHEA_ERROR_SOURCE_FLAG_FIRMWAREFIRST = 1;
pub const WHEA_ERROR_SOURCE_FLAG_GLOBAL = 2;
pub const WHEA_ERROR_SOURCE_FLAG_GHES_ASSIST = 4;
pub const WHEA_ERROR_SOURCE_FLAG_DEFAULTSOURCE = 2147483648;
pub const WHEA_ERR_SRC_OVERRIDE_FLAG = 1073741824;
pub const WHEA_ERROR_SOURCE_INVALID_RELATED_SOURCE = 65535;
pub const WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_XPFMCE = 0;
pub const WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_XPFCMC = 1;
pub const WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_XPFNMI = 2;
pub const WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_IPFMCA = 3;
pub const WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_IPFCMC = 4;
pub const WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_IPFCPE = 5;
pub const WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_AERROOTPORT = 6;
pub const WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_AERENDPOINT = 7;
pub const WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_AERBRIDGE = 8;
pub const WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_GENERIC = 9;
pub const WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_GENERIC_V2 = 10;
pub const WHEA_XPF_MC_BANK_STATUSFORMAT_IA32MCA = 0;
pub const WHEA_XPF_MC_BANK_STATUSFORMAT_Intel64MCA = 1;
pub const WHEA_XPF_MC_BANK_STATUSFORMAT_AMD64MCA = 2;
pub const WHEA_NOTIFICATION_TYPE_POLLED = 0;
pub const WHEA_NOTIFICATION_TYPE_EXTERNALINTERRUPT = 1;
pub const WHEA_NOTIFICATION_TYPE_LOCALINTERRUPT = 2;
pub const WHEA_NOTIFICATION_TYPE_SCI = 3;
pub const WHEA_NOTIFICATION_TYPE_NMI = 4;
pub const WHEA_NOTIFICATION_TYPE_CMCI = 5;
pub const WHEA_NOTIFICATION_TYPE_MCE = 6;
pub const WHEA_NOTIFICATION_TYPE_GPIO_SIGNAL = 7;
pub const WHEA_NOTIFICATION_TYPE_ARMV8_SEA = 8;
pub const WHEA_NOTIFICATION_TYPE_ARMV8_SEI = 9;
pub const WHEA_NOTIFICATION_TYPE_EXTERNALINTERRUPT_GSIV = 10;
pub const WHEA_NOTIFICATION_TYPE_SDEI = 11;
pub const WHEA_DEVICE_DRIVER_CONFIG_V1 = 1;
pub const WHEA_DEVICE_DRIVER_CONFIG_V2 = 2;
pub const WHEA_DEVICE_DRIVER_CONFIG_MIN = 1;
pub const WHEA_DEVICE_DRIVER_CONFIG_MAX = 2;
pub const WHEA_DEVICE_DRIVER_BUFFER_SET_V1 = 1;
pub const WHEA_DEVICE_DRIVER_BUFFER_SET_MIN = 1;
pub const WHEA_DEVICE_DRIVER_BUFFER_SET_MAX = 1;
pub const WHEA_DISABLE_OFFLINE = 0;
pub const WHEA_MEM_PERSISTOFFLINE = 1;
pub const WHEA_MEM_PFA_DISABLE = 2;
pub const WHEA_MEM_PFA_PAGECOUNT = 3;
pub const WHEA_MEM_PFA_THRESHOLD = 4;
pub const WHEA_MEM_PFA_TIMEOUT = 5;
pub const WHEA_DISABLE_DUMMY_WRITE = 6;
pub const WHEA_RESTORE_CMCI_ENABLED = 7;
pub const WHEA_RESTORE_CMCI_ATTEMPTS = 8;
pub const WHEA_RESTORE_CMCI_ERR_LIMIT = 9;
pub const WHEA_CMCI_THRESHOLD_COUNT = 10;
pub const WHEA_CMCI_THRESHOLD_TIME = 11;
pub const WHEA_CMCI_THRESHOLD_POLL_COUNT = 12;
pub const WHEA_PENDING_PAGE_LIST_SZ = 13;
pub const WHEA_BAD_PAGE_LIST_MAX_SIZE = 14;
pub const WHEA_BAD_PAGE_LIST_LOCATION = 15;
pub const WHEA_NOTIFY_ALL_OFFLINES = 16;
pub const WHEA_ROW_FAIL_CHECK_EXTENT = 17;
pub const WHEA_ROW_FAIL_CHECK_ENABLE = 18;
pub const WHEA_ROW_FAIL_CHECK_THRESHOLD = 19;
pub const WHEA_DISABLE_PRM_ADDRESS_TRANSLATION = 20;
pub const WHEA_ENABLE_BATCHED_ROW_OFFLINE = 21;
pub const IPMI_OS_SEL_RECORD_VERSION_1 = 1;
pub const IPMI_OS_SEL_RECORD_VERSION = 1;
pub const IPMI_IOCTL_INDEX = 1024;
pub const IOCTL_IPMI_INTERNAL_RECORD_SEL_EVENT = 2232320;
pub const IPMI_OS_SEL_RECORD_MASK = 65535;
pub const sevMax = 4;
pub const SLMFLAG_NONE = 0;
pub const SLMFLAG_VIRTUAL = 1;
pub const SLMFLAG_ALT_INDEX = 2;
pub const SLMFLAG_NO_SYMBOLS = 4;
pub const IMAGE_SCN_TYPE_NO_PAD = 8;
pub const IMAGE_SCN_CNT_CODE = 32;
pub const IMAGE_SCN_CNT_INITIALIZED_DATA = 64;
pub const IMAGE_SCN_CNT_UNINITIALIZED_DATA = 128;
pub const IMAGE_SCN_LNK_OTHER = 256;
pub const IMAGE_SCN_LNK_INFO = 512;
pub const IMAGE_SCN_LNK_REMOVE = 2048;
pub const IMAGE_SCN_LNK_COMDAT = 4096;
pub const IMAGE_SCN_NO_DEFER_SPEC_EXC = 16384;
pub const IMAGE_SCN_GPREL = 32768;
pub const IMAGE_SCN_MEM_FARDATA = 32768;
pub const IMAGE_SCN_MEM_PURGEABLE = 131072;
pub const IMAGE_SCN_MEM_16BIT = 131072;
pub const IMAGE_SCN_MEM_LOCKED = 262144;
pub const IMAGE_SCN_MEM_PRELOAD = 524288;
pub const IMAGE_SCN_ALIGN_1BYTES = 1048576;
pub const IMAGE_SCN_ALIGN_2BYTES = 2097152;
pub const IMAGE_SCN_ALIGN_4BYTES = 3145728;
pub const IMAGE_SCN_ALIGN_8BYTES = 4194304;
pub const IMAGE_SCN_ALIGN_16BYTES = 5242880;
pub const IMAGE_SCN_ALIGN_32BYTES = 6291456;
pub const IMAGE_SCN_ALIGN_64BYTES = 7340032;
pub const IMAGE_SCN_ALIGN_128BYTES = 8388608;
pub const IMAGE_SCN_ALIGN_256BYTES = 9437184;
pub const IMAGE_SCN_ALIGN_512BYTES = 10485760;
pub const IMAGE_SCN_ALIGN_1024BYTES = 11534336;
pub const IMAGE_SCN_ALIGN_2048BYTES = 12582912;
pub const IMAGE_SCN_ALIGN_4096BYTES = 13631488;
pub const IMAGE_SCN_ALIGN_8192BYTES = 14680064;
pub const IMAGE_SCN_ALIGN_MASK = 15728640;
pub const IMAGE_SCN_LNK_NRELOC_OVFL = 16777216;
pub const IMAGE_SCN_MEM_DISCARDABLE = 33554432;
pub const IMAGE_SCN_MEM_NOT_CACHED = 67108864;
pub const IMAGE_SCN_MEM_NOT_PAGED = 134217728;
pub const IMAGE_SCN_MEM_SHARED = 268435456;
pub const IMAGE_SCN_MEM_EXECUTE = 536870912;
pub const IMAGE_SCN_MEM_READ = 1073741824;
pub const IMAGE_SCN_MEM_WRITE = 2147483648;
pub const IMAGE_SCN_SCALE_INDEX = 1;
pub const IMAGE_SUBSYSTEM_UNKNOWN = 0;
pub const IMAGE_SUBSYSTEM_NATIVE = 1;
pub const IMAGE_SUBSYSTEM_WINDOWS_GUI = 2;
pub const IMAGE_SUBSYSTEM_WINDOWS_CUI = 3;
pub const IMAGE_SUBSYSTEM_OS2_CUI = 5;
pub const IMAGE_SUBSYSTEM_POSIX_CUI = 7;
pub const IMAGE_SUBSYSTEM_NATIVE_WINDOWS = 8;
pub const IMAGE_SUBSYSTEM_WINDOWS_CE_GUI = 9;
pub const IMAGE_SUBSYSTEM_EFI_APPLICATION = 10;
pub const IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER = 11;
pub const IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER = 12;
pub const IMAGE_SUBSYSTEM_EFI_ROM = 13;
pub const IMAGE_SUBSYSTEM_XBOX = 14;
pub const IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION = 16;
pub const IMAGE_SUBSYSTEM_XBOX_CODE_CATALOG = 17;
pub const IMAGE_DLLCHARACTERISTICS_HIGH_ENTROPY_VA = 32;
pub const IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE = 64;
pub const IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY = 128;
pub const IMAGE_DLLCHARACTERISTICS_NX_COMPAT = 256;
pub const IMAGE_DLLCHARACTERISTICS_NO_ISOLATION = 512;
pub const IMAGE_DLLCHARACTERISTICS_NO_SEH = 1024;
pub const IMAGE_DLLCHARACTERISTICS_NO_BIND = 2048;
pub const IMAGE_DLLCHARACTERISTICS_APPCONTAINER = 4096;
pub const IMAGE_DLLCHARACTERISTICS_WDM_DRIVER = 8192;
pub const IMAGE_DLLCHARACTERISTICS_GUARD_CF = 16384;
pub const IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE = 32768;
pub const IMAGE_DLLCHARACTERISTICS_EX_CET_COMPAT = 1;
pub const IMAGE_DLLCHARACTERISTICS_EX_CET_COMPAT_STRICT_MODE = 2;
pub const IMAGE_DLLCHARACTERISTICS_EX_CET_SET_CONTEXT_IP_VALIDATION_RELAXED_MODE = 4;
pub const IMAGE_DLLCHARACTERISTICS_EX_CET_DYNAMIC_APIS_ALLOW_IN_PROC = 8;
pub const IMAGE_DLLCHARACTERISTICS_EX_CET_RESERVED_1 = 16;
pub const IMAGE_DLLCHARACTERISTICS_EX_CET_RESERVED_2 = 32;
pub const IMAGE_DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT = 64;
pub const IMAGE_DLLCHARACTERISTICS_EX_HOTPATCH_COMPATIBLE = 128;
pub const IMAGE_NT_OPTIONAL_HDR_MAGIC = 523;
pub const IMAGE_NT_OPTIONAL_HDR32_MAGIC = 267;
pub const IMAGE_NT_OPTIONAL_HDR64_MAGIC = 523;
pub const IMAGE_ROM_OPTIONAL_HDR_MAGIC = 263;
pub const HARDWARE_PROFILE_UNDOCKED_STRING = 1073807361;
pub const HARDWARE_PROFILE_DOCKED_STRING = 1073807362;
pub const HARDWARE_PROFILE_UNKNOWN_STRING = 1073807363;
pub const WINDOWS_NT_BANNER = 1073741950;
pub const WINDOWS_NT_CSD_STRING = 1073741959;
pub const WINDOWS_NT_INFO_STRING = 1073741960;
pub const WINDOWS_NT_MP_STRING = 1073741961;
pub const THREAD_TERMINATE_HELD_MUTEX = 1073741962;
pub const WINDOWS_NT_INFO_STRING_PLURAL = 1073741981;
pub const WINDOWS_NT_RC_STRING = 1073741982;
pub const APC_INDEX_MISMATCH = 1;
pub const DEVICE_QUEUE_NOT_BUSY = 2;
pub const INVALID_AFFINITY_SET = 3;
pub const INVALID_DATA_ACCESS_TRAP = 4;
pub const INVALID_PROCESS_ATTACH_ATTEMPT = 5;
pub const INVALID_PROCESS_DETACH_ATTEMPT = 6;
pub const INVALID_SOFTWARE_INTERRUPT = 7;
pub const IRQL_NOT_DISPATCH_LEVEL = 8;
pub const IRQL_NOT_GREATER_OR_EQUAL = 9;
pub const IRQL_NOT_LESS_OR_EQUAL = 10;
pub const NO_EXCEPTION_HANDLING_SUPPORT = 11;
pub const MAXIMUM_WAIT_OBJECTS_EXCEEDED = 12;
pub const MUTEX_LEVEL_NUMBER_VIOLATION = 13;
pub const NO_USER_MODE_CONTEXT = 14;
pub const SPIN_LOCK_ALREADY_OWNED = 15;
pub const SPIN_LOCK_NOT_OWNED = 16;
pub const THREAD_NOT_MUTEX_OWNER = 17;
pub const TRAP_CAUSE_UNKNOWN = 18;
pub const EMPTY_THREAD_REAPER_LIST = 19;
pub const CREATE_DELETE_LOCK_NOT_LOCKED = 20;
pub const LAST_CHANCE_CALLED_FROM_KMODE = 21;
pub const CID_HANDLE_CREATION = 22;
pub const CID_HANDLE_DELETION = 23;
pub const REFERENCE_BY_POINTER = 24;
pub const BAD_POOL_HEADER = 25;
pub const MEMORY_MANAGEMENT = 26;
pub const PFN_SHARE_COUNT = 27;
pub const PFN_REFERENCE_COUNT = 28;
pub const NO_SPIN_LOCK_AVAILABLE = 29;
pub const KMODE_EXCEPTION_NOT_HANDLED = 30;
pub const SHARED_RESOURCE_CONV_ERROR = 31;
pub const KERNEL_APC_PENDING_DURING_EXIT = 32;
pub const QUOTA_UNDERFLOW = 33;
pub const FILE_SYSTEM = 34;
pub const FAT_FILE_SYSTEM = 35;
pub const NTFS_FILE_SYSTEM = 36;
pub const NPFS_FILE_SYSTEM = 37;
pub const CDFS_FILE_SYSTEM = 38;
pub const RDR_FILE_SYSTEM = 39;
pub const CORRUPT_ACCESS_TOKEN = 40;
pub const SECURITY_SYSTEM = 41;
pub const INCONSISTENT_IRP = 42;
pub const PANIC_STACK_SWITCH = 43;
pub const PORT_DRIVER_INTERNAL = 44;
pub const SCSI_DISK_DRIVER_INTERNAL = 45;
pub const DATA_BUS_ERROR = 46;
pub const INSTRUCTION_BUS_ERROR = 47;
pub const SET_OF_INVALID_CONTEXT = 48;
pub const PHASE0_INITIALIZATION_FAILED = 49;
pub const PHASE1_INITIALIZATION_FAILED = 50;
pub const UNEXPECTED_INITIALIZATION_CALL = 51;
pub const CACHE_MANAGER = 52;
pub const NO_MORE_IRP_STACK_LOCATIONS = 53;
pub const DEVICE_REFERENCE_COUNT_NOT_ZERO = 54;
pub const FLOPPY_INTERNAL_ERROR = 55;
pub const SERIAL_DRIVER_INTERNAL = 56;
pub const SYSTEM_EXIT_OWNED_MUTEX = 57;
pub const SYSTEM_UNWIND_PREVIOUS_USER = 58;
pub const SYSTEM_SERVICE_EXCEPTION = 59;
pub const INTERRUPT_UNWIND_ATTEMPTED = 60;
pub const INTERRUPT_EXCEPTION_NOT_HANDLED = 61;
pub const MULTIPROCESSOR_CONFIGURATION_NOT_SUPPORTED = 62;
pub const NO_MORE_SYSTEM_PTES = 63;
pub const TARGET_MDL_TOO_SMALL = 64;
pub const MUST_SUCCEED_POOL_EMPTY = 65;
pub const ATDISK_DRIVER_INTERNAL = 66;
pub const NO_SUCH_PARTITION = 67;
pub const MULTIPLE_IRP_COMPLETE_REQUESTS = 68;
pub const INSUFFICIENT_SYSTEM_MAP_REGS = 69;
pub const DEREF_UNKNOWN_LOGON_SESSION = 70;
pub const REF_UNKNOWN_LOGON_SESSION = 71;
pub const CANCEL_STATE_IN_COMPLETED_IRP = 72;
pub const PAGE_FAULT_WITH_INTERRUPTS_OFF = 73;
pub const IRQL_GT_ZERO_AT_SYSTEM_SERVICE = 74;
pub const STREAMS_INTERNAL_ERROR = 75;
pub const FATAL_UNHANDLED_HARD_ERROR = 76;
pub const NO_PAGES_AVAILABLE = 77;
pub const PFN_LIST_CORRUPT = 78;
pub const NDIS_INTERNAL_ERROR = 79;
pub const PAGE_FAULT_IN_NONPAGED_AREA = 80;
pub const PAGE_FAULT_IN_NONPAGED_AREA_M = 268435536;
pub const REGISTRY_ERROR = 81;
pub const MAILSLOT_FILE_SYSTEM = 82;
pub const NO_BOOT_DEVICE = 83;
pub const LM_SERVER_INTERNAL_ERROR = 84;
pub const DATA_COHERENCY_EXCEPTION = 85;
pub const INSTRUCTION_COHERENCY_EXCEPTION = 86;
pub const XNS_INTERNAL_ERROR = 87;
pub const VOLMGRX_INTERNAL_ERROR = 88;
pub const PINBALL_FILE_SYSTEM = 89;
pub const CRITICAL_SERVICE_FAILED = 90;
pub const SET_ENV_VAR_FAILED = 91;
pub const HAL_INITIALIZATION_FAILED = 92;
pub const UNSUPPORTED_PROCESSOR = 93;
pub const OBJECT_INITIALIZATION_FAILED = 94;
pub const SECURITY_INITIALIZATION_FAILED = 95;
pub const PROCESS_INITIALIZATION_FAILED = 96;
pub const HAL1_INITIALIZATION_FAILED = 97;
pub const OBJECT1_INITIALIZATION_FAILED = 98;
pub const SECURITY1_INITIALIZATION_FAILED = 99;
pub const SYMBOLIC_INITIALIZATION_FAILED = 100;
pub const MEMORY1_INITIALIZATION_FAILED = 101;
pub const CACHE_INITIALIZATION_FAILED = 102;
pub const CONFIG_INITIALIZATION_FAILED = 103;
pub const FILE_INITIALIZATION_FAILED = 104;
pub const IO1_INITIALIZATION_FAILED = 105;
pub const LPC_INITIALIZATION_FAILED = 106;
pub const PROCESS1_INITIALIZATION_FAILED = 107;
pub const REFMON_INITIALIZATION_FAILED = 108;
pub const SESSION1_INITIALIZATION_FAILED = 109;
pub const BOOTPROC_INITIALIZATION_FAILED = 110;
pub const VSL_INITIALIZATION_FAILED = 111;
pub const SOFT_RESTART_FATAL_ERROR = 112;
pub const ASSIGN_DRIVE_LETTERS_FAILED = 114;
pub const CONFIG_LIST_FAILED = 115;
pub const BAD_SYSTEM_CONFIG_INFO = 116;
pub const CANNOT_WRITE_CONFIGURATION = 117;
pub const PROCESS_HAS_LOCKED_PAGES = 118;
pub const KERNEL_STACK_INPAGE_ERROR = 119;
pub const PHASE0_EXCEPTION = 120;
pub const MISMATCHED_HAL = 121;
pub const KERNEL_DATA_INPAGE_ERROR = 122;
pub const INACCESSIBLE_BOOT_DEVICE = 123;
pub const BUGCODE_NDIS_DRIVER = 124;
pub const INSTALL_MORE_MEMORY = 125;
pub const SYSTEM_THREAD_EXCEPTION_NOT_HANDLED = 126;
pub const SYSTEM_THREAD_EXCEPTION_NOT_HANDLED_M = 268435582;
pub const UNEXPECTED_KERNEL_MODE_TRAP = 127;
pub const UNEXPECTED_KERNEL_MODE_TRAP_M = 268435583;
pub const NMI_HARDWARE_FAILURE = 128;
pub const SPIN_LOCK_INIT_FAILURE = 129;
pub const DFS_FILE_SYSTEM = 130;
pub const OFS_FILE_SYSTEM = 131;
pub const RECOM_DRIVER = 132;
pub const SETUP_FAILURE = 133;
pub const AUDIT_FAILURE = 134;
pub const MBR_CHECKSUM_MISMATCH = 139;
pub const KERNEL_MODE_EXCEPTION_NOT_HANDLED = 142;
pub const KERNEL_MODE_EXCEPTION_NOT_HANDLED_M = 268435598;
pub const PP0_INITIALIZATION_FAILED = 143;
pub const PP1_INITIALIZATION_FAILED = 144;
pub const WIN32K_INIT_OR_RIT_FAILURE = 145;
pub const UP_DRIVER_ON_MP_SYSTEM = 146;
pub const INVALID_KERNEL_HANDLE = 147;
pub const KERNEL_STACK_LOCKED_AT_EXIT = 148;
pub const PNP_INTERNAL_ERROR = 149;
pub const INVALID_WORK_QUEUE_ITEM = 150;
pub const BOUND_IMAGE_UNSUPPORTED = 151;
pub const END_OF_NT_EVALUATION_PERIOD = 152;
pub const INVALID_REGION_OR_SEGMENT = 153;
pub const SYSTEM_LICENSE_VIOLATION = 154;
pub const UDFS_FILE_SYSTEM = 155;
pub const MACHINE_CHECK_EXCEPTION = 156;
pub const USER_MODE_HEALTH_MONITOR = 158;
pub const DRIVER_POWER_STATE_FAILURE = 159;
pub const INTERNAL_POWER_ERROR = 160;
pub const PCI_BUS_DRIVER_INTERNAL = 161;
pub const MEMORY_IMAGE_CORRUPT = 162;
pub const ACPI_DRIVER_INTERNAL = 163;
pub const CNSS_FILE_SYSTEM_FILTER = 164;
pub const ACPI_BIOS_ERROR = 165;
pub const FP_EMULATION_ERROR = 166;
pub const BAD_EXHANDLE = 167;
pub const BOOTING_IN_SAFEMODE_MINIMAL = 168;
pub const BOOTING_IN_SAFEMODE_NETWORK = 169;
pub const BOOTING_IN_SAFEMODE_DSREPAIR = 170;
pub const SESSION_HAS_VALID_POOL_ON_EXIT = 171;
pub const HAL_MEMORY_ALLOCATION = 172;
pub const VIDEO_DRIVER_DEBUG_REPORT_REQUEST = 1073741997;
pub const BGI_DETECTED_VIOLATION = 177;
pub const VIDEO_DRIVER_INIT_FAILURE = 180;
pub const BOOTLOG_LOADED = 181;
pub const BOOTLOG_NOT_LOADED = 182;
pub const BOOTLOG_ENABLED = 183;
pub const ATTEMPTED_SWITCH_FROM_DPC = 184;
pub const CHIPSET_DETECTED_ERROR = 185;
pub const SESSION_HAS_VALID_VIEWS_ON_EXIT = 186;
pub const NETWORK_BOOT_INITIALIZATION_FAILED = 187;
pub const NETWORK_BOOT_DUPLICATE_ADDRESS = 188;
pub const INVALID_HIBERNATED_STATE = 189;
pub const ATTEMPTED_WRITE_TO_READONLY_MEMORY = 190;
pub const MUTEX_ALREADY_OWNED = 191;
pub const PCI_CONFIG_SPACE_ACCESS_FAILURE = 192;
pub const SPECIAL_POOL_DETECTED_MEMORY_CORRUPTION = 193;
pub const BAD_POOL_CALLER = 194;
pub const SYSTEM_IMAGE_BAD_SIGNATURE = 195;
pub const DRIVER_VERIFIER_DETECTED_VIOLATION = 196;
pub const DRIVER_CORRUPTED_EXPOOL = 197;
pub const DRIVER_CAUGHT_MODIFYING_FREED_POOL = 198;
pub const TIMER_OR_DPC_INVALID = 199;
pub const IRQL_UNEXPECTED_VALUE = 200;
pub const DRIVER_VERIFIER_IOMANAGER_VIOLATION = 201;
pub const PNP_DETECTED_FATAL_ERROR = 202;
pub const DRIVER_LEFT_LOCKED_PAGES_IN_PROCESS = 203;
pub const PAGE_FAULT_IN_FREED_SPECIAL_POOL = 204;
pub const PAGE_FAULT_BEYOND_END_OF_ALLOCATION = 205;
pub const DRIVER_UNLOADED_WITHOUT_CANCELLING_PENDING_OPERATIONS = 206;
pub const TERMINAL_SERVER_DRIVER_MADE_INCORRECT_MEMORY_REFERENCE = 207;
pub const DRIVER_CORRUPTED_MMPOOL = 208;
pub const DRIVER_IRQL_NOT_LESS_OR_EQUAL = 209;
pub const BUGCODE_ID_DRIVER = 210;
pub const DRIVER_PORTION_MUST_BE_NONPAGED = 211;
pub const SYSTEM_SCAN_AT_RAISED_IRQL_CAUGHT_IMPROPER_DRIVER_UNLOAD = 212;
pub const DRIVER_PAGE_FAULT_IN_FREED_SPECIAL_POOL = 213;
pub const DRIVER_PAGE_FAULT_BEYOND_END_OF_ALLOCATION = 214;
pub const DRIVER_PAGE_FAULT_BEYOND_END_OF_ALLOCATION_M = 268435670;
pub const DRIVER_UNMAPPING_INVALID_VIEW = 215;
pub const DRIVER_USED_EXCESSIVE_PTES = 216;
pub const LOCKED_PAGES_TRACKER_CORRUPTION = 217;
pub const SYSTEM_PTE_MISUSE = 218;
pub const DRIVER_CORRUPTED_SYSPTES = 219;
pub const DRIVER_INVALID_STACK_ACCESS = 220;
pub const POOL_CORRUPTION_IN_FILE_AREA = 222;
pub const IMPERSONATING_WORKER_THREAD = 223;
pub const ACPI_BIOS_FATAL_ERROR = 224;
pub const WORKER_THREAD_RETURNED_AT_BAD_IRQL = 225;
pub const MANUALLY_INITIATED_CRASH = 226;
pub const RESOURCE_NOT_OWNED = 227;
pub const WORKER_INVALID = 228;
pub const POWER_FAILURE_SIMULATE = 229;
pub const DRIVER_VERIFIER_DMA_VIOLATION = 230;
pub const INVALID_FLOATING_POINT_STATE = 231;
pub const INVALID_CANCEL_OF_FILE_OPEN = 232;
pub const ACTIVE_EX_WORKER_THREAD_TERMINATION = 233;
pub const SAVER_UNSPECIFIED = 61440;
pub const SAVER_BLANKSCREEN = 61442;
pub const SAVER_INPUT = 61443;
pub const SAVER_WATCHDOG = 61444;
pub const SAVER_STARTNOTVISIBLE = 61445;
pub const SAVER_NAVIGATIONMODEL = 61446;
pub const SAVER_OUTOFMEMORY = 61447;
pub const SAVER_GRAPHICS = 61448;
pub const SAVER_NAVSERVERTIMEOUT = 61449;
pub const SAVER_CHROMEPROCESSCRASH = 61450;
pub const SAVER_NOTIFICATIONDISMISSAL = 61451;
pub const SAVER_SPEECHDISMISSAL = 61452;
pub const SAVER_CALLDISMISSAL = 61453;
pub const SAVER_APPBARDISMISSAL = 61454;
pub const SAVER_RILADAPTATIONCRASH = 61455;
pub const SAVER_APPLISTUNREACHABLE = 61456;
pub const SAVER_REPORTNOTIFICATIONFAILURE = 61457;
pub const SAVER_UNEXPECTEDSHUTDOWN = 61458;
pub const SAVER_RPCFAILURE = 61459;
pub const SAVER_AUXILIARYFULLDUMP = 61460;
pub const SAVER_ACCOUNTPROVSVCINITFAILURE = 61461;
pub const SAVER_MTBFCOMMANDTIMEOUT = 789;
pub const SAVER_MTBFCOMMANDHANG = 61697;
pub const SAVER_MTBFPASSBUGCHECK = 61698;
pub const SAVER_MTBFIOERROR = 61699;
pub const SAVER_RENDERTHREADHANG = 61952;
pub const SAVER_RENDERMOBILEUIOOM = 61953;
pub const SAVER_DEVICEUPDATEUNSPECIFIED = 62208;
pub const SAVER_AUDIODRIVERHANG = 62464;
pub const SAVER_BATTERYPULLOUT = 62720;
pub const SAVER_MEDIACORETESTHANG = 62976;
pub const SAVER_RESOURCEMANAGEMENT = 63232;
pub const SAVER_CAPTURESERVICE = 63488;
pub const SAVER_WAITFORSHELLREADY = 63744;
pub const SAVER_NONRESPONSIVEPROCESS = 404;
pub const SAVER_SICKAPPLICATION = 34918;
pub const THREAD_STUCK_IN_DEVICE_DRIVER = 234;
pub const THREAD_STUCK_IN_DEVICE_DRIVER_M = 268435690;
pub const DIRTY_MAPPED_PAGES_CONGESTION = 235;
pub const SESSION_HAS_VALID_SPECIAL_POOL_ON_EXIT = 236;
pub const UNMOUNTABLE_BOOT_VOLUME = 237;
pub const CRITICAL_PROCESS_DIED = 239;
pub const STORAGE_MINIPORT_ERROR = 240;
pub const SCSI_VERIFIER_DETECTED_VIOLATION = 241;
pub const HARDWARE_INTERRUPT_STORM = 242;
pub const DISORDERLY_SHUTDOWN = 243;
pub const CRITICAL_OBJECT_TERMINATION = 244;
pub const FLTMGR_FILE_SYSTEM = 245;
pub const PCI_VERIFIER_DETECTED_VIOLATION = 246;
pub const DRIVER_OVERRAN_STACK_BUFFER = 247;
pub const RAMDISK_BOOT_INITIALIZATION_FAILED = 248;
pub const DRIVER_RETURNED_STATUS_REPARSE_FOR_VOLUME_OPEN = 249;
pub const HTTP_DRIVER_CORRUPTED = 250;
pub const RECURSIVE_MACHINE_CHECK = 251;
pub const ATTEMPTED_EXECUTE_OF_NOEXECUTE_MEMORY = 252;
pub const DIRTY_NOWRITE_PAGES_CONGESTION = 253;
pub const BUGCODE_USB_DRIVER = 254;
pub const BC_BLUETOOTH_VERIFIER_FAULT = 3070;
pub const BC_BTHMINI_VERIFIER_FAULT = 3071;
pub const RESERVE_QUEUE_OVERFLOW = 255;
pub const LOADER_BLOCK_MISMATCH = 256;
pub const CLOCK_WATCHDOG_TIMEOUT = 257;
pub const DPC_WATCHDOG_TIMEOUT = 258;
pub const MUP_FILE_SYSTEM = 259;
pub const AGP_INVALID_ACCESS = 260;
pub const AGP_GART_CORRUPTION = 261;
pub const AGP_ILLEGALLY_REPROGRAMMED = 262;
pub const KERNEL_EXPAND_STACK_ACTIVE = 263;
pub const THIRD_PARTY_FILE_SYSTEM_FAILURE = 264;
pub const CRITICAL_STRUCTURE_CORRUPTION = 265;
pub const APP_TAGGING_INITIALIZATION_FAILED = 266;
pub const DFSC_FILE_SYSTEM = 267;
pub const FSRTL_EXTRA_CREATE_PARAMETER_VIOLATION = 268;
pub const WDF_VIOLATION = 269;
pub const VIDEO_MEMORY_MANAGEMENT_INTERNAL = 270;
pub const DRIVER_INVALID_CRUNTIME_PARAMETER = 272;
pub const RECURSIVE_NMI = 273;
pub const MSRPC_STATE_VIOLATION = 274;
pub const VIDEO_DXGKRNL_FATAL_ERROR = 275;
pub const VIDEO_SHADOW_DRIVER_FATAL_ERROR = 276;
pub const AGP_INTERNAL = 277;
pub const VIDEO_TDR_FAILURE = 278;
pub const VIDEO_TDR_TIMEOUT_DETECTED = 279;
pub const NTHV_GUEST_ERROR = 280;
pub const VIDEO_SCHEDULER_INTERNAL_ERROR = 281;
pub const EM_INITIALIZATION_ERROR = 282;
pub const DRIVER_RETURNED_HOLDING_CANCEL_LOCK = 283;
pub const ATTEMPTED_WRITE_TO_CM_PROTECTED_STORAGE = 284;
pub const EVENT_TRACING_FATAL_ERROR = 285;
pub const TOO_MANY_RECURSIVE_FAULTS = 286;
pub const INVALID_DRIVER_HANDLE = 287;
pub const BITLOCKER_FATAL_ERROR = 288;
pub const DRIVER_VIOLATION = 289;
pub const WHEA_INTERNAL_ERROR = 290;
pub const CRYPTO_SELF_TEST_FAILURE = 291;
pub const WHEA_UNCORRECTABLE_ERROR = 292;
pub const NMR_INVALID_STATE = 293;
pub const NETIO_INVALID_POOL_CALLER = 294;
pub const PAGE_NOT_ZERO = 295;
pub const WORKER_THREAD_RETURNED_WITH_BAD_IO_PRIORITY = 296;
pub const WORKER_THREAD_RETURNED_WITH_BAD_PAGING_IO_PRIORITY = 297;
pub const MUI_NO_VALID_SYSTEM_LANGUAGE = 298;
pub const FAULTY_HARDWARE_CORRUPTED_PAGE = 299;
pub const EXFAT_FILE_SYSTEM = 300;
pub const VOLSNAP_OVERLAPPED_TABLE_ACCESS = 301;
pub const INVALID_MDL_RANGE = 302;
pub const VHD_BOOT_INITIALIZATION_FAILED = 303;
pub const DYNAMIC_ADD_PROCESSOR_MISMATCH = 304;
pub const INVALID_EXTENDED_PROCESSOR_STATE = 305;
pub const RESOURCE_OWNER_POINTER_INVALID = 306;
pub const DPC_WATCHDOG_VIOLATION = 307;
pub const DRIVE_EXTENDER = 308;
pub const REGISTRY_FILTER_DRIVER_EXCEPTION = 309;
pub const VHD_BOOT_HOST_VOLUME_NOT_ENOUGH_SPACE = 310;
pub const WIN32K_HANDLE_MANAGER = 311;
pub const GPIO_CONTROLLER_DRIVER_ERROR = 312;
pub const KERNEL_SECURITY_CHECK_FAILURE = 313;
pub const KERNEL_MODE_HEAP_CORRUPTION = 314;
pub const PASSIVE_INTERRUPT_ERROR = 315;
pub const INVALID_IO_BOOST_STATE = 316;
pub const CRITICAL_INITIALIZATION_FAILURE = 317;
pub const ERRATA_WORKAROUND_UNSUCCESSFUL = 318;
pub const REGISTRY_CALLBACK_DRIVER_EXCEPTION = 319;
pub const STORAGE_DEVICE_ABNORMALITY_DETECTED = 320;
pub const VIDEO_ENGINE_TIMEOUT_DETECTED = 321;
pub const VIDEO_TDR_APPLICATION_BLOCKED = 322;
pub const PROCESSOR_DRIVER_INTERNAL = 323;
pub const BUGCODE_USB3_DRIVER = 324;
pub const SECURE_BOOT_VIOLATION = 325;
pub const NDIS_NET_BUFFER_LIST_INFO_ILLEGALLY_TRANSFERRED = 326;
pub const ABNORMAL_RESET_DETECTED = 327;
pub const IO_OBJECT_INVALID = 328;
pub const REFS_FILE_SYSTEM = 329;
pub const KERNEL_WMI_INTERNAL = 330;
pub const SOC_SUBSYSTEM_FAILURE = 331;
pub const FATAL_ABNORMAL_RESET_ERROR = 332;
pub const EXCEPTION_SCOPE_INVALID = 333;
pub const SOC_CRITICAL_DEVICE_REMOVED = 334;
pub const PDC_WATCHDOG_TIMEOUT = 335;
pub const TCPIP_AOAC_NIC_ACTIVE_REFERENCE_LEAK = 336;
pub const UNSUPPORTED_INSTRUCTION_MODE = 337;
pub const INVALID_PUSH_LOCK_FLAGS = 338;
pub const KERNEL_LOCK_ENTRY_LEAKED_ON_THREAD_TERMINATION = 339;
pub const UNEXPECTED_STORE_EXCEPTION = 340;
pub const OS_DATA_TAMPERING = 341;
pub const WINSOCK_DETECTED_HUNG_CLOSESOCKET_LIVEDUMP = 342;
pub const KERNEL_THREAD_PRIORITY_FLOOR_VIOLATION = 343;
pub const ILLEGAL_IOMMU_PAGE_FAULT = 344;
pub const HAL_ILLEGAL_IOMMU_PAGE_FAULT = 345;
pub const SDBUS_INTERNAL_ERROR = 346;
pub const WORKER_THREAD_RETURNED_WITH_SYSTEM_PAGE_PRIORITY_ACTIVE = 347;
pub const PDC_WATCHDOG_TIMEOUT_LIVEDUMP = 348;
pub const SOC_SUBSYSTEM_FAILURE_LIVEDUMP = 349;
pub const BUGCODE_NDIS_DRIVER_LIVE_DUMP = 350;
pub const CONNECTED_STANDBY_WATCHDOG_TIMEOUT_LIVEDUMP = 351;
pub const WIN32K_ATOMIC_CHECK_FAILURE = 352;
pub const LIVE_SYSTEM_DUMP = 353;
pub const KERNEL_AUTO_BOOST_INVALID_LOCK_RELEASE = 354;
pub const WORKER_THREAD_TEST_CONDITION = 355;
pub const WIN32K_CRITICAL_FAILURE = 356;
pub const CLUSTER_CSV_STATUS_IO_TIMEOUT_LIVEDUMP = 357;
pub const CLUSTER_RESOURCE_CALL_TIMEOUT_LIVEDUMP = 358;
pub const CLUSTER_CSV_SNAPSHOT_DEVICE_INFO_TIMEOUT_LIVEDUMP = 359;
pub const CLUSTER_CSV_STATE_TRANSITION_TIMEOUT_LIVEDUMP = 360;
pub const CLUSTER_CSV_VOLUME_ARRIVAL_LIVEDUMP = 361;
pub const CLUSTER_CSV_VOLUME_REMOVAL_LIVEDUMP = 362;
pub const CLUSTER_CSV_CLUSTER_WATCHDOG_LIVEDUMP = 363;
pub const INVALID_RUNDOWN_PROTECTION_FLAGS = 364;
pub const INVALID_SLOT_ALLOCATOR_FLAGS = 365;
pub const ERESOURCE_INVALID_RELEASE = 366;
pub const CLUSTER_CSV_STATE_TRANSITION_INTERVAL_TIMEOUT_LIVEDUMP = 367;
pub const CLUSTER_CSV_CLUSSVC_DISCONNECT_WATCHDOG = 368;
pub const CRYPTO_LIBRARY_INTERNAL_ERROR = 369;
pub const SECURE_KERNEL_HIBERNATE_ERROR = 370;
pub const COREMSGCALL_INTERNAL_ERROR = 371;
pub const COREMSG_INTERNAL_ERROR = 372;
pub const PREVIOUS_FATAL_ABNORMAL_RESET_ERROR = 373;
pub const STORAGE_STACK_FATAL_ERROR = 374;
pub const ELAM_DRIVER_DETECTED_FATAL_ERROR = 376;
pub const CLUSTER_CLUSPORT_STATUS_IO_TIMEOUT_LIVEDUMP = 377;
pub const PROFILER_CONFIGURATION_ILLEGAL = 379;
pub const PDC_LOCK_WATCHDOG_LIVEDUMP = 380;
pub const PDC_UNEXPECTED_REVOCATION_LIVEDUMP = 381;
pub const MICROCODE_REVISION_MISMATCH = 382;
pub const HYPERGUARD_INITIALIZATION_FAILURE = 383;
pub const WVR_LIVEDUMP_REPLICATION_IOCONTEXT_TIMEOUT = 384;
pub const WVR_LIVEDUMP_STATE_TRANSITION_TIMEOUT = 385;
pub const WVR_LIVEDUMP_RECOVERY_IOCONTEXT_TIMEOUT = 386;
pub const WVR_LIVEDUMP_APP_IO_TIMEOUT = 387;
pub const WVR_LIVEDUMP_MANUALLY_INITIATED = 388;
pub const WVR_LIVEDUMP_STATE_FAILURE = 389;
pub const WVR_LIVEDUMP_CRITICAL_ERROR = 390;
pub const VIDEO_DWMINIT_TIMEOUT_FALLBACK_BDD = 391;
pub const CLUSTER_CSVFS_LIVEDUMP = 392;
pub const BAD_OBJECT_HEADER = 393;
pub const SILO_CORRUPT = 394;
pub const SECURE_KERNEL_ERROR = 395;
pub const HYPERGUARD_VIOLATION = 396;
pub const SECURE_FAULT_UNHANDLED = 397;
pub const KERNEL_PARTITION_REFERENCE_VIOLATION = 398;
pub const SYNTHETIC_EXCEPTION_UNHANDLED = 399;
pub const WIN32K_CRITICAL_FAILURE_LIVEDUMP = 400;
pub const PF_DETECTED_CORRUPTION = 401;
pub const KERNEL_AUTO_BOOST_LOCK_ACQUISITION_WITH_RAISED_IRQL = 402;
pub const VIDEO_DXGKRNL_LIVEDUMP = 403;
pub const KERNEL_STORAGE_SLOT_IN_USE = 409;
pub const SMB_SERVER_LIVEDUMP = 405;
pub const LOADER_ROLLBACK_DETECTED = 406;
pub const WIN32K_SECURITY_FAILURE = 407;
pub const UFX_LIVEDUMP = 408;
pub const WORKER_THREAD_RETURNED_WHILE_ATTACHED_TO_SILO = 410;
pub const TTM_FATAL_ERROR = 411;
pub const WIN32K_POWER_WATCHDOG_TIMEOUT = 412;
pub const CLUSTER_SVHDX_LIVEDUMP = 413;
pub const BUGCODE_NETADAPTER_DRIVER = 414;
pub const PDC_PRIVILEGE_CHECK_LIVEDUMP = 415;
pub const TTM_WATCHDOG_TIMEOUT = 416;
pub const WIN32K_CALLOUT_WATCHDOG_LIVEDUMP = 417;
pub const WIN32K_CALLOUT_WATCHDOG_BUGCHECK = 418;
pub const CALL_HAS_NOT_RETURNED_WATCHDOG_TIMEOUT_LIVEDUMP = 419;
pub const DRIPS_SW_HW_DIVERGENCE_LIVEDUMP = 420;
pub const USB_DRIPS_BLOCKER_SURPRISE_REMOVAL_LIVEDUMP = 421;
pub const BLUETOOTH_ERROR_RECOVERY_LIVEDUMP = 422;
pub const SMB_REDIRECTOR_LIVEDUMP = 423;
pub const VIDEO_DXGKRNL_BLACK_SCREEN_LIVEDUMP = 424;
pub const DIRECTED_FX_TRANSITION_LIVEDUMP = 425;
pub const EXCEPTION_ON_INVALID_STACK = 426;
pub const UNWIND_ON_INVALID_STACK = 427;
pub const VIDEO_MINIPORT_FAILED_LIVEDUMP = 432;
pub const VIDEO_MINIPORT_BLACK_SCREEN_LIVEDUMP = 440;
pub const DRIVER_VERIFIER_DETECTED_VIOLATION_LIVEDUMP = 452;
pub const IO_THREADPOOL_DEADLOCK_LIVEDUMP = 453;
pub const FAST_ERESOURCE_PRECONDITION_VIOLATION = 454;
pub const STORE_DATA_STRUCTURE_CORRUPTION = 455;
pub const MANUALLY_INITIATED_POWER_BUTTON_HOLD = 456;
pub const USER_MODE_HEALTH_MONITOR_LIVEDUMP = 457;
pub const SYNTHETIC_WATCHDOG_TIMEOUT = 458;
pub const INVALID_SILO_DETACH = 459;
pub const EXRESOURCE_TIMEOUT_LIVEDUMP = 460;
pub const INVALID_CALLBACK_STACK_ADDRESS = 461;
pub const INVALID_KERNEL_STACK_ADDRESS = 462;
pub const HARDWARE_WATCHDOG_TIMEOUT = 463;
pub const ACPI_FIRMWARE_WATCHDOG_TIMEOUT = 464;
pub const TELEMETRY_ASSERTS_LIVEDUMP = 465;
pub const WORKER_THREAD_INVALID_STATE = 466;
pub const WFP_INVALID_OPERATION = 467;
pub const UCMUCSI_LIVEDUMP = 468;
pub const DRIVER_PNP_WATCHDOG = 469;
pub const WORKER_THREAD_RETURNED_WITH_NON_DEFAULT_WORKLOAD_CLASS = 470;
pub const EFS_FATAL_ERROR = 471;
pub const UCMUCSI_FAILURE = 472;
pub const HAL_IOMMU_INTERNAL_ERROR = 473;
pub const HAL_BLOCKED_PROCESSOR_INTERNAL_ERROR = 474;
pub const IPI_WATCHDOG_TIMEOUT = 475;
pub const DMA_COMMON_BUFFER_VECTOR_ERROR = 476;
pub const BUGCODE_MBBADAPTER_DRIVER = 477;
pub const BUGCODE_WIFIADAPTER_DRIVER = 478;
pub const PROCESSOR_START_TIMEOUT = 479;
pub const INVALID_ALTERNATE_SYSTEM_CALL_HANDLER_REGISTRATION = 480;
pub const DEVICE_DIAGNOSTIC_LOG_LIVEDUMP = 481;
pub const AZURE_DEVICE_FW_DUMP = 482;
pub const BREAKAWAY_CABLE_TRANSITION = 483;
pub const VIDEO_DXGKRNL_SYSMM_FATAL_ERROR = 484;
pub const DRIVER_VERIFIER_TRACKING_LIVE_DUMP = 485;
pub const CRASHDUMP_WATCHDOG_TIMEOUT = 486;
pub const REGISTRY_LIVE_DUMP = 487;
pub const INVALID_THREAD_AFFINITY_STATE = 488;
pub const ILLEGAL_ATS_INITIALIZATION = 489;
pub const SECURE_PCI_CONFIG_SPACE_ACCESS_VIOLATION = 490;
pub const DAM_WATCHDOG_TIMEOUT = 491;
pub const HANDLE_LIVE_DUMP = 492;
pub const HANDLE_ERROR_ON_CRITICAL_THREAD = 493;
pub const MPSDRV_QUERY_USER = 1073742318;
pub const VMBUS_LIVEDUMP = 1073742319;
pub const USB4_HARDWARE_VIOLATION = 496;
pub const KASAN_ENLIGHTENMENT_VIOLATION = 497;
pub const KASAN_ILLEGAL_ACCESS = 498;
pub const IORING = 499;
pub const MDL_CACHE = 500;
pub const APPLICATION_HANG_KERNEL_LIVEDUMP = 501;
pub const MISALIGNED_POINTER_PARAMETER = 502;
pub const MSSECCORE_ASSERTION_FAILURE = 503;
pub const INVALID_MINIMAL_PROCESS_STATE = 504;
pub const PREVIOUS_MODE_MISMATCH = 505;
pub const SMB_SRV_REQUEST_VALIDATION_FAILURE = 506;
pub const IOMMU_INTERRUPT_REMAPPING_FAULT = 507;
pub const WIN32K_CALLOUT_UNREGISTER_FAILED = 508;
pub const HAL_SPE_INTERNAL_ERROR = 509;
pub const SMB_CLIENT_REQUEST_VALIDATION_FAILURE = 510;
pub const CPU_SCHEDULER_INTERNAL_ERROR = 512;
pub const PROCESS_TERMINATE_LIKELY_DEADLOCK = 513;
pub const UNEXPECTED_CODEPATH = 514;
pub const INVALID_EXTENSION_STATE = 515;
pub const STORAGE_DRIVER_LIVEDUMP = 519;
pub const XBOX_VMCTRL_CS_TIMEOUT = 854;
pub const XBOX_CORRUPTED_IMAGE = 855;
pub const XBOX_INVERTED_FUNCTION_TABLE_OVERFLOW = 856;
pub const XBOX_CORRUPTED_IMAGE_BASE = 857;
pub const XBOX_XDS_WATCHDOG_TIMEOUT = 858;
pub const XBOX_SHUTDOWN_WATCHDOG_TIMEOUT = 859;
pub const XBOX_CANNOT_MANAGE_PARTITION_MEMORY = 861;
pub const XBOX_360_SYSTEM_CRASH = 864;
pub const XBOX_360_SYSTEM_CRASH_RESERVED = 1056;
pub const XBOX_SECURITY_FAILUE = 1057;
pub const KERNEL_CFG_INIT_FAILURE = 1058;
pub const MANUALLY_INITIATED_POWER_BUTTON_HOLD_LIVE_DUMP = 4552;
pub const HYPERVISOR_ERROR = 131073;
pub const XBOX_MANUALLY_INITIATED_CRASH = 196614;
pub const MANUALLY_INITIATED_BLACKSCREEN_HOTKEY_LIVE_DUMP = 8648;
pub const WINLOGON_FATAL_ERROR = 3221226010;
pub const MANUALLY_INITIATED_CRASH1 = 3735936685;
pub const BUGCHECK_CONTEXT_MODIFIER = 2147483648;
pub const FACILITY_NULL = 0;
pub const FACILITY_RPC = 1;
pub const FACILITY_DISPATCH = 2;
pub const FACILITY_STORAGE = 3;
pub const FACILITY_ITF = 4;
pub const FACILITY_WIN32 = 7;
pub const FACILITY_WINDOWS = 8;
pub const FACILITY_SSPI = 9;
pub const FACILITY_SECURITY = 9;
pub const FACILITY_CONTROL = 10;
pub const FACILITY_CERT = 11;
pub const FACILITY_INTERNET = 12;
pub const FACILITY_MEDIASERVER = 13;
pub const FACILITY_MSMQ = 14;
pub const FACILITY_SETUPAPI = 15;
pub const FACILITY_SCARD = 16;
pub const FACILITY_COMPLUS = 17;
pub const FACILITY_AAF = 18;
pub const FACILITY_URT = 19;
pub const FACILITY_ACS = 20;
pub const FACILITY_DPLAY = 21;
pub const FACILITY_UMI = 22;
pub const FACILITY_SXS = 23;
pub const FACILITY_WINDOWS_CE = 24;
pub const FACILITY_HTTP = 25;
pub const FACILITY_USERMODE_COMMONLOG = 26;
pub const FACILITY_WER = 27;
pub const FACILITY_USERMODE_FILTER_MANAGER = 31;
pub const FACILITY_BACKGROUNDCOPY = 32;
pub const FACILITY_CONFIGURATION = 33;
pub const FACILITY_WIA = 33;
pub const FACILITY_STATE_MANAGEMENT = 34;
pub const FACILITY_METADIRECTORY = 35;
pub const FACILITY_WINDOWSUPDATE = 36;
pub const FACILITY_DIRECTORYSERVICE = 37;
pub const FACILITY_GRAPHICS = 38;
pub const FACILITY_SHELL = 39;
pub const FACILITY_NAP = 39;
pub const FACILITY_TPM_SERVICES = 40;
pub const FACILITY_TPM_SOFTWARE = 41;
pub const FACILITY_UI = 42;
pub const FACILITY_XAML = 43;
pub const FACILITY_ACTION_QUEUE = 44;
pub const FACILITY_PLA = 48;
pub const FACILITY_WINDOWS_SETUP = 48;
pub const FACILITY_FVE = 49;
pub const FACILITY_FWP = 50;
pub const FACILITY_WINRM = 51;
pub const FACILITY_NDIS = 52;
pub const FACILITY_USERMODE_HYPERVISOR = 53;
pub const FACILITY_CMI = 54;
pub const FACILITY_USERMODE_VIRTUALIZATION = 55;
pub const FACILITY_USERMODE_VOLMGR = 56;
pub const FACILITY_BCD = 57;
pub const FACILITY_USERMODE_VHD = 58;
pub const FACILITY_USERMODE_HNS = 59;
pub const FACILITY_SDIAG = 60;
pub const FACILITY_WEBSERVICES = 61;
pub const FACILITY_WINPE = 61;
pub const FACILITY_WPN = 62;
pub const FACILITY_WINDOWS_STORE = 63;
pub const FACILITY_INPUT = 64;
pub const FACILITY_QUIC = 65;
pub const FACILITY_EAP = 66;
pub const FACILITY_IORING = 70;
pub const FACILITY_WINDOWS_DEFENDER = 80;
pub const FACILITY_OPC = 81;
pub const FACILITY_XPS = 82;
pub const FACILITY_MBN = 84;
pub const FACILITY_POWERSHELL = 84;
pub const FACILITY_RAS = 83;
pub const FACILITY_P2P_INT = 98;
pub const FACILITY_P2P = 99;
pub const FACILITY_DAF = 100;
pub const FACILITY_BLUETOOTH_ATT = 101;
pub const FACILITY_AUDIO = 102;
pub const FACILITY_STATEREPOSITORY = 103;
pub const FACILITY_VISUALCPP = 109;
pub const FACILITY_SCRIPT = 112;
pub const FACILITY_PARSE = 113;
pub const FACILITY_BLB = 120;
pub const FACILITY_BLB_CLI = 121;
pub const FACILITY_WSBAPP = 122;
pub const FACILITY_BLBUI = 128;
pub const FACILITY_USN = 129;
pub const FACILITY_USERMODE_VOLSNAP = 130;
pub const FACILITY_TIERING = 131;
pub const FACILITY_WSB_ONLINE = 133;
pub const FACILITY_ONLINE_ID = 134;
pub const FACILITY_DEVICE_UPDATE_AGENT = 135;
pub const FACILITY_DRVSERVICING = 136;
pub const FACILITY_DLS = 153;
pub const FACILITY_DELIVERY_OPTIMIZATION = 208;
pub const FACILITY_USERMODE_SPACES = 231;
pub const FACILITY_USER_MODE_SECURITY_CORE = 232;
pub const FACILITY_USERMODE_LICENSING = 234;
pub const FACILITY_SOS = 160;
pub const FACILITY_OCP_UPDATE_AGENT = 173;
pub const FACILITY_DEBUGGERS = 176;
pub const FACILITY_SPP = 256;
pub const FACILITY_RESTORE = 256;
pub const FACILITY_DMSERVER = 256;
pub const FACILITY_DEPLOYMENT_SERVICES_SERVER = 257;
pub const FACILITY_DEPLOYMENT_SERVICES_IMAGING = 258;
pub const FACILITY_DEPLOYMENT_SERVICES_MANAGEMENT = 259;
pub const FACILITY_DEPLOYMENT_SERVICES_UTIL = 260;
pub const FACILITY_DEPLOYMENT_SERVICES_BINLSVC = 261;
pub const FACILITY_DEPLOYMENT_SERVICES_PXE = 263;
pub const FACILITY_DEPLOYMENT_SERVICES_TFTP = 264;
pub const FACILITY_DEPLOYMENT_SERVICES_TRANSPORT_MANAGEMENT = 272;
pub const FACILITY_DEPLOYMENT_SERVICES_DRIVER_PROVISIONING = 278;
pub const FACILITY_DEPLOYMENT_SERVICES_MULTICAST_SERVER = 289;
pub const FACILITY_DEPLOYMENT_SERVICES_MULTICAST_CLIENT = 290;
pub const FACILITY_DEPLOYMENT_SERVICES_CONTENT_PROVIDER = 293;
pub const FACILITY_HSP_SERVICES = 296;
pub const FACILITY_HSP_SOFTWARE = 297;
pub const FACILITY_LINGUISTIC_SERVICES = 305;
pub const FACILITY_AUDIOSTREAMING = 1094;
pub const FACILITY_TTD = 1490;
pub const FACILITY_ACCELERATOR = 1536;
pub const FACILITY_WMAAECMA = 1996;
pub const FACILITY_DIRECTMUSIC = 2168;
pub const FACILITY_DIRECT3D10 = 2169;
pub const FACILITY_DXGI = 2170;
pub const FACILITY_DXGI_DDI = 2171;
pub const FACILITY_DIRECT3D11 = 2172;
pub const FACILITY_DIRECT3D11_DEBUG = 2173;
pub const FACILITY_DIRECT3D12 = 2174;
pub const FACILITY_DIRECT3D12_DEBUG = 2175;
pub const FACILITY_DXCORE = 2176;
pub const FACILITY_PRESENTATION = 2177;
pub const FACILITY_LEAP = 2184;
pub const FACILITY_AUDCLNT = 2185;
pub const FACILITY_WINCODEC_DWRITE_DWM = 2200;
pub const FACILITY_WINML = 2192;
pub const FACILITY_DIRECT2D = 2201;
pub const FACILITY_DEFRAG = 2304;
pub const FACILITY_USERMODE_SDBUS = 2305;
pub const FACILITY_JSCRIPT = 2306;
pub const FACILITY_PIDGENX = 2561;
pub const FACILITY_EAS = 85;
pub const FACILITY_WEB = 885;
pub const FACILITY_WEB_SOCKET = 886;
pub const FACILITY_MOBILE = 1793;
pub const FACILITY_SQLITE = 1967;
pub const FACILITY_SERVICE_FABRIC = 1968;
pub const FACILITY_UTC = 1989;
pub const FACILITY_WEP = 2049;
pub const FACILITY_SYNCENGINE = 2050;
pub const FACILITY_XBOX = 2339;
pub const FACILITY_GAME = 2340;
pub const FACILITY_USERMODE_UNIONFS = 2341;
pub const FACILITY_USERMODE_PRM = 2342;
pub const FACILITY_USERMODE_WIN_ACCEL = 2343;
pub const FACILITY_PPF = 2344;
pub const FACILITY_PIX = 2748;
pub const FACILITY_NT_BIT = 268435456;
pub const SEM_ALL_ERRORS = 0;
pub const SEM_FAILCRITICALERRORS = 1;
pub const SEM_NOGPFAULTERRORBOX = 2;
pub const SEM_NOOPENFILEERRORBOX = 32768;
pub const SEM_NOALIGNMENTFAULTEXCEPT = 4;
pub const FORMAT_MESSAGE_ALLOCATE_BUFFER = 256;
pub const FORMAT_MESSAGE_ARGUMENT_ARRAY = 8192;
pub const FORMAT_MESSAGE_FROM_HMODULE = 2048;
pub const FORMAT_MESSAGE_FROM_STRING = 1024;
pub const FORMAT_MESSAGE_FROM_SYSTEM = 4096;
pub const FORMAT_MESSAGE_IGNORE_INSERTS = 512;
pub const UNW_FLAG_NHANDLER = 0;
pub const UNW_FLAG_EHANDLER = 1;
pub const UNW_FLAG_UHANDLER = 2;
pub const UNW_FLAG_CHAININFO = 4;
pub const WCT_ASYNC_OPEN_FLAG = 1;
pub const SYMSTOREOPT_COMPRESS = 1;
pub const SYMSTOREOPT_OVERWRITE = 2;
pub const SYMSTOREOPT_PASS_IF_EXISTS = 64;
pub const SYMSTOREOPT_POINTER = 8;
pub const SYMSTOREOPT_RETURNINDEX = 4;
pub const IMAGE_DIRECTORY_ENTRY_ARCHITECTURE = 7;
pub const IMAGE_DIRECTORY_ENTRY_BASERELOC = 5;
pub const IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT = 11;
pub const IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR = 14;
pub const IMAGE_DIRECTORY_ENTRY_DEBUG = 6;
pub const IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT = 13;
pub const IMAGE_DIRECTORY_ENTRY_EXCEPTION = 3;
pub const IMAGE_DIRECTORY_ENTRY_EXPORT = 0;
pub const IMAGE_DIRECTORY_ENTRY_GLOBALPTR = 8;
pub const IMAGE_DIRECTORY_ENTRY_IAT = 12;
pub const IMAGE_DIRECTORY_ENTRY_IMPORT = 1;
pub const IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG = 10;
pub const IMAGE_DIRECTORY_ENTRY_RESOURCE = 2;
pub const IMAGE_DIRECTORY_ENTRY_SECURITY = 4;
pub const IMAGE_DIRECTORY_ENTRY_TLS = 9;
pub const WCT_OUT_OF_PROC_COM_FLAG = 2;
pub const WCT_OUT_OF_PROC_CS_FLAG = 4;
pub const WCT_OUT_OF_PROC_FLAG = 1;
pub const SSRVOPT_DWORD = 2;
pub const SSRVOPT_DWORDPTR = 4;
pub const SSRVOPT_GUIDPTR = 8;
pub const IMAGE_FILE_RELOCS_STRIPPED = 1;
pub const IMAGE_FILE_EXECUTABLE_IMAGE = 2;
pub const IMAGE_FILE_LINE_NUMS_STRIPPED = 4;
pub const IMAGE_FILE_LOCAL_SYMS_STRIPPED = 8;
pub const IMAGE_FILE_AGGRESIVE_WS_TRIM = 16;
pub const IMAGE_FILE_LARGE_ADDRESS_AWARE = 32;
pub const IMAGE_FILE_BYTES_REVERSED_LO = 128;
pub const IMAGE_FILE_32BIT_MACHINE = 256;
pub const IMAGE_FILE_DEBUG_STRIPPED = 512;
pub const IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP = 1024;
pub const IMAGE_FILE_NET_RUN_FROM_SWAP = 2048;
pub const IMAGE_FILE_SYSTEM = 4096;
pub const IMAGE_FILE_DLL = 8192;
pub const IMAGE_FILE_UP_SYSTEM_ONLY = 16384;
pub const IMAGE_FILE_BYTES_REVERSED_HI = 32768;
pub const IMAGE_FILE_RELOCS_STRIPPED2 = 1;
pub const IMAGE_FILE_EXECUTABLE_IMAGE2 = 2;
pub const IMAGE_FILE_LINE_NUMS_STRIPPED2 = 4;
pub const IMAGE_FILE_LOCAL_SYMS_STRIPPED2 = 8;
pub const IMAGE_FILE_AGGRESIVE_WS_TRIM2 = 16;
pub const IMAGE_FILE_LARGE_ADDRESS_AWARE2 = 32;
pub const IMAGE_FILE_BYTES_REVERSED_LO2 = 128;
pub const IMAGE_FILE_32BIT_MACHINE2 = 256;
pub const IMAGE_FILE_DEBUG_STRIPPED2 = 512;
pub const IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP2 = 1024;
pub const IMAGE_FILE_NET_RUN_FROM_SWAP2 = 2048;
pub const IMAGE_FILE_SYSTEM_2 = 4096;
pub const IMAGE_FILE_DLL_2 = 8192;
pub const IMAGE_FILE_UP_SYSTEM_ONLY_2 = 16384;
pub const IMAGE_FILE_BYTES_REVERSED_HI_2 = 32768;
pub const SYMFLAG_CLR_TOKEN = 262144;
pub const SYMFLAG_CONSTANT = 256;
pub const SYMFLAG_EXPORT = 512;
pub const SYMFLAG_FORWARDER = 1024;
pub const SYMFLAG_FRAMEREL = 32;
pub const SYMFLAG_FUNCTION = 2048;
pub const SYMFLAG_ILREL = 65536;
pub const SYMFLAG_LOCAL = 128;
pub const SYMFLAG_METADATA = 131072;
pub const SYMFLAG_PARAMETER = 64;
pub const SYMFLAG_REGISTER = 8;
pub const SYMFLAG_REGREL = 16;
pub const SYMFLAG_SLOT = 32768;
pub const SYMFLAG_THUNK = 8192;
pub const SYMFLAG_TLSREL = 16384;
pub const SYMFLAG_VALUEPRESENT = 1;
pub const SYMFLAG_VIRTUAL = 4096;
pub const sevInfo = 0;
pub const sevProblem = 1;
pub const sevAttn = 2;
pub const sevFatal = 3;
pub const IMAGEHLP_GET_TYPE_INFO_CHILDREN = 2;
pub const IMAGEHLP_GET_TYPE_INFO_UNCACHED = 1;
pub const SLE_ERROR = 1;
pub const SLE_MINORERROR = 2;
pub const SLE_WARNING = 3;
pub const VER_PLATFORM_WIN32s = 0;
pub const VER_PLATFORM_WIN32_WINDOWS = 1;
pub const VER_PLATFORM_WIN32_NT = 2;
pub const IMAGE_DEBUG_TYPE_UNKNOWN = 0;
pub const IMAGE_DEBUG_TYPE_COFF = 1;
pub const IMAGE_DEBUG_TYPE_CODEVIEW = 2;
pub const IMAGE_DEBUG_TYPE_FPO = 3;
pub const IMAGE_DEBUG_TYPE_MISC = 4;
pub const IMAGE_DEBUG_TYPE_EXCEPTION = 5;
pub const IMAGE_DEBUG_TYPE_FIXUP = 6;
pub const IMAGE_DEBUG_TYPE_BORLAND = 9;
pub const MINIDUMP_THREAD_INFO_ERROR_THREAD = 1;
pub const MINIDUMP_THREAD_INFO_EXITED_THREAD = 4;
pub const MINIDUMP_THREAD_INFO_INVALID_CONTEXT = 16;
pub const MINIDUMP_THREAD_INFO_INVALID_INFO = 8;
pub const MINIDUMP_THREAD_INFO_INVALID_TEB = 32;
pub const MINIDUMP_THREAD_INFO_WRITING_THREAD = 2;
pub const CREATE_PROCESS_DEBUG_EVENT = 3;
pub const CREATE_THREAD_DEBUG_EVENT = 2;
pub const EXCEPTION_DEBUG_EVENT = 1;
pub const EXIT_PROCESS_DEBUG_EVENT = 5;
pub const EXIT_THREAD_DEBUG_EVENT = 4;
pub const LOAD_DLL_DEBUG_EVENT = 6;
pub const OUTPUT_DEBUG_STRING_EVENT = 8;
pub const RIP_EVENT = 9;
pub const UNLOAD_DLL_DEBUG_EVENT = 7;
pub const MINIDUMP_MISC1_PROCESS_ID = 1;
pub const MINIDUMP_MISC1_PROCESS_TIMES = 2;
pub const DBHHEADER_DEBUGDIRS = 1;
pub const DBHHEADER_CVMISC = 2;
pub const CONTEXT_AMD64 = 1048576;
pub const CONTEXT_CONTROL_AMD64 = 1048577;
pub const CONTEXT_INTEGER_AMD64 = 1048578;
pub const CONTEXT_SEGMENTS_AMD64 = 1048580;
pub const CONTEXT_FLOATING_POINT_AMD64 = 1048584;
pub const CONTEXT_DEBUG_REGISTERS_AMD64 = 1048592;
pub const CONTEXT_FULL_AMD64 = 1048587;
pub const CONTEXT_ALL_AMD64 = 1048607;
pub const CONTEXT_XSTATE_AMD64 = 1048640;
pub const CONTEXT_KERNEL_CET_AMD64 = 1048704;
pub const CONTEXT_KERNEL_DEBUGGER_AMD64 = 67108864;
pub const CONTEXT_EXCEPTION_ACTIVE_AMD64 = 134217728;
pub const CONTEXT_SERVICE_ACTIVE_AMD64 = 268435456;
pub const CONTEXT_EXCEPTION_REQUEST_AMD64 = 1073741824;
pub const CONTEXT_EXCEPTION_REPORTING_AMD64 = 2147483648;
pub const CONTEXT_UNWOUND_TO_CALL_AMD64 = 536870912;
pub const CONTEXT_X86 = 65536;
pub const CONTEXT_CONTROL_X86 = 65537;
pub const CONTEXT_INTEGER_X86 = 65538;
pub const CONTEXT_SEGMENTS_X86 = 65540;
pub const CONTEXT_FLOATING_POINT_X86 = 65544;
pub const CONTEXT_DEBUG_REGISTERS_X86 = 65552;
pub const CONTEXT_EXTENDED_REGISTERS_X86 = 65568;
pub const CONTEXT_FULL_X86 = 65543;
pub const CONTEXT_ALL_X86 = 65599;
pub const CONTEXT_XSTATE_X86 = 65600;
pub const CONTEXT_EXCEPTION_ACTIVE_X86 = 134217728;
pub const CONTEXT_SERVICE_ACTIVE_X86 = 268435456;
pub const CONTEXT_EXCEPTION_REQUEST_X86 = 1073741824;
pub const CONTEXT_EXCEPTION_REPORTING_X86 = 2147483648;
pub const CONTEXT_ARM64 = 4194304;
pub const CONTEXT_CONTROL_ARM64 = 4194305;
pub const CONTEXT_INTEGER_ARM64 = 4194306;
pub const CONTEXT_FLOATING_POINT_ARM64 = 4194308;
pub const CONTEXT_DEBUG_REGISTERS_ARM64 = 4194312;
pub const CONTEXT_X18_ARM64 = 4194320;
pub const CONTEXT_FULL_ARM64 = 4194311;
pub const CONTEXT_ALL_ARM64 = 4194335;
pub const CONTEXT_EXCEPTION_ACTIVE_ARM64 = 134217728;
pub const CONTEXT_SERVICE_ACTIVE_ARM64 = 268435456;
pub const CONTEXT_EXCEPTION_REQUEST_ARM64 = 1073741824;
pub const CONTEXT_EXCEPTION_REPORTING_ARM64 = 2147483648;
pub const CONTEXT_UNWOUND_TO_CALL_ARM64 = 536870912;
pub const CONTEXT_RET_TO_GUEST_ARM64 = 1073741824;
pub const CONTEXT_ARM = 2097152;
pub const CONTEXT_CONTROL_ARM = 2097153;
pub const CONTEXT_INTEGER_ARM = 2097154;
pub const CONTEXT_FLOATING_POINT_ARM = 2097156;
pub const CONTEXT_DEBUG_REGISTERS_ARM = 2097160;
pub const CONTEXT_FULL_ARM = 2097159;
pub const CONTEXT_ALL_ARM = 2097167;
pub const CONTEXT_EXCEPTION_ACTIVE_ARM = 134217728;
pub const CONTEXT_SERVICE_ACTIVE_ARM = 268435456;
pub const CONTEXT_EXCEPTION_REQUEST_ARM = 1073741824;
pub const CONTEXT_EXCEPTION_REPORTING_ARM = 2147483648;
pub const CONTEXT_UNWOUND_TO_CALL_ARM = 536870912;
pub const WOW64_CONTEXT_X86 = 65536;
pub const WOW64_CONTEXT_CONTROL = 65537;
pub const WOW64_CONTEXT_INTEGER = 65538;
pub const WOW64_CONTEXT_SEGMENTS = 65540;
pub const WOW64_CONTEXT_FLOATING_POINT = 65544;
pub const WOW64_CONTEXT_DEBUG_REGISTERS = 65552;
pub const WOW64_CONTEXT_EXTENDED_REGISTERS = 65568;
pub const WOW64_CONTEXT_FULL = 65543;
pub const WOW64_CONTEXT_ALL = 65599;
pub const WOW64_CONTEXT_XSTATE = 65600;
pub const WOW64_CONTEXT_EXCEPTION_ACTIVE = 134217728;
pub const WOW64_CONTEXT_SERVICE_ACTIVE = 268435456;
pub const WOW64_CONTEXT_EXCEPTION_REQUEST = 1073741824;
pub const WOW64_CONTEXT_EXCEPTION_REPORTING = 2147483648;
pub const WctCriticalSectionType = 1;
pub const WctSendMessageType = 2;
pub const WctMutexType = 3;
pub const WctAlpcType = 4;
pub const WctComType = 5;
pub const WctThreadWaitType = 6;
pub const WctProcessWaitType = 7;
pub const WctThreadType = 8;
pub const WctComActivationType = 9;
pub const WctUnknownType = 10;
pub const WctSocketIoType = 11;
pub const WctSmbIoType = 12;
pub const WctMaxType = 13;
pub const WctStatusNoAccess = 1;
pub const WctStatusRunning = 2;
pub const WctStatusBlocked = 3;
pub const WctStatusPidOnly = 4;
pub const WctStatusPidOnlyRpcss = 5;
pub const WctStatusOwned = 6;
pub const WctStatusNotOwned = 7;
pub const WctStatusAbandoned = 8;
pub const WctStatusUnknown = 9;
pub const WctStatusError = 10;
pub const WctStatusMax = 11;
pub const UnusedStream = 0;
pub const ReservedStream0 = 1;
pub const ReservedStream1 = 2;
pub const ThreadListStream = 3;
pub const ModuleListStream = 4;
pub const MemoryListStream = 5;
pub const ExceptionStream = 6;
pub const SystemInfoStream = 7;
pub const ThreadExListStream = 8;
pub const Memory64ListStream = 9;
pub const CommentStreamA = 10;
pub const CommentStreamW = 11;
pub const HandleDataStream = 12;
pub const FunctionTableStream = 13;
pub const UnloadedModuleListStream = 14;
pub const MiscInfoStream = 15;
pub const MemoryInfoListStream = 16;
pub const ThreadInfoListStream = 17;
pub const HandleOperationListStream = 18;
pub const TokenStream = 19;
pub const JavaScriptDataStream = 20;
pub const SystemMemoryInfoStream = 21;
pub const ProcessVmCountersStream = 22;
pub const IptTraceStream = 23;
pub const ThreadNamesStream = 24;
pub const ceStreamNull = 32768;
pub const ceStreamSystemInfo = 32769;
pub const ceStreamException = 32770;
pub const ceStreamModuleList = 32771;
pub const ceStreamProcessList = 32772;
pub const ceStreamThreadList = 32773;
pub const ceStreamThreadContextList = 32774;
pub const ceStreamThreadCallStackList = 32775;
pub const ceStreamMemoryVirtualList = 32776;
pub const ceStreamMemoryPhysicalList = 32777;
pub const ceStreamBucketParameters = 32778;
pub const ceStreamProcessModuleMap = 32779;
pub const ceStreamDiagnosisList = 32780;
pub const LastReservedStream = 65535;
pub const MiniHandleObjectInformationNone = 0;
pub const MiniThreadInformation1 = 1;
pub const MiniMutantInformation1 = 2;
pub const MiniMutantInformation2 = 3;
pub const MiniProcessInformation1 = 4;
pub const MiniProcessInformation2 = 5;
pub const MiniEventInformation1 = 6;
pub const MiniSectionInformation1 = 7;
pub const MiniSemaphoreInformation1 = 8;
pub const MiniHandleObjectInformationTypeMax = 9;
pub const ModuleCallback = 0;
pub const ThreadCallback = 1;
pub const ThreadExCallback = 2;
pub const IncludeThreadCallback = 3;
pub const IncludeModuleCallback = 4;
pub const MemoryCallback = 5;
pub const CancelCallback = 6;
pub const WriteKernelMinidumpCallback = 7;
pub const KernelMinidumpStatusCallback = 8;
pub const RemoveMemoryCallback = 9;
pub const IncludeVmRegionCallback = 10;
pub const IoStartCallback = 11;
pub const IoWriteAllCallback = 12;
pub const IoFinishCallback = 13;
pub const ReadMemoryFailureCallback = 14;
pub const SecondaryFlagsCallback = 15;
pub const IsProcessSnapshotCallback = 16;
pub const VmStartCallback = 17;
pub const VmQueryCallback = 18;
pub const VmPreReadCallback = 19;
pub const VmPostReadCallback = 20;
pub const ThreadWriteThread = 1;
pub const ThreadWriteStack = 2;
pub const ThreadWriteContext = 4;
pub const ThreadWriteBackingStore = 8;
pub const ThreadWriteInstructionWindow = 16;
pub const ThreadWriteThreadData = 32;
pub const ThreadWriteThreadInfo = 64;
pub const ModuleWriteModule = 1;
pub const ModuleWriteDataSeg = 2;
pub const ModuleWriteMiscRecord = 4;
pub const ModuleWriteCvRecord = 8;
pub const ModuleReferencedByMemory = 16;
pub const ModuleWriteTlsData = 32;
pub const ModuleWriteCodeSegs = 64;
pub const MiniDumpNormal = 0;
pub const MiniDumpWithDataSegs = 1;
pub const MiniDumpWithFullMemory = 2;
pub const MiniDumpWithHandleData = 4;
pub const MiniDumpFilterMemory = 8;
pub const MiniDumpScanMemory = 16;
pub const MiniDumpWithUnloadedModules = 32;
pub const MiniDumpWithIndirectlyReferencedMemory = 64;
pub const MiniDumpFilterModulePaths = 128;
pub const MiniDumpWithProcessThreadData = 256;
pub const MiniDumpWithPrivateReadWriteMemory = 512;
pub const MiniDumpWithoutOptionalData = 1024;
pub const MiniDumpWithFullMemoryInfo = 2048;
pub const MiniDumpWithThreadInfo = 4096;
pub const MiniDumpWithCodeSegs = 8192;
pub const MiniDumpWithoutAuxiliaryState = 16384;
pub const MiniDumpWithFullAuxiliaryState = 32768;
pub const MiniDumpWithPrivateWriteCopyMemory = 65536;
pub const MiniDumpIgnoreInaccessibleMemory = 131072;
pub const MiniDumpWithTokenInformation = 262144;
pub const MiniDumpWithModuleHeaders = 524288;
pub const MiniDumpFilterTriage = 1048576;
pub const MiniDumpWithAvxXStateContext = 2097152;
pub const MiniDumpWithIptTrace = 4194304;
pub const MiniDumpScanInaccessiblePartialPages = 8388608;
pub const MiniDumpFilterWriteCombinedMemory = 16777216;
pub const MiniDumpValidTypeFlags = 33554431;
pub const MiniDumpNoIgnoreInaccessibleMemory = 33554432;
pub const MiniDumpValidTypeFlagsEx = 67108863;
pub const MiniSecondaryWithoutPowerInfo = 1;
pub const MiniSecondaryValidFlags = 1;
pub const BindOutOfMemory = 0;
pub const BindRvaToVaFailed = 1;
pub const BindNoRoomInImage = 2;
pub const BindImportModuleFailed = 3;
pub const BindImportProcedureFailed = 4;
pub const BindImportModule = 5;
pub const BindImportProcedure = 6;
pub const BindForwarder = 7;
pub const BindForwarderNOT = 8;
pub const BindImageModified = 9;
pub const BindExpandFileHeaders = 10;
pub const BindImageComplete = 11;
pub const BindMismatchedSymbols = 12;
pub const BindSymbolsNotUpdated = 13;
pub const BindImportProcedure32 = 14;
pub const BindImportProcedure64 = 15;
pub const BindForwarder32 = 16;
pub const BindForwarder64 = 17;
pub const BindForwarderNOT32 = 18;
pub const BindForwarderNOT64 = 19;
pub const AddrMode1616 = 0;
pub const AddrMode1632 = 1;
pub const AddrModeReal = 2;
pub const AddrModeFlat = 3;
pub const SymNone = 0;
pub const SymCoff = 1;
pub const SymCv = 2;
pub const SymPdb = 3;
pub const SymExport = 4;
pub const SymDeferred = 5;
pub const SymSym = 6;
pub const SymDia = 7;
pub const SymVirtual = 8;
pub const NumSymTypes = 9;
pub const hdBase = 0;
pub const hdSym = 1;
pub const hdSrc = 2;
pub const hdMax = 3;
pub const SYMOPT_EX_DISABLEACCESSTIMEUPDATE = 0;
pub const SYMOPT_EX_LASTVALIDDEBUGDIRECTORY = 1;
pub const SYMOPT_EX_NOIMPLICITPATTERNSEARCH = 2;
pub const SYMOPT_EX_NEVERLOADSYMBOLS = 3;
pub const SYMOPT_EX_MAX = 4;
pub const TI_GET_SYMTAG = 0;
pub const TI_GET_SYMNAME = 1;
pub const TI_GET_LENGTH = 2;
pub const TI_GET_TYPE = 3;
pub const TI_GET_TYPEID = 4;
pub const TI_GET_BASETYPE = 5;
pub const TI_GET_ARRAYINDEXTYPEID = 6;
pub const TI_FINDCHILDREN = 7;
pub const TI_GET_DATAKIND = 8;
pub const TI_GET_ADDRESSOFFSET = 9;
pub const TI_GET_OFFSET = 10;
pub const TI_GET_VALUE = 11;
pub const TI_GET_COUNT = 12;
pub const TI_GET_CHILDRENCOUNT = 13;
pub const TI_GET_BITPOSITION = 14;
pub const TI_GET_VIRTUALBASECLASS = 15;
pub const TI_GET_VIRTUALTABLESHAPEID = 16;
pub const TI_GET_VIRTUALBASEPOINTEROFFSET = 17;
pub const TI_GET_CLASSPARENTID = 18;
pub const TI_GET_NESTED = 19;
pub const TI_GET_SYMINDEX = 20;
pub const TI_GET_LEXICALPARENT = 21;
pub const TI_GET_ADDRESS = 22;
pub const TI_GET_THISADJUST = 23;
pub const TI_GET_UDTKIND = 24;
pub const TI_IS_EQUIV_TO = 25;
pub const TI_GET_CALLING_CONVENTION = 26;
pub const TI_IS_CLOSE_EQUIV_TO = 27;
pub const TI_GTIEX_REQS_VALID = 28;
pub const TI_GET_VIRTUALBASEOFFSET = 29;
pub const TI_GET_VIRTUALBASEDISPINDEX = 30;
pub const TI_GET_IS_REFERENCE = 31;
pub const TI_GET_INDIRECTVIRTUALBASECLASS = 32;
pub const TI_GET_VIRTUALBASETABLETYPE = 33;
pub const TI_GET_OBJECTPOINTERTYPE = 34;
pub const TI_GET_DISCRIMINATEDUNION_TAG_TYPEID = 35;
pub const TI_GET_DISCRIMINATEDUNION_TAG_OFFSET = 36;
pub const TI_GET_DISCRIMINATEDUNION_TAG_RANGESCOUNT = 37;
pub const TI_GET_DISCRIMINATEDUNION_TAG_RANGES = 38;
pub const IMAGEHLP_SYMBOL_TYPE_INFO_MAX = 39;
pub const sfImage = 0;
pub const sfDbg = 1;
pub const sfPdb = 2;
pub const sfMpd = 3;
pub const sfMax = 4;
pub const DUMP_TYPE_INVALID = -1;
pub const DUMP_TYPE_UNKNOWN = 0;
pub const DUMP_TYPE_FULL = 1;
pub const DUMP_TYPE_SUMMARY = 2;
pub const DUMP_TYPE_HEADER = 3;
pub const DUMP_TYPE_TRIAGE = 4;
pub const DUMP_TYPE_BITMAP_FULL = 5;
pub const DUMP_TYPE_BITMAP_KERNEL = 6;
pub const DUMP_TYPE_AUTOMATIC = 7;
pub const WheaErrSrcTypeMCE = 0;
pub const WheaErrSrcTypeCMC = 1;
pub const WheaErrSrcTypeCPE = 2;
pub const WheaErrSrcTypeNMI = 3;
pub const WheaErrSrcTypePCIe = 4;
pub const WheaErrSrcTypeGeneric = 5;
pub const WheaErrSrcTypeINIT = 6;
pub const WheaErrSrcTypeBOOT = 7;
pub const WheaErrSrcTypeSCIGeneric = 8;
pub const WheaErrSrcTypeIPFMCA = 9;
pub const WheaErrSrcTypeIPFCMC = 10;
pub const WheaErrSrcTypeIPFCPE = 11;
pub const WheaErrSrcTypeGenericV2 = 12;
pub const WheaErrSrcTypeSCIGenericV2 = 13;
pub const WheaErrSrcTypeBMC = 14;
pub const WheaErrSrcTypePMEM = 15;
pub const WheaErrSrcTypeDeviceDriver = 16;
pub const WheaErrSrcTypeSea = 17;
pub const WheaErrSrcTypeSei = 18;
pub const WheaErrSrcTypeMax = 19;
pub const WheaErrSrcStateStopped = 1;
pub const WheaErrSrcStateStarted = 2;
pub const WheaErrSrcStateRemoved = 3;
pub const WheaErrSrcStateRemovePending = 4;
pub const IpmiOsSelRecordTypeWhea = 0;
pub const IpmiOsSelRecordTypeOther = 1;
pub const IpmiOsSelRecordTypeWheaErrorXpfMca = 2;
pub const IpmiOsSelRecordTypeWheaErrorPci = 3;
pub const IpmiOsSelRecordTypeWheaErrorNmi = 4;
pub const IpmiOsSelRecordTypeWheaErrorOther = 5;
pub const IpmiOsSelRecordTypeRaw = 6;
pub const IpmiOsSelRecordTypeDriver = 7;
pub const IpmiOsSelRecordTypeBugcheckRecovery = 8;
pub const IpmiOsSelRecordTypeBugcheckData = 9;
pub const IpmiOsSelRecordTypeMax = 10;
pub const BitErrorDdr4 = 0;
pub const RowErrorDdr4 = 1;
pub const BitErrorDdr5 = 2;
pub const RowErrorDdr5 = 3;
pub const DBGPROP_ATTRIB_NO_ATTRIB = 0;
pub const DBGPROP_ATTRIB_VALUE_IS_INVALID = 8;
pub const DBGPROP_ATTRIB_VALUE_IS_EXPANDABLE = 16;
pub const DBGPROP_ATTRIB_VALUE_IS_FAKE = 32;
pub const DBGPROP_ATTRIB_VALUE_IS_METHOD = 256;
pub const DBGPROP_ATTRIB_VALUE_IS_EVENT = 512;
pub const DBGPROP_ATTRIB_VALUE_IS_RAW_STRING = 1024;
pub const DBGPROP_ATTRIB_VALUE_READONLY = 2048;
pub const DBGPROP_ATTRIB_ACCESS_PUBLIC = 4096;
pub const DBGPROP_ATTRIB_ACCESS_PRIVATE = 8192;
pub const DBGPROP_ATTRIB_ACCESS_PROTECTED = 16384;
pub const DBGPROP_ATTRIB_ACCESS_FINAL = 32768;
pub const DBGPROP_ATTRIB_STORAGE_GLOBAL = 65536;
pub const DBGPROP_ATTRIB_STORAGE_STATIC = 131072;
pub const DBGPROP_ATTRIB_STORAGE_FIELD = 262144;
pub const DBGPROP_ATTRIB_STORAGE_VIRTUAL = 524288;
pub const DBGPROP_ATTRIB_TYPE_IS_CONSTANT = 1048576;
pub const DBGPROP_ATTRIB_TYPE_IS_SYNCHRONIZED = 2097152;
pub const DBGPROP_ATTRIB_TYPE_IS_VOLATILE = 4194304;
pub const DBGPROP_ATTRIB_HAS_EXTENDED_ATTRIBS = 8388608;
pub const DBGPROP_ATTRIB_FRAME_INTRYBLOCK = 16777216;
pub const DBGPROP_ATTRIB_FRAME_INCATCHBLOCK = 33554432;
pub const DBGPROP_ATTRIB_FRAME_INFINALLYBLOCK = 67108864;
pub const DBGPROP_ATTRIB_VALUE_IS_RETURN_VALUE = 134217728;
pub const DBGPROP_ATTRIB_VALUE_PENDING_MUTATION = 268435456;
pub const DBGPROP_INFO_NAME = 1;
pub const DBGPROP_INFO_TYPE = 2;
pub const DBGPROP_INFO_VALUE = 4;
pub const DBGPROP_INFO_FULLNAME = 32;
pub const DBGPROP_INFO_ATTRIBUTES = 8;
pub const DBGPROP_INFO_DEBUGPROP = 16;
pub const DBGPROP_INFO_BEAUTIFY = 33554432;
pub const DBGPROP_INFO_CALLTOSTRING = 67108864;
pub const DBGPROP_INFO_AUTOEXPAND = 134217728;
pub const OBJECT_ATTRIB_NO_ATTRIB = 0;
pub const OBJECT_ATTRIB_NO_NAME = 1;
pub const OBJECT_ATTRIB_NO_TYPE = 2;
pub const OBJECT_ATTRIB_NO_VALUE = 4;
pub const OBJECT_ATTRIB_VALUE_IS_INVALID = 8;
pub const OBJECT_ATTRIB_VALUE_IS_OBJECT = 16;
pub const OBJECT_ATTRIB_VALUE_IS_ENUM = 32;
pub const OBJECT_ATTRIB_VALUE_IS_CUSTOM = 64;
pub const OBJECT_ATTRIB_OBJECT_IS_EXPANDABLE = 112;
pub const OBJECT_ATTRIB_VALUE_HAS_CODE = 128;
pub const OBJECT_ATTRIB_TYPE_IS_OBJECT = 256;
pub const OBJECT_ATTRIB_TYPE_HAS_CODE = 512;
pub const OBJECT_ATTRIB_TYPE_IS_EXPANDABLE = 256;
pub const OBJECT_ATTRIB_SLOT_IS_CATEGORY = 1024;
pub const OBJECT_ATTRIB_VALUE_READONLY = 2048;
pub const OBJECT_ATTRIB_ACCESS_PUBLIC = 4096;
pub const OBJECT_ATTRIB_ACCESS_PRIVATE = 8192;
pub const OBJECT_ATTRIB_ACCESS_PROTECTED = 16384;
pub const OBJECT_ATTRIB_ACCESS_FINAL = 32768;
pub const OBJECT_ATTRIB_STORAGE_GLOBAL = 65536;
pub const OBJECT_ATTRIB_STORAGE_STATIC = 131072;
pub const OBJECT_ATTRIB_STORAGE_FIELD = 262144;
pub const OBJECT_ATTRIB_STORAGE_VIRTUAL = 524288;
pub const OBJECT_ATTRIB_TYPE_IS_CONSTANT = 1048576;
pub const OBJECT_ATTRIB_TYPE_IS_SYNCHRONIZED = 2097152;
pub const OBJECT_ATTRIB_TYPE_IS_VOLATILE = 4194304;
pub const OBJECT_ATTRIB_HAS_EXTENDED_ATTRIBS = 8388608;
pub const OBJECT_ATTRIB_IS_CLASS = 16777216;
pub const OBJECT_ATTRIB_IS_FUNCTION = 33554432;
pub const OBJECT_ATTRIB_IS_VARIABLE = 67108864;
pub const OBJECT_ATTRIB_IS_PROPERTY = 134217728;
pub const OBJECT_ATTRIB_IS_MACRO = 268435456;
pub const OBJECT_ATTRIB_IS_TYPE = 536870912;
pub const OBJECT_ATTRIB_IS_INHERITED = 1073741824;
pub const OBJECT_ATTRIB_IS_INTERFACE = -2147483648;
pub const PROP_INFO_NAME = 1;
pub const PROP_INFO_TYPE = 2;
pub const PROP_INFO_VALUE = 4;
pub const PROP_INFO_FULLNAME = 32;
pub const PROP_INFO_ATTRIBUTES = 8;
pub const PROP_INFO_DEBUGPROP = 16;
pub const PROP_INFO_AUTOEXPAND = 134217728;
pub const EX_PROP_INFO_ID = 256;
pub const EX_PROP_INFO_NTYPE = 512;
pub const EX_PROP_INFO_NVALUE = 1024;
pub const EX_PROP_INFO_LOCKBYTES = 2048;
pub const EX_PROP_INFO_DEBUGEXTPROP = 4096;

pub const aliases = struct {
    pub const SYM_LOAD_FLAGS = u32;
    pub const IMAGE_SECTION_CHARACTERISTICS = u32;
    pub const IMAGE_SUBSYSTEM = u16;
    pub const IMAGE_DLL_CHARACTERISTICS = u16;
    pub const IMAGE_OPTIONAL_HEADER_MAGIC = u16;
    pub const BUGCHECK_ERROR = u32;
    pub const FACILITY_CODE = u32;
    pub const THREAD_ERROR_MODE = u32;
    pub const FORMAT_MESSAGE_OPTIONS = u32;
    pub const RTL_VIRTUAL_UNWIND_HANDLER_TYPE = u32;
    pub const OPEN_THREAD_WAIT_CHAIN_SESSION_FLAGS = u32;
    pub const SYM_SRV_STORE_FILE_FLAGS = u32;
    pub const IMAGE_DIRECTORY_ENTRY = u16;
    pub const WAIT_CHAIN_THREAD_OPTIONS = u32;
    pub const SYM_FIND_ID_OPTION = u32;
    pub const IMAGE_FILE_CHARACTERISTICS = u16;
    pub const IMAGE_FILE_CHARACTERISTICS2 = u32;
    pub const SYMBOL_INFO_FLAGS = u32;
    pub const IMAGEHLP_CBA_EVENT_SEVERITY = u32;
    pub const IMAGEHLP_GET_TYPE_INFO_FLAGS = u32;
    pub const RIP_INFO_TYPE = u32;
    pub const VER_PLATFORM = u32;
    pub const IMAGE_DEBUG_TYPE = u32;
    pub const MINIDUMP_THREAD_INFO_DUMP_FLAGS = u32;
    pub const DEBUG_EVENT_CODE = u32;
    pub const MINIDUMP_MISC_INFO_FLAGS = u32;
    pub const MODLOAD_DATA_TYPE = u32;
    pub const CONTEXT_FLAGS = u32;
    pub const WOW64_CONTEXT_FLAGS = u32;
    pub const WCT_OBJECT_TYPE = i32;
    pub const WCT_OBJECT_STATUS = i32;
    pub const MINIDUMP_STREAM_TYPE = i32;
    pub const MINIDUMP_HANDLE_OBJECT_INFORMATION_TYPE = i32;
    pub const MINIDUMP_CALLBACK_TYPE = i32;
    pub const THREAD_WRITE_FLAGS = i32;
    pub const MODULE_WRITE_FLAGS = i32;
    pub const MINIDUMP_TYPE = i32;
    pub const MINIDUMP_SECONDARY_FLAGS = i32;
    pub const IMAGEHLP_STATUS_REASON = i32;
    pub const ADDRESS_MODE = i32;
    pub const SYM_TYPE = i32;
    pub const IMAGEHLP_HD_TYPE = i32;
    pub const IMAGEHLP_EXTENDED_OPTIONS = i32;
    pub const IMAGEHLP_SYMBOL_TYPE_INFO = i32;
    pub const IMAGEHLP_SF_TYPE = i32;
    pub const DUMP_TYPE = i32;
    pub const WHEA_ERROR_SOURCE_TYPE = i32;
    pub const WHEA_ERROR_SOURCE_STATE = i32;
    pub const IPMI_OS_SEL_RECORD_TYPE = i32;
    pub const PAGE_OFFLINE_ERROR_TYPES = i32;
    pub const DBGPROP_ATTRIB_FLAGS = i32;
    pub const DBGPROP_INFO = i32;
    pub const OBJECT_ATTRIB_FLAGS = i32;
    pub const PROP_INFO_FLAGS = i32;
    pub const EX_PROP_INFO_FLAGS = i32;
    pub const PGET_RUNTIME_FUNCTION_CALLBACK = ?*const anyopaque;
    pub const PVECTORED_EXCEPTION_HANDLER = ?*const anyopaque;
    pub const LPTOP_LEVEL_EXCEPTION_FILTER = ?*const anyopaque;
    pub const PWAITCHAINCALLBACK = ?*const anyopaque;
    pub const PCOGETCALLSTATE = ?*const anyopaque;
    pub const PCOGETACTIVATIONSTATE = ?*const anyopaque;
    pub const MINIDUMP_CALLBACK_ROUTINE = ?*const anyopaque;
    pub const PIMAGEHLP_STATUS_ROUTINE = ?*const anyopaque;
    pub const PIMAGEHLP_STATUS_ROUTINE32 = ?*const anyopaque;
    pub const PIMAGEHLP_STATUS_ROUTINE64 = ?*const anyopaque;
    pub const DIGEST_FUNCTION = ?*const anyopaque;
    pub const PFIND_DEBUG_FILE_CALLBACK = ?*const anyopaque;
    pub const PFIND_DEBUG_FILE_CALLBACKW = ?*const anyopaque;
    pub const PFINDFILEINPATHCALLBACK = ?*const anyopaque;
    pub const PFINDFILEINPATHCALLBACKW = ?*const anyopaque;
    pub const PFIND_EXE_FILE_CALLBACK = ?*const anyopaque;
    pub const PFIND_EXE_FILE_CALLBACKW = ?*const anyopaque;
    pub const PENUMDIRTREE_CALLBACK = ?*const anyopaque;
    pub const PENUMDIRTREE_CALLBACKW = ?*const anyopaque;
    pub const PREAD_PROCESS_MEMORY_ROUTINE64 = ?*const anyopaque;
    pub const PFUNCTION_TABLE_ACCESS_ROUTINE64 = ?*const anyopaque;
    pub const PGET_MODULE_BASE_ROUTINE64 = ?*const anyopaque;
    pub const PTRANSLATE_ADDRESS_ROUTINE64 = ?*const anyopaque;
    pub const PGET_TARGET_ATTRIBUTE_VALUE64 = ?*const anyopaque;
    pub const PREAD_PROCESS_MEMORY_ROUTINE = ?*const anyopaque;
    pub const PFUNCTION_TABLE_ACCESS_ROUTINE = ?*const anyopaque;
    pub const PGET_MODULE_BASE_ROUTINE = ?*const anyopaque;
    pub const PTRANSLATE_ADDRESS_ROUTINE = ?*const anyopaque;
    pub const PSYM_ENUMMODULES_CALLBACK64 = ?*const anyopaque;
    pub const PSYM_ENUMMODULES_CALLBACKW64 = ?*const anyopaque;
    pub const PENUMLOADED_MODULES_CALLBACK64 = ?*const anyopaque;
    pub const PENUMLOADED_MODULES_CALLBACKW64 = ?*const anyopaque;
    pub const PSYM_ENUMSYMBOLS_CALLBACK64 = ?*const anyopaque;
    pub const PSYM_ENUMSYMBOLS_CALLBACK64W = ?*const anyopaque;
    pub const PSYMBOL_REGISTERED_CALLBACK64 = ?*const anyopaque;
    pub const PSYMBOL_FUNCENTRY_CALLBACK = ?*const anyopaque;
    pub const PSYMBOL_FUNCENTRY_CALLBACK64 = ?*const anyopaque;
    pub const PSYM_ENUMMODULES_CALLBACK = ?*const anyopaque;
    pub const PSYM_ENUMSYMBOLS_CALLBACK = ?*const anyopaque;
    pub const PSYM_ENUMSYMBOLS_CALLBACKW = ?*const anyopaque;
    pub const PENUMLOADED_MODULES_CALLBACK = ?*const anyopaque;
    pub const PSYMBOL_REGISTERED_CALLBACK = ?*const anyopaque;
    pub const PSYM_ENUMSOURCEFILES_CALLBACK = ?*const anyopaque;
    pub const PSYM_ENUMSOURCEFILES_CALLBACKW = ?*const anyopaque;
    pub const PSYM_ENUMLINES_CALLBACK = ?*const anyopaque;
    pub const PSYM_ENUMLINES_CALLBACKW = ?*const anyopaque;
    pub const PENUMSOURCEFILETOKENSCALLBACK = ?*const anyopaque;
    pub const PSYM_ENUMPROCESSES_CALLBACK = ?*const anyopaque;
    pub const PSYM_ENUMERATESYMBOLS_CALLBACK = ?*const anyopaque;
    pub const PSYM_ENUMERATESYMBOLS_CALLBACKW = ?*const anyopaque;
    pub const SYMADDSOURCESTREAM = ?*const anyopaque;
    pub const SYMADDSOURCESTREAMA = ?*const anyopaque;
    pub const PDBGHELP_CREATE_USER_DUMP_CALLBACK = ?*const anyopaque;
    pub const PSYMBOLSERVERPROC = ?*const anyopaque;
    pub const PSYMBOLSERVERPROCA = ?*const anyopaque;
    pub const PSYMBOLSERVERPROCW = ?*const anyopaque;
    pub const PSYMBOLSERVERBYINDEXPROC = ?*const anyopaque;
    pub const PSYMBOLSERVERBYINDEXPROCA = ?*const anyopaque;
    pub const PSYMBOLSERVERBYINDEXPROCW = ?*const anyopaque;
    pub const PSYMBOLSERVEROPENPROC = ?*const anyopaque;
    pub const PSYMBOLSERVERCLOSEPROC = ?*const anyopaque;
    pub const PSYMBOLSERVERSETOPTIONSPROC = ?*const anyopaque;
    pub const PSYMBOLSERVERSETOPTIONSWPROC = ?*const anyopaque;
    pub const PSYMBOLSERVERCALLBACKPROC = ?*const anyopaque;
    pub const PSYMBOLSERVERGETOPTIONSPROC = ?*const anyopaque;
    pub const PSYMBOLSERVERPINGPROC = ?*const anyopaque;
    pub const PSYMBOLSERVERPINGPROCA = ?*const anyopaque;
    pub const PSYMBOLSERVERPINGPROCW = ?*const anyopaque;
    pub const PSYMBOLSERVERGETVERSION = ?*const anyopaque;
    pub const PSYMBOLSERVERDELTANAME = ?*const anyopaque;
    pub const PSYMBOLSERVERDELTANAMEW = ?*const anyopaque;
    pub const PSYMBOLSERVERGETSUPPLEMENT = ?*const anyopaque;
    pub const PSYMBOLSERVERGETSUPPLEMENTW = ?*const anyopaque;
    pub const PSYMBOLSERVERSTORESUPPLEMENT = ?*const anyopaque;
    pub const PSYMBOLSERVERSTORESUPPLEMENTW = ?*const anyopaque;
    pub const PSYMBOLSERVERGETINDEXSTRING = ?*const anyopaque;
    pub const PSYMBOLSERVERGETINDEXSTRINGW = ?*const anyopaque;
    pub const PSYMBOLSERVERSTOREFILE = ?*const anyopaque;
    pub const PSYMBOLSERVERSTOREFILEW = ?*const anyopaque;
    pub const PSYMBOLSERVERISSTORE = ?*const anyopaque;
    pub const PSYMBOLSERVERISSTOREW = ?*const anyopaque;
    pub const PSYMBOLSERVERVERSION = ?*const anyopaque;
    pub const PSYMBOLSERVERMESSAGEPROC = ?*const anyopaque;
    pub const PSYMBOLSERVERWEXPROC = ?*const anyopaque;
    pub const PSYMBOLSERVERPINGPROCWEX = ?*const anyopaque;
    pub const PSYMBOLSERVERGETOPTIONDATAPROC = ?*const anyopaque;
    pub const PSYMBOLSERVERSETHTTPAUTHHEADER = ?*const anyopaque;
    pub const LPCALL_BACK_USER_INTERRUPT_ROUTINE = ?*const anyopaque;
    pub const WHEA_ERROR_SOURCE_INITIALIZE_DEVICE_DRIVER = ?*const anyopaque;
    pub const WHEA_ERROR_SOURCE_UNINITIALIZE_DEVICE_DRIVER = ?*const anyopaque;
    pub const WHEA_ERROR_SOURCE_CORRECT_DEVICE_DRIVER = ?*const anyopaque;
};
