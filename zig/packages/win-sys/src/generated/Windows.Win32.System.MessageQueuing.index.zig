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
    .{ "MQCreateQueue", MethodRecord{ .library = "mqrt", .import = "MQCreateQueue", .signature = "\x00\x04\x11\x79\x11\x82\xad\x0f\x11\xc0\x00\x43\x15\x11\x05\x0f\x09" } },
    .{ "MQDeleteQueue", MethodRecord{ .library = "mqrt", .import = "MQDeleteQueue", .signature = "\x00\x01\x11\x79\x11\x05" } },
    .{ "MQLocateBegin", MethodRecord{ .library = "mqrt", .import = "MQLocateBegin", .signature = "\x00\x05\x11\x79\x11\x05\x0f\x11\xc0\x00\x43\x19\x0f\x11\xc0\x00\x43\x1d\x0f\x11\xc0\x00\x43\x21\x0f\x11\x80\x85" } },
    .{ "MQLocateNext", MethodRecord{ .library = "mqrt", .import = "MQLocateNext", .signature = "\x00\x03\x11\x79\x11\x80\x85\x0f\x09\x0f\x11\x82\x01" } },
    .{ "MQLocateEnd", MethodRecord{ .library = "mqrt", .import = "MQLocateEnd", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "MQOpenQueue", MethodRecord{ .library = "mqrt", .import = "MQOpenQueue", .signature = "\x00\x04\x11\x79\x11\x05\x09\x09\x0f\x18" } },
    .{ "MQSendMessage", MethodRecord{ .library = "mqrt", .import = "MQSendMessage", .signature = "\x00\x03\x11\x79\x18\x0f\x11\xc0\x00\x43\x25\x12\xc0\x00\x43\x29" } },
    .{ "MQReceiveMessage", MethodRecord{ .library = "mqrt", .import = "MQReceiveMessage", .signature = "\x00\x08\x11\x79\x18\x09\x09\x0f\x11\xc0\x00\x43\x25\x0f\x11\x8b\xed\x12\xc0\x00\x43\x2d\x11\x80\x85\x12\xc0\x00\x43\x29" } },
    .{ "MQReceiveMessageByLookupId", MethodRecord{ .library = "mqrt", .import = "MQReceiveMessageByLookupId", .signature = "\x00\x07\x11\x79\x18\x0b\x09\x0f\x11\xc0\x00\x43\x25\x0f\x11\x8b\xed\x12\xc0\x00\x43\x2d\x12\xc0\x00\x43\x29" } },
    .{ "MQCreateCursor", MethodRecord{ .library = "mqrt", .import = "MQCreateCursor", .signature = "\x00\x02\x11\x79\x18\x0f\x11\x80\x85" } },
    .{ "MQCloseCursor", MethodRecord{ .library = "mqrt", .import = "MQCloseCursor", .signature = "\x00\x01\x11\x79\x11\x80\x85" } },
    .{ "MQCloseQueue", MethodRecord{ .library = "mqrt", .import = "MQCloseQueue", .signature = "\x00\x01\x11\x79\x18" } },
    .{ "MQSetQueueProperties", MethodRecord{ .library = "mqrt", .import = "MQSetQueueProperties", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\xc0\x00\x43\x15" } },
    .{ "MQGetQueueProperties", MethodRecord{ .library = "mqrt", .import = "MQGetQueueProperties", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\xc0\x00\x43\x15" } },
    .{ "MQGetQueueSecurity", MethodRecord{ .library = "mqrt", .import = "MQGetQueueSecurity", .signature = "\x00\x05\x11\x79\x11\x05\x09\x11\x82\xad\x09\x0f\x09" } },
    .{ "MQSetQueueSecurity", MethodRecord{ .library = "mqrt", .import = "MQSetQueueSecurity", .signature = "\x00\x03\x11\x79\x11\x05\x11\x84\xf9\x11\x82\xad" } },
    .{ "MQPathNameToFormatName", MethodRecord{ .library = "mqrt", .import = "MQPathNameToFormatName", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x0f\x09" } },
    .{ "MQHandleToFormatName", MethodRecord{ .library = "mqrt", .import = "MQHandleToFormatName", .signature = "\x00\x03\x11\x79\x18\x11\x05\x0f\x09" } },
    .{ "MQInstanceToFormatName", MethodRecord{ .library = "mqrt", .import = "MQInstanceToFormatName", .signature = "\x00\x03\x11\x79\x0f\x11\x0d\x11\x05\x0f\x09" } },
    .{ "MQADsPathToFormatName", MethodRecord{ .library = "mqrt", .import = "MQADsPathToFormatName", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x0f\x09" } },
    .{ "MQFreeMemory", MethodRecord{ .library = "mqrt", .import = "MQFreeMemory", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "MQGetMachineProperties", MethodRecord{ .library = "mqrt", .import = "MQGetMachineProperties", .signature = "\x00\x03\x11\x79\x11\x05\x0f\x11\x0d\x0f\x11\xc0\x00\x43\x31" } },
    .{ "MQGetSecurityContext", MethodRecord{ .library = "mqrt", .import = "MQGetSecurityContext", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\x80\x85" } },
    .{ "MQGetSecurityContextEx", MethodRecord{ .library = "mqrt", .import = "MQGetSecurityContextEx", .signature = "\x00\x03\x11\x79\x0f\x01\x09\x0f\x11\x80\x85" } },
    .{ "MQFreeSecurityContext", MethodRecord{ .library = "mqrt", .import = "MQFreeSecurityContext", .signature = "\x00\x01\x01\x11\x80\x85" } },
    .{ "MQRegisterCertificate", MethodRecord{ .library = "mqrt", .import = "MQRegisterCertificate", .signature = "\x00\x03\x11\x79\x09\x0f\x01\x09" } },
    .{ "MQBeginTransaction", MethodRecord{ .library = "mqrt", .import = "MQBeginTransaction", .signature = "\x00\x01\x11\x79\x0f\x12\xc0\x00\x43\x29" } },
    .{ "MQGetOverlappedResult", MethodRecord{ .library = "mqrt", .import = "MQGetOverlappedResult", .signature = "\x00\x01\x11\x79\x0f\x11\x8b\xed" } },
    .{ "MQGetPrivateComputerInformation", MethodRecord{ .library = "mqrt", .import = "MQGetPrivateComputerInformation", .signature = "\x00\x02\x11\x79\x11\x05\x0f\x11\xc0\x00\x43\x35" } },
    .{ "MQPurgeQueue", MethodRecord{ .library = "mqrt", .import = "MQPurgeQueue", .signature = "\x00\x01\x11\x79\x18" } },
    .{ "MQMgmtGetInfo", MethodRecord{ .library = "mqrt", .import = "MQMgmtGetInfo", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x0f\x11\xc0\x00\x43\x39" } },
    .{ "MQMgmtAction", MethodRecord{ .library = "mqrt", .import = "MQMgmtAction", .signature = "\x00\x03\x11\x79\x11\x05\x11\x05\x11\x05" } },
    .{ "MQMarkMessageRejected", MethodRecord{ .library = "mqrt", .import = "MQMarkMessageRejected", .signature = "\x00\x02\x11\x79\x11\x80\x85\x0b" } },
    .{ "MQMoveMessage", MethodRecord{ .library = "mqrt", .import = "MQMoveMessage", .signature = "\x00\x04\x11\x79\x18\x18\x0b\x12\xc0\x00\x43\x29" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x201 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com.StructuredStorage", .name = "PROPVARIANT" },
        0x2ad => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "PSECURITY_DESCRIPTOR" },
        0x4f9 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "OBJECT_SECURITY_INFORMATION" },
        0xbed => TypeRefEntry{ .namespace = "Windows.Win32.System.IO", .name = "OVERLAPPED" },
        0x4315 => TypeRefEntry{ .namespace = "Windows.Win32.System.MessageQueuing", .name = "MQQUEUEPROPS" },
        0x4319 => TypeRefEntry{ .namespace = "Windows.Win32.System.MessageQueuing", .name = "MQRESTRICTION" },
        0x431d => TypeRefEntry{ .namespace = "Windows.Win32.System.MessageQueuing", .name = "MQCOLUMNSET" },
        0x4321 => TypeRefEntry{ .namespace = "Windows.Win32.System.MessageQueuing", .name = "MQSORTSET" },
        0x4325 => TypeRefEntry{ .namespace = "Windows.Win32.System.MessageQueuing", .name = "MQMSGPROPS" },
        0x4329 => TypeRefEntry{ .namespace = "Windows.Win32.System.DistributedTransactionCoordinator", .name = "ITransaction" },
        0x432d => TypeRefEntry{ .namespace = "Windows.Win32.System.MessageQueuing", .name = "PMQRECEIVECALLBACK" },
        0x4331 => TypeRefEntry{ .namespace = "Windows.Win32.System.MessageQueuing", .name = "MQQMPROPS" },
        0x4335 => TypeRefEntry{ .namespace = "Windows.Win32.System.MessageQueuing", .name = "MQPRIVATEPROPS" },
        0x4339 => TypeRefEntry{ .namespace = "Windows.Win32.System.MessageQueuing", .name = "MQMGMTPROPS" },
        else => null,
    };
}

pub const MQSEC_DELETE_QUEUE = 65536;
pub const MQSEC_GET_QUEUE_PERMISSIONS = 131072;
pub const MQSEC_CHANGE_QUEUE_PERMISSIONS = 262144;
pub const MQSEC_TAKE_QUEUE_OWNERSHIP = 524288;
pub const MQSEC_RECEIVE_MESSAGE = 3;
pub const MQSEC_RECEIVE_JOURNAL_MESSAGE = 10;
pub const MQSEC_QUEUE_GENERIC_READ = 131115;
pub const MQSEC_QUEUE_GENERIC_WRITE = 131108;
pub const MQSEC_QUEUE_GENERIC_ALL = 983103;
pub const MQSEC_DELETE_MESSAGE = 1;
pub const MQSEC_PEEK_MESSAGE = 2;
pub const MQSEC_WRITE_MESSAGE = 4;
pub const MQSEC_DELETE_JOURNAL_MESSAGE = 8;
pub const MQSEC_SET_QUEUE_PROPERTIES = 16;
pub const MQSEC_GET_QUEUE_PROPERTIES = 32;
pub const MQSEC_QUEUE_GENERIC_EXECUTE = 0;
pub const PRLT = 0;
pub const PRLE = 1;
pub const PRGT = 2;
pub const PRGE = 3;
pub const PREQ = 4;
pub const PRNE = 5;
pub const QUERY_SORTASCEND = 0;
pub const QUERY_SORTDESCEND = 1;
pub const MQ_MOVE_ACCESS = 4;
pub const MQ_ACTION_RECEIVE = 0;
pub const MQ_ACTION_PEEK_CURRENT = 2147483648;
pub const MQ_ACTION_PEEK_NEXT = 2147483649;
pub const MQ_LOOKUP_PEEK_CURRENT = 1073741840;
pub const MQ_LOOKUP_PEEK_NEXT = 1073741841;
pub const MQ_LOOKUP_PEEK_PREV = 1073741842;
pub const MQ_LOOKUP_PEEK_FIRST = 1073741844;
pub const MQ_LOOKUP_PEEK_LAST = 1073741848;
pub const MQ_LOOKUP_RECEIVE_CURRENT = 1073741856;
pub const MQ_LOOKUP_RECEIVE_NEXT = 1073741857;
pub const MQ_LOOKUP_RECEIVE_PREV = 1073741858;
pub const MQ_LOOKUP_RECEIVE_FIRST = 1073741860;
pub const MQ_LOOKUP_RECEIVE_LAST = 1073741864;
pub const MQ_LOOKUP_RECEIVE_ALLOW_PEEK = 1073742112;
pub const PROPID_M_BASE = 0;
pub const PROPID_M_CLASS = 1;
pub const PROPID_M_MSGID = 2;
pub const PROPID_M_CORRELATIONID = 3;
pub const PROPID_M_PRIORITY = 4;
pub const PROPID_M_DELIVERY = 5;
pub const PROPID_M_ACKNOWLEDGE = 6;
pub const PROPID_M_JOURNAL = 7;
pub const PROPID_M_APPSPECIFIC = 8;
pub const PROPID_M_BODY = 9;
pub const PROPID_M_BODY_SIZE = 10;
pub const PROPID_M_LABEL = 11;
pub const PROPID_M_LABEL_LEN = 12;
pub const PROPID_M_TIME_TO_REACH_QUEUE = 13;
pub const PROPID_M_TIME_TO_BE_RECEIVED = 14;
pub const PROPID_M_RESP_QUEUE = 15;
pub const PROPID_M_RESP_QUEUE_LEN = 16;
pub const PROPID_M_ADMIN_QUEUE = 17;
pub const PROPID_M_ADMIN_QUEUE_LEN = 18;
pub const PROPID_M_VERSION = 19;
pub const PROPID_M_SENDERID = 20;
pub const PROPID_M_SENDERID_LEN = 21;
pub const PROPID_M_SENDERID_TYPE = 22;
pub const PROPID_M_PRIV_LEVEL = 23;
pub const PROPID_M_AUTH_LEVEL = 24;
pub const PROPID_M_AUTHENTICATED = 25;
pub const PROPID_M_HASH_ALG = 26;
pub const PROPID_M_ENCRYPTION_ALG = 27;
pub const PROPID_M_SENDER_CERT = 28;
pub const PROPID_M_SENDER_CERT_LEN = 29;
pub const PROPID_M_SRC_MACHINE_ID = 30;
pub const PROPID_M_SENTTIME = 31;
pub const PROPID_M_ARRIVEDTIME = 32;
pub const PROPID_M_DEST_QUEUE = 33;
pub const PROPID_M_DEST_QUEUE_LEN = 34;
pub const PROPID_M_EXTENSION = 35;
pub const PROPID_M_EXTENSION_LEN = 36;
pub const PROPID_M_SECURITY_CONTEXT = 37;
pub const PROPID_M_CONNECTOR_TYPE = 38;
pub const PROPID_M_XACT_STATUS_QUEUE = 39;
pub const PROPID_M_XACT_STATUS_QUEUE_LEN = 40;
pub const PROPID_M_TRACE = 41;
pub const PROPID_M_BODY_TYPE = 42;
pub const PROPID_M_DEST_SYMM_KEY = 43;
pub const PROPID_M_DEST_SYMM_KEY_LEN = 44;
pub const PROPID_M_SIGNATURE = 45;
pub const PROPID_M_SIGNATURE_LEN = 46;
pub const PROPID_M_PROV_TYPE = 47;
pub const PROPID_M_PROV_NAME = 48;
pub const PROPID_M_PROV_NAME_LEN = 49;
pub const PROPID_M_FIRST_IN_XACT = 50;
pub const PROPID_M_LAST_IN_XACT = 51;
pub const PROPID_M_XACTID = 52;
pub const PROPID_M_AUTHENTICATED_EX = 53;
pub const PROPID_M_RESP_FORMAT_NAME = 54;
pub const PROPID_M_RESP_FORMAT_NAME_LEN = 55;
pub const PROPID_M_DEST_FORMAT_NAME = 58;
pub const PROPID_M_DEST_FORMAT_NAME_LEN = 59;
pub const PROPID_M_LOOKUPID = 60;
pub const PROPID_M_SOAP_ENVELOPE = 61;
pub const PROPID_M_SOAP_ENVELOPE_LEN = 62;
pub const PROPID_M_COMPOUND_MESSAGE = 63;
pub const PROPID_M_COMPOUND_MESSAGE_SIZE = 64;
pub const PROPID_M_SOAP_HEADER = 65;
pub const PROPID_M_SOAP_BODY = 66;
pub const PROPID_M_DEADLETTER_QUEUE = 67;
pub const PROPID_M_DEADLETTER_QUEUE_LEN = 68;
pub const PROPID_M_ABORT_COUNT = 69;
pub const PROPID_M_MOVE_COUNT = 70;
pub const PROPID_M_LAST_MOVE_TIME = 75;
pub const PROPID_M_MSGID_SIZE = 20;
pub const PROPID_M_CORRELATIONID_SIZE = 20;
pub const PROPID_M_XACTID_SIZE = 20;
pub const MQMSG_PRIV_LEVEL_BODY_AES = 5;
pub const MQMSG_AUTHENTICATED_QM_MESSAGE = 11;
pub const MQMSG_NOT_FIRST_IN_XACT = 0;
pub const MQMSG_FIRST_IN_XACT = 1;
pub const MQMSG_NOT_LAST_IN_XACT = 0;
pub const MQMSG_LAST_IN_XACT = 1;
pub const PROPID_Q_BASE = 100;
pub const PROPID_Q_INSTANCE = 101;
pub const PROPID_Q_TYPE = 102;
pub const PROPID_Q_PATHNAME = 103;
pub const PROPID_Q_JOURNAL = 104;
pub const PROPID_Q_QUOTA = 105;
pub const PROPID_Q_BASEPRIORITY = 106;
pub const PROPID_Q_JOURNAL_QUOTA = 107;
pub const PROPID_Q_LABEL = 108;
pub const PROPID_Q_CREATE_TIME = 109;
pub const PROPID_Q_MODIFY_TIME = 110;
pub const PROPID_Q_AUTHENTICATE = 111;
pub const PROPID_Q_PRIV_LEVEL = 112;
pub const PROPID_Q_TRANSACTION = 113;
pub const PROPID_Q_PATHNAME_DNS = 124;
pub const PROPID_Q_MULTICAST_ADDRESS = 125;
pub const PROPID_Q_ADS_PATH = 126;
pub const PROPID_QM_BASE = 200;
pub const PROPID_QM_SITE_ID = 201;
pub const PROPID_QM_MACHINE_ID = 202;
pub const PROPID_QM_PATHNAME = 203;
pub const PROPID_QM_CONNECTION = 204;
pub const PROPID_QM_ENCRYPTION_PK = 205;
pub const PROPID_QM_ENCRYPTION_PK_BASE = 231;
pub const PROPID_QM_ENCRYPTION_PK_ENHANCED = 232;
pub const PROPID_QM_PATHNAME_DNS = 233;
pub const PROPID_QM_ENCRYPTION_PK_AES = 244;
pub const PROPID_PC_BASE = 5800;
pub const PROPID_PC_VERSION = 5801;
pub const PROPID_PC_DS_ENABLED = 5802;
pub const PROPID_MGMT_MSMQ_BASE = 0;
pub const PROPID_MGMT_MSMQ_ACTIVEQUEUES = 1;
pub const PROPID_MGMT_MSMQ_PRIVATEQ = 2;
pub const PROPID_MGMT_MSMQ_DSSERVER = 3;
pub const PROPID_MGMT_MSMQ_CONNECTED = 4;
pub const PROPID_MGMT_MSMQ_TYPE = 5;
pub const PROPID_MGMT_MSMQ_BYTES_IN_ALL_QUEUES = 6;
pub const PROPID_MGMT_QUEUE_BASE = 0;
pub const PROPID_MGMT_QUEUE_PATHNAME = 1;
pub const PROPID_MGMT_QUEUE_FORMATNAME = 2;
pub const PROPID_MGMT_QUEUE_TYPE = 3;
pub const PROPID_MGMT_QUEUE_LOCATION = 4;
pub const PROPID_MGMT_QUEUE_XACT = 5;
pub const PROPID_MGMT_QUEUE_FOREIGN = 6;
pub const PROPID_MGMT_QUEUE_MESSAGE_COUNT = 7;
pub const PROPID_MGMT_QUEUE_BYTES_IN_QUEUE = 8;
pub const PROPID_MGMT_QUEUE_JOURNAL_MESSAGE_COUNT = 9;
pub const PROPID_MGMT_QUEUE_BYTES_IN_JOURNAL = 10;
pub const PROPID_MGMT_QUEUE_STATE = 11;
pub const PROPID_MGMT_QUEUE_NEXTHOPS = 12;
pub const PROPID_MGMT_QUEUE_EOD_LAST_ACK = 13;
pub const PROPID_MGMT_QUEUE_EOD_LAST_ACK_TIME = 14;
pub const PROPID_MGMT_QUEUE_EOD_LAST_ACK_COUNT = 15;
pub const PROPID_MGMT_QUEUE_EOD_FIRST_NON_ACK = 16;
pub const PROPID_MGMT_QUEUE_EOD_LAST_NON_ACK = 17;
pub const PROPID_MGMT_QUEUE_EOD_NEXT_SEQ = 18;
pub const PROPID_MGMT_QUEUE_EOD_NO_READ_COUNT = 19;
pub const PROPID_MGMT_QUEUE_EOD_NO_ACK_COUNT = 20;
pub const PROPID_MGMT_QUEUE_EOD_RESEND_TIME = 21;
pub const PROPID_MGMT_QUEUE_EOD_RESEND_INTERVAL = 22;
pub const PROPID_MGMT_QUEUE_EOD_RESEND_COUNT = 23;
pub const PROPID_MGMT_QUEUE_EOD_SOURCE_INFO = 24;
pub const PROPID_MGMT_QUEUE_CONNECTION_HISTORY = 25;
pub const PROPID_MGMT_QUEUE_SUBQUEUE_COUNT = 26;
pub const PROPID_MGMT_QUEUE_SUBQUEUE_NAMES = 27;
pub const PROPID_MGMT_QUEUE_USED_QUOTA = 8;
pub const PROPID_MGMT_QUEUE_JOURNAL_USED_QUOTA = 10;
pub const LONG_LIVED = 4294967294;
pub const MQ_OK = 0;
pub const MQ_ERROR_RESOLVE_ADDRESS = -1072824167;
pub const MQ_ERROR_TOO_MANY_PROPERTIES = -1072824166;
pub const MQ_ERROR_MESSAGE_NOT_AUTHENTICATED = -1072824165;
pub const MQ_ERROR_MESSAGE_LOCKED_UNDER_TRANSACTION = -1072824164;
pub const MQMSG_CALG_MD2 = 32769;
pub const MQMSG_CALG_MD4 = 32770;
pub const MQMSG_CALG_MD5 = 32771;
pub const MQMSG_CALG_SHA = 32772;
pub const MQMSG_CALG_SHA1 = 32772;
pub const MQMSG_CALG_MAC = 32773;
pub const MQMSG_CALG_RSA_SIGN = 9216;
pub const MQMSG_CALG_DSS_SIGN = 8704;
pub const MQMSG_CALG_RSA_KEYX = 41984;
pub const MQMSG_CALG_DES = 26113;
pub const MQMSG_CALG_RC2 = 26114;
pub const MQMSG_CALG_RC4 = 26625;
pub const MQMSG_CALG_SEAL = 26626;
pub const MQ_NO_TRANSACTION = 0;
pub const MQ_MTS_TRANSACTION = 1;
pub const MQ_XA_TRANSACTION = 2;
pub const MQ_SINGLE_MESSAGE = 3;
pub const REL_NOP = 0;
pub const REL_EQ = 1;
pub const REL_NEQ = 2;
pub const REL_LT = 3;
pub const REL_GT = 4;
pub const REL_LE = 5;
pub const REL_GE = 6;
pub const MQCERT_REGISTER_ALWAYS = 1;
pub const MQCERT_REGISTER_IF_NOT_EXIST = 2;
pub const MQMSG_FIRST = 0;
pub const MQMSG_CURRENT = 1;
pub const MQMSG_NEXT = 2;
pub const MQMSG_CLASS_NORMAL = 0;
pub const MQMSG_CLASS_REPORT = 1;
pub const MQMSG_CLASS_ACK_REACH_QUEUE = 2;
pub const MQMSG_CLASS_ACK_RECEIVE = 16384;
pub const MQMSG_CLASS_NACK_BAD_DST_Q = 32768;
pub const MQMSG_CLASS_NACK_PURGED = 32769;
pub const MQMSG_CLASS_NACK_REACH_QUEUE_TIMEOUT = 32770;
pub const MQMSG_CLASS_NACK_Q_EXCEED_QUOTA = 32771;
pub const MQMSG_CLASS_NACK_ACCESS_DENIED = 32772;
pub const MQMSG_CLASS_NACK_HOP_COUNT_EXCEEDED = 32773;
pub const MQMSG_CLASS_NACK_BAD_SIGNATURE = 32774;
pub const MQMSG_CLASS_NACK_BAD_ENCRYPTION = 32775;
pub const MQMSG_CLASS_NACK_COULD_NOT_ENCRYPT = 32776;
pub const MQMSG_CLASS_NACK_NOT_TRANSACTIONAL_Q = 32777;
pub const MQMSG_CLASS_NACK_NOT_TRANSACTIONAL_MSG = 32778;
pub const MQMSG_CLASS_NACK_UNSUPPORTED_CRYPTO_PROVIDER = 32779;
pub const MQMSG_CLASS_NACK_SOURCE_COMPUTER_GUID_CHANGED = 32780;
pub const MQMSG_CLASS_NACK_Q_DELETED = 49152;
pub const MQMSG_CLASS_NACK_Q_PURGED = 49153;
pub const MQMSG_CLASS_NACK_RECEIVE_TIMEOUT = 49154;
pub const MQMSG_CLASS_NACK_RECEIVE_TIMEOUT_AT_SENDER = 49155;
pub const MQMSG_DELIVERY_EXPRESS = 0;
pub const MQMSG_DELIVERY_RECOVERABLE = 1;
pub const MQMSG_ACKNOWLEDGMENT_NONE = 0;
pub const MQMSG_ACKNOWLEDGMENT_POS_ARRIVAL = 1;
pub const MQMSG_ACKNOWLEDGMENT_POS_RECEIVE = 2;
pub const MQMSG_ACKNOWLEDGMENT_NEG_ARRIVAL = 4;
pub const MQMSG_ACKNOWLEDGMENT_NEG_RECEIVE = 8;
pub const MQMSG_ACKNOWLEDGMENT_NACK_REACH_QUEUE = 4;
pub const MQMSG_ACKNOWLEDGMENT_FULL_REACH_QUEUE = 5;
pub const MQMSG_ACKNOWLEDGMENT_NACK_RECEIVE = 12;
pub const MQMSG_ACKNOWLEDGMENT_FULL_RECEIVE = 14;
pub const MQMSG_JOURNAL_NONE = 0;
pub const MQMSG_DEADLETTER = 1;
pub const MQMSG_JOURNAL = 2;
pub const MQMSG_TRACE_NONE = 0;
pub const MQMSG_SEND_ROUTE_TO_REPORT_QUEUE = 1;
pub const MQMSG_SENDERID_TYPE_NONE = 0;
pub const MQMSG_SENDERID_TYPE_SID = 1;
pub const MQMSG_PRIV_LEVEL_NONE = 0;
pub const MQMSG_PRIV_LEVEL_BODY_BASE = 1;
pub const MQMSG_PRIV_LEVEL_BODY_ENHANCED = 3;
pub const MQMSG_AUTH_LEVEL_NONE = 0;
pub const MQMSG_AUTH_LEVEL_ALWAYS = 1;
pub const MQMSG_AUTH_LEVEL_MSMQ10 = 2;
pub const MQMSG_AUTH_LEVEL_SIG10 = 2;
pub const MQMSG_AUTH_LEVEL_MSMQ20 = 4;
pub const MQMSG_AUTH_LEVEL_SIG20 = 4;
pub const MQMSG_AUTH_LEVEL_SIG30 = 8;
pub const MQMSG_MSGID_SIZE = 20;
pub const MQMSG_CORRELATIONID_SIZE = 20;
pub const MQMSG_XACTID_SIZE = 20;
pub const MQ_MAX_MSG_LABEL_LEN = 249;
pub const MQMSG_AUTHENTICATION_NOT_REQUESTED = 0;
pub const MQMSG_AUTHENTICATION_REQUESTED = 1;
pub const MQMSG_AUTHENTICATED_SIG10 = 1;
pub const MQMSG_AUTHENTICATION_REQUESTED_EX = 3;
pub const MQMSG_AUTHENTICATED_SIG20 = 3;
pub const MQMSG_AUTHENTICATED_SIG30 = 5;
pub const MQMSG_AUTHENTICATED_SIGXML = 9;
pub const MQ_DENY_NONE = 0;
pub const MQ_DENY_RECEIVE_SHARE = 1;
pub const MQ_RECEIVE_ACCESS = 1;
pub const MQ_SEND_ACCESS = 2;
pub const MQ_PEEK_ACCESS = 32;
pub const MQ_ADMIN_ACCESS = 128;
pub const MQ_JOURNAL_NONE = 0;
pub const MQ_JOURNAL = 1;
pub const MQ_TRANSACTIONAL_NONE = 0;
pub const MQ_TRANSACTIONAL = 1;
pub const MQ_AUTHENTICATE_NONE = 0;
pub const MQ_AUTHENTICATE = 1;
pub const MQ_PRIV_LEVEL_NONE = 0;
pub const MQ_PRIV_LEVEL_OPTIONAL = 1;
pub const MQ_PRIV_LEVEL_BODY = 2;
pub const MQ_MIN_PRIORITY = 0;
pub const MQ_MAX_PRIORITY = 7;
pub const MQ_MAX_Q_NAME_LEN = 124;
pub const MQ_MAX_Q_LABEL_LEN = 124;
pub const MQ_TYPE_PUBLIC = 0;
pub const MQ_TYPE_PRIVATE = 1;
pub const MQ_TYPE_MACHINE = 2;
pub const MQ_TYPE_CONNECTOR = 3;
pub const MQ_TYPE_MULTICAST = 4;
pub const MQ_STATUS_FOREIGN = 0;
pub const MQ_STATUS_NOT_FOREIGN = 1;
pub const MQ_STATUS_UNKNOWN = 2;
pub const MQ_XACT_STATUS_XACT = 0;
pub const MQ_XACT_STATUS_NOT_XACT = 1;
pub const MQ_XACT_STATUS_UNKNOWN = 2;
pub const MQ_QUEUE_STATE_LOCAL_CONNECTION = 0;
pub const MQ_QUEUE_STATE_DISCONNECTED = 1;
pub const MQ_QUEUE_STATE_WAITING = 2;
pub const MQ_QUEUE_STATE_NEEDVALIDATE = 3;
pub const MQ_QUEUE_STATE_ONHOLD = 4;
pub const MQ_QUEUE_STATE_NONACTIVE = 5;
pub const MQ_QUEUE_STATE_CONNECTED = 6;
pub const MQ_QUEUE_STATE_DISCONNECTING = 7;
pub const MQ_QUEUE_STATE_LOCKED = 8;
pub const DEFAULT_M_PRIORITY = 3;
pub const DEFAULT_M_DELIVERY = 0;
pub const DEFAULT_M_ACKNOWLEDGE = 0;
pub const DEFAULT_M_JOURNAL = 0;
pub const DEFAULT_M_APPSPECIFIC = 0;
pub const DEFAULT_M_PRIV_LEVEL = 0;
pub const DEFAULT_M_AUTH_LEVEL = 0;
pub const DEFAULT_M_SENDERID_TYPE = 1;
pub const DEFAULT_Q_JOURNAL = 0;
pub const DEFAULT_Q_BASEPRIORITY = 0;
pub const DEFAULT_Q_QUOTA = -1;
pub const DEFAULT_Q_JOURNAL_QUOTA = -1;
pub const DEFAULT_Q_TRANSACTION = 0;
pub const DEFAULT_Q_AUTHENTICATE = 0;
pub const DEFAULT_Q_PRIV_LEVEL = 1;
pub const DEFAULT_M_LOOKUPID = 0;
pub const MQ_ERROR = -1072824319;
pub const MQ_ERROR_PROPERTY = -1072824318;
pub const MQ_ERROR_QUEUE_NOT_FOUND = -1072824317;
pub const MQ_ERROR_QUEUE_NOT_ACTIVE = -1072824316;
pub const MQ_ERROR_QUEUE_EXISTS = -1072824315;
pub const MQ_ERROR_INVALID_PARAMETER = -1072824314;
pub const MQ_ERROR_INVALID_HANDLE = -1072824313;
pub const MQ_ERROR_OPERATION_CANCELLED = -1072824312;
pub const MQ_ERROR_SHARING_VIOLATION = -1072824311;
pub const MQ_ERROR_SERVICE_NOT_AVAILABLE = -1072824309;
pub const MQ_ERROR_MACHINE_NOT_FOUND = -1072824307;
pub const MQ_ERROR_ILLEGAL_SORT = -1072824304;
pub const MQ_ERROR_ILLEGAL_USER = -1072824303;
pub const MQ_ERROR_NO_DS = -1072824301;
pub const MQ_ERROR_ILLEGAL_QUEUE_PATHNAME = -1072824300;
pub const MQ_ERROR_ILLEGAL_PROPERTY_VALUE = -1072824296;
pub const MQ_ERROR_ILLEGAL_PROPERTY_VT = -1072824295;
pub const MQ_ERROR_BUFFER_OVERFLOW = -1072824294;
pub const MQ_ERROR_IO_TIMEOUT = -1072824293;
pub const MQ_ERROR_ILLEGAL_CURSOR_ACTION = -1072824292;
pub const MQ_ERROR_MESSAGE_ALREADY_RECEIVED = -1072824291;
pub const MQ_ERROR_ILLEGAL_FORMATNAME = -1072824290;
pub const MQ_ERROR_FORMATNAME_BUFFER_TOO_SMALL = -1072824289;
pub const MQ_ERROR_UNSUPPORTED_FORMATNAME_OPERATION = -1072824288;
pub const MQ_ERROR_ILLEGAL_SECURITY_DESCRIPTOR = -1072824287;
pub const MQ_ERROR_SENDERID_BUFFER_TOO_SMALL = -1072824286;
pub const MQ_ERROR_SECURITY_DESCRIPTOR_TOO_SMALL = -1072824285;
pub const MQ_ERROR_CANNOT_IMPERSONATE_CLIENT = -1072824284;
pub const MQ_ERROR_ACCESS_DENIED = -1072824283;
pub const MQ_ERROR_PRIVILEGE_NOT_HELD = -1072824282;
pub const MQ_ERROR_INSUFFICIENT_RESOURCES = -1072824281;
pub const MQ_ERROR_USER_BUFFER_TOO_SMALL = -1072824280;
pub const MQ_ERROR_MESSAGE_STORAGE_FAILED = -1072824278;
pub const MQ_ERROR_SENDER_CERT_BUFFER_TOO_SMALL = -1072824277;
pub const MQ_ERROR_INVALID_CERTIFICATE = -1072824276;
pub const MQ_ERROR_CORRUPTED_INTERNAL_CERTIFICATE = -1072824275;
pub const MQ_ERROR_INTERNAL_USER_CERT_EXIST = -1072824274;
pub const MQ_ERROR_NO_INTERNAL_USER_CERT = -1072824273;
pub const MQ_ERROR_CORRUPTED_SECURITY_DATA = -1072824272;
pub const MQ_ERROR_CORRUPTED_PERSONAL_CERT_STORE = -1072824271;
pub const MQ_ERROR_COMPUTER_DOES_NOT_SUPPORT_ENCRYPTION = -1072824269;
pub const MQ_ERROR_BAD_SECURITY_CONTEXT = -1072824267;
pub const MQ_ERROR_COULD_NOT_GET_USER_SID = -1072824266;
pub const MQ_ERROR_COULD_NOT_GET_ACCOUNT_INFO = -1072824265;
pub const MQ_ERROR_ILLEGAL_MQCOLUMNS = -1072824264;
pub const MQ_ERROR_ILLEGAL_PROPID = -1072824263;
pub const MQ_ERROR_ILLEGAL_RELATION = -1072824262;
pub const MQ_ERROR_ILLEGAL_PROPERTY_SIZE = -1072824261;
pub const MQ_ERROR_ILLEGAL_RESTRICTION_PROPID = -1072824260;
pub const MQ_ERROR_ILLEGAL_MQQUEUEPROPS = -1072824259;
pub const MQ_ERROR_PROPERTY_NOTALLOWED = -1072824258;
pub const MQ_ERROR_INSUFFICIENT_PROPERTIES = -1072824257;
pub const MQ_ERROR_MACHINE_EXISTS = -1072824256;
pub const MQ_ERROR_ILLEGAL_MQQMPROPS = -1072824255;
pub const MQ_ERROR_DS_IS_FULL = -1072824254;
pub const MQ_ERROR_DS_ERROR = -1072824253;
pub const MQ_ERROR_INVALID_OWNER = -1072824252;
pub const MQ_ERROR_UNSUPPORTED_ACCESS_MODE = -1072824251;
pub const MQ_ERROR_RESULT_BUFFER_TOO_SMALL = -1072824250;
pub const MQ_ERROR_DELETE_CN_IN_USE = -1072824248;
pub const MQ_ERROR_NO_RESPONSE_FROM_OBJECT_SERVER = -1072824247;
pub const MQ_ERROR_OBJECT_SERVER_NOT_AVAILABLE = -1072824246;
pub const MQ_ERROR_QUEUE_NOT_AVAILABLE = -1072824245;
pub const MQ_ERROR_DTC_CONNECT = -1072824244;
pub const MQ_ERROR_TRANSACTION_IMPORT = -1072824242;
pub const MQ_ERROR_TRANSACTION_USAGE = -1072824240;
pub const MQ_ERROR_TRANSACTION_SEQUENCE = -1072824239;
pub const MQ_ERROR_MISSING_CONNECTOR_TYPE = -1072824235;
pub const MQ_ERROR_STALE_HANDLE = -1072824234;
pub const MQ_ERROR_TRANSACTION_ENLIST = -1072824232;
pub const MQ_ERROR_QUEUE_DELETED = -1072824230;
pub const MQ_ERROR_ILLEGAL_CONTEXT = -1072824229;
pub const MQ_ERROR_ILLEGAL_SORT_PROPID = -1072824228;
pub const MQ_ERROR_LABEL_TOO_LONG = -1072824227;
pub const MQ_ERROR_LABEL_BUFFER_TOO_SMALL = -1072824226;
pub const MQ_ERROR_MQIS_SERVER_EMPTY = -1072824225;
pub const MQ_ERROR_MQIS_READONLY_MODE = -1072824224;
pub const MQ_ERROR_SYMM_KEY_BUFFER_TOO_SMALL = -1072824223;
pub const MQ_ERROR_SIGNATURE_BUFFER_TOO_SMALL = -1072824222;
pub const MQ_ERROR_PROV_NAME_BUFFER_TOO_SMALL = -1072824221;
pub const MQ_ERROR_ILLEGAL_OPERATION = -1072824220;
pub const MQ_ERROR_WRITE_NOT_ALLOWED = -1072824219;
pub const MQ_ERROR_WKS_CANT_SERVE_CLIENT = -1072824218;
pub const MQ_ERROR_DEPEND_WKS_LICENSE_OVERFLOW = -1072824217;
pub const MQ_CORRUPTED_QUEUE_WAS_DELETED = -1072824216;
pub const MQ_ERROR_REMOTE_MACHINE_NOT_AVAILABLE = -1072824215;
pub const MQ_ERROR_UNSUPPORTED_OPERATION = -1072824214;
pub const MQ_ERROR_ENCRYPTION_PROVIDER_NOT_SUPPORTED = -1072824213;
pub const MQ_ERROR_CANNOT_SET_CRYPTO_SEC_DESCR = -1072824212;
pub const MQ_ERROR_CERTIFICATE_NOT_PROVIDED = -1072824211;
pub const MQ_ERROR_Q_DNS_PROPERTY_NOT_SUPPORTED = -1072824210;
pub const MQ_ERROR_CANT_CREATE_CERT_STORE = -1072824209;
pub const MQ_ERROR_CANNOT_CREATE_CERT_STORE = -1072824209;
pub const MQ_ERROR_CANT_OPEN_CERT_STORE = -1072824208;
pub const MQ_ERROR_CANNOT_OPEN_CERT_STORE = -1072824208;
pub const MQ_ERROR_ILLEGAL_ENTERPRISE_OPERATION = -1072824207;
pub const MQ_ERROR_CANNOT_GRANT_ADD_GUID = -1072824206;
pub const MQ_ERROR_CANNOT_LOAD_MSMQOCM = -1072824205;
pub const MQ_ERROR_NO_ENTRY_POINT_MSMQOCM = -1072824204;
pub const MQ_ERROR_NO_MSMQ_SERVERS_ON_DC = -1072824203;
pub const MQ_ERROR_CANNOT_JOIN_DOMAIN = -1072824202;
pub const MQ_ERROR_CANNOT_CREATE_ON_GC = -1072824201;
pub const MQ_ERROR_GUID_NOT_MATCHING = -1072824200;
pub const MQ_ERROR_PUBLIC_KEY_NOT_FOUND = -1072824199;
pub const MQ_ERROR_PUBLIC_KEY_DOES_NOT_EXIST = -1072824198;
pub const MQ_ERROR_ILLEGAL_MQPRIVATEPROPS = -1072824197;
pub const MQ_ERROR_NO_GC_IN_DOMAIN = -1072824196;
pub const MQ_ERROR_NO_MSMQ_SERVERS_ON_GC = -1072824195;
pub const MQ_ERROR_CANNOT_GET_DN = -1072824194;
pub const MQ_ERROR_CANNOT_HASH_DATA_EX = -1072824193;
pub const MQ_ERROR_CANNOT_SIGN_DATA_EX = -1072824192;
pub const MQ_ERROR_CANNOT_CREATE_HASH_EX = -1072824191;
pub const MQ_ERROR_FAIL_VERIFY_SIGNATURE_EX = -1072824190;
pub const MQ_ERROR_CANNOT_DELETE_PSC_OBJECTS = -1072824189;
pub const MQ_ERROR_NO_MQUSER_OU = -1072824188;
pub const MQ_ERROR_CANNOT_LOAD_MQAD = -1072824187;
pub const MQ_ERROR_CANNOT_LOAD_MQDSSRV = -1072824186;
pub const MQ_ERROR_PROPERTIES_CONFLICT = -1072824185;
pub const MQ_ERROR_MESSAGE_NOT_FOUND = -1072824184;
pub const MQ_ERROR_CANT_RESOLVE_SITES = -1072824183;
pub const MQ_ERROR_NOT_SUPPORTED_BY_DEPENDENT_CLIENTS = -1072824182;
pub const MQ_ERROR_OPERATION_NOT_SUPPORTED_BY_REMOTE_COMPUTER = -1072824181;
pub const MQ_ERROR_NOT_A_CORRECT_OBJECT_CLASS = -1072824180;
pub const MQ_ERROR_MULTI_SORT_KEYS = -1072824179;
pub const MQ_ERROR_GC_NEEDED = -1072824178;
pub const MQ_ERROR_DS_BIND_ROOT_FOREST = -1072824177;
pub const MQ_ERROR_DS_LOCAL_USER = -1072824176;
pub const MQ_ERROR_Q_ADS_PROPERTY_NOT_SUPPORTED = -1072824175;
pub const MQ_ERROR_BAD_XML_FORMAT = -1072824174;
pub const MQ_ERROR_UNSUPPORTED_CLASS = -1072824173;
pub const MQ_ERROR_UNINITIALIZED_OBJECT = -1072824172;
pub const MQ_ERROR_CANNOT_CREATE_PSC_OBJECTS = -1072824171;
pub const MQ_ERROR_CANNOT_UPDATE_PSC_OBJECTS = -1072824170;
pub const MQ_INFORMATION_PROPERTY = 1074659329;
pub const MQ_INFORMATION_ILLEGAL_PROPERTY = 1074659330;
pub const MQ_INFORMATION_PROPERTY_IGNORED = 1074659331;
pub const MQ_INFORMATION_UNSUPPORTED_PROPERTY = 1074659332;
pub const MQ_INFORMATION_DUPLICATE_PROPERTY = 1074659333;
pub const MQ_INFORMATION_OPERATION_PENDING = 1074659334;
pub const MQ_INFORMATION_FORMATNAME_BUFFER_TOO_SMALL = 1074659337;
pub const MQ_INFORMATION_INTERNAL_USER_CERT_EXIST = 1074659338;
pub const MQ_INFORMATION_OWNER_IGNORED = 1074659339;
pub const MQCONN_NOFAILURE = 0;
pub const MQCONN_ESTABLISH_PACKET_RECEIVED = 1;
pub const MQCONN_READY = 2;
pub const MQCONN_UNKNOWN_FAILURE = -2147483648;
pub const MQCONN_PING_FAILURE = -2147483647;
pub const MQCONN_CREATE_SOCKET_FAILURE = -2147483646;
pub const MQCONN_BIND_SOCKET_FAILURE = -2147483645;
pub const MQCONN_CONNECT_SOCKET_FAILURE = -2147483644;
pub const MQCONN_TCP_NOT_ENABLED = -2147483643;
pub const MQCONN_SEND_FAILURE = -2147483642;
pub const MQCONN_NOT_READY = -2147483641;
pub const MQCONN_NAME_RESOLUTION_FAILURE = -2147483640;
pub const MQCONN_INVALID_SERVER_CERT = -2147483639;
pub const MQCONN_LIMIT_REACHED = -2147483638;
pub const MQCONN_REFUSED_BY_OTHER_SIDE = -2147483637;
pub const MQCONN_ROUTING_FAILURE = -2147483636;
pub const MQCONN_OUT_OF_MEMORY = -2147483635;

pub const aliases = struct {
    pub const MQQUEUEACCESSMASK = u32;
    pub const MQCALG = i32;
    pub const MQTRANSACTION = i32;
    pub const RELOPS = i32;
    pub const MQCERT_REGISTER = i32;
    pub const MQMSGCURSOR = i32;
    pub const MQMSGCLASS = i32;
    pub const MQMSGDELIVERY = i32;
    pub const MQMSGACKNOWLEDGEMENT = i32;
    pub const MQMSGJOURNAL = i32;
    pub const MQMSGTRACE = i32;
    pub const MQMSGSENDERIDTYPE = i32;
    pub const MQMSGPRIVLEVEL = i32;
    pub const MQMSGAUTHLEVEL = i32;
    pub const MQMSGIDSIZE = i32;
    pub const MQMSGMAX = i32;
    pub const MQMSGAUTHENTICATION = i32;
    pub const MQSHARE = i32;
    pub const MQACCESS = i32;
    pub const MQJOURNAL = i32;
    pub const MQTRANSACTIONAL = i32;
    pub const MQAUTHENTICATE = i32;
    pub const MQPRIVLEVEL = i32;
    pub const MQPRIORITY = i32;
    pub const MQMAX = i32;
    pub const QUEUE_TYPE = i32;
    pub const FOREIGN_STATUS = i32;
    pub const XACT_STATUS = i32;
    pub const QUEUE_STATE = i32;
    pub const MQDEFAULT = i32;
    pub const MQERROR = i32;
    pub const MQWARNING = i32;
    pub const MQConnectionState = i32;
    pub const PMQRECEIVECALLBACK = ?*const anyopaque;
};
