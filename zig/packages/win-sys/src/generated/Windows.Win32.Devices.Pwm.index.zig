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
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const IOCTL_PWM_CONTROLLER_GET_INFO = 262144;
pub const IOCTL_PWM_CONTROLLER_GET_ACTUAL_PERIOD = 262148;
pub const IOCTL_PWM_CONTROLLER_SET_DESIRED_PERIOD = 294920;
pub const IOCTL_PWM_PIN_GET_ACTIVE_DUTY_CYCLE_PERCENTAGE = 262544;
pub const IOCTL_PWM_PIN_SET_ACTIVE_DUTY_CYCLE_PERCENTAGE = 295316;
pub const IOCTL_PWM_PIN_GET_POLARITY = 262552;
pub const IOCTL_PWM_PIN_SET_POLARITY = 295324;
pub const IOCTL_PWM_PIN_START = 295331;
pub const IOCTL_PWM_PIN_STOP = 295335;
pub const IOCTL_PWM_PIN_IS_STARTED = 262568;
pub const PWM_IOCTL_ID_CONTROLLER_GET_INFO = 0;
pub const PWM_IOCTL_ID_CONTROLLER_GET_ACTUAL_PERIOD = 1;
pub const PWM_IOCTL_ID_CONTROLLER_SET_DESIRED_PERIOD = 2;
pub const PWM_IOCTL_ID_PIN_GET_ACTIVE_DUTY_CYCLE_PERCENTAGE = 100;
pub const PWM_IOCTL_ID_PIN_SET_ACTIVE_DUTY_CYCLE_PERCENTAGE = 101;
pub const PWM_IOCTL_ID_PIN_GET_POLARITY = 102;
pub const PWM_IOCTL_ID_PIN_SET_POLARITY = 103;
pub const PWM_IOCTL_ID_PIN_START = 104;
pub const PWM_IOCTL_ID_PIN_STOP = 105;
pub const PWM_IOCTL_ID_PIN_IS_STARTED = 106;
pub const PWM_ACTIVE_HIGH = 0;
pub const PWM_ACTIVE_LOW = 1;

pub const aliases = struct {
    pub const PWM_POLARITY = i32;
};
