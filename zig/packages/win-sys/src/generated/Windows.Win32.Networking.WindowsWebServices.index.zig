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
    .{ "WsStartReaderCanonicalization", MethodRecord{ .library = "webservices", .import = "WsStartReaderCanonicalization", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x48\x12\xc0\x01\x9a\x00\x0f\x01\x0f\x11\xc0\x01\x9b\x0c\x09\x0f\x11\xa6\x18" } },
    .{ "WsEndReaderCanonicalization", MethodRecord{ .library = "webservices", .import = "WsEndReaderCanonicalization", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x48\x0f\x11\xa6\x18" } },
    .{ "WsStartWriterCanonicalization", MethodRecord{ .library = "webservices", .import = "WsStartWriterCanonicalization", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x4c\x12\xc0\x01\x9a\x00\x0f\x01\x0f\x11\xc0\x01\x9b\x0c\x09\x0f\x11\xa6\x18" } },
    .{ "WsEndWriterCanonicalization", MethodRecord{ .library = "webservices", .import = "WsEndWriterCanonicalization", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xa6\x18" } },
    .{ "WsCreateXmlBuffer", MethodRecord{ .library = "webservices", .import = "WsCreateXmlBuffer", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x1c\x0f\x11\xc0\x01\x9b\x14\x09\x0f\x0f\x11\xa6\x44\x0f\x11\xa6\x18" } },
    .{ "WsRemoveNode", MethodRecord{ .library = "webservices", .import = "WsRemoveNode", .signature = "\x00\x02\x11\x79\x0f\x11\xc0\x01\x9b\x00\x0f\x11\xa6\x18" } },
    .{ "WsCreateReader", MethodRecord{ .library = "webservices", .import = "WsCreateReader", .signature = "\x00\x04\x11\x79\x0f\x11\xc0\x01\x9b\x04\x09\x0f\x0f\x11\xa6\x48\x0f\x11\xa6\x18" } },
    .{ "WsSetInput", MethodRecord{ .library = "webservices", .import = "WsSetInput", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x48\x0f\x11\xc0\x01\x9b\x84\x0f\x11\xc0\x01\x9b\x78\x0f\x11\xc0\x01\x9b\x04\x09\x0f\x11\xa6\x18" } },
    .{ "WsSetInputToBuffer", MethodRecord{ .library = "webservices", .import = "WsSetInputToBuffer", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x48\x0f\x11\xa6\x44\x0f\x11\xc0\x01\x9b\x04\x09\x0f\x11\xa6\x18" } },
    .{ "WsFreeReader", MethodRecord{ .library = "webservices", .import = "WsFreeReader", .signature = "\x00\x01\x01\x0f\x11\xa6\x48" } },
    .{ "WsGetReaderProperty", MethodRecord{ .library = "webservices", .import = "WsGetReaderProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x48\x11\xc0\x00\xcb\x3d\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsGetReaderNode", MethodRecord{ .library = "webservices", .import = "WsGetReaderNode", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x48\x0f\x0f\x11\xc0\x01\x9b\x64\x0f\x11\xa6\x18" } },
    .{ "WsFillReader", MethodRecord{ .library = "webservices", .import = "WsFillReader", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x48\x09\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsReadStartElement", MethodRecord{ .library = "webservices", .import = "WsReadStartElement", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x48\x0f\x11\xa6\x18" } },
    .{ "WsReadToStartElement", MethodRecord{ .library = "webservices", .import = "WsReadToStartElement", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x48\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\x59\x0f\x11\xa6\x18" } },
    .{ "WsReadStartAttribute", MethodRecord{ .library = "webservices", .import = "WsReadStartAttribute", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x48\x09\x0f\x11\xa6\x18" } },
    .{ "WsReadEndAttribute", MethodRecord{ .library = "webservices", .import = "WsReadEndAttribute", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x48\x0f\x11\xa6\x18" } },
    .{ "WsReadNode", MethodRecord{ .library = "webservices", .import = "WsReadNode", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x48\x0f\x11\xa6\x18" } },
    .{ "WsSkipNode", MethodRecord{ .library = "webservices", .import = "WsSkipNode", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x48\x0f\x11\xa6\x18" } },
    .{ "WsReadEndElement", MethodRecord{ .library = "webservices", .import = "WsReadEndElement", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x48\x0f\x11\xa6\x18" } },
    .{ "WsFindAttribute", MethodRecord{ .library = "webservices", .import = "WsFindAttribute", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x48\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x11\x59\x0f\x09\x0f\x11\xa6\x18" } },
    .{ "WsReadValue", MethodRecord{ .library = "webservices", .import = "WsReadValue", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x48\x11\xc0\x00\xcb\x59\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsReadChars", MethodRecord{ .library = "webservices", .import = "WsReadChars", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x48\x11\x05\x09\x0f\x09\x0f\x11\xa6\x18" } },
    .{ "WsReadCharsUtf8", MethodRecord{ .library = "webservices", .import = "WsReadCharsUtf8", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x48\x0f\x05\x09\x0f\x09\x0f\x11\xa6\x18" } },
    .{ "WsReadBytes", MethodRecord{ .library = "webservices", .import = "WsReadBytes", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x48\x0f\x01\x09\x0f\x09\x0f\x11\xa6\x18" } },
    .{ "WsReadArray", MethodRecord{ .library = "webservices", .import = "WsReadArray", .signature = "\x00\x0a\x11\x79\x0f\x11\xa6\x48\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x11\xc0\x00\xcb\x59\x0f\x01\x09\x09\x09\x0f\x09\x0f\x11\xa6\x18" } },
    .{ "WsGetReaderPosition", MethodRecord{ .library = "webservices", .import = "WsGetReaderPosition", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x48\x0f\x11\xc0\x01\x9b\x00\x0f\x11\xa6\x18" } },
    .{ "WsSetReaderPosition", MethodRecord{ .library = "webservices", .import = "WsSetReaderPosition", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x48\x0f\x11\xc0\x01\x9b\x00\x0f\x11\xa6\x18" } },
    .{ "WsMoveReader", MethodRecord{ .library = "webservices", .import = "WsMoveReader", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x48\x11\xc0\x00\xcb\x55\x0f\x11\x59\x0f\x11\xa6\x18" } },
    .{ "WsCreateWriter", MethodRecord{ .library = "webservices", .import = "WsCreateWriter", .signature = "\x00\x04\x11\x79\x0f\x11\xc0\x01\x9b\x10\x09\x0f\x0f\x11\xa6\x4c\x0f\x11\xa6\x18" } },
    .{ "WsFreeWriter", MethodRecord{ .library = "webservices", .import = "WsFreeWriter", .signature = "\x00\x01\x01\x0f\x11\xa6\x4c" } },
    .{ "WsSetOutput", MethodRecord{ .library = "webservices", .import = "WsSetOutput", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xc0\x01\x9b\x9c\x0f\x11\xc0\x01\x9b\xb0\x0f\x11\xc0\x01\x9b\x10\x09\x0f\x11\xa6\x18" } },
    .{ "WsSetOutputToBuffer", MethodRecord{ .library = "webservices", .import = "WsSetOutputToBuffer", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xa6\x44\x0f\x11\xc0\x01\x9b\x10\x09\x0f\x11\xa6\x18" } },
    .{ "WsGetWriterProperty", MethodRecord{ .library = "webservices", .import = "WsGetWriterProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x4c\x11\xc0\x00\xcb\x49\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsFlushWriter", MethodRecord{ .library = "webservices", .import = "WsFlushWriter", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x4c\x09\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsWriteStartElement", MethodRecord{ .library = "webservices", .import = "WsWriteStartElement", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xa6\x18" } },
    .{ "WsWriteEndStartElement", MethodRecord{ .library = "webservices", .import = "WsWriteEndStartElement", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xa6\x18" } },
    .{ "WsWriteXmlnsAttribute", MethodRecord{ .library = "webservices", .import = "WsWriteXmlnsAttribute", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x11\x59\x0f\x11\xa6\x18" } },
    .{ "WsWriteStartAttribute", MethodRecord{ .library = "webservices", .import = "WsWriteStartAttribute", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x11\x59\x0f\x11\xa6\x18" } },
    .{ "WsWriteEndAttribute", MethodRecord{ .library = "webservices", .import = "WsWriteEndAttribute", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xa6\x18" } },
    .{ "WsWriteValue", MethodRecord{ .library = "webservices", .import = "WsWriteValue", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x4c\x11\xc0\x00\xcb\x59\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsWriteXmlBuffer", MethodRecord{ .library = "webservices", .import = "WsWriteXmlBuffer", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xa6\x44\x0f\x11\xa6\x18" } },
    .{ "WsReadXmlBuffer", MethodRecord{ .library = "webservices", .import = "WsReadXmlBuffer", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x48\x0f\x11\xa6\x1c\x0f\x0f\x11\xa6\x44\x0f\x11\xa6\x18" } },
    .{ "WsWriteXmlBufferToBytes", MethodRecord{ .library = "webservices", .import = "WsWriteXmlBufferToBytes", .signature = "\x00\x09\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xa6\x44\x0f\x11\xc0\x01\x9b\x9c\x0f\x11\xc0\x01\x9b\x10\x09\x0f\x11\xa6\x1c\x0f\x0f\x01\x0f\x09\x0f\x11\xa6\x18" } },
    .{ "WsReadXmlBufferFromBytes", MethodRecord{ .library = "webservices", .import = "WsReadXmlBufferFromBytes", .signature = "\x00\x09\x11\x79\x0f\x11\xa6\x48\x0f\x11\xc0\x01\x9b\x84\x0f\x11\xc0\x01\x9b\x04\x09\x0f\x01\x09\x0f\x11\xa6\x1c\x0f\x0f\x11\xa6\x44\x0f\x11\xa6\x18" } },
    .{ "WsWriteArray", MethodRecord{ .library = "webservices", .import = "WsWriteArray", .signature = "\x00\x09\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x11\xc0\x00\xcb\x59\x0f\x01\x09\x09\x09\x0f\x11\xa6\x18" } },
    .{ "WsWriteQualifiedName", MethodRecord{ .library = "webservices", .import = "WsWriteQualifiedName", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xa6\x18" } },
    .{ "WsWriteChars", MethodRecord{ .library = "webservices", .import = "WsWriteChars", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x4c\x11\x05\x09\x0f\x11\xa6\x18" } },
    .{ "WsWriteCharsUtf8", MethodRecord{ .library = "webservices", .import = "WsWriteCharsUtf8", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x4c\x0f\x05\x09\x0f\x11\xa6\x18" } },
    .{ "WsWriteBytes", MethodRecord{ .library = "webservices", .import = "WsWriteBytes", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x4c\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsPushBytes", MethodRecord{ .library = "webservices", .import = "WsPushBytes", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x4c\x12\xc0\x01\x9a\x04\x0f\x01\x0f\x11\xa6\x18" } },
    .{ "WsPullBytes", MethodRecord{ .library = "webservices", .import = "WsPullBytes", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x4c\x12\xc0\x01\x9a\x08\x0f\x01\x0f\x11\xa6\x18" } },
    .{ "WsWriteEndElement", MethodRecord{ .library = "webservices", .import = "WsWriteEndElement", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xa6\x18" } },
    .{ "WsWriteText", MethodRecord{ .library = "webservices", .import = "WsWriteText", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xc0\x01\x9b\x18\x0f\x11\xa6\x18" } },
    .{ "WsWriteStartCData", MethodRecord{ .library = "webservices", .import = "WsWriteStartCData", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xa6\x18" } },
    .{ "WsWriteEndCData", MethodRecord{ .library = "webservices", .import = "WsWriteEndCData", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xa6\x18" } },
    .{ "WsWriteNode", MethodRecord{ .library = "webservices", .import = "WsWriteNode", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xc0\x01\x9b\x64\x0f\x11\xa6\x18" } },
    .{ "WsGetPrefixFromNamespace", MethodRecord{ .library = "webservices", .import = "WsGetPrefixFromNamespace", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xc0\x00\xcc\xc9\x11\x59\x0f\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xa6\x18" } },
    .{ "WsGetWriterPosition", MethodRecord{ .library = "webservices", .import = "WsGetWriterPosition", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xc0\x01\x9b\x00\x0f\x11\xa6\x18" } },
    .{ "WsSetWriterPosition", MethodRecord{ .library = "webservices", .import = "WsSetWriterPosition", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xc0\x01\x9b\x00\x0f\x11\xa6\x18" } },
    .{ "WsMoveWriter", MethodRecord{ .library = "webservices", .import = "WsMoveWriter", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x4c\x11\xc0\x00\xcb\x55\x0f\x11\x59\x0f\x11\xa6\x18" } },
    .{ "WsTrimXmlWhitespace", MethodRecord{ .library = "webservices", .import = "WsTrimXmlWhitespace", .signature = "\x00\x05\x11\x79\x11\x05\x09\x0f\x0f\x07\x0f\x09\x0f\x11\xa6\x18" } },
    .{ "WsVerifyXmlNCName", MethodRecord{ .library = "webservices", .import = "WsVerifyXmlNCName", .signature = "\x00\x03\x11\x79\x11\x05\x09\x0f\x11\xa6\x18" } },
    .{ "WsXmlStringEquals", MethodRecord{ .library = "webservices", .import = "WsXmlStringEquals", .signature = "\x00\x03\x11\x79\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xa6\x18" } },
    .{ "WsGetNamespaceFromPrefix", MethodRecord{ .library = "webservices", .import = "WsGetNamespaceFromPrefix", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x48\x0f\x11\xc0\x00\xcc\xc9\x11\x59\x0f\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xa6\x18" } },
    .{ "WsReadQualifiedName", MethodRecord{ .library = "webservices", .import = "WsReadQualifiedName", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x48\x0f\x11\xa6\x1c\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xa6\x18" } },
    .{ "WsGetXmlAttribute", MethodRecord{ .library = "webservices", .import = "WsGetXmlAttribute", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x48\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xa6\x1c\x0f\x0f\x07\x0f\x09\x0f\x11\xa6\x18" } },
    .{ "WsCopyNode", MethodRecord{ .library = "webservices", .import = "WsCopyNode", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xa6\x48\x0f\x11\xa6\x18" } },
    .{ "WsAsyncExecute", MethodRecord{ .library = "webservices", .import = "WsAsyncExecute", .signature = "\x00\x06\x11\x79\x0f\x11\xc0\x01\x9b\xc8\x12\xc0\x01\x9a\x14\x11\xc0\x00\xcb\x71\x0f\x01\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsCreateChannel", MethodRecord{ .library = "webservices", .import = "WsCreateChannel", .signature = "\x00\x07\x11\x79\x11\xc0\x00\xcb\x85\x11\xc0\x00\xcb\x81\x0f\x11\xc0\x01\x9b\xd0\x09\x0f\x11\xc0\x01\x9c\xcc\x0f\x0f\x11\xa6\x14\x0f\x11\xa6\x18" } },
    .{ "WsOpenChannel", MethodRecord{ .library = "webservices", .import = "WsOpenChannel", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x14\x0f\x11\xc0\x00\xcc\xd1\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsSendMessage", MethodRecord{ .library = "webservices", .import = "WsSendMessage", .signature = "\x00\x08\x11\x79\x0f\x11\xa6\x14\x0f\x11\xa6\x24\x0f\x11\xc0\x01\x9b\xec\x11\xc0\x00\xcc\x6d\x0f\x01\x09\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsReceiveMessage", MethodRecord{ .library = "webservices", .import = "WsReceiveMessage", .signature = "\x00\x0c\x11\x79\x0f\x11\xa6\x14\x0f\x11\xa6\x24\x0f\x0f\x11\xc0\x01\x9b\xec\x09\x11\xc0\x00\xcb\x7d\x11\xc0\x00\xcc\x69\x0f\x11\xa6\x1c\x0f\x01\x09\x0f\x09\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsRequestReply", MethodRecord{ .library = "webservices", .import = "WsRequestReply", .signature = "\x00\x0e\x11\x79\x0f\x11\xa6\x14\x0f\x11\xa6\x24\x0f\x11\xc0\x01\x9b\xec\x11\xc0\x00\xcc\x6d\x0f\x01\x09\x0f\x11\xa6\x24\x0f\x11\xc0\x01\x9b\xec\x11\xc0\x00\xcc\x69\x0f\x11\xa6\x1c\x0f\x01\x09\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsSendReplyMessage", MethodRecord{ .library = "webservices", .import = "WsSendReplyMessage", .signature = "\x00\x09\x11\x79\x0f\x11\xa6\x14\x0f\x11\xa6\x24\x0f\x11\xc0\x01\x9b\xec\x11\xc0\x00\xcc\x6d\x0f\x01\x09\x0f\x11\xa6\x24\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsSendFaultMessageForError", MethodRecord{ .library = "webservices", .import = "WsSendFaultMessageForError", .signature = "\x00\x08\x11\x79\x0f\x11\xa6\x14\x0f\x11\xa6\x24\x0f\x11\xa6\x18\x11\x79\x11\xc0\x00\xcb\xb1\x0f\x11\xa6\x24\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsGetChannelProperty", MethodRecord{ .library = "webservices", .import = "WsGetChannelProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x14\x11\xc0\x00\xcb\x91\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsSetChannelProperty", MethodRecord{ .library = "webservices", .import = "WsSetChannelProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x14\x11\xc0\x00\xcb\x91\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsWriteMessageStart", MethodRecord{ .library = "webservices", .import = "WsWriteMessageStart", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x14\x0f\x11\xa6\x24\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsWriteMessageEnd", MethodRecord{ .library = "webservices", .import = "WsWriteMessageEnd", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x14\x0f\x11\xa6\x24\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsReadMessageStart", MethodRecord{ .library = "webservices", .import = "WsReadMessageStart", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x14\x0f\x11\xa6\x24\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsReadMessageEnd", MethodRecord{ .library = "webservices", .import = "WsReadMessageEnd", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x14\x0f\x11\xa6\x24\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsCloseChannel", MethodRecord{ .library = "webservices", .import = "WsCloseChannel", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x14\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsAbortChannel", MethodRecord{ .library = "webservices", .import = "WsAbortChannel", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x14\x0f\x11\xa6\x18" } },
    .{ "WsFreeChannel", MethodRecord{ .library = "webservices", .import = "WsFreeChannel", .signature = "\x00\x01\x01\x0f\x11\xa6\x14" } },
    .{ "WsResetChannel", MethodRecord{ .library = "webservices", .import = "WsResetChannel", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x14\x0f\x11\xa6\x18" } },
    .{ "WsAbandonMessage", MethodRecord{ .library = "webservices", .import = "WsAbandonMessage", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x14\x0f\x11\xa6\x24\x0f\x11\xa6\x18" } },
    .{ "WsShutdownSessionChannel", MethodRecord{ .library = "webservices", .import = "WsShutdownSessionChannel", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x14\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsGetOperationContextProperty", MethodRecord{ .library = "webservices", .import = "WsGetOperationContextProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x2c\x11\xc0\x00\xcb\x99\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsGetDictionary", MethodRecord{ .library = "webservices", .import = "WsGetDictionary", .signature = "\x00\x03\x11\x79\x11\xc0\x00\xcb\x75\x0f\x0f\x11\xc0\x01\x9a\xf4\x0f\x11\xa6\x18" } },
    .{ "WsReadEndpointAddressExtension", MethodRecord{ .library = "webservices", .import = "WsReadEndpointAddressExtension", .signature = "\x00\x08\x11\x79\x0f\x11\xa6\x48\x0f\x11\xc0\x00\xcc\xd1\x11\xc0\x00\xcb\xa1\x11\xc0\x00\xcc\x69\x0f\x11\xa6\x1c\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsCreateError", MethodRecord{ .library = "webservices", .import = "WsCreateError", .signature = "\x00\x03\x11\x79\x0f\x11\xc0\x01\x9c\x20\x09\x0f\x0f\x11\xa6\x18" } },
    .{ "WsAddErrorString", MethodRecord{ .library = "webservices", .import = "WsAddErrorString", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x18\x0f\x11\xc0\x00\xcc\xd5" } },
    .{ "WsGetErrorString", MethodRecord{ .library = "webservices", .import = "WsGetErrorString", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x18\x09\x0f\x11\xc0\x00\xcc\xd5" } },
    .{ "WsCopyError", MethodRecord{ .library = "webservices", .import = "WsCopyError", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x18\x0f\x11\xa6\x18" } },
    .{ "WsGetErrorProperty", MethodRecord{ .library = "webservices", .import = "WsGetErrorProperty", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x18\x11\xc0\x00\xcb\xa5\x0f\x01\x09" } },
    .{ "WsSetErrorProperty", MethodRecord{ .library = "webservices", .import = "WsSetErrorProperty", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x18\x11\xc0\x00\xcb\xa5\x0f\x01\x09" } },
    .{ "WsResetError", MethodRecord{ .library = "webservices", .import = "WsResetError", .signature = "\x00\x01\x11\x79\x0f\x11\xa6\x18" } },
    .{ "WsFreeError", MethodRecord{ .library = "webservices", .import = "WsFreeError", .signature = "\x00\x01\x01\x0f\x11\xa6\x18" } },
    .{ "WsGetFaultErrorProperty", MethodRecord{ .library = "webservices", .import = "WsGetFaultErrorProperty", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x18\x11\xc0\x00\xcb\xad\x0f\x01\x09" } },
    .{ "WsSetFaultErrorProperty", MethodRecord{ .library = "webservices", .import = "WsSetFaultErrorProperty", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x18\x11\xc0\x00\xcb\xad\x0f\x01\x09" } },
    .{ "WsCreateFaultFromError", MethodRecord{ .library = "webservices", .import = "WsCreateFaultFromError", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x18\x11\x79\x11\xc0\x00\xcb\xb1\x0f\x11\xa6\x1c\x0f\x11\xc0\x01\x9c\x2c" } },
    .{ "WsSetFaultErrorDetail", MethodRecord{ .library = "webservices", .import = "WsSetFaultErrorDetail", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x18\x0f\x11\xc0\x01\x9c\x30\x11\xc0\x00\xcc\x6d\x0f\x01\x09" } },
    .{ "WsGetFaultErrorDetail", MethodRecord{ .library = "webservices", .import = "WsGetFaultErrorDetail", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x18\x0f\x11\xc0\x01\x9c\x30\x11\xc0\x00\xcc\x69\x0f\x11\xa6\x1c\x0f\x01\x09" } },
    .{ "WsCreateHeap", MethodRecord{ .library = "webservices", .import = "WsCreateHeap", .signature = "\x00\x06\x11\x79\x19\x19\x0f\x11\xc0\x01\x9c\x34\x09\x0f\x0f\x11\xa6\x1c\x0f\x11\xa6\x18" } },
    .{ "WsAlloc", MethodRecord{ .library = "webservices", .import = "WsAlloc", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x1c\x19\x0f\x0f\x01\x0f\x11\xa6\x18" } },
    .{ "WsGetHeapProperty", MethodRecord{ .library = "webservices", .import = "WsGetHeapProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x1c\x11\xc0\x00\xcb\xb5\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsResetHeap", MethodRecord{ .library = "webservices", .import = "WsResetHeap", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x1c\x0f\x11\xa6\x18" } },
    .{ "WsFreeHeap", MethodRecord{ .library = "webservices", .import = "WsFreeHeap", .signature = "\x00\x01\x01\x0f\x11\xa6\x1c" } },
    .{ "WsCreateListener", MethodRecord{ .library = "webservices", .import = "WsCreateListener", .signature = "\x00\x07\x11\x79\x11\xc0\x00\xcb\x85\x11\xc0\x00\xcb\x81\x0f\x11\xc0\x01\x9c\x3c\x09\x0f\x11\xc0\x01\x9c\xcc\x0f\x0f\x11\xa6\x20\x0f\x11\xa6\x18" } },
    .{ "WsOpenListener", MethodRecord{ .library = "webservices", .import = "WsOpenListener", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x20\x0f\x11\xc0\x00\xcc\xd5\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsAcceptChannel", MethodRecord{ .library = "webservices", .import = "WsAcceptChannel", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x20\x0f\x11\xa6\x14\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsCloseListener", MethodRecord{ .library = "webservices", .import = "WsCloseListener", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x20\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsAbortListener", MethodRecord{ .library = "webservices", .import = "WsAbortListener", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x20\x0f\x11\xa6\x18" } },
    .{ "WsResetListener", MethodRecord{ .library = "webservices", .import = "WsResetListener", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x20\x0f\x11\xa6\x18" } },
    .{ "WsFreeListener", MethodRecord{ .library = "webservices", .import = "WsFreeListener", .signature = "\x00\x01\x01\x0f\x11\xa6\x20" } },
    .{ "WsGetListenerProperty", MethodRecord{ .library = "webservices", .import = "WsGetListenerProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x20\x11\xc0\x00\xcb\xbd\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsSetListenerProperty", MethodRecord{ .library = "webservices", .import = "WsSetListenerProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x20\x11\xc0\x00\xcb\xbd\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsCreateChannelForListener", MethodRecord{ .library = "webservices", .import = "WsCreateChannelForListener", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x20\x0f\x11\xc0\x01\x9b\xd0\x09\x0f\x0f\x11\xa6\x14\x0f\x11\xa6\x18" } },
    .{ "WsCreateMessage", MethodRecord{ .library = "webservices", .import = "WsCreateMessage", .signature = "\x00\x06\x11\x79\x11\xc0\x00\xcb\xd9\x11\xc0\x00\xcb\xd5\x0f\x11\xc0\x01\x9c\x50\x09\x0f\x0f\x11\xa6\x24\x0f\x11\xa6\x18" } },
    .{ "WsCreateMessageForChannel", MethodRecord{ .library = "webservices", .import = "WsCreateMessageForChannel", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x14\x0f\x11\xc0\x01\x9c\x50\x09\x0f\x0f\x11\xa6\x24\x0f\x11\xa6\x18" } },
    .{ "WsInitializeMessage", MethodRecord{ .library = "webservices", .import = "WsInitializeMessage", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x24\x11\xc0\x00\xcb\xc9\x0f\x11\xa6\x24\x0f\x11\xa6\x18" } },
    .{ "WsResetMessage", MethodRecord{ .library = "webservices", .import = "WsResetMessage", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x24\x0f\x11\xa6\x18" } },
    .{ "WsFreeMessage", MethodRecord{ .library = "webservices", .import = "WsFreeMessage", .signature = "\x00\x01\x01\x0f\x11\xa6\x24" } },
    .{ "WsGetHeaderAttributes", MethodRecord{ .library = "webservices", .import = "WsGetHeaderAttributes", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x24\x0f\x11\xa6\x48\x0f\x09\x0f\x11\xa6\x18" } },
    .{ "WsGetHeader", MethodRecord{ .library = "webservices", .import = "WsGetHeader", .signature = "\x00\x08\x11\x79\x0f\x11\xa6\x24\x11\xc0\x00\xcb\xd1\x11\xc0\x00\xcc\x5d\x11\xc0\x00\xcc\x69\x0f\x11\xa6\x1c\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsGetCustomHeader", MethodRecord{ .library = "webservices", .import = "WsGetCustomHeader", .signature = "\x00\x0a\x11\x79\x0f\x11\xa6\x24\x0f\x11\xc0\x01\x9b\xe8\x11\xc0\x00\xcb\xcd\x09\x11\xc0\x00\xcc\x69\x0f\x11\xa6\x1c\x0f\x01\x09\x0f\x09\x0f\x11\xa6\x18" } },
    .{ "WsRemoveHeader", MethodRecord{ .library = "webservices", .import = "WsRemoveHeader", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x24\x11\xc0\x00\xcb\xd1\x0f\x11\xa6\x18" } },
    .{ "WsSetHeader", MethodRecord{ .library = "webservices", .import = "WsSetHeader", .signature = "\x00\x07\x11\x79\x0f\x11\xa6\x24\x11\xc0\x00\xcb\xd1\x11\xc0\x00\xcc\x5d\x11\xc0\x00\xcc\x6d\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsRemoveCustomHeader", MethodRecord{ .library = "webservices", .import = "WsRemoveCustomHeader", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x24\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xa6\x18" } },
    .{ "WsAddCustomHeader", MethodRecord{ .library = "webservices", .import = "WsAddCustomHeader", .signature = "\x00\x07\x11\x79\x0f\x11\xa6\x24\x0f\x11\xc0\x01\x9b\xe8\x11\xc0\x00\xcc\x6d\x0f\x01\x09\x09\x0f\x11\xa6\x18" } },
    .{ "WsAddMappedHeader", MethodRecord{ .library = "webservices", .import = "WsAddMappedHeader", .signature = "\x00\x07\x11\x79\x0f\x11\xa6\x24\x0f\x11\xc0\x00\xcc\xc9\x11\xc0\x00\xcc\x5d\x11\xc0\x00\xcc\x6d\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsRemoveMappedHeader", MethodRecord{ .library = "webservices", .import = "WsRemoveMappedHeader", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x24\x0f\x11\xc0\x00\xcc\xc9\x0f\x11\xa6\x18" } },
    .{ "WsGetMappedHeader", MethodRecord{ .library = "webservices", .import = "WsGetMappedHeader", .signature = "\x00\x0a\x11\x79\x0f\x11\xa6\x24\x0f\x11\xc0\x00\xcc\xc9\x11\xc0\x00\xcb\xcd\x09\x11\xc0\x00\xcc\x5d\x11\xc0\x00\xcc\x69\x0f\x11\xa6\x1c\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsWriteBody", MethodRecord{ .library = "webservices", .import = "WsWriteBody", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x24\x0f\x11\xc0\x01\x9b\xe8\x11\xc0\x00\xcc\x6d\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsReadBody", MethodRecord{ .library = "webservices", .import = "WsReadBody", .signature = "\x00\x07\x11\x79\x0f\x11\xa6\x24\x0f\x11\xc0\x01\x9b\xe8\x11\xc0\x00\xcc\x69\x0f\x11\xa6\x1c\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsWriteEnvelopeStart", MethodRecord{ .library = "webservices", .import = "WsWriteEnvelopeStart", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x24\x0f\x11\xa6\x4c\x12\xc0\x01\x9a\xac\x0f\x01\x0f\x11\xa6\x18" } },
    .{ "WsWriteEnvelopeEnd", MethodRecord{ .library = "webservices", .import = "WsWriteEnvelopeEnd", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x24\x0f\x11\xa6\x18" } },
    .{ "WsReadEnvelopeStart", MethodRecord{ .library = "webservices", .import = "WsReadEnvelopeStart", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x24\x0f\x11\xa6\x48\x12\xc0\x01\x9a\xac\x0f\x01\x0f\x11\xa6\x18" } },
    .{ "WsReadEnvelopeEnd", MethodRecord{ .library = "webservices", .import = "WsReadEnvelopeEnd", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x24\x0f\x11\xa6\x18" } },
    .{ "WsGetMessageProperty", MethodRecord{ .library = "webservices", .import = "WsGetMessageProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x24\x11\xc0\x00\xcb\xdd\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsSetMessageProperty", MethodRecord{ .library = "webservices", .import = "WsSetMessageProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x24\x11\xc0\x00\xcb\xdd\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsAddressMessage", MethodRecord{ .library = "webservices", .import = "WsAddressMessage", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x24\x0f\x11\xc0\x00\xcc\xd1\x0f\x11\xa6\x18" } },
    .{ "WsCheckMustUnderstandHeaders", MethodRecord{ .library = "webservices", .import = "WsCheckMustUnderstandHeaders", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x24\x0f\x11\xa6\x18" } },
    .{ "WsMarkHeaderAsUnderstood", MethodRecord{ .library = "webservices", .import = "WsMarkHeaderAsUnderstood", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x24\x0f\x11\xc0\x01\x9b\x00\x0f\x11\xa6\x18" } },
    .{ "WsFillBody", MethodRecord{ .library = "webservices", .import = "WsFillBody", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x24\x09\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsFlushBody", MethodRecord{ .library = "webservices", .import = "WsFlushBody", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x24\x09\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsRequestSecurityToken", MethodRecord{ .library = "webservices", .import = "WsRequestSecurityToken", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x14\x0f\x11\xc0\x01\x9c\xec\x09\x0f\x0f\x11\xa6\x38\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsGetSecurityTokenProperty", MethodRecord{ .library = "webservices", .import = "WsGetSecurityTokenProperty", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x38\x11\xc0\x00\xcc\x3d\x0f\x01\x09\x0f\x11\xa6\x1c\x0f\x11\xa6\x18" } },
    .{ "WsCreateXmlSecurityToken", MethodRecord{ .library = "webservices", .import = "WsCreateXmlSecurityToken", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x44\x0f\x11\xc0\x01\x9c\xa0\x0f\x11\xc0\x01\x9c\xd8\x09\x0f\x0f\x11\xa6\x38\x0f\x11\xa6\x18" } },
    .{ "WsFreeSecurityToken", MethodRecord{ .library = "webservices", .import = "WsFreeSecurityToken", .signature = "\x00\x01\x01\x0f\x11\xa6\x38" } },
    .{ "WsRevokeSecurityContext", MethodRecord{ .library = "webservices", .import = "WsRevokeSecurityContext", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x34\x0f\x11\xa6\x18" } },
    .{ "WsGetSecurityContextProperty", MethodRecord{ .library = "webservices", .import = "WsGetSecurityContextProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x34\x11\xc0\x00\xcc\x49\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsReadElement", MethodRecord{ .library = "webservices", .import = "WsReadElement", .signature = "\x00\x07\x11\x79\x0f\x11\xa6\x48\x0f\x11\xc0\x01\x9b\xe8\x11\xc0\x00\xcc\x69\x0f\x11\xa6\x1c\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsReadAttribute", MethodRecord{ .library = "webservices", .import = "WsReadAttribute", .signature = "\x00\x07\x11\x79\x0f\x11\xa6\x48\x0f\x11\xc0\x01\x9d\x90\x11\xc0\x00\xcc\x69\x0f\x11\xa6\x1c\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsReadType", MethodRecord{ .library = "webservices", .import = "WsReadType", .signature = "\x00\x09\x11\x79\x0f\x11\xa6\x48\x11\xc0\x00\xcc\x65\x11\xc0\x00\xcc\x5d\x0f\x01\x11\xc0\x00\xcc\x69\x0f\x11\xa6\x1c\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsWriteElement", MethodRecord{ .library = "webservices", .import = "WsWriteElement", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xc0\x01\x9b\xe8\x11\xc0\x00\xcc\x6d\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsWriteAttribute", MethodRecord{ .library = "webservices", .import = "WsWriteAttribute", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x4c\x0f\x11\xc0\x01\x9d\x90\x11\xc0\x00\xcc\x6d\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsWriteType", MethodRecord{ .library = "webservices", .import = "WsWriteType", .signature = "\x00\x08\x11\x79\x0f\x11\xa6\x4c\x11\xc0\x00\xcc\x65\x11\xc0\x00\xcc\x5d\x0f\x01\x11\xc0\x00\xcc\x6d\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsRegisterOperationForCancel", MethodRecord{ .library = "webservices", .import = "WsRegisterOperationForCancel", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x2c\x12\xc0\x01\x9a\xd8\x12\xc0\x01\x9a\xdc\x0f\x01\x0f\x11\xa6\x18" } },
    .{ "WsGetServiceHostProperty", MethodRecord{ .library = "webservices", .import = "WsGetServiceHostProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x3c\x11\xc0\x00\xcc\x85\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsCreateServiceHost", MethodRecord{ .library = "webservices", .import = "WsCreateServiceHost", .signature = "\x00\x06\x11\x79\x0f\x0f\x11\xc0\x01\x9d\xc0\x07\x0f\x11\xc0\x01\x9d\xa4\x09\x0f\x0f\x11\xa6\x3c\x0f\x11\xa6\x18" } },
    .{ "WsOpenServiceHost", MethodRecord{ .library = "webservices", .import = "WsOpenServiceHost", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x3c\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsCloseServiceHost", MethodRecord{ .library = "webservices", .import = "WsCloseServiceHost", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x3c\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsAbortServiceHost", MethodRecord{ .library = "webservices", .import = "WsAbortServiceHost", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x3c\x0f\x11\xa6\x18" } },
    .{ "WsFreeServiceHost", MethodRecord{ .library = "webservices", .import = "WsFreeServiceHost", .signature = "\x00\x01\x01\x0f\x11\xa6\x3c" } },
    .{ "WsResetServiceHost", MethodRecord{ .library = "webservices", .import = "WsResetServiceHost", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x3c\x0f\x11\xa6\x18" } },
    .{ "WsGetServiceProxyProperty", MethodRecord{ .library = "webservices", .import = "WsGetServiceProxyProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x40\x11\xc0\x00\xcc\x91\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsCreateServiceProxy", MethodRecord{ .library = "webservices", .import = "WsCreateServiceProxy", .signature = "\x00\x09\x11\x79\x11\xc0\x00\xcb\x85\x11\xc0\x00\xcb\x81\x0f\x11\xc0\x01\x9c\xcc\x0f\x11\xc0\x01\x9d\xc4\x09\x0f\x11\xc0\x01\x9b\xd0\x09\x0f\x0f\x11\xa6\x40\x0f\x11\xa6\x18" } },
    .{ "WsOpenServiceProxy", MethodRecord{ .library = "webservices", .import = "WsOpenServiceProxy", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x40\x0f\x11\xc0\x00\xcc\xd1\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsCloseServiceProxy", MethodRecord{ .library = "webservices", .import = "WsCloseServiceProxy", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x40\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsAbortServiceProxy", MethodRecord{ .library = "webservices", .import = "WsAbortServiceProxy", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x40\x0f\x11\xa6\x18" } },
    .{ "WsFreeServiceProxy", MethodRecord{ .library = "webservices", .import = "WsFreeServiceProxy", .signature = "\x00\x01\x01\x0f\x11\xa6\x40" } },
    .{ "WsResetServiceProxy", MethodRecord{ .library = "webservices", .import = "WsResetServiceProxy", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x40\x0f\x11\xa6\x18" } },
    .{ "WsAbandonCall", MethodRecord{ .library = "webservices", .import = "WsAbandonCall", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x40\x09\x0f\x11\xa6\x18" } },
    .{ "WsCall", MethodRecord{ .library = "webservices", .import = "WsCall", .signature = "\x00\x08\x11\x79\x0f\x11\xa6\x40\x0f\x11\xc0\x01\x9d\x98\x0f\x0f\x01\x0f\x11\xa6\x1c\x0f\x11\xc0\x01\x9d\xcc\x09\x0f\x11\xc0\x00\xcc\xc1\x0f\x11\xa6\x18" } },
    .{ "WsDecodeUrl", MethodRecord{ .library = "webservices", .import = "WsDecodeUrl", .signature = "\x00\x05\x11\x79\x0f\x11\xc0\x00\xcc\xd5\x09\x0f\x11\xa6\x1c\x0f\x0f\x11\xc0\x01\x9d\xd0\x0f\x11\xa6\x18" } },
    .{ "WsEncodeUrl", MethodRecord{ .library = "webservices", .import = "WsEncodeUrl", .signature = "\x00\x05\x11\x79\x0f\x11\xc0\x01\x9d\xd0\x09\x0f\x11\xa6\x1c\x0f\x11\xc0\x00\xcc\xd5\x0f\x11\xa6\x18" } },
    .{ "WsCombineUrl", MethodRecord{ .library = "webservices", .import = "WsCombineUrl", .signature = "\x00\x06\x11\x79\x0f\x11\xc0\x00\xcc\xd5\x0f\x11\xc0\x00\xcc\xd5\x09\x0f\x11\xa6\x1c\x0f\x11\xc0\x00\xcc\xd5\x0f\x11\xa6\x18" } },
    .{ "WsDateTimeToFileTime", MethodRecord{ .library = "webservices", .import = "WsDateTimeToFileTime", .signature = "\x00\x03\x11\x79\x0f\x11\xc0\x01\x9b\x4c\x0f\x11\x80\x9d\x0f\x11\xa6\x18" } },
    .{ "WsFileTimeToDateTime", MethodRecord{ .library = "webservices", .import = "WsFileTimeToDateTime", .signature = "\x00\x03\x11\x79\x0f\x11\x80\x9d\x0f\x11\xc0\x01\x9b\x4c\x0f\x11\xa6\x18" } },
    .{ "WsCreateMetadata", MethodRecord{ .library = "webservices", .import = "WsCreateMetadata", .signature = "\x00\x04\x11\x79\x0f\x11\xc0\x01\x9d\xf8\x09\x0f\x0f\x11\xa6\x28\x0f\x11\xa6\x18" } },
    .{ "WsReadMetadata", MethodRecord{ .library = "webservices", .import = "WsReadMetadata", .signature = "\x00\x04\x11\x79\x0f\x11\xa6\x28\x0f\x11\xa6\x48\x0f\x11\xc0\x00\xcc\xd5\x0f\x11\xa6\x18" } },
    .{ "WsFreeMetadata", MethodRecord{ .library = "webservices", .import = "WsFreeMetadata", .signature = "\x00\x01\x01\x0f\x11\xa6\x28" } },
    .{ "WsResetMetadata", MethodRecord{ .library = "webservices", .import = "WsResetMetadata", .signature = "\x00\x02\x11\x79\x0f\x11\xa6\x28\x0f\x11\xa6\x18" } },
    .{ "WsGetMetadataProperty", MethodRecord{ .library = "webservices", .import = "WsGetMetadataProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x28\x11\xc0\x00\xcc\xa9\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsGetMissingMetadataDocumentAddress", MethodRecord{ .library = "webservices", .import = "WsGetMissingMetadataDocumentAddress", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x28\x0f\x0f\x11\xc0\x00\xcc\xd1\x0f\x11\xa6\x18" } },
    .{ "WsGetMetadataEndpoints", MethodRecord{ .library = "webservices", .import = "WsGetMetadataEndpoints", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x28\x0f\x11\xc0\x01\x9d\xf4\x0f\x11\xa6\x18" } },
    .{ "WsMatchPolicyAlternative", MethodRecord{ .library = "webservices", .import = "WsMatchPolicyAlternative", .signature = "\x00\x06\x11\x79\x0f\x11\xa6\x30\x09\x0f\x11\xc0\x01\x9e\x60\x11\x59\x0f\x11\xa6\x1c\x0f\x11\xa6\x18" } },
    .{ "WsGetPolicyProperty", MethodRecord{ .library = "webservices", .import = "WsGetPolicyProperty", .signature = "\x00\x05\x11\x79\x0f\x11\xa6\x30\x11\xc0\x00\xcc\xb1\x0f\x01\x09\x0f\x11\xa6\x18" } },
    .{ "WsGetPolicyAlternativeCount", MethodRecord{ .library = "webservices", .import = "WsGetPolicyAlternativeCount", .signature = "\x00\x03\x11\x79\x0f\x11\xa6\x30\x0f\x09\x0f\x11\xa6\x18" } },
    .{ "WsCreateServiceProxyFromTemplate", MethodRecord{ .library = "webservices", .import = "WsCreateServiceProxyFromTemplate", .signature = "\x00\x0a\x11\x79\x11\xc0\x00\xcb\x85\x0f\x11\xc0\x01\x9d\xc4\x09\x11\xc0\x00\xcc\xbd\x0f\x01\x09\x0f\x01\x09\x0f\x0f\x11\xa6\x40\x0f\x11\xa6\x18" } },
    .{ "WsCreateServiceEndpointFromTemplate", MethodRecord{ .library = "webservices", .import = "WsCreateServiceEndpointFromTemplate", .signature = "\x00\x0e\x11\x79\x11\xc0\x00\xcb\x85\x0f\x11\xc0\x01\x9d\xa8\x09\x0f\x11\xc0\x00\xcc\xd5\x0f\x11\xc0\x01\x9d\xa0\x12\xc0\x01\x9a\xec\x0f\x11\xa6\x1c\x11\xc0\x00\xcc\xbd\x0f\x01\x09\x0f\x01\x09\x0f\x0f\x11\xc0\x01\x9d\xc0\x0f\x11\xa6\x18" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x9d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "FILETIME" },
        0x2614 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_CHANNEL" },
        0x2618 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_ERROR" },
        0x261c => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_HEAP" },
        0x2620 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_LISTENER" },
        0x2624 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_MESSAGE" },
        0x2628 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_METADATA" },
        0x262c => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_OPERATION_CONTEXT" },
        0x2630 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_POLICY" },
        0x2634 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_SECURITY_CONTEXT" },
        0x2638 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_SECURITY_TOKEN" },
        0x263c => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_SERVICE_HOST" },
        0x2640 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_SERVICE_PROXY" },
        0x2644 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_BUFFER" },
        0x2648 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_READER" },
        0x264c => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_WRITER" },
        0xcb3d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_READER_PROPERTY_ID" },
        0xcb49 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_WRITER_PROPERTY_ID" },
        0xcb55 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_MOVE_TO" },
        0xcb59 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_VALUE_TYPE" },
        0xcb71 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_CALLBACK_MODEL" },
        0xcb75 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_ENCODING" },
        0xcb7d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_RECEIVE_OPTION" },
        0xcb81 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_CHANNEL_BINDING" },
        0xcb85 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_CHANNEL_TYPE" },
        0xcb91 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_CHANNEL_PROPERTY_ID" },
        0xcb99 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_OPERATION_CONTEXT_PROPERTY_ID" },
        0xcba1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_ENDPOINT_ADDRESS_EXTENSION_TYPE" },
        0xcba5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_ERROR_PROPERTY_ID" },
        0xcbad => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_FAULT_ERROR_PROPERTY_ID" },
        0xcbb1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_FAULT_DISCLOSURE" },
        0xcbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_HEAP_PROPERTY_ID" },
        0xcbbd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_LISTENER_PROPERTY_ID" },
        0xcbc9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_MESSAGE_INITIALIZATION" },
        0xcbcd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_REPEATING_HEADER_OPTION" },
        0xcbd1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_HEADER_TYPE" },
        0xcbd5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_ADDRESSING_VERSION" },
        0xcbd9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_ENVELOPE_VERSION" },
        0xcbdd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_MESSAGE_PROPERTY_ID" },
        0xcc3d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_SECURITY_TOKEN_PROPERTY_ID" },
        0xcc49 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_SECURITY_CONTEXT_PROPERTY_ID" },
        0xcc5d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_TYPE" },
        0xcc65 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_TYPE_MAPPING" },
        0xcc69 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_READ_OPTION" },
        0xcc6d => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_WRITE_OPTION" },
        0xcc85 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_SERVICE_PROPERTY_ID" },
        0xcc91 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_PROXY_PROPERTY_ID" },
        0xcca9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_METADATA_PROPERTY_ID" },
        0xccb1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_POLICY_PROPERTY_ID" },
        0xccbd => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_BINDING_TEMPLATE_TYPE" },
        0xccc1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_ASYNC_CONTEXT" },
        0xccc9 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_STRING" },
        0xccd1 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_ENDPOINT_ADDRESS" },
        0xccd5 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_STRING" },
        0x19a00 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_WRITE_CALLBACK" },
        0x19a04 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_PUSH_BYTES_CALLBACK" },
        0x19a08 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_PULL_BYTES_CALLBACK" },
        0x19a14 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_ASYNC_FUNCTION" },
        0x19aac => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_MESSAGE_DONE_CALLBACK" },
        0x19ad8 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_OPERATION_CANCEL_CALLBACK" },
        0x19adc => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_OPERATION_FREE_STATE_CALLBACK" },
        0x19aec => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_SERVICE_SECURITY_CALLBACK" },
        0x19af4 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_DICTIONARY" },
        0x19b00 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_NODE_POSITION" },
        0x19b04 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_READER_PROPERTY" },
        0x19b0c => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_CANONICALIZATION_PROPERTY" },
        0x19b10 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_WRITER_PROPERTY" },
        0x19b14 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_BUFFER_PROPERTY" },
        0x19b18 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_TEXT" },
        0x19b4c => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_DATETIME" },
        0x19b64 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_NODE" },
        0x19b78 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_READER_INPUT" },
        0x19b84 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_READER_ENCODING" },
        0x19b9c => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_WRITER_ENCODING" },
        0x19bb0 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_WRITER_OUTPUT" },
        0x19bc8 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_ASYNC_STATE" },
        0x19bd0 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_CHANNEL_PROPERTY" },
        0x19be8 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_ELEMENT_DESCRIPTION" },
        0x19bec => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_MESSAGE_DESCRIPTION" },
        0x19c20 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_ERROR_PROPERTY" },
        0x19c2c => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_FAULT" },
        0x19c30 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_FAULT_DETAIL_DESCRIPTION" },
        0x19c34 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_HEAP_PROPERTY" },
        0x19c3c => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_LISTENER_PROPERTY" },
        0x19c50 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_MESSAGE_PROPERTY" },
        0x19ca0 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_SECURITY_KEY_HANDLE" },
        0x19ccc => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_SECURITY_DESCRIPTION" },
        0x19cd8 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_XML_SECURITY_TOKEN_PROPERTY" },
        0x19cec => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_REQUEST_SECURITY_TOKEN_PROPERTY" },
        0x19d90 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_ATTRIBUTE_DESCRIPTION" },
        0x19d98 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_OPERATION_DESCRIPTION" },
        0x19da0 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_SERVICE_CONTRACT" },
        0x19da4 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_SERVICE_PROPERTY" },
        0x19da8 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_SERVICE_ENDPOINT_PROPERTY" },
        0x19dc0 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_SERVICE_ENDPOINT" },
        0x19dc4 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_PROXY_PROPERTY" },
        0x19dcc => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_CALL_PROPERTY" },
        0x19dd0 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_URL" },
        0x19df4 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_METADATA_ENDPOINTS" },
        0x19df8 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_METADATA_PROPERTY" },
        0x19e60 => TypeRefEntry{ .namespace = "Windows.Win32.Networking.WindowsWebServices", .name = "WS_POLICY_CONSTRAINTS" },
        else => null,
    };
}

pub const WS_XML_READER_PROPERTY_MAX_DEPTH = 0;
pub const WS_XML_READER_PROPERTY_ALLOW_FRAGMENT = 1;
pub const WS_XML_READER_PROPERTY_MAX_ATTRIBUTES = 2;
pub const WS_XML_READER_PROPERTY_READ_DECLARATION = 3;
pub const WS_XML_READER_PROPERTY_CHARSET = 4;
pub const WS_XML_READER_PROPERTY_ROW = 5;
pub const WS_XML_READER_PROPERTY_COLUMN = 6;
pub const WS_XML_READER_PROPERTY_UTF8_TRIM_SIZE = 7;
pub const WS_XML_READER_PROPERTY_STREAM_BUFFER_SIZE = 8;
pub const WS_XML_READER_PROPERTY_IN_ATTRIBUTE = 9;
pub const WS_XML_READER_PROPERTY_STREAM_MAX_ROOT_MIME_PART_SIZE = 10;
pub const WS_XML_READER_PROPERTY_STREAM_MAX_MIME_HEADERS_SIZE = 11;
pub const WS_XML_READER_PROPERTY_MAX_MIME_PARTS = 12;
pub const WS_XML_READER_PROPERTY_ALLOW_INVALID_CHARACTER_REFERENCES = 13;
pub const WS_XML_READER_PROPERTY_MAX_NAMESPACES = 14;
pub const WS_EXCLUSIVE_XML_CANONICALIZATION_ALGORITHM = 0;
pub const WS_EXCLUSIVE_WITH_COMMENTS_XML_CANONICALIZATION_ALGORITHM = 1;
pub const WS_INCLUSIVE_XML_CANONICALIZATION_ALGORITHM = 2;
pub const WS_INCLUSIVE_WITH_COMMENTS_XML_CANONICALIZATION_ALGORITHM = 3;
pub const WS_XML_CANONICALIZATION_PROPERTY_ALGORITHM = 0;
pub const WS_XML_CANONICALIZATION_PROPERTY_INCLUSIVE_PREFIXES = 1;
pub const WS_XML_CANONICALIZATION_PROPERTY_OMITTED_ELEMENT = 2;
pub const WS_XML_CANONICALIZATION_PROPERTY_OUTPUT_BUFFER_SIZE = 3;
pub const WS_XML_WRITER_PROPERTY_MAX_DEPTH = 0;
pub const WS_XML_WRITER_PROPERTY_ALLOW_FRAGMENT = 1;
pub const WS_XML_WRITER_PROPERTY_MAX_ATTRIBUTES = 2;
pub const WS_XML_WRITER_PROPERTY_WRITE_DECLARATION = 3;
pub const WS_XML_WRITER_PROPERTY_INDENT = 4;
pub const WS_XML_WRITER_PROPERTY_BUFFER_TRIM_SIZE = 5;
pub const WS_XML_WRITER_PROPERTY_CHARSET = 6;
pub const WS_XML_WRITER_PROPERTY_BUFFERS = 7;
pub const WS_XML_WRITER_PROPERTY_BUFFER_MAX_SIZE = 8;
pub const WS_XML_WRITER_PROPERTY_BYTES = 9;
pub const WS_XML_WRITER_PROPERTY_IN_ATTRIBUTE = 10;
pub const WS_XML_WRITER_PROPERTY_MAX_MIME_PARTS_BUFFER_SIZE = 11;
pub const WS_XML_WRITER_PROPERTY_INITIAL_BUFFER = 12;
pub const WS_XML_WRITER_PROPERTY_ALLOW_INVALID_CHARACTER_REFERENCES = 13;
pub const WS_XML_WRITER_PROPERTY_MAX_NAMESPACES = 14;
pub const WS_XML_WRITER_PROPERTY_BYTES_WRITTEN = 15;
pub const WS_XML_WRITER_PROPERTY_BYTES_TO_CLOSE = 16;
pub const WS_XML_WRITER_PROPERTY_COMPRESS_EMPTY_ELEMENTS = 17;
pub const WS_XML_WRITER_PROPERTY_EMIT_UNCOMPRESSED_EMPTY_ELEMENTS = 18;
pub const WS_XML_TEXT_TYPE_UTF8 = 1;
pub const WS_XML_TEXT_TYPE_UTF16 = 2;
pub const WS_XML_TEXT_TYPE_BASE64 = 3;
pub const WS_XML_TEXT_TYPE_BOOL = 4;
pub const WS_XML_TEXT_TYPE_INT32 = 5;
pub const WS_XML_TEXT_TYPE_INT64 = 6;
pub const WS_XML_TEXT_TYPE_UINT64 = 7;
pub const WS_XML_TEXT_TYPE_FLOAT = 8;
pub const WS_XML_TEXT_TYPE_DOUBLE = 9;
pub const WS_XML_TEXT_TYPE_DECIMAL = 10;
pub const WS_XML_TEXT_TYPE_GUID = 11;
pub const WS_XML_TEXT_TYPE_UNIQUE_ID = 12;
pub const WS_XML_TEXT_TYPE_DATETIME = 13;
pub const WS_XML_TEXT_TYPE_TIMESPAN = 14;
pub const WS_XML_TEXT_TYPE_QNAME = 15;
pub const WS_XML_TEXT_TYPE_LIST = 16;
pub const WS_XML_NODE_TYPE_ELEMENT = 1;
pub const WS_XML_NODE_TYPE_TEXT = 2;
pub const WS_XML_NODE_TYPE_END_ELEMENT = 3;
pub const WS_XML_NODE_TYPE_COMMENT = 4;
pub const WS_XML_NODE_TYPE_CDATA = 6;
pub const WS_XML_NODE_TYPE_END_CDATA = 7;
pub const WS_XML_NODE_TYPE_EOF = 8;
pub const WS_XML_NODE_TYPE_BOF = 9;
pub const WS_MOVE_TO_ROOT_ELEMENT = 0;
pub const WS_MOVE_TO_NEXT_ELEMENT = 1;
pub const WS_MOVE_TO_PREVIOUS_ELEMENT = 2;
pub const WS_MOVE_TO_CHILD_ELEMENT = 3;
pub const WS_MOVE_TO_END_ELEMENT = 4;
pub const WS_MOVE_TO_PARENT_ELEMENT = 5;
pub const WS_MOVE_TO_NEXT_NODE = 6;
pub const WS_MOVE_TO_PREVIOUS_NODE = 7;
pub const WS_MOVE_TO_FIRST_NODE = 8;
pub const WS_MOVE_TO_BOF = 9;
pub const WS_MOVE_TO_EOF = 10;
pub const WS_MOVE_TO_CHILD_NODE = 11;
pub const WS_BOOL_VALUE_TYPE = 0;
pub const WS_INT8_VALUE_TYPE = 1;
pub const WS_INT16_VALUE_TYPE = 2;
pub const WS_INT32_VALUE_TYPE = 3;
pub const WS_INT64_VALUE_TYPE = 4;
pub const WS_UINT8_VALUE_TYPE = 5;
pub const WS_UINT16_VALUE_TYPE = 6;
pub const WS_UINT32_VALUE_TYPE = 7;
pub const WS_UINT64_VALUE_TYPE = 8;
pub const WS_FLOAT_VALUE_TYPE = 9;
pub const WS_DOUBLE_VALUE_TYPE = 10;
pub const WS_DECIMAL_VALUE_TYPE = 11;
pub const WS_DATETIME_VALUE_TYPE = 12;
pub const WS_TIMESPAN_VALUE_TYPE = 13;
pub const WS_GUID_VALUE_TYPE = 14;
pub const WS_DURATION_VALUE_TYPE = 15;
pub const WS_XML_READER_INPUT_TYPE_BUFFER = 1;
pub const WS_XML_READER_INPUT_TYPE_STREAM = 2;
pub const WS_XML_READER_ENCODING_TYPE_TEXT = 1;
pub const WS_XML_READER_ENCODING_TYPE_BINARY = 2;
pub const WS_XML_READER_ENCODING_TYPE_MTOM = 3;
pub const WS_XML_READER_ENCODING_TYPE_RAW = 4;
pub const WS_CHARSET_AUTO = 0;
pub const WS_CHARSET_UTF8 = 1;
pub const WS_CHARSET_UTF16LE = 2;
pub const WS_CHARSET_UTF16BE = 3;
pub const WS_XML_WRITER_ENCODING_TYPE_TEXT = 1;
pub const WS_XML_WRITER_ENCODING_TYPE_BINARY = 2;
pub const WS_XML_WRITER_ENCODING_TYPE_MTOM = 3;
pub const WS_XML_WRITER_ENCODING_TYPE_RAW = 4;
pub const WS_XML_WRITER_OUTPUT_TYPE_BUFFER = 1;
pub const WS_XML_WRITER_OUTPUT_TYPE_STREAM = 2;
pub const WS_SHORT_CALLBACK = 0;
pub const WS_LONG_CALLBACK = 1;
pub const WS_ENCODING_XML_BINARY_1 = 0;
pub const WS_ENCODING_XML_BINARY_SESSION_1 = 1;
pub const WS_ENCODING_XML_MTOM_UTF8 = 2;
pub const WS_ENCODING_XML_MTOM_UTF16BE = 3;
pub const WS_ENCODING_XML_MTOM_UTF16LE = 4;
pub const WS_ENCODING_XML_UTF8 = 5;
pub const WS_ENCODING_XML_UTF16BE = 6;
pub const WS_ENCODING_XML_UTF16LE = 7;
pub const WS_ENCODING_RAW = 8;
pub const WS_CHANNEL_STATE_CREATED = 0;
pub const WS_CHANNEL_STATE_OPENING = 1;
pub const WS_CHANNEL_STATE_ACCEPTING = 2;
pub const WS_CHANNEL_STATE_OPEN = 3;
pub const WS_CHANNEL_STATE_FAULTED = 4;
pub const WS_CHANNEL_STATE_CLOSING = 5;
pub const WS_CHANNEL_STATE_CLOSED = 6;
pub const WS_RECEIVE_REQUIRED_MESSAGE = 1;
pub const WS_RECEIVE_OPTIONAL_MESSAGE = 2;
pub const WS_HTTP_CHANNEL_BINDING = 0;
pub const WS_TCP_CHANNEL_BINDING = 1;
pub const WS_UDP_CHANNEL_BINDING = 2;
pub const WS_CUSTOM_CHANNEL_BINDING = 3;
pub const WS_NAMEDPIPE_CHANNEL_BINDING = 4;
pub const WS_CHANNEL_TYPE_INPUT = 1;
pub const WS_CHANNEL_TYPE_OUTPUT = 2;
pub const WS_CHANNEL_TYPE_SESSION = 4;
pub const WS_CHANNEL_TYPE_INPUT_SESSION = 5;
pub const WS_CHANNEL_TYPE_OUTPUT_SESSION = 6;
pub const WS_CHANNEL_TYPE_DUPLEX = 3;
pub const WS_CHANNEL_TYPE_DUPLEX_SESSION = 7;
pub const WS_CHANNEL_TYPE_REQUEST = 8;
pub const WS_CHANNEL_TYPE_REPLY = 16;
pub const WS_STREAMED_INPUT_TRANSFER_MODE = 1;
pub const WS_STREAMED_OUTPUT_TRANSFER_MODE = 2;
pub const WS_BUFFERED_TRANSFER_MODE = 0;
pub const WS_STREAMED_TRANSFER_MODE = 3;
pub const WS_HTTP_PROXY_SETTING_MODE_AUTO = 1;
pub const WS_HTTP_PROXY_SETTING_MODE_NONE = 2;
pub const WS_HTTP_PROXY_SETTING_MODE_CUSTOM = 3;
pub const WS_CHANNEL_PROPERTY_MAX_BUFFERED_MESSAGE_SIZE = 0;
pub const WS_CHANNEL_PROPERTY_MAX_STREAMED_MESSAGE_SIZE = 1;
pub const WS_CHANNEL_PROPERTY_MAX_STREAMED_START_SIZE = 2;
pub const WS_CHANNEL_PROPERTY_MAX_STREAMED_FLUSH_SIZE = 3;
pub const WS_CHANNEL_PROPERTY_ENCODING = 4;
pub const WS_CHANNEL_PROPERTY_ENVELOPE_VERSION = 5;
pub const WS_CHANNEL_PROPERTY_ADDRESSING_VERSION = 6;
pub const WS_CHANNEL_PROPERTY_MAX_SESSION_DICTIONARY_SIZE = 7;
pub const WS_CHANNEL_PROPERTY_STATE = 8;
pub const WS_CHANNEL_PROPERTY_ASYNC_CALLBACK_MODEL = 9;
pub const WS_CHANNEL_PROPERTY_IP_VERSION = 10;
pub const WS_CHANNEL_PROPERTY_RESOLVE_TIMEOUT = 11;
pub const WS_CHANNEL_PROPERTY_CONNECT_TIMEOUT = 12;
pub const WS_CHANNEL_PROPERTY_SEND_TIMEOUT = 13;
pub const WS_CHANNEL_PROPERTY_RECEIVE_RESPONSE_TIMEOUT = 14;
pub const WS_CHANNEL_PROPERTY_RECEIVE_TIMEOUT = 15;
pub const WS_CHANNEL_PROPERTY_CLOSE_TIMEOUT = 16;
pub const WS_CHANNEL_PROPERTY_ENABLE_TIMEOUTS = 17;
pub const WS_CHANNEL_PROPERTY_TRANSFER_MODE = 18;
pub const WS_CHANNEL_PROPERTY_MULTICAST_INTERFACE = 19;
pub const WS_CHANNEL_PROPERTY_MULTICAST_HOPS = 20;
pub const WS_CHANNEL_PROPERTY_REMOTE_ADDRESS = 21;
pub const WS_CHANNEL_PROPERTY_REMOTE_IP_ADDRESS = 22;
pub const WS_CHANNEL_PROPERTY_HTTP_CONNECTION_ID = 23;
pub const WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_CALLBACKS = 24;
pub const WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_PARAMETERS = 25;
pub const WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_INSTANCE = 26;
pub const WS_CHANNEL_PROPERTY_TRANSPORT_URL = 27;
pub const WS_CHANNEL_PROPERTY_NO_DELAY = 28;
pub const WS_CHANNEL_PROPERTY_SEND_KEEP_ALIVES = 29;
pub const WS_CHANNEL_PROPERTY_KEEP_ALIVE_TIME = 30;
pub const WS_CHANNEL_PROPERTY_KEEP_ALIVE_INTERVAL = 31;
pub const WS_CHANNEL_PROPERTY_MAX_HTTP_SERVER_CONNECTIONS = 32;
pub const WS_CHANNEL_PROPERTY_IS_SESSION_SHUT_DOWN = 33;
pub const WS_CHANNEL_PROPERTY_CHANNEL_TYPE = 34;
pub const WS_CHANNEL_PROPERTY_TRIM_BUFFERED_MESSAGE_SIZE = 35;
pub const WS_CHANNEL_PROPERTY_ENCODER = 36;
pub const WS_CHANNEL_PROPERTY_DECODER = 37;
pub const WS_CHANNEL_PROPERTY_PROTECTION_LEVEL = 38;
pub const WS_CHANNEL_PROPERTY_COOKIE_MODE = 39;
pub const WS_CHANNEL_PROPERTY_HTTP_PROXY_SETTING_MODE = 40;
pub const WS_CHANNEL_PROPERTY_CUSTOM_HTTP_PROXY = 41;
pub const WS_CHANNEL_PROPERTY_HTTP_MESSAGE_MAPPING = 42;
pub const WS_CHANNEL_PROPERTY_ENABLE_HTTP_REDIRECT = 43;
pub const WS_CHANNEL_PROPERTY_HTTP_REDIRECT_CALLBACK_CONTEXT = 44;
pub const WS_CHANNEL_PROPERTY_FAULTS_AS_ERRORS = 45;
pub const WS_CHANNEL_PROPERTY_ALLOW_UNSECURED_FAULTS = 46;
pub const WS_CHANNEL_PROPERTY_HTTP_SERVER_SPN = 47;
pub const WS_CHANNEL_PROPERTY_HTTP_PROXY_SPN = 48;
pub const WS_CHANNEL_PROPERTY_MAX_HTTP_REQUEST_HEADERS_BUFFER_SIZE = 49;
pub const WS_MANUAL_COOKIE_MODE = 1;
pub const WS_AUTO_COOKIE_MODE = 2;
pub const WS_OPERATION_CONTEXT_PROPERTY_CHANNEL = 0;
pub const WS_OPERATION_CONTEXT_PROPERTY_CONTRACT_DESCRIPTION = 1;
pub const WS_OPERATION_CONTEXT_PROPERTY_HOST_USER_STATE = 2;
pub const WS_OPERATION_CONTEXT_PROPERTY_CHANNEL_USER_STATE = 3;
pub const WS_OPERATION_CONTEXT_PROPERTY_INPUT_MESSAGE = 4;
pub const WS_OPERATION_CONTEXT_PROPERTY_OUTPUT_MESSAGE = 5;
pub const WS_OPERATION_CONTEXT_PROPERTY_HEAP = 6;
pub const WS_OPERATION_CONTEXT_PROPERTY_LISTENER = 7;
pub const WS_OPERATION_CONTEXT_PROPERTY_ENDPOINT_ADDRESS = 8;
pub const WS_DNS_ENDPOINT_IDENTITY_TYPE = 1;
pub const WS_UPN_ENDPOINT_IDENTITY_TYPE = 2;
pub const WS_SPN_ENDPOINT_IDENTITY_TYPE = 3;
pub const WS_RSA_ENDPOINT_IDENTITY_TYPE = 4;
pub const WS_CERT_ENDPOINT_IDENTITY_TYPE = 5;
pub const WS_UNKNOWN_ENDPOINT_IDENTITY_TYPE = 6;
pub const WS_ENDPOINT_ADDRESS_EXTENSION_METADATA_ADDRESS = 1;
pub const WS_ERROR_PROPERTY_STRING_COUNT = 0;
pub const WS_ERROR_PROPERTY_ORIGINAL_ERROR_CODE = 1;
pub const WS_ERROR_PROPERTY_LANGID = 2;
pub const WS_EXCEPTION_CODE_USAGE_FAILURE = -1069744128;
pub const WS_EXCEPTION_CODE_INTERNAL_FAILURE = -1069744127;
pub const WS_FAULT_ERROR_PROPERTY_FAULT = 0;
pub const WS_FAULT_ERROR_PROPERTY_ACTION = 1;
pub const WS_FAULT_ERROR_PROPERTY_HEADER = 2;
pub const WS_MINIMAL_FAULT_DISCLOSURE = 0;
pub const WS_FULL_FAULT_DISCLOSURE = 1;
pub const WS_HEAP_PROPERTY_MAX_SIZE = 0;
pub const WS_HEAP_PROPERTY_TRIM_SIZE = 1;
pub const WS_HEAP_PROPERTY_REQUESTED_SIZE = 2;
pub const WS_HEAP_PROPERTY_ACTUAL_SIZE = 3;
pub const WS_LISTENER_STATE_CREATED = 0;
pub const WS_LISTENER_STATE_OPENING = 1;
pub const WS_LISTENER_STATE_OPEN = 2;
pub const WS_LISTENER_STATE_FAULTED = 3;
pub const WS_LISTENER_STATE_CLOSING = 4;
pub const WS_LISTENER_STATE_CLOSED = 5;
pub const WS_LISTENER_PROPERTY_LISTEN_BACKLOG = 0;
pub const WS_LISTENER_PROPERTY_IP_VERSION = 1;
pub const WS_LISTENER_PROPERTY_STATE = 2;
pub const WS_LISTENER_PROPERTY_ASYNC_CALLBACK_MODEL = 3;
pub const WS_LISTENER_PROPERTY_CHANNEL_TYPE = 4;
pub const WS_LISTENER_PROPERTY_CHANNEL_BINDING = 5;
pub const WS_LISTENER_PROPERTY_CONNECT_TIMEOUT = 6;
pub const WS_LISTENER_PROPERTY_IS_MULTICAST = 7;
pub const WS_LISTENER_PROPERTY_MULTICAST_INTERFACES = 8;
pub const WS_LISTENER_PROPERTY_MULTICAST_LOOPBACK = 9;
pub const WS_LISTENER_PROPERTY_CLOSE_TIMEOUT = 10;
pub const WS_LISTENER_PROPERTY_TO_HEADER_MATCHING_OPTIONS = 11;
pub const WS_LISTENER_PROPERTY_TRANSPORT_URL_MATCHING_OPTIONS = 12;
pub const WS_LISTENER_PROPERTY_CUSTOM_LISTENER_CALLBACKS = 13;
pub const WS_LISTENER_PROPERTY_CUSTOM_LISTENER_PARAMETERS = 14;
pub const WS_LISTENER_PROPERTY_CUSTOM_LISTENER_INSTANCE = 15;
pub const WS_LISTENER_PROPERTY_DISALLOWED_USER_AGENT = 16;
pub const WS_IP_VERSION_4 = 1;
pub const WS_IP_VERSION_6 = 2;
pub const WS_IP_VERSION_AUTO = 3;
pub const WS_MESSAGE_STATE_EMPTY = 1;
pub const WS_MESSAGE_STATE_INITIALIZED = 2;
pub const WS_MESSAGE_STATE_READING = 3;
pub const WS_MESSAGE_STATE_WRITING = 4;
pub const WS_MESSAGE_STATE_DONE = 5;
pub const WS_BLANK_MESSAGE = 0;
pub const WS_DUPLICATE_MESSAGE = 1;
pub const WS_REQUEST_MESSAGE = 2;
pub const WS_REPLY_MESSAGE = 3;
pub const WS_FAULT_MESSAGE = 4;
pub const WS_REPEATING_HEADER = 1;
pub const WS_SINGLETON_HEADER = 2;
pub const WS_ACTION_HEADER = 1;
pub const WS_TO_HEADER = 2;
pub const WS_MESSAGE_ID_HEADER = 3;
pub const WS_RELATES_TO_HEADER = 4;
pub const WS_FROM_HEADER = 5;
pub const WS_REPLY_TO_HEADER = 6;
pub const WS_FAULT_TO_HEADER = 7;
pub const WS_ADDRESSING_VERSION_0_9 = 1;
pub const WS_ADDRESSING_VERSION_1_0 = 2;
pub const WS_ADDRESSING_VERSION_TRANSPORT = 3;
pub const WS_ENVELOPE_VERSION_SOAP_1_1 = 1;
pub const WS_ENVELOPE_VERSION_SOAP_1_2 = 2;
pub const WS_ENVELOPE_VERSION_NONE = 3;
pub const WS_MESSAGE_PROPERTY_STATE = 0;
pub const WS_MESSAGE_PROPERTY_HEAP = 1;
pub const WS_MESSAGE_PROPERTY_ENVELOPE_VERSION = 2;
pub const WS_MESSAGE_PROPERTY_ADDRESSING_VERSION = 3;
pub const WS_MESSAGE_PROPERTY_HEADER_BUFFER = 4;
pub const WS_MESSAGE_PROPERTY_HEADER_POSITION = 5;
pub const WS_MESSAGE_PROPERTY_BODY_READER = 6;
pub const WS_MESSAGE_PROPERTY_BODY_WRITER = 7;
pub const WS_MESSAGE_PROPERTY_IS_ADDRESSED = 8;
pub const WS_MESSAGE_PROPERTY_HEAP_PROPERTIES = 9;
pub const WS_MESSAGE_PROPERTY_XML_READER_PROPERTIES = 10;
pub const WS_MESSAGE_PROPERTY_XML_WRITER_PROPERTIES = 11;
pub const WS_MESSAGE_PROPERTY_IS_FAULT = 12;
pub const WS_MESSAGE_PROPERTY_MAX_PROCESSED_HEADERS = 13;
pub const WS_MESSAGE_PROPERTY_USERNAME = 14;
pub const WS_MESSAGE_PROPERTY_ENCODED_CERT = 15;
pub const WS_MESSAGE_PROPERTY_TRANSPORT_SECURITY_WINDOWS_TOKEN = 16;
pub const WS_MESSAGE_PROPERTY_HTTP_HEADER_AUTH_WINDOWS_TOKEN = 17;
pub const WS_MESSAGE_PROPERTY_MESSAGE_SECURITY_WINDOWS_TOKEN = 18;
pub const WS_MESSAGE_PROPERTY_SAML_ASSERTION = 19;
pub const WS_MESSAGE_PROPERTY_SECURITY_CONTEXT = 20;
pub const WS_MESSAGE_PROPERTY_PROTECTION_LEVEL = 21;
pub const WS_SSL_TRANSPORT_SECURITY_BINDING_TYPE = 1;
pub const WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TYPE = 2;
pub const WS_HTTP_HEADER_AUTH_SECURITY_BINDING_TYPE = 3;
pub const WS_USERNAME_MESSAGE_SECURITY_BINDING_TYPE = 4;
pub const WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_TYPE = 5;
pub const WS_XML_TOKEN_MESSAGE_SECURITY_BINDING_TYPE = 6;
pub const WS_SAML_MESSAGE_SECURITY_BINDING_TYPE = 7;
pub const WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TYPE = 8;
pub const WS_NAMEDPIPE_SSPI_TRANSPORT_SECURITY_BINDING_TYPE = 9;
pub const WS_HTTP_HEADER_AUTH_TARGET_SERVICE = 1;
pub const WS_HTTP_HEADER_AUTH_TARGET_PROXY = 2;
pub const WS_WINDOWS_INTEGRATED_AUTH_PACKAGE_KERBEROS = 1;
pub const WS_WINDOWS_INTEGRATED_AUTH_PACKAGE_NTLM = 2;
pub const WS_WINDOWS_INTEGRATED_AUTH_PACKAGE_SPNEGO = 3;
pub const WS_SECURITY_HEADER_VERSION_1_0 = 1;
pub const WS_SECURITY_HEADER_VERSION_1_1 = 2;
pub const WS_TRUST_VERSION_FEBRUARY_2005 = 1;
pub const WS_TRUST_VERSION_1_3 = 2;
pub const WS_REQUEST_SECURITY_TOKEN_ACTION_ISSUE = 1;
pub const WS_REQUEST_SECURITY_TOKEN_ACTION_NEW_CONTEXT = 2;
pub const WS_REQUEST_SECURITY_TOKEN_ACTION_RENEW_CONTEXT = 3;
pub const WS_SECURE_CONVERSATION_VERSION_FEBRUARY_2005 = 1;
pub const WS_SECURE_CONVERSATION_VERSION_1_3 = 2;
pub const WS_SECURE_PROTOCOL_SSL2 = 1;
pub const WS_SECURE_PROTOCOL_SSL3 = 2;
pub const WS_SECURE_PROTOCOL_TLS1_0 = 4;
pub const WS_SECURE_PROTOCOL_TLS1_1 = 8;
pub const WS_SECURE_PROTOCOL_TLS1_2 = 16;
pub const WS_SECURITY_TIMESTAMP_USAGE_ALWAYS = 1;
pub const WS_SECURITY_TIMESTAMP_USAGE_NEVER = 2;
pub const WS_SECURITY_TIMESTAMP_USAGE_REQUESTS_ONLY = 3;
pub const WS_SECURITY_HEADER_LAYOUT_STRICT = 1;
pub const WS_SECURITY_HEADER_LAYOUT_LAX = 2;
pub const WS_SECURITY_HEADER_LAYOUT_LAX_WITH_TIMESTAMP_FIRST = 3;
pub const WS_SECURITY_HEADER_LAYOUT_LAX_WITH_TIMESTAMP_LAST = 4;
pub const WS_SECURITY_ALGORITHM_DEFAULT = 0;
pub const WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE = 1;
pub const WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE_WITH_COMMENTS = 2;
pub const WS_SECURITY_ALGORITHM_DIGEST_SHA1 = 3;
pub const WS_SECURITY_ALGORITHM_DIGEST_SHA_256 = 4;
pub const WS_SECURITY_ALGORITHM_DIGEST_SHA_384 = 5;
pub const WS_SECURITY_ALGORITHM_DIGEST_SHA_512 = 6;
pub const WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1 = 7;
pub const WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA_256 = 8;
pub const WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA_384 = 9;
pub const WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA_512 = 10;
pub const WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1 = 11;
pub const WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_DSA_SHA1 = 12;
pub const WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA_256 = 13;
pub const WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA_384 = 14;
pub const WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA_512 = 15;
pub const WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_1_5 = 16;
pub const WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_OAEP = 17;
pub const WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1 = 18;
pub const WS_PROTECTION_LEVEL_NONE = 1;
pub const WS_PROTECTION_LEVEL_SIGN = 2;
pub const WS_PROTECTION_LEVEL_SIGN_AND_ENCRYPT = 3;
pub const WS_SECURITY_PROPERTY_TRANSPORT_PROTECTION_LEVEL = 1;
pub const WS_SECURITY_PROPERTY_ALGORITHM_SUITE = 2;
pub const WS_SECURITY_PROPERTY_ALGORITHM_SUITE_NAME = 3;
pub const WS_SECURITY_PROPERTY_MAX_ALLOWED_LATENCY = 4;
pub const WS_SECURITY_PROPERTY_TIMESTAMP_VALIDITY_DURATION = 5;
pub const WS_SECURITY_PROPERTY_MAX_ALLOWED_CLOCK_SKEW = 6;
pub const WS_SECURITY_PROPERTY_TIMESTAMP_USAGE = 7;
pub const WS_SECURITY_PROPERTY_SECURITY_HEADER_LAYOUT = 8;
pub const WS_SECURITY_PROPERTY_SECURITY_HEADER_VERSION = 9;
pub const WS_SECURITY_PROPERTY_EXTENDED_PROTECTION_POLICY = 10;
pub const WS_SECURITY_PROPERTY_EXTENDED_PROTECTION_SCENARIO = 11;
pub const WS_SECURITY_PROPERTY_SERVICE_IDENTITIES = 12;
pub const WS_SECURITY_KEY_TYPE_NONE = 1;
pub const WS_SECURITY_KEY_TYPE_SYMMETRIC = 2;
pub const WS_SECURITY_KEY_TYPE_ASYMMETRIC = 3;
pub const WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC256 = 1;
pub const WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC192 = 2;
pub const WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC128 = 3;
pub const WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC256_RSA15 = 4;
pub const WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC192_RSA15 = 5;
pub const WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC128_RSA15 = 6;
pub const WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC256_SHA256 = 7;
pub const WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC192_SHA256 = 8;
pub const WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC128_SHA256 = 9;
pub const WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC256_SHA256_RSA15 = 10;
pub const WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC192_SHA256_RSA15 = 11;
pub const WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC128_SHA256_RSA15 = 12;
pub const WS_SECURITY_TOKEN_REFERENCE_MODE_LOCAL_ID = 1;
pub const WS_SECURITY_TOKEN_REFERENCE_MODE_XML_BUFFER = 2;
pub const WS_SECURITY_TOKEN_REFERENCE_MODE_CERT_THUMBPRINT = 3;
pub const WS_SECURITY_TOKEN_REFERENCE_MODE_SECURITY_CONTEXT_ID = 4;
pub const WS_SECURITY_TOKEN_REFERENCE_MODE_SAML_ASSERTION_ID = 5;
pub const WS_SECURITY_KEY_ENTROPY_MODE_CLIENT_ONLY = 1;
pub const WS_SECURITY_KEY_ENTROPY_MODE_SERVER_ONLY = 2;
pub const WS_SECURITY_KEY_ENTROPY_MODE_COMBINED = 3;
pub const WS_EXTENDED_PROTECTION_POLICY_NEVER = 1;
pub const WS_EXTENDED_PROTECTION_POLICY_WHEN_SUPPORTED = 2;
pub const WS_EXTENDED_PROTECTION_POLICY_ALWAYS = 3;
pub const WS_EXTENDED_PROTECTION_SCENARIO_BOUND_SERVER = 1;
pub const WS_EXTENDED_PROTECTION_SCENARIO_TERMINATED_SSL = 2;
pub const WS_SECURITY_BINDING_PROPERTY_REQUIRE_SSL_CLIENT_CERT = 1;
pub const WS_SECURITY_BINDING_PROPERTY_WINDOWS_INTEGRATED_AUTH_PACKAGE = 2;
pub const WS_SECURITY_BINDING_PROPERTY_REQUIRE_SERVER_AUTH = 3;
pub const WS_SECURITY_BINDING_PROPERTY_ALLOW_ANONYMOUS_CLIENTS = 4;
pub const WS_SECURITY_BINDING_PROPERTY_ALLOWED_IMPERSONATION_LEVEL = 5;
pub const WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_SCHEME = 6;
pub const WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_TARGET = 7;
pub const WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_BASIC_REALM = 8;
pub const WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_DIGEST_REALM = 9;
pub const WS_SECURITY_BINDING_PROPERTY_HTTP_HEADER_AUTH_DIGEST_DOMAIN = 10;
pub const WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_KEY_SIZE = 11;
pub const WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_KEY_ENTROPY_MODE = 12;
pub const WS_SECURITY_BINDING_PROPERTY_MESSAGE_PROPERTIES = 13;
pub const WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_MAX_PENDING_CONTEXTS = 14;
pub const WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_MAX_ACTIVE_CONTEXTS = 15;
pub const WS_SECURITY_BINDING_PROPERTY_SECURE_CONVERSATION_VERSION = 16;
pub const WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_SUPPORT_RENEW = 17;
pub const WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_RENEWAL_INTERVAL = 18;
pub const WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_ROLLOVER_INTERVAL = 19;
pub const WS_SECURITY_BINDING_PROPERTY_CERT_FAILURES_TO_IGNORE = 20;
pub const WS_SECURITY_BINDING_PROPERTY_DISABLE_CERT_REVOCATION_CHECK = 21;
pub const WS_SECURITY_BINDING_PROPERTY_DISALLOWED_SECURE_PROTOCOLS = 22;
pub const WS_SECURITY_BINDING_PROPERTY_CERTIFICATE_VALIDATION_CALLBACK_CONTEXT = 23;
pub const WS_SUBJECT_NAME_CERT_CREDENTIAL_TYPE = 1;
pub const WS_THUMBPRINT_CERT_CREDENTIAL_TYPE = 2;
pub const WS_CUSTOM_CERT_CREDENTIAL_TYPE = 3;
pub const WS_STRING_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE = 1;
pub const WS_DEFAULT_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE = 2;
pub const WS_OPAQUE_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE = 3;
pub const WS_STRING_USERNAME_CREDENTIAL_TYPE = 1;
pub const WS_SECURITY_TOKEN_PROPERTY_KEY_TYPE = 1;
pub const WS_SECURITY_TOKEN_PROPERTY_VALID_FROM_TIME = 2;
pub const WS_SECURITY_TOKEN_PROPERTY_VALID_TILL_TIME = 3;
pub const WS_SECURITY_TOKEN_PROPERTY_SERIALIZED_XML = 4;
pub const WS_SECURITY_TOKEN_PROPERTY_ATTACHED_REFERENCE_XML = 5;
pub const WS_SECURITY_TOKEN_PROPERTY_UNATTACHED_REFERENCE_XML = 6;
pub const WS_SECURITY_TOKEN_PROPERTY_SYMMETRIC_KEY = 7;
pub const WS_RAW_SYMMETRIC_SECURITY_KEY_HANDLE_TYPE = 1;
pub const WS_NCRYPT_ASYMMETRIC_SECURITY_KEY_HANDLE_TYPE = 2;
pub const WS_CAPI_ASYMMETRIC_SECURITY_KEY_HANDLE_TYPE = 3;
pub const WS_SUPPORTING_MESSAGE_SECURITY_USAGE = 1;
pub const WS_SECURITY_CONTEXT_PROPERTY_IDENTIFIER = 1;
pub const WS_SECURITY_CONTEXT_PROPERTY_USERNAME = 2;
pub const WS_SECURITY_CONTEXT_PROPERTY_MESSAGE_SECURITY_WINDOWS_TOKEN = 3;
pub const WS_SECURITY_CONTEXT_PROPERTY_SAML_ASSERTION = 4;
pub const WS_XML_SECURITY_TOKEN_PROPERTY_ATTACHED_REFERENCE = 1;
pub const WS_XML_SECURITY_TOKEN_PROPERTY_UNATTACHED_REFERENCE = 2;
pub const WS_XML_SECURITY_TOKEN_PROPERTY_VALID_FROM_TIME = 3;
pub const WS_XML_SECURITY_TOKEN_PROPERTY_VALID_TILL_TIME = 4;
pub const WS_CERT_SIGNED_SAML_AUTHENTICATOR_TYPE = 1;
pub const WS_REQUEST_SECURITY_TOKEN_PROPERTY_APPLIES_TO = 1;
pub const WS_REQUEST_SECURITY_TOKEN_PROPERTY_TRUST_VERSION = 2;
pub const WS_REQUEST_SECURITY_TOKEN_PROPERTY_SECURE_CONVERSATION_VERSION = 3;
pub const WS_REQUEST_SECURITY_TOKEN_PROPERTY_ISSUED_TOKEN_TYPE = 4;
pub const WS_REQUEST_SECURITY_TOKEN_PROPERTY_REQUEST_ACTION = 5;
pub const WS_REQUEST_SECURITY_TOKEN_PROPERTY_EXISTING_TOKEN = 6;
pub const WS_REQUEST_SECURITY_TOKEN_PROPERTY_ISSUED_TOKEN_KEY_TYPE = 7;
pub const WS_REQUEST_SECURITY_TOKEN_PROPERTY_ISSUED_TOKEN_KEY_SIZE = 8;
pub const WS_REQUEST_SECURITY_TOKEN_PROPERTY_ISSUED_TOKEN_KEY_ENTROPY = 9;
pub const WS_REQUEST_SECURITY_TOKEN_PROPERTY_LOCAL_REQUEST_PARAMETERS = 10;
pub const WS_REQUEST_SECURITY_TOKEN_PROPERTY_SERVICE_REQUEST_PARAMETERS = 11;
pub const WS_REQUEST_SECURITY_TOKEN_PROPERTY_MESSAGE_PROPERTIES = 12;
pub const WS_REQUEST_SECURITY_TOKEN_PROPERTY_BEARER_KEY_TYPE_VERSION = 13;
pub const WS_SECURITY_BEARER_KEY_TYPE_VERSION_1_3_ORIGINAL_SPECIFICATION = 1;
pub const WS_SECURITY_BEARER_KEY_TYPE_VERSION_1_3_ORIGINAL_SCHEMA = 2;
pub const WS_SECURITY_BEARER_KEY_TYPE_VERSION_1_3_ERRATA_01 = 3;
pub const WS_BOOL_TYPE = 0;
pub const WS_INT8_TYPE = 1;
pub const WS_INT16_TYPE = 2;
pub const WS_INT32_TYPE = 3;
pub const WS_INT64_TYPE = 4;
pub const WS_UINT8_TYPE = 5;
pub const WS_UINT16_TYPE = 6;
pub const WS_UINT32_TYPE = 7;
pub const WS_UINT64_TYPE = 8;
pub const WS_FLOAT_TYPE = 9;
pub const WS_DOUBLE_TYPE = 10;
pub const WS_DECIMAL_TYPE = 11;
pub const WS_DATETIME_TYPE = 12;
pub const WS_TIMESPAN_TYPE = 13;
pub const WS_GUID_TYPE = 14;
pub const WS_UNIQUE_ID_TYPE = 15;
pub const WS_STRING_TYPE = 16;
pub const WS_WSZ_TYPE = 17;
pub const WS_BYTES_TYPE = 18;
pub const WS_XML_STRING_TYPE = 19;
pub const WS_XML_QNAME_TYPE = 20;
pub const WS_XML_BUFFER_TYPE = 21;
pub const WS_CHAR_ARRAY_TYPE = 22;
pub const WS_UTF8_ARRAY_TYPE = 23;
pub const WS_BYTE_ARRAY_TYPE = 24;
pub const WS_DESCRIPTION_TYPE = 25;
pub const WS_STRUCT_TYPE = 26;
pub const WS_CUSTOM_TYPE = 27;
pub const WS_ENDPOINT_ADDRESS_TYPE = 28;
pub const WS_FAULT_TYPE = 29;
pub const WS_VOID_TYPE = 30;
pub const WS_ENUM_TYPE = 31;
pub const WS_DURATION_TYPE = 32;
pub const WS_UNION_TYPE = 33;
pub const WS_ANY_ATTRIBUTES_TYPE = 34;
pub const WS_TYPE_ATTRIBUTE_FIELD_MAPPING = 0;
pub const WS_ATTRIBUTE_FIELD_MAPPING = 1;
pub const WS_ELEMENT_FIELD_MAPPING = 2;
pub const WS_REPEATING_ELEMENT_FIELD_MAPPING = 3;
pub const WS_TEXT_FIELD_MAPPING = 4;
pub const WS_NO_FIELD_MAPPING = 5;
pub const WS_XML_ATTRIBUTE_FIELD_MAPPING = 6;
pub const WS_ELEMENT_CHOICE_FIELD_MAPPING = 7;
pub const WS_REPEATING_ELEMENT_CHOICE_FIELD_MAPPING = 8;
pub const WS_ANY_ELEMENT_FIELD_MAPPING = 9;
pub const WS_REPEATING_ANY_ELEMENT_FIELD_MAPPING = 10;
pub const WS_ANY_CONTENT_FIELD_MAPPING = 11;
pub const WS_ANY_ATTRIBUTES_FIELD_MAPPING = 12;
pub const WS_ELEMENT_TYPE_MAPPING = 1;
pub const WS_ATTRIBUTE_TYPE_MAPPING = 2;
pub const WS_ELEMENT_CONTENT_TYPE_MAPPING = 3;
pub const WS_ANY_ELEMENT_TYPE_MAPPING = 4;
pub const WS_READ_REQUIRED_VALUE = 1;
pub const WS_READ_REQUIRED_POINTER = 2;
pub const WS_READ_OPTIONAL_POINTER = 3;
pub const WS_READ_NILLABLE_POINTER = 4;
pub const WS_READ_NILLABLE_VALUE = 5;
pub const WS_WRITE_REQUIRED_VALUE = 1;
pub const WS_WRITE_REQUIRED_POINTER = 2;
pub const WS_WRITE_NILLABLE_VALUE = 3;
pub const WS_WRITE_NILLABLE_POINTER = 4;
pub const WS_SERVICE_HOST_ABORT = 0;
pub const WS_SERVICE_CHANNEL_FAULTED = 1;
pub const WS_NON_RPC_LITERAL_OPERATION = 0;
pub const WS_RPC_LITERAL_OPERATION = 1;
pub const WS_PARAMETER_TYPE_NORMAL = 0;
pub const WS_PARAMETER_TYPE_ARRAY = 1;
pub const WS_PARAMETER_TYPE_ARRAY_COUNT = 2;
pub const WS_PARAMETER_TYPE_MESSAGES = 3;
pub const WS_SERVICE_ENDPOINT_PROPERTY_ACCEPT_CHANNEL_CALLBACK = 0;
pub const WS_SERVICE_ENDPOINT_PROPERTY_CLOSE_CHANNEL_CALLBACK = 1;
pub const WS_SERVICE_ENDPOINT_PROPERTY_MAX_ACCEPTING_CHANNELS = 2;
pub const WS_SERVICE_ENDPOINT_PROPERTY_MAX_CONCURRENCY = 3;
pub const WS_SERVICE_ENDPOINT_PROPERTY_BODY_HEAP_MAX_SIZE = 4;
pub const WS_SERVICE_ENDPOINT_PROPERTY_BODY_HEAP_TRIM_SIZE = 5;
pub const WS_SERVICE_ENDPOINT_PROPERTY_MESSAGE_PROPERTIES = 6;
pub const WS_SERVICE_ENDPOINT_PROPERTY_MAX_CALL_POOL_SIZE = 7;
pub const WS_SERVICE_ENDPOINT_PROPERTY_MAX_CHANNEL_POOL_SIZE = 8;
pub const WS_SERVICE_ENDPOINT_PROPERTY_LISTENER_PROPERTIES = 9;
pub const WS_SERVICE_ENDPOINT_PROPERTY_CHECK_MUST_UNDERSTAND = 10;
pub const WS_SERVICE_ENDPOINT_PROPERTY_METADATA_EXCHANGE_TYPE = 11;
pub const WS_SERVICE_ENDPOINT_PROPERTY_METADATA = 12;
pub const WS_SERVICE_ENDPOINT_PROPERTY_METADATA_EXCHANGE_URL_SUFFIX = 13;
pub const WS_SERVICE_ENDPOINT_PROPERTY_MAX_CHANNELS = 14;
pub const WS_SERVICE_ENDPOINT_PROPERTY_MAX_CHANNELS_PER_IP = 15;
pub const WS_METADATA_EXCHANGE_TYPE_NONE = 0;
pub const WS_METADATA_EXCHANGE_TYPE_MEX = 1;
pub const WS_METADATA_EXCHANGE_TYPE_HTTP_GET = 2;
pub const WS_SERVICE_PROPERTY_HOST_USER_STATE = 0;
pub const WS_SERVICE_PROPERTY_FAULT_DISCLOSURE = 1;
pub const WS_SERVICE_PROPERTY_FAULT_LANGID = 2;
pub const WS_SERVICE_PROPERTY_HOST_STATE = 3;
pub const WS_SERVICE_PROPERTY_METADATA = 4;
pub const WS_SERVICE_PROPERTY_CLOSE_TIMEOUT = 5;
pub const WS_SERVICE_HOST_STATE_CREATED = 0;
pub const WS_SERVICE_HOST_STATE_OPENING = 1;
pub const WS_SERVICE_HOST_STATE_OPEN = 2;
pub const WS_SERVICE_HOST_STATE_CLOSING = 3;
pub const WS_SERVICE_HOST_STATE_CLOSED = 4;
pub const WS_SERVICE_HOST_STATE_FAULTED = 5;
pub const WS_SERVICE_PROXY_STATE_CREATED = 0;
pub const WS_SERVICE_PROXY_STATE_OPENING = 1;
pub const WS_SERVICE_PROXY_STATE_OPEN = 2;
pub const WS_SERVICE_PROXY_STATE_CLOSING = 3;
pub const WS_SERVICE_PROXY_STATE_CLOSED = 4;
pub const WS_SERVICE_PROXY_STATE_FAULTED = 5;
pub const WS_PROXY_PROPERTY_CALL_TIMEOUT = 0;
pub const WS_PROXY_PROPERTY_MESSAGE_PROPERTIES = 1;
pub const WS_PROXY_PROPERTY_MAX_CALL_POOL_SIZE = 2;
pub const WS_PROXY_PROPERTY_STATE = 3;
pub const WS_PROXY_PROPERTY_MAX_PENDING_CALLS = 4;
pub const WS_PROXY_PROPERTY_MAX_CLOSE_TIMEOUT = 5;
pub const WS_PROXY_FAULT_LANG_ID = 6;
pub const WS_CALL_PROPERTY_CHECK_MUST_UNDERSTAND = 0;
pub const WS_CALL_PROPERTY_SEND_MESSAGE_CONTEXT = 1;
pub const WS_CALL_PROPERTY_RECEIVE_MESSAGE_CONTEXT = 2;
pub const WS_CALL_PROPERTY_CALL_ID = 3;
pub const WS_TRACE_API_NONE = -1;
pub const WS_TRACE_API_START_READER_CANONICALIZATION = 0;
pub const WS_TRACE_API_END_READER_CANONICALIZATION = 1;
pub const WS_TRACE_API_START_WRITER_CANONICALIZATION = 2;
pub const WS_TRACE_API_END_WRITER_CANONICALIZATION = 3;
pub const WS_TRACE_API_CREATE_XML_BUFFER = 4;
pub const WS_TRACE_API_REMOVE_NODE = 5;
pub const WS_TRACE_API_CREATE_READER = 6;
pub const WS_TRACE_API_SET_INPUT = 7;
pub const WS_TRACE_API_SET_INPUT_TO_BUFFER = 8;
pub const WS_TRACE_API_FREE_XML_READER = 9;
pub const WS_TRACE_API_GET_READER_PROPERTY = 10;
pub const WS_TRACE_API_GET_READER_NODE = 11;
pub const WS_TRACE_API_FILL_READER = 12;
pub const WS_TRACE_API_READ_START_ELEMENT = 13;
pub const WS_TRACE_API_READ_TO_START_ELEMENT = 14;
pub const WS_TRACE_API_READ_START_ATTRIBUTE = 15;
pub const WS_TRACE_API_READ_END_ATTRIBUTE = 16;
pub const WS_TRACE_API_READ_NODE = 17;
pub const WS_TRACE_API_SKIP_NODE = 18;
pub const WS_TRACE_API_READ_END_ELEMENT = 19;
pub const WS_TRACE_API_FIND_ATTRIBUTE = 20;
pub const WS_TRACE_API_READ_ELEMENT_VALUE = 21;
pub const WS_TRACE_API_READ_CHARS = 22;
pub const WS_TRACE_API_READ_CHARS_UTF8 = 23;
pub const WS_TRACE_API_READ_BYTES = 24;
pub const WS_TRACE_API_READ_ARRAY = 25;
pub const WS_TRACE_API_GET_READER_POSITION = 26;
pub const WS_TRACE_API_SET_READER_POSITION = 27;
pub const WS_TRACE_API_MOVE_READER = 28;
pub const WS_TRACE_API_CREATE_WRITER = 29;
pub const WS_TRACE_API_FREE_XML_WRITER = 30;
pub const WS_TRACE_API_SET_OUTPUT = 31;
pub const WS_TRACE_API_SET_OUTPUT_TO_BUFFER = 32;
pub const WS_TRACE_API_GET_WRITER_PROPERTY = 33;
pub const WS_TRACE_API_FLUSH_WRITER = 34;
pub const WS_TRACE_API_WRITE_START_ELEMENT = 35;
pub const WS_TRACE_API_WRITE_END_START_ELEMENT = 36;
pub const WS_TRACE_API_WRITE_XMLNS_ATTRIBUTE = 37;
pub const WS_TRACE_API_WRITE_START_ATTRIBUTE = 38;
pub const WS_TRACE_API_WRITE_END_ATTRIBUTE = 39;
pub const WS_TRACE_API_WRITE_VALUE = 40;
pub const WS_TRACE_API_WRITE_XML_BUFFER = 41;
pub const WS_TRACE_API_READ_XML_BUFFER = 42;
pub const WS_TRACE_API_WRITE_XML_BUFFER_TO_BYTES = 43;
pub const WS_TRACE_API_READ_XML_BUFFER_FROM_BYTES = 44;
pub const WS_TRACE_API_WRITE_ARRAY = 45;
pub const WS_TRACE_API_WRITE_QUALIFIED_NAME = 46;
pub const WS_TRACE_API_WRITE_CHARS = 47;
pub const WS_TRACE_API_WRITE_CHARS_UTF8 = 48;
pub const WS_TRACE_API_WRITE_BYTES = 49;
pub const WS_TRACE_API_PUSH_BYTES = 50;
pub const WS_TRACE_API_PULL_BYTES = 51;
pub const WS_TRACE_API_WRITE_END_ELEMENT = 52;
pub const WS_TRACE_API_WRITE_TEXT = 53;
pub const WS_TRACE_API_WRITE_START_CDATA = 54;
pub const WS_TRACE_API_WRITE_END_CDATA = 55;
pub const WS_TRACE_API_WRITE_NODE = 56;
pub const WS_TRACE_API_PREFIX_FROM_NAMESPACE = 57;
pub const WS_TRACE_API_GET_WRITER_POSITION = 58;
pub const WS_TRACE_API_SET_WRITER_POSITION = 59;
pub const WS_TRACE_API_MOVE_WRITER = 60;
pub const WS_TRACE_API_TRIM_XML_WHITESPACE = 61;
pub const WS_TRACE_API_VERIFY_XML_NCNAME = 62;
pub const WS_TRACE_API_XML_STRING_EQUALS = 63;
pub const WS_TRACE_API_NAMESPACE_FROM_PREFIX = 64;
pub const WS_TRACE_API_READ_QUALIFIED_NAME = 65;
pub const WS_TRACE_API_GET_XML_ATTRIBUTE = 66;
pub const WS_TRACE_API_COPY_NODE = 67;
pub const WS_TRACE_API_ASYNC_EXECUTE = 68;
pub const WS_TRACE_API_CREATE_CHANNEL = 69;
pub const WS_TRACE_API_OPEN_CHANNEL = 70;
pub const WS_TRACE_API_SEND_MESSAGE = 71;
pub const WS_TRACE_API_RECEIVE_MESSAGE = 72;
pub const WS_TRACE_API_REQUEST_REPLY = 73;
pub const WS_TRACE_API_SEND_REPLY_MESSAGE = 74;
pub const WS_TRACE_API_SEND_FAULT_MESSAGE_FOR_ERROR = 75;
pub const WS_TRACE_API_GET_CHANNEL_PROPERTY = 76;
pub const WS_TRACE_API_SET_CHANNEL_PROPERTY = 77;
pub const WS_TRACE_API_WRITE_MESSAGE_START = 78;
pub const WS_TRACE_API_WRITE_MESSAGE_END = 79;
pub const WS_TRACE_API_READ_MESSAGE_START = 80;
pub const WS_TRACE_API_READ_MESSAGE_END = 81;
pub const WS_TRACE_API_CLOSE_CHANNEL = 82;
pub const WS_TRACE_API_ABORT_CHANNEL = 83;
pub const WS_TRACE_API_FREE_CHANNEL = 84;
pub const WS_TRACE_API_RESET_CHANNEL = 85;
pub const WS_TRACE_API_ABANDON_MESSAGE = 86;
pub const WS_TRACE_API_SHUTDOWN_SESSION_CHANNEL = 87;
pub const WS_TRACE_API_GET_CONTEXT_PROPERTY = 88;
pub const WS_TRACE_API_GET_DICTIONARY = 89;
pub const WS_TRACE_API_READ_ENDPOINT_ADDRESS_EXTENSION = 90;
pub const WS_TRACE_API_CREATE_ERROR = 91;
pub const WS_TRACE_API_ADD_ERROR_STRING = 92;
pub const WS_TRACE_API_GET_ERROR_STRING = 93;
pub const WS_TRACE_API_COPY_ERROR = 94;
pub const WS_TRACE_API_GET_ERROR_PROPERTY = 95;
pub const WS_TRACE_API_SET_ERROR_PROPERTY = 96;
pub const WS_TRACE_API_RESET_ERROR = 97;
pub const WS_TRACE_API_FREE_ERROR = 98;
pub const WS_TRACE_API_GET_FAULT_ERROR_PROPERTY = 99;
pub const WS_TRACE_API_SET_FAULT_ERROR_PROPERTY = 100;
pub const WS_TRACE_API_CREATE_FAULT_FROM_ERROR = 101;
pub const WS_TRACE_API_SET_FAULT_ERROR_DETAIL = 102;
pub const WS_TRACE_API_GET_FAULT_ERROR_DETAIL = 103;
pub const WS_TRACE_API_CREATE_HEAP = 104;
pub const WS_TRACE_API_ALLOC = 105;
pub const WS_TRACE_API_GET_HEAP_PROPERTY = 106;
pub const WS_TRACE_API_RESET_HEAP = 107;
pub const WS_TRACE_API_FREE_HEAP = 108;
pub const WS_TRACE_API_CREATE_LISTENER = 109;
pub const WS_TRACE_API_OPEN_LISTENER = 110;
pub const WS_TRACE_API_ACCEPT_CHANNEL = 111;
pub const WS_TRACE_API_CLOSE_LISTENER = 112;
pub const WS_TRACE_API_ABORT_LISTENER = 113;
pub const WS_TRACE_API_RESET_LISTENER = 114;
pub const WS_TRACE_API_FREE_LISTENER = 115;
pub const WS_TRACE_API_GET_LISTENER_PROPERTY = 116;
pub const WS_TRACE_API_SET_LISTENER_PROPERTY = 117;
pub const WS_TRACE_API_CREATE_CHANNEL_FOR_LISTENER = 118;
pub const WS_TRACE_API_CREATE_MESSAGE = 119;
pub const WS_TRACE_API_CREATE_MESSAGE_FOR_CHANNEL = 120;
pub const WS_TRACE_API_INITIALIZE_MESSAGE = 121;
pub const WS_TRACE_API_RESET_MESSAGE = 122;
pub const WS_TRACE_API_FREE_MESSAGE = 123;
pub const WS_TRACE_API_GET_HEADER_ATTRIBUTES = 124;
pub const WS_TRACE_API_GET_HEADER = 125;
pub const WS_TRACE_API_GET_CUSTOM_HEADER = 126;
pub const WS_TRACE_API_REMOVE_HEADER = 127;
pub const WS_TRACE_API_SET_HEADER = 128;
pub const WS_TRACE_API_REMOVE_CUSTOM_HEADER = 129;
pub const WS_TRACE_API_ADD_CUSTOM_HEADER = 130;
pub const WS_TRACE_API_ADD_MAPPED_HEADER = 131;
pub const WS_TRACE_API_REMOVE_MAPPED_HEADER = 132;
pub const WS_TRACE_API_GET_MAPPED_HEADER = 133;
pub const WS_TRACE_API_WRITE_BODY = 134;
pub const WS_TRACE_API_READ_BODY = 135;
pub const WS_TRACE_API_WRITE_ENVELOPE_START = 136;
pub const WS_TRACE_API_WRITE_ENVELOPE_END = 137;
pub const WS_TRACE_API_READ_ENVELOPE_START = 138;
pub const WS_TRACE_API_READ_ENVELOPE_END = 139;
pub const WS_TRACE_API_GET_MESSAGE_PROPERTY = 140;
pub const WS_TRACE_API_SET_MESSAGE_PROPERTY = 141;
pub const WS_TRACE_API_ADDRESS_MESSAGE = 142;
pub const WS_TRACE_API_CHECK_MUST_UNDERSTAND_HEADERS = 143;
pub const WS_TRACE_API_MARK_HEADER_AS_UNDERSTOOD = 144;
pub const WS_TRACE_API_FILL_BODY = 145;
pub const WS_TRACE_API_FLUSH_BODY = 146;
pub const WS_TRACE_API_REQUEST_SECURITY_TOKEN = 147;
pub const WS_TRACE_API_GET_SECURITY_TOKEN_PROPERTY = 148;
pub const WS_TRACE_API_CREATE_XML_SECURITY_TOKEN = 149;
pub const WS_TRACE_API_FREE_SECURITY_TOKEN = 150;
pub const WS_TRACE_API_REVOKE_SECURITY_CONTEXT = 151;
pub const WS_TRACE_API_GET_SECURITY_CONTEXT_PROPERTY = 152;
pub const WS_TRACE_API_READ_ELEMENT_TYPE = 153;
pub const WS_TRACE_API_READ_ATTRIBUTE_TYPE = 154;
pub const WS_TRACE_API_READ_TYPE = 155;
pub const WS_TRACE_API_WRITE_ELEMENT_TYPE = 156;
pub const WS_TRACE_API_WRITE_ATTRIBUTE_TYPE = 157;
pub const WS_TRACE_API_WRITE_TYPE = 158;
pub const WS_TRACE_API_SERVICE_REGISTER_FOR_CANCEL = 159;
pub const WS_TRACE_API_GET_SERVICE_HOST_PROPERTY = 160;
pub const WS_TRACE_API_CREATE_SERVICE_HOST = 161;
pub const WS_TRACE_API_OPEN_SERVICE_HOST = 162;
pub const WS_TRACE_API_CLOSE_SERVICE_HOST = 163;
pub const WS_TRACE_API_ABORT_SERVICE_HOST = 164;
pub const WS_TRACE_API_FREE_SERVICE_HOST = 165;
pub const WS_TRACE_API_RESET_SERVICE_HOST = 166;
pub const WS_TRACE_API_GET_SERVICE_PROXY_PROPERTY = 167;
pub const WS_TRACE_API_CREATE_SERVICE_PROXY = 168;
pub const WS_TRACE_API_OPEN_SERVICE_PROXY = 169;
pub const WS_TRACE_API_CLOSE_SERVICE_PROXY = 170;
pub const WS_TRACE_API_ABORT_SERVICE_PROXY = 171;
pub const WS_TRACE_API_FREE_SERVICE_PROXY = 172;
pub const WS_TRACE_API_RESET_SERVICE_PROXY = 173;
pub const WS_TRACE_API_ABORT_CALL = 174;
pub const WS_TRACE_API_CALL = 175;
pub const WS_TRACE_API_DECODE_URL = 176;
pub const WS_TRACE_API_ENCODE_URL = 177;
pub const WS_TRACE_API_COMBINE_URL = 178;
pub const WS_TRACE_API_DATETIME_TO_FILETIME = 179;
pub const WS_TRACE_API_FILETIME_TO_DATETIME = 180;
pub const WS_TRACE_API_DUMP_MEMORY = 181;
pub const WS_TRACE_API_SET_AUTOFAIL = 182;
pub const WS_TRACE_API_CREATE_METADATA = 183;
pub const WS_TRACE_API_READ_METADATA = 184;
pub const WS_TRACE_API_FREE_METADATA = 185;
pub const WS_TRACE_API_RESET_METADATA = 186;
pub const WS_TRACE_API_GET_METADATA_PROPERTY = 187;
pub const WS_TRACE_API_GET_MISSING_METADATA_DOCUMENT_ADDRESS = 188;
pub const WS_TRACE_API_GET_METADATA_ENDPOINTS = 189;
pub const WS_TRACE_API_MATCH_POLICY_ALTERNATIVE = 190;
pub const WS_TRACE_API_GET_POLICY_PROPERTY = 191;
pub const WS_TRACE_API_GET_POLICY_ALTERNATIVE_COUNT = 192;
pub const WS_TRACE_API_WS_CREATE_SERVICE_PROXY_FROM_TEMPLATE = 193;
pub const WS_TRACE_API_WS_CREATE_SERVICE_HOST_FROM_TEMPLATE = 194;
pub const WS_URL_HTTP_SCHEME_TYPE = 0;
pub const WS_URL_HTTPS_SCHEME_TYPE = 1;
pub const WS_URL_NETTCP_SCHEME_TYPE = 2;
pub const WS_URL_SOAPUDP_SCHEME_TYPE = 3;
pub const WS_URL_NETPIPE_SCHEME_TYPE = 4;
pub const WS_DATETIME_FORMAT_UTC = 0;
pub const WS_DATETIME_FORMAT_LOCAL = 1;
pub const WS_DATETIME_FORMAT_NONE = 2;
pub const WS_METADATA_STATE_CREATED = 1;
pub const WS_METADATA_STATE_RESOLVED = 2;
pub const WS_METADATA_STATE_FAULTED = 3;
pub const WS_METADATA_PROPERTY_STATE = 1;
pub const WS_METADATA_PROPERTY_HEAP_PROPERTIES = 2;
pub const WS_METADATA_PROPERTY_POLICY_PROPERTIES = 3;
pub const WS_METADATA_PROPERTY_HEAP_REQUESTED_SIZE = 4;
pub const WS_METADATA_PROPERTY_MAX_DOCUMENTS = 5;
pub const WS_METADATA_PROPERTY_HOST_NAMES = 6;
pub const WS_METADATA_PROPERTY_VERIFY_HOST_NAMES = 7;
pub const WS_POLICY_STATE_CREATED = 1;
pub const WS_POLICY_STATE_FAULTED = 2;
pub const WS_POLICY_PROPERTY_STATE = 1;
pub const WS_POLICY_PROPERTY_MAX_ALTERNATIVES = 2;
pub const WS_POLICY_PROPERTY_MAX_DEPTH = 3;
pub const WS_POLICY_PROPERTY_MAX_EXTENSIONS = 4;
pub const WS_SSL_TRANSPORT_SECURITY_BINDING_CONSTRAINT_TYPE = 1;
pub const WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_CONSTRAINT_TYPE = 2;
pub const WS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT_TYPE = 3;
pub const WS_USERNAME_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE = 4;
pub const WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE = 5;
pub const WS_ISSUED_TOKEN_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE = 6;
pub const WS_CERT_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE = 7;
pub const WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE = 8;
pub const WS_ENDPOINT_POLICY_EXTENSION_TYPE = 1;
pub const WS_HTTP_BINDING_TEMPLATE_TYPE = 0;
pub const WS_HTTP_SSL_BINDING_TEMPLATE_TYPE = 1;
pub const WS_HTTP_HEADER_AUTH_BINDING_TEMPLATE_TYPE = 2;
pub const WS_HTTP_SSL_HEADER_AUTH_BINDING_TEMPLATE_TYPE = 3;
pub const WS_HTTP_SSL_USERNAME_BINDING_TEMPLATE_TYPE = 4;
pub const WS_HTTP_SSL_KERBEROS_APREQ_BINDING_TEMPLATE_TYPE = 5;
pub const WS_TCP_BINDING_TEMPLATE_TYPE = 6;
pub const WS_TCP_SSPI_BINDING_TEMPLATE_TYPE = 7;
pub const WS_TCP_SSPI_USERNAME_BINDING_TEMPLATE_TYPE = 8;
pub const WS_TCP_SSPI_KERBEROS_APREQ_BINDING_TEMPLATE_TYPE = 9;
pub const WS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE = 10;
pub const WS_HTTP_SSL_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE = 11;
pub const WS_TCP_SSPI_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE = 12;
pub const WS_TCP_SSPI_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE = 13;
pub const WS_HTTP_HEADER_MAPPING_COMMA_SEPARATOR = 1;
pub const WS_HTTP_HEADER_MAPPING_SEMICOLON_SEPARATOR = 2;
pub const WS_HTTP_HEADER_MAPPING_QUOTED_VALUE = 4;
pub const WS_HTTP_RESPONSE_MAPPING_STATUS_CODE = 1;
pub const WS_HTTP_RESPONSE_MAPPING_STATUS_TEXT = 2;
pub const WS_HTTP_REQUEST_MAPPING_VERB = 2;
pub const WS_MATCH_URL_DNS_HOST = 1;
pub const WS_MATCH_URL_DNS_FULLY_QUALIFIED_HOST = 2;
pub const WS_MATCH_URL_NETBIOS_HOST = 4;
pub const WS_MATCH_URL_LOCAL_HOST = 8;
pub const WS_MATCH_URL_HOST_ADDRESSES = 16;
pub const WS_MATCH_URL_THIS_HOST = 31;
pub const WS_MATCH_URL_PORT = 32;
pub const WS_MATCH_URL_EXACT_PATH = 64;
pub const WS_MATCH_URL_PREFIX_PATH = 128;
pub const WS_MATCH_URL_NO_QUERY = 256;
pub const WS_MUST_UNDERSTAND_HEADER_ATTRIBUTE = 1;
pub const WS_RELAY_HEADER_ATTRIBUTE = 2;
pub const WS_HTTP_HEADER_AUTH_SCHEME_NONE = 1;
pub const WS_HTTP_HEADER_AUTH_SCHEME_BASIC = 2;
pub const WS_HTTP_HEADER_AUTH_SCHEME_DIGEST = 4;
pub const WS_HTTP_HEADER_AUTH_SCHEME_NTLM = 8;
pub const WS_HTTP_HEADER_AUTH_SCHEME_NEGOTIATE = 16;
pub const WS_HTTP_HEADER_AUTH_SCHEME_PASSPORT = 32;
pub const WS_CERT_FAILURE_CN_MISMATCH = 1;
pub const WS_CERT_FAILURE_INVALID_DATE = 2;
pub const WS_CERT_FAILURE_UNTRUSTED_ROOT = 4;
pub const WS_CERT_FAILURE_WRONG_USAGE = 8;
pub const WS_CERT_FAILURE_REVOCATION_OFFLINE = 16;
pub const WS_STRUCT_ABSTRACT = 1;
pub const WS_STRUCT_IGNORE_TRAILING_ELEMENT_CONTENT = 2;
pub const WS_STRUCT_IGNORE_UNHANDLED_ATTRIBUTES = 4;
pub const WS_FIELD_POINTER = 1;
pub const WS_FIELD_OPTIONAL = 2;
pub const WS_FIELD_NILLABLE = 4;
pub const WS_FIELD_NILLABLE_ITEM = 8;
pub const WS_FIELD_OTHER_NAMESPACE = 16;
pub const WS_SERVICE_OPERATION_MESSAGE_NILLABLE_ELEMENT = 1;
pub const WS_URL_FLAGS_ALLOW_HOST_WILDCARDS = 1;
pub const WS_URL_FLAGS_NO_PATH_COLLAPSE = 2;
pub const WS_URL_FLAGS_ZERO_TERMINATE = 4;

pub const aliases = struct {
    pub const WS_XML_READER_PROPERTY_ID = i32;
    pub const WS_XML_CANONICALIZATION_ALGORITHM = i32;
    pub const WS_XML_CANONICALIZATION_PROPERTY_ID = i32;
    pub const WS_XML_WRITER_PROPERTY_ID = i32;
    pub const WS_XML_BUFFER_PROPERTY_ID = i32;
    pub const WS_XML_TEXT_TYPE = i32;
    pub const WS_XML_NODE_TYPE = i32;
    pub const WS_MOVE_TO = i32;
    pub const WS_VALUE_TYPE = i32;
    pub const WS_XML_READER_INPUT_TYPE = i32;
    pub const WS_XML_READER_ENCODING_TYPE = i32;
    pub const WS_CHARSET = i32;
    pub const WS_XML_WRITER_ENCODING_TYPE = i32;
    pub const WS_XML_WRITER_OUTPUT_TYPE = i32;
    pub const WS_CALLBACK_MODEL = i32;
    pub const WS_ENCODING = i32;
    pub const WS_CHANNEL_STATE = i32;
    pub const WS_RECEIVE_OPTION = i32;
    pub const WS_CHANNEL_BINDING = i32;
    pub const WS_CHANNEL_TYPE = i32;
    pub const WS_TRANSFER_MODE = i32;
    pub const WS_HTTP_PROXY_SETTING_MODE = i32;
    pub const WS_CHANNEL_PROPERTY_ID = i32;
    pub const WS_COOKIE_MODE = i32;
    pub const WS_OPERATION_CONTEXT_PROPERTY_ID = i32;
    pub const WS_ENDPOINT_IDENTITY_TYPE = i32;
    pub const WS_ENDPOINT_ADDRESS_EXTENSION_TYPE = i32;
    pub const WS_ERROR_PROPERTY_ID = i32;
    pub const WS_EXCEPTION_CODE = i32;
    pub const WS_FAULT_ERROR_PROPERTY_ID = i32;
    pub const WS_FAULT_DISCLOSURE = i32;
    pub const WS_HEAP_PROPERTY_ID = i32;
    pub const WS_LISTENER_STATE = i32;
    pub const WS_LISTENER_PROPERTY_ID = i32;
    pub const WS_IP_VERSION = i32;
    pub const WS_MESSAGE_STATE = i32;
    pub const WS_MESSAGE_INITIALIZATION = i32;
    pub const WS_REPEATING_HEADER_OPTION = i32;
    pub const WS_HEADER_TYPE = i32;
    pub const WS_ADDRESSING_VERSION = i32;
    pub const WS_ENVELOPE_VERSION = i32;
    pub const WS_MESSAGE_PROPERTY_ID = i32;
    pub const WS_SECURITY_BINDING_TYPE = i32;
    pub const WS_HTTP_HEADER_AUTH_TARGET = i32;
    pub const WS_WINDOWS_INTEGRATED_AUTH_PACKAGE = i32;
    pub const WS_SECURITY_HEADER_VERSION = i32;
    pub const WS_TRUST_VERSION = i32;
    pub const WS_REQUEST_SECURITY_TOKEN_ACTION = i32;
    pub const WS_SECURE_CONVERSATION_VERSION = i32;
    pub const WS_SECURE_PROTOCOL = i32;
    pub const WS_SECURITY_TIMESTAMP_USAGE = i32;
    pub const WS_SECURITY_HEADER_LAYOUT = i32;
    pub const WS_SECURITY_ALGORITHM_PROPERTY_ID = i32;
    pub const WS_SECURITY_ALGORITHM_ID = i32;
    pub const WS_PROTECTION_LEVEL = i32;
    pub const WS_SECURITY_PROPERTY_ID = i32;
    pub const WS_SECURITY_KEY_TYPE = i32;
    pub const WS_SECURITY_ALGORITHM_SUITE_NAME = i32;
    pub const WS_SECURITY_TOKEN_REFERENCE_MODE = i32;
    pub const WS_SECURITY_KEY_ENTROPY_MODE = i32;
    pub const WS_EXTENDED_PROTECTION_POLICY = i32;
    pub const WS_EXTENDED_PROTECTION_SCENARIO = i32;
    pub const WS_SECURITY_BINDING_PROPERTY_ID = i32;
    pub const WS_CERT_CREDENTIAL_TYPE = i32;
    pub const WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE = i32;
    pub const WS_USERNAME_CREDENTIAL_TYPE = i32;
    pub const WS_SECURITY_TOKEN_PROPERTY_ID = i32;
    pub const WS_SECURITY_KEY_HANDLE_TYPE = i32;
    pub const WS_MESSAGE_SECURITY_USAGE = i32;
    pub const WS_SECURITY_CONTEXT_PROPERTY_ID = i32;
    pub const WS_XML_SECURITY_TOKEN_PROPERTY_ID = i32;
    pub const WS_SAML_AUTHENTICATOR_TYPE = i32;
    pub const WS_REQUEST_SECURITY_TOKEN_PROPERTY_ID = i32;
    pub const WS_SECURITY_BEARER_KEY_TYPE_VERSION = i32;
    pub const WS_TYPE = i32;
    pub const WS_FIELD_MAPPING = i32;
    pub const WS_TYPE_MAPPING = i32;
    pub const WS_READ_OPTION = i32;
    pub const WS_WRITE_OPTION = i32;
    pub const WS_SERVICE_CANCEL_REASON = i32;
    pub const WS_OPERATION_STYLE = i32;
    pub const WS_PARAMETER_TYPE = i32;
    pub const WS_SERVICE_ENDPOINT_PROPERTY_ID = i32;
    pub const WS_METADATA_EXCHANGE_TYPE = i32;
    pub const WS_SERVICE_PROPERTY_ID = i32;
    pub const WS_SERVICE_HOST_STATE = i32;
    pub const WS_SERVICE_PROXY_STATE = i32;
    pub const WS_PROXY_PROPERTY_ID = i32;
    pub const WS_CALL_PROPERTY_ID = i32;
    pub const WS_TRACE_API = i32;
    pub const WS_URL_SCHEME_TYPE = i32;
    pub const WS_DATETIME_FORMAT = i32;
    pub const WS_METADATA_STATE = i32;
    pub const WS_METADATA_PROPERTY_ID = i32;
    pub const WS_POLICY_STATE = i32;
    pub const WS_POLICY_PROPERTY_ID = i32;
    pub const WS_SECURITY_BINDING_CONSTRAINT_TYPE = i32;
    pub const WS_POLICY_EXTENSION_TYPE = i32;
    pub const WS_BINDING_TEMPLATE_TYPE = i32;
    pub const WS_CHANNEL = isize;
    pub const WS_ERROR = isize;
    pub const WS_HEAP = isize;
    pub const WS_LISTENER = isize;
    pub const WS_MESSAGE = isize;
    pub const WS_METADATA = isize;
    pub const WS_OPERATION_CONTEXT = isize;
    pub const WS_POLICY = isize;
    pub const WS_SECURITY_CONTEXT = isize;
    pub const WS_SECURITY_TOKEN = isize;
    pub const WS_SERVICE_HOST = isize;
    pub const WS_SERVICE_PROXY = isize;
    pub const WS_XML_BUFFER = isize;
    pub const WS_XML_READER = isize;
    pub const WS_XML_WRITER = isize;
    pub const WS_READ_CALLBACK = ?*const anyopaque;
    pub const WS_WRITE_CALLBACK = ?*const anyopaque;
    pub const WS_PUSH_BYTES_CALLBACK = ?*const anyopaque;
    pub const WS_PULL_BYTES_CALLBACK = ?*const anyopaque;
    pub const WS_DYNAMIC_STRING_CALLBACK = ?*const anyopaque;
    pub const WS_ASYNC_CALLBACK = ?*const anyopaque;
    pub const WS_ASYNC_FUNCTION = ?*const anyopaque;
    pub const WS_CREATE_CHANNEL_CALLBACK = ?*const anyopaque;
    pub const WS_FREE_CHANNEL_CALLBACK = ?*const anyopaque;
    pub const WS_RESET_CHANNEL_CALLBACK = ?*const anyopaque;
    pub const WS_ABORT_CHANNEL_CALLBACK = ?*const anyopaque;
    pub const WS_OPEN_CHANNEL_CALLBACK = ?*const anyopaque;
    pub const WS_CLOSE_CHANNEL_CALLBACK = ?*const anyopaque;
    pub const WS_SET_CHANNEL_PROPERTY_CALLBACK = ?*const anyopaque;
    pub const WS_GET_CHANNEL_PROPERTY_CALLBACK = ?*const anyopaque;
    pub const WS_READ_MESSAGE_START_CALLBACK = ?*const anyopaque;
    pub const WS_READ_MESSAGE_END_CALLBACK = ?*const anyopaque;
    pub const WS_WRITE_MESSAGE_START_CALLBACK = ?*const anyopaque;
    pub const WS_WRITE_MESSAGE_END_CALLBACK = ?*const anyopaque;
    pub const WS_ABANDON_MESSAGE_CALLBACK = ?*const anyopaque;
    pub const WS_SHUTDOWN_SESSION_CHANNEL_CALLBACK = ?*const anyopaque;
    pub const WS_CREATE_ENCODER_CALLBACK = ?*const anyopaque;
    pub const WS_ENCODER_GET_CONTENT_TYPE_CALLBACK = ?*const anyopaque;
    pub const WS_ENCODER_START_CALLBACK = ?*const anyopaque;
    pub const WS_ENCODER_ENCODE_CALLBACK = ?*const anyopaque;
    pub const WS_ENCODER_END_CALLBACK = ?*const anyopaque;
    pub const WS_FREE_ENCODER_CALLBACK = ?*const anyopaque;
    pub const WS_CREATE_DECODER_CALLBACK = ?*const anyopaque;
    pub const WS_DECODER_GET_CONTENT_TYPE_CALLBACK = ?*const anyopaque;
    pub const WS_DECODER_START_CALLBACK = ?*const anyopaque;
    pub const WS_DECODER_DECODE_CALLBACK = ?*const anyopaque;
    pub const WS_DECODER_END_CALLBACK = ?*const anyopaque;
    pub const WS_FREE_DECODER_CALLBACK = ?*const anyopaque;
    pub const WS_HTTP_REDIRECT_CALLBACK = ?*const anyopaque;
    pub const WS_CREATE_LISTENER_CALLBACK = ?*const anyopaque;
    pub const WS_FREE_LISTENER_CALLBACK = ?*const anyopaque;
    pub const WS_RESET_LISTENER_CALLBACK = ?*const anyopaque;
    pub const WS_OPEN_LISTENER_CALLBACK = ?*const anyopaque;
    pub const WS_CLOSE_LISTENER_CALLBACK = ?*const anyopaque;
    pub const WS_GET_LISTENER_PROPERTY_CALLBACK = ?*const anyopaque;
    pub const WS_SET_LISTENER_PROPERTY_CALLBACK = ?*const anyopaque;
    pub const WS_ACCEPT_CHANNEL_CALLBACK = ?*const anyopaque;
    pub const WS_ABORT_LISTENER_CALLBACK = ?*const anyopaque;
    pub const WS_CREATE_CHANNEL_FOR_LISTENER_CALLBACK = ?*const anyopaque;
    pub const WS_MESSAGE_DONE_CALLBACK = ?*const anyopaque;
    pub const WS_CERTIFICATE_VALIDATION_CALLBACK = ?*const anyopaque;
    pub const WS_GET_CERT_CALLBACK = ?*const anyopaque;
    pub const WS_CERT_ISSUER_LIST_NOTIFICATION_CALLBACK = ?*const anyopaque;
    pub const WS_VALIDATE_PASSWORD_CALLBACK = ?*const anyopaque;
    pub const WS_VALIDATE_SAML_CALLBACK = ?*const anyopaque;
    pub const WS_DURATION_COMPARISON_CALLBACK = ?*const anyopaque;
    pub const WS_READ_TYPE_CALLBACK = ?*const anyopaque;
    pub const WS_WRITE_TYPE_CALLBACK = ?*const anyopaque;
    pub const WS_IS_DEFAULT_VALUE_CALLBACK = ?*const anyopaque;
    pub const WS_SERVICE_MESSAGE_RECEIVE_CALLBACK = ?*const anyopaque;
    pub const WS_OPERATION_CANCEL_CALLBACK = ?*const anyopaque;
    pub const WS_OPERATION_FREE_STATE_CALLBACK = ?*const anyopaque;
    pub const WS_SERVICE_STUB_CALLBACK = ?*const anyopaque;
    pub const WS_SERVICE_ACCEPT_CHANNEL_CALLBACK = ?*const anyopaque;
    pub const WS_SERVICE_CLOSE_CHANNEL_CALLBACK = ?*const anyopaque;
    pub const WS_SERVICE_SECURITY_CALLBACK = ?*const anyopaque;
    pub const WS_PROXY_MESSAGE_CALLBACK = ?*const anyopaque;
};
