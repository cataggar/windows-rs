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

pub const method_def_by_name = std.static_string_map.StaticStringMap(MethodRecord).initComptime(.{});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        else => null,
    };
}

pub const CT_AND_CONDITION = 0;
pub const CT_OR_CONDITION = 1;
pub const CT_NOT_CONDITION = 2;
pub const CT_LEAF_CONDITION = 3;
pub const COP_IMPLICIT = 0;
pub const COP_EQUAL = 1;
pub const COP_NOTEQUAL = 2;
pub const COP_LESSTHAN = 3;
pub const COP_GREATERTHAN = 4;
pub const COP_LESSTHANOREQUAL = 5;
pub const COP_GREATERTHANOREQUAL = 6;
pub const COP_VALUE_STARTSWITH = 7;
pub const COP_VALUE_ENDSWITH = 8;
pub const COP_VALUE_CONTAINS = 9;
pub const COP_VALUE_NOTCONTAINS = 10;
pub const COP_DOSWILDCARDS = 11;
pub const COP_WORD_EQUAL = 12;
pub const COP_WORD_STARTSWITH = 13;
pub const COP_APPLICATION_SPECIFIC = 14;

pub const aliases = struct {
    pub const CONDITION_TYPE = i32;
    pub const CONDITION_OPERATION = i32;
};
