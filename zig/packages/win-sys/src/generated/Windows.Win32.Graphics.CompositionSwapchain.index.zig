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
    .{ "CreatePresentationFactory", MethodRecord{ .library = "dcomp", .import = "CreatePresentationFactory", .signature = "\x00\x03\x11\x79\x12\x82\xb1\x0f\x11\x0d\x0f\x0f\x01" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        0x2b1 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IUnknown" },
        else => null,
    };
}

pub const PresentStatisticsKind_PresentStatus = 1;
pub const PresentStatisticsKind_CompositionFrame = 2;
pub const PresentStatisticsKind_IndependentFlipFrame = 3;
pub const PresentStatus_Queued = 0;
pub const PresentStatus_Skipped = 1;
pub const PresentStatus_Canceled = 2;
pub const CompositionFrameInstanceKind_ComposedOnScreen = 0;
pub const CompositionFrameInstanceKind_ScanoutOnScreen = 1;
pub const CompositionFrameInstanceKind_ComposedToIntermediate = 2;

pub const aliases = struct {
    pub const PresentStatisticsKind = i32;
    pub const PresentStatus = i32;
    pub const CompositionFrameInstanceKind = i32;
};
