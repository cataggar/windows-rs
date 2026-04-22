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
    .{ "GetObjectA", MethodRecord{ .library = "GDI32", .import = "GetObjectA", .signature = "\x00\x03\x08\x11\x8d\x61\x08\x0f\x01" } },
    .{ "AddFontResourceA", MethodRecord{ .library = "GDI32", .import = "AddFontResourceA", .signature = "\x00\x01\x08\x11\x3d" } },
    .{ "AddFontResourceW", MethodRecord{ .library = "GDI32", .import = "AddFontResourceW", .signature = "\x00\x01\x08\x11\x05" } },
    .{ "AnimatePalette", MethodRecord{ .library = "GDI32", .import = "AnimatePalette", .signature = "\x00\x04\x11\x59\x11\x8d\x65\x09\x09\x0f\x11\x8d\x69" } },
    .{ "Arc", MethodRecord{ .library = "GDI32", .import = "Arc", .signature = "\x00\x09\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x08\x08\x08\x08" } },
    .{ "BitBlt", MethodRecord{ .library = "GDI32", .import = "BitBlt", .signature = "\x00\x09\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x11\x83\x5d\x08\x08\x11\x8d\x6d" } },
    .{ "CancelDC", MethodRecord{ .library = "GDI32", .import = "CancelDC", .signature = "\x00\x01\x11\x59\x11\x83\x5d" } },
    .{ "Chord", MethodRecord{ .library = "GDI32", .import = "Chord", .signature = "\x00\x09\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x08\x08\x08\x08" } },
    .{ "CloseMetaFile", MethodRecord{ .library = "GDI32", .import = "CloseMetaFile", .signature = "\x00\x01\x11\x8d\x71\x11\x83\x5d" } },
    .{ "CombineRgn", MethodRecord{ .library = "GDI32", .import = "CombineRgn", .signature = "\x00\x04\x11\x8d\x75\x11\x83\xe1\x11\x83\xe1\x11\x83\xe1\x11\x8d\x49" } },
    .{ "CopyMetaFileA", MethodRecord{ .library = "GDI32", .import = "CopyMetaFileA", .signature = "\x00\x02\x11\x8d\x71\x11\x8d\x71\x11\x3d" } },
    .{ "CopyMetaFileW", MethodRecord{ .library = "GDI32", .import = "CopyMetaFileW", .signature = "\x00\x02\x11\x8d\x71\x11\x8d\x71\x11\x05" } },
    .{ "CreateBitmap", MethodRecord{ .library = "GDI32", .import = "CreateBitmap", .signature = "\x00\x05\x11\x83\x51\x08\x08\x09\x09\x0f\x01" } },
    .{ "CreateBitmapIndirect", MethodRecord{ .library = "GDI32", .import = "CreateBitmapIndirect", .signature = "\x00\x01\x11\x83\x51\x0f\x11\x8d\x79" } },
    .{ "CreateBrushIndirect", MethodRecord{ .library = "GDI32", .import = "CreateBrushIndirect", .signature = "\x00\x01\x11\x84\x0d\x0f\x11\x8d\x7d" } },
    .{ "CreateCompatibleBitmap", MethodRecord{ .library = "GDI32", .import = "CreateCompatibleBitmap", .signature = "\x00\x03\x11\x83\x51\x11\x83\x5d\x08\x08" } },
    .{ "CreateDiscardableBitmap", MethodRecord{ .library = "GDI32", .import = "CreateDiscardableBitmap", .signature = "\x00\x03\x11\x83\x51\x11\x83\x5d\x08\x08" } },
    .{ "CreateCompatibleDC", MethodRecord{ .library = "GDI32", .import = "CreateCompatibleDC", .signature = "\x00\x01\x11\x83\x5d\x11\x83\x5d" } },
    .{ "CreateDCA", MethodRecord{ .library = "GDI32", .import = "CreateDCA", .signature = "\x00\x04\x11\x83\x5d\x11\x3d\x11\x3d\x11\x3d\x0f\x11\x8d\x81" } },
    .{ "CreateDCW", MethodRecord{ .library = "GDI32", .import = "CreateDCW", .signature = "\x00\x04\x11\x83\x5d\x11\x05\x11\x05\x11\x05\x0f\x11\x8d\x85" } },
    .{ "CreateDIBitmap", MethodRecord{ .library = "GDI32", .import = "CreateDIBitmap", .signature = "\x00\x06\x11\x83\x51\x11\x83\x5d\x0f\x11\x8d\x89\x09\x0f\x01\x0f\x11\x8d\x8d\x11\x8d\x55" } },
    .{ "CreateDIBPatternBrush", MethodRecord{ .library = "GDI32", .import = "CreateDIBPatternBrush", .signature = "\x00\x02\x11\x84\x0d\x11\x8d\x39\x11\x8d\x55" } },
    .{ "CreateDIBPatternBrushPt", MethodRecord{ .library = "GDI32", .import = "CreateDIBPatternBrushPt", .signature = "\x00\x02\x11\x84\x0d\x0f\x01\x11\x8d\x55" } },
    .{ "CreateEllipticRgn", MethodRecord{ .library = "GDI32", .import = "CreateEllipticRgn", .signature = "\x00\x04\x11\x83\xe1\x08\x08\x08\x08" } },
    .{ "CreateEllipticRgnIndirect", MethodRecord{ .library = "GDI32", .import = "CreateEllipticRgnIndirect", .signature = "\x00\x01\x11\x83\xe1\x0f\x11\x83\x89" } },
    .{ "CreateFontIndirectA", MethodRecord{ .library = "GDI32", .import = "CreateFontIndirectA", .signature = "\x00\x01\x11\x8d\x91\x0f\x11\x8d\x95" } },
    .{ "CreateFontIndirectW", MethodRecord{ .library = "GDI32", .import = "CreateFontIndirectW", .signature = "\x00\x01\x11\x8d\x91\x0f\x11\x83\xfd" } },
    .{ "CreateFontA", MethodRecord{ .library = "GDI32", .import = "CreateFontA", .signature = "\x00\x0e\x11\x8d\x91\x08\x08\x08\x08\x08\x09\x09\x09\x09\x09\x09\x09\x09\x11\x3d" } },
    .{ "CreateFontW", MethodRecord{ .library = "GDI32", .import = "CreateFontW", .signature = "\x00\x0e\x11\x8d\x91\x08\x08\x08\x08\x08\x09\x09\x09\x09\x09\x09\x09\x09\x11\x05" } },
    .{ "CreateHatchBrush", MethodRecord{ .library = "GDI32", .import = "CreateHatchBrush", .signature = "\x00\x02\x11\x84\x0d\x11\x8d\x99\x11\x83\x59" } },
    .{ "CreateICA", MethodRecord{ .library = "GDI32", .import = "CreateICA", .signature = "\x00\x04\x11\x83\x5d\x11\x3d\x11\x3d\x11\x3d\x0f\x11\x8d\x81" } },
    .{ "CreateICW", MethodRecord{ .library = "GDI32", .import = "CreateICW", .signature = "\x00\x04\x11\x83\x5d\x11\x05\x11\x05\x11\x05\x0f\x11\x8d\x85" } },
    .{ "CreateMetaFileA", MethodRecord{ .library = "GDI32", .import = "CreateMetaFileA", .signature = "\x00\x01\x11\x83\x5d\x11\x3d" } },
    .{ "CreateMetaFileW", MethodRecord{ .library = "GDI32", .import = "CreateMetaFileW", .signature = "\x00\x01\x11\x83\x5d\x11\x05" } },
    .{ "CreatePalette", MethodRecord{ .library = "GDI32", .import = "CreatePalette", .signature = "\x00\x01\x11\x8d\x65\x0f\x11\x8d\x9d" } },
    .{ "CreatePen", MethodRecord{ .library = "GDI32", .import = "CreatePen", .signature = "\x00\x03\x11\x8d\xa1\x11\x8d\xa5\x08\x11\x83\x59" } },
    .{ "CreatePenIndirect", MethodRecord{ .library = "GDI32", .import = "CreatePenIndirect", .signature = "\x00\x01\x11\x8d\xa1\x0f\x11\x8d\xa9" } },
    .{ "CreatePolyPolygonRgn", MethodRecord{ .library = "GDI32", .import = "CreatePolyPolygonRgn", .signature = "\x00\x04\x11\x83\xe1\x0f\x11\x83\x71\x0f\x08\x08\x11\x8d\xad" } },
    .{ "CreatePatternBrush", MethodRecord{ .library = "GDI32", .import = "CreatePatternBrush", .signature = "\x00\x01\x11\x84\x0d\x11\x83\x51" } },
    .{ "CreateRectRgn", MethodRecord{ .library = "GDI32", .import = "CreateRectRgn", .signature = "\x00\x04\x11\x83\xe1\x08\x08\x08\x08" } },
    .{ "CreateRectRgnIndirect", MethodRecord{ .library = "GDI32", .import = "CreateRectRgnIndirect", .signature = "\x00\x01\x11\x83\xe1\x0f\x11\x83\x89" } },
    .{ "CreateRoundRectRgn", MethodRecord{ .library = "GDI32", .import = "CreateRoundRectRgn", .signature = "\x00\x06\x11\x83\xe1\x08\x08\x08\x08\x08\x08" } },
    .{ "CreateScalableFontResourceA", MethodRecord{ .library = "GDI32", .import = "CreateScalableFontResourceA", .signature = "\x00\x04\x11\x59\x09\x11\x3d\x11\x3d\x11\x3d" } },
    .{ "CreateScalableFontResourceW", MethodRecord{ .library = "GDI32", .import = "CreateScalableFontResourceW", .signature = "\x00\x04\x11\x59\x09\x11\x05\x11\x05\x11\x05" } },
    .{ "CreateSolidBrush", MethodRecord{ .library = "GDI32", .import = "CreateSolidBrush", .signature = "\x00\x01\x11\x84\x0d\x11\x83\x59" } },
    .{ "DeleteDC", MethodRecord{ .library = "GDI32", .import = "DeleteDC", .signature = "\x00\x01\x11\x59\x11\x83\x5d" } },
    .{ "DeleteMetaFile", MethodRecord{ .library = "GDI32", .import = "DeleteMetaFile", .signature = "\x00\x01\x11\x59\x11\x8d\x71" } },
    .{ "DeleteObject", MethodRecord{ .library = "GDI32", .import = "DeleteObject", .signature = "\x00\x01\x11\x59\x11\x8d\x61" } },
    .{ "DrawEscape", MethodRecord{ .library = "GDI32", .import = "DrawEscape", .signature = "\x00\x04\x08\x11\x83\x5d\x08\x08\x11\x3d" } },
    .{ "Ellipse", MethodRecord{ .library = "GDI32", .import = "Ellipse", .signature = "\x00\x05\x11\x59\x11\x83\x5d\x08\x08\x08\x08" } },
    .{ "EnumFontFamiliesExA", MethodRecord{ .library = "GDI32", .import = "EnumFontFamiliesExA", .signature = "\x00\x05\x08\x11\x83\x5d\x0f\x11\x8d\x95\x12\x8d\xb1\x11\x82\x2d\x09" } },
    .{ "EnumFontFamiliesExW", MethodRecord{ .library = "GDI32", .import = "EnumFontFamiliesExW", .signature = "\x00\x05\x08\x11\x83\x5d\x0f\x11\x83\xfd\x12\x8d\xb5\x11\x82\x2d\x09" } },
    .{ "EnumFontFamiliesA", MethodRecord{ .library = "GDI32", .import = "EnumFontFamiliesA", .signature = "\x00\x04\x08\x11\x83\x5d\x11\x3d\x12\x8d\xb1\x11\x82\x2d" } },
    .{ "EnumFontFamiliesW", MethodRecord{ .library = "GDI32", .import = "EnumFontFamiliesW", .signature = "\x00\x04\x08\x11\x83\x5d\x11\x05\x12\x8d\xb5\x11\x82\x2d" } },
    .{ "EnumFontsA", MethodRecord{ .library = "GDI32", .import = "EnumFontsA", .signature = "\x00\x04\x08\x11\x83\x5d\x11\x3d\x12\x8d\xb1\x11\x82\x2d" } },
    .{ "EnumFontsW", MethodRecord{ .library = "GDI32", .import = "EnumFontsW", .signature = "\x00\x04\x08\x11\x83\x5d\x11\x05\x12\x8d\xb5\x11\x82\x2d" } },
    .{ "EnumObjects", MethodRecord{ .library = "GDI32", .import = "EnumObjects", .signature = "\x00\x04\x08\x11\x83\x5d\x11\x8d\x51\x12\x8d\xb9\x11\x82\x2d" } },
    .{ "EqualRgn", MethodRecord{ .library = "GDI32", .import = "EqualRgn", .signature = "\x00\x02\x11\x59\x11\x83\xe1\x11\x83\xe1" } },
    .{ "ExcludeClipRect", MethodRecord{ .library = "GDI32", .import = "ExcludeClipRect", .signature = "\x00\x05\x11\x8d\x75\x11\x83\x5d\x08\x08\x08\x08" } },
    .{ "ExtCreateRegion", MethodRecord{ .library = "GDI32", .import = "ExtCreateRegion", .signature = "\x00\x03\x11\x83\xe1\x0f\x11\x8d\xbd\x09\x0f\x11\x8d\xc1" } },
    .{ "ExtFloodFill", MethodRecord{ .library = "GDI32", .import = "ExtFloodFill", .signature = "\x00\x05\x11\x59\x11\x83\x5d\x08\x08\x11\x83\x59\x11\x8d\xc5" } },
    .{ "FillRgn", MethodRecord{ .library = "GDI32", .import = "FillRgn", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x11\x83\xe1\x11\x84\x0d" } },
    .{ "FloodFill", MethodRecord{ .library = "GDI32", .import = "FloodFill", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x08\x08\x11\x83\x59" } },
    .{ "FrameRgn", MethodRecord{ .library = "GDI32", .import = "FrameRgn", .signature = "\x00\x05\x11\x59\x11\x83\x5d\x11\x83\xe1\x11\x84\x0d\x08\x08" } },
    .{ "GetROP2", MethodRecord{ .library = "GDI32", .import = "GetROP2", .signature = "\x00\x01\x11\x8d\x45\x11\x83\x5d" } },
    .{ "GetAspectRatioFilterEx", MethodRecord{ .library = "GDI32", .import = "GetAspectRatioFilterEx", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x83\xe9" } },
    .{ "GetBkColor", MethodRecord{ .library = "GDI32", .import = "GetBkColor", .signature = "\x00\x01\x11\x83\x59\x11\x83\x5d" } },
    .{ "GetDCBrushColor", MethodRecord{ .library = "GDI32", .import = "GetDCBrushColor", .signature = "\x00\x01\x11\x83\x59\x11\x83\x5d" } },
    .{ "GetDCPenColor", MethodRecord{ .library = "GDI32", .import = "GetDCPenColor", .signature = "\x00\x01\x11\x83\x59\x11\x83\x5d" } },
    .{ "GetBkMode", MethodRecord{ .library = "GDI32", .import = "GetBkMode", .signature = "\x00\x01\x08\x11\x83\x5d" } },
    .{ "GetBitmapBits", MethodRecord{ .library = "GDI32", .import = "GetBitmapBits", .signature = "\x00\x03\x08\x11\x83\x51\x08\x0f\x01" } },
    .{ "GetBitmapDimensionEx", MethodRecord{ .library = "GDI32", .import = "GetBitmapDimensionEx", .signature = "\x00\x02\x11\x59\x11\x83\x51\x0f\x11\x83\xe9" } },
    .{ "GetBoundsRect", MethodRecord{ .library = "GDI32", .import = "GetBoundsRect", .signature = "\x00\x03\x09\x11\x83\x5d\x0f\x11\x83\x89\x09" } },
    .{ "GetBrushOrgEx", MethodRecord{ .library = "GDI32", .import = "GetBrushOrgEx", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x83\x71" } },
    .{ "GetCharWidthA", MethodRecord{ .library = "GDI32", .import = "GetCharWidthA", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x09\x09\x0f\x08" } },
    .{ "GetCharWidthW", MethodRecord{ .library = "GDI32", .import = "GetCharWidthW", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x09\x09\x0f\x08" } },
    .{ "GetCharWidth32A", MethodRecord{ .library = "GDI32", .import = "GetCharWidth32A", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x09\x09\x0f\x08" } },
    .{ "GetCharWidth32W", MethodRecord{ .library = "GDI32", .import = "GetCharWidth32W", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x09\x09\x0f\x08" } },
    .{ "GetCharWidthFloatA", MethodRecord{ .library = "GDI32", .import = "GetCharWidthFloatA", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x09\x09\x0f\x0c" } },
    .{ "GetCharWidthFloatW", MethodRecord{ .library = "GDI32", .import = "GetCharWidthFloatW", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x09\x09\x0f\x0c" } },
    .{ "GetCharABCWidthsA", MethodRecord{ .library = "GDI32", .import = "GetCharABCWidthsA", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x09\x09\x0f\x11\x8d\xc9" } },
    .{ "GetCharABCWidthsW", MethodRecord{ .library = "GDI32", .import = "GetCharABCWidthsW", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x09\x09\x0f\x11\x8d\xc9" } },
    .{ "GetCharABCWidthsFloatA", MethodRecord{ .library = "GDI32", .import = "GetCharABCWidthsFloatA", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x09\x09\x0f\x11\x8d\xcd" } },
    .{ "GetCharABCWidthsFloatW", MethodRecord{ .library = "GDI32", .import = "GetCharABCWidthsFloatW", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x09\x09\x0f\x11\x8d\xcd" } },
    .{ "GetClipBox", MethodRecord{ .library = "GDI32", .import = "GetClipBox", .signature = "\x00\x02\x11\x8d\x75\x11\x83\x5d\x0f\x11\x83\x89" } },
    .{ "GetClipRgn", MethodRecord{ .library = "GDI32", .import = "GetClipRgn", .signature = "\x00\x02\x08\x11\x83\x5d\x11\x83\xe1" } },
    .{ "GetMetaRgn", MethodRecord{ .library = "GDI32", .import = "GetMetaRgn", .signature = "\x00\x02\x08\x11\x83\x5d\x11\x83\xe1" } },
    .{ "GetCurrentObject", MethodRecord{ .library = "GDI32", .import = "GetCurrentObject", .signature = "\x00\x02\x11\x8d\x61\x11\x83\x5d\x09" } },
    .{ "GetCurrentPositionEx", MethodRecord{ .library = "GDI32", .import = "GetCurrentPositionEx", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x83\x71" } },
    .{ "GetDeviceCaps", MethodRecord{ .library = "GDI32", .import = "GetDeviceCaps", .signature = "\x00\x02\x08\x11\x83\x5d\x08" } },
    .{ "GetDIBits", MethodRecord{ .library = "GDI32", .import = "GetDIBits", .signature = "\x00\x07\x08\x11\x83\x5d\x11\x83\x51\x09\x09\x0f\x01\x0f\x11\x8d\x8d\x11\x8d\x55" } },
    .{ "GetFontData", MethodRecord{ .library = "GDI32", .import = "GetFontData", .signature = "\x00\x05\x09\x11\x83\x5d\x09\x09\x0f\x01\x09" } },
    .{ "GetGlyphOutlineA", MethodRecord{ .library = "GDI32", .import = "GetGlyphOutlineA", .signature = "\x00\x07\x09\x11\x83\x5d\x09\x11\x8d\xd1\x0f\x11\x8d\xd5\x09\x0f\x01\x0f\x11\x8d\xd9" } },
    .{ "GetGlyphOutlineW", MethodRecord{ .library = "GDI32", .import = "GetGlyphOutlineW", .signature = "\x00\x07\x09\x11\x83\x5d\x09\x11\x8d\xd1\x0f\x11\x8d\xd5\x09\x0f\x01\x0f\x11\x8d\xd9" } },
    .{ "GetGraphicsMode", MethodRecord{ .library = "GDI32", .import = "GetGraphicsMode", .signature = "\x00\x01\x08\x11\x83\x5d" } },
    .{ "GetMapMode", MethodRecord{ .library = "GDI32", .import = "GetMapMode", .signature = "\x00\x01\x11\x8d\xdd\x11\x83\x5d" } },
    .{ "GetMetaFileBitsEx", MethodRecord{ .library = "GDI32", .import = "GetMetaFileBitsEx", .signature = "\x00\x03\x09\x11\x8d\x71\x09\x0f\x01" } },
    .{ "GetMetaFileA", MethodRecord{ .library = "GDI32", .import = "GetMetaFileA", .signature = "\x00\x01\x11\x8d\x71\x11\x3d" } },
    .{ "GetMetaFileW", MethodRecord{ .library = "GDI32", .import = "GetMetaFileW", .signature = "\x00\x01\x11\x8d\x71\x11\x05" } },
    .{ "GetNearestColor", MethodRecord{ .library = "GDI32", .import = "GetNearestColor", .signature = "\x00\x02\x11\x83\x59\x11\x83\x5d\x11\x83\x59" } },
    .{ "GetNearestPaletteIndex", MethodRecord{ .library = "GDI32", .import = "GetNearestPaletteIndex", .signature = "\x00\x02\x09\x11\x8d\x65\x11\x83\x59" } },
    .{ "GetObjectType", MethodRecord{ .library = "GDI32", .import = "GetObjectType", .signature = "\x00\x01\x09\x11\x8d\x61" } },
    .{ "GetOutlineTextMetricsA", MethodRecord{ .library = "GDI32", .import = "GetOutlineTextMetricsA", .signature = "\x00\x03\x09\x11\x83\x5d\x09\x0f\x11\x8d\xe1" } },
    .{ "GetOutlineTextMetricsW", MethodRecord{ .library = "GDI32", .import = "GetOutlineTextMetricsW", .signature = "\x00\x03\x09\x11\x83\x5d\x09\x0f\x11\x8d\xe5" } },
    .{ "GetPaletteEntries", MethodRecord{ .library = "GDI32", .import = "GetPaletteEntries", .signature = "\x00\x04\x09\x11\x8d\x65\x09\x09\x0f\x11\x8d\x69" } },
    .{ "GetPixel", MethodRecord{ .library = "GDI32", .import = "GetPixel", .signature = "\x00\x03\x11\x83\x59\x11\x83\x5d\x08\x08" } },
    .{ "GetPolyFillMode", MethodRecord{ .library = "GDI32", .import = "GetPolyFillMode", .signature = "\x00\x01\x08\x11\x83\x5d" } },
    .{ "GetRasterizerCaps", MethodRecord{ .library = "GDI32", .import = "GetRasterizerCaps", .signature = "\x00\x02\x11\x59\x0f\x11\x8d\xe9\x09" } },
    .{ "GetRandomRgn", MethodRecord{ .library = "GDI32", .import = "GetRandomRgn", .signature = "\x00\x03\x08\x11\x83\x5d\x11\x83\xe1\x08" } },
    .{ "GetRegionData", MethodRecord{ .library = "GDI32", .import = "GetRegionData", .signature = "\x00\x03\x09\x11\x83\xe1\x09\x0f\x11\x8d\xc1" } },
    .{ "GetRgnBox", MethodRecord{ .library = "GDI32", .import = "GetRgnBox", .signature = "\x00\x02\x11\x8d\x75\x11\x83\xe1\x0f\x11\x83\x89" } },
    .{ "GetStockObject", MethodRecord{ .library = "GDI32", .import = "GetStockObject", .signature = "\x00\x01\x11\x8d\x61\x11\x8d\xed" } },
    .{ "GetStretchBltMode", MethodRecord{ .library = "GDI32", .import = "GetStretchBltMode", .signature = "\x00\x01\x08\x11\x83\x5d" } },
    .{ "GetSystemPaletteEntries", MethodRecord{ .library = "GDI32", .import = "GetSystemPaletteEntries", .signature = "\x00\x04\x09\x11\x83\x5d\x09\x09\x0f\x11\x8d\x69" } },
    .{ "GetSystemPaletteUse", MethodRecord{ .library = "GDI32", .import = "GetSystemPaletteUse", .signature = "\x00\x01\x09\x11\x83\x5d" } },
    .{ "GetTextCharacterExtra", MethodRecord{ .library = "GDI32", .import = "GetTextCharacterExtra", .signature = "\x00\x01\x08\x11\x83\x5d" } },
    .{ "GetTextAlign", MethodRecord{ .library = "GDI32", .import = "GetTextAlign", .signature = "\x00\x01\x11\x8d\xf1\x11\x83\x5d" } },
    .{ "GetTextColor", MethodRecord{ .library = "GDI32", .import = "GetTextColor", .signature = "\x00\x01\x11\x83\x59\x11\x83\x5d" } },
    .{ "GetTextExtentPointA", MethodRecord{ .library = "GDI32", .import = "GetTextExtentPointA", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x11\x3d\x08\x0f\x11\x83\xe9" } },
    .{ "GetTextExtentPointW", MethodRecord{ .library = "GDI32", .import = "GetTextExtentPointW", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x11\x05\x08\x0f\x11\x83\xe9" } },
    .{ "GetTextExtentPoint32A", MethodRecord{ .library = "GDI32", .import = "GetTextExtentPoint32A", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x11\x3d\x08\x0f\x11\x83\xe9" } },
    .{ "GetTextExtentPoint32W", MethodRecord{ .library = "GDI32", .import = "GetTextExtentPoint32W", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x11\x05\x08\x0f\x11\x83\xe9" } },
    .{ "GetTextExtentExPointA", MethodRecord{ .library = "GDI32", .import = "GetTextExtentExPointA", .signature = "\x00\x07\x11\x59\x11\x83\x5d\x11\x3d\x08\x08\x0f\x08\x0f\x08\x0f\x11\x83\xe9" } },
    .{ "GetTextExtentExPointW", MethodRecord{ .library = "GDI32", .import = "GetTextExtentExPointW", .signature = "\x00\x07\x11\x59\x11\x83\x5d\x11\x05\x08\x08\x0f\x08\x0f\x08\x0f\x11\x83\xe9" } },
    .{ "GetFontLanguageInfo", MethodRecord{ .library = "GDI32", .import = "GetFontLanguageInfo", .signature = "\x00\x01\x09\x11\x83\x5d" } },
    .{ "GetCharacterPlacementA", MethodRecord{ .library = "GDI32", .import = "GetCharacterPlacementA", .signature = "\x00\x06\x09\x11\x83\x5d\x11\x3d\x08\x08\x0f\x11\x8d\xf5\x11\x8d\xf9" } },
    .{ "GetCharacterPlacementW", MethodRecord{ .library = "GDI32", .import = "GetCharacterPlacementW", .signature = "\x00\x06\x09\x11\x83\x5d\x11\x05\x08\x08\x0f\x11\x8d\xfd\x11\x8d\xf9" } },
    .{ "GetFontUnicodeRanges", MethodRecord{ .library = "GDI32", .import = "GetFontUnicodeRanges", .signature = "\x00\x02\x09\x11\x83\x5d\x0f\x11\x8e\x01" } },
    .{ "GetGlyphIndicesA", MethodRecord{ .library = "GDI32", .import = "GetGlyphIndicesA", .signature = "\x00\x05\x09\x11\x83\x5d\x11\x3d\x08\x0f\x07\x09" } },
    .{ "GetGlyphIndicesW", MethodRecord{ .library = "GDI32", .import = "GetGlyphIndicesW", .signature = "\x00\x05\x09\x11\x83\x5d\x11\x05\x08\x0f\x07\x09" } },
    .{ "GetTextExtentPointI", MethodRecord{ .library = "GDI32", .import = "GetTextExtentPointI", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x0f\x07\x08\x0f\x11\x83\xe9" } },
    .{ "GetTextExtentExPointI", MethodRecord{ .library = "GDI32", .import = "GetTextExtentExPointI", .signature = "\x00\x07\x11\x59\x11\x83\x5d\x0f\x07\x08\x08\x0f\x08\x0f\x08\x0f\x11\x83\xe9" } },
    .{ "GetCharWidthI", MethodRecord{ .library = "GDI32", .import = "GetCharWidthI", .signature = "\x00\x05\x11\x59\x11\x83\x5d\x09\x09\x0f\x07\x0f\x08" } },
    .{ "GetCharABCWidthsI", MethodRecord{ .library = "GDI32", .import = "GetCharABCWidthsI", .signature = "\x00\x05\x11\x59\x11\x83\x5d\x09\x09\x0f\x07\x0f\x11\x8d\xc9" } },
    .{ "AddFontResourceExA", MethodRecord{ .library = "GDI32", .import = "AddFontResourceExA", .signature = "\x00\x03\x08\x11\x3d\x11\x8e\x05\x0f\x01" } },
    .{ "AddFontResourceExW", MethodRecord{ .library = "GDI32", .import = "AddFontResourceExW", .signature = "\x00\x03\x08\x11\x05\x11\x8e\x05\x0f\x01" } },
    .{ "RemoveFontResourceExA", MethodRecord{ .library = "GDI32", .import = "RemoveFontResourceExA", .signature = "\x00\x03\x11\x59\x11\x3d\x09\x0f\x01" } },
    .{ "RemoveFontResourceExW", MethodRecord{ .library = "GDI32", .import = "RemoveFontResourceExW", .signature = "\x00\x03\x11\x59\x11\x05\x09\x0f\x01" } },
    .{ "AddFontMemResourceEx", MethodRecord{ .library = "GDI32", .import = "AddFontMemResourceEx", .signature = "\x00\x04\x11\x80\x85\x0f\x01\x09\x0f\x01\x0f\x09" } },
    .{ "RemoveFontMemResourceEx", MethodRecord{ .library = "GDI32", .import = "RemoveFontMemResourceEx", .signature = "\x00\x01\x11\x59\x11\x80\x85" } },
    .{ "CreateFontIndirectExA", MethodRecord{ .library = "GDI32", .import = "CreateFontIndirectExA", .signature = "\x00\x01\x11\x8d\x91\x0f\x11\x8e\x09" } },
    .{ "CreateFontIndirectExW", MethodRecord{ .library = "GDI32", .import = "CreateFontIndirectExW", .signature = "\x00\x01\x11\x8d\x91\x0f\x11\x8e\x0d" } },
    .{ "GetViewportExtEx", MethodRecord{ .library = "GDI32", .import = "GetViewportExtEx", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x83\xe9" } },
    .{ "GetViewportOrgEx", MethodRecord{ .library = "GDI32", .import = "GetViewportOrgEx", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x83\x71" } },
    .{ "GetWindowExtEx", MethodRecord{ .library = "GDI32", .import = "GetWindowExtEx", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x83\xe9" } },
    .{ "GetWindowOrgEx", MethodRecord{ .library = "GDI32", .import = "GetWindowOrgEx", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x83\x71" } },
    .{ "IntersectClipRect", MethodRecord{ .library = "GDI32", .import = "IntersectClipRect", .signature = "\x00\x05\x11\x8d\x75\x11\x83\x5d\x08\x08\x08\x08" } },
    .{ "InvertRgn", MethodRecord{ .library = "GDI32", .import = "InvertRgn", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x11\x83\xe1" } },
    .{ "LineDDA", MethodRecord{ .library = "GDI32", .import = "LineDDA", .signature = "\x00\x06\x11\x59\x08\x08\x08\x08\x12\x8e\x11\x11\x82\x2d" } },
    .{ "LineTo", MethodRecord{ .library = "GDI32", .import = "LineTo", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x08\x08" } },
    .{ "MaskBlt", MethodRecord{ .library = "GDI32", .import = "MaskBlt", .signature = "\x00\x0c\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x11\x83\x5d\x08\x08\x11\x83\x51\x08\x08\x09" } },
    .{ "PlgBlt", MethodRecord{ .library = "GDI32", .import = "PlgBlt", .signature = "\x00\x0a\x11\x59\x11\x83\x5d\x0f\x11\x83\x71\x11\x83\x5d\x08\x08\x08\x08\x11\x83\x51\x08\x08" } },
    .{ "OffsetClipRgn", MethodRecord{ .library = "GDI32", .import = "OffsetClipRgn", .signature = "\x00\x03\x11\x8d\x75\x11\x83\x5d\x08\x08" } },
    .{ "OffsetRgn", MethodRecord{ .library = "GDI32", .import = "OffsetRgn", .signature = "\x00\x03\x11\x8d\x75\x11\x83\xe1\x08\x08" } },
    .{ "PatBlt", MethodRecord{ .library = "GDI32", .import = "PatBlt", .signature = "\x00\x06\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x11\x8d\x6d" } },
    .{ "Pie", MethodRecord{ .library = "GDI32", .import = "Pie", .signature = "\x00\x09\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x08\x08\x08\x08" } },
    .{ "PlayMetaFile", MethodRecord{ .library = "GDI32", .import = "PlayMetaFile", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x11\x8d\x71" } },
    .{ "PaintRgn", MethodRecord{ .library = "GDI32", .import = "PaintRgn", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x11\x83\xe1" } },
    .{ "PolyPolygon", MethodRecord{ .library = "GDI32", .import = "PolyPolygon", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x0f\x11\x83\x71\x0f\x08\x08" } },
    .{ "PtInRegion", MethodRecord{ .library = "GDI32", .import = "PtInRegion", .signature = "\x00\x03\x11\x59\x11\x83\xe1\x08\x08" } },
    .{ "PtVisible", MethodRecord{ .library = "GDI32", .import = "PtVisible", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x08\x08" } },
    .{ "RectInRegion", MethodRecord{ .library = "GDI32", .import = "RectInRegion", .signature = "\x00\x02\x11\x59\x11\x83\xe1\x0f\x11\x83\x89" } },
    .{ "RectVisible", MethodRecord{ .library = "GDI32", .import = "RectVisible", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x83\x89" } },
    .{ "Rectangle", MethodRecord{ .library = "GDI32", .import = "Rectangle", .signature = "\x00\x05\x11\x59\x11\x83\x5d\x08\x08\x08\x08" } },
    .{ "RestoreDC", MethodRecord{ .library = "GDI32", .import = "RestoreDC", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x08" } },
    .{ "ResetDCA", MethodRecord{ .library = "GDI32", .import = "ResetDCA", .signature = "\x00\x02\x11\x83\x5d\x11\x83\x5d\x0f\x11\x8d\x81" } },
    .{ "ResetDCW", MethodRecord{ .library = "GDI32", .import = "ResetDCW", .signature = "\x00\x02\x11\x83\x5d\x11\x83\x5d\x0f\x11\x8d\x85" } },
    .{ "RealizePalette", MethodRecord{ .library = "GDI32", .import = "RealizePalette", .signature = "\x00\x01\x09\x11\x83\x5d" } },
    .{ "RemoveFontResourceA", MethodRecord{ .library = "GDI32", .import = "RemoveFontResourceA", .signature = "\x00\x01\x11\x59\x11\x3d" } },
    .{ "RemoveFontResourceW", MethodRecord{ .library = "GDI32", .import = "RemoveFontResourceW", .signature = "\x00\x01\x11\x59\x11\x05" } },
    .{ "RoundRect", MethodRecord{ .library = "GDI32", .import = "RoundRect", .signature = "\x00\x07\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x08\x08" } },
    .{ "ResizePalette", MethodRecord{ .library = "GDI32", .import = "ResizePalette", .signature = "\x00\x02\x11\x59\x11\x8d\x65\x09" } },
    .{ "SaveDC", MethodRecord{ .library = "GDI32", .import = "SaveDC", .signature = "\x00\x01\x08\x11\x83\x5d" } },
    .{ "SelectClipRgn", MethodRecord{ .library = "GDI32", .import = "SelectClipRgn", .signature = "\x00\x02\x11\x8d\x75\x11\x83\x5d\x11\x83\xe1" } },
    .{ "ExtSelectClipRgn", MethodRecord{ .library = "GDI32", .import = "ExtSelectClipRgn", .signature = "\x00\x03\x11\x8d\x75\x11\x83\x5d\x11\x83\xe1\x11\x8d\x49" } },
    .{ "SetMetaRgn", MethodRecord{ .library = "GDI32", .import = "SetMetaRgn", .signature = "\x00\x01\x11\x8d\x75\x11\x83\x5d" } },
    .{ "SelectObject", MethodRecord{ .library = "GDI32", .import = "SelectObject", .signature = "\x00\x02\x11\x8d\x61\x11\x83\x5d\x11\x8d\x61" } },
    .{ "SelectPalette", MethodRecord{ .library = "GDI32", .import = "SelectPalette", .signature = "\x00\x03\x11\x8d\x65\x11\x83\x5d\x11\x8d\x65\x11\x59" } },
    .{ "SetBkColor", MethodRecord{ .library = "GDI32", .import = "SetBkColor", .signature = "\x00\x02\x11\x83\x59\x11\x83\x5d\x11\x83\x59" } },
    .{ "SetDCBrushColor", MethodRecord{ .library = "GDI32", .import = "SetDCBrushColor", .signature = "\x00\x02\x11\x83\x59\x11\x83\x5d\x11\x83\x59" } },
    .{ "SetDCPenColor", MethodRecord{ .library = "GDI32", .import = "SetDCPenColor", .signature = "\x00\x02\x11\x83\x59\x11\x83\x5d\x11\x83\x59" } },
    .{ "SetBkMode", MethodRecord{ .library = "GDI32", .import = "SetBkMode", .signature = "\x00\x02\x08\x11\x83\x5d\x08" } },
    .{ "SetBitmapBits", MethodRecord{ .library = "GDI32", .import = "SetBitmapBits", .signature = "\x00\x03\x08\x11\x83\x51\x09\x0f\x01" } },
    .{ "SetBoundsRect", MethodRecord{ .library = "GDI32", .import = "SetBoundsRect", .signature = "\x00\x03\x09\x11\x83\x5d\x0f\x11\x83\x89\x11\x8e\x15" } },
    .{ "SetDIBits", MethodRecord{ .library = "GDI32", .import = "SetDIBits", .signature = "\x00\x07\x08\x11\x83\x5d\x11\x83\x51\x09\x09\x0f\x01\x0f\x11\x8d\x8d\x11\x8d\x55" } },
    .{ "SetDIBitsToDevice", MethodRecord{ .library = "GDI32", .import = "SetDIBitsToDevice", .signature = "\x00\x0c\x08\x11\x83\x5d\x08\x08\x09\x09\x08\x08\x09\x09\x0f\x01\x0f\x11\x8d\x8d\x11\x8d\x55" } },
    .{ "SetMapperFlags", MethodRecord{ .library = "GDI32", .import = "SetMapperFlags", .signature = "\x00\x02\x09\x11\x83\x5d\x09" } },
    .{ "SetGraphicsMode", MethodRecord{ .library = "GDI32", .import = "SetGraphicsMode", .signature = "\x00\x02\x08\x11\x83\x5d\x11\x8e\x19" } },
    .{ "SetMapMode", MethodRecord{ .library = "GDI32", .import = "SetMapMode", .signature = "\x00\x02\x08\x11\x83\x5d\x11\x8d\xdd" } },
    .{ "SetLayout", MethodRecord{ .library = "GDI32", .import = "SetLayout", .signature = "\x00\x02\x09\x11\x83\x5d\x11\x8e\x1d" } },
    .{ "GetLayout", MethodRecord{ .library = "GDI32", .import = "GetLayout", .signature = "\x00\x01\x09\x11\x83\x5d" } },
    .{ "SetMetaFileBitsEx", MethodRecord{ .library = "GDI32", .import = "SetMetaFileBitsEx", .signature = "\x00\x02\x11\x8d\x71\x09\x0f\x05" } },
    .{ "SetPaletteEntries", MethodRecord{ .library = "GDI32", .import = "SetPaletteEntries", .signature = "\x00\x04\x09\x11\x8d\x65\x09\x09\x0f\x11\x8d\x69" } },
    .{ "SetPixel", MethodRecord{ .library = "GDI32", .import = "SetPixel", .signature = "\x00\x04\x11\x83\x59\x11\x83\x5d\x08\x08\x11\x83\x59" } },
    .{ "SetPixelV", MethodRecord{ .library = "GDI32", .import = "SetPixelV", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x08\x08\x11\x83\x59" } },
    .{ "SetPolyFillMode", MethodRecord{ .library = "GDI32", .import = "SetPolyFillMode", .signature = "\x00\x02\x08\x11\x83\x5d\x11\x8d\xad" } },
    .{ "StretchBlt", MethodRecord{ .library = "GDI32", .import = "StretchBlt", .signature = "\x00\x0b\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x11\x83\x5d\x08\x08\x08\x08\x11\x8d\x6d" } },
    .{ "SetRectRgn", MethodRecord{ .library = "GDI32", .import = "SetRectRgn", .signature = "\x00\x05\x11\x59\x11\x83\xe1\x08\x08\x08\x08" } },
    .{ "StretchDIBits", MethodRecord{ .library = "GDI32", .import = "StretchDIBits", .signature = "\x00\x0d\x08\x11\x83\x5d\x08\x08\x08\x08\x08\x08\x08\x08\x0f\x01\x0f\x11\x8d\x8d\x11\x8d\x55\x11\x8d\x6d" } },
    .{ "SetROP2", MethodRecord{ .library = "GDI32", .import = "SetROP2", .signature = "\x00\x02\x08\x11\x83\x5d\x11\x8d\x45" } },
    .{ "SetStretchBltMode", MethodRecord{ .library = "GDI32", .import = "SetStretchBltMode", .signature = "\x00\x02\x08\x11\x83\x5d\x11\x8e\x21" } },
    .{ "SetSystemPaletteUse", MethodRecord{ .library = "GDI32", .import = "SetSystemPaletteUse", .signature = "\x00\x02\x09\x11\x83\x5d\x11\x8e\x25" } },
    .{ "SetTextCharacterExtra", MethodRecord{ .library = "GDI32", .import = "SetTextCharacterExtra", .signature = "\x00\x02\x08\x11\x83\x5d\x08" } },
    .{ "SetTextColor", MethodRecord{ .library = "GDI32", .import = "SetTextColor", .signature = "\x00\x02\x11\x83\x59\x11\x83\x5d\x11\x83\x59" } },
    .{ "SetTextAlign", MethodRecord{ .library = "GDI32", .import = "SetTextAlign", .signature = "\x00\x02\x09\x11\x83\x5d\x11\x8d\xf1" } },
    .{ "SetTextJustification", MethodRecord{ .library = "GDI32", .import = "SetTextJustification", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x08\x08" } },
    .{ "UpdateColors", MethodRecord{ .library = "GDI32", .import = "UpdateColors", .signature = "\x00\x01\x11\x59\x11\x83\x5d" } },
    .{ "AlphaBlend", MethodRecord{ .library = "MSIMG32", .import = "AlphaBlend", .signature = "\x00\x0b\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x11\x83\x5d\x08\x08\x08\x08\x11\x8e\x29" } },
    .{ "TransparentBlt", MethodRecord{ .library = "MSIMG32", .import = "TransparentBlt", .signature = "\x00\x0b\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x11\x83\x5d\x08\x08\x08\x08\x09" } },
    .{ "GradientFill", MethodRecord{ .library = "MSIMG32", .import = "GradientFill", .signature = "\x00\x06\x11\x59\x11\x83\x5d\x0f\x11\x8e\x2d\x09\x0f\x01\x09\x11\x8e\x31" } },
    .{ "GdiAlphaBlend", MethodRecord{ .library = "GDI32", .import = "GdiAlphaBlend", .signature = "\x00\x0b\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x11\x83\x5d\x08\x08\x08\x08\x11\x8e\x29" } },
    .{ "GdiTransparentBlt", MethodRecord{ .library = "GDI32", .import = "GdiTransparentBlt", .signature = "\x00\x0b\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x11\x83\x5d\x08\x08\x08\x08\x09" } },
    .{ "GdiGradientFill", MethodRecord{ .library = "GDI32", .import = "GdiGradientFill", .signature = "\x00\x06\x11\x59\x11\x83\x5d\x0f\x11\x8e\x2d\x09\x0f\x01\x09\x11\x8e\x31" } },
    .{ "PlayMetaFileRecord", MethodRecord{ .library = "GDI32", .import = "PlayMetaFileRecord", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x0f\x11\x8e\x35\x0f\x11\x8e\x39\x09" } },
    .{ "EnumMetaFile", MethodRecord{ .library = "GDI32", .import = "EnumMetaFile", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x11\x8d\x71\x12\x8e\x3d\x11\x82\x2d" } },
    .{ "CloseEnhMetaFile", MethodRecord{ .library = "GDI32", .import = "CloseEnhMetaFile", .signature = "\x00\x01\x11\x8e\x41\x11\x83\x5d" } },
    .{ "CopyEnhMetaFileA", MethodRecord{ .library = "GDI32", .import = "CopyEnhMetaFileA", .signature = "\x00\x02\x11\x8e\x41\x11\x8e\x41\x11\x3d" } },
    .{ "CopyEnhMetaFileW", MethodRecord{ .library = "GDI32", .import = "CopyEnhMetaFileW", .signature = "\x00\x02\x11\x8e\x41\x11\x8e\x41\x11\x05" } },
    .{ "CreateEnhMetaFileA", MethodRecord{ .library = "GDI32", .import = "CreateEnhMetaFileA", .signature = "\x00\x04\x11\x83\x5d\x11\x83\x5d\x11\x3d\x0f\x11\x83\x89\x11\x3d" } },
    .{ "CreateEnhMetaFileW", MethodRecord{ .library = "GDI32", .import = "CreateEnhMetaFileW", .signature = "\x00\x04\x11\x83\x5d\x11\x83\x5d\x11\x05\x0f\x11\x83\x89\x11\x05" } },
    .{ "DeleteEnhMetaFile", MethodRecord{ .library = "GDI32", .import = "DeleteEnhMetaFile", .signature = "\x00\x01\x11\x59\x11\x8e\x41" } },
    .{ "EnumEnhMetaFile", MethodRecord{ .library = "GDI32", .import = "EnumEnhMetaFile", .signature = "\x00\x05\x11\x59\x11\x83\x5d\x11\x8e\x41\x12\x8e\x45\x0f\x01\x0f\x11\x83\x89" } },
    .{ "GetEnhMetaFileA", MethodRecord{ .library = "GDI32", .import = "GetEnhMetaFileA", .signature = "\x00\x01\x11\x8e\x41\x11\x3d" } },
    .{ "GetEnhMetaFileW", MethodRecord{ .library = "GDI32", .import = "GetEnhMetaFileW", .signature = "\x00\x01\x11\x8e\x41\x11\x05" } },
    .{ "GetEnhMetaFileBits", MethodRecord{ .library = "GDI32", .import = "GetEnhMetaFileBits", .signature = "\x00\x03\x09\x11\x8e\x41\x09\x0f\x05" } },
    .{ "GetEnhMetaFileDescriptionA", MethodRecord{ .library = "GDI32", .import = "GetEnhMetaFileDescriptionA", .signature = "\x00\x03\x09\x11\x8e\x41\x09\x11\x3d" } },
    .{ "GetEnhMetaFileDescriptionW", MethodRecord{ .library = "GDI32", .import = "GetEnhMetaFileDescriptionW", .signature = "\x00\x03\x09\x11\x8e\x41\x09\x11\x05" } },
    .{ "GetEnhMetaFileHeader", MethodRecord{ .library = "GDI32", .import = "GetEnhMetaFileHeader", .signature = "\x00\x03\x09\x11\x8e\x41\x09\x0f\x11\x8e\x49" } },
    .{ "GetEnhMetaFilePaletteEntries", MethodRecord{ .library = "GDI32", .import = "GetEnhMetaFilePaletteEntries", .signature = "\x00\x03\x09\x11\x8e\x41\x09\x0f\x11\x8d\x69" } },
    .{ "GetWinMetaFileBits", MethodRecord{ .library = "GDI32", .import = "GetWinMetaFileBits", .signature = "\x00\x05\x09\x11\x8e\x41\x09\x0f\x05\x08\x11\x83\x5d" } },
    .{ "PlayEnhMetaFile", MethodRecord{ .library = "GDI32", .import = "PlayEnhMetaFile", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x11\x8e\x41\x0f\x11\x83\x89" } },
    .{ "PlayEnhMetaFileRecord", MethodRecord{ .library = "GDI32", .import = "PlayEnhMetaFileRecord", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x0f\x11\x8e\x35\x0f\x11\x8e\x4d\x09" } },
    .{ "SetEnhMetaFileBits", MethodRecord{ .library = "GDI32", .import = "SetEnhMetaFileBits", .signature = "\x00\x02\x11\x8e\x41\x09\x0f\x05" } },
    .{ "GdiComment", MethodRecord{ .library = "GDI32", .import = "GdiComment", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x09\x0f\x05" } },
    .{ "GetTextMetricsA", MethodRecord{ .library = "GDI32", .import = "GetTextMetricsA", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x8e\x51" } },
    .{ "GetTextMetricsW", MethodRecord{ .library = "GDI32", .import = "GetTextMetricsW", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x83\xed" } },
    .{ "AngleArc", MethodRecord{ .library = "GDI32", .import = "AngleArc", .signature = "\x00\x06\x11\x59\x11\x83\x5d\x08\x08\x09\x0c\x0c" } },
    .{ "PolyPolyline", MethodRecord{ .library = "GDI32", .import = "PolyPolyline", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x0f\x11\x83\x71\x0f\x09\x09" } },
    .{ "GetWorldTransform", MethodRecord{ .library = "GDI32", .import = "GetWorldTransform", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x8d\xbd" } },
    .{ "SetWorldTransform", MethodRecord{ .library = "GDI32", .import = "SetWorldTransform", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x8d\xbd" } },
    .{ "ModifyWorldTransform", MethodRecord{ .library = "GDI32", .import = "ModifyWorldTransform", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x0f\x11\x8d\xbd\x11\x8e\x55" } },
    .{ "CombineTransform", MethodRecord{ .library = "GDI32", .import = "CombineTransform", .signature = "\x00\x03\x11\x59\x0f\x11\x8d\xbd\x0f\x11\x8d\xbd\x0f\x11\x8d\xbd" } },
    .{ "CreateDIBSection", MethodRecord{ .library = "GDI32", .import = "CreateDIBSection", .signature = "\x00\x06\x11\x83\x51\x11\x83\x5d\x0f\x11\x8d\x8d\x11\x8d\x55\x0f\x0f\x01\x11\x80\x85\x09" } },
    .{ "GetDIBColorTable", MethodRecord{ .library = "GDI32", .import = "GetDIBColorTable", .signature = "\x00\x04\x09\x11\x83\x5d\x09\x09\x0f\x11\x84\x2d" } },
    .{ "SetDIBColorTable", MethodRecord{ .library = "GDI32", .import = "SetDIBColorTable", .signature = "\x00\x04\x09\x11\x83\x5d\x09\x09\x0f\x11\x84\x2d" } },
    .{ "SetColorAdjustment", MethodRecord{ .library = "GDI32", .import = "SetColorAdjustment", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x8e\x59" } },
    .{ "GetColorAdjustment", MethodRecord{ .library = "GDI32", .import = "GetColorAdjustment", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x8e\x59" } },
    .{ "CreateHalftonePalette", MethodRecord{ .library = "GDI32", .import = "CreateHalftonePalette", .signature = "\x00\x01\x11\x8d\x65\x11\x83\x5d" } },
    .{ "AbortPath", MethodRecord{ .library = "GDI32", .import = "AbortPath", .signature = "\x00\x01\x11\x59\x11\x83\x5d" } },
    .{ "ArcTo", MethodRecord{ .library = "GDI32", .import = "ArcTo", .signature = "\x00\x09\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x08\x08\x08\x08" } },
    .{ "BeginPath", MethodRecord{ .library = "GDI32", .import = "BeginPath", .signature = "\x00\x01\x11\x59\x11\x83\x5d" } },
    .{ "CloseFigure", MethodRecord{ .library = "GDI32", .import = "CloseFigure", .signature = "\x00\x01\x11\x59\x11\x83\x5d" } },
    .{ "EndPath", MethodRecord{ .library = "GDI32", .import = "EndPath", .signature = "\x00\x01\x11\x59\x11\x83\x5d" } },
    .{ "FillPath", MethodRecord{ .library = "GDI32", .import = "FillPath", .signature = "\x00\x01\x11\x59\x11\x83\x5d" } },
    .{ "FlattenPath", MethodRecord{ .library = "GDI32", .import = "FlattenPath", .signature = "\x00\x01\x11\x59\x11\x83\x5d" } },
    .{ "GetPath", MethodRecord{ .library = "GDI32", .import = "GetPath", .signature = "\x00\x04\x08\x11\x83\x5d\x0f\x11\x83\x71\x0f\x05\x08" } },
    .{ "PathToRegion", MethodRecord{ .library = "GDI32", .import = "PathToRegion", .signature = "\x00\x01\x11\x83\xe1\x11\x83\x5d" } },
    .{ "PolyDraw", MethodRecord{ .library = "GDI32", .import = "PolyDraw", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x0f\x11\x83\x71\x0f\x05\x08" } },
    .{ "SelectClipPath", MethodRecord{ .library = "GDI32", .import = "SelectClipPath", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x11\x8d\x49" } },
    .{ "SetArcDirection", MethodRecord{ .library = "GDI32", .import = "SetArcDirection", .signature = "\x00\x02\x08\x11\x83\x5d\x11\x8e\x5d" } },
    .{ "SetMiterLimit", MethodRecord{ .library = "GDI32", .import = "SetMiterLimit", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x0c\x0f\x0c" } },
    .{ "StrokeAndFillPath", MethodRecord{ .library = "GDI32", .import = "StrokeAndFillPath", .signature = "\x00\x01\x11\x59\x11\x83\x5d" } },
    .{ "StrokePath", MethodRecord{ .library = "GDI32", .import = "StrokePath", .signature = "\x00\x01\x11\x59\x11\x83\x5d" } },
    .{ "WidenPath", MethodRecord{ .library = "GDI32", .import = "WidenPath", .signature = "\x00\x01\x11\x59\x11\x83\x5d" } },
    .{ "ExtCreatePen", MethodRecord{ .library = "GDI32", .import = "ExtCreatePen", .signature = "\x00\x05\x11\x8d\xa1\x09\x09\x0f\x11\x8d\x7d\x09\x0f\x09" } },
    .{ "GetMiterLimit", MethodRecord{ .library = "GDI32", .import = "GetMiterLimit", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x0c" } },
    .{ "GetArcDirection", MethodRecord{ .library = "GDI32", .import = "GetArcDirection", .signature = "\x00\x01\x08\x11\x83\x5d" } },
    .{ "GetObjectW", MethodRecord{ .library = "GDI32", .import = "GetObjectW", .signature = "\x00\x03\x08\x11\x8d\x61\x08\x0f\x01" } },
    .{ "MoveToEx", MethodRecord{ .library = "GDI32", .import = "MoveToEx", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x08\x08\x0f\x11\x83\x71" } },
    .{ "TextOutA", MethodRecord{ .library = "GDI32", .import = "TextOutA", .signature = "\x00\x05\x11\x59\x11\x83\x5d\x08\x08\x11\x3d\x08" } },
    .{ "TextOutW", MethodRecord{ .library = "GDI32", .import = "TextOutW", .signature = "\x00\x05\x11\x59\x11\x83\x5d\x08\x08\x11\x05\x08" } },
    .{ "ExtTextOutA", MethodRecord{ .library = "GDI32", .import = "ExtTextOutA", .signature = "\x00\x08\x11\x59\x11\x83\x5d\x08\x08\x11\x8d\x4d\x0f\x11\x83\x89\x11\x3d\x09\x0f\x08" } },
    .{ "ExtTextOutW", MethodRecord{ .library = "GDI32", .import = "ExtTextOutW", .signature = "\x00\x08\x11\x59\x11\x83\x5d\x08\x08\x11\x8d\x4d\x0f\x11\x83\x89\x11\x05\x09\x0f\x08" } },
    .{ "PolyTextOutA", MethodRecord{ .library = "GDI32", .import = "PolyTextOutA", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x0f\x11\x8e\x61\x08" } },
    .{ "PolyTextOutW", MethodRecord{ .library = "GDI32", .import = "PolyTextOutW", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x0f\x11\x8e\x65\x08" } },
    .{ "CreatePolygonRgn", MethodRecord{ .library = "GDI32", .import = "CreatePolygonRgn", .signature = "\x00\x03\x11\x83\xe1\x0f\x11\x83\x71\x08\x11\x8d\xad" } },
    .{ "DPtoLP", MethodRecord{ .library = "GDI32", .import = "DPtoLP", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x0f\x11\x83\x71\x08" } },
    .{ "LPtoDP", MethodRecord{ .library = "GDI32", .import = "LPtoDP", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x0f\x11\x83\x71\x08" } },
    .{ "Polygon", MethodRecord{ .library = "GDI32", .import = "Polygon", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x0f\x11\x83\x71\x08" } },
    .{ "Polyline", MethodRecord{ .library = "GDI32", .import = "Polyline", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x0f\x11\x83\x71\x08" } },
    .{ "PolyBezier", MethodRecord{ .library = "GDI32", .import = "PolyBezier", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x0f\x11\x83\x71\x09" } },
    .{ "PolyBezierTo", MethodRecord{ .library = "GDI32", .import = "PolyBezierTo", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x0f\x11\x83\x71\x09" } },
    .{ "PolylineTo", MethodRecord{ .library = "GDI32", .import = "PolylineTo", .signature = "\x00\x03\x11\x59\x11\x83\x5d\x0f\x11\x83\x71\x09" } },
    .{ "SetViewportExtEx", MethodRecord{ .library = "GDI32", .import = "SetViewportExtEx", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x08\x08\x0f\x11\x83\xe9" } },
    .{ "SetViewportOrgEx", MethodRecord{ .library = "GDI32", .import = "SetViewportOrgEx", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x08\x08\x0f\x11\x83\x71" } },
    .{ "SetWindowExtEx", MethodRecord{ .library = "GDI32", .import = "SetWindowExtEx", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x08\x08\x0f\x11\x83\xe9" } },
    .{ "SetWindowOrgEx", MethodRecord{ .library = "GDI32", .import = "SetWindowOrgEx", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x08\x08\x0f\x11\x83\x71" } },
    .{ "OffsetViewportOrgEx", MethodRecord{ .library = "GDI32", .import = "OffsetViewportOrgEx", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x08\x08\x0f\x11\x83\x71" } },
    .{ "OffsetWindowOrgEx", MethodRecord{ .library = "GDI32", .import = "OffsetWindowOrgEx", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x08\x08\x0f\x11\x83\x71" } },
    .{ "ScaleViewportExtEx", MethodRecord{ .library = "GDI32", .import = "ScaleViewportExtEx", .signature = "\x00\x06\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x0f\x11\x83\xe9" } },
    .{ "ScaleWindowExtEx", MethodRecord{ .library = "GDI32", .import = "ScaleWindowExtEx", .signature = "\x00\x06\x11\x59\x11\x83\x5d\x08\x08\x08\x08\x0f\x11\x83\xe9" } },
    .{ "SetBitmapDimensionEx", MethodRecord{ .library = "GDI32", .import = "SetBitmapDimensionEx", .signature = "\x00\x04\x11\x59\x11\x83\x51\x08\x08\x0f\x11\x83\xe9" } },
    .{ "SetBrushOrgEx", MethodRecord{ .library = "GDI32", .import = "SetBrushOrgEx", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x08\x08\x0f\x11\x83\x71" } },
    .{ "GetTextFaceA", MethodRecord{ .library = "GDI32", .import = "GetTextFaceA", .signature = "\x00\x03\x08\x11\x83\x5d\x08\x11\x3d" } },
    .{ "GetTextFaceW", MethodRecord{ .library = "GDI32", .import = "GetTextFaceW", .signature = "\x00\x03\x08\x11\x83\x5d\x08\x11\x05" } },
    .{ "GetKerningPairsA", MethodRecord{ .library = "GDI32", .import = "GetKerningPairsA", .signature = "\x00\x03\x09\x11\x83\x5d\x09\x0f\x11\x8e\x69" } },
    .{ "GetKerningPairsW", MethodRecord{ .library = "GDI32", .import = "GetKerningPairsW", .signature = "\x00\x03\x09\x11\x83\x5d\x09\x0f\x11\x8e\x69" } },
    .{ "GetDCOrgEx", MethodRecord{ .library = "GDI32", .import = "GetDCOrgEx", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x83\x71" } },
    .{ "FixBrushOrgEx", MethodRecord{ .library = "GDI32", .import = "FixBrushOrgEx", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x08\x08\x0f\x11\x83\x71" } },
    .{ "UnrealizeObject", MethodRecord{ .library = "GDI32", .import = "UnrealizeObject", .signature = "\x00\x01\x11\x59\x11\x8d\x61" } },
    .{ "GdiFlush", MethodRecord{ .library = "GDI32", .import = "GdiFlush", .signature = "\x00\x00\x11\x59" } },
    .{ "GdiSetBatchLimit", MethodRecord{ .library = "GDI32", .import = "GdiSetBatchLimit", .signature = "\x00\x01\x09\x09" } },
    .{ "GdiGetBatchLimit", MethodRecord{ .library = "GDI32", .import = "GdiGetBatchLimit", .signature = "\x00\x00\x09" } },
    .{ "wglSwapMultipleBuffers", MethodRecord{ .library = "OPENGL32", .import = "wglSwapMultipleBuffers", .signature = "\x00\x02\x09\x09\x0f\x11\x8e\x6d" } },
    .{ "CreateFontPackage", MethodRecord{ .library = "FONTSUB", .import = "CreateFontPackage", .signature = "\x00\x11\x09\x0f\x05\x09\x0f\x0f\x05\x0f\x09\x0f\x09\x07\x07\x07\x07\x11\x8e\x71\x11\x8e\x75\x0f\x07\x07\x12\x8e\x79\x12\x8e\x7d\x12\x8e\x81\x0f\x01" } },
    .{ "MergeFontPackage", MethodRecord{ .library = "FONTSUB", .import = "MergeFontPackage", .signature = "\x00\x0c\x09\x0f\x05\x09\x0f\x05\x09\x0f\x0f\x05\x0f\x09\x0f\x09\x07\x12\x8e\x79\x12\x8e\x7d\x12\x8e\x81\x0f\x01" } },
    .{ "TTEmbedFont", MethodRecord{ .library = "t2embed", .import = "TTEmbedFont", .signature = "\x00\x0b\x08\x11\x83\x5d\x11\x8e\x85\x11\x8e\x89\x0f\x11\x8e\x8d\x0f\x09\x12\x8e\x91\x0f\x01\x0f\x07\x07\x07\x0f\x11\x8e\x95" } },
    .{ "TTEmbedFontFromFileA", MethodRecord{ .library = "t2embed", .import = "TTEmbedFontFromFileA", .signature = "\x00\x0d\x08\x11\x83\x5d\x11\x3d\x07\x11\x8e\x85\x11\x8e\x89\x0f\x11\x8e\x8d\x0f\x09\x12\x8e\x91\x0f\x01\x0f\x07\x07\x07\x0f\x11\x8e\x95" } },
    .{ "TTLoadEmbeddedFont", MethodRecord{ .library = "t2embed", .import = "TTLoadEmbeddedFont", .signature = "\x00\x0a\x08\x0f\x11\x80\x85\x09\x0f\x11\x8e\x8d\x11\x8e\x99\x0f\x11\x8e\x9d\x12\x8e\xa1\x0f\x01\x11\x05\x11\x3d\x0f\x11\x8e\xa5" } },
    .{ "TTGetEmbeddedFontInfo", MethodRecord{ .library = "t2embed", .import = "TTGetEmbeddedFontInfo", .signature = "\x00\x07\x08\x11\x8e\x85\x0f\x09\x11\x8e\x99\x0f\x09\x12\x8e\xa1\x0f\x01\x0f\x11\x8e\xa5" } },
    .{ "TTDeleteEmbeddedFont", MethodRecord{ .library = "t2embed", .import = "TTDeleteEmbeddedFont", .signature = "\x00\x03\x08\x11\x80\x85\x09\x0f\x09" } },
    .{ "TTGetEmbeddingType", MethodRecord{ .library = "t2embed", .import = "TTGetEmbeddingType", .signature = "\x00\x02\x08\x11\x83\x5d\x0f\x11\x8e\x8d" } },
    .{ "TTCharToUnicode", MethodRecord{ .library = "t2embed", .import = "TTCharToUnicode", .signature = "\x00\x06\x08\x11\x83\x5d\x0f\x05\x09\x0f\x07\x09\x09" } },
    .{ "TTRunValidationTests", MethodRecord{ .library = "t2embed", .import = "TTRunValidationTests", .signature = "\x00\x02\x08\x11\x83\x5d\x0f\x11\x8e\xa9" } },
    .{ "TTIsEmbeddingEnabled", MethodRecord{ .library = "t2embed", .import = "TTIsEmbeddingEnabled", .signature = "\x00\x02\x08\x11\x83\x5d\x0f\x11\x59" } },
    .{ "TTIsEmbeddingEnabledForFacename", MethodRecord{ .library = "t2embed", .import = "TTIsEmbeddingEnabledForFacename", .signature = "\x00\x02\x08\x11\x3d\x0f\x11\x59" } },
    .{ "TTEnableEmbeddingForFacename", MethodRecord{ .library = "t2embed", .import = "TTEnableEmbeddingForFacename", .signature = "\x00\x02\x08\x11\x3d\x11\x59" } },
    .{ "TTEmbedFontEx", MethodRecord{ .library = "t2embed", .import = "TTEmbedFontEx", .signature = "\x00\x0b\x08\x11\x83\x5d\x11\x8e\x85\x11\x8e\x89\x0f\x11\x8e\x8d\x0f\x09\x12\x8e\x91\x0f\x01\x0f\x09\x07\x07\x0f\x11\x8e\x95" } },
    .{ "TTRunValidationTestsEx", MethodRecord{ .library = "t2embed", .import = "TTRunValidationTestsEx", .signature = "\x00\x02\x08\x11\x83\x5d\x0f\x11\x8e\xad" } },
    .{ "TTGetNewFontName", MethodRecord{ .library = "t2embed", .import = "TTGetNewFontName", .signature = "\x00\x05\x08\x0f\x11\x80\x85\x11\x05\x08\x11\x3d\x08" } },
    .{ "DrawEdge", MethodRecord{ .library = "USER32", .import = "DrawEdge", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x0f\x11\x83\x89\x11\x83\xf5\x11\x83\xf9" } },
    .{ "DrawFrameControl", MethodRecord{ .library = "USER32", .import = "DrawFrameControl", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x0f\x11\x83\x89\x09\x09" } },
    .{ "DrawCaption", MethodRecord{ .library = "USER32", .import = "DrawCaption", .signature = "\x00\x04\x11\x59\x11\x25\x11\x83\x5d\x0f\x11\x83\x89\x11\x8e\xb1" } },
    .{ "DrawAnimatedRects", MethodRecord{ .library = "USER32", .import = "DrawAnimatedRects", .signature = "\x00\x04\x11\x59\x11\x25\x08\x0f\x11\x83\x89\x0f\x11\x83\x89" } },
    .{ "DrawTextA", MethodRecord{ .library = "USER32", .import = "DrawTextA", .signature = "\x00\x05\x08\x11\x83\x5d\x11\x3d\x08\x0f\x11\x83\x89\x11\x83\xdd" } },
    .{ "DrawTextW", MethodRecord{ .library = "USER32", .import = "DrawTextW", .signature = "\x00\x05\x08\x11\x83\x5d\x11\x05\x08\x0f\x11\x83\x89\x11\x83\xdd" } },
    .{ "DrawTextExA", MethodRecord{ .library = "USER32", .import = "DrawTextExA", .signature = "\x00\x06\x08\x11\x83\x5d\x11\x3d\x08\x0f\x11\x83\x89\x11\x83\xdd\x0f\x11\x8e\xb5" } },
    .{ "DrawTextExW", MethodRecord{ .library = "USER32", .import = "DrawTextExW", .signature = "\x00\x06\x08\x11\x83\x5d\x11\x05\x08\x0f\x11\x83\x89\x11\x83\xdd\x0f\x11\x8e\xb5" } },
    .{ "GrayStringA", MethodRecord{ .library = "USER32", .import = "GrayStringA", .signature = "\x00\x09\x11\x59\x11\x83\x5d\x11\x84\x0d\x12\x8e\xb9\x11\x82\x2d\x08\x08\x08\x08\x08" } },
    .{ "GrayStringW", MethodRecord{ .library = "USER32", .import = "GrayStringW", .signature = "\x00\x09\x11\x59\x11\x83\x5d\x11\x84\x0d\x12\x8e\xb9\x11\x82\x2d\x08\x08\x08\x08\x08" } },
    .{ "DrawStateA", MethodRecord{ .library = "USER32", .import = "DrawStateA", .signature = "\x00\x0a\x11\x59\x11\x83\x5d\x11\x84\x0d\x12\x8e\xbd\x11\x82\x2d\x11\x83\x8d\x08\x08\x08\x08\x11\x8e\xc1" } },
    .{ "DrawStateW", MethodRecord{ .library = "USER32", .import = "DrawStateW", .signature = "\x00\x0a\x11\x59\x11\x83\x5d\x11\x84\x0d\x12\x8e\xbd\x11\x82\x2d\x11\x83\x8d\x08\x08\x08\x08\x11\x8e\xc1" } },
    .{ "TabbedTextOutA", MethodRecord{ .library = "USER32", .import = "TabbedTextOutA", .signature = "\x00\x08\x08\x11\x83\x5d\x08\x08\x11\x3d\x08\x08\x0f\x08\x08" } },
    .{ "TabbedTextOutW", MethodRecord{ .library = "USER32", .import = "TabbedTextOutW", .signature = "\x00\x08\x08\x11\x83\x5d\x08\x08\x11\x05\x08\x08\x0f\x08\x08" } },
    .{ "GetTabbedTextExtentA", MethodRecord{ .library = "USER32", .import = "GetTabbedTextExtentA", .signature = "\x00\x05\x09\x11\x83\x5d\x11\x3d\x08\x08\x0f\x08" } },
    .{ "GetTabbedTextExtentW", MethodRecord{ .library = "USER32", .import = "GetTabbedTextExtentW", .signature = "\x00\x05\x09\x11\x83\x5d\x11\x05\x08\x08\x0f\x08" } },
    .{ "UpdateWindow", MethodRecord{ .library = "USER32", .import = "UpdateWindow", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "PaintDesktop", MethodRecord{ .library = "USER32", .import = "PaintDesktop", .signature = "\x00\x01\x11\x59\x11\x83\x5d" } },
    .{ "WindowFromDC", MethodRecord{ .library = "USER32", .import = "WindowFromDC", .signature = "\x00\x01\x11\x25\x11\x83\x5d" } },
    .{ "GetDC", MethodRecord{ .library = "USER32", .import = "GetDC", .signature = "\x00\x01\x11\x83\x5d\x11\x25" } },
    .{ "GetDCEx", MethodRecord{ .library = "USER32", .import = "GetDCEx", .signature = "\x00\x03\x11\x83\x5d\x11\x25\x11\x83\xe1\x11\x8e\xc5" } },
    .{ "GetWindowDC", MethodRecord{ .library = "USER32", .import = "GetWindowDC", .signature = "\x00\x01\x11\x83\x5d\x11\x25" } },
    .{ "ReleaseDC", MethodRecord{ .library = "USER32", .import = "ReleaseDC", .signature = "\x00\x02\x08\x11\x25\x11\x83\x5d" } },
    .{ "BeginPaint", MethodRecord{ .library = "USER32", .import = "BeginPaint", .signature = "\x00\x02\x11\x83\x5d\x11\x25\x0f\x11\x8e\xc9" } },
    .{ "EndPaint", MethodRecord{ .library = "USER32", .import = "EndPaint", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x8e\xc9" } },
    .{ "GetUpdateRect", MethodRecord{ .library = "USER32", .import = "GetUpdateRect", .signature = "\x00\x03\x11\x59\x11\x25\x0f\x11\x83\x89\x11\x59" } },
    .{ "GetUpdateRgn", MethodRecord{ .library = "USER32", .import = "GetUpdateRgn", .signature = "\x00\x03\x11\x8d\x75\x11\x25\x11\x83\xe1\x11\x59" } },
    .{ "SetWindowRgn", MethodRecord{ .library = "USER32", .import = "SetWindowRgn", .signature = "\x00\x03\x08\x11\x25\x11\x83\xe1\x11\x59" } },
    .{ "GetWindowRgn", MethodRecord{ .library = "USER32", .import = "GetWindowRgn", .signature = "\x00\x02\x11\x8d\x75\x11\x25\x11\x83\xe1" } },
    .{ "GetWindowRgnBox", MethodRecord{ .library = "USER32", .import = "GetWindowRgnBox", .signature = "\x00\x02\x11\x8d\x75\x11\x25\x0f\x11\x83\x89" } },
    .{ "ExcludeUpdateRgn", MethodRecord{ .library = "USER32", .import = "ExcludeUpdateRgn", .signature = "\x00\x02\x08\x11\x83\x5d\x11\x25" } },
    .{ "InvalidateRect", MethodRecord{ .library = "USER32", .import = "InvalidateRect", .signature = "\x00\x03\x11\x59\x11\x25\x0f\x11\x83\x89\x11\x59" } },
    .{ "ValidateRect", MethodRecord{ .library = "USER32", .import = "ValidateRect", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x83\x89" } },
    .{ "InvalidateRgn", MethodRecord{ .library = "USER32", .import = "InvalidateRgn", .signature = "\x00\x03\x11\x59\x11\x25\x11\x83\xe1\x11\x59" } },
    .{ "ValidateRgn", MethodRecord{ .library = "USER32", .import = "ValidateRgn", .signature = "\x00\x02\x11\x59\x11\x25\x11\x83\xe1" } },
    .{ "RedrawWindow", MethodRecord{ .library = "USER32", .import = "RedrawWindow", .signature = "\x00\x04\x11\x59\x11\x25\x0f\x11\x83\x89\x11\x83\xe1\x11\x8e\xcd" } },
    .{ "LockWindowUpdate", MethodRecord{ .library = "USER32", .import = "LockWindowUpdate", .signature = "\x00\x01\x11\x59\x11\x25" } },
    .{ "ClientToScreen", MethodRecord{ .library = "USER32", .import = "ClientToScreen", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x83\x71" } },
    .{ "ScreenToClient", MethodRecord{ .library = "USER32", .import = "ScreenToClient", .signature = "\x00\x02\x11\x59\x11\x25\x0f\x11\x83\x71" } },
    .{ "MapWindowPoints", MethodRecord{ .library = "USER32", .import = "MapWindowPoints", .signature = "\x00\x04\x08\x11\x25\x11\x25\x0f\x11\x83\x71\x09" } },
    .{ "GetSysColor", MethodRecord{ .library = "USER32", .import = "GetSysColor", .signature = "\x00\x01\x09\x11\x8e\xd1" } },
    .{ "GetSysColorBrush", MethodRecord{ .library = "USER32", .import = "GetSysColorBrush", .signature = "\x00\x01\x11\x84\x0d\x11\x8e\xd1" } },
    .{ "SetSysColors", MethodRecord{ .library = "USER32", .import = "SetSysColors", .signature = "\x00\x03\x11\x59\x08\x0f\x08\x0f\x11\x83\x59" } },
    .{ "DrawFocusRect", MethodRecord{ .library = "USER32", .import = "DrawFocusRect", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x83\x89" } },
    .{ "FillRect", MethodRecord{ .library = "USER32", .import = "FillRect", .signature = "\x00\x03\x08\x11\x83\x5d\x0f\x11\x83\x89\x11\x84\x0d" } },
    .{ "FrameRect", MethodRecord{ .library = "USER32", .import = "FrameRect", .signature = "\x00\x03\x08\x11\x83\x5d\x0f\x11\x83\x89\x11\x84\x0d" } },
    .{ "InvertRect", MethodRecord{ .library = "USER32", .import = "InvertRect", .signature = "\x00\x02\x11\x59\x11\x83\x5d\x0f\x11\x83\x89" } },
    .{ "SetRect", MethodRecord{ .library = "USER32", .import = "SetRect", .signature = "\x00\x05\x11\x59\x0f\x11\x83\x89\x08\x08\x08\x08" } },
    .{ "SetRectEmpty", MethodRecord{ .library = "USER32", .import = "SetRectEmpty", .signature = "\x00\x01\x11\x59\x0f\x11\x83\x89" } },
    .{ "CopyRect", MethodRecord{ .library = "USER32", .import = "CopyRect", .signature = "\x00\x02\x11\x59\x0f\x11\x83\x89\x0f\x11\x83\x89" } },
    .{ "InflateRect", MethodRecord{ .library = "USER32", .import = "InflateRect", .signature = "\x00\x03\x11\x59\x0f\x11\x83\x89\x08\x08" } },
    .{ "IntersectRect", MethodRecord{ .library = "USER32", .import = "IntersectRect", .signature = "\x00\x03\x11\x59\x0f\x11\x83\x89\x0f\x11\x83\x89\x0f\x11\x83\x89" } },
    .{ "UnionRect", MethodRecord{ .library = "USER32", .import = "UnionRect", .signature = "\x00\x03\x11\x59\x0f\x11\x83\x89\x0f\x11\x83\x89\x0f\x11\x83\x89" } },
    .{ "SubtractRect", MethodRecord{ .library = "USER32", .import = "SubtractRect", .signature = "\x00\x03\x11\x59\x0f\x11\x83\x89\x0f\x11\x83\x89\x0f\x11\x83\x89" } },
    .{ "OffsetRect", MethodRecord{ .library = "USER32", .import = "OffsetRect", .signature = "\x00\x03\x11\x59\x0f\x11\x83\x89\x08\x08" } },
    .{ "IsRectEmpty", MethodRecord{ .library = "USER32", .import = "IsRectEmpty", .signature = "\x00\x01\x11\x59\x0f\x11\x83\x89" } },
    .{ "EqualRect", MethodRecord{ .library = "USER32", .import = "EqualRect", .signature = "\x00\x02\x11\x59\x0f\x11\x83\x89\x0f\x11\x83\x89" } },
    .{ "PtInRect", MethodRecord{ .library = "USER32", .import = "PtInRect", .signature = "\x00\x02\x11\x59\x0f\x11\x83\x89\x11\x83\x71" } },
    .{ "LoadBitmapA", MethodRecord{ .library = "USER32", .import = "LoadBitmapA", .signature = "\x00\x02\x11\x83\x51\x11\x82\x29\x11\x3d" } },
    .{ "LoadBitmapW", MethodRecord{ .library = "USER32", .import = "LoadBitmapW", .signature = "\x00\x02\x11\x83\x51\x11\x82\x29\x11\x05" } },
    .{ "ChangeDisplaySettingsA", MethodRecord{ .library = "USER32", .import = "ChangeDisplaySettingsA", .signature = "\x00\x02\x11\x8e\xd5\x0f\x11\x8d\x81\x11\x8e\xd9" } },
    .{ "ChangeDisplaySettingsW", MethodRecord{ .library = "USER32", .import = "ChangeDisplaySettingsW", .signature = "\x00\x02\x11\x8e\xd5\x0f\x11\x8d\x85\x11\x8e\xd9" } },
    .{ "ChangeDisplaySettingsExA", MethodRecord{ .library = "USER32", .import = "ChangeDisplaySettingsExA", .signature = "\x00\x05\x11\x8e\xd5\x11\x3d\x0f\x11\x8d\x81\x11\x25\x11\x8e\xd9\x0f\x01" } },
    .{ "ChangeDisplaySettingsExW", MethodRecord{ .library = "USER32", .import = "ChangeDisplaySettingsExW", .signature = "\x00\x05\x11\x8e\xd5\x11\x05\x0f\x11\x8d\x85\x11\x25\x11\x8e\xd9\x0f\x01" } },
    .{ "EnumDisplaySettingsA", MethodRecord{ .library = "USER32", .import = "EnumDisplaySettingsA", .signature = "\x00\x03\x11\x59\x11\x3d\x11\x8e\xdd\x0f\x11\x8d\x81" } },
    .{ "EnumDisplaySettingsW", MethodRecord{ .library = "USER32", .import = "EnumDisplaySettingsW", .signature = "\x00\x03\x11\x59\x11\x05\x11\x8e\xdd\x0f\x11\x8d\x85" } },
    .{ "EnumDisplaySettingsExA", MethodRecord{ .library = "USER32", .import = "EnumDisplaySettingsExA", .signature = "\x00\x04\x11\x59\x11\x3d\x11\x8e\xdd\x0f\x11\x8d\x81\x11\x8e\xe1" } },
    .{ "EnumDisplaySettingsExW", MethodRecord{ .library = "USER32", .import = "EnumDisplaySettingsExW", .signature = "\x00\x04\x11\x59\x11\x05\x11\x8e\xdd\x0f\x11\x8d\x85\x11\x8e\xe1" } },
    .{ "EnumDisplayDevicesA", MethodRecord{ .library = "USER32", .import = "EnumDisplayDevicesA", .signature = "\x00\x04\x11\x59\x11\x3d\x09\x0f\x11\x8e\xe5\x09" } },
    .{ "EnumDisplayDevicesW", MethodRecord{ .library = "USER32", .import = "EnumDisplayDevicesW", .signature = "\x00\x04\x11\x59\x11\x05\x09\x0f\x11\x8e\xe9\x09" } },
    .{ "MonitorFromPoint", MethodRecord{ .library = "USER32", .import = "MonitorFromPoint", .signature = "\x00\x02\x11\x8e\xed\x11\x83\x71\x11\x8e\xf1" } },
    .{ "MonitorFromRect", MethodRecord{ .library = "USER32", .import = "MonitorFromRect", .signature = "\x00\x02\x11\x8e\xed\x0f\x11\x83\x89\x11\x8e\xf1" } },
    .{ "MonitorFromWindow", MethodRecord{ .library = "USER32", .import = "MonitorFromWindow", .signature = "\x00\x02\x11\x8e\xed\x11\x25\x11\x8e\xf1" } },
    .{ "GetMonitorInfoA", MethodRecord{ .library = "USER32", .import = "GetMonitorInfoA", .signature = "\x00\x02\x11\x59\x11\x8e\xed\x0f\x11\x8d\x59" } },
    .{ "GetMonitorInfoW", MethodRecord{ .library = "USER32", .import = "GetMonitorInfoW", .signature = "\x00\x02\x11\x59\x11\x8e\xed\x0f\x11\x8d\x59" } },
    .{ "EnumDisplayMonitors", MethodRecord{ .library = "USER32", .import = "EnumDisplayMonitors", .signature = "\x00\x04\x11\x59\x11\x83\x5d\x0f\x11\x83\x89\x12\x8e\xf5\x11\x82\x2d" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x3d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PSTR" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x22d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "LPARAM" },
        0x351 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HBITMAP" },
        0x359 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "COLORREF" },
        0x35d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HDC" },
        0x371 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "POINT" },
        0x389 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "RECT" },
        0x38d => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "WPARAM" },
        0x3dd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DRAW_TEXT_FORMAT" },
        0x3e1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HRGN" },
        0x3e9 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "SIZE" },
        0x3ed => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "TEXTMETRICW" },
        0x3f5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DRAWEDGE_FLAGS" },
        0x3f9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DRAW_EDGE_FLAGS" },
        0x3fd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "LOGFONTW" },
        0x40d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HBRUSH" },
        0x42d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "RGBQUAD" },
        0xd39 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HGLOBAL" },
        0xd45 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "R2_MODE" },
        0xd49 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "RGN_COMBINE_MODE" },
        0xd4d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "ETO_OPTIONS" },
        0xd51 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "OBJ_TYPE" },
        0xd55 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DIB_USAGE" },
        0xd59 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "MONITORINFO" },
        0xd61 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HGDIOBJ" },
        0xd65 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HPALETTE" },
        0xd69 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "PALETTEENTRY" },
        0xd6d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "ROP_CODE" },
        0xd71 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HMETAFILE" },
        0xd75 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "GDI_REGION_TYPE" },
        0xd79 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "BITMAP" },
        0xd7d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "LOGBRUSH" },
        0xd81 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DEVMODEA" },
        0xd85 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DEVMODEW" },
        0xd89 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "BITMAPINFOHEADER" },
        0xd8d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "BITMAPINFO" },
        0xd91 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HFONT" },
        0xd95 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "LOGFONTA" },
        0xd99 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HATCH_BRUSH_STYLE" },
        0xd9d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "LOGPALETTE" },
        0xda1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HPEN" },
        0xda5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "PEN_STYLE" },
        0xda9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "LOGPEN" },
        0xdad => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "CREATE_POLYGON_RGN_MODE" },
        0xdb1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "FONTENUMPROCA" },
        0xdb5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "FONTENUMPROCW" },
        0xdb9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "GOBJENUMPROC" },
        0xdbd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "XFORM" },
        0xdc1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "RGNDATA" },
        0xdc5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "EXT_FLOOD_FILL_TYPE" },
        0xdc9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "ABC" },
        0xdcd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "ABCFLOAT" },
        0xdd1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "GET_GLYPH_OUTLINE_FORMAT" },
        0xdd5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "GLYPHMETRICS" },
        0xdd9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "MAT2" },
        0xddd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HDC_MAP_MODE" },
        0xde1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "OUTLINETEXTMETRICA" },
        0xde5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "OUTLINETEXTMETRICW" },
        0xde9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "RASTERIZER_STATUS" },
        0xded => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "GET_STOCK_OBJECT_FLAGS" },
        0xdf1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "TEXT_ALIGN_OPTIONS" },
        0xdf5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "GCP_RESULTSA" },
        0xdf9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "GET_CHARACTER_PLACEMENT_FLAGS" },
        0xdfd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "GCP_RESULTSW" },
        0xe01 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "GLYPHSET" },
        0xe05 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "FONT_RESOURCE_CHARACTERISTICS" },
        0xe09 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "ENUMLOGFONTEXDVA" },
        0xe0d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "ENUMLOGFONTEXDVW" },
        0xe11 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "LINEDDAPROC" },
        0xe15 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "SET_BOUNDS_RECT_FLAGS" },
        0xe19 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "GRAPHICS_MODE" },
        0xe1d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DC_LAYOUT" },
        0xe21 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "STRETCH_BLT_MODE" },
        0xe25 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "SYSTEM_PALETTE_USE" },
        0xe29 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "BLENDFUNCTION" },
        0xe2d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "TRIVERTEX" },
        0xe31 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "GRADIENT_FILL" },
        0xe35 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HANDLETABLE" },
        0xe39 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "METARECORD" },
        0xe3d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "MFENUMPROC" },
        0xe41 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HENHMETAFILE" },
        0xe45 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "ENHMFENUMPROC" },
        0xe49 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "ENHMETAHEADER" },
        0xe4d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "ENHMETARECORD" },
        0xe51 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "TEXTMETRICA" },
        0xe55 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "MODIFY_WORLD_TRANSFORM_MODE" },
        0xe59 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "COLORADJUSTMENT" },
        0xe5d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "ARC_DIRECTION" },
        0xe61 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "POLYTEXTA" },
        0xe65 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "POLYTEXTW" },
        0xe69 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "KERNINGPAIR" },
        0xe6d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "WGLSWAP" },
        0xe71 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "CREATE_FONT_PACKAGE_SUBSET_PLATFORM" },
        0xe75 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "CREATE_FONT_PACKAGE_SUBSET_ENCODING" },
        0xe79 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "CFP_ALLOCPROC" },
        0xe7d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "CFP_REALLOCPROC" },
        0xe81 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "CFP_FREEPROC" },
        0xe85 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "TTEMBED_FLAGS" },
        0xe89 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "EMBED_FONT_CHARSET" },
        0xe8d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "EMBEDDED_FONT_PRIV_STATUS" },
        0xe91 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "WRITEEMBEDPROC" },
        0xe95 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "TTEMBEDINFO" },
        0xe99 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "FONT_LICENSE_PRIVS" },
        0xe9d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "TTLOAD_EMBEDDED_FONT_STATUS" },
        0xea1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "READEMBEDPROC" },
        0xea5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "TTLOADINFO" },
        0xea9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "TTVALIDATIONTESTSPARAMS" },
        0xead => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "TTVALIDATIONTESTSPARAMSEX" },
        0xeb1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DRAW_CAPTION_FLAGS" },
        0xeb5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DRAWTEXTPARAMS" },
        0xeb9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "GRAYSTRINGPROC" },
        0xebd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DRAWSTATEPROC" },
        0xec1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DRAWSTATE_FLAGS" },
        0xec5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "GET_DCX_FLAGS" },
        0xec9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "PAINTSTRUCT" },
        0xecd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "REDRAW_WINDOW_FLAGS" },
        0xed1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "SYS_COLOR_INDEX" },
        0xed5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DISP_CHANGE" },
        0xed9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "CDS_TYPE" },
        0xedd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "ENUM_DISPLAY_SETTINGS_MODE" },
        0xee1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "ENUM_DISPLAY_SETTINGS_FLAGS" },
        0xee5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DISPLAY_DEVICEA" },
        0xee9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "DISPLAY_DEVICEW" },
        0xeed => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HMONITOR" },
        0xef1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "MONITOR_FROM_FLAGS" },
        0xef5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "MONITORENUMPROC" },
        else => null,
    };
}

pub const R2_BLACK = 1;
pub const R2_NOTMERGEPEN = 2;
pub const R2_MASKNOTPEN = 3;
pub const R2_NOTCOPYPEN = 4;
pub const R2_MASKPENNOT = 5;
pub const R2_NOT = 6;
pub const R2_XORPEN = 7;
pub const R2_NOTMASKPEN = 8;
pub const R2_MASKPEN = 9;
pub const R2_NOTXORPEN = 10;
pub const R2_NOP = 11;
pub const R2_MERGENOTPEN = 12;
pub const R2_COPYPEN = 13;
pub const R2_MERGEPENNOT = 14;
pub const R2_MERGEPEN = 15;
pub const R2_WHITE = 16;
pub const R2_LAST = 16;
pub const RGN_AND = 1;
pub const RGN_OR = 2;
pub const RGN_XOR = 3;
pub const RGN_DIFF = 4;
pub const RGN_COPY = 5;
pub const RGN_MIN = 1;
pub const RGN_MAX = 5;
pub const ETO_OPAQUE = 2;
pub const ETO_CLIPPED = 4;
pub const ETO_GLYPH_INDEX = 16;
pub const ETO_RTLREADING = 128;
pub const ETO_NUMERICSLOCAL = 1024;
pub const ETO_NUMERICSLATIN = 2048;
pub const ETO_IGNORELANGUAGE = 4096;
pub const ETO_PDY = 8192;
pub const ETO_REVERSE_INDEX_MAP = 65536;
pub const OBJ_PEN = 1;
pub const OBJ_BRUSH = 2;
pub const OBJ_DC = 3;
pub const OBJ_METADC = 4;
pub const OBJ_PAL = 5;
pub const OBJ_FONT = 6;
pub const OBJ_BITMAP = 7;
pub const OBJ_REGION = 8;
pub const OBJ_METAFILE = 9;
pub const OBJ_MEMDC = 10;
pub const OBJ_EXTPEN = 11;
pub const OBJ_ENHMETADC = 12;
pub const OBJ_ENHMETAFILE = 13;
pub const OBJ_COLORSPACE = 14;
pub const DIB_RGB_COLORS = 0;
pub const DIB_PAL_COLORS = 1;
pub const GDI_ERROR = -1;
pub const ERROR = 0;
pub const MAXSTRETCHBLTMODE = 4;
pub const POLYFILL_LAST = 2;
pub const LAYOUT_BTT = 2;
pub const LAYOUT_VBH = 4;
pub const ASPECT_FILTERING = 1;
pub const META_SETBKCOLOR = 513;
pub const META_SETBKMODE = 258;
pub const META_SETMAPMODE = 259;
pub const META_SETROP2 = 260;
pub const META_SETRELABS = 261;
pub const META_SETPOLYFILLMODE = 262;
pub const META_SETSTRETCHBLTMODE = 263;
pub const META_SETTEXTCHAREXTRA = 264;
pub const META_SETTEXTCOLOR = 521;
pub const META_SETTEXTJUSTIFICATION = 522;
pub const META_SETWINDOWORG = 523;
pub const META_SETWINDOWEXT = 524;
pub const META_SETVIEWPORTORG = 525;
pub const META_SETVIEWPORTEXT = 526;
pub const META_OFFSETWINDOWORG = 527;
pub const META_SCALEWINDOWEXT = 1040;
pub const META_OFFSETVIEWPORTORG = 529;
pub const META_SCALEVIEWPORTEXT = 1042;
pub const META_LINETO = 531;
pub const META_MOVETO = 532;
pub const META_EXCLUDECLIPRECT = 1045;
pub const META_INTERSECTCLIPRECT = 1046;
pub const META_ARC = 2071;
pub const META_ELLIPSE = 1048;
pub const META_FLOODFILL = 1049;
pub const META_PIE = 2074;
pub const META_RECTANGLE = 1051;
pub const META_ROUNDRECT = 1564;
pub const META_PATBLT = 1565;
pub const META_SAVEDC = 30;
pub const META_SETPIXEL = 1055;
pub const META_OFFSETCLIPRGN = 544;
pub const META_TEXTOUT = 1313;
pub const META_BITBLT = 2338;
pub const META_STRETCHBLT = 2851;
pub const META_POLYGON = 804;
pub const META_POLYLINE = 805;
pub const META_ESCAPE = 1574;
pub const META_RESTOREDC = 295;
pub const META_FILLREGION = 552;
pub const META_FRAMEREGION = 1065;
pub const META_INVERTREGION = 298;
pub const META_PAINTREGION = 299;
pub const META_SELECTCLIPREGION = 300;
pub const META_SELECTOBJECT = 301;
pub const META_SETTEXTALIGN = 302;
pub const META_CHORD = 2096;
pub const META_SETMAPPERFLAGS = 561;
pub const META_EXTTEXTOUT = 2610;
pub const META_SETDIBTODEV = 3379;
pub const META_SELECTPALETTE = 564;
pub const META_REALIZEPALETTE = 53;
pub const META_ANIMATEPALETTE = 1078;
pub const META_SETPALENTRIES = 55;
pub const META_POLYPOLYGON = 1336;
pub const META_RESIZEPALETTE = 313;
pub const META_DIBBITBLT = 2368;
pub const META_DIBSTRETCHBLT = 2881;
pub const META_DIBCREATEPATTERNBRUSH = 322;
pub const META_STRETCHDIB = 3907;
pub const META_EXTFLOODFILL = 1352;
pub const META_SETLAYOUT = 329;
pub const META_DELETEOBJECT = 496;
pub const META_CREATEPALETTE = 247;
pub const META_CREATEPATTERNBRUSH = 505;
pub const META_CREATEPENINDIRECT = 762;
pub const META_CREATEFONTINDIRECT = 763;
pub const META_CREATEBRUSHINDIRECT = 764;
pub const META_CREATEREGION = 1791;
pub const NEWFRAME = 1;
pub const ABORTDOC = 2;
pub const NEXTBAND = 3;
pub const SETCOLORTABLE = 4;
pub const GETCOLORTABLE = 5;
pub const FLUSHOUTPUT = 6;
pub const DRAFTMODE = 7;
pub const QUERYESCSUPPORT = 8;
pub const SETABORTPROC = 9;
pub const STARTDOC = 10;
pub const ENDDOC = 11;
pub const GETPHYSPAGESIZE = 12;
pub const GETPRINTINGOFFSET = 13;
pub const GETSCALINGFACTOR = 14;
pub const MFCOMMENT = 15;
pub const GETPENWIDTH = 16;
pub const SETCOPYCOUNT = 17;
pub const SELECTPAPERSOURCE = 18;
pub const DEVICEDATA = 19;
pub const PASSTHROUGH = 19;
pub const GETTECHNOLGY = 20;
pub const GETTECHNOLOGY = 20;
pub const SETLINECAP = 21;
pub const SETLINEJOIN = 22;
pub const SETMITERLIMIT = 23;
pub const BANDINFO = 24;
pub const DRAWPATTERNRECT = 25;
pub const GETVECTORPENSIZE = 26;
pub const GETVECTORBRUSHSIZE = 27;
pub const ENABLEDUPLEX = 28;
pub const GETSETPAPERBINS = 29;
pub const GETSETPRINTORIENT = 30;
pub const ENUMPAPERBINS = 31;
pub const SETDIBSCALING = 32;
pub const EPSPRINTING = 33;
pub const ENUMPAPERMETRICS = 34;
pub const GETSETPAPERMETRICS = 35;
pub const POSTSCRIPT_DATA = 37;
pub const POSTSCRIPT_IGNORE = 38;
pub const MOUSETRAILS = 39;
pub const GETDEVICEUNITS = 42;
pub const GETEXTENDEDTEXTMETRICS = 256;
pub const GETEXTENTTABLE = 257;
pub const GETPAIRKERNTABLE = 258;
pub const GETTRACKKERNTABLE = 259;
pub const EXTTEXTOUT = 512;
pub const GETFACENAME = 513;
pub const DOWNLOADFACE = 514;
pub const ENABLERELATIVEWIDTHS = 768;
pub const ENABLEPAIRKERNING = 769;
pub const SETKERNTRACK = 770;
pub const SETALLJUSTVALUES = 771;
pub const SETCHARSET = 772;
pub const STRETCHBLT = 2048;
pub const METAFILE_DRIVER = 2049;
pub const GETSETSCREENPARAMS = 3072;
pub const QUERYDIBSUPPORT = 3073;
pub const BEGIN_PATH = 4096;
pub const CLIP_TO_PATH = 4097;
pub const END_PATH = 4098;
pub const EXT_DEVICE_CAPS = 4099;
pub const RESTORE_CTM = 4100;
pub const SAVE_CTM = 4101;
pub const SET_ARC_DIRECTION = 4102;
pub const SET_BACKGROUND_COLOR = 4103;
pub const SET_POLY_MODE = 4104;
pub const SET_SCREEN_ANGLE = 4105;
pub const SET_SPREAD = 4106;
pub const TRANSFORM_CTM = 4107;
pub const SET_CLIP_BOX = 4108;
pub const SET_BOUNDS = 4109;
pub const SET_MIRROR_MODE = 4110;
pub const OPENCHANNEL = 4110;
pub const DOWNLOADHEADER = 4111;
pub const CLOSECHANNEL = 4112;
pub const POSTSCRIPT_PASSTHROUGH = 4115;
pub const ENCAPSULATED_POSTSCRIPT = 4116;
pub const POSTSCRIPT_IDENTIFY = 4117;
pub const POSTSCRIPT_INJECTION = 4118;
pub const CHECKJPEGFORMAT = 4119;
pub const CHECKPNGFORMAT = 4120;
pub const GET_PS_FEATURESETTING = 4121;
pub const GDIPLUS_TS_QUERYVER = 4122;
pub const GDIPLUS_TS_RECORD = 4123;
pub const MILCORE_TS_QUERYVER_RESULT_FALSE = 0;
pub const MILCORE_TS_QUERYVER_RESULT_TRUE = 2147483647;
pub const SPCLPASSTHROUGH2 = 4568;
pub const PSIDENT_GDICENTRIC = 0;
pub const PSIDENT_PSCENTRIC = 1;
pub const PSINJECT_DLFONT = 3722304989;
pub const FEATURESETTING_NUP = 0;
pub const FEATURESETTING_OUTPUT = 1;
pub const FEATURESETTING_PSLEVEL = 2;
pub const FEATURESETTING_CUSTPAPER = 3;
pub const FEATURESETTING_MIRROR = 4;
pub const FEATURESETTING_NEGATIVE = 5;
pub const FEATURESETTING_PROTOCOL = 6;
pub const FEATURESETTING_PRIVATE_BEGIN = 4096;
pub const FEATURESETTING_PRIVATE_END = 8191;
pub const PSPROTOCOL_ASCII = 0;
pub const PSPROTOCOL_BCP = 1;
pub const PSPROTOCOL_TBCP = 2;
pub const PSPROTOCOL_BINARY = 3;
pub const QDI_SETDIBITS = 1;
pub const QDI_GETDIBITS = 2;
pub const QDI_DIBTOSCREEN = 4;
pub const QDI_STRETCHDIB = 8;
pub const SP_NOTREPORTED = 16384;
pub const SP_ERROR = -1;
pub const SP_APPABORT = -2;
pub const SP_USERABORT = -3;
pub const SP_OUTOFDISK = -4;
pub const SP_OUTOFMEMORY = -5;
pub const PR_JOBSTATUS = 0;
pub const LCS_GM_BUSINESS = 1;
pub const LCS_GM_GRAPHICS = 2;
pub const LCS_GM_IMAGES = 4;
pub const LCS_GM_ABS_COLORIMETRIC = 8;
pub const CM_OUT_OF_GAMUT = 255;
pub const CM_IN_GAMUT = 0;
pub const NTM_REGULAR = 64;
pub const NTM_BOLD = 32;
pub const NTM_ITALIC = 1;
pub const NTM_NONNEGATIVE_AC = 65536;
pub const NTM_PS_OPENTYPE = 131072;
pub const NTM_TT_OPENTYPE = 262144;
pub const NTM_MULTIPLEMASTER = 524288;
pub const NTM_TYPE1 = 1048576;
pub const NTM_DSIG = 2097152;
pub const LF_FACESIZE = 32;
pub const LF_FULLFACESIZE = 64;
pub const CLEARTYPE_NATURAL_QUALITY = 6;
pub const MONO_FONT = 8;
pub const FS_LATIN1 = 1;
pub const FS_LATIN2 = 2;
pub const FS_CYRILLIC = 4;
pub const FS_GREEK = 8;
pub const FS_TURKISH = 16;
pub const FS_HEBREW = 32;
pub const FS_ARABIC = 64;
pub const FS_BALTIC = 128;
pub const FS_VIETNAMESE = 256;
pub const FS_THAI = 65536;
pub const FS_JISJAPAN = 131072;
pub const FS_CHINESESIMP = 262144;
pub const FS_WANSUNG = 524288;
pub const FS_CHINESETRAD = 1048576;
pub const FS_JOHAB = 2097152;
pub const FS_SYMBOL = -2147483648;
pub const PANOSE_COUNT = 10;
pub const PAN_FAMILYTYPE_INDEX = 0;
pub const PAN_SERIFSTYLE_INDEX = 1;
pub const PAN_PROPORTION_INDEX = 3;
pub const PAN_STROKEVARIATION_INDEX = 5;
pub const PAN_ARMSTYLE_INDEX = 6;
pub const PAN_LETTERFORM_INDEX = 7;
pub const PAN_CULTURE_LATIN = 0;
pub const PAN_ANY = 0;
pub const PAN_NO_FIT = 1;
pub const ELF_VENDOR_SIZE = 4;
pub const ELF_VERSION = 0;
pub const ELF_CULTURE_LATIN = 0;
pub const RASTER_FONTTYPE = 1;
pub const DEVICE_FONTTYPE = 2;
pub const TRUETYPE_FONTTYPE = 4;
pub const PC_RESERVED = 1;
pub const PC_EXPLICIT = 2;
pub const PC_NOCOLLAPSE = 4;
pub const BKMODE_LAST = 2;
pub const GM_LAST = 2;
pub const PT_CLOSEFIGURE = 1;
pub const PT_LINETO = 2;
pub const PT_BEZIERTO = 4;
pub const PT_MOVETO = 6;
pub const ABSOLUTE = 1;
pub const RELATIVE = 2;
pub const STOCK_LAST = 19;
pub const CLR_INVALID = 4294967295;
pub const HS_API_MAX = 12;
pub const DT_PLOTTER = 0;
pub const DT_RASDISPLAY = 1;
pub const DT_RASPRINTER = 2;
pub const DT_RASCAMERA = 3;
pub const DT_CHARSTREAM = 4;
pub const DT_METAFILE = 5;
pub const DT_DISPFILE = 6;
pub const CC_NONE = 0;
pub const CC_CIRCLES = 1;
pub const CC_PIE = 2;
pub const CC_CHORD = 4;
pub const CC_ELLIPSES = 8;
pub const CC_WIDE = 16;
pub const CC_STYLED = 32;
pub const CC_WIDESTYLED = 64;
pub const CC_INTERIORS = 128;
pub const CC_ROUNDRECT = 256;
pub const LC_NONE = 0;
pub const LC_POLYLINE = 2;
pub const LC_MARKER = 4;
pub const LC_POLYMARKER = 8;
pub const LC_WIDE = 16;
pub const LC_STYLED = 32;
pub const LC_WIDESTYLED = 64;
pub const LC_INTERIORS = 128;
pub const PC_NONE = 0;
pub const PC_POLYGON = 1;
pub const PC_RECTANGLE = 2;
pub const PC_WINDPOLYGON = 4;
pub const PC_TRAPEZOID = 4;
pub const PC_SCANLINE = 8;
pub const PC_WIDE = 16;
pub const PC_STYLED = 32;
pub const PC_WIDESTYLED = 64;
pub const PC_INTERIORS = 128;
pub const PC_POLYPOLYGON = 256;
pub const PC_PATHS = 512;
pub const CP_NONE = 0;
pub const CP_RECTANGLE = 1;
pub const CP_REGION = 2;
pub const TC_OP_CHARACTER = 1;
pub const TC_OP_STROKE = 2;
pub const TC_CP_STROKE = 4;
pub const TC_CR_90 = 8;
pub const TC_CR_ANY = 16;
pub const TC_SF_X_YINDEP = 32;
pub const TC_SA_DOUBLE = 64;
pub const TC_SA_INTEGER = 128;
pub const TC_SA_CONTIN = 256;
pub const TC_EA_DOUBLE = 512;
pub const TC_IA_ABLE = 1024;
pub const TC_UA_ABLE = 2048;
pub const TC_SO_ABLE = 4096;
pub const TC_RA_ABLE = 8192;
pub const TC_VA_ABLE = 16384;
pub const TC_RESERVED = 32768;
pub const TC_SCROLLBLT = 65536;
pub const RC_BITBLT = 1;
pub const RC_BANDING = 2;
pub const RC_SCALING = 4;
pub const RC_BITMAP64 = 8;
pub const RC_GDI20_OUTPUT = 16;
pub const RC_GDI20_STATE = 32;
pub const RC_SAVEBITMAP = 64;
pub const RC_DI_BITMAP = 128;
pub const RC_PALETTE = 256;
pub const RC_DIBTODEV = 512;
pub const RC_BIGFONT = 1024;
pub const RC_STRETCHBLT = 2048;
pub const RC_FLOODFILL = 4096;
pub const RC_STRETCHDIB = 8192;
pub const RC_OP_DX_OUTPUT = 16384;
pub const RC_DEVBITS = 32768;
pub const SB_NONE = 0;
pub const SB_CONST_ALPHA = 1;
pub const SB_PIXEL_ALPHA = 2;
pub const SB_PREMULT_ALPHA = 4;
pub const SB_GRAD_RECT = 16;
pub const SB_GRAD_TRI = 32;
pub const CM_NONE = 0;
pub const CM_DEVICE_ICM = 1;
pub const CM_GAMMA_RAMP = 2;
pub const CM_CMYK_COLOR = 4;
pub const SYSPAL_ERROR = 0;
pub const CBM_INIT = 4;
pub const CCHFORMNAME = 32;
pub const DMORIENT_PORTRAIT = 1;
pub const DMORIENT_LANDSCAPE = 2;
pub const DMPAPER_LETTER = 1;
pub const DMPAPER_LETTERSMALL = 2;
pub const DMPAPER_TABLOID = 3;
pub const DMPAPER_LEDGER = 4;
pub const DMPAPER_LEGAL = 5;
pub const DMPAPER_STATEMENT = 6;
pub const DMPAPER_EXECUTIVE = 7;
pub const DMPAPER_A3 = 8;
pub const DMPAPER_A4 = 9;
pub const DMPAPER_A4SMALL = 10;
pub const DMPAPER_A5 = 11;
pub const DMPAPER_B4 = 12;
pub const DMPAPER_B5 = 13;
pub const DMPAPER_FOLIO = 14;
pub const DMPAPER_QUARTO = 15;
pub const DMPAPER_10X14 = 16;
pub const DMPAPER_11X17 = 17;
pub const DMPAPER_NOTE = 18;
pub const DMPAPER_ENV_9 = 19;
pub const DMPAPER_ENV_10 = 20;
pub const DMPAPER_ENV_11 = 21;
pub const DMPAPER_ENV_12 = 22;
pub const DMPAPER_ENV_14 = 23;
pub const DMPAPER_CSHEET = 24;
pub const DMPAPER_DSHEET = 25;
pub const DMPAPER_ESHEET = 26;
pub const DMPAPER_ENV_DL = 27;
pub const DMPAPER_ENV_C5 = 28;
pub const DMPAPER_ENV_C3 = 29;
pub const DMPAPER_ENV_C4 = 30;
pub const DMPAPER_ENV_C6 = 31;
pub const DMPAPER_ENV_C65 = 32;
pub const DMPAPER_ENV_B4 = 33;
pub const DMPAPER_ENV_B5 = 34;
pub const DMPAPER_ENV_B6 = 35;
pub const DMPAPER_ENV_ITALY = 36;
pub const DMPAPER_ENV_MONARCH = 37;
pub const DMPAPER_ENV_PERSONAL = 38;
pub const DMPAPER_FANFOLD_US = 39;
pub const DMPAPER_FANFOLD_STD_GERMAN = 40;
pub const DMPAPER_FANFOLD_LGL_GERMAN = 41;
pub const DMPAPER_ISO_B4 = 42;
pub const DMPAPER_JAPANESE_POSTCARD = 43;
pub const DMPAPER_9X11 = 44;
pub const DMPAPER_10X11 = 45;
pub const DMPAPER_15X11 = 46;
pub const DMPAPER_ENV_INVITE = 47;
pub const DMPAPER_RESERVED_48 = 48;
pub const DMPAPER_RESERVED_49 = 49;
pub const DMPAPER_LETTER_EXTRA = 50;
pub const DMPAPER_LEGAL_EXTRA = 51;
pub const DMPAPER_TABLOID_EXTRA = 52;
pub const DMPAPER_A4_EXTRA = 53;
pub const DMPAPER_LETTER_TRANSVERSE = 54;
pub const DMPAPER_A4_TRANSVERSE = 55;
pub const DMPAPER_LETTER_EXTRA_TRANSVERSE = 56;
pub const DMPAPER_A_PLUS = 57;
pub const DMPAPER_B_PLUS = 58;
pub const DMPAPER_LETTER_PLUS = 59;
pub const DMPAPER_A4_PLUS = 60;
pub const DMPAPER_A5_TRANSVERSE = 61;
pub const DMPAPER_B5_TRANSVERSE = 62;
pub const DMPAPER_A3_EXTRA = 63;
pub const DMPAPER_A5_EXTRA = 64;
pub const DMPAPER_B5_EXTRA = 65;
pub const DMPAPER_A2 = 66;
pub const DMPAPER_A3_TRANSVERSE = 67;
pub const DMPAPER_A3_EXTRA_TRANSVERSE = 68;
pub const DMPAPER_DBL_JAPANESE_POSTCARD = 69;
pub const DMPAPER_A6 = 70;
pub const DMPAPER_JENV_KAKU2 = 71;
pub const DMPAPER_JENV_KAKU3 = 72;
pub const DMPAPER_JENV_CHOU3 = 73;
pub const DMPAPER_JENV_CHOU4 = 74;
pub const DMPAPER_LETTER_ROTATED = 75;
pub const DMPAPER_A3_ROTATED = 76;
pub const DMPAPER_A4_ROTATED = 77;
pub const DMPAPER_A5_ROTATED = 78;
pub const DMPAPER_B4_JIS_ROTATED = 79;
pub const DMPAPER_B5_JIS_ROTATED = 80;
pub const DMPAPER_JAPANESE_POSTCARD_ROTATED = 81;
pub const DMPAPER_DBL_JAPANESE_POSTCARD_ROTATED = 82;
pub const DMPAPER_A6_ROTATED = 83;
pub const DMPAPER_JENV_KAKU2_ROTATED = 84;
pub const DMPAPER_JENV_KAKU3_ROTATED = 85;
pub const DMPAPER_JENV_CHOU3_ROTATED = 86;
pub const DMPAPER_JENV_CHOU4_ROTATED = 87;
pub const DMPAPER_B6_JIS = 88;
pub const DMPAPER_B6_JIS_ROTATED = 89;
pub const DMPAPER_12X11 = 90;
pub const DMPAPER_JENV_YOU4 = 91;
pub const DMPAPER_JENV_YOU4_ROTATED = 92;
pub const DMPAPER_P16K = 93;
pub const DMPAPER_P32K = 94;
pub const DMPAPER_P32KBIG = 95;
pub const DMPAPER_PENV_1 = 96;
pub const DMPAPER_PENV_2 = 97;
pub const DMPAPER_PENV_3 = 98;
pub const DMPAPER_PENV_4 = 99;
pub const DMPAPER_PENV_5 = 100;
pub const DMPAPER_PENV_6 = 101;
pub const DMPAPER_PENV_7 = 102;
pub const DMPAPER_PENV_8 = 103;
pub const DMPAPER_PENV_9 = 104;
pub const DMPAPER_PENV_10 = 105;
pub const DMPAPER_P16K_ROTATED = 106;
pub const DMPAPER_P32K_ROTATED = 107;
pub const DMPAPER_P32KBIG_ROTATED = 108;
pub const DMPAPER_PENV_1_ROTATED = 109;
pub const DMPAPER_PENV_2_ROTATED = 110;
pub const DMPAPER_PENV_3_ROTATED = 111;
pub const DMPAPER_PENV_4_ROTATED = 112;
pub const DMPAPER_PENV_5_ROTATED = 113;
pub const DMPAPER_PENV_6_ROTATED = 114;
pub const DMPAPER_PENV_7_ROTATED = 115;
pub const DMPAPER_PENV_8_ROTATED = 116;
pub const DMPAPER_PENV_9_ROTATED = 117;
pub const DMPAPER_PENV_10_ROTATED = 118;
pub const DMPAPER_LAST = 118;
pub const DMPAPER_USER = 256;
pub const DMBIN_UPPER = 1;
pub const DMBIN_ONLYONE = 1;
pub const DMBIN_LOWER = 2;
pub const DMBIN_MIDDLE = 3;
pub const DMBIN_MANUAL = 4;
pub const DMBIN_ENVELOPE = 5;
pub const DMBIN_ENVMANUAL = 6;
pub const DMBIN_AUTO = 7;
pub const DMBIN_TRACTOR = 8;
pub const DMBIN_SMALLFMT = 9;
pub const DMBIN_LARGEFMT = 10;
pub const DMBIN_LARGECAPACITY = 11;
pub const DMBIN_CASSETTE = 14;
pub const DMBIN_FORMSOURCE = 15;
pub const DMBIN_LAST = 15;
pub const DMBIN_USER = 256;
pub const DMRES_DRAFT = -1;
pub const DMRES_LOW = -2;
pub const DMRES_MEDIUM = -3;
pub const DMRES_HIGH = -4;
pub const DMDISPLAYFLAGS_TEXTMODE = 4;
pub const DMNUP_SYSTEM = 1;
pub const DMNUP_ONEUP = 2;
pub const DMICMMETHOD_NONE = 1;
pub const DMICMMETHOD_SYSTEM = 2;
pub const DMICMMETHOD_DRIVER = 3;
pub const DMICMMETHOD_DEVICE = 4;
pub const DMICMMETHOD_USER = 256;
pub const DMICM_SATURATE = 1;
pub const DMICM_CONTRAST = 2;
pub const DMICM_COLORIMETRIC = 3;
pub const DMICM_ABS_COLORIMETRIC = 4;
pub const DMICM_USER = 256;
pub const DMMEDIA_STANDARD = 1;
pub const DMMEDIA_TRANSPARENCY = 2;
pub const DMMEDIA_GLOSSY = 3;
pub const DMMEDIA_USER = 256;
pub const DMDITHER_NONE = 1;
pub const DMDITHER_COARSE = 2;
pub const DMDITHER_FINE = 3;
pub const DMDITHER_LINEART = 4;
pub const DMDITHER_ERRORDIFFUSION = 5;
pub const DMDITHER_RESERVED6 = 6;
pub const DMDITHER_RESERVED7 = 7;
pub const DMDITHER_RESERVED8 = 8;
pub const DMDITHER_RESERVED9 = 9;
pub const DMDITHER_GRAYSCALE = 10;
pub const DMDITHER_USER = 256;
pub const DISPLAYCONFIG_MAXPATH = 1024;
pub const DISPLAYCONFIG_PATH_MODE_IDX_INVALID = 4294967295;
pub const DISPLAYCONFIG_PATH_TARGET_MODE_IDX_INVALID = 65535;
pub const DISPLAYCONFIG_PATH_DESKTOP_IMAGE_IDX_INVALID = 65535;
pub const DISPLAYCONFIG_PATH_SOURCE_MODE_IDX_INVALID = 65535;
pub const DISPLAYCONFIG_PATH_CLONE_GROUP_INVALID = 65535;
pub const DISPLAYCONFIG_SOURCE_IN_USE = 1;
pub const DISPLAYCONFIG_TARGET_IN_USE = 1;
pub const DISPLAYCONFIG_TARGET_FORCIBLE = 2;
pub const DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_BOOT = 4;
pub const DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_PATH = 8;
pub const DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_SYSTEM = 16;
pub const DISPLAYCONFIG_TARGET_IS_HMD = 32;
pub const DISPLAYCONFIG_PATH_ACTIVE = 1;
pub const DISPLAYCONFIG_PATH_PREFERRED_UNSCALED = 4;
pub const DISPLAYCONFIG_PATH_SUPPORT_VIRTUAL_MODE = 8;
pub const DISPLAYCONFIG_PATH_BOOST_REFRESH_RATE = 16;
pub const DISPLAYCONFIG_PATH_VALID_FLAGS = 29;
pub const RDH_RECTANGLES = 1;
pub const SYSRGN = 4;
pub const TT_POLYGON_TYPE = 24;
pub const TT_PRIM_LINE = 1;
pub const TT_PRIM_QSPLINE = 2;
pub const TT_PRIM_CSPLINE = 3;
pub const GCP_DBCS = 1;
pub const GCP_ERROR = 32768;
pub const FLI_MASK = 4155;
pub const FLI_GLYPHS = 262144;
pub const GCP_JUSTIFYIN = 2097152;
pub const GCPCLASS_LATIN = 1;
pub const GCPCLASS_HEBREW = 2;
pub const GCPCLASS_ARABIC = 2;
pub const GCPCLASS_NEUTRAL = 3;
pub const GCPCLASS_LOCALNUMBER = 4;
pub const GCPCLASS_LATINNUMBER = 5;
pub const GCPCLASS_LATINNUMERICTERMINATOR = 6;
pub const GCPCLASS_LATINNUMERICSEPARATOR = 7;
pub const GCPCLASS_NUMERICSEPARATOR = 8;
pub const GCPCLASS_PREBOUNDLTR = 128;
pub const GCPCLASS_PREBOUNDRTL = 64;
pub const GCPCLASS_POSTBOUNDLTR = 32;
pub const GCPCLASS_POSTBOUNDRTL = 16;
pub const GCPGLYPH_LINKBEFORE = 32768;
pub const GCPGLYPH_LINKAFTER = 16384;
pub const TT_AVAILABLE = 1;
pub const TT_ENABLED = 2;
pub const DC_BINADJUST = 19;
pub const DC_EMF_COMPLIANT = 20;
pub const DC_DATATYPE_PRODUCED = 21;
pub const DC_MANUFACTURER = 23;
pub const DC_MODEL = 24;
pub const PRINTRATEUNIT_PPM = 1;
pub const PRINTRATEUNIT_CPS = 2;
pub const PRINTRATEUNIT_LPM = 3;
pub const PRINTRATEUNIT_IPM = 4;
pub const DCTT_BITMAP = 1;
pub const DCTT_DOWNLOAD = 2;
pub const DCTT_SUBDEV = 4;
pub const DCTT_DOWNLOAD_OUTLINE = 8;
pub const DCBA_FACEUPNONE = 0;
pub const DCBA_FACEUPCENTER = 1;
pub const DCBA_FACEUPLEFT = 2;
pub const DCBA_FACEUPRIGHT = 3;
pub const DCBA_FACEDOWNNONE = 256;
pub const DCBA_FACEDOWNCENTER = 257;
pub const DCBA_FACEDOWNLEFT = 258;
pub const DCBA_FACEDOWNRIGHT = 259;
pub const GS_8BIT_INDICES = 1;
pub const GGI_MARK_NONEXISTING_GLYPHS = 1;
pub const MM_MAX_NUMAXES = 16;
pub const MM_MAX_AXES_NAMELEN = 16;
pub const GDIREGISTERDDRAWPACKETVERSION = 1;
pub const AC_SRC_OVER = 0;
pub const AC_SRC_ALPHA = 1;
pub const GRADIENT_FILL_OP_FLAG = 255;
pub const CA_NEGATIVE = 1;
pub const CA_LOG_FILTER = 2;
pub const ILLUMINANT_DEVICE_DEFAULT = 0;
pub const ILLUMINANT_A = 1;
pub const ILLUMINANT_B = 2;
pub const ILLUMINANT_C = 3;
pub const ILLUMINANT_D50 = 4;
pub const ILLUMINANT_D55 = 5;
pub const ILLUMINANT_D65 = 6;
pub const ILLUMINANT_D75 = 7;
pub const ILLUMINANT_F2 = 8;
pub const ILLUMINANT_MAX_INDEX = 8;
pub const ILLUMINANT_TUNGSTEN = 1;
pub const ILLUMINANT_DAYLIGHT = 3;
pub const ILLUMINANT_FLUORESCENT = 8;
pub const ILLUMINANT_NTSC = 3;
pub const DI_APPBANDING = 1;
pub const DI_ROPS_READ_DESTINATION = 2;
pub const FONTMAPPER_MAX = 10;
pub const ENHMETA_SIGNATURE = 1179469088;
pub const ENHMETA_STOCK_OBJECT = 2147483648;
pub const SETICMPROFILE_EMBEDED = 1;
pub const CREATECOLORSPACE_EMBEDED = 1;
pub const COLORMATCHTOTARGET_EMBEDED = 1;
pub const GDICOMMENT_IDENTIFIER = 1128875079;
pub const GDICOMMENT_WINDOWS_METAFILE = 2147483649;
pub const GDICOMMENT_BEGINGROUP = 2;
pub const GDICOMMENT_ENDGROUP = 3;
pub const GDICOMMENT_MULTIFORMATS = 1073741828;
pub const EPS_SIGNATURE = 1179865157;
pub const GDICOMMENT_UNICODE_STRING = 64;
pub const GDICOMMENT_UNICODE_END = 128;
pub const WGL_FONT_LINES = 0;
pub const WGL_FONT_POLYGONS = 1;
pub const LPD_DOUBLEBUFFER = 1;
pub const LPD_STEREO = 2;
pub const LPD_SUPPORT_GDI = 16;
pub const LPD_SUPPORT_OPENGL = 32;
pub const LPD_SHARE_DEPTH = 64;
pub const LPD_SHARE_STENCIL = 128;
pub const LPD_SHARE_ACCUM = 256;
pub const LPD_SWAP_EXCHANGE = 512;
pub const LPD_SWAP_COPY = 1024;
pub const LPD_TRANSPARENT = 4096;
pub const LPD_TYPE_RGBA = 0;
pub const LPD_TYPE_COLORINDEX = 1;
pub const WGL_SWAP_MAIN_PLANE = 1;
pub const WGL_SWAP_OVERLAY1 = 2;
pub const WGL_SWAP_OVERLAY2 = 4;
pub const WGL_SWAP_OVERLAY3 = 8;
pub const WGL_SWAP_OVERLAY4 = 16;
pub const WGL_SWAP_OVERLAY5 = 32;
pub const WGL_SWAP_OVERLAY6 = 64;
pub const WGL_SWAP_OVERLAY7 = 128;
pub const WGL_SWAP_OVERLAY8 = 256;
pub const WGL_SWAP_OVERLAY9 = 512;
pub const WGL_SWAP_OVERLAY10 = 1024;
pub const WGL_SWAP_OVERLAY11 = 2048;
pub const WGL_SWAP_OVERLAY12 = 4096;
pub const WGL_SWAP_OVERLAY13 = 8192;
pub const WGL_SWAP_OVERLAY14 = 16384;
pub const WGL_SWAP_OVERLAY15 = 32768;
pub const WGL_SWAP_UNDERLAY1 = 65536;
pub const WGL_SWAP_UNDERLAY2 = 131072;
pub const WGL_SWAP_UNDERLAY3 = 262144;
pub const WGL_SWAP_UNDERLAY4 = 524288;
pub const WGL_SWAP_UNDERLAY5 = 1048576;
pub const WGL_SWAP_UNDERLAY6 = 2097152;
pub const WGL_SWAP_UNDERLAY7 = 4194304;
pub const WGL_SWAP_UNDERLAY8 = 8388608;
pub const WGL_SWAP_UNDERLAY9 = 16777216;
pub const WGL_SWAP_UNDERLAY10 = 33554432;
pub const WGL_SWAP_UNDERLAY11 = 67108864;
pub const WGL_SWAP_UNDERLAY12 = 134217728;
pub const WGL_SWAP_UNDERLAY13 = 268435456;
pub const WGL_SWAP_UNDERLAY14 = 536870912;
pub const WGL_SWAP_UNDERLAY15 = 1073741824;
pub const WGL_SWAPMULTIPLE_MAX = 16;
pub const NEWTRANSPARENT = 3;
pub const QUERYROPSUPPORT = 40;
pub const SELECTDIB = 41;
pub const SC_SCREENSAVE = 61760;
pub const TTFCFP_SUBSET = 0;
pub const TTFCFP_SUBSET1 = 1;
pub const TTFCFP_DELTA = 2;
pub const TTFCFP_APPLE_PLATFORMID = 1;
pub const TTFCFP_MS_PLATFORMID = 3;
pub const TTFCFP_DONT_CARE = 65535;
pub const TTFCFP_LANG_KEEP_ALL = 0;
pub const TTFCFP_FLAGS_SUBSET = 1;
pub const TTFCFP_FLAGS_COMPRESS = 2;
pub const TTFCFP_FLAGS_TTC = 4;
pub const TTFCFP_FLAGS_GLYPHLIST = 8;
pub const TTFMFP_SUBSET = 0;
pub const TTFMFP_SUBSET1 = 1;
pub const TTFMFP_DELTA = 2;
pub const ERR_GENERIC = 1000;
pub const ERR_READOUTOFBOUNDS = 1001;
pub const ERR_WRITEOUTOFBOUNDS = 1002;
pub const ERR_READCONTROL = 1003;
pub const ERR_WRITECONTROL = 1004;
pub const ERR_MEM = 1005;
pub const ERR_FORMAT = 1006;
pub const ERR_WOULD_GROW = 1007;
pub const ERR_VERSION = 1008;
pub const ERR_NO_GLYPHS = 1009;
pub const ERR_INVALID_MERGE_FORMATS = 1010;
pub const ERR_INVALID_MERGE_CHECKSUMS = 1011;
pub const ERR_INVALID_MERGE_NUMGLYPHS = 1012;
pub const ERR_INVALID_DELTA_FORMAT = 1013;
pub const ERR_NOT_TTC = 1014;
pub const ERR_INVALID_TTC_INDEX = 1015;
pub const ERR_MISSING_CMAP = 1030;
pub const ERR_MISSING_GLYF = 1031;
pub const ERR_MISSING_HEAD = 1032;
pub const ERR_MISSING_HHEA = 1033;
pub const ERR_MISSING_HMTX = 1034;
pub const ERR_MISSING_LOCA = 1035;
pub const ERR_MISSING_MAXP = 1036;
pub const ERR_MISSING_NAME = 1037;
pub const ERR_MISSING_POST = 1038;
pub const ERR_MISSING_OS2 = 1039;
pub const ERR_MISSING_VHEA = 1040;
pub const ERR_MISSING_VMTX = 1041;
pub const ERR_MISSING_HHEA_OR_VHEA = 1042;
pub const ERR_MISSING_HMTX_OR_VMTX = 1043;
pub const ERR_MISSING_EBDT = 1044;
pub const ERR_INVALID_CMAP = 1060;
pub const ERR_INVALID_GLYF = 1061;
pub const ERR_INVALID_HEAD = 1062;
pub const ERR_INVALID_HHEA = 1063;
pub const ERR_INVALID_HMTX = 1064;
pub const ERR_INVALID_LOCA = 1065;
pub const ERR_INVALID_MAXP = 1066;
pub const ERR_INVALID_NAME = 1067;
pub const ERR_INVALID_POST = 1068;
pub const ERR_INVALID_OS2 = 1069;
pub const ERR_INVALID_VHEA = 1070;
pub const ERR_INVALID_VMTX = 1071;
pub const ERR_INVALID_HHEA_OR_VHEA = 1072;
pub const ERR_INVALID_HMTX_OR_VMTX = 1073;
pub const ERR_INVALID_TTO = 1080;
pub const ERR_INVALID_GSUB = 1081;
pub const ERR_INVALID_GPOS = 1082;
pub const ERR_INVALID_GDEF = 1083;
pub const ERR_INVALID_JSTF = 1084;
pub const ERR_INVALID_BASE = 1085;
pub const ERR_INVALID_EBLC = 1086;
pub const ERR_INVALID_LTSH = 1087;
pub const ERR_INVALID_VDMX = 1088;
pub const ERR_INVALID_HDMX = 1089;
pub const ERR_PARAMETER0 = 1100;
pub const ERR_PARAMETER1 = 1101;
pub const ERR_PARAMETER2 = 1102;
pub const ERR_PARAMETER3 = 1103;
pub const ERR_PARAMETER4 = 1104;
pub const ERR_PARAMETER5 = 1105;
pub const ERR_PARAMETER6 = 1106;
pub const ERR_PARAMETER7 = 1107;
pub const ERR_PARAMETER8 = 1108;
pub const ERR_PARAMETER9 = 1109;
pub const ERR_PARAMETER10 = 1110;
pub const ERR_PARAMETER11 = 1111;
pub const ERR_PARAMETER12 = 1112;
pub const ERR_PARAMETER13 = 1113;
pub const ERR_PARAMETER14 = 1114;
pub const ERR_PARAMETER15 = 1115;
pub const ERR_PARAMETER16 = 1116;
pub const CHARSET_DEFAULT = 1;
pub const CHARSET_GLYPHIDX = 3;
pub const TTEMBED_FAILIFVARIATIONSIMULATED = 16;
pub const TTEMBED_WEBOBJECT = 128;
pub const TTEMBED_XORENCRYPTDATA = 268435456;
pub const TTEMBED_VARIATIONSIMULATED = 1;
pub const TTEMBED_EUDCEMBEDDED = 2;
pub const TTEMBED_SUBSETCANCEL = 4;
pub const TTLOAD_PRIVATE = 1;
pub const TTLOAD_EUDC_OVERWRITE = 2;
pub const TTLOAD_EUDC_SET = 4;
pub const TTDELETE_DONTREMOVEFONT = 1;
pub const E_NONE = 0;
pub const E_API_NOTIMPL = 1;
pub const E_CHARCODECOUNTINVALID = 2;
pub const E_CHARCODESETINVALID = 3;
pub const E_DEVICETRUETYPEFONT = 4;
pub const E_HDCINVALID = 6;
pub const E_NOFREEMEMORY = 7;
pub const E_FONTREFERENCEINVALID = 8;
pub const E_NOTATRUETYPEFONT = 10;
pub const E_ERRORACCESSINGFONTDATA = 12;
pub const E_ERRORACCESSINGFACENAME = 13;
pub const E_ERRORUNICODECONVERSION = 17;
pub const E_ERRORCONVERTINGCHARS = 18;
pub const E_EXCEPTION = 19;
pub const E_RESERVEDPARAMNOTNULL = 20;
pub const E_CHARSETINVALID = 21;
pub const E_FILE_NOT_FOUND = 23;
pub const E_TTC_INDEX_OUT_OF_RANGE = 24;
pub const E_INPUTPARAMINVALID = 25;
pub const E_ERRORCOMPRESSINGFONTDATA = 256;
pub const E_FONTDATAINVALID = 258;
pub const E_NAMECHANGEFAILED = 259;
pub const E_FONTNOTEMBEDDABLE = 260;
pub const E_PRIVSINVALID = 261;
pub const E_SUBSETTINGFAILED = 262;
pub const E_READFROMSTREAMFAILED = 263;
pub const E_SAVETOSTREAMFAILED = 264;
pub const E_NOOS2 = 265;
pub const E_T2NOFREEMEMORY = 266;
pub const E_ERRORREADINGFONTDATA = 267;
pub const E_FLAGSINVALID = 268;
pub const E_ERRORCREATINGFONTFILE = 269;
pub const E_FONTALREADYEXISTS = 270;
pub const E_FONTNAMEALREADYEXISTS = 271;
pub const E_FONTINSTALLFAILED = 272;
pub const E_ERRORDECOMPRESSINGFONTDATA = 273;
pub const E_ERRORACCESSINGEXCLUDELIST = 274;
pub const E_FACENAMEINVALID = 275;
pub const E_STREAMINVALID = 276;
pub const E_STATUSINVALID = 277;
pub const E_PRIVSTATUSINVALID = 278;
pub const E_PERMISSIONSINVALID = 279;
pub const E_PBENABLEDINVALID = 280;
pub const E_SUBSETTINGEXCEPTION = 281;
pub const E_SUBSTRING_TEST_FAIL = 282;
pub const E_FONTVARIATIONSIMULATED = 283;
pub const E_FONTFAMILYNAMENOTINFULL = 285;
pub const E_ADDFONTFAILED = 512;
pub const E_COULDNTCREATETEMPFILE = 513;
pub const E_FONTFILECREATEFAILED = 515;
pub const E_WINDOWSAPI = 516;
pub const E_FONTFILENOTFOUND = 517;
pub const E_RESOURCEFILECREATEFAILED = 518;
pub const E_ERROREXPANDINGFONTDATA = 519;
pub const E_ERRORGETTINGDC = 520;
pub const E_EXCEPTIONINDECOMPRESSION = 521;
pub const E_EXCEPTIONINCOMPRESSION = 522;
pub const BDR_RAISEDOUTER = 1;
pub const BDR_SUNKENOUTER = 2;
pub const BDR_RAISEDINNER = 4;
pub const BDR_SUNKENINNER = 8;
pub const BDR_OUTER = 3;
pub const BDR_INNER = 12;
pub const BDR_RAISED = 5;
pub const BDR_SUNKEN = 10;
pub const EDGE_RAISED = 5;
pub const EDGE_SUNKEN = 10;
pub const EDGE_ETCHED = 6;
pub const EDGE_BUMP = 9;
pub const DFC_CAPTION = 1;
pub const DFC_MENU = 2;
pub const DFC_SCROLL = 3;
pub const DFC_BUTTON = 4;
pub const DFC_POPUPMENU = 5;
pub const DFCS_CAPTIONCLOSE = 0;
pub const DFCS_CAPTIONMIN = 1;
pub const DFCS_CAPTIONMAX = 2;
pub const DFCS_CAPTIONRESTORE = 3;
pub const DFCS_CAPTIONHELP = 4;
pub const DFCS_MENUARROW = 0;
pub const DFCS_MENUCHECK = 1;
pub const DFCS_MENUBULLET = 2;
pub const DFCS_MENUARROWRIGHT = 4;
pub const DFCS_SCROLLUP = 0;
pub const DFCS_SCROLLDOWN = 1;
pub const DFCS_SCROLLLEFT = 2;
pub const DFCS_SCROLLRIGHT = 3;
pub const DFCS_SCROLLCOMBOBOX = 5;
pub const DFCS_SCROLLSIZEGRIP = 8;
pub const DFCS_SCROLLSIZEGRIPRIGHT = 16;
pub const DFCS_BUTTONCHECK = 0;
pub const DFCS_BUTTONRADIOIMAGE = 1;
pub const DFCS_BUTTONRADIOMASK = 2;
pub const DFCS_BUTTONRADIO = 4;
pub const DFCS_BUTTON3STATE = 8;
pub const DFCS_BUTTONPUSH = 16;
pub const DFCS_INACTIVE = 256;
pub const DFCS_PUSHED = 512;
pub const DFCS_CHECKED = 1024;
pub const DFCS_TRANSPARENT = 2048;
pub const DFCS_HOT = 4096;
pub const DFCS_ADJUSTRECT = 8192;
pub const DFCS_FLAT = 16384;
pub const DFCS_MONO = 32768;
pub const CDS_FULLSCREEN = 4;
pub const CDS_GLOBAL = 8;
pub const CDS_NORESET = 268435456;
pub const CDS_RESET = 1073741824;
pub const CDS_SET_PRIMARY = 16;
pub const CDS_TEST = 2;
pub const CDS_UPDATEREGISTRY = 1;
pub const CDS_VIDEOPARAMETERS = 32;
pub const CDS_ENABLE_UNSAFE_MODES = 256;
pub const CDS_DISABLE_UNSAFE_MODES = 512;
pub const CDS_RESET_EX = 536870912;
pub const DISP_CHANGE_SUCCESSFUL = 0;
pub const DISP_CHANGE_RESTART = 1;
pub const DISP_CHANGE_FAILED = -1;
pub const DISP_CHANGE_BADMODE = -2;
pub const DISP_CHANGE_NOTUPDATED = -3;
pub const DISP_CHANGE_BADFLAGS = -4;
pub const DISP_CHANGE_BADPARAM = -5;
pub const DISP_CHANGE_BADDUALVIEW = -6;
pub const DST_COMPLEX = 0;
pub const DST_TEXT = 1;
pub const DST_PREFIXTEXT = 2;
pub const DST_ICON = 3;
pub const DST_BITMAP = 4;
pub const DSS_NORMAL = 0;
pub const DSS_UNION = 16;
pub const DSS_DISABLED = 32;
pub const DSS_MONO = 128;
pub const DSS_HIDEPREFIX = 512;
pub const DSS_PREFIXONLY = 1024;
pub const DSS_RIGHT = 32768;
pub const RDW_INVALIDATE = 1;
pub const RDW_INTERNALPAINT = 2;
pub const RDW_ERASE = 4;
pub const RDW_VALIDATE = 8;
pub const RDW_NOINTERNALPAINT = 16;
pub const RDW_NOERASE = 32;
pub const RDW_NOCHILDREN = 64;
pub const RDW_ALLCHILDREN = 128;
pub const RDW_UPDATENOW = 256;
pub const RDW_ERASENOW = 512;
pub const RDW_FRAME = 1024;
pub const RDW_NOFRAME = 2048;
pub const ENUM_CURRENT_SETTINGS = 4294967295;
pub const ENUM_REGISTRY_SETTINGS = 4294967294;
pub const TA_NOUPDATECP = 0;
pub const TA_UPDATECP = 1;
pub const TA_LEFT = 0;
pub const TA_RIGHT = 2;
pub const TA_CENTER = 6;
pub const TA_TOP = 0;
pub const TA_BOTTOM = 8;
pub const TA_BASELINE = 24;
pub const TA_RTLREADING = 256;
pub const TA_MASK = 287;
pub const VTA_BASELINE = 24;
pub const VTA_LEFT = 8;
pub const VTA_RIGHT = 0;
pub const VTA_CENTER = 6;
pub const VTA_BOTTOM = 2;
pub const VTA_TOP = 0;
pub const PS_GEOMETRIC = 65536;
pub const PS_COSMETIC = 0;
pub const PS_SOLID = 0;
pub const PS_DASH = 1;
pub const PS_DOT = 2;
pub const PS_DASHDOT = 3;
pub const PS_DASHDOTDOT = 4;
pub const PS_NULL = 5;
pub const PS_INSIDEFRAME = 6;
pub const PS_USERSTYLE = 7;
pub const PS_ALTERNATE = 8;
pub const PS_STYLE_MASK = 15;
pub const PS_ENDCAP_ROUND = 0;
pub const PS_ENDCAP_SQUARE = 256;
pub const PS_ENDCAP_FLAT = 512;
pub const PS_ENDCAP_MASK = 3840;
pub const PS_JOIN_ROUND = 0;
pub const PS_JOIN_BEVEL = 4096;
pub const PS_JOIN_MITER = 8192;
pub const PS_JOIN_MASK = 61440;
pub const PS_TYPE_MASK = 983040;
pub const TTEMBED_EMBEDEUDC = 32;
pub const TTEMBED_RAW = 0;
pub const TTEMBED_SUBSET = 1;
pub const TTEMBED_TTCOMPRESSED = 4;
pub const DT_BOTTOM = 8;
pub const DT_CALCRECT = 1024;
pub const DT_CENTER = 1;
pub const DT_EDITCONTROL = 8192;
pub const DT_END_ELLIPSIS = 32768;
pub const DT_EXPANDTABS = 64;
pub const DT_EXTERNALLEADING = 512;
pub const DT_HIDEPREFIX = 1048576;
pub const DT_INTERNAL = 4096;
pub const DT_LEFT = 0;
pub const DT_MODIFYSTRING = 65536;
pub const DT_NOCLIP = 256;
pub const DT_NOFULLWIDTHCHARBREAK = 524288;
pub const DT_NOPREFIX = 2048;
pub const DT_PATH_ELLIPSIS = 16384;
pub const DT_PREFIXONLY = 2097152;
pub const DT_RIGHT = 2;
pub const DT_RTLREADING = 131072;
pub const DT_SINGLELINE = 32;
pub const DT_TABSTOP = 128;
pub const DT_TOP = 0;
pub const DT_VCENTER = 4;
pub const DT_WORDBREAK = 16;
pub const DT_WORD_ELLIPSIS = 262144;
pub const CHARSET_UNICODE = 1;
pub const CHARSET_SYMBOL = 2;
pub const DCX_WINDOW = 1;
pub const DCX_CACHE = 2;
pub const DCX_PARENTCLIP = 32;
pub const DCX_CLIPSIBLINGS = 16;
pub const DCX_CLIPCHILDREN = 8;
pub const DCX_NORESETATTRS = 4;
pub const DCX_LOCKWINDOWUPDATE = 1024;
pub const DCX_EXCLUDERGN = 64;
pub const DCX_INTERSECTRGN = 128;
pub const DCX_INTERSECTUPDATE = 512;
pub const DCX_VALIDATE = 2097152;
pub const GGO_BEZIER = 3;
pub const GGO_BITMAP = 1;
pub const GGO_GLYPH_INDEX = 128;
pub const GGO_GRAY2_BITMAP = 4;
pub const GGO_GRAY4_BITMAP = 5;
pub const GGO_GRAY8_BITMAP = 6;
pub const GGO_METRICS = 0;
pub const GGO_NATIVE = 2;
pub const GGO_UNHINTED = 256;
pub const DCB_ACCUMULATE = 2;
pub const DCB_DISABLE = 8;
pub const DCB_ENABLE = 4;
pub const DCB_RESET = 1;
pub const BLACK_BRUSH = 4;
pub const DKGRAY_BRUSH = 3;
pub const DC_BRUSH = 18;
pub const GRAY_BRUSH = 2;
pub const HOLLOW_BRUSH = 5;
pub const LTGRAY_BRUSH = 1;
pub const NULL_BRUSH = 5;
pub const WHITE_BRUSH = 0;
pub const BLACK_PEN = 7;
pub const DC_PEN = 19;
pub const NULL_PEN = 8;
pub const WHITE_PEN = 6;
pub const ANSI_FIXED_FONT = 11;
pub const ANSI_VAR_FONT = 12;
pub const DEVICE_DEFAULT_FONT = 14;
pub const DEFAULT_GUI_FONT = 17;
pub const OEM_FIXED_FONT = 10;
pub const SYSTEM_FONT = 13;
pub const SYSTEM_FIXED_FONT = 16;
pub const DEFAULT_PALETTE = 15;
pub const MWT_IDENTITY = 1;
pub const MWT_LEFTMULTIPLY = 2;
pub const MWT_RIGHTMULTIPLY = 3;
pub const CLIP_DEFAULT_PRECIS = 0;
pub const CLIP_CHARACTER_PRECIS = 1;
pub const CLIP_STROKE_PRECIS = 2;
pub const CLIP_MASK = 15;
pub const CLIP_LH_ANGLES = 16;
pub const CLIP_TT_ALWAYS = 32;
pub const CLIP_DFA_DISABLE = 64;
pub const CLIP_EMBEDDED = 128;
pub const CLIP_DFA_OVERRIDE = 64;
pub const ALTERNATE = 1;
pub const WINDING = 2;
pub const EMBED_PREVIEWPRINT = 1;
pub const EMBED_EDITABLE = 2;
pub const EMBED_INSTALLABLE = 3;
pub const EMBED_NOEMBEDDING = 4;
pub const MONITOR_DEFAULTTONEAREST = 2;
pub const MONITOR_DEFAULTTONULL = 0;
pub const MONITOR_DEFAULTTOPRIMARY = 1;
pub const FR_PRIVATE = 16;
pub const FR_NOT_ENUM = 32;
pub const LAYOUT_BITMAPORIENTATIONPRESERVED = 8;
pub const LAYOUT_RTL = 1;
pub const DRIVERVERSION = 0;
pub const TECHNOLOGY = 2;
pub const HORZSIZE = 4;
pub const VERTSIZE = 6;
pub const HORZRES = 8;
pub const VERTRES = 10;
pub const BITSPIXEL = 12;
pub const PLANES = 14;
pub const NUMBRUSHES = 16;
pub const NUMPENS = 18;
pub const NUMMARKERS = 20;
pub const NUMFONTS = 22;
pub const NUMCOLORS = 24;
pub const PDEVICESIZE = 26;
pub const CURVECAPS = 28;
pub const LINECAPS = 30;
pub const POLYGONALCAPS = 32;
pub const TEXTCAPS = 34;
pub const CLIPCAPS = 36;
pub const RASTERCAPS = 38;
pub const ASPECTX = 40;
pub const ASPECTY = 42;
pub const ASPECTXY = 44;
pub const LOGPIXELSX = 88;
pub const LOGPIXELSY = 90;
pub const SIZEPALETTE = 104;
pub const NUMRESERVED = 106;
pub const COLORRES = 108;
pub const PHYSICALWIDTH = 110;
pub const PHYSICALHEIGHT = 111;
pub const PHYSICALOFFSETX = 112;
pub const PHYSICALOFFSETY = 113;
pub const SCALINGFACTORX = 114;
pub const SCALINGFACTORY = 115;
pub const VREFRESH = 116;
pub const DESKTOPVERTRES = 117;
pub const DESKTOPHORZRES = 118;
pub const BLTALIGNMENT = 119;
pub const SHADEBLENDCAPS = 120;
pub const COLORMGMTCAPS = 121;
pub const OUT_DEFAULT_PRECIS = 0;
pub const OUT_STRING_PRECIS = 1;
pub const OUT_CHARACTER_PRECIS = 2;
pub const OUT_STROKE_PRECIS = 3;
pub const OUT_TT_PRECIS = 4;
pub const OUT_DEVICE_PRECIS = 5;
pub const OUT_RASTER_PRECIS = 6;
pub const OUT_TT_ONLY_PRECIS = 7;
pub const OUT_OUTLINE_PRECIS = 8;
pub const OUT_SCREEN_OUTLINE_PRECIS = 9;
pub const OUT_PS_ONLY_PRECIS = 10;
pub const FW_DONTCARE = 0;
pub const FW_THIN = 100;
pub const FW_EXTRALIGHT = 200;
pub const FW_LIGHT = 300;
pub const FW_NORMAL = 400;
pub const FW_MEDIUM = 500;
pub const FW_SEMIBOLD = 600;
pub const FW_BOLD = 700;
pub const FW_EXTRABOLD = 800;
pub const FW_HEAVY = 900;
pub const FW_ULTRALIGHT = 200;
pub const FW_REGULAR = 400;
pub const FW_DEMIBOLD = 600;
pub const FW_ULTRABOLD = 800;
pub const FW_BLACK = 900;
pub const ANSI_CHARSET = 0;
pub const DEFAULT_CHARSET = 1;
pub const SYMBOL_CHARSET = 2;
pub const SHIFTJIS_CHARSET = 128;
pub const HANGEUL_CHARSET = 129;
pub const HANGUL_CHARSET = 129;
pub const GB2312_CHARSET = 134;
pub const CHINESEBIG5_CHARSET = 136;
pub const OEM_CHARSET = 255;
pub const JOHAB_CHARSET = 130;
pub const HEBREW_CHARSET = 177;
pub const ARABIC_CHARSET = 178;
pub const GREEK_CHARSET = 161;
pub const TURKISH_CHARSET = 162;
pub const VIETNAMESE_CHARSET = 163;
pub const THAI_CHARSET = 222;
pub const EASTEUROPE_CHARSET = 238;
pub const RUSSIAN_CHARSET = 204;
pub const MAC_CHARSET = 77;
pub const BALTIC_CHARSET = 186;
pub const AD_COUNTERCLOCKWISE = 1;
pub const AD_CLOCKWISE = 2;
pub const TTLOAD_FONT_SUBSETTED = 1;
pub const TTLOAD_FONT_IN_SYSSTARTUP = 2;
pub const BLACKONWHITE = 1;
pub const COLORONCOLOR = 3;
pub const HALFTONE = 4;
pub const STRETCH_ANDSCANS = 1;
pub const STRETCH_DELETESCANS = 3;
pub const STRETCH_HALFTONE = 4;
pub const STRETCH_ORSCANS = 2;
pub const WHITEONBLACK = 2;
pub const DEFAULT_QUALITY = 0;
pub const DRAFT_QUALITY = 1;
pub const PROOF_QUALITY = 2;
pub const NONANTIALIASED_QUALITY = 3;
pub const ANTIALIASED_QUALITY = 4;
pub const CLEARTYPE_QUALITY = 5;
pub const OPAQUE = 2;
pub const TRANSPARENT = 1;
pub const GCP_CLASSIN = 524288;
pub const GCP_DIACRITIC = 256;
pub const GCP_DISPLAYZWG = 4194304;
pub const GCP_GLYPHSHAPE = 16;
pub const GCP_JUSTIFY = 65536;
pub const GCP_KASHIDA = 1024;
pub const GCP_LIGATE = 32;
pub const GCP_MAXEXTENT = 1048576;
pub const GCP_NEUTRALOVERRIDE = 33554432;
pub const GCP_NUMERICOVERRIDE = 16777216;
pub const GCP_NUMERICSLATIN = 67108864;
pub const GCP_NUMERICSLOCAL = 134217728;
pub const GCP_REORDER = 2;
pub const GCP_SYMSWAPOFF = 8388608;
pub const GCP_USEKERNING = 8;
pub const BF_ADJUST = 8192;
pub const BF_BOTTOM = 8;
pub const BF_BOTTOMLEFT = 9;
pub const BF_BOTTOMRIGHT = 12;
pub const BF_DIAGONAL = 16;
pub const BF_DIAGONAL_ENDBOTTOMLEFT = 25;
pub const BF_DIAGONAL_ENDBOTTOMRIGHT = 28;
pub const BF_DIAGONAL_ENDTOPLEFT = 19;
pub const BF_DIAGONAL_ENDTOPRIGHT = 22;
pub const BF_FLAT = 16384;
pub const BF_LEFT = 1;
pub const BF_MIDDLE = 2048;
pub const BF_MONO = 32768;
pub const BF_RECT = 15;
pub const BF_RIGHT = 4;
pub const BF_SOFT = 4096;
pub const BF_TOP = 2;
pub const BF_TOPLEFT = 3;
pub const BF_TOPRIGHT = 6;
pub const COLOR_SCROLLBAR = 0;
pub const COLOR_BACKGROUND = 1;
pub const COLOR_ACTIVECAPTION = 2;
pub const COLOR_INACTIVECAPTION = 3;
pub const COLOR_MENU = 4;
pub const COLOR_WINDOW = 5;
pub const COLOR_WINDOWFRAME = 6;
pub const COLOR_MENUTEXT = 7;
pub const COLOR_WINDOWTEXT = 8;
pub const COLOR_CAPTIONTEXT = 9;
pub const COLOR_ACTIVEBORDER = 10;
pub const COLOR_INACTIVEBORDER = 11;
pub const COLOR_APPWORKSPACE = 12;
pub const COLOR_HIGHLIGHT = 13;
pub const COLOR_HIGHLIGHTTEXT = 14;
pub const COLOR_BTNFACE = 15;
pub const COLOR_BTNSHADOW = 16;
pub const COLOR_GRAYTEXT = 17;
pub const COLOR_BTNTEXT = 18;
pub const COLOR_INACTIVECAPTIONTEXT = 19;
pub const COLOR_BTNHIGHLIGHT = 20;
pub const COLOR_3DDKSHADOW = 21;
pub const COLOR_3DLIGHT = 22;
pub const COLOR_INFOTEXT = 23;
pub const COLOR_INFOBK = 24;
pub const COLOR_HOTLIGHT = 26;
pub const COLOR_GRADIENTACTIVECAPTION = 27;
pub const COLOR_GRADIENTINACTIVECAPTION = 28;
pub const COLOR_MENUHILIGHT = 29;
pub const COLOR_MENUBAR = 30;
pub const COLOR_DESKTOP = 1;
pub const COLOR_3DFACE = 15;
pub const COLOR_3DSHADOW = 16;
pub const COLOR_3DHIGHLIGHT = 20;
pub const COLOR_3DHILIGHT = 20;
pub const COLOR_BTNHILIGHT = 20;
pub const LICENSE_PREVIEWPRINT = 4;
pub const LICENSE_EDITABLE = 8;
pub const LICENSE_INSTALLABLE = 0;
pub const LICENSE_NOEMBEDDING = 2;
pub const LICENSE_DEFAULT = 0;
pub const GRADIENT_FILL_RECT_H = 0;
pub const GRADIENT_FILL_RECT_V = 1;
pub const GRADIENT_FILL_TRIANGLE = 2;
pub const TTFCFP_STD_MAC_CHAR_SET = 0;
pub const TTFCFP_SYMBOL_CHAR_SET = 0;
pub const TTFCFP_UNICODE_CHAR_SET = 1;
pub const FLOODFILLBORDER = 0;
pub const FLOODFILLSURFACE = 1;
pub const HS_BDIAGONAL = 3;
pub const HS_CROSS = 4;
pub const HS_DIAGCROSS = 5;
pub const HS_FDIAGONAL = 2;
pub const HS_HORIZONTAL = 0;
pub const HS_VERTICAL = 1;
pub const DC_ACTIVE = 1;
pub const DC_BUTTONS = 4096;
pub const DC_GRADIENT = 32;
pub const DC_ICON = 4;
pub const DC_INBUTTON = 16;
pub const DC_SMALLCAP = 2;
pub const DC_TEXT = 8;
pub const SYSPAL_NOSTATIC = 2;
pub const SYSPAL_NOSTATIC256 = 3;
pub const SYSPAL_STATIC = 1;
pub const GM_COMPATIBLE = 1;
pub const GM_ADVANCED = 2;
pub const DEFAULT_PITCH = 0;
pub const FIXED_PITCH = 1;
pub const VARIABLE_PITCH = 2;
pub const FF_DECORATIVE = 80;
pub const FF_DONTCARE = 0;
pub const FF_MODERN = 48;
pub const FF_ROMAN = 16;
pub const FF_SCRIPT = 64;
pub const FF_SWISS = 32;
pub const BLACKNESS = 66;
pub const NOTSRCERASE = 1114278;
pub const NOTSRCCOPY = 3342344;
pub const SRCERASE = 4457256;
pub const DSTINVERT = 5570569;
pub const PATINVERT = 5898313;
pub const SRCINVERT = 6684742;
pub const SRCAND = 8913094;
pub const MERGEPAINT = 12255782;
pub const MERGECOPY = 12583114;
pub const SRCCOPY = 13369376;
pub const SRCPAINT = 15597702;
pub const PATCOPY = 15728673;
pub const PATPAINT = 16452105;
pub const WHITENESS = 16711778;
pub const CAPTUREBLT = 1073741824;
pub const NOMIRRORBITMAP = 2147483648;
pub const TTFCFP_UNICODE_PLATFORMID = 0;
pub const TTFCFP_ISO_PLATFORMID = 2;
pub const MM_ANISOTROPIC = 8;
pub const MM_HIENGLISH = 5;
pub const MM_HIMETRIC = 3;
pub const MM_ISOTROPIC = 7;
pub const MM_LOENGLISH = 4;
pub const MM_LOMETRIC = 2;
pub const MM_TEXT = 1;
pub const MM_TWIPS = 6;
pub const RGN_ERROR = 0;
pub const NULLREGION = 1;
pub const SIMPLEREGION = 2;
pub const COMPLEXREGION = 3;
pub const BS_SOLID = 0;
pub const BS_NULL = 1;
pub const BS_HOLLOW = 1;
pub const BS_HATCHED = 2;
pub const BS_PATTERN = 3;
pub const BS_INDEXED = 4;
pub const BS_DIBPATTERN = 5;
pub const BS_DIBPATTERNPT = 6;
pub const BS_PATTERN8X8 = 7;
pub const BS_DIBPATTERN8X8 = 8;
pub const BS_MONOPATTERN = 9;
pub const TMPF_FIXED_PITCH = 1;
pub const TMPF_VECTOR = 2;
pub const TMPF_DEVICE = 8;
pub const TMPF_TRUETYPE = 4;
pub const BI_RGB = 0;
pub const BI_RLE8 = 1;
pub const BI_RLE4 = 2;
pub const BI_BITFIELDS = 3;
pub const BI_JPEG = 4;
pub const BI_PNG = 5;
pub const EMR_HEADER = 1;
pub const EMR_POLYBEZIER = 2;
pub const EMR_POLYGON = 3;
pub const EMR_POLYLINE = 4;
pub const EMR_POLYBEZIERTO = 5;
pub const EMR_POLYLINETO = 6;
pub const EMR_POLYPOLYLINE = 7;
pub const EMR_POLYPOLYGON = 8;
pub const EMR_SETWINDOWEXTEX = 9;
pub const EMR_SETWINDOWORGEX = 10;
pub const EMR_SETVIEWPORTEXTEX = 11;
pub const EMR_SETVIEWPORTORGEX = 12;
pub const EMR_SETBRUSHORGEX = 13;
pub const EMR_EOF = 14;
pub const EMR_SETPIXELV = 15;
pub const EMR_SETMAPPERFLAGS = 16;
pub const EMR_SETMAPMODE = 17;
pub const EMR_SETBKMODE = 18;
pub const EMR_SETPOLYFILLMODE = 19;
pub const EMR_SETROP2 = 20;
pub const EMR_SETSTRETCHBLTMODE = 21;
pub const EMR_SETTEXTALIGN = 22;
pub const EMR_SETCOLORADJUSTMENT = 23;
pub const EMR_SETTEXTCOLOR = 24;
pub const EMR_SETBKCOLOR = 25;
pub const EMR_OFFSETCLIPRGN = 26;
pub const EMR_MOVETOEX = 27;
pub const EMR_SETMETARGN = 28;
pub const EMR_EXCLUDECLIPRECT = 29;
pub const EMR_INTERSECTCLIPRECT = 30;
pub const EMR_SCALEVIEWPORTEXTEX = 31;
pub const EMR_SCALEWINDOWEXTEX = 32;
pub const EMR_SAVEDC = 33;
pub const EMR_RESTOREDC = 34;
pub const EMR_SETWORLDTRANSFORM = 35;
pub const EMR_MODIFYWORLDTRANSFORM = 36;
pub const EMR_SELECTOBJECT = 37;
pub const EMR_CREATEPEN = 38;
pub const EMR_CREATEBRUSHINDIRECT = 39;
pub const EMR_DELETEOBJECT = 40;
pub const EMR_ANGLEARC = 41;
pub const EMR_ELLIPSE = 42;
pub const EMR_RECTANGLE = 43;
pub const EMR_ROUNDRECT = 44;
pub const EMR_ARC = 45;
pub const EMR_CHORD = 46;
pub const EMR_PIE = 47;
pub const EMR_SELECTPALETTE = 48;
pub const EMR_CREATEPALETTE = 49;
pub const EMR_SETPALETTEENTRIES = 50;
pub const EMR_RESIZEPALETTE = 51;
pub const EMR_REALIZEPALETTE = 52;
pub const EMR_EXTFLOODFILL = 53;
pub const EMR_LINETO = 54;
pub const EMR_ARCTO = 55;
pub const EMR_POLYDRAW = 56;
pub const EMR_SETARCDIRECTION = 57;
pub const EMR_SETMITERLIMIT = 58;
pub const EMR_BEGINPATH = 59;
pub const EMR_ENDPATH = 60;
pub const EMR_CLOSEFIGURE = 61;
pub const EMR_FILLPATH = 62;
pub const EMR_STROKEANDFILLPATH = 63;
pub const EMR_STROKEPATH = 64;
pub const EMR_FLATTENPATH = 65;
pub const EMR_WIDENPATH = 66;
pub const EMR_SELECTCLIPPATH = 67;
pub const EMR_ABORTPATH = 68;
pub const EMR_GDICOMMENT = 70;
pub const EMR_FILLRGN = 71;
pub const EMR_FRAMERGN = 72;
pub const EMR_INVERTRGN = 73;
pub const EMR_PAINTRGN = 74;
pub const EMR_EXTSELECTCLIPRGN = 75;
pub const EMR_BITBLT = 76;
pub const EMR_STRETCHBLT = 77;
pub const EMR_MASKBLT = 78;
pub const EMR_PLGBLT = 79;
pub const EMR_SETDIBITSTODEVICE = 80;
pub const EMR_STRETCHDIBITS = 81;
pub const EMR_EXTCREATEFONTINDIRECTW = 82;
pub const EMR_EXTTEXTOUTA = 83;
pub const EMR_EXTTEXTOUTW = 84;
pub const EMR_POLYBEZIER16 = 85;
pub const EMR_POLYGON16 = 86;
pub const EMR_POLYLINE16 = 87;
pub const EMR_POLYBEZIERTO16 = 88;
pub const EMR_POLYLINETO16 = 89;
pub const EMR_POLYPOLYLINE16 = 90;
pub const EMR_POLYPOLYGON16 = 91;
pub const EMR_POLYDRAW16 = 92;
pub const EMR_CREATEMONOBRUSH = 93;
pub const EMR_CREATEDIBPATTERNBRUSHPT = 94;
pub const EMR_EXTCREATEPEN = 95;
pub const EMR_POLYTEXTOUTA = 96;
pub const EMR_POLYTEXTOUTW = 97;
pub const EMR_SETICMMODE = 98;
pub const EMR_CREATECOLORSPACE = 99;
pub const EMR_SETCOLORSPACE = 100;
pub const EMR_DELETECOLORSPACE = 101;
pub const EMR_GLSRECORD = 102;
pub const EMR_GLSBOUNDEDRECORD = 103;
pub const EMR_PIXELFORMAT = 104;
pub const EMR_RESERVED_105 = 105;
pub const EMR_RESERVED_106 = 106;
pub const EMR_RESERVED_107 = 107;
pub const EMR_RESERVED_108 = 108;
pub const EMR_RESERVED_109 = 109;
pub const EMR_RESERVED_110 = 110;
pub const EMR_COLORCORRECTPALETTE = 111;
pub const EMR_SETICMPROFILEA = 112;
pub const EMR_SETICMPROFILEW = 113;
pub const EMR_ALPHABLEND = 114;
pub const EMR_SETLAYOUT = 115;
pub const EMR_TRANSPARENTBLT = 116;
pub const EMR_RESERVED_117 = 117;
pub const EMR_GRADIENTFILL = 118;
pub const EMR_RESERVED_119 = 119;
pub const EMR_RESERVED_120 = 120;
pub const EMR_COLORMATCHTOTARGETW = 121;
pub const EMR_CREATECOLORSPACEW = 122;
pub const EMR_MIN = 1;
pub const EMR_MAX = 122;
pub const DM_SPECVERSION = 1025;
pub const DM_ORIENTATION = 1;
pub const DM_PAPERSIZE = 2;
pub const DM_PAPERLENGTH = 4;
pub const DM_PAPERWIDTH = 8;
pub const DM_SCALE = 16;
pub const DM_POSITION = 32;
pub const DM_NUP = 64;
pub const DM_DISPLAYORIENTATION = 128;
pub const DM_COPIES = 256;
pub const DM_DEFAULTSOURCE = 512;
pub const DM_PRINTQUALITY = 1024;
pub const DM_COLOR = 2048;
pub const DM_DUPLEX = 4096;
pub const DM_YRESOLUTION = 8192;
pub const DM_TTOPTION = 16384;
pub const DM_COLLATE = 32768;
pub const DM_FORMNAME = 65536;
pub const DM_LOGPIXELS = 131072;
pub const DM_BITSPERPEL = 262144;
pub const DM_PELSWIDTH = 524288;
pub const DM_PELSHEIGHT = 1048576;
pub const DM_DISPLAYFLAGS = 2097152;
pub const DM_DISPLAYFREQUENCY = 4194304;
pub const DM_ICMMETHOD = 8388608;
pub const DM_ICMINTENT = 16777216;
pub const DM_MEDIATYPE = 33554432;
pub const DM_DITHERTYPE = 67108864;
pub const DM_PANNINGWIDTH = 134217728;
pub const DM_PANNINGHEIGHT = 268435456;
pub const DM_DISPLAYFIXEDOUTPUT = 536870912;
pub const DM_INTERLACED = 2;
pub const DM_UPDATE = 1;
pub const DM_COPY = 2;
pub const DM_PROMPT = 4;
pub const DM_MODIFY = 8;
pub const DM_IN_BUFFER = 8;
pub const DM_IN_PROMPT = 4;
pub const DM_OUT_BUFFER = 2;
pub const DM_OUT_DEFAULT = 1;
pub const DMCOLOR_MONOCHROME = 1;
pub const DMCOLOR_COLOR = 2;
pub const DMDUP_SIMPLEX = 1;
pub const DMDUP_VERTICAL = 2;
pub const DMDUP_HORIZONTAL = 3;
pub const DMCOLLATE_FALSE = 0;
pub const DMCOLLATE_TRUE = 1;
pub const DMDO_DEFAULT = 0;
pub const DMDO_90 = 1;
pub const DMDO_180 = 2;
pub const DMDO_270 = 3;
pub const DMDFO_DEFAULT = 0;
pub const DMDFO_STRETCH = 1;
pub const DMDFO_CENTER = 2;
pub const DMTT_BITMAP = 1;
pub const DMTT_DOWNLOAD = 2;
pub const DMTT_SUBDEV = 3;
pub const DMTT_DOWNLOAD_OUTLINE = 4;
pub const PAN_FAMILY_ANY = 0;
pub const PAN_FAMILY_NO_FIT = 1;
pub const PAN_FAMILY_TEXT_DISPLAY = 2;
pub const PAN_FAMILY_SCRIPT = 3;
pub const PAN_FAMILY_DECORATIVE = 4;
pub const PAN_FAMILY_PICTORIAL = 5;
pub const PAN_SERIF_ANY = 0;
pub const PAN_SERIF_NO_FIT = 1;
pub const PAN_SERIF_COVE = 2;
pub const PAN_SERIF_OBTUSE_COVE = 3;
pub const PAN_SERIF_SQUARE_COVE = 4;
pub const PAN_SERIF_OBTUSE_SQUARE_COVE = 5;
pub const PAN_SERIF_SQUARE = 6;
pub const PAN_SERIF_THIN = 7;
pub const PAN_SERIF_BONE = 8;
pub const PAN_SERIF_EXAGGERATED = 9;
pub const PAN_SERIF_TRIANGLE = 10;
pub const PAN_SERIF_NORMAL_SANS = 11;
pub const PAN_SERIF_OBTUSE_SANS = 12;
pub const PAN_SERIF_PERP_SANS = 13;
pub const PAN_SERIF_FLARED = 14;
pub const PAN_SERIF_ROUNDED = 15;
pub const PAN_WEIGHT_ANY = 0;
pub const PAN_WEIGHT_NO_FIT = 1;
pub const PAN_WEIGHT_INDEX = 2;
pub const PAN_WEIGHT_VERY_LIGHT = 2;
pub const PAN_WEIGHT_LIGHT = 3;
pub const PAN_WEIGHT_THIN = 4;
pub const PAN_WEIGHT_BOOK = 5;
pub const PAN_WEIGHT_MEDIUM = 6;
pub const PAN_WEIGHT_DEMI = 7;
pub const PAN_WEIGHT_BOLD = 8;
pub const PAN_WEIGHT_HEAVY = 9;
pub const PAN_WEIGHT_BLACK = 10;
pub const PAN_WEIGHT_NORD = 11;
pub const PAN_STROKE_ANY = 0;
pub const PAN_STROKE_NO_FIT = 1;
pub const PAN_STROKE_GRADUAL_DIAG = 2;
pub const PAN_STROKE_GRADUAL_TRAN = 3;
pub const PAN_STROKE_GRADUAL_VERT = 4;
pub const PAN_STROKE_GRADUAL_HORZ = 5;
pub const PAN_STROKE_RAPID_VERT = 6;
pub const PAN_STROKE_RAPID_HORZ = 7;
pub const PAN_STROKE_INSTANT_VERT = 8;
pub const PAN_PROP_ANY = 0;
pub const PAN_PROP_NO_FIT = 1;
pub const PAN_PROP_OLD_STYLE = 2;
pub const PAN_PROP_MODERN = 3;
pub const PAN_PROP_EVEN_WIDTH = 4;
pub const PAN_PROP_EXPANDED = 5;
pub const PAN_PROP_CONDENSED = 6;
pub const PAN_PROP_VERY_EXPANDED = 7;
pub const PAN_PROP_VERY_CONDENSED = 8;
pub const PAN_PROP_MONOSPACED = 9;
pub const PAN_CONTRAST_ANY = 0;
pub const PAN_CONTRAST_NO_FIT = 1;
pub const PAN_CONTRAST_INDEX = 4;
pub const PAN_CONTRAST_NONE = 2;
pub const PAN_CONTRAST_VERY_LOW = 3;
pub const PAN_CONTRAST_LOW = 4;
pub const PAN_CONTRAST_MEDIUM_LOW = 5;
pub const PAN_CONTRAST_MEDIUM = 6;
pub const PAN_CONTRAST_MEDIUM_HIGH = 7;
pub const PAN_CONTRAST_HIGH = 8;
pub const PAN_CONTRAST_VERY_HIGH = 9;
pub const PAN_ARM_ANY = 0;
pub const PAN_ARM_NO_FIT = 1;
pub const PAN_STRAIGHT_ARMS_HORZ = 2;
pub const PAN_STRAIGHT_ARMS_WEDGE = 3;
pub const PAN_STRAIGHT_ARMS_VERT = 4;
pub const PAN_STRAIGHT_ARMS_SINGLE_SERIF = 5;
pub const PAN_STRAIGHT_ARMS_DOUBLE_SERIF = 6;
pub const PAN_BENT_ARMS_HORZ = 7;
pub const PAN_BENT_ARMS_WEDGE = 8;
pub const PAN_BENT_ARMS_VERT = 9;
pub const PAN_BENT_ARMS_SINGLE_SERIF = 10;
pub const PAN_BENT_ARMS_DOUBLE_SERIF = 11;
pub const PAN_LETT_FORM_ANY = 0;
pub const PAN_LETT_FORM_NO_FIT = 1;
pub const PAN_LETT_NORMAL_CONTACT = 2;
pub const PAN_LETT_NORMAL_WEIGHTED = 3;
pub const PAN_LETT_NORMAL_BOXED = 4;
pub const PAN_LETT_NORMAL_FLATTENED = 5;
pub const PAN_LETT_NORMAL_ROUNDED = 6;
pub const PAN_LETT_NORMAL_OFF_CENTER = 7;
pub const PAN_LETT_NORMAL_SQUARE = 8;
pub const PAN_LETT_OBLIQUE_CONTACT = 9;
pub const PAN_LETT_OBLIQUE_WEIGHTED = 10;
pub const PAN_LETT_OBLIQUE_BOXED = 11;
pub const PAN_LETT_OBLIQUE_FLATTENED = 12;
pub const PAN_LETT_OBLIQUE_ROUNDED = 13;
pub const PAN_LETT_OBLIQUE_OFF_CENTER = 14;
pub const PAN_LETT_OBLIQUE_SQUARE = 15;
pub const PAN_MIDLINE_ANY = 0;
pub const PAN_MIDLINE_NO_FIT = 1;
pub const PAN_MIDLINE_INDEX = 8;
pub const PAN_MIDLINE_STANDARD_TRIMMED = 2;
pub const PAN_MIDLINE_STANDARD_POINTED = 3;
pub const PAN_MIDLINE_STANDARD_SERIFED = 4;
pub const PAN_MIDLINE_HIGH_TRIMMED = 5;
pub const PAN_MIDLINE_HIGH_POINTED = 6;
pub const PAN_MIDLINE_HIGH_SERIFED = 7;
pub const PAN_MIDLINE_CONSTANT_TRIMMED = 8;
pub const PAN_MIDLINE_CONSTANT_POINTED = 9;
pub const PAN_MIDLINE_CONSTANT_SERIFED = 10;
pub const PAN_MIDLINE_LOW_TRIMMED = 11;
pub const PAN_MIDLINE_LOW_POINTED = 12;
pub const PAN_MIDLINE_LOW_SERIFED = 13;
pub const PAN_XHEIGHT_ANY = 0;
pub const PAN_XHEIGHT_NO_FIT = 1;
pub const PAN_XHEIGHT_INDEX = 9;
pub const PAN_XHEIGHT_CONSTANT_SMALL = 2;
pub const PAN_XHEIGHT_CONSTANT_STD = 3;
pub const PAN_XHEIGHT_CONSTANT_LARGE = 4;
pub const PAN_XHEIGHT_DUCKING_SMALL = 5;
pub const PAN_XHEIGHT_DUCKING_STD = 6;
pub const PAN_XHEIGHT_DUCKING_LARGE = 7;
pub const EDS_RAWMODE = 2;
pub const EDS_ROTATEDMODE = 4;
pub const DISPLAY_DEVICE_ATTACHED_TO_DESKTOP = 1;
pub const DISPLAY_DEVICE_MULTI_DRIVER = 2;
pub const DISPLAY_DEVICE_PRIMARY_DEVICE = 4;
pub const DISPLAY_DEVICE_MIRRORING_DRIVER = 8;
pub const DISPLAY_DEVICE_VGA_COMPATIBLE = 16;
pub const DISPLAY_DEVICE_REMOVABLE = 32;
pub const DISPLAY_DEVICE_ACC_DRIVER = 64;
pub const DISPLAY_DEVICE_MODESPRUNED = 134217728;
pub const DISPLAY_DEVICE_RDPUDD = 16777216;
pub const DISPLAY_DEVICE_REMOTE = 67108864;
pub const DISPLAY_DEVICE_DISCONNECT = 33554432;
pub const DISPLAY_DEVICE_TS_COMPATIBLE = 2097152;
pub const DISPLAY_DEVICE_UNSAFE_MODES_ON = 524288;
pub const DISPLAY_DEVICE_ACTIVE = 1;
pub const DISPLAY_DEVICE_ATTACHED = 2;
pub const DISPLAYCONFIG_COLOR_ENCODING_RGB = 0;
pub const DISPLAYCONFIG_COLOR_ENCODING_YCBCR444 = 1;
pub const DISPLAYCONFIG_COLOR_ENCODING_YCBCR422 = 2;
pub const DISPLAYCONFIG_COLOR_ENCODING_YCBCR420 = 3;
pub const DISPLAYCONFIG_COLOR_ENCODING_INTENSITY = 4;
pub const DISPLAYCONFIG_ADVANCED_COLOR_MODE_SDR = 0;
pub const DISPLAYCONFIG_ADVANCED_COLOR_MODE_WCG = 1;
pub const DISPLAYCONFIG_ADVANCED_COLOR_MODE_HDR = 2;

pub const aliases = struct {
    pub const R2_MODE = i32;
    pub const RGN_COMBINE_MODE = i32;
    pub const ETO_OPTIONS = u32;
    pub const OBJ_TYPE = i32;
    pub const DIB_USAGE = u32;
    pub const DRAWEDGE_FLAGS = u32;
    pub const DFC_TYPE = u32;
    pub const DFCS_STATE = u32;
    pub const CDS_TYPE = u32;
    pub const DISP_CHANGE = i32;
    pub const DRAWSTATE_FLAGS = u32;
    pub const REDRAW_WINDOW_FLAGS = u32;
    pub const ENUM_DISPLAY_SETTINGS_MODE = u32;
    pub const TEXT_ALIGN_OPTIONS = u32;
    pub const PEN_STYLE = i32;
    pub const TTEMBED_FLAGS = u32;
    pub const DRAW_TEXT_FORMAT = u32;
    pub const EMBED_FONT_CHARSET = u32;
    pub const GET_DCX_FLAGS = u32;
    pub const GET_GLYPH_OUTLINE_FORMAT = u32;
    pub const SET_BOUNDS_RECT_FLAGS = u32;
    pub const GET_STOCK_OBJECT_FLAGS = i32;
    pub const MODIFY_WORLD_TRANSFORM_MODE = u32;
    pub const FONT_CLIP_PRECISION = u8;
    pub const CREATE_POLYGON_RGN_MODE = i32;
    pub const EMBEDDED_FONT_PRIV_STATUS = u32;
    pub const MONITOR_FROM_FLAGS = u32;
    pub const FONT_RESOURCE_CHARACTERISTICS = u32;
    pub const DC_LAYOUT = u32;
    pub const GET_DEVICE_CAPS_INDEX = u32;
    pub const FONT_OUTPUT_PRECISION = u8;
    pub const FONT_WEIGHT = u32;
    pub const FONT_CHARSET = u8;
    pub const ARC_DIRECTION = i32;
    pub const TTLOAD_EMBEDDED_FONT_STATUS = u32;
    pub const STRETCH_BLT_MODE = i32;
    pub const FONT_QUALITY = u8;
    pub const BACKGROUND_MODE = u32;
    pub const GET_CHARACTER_PLACEMENT_FLAGS = u32;
    pub const DRAW_EDGE_FLAGS = u32;
    pub const SYS_COLOR_INDEX = i32;
    pub const FONT_LICENSE_PRIVS = u32;
    pub const GRADIENT_FILL = u32;
    pub const CREATE_FONT_PACKAGE_SUBSET_ENCODING = i16;
    pub const EXT_FLOOD_FILL_TYPE = u32;
    pub const HATCH_BRUSH_STYLE = i32;
    pub const DRAW_CAPTION_FLAGS = u32;
    pub const SYSTEM_PALETTE_USE = u32;
    pub const GRAPHICS_MODE = i32;
    pub const FONT_PITCH = u8;
    pub const FONT_FAMILY = u8;
    pub const ROP_CODE = u32;
    pub const CREATE_FONT_PACKAGE_SUBSET_PLATFORM = i16;
    pub const HDC_MAP_MODE = i32;
    pub const GDI_REGION_TYPE = i32;
    pub const BRUSH_STYLE = u32;
    pub const TMPF_FLAGS = u8;
    pub const BI_COMPRESSION = u32;
    pub const ENHANCED_METAFILE_RECORD_TYPE = u32;
    pub const DEVMODE_FIELD_FLAGS = u32;
    pub const DEVMODE_COLOR = i16;
    pub const DEVMODE_DUPLEX = i16;
    pub const DEVMODE_COLLATE = i16;
    pub const DEVMODE_DISPLAY_ORIENTATION = u32;
    pub const DEVMODE_DISPLAY_FIXED_OUTPUT = u32;
    pub const DEVMODE_TRUETYPE_OPTION = i16;
    pub const PAN_FAMILY_TYPE = u8;
    pub const PAN_SERIF_STYLE = u8;
    pub const PAN_WEIGHT = u8;
    pub const PAN_STROKE_VARIATION = u8;
    pub const PAN_PROPORTION = u8;
    pub const PAN_CONTRAST = u8;
    pub const PAN_ARM_STYLE = u8;
    pub const PAN_LETT_FORM = u8;
    pub const PAN_MIDLINE = u8;
    pub const PAN_XHEIGHT = u8;
    pub const ENUM_DISPLAY_SETTINGS_FLAGS = u32;
    pub const DISPLAY_DEVICE_STATE_FLAGS = u32;
    pub const DISPLAYCONFIG_COLOR_ENCODING = i32;
    pub const DISPLAYCONFIG_ADVANCED_COLOR_MODE = i32;
    pub const HBITMAP = ?*anyopaque;
    pub const HRGN = ?*anyopaque;
    pub const HPEN = ?*anyopaque;
    pub const HBRUSH = ?*anyopaque;
    pub const HFONT = ?*anyopaque;
    pub const HMETAFILE = ?*anyopaque;
    pub const HENHMETAFILE = ?*anyopaque;
    pub const HPALETTE = ?*anyopaque;
    pub const HDC = ?*anyopaque;
    pub const HGDIOBJ = ?*anyopaque;
    pub const HMONITOR = ?*anyopaque;
};
