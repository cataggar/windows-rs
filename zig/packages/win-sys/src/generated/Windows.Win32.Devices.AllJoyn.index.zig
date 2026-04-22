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
    .{ "AllJoynConnectToBus", MethodRecord{ .library = "MSAJApi", .import = "AllJoynConnectToBus", .signature = "\x00\x01\x11\x80\x85\x11\x05" } },
    .{ "AllJoynCloseBusHandle", MethodRecord{ .library = "MSAJApi", .import = "AllJoynCloseBusHandle", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "AllJoynSendToBus", MethodRecord{ .library = "MSAJApi", .import = "AllJoynSendToBus", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x09\x0f\x09\x0f\x01" } },
    .{ "AllJoynReceiveFromBus", MethodRecord{ .library = "MSAJApi", .import = "AllJoynReceiveFromBus", .signature = "\x00\x05\x11\x59\x11\x80\x85\x0f\x01\x09\x0f\x09\x0f\x01" } },
    .{ "AllJoynEventSelect", MethodRecord{ .library = "MSAJApi", .import = "AllJoynEventSelect", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x80\x85\x09" } },
    .{ "AllJoynEnumEvents", MethodRecord{ .library = "MSAJApi", .import = "AllJoynEnumEvents", .signature = "\x00\x03\x11\x59\x11\x80\x85\x11\x80\x85\x0f\x09" } },
    .{ "AllJoynCreateBus", MethodRecord{ .library = "MSAJApi", .import = "AllJoynCreateBus", .signature = "\x00\x03\x11\x80\x85\x09\x09\x0f\x11\x8b\xb5" } },
    .{ "AllJoynAcceptBusConnection", MethodRecord{ .library = "MSAJApi", .import = "AllJoynAcceptBusConnection", .signature = "\x00\x02\x09\x11\x80\x85\x11\x80\x85" } },
    .{ "alljoyn_unity_deferred_callbacks_process", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_unity_deferred_callbacks_process", .signature = "\x00\x00\x08" } },
    .{ "alljoyn_unity_set_deferred_callback_mainthread_only", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_unity_set_deferred_callback_mainthread_only", .signature = "\x00\x01\x01\x08" } },
    .{ "QCC_StatusText", MethodRecord{ .library = "MSAJApi", .import = "QCC_StatusText", .signature = "\x00\x01\x11\x3d\x11\xa8\x49" } },
    .{ "alljoyn_msgarg_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_create", .signature = "\x00\x00\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_create_and_set", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_create_and_set", .signature = "\x05\x01\x11\xa8\x4d\x11\x3d" } },
    .{ "alljoyn_msgarg_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_destroy", .signature = "\x00\x01\x01\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_array_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_array_create", .signature = "\x00\x01\x11\xa8\x4d\x19" } },
    .{ "alljoyn_msgarg_array_element", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_array_element", .signature = "\x00\x02\x11\xa8\x4d\x11\xa8\x4d\x19" } },
    .{ "alljoyn_msgarg_set", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set", .signature = "\x05\x02\x11\xa8\x49\x11\xa8\x4d\x11\x3d" } },
    .{ "alljoyn_msgarg_get", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get", .signature = "\x05\x02\x11\xa8\x49\x11\xa8\x4d\x11\x3d" } },
    .{ "alljoyn_msgarg_copy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_copy", .signature = "\x00\x01\x11\xa8\x4d\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_clone", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_clone", .signature = "\x00\x02\x01\x11\xa8\x4d\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_equal", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_equal", .signature = "\x00\x02\x08\x11\xa8\x4d\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_array_set", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_array_set", .signature = "\x05\x03\x11\xa8\x49\x11\xa8\x4d\x0f\x19\x11\x3d" } },
    .{ "alljoyn_msgarg_array_get", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_array_get", .signature = "\x05\x03\x11\xa8\x49\x11\xa8\x4d\x19\x11\x3d" } },
    .{ "alljoyn_msgarg_tostring", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_tostring", .signature = "\x00\x04\x19\x11\xa8\x4d\x11\x3d\x19\x19" } },
    .{ "alljoyn_msgarg_array_tostring", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_array_tostring", .signature = "\x00\x05\x19\x11\xa8\x4d\x19\x11\x3d\x19\x19" } },
    .{ "alljoyn_msgarg_signature", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_signature", .signature = "\x00\x03\x19\x11\xa8\x4d\x11\x3d\x19" } },
    .{ "alljoyn_msgarg_array_signature", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_array_signature", .signature = "\x00\x04\x19\x11\xa8\x4d\x19\x11\x3d\x19" } },
    .{ "alljoyn_msgarg_hassignature", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_hassignature", .signature = "\x00\x02\x08\x11\xa8\x4d\x11\x3d" } },
    .{ "alljoyn_msgarg_getdictelement", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_getdictelement", .signature = "\x05\x02\x11\xa8\x49\x11\xa8\x4d\x11\x3d" } },
    .{ "alljoyn_msgarg_gettype", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_gettype", .signature = "\x00\x01\x11\xa8\x51\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_clear", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_clear", .signature = "\x00\x01\x01\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_stabilize", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_stabilize", .signature = "\x00\x01\x01\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_array_set_offset", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_array_set_offset", .signature = "\x05\x04\x11\xa8\x49\x11\xa8\x4d\x19\x0f\x19\x11\x3d" } },
    .{ "alljoyn_msgarg_set_and_stabilize", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_and_stabilize", .signature = "\x05\x02\x11\xa8\x49\x11\xa8\x4d\x11\x3d" } },
    .{ "alljoyn_msgarg_set_uint8", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_uint8", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x05" } },
    .{ "alljoyn_msgarg_set_bool", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_bool", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x08" } },
    .{ "alljoyn_msgarg_set_int16", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_int16", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x06" } },
    .{ "alljoyn_msgarg_set_uint16", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_uint16", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x07" } },
    .{ "alljoyn_msgarg_set_int32", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_int32", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x08" } },
    .{ "alljoyn_msgarg_set_uint32", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_uint32", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x09" } },
    .{ "alljoyn_msgarg_set_int64", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_int64", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0a" } },
    .{ "alljoyn_msgarg_set_uint64", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_uint64", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0b" } },
    .{ "alljoyn_msgarg_set_double", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_double", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0d" } },
    .{ "alljoyn_msgarg_set_string", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_string", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x11\x3d" } },
    .{ "alljoyn_msgarg_set_objectpath", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_objectpath", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x11\x3d" } },
    .{ "alljoyn_msgarg_set_signature", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_signature", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x11\x3d" } },
    .{ "alljoyn_msgarg_get_uint8", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_uint8", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0f\x05" } },
    .{ "alljoyn_msgarg_get_bool", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_bool", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0f\x08" } },
    .{ "alljoyn_msgarg_get_int16", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_int16", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0f\x06" } },
    .{ "alljoyn_msgarg_get_uint16", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_uint16", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0f\x07" } },
    .{ "alljoyn_msgarg_get_int32", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_int32", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0f\x08" } },
    .{ "alljoyn_msgarg_get_uint32", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_uint32", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0f\x09" } },
    .{ "alljoyn_msgarg_get_int64", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_int64", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0f\x0a" } },
    .{ "alljoyn_msgarg_get_uint64", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_uint64", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0f\x0b" } },
    .{ "alljoyn_msgarg_get_double", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_double", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0f\x0d" } },
    .{ "alljoyn_msgarg_get_string", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_string", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0f\x0f\x04" } },
    .{ "alljoyn_msgarg_get_objectpath", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_objectpath", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0f\x0f\x04" } },
    .{ "alljoyn_msgarg_get_signature", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_signature", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x0f\x0f\x04" } },
    .{ "alljoyn_msgarg_get_variant", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_variant", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x4d\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_set_uint8_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_uint8_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x19\x0f\x05" } },
    .{ "alljoyn_msgarg_set_bool_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_bool_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x19\x0f\x08" } },
    .{ "alljoyn_msgarg_set_int16_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_int16_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x19\x0f\x06" } },
    .{ "alljoyn_msgarg_set_uint16_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_uint16_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x19\x0f\x07" } },
    .{ "alljoyn_msgarg_set_int32_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_int32_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x19\x0f\x08" } },
    .{ "alljoyn_msgarg_set_uint32_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_uint32_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x19\x0f\x09" } },
    .{ "alljoyn_msgarg_set_int64_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_int64_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x19\x0f\x0a" } },
    .{ "alljoyn_msgarg_set_uint64_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_uint64_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x19\x0f\x0b" } },
    .{ "alljoyn_msgarg_set_double_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_double_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x19\x0f\x0d" } },
    .{ "alljoyn_msgarg_set_string_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_string_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x19\x0f\x0f\x04" } },
    .{ "alljoyn_msgarg_set_objectpath_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_objectpath_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x19\x0f\x0f\x04" } },
    .{ "alljoyn_msgarg_set_signature_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_set_signature_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x19\x0f\x0f\x04" } },
    .{ "alljoyn_msgarg_get_uint8_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_uint8_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x0f\x19\x0f\x05" } },
    .{ "alljoyn_msgarg_get_bool_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_bool_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x0f\x19\x0f\x08" } },
    .{ "alljoyn_msgarg_get_int16_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_int16_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x0f\x19\x0f\x06" } },
    .{ "alljoyn_msgarg_get_uint16_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_uint16_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x0f\x19\x0f\x07" } },
    .{ "alljoyn_msgarg_get_int32_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_int32_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x0f\x19\x0f\x08" } },
    .{ "alljoyn_msgarg_get_uint32_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_uint32_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x0f\x19\x0f\x09" } },
    .{ "alljoyn_msgarg_get_int64_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_int64_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x0f\x19\x0f\x0a" } },
    .{ "alljoyn_msgarg_get_uint64_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_uint64_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x0f\x19\x0f\x0b" } },
    .{ "alljoyn_msgarg_get_double_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_double_array", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x0f\x19\x0f\x0d" } },
    .{ "alljoyn_msgarg_get_variant_array", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_variant_array", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x4d\x11\x3d\x0f\x19\x0f\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_get_array_numberofelements", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_array_numberofelements", .signature = "\x00\x01\x19\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_get_array_element", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_array_element", .signature = "\x00\x03\x01\x11\xa8\x4d\x19\x0f\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_get_array_elementsignature", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_get_array_elementsignature", .signature = "\x00\x02\x11\x3d\x11\xa8\x4d\x19" } },
    .{ "alljoyn_msgarg_getkey", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_getkey", .signature = "\x00\x01\x11\xa8\x4d\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_getvalue", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_getvalue", .signature = "\x00\x01\x11\xa8\x4d\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_setdictentry", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_setdictentry", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x11\xa8\x4d\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_setstruct", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_setstruct", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x4d\x11\xa8\x4d\x19" } },
    .{ "alljoyn_msgarg_getnummembers", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_getnummembers", .signature = "\x00\x01\x19\x11\xa8\x4d" } },
    .{ "alljoyn_msgarg_getmember", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_msgarg_getmember", .signature = "\x00\x02\x11\xa8\x4d\x11\xa8\x4d\x19" } },
    .{ "alljoyn_aboutdata_create_empty", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_create_empty", .signature = "\x00\x00\x11\xa8\x55" } },
    .{ "alljoyn_aboutdata_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_create", .signature = "\x00\x01\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_create_full", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_create_full", .signature = "\x00\x02\x11\xa8\x55\x11\xa8\x4d\x11\x3d" } },
    .{ "alljoyn_aboutdata_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_destroy", .signature = "\x00\x01\x01\x11\xa8\x55" } },
    .{ "alljoyn_aboutdata_createfromxml", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_createfromxml", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_isvalid", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_isvalid", .signature = "\x00\x02\x05\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_createfrommsgarg", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_createfrommsgarg", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x55\x11\xa8\x4d\x11\x3d" } },
    .{ "alljoyn_aboutdata_setappid", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_setappid", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x55\x0f\x05\x19" } },
    .{ "alljoyn_aboutdata_setappid_fromstring", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_setappid_fromstring", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_getappid", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getappid", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x55\x0f\x0f\x05\x0f\x19" } },
    .{ "alljoyn_aboutdata_setdefaultlanguage", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_setdefaultlanguage", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_getdefaultlanguage", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getdefaultlanguage", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x0f\x0f\x04" } },
    .{ "alljoyn_aboutdata_setdevicename", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_setdevicename", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x55\x11\x3d\x11\x3d" } },
    .{ "alljoyn_aboutdata_getdevicename", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getdevicename", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x55\x0f\x0f\x04\x11\x3d" } },
    .{ "alljoyn_aboutdata_setdeviceid", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_setdeviceid", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_getdeviceid", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getdeviceid", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x0f\x0f\x04" } },
    .{ "alljoyn_aboutdata_setappname", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_setappname", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x55\x11\x3d\x11\x3d" } },
    .{ "alljoyn_aboutdata_getappname", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getappname", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x55\x0f\x0f\x04\x11\x3d" } },
    .{ "alljoyn_aboutdata_setmanufacturer", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_setmanufacturer", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x55\x11\x3d\x11\x3d" } },
    .{ "alljoyn_aboutdata_getmanufacturer", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getmanufacturer", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x55\x0f\x0f\x04\x11\x3d" } },
    .{ "alljoyn_aboutdata_setmodelnumber", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_setmodelnumber", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_getmodelnumber", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getmodelnumber", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x0f\x0f\x04" } },
    .{ "alljoyn_aboutdata_setsupportedlanguage", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_setsupportedlanguage", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_getsupportedlanguages", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getsupportedlanguages", .signature = "\x00\x03\x19\x11\xa8\x55\x0f\x0f\x04\x19" } },
    .{ "alljoyn_aboutdata_setdescription", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_setdescription", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x55\x11\x3d\x11\x3d" } },
    .{ "alljoyn_aboutdata_getdescription", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getdescription", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x55\x0f\x0f\x04\x11\x3d" } },
    .{ "alljoyn_aboutdata_setdateofmanufacture", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_setdateofmanufacture", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_getdateofmanufacture", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getdateofmanufacture", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x0f\x0f\x04" } },
    .{ "alljoyn_aboutdata_setsoftwareversion", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_setsoftwareversion", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_getsoftwareversion", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getsoftwareversion", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x0f\x0f\x04" } },
    .{ "alljoyn_aboutdata_getajsoftwareversion", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getajsoftwareversion", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x0f\x0f\x04" } },
    .{ "alljoyn_aboutdata_sethardwareversion", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_sethardwareversion", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_gethardwareversion", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_gethardwareversion", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x0f\x0f\x04" } },
    .{ "alljoyn_aboutdata_setsupporturl", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_setsupporturl", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_getsupporturl", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getsupporturl", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x0f\x0f\x04" } },
    .{ "alljoyn_aboutdata_setfield", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_setfield", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x55\x11\x3d\x11\xa8\x4d\x11\x3d" } },
    .{ "alljoyn_aboutdata_getfield", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getfield", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x55\x11\x3d\x0f\x11\xa8\x4d\x11\x3d" } },
    .{ "alljoyn_aboutdata_getfields", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getfields", .signature = "\x00\x03\x19\x11\xa8\x55\x0f\x0f\x04\x19" } },
    .{ "alljoyn_aboutdata_getaboutdata", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getaboutdata", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x55\x11\xa8\x4d\x11\x3d" } },
    .{ "alljoyn_aboutdata_getannouncedaboutdata", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getannouncedaboutdata", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x55\x11\xa8\x4d" } },
    .{ "alljoyn_aboutdata_isfieldrequired", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_isfieldrequired", .signature = "\x00\x02\x05\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_isfieldannounced", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_isfieldannounced", .signature = "\x00\x02\x05\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_isfieldlocalized", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_isfieldlocalized", .signature = "\x00\x02\x05\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_aboutdata_getfieldsignature", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdata_getfieldsignature", .signature = "\x00\x02\x11\x3d\x11\xa8\x55\x11\x3d" } },
    .{ "alljoyn_abouticon_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_abouticon_create", .signature = "\x00\x00\x11\xa8\x59" } },
    .{ "alljoyn_abouticon_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_abouticon_destroy", .signature = "\x00\x01\x01\x11\xa8\x59" } },
    .{ "alljoyn_abouticon_getcontent", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_abouticon_getcontent", .signature = "\x00\x03\x01\x11\xa8\x59\x0f\x0f\x05\x0f\x19" } },
    .{ "alljoyn_abouticon_setcontent", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_abouticon_setcontent", .signature = "\x00\x05\x11\xa8\x49\x11\xa8\x59\x11\x3d\x0f\x05\x19\x05" } },
    .{ "alljoyn_abouticon_geturl", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_abouticon_geturl", .signature = "\x00\x03\x01\x11\xa8\x59\x0f\x0f\x04\x0f\x0f\x04" } },
    .{ "alljoyn_abouticon_seturl", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_abouticon_seturl", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x59\x11\x3d\x11\x3d" } },
    .{ "alljoyn_abouticon_clear", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_abouticon_clear", .signature = "\x00\x01\x01\x11\xa8\x59" } },
    .{ "alljoyn_abouticon_setcontent_frommsgarg", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_abouticon_setcontent_frommsgarg", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x59\x11\xa8\x4d" } },
    .{ "alljoyn_permissionconfigurator_getdefaultclaimcapabilities", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_getdefaultclaimcapabilities", .signature = "\x00\x00\x07" } },
    .{ "alljoyn_permissionconfigurator_getapplicationstate", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_getapplicationstate", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x0f\x11\xa8\x61" } },
    .{ "alljoyn_permissionconfigurator_setapplicationstate", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_setapplicationstate", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x11\xa8\x61" } },
    .{ "alljoyn_permissionconfigurator_getpublickey", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_getpublickey", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x0f\x0f\x04" } },
    .{ "alljoyn_permissionconfigurator_publickey_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_publickey_destroy", .signature = "\x00\x01\x01\x0f\x04" } },
    .{ "alljoyn_permissionconfigurator_getmanifesttemplate", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_getmanifesttemplate", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x0f\x0f\x04" } },
    .{ "alljoyn_permissionconfigurator_manifesttemplate_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_manifesttemplate_destroy", .signature = "\x00\x01\x01\x0f\x04" } },
    .{ "alljoyn_permissionconfigurator_setmanifesttemplatefromxml", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_setmanifesttemplatefromxml", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x0f\x04" } },
    .{ "alljoyn_permissionconfigurator_getclaimcapabilities", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_getclaimcapabilities", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x0f\x07" } },
    .{ "alljoyn_permissionconfigurator_setclaimcapabilities", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_setclaimcapabilities", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x07" } },
    .{ "alljoyn_permissionconfigurator_getclaimcapabilitiesadditionalinfo", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_getclaimcapabilitiesadditionalinfo", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x0f\x07" } },
    .{ "alljoyn_permissionconfigurator_setclaimcapabilitiesadditionalinfo", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_setclaimcapabilitiesadditionalinfo", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x07" } },
    .{ "alljoyn_permissionconfigurator_reset", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_reset", .signature = "\x00\x01\x11\xa8\x49\x11\xa8\x5d" } },
    .{ "alljoyn_permissionconfigurator_claim", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_claim", .signature = "\x00\x08\x11\xa8\x49\x11\xa8\x5d\x0f\x04\x0f\x04\x0f\x05\x19\x0f\x04\x0f\x0f\x04\x19" } },
    .{ "alljoyn_permissionconfigurator_updateidentity", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_updateidentity", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x5d\x0f\x04\x0f\x0f\x04\x19" } },
    .{ "alljoyn_permissionconfigurator_getidentity", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_getidentity", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x0f\x0f\x04" } },
    .{ "alljoyn_permissionconfigurator_certificatechain_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_certificatechain_destroy", .signature = "\x00\x01\x01\x0f\x04" } },
    .{ "alljoyn_permissionconfigurator_getmanifests", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_getmanifests", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x0f\x11\xa8\x65" } },
    .{ "alljoyn_permissionconfigurator_manifestarray_cleanup", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_manifestarray_cleanup", .signature = "\x00\x01\x01\x0f\x11\xa8\x65" } },
    .{ "alljoyn_permissionconfigurator_installmanifests", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_installmanifests", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x5d\x0f\x0f\x04\x19\x08" } },
    .{ "alljoyn_permissionconfigurator_getidentitycertificateid", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_getidentitycertificateid", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x0f\x11\xa8\x69" } },
    .{ "alljoyn_permissionconfigurator_certificateid_cleanup", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_certificateid_cleanup", .signature = "\x00\x01\x01\x0f\x11\xa8\x69" } },
    .{ "alljoyn_permissionconfigurator_updatepolicy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_updatepolicy", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x0f\x04" } },
    .{ "alljoyn_permissionconfigurator_getpolicy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_getpolicy", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x0f\x0f\x04" } },
    .{ "alljoyn_permissionconfigurator_getdefaultpolicy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_getdefaultpolicy", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x0f\x0f\x04" } },
    .{ "alljoyn_permissionconfigurator_policy_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_policy_destroy", .signature = "\x00\x01\x01\x0f\x04" } },
    .{ "alljoyn_permissionconfigurator_resetpolicy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_resetpolicy", .signature = "\x00\x01\x11\xa8\x49\x11\xa8\x5d" } },
    .{ "alljoyn_permissionconfigurator_getmembershipsummaries", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_getmembershipsummaries", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x0f\x11\xa8\x6d" } },
    .{ "alljoyn_permissionconfigurator_certificateidarray_cleanup", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_certificateidarray_cleanup", .signature = "\x00\x01\x01\x0f\x11\xa8\x6d" } },
    .{ "alljoyn_permissionconfigurator_installmembership", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_installmembership", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x5d\x0f\x04" } },
    .{ "alljoyn_permissionconfigurator_removemembership", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_removemembership", .signature = "\x00\x06\x11\xa8\x49\x11\xa8\x5d\x0f\x05\x19\x0f\x04\x0f\x05\x19" } },
    .{ "alljoyn_permissionconfigurator_startmanagement", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_startmanagement", .signature = "\x00\x01\x11\xa8\x49\x11\xa8\x5d" } },
    .{ "alljoyn_permissionconfigurator_endmanagement", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurator_endmanagement", .signature = "\x00\x01\x11\xa8\x49\x11\xa8\x5d" } },
    .{ "alljoyn_applicationstatelistener_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_applicationstatelistener_create", .signature = "\x00\x02\x11\xa8\x71\x0f\x11\xa8\x75\x0f\x01" } },
    .{ "alljoyn_applicationstatelistener_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_applicationstatelistener_destroy", .signature = "\x00\x01\x01\x11\xa8\x71" } },
    .{ "alljoyn_keystorelistener_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_keystorelistener_create", .signature = "\x00\x02\x11\xa8\x79\x0f\x11\xa8\x7d\x0f\x01" } },
    .{ "alljoyn_keystorelistener_with_synchronization_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_keystorelistener_with_synchronization_create", .signature = "\x00\x02\x11\xa8\x79\x0f\x11\xa8\x81\x0f\x01" } },
    .{ "alljoyn_keystorelistener_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_keystorelistener_destroy", .signature = "\x00\x01\x01\x11\xa8\x79" } },
    .{ "alljoyn_keystorelistener_putkeys", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_keystorelistener_putkeys", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x79\x11\xa8\x85\x11\x3d\x11\x3d" } },
    .{ "alljoyn_keystorelistener_getkeys", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_keystorelistener_getkeys", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x79\x11\xa8\x85\x11\x3d\x0f\x19" } },
    .{ "alljoyn_sessionopts_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionopts_create", .signature = "\x00\x04\x11\xa8\x89\x05\x08\x05\x07" } },
    .{ "alljoyn_sessionopts_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionopts_destroy", .signature = "\x00\x01\x01\x11\xa8\x89" } },
    .{ "alljoyn_sessionopts_get_traffic", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionopts_get_traffic", .signature = "\x00\x01\x05\x11\xa8\x89" } },
    .{ "alljoyn_sessionopts_set_traffic", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionopts_set_traffic", .signature = "\x00\x02\x01\x11\xa8\x89\x05" } },
    .{ "alljoyn_sessionopts_get_multipoint", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionopts_get_multipoint", .signature = "\x00\x01\x08\x11\xa8\x89" } },
    .{ "alljoyn_sessionopts_set_multipoint", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionopts_set_multipoint", .signature = "\x00\x02\x01\x11\xa8\x89\x08" } },
    .{ "alljoyn_sessionopts_get_proximity", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionopts_get_proximity", .signature = "\x00\x01\x05\x11\xa8\x89" } },
    .{ "alljoyn_sessionopts_set_proximity", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionopts_set_proximity", .signature = "\x00\x02\x01\x11\xa8\x89\x05" } },
    .{ "alljoyn_sessionopts_get_transports", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionopts_get_transports", .signature = "\x00\x01\x07\x11\xa8\x89" } },
    .{ "alljoyn_sessionopts_set_transports", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionopts_set_transports", .signature = "\x00\x02\x01\x11\xa8\x89\x07" } },
    .{ "alljoyn_sessionopts_iscompatible", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionopts_iscompatible", .signature = "\x00\x02\x08\x11\xa8\x89\x11\xa8\x89" } },
    .{ "alljoyn_sessionopts_cmp", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionopts_cmp", .signature = "\x00\x02\x08\x11\xa8\x89\x11\xa8\x89" } },
    .{ "alljoyn_message_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_create", .signature = "\x00\x01\x11\xa8\x8d\x11\xa8\x91" } },
    .{ "alljoyn_message_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_destroy", .signature = "\x00\x01\x01\x11\xa8\x8d" } },
    .{ "alljoyn_message_isbroadcastsignal", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_isbroadcastsignal", .signature = "\x00\x01\x08\x11\xa8\x8d" } },
    .{ "alljoyn_message_isglobalbroadcast", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_isglobalbroadcast", .signature = "\x00\x01\x08\x11\xa8\x8d" } },
    .{ "alljoyn_message_issessionless", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_issessionless", .signature = "\x00\x01\x08\x11\xa8\x8d" } },
    .{ "alljoyn_message_getflags", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getflags", .signature = "\x00\x01\x05\x11\xa8\x8d" } },
    .{ "alljoyn_message_isexpired", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_isexpired", .signature = "\x00\x02\x08\x11\xa8\x8d\x0f\x09" } },
    .{ "alljoyn_message_isunreliable", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_isunreliable", .signature = "\x00\x01\x08\x11\xa8\x8d" } },
    .{ "alljoyn_message_isencrypted", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_isencrypted", .signature = "\x00\x01\x08\x11\xa8\x8d" } },
    .{ "alljoyn_message_getauthmechanism", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getauthmechanism", .signature = "\x00\x01\x11\x3d\x11\xa8\x8d" } },
    .{ "alljoyn_message_gettype", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_gettype", .signature = "\x00\x01\x11\xa8\x95\x11\xa8\x8d" } },
    .{ "alljoyn_message_getargs", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getargs", .signature = "\x00\x03\x01\x11\xa8\x8d\x0f\x19\x0f\x11\xa8\x4d" } },
    .{ "alljoyn_message_getarg", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getarg", .signature = "\x00\x02\x11\xa8\x4d\x11\xa8\x8d\x19" } },
    .{ "alljoyn_message_parseargs", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_parseargs", .signature = "\x05\x02\x11\xa8\x49\x11\xa8\x8d\x11\x3d" } },
    .{ "alljoyn_message_getcallserial", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getcallserial", .signature = "\x00\x01\x09\x11\xa8\x8d" } },
    .{ "alljoyn_message_getsignature", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getsignature", .signature = "\x00\x01\x11\x3d\x11\xa8\x8d" } },
    .{ "alljoyn_message_getobjectpath", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getobjectpath", .signature = "\x00\x01\x11\x3d\x11\xa8\x8d" } },
    .{ "alljoyn_message_getinterface", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getinterface", .signature = "\x00\x01\x11\x3d\x11\xa8\x8d" } },
    .{ "alljoyn_message_getmembername", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getmembername", .signature = "\x00\x01\x11\x3d\x11\xa8\x8d" } },
    .{ "alljoyn_message_getreplyserial", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getreplyserial", .signature = "\x00\x01\x09\x11\xa8\x8d" } },
    .{ "alljoyn_message_getsender", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getsender", .signature = "\x00\x01\x11\x3d\x11\xa8\x8d" } },
    .{ "alljoyn_message_getreceiveendpointname", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getreceiveendpointname", .signature = "\x00\x01\x11\x3d\x11\xa8\x8d" } },
    .{ "alljoyn_message_getdestination", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getdestination", .signature = "\x00\x01\x11\x3d\x11\xa8\x8d" } },
    .{ "alljoyn_message_getcompressiontoken", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getcompressiontoken", .signature = "\x00\x01\x09\x11\xa8\x8d" } },
    .{ "alljoyn_message_getsessionid", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_getsessionid", .signature = "\x00\x01\x09\x11\xa8\x8d" } },
    .{ "alljoyn_message_geterrorname", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_geterrorname", .signature = "\x00\x03\x11\x3d\x11\xa8\x8d\x11\x3d\x0f\x19" } },
    .{ "alljoyn_message_tostring", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_tostring", .signature = "\x00\x03\x19\x11\xa8\x8d\x11\x3d\x19" } },
    .{ "alljoyn_message_description", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_description", .signature = "\x00\x03\x19\x11\xa8\x8d\x11\x3d\x19" } },
    .{ "alljoyn_message_gettimestamp", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_gettimestamp", .signature = "\x00\x01\x09\x11\xa8\x8d" } },
    .{ "alljoyn_message_eql", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_eql", .signature = "\x00\x02\x08\x11\xa8\x8d\x11\xa8\x8d" } },
    .{ "alljoyn_message_setendianess", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_message_setendianess", .signature = "\x00\x01\x01\x04" } },
    .{ "alljoyn_authlistener_requestcredentialsresponse", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_authlistener_requestcredentialsresponse", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x99\x0f\x01\x08\x11\xa8\x9d" } },
    .{ "alljoyn_authlistener_verifycredentialsresponse", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_authlistener_verifycredentialsresponse", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x99\x0f\x01\x08" } },
    .{ "alljoyn_authlistener_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_authlistener_create", .signature = "\x00\x02\x11\xa8\x99\x0f\x11\xa8\xa1\x0f\x01" } },
    .{ "alljoyn_authlistenerasync_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_authlistenerasync_create", .signature = "\x00\x02\x11\xa8\x99\x0f\x11\xa8\xa5\x0f\x01" } },
    .{ "alljoyn_authlistener_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_authlistener_destroy", .signature = "\x00\x01\x01\x11\xa8\x99" } },
    .{ "alljoyn_authlistenerasync_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_authlistenerasync_destroy", .signature = "\x00\x01\x01\x11\xa8\x99" } },
    .{ "alljoyn_authlistener_setsharedsecret", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_authlistener_setsharedsecret", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x99\x0f\x05\x19" } },
    .{ "alljoyn_credentials_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_create", .signature = "\x00\x00\x11\xa8\x9d" } },
    .{ "alljoyn_credentials_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_destroy", .signature = "\x00\x01\x01\x11\xa8\x9d" } },
    .{ "alljoyn_credentials_isset", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_isset", .signature = "\x00\x02\x08\x11\xa8\x9d\x07" } },
    .{ "alljoyn_credentials_setpassword", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_setpassword", .signature = "\x00\x02\x01\x11\xa8\x9d\x11\x3d" } },
    .{ "alljoyn_credentials_setusername", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_setusername", .signature = "\x00\x02\x01\x11\xa8\x9d\x11\x3d" } },
    .{ "alljoyn_credentials_setcertchain", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_setcertchain", .signature = "\x00\x02\x01\x11\xa8\x9d\x11\x3d" } },
    .{ "alljoyn_credentials_setprivatekey", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_setprivatekey", .signature = "\x00\x02\x01\x11\xa8\x9d\x11\x3d" } },
    .{ "alljoyn_credentials_setlogonentry", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_setlogonentry", .signature = "\x00\x02\x01\x11\xa8\x9d\x11\x3d" } },
    .{ "alljoyn_credentials_setexpiration", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_setexpiration", .signature = "\x00\x02\x01\x11\xa8\x9d\x09" } },
    .{ "alljoyn_credentials_getpassword", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_getpassword", .signature = "\x00\x01\x11\x3d\x11\xa8\x9d" } },
    .{ "alljoyn_credentials_getusername", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_getusername", .signature = "\x00\x01\x11\x3d\x11\xa8\x9d" } },
    .{ "alljoyn_credentials_getcertchain", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_getcertchain", .signature = "\x00\x01\x11\x3d\x11\xa8\x9d" } },
    .{ "alljoyn_credentials_getprivateKey", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_getprivateKey", .signature = "\x00\x01\x11\x3d\x11\xa8\x9d" } },
    .{ "alljoyn_credentials_getlogonentry", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_getlogonentry", .signature = "\x00\x01\x11\x3d\x11\xa8\x9d" } },
    .{ "alljoyn_credentials_getexpiration", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_getexpiration", .signature = "\x00\x01\x09\x11\xa8\x9d" } },
    .{ "alljoyn_credentials_clear", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_credentials_clear", .signature = "\x00\x01\x01\x11\xa8\x9d" } },
    .{ "alljoyn_buslistener_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_buslistener_create", .signature = "\x00\x02\x11\xa8\xa9\x0f\x11\xa8\xad\x0f\x01" } },
    .{ "alljoyn_buslistener_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_buslistener_destroy", .signature = "\x00\x01\x01\x11\xa8\xa9" } },
    .{ "alljoyn_interfacedescription_member_getannotationscount", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_member_getannotationscount", .signature = "\x00\x01\x19\x11\xa8\xb1" } },
    .{ "alljoyn_interfacedescription_member_getannotationatindex", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_member_getannotationatindex", .signature = "\x00\x06\x01\x11\xa8\xb1\x19\x11\x3d\x0f\x19\x11\x3d\x0f\x19" } },
    .{ "alljoyn_interfacedescription_member_getannotation", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_member_getannotation", .signature = "\x00\x04\x08\x11\xa8\xb1\x11\x3d\x11\x3d\x0f\x19" } },
    .{ "alljoyn_interfacedescription_member_getargannotationscount", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_member_getargannotationscount", .signature = "\x00\x02\x19\x11\xa8\xb1\x11\x3d" } },
    .{ "alljoyn_interfacedescription_member_getargannotationatindex", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_member_getargannotationatindex", .signature = "\x00\x07\x01\x11\xa8\xb1\x11\x3d\x19\x11\x3d\x0f\x19\x11\x3d\x0f\x19" } },
    .{ "alljoyn_interfacedescription_member_getargannotation", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_member_getargannotation", .signature = "\x00\x05\x08\x11\xa8\xb1\x11\x3d\x11\x3d\x11\x3d\x0f\x19" } },
    .{ "alljoyn_interfacedescription_property_getannotationscount", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_property_getannotationscount", .signature = "\x00\x01\x19\x11\xa8\xb5" } },
    .{ "alljoyn_interfacedescription_property_getannotationatindex", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_property_getannotationatindex", .signature = "\x00\x06\x01\x11\xa8\xb5\x19\x11\x3d\x0f\x19\x11\x3d\x0f\x19" } },
    .{ "alljoyn_interfacedescription_property_getannotation", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_property_getannotation", .signature = "\x00\x04\x08\x11\xa8\xb5\x11\x3d\x11\x3d\x0f\x19" } },
    .{ "alljoyn_interfacedescription_activate", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_activate", .signature = "\x00\x01\x01\x11\xa8\xb9" } },
    .{ "alljoyn_interfacedescription_addannotation", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_addannotation", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\xb9\x11\x3d\x11\x3d" } },
    .{ "alljoyn_interfacedescription_getannotation", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getannotation", .signature = "\x00\x04\x08\x11\xa8\xb9\x11\x3d\x11\x3d\x0f\x19" } },
    .{ "alljoyn_interfacedescription_getannotationscount", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getannotationscount", .signature = "\x00\x01\x19\x11\xa8\xb9" } },
    .{ "alljoyn_interfacedescription_getannotationatindex", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getannotationatindex", .signature = "\x00\x06\x01\x11\xa8\xb9\x19\x11\x3d\x0f\x19\x11\x3d\x0f\x19" } },
    .{ "alljoyn_interfacedescription_getmember", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getmember", .signature = "\x00\x03\x08\x11\xa8\xb9\x11\x3d\x0f\x11\xa8\xb1" } },
    .{ "alljoyn_interfacedescription_addmember", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_addmember", .signature = "\x00\x07\x11\xa8\x49\x11\xa8\xb9\x11\xa8\x95\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x05" } },
    .{ "alljoyn_interfacedescription_addmemberannotation", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_addmemberannotation", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\xb9\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "alljoyn_interfacedescription_getmemberannotation", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getmemberannotation", .signature = "\x00\x05\x08\x11\xa8\xb9\x11\x3d\x11\x3d\x11\x3d\x0f\x19" } },
    .{ "alljoyn_interfacedescription_getmembers", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getmembers", .signature = "\x00\x03\x19\x11\xa8\xb9\x0f\x11\xa8\xb1\x19" } },
    .{ "alljoyn_interfacedescription_hasmember", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_hasmember", .signature = "\x00\x04\x08\x11\xa8\xb9\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "alljoyn_interfacedescription_addmethod", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_addmethod", .signature = "\x00\x07\x11\xa8\x49\x11\xa8\xb9\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x05\x11\x3d" } },
    .{ "alljoyn_interfacedescription_getmethod", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getmethod", .signature = "\x00\x03\x08\x11\xa8\xb9\x11\x3d\x0f\x11\xa8\xb1" } },
    .{ "alljoyn_interfacedescription_addsignal", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_addsignal", .signature = "\x00\x06\x11\xa8\x49\x11\xa8\xb9\x11\x3d\x11\x3d\x11\x3d\x05\x11\x3d" } },
    .{ "alljoyn_interfacedescription_getsignal", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getsignal", .signature = "\x00\x03\x08\x11\xa8\xb9\x11\x3d\x0f\x11\xa8\xb1" } },
    .{ "alljoyn_interfacedescription_getproperty", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getproperty", .signature = "\x00\x03\x08\x11\xa8\xb9\x11\x3d\x0f\x11\xa8\xb5" } },
    .{ "alljoyn_interfacedescription_getproperties", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getproperties", .signature = "\x00\x03\x19\x11\xa8\xb9\x0f\x11\xa8\xb5\x19" } },
    .{ "alljoyn_interfacedescription_addproperty", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_addproperty", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\xb9\x11\x3d\x11\x3d\x05" } },
    .{ "alljoyn_interfacedescription_addpropertyannotation", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_addpropertyannotation", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\xb9\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "alljoyn_interfacedescription_getpropertyannotation", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getpropertyannotation", .signature = "\x00\x05\x08\x11\xa8\xb9\x11\x3d\x11\x3d\x11\x3d\x0f\x19" } },
    .{ "alljoyn_interfacedescription_hasproperty", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_hasproperty", .signature = "\x00\x02\x08\x11\xa8\xb9\x11\x3d" } },
    .{ "alljoyn_interfacedescription_hasproperties", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_hasproperties", .signature = "\x00\x01\x08\x11\xa8\xb9" } },
    .{ "alljoyn_interfacedescription_getname", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getname", .signature = "\x00\x01\x11\x3d\x11\xa8\xb9" } },
    .{ "alljoyn_interfacedescription_introspect", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_introspect", .signature = "\x00\x04\x19\x11\xa8\xb9\x11\x3d\x19\x19" } },
    .{ "alljoyn_interfacedescription_issecure", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_issecure", .signature = "\x00\x01\x08\x11\xa8\xb9" } },
    .{ "alljoyn_interfacedescription_getsecuritypolicy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getsecuritypolicy", .signature = "\x00\x01\x11\xa8\xbd\x11\xa8\xb9" } },
    .{ "alljoyn_interfacedescription_setdescriptionlanguage", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_setdescriptionlanguage", .signature = "\x00\x02\x01\x11\xa8\xb9\x11\x3d" } },
    .{ "alljoyn_interfacedescription_getdescriptionlanguages", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getdescriptionlanguages", .signature = "\x00\x03\x19\x11\xa8\xb9\x0f\x0f\x04\x19" } },
    .{ "alljoyn_interfacedescription_getdescriptionlanguages2", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getdescriptionlanguages2", .signature = "\x00\x03\x19\x11\xa8\xb9\x11\x3d\x19" } },
    .{ "alljoyn_interfacedescription_setdescription", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_setdescription", .signature = "\x00\x02\x01\x11\xa8\xb9\x11\x3d" } },
    .{ "alljoyn_interfacedescription_setdescriptionforlanguage", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_setdescriptionforlanguage", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\xb9\x11\x3d\x11\x3d" } },
    .{ "alljoyn_interfacedescription_getdescriptionforlanguage", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getdescriptionforlanguage", .signature = "\x00\x04\x19\x11\xa8\xb9\x11\x3d\x19\x11\x3d" } },
    .{ "alljoyn_interfacedescription_setmemberdescription", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_setmemberdescription", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\xb9\x11\x3d\x11\x3d" } },
    .{ "alljoyn_interfacedescription_setmemberdescriptionforlanguage", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_setmemberdescriptionforlanguage", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\xb9\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "alljoyn_interfacedescription_getmemberdescriptionforlanguage", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getmemberdescriptionforlanguage", .signature = "\x00\x05\x19\x11\xa8\xb9\x11\x3d\x11\x3d\x19\x11\x3d" } },
    .{ "alljoyn_interfacedescription_setargdescription", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_setargdescription", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\xb9\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "alljoyn_interfacedescription_setargdescriptionforlanguage", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_setargdescriptionforlanguage", .signature = "\x00\x05\x11\xa8\x49\x11\xa8\xb9\x11\x3d\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "alljoyn_interfacedescription_getargdescriptionforlanguage", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getargdescriptionforlanguage", .signature = "\x00\x06\x19\x11\xa8\xb9\x11\x3d\x11\x3d\x11\x3d\x19\x11\x3d" } },
    .{ "alljoyn_interfacedescription_setpropertydescription", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_setpropertydescription", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\xb9\x11\x3d\x11\x3d" } },
    .{ "alljoyn_interfacedescription_setpropertydescriptionforlanguage", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_setpropertydescriptionforlanguage", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\xb9\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "alljoyn_interfacedescription_getpropertydescriptionforlanguage", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getpropertydescriptionforlanguage", .signature = "\x00\x05\x19\x11\xa8\xb9\x11\x3d\x11\x3d\x19\x11\x3d" } },
    .{ "alljoyn_interfacedescription_setdescriptiontranslationcallback", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_setdescriptiontranslationcallback", .signature = "\x00\x02\x01\x11\xa8\xb9\x12\xa8\xc1" } },
    .{ "alljoyn_interfacedescription_getdescriptiontranslationcallback", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getdescriptiontranslationcallback", .signature = "\x00\x01\x12\xa8\xc1\x11\xa8\xb9" } },
    .{ "alljoyn_interfacedescription_hasdescription", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_hasdescription", .signature = "\x00\x01\x08\x11\xa8\xb9" } },
    .{ "alljoyn_interfacedescription_addargannotation", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_addargannotation", .signature = "\x00\x05\x11\xa8\x49\x11\xa8\xb9\x11\x3d\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "alljoyn_interfacedescription_getmemberargannotation", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_getmemberargannotation", .signature = "\x00\x06\x08\x11\xa8\xb9\x11\x3d\x11\x3d\x11\x3d\x11\x3d\x0f\x19" } },
    .{ "alljoyn_interfacedescription_eql", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_eql", .signature = "\x00\x02\x08\x11\xa8\xb9\x11\xa8\xb9" } },
    .{ "alljoyn_interfacedescription_member_eql", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_member_eql", .signature = "\x00\x02\x08\x11\xa8\xb1\x11\xa8\xb1" } },
    .{ "alljoyn_interfacedescription_property_eql", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_interfacedescription_property_eql", .signature = "\x00\x02\x08\x11\xa8\xb5\x11\xa8\xb5" } },
    .{ "alljoyn_busobject_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_create", .signature = "\x00\x04\x11\xa8\xc5\x11\x3d\x08\x0f\x11\xa8\xc9\x0f\x01" } },
    .{ "alljoyn_busobject_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_destroy", .signature = "\x00\x01\x01\x11\xa8\xc5" } },
    .{ "alljoyn_busobject_getpath", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_getpath", .signature = "\x00\x01\x11\x3d\x11\xa8\xc5" } },
    .{ "alljoyn_busobject_emitpropertychanged", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_emitpropertychanged", .signature = "\x00\x05\x01\x11\xa8\xc5\x11\x3d\x11\x3d\x11\xa8\x4d\x09" } },
    .{ "alljoyn_busobject_emitpropertieschanged", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_emitpropertieschanged", .signature = "\x00\x05\x01\x11\xa8\xc5\x11\x3d\x0f\x0f\x04\x19\x09" } },
    .{ "alljoyn_busobject_getname", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_getname", .signature = "\x00\x03\x19\x11\xa8\xc5\x11\x3d\x19" } },
    .{ "alljoyn_busobject_addinterface", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_addinterface", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\xc5\x11\xa8\xb9" } },
    .{ "alljoyn_busobject_addmethodhandler", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_addmethodhandler", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\xc5\x11\xa8\xb1\x12\xa8\xcd\x0f\x01" } },
    .{ "alljoyn_busobject_addmethodhandlers", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_addmethodhandlers", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\xc5\x0f\x11\xa8\xd1\x19" } },
    .{ "alljoyn_busobject_methodreply_args", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_methodreply_args", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\xc5\x11\xa8\x8d\x11\xa8\x4d\x19" } },
    .{ "alljoyn_busobject_methodreply_err", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_methodreply_err", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\xc5\x11\xa8\x8d\x11\x3d\x11\x3d" } },
    .{ "alljoyn_busobject_methodreply_status", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_methodreply_status", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\xc5\x11\xa8\x8d\x11\xa8\x49" } },
    .{ "alljoyn_busobject_getbusattachment", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_getbusattachment", .signature = "\x00\x01\x11\xa8\x91\x11\xa8\xc5" } },
    .{ "alljoyn_busobject_signal", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_signal", .signature = "\x00\x09\x11\xa8\x49\x11\xa8\xc5\x11\x3d\x09\x11\xa8\xb1\x11\xa8\x4d\x19\x07\x05\x11\xa8\x8d" } },
    .{ "alljoyn_busobject_cancelsessionlessmessage_serial", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_cancelsessionlessmessage_serial", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\xc5\x09" } },
    .{ "alljoyn_busobject_cancelsessionlessmessage", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_cancelsessionlessmessage", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\xc5\x11\xa8\x8d" } },
    .{ "alljoyn_busobject_issecure", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_issecure", .signature = "\x00\x01\x08\x11\xa8\xc5" } },
    .{ "alljoyn_busobject_getannouncedinterfacenames", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_getannouncedinterfacenames", .signature = "\x00\x03\x19\x11\xa8\xc5\x0f\x0f\x04\x19" } },
    .{ "alljoyn_busobject_setannounceflag", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_setannounceflag", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\xc5\x11\xa8\xb9\x11\xa8\xd5" } },
    .{ "alljoyn_busobject_addinterface_announced", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busobject_addinterface_announced", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\xc5\x11\xa8\xb9" } },
    .{ "alljoyn_proxybusobject_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_create", .signature = "\x00\x04\x11\xa8\xd9\x11\xa8\x91\x11\x3d\x11\x3d\x09" } },
    .{ "alljoyn_proxybusobject_create_secure", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_create_secure", .signature = "\x00\x04\x11\xa8\xd9\x11\xa8\x91\x11\x3d\x11\x3d\x09" } },
    .{ "alljoyn_proxybusobject_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_destroy", .signature = "\x00\x01\x01\x11\xa8\xd9" } },
    .{ "alljoyn_proxybusobject_addinterface", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_addinterface", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\xd9\x11\xa8\xb9" } },
    .{ "alljoyn_proxybusobject_addinterface_by_name", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_addinterface_by_name", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\xd9\x11\x3d" } },
    .{ "alljoyn_proxybusobject_getchildren", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_getchildren", .signature = "\x00\x03\x19\x11\xa8\xd9\x0f\x11\xa8\xd9\x19" } },
    .{ "alljoyn_proxybusobject_getchild", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_getchild", .signature = "\x00\x02\x11\xa8\xd9\x11\xa8\xd9\x11\x3d" } },
    .{ "alljoyn_proxybusobject_addchild", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_addchild", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\xd9\x11\xa8\xd9" } },
    .{ "alljoyn_proxybusobject_removechild", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_removechild", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\xd9\x11\x3d" } },
    .{ "alljoyn_proxybusobject_introspectremoteobject", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_introspectremoteobject", .signature = "\x00\x01\x11\xa8\x49\x11\xa8\xd9" } },
    .{ "alljoyn_proxybusobject_introspectremoteobjectasync", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_introspectremoteobjectasync", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\xd9\x12\xa8\xdd\x0f\x01" } },
    .{ "alljoyn_proxybusobject_getproperty", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_getproperty", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\xd9\x11\x3d\x11\x3d\x11\xa8\x4d" } },
    .{ "alljoyn_proxybusobject_getpropertyasync", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_getpropertyasync", .signature = "\x00\x06\x11\xa8\x49\x11\xa8\xd9\x11\x3d\x11\x3d\x12\xa8\xe1\x09\x0f\x01" } },
    .{ "alljoyn_proxybusobject_getallproperties", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_getallproperties", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\xd9\x11\x3d\x11\xa8\x4d" } },
    .{ "alljoyn_proxybusobject_getallpropertiesasync", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_getallpropertiesasync", .signature = "\x00\x05\x11\xa8\x49\x11\xa8\xd9\x11\x3d\x12\xa8\xe5\x09\x0f\x01" } },
    .{ "alljoyn_proxybusobject_setproperty", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_setproperty", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\xd9\x11\x3d\x11\x3d\x11\xa8\x4d" } },
    .{ "alljoyn_proxybusobject_registerpropertieschangedlistener", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_registerpropertieschangedlistener", .signature = "\x00\x06\x11\xa8\x49\x11\xa8\xd9\x11\x3d\x0f\x0f\x04\x19\x12\xa8\xe9\x0f\x01" } },
    .{ "alljoyn_proxybusobject_unregisterpropertieschangedlistener", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_unregisterpropertieschangedlistener", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\xd9\x11\x3d\x12\xa8\xe9" } },
    .{ "alljoyn_proxybusobject_setpropertyasync", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_setpropertyasync", .signature = "\x00\x07\x11\xa8\x49\x11\xa8\xd9\x11\x3d\x11\x3d\x11\xa8\x4d\x12\xa8\xed\x09\x0f\x01" } },
    .{ "alljoyn_proxybusobject_methodcall", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_methodcall", .signature = "\x00\x08\x11\xa8\x49\x11\xa8\xd9\x11\x3d\x11\x3d\x11\xa8\x4d\x19\x11\xa8\x8d\x09\x05" } },
    .{ "alljoyn_proxybusobject_methodcall_member", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_methodcall_member", .signature = "\x00\x07\x11\xa8\x49\x11\xa8\xd9\x11\xa8\xb1\x11\xa8\x4d\x19\x11\xa8\x8d\x09\x05" } },
    .{ "alljoyn_proxybusobject_methodcall_noreply", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_methodcall_noreply", .signature = "\x00\x06\x11\xa8\x49\x11\xa8\xd9\x11\x3d\x11\x3d\x11\xa8\x4d\x19\x05" } },
    .{ "alljoyn_proxybusobject_methodcall_member_noreply", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_methodcall_member_noreply", .signature = "\x00\x05\x11\xa8\x49\x11\xa8\xd9\x11\xa8\xb1\x11\xa8\x4d\x19\x05" } },
    .{ "alljoyn_proxybusobject_methodcallasync", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_methodcallasync", .signature = "\x00\x09\x11\xa8\x49\x11\xa8\xd9\x11\x3d\x11\x3d\x12\xa8\xf1\x11\xa8\x4d\x19\x0f\x01\x09\x05" } },
    .{ "alljoyn_proxybusobject_methodcallasync_member", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_methodcallasync_member", .signature = "\x00\x08\x11\xa8\x49\x11\xa8\xd9\x11\xa8\xb1\x12\xa8\xf1\x11\xa8\x4d\x19\x0f\x01\x09\x05" } },
    .{ "alljoyn_proxybusobject_parsexml", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_parsexml", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\xd9\x11\x3d\x11\x3d" } },
    .{ "alljoyn_proxybusobject_secureconnection", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_secureconnection", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\xd9\x08" } },
    .{ "alljoyn_proxybusobject_secureconnectionasync", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_secureconnectionasync", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\xd9\x08" } },
    .{ "alljoyn_proxybusobject_getinterface", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_getinterface", .signature = "\x00\x02\x11\xa8\xb9\x11\xa8\xd9\x11\x3d" } },
    .{ "alljoyn_proxybusobject_getinterfaces", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_getinterfaces", .signature = "\x00\x03\x19\x11\xa8\xd9\x0f\x11\xa8\xb9\x19" } },
    .{ "alljoyn_proxybusobject_getpath", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_getpath", .signature = "\x00\x01\x11\x3d\x11\xa8\xd9" } },
    .{ "alljoyn_proxybusobject_getservicename", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_getservicename", .signature = "\x00\x01\x11\x3d\x11\xa8\xd9" } },
    .{ "alljoyn_proxybusobject_getuniquename", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_getuniquename", .signature = "\x00\x01\x11\x3d\x11\xa8\xd9" } },
    .{ "alljoyn_proxybusobject_getsessionid", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_getsessionid", .signature = "\x00\x01\x09\x11\xa8\xd9" } },
    .{ "alljoyn_proxybusobject_implementsinterface", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_implementsinterface", .signature = "\x00\x02\x08\x11\xa8\xd9\x11\x3d" } },
    .{ "alljoyn_proxybusobject_copy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_copy", .signature = "\x00\x01\x11\xa8\xd9\x11\xa8\xd9" } },
    .{ "alljoyn_proxybusobject_isvalid", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_isvalid", .signature = "\x00\x01\x08\x11\xa8\xd9" } },
    .{ "alljoyn_proxybusobject_issecure", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_issecure", .signature = "\x00\x01\x08\x11\xa8\xd9" } },
    .{ "alljoyn_proxybusobject_enablepropertycaching", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_enablepropertycaching", .signature = "\x00\x01\x01\x11\xa8\xd9" } },
    .{ "alljoyn_permissionconfigurationlistener_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurationlistener_create", .signature = "\x00\x02\x11\xa8\xf5\x0f\x11\xa8\xf9\x0f\x01" } },
    .{ "alljoyn_permissionconfigurationlistener_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_permissionconfigurationlistener_destroy", .signature = "\x00\x01\x01\x11\xa8\xf5" } },
    .{ "alljoyn_sessionlistener_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionlistener_create", .signature = "\x00\x02\x11\xa8\xfd\x0f\x11\xa9\x01\x0f\x01" } },
    .{ "alljoyn_sessionlistener_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionlistener_destroy", .signature = "\x00\x01\x01\x11\xa8\xfd" } },
    .{ "alljoyn_sessionportlistener_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionportlistener_create", .signature = "\x00\x02\x11\xa9\x05\x0f\x11\xa9\x09\x0f\x01" } },
    .{ "alljoyn_sessionportlistener_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_sessionportlistener_destroy", .signature = "\x00\x01\x01\x11\xa9\x05" } },
    .{ "alljoyn_aboutlistener_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutlistener_create", .signature = "\x00\x02\x11\xa9\x0d\x0f\x11\xa9\x11\x0f\x01" } },
    .{ "alljoyn_aboutlistener_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutlistener_destroy", .signature = "\x00\x01\x01\x11\xa9\x0d" } },
    .{ "alljoyn_busattachment_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_create", .signature = "\x00\x02\x11\xa8\x91\x11\x3d\x08" } },
    .{ "alljoyn_busattachment_create_concurrency", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_create_concurrency", .signature = "\x00\x03\x11\xa8\x91\x11\x3d\x08\x09" } },
    .{ "alljoyn_busattachment_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_destroy", .signature = "\x00\x01\x01\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_start", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_start", .signature = "\x00\x01\x11\xa8\x49\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_stop", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_stop", .signature = "\x00\x01\x11\xa8\x49\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_join", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_join", .signature = "\x00\x01\x11\xa8\x49\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_getconcurrency", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_getconcurrency", .signature = "\x00\x01\x09\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_getconnectspec", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_getconnectspec", .signature = "\x00\x01\x11\x3d\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_enableconcurrentcallbacks", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_enableconcurrentcallbacks", .signature = "\x00\x01\x01\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_createinterface", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_createinterface", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x11\x3d\x0f\x11\xa8\xb9" } },
    .{ "alljoyn_busattachment_createinterface_secure", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_createinterface_secure", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x91\x11\x3d\x0f\x11\xa8\xb9\x11\xa8\xbd" } },
    .{ "alljoyn_busattachment_connect", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_connect", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\x3d" } },
    .{ "alljoyn_busattachment_registerbuslistener", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_registerbuslistener", .signature = "\x00\x02\x01\x11\xa8\x91\x11\xa8\xa9" } },
    .{ "alljoyn_busattachment_unregisterbuslistener", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_unregisterbuslistener", .signature = "\x00\x02\x01\x11\xa8\x91\x11\xa8\xa9" } },
    .{ "alljoyn_busattachment_findadvertisedname", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_findadvertisedname", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\x3d" } },
    .{ "alljoyn_busattachment_findadvertisednamebytransport", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_findadvertisednamebytransport", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x11\x3d\x07" } },
    .{ "alljoyn_busattachment_cancelfindadvertisedname", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_cancelfindadvertisedname", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\x3d" } },
    .{ "alljoyn_busattachment_cancelfindadvertisednamebytransport", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_cancelfindadvertisednamebytransport", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x11\x3d\x07" } },
    .{ "alljoyn_busattachment_advertisename", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_advertisename", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x11\x3d\x07" } },
    .{ "alljoyn_busattachment_canceladvertisename", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_canceladvertisename", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x11\x3d\x07" } },
    .{ "alljoyn_busattachment_getinterface", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_getinterface", .signature = "\x00\x02\x11\xa8\xb9\x11\xa8\x91\x11\x3d" } },
    .{ "alljoyn_busattachment_joinsession", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_joinsession", .signature = "\x00\x06\x11\xa8\x49\x11\xa8\x91\x11\x3d\x07\x11\xa8\xfd\x0f\x09\x11\xa8\x89" } },
    .{ "alljoyn_busattachment_joinsessionasync", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_joinsessionasync", .signature = "\x00\x07\x11\xa8\x49\x11\xa8\x91\x11\x3d\x07\x11\xa8\xfd\x11\xa8\x89\x12\xa9\x15\x0f\x01" } },
    .{ "alljoyn_busattachment_registerbusobject", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_registerbusobject", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\xa8\xc5" } },
    .{ "alljoyn_busattachment_registerbusobject_secure", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_registerbusobject_secure", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\xa8\xc5" } },
    .{ "alljoyn_busattachment_unregisterbusobject", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_unregisterbusobject", .signature = "\x00\x02\x01\x11\xa8\x91\x11\xa8\xc5" } },
    .{ "alljoyn_busattachment_requestname", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_requestname", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x11\x3d\x09" } },
    .{ "alljoyn_busattachment_releasename", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_releasename", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\x3d" } },
    .{ "alljoyn_busattachment_bindsessionport", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_bindsessionport", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x91\x0f\x07\x11\xa8\x89\x11\xa9\x05" } },
    .{ "alljoyn_busattachment_unbindsessionport", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_unbindsessionport", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x07" } },
    .{ "alljoyn_busattachment_enablepeersecurity", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_enablepeersecurity", .signature = "\x00\x05\x11\xa8\x49\x11\xa8\x91\x11\x3d\x11\xa8\x99\x11\x3d\x08" } },
    .{ "alljoyn_busattachment_enablepeersecuritywithpermissionconfigurationlistener", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_enablepeersecuritywithpermissionconfigurationlistener", .signature = "\x00\x06\x11\xa8\x49\x11\xa8\x91\x11\x3d\x11\xa8\x99\x11\x3d\x08\x11\xa8\xf5" } },
    .{ "alljoyn_busattachment_ispeersecurityenabled", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_ispeersecurityenabled", .signature = "\x00\x01\x08\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_createinterfacesfromxml", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_createinterfacesfromxml", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\x3d" } },
    .{ "alljoyn_busattachment_getinterfaces", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_getinterfaces", .signature = "\x00\x03\x19\x11\xa8\x91\x0f\x11\xa8\xb9\x19" } },
    .{ "alljoyn_busattachment_deleteinterface", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_deleteinterface", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\xa8\xb9" } },
    .{ "alljoyn_busattachment_isstarted", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_isstarted", .signature = "\x00\x01\x08\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_isstopping", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_isstopping", .signature = "\x00\x01\x08\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_isconnected", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_isconnected", .signature = "\x00\x01\x08\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_disconnect", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_disconnect", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\x3d" } },
    .{ "alljoyn_busattachment_getdbusproxyobj", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_getdbusproxyobj", .signature = "\x00\x01\x11\xa8\xd9\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_getalljoynproxyobj", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_getalljoynproxyobj", .signature = "\x00\x01\x11\xa8\xd9\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_getalljoyndebugobj", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_getalljoyndebugobj", .signature = "\x00\x01\x11\xa8\xd9\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_getuniquename", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_getuniquename", .signature = "\x00\x01\x11\x3d\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_getglobalguidstring", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_getglobalguidstring", .signature = "\x00\x01\x11\x3d\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_registersignalhandler", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_registersignalhandler", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x91\x12\xa9\x19\x11\xa8\xb1\x11\x3d" } },
    .{ "alljoyn_busattachment_registersignalhandlerwithrule", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_registersignalhandlerwithrule", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x91\x12\xa9\x19\x11\xa8\xb1\x11\x3d" } },
    .{ "alljoyn_busattachment_unregistersignalhandler", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_unregistersignalhandler", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x91\x12\xa9\x19\x11\xa8\xb1\x11\x3d" } },
    .{ "alljoyn_busattachment_unregistersignalhandlerwithrule", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_unregistersignalhandlerwithrule", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x91\x12\xa9\x19\x11\xa8\xb1\x11\x3d" } },
    .{ "alljoyn_busattachment_unregisterallhandlers", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_unregisterallhandlers", .signature = "\x00\x01\x11\xa8\x49\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_registerkeystorelistener", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_registerkeystorelistener", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\xa8\x79" } },
    .{ "alljoyn_busattachment_reloadkeystore", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_reloadkeystore", .signature = "\x00\x01\x11\xa8\x49\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_clearkeystore", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_clearkeystore", .signature = "\x00\x01\x01\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_clearkeys", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_clearkeys", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\x3d" } },
    .{ "alljoyn_busattachment_setkeyexpiration", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_setkeyexpiration", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x11\x3d\x09" } },
    .{ "alljoyn_busattachment_getkeyexpiration", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_getkeyexpiration", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x11\x3d\x0f\x09" } },
    .{ "alljoyn_busattachment_addlogonentry", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_addlogonentry", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x91\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "alljoyn_busattachment_addmatch", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_addmatch", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\x3d" } },
    .{ "alljoyn_busattachment_removematch", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_removematch", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\x3d" } },
    .{ "alljoyn_busattachment_setsessionlistener", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_setsessionlistener", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x09\x11\xa8\xfd" } },
    .{ "alljoyn_busattachment_leavesession", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_leavesession", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x09" } },
    .{ "alljoyn_busattachment_secureconnection", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_secureconnection", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x11\x3d\x08" } },
    .{ "alljoyn_busattachment_secureconnectionasync", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_secureconnectionasync", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x11\x3d\x08" } },
    .{ "alljoyn_busattachment_removesessionmember", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_removesessionmember", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x09\x11\x3d" } },
    .{ "alljoyn_busattachment_setlinktimeout", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_setlinktimeout", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x09\x0f\x09" } },
    .{ "alljoyn_busattachment_setlinktimeoutasync", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_setlinktimeoutasync", .signature = "\x00\x05\x11\xa8\x49\x11\xa8\x91\x09\x09\x12\xa9\x1d\x0f\x01" } },
    .{ "alljoyn_busattachment_namehasowner", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_namehasowner", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x11\x3d\x0f\x08" } },
    .{ "alljoyn_busattachment_getpeerguid", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_getpeerguid", .signature = "\x00\x04\x11\xa8\x49\x11\xa8\x91\x11\x3d\x11\x3d\x0f\x19" } },
    .{ "alljoyn_busattachment_setdaemondebug", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_setdaemondebug", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x11\x3d\x09" } },
    .{ "alljoyn_busattachment_gettimestamp", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_gettimestamp", .signature = "\x00\x00\x09" } },
    .{ "alljoyn_busattachment_ping", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_ping", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x11\x3d\x09" } },
    .{ "alljoyn_busattachment_registeraboutlistener", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_registeraboutlistener", .signature = "\x00\x02\x01\x11\xa8\x91\x11\xa9\x0d" } },
    .{ "alljoyn_busattachment_unregisteraboutlistener", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_unregisteraboutlistener", .signature = "\x00\x02\x01\x11\xa8\x91\x11\xa9\x0d" } },
    .{ "alljoyn_busattachment_unregisterallaboutlisteners", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_unregisterallaboutlisteners", .signature = "\x00\x01\x01\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_whoimplements_interfaces", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_whoimplements_interfaces", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x0f\x0f\x04\x19" } },
    .{ "alljoyn_busattachment_whoimplements_interface", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_whoimplements_interface", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\x3d" } },
    .{ "alljoyn_busattachment_cancelwhoimplements_interfaces", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_cancelwhoimplements_interfaces", .signature = "\x00\x03\x11\xa8\x49\x11\xa8\x91\x0f\x0f\x04\x19" } },
    .{ "alljoyn_busattachment_cancelwhoimplements_interface", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_cancelwhoimplements_interface", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\x3d" } },
    .{ "alljoyn_busattachment_getpermissionconfigurator", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_getpermissionconfigurator", .signature = "\x00\x01\x11\xa8\x5d\x11\xa8\x91" } },
    .{ "alljoyn_busattachment_registerapplicationstatelistener", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_registerapplicationstatelistener", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\xa8\x71" } },
    .{ "alljoyn_busattachment_unregisterapplicationstatelistener", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_unregisterapplicationstatelistener", .signature = "\x00\x02\x11\xa8\x49\x11\xa8\x91\x11\xa8\x71" } },
    .{ "alljoyn_busattachment_deletedefaultkeystore", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_busattachment_deletedefaultkeystore", .signature = "\x00\x01\x11\xa8\x49\x11\x3d" } },
    .{ "alljoyn_abouticonobj_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_abouticonobj_create", .signature = "\x00\x02\x11\xa9\x21\x11\xa8\x91\x11\xa8\x59" } },
    .{ "alljoyn_abouticonobj_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_abouticonobj_destroy", .signature = "\x00\x01\x01\x11\xa9\x21" } },
    .{ "alljoyn_abouticonproxy_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_abouticonproxy_create", .signature = "\x00\x03\x11\xa9\x25\x11\xa8\x91\x11\x3d\x09" } },
    .{ "alljoyn_abouticonproxy_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_abouticonproxy_destroy", .signature = "\x00\x01\x01\x11\xa9\x25" } },
    .{ "alljoyn_abouticonproxy_geticon", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_abouticonproxy_geticon", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x25\x11\xa8\x59" } },
    .{ "alljoyn_abouticonproxy_getversion", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_abouticonproxy_getversion", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x25\x0f\x07" } },
    .{ "alljoyn_aboutdatalistener_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdatalistener_create", .signature = "\x00\x02\x11\xa9\x29\x0f\x11\xa9\x2d\x0f\x01" } },
    .{ "alljoyn_aboutdatalistener_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutdatalistener_destroy", .signature = "\x00\x01\x01\x11\xa9\x29" } },
    .{ "alljoyn_aboutobj_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobj_create", .signature = "\x00\x02\x11\xa9\x31\x11\xa8\x91\x11\xa8\xd5" } },
    .{ "alljoyn_aboutobj_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobj_destroy", .signature = "\x00\x01\x01\x11\xa9\x31" } },
    .{ "alljoyn_aboutobj_announce", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobj_announce", .signature = "\x00\x03\x11\xa8\x49\x11\xa9\x31\x07\x11\xa8\x55" } },
    .{ "alljoyn_aboutobj_announce_using_datalistener", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobj_announce_using_datalistener", .signature = "\x00\x03\x11\xa8\x49\x11\xa9\x31\x07\x11\xa9\x29" } },
    .{ "alljoyn_aboutobj_unannounce", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobj_unannounce", .signature = "\x00\x01\x11\xa8\x49\x11\xa9\x31" } },
    .{ "alljoyn_aboutobjectdescription_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobjectdescription_create", .signature = "\x00\x00\x11\xa9\x35" } },
    .{ "alljoyn_aboutobjectdescription_create_full", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobjectdescription_create_full", .signature = "\x00\x01\x11\xa9\x35\x11\xa8\x4d" } },
    .{ "alljoyn_aboutobjectdescription_createfrommsgarg", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobjectdescription_createfrommsgarg", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x35\x11\xa8\x4d" } },
    .{ "alljoyn_aboutobjectdescription_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobjectdescription_destroy", .signature = "\x00\x01\x01\x11\xa9\x35" } },
    .{ "alljoyn_aboutobjectdescription_getpaths", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobjectdescription_getpaths", .signature = "\x00\x03\x19\x11\xa9\x35\x0f\x0f\x04\x19" } },
    .{ "alljoyn_aboutobjectdescription_getinterfaces", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobjectdescription_getinterfaces", .signature = "\x00\x04\x19\x11\xa9\x35\x11\x3d\x0f\x0f\x04\x19" } },
    .{ "alljoyn_aboutobjectdescription_getinterfacepaths", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobjectdescription_getinterfacepaths", .signature = "\x00\x04\x19\x11\xa9\x35\x11\x3d\x0f\x0f\x04\x19" } },
    .{ "alljoyn_aboutobjectdescription_clear", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobjectdescription_clear", .signature = "\x00\x01\x01\x11\xa9\x35" } },
    .{ "alljoyn_aboutobjectdescription_haspath", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobjectdescription_haspath", .signature = "\x00\x02\x05\x11\xa9\x35\x11\x3d" } },
    .{ "alljoyn_aboutobjectdescription_hasinterface", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobjectdescription_hasinterface", .signature = "\x00\x02\x05\x11\xa9\x35\x11\x3d" } },
    .{ "alljoyn_aboutobjectdescription_hasinterfaceatpath", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobjectdescription_hasinterfaceatpath", .signature = "\x00\x03\x05\x11\xa9\x35\x11\x3d\x11\x3d" } },
    .{ "alljoyn_aboutobjectdescription_getmsgarg", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutobjectdescription_getmsgarg", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x35\x11\xa8\x4d" } },
    .{ "alljoyn_aboutproxy_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutproxy_create", .signature = "\x00\x03\x11\xa9\x39\x11\xa8\x91\x11\x3d\x09" } },
    .{ "alljoyn_aboutproxy_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutproxy_destroy", .signature = "\x00\x01\x01\x11\xa9\x39" } },
    .{ "alljoyn_aboutproxy_getobjectdescription", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutproxy_getobjectdescription", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x39\x11\xa8\x4d" } },
    .{ "alljoyn_aboutproxy_getaboutdata", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutproxy_getaboutdata", .signature = "\x00\x03\x11\xa8\x49\x11\xa9\x39\x11\x3d\x11\xa8\x4d" } },
    .{ "alljoyn_aboutproxy_getversion", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_aboutproxy_getversion", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x39\x0f\x07" } },
    .{ "alljoyn_pinglistener_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_pinglistener_create", .signature = "\x00\x02\x11\xa9\x3d\x0f\x11\xa9\x41\x0f\x01" } },
    .{ "alljoyn_pinglistener_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_pinglistener_destroy", .signature = "\x00\x01\x01\x11\xa9\x3d" } },
    .{ "alljoyn_autopinger_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_autopinger_create", .signature = "\x00\x01\x11\xa9\x45\x11\xa8\x91" } },
    .{ "alljoyn_autopinger_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_autopinger_destroy", .signature = "\x00\x01\x01\x11\xa9\x45" } },
    .{ "alljoyn_autopinger_pause", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_autopinger_pause", .signature = "\x00\x01\x01\x11\xa9\x45" } },
    .{ "alljoyn_autopinger_resume", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_autopinger_resume", .signature = "\x00\x01\x01\x11\xa9\x45" } },
    .{ "alljoyn_autopinger_addpinggroup", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_autopinger_addpinggroup", .signature = "\x00\x04\x01\x11\xa9\x45\x11\x3d\x11\xa9\x3d\x09" } },
    .{ "alljoyn_autopinger_removepinggroup", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_autopinger_removepinggroup", .signature = "\x00\x02\x01\x11\xa9\x45\x11\x3d" } },
    .{ "alljoyn_autopinger_setpinginterval", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_autopinger_setpinginterval", .signature = "\x00\x03\x11\xa8\x49\x11\xa9\x45\x11\x3d\x09" } },
    .{ "alljoyn_autopinger_adddestination", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_autopinger_adddestination", .signature = "\x00\x03\x11\xa8\x49\x11\xa9\x45\x11\x3d\x11\x3d" } },
    .{ "alljoyn_autopinger_removedestination", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_autopinger_removedestination", .signature = "\x00\x04\x11\xa8\x49\x11\xa9\x45\x11\x3d\x11\x3d\x08" } },
    .{ "alljoyn_getversion", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_getversion", .signature = "\x00\x00\x11\x3d" } },
    .{ "alljoyn_getbuildinfo", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_getbuildinfo", .signature = "\x00\x00\x11\x3d" } },
    .{ "alljoyn_getnumericversion", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_getnumericversion", .signature = "\x00\x00\x09" } },
    .{ "alljoyn_init", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_init", .signature = "\x00\x00\x11\xa8\x49" } },
    .{ "alljoyn_shutdown", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_shutdown", .signature = "\x00\x00\x11\xa8\x49" } },
    .{ "alljoyn_routerinit", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_routerinit", .signature = "\x00\x00\x11\xa8\x49" } },
    .{ "alljoyn_routerinitwithconfig", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_routerinitwithconfig", .signature = "\x00\x01\x11\xa8\x49\x0f\x04" } },
    .{ "alljoyn_routershutdown", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_routershutdown", .signature = "\x00\x00\x11\xa8\x49" } },
    .{ "alljoyn_proxybusobject_ref_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_ref_create", .signature = "\x00\x01\x11\xa9\x49\x11\xa8\xd9" } },
    .{ "alljoyn_proxybusobject_ref_get", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_ref_get", .signature = "\x00\x01\x11\xa8\xd9\x11\xa9\x49" } },
    .{ "alljoyn_proxybusobject_ref_incref", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_ref_incref", .signature = "\x00\x01\x01\x11\xa9\x49" } },
    .{ "alljoyn_proxybusobject_ref_decref", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_proxybusobject_ref_decref", .signature = "\x00\x01\x01\x11\xa9\x49" } },
    .{ "alljoyn_observerlistener_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_observerlistener_create", .signature = "\x00\x02\x11\xa9\x4d\x0f\x11\xa9\x51\x0f\x01" } },
    .{ "alljoyn_observerlistener_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_observerlistener_destroy", .signature = "\x00\x01\x01\x11\xa9\x4d" } },
    .{ "alljoyn_observer_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_observer_create", .signature = "\x00\x03\x11\xa9\x55\x11\xa8\x91\x0f\x0f\x04\x19" } },
    .{ "alljoyn_observer_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_observer_destroy", .signature = "\x00\x01\x01\x11\xa9\x55" } },
    .{ "alljoyn_observer_registerlistener", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_observer_registerlistener", .signature = "\x00\x03\x01\x11\xa9\x55\x11\xa9\x4d\x08" } },
    .{ "alljoyn_observer_unregisterlistener", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_observer_unregisterlistener", .signature = "\x00\x02\x01\x11\xa9\x55\x11\xa9\x4d" } },
    .{ "alljoyn_observer_unregisteralllisteners", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_observer_unregisteralllisteners", .signature = "\x00\x01\x01\x11\xa9\x55" } },
    .{ "alljoyn_observer_get", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_observer_get", .signature = "\x00\x03\x11\xa9\x49\x11\xa9\x55\x11\x3d\x11\x3d" } },
    .{ "alljoyn_observer_getfirst", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_observer_getfirst", .signature = "\x00\x01\x11\xa9\x49\x11\xa9\x55" } },
    .{ "alljoyn_observer_getnext", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_observer_getnext", .signature = "\x00\x02\x11\xa9\x49\x11\xa9\x55\x11\xa9\x49" } },
    .{ "alljoyn_passwordmanager_setcredentials", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_passwordmanager_setcredentials", .signature = "\x00\x02\x11\xa8\x49\x11\x3d\x11\x3d" } },
    .{ "alljoyn_securityapplicationproxy_getpermissionmanagementsessionport", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_getpermissionmanagementsessionport", .signature = "\x00\x00\x07" } },
    .{ "alljoyn_securityapplicationproxy_create", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_create", .signature = "\x00\x03\x11\xa9\x59\x11\xa8\x91\x0f\x04\x09" } },
    .{ "alljoyn_securityapplicationproxy_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_destroy", .signature = "\x00\x01\x01\x11\xa9\x59" } },
    .{ "alljoyn_securityapplicationproxy_claim", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_claim", .signature = "\x00\x08\x11\xa8\x49\x11\xa9\x59\x0f\x04\x0f\x04\x0f\x05\x19\x0f\x04\x0f\x0f\x04\x19" } },
    .{ "alljoyn_securityapplicationproxy_getmanifesttemplate", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_getmanifesttemplate", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x59\x0f\x0f\x04" } },
    .{ "alljoyn_securityapplicationproxy_manifesttemplate_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_manifesttemplate_destroy", .signature = "\x00\x01\x01\x0f\x04" } },
    .{ "alljoyn_securityapplicationproxy_getapplicationstate", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_getapplicationstate", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x59\x0f\x11\xa8\x61" } },
    .{ "alljoyn_securityapplicationproxy_getclaimcapabilities", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_getclaimcapabilities", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x59\x0f\x07" } },
    .{ "alljoyn_securityapplicationproxy_getclaimcapabilitiesadditionalinfo", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_getclaimcapabilitiesadditionalinfo", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x59\x0f\x07" } },
    .{ "alljoyn_securityapplicationproxy_getpolicy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_getpolicy", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x59\x0f\x0f\x04" } },
    .{ "alljoyn_securityapplicationproxy_getdefaultpolicy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_getdefaultpolicy", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x59\x0f\x0f\x04" } },
    .{ "alljoyn_securityapplicationproxy_policy_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_policy_destroy", .signature = "\x00\x01\x01\x0f\x04" } },
    .{ "alljoyn_securityapplicationproxy_updatepolicy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_updatepolicy", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x59\x0f\x04" } },
    .{ "alljoyn_securityapplicationproxy_updateidentity", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_updateidentity", .signature = "\x00\x04\x11\xa8\x49\x11\xa9\x59\x0f\x04\x0f\x0f\x04\x19" } },
    .{ "alljoyn_securityapplicationproxy_installmembership", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_installmembership", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x59\x0f\x04" } },
    .{ "alljoyn_securityapplicationproxy_reset", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_reset", .signature = "\x00\x01\x11\xa8\x49\x11\xa9\x59" } },
    .{ "alljoyn_securityapplicationproxy_resetpolicy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_resetpolicy", .signature = "\x00\x01\x11\xa8\x49\x11\xa9\x59" } },
    .{ "alljoyn_securityapplicationproxy_startmanagement", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_startmanagement", .signature = "\x00\x01\x11\xa8\x49\x11\xa9\x59" } },
    .{ "alljoyn_securityapplicationproxy_endmanagement", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_endmanagement", .signature = "\x00\x01\x11\xa8\x49\x11\xa9\x59" } },
    .{ "alljoyn_securityapplicationproxy_geteccpublickey", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_geteccpublickey", .signature = "\x00\x02\x11\xa8\x49\x11\xa9\x59\x0f\x0f\x04" } },
    .{ "alljoyn_securityapplicationproxy_eccpublickey_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_eccpublickey_destroy", .signature = "\x00\x01\x01\x0f\x04" } },
    .{ "alljoyn_securityapplicationproxy_signmanifest", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_signmanifest", .signature = "\x00\x04\x11\xa8\x49\x0f\x04\x0f\x04\x0f\x04\x0f\x0f\x04" } },
    .{ "alljoyn_securityapplicationproxy_manifest_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_manifest_destroy", .signature = "\x00\x01\x01\x0f\x04" } },
    .{ "alljoyn_securityapplicationproxy_computemanifestdigest", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_computemanifestdigest", .signature = "\x00\x04\x11\xa8\x49\x0f\x04\x0f\x04\x0f\x0f\x05\x0f\x19" } },
    .{ "alljoyn_securityapplicationproxy_digest_destroy", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_digest_destroy", .signature = "\x00\x01\x01\x0f\x05" } },
    .{ "alljoyn_securityapplicationproxy_setmanifestsignature", MethodRecord{ .library = "MSAJApi", .import = "alljoyn_securityapplicationproxy_setmanifestsignature", .signature = "\x00\x05\x11\xa8\x49\x0f\x04\x0f\x04\x0f\x05\x19\x0f\x0f\x04" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0xbb5 => TypeRefEntry{ .namespace = "Windows.Win32.Security", .name = "SECURITY_ATTRIBUTES" },
        0x2849 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "QStatus" },
        0x284d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_msgarg" },
        0x2851 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_typeid" },
        0x2855 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_aboutdata" },
        0x2859 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_abouticon" },
        0x285d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_permissionconfigurator" },
        0x2861 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_applicationstate" },
        0x2865 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_manifestarray" },
        0x2869 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_certificateid" },
        0x286d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_certificateidarray" },
        0x2871 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_applicationstatelistener" },
        0x2875 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_applicationstatelistener_callbacks" },
        0x2879 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_keystorelistener" },
        0x287d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_keystorelistener_callbacks" },
        0x2881 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_keystorelistener_with_synchronization_callbacks" },
        0x2885 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_keystore" },
        0x2889 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_sessionopts" },
        0x288d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_message" },
        0x2891 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_busattachment" },
        0x2895 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_messagetype" },
        0x2899 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_authlistener" },
        0x289d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_credentials" },
        0x28a1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_authlistener_callbacks" },
        0x28a5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_authlistenerasync_callbacks" },
        0x28a9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_buslistener" },
        0x28ad => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_buslistener_callbacks" },
        0x28b1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_interfacedescription_member" },
        0x28b5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_interfacedescription_property" },
        0x28b9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_interfacedescription" },
        0x28bd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_interfacedescription_securitypolicy" },
        0x28c1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_interfacedescription_translation_callback_ptr" },
        0x28c5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_busobject" },
        0x28c9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_busobject_callbacks" },
        0x28cd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_messagereceiver_methodhandler_ptr" },
        0x28d1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_busobject_methodentry" },
        0x28d5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_about_announceflag" },
        0x28d9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_proxybusobject" },
        0x28dd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_proxybusobject_listener_introspectcb_ptr" },
        0x28e1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_proxybusobject_listener_getpropertycb_ptr" },
        0x28e5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_proxybusobject_listener_getallpropertiescb_ptr" },
        0x28e9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_proxybusobject_listener_propertieschanged_ptr" },
        0x28ed => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_proxybusobject_listener_setpropertycb_ptr" },
        0x28f1 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_messagereceiver_replyhandler_ptr" },
        0x28f5 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_permissionconfigurationlistener" },
        0x28f9 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_permissionconfigurationlistener_callbacks" },
        0x28fd => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_sessionlistener" },
        0x2901 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_sessionlistener_callbacks" },
        0x2905 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_sessionportlistener" },
        0x2909 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_sessionportlistener_callbacks" },
        0x290d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_aboutlistener" },
        0x2911 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_aboutlistener_callback" },
        0x2915 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_busattachment_joinsessioncb_ptr" },
        0x2919 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_messagereceiver_signalhandler_ptr" },
        0x291d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_busattachment_setlinktimeoutcb_ptr" },
        0x2921 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_abouticonobj" },
        0x2925 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_abouticonproxy" },
        0x2929 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_aboutdatalistener" },
        0x292d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_aboutdatalistener_callbacks" },
        0x2931 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_aboutobj" },
        0x2935 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_aboutobjectdescription" },
        0x2939 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_aboutproxy" },
        0x293d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_pinglistener" },
        0x2941 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_pinglistener_callback" },
        0x2945 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_autopinger" },
        0x2949 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_proxybusobject_ref" },
        0x294d => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_observerlistener" },
        0x2951 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_observerlistener_callback" },
        0x2955 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_observer" },
        0x2959 => TypeRefEntry{ .namespace = "Windows.Win32.Devices.AllJoyn", .name = "alljoyn_securityapplicationproxy" },
        else => null,
    };
}

pub const QCC_TRUE = 1;
pub const QCC_FALSE = 0;
pub const ALLJOYN_MESSAGE_FLAG_NO_REPLY_EXPECTED = 1;
pub const ALLJOYN_MESSAGE_FLAG_AUTO_START = 2;
pub const ALLJOYN_MESSAGE_FLAG_ALLOW_REMOTE_MSG = 4;
pub const ALLJOYN_MESSAGE_FLAG_SESSIONLESS = 16;
pub const ALLJOYN_MESSAGE_FLAG_GLOBAL_BROADCAST = 32;
pub const ALLJOYN_MESSAGE_FLAG_ENCRYPTED = 128;
pub const ALLJOYN_TRAFFIC_TYPE_MESSAGES = 1;
pub const ALLJOYN_TRAFFIC_TYPE_RAW_UNRELIABLE = 2;
pub const ALLJOYN_TRAFFIC_TYPE_RAW_RELIABLE = 4;
pub const ALLJOYN_PROXIMITY_ANY = 255;
pub const ALLJOYN_PROXIMITY_PHYSICAL = 1;
pub const ALLJOYN_PROXIMITY_NETWORK = 2;
pub const ALLJOYN_READ_READY = 1;
pub const ALLJOYN_WRITE_READY = 2;
pub const ALLJOYN_DISCONNECTED = 4;
pub const ALLJOYN_LITTLE_ENDIAN = 108;
pub const ALLJOYN_BIG_ENDIAN = 66;
pub const ALLJOYN_MESSAGE_DEFAULT_TIMEOUT = 25000;
pub const ALLJOYN_CRED_PASSWORD = 1;
pub const ALLJOYN_CRED_USER_NAME = 2;
pub const ALLJOYN_CRED_CERT_CHAIN = 4;
pub const ALLJOYN_CRED_PRIVATE_KEY = 8;
pub const ALLJOYN_CRED_LOGON_ENTRY = 16;
pub const ALLJOYN_CRED_EXPIRATION = 32;
pub const ALLJOYN_CRED_NEW_PASSWORD = 4097;
pub const ALLJOYN_CRED_ONE_TIME_PWD = 8193;
pub const ALLJOYN_PROP_ACCESS_READ = 1;
pub const ALLJOYN_PROP_ACCESS_WRITE = 2;
pub const ALLJOYN_PROP_ACCESS_RW = 3;
pub const ALLJOYN_MEMBER_ANNOTATE_NO_REPLY = 1;
pub const ALLJOYN_MEMBER_ANNOTATE_DEPRECATED = 2;
pub const ALLJOYN_MEMBER_ANNOTATE_SESSIONCAST = 4;
pub const ALLJOYN_MEMBER_ANNOTATE_SESSIONLESS = 8;
pub const ALLJOYN_MEMBER_ANNOTATE_UNICAST = 16;
pub const ALLJOYN_MEMBER_ANNOTATE_GLOBAL_BROADCAST = 32;
pub const UNANNOUNCED = 0;
pub const ANNOUNCED = 1;
pub const ER_OK = 0;
pub const ER_FAIL = 1;
pub const ER_UTF_CONVERSION_FAILED = 2;
pub const ER_BUFFER_TOO_SMALL = 3;
pub const ER_OS_ERROR = 4;
pub const ER_OUT_OF_MEMORY = 5;
pub const ER_SOCKET_BIND_ERROR = 6;
pub const ER_INIT_FAILED = 7;
pub const ER_WOULDBLOCK = 8;
pub const ER_NOT_IMPLEMENTED = 9;
pub const ER_TIMEOUT = 10;
pub const ER_SOCK_OTHER_END_CLOSED = 11;
pub const ER_BAD_ARG_1 = 12;
pub const ER_BAD_ARG_2 = 13;
pub const ER_BAD_ARG_3 = 14;
pub const ER_BAD_ARG_4 = 15;
pub const ER_BAD_ARG_5 = 16;
pub const ER_BAD_ARG_6 = 17;
pub const ER_BAD_ARG_7 = 18;
pub const ER_BAD_ARG_8 = 19;
pub const ER_INVALID_ADDRESS = 20;
pub const ER_INVALID_DATA = 21;
pub const ER_READ_ERROR = 22;
pub const ER_WRITE_ERROR = 23;
pub const ER_OPEN_FAILED = 24;
pub const ER_PARSE_ERROR = 25;
pub const ER_END_OF_DATA = 26;
pub const ER_CONN_REFUSED = 27;
pub const ER_BAD_ARG_COUNT = 28;
pub const ER_WARNING = 29;
pub const ER_EOF = 30;
pub const ER_DEADLOCK = 31;
pub const ER_COMMON_ERRORS = 4096;
pub const ER_STOPPING_THREAD = 4097;
pub const ER_ALERTED_THREAD = 4098;
pub const ER_XML_MALFORMED = 4099;
pub const ER_AUTH_FAIL = 4100;
pub const ER_AUTH_USER_REJECT = 4101;
pub const ER_NO_SUCH_ALARM = 4102;
pub const ER_TIMER_FALLBEHIND = 4103;
pub const ER_SSL_ERRORS = 4104;
pub const ER_SSL_INIT = 4105;
pub const ER_SSL_CONNECT = 4106;
pub const ER_SSL_VERIFY = 4107;
pub const ER_EXTERNAL_THREAD = 4108;
pub const ER_CRYPTO_ERROR = 4109;
pub const ER_CRYPTO_TRUNCATED = 4110;
pub const ER_CRYPTO_KEY_UNAVAILABLE = 4111;
pub const ER_BAD_HOSTNAME = 4112;
pub const ER_CRYPTO_KEY_UNUSABLE = 4113;
pub const ER_EMPTY_KEY_BLOB = 4114;
pub const ER_CORRUPT_KEYBLOB = 4115;
pub const ER_INVALID_KEY_ENCODING = 4116;
pub const ER_DEAD_THREAD = 4117;
pub const ER_THREAD_RUNNING = 4118;
pub const ER_THREAD_STOPPING = 4119;
pub const ER_BAD_STRING_ENCODING = 4120;
pub const ER_CRYPTO_INSUFFICIENT_SECURITY = 4121;
pub const ER_CRYPTO_ILLEGAL_PARAMETERS = 4122;
pub const ER_CRYPTO_HASH_UNINITIALIZED = 4123;
pub const ER_THREAD_NO_WAIT = 4124;
pub const ER_TIMER_EXITING = 4125;
pub const ER_INVALID_GUID = 4126;
pub const ER_THREADPOOL_EXHAUSTED = 4127;
pub const ER_THREADPOOL_STOPPING = 4128;
pub const ER_INVALID_STREAM = 4129;
pub const ER_TIMER_FULL = 4130;
pub const ER_IODISPATCH_STOPPING = 4131;
pub const ER_SLAP_INVALID_PACKET_LEN = 4132;
pub const ER_SLAP_HDR_CHECKSUM_ERROR = 4133;
pub const ER_SLAP_INVALID_PACKET_TYPE = 4134;
pub const ER_SLAP_LEN_MISMATCH = 4135;
pub const ER_SLAP_PACKET_TYPE_MISMATCH = 4136;
pub const ER_SLAP_CRC_ERROR = 4137;
pub const ER_SLAP_ERROR = 4138;
pub const ER_SLAP_OTHER_END_CLOSED = 4139;
pub const ER_TIMER_NOT_ALLOWED = 4140;
pub const ER_NOT_CONN = 4141;
pub const ER_XML_CONVERTER_ERROR = 8192;
pub const ER_XML_INVALID_RULES_COUNT = 8193;
pub const ER_XML_INTERFACE_MEMBERS_MISSING = 8194;
pub const ER_XML_INVALID_MEMBER_TYPE = 8195;
pub const ER_XML_INVALID_MEMBER_ACTION = 8196;
pub const ER_XML_MEMBER_DENY_ACTION_WITH_OTHER = 8197;
pub const ER_XML_INVALID_ANNOTATIONS_COUNT = 8198;
pub const ER_XML_INVALID_ELEMENT_NAME = 8199;
pub const ER_XML_INVALID_ATTRIBUTE_VALUE = 8200;
pub const ER_XML_INVALID_SECURITY_LEVEL_ANNOTATION_VALUE = 8201;
pub const ER_XML_INVALID_ELEMENT_CHILDREN_COUNT = 8202;
pub const ER_XML_INVALID_POLICY_VERSION = 8203;
pub const ER_XML_INVALID_POLICY_SERIAL_NUMBER = 8204;
pub const ER_XML_INVALID_ACL_PEER_TYPE = 8205;
pub const ER_XML_INVALID_ACL_PEER_CHILDREN_COUNT = 8206;
pub const ER_XML_ACL_ALL_TYPE_PEER_WITH_OTHERS = 8207;
pub const ER_XML_INVALID_ACL_PEER_PUBLIC_KEY = 8208;
pub const ER_XML_ACL_PEER_NOT_UNIQUE = 8209;
pub const ER_XML_ACL_PEER_PUBLIC_KEY_SET = 8210;
pub const ER_XML_ACLS_MISSING = 8211;
pub const ER_XML_ACL_PEERS_MISSING = 8212;
pub const ER_XML_INVALID_OBJECT_PATH = 8213;
pub const ER_XML_INVALID_INTERFACE_NAME = 8214;
pub const ER_XML_INVALID_MEMBER_NAME = 8215;
pub const ER_XML_INVALID_MANIFEST_VERSION = 8216;
pub const ER_XML_INVALID_OID = 8217;
pub const ER_XML_INVALID_BASE64 = 8218;
pub const ER_XML_INTERFACE_NAME_NOT_UNIQUE = 8219;
pub const ER_XML_MEMBER_NAME_NOT_UNIQUE = 8220;
pub const ER_XML_OBJECT_PATH_NOT_UNIQUE = 8221;
pub const ER_XML_ANNOTATION_NOT_UNIQUE = 8222;
pub const ER_NONE = 65535;
pub const ER_BUS_ERRORS = 36864;
pub const ER_BUS_READ_ERROR = 36865;
pub const ER_BUS_WRITE_ERROR = 36866;
pub const ER_BUS_BAD_VALUE_TYPE = 36867;
pub const ER_BUS_BAD_HEADER_FIELD = 36868;
pub const ER_BUS_BAD_SIGNATURE = 36869;
pub const ER_BUS_BAD_OBJ_PATH = 36870;
pub const ER_BUS_BAD_MEMBER_NAME = 36871;
pub const ER_BUS_BAD_INTERFACE_NAME = 36872;
pub const ER_BUS_BAD_ERROR_NAME = 36873;
pub const ER_BUS_BAD_BUS_NAME = 36874;
pub const ER_BUS_NAME_TOO_LONG = 36875;
pub const ER_BUS_BAD_LENGTH = 36876;
pub const ER_BUS_BAD_VALUE = 36877;
pub const ER_BUS_BAD_HDR_FLAGS = 36878;
pub const ER_BUS_BAD_BODY_LEN = 36879;
pub const ER_BUS_BAD_HEADER_LEN = 36880;
pub const ER_BUS_UNKNOWN_SERIAL = 36881;
pub const ER_BUS_UNKNOWN_PATH = 36882;
pub const ER_BUS_UNKNOWN_INTERFACE = 36883;
pub const ER_BUS_ESTABLISH_FAILED = 36884;
pub const ER_BUS_UNEXPECTED_SIGNATURE = 36885;
pub const ER_BUS_INTERFACE_MISSING = 36886;
pub const ER_BUS_PATH_MISSING = 36887;
pub const ER_BUS_MEMBER_MISSING = 36888;
pub const ER_BUS_REPLY_SERIAL_MISSING = 36889;
pub const ER_BUS_ERROR_NAME_MISSING = 36890;
pub const ER_BUS_INTERFACE_NO_SUCH_MEMBER = 36891;
pub const ER_BUS_NO_SUCH_OBJECT = 36892;
pub const ER_BUS_OBJECT_NO_SUCH_MEMBER = 36893;
pub const ER_BUS_OBJECT_NO_SUCH_INTERFACE = 36894;
pub const ER_BUS_NO_SUCH_INTERFACE = 36895;
pub const ER_BUS_MEMBER_NO_SUCH_SIGNATURE = 36896;
pub const ER_BUS_NOT_NUL_TERMINATED = 36897;
pub const ER_BUS_NO_SUCH_PROPERTY = 36898;
pub const ER_BUS_SET_WRONG_SIGNATURE = 36899;
pub const ER_BUS_PROPERTY_VALUE_NOT_SET = 36900;
pub const ER_BUS_PROPERTY_ACCESS_DENIED = 36901;
pub const ER_BUS_NO_TRANSPORTS = 36902;
pub const ER_BUS_BAD_TRANSPORT_ARGS = 36903;
pub const ER_BUS_NO_ROUTE = 36904;
pub const ER_BUS_NO_ENDPOINT = 36905;
pub const ER_BUS_BAD_SEND_PARAMETER = 36906;
pub const ER_BUS_UNMATCHED_REPLY_SERIAL = 36907;
pub const ER_BUS_BAD_SENDER_ID = 36908;
pub const ER_BUS_TRANSPORT_NOT_STARTED = 36909;
pub const ER_BUS_EMPTY_MESSAGE = 36910;
pub const ER_BUS_NOT_OWNER = 36911;
pub const ER_BUS_SET_PROPERTY_REJECTED = 36912;
pub const ER_BUS_CONNECT_FAILED = 36913;
pub const ER_BUS_REPLY_IS_ERROR_MESSAGE = 36914;
pub const ER_BUS_NOT_AUTHENTICATING = 36915;
pub const ER_BUS_NO_LISTENER = 36916;
pub const ER_BUS_NOT_ALLOWED = 36918;
pub const ER_BUS_WRITE_QUEUE_FULL = 36919;
pub const ER_BUS_ENDPOINT_CLOSING = 36920;
pub const ER_BUS_INTERFACE_MISMATCH = 36921;
pub const ER_BUS_MEMBER_ALREADY_EXISTS = 36922;
pub const ER_BUS_PROPERTY_ALREADY_EXISTS = 36923;
pub const ER_BUS_IFACE_ALREADY_EXISTS = 36924;
pub const ER_BUS_ERROR_RESPONSE = 36925;
pub const ER_BUS_BAD_XML = 36926;
pub const ER_BUS_BAD_CHILD_PATH = 36927;
pub const ER_BUS_OBJ_ALREADY_EXISTS = 36928;
pub const ER_BUS_OBJ_NOT_FOUND = 36929;
pub const ER_BUS_CANNOT_EXPAND_MESSAGE = 36930;
pub const ER_BUS_NOT_COMPRESSED = 36931;
pub const ER_BUS_ALREADY_CONNECTED = 36932;
pub const ER_BUS_NOT_CONNECTED = 36933;
pub const ER_BUS_ALREADY_LISTENING = 36934;
pub const ER_BUS_KEY_UNAVAILABLE = 36935;
pub const ER_BUS_TRUNCATED = 36936;
pub const ER_BUS_KEY_STORE_NOT_LOADED = 36937;
pub const ER_BUS_NO_AUTHENTICATION_MECHANISM = 36938;
pub const ER_BUS_BUS_ALREADY_STARTED = 36939;
pub const ER_BUS_BUS_NOT_STARTED = 36940;
pub const ER_BUS_KEYBLOB_OP_INVALID = 36941;
pub const ER_BUS_INVALID_HEADER_CHECKSUM = 36942;
pub const ER_BUS_MESSAGE_NOT_ENCRYPTED = 36943;
pub const ER_BUS_INVALID_HEADER_SERIAL = 36944;
pub const ER_BUS_TIME_TO_LIVE_EXPIRED = 36945;
pub const ER_BUS_HDR_EXPANSION_INVALID = 36946;
pub const ER_BUS_MISSING_COMPRESSION_TOKEN = 36947;
pub const ER_BUS_NO_PEER_GUID = 36948;
pub const ER_BUS_MESSAGE_DECRYPTION_FAILED = 36949;
pub const ER_BUS_SECURITY_FATAL = 36950;
pub const ER_BUS_KEY_EXPIRED = 36951;
pub const ER_BUS_CORRUPT_KEYSTORE = 36952;
pub const ER_BUS_NO_CALL_FOR_REPLY = 36953;
pub const ER_BUS_NOT_A_COMPLETE_TYPE = 36954;
pub const ER_BUS_POLICY_VIOLATION = 36955;
pub const ER_BUS_NO_SUCH_SERVICE = 36956;
pub const ER_BUS_TRANSPORT_NOT_AVAILABLE = 36957;
pub const ER_BUS_INVALID_AUTH_MECHANISM = 36958;
pub const ER_BUS_KEYSTORE_VERSION_MISMATCH = 36959;
pub const ER_BUS_BLOCKING_CALL_NOT_ALLOWED = 36960;
pub const ER_BUS_SIGNATURE_MISMATCH = 36961;
pub const ER_BUS_STOPPING = 36962;
pub const ER_BUS_METHOD_CALL_ABORTED = 36963;
pub const ER_BUS_CANNOT_ADD_INTERFACE = 36964;
pub const ER_BUS_CANNOT_ADD_HANDLER = 36965;
pub const ER_BUS_KEYSTORE_NOT_LOADED = 36966;
pub const ER_BUS_NO_SUCH_HANDLE = 36971;
pub const ER_BUS_HANDLES_NOT_ENABLED = 36972;
pub const ER_BUS_HANDLES_MISMATCH = 36973;
pub const ER_BUS_NO_SESSION = 36975;
pub const ER_BUS_ELEMENT_NOT_FOUND = 36976;
pub const ER_BUS_NOT_A_DICTIONARY = 36977;
pub const ER_BUS_WAIT_FAILED = 36978;
pub const ER_BUS_BAD_SESSION_OPTS = 36980;
pub const ER_BUS_CONNECTION_REJECTED = 36981;
pub const ER_DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER = 36982;
pub const ER_DBUS_REQUEST_NAME_REPLY_IN_QUEUE = 36983;
pub const ER_DBUS_REQUEST_NAME_REPLY_EXISTS = 36984;
pub const ER_DBUS_REQUEST_NAME_REPLY_ALREADY_OWNER = 36985;
pub const ER_DBUS_RELEASE_NAME_REPLY_RELEASED = 36986;
pub const ER_DBUS_RELEASE_NAME_REPLY_NON_EXISTENT = 36987;
pub const ER_DBUS_RELEASE_NAME_REPLY_NOT_OWNER = 36988;
pub const ER_DBUS_START_REPLY_ALREADY_RUNNING = 36990;
pub const ER_ALLJOYN_BINDSESSIONPORT_REPLY_ALREADY_EXISTS = 36992;
pub const ER_ALLJOYN_BINDSESSIONPORT_REPLY_FAILED = 36993;
pub const ER_ALLJOYN_JOINSESSION_REPLY_NO_SESSION = 36995;
pub const ER_ALLJOYN_JOINSESSION_REPLY_UNREACHABLE = 36996;
pub const ER_ALLJOYN_JOINSESSION_REPLY_CONNECT_FAILED = 36997;
pub const ER_ALLJOYN_JOINSESSION_REPLY_REJECTED = 36998;
pub const ER_ALLJOYN_JOINSESSION_REPLY_BAD_SESSION_OPTS = 36999;
pub const ER_ALLJOYN_JOINSESSION_REPLY_FAILED = 37000;
pub const ER_ALLJOYN_LEAVESESSION_REPLY_NO_SESSION = 37002;
pub const ER_ALLJOYN_LEAVESESSION_REPLY_FAILED = 37003;
pub const ER_ALLJOYN_ADVERTISENAME_REPLY_TRANSPORT_NOT_AVAILABLE = 37004;
pub const ER_ALLJOYN_ADVERTISENAME_REPLY_ALREADY_ADVERTISING = 37005;
pub const ER_ALLJOYN_ADVERTISENAME_REPLY_FAILED = 37006;
pub const ER_ALLJOYN_CANCELADVERTISENAME_REPLY_FAILED = 37008;
pub const ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_TRANSPORT_NOT_AVAILABLE = 37009;
pub const ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_ALREADY_DISCOVERING = 37010;
pub const ER_ALLJOYN_FINDADVERTISEDNAME_REPLY_FAILED = 37011;
pub const ER_ALLJOYN_CANCELFINDADVERTISEDNAME_REPLY_FAILED = 37013;
pub const ER_BUS_UNEXPECTED_DISPOSITION = 37014;
pub const ER_BUS_INTERFACE_ACTIVATED = 37015;
pub const ER_ALLJOYN_UNBINDSESSIONPORT_REPLY_BAD_PORT = 37016;
pub const ER_ALLJOYN_UNBINDSESSIONPORT_REPLY_FAILED = 37017;
pub const ER_ALLJOYN_BINDSESSIONPORT_REPLY_INVALID_OPTS = 37018;
pub const ER_ALLJOYN_JOINSESSION_REPLY_ALREADY_JOINED = 37019;
pub const ER_BUS_SELF_CONNECT = 37020;
pub const ER_BUS_SECURITY_NOT_ENABLED = 37021;
pub const ER_BUS_LISTENER_ALREADY_SET = 37022;
pub const ER_BUS_PEER_AUTH_VERSION_MISMATCH = 37023;
pub const ER_ALLJOYN_SETLINKTIMEOUT_REPLY_NOT_SUPPORTED = 37024;
pub const ER_ALLJOYN_SETLINKTIMEOUT_REPLY_NO_DEST_SUPPORT = 37025;
pub const ER_ALLJOYN_SETLINKTIMEOUT_REPLY_FAILED = 37026;
pub const ER_ALLJOYN_ACCESS_PERMISSION_WARNING = 37027;
pub const ER_ALLJOYN_ACCESS_PERMISSION_ERROR = 37028;
pub const ER_BUS_DESTINATION_NOT_AUTHENTICATED = 37029;
pub const ER_BUS_ENDPOINT_REDIRECTED = 37030;
pub const ER_BUS_AUTHENTICATION_PENDING = 37031;
pub const ER_BUS_NOT_AUTHORIZED = 37032;
pub const ER_PACKET_BUS_NO_SUCH_CHANNEL = 37033;
pub const ER_PACKET_BAD_FORMAT = 37034;
pub const ER_PACKET_CONNECT_TIMEOUT = 37035;
pub const ER_PACKET_CHANNEL_FAIL = 37036;
pub const ER_PACKET_TOO_LARGE = 37037;
pub const ER_PACKET_BAD_PARAMETER = 37038;
pub const ER_PACKET_BAD_CRC = 37039;
pub const ER_RENDEZVOUS_SERVER_DEACTIVATED_USER = 37067;
pub const ER_RENDEZVOUS_SERVER_UNKNOWN_USER = 37068;
pub const ER_UNABLE_TO_CONNECT_TO_RENDEZVOUS_SERVER = 37069;
pub const ER_NOT_CONNECTED_TO_RENDEZVOUS_SERVER = 37070;
pub const ER_UNABLE_TO_SEND_MESSAGE_TO_RENDEZVOUS_SERVER = 37071;
pub const ER_INVALID_RENDEZVOUS_SERVER_INTERFACE_MESSAGE = 37072;
pub const ER_INVALID_PERSISTENT_CONNECTION_MESSAGE_RESPONSE = 37073;
pub const ER_INVALID_ON_DEMAND_CONNECTION_MESSAGE_RESPONSE = 37074;
pub const ER_INVALID_HTTP_METHOD_USED_FOR_RENDEZVOUS_SERVER_INTERFACE_MESSAGE = 37075;
pub const ER_RENDEZVOUS_SERVER_ERR500_INTERNAL_ERROR = 37076;
pub const ER_RENDEZVOUS_SERVER_ERR503_STATUS_UNAVAILABLE = 37077;
pub const ER_RENDEZVOUS_SERVER_ERR401_UNAUTHORIZED_REQUEST = 37078;
pub const ER_RENDEZVOUS_SERVER_UNRECOVERABLE_ERROR = 37079;
pub const ER_RENDEZVOUS_SERVER_ROOT_CERTIFICATE_UNINITIALIZED = 37080;
pub const ER_BUS_NO_SUCH_ANNOTATION = 37081;
pub const ER_BUS_ANNOTATION_ALREADY_EXISTS = 37082;
pub const ER_SOCK_CLOSING = 37083;
pub const ER_NO_SUCH_DEVICE = 37084;
pub const ER_P2P = 37085;
pub const ER_P2P_TIMEOUT = 37086;
pub const ER_P2P_NOT_CONNECTED = 37087;
pub const ER_BAD_TRANSPORT_MASK = 37088;
pub const ER_PROXIMITY_CONNECTION_ESTABLISH_FAIL = 37089;
pub const ER_PROXIMITY_NO_PEERS_FOUND = 37090;
pub const ER_BUS_OBJECT_NOT_REGISTERED = 37091;
pub const ER_P2P_DISABLED = 37092;
pub const ER_P2P_BUSY = 37093;
pub const ER_BUS_INCOMPATIBLE_DAEMON = 37094;
pub const ER_P2P_NO_GO = 37095;
pub const ER_P2P_NO_STA = 37096;
pub const ER_P2P_FORBIDDEN = 37097;
pub const ER_ALLJOYN_ONAPPSUSPEND_REPLY_FAILED = 37098;
pub const ER_ALLJOYN_ONAPPSUSPEND_REPLY_UNSUPPORTED = 37099;
pub const ER_ALLJOYN_ONAPPRESUME_REPLY_FAILED = 37100;
pub const ER_ALLJOYN_ONAPPRESUME_REPLY_UNSUPPORTED = 37101;
pub const ER_BUS_NO_SUCH_MESSAGE = 37102;
pub const ER_ALLJOYN_REMOVESESSIONMEMBER_REPLY_NO_SESSION = 37103;
pub const ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_BINDER = 37104;
pub const ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_MULTIPOINT = 37105;
pub const ER_ALLJOYN_REMOVESESSIONMEMBER_NOT_FOUND = 37106;
pub const ER_ALLJOYN_REMOVESESSIONMEMBER_INCOMPATIBLE_REMOTE_DAEMON = 37107;
pub const ER_ALLJOYN_REMOVESESSIONMEMBER_REPLY_FAILED = 37108;
pub const ER_BUS_REMOVED_BY_BINDER = 37109;
pub const ER_BUS_MATCH_RULE_NOT_FOUND = 37110;
pub const ER_ALLJOYN_PING_FAILED = 37111;
pub const ER_ALLJOYN_PING_REPLY_UNREACHABLE = 37112;
pub const ER_UDP_MSG_TOO_LONG = 37113;
pub const ER_UDP_DEMUX_NO_ENDPOINT = 37114;
pub const ER_UDP_NO_NETWORK = 37115;
pub const ER_UDP_UNEXPECTED_LENGTH = 37116;
pub const ER_UDP_UNEXPECTED_FLOW = 37117;
pub const ER_UDP_DISCONNECT = 37118;
pub const ER_UDP_NOT_IMPLEMENTED = 37119;
pub const ER_UDP_NO_LISTENER = 37120;
pub const ER_UDP_STOPPING = 37121;
pub const ER_ARDP_BACKPRESSURE = 37122;
pub const ER_UDP_BACKPRESSURE = 37123;
pub const ER_ARDP_INVALID_STATE = 37124;
pub const ER_ARDP_TTL_EXPIRED = 37125;
pub const ER_ARDP_PERSIST_TIMEOUT = 37126;
pub const ER_ARDP_PROBE_TIMEOUT = 37127;
pub const ER_ARDP_REMOTE_CONNECTION_RESET = 37128;
pub const ER_UDP_BUSHELLO = 37129;
pub const ER_UDP_MESSAGE = 37130;
pub const ER_UDP_INVALID = 37131;
pub const ER_UDP_UNSUPPORTED = 37132;
pub const ER_UDP_ENDPOINT_STALLED = 37133;
pub const ER_ARDP_INVALID_RESPONSE = 37134;
pub const ER_ARDP_INVALID_CONNECTION = 37135;
pub const ER_UDP_LOCAL_DISCONNECT = 37136;
pub const ER_UDP_EARLY_EXIT = 37137;
pub const ER_UDP_LOCAL_DISCONNECT_FAIL = 37138;
pub const ER_ARDP_DISCONNECTING = 37139;
pub const ER_ALLJOYN_PING_REPLY_INCOMPATIBLE_REMOTE_ROUTING_NODE = 37140;
pub const ER_ALLJOYN_PING_REPLY_TIMEOUT = 37141;
pub const ER_ALLJOYN_PING_REPLY_UNKNOWN_NAME = 37142;
pub const ER_ALLJOYN_PING_REPLY_FAILED = 37143;
pub const ER_TCP_MAX_UNTRUSTED = 37144;
pub const ER_ALLJOYN_PING_REPLY_IN_PROGRESS = 37145;
pub const ER_LANGUAGE_NOT_SUPPORTED = 37146;
pub const ER_ABOUT_FIELD_ALREADY_SPECIFIED = 37147;
pub const ER_UDP_NOT_DISCONNECTED = 37148;
pub const ER_UDP_ENDPOINT_NOT_STARTED = 37149;
pub const ER_UDP_ENDPOINT_REMOVED = 37150;
pub const ER_ARDP_VERSION_NOT_SUPPORTED = 37151;
pub const ER_CONNECTION_LIMIT_EXCEEDED = 37152;
pub const ER_ARDP_WRITE_BLOCKED = 37153;
pub const ER_PERMISSION_DENIED = 37154;
pub const ER_ABOUT_DEFAULT_LANGUAGE_NOT_SPECIFIED = 37155;
pub const ER_ABOUT_SESSIONPORT_NOT_BOUND = 37156;
pub const ER_ABOUT_ABOUTDATA_MISSING_REQUIRED_FIELD = 37157;
pub const ER_ABOUT_INVALID_ABOUTDATA_LISTENER = 37158;
pub const ER_BUS_PING_GROUP_NOT_FOUND = 37159;
pub const ER_BUS_REMOVED_BY_BINDER_SELF = 37160;
pub const ER_INVALID_CONFIG = 37161;
pub const ER_ABOUT_INVALID_ABOUTDATA_FIELD_VALUE = 37162;
pub const ER_ABOUT_INVALID_ABOUTDATA_FIELD_APPID_SIZE = 37163;
pub const ER_BUS_TRANSPORT_ACCESS_DENIED = 37164;
pub const ER_INVALID_CERTIFICATE = 37165;
pub const ER_CERTIFICATE_NOT_FOUND = 37166;
pub const ER_DUPLICATE_CERTIFICATE = 37167;
pub const ER_UNKNOWN_CERTIFICATE = 37168;
pub const ER_MISSING_DIGEST_IN_CERTIFICATE = 37169;
pub const ER_DIGEST_MISMATCH = 37170;
pub const ER_DUPLICATE_KEY = 37171;
pub const ER_NO_COMMON_TRUST = 37172;
pub const ER_MANIFEST_NOT_FOUND = 37173;
pub const ER_INVALID_CERT_CHAIN = 37174;
pub const ER_NO_TRUST_ANCHOR = 37175;
pub const ER_INVALID_APPLICATION_STATE = 37176;
pub const ER_FEATURE_NOT_AVAILABLE = 37177;
pub const ER_KEY_STORE_ALREADY_INITIALIZED = 37178;
pub const ER_KEY_STORE_ID_NOT_YET_SET = 37179;
pub const ER_POLICY_NOT_NEWER = 37180;
pub const ER_MANIFEST_REJECTED = 37181;
pub const ER_INVALID_CERTIFICATE_USAGE = 37182;
pub const ER_INVALID_SIGNAL_EMISSION_TYPE = 37183;
pub const ER_APPLICATION_STATE_LISTENER_ALREADY_EXISTS = 37184;
pub const ER_APPLICATION_STATE_LISTENER_NO_SUCH_LISTENER = 37185;
pub const ER_MANAGEMENT_ALREADY_STARTED = 37186;
pub const ER_MANAGEMENT_NOT_STARTED = 37187;
pub const ER_BUS_DESCRIPTION_ALREADY_EXISTS = 37188;
pub const ALLJOYN_INVALID = 0;
pub const ALLJOYN_ARRAY = 97;
pub const ALLJOYN_BOOLEAN = 98;
pub const ALLJOYN_DOUBLE = 100;
pub const ALLJOYN_DICT_ENTRY = 101;
pub const ALLJOYN_SIGNATURE = 103;
pub const ALLJOYN_HANDLE = 104;
pub const ALLJOYN_INT32 = 105;
pub const ALLJOYN_INT16 = 110;
pub const ALLJOYN_OBJECT_PATH = 111;
pub const ALLJOYN_UINT16 = 113;
pub const ALLJOYN_STRUCT = 114;
pub const ALLJOYN_STRING = 115;
pub const ALLJOYN_UINT64 = 116;
pub const ALLJOYN_UINT32 = 117;
pub const ALLJOYN_VARIANT = 118;
pub const ALLJOYN_INT64 = 120;
pub const ALLJOYN_BYTE = 121;
pub const ALLJOYN_STRUCT_OPEN = 40;
pub const ALLJOYN_STRUCT_CLOSE = 41;
pub const ALLJOYN_DICT_ENTRY_OPEN = 123;
pub const ALLJOYN_DICT_ENTRY_CLOSE = 125;
pub const ALLJOYN_BOOLEAN_ARRAY = 25185;
pub const ALLJOYN_DOUBLE_ARRAY = 25697;
pub const ALLJOYN_INT32_ARRAY = 26977;
pub const ALLJOYN_INT16_ARRAY = 28257;
pub const ALLJOYN_UINT16_ARRAY = 29025;
pub const ALLJOYN_UINT64_ARRAY = 29793;
pub const ALLJOYN_UINT32_ARRAY = 30049;
pub const ALLJOYN_INT64_ARRAY = 30817;
pub const ALLJOYN_BYTE_ARRAY = 31073;
pub const ALLJOYN_WILDCARD = 42;
pub const NOT_CLAIMABLE = 0;
pub const CLAIMABLE = 1;
pub const CLAIMED = 2;
pub const NEED_UPDATE = 3;
pub const CAPABLE_ECDHE_NULL = 1;
pub const CAPABLE_ECDHE_ECDSA = 4;
pub const CAPABLE_ECDHE_SPEKE = 8;
pub const PASSWORD_GENERATED_BY_SECURITY_MANAGER = 1;
pub const PASSWORD_GENERATED_BY_APPLICATION = 2;
pub const ALLJOYN_MESSAGE_INVALID = 0;
pub const ALLJOYN_MESSAGE_METHOD_CALL = 1;
pub const ALLJOYN_MESSAGE_METHOD_RET = 2;
pub const ALLJOYN_MESSAGE_ERROR = 3;
pub const ALLJOYN_MESSAGE_SIGNAL = 4;
pub const AJ_IFC_SECURITY_INHERIT = 0;
pub const AJ_IFC_SECURITY_REQUIRED = 1;
pub const AJ_IFC_SECURITY_OFF = 2;
pub const ALLJOYN_SESSIONLOST_INVALID = 0;
pub const ALLJOYN_SESSIONLOST_REMOTE_END_LEFT_SESSION = 1;
pub const ALLJOYN_SESSIONLOST_REMOTE_END_CLOSED_ABRUPTLY = 2;
pub const ALLJOYN_SESSIONLOST_REMOVED_BY_BINDER = 3;
pub const ALLJOYN_SESSIONLOST_LINK_TIMEOUT = 4;
pub const ALLJOYN_SESSIONLOST_REASON_OTHER = 5;

pub const aliases = struct {
    pub const alljoyn_about_announceflag = i32;
    pub const QStatus = i32;
    pub const alljoyn_typeid = i32;
    pub const alljoyn_applicationstate = i32;
    pub const alljoyn_claimcapability_masks = i32;
    pub const alljoyn_claimcapabilityadditionalinfo_masks = i32;
    pub const alljoyn_messagetype = i32;
    pub const alljoyn_interfacedescription_securitypolicy = i32;
    pub const alljoyn_sessionlostreason = i32;
    pub const alljoyn_aboutdata = isize;
    pub const alljoyn_aboutdatalistener = isize;
    pub const alljoyn_abouticon = isize;
    pub const alljoyn_abouticonobj = isize;
    pub const alljoyn_abouticonproxy = isize;
    pub const alljoyn_aboutlistener = isize;
    pub const alljoyn_aboutobj = isize;
    pub const alljoyn_aboutobjectdescription = isize;
    pub const alljoyn_aboutproxy = isize;
    pub const alljoyn_applicationstatelistener = isize;
    pub const alljoyn_authlistener = isize;
    pub const alljoyn_autopinger = isize;
    pub const alljoyn_busattachment = isize;
    pub const alljoyn_buslistener = isize;
    pub const alljoyn_busobject = isize;
    pub const alljoyn_credentials = isize;
    pub const alljoyn_interfacedescription = isize;
    pub const alljoyn_keystore = isize;
    pub const alljoyn_keystorelistener = isize;
    pub const alljoyn_message = isize;
    pub const alljoyn_msgarg = isize;
    pub const alljoyn_observer = isize;
    pub const alljoyn_observerlistener = isize;
    pub const alljoyn_permissionconfigurationlistener = isize;
    pub const alljoyn_permissionconfigurator = isize;
    pub const alljoyn_pinglistener = isize;
    pub const alljoyn_proxybusobject = isize;
    pub const alljoyn_proxybusobject_ref = isize;
    pub const alljoyn_securityapplicationproxy = isize;
    pub const alljoyn_sessionlistener = isize;
    pub const alljoyn_sessionopts = isize;
    pub const alljoyn_sessionportlistener = isize;
};
