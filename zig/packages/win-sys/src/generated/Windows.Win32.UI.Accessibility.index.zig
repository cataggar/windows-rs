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
    .{ "LresultFromObject", MethodRecord{ .library = "OLEACC", .import = "LresultFromObject", .signature = "\x00\x03\x11\x82\x35\x0f\x11\x0d\x11\x83\x8d\x12\x82\xb1" } },
    .{ "ObjectFromLresult", MethodRecord{ .library = "OLEACC", .import = "ObjectFromLresult", .signature = "\x00\x04\x11\x79\x11\x82\x35\x0f\x11\x0d\x11\x83\x8d\x0f\x0f\x01" } },
    .{ "WindowFromAccessibleObject", MethodRecord{ .library = "OLEACC", .import = "WindowFromAccessibleObject", .signature = "\x00\x02\x11\x79\x12\xc0\x00\x46\x21\x0f\x11\x25" } },
    .{ "AccessibleObjectFromWindow", MethodRecord{ .library = "OLEACC", .import = "AccessibleObjectFromWindow", .signature = "\x00\x04\x11\x79\x11\x25\x09\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "AccessibleObjectFromEvent", MethodRecord{ .library = "OLEACC", .import = "AccessibleObjectFromEvent", .signature = "\x00\x05\x11\x79\x11\x25\x09\x09\x0f\x12\xc0\x00\x46\x21\x0f\x11\x94\x89" } },
    .{ "AccessibleObjectFromPoint", MethodRecord{ .library = "OLEACC", .import = "AccessibleObjectFromPoint", .signature = "\x00\x03\x11\x79\x11\x83\x71\x0f\x12\xc0\x00\x46\x21\x0f\x11\x94\x89" } },
    .{ "AccessibleChildren", MethodRecord{ .library = "OLEACC", .import = "AccessibleChildren", .signature = "\x00\x05\x11\x79\x12\xc0\x00\x46\x21\x08\x08\x0f\x11\x94\x89\x0f\x08" } },
    .{ "GetRoleTextA", MethodRecord{ .library = "OLEACC", .import = "GetRoleTextA", .signature = "\x00\x03\x09\x09\x11\x3d\x09" } },
    .{ "GetRoleTextW", MethodRecord{ .library = "OLEACC", .import = "GetRoleTextW", .signature = "\x00\x03\x09\x09\x11\x05\x09" } },
    .{ "GetStateTextA", MethodRecord{ .library = "OLEACC", .import = "GetStateTextA", .signature = "\x00\x03\x09\x09\x11\x3d\x09" } },
    .{ "GetStateTextW", MethodRecord{ .library = "OLEACC", .import = "GetStateTextW", .signature = "\x00\x03\x09\x09\x11\x05\x09" } },
    .{ "GetOleaccVersionInfo", MethodRecord{ .library = "OLEACC", .import = "GetOleaccVersionInfo", .signature = "\x00\x02\x01\x0f\x09\x0f\x09" } },
    .{ "CreateStdAccessibleObject", MethodRecord{ .library = "OLEACC", .import = "CreateStdAccessibleObject", .signature = "\x00\x04\x11\x79\x11\x25\x08\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CreateStdAccessibleProxyA", MethodRecord{ .library = "OLEACC", .import = "CreateStdAccessibleProxyA", .signature = "\x00\x05\x11\x79\x11\x25\x11\x3d\x08\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "CreateStdAccessibleProxyW", MethodRecord{ .library = "OLEACC", .import = "CreateStdAccessibleProxyW", .signature = "\x00\x05\x11\x79\x11\x25\x11\x05\x08\x0f\x11\x0d\x0f\x0f\x01" } },
    .{ "AccSetRunningUtilityState", MethodRecord{ .library = "OLEACC", .import = "AccSetRunningUtilityState", .signature = "\x00\x03\x11\x79\x11\x25\x09\x11\xa4\x91" } },
    .{ "AccNotifyTouchInteraction", MethodRecord{ .library = "OLEACC", .import = "AccNotifyTouchInteraction", .signature = "\x00\x03\x11\x79\x11\x25\x11\x25\x11\x83\x71" } },
    .{ "UiaGetErrorDescription", MethodRecord{ .library = "UIAutomationCore", .import = "UiaGetErrorDescription", .signature = "\x00\x01\x11\x59\x0f\x11\x8d\x35" } },
    .{ "UiaHUiaNodeFromVariant", MethodRecord{ .library = "UIAutomationCore", .import = "UiaHUiaNodeFromVariant", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\xc0\x00\x46\x25" } },
    .{ "UiaHPatternObjectFromVariant", MethodRecord{ .library = "UIAutomationCore", .import = "UiaHPatternObjectFromVariant", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\xc0\x00\x46\x29" } },
    .{ "UiaHTextRangeFromVariant", MethodRecord{ .library = "UIAutomationCore", .import = "UiaHTextRangeFromVariant", .signature = "\x00\x02\x11\x79\x0f\x11\x94\x89\x0f\x11\xc0\x00\x46\x2d" } },
    .{ "UiaNodeRelease", MethodRecord{ .library = "UIAutomationCore", .import = "UiaNodeRelease", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x46\x25" } },
    .{ "UiaGetPropertyValue", MethodRecord{ .library = "UIAutomationCore", .import = "UiaGetPropertyValue", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x46\x25\x08\x0f\x11\x94\x89" } },
    .{ "UiaGetPatternProvider", MethodRecord{ .library = "UIAutomationCore", .import = "UiaGetPatternProvider", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x46\x25\x08\x0f\x11\xc0\x00\x46\x29" } },
    .{ "UiaGetRuntimeId", MethodRecord{ .library = "UIAutomationCore", .import = "UiaGetRuntimeId", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x25\x0f\x0f\x11\x99\x39" } },
    .{ "UiaSetFocus", MethodRecord{ .library = "UIAutomationCore", .import = "UiaSetFocus", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x25" } },
    .{ "UiaNavigate", MethodRecord{ .library = "UIAutomationCore", .import = "UiaNavigate", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x46\x25\x11\xc0\x00\x46\x31\x0f\x11\xc0\x00\x46\x35\x0f\x11\xc0\x00\x46\x39\x0f\x0f\x11\x99\x39\x0f\x11\x8d\x35" } },
    .{ "UiaGetUpdatedCache", MethodRecord{ .library = "UIAutomationCore", .import = "UiaGetUpdatedCache", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x46\x25\x0f\x11\xc0\x00\x46\x39\x11\xc0\x00\x46\x3d\x0f\x11\xc0\x00\x46\x35\x0f\x0f\x11\x99\x39\x0f\x11\x8d\x35" } },
    .{ "UiaFind", MethodRecord{ .library = "UIAutomationCore", .import = "UiaFind", .signature = "\x00\x06\x11\x79\x11\xc0\x00\x46\x25\x0f\x11\xc0\x00\x46\x41\x0f\x11\xc0\x00\x46\x39\x0f\x0f\x11\x99\x39\x0f\x0f\x11\x99\x39\x0f\x0f\x11\x99\x39" } },
    .{ "UiaNodeFromPoint", MethodRecord{ .library = "UIAutomationCore", .import = "UiaNodeFromPoint", .signature = "\x00\x05\x11\x79\x0d\x0d\x0f\x11\xc0\x00\x46\x39\x0f\x0f\x11\x99\x39\x0f\x11\x8d\x35" } },
    .{ "UiaNodeFromFocus", MethodRecord{ .library = "UIAutomationCore", .import = "UiaNodeFromFocus", .signature = "\x00\x03\x11\x79\x0f\x11\xc0\x00\x46\x39\x0f\x0f\x11\x99\x39\x0f\x11\x8d\x35" } },
    .{ "UiaNodeFromHandle", MethodRecord{ .library = "UIAutomationCore", .import = "UiaNodeFromHandle", .signature = "\x00\x02\x11\x79\x11\x25\x0f\x11\xc0\x00\x46\x25" } },
    .{ "UiaNodeFromProvider", MethodRecord{ .library = "UIAutomationCore", .import = "UiaNodeFromProvider", .signature = "\x00\x02\x11\x79\x12\xc0\x00\x46\x45\x0f\x11\xc0\x00\x46\x25" } },
    .{ "UiaGetRootNode", MethodRecord{ .library = "UIAutomationCore", .import = "UiaGetRootNode", .signature = "\x00\x01\x11\x79\x0f\x11\xc0\x00\x46\x25" } },
    .{ "UiaRegisterProviderCallback", MethodRecord{ .library = "UIAutomationCore", .import = "UiaRegisterProviderCallback", .signature = "\x00\x01\x01\x0f\x12\xc0\x00\x46\x49" } },
    .{ "UiaLookupId", MethodRecord{ .library = "UIAutomationCore", .import = "UiaLookupId", .signature = "\x00\x02\x08\x11\xc0\x00\x46\x4d\x0f\x11\x0d" } },
    .{ "UiaGetReservedNotSupportedValue", MethodRecord{ .library = "UIAutomationCore", .import = "UiaGetReservedNotSupportedValue", .signature = "\x00\x01\x11\x79\x0f\x12\x82\xb1" } },
    .{ "UiaGetReservedMixedAttributeValue", MethodRecord{ .library = "UIAutomationCore", .import = "UiaGetReservedMixedAttributeValue", .signature = "\x00\x01\x11\x79\x0f\x12\x82\xb1" } },
    .{ "UiaClientsAreListening", MethodRecord{ .library = "UIAutomationCore", .import = "UiaClientsAreListening", .signature = "\x00\x00\x11\x59" } },
    .{ "UiaRaiseAutomationPropertyChangedEvent", MethodRecord{ .library = "UIAutomationCore", .import = "UiaRaiseAutomationPropertyChangedEvent", .signature = "\x00\x04\x11\x79\x12\xc0\x00\x46\x45\x11\xa4\xb1\x11\x94\x89\x11\x94\x89" } },
    .{ "UiaRaiseAutomationEvent", MethodRecord{ .library = "UIAutomationCore", .import = "UiaRaiseAutomationEvent", .signature = "\x00\x02\x11\x79\x12\xc0\x00\x46\x45\x11\xa4\xad" } },
    .{ "UiaRaiseStructureChangedEvent", MethodRecord{ .library = "UIAutomationCore", .import = "UiaRaiseStructureChangedEvent", .signature = "\x00\x04\x11\x79\x12\xc0\x00\x46\x45\x11\xc0\x00\x46\x51\x0f\x08\x08" } },
    .{ "UiaRaiseAsyncContentLoadedEvent", MethodRecord{ .library = "UIAutomationCore", .import = "UiaRaiseAsyncContentLoadedEvent", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x46\x45\x11\xc0\x00\x46\x55\x0d" } },
    .{ "UiaRaiseTextEditTextChangedEvent", MethodRecord{ .library = "UIAutomationCore", .import = "UiaRaiseTextEditTextChangedEvent", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x46\x45\x11\xc0\x00\x46\x59\x0f\x11\x99\x39" } },
    .{ "UiaRaiseChangesEvent", MethodRecord{ .library = "UIAutomationCore", .import = "UiaRaiseChangesEvent", .signature = "\x00\x03\x11\x79\x12\xc0\x00\x46\x45\x08\x0f\x11\xc0\x00\x46\x5d" } },
    .{ "UiaRaiseNotificationEvent", MethodRecord{ .library = "UIAutomationCore", .import = "UiaRaiseNotificationEvent", .signature = "\x00\x05\x11\x79\x12\xc0\x00\x46\x45\x11\xc0\x00\x46\x61\x11\xc0\x00\x46\x65\x11\x8d\x35\x11\x8d\x35" } },
    .{ "UiaRaiseActiveTextPositionChangedEvent", MethodRecord{ .library = "UIAutomationCore", .import = "UiaRaiseActiveTextPositionChangedEvent", .signature = "\x00\x02\x11\x79\x12\xc0\x00\x46\x45\x12\xc0\x00\x46\x69" } },
    .{ "UiaAddEvent", MethodRecord{ .library = "UIAutomationCore", .import = "UiaAddEvent", .signature = "\x00\x08\x11\x79\x11\xc0\x00\x46\x25\x08\x0f\x12\xc0\x00\x46\x6d\x11\xc0\x00\x46\x71\x0f\x08\x08\x0f\x11\xc0\x00\x46\x39\x0f\x11\xc0\x00\x46\x75" } },
    .{ "UiaRemoveEvent", MethodRecord{ .library = "UIAutomationCore", .import = "UiaRemoveEvent", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x75" } },
    .{ "UiaEventAddWindow", MethodRecord{ .library = "UIAutomationCore", .import = "UiaEventAddWindow", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x75\x11\x25" } },
    .{ "UiaEventRemoveWindow", MethodRecord{ .library = "UIAutomationCore", .import = "UiaEventRemoveWindow", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x75\x11\x25" } },
    .{ "DockPattern_SetDockPosition", MethodRecord{ .library = "UIAutomationCore", .import = "DockPattern_SetDockPosition", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x29\x11\xc0\x00\x46\x79" } },
    .{ "ExpandCollapsePattern_Collapse", MethodRecord{ .library = "UIAutomationCore", .import = "ExpandCollapsePattern_Collapse", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x29" } },
    .{ "ExpandCollapsePattern_Expand", MethodRecord{ .library = "UIAutomationCore", .import = "ExpandCollapsePattern_Expand", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x29" } },
    .{ "GridPattern_GetItem", MethodRecord{ .library = "UIAutomationCore", .import = "GridPattern_GetItem", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x46\x29\x08\x08\x0f\x11\xc0\x00\x46\x25" } },
    .{ "InvokePattern_Invoke", MethodRecord{ .library = "UIAutomationCore", .import = "InvokePattern_Invoke", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x29" } },
    .{ "MultipleViewPattern_GetViewName", MethodRecord{ .library = "UIAutomationCore", .import = "MultipleViewPattern_GetViewName", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x46\x29\x08\x0f\x11\x8d\x35" } },
    .{ "MultipleViewPattern_SetCurrentView", MethodRecord{ .library = "UIAutomationCore", .import = "MultipleViewPattern_SetCurrentView", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x29\x08" } },
    .{ "RangeValuePattern_SetValue", MethodRecord{ .library = "UIAutomationCore", .import = "RangeValuePattern_SetValue", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x29\x0d" } },
    .{ "ScrollItemPattern_ScrollIntoView", MethodRecord{ .library = "UIAutomationCore", .import = "ScrollItemPattern_ScrollIntoView", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x29" } },
    .{ "ScrollPattern_Scroll", MethodRecord{ .library = "UIAutomationCore", .import = "ScrollPattern_Scroll", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x46\x29\x11\xc0\x00\x46\x7d\x11\xc0\x00\x46\x7d" } },
    .{ "ScrollPattern_SetScrollPercent", MethodRecord{ .library = "UIAutomationCore", .import = "ScrollPattern_SetScrollPercent", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x46\x29\x0d\x0d" } },
    .{ "SelectionItemPattern_AddToSelection", MethodRecord{ .library = "UIAutomationCore", .import = "SelectionItemPattern_AddToSelection", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x29" } },
    .{ "SelectionItemPattern_RemoveFromSelection", MethodRecord{ .library = "UIAutomationCore", .import = "SelectionItemPattern_RemoveFromSelection", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x29" } },
    .{ "SelectionItemPattern_Select", MethodRecord{ .library = "UIAutomationCore", .import = "SelectionItemPattern_Select", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x29" } },
    .{ "TogglePattern_Toggle", MethodRecord{ .library = "UIAutomationCore", .import = "TogglePattern_Toggle", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x29" } },
    .{ "TransformPattern_Move", MethodRecord{ .library = "UIAutomationCore", .import = "TransformPattern_Move", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x46\x29\x0d\x0d" } },
    .{ "TransformPattern_Resize", MethodRecord{ .library = "UIAutomationCore", .import = "TransformPattern_Resize", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x46\x29\x0d\x0d" } },
    .{ "TransformPattern_Rotate", MethodRecord{ .library = "UIAutomationCore", .import = "TransformPattern_Rotate", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x29\x0d" } },
    .{ "ValuePattern_SetValue", MethodRecord{ .library = "UIAutomationCore", .import = "ValuePattern_SetValue", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x29\x11\x05" } },
    .{ "WindowPattern_Close", MethodRecord{ .library = "UIAutomationCore", .import = "WindowPattern_Close", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x29" } },
    .{ "WindowPattern_SetWindowVisualState", MethodRecord{ .library = "UIAutomationCore", .import = "WindowPattern_SetWindowVisualState", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x29\x11\xc0\x00\x46\x81" } },
    .{ "WindowPattern_WaitForInputIdle", MethodRecord{ .library = "UIAutomationCore", .import = "WindowPattern_WaitForInputIdle", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x46\x29\x08\x0f\x11\x59" } },
    .{ "TextPattern_GetSelection", MethodRecord{ .library = "UIAutomationCore", .import = "TextPattern_GetSelection", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x29\x0f\x0f\x11\x99\x39" } },
    .{ "TextPattern_GetVisibleRanges", MethodRecord{ .library = "UIAutomationCore", .import = "TextPattern_GetVisibleRanges", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x29\x0f\x0f\x11\x99\x39" } },
    .{ "TextPattern_RangeFromChild", MethodRecord{ .library = "UIAutomationCore", .import = "TextPattern_RangeFromChild", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x46\x29\x11\xc0\x00\x46\x25\x0f\x11\xc0\x00\x46\x2d" } },
    .{ "TextPattern_RangeFromPoint", MethodRecord{ .library = "UIAutomationCore", .import = "TextPattern_RangeFromPoint", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x46\x29\x11\xc0\x00\x46\x85\x0f\x11\xc0\x00\x46\x2d" } },
    .{ "TextPattern_get_DocumentRange", MethodRecord{ .library = "UIAutomationCore", .import = "TextPattern_get_DocumentRange", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x29\x0f\x11\xc0\x00\x46\x2d" } },
    .{ "TextPattern_get_SupportedTextSelection", MethodRecord{ .library = "UIAutomationCore", .import = "TextPattern_get_SupportedTextSelection", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x29\x0f\x11\xc0\x00\x46\x89" } },
    .{ "TextRange_Clone", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_Clone", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x2d\x0f\x11\xc0\x00\x46\x2d" } },
    .{ "TextRange_Compare", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_Compare", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x46\x2d\x11\xc0\x00\x46\x2d\x0f\x11\x59" } },
    .{ "TextRange_CompareEndpoints", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_CompareEndpoints", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x46\x2d\x11\xc0\x00\x46\x8d\x11\xc0\x00\x46\x2d\x11\xc0\x00\x46\x8d\x0f\x08" } },
    .{ "TextRange_ExpandToEnclosingUnit", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_ExpandToEnclosingUnit", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x2d\x11\xc0\x00\x46\x91" } },
    .{ "TextRange_GetAttributeValue", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_GetAttributeValue", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x46\x2d\x08\x0f\x11\x94\x89" } },
    .{ "TextRange_FindAttribute", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_FindAttribute", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x46\x2d\x08\x11\x94\x89\x11\x59\x0f\x11\xc0\x00\x46\x2d" } },
    .{ "TextRange_FindText", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_FindText", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x46\x2d\x11\x8d\x35\x11\x59\x11\x59\x0f\x11\xc0\x00\x46\x2d" } },
    .{ "TextRange_GetBoundingRectangles", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_GetBoundingRectangles", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x2d\x0f\x0f\x11\x99\x39" } },
    .{ "TextRange_GetEnclosingElement", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_GetEnclosingElement", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x2d\x0f\x11\xc0\x00\x46\x25" } },
    .{ "TextRange_GetText", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_GetText", .signature = "\x00\x03\x11\x79\x11\xc0\x00\x46\x2d\x08\x0f\x11\x8d\x35" } },
    .{ "TextRange_Move", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_Move", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x46\x2d\x11\xc0\x00\x46\x91\x08\x0f\x08" } },
    .{ "TextRange_MoveEndpointByUnit", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_MoveEndpointByUnit", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x46\x2d\x11\xc0\x00\x46\x8d\x11\xc0\x00\x46\x91\x08\x0f\x08" } },
    .{ "TextRange_MoveEndpointByRange", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_MoveEndpointByRange", .signature = "\x00\x04\x11\x79\x11\xc0\x00\x46\x2d\x11\xc0\x00\x46\x8d\x11\xc0\x00\x46\x2d\x11\xc0\x00\x46\x8d" } },
    .{ "TextRange_Select", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_Select", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x2d" } },
    .{ "TextRange_AddToSelection", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_AddToSelection", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x2d" } },
    .{ "TextRange_RemoveFromSelection", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_RemoveFromSelection", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x2d" } },
    .{ "TextRange_ScrollIntoView", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_ScrollIntoView", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x2d\x11\x59" } },
    .{ "TextRange_GetChildren", MethodRecord{ .library = "UIAutomationCore", .import = "TextRange_GetChildren", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x2d\x0f\x0f\x11\x99\x39" } },
    .{ "ItemContainerPattern_FindItemByProperty", MethodRecord{ .library = "UIAutomationCore", .import = "ItemContainerPattern_FindItemByProperty", .signature = "\x00\x05\x11\x79\x11\xc0\x00\x46\x29\x11\xc0\x00\x46\x25\x08\x11\x94\x89\x0f\x11\xc0\x00\x46\x25" } },
    .{ "LegacyIAccessiblePattern_Select", MethodRecord{ .library = "UIAutomationCore", .import = "LegacyIAccessiblePattern_Select", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x29\x08" } },
    .{ "LegacyIAccessiblePattern_DoDefaultAction", MethodRecord{ .library = "UIAutomationCore", .import = "LegacyIAccessiblePattern_DoDefaultAction", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x29" } },
    .{ "LegacyIAccessiblePattern_SetValue", MethodRecord{ .library = "UIAutomationCore", .import = "LegacyIAccessiblePattern_SetValue", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x29\x11\x05" } },
    .{ "LegacyIAccessiblePattern_GetIAccessible", MethodRecord{ .library = "UIAutomationCore", .import = "LegacyIAccessiblePattern_GetIAccessible", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x29\x0f\x12\xc0\x00\x46\x21" } },
    .{ "SynchronizedInputPattern_StartListening", MethodRecord{ .library = "UIAutomationCore", .import = "SynchronizedInputPattern_StartListening", .signature = "\x00\x02\x11\x79\x11\xc0\x00\x46\x29\x11\xc0\x00\x46\x95" } },
    .{ "SynchronizedInputPattern_Cancel", MethodRecord{ .library = "UIAutomationCore", .import = "SynchronizedInputPattern_Cancel", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x29" } },
    .{ "VirtualizedItemPattern_Realize", MethodRecord{ .library = "UIAutomationCore", .import = "VirtualizedItemPattern_Realize", .signature = "\x00\x01\x11\x79\x11\xc0\x00\x46\x29" } },
    .{ "UiaPatternRelease", MethodRecord{ .library = "UIAutomationCore", .import = "UiaPatternRelease", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x46\x29" } },
    .{ "UiaTextRangeRelease", MethodRecord{ .library = "UIAutomationCore", .import = "UiaTextRangeRelease", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x46\x2d" } },
    .{ "UiaReturnRawElementProvider", MethodRecord{ .library = "UIAutomationCore", .import = "UiaReturnRawElementProvider", .signature = "\x00\x04\x11\x82\x35\x11\x25\x11\x83\x8d\x11\x82\x2d\x12\xc0\x00\x46\x45" } },
    .{ "UiaHostProviderFromHwnd", MethodRecord{ .library = "UIAutomationCore", .import = "UiaHostProviderFromHwnd", .signature = "\x00\x02\x11\x79\x11\x25\x0f\x12\xc0\x00\x46\x45" } },
    .{ "UiaProviderForNonClient", MethodRecord{ .library = "UIAutomationCore", .import = "UiaProviderForNonClient", .signature = "\x00\x04\x11\x79\x11\x25\x08\x08\x0f\x12\xc0\x00\x46\x45" } },
    .{ "UiaIAccessibleFromProvider", MethodRecord{ .library = "UIAutomationCore", .import = "UiaIAccessibleFromProvider", .signature = "\x00\x04\x11\x79\x12\xc0\x00\x46\x45\x09\x0f\x12\xc0\x00\x46\x21\x0f\x11\x94\x89" } },
    .{ "UiaProviderFromIAccessible", MethodRecord{ .library = "UIAutomationCore", .import = "UiaProviderFromIAccessible", .signature = "\x00\x04\x11\x79\x12\xc0\x00\x46\x21\x08\x09\x0f\x12\xc0\x00\x46\x45" } },
    .{ "UiaDisconnectAllProviders", MethodRecord{ .library = "UIAutomationCore", .import = "UiaDisconnectAllProviders", .signature = "\x00\x00\x11\x79" } },
    .{ "UiaDisconnectProvider", MethodRecord{ .library = "UIAutomationCore", .import = "UiaDisconnectProvider", .signature = "\x00\x01\x11\x79\x12\xc0\x00\x46\x45" } },
    .{ "UiaHasServerSideProvider", MethodRecord{ .library = "UIAutomationCore", .import = "UiaHasServerSideProvider", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "RegisterPointerInputTarget", MethodRecord{ .library = "USER32", .import = "RegisterPointerInputTarget", .signature = "\x00\x02\x11\x59\x11\x25\x11\x84\x3d" } },
    .{ "UnregisterPointerInputTarget", MethodRecord{ .library = "USER32", .import = "UnregisterPointerInputTarget", .signature = "\x00\x02\x11\x59\x11\x25\x11\x84\x3d" } },
    .{ "RegisterPointerInputTargetEx", MethodRecord{ .library = "USER32", .import = "RegisterPointerInputTargetEx", .signature = "\x00\x03\x11\x59\x11\x25\x11\x84\x3d\x11\x59" } },
    .{ "UnregisterPointerInputTargetEx", MethodRecord{ .library = "USER32", .import = "UnregisterPointerInputTargetEx", .signature = "\x00\x02\x11\x59\x11\x25\x11\x84\x3d" } },
    .{ "NotifyWinEvent", MethodRecord{ .library = "USER32", .import = "NotifyWinEvent", .signature = "\x00\x04\x01\x09\x11\x25\x08\x08" } },
    .{ "SetWinEventHook", MethodRecord{ .library = "USER32", .import = "SetWinEventHook", .signature = "\x00\x07\x11\xc0\x00\x46\x99\x09\x09\x11\x81\x81\x12\xc0\x00\x46\x9d\x09\x09\x09" } },
    .{ "IsWinEventHookInstalled", MethodRecord{ .library = "USER32", .import = "IsWinEventHookInstalled", .signature = "\x00\x01\x11\x59\x09" } },
    .{ "UnhookWinEvent", MethodRecord{ .library = "USER32", .import = "UnhookWinEvent", .signature = "\x00\x01\x11\x59\x11\xc0\x00\x46\x99" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x181 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HMODULE" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x235 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LRESULT" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        0x371 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "POINT" },
        0x38d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WPARAM" },
        0x43d => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "POINTER_INPUT_TYPE" },
        0xd35 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BSTR" },
        0x1489 => TypeRefEntry{ .namespace = "Windows.Win32.System.Variant", .name = "VARIANT" },
        0x1939 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "SAFEARRAY" },
        0x2491 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "ACC_UTILITY_STATE_FLAGS" },
        0x24ad => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "UIA_EVENT_ID" },
        0x24b1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "UIA_PROPERTY_ID" },
        0x4621 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "IAccessible" },
        0x4625 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "HUIANODE" },
        0x4629 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "HUIAPATTERNOBJECT" },
        0x462d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "HUIATEXTRANGE" },
        0x4631 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "NavigateDirection" },
        0x4635 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "UiaCondition" },
        0x4639 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "UiaCacheRequest" },
        0x463d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "NormalizeState" },
        0x4641 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "UiaFindParams" },
        0x4645 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "IRawElementProviderSimple" },
        0x4649 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "UiaProviderCallback" },
        0x464d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "AutomationIdentifierType" },
        0x4651 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "StructureChangeType" },
        0x4655 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "AsyncContentLoadedState" },
        0x4659 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "TextEditChangeType" },
        0x465d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "UiaChangeInfo" },
        0x4661 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "NotificationKind" },
        0x4665 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "NotificationProcessing" },
        0x4669 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "ITextRangeProvider" },
        0x466d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "UiaEventCallback" },
        0x4671 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "TreeScope" },
        0x4675 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "HUIAEVENT" },
        0x4679 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "DockPosition" },
        0x467d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "ScrollAmount" },
        0x4681 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "WindowVisualState" },
        0x4685 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "UiaPoint" },
        0x4689 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "SupportedTextSelection" },
        0x468d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "TextPatternRangeEndpoint" },
        0x4691 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "TextUnit" },
        0x4695 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "SynchronizedInputType" },
        0x4699 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "HWINEVENTHOOK" },
        0x469d => TypeRefEntry{ .namespace = "Windows.Win32.UI.Accessibility", .name = "WINEVENTPROC" },
        else => null,
    };
}

pub const SKF_STICKYKEYSON = 1;
pub const SKF_AVAILABLE = 2;
pub const SKF_HOTKEYACTIVE = 4;
pub const SKF_CONFIRMHOTKEY = 8;
pub const SKF_HOTKEYSOUND = 16;
pub const SKF_INDICATOR = 32;
pub const SKF_AUDIBLEFEEDBACK = 64;
pub const SKF_TRISTATE = 128;
pub const SKF_TWOKEYSOFF = 256;
pub const SKF_LALTLATCHED = 268435456;
pub const SKF_LCTLLATCHED = 67108864;
pub const SKF_LSHIFTLATCHED = 16777216;
pub const SKF_RALTLATCHED = 536870912;
pub const SKF_RCTLLATCHED = 134217728;
pub const SKF_RSHIFTLATCHED = 33554432;
pub const SKF_LWINLATCHED = 1073741824;
pub const SKF_RWINLATCHED = 2147483648;
pub const SKF_LALTLOCKED = 1048576;
pub const SKF_LCTLLOCKED = 262144;
pub const SKF_LSHIFTLOCKED = 65536;
pub const SKF_RALTLOCKED = 2097152;
pub const SKF_RCTLLOCKED = 524288;
pub const SKF_RSHIFTLOCKED = 131072;
pub const SKF_LWINLOCKED = 4194304;
pub const SKF_RWINLOCKED = 8388608;
pub const SSF_SOUNDSENTRYON = 1;
pub const SSF_AVAILABLE = 2;
pub const SSF_INDICATOR = 4;
pub const ANRUS_ON_SCREEN_KEYBOARD_ACTIVE = 1;
pub const ANRUS_TOUCH_MODIFICATION_ACTIVE = 2;
pub const ANRUS_PRIORITY_AUDIO_ACTIVE = 4;
pub const ANRUS_PRIORITY_AUDIO_ACTIVE_NODUCK = 8;
pub const SSGF_DISPLAY = 3;
pub const SSGF_NONE = 0;
pub const SERKF_AVAILABLE = 2;
pub const SERKF_INDICATOR = 4;
pub const SERKF_SERIALKEYSON = 1;
pub const HCF_HIGHCONTRASTON = 1;
pub const HCF_AVAILABLE = 2;
pub const HCF_HOTKEYACTIVE = 4;
pub const HCF_CONFIRMHOTKEY = 8;
pub const HCF_HOTKEYSOUND = 16;
pub const HCF_INDICATOR = 32;
pub const HCF_HOTKEYAVAILABLE = 64;
pub const HCF_OPTION_NOTHEMECHANGE = 4096;
pub const SSTF_BORDER = 2;
pub const SSTF_CHARS = 1;
pub const SSTF_DISPLAY = 3;
pub const SSTF_NONE = 0;
pub const SSWF_CUSTOM = 4;
pub const SSWF_DISPLAY = 3;
pub const SSWF_NONE = 0;
pub const SSWF_TITLE = 1;
pub const SSWF_WINDOW = 2;
pub const UIA_InvokePatternId = 10000;
pub const UIA_SelectionPatternId = 10001;
pub const UIA_ValuePatternId = 10002;
pub const UIA_RangeValuePatternId = 10003;
pub const UIA_ScrollPatternId = 10004;
pub const UIA_ExpandCollapsePatternId = 10005;
pub const UIA_GridPatternId = 10006;
pub const UIA_GridItemPatternId = 10007;
pub const UIA_MultipleViewPatternId = 10008;
pub const UIA_WindowPatternId = 10009;
pub const UIA_SelectionItemPatternId = 10010;
pub const UIA_DockPatternId = 10011;
pub const UIA_TablePatternId = 10012;
pub const UIA_TableItemPatternId = 10013;
pub const UIA_TextPatternId = 10014;
pub const UIA_TogglePatternId = 10015;
pub const UIA_TransformPatternId = 10016;
pub const UIA_ScrollItemPatternId = 10017;
pub const UIA_LegacyIAccessiblePatternId = 10018;
pub const UIA_ItemContainerPatternId = 10019;
pub const UIA_VirtualizedItemPatternId = 10020;
pub const UIA_SynchronizedInputPatternId = 10021;
pub const UIA_ObjectModelPatternId = 10022;
pub const UIA_AnnotationPatternId = 10023;
pub const UIA_TextPattern2Id = 10024;
pub const UIA_StylesPatternId = 10025;
pub const UIA_SpreadsheetPatternId = 10026;
pub const UIA_SpreadsheetItemPatternId = 10027;
pub const UIA_TransformPattern2Id = 10028;
pub const UIA_TextChildPatternId = 10029;
pub const UIA_DragPatternId = 10030;
pub const UIA_DropTargetPatternId = 10031;
pub const UIA_TextEditPatternId = 10032;
pub const UIA_CustomNavigationPatternId = 10033;
pub const UIA_SelectionPattern2Id = 10034;
pub const UIA_ToolTipOpenedEventId = 20000;
pub const UIA_ToolTipClosedEventId = 20001;
pub const UIA_StructureChangedEventId = 20002;
pub const UIA_MenuOpenedEventId = 20003;
pub const UIA_AutomationPropertyChangedEventId = 20004;
pub const UIA_AutomationFocusChangedEventId = 20005;
pub const UIA_AsyncContentLoadedEventId = 20006;
pub const UIA_MenuClosedEventId = 20007;
pub const UIA_LayoutInvalidatedEventId = 20008;
pub const UIA_Invoke_InvokedEventId = 20009;
pub const UIA_SelectionItem_ElementAddedToSelectionEventId = 20010;
pub const UIA_SelectionItem_ElementRemovedFromSelectionEventId = 20011;
pub const UIA_SelectionItem_ElementSelectedEventId = 20012;
pub const UIA_Selection_InvalidatedEventId = 20013;
pub const UIA_Text_TextSelectionChangedEventId = 20014;
pub const UIA_Text_TextChangedEventId = 20015;
pub const UIA_Window_WindowOpenedEventId = 20016;
pub const UIA_Window_WindowClosedEventId = 20017;
pub const UIA_MenuModeStartEventId = 20018;
pub const UIA_MenuModeEndEventId = 20019;
pub const UIA_InputReachedTargetEventId = 20020;
pub const UIA_InputReachedOtherElementEventId = 20021;
pub const UIA_InputDiscardedEventId = 20022;
pub const UIA_SystemAlertEventId = 20023;
pub const UIA_LiveRegionChangedEventId = 20024;
pub const UIA_HostedFragmentRootsInvalidatedEventId = 20025;
pub const UIA_Drag_DragStartEventId = 20026;
pub const UIA_Drag_DragCancelEventId = 20027;
pub const UIA_Drag_DragCompleteEventId = 20028;
pub const UIA_DropTarget_DragEnterEventId = 20029;
pub const UIA_DropTarget_DragLeaveEventId = 20030;
pub const UIA_DropTarget_DroppedEventId = 20031;
pub const UIA_TextEdit_TextChangedEventId = 20032;
pub const UIA_TextEdit_ConversionTargetChangedEventId = 20033;
pub const UIA_ChangesEventId = 20034;
pub const UIA_NotificationEventId = 20035;
pub const UIA_ActiveTextPositionChangedEventId = 20036;
pub const UIA_RuntimeIdPropertyId = 30000;
pub const UIA_BoundingRectanglePropertyId = 30001;
pub const UIA_ProcessIdPropertyId = 30002;
pub const UIA_ControlTypePropertyId = 30003;
pub const UIA_LocalizedControlTypePropertyId = 30004;
pub const UIA_NamePropertyId = 30005;
pub const UIA_AcceleratorKeyPropertyId = 30006;
pub const UIA_AccessKeyPropertyId = 30007;
pub const UIA_HasKeyboardFocusPropertyId = 30008;
pub const UIA_IsKeyboardFocusablePropertyId = 30009;
pub const UIA_IsEnabledPropertyId = 30010;
pub const UIA_AutomationIdPropertyId = 30011;
pub const UIA_ClassNamePropertyId = 30012;
pub const UIA_HelpTextPropertyId = 30013;
pub const UIA_ClickablePointPropertyId = 30014;
pub const UIA_CulturePropertyId = 30015;
pub const UIA_IsControlElementPropertyId = 30016;
pub const UIA_IsContentElementPropertyId = 30017;
pub const UIA_LabeledByPropertyId = 30018;
pub const UIA_IsPasswordPropertyId = 30019;
pub const UIA_NativeWindowHandlePropertyId = 30020;
pub const UIA_ItemTypePropertyId = 30021;
pub const UIA_IsOffscreenPropertyId = 30022;
pub const UIA_OrientationPropertyId = 30023;
pub const UIA_FrameworkIdPropertyId = 30024;
pub const UIA_IsRequiredForFormPropertyId = 30025;
pub const UIA_ItemStatusPropertyId = 30026;
pub const UIA_IsDockPatternAvailablePropertyId = 30027;
pub const UIA_IsExpandCollapsePatternAvailablePropertyId = 30028;
pub const UIA_IsGridItemPatternAvailablePropertyId = 30029;
pub const UIA_IsGridPatternAvailablePropertyId = 30030;
pub const UIA_IsInvokePatternAvailablePropertyId = 30031;
pub const UIA_IsMultipleViewPatternAvailablePropertyId = 30032;
pub const UIA_IsRangeValuePatternAvailablePropertyId = 30033;
pub const UIA_IsScrollPatternAvailablePropertyId = 30034;
pub const UIA_IsScrollItemPatternAvailablePropertyId = 30035;
pub const UIA_IsSelectionItemPatternAvailablePropertyId = 30036;
pub const UIA_IsSelectionPatternAvailablePropertyId = 30037;
pub const UIA_IsTablePatternAvailablePropertyId = 30038;
pub const UIA_IsTableItemPatternAvailablePropertyId = 30039;
pub const UIA_IsTextPatternAvailablePropertyId = 30040;
pub const UIA_IsTogglePatternAvailablePropertyId = 30041;
pub const UIA_IsTransformPatternAvailablePropertyId = 30042;
pub const UIA_IsValuePatternAvailablePropertyId = 30043;
pub const UIA_IsWindowPatternAvailablePropertyId = 30044;
pub const UIA_ValueValuePropertyId = 30045;
pub const UIA_ValueIsReadOnlyPropertyId = 30046;
pub const UIA_RangeValueValuePropertyId = 30047;
pub const UIA_RangeValueIsReadOnlyPropertyId = 30048;
pub const UIA_RangeValueMinimumPropertyId = 30049;
pub const UIA_RangeValueMaximumPropertyId = 30050;
pub const UIA_RangeValueLargeChangePropertyId = 30051;
pub const UIA_RangeValueSmallChangePropertyId = 30052;
pub const UIA_ScrollHorizontalScrollPercentPropertyId = 30053;
pub const UIA_ScrollHorizontalViewSizePropertyId = 30054;
pub const UIA_ScrollVerticalScrollPercentPropertyId = 30055;
pub const UIA_ScrollVerticalViewSizePropertyId = 30056;
pub const UIA_ScrollHorizontallyScrollablePropertyId = 30057;
pub const UIA_ScrollVerticallyScrollablePropertyId = 30058;
pub const UIA_SelectionSelectionPropertyId = 30059;
pub const UIA_SelectionCanSelectMultiplePropertyId = 30060;
pub const UIA_SelectionIsSelectionRequiredPropertyId = 30061;
pub const UIA_GridRowCountPropertyId = 30062;
pub const UIA_GridColumnCountPropertyId = 30063;
pub const UIA_GridItemRowPropertyId = 30064;
pub const UIA_GridItemColumnPropertyId = 30065;
pub const UIA_GridItemRowSpanPropertyId = 30066;
pub const UIA_GridItemColumnSpanPropertyId = 30067;
pub const UIA_GridItemContainingGridPropertyId = 30068;
pub const UIA_DockDockPositionPropertyId = 30069;
pub const UIA_ExpandCollapseExpandCollapseStatePropertyId = 30070;
pub const UIA_MultipleViewCurrentViewPropertyId = 30071;
pub const UIA_MultipleViewSupportedViewsPropertyId = 30072;
pub const UIA_WindowCanMaximizePropertyId = 30073;
pub const UIA_WindowCanMinimizePropertyId = 30074;
pub const UIA_WindowWindowVisualStatePropertyId = 30075;
pub const UIA_WindowWindowInteractionStatePropertyId = 30076;
pub const UIA_WindowIsModalPropertyId = 30077;
pub const UIA_WindowIsTopmostPropertyId = 30078;
pub const UIA_SelectionItemIsSelectedPropertyId = 30079;
pub const UIA_SelectionItemSelectionContainerPropertyId = 30080;
pub const UIA_TableRowHeadersPropertyId = 30081;
pub const UIA_TableColumnHeadersPropertyId = 30082;
pub const UIA_TableRowOrColumnMajorPropertyId = 30083;
pub const UIA_TableItemRowHeaderItemsPropertyId = 30084;
pub const UIA_TableItemColumnHeaderItemsPropertyId = 30085;
pub const UIA_ToggleToggleStatePropertyId = 30086;
pub const UIA_TransformCanMovePropertyId = 30087;
pub const UIA_TransformCanResizePropertyId = 30088;
pub const UIA_TransformCanRotatePropertyId = 30089;
pub const UIA_IsLegacyIAccessiblePatternAvailablePropertyId = 30090;
pub const UIA_LegacyIAccessibleChildIdPropertyId = 30091;
pub const UIA_LegacyIAccessibleNamePropertyId = 30092;
pub const UIA_LegacyIAccessibleValuePropertyId = 30093;
pub const UIA_LegacyIAccessibleDescriptionPropertyId = 30094;
pub const UIA_LegacyIAccessibleRolePropertyId = 30095;
pub const UIA_LegacyIAccessibleStatePropertyId = 30096;
pub const UIA_LegacyIAccessibleHelpPropertyId = 30097;
pub const UIA_LegacyIAccessibleKeyboardShortcutPropertyId = 30098;
pub const UIA_LegacyIAccessibleSelectionPropertyId = 30099;
pub const UIA_LegacyIAccessibleDefaultActionPropertyId = 30100;
pub const UIA_AriaRolePropertyId = 30101;
pub const UIA_AriaPropertiesPropertyId = 30102;
pub const UIA_IsDataValidForFormPropertyId = 30103;
pub const UIA_ControllerForPropertyId = 30104;
pub const UIA_DescribedByPropertyId = 30105;
pub const UIA_FlowsToPropertyId = 30106;
pub const UIA_ProviderDescriptionPropertyId = 30107;
pub const UIA_IsItemContainerPatternAvailablePropertyId = 30108;
pub const UIA_IsVirtualizedItemPatternAvailablePropertyId = 30109;
pub const UIA_IsSynchronizedInputPatternAvailablePropertyId = 30110;
pub const UIA_OptimizeForVisualContentPropertyId = 30111;
pub const UIA_IsObjectModelPatternAvailablePropertyId = 30112;
pub const UIA_AnnotationAnnotationTypeIdPropertyId = 30113;
pub const UIA_AnnotationAnnotationTypeNamePropertyId = 30114;
pub const UIA_AnnotationAuthorPropertyId = 30115;
pub const UIA_AnnotationDateTimePropertyId = 30116;
pub const UIA_AnnotationTargetPropertyId = 30117;
pub const UIA_IsAnnotationPatternAvailablePropertyId = 30118;
pub const UIA_IsTextPattern2AvailablePropertyId = 30119;
pub const UIA_StylesStyleIdPropertyId = 30120;
pub const UIA_StylesStyleNamePropertyId = 30121;
pub const UIA_StylesFillColorPropertyId = 30122;
pub const UIA_StylesFillPatternStylePropertyId = 30123;
pub const UIA_StylesShapePropertyId = 30124;
pub const UIA_StylesFillPatternColorPropertyId = 30125;
pub const UIA_StylesExtendedPropertiesPropertyId = 30126;
pub const UIA_IsStylesPatternAvailablePropertyId = 30127;
pub const UIA_IsSpreadsheetPatternAvailablePropertyId = 30128;
pub const UIA_SpreadsheetItemFormulaPropertyId = 30129;
pub const UIA_SpreadsheetItemAnnotationObjectsPropertyId = 30130;
pub const UIA_SpreadsheetItemAnnotationTypesPropertyId = 30131;
pub const UIA_IsSpreadsheetItemPatternAvailablePropertyId = 30132;
pub const UIA_Transform2CanZoomPropertyId = 30133;
pub const UIA_IsTransformPattern2AvailablePropertyId = 30134;
pub const UIA_LiveSettingPropertyId = 30135;
pub const UIA_IsTextChildPatternAvailablePropertyId = 30136;
pub const UIA_IsDragPatternAvailablePropertyId = 30137;
pub const UIA_DragIsGrabbedPropertyId = 30138;
pub const UIA_DragDropEffectPropertyId = 30139;
pub const UIA_DragDropEffectsPropertyId = 30140;
pub const UIA_IsDropTargetPatternAvailablePropertyId = 30141;
pub const UIA_DropTargetDropTargetEffectPropertyId = 30142;
pub const UIA_DropTargetDropTargetEffectsPropertyId = 30143;
pub const UIA_DragGrabbedItemsPropertyId = 30144;
pub const UIA_Transform2ZoomLevelPropertyId = 30145;
pub const UIA_Transform2ZoomMinimumPropertyId = 30146;
pub const UIA_Transform2ZoomMaximumPropertyId = 30147;
pub const UIA_FlowsFromPropertyId = 30148;
pub const UIA_IsTextEditPatternAvailablePropertyId = 30149;
pub const UIA_IsPeripheralPropertyId = 30150;
pub const UIA_IsCustomNavigationPatternAvailablePropertyId = 30151;
pub const UIA_PositionInSetPropertyId = 30152;
pub const UIA_SizeOfSetPropertyId = 30153;
pub const UIA_LevelPropertyId = 30154;
pub const UIA_AnnotationTypesPropertyId = 30155;
pub const UIA_AnnotationObjectsPropertyId = 30156;
pub const UIA_LandmarkTypePropertyId = 30157;
pub const UIA_LocalizedLandmarkTypePropertyId = 30158;
pub const UIA_FullDescriptionPropertyId = 30159;
pub const UIA_FillColorPropertyId = 30160;
pub const UIA_OutlineColorPropertyId = 30161;
pub const UIA_FillTypePropertyId = 30162;
pub const UIA_VisualEffectsPropertyId = 30163;
pub const UIA_OutlineThicknessPropertyId = 30164;
pub const UIA_CenterPointPropertyId = 30165;
pub const UIA_RotationPropertyId = 30166;
pub const UIA_SizePropertyId = 30167;
pub const UIA_IsSelectionPattern2AvailablePropertyId = 30168;
pub const UIA_Selection2FirstSelectedItemPropertyId = 30169;
pub const UIA_Selection2LastSelectedItemPropertyId = 30170;
pub const UIA_Selection2CurrentSelectedItemPropertyId = 30171;
pub const UIA_Selection2ItemCountPropertyId = 30172;
pub const UIA_HeadingLevelPropertyId = 30173;
pub const UIA_IsDialogPropertyId = 30174;
pub const UIA_AnimationStyleAttributeId = 40000;
pub const UIA_BackgroundColorAttributeId = 40001;
pub const UIA_BulletStyleAttributeId = 40002;
pub const UIA_CapStyleAttributeId = 40003;
pub const UIA_CultureAttributeId = 40004;
pub const UIA_FontNameAttributeId = 40005;
pub const UIA_FontSizeAttributeId = 40006;
pub const UIA_FontWeightAttributeId = 40007;
pub const UIA_ForegroundColorAttributeId = 40008;
pub const UIA_HorizontalTextAlignmentAttributeId = 40009;
pub const UIA_IndentationFirstLineAttributeId = 40010;
pub const UIA_IndentationLeadingAttributeId = 40011;
pub const UIA_IndentationTrailingAttributeId = 40012;
pub const UIA_IsHiddenAttributeId = 40013;
pub const UIA_IsItalicAttributeId = 40014;
pub const UIA_IsReadOnlyAttributeId = 40015;
pub const UIA_IsSubscriptAttributeId = 40016;
pub const UIA_IsSuperscriptAttributeId = 40017;
pub const UIA_MarginBottomAttributeId = 40018;
pub const UIA_MarginLeadingAttributeId = 40019;
pub const UIA_MarginTopAttributeId = 40020;
pub const UIA_MarginTrailingAttributeId = 40021;
pub const UIA_OutlineStylesAttributeId = 40022;
pub const UIA_OverlineColorAttributeId = 40023;
pub const UIA_OverlineStyleAttributeId = 40024;
pub const UIA_StrikethroughColorAttributeId = 40025;
pub const UIA_StrikethroughStyleAttributeId = 40026;
pub const UIA_TabsAttributeId = 40027;
pub const UIA_TextFlowDirectionsAttributeId = 40028;
pub const UIA_UnderlineColorAttributeId = 40029;
pub const UIA_UnderlineStyleAttributeId = 40030;
pub const UIA_AnnotationTypesAttributeId = 40031;
pub const UIA_AnnotationObjectsAttributeId = 40032;
pub const UIA_StyleNameAttributeId = 40033;
pub const UIA_StyleIdAttributeId = 40034;
pub const UIA_LinkAttributeId = 40035;
pub const UIA_IsActiveAttributeId = 40036;
pub const UIA_SelectionActiveEndAttributeId = 40037;
pub const UIA_CaretPositionAttributeId = 40038;
pub const UIA_CaretBidiModeAttributeId = 40039;
pub const UIA_LineSpacingAttributeId = 40040;
pub const UIA_BeforeParagraphSpacingAttributeId = 40041;
pub const UIA_AfterParagraphSpacingAttributeId = 40042;
pub const UIA_SayAsInterpretAsAttributeId = 40043;
pub const UIA_ButtonControlTypeId = 50000;
pub const UIA_CalendarControlTypeId = 50001;
pub const UIA_CheckBoxControlTypeId = 50002;
pub const UIA_ComboBoxControlTypeId = 50003;
pub const UIA_EditControlTypeId = 50004;
pub const UIA_HyperlinkControlTypeId = 50005;
pub const UIA_ImageControlTypeId = 50006;
pub const UIA_ListItemControlTypeId = 50007;
pub const UIA_ListControlTypeId = 50008;
pub const UIA_MenuControlTypeId = 50009;
pub const UIA_MenuBarControlTypeId = 50010;
pub const UIA_MenuItemControlTypeId = 50011;
pub const UIA_ProgressBarControlTypeId = 50012;
pub const UIA_RadioButtonControlTypeId = 50013;
pub const UIA_ScrollBarControlTypeId = 50014;
pub const UIA_SliderControlTypeId = 50015;
pub const UIA_SpinnerControlTypeId = 50016;
pub const UIA_StatusBarControlTypeId = 50017;
pub const UIA_TabControlTypeId = 50018;
pub const UIA_TabItemControlTypeId = 50019;
pub const UIA_TextControlTypeId = 50020;
pub const UIA_ToolBarControlTypeId = 50021;
pub const UIA_ToolTipControlTypeId = 50022;
pub const UIA_TreeControlTypeId = 50023;
pub const UIA_TreeItemControlTypeId = 50024;
pub const UIA_CustomControlTypeId = 50025;
pub const UIA_GroupControlTypeId = 50026;
pub const UIA_ThumbControlTypeId = 50027;
pub const UIA_DataGridControlTypeId = 50028;
pub const UIA_DataItemControlTypeId = 50029;
pub const UIA_DocumentControlTypeId = 50030;
pub const UIA_SplitButtonControlTypeId = 50031;
pub const UIA_WindowControlTypeId = 50032;
pub const UIA_PaneControlTypeId = 50033;
pub const UIA_HeaderControlTypeId = 50034;
pub const UIA_HeaderItemControlTypeId = 50035;
pub const UIA_TableControlTypeId = 50036;
pub const UIA_TitleBarControlTypeId = 50037;
pub const UIA_SeparatorControlTypeId = 50038;
pub const UIA_SemanticZoomControlTypeId = 50039;
pub const UIA_AppBarControlTypeId = 50040;
pub const AnnotationType_Unknown = 60000;
pub const AnnotationType_SpellingError = 60001;
pub const AnnotationType_GrammarError = 60002;
pub const AnnotationType_Comment = 60003;
pub const AnnotationType_FormulaError = 60004;
pub const AnnotationType_TrackChanges = 60005;
pub const AnnotationType_Header = 60006;
pub const AnnotationType_Footer = 60007;
pub const AnnotationType_Highlighted = 60008;
pub const AnnotationType_Endnote = 60009;
pub const AnnotationType_Footnote = 60010;
pub const AnnotationType_InsertionChange = 60011;
pub const AnnotationType_DeletionChange = 60012;
pub const AnnotationType_MoveChange = 60013;
pub const AnnotationType_FormatChange = 60014;
pub const AnnotationType_UnsyncedChange = 60015;
pub const AnnotationType_EditingLockedChange = 60016;
pub const AnnotationType_ExternalChange = 60017;
pub const AnnotationType_ConflictingChange = 60018;
pub const AnnotationType_Author = 60019;
pub const AnnotationType_AdvancedProofingIssue = 60020;
pub const AnnotationType_DataValidationError = 60021;
pub const AnnotationType_CircularReferenceError = 60022;
pub const AnnotationType_Mathematics = 60023;
pub const AnnotationType_Sensitive = 60024;
pub const StyleId_Custom = 70000;
pub const StyleId_Heading1 = 70001;
pub const StyleId_Heading2 = 70002;
pub const StyleId_Heading3 = 70003;
pub const StyleId_Heading4 = 70004;
pub const StyleId_Heading5 = 70005;
pub const StyleId_Heading6 = 70006;
pub const StyleId_Heading7 = 70007;
pub const StyleId_Heading8 = 70008;
pub const StyleId_Heading9 = 70009;
pub const StyleId_Title = 70010;
pub const StyleId_Subtitle = 70011;
pub const StyleId_Normal = 70012;
pub const StyleId_Emphasis = 70013;
pub const StyleId_Quote = 70014;
pub const StyleId_BulletedList = 70015;
pub const StyleId_NumberedList = 70016;
pub const UIA_CustomLandmarkTypeId = 80000;
pub const UIA_FormLandmarkTypeId = 80001;
pub const UIA_MainLandmarkTypeId = 80002;
pub const UIA_NavigationLandmarkTypeId = 80003;
pub const UIA_SearchLandmarkTypeId = 80004;
pub const HeadingLevel_None = 80050;
pub const HeadingLevel1 = 80051;
pub const HeadingLevel2 = 80052;
pub const HeadingLevel3 = 80053;
pub const HeadingLevel4 = 80054;
pub const HeadingLevel5 = 80055;
pub const HeadingLevel6 = 80056;
pub const HeadingLevel7 = 80057;
pub const HeadingLevel8 = 80058;
pub const HeadingLevel9 = 80059;
pub const UIA_SummaryChangeId = 90000;
pub const UIA_SayAsInterpretAsMetadataId = 100000;
pub const ANRUS_PRIORITY_AUDIO_DYNAMIC_DUCK = 16;
pub const MSAA_MENU_SIG = -1441927155;
pub const DISPID_ACC_PARENT = -5000;
pub const DISPID_ACC_CHILDCOUNT = -5001;
pub const DISPID_ACC_CHILD = -5002;
pub const DISPID_ACC_NAME = -5003;
pub const DISPID_ACC_VALUE = -5004;
pub const DISPID_ACC_DESCRIPTION = -5005;
pub const DISPID_ACC_ROLE = -5006;
pub const DISPID_ACC_STATE = -5007;
pub const DISPID_ACC_HELP = -5008;
pub const DISPID_ACC_HELPTOPIC = -5009;
pub const DISPID_ACC_KEYBOARDSHORTCUT = -5010;
pub const DISPID_ACC_FOCUS = -5011;
pub const DISPID_ACC_SELECTION = -5012;
pub const DISPID_ACC_DEFAULTACTION = -5013;
pub const DISPID_ACC_SELECT = -5014;
pub const DISPID_ACC_LOCATION = -5015;
pub const DISPID_ACC_NAVIGATE = -5016;
pub const DISPID_ACC_HITTEST = -5017;
pub const DISPID_ACC_DODEFAULTACTION = -5018;
pub const NAVDIR_MIN = 0;
pub const NAVDIR_UP = 1;
pub const NAVDIR_DOWN = 2;
pub const NAVDIR_LEFT = 3;
pub const NAVDIR_RIGHT = 4;
pub const NAVDIR_NEXT = 5;
pub const NAVDIR_PREVIOUS = 6;
pub const NAVDIR_FIRSTCHILD = 7;
pub const NAVDIR_LASTCHILD = 8;
pub const NAVDIR_MAX = 9;
pub const SELFLAG_NONE = 0;
pub const SELFLAG_TAKEFOCUS = 1;
pub const SELFLAG_TAKESELECTION = 2;
pub const SELFLAG_EXTENDSELECTION = 4;
pub const SELFLAG_ADDSELECTION = 8;
pub const SELFLAG_REMOVESELECTION = 16;
pub const SELFLAG_VALID = 31;
pub const STATE_SYSTEM_NORMAL = 0;
pub const STATE_SYSTEM_HASPOPUP = 1073741824;
pub const ROLE_SYSTEM_TITLEBAR = 1;
pub const ROLE_SYSTEM_MENUBAR = 2;
pub const ROLE_SYSTEM_SCROLLBAR = 3;
pub const ROLE_SYSTEM_GRIP = 4;
pub const ROLE_SYSTEM_SOUND = 5;
pub const ROLE_SYSTEM_CURSOR = 6;
pub const ROLE_SYSTEM_CARET = 7;
pub const ROLE_SYSTEM_ALERT = 8;
pub const ROLE_SYSTEM_WINDOW = 9;
pub const ROLE_SYSTEM_CLIENT = 10;
pub const ROLE_SYSTEM_MENUPOPUP = 11;
pub const ROLE_SYSTEM_MENUITEM = 12;
pub const ROLE_SYSTEM_TOOLTIP = 13;
pub const ROLE_SYSTEM_APPLICATION = 14;
pub const ROLE_SYSTEM_DOCUMENT = 15;
pub const ROLE_SYSTEM_PANE = 16;
pub const ROLE_SYSTEM_CHART = 17;
pub const ROLE_SYSTEM_DIALOG = 18;
pub const ROLE_SYSTEM_BORDER = 19;
pub const ROLE_SYSTEM_GROUPING = 20;
pub const ROLE_SYSTEM_SEPARATOR = 21;
pub const ROLE_SYSTEM_TOOLBAR = 22;
pub const ROLE_SYSTEM_STATUSBAR = 23;
pub const ROLE_SYSTEM_TABLE = 24;
pub const ROLE_SYSTEM_COLUMNHEADER = 25;
pub const ROLE_SYSTEM_ROWHEADER = 26;
pub const ROLE_SYSTEM_COLUMN = 27;
pub const ROLE_SYSTEM_ROW = 28;
pub const ROLE_SYSTEM_CELL = 29;
pub const ROLE_SYSTEM_LINK = 30;
pub const ROLE_SYSTEM_HELPBALLOON = 31;
pub const ROLE_SYSTEM_CHARACTER = 32;
pub const ROLE_SYSTEM_LIST = 33;
pub const ROLE_SYSTEM_LISTITEM = 34;
pub const ROLE_SYSTEM_OUTLINE = 35;
pub const ROLE_SYSTEM_OUTLINEITEM = 36;
pub const ROLE_SYSTEM_PAGETAB = 37;
pub const ROLE_SYSTEM_PROPERTYPAGE = 38;
pub const ROLE_SYSTEM_INDICATOR = 39;
pub const ROLE_SYSTEM_GRAPHIC = 40;
pub const ROLE_SYSTEM_STATICTEXT = 41;
pub const ROLE_SYSTEM_TEXT = 42;
pub const ROLE_SYSTEM_PUSHBUTTON = 43;
pub const ROLE_SYSTEM_CHECKBUTTON = 44;
pub const ROLE_SYSTEM_RADIOBUTTON = 45;
pub const ROLE_SYSTEM_COMBOBOX = 46;
pub const ROLE_SYSTEM_DROPLIST = 47;
pub const ROLE_SYSTEM_PROGRESSBAR = 48;
pub const ROLE_SYSTEM_DIAL = 49;
pub const ROLE_SYSTEM_HOTKEYFIELD = 50;
pub const ROLE_SYSTEM_SLIDER = 51;
pub const ROLE_SYSTEM_SPINBUTTON = 52;
pub const ROLE_SYSTEM_DIAGRAM = 53;
pub const ROLE_SYSTEM_ANIMATION = 54;
pub const ROLE_SYSTEM_EQUATION = 55;
pub const ROLE_SYSTEM_BUTTONDROPDOWN = 56;
pub const ROLE_SYSTEM_BUTTONMENU = 57;
pub const ROLE_SYSTEM_BUTTONDROPDOWNGRID = 58;
pub const ROLE_SYSTEM_WHITESPACE = 59;
pub const ROLE_SYSTEM_PAGETABLIST = 60;
pub const ROLE_SYSTEM_CLOCK = 61;
pub const ROLE_SYSTEM_SPLITBUTTON = 62;
pub const ROLE_SYSTEM_IPADDRESS = 63;
pub const ROLE_SYSTEM_OUTLINEBUTTON = 64;
pub const UIA_E_ELEMENTNOTENABLED = 2147746304;
pub const UIA_E_ELEMENTNOTAVAILABLE = 2147746305;
pub const UIA_E_NOCLICKABLEPOINT = 2147746306;
pub const UIA_E_PROXYASSEMBLYNOTLOADED = 2147746307;
pub const UIA_E_NOTSUPPORTED = 2147746308;
pub const UIA_E_INVALIDOPERATION = 2148734217;
pub const UIA_E_TIMEOUT = 2148734213;
pub const UiaAppendRuntimeId = 3;
pub const UiaRootObjectId = -25;
pub const UIA_IAFP_DEFAULT = 0;
pub const UIA_IAFP_UNWRAP_BRIDGE = 1;
pub const UIA_PFIA_DEFAULT = 0;
pub const UIA_PFIA_UNWRAP_BRIDGE = 1;
pub const ANNO_THIS = 0;
pub const ANNO_CONTAINER = 1;
pub const NavigateDirection_Parent = 0;
pub const NavigateDirection_NextSibling = 1;
pub const NavigateDirection_PreviousSibling = 2;
pub const NavigateDirection_FirstChild = 3;
pub const NavigateDirection_LastChild = 4;
pub const ProviderOptions_ClientSideProvider = 1;
pub const ProviderOptions_ServerSideProvider = 2;
pub const ProviderOptions_NonClientAreaProvider = 4;
pub const ProviderOptions_OverrideProvider = 8;
pub const ProviderOptions_ProviderOwnsSetFocus = 16;
pub const ProviderOptions_UseComThreading = 32;
pub const ProviderOptions_RefuseNonClientSupport = 64;
pub const ProviderOptions_HasNativeIAccessible = 128;
pub const ProviderOptions_UseClientCoordinates = 256;
pub const StructureChangeType_ChildAdded = 0;
pub const StructureChangeType_ChildRemoved = 1;
pub const StructureChangeType_ChildrenInvalidated = 2;
pub const StructureChangeType_ChildrenBulkAdded = 3;
pub const StructureChangeType_ChildrenBulkRemoved = 4;
pub const StructureChangeType_ChildrenReordered = 5;
pub const TextEditChangeType_None = 0;
pub const TextEditChangeType_AutoCorrect = 1;
pub const TextEditChangeType_Composition = 2;
pub const TextEditChangeType_CompositionFinalized = 3;
pub const TextEditChangeType_AutoComplete = 4;
pub const OrientationType_None = 0;
pub const OrientationType_Horizontal = 1;
pub const OrientationType_Vertical = 2;
pub const DockPosition_Top = 0;
pub const DockPosition_Left = 1;
pub const DockPosition_Bottom = 2;
pub const DockPosition_Right = 3;
pub const DockPosition_Fill = 4;
pub const DockPosition_None = 5;
pub const ExpandCollapseState_Collapsed = 0;
pub const ExpandCollapseState_Expanded = 1;
pub const ExpandCollapseState_PartiallyExpanded = 2;
pub const ExpandCollapseState_LeafNode = 3;
pub const ScrollAmount_LargeDecrement = 0;
pub const ScrollAmount_SmallDecrement = 1;
pub const ScrollAmount_NoAmount = 2;
pub const ScrollAmount_LargeIncrement = 3;
pub const ScrollAmount_SmallIncrement = 4;
pub const RowOrColumnMajor_RowMajor = 0;
pub const RowOrColumnMajor_ColumnMajor = 1;
pub const RowOrColumnMajor_Indeterminate = 2;
pub const ToggleState_Off = 0;
pub const ToggleState_On = 1;
pub const ToggleState_Indeterminate = 2;
pub const WindowVisualState_Normal = 0;
pub const WindowVisualState_Maximized = 1;
pub const WindowVisualState_Minimized = 2;
pub const SynchronizedInputType_KeyUp = 1;
pub const SynchronizedInputType_KeyDown = 2;
pub const SynchronizedInputType_LeftMouseUp = 4;
pub const SynchronizedInputType_LeftMouseDown = 8;
pub const SynchronizedInputType_RightMouseUp = 16;
pub const SynchronizedInputType_RightMouseDown = 32;
pub const WindowInteractionState_Running = 0;
pub const WindowInteractionState_Closing = 1;
pub const WindowInteractionState_ReadyForUserInteraction = 2;
pub const WindowInteractionState_BlockedByModalWindow = 3;
pub const WindowInteractionState_NotResponding = 4;
pub const SayAsInterpretAs_None = 0;
pub const SayAsInterpretAs_Spell = 1;
pub const SayAsInterpretAs_Cardinal = 2;
pub const SayAsInterpretAs_Ordinal = 3;
pub const SayAsInterpretAs_Number = 4;
pub const SayAsInterpretAs_Date = 5;
pub const SayAsInterpretAs_Time = 6;
pub const SayAsInterpretAs_Telephone = 7;
pub const SayAsInterpretAs_Currency = 8;
pub const SayAsInterpretAs_Net = 9;
pub const SayAsInterpretAs_Url = 10;
pub const SayAsInterpretAs_Address = 11;
pub const SayAsInterpretAs_Alphanumeric = 12;
pub const SayAsInterpretAs_Name = 13;
pub const SayAsInterpretAs_Media = 14;
pub const SayAsInterpretAs_Date_MonthDayYear = 15;
pub const SayAsInterpretAs_Date_DayMonthYear = 16;
pub const SayAsInterpretAs_Date_YearMonthDay = 17;
pub const SayAsInterpretAs_Date_YearMonth = 18;
pub const SayAsInterpretAs_Date_MonthYear = 19;
pub const SayAsInterpretAs_Date_DayMonth = 20;
pub const SayAsInterpretAs_Date_MonthDay = 21;
pub const SayAsInterpretAs_Date_Year = 22;
pub const SayAsInterpretAs_Time_HoursMinutesSeconds12 = 23;
pub const SayAsInterpretAs_Time_HoursMinutes12 = 24;
pub const SayAsInterpretAs_Time_HoursMinutesSeconds24 = 25;
pub const SayAsInterpretAs_Time_HoursMinutes24 = 26;
pub const TextUnit_Character = 0;
pub const TextUnit_Format = 1;
pub const TextUnit_Word = 2;
pub const TextUnit_Line = 3;
pub const TextUnit_Paragraph = 4;
pub const TextUnit_Page = 5;
pub const TextUnit_Document = 6;
pub const TextPatternRangeEndpoint_Start = 0;
pub const TextPatternRangeEndpoint_End = 1;
pub const SupportedTextSelection_None = 0;
pub const SupportedTextSelection_Single = 1;
pub const SupportedTextSelection_Multiple = 2;
pub const Off = 0;
pub const Polite = 1;
pub const Assertive = 2;
pub const ActiveEnd_None = 0;
pub const ActiveEnd_Start = 1;
pub const ActiveEnd_End = 2;
pub const CaretPosition_Unknown = 0;
pub const CaretPosition_EndOfLine = 1;
pub const CaretPosition_BeginningOfLine = 2;
pub const CaretBidiMode_LTR = 0;
pub const CaretBidiMode_RTL = 1;
pub const ZoomUnit_NoAmount = 0;
pub const ZoomUnit_LargeDecrement = 1;
pub const ZoomUnit_SmallDecrement = 2;
pub const ZoomUnit_LargeIncrement = 3;
pub const ZoomUnit_SmallIncrement = 4;
pub const AnimationStyle_None = 0;
pub const AnimationStyle_LasVegasLights = 1;
pub const AnimationStyle_BlinkingBackground = 2;
pub const AnimationStyle_SparkleText = 3;
pub const AnimationStyle_MarchingBlackAnts = 4;
pub const AnimationStyle_MarchingRedAnts = 5;
pub const AnimationStyle_Shimmer = 6;
pub const AnimationStyle_Other = -1;
pub const BulletStyle_None = 0;
pub const BulletStyle_HollowRoundBullet = 1;
pub const BulletStyle_FilledRoundBullet = 2;
pub const BulletStyle_HollowSquareBullet = 3;
pub const BulletStyle_FilledSquareBullet = 4;
pub const BulletStyle_DashBullet = 5;
pub const BulletStyle_Other = -1;
pub const CapStyle_None = 0;
pub const CapStyle_SmallCap = 1;
pub const CapStyle_AllCap = 2;
pub const CapStyle_AllPetiteCaps = 3;
pub const CapStyle_PetiteCaps = 4;
pub const CapStyle_Unicase = 5;
pub const CapStyle_Titling = 6;
pub const CapStyle_Other = -1;
pub const FillType_None = 0;
pub const FillType_Color = 1;
pub const FillType_Gradient = 2;
pub const FillType_Picture = 3;
pub const FillType_Pattern = 4;
pub const FlowDirections_Default = 0;
pub const FlowDirections_RightToLeft = 1;
pub const FlowDirections_BottomToTop = 2;
pub const FlowDirections_Vertical = 4;
pub const HorizontalTextAlignment_Left = 0;
pub const HorizontalTextAlignment_Centered = 1;
pub const HorizontalTextAlignment_Right = 2;
pub const HorizontalTextAlignment_Justified = 3;
pub const OutlineStyles_None = 0;
pub const OutlineStyles_Outline = 1;
pub const OutlineStyles_Shadow = 2;
pub const OutlineStyles_Engraved = 4;
pub const OutlineStyles_Embossed = 8;
pub const TextDecorationLineStyle_None = 0;
pub const TextDecorationLineStyle_Single = 1;
pub const TextDecorationLineStyle_WordsOnly = 2;
pub const TextDecorationLineStyle_Double = 3;
pub const TextDecorationLineStyle_Dot = 4;
pub const TextDecorationLineStyle_Dash = 5;
pub const TextDecorationLineStyle_DashDot = 6;
pub const TextDecorationLineStyle_DashDotDot = 7;
pub const TextDecorationLineStyle_Wavy = 8;
pub const TextDecorationLineStyle_ThickSingle = 9;
pub const TextDecorationLineStyle_DoubleWavy = 11;
pub const TextDecorationLineStyle_ThickWavy = 12;
pub const TextDecorationLineStyle_LongDash = 13;
pub const TextDecorationLineStyle_ThickDash = 14;
pub const TextDecorationLineStyle_ThickDashDot = 15;
pub const TextDecorationLineStyle_ThickDashDotDot = 16;
pub const TextDecorationLineStyle_ThickDot = 17;
pub const TextDecorationLineStyle_ThickLongDash = 18;
pub const TextDecorationLineStyle_Other = -1;
pub const VisualEffects_None = 0;
pub const VisualEffects_Shadow = 1;
pub const VisualEffects_Reflection = 2;
pub const VisualEffects_Glow = 4;
pub const VisualEffects_SoftEdges = 8;
pub const VisualEffects_Bevel = 16;
pub const NotificationProcessing_ImportantAll = 0;
pub const NotificationProcessing_ImportantMostRecent = 1;
pub const NotificationProcessing_All = 2;
pub const NotificationProcessing_MostRecent = 3;
pub const NotificationProcessing_CurrentThenMostRecent = 4;
pub const NotificationProcessing_ImportantCurrentThenMostRecent = 5;
pub const NotificationKind_ItemAdded = 0;
pub const NotificationKind_ItemRemoved = 1;
pub const NotificationKind_ActionCompleted = 2;
pub const NotificationKind_ActionAborted = 3;
pub const NotificationKind_Other = 4;
pub const UIAutomationType_Int = 1;
pub const UIAutomationType_Bool = 2;
pub const UIAutomationType_String = 3;
pub const UIAutomationType_Double = 4;
pub const UIAutomationType_Point = 5;
pub const UIAutomationType_Rect = 6;
pub const UIAutomationType_Element = 7;
pub const UIAutomationType_Array = 65536;
pub const UIAutomationType_Out = 131072;
pub const UIAutomationType_IntArray = 65537;
pub const UIAutomationType_BoolArray = 65538;
pub const UIAutomationType_StringArray = 65539;
pub const UIAutomationType_DoubleArray = 65540;
pub const UIAutomationType_PointArray = 65541;
pub const UIAutomationType_RectArray = 65542;
pub const UIAutomationType_ElementArray = 65543;
pub const UIAutomationType_OutInt = 131073;
pub const UIAutomationType_OutBool = 131074;
pub const UIAutomationType_OutString = 131075;
pub const UIAutomationType_OutDouble = 131076;
pub const UIAutomationType_OutPoint = 131077;
pub const UIAutomationType_OutRect = 131078;
pub const UIAutomationType_OutElement = 131079;
pub const UIAutomationType_OutIntArray = 196609;
pub const UIAutomationType_OutBoolArray = 196610;
pub const UIAutomationType_OutStringArray = 196611;
pub const UIAutomationType_OutDoubleArray = 196612;
pub const UIAutomationType_OutPointArray = 196613;
pub const UIAutomationType_OutRectArray = 196614;
pub const UIAutomationType_OutElementArray = 196615;
pub const TreeScope_None = 0;
pub const TreeScope_Element = 1;
pub const TreeScope_Children = 2;
pub const TreeScope_Descendants = 4;
pub const TreeScope_Parent = 8;
pub const TreeScope_Ancestors = 16;
pub const TreeScope_Subtree = 7;
pub const PropertyConditionFlags_None = 0;
pub const PropertyConditionFlags_IgnoreCase = 1;
pub const PropertyConditionFlags_MatchSubstring = 2;
pub const AutomationElementMode_None = 0;
pub const AutomationElementMode_Full = 1;
pub const TreeTraversalOptions_Default = 0;
pub const TreeTraversalOptions_PostOrder = 1;
pub const TreeTraversalOptions_LastToFirstOrder = 2;
pub const ConnectionRecoveryBehaviorOptions_Disabled = 0;
pub const ConnectionRecoveryBehaviorOptions_Enabled = 1;
pub const CoalesceEventsOptions_Disabled = 0;
pub const CoalesceEventsOptions_Enabled = 1;
pub const ConditionType_True = 0;
pub const ConditionType_False = 1;
pub const ConditionType_Property = 2;
pub const ConditionType_And = 3;
pub const ConditionType_Or = 4;
pub const ConditionType_Not = 5;
pub const NormalizeState_None = 0;
pub const NormalizeState_View = 1;
pub const NormalizeState_Custom = 2;
pub const ProviderType_BaseHwnd = 0;
pub const ProviderType_Proxy = 1;
pub const ProviderType_NonClientArea = 2;
pub const AutomationIdentifierType_Property = 0;
pub const AutomationIdentifierType_Pattern = 1;
pub const AutomationIdentifierType_Event = 2;
pub const AutomationIdentifierType_ControlType = 3;
pub const AutomationIdentifierType_TextAttribute = 4;
pub const AutomationIdentifierType_LandmarkType = 5;
pub const AutomationIdentifierType_Annotation = 6;
pub const AutomationIdentifierType_Changes = 7;
pub const AutomationIdentifierType_Style = 8;
pub const EventArgsType_Simple = 0;
pub const EventArgsType_PropertyChanged = 1;
pub const EventArgsType_StructureChanged = 2;
pub const EventArgsType_AsyncContentLoaded = 3;
pub const EventArgsType_WindowClosed = 4;
pub const EventArgsType_TextEditTextChanged = 5;
pub const EventArgsType_Changes = 6;
pub const EventArgsType_Notification = 7;
pub const EventArgsType_ActiveTextPositionChanged = 8;
pub const EventArgsType_StructuredMarkup = 9;
pub const AsyncContentLoadedState_Beginning = 0;
pub const AsyncContentLoadedState_Progress = 1;
pub const AsyncContentLoadedState_Completed = 2;

pub const aliases = struct {
    pub const STICKYKEYS_FLAGS = u32;
    pub const SOUNDSENTRY_FLAGS = u32;
    pub const ACC_UTILITY_STATE_FLAGS = u32;
    pub const SOUND_SENTRY_GRAPHICS_EFFECT = u32;
    pub const SERIALKEYS_FLAGS = u32;
    pub const HIGHCONTRASTW_FLAGS = u32;
    pub const SOUNDSENTRY_TEXT_EFFECT = u32;
    pub const SOUNDSENTRY_WINDOWS_EFFECT = u32;
    pub const UIA_PATTERN_ID = i32;
    pub const UIA_EVENT_ID = i32;
    pub const UIA_PROPERTY_ID = i32;
    pub const UIA_TEXTATTRIBUTE_ID = i32;
    pub const UIA_CONTROLTYPE_ID = i32;
    pub const UIA_ANNOTATIONTYPE = i32;
    pub const UIA_STYLE_ID = i32;
    pub const UIA_LANDMARKTYPE_ID = i32;
    pub const UIA_HEADINGLEVEL_ID = i32;
    pub const UIA_CHANGE_ID = i32;
    pub const UIA_METADATA_ID = i32;
    pub const AnnoScope = i32;
    pub const NavigateDirection = i32;
    pub const ProviderOptions = i32;
    pub const StructureChangeType = i32;
    pub const TextEditChangeType = i32;
    pub const OrientationType = i32;
    pub const DockPosition = i32;
    pub const ExpandCollapseState = i32;
    pub const ScrollAmount = i32;
    pub const RowOrColumnMajor = i32;
    pub const ToggleState = i32;
    pub const WindowVisualState = i32;
    pub const SynchronizedInputType = i32;
    pub const WindowInteractionState = i32;
    pub const SayAsInterpretAs = i32;
    pub const TextUnit = i32;
    pub const TextPatternRangeEndpoint = i32;
    pub const SupportedTextSelection = i32;
    pub const LiveSetting = i32;
    pub const ActiveEnd = i32;
    pub const CaretPosition = i32;
    pub const CaretBidiMode = i32;
    pub const ZoomUnit = i32;
    pub const AnimationStyle = i32;
    pub const BulletStyle = i32;
    pub const CapStyle = i32;
    pub const FillType = i32;
    pub const FlowDirections = i32;
    pub const HorizontalTextAlignment = i32;
    pub const OutlineStyles = i32;
    pub const TextDecorationLineStyle = i32;
    pub const VisualEffects = i32;
    pub const NotificationProcessing = i32;
    pub const NotificationKind = i32;
    pub const UIAutomationType = i32;
    pub const TreeScope = i32;
    pub const PropertyConditionFlags = i32;
    pub const AutomationElementMode = i32;
    pub const TreeTraversalOptions = i32;
    pub const ConnectionRecoveryBehaviorOptions = i32;
    pub const CoalesceEventsOptions = i32;
    pub const ConditionType = i32;
    pub const NormalizeState = i32;
    pub const ProviderType = i32;
    pub const AutomationIdentifierType = i32;
    pub const EventArgsType = i32;
    pub const AsyncContentLoadedState = i32;
};
