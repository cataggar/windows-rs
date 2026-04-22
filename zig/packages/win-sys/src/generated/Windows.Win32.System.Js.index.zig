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
    .{ "JsCreateContext", MethodRecord{ .library = "chakra", .import = "JsCreateContext", .signature = "\x00\x03\x11\x94\x69\x0f\x01\x12\x94\x6d\x0f\x0f\x01" } },
    .{ "JsStartDebugging", MethodRecord{ .library = "chakra", .import = "JsStartDebugging", .signature = "\x00\x01\x11\x94\x69\x12\x94\x6d" } },
    .{ "JsCreateRuntime", MethodRecord{ .library = "chakra", .import = "JsCreateRuntime", .signature = "\x00\x04\x11\x94\x69\x11\x94\x71\x11\x94\x65\x12\x94\x75\x0f\x0f\x01" } },
    .{ "JsCollectGarbage", MethodRecord{ .library = "chakra", .import = "JsCollectGarbage", .signature = "\x00\x01\x11\x94\x69\x0f\x01" } },
    .{ "JsDisposeRuntime", MethodRecord{ .library = "chakra", .import = "JsDisposeRuntime", .signature = "\x00\x01\x11\x94\x69\x0f\x01" } },
    .{ "JsGetRuntimeMemoryUsage", MethodRecord{ .library = "chakra", .import = "JsGetRuntimeMemoryUsage", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x19" } },
    .{ "JsGetRuntimeMemoryLimit", MethodRecord{ .library = "chakra", .import = "JsGetRuntimeMemoryLimit", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x19" } },
    .{ "JsSetRuntimeMemoryLimit", MethodRecord{ .library = "chakra", .import = "JsSetRuntimeMemoryLimit", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x19" } },
    .{ "JsSetRuntimeMemoryAllocationCallback", MethodRecord{ .library = "chakra", .import = "JsSetRuntimeMemoryAllocationCallback", .signature = "\x00\x03\x11\x94\x69\x0f\x01\x0f\x01\x12\x94\x79" } },
    .{ "JsSetRuntimeBeforeCollectCallback", MethodRecord{ .library = "chakra", .import = "JsSetRuntimeBeforeCollectCallback", .signature = "\x00\x03\x11\x94\x69\x0f\x01\x0f\x01\x12\x94\x7d" } },
    .{ "JsAddRef", MethodRecord{ .library = "chakra", .import = "JsAddRef", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x09" } },
    .{ "JsRelease", MethodRecord{ .library = "chakra", .import = "JsRelease", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x09" } },
    .{ "JsGetCurrentContext", MethodRecord{ .library = "chakra", .import = "JsGetCurrentContext", .signature = "\x00\x01\x11\x94\x69\x0f\x0f\x01" } },
    .{ "JsSetCurrentContext", MethodRecord{ .library = "chakra", .import = "JsSetCurrentContext", .signature = "\x00\x01\x11\x94\x69\x0f\x01" } },
    .{ "JsGetRuntime", MethodRecord{ .library = "chakra", .import = "JsGetRuntime", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x01" } },
    .{ "JsIdle", MethodRecord{ .library = "chakra", .import = "JsIdle", .signature = "\x00\x01\x11\x94\x69\x0f\x09" } },
    .{ "JsParseScript", MethodRecord{ .library = "chakra", .import = "JsParseScript", .signature = "\x00\x04\x11\x94\x69\x11\x05\x19\x11\x05\x0f\x0f\x01" } },
    .{ "JsRunScript", MethodRecord{ .library = "chakra", .import = "JsRunScript", .signature = "\x00\x04\x11\x94\x69\x11\x05\x19\x11\x05\x0f\x0f\x01" } },
    .{ "JsSerializeScript", MethodRecord{ .library = "chakra", .import = "JsSerializeScript", .signature = "\x00\x03\x11\x94\x69\x11\x05\x0f\x05\x0f\x09" } },
    .{ "JsParseSerializedScript", MethodRecord{ .library = "chakra", .import = "JsParseSerializedScript", .signature = "\x00\x05\x11\x94\x69\x11\x05\x0f\x05\x19\x11\x05\x0f\x0f\x01" } },
    .{ "JsRunSerializedScript", MethodRecord{ .library = "chakra", .import = "JsRunSerializedScript", .signature = "\x00\x05\x11\x94\x69\x11\x05\x0f\x05\x19\x11\x05\x0f\x0f\x01" } },
    .{ "JsGetPropertyIdFromName", MethodRecord{ .library = "chakra", .import = "JsGetPropertyIdFromName", .signature = "\x00\x02\x11\x94\x69\x11\x05\x0f\x0f\x01" } },
    .{ "JsGetPropertyNameFromId", MethodRecord{ .library = "chakra", .import = "JsGetPropertyNameFromId", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x07" } },
    .{ "JsGetUndefinedValue", MethodRecord{ .library = "chakra", .import = "JsGetUndefinedValue", .signature = "\x00\x01\x11\x94\x69\x0f\x0f\x01" } },
    .{ "JsGetNullValue", MethodRecord{ .library = "chakra", .import = "JsGetNullValue", .signature = "\x00\x01\x11\x94\x69\x0f\x0f\x01" } },
    .{ "JsGetTrueValue", MethodRecord{ .library = "chakra", .import = "JsGetTrueValue", .signature = "\x00\x01\x11\x94\x69\x0f\x0f\x01" } },
    .{ "JsGetFalseValue", MethodRecord{ .library = "chakra", .import = "JsGetFalseValue", .signature = "\x00\x01\x11\x94\x69\x0f\x0f\x01" } },
    .{ "JsBoolToBoolean", MethodRecord{ .library = "chakra", .import = "JsBoolToBoolean", .signature = "\x00\x02\x11\x94\x69\x05\x0f\x0f\x01" } },
    .{ "JsBooleanToBool", MethodRecord{ .library = "chakra", .import = "JsBooleanToBool", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x02" } },
    .{ "JsConvertValueToBoolean", MethodRecord{ .library = "chakra", .import = "JsConvertValueToBoolean", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x01" } },
    .{ "JsGetValueType", MethodRecord{ .library = "chakra", .import = "JsGetValueType", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x11\x94\x85" } },
    .{ "JsDoubleToNumber", MethodRecord{ .library = "chakra", .import = "JsDoubleToNumber", .signature = "\x00\x02\x11\x94\x69\x0d\x0f\x0f\x01" } },
    .{ "JsIntToNumber", MethodRecord{ .library = "chakra", .import = "JsIntToNumber", .signature = "\x00\x02\x11\x94\x69\x08\x0f\x0f\x01" } },
    .{ "JsNumberToDouble", MethodRecord{ .library = "chakra", .import = "JsNumberToDouble", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0d" } },
    .{ "JsConvertValueToNumber", MethodRecord{ .library = "chakra", .import = "JsConvertValueToNumber", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x01" } },
    .{ "JsGetStringLength", MethodRecord{ .library = "chakra", .import = "JsGetStringLength", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x08" } },
    .{ "JsPointerToString", MethodRecord{ .library = "chakra", .import = "JsPointerToString", .signature = "\x00\x03\x11\x94\x69\x11\x05\x19\x0f\x0f\x01" } },
    .{ "JsStringToPointer", MethodRecord{ .library = "chakra", .import = "JsStringToPointer", .signature = "\x00\x03\x11\x94\x69\x0f\x01\x0f\x0f\x07\x0f\x19" } },
    .{ "JsConvertValueToString", MethodRecord{ .library = "chakra", .import = "JsConvertValueToString", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x01" } },
    .{ "JsVariantToValue", MethodRecord{ .library = "chakra", .import = "JsVariantToValue", .signature = "\x00\x02\x11\x94\x69\x0f\x11\x94\x89\x0f\x0f\x01" } },
    .{ "JsValueToVariant", MethodRecord{ .library = "chakra", .import = "JsValueToVariant", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x11\x94\x89" } },
    .{ "JsGetGlobalObject", MethodRecord{ .library = "chakra", .import = "JsGetGlobalObject", .signature = "\x00\x01\x11\x94\x69\x0f\x0f\x01" } },
    .{ "JsCreateObject", MethodRecord{ .library = "chakra", .import = "JsCreateObject", .signature = "\x00\x01\x11\x94\x69\x0f\x0f\x01" } },
    .{ "JsCreateExternalObject", MethodRecord{ .library = "chakra", .import = "JsCreateExternalObject", .signature = "\x00\x03\x11\x94\x69\x0f\x01\x12\x94\x8d\x0f\x0f\x01" } },
    .{ "JsConvertValueToObject", MethodRecord{ .library = "chakra", .import = "JsConvertValueToObject", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x01" } },
    .{ "JsGetPrototype", MethodRecord{ .library = "chakra", .import = "JsGetPrototype", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x01" } },
    .{ "JsSetPrototype", MethodRecord{ .library = "chakra", .import = "JsSetPrototype", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x01" } },
    .{ "JsGetExtensionAllowed", MethodRecord{ .library = "chakra", .import = "JsGetExtensionAllowed", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x02" } },
    .{ "JsPreventExtension", MethodRecord{ .library = "chakra", .import = "JsPreventExtension", .signature = "\x00\x01\x11\x94\x69\x0f\x01" } },
    .{ "JsGetProperty", MethodRecord{ .library = "chakra", .import = "JsGetProperty", .signature = "\x00\x03\x11\x94\x69\x0f\x01\x0f\x01\x0f\x0f\x01" } },
    .{ "JsGetOwnPropertyDescriptor", MethodRecord{ .library = "chakra", .import = "JsGetOwnPropertyDescriptor", .signature = "\x00\x03\x11\x94\x69\x0f\x01\x0f\x01\x0f\x0f\x01" } },
    .{ "JsGetOwnPropertyNames", MethodRecord{ .library = "chakra", .import = "JsGetOwnPropertyNames", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x01" } },
    .{ "JsSetProperty", MethodRecord{ .library = "chakra", .import = "JsSetProperty", .signature = "\x00\x04\x11\x94\x69\x0f\x01\x0f\x01\x0f\x01\x05" } },
    .{ "JsHasProperty", MethodRecord{ .library = "chakra", .import = "JsHasProperty", .signature = "\x00\x03\x11\x94\x69\x0f\x01\x0f\x01\x0f\x02" } },
    .{ "JsDeleteProperty", MethodRecord{ .library = "chakra", .import = "JsDeleteProperty", .signature = "\x00\x04\x11\x94\x69\x0f\x01\x0f\x01\x05\x0f\x0f\x01" } },
    .{ "JsDefineProperty", MethodRecord{ .library = "chakra", .import = "JsDefineProperty", .signature = "\x00\x04\x11\x94\x69\x0f\x01\x0f\x01\x0f\x01\x0f\x02" } },
    .{ "JsHasIndexedProperty", MethodRecord{ .library = "chakra", .import = "JsHasIndexedProperty", .signature = "\x00\x03\x11\x94\x69\x0f\x01\x0f\x01\x0f\x02" } },
    .{ "JsGetIndexedProperty", MethodRecord{ .library = "chakra", .import = "JsGetIndexedProperty", .signature = "\x00\x03\x11\x94\x69\x0f\x01\x0f\x01\x0f\x0f\x01" } },
    .{ "JsSetIndexedProperty", MethodRecord{ .library = "chakra", .import = "JsSetIndexedProperty", .signature = "\x00\x03\x11\x94\x69\x0f\x01\x0f\x01\x0f\x01" } },
    .{ "JsDeleteIndexedProperty", MethodRecord{ .library = "chakra", .import = "JsDeleteIndexedProperty", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x01" } },
    .{ "JsEquals", MethodRecord{ .library = "chakra", .import = "JsEquals", .signature = "\x00\x03\x11\x94\x69\x0f\x01\x0f\x01\x0f\x02" } },
    .{ "JsStrictEquals", MethodRecord{ .library = "chakra", .import = "JsStrictEquals", .signature = "\x00\x03\x11\x94\x69\x0f\x01\x0f\x01\x0f\x02" } },
    .{ "JsHasExternalData", MethodRecord{ .library = "chakra", .import = "JsHasExternalData", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x02" } },
    .{ "JsGetExternalData", MethodRecord{ .library = "chakra", .import = "JsGetExternalData", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x01" } },
    .{ "JsSetExternalData", MethodRecord{ .library = "chakra", .import = "JsSetExternalData", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x01" } },
    .{ "JsCreateArray", MethodRecord{ .library = "chakra", .import = "JsCreateArray", .signature = "\x00\x02\x11\x94\x69\x09\x0f\x0f\x01" } },
    .{ "JsCallFunction", MethodRecord{ .library = "chakra", .import = "JsCallFunction", .signature = "\x00\x04\x11\x94\x69\x0f\x01\x0f\x0f\x01\x07\x0f\x0f\x01" } },
    .{ "JsConstructObject", MethodRecord{ .library = "chakra", .import = "JsConstructObject", .signature = "\x00\x04\x11\x94\x69\x0f\x01\x0f\x0f\x01\x07\x0f\x0f\x01" } },
    .{ "JsCreateFunction", MethodRecord{ .library = "chakra", .import = "JsCreateFunction", .signature = "\x00\x03\x11\x94\x69\x12\x94\x91\x0f\x01\x0f\x0f\x01" } },
    .{ "JsCreateError", MethodRecord{ .library = "chakra", .import = "JsCreateError", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x01" } },
    .{ "JsCreateRangeError", MethodRecord{ .library = "chakra", .import = "JsCreateRangeError", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x01" } },
    .{ "JsCreateReferenceError", MethodRecord{ .library = "chakra", .import = "JsCreateReferenceError", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x01" } },
    .{ "JsCreateSyntaxError", MethodRecord{ .library = "chakra", .import = "JsCreateSyntaxError", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x01" } },
    .{ "JsCreateTypeError", MethodRecord{ .library = "chakra", .import = "JsCreateTypeError", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x01" } },
    .{ "JsCreateURIError", MethodRecord{ .library = "chakra", .import = "JsCreateURIError", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x0f\x01" } },
    .{ "JsHasException", MethodRecord{ .library = "chakra", .import = "JsHasException", .signature = "\x00\x01\x11\x94\x69\x0f\x02" } },
    .{ "JsGetAndClearException", MethodRecord{ .library = "chakra", .import = "JsGetAndClearException", .signature = "\x00\x01\x11\x94\x69\x0f\x0f\x01" } },
    .{ "JsSetException", MethodRecord{ .library = "chakra", .import = "JsSetException", .signature = "\x00\x01\x11\x94\x69\x0f\x01" } },
    .{ "JsDisableRuntimeExecution", MethodRecord{ .library = "chakra", .import = "JsDisableRuntimeExecution", .signature = "\x00\x01\x11\x94\x69\x0f\x01" } },
    .{ "JsEnableRuntimeExecution", MethodRecord{ .library = "chakra", .import = "JsEnableRuntimeExecution", .signature = "\x00\x01\x11\x94\x69\x0f\x01" } },
    .{ "JsIsRuntimeExecutionDisabled", MethodRecord{ .library = "chakra", .import = "JsIsRuntimeExecutionDisabled", .signature = "\x00\x02\x11\x94\x69\x0f\x01\x0f\x02" } },
    .{ "JsStartProfiling", MethodRecord{ .library = "chakra", .import = "JsStartProfiling", .signature = "\x00\x03\x11\x94\x69\x12\x94\x95\x11\x94\x99\x09" } },
    .{ "JsStopProfiling", MethodRecord{ .library = "chakra", .import = "JsStopProfiling", .signature = "\x00\x01\x11\x94\x69\x11\x79" } },
    .{ "JsEnumerateHeap", MethodRecord{ .library = "chakra", .import = "JsEnumerateHeap", .signature = "\x00\x01\x11\x94\x69\x0f\x12\x94\x9d" } },
    .{ "JsIsEnumeratingHeap", MethodRecord{ .library = "chakra", .import = "JsIsEnumeratingHeap", .signature = "\x00\x01\x11\x94\x69\x0f\x02" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x1465 => TypeRefEntry{ .namespace = "Windows.Win32.System.Js", .name = "JsRuntimeVersion" },
        0x1469 => TypeRefEntry{ .namespace = "Windows.Win32.System.Js", .name = "JsErrorCode" },
        0x146d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug.ActiveScript", .name = "IDebugApplication64" },
        0x1471 => TypeRefEntry{ .namespace = "Windows.Win32.System.Js", .name = "JsRuntimeAttributes" },
        0x1475 => TypeRefEntry{ .namespace = "Windows.Win32.System.Js", .name = "JsThreadServiceCallback" },
        0x1479 => TypeRefEntry{ .namespace = "Windows.Win32.System.Js", .name = "JsMemoryAllocationCallback" },
        0x147d => TypeRefEntry{ .namespace = "Windows.Win32.System.Js", .name = "JsBeforeCollectCallback" },
        0x1485 => TypeRefEntry{ .namespace = "Windows.Win32.System.Js", .name = "JsValueType" },
        0x1489 => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "VARIANT" },
        0x148d => TypeRefEntry{ .namespace = "Windows.Win32.System.Js", .name = "JsFinalizeCallback" },
        0x1491 => TypeRefEntry{ .namespace = "Windows.Win32.System.Js", .name = "JsNativeFunction" },
        0x1495 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug.ActiveScript", .name = "IActiveScriptProfilerCallback" },
        0x1499 => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug.ActiveScript", .name = "PROFILER_EVENT_MASK" },
        0x149d => TypeRefEntry{ .namespace = "Windows.Win32.System.Diagnostics.Debug.ActiveScript", .name = "IActiveScriptProfilerHeapEnum" },
        else => null,
    };
}

pub const JsRuntimeVersion10 = 0;
pub const JsRuntimeVersion11 = 1;
pub const JsRuntimeVersionEdge = -1;
pub const JS_SOURCE_CONTEXT_NONE = 18446744073709551615;
pub const JsNoError = 0;
pub const JsErrorCategoryUsage = 65536;
pub const JsErrorInvalidArgument = 65537;
pub const JsErrorNullArgument = 65538;
pub const JsErrorNoCurrentContext = 65539;
pub const JsErrorInExceptionState = 65540;
pub const JsErrorNotImplemented = 65541;
pub const JsErrorWrongThread = 65542;
pub const JsErrorRuntimeInUse = 65543;
pub const JsErrorBadSerializedScript = 65544;
pub const JsErrorInDisabledState = 65545;
pub const JsErrorCannotDisableExecution = 65546;
pub const JsErrorHeapEnumInProgress = 65547;
pub const JsErrorArgumentNotObject = 65548;
pub const JsErrorInProfileCallback = 65549;
pub const JsErrorInThreadServiceCallback = 65550;
pub const JsErrorCannotSerializeDebugScript = 65551;
pub const JsErrorAlreadyDebuggingContext = 65552;
pub const JsErrorAlreadyProfilingContext = 65553;
pub const JsErrorIdleNotEnabled = 65554;
pub const JsErrorCategoryEngine = 131072;
pub const JsErrorOutOfMemory = 131073;
pub const JsErrorCategoryScript = 196608;
pub const JsErrorScriptException = 196609;
pub const JsErrorScriptCompile = 196610;
pub const JsErrorScriptTerminated = 196611;
pub const JsErrorScriptEvalDisabled = 196612;
pub const JsErrorCategoryFatal = 262144;
pub const JsErrorFatal = 262145;
pub const JsRuntimeAttributeNone = 0;
pub const JsRuntimeAttributeDisableBackgroundWork = 1;
pub const JsRuntimeAttributeAllowScriptInterrupt = 2;
pub const JsRuntimeAttributeEnableIdleProcessing = 4;
pub const JsRuntimeAttributeDisableNativeCodeGeneration = 8;
pub const JsRuntimeAttributeDisableEval = 16;
pub const JsMemoryAllocate = 0;
pub const JsMemoryFree = 1;
pub const JsMemoryFailure = 2;
pub const JsUndefined = 0;
pub const JsNull = 1;
pub const JsNumber = 2;
pub const JsString = 3;
pub const JsBoolean = 4;
pub const JsObject = 5;
pub const JsFunction = 6;
pub const JsError = 7;
pub const JsArray = 8;

pub const aliases = struct {
    pub const JsRuntimeVersion = i32;
    pub const JsErrorCode = u32;
    pub const JsRuntimeAttributes = i32;
    pub const JsMemoryEventType = i32;
    pub const JsValueType = i32;
    pub const JsMemoryAllocationCallback = ?*const anyopaque;
    pub const JsBeforeCollectCallback = ?*const anyopaque;
    pub const JsBackgroundWorkItemCallback = ?*const anyopaque;
    pub const JsThreadServiceCallback = ?*const anyopaque;
    pub const JsFinalizeCallback = ?*const anyopaque;
    pub const JsNativeFunction = ?*const anyopaque;
};
