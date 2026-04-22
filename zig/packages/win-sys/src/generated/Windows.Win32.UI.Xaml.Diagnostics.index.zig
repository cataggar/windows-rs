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
    .{ "InitializeXamlDiagnostic", MethodRecord{ .library = "Windows.UI.Xaml", .import = "InitializeXamlDiagnostic", .signature = "\x00\x05\x11\x79\x11\x05\x09\x11\x05\x11\x05\x11\x0d" } },
    .{ "InitializeXamlDiagnosticsEx", MethodRecord{ .library = "Windows.UI.Xaml", .import = "InitializeXamlDiagnosticsEx", .signature = "\x00\x06\x11\x79\x11\x05\x09\x11\x05\x11\x05\x11\x0d\x11\x05" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x79 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HRESULT" },
        else => null,
    };
}

pub const E_UNKNOWNTYPE = -2144665560;
pub const Add = 0;
pub const Remove = 1;
pub const BaseValueSourceUnknown = 0;
pub const BaseValueSourceDefault = 1;
pub const BaseValueSourceBuiltInStyle = 2;
pub const BaseValueSourceStyle = 3;
pub const BaseValueSourceLocal = 4;
pub const Inherited = 5;
pub const DefaultStyleTrigger = 6;
pub const TemplateTrigger = 7;
pub const StyleTrigger = 8;
pub const ImplicitStyleReference = 9;
pub const ParentTemplate = 10;
pub const ParentTemplateTrigger = 11;
pub const Animation = 12;
pub const Coercion = 13;
pub const BaseValueSourceVisualState = 14;
pub const None = 0;
pub const IsValueHandle = 1;
pub const IsPropertyReadOnly = 2;
pub const IsValueCollection = 4;
pub const IsValueCollectionReadOnly = 8;
pub const IsValueBindingExpression = 16;
pub const IsValueNull = 32;
pub const IsValueHandleAndEvaluatedValue = 64;
pub const RenderTarget = 0;
pub const RenderTargetAndChildren = 1;
pub const ResourceTypeStatic = 0;
pub const ResourceTypeTheme = 1;
pub const ErrorResolved = 0;
pub const ErrorResourceNotFound = 1;
pub const ErrorInvalidResource = 2;

pub const aliases = struct {
    pub const VisualMutationType = i32;
    pub const BaseValueSource = i32;
    pub const MetadataBit = i32;
    pub const RenderTargetBitmapOptions = i32;
    pub const ResourceType = i32;
    pub const VisualElementState = i32;
};
