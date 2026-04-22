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

pub const DEVPROP_TRUE = 255;
pub const DEVPROP_FALSE = 0;
pub const MAX_DEVPROP_TYPE = 25;
pub const MAX_DEVPROP_TYPEMOD = 8192;
pub const DEVPROP_MASK_TYPE = 4095;
pub const DEVPROP_MASK_TYPEMOD = 61440;
pub const DEVPROPID_FIRST_USABLE = 2;
pub const DEVPROP_TYPEMOD_ARRAY = 4096;
pub const DEVPROP_TYPEMOD_LIST = 8192;
pub const DEVPROP_TYPE_EMPTY = 0;
pub const DEVPROP_TYPE_NULL = 1;
pub const DEVPROP_TYPE_SBYTE = 2;
pub const DEVPROP_TYPE_BYTE = 3;
pub const DEVPROP_TYPE_INT16 = 4;
pub const DEVPROP_TYPE_UINT16 = 5;
pub const DEVPROP_TYPE_INT32 = 6;
pub const DEVPROP_TYPE_UINT32 = 7;
pub const DEVPROP_TYPE_INT64 = 8;
pub const DEVPROP_TYPE_UINT64 = 9;
pub const DEVPROP_TYPE_FLOAT = 10;
pub const DEVPROP_TYPE_DOUBLE = 11;
pub const DEVPROP_TYPE_DECIMAL = 12;
pub const DEVPROP_TYPE_GUID = 13;
pub const DEVPROP_TYPE_CURRENCY = 14;
pub const DEVPROP_TYPE_DATE = 15;
pub const DEVPROP_TYPE_FILETIME = 16;
pub const DEVPROP_TYPE_BOOLEAN = 17;
pub const DEVPROP_TYPE_STRING = 18;
pub const DEVPROP_TYPE_STRING_LIST = 8210;
pub const DEVPROP_TYPE_SECURITY_DESCRIPTOR = 19;
pub const DEVPROP_TYPE_SECURITY_DESCRIPTOR_STRING = 20;
pub const DEVPROP_TYPE_DEVPROPKEY = 21;
pub const DEVPROP_TYPE_DEVPROPTYPE = 22;
pub const DEVPROP_TYPE_BINARY = 4099;
pub const DEVPROP_TYPE_ERROR = 23;
pub const DEVPROP_TYPE_NTSTATUS = 24;
pub const DEVPROP_TYPE_STRING_INDIRECT = 25;
pub const DEVPROP_STORE_SYSTEM = 0;
pub const DEVPROP_STORE_USER = 1;

pub const aliases = struct {
    pub const DEVPROPTYPE = u32;
    pub const DEVPROPSTORE = i32;
    pub const DEVPROP_BOOLEAN = u8;
};
