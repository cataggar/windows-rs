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
    .{ "GdipAlloc", MethodRecord{ .library = "gdiplus", .import = "GdipAlloc", .signature = "\x00\x01\x0f\x01\x19" } },
    .{ "GdipFree", MethodRecord{ .library = "gdiplus", .import = "GdipFree", .signature = "\x00\x01\x01\x0f\x01" } },
    .{ "GdiplusStartup", MethodRecord{ .library = "gdiplus", .import = "GdiplusStartup", .signature = "\x00\x03\x11\xae\x29\x0f\x19\x0f\x11\xae\x2d\x0f\x11\xae\x31" } },
    .{ "GdiplusShutdown", MethodRecord{ .library = "gdiplus", .import = "GdiplusShutdown", .signature = "\x00\x01\x01\x19" } },
    .{ "GdipCreateEffect", MethodRecord{ .library = "gdiplus", .import = "GdipCreateEffect", .signature = "\x00\x02\x11\xae\x29\x11\x0d\x0f\x0f\x11\xae\x35" } },
    .{ "GdipDeleteEffect", MethodRecord{ .library = "gdiplus", .import = "GdipDeleteEffect", .signature = "\x00\x01\x11\xae\x29\x0f\x11\xae\x35" } },
    .{ "GdipGetEffectParameterSize", MethodRecord{ .library = "gdiplus", .import = "GdipGetEffectParameterSize", .signature = "\x00\x02\x11\xae\x29\x0f\x11\xae\x35\x0f\x09" } },
    .{ "GdipSetEffectParameters", MethodRecord{ .library = "gdiplus", .import = "GdipSetEffectParameters", .signature = "\x00\x03\x11\xae\x29\x0f\x11\xae\x35\x0f\x01\x09" } },
    .{ "GdipGetEffectParameters", MethodRecord{ .library = "gdiplus", .import = "GdipGetEffectParameters", .signature = "\x00\x03\x11\xae\x29\x0f\x11\xae\x35\x0f\x09\x0f\x01" } },
    .{ "GdipCreatePath", MethodRecord{ .library = "gdiplus", .import = "GdipCreatePath", .signature = "\x00\x02\x11\xae\x29\x11\xae\x39\x0f\x0f\x11\x82\x10" } },
    .{ "GdipCreatePath2", MethodRecord{ .library = "gdiplus", .import = "GdipCreatePath2", .signature = "\x00\x05\x11\xae\x29\x0f\x11\xae\x3d\x0f\x05\x08\x11\xae\x39\x0f\x0f\x11\x82\x10" } },
    .{ "GdipCreatePath2I", MethodRecord{ .library = "gdiplus", .import = "GdipCreatePath2I", .signature = "\x00\x05\x11\xae\x29\x0f\x11\xae\x41\x0f\x05\x08\x11\xae\x39\x0f\x0f\x11\x82\x10" } },
    .{ "GdipClonePath", MethodRecord{ .library = "gdiplus", .import = "GdipClonePath", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x10\x0f\x0f\x11\x82\x10" } },
    .{ "GdipDeletePath", MethodRecord{ .library = "gdiplus", .import = "GdipDeletePath", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x10" } },
    .{ "GdipResetPath", MethodRecord{ .library = "gdiplus", .import = "GdipResetPath", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x10" } },
    .{ "GdipGetPointCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetPointCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x10\x0f\x08" } },
    .{ "GdipGetPathTypes", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathTypes", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x05\x08" } },
    .{ "GdipGetPathPoints", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathPoints", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x3d\x08" } },
    .{ "GdipGetPathPointsI", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathPointsI", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x41\x08" } },
    .{ "GdipGetPathFillMode", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathFillMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x39" } },
    .{ "GdipSetPathFillMode", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathFillMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x10\x11\xae\x39" } },
    .{ "GdipGetPathData", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathData", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x45" } },
    .{ "GdipStartPathFigure", MethodRecord{ .library = "gdiplus", .import = "GdipStartPathFigure", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x10" } },
    .{ "GdipClosePathFigure", MethodRecord{ .library = "gdiplus", .import = "GdipClosePathFigure", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x10" } },
    .{ "GdipClosePathFigures", MethodRecord{ .library = "gdiplus", .import = "GdipClosePathFigures", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x10" } },
    .{ "GdipSetPathMarker", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathMarker", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x10" } },
    .{ "GdipClearPathMarkers", MethodRecord{ .library = "gdiplus", .import = "GdipClearPathMarkers", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x10" } },
    .{ "GdipReversePath", MethodRecord{ .library = "gdiplus", .import = "GdipReversePath", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x10" } },
    .{ "GdipGetPathLastPoint", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathLastPoint", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x3d" } },
    .{ "GdipAddPathLine", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathLine", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x10\x0c\x0c\x0c\x0c" } },
    .{ "GdipAddPathLine2", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathLine2", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x3d\x08" } },
    .{ "GdipAddPathArc", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathArc", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x82\x10\x0c\x0c\x0c\x0c\x0c\x0c" } },
    .{ "GdipAddPathBezier", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathBezier", .signature = "\x00\x09\x11\xae\x29\x0f\x11\x82\x10\x0c\x0c\x0c\x0c\x0c\x0c\x0c\x0c" } },
    .{ "GdipAddPathBeziers", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathBeziers", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x3d\x08" } },
    .{ "GdipAddPathCurve", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathCurve", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x3d\x08" } },
    .{ "GdipAddPathCurve2", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathCurve2", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x3d\x08\x0c" } },
    .{ "GdipAddPathCurve3", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathCurve3", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x3d\x08\x08\x08\x0c" } },
    .{ "GdipAddPathClosedCurve", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathClosedCurve", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x3d\x08" } },
    .{ "GdipAddPathClosedCurve2", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathClosedCurve2", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x3d\x08\x0c" } },
    .{ "GdipAddPathRectangle", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathRectangle", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x10\x0c\x0c\x0c\x0c" } },
    .{ "GdipAddPathRectangles", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathRectangles", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x49\x08" } },
    .{ "GdipAddPathEllipse", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathEllipse", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x10\x0c\x0c\x0c\x0c" } },
    .{ "GdipAddPathPie", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathPie", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x82\x10\x0c\x0c\x0c\x0c\x0c\x0c" } },
    .{ "GdipAddPathPolygon", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathPolygon", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x3d\x08" } },
    .{ "GdipAddPathPath", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathPath", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\x82\x10\x11\x59" } },
    .{ "GdipAddPathString", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathString", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x82\x10\x11\x05\x08\x0f\x11\x82\x1c\x08\x0c\x0f\x11\xae\x49\x0f\x11\x82\x24" } },
    .{ "GdipAddPathStringI", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathStringI", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x82\x10\x11\x05\x08\x0f\x11\x82\x1c\x08\x0c\x0f\x11\xae\x4d\x0f\x11\x82\x24" } },
    .{ "GdipAddPathLineI", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathLineI", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x10\x08\x08\x08\x08" } },
    .{ "GdipAddPathLine2I", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathLine2I", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x41\x08" } },
    .{ "GdipAddPathArcI", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathArcI", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x82\x10\x08\x08\x08\x08\x0c\x0c" } },
    .{ "GdipAddPathBezierI", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathBezierI", .signature = "\x00\x09\x11\xae\x29\x0f\x11\x82\x10\x08\x08\x08\x08\x08\x08\x08\x08" } },
    .{ "GdipAddPathBeziersI", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathBeziersI", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x41\x08" } },
    .{ "GdipAddPathCurveI", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathCurveI", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x41\x08" } },
    .{ "GdipAddPathCurve2I", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathCurve2I", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x41\x08\x0c" } },
    .{ "GdipAddPathCurve3I", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathCurve3I", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x41\x08\x08\x08\x0c" } },
    .{ "GdipAddPathClosedCurveI", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathClosedCurveI", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x41\x08" } },
    .{ "GdipAddPathClosedCurve2I", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathClosedCurve2I", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x41\x08\x0c" } },
    .{ "GdipAddPathRectangleI", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathRectangleI", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x10\x08\x08\x08\x08" } },
    .{ "GdipAddPathRectanglesI", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathRectanglesI", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x4d\x08" } },
    .{ "GdipAddPathEllipseI", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathEllipseI", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x10\x08\x08\x08\x08" } },
    .{ "GdipAddPathPieI", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathPieI", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x82\x10\x08\x08\x08\x08\x0c\x0c" } },
    .{ "GdipAddPathPolygonI", MethodRecord{ .library = "gdiplus", .import = "GdipAddPathPolygonI", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x41\x08" } },
    .{ "GdipFlattenPath", MethodRecord{ .library = "gdiplus", .import = "GdipFlattenPath", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x51\x0c" } },
    .{ "GdipWindingModeOutline", MethodRecord{ .library = "gdiplus", .import = "GdipWindingModeOutline", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x51\x0c" } },
    .{ "GdipWidenPath", MethodRecord{ .library = "gdiplus", .import = "GdipWidenPath", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\x81\xf4\x0f\x11\xae\x51\x0c" } },
    .{ "GdipWarpPath", MethodRecord{ .library = "gdiplus", .import = "GdipWarpPath", .signature = "\x00\x0a\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x51\x0f\x11\xae\x3d\x08\x0c\x0c\x0c\x0c\x11\xae\x55\x0c" } },
    .{ "GdipTransformPath", MethodRecord{ .library = "gdiplus", .import = "GdipTransformPath", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x51" } },
    .{ "GdipGetPathWorldBounds", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathWorldBounds", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x49\x0f\x11\xae\x51\x0f\x11\x81\xf4" } },
    .{ "GdipGetPathWorldBoundsI", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathWorldBoundsI", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\xae\x4d\x0f\x11\xae\x51\x0f\x11\x81\xf4" } },
    .{ "GdipIsVisiblePathPoint", MethodRecord{ .library = "gdiplus", .import = "GdipIsVisiblePathPoint", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x10\x0c\x0c\x0f\x11\x81\xd8\x0f\x11\x59" } },
    .{ "GdipIsVisiblePathPointI", MethodRecord{ .library = "gdiplus", .import = "GdipIsVisiblePathPointI", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x10\x08\x08\x0f\x11\x81\xd8\x0f\x11\x59" } },
    .{ "GdipIsOutlineVisiblePathPoint", MethodRecord{ .library = "gdiplus", .import = "GdipIsOutlineVisiblePathPoint", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x82\x10\x0c\x0c\x0f\x11\x81\xf4\x0f\x11\x81\xd8\x0f\x11\x59" } },
    .{ "GdipIsOutlineVisiblePathPointI", MethodRecord{ .library = "gdiplus", .import = "GdipIsOutlineVisiblePathPointI", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x82\x10\x08\x08\x0f\x11\x81\xf4\x0f\x11\x81\xd8\x0f\x11\x59" } },
    .{ "GdipCreatePathIter", MethodRecord{ .library = "gdiplus", .import = "GdipCreatePathIter", .signature = "\x00\x02\x11\xae\x29\x0f\x0f\x11\x82\x18\x0f\x11\x82\x10" } },
    .{ "GdipDeletePathIter", MethodRecord{ .library = "gdiplus", .import = "GdipDeletePathIter", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x18" } },
    .{ "GdipPathIterNextSubpath", MethodRecord{ .library = "gdiplus", .import = "GdipPathIterNextSubpath", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x18\x0f\x08\x0f\x08\x0f\x08\x0f\x11\x59" } },
    .{ "GdipPathIterNextSubpathPath", MethodRecord{ .library = "gdiplus", .import = "GdipPathIterNextSubpathPath", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x18\x0f\x08\x0f\x11\x82\x10\x0f\x11\x59" } },
    .{ "GdipPathIterNextPathType", MethodRecord{ .library = "gdiplus", .import = "GdipPathIterNextPathType", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x18\x0f\x08\x0f\x05\x0f\x08\x0f\x08" } },
    .{ "GdipPathIterNextMarker", MethodRecord{ .library = "gdiplus", .import = "GdipPathIterNextMarker", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x18\x0f\x08\x0f\x08\x0f\x08" } },
    .{ "GdipPathIterNextMarkerPath", MethodRecord{ .library = "gdiplus", .import = "GdipPathIterNextMarkerPath", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x18\x0f\x08\x0f\x11\x82\x10" } },
    .{ "GdipPathIterGetCount", MethodRecord{ .library = "gdiplus", .import = "GdipPathIterGetCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x18\x0f\x08" } },
    .{ "GdipPathIterGetSubpathCount", MethodRecord{ .library = "gdiplus", .import = "GdipPathIterGetSubpathCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x18\x0f\x08" } },
    .{ "GdipPathIterIsValid", MethodRecord{ .library = "gdiplus", .import = "GdipPathIterIsValid", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x18\x0f\x11\x59" } },
    .{ "GdipPathIterHasCurve", MethodRecord{ .library = "gdiplus", .import = "GdipPathIterHasCurve", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x18\x0f\x11\x59" } },
    .{ "GdipPathIterRewind", MethodRecord{ .library = "gdiplus", .import = "GdipPathIterRewind", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x18" } },
    .{ "GdipPathIterEnumerate", MethodRecord{ .library = "gdiplus", .import = "GdipPathIterEnumerate", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x18\x0f\x08\x0f\x11\xae\x3d\x0f\x05\x08" } },
    .{ "GdipPathIterCopyData", MethodRecord{ .library = "gdiplus", .import = "GdipPathIterCopyData", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x82\x18\x0f\x08\x0f\x11\xae\x3d\x0f\x05\x08\x08" } },
    .{ "GdipCreateMatrix", MethodRecord{ .library = "gdiplus", .import = "GdipCreateMatrix", .signature = "\x00\x01\x11\xae\x29\x0f\x0f\x11\xae\x51" } },
    .{ "GdipCreateMatrix2", MethodRecord{ .library = "gdiplus", .import = "GdipCreateMatrix2", .signature = "\x00\x07\x11\xae\x29\x0c\x0c\x0c\x0c\x0c\x0c\x0f\x0f\x11\xae\x51" } },
    .{ "GdipCreateMatrix3", MethodRecord{ .library = "gdiplus", .import = "GdipCreateMatrix3", .signature = "\x00\x03\x11\xae\x29\x0f\x11\xae\x49\x0f\x11\xae\x3d\x0f\x0f\x11\xae\x51" } },
    .{ "GdipCreateMatrix3I", MethodRecord{ .library = "gdiplus", .import = "GdipCreateMatrix3I", .signature = "\x00\x03\x11\xae\x29\x0f\x11\xae\x4d\x0f\x11\xae\x41\x0f\x0f\x11\xae\x51" } },
    .{ "GdipCloneMatrix", MethodRecord{ .library = "gdiplus", .import = "GdipCloneMatrix", .signature = "\x00\x02\x11\xae\x29\x0f\x11\xae\x51\x0f\x0f\x11\xae\x51" } },
    .{ "GdipDeleteMatrix", MethodRecord{ .library = "gdiplus", .import = "GdipDeleteMatrix", .signature = "\x00\x01\x11\xae\x29\x0f\x11\xae\x51" } },
    .{ "GdipSetMatrixElements", MethodRecord{ .library = "gdiplus", .import = "GdipSetMatrixElements", .signature = "\x00\x07\x11\xae\x29\x0f\x11\xae\x51\x0c\x0c\x0c\x0c\x0c\x0c" } },
    .{ "GdipMultiplyMatrix", MethodRecord{ .library = "gdiplus", .import = "GdipMultiplyMatrix", .signature = "\x00\x03\x11\xae\x29\x0f\x11\xae\x51\x0f\x11\xae\x51\x11\xae\x59" } },
    .{ "GdipTranslateMatrix", MethodRecord{ .library = "gdiplus", .import = "GdipTranslateMatrix", .signature = "\x00\x04\x11\xae\x29\x0f\x11\xae\x51\x0c\x0c\x11\xae\x59" } },
    .{ "GdipScaleMatrix", MethodRecord{ .library = "gdiplus", .import = "GdipScaleMatrix", .signature = "\x00\x04\x11\xae\x29\x0f\x11\xae\x51\x0c\x0c\x11\xae\x59" } },
    .{ "GdipRotateMatrix", MethodRecord{ .library = "gdiplus", .import = "GdipRotateMatrix", .signature = "\x00\x03\x11\xae\x29\x0f\x11\xae\x51\x0c\x11\xae\x59" } },
    .{ "GdipShearMatrix", MethodRecord{ .library = "gdiplus", .import = "GdipShearMatrix", .signature = "\x00\x04\x11\xae\x29\x0f\x11\xae\x51\x0c\x0c\x11\xae\x59" } },
    .{ "GdipInvertMatrix", MethodRecord{ .library = "gdiplus", .import = "GdipInvertMatrix", .signature = "\x00\x01\x11\xae\x29\x0f\x11\xae\x51" } },
    .{ "GdipTransformMatrixPoints", MethodRecord{ .library = "gdiplus", .import = "GdipTransformMatrixPoints", .signature = "\x00\x03\x11\xae\x29\x0f\x11\xae\x51\x0f\x11\xae\x3d\x08" } },
    .{ "GdipTransformMatrixPointsI", MethodRecord{ .library = "gdiplus", .import = "GdipTransformMatrixPointsI", .signature = "\x00\x03\x11\xae\x29\x0f\x11\xae\x51\x0f\x11\xae\x41\x08" } },
    .{ "GdipVectorTransformMatrixPoints", MethodRecord{ .library = "gdiplus", .import = "GdipVectorTransformMatrixPoints", .signature = "\x00\x03\x11\xae\x29\x0f\x11\xae\x51\x0f\x11\xae\x3d\x08" } },
    .{ "GdipVectorTransformMatrixPointsI", MethodRecord{ .library = "gdiplus", .import = "GdipVectorTransformMatrixPointsI", .signature = "\x00\x03\x11\xae\x29\x0f\x11\xae\x51\x0f\x11\xae\x41\x08" } },
    .{ "GdipGetMatrixElements", MethodRecord{ .library = "gdiplus", .import = "GdipGetMatrixElements", .signature = "\x00\x02\x11\xae\x29\x0f\x11\xae\x51\x0f\x0c" } },
    .{ "GdipIsMatrixInvertible", MethodRecord{ .library = "gdiplus", .import = "GdipIsMatrixInvertible", .signature = "\x00\x02\x11\xae\x29\x0f\x11\xae\x51\x0f\x11\x59" } },
    .{ "GdipIsMatrixIdentity", MethodRecord{ .library = "gdiplus", .import = "GdipIsMatrixIdentity", .signature = "\x00\x02\x11\xae\x29\x0f\x11\xae\x51\x0f\x11\x59" } },
    .{ "GdipIsMatrixEqual", MethodRecord{ .library = "gdiplus", .import = "GdipIsMatrixEqual", .signature = "\x00\x03\x11\xae\x29\x0f\x11\xae\x51\x0f\x11\xae\x51\x0f\x11\x59" } },
    .{ "GdipCreateRegion", MethodRecord{ .library = "gdiplus", .import = "GdipCreateRegion", .signature = "\x00\x01\x11\xae\x29\x0f\x0f\x11\x82\x14" } },
    .{ "GdipCreateRegionRect", MethodRecord{ .library = "gdiplus", .import = "GdipCreateRegionRect", .signature = "\x00\x02\x11\xae\x29\x0f\x11\xae\x49\x0f\x0f\x11\x82\x14" } },
    .{ "GdipCreateRegionRectI", MethodRecord{ .library = "gdiplus", .import = "GdipCreateRegionRectI", .signature = "\x00\x02\x11\xae\x29\x0f\x11\xae\x4d\x0f\x0f\x11\x82\x14" } },
    .{ "GdipCreateRegionPath", MethodRecord{ .library = "gdiplus", .import = "GdipCreateRegionPath", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x10\x0f\x0f\x11\x82\x14" } },
    .{ "GdipCreateRegionRgnData", MethodRecord{ .library = "gdiplus", .import = "GdipCreateRegionRgnData", .signature = "\x00\x03\x11\xae\x29\x0f\x05\x08\x0f\x0f\x11\x82\x14" } },
    .{ "GdipCreateRegionHrgn", MethodRecord{ .library = "gdiplus", .import = "GdipCreateRegionHrgn", .signature = "\x00\x02\x11\xae\x29\x11\x83\xe1\x0f\x0f\x11\x82\x14" } },
    .{ "GdipCloneRegion", MethodRecord{ .library = "gdiplus", .import = "GdipCloneRegion", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x14\x0f\x0f\x11\x82\x14" } },
    .{ "GdipDeleteRegion", MethodRecord{ .library = "gdiplus", .import = "GdipDeleteRegion", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x14" } },
    .{ "GdipSetInfinite", MethodRecord{ .library = "gdiplus", .import = "GdipSetInfinite", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x14" } },
    .{ "GdipSetEmpty", MethodRecord{ .library = "gdiplus", .import = "GdipSetEmpty", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x14" } },
    .{ "GdipCombineRegionRect", MethodRecord{ .library = "gdiplus", .import = "GdipCombineRegionRect", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x14\x0f\x11\xae\x49\x11\xae\x5d" } },
    .{ "GdipCombineRegionRectI", MethodRecord{ .library = "gdiplus", .import = "GdipCombineRegionRectI", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x14\x0f\x11\xae\x4d\x11\xae\x5d" } },
    .{ "GdipCombineRegionPath", MethodRecord{ .library = "gdiplus", .import = "GdipCombineRegionPath", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x14\x0f\x11\x82\x10\x11\xae\x5d" } },
    .{ "GdipCombineRegionRegion", MethodRecord{ .library = "gdiplus", .import = "GdipCombineRegionRegion", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x14\x0f\x11\x82\x14\x11\xae\x5d" } },
    .{ "GdipTranslateRegion", MethodRecord{ .library = "gdiplus", .import = "GdipTranslateRegion", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x14\x0c\x0c" } },
    .{ "GdipTranslateRegionI", MethodRecord{ .library = "gdiplus", .import = "GdipTranslateRegionI", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x14\x08\x08" } },
    .{ "GdipTransformRegion", MethodRecord{ .library = "gdiplus", .import = "GdipTransformRegion", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x14\x0f\x11\xae\x51" } },
    .{ "GdipGetRegionBounds", MethodRecord{ .library = "gdiplus", .import = "GdipGetRegionBounds", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x14\x0f\x11\x81\xd8\x0f\x11\xae\x49" } },
    .{ "GdipGetRegionBoundsI", MethodRecord{ .library = "gdiplus", .import = "GdipGetRegionBoundsI", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x14\x0f\x11\x81\xd8\x0f\x11\xae\x4d" } },
    .{ "GdipGetRegionHRgn", MethodRecord{ .library = "gdiplus", .import = "GdipGetRegionHRgn", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x14\x0f\x11\x81\xd8\x0f\x11\x83\xe1" } },
    .{ "GdipIsEmptyRegion", MethodRecord{ .library = "gdiplus", .import = "GdipIsEmptyRegion", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x14\x0f\x11\x81\xd8\x0f\x11\x59" } },
    .{ "GdipIsInfiniteRegion", MethodRecord{ .library = "gdiplus", .import = "GdipIsInfiniteRegion", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x14\x0f\x11\x81\xd8\x0f\x11\x59" } },
    .{ "GdipIsEqualRegion", MethodRecord{ .library = "gdiplus", .import = "GdipIsEqualRegion", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x14\x0f\x11\x82\x14\x0f\x11\x81\xd8\x0f\x11\x59" } },
    .{ "GdipGetRegionDataSize", MethodRecord{ .library = "gdiplus", .import = "GdipGetRegionDataSize", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x14\x0f\x09" } },
    .{ "GdipGetRegionData", MethodRecord{ .library = "gdiplus", .import = "GdipGetRegionData", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x14\x0f\x05\x09\x0f\x09" } },
    .{ "GdipIsVisibleRegionPoint", MethodRecord{ .library = "gdiplus", .import = "GdipIsVisibleRegionPoint", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x14\x0c\x0c\x0f\x11\x81\xd8\x0f\x11\x59" } },
    .{ "GdipIsVisibleRegionPointI", MethodRecord{ .library = "gdiplus", .import = "GdipIsVisibleRegionPointI", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x14\x08\x08\x0f\x11\x81\xd8\x0f\x11\x59" } },
    .{ "GdipIsVisibleRegionRect", MethodRecord{ .library = "gdiplus", .import = "GdipIsVisibleRegionRect", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x82\x14\x0c\x0c\x0c\x0c\x0f\x11\x81\xd8\x0f\x11\x59" } },
    .{ "GdipIsVisibleRegionRectI", MethodRecord{ .library = "gdiplus", .import = "GdipIsVisibleRegionRectI", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x82\x14\x08\x08\x08\x08\x0f\x11\x81\xd8\x0f\x11\x59" } },
    .{ "GdipGetRegionScansCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetRegionScansCount", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x14\x0f\x09\x0f\x11\xae\x51" } },
    .{ "GdipGetRegionScans", MethodRecord{ .library = "gdiplus", .import = "GdipGetRegionScans", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x14\x0f\x11\xae\x49\x0f\x08\x0f\x11\xae\x51" } },
    .{ "GdipGetRegionScansI", MethodRecord{ .library = "gdiplus", .import = "GdipGetRegionScansI", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x14\x0f\x11\xae\x4d\x0f\x08\x0f\x11\xae\x51" } },
    .{ "GdipCloneBrush", MethodRecord{ .library = "gdiplus", .import = "GdipCloneBrush", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xdc\x0f\x0f\x11\x81\xdc" } },
    .{ "GdipDeleteBrush", MethodRecord{ .library = "gdiplus", .import = "GdipDeleteBrush", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x81\xdc" } },
    .{ "GdipGetBrushType", MethodRecord{ .library = "gdiplus", .import = "GdipGetBrushType", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xdc\x0f\x11\xae\x61" } },
    .{ "GdipCreateHatchBrush", MethodRecord{ .library = "gdiplus", .import = "GdipCreateHatchBrush", .signature = "\x00\x04\x11\xae\x29\x11\xae\x65\x09\x09\x0f\x0f\x11\x81\xf0" } },
    .{ "GdipGetHatchStyle", MethodRecord{ .library = "gdiplus", .import = "GdipGetHatchStyle", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf0\x0f\x11\xae\x65" } },
    .{ "GdipGetHatchForegroundColor", MethodRecord{ .library = "gdiplus", .import = "GdipGetHatchForegroundColor", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf0\x0f\x09" } },
    .{ "GdipGetHatchBackgroundColor", MethodRecord{ .library = "gdiplus", .import = "GdipGetHatchBackgroundColor", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf0\x0f\x09" } },
    .{ "GdipCreateTexture", MethodRecord{ .library = "gdiplus", .import = "GdipCreateTexture", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x00\x11\xae\x69\x0f\x0f\x11\x81\xe0" } },
    .{ "GdipCreateTexture2", MethodRecord{ .library = "gdiplus", .import = "GdipCreateTexture2", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x82\x00\x11\xae\x69\x0c\x0c\x0c\x0c\x0f\x0f\x11\x81\xe0" } },
    .{ "GdipCreateTextureIA", MethodRecord{ .library = "gdiplus", .import = "GdipCreateTextureIA", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\x82\x0c\x0c\x0c\x0c\x0c\x0f\x0f\x11\x81\xe0" } },
    .{ "GdipCreateTexture2I", MethodRecord{ .library = "gdiplus", .import = "GdipCreateTexture2I", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x82\x00\x11\xae\x69\x08\x08\x08\x08\x0f\x0f\x11\x81\xe0" } },
    .{ "GdipCreateTextureIAI", MethodRecord{ .library = "gdiplus", .import = "GdipCreateTextureIAI", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\x82\x0c\x08\x08\x08\x08\x0f\x0f\x11\x81\xe0" } },
    .{ "GdipGetTextureTransform", MethodRecord{ .library = "gdiplus", .import = "GdipGetTextureTransform", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe0\x0f\x11\xae\x51" } },
    .{ "GdipSetTextureTransform", MethodRecord{ .library = "gdiplus", .import = "GdipSetTextureTransform", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe0\x0f\x11\xae\x51" } },
    .{ "GdipResetTextureTransform", MethodRecord{ .library = "gdiplus", .import = "GdipResetTextureTransform", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x81\xe0" } },
    .{ "GdipMultiplyTextureTransform", MethodRecord{ .library = "gdiplus", .import = "GdipMultiplyTextureTransform", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xe0\x0f\x11\xae\x51\x11\xae\x59" } },
    .{ "GdipTranslateTextureTransform", MethodRecord{ .library = "gdiplus", .import = "GdipTranslateTextureTransform", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xe0\x0c\x0c\x11\xae\x59" } },
    .{ "GdipScaleTextureTransform", MethodRecord{ .library = "gdiplus", .import = "GdipScaleTextureTransform", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xe0\x0c\x0c\x11\xae\x59" } },
    .{ "GdipRotateTextureTransform", MethodRecord{ .library = "gdiplus", .import = "GdipRotateTextureTransform", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xe0\x0c\x11\xae\x59" } },
    .{ "GdipSetTextureWrapMode", MethodRecord{ .library = "gdiplus", .import = "GdipSetTextureWrapMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe0\x11\xae\x69" } },
    .{ "GdipGetTextureWrapMode", MethodRecord{ .library = "gdiplus", .import = "GdipGetTextureWrapMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe0\x0f\x11\xae\x69" } },
    .{ "GdipGetTextureImage", MethodRecord{ .library = "gdiplus", .import = "GdipGetTextureImage", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe0\x0f\x0f\x11\x82\x00" } },
    .{ "GdipCreateSolidFill", MethodRecord{ .library = "gdiplus", .import = "GdipCreateSolidFill", .signature = "\x00\x02\x11\xae\x29\x09\x0f\x0f\x11\x81\xe4" } },
    .{ "GdipSetSolidFillColor", MethodRecord{ .library = "gdiplus", .import = "GdipSetSolidFillColor", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe4\x09" } },
    .{ "GdipGetSolidFillColor", MethodRecord{ .library = "gdiplus", .import = "GdipGetSolidFillColor", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe4\x0f\x09" } },
    .{ "GdipCreateLineBrush", MethodRecord{ .library = "gdiplus", .import = "GdipCreateLineBrush", .signature = "\x00\x06\x11\xae\x29\x0f\x11\xae\x3d\x0f\x11\xae\x3d\x09\x09\x11\xae\x69\x0f\x0f\x11\x81\xe8" } },
    .{ "GdipCreateLineBrushI", MethodRecord{ .library = "gdiplus", .import = "GdipCreateLineBrushI", .signature = "\x00\x06\x11\xae\x29\x0f\x11\xae\x41\x0f\x11\xae\x41\x09\x09\x11\xae\x69\x0f\x0f\x11\x81\xe8" } },
    .{ "GdipCreateLineBrushFromRect", MethodRecord{ .library = "gdiplus", .import = "GdipCreateLineBrushFromRect", .signature = "\x00\x06\x11\xae\x29\x0f\x11\xae\x49\x09\x09\x11\xae\x6d\x11\xae\x69\x0f\x0f\x11\x81\xe8" } },
    .{ "GdipCreateLineBrushFromRectI", MethodRecord{ .library = "gdiplus", .import = "GdipCreateLineBrushFromRectI", .signature = "\x00\x06\x11\xae\x29\x0f\x11\xae\x4d\x09\x09\x11\xae\x6d\x11\xae\x69\x0f\x0f\x11\x81\xe8" } },
    .{ "GdipCreateLineBrushFromRectWithAngle", MethodRecord{ .library = "gdiplus", .import = "GdipCreateLineBrushFromRectWithAngle", .signature = "\x00\x07\x11\xae\x29\x0f\x11\xae\x49\x09\x09\x0c\x11\x59\x11\xae\x69\x0f\x0f\x11\x81\xe8" } },
    .{ "GdipCreateLineBrushFromRectWithAngleI", MethodRecord{ .library = "gdiplus", .import = "GdipCreateLineBrushFromRectWithAngleI", .signature = "\x00\x07\x11\xae\x29\x0f\x11\xae\x4d\x09\x09\x0c\x11\x59\x11\xae\x69\x0f\x0f\x11\x81\xe8" } },
    .{ "GdipSetLineColors", MethodRecord{ .library = "gdiplus", .import = "GdipSetLineColors", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xe8\x09\x09" } },
    .{ "GdipGetLineColors", MethodRecord{ .library = "gdiplus", .import = "GdipGetLineColors", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe8\x0f\x09" } },
    .{ "GdipGetLineRect", MethodRecord{ .library = "gdiplus", .import = "GdipGetLineRect", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe8\x0f\x11\xae\x49" } },
    .{ "GdipGetLineRectI", MethodRecord{ .library = "gdiplus", .import = "GdipGetLineRectI", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe8\x0f\x11\xae\x4d" } },
    .{ "GdipSetLineGammaCorrection", MethodRecord{ .library = "gdiplus", .import = "GdipSetLineGammaCorrection", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe8\x11\x59" } },
    .{ "GdipGetLineGammaCorrection", MethodRecord{ .library = "gdiplus", .import = "GdipGetLineGammaCorrection", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe8\x0f\x11\x59" } },
    .{ "GdipGetLineBlendCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetLineBlendCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe8\x0f\x08" } },
    .{ "GdipGetLineBlend", MethodRecord{ .library = "gdiplus", .import = "GdipGetLineBlend", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xe8\x0f\x0c\x0f\x0c\x08" } },
    .{ "GdipSetLineBlend", MethodRecord{ .library = "gdiplus", .import = "GdipSetLineBlend", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xe8\x0f\x0c\x0f\x0c\x08" } },
    .{ "GdipGetLinePresetBlendCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetLinePresetBlendCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe8\x0f\x08" } },
    .{ "GdipGetLinePresetBlend", MethodRecord{ .library = "gdiplus", .import = "GdipGetLinePresetBlend", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xe8\x0f\x09\x0f\x0c\x08" } },
    .{ "GdipSetLinePresetBlend", MethodRecord{ .library = "gdiplus", .import = "GdipSetLinePresetBlend", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xe8\x0f\x09\x0f\x0c\x08" } },
    .{ "GdipSetLineSigmaBlend", MethodRecord{ .library = "gdiplus", .import = "GdipSetLineSigmaBlend", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xe8\x0c\x0c" } },
    .{ "GdipSetLineLinearBlend", MethodRecord{ .library = "gdiplus", .import = "GdipSetLineLinearBlend", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xe8\x0c\x0c" } },
    .{ "GdipSetLineWrapMode", MethodRecord{ .library = "gdiplus", .import = "GdipSetLineWrapMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe8\x11\xae\x69" } },
    .{ "GdipGetLineWrapMode", MethodRecord{ .library = "gdiplus", .import = "GdipGetLineWrapMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe8\x0f\x11\xae\x69" } },
    .{ "GdipGetLineTransform", MethodRecord{ .library = "gdiplus", .import = "GdipGetLineTransform", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe8\x0f\x11\xae\x51" } },
    .{ "GdipSetLineTransform", MethodRecord{ .library = "gdiplus", .import = "GdipSetLineTransform", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xe8\x0f\x11\xae\x51" } },
    .{ "GdipResetLineTransform", MethodRecord{ .library = "gdiplus", .import = "GdipResetLineTransform", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x81\xe8" } },
    .{ "GdipMultiplyLineTransform", MethodRecord{ .library = "gdiplus", .import = "GdipMultiplyLineTransform", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xe8\x0f\x11\xae\x51\x11\xae\x59" } },
    .{ "GdipTranslateLineTransform", MethodRecord{ .library = "gdiplus", .import = "GdipTranslateLineTransform", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xe8\x0c\x0c\x11\xae\x59" } },
    .{ "GdipScaleLineTransform", MethodRecord{ .library = "gdiplus", .import = "GdipScaleLineTransform", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xe8\x0c\x0c\x11\xae\x59" } },
    .{ "GdipRotateLineTransform", MethodRecord{ .library = "gdiplus", .import = "GdipRotateLineTransform", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xe8\x0c\x11\xae\x59" } },
    .{ "GdipCreatePathGradient", MethodRecord{ .library = "gdiplus", .import = "GdipCreatePathGradient", .signature = "\x00\x04\x11\xae\x29\x0f\x11\xae\x3d\x08\x11\xae\x69\x0f\x0f\x11\x81\xec" } },
    .{ "GdipCreatePathGradientI", MethodRecord{ .library = "gdiplus", .import = "GdipCreatePathGradientI", .signature = "\x00\x04\x11\xae\x29\x0f\x11\xae\x41\x08\x11\xae\x69\x0f\x0f\x11\x81\xec" } },
    .{ "GdipCreatePathGradientFromPath", MethodRecord{ .library = "gdiplus", .import = "GdipCreatePathGradientFromPath", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x10\x0f\x0f\x11\x81\xec" } },
    .{ "GdipGetPathGradientCenterColor", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientCenterColor", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x09" } },
    .{ "GdipSetPathGradientCenterColor", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathGradientCenterColor", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x09" } },
    .{ "GdipGetPathGradientSurroundColorsWithCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientSurroundColorsWithCount", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xec\x0f\x09\x0f\x08" } },
    .{ "GdipSetPathGradientSurroundColorsWithCount", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathGradientSurroundColorsWithCount", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xec\x0f\x09\x0f\x08" } },
    .{ "GdipGetPathGradientPath", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientPath", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x11\x82\x10" } },
    .{ "GdipSetPathGradientPath", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathGradientPath", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x11\x82\x10" } },
    .{ "GdipGetPathGradientCenterPoint", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientCenterPoint", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x11\xae\x3d" } },
    .{ "GdipGetPathGradientCenterPointI", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientCenterPointI", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x11\xae\x41" } },
    .{ "GdipSetPathGradientCenterPoint", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathGradientCenterPoint", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x11\xae\x3d" } },
    .{ "GdipSetPathGradientCenterPointI", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathGradientCenterPointI", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x11\xae\x41" } },
    .{ "GdipGetPathGradientRect", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientRect", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x11\xae\x49" } },
    .{ "GdipGetPathGradientRectI", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientRectI", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x11\xae\x4d" } },
    .{ "GdipGetPathGradientPointCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientPointCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x08" } },
    .{ "GdipGetPathGradientSurroundColorCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientSurroundColorCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x08" } },
    .{ "GdipSetPathGradientGammaCorrection", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathGradientGammaCorrection", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x11\x59" } },
    .{ "GdipGetPathGradientGammaCorrection", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientGammaCorrection", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x11\x59" } },
    .{ "GdipGetPathGradientBlendCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientBlendCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x08" } },
    .{ "GdipGetPathGradientBlend", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientBlend", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xec\x0f\x0c\x0f\x0c\x08" } },
    .{ "GdipSetPathGradientBlend", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathGradientBlend", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xec\x0f\x0c\x0f\x0c\x08" } },
    .{ "GdipGetPathGradientPresetBlendCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientPresetBlendCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x08" } },
    .{ "GdipGetPathGradientPresetBlend", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientPresetBlend", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xec\x0f\x09\x0f\x0c\x08" } },
    .{ "GdipSetPathGradientPresetBlend", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathGradientPresetBlend", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xec\x0f\x09\x0f\x0c\x08" } },
    .{ "GdipSetPathGradientSigmaBlend", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathGradientSigmaBlend", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xec\x0c\x0c" } },
    .{ "GdipSetPathGradientLinearBlend", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathGradientLinearBlend", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xec\x0c\x0c" } },
    .{ "GdipGetPathGradientWrapMode", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientWrapMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x11\xae\x69" } },
    .{ "GdipSetPathGradientWrapMode", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathGradientWrapMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x11\xae\x69" } },
    .{ "GdipGetPathGradientTransform", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientTransform", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x11\xae\x51" } },
    .{ "GdipSetPathGradientTransform", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathGradientTransform", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xec\x0f\x11\xae\x51" } },
    .{ "GdipResetPathGradientTransform", MethodRecord{ .library = "gdiplus", .import = "GdipResetPathGradientTransform", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x81\xec" } },
    .{ "GdipMultiplyPathGradientTransform", MethodRecord{ .library = "gdiplus", .import = "GdipMultiplyPathGradientTransform", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xec\x0f\x11\xae\x51\x11\xae\x59" } },
    .{ "GdipTranslatePathGradientTransform", MethodRecord{ .library = "gdiplus", .import = "GdipTranslatePathGradientTransform", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xec\x0c\x0c\x11\xae\x59" } },
    .{ "GdipScalePathGradientTransform", MethodRecord{ .library = "gdiplus", .import = "GdipScalePathGradientTransform", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xec\x0c\x0c\x11\xae\x59" } },
    .{ "GdipRotatePathGradientTransform", MethodRecord{ .library = "gdiplus", .import = "GdipRotatePathGradientTransform", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xec\x0c\x11\xae\x59" } },
    .{ "GdipGetPathGradientFocusScales", MethodRecord{ .library = "gdiplus", .import = "GdipGetPathGradientFocusScales", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xec\x0f\x0c\x0f\x0c" } },
    .{ "GdipSetPathGradientFocusScales", MethodRecord{ .library = "gdiplus", .import = "GdipSetPathGradientFocusScales", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xec\x0c\x0c" } },
    .{ "GdipCreatePen1", MethodRecord{ .library = "gdiplus", .import = "GdipCreatePen1", .signature = "\x00\x04\x11\xae\x29\x09\x0c\x11\xae\x71\x0f\x0f\x11\x81\xf4" } },
    .{ "GdipCreatePen2", MethodRecord{ .library = "gdiplus", .import = "GdipCreatePen2", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xdc\x0c\x11\xae\x71\x0f\x0f\x11\x81\xf4" } },
    .{ "GdipClonePen", MethodRecord{ .library = "gdiplus", .import = "GdipClonePen", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x0f\x11\x81\xf4" } },
    .{ "GdipDeletePen", MethodRecord{ .library = "gdiplus", .import = "GdipDeletePen", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x81\xf4" } },
    .{ "GdipSetPenWidth", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenWidth", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0c" } },
    .{ "GdipGetPenWidth", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenWidth", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x0c" } },
    .{ "GdipSetPenUnit", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenUnit", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x11\xae\x71" } },
    .{ "GdipGetPenUnit", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenUnit", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x11\xae\x71" } },
    .{ "GdipSetPenLineCap197819", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenLineCap197819", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xf4\x11\xae\x75\x11\xae\x75\x11\xae\x79" } },
    .{ "GdipSetPenStartCap", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenStartCap", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x11\xae\x75" } },
    .{ "GdipSetPenEndCap", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenEndCap", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x11\xae\x75" } },
    .{ "GdipSetPenDashCap197819", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenDashCap197819", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x11\xae\x79" } },
    .{ "GdipGetPenStartCap", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenStartCap", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x11\xae\x75" } },
    .{ "GdipGetPenEndCap", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenEndCap", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x11\xae\x75" } },
    .{ "GdipGetPenDashCap197819", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenDashCap197819", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x11\xae\x79" } },
    .{ "GdipSetPenLineJoin", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenLineJoin", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x11\xae\x7d" } },
    .{ "GdipGetPenLineJoin", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenLineJoin", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x11\xae\x7d" } },
    .{ "GdipSetPenCustomStartCap", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenCustomStartCap", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x11\x81\xf8" } },
    .{ "GdipGetPenCustomStartCap", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenCustomStartCap", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x0f\x11\x81\xf8" } },
    .{ "GdipSetPenCustomEndCap", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenCustomEndCap", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x11\x81\xf8" } },
    .{ "GdipGetPenCustomEndCap", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenCustomEndCap", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x0f\x11\x81\xf8" } },
    .{ "GdipSetPenMiterLimit", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenMiterLimit", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0c" } },
    .{ "GdipGetPenMiterLimit", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenMiterLimit", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x0c" } },
    .{ "GdipSetPenMode", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x11\xae\x81" } },
    .{ "GdipGetPenMode", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x11\xae\x81" } },
    .{ "GdipSetPenTransform", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenTransform", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x11\xae\x51" } },
    .{ "GdipGetPenTransform", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenTransform", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x11\xae\x51" } },
    .{ "GdipResetPenTransform", MethodRecord{ .library = "gdiplus", .import = "GdipResetPenTransform", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x81\xf4" } },
    .{ "GdipMultiplyPenTransform", MethodRecord{ .library = "gdiplus", .import = "GdipMultiplyPenTransform", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xf4\x0f\x11\xae\x51\x11\xae\x59" } },
    .{ "GdipTranslatePenTransform", MethodRecord{ .library = "gdiplus", .import = "GdipTranslatePenTransform", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xf4\x0c\x0c\x11\xae\x59" } },
    .{ "GdipScalePenTransform", MethodRecord{ .library = "gdiplus", .import = "GdipScalePenTransform", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xf4\x0c\x0c\x11\xae\x59" } },
    .{ "GdipRotatePenTransform", MethodRecord{ .library = "gdiplus", .import = "GdipRotatePenTransform", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xf4\x0c\x11\xae\x59" } },
    .{ "GdipSetPenColor", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenColor", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x09" } },
    .{ "GdipGetPenColor", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenColor", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x09" } },
    .{ "GdipSetPenBrushFill", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenBrushFill", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x11\x81\xdc" } },
    .{ "GdipGetPenBrushFill", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenBrushFill", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x0f\x11\x81\xdc" } },
    .{ "GdipGetPenFillType", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenFillType", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x11\xae\x85" } },
    .{ "GdipGetPenDashStyle", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenDashStyle", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x11\xae\x89" } },
    .{ "GdipSetPenDashStyle", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenDashStyle", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x11\xae\x89" } },
    .{ "GdipGetPenDashOffset", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenDashOffset", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x0c" } },
    .{ "GdipSetPenDashOffset", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenDashOffset", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0c" } },
    .{ "GdipGetPenDashCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenDashCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x08" } },
    .{ "GdipSetPenDashArray", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenDashArray", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xf4\x0f\x0c\x08" } },
    .{ "GdipGetPenDashArray", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenDashArray", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xf4\x0f\x0c\x08" } },
    .{ "GdipGetPenCompoundCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenCompoundCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf4\x0f\x08" } },
    .{ "GdipSetPenCompoundArray", MethodRecord{ .library = "gdiplus", .import = "GdipSetPenCompoundArray", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xf4\x0f\x0c\x08" } },
    .{ "GdipGetPenCompoundArray", MethodRecord{ .library = "gdiplus", .import = "GdipGetPenCompoundArray", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xf4\x0f\x0c\x08" } },
    .{ "GdipCreateCustomLineCap", MethodRecord{ .library = "gdiplus", .import = "GdipCreateCustomLineCap", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x10\x0f\x11\x82\x10\x11\xae\x75\x0c\x0f\x0f\x11\x81\xf8" } },
    .{ "GdipDeleteCustomLineCap", MethodRecord{ .library = "gdiplus", .import = "GdipDeleteCustomLineCap", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x81\xf8" } },
    .{ "GdipCloneCustomLineCap", MethodRecord{ .library = "gdiplus", .import = "GdipCloneCustomLineCap", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf8\x0f\x0f\x11\x81\xf8" } },
    .{ "GdipGetCustomLineCapType", MethodRecord{ .library = "gdiplus", .import = "GdipGetCustomLineCapType", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf8\x0f\x11\xae\x8d" } },
    .{ "GdipSetCustomLineCapStrokeCaps", MethodRecord{ .library = "gdiplus", .import = "GdipSetCustomLineCapStrokeCaps", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xf8\x11\xae\x75\x11\xae\x75" } },
    .{ "GdipGetCustomLineCapStrokeCaps", MethodRecord{ .library = "gdiplus", .import = "GdipGetCustomLineCapStrokeCaps", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xf8\x0f\x11\xae\x75\x0f\x11\xae\x75" } },
    .{ "GdipSetCustomLineCapStrokeJoin", MethodRecord{ .library = "gdiplus", .import = "GdipSetCustomLineCapStrokeJoin", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf8\x11\xae\x7d" } },
    .{ "GdipGetCustomLineCapStrokeJoin", MethodRecord{ .library = "gdiplus", .import = "GdipGetCustomLineCapStrokeJoin", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf8\x0f\x11\xae\x7d" } },
    .{ "GdipSetCustomLineCapBaseCap", MethodRecord{ .library = "gdiplus", .import = "GdipSetCustomLineCapBaseCap", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf8\x11\xae\x75" } },
    .{ "GdipGetCustomLineCapBaseCap", MethodRecord{ .library = "gdiplus", .import = "GdipGetCustomLineCapBaseCap", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf8\x0f\x11\xae\x75" } },
    .{ "GdipSetCustomLineCapBaseInset", MethodRecord{ .library = "gdiplus", .import = "GdipSetCustomLineCapBaseInset", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf8\x0c" } },
    .{ "GdipGetCustomLineCapBaseInset", MethodRecord{ .library = "gdiplus", .import = "GdipGetCustomLineCapBaseInset", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf8\x0f\x0c" } },
    .{ "GdipSetCustomLineCapWidthScale", MethodRecord{ .library = "gdiplus", .import = "GdipSetCustomLineCapWidthScale", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf8\x0c" } },
    .{ "GdipGetCustomLineCapWidthScale", MethodRecord{ .library = "gdiplus", .import = "GdipGetCustomLineCapWidthScale", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xf8\x0f\x0c" } },
    .{ "GdipCreateAdjustableArrowCap", MethodRecord{ .library = "gdiplus", .import = "GdipCreateAdjustableArrowCap", .signature = "\x00\x04\x11\xae\x29\x0c\x0c\x11\x59\x0f\x0f\x11\x81\xfc" } },
    .{ "GdipSetAdjustableArrowCapHeight", MethodRecord{ .library = "gdiplus", .import = "GdipSetAdjustableArrowCapHeight", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xfc\x0c" } },
    .{ "GdipGetAdjustableArrowCapHeight", MethodRecord{ .library = "gdiplus", .import = "GdipGetAdjustableArrowCapHeight", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xfc\x0f\x0c" } },
    .{ "GdipSetAdjustableArrowCapWidth", MethodRecord{ .library = "gdiplus", .import = "GdipSetAdjustableArrowCapWidth", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xfc\x0c" } },
    .{ "GdipGetAdjustableArrowCapWidth", MethodRecord{ .library = "gdiplus", .import = "GdipGetAdjustableArrowCapWidth", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xfc\x0f\x0c" } },
    .{ "GdipSetAdjustableArrowCapMiddleInset", MethodRecord{ .library = "gdiplus", .import = "GdipSetAdjustableArrowCapMiddleInset", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xfc\x0c" } },
    .{ "GdipGetAdjustableArrowCapMiddleInset", MethodRecord{ .library = "gdiplus", .import = "GdipGetAdjustableArrowCapMiddleInset", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xfc\x0f\x0c" } },
    .{ "GdipSetAdjustableArrowCapFillState", MethodRecord{ .library = "gdiplus", .import = "GdipSetAdjustableArrowCapFillState", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xfc\x11\x59" } },
    .{ "GdipGetAdjustableArrowCapFillState", MethodRecord{ .library = "gdiplus", .import = "GdipGetAdjustableArrowCapFillState", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xfc\x0f\x11\x59" } },
    .{ "GdipLoadImageFromStream", MethodRecord{ .library = "gdiplus", .import = "GdipLoadImageFromStream", .signature = "\x00\x02\x11\xae\x29\x12\x83\x75\x0f\x0f\x11\x82\x00" } },
    .{ "GdipLoadImageFromFile", MethodRecord{ .library = "gdiplus", .import = "GdipLoadImageFromFile", .signature = "\x00\x02\x11\xae\x29\x11\x05\x0f\x0f\x11\x82\x00" } },
    .{ "GdipLoadImageFromStreamICM", MethodRecord{ .library = "gdiplus", .import = "GdipLoadImageFromStreamICM", .signature = "\x00\x02\x11\xae\x29\x12\x83\x75\x0f\x0f\x11\x82\x00" } },
    .{ "GdipLoadImageFromFileICM", MethodRecord{ .library = "gdiplus", .import = "GdipLoadImageFromFileICM", .signature = "\x00\x02\x11\xae\x29\x11\x05\x0f\x0f\x11\x82\x00" } },
    .{ "GdipCloneImage", MethodRecord{ .library = "gdiplus", .import = "GdipCloneImage", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x0f\x11\x82\x00" } },
    .{ "GdipDisposeImage", MethodRecord{ .library = "gdiplus", .import = "GdipDisposeImage", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x00" } },
    .{ "GdipSaveImageToFile", MethodRecord{ .library = "gdiplus", .import = "GdipSaveImageToFile", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x00\x11\x05\x0f\x11\x0d\x0f\x11\xae\x91" } },
    .{ "GdipSaveImageToStream", MethodRecord{ .library = "gdiplus", .import = "GdipSaveImageToStream", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x00\x12\x83\x75\x0f\x11\x0d\x0f\x11\xae\x91" } },
    .{ "GdipSaveAdd", MethodRecord{ .library = "gdiplus", .import = "GdipSaveAdd", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\xae\x91" } },
    .{ "GdipSaveAddImage", MethodRecord{ .library = "gdiplus", .import = "GdipSaveAddImage", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\x82\x00\x0f\x11\xae\x91" } },
    .{ "GdipGetImageGraphicsContext", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageGraphicsContext", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x0f\x11\x81\xd8" } },
    .{ "GdipGetImageBounds", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageBounds", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\xae\x49\x0f\x11\xae\x71" } },
    .{ "GdipGetImageDimension", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageDimension", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x00\x0f\x0c\x0f\x0c" } },
    .{ "GdipGetImageType", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageType", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\xae\x95" } },
    .{ "GdipGetImageWidth", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageWidth", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x09" } },
    .{ "GdipGetImageHeight", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageHeight", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x09" } },
    .{ "GdipGetImageHorizontalResolution", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageHorizontalResolution", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x0c" } },
    .{ "GdipGetImageVerticalResolution", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageVerticalResolution", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x0c" } },
    .{ "GdipGetImageFlags", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageFlags", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x09" } },
    .{ "GdipGetImageRawFormat", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageRawFormat", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\x0d" } },
    .{ "GdipGetImagePixelFormat", MethodRecord{ .library = "gdiplus", .import = "GdipGetImagePixelFormat", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x08" } },
    .{ "GdipGetImageThumbnail", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageThumbnail", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x82\x00\x09\x09\x0f\x0f\x11\x82\x00\x18\x0f\x01" } },
    .{ "GdipGetEncoderParameterListSize", MethodRecord{ .library = "gdiplus", .import = "GdipGetEncoderParameterListSize", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\x0d\x0f\x09" } },
    .{ "GdipGetEncoderParameterList", MethodRecord{ .library = "gdiplus", .import = "GdipGetEncoderParameterList", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\x0d\x09\x0f\x11\xae\x91" } },
    .{ "GdipImageGetFrameDimensionsCount", MethodRecord{ .library = "gdiplus", .import = "GdipImageGetFrameDimensionsCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x09" } },
    .{ "GdipImageGetFrameDimensionsList", MethodRecord{ .library = "gdiplus", .import = "GdipImageGetFrameDimensionsList", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\x0d\x09" } },
    .{ "GdipImageGetFrameCount", MethodRecord{ .library = "gdiplus", .import = "GdipImageGetFrameCount", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\x0d\x0f\x09" } },
    .{ "GdipImageSelectActiveFrame", MethodRecord{ .library = "gdiplus", .import = "GdipImageSelectActiveFrame", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\x0d\x09" } },
    .{ "GdipImageRotateFlip", MethodRecord{ .library = "gdiplus", .import = "GdipImageRotateFlip", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x11\xae\x99" } },
    .{ "GdipGetImagePalette", MethodRecord{ .library = "gdiplus", .import = "GdipGetImagePalette", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\xae\x9d\x08" } },
    .{ "GdipSetImagePalette", MethodRecord{ .library = "gdiplus", .import = "GdipSetImagePalette", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\xae\x9d" } },
    .{ "GdipGetImagePaletteSize", MethodRecord{ .library = "gdiplus", .import = "GdipGetImagePaletteSize", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x08" } },
    .{ "GdipGetPropertyCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetPropertyCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x09" } },
    .{ "GdipGetPropertyIdList", MethodRecord{ .library = "gdiplus", .import = "GdipGetPropertyIdList", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x00\x09\x0f\x09" } },
    .{ "GdipGetPropertyItemSize", MethodRecord{ .library = "gdiplus", .import = "GdipGetPropertyItemSize", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x00\x09\x0f\x09" } },
    .{ "GdipGetPropertyItem", MethodRecord{ .library = "gdiplus", .import = "GdipGetPropertyItem", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x00\x09\x09\x0f\x11\xae\xa1" } },
    .{ "GdipGetPropertySize", MethodRecord{ .library = "gdiplus", .import = "GdipGetPropertySize", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x00\x0f\x09\x0f\x09" } },
    .{ "GdipGetAllPropertyItems", MethodRecord{ .library = "gdiplus", .import = "GdipGetAllPropertyItems", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x00\x09\x09\x0f\x11\xae\xa1" } },
    .{ "GdipRemovePropertyItem", MethodRecord{ .library = "gdiplus", .import = "GdipRemovePropertyItem", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x09" } },
    .{ "GdipSetPropertyItem", MethodRecord{ .library = "gdiplus", .import = "GdipSetPropertyItem", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\xae\xa1" } },
    .{ "GdipFindFirstImageItem", MethodRecord{ .library = "gdiplus", .import = "GdipFindFirstImageItem", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\xae\xa5" } },
    .{ "GdipFindNextImageItem", MethodRecord{ .library = "gdiplus", .import = "GdipFindNextImageItem", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\xae\xa5" } },
    .{ "GdipGetImageItemData", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageItemData", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x0f\x11\xae\xa5" } },
    .{ "GdipImageForceValidation", MethodRecord{ .library = "gdiplus", .import = "GdipImageForceValidation", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x00" } },
    .{ "GdipCreateBitmapFromStream", MethodRecord{ .library = "gdiplus", .import = "GdipCreateBitmapFromStream", .signature = "\x00\x02\x11\xae\x29\x12\x83\x75\x0f\x0f\x11\x82\x04" } },
    .{ "GdipCreateBitmapFromFile", MethodRecord{ .library = "gdiplus", .import = "GdipCreateBitmapFromFile", .signature = "\x00\x02\x11\xae\x29\x11\x05\x0f\x0f\x11\x82\x04" } },
    .{ "GdipCreateBitmapFromStreamICM", MethodRecord{ .library = "gdiplus", .import = "GdipCreateBitmapFromStreamICM", .signature = "\x00\x02\x11\xae\x29\x12\x83\x75\x0f\x0f\x11\x82\x04" } },
    .{ "GdipCreateBitmapFromFileICM", MethodRecord{ .library = "gdiplus", .import = "GdipCreateBitmapFromFileICM", .signature = "\x00\x02\x11\xae\x29\x11\x05\x0f\x0f\x11\x82\x04" } },
    .{ "GdipCreateBitmapFromScan0", MethodRecord{ .library = "gdiplus", .import = "GdipCreateBitmapFromScan0", .signature = "\x00\x06\x11\xae\x29\x08\x08\x08\x08\x0f\x05\x0f\x0f\x11\x82\x04" } },
    .{ "GdipCreateBitmapFromGraphics", MethodRecord{ .library = "gdiplus", .import = "GdipCreateBitmapFromGraphics", .signature = "\x00\x04\x11\xae\x29\x08\x08\x0f\x11\x81\xd8\x0f\x0f\x11\x82\x04" } },
    .{ "GdipCreateBitmapFromDirectDrawSurface", MethodRecord{ .library = "gdiplus", .import = "GdipCreateBitmapFromDirectDrawSurface", .signature = "\x00\x02\x11\xae\x29\x12\xae\xa9\x0f\x0f\x11\x82\x04" } },
    .{ "GdipCreateBitmapFromGdiDib", MethodRecord{ .library = "gdiplus", .import = "GdipCreateBitmapFromGdiDib", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x8d\x8d\x0f\x01\x0f\x0f\x11\x82\x04" } },
    .{ "GdipCreateBitmapFromHBITMAP", MethodRecord{ .library = "gdiplus", .import = "GdipCreateBitmapFromHBITMAP", .signature = "\x00\x03\x11\xae\x29\x11\x83\x51\x11\x8d\x65\x0f\x0f\x11\x82\x04" } },
    .{ "GdipCreateHBITMAPFromBitmap", MethodRecord{ .library = "gdiplus", .import = "GdipCreateHBITMAPFromBitmap", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x04\x0f\x11\x83\x51\x09" } },
    .{ "GdipCreateBitmapFromHICON", MethodRecord{ .library = "gdiplus", .import = "GdipCreateBitmapFromHICON", .signature = "\x00\x02\x11\xae\x29\x11\x83\x55\x0f\x0f\x11\x82\x04" } },
    .{ "GdipCreateHICONFromBitmap", MethodRecord{ .library = "gdiplus", .import = "GdipCreateHICONFromBitmap", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x04\x0f\x11\x83\x55" } },
    .{ "GdipCreateBitmapFromResource", MethodRecord{ .library = "gdiplus", .import = "GdipCreateBitmapFromResource", .signature = "\x00\x03\x11\xae\x29\x11\x82\x29\x11\x05\x0f\x0f\x11\x82\x04" } },
    .{ "GdipCloneBitmapArea", MethodRecord{ .library = "gdiplus", .import = "GdipCloneBitmapArea", .signature = "\x00\x07\x11\xae\x29\x0c\x0c\x0c\x0c\x08\x0f\x11\x82\x04\x0f\x0f\x11\x82\x04" } },
    .{ "GdipCloneBitmapAreaI", MethodRecord{ .library = "gdiplus", .import = "GdipCloneBitmapAreaI", .signature = "\x00\x07\x11\xae\x29\x08\x08\x08\x08\x08\x0f\x11\x82\x04\x0f\x0f\x11\x82\x04" } },
    .{ "GdipBitmapLockBits", MethodRecord{ .library = "gdiplus", .import = "GdipBitmapLockBits", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x04\x0f\x11\xae\x4d\x09\x08\x0f\x11\xae\xad" } },
    .{ "GdipBitmapUnlockBits", MethodRecord{ .library = "gdiplus", .import = "GdipBitmapUnlockBits", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x04\x0f\x11\xae\xad" } },
    .{ "GdipBitmapGetPixel", MethodRecord{ .library = "gdiplus", .import = "GdipBitmapGetPixel", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x04\x08\x08\x0f\x09" } },
    .{ "GdipBitmapSetPixel", MethodRecord{ .library = "gdiplus", .import = "GdipBitmapSetPixel", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x04\x08\x08\x09" } },
    .{ "GdipImageSetAbort", MethodRecord{ .library = "gdiplus", .import = "GdipImageSetAbort", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x00\x12\xae\xb1" } },
    .{ "GdipGraphicsSetAbort", MethodRecord{ .library = "gdiplus", .import = "GdipGraphicsSetAbort", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x12\xae\xb1" } },
    .{ "GdipBitmapConvertFormat", MethodRecord{ .library = "gdiplus", .import = "GdipBitmapConvertFormat", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x82\x04\x08\x11\xae\xb5\x11\xae\xb9\x0f\x11\xae\x9d\x0c" } },
    .{ "GdipInitializePalette", MethodRecord{ .library = "gdiplus", .import = "GdipInitializePalette", .signature = "\x00\x05\x11\xae\x29\x0f\x11\xae\x9d\x11\xae\xb9\x08\x11\x59\x0f\x11\x82\x04" } },
    .{ "GdipBitmapApplyEffect", MethodRecord{ .library = "gdiplus", .import = "GdipBitmapApplyEffect", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x82\x04\x0f\x11\xae\x35\x0f\x11\x83\x89\x11\x59\x0f\x0f\x01\x0f\x08" } },
    .{ "GdipBitmapCreateApplyEffect", MethodRecord{ .library = "gdiplus", .import = "GdipBitmapCreateApplyEffect", .signature = "\x00\x09\x11\xae\x29\x0f\x0f\x11\x82\x04\x08\x0f\x11\xae\x35\x0f\x11\x83\x89\x0f\x11\x83\x89\x0f\x0f\x11\x82\x04\x11\x59\x0f\x0f\x01\x0f\x08" } },
    .{ "GdipBitmapGetHistogram", MethodRecord{ .library = "gdiplus", .import = "GdipBitmapGetHistogram", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x82\x04\x11\xae\xbd\x09\x0f\x09\x0f\x09\x0f\x09\x0f\x09" } },
    .{ "GdipBitmapGetHistogramSize", MethodRecord{ .library = "gdiplus", .import = "GdipBitmapGetHistogramSize", .signature = "\x00\x02\x11\xae\x29\x11\xae\xbd\x0f\x09" } },
    .{ "GdipBitmapSetResolution", MethodRecord{ .library = "gdiplus", .import = "GdipBitmapSetResolution", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x04\x0c\x0c" } },
    .{ "GdipCreateImageAttributes", MethodRecord{ .library = "gdiplus", .import = "GdipCreateImageAttributes", .signature = "\x00\x01\x11\xae\x29\x0f\x0f\x11\x82\x0c" } },
    .{ "GdipCloneImageAttributes", MethodRecord{ .library = "gdiplus", .import = "GdipCloneImageAttributes", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x0c\x0f\x0f\x11\x82\x0c" } },
    .{ "GdipDisposeImageAttributes", MethodRecord{ .library = "gdiplus", .import = "GdipDisposeImageAttributes", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x0c" } },
    .{ "GdipSetImageAttributesToIdentity", MethodRecord{ .library = "gdiplus", .import = "GdipSetImageAttributesToIdentity", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x0c\x11\xae\xc1" } },
    .{ "GdipResetImageAttributes", MethodRecord{ .library = "gdiplus", .import = "GdipResetImageAttributes", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x0c\x11\xae\xc1" } },
    .{ "GdipSetImageAttributesColorMatrix", MethodRecord{ .library = "gdiplus", .import = "GdipSetImageAttributesColorMatrix", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x82\x0c\x11\xae\xc1\x11\x59\x0f\x11\xae\xc5\x0f\x11\xae\xc5\x11\xae\xc9" } },
    .{ "GdipSetImageAttributesThreshold", MethodRecord{ .library = "gdiplus", .import = "GdipSetImageAttributesThreshold", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x0c\x11\xae\xc1\x11\x59\x0c" } },
    .{ "GdipSetImageAttributesGamma", MethodRecord{ .library = "gdiplus", .import = "GdipSetImageAttributesGamma", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x0c\x11\xae\xc1\x11\x59\x0c" } },
    .{ "GdipSetImageAttributesNoOp", MethodRecord{ .library = "gdiplus", .import = "GdipSetImageAttributesNoOp", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x0c\x11\xae\xc1\x11\x59" } },
    .{ "GdipSetImageAttributesColorKeys", MethodRecord{ .library = "gdiplus", .import = "GdipSetImageAttributesColorKeys", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x0c\x11\xae\xc1\x11\x59\x09\x09" } },
    .{ "GdipSetImageAttributesOutputChannel", MethodRecord{ .library = "gdiplus", .import = "GdipSetImageAttributesOutputChannel", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x0c\x11\xae\xc1\x11\x59\x11\xae\xcd" } },
    .{ "GdipSetImageAttributesOutputChannelColorProfile", MethodRecord{ .library = "gdiplus", .import = "GdipSetImageAttributesOutputChannelColorProfile", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x0c\x11\xae\xc1\x11\x59\x11\x05" } },
    .{ "GdipSetImageAttributesRemapTable", MethodRecord{ .library = "gdiplus", .import = "GdipSetImageAttributesRemapTable", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x0c\x11\xae\xc1\x11\x59\x09\x0f\x11\xae\xd1" } },
    .{ "GdipSetImageAttributesWrapMode", MethodRecord{ .library = "gdiplus", .import = "GdipSetImageAttributesWrapMode", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x0c\x11\xae\x69\x09\x11\x59" } },
    .{ "GdipGetImageAttributesAdjustedPalette", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageAttributesAdjustedPalette", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x0c\x0f\x11\xae\x9d\x11\xae\xc1" } },
    .{ "GdipFlush", MethodRecord{ .library = "gdiplus", .import = "GdipFlush", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x11\xae\xd5" } },
    .{ "GdipCreateFromHDC", MethodRecord{ .library = "gdiplus", .import = "GdipCreateFromHDC", .signature = "\x00\x02\x11\xae\x29\x11\x83\x5d\x0f\x0f\x11\x81\xd8" } },
    .{ "GdipCreateFromHDC2", MethodRecord{ .library = "gdiplus", .import = "GdipCreateFromHDC2", .signature = "\x00\x03\x11\xae\x29\x11\x83\x5d\x11\x80\x85\x0f\x0f\x11\x81\xd8" } },
    .{ "GdipCreateFromHWND", MethodRecord{ .library = "gdiplus", .import = "GdipCreateFromHWND", .signature = "\x00\x02\x11\xae\x29\x11\x25\x0f\x0f\x11\x81\xd8" } },
    .{ "GdipCreateFromHWNDICM", MethodRecord{ .library = "gdiplus", .import = "GdipCreateFromHWNDICM", .signature = "\x00\x02\x11\xae\x29\x11\x25\x0f\x0f\x11\x81\xd8" } },
    .{ "GdipDeleteGraphics", MethodRecord{ .library = "gdiplus", .import = "GdipDeleteGraphics", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x81\xd8" } },
    .{ "GdipGetDC", MethodRecord{ .library = "gdiplus", .import = "GdipGetDC", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x83\x5d" } },
    .{ "GdipReleaseDC", MethodRecord{ .library = "gdiplus", .import = "GdipReleaseDC", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x11\x83\x5d" } },
    .{ "GdipSetCompositingMode", MethodRecord{ .library = "gdiplus", .import = "GdipSetCompositingMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x11\xae\xd9" } },
    .{ "GdipGetCompositingMode", MethodRecord{ .library = "gdiplus", .import = "GdipGetCompositingMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\xd9" } },
    .{ "GdipSetRenderingOrigin", MethodRecord{ .library = "gdiplus", .import = "GdipSetRenderingOrigin", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xd8\x08\x08" } },
    .{ "GdipGetRenderingOrigin", MethodRecord{ .library = "gdiplus", .import = "GdipGetRenderingOrigin", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xd8\x0f\x08\x0f\x08" } },
    .{ "GdipSetCompositingQuality", MethodRecord{ .library = "gdiplus", .import = "GdipSetCompositingQuality", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x11\xae\xdd" } },
    .{ "GdipGetCompositingQuality", MethodRecord{ .library = "gdiplus", .import = "GdipGetCompositingQuality", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\xdd" } },
    .{ "GdipSetSmoothingMode", MethodRecord{ .library = "gdiplus", .import = "GdipSetSmoothingMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x11\xae\xe1" } },
    .{ "GdipGetSmoothingMode", MethodRecord{ .library = "gdiplus", .import = "GdipGetSmoothingMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\xe1" } },
    .{ "GdipSetPixelOffsetMode", MethodRecord{ .library = "gdiplus", .import = "GdipSetPixelOffsetMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x11\xae\xe5" } },
    .{ "GdipGetPixelOffsetMode", MethodRecord{ .library = "gdiplus", .import = "GdipGetPixelOffsetMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\xe5" } },
    .{ "GdipSetTextRenderingHint", MethodRecord{ .library = "gdiplus", .import = "GdipSetTextRenderingHint", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x11\xae\xe9" } },
    .{ "GdipGetTextRenderingHint", MethodRecord{ .library = "gdiplus", .import = "GdipGetTextRenderingHint", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\xe9" } },
    .{ "GdipSetTextContrast", MethodRecord{ .library = "gdiplus", .import = "GdipSetTextContrast", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x09" } },
    .{ "GdipGetTextContrast", MethodRecord{ .library = "gdiplus", .import = "GdipGetTextContrast", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x09" } },
    .{ "GdipSetInterpolationMode", MethodRecord{ .library = "gdiplus", .import = "GdipSetInterpolationMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x11\xae\xed" } },
    .{ "GdipGetInterpolationMode", MethodRecord{ .library = "gdiplus", .import = "GdipGetInterpolationMode", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\xed" } },
    .{ "GdipSetWorldTransform", MethodRecord{ .library = "gdiplus", .import = "GdipSetWorldTransform", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\x51" } },
    .{ "GdipResetWorldTransform", MethodRecord{ .library = "gdiplus", .import = "GdipResetWorldTransform", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x81\xd8" } },
    .{ "GdipMultiplyWorldTransform", MethodRecord{ .library = "gdiplus", .import = "GdipMultiplyWorldTransform", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\x51\x11\xae\x59" } },
    .{ "GdipTranslateWorldTransform", MethodRecord{ .library = "gdiplus", .import = "GdipTranslateWorldTransform", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0c\x0c\x11\xae\x59" } },
    .{ "GdipScaleWorldTransform", MethodRecord{ .library = "gdiplus", .import = "GdipScaleWorldTransform", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0c\x0c\x11\xae\x59" } },
    .{ "GdipRotateWorldTransform", MethodRecord{ .library = "gdiplus", .import = "GdipRotateWorldTransform", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xd8\x0c\x11\xae\x59" } },
    .{ "GdipGetWorldTransform", MethodRecord{ .library = "gdiplus", .import = "GdipGetWorldTransform", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\x51" } },
    .{ "GdipResetPageTransform", MethodRecord{ .library = "gdiplus", .import = "GdipResetPageTransform", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x81\xd8" } },
    .{ "GdipGetPageUnit", MethodRecord{ .library = "gdiplus", .import = "GdipGetPageUnit", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\x71" } },
    .{ "GdipGetPageScale", MethodRecord{ .library = "gdiplus", .import = "GdipGetPageScale", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x0c" } },
    .{ "GdipSetPageUnit", MethodRecord{ .library = "gdiplus", .import = "GdipSetPageUnit", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x11\xae\x71" } },
    .{ "GdipSetPageScale", MethodRecord{ .library = "gdiplus", .import = "GdipSetPageScale", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0c" } },
    .{ "GdipGetDpiX", MethodRecord{ .library = "gdiplus", .import = "GdipGetDpiX", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x0c" } },
    .{ "GdipGetDpiY", MethodRecord{ .library = "gdiplus", .import = "GdipGetDpiY", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x0c" } },
    .{ "GdipTransformPoints", MethodRecord{ .library = "gdiplus", .import = "GdipTransformPoints", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x81\xd8\x11\xae\xf1\x11\xae\xf1\x0f\x11\xae\x3d\x08" } },
    .{ "GdipTransformPointsI", MethodRecord{ .library = "gdiplus", .import = "GdipTransformPointsI", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x81\xd8\x11\xae\xf1\x11\xae\xf1\x0f\x11\xae\x41\x08" } },
    .{ "GdipGetNearestColor", MethodRecord{ .library = "gdiplus", .import = "GdipGetNearestColor", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x09" } },
    .{ "GdipCreateHalftonePalette", MethodRecord{ .library = "gdiplus", .import = "GdipCreateHalftonePalette", .signature = "\x00\x00\x11\x8d\x65" } },
    .{ "GdipDrawLine", MethodRecord{ .library = "gdiplus", .import = "GdipDrawLine", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0c\x0c\x0c\x0c" } },
    .{ "GdipDrawLineI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawLineI", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x08\x08\x08\x08" } },
    .{ "GdipDrawLines", MethodRecord{ .library = "gdiplus", .import = "GdipDrawLines", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x3d\x08" } },
    .{ "GdipDrawLinesI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawLinesI", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x41\x08" } },
    .{ "GdipDrawArc", MethodRecord{ .library = "gdiplus", .import = "GdipDrawArc", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0c\x0c\x0c\x0c\x0c\x0c" } },
    .{ "GdipDrawArcI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawArcI", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x08\x08\x08\x08\x0c\x0c" } },
    .{ "GdipDrawBezier", MethodRecord{ .library = "gdiplus", .import = "GdipDrawBezier", .signature = "\x00\x0a\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0c\x0c\x0c\x0c\x0c\x0c\x0c\x0c" } },
    .{ "GdipDrawBezierI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawBezierI", .signature = "\x00\x0a\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x08\x08\x08\x08\x08\x08\x08\x08" } },
    .{ "GdipDrawBeziers", MethodRecord{ .library = "gdiplus", .import = "GdipDrawBeziers", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x3d\x08" } },
    .{ "GdipDrawBeziersI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawBeziersI", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x41\x08" } },
    .{ "GdipDrawRectangle", MethodRecord{ .library = "gdiplus", .import = "GdipDrawRectangle", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0c\x0c\x0c\x0c" } },
    .{ "GdipDrawRectangleI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawRectangleI", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x08\x08\x08\x08" } },
    .{ "GdipDrawRectangles", MethodRecord{ .library = "gdiplus", .import = "GdipDrawRectangles", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x49\x08" } },
    .{ "GdipDrawRectanglesI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawRectanglesI", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x4d\x08" } },
    .{ "GdipDrawEllipse", MethodRecord{ .library = "gdiplus", .import = "GdipDrawEllipse", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0c\x0c\x0c\x0c" } },
    .{ "GdipDrawEllipseI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawEllipseI", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x08\x08\x08\x08" } },
    .{ "GdipDrawPie", MethodRecord{ .library = "gdiplus", .import = "GdipDrawPie", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0c\x0c\x0c\x0c\x0c\x0c" } },
    .{ "GdipDrawPieI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawPieI", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x08\x08\x08\x08\x0c\x0c" } },
    .{ "GdipDrawPolygon", MethodRecord{ .library = "gdiplus", .import = "GdipDrawPolygon", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x3d\x08" } },
    .{ "GdipDrawPolygonI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawPolygonI", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x41\x08" } },
    .{ "GdipDrawPath", MethodRecord{ .library = "gdiplus", .import = "GdipDrawPath", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\x82\x10" } },
    .{ "GdipDrawCurve", MethodRecord{ .library = "gdiplus", .import = "GdipDrawCurve", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x3d\x08" } },
    .{ "GdipDrawCurveI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawCurveI", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x41\x08" } },
    .{ "GdipDrawCurve2", MethodRecord{ .library = "gdiplus", .import = "GdipDrawCurve2", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x3d\x08\x0c" } },
    .{ "GdipDrawCurve2I", MethodRecord{ .library = "gdiplus", .import = "GdipDrawCurve2I", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x41\x08\x0c" } },
    .{ "GdipDrawCurve3", MethodRecord{ .library = "gdiplus", .import = "GdipDrawCurve3", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x3d\x08\x08\x08\x0c" } },
    .{ "GdipDrawCurve3I", MethodRecord{ .library = "gdiplus", .import = "GdipDrawCurve3I", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x41\x08\x08\x08\x0c" } },
    .{ "GdipDrawClosedCurve", MethodRecord{ .library = "gdiplus", .import = "GdipDrawClosedCurve", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x3d\x08" } },
    .{ "GdipDrawClosedCurveI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawClosedCurveI", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x41\x08" } },
    .{ "GdipDrawClosedCurve2", MethodRecord{ .library = "gdiplus", .import = "GdipDrawClosedCurve2", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x3d\x08\x0c" } },
    .{ "GdipDrawClosedCurve2I", MethodRecord{ .library = "gdiplus", .import = "GdipDrawClosedCurve2I", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xf4\x0f\x11\xae\x41\x08\x0c" } },
    .{ "GdipGraphicsClear", MethodRecord{ .library = "gdiplus", .import = "GdipGraphicsClear", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x09" } },
    .{ "GdipFillRectangle", MethodRecord{ .library = "gdiplus", .import = "GdipFillRectangle", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0c\x0c\x0c\x0c" } },
    .{ "GdipFillRectangleI", MethodRecord{ .library = "gdiplus", .import = "GdipFillRectangleI", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x08\x08\x08\x08" } },
    .{ "GdipFillRectangles", MethodRecord{ .library = "gdiplus", .import = "GdipFillRectangles", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0f\x11\xae\x49\x08" } },
    .{ "GdipFillRectanglesI", MethodRecord{ .library = "gdiplus", .import = "GdipFillRectanglesI", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0f\x11\xae\x4d\x08" } },
    .{ "GdipFillPolygon", MethodRecord{ .library = "gdiplus", .import = "GdipFillPolygon", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0f\x11\xae\x3d\x08\x11\xae\x39" } },
    .{ "GdipFillPolygonI", MethodRecord{ .library = "gdiplus", .import = "GdipFillPolygonI", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0f\x11\xae\x41\x08\x11\xae\x39" } },
    .{ "GdipFillPolygon2", MethodRecord{ .library = "gdiplus", .import = "GdipFillPolygon2", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0f\x11\xae\x3d\x08" } },
    .{ "GdipFillPolygon2I", MethodRecord{ .library = "gdiplus", .import = "GdipFillPolygon2I", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0f\x11\xae\x41\x08" } },
    .{ "GdipFillEllipse", MethodRecord{ .library = "gdiplus", .import = "GdipFillEllipse", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0c\x0c\x0c\x0c" } },
    .{ "GdipFillEllipseI", MethodRecord{ .library = "gdiplus", .import = "GdipFillEllipseI", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x08\x08\x08\x08" } },
    .{ "GdipFillPie", MethodRecord{ .library = "gdiplus", .import = "GdipFillPie", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0c\x0c\x0c\x0c\x0c\x0c" } },
    .{ "GdipFillPieI", MethodRecord{ .library = "gdiplus", .import = "GdipFillPieI", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x08\x08\x08\x08\x0c\x0c" } },
    .{ "GdipFillPath", MethodRecord{ .library = "gdiplus", .import = "GdipFillPath", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0f\x11\x82\x10" } },
    .{ "GdipFillClosedCurve", MethodRecord{ .library = "gdiplus", .import = "GdipFillClosedCurve", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0f\x11\xae\x3d\x08" } },
    .{ "GdipFillClosedCurveI", MethodRecord{ .library = "gdiplus", .import = "GdipFillClosedCurveI", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0f\x11\xae\x41\x08" } },
    .{ "GdipFillClosedCurve2", MethodRecord{ .library = "gdiplus", .import = "GdipFillClosedCurve2", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0f\x11\xae\x3d\x08\x0c\x11\xae\x39" } },
    .{ "GdipFillClosedCurve2I", MethodRecord{ .library = "gdiplus", .import = "GdipFillClosedCurve2I", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0f\x11\xae\x41\x08\x0c\x11\xae\x39" } },
    .{ "GdipFillRegion", MethodRecord{ .library = "gdiplus", .import = "GdipFillRegion", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xdc\x0f\x11\x82\x14" } },
    .{ "GdipDrawImageFX", MethodRecord{ .library = "gdiplus", .import = "GdipDrawImageFX", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x00\x0f\x11\xae\x49\x0f\x11\xae\x51\x0f\x11\xae\x35\x0f\x11\x82\x0c\x11\xae\x71" } },
    .{ "GdipDrawImage", MethodRecord{ .library = "gdiplus", .import = "GdipDrawImage", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x00\x0c\x0c" } },
    .{ "GdipDrawImageI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawImageI", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x00\x08\x08" } },
    .{ "GdipDrawImageRect", MethodRecord{ .library = "gdiplus", .import = "GdipDrawImageRect", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x00\x0c\x0c\x0c\x0c" } },
    .{ "GdipDrawImageRectI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawImageRectI", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x00\x08\x08\x08\x08" } },
    .{ "GdipDrawImagePoints", MethodRecord{ .library = "gdiplus", .import = "GdipDrawImagePoints", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x00\x0f\x11\xae\x3d\x08" } },
    .{ "GdipDrawImagePointsI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawImagePointsI", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x00\x0f\x11\xae\x41\x08" } },
    .{ "GdipDrawImagePointRect", MethodRecord{ .library = "gdiplus", .import = "GdipDrawImagePointRect", .signature = "\x00\x09\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x00\x0c\x0c\x0c\x0c\x0c\x0c\x11\xae\x71" } },
    .{ "GdipDrawImagePointRectI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawImagePointRectI", .signature = "\x00\x09\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x00\x08\x08\x08\x08\x08\x08\x11\xae\x71" } },
    .{ "GdipDrawImageRectRect", MethodRecord{ .library = "gdiplus", .import = "GdipDrawImageRectRect", .signature = "\x00\x0e\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x00\x0c\x0c\x0c\x0c\x0c\x0c\x0c\x0c\x11\xae\x71\x0f\x11\x82\x0c\x18\x0f\x01" } },
    .{ "GdipDrawImageRectRectI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawImageRectRectI", .signature = "\x00\x0e\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x00\x08\x08\x08\x08\x08\x08\x08\x08\x11\xae\x71\x0f\x11\x82\x0c\x18\x0f\x01" } },
    .{ "GdipDrawImagePointsRect", MethodRecord{ .library = "gdiplus", .import = "GdipDrawImagePointsRect", .signature = "\x00\x0c\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x00\x0f\x11\xae\x3d\x08\x0c\x0c\x0c\x0c\x11\xae\x71\x0f\x11\x82\x0c\x18\x0f\x01" } },
    .{ "GdipDrawImagePointsRectI", MethodRecord{ .library = "gdiplus", .import = "GdipDrawImagePointsRectI", .signature = "\x00\x0c\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x00\x0f\x11\xae\x41\x08\x08\x08\x08\x08\x11\xae\x71\x0f\x11\x82\x0c\x18\x0f\x01" } },
    .{ "GdipEnumerateMetafileDestPoint", MethodRecord{ .library = "gdiplus", .import = "GdipEnumerateMetafileDestPoint", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x11\xae\x3d\x18\x0f\x01\x0f\x11\x82\x0c" } },
    .{ "GdipEnumerateMetafileDestPointI", MethodRecord{ .library = "gdiplus", .import = "GdipEnumerateMetafileDestPointI", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x11\xae\x41\x18\x0f\x01\x0f\x11\x82\x0c" } },
    .{ "GdipEnumerateMetafileDestRect", MethodRecord{ .library = "gdiplus", .import = "GdipEnumerateMetafileDestRect", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x11\xae\x49\x18\x0f\x01\x0f\x11\x82\x0c" } },
    .{ "GdipEnumerateMetafileDestRectI", MethodRecord{ .library = "gdiplus", .import = "GdipEnumerateMetafileDestRectI", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x11\xae\x4d\x18\x0f\x01\x0f\x11\x82\x0c" } },
    .{ "GdipEnumerateMetafileDestPoints", MethodRecord{ .library = "gdiplus", .import = "GdipEnumerateMetafileDestPoints", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x11\xae\x3d\x08\x18\x0f\x01\x0f\x11\x82\x0c" } },
    .{ "GdipEnumerateMetafileDestPointsI", MethodRecord{ .library = "gdiplus", .import = "GdipEnumerateMetafileDestPointsI", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x11\xae\x41\x08\x18\x0f\x01\x0f\x11\x82\x0c" } },
    .{ "GdipEnumerateMetafileSrcRectDestPoint", MethodRecord{ .library = "gdiplus", .import = "GdipEnumerateMetafileSrcRectDestPoint", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x11\xae\x3d\x0f\x11\xae\x49\x11\xae\x71\x18\x0f\x01\x0f\x11\x82\x0c" } },
    .{ "GdipEnumerateMetafileSrcRectDestPointI", MethodRecord{ .library = "gdiplus", .import = "GdipEnumerateMetafileSrcRectDestPointI", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x11\xae\x41\x0f\x11\xae\x4d\x11\xae\x71\x18\x0f\x01\x0f\x11\x82\x0c" } },
    .{ "GdipEnumerateMetafileSrcRectDestRect", MethodRecord{ .library = "gdiplus", .import = "GdipEnumerateMetafileSrcRectDestRect", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x11\xae\x49\x0f\x11\xae\x49\x11\xae\x71\x18\x0f\x01\x0f\x11\x82\x0c" } },
    .{ "GdipEnumerateMetafileSrcRectDestRectI", MethodRecord{ .library = "gdiplus", .import = "GdipEnumerateMetafileSrcRectDestRectI", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x11\xae\x4d\x0f\x11\xae\x4d\x11\xae\x71\x18\x0f\x01\x0f\x11\x82\x0c" } },
    .{ "GdipEnumerateMetafileSrcRectDestPoints", MethodRecord{ .library = "gdiplus", .import = "GdipEnumerateMetafileSrcRectDestPoints", .signature = "\x00\x09\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x11\xae\x3d\x08\x0f\x11\xae\x49\x11\xae\x71\x18\x0f\x01\x0f\x11\x82\x0c" } },
    .{ "GdipEnumerateMetafileSrcRectDestPointsI", MethodRecord{ .library = "gdiplus", .import = "GdipEnumerateMetafileSrcRectDestPointsI", .signature = "\x00\x09\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x11\xae\x41\x08\x0f\x11\xae\x4d\x11\xae\x71\x18\x0f\x01\x0f\x11\x82\x0c" } },
    .{ "GdipPlayMetafileRecord", MethodRecord{ .library = "gdiplus", .import = "GdipPlayMetafileRecord", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x08\x11\xae\xf5\x09\x09\x0f\x05" } },
    .{ "GdipSetClipGraphics", MethodRecord{ .library = "gdiplus", .import = "GdipSetClipGraphics", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x81\xd8\x11\xae\x5d" } },
    .{ "GdipSetClipRect", MethodRecord{ .library = "gdiplus", .import = "GdipSetClipRect", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0c\x0c\x0c\x0c\x11\xae\x5d" } },
    .{ "GdipSetClipRectI", MethodRecord{ .library = "gdiplus", .import = "GdipSetClipRectI", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x08\x08\x08\x08\x11\xae\x5d" } },
    .{ "GdipSetClipPath", MethodRecord{ .library = "gdiplus", .import = "GdipSetClipPath", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x10\x11\xae\x5d" } },
    .{ "GdipSetClipRegion", MethodRecord{ .library = "gdiplus", .import = "GdipSetClipRegion", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x14\x11\xae\x5d" } },
    .{ "GdipSetClipHrgn", MethodRecord{ .library = "gdiplus", .import = "GdipSetClipHrgn", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xd8\x11\x83\xe1\x11\xae\x5d" } },
    .{ "GdipResetClip", MethodRecord{ .library = "gdiplus", .import = "GdipResetClip", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x81\xd8" } },
    .{ "GdipTranslateClip", MethodRecord{ .library = "gdiplus", .import = "GdipTranslateClip", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xd8\x0c\x0c" } },
    .{ "GdipTranslateClipI", MethodRecord{ .library = "gdiplus", .import = "GdipTranslateClipI", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xd8\x08\x08" } },
    .{ "GdipGetClip", MethodRecord{ .library = "gdiplus", .import = "GdipGetClip", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x14" } },
    .{ "GdipGetClipBounds", MethodRecord{ .library = "gdiplus", .import = "GdipGetClipBounds", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\x49" } },
    .{ "GdipGetClipBoundsI", MethodRecord{ .library = "gdiplus", .import = "GdipGetClipBoundsI", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\x4d" } },
    .{ "GdipIsClipEmpty", MethodRecord{ .library = "gdiplus", .import = "GdipIsClipEmpty", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x59" } },
    .{ "GdipGetVisibleClipBounds", MethodRecord{ .library = "gdiplus", .import = "GdipGetVisibleClipBounds", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\x49" } },
    .{ "GdipGetVisibleClipBoundsI", MethodRecord{ .library = "gdiplus", .import = "GdipGetVisibleClipBoundsI", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\x4d" } },
    .{ "GdipIsVisibleClipEmpty", MethodRecord{ .library = "gdiplus", .import = "GdipIsVisibleClipEmpty", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x59" } },
    .{ "GdipIsVisiblePoint", MethodRecord{ .library = "gdiplus", .import = "GdipIsVisiblePoint", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0c\x0c\x0f\x11\x59" } },
    .{ "GdipIsVisiblePointI", MethodRecord{ .library = "gdiplus", .import = "GdipIsVisiblePointI", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x08\x08\x0f\x11\x59" } },
    .{ "GdipIsVisibleRect", MethodRecord{ .library = "gdiplus", .import = "GdipIsVisibleRect", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0c\x0c\x0c\x0c\x0f\x11\x59" } },
    .{ "GdipIsVisibleRectI", MethodRecord{ .library = "gdiplus", .import = "GdipIsVisibleRectI", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x08\x08\x08\x08\x0f\x11\x59" } },
    .{ "GdipSaveGraphics", MethodRecord{ .library = "gdiplus", .import = "GdipSaveGraphics", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x09" } },
    .{ "GdipRestoreGraphics", MethodRecord{ .library = "gdiplus", .import = "GdipRestoreGraphics", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x09" } },
    .{ "GdipBeginContainer", MethodRecord{ .library = "gdiplus", .import = "GdipBeginContainer", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\x49\x0f\x11\xae\x49\x11\xae\x71\x0f\x09" } },
    .{ "GdipBeginContainerI", MethodRecord{ .library = "gdiplus", .import = "GdipBeginContainerI", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\xae\x4d\x0f\x11\xae\x4d\x11\xae\x71\x0f\x09" } },
    .{ "GdipBeginContainer2", MethodRecord{ .library = "gdiplus", .import = "GdipBeginContainer2", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x0f\x09" } },
    .{ "GdipEndContainer", MethodRecord{ .library = "gdiplus", .import = "GdipEndContainer", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x81\xd8\x09" } },
    .{ "GdipGetMetafileHeaderFromWmf", MethodRecord{ .library = "gdiplus", .import = "GdipGetMetafileHeaderFromWmf", .signature = "\x00\x03\x11\xae\x29\x11\x8d\x71\x0f\x11\xae\xf9\x0f\x11\xae\xfd" } },
    .{ "GdipGetMetafileHeaderFromEmf", MethodRecord{ .library = "gdiplus", .import = "GdipGetMetafileHeaderFromEmf", .signature = "\x00\x02\x11\xae\x29\x11\x8e\x41\x0f\x11\xae\xfd" } },
    .{ "GdipGetMetafileHeaderFromFile", MethodRecord{ .library = "gdiplus", .import = "GdipGetMetafileHeaderFromFile", .signature = "\x00\x02\x11\xae\x29\x11\x05\x0f\x11\xae\xfd" } },
    .{ "GdipGetMetafileHeaderFromStream", MethodRecord{ .library = "gdiplus", .import = "GdipGetMetafileHeaderFromStream", .signature = "\x00\x02\x11\xae\x29\x12\x83\x75\x0f\x11\xae\xfd" } },
    .{ "GdipGetMetafileHeaderFromMetafile", MethodRecord{ .library = "gdiplus", .import = "GdipGetMetafileHeaderFromMetafile", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x08\x0f\x11\xae\xfd" } },
    .{ "GdipGetHemfFromMetafile", MethodRecord{ .library = "gdiplus", .import = "GdipGetHemfFromMetafile", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x08\x0f\x11\x8e\x41" } },
    .{ "GdipCreateStreamOnFile", MethodRecord{ .library = "gdiplus", .import = "GdipCreateStreamOnFile", .signature = "\x00\x03\x11\xae\x29\x11\x05\x09\x0f\x12\x83\x75" } },
    .{ "GdipCreateMetafileFromWmf", MethodRecord{ .library = "gdiplus", .import = "GdipCreateMetafileFromWmf", .signature = "\x00\x04\x11\xae\x29\x11\x8d\x71\x11\x59\x0f\x11\xae\xf9\x0f\x0f\x11\x82\x08" } },
    .{ "GdipCreateMetafileFromEmf", MethodRecord{ .library = "gdiplus", .import = "GdipCreateMetafileFromEmf", .signature = "\x00\x03\x11\xae\x29\x11\x8e\x41\x11\x59\x0f\x0f\x11\x82\x08" } },
    .{ "GdipCreateMetafileFromFile", MethodRecord{ .library = "gdiplus", .import = "GdipCreateMetafileFromFile", .signature = "\x00\x02\x11\xae\x29\x11\x05\x0f\x0f\x11\x82\x08" } },
    .{ "GdipCreateMetafileFromWmfFile", MethodRecord{ .library = "gdiplus", .import = "GdipCreateMetafileFromWmfFile", .signature = "\x00\x03\x11\xae\x29\x11\x05\x0f\x11\xae\xf9\x0f\x0f\x11\x82\x08" } },
    .{ "GdipCreateMetafileFromStream", MethodRecord{ .library = "gdiplus", .import = "GdipCreateMetafileFromStream", .signature = "\x00\x02\x11\xae\x29\x12\x83\x75\x0f\x0f\x11\x82\x08" } },
    .{ "GdipRecordMetafile", MethodRecord{ .library = "gdiplus", .import = "GdipRecordMetafile", .signature = "\x00\x06\x11\xae\x29\x11\x83\x5d\x11\xaf\x01\x0f\x11\xae\x49\x11\xaf\x05\x11\x05\x0f\x0f\x11\x82\x08" } },
    .{ "GdipRecordMetafileI", MethodRecord{ .library = "gdiplus", .import = "GdipRecordMetafileI", .signature = "\x00\x06\x11\xae\x29\x11\x83\x5d\x11\xaf\x01\x0f\x11\xae\x4d\x11\xaf\x05\x11\x05\x0f\x0f\x11\x82\x08" } },
    .{ "GdipRecordMetafileFileName", MethodRecord{ .library = "gdiplus", .import = "GdipRecordMetafileFileName", .signature = "\x00\x07\x11\xae\x29\x11\x05\x11\x83\x5d\x11\xaf\x01\x0f\x11\xae\x49\x11\xaf\x05\x11\x05\x0f\x0f\x11\x82\x08" } },
    .{ "GdipRecordMetafileFileNameI", MethodRecord{ .library = "gdiplus", .import = "GdipRecordMetafileFileNameI", .signature = "\x00\x07\x11\xae\x29\x11\x05\x11\x83\x5d\x11\xaf\x01\x0f\x11\xae\x4d\x11\xaf\x05\x11\x05\x0f\x0f\x11\x82\x08" } },
    .{ "GdipRecordMetafileStream", MethodRecord{ .library = "gdiplus", .import = "GdipRecordMetafileStream", .signature = "\x00\x07\x11\xae\x29\x12\x83\x75\x11\x83\x5d\x11\xaf\x01\x0f\x11\xae\x49\x11\xaf\x05\x11\x05\x0f\x0f\x11\x82\x08" } },
    .{ "GdipRecordMetafileStreamI", MethodRecord{ .library = "gdiplus", .import = "GdipRecordMetafileStreamI", .signature = "\x00\x07\x11\xae\x29\x12\x83\x75\x11\x83\x5d\x11\xaf\x01\x0f\x11\xae\x4d\x11\xaf\x05\x11\x05\x0f\x0f\x11\x82\x08" } },
    .{ "GdipSetMetafileDownLevelRasterizationLimit", MethodRecord{ .library = "gdiplus", .import = "GdipSetMetafileDownLevelRasterizationLimit", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x08\x09" } },
    .{ "GdipGetMetafileDownLevelRasterizationLimit", MethodRecord{ .library = "gdiplus", .import = "GdipGetMetafileDownLevelRasterizationLimit", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x08\x0f\x09" } },
    .{ "GdipGetImageDecodersSize", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageDecodersSize", .signature = "\x00\x02\x11\xae\x29\x0f\x09\x0f\x09" } },
    .{ "GdipGetImageDecoders", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageDecoders", .signature = "\x00\x03\x11\xae\x29\x09\x09\x0f\x11\xaf\x09" } },
    .{ "GdipGetImageEncodersSize", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageEncodersSize", .signature = "\x00\x02\x11\xae\x29\x0f\x09\x0f\x09" } },
    .{ "GdipGetImageEncoders", MethodRecord{ .library = "gdiplus", .import = "GdipGetImageEncoders", .signature = "\x00\x03\x11\xae\x29\x09\x09\x0f\x11\xaf\x09" } },
    .{ "GdipComment", MethodRecord{ .library = "gdiplus", .import = "GdipComment", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x81\xd8\x09\x0f\x05" } },
    .{ "GdipCreateFontFamilyFromName", MethodRecord{ .library = "gdiplus", .import = "GdipCreateFontFamilyFromName", .signature = "\x00\x03\x11\xae\x29\x11\x05\x0f\x11\x82\x28\x0f\x0f\x11\x82\x1c" } },
    .{ "GdipDeleteFontFamily", MethodRecord{ .library = "gdiplus", .import = "GdipDeleteFontFamily", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x1c" } },
    .{ "GdipCloneFontFamily", MethodRecord{ .library = "gdiplus", .import = "GdipCloneFontFamily", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x1c\x0f\x0f\x11\x82\x1c" } },
    .{ "GdipGetGenericFontFamilySansSerif", MethodRecord{ .library = "gdiplus", .import = "GdipGetGenericFontFamilySansSerif", .signature = "\x00\x01\x11\xae\x29\x0f\x0f\x11\x82\x1c" } },
    .{ "GdipGetGenericFontFamilySerif", MethodRecord{ .library = "gdiplus", .import = "GdipGetGenericFontFamilySerif", .signature = "\x00\x01\x11\xae\x29\x0f\x0f\x11\x82\x1c" } },
    .{ "GdipGetGenericFontFamilyMonospace", MethodRecord{ .library = "gdiplus", .import = "GdipGetGenericFontFamilyMonospace", .signature = "\x00\x01\x11\xae\x29\x0f\x0f\x11\x82\x1c" } },
    .{ "GdipGetFamilyName", MethodRecord{ .library = "gdiplus", .import = "GdipGetFamilyName", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x1c\x11\x05\x07" } },
    .{ "GdipIsStyleAvailable", MethodRecord{ .library = "gdiplus", .import = "GdipIsStyleAvailable", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x1c\x08\x0f\x11\x59" } },
    .{ "GdipGetEmHeight", MethodRecord{ .library = "gdiplus", .import = "GdipGetEmHeight", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x1c\x08\x0f\x07" } },
    .{ "GdipGetCellAscent", MethodRecord{ .library = "gdiplus", .import = "GdipGetCellAscent", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x1c\x08\x0f\x07" } },
    .{ "GdipGetCellDescent", MethodRecord{ .library = "gdiplus", .import = "GdipGetCellDescent", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x1c\x08\x0f\x07" } },
    .{ "GdipGetLineSpacing", MethodRecord{ .library = "gdiplus", .import = "GdipGetLineSpacing", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x1c\x08\x0f\x07" } },
    .{ "GdipCreateFontFromDC", MethodRecord{ .library = "gdiplus", .import = "GdipCreateFontFromDC", .signature = "\x00\x02\x11\xae\x29\x11\x83\x5d\x0f\x0f\x11\x82\x20" } },
    .{ "GdipCreateFontFromLogfontA", MethodRecord{ .library = "gdiplus", .import = "GdipCreateFontFromLogfontA", .signature = "\x00\x03\x11\xae\x29\x11\x83\x5d\x0f\x11\x8d\x95\x0f\x0f\x11\x82\x20" } },
    .{ "GdipCreateFontFromLogfontW", MethodRecord{ .library = "gdiplus", .import = "GdipCreateFontFromLogfontW", .signature = "\x00\x03\x11\xae\x29\x11\x83\x5d\x0f\x11\x83\xfd\x0f\x0f\x11\x82\x20" } },
    .{ "GdipCreateFont", MethodRecord{ .library = "gdiplus", .import = "GdipCreateFont", .signature = "\x00\x05\x11\xae\x29\x0f\x11\x82\x1c\x0c\x08\x11\xae\x71\x0f\x0f\x11\x82\x20" } },
    .{ "GdipCloneFont", MethodRecord{ .library = "gdiplus", .import = "GdipCloneFont", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x20\x0f\x0f\x11\x82\x20" } },
    .{ "GdipDeleteFont", MethodRecord{ .library = "gdiplus", .import = "GdipDeleteFont", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x20" } },
    .{ "GdipGetFamily", MethodRecord{ .library = "gdiplus", .import = "GdipGetFamily", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x20\x0f\x0f\x11\x82\x1c" } },
    .{ "GdipGetFontStyle", MethodRecord{ .library = "gdiplus", .import = "GdipGetFontStyle", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x20\x0f\x08" } },
    .{ "GdipGetFontSize", MethodRecord{ .library = "gdiplus", .import = "GdipGetFontSize", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x20\x0f\x0c" } },
    .{ "GdipGetFontUnit", MethodRecord{ .library = "gdiplus", .import = "GdipGetFontUnit", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x20\x0f\x11\xae\x71" } },
    .{ "GdipGetFontHeight", MethodRecord{ .library = "gdiplus", .import = "GdipGetFontHeight", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x20\x0f\x11\x81\xd8\x0f\x0c" } },
    .{ "GdipGetFontHeightGivenDPI", MethodRecord{ .library = "gdiplus", .import = "GdipGetFontHeightGivenDPI", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x20\x0c\x0f\x0c" } },
    .{ "GdipGetLogFontA", MethodRecord{ .library = "gdiplus", .import = "GdipGetLogFontA", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x20\x0f\x11\x81\xd8\x0f\x11\x8d\x95" } },
    .{ "GdipGetLogFontW", MethodRecord{ .library = "gdiplus", .import = "GdipGetLogFontW", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x20\x0f\x11\x81\xd8\x0f\x11\x83\xfd" } },
    .{ "GdipNewInstalledFontCollection", MethodRecord{ .library = "gdiplus", .import = "GdipNewInstalledFontCollection", .signature = "\x00\x01\x11\xae\x29\x0f\x0f\x11\x82\x28" } },
    .{ "GdipNewPrivateFontCollection", MethodRecord{ .library = "gdiplus", .import = "GdipNewPrivateFontCollection", .signature = "\x00\x01\x11\xae\x29\x0f\x0f\x11\x82\x28" } },
    .{ "GdipDeletePrivateFontCollection", MethodRecord{ .library = "gdiplus", .import = "GdipDeletePrivateFontCollection", .signature = "\x00\x01\x11\xae\x29\x0f\x0f\x11\x82\x28" } },
    .{ "GdipGetFontCollectionFamilyCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetFontCollectionFamilyCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x28\x0f\x08" } },
    .{ "GdipGetFontCollectionFamilyList", MethodRecord{ .library = "gdiplus", .import = "GdipGetFontCollectionFamilyList", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x28\x08\x0f\x0f\x11\x82\x1c\x0f\x08" } },
    .{ "GdipPrivateAddFontFile", MethodRecord{ .library = "gdiplus", .import = "GdipPrivateAddFontFile", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x28\x11\x05" } },
    .{ "GdipPrivateAddMemoryFont", MethodRecord{ .library = "gdiplus", .import = "GdipPrivateAddMemoryFont", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x28\x0f\x01\x08" } },
    .{ "GdipDrawString", MethodRecord{ .library = "gdiplus", .import = "GdipDrawString", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x81\xd8\x11\x05\x08\x0f\x11\x82\x20\x0f\x11\xae\x49\x0f\x11\x82\x24\x0f\x11\x81\xdc" } },
    .{ "GdipMeasureString", MethodRecord{ .library = "gdiplus", .import = "GdipMeasureString", .signature = "\x00\x09\x11\xae\x29\x0f\x11\x81\xd8\x11\x05\x08\x0f\x11\x82\x20\x0f\x11\xae\x49\x0f\x11\x82\x24\x0f\x11\xae\x49\x0f\x08\x0f\x08" } },
    .{ "GdipMeasureCharacterRanges", MethodRecord{ .library = "gdiplus", .import = "GdipMeasureCharacterRanges", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x81\xd8\x11\x05\x08\x0f\x11\x82\x20\x0f\x11\xae\x49\x0f\x11\x82\x24\x08\x0f\x0f\x11\x82\x14" } },
    .{ "GdipDrawDriverString", MethodRecord{ .library = "gdiplus", .import = "GdipDrawDriverString", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x81\xd8\x0f\x07\x08\x0f\x11\x82\x20\x0f\x11\x81\xdc\x0f\x11\xae\x3d\x08\x0f\x11\xae\x51" } },
    .{ "GdipMeasureDriverString", MethodRecord{ .library = "gdiplus", .import = "GdipMeasureDriverString", .signature = "\x00\x08\x11\xae\x29\x0f\x11\x81\xd8\x0f\x07\x08\x0f\x11\x82\x20\x0f\x11\xae\x3d\x08\x0f\x11\xae\x51\x0f\x11\xae\x49" } },
    .{ "GdipCreateStringFormat", MethodRecord{ .library = "gdiplus", .import = "GdipCreateStringFormat", .signature = "\x00\x03\x11\xae\x29\x08\x07\x0f\x0f\x11\x82\x24" } },
    .{ "GdipStringFormatGetGenericDefault", MethodRecord{ .library = "gdiplus", .import = "GdipStringFormatGetGenericDefault", .signature = "\x00\x01\x11\xae\x29\x0f\x0f\x11\x82\x24" } },
    .{ "GdipStringFormatGetGenericTypographic", MethodRecord{ .library = "gdiplus", .import = "GdipStringFormatGetGenericTypographic", .signature = "\x00\x01\x11\xae\x29\x0f\x0f\x11\x82\x24" } },
    .{ "GdipDeleteStringFormat", MethodRecord{ .library = "gdiplus", .import = "GdipDeleteStringFormat", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x24" } },
    .{ "GdipCloneStringFormat", MethodRecord{ .library = "gdiplus", .import = "GdipCloneStringFormat", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x24\x0f\x0f\x11\x82\x24" } },
    .{ "GdipSetStringFormatFlags", MethodRecord{ .library = "gdiplus", .import = "GdipSetStringFormatFlags", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x24\x08" } },
    .{ "GdipGetStringFormatFlags", MethodRecord{ .library = "gdiplus", .import = "GdipGetStringFormatFlags", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x24\x0f\x08" } },
    .{ "GdipSetStringFormatAlign", MethodRecord{ .library = "gdiplus", .import = "GdipSetStringFormatAlign", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x24\x11\xaf\x0d" } },
    .{ "GdipGetStringFormatAlign", MethodRecord{ .library = "gdiplus", .import = "GdipGetStringFormatAlign", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x24\x0f\x11\xaf\x0d" } },
    .{ "GdipSetStringFormatLineAlign", MethodRecord{ .library = "gdiplus", .import = "GdipSetStringFormatLineAlign", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x24\x11\xaf\x0d" } },
    .{ "GdipGetStringFormatLineAlign", MethodRecord{ .library = "gdiplus", .import = "GdipGetStringFormatLineAlign", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x24\x0f\x11\xaf\x0d" } },
    .{ "GdipSetStringFormatTrimming", MethodRecord{ .library = "gdiplus", .import = "GdipSetStringFormatTrimming", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x24\x11\xaf\x11" } },
    .{ "GdipGetStringFormatTrimming", MethodRecord{ .library = "gdiplus", .import = "GdipGetStringFormatTrimming", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x24\x0f\x11\xaf\x11" } },
    .{ "GdipSetStringFormatHotkeyPrefix", MethodRecord{ .library = "gdiplus", .import = "GdipSetStringFormatHotkeyPrefix", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x24\x08" } },
    .{ "GdipGetStringFormatHotkeyPrefix", MethodRecord{ .library = "gdiplus", .import = "GdipGetStringFormatHotkeyPrefix", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x24\x0f\x08" } },
    .{ "GdipSetStringFormatTabStops", MethodRecord{ .library = "gdiplus", .import = "GdipSetStringFormatTabStops", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x24\x0c\x08\x0f\x0c" } },
    .{ "GdipGetStringFormatTabStops", MethodRecord{ .library = "gdiplus", .import = "GdipGetStringFormatTabStops", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x82\x24\x08\x0f\x0c\x0f\x0c" } },
    .{ "GdipGetStringFormatTabStopCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetStringFormatTabStopCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x24\x0f\x08" } },
    .{ "GdipSetStringFormatDigitSubstitution", MethodRecord{ .library = "gdiplus", .import = "GdipSetStringFormatDigitSubstitution", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x24\x07\x11\xaf\x15" } },
    .{ "GdipGetStringFormatDigitSubstitution", MethodRecord{ .library = "gdiplus", .import = "GdipGetStringFormatDigitSubstitution", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x24\x0f\x07\x0f\x11\xaf\x15" } },
    .{ "GdipGetStringFormatMeasurableCharacterRangeCount", MethodRecord{ .library = "gdiplus", .import = "GdipGetStringFormatMeasurableCharacterRangeCount", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x24\x0f\x08" } },
    .{ "GdipSetStringFormatMeasurableCharacterRanges", MethodRecord{ .library = "gdiplus", .import = "GdipSetStringFormatMeasurableCharacterRanges", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x24\x08\x0f\x11\xaf\x19" } },
    .{ "GdipCreateCachedBitmap", MethodRecord{ .library = "gdiplus", .import = "GdipCreateCachedBitmap", .signature = "\x00\x03\x11\xae\x29\x0f\x11\x82\x04\x0f\x11\x81\xd8\x0f\x0f\x11\x82\x34" } },
    .{ "GdipDeleteCachedBitmap", MethodRecord{ .library = "gdiplus", .import = "GdipDeleteCachedBitmap", .signature = "\x00\x01\x11\xae\x29\x0f\x11\x82\x34" } },
    .{ "GdipDrawCachedBitmap", MethodRecord{ .library = "gdiplus", .import = "GdipDrawCachedBitmap", .signature = "\x00\x04\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x34\x08\x08" } },
    .{ "GdipEmfToWmfBits", MethodRecord{ .library = "gdiplus", .import = "GdipEmfToWmfBits", .signature = "\x00\x05\x09\x11\x8e\x41\x09\x0f\x05\x08\x08" } },
    .{ "GdipSetImageAttributesCachedBackground", MethodRecord{ .library = "gdiplus", .import = "GdipSetImageAttributesCachedBackground", .signature = "\x00\x02\x11\xae\x29\x0f\x11\x82\x0c\x11\x59" } },
    .{ "GdipTestControl", MethodRecord{ .library = "gdiplus", .import = "GdipTestControl", .signature = "\x00\x02\x11\xae\x29\x11\xaf\x1d\x0f\x01" } },
    .{ "GdiplusNotificationHook", MethodRecord{ .library = "gdiplus", .import = "GdiplusNotificationHook", .signature = "\x00\x01\x11\xae\x29\x0f\x19" } },
    .{ "GdiplusNotificationUnhook", MethodRecord{ .library = "gdiplus", .import = "GdiplusNotificationUnhook", .signature = "\x00\x01\x01\x19" } },
    .{ "GdipConvertToEmfPlus", MethodRecord{ .library = "gdiplus", .import = "GdipConvertToEmfPlus", .signature = "\x00\x06\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x08\x11\xaf\x01\x11\x05\x0f\x0f\x11\x82\x08" } },
    .{ "GdipConvertToEmfPlusToFile", MethodRecord{ .library = "gdiplus", .import = "GdipConvertToEmfPlusToFile", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x08\x11\x05\x11\xaf\x01\x11\x05\x0f\x0f\x11\x82\x08" } },
    .{ "GdipConvertToEmfPlusToStream", MethodRecord{ .library = "gdiplus", .import = "GdipConvertToEmfPlusToStream", .signature = "\x00\x07\x11\xae\x29\x0f\x11\x81\xd8\x0f\x11\x82\x08\x0f\x08\x12\x83\x75\x11\xaf\x01\x11\x05\x0f\x0f\x11\x82\x08" } },
});

pub fn resolveTypeRef(coded: u32) ?TypeRefEntry {
    return switch (coded) {
        0x5 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "PWSTR" },
        0xd => TypeRefEntry{ .namespace = "System", .name = "Guid" },
        0x25 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HWND" },
        0x59 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "BOOL" },
        0x85 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HANDLE" },
        0x1d8 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpGraphics" },
        0x1dc => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpBrush" },
        0x1e0 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpTexture" },
        0x1e4 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpSolidFill" },
        0x1e8 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpLineGradient" },
        0x1ec => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpPathGradient" },
        0x1f0 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpHatch" },
        0x1f4 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpPen" },
        0x1f8 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpCustomLineCap" },
        0x1fc => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpAdjustableArrowCap" },
        0x200 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpImage" },
        0x204 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpBitmap" },
        0x208 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpMetafile" },
        0x20c => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpImageAttributes" },
        0x210 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpPath" },
        0x214 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpRegion" },
        0x218 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpPathIterator" },
        0x21c => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpFontFamily" },
        0x220 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpFont" },
        0x224 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpStringFormat" },
        0x228 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpFontCollection" },
        0x229 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "HINSTANCE" },
        0x234 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpCachedBitmap" },
        0x351 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HBITMAP" },
        0x355 => TypeRefEntry{ .namespace = "Windows.Win32.UI.WindowsAndMessaging", .name = "HICON" },
        0x35d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HDC" },
        0x375 => TypeRefEntry{ .namespace = "Windows.Win32.System.Com", .name = "IStream" },
        0x389 => TypeRefEntry{ .namespace = "Windows.Win32.Foundation", .name = "RECT" },
        0x3e1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HRGN" },
        0x3fd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "LOGFONTW" },
        0xd65 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HPALETTE" },
        0xd71 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HMETAFILE" },
        0xd8d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "BITMAPINFO" },
        0xd95 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "LOGFONTA" },
        0xe41 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.Gdi", .name = "HENHMETAFILE" },
        0x2e29 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "Status" },
        0x2e2d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GdiplusStartupInput" },
        0x2e31 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GdiplusStartupOutput" },
        0x2e35 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "CGpEffect" },
        0x2e39 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "FillMode" },
        0x2e3d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "PointF" },
        0x2e41 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "Point" },
        0x2e45 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "PathData" },
        0x2e49 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "RectF" },
        0x2e4d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "Rect" },
        0x2e51 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "Matrix" },
        0x2e55 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "WarpMode" },
        0x2e59 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "MatrixOrder" },
        0x2e5d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "CombineMode" },
        0x2e61 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "BrushType" },
        0x2e65 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "HatchStyle" },
        0x2e69 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "WrapMode" },
        0x2e6d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "LinearGradientMode" },
        0x2e71 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "Unit" },
        0x2e75 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "LineCap" },
        0x2e79 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "DashCap" },
        0x2e7d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "LineJoin" },
        0x2e81 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "PenAlignment" },
        0x2e85 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "PenType" },
        0x2e89 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "DashStyle" },
        0x2e8d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "CustomLineCapType" },
        0x2e91 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "EncoderParameters" },
        0x2e95 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "ImageType" },
        0x2e99 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "RotateFlipType" },
        0x2e9d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "ColorPalette" },
        0x2ea1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "PropertyItem" },
        0x2ea5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "ImageItemData" },
        0x2ea9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.DirectDraw", .name = "IDirectDrawSurface7" },
        0x2ead => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "BitmapData" },
        0x2eb1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GdiplusAbort" },
        0x2eb5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "DitherType" },
        0x2eb9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "PaletteType" },
        0x2ebd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "HistogramFormat" },
        0x2ec1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "ColorAdjustType" },
        0x2ec5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "ColorMatrix" },
        0x2ec9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "ColorMatrixFlags" },
        0x2ecd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "ColorChannelFlags" },
        0x2ed1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "ColorMap" },
        0x2ed5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "FlushIntention" },
        0x2ed9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "CompositingMode" },
        0x2edd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "CompositingQuality" },
        0x2ee1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "SmoothingMode" },
        0x2ee5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "PixelOffsetMode" },
        0x2ee9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "TextRenderingHint" },
        0x2eed => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "InterpolationMode" },
        0x2ef1 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "CoordinateSpace" },
        0x2ef5 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "EmfPlusRecordType" },
        0x2ef9 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "WmfPlaceableFileHeader" },
        0x2efd => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "MetafileHeader" },
        0x2f01 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "EmfType" },
        0x2f05 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "MetafileFrameUnit" },
        0x2f09 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "ImageCodecInfo" },
        0x2f0d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "StringAlignment" },
        0x2f11 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "StringTrimming" },
        0x2f15 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "StringDigitSubstitute" },
        0x2f19 => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "CharacterRange" },
        0x2f1d => TypeRefEntry{ .namespace = "Windows.Win32.Graphics.GdiPlus", .name = "GpTestControlEnum" },
        else => null,
    };
}

pub const GDIP_EMFPLUS_RECORD_BASE = 16384;
pub const GDIP_WMF_RECORD_BASE = 65536;
pub const PropertyTagTypeByte = 1;
pub const PropertyTagTypeASCII = 2;
pub const PropertyTagTypeShort = 3;
pub const PropertyTagTypeLong = 4;
pub const PropertyTagTypeRational = 5;
pub const PropertyTagTypeUndefined = 7;
pub const PropertyTagTypeSLONG = 9;
pub const PropertyTagTypeSRational = 10;
pub const PropertyTagExifIFD = 34665;
pub const PropertyTagGpsIFD = 34853;
pub const PropertyTagNewSubfileType = 254;
pub const PropertyTagSubfileType = 255;
pub const PropertyTagImageWidth = 256;
pub const PropertyTagImageHeight = 257;
pub const PropertyTagBitsPerSample = 258;
pub const PropertyTagCompression = 259;
pub const PropertyTagPhotometricInterp = 262;
pub const PropertyTagThreshHolding = 263;
pub const PropertyTagCellWidth = 264;
pub const PropertyTagCellHeight = 265;
pub const PropertyTagFillOrder = 266;
pub const PropertyTagDocumentName = 269;
pub const PropertyTagImageDescription = 270;
pub const PropertyTagEquipMake = 271;
pub const PropertyTagEquipModel = 272;
pub const PropertyTagStripOffsets = 273;
pub const PropertyTagOrientation = 274;
pub const PropertyTagSamplesPerPixel = 277;
pub const PropertyTagRowsPerStrip = 278;
pub const PropertyTagStripBytesCount = 279;
pub const PropertyTagMinSampleValue = 280;
pub const PropertyTagMaxSampleValue = 281;
pub const PropertyTagXResolution = 282;
pub const PropertyTagYResolution = 283;
pub const PropertyTagPlanarConfig = 284;
pub const PropertyTagPageName = 285;
pub const PropertyTagXPosition = 286;
pub const PropertyTagYPosition = 287;
pub const PropertyTagFreeOffset = 288;
pub const PropertyTagFreeByteCounts = 289;
pub const PropertyTagGrayResponseUnit = 290;
pub const PropertyTagGrayResponseCurve = 291;
pub const PropertyTagT4Option = 292;
pub const PropertyTagT6Option = 293;
pub const PropertyTagResolutionUnit = 296;
pub const PropertyTagPageNumber = 297;
pub const PropertyTagTransferFuncition = 301;
pub const PropertyTagSoftwareUsed = 305;
pub const PropertyTagDateTime = 306;
pub const PropertyTagArtist = 315;
pub const PropertyTagHostComputer = 316;
pub const PropertyTagPredictor = 317;
pub const PropertyTagWhitePoint = 318;
pub const PropertyTagPrimaryChromaticities = 319;
pub const PropertyTagColorMap = 320;
pub const PropertyTagHalftoneHints = 321;
pub const PropertyTagTileWidth = 322;
pub const PropertyTagTileLength = 323;
pub const PropertyTagTileOffset = 324;
pub const PropertyTagTileByteCounts = 325;
pub const PropertyTagInkSet = 332;
pub const PropertyTagInkNames = 333;
pub const PropertyTagNumberOfInks = 334;
pub const PropertyTagDotRange = 336;
pub const PropertyTagTargetPrinter = 337;
pub const PropertyTagExtraSamples = 338;
pub const PropertyTagSampleFormat = 339;
pub const PropertyTagSMinSampleValue = 340;
pub const PropertyTagSMaxSampleValue = 341;
pub const PropertyTagTransferRange = 342;
pub const PropertyTagJPEGProc = 512;
pub const PropertyTagJPEGInterFormat = 513;
pub const PropertyTagJPEGInterLength = 514;
pub const PropertyTagJPEGRestartInterval = 515;
pub const PropertyTagJPEGLosslessPredictors = 517;
pub const PropertyTagJPEGPointTransforms = 518;
pub const PropertyTagJPEGQTables = 519;
pub const PropertyTagJPEGDCTables = 520;
pub const PropertyTagJPEGACTables = 521;
pub const PropertyTagYCbCrCoefficients = 529;
pub const PropertyTagYCbCrSubsampling = 530;
pub const PropertyTagYCbCrPositioning = 531;
pub const PropertyTagREFBlackWhite = 532;
pub const PropertyTagICCProfile = 34675;
pub const PropertyTagGamma = 769;
pub const PropertyTagICCProfileDescriptor = 770;
pub const PropertyTagSRGBRenderingIntent = 771;
pub const PropertyTagImageTitle = 800;
pub const PropertyTagCopyright = 33432;
pub const PropertyTagResolutionXUnit = 20481;
pub const PropertyTagResolutionYUnit = 20482;
pub const PropertyTagResolutionXLengthUnit = 20483;
pub const PropertyTagResolutionYLengthUnit = 20484;
pub const PropertyTagPrintFlags = 20485;
pub const PropertyTagPrintFlagsVersion = 20486;
pub const PropertyTagPrintFlagsCrop = 20487;
pub const PropertyTagPrintFlagsBleedWidth = 20488;
pub const PropertyTagPrintFlagsBleedWidthScale = 20489;
pub const PropertyTagHalftoneLPI = 20490;
pub const PropertyTagHalftoneLPIUnit = 20491;
pub const PropertyTagHalftoneDegree = 20492;
pub const PropertyTagHalftoneShape = 20493;
pub const PropertyTagHalftoneMisc = 20494;
pub const PropertyTagHalftoneScreen = 20495;
pub const PropertyTagJPEGQuality = 20496;
pub const PropertyTagGridSize = 20497;
pub const PropertyTagThumbnailFormat = 20498;
pub const PropertyTagThumbnailWidth = 20499;
pub const PropertyTagThumbnailHeight = 20500;
pub const PropertyTagThumbnailColorDepth = 20501;
pub const PropertyTagThumbnailPlanes = 20502;
pub const PropertyTagThumbnailRawBytes = 20503;
pub const PropertyTagThumbnailSize = 20504;
pub const PropertyTagThumbnailCompressedSize = 20505;
pub const PropertyTagColorTransferFunction = 20506;
pub const PropertyTagThumbnailData = 20507;
pub const PropertyTagThumbnailImageWidth = 20512;
pub const PropertyTagThumbnailImageHeight = 20513;
pub const PropertyTagThumbnailBitsPerSample = 20514;
pub const PropertyTagThumbnailCompression = 20515;
pub const PropertyTagThumbnailPhotometricInterp = 20516;
pub const PropertyTagThumbnailImageDescription = 20517;
pub const PropertyTagThumbnailEquipMake = 20518;
pub const PropertyTagThumbnailEquipModel = 20519;
pub const PropertyTagThumbnailStripOffsets = 20520;
pub const PropertyTagThumbnailOrientation = 20521;
pub const PropertyTagThumbnailSamplesPerPixel = 20522;
pub const PropertyTagThumbnailRowsPerStrip = 20523;
pub const PropertyTagThumbnailStripBytesCount = 20524;
pub const PropertyTagThumbnailResolutionX = 20525;
pub const PropertyTagThumbnailResolutionY = 20526;
pub const PropertyTagThumbnailPlanarConfig = 20527;
pub const PropertyTagThumbnailResolutionUnit = 20528;
pub const PropertyTagThumbnailTransferFunction = 20529;
pub const PropertyTagThumbnailSoftwareUsed = 20530;
pub const PropertyTagThumbnailDateTime = 20531;
pub const PropertyTagThumbnailArtist = 20532;
pub const PropertyTagThumbnailWhitePoint = 20533;
pub const PropertyTagThumbnailPrimaryChromaticities = 20534;
pub const PropertyTagThumbnailYCbCrCoefficients = 20535;
pub const PropertyTagThumbnailYCbCrSubsampling = 20536;
pub const PropertyTagThumbnailYCbCrPositioning = 20537;
pub const PropertyTagThumbnailRefBlackWhite = 20538;
pub const PropertyTagThumbnailCopyRight = 20539;
pub const PropertyTagLuminanceTable = 20624;
pub const PropertyTagChrominanceTable = 20625;
pub const PropertyTagFrameDelay = 20736;
pub const PropertyTagLoopCount = 20737;
pub const PropertyTagGlobalPalette = 20738;
pub const PropertyTagIndexBackground = 20739;
pub const PropertyTagIndexTransparent = 20740;
pub const PropertyTagPixelUnit = 20752;
pub const PropertyTagPixelPerUnitX = 20753;
pub const PropertyTagPixelPerUnitY = 20754;
pub const PropertyTagPaletteHistogram = 20755;
pub const PropertyTagExifExposureTime = 33434;
pub const PropertyTagExifFNumber = 33437;
pub const PropertyTagExifExposureProg = 34850;
pub const PropertyTagExifSpectralSense = 34852;
pub const PropertyTagExifISOSpeed = 34855;
pub const PropertyTagExifOECF = 34856;
pub const PropertyTagExifVer = 36864;
pub const PropertyTagExifDTOrig = 36867;
pub const PropertyTagExifDTDigitized = 36868;
pub const PropertyTagExifCompConfig = 37121;
pub const PropertyTagExifCompBPP = 37122;
pub const PropertyTagExifShutterSpeed = 37377;
pub const PropertyTagExifAperture = 37378;
pub const PropertyTagExifBrightness = 37379;
pub const PropertyTagExifExposureBias = 37380;
pub const PropertyTagExifMaxAperture = 37381;
pub const PropertyTagExifSubjectDist = 37382;
pub const PropertyTagExifMeteringMode = 37383;
pub const PropertyTagExifLightSource = 37384;
pub const PropertyTagExifFlash = 37385;
pub const PropertyTagExifFocalLength = 37386;
pub const PropertyTagExifSubjectArea = 37396;
pub const PropertyTagExifMakerNote = 37500;
pub const PropertyTagExifUserComment = 37510;
pub const PropertyTagExifDTSubsec = 37520;
pub const PropertyTagExifDTOrigSS = 37521;
pub const PropertyTagExifDTDigSS = 37522;
pub const PropertyTagExifFPXVer = 40960;
pub const PropertyTagExifColorSpace = 40961;
pub const PropertyTagExifPixXDim = 40962;
pub const PropertyTagExifPixYDim = 40963;
pub const PropertyTagExifRelatedWav = 40964;
pub const PropertyTagExifInterop = 40965;
pub const PropertyTagExifFlashEnergy = 41483;
pub const PropertyTagExifSpatialFR = 41484;
pub const PropertyTagExifFocalXRes = 41486;
pub const PropertyTagExifFocalYRes = 41487;
pub const PropertyTagExifFocalResUnit = 41488;
pub const PropertyTagExifSubjectLoc = 41492;
pub const PropertyTagExifExposureIndex = 41493;
pub const PropertyTagExifSensingMethod = 41495;
pub const PropertyTagExifFileSource = 41728;
pub const PropertyTagExifSceneType = 41729;
pub const PropertyTagExifCfaPattern = 41730;
pub const PropertyTagExifCustomRendered = 41985;
pub const PropertyTagExifExposureMode = 41986;
pub const PropertyTagExifWhiteBalance = 41987;
pub const PropertyTagExifDigitalZoomRatio = 41988;
pub const PropertyTagExifFocalLengthIn35mmFilm = 41989;
pub const PropertyTagExifSceneCaptureType = 41990;
pub const PropertyTagExifGainControl = 41991;
pub const PropertyTagExifContrast = 41992;
pub const PropertyTagExifSaturation = 41993;
pub const PropertyTagExifSharpness = 41994;
pub const PropertyTagExifDeviceSettingDesc = 41995;
pub const PropertyTagExifSubjectDistanceRange = 41996;
pub const PropertyTagExifUniqueImageID = 42016;
pub const PropertyTagGpsVer = 0;
pub const PropertyTagGpsLatitudeRef = 1;
pub const PropertyTagGpsLatitude = 2;
pub const PropertyTagGpsLongitudeRef = 3;
pub const PropertyTagGpsLongitude = 4;
pub const PropertyTagGpsAltitudeRef = 5;
pub const PropertyTagGpsAltitude = 6;
pub const PropertyTagGpsGpsTime = 7;
pub const PropertyTagGpsGpsSatellites = 8;
pub const PropertyTagGpsGpsStatus = 9;
pub const PropertyTagGpsGpsMeasureMode = 10;
pub const PropertyTagGpsGpsDop = 11;
pub const PropertyTagGpsSpeedRef = 12;
pub const PropertyTagGpsSpeed = 13;
pub const PropertyTagGpsTrackRef = 14;
pub const PropertyTagGpsTrack = 15;
pub const PropertyTagGpsImgDirRef = 16;
pub const PropertyTagGpsImgDir = 17;
pub const PropertyTagGpsMapDatum = 18;
pub const PropertyTagGpsDestLatRef = 19;
pub const PropertyTagGpsDestLat = 20;
pub const PropertyTagGpsDestLongRef = 21;
pub const PropertyTagGpsDestLong = 22;
pub const PropertyTagGpsDestBearRef = 23;
pub const PropertyTagGpsDestBear = 24;
pub const PropertyTagGpsDestDistRef = 25;
pub const PropertyTagGpsDestDist = 26;
pub const PropertyTagGpsProcessingMethod = 27;
pub const PropertyTagGpsAreaInformation = 28;
pub const PropertyTagGpsDate = 29;
pub const PropertyTagGpsDifferential = 30;
pub const GDIP_EMFPLUSFLAGS_DISPLAY = 1;
pub const ALPHA_SHIFT = 24;
pub const RED_SHIFT = 16;
pub const GREEN_SHIFT = 8;
pub const BLUE_SHIFT = 0;
pub const PixelFormatIndexed = 65536;
pub const PixelFormatGDI = 131072;
pub const PixelFormatAlpha = 262144;
pub const PixelFormatPAlpha = 524288;
pub const PixelFormatExtended = 1048576;
pub const PixelFormatCanonical = 2097152;
pub const PixelFormatUndefined = 0;
pub const PixelFormatDontCare = 0;
pub const PixelFormatMax = 16;
pub const FillModeAlternate = 0;
pub const FillModeWinding = 1;
pub const QualityModeInvalid = -1;
pub const QualityModeDefault = 0;
pub const QualityModeLow = 1;
pub const QualityModeHigh = 2;
pub const CompositingModeSourceOver = 0;
pub const CompositingModeSourceCopy = 1;
pub const CompositingQualityInvalid = -1;
pub const CompositingQualityDefault = 0;
pub const CompositingQualityHighSpeed = 1;
pub const CompositingQualityHighQuality = 2;
pub const CompositingQualityGammaCorrected = 3;
pub const CompositingQualityAssumeLinear = 4;
pub const UnitWorld = 0;
pub const UnitDisplay = 1;
pub const UnitPixel = 2;
pub const UnitPoint = 3;
pub const UnitInch = 4;
pub const UnitDocument = 5;
pub const UnitMillimeter = 6;
pub const MetafileFrameUnitPixel = 2;
pub const MetafileFrameUnitPoint = 3;
pub const MetafileFrameUnitInch = 4;
pub const MetafileFrameUnitDocument = 5;
pub const MetafileFrameUnitMillimeter = 6;
pub const MetafileFrameUnitGdi = 7;
pub const CoordinateSpaceWorld = 0;
pub const CoordinateSpacePage = 1;
pub const CoordinateSpaceDevice = 2;
pub const WrapModeTile = 0;
pub const WrapModeTileFlipX = 1;
pub const WrapModeTileFlipY = 2;
pub const WrapModeTileFlipXY = 3;
pub const WrapModeClamp = 4;
pub const HatchStyleHorizontal = 0;
pub const HatchStyleVertical = 1;
pub const HatchStyleForwardDiagonal = 2;
pub const HatchStyleBackwardDiagonal = 3;
pub const HatchStyleCross = 4;
pub const HatchStyleDiagonalCross = 5;
pub const HatchStyle05Percent = 6;
pub const HatchStyle10Percent = 7;
pub const HatchStyle20Percent = 8;
pub const HatchStyle25Percent = 9;
pub const HatchStyle30Percent = 10;
pub const HatchStyle40Percent = 11;
pub const HatchStyle50Percent = 12;
pub const HatchStyle60Percent = 13;
pub const HatchStyle70Percent = 14;
pub const HatchStyle75Percent = 15;
pub const HatchStyle80Percent = 16;
pub const HatchStyle90Percent = 17;
pub const HatchStyleLightDownwardDiagonal = 18;
pub const HatchStyleLightUpwardDiagonal = 19;
pub const HatchStyleDarkDownwardDiagonal = 20;
pub const HatchStyleDarkUpwardDiagonal = 21;
pub const HatchStyleWideDownwardDiagonal = 22;
pub const HatchStyleWideUpwardDiagonal = 23;
pub const HatchStyleLightVertical = 24;
pub const HatchStyleLightHorizontal = 25;
pub const HatchStyleNarrowVertical = 26;
pub const HatchStyleNarrowHorizontal = 27;
pub const HatchStyleDarkVertical = 28;
pub const HatchStyleDarkHorizontal = 29;
pub const HatchStyleDashedDownwardDiagonal = 30;
pub const HatchStyleDashedUpwardDiagonal = 31;
pub const HatchStyleDashedHorizontal = 32;
pub const HatchStyleDashedVertical = 33;
pub const HatchStyleSmallConfetti = 34;
pub const HatchStyleLargeConfetti = 35;
pub const HatchStyleZigZag = 36;
pub const HatchStyleWave = 37;
pub const HatchStyleDiagonalBrick = 38;
pub const HatchStyleHorizontalBrick = 39;
pub const HatchStyleWeave = 40;
pub const HatchStylePlaid = 41;
pub const HatchStyleDivot = 42;
pub const HatchStyleDottedGrid = 43;
pub const HatchStyleDottedDiamond = 44;
pub const HatchStyleShingle = 45;
pub const HatchStyleTrellis = 46;
pub const HatchStyleSphere = 47;
pub const HatchStyleSmallGrid = 48;
pub const HatchStyleSmallCheckerBoard = 49;
pub const HatchStyleLargeCheckerBoard = 50;
pub const HatchStyleOutlinedDiamond = 51;
pub const HatchStyleSolidDiamond = 52;
pub const HatchStyleTotal = 53;
pub const HatchStyleLargeGrid = 4;
pub const HatchStyleMin = 0;
pub const HatchStyleMax = 52;
pub const DashStyleSolid = 0;
pub const DashStyleDash = 1;
pub const DashStyleDot = 2;
pub const DashStyleDashDot = 3;
pub const DashStyleDashDotDot = 4;
pub const DashStyleCustom = 5;
pub const DashCapFlat = 0;
pub const DashCapRound = 2;
pub const DashCapTriangle = 3;
pub const LineCapFlat = 0;
pub const LineCapSquare = 1;
pub const LineCapRound = 2;
pub const LineCapTriangle = 3;
pub const LineCapNoAnchor = 16;
pub const LineCapSquareAnchor = 17;
pub const LineCapRoundAnchor = 18;
pub const LineCapDiamondAnchor = 19;
pub const LineCapArrowAnchor = 20;
pub const LineCapCustom = 255;
pub const LineCapAnchorMask = 240;
pub const CustomLineCapTypeDefault = 0;
pub const CustomLineCapTypeAdjustableArrow = 1;
pub const LineJoinMiter = 0;
pub const LineJoinBevel = 1;
pub const LineJoinRound = 2;
pub const LineJoinMiterClipped = 3;
pub const PathPointTypeStart = 0;
pub const PathPointTypeLine = 1;
pub const PathPointTypeBezier = 3;
pub const PathPointTypePathTypeMask = 7;
pub const PathPointTypeDashMode = 16;
pub const PathPointTypePathMarker = 32;
pub const PathPointTypeCloseSubpath = 128;
pub const PathPointTypeBezier3 = 3;
pub const WarpModePerspective = 0;
pub const WarpModeBilinear = 1;
pub const LinearGradientModeHorizontal = 0;
pub const LinearGradientModeVertical = 1;
pub const LinearGradientModeForwardDiagonal = 2;
pub const LinearGradientModeBackwardDiagonal = 3;
pub const CombineModeReplace = 0;
pub const CombineModeIntersect = 1;
pub const CombineModeUnion = 2;
pub const CombineModeXor = 3;
pub const CombineModeExclude = 4;
pub const CombineModeComplement = 5;
pub const ImageTypeUnknown = 0;
pub const ImageTypeBitmap = 1;
pub const ImageTypeMetafile = 2;
pub const InterpolationModeInvalid = -1;
pub const InterpolationModeDefault = 0;
pub const InterpolationModeLowQuality = 1;
pub const InterpolationModeHighQuality = 2;
pub const InterpolationModeBilinear = 3;
pub const InterpolationModeBicubic = 4;
pub const InterpolationModeNearestNeighbor = 5;
pub const InterpolationModeHighQualityBilinear = 6;
pub const InterpolationModeHighQualityBicubic = 7;
pub const PenAlignmentCenter = 0;
pub const PenAlignmentInset = 1;
pub const BrushTypeSolidColor = 0;
pub const BrushTypeHatchFill = 1;
pub const BrushTypeTextureFill = 2;
pub const BrushTypePathGradient = 3;
pub const BrushTypeLinearGradient = 4;
pub const PenTypeSolidColor = 0;
pub const PenTypeHatchFill = 1;
pub const PenTypeTextureFill = 2;
pub const PenTypePathGradient = 3;
pub const PenTypeLinearGradient = 4;
pub const PenTypeUnknown = -1;
pub const MatrixOrderPrepend = 0;
pub const MatrixOrderAppend = 1;
pub const GenericFontFamilySerif = 0;
pub const GenericFontFamilySansSerif = 1;
pub const GenericFontFamilyMonospace = 2;
pub const FontStyleRegular = 0;
pub const FontStyleBold = 1;
pub const FontStyleItalic = 2;
pub const FontStyleBoldItalic = 3;
pub const FontStyleUnderline = 4;
pub const FontStyleStrikeout = 8;
pub const SmoothingModeInvalid = -1;
pub const SmoothingModeDefault = 0;
pub const SmoothingModeHighSpeed = 1;
pub const SmoothingModeHighQuality = 2;
pub const SmoothingModeNone = 3;
pub const SmoothingModeAntiAlias = 4;
pub const SmoothingModeAntiAlias8x4 = 4;
pub const SmoothingModeAntiAlias8x8 = 5;
pub const PixelOffsetModeInvalid = -1;
pub const PixelOffsetModeDefault = 0;
pub const PixelOffsetModeHighSpeed = 1;
pub const PixelOffsetModeHighQuality = 2;
pub const PixelOffsetModeNone = 3;
pub const PixelOffsetModeHalf = 4;
pub const TextRenderingHintSystemDefault = 0;
pub const TextRenderingHintSingleBitPerPixelGridFit = 1;
pub const TextRenderingHintSingleBitPerPixel = 2;
pub const TextRenderingHintAntiAliasGridFit = 3;
pub const TextRenderingHintAntiAlias = 4;
pub const TextRenderingHintClearTypeGridFit = 5;
pub const MetafileTypeInvalid = 0;
pub const MetafileTypeWmf = 1;
pub const MetafileTypeWmfPlaceable = 2;
pub const MetafileTypeEmf = 3;
pub const MetafileTypeEmfPlusOnly = 4;
pub const MetafileTypeEmfPlusDual = 5;
pub const EmfTypeEmfOnly = 3;
pub const EmfTypeEmfPlusOnly = 4;
pub const EmfTypeEmfPlusDual = 5;
pub const ObjectTypeInvalid = 0;
pub const ObjectTypeBrush = 1;
pub const ObjectTypePen = 2;
pub const ObjectTypePath = 3;
pub const ObjectTypeRegion = 4;
pub const ObjectTypeImage = 5;
pub const ObjectTypeFont = 6;
pub const ObjectTypeStringFormat = 7;
pub const ObjectTypeImageAttributes = 8;
pub const ObjectTypeCustomLineCap = 9;
pub const ObjectTypeGraphics = 10;
pub const ObjectTypeMax = 10;
pub const ObjectTypeMin = 1;
pub const WmfRecordTypeSetBkColor = 66049;
pub const WmfRecordTypeSetBkMode = 65794;
pub const WmfRecordTypeSetMapMode = 65795;
pub const WmfRecordTypeSetROP2 = 65796;
pub const WmfRecordTypeSetRelAbs = 65797;
pub const WmfRecordTypeSetPolyFillMode = 65798;
pub const WmfRecordTypeSetStretchBltMode = 65799;
pub const WmfRecordTypeSetTextCharExtra = 65800;
pub const WmfRecordTypeSetTextColor = 66057;
pub const WmfRecordTypeSetTextJustification = 66058;
pub const WmfRecordTypeSetWindowOrg = 66059;
pub const WmfRecordTypeSetWindowExt = 66060;
pub const WmfRecordTypeSetViewportOrg = 66061;
pub const WmfRecordTypeSetViewportExt = 66062;
pub const WmfRecordTypeOffsetWindowOrg = 66063;
pub const WmfRecordTypeScaleWindowExt = 66576;
pub const WmfRecordTypeOffsetViewportOrg = 66065;
pub const WmfRecordTypeScaleViewportExt = 66578;
pub const WmfRecordTypeLineTo = 66067;
pub const WmfRecordTypeMoveTo = 66068;
pub const WmfRecordTypeExcludeClipRect = 66581;
pub const WmfRecordTypeIntersectClipRect = 66582;
pub const WmfRecordTypeArc = 67607;
pub const WmfRecordTypeEllipse = 66584;
pub const WmfRecordTypeFloodFill = 66585;
pub const WmfRecordTypePie = 67610;
pub const WmfRecordTypeRectangle = 66587;
pub const WmfRecordTypeRoundRect = 67100;
pub const WmfRecordTypePatBlt = 67101;
pub const WmfRecordTypeSaveDC = 65566;
pub const WmfRecordTypeSetPixel = 66591;
pub const WmfRecordTypeOffsetClipRgn = 66080;
pub const WmfRecordTypeTextOut = 66849;
pub const WmfRecordTypeBitBlt = 67874;
pub const WmfRecordTypeStretchBlt = 68387;
pub const WmfRecordTypePolygon = 66340;
pub const WmfRecordTypePolyline = 66341;
pub const WmfRecordTypeEscape = 67110;
pub const WmfRecordTypeRestoreDC = 65831;
pub const WmfRecordTypeFillRegion = 66088;
pub const WmfRecordTypeFrameRegion = 66601;
pub const WmfRecordTypeInvertRegion = 65834;
pub const WmfRecordTypePaintRegion = 65835;
pub const WmfRecordTypeSelectClipRegion = 65836;
pub const WmfRecordTypeSelectObject = 65837;
pub const WmfRecordTypeSetTextAlign = 65838;
pub const WmfRecordTypeDrawText = 67119;
pub const WmfRecordTypeChord = 67632;
pub const WmfRecordTypeSetMapperFlags = 66097;
pub const WmfRecordTypeExtTextOut = 68146;
pub const WmfRecordTypeSetDIBToDev = 68915;
pub const WmfRecordTypeSelectPalette = 66100;
pub const WmfRecordTypeRealizePalette = 65589;
pub const WmfRecordTypeAnimatePalette = 66614;
pub const WmfRecordTypeSetPalEntries = 65591;
pub const WmfRecordTypePolyPolygon = 66872;
pub const WmfRecordTypeResizePalette = 65849;
pub const WmfRecordTypeDIBBitBlt = 67904;
pub const WmfRecordTypeDIBStretchBlt = 68417;
pub const WmfRecordTypeDIBCreatePatternBrush = 65858;
pub const WmfRecordTypeStretchDIB = 69443;
pub const WmfRecordTypeExtFloodFill = 66888;
pub const WmfRecordTypeSetLayout = 65865;
pub const WmfRecordTypeResetDC = 65868;
pub const WmfRecordTypeStartDoc = 65869;
pub const WmfRecordTypeStartPage = 65615;
pub const WmfRecordTypeEndPage = 65616;
pub const WmfRecordTypeAbortDoc = 65618;
pub const WmfRecordTypeEndDoc = 65630;
pub const WmfRecordTypeDeleteObject = 66032;
pub const WmfRecordTypeCreatePalette = 65783;
pub const WmfRecordTypeCreateBrush = 65784;
pub const WmfRecordTypeCreatePatternBrush = 66041;
pub const WmfRecordTypeCreatePenIndirect = 66298;
pub const WmfRecordTypeCreateFontIndirect = 66299;
pub const WmfRecordTypeCreateBrushIndirect = 66300;
pub const WmfRecordTypeCreateBitmapIndirect = 66301;
pub const WmfRecordTypeCreateBitmap = 67326;
pub const WmfRecordTypeCreateRegion = 67327;
pub const EmfRecordTypeHeader = 1;
pub const EmfRecordTypePolyBezier = 2;
pub const EmfRecordTypePolygon = 3;
pub const EmfRecordTypePolyline = 4;
pub const EmfRecordTypePolyBezierTo = 5;
pub const EmfRecordTypePolyLineTo = 6;
pub const EmfRecordTypePolyPolyline = 7;
pub const EmfRecordTypePolyPolygon = 8;
pub const EmfRecordTypeSetWindowExtEx = 9;
pub const EmfRecordTypeSetWindowOrgEx = 10;
pub const EmfRecordTypeSetViewportExtEx = 11;
pub const EmfRecordTypeSetViewportOrgEx = 12;
pub const EmfRecordTypeSetBrushOrgEx = 13;
pub const EmfRecordTypeEOF = 14;
pub const EmfRecordTypeSetPixelV = 15;
pub const EmfRecordTypeSetMapperFlags = 16;
pub const EmfRecordTypeSetMapMode = 17;
pub const EmfRecordTypeSetBkMode = 18;
pub const EmfRecordTypeSetPolyFillMode = 19;
pub const EmfRecordTypeSetROP2 = 20;
pub const EmfRecordTypeSetStretchBltMode = 21;
pub const EmfRecordTypeSetTextAlign = 22;
pub const EmfRecordTypeSetColorAdjustment = 23;
pub const EmfRecordTypeSetTextColor = 24;
pub const EmfRecordTypeSetBkColor = 25;
pub const EmfRecordTypeOffsetClipRgn = 26;
pub const EmfRecordTypeMoveToEx = 27;
pub const EmfRecordTypeSetMetaRgn = 28;
pub const EmfRecordTypeExcludeClipRect = 29;
pub const EmfRecordTypeIntersectClipRect = 30;
pub const EmfRecordTypeScaleViewportExtEx = 31;
pub const EmfRecordTypeScaleWindowExtEx = 32;
pub const EmfRecordTypeSaveDC = 33;
pub const EmfRecordTypeRestoreDC = 34;
pub const EmfRecordTypeSetWorldTransform = 35;
pub const EmfRecordTypeModifyWorldTransform = 36;
pub const EmfRecordTypeSelectObject = 37;
pub const EmfRecordTypeCreatePen = 38;
pub const EmfRecordTypeCreateBrushIndirect = 39;
pub const EmfRecordTypeDeleteObject = 40;
pub const EmfRecordTypeAngleArc = 41;
pub const EmfRecordTypeEllipse = 42;
pub const EmfRecordTypeRectangle = 43;
pub const EmfRecordTypeRoundRect = 44;
pub const EmfRecordTypeArc = 45;
pub const EmfRecordTypeChord = 46;
pub const EmfRecordTypePie = 47;
pub const EmfRecordTypeSelectPalette = 48;
pub const EmfRecordTypeCreatePalette = 49;
pub const EmfRecordTypeSetPaletteEntries = 50;
pub const EmfRecordTypeResizePalette = 51;
pub const EmfRecordTypeRealizePalette = 52;
pub const EmfRecordTypeExtFloodFill = 53;
pub const EmfRecordTypeLineTo = 54;
pub const EmfRecordTypeArcTo = 55;
pub const EmfRecordTypePolyDraw = 56;
pub const EmfRecordTypeSetArcDirection = 57;
pub const EmfRecordTypeSetMiterLimit = 58;
pub const EmfRecordTypeBeginPath = 59;
pub const EmfRecordTypeEndPath = 60;
pub const EmfRecordTypeCloseFigure = 61;
pub const EmfRecordTypeFillPath = 62;
pub const EmfRecordTypeStrokeAndFillPath = 63;
pub const EmfRecordTypeStrokePath = 64;
pub const EmfRecordTypeFlattenPath = 65;
pub const EmfRecordTypeWidenPath = 66;
pub const EmfRecordTypeSelectClipPath = 67;
pub const EmfRecordTypeAbortPath = 68;
pub const EmfRecordTypeReserved_069 = 69;
pub const EmfRecordTypeGdiComment = 70;
pub const EmfRecordTypeFillRgn = 71;
pub const EmfRecordTypeFrameRgn = 72;
pub const EmfRecordTypeInvertRgn = 73;
pub const EmfRecordTypePaintRgn = 74;
pub const EmfRecordTypeExtSelectClipRgn = 75;
pub const EmfRecordTypeBitBlt = 76;
pub const EmfRecordTypeStretchBlt = 77;
pub const EmfRecordTypeMaskBlt = 78;
pub const EmfRecordTypePlgBlt = 79;
pub const EmfRecordTypeSetDIBitsToDevice = 80;
pub const EmfRecordTypeStretchDIBits = 81;
pub const EmfRecordTypeExtCreateFontIndirect = 82;
pub const EmfRecordTypeExtTextOutA = 83;
pub const EmfRecordTypeExtTextOutW = 84;
pub const EmfRecordTypePolyBezier16 = 85;
pub const EmfRecordTypePolygon16 = 86;
pub const EmfRecordTypePolyline16 = 87;
pub const EmfRecordTypePolyBezierTo16 = 88;
pub const EmfRecordTypePolylineTo16 = 89;
pub const EmfRecordTypePolyPolyline16 = 90;
pub const EmfRecordTypePolyPolygon16 = 91;
pub const EmfRecordTypePolyDraw16 = 92;
pub const EmfRecordTypeCreateMonoBrush = 93;
pub const EmfRecordTypeCreateDIBPatternBrushPt = 94;
pub const EmfRecordTypeExtCreatePen = 95;
pub const EmfRecordTypePolyTextOutA = 96;
pub const EmfRecordTypePolyTextOutW = 97;
pub const EmfRecordTypeSetICMMode = 98;
pub const EmfRecordTypeCreateColorSpace = 99;
pub const EmfRecordTypeSetColorSpace = 100;
pub const EmfRecordTypeDeleteColorSpace = 101;
pub const EmfRecordTypeGLSRecord = 102;
pub const EmfRecordTypeGLSBoundedRecord = 103;
pub const EmfRecordTypePixelFormat = 104;
pub const EmfRecordTypeDrawEscape = 105;
pub const EmfRecordTypeExtEscape = 106;
pub const EmfRecordTypeStartDoc = 107;
pub const EmfRecordTypeSmallTextOut = 108;
pub const EmfRecordTypeForceUFIMapping = 109;
pub const EmfRecordTypeNamedEscape = 110;
pub const EmfRecordTypeColorCorrectPalette = 111;
pub const EmfRecordTypeSetICMProfileA = 112;
pub const EmfRecordTypeSetICMProfileW = 113;
pub const EmfRecordTypeAlphaBlend = 114;
pub const EmfRecordTypeSetLayout = 115;
pub const EmfRecordTypeTransparentBlt = 116;
pub const EmfRecordTypeReserved_117 = 117;
pub const EmfRecordTypeGradientFill = 118;
pub const EmfRecordTypeSetLinkedUFIs = 119;
pub const EmfRecordTypeSetTextJustification = 120;
pub const EmfRecordTypeColorMatchToTargetW = 121;
pub const EmfRecordTypeCreateColorSpaceW = 122;
pub const EmfRecordTypeMax = 122;
pub const EmfRecordTypeMin = 1;
pub const EmfPlusRecordTypeInvalid = 16384;
pub const EmfPlusRecordTypeHeader = 16385;
pub const EmfPlusRecordTypeEndOfFile = 16386;
pub const EmfPlusRecordTypeComment = 16387;
pub const EmfPlusRecordTypeGetDC = 16388;
pub const EmfPlusRecordTypeMultiFormatStart = 16389;
pub const EmfPlusRecordTypeMultiFormatSection = 16390;
pub const EmfPlusRecordTypeMultiFormatEnd = 16391;
pub const EmfPlusRecordTypeObject = 16392;
pub const EmfPlusRecordTypeClear = 16393;
pub const EmfPlusRecordTypeFillRects = 16394;
pub const EmfPlusRecordTypeDrawRects = 16395;
pub const EmfPlusRecordTypeFillPolygon = 16396;
pub const EmfPlusRecordTypeDrawLines = 16397;
pub const EmfPlusRecordTypeFillEllipse = 16398;
pub const EmfPlusRecordTypeDrawEllipse = 16399;
pub const EmfPlusRecordTypeFillPie = 16400;
pub const EmfPlusRecordTypeDrawPie = 16401;
pub const EmfPlusRecordTypeDrawArc = 16402;
pub const EmfPlusRecordTypeFillRegion = 16403;
pub const EmfPlusRecordTypeFillPath = 16404;
pub const EmfPlusRecordTypeDrawPath = 16405;
pub const EmfPlusRecordTypeFillClosedCurve = 16406;
pub const EmfPlusRecordTypeDrawClosedCurve = 16407;
pub const EmfPlusRecordTypeDrawCurve = 16408;
pub const EmfPlusRecordTypeDrawBeziers = 16409;
pub const EmfPlusRecordTypeDrawImage = 16410;
pub const EmfPlusRecordTypeDrawImagePoints = 16411;
pub const EmfPlusRecordTypeDrawString = 16412;
pub const EmfPlusRecordTypeSetRenderingOrigin = 16413;
pub const EmfPlusRecordTypeSetAntiAliasMode = 16414;
pub const EmfPlusRecordTypeSetTextRenderingHint = 16415;
pub const EmfPlusRecordTypeSetTextContrast = 16416;
pub const EmfPlusRecordTypeSetInterpolationMode = 16417;
pub const EmfPlusRecordTypeSetPixelOffsetMode = 16418;
pub const EmfPlusRecordTypeSetCompositingMode = 16419;
pub const EmfPlusRecordTypeSetCompositingQuality = 16420;
pub const EmfPlusRecordTypeSave = 16421;
pub const EmfPlusRecordTypeRestore = 16422;
pub const EmfPlusRecordTypeBeginContainer = 16423;
pub const EmfPlusRecordTypeBeginContainerNoParams = 16424;
pub const EmfPlusRecordTypeEndContainer = 16425;
pub const EmfPlusRecordTypeSetWorldTransform = 16426;
pub const EmfPlusRecordTypeResetWorldTransform = 16427;
pub const EmfPlusRecordTypeMultiplyWorldTransform = 16428;
pub const EmfPlusRecordTypeTranslateWorldTransform = 16429;
pub const EmfPlusRecordTypeScaleWorldTransform = 16430;
pub const EmfPlusRecordTypeRotateWorldTransform = 16431;
pub const EmfPlusRecordTypeSetPageTransform = 16432;
pub const EmfPlusRecordTypeResetClip = 16433;
pub const EmfPlusRecordTypeSetClipRect = 16434;
pub const EmfPlusRecordTypeSetClipPath = 16435;
pub const EmfPlusRecordTypeSetClipRegion = 16436;
pub const EmfPlusRecordTypeOffsetClip = 16437;
pub const EmfPlusRecordTypeDrawDriverString = 16438;
pub const EmfPlusRecordTypeStrokeFillPath = 16439;
pub const EmfPlusRecordTypeSerializableObject = 16440;
pub const EmfPlusRecordTypeSetTSGraphics = 16441;
pub const EmfPlusRecordTypeSetTSClip = 16442;
pub const EmfPlusRecordTotal = 16443;
pub const EmfPlusRecordTypeMax = 16442;
pub const EmfPlusRecordTypeMin = 16385;
pub const StringFormatFlagsDirectionRightToLeft = 1;
pub const StringFormatFlagsDirectionVertical = 2;
pub const StringFormatFlagsNoFitBlackBox = 4;
pub const StringFormatFlagsDisplayFormatControl = 32;
pub const StringFormatFlagsNoFontFallback = 1024;
pub const StringFormatFlagsMeasureTrailingSpaces = 2048;
pub const StringFormatFlagsNoWrap = 4096;
pub const StringFormatFlagsLineLimit = 8192;
pub const StringFormatFlagsNoClip = 16384;
pub const StringFormatFlagsBypassGDI = -2147483648;
pub const StringTrimmingNone = 0;
pub const StringTrimmingCharacter = 1;
pub const StringTrimmingWord = 2;
pub const StringTrimmingEllipsisCharacter = 3;
pub const StringTrimmingEllipsisWord = 4;
pub const StringTrimmingEllipsisPath = 5;
pub const StringDigitSubstituteUser = 0;
pub const StringDigitSubstituteNone = 1;
pub const StringDigitSubstituteNational = 2;
pub const StringDigitSubstituteTraditional = 3;
pub const HotkeyPrefixNone = 0;
pub const HotkeyPrefixShow = 1;
pub const HotkeyPrefixHide = 2;
pub const StringAlignmentNear = 0;
pub const StringAlignmentCenter = 1;
pub const StringAlignmentFar = 2;
pub const DriverStringOptionsCmapLookup = 1;
pub const DriverStringOptionsVertical = 2;
pub const DriverStringOptionsRealizedAdvance = 4;
pub const DriverStringOptionsLimitSubpixel = 8;
pub const FlushIntentionFlush = 0;
pub const FlushIntentionSync = 1;
pub const EncoderParameterValueTypeByte = 1;
pub const EncoderParameterValueTypeASCII = 2;
pub const EncoderParameterValueTypeShort = 3;
pub const EncoderParameterValueTypeLong = 4;
pub const EncoderParameterValueTypeRational = 5;
pub const EncoderParameterValueTypeLongRange = 6;
pub const EncoderParameterValueTypeUndefined = 7;
pub const EncoderParameterValueTypeRationalRange = 8;
pub const EncoderParameterValueTypePointer = 9;
pub const EncoderValueColorTypeCMYK = 0;
pub const EncoderValueColorTypeYCCK = 1;
pub const EncoderValueCompressionLZW = 2;
pub const EncoderValueCompressionCCITT3 = 3;
pub const EncoderValueCompressionCCITT4 = 4;
pub const EncoderValueCompressionRle = 5;
pub const EncoderValueCompressionNone = 6;
pub const EncoderValueScanMethodInterlaced = 7;
pub const EncoderValueScanMethodNonInterlaced = 8;
pub const EncoderValueVersionGif87 = 9;
pub const EncoderValueVersionGif89 = 10;
pub const EncoderValueRenderProgressive = 11;
pub const EncoderValueRenderNonProgressive = 12;
pub const EncoderValueTransformRotate90 = 13;
pub const EncoderValueTransformRotate180 = 14;
pub const EncoderValueTransformRotate270 = 15;
pub const EncoderValueTransformFlipHorizontal = 16;
pub const EncoderValueTransformFlipVertical = 17;
pub const EncoderValueMultiFrame = 18;
pub const EncoderValueLastFrame = 19;
pub const EncoderValueFlush = 20;
pub const EncoderValueFrameDimensionTime = 21;
pub const EncoderValueFrameDimensionResolution = 22;
pub const EncoderValueFrameDimensionPage = 23;
pub const EncoderValueColorTypeGray = 24;
pub const EncoderValueColorTypeRGB = 25;
pub const EmfToWmfBitsFlagsDefault = 0;
pub const EmfToWmfBitsFlagsEmbedEmf = 1;
pub const EmfToWmfBitsFlagsIncludePlaceable = 2;
pub const EmfToWmfBitsFlagsNoXORClip = 4;
pub const ConvertToEmfPlusFlagsDefault = 0;
pub const ConvertToEmfPlusFlagsRopUsed = 1;
pub const ConvertToEmfPlusFlagsText = 2;
pub const ConvertToEmfPlusFlagsInvalidRecord = 4;
pub const TestControlForceBilinear = 0;
pub const TestControlNoICM = 1;
pub const TestControlGetBuildNumber = 2;
pub const Ok = 0;
pub const GenericError = 1;
pub const InvalidParameter = 2;
pub const OutOfMemory = 3;
pub const ObjectBusy = 4;
pub const InsufficientBuffer = 5;
pub const NotImplemented = 6;
pub const Win32Error = 7;
pub const WrongState = 8;
pub const Aborted = 9;
pub const FileNotFound = 10;
pub const ValueOverflow = 11;
pub const AccessDenied = 12;
pub const UnknownImageFormat = 13;
pub const FontFamilyNotFound = 14;
pub const FontStyleNotFound = 15;
pub const NotTrueTypeFont = 16;
pub const UnsupportedGdiplusVersion = 17;
pub const GdiplusNotInitialized = 18;
pub const PropertyNotFound = 19;
pub const PropertyNotSupported = 20;
pub const ProfileNotFound = 21;
pub const DebugEventLevelFatal = 0;
pub const DebugEventLevelWarning = 1;
pub const V2 = 2;
pub const V3 = 3;
pub const GdiplusStartupDefault = 0;
pub const GdiplusStartupNoSetRound = 1;
pub const GdiplusStartupSetPSValue = 2;
pub const GdiplusStartupReserved0 = 4;
pub const GdiplusStartupReserved1 = 8;
pub const GdiplusStartupReserved2 = 16;
pub const GdiplusStartupTransparencyMask = -16777216;
pub const PaletteTypeCustom = 0;
pub const PaletteTypeOptimal = 1;
pub const PaletteTypeFixedBW = 2;
pub const PaletteTypeFixedHalftone8 = 3;
pub const PaletteTypeFixedHalftone27 = 4;
pub const PaletteTypeFixedHalftone64 = 5;
pub const PaletteTypeFixedHalftone125 = 6;
pub const PaletteTypeFixedHalftone216 = 7;
pub const PaletteTypeFixedHalftone252 = 8;
pub const PaletteTypeFixedHalftone256 = 9;
pub const DitherTypeNone = 0;
pub const DitherTypeSolid = 1;
pub const DitherTypeOrdered4x4 = 2;
pub const DitherTypeOrdered8x8 = 3;
pub const DitherTypeOrdered16x16 = 4;
pub const DitherTypeSpiral4x4 = 5;
pub const DitherTypeSpiral8x8 = 6;
pub const DitherTypeDualSpiral4x4 = 7;
pub const DitherTypeDualSpiral8x8 = 8;
pub const DitherTypeErrorDiffusion = 9;
pub const DitherTypeMax = 10;
pub const PaletteFlagsHasAlpha = 1;
pub const PaletteFlagsGrayScale = 2;
pub const PaletteFlagsHalftone = 4;
pub const ColorModeARGB32 = 0;
pub const ColorModeARGB64 = 1;
pub const ColorChannelFlagsC = 0;
pub const ColorChannelFlagsM = 1;
pub const ColorChannelFlagsY = 2;
pub const ColorChannelFlagsK = 3;
pub const ColorChannelFlagsLast = 4;
pub const AliceBlue = -984833;
pub const AntiqueWhite = -332841;
pub const Aqua = -16711681;
pub const Aquamarine = -8388652;
pub const Azure = -983041;
pub const Beige = -657956;
pub const Bisque = -6972;
pub const Black = -16777216;
pub const BlanchedAlmond = -5171;
pub const Blue = -16776961;
pub const BlueViolet = -7722014;
pub const Brown = -5952982;
pub const BurlyWood = -2180985;
pub const CadetBlue = -10510688;
pub const Chartreuse = -8388864;
pub const Chocolate = -2987746;
pub const Coral = -32944;
pub const CornflowerBlue = -10185235;
pub const Cornsilk = -1828;
pub const Crimson = -2354116;
pub const Cyan = -16711681;
pub const DarkBlue = -16777077;
pub const DarkCyan = -16741493;
pub const DarkGoldenrod = -4684277;
pub const DarkGray = -5658199;
pub const DarkGreen = -16751616;
pub const DarkKhaki = -4343957;
pub const DarkMagenta = -7667573;
pub const DarkOliveGreen = -11179217;
pub const DarkOrange = -29696;
pub const DarkOrchid = -6737204;
pub const DarkRed = -7667712;
pub const DarkSalmon = -1468806;
pub const DarkSeaGreen = -7357301;
pub const DarkSlateBlue = -12042869;
pub const DarkSlateGray = -13676721;
pub const DarkTurquoise = -16724271;
pub const DarkViolet = -7077677;
pub const DeepPink = -60269;
pub const DeepSkyBlue = -16728065;
pub const DimGray = -9868951;
pub const DodgerBlue = -14774017;
pub const Firebrick = -5103070;
pub const FloralWhite = -1296;
pub const ForestGreen = -14513374;
pub const Fuchsia = -65281;
pub const Gainsboro = -2302756;
pub const GhostWhite = -460545;
pub const Gold = -10496;
pub const Goldenrod = -2448096;
pub const Gray = -8355712;
pub const Green = -16744448;
pub const GreenYellow = -5374161;
pub const Honeydew = -983056;
pub const HotPink = -38476;
pub const IndianRed = -3318692;
pub const Indigo = -11861886;
pub const Ivory = -16;
pub const Khaki = -989556;
pub const Lavender = -1644806;
pub const LavenderBlush = -3851;
pub const LawnGreen = -8586240;
pub const LemonChiffon = -1331;
pub const LightBlue = -5383962;
pub const LightCoral = -1015680;
pub const LightCyan = -2031617;
pub const LightGoldenrodYellow = -329006;
pub const LightGray = -2894893;
pub const LightGreen = -7278960;
pub const LightPink = -18751;
pub const LightSalmon = -24454;
pub const LightSeaGreen = -14634326;
pub const LightSkyBlue = -7876870;
pub const LightSlateGray = -8943463;
pub const LightSteelBlue = -5192482;
pub const LightYellow = -32;
pub const Lime = -16711936;
pub const LimeGreen = -13447886;
pub const Linen = -331546;
pub const Magenta = -65281;
pub const Maroon = -8388608;
pub const MediumAquamarine = -10039894;
pub const MediumBlue = -16777011;
pub const MediumOrchid = -4565549;
pub const MediumPurple = -7114533;
pub const MediumSeaGreen = -12799119;
pub const MediumSlateBlue = -8689426;
pub const MediumSpringGreen = -16713062;
pub const MediumTurquoise = -12004916;
pub const MediumVioletRed = -3730043;
pub const MidnightBlue = -15132304;
pub const MintCream = -655366;
pub const MistyRose = -6943;
pub const Moccasin = -6987;
pub const NavajoWhite = -8531;
pub const Navy = -16777088;
pub const OldLace = -133658;
pub const Olive = -8355840;
pub const OliveDrab = -9728477;
pub const Orange = -23296;
pub const OrangeRed = -47872;
pub const Orchid = -2461482;
pub const PaleGoldenrod = -1120086;
pub const PaleGreen = -6751336;
pub const PaleTurquoise = -5247250;
pub const PaleVioletRed = -2396013;
pub const PapayaWhip = -4139;
pub const PeachPuff = -9543;
pub const Peru = -3308225;
pub const Pink = -16181;
pub const Plum = -2252579;
pub const PowderBlue = -5185306;
pub const Purple = -8388480;
pub const Red = -65536;
pub const RosyBrown = -4419697;
pub const RoyalBlue = -12490271;
pub const SaddleBrown = -7650029;
pub const Salmon = -360334;
pub const SandyBrown = -744352;
pub const SeaGreen = -13726889;
pub const SeaShell = -2578;
pub const Sienna = -6270419;
pub const Silver = -4144960;
pub const SkyBlue = -7876885;
pub const SlateBlue = -9807155;
pub const SlateGray = -9404272;
pub const Snow = -1286;
pub const SpringGreen = -16711809;
pub const SteelBlue = -12156236;
pub const Tan = -2968436;
pub const Teal = -16744320;
pub const Thistle = -2572328;
pub const Tomato = -40121;
pub const Transparent = 16777215;
pub const Turquoise = -12525360;
pub const Violet = -1146130;
pub const Wheat = -663885;
pub const White = -1;
pub const WhiteSmoke = -657931;
pub const Yellow = -256;
pub const YellowGreen = -6632142;
pub const AlphaShift = 24;
pub const RedShift = 16;
pub const GreenShift = 8;
pub const BlueShift = 0;
pub const AlphaMask = -16777216;
pub const RedMask = 16711680;
pub const GreenMask = 65280;
pub const BlueMask = 255;
pub const ImageCodecFlagsEncoder = 1;
pub const ImageCodecFlagsDecoder = 2;
pub const ImageCodecFlagsSupportBitmap = 4;
pub const ImageCodecFlagsSupportVector = 8;
pub const ImageCodecFlagsSeekableEncode = 16;
pub const ImageCodecFlagsBlockingDecode = 32;
pub const ImageCodecFlagsBuiltin = 65536;
pub const ImageCodecFlagsSystem = 131072;
pub const ImageCodecFlagsUser = 262144;
pub const ImageLockModeRead = 1;
pub const ImageLockModeWrite = 2;
pub const ImageLockModeUserInputBuf = 4;
pub const ImageFlagsNone = 0;
pub const ImageFlagsScalable = 1;
pub const ImageFlagsHasAlpha = 2;
pub const ImageFlagsHasTranslucent = 4;
pub const ImageFlagsPartiallyScalable = 8;
pub const ImageFlagsColorSpaceRGB = 16;
pub const ImageFlagsColorSpaceCMYK = 32;
pub const ImageFlagsColorSpaceGRAY = 64;
pub const ImageFlagsColorSpaceYCBCR = 128;
pub const ImageFlagsColorSpaceYCCK = 256;
pub const ImageFlagsHasRealDPI = 4096;
pub const ImageFlagsHasRealPixelSize = 8192;
pub const ImageFlagsReadOnly = 65536;
pub const ImageFlagsCaching = 131072;
pub const RotateNoneFlipNone = 0;
pub const Rotate90FlipNone = 1;
pub const Rotate180FlipNone = 2;
pub const Rotate270FlipNone = 3;
pub const RotateNoneFlipX = 4;
pub const Rotate90FlipX = 5;
pub const Rotate180FlipX = 6;
pub const Rotate270FlipX = 7;
pub const RotateNoneFlipY = 6;
pub const Rotate90FlipY = 7;
pub const Rotate180FlipY = 4;
pub const Rotate270FlipY = 5;
pub const RotateNoneFlipXY = 2;
pub const Rotate90FlipXY = 3;
pub const Rotate180FlipXY = 0;
pub const Rotate270FlipXY = 1;
pub const ItemDataPositionAfterHeader = 0;
pub const ItemDataPositionAfterPalette = 1;
pub const ItemDataPositionAfterBits = 2;
pub const HistogramFormatARGB = 0;
pub const HistogramFormatPARGB = 1;
pub const HistogramFormatRGB = 2;
pub const HistogramFormatGray = 3;
pub const HistogramFormatB = 4;
pub const HistogramFormatG = 5;
pub const HistogramFormatR = 6;
pub const HistogramFormatA = 7;
pub const ColorMatrixFlagsDefault = 0;
pub const ColorMatrixFlagsSkipGrays = 1;
pub const ColorMatrixFlagsAltGray = 2;
pub const ColorAdjustTypeDefault = 0;
pub const ColorAdjustTypeBitmap = 1;
pub const ColorAdjustTypeBrush = 2;
pub const ColorAdjustTypePen = 3;
pub const ColorAdjustTypeText = 4;
pub const ColorAdjustTypeCount = 5;
pub const ColorAdjustTypeAny = 6;
pub const AdjustExposure = 0;
pub const AdjustDensity = 1;
pub const AdjustContrast = 2;
pub const AdjustHighlight = 3;
pub const AdjustShadow = 4;
pub const AdjustMidtone = 5;
pub const AdjustWhiteSaturation = 6;
pub const AdjustBlackSaturation = 7;
pub const CurveChannelAll = 0;
pub const CurveChannelRed = 1;
pub const CurveChannelGreen = 2;
pub const CurveChannelBlue = 3;

pub const aliases = struct {
    pub const FillMode = i32;
    pub const QualityMode = i32;
    pub const CompositingMode = i32;
    pub const CompositingQuality = i32;
    pub const Unit = i32;
    pub const MetafileFrameUnit = i32;
    pub const CoordinateSpace = i32;
    pub const WrapMode = i32;
    pub const HatchStyle = i32;
    pub const DashStyle = i32;
    pub const DashCap = i32;
    pub const LineCap = i32;
    pub const CustomLineCapType = i32;
    pub const LineJoin = i32;
    pub const PathPointType = i32;
    pub const WarpMode = i32;
    pub const LinearGradientMode = i32;
    pub const CombineMode = i32;
    pub const ImageType = i32;
    pub const InterpolationMode = i32;
    pub const PenAlignment = i32;
    pub const BrushType = i32;
    pub const PenType = i32;
    pub const MatrixOrder = i32;
    pub const GenericFontFamily = i32;
    pub const FontStyle = i32;
    pub const SmoothingMode = i32;
    pub const PixelOffsetMode = i32;
    pub const TextRenderingHint = i32;
    pub const MetafileType = i32;
    pub const EmfType = i32;
    pub const ObjectType = i32;
    pub const EmfPlusRecordType = i32;
    pub const StringFormatFlags = i32;
    pub const StringTrimming = i32;
    pub const StringDigitSubstitute = i32;
    pub const HotkeyPrefix = i32;
    pub const StringAlignment = i32;
    pub const DriverStringOptions = i32;
    pub const FlushIntention = i32;
    pub const EncoderParameterValueType = i32;
    pub const EncoderValue = i32;
    pub const EmfToWmfBitsFlags = i32;
    pub const ConvertToEmfPlusFlags = i32;
    pub const GpTestControlEnum = i32;
    pub const Status = i32;
    pub const DebugEventLevel = i32;
    pub const Version = u32;
    pub const GdiplusStartupParams = i32;
    pub const PaletteType = i32;
    pub const DitherType = i32;
    pub const PaletteFlags = i32;
    pub const ColorMode = i32;
    pub const ColorChannelFlags = i32;
    pub const ImageCodecFlags = i32;
    pub const ImageLockMode = i32;
    pub const ImageFlags = i32;
    pub const RotateFlipType = i32;
    pub const ItemDataPosition = i32;
    pub const HistogramFormat = i32;
    pub const ColorMatrixFlags = i32;
    pub const ColorAdjustType = i32;
    pub const CurveAdjustments = i32;
    pub const CurveChannel = i32;
    pub const PathData = isize;
    pub const CGpEffect = isize;
    pub const Matrix = isize;
    pub const Font = isize;
    pub const FontCollection = isize;
    pub const InstalledFontCollection = isize;
    pub const PrivateFontCollection = isize;
    pub const Image = isize;
    pub const Bitmap = isize;
    pub const CustomLineCap = isize;
    pub const CachedBitmap = isize;
    pub const Metafile = isize;
    pub const FontFamily = isize;
    pub const Region = isize;
    pub const ImageAbort = ?*const anyopaque;
    pub const DrawImageAbort = ?*const anyopaque;
    pub const GetThumbnailImageAbort = ?*const anyopaque;
    pub const EnumerateMetafileProc = ?*const anyopaque;
    pub const DebugEventProc = ?*const anyopaque;
    pub const NotificationHookProc = ?*const anyopaque;
    pub const NotificationUnhookProc = ?*const anyopaque;
};
