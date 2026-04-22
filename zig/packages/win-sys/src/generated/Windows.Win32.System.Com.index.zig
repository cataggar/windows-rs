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
    .{ "CoBuildVersion", MethodRecord{ .library = "ole32", .import = "CoBuildVersion", .signature = "\x00\x00\x09" } },
    .{ "CoInitialize", MethodRecord{ .library = "OLE32", .import = "CoInitialize", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "CoRegisterMallocSpy", MethodRecord{ .library = "OLE32", .import = "CoRegisterMallocSpy", .signature = "\x00\x01\x11\x79\x12\x82\xa1" } },
    .{ "CoRevokeMallocSpy", MethodRecord{ .library = "OLE32", .import = "CoRevokeMallocSpy", .signature = "\x00\x00\x11\x79" } },
    .{ "CoRegisterInitializeSpy", MethodRecord{ .library = "OLE32", .import = "CoRegisterInitializeSpy", .signature = "\x00\x02\x11\x79\x12\x82\xa5\x0f\x0b" } },
    .{ "CoRevokeInitializeSpy", MethodRecord{ .library = "OLE32", .import = "CoRevokeInitializeSpy", .signature = "\x00\x01\x11\x79\x0b" } },
    .{ "CoGetSystemSecurityPermissions", MethodRecord{ .library = "OLE32", .import = "CoGetSystemSecurityPermissions", .signature = "\x00\x02\x11\x79\x11\x82\xa9\x0f\x11\x82\xad" } },
    .{ "CoLoadLibrary", MethodRecord{ .library = "OLE32", .import = "CoLoadLibrary", .signature = "\x00\x02\x11\x82\x29\x11\x05\x11\x59" } },
    .{ "CoFreeLibrary", MethodRecord{ .library = "OLE32", .import = "CoFreeLibrary", .signature = "\x00\x01\x01\x11\x82\x29" } },
    .{ "CoFreeAllLibraries", MethodRecord{ .library = "OLE32", .import = "CoFreeAllLibraries", .signature = "\x00\x00\x01" } },
    .{ "CoAllowSetForegroundWindow", MethodRecord{ .library = "OLE32", .import = "CoAllowSetForegroundWindow", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x0f\x01" } },
    .{ "DcomChannelSetHResult", MethodRecord{ .library = "ole32", .import = "DcomChannelSetHResult", .signature = "\x00\x03\x11\x79\x0f\x01\x0f\x09\x11\x79" } },
    .{ "CoIsOle1Class", MethodRecord{ .library = "ole32", .import = "CoIsOle1Class", .signature = "\x00\x01\x11\x59\x0f\x11\x0d" } },
    .{ "CLSIDFromProgIDEx", MethodRecord{ .library = "OLE32", .import = "CLSIDFromProgIDEx", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x0d" } },
    .{ "CoFileTimeToDosDateTime", MethodRecord{ .library = "OLE32", .import = "CoFileTimeToDosDateTime", .signature = "\x00\x03\x11\x59\x0f\x11\x80\x9d\x0f\x07\x0f\x07" } },
    .{ "CoDosDateTimeToFileTime", MethodRecord{ .library = "OLE32", .import = "CoDosDateTimeToFileTime", .signature = "\x00\x03\x11\x59\x07\x07\x0f\x11\x80\x9d" } },
    .{ "CoFileTimeNow", MethodRecord{ .library = "OLE32", .import = "CoFileTimeNow", .signature = "\x00\x01\x11\x79\x0f\x11\x80\x9d" } },
    .{ "CoRegisterChannelHook", MethodRecord{ .library = "ole32", .import = "CoRegisterChannelHook", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x12\x82\xb5" } },
    .{ "CoTreatAsClass", MethodRecord{ .library = "OLE32", .import = "CoTreatAsClass", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x0d" } },
    .{ "CreateDataAdviseHolder", MethodRecord{ .library = "OLE32", .import = "CreateDataAdviseHolder", .signature = "\x00\x01\x11\x79\x0f\x12\x82\xb9" } },
    .{ "CreateDataCache", MethodRecord{ .library = "OLE32", .import = "CreateDataCache", .signature = "\x00\x04\x11\x79\x12\x82\xb1\x0f\x11\x0d\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CoInstall", MethodRecord{ .library = "ole32", .import = "CoInstall", .signature = "\x00\x05\x11\x79\x12\x82\xbd\x09\x0f\x11\x82\xc1\x0f\x11\x82\xc5\x11\x05" } },
    .{ "BindMoniker", MethodRecord{ .library = "OLE32", .import = "BindMoniker", .signature = "\x00\x04\x11\x79\x12\x82\xc9\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CoGetObject", MethodRecord{ .library = "OLE32", .import = "CoGetObject", .signature = "\x00\x04\x11\x79\x11\x05\x0f\x11\x82\xcd\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "MkParseDisplayName", MethodRecord{ .library = "OLE32", .import = "MkParseDisplayName", .signature = "\x00\x04\x11\x79\x12\x82\xbd\x11\x05\x0f\x09\x0f\x12\x82\xc9" } },
    .{ "MonikerRelativePathTo", MethodRecord{ .library = "ole32", .import = "MonikerRelativePathTo", .signature = "\x00\x04\x11\x79\x12\x82\xc9\x12\x82\xc9\x0f\x12\x82\xc9\x11\x59" } },
    .{ "MonikerCommonPrefixWith", MethodRecord{ .library = "ole32", .import = "MonikerCommonPrefixWith", .signature = "\x00\x03\x11\x79\x12\x82\xc9\x12\x82\xc9\x0f\x12\x82\xc9" } },
    .{ "CreateBindCtx", MethodRecord{ .library = "OLE32", .import = "CreateBindCtx", .signature = "\x00\x02\x11\x79\x09\x0f\x12\x82\xbd" } },
    .{ "CreateGenericComposite", MethodRecord{ .library = "OLE32", .import = "CreateGenericComposite", .signature = "\x00\x03\x11\x79\x12\x82\xc9\x12\x82\xc9\x0f\x12\x82\xc9" } },
    .{ "GetClassFile", MethodRecord{ .library = "OLE32", .import = "GetClassFile", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x0d" } },
    .{ "CreateClassMoniker", MethodRecord{ .library = "OLE32", .import = "CreateClassMoniker", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x12\x82\xc9" } },
    .{ "CreateFileMoniker", MethodRecord{ .library = "OLE32", .import = "CreateFileMoniker", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x12\x82\xc9" } },
    .{ "CreateItemMoniker", MethodRecord{ .library = "OLE32", .import = "CreateItemMoniker", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x0f\x12\x82\xc9" } },
    .{ "CreateAntiMoniker", MethodRecord{ .library = "OLE32", .import = "CreateAntiMoniker", .signature = "\x00\x01\x11\x79\x0f\x12\x82\xc9" } },
    .{ "CreatePointerMoniker", MethodRecord{ .library = "OLE32", .import = "CreatePointerMoniker", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x0f\x12\x82\xc9" } },
    .{ "CreateObjrefMoniker", MethodRecord{ .library = "OLE32", .import = "CreateObjrefMoniker", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x0f\x12\x82\xc9" } },
    .{ "GetRunningObjectTable", MethodRecord{ .library = "OLE32", .import = "GetRunningObjectTable", .signature = "\x00\x02\x11\x79\x09\x0f\x12\x82\xd1" } },
    .{ "CreateStdProgressIndicator", MethodRecord{ .library = "ole32", .import = "CreateStdProgressIndicator", .signature = "\x00\x04\x11\x79\x11\x25\x11\x05\x12\x82\xd5\x0f\x12\x82\xd5" } },
    .{ "CoGetMalloc", MethodRecord{ .library = "OLE32", .import = "CoGetMalloc", .signature = "\x00\x02\x11\x79\x09\x0f\x12\x82\xd9" } },
    .{ "CoUninitialize", MethodRecord{ .library = "OLE32", .import = "CoUninitialize", .signature = "\x00\x00\x01" } },
    .{ "CoGetCurrentProcess", MethodRecord{ .library = "OLE32", .import = "CoGetCurrentProcess", .signature = "\x00\x00\x09" } },
    .{ "CoInitializeEx", MethodRecord{ .library = "OLE32", .import = "CoInitializeEx", .signature = "\x00\x02\x11\x79\x0f\x01\x09" } },
    .{ "CoGetCallerTID", MethodRecord{ .library = "OLE32", .import = "CoGetCallerTID", .signature = "\x00\x01\x11\x79\x0f\x09" } },
    .{ "CoGetCurrentLogicalThreadId", MethodRecord{ .library = "OLE32", .import = "CoGetCurrentLogicalThreadId", .signature = "\x00\x01\x11\x79\x0f\x11\x0d" } },
    .{ "CoGetContextToken", MethodRecord{ .library = "OLE32", .import = "CoGetContextToken", .signature = "\x00\x01\x11\x79\x0f\x19" } },
    .{ "CoGetApartmentType", MethodRecord{ .library = "OLE32", .import = "CoGetApartmentType", .signature = "\x00\x02\x11\x79\x0f\x11\x82\xdd\x0f\x11\x82\xe1" } },
    .{ "CoIncrementMTAUsage", MethodRecord{ .library = "OLE32", .import = "CoIncrementMTAUsage", .signature = "\x00\x01\x11\x79\x0f\x11\x82\xe5" } },
    .{ "CoDecrementMTAUsage", MethodRecord{ .library = "OLE32", .import = "CoDecrementMTAUsage", .signature = "\x00\x01\x11\x79\x11\x82\xe5" } },
    .{ "CoAllowUnmarshalerCLSID", MethodRecord{ .library = "OLE32", .import = "CoAllowUnmarshalerCLSID", .signature = "\x00\x01\x11\x79\x0f\x11\x0d" } },
    .{ "CoGetObjectContext", MethodRecord{ .library = "OLE32", .import = "CoGetObjectContext", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CoGetClassObject", MethodRecord{ .library = "OLE32", .import = "CoGetClassObject", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x09\x0f\x01\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CoRegisterClassObject", MethodRecord{ .library = "OLE32", .import = "CoRegisterClassObject", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x12\x82\xb1\x11\x82\xe9\x09\x0f\x09" } },
    .{ "CoRevokeClassObject", MethodRecord{ .library = "OLE32", .import = "CoRevokeClassObject", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "CoResumeClassObjects", MethodRecord{ .library = "OLE32", .import = "CoResumeClassObjects", .signature = "\x00\x00\x11\x79" } },
    .{ "CoSuspendClassObjects", MethodRecord{ .library = "OLE32", .import = "CoSuspendClassObjects", .signature = "\x00\x00\x11\x79" } },
    .{ "CoAddRefServerProcess", MethodRecord{ .library = "OLE32", .import = "CoAddRefServerProcess", .signature = "\x00\x00\x09" } },
    .{ "CoReleaseServerProcess", MethodRecord{ .library = "OLE32", .import = "CoReleaseServerProcess", .signature = "\x00\x00\x09" } },
    .{ "CoGetPSClsid", MethodRecord{ .library = "OLE32", .import = "CoGetPSClsid", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x0d" } },
    .{ "CoRegisterPSClsid", MethodRecord{ .library = "OLE32", .import = "CoRegisterPSClsid", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x0d" } },
    .{ "CoRegisterSurrogate", MethodRecord{ .library = "OLE32", .import = "CoRegisterSurrogate", .signature = "\x00\x01\x11\x79\x12\x82\xed" } },
    .{ "CoDisconnectObject", MethodRecord{ .library = "OLE32", .import = "CoDisconnectObject", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x09" } },
    .{ "CoLockObjectExternal", MethodRecord{ .library = "OLE32", .import = "CoLockObjectExternal", .signature = "\x00\x03\x11\x79\x12\x82\xb1\x11\x59\x11\x59" } },
    .{ "CoIsHandlerConnected", MethodRecord{ .library = "OLE32", .import = "CoIsHandlerConnected", .signature = "\x00\x01\x11\x59\x12\x82\xb1" } },
    .{ "CoCreateFreeThreadedMarshaler", MethodRecord{ .library = "OLE32", .import = "CoCreateFreeThreadedMarshaler", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x0f\x12\x82\xb1" } },
    .{ "CoFreeUnusedLibraries", MethodRecord{ .library = "OLE32", .import = "CoFreeUnusedLibraries", .signature = "\x00\x00\x01" } },
    .{ "CoFreeUnusedLibrariesEx", MethodRecord{ .library = "OLE32", .import = "CoFreeUnusedLibrariesEx", .signature = "\x00\x02\x01\x09\x09" } },
    .{ "CoDisconnectContext", MethodRecord{ .library = "OLE32", .import = "CoDisconnectContext", .signature = "\x00\x01\x11\x79\x09" } },
    .{ "CoInitializeSecurity", MethodRecord{ .library = "OLE32", .import = "CoInitializeSecurity", .signature = "\x00\x09\x11\x79\x11\x82\xad\x08\x0f\x11\x82\xf1\x0f\x01\x11\x82\xf5\x11\x82\xf9\x0f\x01\x09\x0f\x01" } },
    .{ "CoGetCallContext", MethodRecord{ .library = "OLE32", .import = "CoGetCallContext", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CoQueryProxyBlanket", MethodRecord{ .library = "OLE32", .import = "CoQueryProxyBlanket", .signature = "\x00\x08\x11\x79\x12\x82\xb1\x0f\x09\x0f\x09\x0f\x11\x05\x0f\x09\x0f\x09\x0f\x0f\x01\x0f\x09" } },
    .{ "CoSetProxyBlanket", MethodRecord{ .library = "OLE32", .import = "CoSetProxyBlanket", .signature = "\x00\x08\x11\x79\x12\x82\xb1\x09\x09\x11\x05\x11\x82\xf5\x11\x82\xf9\x0f\x01\x09" } },
    .{ "CoCopyProxy", MethodRecord{ .library = "OLE32", .import = "CoCopyProxy", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x0f\x12\x82\xb1" } },
    .{ "CoQueryClientBlanket", MethodRecord{ .library = "OLE32", .import = "CoQueryClientBlanket", .signature = "\x00\x07\x11\x79\x0f\x09\x0f\x09\x0f\x11\x05\x0f\x09\x0f\x09\x0f\x0f\x01\x0f\x09" } },
    .{ "CoImpersonateClient", MethodRecord{ .library = "OLE32", .import = "CoImpersonateClient", .signature = "\x00\x00\x11\x79" } },
    .{ "CoRevertToSelf", MethodRecord{ .library = "OLE32", .import = "CoRevertToSelf", .signature = "\x00\x00\x11\x79" } },
    .{ "CoQueryAuthenticationServices", MethodRecord{ .library = "OLE32", .import = "CoQueryAuthenticationServices", .signature = "\x00\x02\x11\x79\x0f\x09\x0f\x0f\x11\x82\xf1" } },
    .{ "CoSwitchCallContext", MethodRecord{ .library = "OLE32", .import = "CoSwitchCallContext", .signature = "\x00\x02\x11\x79\x12\x82\xb1\x0f\x12\x82\xb1" } },
    .{ "CoCreateInstance", MethodRecord{ .library = "OLE32", .import = "CoCreateInstance", .signature = "\x00\x05\x11\x79\x0f\x11\x0d\x12\x82\xb1\x11\x82\xe9\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CoCreateInstanceEx", MethodRecord{ .library = "OLE32", .import = "CoCreateInstanceEx", .signature = "\x00\x06\x11\x79\x0f\x11\x0d\x12\x82\xb1\x11\x82\xe9\x0f\x11\x82\xfd\x09\x0f\x11\x83\x01" } },
    .{ "CoCreateInstanceFromApp", MethodRecord{ .library = "OLE32", .import = "CoCreateInstanceFromApp", .signature = "\x00\x06\x11\x79\x0f\x11\x0d\x12\x82\xb1\x11\x82\xe9\x0f\x01\x09\x0f\x11\x83\x01" } },
    .{ "CoRegisterActivationFilter", MethodRecord{ .library = "OLE32", .import = "CoRegisterActivationFilter", .signature = "\x00\x01\x11\x79\x12\x83\x05" } },
    .{ "CoGetCancelObject", MethodRecord{ .library = "OLE32", .import = "CoGetCancelObject", .signature = "\x00\x03\x11\x79\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CoSetCancelObject", MethodRecord{ .library = "OLE32", .import = "CoSetCancelObject", .signature = "\x00\x01\x11\x79\x12\x82\xb1" } },
    .{ "CoCancelCall", MethodRecord{ .library = "OLE32", .import = "CoCancelCall", .signature = "\x00\x02\x11\x79\x09\x09" } },
    .{ "CoTestCancel", MethodRecord{ .library = "OLE32", .import = "CoTestCancel", .signature = "\x00\x00\x11\x79" } },
    .{ "CoEnableCallCancellation", MethodRecord{ .library = "OLE32", .import = "CoEnableCallCancellation", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "CoDisableCallCancellation", MethodRecord{ .library = "OLE32", .import = "CoDisableCallCancellation", .signature = "\x00\x01\x11\x79\x0f\x01" } },
    .{ "StringFromCLSID", MethodRecord{ .library = "OLE32", .import = "StringFromCLSID", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "CLSIDFromString", MethodRecord{ .library = "OLE32", .import = "CLSIDFromString", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x0d" } },
    .{ "StringFromIID", MethodRecord{ .library = "OLE32", .import = "StringFromIID", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "IIDFromString", MethodRecord{ .library = "OLE32", .import = "IIDFromString", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x0d" } },
    .{ "ProgIDFromCLSID", MethodRecord{ .library = "OLE32", .import = "ProgIDFromCLSID", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x05" } },
    .{ "CLSIDFromProgID", MethodRecord{ .library = "OLE32", .import = "CLSIDFromProgID", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x0d" } },
    .{ "StringFromGUID2", MethodRecord{ .library = "OLE32", .import = "StringFromGUID2", .signature = "\x00\x03\x08\x0f\x11\x0d\x11\x05\x08" } },
    .{ "CoCreateGuid", MethodRecord{ .library = "OLE32", .import = "CoCreateGuid", .signature = "\x00\x01\x11\x79\x0f\x11\x0d" } },
    .{ "CoWaitForMultipleHandles", MethodRecord{ .library = "OLE32", .import = "CoWaitForMultipleHandles", .signature = "\x00\x05\x11\x79\x09\x09\x09\x0f\x11\x80\x85\x0f\x09" } },
    .{ "CoWaitForMultipleObjects", MethodRecord{ .library = "OLE32", .import = "CoWaitForMultipleObjects", .signature = "\x00\x05\x11\x79\x09\x09\x09\x0f\x11\x80\x85\x0f\x09" } },
    .{ "CoGetTreatAsClass", MethodRecord{ .library = "OLE32", .import = "CoGetTreatAsClass", .signature = "\x00\x02\x11\x79\x0f\x11\x0d\x0f\x11\x0d" } },
    .{ "CoInvalidateRemoteMachineBindings", MethodRecord{ .library = "OLE32", .import = "CoInvalidateRemoteMachineBindings", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "CoTaskMemAlloc", MethodRecord{ .library = "OLE32", .import = "CoTaskMemAlloc", .signature = "\x00\x01\x0f\x01\x19" } },
    .{ "CoTaskMemRealloc", MethodRecord{ .library = "OLE32", .import = "CoTaskMemRealloc", .signature = "\x00\x02\x0f\x01\x0f\x01\x19" } },
    .{ "CoTaskMemFree", MethodRecord{ .library = "OLE32", .import = "CoTaskMemFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "CoRegisterDeviceCatalog", MethodRecord{ .library = "OLE32", .import = "CoRegisterDeviceCatalog", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x83\x09" } },
    .{ "CoRevokeDeviceCatalog", MethodRecord{ .library = "OLE32", .import = "CoRevokeDeviceCatalog", .signature = "\x00\x01\x11\x79\x11\x83\x09" } },
    .{ "CreateUri", MethodRecord{ .library = "URLMON", .import = "CreateUri", .signature = "\x00\x04\x11\x79\x11\x05\x11\x83\x0d\x19\x0f\x12\x83\x11" } },
    .{ "CreateUriWithFragment", MethodRecord{ .library = "URLMON", .import = "CreateUriWithFragment", .signature = "\x00\x05\x11\x79\x11\x05\x11\x05\x09\x19\x0f\x12\x83\x11" } },
    .{ "CreateUriFromMultiByteString", MethodRecord{ .library = "urlmon", .import = "CreateUriFromMultiByteString", .signature = "\x00\x06\x11\x79\x11\x3d\x09\x09\x09\x19\x0f\x12\x83\x11" } },
    .{ "CreateIUriBuilder", MethodRecord{ .library = "URLMON", .import = "CreateIUriBuilder", .signature = "\x00\x04\x11\x79\x12\x83\x11\x09\x19\x0f\x12\x83\x15" } },
    .{ "SetErrorInfo", MethodRecord{ .library = "OLEAUT32", .import = "SetErrorInfo", .signature = "\x00\x02\x11\x79\x09\x12\x83\x19" } },
    .{ "GetErrorInfo", MethodRecord{ .library = "OLEAUT32", .import = "GetErrorInfo", .signature = "\x00\x02\x11\x79\x09\x0f\x12\x83\x19" } },
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
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x2a1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IMallocSpy" },
        0x2a5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IInitializeSpy" },
        0x2a9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "COMSD" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x2b5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IChannelHook" },
        0x2b9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IDataAdviseHolder" },
        0x2bd => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IBindCtx" },
        0x2c1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "uCLSSPEC" },
        0x2c5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "QUERYCONTEXT" },
        0x2c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IMoniker" },
        0x2cd => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "BIND_OPTS" },
        0x2d1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IRunningObjectTable" },
        0x2d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IBindStatusCallback" },
        0x2d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IMalloc" },
        0x2dd => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "APTTYPE" },
        0x2e1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "APTTYPEQUALIFIER" },
        0x2e5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "CO_MTA_USAGE_COOKIE" },
        0x2e9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "CLSCTX" },
        0x2ed => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "ISurrogate" },
        0x2f1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "SOLE_AUTHENTICATION_SERVICE" },
        0x2f5 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "RPC_C_AUTHN_LEVEL" },
        0x2f9 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "RPC_C_IMP_LEVEL" },
        0x2fd => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "COSERVERINFO" },
        0x301 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "MULTI_QI" },
        0x305 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IActivationFilter" },
        0x309 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "CO_DEVICE_CATALOG_COOKIE" },
        0x30d => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "URI_CREATE_FLAGS" },
        0x311 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUri" },
        0x315 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUriBuilder" },
        0x319 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IErrorInfo" },
        else => null,
    };
}

pub const COLE_DEFAULT_PRINCIPAL = -1;
pub const COLE_DEFAULT_AUTHINFO = -1;
pub const MARSHALINTERFACE_MIN = 500;
pub const ASYNC_MODE_COMPATIBILITY = 1;
pub const ASYNC_MODE_DEFAULT = 0;
pub const STGTY_REPEAT = 256;
pub const STG_TOEND = -1;
pub const STG_LAYOUT_SEQUENTIAL = 0;
pub const STG_LAYOUT_INTERLEAVED = 1;
pub const COM_RIGHTS_EXECUTE = 1;
pub const COM_RIGHTS_EXECUTE_LOCAL = 2;
pub const COM_RIGHTS_EXECUTE_REMOTE = 4;
pub const COM_RIGHTS_ACTIVATE_LOCAL = 8;
pub const COM_RIGHTS_ACTIVATE_REMOTE = 16;
pub const COM_RIGHTS_RESERVED1 = 32;
pub const COM_RIGHTS_RESERVED2 = 64;
pub const CWMO_MAX_HANDLES = 56;
pub const ROTREGFLAGS_ALLOWANYCLIENT = 1;
pub const APPIDREGFLAGS_ACTIVATE_IUSERVER_INDESKTOP = 1;
pub const APPIDREGFLAGS_SECURE_SERVER_PROCESS_SD_AND_BIND = 2;
pub const APPIDREGFLAGS_ISSUE_ACTIVATION_RPC_AT_IDENTIFY = 4;
pub const APPIDREGFLAGS_IUSERVER_UNMODIFIED_LOGON_TOKEN = 8;
pub const APPIDREGFLAGS_IUSERVER_SELF_SID_IN_LAUNCH_PERMISSION = 16;
pub const APPIDREGFLAGS_IUSERVER_ACTIVATE_IN_CLIENT_SESSION_ONLY = 32;
pub const APPIDREGFLAGS_RESERVED1 = 64;
pub const APPIDREGFLAGS_RESERVED2 = 128;
pub const APPIDREGFLAGS_RESERVED3 = 256;
pub const APPIDREGFLAGS_RESERVED4 = 512;
pub const APPIDREGFLAGS_RESERVED5 = 1024;
pub const APPIDREGFLAGS_AAA_NO_IMPLICIT_ACTIVATE_AS_IU = 2048;
pub const APPIDREGFLAGS_RESERVED7 = 4096;
pub const APPIDREGFLAGS_RESERVED8 = 8192;
pub const APPIDREGFLAGS_RESERVED9 = 16384;
pub const APPIDREGFLAGS_RESERVED10 = 32768;
pub const DCOMSCM_ACTIVATION_USE_ALL_AUTHNSERVICES = 1;
pub const DCOMSCM_ACTIVATION_DISALLOW_UNSECURE_CALL = 2;
pub const DCOMSCM_RESOLVE_USE_ALL_AUTHNSERVICES = 4;
pub const DCOMSCM_RESOLVE_DISALLOW_UNSECURE_CALL = 8;
pub const DCOMSCM_PING_USE_MID_AUTHNSERVICE = 16;
pub const DCOMSCM_PING_DISALLOW_UNSECURE_CALL = 32;
pub const MAXLSN = 9223372036854775807;
pub const DMUS_ERRBASE = 4096;
pub const Uri_CREATE_ALLOW_RELATIVE = 1;
pub const Uri_CREATE_ALLOW_IMPLICIT_WILDCARD_SCHEME = 2;
pub const Uri_CREATE_ALLOW_IMPLICIT_FILE_SCHEME = 4;
pub const Uri_CREATE_NOFRAG = 8;
pub const Uri_CREATE_NO_CANONICALIZE = 16;
pub const Uri_CREATE_CANONICALIZE = 256;
pub const Uri_CREATE_FILE_USE_DOS_PATH = 32;
pub const Uri_CREATE_DECODE_EXTRA_INFO = 64;
pub const Uri_CREATE_NO_DECODE_EXTRA_INFO = 128;
pub const Uri_CREATE_CRACK_UNKNOWN_SCHEMES = 512;
pub const Uri_CREATE_NO_CRACK_UNKNOWN_SCHEMES = 1024;
pub const Uri_CREATE_PRE_PROCESS_HTML_URI = 2048;
pub const Uri_CREATE_NO_PRE_PROCESS_HTML_URI = 4096;
pub const Uri_CREATE_IE_SETTINGS = 8192;
pub const Uri_CREATE_NO_IE_SETTINGS = 16384;
pub const Uri_CREATE_NO_ENCODE_FORBIDDEN_CHARACTERS = 32768;
pub const Uri_CREATE_NORMALIZE_INTL_CHARACTERS = 65536;
pub const Uri_CREATE_CANONICALIZE_ABSOLUTE = 131072;
pub const RPC_C_AUTHN_LEVEL_DEFAULT = 0;
pub const RPC_C_AUTHN_LEVEL_NONE = 1;
pub const RPC_C_AUTHN_LEVEL_CONNECT = 2;
pub const RPC_C_AUTHN_LEVEL_CALL = 3;
pub const RPC_C_AUTHN_LEVEL_PKT = 4;
pub const RPC_C_AUTHN_LEVEL_PKT_INTEGRITY = 5;
pub const RPC_C_AUTHN_LEVEL_PKT_PRIVACY = 6;
pub const RPC_C_IMP_LEVEL_DEFAULT = 0;
pub const RPC_C_IMP_LEVEL_ANONYMOUS = 1;
pub const RPC_C_IMP_LEVEL_IDENTIFY = 2;
pub const RPC_C_IMP_LEVEL_IMPERSONATE = 3;
pub const RPC_C_IMP_LEVEL_DELEGATE = 4;
pub const ROTFLAGS_REGISTRATIONKEEPSALIVE = 1;
pub const ROTFLAGS_ALLOWANYCLIENT = 2;
pub const FADF_AUTO = 1;
pub const FADF_STATIC = 2;
pub const FADF_EMBEDDED = 4;
pub const FADF_FIXEDSIZE = 16;
pub const FADF_RECORD = 32;
pub const FADF_HAVEIID = 64;
pub const FADF_HAVEVARTYPE = 128;
pub const FADF_BSTR = 256;
pub const FADF_UNKNOWN = 512;
pub const FADF_DISPATCH = 1024;
pub const FADF_VARIANT = 2048;
pub const FADF_RESERVED = 61448;
pub const IMPLTYPEFLAG_FDEFAULT = 1;
pub const IMPLTYPEFLAG_FSOURCE = 2;
pub const IMPLTYPEFLAG_FRESTRICTED = 4;
pub const IMPLTYPEFLAG_FDEFAULTVTABLE = 8;
pub const IDLFLAG_NONE = 0;
pub const IDLFLAG_FIN = 1;
pub const IDLFLAG_FOUT = 2;
pub const IDLFLAG_FLCID = 4;
pub const IDLFLAG_FRETVAL = 8;
pub const DISPATCH_METHOD = 1;
pub const DISPATCH_PROPERTYGET = 2;
pub const DISPATCH_PROPERTYPUT = 4;
pub const DISPATCH_PROPERTYPUTREF = 8;
pub const STGM_DIRECT = 0;
pub const STGM_TRANSACTED = 65536;
pub const STGM_SIMPLE = 134217728;
pub const STGM_READ = 0;
pub const STGM_WRITE = 1;
pub const STGM_READWRITE = 2;
pub const STGM_SHARE_DENY_NONE = 64;
pub const STGM_SHARE_DENY_READ = 48;
pub const STGM_SHARE_DENY_WRITE = 32;
pub const STGM_SHARE_EXCLUSIVE = 16;
pub const STGM_PRIORITY = 262144;
pub const STGM_DELETEONRELEASE = 67108864;
pub const STGM_NOSCRATCH = 1048576;
pub const STGM_CREATE = 4096;
pub const STGM_CONVERT = 131072;
pub const STGM_FAILIFTHERE = 0;
pub const STGM_NOSNAPSHOT = 2097152;
pub const STGM_DIRECT_SWMR = 4194304;
pub const DVASPECT_CONTENT = 1;
pub const DVASPECT_THUMBNAIL = 2;
pub const DVASPECT_ICON = 4;
pub const DVASPECT_DOCPRINT = 8;
pub const DVASPECT_OPAQUE = 16;
pub const DVASPECT_TRANSPARENT = 32;
pub const STGC_DEFAULT = 0;
pub const STGC_OVERWRITE = 1;
pub const STGC_ONLYIFCURRENT = 2;
pub const STGC_DANGEROUSLYCOMMITMERELYTODISKCACHE = 4;
pub const STGC_CONSOLIDATE = 8;
pub const STATFLAG_DEFAULT = 0;
pub const STATFLAG_NONAME = 1;
pub const STATFLAG_NOOPEN = 2;
pub const TYSPEC_CLSID = 0;
pub const TYSPEC_FILEEXT = 1;
pub const TYSPEC_MIMETYPE = 2;
pub const TYSPEC_FILENAME = 3;
pub const TYSPEC_PROGID = 4;
pub const TYSPEC_PACKAGENAME = 5;
pub const TYSPEC_OBJECTID = 6;
pub const REGCLS_SINGLEUSE = 0;
pub const REGCLS_MULTIPLEUSE = 1;
pub const REGCLS_MULTI_SEPARATE = 2;
pub const REGCLS_SUSPENDED = 4;
pub const REGCLS_SURROGATE = 8;
pub const REGCLS_AGILE = 16;
pub const COINITBASE_MULTITHREADED = 0;
pub const MEMCTX_TASK = 1;
pub const MEMCTX_SHARED = 2;
pub const MEMCTX_MACSYSTEM = 3;
pub const MEMCTX_UNKNOWN = -1;
pub const MEMCTX_SAME = -2;
pub const CLSCTX_INPROC_SERVER = 1;
pub const CLSCTX_INPROC_HANDLER = 2;
pub const CLSCTX_LOCAL_SERVER = 4;
pub const CLSCTX_INPROC_SERVER16 = 8;
pub const CLSCTX_REMOTE_SERVER = 16;
pub const CLSCTX_INPROC_HANDLER16 = 32;
pub const CLSCTX_RESERVED1 = 64;
pub const CLSCTX_RESERVED2 = 128;
pub const CLSCTX_RESERVED3 = 256;
pub const CLSCTX_RESERVED4 = 512;
pub const CLSCTX_NO_CODE_DOWNLOAD = 1024;
pub const CLSCTX_RESERVED5 = 2048;
pub const CLSCTX_NO_CUSTOM_MARSHAL = 4096;
pub const CLSCTX_ENABLE_CODE_DOWNLOAD = 8192;
pub const CLSCTX_NO_FAILURE_LOG = 16384;
pub const CLSCTX_DISABLE_AAA = 32768;
pub const CLSCTX_ENABLE_AAA = 65536;
pub const CLSCTX_FROM_DEFAULT_CONTEXT = 131072;
pub const CLSCTX_ACTIVATE_X86_SERVER = 262144;
pub const CLSCTX_ACTIVATE_32_BIT_SERVER = 262144;
pub const CLSCTX_ACTIVATE_64_BIT_SERVER = 524288;
pub const CLSCTX_ENABLE_CLOAKING = 1048576;
pub const CLSCTX_APPCONTAINER = 4194304;
pub const CLSCTX_ACTIVATE_AAA_AS_IU = 8388608;
pub const CLSCTX_RESERVED6 = 16777216;
pub const CLSCTX_ACTIVATE_ARM32_SERVER = 33554432;
pub const CLSCTX_ALLOW_LOWER_TRUST_REGISTRATION = 67108864;
pub const CLSCTX_SERVER_MUST_BE_EQUAL_OR_GREATER_PRIVILEGE = 134217728;
pub const CLSCTX_DO_NOT_ELEVATE_SERVER = 268435456;
pub const CLSCTX_PS_DLL = 2147483648;
pub const CLSCTX_ALL = 23;
pub const CLSCTX_SERVER = 21;
pub const MSHLFLAGS_NORMAL = 0;
pub const MSHLFLAGS_TABLESTRONG = 1;
pub const MSHLFLAGS_TABLEWEAK = 2;
pub const MSHLFLAGS_NOPING = 4;
pub const MSHLFLAGS_RESERVED1 = 8;
pub const MSHLFLAGS_RESERVED2 = 16;
pub const MSHLFLAGS_RESERVED3 = 32;
pub const MSHLFLAGS_RESERVED4 = 64;
pub const MSHCTX_LOCAL = 0;
pub const MSHCTX_NOSHAREDMEM = 1;
pub const MSHCTX_DIFFERENTMACHINE = 2;
pub const MSHCTX_INPROC = 3;
pub const MSHCTX_CROSSCTX = 4;
pub const MSHCTX_CONTAINER = 5;
pub const EXTCONN_STRONG = 1;
pub const EXTCONN_WEAK = 2;
pub const EXTCONN_CALLABLE = 4;
pub const STGTY_STORAGE = 1;
pub const STGTY_STREAM = 2;
pub const STGTY_LOCKBYTES = 3;
pub const STGTY_PROPERTY = 4;
pub const STREAM_SEEK_SET = 0;
pub const STREAM_SEEK_CUR = 1;
pub const STREAM_SEEK_END = 2;
pub const LOCK_WRITE = 1;
pub const LOCK_EXCLUSIVE = 2;
pub const LOCK_ONLYONCE = 4;
pub const EOAC_NONE = 0;
pub const EOAC_MUTUAL_AUTH = 1;
pub const EOAC_STATIC_CLOAKING = 32;
pub const EOAC_DYNAMIC_CLOAKING = 64;
pub const EOAC_ANY_AUTHORITY = 128;
pub const EOAC_MAKE_FULLSIC = 256;
pub const EOAC_DEFAULT = 2048;
pub const EOAC_SECURE_REFS = 2;
pub const EOAC_ACCESS_CONTROL = 4;
pub const EOAC_APPID = 8;
pub const EOAC_DYNAMIC = 16;
pub const EOAC_REQUIRE_FULLSIC = 512;
pub const EOAC_AUTO_IMPERSONATE = 1024;
pub const EOAC_DISABLE_AAA = 4096;
pub const EOAC_NO_CUSTOM_MARSHAL = 8192;
pub const EOAC_RESERVED1 = 16384;
pub const COMBND_RPCTIMEOUT = 1;
pub const COMBND_SERVER_LOCALITY = 2;
pub const COMBND_RESERVED1 = 4;
pub const COMBND_RESERVED2 = 5;
pub const COMBND_RESERVED3 = 8;
pub const COMBND_RESERVED4 = 16;
pub const SERVER_LOCALITY_PROCESS_LOCAL = 0;
pub const SERVER_LOCALITY_MACHINE_LOCAL = 1;
pub const SERVER_LOCALITY_REMOTE = 2;
pub const COMGLB_EXCEPTION_HANDLING = 1;
pub const COMGLB_APPID = 2;
pub const COMGLB_RPC_THREADPOOL_SETTING = 3;
pub const COMGLB_RO_SETTINGS = 4;
pub const COMGLB_UNMARSHALING_POLICY = 5;
pub const COMGLB_PROPERTIES_RESERVED1 = 6;
pub const COMGLB_PROPERTIES_RESERVED2 = 7;
pub const COMGLB_PROPERTIES_RESERVED3 = 8;
pub const COMGLB_EXCEPTION_HANDLE = 0;
pub const COMGLB_EXCEPTION_DONOT_HANDLE_FATAL = 1;
pub const COMGLB_EXCEPTION_DONOT_HANDLE = 1;
pub const COMGLB_EXCEPTION_DONOT_HANDLE_ANY = 2;
pub const COMGLB_RPC_THREADPOOL_SETTING_DEFAULT_POOL = 0;
pub const COMGLB_RPC_THREADPOOL_SETTING_PRIVATE_POOL = 1;
pub const COMGLB_STA_MODALLOOP_REMOVE_TOUCH_MESSAGES = 1;
pub const COMGLB_STA_MODALLOOP_SHARED_QUEUE_REMOVE_INPUT_MESSAGES = 2;
pub const COMGLB_STA_MODALLOOP_SHARED_QUEUE_DONOT_REMOVE_INPUT_MESSAGES = 4;
pub const COMGLB_FAST_RUNDOWN = 8;
pub const COMGLB_RESERVED1 = 16;
pub const COMGLB_RESERVED2 = 32;
pub const COMGLB_RESERVED3 = 64;
pub const COMGLB_STA_MODALLOOP_SHARED_QUEUE_REORDER_POINTER_MESSAGES = 128;
pub const COMGLB_RESERVED4 = 256;
pub const COMGLB_RESERVED5 = 512;
pub const COMGLB_RESERVED6 = 1024;
pub const COMGLB_UNMARSHALING_POLICY_NORMAL = 0;
pub const COMGLB_UNMARSHALING_POLICY_STRONG = 1;
pub const COMGLB_UNMARSHALING_POLICY_HYBRID = 2;
pub const DCOM_NONE = 0;
pub const DCOM_CALL_COMPLETE = 1;
pub const DCOM_CALL_CANCELED = 2;
pub const APTTYPEQUALIFIER_NONE = 0;
pub const APTTYPEQUALIFIER_IMPLICIT_MTA = 1;
pub const APTTYPEQUALIFIER_NA_ON_MTA = 2;
pub const APTTYPEQUALIFIER_NA_ON_STA = 3;
pub const APTTYPEQUALIFIER_NA_ON_IMPLICIT_MTA = 4;
pub const APTTYPEQUALIFIER_NA_ON_MAINSTA = 5;
pub const APTTYPEQUALIFIER_APPLICATION_STA = 6;
pub const APTTYPEQUALIFIER_RESERVED_1 = 7;
pub const APTTYPE_CURRENT = -1;
pub const APTTYPE_STA = 0;
pub const APTTYPE_MTA = 1;
pub const APTTYPE_NA = 2;
pub const APTTYPE_MAINSTA = 3;
pub const THDTYPE_BLOCKMESSAGES = 0;
pub const THDTYPE_PROCESSMESSAGES = 1;
pub const CO_MARSHALING_SOURCE_IS_APP_CONTAINER = 0;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_1 = -2147483648;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_2 = -2147483647;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_3 = -2147483646;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_4 = -2147483645;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_5 = -2147483644;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_6 = -2147483643;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_7 = -2147483642;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_8 = -2147483641;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_9 = -2147483640;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_10 = -2147483639;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_11 = -2147483638;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_12 = -2147483637;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_13 = -2147483636;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_14 = -2147483635;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_15 = -2147483634;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_16 = -2147483633;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_17 = -2147483632;
pub const CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_18 = -2147483631;
pub const BIND_MAYBOTHERUSER = 1;
pub const BIND_JUSTTESTEXISTENCE = 2;
pub const MKSYS_NONE = 0;
pub const MKSYS_GENERICCOMPOSITE = 1;
pub const MKSYS_FILEMONIKER = 2;
pub const MKSYS_ANTIMONIKER = 3;
pub const MKSYS_ITEMMONIKER = 4;
pub const MKSYS_POINTERMONIKER = 5;
pub const MKSYS_CLASSMONIKER = 7;
pub const MKSYS_OBJREFMONIKER = 8;
pub const MKSYS_SESSIONMONIKER = 9;
pub const MKSYS_LUAMONIKER = 10;
pub const MKRREDUCE_ONE = 196608;
pub const MKRREDUCE_TOUSER = 131072;
pub const MKRREDUCE_THROUGHUSER = 65536;
pub const MKRREDUCE_ALL = 0;
pub const ADVF_NODATA = 1;
pub const ADVF_PRIMEFIRST = 2;
pub const ADVF_ONLYONCE = 4;
pub const ADVF_DATAONSTOP = 64;
pub const ADVFCACHE_NOHANDLER = 8;
pub const ADVFCACHE_FORCEBUILTIN = 16;
pub const ADVFCACHE_ONSAVE = 32;
pub const TYMED_HGLOBAL = 1;
pub const TYMED_FILE = 2;
pub const TYMED_ISTREAM = 4;
pub const TYMED_ISTORAGE = 8;
pub const TYMED_GDI = 16;
pub const TYMED_MFPICT = 32;
pub const TYMED_ENHMF = 64;
pub const TYMED_NULL = 0;
pub const DATADIR_GET = 1;
pub const DATADIR_SET = 2;
pub const CALLTYPE_TOPLEVEL = 1;
pub const CALLTYPE_NESTED = 2;
pub const CALLTYPE_ASYNC = 3;
pub const CALLTYPE_TOPLEVEL_CALLPENDING = 4;
pub const CALLTYPE_ASYNC_CALLPENDING = 5;
pub const SERVERCALL_ISHANDLED = 0;
pub const SERVERCALL_REJECTED = 1;
pub const SERVERCALL_RETRYLATER = 2;
pub const PENDINGTYPE_TOPLEVEL = 1;
pub const PENDINGTYPE_NESTED = 2;
pub const PENDINGMSG_CANCELCALL = 0;
pub const PENDINGMSG_WAITNOPROCESS = 1;
pub const PENDINGMSG_WAITDEFPROCESS = 2;
pub const ServerApplication = 0;
pub const LibraryApplication = 1;
pub const IdleShutdown = 0;
pub const ForcedShutdown = 1;
pub const COINIT_APARTMENTTHREADED = 2;
pub const COINIT_MULTITHREADED = 0;
pub const COINIT_DISABLE_OLE1DDE = 4;
pub const COINIT_SPEED_OVER_MEMORY = 8;
pub const SD_LAUNCHPERMISSIONS = 0;
pub const SD_ACCESSPERMISSIONS = 1;
pub const SD_LAUNCHRESTRICTIONS = 2;
pub const SD_ACCESSRESTRICTIONS = 3;
pub const COWAIT_DEFAULT = 0;
pub const COWAIT_WAITALL = 1;
pub const COWAIT_ALERTABLE = 2;
pub const COWAIT_INPUTAVAILABLE = 4;
pub const COWAIT_DISPATCH_CALLS = 8;
pub const COWAIT_DISPATCH_WINDOW_MESSAGES = 16;
pub const CWMO_DEFAULT = 0;
pub const CWMO_DISPATCH_CALLS = 1;
pub const CWMO_DISPATCH_WINDOW_MESSAGES = 2;
pub const BINDINFOF_URLENCODESTGMEDDATA = 1;
pub const BINDINFOF_URLENCODEDEXTRAINFO = 2;
pub const Uri_PROPERTY_ABSOLUTE_URI = 0;
pub const Uri_PROPERTY_STRING_START = 0;
pub const Uri_PROPERTY_AUTHORITY = 1;
pub const Uri_PROPERTY_DISPLAY_URI = 2;
pub const Uri_PROPERTY_DOMAIN = 3;
pub const Uri_PROPERTY_EXTENSION = 4;
pub const Uri_PROPERTY_FRAGMENT = 5;
pub const Uri_PROPERTY_HOST = 6;
pub const Uri_PROPERTY_PASSWORD = 7;
pub const Uri_PROPERTY_PATH = 8;
pub const Uri_PROPERTY_PATH_AND_QUERY = 9;
pub const Uri_PROPERTY_QUERY = 10;
pub const Uri_PROPERTY_RAW_URI = 11;
pub const Uri_PROPERTY_SCHEME_NAME = 12;
pub const Uri_PROPERTY_USER_INFO = 13;
pub const Uri_PROPERTY_USER_NAME = 14;
pub const Uri_PROPERTY_STRING_LAST = 14;
pub const Uri_PROPERTY_HOST_TYPE = 15;
pub const Uri_PROPERTY_DWORD_START = 15;
pub const Uri_PROPERTY_PORT = 16;
pub const Uri_PROPERTY_SCHEME = 17;
pub const Uri_PROPERTY_ZONE = 18;
pub const Uri_PROPERTY_DWORD_LAST = 18;
pub const TKIND_ENUM = 0;
pub const TKIND_RECORD = 1;
pub const TKIND_MODULE = 2;
pub const TKIND_INTERFACE = 3;
pub const TKIND_DISPATCH = 4;
pub const TKIND_COCLASS = 5;
pub const TKIND_ALIAS = 6;
pub const TKIND_UNION = 7;
pub const TKIND_MAX = 8;
pub const CC_FASTCALL = 0;
pub const CC_CDECL = 1;
pub const CC_MSCPASCAL = 2;
pub const CC_PASCAL = 2;
pub const CC_MACPASCAL = 3;
pub const CC_STDCALL = 4;
pub const CC_FPFASTCALL = 5;
pub const CC_SYSCALL = 6;
pub const CC_MPWCDECL = 7;
pub const CC_MPWPASCAL = 8;
pub const CC_MAX = 9;
pub const FUNC_VIRTUAL = 0;
pub const FUNC_PUREVIRTUAL = 1;
pub const FUNC_NONVIRTUAL = 2;
pub const FUNC_STATIC = 3;
pub const FUNC_DISPATCH = 4;
pub const INVOKE_FUNC = 1;
pub const INVOKE_PROPERTYGET = 2;
pub const INVOKE_PROPERTYPUT = 4;
pub const INVOKE_PROPERTYPUTREF = 8;
pub const VAR_PERINSTANCE = 0;
pub const VAR_STATIC = 1;
pub const VAR_CONST = 2;
pub const VAR_DISPATCH = 3;
pub const FUNCFLAG_FRESTRICTED = 1;
pub const FUNCFLAG_FSOURCE = 2;
pub const FUNCFLAG_FBINDABLE = 4;
pub const FUNCFLAG_FREQUESTEDIT = 8;
pub const FUNCFLAG_FDISPLAYBIND = 16;
pub const FUNCFLAG_FDEFAULTBIND = 32;
pub const FUNCFLAG_FHIDDEN = 64;
pub const FUNCFLAG_FUSESGETLASTERROR = 128;
pub const FUNCFLAG_FDEFAULTCOLLELEM = 256;
pub const FUNCFLAG_FUIDEFAULT = 512;
pub const FUNCFLAG_FNONBROWSABLE = 1024;
pub const FUNCFLAG_FREPLACEABLE = 2048;
pub const FUNCFLAG_FIMMEDIATEBIND = 4096;
pub const VARFLAG_FREADONLY = 1;
pub const VARFLAG_FSOURCE = 2;
pub const VARFLAG_FBINDABLE = 4;
pub const VARFLAG_FREQUESTEDIT = 8;
pub const VARFLAG_FDISPLAYBIND = 16;
pub const VARFLAG_FDEFAULTBIND = 32;
pub const VARFLAG_FHIDDEN = 64;
pub const VARFLAG_FRESTRICTED = 128;
pub const VARFLAG_FDEFAULTCOLLELEM = 256;
pub const VARFLAG_FUIDEFAULT = 512;
pub const VARFLAG_FNONBROWSABLE = 1024;
pub const VARFLAG_FREPLACEABLE = 2048;
pub const VARFLAG_FIMMEDIATEBIND = 4096;
pub const DESCKIND_NONE = 0;
pub const DESCKIND_FUNCDESC = 1;
pub const DESCKIND_VARDESC = 2;
pub const DESCKIND_TYPECOMP = 3;
pub const DESCKIND_IMPLICITAPPOBJ = 4;
pub const DESCKIND_MAX = 5;
pub const SYS_WIN16 = 0;
pub const SYS_WIN32 = 1;
pub const SYS_MAC = 2;
pub const SYS_WIN64 = 3;

pub const aliases = struct {
    pub const URI_CREATE_FLAGS = u32;
    pub const RPC_C_AUTHN_LEVEL = u32;
    pub const RPC_C_IMP_LEVEL = u32;
    pub const ROT_FLAGS = u32;
    pub const ADVANCED_FEATURE_FLAGS = u16;
    pub const IMPLTYPEFLAGS = i32;
    pub const IDLFLAGS = u16;
    pub const DISPATCH_FLAGS = u16;
    pub const STGM = u32;
    pub const DVASPECT = u32;
    pub const STGC = i32;
    pub const STATFLAG = i32;
    pub const TYSPEC = i32;
    pub const REGCLS = i32;
    pub const COINITBASE = i32;
    pub const MEMCTX = i32;
    pub const CLSCTX = u32;
    pub const MSHLFLAGS = i32;
    pub const MSHCTX = i32;
    pub const EXTCONN = i32;
    pub const STGTY = i32;
    pub const STREAM_SEEK = u32;
    pub const LOCKTYPE = i32;
    pub const EOLE_AUTHENTICATION_CAPABILITIES = i32;
    pub const RPCOPT_PROPERTIES = i32;
    pub const RPCOPT_SERVER_LOCALITY_VALUES = i32;
    pub const GLOBALOPT_PROPERTIES = i32;
    pub const GLOBALOPT_EH_VALUES = i32;
    pub const GLOBALOPT_RPCTP_VALUES = i32;
    pub const GLOBALOPT_RO_FLAGS = i32;
    pub const GLOBALOPT_UNMARSHALING_POLICY_VALUES = i32;
    pub const DCOM_CALL_STATE = i32;
    pub const APTTYPEQUALIFIER = i32;
    pub const APTTYPE = i32;
    pub const THDTYPE = i32;
    pub const CO_MARSHALING_CONTEXT_ATTRIBUTES = i32;
    pub const BIND_FLAGS = i32;
    pub const MKSYS = i32;
    pub const MKRREDUCE = i32;
    pub const ADVF = i32;
    pub const TYMED = i32;
    pub const DATADIR = i32;
    pub const CALLTYPE = i32;
    pub const SERVERCALL = i32;
    pub const PENDINGTYPE = i32;
    pub const PENDINGMSG = i32;
    pub const ApplicationType = i32;
    pub const ShutdownType = i32;
    pub const COINIT = i32;
    pub const COMSD = i32;
    pub const COWAIT_FLAGS = i32;
    pub const CWMO_FLAGS = i32;
    pub const BINDINFOF = i32;
    pub const Uri_PROPERTY = i32;
    pub const TYPEKIND = i32;
    pub const CALLCONV = i32;
    pub const FUNCKIND = i32;
    pub const INVOKEKIND = i32;
    pub const VARKIND = i32;
    pub const FUNCFLAGS = u16;
    pub const VARFLAGS = u16;
    pub const DESCKIND = i32;
    pub const SYSKIND = i32;
    pub const CO_MTA_USAGE_COOKIE = ?*anyopaque;
    pub const CO_DEVICE_CATALOG_COOKIE = ?*anyopaque;
    pub const MachineGlobalObjectTableRegistrationToken = ?*anyopaque;
    pub const LPEXCEPFINO_DEFERRED_FILLIN = ?*const anyopaque;
    pub const LPFNGETCLASSOBJECT = ?*const anyopaque;
    pub const LPFNCANUNLOADNOW = ?*const anyopaque;
    pub const PFNCONTEXTCALL = ?*const anyopaque;
};
