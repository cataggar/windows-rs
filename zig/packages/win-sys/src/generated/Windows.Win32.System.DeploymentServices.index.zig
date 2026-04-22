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
    .{ "WdsCliClose", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliClose", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "WdsCliRegisterTrace", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliRegisterTrace", .signature = "\x00\x01\x11\x79\x12\xc0\x00\x40\xc9" } },
    .{ "WdsCliFreeStringArray", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliFreeStringArray", .signature = "\x00\x02\x11\x79\x0f\x11\x05\x09" } },
    .{ "WdsCliFindFirstImage", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliFindFirstImage", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\x80\x85" } },
    .{ "WdsCliFindNextImage", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliFindNextImage", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "WdsCliGetEnumerationFlags", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetEnumerationFlags", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x09" } },
    .{ "WdsCliGetImageHandleFromFindHandle", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageHandleFromFindHandle", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\x80\x85" } },
    .{ "WdsCliGetImageHandleFromTransferHandle", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageHandleFromTransferHandle", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\x80\x85" } },
    .{ "WdsCliCreateSession", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliCreateSession", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\xc0\x00\x40\xcd\x0f\x11\x80\x85" } },
    .{ "WdsCliAuthorizeSession", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliAuthorizeSession", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\xc0\x00\x40\xcd" } },
    .{ "WdsCliInitializeLog", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliInitializeLog", .signature = "\x00\x04\x11\x79\x11\x80\x85\x11\xa0\xbd\x11\x05\x11\x05" } },
    .{ "WdsCliLog", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliLog", .signature = "\x05\x03\x11\x79\x11\x80\x85\x09\x09" } },
    .{ "WdsCliGetImageName", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageName", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\x05" } },
    .{ "WdsCliGetImageDescription", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageDescription", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\x05" } },
    .{ "WdsCliGetImageType", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageType", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\xc0\x00\x40\xd1" } },
    .{ "WdsCliGetImageFiles", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageFiles", .signature = "\x00\x03\x11\x79\x11\x80\x85\x0f\x0f\x11\x05\x0f\x09" } },
    .{ "WdsCliGetImageLanguage", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageLanguage", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\x05" } },
    .{ "WdsCliGetImageLanguages", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageLanguages", .signature = "\x00\x03\x11\x79\x11\x80\x85\x0f\x0f\x0f\x04\x0f\x09" } },
    .{ "WdsCliGetImageVersion", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageVersion", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\x05" } },
    .{ "WdsCliGetImagePath", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImagePath", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\x05" } },
    .{ "WdsCliGetImageIndex", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageIndex", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x09" } },
    .{ "WdsCliGetImageArchitecture", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageArchitecture", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\xa0\xbd" } },
    .{ "WdsCliGetImageLastModifiedTime", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageLastModifiedTime", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x0f\x11\x86\x45" } },
    .{ "WdsCliGetImageSize", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageSize", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x0b" } },
    .{ "WdsCliGetImageHalName", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageHalName", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\x05" } },
    .{ "WdsCliGetImageGroup", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageGroup", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\x05" } },
    .{ "WdsCliGetImageNamespace", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageNamespace", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x11\x05" } },
    .{ "WdsCliGetImageParameter", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetImageParameter", .signature = "\x00\x04\x11\x79\x11\x80\x85\x11\xc0\x00\x40\xd5\x0f\x01\x09" } },
    .{ "WdsCliGetTransferSize", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetTransferSize", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x0b" } },
    .{ "WdsCliSetTransferBufferSize", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliSetTransferBufferSize", .signature = "\x00\x01\x01\x09" } },
    .{ "WdsCliTransferImage", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliTransferImage", .signature = "\x00\x07\x11\x79\x11\x80\x85\x11\x05\x09\x09\x12\xc0\x00\x40\xd9\x0f\x01\x0f\x11\x80\x85" } },
    .{ "WdsCliTransferFile", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliTransferFile", .signature = "\x00\x09\x11\x79\x11\x05\x11\x05\x11\x05\x11\x05\x09\x09\x12\xc0\x00\x40\xd9\x0f\x01\x0f\x11\x80\x85" } },
    .{ "WdsCliCancelTransfer", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliCancelTransfer", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "WdsCliWaitForTransfer", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliWaitForTransfer", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "WdsCliObtainDriverPackages", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliObtainDriverPackages", .signature = "\x00\x04\x11\x79\x11\x80\x85\x0f\x11\x05\x0f\x0f\x11\x05\x0f\x09" } },
    .{ "WdsCliObtainDriverPackagesEx", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliObtainDriverPackagesEx", .signature = "\x00\x05\x11\x79\x11\x80\x85\x11\x05\x0f\x11\x05\x0f\x0f\x11\x05\x0f\x09" } },
    .{ "WdsCliGetDriverQueryXml", MethodRecord{ .library = "WDSCLIENTAPI", .import = "WdsCliGetDriverQueryXml", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\x05" } },
    .{ "PxeProviderRegister", MethodRecord{ .library = "WDSPXE", .import = "PxeProviderRegister", .signature = "\x00\x05\x09\x11\x05\x11\x05\x09\x11\x59\x0f\x11\x55" } },
    .{ "PxeProviderUnRegister", MethodRecord{ .library = "WDSPXE", .import = "PxeProviderUnRegister", .signature = "\x00\x01\x09\x11\x05" } },
    .{ "PxeProviderQueryIndex", MethodRecord{ .library = "WDSPXE", .import = "PxeProviderQueryIndex", .signature = "\x00\x02\x09\x11\x05\x0f\x09" } },
    .{ "PxeProviderEnumFirst", MethodRecord{ .library = "WDSPXE", .import = "PxeProviderEnumFirst", .signature = "\x00\x01\x09\x0f\x11\x80\x85" } },
    .{ "PxeProviderEnumNext", MethodRecord{ .library = "WDSPXE", .import = "PxeProviderEnumNext", .signature = "\x00\x02\x09\x11\x80\x85\x0f\x0f\x11\xc0\x00\x40\xdd" } },
    .{ "PxeProviderEnumClose", MethodRecord{ .library = "WDSPXE", .import = "PxeProviderEnumClose", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "PxeProviderFreeInfo", MethodRecord{ .library = "WDSPXE", .import = "PxeProviderFreeInfo", .signature = "\x00\x01\x09\x0f\x11\xc0\x00\x40\xdd" } },
    .{ "PxeRegisterCallback", MethodRecord{ .library = "WDSPXE", .import = "PxeRegisterCallback", .signature = "\x00\x04\x09\x11\x80\x85\x09\x0f\x01\x0f\x01" } },
    .{ "PxeSendReply", MethodRecord{ .library = "WDSPXE", .import = "PxeSendReply", .signature = "\x00\x04\x09\x11\x80\x85\x0f\x01\x09\x0f\x11\xc0\x00\x40\xe1" } },
    .{ "PxeAsyncRecvDone", MethodRecord{ .library = "WDSPXE", .import = "PxeAsyncRecvDone", .signature = "\x00\x02\x09\x11\x80\x85\x09" } },
    .{ "PxeTrace", MethodRecord{ .library = "WDSPXE", .import = "PxeTrace", .signature = "\x05\x03\x09\x11\x80\x85\x09\x11\x05" } },
    .{ "PxeTraceV", MethodRecord{ .library = "WDSPXE", .import = "PxeTraceV", .signature = "\x00\x04\x09\x11\x80\x85\x09\x11\x05\x0f\x04" } },
    .{ "PxePacketAllocate", MethodRecord{ .library = "WDSPXE", .import = "PxePacketAllocate", .signature = "\x00\x03\x0f\x01\x11\x80\x85\x11\x80\x85\x09" } },
    .{ "PxePacketFree", MethodRecord{ .library = "WDSPXE", .import = "PxePacketFree", .signature = "\x00\x03\x09\x11\x80\x85\x11\x80\x85\x0f\x01" } },
    .{ "PxeProviderSetAttribute", MethodRecord{ .library = "WDSPXE", .import = "PxeProviderSetAttribute", .signature = "\x00\x04\x09\x11\x80\x85\x09\x0f\x01\x09" } },
    .{ "PxeDhcpInitialize", MethodRecord{ .library = "WDSPXE", .import = "PxeDhcpInitialize", .signature = "\x00\x05\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "PxeDhcpv6Initialize", MethodRecord{ .library = "WDSPXE", .import = "PxeDhcpv6Initialize", .signature = "\x00\x05\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "PxeDhcpAppendOption", MethodRecord{ .library = "WDSPXE", .import = "PxeDhcpAppendOption", .signature = "\x00\x06\x09\x0f\x01\x09\x0f\x09\x05\x05\x0f\x01" } },
    .{ "PxeDhcpv6AppendOption", MethodRecord{ .library = "WDSPXE", .import = "PxeDhcpv6AppendOption", .signature = "\x00\x06\x09\x0f\x01\x09\x0f\x09\x07\x07\x0f\x01" } },
    .{ "PxeDhcpAppendOptionRaw", MethodRecord{ .library = "WDSPXE", .import = "PxeDhcpAppendOptionRaw", .signature = "\x00\x05\x09\x0f\x01\x09\x0f\x09\x07\x0f\x01" } },
    .{ "PxeDhcpv6AppendOptionRaw", MethodRecord{ .library = "WDSPXE", .import = "PxeDhcpv6AppendOptionRaw", .signature = "\x00\x05\x09\x0f\x01\x09\x0f\x09\x07\x0f\x01" } },
    .{ "PxeDhcpIsValid", MethodRecord{ .library = "WDSPXE", .import = "PxeDhcpIsValid", .signature = "\x00\x04\x09\x0f\x01\x09\x11\x59\x0f\x11\x59" } },
    .{ "PxeDhcpv6IsValid", MethodRecord{ .library = "WDSPXE", .import = "PxeDhcpv6IsValid", .signature = "\x00\x04\x09\x0f\x01\x09\x11\x59\x0f\x11\x59" } },
    .{ "PxeDhcpGetOptionValue", MethodRecord{ .library = "WDSPXE", .import = "PxeDhcpGetOptionValue", .signature = "\x00\x06\x09\x0f\x01\x09\x09\x05\x0f\x05\x0f\x0f\x01" } },
    .{ "PxeDhcpv6GetOptionValue", MethodRecord{ .library = "WDSPXE", .import = "PxeDhcpv6GetOptionValue", .signature = "\x00\x06\x09\x0f\x01\x09\x09\x07\x0f\x07\x0f\x0f\x01" } },
    .{ "PxeDhcpGetVendorOptionValue", MethodRecord{ .library = "WDSPXE", .import = "PxeDhcpGetVendorOptionValue", .signature = "\x00\x06\x09\x0f\x01\x09\x05\x09\x0f\x05\x0f\x0f\x01" } },
    .{ "PxeDhcpv6GetVendorOptionValue", MethodRecord{ .library = "WDSPXE", .import = "PxeDhcpv6GetVendorOptionValue", .signature = "\x00\x07\x09\x0f\x01\x09\x09\x07\x09\x0f\x07\x0f\x0f\x01" } },
    .{ "PxeDhcpv6ParseRelayForw", MethodRecord{ .library = "WDSPXE", .import = "PxeDhcpv6ParseRelayForw", .signature = "\x00\x07\x09\x0f\x01\x09\x0f\x11\xc0\x00\x40\xe5\x09\x0f\x09\x0f\x0f\x05\x0f\x09" } },
    .{ "PxeDhcpv6CreateRelayRepl", MethodRecord{ .library = "WDSPXE", .import = "PxeDhcpv6CreateRelayRepl", .signature = "\x00\x07\x09\x0f\x11\xc0\x00\x40\xe5\x09\x0f\x05\x09\x0f\x01\x09\x0f\x09" } },
    .{ "PxeGetServerInfo", MethodRecord{ .library = "WDSPXE", .import = "PxeGetServerInfo", .signature = "\x00\x03\x09\x09\x0f\x01\x09" } },
    .{ "PxeGetServerInfoEx", MethodRecord{ .library = "WDSPXE", .import = "PxeGetServerInfoEx", .signature = "\x00\x04\x09\x09\x0f\x01\x09\x0f\x09" } },
    .{ "WdsTransportServerRegisterCallback", MethodRecord{ .library = "WDSMC", .import = "WdsTransportServerRegisterCallback", .signature = "\x00\x03\x11\x79\x11\x80\x85\x11\xc0\x00\x40\xe9\x0f\x01" } },
    .{ "WdsTransportServerCompleteRead", MethodRecord{ .library = "WDSMC", .import = "WdsTransportServerCompleteRead", .signature = "\x00\x04\x11\x79\x11\x80\x85\x09\x0f\x01\x11\x79" } },
    .{ "WdsTransportServerTrace", MethodRecord{ .library = "WDSMC", .import = "WdsTransportServerTrace", .signature = "\x05\x03\x11\x79\x11\x80\x85\x09\x11\x05" } },
    .{ "WdsTransportServerTraceV", MethodRecord{ .library = "WDSMC", .import = "WdsTransportServerTraceV", .signature = "\x00\x04\x11\x79\x11\x80\x85\x09\x11\x05\x0f\x04" } },
    .{ "WdsTransportServerAllocateBuffer", MethodRecord{ .library = "WDSMC", .import = "WdsTransportServerAllocateBuffer", .signature = "\x00\x02\x0f\x01\x11\x80\x85\x09" } },
    .{ "WdsTransportServerFreeBuffer", MethodRecord{ .library = "WDSMC", .import = "WdsTransportServerFreeBuffer", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0f\x01" } },
    .{ "WdsTransportClientInitialize", MethodRecord{ .library = "WDSTPTC", .import = "WdsTransportClientInitialize", .signature = "\x00\x00\x09" } },
    .{ "WdsTransportClientInitializeSession", MethodRecord{ .library = "WDSTPTC", .import = "WdsTransportClientInitializeSession", .signature = "\x00\x03\x09\x0f\x11\xc0\x00\x40\xed\x0f\x01\x0f\x11\x80\x85" } },
    .{ "WdsTransportClientRegisterCallback", MethodRecord{ .library = "WDSTPTC", .import = "WdsTransportClientRegisterCallback", .signature = "\x00\x03\x09\x11\x80\x85\x11\xc0\x00\x40\xf1\x0f\x01" } },
    .{ "WdsTransportClientStartSession", MethodRecord{ .library = "WDSTPTC", .import = "WdsTransportClientStartSession", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "WdsTransportClientCompleteReceive", MethodRecord{ .library = "WDSTPTC", .import = "WdsTransportClientCompleteReceive", .signature = "\x00\x03\x09\x11\x80\x85\x09\x0f\x0b" } },
    .{ "WdsTransportClientCancelSession", MethodRecord{ .library = "WDSTPTC", .import = "WdsTransportClientCancelSession", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "WdsTransportClientCancelSessionEx", MethodRecord{ .library = "WDSTPTC", .import = "WdsTransportClientCancelSessionEx", .signature = "\x00\x02\x09\x11\x80\x85\x09" } },
    .{ "WdsTransportClientWaitForCompletion", MethodRecord{ .library = "WDSTPTC", .import = "WdsTransportClientWaitForCompletion", .signature = "\x00\x02\x09\x11\x80\x85\x09" } },
    .{ "WdsTransportClientQueryStatus", MethodRecord{ .library = "WDSTPTC", .import = "WdsTransportClientQueryStatus", .signature = "\x00\x03\x09\x11\x80\x85\x0f\x09\x0f\x09" } },
    .{ "WdsTransportClientCloseSession", MethodRecord{ .library = "WDSTPTC", .import = "WdsTransportClientCloseSession", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "WdsTransportClientAddRefBuffer", MethodRecord{ .library = "WDSTPTC", .import = "WdsTransportClientAddRefBuffer", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "WdsTransportClientReleaseBuffer", MethodRecord{ .library = "WDSTPTC", .import = "WdsTransportClientReleaseBuffer", .signature = "\x00\x01\x09\x0f\x01" } },
    .{ "WdsTransportClientShutdown", MethodRecord{ .library = "WDSTPTC", .import = "WdsTransportClientShutdown", .signature = "\x00\x00\x09" } },
    .{ "WdsBpParseInitialize", MethodRecord{ .library = "WDSBP", .import = "WdsBpParseInitialize", .signature = "\x00\x04\x09\x0f\x01\x09\x0f\x05\x0f\x11\x80\x85" } },
    .{ "WdsBpParseInitializev6", MethodRecord{ .library = "WDSBP", .import = "WdsBpParseInitializev6", .signature = "\x00\x04\x09\x0f\x01\x09\x0f\x05\x0f\x11\x80\x85" } },
    .{ "WdsBpInitialize", MethodRecord{ .library = "WDSBP", .import = "WdsBpInitialize", .signature = "\x00\x02\x09\x05\x0f\x11\x80\x85" } },
    .{ "WdsBpCloseHandle", MethodRecord{ .library = "WDSBP", .import = "WdsBpCloseHandle", .signature = "\x00\x01\x09\x11\x80\x85" } },
    .{ "WdsBpQueryOption", MethodRecord{ .library = "WDSBP", .import = "WdsBpQueryOption", .signature = "\x00\x05\x09\x11\x80\x85\x09\x09\x0f\x01\x0f\x09" } },
    .{ "WdsBpAddOption", MethodRecord{ .library = "WDSBP", .import = "WdsBpAddOption", .signature = "\x00\x04\x09\x11\x80\x85\x09\x09\x0f\x01" } },
    .{ "WdsBpGetOptionBuffer", MethodRecord{ .library = "WDSBP", .import = "WdsBpGetOptionBuffer", .signature = "\x00\x04\x09\x11\x80\x85\x09\x0f\x01\x0f\x09" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x55 => TypeRefEntry{ .namespace = "Windows.Win32.System.Registry", .name = "HKEY" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x645 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SYSTEMTIME" },
        0x20bd => TypeRefEntry{ .namespace = "Windows.Win32.System.DeploymentServices", .name = "CPU_ARCHITECTURE" },
        0x40c9 => TypeRefEntry{ .namespace = "Windows.Win32.System.DeploymentServices", .name = "PFN_WdsCliTraceFunction" },
        0x40cd => TypeRefEntry{ .namespace = "Windows.Win32.System.DeploymentServices", .name = "WDS_CLI_CRED" },
        0x40d1 => TypeRefEntry{ .namespace = "Windows.Win32.System.DeploymentServices", .name = "WDS_CLI_IMAGE_TYPE" },
        0x40d5 => TypeRefEntry{ .namespace = "Windows.Win32.System.DeploymentServices", .name = "WDS_CLI_IMAGE_PARAM_TYPE" },
        0x40d9 => TypeRefEntry{ .namespace = "Windows.Win32.System.DeploymentServices", .name = "PFN_WdsCliCallback" },
        0x40dd => TypeRefEntry{ .namespace = "Windows.Win32.System.DeploymentServices", .name = "PXE_PROVIDER" },
        0x40e1 => TypeRefEntry{ .namespace = "Windows.Win32.System.DeploymentServices", .name = "PXE_ADDRESS" },
        0x40e5 => TypeRefEntry{ .namespace = "Windows.Win32.System.DeploymentServices", .name = "PXE_DHCPV6_NESTED_RELAY_MESSAGE" },
        0x40e9 => TypeRefEntry{ .namespace = "Windows.Win32.System.DeploymentServices", .name = "TRANSPORTPROVIDER_CALLBACK_ID" },
        0x40ed => TypeRefEntry{ .namespace = "Windows.Win32.System.DeploymentServices", .name = "WDS_TRANSPORTCLIENT_REQUEST" },
        0x40f1 => TypeRefEntry{ .namespace = "Windows.Win32.System.DeploymentServices", .name = "TRANSPORTCLIENT_CALLBACK_ID" },
        else => null,
    };
}

pub const CPU_ARCHITECTURE_AMD64 = 9;
pub const CPU_ARCHITECTURE_IA64 = 6;
pub const CPU_ARCHITECTURE_INTEL = 0;
pub const WDS_CLI_MSG_START = 0;
pub const WDS_CLI_MSG_COMPLETE = 1;
pub const WDS_CLI_MSG_PROGRESS = 2;
pub const WDS_CLI_MSG_TEXT = 3;
pub const WDS_TRANSPORTCLIENT_AUTH = 1;
pub const WDS_TRANSPORTCLIENT_NO_AUTH = 2;
pub const WDS_CLI_TRANSFER_ASYNCHRONOUS = 1;
pub const WDS_CLI_NO_SPARSE_FILE = 2;
pub const PXE_DHCP_SERVER_PORT = 67;
pub const PXE_DHCP_CLIENT_PORT = 68;
pub const PXE_SERVER_PORT = 4011;
pub const PXE_DHCPV6_SERVER_PORT = 547;
pub const PXE_DHCPV6_CLIENT_PORT = 546;
pub const PXE_DHCP_FILE_SIZE = 128;
pub const PXE_DHCP_SERVER_SIZE = 64;
pub const PXE_DHCP_HWAADR_SIZE = 16;
pub const PXE_DHCP_MAGIC_COOKIE_SIZE = 4;
pub const PXE_REG_INDEX_TOP = 0;
pub const PXE_REG_INDEX_BOTTOM = 4294967295;
pub const PXE_CALLBACK_RECV_REQUEST = 0;
pub const PXE_CALLBACK_SHUTDOWN = 1;
pub const PXE_CALLBACK_SERVICE_CONTROL = 2;
pub const PXE_CALLBACK_MAX = 3;
pub const PXE_GSI_TRACE_ENABLED = 1;
pub const PXE_GSI_SERVER_DUID = 2;
pub const PXE_MAX_ADDRESS = 16;
pub const PXE_ADDR_BROADCAST = 1;
pub const PXE_ADDR_USE_PORT = 2;
pub const PXE_ADDR_USE_ADDR = 4;
pub const PXE_ADDR_USE_DHCP_RULES = 8;
pub const PXE_DHCPV6_RELAY_HOP_COUNT_LIMIT = 32;
pub const PXE_BA_NBP = 1;
pub const PXE_BA_CUSTOM = 2;
pub const PXE_BA_IGNORE = 3;
pub const PXE_BA_REJECTED = 4;
pub const PXE_TRACE_VERBOSE = 65536;
pub const PXE_TRACE_INFO = 131072;
pub const PXE_TRACE_WARNING = 262144;
pub const PXE_TRACE_ERROR = 524288;
pub const PXE_TRACE_FATAL = 1048576;
pub const PXE_PROV_ATTR_FILTER = 0;
pub const PXE_PROV_ATTR_FILTER_IPV6 = 1;
pub const PXE_PROV_ATTR_IPV6_CAPABLE = 2;
pub const PXE_PROV_FILTER_ALL = 0;
pub const PXE_PROV_FILTER_DHCP_ONLY = 1;
pub const PXE_PROV_FILTER_PXE_ONLY = 2;
pub const MC_SERVER_CURRENT_VERSION = 1;
pub const TRANSPORTPROVIDER_CURRENT_VERSION = 1;
pub const WDS_MC_TRACE_VERBOSE = 65536;
pub const WDS_MC_TRACE_INFO = 131072;
pub const WDS_MC_TRACE_WARNING = 262144;
pub const WDS_MC_TRACE_ERROR = 524288;
pub const WDS_MC_TRACE_FATAL = 1048576;
pub const WDS_TRANSPORTCLIENT_CURRENT_API_VERSION = 1;
pub const WDS_TRANSPORTCLIENT_PROTOCOL_MULTICAST = 1;
pub const WDS_TRANSPORTCLIENT_NO_CACHE = 0;
pub const WDS_TRANSPORTCLIENT_STATUS_IN_PROGRESS = 1;
pub const WDS_TRANSPORTCLIENT_STATUS_SUCCESS = 2;
pub const WDS_TRANSPORTCLIENT_STATUS_FAILURE = 3;
pub const WDSTRANSPORT_RESOURCE_UTILIZATION_UNKNOWN = 255;
pub const WDSBP_PK_TYPE_DHCP = 1;
pub const WDSBP_PK_TYPE_WDSNBP = 2;
pub const WDSBP_PK_TYPE_BCD = 4;
pub const WDSBP_PK_TYPE_DHCPV6 = 8;
pub const WDSBP_OPT_TYPE_NONE = 0;
pub const WDSBP_OPT_TYPE_BYTE = 1;
pub const WDSBP_OPT_TYPE_USHORT = 2;
pub const WDSBP_OPT_TYPE_ULONG = 3;
pub const WDSBP_OPT_TYPE_WSTR = 4;
pub const WDSBP_OPT_TYPE_STR = 5;
pub const WDSBP_OPT_TYPE_IP4 = 6;
pub const WDSBP_OPT_TYPE_IP6 = 7;
pub const WDSBP_OPTVAL_ACTION_APPROVAL = 1;
pub const WDSBP_OPTVAL_ACTION_REFERRAL = 3;
pub const WDSBP_OPTVAL_ACTION_ABORT = 5;
pub const WDSBP_OPTVAL_PXE_PROMPT_OPTIN = 1;
pub const WDSBP_OPTVAL_PXE_PROMPT_NOPROMPT = 2;
pub const WDSBP_OPTVAL_PXE_PROMPT_OPTOUT = 3;
pub const WDSBP_OPTVAL_NBP_VER_7 = 1792;
pub const WDSBP_OPTVAL_NBP_VER_8 = 2048;
pub const FACILITY_WDSMCSERVER = 289;
pub const FACILITY_WDSMCCLIENT = 290;
pub const WDSMCSERVER_CATEGORY = 1;
pub const WDSMCCLIENT_CATEGORY = 2;
pub const WDSMCS_E_SESSION_SHUTDOWN_IN_PROGRESS = -1054801664;
pub const WDSMCS_E_REQCALLBACKS_NOT_REG = -1054801663;
pub const WDSMCS_E_INCOMPATIBLE_VERSION = -1054801662;
pub const WDSMCS_E_CONTENT_NOT_FOUND = -1054801661;
pub const WDSMCS_E_CLIENT_NOT_FOUND = -1054801660;
pub const WDSMCS_E_NAMESPACE_NOT_FOUND = -1054801659;
pub const WDSMCS_E_CONTENT_PROVIDER_NOT_FOUND = -1054801658;
pub const WDSMCS_E_NAMESPACE_ALREADY_EXISTS = -1054801657;
pub const WDSMCS_E_NAMESPACE_SHUTDOWN_IN_PROGRESS = -1054801656;
pub const WDSMCS_E_NAMESPACE_ALREADY_STARTED = -1054801655;
pub const WDSMCS_E_NS_START_FAILED_NO_CLIENTS = -1054801654;
pub const WDSMCS_E_START_TIME_IN_PAST = -1054801653;
pub const WDSMCS_E_PACKET_NOT_HASHED = -1054801652;
pub const WDSMCS_E_PACKET_NOT_SIGNED = -1054801651;
pub const WDSMCS_E_PACKET_HAS_SECURITY = -1054801650;
pub const WDSMCS_E_PACKET_NOT_CHECKSUMED = -1054801649;
pub const WDSMCS_E_CLIENT_DOESNOT_SUPPORT_SECURITY_MODE = -1054801648;
pub const EVT_WDSMCS_S_PARAMETERS_READ = 1092682240;
pub const EVT_WDSMCS_E_PARAMETERS_READ_FAILED = -1054801407;
pub const EVT_WDSMCS_E_DUPLICATE_MULTICAST_ADDR = -1054801406;
pub const EVT_WDSMCS_E_NON_WDS_DUPLICATE_MULTICAST_ADDR = -1054801405;
pub const EVT_WDSMCS_E_CP_DLL_LOAD_FAILED = -1054801328;
pub const EVT_WDSMCS_E_CP_INIT_FUNC_MISSING = -1054801327;
pub const EVT_WDSMCS_E_CP_INIT_FUNC_FAILED = -1054801326;
pub const EVT_WDSMCS_E_CP_INCOMPATIBLE_SERVER_VERSION = -1054801325;
pub const EVT_WDSMCS_E_CP_CALLBACKS_NOT_REG = -1054801324;
pub const EVT_WDSMCS_E_CP_SHUTDOWN_FUNC_FAILED = -1054801323;
pub const EVT_WDSMCS_E_CP_MEMORY_LEAK = -1054801322;
pub const EVT_WDSMCS_E_CP_OPEN_INSTANCE_FAILED = -1054801321;
pub const EVT_WDSMCS_E_CP_CLOSE_INSTANCE_FAILED = -1054801320;
pub const EVT_WDSMCS_E_CP_OPEN_CONTENT_FAILED = -1054801319;
pub const EVT_WDSMCS_W_CP_DLL_LOAD_FAILED_NOT_CRITICAL = -2128543142;
pub const EVT_WDSMCS_E_CP_DLL_LOAD_FAILED_CRITICAL = -1054801317;
pub const EVT_WDSMCS_E_NSREG_START_TIME_IN_PAST = -1054801152;
pub const EVT_WDSMCS_E_NSREG_CONTENT_PROVIDER_NOT_REG = -1054801151;
pub const EVT_WDSMCS_E_NSREG_NAMESPACE_EXISTS = -1054801150;
pub const EVT_WDSMCS_E_NSREG_FAILURE = -1054801149;
pub const WDSTPC_E_CALLBACKS_NOT_REG = -1054735616;
pub const WDSTPC_E_ALREADY_COMPLETED = -1054735615;
pub const WDSTPC_E_ALREADY_IN_PROGRESS = -1054735614;
pub const WDSTPC_E_UNKNOWN_ERROR = -1054735613;
pub const WDSTPC_E_NOT_INITIALIZED = -1054735612;
pub const WDSTPC_E_KICKED_POLICY_NOT_MET = -1054735611;
pub const WDSTPC_E_KICKED_FALLBACK = -1054735610;
pub const WDSTPC_E_KICKED_FAIL = -1054735609;
pub const WDSTPC_E_KICKED_UNKNOWN = -1054735608;
pub const WDSTPC_E_MULTISTREAM_NOT_ENABLED = -1054735607;
pub const WDSTPC_E_ALREADY_IN_LOWEST_SESSION = -1054735606;
pub const WDSTPC_E_CLIENT_DEMOTE_NOT_SUPPORTED = -1054735605;
pub const WDSTPC_E_NO_IP4_INTERFACE = -1054735604;
pub const WDSTPTC_E_WIM_APPLY_REQUIRES_REFERENCE_IMAGE = -1054735603;
pub const FACILITY_WDSTPTMGMT = 272;
pub const WDSTPTMGMT_CATEGORY = 1;
pub const WDSTPTMGMT_E_INVALID_PROPERTY = -1055915776;
pub const WDSTPTMGMT_E_INVALID_OPERATION = -1055915775;
pub const WDSTPTMGMT_E_INVALID_CLASS = -1055915774;
pub const WDSTPTMGMT_E_CONTENT_PROVIDER_ALREADY_REGISTERED = -1055915773;
pub const WDSTPTMGMT_E_CONTENT_PROVIDER_NOT_REGISTERED = -1055915772;
pub const WDSTPTMGMT_E_INVALID_CONTENT_PROVIDER_NAME = -1055915771;
pub const WDSTPTMGMT_E_TRANSPORT_SERVER_ROLE_NOT_CONFIGURED = -1055915770;
pub const WDSTPTMGMT_E_NAMESPACE_ALREADY_REGISTERED = -1055915769;
pub const WDSTPTMGMT_E_NAMESPACE_NOT_REGISTERED = -1055915768;
pub const WDSTPTMGMT_E_CANNOT_REINITIALIZE_OBJECT = -1055915767;
pub const WDSTPTMGMT_E_INVALID_NAMESPACE_NAME = -1055915766;
pub const WDSTPTMGMT_E_INVALID_NAMESPACE_DATA = -1055915765;
pub const WDSTPTMGMT_E_NAMESPACE_READ_ONLY = -1055915764;
pub const WDSTPTMGMT_E_INVALID_NAMESPACE_START_TIME = -1055915763;
pub const WDSTPTMGMT_E_INVALID_DIAGNOSTICS_COMPONENTS = -1055915762;
pub const WDSTPTMGMT_E_CANNOT_REFRESH_DIRTY_OBJECT = -1055915761;
pub const WDSTPTMGMT_E_INVALID_SERVICE_IP_ADDRESS_RANGE = -1055915760;
pub const WDSTPTMGMT_E_INVALID_SERVICE_PORT_RANGE = -1055915759;
pub const WDSTPTMGMT_E_INVALID_NAMESPACE_START_PARAMETERS = -1055915758;
pub const WDSTPTMGMT_E_TRANSPORT_SERVER_UNAVAILABLE = -1055915757;
pub const WDSTPTMGMT_E_NAMESPACE_NOT_ON_SERVER = -1055915756;
pub const WDSTPTMGMT_E_NAMESPACE_REMOVED_FROM_SERVER = -1055915755;
pub const WDSTPTMGMT_E_INVALID_IP_ADDRESS = -1055915754;
pub const WDSTPTMGMT_E_INVALID_IPV4_MULTICAST_ADDRESS = -1055915753;
pub const WDSTPTMGMT_E_INVALID_IPV6_MULTICAST_ADDRESS = -1055915752;
pub const WDSTPTMGMT_E_IPV6_NOT_SUPPORTED = -1055915751;
pub const WDSTPTMGMT_E_INVALID_IPV6_MULTICAST_ADDRESS_SOURCE = -1055915750;
pub const WDSTPTMGMT_E_INVALID_MULTISTREAM_STREAM_COUNT = -1055915749;
pub const WDSTPTMGMT_E_INVALID_AUTO_DISCONNECT_THRESHOLD = -1055915748;
pub const WDSTPTMGMT_E_MULTICAST_SESSION_POLICY_NOT_SUPPORTED = -1055915747;
pub const WDSTPTMGMT_E_INVALID_SLOW_CLIENT_HANDLING_TYPE = -1055915746;
pub const WDSTPTMGMT_E_NETWORK_PROFILES_NOT_SUPPORTED = -1055915745;
pub const WDSTPTMGMT_E_UDP_PORT_POLICY_NOT_SUPPORTED = -1055915744;
pub const WDSTPTMGMT_E_TFTP_MAX_BLOCKSIZE_NOT_SUPPORTED = -1055915743;
pub const WDSTPTMGMT_E_TFTP_VAR_WINDOW_NOT_SUPPORTED = -1055915742;
pub const WDSTPTMGMT_E_INVALID_TFTP_MAX_BLOCKSIZE = -1055915741;
pub const WdsCliFlagEnumFilterVersion = 1;
pub const WdsCliFlagEnumFilterFirmware = 2;
pub const WDS_LOG_TYPE_CLIENT_ERROR = 1;
pub const WDS_LOG_TYPE_CLIENT_STARTED = 2;
pub const WDS_LOG_TYPE_CLIENT_FINISHED = 3;
pub const WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED = 4;
pub const WDS_LOG_TYPE_CLIENT_APPLY_STARTED = 5;
pub const WDS_LOG_TYPE_CLIENT_APPLY_FINISHED = 6;
pub const WDS_LOG_TYPE_CLIENT_GENERIC_MESSAGE = 7;
pub const WDS_LOG_TYPE_CLIENT_UNATTEND_MODE = 8;
pub const WDS_LOG_TYPE_CLIENT_TRANSFER_START = 9;
pub const WDS_LOG_TYPE_CLIENT_TRANSFER_END = 10;
pub const WDS_LOG_TYPE_CLIENT_TRANSFER_DOWNGRADE = 11;
pub const WDS_LOG_TYPE_CLIENT_DOMAINJOINERROR = 12;
pub const WDS_LOG_TYPE_CLIENT_POST_ACTIONS_START = 13;
pub const WDS_LOG_TYPE_CLIENT_POST_ACTIONS_END = 14;
pub const WDS_LOG_TYPE_CLIENT_APPLY_STARTED_2 = 15;
pub const WDS_LOG_TYPE_CLIENT_APPLY_FINISHED_2 = 16;
pub const WDS_LOG_TYPE_CLIENT_DOMAINJOINERROR_2 = 17;
pub const WDS_LOG_TYPE_CLIENT_DRIVER_PACKAGE_NOT_ACCESSIBLE = 18;
pub const WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_START = 19;
pub const WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_END = 20;
pub const WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_FAILURE = 21;
pub const WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED2 = 22;
pub const WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED3 = 23;
pub const WDS_LOG_TYPE_CLIENT_MAX_CODE = 24;
pub const WDS_LOG_LEVEL_DISABLED = 0;
pub const WDS_LOG_LEVEL_ERROR = 1;
pub const WDS_LOG_LEVEL_WARNING = 2;
pub const WDS_LOG_LEVEL_INFO = 3;
pub const WDS_CLI_IMAGE_TYPE_UNKNOWN = 0;
pub const WDS_CLI_IMAGE_TYPE_WIM = 1;
pub const WDS_CLI_IMAGE_TYPE_VHD = 2;
pub const WDS_CLI_IMAGE_TYPE_VHDX = 3;
pub const WDS_CLI_FIRMWARE_UNKNOWN = 0;
pub const WDS_CLI_FIRMWARE_BIOS = 1;
pub const WDS_CLI_FIRMWARE_EFI = 2;
pub const WDS_CLI_IMAGE_PARAM_UNKNOWN = 0;
pub const WDS_CLI_IMAGE_PARAM_SPARSE_FILE = 1;
pub const WDS_CLI_IMAGE_PARAM_SUPPORTED_FIRMWARES = 2;
pub const WDS_TRANSPORTPROVIDER_CREATE_INSTANCE = 0;
pub const WDS_TRANSPORTPROVIDER_COMPARE_CONTENT = 1;
pub const WDS_TRANSPORTPROVIDER_OPEN_CONTENT = 2;
pub const WDS_TRANSPORTPROVIDER_USER_ACCESS_CHECK = 3;
pub const WDS_TRANSPORTPROVIDER_GET_CONTENT_SIZE = 4;
pub const WDS_TRANSPORTPROVIDER_READ_CONTENT = 5;
pub const WDS_TRANSPORTPROVIDER_CLOSE_CONTENT = 6;
pub const WDS_TRANSPORTPROVIDER_CLOSE_INSTANCE = 7;
pub const WDS_TRANSPORTPROVIDER_SHUTDOWN = 8;
pub const WDS_TRANSPORTPROVIDER_DUMP_STATE = 9;
pub const WDS_TRANSPORTPROVIDER_REFRESH_SETTINGS = 10;
pub const WDS_TRANSPORTPROVIDER_GET_CONTENT_METADATA = 11;
pub const WDS_TRANSPORTPROVIDER_MAX_CALLBACKS = 12;
pub const WDS_TRANSPORTCLIENT_SESSION_START = 0;
pub const WDS_TRANSPORTCLIENT_RECEIVE_CONTENTS = 1;
pub const WDS_TRANSPORTCLIENT_SESSION_COMPLETE = 2;
pub const WDS_TRANSPORTCLIENT_RECEIVE_METADATA = 3;
pub const WDS_TRANSPORTCLIENT_SESSION_STARTEX = 4;
pub const WDS_TRANSPORTCLIENT_SESSION_NEGOTIATE = 5;
pub const WDS_TRANSPORTCLIENT_MAX_CALLBACKS = 6;
pub const WdsTptFeatureAdminPack = 1;
pub const WdsTptFeatureTransportServer = 2;
pub const WdsTptFeatureDeploymentServer = 4;
pub const WdsTptProtocolUnicast = 1;
pub const WdsTptProtocolMulticast = 2;
pub const WdsTptNamespaceTypeUnknown = 0;
pub const WdsTptNamespaceTypeAutoCast = 1;
pub const WdsTptNamespaceTypeScheduledCastManualStart = 2;
pub const WdsTptNamespaceTypeScheduledCastAutoStart = 3;
pub const WdsTptDisconnectUnknown = 0;
pub const WdsTptDisconnectFallback = 1;
pub const WdsTptDisconnectAbort = 2;
pub const WdsTptServiceNotifyUnknown = 0;
pub const WdsTptServiceNotifyReadSettings = 1;
pub const WdsTptIpAddressUnknown = 0;
pub const WdsTptIpAddressIpv4 = 1;
pub const WdsTptIpAddressIpv6 = 2;
pub const WdsTptIpAddressSourceUnknown = 0;
pub const WdsTptIpAddressSourceDhcp = 1;
pub const WdsTptIpAddressSourceRange = 2;
pub const WdsTptNetworkProfileUnknown = 0;
pub const WdsTptNetworkProfileCustom = 1;
pub const WdsTptNetworkProfile10Mbps = 2;
pub const WdsTptNetworkProfile100Mbps = 3;
pub const WdsTptNetworkProfile1Gbps = 4;
pub const WdsTptDiagnosticsComponentPxe = 1;
pub const WdsTptDiagnosticsComponentTftp = 2;
pub const WdsTptDiagnosticsComponentImageServer = 4;
pub const WdsTptDiagnosticsComponentMulticast = 8;
pub const WdsTptSlowClientHandlingUnknown = 0;
pub const WdsTptSlowClientHandlingNone = 1;
pub const WdsTptSlowClientHandlingAutoDisconnect = 2;
pub const WdsTptSlowClientHandlingMultistream = 3;
pub const WdsTptUdpPortPolicyDynamic = 0;
pub const WdsTptUdpPortPolicyFixed = 1;
pub const WdsTptTftpCapMaximumBlockSize = 1;
pub const WdsTptTftpCapVariableWindow = 2;

pub const aliases = struct {
    pub const CPU_ARCHITECTURE = u32;
    pub const PFN_WDS_CLI_CALLBACK_MESSAGE_ID = u32;
    pub const WDS_TRANSPORTCLIENT_REQUEST_AUTH_LEVEL = u32;
    pub const WDS_CLI_IMAGE_TYPE = i32;
    pub const WDS_CLI_FIRMWARE_TYPE = i32;
    pub const WDS_CLI_IMAGE_PARAM_TYPE = i32;
    pub const TRANSPORTPROVIDER_CALLBACK_ID = i32;
    pub const TRANSPORTCLIENT_CALLBACK_ID = i32;
    pub const WDSTRANSPORT_FEATURE_FLAGS = i32;
    pub const WDSTRANSPORT_PROTOCOL_FLAGS = i32;
    pub const WDSTRANSPORT_NAMESPACE_TYPE = i32;
    pub const WDSTRANSPORT_DISCONNECT_TYPE = i32;
    pub const WDSTRANSPORT_SERVICE_NOTIFICATION = i32;
    pub const WDSTRANSPORT_IP_ADDRESS_TYPE = i32;
    pub const WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE = i32;
    pub const WDSTRANSPORT_NETWORK_PROFILE_TYPE = i32;
    pub const WDSTRANSPORT_DIAGNOSTICS_COMPONENT_FLAGS = i32;
    pub const WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE = i32;
    pub const WDSTRANSPORT_UDP_PORT_POLICY = i32;
    pub const WDSTRANSPORT_TFTP_CAPABILITY = i32;
    pub const PFN_WdsCliTraceFunction = ?*const anyopaque;
    pub const PFN_WdsCliCallback = ?*const anyopaque;
    pub const PFN_WdsTransportClientSessionStart = ?*const anyopaque;
    pub const PFN_WdsTransportClientSessionStartEx = ?*const anyopaque;
    pub const PFN_WdsTransportClientReceiveMetadata = ?*const anyopaque;
    pub const PFN_WdsTransportClientReceiveContents = ?*const anyopaque;
    pub const PFN_WdsTransportClientSessionComplete = ?*const anyopaque;
    pub const PFN_WdsTransportClientSessionNegotiate = ?*const anyopaque;
};
