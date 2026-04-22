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
    .{ "CreateInteractionContext", MethodRecord{ .library = "NInput", .import = "CreateInteractionContext", .signature = "\x00\x01\x11\x79\x0f\x11\xa8\x7c" } },
    .{ "DestroyInteractionContext", MethodRecord{ .library = "NInput", .import = "DestroyInteractionContext", .signature = "\x00\x01\x11\x79\x11\xa8\x7c" } },
    .{ "RegisterOutputCallbackInteractionContext", MethodRecord{ .library = "NInput", .import = "RegisterOutputCallbackInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x12\xc0\x00\xb5\xc0\x0f\x01" } },
    .{ "RegisterOutputCallbackInteractionContext2", MethodRecord{ .library = "NInput", .import = "RegisterOutputCallbackInteractionContext2", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x12\xc0\x00\xb5\xc4\x0f\x01" } },
    .{ "SetInteractionConfigurationInteractionContext", MethodRecord{ .library = "NInput", .import = "SetInteractionConfigurationInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x09\x0f\x11\xc0\x00\xb5\xb8" } },
    .{ "GetInteractionConfigurationInteractionContext", MethodRecord{ .library = "NInput", .import = "GetInteractionConfigurationInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x09\x0f\x11\xc0\x00\xb5\xb8" } },
    .{ "SetPropertyInteractionContext", MethodRecord{ .library = "NInput", .import = "SetPropertyInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x11\xc0\x00\x7e\xf5\x09" } },
    .{ "GetPropertyInteractionContext", MethodRecord{ .library = "NInput", .import = "GetPropertyInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x11\xc0\x00\x7e\xf5\x0f\x09" } },
    .{ "SetInertiaParameterInteractionContext", MethodRecord{ .library = "NInput", .import = "SetInertiaParameterInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x11\xc0\x00\x7e\xed\x0c" } },
    .{ "GetInertiaParameterInteractionContext", MethodRecord{ .library = "NInput", .import = "GetInertiaParameterInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x11\xc0\x00\x7e\xed\x0f\x0c" } },
    .{ "SetCrossSlideParametersInteractionContext", MethodRecord{ .library = "NInput", .import = "SetCrossSlideParametersInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x09\x0f\x11\xc0\x00\xb5\xbc" } },
    .{ "GetCrossSlideParameterInteractionContext", MethodRecord{ .library = "NInput", .import = "GetCrossSlideParameterInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x11\xc0\x00\x7e\xf9\x0f\x0c" } },
    .{ "SetTapParameterInteractionContext", MethodRecord{ .library = "NInput", .import = "SetTapParameterInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x11\xc0\x00\x7f\x05\x0c" } },
    .{ "GetTapParameterInteractionContext", MethodRecord{ .library = "NInput", .import = "GetTapParameterInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x11\xc0\x00\x7f\x05\x0f\x0c" } },
    .{ "SetHoldParameterInteractionContext", MethodRecord{ .library = "NInput", .import = "SetHoldParameterInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x11\xc0\x00\x7f\x09\x0c" } },
    .{ "GetHoldParameterInteractionContext", MethodRecord{ .library = "NInput", .import = "GetHoldParameterInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x11\xc0\x00\x7f\x09\x0f\x0c" } },
    .{ "SetTranslationParameterInteractionContext", MethodRecord{ .library = "NInput", .import = "SetTranslationParameterInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x11\xc0\x00\x7f\x0d\x0c" } },
    .{ "GetTranslationParameterInteractionContext", MethodRecord{ .library = "NInput", .import = "GetTranslationParameterInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x11\xc0\x00\x7f\x0d\x0f\x0c" } },
    .{ "SetMouseWheelParameterInteractionContext", MethodRecord{ .library = "NInput", .import = "SetMouseWheelParameterInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x11\xc0\x00\x7f\x01\x0c" } },
    .{ "GetMouseWheelParameterInteractionContext", MethodRecord{ .library = "NInput", .import = "GetMouseWheelParameterInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x11\xc0\x00\x7f\x01\x0f\x0c" } },
    .{ "ResetInteractionContext", MethodRecord{ .library = "NInput", .import = "ResetInteractionContext", .signature = "\x00\x01\x11\x79\x11\xa8\x7c" } },
    .{ "GetStateInteractionContext", MethodRecord{ .library = "NInput", .import = "GetStateInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x0f\x11\xc0\x00\x7f\x25\x0f\x11\xc0\x00\x7e\xf1" } },
    .{ "AddPointerInteractionContext", MethodRecord{ .library = "NInput", .import = "AddPointerInteractionContext", .signature = "\x00\x02\x11\x79\x11\xa8\x7c\x09" } },
    .{ "RemovePointerInteractionContext", MethodRecord{ .library = "NInput", .import = "RemovePointerInteractionContext", .signature = "\x00\x02\x11\x79\x11\xa8\x7c\x09" } },
    .{ "ProcessPointerFramesInteractionContext", MethodRecord{ .library = "NInput", .import = "ProcessPointerFramesInteractionContext", .signature = "\x00\x04\x11\x79\x11\xa8\x7c\x09\x09\x0f\x11\xc0\x00\x7f\x25" } },
    .{ "BufferPointerPacketsInteractionContext", MethodRecord{ .library = "NInput", .import = "BufferPointerPacketsInteractionContext", .signature = "\x00\x03\x11\x79\x11\xa8\x7c\x09\x0f\x11\xc0\x00\x7f\x25" } },
    .{ "ProcessBufferedPacketsInteractionContext", MethodRecord{ .library = "NInput", .import = "ProcessBufferedPacketsInteractionContext", .signature = "\x00\x01\x11\x79\x11\xa8\x7c" } },
    .{ "ProcessInertiaInteractionContext", MethodRecord{ .library = "NInput", .import = "ProcessInertiaInteractionContext", .signature = "\x00\x01\x11\x79\x11\xa8\x7c" } },
    .{ "StopInteractionContext", MethodRecord{ .library = "NInput", .import = "StopInteractionContext", .signature = "\x00\x01\x11\x79\x11\xa8\x7c" } },
    .{ "SetPivotInteractionContext", MethodRecord{ .library = "NInput", .import = "SetPivotInteractionContext", .signature = "\x00\x04\x11\x79\x11\xa8\x7c\x0c\x0c\x0c" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x287c => TypeRefEntry{ .namespace = "Windows.Win32.UI.InteractionContext", .name = "HINTERACTIONCONTEXT" },
        0x7eed => TypeRefEntry{ .namespace = "Windows.Win32.UI.InteractionContext", .name = "INERTIA_PARAMETER" },
        0x7ef1 => TypeRefEntry{ .namespace = "Windows.Win32.UI.InteractionContext", .name = "INTERACTION_STATE" },
        0x7ef5 => TypeRefEntry{ .namespace = "Windows.Win32.UI.InteractionContext", .name = "INTERACTION_CONTEXT_PROPERTY" },
        0x7ef9 => TypeRefEntry{ .namespace = "Windows.Win32.UI.InteractionContext", .name = "CROSS_SLIDE_THRESHOLD" },
        0x7f01 => TypeRefEntry{ .namespace = "Windows.Win32.UI.InteractionContext", .name = "MOUSE_WHEEL_PARAMETER" },
        0x7f05 => TypeRefEntry{ .namespace = "Windows.Win32.UI.InteractionContext", .name = "TAP_PARAMETER" },
        0x7f09 => TypeRefEntry{ .namespace = "Windows.Win32.UI.InteractionContext", .name = "HOLD_PARAMETER" },
        0x7f0d => TypeRefEntry{ .namespace = "Windows.Win32.UI.InteractionContext", .name = "TRANSLATION_PARAMETER" },
        0x7f25 => TypeRefEntry{ .namespace = "Windows.Win32.UI.Input.Pointer", .name = "POINTER_INFO" },
        0xb5b8 => TypeRefEntry{ .namespace = "Windows.Win32.UI.InteractionContext", .name = "INTERACTION_CONTEXT_CONFIGURATION" },
        0xb5bc => TypeRefEntry{ .namespace = "Windows.Win32.UI.InteractionContext", .name = "CROSS_SLIDE_PARAMETER" },
        0xb5c0 => TypeRefEntry{ .namespace = "Windows.Win32.UI.InteractionContext", .name = "INTERACTION_CONTEXT_OUTPUT_CALLBACK" },
        0xb5c4 => TypeRefEntry{ .namespace = "Windows.Win32.UI.InteractionContext", .name = "INTERACTION_CONTEXT_OUTPUT_CALLBACK2" },
        else => null,
    };
}

pub const INTERACTION_ID_NONE = 0;
pub const INTERACTION_ID_MANIPULATION = 1;
pub const INTERACTION_ID_TAP = 2;
pub const INTERACTION_ID_SECONDARY_TAP = 3;
pub const INTERACTION_ID_HOLD = 4;
pub const INTERACTION_ID_DRAG = 5;
pub const INTERACTION_ID_CROSS_SLIDE = 6;
pub const INTERACTION_ID_MAX = -1;
pub const INTERACTION_FLAG_NONE = 0;
pub const INTERACTION_FLAG_BEGIN = 1;
pub const INTERACTION_FLAG_END = 2;
pub const INTERACTION_FLAG_CANCEL = 4;
pub const INTERACTION_FLAG_INERTIA = 8;
pub const INTERACTION_FLAG_MAX = 4294967295;
pub const INTERACTION_CONFIGURATION_FLAG_NONE = 0;
pub const INTERACTION_CONFIGURATION_FLAG_MANIPULATION = 1;
pub const INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_X = 2;
pub const INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_Y = 4;
pub const INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION = 8;
pub const INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING = 16;
pub const INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_INERTIA = 32;
pub const INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION_INERTIA = 64;
pub const INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING_INERTIA = 128;
pub const INTERACTION_CONFIGURATION_FLAG_MANIPULATION_RAILS_X = 256;
pub const INTERACTION_CONFIGURATION_FLAG_MANIPULATION_RAILS_Y = 512;
pub const INTERACTION_CONFIGURATION_FLAG_MANIPULATION_EXACT = 1024;
pub const INTERACTION_CONFIGURATION_FLAG_MANIPULATION_MULTIPLE_FINGER_PANNING = 2048;
pub const INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE = 1;
pub const INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_HORIZONTAL = 2;
pub const INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_SELECT = 4;
pub const INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_SPEED_BUMP = 8;
pub const INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_REARRANGE = 16;
pub const INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_EXACT = 32;
pub const INTERACTION_CONFIGURATION_FLAG_TAP = 1;
pub const INTERACTION_CONFIGURATION_FLAG_TAP_DOUBLE = 2;
pub const INTERACTION_CONFIGURATION_FLAG_TAP_MULTIPLE_FINGER = 4;
pub const INTERACTION_CONFIGURATION_FLAG_SECONDARY_TAP = 1;
pub const INTERACTION_CONFIGURATION_FLAG_HOLD = 1;
pub const INTERACTION_CONFIGURATION_FLAG_HOLD_MOUSE = 2;
pub const INTERACTION_CONFIGURATION_FLAG_HOLD_MULTIPLE_FINGER = 4;
pub const INTERACTION_CONFIGURATION_FLAG_DRAG = 1;
pub const INTERACTION_CONFIGURATION_FLAG_MAX = 4294967295;
pub const INERTIA_PARAMETER_TRANSLATION_DECELERATION = 1;
pub const INERTIA_PARAMETER_TRANSLATION_DISPLACEMENT = 2;
pub const INERTIA_PARAMETER_ROTATION_DECELERATION = 3;
pub const INERTIA_PARAMETER_ROTATION_ANGLE = 4;
pub const INERTIA_PARAMETER_EXPANSION_DECELERATION = 5;
pub const INERTIA_PARAMETER_EXPANSION_EXPANSION = 6;
pub const INERTIA_PARAMETER_MAX = -1;
pub const INTERACTION_STATE_IDLE = 0;
pub const INTERACTION_STATE_IN_INTERACTION = 1;
pub const INTERACTION_STATE_POSSIBLE_DOUBLE_TAP = 2;
pub const INTERACTION_STATE_MAX = -1;
pub const INTERACTION_CONTEXT_PROPERTY_MEASUREMENT_UNITS = 1;
pub const INTERACTION_CONTEXT_PROPERTY_INTERACTION_UI_FEEDBACK = 2;
pub const INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS = 3;
pub const INTERACTION_CONTEXT_PROPERTY_MAX = -1;
pub const CROSS_SLIDE_THRESHOLD_SELECT_START = 0;
pub const CROSS_SLIDE_THRESHOLD_SPEED_BUMP_START = 1;
pub const CROSS_SLIDE_THRESHOLD_SPEED_BUMP_END = 2;
pub const CROSS_SLIDE_THRESHOLD_REARRANGE_START = 3;
pub const CROSS_SLIDE_THRESHOLD_COUNT = 4;
pub const CROSS_SLIDE_THRESHOLD_MAX = -1;
pub const CROSS_SLIDE_FLAGS_NONE = 0;
pub const CROSS_SLIDE_FLAGS_SELECT = 1;
pub const CROSS_SLIDE_FLAGS_SPEED_BUMP = 2;
pub const CROSS_SLIDE_FLAGS_REARRANGE = 4;
pub const CROSS_SLIDE_FLAGS_MAX = 4294967295;
pub const MOUSE_WHEEL_PARAMETER_CHAR_TRANSLATION_X = 1;
pub const MOUSE_WHEEL_PARAMETER_CHAR_TRANSLATION_Y = 2;
pub const MOUSE_WHEEL_PARAMETER_DELTA_SCALE = 3;
pub const MOUSE_WHEEL_PARAMETER_DELTA_ROTATION = 4;
pub const MOUSE_WHEEL_PARAMETER_PAGE_TRANSLATION_X = 5;
pub const MOUSE_WHEEL_PARAMETER_PAGE_TRANSLATION_Y = 6;
pub const MOUSE_WHEEL_PARAMETER_MAX = -1;
pub const TAP_PARAMETER_MIN_CONTACT_COUNT = 0;
pub const TAP_PARAMETER_MAX_CONTACT_COUNT = 1;
pub const TAP_PARAMETER_MAX = -1;
pub const HOLD_PARAMETER_MIN_CONTACT_COUNT = 0;
pub const HOLD_PARAMETER_MAX_CONTACT_COUNT = 1;
pub const HOLD_PARAMETER_THRESHOLD_RADIUS = 2;
pub const HOLD_PARAMETER_THRESHOLD_START_DELAY = 3;
pub const HOLD_PARAMETER_MAX = -1;
pub const TRANSLATION_PARAMETER_MIN_CONTACT_COUNT = 0;
pub const TRANSLATION_PARAMETER_MAX_CONTACT_COUNT = 1;
pub const TRANSLATION_PARAMETER_MAX = -1;
pub const MANIPULATION_RAILS_STATE_UNDECIDED = 0;
pub const MANIPULATION_RAILS_STATE_FREE = 1;
pub const MANIPULATION_RAILS_STATE_RAILED = 2;
pub const MANIPULATION_RAILS_STATE_MAX = -1;

pub const aliases = struct {
    pub const INTERACTION_ID = i32;
    pub const INTERACTION_FLAGS = u32;
    pub const INTERACTION_CONFIGURATION_FLAGS = u32;
    pub const INERTIA_PARAMETER = i32;
    pub const INTERACTION_STATE = i32;
    pub const INTERACTION_CONTEXT_PROPERTY = i32;
    pub const CROSS_SLIDE_THRESHOLD = i32;
    pub const CROSS_SLIDE_FLAGS = u32;
    pub const MOUSE_WHEEL_PARAMETER = i32;
    pub const TAP_PARAMETER = i32;
    pub const HOLD_PARAMETER = i32;
    pub const TRANSLATION_PARAMETER = i32;
    pub const MANIPULATION_RAILS_STATE = i32;
    pub const HINTERACTIONCONTEXT = ?*anyopaque;
    pub const INTERACTION_CONTEXT_OUTPUT_CALLBACK = ?*const anyopaque;
    pub const INTERACTION_CONTEXT_OUTPUT_CALLBACK2 = ?*const anyopaque;
};
