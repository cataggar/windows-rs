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
    .{ "SnmpUtilOidCpy", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilOidCpy", .signature = "\x00\x02\x08\x0f\x11\xb9\x71\x0f\x11\xb9\x71" } },
    .{ "SnmpUtilOidAppend", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilOidAppend", .signature = "\x00\x02\x08\x0f\x11\xb9\x71\x0f\x11\xb9\x71" } },
    .{ "SnmpUtilOidNCmp", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilOidNCmp", .signature = "\x00\x03\x08\x0f\x11\xb9\x71\x0f\x11\xb9\x71\x09" } },
    .{ "SnmpUtilOidCmp", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilOidCmp", .signature = "\x00\x02\x08\x0f\x11\xb9\x71\x0f\x11\xb9\x71" } },
    .{ "SnmpUtilOidFree", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilOidFree", .signature = "\x00\x01\x01\x0f\x11\xb9\x71" } },
    .{ "SnmpUtilOctetsCmp", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilOctetsCmp", .signature = "\x00\x02\x08\x0f\x11\xb9\x75\x0f\x11\xb9\x75" } },
    .{ "SnmpUtilOctetsNCmp", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilOctetsNCmp", .signature = "\x00\x03\x08\x0f\x11\xb9\x75\x0f\x11\xb9\x75\x09" } },
    .{ "SnmpUtilOctetsCpy", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilOctetsCpy", .signature = "\x00\x02\x08\x0f\x11\xb9\x75\x0f\x11\xb9\x75" } },
    .{ "SnmpUtilOctetsFree", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilOctetsFree", .signature = "\x00\x01\x01\x0f\x11\xb9\x75" } },
    .{ "SnmpUtilAsnAnyCpy", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilAsnAnyCpy", .signature = "\x00\x02\x08\x0f\x11\xb9\x79\x0f\x11\xb9\x79" } },
    .{ "SnmpUtilAsnAnyFree", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilAsnAnyFree", .signature = "\x00\x01\x01\x0f\x11\xb9\x79" } },
    .{ "SnmpUtilVarBindCpy", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilVarBindCpy", .signature = "\x00\x02\x08\x0f\x11\xb9\x7d\x0f\x11\xb9\x7d" } },
    .{ "SnmpUtilVarBindFree", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilVarBindFree", .signature = "\x00\x01\x01\x0f\x11\xb9\x7d" } },
    .{ "SnmpUtilVarBindListCpy", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilVarBindListCpy", .signature = "\x00\x02\x08\x0f\x11\xb9\x81\x0f\x11\xb9\x81" } },
    .{ "SnmpUtilVarBindListFree", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilVarBindListFree", .signature = "\x00\x01\x01\x0f\x11\xb9\x81" } },
    .{ "SnmpUtilMemFree", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilMemFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "SnmpUtilMemAlloc", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilMemAlloc", .signature = "\x00\x01\x0f\x01\x09" } },
    .{ "SnmpUtilMemReAlloc", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilMemReAlloc", .signature = "\x00\x02\x0f\x01\x0f\x01\x09" } },
    .{ "SnmpUtilOidToA", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilOidToA", .signature = "\x00\x01\x11\x3d\x0f\x11\xb9\x71" } },
    .{ "SnmpUtilIdsToA", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilIdsToA", .signature = "\x00\x02\x11\x3d\x0f\x09\x09" } },
    .{ "SnmpUtilPrintOid", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilPrintOid", .signature = "\x00\x01\x01\x0f\x11\xb9\x71" } },
    .{ "SnmpUtilPrintAsnAny", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilPrintAsnAny", .signature = "\x00\x01\x01\x0f\x11\xb9\x79" } },
    .{ "SnmpSvcGetUptime", MethodRecord{ .library = "snmpapi", .import = "SnmpSvcGetUptime", .signature = "\x00\x00\x09" } },
    .{ "SnmpSvcSetLogLevel", MethodRecord{ .library = "snmpapi", .import = "SnmpSvcSetLogLevel", .signature = "\x00\x01\x01\x11\x98\x91" } },
    .{ "SnmpSvcSetLogType", MethodRecord{ .library = "snmpapi", .import = "SnmpSvcSetLogType", .signature = "\x00\x01\x01\x08" } },
    .{ "SnmpUtilDbgPrint", MethodRecord{ .library = "snmpapi", .import = "SnmpUtilDbgPrint", .signature = "\x05\x02\x01\x11\x98\x91\x11\x3d" } },
    .{ "SnmpMgrOpen", MethodRecord{ .library = "mgmtapi", .import = "SnmpMgrOpen", .signature = "\x00\x04\x0f\x01\x11\x3d\x11\x3d\x08\x08" } },
    .{ "SnmpMgrCtl", MethodRecord{ .library = "mgmtapi", .import = "SnmpMgrCtl", .signature = "\x00\x07\x11\x59\x0f\x01\x09\x0f\x01\x09\x0f\x01\x09\x0f\x09" } },
    .{ "SnmpMgrClose", MethodRecord{ .library = "mgmtapi", .import = "SnmpMgrClose", .signature = "\x00\x01\x11\x59\x0f\x01" } },
    .{ "SnmpMgrRequest", MethodRecord{ .library = "mgmtapi", .import = "SnmpMgrRequest", .signature = "\x00\x05\x08\x0f\x01\x05\x0f\x11\xb9\x81\x0f\x11\x98\x85\x0f\x08" } },
    .{ "SnmpMgrStrToOid", MethodRecord{ .library = "mgmtapi", .import = "SnmpMgrStrToOid", .signature = "\x00\x02\x11\x59\x11\x3d\x0f\x11\xb9\x71" } },
    .{ "SnmpMgrOidToStr", MethodRecord{ .library = "mgmtapi", .import = "SnmpMgrOidToStr", .signature = "\x00\x02\x11\x59\x0f\x11\xb9\x71\x0f\x11\x3d" } },
    .{ "SnmpMgrTrapListen", MethodRecord{ .library = "mgmtapi", .import = "SnmpMgrTrapListen", .signature = "\x00\x01\x11\x59\x0f\x11\x80\x85" } },
    .{ "SnmpMgrGetTrap", MethodRecord{ .library = "mgmtapi", .import = "SnmpMgrGetTrap", .signature = "\x00\x06\x11\x59\x0f\x11\xb9\x71\x0f\x11\xb9\x75\x0f\x11\x98\x81\x0f\x08\x0f\x09\x0f\x11\xb9\x81" } },
    .{ "SnmpMgrGetTrapEx", MethodRecord{ .library = "mgmtapi", .import = "SnmpMgrGetTrapEx", .signature = "\x00\x08\x11\x59\x0f\x11\xb9\x71\x0f\x11\xb9\x75\x0f\x11\xb9\x75\x0f\x11\x98\x81\x0f\x08\x0f\x11\xb9\x75\x0f\x09\x0f\x11\xb9\x81" } },
    .{ "SnmpGetTranslateMode", MethodRecord{ .library = "wsnmp32", .import = "SnmpGetTranslateMode", .signature = "\x00\x01\x09\x0f\x11\x98\x7d" } },
    .{ "SnmpSetTranslateMode", MethodRecord{ .library = "wsnmp32", .import = "SnmpSetTranslateMode", .signature = "\x00\x01\x09\x11\x98\x7d" } },
    .{ "SnmpGetRetransmitMode", MethodRecord{ .library = "wsnmp32", .import = "SnmpGetRetransmitMode", .signature = "\x00\x01\x09\x0f\x11\x98\x89" } },
    .{ "SnmpSetRetransmitMode", MethodRecord{ .library = "wsnmp32", .import = "SnmpSetRetransmitMode", .signature = "\x00\x01\x09\x11\x98\x89" } },
    .{ "SnmpGetTimeout", MethodRecord{ .library = "wsnmp32", .import = "SnmpGetTimeout", .signature = "\x00\x03\x09\x18\x0f\x09\x0f\x09" } },
    .{ "SnmpSetTimeout", MethodRecord{ .library = "wsnmp32", .import = "SnmpSetTimeout", .signature = "\x00\x02\x09\x18\x09" } },
    .{ "SnmpGetRetry", MethodRecord{ .library = "wsnmp32", .import = "SnmpGetRetry", .signature = "\x00\x03\x09\x18\x0f\x09\x0f\x09" } },
    .{ "SnmpSetRetry", MethodRecord{ .library = "wsnmp32", .import = "SnmpSetRetry", .signature = "\x00\x02\x09\x18\x09" } },
    .{ "SnmpGetVendorInfo", MethodRecord{ .library = "wsnmp32", .import = "SnmpGetVendorInfo", .signature = "\x00\x01\x09\x0f\x11\xb9\x85" } },
    .{ "SnmpStartup", MethodRecord{ .library = "wsnmp32", .import = "SnmpStartup", .signature = "\x00\x05\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x11\x98\x7d\x0f\x11\x98\x89" } },
    .{ "SnmpCleanup", MethodRecord{ .library = "wsnmp32", .import = "SnmpCleanup", .signature = "\x00\x00\x09" } },
    .{ "SnmpOpen", MethodRecord{ .library = "wsnmp32", .import = "SnmpOpen", .signature = "\x00\x02\x18\x11\x25\x09" } },
    .{ "SnmpClose", MethodRecord{ .library = "wsnmp32", .import = "SnmpClose", .signature = "\x00\x01\x09\x18" } },
    .{ "SnmpSendMsg", MethodRecord{ .library = "wsnmp32", .import = "SnmpSendMsg", .signature = "\x00\x05\x09\x18\x18\x18\x18\x18" } },
    .{ "SnmpRecvMsg", MethodRecord{ .library = "wsnmp32", .import = "SnmpRecvMsg", .signature = "\x00\x05\x09\x18\x0f\x18\x0f\x18\x0f\x18\x0f\x18" } },
    .{ "SnmpRegister", MethodRecord{ .library = "wsnmp32", .import = "SnmpRegister", .signature = "\x00\x06\x09\x18\x18\x18\x18\x0f\x11\xb9\x89\x11\x98\x89" } },
    .{ "SnmpCreateSession", MethodRecord{ .library = "wsnmp32", .import = "SnmpCreateSession", .signature = "\x00\x04\x18\x11\x25\x09\x12\xb9\x8d\x0f\x01" } },
    .{ "SnmpListen", MethodRecord{ .library = "wsnmp32", .import = "SnmpListen", .signature = "\x00\x02\x09\x18\x11\x98\x89" } },
    .{ "SnmpListenEx", MethodRecord{ .library = "wsnmp32", .import = "SnmpListenEx", .signature = "\x00\x03\x09\x18\x09\x09" } },
    .{ "SnmpCancelMsg", MethodRecord{ .library = "wsnmp32", .import = "SnmpCancelMsg", .signature = "\x00\x02\x09\x18\x08" } },
    .{ "SnmpStartupEx", MethodRecord{ .library = "wsnmp32", .import = "SnmpStartupEx", .signature = "\x00\x05\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x11\x98\x7d\x0f\x11\x98\x89" } },
    .{ "SnmpCleanupEx", MethodRecord{ .library = "wsnmp32", .import = "SnmpCleanupEx", .signature = "\x00\x00\x09" } },
    .{ "SnmpStrToEntity", MethodRecord{ .library = "wsnmp32", .import = "SnmpStrToEntity", .signature = "\x00\x02\x18\x18\x11\x3d" } },
    .{ "SnmpEntityToStr", MethodRecord{ .library = "wsnmp32", .import = "SnmpEntityToStr", .signature = "\x00\x03\x09\x18\x09\x11\x3d" } },
    .{ "SnmpFreeEntity", MethodRecord{ .library = "wsnmp32", .import = "SnmpFreeEntity", .signature = "\x00\x01\x09\x18" } },
    .{ "SnmpStrToContext", MethodRecord{ .library = "wsnmp32", .import = "SnmpStrToContext", .signature = "\x00\x02\x18\x18\x0f\x11\xb9\x91" } },
    .{ "SnmpContextToStr", MethodRecord{ .library = "wsnmp32", .import = "SnmpContextToStr", .signature = "\x00\x02\x09\x18\x0f\x11\xb9\x91" } },
    .{ "SnmpFreeContext", MethodRecord{ .library = "wsnmp32", .import = "SnmpFreeContext", .signature = "\x00\x01\x09\x18" } },
    .{ "SnmpSetPort", MethodRecord{ .library = "wsnmp32", .import = "SnmpSetPort", .signature = "\x00\x02\x09\x18\x09" } },
    .{ "SnmpCreatePdu", MethodRecord{ .library = "wsnmp32", .import = "SnmpCreatePdu", .signature = "\x00\x06\x18\x18\x11\x98\x75\x08\x08\x08\x18" } },
    .{ "SnmpGetPduData", MethodRecord{ .library = "wsnmp32", .import = "SnmpGetPduData", .signature = "\x00\x06\x09\x18\x0f\x11\x98\x75\x0f\x08\x0f\x11\x98\x95\x0f\x08\x0f\x18" } },
    .{ "SnmpSetPduData", MethodRecord{ .library = "wsnmp32", .import = "SnmpSetPduData", .signature = "\x00\x06\x09\x18\x0f\x08\x0f\x08\x0f\x08\x0f\x08\x0f\x18" } },
    .{ "SnmpDuplicatePdu", MethodRecord{ .library = "wsnmp32", .import = "SnmpDuplicatePdu", .signature = "\x00\x02\x18\x18\x18" } },
    .{ "SnmpFreePdu", MethodRecord{ .library = "wsnmp32", .import = "SnmpFreePdu", .signature = "\x00\x01\x09\x18" } },
    .{ "SnmpCreateVbl", MethodRecord{ .library = "wsnmp32", .import = "SnmpCreateVbl", .signature = "\x00\x03\x18\x18\x0f\x11\xb9\x89\x0f\x11\xb9\x95" } },
    .{ "SnmpDuplicateVbl", MethodRecord{ .library = "wsnmp32", .import = "SnmpDuplicateVbl", .signature = "\x00\x02\x18\x18\x18" } },
    .{ "SnmpFreeVbl", MethodRecord{ .library = "wsnmp32", .import = "SnmpFreeVbl", .signature = "\x00\x01\x09\x18" } },
    .{ "SnmpCountVbl", MethodRecord{ .library = "wsnmp32", .import = "SnmpCountVbl", .signature = "\x00\x01\x09\x18" } },
    .{ "SnmpGetVb", MethodRecord{ .library = "wsnmp32", .import = "SnmpGetVb", .signature = "\x00\x04\x09\x18\x09\x0f\x11\xb9\x89\x0f\x11\xb9\x95" } },
    .{ "SnmpSetVb", MethodRecord{ .library = "wsnmp32", .import = "SnmpSetVb", .signature = "\x00\x04\x09\x18\x09\x0f\x11\xb9\x89\x0f\x11\xb9\x95" } },
    .{ "SnmpDeleteVb", MethodRecord{ .library = "wsnmp32", .import = "SnmpDeleteVb", .signature = "\x00\x02\x09\x18\x09" } },
    .{ "SnmpGetLastError", MethodRecord{ .library = "wsnmp32", .import = "SnmpGetLastError", .signature = "\x00\x01\x09\x18" } },
    .{ "SnmpStrToOid", MethodRecord{ .library = "wsnmp32", .import = "SnmpStrToOid", .signature = "\x00\x02\x09\x11\x3d\x0f\x11\xb9\x89" } },
    .{ "SnmpOidToStr", MethodRecord{ .library = "wsnmp32", .import = "SnmpOidToStr", .signature = "\x00\x03\x09\x0f\x11\xb9\x89\x09\x11\x3d" } },
    .{ "SnmpOidCopy", MethodRecord{ .library = "wsnmp32", .import = "SnmpOidCopy", .signature = "\x00\x02\x09\x0f\x11\xb9\x89\x0f\x11\xb9\x89" } },
    .{ "SnmpOidCompare", MethodRecord{ .library = "wsnmp32", .import = "SnmpOidCompare", .signature = "\x00\x04\x09\x0f\x11\xb9\x89\x0f\x11\xb9\x89\x09\x0f\x08" } },
    .{ "SnmpEncodeMsg", MethodRecord{ .library = "wsnmp32", .import = "SnmpEncodeMsg", .signature = "\x00\x06\x09\x18\x18\x18\x18\x18\x0f\x11\xb9\x91" } },
    .{ "SnmpDecodeMsg", MethodRecord{ .library = "wsnmp32", .import = "SnmpDecodeMsg", .signature = "\x00\x06\x09\x18\x0f\x18\x0f\x18\x0f\x18\x0f\x18\x0f\x11\xb9\x91" } },
    .{ "SnmpFreeDescriptor", MethodRecord{ .library = "wsnmp32", .import = "SnmpFreeDescriptor", .signature = "\x00\x02\x09\x09\x0f\x11\xb9\x91" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x1875 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "SNMP_PDU_TYPE" },
        0x187d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "SNMP_API_TRANSLATE_MODE" },
        0x1881 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "SNMP_GENERICTRAP" },
        0x1885 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "SNMP_ERROR_STATUS" },
        0x1889 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "SNMP_STATUS" },
        0x1891 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "SNMP_LOG" },
        0x1895 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "SNMP_ERROR" },
        0x3971 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "AsnObjectIdentifier" },
        0x3975 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "AsnOctetString" },
        0x3979 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "AsnAny" },
        0x397d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "SnmpVarBind" },
        0x3981 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "SnmpVarBindList" },
        0x3985 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "smiVENDORINFO" },
        0x3989 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "smiOID" },
        0x398d => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "SNMPAPI_CALLBACK" },
        0x3991 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "smiOCTETS" },
        0x3995 => TypeRefEntry{ .namespace = "Windows.Win32.NetworkManagement.Snmp", .name = "smiVALUE" },
        else => null,
    };
}

pub const SNMP_PDU_GET = 160;
pub const SNMP_PDU_GETNEXT = 161;
pub const SNMP_PDU_RESPONSE = 162;
pub const SNMP_PDU_SET = 163;
pub const SNMP_PDU_GETBULK = 165;
pub const SNMP_PDU_TRAP = 167;
pub const SNMP_EXTENSION_GET = 160;
pub const SNMP_EXTENSION_GET_NEXT = 161;
pub const SNMP_EXTENSION_SET_TEST = 224;
pub const SNMP_EXTENSION_SET_COMMIT = 163;
pub const SNMP_EXTENSION_SET_UNDO = 225;
pub const SNMP_EXTENSION_SET_CLEANUP = 226;
pub const SNMPAPI_TRANSLATED = 0;
pub const SNMPAPI_UNTRANSLATED_V1 = 1;
pub const SNMPAPI_UNTRANSLATED_V2 = 2;
pub const SNMP_GENERICTRAP_COLDSTART = 0;
pub const SNMP_GENERICTRAP_WARMSTART = 1;
pub const SNMP_GENERICTRAP_LINKDOWN = 2;
pub const SNMP_GENERICTRAP_LINKUP = 3;
pub const SNMP_GENERICTRAP_AUTHFAILURE = 4;
pub const SNMP_GENERICTRAP_EGPNEIGHLOSS = 5;
pub const SNMP_GENERICTRAP_ENTERSPECIFIC = 6;
pub const SNMP_ERRORSTATUS_NOERROR = 0;
pub const SNMP_ERRORSTATUS_TOOBIG = 1;
pub const SNMP_ERRORSTATUS_NOSUCHNAME = 2;
pub const SNMP_ERRORSTATUS_BADVALUE = 3;
pub const SNMP_ERRORSTATUS_READONLY = 4;
pub const SNMP_ERRORSTATUS_GENERR = 5;
pub const SNMP_ERRORSTATUS_NOACCESS = 6;
pub const SNMP_ERRORSTATUS_WRONGTYPE = 7;
pub const SNMP_ERRORSTATUS_WRONGLENGTH = 8;
pub const SNMP_ERRORSTATUS_WRONGENCODING = 9;
pub const SNMP_ERRORSTATUS_WRONGVALUE = 10;
pub const SNMP_ERRORSTATUS_NOCREATION = 11;
pub const SNMP_ERRORSTATUS_INCONSISTENTVALUE = 12;
pub const SNMP_ERRORSTATUS_RESOURCEUNAVAILABLE = 13;
pub const SNMP_ERRORSTATUS_COMMITFAILED = 14;
pub const SNMP_ERRORSTATUS_UNDOFAILED = 15;
pub const SNMP_ERRORSTATUS_AUTHORIZATIONERROR = 16;
pub const SNMP_ERRORSTATUS_NOTWRITABLE = 17;
pub const SNMP_ERRORSTATUS_INCONSISTENTNAME = 18;
pub const SNMPAPI_ON = 1;
pub const SNMPAPI_OFF = 0;
pub const SNMP_OUTPUT_TO_CONSOLE = 1;
pub const SNMP_OUTPUT_TO_LOGFILE = 2;
pub const SNMP_OUTPUT_TO_DEBUGGER = 8;
pub const SNMP_LOG_SILENT = 0;
pub const SNMP_LOG_FATAL = 1;
pub const SNMP_LOG_ERROR = 2;
pub const SNMP_LOG_WARNING = 3;
pub const SNMP_LOG_TRACE = 4;
pub const SNMP_LOG_VERBOSE = 5;
pub const SNMP_ERROR_NOERROR = 0;
pub const SNMP_ERROR_TOOBIG = 1;
pub const SNMP_ERROR_NOSUCHNAME = 2;
pub const SNMP_ERROR_BADVALUE = 3;
pub const SNMP_ERROR_READONLY = 4;
pub const SNMP_ERROR_GENERR = 5;
pub const SNMP_ERROR_NOACCESS = 6;
pub const SNMP_ERROR_WRONGTYPE = 7;
pub const SNMP_ERROR_WRONGLENGTH = 8;
pub const SNMP_ERROR_WRONGENCODING = 9;
pub const SNMP_ERROR_WRONGVALUE = 10;
pub const SNMP_ERROR_NOCREATION = 11;
pub const SNMP_ERROR_INCONSISTENTVALUE = 12;
pub const SNMP_ERROR_RESOURCEUNAVAILABLE = 13;
pub const SNMP_ERROR_COMMITFAILED = 14;
pub const SNMP_ERROR_UNDOFAILED = 15;
pub const SNMP_ERROR_AUTHORIZATIONERROR = 16;
pub const SNMP_ERROR_NOTWRITABLE = 17;
pub const SNMP_ERROR_INCONSISTENTNAME = 18;
pub const ASN_UNIVERSAL = 0;
pub const ASN_APPLICATION = 64;
pub const ASN_CONTEXT = 128;
pub const ASN_PRIVATE = 192;
pub const ASN_PRIMITIVE = 0;
pub const ASN_CONSTRUCTOR = 32;
pub const SNMP_ACCESS_NONE = 0;
pub const SNMP_ACCESS_NOTIFY = 1;
pub const SNMP_ACCESS_READ_ONLY = 2;
pub const SNMP_ACCESS_READ_WRITE = 3;
pub const SNMP_ACCESS_READ_CREATE = 4;
pub const SNMPAPI_NOERROR = 1;
pub const SNMPAPI_ERROR = 0;
pub const SNMP_OUTPUT_TO_EVENTLOG = 4;
pub const DEFAULT_SNMP_PORT_UDP = 161;
pub const DEFAULT_SNMP_PORT_IPX = 36879;
pub const DEFAULT_SNMPTRAP_PORT_UDP = 162;
pub const DEFAULT_SNMPTRAP_PORT_IPX = 36880;
pub const SNMP_MAX_OID_LEN = 128;
pub const SNMP_MEM_ALLOC_ERROR = 1;
pub const SNMP_BERAPI_INVALID_LENGTH = 10;
pub const SNMP_BERAPI_INVALID_TAG = 11;
pub const SNMP_BERAPI_OVERFLOW = 12;
pub const SNMP_BERAPI_SHORT_BUFFER = 13;
pub const SNMP_BERAPI_INVALID_OBJELEM = 14;
pub const SNMP_PDUAPI_UNRECOGNIZED_PDU = 20;
pub const SNMP_PDUAPI_INVALID_ES = 21;
pub const SNMP_PDUAPI_INVALID_GT = 22;
pub const SNMP_AUTHAPI_INVALID_VERSION = 30;
pub const SNMP_AUTHAPI_INVALID_MSG_TYPE = 31;
pub const SNMP_AUTHAPI_TRIV_AUTH_FAILED = 32;
pub const ASN_CONTEXTSPECIFIC = 128;
pub const ASN_PRIMATIVE = 0;
pub const SNMP_MGMTAPI_TIMEOUT = 40;
pub const SNMP_MGMTAPI_SELECT_FDERRORS = 41;
pub const SNMP_MGMTAPI_TRAP_ERRORS = 42;
pub const SNMP_MGMTAPI_TRAP_DUPINIT = 43;
pub const SNMP_MGMTAPI_NOTRAPS = 44;
pub const SNMP_MGMTAPI_AGAIN = 45;
pub const SNMP_MGMTAPI_INVALID_CTL = 46;
pub const SNMP_MGMTAPI_INVALID_SESSION = 47;
pub const SNMP_MGMTAPI_INVALID_BUFFER = 48;
pub const MGMCTL_SETAGENTPORT = 1;
pub const MAXOBJIDSIZE = 128;
pub const MAXOBJIDSTRSIZE = 1408;
pub const SNMPLISTEN_USEENTITY_ADDR = 0;
pub const SNMPLISTEN_ALL_ADDR = 1;
pub const SNMP_TRAP_COLDSTART = 0;
pub const SNMP_TRAP_WARMSTART = 1;
pub const SNMP_TRAP_LINKDOWN = 2;
pub const SNMP_TRAP_LINKUP = 3;
pub const SNMP_TRAP_AUTHFAIL = 4;
pub const SNMP_TRAP_EGPNEIGHBORLOSS = 5;
pub const SNMP_TRAP_ENTERPRISESPECIFIC = 6;
pub const SNMPAPI_NO_SUPPORT = 0;
pub const SNMPAPI_V1_SUPPORT = 1;
pub const SNMPAPI_V2_SUPPORT = 2;
pub const SNMPAPI_M2M_SUPPORT = 3;
pub const SNMPAPI_FAILURE = 0;
pub const SNMPAPI_SUCCESS = 1;
pub const SNMPAPI_ALLOC_ERROR = 2;
pub const SNMPAPI_CONTEXT_INVALID = 3;
pub const SNMPAPI_CONTEXT_UNKNOWN = 4;
pub const SNMPAPI_ENTITY_INVALID = 5;
pub const SNMPAPI_ENTITY_UNKNOWN = 6;
pub const SNMPAPI_INDEX_INVALID = 7;
pub const SNMPAPI_NOOP = 8;
pub const SNMPAPI_OID_INVALID = 9;
pub const SNMPAPI_OPERATION_INVALID = 10;
pub const SNMPAPI_OUTPUT_TRUNCATED = 11;
pub const SNMPAPI_PDU_INVALID = 12;
pub const SNMPAPI_SESSION_INVALID = 13;
pub const SNMPAPI_SYNTAX_INVALID = 14;
pub const SNMPAPI_VBL_INVALID = 15;
pub const SNMPAPI_MODE_INVALID = 16;
pub const SNMPAPI_SIZE_INVALID = 17;
pub const SNMPAPI_NOT_INITIALIZED = 18;
pub const SNMPAPI_MESSAGE_INVALID = 19;
pub const SNMPAPI_HWND_INVALID = 20;
pub const SNMPAPI_OTHER_ERROR = 99;
pub const SNMPAPI_TL_NOT_INITIALIZED = 100;
pub const SNMPAPI_TL_NOT_SUPPORTED = 101;
pub const SNMPAPI_TL_NOT_AVAILABLE = 102;
pub const SNMPAPI_TL_RESOURCE_ERROR = 103;
pub const SNMPAPI_TL_UNDELIVERABLE = 104;
pub const SNMPAPI_TL_SRC_INVALID = 105;
pub const SNMPAPI_TL_INVALID_PARAM = 106;
pub const SNMPAPI_TL_IN_USE = 107;
pub const SNMPAPI_TL_TIMEOUT = 108;
pub const SNMPAPI_TL_PDU_TOO_BIG = 109;
pub const SNMPAPI_TL_OTHER = 199;
pub const MAXVENDORINFO = 32;

pub const aliases = struct {
    pub const SNMP_PDU_TYPE = u32;
    pub const SNMP_EXTENSION_REQUEST_TYPE = u32;
    pub const SNMP_API_TRANSLATE_MODE = u32;
    pub const SNMP_GENERICTRAP = u32;
    pub const SNMP_ERROR_STATUS = u32;
    pub const SNMP_STATUS = u32;
    pub const SNMP_OUTPUT_LOG_TYPE = u32;
    pub const SNMP_LOG = i32;
    pub const SNMP_ERROR = u32;
};
